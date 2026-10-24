[libmunit](../README.md) / SignalMatchOptions

# Interface: SignalMatchOptions

How [matchSignal](../functions/matchSignal.md) compares a capture with a reference: the `@snr`, `@maxLatency` and `@exact` attributes of a signal assert.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="snrdb"></a> `snrDb` | `number` | The least signal-to-noise ratio, in dB, that passes. |
| <a id="maxlatency"></a> `maxLatency` | `number` | Samples of lead or lag to search; 0 compares in place. |
| <a id="exact"></a> `exact` | `boolean` | Every sample must be identical; `snrDb` is then ignored. |
