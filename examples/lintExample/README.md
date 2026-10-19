# Lint example

A small Max project with its lint rules, a test patch, and the npm scripts and
CI step that run both. Copy what you need.

| File | What it is |
| ---- | ---------- |
| `munit-lint.json` | The config: the `mUnit:tests` set plus every rule file in `lint-rules/`, and an override that makes fan-out a blocking finding under `tests/` |
| `lint-rules/*.json` | One rule of each kind: `forbid-object` (with a fix), `require-attribute`, `attribute-value`, `max-instances`, `fanout-without-trigger`, `naming`, and two `script` rules |
| `lint-rules/named-subpatchers.js` | The simplest script rule: a loop over the boxes; the folder's `jsconfig.json` makes `ctx.` complete in an editor |
| `lint-rules/send-receive-pairs.js` | A script rule using the helpers (`sends`, `receives`, `connectionsTo`), with `meta`: a description for `--list-rules` and a schema for its `options` |
| `lintMe.maxpat` | A patch every rule fires on, once |
| `clean.maxpat` | The same patch with every finding fixed |
| `tests/assertExample.maxpat` | A test patch, so `munit run` works on the folder too |
| `lintExample.maxpat` | `[mUnit.lint @folder .]`: lints every patch here as you save it, with the same config |
| `package.json` | The npm scripts: `lint`, `lint:fix`, `lint:ci`, `test` |

## Try it

From this folder, with the `munit` command (`npm install --save-dev munit-cli`,
or `node <Packages>/mUnit/javascript/nodejs/runner/munit-cli.js`):

```sh
munit lint .                      # 9 findings in lintMe.maxpat, 1 blocking: exit 1
munit lint . --fix                # fixes [zl reg], @autowatch and @embed, 6 findings left
munit lint lintMe.maxpat --list-rules    # the rules in force, with level and source
munit lint tests --list-rules     # fanout-without-trigger is "block" here: the override
munit run . --tests tests         # runs the test patch in Max (macOS)
```

What `munit lint .` reports:

```
lintMe.maxpat
  warn   coll-embed  [coll]: a [coll] in this project keeps its data in the patch: set @embed 1
  warn   fanout-without-trigger  [button]: outlet 0 of [button] fans out to 2 inlets; put a [trigger] between them so the order is explicit
  block  no-zl-reg  [zl reg]: use [list.reg] instead of [zl.reg]
  warn   one-metro  [metro 100]: one [metro] per patcher: drive everything from one clock
  warn   send-names  [s MyBadName]: send and receive names are lower_snake_case in this project
  warn   v8-autowatch  [v8]: say whether this script reloads when its file changes: @autowatch 0 for a shipped patch
  warn   named-subpatchers  [p]: give this [p] a name, e.g. [p input]
  warn   send-receive-pairs  [s MyBadName]: nothing in this patch receives "MyBadName"
  warn   send-receive-pairs  [s MyBadName]: nothing is connected to [s MyBadName], so it never sends
mUnit lint: 4 files, 1 blocking, 8 warnings
```

Findings come in rule order, and `./lint-rules/*.json` loads the files
alphabetically.

`clean.maxpat`, `tests/assertExample.maxpat` and `lintExample.maxpat` are
clean. The test in the mUnit repository that lints this folder expects
exactly these findings, so the example can't drift from the rules.

## Writing a rule

1. Pick a kind from `lint-rules/README.md` in the package and a level:
   `warn` to see it, `block` once the project is clean.
2. Write the JSON in a file under `lint-rules/`, starting with
   `"$schema": "<path to lint-rules/rule.schema.json>"` so your editor
   completes the fields and underlines a mistake.
3. Make a patch that should fail and one that should pass, and run the rule
   on them alone: `munit lint lintMe.maxpat --rules lint-rules/naming.json`.
4. Add the file to `munit-lint.json` (`"./lint-rules/*.json"` picks up every
   JSON file in the folder, so keep the folder to rule files).
5. Add an override for files held to a different standard, as this config
   does for `tests/**`, and check with `--list-rules` that it applies.
6. Add the CI step below.

A script rule is the same, with `"kind": "script"` and a `module`; see
`lint-rules/named-subpatchers.js` for the shape and
`lint-rules/send-receive-pairs.js` for the helpers and `meta`. `munit lint
<patch> --format json` prints every finding with its rule, box and position,
which is how to test a rule without a test framework; from a test,
`require("munit-cli/test").lintFiles(["lintMe.maxpat"])` returns the same
findings.

## Sharing the rules as a pack

To use these rules in other projects, publish `lint-rules/` as an npm package
with the rule files merged into one `munit-rules.json` at its root:

```
munit-rules-acme/
  package.json          { "name": "munit-rules-acme", "version": "1.0.0", "files": ["munit-rules.json", "rules/"] }
  munit-rules.json      { "rules": [ ...the rule objects, with "module": "./rules/send-receive-pairs.js" ] }
  rules/send-receive-pairs.js
  rules/named-subpatchers.js
```

A project then runs `npm install --save-dev munit-rules-acme` and lists it:
`"rules": ["mUnit:tests", "munit-rules-acme"]`. The pack's own tests use
`munit-cli/test`; see `lint-rules/README.md` in the mUnit package.

## In CI

The linter reads the `.maxpat` JSON and never starts Max, so it runs on any
runner. A blocking finding exits 1 and fails the job; `--format junit` makes
the findings show up as test results.

```yaml
# .github/workflows/lint.yml
name: Lint patchers
on: [push, pull_request]
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - run: npm ci
      - run: npm run lint:ci
      - uses: actions/upload-artifact@v4
        if: always()
        with:
          name: lint-report
          path: build/lint.xml
```

Running the tests needs a machine with Max: `npm test` on a macOS runner
with Max installed, or a self-hosted one.
