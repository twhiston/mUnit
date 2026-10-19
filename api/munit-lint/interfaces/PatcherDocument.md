[munit-lint](../README.md) / PatcherDocument

# Interface: PatcherDocument

A patcher file: `.maxpat`, `.maxhelp`, `.gendsp` or `.rnbopat`.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="file"></a> `file` | `string` | The path the caller knows the file by; reported as given. |
| <a id="root"></a> `root` | [`Patcher`](Patcher.md) | The top-level patcher. |
| <a id="raw"></a> `raw` | `Record`\<`string`, `unknown`\> | The file's JSON as saved. |
