[munit-lint](../README.md) / sends

# Function: sends()

```ts
function sends(patchers): NamedBox[];
```

Every box that sends to a name in the given patchers: `[send]`, `[s]`,
`[send~]`, `[mc.send~]`, `[forward]`, and the bound objects `[value]`,
`[pv]`, `[pvar]` and `[pattr]`, which count on both sides. In document
order; a box with no name argument is left out.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `patchers` | [`Patcher`](../interfaces/Patcher.md)[] |

## Returns

[`NamedBox`](../interfaces/NamedBox.md)[]
