// Type definitions for munit-lint: the API a script lint rule sees: the patcher model, the context and the findings.
// SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
//
// Generated from max/typescript/shared/lint/src/public.ts
// by tools/api-docs/build-typings.js in the TypeScript workspace. Do not edit:
// change the JSDoc in the source, or the export list in public.ts, and run
// `pnpm run api-docs`.
//
// To get completion and checking in VS Code, include this file from a
// jsconfig.json next to your scripts (see the examples/ folder in the package)
// and annotate: /** @type {import("munit-lint").X} */
declare module 'munit-lint' {
  /** The kinds of rule: what `kind` in a rule's JSON may be. */
  export type RuleKind = 'forbid-object' | 'forbid-path' | 'require-attribute' | 'attribute-value' | 'max-instances' | 'fanout-without-trigger' | 'overlapping-boxes' | 'naming' | 'script';

  /** Which patchers in a file a rule looks at. */
  export interface RuleScope {
    /**
     * The patcher namespaces the rule applies to: `box` (an ordinary patcher,
     * the default), `dsp.gen`, `jit.gen`, `rnbo`, or `*` for all of them.
     */
    namespace: string[];
  }

  /** The settings every rule has, whatever its kind. */
  export interface RuleBase {
    /** The rule's id, unique within a config: what findings and overrides name it by. */
    id: string;
    /** `off`, `warn` or `block`; `block` fails `munit lint`. */
    level: Level;
    /** The message of each finding, replacing the kind's default. */
    message?: string;
    /** Which patchers the rule looks at. */
    scope: RuleScope;
    /** Where the rule came from (the rule file, config or built-in set), for error messages. */
    source: string;
  }

  /**
   * One thing a script rule found. Give it a `box` so the finding has a
   * location (the box's patcher is found for you); a finding without one is
   * reported against the patcher, or the file's root patcher.
   */
  export interface ScriptFinding {
    /** What is wrong, in a sentence. */
    message: string;
    /** The box the finding is about; its id and position go into the report. */
    box?: Box;
    /** The patcher the finding is about, when there is no box or the box's patcher isn't the obvious one. */
    patcher?: Patcher;
    /** How `--fix` should change the file; leave out for a finding that can't be fixed. */
    edits?: Edit[];
  }

  /** State a script rule keeps for one run: a fresh object per `munit lint`, shared by `begin`, every `check` and `end`. */
  export type RuleState = Record<string, unknown>;

  /**
   * What a script rule's `check` receives. A rule reports with
   * {@link ScriptContext.report} or by returning findings, or both. The helpers
   * answer the questions rules ask most: what a box is connected to, which
   * boxes are a given object, and who sends and receives by name.
   *
   * Annotate `check` with `@type {import("munit-lint").ScriptCheck}` for
   * completion on `ctx` in an editor.
   *
   * @example
   * ```js
   * exports.check = (ctx) => {
   *   for (const patcher of ctx.patchers) {
   *     for (const box of patcher.boxes) {
   *       if (box.object === "print" && box.args.length === 0) {
   *         ctx.report({ box, message: "give [print] a name" });
   *       }
   *     }
   *   }
   * };
   * ```
   */
  export interface ScriptContext {
    /** The rule being run, with its `options`, `level` and `scope`. */
    rule: ScriptRule;
    /** The whole file: its root patcher and the raw JSON. */
    document: PatcherDocument;
    /** The patchers in the rule's scope, root and nested, in document order. */
    patchers: Patcher[];
    /** The rule's `options` from its JSON, as given, and validated against `meta.options` when the module declares it. */
    options: unknown;
    /** Anything the rule wants to remember during this run; see {@link ProjectHooks}. */
    state: RuleState;
    /** Reports one finding. */
    report: (finding: ScriptFinding) => void;
    /** The cords leaving a box, every outlet or one; `[]` for a box outside the rule's patchers. */
    connectionsFrom: (box: Box, outlet?: number) => Connection[];
    /** The cords entering a box, every inlet or one. */
    connectionsTo: (box: Box, inlet?: number) => Connection[];
    /** Every box that is the object `name` in the rule's patchers; the name is normalised like `match.object`. */
    boxesByObject: (name: string) => Visit[];
    /** Every box that sends to a name in the rule's patchers, bound objects included. */
    sends: () => NamedBox[];
    /** Every box that receives from a name in the rule's patchers, bound objects included. */
    receives: () => NamedBox[];
    /** The `.gendsp`, `.rnbopat` and bpatcher files the document refers to that exist next to it, as absolute paths. */
    relatedFiles: () => string[];
  }

