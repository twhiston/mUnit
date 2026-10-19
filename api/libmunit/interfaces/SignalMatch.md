[libmunit](../README.md) / SignalMatch

# Interface: SignalMatch

What [matchSignal](../functions/matchSignal.md) found.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="pass"></a> `pass` | `boolean` | Whether the capture matches within the options. |
| <a id="snrdb"></a> `snrDb` | `number` | The signal-to-noise ratio after alignment, in dB; `Infinity` when identical. |
| <a id="maxdiff"></a> `maxDiff` | `number` | The largest difference between any pair of samples after alignment. |
| <a id="latency"></a> `latency` | `number` | The lag, in samples, the capture was shifted by: positive when it was late. |
| <a id="samples"></a> `samples` | `number` | How many samples were compared after alignment. |
