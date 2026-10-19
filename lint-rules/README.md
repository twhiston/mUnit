# Lint rules

`munit lint` checks saved patcher files (`.maxpat`, `.maxhelp`, `.gendsp`,
`.rnbopat`) against rules written in JSON. This folder holds the two built-in
rule sets as files to copy from, and the JSON Schemas that give an editor
completion, hover help and validation for rule files and for
`munit-lint.json`:

| File | What it is |
| ---- | ---------- |
| `recommended.json` | The `mUnit:recommended` set: general patcher hygiene, used when a project has no config |
| `tests.json` | The `mUnit:tests` set: for patches that run under mUnit |
| `rule.schema.json` | The schema of a rule file; put `"$schema": "<path to this file>"` at the top of yours |
| `config.schema.json` | The schema of `munit-lint.json` |

A worked example with one rule of each kind, a script rule, a dirty patch and
a clean one is `examples/lintExample` in this package; its README walks
through writing a rule and adding the lint to CI. "Linting patchers" in the
mUnit README covers the command line and the config cascade.

## A rule file

A rule file holds one rule, a list of rules, or `{ "rules": [...] }`. Each
rule is an object:

```json
{
  "$schema": "../../../lint-rules/rule.schema.json",
  "id": "no-zl-reg",
  "kind": "forbid-object",
  "level": "block",
  "match": { "object": "zl.reg" },
  "message": "use [list.reg] instead of [zl.reg]",
  "fix": { "replace": { "object": "list.reg", "args": "keep" } }
}
```

Every rule has:

- `id`: unique within a config. Findings name it, and overrides and
  `munit-lint disable` comments refer to it.
- `kind`: what is checked, from the table below.
- `level`: `off`, `warn` or `block`. `block` is what fails CI: `munit lint`
  exits 1 on any blocking finding. Default `warn`.
- `message`: optional, replaces the kind's default message. Say what to do
  instead.
- `scope`: optional, which patchers the rule looks at. See below.

A config names the rule files it uses: `"rules": ["./lint-rules/*.json"]`,
relative to the config. Within one config or rule file an id may appear
once; an inner config's rule with an id already seen replaces the outer one.

## Kinds

| Kind | Settings | Checks |
| ---- | -------- | ------ |
| `forbid-object` | `match`, optional `fix.replace` | a matching box is not allowed |
| `forbid-path` | `from`, `to` (each a `match`), optional `unless` (a `match`), optional `fix.replace` | a path of cords from a `from` box reaches a `to` box without passing an `unless` box; the `from` box is reported, with the path |
| `require-attribute` | `match`, `attribute`, optional `fix.set` | the attribute is present, inline (`@autowatch 0`) or saved on the box |
| `attribute-value` | `match`, `attribute`, `value`, optional `fix: true` | the attribute has that value (`0`, `"0"` and `false` compare equal) |
| `max-instances` | `match`, `max`, optional `per` (`file` or `patcher`) | at most `max` matching boxes; `0` forbids them |
| `fanout-without-trigger` | optional `allow` (source object names) | one message outlet connected to several inlets, so the order depends on the layout; signal outlets are exempt |
| `overlapping-boxes` | optional `allow` (object names that may overlap, e.g. `panel`), optional `tolerance` (pixels of overlap ignored, default 0) | two boxes in a patcher overlap in patching view, so one hides the other; the box drawn on top is reported, and boxes with `@background 1` are exempt |
| `naming` | `target` (`varname`, `send`, `receive`, `send-receive`), `pattern` | the scripting name, or the send or receive name, matches the regular expression |
| `script` | `module` (a JS file relative to the rule file), optional `options` | whatever the module's `check(ctx)` reports |

## `match`

Which boxes a rule looks at. Every field given must match:

- `object`: the object name, or a list of names. Names are normalised like
  the box's own: `t`, `trigger`, `zl reg` and `zl.reg` all work. UI objects
  match by their class: `toggle`, `number`, `button`.
- `maxclass`: Max's class of the box: `newobj`, `message`, `comment`,
  `toggle`, ...
- `args`: positional argument patterns, matched from the first argument; `*`
  matches any one argument. `["*", "100"]` matches `[metro 1 100]` and
  `[metro 2 100]`.
- `text`: a regular expression over the whole box text, e.g. `"^print$"` for
  a `[print]` with no name.

## `forbid-path`

Some objects are fine on their own and only wrong in what they drive. A
`forbid-path` rule follows the cords out of every box matching `from`, through
every outlet and the objects in between, and reports the `from` box when a
path reaches a box matching `to`. A path stops at a box matching `unless`.
The finding ends with the shortest such path, e.g.
`([metro 50] → [t b b] → [jit.world foo])`, and a `fix.replace` rewrites the
`from` box. Cords are followed within one patcher; a path into a subpatcher
or through `[send]` is not.

