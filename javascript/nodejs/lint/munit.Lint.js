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

// src/munit.Lint.n4m.ts
var fs2 = __toESM(require("node:fs"));
var path4 = __toESM(require("node:path"));
var import_max_api = __toESM(require("max-api"));

// src/core/lint.ts
var path = __toESM(require("node:path"));
var import_lint = require("@munit-shared/lint");
var MAX_FIX_PASSES = 5;
function toPosix(p) {
  return p.split(path.sep).join("/");
}
__name(toPosix, "toPosix");
function relative2(from, to) {
  const rel = path.relative(from, to);
  return rel.startsWith("..") ? toPosix(to) : toPosix(rel);
}
__name(relative2, "relative");
function hasGlob(pattern) {
  return /[*?{]/.test(pattern);
}
__name(hasGlob, "hasGlob");
function isPackageName(entry) {
  return /^(@[\w.-]+\/)?[\w.-]+$/.test(entry) && !entry.startsWith(".") && !/\.json$/i.test(entry);
}
__name(isPackageName, "isPackageName");
var PACK_RULE_FILE = "munit-rules.json";
function findShadowingConfigFile(startDir, deps2) {
  let dir = startDir;
  while (true) {
    const candidate = path.join(dir, import_lint.SHADOWING_CONFIG_FILE_NAME);
    if (deps2.exists(candidate)) {
      return candidate;
    }
    const parent = path.dirname(dir);
    if (parent === dir) {
      return null;
    }
    dir = parent;
  }
}
__name(findShadowingConfigFile, "findShadowingConfigFile");
function findConfigFiles(startDir, deps2, isRoot, stopAt) {
  const found = [];
  let dir = startDir;
  while (true) {
    const candidate = path.join(dir, import_lint.CONFIG_FILE_NAME);
    if (deps2.exists(candidate)) {
      found.unshift(candidate);
      if (isRoot(candidate)) {
        break;
      }
    }
    if (stopAt !== void 0 && dir === stopAt) {
      break;
    }
    const parent = path.dirname(dir);
    if (parent === dir) {
      break;
    }
    dir = parent;
  }
  return found;
}
__name(findConfigFiles, "findConfigFiles");
function isInside(folder, file, self = true) {
  const rel = path.relative(folder, file);
  if (rel === "") {
    return self;
  }
  return !rel.startsWith("..") && !path.isAbsolute(rel);
}
__name(isInside, "isInside");
function readJson(file, deps2, errors) {
  try {
    return JSON.parse(deps2.readFile(file));
  } catch (e) {
    errors.push(`${file}: ${e.message}`);
    return void 0;
  }
}
__name(readJson, "readJson");
function loadScript(rule, ruleDir, deps2, errors) {
  if (rule.kind !== "script") {
    return;
  }
  const file = path.resolve(ruleDir, rule.module);
  if (!deps2.exists(file)) {
    errors.push(`${rule.source}: rule ${rule.id}: script module ${file} doesn't exist`);
    return;
  }
  let loaded;
  try {
    loaded = deps2.requireModule(file);
  } catch (e) {
    errors.push(`${rule.source}: rule ${rule.id}: ${file}: ${e.message}`);
    return;
  }
  const where = `${rule.source}: rule ${rule.id}: ${file}`;
  const check = (0, import_lint.isRecord)(loaded) ? loaded["check"] : void 0;
  if (typeof check !== "function") {
    errors.push(`${where} must export a check(ctx) function`);
    return;
  }
  rule.check = check;
  const module2 = loaded;
  const meta = module2["meta"];
  if (meta !== void 0) {
    if (!(0, import_lint.isRecord)(meta)) {
      errors.push(`${where}: meta must be an object with description, fixable or options`);
    } else {
      rule.meta = {};
      if (meta["description"] !== void 0) {
        if (typeof meta["description"] !== "string") {
          errors.push(`${where}: meta.description must be a string`);
        } else {
          rule.meta.description = meta["description"];
        }
      }
      if (meta["fixable"] !== void 0) {
        if (typeof meta["fixable"] !== "boolean") {
          errors.push(`${where}: meta.fixable must be true or false`);
        } else {
          rule.meta.fixable = meta["fixable"];
        }
      }
      if (meta["options"] !== void 0) {
        if (!(0, import_lint.isRecord)(meta["options"])) {
          errors.push(`${where}: meta.options must be a JSON Schema object`);
        } else {
          rule.meta.options = meta["options"];
          for (const problem of (0, import_lint.validateAgainstSchema)(rule.options ?? {}, rule.meta.options, "options")) {
            errors.push(`${rule.source}: rule ${rule.id}: ${problem}`);
          }
        }
      }
    }
  }
  const project = module2["project"];
  if (project !== void 0) {
    if (!(0, import_lint.isRecord)(project) || project["begin"] !== void 0 && typeof project["begin"] !== "function" || project["end"] !== void 0 && typeof project["end"] !== "function") {
      errors.push(`${where}: project must be an object with begin(ctx) and/or end(ctx) functions`);
    } else {
      rule.project = {};
      if (typeof project["begin"] === "function") {
        rule.project.begin = project["begin"];
      }
      if (typeof project["end"] === "function") {
        rule.project.end = project["end"];
      }
    }
  }
}
__name(loadScript, "loadScript");
function packRuleFile(name, configDir, deps2, errors) {
  const dir = deps2.resolvePackage(name, configDir);
  if (dir === null) {
    errors.push(`rule pack "${name}" is not installed in or above ${configDir} (npm install --save-dev ${name}), and it is not a rule file either`);
    return null;
  }
  const own = path.join(dir, PACK_RULE_FILE);
  if (deps2.exists(own)) {
    return own;
  }
  const manifest = path.join(dir, "package.json");
  const raw = deps2.exists(manifest) ? readJson(manifest, deps2, errors) : void 0;
  const main = (0, import_lint.isRecord)(raw) ? raw["main"] : void 0;
  if (typeof main === "string" && /\.json$/i.test(main) && deps2.exists(path.join(dir, main))) {
    return path.join(dir, main);
  }
  errors.push(`rule pack "${name}" (${dir}) has no ${PACK_RULE_FILE} and its package.json names no JSON "main"`);
  return null;
}
__name(packRuleFile, "packRuleFile");
function loadRuleFile(file, deps2, errors) {
  if (!deps2.exists(file)) {
    errors.push(`rule file ${file} doesn't exist`);
    return [];
  }
  const raw = readJson(file, deps2, errors);
  if (raw === void 0) {
    return [];
  }
  const parsed = (0, import_lint.parseRules)(raw, file);
  errors.push(...parsed.errors);
  for (const rule of parsed.rules) {
    loadScript(rule, path.dirname(file), deps2, errors);
  }
  return parsed.rules;
}
__name(loadRuleFile, "loadRuleFile");
function loadRules(config, configDir, extraFiles, deps2, errors) {
  const rules = [];
  for (const entry of config.rules) {
    if (typeof entry !== "string") {
      loadScript(entry, configDir, deps2, errors);
      rules.push(entry);
    } else if (entry.startsWith("mUnit:")) {
      const set = (0, import_lint.builtInRules)(entry);
      if (set === null) {
        errors.push(`unknown rule set "${entry}"; the built-in sets are ${import_lint.BUILT_IN_SET_NAMES.join(", ")}`);
      } else {
        rules.push(...set);
      }
    } else if (isPackageName(entry) && !deps2.exists(path.resolve(configDir, entry))) {
      const file = packRuleFile(entry, configDir, deps2, errors);
      if (file !== null) {
        rules.push(...loadRuleFile(file, deps2, errors));
      }
    } else if (hasGlob(entry)) {
      const pattern = toPosix(path.normalize(entry));
      const matches = deps2.isDirectory(configDir) ? deps2.listFiles(configDir).filter((f) => (0, import_lint.matchesGlob)(relative2(configDir, f), pattern)) : [];
      if (matches.length === 0) {
        errors.push(`no rule files match "${entry}" in ${configDir}`);
      }
      for (const file of matches) {
        rules.push(...loadRuleFile(file, deps2, errors));
      }
    } else {
      rules.push(...loadRuleFile(path.resolve(configDir, entry), deps2, errors));
    }
  }
  for (const file of extraFiles) {
    rules.push(...loadRuleFile(file, deps2, errors));
  }
  const seen = /* @__PURE__ */ new Map();
  for (const rule of rules) {
    const first = seen.get(rule.id);
    if (first !== void 0) {
      errors.push(`rule id "${rule.id}" is defined twice: in ${first} and ${rule.source}`);
    } else {
      seen.set(rule.id, rule.source);
    }
  }
  return rules;
}
__name(loadRules, "loadRules");
var ConfigResolver = class {
  // stopAt: the folder the search for configs stops at (LintOptions.root)
  constructor(deps2, cwd, stopAt = null) {
    this.deps = deps2;
    this.cwd = cwd;
    this.stopAt = stopAt;
  }
  static {
    __name(this, "ConfigResolver");
  }
  configs = /* @__PURE__ */ new Map();
  chains = /* @__PURE__ */ new Map();
  // --config: one file that applies everywhere and stops the cascade
  explicit = null;
  useOnly(file) {
    this.explicit = this.load(file);
  }
  load(file) {
    let loaded = this.configs.get(file);
    if (loaded === void 0) {
      const errors = [];
      let config = { ...import_lint.DEFAULT_CONFIG };
      const raw = readJson(file, this.deps, errors);
      if (raw !== void 0) {
        const resolved = (0, import_lint.resolveLintConfig)(raw, relative2(this.cwd, file));
        errors.push(...resolved.errors);
        config = resolved.config;
      }
      loaded = { file, dir: path.dirname(file), config, rules: null, errors };
      this.configs.set(file, loaded);
    }
    return loaded;
  }
  // The configs in force in a folder, outermost first
  chain(dir) {
    if (this.explicit !== null) {
      return [this.explicit];
    }
    let chain = this.chains.get(dir);
    if (chain === void 0) {
      chain = findConfigFiles(dir, this.deps, (file) => this.load(file).config.root, this.stopAt ?? void 0).map((file) => this.load(file));
      this.chains.set(dir, chain);
    }
    return chain;
  }
  rulesOf(loaded) {
    if (loaded.rules === null) {
      loaded.rules = loadRules(loaded.config, loaded.dir, [], this.deps, loaded.errors);
    }
    return loaded.rules;
  }
};
function composeRules(layers) {
  const out = [];
  const at = /* @__PURE__ */ new Map();
  for (const layer of layers) {
    for (const rule of layer) {
      const index = at.get(rule.id);
      if (index === void 0) {
        at.set(rule.id, out.length);
        out.push(rule);
      } else {
        out[index] = rule;
      }
    }
  }
  return out;
}
__name(composeRules, "composeRules");
function runLint(options, deps2) {
  const run = { files: [], diagnostics: [], errors: [] };
  if (!deps2.exists(options.target)) {
    run.errors.push(`${options.target} doesn't exist`);
    return run;
  }
  const isFolder = deps2.isDirectory(options.target);
  const targetDir = isFolder ? options.target : path.dirname(options.target);
  const project = options.project ?? targetDir;
  if (options.config !== null && !deps2.exists(options.config)) {
    run.errors.push(`config file ${options.config} doesn't exist`);
    return run;
  }
  for (const dir of /* @__PURE__ */ new Set([targetDir, project])) {
    const shadowing = findShadowingConfigFile(dir, deps2);
    if (shadowing !== null) {
      run.errors.push(`rename ${shadowing} to ${import_lint.CONFIG_FILE_NAME}: a file named ${import_lint.SHADOWING_CONFIG_FILE_NAME} shadows the [mUnit.lint] object in Max, which then fails to load with "No such object"`);
      return run;
    }
  }
  const resolve3 = new ConfigResolver(deps2, options.cwd, options.root === void 0 ? null : path.resolve(options.root));
  if (options.config !== null) {
    resolve3.useOnly(options.config);
  }
  const extraRules = [];
  for (const file of options.ruleFiles) {
    extraRules.push(...loadRuleFile(file, deps2, run.errors));
  }
  const chainDirFor = /* @__PURE__ */ __name((dir) => isInside(project, dir) ? dir : project, "chainDirFor");
  const reported = /* @__PURE__ */ new Set();
  const report = /* @__PURE__ */ __name((configs) => {
    let ok = true;
    for (const c of configs) {
      resolve3.rulesOf(c);
      if (c.errors.length > 0) {
        ok = false;
        if (!reported.has(c.file)) {
          reported.add(c.file);
          run.errors.push(...c.errors);
        }
      }
    }
    return ok;
  }, "report");
  const layersFor = /* @__PURE__ */ __name((configs, file) => configs.length === 0 ? [{ config: import_lint.DEFAULT_CONFIG, relativePath: relative2(project, file) }] : configs.map((c) => ({ config: c.config, relativePath: relative2(c.dir, file) })), "layersFor");
  const composed = /* @__PURE__ */ new Map();
  const reset = /* @__PURE__ */ new Set();
  const rulesFor = /* @__PURE__ */ __name((configs) => {
    const key = configs.map((c) => c.file).join("\0");
    let rules = composed.get(key);
    if (rules === void 0) {
      const layers = configs.length === 0 ? [(0, import_lint.builtInRules)(import_lint.RECOMMENDED)] : configs.map((c) => resolve3.rulesOf(c));
      rules = composeRules([...layers, extraRules]);
      composed.set(key, rules);
      for (const rule of rules) {
        if (rule.kind === "script" && !reset.has(rule)) {
          reset.add(rule);
          rule.state = {};
        }
      }
    }
    return rules;
  }, "rulesFor");
  const targetChain = resolve3.chain(chainDirFor(targetDir));
  if (!report(targetChain) || run.errors.length > 0) {
    return run;
  }
  run.configFiles = targetChain.map((c) => c.file);
  const targetRules = rulesFor(targetChain);
  run.ruleIds = targetRules.map((r) => r.id);
  const nested = /* @__PURE__ */ new Set();
  const selected = /* @__PURE__ */ __name((file) => {
    const chain = resolve3.chain(chainDirFor(path.dirname(file)));
    return (0, import_lint.selectsFile)(layersFor(chain, file));
  }, "selected");
  let files;
  if (isFolder) {
    files = deps2.listFiles(options.target).filter(selected);
  } else {
    files = [options.target];
    try {
      const doc = (0, import_lint.parseDocument)(options.target, deps2.readFile(options.target));
      for (const name of (0, import_lint.referencedFiles)(doc)) {
        const file = path.join(path.dirname(options.target), name);
        if (!files.includes(file) && deps2.exists(file) && selected(file)) {
          files.push(file);
        }
      }
    } catch (e) {
      if (!(e instanceof import_lint.PatcherParseError)) {
        run.errors.push(String(e));
      }
    }
  }
  const projectRules = options.listRules === true ? [] : targetRules.filter((r) => r.kind === "script" && r.project !== void 0 && r.level !== "off");
  const shownFiles = files.map((f) => relative2(options.cwd, f));
  if (projectRules.length > 0) {
    run.projectHooks = true;
  }
  const hookError = /* @__PURE__ */ __name((rule, hook, e) => {
    run.errors.push(`rule ${rule.id} (${rule.module}): ${hook} threw: ${e instanceof Error ? e.message : String(e)}`);
  }, "hookError");
  for (const rule of projectRules) {
    try {
      rule.project?.begin?.({ rule, options: rule.options, files: [...shownFiles], state: rule.state ?? {} });
    } catch (e) {
      hookError(rule, "begin", e);
    }
  }
  const levelsByFile = /* @__PURE__ */ new Map();
  const documents = /* @__PURE__ */ new Map();
  for (const file of files) {
    const shown = relative2(options.cwd, file);
    const chain = resolve3.chain(chainDirFor(path.dirname(file)));
    if (!report(chain)) {
      continue;
    }
    for (const c of chain) {
      if (!targetChain.includes(c)) {
        nested.add(c.file);
      }
    }
    run.files.push(shown);
    if (options.listRules === true) {
      const inForce = (0, import_lint.rulesForFile)(layersFor(chain, file), rulesFor(chain));
      run.ruleLists = run.ruleLists ?? [];
      run.ruleLists.push({
        file: shown,
        rules: inForce.map((r) => ({
          id: r.id,
          kind: r.kind,
          level: r.level,
          source: path.isAbsolute(r.source) ? relative2(options.cwd, r.source) : r.source,
          ...r.kind === "script" && r.meta?.description !== void 0 ? { description: r.meta.description } : {}
        }))
      });
      continue;
    }
    try {
      let text = deps2.readFile(file);
      const fileRules = (0, import_lint.rulesForFile)(layersFor(chain, file), rulesFor(chain));
      levelsByFile.set(shown, new Map(fileRules.map((r) => [r.id, r.level])));
      const lintOptions = {
        relatedFiles: relatedFilesOf(file, shown, text, deps2),
        onRuleError: /* @__PURE__ */ __name((rule, e) => {
          const module2 = rule.kind === "script" ? ` (${rule.module})` : "";
          run.errors.push(`${shown}: rule ${rule.id}${module2}: ${e instanceof Error ? e.message : String(e)}`);
        }, "onRuleError")
      };
      let document = (0, import_lint.parseDocument)(shown, text);
      documents.set(shown, document);
      let diagnostics = (0, import_lint.lintDocument)(document, fileRules, lintOptions);
      if (options.fix === true) {
        let fixed = 0;
        for (let pass = 0; pass < MAX_FIX_PASSES; pass++) {
          const seen = /* @__PURE__ */ new Set();
          const edits = diagnostics.flatMap((d) => {
            const key = `${d.patchers.join("/")}/${d.box ?? ""}`;
            if (d.edits.length === 0 || seen.has(key)) {
              return [];
            }
            seen.add(key);
            return d.edits;
          });
          if (edits.length === 0) {
            break;
          }
          const result = (0, import_lint.applyEdits)(text, edits);
          run.errors.push(...result.problems.map((p) => `${shown}: can't fix: ${p}`));
          if (result.applied.length === 0) {
            break;
          }
          fixed += result.applied.length;
          text = result.text;
          document = (0, import_lint.parseDocument)(shown, text);
          documents.set(shown, document);
          diagnostics = (0, import_lint.lintDocument)(document, fileRules, lintOptions);
        }
        if (fixed > 0) {
          deps2.writeFile(file, text);
          run.fixed = (run.fixed ?? 0) + fixed;
        }
      }
      run.diagnostics.push(...diagnostics);
    } catch (e) {
      run.errors.push(e instanceof import_lint.PatcherParseError ? e.message : `${shown}: ${e.message}`);
    }
  }
  for (const rule of projectRules) {
    const report2 = /* @__PURE__ */ __name((finding) => {
      if (!(0, import_lint.isRecord)(finding) || typeof finding.message !== "string" || typeof finding.file !== "string") {
        hookError(rule, "end", new Error(`a project finding must be an object with a file and a message, got ${JSON.stringify(finding) ?? String(finding)}`));
        return;
      }
      const level = levelsByFile.get(finding.file)?.get(rule.id);
      if (level === void 0) {
        return;
      }
      const patcher = finding.patcher ?? documents.get(finding.file)?.root ?? null;
      run.diagnostics.push((0, import_lint.toDiagnostic)(rule.id, level, finding.file, patcher, finding.box ?? null, finding.message, finding.edits ?? []));
    }, "report");
    try {
      rule.project?.end?.({ rule, options: rule.options, files: [...shownFiles], state: rule.state ?? {}, report: report2 });
    } catch (e) {
      hookError(rule, "end", e);
    }
  }
  if (nested.size > 0) {
    run.nestedConfigFiles = [...nested];
  }
  if (files.length === 0 && run.errors.length === 0) {
    deps2.log(`mUnit lint: no files to lint under ${options.target} (files: ${(0, import_lint.filesFor)(layersFor(targetChain, options.target)).join(", ")})`);
  }
  return run;
}
__name(runLint, "runLint");
function relatedFilesOf(file, shown, text, deps2) {
  try {
    const names = (0, import_lint.referencedFiles)((0, import_lint.parseDocument)(shown, text));
    return names.map((name) => path.join(path.dirname(file), name)).filter((f) => deps2.exists(f));
  } catch {
    return [];
  }
}
__name(relatedFilesOf, "relatedFilesOf");

// src/core/server.ts
var path2 = __toESM(require("node:path"));
var import_lint2 = require("@munit-shared/lint");
var DEBOUNCE_MS = 200;
var RECENT_SAVE_MS = 3e3;
var PATCH_EXTENSIONS = [".maxpat", ".maxhelp", ".gendsp", ".rnbopat"];
var NO_FOLDER = "none";
function isOn(flag) {
  return flag === true || flag === 1 || flag === "1" || flag === "true";
}
__name(isOn, "isOn");
function isPatchFile(file) {
  return PATCH_EXTENSIONS.includes(path2.extname(file).toLowerCase());
}
__name(isPatchFile, "isPatchFile");
var LintServer = class {
  constructor(deps2) {
    this.deps = deps2;
  }
  static {
    __name(this, "LintServer");
  }
  // The folder of the patch that holds [mUnit.lint]; relative paths resolve against it
  home = null;
  // The folder to watch; null (@folder none) watches no folder at all
  folder = ".";
  // Whether the folder is the top of the config cascade (@root 1)
  rootFlag = false;
  // Whether the patch in front is linted when it lies outside the folder (@followfront)
  followFront = true;
  config = null;
  // Extra rule files (@rules), like the CLI's --rules
  rules = [];
  // The disable comment is explained once, with the first finding
  hinted = false;
  // Between start and stop
  active = false;
  // The resolved folder while watching; null while watching without one
  watched = null;
  unwatch = /* @__PURE__ */ new Map();
  // Files outside the folder that the front patcher brought in, and their
  // folders: any patch saved in one of those folders is linted
  extra = /* @__PURE__ */ new Set();
  extraDirs = /* @__PURE__ */ new Set();
  pending = /* @__PURE__ */ new Map();
  // The configs last named in the console, named again only when they change
  announced = null;
  get watching() {
    return this.active;
  }
  setHome(folder) {
    this.home = folder;
  }
  setFolder(folder) {
    this.folder = folder === "" ? "." : folder === NO_FOLDER ? null : folder;
  }
  setRoot(flag) {
    this.rootFlag = isOn(flag);
  }
  setFollowFront(flag) {
    this.followFront = isOn(flag);
  }
  setConfig(file) {
    this.config = file === "" ? null : file;
  }
  setRules(files) {
    this.rules = files.filter((f) => f !== "");
  }
  resolve(p) {
    if (path2.isAbsolute(p)) {
      return path2.normalize(p);
    }
    if (this.home === null) {
      return null;
    }
    return path2.resolve(this.home, p);
  }
  // The folder to watch, resolved, or null with the reason posted; undefined
  // when there is none to watch (@folder none)
  folderToWatch() {
    if (this.folder === null) {
      if (!this.followFront) {
        this.deps.post("error", "@folder none with @followfront 0 leaves nothing to lint: set a folder, or @followfront 1");
        return null;
      }
      return void 0;
    }
    const root = this.watched ?? this.resolve(this.folder);
    if (root === null) {
      this.deps.post("error", `save the patch first: @folder ${this.folder} is relative to its folder`);
      return null;
    }
    return root;
  }
  // Watch the folder and lint everything in it once; without a folder, wait
  // for a patch to come to the front
  start() {
    const root = this.folderToWatch();
    if (root === null) {
      return;
    }
    if (root !== void 0 && !this.deps.lint.isDirectory(root)) {
      this.deps.post("error", `${root} is not a folder`);
      return;
    }
    this.stop(true);
    this.active = true;
    this.announced = null;
    if (root === void 0) {
      this.watchExtras();
      this.deps.post("info", `no folder to watch: the patch in front is linted when you save it, with the ${import_lint2.CONFIG_FILE_NAME} files in and above its own folder`);
      return;
    }
    this.watched = root;
    this.unwatch.set(root, this.deps.watch(root, (file) => {
      this.changed(file);
    }));
    this.watchExtras();
    this.deps.post("info", `watching ${root}${this.rootFlag ? " as the top of the config cascade" : ""}${this.followFront ? "" : ", and nothing outside it"}; findings are posted here as you save`);
    const run = this.lintEverything();
    if (run === null) {
      return;
    }
    this.announce(run, root);
    if (run.nestedConfigFiles !== void 0) {
      this.deps.post("info", `subfolders add their own: ${run.nestedConfigFiles.join(", ")}`);
    }
    this.report(run);
  }
  stop(quiet = false) {
    for (const unwatch of this.unwatch.values()) {
      unwatch();
    }
    this.unwatch.clear();
    this.extraDirs.clear();
    for (const handle of this.pending.values()) {
      this.deps.clearTimer(handle);
    }
    this.pending.clear();
    if (this.active && !quiet) {
      this.deps.post("info", "stopped watching");
    }
    this.active = false;
    this.watched = null;
  }
  lintAll() {
    if (this.folder === null && this.followFront && this.extra.size === 0) {
      this.deps.post("info", "nothing to lint yet: bring a patch to the front and save it");
      return;
    }
    const run = this.lintEverything();
    if (run !== null) {
      this.report(run);
    }
  }
  lintFile(file) {
    const full = this.resolve(file);
    if (full === null) {
      this.deps.post("error", `save the patch first: ${file} is relative to its folder`);
      return;
    }
    this.run(full);
  }
  // The front patcher's file, from the v8 helper: lint it on save even
  // when it is outside the folder. With @followfront 0 it is only
  // remembered, for a later start with @followfront 1
  watchFile(file) {
    if (!isPatchFile(file) || this.extra.has(file)) {
      return;
    }
    this.extra.add(file);
    if (!this.active || !this.followFront) {
      return;
    }
    const fresh = this.watchExtra(file);
    if (fresh) {
      const modified = this.deps.modifiedAt(file);
      if (modified !== null && Date.now() - modified < RECENT_SAVE_MS) {
        this.run(file);
      }
    }
  }
  // Apply the fixes the rules describe to one file, or to everything, and
  // write them back; Max reloads a changed file when it is in front
  fix(file) {
    if (file === "") {
      const run = this.lintEverything(true);
      if (run !== null) {
        this.report(run);
      }
      return;
    }
    const full = this.resolve(file);
    if (full === null) {
      this.deps.post("error", `save the patch first: ${file} is relative to its folder`);
      return;
    }
    this.report(this.lint(full, true));
  }
  // Watches the folders of the patches seen in front, unless @followfront 0
  watchExtras() {
    if (!this.followFront) {
      return;
    }
    for (const file of this.extra) {
      this.watchExtra(file);
    }
  }
  // Watches the folder of a patch in front, unless it is covered already;
  // true when a watcher was added
  watchExtra(file) {
    if (this.watched !== null && isInside(this.watched, file, false)) {
      return false;
    }
    const dir = path2.dirname(file);
    if (this.unwatch.has(dir)) {
      return false;
    }
    this.unwatch.set(dir, this.deps.watch(dir, (changed) => {
      this.changed(changed);
    }));
    this.extraDirs.add(dir);
    this.deps.post("info", `${this.watched === null ? "watching" : "also watching"} ${dir}, because ${path2.basename(file)} is in front`);
    return true;
  }
  changed(file) {
    if (!isPatchFile(file)) {
      return;
    }
    const inRoot = this.watched !== null && isInside(this.watched, file, false);
    if (!inRoot && !this.extraDirs.has(path2.dirname(file))) {
      return;
    }
    const existing = this.pending.get(file);
    if (existing !== void 0) {
      this.deps.clearTimer(existing);
    }
    this.pending.set(file, this.deps.setTimer(() => {
      this.pending.delete(file);
      if (this.deps.lint.exists(file)) {
        this.run(file);
      }
    }, DEBOUNCE_MS));
  }
  lint(target, fix = false) {
    const cwd = this.watched ?? (this.folder === null ? path2.dirname(target) : this.resolve(".") ?? path2.dirname(target));
    const project = this.folder === null ? void 0 : this.watched ?? this.resolve(this.folder) ?? void 0;
    const root = this.rootFlag ? project : void 0;
    const config = this.config === null ? null : this.resolve(this.config);
    const ruleFiles = this.rules.map((f) => this.resolve(f) ?? f);
    return runLint({ target, cwd, config, ruleFiles, project, root, format: "text", output: null, colour: false, fix }, this.deps.lint);
  }
  run(target) {
    const run = this.lint(target);
    if (this.folder === null) {
      this.announce(run, path2.dirname(target));
    }
    if (run.projectHooks === true && this.watched !== null && target !== this.watched) {
      const whole = this.lintEverything();
      if (whole !== null) {
        this.report(whole);
      }
      return;
    }
    this.report(run);
  }
  // Everything "lint" and "fix" without a path cover, as one run: the
  // folder, plus the patches in front that lie outside it unless
  // @followfront 0 (without a folder, those alone). Null when the folder
  // can't be resolved, with the reason posted
  lintEverything(fix = false) {
    const root = this.folderToWatch();
    if (root === null) {
      return null;
    }
    const run = root === void 0 ? { files: [], diagnostics: [], errors: [] } : this.lint(root, fix);
    if (!this.followFront) {
      return run;
    }
    for (const file of this.extra) {
      if (root !== void 0 && isInside(root, file, false) || !this.deps.lint.exists(file)) {
        continue;
      }
      const extra = this.lint(file, fix);
      run.files.push(...extra.files);
      run.diagnostics.push(...extra.diagnostics);
      run.errors.push(...extra.errors);
      if (extra.fixed !== void 0) {
        run.fixed = (run.fixed ?? 0) + extra.fixed;
      }
    }
    return run;
  }
  // Names the configs a run used, when they differ from the ones last named
  announce(run, dir) {
    if (run.configFiles === void 0) {
      return;
    }
    const key = run.configFiles.join("\0");
    if (key === this.announced) {
      return;
    }
    this.announced = key;
    const count = run.ruleIds?.length ?? 0;
    const rules = `${count} rule${count === 1 ? "" : "s"} active`;
    if (run.configFiles.length > 0) {
      this.deps.post("info", `rules from ${run.configFiles.join(" + ")} (${rules})`);
    } else if (this.rootFlag && this.watched !== null) {
      this.deps.post("info", `no ${import_lint2.CONFIG_FILE_NAME} found in ${this.watched} (the folders above it are not searched), so ${import_lint2.RECOMMENDED} applies (${rules}); add one to choose rules`);
    } else {
      this.deps.post("info", `no ${import_lint2.CONFIG_FILE_NAME} found in or above ${dir}, so ${import_lint2.RECOMMENDED} applies (${rules}); add one to choose rules`);
    }
  }
  report(run) {
    for (const d of run.diagnostics) {
      const where = d.location !== "" ? `${d.location}: ` : "";
      this.deps.post(d.level === "block" ? "error" : "warn", `${d.file}: ${where}${d.message} [${d.rule}]`);
    }
    for (const error of run.errors) {
      this.deps.post("error", error);
    }
    if (run.diagnostics.length > 0 && !this.hinted) {
      this.hinted = true;
      const rule = run.diagnostics[0]?.rule ?? "<rule>";
      this.deps.post("info", `to silence a rule in one patcher, add a comment box there reading: munit-lint disable ${rule}`);
    }
    const summary = (0, import_lint2.summarise)(run);
    const files = run.files.length === 1 ? run.files[0] : `${run.files.length} files`;
    this.deps.post("info", `${files}: ${(0, import_lint2.summaryText)(summary)}`);
    const message = {
      files: run.files,
      summary,
      findings: run.diagnostics.map(({ edits: _edits, ...rest }) => rest),
      errors: run.errors
    };
    this.deps.outlet("findings", message);
  }
};

// src/lint-deps.ts
var fs = __toESM(require("node:fs"));
var path3 = __toESM(require("node:path"));
function nodeLintDeps() {
  const deps2 = {
    exists: /* @__PURE__ */ __name((file) => fs.existsSync(file), "exists"),
    isDirectory: /* @__PURE__ */ __name((file) => {
      try {
        return fs.statSync(file).isDirectory();
      } catch {
        return false;
      }
    }, "isDirectory"),
    readFile: /* @__PURE__ */ __name((file) => fs.readFileSync(file, "utf8"), "readFile"),
    listFiles: /* @__PURE__ */ __name((dir) => {
      const out = [];
      const visit = /* @__PURE__ */ __name((folder) => {
        for (const entry of fs.readdirSync(folder, { withFileTypes: true })) {
          const full = path3.join(folder, entry.name);
          if (entry.isDirectory()) {
            if (entry.name !== "node_modules") {
              visit(full);
            }
          } else if (entry.isFile()) {
            out.push(full);
          }
        }
      }, "visit");
      visit(dir);
      return out.sort();
    }, "listFiles"),
    requireModule: /* @__PURE__ */ __name((file) => require(file), "requireModule"),
    // An installed rule pack: its package.json resolved from the config's
    // folder upwards, as require would; packages whose "exports" hide
    // package.json are found through their entry point instead
    resolvePackage: /* @__PURE__ */ __name((name, fromDir) => {
      try {
        return path3.dirname(require.resolve(`${name}/package.json`, { paths: [fromDir] }));
      } catch {
      }
      try {
        let dir = path3.dirname(require.resolve(name, { paths: [fromDir] }));
        while (true) {
          const manifest = path3.join(dir, "package.json");
          if (fs.existsSync(manifest) && JSON.parse(fs.readFileSync(manifest, "utf8")).name === name) {
            return dir;
          }
          const parent = path3.dirname(dir);
          if (parent === dir) {
            return null;
          }
          dir = parent;
        }
      } catch {
        return null;
      }
    }, "resolvePackage"),
    writeFile: /* @__PURE__ */ __name((file, content) => {
      fs.mkdirSync(path3.dirname(file), { recursive: true });
      fs.writeFileSync(file, content);
    }, "writeFile"),
    log: /* @__PURE__ */ __name((line) => {
      console.log(line);
    }, "log"),
    // The NO_COLOR and FORCE_COLOR conventions, then whether stdout is a terminal
    supportsColour: /* @__PURE__ */ __name(() => {
      if (process.env["NO_COLOR"] !== void 0 && process.env["NO_COLOR"] !== "") {
        return false;
      }
      if (process.env["FORCE_COLOR"] !== void 0 && process.env["FORCE_COLOR"] !== "" && process.env["FORCE_COLOR"] !== "0") {
        return true;
      }
      return process.stdout.isTTY === true;
    }, "supportsColour")
  };
  return deps2;
}
__name(nodeLintDeps, "nodeLintDeps");

// src/munit.Lint.n4m.ts
var TAG = "mUnit.lint:";
var levels = {
  info: import_max_api.default.POST_LEVELS.INFO,
  warn: import_max_api.default.POST_LEVELS.WARN,
  error: import_max_api.default.POST_LEVELS.ERROR
};
var deps = {
  lint: nodeLintDeps(),
  watch: /* @__PURE__ */ __name((dir, onChange) => {
    const listener = /* @__PURE__ */ __name((_event, filename) => {
      if (filename !== null) {
        onChange(path4.join(dir, String(filename)));
      }
    }, "listener");
    let watcher;
    try {
      watcher = fs2.watch(dir, { recursive: true }, listener);
    } catch {
      watcher = fs2.watch(dir, listener);
    }
    watcher.on("error", (e) => {
      void import_max_api.default.post(`${TAG} watch error on ${dir}: ${String(e)}`, levels.error);
    });
    return () => {
      watcher.close();
    };
  }, "watch"),
  setTimer: /* @__PURE__ */ __name((fn, ms) => setTimeout(fn, ms), "setTimer"),
  modifiedAt: /* @__PURE__ */ __name((file) => {
    try {
      return fs2.statSync(file).mtimeMs;
    } catch {
      return null;
    }
  }, "modifiedAt"),
  clearTimer: /* @__PURE__ */ __name((handle) => {
    clearTimeout(handle);
  }, "clearTimer"),
  post: /* @__PURE__ */ __name((level, text) => {
    void import_max_api.default.post(`${TAG} ${text}`, levels[level]);
  }, "post"),
  outlet: /* @__PURE__ */ __name((...args) => {
    void import_max_api.default.outlet(...args);
  }, "outlet")
};
var server = new LintServer(deps);
import_max_api.default.addHandler("home", (folder) => {
  server.setHome(String(folder));
});
import_max_api.default.addHandler("folder", (folder) => {
  server.setFolder(folder === void 0 ? "" : String(folder));
});
import_max_api.default.addHandler("root", (flag) => {
  server.setRoot(flag ?? 1);
});
import_max_api.default.addHandler("followfront", (flag) => {
  server.setFollowFront(flag ?? 1);
});
import_max_api.default.addHandler("config", (file) => {
  server.setConfig(String(file));
});
import_max_api.default.addHandler("rules", (...files) => {
  server.setRules(files.map(String));
});
import_max_api.default.addHandler("done", () => {
  server.start();
});
import_max_api.default.addHandler("start", () => {
  server.start();
});
import_max_api.default.addHandler("stop", () => {
  server.stop();
});
import_max_api.default.addHandler("lint", (file) => {
  if (file === void 0) {
    server.lintAll();
  } else {
    server.lintFile(String(file));
  }
});
import_max_api.default.addHandler("front", (file) => {
  server.watchFile(String(file));
});
import_max_api.default.addHandler("fix", (file) => {
  server.fix(String(file ?? ""));
});
void import_max_api.default.outlet("started");
