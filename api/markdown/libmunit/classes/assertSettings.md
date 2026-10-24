[libmunit](../README.md) / assertSettings

# Class: assertSettings

One assert as registered with the handler: its attributes and what it
evaluates. Result formatters get the list of these as their first argument.

## Constructors

### Constructor

```ts
new assertSettings(): assertSettings;
```

#### Returns

`assertSettings`

## Properties

| Property | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| <a id="maxcalls"></a> `maxCalls` | `number` | `1` | `@maxCalls`: how many calls the assert may take to reach a verdict. Default 1. |
| <a id="timeout"></a> `timeout` | `number` | `-1` | `@timeout`: milliseconds from the first input (or the suite start) before a call counts as failed; -1 (the default) for none. |
| <a id="tolerance"></a> `tolerance` | `number` | `0` | `@tolerance`, custom and `@every` asserts: how many Fail results are tolerated before failing. |
| <a id="name"></a> `name` | `string` \| `null` | `null` | `@name`, or the uuid when the assert has none. |
| <a id="suite"></a> `suite` | `string` \| `null` | `null` | `@suite`, or the name of the patch the assert sits in. |
| <a id="accumulate"></a> `accumulate` | `boolean` | `false` | `@accumulate`: inputs are summed across calls instead of replaced. |
| <a id="datainlets"></a> `dataInlets` | `number` | `1` | `@dataInlets`: how many data inlets the assert reads (`in1`..`inN`). |
| <a id="uuid"></a> `uuid` | `string` \| `null` | `null` | The assert object's unique id, which the results carry too. |
| <a id="kind"></a> `kind` | [`AssertKind`](../type-aliases/AssertKind.md) | `'expression'` | What kind of assert this is. |
| <a id="expression"></a> `expression` | `string` \| `null` | `null` | The expression, the custom script's file name, or the reference file. |
| <a id="every"></a> `every` | `boolean` | `false` | `@every`, expression asserts: every call must be true (e.g. a table of cases), rather than any one of them. |
| <a id="skip"></a> `skip` | `boolean` | `false` | `@skip`: report the assert as Skipped without evaluating it. |
| <a id="only"></a> `only` | `boolean` | `false` | `@only`: when any assert in the suite has it, every other one is Skipped. |
| <a id="reference"></a> `reference` | `string` \| `null` | `null` | `@reference`, signal and matrix asserts: the reference file (next to the test patch, in `references/`) the capture is compared with; null for an expression. |
| <a id="snr"></a> `snr` | `number` | `60` | `@snr`, signal asserts: the least signal-to-noise ratio, in dB, that counts as a match (60 dB is about 0.1% of the signal). |
| <a id="maxlatency"></a> `maxLatency` | `number` | `0` | `@maxLatency`, signal asserts: how many samples the capture may lead or lag the reference; 0 compares them as they are. |
| <a id="exact"></a> `exact` | `boolean` | `false` | `@exact`, signal asserts: every sample must be identical (bit-exact). |
| <a id="maxdiff"></a> `maxDiff` | `number` | `0` | `@maxDiff`, matrix asserts: the largest difference a cell may have from the reference, in the matrix's units (0-255 for char). |
| <a id="maxfraction"></a> `maxFraction` | `number` | `0` | `@maxFraction`, matrix asserts: the largest fraction of cells (0 to 1) that may exceed `maxDiff`. |
