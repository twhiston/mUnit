# mUnit: unit testing for Max

Unit testing max is tricky business, it's a graphical language made for quick
iteration over creative ideas, and most of the time you might not care about how
well tested something is. However, if you start to move those ideas towards
larger systems, developing a big performance system, or some abstractions which
need to conform to a particular standard, or if you're making a max package
yourself and you want to make sure that the behaviour of some element of it
doesn't change as you iterate its design, then it's really useful to make some
repeatable tests which you can run to validate behaviour. This is where mUnit
comes in. It gives you the tools to make easy assertions about your max patches,
and produces both human readable and ci consumable results. mUnit tests Max
patches from inside Max and this document, and the help and example patchers
will help to explain it. Although on it's surface it's a simple suite of 8
objects, what you can do with them is very powerful, and is very customisable.

Put `[mUnit.assert]` objects in a test patch, feed them values, signals or
matrices, and mUnit reports which passed and which failed, in the Max console
and as JSON or JUnit files a CI server can read. `munit`, the cli that comes
with it, bootstraps a test folder, runs a suite in Max and exits with a pass or
fail code, and lints patcher files against rules you write, with or without Max.

## What's in the package

### Objects

- `[mUnit.assert]`: checks inputs against an expression, a custom script or a
  reference file.
- `[mUnit.assert~]` and `[mUnit.stimulus~]`: the same for signals, with
  repeatable test signals.
- `[mUnit.handler]`: runs a suite and writes the results.
- `[mUnit.harness]`: opens every test patch in a folder and runs them as one
  suite.
- `[mUnit.loadbang]` and `[mUnit.teardown]`: start a test once mUnit is ready,
  and clean up after it.
- `[mUnit.lint]`: lints the patchers in a folder each time you save one.

### Extras

- **mUnit Overview** - help patchers, example patchers and this
- **mUnit Lint Server** - lints whatever you save while it is open.

### CLI

Add an alias to the cli script to your shell to get access to munit from your
command line, including running tests, bootstrapping test directories and
linting your patchers.

### Documentation

- Help patchers and reference files for each object (really an abstraction!)
- This README
- `api/` folder with Typescript types and markdown documentation of all user
  facing functionality in the code

## Installing

### Package

mUnit needs Max 9. Pick one:

- Get the package from the max package manager (hopefully!)
- Download `mUnit-vX.Y.Z.zip` from the
  [releases](https://github.com/twhiston/mUnit/releases), unzip it, and move the
  `mUnit` folder into `Documents/Max 9/Packages`.

Restart Max afterwards.

### CLI

If you have the package installed locally you don't need to also get the cli
seperately. You can simply add an alias to you .zshrc or powershell profile to
the script which is included in this package

```bash
alias munit="$HOME/Documents/Max 9/Packages/mUnit/javascript/nodejs/runner/munit-cli.js"
```

For the command line in a project or CI job, install it from npm:
`npm install --save-dev munit-cli` (see *Running from the command line*).

## Quick start

### First steps

1. Make a folder for your tests `tests/`, with a `patchers` folder inside it.
2. In `patchers`, save a patch that sends a value into an assert once mUnit is
   ready:

   ```text
   [mUnit.loadbang]
   |
   [1]
   |
   [mUnit.assert in1 == 1 @name equalsOne]   <- into the second inlet (in1)
   ```

3. Run it from a terminal (Max must be installed; the runner starts and quits
   it): `munit run path/to/tests`. It prints an `ok` line for `equalsOne` and
   exits with 0. Change the message to `2` and it prints `FAIL` with the reason,
   and exits with 1.

4. Run it inside Max instead, save a patch next to `tests/` containing
   `[mUnit.harness @loadFolder tests]` and `[mUnit.handler]`, and open it.

From here, the help patcher of each object and the examples (below) cover
everything else.

### Recommended test suite workflow

- bootstrap a test space in your project with `munit init`
- edit the munit.config.js and munit-lint.json
- make some tests in the `patchers/` folder
- open the test wrangler, or run the tests from the cli
- inspect the output

## Examples

The package's `examples` folder has a patch for each feature; **Extras > mUnit
Overview** opens any of them. Each folder is also a runnable suite:
`munit run <folder>/<patch>`. Many examples write results, references or failure
files next to themselves: the **open folder** button in each one shows its
folder in Finder or Explorer.

- `simpleConfigExample`: the assert attributes (@maxCalls, @timeout,
  @accumulate, @dataInlets, @name, @suite) and a config dict.
- `expectedActualExample`: failures with expected versus actual, the helpers
  (approx, equals, the measures), symbol and list inputs.
- `tableOfCasesExample`: one assert over a table of cases with @every, @maxCalls
  and @tolerance.
- `snapshotExample`: dict inputs, snapshots against a reference file, taking
  references.
- `skipAndOnlyExample`: @skip, @only and forbidOnly.
- `customAssert`, `failureFilesExample`: custom asserts in JavaScript, with
  details and files kept with a failure, linked from JUnit.
- `teardownExample`: [mUnit.teardown], plain and with @hold 1.
- `signalExample`: [mUnit.stimulus~] and [mUnit.assert~], measured and against
  wav references, under the non-realtime driver.
- `jitterExample`: matrices from jit.op, a jit.pix shader and a jit.gl.pix
  shader read back from the GPU, measured and against .jxf references.
- `loadInFolderExample`, `sequentialHarnessExample`: [mUnit.harness] over a
  folder of tests, all at once or one at a time, with @pattern and @recursive,
  and the command line.
- `externalConfigExample`, `customLogger`, `JUnitResultsExample`,
  `consoleErrorExample`: configuration, formatters and console errors.
- `lintExample`, `lintConfigExample`: [mUnit.lint] linting a folder as you save,
  and which `munit-lint.json` applies in a project of several folders.

Every object also has a help patcher (right-click the object and choose Open
Help, or option-click it) and a reference page in Max's Reference sidebar. The
help patchers run their examples as a suite when they open; keep one open at a
time, since asserts register with whichever handler is running.

## Core Components

mUnit is comprised of eight abstractions which allow you to make assertions, run
a testing server and run a max patch linter.


## Assert

`[mUnit.assert]` is what you send inputs into, to be checked against an
expression. (`[assert]` still works: `init/object-mappings.txt` maps the old
name to it.) Any JavaScript expression is supported. Use `in1` to `in10` in the
expression to refer to the inputs, e.g.

```Javascript
in2 > in1
```

Inputs are passed to the expression as values, so ints, floats, symbols and
lists all work: `in1 === 'foo'`, `in1 === 0.5` and `in1.length === 3` do what
they say. The expression passes when it returns exactly `true`. If it throws,
that call fails and the error is recorded in the results. Write string literals
with single quotes: Max strips double quotes from the arguments of an object
box, so `in1 === "foo"` reaches the expression as `in1 === foo`.

Patch test inputs into inlet 2 onwards: the second inlet is `in1`, the third
`in2`, and so on. The assert keeps as many data inlets as the highest `inN` the
expression uses (at least one), up to 10. `in1` is the hot inlet: a value there
evaluates the expression with the latest values of the other inputs, and a
`bang` there evaluates again with the stored values.

If you do not supply an expression the default is used:

```Javascript
in1 === 1
```

### Expected versus actual

A failure says what was compared, not only which inputs arrived. For an
expression whose top level is one comparison, the left side is the actual value
and the right side the expected one:

```
in1 * 2 == in2 was not true after 1 of 1 call(s): expected 5, got 6; last inputs [3,5]
```

The result (JSON and JUnit) also carries `expected`, `actual`, `operator` and,
for lists and dicts, `diff`, one line per difference. An expression joined with
`&&` or `||` isn't split; use the helpers below to get the details there.

### Helpers

Expressions can use these helpers, which take `(actual, expected)`:

| Helper | Passes when |
|---|---|
| `approx(a, e, abs = 1e-6, rel = 0)` | numbers, lists or dicts match, numbers within `max(abs, rel * abs(e))` |
| `equals(a, e)` | lists, dicts and symbols match exactly, dict keys in any order |
| `snapshot(a, name?)` | `a` matches the reference file (see below) |

and these measures, for lists of numbers: `rms(x)`, `peak(x)` (largest absolute
value), `dc(x)` (the mean), `maxDiff(a, e)` and `snr(a, reference)` (in dB).
Signal asserts (`[mUnit.assert~]`, below) also have `freq(x)`, the frequency in
Hz.

```Javascript
approx(in1, 0.5, 0.001)
equals(in1, [1, 2, "three"])
rms(in1) < 0.1 && peak(in1) <= 1
```

When a helper fails, its expected value, actual value and differences are what
the failure reports. Quote an expression that contains commas, e.g.
`[mUnit.assert "approx(in1, 0.5, 0.001)"]`, so Max keeps it as one argument.

### Dicts and snapshots

A dict sent to a data inlet arrives as an object, so expressions can read it:
`in1.name === 'munit'`. `snapshot(in1)` compares it (or any list or value) with
a reference file next to the test patch:

```
tests/
  my_test.maxpat               [mUnit.assert snapshot(in1) @name settings]
  references/settings.json
```

The reference is named after `@name` (the default UUID changes every load, so a
snapshot needs one), or after the second argument:
`snapshot(in1, "presets/default")` uses `references/presets/default.json`. A
missing reference fails with a message saying how to take it. On a failure the
actual value is written next to the results (see *Failure files*).

To take references, or to retake changed ones, run with
`munit run --take-references`, `MUNIT_TAKE_REFERENCES=1`, `takeReferences: true`
in the config, or a `takeReferences 1` message to `[mUnit.handler]`. Every
snapshot, matrix and signal assert with a reference then writes what it got as
the reference, and passes. Review the changed files before committing them.

### Tables of cases

`@every 1` makes an expression pass only when *every* call is true, rather than
any one of them. Together with `@maxCalls` it checks a table of cases:

```
[1 2, 2 4, 3 6]          one row per message: input, expected
|
[unpack 0 0]
|          \
[* 2]       \             the unit under test
|            \
[mUnit.assert in1 == in2 @every 1 @maxCalls 3]
```

It fails on the first false case, and says which call it was.

### Custom asserts

Instead of an expression you can pass the name of a JavaScript file. The script
must export a function that takes the current inputs as an array
(`[in1, in2, ...]`) and returns a `State` from `libmunit`. Its second argument
holds the helpers (`approx`, `equals`, `snapshot`, `rms`, ...), whose failures
are reported as with expressions. To report your own details, return
`{ state, expected, actual, message }` instead of a `State`. For example, to
check that every input is unique:

```Javascript
const mLib = require("libmunit");
const seen = [];
function assert(data) {
  const found = seen.includes(data[0]);
  seen.push(data[0]);
  return found ? mLib.State.Fail : mLib.State.Continue;
}
module.exports = assert;
```

How a custom assert reaches its verdict:

- `Success` passes the assert straight away.
- `Fail` fails the assert straight away, unless `@tolerance` allows more Fails.
- `Continue` means "no verdict yet". An assert that reaches `@maxCalls` without
  failing passes.
- `Skipped` skips the assert, e.g. when what it tests isn't available.

A script that throws, or returns something other than a `State`, counts as
`Fail`. Custom asserts can't work out how many inputs they need, so set
`@dataInlets`.

### Attrs

@maxCalls (default 1) - how many inputs the assert evaluates. An expression
assert fails once it has been false this many times; a custom assert passes once
it reaches this many calls without failing. After the verdict, further inputs
are ignored (and logged).

@tolerance (default 0) - custom and `@every` asserts: how many `Fail` results
are tolerated before the assert fails.

@every (default false) - expression asserts: every call must be true, up to
`@maxCalls`, instead of any one of them. See *Tables of cases*.

@skip (default false) - report the assert as skipped without evaluating it. Its
box turns yellow.

@only (default false) - when any assert in the suite has `@only`, every other
one is reported as skipped. Set `forbidOnly: true` in CI so one can't be
committed by mistake.

@name (default: the UUID) - a name for the test, used in logs and results. Every
assert also has a UUID, which changes on each run and appears in all logging, so
you can tie the log and the result files together.

@suite (default: the parent patcher name) - the suite the test belongs to.

@accumulate (default false) - sum (or, for symbols, concatenate) each input over
successive calls before evaluating. Expression asserts only.

@dataInlets (default 1) - custom asserts only: how many data inlets to keep.

@timeout (default none) - in ms, how long the assert may take. The clock starts
when the suite starts (when `[mUnit.loadbang]` fires) or at the first input,
whichever comes first, not when the patch loads. A timeout counts as a failed
call and the clock restarts until `@maxCalls` is reached, so
`@timeout 2000 @maxCalls 3` allows up to 6 seconds. Values of 0 or less are
rejected.

### Assert Logging

Log messages from assert objects follow a strict formatting of

```Javascript
"munit" suite uuid name ":" msg
```

In general log messages will appear in the output log in the format of

```
time : date - callsite : level(numerical) : message
```

which means that an assert log line may look like

```
12:3:5 : 29/9/2026 - v8 : 0 : munit customEverything 1108 defaultTest : Assert Complete Success
```

## Matrices: Jitter in mUnit.assert

A `jit_matrix` on a data inlet of `[mUnit.assert]` arrives as a value with
`dim`, `planes`, `type` and every cell, so Jitter output is tested with the same
object as everything else:

```
[jit.matrix 1 float32 64 64]
|
[jit.op @op * @val 2.]
|
[mUnit.assert "approx(planeMean(in1, 0), 0.5, 0.02) && in1.dim[0] == 64" @name doubled]
```

- `in1.dim`, `in1.planes` and `in1.type` are the shape. The helpers
  `planeMin(m, plane)`, `planeMean(m, plane)` and `planeMax(m, plane)` give a
  plane's statistics (planes from 0), `cell(m, x, y, plane)` one cell (or all
  its planes without `plane`), and `sameMatrix(a, e, maxDiff, maxFraction)`
  compares two matrices with the tolerances below and reports the differences
  when it fails. Char cells are 0 to 255.
