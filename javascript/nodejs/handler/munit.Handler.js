/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/

"use strict";
var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __name = (target, value) => __defProp(target, "name", { value, configurable: true });
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));

// src/munit.Handler.n4m.ts
var fs3 = __toESM(require("node:fs"));
var path4 = __toESM(require("node:path"));
var import_node_module = require("node:module");
var import_max_api = __toESM(require("max-api"));
var import_lib7 = require("@munit-shared/lib");

// src/core/mUnit.polyfills.ts
function groupBy(iterable, callbackfn) {
  const obj = /* @__PURE__ */ Object.create(null);
  let i = 0;
  for (const value of iterable) {
    const key = callbackfn(value, i++);
    const group = obj[key];
    if (group !== void 0) {
      group.push(value);
    } else {
      obj[key] = [value];
    }
  }
  return obj;
}
__name(groupBy, "groupBy");

// src/core/mUnit.DefaultLogFormatter.ts
var DefaultLogFormatterOptions = class {
  static {
    __name(this, "DefaultLogFormatterOptions");
  }
  separator = "\n";
};
var DefaultLogFormatter = class {
  static {
    __name(this, "DefaultLogFormatter");
  }
  config;
  constructor() {
    this.config = new DefaultLogFormatterOptions();
  }
  // Options not given keep their defaults, as for the result formatters
  configure(config2) {
    if (config2 !== null) {
      this.config = { ...new DefaultLogFormatterOptions(), ...config2 };
    }
  }
  render(log2) {
    return log2 !== void 0 ? log2.join(this.config.separator) : "No Logs Available";
  }
  fileExtension() {
    return "txt";
  }
};

// src/core/mUnit.JsonResultFormatter.ts
var JsonResultFormatterOptions = class {
  static {
    __name(this, "JsonResultFormatterOptions");
  }
  spacing;
  replacer;
  constructor() {
    this.spacing = 2;
    this.replacer = (key, value) => {
      if (key === "expressionHandler") {
        return void 0;
      }
      return value;
    };
  }
};
var JsonResultFormatter = class {
  static {
    __name(this, "JsonResultFormatter");
  }
  config;
  constructor() {
    this.config = new JsonResultFormatterOptions();
  }
  // Options not given keep their defaults (F4)
  configure(config2) {
    if (config2 !== null) {
      this.config = { ...new JsonResultFormatterOptions(), ...config2 };
    }
  }
  render(_asserts, results) {
    return results !== void 0 ? JSON.stringify(results, this.config.replacer, this.config.spacing) : "{}";
  }
  fileExtension() {
    return "json";
  }
};

// src/core/mUnit.JUnitResultFormatter.ts
var import_lib = require("@munit-shared/lib");
var JUnitResultFormatterOptions = class {
  static {
    __name(this, "JUnitResultFormatterOptions");
  }
  // The synthetic suite that carries suite-level errors and the captured log
  suiteName = "mUnit";
};
var INVALID_XML = /[\u0000-\u0008\u000B\u000C\u000E-\u001F￾￿]/g;
function escapeXml(text) {
  return String(text).replace(INVALID_XML, "").replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;").replace(/'/g, "&apos;");
}
__name(escapeXml, "escapeXml");
function seconds(ms) {
  return ((ms ?? 0) / 1e3).toFixed(3);
}
__name(seconds, "seconds");
function show(value) {
  try {
    return JSON.stringify(value) ?? String(value);
  } catch {
    return String(value);
  }
}
__name(show, "show");
function failureBody(result) {
  if (result === void 0) {
    return "no result";
  }
  const lines = [];
  if (result.message !== null) {
    lines.push(result.message);
  }
  if (result.expected !== void 0 || result.actual !== void 0) {
    const op = result.operator !== void 0 && result.operator !== "==" && result.operator !== "===" ? `${result.operator} ` : "";
    lines.push(`expected: ${op}${show(result.expected)}`, `actual:   ${show(result.actual)}`);
  }
  if (result.diff !== void 0 && result.diff.length > 0) {
    lines.push("differences:", ...result.diff.map((d) => `  ${d}`));
  }
  lines.push(`runs: ${show(result.runs)}`);
  return lines.join("\n");
}
__name(failureBody, "failureBody");
function attachmentLines(result) {
  return (result?.attachments ?? []).flatMap((a) => a.path !== void 0 ? [`[[ATTACHMENT|${a.path}]]`] : []);
}
__name(attachmentLines, "attachmentLines");
var TIMEOUT_MESSAGE = /^(timed out|no result before the suite timed out)/;
function failureType(result) {
  const last = result.runs.at(-1);
  if (TIMEOUT_MESSAGE.test(result.message ?? "") || TIMEOUT_MESSAGE.test(last?.error ?? "")) {
    return "Timeout";
  }
  return last?.error !== void 0 ? "Exception" : "AssertionFailure";
}
__name(failureType, "failureType");
var JUnitResultFormatter = class {
  static {
    __name(this, "JUnitResultFormatter");
  }
  config;
  constructor() {
    this.config = new JUnitResultFormatterOptions();
  }
  configure(config2) {
    if (config2 !== null) {
      this.config = { ...new JUnitResultFormatterOptions(), ...config2 };
    }
  }
  render(asserts, results, log2 = []) {
    const timestamp = escapeXml(results.startedAt);
    const suites = [];
    let tests = 0;
    let failures = 0;
    let skipped = 0;
    const grouped = groupBy(asserts, (a) => String(a.suite ?? "default"));
    const byUuid = new Map(results.results.map((r) => [r.uuid, r]));
    for (const [suite2, members] of Object.entries(grouped)) {
      const cases = [];
      let suiteFailures = 0;
      let suiteSkipped = 0;
      let suiteTime = 0;
      for (const settings of members) {
        const result = byUuid.get(settings.uuid);
        const name = escapeXml(settings.name ?? settings.uuid ?? "unnamed");
        suiteTime += result?.durationMs ?? 0;
        const open = `    <testcase name="${name}" classname="${escapeXml(suite2)}" assertions="${result?.count ?? 0}" time="${seconds(result?.durationMs)}"`;
        const files = attachmentLines(result);
        const out = files.length > 0 ? [`      <system-out>${escapeXml(files.join("\n"))}</system-out>`] : [];
        if (result?.finalState === import_lib.State.Skipped) {
          suiteSkipped++;
          cases.push(`${open}>`, `      <skipped message="${escapeXml(result.message ?? "skipped")}"/>`, "    </testcase>");
        } else if (result === void 0 || result.finalState !== import_lib.State.Success) {
          suiteFailures++;
          const message = result?.message ?? "no result";
          const type = result === void 0 ? "Timeout" : failureType(result);
          cases.push(`${open}>`);
          cases.push(`      <failure message="${escapeXml(message.split("\n")[0])}" type="${type}">${escapeXml(failureBody(result))}</failure>`);
          cases.push(...out, "    </testcase>");
        } else if (out.length > 0) {
          cases.push(`${open}>`, ...out, "    </testcase>");
        } else {
          cases.push(`${open}/>`);
        }
      }
      tests += members.length;
      failures += suiteFailures;
      skipped += suiteSkipped;
      suites.push(
        `  <testsuite name="${escapeXml(suite2)}" tests="${members.length}" failures="${suiteFailures}" errors="0" skipped="${suiteSkipped}" assertions="${members.length}" time="${seconds(suiteTime)}" timestamp="${timestamp}">`,
        ...cases,
        "  </testsuite>"
      );
    }
    const problems = results.errors;
    const own = [];
    for (const problem of problems) {
      own.push(`    <testcase name="${escapeXml(problem.split("\n")[0])}" classname="${escapeXml(this.config.suiteName)}">`);
      own.push(`      <error message="${escapeXml(problem.split("\n")[0])}" type="SuiteError">${escapeXml(problem)}</error>`);
      own.push("    </testcase>");
    }
    suites.push(
      `  <testsuite name="${escapeXml(this.config.suiteName)}" tests="${problems.length}" failures="0" errors="${problems.length}" skipped="0" time="${seconds(results.durationMs)}" timestamp="${timestamp}">`,
      ...own,
      `    <system-out>${escapeXml(log2.join("\n"))}</system-out>`,
      "  </testsuite>"
    );
    return [
      '<?xml version="1.0" encoding="UTF-8"?>',
      `<testsuites name="${escapeXml(this.config.suiteName)}" tests="${tests + problems.length}" failures="${failures}" errors="${problems.length}" skipped="${skipped}" time="${seconds(results.durationMs)}" timestamp="${timestamp}">`,
      ...suites,
      "</testsuites>"
    ].join("\n");
  }
  fileExtension() {
    return "xml";
  }
};

