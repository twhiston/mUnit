[munit-lint](../README.md) / RuleScope

# Interface: RuleScope

Which patchers in a file a rule looks at.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="namespace"></a> `namespace` | `string`[] | The patcher namespaces the rule applies to: `box` (an ordinary patcher, the default), `dsp.gen`, `jit.gen`, `rnbo`, or `*` for all of them. |
