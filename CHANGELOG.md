# Changelog

mUnit follows [semantic versioning](https://semver.org): until 1.0.0, a minor
version (0.x.0) may change behaviour; from 1.0.0 on, only a major version will.
The Max package and the `munit-cli` npm package are released together and carry
the same version.

## Unreleased

The first public release.

- `[mUnit.assert]`: JavaScript expressions over up to ten inputs of any type,
  custom asserts in JavaScript, expected-versus-actual failures, helpers
  (`approx`, `equals`, signal and matrix measures), dict snapshots against
  reference files, tables of cases (`@every`), `@skip` and `@only`, and Jitter
  matrices (CPU, and GL read back from the GPU) against `.jxf` references with
  perceptual tolerances.
- `[mUnit.assert~]` and `[mUnit.stimulus~]`: signal tests under the non-realtime
  driver, measured (`rms`, `peak`, `freq`) or against wav references.
- `[mUnit.handler]`: suites that always finish, with a settle window and a suite
  timeout; JSON, JUnit and HTML results, several at once; custom log and result
  formatters; configuration in `munit.config.js`.
- `[mUnit.harness]`: runs every test patch in a folder, at once or one at a
  time, recursively and by pattern.
- `munit init`: sets up a suite folder with a test wrangler patch (harness and
  handler), a `munit.config.js`, a `munit-lint.json`, a `.gitignore` for its
  `logs/` folder, and a `patchers/` folder for the tests.
- `[mUnit.loadbang]` and `[mUnit.teardown]`: start once mUnit is ready, and
  clean up afterwards.
- `[mUnit.lint]` and `munit lint`: patcher linting with JSON and JavaScript
  rules, overrides per folder, fixes, and JUnit output; `@followfront 0` ties
  the object to its folder, leaving the patch in front alone.
- **Extras > mUnit Lint Server**: a patch to leave open while you work that
  lints whatever you save, wherever it is, with the config nearest to the patch;
  or, with a project folder chosen, with that folder as the top of the config
  cascade (`@folder none` and `@root 1` on `[mUnit.lint]`).
- `munit run`: runs a suite in Max from the command line (macOS) with exit codes
  for CI. Also on npm as `munit-cli`.
- Help patchers and reference pages for every object, 19 examples, and typings
  for custom asserts, formatters, configs and lint rules (with their reference
  pages, under `api/`).

### Fixed since 1.0.0-rc.2

- The command line needs Node 18 or newer. On an older Node, the copy in the
  Max package (what a `munit` alias runs) now says so, names the `node` it
  found and exits 2, instead of failing with `SyntaxError: Unexpected token
  '{'` in `lint/index.js`. The `munit-cli` npm package still can't be read by
  a Node that old, but npm warns about its Node 18 requirement on install.
- `@only` now skips every other assert instead of running it. Before, the
  other asserts were evaluated and turned green or red, and were only
  reported as skipped in the results. Now they are skipped without being
  evaluated, and their boxes turn yellow. A signal or matrix assert that
  `@only` skips no longer overwrites its reference file under
  `--take-references`. An assert that finished before the `@only` assert
  was loaded (an earlier patch in a sequential run) has still run, and is
  still reported as skipped.
- Signal tests now pass with Overdrive on. With it on, `[mUnit.loadbang]`
  fired at high priority, so `[mUnit.assert~]` resized its capture `buffer~`
  after `record~` had started and the capture began with silence (about
  170 ms of it in our runs), failing `rms` and reference checks and skewing
  `freq()` (a 440 Hz sine read as 444 Hz on a tester's machine). It now fires
  through `[defer]`, at low priority whether Overdrive is on or off. The
  max-e2e suite runs the MSP cases under Overdrive as well.
- The `dsp` config now confirms DSP before any test runs. The handler switches
  DSP off, applies the settings, switches it back on, and starts the tests only
  once `[dspstate~]` reports the driver, rate and vector size asked for, held
  for half a second. Before, the tests started after a fixed wait, or after the
  wait ran out with only a warning. If DSP isn't confirmed within 5 seconds
  plus `settleMs`, no tests run and the suite fails with the reason. A DSP
  change while the suite runs fails the suite too, and a restart at the same
  settings is logged as a warning. A `reset` applies the settings again before
  it announces ready.
- `[mUnit.assert~]` keeps the capture of any failed assert as
  `<assert name>.actual.wav` in the run's `artifacts/` folder, not only of a
  failed `@reference` comparison, so a failing measurement can be opened and
  looked at.
- The Jitter example no longer crashes Max with Overdrive on. Its
  `[metro 50]` banged `[jit.world]` on the scheduler thread, so the first
  frame created the GL context off the main thread, which macOS 26 kills Max
  for (`-[NSOpenGLContext setView:] must be called from the main thread`). It
  now uses `[qmetro 50]`, which always bangs on the main thread.
- `mUnit:recommended` warns about the same wiring anywhere:
  `gl-render-from-metro` flags a `[metro]` whose cords reach a `[jit.world]`,
  `[jit.pworld]` or `[jit.gl.render]` without a `[deferlow]`, `[defer]`,
  `[qlim]`, `[jit.qball]` or `[qmetro]` on the way, and `--fix` makes it a
  `[qmetro]`. `gl-render-from-scheduler` does the same for `[delay]`,
  `[pipe]`, `[tempo]`, `[clocker]`, `[line]`, `[snapshot~]`, `[edge~]`,
  `[midiin]`, `[notein]` and `[ctlin]`, with no fix: put a `[deferlow]`
  before the render. Both use a new rule kind, `forbid-path`: a path of
  cords from a `from` box to a `to` box that doesn't pass an `unless` box,
  reported with the path. The `--list-rules` id column is wider for the
  longer ids.
- The README's Quick start now starts with `munit init`, which makes the
  `tests/` folder, the test wrangler and `tests/patchers/` for you.
