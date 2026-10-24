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
- **mUnit Glossary** - the words of testing, explained, each with its help
  patcher, example and manual section a click away.
- **mUnit API** - the JavaScript API reference as a web page inside Max.

### CLI

Add an alias to the cli script to your shell to get access to munit from your
command line, including running tests, bootstrapping test directories and
linting your patchers.

### Documentation

- Help patchers and reference files for each object (really an abstraction!)
- This README, with a [glossary](#glossary) of testing terms at the end
- `api/` folder with the TypeScript typings and the reference of all user
  facing functionality in the code, as markdown (`api/markdown`) and as a web
  site (`api/html`), which **Extras > mUnit > mUnit API** opens inside Max

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
the script which is included in this package. It runs under the `node` on your
PATH, which must be Node 18 or newer (`node --version`).

```bash
# zsh / bash: the single quotes keep the inner double quotes, so the space in
# "Max 9" survives when the alias expands
alias munit='node "$HOME/Documents/Max 9/Packages/mUnit/javascript/nodejs/runner/munit-cli.js"'
```

```powershell
# PowerShell: Set-Alias can't take arguments, so use a function
function munit { node "$HOME\Documents\Max 9\Packages\mUnit\javascript\nodejs\runner\munit-cli.js" @args }
```

For the command line in a project or CI job, install it from npm:
`npm install --save-dev munit-cli` (see *Running from the command line*).

## Quick start

### First steps

1. In your project folder, run `munit init`. It creates the `tests/` folder for
   you, with a test wrangler patch (`runTests.maxpat`), a `munit.config.js`, a
   `munit-lint.json` and an empty `patchers/` folder for your tests. You don't
   need to make any of these yourself (see *Starting a suite*).
2. In `tests/patchers`, save a patch that sends a value into an assert once
   mUnit is ready:

   ```text
   [mUnit.loadbang]
   |
   [1]
   |
   [mUnit.assert in1 == 1 @name equalsOne]   <- into the second inlet (in1)
   ```

3. Run it from a terminal (Max must be installed; the runner starts and quits
   it): `munit run tests/runTests.maxpat`. It prints an `ok` line for
   `equalsOne` and exits with 0. Change the message to `2` and it prints `FAIL`
   with the reason, and exits with 1.

4. To run it inside Max instead, open `tests/runTests.maxpat`.

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
files next to themselves: the **Open folder** button in each one shows its
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
one is skipped without being evaluated, and its box turns yellow. Set
`forbidOnly: true` in CI so one can't be committed by mistake. An assert that
finished before the `@only` assert was loaded (an earlier patch in a
sequential run) has already run; it is still reported as skipped.

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
  the first samples), not sample by sample. A signal assert that fails keeps
  its whole capture as `actual.wav` in the run's `artifacts/` folder, whatever
  it evaluates, so the samples can be opened and looked at.

Signal tests run the same with Overdrive on or off: `[mUnit.loadbang]` fires at
low priority either way, so the capture buffer is ready before recording starts.

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
DSP off, applies them one step at a time, switches DSP on and, since Max keeps
the driver in its preferences, restores everything after the teardowns. `settleMs` (default 1500)
is how long a driver change gets to take effect.

The tests start only once `[dspstate~]` has reported DSP running on the driver,
rate and vector size asked for, and that has held for half a second. If it
hasn't within 5 seconds plus `settleMs`, no tests run: the suite fails with
what was wrong (for example `asked for 48000 Hz but DSP runs at 44100`), and the
previous settings are restored. A change to the driver, rate or DSP state while
the suite runs fails the suite too: it restarts signal objects (a `[gen~]`'s
`History`, a counter, a capture) partway, so what was measured can't be
trusted. A restart at the same settings is logged as a warning, with the time,
to line up with the captures in `log.txt`.

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
JSDoc annotation. The package documents it in three forms, generated from the same
source:

- **Extras > mUnit > mUnit API**: the reference as a web site inside Max,
  with search (`api/html/index.html` in the package).