`mUnit:recommended` uses it for Jitter: with Overdrive on, `[metro]` and the
other timing and MIDI objects output on the scheduler thread, and a
`[jit.world]`, `[jit.pworld]` or `[jit.gl.render]` banged from there creates
its GL context off the main thread, which macOS 26 kills Max for.
`gl-render-from-metro` fixes `[metro]` to `[qmetro]`, which always bangs on
the main thread. `gl-render-from-scheduler` covers the rest and has no fix:
put `[deferlow]` before the render.

```json
{
  "id": "gl-render-from-metro",
  "kind": "forbid-path",
  "from": { "object": "metro" },
  "to": { "object": ["jit.world", "jit.pworld", "jit.gl.render"] },
  "unless": { "object": ["defer", "deferlow", "qlim", "jit.qball", "qmetro"] },
  "fix": { "replace": { "object": "qmetro" } }
}
```

## `scope`

`scope.namespace` picks the patchers a rule looks at: `box` (an ordinary
patcher, the default), `dsp.gen` (`[gen~]` subpatchers and `.gendsp` files),
`jit.gen` (`[jit.gen]`, `[jit.pix]`, `[jit.gl.pix]`), `rnbo` (`[rnbo~]` and
`.rnbopat` files), or `*` for all of them. Nested patchers are walked, so a
rule scoped to `dsp.gen` finds `[zl reg]` inside a `[gen~]` inside a `[p]`,
and the finding reads `[p main] > [gen~] > [zl reg]`.

```json
{ "id": "no-zl-in-gen", "kind": "forbid-object", "match": { "object": "zl.reg" }, "scope": { "namespace": ["dsp.gen"] } }
```

## Levels, overrides and disabling

A rule's `level` is its default. A config's `overrides` change it per file:

```json
{
  "overrides": [
    { "files": ["tests/**"], "rules": { "fanout-without-trigger": "block" } },
    { "files": ["**/*.maxhelp"], "rules": { "no-zl-reg": "off" } }
  ]
}
```

`munit lint <file> --list-rules` shows the rules in force for a file after
every override, with the level and where each rule came from. It answers
"why isn't my rule firing" and "why is this blocking here".

To silence rules in one patcher, add a comment box reading
`munit-lint disable no-zl-reg other-rule`, or `munit-lint disable` for all
of them. It applies to that patcher, not to its subpatchers.

## Fixes

Four kinds can describe a fix, which `munit lint --fix` (or `fix` sent to
`[mUnit.lint]`) applies and writes back:

- `forbid-object` with `fix.replace`: the object is replaced in the box
  text. `args` says what happens to its arguments: `"keep"` (the default),
  `"drop"`, or a list of tokens where `"$1"`, `"$2"`, ... pick the original
  arguments by position, so `["$2", "$1"]` swaps two. `@attributes` in the
  text are kept.
- `forbid-path` with `fix.replace`: the same, on the box the path starts
  from.
- `require-attribute` with `fix.set`: the attribute is added with that value.
- `attribute-value` with `fix: true`: the attribute is set to `value`.

Attributes are written inline in an object box's text (`@autowatch 0`), or as
a box key for UI objects. Edits are made as splices into the saved file, so
the rest of it stays byte for byte as Max wrote it and a fix diffs as one line.

The contract for any fix, built in or from a script rule: lint, fix, lint
again reports nothing for that rule. After a fix the file is linted again, and
if that makes room for another fix it is applied too, up to five passes.

## Script rules

When the eight JSON kinds can't say it, a `script` rule runs a JavaScript
module:

```json
{ "id": "named-subpatchers", "kind": "script", "module": "./named-subpatchers.js", "options": { "objects": ["p"] } }
```

```js
/** @type {import("munit-lint").ScriptCheck} */
exports.check = (ctx) => {
  for (const patcher of ctx.patchers) {
    for (const box of patcher.boxes) {
      if (box.object === "p" && box.args.length === 0) {
        ctx.report({ box, message: "give [p] a name" });
      }
    }
  }
};
```

`ctx` holds the `document`, the `patchers` in the rule's scope, the rule's
`options`, `state`, and `report`. A finding with a `box` gets a location; one
with `edits` can be fixed. The module is CommonJS (`exports.check`), loaded
with `require` by `munit lint` and by `[mUnit.lint]` in Max alike, whose
server is a `node.script`. The reference is `api/munit-lint/README.md`,
and `api/munit-lint.d.ts` gives completion on `ctx` in an editor through
a `jsconfig.json` that includes the module (`examples/lintExample` has
one).