- `@reference <file.jxf>`: compare the matrix with `references/<file>` next to
  the test patch, a Jitter matrix file. `@maxDiff` (default 0) is the largest
  difference a cell may have, `@maxFraction` (default 0) the largest fraction of
  cells that may exceed it: `@maxDiff 2 @maxFraction 0.001` is the perceptual
  rule "at most 0.1% of pixels differ by more than 2/255", which is what GPU
  output needs, since drivers differ. A failure keeps the matrix as `actual.jxf`
  and `actual.png`, the difference as `diff.png`, and links the reference. Take
  references with `munit run --take-references`.
- In the results a matrix appears as its shape and cell count, not cell by cell.

GL output is tested by reading it back into a matrix: `[jit.gl.pix]` or a
`[jit.gl.texture]` sent to a `[jit.matrix]`, or `[jit.gl.asyncread]` after a
`[jit.gl.render]`. The render context must be a visible destination; a named
`[jit.pwindow]` in the test patch is enough, and needs no extra window (a hidden
`[jit.window]` and a `jit.matrix` destination give nothing back). Drive frames
yourself, one bang per frame from a `[metro]`, rather than leaving it to the
display: each frame is one call of the assert, so `@maxCalls 6` tries up to six
frames and passes at the first match, and an `[mUnit.teardown]` stops the metro.
The machine running GL tests needs a display and a logged-in session.

## Signals: mUnit.assert~ and mUnit.stimulus~

`[mUnit.assert~]` is an assert for signals. It records its signal inlets into
its own `buffer~` and then hands each channel to the assert as `in1` and `in2`,
so everything above applies to the samples: expressions, the helpers and custom
scripts. Inlets: control (a bang starts the capture), signal 1, signal 2. The
outlet bangs once the capture has been evaluated.

```
[mUnit.stimulus~ @type sine @freq 440.]
|
[lores~ 1000 0.5]
|
[mUnit.assert~ "approx(freq(in1), 440, 1) && rms(in1) > 0.2" @duration 200 @name filtered]
```

- `@duration <ms>` (default 1000): how much to record. The capture starts when
  the suite starts (`@trigger auto`, the default) or on a bang to the control
  inlet (`@trigger manual`), at the next signal vector, and the assert evaluates
  when the last sample is in. Give it a `@timeout` so a suite with DSP off still
  ends.
- `@channels <1|2>` (default 1): how many signal inlets to capture; `in2` is the
  second.
- The expression (default `rms(in1) > 0`) sees each channel as a list of
  samples. Besides `rms`, `peak`, `dc`, `maxDiff` and `snr`, signal asserts have
  `freq(in1)`: the frequency in Hz from the zero crossings, precise to a
  fraction of a Hz even for a short capture. A custom script receives the
  channels as arrays.
- `[gen~]`, `[poly~]` and `[rnbo~]` are ordinary signal objects here: patch one
  between a stimulus and an assert and it is tested like any MSP object, whether
  the Gen code is embedded or loaded from a `.gendsp` file.
  `examples/genExample` does both. (Testing a `gen~` export outside Max is a
  separate story, still to come.)
- `@reference <file.wav>`: compare the capture with `references/<file>` next to
  the test patch instead of evaluating an expression. The capture passes when
  its signal-to-noise ratio against the reference is at least `@snr` dB (default
  60, about 0.1% of the signal); `@exact 1` demands identical samples instead.
  `@maxLatency <samples>` (default 0) lets the capture lead or lag the reference
  by up to that many samples; the alignment is found by cross-correlation and
  reported as `latency`. A failure says the SNR, the largest difference and the
  latency, and keeps the capture as `actual.wav` in the run's `artifacts/`
  folder, next to a link to the reference. Missing references are taken the same
  way as snapshots: `munit run --take-references`. References are compared at
  the suite's sample rate; set one with the `dsp` config so every machine
  captures the same thing. When there is no such file in `references/`, a file
  of that name on Max's search path is read instead, e.g.
  `@reference jongly.aif` compares with the sound Max ships with (at 44.1 kHz);
  `--take-references` still writes to `references/`.
