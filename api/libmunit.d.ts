// Type definitions for libmunit: the public JavaScript API of mUnit: custom asserts, formatters and munit.config.js.
// SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
//
// Generated from max/typescript/shared/lib/src/public.ts
// by tools/api-docs/build-typings.js in the TypeScript workspace. Do not edit:
// change the JSDoc in the source, or the export list in public.ts, and run
// `pnpm run api-docs`.
//
// To get completion and checking in VS Code, include this file from a
// jsconfig.json next to your scripts (see the examples/ folder in the package)
// and annotate: /** @type {import("libmunit").X} */
declare module 'libmunit' {
  /**
   * The verdict of one assert, or of one call of a custom assert.
   *
   * A custom assert returns one of these (or an {@link Outcome} that carries
   * one) on every call. How the calls add up to the assert's verdict:
   * - `Success` passes the assert straight away.
   * - `Fail` fails it straight away, unless `@tolerance` allows more Fails.
   * - `Continue` means "no verdict yet": an assert that reaches `@maxCalls`
   *   without failing passes.
   * - `Skipped` skips the assert, which neither passes nor fails the suite.
   *
   * @category Custom asserts
   */
  export enum State {
    /** The assert failed. */
    Fail = "Fail",
    /** The assert passed. */
    Success = "Success",
    /** No verdict yet: wait for the next call. */
    Continue = "Continue",
    /**
     * The assert didn't run: `@skip`, another assert in the suite has `@only`,
     * or a custom assert returned it (e.g. what it tests isn't available).
     */
    Skipped = "Skipped"
  }

  /**
   * The verdict of a whole suite, in {@link finalisedResults}. Per-assert
   * verdicts are {@link State}.
   *
   * @category Formatters and configuration
   */
  export enum OverallState {
    /** Every assert passed or was skipped, and the suite had no problems. */
    Passed = "Passed",
    /**
     * At least one assert failed, or the suite had a problem: a suite timeout,
     * or a console error when `ignoreConsoleErrors` is off.
     */
    Failed = "Failed"
  }

  /**
   * What a `munit.config.js` exports, or a `configure` dict sent to
   * `[mUnit.handler]` contains. Every key is optional; the handler fills in the
   * defaults and rejects values it can't use, naming the key in the Max console.
   *
   * Annotate the file with `@type {import("libmunit").HandlerConfig}` for
   * completion and checking in an editor.
   *
   * @example
   * ```js
   * module.exports = {
   *   resultFormatter: "JUnit",
   *   outputDir: "./logs",
   *   dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },
   * };
   * ```
   *
   * @category Formatters and configuration
   */
  export interface HandlerConfig {
    /** A built-in name (`"Txt"`) or an object implementing {@link LogFormatter}. Default `"Txt"`. */
    logFormatter?: string | LogFormatter | null;
    /**
     * A built-in name (`"Json"`, `"JUnit"`, `"Html"`) or an object implementing
     * {@link ResultFormatter}, or a list of them to write several result files.
     * Each writes `results.<extension>`; formatters that share an extension
     * write `results.<name>.<extension>` instead. Default `"Json"`.
     */
    resultFormatter?: string | ResultFormatter | Array<string | ResultFormatter> | null;
    /** When false, any error in the Max console fails the suite. Default true. */
    ignoreConsoleErrors?: boolean;
    /** Log lines matching any of these are left out of the written log. */
    logOutputFilters?: Array<RegExp | string>;
    /** Console output from these object names is not captured. Default `["node.script"]`. */
    logObjectFilters?: string[];
    /**
     * Where results are written. Relative paths resolve against the folder of
     * `munit.config.js`; a `configure` dict must give an absolute path (a
     * leading `~` is expanded). Default `"<that folder>/logs"`.
     */
    outputDir?: string;
    /**
     * The suite finishes once every assert has reported and no assert has
     * registered or reported for this many milliseconds. Default 1000.
     */
    settleMs?: number;
    /**
     * Watchdog: report every unfinished assert as failed after this many
     * milliseconds. 0 disables it. Default 300000 (5 minutes).
     */
    suiteTimeout?: number;
    /**
     * How long the handler waits for every `[mUnit.teardown]` to report done
     * before it goes on (closes the patch, quits Max), in milliseconds. 0
     * doesn't wait. Default 2000.
     */
    teardownMs?: number;
    /** Write each run to its own `<outputDir>/<timestamp>/` folder. Default false. */
    runFolder?: boolean;
    /**
     * Take references: every assert with a reference (snapshots, `@reference`)
     * writes what it got as the reference, and passes. Also turned on by
     * `MUNIT_TAKE_REFERENCES=1`, `munit run --take-references` or a
     * `takeReferences 1` message. Default false.
     */
    takeReferences?: boolean;
    /** Fail the suite when an assert has `@only`, so one can't be committed by mistake. Default false. */
    forbidOnly?: boolean;
    /**
     * DSP settings applied when the suite starts and restored when it ends.
     * Default: leave DSP alone.
     */
    dsp?: DspConfig;
  }

