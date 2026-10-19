// munit.config.js
// The sequential harness example. All three tests pass.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  outputDir: "./logs",
};
