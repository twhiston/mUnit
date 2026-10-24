[libmunit](../README.md) / matrixCell

# Function: matrixCell()

```ts
function matrixCell(
   value, 
   x, 
   y?, 
   plane?
): number | number[];
```

One cell of a matrix: its planes as a list, or one plane's value when
`plane` is given. The `cell` helper.

## Parameters

| Parameter | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| `value` | `unknown` | `undefined` | a [MatrixData](../interfaces/MatrixData.md) |
| `x` | `number` | `undefined` | the column |
| `y?` | `number` | `0` | the row, for a 2D matrix |
| `plane?` | `number` | `undefined` | one plane, numbered from 0 |

## Returns

`number` \| `number`[]

## Throws

TypeError when `value` isn't a matrix

## Throws

RangeError when the cell is outside the matrix, or the matrix has no such plane
