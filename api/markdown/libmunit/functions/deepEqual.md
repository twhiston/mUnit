[libmunit](../README.md) / deepEqual

# Function: deepEqual()

```ts
function deepEqual(
   actual, 
   expected, 
   tolerance?
): boolean;
```

Whether two values are equal, compared as [diffValues](diffValues.md) does: lists
item by item, dicts key by key, numbers within the tolerance (exact by
default).

## Parameters

| Parameter | Type | Default value |
| ------ | ------ | ------ |
| `actual` | `unknown` | `undefined` |
| `expected` | `unknown` | `undefined` |
| `tolerance?` | [`Tolerance`](../interfaces/Tolerance.md) | `EXACT` |

## Returns

`boolean`
