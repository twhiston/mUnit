[munit-lint](../README.md) / Box

# Interface: Box

One box in a patcher: an object, message, comment or UI object.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="id"></a> `id` | `string` | Max's id for the box, e.g. `obj-12`, unique within its patcher. |
| <a id="maxclass"></a> `maxclass` | `string` | Max's class: `newobj` for an object box, `message`, `comment`, `toggle`, ... |
| <a id="text"></a> `text` | `string` \| `null` | The box text as saved (newobj, message, comment); null for UI objects. |
| <a id="object"></a> `object` | `string` \| `null` | What the box is: the normalised first token of a newobj's text (aliases resolved, so `[t]` and `[trigger]` are both `trigger`, and `[zl reg]` is `zl.reg`), otherwise the maxclass. |
| <a id="args"></a> `args` | `string`[] | Positional arguments after the object name, up to the first `@attribute`. |
| <a id="attributes"></a> `attributes` | `Record`\<`string`, `unknown`\> | Inline `@attributes` from the text (a single value as a string, several as a list of tokens) merged over the attributes Max saved on the box. |
| <a id="varname"></a> `varname` | `string` \| `null` | The scripting name, or null. |
| <a id="rect"></a> `rect` | \[`number`, `number`, `number`, `number`\] \| `null` | `patching_rect`: x, y, width, height. |
| <a id="patcher"></a> `patcher` | [`Patcher`](Patcher.md) \| `null` | A nested patcher: `[p]`, `[gen~]`, `[jit.gen]`, `[rnbo~]` and friends. |
| <a id="raw"></a> `raw` | `Record`\<`string`, `unknown`\> | The box's JSON as saved, for anything the model doesn't name. |
