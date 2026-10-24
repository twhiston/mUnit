[libmunit](../README.md) / matchMatrix

# Function: matchMatrix()

```ts
function matchMatrix(
   actual, 
   expected, 
   options
): MatrixMatch;
```

Compares two matrices cell by cell, like the perceptual rule "at most 0.1%
of pixels differ by more than 2/255" (`maxDiff` 2, `maxFraction` 0.001). A
cell counts as differing once, however many of its planes are over. This is
what a matrix assert with `@reference` does, and the `sameMatrix` helper.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `actual` | [`MatrixData`](../interfaces/MatrixData.md) |
| `expected` | [`MatrixData`](../interfaces/MatrixData.md) |
| `options` | [`MatrixMatchOptions`](../interfaces/MatrixMatchOptions.md) |

## Returns

[`MatrixMatch`](../interfaces/MatrixMatch.md)
