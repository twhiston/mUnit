[libmunit](../README.md) / Attachment

# Interface: Attachment

A file kept with a failure. An assert sends `content`; the handler writes
it to `<output>/artifacts/<uuid>/<name>` and replaces it with `path`. An
assert that writes its own file (a buffer~, a matrix) sends `path` only.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="name"></a> `name` | `string` | The file name, e.g. `inputs.txt` or `actual.wav`. |
| <a id="content"></a> `content?` | `string` | The text to write; left out when the assert wrote the file itself. |
| <a id="path"></a> `path?` | `string` | Where the file is, once written. |