  /** What `exports.meta` of a script rule's module may declare. */
  export interface ScriptMeta {
    /** One line on what the rule checks; `--list-rules` prints it. */
    description?: string;
    /** Whether findings carry edits for `--fix`. */
    fixable?: boolean;
    /**
     * A JSON Schema for the rule's `options`. The loader validates the JSON
     * against it and reports a bad value as a config error, naming the rule
     * and the key, before any patch is linted.
     */
    options?: JsonSchema;
  }

  /** What `begin` and `end` of {@link ProjectHooks} receive. */
  export interface ProjectContext {
    /** The rule, with its `options`, `level` and `scope`. */
    rule: ScriptRule;
    /** The rule's `options`, as in {@link ScriptContext.options}. */
    options: unknown;
    /** Every file of this run, as reported, in the order `check` will see them. */
    files: string[];
    /** The state object `check` sees as `ctx.state`. */
    state: RuleState;
  }

  /** A finding reported from `end`, against one of the run's files. */
  export interface ProjectFinding extends ScriptFinding {
    /** The file, as named in {@link ProjectContext.files}. */
    file: string;
  }

  /** What `end` receives: the project context plus a way to report. */
  export interface ProjectEndContext extends ProjectContext {
    /** Reports one finding against a file of the run. */
    report: (finding: ProjectFinding) => void;
  }

  /**
   * Optional `exports.project` of a script rule's module, for rules that need
   * the whole project rather than one file: `begin` runs once before the
   * files are linted, `check` runs per file and may collect into `ctx.state`,
   * and `end` runs once after, reporting findings against files. Costlier
   * than `check` alone: in Max, a save then lints the whole folder again.
   */
  export interface ProjectHooks {
    /** Runs once before the files are linted, with the list of files; set up `ctx.state` here. */
    begin?: (ctx: ProjectContext) => void;
    /** Runs once after every file was checked; report findings against files with `ctx.report`. */
    end?: (ctx: ProjectEndContext) => void;
  }

  /** The shape of a script rule's module: `check` is required, `meta` and `project` are optional. */
  export interface ScriptModule {
    /** Called once per file with the patchers in the rule's scope. */
    check: ScriptCheck;
    /** A description, whether findings are fixable, and a schema for the options. */
    meta?: ScriptMeta;
    /** Hooks around the file loop, for rules that need the whole project. */
    project?: ProjectHooks;
  }

  /**
   * The function a script rule's module exports as `check`. It may return its
   * findings, report them through the context, or both.
   */
  export type ScriptCheck = (ctx: ScriptContext) => ScriptFinding[] | undefined | void;

  /** A rule of kind `script`: a JavaScript (CommonJS) module decides what to report, under `munit lint` and in `[mUnit.lint]` alike. */
  export interface ScriptRule extends RuleBase {
    /** Always `script`. */
    kind: 'script';
    /** The module exporting `check(ctx)`, as a path relative to the rule file. */
    module: string;
    /** Anything the rule file gives, passed through as {@link ScriptContext.options}. */
    options?: unknown;
    /** The loaded `check`, filled in by the runner, which can require modules. */
    check?: ScriptCheck;
    /** The module's `meta`, once loaded. */
    meta?: ScriptMeta;
    /** The module's `project` hooks, once loaded. */
    project?: ProjectHooks;
    /** This run's state, reset by the runner before each run. */
    state?: RuleState;
  }

