[munit-lint](../README.md) / ProjectHooks

# Interface: ProjectHooks

Optional `exports.project` of a script rule's module, for rules that need
the whole project rather than one file: `begin` runs once before the
files are linted, `check` runs per file and may collect into `ctx.state`,
and `end` runs once after, reporting findings against files. Costlier
than `check` alone: in Max, a save then lints the whole folder again.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| <a id="begin"></a> `begin?` | (`ctx`) => `void` | Runs once before the files are linted, with the list of files; set up `ctx.state` here. |
| <a id="end"></a> `end?` | (`ctx`) => `void` | Runs once after every file was checked; report findings against files with `ctx.report`. |
