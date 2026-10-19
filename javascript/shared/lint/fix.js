"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.detectStyle = detectStyle;
exports.formatValue = formatValue;
exports.setInlineAttribute = setInlineAttribute;
exports.applyEdits = applyEdits;
exports.inlineAttributes = inlineAttributes;
const jsontree_1 = require("./jsontree");
const model_1 = require("./model");
const FLOAT_KEYS = new Set(['patching_rect', 'presentation_rect', 'rect', 'gridsize', 'midpoints']);
function detectStyle(text) {
    const classic = /"patcher"\s:\s/.test(text);
    const indentMatch = /\n([ \t]+)"/.exec(text);
    const indent = indentMatch?.[1] ?? (classic ? '\t' : '    ');
    const rect = /"patching_rect"\s*:\s*\[(\s*)/.exec(text) ?? /"rect"\s*:\s*\[(\s*)/.exec(text);
    const inlineArrays = rect === null ? true : !rect[1].includes('\n');
    return { classic, indent, colon: classic ? ' : ' : ': ', inlineArrays };
}
function formatNumber(n, float) {
    return float && Number.isInteger(n) ? `${n}.0` : String(n);
}
function formatValue(value, style, depth, key = '') {
    const pad = (d) => style.indent.repeat(d);
    if (value === null || typeof value === 'boolean') {
        return String(value);
    }
    if (typeof value === 'number') {
        return formatNumber(value, FLOAT_KEYS.has(key));
    }
    if (typeof value === 'string') {
        return JSON.stringify(value);
    }
    if (Array.isArray(value)) {
        if (value.length === 0) {
            return '[  ]';
        }
        const scalars = value.every((v) => v === null || typeof v !== 'object');
        if (scalars && style.inlineArrays) {
            return `[ ${value.map((v) => formatValue(v, style, depth, key)).join(', ')} ]`;
        }
        if (style.classic && !scalars) {
            return `[ ${value.map((v) => formatValue(v, style, depth + 1, key)).join('\n, ')} ]`;
        }
        const items = value.map((v) => `${pad(depth + 1)}${formatValue(v, style, depth + 1, key)}`);
        return `[\n${items.join(',\n')}\n${pad(depth)}]`;
    }
    const entries = Object.entries(value);
    if (entries.length === 0) {
        return '{  }';
    }
    const body = entries.map(([k, v]) => `${pad(depth + 1)}${JSON.stringify(k)}${style.colon}${formatValue(v, style, depth + 1, k)}`);
    if (style.classic) {
        return `${pad(depth)}{\n${body.join(',\n')}\n${pad(depth)}}\n`;
    }
    return `{\n${body.join(',\n')}\n${pad(depth)}}`;
}
function isObject(node) {
    return node?.type === 'object';
}
function isArray(node) {
    return node?.type === 'array';
}
function lineIndent(text, offset) {
    const lineStart = text.lastIndexOf('\n', offset - 1) + 1;
    const m = /^[ \t]*/.exec(text.slice(lineStart, offset));
    return m?.[0] ?? '';
}
function locate(root, patcherIds, boxId) {
    let patcher = (0, jsontree_1.entryOf)(root, 'patcher')?.value;
    if (!isObject(patcher)) {
        return 'no patcher at the top level';
    }
    for (const id of patcherIds) {
        const boxes = (0, jsontree_1.entryOf)(patcher, 'boxes')?.value;
        const item = isArray(boxes) ? boxes.items.find((i) => (0, jsontree_1.scalarValue)((0, jsontree_1.entryOf)((0, jsontree_1.entryOf)(i, 'box')?.value ?? i, 'id')) === id) : undefined;
        const nested = item === undefined ? undefined : (0, jsontree_1.entryOf)((0, jsontree_1.entryOf)(item, 'box')?.value ?? item, 'patcher')?.value;
        if (!isObject(nested)) {
            return `no subpatcher ${id} in ${patcherIds.join(' > ') || 'the root patcher'}`;
        }
        patcher = nested;
    }
    const boxes = (0, jsontree_1.entryOf)(patcher, 'boxes')?.value;
    if (!isArray(boxes)) {
        return 'the patcher has no boxes array';
    }
    if (boxId === null) {
        return { patcher, boxes, box: null, boxItem: null };
    }
    for (const item of boxes.items) {
        const box = (0, jsontree_1.entryOf)(item, 'box')?.value;
        if (isObject(box) && (0, jsontree_1.scalarValue)((0, jsontree_1.entryOf)(box, 'id')) === boxId) {
            return { patcher, boxes, box, boxItem: item };
        }
    }
    return `no box ${boxId} in ${patcherIds.join(' > ') || 'the root patcher'}`;
}
function splice(text, start, end, replacement) {
    return text.slice(0, start) + replacement + text.slice(end);
}
function attributeTokens(value) {
    const list = Array.isArray(value) ? value : [value];
    return list.map((v) => {
        if (typeof v === 'boolean') {
            return v ? '1' : '0';
        }
        const s = String(v);
        return /\s/.test(s) ? JSON.stringify(s) : s;
    });
}
function setInlineAttribute(text, name, value) {
    const tokens = (0, model_1.tokenise)(text);
    const out = [];
    let i = 0;
    let done = false;
    while (i < tokens.length) {
        const token = tokens[i];
        if (token === `@${name}`) {
            out.push(token, ...attributeTokens(value));
            i++;
            while (i < tokens.length && !tokens[i].startsWith('@')) {
                i++;
            }
            done = true;
        }
        else {
            out.push(token);
            i++;
        }
    }
    if (!done) {
        out.push(`@${name}`, ...attributeTokens(value));
    }
    return out.join(' ');
}
function insertEntry(text, object, key, value, style) {
    const last = object.entries.at(-1);
    const formatted = formatValue(value, style, 0, key);
    if (last === undefined) {
        const indent = lineIndent(text, object.start);
        return splice(text, object.start + 1, object.end - 1, `\n${indent}${style.indent}${JSON.stringify(key)}${style.colon}${formatted}\n${indent}`);
    }
    const indent = lineIndent(text, last.keyStart);
    return splice(text, last.end, last.end, `,\n${indent}${JSON.stringify(key)}${style.colon}${formatted}`);
}
function applyOne(text, edit) {
    const root = (0, jsontree_1.parseJsonTree)(text);
    const style = detectStyle(text);
    const located = locate(root, edit.patcher, edit.op === 'insert-box' ? null : edit.box);
    if (typeof located === 'string') {
        return { problem: located };
    }
    switch (edit.op) {
        case 'set-text': {
            const box = located.box;
            const entry = (0, jsontree_1.entryOf)(box, 'text');
            if (entry === undefined) {
                return { problem: `box ${edit.box} has no text to set` };
            }
            return splice(text, entry.value.start, entry.value.end, JSON.stringify(edit.text));
        }
        case 'set-attribute': {
            const box = located.box;
            const textEntry = (0, jsontree_1.entryOf)(box, 'text');
            const maxclass = (0, jsontree_1.scalarValue)((0, jsontree_1.entryOf)(box, 'maxclass'));
            if (textEntry !== undefined && maxclass === 'newobj' && textEntry.value.type === 'scalar' && typeof textEntry.value.value === 'string') {
                const updated = setInlineAttribute(textEntry.value.value, edit.name, edit.value);
                return splice(text, textEntry.value.start, textEntry.value.end, JSON.stringify(updated));
            }
            const existing = (0, jsontree_1.entryOf)(box, edit.name);
            if (existing !== undefined) {
                return splice(text, existing.value.start, existing.value.end, formatValue(edit.value, style, lineIndent(text, existing.keyStart).length / Math.max(style.indent.length, 1), edit.name));
            }
            return insertEntry(text, box, edit.name, edit.value, style);
        }
        case 'remove-box': {
            const boxes = located.boxes;
            const index = boxes.items.indexOf(located.boxItem);
            const ranges = [];
            const item = boxes.items[index];
            const prev = boxes.items[index - 1];
            const next = boxes.items[index + 1];
            if (prev !== undefined) {
                ranges.push([prev.end, item.end]);
            }
            else if (next !== undefined) {
                ranges.push([item.start, next.start]);
            }
            else {
                ranges.push([boxes.start + 1, boxes.end - 1]);
            }
            const lines = (0, jsontree_1.entryOf)(located.patcher, 'lines')?.value;
            if (isArray(lines)) {
                const endpoints = (line) => {
                    const patchline = (0, jsontree_1.entryOf)(line, 'patchline')?.value ?? line;
                    return ['source', 'destination'].map((k) => {
                        const ends = (0, jsontree_1.entryOf)(patchline, k)?.value;
                        return isArray(ends) ? String((0, jsontree_1.scalarValue)(ends.items[0]) ?? '') : '';
                    });
                };
                const keep = lines.items.filter((l) => !endpoints(l).includes(edit.box));
                if (keep.length !== lines.items.length) {
                    if (keep.length === 0) {
                        ranges.push([lines.start + 1, lines.end - 1]);
                    }
                    else {
                        let previous = null;
                        lines.items.forEach((l, i) => {
                            if (keep.includes(l)) {
                                previous = l;
                                return;
                            }
                            const following = lines.items[i + 1];
                            if (previous !== null) {
                                ranges.push([previous.end, l.end]);
                            }
                            else if (following !== undefined) {
                                ranges.push([l.start, following.start]);
                            }
                        });
                    }
                }
            }
            ranges.sort((a, b) => a[0] - b[0]);
            const merged = [];
            for (const range of ranges) {
                const last = merged.at(-1);
                if (last !== undefined && range[0] <= last[1]) {
                    last[1] = Math.max(last[1], range[1]);
                }
                else {
                    merged.push([range[0], range[1]]);
                }
            }
            let out = text;
            for (const [start, end] of merged.reverse()) {
                out = splice(out, start, end, '');
            }
            return out;
        }
        case 'insert-box': {
            const boxes = located.boxes;
            const box = { ...edit.box };
            if (typeof box['id'] !== 'string') {
                const used = new Set(boxes.items.map((i) => (0, jsontree_1.scalarValue)((0, jsontree_1.entryOf)((0, jsontree_1.entryOf)(i, 'box')?.value ?? i, 'id'))));
                let n = boxes.items.length + 1;
                while (used.has(`obj-${n}`)) {
                    n++;
                }
                box['id'] = `obj-${n}`;
            }
            box['patching_rect'] ??= [10.0, 10.0, 100.0, 22.0];
            const last = boxes.items.at(-1);
            const unit = Math.max(style.indent.length, 1);
            const firstEntry = last?.type === 'object' ? last.entries[0] : undefined;
            const depth = firstEntry === undefined
                ? lineIndent(text, boxes.start).length / unit + 1
                : Math.max(lineIndent(text, firstEntry.keyStart).length / unit - 1, 0);
            const formatted = formatValue({ box }, style, depth).trim();
            if (last === undefined) {
                const indent = style.indent.repeat(depth);
                return splice(text, boxes.start + 1, boxes.end - 1, `\n${indent}${formatted}\n${style.indent.repeat(Math.max(depth - 1, 0))}`);
            }
            const separator = boxes.items.length > 1
                ? text.slice(boxes.items[0].end, boxes.items[1].start)
                : (style.classic ? `\n, ${style.indent.repeat(depth)}` : `,\n${style.indent.repeat(depth)}`);
            return splice(text, last.end, last.end, `${separator}${formatted}`);
        }
    }
}
function applyEdits(text, edits) {
    const applied = [];
    const problems = [];
    let out = text;
    for (const edit of edits) {
        let result;
        try {
            result = applyOne(out, edit);
        }
        catch (e) {
            result = { problem: e.message };
        }
        if (typeof result === 'string') {
            out = result;
            applied.push(edit);
        }
        else {
            problems.push(`${edit.op} on ${edit.op === 'insert-box' ? 'the patcher' : `box ${edit.box}`}${edit.patcher.length > 0 ? ` in ${edit.patcher.join(' > ')}` : ''}: ${result.problem}`);
        }
    }
    return { text: out, applied, problems };
}
function inlineAttributes(text) {
    return (0, model_1.splitArguments)((0, model_1.tokenise)(text).slice(1)).attributes;
}
//# sourceMappingURL=fix.js.map