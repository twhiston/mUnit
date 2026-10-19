[munit-lint](../README.md) / RuleBase

# Interface: RuleBase

The settings every rule has, whatever its kind.

## Extended by

- [`ScriptRule`](ScriptRule.md)

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="id"></a> `id` | `string` | The rule's id, unique within a config: what findings and overrides name it by. |
| <a id="level"></a> `level` | [`Level`](../type-aliases/Level.md) | `off`, `warn` or `block`; `block` fails `munit lint`. |
| <a id="message"></a> `message?` | `string` | The message of each finding, replacing the kind's default. |
| <a id="scope"></a> `scope` | [`RuleScope`](RuleScope.md) | Which patchers the rule looks at. |
| <a id="source"></a> `source` | `string` | Where the rule came from (the rule file, config or built-in set), for error messages. |