- `api/markdown/libmunit/README.md`: the same reference as markdown, one page
  per type and function.
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
API for script rules is documented the same way, under `munit-lint` in the
web site and in `api/markdown/munit-lint`.

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
  `[trigger]`, about boxes that overlap in any patcher (panels and boxes
  sent to the background are exempt), and about a `[metro]` or another timing
  or MIDI object whose cords reach a `[jit.world]`, `[jit.pworld]` or
  `[jit.gl.render]` without a `[deferlow]` or `[qmetro]` on the way. With
  Overdrive on, that render runs on the scheduler thread and creates its GL
  context off the main thread, which macOS 26 kills Max for. `--fix` turns
  the `[metro]` into a `[qmetro]`.
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
| `forbid-path` | `from`, `to`, optional `unless` (each a `match`), optional `fix.replace` | cords lead from a `from` box to a `to` box without passing an `unless` box; `fix` rewrites the `from` box |
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
what it likes. The API is documented under `munit-lint` in **Extras > mUnit >
mUnit API** and in `api/markdown/munit-lint`, and
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
  seen. `autofix 1` makes every lint fix as well (`@autofix`); Max reloads the
  fixed patch, and to let it notice, a save is then linted about two seconds
  later rather than at once.
  `output <path>` (`@output`) writes every lint's report to a file as well as
  the console, the whole folder after a start or `lint`, one patch after a
  save, in the format `format` (`@format`) says: `auto` (the default) picks
  JSON for `.json`, JUnit for `.xml` and text otherwise; `output none` stops.
- Outlets: the left one sends the findings of every lint as a dict, for your own
  UI: `files`, `summary`, `errors`, `text` (the one-line summary as posted to
  the console) and `findings`, each with `rule`, `level`, `file`, `patchers`
  (the subpatchers on the way to the box, empty at the top level), `location`,
  `box`, `position` and `message`. The right one passes the server's messages
  through: `started` when the node script has booted, `state watching` when it
  starts watching and `state stopped` when it stops, for a running light.

The patch holding `[mUnit.lint]` must be saved, since `@folder` is relative to
it. See `examples/lintExample`, or the `mUnit.lint` help patch.

You don't need a patch of your own for this. **Extras > mUnit Lint Server** is
one to leave open while you work: a small window with a light that is green
while the server is watching, red when it is stopped, and the result of the
last lint under it. It starts in the automatic mode (`@folder none`), so every
patch you save, anywhere on the disk, is linted with the config nearest to it,
or with `mUnit:recommended` when there is none. The *Project folder* tab
switches to project mode: the folder is watched and is the top of the config
cascade (`@root 1`), so its `munit-lint.json` rules everything below it while
subfolders add their own, and a patch outside the folder takes the folder's
configs. A patch saved for the first time, or saved as a new file, is linted as
soon as it comes to the front under its new name. Under *Findings*, the second
tab also writes every lint's report to a file you choose (JSON, JUnit or text
by its extension), for an editor or a dashboard to pick up. *Apply fixes* makes
every lint fix what the rules can fix and write the files back; the fixed patch
reloads in Max a couple of seconds after the save. *Fix now* does that once,
switch or no switch. *Lint
now* lints the project folder again, or every patch seen in front; *Max
console* brings the console to the front, where the findings are. The patching
view, behind the window (Edit > Edit Mode, then the presentation toggle),
explains the wiring.

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

## Glossary

Testing has a vocabulary of its own, and much of it is new to Max. This section
explains the words mUnit uses, with the help patcher, example or manual section
where each one lives. The same glossary is in Max: **Extras > mUnit > mUnit
Glossary**. Both come from `misc/mUnit-glossary.json` in the package.

<!-- glossary:start -->
### Testing basics

