[munit-lint](../README.md) / SetTextEdit

# Interface: SetTextEdit

Replaces the text of an object, message or comment box.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="op"></a> `op` | `"set-text"` | Always `set-text`. |
| <a id="patcher"></a> `patcher` | `string`[] | The route to the box's patcher as box ids ([Patcher.ids](Patcher.md#ids)); empty for the root patcher. |
| <a id="box"></a> `box` | `string` | The box's id. |
| <a id="text"></a> `text` | `string` | The new text. |
