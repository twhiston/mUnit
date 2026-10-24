[munit-lint](../README.md) / SetAttributeEdit

# Interface: SetAttributeEdit

Sets an attribute: inline in an object box's text (`@autowatch 0`), or as a box key for UI objects.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="op"></a> `op` | `"set-attribute"` | Always `set-attribute`. |
| <a id="patcher"></a> `patcher` | `string`[] | The route to the box's patcher as box ids ([Patcher.ids](Patcher.md#ids)); empty for the root patcher. |
| <a id="box"></a> `box` | `string` | The box's id. |
| <a id="name"></a> `name` | `string` | The attribute's name, without the `@`. |
| <a id="value"></a> `value` | `unknown` | The value: a number, a string, or a list of them. |
