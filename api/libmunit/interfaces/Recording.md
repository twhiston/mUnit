[libmunit](../README.md) / Recording

# Interface: Recording

A reference file to write when taking references. The handler writes
`content`; an assert that writes its own file (a buffer~ as a wav) sends
the path only.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="path"></a> `path` | `string` | The reference file, as an absolute path. |
| <a id="content"></a> `content?` | `string` | The text to write; left out when the assert wrote the file itself. |
