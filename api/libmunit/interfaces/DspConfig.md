[libmunit](../README.md) / DspConfig

# Interface: DspConfig

The DSP settings of [HandlerConfig.dsp](HandlerConfig.md#dsp): the audio driver by name,
the sample rate and the signal vector size. Each is optional; what is left
out keeps its current value. The tests start only once `[dspstate~]` has
reported DSP running on them, unchanged for half a second; if that takes
longer than 5 seconds plus `settleMs`, no tests run and the suite fails. A
change while the suite runs fails it too.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="driver"></a> `driver?` | `string` | The audio driver, named loosely: `"NonRealTime"` and `"non real time"` both work. |
| <a id="sr"></a> `sr?` | `number` | The sample rate in Hz. |
| <a id="vs"></a> `vs?` | `number` | The signal vector size in samples. |
| <a id="settlems"></a> `settleMs?` | `number` | How long to wait for a driver change to take effect, in milliseconds. Default 1500. |
