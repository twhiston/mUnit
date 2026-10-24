[libmunit](../README.md) / Outcome

# Interface: Outcome

What a custom assert returns instead of a bare [State](../enumerations/State.md) to say more
about a call: a message, the expected and actual values, and files to keep
with a failure. Only `state` is required. Details given here replace what
the helpers recorded.

## Example

```js
return {
  state: mLib.State.Fail,
  message: "the inputs should add up to 10",
  expected: 10,
  actual: sum,
  attachments: [{ name: "inputs.txt", content: values.join("\n") }],
};
```

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="state"></a> `state` | [`State`](../enumerations/State.md) | The verdict of this call. |
| <a id="message"></a> `message?` | `string` | Replaces the default description of a failure in the results and the console. |
| <a id="error"></a> `error?` | `string` | An exception, or a contract the evaluator broke; reported as an error rather than a failure. |
| <a id="expected"></a> `expected?` | `unknown` | The value the assert expected. |
| <a id="actual"></a> `actual?` | `unknown` | The value it got. |
| <a id="operator"></a> `operator?` | `string` | The comparison's operator, when there was one. |
| <a id="diff"></a> `diff?` | `string`[] | Every difference, one `path: expected X, got Y` line each, as from [diffValues](../functions/diffValues.md). |
| <a id="attachments"></a> `attachments?` | [`Attachment`](Attachment.md)[] | Files to keep with a failure. |
| <a id="recordings"></a> `recordings?` | [`Recording`](Recording.md)[] | Reference files written when taking references. |
