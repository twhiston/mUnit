[munit-lint](../README.md) / ProjectFinding

# Interface: ProjectFinding

A finding reported from `end`, against one of the run's files.

## Extends

- [`ScriptFinding`](ScriptFinding.md)

## Properties

| Property | Type | Description | Inherited from |
| ------ | ------ | ------ | ------ |
| <a id="message"></a> `message` | `string` | What is wrong, in a sentence. | [`ScriptFinding`](ScriptFinding.md).[`message`](ScriptFinding.md#message) |
| <a id="box"></a> `box?` | [`Box`](Box.md) | The box the finding is about; its id and position go into the report. | [`ScriptFinding`](ScriptFinding.md).[`box`](ScriptFinding.md#box) |
| <a id="patcher"></a> `patcher?` | [`Patcher`](Patcher.md) | The patcher the finding is about, when there is no box or the box's patcher isn't the obvious one. | [`ScriptFinding`](ScriptFinding.md).[`patcher`](ScriptFinding.md#patcher) |
| <a id="edits"></a> `edits?` | [`Edit`](../type-aliases/Edit.md)[] | How `--fix` should change the file; leave out for a finding that can't be fixed. | [`ScriptFinding`](ScriptFinding.md).[`edits`](ScriptFinding.md#edits) |
| <a id="file"></a> `file` | `string` | The file, as named in [ProjectContext.files](ProjectContext.md#files). | - |
