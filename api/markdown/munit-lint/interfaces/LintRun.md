[munit-lint](../README.md) / LintRun

# Interface: LintRun

What a lint run produced: the result of `munit lint`, and what `lintFiles` returns.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="files"></a> `files` | `string`[] | Every file that was linted, as reported (relative to the working directory). |
| <a id="diagnostics"></a> `diagnostics` | [`Diagnostic`](Diagnostic.md)[] | Every finding. |
| <a id="errors"></a> `errors` | `string`[] | Why a file or rule could not be linted at all; any entry makes the exit code 2. |
| <a id="configfiles"></a> `configFiles?` | `string`[] | The configs that applied to the target, outermost first; empty when the defaults did; absent when it never got that far. |
| <a id="nestedconfigfiles"></a> `nestedConfigFiles?` | `string`[] | Further configs met in subfolders, which applied to the files under them. |
| <a id="ruleids"></a> `ruleIds?` | `string`[] | The ids of the rules that were active at the target. |
| <a id="fixed"></a> `fixed?` | `number` | With `--fix`: how many findings were fixed and written back. |
| <a id="rulelists"></a> `ruleLists?` | [`FileRules`](FileRules.md)[] | With `--list-rules`: the rules in force for each file, instead of findings. |
| <a id="projecthooks"></a> `projectHooks?` | `boolean` | A script rule with project hooks ran: the whole run is the unit, so `[mUnit.lint]` lints the folder again after a save. |
