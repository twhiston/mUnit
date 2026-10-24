[munit-lint](../README.md) / ScriptModule

# Interface: ScriptModule

The shape of a script rule's module: `check` is required, `meta` and `project` are optional.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="check"></a> `check` | [`ScriptCheck`](../type-aliases/ScriptCheck.md) | Called once per file with the patchers in the rule's scope. |
| <a id="meta"></a> `meta?` | [`ScriptMeta`](ScriptMeta.md) | A description, whether findings are fixable, and a schema for the options. |
| <a id="project"></a> `project?` | [`ProjectHooks`](ProjectHooks.md) | Hooks around the file loop, for rules that need the whole project. |
