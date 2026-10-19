[libmunit](../README.md) / matchSignal

# Function: matchSignal()

```ts
function matchSignal(
   actual, 
   reference, 
   options
): SignalMatch;
```

Compares a captured channel with a reference channel, aligning them first
(by cross-correlation, within `maxLatency` samples) when the options allow.
Channels of different lengths compare over their overlap. This is what a
signal assert with `@reference` does per channel.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `actual` | `unknown` |
| `reference` | `unknown` |
| `options` | [`SignalMatchOptions`](../interfaces/SignalMatchOptions.md) |

## Returns

[`SignalMatch`](../interfaces/SignalMatch.md)
