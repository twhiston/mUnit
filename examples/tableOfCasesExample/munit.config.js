// munit.config.js
// The table-of-cases example. One assert fails on purpose.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  outputDir: "./logs",
};
