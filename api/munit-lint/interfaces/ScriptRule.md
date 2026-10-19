[munit-lint](../README.md) / ScriptRule

# Interface: ScriptRule

A rule of kind `script`: a JavaScript (CommonJS) module decides what to report, under `munit lint` and in `[mUnit.lint]` alike.

## Extends

- [`RuleBase`](RuleBase.md)

## Properties

| Property | Type | Description | Inherited from |
| ------ | ------ | ------ | ------ |
| <a id="id"></a> `id` | `string` | The rule's id, unique within a config: what findings and overrides name it by. | [`RuleBase`](RuleBase.md).[`id`](RuleBase.md#id) |
| <a id="level"></a> `level` | [`Level`](../type-aliases/Level.md) | `off`, `warn` or `block`; `block` fails `munit lint`. | [`RuleBase`](RuleBase.md).[`level`](RuleBase.md#level) |
| <a id="message"></a> `message?` | `string` | The message of each finding, replacing the kind's default. | [`RuleBase`](RuleBase.md).[`message`](RuleBase.md#message) |
| <a id="scope"></a> `scope` | [`RuleScope`](RuleScope.md) | Which patchers the rule looks at. | [`RuleBase`](RuleBase.md).[`scope`](RuleBase.md#scope) |
| <a id="source"></a> `source` | `string` | Where the rule came from (the rule file, config or built-in set), for error messages. | [`RuleBase`](RuleBase.md).[`source`](RuleBase.md#source) |
| <a id="kind"></a> `kind` | `"script"` | Always `script`. | - |
| <a id="module"></a> `module` | `string` | The module exporting `check(ctx)`, as a path relative to the rule file. | - |
| <a id="options"></a> `options?` | `unknown` | Anything the rule file gives, passed through as [ScriptContext.options](ScriptContext.md#options). | - |
| <a id="check"></a> `check?` | [`ScriptCheck`](../type-aliases/ScriptCheck.md) | The loaded `check`, filled in by the runner, which can require modules. | - |
| <a id="meta"></a> `meta?` | [`ScriptMeta`](ScriptMeta.md) | The module's `meta`, once loaded. | - |
| <a id="project"></a> `project?` | [`ProjectHooks`](ProjectHooks.md) | The module's `project` hooks, once loaded. | - |
| <a id="state"></a> `state?` | [`RuleState`](../type-aliases/RuleState.md) | This run's state, reset by the runner before each run. | - |
