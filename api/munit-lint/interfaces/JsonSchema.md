[munit-lint](../README.md) / JsonSchema

# Interface: JsonSchema

A JSON Schema fragment, as far as [validateAgainstSchema](../functions/validateAgainstSchema.md) reads it.

## Indexable

```ts
[keyword: string]: unknown
```

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="type"></a> `type?` | `string` \| `string`[] | `"string"`, `"number"`, `"integer"`, `"boolean"`, `"array"`, `"object"`, `"null"`, or a list of them. |
| <a id="enum"></a> `enum?` | `unknown`[] | The value must be one of these. |
| <a id="const"></a> `const?` | `unknown` | The value must be exactly this. |
| <a id="required"></a> `required?` | `string`[] | Property names an object must have. |
| <a id="properties"></a> `properties?` | `Record`\<`string`, `JsonSchema`\> | Schemas for an object's properties. |
| <a id="additionalproperties"></a> `additionalProperties?` | `boolean` \| `JsonSchema` | `false` forbids properties not listed in `properties`; a schema applies to them. |
| <a id="items"></a> `items?` | `JsonSchema` | The schema of every item of an array. |
| <a id="minitems"></a> `minItems?` | `number` | The fewest items an array may have. |
| <a id="maxitems"></a> `maxItems?` | `number` | The most items an array may have. |
| <a id="minimum"></a> `minimum?` | `number` | The smallest number allowed. |
| <a id="maximum"></a> `maximum?` | `number` | The largest number allowed. |
| <a id="minlength"></a> `minLength?` | `number` | The shortest string allowed. |
| <a id="maxlength"></a> `maxLength?` | `number` | The longest string allowed. |
| <a id="pattern"></a> `pattern?` | `string` | A regular expression a string must match. |
| <a id="anyof"></a> `anyOf?` | `JsonSchema`[] | The value must match at least one of these. |
| <a id="oneof"></a> `oneOf?` | `JsonSchema`[] | The value must match exactly one of these. |
| <a id="allof"></a> `allOf?` | `JsonSchema`[] | The value must match all of these. |
| <a id="not"></a> `not?` | `JsonSchema` | The value must not match this. |
| <a id="description"></a> `description?` | `string` | What the option is for; ignored by validation. |
| <a id="default"></a> `default?` | `unknown` | The value when the option is left out; ignored by validation, so apply it in `check`. |
