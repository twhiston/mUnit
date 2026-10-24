[munit-lint](../README.md) / ScriptContext

# Interface: ScriptContext

What a script rule's `check` receives. A rule reports with
[ScriptContext.report](#report) or by returning findings, or both. The helpers
answer the questions rules ask most: what a box is connected to, which
boxes are a given object, and who sends and receives by name.

Annotate `check` with `@type {import("munit-lint").ScriptCheck}` for
completion on `ctx` in an editor.

## Example

```js
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

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="rule"></a> `rule` | [`ScriptRule`](ScriptRule.md) | The rule being run, with its `options`, `level` and `scope`. |
| <a id="document"></a> `document` | [`PatcherDocument`](PatcherDocument.md) | The whole file: its root patcher and the raw JSON. |
| <a id="patchers"></a> `patchers` | [`Patcher`](Patcher.md)[] | The patchers in the rule's scope, root and nested, in document order. |
| <a id="options"></a> `options` | `unknown` | The rule's `options` from its JSON, as given, and validated against `meta.options` when the module declares it. |
| <a id="state"></a> `state` | [`RuleState`](../type-aliases/RuleState.md) | Anything the rule wants to remember during this run; see [ProjectHooks](ProjectHooks.md). |
| <a id="report"></a> `report` | (`finding`) => `void` | Reports one finding. |
| <a id="connectionsfrom"></a> `connectionsFrom` | (`box`, `outlet?`) => [`Connection`](Connection.md)[] | The cords leaving a box, every outlet or one; `[]` for a box outside the rule's patchers. |
| <a id="connectionsto"></a> `connectionsTo` | (`box`, `inlet?`) => [`Connection`](Connection.md)[] | The cords entering a box, every inlet or one. |
| <a id="boxesbyobject"></a> `boxesByObject` | (`name`) => [`Visit`](Visit.md)[] | Every box that is the object `name` in the rule's patchers; the name is normalised like `match.object`. |
| <a id="sends"></a> `sends` | () => [`NamedBox`](NamedBox.md)[] | Every box that sends to a name in the rule's patchers, bound objects included. |
| <a id="receives"></a> `receives` | () => [`NamedBox`](NamedBox.md)[] | Every box that receives from a name in the rule's patchers, bound objects included. |
| <a id="relatedfiles"></a> `relatedFiles` | () => `string`[] | The `.gendsp`, `.rnbopat` and bpatcher files the document refers to that exist next to it, as absolute paths. |
