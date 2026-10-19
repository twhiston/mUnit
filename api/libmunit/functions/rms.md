[libmunit](../README.md) / rms

# Function: rms()

```ts
function rms(values): number;
```

The root mean square of a list of numbers (a captured signal channel); 0
for no samples. A single number counts as a list of one.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `values` | `unknown` |

## Returns

`number`

## Throws

TypeError when `values` isn't a number or a list of them
