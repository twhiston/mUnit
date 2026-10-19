[libmunit](../README.md) / Tolerance

# Interface: Tolerance

How far two numbers may be apart and still match: the larger of the
absolute and the relative allowance wins.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="abs"></a> `abs` | `number` | Largest allowed absolute difference. |
| <a id="rel"></a> `rel` | `number` | Largest allowed difference relative to `\|expected\|`. |
