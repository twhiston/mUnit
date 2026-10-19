[munit-lint](../README.md) / connectionsTo

# Function: connectionsTo()

```ts
function connectionsTo(
   patcher, 
   box, 
   inlet?
): Connection[];
```

The cords entering a box, in saved order: every inlet, or one inlet when `inlet` is given.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patcher` | [`Patcher`](../interfaces/Patcher.md) |
| `box` | [`Box`](../interfaces/Box.md) |
| `inlet?` | `number` |

## Returns

[`Connection`](../interfaces/Connection.md)[]