  /**
   * The DSP settings of {@link HandlerConfig.dsp}: the audio driver by name,
   * the sample rate and the signal vector size. Each is optional; what is left
   * out keeps its current value. The tests start only once `[dspstate~]` has
   * reported DSP running on them, unchanged for half a second; if that takes
   * longer than 5 seconds plus `settleMs`, no tests run and the suite fails. A
   * change while the suite runs fails it too.
   *
   * @category Formatters and configuration
   */
  export interface DspConfig {
    /** The audio driver, named loosely: `"NonRealTime"` and `"non real time"` both work. */
    driver?: string;
    /** The sample rate in Hz. */
    sr?: number;
    /** The signal vector size in samples. */
    vs?: number;
    /** How long to wait for a driver change to take effect, in milliseconds. Default 1500. */
    settleMs?: number;
  }

  /**
   * How an assert evaluates: a JavaScript expression over `in1`..`in10`, a
   * custom script, a signal capture against a reference (`[mUnit.assert~]`),
   * or a matrix against a `.jxf` reference.
   *
   * @category Formatters and configuration
   */
  export type AssertKind = 'expression' | 'custom' | 'signal' | 'matrix';

  /**
   * One assert as registered with the handler: its attributes and what it
   * evaluates. Result formatters get the list of these as their first argument.
   *
   * @category Formatters and configuration
   */
  export class assertSettings {
    /** `@maxCalls`: how many calls the assert may take to reach a verdict. Default 1. */
    maxCalls: number;
    /** `@timeout`: milliseconds from the first input (or the suite start) before a call counts as failed; -1 (the default) for none. */
    timeout: number;
    /** `@tolerance`, custom and `@every` asserts: how many Fail results are tolerated before failing. */
    tolerance: number;
    /** `@name`, or the uuid when the assert has none. */
    name: string | null;
    /** `@suite`, or the name of the patch the assert sits in. */
    suite: string | null;
    /** `@accumulate`: inputs are summed across calls instead of replaced. */
    accumulate: boolean;
    /** `@dataInlets`: how many data inlets the assert reads (`in1`..`inN`). */
    dataInlets: number;
    /** The assert object's unique id, which the results carry too. */
    uuid: string | null;
    /** What kind of assert this is. */
    kind: AssertKind;
    /** The expression, the custom script's file name, or the reference file. */
    expression: string | null;
    /**
     * `@every`, expression asserts: every call must be true (e.g. a table of
     * cases), rather than any one of them.
     */
    every: boolean;
    /** `@skip`: report the assert as Skipped without evaluating it. */
    skip: boolean;
    /** `@only`: when any assert in the suite has it, every other one is Skipped. */
    only: boolean;
    /**
     * `@reference`, signal and matrix asserts: the reference file (next to the
     * test patch, in `references/`) the capture is compared with; null for an
     * expression.
     */
    reference: string | null;
    /**
     * `@snr`, signal asserts: the least signal-to-noise ratio, in dB, that
     * counts as a match (60 dB is about 0.1% of the signal).
     */
    snr: number;
    /**
     * `@maxLatency`, signal asserts: how many samples the capture may lead or
     * lag the reference; 0 compares them as they are.
     */
    maxLatency: number;
    /** `@exact`, signal asserts: every sample must be identical (bit-exact). */
    exact: boolean;
    /**
     * `@maxDiff`, matrix asserts: the largest difference a cell may have from
     * the reference, in the matrix's units (0-255 for char).
     */
    maxDiff: number;
    /** `@maxFraction`, matrix asserts: the largest fraction of cells (0 to 1) that may exceed `maxDiff`. */
    maxFraction: number;
  }

