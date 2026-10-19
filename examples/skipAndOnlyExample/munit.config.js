// munit.config.js
// The skip and only example.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "Json",
  settleMs: 500,
  forbidOnly: false,   // true in CI, so an @only can't be committed by mistake
  outputDir: "./logs",
};
