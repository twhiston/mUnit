# munit-lint

The API a `script` lint rule is written against: the patcher model, the
context the rule's `check` receives, and the findings and edits it reports.

A script rule is a JSON rule of kind `script` whose `module` names a
JavaScript file exporting `check(ctx)`. Nothing is required at runtime:
everything arrives through `ctx`. For completion and checking in an editor,
add the package's `api/munit-lint.d.ts` to a `jsconfig.json` next to
the module (as `examples/lintExample` does) and annotate it:

```js
/** @type {import("munit-lint").ScriptCheck} */
exports.check = (ctx) => {
  for (const patcher of ctx.patchers) {
    for (const box of patcher.boxes) {
      if (box.object === "print" && box.args.length === 0) {
        ctx.report({ box, message: "give [print] a name" });
      }
    }
  }
};
```

Script rules run wherever the lint runs: under `munit lint`, and inside
`[mUnit.lint]` in Max, whose server is a `node.script` and loads the module
the same way. The module is CommonJS (`exports.check`).

## Interfaces

| Interface | Description |
| ------ | ------ |
| [SetTextEdit](interfaces/SetTextEdit.md) | Replaces the text of an object, message or comment box. |
| [SetAttributeEdit](interfaces/SetAttributeEdit.md) | Sets an attribute: inline in an object box's text (`@autowatch 0`), or as a box key for UI objects. |
| [RemoveBoxEdit](interfaces/RemoveBoxEdit.md) | Removes a box and the cords connected to it. |
| [InsertBoxEdit](interfaces/InsertBoxEdit.md) | Adds a box, given as the JSON Max would save for it. |
| [Diagnostic](interfaces/Diagnostic.md) | One finding, as the reports and `lintFiles` carry it. |
| [Box](interfaces/Box.md) | One box in a patcher: an object, message, comment or UI object. |
| [Line](interfaces/Line.md) | A patch cord. |
| [Patcher](interfaces/Patcher.md) | A patcher: the root of a file, or one nested in a box. |
| [Connection](interfaces/Connection.md) | A patch cord with both ends resolved to their boxes, from [connectionsFrom](functions/connectionsFrom.md) and [connectionsTo](functions/connectionsTo.md). |
| [NamedBox](interfaces/NamedBox.md) | A box that sends or receives by name, from [sends](functions/sends.md) and [receives](functions/receives.md). |
| [PatcherDocument](interfaces/PatcherDocument.md) | A patcher file: `.maxpat`, `.maxhelp`, `.gendsp` or `.rnbopat`. |
| [Visit](interfaces/Visit.md) | One box and the patcher it sits in, from [walkBoxes](functions/walkBoxes.md). |
| [LintRun](interfaces/LintRun.md) | What a lint run produced: the result of `munit lint`, and what `lintFiles` returns. |
| [RuleListing](interfaces/RuleListing.md) | One rule as it applies to a file: its level after overrides, and where it came from. |
| [FileRules](interfaces/FileRules.md) | The rules in force for one file, from `--list-rules`. |
| [RuleScope](interfaces/RuleScope.md) | Which patchers in a file a rule looks at. |
| [RuleBase](interfaces/RuleBase.md) | The settings every rule has, whatever its kind. |
| [ScriptFinding](interfaces/ScriptFinding.md) | One thing a script rule found. Give it a `box` so the finding has a location (the box's patcher is found for you); a finding without one is reported against the patcher, or the file's root patcher. |
| [ScriptContext](interfaces/ScriptContext.md) | What a script rule's `check` receives. A rule reports with [ScriptContext.report](interfaces/ScriptContext.md#report) or by returning findings, or both. The helpers answer the questions rules ask most: what a box is connected to, which boxes are a given object, and who sends and receives by name. |
| [ScriptMeta](interfaces/ScriptMeta.md) | What `exports.meta` of a script rule's module may declare. |
| [ProjectContext](interfaces/ProjectContext.md) | What `begin` and `end` of [ProjectHooks](interfaces/ProjectHooks.md) receive. |
| [ProjectFinding](interfaces/ProjectFinding.md) | A finding reported from `end`, against one of the run's files. |
| [ProjectEndContext](interfaces/ProjectEndContext.md) | What `end` receives: the project context plus a way to report. |
| [ProjectHooks](interfaces/ProjectHooks.md) | Optional `exports.project` of a script rule's module, for rules that need the whole project rather than one file: `begin` runs once before the files are linted, `check` runs per file and may collect into `ctx.state`, and `end` runs once after, reporting findings against files. Costlier than `check` alone: in Max, a save then lints the whole folder again. |
| [ScriptModule](interfaces/ScriptModule.md) | The shape of a script rule's module: `check` is required, `meta` and `project` are optional. |
| [ScriptRule](interfaces/ScriptRule.md) | A rule of kind `script`: a JavaScript (CommonJS) module decides what to report, under `munit lint` and in `[mUnit.lint]` alike. |
| [JsonSchema](interfaces/JsonSchema.md) | A JSON Schema fragment, as far as [validateAgainstSchema](functions/validateAgainstSchema.md) reads it. |

## Type Aliases

| Type Alias | Description |
| ------ | ------ |
| [Level](type-aliases/Level.md) | A rule's level: `off` (not run), `warn` (reported) or `block` (reported, and `munit lint` exits 1). |
| [ReportedLevel](type-aliases/ReportedLevel.md) | A level a finding can have: `warn` or `block`. |
| [Edit](type-aliases/Edit.md) | A change to the patcher file that `--fix` (or `fix` sent to `[mUnit.lint]`) applies. Applying edits and writing the file back in Max's own formatting is the fixer's job; a rule only describes them. |
| [Namespace](type-aliases/Namespace.md) | What kind of patcher: `box` for an ordinary Max patcher, `dsp.gen` inside `[gen~]` and `.gendsp` files, `jit.gen` inside `[jit.gen]`, `[jit.pix]` and `[jit.gl.pix]`, `rnbo` inside `[rnbo~]` and `.rnbopat` files. Max's `classnamespace`, so other values are possible. |
| [RuleKind](type-aliases/RuleKind.md) | The kinds of rule: what `kind` in a rule's JSON may be. |
| [RuleState](type-aliases/RuleState.md) | State a script rule keeps for one run: a fresh object per `munit lint`, shared by `begin`, every `check` and `end`. |
| [ScriptCheck](type-aliases/ScriptCheck.md) | The function a script rule's module exports as `check`. It may return its findings, report them through the context, or both. |

## Functions

| Function | Description |
| ------ | ------ |
| [normaliseObjectName](functions/normaliseObjectName.md) | The object name a box's text tokens denote, as [Box.object](interfaces/Box.md#object) holds it: aliases resolved (`t` is `trigger`, `s` is `send`), and a mode argument of `zl` and `mc` folded into a dotted name (`zl reg` is `zl.reg`). Use it to compare a name a rule's options give with `box.object`. Null for no tokens. |
| [walkBoxes](functions/walkBoxes.md) | Every box in a patcher and its nested patchers, depth first, with the patcher it sits in. |
| [walkPatchers](functions/walkPatchers.md) | A patcher and every patcher nested in it, depth first, the given one first. |
| [findBox](functions/findBox.md) | The box with that id in the patcher (not its nested patchers), or undefined. |
| [connectionsFrom](functions/connectionsFrom.md) | The cords leaving a box, in saved order: every outlet, or one outlet when `outlet` is given. Cords stay inside a patcher, so `patcher` is the one the box sits in; a box from another patcher has no connections there. |
| [connectionsTo](functions/connectionsTo.md) | The cords entering a box, in saved order: every inlet, or one inlet when `inlet` is given. |
| [boxesByObject](functions/boxesByObject.md) | Every box that is the object `name` in the given patchers, with its patcher. The name is normalised like [Box.object](interfaces/Box.md#object): `t`, `trigger`, `zl reg` and `zl.reg` all work, and UI objects match by class (`toggle`). |
| [sends](functions/sends.md) | Every box that sends to a name in the given patchers: `[send]`, `[s]`, `[send~]`, `[mc.send~]`, `[forward]`, and the bound objects `[value]`, `[pv]`, `[pvar]` and `[pattr]`, which count on both sides. In document order; a box with no name argument is left out. |
| [receives](functions/receives.md) | Every box that receives from a name: `[receive]`, `[r]`, `[receive~]`, `[mc.receive~]` and the bound objects. |
| [validateAgainstSchema](functions/validateAgainstSchema.md) | Every way `value` breaks `schema`, one `<path>: <problem>` line each, or `[]` when it conforms. `path` names the value in messages, e.g. `options`. |