  /**
   * One evaluation of an assert: the verdict of that call and the inputs it saw.
   *
   * @category Formatters and configuration
   */
  export interface Run {
    /** The verdict of this call. */
    state: State;
    /** The inputs, `[in1, in2, ...]`; a long list or a matrix is summarised. */
    data: unknown[];
    /** An exception the evaluation threw, or a contract it broke. */
    error?: string;
    /**
     * What was compared, when known: from a helper (`approx`, `equals`,
     * `snapshot`) or a top-level comparison like `in1 == 1`, whose left side is
     * the actual.
     */
    expected?: unknown;
    /** The actual value of the comparison, when known. */
    actual?: unknown;
    /** The comparison's operator (`==`, `>=`, ...), when the expression was one. */
    operator?: string;
    /** Every difference, one `path: expected X, got Y` line each, from {@link diffValues}. */
    diff?: string[];
  }

  /**
   * A file kept with a failure. An assert sends `content`; the handler writes
   * it to `<output>/artifacts/<uuid>/<name>` and replaces it with `path`. An
   * assert that writes its own file (a buffer~, a matrix) sends `path` only.
   *
   * @category Custom asserts
   */
  export interface Attachment {
    /** The file name, e.g. `inputs.txt` or `actual.wav`. */
    name: string;
    /** The text to write; left out when the assert wrote the file itself. */
    content?: string;
    /** Where the file is, once written. */
    path?: string;
  }

  /**
   * A reference file to write when taking references. The handler writes
   * `content`; an assert that writes its own file (a buffer~ as a wav) sends
   * the path only.
   *
   * @category Custom asserts
   */
  export interface Recording {
    /** The reference file, as an absolute path. */
    path: string;
    /** The text to write; left out when the assert wrote the file itself. */
    content?: string;
  }

  /**
   * The result of one assert, as the handler collects it and result formatters
   * receive it in {@link finalisedResults.results}.
   *
   * @category Formatters and configuration
   */
  export class assertState {
    /** The assert's unique id, matching its {@link assertSettings.uuid}. */
    uuid: string | null;
    /** The verdict: `Success`, `Fail` or `Skipped` once the assert has finished. */
    finalState: State;
    /** How many calls the assert made. */
    count: number;
    /** How many of them returned Fail. */
    failCount: number;
    /** Whether the verdict is in (left out of the written results). */
    finished: boolean;
    /** Every call, in order. */
    runs: Run[];
    /** The expression, the custom script's file name, or the reference file. */
    expression: string | null;
    /** The custom assert's function, in the assert object only (left out of the written results). */
    expressionHandler: AssertionHandler | null;
    /** Why the assert failed (or was skipped), or null when it passed. */
    message: string | null;
    /** From the first input (or the suite start) to the verdict, in milliseconds. */
    durationMs: number | null;
    /** A failure's expected value, as in {@link Run.expected}. */
    expected?: unknown;
    /** A failure's actual value, as in {@link Run.actual}. */
    actual?: unknown;
    /** A failure's comparison operator, as in {@link Run.operator}. */
    operator?: string;
    /** A failure's differences, as in {@link Run.diff}. */
    diff?: string[];
    /** Files kept with a failure. */
    attachments?: Attachment[];
    /** Reference files written when taking references. */
    recordings?: Recording[];
  }

  /**
   * The results of a whole suite, as result formatters receive them in their
   * second argument.
   *
   * @category Formatters and configuration
   */
  export interface finalisedResults {
    /** The suite's verdict. */
    state: OverallState;
    /** How many asserts passed. */
    passCount: number;
    /** How many asserts failed. */
    failCount: number;
    /** How many asserts were skipped; they neither pass nor fail the suite. */
    skipCount: number;
    /** Every assert's result, in the order they finished. */
    results: assertState[];
    /** Suite-level problems, e.g. a suite timeout or results nobody registered. */
    errors: string[];
    /** Captured console lines with a non-zero level. */
    consoleErrors: string[];
    /** ISO timestamp of the suite start. */
    startedAt: string;
    /** How long the suite ran, in milliseconds. */
    durationMs: number;
  }

