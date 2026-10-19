[libmunit](../README.md) / finalisedResults

# Interface: finalisedResults

The results of a whole suite, as result formatters receive them in their
second argument.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="state"></a> `state` | [`OverallState`](../enumerations/OverallState.md) | The suite's verdict. |
| <a id="passcount"></a> `passCount` | `number` | How many asserts passed. |
| <a id="failcount"></a> `failCount` | `number` | How many asserts failed. |
| <a id="skipcount"></a> `skipCount` | `number` | How many asserts were skipped; they neither pass nor fail the suite. |
| <a id="results"></a> `results` | [`assertState`](../classes/assertState.md)[] | Every assert's result, in the order they finished. |
| <a id="errors"></a> `errors` | `string`[] | Suite-level problems, e.g. a suite timeout or results nobody registered. |
| <a id="consoleerrors"></a> `consoleErrors` | `string`[] | Captured console lines with a non-zero level. |
| <a id="startedat"></a> `startedAt` | `string` | ISO timestamp of the suite start. |
| <a id="durationms"></a> `durationMs` | `number` | How long the suite ran, in milliseconds. |