// src/core/mUnit.HtmlResultFormatter.ts
var import_node_url = require("node:url");
var import_lib2 = require("@munit-shared/lib");
var HtmlResultFormatterOptions = class {
  static {
    __name(this, "HtmlResultFormatterOptions");
  }
  // The page title, before the verdict
  title = "mUnit";
};
var STYLE = [
  ":root{color-scheme:light dark}",
  "body{font:14px/1.5 system-ui,sans-serif;max-width:60em;margin:2em auto;padding:0 1em}",
  ".pass{color:#2e7d32}.fail{color:#c62828}.skip{color:#888}",
  "summary{cursor:pointer;font-weight:600;margin:1em 0 .3em}",
  "table{border-collapse:collapse;width:100%}",
  "td{padding:.2em .5em;border-top:1px solid #8884;vertical-align:top}",
  "td:first-child{width:1em}td:last-child{text-align:right;white-space:nowrap}",
  "pre{margin:.3em 0;white-space:pre-wrap;font-size:12px}"
].join("\n");
function seconds2(ms) {
  return `${((ms ?? 0) / 1e3).toFixed(3)} s`;
}
__name(seconds2, "seconds");
function attachments(result) {
  const links = (result?.attachments ?? []).flatMap((a) => a.path !== void 0 ? [`<a href="${escapeXml((0, import_node_url.pathToFileURL)(a.path).href)}">${escapeXml(a.name)}</a>`] : []);
  return links.length > 0 ? `<br>${links.join(" ")}` : "";
}
__name(attachments, "attachments");
function row(settings, result) {
  const name = escapeXml(settings.name ?? settings.uuid ?? "unnamed");
  const time = `<td>${seconds2(result?.durationMs)}</td>`;
  if (result?.finalState === import_lib2.State.Success) {
    return `<tr><td class="pass">\u2713</td><td>${name}${attachments(result)}</td>${time}</tr>`;
  }
  if (result?.finalState === import_lib2.State.Skipped) {
    return `<tr class="skip"><td>\u2013</td><td>${name} <small>${escapeXml(result.message ?? "skipped")}</small></td>${time}</tr>`;
  }
  return `<tr><td class="fail">\u2717</td><td>${name}<pre>${escapeXml(failureBody(result))}</pre>${attachments(result)}</td>${time}</tr>`;
}
__name(row, "row");
function section(heading, lines, open) {
  return lines.length > 0 ? [`<details${open ? " open" : ""}><summary>${heading}</summary><pre>${escapeXml(lines.join("\n"))}</pre></details>`] : [];
}
__name(section, "section");
var HtmlResultFormatter = class {
  static {
    __name(this, "HtmlResultFormatter");
  }
  config;
  constructor() {
    this.config = new HtmlResultFormatterOptions();
  }
  configure(config2) {
    if (config2 !== null) {
      this.config = { ...new HtmlResultFormatterOptions(), ...config2 };
    }
  }
  render(asserts, results, log2 = []) {
    const passed = results.state === import_lib2.OverallState.Passed;
    const byUuid = new Map(results.results.map((r) => [r.uuid, r]));
    const body = [
      `<h1 class="${passed ? "pass" : "fail"}">${escapeXml(this.config.title)}: ${escapeXml(results.state)}</h1>`,
      `<p>${results.passCount} passed \xB7 ${results.failCount} failed \xB7 ${results.skipCount} skipped \xB7 ${seconds2(results.durationMs)} \xB7 started ${escapeXml(results.startedAt)}</p>`,
      ...section(`Suite problems (${results.errors.length})`, results.errors, true),
      ...section(`Console errors (${results.consoleErrors.length})`, results.consoleErrors, true)
    ];
    for (const [suite2, members] of Object.entries(groupBy(asserts, (a) => String(a.suite ?? "default")))) {
      const states = members.map((m) => byUuid.get(m.uuid)?.finalState);
      const ok = states.filter((s) => s === import_lib2.State.Success).length;
      const failing = states.some((s) => s !== import_lib2.State.Success && s !== import_lib2.State.Skipped);
      body.push(
        `<details${failing ? " open" : ""}><summary class="${failing ? "fail" : "pass"}">${escapeXml(suite2)} \u2014 ${ok}/${members.length} passed</summary>`,
        "<table>",
        ...members.map((m) => row(m, byUuid.get(m.uuid))),
        "</table></details>"
      );
    }
    body.push(...section(`Log (${log2.length} lines)`, log2, false));
    return [
      "<!doctype html>",
      '<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width">',
      `<title>${escapeXml(this.config.title)}: ${escapeXml(results.state)}</title>`,
      `<style>
${STYLE}
</style></head><body>`,
      ...body,
      "</body></html>"
    ].join("\n");
  }
  fileExtension() {
    return "html";
  }
};

// src/core/mUnit.LogFormatter.ts
var LOG_FORMATTERS = {
  txt: /* @__PURE__ */ __name(() => new DefaultLogFormatter(), "txt"),
  text: /* @__PURE__ */ __name(() => new DefaultLogFormatter(), "text"),
  default: /* @__PURE__ */ __name(() => new DefaultLogFormatter(), "default"),
  defaultlogformatter: /* @__PURE__ */ __name(() => new DefaultLogFormatter(), "defaultlogformatter")
};
function createIncludedLogFormatter(name, config2) {
  const create = LOG_FORMATTERS[name.trim().toLowerCase()];
  if (create === void 0) {
    throw new Error(`unknown log formatter "${name}"; use "Txt" or pass a formatter object`);
  }
  const formatter = create();
  formatter.configure(config2);
  return formatter;
}
__name(createIncludedLogFormatter, "createIncludedLogFormatter");

// src/core/mUnit.ResultFormatter.ts
var RESULT_FORMATTERS = {
  json: /* @__PURE__ */ __name(() => new JsonResultFormatter(), "json"),
  jsonresultformatter: /* @__PURE__ */ __name(() => new JsonResultFormatter(), "jsonresultformatter"),
  junit: /* @__PURE__ */ __name(() => new JUnitResultFormatter(), "junit"),
  xml: /* @__PURE__ */ __name(() => new JUnitResultFormatter(), "xml"),
  junitresultformatter: /* @__PURE__ */ __name(() => new JUnitResultFormatter(), "junitresultformatter"),
  html: /* @__PURE__ */ __name(() => new HtmlResultFormatter(), "html"),
  htmlresultformatter: /* @__PURE__ */ __name(() => new HtmlResultFormatter(), "htmlresultformatter")
};
function createIncludedResultFormatter(name, config2) {
  const create = RESULT_FORMATTERS[name.trim().toLowerCase()];
  if (create === void 0) {
    throw new Error(`unknown result formatter "${name}"; use "Json", "JUnit", "Html" or pass a formatter object`);
  }
  const formatter = create();
  formatter.configure(config2);
  return formatter;
}
__name(createIncludedResultFormatter, "createIncludedResultFormatter");