- In the results, a captured channel appears as a summary (length, rms, peak and
  the first samples), not sample by sample.

`[mUnit.stimulus~]` makes a repeatable test signal, started at the same moment
as the capture (`@trigger auto`, or a bang with `@trigger manual`; `stop` stops
it). It is computed sample by sample from a counter in gen~, so two runs give
the same samples.

- `@type sine` (default) at `@freq` Hz and `@amp` (default 1).
- `@type impulse`: one sample of `@amp`, then silence.
- `@type sweep`: a linear sweep from `@freq` to `@freq2` over `@duration` ms.
- `@type noise`: white noise from `@seed`, the same every run.
- `@type silence`.
- `@type file @file <sound file>`: a sound file played once.

### DSP for a suite

Signal tests need DSP running. Rather than leaving that to each patch, the `dsp`
config applies settings when the suite starts and puts the previous ones back
when it ends:

```javascript
dsp: { driver: "NonRealTime", sr: 48000, vs: 64 }
```

`driver` is an audio driver by name as the Audio Status window lists it;
`NonRealTime` renders as fast as the machine can, needs no audio hardware and
makes the suite the same on every run, which is what CI wants. `sr` and `vs` are
the sample rate and signal vector size. Each is optional. The handler switches
DSP on after they are applied and, since Max keeps the driver in its
preferences, restores everything after the teardowns. `settleMs` (default 1500)
is how long a driver change gets to take effect.

## mUnit.loadbang

One complication of note in a node based test system is that if you try to
[loadbang] things in a test patch the time it takes to start the node process
means that an assertion may be missed by the test server. This is purely due to
the loadbang being too fast for the v8 and node.script objects that comprise the
test framework.

Because of this it is advisable to never use a loadbang in a test file, and
using the `mUnit:tests` inbuilt ruleset for the linter will enforce this.

The [mUnit.loadbang] abstraction sends a bang once the test framework is ready,
meaning the handler's node.script has started and been configured. It works
whether the patch is opened before or after that moment, which makes it
especially useful in setups where the harness opens multiple test patches. Send
it `reset` to re-arm it, or `bang` to fire it by hand.

For single-patch tests that also contain [mUnit.handler], the handler has an
outlet which bangs at the same moment. `[r munit.loadbang]` also receives that
bang, but only in patches that are already open when it is sent; prefer
[mUnit.loadbang], which does not have that limitation.


## mUnit.teardown

`[mUnit.teardown]` is the counterpart of `[mUnit.loadbang]`: it bangs once the
handler has frozen the results of the patch it is in, so the patch can clean up
(stop DSP, close files, reset a global). Connect its outlet to the cleanup.

```
[mUnit.teardown]
|
[stop(   ->  [s dsp]
```

When it fires depends on how the suite runs. In the usual case, every patch open
at once, it fires after the result files are written, and before the harness
closes the patches or the command-line runner quits Max. With
`[mUnit.harness @sequential 1]` it fires after the patch's asserts have settled
and before that patch is closed, while the suite goes on; the files are written
at the end as usual. Either way the results are already final: a teardown can't
change a verdict.

The handler waits for every teardown to report done before it goes on, up to
`teardownMs` (see the configuration; default 2000ms), and warns in the console
about any that didn't. By default an object reports done as soon as its outlet
has fired. For cleanup that takes time, `[mUnit.teardown @hold 1]` waits for a
message (`done`, or anything) on its inlet instead:

```
[mUnit.teardown @hold 1]
|
[delay 500]  ...  [done(
                  |
             (back into the teardown's inlet)
```

Console errors while teardowns run are kept in the log but never fail the suite,
even with `ignoreConsoleErrors` off. In sequential mode an assert fed by a
teardown would still register a result, since the suite isn't finished yet;
don't drive asserts from a teardown.

## mUnit.handler

The Handler orchestrates a suite of tests, either in the current patch for small
test suites, or from a test harness patch which will be used to set up running
more complex test scenarios.

A run finishes exactly once: when every registered assert has reported and no
assert has registered or reported for `settleMs` (so late patches, and the
console output of the last test, are included), or when `suiteTimeout` expires.
On a timeout every unfinished assert is reported as failed, so a CI run always
ends. The result files are fully written before the handler sends `finished`.

Each assert is posted to the Max console as it finishes (`ok`, `FAIL` with the
reason, or `skip`), and the command-line runner prints the same lines.

### Configuration

The preferred way to configure the handler is a `munit.config.js` file in the
root folder of your tests. Every key is optional:

```Javascript
/** @type {import("libmunit").HandlerConfig} */
const config = {
  logFormatter: "Txt",         // or a formatter object
  resultFormatter: "Json",     // "Json", "JUnit", "Html", a formatter object, or a list of them
  ignoreConsoleErrors: true,
  logOutputFilters: [],        // regexes; matching lines are left out of the log
  logObjectFilters: ["node.script"],
  outputDir: "./logs",         // relative to this file's folder
  settleMs: 1000,
  suiteTimeout: 300000,        // 0 disables it
  teardownMs: 2000,            // wait for [mUnit.teardown] hooks; 0 doesn't wait
  dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },  // optional: DSP for signal tests, restored afterwards
  runFolder: false,            // true: each run writes to <outputDir>/<timestamp>/
  takeReferences: false,       // true: asserts write their references instead of comparing
  forbidOnly: false,           // fail the suite if any assert has @only
};
module.exports = config;
```

`[mUnit.harness]` tells the handler to load this file when the patch opens. The
file is read fresh each time, so reopening the patch picks up edits without
restarting node.script. Without the file, the defaults above apply.

You can also send a dict to the handler's first inlet, prepended by the
`configure` message. A dict has no folder to resolve relative paths against, so
`outputDir` must be absolute (a leading `~` is expanded):

```JSON
{
    "resultFormatter": "JUnit",
    "outputDir": "~/my-tests/logs"
}
```

An invalid configuration is rejected with a message in the Max console that says
what is wrong, and the tests do not start. Unknown keys are reported as
warnings, since they are usually typos.

