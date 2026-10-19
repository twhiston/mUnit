// munit.config.js
// The failure-files example. One assert fails on purpose.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "JUnit",   // results.xml; attachments are linked as [[ATTACHMENT|path]]
  settleMs: 500,
  outputDir: "./logs",
};
