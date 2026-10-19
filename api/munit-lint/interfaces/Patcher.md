[munit-lint](../README.md) / Patcher

# Interface: Patcher

A patcher: the root of a file, or one nested in a box.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="namespace"></a> `namespace` | `string` | What kind of patcher this is. |
| <a id="path"></a> `path` | `string`[] | How to get here from the file's root patcher, as labels, e.g. `['[p main]', '[gen~]']`; empty at the root. |
| <a id="ids"></a> `ids` | `string`[] | The same route as the ids of the boxes holding each nested patcher, which is unambiguous: edits locate a patcher by it. |
| <a id="boxes"></a> `boxes` | [`Box`](Box.md)[] | The boxes, in saved order. |
| <a id="lines"></a> `lines` | [`Line`](Line.md)[] | The patch cords. |
| <a id="raw"></a> `raw` | `Record`\<`string`, `unknown`\> | The patcher's JSON as saved. |
