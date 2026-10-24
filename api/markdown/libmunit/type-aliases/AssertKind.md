[libmunit](../README.md) / AssertKind

# Type Alias: AssertKind

```ts
type AssertKind = "expression" | "custom" | "signal" | "matrix";
```

How an assert evaluates: a JavaScript expression over `in1`..`in10`, a
custom script, a signal capture against a reference (`[mUnit.assert~]`),
or a matrix against a `.jxf` reference.
