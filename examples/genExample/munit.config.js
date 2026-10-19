// munit.config.js for genExample: the non-realtime driver renders the gen~
// tests faster than real time and gives the same samples on every machine;
// the handler restores the previous audio settings when the suite ends.

/** @type {import("libmunit").HandlerConfig} */
const config = {
  resultFormatter: "Json",
  settleMs: 500,
  suiteTimeout: 60000,
  dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },
  outputDir: "./logs",
};
module.exports = config;
