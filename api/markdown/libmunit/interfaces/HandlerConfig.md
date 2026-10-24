[libmunit](../README.md) / HandlerConfig

# Interface: HandlerConfig

What a `munit.config.js` exports, or a `configure` dict sent to
`[mUnit.handler]` contains. Every key is optional; the handler fills in the
defaults and rejects values it can't use, naming the key in the Max console.

Annotate the file with `@type {import("libmunit").HandlerConfig}` for
completion and checking in an editor.

## Example

```js
module.exports = {
  resultFormatter: "JUnit",
  outputDir: "./logs",
  dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },
};
```

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="logformatter"></a> `logFormatter?` | `string` \| [`LogFormatter`](LogFormatter.md) \| `null` | A built-in name (`"Txt"`) or an object implementing [LogFormatter](LogFormatter.md). Default `"Txt"`. |
| <a id="resultformatter"></a> `resultFormatter?` | \| `string` \| [`ResultFormatter`](ResultFormatter.md) \| (`string` \| [`ResultFormatter`](ResultFormatter.md))[] \| `null` | A built-in name (`"Json"`, `"JUnit"`, `"Html"`) or an object implementing [ResultFormatter](ResultFormatter.md), or a list of them to write several result files. Each writes `results.<extension>`; formatters that share an extension write `results.<name>.<extension>` instead. Default `"Json"`. |
| <a id="ignoreconsoleerrors"></a> `ignoreConsoleErrors?` | `boolean` | When false, any error in the Max console fails the suite. Default true. |
| <a id="logoutputfilters"></a> `logOutputFilters?` | (`string` \| `RegExp`)[] | Log lines matching any of these are left out of the written log. |
| <a id="logobjectfilters"></a> `logObjectFilters?` | `string`[] | Console output from these object names is not captured. Default `["node.script"]`. |
| <a id="outputdir"></a> `outputDir?` | `string` | Where results are written. Relative paths resolve against the folder of `munit.config.js`; a `configure` dict must give an absolute path (a leading `~` is expanded). Default `"<that folder>/logs"`. |
| <a id="settlems"></a> `settleMs?` | `number` | The suite finishes once every assert has reported and no assert has registered or reported for this many milliseconds. Default 1000. |
| <a id="suitetimeout"></a> `suiteTimeout?` | `number` | Watchdog: report every unfinished assert as failed after this many milliseconds. 0 disables it. Default 300000 (5 minutes). |
| <a id="teardownms"></a> `teardownMs?` | `number` | How long the handler waits for every `[mUnit.teardown]` to report done before it goes on (closes the patch, quits Max), in milliseconds. 0 doesn't wait. Default 2000. |
| <a id="runfolder"></a> `runFolder?` | `boolean` | Write each run to its own `<outputDir>/<timestamp>/` folder. Default false. |
| <a id="takereferences"></a> `takeReferences?` | `boolean` | Take references: every assert with a reference (snapshots, `@reference`) writes what it got as the reference, and passes. Also turned on by `MUNIT_TAKE_REFERENCES=1`, `munit run --take-references` or a `takeReferences 1` message. Default false. |
| <a id="forbidonly"></a> `forbidOnly?` | `boolean` | Fail the suite when an assert has `@only`, so one can't be committed by mistake. Default false. |
| <a id="dsp"></a> `dsp?` | [`DspConfig`](DspConfig.md) | DSP settings applied when the suite starts and restored when it ends. Default: leave DSP alone. |
