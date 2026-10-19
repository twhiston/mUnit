[munit-lint](../README.md) / ScriptMeta

# Interface: ScriptMeta

What `exports.meta` of a script rule's module may declare.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="description"></a> `description?` | `string` | One line on what the rule checks; `--list-rules` prints it. |
| <a id="fixable"></a> `fixable?` | `boolean` | Whether findings carry edits for `--fix`. |
| <a id="options"></a> `options?` | [`JsonSchema`](JsonSchema.md) | A JSON Schema for the rule's `options`. The loader validates the JSON against it and reports a bad value as a config error, naming the rule and the key, before any patch is linted. |
