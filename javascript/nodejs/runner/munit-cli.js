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
var __esm = (fn, res) => function __init() {
  return fn && (res = (0, fn[__getOwnPropNames(fn)[0]])(fn = 0)), res;
};
var __commonJS = (cb, mod) => function __require() {
  return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
};
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

// src/core/verdict.ts
function exitCodeFor(status) {
  if (status === null || status.phase !== "finished") {
    return EXIT_INFRASTRUCTURE;
  }
  if (status.reason === "timeout" || status.assertCount === 0 || (status.problems ?? []).length > 0) {
    return EXIT_INFRASTRUCTURE;
  }
  return status.state === "Passed" ? EXIT_PASSED : EXIT_FAILED;
}
function describeStatus(status) {
  const lines = [
    `mUnit: ${String(status.state)}: ${status.passCount ?? 0} passed, ${status.failCount ?? 0} failed` + ((status.skipCount ?? 0) > 0 ? `, ${String(status.skipCount)} skipped` : "") + (status.outputDir !== void 0 ? `; results in ${status.outputDir}` : "")
  ];
  for (const file of status.recorded ?? []) {
    lines.push(`  took reference: ${file}`);
  }
  for (const error of status.errors ?? []) {
    lines.push(`  error: ${error.split("\n")[0]}`);
  }
  for (const problem2 of status.problems ?? []) {
    lines.push(`  problem: ${problem2}`);
  }
  return lines;
}
var EXIT_PASSED, EXIT_FAILED, EXIT_INFRASTRUCTURE;
var init_verdict = __esm({
  "src/core/verdict.ts"() {
    "use strict";
    EXIT_PASSED = 0;
    EXIT_FAILED = 1;
    EXIT_INFRASTRUCTURE = 2;
    __name(exitCodeFor, "exitCodeFor");
    __name(describeStatus, "describeStatus");
  }
});

// src/core/node-version.ts
function nodeVersionProblem(version) {
  const major = Number.parseInt(version.split(".")[0] ?? "", 10);
  if (Number.isNaN(major) || major >= MIN_NODE_MAJOR) {
    return null;
  }
  return `mUnit: the command line needs Node ${String(MIN_NODE_MAJOR)} or newer, and this is Node ${version} (${process.execPath}). Install a current Node from https://nodejs.org, or point your munit alias at a newer node.`;
}
var MIN_NODE_MAJOR;
var init_node_version = __esm({
  "src/core/node-version.ts"() {
    "use strict";
    MIN_NODE_MAJOR = 18;
    __name(nodeVersionProblem, "nodeVersionProblem");
  }
});

// src/node-version-guard.ts
var require_node_version_guard = __commonJS({
  "src/node-version-guard.ts"() {
    "use strict";
    init_verdict();
    init_node_version();
    var problem2 = nodeVersionProblem(process.versions.node);
    if (problem2 !== null) {
      console.error(problem2);
      process.exit(EXIT_INFRASTRUCTURE);
    }
  }
});

// src/munit-cli.ts
var import_node_version_guard = __toESM(require_node_version_guard());
var import_node_child_process = require("node:child_process");
var fs = __toESM(require("node:fs"));
var os = __toESM(require("node:os"));
var path5 = __toESM(require("node:path"));
var import_lint2 = require("@munit/lint");

// src/core/options.ts
var path2 = __toESM(require("node:path"));
var import_lint = require("@munit-shared/lint");

