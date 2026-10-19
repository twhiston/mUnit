// munit.config.js
// The signal example: stimulus, capture, measure, compare with a reference.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  suiteTimeout: 60000,
  dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },   // applied for the suite, restored afterwards
  outputDir: "./logs",
  takeReferences: false
};