#### Log Formatter

The log formatter is used to render the output of the logs when the tests are
finished. You can use this to conform the log messages to a specific format, for
example if your cloud provider shows logs in a special way in the console.

The default, `"Txt"`, writes the log lines to `log.txt` as they were captured.
Formatter names are not case-sensitive.

To implement your own log formatter implement the following interface:

```Typescript
interface LogFormatterOptions { }
interface LogFormatter {
    configure(config: LogFormatterOptions): void
    render(log: string[]): string
    fileExtension(): string
}
```

#### Result Formatter

The result formatter tells the handler how to render the results. The default is
`"Json"`.

Give a list to write several result files from one run, e.g.
`resultFormatter: ["JUnit", "Html"]` writes `results.xml` for CI and
`results.html` to read. Each formatter writes `results.<extension>`. When two
formatters have the same extension, each of those writes
`results.<name>.<extension>` instead: a built-in by the name you gave
(`results.junit.xml`), a custom formatter by its `name` property, or by its
position in the list (`results.2.xml`) when it has none. An empty list means
`"Json"`.

`"JUnit"` writes `results.xml` in the format described
[here](https://github.com/testmoapp/junitxml), for CI systems. Each suite
becomes a `<testsuite>`, and each failure carries its message, a type
(`AssertionFailure`, `Timeout` or `Exception`) and the recorded inputs.
Suite-level problems, such as a suite timeout, appear as errors in an extra
`mUnit` suite, whose `<system-out>` holds the captured log.

A failure's body shows its message, expected versus actual, the differences and
every recorded run. Skipped asserts are `<skipped/>`, and files an assert kept
are linked from its `<system-out>` as `[[ATTACHMENT|path]]`, which Jenkins and
GitLab show on the test.

`"Html"` writes `results.html`, a plain page to open in a browser: the verdict
and counts, then each suite with its tests. Suites with a failure are expanded
and show each failure's message, expected versus actual and links to its files;
passing suites are collapsed. Suite problems and console errors come first, and
the captured log is collapsed at the end. Pass `{ title: "..." }` to change the
page title.

A custom result formatter implements `render(asserts, results, log)`, where
`results.state` is `"Passed"` or `"Failed"`, and `results.errors` lists any
suite-level problems. Each result's `finalState` is `Success`, `Fail` or
`Skipped`; skipped asserts neither pass nor fail the suite.

#### Failure files

Asserts can keep files with a failure, e.g. a snapshot's actual value. They are
written to `<outputDir>/artifacts/<uuid>/`, and each result lists them under
`attachments` with their paths.

#### Ignore Console Errors

If set to false then any error written to the console will mark the entire test
suite as failed. This is set to true by default.

#### Log Output Filters

Log output filters leave matching lines out of the log files, e.g. to keep
secrets out of the console of your cloud provider or test runner. They are an
array of JavaScript regular expressions (or strings, which are compiled as
regular expressions).

#### Log input filters

`logObjectFilters` stops console output from the listed Max object names being
captured at all. The default is `["node.script"]`. The handler's own messages
are never captured, whatever this list contains. These are filtered at the
node.js level and are not arguments to the Max console object.

## Writing custom asserts and formatters

Everything a custom assert, a formatter or a `munit.config.js` can rely on is
the `libmunit` API: `require("libmunit")` in Max, and `import("libmunit")` in a
JSDoc annotation. The package documents it in two forms, generated from the same
source:

- `api/libmunit/README.md`: the reference, one page per type and function.
- `api/libmunit.d.ts`: the typings. Include the file from a `jsconfig.json` next
  to your scripts and VS Code completes `helpers.`, shows the documentation on
  hover and underlines a misspelt config key. Every example under `examples` has
  one to copy:

```json
{
  "compilerOptions": { "checkJs": true, "module": "commonjs", "target": "es2022", "lib": ["es2022"], "types": [], "noEmit": true },
  "include": ["./*.js", "<path to the mUnit package>/api/*.d.ts"]
}
```

Then annotate what you write:

```js
/** @type {import("libmunit").AssertionHandler} */
function assert(data, helpers) { ... }

/** @type {import("libmunit").ResultFormatter} */
const myFormatter = { configure(options) {}, render(asserts, results, log) { ... }, fileExtension() { return "txt"; } };

/** @type {import("libmunit").HandlerConfig} */
const config = { resultFormatter: myFormatter, outputDir: "./logs" };
module.exports = config;
```

Annotate a `const` and export it, as above: a misspelt key is then underlined.
The same annotation on a bare `module.exports = { ... }` gives completion and
hover, but its keys aren't checked.

The reference lists exactly what is supported; anything else
`require("libmunit")` returns is internal and may change. The patcher linter's
API for script rules is documented the same way under `api/munit-lint`.

## mUnit.Harness

`[mUnit.harness]` points `[mUnit.handler]` at your `munit.config.js` and opens a
folder of test patches, so one patch can run a whole suite. Connect its outlet
to the handler's inlet. See `loadInFolderExample`.

```
[mUnit.harness @loadFolder tests @recursive 1]
|
[mUnit.handler]
```

Attributes:

- `@loadFolder <path>`: the folder of test patches, relative to the harness's
  patch (absolute paths work too). Without it, the harness only loads the
  config.
- `@configFolder <path>`: the folder with `munit.config.js`. Default: the
  harness's patch folder.
- `@pattern <glob>`: which files are tests. Default `*.maxpat`; `*` and `?`
  work, e.g. `test_*.maxpat`.
- `@recursive 1`: also search subfolders.
- `@sequential 1`: open one test patch at a time, wait until its asserts have
  finished, close it, then open the next. Slower, but patches can't interfere
  with each other through shared `[s]`/`[r]` names or CPU load.

By default every test patch is opened at once. They are all closed when the
suite has finished. The patch containing the harness must be saved, since its
folder is where the tests and config are found.

## Running from the command line

The command line, `munit`, has three commands: `init` sets up a new suite, `run`
starts Max on a suite and `lint` checks patcher files without Max.

### Starting a suite

`munit init` sets up the "test wrangler" pattern from `loadInFolderExample`, so
a new suite is one command away:

```sh
npx munit init                          # ./tests and default values
npx munit init path/to/suite --sequential --pattern "test_*.maxpat" #custom folder and values
```

```text
tests/
  runTests.maxpat    [mUnit.harness @loadFolder patchers] -> [mUnit.handler]
  munit.config.js    JSON results and a text log in logs/; the other keys
                     commented out at their defaults
  munit-lint.json    mUnit:recommended and mUnit:tests
  .gitignore         logs/
  patchers/          your test patches
  logs/              the results and log of each run
```

Save test patches in `patchers/`, then open `runTests.maxpat` in Max, or run
`munit run tests/runTests.maxpat`.

The options set the harness attributes in the wrangler: `--tests <path>`
(`@loadFolder`, default `patchers`); `--config-folder <path>` (`@configFolder`,
where `munit.config.js` is written; its `outputDir` still points at `logs/` in
the suite folder), `--pattern <glob>`, `--recursive` and `--sequential`.
`--name <file>` names the wrangler, `--no-lint` leaves out `munit-lint.json`,
and files that already exist are kept unless you pass `--force`, so running it
again only adds what's missing. A `.gitignore` that exists is never replaced:
`logs/` is added to it when it isn't listed. The harness opens every matching
patch in its folder, so `init` refuses a layout where it would open the wrangler
itself, e.g. `--tests .` without a `--pattern` that leaves the wrangler out. For
the same reason, run the suite through the wrangler, not with `munit run tests`.

### Running a suite

`munit run` starts Max, runs a suite, quits Max and exits with a code a CI job
can act on: 0 passed, 1 failed, 2 couldn't run (Max didn't start or report, the
suite timed out, or no asserts registered).

