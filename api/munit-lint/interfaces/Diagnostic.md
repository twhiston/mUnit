[munit-lint](../README.md) / Diagnostic

# Interface: Diagnostic

One finding, as the reports and `lintFiles` carry it.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="rule"></a> `rule` | `string` | The id of the rule that reported it. |
| <a id="level"></a> `level` | [`ReportedLevel`](../type-aliases/ReportedLevel.md) | The rule's level for this file. |
| <a id="file"></a> `file` | `string` | The file, as reported. |
| <a id="patchers"></a> `patchers` | `string`[] | The nested patchers on the way to the box, as labels; empty for a box in the top-level patcher. |
| <a id="location"></a> `location` | `string` | `patchers` plus the box, e.g. `[p main] > [gen~] > [+ 1]`; empty for a finding about the file. |
| <a id="box"></a> `box` | `string` \| `null` | The box's id, or null for a finding about a patcher or the file. |
| <a id="position"></a> `position` | \[`number`, `number`\] \| `null` | The box's position (x, y) in its patcher, when known. |
| <a id="message"></a> `message` | `string` | What is wrong. |
| <a id="edits"></a> `edits` | [`Edit`](../type-aliases/Edit.md)[] | How `--fix` changes the file; empty when the finding can't be fixed. |
