[libmunit](../README.md) / LogFormatter

# Interface: LogFormatter

Renders the captured Max console log when the suite finishes, as the
`logFormatter` of a [HandlerConfig](HandlerConfig.md). The built-in `"Txt"` writes the
lines as they were captured, to `log.txt`.

## Example

```js
const shouting = {
  configure(config) {},
  render(log) { return log.join("\n").toUpperCase(); },
  fileExtension() { return "txt"; },
};
```

## Methods

### configure()

```ts
configure(config): void;
```

Called once with the formatter's options, before any rendering.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `config` | [`LogFormatterOptions`](LogFormatterOptions.md) \| `null` |

#### Returns

`void`

***

### render()

```ts
render(log): string;
```

The text to write, from the captured log lines after `logOutputFilters`.

#### Parameters

| Parameter | Type |
| ------ | ------ |
| `log` | `string`[] |

#### Returns

`string`

***

### fileExtension()

```ts
fileExtension(): string;
```

The extension of the written file, without the dot: the file is `log.<extension>`.

#### Returns

`string`
