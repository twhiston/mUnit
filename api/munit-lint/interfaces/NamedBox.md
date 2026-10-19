[munit-lint](../README.md) / NamedBox

# Interface: NamedBox

A box that sends or receives by name, from [sends](../functions/sends.md) and [receives](../functions/receives.md).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="patcher"></a> `patcher` | [`Patcher`](Patcher.md) | The patcher the box sits in. |
| <a id="box"></a> `box` | [`Box`](Box.md) | The box. |
| <a id="name"></a> `name` | `string` | The name: the first argument of `[send foo]`, `[r foo]`, `[value foo]`, ... |
| <a id="role"></a> `role` | `"send"` \| `"receive"` \| `"both"` | `send` for the send family, `receive` for the receive family, `both` for `[value]`, `[pv]`, `[pvar]` and `[pattr]`. |