```sh
# A folder with munit.config.js and test patches
npx munit run path/to/suite --tests tests --output build/test-results

# A patch you already use to run the suite
npx munit run path/to/suite/runTests.maxpat
```

For a folder, the runner writes a temporary patch containing `[mUnit.harness]`
and `[mUnit.handler]`, so `--tests`, `--pattern`, `--recursive` and
`--sequential` work like the harness attributes. `--output` overrides the
configured `outputDir`, `--timeout <seconds>` (default 900) stops Max if the run
hangs, and `--take-references` writes references instead of comparing (see
*Dicts and snapshots*). Each assert is printed as it finishes. Run
`npx munit --help` for every option.

Requirements and limits:

- macOS and Windows. On macOS Max is started with
  `open -n -W -a /Applications/Max.app`; on Windows `Max.exe` is started
  directly, by default `C:\Program Files\Cycling '74\Max 9\Max.exe`. Use
  `--max` or `MUNIT_MAX_APP` for another location (the `.app` on macOS, the
  `.exe` on Windows).
- On Windows, quit Max before a run: `open -n` makes macOS start a separate
  Max, but Windows has no equivalent, so the runner can't control or wait
  for a Max that is already open.
- Max must be installed, authorised, and able to open windows: on CI that means
  a self-hosted runner logged into a desktop session, not a headless service.
- Max must be able to find the mUnit package, i.e. it is installed in (or linked
  into) `Max 9/Packages`.
- When it finishes, the runner closes every Max window before Max quits, so
  nothing is reopened at the next launch. Max's "Restore Windows on Launch"
  preference still reopens whatever *you* had open when you last quit Max
  yourself, and a reopened patch containing asserts or a handler will join the
  run. On a CI machine, turn that preference off or quit Max with no windows
  open.

## Linting patchers

`munit lint` checks saved patcher files against rules you write in JSON: "no
`[zl.reg]` in this project", "every `[v8]` has `@autowatch 0`", "one
`[mUnit.handler]` per test patch", "no fan-out without a `[trigger]`". It reads
the `.maxpat` JSON on disk and never starts Max, so it runs anywhere, including
GitHub-hosted CI.

```sh
# Every file the config selects under the folder
npx munit lint path/to/project

# One file, plus the .gendsp and .rnbopat files it loads from next to it
npx munit lint path/to/project/tests/testFoo.maxpat

# For CI: a JUnit report, one failed test per blocking finding
npx munit lint path/to/project --format junit --output build/lint.xml
```