  /**
   * The options a log formatter accepts in {@link LogFormatter.configure}. A
   * marker interface: each formatter defines its own options.
   *
   * @category Formatters and configuration
   */
  export interface LogFormatterOptions {
  }

  /**
   * Renders the captured Max console log when the suite finishes, as the
   * `logFormatter` of a {@link HandlerConfig}. The built-in `"Txt"` writes the
   * lines as they were captured, to `log.txt`.
   *
   * @example
   * ```js
   * const shouting = {
   *   configure(config) {},
   *   render(log) { return log.join("\n").toUpperCase(); },
   *   fileExtension() { return "txt"; },
   * };
   * ```
   *
   * @category Formatters and configuration
   */
  export interface LogFormatter {
    /** Called once with the formatter's options, before any rendering. */
    configure(config: LogFormatterOptions | null): void;
    /** The text to write, from the captured log lines after `logOutputFilters`. */
    render(log: string[]): string;
    /** The extension of the written file, without the dot: the file is `log.<extension>`. */
    fileExtension(): string;
  }

  /**
   * The options a result formatter accepts in {@link ResultFormatter.configure}.
   * A marker interface: each formatter defines its own options.
   *
   * @category Formatters and configuration
   */
  export interface ResultFormatterOptions {
  }

  /**
   * Renders the results of a suite, as the `resultFormatter` of a
   * {@link HandlerConfig}. The built-in `"Json"` writes `results.json`,
   * `"JUnit"` writes `results.xml` for CI systems and `"Html"` writes a
   * `results.html` overview to open in a browser.
   *
   * @category Formatters and configuration
   */
  export interface ResultFormatter {
    /**
     * Names the file when another formatter in the list has the same extension:
     * `results.<name>.<extension>`. Without it the formatter's position in the
     * list (from 1) is used.
     */
    name?: string;
    /** Called once with the formatter's options, before any rendering. */
    configure(config: ResultFormatterOptions | null): void;
    /**
     * The text to write.
     * @param asserts every assert as registered, in registration order
     * @param results the suite's verdict and each assert's result
     * @param log the captured log after output filtering
     */
    render(asserts: assertSettings[], results: finalisedResults, log?: string[]): string;
    /** The extension of the written file, without the dot: the file is `results.<extension>` (see {@link HandlerConfig.resultFormatter}). */
    fileExtension(): string;
  }

  /**
   * A custom assert: the function a script named in `[mUnit.assert my.js]`
   * exports (`module.exports = assert`). It is called with the current inputs
   * `[in1, in2, ...]` and the {@link ExpressionHelpers}, and returns a
   * {@link State}, or an {@link Outcome} to report expected and actual values,
   * a message or files as well. A script that throws, or returns something
   * else, counts as Fail. Set `@dataInlets` on the object, since a script can't
   * say how many inputs it needs.
   *
   * @example
   * ```js
   * const mLib = require("libmunit");
   * function assert(data, helpers) {
   *   return helpers.approx(data[0], 0.5, 1e-3) ? mLib.State.Success : mLib.State.Fail;
   * }
   * module.exports = assert;
   * ```
   *
   * @category Custom asserts
   */
  export type AssertionHandler = (data: unknown[], helpers: ExpressionHelpers) => State | Outcome;

