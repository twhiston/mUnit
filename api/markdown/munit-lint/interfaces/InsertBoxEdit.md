[munit-lint](../README.md) / InsertBoxEdit

# Interface: InsertBoxEdit

Adds a box, given as the JSON Max would save for it.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="op"></a> `op` | `"insert-box"` | Always `insert-box`. |
| <a id="patcher"></a> `patcher` | `string`[] | The route to the patcher as box ids ([Patcher.ids](Patcher.md#ids)); empty for the root patcher. |
| <a id="box"></a> `box` | `Record`\<`string`, `unknown`\> | The box as Max saves it: at least `maxclass`, `text` and `patching_rect`; an `id` is made up when missing. |
