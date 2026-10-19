[libmunit](../README.md) / snrDb

# Function: snrDb()

```ts
function snrDb(actual, reference): number;
```

The signal-to-noise ratio in dB of `actual` against a reference, where the
noise is their difference: `Infinity` when they are identical, `-Infinity`
when the reference is silent. The `snr` helper. 60 dB means the difference
is about 0.1% of the signal.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `actual` | `unknown` |
| `reference` | `unknown` |

## Returns

`number`

## Throws

RangeError when the lists differ in length
