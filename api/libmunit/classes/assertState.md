[libmunit](../README.md) / assertState

# Class: assertState

The result of one assert, as the handler collects it and result formatters
receive it in [finalisedResults.results](../interfaces/finalisedResults.md#results).

## Constructors

### Constructor

```ts
new assertState(): assertState;
```

#### Returns

`assertState`

## Properties

| Property | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| <a id="uuid"></a> `uuid` | `string` \| `null` | `null` | The assert's unique id, matching its [assertSettings.uuid](assertSettings.md#uuid). |
| <a id="finalstate"></a> `finalState` | [`State`](../enumerations/State.md) | `State.Continue` | The verdict: `Success`, `Fail` or `Skipped` once the assert has finished. |
| <a id="count"></a> `count` | `number` | `0` | How many calls the assert made. |
| <a id="failcount"></a> `failCount` | `number` | `0` | How many of them returned Fail. |
| <a id="finished"></a> `finished` | `boolean` | `false` | Whether the verdict is in (left out of the written results). |
| <a id="runs"></a> `runs` | [`Run`](../interfaces/Run.md)[] | `[]` | Every call, in order. |
| <a id="expression"></a> `expression` | `string` \| `null` | `null` | The expression, the custom script's file name, or the reference file. |
| <a id="expressionhandler"></a> `expressionHandler` | [`AssertionHandler`](../type-aliases/AssertionHandler.md) \| `null` | `null` | The custom assert's function, in the assert object only (left out of the written results). |
| <a id="message"></a> `message` | `string` \| `null` | `null` | Why the assert failed (or was skipped), or null when it passed. |
| <a id="durationms"></a> `durationMs` | `number` \| `null` | `null` | From the first input (or the suite start) to the verdict, in milliseconds. |
| <a id="expected"></a> `expected?` | `unknown` | `undefined` | A failure's expected value, as in [Run.expected](../interfaces/Run.md#expected). |
| <a id="actual"></a> `actual?` | `unknown` | `undefined` | A failure's actual value, as in [Run.actual](../interfaces/Run.md#actual). |
| <a id="operator"></a> `operator?` | `string` | `undefined` | A failure's comparison operator, as in [Run.operator](../interfaces/Run.md#operator). |
| <a id="diff"></a> `diff?` | `string`[] | `undefined` | A failure's differences, as in [Run.diff](../interfaces/Run.md#diff). |
| <a id="attachments"></a> `attachments?` | [`Attachment`](../interfaces/Attachment.md)[] | `undefined` | Files kept with a failure. |
| <a id="recordings"></a> `recordings?` | [`Recording`](../interfaces/Recording.md)[] | `undefined` | Reference files written when taking references. |
