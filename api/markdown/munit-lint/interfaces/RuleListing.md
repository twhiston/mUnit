[munit-lint](../README.md) / RuleListing

# Interface: RuleListing

One rule as it applies to a file: its level after overrides, and where it came from.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="id"></a> `id` | `string` | The rule's id. |
| <a id="kind"></a> `kind` | [`RuleKind`](../type-aliases/RuleKind.md) | The rule's kind. |
| <a id="level"></a> `level` | [`ReportedLevel`](../type-aliases/ReportedLevel.md) | The level in force for the file. |
| <a id="source"></a> `source` | `string` | The rule file, built-in set or config the rule came from. |
| <a id="description"></a> `description?` | `string` | A script rule's `meta.description`. |
