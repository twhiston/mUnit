// munit.config.js
// The expected-versus-actual example. Three asserts fail on purpose.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",   // results.json carries expected, actual, operator and diff
  settleMs: 500,
  outputDir: "./logs",
};
