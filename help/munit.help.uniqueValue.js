// A custom assert for the mUnit.assert help patcher: every input must be new.
// It returns Continue while the inputs differ, so an assert with @maxCalls 3
// passes once three different values have arrived, and Fail on a repeat.
const mLib = require("libmunit");
/** @type {unknown[]} */
const seen = [];
/** @type {import("libmunit").AssertionHandler} */
function assert(data) {
  const found = seen.includes(data[0]);
  seen.push(data[0]);
  return found ? mLib.State.Fail : mLib.State.Continue;
}
module.exports = assert;
