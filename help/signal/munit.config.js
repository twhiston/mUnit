// munit.config.js for the signal help patchers (mUnit.assert~ and
// mUnit.stimulus~), loaded by [mUnit.harness @configFolder signal].
// The NonRealTime driver needs no audio hardware, renders faster than real
// time and gives the same samples on every machine; the handler restores the
// previous audio settings when the suite ends.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  suiteTimeout: 60000,
  dsp: { driver: "NonRealTime", sr: 44100, vs: 64 },   // 44.1 kHz: the rate of the sounds Max ships with
  outputDir: "../logs",
};
