[libmunit](../README.md) / approxEqual

# Function: approxEqual()

```ts
function approxEqual(
   actual, 
   expected, 
   tolerance?
): boolean;
```

Whether two numbers match within a tolerance. Equal values match whatever
the tolerance, including the infinities; an infinite value matches nothing
else, and NaN never matches.

## Parameters

| Parameter | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| `actual` | `number` | `undefined` | the measured value |
| `expected` | `number` | `undefined` | the value it should have |
| `tolerance?` | [`Tolerance`](../interfaces/Tolerance.md) | `DEFAULT_TOLERANCE` | defaults to [DEFAULT\_TOLERANCE](../variables/DEFAULT_TOLERANCE.md) |

## Returns

`boolean`