  /**
   * A small JSON Schema validator for the `options` of a script rule, which
   * the rule's module describes with `exports.meta.options`. Zero dependencies,
   * like everything shared between node and v8, so it covers the keywords a
   * rule's options need and no more: type, enum, const, required, properties,
   * additionalProperties, items, minItems, maxItems, minimum, maximum,
   * minLength, maxLength, pattern, anyOf, oneOf, allOf, not. Other keywords
   * (description, default, $schema, ...) are ignored.
   */
  /** A JSON Schema fragment, as far as {@link validateAgainstSchema} reads it. */
  export interface JsonSchema {
    /** `"string"`, `"number"`, `"integer"`, `"boolean"`, `"array"`, `"object"`, `"null"`, or a list of them. */
    type?: string | string[];
    /** The value must be one of these. */
    enum?: unknown[];
    /** The value must be exactly this. */
    const?: unknown;
    /** Property names an object must have. */
    required?: string[];
    /** Schemas for an object's properties. */
    properties?: Record<string, JsonSchema>;
    /** `false` forbids properties not listed in `properties`; a schema applies to them. */
    additionalProperties?: boolean | JsonSchema;
    /** The schema of every item of an array. */
    items?: JsonSchema;
    /** The fewest items an array may have. */
    minItems?: number;
    /** The most items an array may have. */
    maxItems?: number;
    /** The smallest number allowed. */
    minimum?: number;
    /** The largest number allowed. */
    maximum?: number;
    /** The shortest string allowed. */
    minLength?: number;
    /** The longest string allowed. */
    maxLength?: number;
    /** A regular expression a string must match. */
    pattern?: string;
    /** The value must match at least one of these. */
    anyOf?: JsonSchema[];
    /** The value must match exactly one of these. */
    oneOf?: JsonSchema[];
    /** The value must match all of these. */
    allOf?: JsonSchema[];
    /** The value must not match this. */
    not?: JsonSchema;
    /** What the option is for; ignored by validation. */
    description?: string;
    /** The value when the option is left out; ignored by validation, so apply it in `check`. */
    default?: unknown;
    [keyword: string]: unknown;
  }

  /**
   * Every way `value` breaks `schema`, one `<path>: <problem>` line each, or
   * `[]` when it conforms. `path` names the value in messages, e.g. `options`.
   */
  export function validateAgainstSchema(value: unknown, schema: JsonSchema, path?: string): string[];

  /**
   * The patcher model: what a saved .maxpat, .maxhelp, .gendsp or .rnbopat
   * looks like to a rule. Built from the JSON on disk, never from a live
   * patcher, so the CLI and the Max server see the same thing.
   */
  /**
   * What kind of patcher: `box` for an ordinary Max patcher, `dsp.gen` inside
   * `[gen~]` and `.gendsp` files, `jit.gen` inside `[jit.gen]`, `[jit.pix]` and
   * `[jit.gl.pix]`, `rnbo` inside `[rnbo~]` and `.rnbopat` files. Max's
   * `classnamespace`, so other values are possible.
   */
  export type Namespace = 'box' | 'dsp.gen' | 'jit.gen' | 'rnbo' | string;

  /** One box in a patcher: an object, message, comment or UI object. */
  export interface Box {
    /** Max's id for the box, e.g. `obj-12`, unique within its patcher. */
    id: string;
    /** Max's class: `newobj` for an object box, `message`, `comment`, `toggle`, ... */
    maxclass: string;
    /** The box text as saved (newobj, message, comment); null for UI objects. */
    text: string | null;
    /**
     * What the box is: the normalised first token of a newobj's text (aliases
     * resolved, so `[t]` and `[trigger]` are both `trigger`, and `[zl reg]` is
     * `zl.reg`), otherwise the maxclass.
     */
    object: string | null;
    /** Positional arguments after the object name, up to the first `@attribute`. */
    args: string[];
    /**
     * Inline `@attributes` from the text (a single value as a string, several
     * as a list of tokens) merged over the attributes Max saved on the box.
     */
    attributes: Record<string, unknown>;
    /** The scripting name, or null. */
    varname: string | null;
    /** `patching_rect`: x, y, width, height. */
    rect: [number, number, number, number] | null;
    /** A nested patcher: `[p]`, `[gen~]`, `[jit.gen]`, `[rnbo~]` and friends. */
    patcher: Patcher | null;
    /** The box's JSON as saved, for anything the model doesn't name. */
    raw: Record<string, unknown>;
  }

  /** A patch cord. */
  export interface Line {
    /** The box id and outlet number it starts from. */
    source: [string, number];
    /** The box id and inlet number it ends at. */
    destination: [string, number];
    /** Whether the cord is disabled. */
    disabled: boolean;
    /** The cord's JSON as saved. */
    raw: Record<string, unknown>;
  }

  /** A patcher: the root of a file, or one nested in a box. */
  export interface Patcher {
    /** What kind of patcher this is. */
    namespace: Namespace;
    /** How to get here from the file's root patcher, as labels, e.g. `['[p main]', '[gen~]']`; empty at the root. */
    path: string[];
    /** The same route as the ids of the boxes holding each nested patcher, which is unambiguous: edits locate a patcher by it. */
    ids: string[];
    /** The boxes, in saved order. */
    boxes: Box[];
    /** The patch cords. */
    lines: Line[];
    /** The patcher's JSON as saved. */
    raw: Record<string, unknown>;
  }

