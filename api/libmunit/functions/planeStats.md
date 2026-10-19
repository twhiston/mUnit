[libmunit](../README.md) / planeStats

# Function: planeStats()

```ts
function planeStats(value, plane?): PlaneStats;
```

The smallest, mean and largest value of one plane of a matrix; all 0 for
an empty matrix. Behind the `planeMin`, `planeMean` and `planeMax` helpers.

## Parameters

| Parameter | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| `value` | `unknown` | `undefined` | a [MatrixData](../interfaces/MatrixData.md) |
| `plane?` | `number` | `0` | the plane, numbered from 0 |

## Returns

[`PlaneStats`](../interfaces/PlaneStats.md)

## Throws

TypeError when `value` isn't a matrix

## Throws

RangeError when the matrix has no such plane
