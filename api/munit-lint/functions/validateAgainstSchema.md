[munit-lint](../README.md) / validateAgainstSchema

# Function: validateAgainstSchema()

```ts
function validateAgainstSchema(
   value, 
   schema, 
   path?
): string[];
```

Every way `value` breaks `schema`, one `<path>: <problem>` line each, or
`[]` when it conforms. `path` names the value in messages, e.g. `options`.

## Parameters

| Parameter | Type | Default value |
| ------ | ------ | ------ |
| `value` | `unknown` | `undefined` |
| `schema` | [`JsonSchema`](../interfaces/JsonSchema.md) | `undefined` |
| `path?` | `string` | `'options'` |

## Returns

`string`[]