// src/core/config.ts
var os = __toESM(require("node:os"));
var path = __toESM(require("node:path"));
var import_lib3 = require("@munit-shared/lib");
var DEFAULT_SETTLE_MS = 1e3;
var DEFAULT_SUITE_TIMEOUT = 3e5;
var DEFAULT_TEARDOWN_MS = 2e3;
var DEFAULT_DSP_SETTLE_MS = 1500;
var DEFAULT_LOG_OBJECT_FILTERS = ["node.script"];
var CONFIG_FILE_NAME = "munit.config.js";
var ConfigError = class extends Error {
  static {
    __name(this, "ConfigError");
  }
  constructor(message) {
    super(message);
    this.name = "ConfigError";
  }
};
var KNOWN_KEYS = /* @__PURE__ */ new Set([
  "logFormatter",
  "resultFormatter",
  "ignoreConsoleErrors",
  "logOutputFilters",
  "logObjectFilters",
  "outputDir",
  "settleMs",
  "suiteTimeout",
  "teardownMs",
  "dsp",
  "runFolder",
  "takeReferences",
  "forbidOnly"
]);
function toList(value) {
  if (value === void 0 || value === null) {
    return [];
  }
  return Array.isArray(value) ? value : [value];
}
__name(toList, "toList");
function isFormatter(value) {
  if (value === null || typeof value !== "object") {
    return false;
  }
  const f = value;
  return typeof f["render"] === "function" && typeof f["fileExtension"] === "function";
}
__name(isFormatter, "isFormatter");
function resolveFormatter(key, value, create, fallback) {
  if (value === void 0 || value === null) {
    return create(fallback, null);
  }
  if (typeof value === "string") {
    return create(value, null);
  }
  if (isFormatter(value)) {
    return value;
  }
  throw new ConfigError(`${key} must be a formatter name or an object with render() and fileExtension()`);
}
__name(resolveFormatter, "resolveFormatter");
function resolveResultFormatters(value) {
  const entries = toList(value);
  const named = (entries.length > 0 ? entries : ["Json"]).map((entry, i) => {
    const formatter = resolveFormatter("resultFormatter", entry, createIncludedResultFormatter, "Json");
    const own = formatter.name;
    const name = typeof entry === "string" ? entry.trim().toLowerCase() : typeof own === "string" && own.trim() !== "" ? own.trim() : String(i + 1);
    let extension;
    try {
      extension = String(formatter.fileExtension());
    } catch (e) {
      throw new ConfigError(`resultFormatter "${name}": fileExtension() failed: ${String(e)}`);
    }
    return { name, extension, formatter };
  });
  const outputs = named.map(({ name, extension, formatter }) => ({
    fileName: named.filter((n) => n.extension === extension).length > 1 ? `results.${(0, import_lib3.safeFileName)(name)}.${extension}` : `results.${extension}`,
    formatter
  }));
  const seen = /* @__PURE__ */ new Set();
  for (const { fileName } of outputs) {
    if (seen.has(fileName)) {
      throw new ConfigError(`resultFormatter: two formatters would both write ${fileName}; give each a different name`);
    }
    seen.add(fileName);
  }
  return outputs;
}
__name(resolveResultFormatters, "resolveResultFormatters");
function resolveOutputDir(value, baseDir, homeDir) {
  if (value === void 0 || value === null || value === "") {
    if (baseDir === null) {
      throw new ConfigError("outputDir is required when configuring with a dict");
    }
    return path.join(baseDir, "logs");
  }
  if (typeof value !== "string") {
    throw new ConfigError("outputDir must be a path");
  }
  let dir = value;
  if (dir === "~" || dir.startsWith("~/")) {
    dir = path.join(homeDir, dir.slice(1));
  }
  if (path.isAbsolute(dir)) {
    return path.normalize(dir);
  }
  if (baseDir === null) {
    throw new ConfigError(
      `outputDir "${value}" is relative, but a configure dict has no folder to resolve it against. Use an absolute path, or put the config in ${CONFIG_FILE_NAME}`
    );
  }
  return path.resolve(baseDir, dir);
}
__name(resolveOutputDir, "resolveOutputDir");
function resolveDuration(key, value, fallback) {
  if (value === void 0 || value === null) {
    return fallback;
  }
  const n = Number(value);
  if (!Number.isFinite(n) || n < 0) {
    throw new ConfigError(`${key} must be a number of milliseconds (0 or more), got ${String(value)}`);
  }
  return n;
}
__name(resolveDuration, "resolveDuration");
function resolveDsp(value) {
  if (value === void 0 || value === null) {
    return null;
  }
  if (typeof value !== "object" || Array.isArray(value)) {
    throw new ConfigError('dsp must be an object, e.g. { driver: "NonRealTime", sr: 48000, vs: 64 }');
  }
  const dsp = value;
  for (const key of Object.keys(dsp)) {
    if (!["driver", "sr", "vs", "settleMs"].includes(key)) {
      throw new ConfigError(`dsp.${key} isn't a setting; use driver, sr, vs or settleMs`);
    }
  }
  const positive = /* @__PURE__ */ __name((key, v) => {
    if (v === void 0 || v === null) {
      return null;
    }
    const n = Number(v);
    if (!Number.isFinite(n) || n <= 0) {
      throw new ConfigError(`dsp.${key} must be a number above 0, got ${String(v)}`);
    }
    return n;
  }, "positive");
  return {
    driver: dsp.driver === void 0 || dsp.driver === null || String(dsp.driver) === "" ? null : String(dsp.driver),
    sr: positive("sr", dsp.sr),
    vs: positive("vs", dsp.vs),
    settleMs: resolveDuration("dsp.settleMs", dsp.settleMs, DEFAULT_DSP_SETTLE_MS)
  };
}
__name(resolveDsp, "resolveDsp");
function resolveFlag(key, value, fallback) {
  if (value === void 0 || value === null) {
    return fallback;
  }
  if (typeof value === "boolean") {
    return value;
  }
  if (typeof value === "number") {
    return value !== 0;
  }
  if (typeof value === "string") {
    const word = value.trim().toLowerCase();
    if (word === "true" || word === "1") {
      return true;
    }
    if (word === "false" || word === "0" || word === "") {
      return false;
    }
  }
  throw new ConfigError(`${key} must be true or false, got ${JSON.stringify(value) ?? String(value)}`);
}
__name(resolveFlag, "resolveFlag");
function resolveOutputFilters(value) {
  return toList(value).map((f) => {
    if (f instanceof RegExp) {
      return f;
    }
    if (typeof f === "string") {
      try {
        return new RegExp(f);
      } catch (e) {
        throw new ConfigError(`logOutputFilters: ${String(e)}`);
      }
    }
    throw new ConfigError("logOutputFilters must be regular expressions or strings");
  });
}
__name(resolveOutputFilters, "resolveOutputFilters");
function resolveConfig(raw, options) {
  if (raw === null || typeof raw !== "object" || Array.isArray(raw)) {
    throw new ConfigError("the configuration must be an object");
  }
  const cfg = raw;
  const warnings = Object.keys(cfg).filter((key) => !KNOWN_KEYS.has(key)).map((key) => `unknown config key "${key}" ignored`);
  let logFormatter;
  let resultFormatters;
  try {
    logFormatter = resolveFormatter("logFormatter", cfg.logFormatter, createIncludedLogFormatter, "Txt");
    resultFormatters = resolveResultFormatters(cfg.resultFormatter);
  } catch (e) {
    throw e instanceof ConfigError ? e : new ConfigError(e.message);
  }
  const objectFilters = cfg.logObjectFilters === void 0 || cfg.logObjectFilters === null ? DEFAULT_LOG_OBJECT_FILTERS : toList(cfg.logObjectFilters).map(String);
  const config2 = {
    logFormatter,
    resultFormatters,
    ignoreConsoleErrors: resolveFlag("ignoreConsoleErrors", cfg.ignoreConsoleErrors, true),
    logOutputFilters: resolveOutputFilters(cfg.logOutputFilters),
    logObjectFilters: [...objectFilters],
    outputDir: resolveOutputDir(cfg.outputDir, options.baseDir, options.homeDir ?? os.homedir()),
    settleMs: resolveDuration("settleMs", cfg.settleMs, DEFAULT_SETTLE_MS),
    suiteTimeout: resolveDuration("suiteTimeout", cfg.suiteTimeout, DEFAULT_SUITE_TIMEOUT),
    teardownMs: resolveDuration("teardownMs", cfg.teardownMs, DEFAULT_TEARDOWN_MS),
    dsp: resolveDsp(cfg.dsp),
    runFolder: resolveFlag("runFolder", cfg.runFolder, false),
    takeReferences: resolveFlag("takeReferences", cfg.takeReferences, false),
    forbidOnly: resolveFlag("forbidOnly", cfg.forbidOnly, false)
  };
  return { config: config2, warnings };
}
__name(resolveConfig, "resolveConfig");