// src/core/init.ts
var path = __toESM(require("node:path"));
var import_lib = require("@munit-shared/lib");
init_verdict();
var DEFAULT_INIT_FOLDER = "tests";
var DEFAULT_WRANGLER = "runTests.maxpat";
var DEFAULT_INIT_TESTS = "patchers";
var LOGS_FOLDER = "logs";
var HARNESS_DEFAULT_PATTERN = "*.maxpat";
function symbol(attr, value) {
  if (value.includes('"')) {
    throw new Error(`${attr} can't contain a double quote: ${value}`);
  }
  return value === "" || /[\s,;]/.test(value) ? `"${value}"` : value;
}
__name(symbol, "symbol");
function harnessText(options) {
  return [
    "mUnit.harness",
    `@loadFolder ${symbol("--tests", options.tests)}`,
    ...options.configFolder !== null ? [`@configFolder ${symbol("--config-folder", options.configFolder)}`] : [],
    ...options.pattern !== null ? [`@pattern ${symbol("--pattern", options.pattern)}`] : [],
    ...options.recursive ? ["@recursive 1"] : [],
    ...options.sequential ? ["@sequential 1"] : []
  ].join(" ");
}
__name(harnessText, "harnessText");
function wranglerPatch(options) {
  const harness = harnessText(options);
  const patcher = {
    patcher: {
      fileversion: 1,
      appversion: { major: 9, minor: 0, revision: 0, architecture: "x64", modernui: 1 },
      classnamespace: "box",
      rect: [100, 100, 640, 240],
      boxes: [
        {
          box: {
            id: "obj-2",
            maxclass: "newobj",
            numinlets: 0,
            numoutlets: 1,
            outlettype: [""],
            // Roughly the width Max gives the text in its default font
            patching_rect: [22, 70, Math.max(83, Math.ceil(harness.length * 6.2 + 10)), 22],
            text: harness
          }
        },
        {
          box: {
            id: "obj-1",
            maxclass: "newobj",
            numinlets: 1,
            numoutlets: 2,
            outlettype: ["bang", "bang"],
            patching_rect: [22, 128, 83, 22],
            text: "mUnit.handler"
          }
        }
      ],
      lines: [
        { patchline: { source: ["obj-2", 0], destination: ["obj-1", 0] } }
      ]
    }
  };
  return JSON.stringify(patcher, null, 2) + "\n";
}
__name(wranglerPatch, "wranglerPatch");
function configSkeleton(wrangler, outputDir) {
  const dir = JSON.stringify(outputDir);
  return `// munit.config.js: the mUnit handler's configuration for this suite. The
// [mUnit.harness] in ${wrangler} reads it each time the patch opens. Every key
// is optional; the commented ones show their defaults. See "Configuration" in
// the mUnit README.

/** @type {import("libmunit").HandlerConfig} */
const config = {
  resultFormatter: "Json",             // or "JUnit" for CI, "Html" for a browser, or a list
  logFormatter: "Txt",
  outputDir: ${dir},${" ".repeat(Math.max(1, 25 - dir.length))}// relative to this file
  // runFolder: false,                 // true: a timestamped subfolder per run
  // settleMs: 1000,                   // quiet time that ends the suite
  // suiteTimeout: 300000,             // fail what hasn't finished by then; 0 disables
  // teardownMs: 2000,                 // how long to wait for [mUnit.teardown]
  // ignoreConsoleErrors: true,        // false: an error in the Max console fails the suite
  // logOutputFilters: [],             // regexes for lines to leave out of log.txt
  // logObjectFilters: ["node.script"],
  // dsp: { driver: "NonRealTime", sr: 48000, vs: 64 },
  // takeReferences: false,
  // forbidOnly: false,
}
module.exports = config
`;
}
__name(configSkeleton, "configSkeleton");
var GITIGNORE_ENTRY = `${LOGS_FOLDER}/`;
function lintConfigSkeleton() {
  return JSON.stringify({ rules: ["mUnit:recommended", "mUnit:tests"] }, null, 2) + "\n";
}
__name(lintConfigSkeleton, "lintConfigSkeleton");
function problem(options) {
  if (options.name !== path.basename(options.name) || !options.name.endsWith(".maxpat") || options.name === ".maxpat") {
    return `--name must be a file name ending in .maxpat, got "${options.name}"`;
  }
  const fromTests = path.relative(path.resolve(options.folder, options.tests), options.folder);
  const inside = fromTests === "" || options.recursive && !fromTests.startsWith("..") && !path.isAbsolute(fromTests);
  if (inside && !options.name.startsWith(".") && (0, import_lib.matchGlob)(options.name, options.pattern ?? HARNESS_DEFAULT_PATTERN)) {
    return `the harness would open ${options.name} itself as a test; put the tests in a subfolder with --tests, or choose a --pattern that leaves it out`;
  }
  return null;
}
__name(problem, "problem");
function toPosix(p) {
  return p.split(path.sep).join("/");
}
__name(toPosix, "toPosix");
function initSuite(options, deps2) {
  const error = problem(options);
  if (error !== null) {
    deps2.log(`mUnit: ${error}`);
    return EXIT_INFRASTRUCTURE;
  }
  const display = /* @__PURE__ */ __name((p) => toPosix(path.relative(options.cwd, p)) || ".", "display");
  const testsDir = path.resolve(options.folder, options.tests);
  const configDir = path.resolve(options.folder, options.configFolder ?? ".");
  const wrangler = path.join(options.folder, options.name);
  const logsDir = path.join(options.folder, LOGS_FOLDER);
  const toLogs = toPosix(path.relative(configDir, logsDir));
  const outputDir = toLogs.startsWith("../") ? toLogs : `./${toLogs}`;
  let files;
  try {
    files = [
      [wrangler, wranglerPatch(options)],
      [path.join(configDir, "munit.config.js"), configSkeleton(options.name, outputDir)],
      ...options.lint ? [[path.join(options.folder, "munit-lint.json"), lintConfigSkeleton()]] : []
    ];
  } catch (e) {
    deps2.log(`mUnit: ${e instanceof Error ? e.message : String(e)}`);
    return EXIT_INFRASTRUCTURE;
  }
  for (const dir of [options.folder, testsDir, configDir, logsDir]) {
    deps2.makeDir(dir);
  }
  for (const [file, content] of files) {
    if (deps2.exists(file) && !options.force) {
      deps2.log(`mUnit: kept ${display(file)}, which exists (--force replaces it)`);
      continue;
    }
    deps2.writeFile(file, content);
    deps2.log(`mUnit: wrote ${display(file)}`);
  }
  const gitignore = path.join(options.folder, ".gitignore");
  const ignored = /* @__PURE__ */ __name((line) => [LOGS_FOLDER, GITIGNORE_ENTRY, `/${LOGS_FOLDER}`, `/${GITIGNORE_ENTRY}`].includes(line.trim()), "ignored");
  if (!deps2.exists(gitignore)) {
    deps2.writeFile(gitignore, `${GITIGNORE_ENTRY}
`);
    deps2.log(`mUnit: wrote ${display(gitignore)}`);
  } else {
    const current = deps2.readFile(gitignore);
    if (!current.split(/\r?\n/).some(ignored)) {
      deps2.writeFile(gitignore, `${current}${current === "" || current.endsWith("\n") ? "" : "\n"}${GITIGNORE_ENTRY}
`);
      deps2.log(`mUnit: added ${GITIGNORE_ENTRY} to ${display(gitignore)}`);
    }
  }
  deps2.log(`mUnit: add test patches to ${display(testsDir)}, then open ${display(wrangler)} in Max, or run`);
  deps2.log(`  munit run ${display(wrangler)}`);
  return EXIT_PASSED;
}
__name(initSuite, "initSuite");

