// munit.config.js: `munit run . --tests tests` from this folder runs the test
// patches under tests/ and writes the results here. The lint and the tests
// share the folder, as a project's would.

/** @type {import("libmunit").HandlerConfig} */
module.exports = {
  resultFormatter: "JUnit",
  outputDir: "./logs",
};