// src/core/log.ts
var HANDLER_TAG = "munit.handler:";
var LINE = /^(\S*) : (.*?) - (.*?) : (-?\d+) : ([\s\S]*)$/;
function parseLogLine(raw) {
  const m = LINE.exec(raw);
  if (m === null) {
    return { raw, time: "", date: "", source: "", level: 0, message: raw, parsed: false };
  }
  return {
    raw,
    time: m[1],
    date: m[2],
    source: m[3].trim(),
    level: Number(m[4]),
    message: m[5],
    parsed: true
  };
}
__name(parseLogLine, "parseLogLine");
function isFilteredSource(entry, objectFilters) {
  return objectFilters.includes(entry.source) || entry.message.startsWith(HANDLER_TAG);
}
__name(isFilteredSource, "isFilteredSource");
function isConsoleError(entry) {
  return entry.level !== 0;
}
__name(isConsoleError, "isConsoleError");
function applyOutputFilters(lines, filters) {
  if (filters.length === 0) {
    return lines;
  }
  return lines.filter((line) => !filters.some((f) => {
    f.lastIndex = 0;
    return f.test(line);
  }));
}
__name(applyOutputFilters, "applyOutputFilters");

// src/core/suite.ts
var import_lib4 = require("@munit-shared/lib");
var Suite = class {
  static {
    __name(this, "Suite");
  }
  options;
  events;
  now;
  // By uuid, in registration order
  entries = /* @__PURE__ */ new Map();
  orphans = /* @__PURE__ */ new Map();
  started = false;
  finished = false;
  armedAt = null;
  startedAt = null;
  lastActivity = 0;
  held = false;
  idleSent = false;
  settleTimer = null;
  // Problems with the run as a whole (DSP changing mid-suite), reported with the results
  problems = [];
  abortedWith = null;
  timeoutTimer = null;
  constructor(options, events, now = Date.now) {
    this.options = options;
    this.events = events;
    this.now = now;
  }
  get isFinished() {
    return this.finished;
  }
  get isStarted() {
    return this.started;
  }
  // The handler is configured: start the watchdog
  arm(options = this.options) {
    this.options = options;
    this.armedAt = this.now();
    this.clearTimer("timeout");
    if (options.suiteTimeout > 0) {
      this.timeoutTimer = setTimeout(() => {
        this.finish("timeout");
      }, options.suiteTimeout);
      this.timeoutTimer.unref?.();
    }
  }
  // The test patches have been told to go ([mUnit.loadbang] fired)
  start() {
    if (this.finished || this.started) {
      return;
    }
    this.started = true;
    this.startedAt = this.now();
    this.check();
  }
  // Sequential mode: don't finish until release()
  hold() {
    this.held = true;
    this.mark();
  }
  // Sequential mode: a new patch has opened; wait for it to settle
  mark() {
    this.lastActivity = this.now();
    this.idleSent = false;
    this.check();
  }
  // Sequential mode: the last patch has run; finish once everything settles
  release() {
    this.held = false;
    this.check();
  }
  register(settings) {
    if (this.finished) {
      this.events.warn(`assert ${String(settings.uuid)} registered after the suite finished; ignored until reset`);
      return;
    }
    if (this.entries.has(settings.uuid)) {
      this.events.warn(`assert ${String(settings.uuid)} registered twice; keeping the first`);
      return;
    }
    const entry = { settings, result: null };
    this.entries.set(settings.uuid, entry);
    this.lastActivity = this.now();
    this.idleSent = false;
    const orphan = settings.uuid === null ? void 0 : this.orphans.get(settings.uuid);
    if (orphan !== void 0 && settings.uuid !== null) {
      this.orphans.delete(settings.uuid);
      entry.result = orphan;
    }
    this.check();
  }
  // True when the result counts (now, or once its registration arrives)
  report(result) {
    if (this.finished) {
      this.events.warn(`result for ${String(result.uuid)} arrived after the suite finished; ignored until reset`);
      return false;
    }
    const entry = this.entries.get(result.uuid);
    if (entry === void 0) {
      if (result.uuid !== null) {
        this.orphans.set(result.uuid, result);
        this.lastActivity = this.now();
        this.check();
        return true;
      }
      return false;
    }
    if (entry.result !== null) {
      this.events.warn(`assert ${String(result.uuid)} reported twice; keeping the first result`);
      return false;
    }
    entry.result = result;
    this.lastActivity = this.now();
    this.idleSent = false;
    this.check();
    return true;
  }
  // A problem with the run as a whole: it fails the suite. Ignored once finished
  addError(message) {
    if (!this.finished) {
      this.problems.push(message);
    }
  }
  // Finish now, without running what is left: every unfinished assert fails
  // with the problem, which is also the run's error
  abort(problem) {
    if (this.finished) {
      return;
    }
    this.abortedWith = problem;
    this.finish("complete");
  }
  // Every registration so far, in order
  get registered() {
    return [...this.entries.values()].map((e) => e.settings);
  }
  // The registration of an assert, if it has registered
  settingsFor(uuid) {
    return this.entries.get(uuid)?.settings;
  }
  // Forget everything, ready for a new run
  reset() {
    this.clearTimer("settle");
    this.clearTimer("timeout");
    this.entries.clear();
    this.orphans.clear();
    this.started = false;
    this.finished = false;
    this.armedAt = null;
    this.startedAt = null;
    this.lastActivity = 0;
    this.held = false;
    this.idleSent = false;
    this.problems.length = 0;
    this.abortedWith = null;
  }
  check() {
    if (!this.started || this.finished) {
      return;
    }
    if (this.unfinished() > 0) {
      return;
    }
    const quietSince = Math.max(this.startedAt ?? 0, this.lastActivity);
    const remaining = quietSince + this.options.settleMs - this.now();
    if (remaining <= 0) {
      if (!this.held) {
        this.finish("complete");
      } else if (!this.idleSent) {
        this.idleSent = true;
        this.events.idle?.();
      }
      return;
    }
    this.clearTimer("settle");
    this.settleTimer = setTimeout(() => {
      this.settleTimer = null;
      this.check();
    }, remaining);
  }
  finish(reason) {
    if (this.finished) {
      return;
    }
    this.finished = true;
    this.clearTimer("settle");
    this.clearTimer("timeout");
    const errors = [];
    const entries = [...this.entries.values()];
    const results = entries.map((e) => {
      if (e.result !== null) {
        return e.result;
      }
      const missing = new import_lib4.assertState();
      missing.uuid = e.settings.uuid;
      missing.expression = e.settings.expression;
      missing.finalState = import_lib4.State.Fail;
      missing.message = this.abortedWith !== null ? `not run: ${this.abortedWith}` : `no result before the suite timed out after ${this.options.suiteTimeout} ms`;
      return missing;
    });
    if (this.abortedWith !== null) {
      errors.push(this.abortedWith);
    }
    errors.push(...this.problems);
    if (reason === "timeout") {
      errors.push(this.started ? `suite timed out after ${this.options.suiteTimeout} ms with ${this.unfinished()} unfinished assert(s)` : `suite timed out after ${this.options.suiteTimeout} ms before it started`);
    }
    if (entries.length === 0 && this.abortedWith === null) {
      errors.push("no asserts registered");
    }
    for (const uuid of this.orphans.keys()) {
      errors.push(`result for unregistered assert ${uuid}`);
    }
    const nowMs = this.now();
    this.events.finish({
      reason,
      asserts: entries.map((e) => e.settings),
      results,
      errors,
      startedAt: this.startedAt ?? this.armedAt ?? nowMs,
      finishedAt: nowMs
    });
  }
  // How many registered asserts have no result yet
  unfinished() {
    let n = 0;
    for (const e of this.entries.values()) {
      if (e.result === null) {
        n++;
      }
    }
    return n;
  }
  clearTimer(which) {
    const timer = which === "settle" ? this.settleTimer : this.timeoutTimer;
    if (timer !== null) {
      clearTimeout(timer);
    }
    if (which === "settle") {
      this.settleTimer = null;
    } else {
      this.timeoutTimer = null;
    }
  }
};