// src/core/options.ts
var DEFAULT_MAX_APP = "/Applications/Max.app";
var DEFAULT_MAX_APP_WINDOWS = "C:\\Program Files\\Cycling '74\\Max 9\\Max.exe";
var MAX_APP_ENV = "MUNIT_MAX_APP";
function defaultMaxApp(platform) {
  return platform === "win32" ? DEFAULT_MAX_APP_WINDOWS : DEFAULT_MAX_APP;
}
__name(defaultMaxApp, "defaultMaxApp");
var DEFAULT_TIMEOUT_S = 900;
var USAGE = `Usage: munit run <folder | patch.maxpat> [options]
       munit lint <folder | patch.maxpat> [options]
       munit init [folder] [options]

munit is the command of the munit-cli npm package (npm install --save-dev
munit-cli); the same script ships inside the Max package as
node <Packages>/mUnit/javascript/nodejs/runner/munit-cli.js.

run: starts Max on an mUnit suite and exits 0 if it passed, 1 if it failed,
and 2 if it could not run (Max didn't start or report, the suite timed out,
or no asserts registered).

  <folder>          A folder with munit.config.js; its test patches are
                    opened by a generated [mUnit.harness] runner patch
  <patch.maxpat>    A patch you already use to run the suite, containing
                    [mUnit.handler] (and usually [mUnit.harness])

Options:
  --tests <path>    Folder of test patches, relative to <folder> (default: <folder>)
  --pattern <glob>  Which files are tests (default: *.maxpat)
  --recursive       Also search subfolders for tests
  --sequential      Open, run and close one test patch at a time
  --output <dir>    Write the results here instead of the configured outputDir
  --take-references Take references: every assert with a reference writes what
                    it gets as the reference, and passes
  --timeout <s>     Stop Max and fail if the run takes longer (default: ${DEFAULT_TIMEOUT_S})
  --max <app>       The Max application (default: $${MAX_APP_ENV}, or
                    ${DEFAULT_MAX_APP} on macOS and
                    ${DEFAULT_MAX_APP_WINDOWS} on Windows)
  --keep            Keep the temporary runner folder, for debugging

lint: checks saved patcher files against the rules in munit-lint.json (found
next to the target or in a folder above it; mUnit:recommended when there is
none; add mUnit:tests for patches that run under mUnit) without starting Max. Exits 0 when clean or warnings only, 1 on any
"block" finding, 2 when it could not lint (bad config or rule file, a patch
that isn't JSON).

  <folder>          Lint every file the config's "files" patterns select
  <patch.maxpat>    Lint one file, and the .gendsp/.rnbopat files it refers to

Options:
  --config <file>   The config file to use instead of looking for munit-lint.json
  --rules <file>    A rule file to apply as well; can be repeated
  --format <name>   text (default), json or junit
  --output <file>   Write the report there instead of standard output
  --fix             Apply the fixes the rules describe and write the patches
                    back, then report what is left
  --list-rules      Instead of linting, list the rules in force for each
                    selected file after overrides, with level and source
                    (text or json)
  --color           Colour the text report (default: when printing to a
  --no-color        terminal and NO_COLOR is not set; never for --output)

init: sets up a test suite in <folder> (default: ${DEFAULT_INIT_FOLDER}): a "test wrangler"
patch, ${DEFAULT_WRANGLER}, whose [mUnit.harness] opens the test patches for its
[mUnit.handler]; a munit.config.js writing JSON results and a text log to
logs/; a munit-lint.json with mUnit:recommended and mUnit:tests; a .gitignore
for logs/; and the folders for the test patches and the logs. Files that exist
are kept (an existing .gitignore gets logs/ added). Open the wrangler in Max,
or munit run it.

Options:
  --tests <path>    @loadFolder: the folder of test patches, relative to
                    <folder> (default: ${DEFAULT_INIT_TESTS})
  --config-folder <path>
                    @configFolder: where munit.config.js goes, relative to
                    <folder> (default: <folder>)
  --pattern <glob>  @pattern: which files are tests (harness default: *.maxpat)
  --recursive       @recursive 1: also search subfolders for tests
  --sequential      @sequential 1: open, run and close one test patch at a time
  --name <file>     The wrangler's file name (default: ${DEFAULT_WRANGLER})
  --no-lint         Don't write munit-lint.json
  --force           Replace files that exist

  --help            Show this help`;
