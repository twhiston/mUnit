# libmunit

The public JavaScript API of mUnit: what a custom assert, a log or result
formatter and a `munit.config.js` can rely on.

In Max, `require("libmunit")` returns it (the package puts `libmunit.js`
on the search path). In an editor, add the package's
`api/libmunit.d.ts` to a `jsconfig.json` next to your scripts, as
every example under `examples/` does, and annotate what you write:

```js
/// munit.config.js
/** @type {import("libmunit").HandlerConfig} */
module.exports = { resultFormatter: "JUnit", outputDir: "./logs" };
```

- A custom assert is an [AssertionHandler](type-aliases/AssertionHandler.md): it gets the inputs and
  the [ExpressionHelpers](interfaces/ExpressionHelpers.md), and returns a [State](enumerations/State.md) or an
  [Outcome](interfaces/Outcome.md).
- A formatter implements [LogFormatter](interfaces/LogFormatter.md) or [ResultFormatter](interfaces/ResultFormatter.md)
  and receives [assertSettings](classes/assertSettings.md), [assertState](classes/assertState.md) and
  [finalisedResults](interfaces/finalisedResults.md).
- A `munit.config.js` exports a [HandlerConfig](interfaces/HandlerConfig.md).
- The measures (`rms`, `snrDb`, `matchMatrix`, ...) are the functions
  behind the helpers, for scripts that want them directly.

Anything `require("libmunit")` returns that is not listed here is internal
and may change without notice.

## Enumerations

| Enumeration | Description |
| ------ | ------ |
| [State](enumerations/State.md) | The verdict of one assert, or of one call of a custom assert. |
| [OverallState](enumerations/OverallState.md) | The verdict of a whole suite, in [finalisedResults](interfaces/finalisedResults.md). Per-assert verdicts are [State](enumerations/State.md). |

## Classes

