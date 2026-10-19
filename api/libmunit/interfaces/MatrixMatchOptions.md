[libmunit](../README.md) / MatrixMatchOptions

# Interface: MatrixMatchOptions

How [matchMatrix](../functions/matchMatrix.md) compares two matrices: the `@maxDiff` and `@maxFraction` attributes of a matrix assert.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="maxdiff"></a> `maxDiff` | `number` | The largest difference a cell may have, in the matrix's units (0-255 for char). |
| <a id="maxfraction"></a> `maxFraction` | `number` | The largest fraction of cells (0 to 1) that may exceed `maxDiff`. |