var HARNESS_ONLY = ["--tests", "--pattern", "--recursive", "--sequential"];
function parseArgs(argv, cwd, env, platform = "darwin") {
  if (argv.length === 0 || argv.includes("--help") || argv.includes("-h")) {
    return { command: "help" };
  }
  const [command, ...rest] = argv;
  if (command === "lint") {
    return parseLintArgs(rest, cwd);
  }
  if (command === "init") {
    return parseInitArgs(rest, cwd);
  }
  if (command !== "run") {
    return { command: "error", message: `unknown command "${String(command)}"` };
  }
  const envMax = env[MAX_APP_ENV];
  const options = {
    target: "",
    kind: "folder",
    tests: null,
    pattern: null,
    recursive: false,
    sequential: false,
    outputDir: null,
    timeoutMs: DEFAULT_TIMEOUT_S * 1e3,
    maxApp: envMax !== void 0 && envMax !== "" ? envMax : defaultMaxApp(platform),
    keep: false,
    takeReferences: false,
    platform
  };
  const used = [];
  for (let i = 0; i < rest.length; i++) {
    const arg = rest[i];
    const value = /* @__PURE__ */ __name(() => {
      const v = rest[i + 1];
      if (v === void 0 || v.startsWith("--")) {
        return null;
      }
      i++;
      return v;
    }, "value");
    if (!arg.startsWith("--")) {
      if (options.target !== "") {
        return { command: "error", message: `only one folder or patch can be run, got "${options.target}" and "${arg}"` };
      }
      options.target = path2.resolve(cwd, arg);
      continue;
    }
    used.push(arg);
    switch (arg) {
      case "--recursive":
        options.recursive = true;
        break;
      case "--sequential":
        options.sequential = true;
        break;
      case "--keep":
        options.keep = true;
        break;
      case "--take-references":
        options.takeReferences = true;
        break;
      case "--tests":
      case "--pattern":
      case "--output":
      case "--max":
      case "--timeout": {
        const v = value();
        if (v === null) {
          return { command: "error", message: `${arg} needs a value` };
        }
        if (arg === "--tests") {
          options.tests = v;
        } else if (arg === "--pattern") {
          options.pattern = v;
        } else if (arg === "--output") {
          options.outputDir = path2.resolve(cwd, v);
        } else if (arg === "--max") {
          options.maxApp = path2.resolve(cwd, v);
        } else {
          const seconds = Number(v);
          if (!Number.isFinite(seconds) || seconds <= 0) {
            return { command: "error", message: `--timeout must be a number of seconds, got "${v}"` };
          }
          options.timeoutMs = seconds * 1e3;
        }
        break;
      }
      default:
        return { command: "error", message: `unknown option ${arg}` };
    }
  }
  if (options.target === "") {
    return { command: "error", message: "run needs a folder or a patch" };
  }
  if (options.target.endsWith(".maxpat")) {
    options.kind = "patch";
    const misplaced = used.filter((a) => HARNESS_ONLY.includes(a));
    if (misplaced.length > 0) {
      return { command: "error", message: `${misplaced.join(", ")} only apply when running a folder; set them on the patch's [mUnit.harness]` };
    }
  }
  return { command: "run", options };
}
__name(parseArgs, "parseArgs");
function parseLintArgs(rest, cwd) {
  const options = { target: "", cwd, config: null, ruleFiles: [], format: "text", output: null, colour: null, fix: false, listRules: false };
  for (let i = 0; i < rest.length; i++) {
    const arg = rest[i];
    if (!arg.startsWith("--")) {
      if (options.target !== "") {
        return { command: "error", message: `only one folder or file can be linted at a time, got "${options.target}" and "${arg}"` };
      }
      options.target = path2.resolve(cwd, arg);
      continue;
    }
    if (arg === "--fix") {
      options.fix = true;
      continue;
    }
    if (arg === "--list-rules") {
      options.listRules = true;
      continue;
    }
    if (arg === "--color" || arg === "--colour") {
      options.colour = true;
      continue;
    }
    if (arg === "--no-color" || arg === "--no-colour") {
      options.colour = false;
      continue;
    }
    const v = rest[i + 1];
    if (v === void 0 || v.startsWith("--")) {
      return { command: "error", message: `${arg} needs a value` };
    }
    i++;
    switch (arg) {
      case "--config":
        options.config = path2.resolve(cwd, v);
        break;
      case "--rules":
        options.ruleFiles.push(path2.resolve(cwd, v));
        break;
      case "--output":
        options.output = path2.resolve(cwd, v);
        break;
      case "--format":
        if (!import_lint.REPORT_FORMATS.includes(v)) {
          return { command: "error", message: `--format must be ${import_lint.REPORT_FORMATS.join(", ")}, got "${v}"` };
        }
        options.format = v;
        break;
      default:
        return { command: "error", message: `unknown option ${arg}` };
    }
  }
  if (options.target === "") {
    return { command: "error", message: "lint needs a folder or a file" };
  }
  if (options.listRules === true && options.format === "junit") {
    return { command: "error", message: "--list-rules prints text or json, not junit" };
  }
  return { command: "lint", options };
}
__name(parseLintArgs, "parseLintArgs");
function parseInitArgs(rest, cwd) {
  let folder = null;
  const options = {
    folder: "",
    cwd,
    name: DEFAULT_WRANGLER,
    tests: DEFAULT_INIT_TESTS,
    configFolder: null,
    pattern: null,
    recursive: false,
    sequential: false,
    lint: true,
    force: false
  };
  for (let i = 0; i < rest.length; i++) {
    const arg = rest[i];
    if (!arg.startsWith("--")) {
      if (folder !== null) {
        return { command: "error", message: `init sets up one folder, got "${folder}" and "${arg}"` };
      }
      folder = arg;
      continue;
    }
    switch (arg) {
      case "--recursive":
        options.recursive = true;
        continue;
      case "--sequential":
        options.sequential = true;
        continue;
      case "--no-lint":
        options.lint = false;
        continue;
      case "--force":
        options.force = true;
        continue;
    }
    const v = rest[i + 1];
    if (v === void 0 || v.startsWith("--")) {
      return { command: "error", message: `${arg} needs a value` };
    }
    i++;
    switch (arg) {
      case "--tests":
        options.tests = v;
        break;
      case "--config-folder":
        options.configFolder = v;
        break;
      case "--pattern":
        options.pattern = v;
        break;
      case "--name":
        options.name = v;
        break;
      default:
        return { command: "error", message: `unknown option ${arg}` };
    }
  }
  options.folder = path2.resolve(cwd, folder ?? DEFAULT_INIT_FOLDER);
  return { command: "init", options };
}
__name(parseInitArgs, "parseInitArgs");

