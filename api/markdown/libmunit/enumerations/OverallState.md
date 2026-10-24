[libmunit](../README.md) / OverallState

# Enumeration: OverallState

The verdict of a whole suite, in [finalisedResults](../interfaces/finalisedResults.md). Per-assert
verdicts are [State](State.md).

## Enumeration Members

| Enumeration Member | Value | Description |
| ------ | ------ | ------ |
| <a id="enumeration-member-passed"></a> `Passed` | `"Passed"` | Every assert passed or was skipped, and the suite had no problems. |
| <a id="enumeration-member-failed"></a> `Failed` | `"Failed"` | At least one assert failed, or the suite had a problem: a suite timeout, or a console error when `ignoreConsoleErrors` is off. |