Exit codes: 0 clean or warnings only, 1 any `block` finding, 2 could not lint (a
bad config or rule file, a patch that isn't JSON). A blocking finding fails the
build, so a GitHub Actions job needs only Node and the dev dependency:

```yaml
jobs:
  lint-patchers:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: 22
      - run: npm ci
      - run: npx munit lint patchers --format junit --output build/lint.xml
```

### Configuration

The rules come from `munit-lint.json` files, typically one next to your
`munit.config.js`, and they cascade. For each file linted:

1. `--config <file>` (or `@config` on `[mUnit.lint]`) when given: that file
   alone, for every file.
2. Otherwise every `munit-lint.json` in the file's folder and in the folders
   above it, up to one that says `"root": true` or the top of the disk, applied
   outermost first.
3. None anywhere: the built-in `mUnit:recommended` rules alone.

Each inner config adds to the outer ones rather than replacing them: its `rules`
join the set (a rule with an id already seen replaces that rule), its
`overrides` apply after the outer ones, its `ignore` patterns add to theirs, and
its `files` list, when it has one, replaces theirs. So a subfolder can be
stricter or looser than its parent without repeating what it inherits, and a
file is linted the same way whether you point at it, at its folder or at the
project. `--rules` files form the innermost layer. Within one config or rule
file an id may appear only once.

Every path in a config is relative to the folder of that config file, not to the
target: rule files and globs in `rules`, and the patterns in `files`, `ignore`
and `overrides`. An override that leaves `files` out applies to every file under
its config. `"root": true` stops the walk, so nothing above a project can change
its results; without it, a `munit-lint.json` in your home folder or in Max's
Documents folder is a baseline for every project below it.

The name has a hyphen on purpose: Max finds the `[mUnit.lint]` object by looking
for a file called `mUnit.lint.<extension>`, so a `munit.lint.json` next to a
patch shadows the object and it fails to load. The linter refuses that name.
`examples/lintConfigExample` walks through all of this with a project of several
folders.

```json
{
  "rules": ["mUnit:recommended", "mUnit:tests", "./lint-rules/*.json"],
  "files": ["**/*.maxpat", "**/*.maxhelp", "**/*.gendsp", "**/*.rnbopat"],
  "ignore": ["**/_scratch/**"],
  "overrides": [
    { "files": ["**/*.maxhelp"], "rules": { "no-zl-reg": "off" } }
  ]
}
```

- `rules`: the built-in sets, rule files or globs relative to the config, or
  rule objects written inline. `--rules <file>` adds more from the command line.
- `files` and `ignore`: which files are linted, relative to the config.
- `root`: `true` to stop looking for configs in the folders above this one.
- The text report is coloured when printed to a terminal; `--color` and
  `--no-color` force it, `NO_COLOR` turns it off, and a report written with
  `--output` is always plain.
- `overrides`: per-file rule levels, later entries winning; leave `files` out
  for every file under the config. This is how help files are held to different
  standards than test patches, and how a subfolder's config raises or lowers a
  level it inherits.
- `--list-rules`: instead of linting, print the rules in force for each selected
  file after every override, with the level and the file or set each came from.
  The answer to "why isn't my rule firing here".

Two rule sets are built in, and shipped as `lint-rules/*.json` in the package to
copy from:

- `mUnit:recommended`: general patcher hygiene, used when there is no config.
  Warns about fan-out from one message outlet to several inlets without a
  `[trigger]`, and about boxes that overlap in any patcher (panels and boxes
  sent to the background are exempt).
- `mUnit:tests`: for patches that run under mUnit, so add it to the config of
  your test folder. Blocks a second `[mUnit.handler]` in a file and blocks
  `[loadbang]` in favour of `[mUnit.loadbang]`, which waits for the handler.

### Rules

A rule is one JSON object; a rule file holds one rule, a list, or
`{ "rules": [...] }`. `kind` picks what is checked and the rest parameterises
it. `level` is `off`, `warn` or `block`; `block` is what fails CI.

```json
{
  "id": "no-zl-reg",
  "level": "block",
  "kind": "forbid-object",
  "match": { "object": "zl.reg" },
  "message": "zl.reg is not allowed here, use list.reg",
  "fix": { "replace": { "object": "list.reg", "args": "keep" } }
}
```

| Kind | Settings | Checks |
| ---- | -------- | ------ |
| `forbid-object` | `match`, optional `fix.replace` | a box matches; `fix` describes the replacement text |
| `require-attribute` | `match`, `attribute`, optional `fix.set` | the attribute is present, inline (`@autowatch 0`) or saved on the box |
| `attribute-value` | `match`, `attribute`, `value`, optional `fix: true` | the attribute has that value |
| `max-instances` | `match`, `max`, `per` (`file` or `patcher`) | at most N matching boxes |
| `fanout-without-trigger` | optional `allow` (source object names) | one message outlet connected to several inlets; signal outlets are exempt |
| `overlapping-boxes` | optional `allow` (object names), `tolerance` (pixels) | two boxes in a patcher overlap; boxes with `@background 1` are exempt |
| `naming` | `target` (`varname`, `send`, `receive`, `send-receive`), `pattern` | the name matches the regular expression |
| `script` | `module` (a JS file relative to the rule file), optional `options` | whatever `check(ctx)` reports: `ctx.patchers`, `ctx.document`, `ctx.report({ box, message })` |

The package ships JSON Schemas for rule files and for `munit-lint.json` in
`lint-rules/`. Start a file with `"$schema": "<path to
lint-rules/rule.schema.json>"` (or `config.schema.json`) and your editor
completes the fields, shows what each one does and underlines a misspelt kind.
`lint-rules/README.md` is the reference for every kind, `match`, `scope`, levels
and fixes.

`match` takes `object` (names are normalised, so `t`, `trigger`, `zl reg` and
`zl.reg` all work; UI objects match by class, e.g. `toggle`), `maxclass`, `args`
(positional patterns, `*` for any) and `text` (a regular expression over the box
text). Every field given must match.

`scope.namespace` picks the patchers a rule looks at: `box` (the default),
`dsp.gen`, `jit.gen`, `rnbo` or `*`. A rule scoped to `dsp.gen` applies to
`.gendsp` files and to `[gen~]` subpatchers inside a `.maxpat` alike; nested
patchers are walked and a finding reads `[p main] > [gen~] > [+ 1]`.

To silence rules in one patcher, add a comment box reading
`munit-lint disable no-zl-reg other-rule` (or just `munit-lint disable` for all
of them). It applies to that patcher, not to its subpatchers.

### Writing rules

`examples/lintExample` is a project with one rule of each kind, a patch every
rule fires on, a clean one, and the npm scripts and CI step that run the lint;
its README walks through the steps in full. In short:

1. Pick a kind and a level: `warn` to see it, `block` once the project is clean.
2. Write the JSON in a file under `lint-rules/`, starting with the `$schema`
   line so the editor helps.
3. Make a patch that should fail and one that should pass, and run the rule on
   them alone: `munit lint dirty.maxpat --rules lint-rules/my-rule.json`.
4. Add the file to `munit-lint.json`: `"rules": ["./lint-rules/*.json"]`.
5. Add an override for files held to a different standard (help files, a legacy
   folder), and check it with `--list-rules`.
6. Add the CI step from "Linting patchers" above.

### Script rules

When the JSON kinds can't say it, a rule of kind `script` names a JavaScript
module, relative to the rule file, that exports `check(ctx)`:

```json
{ "id": "named-subpatchers", "kind": "script", "module": "./named-subpatchers.js", "options": { "objects": ["p"] } }
```

```js
/** @type {import("munit-lint").ScriptCheck} */
exports.check = (ctx) => {
  for (const patcher of ctx.patchers) {
    for (const box of patcher.boxes) {
      if (box.object === "p" && box.args.length === 0) {
        ctx.report({ box, message: "give this [p] a name" });
      }
    }
  }
};
```

`ctx` carries the `document` (the whole file), the `patchers` in the rule's
scope, the rule's `options`, `state`, `report`, and helpers for what rules ask
most: `connectionsFrom(box)` and `connectionsTo(box)` with both ends resolved,
`boxesByObject("zl reg")`, `sends()` and `receives()` with their names, and
`relatedFiles()`. Report with a `box` so the finding has a location; a finding
may also carry `edits` (set the box text, set an attribute, remove or insert a
box, addressed by the patcher's route of box ids and the box id), which `--fix`
applies. The module may also export `meta` (a description for `--list-rules` and
a JSON Schema for its options, checked before any patch is linted) and `project`
(`begin` and `end` hooks around the file loop, for a rule that needs the whole
folder). A module that throws is one error naming the rule, module and file; the
other rules and files still run. Rule sets can be shared as an npm package named
in `rules` (`"munit-rules-acme"`), and tested with
`require("munit-cli/test").lintFiles`. All of this is in `lint-rules/README.md`.
The module is CommonJS, loaded with `require` by `munit lint` and by
`[mUnit.lint]` in Max alike (its server is a `node.script`), so it may `require`
what it likes. The API is documented under `api/munit-lint`, and
`api/munit-lint.d.ts` in a `jsconfig.json` that includes the module (as the
example's does) gives completion on `ctx`. Test a rule with
`munit lint <patch> --rules my-rule.json --format json`, which prints every
finding with its rule, box and position.

### Linting in Max, as you save

`[mUnit.lint @folder tests]` in a patch watches that folder (relative to the
patch) and lints every patcher file in it the moment it is saved, with the same
rules and config as the command line. Findings go to the Max console: `warn` at
warning level, `block` at error level, then one summary line per file. Its v8
helper also keeps an eye on whichever patch is in front, so the patch you are
editing is linted on save even when it lies outside the folder (`@followfront 0`
turns that off).

- `@folder <path>`: the folder to watch, relative to the patch (default `.`).
  `@folder none` watches no folder: whatever patch is in front is linted when
  you save it, wherever it is, with the `munit-lint.json` files in and above its
  own folder, and the console names the configs whenever they change from one
  patch to the next.
- `@root 1`: the folder is the top of the config cascade. The configs that apply
  to a patch are the ones from its own folder up to the folder and nothing
  above, as if the folder's config said `"root": true` (put that in the config
  too, so the command line agrees). Project mode: point `@folder` at the root of
  your repository.
- `@followfront 0`: lint the folder and below only. By default the patch in
  front is linted on save even when it lies outside the folder, and `lint` and
  `fix` take it in; with 0 nothing outside the folder is linted unless you name
  it (`lint <path>`), so the object reports what `munit-cli.js lint <folder>`
  does whatever else you have open. It needs a folder: `@folder none` with
  `@followfront 0` has nothing to lint.
- `@config <file>`: one config for everything, relative to the patch (default:
  the `munit-lint.json` files in the folder and above it, cascading as described
  under Configuration). The patch in front, when it lies outside the folder,
  takes the folder's configs, so what the object reports matches
  `munit-cli.js lint <folder>`. `@rules <file>` adds rule files on top, like the
  command line's `--rules`.
- On start the console says which configs apply, which ones subfolders add, and
  how many rules are active; the first finding also shows the
  `munit-lint disable` comment.
- Messages: `start` and `stop` the watcher, `lint` lints the whole folder again
  (and the patch in front, when it lies outside and `@followfront` is 1),
  `lint <path>` one file, `fix` and `fix <path>` apply the fixes the same way
  and write the files back, `status` posts what the front-patcher helper has
  seen.
- Outlets: the left one sends the findings of every lint as a dict, for your own
  UI: `files`, `summary`, `errors` and `findings`, each with `rule`, `level`,
  `file`, `patchers` (the subpatchers on the way to the box, empty at the top
  level), `location`, `box`, `position` and `message`. The right one passes the
  server's messages through (`started`).

The patch holding `[mUnit.lint]` must be saved, since `@folder` is relative to
it. See `examples/lintExample`, or the `mUnit.lint` help patch.

You don't need a patch of your own for this. **Extras > mUnit Lint Server** is
one to leave open while you work: it starts in the automatic mode (`@folder
none`), so every patch you save, anywhere on the disk, is linted with the config
nearest to it, or with `mUnit:recommended` when there is none. *Choose a project
folder* switches to project mode: the folder is watched and is the top of the
config cascade (`@root 1`), so its `munit-lint.json` rules everything below it
while subfolders add their own, and a patch outside the folder takes the
folder's configs. A patch saved for the first time, or saved as a new file, is
linted as soon as it comes to the front under its new name. `lint` lints the
project folder again, or every patch seen in front.

### Fixing

`munit-cli.js lint <target> --fix` applies the fixes the rules describe and
writes the patches back, then reports what is left. In Max, send `fix` (the
folder) or `fix <path>` to `[mUnit.lint]`. Rules that can fix: `forbid-object`
with `fix.replace` (the object is replaced in the box text, keeping, dropping or
remapping its arguments), `require-attribute` with `fix.set` and
`attribute-value` with `fix: true` (the attribute is set inline in the box text,
e.g. `@autowatch 0`, or as a box key for UI objects). Edits are made as splices
into the saved file, so the rest of it stays byte for byte as Max wrote it and a
fix diffs as one line, whichever of Max's two layouts the file uses. A fix is
applied, the file is linted again, and if that makes room for another fix it is
applied too, up to five passes.

## Licence

mUnit is licensed under the
[Prosperity Public License 3.0.0](LICENSE-PROSPERITY.md); see
[LICENSE.md](LICENSE.md). Noncommercial use (personal projects, hobbies,
research, education, charities and similar) is free. Commercial use can be tried
for 30 days; after that, a company or anyone using mUnit for commercial work
needs a commercial licence: contact <tom@tomwhiston.com>. This is a summary; the
licence text is what applies.

## Problems and questions

Open an issue at <https://github.com/twhiston/mUnit/issues>. Changes in each
release are listed in [CHANGELOG.md](CHANGELOG.md).
