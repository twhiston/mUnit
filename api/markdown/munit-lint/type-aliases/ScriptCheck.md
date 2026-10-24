[munit-lint](../README.md) / ScriptCheck

# Type Alias: ScriptCheck

```ts
type ScriptCheck = (ctx) => ScriptFinding[] | undefined | void;
```

The function a script rule's module exports as `check`. It may return its
findings, report them through the context, or both.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `ctx` | [`ScriptContext`](../interfaces/ScriptContext.md) |

## Returns

[`ScriptFinding`](../interfaces/ScriptFinding.md)[] \| `undefined` \| `void`