### Helpers on `ctx`

The questions rules ask most, answered without walking `lines` by hand:

| Helper | Answers |
| ------ | ------- |
| `ctx.connectionsFrom(box, outlet?)` | the cords leaving a box, each with its `destination` box and `inlet` |
| `ctx.connectionsTo(box, inlet?)` | the cords entering a box, each with its `source` box and `outlet` |
| `ctx.boxesByObject("zl reg")` | every box that is that object, name normalised like `match.object` |
| `ctx.sends()` | every `[send]`, `[s]`, `[send~]`, `[mc.send~]`, `[forward]`, plus `[value]`, `[pv]`, `[pvar]`, `[pattr]`, with the `name` |
| `ctx.receives()` | every `[receive]`, `[r]`, `[receive~]`, `[mc.receive~]`, plus the bound objects |
| `ctx.relatedFiles()` | the `.gendsp`, `.rnbopat` and bpatcher files the document refers to that exist next to it |

The same functions are exported by the typings (`connectionsFrom(patcher,
box)`, `sends(patchers)`, ...) for code that has a patcher in hand.

### `exports.meta`

```js
exports.meta = {
  description: "every send has a receive of the same name in the file",
  fixable: false,
  options: {
    type: "object",
    properties: { ignore: { type: "array", items: { type: "string" } } },
    additionalProperties: false,
  },
};
```

`options` is a JSON Schema for the rule's `options`. The loader checks the
JSON against it before any patch is linted, so a misspelt or mistyped option
is a config error (exit 2) that names the rule and the key, not a `TypeError`
inside `check`. The supported keywords: `type`, `enum`, `const`, `required`,
`properties`, `additionalProperties`, `items`, `minItems`, `maxItems`,
`minimum`, `maximum`, `minLength`, `maxLength`, `pattern`, `anyOf`, `oneOf`,
`allOf`, `not`. `description` shows in `--list-rules`.

### A rule that throws

A `check` that throws, returns something other than a list of findings, or
reports a finding without a `message` becomes one error naming the rule, the
module and the file, and the run exits 2. The other rules and the other files
are still linted; in Max it is one ERROR line in the console.

### `exports.project`: the whole project

`check` sees one file. A rule that needs them all (a `[receive]` with no
`[send]` anywhere in the folder) adds hooks around the file loop:

```js
exports.project = {
  begin: (ctx) => { ctx.state.sent = []; ctx.state.received = new Set(); },
  end: (ctx) => {
    for (const s of ctx.state.sent) {
      if (!ctx.state.received.has(s.name)) ctx.report({ file: s.file, box: s.box, message: `nothing receives "${s.name}"` });
    }
  },
};
exports.check = (ctx) => {
  for (const s of ctx.sends()) ctx.state.sent.push({ file: ctx.document.file, box: s.box, name: s.name });
  for (const r of ctx.receives()) ctx.state.received.add(r.name);
};
```

`begin` runs once with `ctx.files`, `check` runs per file collecting into
`ctx.state` (a fresh object per run), and `end` runs once and reports against
a `file` of the run; a finding for a file where the rule is off is dropped,
and the file's override level applies. This is the costly path: `[mUnit.lint]`
lints the whole folder again after every save when such a rule is active, so
keep `check` alone where it suffices.

### Sharing rules as a pack

A rule set is a JSON file plus modules next to it, which works inside one
repository. To share it, publish it as an npm package with a
`munit-rules.json` at its root (or a JSON `main`), whose `module` paths are
relative to it:

```
munit-rules-acme/
  package.json          { "name": "munit-rules-acme", "version": "1.0.0" }
  munit-rules.json      [ { "id": "acme/no-print", ... }, { "id": "acme/pairs", "kind": "script", "module": "./rules/pairs.js" } ]
  rules/pairs.js
```

A project installs it beside `munit-cli` and names it in its config:

```json
{ "rules": ["mUnit:recommended", "munit-rules-acme"] }
```

The name resolves from the config file's folder upwards, as `require`
would. A name that is also a file next to the config means the file.
CommonJS modules only.

### Testing rules

Without an npm project: `munit lint <patch> --rules my-rule.json
--format json` prints every finding as JSON, with the rule id, the location,
the box id and its position. From a test, the npm package's `munit-cli/test`
subpath lints files and returns the findings, nothing printed:

```js
const { lintFiles } = require("munit-cli/test");
const run = lintFiles(["fixtures/dirty.maxpat"], { rules: ["munit-rules.json"] });
assert.deepEqual(run.diagnostics.map((d) => d.rule), ["acme/pairs"]);
assert.deepEqual(run.errors, []);
```
