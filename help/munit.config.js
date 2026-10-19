// munit.config.js for the mUnit help patchers (help/*.maxhelp).
// Each help file holds [mUnit.harness] -> [mUnit.handler], so its examples run
// as a suite when it opens. Results go to help/logs.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  suiteTimeout: 60000,
  outputDir: "./logs",
};
