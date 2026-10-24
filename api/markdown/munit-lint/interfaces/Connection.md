[munit-lint](../README.md) / Connection

# Interface: Connection

A patch cord with both ends resolved to their boxes, from [connectionsFrom](../functions/connectionsFrom.md) and [connectionsTo](../functions/connectionsTo.md).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="line"></a> `line` | [`Line`](Line.md) | The cord as saved. |
| <a id="source"></a> `source` | [`Box`](Box.md) | The box the cord leaves. |
| <a id="outlet"></a> `outlet` | `number` | The outlet it leaves from, numbered from 0. |
| <a id="destination"></a> `destination` | [`Box`](Box.md) | The box the cord enters. |
| <a id="inlet"></a> `inlet` | `number` | The inlet it enters, numbered from 0. |
| <a id="disabled"></a> `disabled` | `boolean` | Whether the cord is disabled. |
