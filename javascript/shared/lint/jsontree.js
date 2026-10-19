"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.JsonTreeError = void 0;
exports.parseJsonTree = parseJsonTree;
exports.entryOf = entryOf;
exports.scalarValue = scalarValue;
class JsonTreeError extends Error {
    offset;
    constructor(message, offset) {
        super(`${message} at offset ${offset}`);
        this.offset = offset;
        this.name = 'JsonTreeError';
    }
}
exports.JsonTreeError = JsonTreeError;
const WHITESPACE = /\s/;
class Parser {
    text;
    pos = 0;
    constructor(text) {
        this.text = text;
    }
    parse() {
        const node = this.value();
        this.skip();
        if (this.pos < this.text.length) {
            throw new JsonTreeError('unexpected text after the JSON value', this.pos);
        }
        return node;
    }
    skip() {
        while (this.pos < this.text.length && WHITESPACE.test(this.text[this.pos])) {
            this.pos++;
        }
    }
    expect(c) {
        if (this.text[this.pos] !== c) {
            throw new JsonTreeError(`expected "${c}"`, this.pos);
        }
        this.pos++;
    }
    value() {
        this.skip();
        const c = this.text[this.pos];
        if (c === '{') {
            return this.object();
        }
        if (c === '[') {
            return this.array();
        }
        if (c === '"') {
            const start = this.pos;
            const value = this.string();
            return { type: 'scalar', start, end: this.pos, value, raw: this.text.slice(start, this.pos) };
        }
        const start = this.pos;
        const m = /^(?:true|false|null|-?\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/.exec(this.text.slice(this.pos));
        if (m === null) {
            throw new JsonTreeError('expected a value', this.pos);
        }
        this.pos += m[0].length;
        return { type: 'scalar', start, end: this.pos, value: JSON.parse(m[0]), raw: m[0] };
    }
    string() {
        const start = this.pos;
        this.expect('"');
        while (this.pos < this.text.length) {
            const c = this.text[this.pos];
            if (c === '\\') {
                this.pos += 2;
            }
            else if (c === '"') {
                this.pos++;
                try {
                    return JSON.parse(this.text.slice(start, this.pos));
                }
                catch {
                    throw new JsonTreeError('bad string', start);
                }
            }
            else {
                this.pos++;
            }
        }
        throw new JsonTreeError('unterminated string', start);
    }
    object() {
        const start = this.pos;
        this.expect('{');
        const entries = [];
        this.skip();
        if (this.text[this.pos] === '}') {
            this.pos++;
            return { type: 'object', start, end: this.pos, entries };
        }
        while (true) {
            this.skip();
            const keyStart = this.pos;
            const key = this.string();
            const keyEnd = this.pos;
            this.skip();
            this.expect(':');
            const value = this.value();
            entries.push({ key, keyStart, keyEnd, value, start: keyStart, end: value.end });
            this.skip();
            if (this.text[this.pos] === ',') {
                this.pos++;
                continue;
            }
            this.expect('}');
            return { type: 'object', start, end: this.pos, entries };
        }
    }
    array() {
        const start = this.pos;
        this.expect('[');
        const items = [];
        this.skip();
        if (this.text[this.pos] === ']') {
            this.pos++;
            return { type: 'array', start, end: this.pos, items };
        }
        while (true) {
            items.push(this.value());
            this.skip();
            if (this.text[this.pos] === ',') {
                this.pos++;
                continue;
            }
            this.expect(']');
            return { type: 'array', start, end: this.pos, items };
        }
    }
}
function parseJsonTree(text) {
    return new Parser(text).parse();
}
function entryOf(node, key) {
    return node.type === 'object' ? node.entries.find((e) => e.key === key) : undefined;
}
function scalarValue(node) {
    const value = node !== undefined && 'key' in node ? node.value : node;
    return value?.type === 'scalar' ? value.value : undefined;
}
//# sourceMappingURL=jsontree.js.map