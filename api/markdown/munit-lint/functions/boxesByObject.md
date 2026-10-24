[munit-lint](../README.md) / boxesByObject

# Function: boxesByObject()

```ts
function boxesByObject(patchers, name): Visit[];
```

Every box that is the object `name` in the given patchers, with its
patcher. The name is normalised like [Box.object](../interfaces/Box.md#object): `t`, `trigger`,
`zl reg` and `zl.reg` all work, and UI objects match by class (`toggle`).

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patchers` | [`Patcher`](../interfaces/Patcher.md)[] |
| `name` | `string` |

## Returns

[`Visit`](../interfaces/Visit.md)[]
