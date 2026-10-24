[libmunit](../README.md) / diffValues

# Function: diffValues()

```ts
function diffValues(
   actual, 
   expected, 
   tolerance?
): string[];
```

Every difference between two values, one `path: expected X, got Y` line
each (the path starts at `$`), or `[]` when they match. Numbers match
within the tolerance (exact by default), lists item by item, dicts key by
key in any order. Symbols are strings, so they match exactly. After 20
lines the rest are summed up as `... and N more difference(s)`.

## Parameters

| Parameter | Type | Default value | Description |
| ------ | ------ | ------ | ------ |
| `actual` | `unknown` | `undefined` | the value under test |
| `expected` | `unknown` | `undefined` | the value it should equal |
| `tolerance?` | [`Tolerance`](../interfaces/Tolerance.md) | `EXACT` | for the numbers inside; exact by default |

## Returns

`string`[]
