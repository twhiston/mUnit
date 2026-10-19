// munit.config.js
// The snapshot example: dict inputs, references and taking references.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  takeReferences: false,   // true: snapshots write their references instead of comparing
  outputDir: "./logs",
};
