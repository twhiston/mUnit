[libmunit](../README.md) / ExpressionHelpers

# Interface: ExpressionHelpers

The helpers in scope in an expression (`approx(in1, 0.5)`) and passed to a
custom assert as its second argument. The comparisons (`approx`, `equals`,
`snapshot`, `sameMatrix`) record what they compared, so a failure reports
expected and actual values and the differences without more work. The
measures (`rms`, `peak`, ...) are the library functions of the same name.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="approx"></a> `approx` | (`actual`, `expected`, `abs?`, `rel?`) => `boolean` | Whether `actual` equals `expected` within a tolerance, compared like [deepEqual](../functions/deepEqual.md): lists item by item, dicts key by key. The tolerance is the larger of `abs` (default 1e-6) and `rel * \|expected\|` (default 0). |
| <a id="equals"></a> `equals` | (`actual`, `expected`) => `boolean` | Whether `actual` equals `expected` exactly, compared like [deepEqual](../functions/deepEqual.md). |
| <a id="snapshot"></a> `snapshot` | (`actual`, `name?`) => `boolean` | Whether `actual` matches the reference `<patch folder>/references/<name>.json`. The name defaults to the assert's `@name`; it must have one or be given one here, and the patch must be saved, or the helper throws. With no reference yet the check fails and says how to take one; when taking references the value is written as the reference and the check passes. |
| <a id="rms"></a> `rms` | (`values`) => `number` | The root mean square, as [rms](../functions/rms.md). |
| <a id="peak"></a> `peak` | (`values`) => `number` | The largest absolute value, as [peak](../functions/peak.md). |
| <a id="dc"></a> `dc` | (`values`) => `number` | The mean, as [dcOffset](../functions/dcOffset.md). |
| <a id="maxdiff"></a> `maxDiff` | (`actual`, `expected`) => `number` | The largest absolute difference between two lists, as [maxDiff](../functions/maxDiff.md). |
| <a id="snr"></a> `snr` | (`actual`, `reference`) => `number` | The signal-to-noise ratio in dB, as [snrDb](../functions/snrDb.md). |
| <a id="freq"></a> `freq` | (`values`) => `number` | The frequency in Hz of a captured signal, as [frequency](../functions/frequency.md) at the capture's sample rate. Signal asserts (`[mUnit.assert~]`) only: anywhere else it throws, since there is no sample rate. |
| <a id="planemin"></a> `planeMin` | (`matrix`, `plane?`) => `number` | The smallest value in one plane (default 0) of a matrix, as [planeStats](../functions/planeStats.md). |
| <a id="planemean"></a> `planeMean` | (`matrix`, `plane?`) => `number` | The mean of one plane (default 0) of a matrix, as [planeStats](../functions/planeStats.md). |
| <a id="planemax"></a> `planeMax` | (`matrix`, `plane?`) => `number` | The largest value in one plane (default 0) of a matrix, as [planeStats](../functions/planeStats.md). |
| <a id="cell"></a> `cell` | (`matrix`, `x`, `y?`, `plane?`) => `number` \| `number`[] | One cell of a matrix, as [matrixCell](../functions/matrixCell.md): its planes as a list, or one plane's value. |
| <a id="samematrix"></a> `sameMatrix` | (`actual`, `expected`, `maxDiff?`, `maxFraction?`) => `boolean` | Whether two matrices match, as [matchMatrix](../functions/matchMatrix.md) with `maxDiff` and `maxFraction` (both default 0: identical). Records a check, so a failure reports both shapes and how many cells differed. |
