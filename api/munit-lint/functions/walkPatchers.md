[munit-lint](../README.md) / walkPatchers

# Function: walkPatchers()

```ts
function walkPatchers(patcher): Generator<Patcher>;
```

A patcher and every patcher nested in it, depth first, the given one first.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patcher` | [`Patcher`](../interfaces/Patcher.md) |

## Returns

`Generator`\<[`Patcher`](../interfaces/Patcher.md)\>
