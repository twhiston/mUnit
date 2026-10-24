const mLib = require("libmunit");
/**
 * A custom assert over two inputs: the assert needs @dataInlets 2 so that
 * data[1] is in2. It passes when in1 + in2 is 10 and otherwise reports the
 * sum it saw as the actual value.
 * @type {import("libmunit").AssertionHandler}
 */
function assert(data) {
  const sum = Number(data[0]) + Number(data[1]);
  if (sum === 10) {
    return mLib.State.Success;
  }
  return { state: mLib.State.Fail, expected: 10, actual: sum };
}
module.exports = assert;
