[munit-lint](../README.md) / connectionsFrom

# Function: connectionsFrom()

```ts
function connectionsFrom(
   patcher, 
   box, 
   outlet?
): Connection[];
```

The cords leaving a box, in saved order: every outlet, or one outlet when
`outlet` is given. Cords stay inside a patcher, so `patcher` is the one the
box sits in; a box from another patcher has no connections there.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patcher` | [`Patcher`](../interfaces/Patcher.md) |
| `box` | [`Box`](../interfaces/Box.md) |
| `outlet?` | `number` |

## Returns

[`Connection`](../interfaces/Connection.md)[]
