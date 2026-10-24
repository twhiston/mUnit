[munit-lint](../README.md) / RuleState

# Type Alias: RuleState

```ts
type RuleState = Record<string, unknown>;
```

State a script rule keeps for one run: a fresh object per `munit lint`, shared by `begin`, every `check` and `end`.
