# Changelog

mUnit follows [semantic versioning](https://semver.org): until 1.0.0, a minor
version (0.x.0) may change behaviour; from 1.0.0 on, only a major version will.
The Max package and the `munit-cli` npm package are released together and
carry the same version.

## Unreleased: 0.1.0

The first public release.

- `[mUnit.assert]`: JavaScript expressions over up to ten inputs of any type,
  custom asserts in JavaScript, expected-versus-actual failures, helpers
  (`approx`, `equals`, signal and matrix measures), dict snapshots against
  reference files, tables of cases (`@every`), `@skip` and `@only`, and
  Jitter matrices (CPU, and GL read back from the GPU) against `.jxf`
  references with perceptual tolerances.
- `[mUnit.assert~]` and `[mUnit.stimulus~]`: signal tests under the
  non-realtime driver, measured (`rms`, `peak`, `freq`) or against wav
  references.
- `[mUnit.handler]`: suites that always finish, with a settle window and a
  suite timeout; JSON, JUnit and HTML results, several at once; custom log
  and result formatters; configuration in `munit.config.js`.
- `[mUnit.harness]`: runs every test patch in a folder, at once or one at a
  time, recursively and by pattern.
- `munit init`: sets up a suite folder with a test wrangler patch (harness and
  handler), a `munit.config.js`, a `munit-lint.json`, a `.gitignore` for its
  `logs/` folder, and a `patchers/` folder for the tests.
- `[mUnit.loadbang]` and `[mUnit.teardown]`: start once mUnit is ready, and
  clean up afterwards.
- `[mUnit.lint]` and `munit lint`: patcher linting with JSON and JavaScript
  rules, overrides per folder, fixes, and JUnit output; `@followfront 0`
  ties the object to its folder, leaving the patch in front alone.
- **Extras > mUnit Lint Server**: a patch to leave open while you work that
  lints whatever you save, wherever it is, with the config nearest to the
  patch; or, with a project folder chosen, with that folder as the top of the
  config cascade (`@folder none` and `@root 1` on `[mUnit.lint]`).
- `munit run`: runs a suite in Max from the command line (macOS) with exit
  codes for CI. Also on npm as `munit-cli`.
- Help patchers and reference pages for every object, 19 examples, and
  typings for custom asserts, formatters, configs and lint rules (with their
  reference pages, under `api/`).
