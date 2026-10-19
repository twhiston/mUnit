[libmunit](../README.md) / frequency

# Function: frequency()

```ts
function frequency(values, sampleRate): number;
```

The frequency in Hz of a signal, from its positive-going zero crossings,
interpolated between samples so a short capture still gives a precise
estimate. 0 with fewer than two crossings. The `freq` helper.

## Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `values` | `unknown` | the samples |
| `sampleRate` | `number` | the rate they were captured at, in Hz |

## Returns

`number`

## Throws

RangeError when the sample rate is not above 0
