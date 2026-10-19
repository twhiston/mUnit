[libmunit](../README.md) / Run

# Interface: Run

One evaluation of an assert: the verdict of that call and the inputs it saw.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="state"></a> `state` | [`State`](../enumerations/State.md) | The verdict of this call. |
| <a id="data"></a> `data` | `unknown`[] | The inputs, `[in1, in2, ...]`; a long list or a matrix is summarised. |
| <a id="error"></a> `error?` | `string` | An exception the evaluation threw, or a contract it broke. |
| <a id="expected"></a> `expected?` | `unknown` | What was compared, when known: from a helper (`approx`, `equals`, `snapshot`) or a top-level comparison like `in1 == 1`, whose left side is the actual. |
| <a id="actual"></a> `actual?` | `unknown` | The actual value of the comparison, when known. |
| <a id="operator"></a> `operator?` | `string` | The comparison's operator (`==`, `>=`, ...), when the expression was one. |
| <a id="diff"></a> `diff?` | `string`[] | Every difference, one `path: expected X, got Y` line each, from [diffValues](../functions/diffValues.md). |
