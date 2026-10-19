// munit.config.js

/**
 * A custom configuration for mUnit that formats logs in a specific way.
 * Most of the time the default formatter should be fine, but you might need to implement this
 * to use features such as log colours in the CI.
 * @type {import("libmunit").LogFormatter}
 */
const myLogFormatter = {
  configure(config) {
    // Nothing to configure: the options object is yours to define
  },
  render(log) {
    return log !== undefined
      ? "ARRGHHHH:" + log.join("\nARRGHHHH: ")
      : "No Logs Available";
  },
  fileExtension() {
    return "screaming.log.txt";
  },
};

// Helper function to convert an object to a string representation, one
// property per line. Nested values (such as the recorded runs) are written as
// JSON, so they don't collapse to "[object Object]".
function objToString(obj) {
  var str = "";
  for (var p in obj) {
    if (Object.prototype.hasOwnProperty.call(obj, p)) {
      var value = obj[p];
      str += p + "::" + (value !== null && typeof value === "object" ? JSON.stringify(value) : value) + "\n";
    }
  }
  return str;
}

/**
 * A custom result formatter for mUnit that formats the results in a specific way.
 * This is more complex than the log formatter as you are passed more data.
 * But it means you could do things like mixing the assert and result data together to make it easier to read,
 * or group the output by the test suite name.
 * @type {import("libmunit").ResultFormatter}
 */
let resultOptions = null;
const myResultFormatter = {
  configure(config) {
    // Keep the options for render(); a formatter object has no fields of its own
    resultOptions = config;
  },

  render(asserts, results) {
    let output = "";
    if (asserts !== undefined) {
      output += "ASSERTS:\n\n";
      for (const element of asserts) {
        output += objToString(element) + "\n\n";
      }
      output += "\n\n";
    }
    if (results !== undefined) {
      output += "RESULTS:\n\n";
      /*
          state: State
          passCount: number
          failCount: number
          results: assertState[]
    */
      output += "State: " + results.state + "\n";
      output += "Pass Count: " + results.passCount + "\n";
      output += "Fail Count: " + results.failCount + "\n\n";
      output += "Test Results:\n\n";
      for (const element of results.results) {
        output += objToString(element) + "\n";
      }
      output += "\n\n";
    }
    return output;
  },

  fileExtension() {
    return "txt";
  },
};

/**
 * @type {import("libmunit").HandlerConfig}
 */
const config = {
  logFormatter: myLogFormatter,
  resultFormatter: myResultFormatter,
  ignoreConsoleErrors: true,
  logOutputFilters: [],
  logObjectFilters: [],
  outputDir: "./logs",
};
module.exports = config;