  /**
   * The helpers in scope in an expression (`approx(in1, 0.5)`) and passed to a
   * custom assert as its second argument. The comparisons (`approx`, `equals`,
   * `snapshot`, `sameMatrix`) record what they compared, so a failure reports
   * expected and actual values and the differences without more work. The
   * measures (`rms`, `peak`, ...) are the library functions of the same name.
   *
   * @category Custom asserts
   */
  export interface ExpressionHelpers {
    /**
     * Whether `actual` equals `expected` within a tolerance, compared like
     * {@link deepEqual}: lists item by item, dicts key by key. The tolerance
     * is the larger of `abs` (default 1e-6) and `rel * |expected|` (default 0).
     */
    approx: (actual: unknown, expected: unknown, abs?: number, rel?: number) => boolean;
    /** Whether `actual` equals `expected` exactly, compared like {@link deepEqual}. */
    equals: (actual: unknown, expected: unknown) => boolean;
    /**
     * Whether `actual` matches the reference `<patch folder>/references/<name>.json`.
     * The name defaults to the assert's `@name`; it must have one or be given
     * one here, and the patch must be saved, or the helper throws. With no
     * reference yet the check fails and says how to take one; when taking
     * references the value is written as the reference and the check passes.
     */
    snapshot: (actual: unknown, name?: string) => boolean;
    /** The root mean square, as {@link rms}. */
    rms: (values: unknown) => number;
    /** The largest absolute value, as {@link peak}. */
    peak: (values: unknown) => number;
    /** The mean, as {@link dcOffset}. */
    dc: (values: unknown) => number;
    /** The largest absolute difference between two lists, as {@link maxDiff}. */
    maxDiff: (actual: unknown, expected: unknown) => number;
    /** The signal-to-noise ratio in dB, as {@link snrDb}. */
    snr: (actual: unknown, reference: unknown) => number;
    /**
     * The frequency in Hz of a captured signal, as {@link frequency} at the
     * capture's sample rate. Signal asserts (`[mUnit.assert~]`) only: anywhere
     * else it throws, since there is no sample rate.
     */
    freq: (values: unknown) => number;
    /** The smallest value in one plane (default 0) of a matrix, as {@link planeStats}. */
    planeMin: (matrix: unknown, plane?: number) => number;
    /** The mean of one plane (default 0) of a matrix, as {@link planeStats}. */
    planeMean: (matrix: unknown, plane?: number) => number;
    /** The largest value in one plane (default 0) of a matrix, as {@link planeStats}. */
    planeMax: (matrix: unknown, plane?: number) => number;
    /** One cell of a matrix, as {@link matrixCell}: its planes as a list, or one plane's value. */
    cell: (matrix: unknown, x: number, y?: number, plane?: number) => number | number[];
    /**
     * Whether two matrices match, as {@link matchMatrix} with `maxDiff` and
     * `maxFraction` (both default 0: identical). Records a check, so a failure
     * reports both shapes and how many cells differed.
     */
    sameMatrix: (actual: unknown, expected: unknown, maxDiff?: number, maxFraction?: number) => boolean;
  }

  /**
   * What a custom assert returns instead of a bare {@link State} to say more
   * about a call: a message, the expected and actual values, and files to keep
   * with a failure. Only `state` is required. Details given here replace what
   * the helpers recorded.
   *
   * @example
   * ```js
   * return {
   *   state: mLib.State.Fail,
   *   message: "the inputs should add up to 10",
   *   expected: 10,
   *   actual: sum,
   *   attachments: [{ name: "inputs.txt", content: values.join("\n") }],
   * };
   * ```
   *
   * @category Custom asserts
   */
  export interface Outcome {
    /** The verdict of this call. */
    state: State;
    /** Replaces the default description of a failure in the results and the console. */
    message?: string;
    /** An exception, or a contract the evaluator broke; reported as an error rather than a failure. */
    error?: string;
    /** The value the assert expected. */
    expected?: unknown;
    /** The value it got. */
    actual?: unknown;
    /** The comparison's operator, when there was one. */
    operator?: string;
    /** Every difference, one `path: expected X, got Y` line each, as from {@link diffValues}. */
    diff?: string[];
    /** Files to keep with a failure. */
    attachments?: Attachment[];
    /** Reference files written when taking references. */
    recordings?: Recording[];
  }

  /**
   * How far two numbers may be apart and still match: the larger of the
   * absolute and the relative allowance wins.
   *
   * @category Measures
   */
  export interface Tolerance {
    /** Largest allowed absolute difference. */
    abs: number;
    /** Largest allowed difference relative to `|expected|`. */
    rel: number;
  }

  /**
   * The tolerance `approx` and {@link approxEqual} use by default: 1e-6 absolute, no relative part.
   *
   * @category Measures
   */
  export const DEFAULT_TOLERANCE: Readonly<Tolerance>;

  /**
   * Whether two numbers match within a tolerance. Equal values match whatever
   * the tolerance, including the infinities; an infinite value matches nothing
   * else, and NaN never matches.
   * @param actual the measured value
   * @param expected the value it should have
   * @param tolerance defaults to {@link DEFAULT_TOLERANCE}
   * @category Measures
   */
  export function approxEqual(actual: number, expected: number, tolerance?: Tolerance): boolean;