- **test**: A patch, or part of one, that feeds known inputs into the thing you
  are testing and checks what comes out. The check is an assert; a test passes
  when its assert passes. Tests are kept so they can be run again after every
  change, which is what makes them worth writing. Related: *assert*, *suite*,
  *unit under test*. See [Quick start](#quick-start),
  [simpleConfigExample](examples/simpleConfigExample).
- **assert**: A statement that something must be true at this point, such as the
  output equals 1. In mUnit an assert is an `[mUnit.assert]` box: it evaluates a
  JavaScript expression over the values that arrive at its inlets and reports
  pass, fail or skipped. Assertion means the same thing. Related: *expression*,
  *verdict*, *test*. See the `[mUnit.assert]` help patcher, [Assert](#assert).
- **unit under test**: The piece of your patch a test exercises: an abstraction,
  a chain of objects, a gen~ patch, a shader. A test isolates it by feeding it
  inputs directly, instead of through whatever it normally gets them from, so
  the result depends only on the unit. Related: *test*, *stimulus*, *fixture*.
  See [Tables of cases](#tables-of-cases).
- **expression**: The JavaScript written in an `[mUnit.assert]` box. in1 to in10
  stand for the inputs, so in2 > in1 or approx(in1, 0.5, 0.001) are expressions.
  It passes when it returns exactly true; any other result, or an error, fails
  that assertion. Related: *assert*, *inputs: in1 to in10*, *helper*. See
  [Assert](#assert), [expectedActualExample](examples/expectedActualExample).
- **expected versus actual**: The value you wanted (expected) and the value the
  patch produced (actual). A good failure message reports both, for lists and
  dicts it lists the differences between them, and captures those values as part
  of the result report, so you can see what went wrong without adding prints.
  Related: *assert*, *verdict*. See [Expected versus
  actual](#expected-versus-actual),
  [expectedActualExample](examples/expectedActualExample).
- **verdict**: The outcome of an assert: pass, fail or skipped. The verdicts of
  every assert in a suite add up to the verdict of the run: Passed when nothing
  failed, Failed otherwise. Skipped asserts count for neither. Related:
  *assert*, *suite*, *skip and only*. See [Custom asserts](#custom-asserts).
- **suite**: A set of tests run together and reported as one result. In mUnit
  every assert that registers with an `[mUnit.handler]` belongs to the run, and
  @suite groups them under a name, by default the suite is the name of the patch
  they are in. A folder of test patches opened by `[mUnit.harness]` is the usual
  shape of a suite. Related: *handler*, *harness*, *test wrangler*. See the
  `[mUnit.handler]` help patcher, [mUnit.handler](#munithandler).
- **fixture**: Anything a test needs in place before it can run: a dict of
  settings, a sound file, a reference matrix, a known input signal. Fixtures
  live next to the test (the references folder, a stimulus in the patch) rather
  than being made up at run time, so the test sees the same thing every time.
  Related: *reference*, *stimulus*. See [Dicts and
  snapshots](#dicts-and-snapshots).
- **repeatable**: A test is repeatable, or deterministic, when it gives the same
  verdict every time it runs. Random values, live audio, timing and shared state
  make a test unrepeatable. mUnit gives you `[mUnit.stimulus~]` for signals that
  are the same every run, the non-realtime driver, and sequential mode for
  patches that may interfere with each other. Related: *flaky test*, *stimulus*,
  *non-realtime driver*. See the `[mUnit.stimulus~]` help patcher.
- **flaky test**: A test that passes on some runs and fails on others although
  nothing changed. Common causes in Max are scheduler timing, two test patches
  sharing a send or receive name, audio hardware, and a loadbang firing before
  mUnit is ready. Fix the cause rather than retrying: not fixing a flaky test
  teaches you to ignore failures, which is bad practice. Related: *repeatable*,
  *timeout*, *sequential mode*. See [mUnit.loadbang](#munitloadbang),
  [sequentialHarnessExample](examples/sequentialHarnessExample).
- **timeout**: A limit on how long something may take before it counts as
  failed, so a run always ends. @timeout on an assert fails it when no verdict
  arrives within that time; suiteTimeout in the config ends the whole suite,
  reporting every unfinished assert as failed. A timeout is always a failure,
  not a pass. Related: *settle*, *verdict*. See [Attrs](#attrs),
  [mUnit.handler](#munithandler).
- **skip and only**: @skip 1 reports an assert as skipped without evaluating it,
  for a feature that is not finished or a machine that cannot run it. @only 1
  runs just the asserts marked with it and skips the rest, handy while debugging
  one test. forbidOnly in the config fails the suite when an @only is left in,
  so it cannot reach CI by mistake. Related: *verdict*, *CI*. See
  [skipAndOnlyExample](examples/skipAndOnlyExample), [Attrs](#attrs).
- **test start**: The moment a test may begin sending inputs. In mUnit that is
  not when the patch loads but when the handler is ready, because the node
  process behind it takes a moment to start. `[mUnit.loadbang]` bangs at that
  moment, whether the patch opened before or after it, and replaces `[loadbang]`
  in test patches. Related: *handler*, *flaky test*, *teardown*. See the
  `[mUnit.loadbang]` help patcher, [mUnit.loadbang](#munitloadbang).
- **teardown**: Cleaning up after a test: stopping DSP or a metro, closing a
  file, setting a global back. `[mUnit.teardown]` bangs once the results of its
  patch are final, so the cleanup cannot change a verdict, and the handler waits
  for every teardown before it goes on. Related: *test start*, *suite*. See the
  `[mUnit.teardown]` help patcher, [teardownExample](examples/teardownExample).

### Asserts in depth

- **helper**: A function you can call inside an expression: approx and equals
  compare with details, snapshot compares with a reference file, and rms, peak,
  dc, maxDiff, snr and freq measure a list or a signal. When a helper fails, its
  expected value, actual value and differences become the failure message. See
  the expressions helper category for info about what helpers are available.
  Related: *expression*, *approx()*, *equals()*, *snapshot()*, *measure*. See
  [Helpers](#helpers), [expectedActualExample](examples/expectedActualExample).
- **tolerance**: How far a result may be from what you expect and still pass.
  Floats are rarely exactly equal, so approx takes an absolute and a relative
  tolerance; a signal passes above an @snr in dB; a matrix passes when at most
  @maxFraction of its cells differ by more than @maxDiff. @tolerance on an
  assert is different: how many failed calls a custom or @every assert may have.
  Related: *helper*, *approx()*, *measure*. See [Helpers](#helpers), [Matrices:
  Jitter in mUnit.assert](#matrices-jitter-in-munitassert).
- **table of cases**: Several inputs with their expected outputs, checked by one
  assert. Each row is a case; @every 1 makes the assert demand that every call
  is true, and @maxCalls says how many rows to expect. It fails on the first
  wrong row and names it. Related: *assert*, *expression*. See [Tables of
  cases](#tables-of-cases), [tableOfCasesExample](examples/tableOfCasesExample).
- **snapshot**: A copy of a value, saved in a file the first time, that later
  runs are compared against. snapshot(in1) in an expression compares the input
  with references/<name>.json next to the test patch and fails when they differ.
  Snapshots catch changes you did not mean to make, in a dict of settings or a
  long list, without writing out every expected value. Related: *reference*,
  *taking references*, *snapshot()*. See [Dicts and
  snapshots](#dicts-and-snapshots), [snapshotExample](examples/snapshotExample).
- **reference**: The file a snapshot, matrix or signal assert compares against:
  a .json, .jxf or .wav in the references folder next to the test patch. A
  reference is the recorded right answer; commit it with the tests, and when it
  changes, make sure the change was intended. Related: *snapshot*, *taking
  references*, *fixture*. See [Dicts and snapshots](#dicts-and-snapshots),
  [Signals: mUnit.assert~ and
  mUnit.stimulus~](#signals-munitassert-and-munitstimulus).
- **taking references**: Writing what the patch produces now as the reference.
  munit run --take-references, or takeReferences in the config, or inside the
  patch manually with `takeReference 1` to the handler. Every assert with a
  reference then passes and writes its file. Look at the diff before you commit:
  a wrong reference makes a wrong patch pass. Related: *reference*, *snapshot*.
  See [Dicts and snapshots](#dicts-and-snapshots), [Running a
  suite](#running-a-suite).
- **custom assert**: A JavaScript file named in the assert box instead of an
  expression. It receives the inputs as an array and returns a State: Success or
  Fail decide at once, Continue means no verdict yet, Skipped skips. Use one
  when a simple expression cannot say it, such as every input so far is unique.
  Related: *expression*, *verdict*. See [Custom asserts](#custom-asserts),
  [customAssert](examples/customAssert).
- **failure files**: Files an assert keeps when it fails, so you can look at
  what it saw: the actual dict of a snapshot, a captured signal as actual.wav, a
  matrix as actual.png next to a diff.png. They are written under artifacts in
  the output folder and linked from the JSON and JUnit results, which CI systems
  show on the failed test. Related: *output folder*, *JUnit*. See [Failure
  files](#failure-files), [failureFilesExample](examples/failureFilesExample).

### Expression helpers

- **inputs: in1 to in10**: What an expression sees: in1 is the value at the
  second inlet, in2 the third, and so on, up to in10. Ints, floats, symbols,
  lists and dicts arrive as JavaScript values, so in1 === 'foo', in1.length ===
  3 and in1.name === 'munit' all work. In `[mUnit.assert~]` each input is a
  channel of the capture, a list of samples; a matrix arrives with dim, planes,
  type and its cells. Related: *expression*, *capture*, *matrix input*. See
  [Assert](#assert), [expectedActualExample](examples/expectedActualExample).
- **approx()**: approx(actual, expected, abs, rel). True when the two values
  match within a tolerance: numbers, lists item by item, dicts key by key. The
  tolerance is the larger of abs (default 0.000001) and rel times the expected
  value (default 0), so approx(in1, 0.5, 0.001) allows a thousandth either way.
  On failure the differences are reported, one per line. Related: *tolerance*,
  *equals()*, *expected versus actual*. See [Helpers](#helpers),
  [expectedActualExample](examples/expectedActualExample).
- **equals()**: equals(actual, expected). True when the two values are exactly
  equal: lists item by item, dicts key by key in any order, symbols as strings.
  Use it instead of === for lists and dicts, which JavaScript compares by
  identity, and to get the differences reported when it fails. Related:
  *approx()*, *expected versus actual*. See [Helpers](#helpers),
  [expectedActualExample](examples/expectedActualExample).
- **snapshot()**: snapshot(actual, name). True when the value matches the
  reference file references/<name>.json next to the test patch. The name
  defaults to the assert's @name, so give the assert one, or pass a name, which
  may include a folder: snapshot(in1, 'presets/default'). With no reference yet
  it fails and says how to take one. Related: *snapshot*, *reference*, *taking
  references*. See [Dicts and snapshots](#dicts-and-snapshots),
  [snapshotExample](examples/snapshotExample).
- **rms()**: rms(values). The root mean square of a list of numbers, the usual
  measure of how loud a signal is: 0 for silence, about 0.707 for a full-scale
  sine. rms(in1) > 0 is the default expression of `[mUnit.assert~]`. A single
  number counts as a list of one. Related: *measure*, *peak()*, *capture*. See
  [Helpers](#helpers), [signalExample](examples/signalExample).
- **peak()**: peak(values). The largest absolute value in a list of numbers: the
  loudest sample of a capture, or the largest magnitude in any list. peak(in1)
  <= 1 checks that a signal never clips. Related: *measure*, *rms()*. See
  [Helpers](#helpers), [signalExample](examples/signalExample).
- **dc()**: dc(values). The mean of a list of numbers, which for a signal is its
  DC offset. A filter or oscillator that should be centred on zero passes
  approx(dc(in1), 0, 0.01). Related: *measure*, *rms()*. See
  [Helpers](#helpers), [signalExample](examples/signalExample).
- **maxDiff()**: maxDiff(actual, expected). The largest absolute difference
  between two lists, compared item by item: how far apart two signals or two
  lists of numbers ever get. maxDiff(in1, in2) < 0.001 says two channels agree
  sample for sample. Related: *measure*, *snr()*. See [Helpers](#helpers),
  [signalExample](examples/signalExample).
- **snr()**: snr(actual, reference). The signal-to-noise ratio of one list
  against another, in decibels, treating the difference as noise. 60 dB means
  the two differ by about 0.1 percent; identical lists give infinity. It is what
  @reference on `[mUnit.assert~]` uses, and it works on any two lists of the
  same length. Related: *SNR*, *measure*, *maxDiff()*. See [Helpers](#helpers),
  [Signals: mUnit.assert~ and
  mUnit.stimulus~](#signals-munitassert-and-munitstimulus).
- **freq()**: freq(values). The frequency of a captured channel in Hz, found
  from its zero crossings, precise to a fraction of a Hz even for a short
  capture. Only in `[mUnit.assert~]`, where the sample rate is known; anywhere
  else it throws. approx(freq(in1), 440, 1) checks an oscillator. Related:
  *measure*, *capture*. See [Signals: mUnit.assert~ and
  mUnit.stimulus~](#signals-munitassert-and-munitstimulus),
  [signalExample](examples/signalExample).
- **planeMin(), planeMean(), planeMax()**: planeMin, planeMean, planeMax(matrix,
  plane). The smallest, the mean and the largest value in one plane of a matrix,
  plane 0 by default. For char matrices the values run from 0 to 255.
  approx(planeMean(in1, 0), 0.5, 0.02) checks that a float matrix sits around a
  half. Related: *matrix input*, *cell()*, *measure*. See [Matrices: Jitter in
  mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).
- **cell()**: cell(matrix, x, y, plane). One cell of a matrix: all its planes as
  a list, or one plane's value when plane is given. y may be left out for a
  one-dimensional matrix. cell(in1, 0, 0) === 255 looks at the top left pixel.
  Related: *matrix input*, *planeMin(), planeMean(), planeMax()*. See [Matrices:
  Jitter in mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).
- **sameMatrix()**: sameMatrix(actual, expected, maxDiff, maxFraction). True
  when two matrices have the same shape and their cells match within the
  perceptual tolerance: at most maxFraction of the cells may differ by more than
  maxDiff, both 0 by default, meaning identical. A failure reports both shapes
  and how many cells differed. @reference does the same against a .jxf file.
  Related: *matrix reference*, *tolerance*, *matrix input*. See [Matrices:
  Jitter in mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).
- **matrix input**: How a jit_matrix arrives at an expression: a value with dim
  (the size per dimension, as a list), planes, type (char, long, float32 or
  float64) and every cell, so in1.dim`[0]` == 64 && in1.planes == 4 checks the
  shape, and the matrix helpers read the cells. In the results a matrix appears
  as its shape and cell count. Related: *inputs: in1 to in10*, *readback*,
  *matrix reference*. See [Matrices: Jitter in
  mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).

### Signals and Jitter

- **stimulus**: A known input you feed into the unit under test.
  `[mUnit.stimulus~]` makes test signals that are the same sample for sample on
  every run: a sine, an impulse, a sweep, seeded noise, silence or a sound file.
  Related: *unit under test*, *repeatable*, *capture*. See the
  `[mUnit.stimulus~]` help patcher, [signalExample](examples/signalExample).
- **capture**: The recording `[mUnit.assert~]` makes of its signal inlets, for
  @duration milliseconds from the test start or from a bang. The expression then
  sees each channel as a list of samples, so the helpers and measures work on it
  like on any list. A failing signal assert keeps its capture as actual.wav.
  Related: *stimulus*, *measure*, *failure files*. See the `[mUnit.assert~]`
  help patcher, [Signals: mUnit.assert~ and
  mUnit.stimulus~](#signals-munitassert-and-munitstimulus).
- **measure**: One number that summarises a signal or a list so an expression
  can compare it: rms, peak, dc (the mean), freq (the frequency from the zero
  crossings), maxDiff and snr against another list. Testing a measure is more
  robust than testing samples one by one. Related: *helper*, *rms()*, *peak()*,
  *freq()*, *tolerance*. See [Helpers](#helpers),
  [signalExample](examples/signalExample).
- **SNR**: Signal-to-noise ratio, in decibels: how close a capture is to its
  reference, treating the difference as noise. A signal assert with @reference
  passes when the SNR is at least @snr, 60 dB by default, which is a difference
  of about 0.1 percent. @exact 1 demands identical samples instead. Related:
  *reference*, *tolerance*, *latency*, *snr()*. See [Signals: mUnit.assert~ and
  mUnit.stimulus~](#signals-munitassert-and-munitstimulus).
- **latency**: A lead or lag, in samples, between a capture and its reference,
  for example from a delay inside the unit under test. @maxLatency lets the
  comparison slide the two by up to that many samples; the alignment found is
  reported as latency in the result. Related: *SNR*, *reference*. See [Signals:
  mUnit.assert~ and mUnit.stimulus~](#signals-munitassert-and-munitstimulus).
- **non-realtime driver**: Max's NonRealTime audio driver renders audio as fast
  as the machine can, needs no audio hardware, and produces the same samples on
  every run, which is what a test and a CI machine want. The dsp key in the
  config switches a suite to it, with a sample rate and vector size, and
  restores your settings afterwards. Related: *repeatable*, *CI*. See [DSP for a
  suite](#dsp-for-a-suite), [signalExample](examples/signalExample).
- **matrix reference**: A Jitter matrix saved as a .jxf file that a matrix
  assert compares against with @reference. GPUs and drivers differ in the last
  bit, so the comparison takes a perceptual tolerance: @maxDiff 2 @maxFraction
  0.001 means at most 0.1 percent of the cells may differ by more than 2 out of
  255. Related: *reference*, *tolerance*, *readback*. See [Matrices: Jitter in
  mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).
- **readback**: Getting what the GPU drew back into a Jitter matrix so an assert
  can look at it: a jit.gl.pix or jit.gl.texture sent to jit.matrix, or
  jit.gl.asyncread after a render. It needs a visible destination, such as a
  named jit.pwindow in the test patch, and a display on the machine that runs
  the test. Related: *matrix reference*. See [Matrices: Jitter in
  mUnit.assert](#matrices-jitter-in-munitassert),
  [jitterExample](examples/jitterExample).

### Running suites

- **handler**: `[mUnit.handler]`, the object that runs a suite: every assert
  registers with it, it collects their verdicts, decides when the run is
  finished, writes the results and the log, and applies the configuration. One
  handler per run; a second one would collect everything twice. Related:
  *suite*, *harness*, *settle*. See the `[mUnit.handler]` help patcher,
  [mUnit.handler](#munithandler).
- **harness**: `[mUnit.harness]`, which points the handler at a munit.config.js
  and opens a folder of test patches, all at once or one at a time, so one patch
  runs a whole suite. More generally, a harness is whatever holds the tests and
  runs them. Related: *handler*, *test wrangler*, *sequential mode*. See the
  `[mUnit.harness]` help patcher,
  [loadInFolderExample](examples/loadInFolderExample).
- **test wrangler**: The patch you open to run a suite: a harness connected to a
  handler, saved next to the config and the folder of tests. `munit init` on the
  cli writes one as runTests.maxpat; open it in Max, or give it to `munit run`.
  Related: *harness*, *handler*, *runner*. See [Starting a
  suite](#starting-a-suite),
  [loadInFolderExample](examples/loadInFolderExample).
- **registration**: An assert announces itself to the handler when its patch
  loads, so the handler knows what to wait for. The run finishes once every
  registered assert has reported and nothing new has registered for a settle
  window. A run in which no assert registers cannot pass and the command line
  exits with 2 in this case. Related: *handler*, *settle*, *exit code*. See
  [mUnit.handler](#munithandler).
- **settle**: The quiet time the handler waits for after the last assert
  reported before it calls the run finished: settleMs in the config, 1000 ms by
  default. It gives late patches time to register and the console output of the
  last test time to arrive. Related: *registration*, *timeout*. See
  [Configuration](#configuration).
- **sequential mode**: Opening one test patch at a time, waiting until its
  asserts have finished, closing it and opening the next, with @sequential 1 on
  the harness or --sequential on the command line. Slower than opening every
  patch at once, but patches cannot interfere through shared send and receive
  names, DSP or CPU load. Related: *harness*, *flaky test*. See
  [sequentialHarnessExample](examples/sequentialHarnessExample),
  [mUnit.Harness](#munitharness).
- **configuration**: A munit.config.js next to the test wrangler that tells the
  handler how to run: where results go, which formatters write them, the settle
  and timeout values, DSP settings for signal tests, whether console errors fail
  the suite. The harness loads it, and every key is optional. Related:
  *handler*, *harness*, *output folder*. See [Configuration](#configuration),
  [simpleConfigExample](examples/simpleConfigExample).
- **runner**: The program that starts the tests for you and reports the result:
  on the command line, `munit run`. It starts Max, opens the suite, prints each
  verdict, quits Max and exits with a code a script can act on, so a suite can
  run from a terminal or a CI job without anyone clicking. Related: *exit code*,
  *CI*, *test wrangler*. See [Running a suite](#running-a-suite), [munit-cli on
  npm](https://www.npmjs.com/package/munit-cli).
- **exit code**: The number a command line program ends with, which scripts and
  CI read as its result. `munit run` and `munit lint` exit with 0 when
  everything passed, 1 when something failed, and 2 when they could not run at
  all, such as Max not starting or no asserts registering. Related: *runner*,
  *CI*. See [Running a suite](#running-a-suite), [Linting
  patchers](#linting-patchers).

### Results and CI

- **CI**: Continuous integration: a server that runs your tests on every push
  and refuses, or at least flags, a change that breaks them. A Max suite needs a
  machine with Max installed and a logged-in desktop session; the linter runs
  anywhere. mUnit talks to CI through exit codes and JUnit files. Related: *exit
  code*, *JUnit*, *lint*. See [Running a suite](#running-a-suite),
  [JUnitResultsExample](examples/JUnitResultsExample).
- **result formatter**: How the handler writes the results of a run: Json by
  default, JUnit for CI, Html to read in a browser, or a formatter you write in
  JavaScript, and several at once if you like. Each one writes a results file
  into the output folder. Related: *JUnit*, *log formatter*, *output folder*.
  See [Result Formatter](#result-formatter),
  [customResultAndLogFormatters](examples/customResultAndLogFormatters).
- **JUnit**: An XML format for test results that nearly every CI system
  understands: GitHub Actions, GitLab, Jenkins and the rest. mUnit writes it
  with the JUnit result formatter, one testsuite per suite, each failure with
  its message, expected versus actual and links to its files. Related: *result
  formatter*, *CI*, *failure files*. See [Result Formatter](#result-formatter),
  [The JUnit XML format](https://github.com/testmoapp/junitxml).
- **log formatter**: How the console output captured during a run is written to
  the log file, log.txt by default. A custom log formatter reshapes the lines,
  for example into the format your CI provider shows best. Log output filters
  leave matching lines out, to keep secrets out of a shared console. Related:
  *result formatter*, *output folder*. See [Log Formatter](#log-formatter),
  [customResultAndLogFormatters](examples/customResultAndLogFormatters).
- **output folder**: Where a run writes its results, its log and its failure
  files: outputDir in the config, logs next to the config by default, or
  --output on the command line. With runFolder set each run gets its own
  timestamped folder inside it. Related: *configuration*, *failure files*. See
  [Configuration](#configuration).
- **console errors**: Anything printed to the Max console as an error while the
  suite runs. With ignoreConsoleErrors set to false in the config, one error
  fails the whole run even if every assert passed, which catches problems no
  assert was watching for. Related: *configuration*, *verdict*. See
  [consoleErrorExample](examples/consoleErrorExample), [Ignore Console
  Errors](#ignore-console-errors).

### Linting

- **lint**: Checking a patcher file for problems by reading the saved file
  against a set of rules, without opening or running it: eg. no zl.reg in this
  project, every v8 has @autowatch 0, no fan-out without a trigger. munit lint
  does it from the command line and in CI; `[mUnit.lint]` does it in Max every
  time you save. Related: *rule*, *finding*, *lint server*. See the
  `[mUnit.lint]` help patcher, [Linting patchers](#linting-patchers),
  [lintExample](examples/lintExample).
- **rule**: One check the linter makes, written as a JSON object: a kind that
  says what is checked, settings that say on what, a level, a message, and
  optinally a fix. When the JSON kinds cannot say it, a rule of kind `script`
  names a JavaScript module that does. Related: *lint*, *level*, *fix*. See
  [Rules](#rules), [lintExample](examples/lintExample).
- **finding**: One thing a rule reports about one box: the rule, its level, the
  file and the subpatchers on the way to the box, its position, and the message.
  The Max console, the text report and the JUnit report all list findings;
  --format json prints them for a tool to read. Related: *rule*, *level*. See
  [Linting patchers](#linting-patchers).
- **level**: How serious a rule's findings are: off, warn or block. A warning is
  shown and nothing more; a blocking finding makes munit lint exit with 1, which
  fails the CI job. Start a new rule at warn, and raise it to block once the
  project is clean. Related: *rule*, *exit code*, *override*. See
  [Rules](#rules).
- **config cascade**: How the munit-lint.json files that apply to a patch are
  found and combined: every one in the patch's folder and in the folders above
  it, outermost first, until one says root is true. Each inner config adds to
  the outer ones, so a subfolder can be stricter than its project without
  repeating it. Related: *override*, *lint server*. See
  [Configuration](#configuration-1),
  [lintConfigExample](examples/lintConfigExample).
- **override**: A per-file change of rule levels in a config: help files held to
  a different standard than test patches, a legacy folder where a rule is off.
  Later overrides win, and --list-rules shows the rules in force for a file
  after every override. Related: *config cascade*, *level*. See
  [Configuration](#configuration-1).
- **fix**: An edit a rule knows how to make: replace an object, set an
  attribute. munit lint --fix, the fix message to `[mUnit.lint]` or the Apply
  fixes switch in the lint server apply them and write the patches back, as
  small edits that leave the rest of the file as Max saved it. Related: *rule*,
  *lint server*. See [Fixing](#fixing).
- **lint server**: `[mUnit.lint]` left running while you work, so every patch
  you save is linted at once and the findings appear in the Max console. Extras
  > mUnit > mUnit Lint Server is a ready-made one: automatic for whatever you
  save anywhere, or watching a project folder as the top of the config cascade.
  Related: *lint*, *config cascade*, *fix*. See **Extras > mUnit > mUnit Lint
  Server**, [Linting in Max, as you save](#linting-in-max-as-you-save).
<!-- glossary:end -->

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
