[munit-lint](../README.md) / ScriptFinding

# Interface: ScriptFinding

One thing a script rule found. Give it a `box` so the finding has a
location (the box's patcher is found for you); a finding without one is
reported against the patcher, or the file's root patcher.

## Extended by

- [`ProjectFinding`](ProjectFinding.md)

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="message"></a> `message` | `string` | What is wrong, in a sentence. |
| <a id="box"></a> `box?` | [`Box`](Box.md) | The box the finding is about; its id and position go into the report. |
| <a id="patcher"></a> `patcher?` | [`Patcher`](Patcher.md) | The patcher the finding is about, when there is no box or the box's patcher isn't the obvious one. |
| <a id="edits"></a> `edits?` | [`Edit`](../type-aliases/Edit.md)[] | How `--fix` should change the file; leave out for a finding that can't be fixed. |