| Class | Description |
| ------ | ------ |
| [assertSettings](classes/assertSettings.md) | One assert as registered with the handler: its attributes and what it evaluates. Result formatters get the list of these as their first argument. |
| [assertState](classes/assertState.md) | The result of one assert, as the handler collects it and result formatters receive it in [finalisedResults.results](interfaces/finalisedResults.md#results). |

## Interfaces

| Interface | Description |
| ------ | ------ |
| [Outcome](interfaces/Outcome.md) | What a custom assert returns instead of a bare [State](enumerations/State.md) to say more about a call: a message, the expected and actual values, and files to keep with a failure. Only `state` is required. Details given here replace what the helpers recorded. |
| [ExpressionHelpers](interfaces/ExpressionHelpers.md) | The helpers in scope in an expression (`approx(in1, 0.5)`) and passed to a custom assert as its second argument. The comparisons (`approx`, `equals`, `snapshot`, `sameMatrix`) record what they compared, so a failure reports expected and actual values and the differences without more work. The measures (`rms`, `peak`, ...) are the library functions of the same name. |
| [MatrixShape](interfaces/MatrixShape.md) | The shape of a matrix: its dimensions, plane count and cell type. |
| [MatrixData](interfaces/MatrixData.md) | A Jitter matrix as a value: what a `jit_matrix` on a data inlet arrives as, in expressions, custom asserts and the matrix helpers. Cells are stored as Jitter does, planes interleaved and the first dimension fastest: `data[((y * width + x) * planes) + plane]` for a 2D matrix. |
| [PlaneStats](interfaces/PlaneStats.md) | The statistics of one plane of a matrix, from [planeStats](functions/planeStats.md). |
| [MatrixMatchOptions](interfaces/MatrixMatchOptions.md) | How [matchMatrix](functions/matchMatrix.md) compares two matrices: the `@maxDiff` and `@maxFraction` attributes of a matrix assert. |
| [MatrixMatch](interfaces/MatrixMatch.md) | What [matchMatrix](functions/matchMatrix.md) found. |
| [SignalMatchOptions](interfaces/SignalMatchOptions.md) | How [matchSignal](functions/matchSignal.md) compares a capture with a reference: the `@snr`, `@maxLatency` and `@exact` attributes of a signal assert. |
| [SignalMatch](interfaces/SignalMatch.md) | What [matchSignal](functions/matchSignal.md) found. |
| [HandlerConfig](interfaces/HandlerConfig.md) | What a `munit.config.js` exports, or a `configure` dict sent to `[mUnit.handler]` contains. Every key is optional; the handler fills in the defaults and rejects values it can't use, naming the key in the Max console. |
| [DspConfig](interfaces/DspConfig.md) | The DSP settings of [HandlerConfig.dsp](interfaces/HandlerConfig.md#dsp): the audio driver by name, the sample rate and the signal vector size. Each is optional; what is left out keeps its current value. |
| [Run](interfaces/Run.md) | One evaluation of an assert: the verdict of that call and the inputs it saw. |
| [Attachment](interfaces/Attachment.md) | A file kept with a failure. An assert sends `content`; the handler writes it to `<output>/artifacts/<uuid>/<name>` and replaces it with `path`. An assert that writes its own file (a buffer~, a matrix) sends `path` only. |
| [Recording](interfaces/Recording.md) | A reference file to write when taking references. The handler writes `content`; an assert that writes its own file (a buffer~ as a wav) sends the path only. |
| [finalisedResults](interfaces/finalisedResults.md) | The results of a whole suite, as result formatters receive them in their second argument. |
| [LogFormatterOptions](interfaces/LogFormatterOptions.md) | The options a log formatter accepts in [LogFormatter.configure](interfaces/LogFormatter.md#configure). A marker interface: each formatter defines its own options. |
| [LogFormatter](interfaces/LogFormatter.md) | Renders the captured Max console log when the suite finishes, as the `logFormatter` of a [HandlerConfig](interfaces/HandlerConfig.md). The built-in `"Txt"` writes the lines as they were captured, to `log.txt`. |
| [ResultFormatterOptions](interfaces/ResultFormatterOptions.md) | The options a result formatter accepts in [ResultFormatter.configure](interfaces/ResultFormatter.md#configure). A marker interface: each formatter defines its own options. |
| [ResultFormatter](interfaces/ResultFormatter.md) | Renders the results of a suite, as the `resultFormatter` of a [HandlerConfig](interfaces/HandlerConfig.md). The built-in `"Json"` writes `results.json`, `"JUnit"` writes `results.xml` for CI systems and `"Html"` writes a `results.html` overview to open in a browser. |
| [Tolerance](interfaces/Tolerance.md) | How far two numbers may be apart and still match: the larger of the absolute and the relative allowance wins. |

## Type Aliases

| Type Alias | Description |
| ------ | ------ |
| [MatrixType](type-aliases/MatrixType.md) | The cell types of a Jitter matrix this library can hold. |
| [AssertKind](type-aliases/AssertKind.md) | How an assert evaluates: a JavaScript expression over `in1`..`in10`, a custom script, a signal capture against a reference (`[mUnit.assert~]`), or a matrix against a `.jxf` reference. |
| [AssertionHandler](type-aliases/AssertionHandler.md) | A custom assert: the function a script named in `[mUnit.assert my.js]` exports (`module.exports = assert`). It is called with the current inputs `[in1, in2, ...]` and the [ExpressionHelpers](interfaces/ExpressionHelpers.md), and returns a [State](enumerations/State.md), or an [Outcome](interfaces/Outcome.md) to report expected and actual values, a message or files as well. A script that throws, or returns something else, counts as Fail. Set `@dataInlets` on the object, since a script can't say how many inputs it needs. |

## Variables

| Variable | Description |
| ------ | ------ |
| [DEFAULT\_TOLERANCE](variables/DEFAULT_TOLERANCE.md) | The tolerance `approx` and [approxEqual](functions/approxEqual.md) use by default: 1e-6 absolute, no relative part. |

## Functions

| Function | Description |
| ------ | ------ |
| [isMatrix](functions/isMatrix.md) | Whether a value is a [MatrixData](interfaces/MatrixData.md): a matrix from a data inlet or a reference file. |
| [describeMatrix](functions/describeMatrix.md) | A matrix's shape without its cells, for messages and results. |
| [planeStats](functions/planeStats.md) | The smallest, mean and largest value of one plane of a matrix; all 0 for an empty matrix. Behind the `planeMin`, `planeMean` and `planeMax` helpers. |
| [matrixCell](functions/matrixCell.md) | One cell of a matrix: its planes as a list, or one plane's value when `plane` is given. The `cell` helper. |
| [matchMatrix](functions/matchMatrix.md) | Compares two matrices cell by cell, like the perceptual rule "at most 0.1% of pixels differ by more than 2/255" (`maxDiff` 2, `maxFraction` 0.001). A cell counts as differing once, however many of its planes are over. This is what a matrix assert with `@reference` does, and the `sameMatrix` helper. |
| [frequency](functions/frequency.md) | The frequency in Hz of a signal, from its positive-going zero crossings, interpolated between samples so a short capture still gives a precise estimate. 0 with fewer than two crossings. The `freq` helper. |
| [matchSignal](functions/matchSignal.md) | Compares a captured channel with a reference channel, aligning them first (by cross-correlation, within `maxLatency` samples) when the options allow. Channels of different lengths compare over their overlap. This is what a signal assert with `@reference` does per channel. |
| [approxEqual](functions/approxEqual.md) | Whether two numbers match within a tolerance. Equal values match whatever the tolerance, including the infinities; an infinite value matches nothing else, and NaN never matches. |
| [diffValues](functions/diffValues.md) | Every difference between two values, one `path: expected X, got Y` line each (the path starts at `$`), or `[]` when they match. Numbers match within the tolerance (exact by default), lists item by item, dicts key by key in any order. Symbols are strings, so they match exactly. After 20 lines the rest are summed up as `... and N more difference(s)`. |
| [deepEqual](functions/deepEqual.md) | Whether two values are equal, compared as [diffValues](functions/diffValues.md) does: lists item by item, dicts key by key, numbers within the tolerance (exact by default). |
| [rms](functions/rms.md) | The root mean square of a list of numbers (a captured signal channel); 0 for no samples. A single number counts as a list of one. |
| [peak](functions/peak.md) | The largest absolute value in a list of numbers; 0 for no samples. |
| [dcOffset](functions/dcOffset.md) | The mean of a list of numbers, i.e. the DC offset of a signal; 0 for no samples. The `dc` helper. |
| [maxDiff](functions/maxDiff.md) | The largest absolute difference between two lists of numbers, sample by sample. |
| [snrDb](functions/snrDb.md) | The signal-to-noise ratio in dB of `actual` against a reference, where the noise is their difference: `Infinity` when they are identical, `-Infinity` when the reference is silent. The `snr` helper. 60 dB means the difference is about 0.1% of the signal. |
