[munit-lint](../README.md) / ReportedLevel

# Type Alias: ReportedLevel

```ts
type ReportedLevel = Exclude<Level, "off">;
```

A level a finding can have: `warn` or `block`.
