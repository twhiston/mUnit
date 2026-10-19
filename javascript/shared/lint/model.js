"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.BOUND_OBJECTS = exports.RECEIVE_OBJECTS = exports.SEND_OBJECTS = exports.PatcherParseError = void 0;
exports.normaliseObjectName = normaliseObjectName;
exports.objectNameOf = objectNameOf;
exports.tokenise = tokenise;
exports.splitArguments = splitArguments;
exports.parsePatcher = parsePatcher;
exports.parseDocument = parseDocument;
exports.documentFromJson = documentFromJson;
exports.walkBoxes = walkBoxes;
exports.walkPatchers = walkPatchers;
exports.findBox = findBox;
exports.connectionsFrom = connectionsFrom;
exports.connectionsTo = connectionsTo;
exports.boxesByObject = boxesByObject;
exports.sends = sends;
exports.receives = receives;
exports.boxLabel = boxLabel;
exports.describeLocation = describeLocation;
exports.referencedFiles = referencedFiles;
const util_1 = require("./util");
class PatcherParseError extends Error {
    constructor(message) {
        super(message);
        this.name = 'PatcherParseError';
    }
}
exports.PatcherParseError = PatcherParseError;
const ALIASES = {
    t: 'trigger',
    b: 'bangbang',
    s: 'send',
    r: 'receive',
    's~': 'send~',
    'r~': 'receive~',
    v: 'value',
    del: 'delay',
    sel: 'select',
    i: 'int',
    f: 'float',
    'mc.s~': 'mc.send~',
    'mc.r~': 'mc.receive~'
};
const DOTTED_MODES = new Set(['zl', 'mc']);
function normaliseObjectName(tokens) {
    return objectNameOf(tokens).name;
}
function objectNameOf(tokens) {
    const first = tokens[0];
    if (first === undefined || first === '') {
        return { name: null, consumed: first === undefined ? 0 : 1 };
    }
    const alias = ALIASES[first];
    if (alias !== undefined) {
        return { name: alias, consumed: 1 };
    }
    const second = tokens[1];
    if (DOTTED_MODES.has(first) && second !== undefined && !second.startsWith('@') && /^[A-Za-z][\w~]*$/.test(second)) {
        return { name: `${first}.${second}`, consumed: 2 };
    }
    return { name: first, consumed: 1 };
}
function tokenise(text) {
    const tokens = [];
    let current = '';
    let has = false;
    let quoted = false;
    for (let i = 0; i < text.length; i++) {
        const c = text[i];
        if (c === '\\' && i + 1 < text.length) {
            current += text[++i];
            has = true;
        }
        else if (c === '"') {
            quoted = !quoted;
            current += c;
            has = true;
        }
        else if (!quoted && /\s/.test(c)) {
            if (has) {
                tokens.push(current);
                current = '';
                has = false;
            }
        }
        else {
            current += c;
            has = true;
        }
    }
    if (has) {
        tokens.push(current);
    }
    return tokens;
}
function splitArguments(tokens) {
    const args = [];
    const attributes = {};
    let current = null;
    for (const token of tokens) {
        if (token.startsWith('@') && token.length > 1) {
            current = [];
            attributes[token.slice(1)] = current;
        }
        else if (current !== null) {
            current.push(token);
        }
        else {
            args.push(token);
        }
    }
    return { args, attributes };
}
const STRUCTURAL_KEYS = new Set([
    'id', 'maxclass', 'text', 'numinlets', 'numoutlets', 'outlettype', 'patching_rect', 'presentation_rect',
    'presentation', 'patcher', 'varname', 'saved_object_attributes', 'saved_attribute_attributes', 'textfile',
    'hidden', 'style', 'fontname', 'fontsize', 'fontface', 'linecount', 'comment', 'index', 'args', 'name', 'filename'
]);
function unwrapOne(value) {
    return Array.isArray(value) && value.length === 1 ? value[0] : value;
}
function parseBox(raw, path, ids, index) {
    const maxclass = typeof raw['maxclass'] === 'string' ? raw['maxclass'] : 'unknown';
    const text = typeof raw['text'] === 'string' ? raw['text'] : null;
    const id = typeof raw['id'] === 'string' ? raw['id'] : `box-${index}`;
    const tokens = text === null ? [] : tokenise(text);
    const isObject = maxclass === 'newobj';
    const named = isObject ? objectNameOf(tokens) : { name: maxclass, consumed: 0 };
    const object = named.name;
    const split = isObject ? splitArguments(tokens.slice(named.consumed)) : { args: [], attributes: {} };
    const attributes = {};
    for (const key of Object.keys(raw)) {
        if (!STRUCTURAL_KEYS.has(key)) {
            attributes[key] = raw[key];
        }
    }
    for (const key of ['saved_attribute_attributes', 'saved_object_attributes']) {
        const saved = raw[key];
        if ((0, util_1.isRecord)(saved)) {
            for (const name of Object.keys(saved)) {
                attributes[name] = saved[name];
            }
        }
    }
    for (const name of Object.keys(split.attributes)) {
        const values = split.attributes[name];
        attributes[name] = values.length === 1 ? values[0] : values;
    }
    const rectRaw = raw['patching_rect'];
    const rect = Array.isArray(rectRaw) && rectRaw.length === 4 && rectRaw.every((n) => typeof n === 'number')
        ? rectRaw
        : null;
    let patcher = null;
    const nested = raw['patcher'];
    if ((0, util_1.isRecord)(nested)) {
        const label = boxLabel({ text, maxclass });
        patcher = parsePatcher(nested, [...path, label], [...ids, id]);
    }
    return {
        id,
        maxclass,
        text,
        object,
        args: split.args,
        attributes,
        varname: typeof raw['varname'] === 'string' ? raw['varname'] : null,
        rect,
        patcher,
        raw
    };
}
function parseEndpoint(value) {
    if (!Array.isArray(value) || value.length < 2) {
        return null;
    }
    const [id, index] = value;
    if (typeof id !== 'string' || typeof index !== 'number') {
        return null;
    }
    return [id, index];
}
function parseLine(raw) {
    const source = parseEndpoint(raw['source']);
    const destination = parseEndpoint(raw['destination']);
    if (source === null || destination === null) {
        return null;
    }
    return { source, destination, disabled: Number(unwrapOne(raw['disabled']) ?? 0) !== 0, raw };
}
function parsePatcher(raw, path = [], ids = []) {
    const namespace = typeof raw['classnamespace'] === 'string' ? raw['classnamespace'] : 'box';
    const boxes = [];
    const boxesRaw = raw['boxes'];
    if (Array.isArray(boxesRaw)) {
        boxesRaw.forEach((entry, index) => {
            const box = (0, util_1.isRecord)(entry) ? entry['box'] : undefined;
            if ((0, util_1.isRecord)(box)) {
                boxes.push(parseBox(box, path, ids, index));
            }
        });
    }
    const lines = [];
    const linesRaw = raw['lines'];
    if (Array.isArray(linesRaw)) {
        for (const entry of linesRaw) {
            const line = (0, util_1.isRecord)(entry) ? entry['patchline'] : undefined;
            if ((0, util_1.isRecord)(line)) {
                const parsed = parseLine(line);
                if (parsed !== null) {
                    lines.push(parsed);
                }
            }
        }
    }
    return { namespace, path, ids, boxes, lines, raw };
}
function parseDocument(file, json) {
    let raw;
    try {
        raw = JSON.parse(json);
    }
    catch (e) {
        throw new PatcherParseError(`${file}: not valid JSON: ${e.message}`);
    }
    return documentFromJson(file, raw);
}
function documentFromJson(file, raw) {
    if (!(0, util_1.isRecord)(raw) || !(0, util_1.isRecord)(raw['patcher'])) {
        throw new PatcherParseError(`${file}: no "patcher" object at the top level, is this a Max patcher?`);
    }
    return { file, root: parsePatcher(raw['patcher']), raw };
}
function* walkBoxes(patcher) {
    for (const box of patcher.boxes) {
        yield { patcher, box };
        if (box.patcher !== null) {
            yield* walkBoxes(box.patcher);
        }
    }
}
function* walkPatchers(patcher) {
    yield patcher;
    for (const box of patcher.boxes) {
        if (box.patcher !== null) {
            yield* walkPatchers(box.patcher);
        }
    }
}
function findBox(patcher, id) {
    return patcher.boxes.find((b) => b.id === id);
}
const connectionCache = new WeakMap();
function connections(patcher) {
    const cached = connectionCache.get(patcher);
    if (cached !== undefined) {
        return cached;
    }
    const byId = new Map(patcher.boxes.map((b) => [b.id, b]));
    const out = [];
    for (const line of patcher.lines) {
        const source = byId.get(line.source[0]);
        const destination = byId.get(line.destination[0]);
        if (source !== undefined && destination !== undefined) {
            out.push({ line, source, outlet: line.source[1], destination, inlet: line.destination[1], disabled: line.disabled });
        }
    }
    connectionCache.set(patcher, out);
    return out;
}
function connectionsFrom(patcher, box, outlet) {
    return connections(patcher).filter((c) => c.source === box && (outlet === undefined || c.outlet === outlet));
}
function connectionsTo(patcher, box, inlet) {
    return connections(patcher).filter((c) => c.destination === box && (inlet === undefined || c.inlet === inlet));
}
function boxesByObject(patchers, name) {
    const wanted = normaliseObjectName(tokenise(name));
    const out = [];
    if (wanted === null) {
        return out;
    }
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            if (box.object === wanted) {
                out.push({ patcher, box });
            }
        }
    }
    return out;
}
exports.SEND_OBJECTS = new Set(['send', 'send~', 'mc.send~', 'forward']);
exports.RECEIVE_OBJECTS = new Set(['receive', 'receive~', 'mc.receive~']);
exports.BOUND_OBJECTS = new Set(['value', 'pv', 'pvar', 'pattr']);
function namedBoxes(patchers, roles) {
    const out = [];
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            if (box.object === null) {
                continue;
            }
            const role = exports.SEND_OBJECTS.has(box.object) ? 'send' : exports.RECEIVE_OBJECTS.has(box.object) ? 'receive' : exports.BOUND_OBJECTS.has(box.object) ? 'both' : null;
            const name = box.args[0];
            if (role === null || name === undefined || !roles.includes(role)) {
                continue;
            }
            out.push({ patcher, box, name, role });
        }
    }
    return out;
}
function sends(patchers) {
    return namedBoxes(patchers, ['send', 'both']);
}
function receives(patchers) {
    return namedBoxes(patchers, ['receive', 'both']);
}
function boxLabel(box) {
    return box.text !== null && box.text !== '' ? `[${box.text}]` : `[${box.maxclass}]`;
}
function describeLocation(patcher, box) {
    const parts = [...patcher.path];
    if (box !== null) {
        parts.push(boxLabel(box));
    }
    return parts.join(' > ');
}
function attributeString(box, name) {
    const value = box.attributes[name];
    if (value === undefined || value === null) {
        return null;
    }
    const one = unwrapOne(value);
    return typeof one === 'string' || typeof one === 'number' ? String(one) : null;
}
function referencedFiles(document) {
    const names = new Set();
    for (const { box } of walkBoxes(document.root)) {
        if (box.patcher !== null) {
            continue;
        }
        const withExtension = (name, extension) => {
            if (name !== null && name !== '') {
                names.add(name.endsWith(extension) ? name : `${name}${extension}`);
            }
        };
        switch (box.object) {
            case 'gen~':
            case 'gen':
                withExtension(attributeString(box, 'gen') ?? box.args[0] ?? null, '.gendsp');
                break;
            case 'jit.gen':
            case 'jit.pix':
            case 'jit.gl.pix':
                withExtension(attributeString(box, 'gen') ?? box.args[0] ?? null, '.genjit');
                break;
            case 'rnbo~': {
                const file = attributeString(box, 'file') ?? box.args.find((a) => a.endsWith('.rnbopat')) ?? null;
                withExtension(file, '.rnbopat');
                break;
            }
            case 'bpatcher':
                withExtension(attributeString(box, 'name') ?? (typeof box.raw['name'] === 'string' ? box.raw['name'] : null), '.maxpat');
                break;
            default:
                break;
        }
    }
    return [...names];
}
//# sourceMappingURL=model.js.map