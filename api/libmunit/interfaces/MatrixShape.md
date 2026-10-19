[libmunit](../README.md) / MatrixShape

# Interface: MatrixShape

The shape of a matrix: its dimensions, plane count and cell type.

## Extended by

- [`MatrixData`](MatrixData.md)

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="dim"></a> `dim` | `number`[] | The dimensions, e.g. `[320, 240]`. |
| <a id="planes"></a> `planes` | `number` | How many planes each cell has (4 for ARGB). |
| <a id="type"></a> `type` | [`MatrixType`](../type-aliases/MatrixType.md) | The cell type. |