// src/core/index.ts
init_node_version();

// src/core/launch.ts
var path3 = __toESM(require("node:path"));
var import_lib2 = require("@munit-shared/lib");
function quote(value) {
  if (value.includes('"')) {
    throw new Error(`paths containing a double quote aren't supported: ${value}`);
  }
  return `"${value}"`;
}
__name(quote, "quote");
function box(id, text, rect, inlets, outlets) {
  return {
    box: {
      id,
      maxclass: "newobj",
      numinlets: inlets,
      numoutlets: outlets,
      outlettype: Array(outlets).fill(""),
      patching_rect: rect,
      text
    }
  };
}
__name(box, "box");
function runnerPatch(options, statusFile) {
  const tests = path3.resolve(options.target, options.tests ?? ".");
  const harness = [
    "mUnit.harness",
    `@loadFolder ${quote(tests)}`,
    `@configFolder ${quote(options.target)}`,
    ...options.pattern !== null ? [`@pattern ${quote(options.pattern)}`] : [],
    ...options.recursive ? ["@recursive 1"] : [],
    ...options.sequential ? ["@sequential 1"] : []
  ].join(" ");
  const runner = ["loadmess runner", quote(statusFile), ...options.outputDir !== null ? [quote(options.outputDir)] : []].join(" ");
  const boxes = [
    box("obj-1", harness, [20, 20, 600, 22], 0, 1),
    box("obj-2", runner, [20, 60, 600, 22], 1, 1),
    box("obj-3", "mUnit.handler", [20, 120, 100, 22], 1, 3)
  ];
  const lines = [
    { patchline: { source: ["obj-1", 0], destination: ["obj-3", 0] } },
    { patchline: { source: ["obj-2", 0], destination: ["obj-3", 0] } }
  ];
  if (options.takeReferences) {
    boxes.push(box("obj-4", "loadmess takeReferences 1", [20, 90, 150, 22], 1, 1));
    lines.push({ patchline: { source: ["obj-4", 0], destination: ["obj-3", 0] } });
  }
  const patcher = {
    patcher: {
      fileversion: 1,
      appversion: { major: 9, minor: 0, revision: 0, architecture: "x64", modernui: 1 },
      classnamespace: "box",
      rect: [100, 100, 640, 240],
      boxes,
      lines
    }
  };
  return JSON.stringify(patcher, null, 2);
}
__name(runnerPatch, "runnerPatch");
function runnerEnv(statusFile, outputDir, takeReferences) {
  return {
    [import_lib2.STATUS_FILE_ENV]: statusFile,
    ...outputDir !== null ? { [import_lib2.OUTPUT_DIR_ENV]: outputDir } : {},
    ...takeReferences ? { [import_lib2.TAKE_REFERENCES_ENV]: "1" } : {}
  };
}
__name(runnerEnv, "runnerEnv");
var openCommand = /* @__PURE__ */ __name((maxApp, patch, statusFile, outputDir, takeReferences = false) => ({
  cmd: "open",
  args: ["-n", "-W", ...Object.entries(runnerEnv(statusFile, outputDir, takeReferences)).flatMap(([k, v]) => ["--env", `${k}=${v}`]), "-a", maxApp, patch],
  env: {}
}), "openCommand");
var windowsCommand = /* @__PURE__ */ __name((maxApp, patch, statusFile, outputDir, takeReferences = false) => ({
  cmd: maxApp,
  args: [patch],
  env: runnerEnv(statusFile, outputDir, takeReferences)
}), "windowsCommand");
function launcherFor(platform) {
  return platform === "darwin" ? openCommand : platform === "win32" ? windowsCommand : null;
}
__name(launcherFor, "launcherFor");