// src/core/teardown.ts
var TeardownRegistry = class {
  static {
    __name(this, "TeardownRegistry");
  }
  registered = /* @__PURE__ */ new Set();
  phase = null;
  // How many objects will be waited for by the next run()
  get size() {
    return this.registered.size;
  }
  get running() {
    return this.phase !== null;
  }
  // False when the id was already registered
  register(id) {
    if (this.registered.has(id)) {
      return false;
    }
    this.registered.add(id);
    return true;
  }
  unregister(id) {
    this.registered.delete(id);
    if (this.phase !== null && this.phase.expected.has(id)) {
      this.phase.acked.add(id);
      this.settle();
    }
  }
  // True when the ack was being waited for
  ack(id) {
    if (this.phase === null || !this.phase.expected.has(id) || this.phase.acked.has(id)) {
      return false;
    }
    this.phase.acked.add(id);
    this.settle();
    return true;
  }
  // Broadcasts (only when something is registered) and waits. With a timeout
  // of 0 or less nothing is waited for: the objects run, but after the fact.
  async run(broadcast, timeoutMs) {
    if (this.phase !== null) {
      throw new Error("a teardown phase is already running");
    }
    if (this.registered.size === 0) {
      return { expected: [], acked: [], missing: [] };
    }
    return await new Promise((resolve3) => {
      const phase = { expected: new Set(this.registered), acked: /* @__PURE__ */ new Set(), resolve: resolve3, timer: null };
      this.phase = phase;
      broadcast();
      if (this.phase !== phase) {
        return;
      }
      if (timeoutMs > 0) {
        phase.timer = setTimeout(() => {
          this.finish();
        }, timeoutMs);
        phase.timer.unref?.();
      } else {
        this.finish();
      }
    });
  }
  reset() {
    this.registered.clear();
    if (this.phase !== null) {
      this.finish();
    }
  }
  settle() {
    if (this.phase !== null && this.phase.acked.size >= this.phase.expected.size) {
      this.finish();
    }
  }
  finish() {
    const phase = this.phase;
    if (phase === null) {
      return;
    }
    this.phase = null;
    if (phase.timer !== null) {
      clearTimeout(phase.timer);
    }
    for (const id of phase.expected) {
      this.registered.delete(id);
    }
    const expected = [...phase.expected];
    phase.resolve({
      expected,
      acked: expected.filter((id) => phase.acked.has(id)),
      missing: expected.filter((id) => !phase.acked.has(id))
    });
  }
};