  /**
   * Every difference between two values, one `path: expected X, got Y` line
   * each (the path starts at `$`), or `[]` when they match. Numbers match
   * within the tolerance (exact by default), lists item by item, dicts key by
   * key in any order. Symbols are strings, so they match exactly. After 20
   * lines the rest are summed up as `... and N more difference(s)`.
   * @param actual the value under test
   * @param expected the value it should equal
   * @param tolerance for the numbers inside; exact by default
   * @category Measures
   */
  export function diffValues(actual: unknown, expected: unknown, tolerance?: Tolerance): string[];

  /**
   * Whether two values are equal, compared as {@link diffValues} does: lists
   * item by item, dicts key by key, numbers within the tolerance (exact by
   * default).
   *
   * @category Measures
   */
  export function deepEqual(actual: unknown, expected: unknown, tolerance?: Tolerance): boolean;

  /**
   * The root mean square of a list of numbers (a captured signal channel); 0
   * for no samples. A single number counts as a list of one.
   * @throws TypeError when `values` isn't a number or a list of them
   * @category Measures
   */
  export function rms(values: unknown): number;

  /**
   * The largest absolute value in a list of numbers; 0 for no samples.
   * @throws TypeError when `values` isn't a number or a list of them
   * @category Measures
   */
  export function peak(values: unknown): number;

  /**
   * The mean of a list of numbers, i.e. the DC offset of a signal; 0 for no
   * samples. The `dc` helper.
   * @throws TypeError when `values` isn't a number or a list of them
   * @category Measures
   */
  export function dcOffset(values: unknown): number;

  /**
   * The largest absolute difference between two lists of numbers, sample by
   * sample.
   * @throws RangeError when the lists differ in length
   * @category Measures
   */
  export function maxDiff(actual: unknown, expected: unknown): number;

  /**
   * The signal-to-noise ratio in dB of `actual` against a reference, where the
   * noise is their difference: `Infinity` when they are identical, `-Infinity`
   * when the reference is silent. The `snr` helper. 60 dB means the difference
   * is about 0.1% of the signal.
   * @throws RangeError when the lists differ in length
   * @category Measures
   */
  export function snrDb(actual: unknown, reference: unknown): number;

  /**
   * The frequency in Hz of a signal, from its positive-going zero crossings,
   * interpolated between samples so a short capture still gives a precise
   * estimate. 0 with fewer than two crossings. The `freq` helper.
   * @param values the samples
   * @param sampleRate the rate they were captured at, in Hz
   * @throws RangeError when the sample rate is not above 0
   * @category Measures
   */
  export function frequency(values: unknown, sampleRate: number): number;

  /**
   * How {@link matchSignal} compares a capture with a reference: the `@snr`, `@maxLatency` and `@exact` attributes of a signal assert.
   *
   * @category Measures
   */
  export interface SignalMatchOptions {
    /** The least signal-to-noise ratio, in dB, that passes. */
    snrDb: number;
    /** Samples of lead or lag to search; 0 compares in place. */
    maxLatency: number;
    /** Every sample must be identical; `snrDb` is then ignored. */
    exact: boolean;
  }

  /**
   * What {@link matchSignal} found.
   *
   * @category Measures
   */
  export interface SignalMatch {
    /** Whether the capture matches within the options. */
    pass: boolean;
    /** The signal-to-noise ratio after alignment, in dB; `Infinity` when identical. */
    snrDb: number;
    /** The largest difference between any pair of samples after alignment. */
    maxDiff: number;
    /** The lag, in samples, the capture was shifted by: positive when it was late. */
    latency: number;
    /** How many samples were compared after alignment. */
    samples: number;
  }

  /**
   * Compares a captured channel with a reference channel, aligning them first
   * (by cross-correlation, within `maxLatency` samples) when the options allow.
   * Channels of different lengths compare over their overlap. This is what a
   * signal assert with `@reference` does per channel.
   *
   * @category Measures
   */
  export function matchSignal(actual: unknown, reference: unknown, options: SignalMatchOptions): SignalMatch;

