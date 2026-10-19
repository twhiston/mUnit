[libmunit](../README.md) / State

# Enumeration: State

The verdict of one assert, or of one call of a custom assert.

A custom assert returns one of these (or an [Outcome](../interfaces/Outcome.md) that carries
one) on every call. How the calls add up to the assert's verdict:
- `Success` passes the assert straight away.
- `Fail` fails it straight away, unless `@tolerance` allows more Fails.
- `Continue` means "no verdict yet": an assert that reaches `@maxCalls`
  without failing passes.
- `Skipped` skips the assert, which neither passes nor fails the suite.

## Enumeration Members

| Enumeration Member | Value | Description |
| ------ | ------ | ------ |
| <a id="enumeration-member-fail"></a> `Fail` | `"Fail"` | The assert failed. |
| <a id="enumeration-member-success"></a> `Success` | `"Success"` | The assert passed. |
| <a id="enumeration-member-continue"></a> `Continue` | `"Continue"` | No verdict yet: wait for the next call. |
| <a id="enumeration-member-skipped"></a> `Skipped` | `"Skipped"` | The assert didn't run: `@skip`, another assert in the suite has `@only`, or a custom assert returned it (e.g. what it tests isn't available). |