// src/core/index.ts
init_verdict();

// src/core/run.ts
var path4 = __toESM(require("node:path"));
var import_lib3 = require("@munit-shared/lib");
init_verdict();
var POLL_MS = 250;
var QUIT_GRACE_MS = 15e3;
var KILL_GRACE_MS = 5e3;
async function waitFor(deps2, done, ms) {
  const until = deps2.now() + ms;
  while (!done()) {
    if (deps2.now() >= until) {
      return false;
    }
    await deps2.sleep(POLL_MS);
  }
  return true;
}
__name(waitFor, "waitFor");
async function stopMax(deps2, pid) {
  if (!deps2.isAlive(pid)) {
    return;
  }
  deps2.log(`mUnit: stopping Max (pid ${pid})`);
  deps2.kill(pid, "SIGTERM");
  if (!await waitFor(deps2, () => !deps2.isAlive(pid), KILL_GRACE_MS)) {
    deps2.kill(pid, "SIGKILL");
  }
}
__name(stopMax, "stopMax");
async function runSuite(options, deps2) {
  const launcher = launcherFor(options.platform);
  if (launcher === null) {
    deps2.log(`mUnit: run supports macOS and Windows, not ${options.platform}`);
    return EXIT_INFRASTRUCTURE;
  }
  if (!deps2.exists(options.target)) {
    deps2.log(`mUnit: ${options.target} doesn't exist`);
    return EXIT_INFRASTRUCTURE;
  }
  if (!deps2.exists(options.maxApp)) {
    deps2.log(`mUnit: Max isn't at ${options.maxApp}; pass --max or set MUNIT_MAX_APP`);
    return EXIT_INFRASTRUCTURE;
  }
  const tmp = deps2.makeTempDir();
  const statusFile = path4.join(tmp, "status.json");
  try {
    let patch = options.target;
    if (options.kind === "folder") {
      patch = path4.join(tmp, "munit-runner.maxpat");
      deps2.writeFile(patch, runnerPatch(options, statusFile));
    }
    const { cmd, args, env } = launcher(options.maxApp, patch, statusFile, options.outputDir, options.takeReferences);
    deps2.log(`mUnit: running ${options.target} in ${options.maxApp}${options.takeReferences ? " (taking references)" : ""}`);
    const launched = deps2.launch(cmd, args, env);
    let exit = null;
    void launched.exited.then((e) => {
      exit = e;
    });
    const launcherExit = /* @__PURE__ */ __name(() => exit, "launcherExit");
    const deadline = deps2.now() + options.timeoutMs;
    let status = null;
    let printed = 0;
    const printProgress = /* @__PURE__ */ __name(() => {
      const progress = status?.progress ?? [];
      for (const entry of progress.slice(printed)) {
        deps2.log(`  ${(0, import_lib3.formatProgress)(entry)}`);
      }
      printed = Math.max(printed, progress.length);
    }, "printProgress");
    let exited = null;
    while (true) {
      status = deps2.readStatus(statusFile) ?? status;
      printProgress();
      if (status?.phase === "finished") {
        break;
      }
      if (exited !== null) {
        deps2.log(`mUnit: Max exited before the suite finished (${cmd === "open" ? "open" : "Max"} exit code ${String(exited.code)})${exited.stderr !== "" ? `: ${exited.stderr.trim()}` : ""}`);
        return EXIT_INFRASTRUCTURE;
      }
      exited = launcherExit();
      if (exited !== null) {
        continue;
      }
      if (deps2.now() >= deadline) {
        deps2.log(`mUnit: no result after ${options.timeoutMs / 1e3} s` + (status === null ? "; the handler never reported, so Max may still be open" : ""));
        if (status !== null) {
          await stopMax(deps2, status.maxPid);
        }
        return EXIT_INFRASTRUCTURE;
      }
      await deps2.sleep(POLL_MS);
    }
    for (const line of describeStatus(status)) {
      deps2.log(line);
    }
    if (!await waitFor(deps2, () => launcherExit() !== null, QUIT_GRACE_MS)) {
      await stopMax(deps2, status.maxPid);
    }
    return exitCodeFor(status);
  } finally {
    if (options.keep) {
      deps2.log(`mUnit: kept ${tmp}`);
    } else {
      deps2.removeDir(tmp);
    }
  }
}
__name(runSuite, "runSuite");

