// munit.config.js
// The teardown example: hooks that run after the results are final.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  ignoreConsoleErrors: false, // even so, a console error during teardown does not fail the suite
  settleMs: 500,
  teardownMs: 3000,           // how long the handler waits for the teardowns to report done
  outputDir: "./logs",
};
