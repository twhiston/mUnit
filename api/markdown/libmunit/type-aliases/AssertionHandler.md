[libmunit](../README.md) / AssertionHandler

# Type Alias: AssertionHandler

```ts
type AssertionHandler = (data, helpers) => 
  | State
  | Outcome;
```

A custom assert: the function a script named in `[mUnit.assert my.js]`
exports (`module.exports = assert`). It is called with the current inputs
`[in1, in2, ...]` and the [ExpressionHelpers](../interfaces/ExpressionHelpers.md), and returns a
[State](../enumerations/State.md), or an [Outcome](../interfaces/Outcome.md) to report expected and actual values,
a message or files as well. A script that throws, or returns something
else, counts as Fail. Set `@dataInlets` on the object, since a script can't
say how many inputs it needs.

## Parameters

| Parameter | Type |
| ------ | ------ |
| `data` | `unknown`[] |
| `helpers` | [`ExpressionHelpers`](../interfaces/ExpressionHelpers.md) |

## Returns

  \| [`State`](../enumerations/State.md)
  \| [`Outcome`](../interfaces/Outcome.md)

## Example

```js
const mLib = require("libmunit");
function assert(data, helpers) {
  return helpers.approx(data[0], 0.5, 1e-3) ? mLib.State.Success : mLib.State.Fail;
}
module.exports = assert;
```