  /** A patch cord with both ends resolved to their boxes, from {@link connectionsFrom} and {@link connectionsTo}. */
  export interface Connection {
    /** The cord as saved. */
    line: Line;
    /** The box the cord leaves. */
    source: Box;
    /** The outlet it leaves from, numbered from 0. */
    outlet: number;
    /** The box the cord enters. */
    destination: Box;
    /** The inlet it enters, numbered from 0. */
    inlet: number;
    /** Whether the cord is disabled. */
    disabled: boolean;
  }

  /** A box that sends or receives by name, from {@link sends} and {@link receives}. */
  export interface NamedBox {
    /** The patcher the box sits in. */
    patcher: Patcher;
    /** The box. */
    box: Box;
    /** The name: the first argument of `[send foo]`, `[r foo]`, `[value foo]`, ... */
    name: string;
    /** `send` for the send family, `receive` for the receive family, `both` for `[value]`, `[pv]`, `[pvar]` and `[pattr]`. */
    role: 'send' | 'receive' | 'both';
  }

  /** A patcher file: `.maxpat`, `.maxhelp`, `.gendsp` or `.rnbopat`. */
  export interface PatcherDocument {
    /** The path the caller knows the file by; reported as given. */
    file: string;
    /** The top-level patcher. */
    root: Patcher;
    /** The file's JSON as saved. */
    raw: Record<string, unknown>;
  }

  /**
   * The object name a box's text tokens denote, as {@link Box.object} holds
   * it: aliases resolved (`t` is `trigger`, `s` is `send`), and a mode
   * argument of `zl` and `mc` folded into a dotted name (`zl reg` is `zl.reg`).
   * Use it to compare a name a rule's options give with `box.object`. Null for
   * no tokens.
   */
  export function normaliseObjectName(tokens: string[]): string | null;

  /** One box and the patcher it sits in, from {@link walkBoxes}. */
  export interface Visit {
    /** The patcher holding the box. */
    patcher: Patcher;
    /** The box. */
    box: Box;
  }

  /** Every box in a patcher and its nested patchers, depth first, with the patcher it sits in. */
  export function walkBoxes(patcher: Patcher): Generator<Visit>;

  /** A patcher and every patcher nested in it, depth first, the given one first. */
  export function walkPatchers(patcher: Patcher): Generator<Patcher>;

  /** The box with that id in the patcher (not its nested patchers), or undefined. */
  export function findBox(patcher: Patcher, id: string): Box | undefined;

  /**
   * The cords leaving a box, in saved order: every outlet, or one outlet when
   * `outlet` is given. Cords stay inside a patcher, so `patcher` is the one the
   * box sits in; a box from another patcher has no connections there.
   */
  export function connectionsFrom(patcher: Patcher, box: Box, outlet?: number): Connection[];

  /** The cords entering a box, in saved order: every inlet, or one inlet when `inlet` is given. */
  export function connectionsTo(patcher: Patcher, box: Box, inlet?: number): Connection[];

  /**
   * Every box that is the object `name` in the given patchers, with its
   * patcher. The name is normalised like {@link Box.object}: `t`, `trigger`,
   * `zl reg` and `zl.reg` all work, and UI objects match by class (`toggle`).
   */
  export function boxesByObject(patchers: Patcher[], name: string): Visit[];

  /**
   * Every box that sends to a name in the given patchers: `[send]`, `[s]`,
   * `[send~]`, `[mc.send~]`, `[forward]`, and the bound objects `[value]`,
   * `[pv]`, `[pvar]` and `[pattr]`, which count on both sides. In document
   * order; a box with no name argument is left out.
   */
  export function sends(patchers: Patcher[]): NamedBox[];

  /** Every box that receives from a name: `[receive]`, `[r]`, `[receive~]`, `[mc.receive~]` and the bound objects. */
  export function receives(patchers: Patcher[]): NamedBox[];

  /** A rule's level: `off` (not run), `warn` (reported) or `block` (reported, and `munit lint` exits 1). */
  export type Level = 'off' | 'warn' | 'block';

  /** A level a finding can have: `warn` or `block`. */
  export type ReportedLevel = Exclude<Level, 'off'>;