  /**
   * The cell types of a Jitter matrix this library can hold.
   *
   * @category Matrices
   */
  export type MatrixType = 'char' | 'long' | 'float32' | 'float64';

  /**
   * The shape of a matrix: its dimensions, plane count and cell type.
   *
   * @category Matrices
   */
  export interface MatrixShape {
    /** The dimensions, e.g. `[320, 240]`. */
    dim: number[];
    /** How many planes each cell has (4 for ARGB). */
    planes: number;
    /** The cell type. */
    type: MatrixType;
  }

  /**
   * A Jitter matrix as a value: what a `jit_matrix` on a data inlet arrives as,
   * in expressions, custom asserts and the matrix helpers. Cells are stored as
   * Jitter does, planes interleaved and the first dimension fastest:
   * `data[((y * width + x) * planes) + plane]` for a 2D matrix.
   *
   * @category Matrices
   */
  export interface MatrixData extends MatrixShape {
    /** Every value, `dim[0] * dim[1] * ... * planes` of them. */
    data: ArrayLike<number>;
  }

  /**
   * Whether a value is a {@link MatrixData}: a matrix from a data inlet or a reference file.
   *
   * @category Matrices
   */
  export function isMatrix(value: unknown): value is MatrixData;

  /**
   * A matrix's shape without its cells, for messages and results.
   *
   * @category Matrices
   */
  export function describeMatrix(m: MatrixData): MatrixShape;

  /**
   * The statistics of one plane of a matrix, from {@link planeStats}.
   *
   * @category Matrices
   */
  export interface PlaneStats {
    /** The smallest value in the plane. */
    min: number;
    /** The mean of the plane. */
    mean: number;
    /** The largest value in the plane. */
    max: number;
  }

  /**
   * The smallest, mean and largest value of one plane of a matrix; all 0 for
   * an empty matrix. Behind the `planeMin`, `planeMean` and `planeMax` helpers.
   * @param value a {@link MatrixData}
   * @param plane the plane, numbered from 0
   * @throws TypeError when `value` isn't a matrix
   * @throws RangeError when the matrix has no such plane
   * @category Matrices
   */
  export function planeStats(value: unknown, plane?: number): PlaneStats;

  /**
   * One cell of a matrix: its planes as a list, or one plane's value when
   * `plane` is given. The `cell` helper.
   * @param value a {@link MatrixData}
   * @param x the column
   * @param y the row, for a 2D matrix
   * @param plane one plane, numbered from 0
   * @throws TypeError when `value` isn't a matrix
   * @throws RangeError when the cell is outside the matrix, or the matrix has no such plane
   * @category Matrices
   */
  export function matrixCell(value: unknown, x: number, y?: number, plane?: number): number | number[];

  /**
   * How {@link matchMatrix} compares two matrices: the `@maxDiff` and `@maxFraction` attributes of a matrix assert.
   *
   * @category Matrices
   */
  export interface MatrixMatchOptions {
    /** The largest difference a cell may have, in the matrix's units (0-255 for char). */
    maxDiff: number;
    /** The largest fraction of cells (0 to 1) that may exceed `maxDiff`. */
    maxFraction: number;
  }

  /**
   * What {@link matchMatrix} found.
   *
   * @category Matrices
   */
  export interface MatrixMatch {
    /** Whether the matrices match within the options. */
    pass: boolean;
    /** False when the dimensions, plane count or type differ; nothing else is compared then. */
    sameShape: boolean;
    /** The largest difference between any pair of values. */
    maxDiff: number;
    /** How many cells have a value over `maxDiff`. */
    differing: number;
    /** `differing` as a fraction of all cells. */
    fraction: number;
    /** How many cells the matrices have. */
    cells: number;
  }

  /**
   * Compares two matrices cell by cell, like the perceptual rule "at most 0.1%
   * of pixels differ by more than 2/255" (`maxDiff` 2, `maxFraction` 0.001). A
   * cell counts as differing once, however many of its planes are over. This is
   * what a matrix assert with `@reference` does, and the `sameMatrix` helper.
   *
   * @category Matrices
   */
  export function matchMatrix(actual: MatrixData, expected: MatrixData, options: MatrixMatchOptions): MatrixMatch;
}
