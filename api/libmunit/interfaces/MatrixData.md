[libmunit](../README.md) / MatrixData

# Interface: MatrixData

A Jitter matrix as a value: what a `jit_matrix` on a data inlet arrives as,
in expressions, custom asserts and the matrix helpers. Cells are stored as
Jitter does, planes interleaved and the first dimension fastest:
`data[((y * width + x) * planes) + plane]` for a 2D matrix.

## Extends

- [`MatrixShape`](MatrixShape.md)

## Properties

| Property | Type | Description | Inherited from |
| ------ | ------ | ------ | ------ |
| <a id="dim"></a> `dim` | `number`[] | The dimensions, e.g. `[320, 240]`. | [`MatrixShape`](MatrixShape.md).[`dim`](MatrixShape.md#dim) |
| <a id="planes"></a> `planes` | `number` | How many planes each cell has (4 for ARGB). | [`MatrixShape`](MatrixShape.md).[`planes`](MatrixShape.md#planes) |
| <a id="type"></a> `type` | [`MatrixType`](../type-aliases/MatrixType.md) | The cell type. | [`MatrixShape`](MatrixShape.md).[`type`](MatrixShape.md#type) |
| <a id="data"></a> `data` | `ArrayLike`\<`number`\> | Every value, `dim[0] * dim[1] * ... * planes` of them. | - |
