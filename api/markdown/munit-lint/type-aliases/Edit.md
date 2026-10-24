[munit-lint](../README.md) / Edit

# Type Alias: Edit

```ts
type Edit = 
  | SetTextEdit
  | SetAttributeEdit
  | RemoveBoxEdit
  | InsertBoxEdit;
```

A change to the patcher file that `--fix` (or `fix` sent to `[mUnit.lint]`)
applies. Applying edits and writing the file back in Max's own formatting
is the fixer's job; a rule only describes them.
