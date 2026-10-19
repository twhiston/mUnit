[libmunit](../README.md) / MatrixMatch

# Interface: MatrixMatch

What [matchMatrix](../functions/matchMatrix.md) found.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="pass"></a> `pass` | `boolean` | Whether the matrices match within the options. |
| <a id="sameshape"></a> `sameShape` | `boolean` | False when the dimensions, plane count or type differ; nothing else is compared then. |
| <a id="maxdiff"></a> `maxDiff` | `number` | The largest difference between any pair of values. |
| <a id="differing"></a> `differing` | `number` | How many cells have a value over `maxDiff`. |
| <a id="fraction"></a> `fraction` | `number` | `differing` as a fraction of all cells. |
| <a id="cells"></a> `cells` | `number` | How many cells the matrices have. |
