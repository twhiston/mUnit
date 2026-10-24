[munit-lint](../README.md) / walkBoxes

# Function: walkBoxes()

```ts
function walkBoxes(patcher): Generator<Visit>;
```

Every box in a patcher and its nested patchers, depth first, with the patcher it sits in.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patcher` | [`Patcher`](../interfaces/Patcher.md) |

## Returns

`Generator`\<[`Visit`](../interfaces/Visit.md)\>
