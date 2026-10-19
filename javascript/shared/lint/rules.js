"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.RULE_KINDS = exports.LEVELS = void 0;
exports.parseRule = parseRule;
exports.parseRules = parseRules;
exports.compileMatch = compileMatch;
exports.matchesBox = matchesBox;
exports.describeMatch = describeMatch;
const util_1 = require("./util");
const model_1 = require("./model");
exports.LEVELS = ['off', 'warn', 'block'];
exports.RULE_KINDS = ['forbid-object', 'forbid-path', 'require-attribute', 'attribute-value', 'max-instances', 'fanout-without-trigger', 'overlapping-boxes', 'naming', 'script'];
function stringList(value) {
    if (typeof value === 'string') {
        return [value];
    }
    if (Array.isArray(value) && value.every((v) => typeof v === 'string')) {
        return value;
    }
    return null;
}
function parseMatch(raw, where, errors, key = 'match') {
    if (!(0, util_1.isRecord)(raw)) {
        errors.push(`${where}: "${key}" must be an object with object, maxclass, args or text`);
        return {};
    }
    const before = errors.length;
    const match = {};
    for (const field of Object.keys(raw)) {
        const value = raw[field];
        if (field === 'object' || field === 'maxclass' || field === 'args') {
            const list = stringList(value);
            if (list === null) {
                errors.push(`${where}: ${key}.${field} must be a string or a list of strings`);
            }
            else {
                match[field] = list;
            }
        }
        else if (field === 'text') {
            if (typeof value !== 'string') {
                errors.push(`${where}: ${key}.text must be a regular expression string`);
            }
            else {
                try {
                    new RegExp(value);
                    match.text = value;
                }
                catch (e) {
                    errors.push(`${where}: ${key}.text: ${e.message}`);
                }
            }
        }
        else {
            errors.push(`${where}: ${key}.${field} is not a matcher; use object, maxclass, args or text`);
        }
    }
    if (Object.keys(match).length === 0 && errors.length === before) {
        errors.push(`${where}: "${key}" needs at least one of object, maxclass, args or text`);
    }
    return match;
}
function parseScope(raw, where, errors) {
    if (raw === undefined) {
        return { namespace: ['box'] };
    }
    if (!(0, util_1.isRecord)(raw)) {
        errors.push(`${where}: "scope" must be an object, e.g. { "namespace": ["dsp.gen"] }`);
        return { namespace: ['box'] };
    }
    const namespace = stringList(raw['namespace']);
    if (namespace === null || namespace.length === 0) {
        errors.push(`${where}: scope.namespace must be a list of namespaces (box, dsp.gen, jit.gen, rnbo)`);
        return { namespace: ['box'] };
    }
    return { namespace };
}
function parseReplaceFix(fix, where, errors) {
    if (fix === undefined) {
        return undefined;
    }
    const replace = (0, util_1.isRecord)(fix) ? fix['replace'] : undefined;
    if (!(0, util_1.isRecord)(replace) || typeof replace['object'] !== 'string') {
        errors.push(`${where}: fix must be { "replace": { "object": "<name>", "args": "keep" | "drop" | [...] } }`);
        return undefined;
    }
    const args = replace['args'] ?? 'keep';
    const list = stringList(args);
    if (args !== 'keep' && args !== 'drop' && (list === null || typeof args === 'string')) {
        errors.push(`${where}: fix.replace.args must be "keep", "drop" or a list of tokens`);
        return undefined;
    }
    return { replace: { object: replace['object'], args: args === 'keep' || args === 'drop' ? args : list } };
}
function requireString(raw, key, where, errors) {
    const value = raw[key];
    if (typeof value !== 'string' || value === '') {
        errors.push(`${where}: "${key}" must be a non-empty string`);
        return '';
    }
    return value;
}
const COMMON_KEYS = new Set(['id', 'kind', 'level', 'message', 'scope', '$schema']);
const KIND_KEYS = {
    'forbid-object': ['match', 'fix'],
    'forbid-path': ['from', 'to', 'unless', 'fix'],
    'require-attribute': ['match', 'attribute', 'fix'],
    'attribute-value': ['match', 'attribute', 'value', 'fix'],
    'max-instances': ['match', 'max', 'per'],
    'fanout-without-trigger': ['allow'],
    'overlapping-boxes': ['allow', 'tolerance'],
    naming: ['target', 'pattern'],
    script: ['module', 'options']
};
function parseRule(raw, source, errors) {
    if (!(0, util_1.isRecord)(raw)) {
        errors.push(`${source}: a rule must be an object`);
        return null;
    }
    const id = typeof raw['id'] === 'string' && raw['id'] !== '' ? raw['id'] : null;
    const where = `${source}: rule ${id ?? '(no id)'}`;
    const before = errors.length;
    if (id === null) {
        errors.push(`${where}: "id" must be a non-empty string`);
    }
    const kind = raw['kind'];
    if (typeof kind !== 'string' || !exports.RULE_KINDS.includes(kind)) {
        errors.push(`${where}: "kind" must be one of ${exports.RULE_KINDS.join(', ')}`);
        return null;
    }
    const level = raw['level'] ?? 'warn';
    if (typeof level !== 'string' || !exports.LEVELS.includes(level)) {
        errors.push(`${where}: "level" must be off, warn or block`);
    }
    const message = raw['message'];
    if (message !== undefined && typeof message !== 'string') {
        errors.push(`${where}: "message" must be a string`);
    }
    for (const key of Object.keys(raw)) {
        if (!COMMON_KEYS.has(key) && !KIND_KEYS[kind].includes(key)) {
            errors.push(`${where}: "${key}" is not a setting of kind ${kind}`);
        }
    }
    const base = {
        id: id ?? '',
        level: level,
        scope: parseScope(raw['scope'], where, errors),
        source
    };
    if (typeof message === 'string') {
        base.message = message;
    }
    let rule = null;
    switch (kind) {
        case 'forbid-object': {
            const r = { ...base, kind: 'forbid-object', match: parseMatch(raw['match'], where, errors) };
            const fix = parseReplaceFix(raw['fix'], where, errors);
            if (fix !== undefined) {
                r.fix = fix;
            }
            rule = r;
            break;
        }
        case 'forbid-path': {
            const r = {
                ...base,
                kind: 'forbid-path',
                from: parseMatch(raw['from'], where, errors, 'from'),
                to: parseMatch(raw['to'], where, errors, 'to')
            };
            if (raw['unless'] !== undefined) {
                r.unless = parseMatch(raw['unless'], where, errors, 'unless');
            }
            const fix = parseReplaceFix(raw['fix'], where, errors);
            if (fix !== undefined) {
                r.fix = fix;
            }
            rule = r;
            break;
        }
        case 'require-attribute': {
            const r = {
                ...base,
                kind: 'require-attribute',
                match: parseMatch(raw['match'], where, errors),
                attribute: requireString(raw, 'attribute', where, errors)
            };
            const fix = raw['fix'];
            if (fix !== undefined) {
                if (!(0, util_1.isRecord)(fix) || !('set' in fix)) {
                    errors.push(`${where}: fix must be { "set": <value> }`);
                }
                else {
                    r.fix = { set: fix['set'] };
                }
            }
            rule = r;
            break;
        }
        case 'attribute-value': {
            if (!('value' in raw)) {
                errors.push(`${where}: "value" is required`);
            }
            const fix = raw['fix'] ?? false;
            if (typeof fix !== 'boolean') {
                errors.push(`${where}: fix must be true or false (set the attribute to the value)`);
            }
            rule = {
                ...base,
                kind: 'attribute-value',
                match: parseMatch(raw['match'], where, errors),
                attribute: requireString(raw, 'attribute', where, errors),
                value: raw['value'],
                fix: fix === true
            };
            break;
        }
        case 'max-instances': {
            const max = raw['max'];
            if (typeof max !== 'number' || !Number.isInteger(max) || max < 0) {
                errors.push(`${where}: "max" must be a whole number`);
            }
            const per = raw['per'] ?? 'file';
            if (per !== 'patcher' && per !== 'file') {
                errors.push(`${where}: "per" must be "patcher" or "file"`);
            }
            rule = {
                ...base,
                kind: 'max-instances',
                match: parseMatch(raw['match'], where, errors),
                max: typeof max === 'number' ? max : 0,
                per: per === 'patcher' ? 'patcher' : 'file'
            };
            break;
        }
        case 'fanout-without-trigger': {
            const allow = raw['allow'] === undefined ? [] : stringList(raw['allow']);
            if (allow === null) {
                errors.push(`${where}: "allow" must be a list of object names`);
            }
            rule = { ...base, kind: 'fanout-without-trigger', allow: allow ?? [] };
            break;
        }
        case 'overlapping-boxes': {
            const allow = raw['allow'] === undefined ? [] : stringList(raw['allow']);
            if (allow === null) {
                errors.push(`${where}: "allow" must be a list of object names`);
            }
            const tolerance = raw['tolerance'] ?? 0;
            if (typeof tolerance !== 'number' || !Number.isFinite(tolerance) || tolerance < 0) {
                errors.push(`${where}: "tolerance" must be a number of pixels, 0 or more`);
            }
            rule = { ...base, kind: 'overlapping-boxes', allow: allow ?? [], tolerance: typeof tolerance === 'number' ? tolerance : 0 };
            break;
        }
        case 'naming': {
            const target = raw['target'];
            if (target !== 'varname' && target !== 'send' && target !== 'receive' && target !== 'send-receive') {
                errors.push(`${where}: "target" must be varname, send, receive or send-receive`);
            }
            const pattern = requireString(raw, 'pattern', where, errors);
            if (pattern !== '') {
                try {
                    new RegExp(pattern);
                }
                catch (e) {
                    errors.push(`${where}: pattern: ${e.message}`);
                }
            }
            rule = { ...base, kind: 'naming', target: target, pattern };
            break;
        }
        case 'script': {
            rule = { ...base, kind: 'script', module: requireString(raw, 'module', where, errors), options: raw['options'] };
            break;
        }
    }
    return errors.length === before ? rule : null;
}
function parseRules(raw, source) {
    const errors = [];
    const rules = [];
    let list;
    if (Array.isArray(raw)) {
        list = raw;
    }
    else if ((0, util_1.isRecord)(raw) && Array.isArray(raw['rules'])) {
        list = raw['rules'];
    }
    else if ((0, util_1.isRecord)(raw)) {
        list = [raw];
    }
    else {
        return { rules, errors: [`${source}: expected a rule object, a list of rules, or { "rules": [...] }`] };
    }
    for (const entry of list) {
        const rule = parseRule(entry, source, errors);
        if (rule !== null) {
            rules.push(rule);
        }
    }
    return { rules, errors };
}
function normaliseName(name) {
    return (0, model_1.normaliseObjectName)((0, model_1.tokenise)(name));
}
function compileMatch(match) {
    const objects = match.object === undefined ? null : new Set(match.object.map(normaliseName));
    const maxclasses = match.maxclass === undefined ? null : new Set(match.maxclass);
    const args = match.args;
    const text = match.text === undefined ? null : new RegExp(match.text);
    return (box) => {
        if (objects !== null && (box.object === null || !objects.has(box.object))) {
            return false;
        }
        if (maxclasses !== null && !maxclasses.has(box.maxclass)) {
            return false;
        }
        if (args !== undefined) {
            for (let i = 0; i < args.length; i++) {
                const pattern = args[i];
                const actual = box.args[i];
                if (actual === undefined || (pattern !== '*' && pattern !== actual)) {
                    return false;
                }
            }
        }
        if (text !== null && (box.text === null || !text.test(box.text))) {
            return false;
        }
        return true;
    };
}
function matchesBox(match, box) {
    return compileMatch(match)(box);
}
function describeMatch(match) {
    if (match.object !== undefined) {
        return match.object.map((o) => `[${o}]`).join(' or ');
    }
    if (match.maxclass !== undefined) {
        return match.maxclass.join(' or ');
    }
    if (match.text !== undefined) {
        return `text matching /${match.text}/`;
    }
    return 'the object';
}
//# sourceMappingURL=rules.js.map