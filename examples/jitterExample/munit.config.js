// munit.config.js
// The Jitter example: matrices measured and compared with references, on the CPU and read back from the GPU.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  suiteTimeout: 60000,
  outputDir: "./logs",
};
