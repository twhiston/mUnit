[libmunit](../README.md) / ResultFormatter

# Interface: ResultFormatter

Renders the results of a suite, as the `resultFormatter` of a
[HandlerConfig](HandlerConfig.md). The built-in `"Json"` writes `results.json`,
`"JUnit"` writes `results.xml` for CI systems and `"Html"` writes a
`results.html` overview to open in a browser.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="name"></a> `name?` | `string` | Names the file when another formatter in the list has the same extension: `results.<name>.<extension>`. Without it the formatter's position in the list (from 1) is used. |

## Methods

### configure()

```ts
configure(config): void;
```

Called once with the formatter's options, before any rendering.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `config` | [`ResultFormatterOptions`](ResultFormatterOptions.md) \| `null` |

#### Returns

`void`

***

### render()

```ts
render(
   asserts, 
   results, 
   log?
): string;
```

The text to write.

#### Parameters

| Parameter | Type | Description |
| ------ | ------ | ------ |
| `asserts` | [`assertSettings`](../classes/assertSettings.md)[] | every assert as registered, in registration order |
| `results` | [`finalisedResults`](finalisedResults.md) | the suite's verdict and each assert's result |
| `log?` | `string`[] | the captured log after output filtering |

#### Returns

`string`

***

### fileExtension()

```ts
fileExtension(): string;
```

The extension of the written file, without the dot: the file is `results.<extension>` (see [HandlerConfig.resultFormatter](HandlerConfig.md#resultformatter)).

#### Returns

`string`
