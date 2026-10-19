[munit-lint](../README.md) / ProjectContext

# Interface: ProjectContext

What `begin` and `end` of [ProjectHooks](ProjectHooks.md) receive.

## Extended by

- [`ProjectEndContext`](ProjectEndContext.md)

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="rule"></a> `rule` | [`ScriptRule`](ScriptRule.md) | The rule, with its `options`, `level` and `scope`. |
| <a id="options"></a> `options` | `unknown` | The rule's `options`, as in [ScriptContext.options](ScriptContext.md#options). |
| <a id="files"></a> `files` | `string`[] | Every file of this run, as reported, in the order `check` will see them. |
| <a id="state"></a> `state` | [`RuleState`](../type-aliases/RuleState.md) | The state object `check` sees as `ctx.state`. |