// src/core/results.ts
var fs = __toESM(require("node:fs"));
var path2 = __toESM(require("node:path"));
var import_lib5 = require("@munit-shared/lib");
function applyOnly(summary) {
  const only = summary.asserts.filter((a) => a.only);
  if (only.length === 0) {
    return { results: summary.results, only: [] };
  }
  const keep = new Set(only.map((a) => a.uuid));
  const results = summary.results.map((r) => {
    if (keep.has(r.uuid) || r.finalState === import_lib5.State.Skipped) {
      return r;
    }
    const {
      expected: _expected,
      actual: _actual,
      operator: _operator,
      diff: _diff,
      attachments: _attachments,
      recordings: _recordings,
      ...rest
    } = r;
    return { ...rest, finalState: import_lib5.State.Skipped, message: import_lib5.ONLY_SKIP_MESSAGE };
  });
  return { results, only: only.map((a) => String(a.name ?? a.uuid)) };
}
__name(applyOnly, "applyOnly");
function summarise(summary, log2, ignoreConsoleErrors, forbidOnly = false) {
  const { results, only } = applyOnly(summary);
  const passCount = results.filter((r) => r.finalState === import_lib5.State.Success).length;
  const skipCount = results.filter((r) => r.finalState === import_lib5.State.Skipped).length;
  const failCount = results.length - passCount - skipCount;
  const consoleErrors = log2.filter(isConsoleError).map((e) => e.raw);
  const errors = [...summary.errors];
  if (!ignoreConsoleErrors && consoleErrors.length > 0) {
    errors.push(`${consoleErrors.length} console error(s):
${consoleErrors.join("\n")}`);
  }
  if (forbidOnly && only.length > 0) {
    errors.push(`${only.length} assert(s) use @only, which forbidOnly doesn't allow: ${only.join(", ")}`);
  }
  return {
    state: failCount > 0 || errors.length > 0 ? import_lib5.OverallState.Failed : import_lib5.OverallState.Passed,
    passCount,
    failCount,
    skipCount,
    results,
    errors,
    consoleErrors,
    startedAt: new Date(summary.startedAt).toISOString(),
    durationMs: summary.finishedAt - summary.startedAt
  };
}
__name(summarise, "summarise");
var ARTIFACTS_FOLDER = "artifacts";
var STAGING_FOLDER = "staging";
function stagingFolder(outputDir) {
  return path2.join(outputDir, ARTIFACTS_FOLDER, STAGING_FOLDER);
}
__name(stagingFolder, "stagingFolder");
function referenceFolders(asserts) {
  return [...new Set(asserts.flatMap((a) => typeof a.reference === "string" && path2.isAbsolute(a.reference) ? [path2.dirname(a.reference)] : []))];
}
__name(referenceFolders, "referenceFolders");
function planFiles(results, dir, staging2 = null) {
  const files = [];
  const moves = [];
  const recorded = [];
  const problems = [];
  const stagingRoot = staging2 === null ? null : staging2.replace(/[\\/]+$/, "");
  const staged = /* @__PURE__ */ __name((file) => stagingRoot !== null && (file.startsWith(`${stagingRoot}/`) || file.startsWith(`${stagingRoot}\\`)), "staged");
  const planned = results.results.map((r) => {
    const { recordings, attachments: attachments2, ...rest } = r;
    for (const recording of recordings ?? []) {
      if (!path2.isAbsolute(recording.path)) {
        problems.push(`assert ${String(r.uuid)} asked to write a reference at a relative path: ${recording.path}`);
        continue;
      }
      if (recording.content !== void 0) {
        files.push({ path: recording.path, content: recording.content });
      }
      recorded.push(recording.path);
    }
    if (attachments2 === void 0) {
      return rest;
    }
    const folder = path2.join(dir, ARTIFACTS_FOLDER, (0, import_lib5.safeFileName)(String(r.uuid)));
    const kept = attachments2.map((a) => {
      if (a.content === void 0) {
        if (a.path !== void 0 && staged(a.path)) {
          const to = path2.join(folder, (0, import_lib5.safeFileName)(a.name));
          moves.push({ from: a.path, to });
          return { name: a.name, path: to };
        }
        return { name: a.name, ...a.path !== void 0 ? { path: a.path } : {} };
      }
      const file = path2.join(folder, (0, import_lib5.safeFileName)(a.name));
      files.push({ path: file, content: a.content });
      return { name: a.name, path: file };
    });
    return { ...rest, attachments: kept };
  });
  return { results: { ...results, results: planned }, files, moves, recorded, problems };
}
__name(planFiles, "planFiles");
async function moveFiles(moves) {
  const outcomes = await Promise.allSettled(moves.map(async (m) => {
    await fs.promises.mkdir(path2.dirname(m.to), { recursive: true });
    await fs.promises.rename(m.from, m.to);
  }));
  return outcomes.flatMap((o, i) => o.status === "rejected" ? [`moving ${moves[i]?.from ?? "?"} failed: ${String(o.reason)}`] : []);
}
__name(moveFiles, "moveFiles");
async function clearStaging(staging2) {
  try {
    await fs.promises.rm(staging2, { recursive: true, force: true });
  } catch (e) {
    return [`removing the staging folder ${staging2} failed: ${String(e)}`];
  }
  try {
    await fs.promises.rmdir(path2.dirname(staging2));
  } catch (e) {
    const code = e.code;
    if (code !== "ENOTEMPTY" && code !== "ENOENT" && code !== "EEXIST") {
      return [`removing the empty artifacts folder ${path2.dirname(staging2)} failed: ${String(e)}`];
    }
  }
  return [];
}
__name(clearStaging, "clearStaging");
async function writePlannedFiles(files) {
  const outcomes = await Promise.allSettled(files.map(async (f) => {
    await fs.promises.mkdir(path2.dirname(f.path), { recursive: true });
    await fs.promises.writeFile(f.path, f.content);
  }));
  return outcomes.flatMap((o, i) => o.status === "rejected" ? [`writing ${files[i]?.path ?? "?"} failed: ${String(o.reason)}`] : []);
}
__name(writePlannedFiles, "writePlannedFiles");
function renderOutputs(config2, summary, results, log2) {
  const files = [];
  const problems = [];
  const lines = applyOutputFilters(log2.map((e) => e.raw), config2.logOutputFilters);
  try {
    files.push({
      name: "log." + config2.logFormatter.fileExtension(),
      content: config2.logFormatter.render(lines)
    });
  } catch (e) {
    problems.push(`the log formatter failed: ${String(e)}`);
  }
  files.push({ name: "asserts.json", content: JSON.stringify(summary.asserts, null, 4) });
  for (const { fileName, formatter } of config2.resultFormatters) {
    try {
      files.push({ name: fileName, content: formatter.render(summary.asserts, results, lines) });
    } catch (e) {
      problems.push(`the result formatter for ${fileName} failed: ${String(e)}`);
    }
  }
  return { files, problems };
}
__name(renderOutputs, "renderOutputs");
async function writeOutputs(dir, files) {
  await fs.promises.mkdir(dir, { recursive: true });
  await Promise.all(files.map(async (f) => {
    await fs.promises.writeFile(path2.join(dir, f.name), f.content);
  }));
}
__name(writeOutputs, "writeOutputs");

// src/core/runner.ts
var fs2 = __toESM(require("node:fs"));
var path3 = __toESM(require("node:path"));
var import_lib6 = require("@munit-shared/lib");
function nonEmpty(value) {
  return typeof value === "string" && value.trim() !== "" ? value : null;
}
__name(nonEmpty, "nonEmpty");
function envFlag(value) {
  return value !== void 0 && /^(1|true|yes)$/i.test(value.trim());
}
__name(envFlag, "envFlag");
function runnerOptionsFrom(env) {
  return {
    statusFile: nonEmpty(env[import_lib6.STATUS_FILE_ENV]),
    outputDir: nonEmpty(env[import_lib6.OUTPUT_DIR_ENV]),
    takeReferences: envFlag(env[import_lib6.TAKE_REFERENCES_ENV])
  };
}
__name(runnerOptionsFrom, "runnerOptionsFrom");
function progressEntry(settings, result) {
  return {
    suite: settings?.suite ?? null,
    name: settings?.name ?? result.uuid,
    state: result.finalState,
    message: result.message ?? null
  };
}
__name(progressEntry, "progressEntry");
function runningStatus(maxPid2, progress2 = []) {
  return progress2.length === 0 ? { phase: "running", maxPid: maxPid2 } : { phase: "running", maxPid: maxPid2, progress: progress2 };
}
__name(runningStatus, "runningStatus");
function finishedStatus(maxPid2, summary, results, outputDir, files, problems, recorded = [], progress2 = []) {
  return {
    phase: "finished",
    maxPid: maxPid2,
    state: results.state,
    reason: summary.reason,
    assertCount: summary.asserts.length,
    passCount: results.passCount,
    failCount: results.failCount,
    skipCount: results.skipCount,
    errors: results.errors,
    outputDir,
    files,
    problems,
    recorded,
    progress: progress2
  };
}
__name(finishedStatus, "finishedStatus");
async function writeStatus(file, status) {
  await fs2.promises.mkdir(path3.dirname(file), { recursive: true });
  const tmp = `${file}.${process.pid}.tmp`;
  await fs2.promises.writeFile(tmp, JSON.stringify(status, null, 2));
  await fs2.promises.rename(tmp, file);
}
__name(writeStatus, "writeStatus");
var StatusWriter = class {
  static {
    __name(this, "StatusWriter");
  }
  chain = Promise.resolve();
  writeFile;
  constructor(writeFile = writeStatus) {
    this.writeFile = writeFile;
  }
  async write(file, status) {
    const next = this.chain.then(async () => {
      await this.writeFile(file, status);
    });
    this.chain = next.catch(() => {
    });
    await next;
  }
};
function runFolderName(startedAt) {
  return new Date(startedAt).toISOString().replace(/[:.]/g, "-");
}
__name(runFolderName, "runFolderName");
function outputFolder(configured, runFolder, runner2, startedAt) {
  const base = runner2.outputDir !== null ? path3.resolve(runner2.outputDir) : configured;
  return runFolder ? path3.join(base, runFolderName(startedAt)) : base;
}
__name(outputFolder, "outputFolder");

