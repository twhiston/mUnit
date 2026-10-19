// munit.config.js

/**
 * @type {import("libmunit").HandlerConfig}
 */
const config = {
  logFormatter: "Txt",
  resultFormatter: "Json",
  ignoreConsoleErrors: true,
  logOutputFilters: [],
  logObjectFilters: ["print"],
  outputDir: "./logs",
};
module.exports = config;
