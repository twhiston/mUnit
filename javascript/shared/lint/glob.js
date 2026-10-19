"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.globToRegExp = globToRegExp;
exports.matchesGlob = matchesGlob;
exports.matchesAny = matchesAny;
function escapeRegExp(text) {
    return text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}
const compiled = new Map();
function globToRegExp(glob) {
    let re = compiled.get(glob);
    if (re !== undefined) {
        return re;
    }
    let pattern = glob.replace(/\\/g, '/').replace(/^\.\//, '');
    if (!pattern.includes('/')) {
        pattern = `**/${pattern}`;
    }
    re = new RegExp(`^${translate(pattern)}$`);
    compiled.set(glob, re);
    return re;
}
function translate(pattern) {
    let out = '';
    for (let i = 0; i < pattern.length; i++) {
        const c = pattern[i];
        if (c === '*') {
            if (pattern[i + 1] === '*') {
                i++;
                if (pattern[i + 1] === '/') {
                    i++;
                    out += '(?:.*/)?';
                }
                else {
                    out += '.*';
                }
            }
            else {
                out += '[^/]*';
            }
        }
        else if (c === '?') {
            out += '[^/]';
        }
        else if (c === '{') {
            const end = pattern.indexOf('}', i);
            if (end === -1) {
                out += '\\{';
            }
            else {
                const options = pattern.slice(i + 1, end).split(',').map((o) => translate(o.trim()));
                out += `(?:${options.join('|')})`;
                i = end;
            }
        }
        else {
            out += escapeRegExp(c);
        }
    }
    return out;
}
function matchesGlob(relativePath, glob) {
    return globToRegExp(glob).test(relativePath.replace(/\\/g, '/').replace(/^\.\//, ''));
}
function matchesAny(relativePath, globs) {
    return globs.some((g) => matchesGlob(relativePath, g));
}
//# sourceMappingURL=glob.js.map