// src/munit.Handler.n4m.ts
var LEVELS = {
  info: import_max_api.default.POST_LEVELS.INFO,
  warn: import_max_api.default.POST_LEVELS.WARN,
  error: import_max_api.default.POST_LEVELS.ERROR
};
function say(level, message) {
  void import_max_api.default.post(`${HANDLER_TAG} ${message}`, LEVELS[level]);
}
__name(say, "say");
var config = null;
var log = [];
var progress = [];
var runner = runnerOptionsFrom(process.env);
var statusWriter = new StatusWriter();
var teardowns = new TeardownRegistry();
var idlePending = false;
var mutedFrom = null;
var mutedRanges = [];
var dspApplied = false;
var dspWaiter = null;
var dspRequest = 0;
var dspFailure = null;
var RESET_DSP_MS = 50;
var resetDsp = null;
var DSP_ANSWER_MS = 1e4;
var maxPid = process.ppid;
var suite = new Suite(
  { settleMs: DEFAULT_SETTLE_MS, suiteTimeout: DEFAULT_SUITE_TIMEOUT },
  {
    finish: /* @__PURE__ */ __name((summary) => {
      void finishTests(summary);
    }, "finish"),
    warn: /* @__PURE__ */ __name((message) => {
      say("warn", message);
    }, "warn"),
    idle: /* @__PURE__ */ __name(() => {
      if (idlePending) {
        return;
      }
      idlePending = true;
      void runTeardown().then(async () => {
        await import_max_api.default.outlet("idle");
      });
    }, "idle")
  }
);
function closeMuteWindow() {
  if (mutedFrom !== null) {
    mutedRanges.push([mutedFrom, log.length]);
    mutedFrom = null;
  }
}
__name(closeMuteWindow, "closeMuteWindow");
function logForErrors() {
  const muted = /* @__PURE__ */ __name((i) => mutedFrom !== null && i >= mutedFrom || mutedRanges.some(([from, to]) => i >= from && i < to), "muted");
  return log.filter((_, i) => !muted(i));
}
__name(logForErrors, "logForErrors");
async function runTeardown() {
  if (teardowns.size === 0 || teardowns.running) {
    return;
  }
  const waitMs = config?.teardownMs ?? DEFAULT_TEARDOWN_MS;
  const outcome = await teardowns.run(() => {
    mutedFrom = log.length;
    say("info", `teardown: ${teardowns.size} hook(s); waiting up to ${waitMs} ms for them`);
    void import_max_api.default.outlet("teardown");
  }, waitMs);
  if (outcome.missing.length > 0) {
    say("warn", `teardown: ${outcome.missing.length} hook(s) didn't report done within ${waitMs} ms: ${outcome.missing.join(", ")}`);
  }
}
__name(runTeardown, "runTeardown");
async function reportStatus(status) {
  if (runner.statusFile === null) {
    return;
  }
  try {
    await statusWriter.write(runner.statusFile, status);
  } catch (e) {
    say("error", `writing the run status to ${runner.statusFile} failed: ${String(e)}`);
  }
}
__name(reportStatus, "reportStatus");
function announceReady(ready) {
  void import_max_api.default.outlet("ready", ready ? 1 : 0);
}
__name(announceReady, "announceReady");
async function abandonRun(problem) {
  if (runner.statusFile === null) {
    return;
  }
  await reportStatus({
    phase: "finished",
    maxPid,
    state: import_lib7.OverallState.Failed,
    reason: "complete",
    assertCount: 0,
    passCount: 0,
    failCount: 0,
    skipCount: 0,
    errors: [],
    files: [],
    problems: [problem],
    recorded: [],
    progress
  });
  await import_max_api.default.outlet("finished");
  await import_max_api.default.outlet("quit");
}
__name(abandonRun, "abandonRun");
function takingReferences() {
  return runner.takeReferences || (config?.takeReferences ?? false);
}
__name(takingReferences, "takingReferences");
function staging() {
  return config === null ? null : stagingFolder(outputFolder(config.outputDir, false, runner, 0));
}
__name(staging, "staging");
function prepareReferenceFolders(asserts) {
  if (!takingReferences()) {
    return;
  }
  for (const dir of referenceFolders(asserts)) {
    try {
      fs3.mkdirSync(dir, { recursive: true });
    } catch (e) {
      say("warn", `couldn't create the references folder ${dir}: ${String(e)}`);
    }
  }
}
__name(prepareReferenceFolders, "prepareReferenceFolders");
function prepareStaging() {
  const dir = staging();
  if (dir === null) {
    return;
  }
  try {
    fs3.mkdirSync(dir, { recursive: true });
  } catch (e) {
    say("warn", `couldn't create ${dir}, so signal asserts can't keep their captures: ${String(e)}`);
  }
}
__name(prepareStaging, "prepareStaging");
async function askDsp(dsp, action) {
  const request = ++dspRequest;
  dspWaiter?.("superseded");
  const answer = new Promise((resolve3) => {
    dspWaiter = resolve3;
  });
  const timeout = new Promise((resolve3) => {
    setTimeout(() => {
      resolve3("timeout");
    }, dsp.settleMs * 2 + DSP_ANSWER_MS).unref?.();
  });
  if (action === "apply") {
    say("info", `dsp: asking for driver ${dsp.driver ?? "(unchanged)"}, sr ${dsp.sr ?? "(unchanged)"}, vs ${dsp.vs ?? "(unchanged)"}`);
    await import_max_api.default.outlet("dsp", "apply", dsp.driver ?? "", dsp.sr ?? 0, dsp.vs ?? 0, dsp.settleMs);
  } else {
    await import_max_api.default.outlet("dsp", "restore", dsp.settleMs);
  }
  const result = await Promise.race([answer, timeout]);
  if (request !== dspRequest) {
    return "superseded";
  }
  dspWaiter = null;
  if (result === "timeout" && action === "restore") {
    say("warn", "dsp: the patch didn't answer the restore message; is [mUnit.handler] up to date?");
  }
  return result;
}
__name(askDsp, "askDsp");
async function publishRunContext() {
  const dir = staging();
  const context = { takeReferences: takingReferences(), ...dir !== null ? { artifactsDir: dir } : {} };
  try {
    await import_max_api.default.setDict(import_lib7.RUN_CONTEXT_DICT, { takeReferences: context.takeReferences ? 1 : 0, ...dir !== null ? { artifactsDir: dir } : {} });
  } catch (e) {
    say("warn", `couldn't fill the ${import_lib7.RUN_CONTEXT_DICT} dict, so asserts won't know to take references: ${String(e)}`);
  }
}
__name(publishRunContext, "publishRunContext");
function applyConfig(raw, baseDir) {
  let resolved;
  try {
    const result = resolveConfig(raw, { baseDir });
    for (const warning of result.warnings) {
      say("warn", warning);
    }
    resolved = result.config;
  } catch (e) {
    const problem = `configuration rejected: ${e.message}`;
    say("error", problem);
    void abandonRun(problem);
    return;
  }
  config = resolved;
  if (resetDsp !== null) {
    clearTimeout(resetDsp);
    resetDsp = null;
  }
  suite.arm({ settleMs: resolved.settleMs, suiteTimeout: resolved.suiteTimeout });
  say("info", `configured; results go to ${runner.outputDir ?? resolved.outputDir}`);
  if (takingReferences()) {
    say("warn", "taking references: every assert with a reference will write what it gets as its new reference");
  }
  prepareStaging();
  prepareReferenceFolders(suite.registered);
  void (async () => {
    await publishRunContext();
    if (!await applyDsp(resolved.dsp)) {
      return;
    }
    void reportStatus(runningStatus(maxPid, progress));
    announceReady(true);
  })();
}
__name(applyConfig, "applyConfig");
async function applyDsp(dsp) {
  if (dsp === null) {
    return true;
  }
  dspApplied = true;
  dspFailure = null;
  const answer = await askDsp(dsp, "apply");
  if (answer === "ready") {
    return true;
  }
  if (answer === "superseded") {
    return false;
  }
  const why = answer === "failed" ? dspFailure ?? "the DSP settings did not take" : "the patch didn't confirm the DSP settings; is [mUnit.handler] up to date?";
  const problem = `dsp: ${why}; no tests ran`;
  say("error", problem);
  suite.abort(problem);
  return false;
}
__name(applyDsp, "applyDsp");
function loadConfigFile(dir) {
  const file = path4.join(dir, CONFIG_FILE_NAME);
  if (!fs3.existsSync(file)) {
    say("warn", `no ${CONFIG_FILE_NAME} in ${dir}; using the defaults`);
    return {};
  }
  const load = (0, import_node_module.createRequire)(file);
  const resolved = load.resolve(file);
  delete load.cache[resolved];
  return load(resolved);
}
__name(loadConfigFile, "loadConfigFile");
function parse(kind, json) {
  try {
    return JSON.parse(String(json));
  } catch (e) {
    say("error", `ignored a malformed ${kind} message: ${String(e)}`);
    return null;
  }
}
__name(parse, "parse");
async function finishTests(summary) {
  if (config === null) {
    say("error", "the suite finished before the handler was configured; nothing written");
    await import_max_api.default.outlet("finished");
    return;
  }
  const dir = outputFolder(config.outputDir, config.runFolder, runner, summary.startedAt);
  closeMuteWindow();
  const planned = planFiles(summarise(summary, logForErrors(), config.ignoreConsoleErrors, config.forbidOnly), dir, staging());
  const results = planned.results;
  const rendered = renderOutputs(config, summary, results, log);
  const problems = [...planned.problems, ...rendered.problems];
  problems.push(...await writePlannedFiles(planned.files));
  problems.push(...await moveFiles(planned.moves));
  const stagingDir = staging();
  for (const warning of stagingDir === null ? [] : await clearStaging(stagingDir)) {
    say("warn", warning);
  }
  try {
    await writeOutputs(dir, rendered.files);
    say("info", `${results.state}: ${results.passCount} passed, ${results.failCount} failed, ${results.skipCount} skipped; written to ${dir}`);
  } catch (e) {
    problems.push(`writing results to ${dir} failed: ${String(e)}`);
  }
  for (const file of planned.recorded) {
    say("info", `took reference ${file}`);
  }
  for (const problem of problems) {
    say("error", problem);
  }
  for (const error of results.errors) {
    say("warn", error);
  }
  await runTeardown();
  if (dspApplied && config.dsp !== null) {
    await askDsp(config.dsp, "restore");
    dspApplied = false;
  }
  await reportStatus(finishedStatus(maxPid, summary, results, dir, rendered.files.map((f) => f.name), problems, planned.recorded, progress));
  await import_max_api.default.outlet("finished");
  if (runner.statusFile !== null) {
    await import_max_api.default.outlet("quit");
  }
}
__name(finishTests, "finishTests");
import_max_api.default.addHandler("configure", (configuration) => {
  applyConfig(configuration, null);
});
import_max_api.default.addHandler("hydrateConfiguration", (configPath) => {
  const dir = String(configPath);
  let raw;
  try {
    raw = loadConfigFile(dir);
  } catch (e) {
    const problem = `can't load ${path4.join(dir, CONFIG_FILE_NAME)}: ${String(e)}`;
    say("error", problem);
    void abandonRun(problem);
    return;
  }
  applyConfig(raw, dir);
});
var commands = {
  // The ready broadcast has gone out: the settle window starts now
  start: /* @__PURE__ */ __name(() => {
    suite.start();
  }, "start"),
  // Sequential [mUnit.harness]: hold the run open, a patch opened, all done
  hold: /* @__PURE__ */ __name(() => {
    suite.hold();
  }, "hold"),
  mark: /* @__PURE__ */ __name(() => {
    idlePending = false;
    closeMuteWindow();
    suite.mark();
  }, "mark"),
  done: /* @__PURE__ */ __name(() => {
    idlePending = false;
    closeMuteWindow();
    suite.release();
  }, "done"),
  // Taking references on (no argument, or non-zero) or off, for the next asserts
  takeReferences: /* @__PURE__ */ __name((flag) => {
    runner.takeReferences = flag === void 0 || Number(flag) !== 0;
    prepareReferenceFolders(suite.registered);
    if (config !== null) {
      void publishRunContext();
    }
  }, "takeReferences"),
  // Forget the current run and start a new one with the same configuration
  reset: /* @__PURE__ */ __name(() => {
    announceReady(false);
    suite.reset();
    teardowns.reset();
    idlePending = false;
    mutedFrom = null;
    mutedRanges.length = 0;
    log = [];
    progress = [];
    if (config !== null) {
      prepareStaging();
      suite.arm({ settleMs: config.settleMs, suiteTimeout: config.suiteTimeout });
      if (config.dsp === null) {
        announceReady(true);
      } else {
        const dsp = config.dsp;
        if (resetDsp !== null) {
          clearTimeout(resetDsp);
        }
        resetDsp = setTimeout(() => {
          resetDsp = null;
          void applyDsp(dsp).then((ready) => {
            if (ready) {
              announceReady(true);
            }
          });
        }, RESET_DSP_MS);
      }
    }
  }, "reset")
};
for (const [name, command] of Object.entries(commands)) {
  import_max_api.default.addHandler(name, command);
}
import_max_api.default.addHandler("symbol", (name) => {
  const command = commands[String(name)];
  if (command === void 0) {
    say("warn", `ignored an unknown message "${String(name)}"`);
    return;
  }
  command();
});
import_max_api.default.addHandler("runner", (statusFile, outputDir) => {
  runner.statusFile = String(statusFile);
  if (outputDir !== void 0 && String(outputDir) !== "") {
    runner.outputDir = String(outputDir);
  }
  if (config !== null) {
    void reportStatus(runningStatus(maxPid, progress));
  }
});
import_max_api.default.addHandler("log", (line) => {
  const entry = parseLogLine(String(line));
  if (!isFilteredSource(entry, config?.logObjectFilters ?? DEFAULT_LOG_OBJECT_FILTERS)) {
    log.push(entry);
  }
});
import_max_api.default.addHandler("registerTeardown", (id) => {
  if (teardowns.register(String(id))) {
    say("info", `teardown hook ${String(id)} registered`);
  }
});
import_max_api.default.addHandler("unregisterTeardown", (id) => {
  teardowns.unregister(String(id));
});
import_max_api.default.addHandler("teardownDone", (id) => {
  if (!teardowns.ack(String(id))) {
    say("warn", `teardownDone from hook ${String(id)}, which wasn't being waited for`);
  }
});
import_max_api.default.addHandler("registerAssert", (settings) => {
  const parsed = parse("registerAssert", settings);
  if (parsed !== null) {
    suite.register(parsed);
    say("info", `registered ${String(parsed.suite)} ${String(parsed.uuid)} ${String(parsed.name)}`);
    prepareReferenceFolders([parsed]);
  }
});
import_max_api.default.addHandler("dspReady", (sr, vs, driver) => {
  say("info", `dsp: running on ${String(driver)} at ${String(sr)} Hz, vector size ${String(vs)}`);
  dspWaiter?.("ready");
});
import_max_api.default.addHandler("dspFailed", (...words) => {
  dspFailure = words.map(String).join(" ");
  dspWaiter?.("failed");
});
import_max_api.default.addHandler("dspChanged", (...words) => {
  const problem = `dsp: ${words.map(String).join(" ")}`;
  say("error", problem);
  suite.addError(problem);
});
import_max_api.default.addHandler("dspNote", (...words) => {
  say("warn", `dsp: ${words.map(String).join(" ")}`);
});
import_max_api.default.addHandler("dspRestored", () => {
  say("info", "dsp: previous settings restored");
  dspWaiter?.("restored");
});
import_max_api.default.addHandler("dspProblem", (...words) => {
  say("warn", `dsp: ${words.map(String).join(" ")}`);
});
import_max_api.default.addHandler("result", (result) => {
  const parsed = parse("result", result);
  if (parsed !== null && suite.report(parsed)) {
    const entry = progressEntry(suite.settingsFor(parsed.uuid), parsed);
    progress.push(entry);
    say(entry.state === import_lib7.State.Fail ? "warn" : "info", (0, import_lib7.formatProgress)(entry));
    void reportStatus(runningStatus(maxPid, progress));
  }
});
