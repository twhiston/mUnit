// A custom assert with details: the inputs should add up to 10. On a
// failure it reports expected and actual, a message, and keeps the inputs
// as a file next to the results (logs/artifacts/<uuid>/inputs.txt).
const mLib = require("libmunit");

/** @type {import("libmunit").AssertionHandler} */
function assert(data, helpers) {
  const values = Array.isArray(data[0]) ? data[0] : [data[0]];
  const sum = values.reduce((total, v) => total + Number(v), 0);
  if (helpers.approx(sum, 10, 1e-9)) {
    return mLib.State.Success;
  }
  return {
    state: mLib.State.Fail,
    message: "the inputs should add up to 10",
    expected: 10,
    actual: sum,
    attachments: [{ name: "inputs.txt", content: values.join("\n") + "\n" }],
  };
}

module.exports = assert;
