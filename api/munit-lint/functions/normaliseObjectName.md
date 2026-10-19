[munit-lint](../README.md) / normaliseObjectName

# Function: normaliseObjectName()

```ts
function normaliseObjectName(tokens): string | null;
```

The object name a box's text tokens denote, as [Box.object](../interfaces/Box.md#object) holds
it: aliases resolved (`t` is `trigger`, `s` is `send`), and a mode
argument of `zl` and `mc` folded into a dotted name (`zl reg` is `zl.reg`).
Use it to compare a name a rule's options give with `box.object`. Null for
no tokens.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `tokens` | `string`[] |

## Returns

`string` \| `null`
