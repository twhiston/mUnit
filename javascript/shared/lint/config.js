"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.DEFAULT_CONFIG = exports.DEFAULT_FILES = exports.SHADOWING_CONFIG_FILE_NAME = exports.CONFIG_FILE_NAME = void 0;
exports.resolveLintConfig = resolveLintConfig;
exports.filesFor = filesFor;
exports.selectsFile = selectsFile;
exports.rulesForFile = rulesForFile;
const util_1 = require("./util");
const glob_1 = require("./glob");
const recommended_1 = require("./recommended");
const rules_1 = require("./rules");
exports.CONFIG_FILE_NAME = 'munit-lint.json';
exports.SHADOWING_CONFIG_FILE_NAME = 'munit.lint.json';
exports.DEFAULT_FILES = ['**/*.maxpat', '**/*.maxhelp', '**/*.gendsp', '**/*.rnbopat'];
exports.DEFAULT_CONFIG = {
    rules: [recommended_1.RECOMMENDED],
    files: exports.DEFAULT_FILES,
    filesGiven: false,
    ignore: [],
    overrides: [],
    root: false
};
function stringList(value, key, errors, fallback) {
    if (value === undefined) {
        return fallback;
    }
    if (typeof value === 'string') {
        return [value];
    }
    if (Array.isArray(value) && value.every((v) => typeof v === 'string')) {
        return value;
    }
    errors.push(`${key} must be a list of strings`);
    return fallback;
}
const KNOWN_KEYS = new Set(['rules', 'files', 'ignore', 'overrides', 'root', '$schema']);
function resolveLintConfig(raw, source = exports.CONFIG_FILE_NAME) {
    const errors = [];
    if (!(0, util_1.isRecord)(raw)) {
        return { config: { ...exports.DEFAULT_CONFIG }, errors: [`${source}: the config must be an object`] };
    }
    for (const key of Object.keys(raw)) {
        if (!KNOWN_KEYS.has(key)) {
            errors.push(`${source}: "${key}" is not a setting; use rules, files, ignore, overrides or root`);
        }
    }
    const rules = [];
    const rulesRaw = raw['rules'] ?? [recommended_1.RECOMMENDED];
    if (!Array.isArray(rulesRaw)) {
        errors.push(`${source}: rules must be a list of rule sets ("${recommended_1.RECOMMENDED}", rule files) or rules`);
    }
    else {
        for (const entry of rulesRaw) {
            if (typeof entry === 'string') {
                rules.push(entry);
            }
            else {
                const rule = (0, rules_1.parseRule)(entry, source, errors);
                if (rule !== null) {
                    rules.push(rule);
                }
            }
        }
    }
    const overrides = [];
    const overridesRaw = raw['overrides'] ?? [];
    if (!Array.isArray(overridesRaw)) {
        errors.push(`${source}: overrides must be a list of { "files": [...], "rules": { "<id>": "<level>" } }`);
    }
    else {
        overridesRaw.forEach((entry, index) => {
            const where = `${source}: overrides[${index}]`;
            if (!(0, util_1.isRecord)(entry)) {
                errors.push(`${where} must be an object`);
                return;
            }
            const files = entry['files'] === undefined ? ['**'] : stringList(entry['files'], `${where}.files`, errors, []);
            if (files.length === 0) {
                errors.push(`${where}.files must name at least one file pattern, or be left out for every file`);
            }
            const levels = {};
            const rulesEntry = entry['rules'];
            if (!(0, util_1.isRecord)(rulesEntry)) {
                errors.push(`${where}.rules must map rule ids to off, warn or block`);
            }
            else {
                for (const id of Object.keys(rulesEntry)) {
                    const level = rulesEntry[id];
                    if (typeof level !== 'string' || !rules_1.LEVELS.includes(level)) {
                        errors.push(`${where}.rules.${id} must be off, warn or block`);
                    }
                    else {
                        levels[id] = level;
                    }
                }
            }
            overrides.push({ files, rules: levels });
        });
    }
    let root = false;
    if (raw['root'] !== undefined) {
        if (typeof raw['root'] === 'boolean') {
            root = raw['root'];
        }
        else {
            errors.push(`${source}: root must be true or false`);
        }
    }
    const config = {
        rules,
        files: stringList(raw['files'], `${source}: files`, errors, exports.DEFAULT_FILES),
        filesGiven: raw['files'] !== undefined,
        ignore: stringList(raw['ignore'], `${source}: ignore`, errors, []),
        overrides,
        root
    };
    return { config, errors };
}
function filesFor(layers) {
    for (let i = layers.length - 1; i >= 0; i--) {
        const layer = layers[i];
        if (layer.config.filesGiven) {
            return layer.config.files;
        }
    }
    return exports.DEFAULT_FILES;
}
function selectsFile(layers) {
    const innermost = layers[layers.length - 1];
    if (innermost === undefined) {
        return false;
    }
    const files = filesFor(layers);
    const chooser = layers.slice().reverse().find((l) => l.config.filesGiven) ?? innermost;
    return (0, glob_1.matchesAny)(chooser.relativePath, files) && !layers.some((l) => (0, glob_1.matchesAny)(l.relativePath, l.config.ignore));
}
function rulesForFile(layers, rules) {
    const levels = new Map();
    for (const layer of layers) {
        for (const override of layer.config.overrides) {
            if ((0, glob_1.matchesAny)(layer.relativePath, override.files)) {
                for (const id of Object.keys(override.rules)) {
                    levels.set(id, override.rules[id]);
                }
            }
        }
    }
    return rules
        .map((rule) => {
        const level = levels.get(rule.id);
        return level === undefined ? rule : { ...rule, level };
    })
        .filter((rule) => rule.level !== 'off');
}
//# sourceMappingURL=config.js.map