  /** Replaces the text of an object, message or comment box. */
  export interface SetTextEdit {
    /** Always `set-text`. */
    op: 'set-text';
    /** The route to the box's patcher as box ids ({@link Patcher.ids}); empty for the root patcher. */
    patcher: string[];
    /** The box's id. */
    box: string;
    /** The new text. */
    text: string;
  }

  /** Sets an attribute: inline in an object box's text (`@autowatch 0`), or as a box key for UI objects. */
  export interface SetAttributeEdit {
    /** Always `set-attribute`. */
    op: 'set-attribute';
    /** The route to the box's patcher as box ids ({@link Patcher.ids}); empty for the root patcher. */
    patcher: string[];
    /** The box's id. */
    box: string;
    /** The attribute's name, without the `@`. */
    name: string;
    /** The value: a number, a string, or a list of them. */
    value: unknown;
  }

  /** Removes a box and the cords connected to it. */
  export interface RemoveBoxEdit {
    /** Always `remove-box`. */
    op: 'remove-box';
    /** The route to the box's patcher as box ids ({@link Patcher.ids}); empty for the root patcher. */
    patcher: string[];
    /** The box's id. */
    box: string;
  }

  /** Adds a box, given as the JSON Max would save for it. */
  export interface InsertBoxEdit {
    /** Always `insert-box`. */
    op: 'insert-box';
    /** The route to the patcher as box ids ({@link Patcher.ids}); empty for the root patcher. */
    patcher: string[];
    /** The box as Max saves it: at least `maxclass`, `text` and `patching_rect`; an `id` is made up when missing. */
    box: Record<string, unknown>;
  }

  /**
   * A change to the patcher file that `--fix` (or `fix` sent to `[mUnit.lint]`)
   * applies. Applying edits and writing the file back in Max's own formatting
   * is the fixer's job; a rule only describes them.
   */
  export type Edit = SetTextEdit | SetAttributeEdit | RemoveBoxEdit | InsertBoxEdit;

  /** One finding, as the reports and `lintFiles` carry it. */
  export interface Diagnostic {
    /** The id of the rule that reported it. */
    rule: string;
    /** The rule's level for this file. */
    level: ReportedLevel;
    /** The file, as reported. */
    file: string;
    /** The nested patchers on the way to the box, as labels; empty for a box in the top-level patcher. */
    patchers: string[];
    /** `patchers` plus the box, e.g. `[p main] > [gen~] > [+ 1]`; empty for a finding about the file. */
    location: string;
    /** The box's id, or null for a finding about a patcher or the file. */
    box: string | null;
    /** The box's position (x, y) in its patcher, when known. */
    position: [number, number] | null;
    /** What is wrong. */
    message: string;
    /** How `--fix` changes the file; empty when the finding can't be fixed. */
    edits: Edit[];
  }

  /** What a lint run produced: the result of `munit lint`, and what `lintFiles` returns. */
  export interface LintRun {
    /** Every file that was linted, as reported (relative to the working directory). */
    files: string[];
    /** Every finding. */
    diagnostics: Diagnostic[];
    /** Why a file or rule could not be linted at all; any entry makes the exit code 2. */
    errors: string[];
    /** The configs that applied to the target, outermost first; empty when the defaults did; absent when it never got that far. */
    configFiles?: string[];
    /** Further configs met in subfolders, which applied to the files under them. */
    nestedConfigFiles?: string[];
    /** The ids of the rules that were active at the target. */
    ruleIds?: string[];
    /** With `--fix`: how many findings were fixed and written back. */
    fixed?: number;
    /** With `--list-rules`: the rules in force for each file, instead of findings. */
    ruleLists?: FileRules[];
    /** A script rule with project hooks ran: the whole run is the unit, so `[mUnit.lint]` lints the folder again after a save. */
    projectHooks?: boolean;
  }

  /** One rule as it applies to a file: its level after overrides, and where it came from. */
  export interface RuleListing {
    /** The rule's id. */
    id: string;
    /** The rule's kind. */
    kind: RuleKind;
    /** The level in force for the file. */
    level: ReportedLevel;
    /** The rule file, built-in set or config the rule came from. */
    source: string;
    /** A script rule's `meta.description`. */
    description?: string;
  }

  /** The rules in force for one file, from `--list-rules`. */
  export interface FileRules {
    /** The file, as reported. */
    file: string;
    /** Every rule in force, in order. */
    rules: RuleListing[];
  }
}
