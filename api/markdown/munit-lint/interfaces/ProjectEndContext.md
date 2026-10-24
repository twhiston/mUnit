[munit-lint](../README.md) / ProjectEndContext

# Interface: ProjectEndContext

What `end` receives: the project context plus a way to report.

## Extends

- [`ProjectContext`](ProjectContext.md)

## Properties

| Property | Type | Description | Inherited from |
| ------ | ------ | ------ | ------ |
| <a id="rule"></a> `rule` | [`ScriptRule`](ScriptRule.md) | The rule, with its `options`, `level` and `scope`. | [`ProjectContext`](ProjectContext.md).[`rule`](ProjectContext.md#rule) |
| <a id="options"></a> `options` | `unknown` | The rule's `options`, as in [ScriptContext.options](ScriptContext.md#options). | [`ProjectContext`](ProjectContext.md).[`options`](ProjectContext.md#options) |
| <a id="files"></a> `files` | `string`[] | Every file of this run, as reported, in the order `check` will see them. | [`ProjectContext`](ProjectContext.md).[`files`](ProjectContext.md#files) |
| <a id="state"></a> `state` | [`RuleState`](../type-aliases/RuleState.md) | The state object `check` sees as `ctx.state`. | [`ProjectContext`](ProjectContext.md).[`state`](ProjectContext.md#state) |
| <a id="report"></a> `report` | (`finding`) => `void` | Reports one finding against a file of the run. | - |
