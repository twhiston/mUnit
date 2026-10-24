[munit-lint](../README.md) / RemoveBoxEdit

# Interface: RemoveBoxEdit

Removes a box and the cords connected to it.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="op"></a> `op` | `"remove-box"` | Always `remove-box`. |
| <a id="patcher"></a> `patcher` | `string`[] | The route to the box's patcher as box ids ([Patcher.ids](Patcher.md#ids)); empty for the root patcher. |
| <a id="box"></a> `box` | `string` | The box's id. |
