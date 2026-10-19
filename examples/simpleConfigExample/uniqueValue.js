const mLib = require("libmunit");
/** @type {unknown[]} */
const hist = [];
/** @type {import("libmunit").AssertionHandler} */
function assert(data) {
  const found = hist.indexOf(data[0]);
  hist.push(data[0]);
  if (found > -1) {
    return mLib.State.Fail;
  }
  return mLib.State.Continue;
}
module.exports = assert;