// src/munit-cli.ts
var deps = {
  exists: /* @__PURE__ */ __name((file) => fs.existsSync(file), "exists"),
  makeTempDir: /* @__PURE__ */ __name(() => fs.mkdtempSync(path5.join(os.tmpdir(), "munit-run-")), "makeTempDir"),
  writeFile: /* @__PURE__ */ __name((file, content) => {
    fs.writeFileSync(file, content);
  }, "writeFile"),
  removeDir: /* @__PURE__ */ __name((dir) => {
    fs.rmSync(dir, { recursive: true, force: true });
  }, "removeDir"),
  launch: /* @__PURE__ */ __name((cmd, args, env) => {
    const child = (0, import_node_child_process.spawn)(cmd, args, { stdio: ["ignore", "ignore", "pipe"], env: { ...process.env, ...env } });
    let stderr = "";
    child.stderr.on("data", (chunk) => {
      stderr += chunk.toString();
    });
    return {
      exited: new Promise((resolve4) => {
        child.on("error", (e) => {
          resolve4({ code: null, stderr: String(e) });
        });
        child.on("exit", (code) => {
          resolve4({ code, stderr });
        });
      })
    };
  }, "launch"),
  readStatus: /* @__PURE__ */ __name((file) => {
    try {
      return JSON.parse(fs.readFileSync(file, "utf8"));
    } catch {
      return null;
    }
  }, "readStatus"),
  isAlive: /* @__PURE__ */ __name((pid) => {
    try {
      process.kill(pid, 0);
      return true;
    } catch {
      return false;
    }
  }, "isAlive"),
  kill: /* @__PURE__ */ __name((pid, signal) => {
    try {
      process.kill(pid, signal);
    } catch {
    }
  }, "kill"),
  now: /* @__PURE__ */ __name(() => Date.now(), "now"),
  sleep: /* @__PURE__ */ __name(async (ms) => {
    await new Promise((resolve4) => setTimeout(resolve4, ms));
  }, "sleep"),
  log: /* @__PURE__ */ __name((line) => {
    console.log(line);
  }, "log")
};
var initDeps = {
  exists: /* @__PURE__ */ __name((file) => fs.existsSync(file), "exists"),
  readFile: /* @__PURE__ */ __name((file) => fs.readFileSync(file, "utf8"), "readFile"),
  makeDir: /* @__PURE__ */ __name((dir) => {
    fs.mkdirSync(dir, { recursive: true });
  }, "makeDir"),
  writeFile: /* @__PURE__ */ __name((file, content) => {
    fs.writeFileSync(file, content);
  }, "writeFile"),
  log: /* @__PURE__ */ __name((line) => {
    console.log(line);
  }, "log")
};
async function main() {
  const parsed = parseArgs(process.argv.slice(2), process.cwd(), process.env, process.platform);
  if (parsed.command === "help") {
    console.log(USAGE);
    return 0;
  }
  if (parsed.command === "error") {
    console.error(`mUnit: ${parsed.message}

${USAGE}`);
    return EXIT_INFRASTRUCTURE;
  }
  if (parsed.command === "lint") {
    return (0, import_lint2.lintTarget)(parsed.options, (0, import_lint2.nodeLintDeps)());
  }
  if (parsed.command === "init") {
    return initSuite(parsed.options, initDeps);
  }
  return await runSuite(parsed.options, deps);
}
__name(main, "main");
main().then((code) => {
  process.exitCode = code;
}, (e) => {
  console.error(`mUnit: ${String(e)}`);
  process.exitCode = EXIT_INFRASTRUCTURE;
});
