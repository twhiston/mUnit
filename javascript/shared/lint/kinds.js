"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.valueEquals = valueEquals;
exports.runRule = runRule;
const util_1 = require("./util");
const model_1 = require("./model");
const rules_1 = require("./rules");
function shortLabel(box) {
    const text = (box.text ?? '').split('\n')[0]?.trim() ?? '';
    if (text === '') {
        return `[${box.maxclass}]`;
    }
    return text.length > 40 ? `[${text.slice(0, 39)}…]` : `[${text}]`;
}
function message(rule, fallback) {
    return rule.message ?? fallback;
}
function replacementText(box, object, args) {
    const tokens = box.text === null ? [] : (0, model_1.tokenise)(box.text);
    const firstAttribute = tokens.findIndex((t) => t.startsWith('@') && t.length > 1);
    const attributes = firstAttribute === -1 ? [] : tokens.slice(firstAttribute);
    let newArgs;
    if (args === 'keep') {
        newArgs = box.args;
    }
    else if (args === 'drop') {
        newArgs = [];
    }
    else {
        newArgs = args.flatMap((token) => {
            const m = /^\$(\d+)$/.exec(token);
            if (m === null) {
                return [token];
            }
            const original = box.args[Number(m[1]) - 1];
            return original === undefined ? [] : [original];
        });
    }
    return [object, ...newArgs, ...attributes].join(' ');
}
function forbidObject(rule, patchers) {
    const findings = [];
    const matches = (0, rules_1.compileMatch)(rule.match);
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            if (!matches(box)) {
                continue;
            }
            const edits = [];
            if (rule.fix !== undefined) {
                edits.push({ op: 'set-text', patcher: patcher.ids, box: box.id, text: replacementText(box, rule.fix.replace.object, rule.fix.replace.args) });
            }
            findings.push({ patcher, box, message: message(rule, `${(0, model_1.boxLabel)(box)} is not allowed`), edits });
        }
    }
    return findings;
}
function forbidPath(rule, patchers) {
    const findings = [];
    const isFrom = (0, rules_1.compileMatch)(rule.from);
    const isTo = (0, rules_1.compileMatch)(rule.to);
    const isUnless = rule.unless === undefined ? () => false : (0, rules_1.compileMatch)(rule.unless);
    for (const patcher of patchers) {
        for (const source of patcher.boxes) {
            if (!isFrom(source)) {
                continue;
            }
            const route = reach(patcher, source, isTo, isUnless);
            if (route === null) {
                continue;
            }
            const target = route[route.length - 1];
            const cords = route.map(shortLabel).join(' → ');
            const fallback = `${shortLabel(source)} reaches ${shortLabel(target)}${rule.unless === undefined ? '' : ` without passing ${(0, rules_1.describeMatch)(rule.unless)}`}`;
            const edits = rule.fix === undefined
                ? []
                : [{ op: 'set-text', patcher: patcher.ids, box: source.id, text: replacementText(source, rule.fix.replace.object, rule.fix.replace.args) }];
            findings.push({ patcher, box: source, message: `${message(rule, fallback)} (${cords})`, edits });
        }
    }
    return findings;
}
function reach(patcher, source, isTo, isUnless) {
    const cameFrom = new Map([[source, null]]);
    const queue = [source];
    for (let i = 0; i < queue.length; i++) {
        const box = queue[i];
        for (const { destination, disabled } of (0, model_1.connectionsFrom)(patcher, box)) {
            if (disabled || cameFrom.has(destination) || isUnless(destination)) {
                continue;
            }
            cameFrom.set(destination, box);
            if (isTo(destination)) {
                const route = [];
                for (let at = destination; at !== null; at = cameFrom.get(at) ?? null) {
                    route.unshift(at);
                }
                return route;
            }
            queue.push(destination);
        }
    }
    return null;
}
function requireAttribute(rule, patchers) {
    const findings = [];
    const matches = (0, rules_1.compileMatch)(rule.match);
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            if (!matches(box) || box.attributes[rule.attribute] !== undefined) {
                continue;
            }
            const edits = rule.fix === undefined
                ? []
                : [{ op: 'set-attribute', patcher: patcher.ids, box: box.id, name: rule.attribute, value: rule.fix.set }];
            findings.push({ patcher, box, message: message(rule, `${(0, model_1.boxLabel)(box)} needs @${rule.attribute}`), edits });
        }
    }
    return findings;
}
function valueEquals(expected, actual) {
    const toList = (v) => (Array.isArray(v) ? v : [v]).map((x) => {
        if (typeof x === 'boolean') {
            return x ? '1' : '0';
        }
        return String(x);
    });
    const a = toList(expected);
    const b = toList(actual);
    return a.length === b.length && a.every((v, i) => v === b[i]);
}
function attributeValue(rule, patchers) {
    const findings = [];
    const expected = Array.isArray(rule.value) ? rule.value.map(String).join(' ') : String(rule.value);
    const matches = (0, rules_1.compileMatch)(rule.match);
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            if (!matches(box)) {
                continue;
            }
            const actual = box.attributes[rule.attribute];
            if (actual !== undefined && valueEquals(rule.value, actual)) {
                continue;
            }
            const edits = rule.fix
                ? [{ op: 'set-attribute', patcher: patcher.ids, box: box.id, name: rule.attribute, value: rule.value }]
                : [];
            const got = actual === undefined ? 'is not set' : `is ${Array.isArray(actual) ? actual.map(String).join(' ') : String(actual)}`;
            findings.push({ patcher, box, message: message(rule, `${(0, model_1.boxLabel)(box)} must have @${rule.attribute} ${expected}, but it ${got}`), edits });
        }
    }
    return findings;
}
function maxInstances(rule, patchers) {
    const findings = [];
    const report = (matches, where) => {
        if (matches.length <= rule.max) {
            return;
        }
        for (const { patcher, box } of matches.slice(rule.max)) {
            findings.push({
                patcher,
                box,
                message: message(rule, `${(0, rules_1.describeMatch)(rule.match)} appears ${matches.length} times in ${where}, at most ${rule.max} allowed`)
            });
        }
    };
    const all = [];
    const matches = (0, rules_1.compileMatch)(rule.match);
    for (const patcher of patchers) {
        const here = patcher.boxes.filter(matches).map((box) => ({ patcher, box }));
        if (rule.per === 'patcher') {
            report(here, patcher.path.length === 0 ? 'the patcher' : (0, model_1.describeLocation)(patcher, null));
        }
        else {
            all.push(...here);
        }
    }
    if (rule.per === 'file') {
        report(all, 'the file');
    }
    return findings;
}
const SIGNAL_OUTLETS = new Set(['signal', 'multichannelsignal']);
function outletType(box, outlet) {
    const types = box.raw['outlettype'];
    if (!Array.isArray(types)) {
        return null;
    }
    const type = types[outlet];
    return typeof type === 'string' ? type : null;
}
function fanout(rule, patchers) {
    const findings = [];
    const allow = new Set(rule.allow);
    for (const patcher of patchers) {
        const byOutlet = new Map();
        for (const line of patcher.lines) {
            if (line.disabled) {
                continue;
            }
            const key = `${line.source[0]}\u0000${line.source[1]}`;
            let targets = byOutlet.get(key);
            if (targets === undefined) {
                targets = new Set();
                byOutlet.set(key, targets);
            }
            targets.add(`${line.destination[0]}\u0000${line.destination[1]}`);
        }
        for (const [key, targets] of byOutlet) {
            if (targets.size < 2) {
                continue;
            }
            const parts = key.split('\u0000');
            const id = parts[0];
            const outlet = Number(parts[1]);
            const box = patcher.boxes.find((b) => b.id === id);
            if (box === undefined || (box.object !== null && allow.has(box.object))) {
                continue;
            }
            const type = outletType(box, outlet);
            if (type !== null && SIGNAL_OUTLETS.has(type)) {
                continue;
            }
            findings.push({
                patcher,
                box,
                message: message(rule, `outlet ${outlet} of ${(0, model_1.boxLabel)(box)} fans out to ${targets.size} inlets; put a [trigger] between them so the order is explicit`)
            });
        }
    }
    return findings;
}
function overlapLength(a, aSize, b, bSize) {
    return Math.min(a + aSize, b + bSize) - Math.max(a, b);
}
function overlapping(rule, patchers) {
    const findings = [];
    const allow = new Set(rule.allow);
    for (const patcher of patchers) {
        const candidates = patcher.boxes
            .map((box, index) => ({ box, index, rect: box.rect }))
            .filter((c) => c.rect !== null && (c.box.object === null || !allow.has(c.box.object)) && !valueEquals(1, c.box.attributes['background'] ?? 0))
            .sort((a, b) => a.rect[0] - b.rect[0]);
        const pairs = [];
        for (let i = 0; i < candidates.length; i++) {
            const a = candidates[i];
            for (let j = i + 1; j < candidates.length; j++) {
                const b = candidates[j];
                if (b.rect[0] >= a.rect[0] + a.rect[2] - rule.tolerance) {
                    break;
                }
                if (overlapLength(a.rect[0], a.rect[2], b.rect[0], b.rect[2]) > rule.tolerance &&
                    overlapLength(a.rect[1], a.rect[3], b.rect[1], b.rect[3]) > rule.tolerance) {
                    pairs.push(a.index > b.index ? { top: a, under: b } : { top: b, under: a });
                }
            }
        }
        pairs.sort((p, q) => p.top.index - q.top.index || p.under.index - q.under.index);
        for (const { top, under } of pairs) {
            findings.push({
                patcher,
                box: top.box,
                message: message(rule, `${shortLabel(top.box)} overlaps ${shortLabel(under.box)}; move them apart so neither hides the other`)
            });
        }
    }
    return findings;
}
const SENDERS = model_1.SEND_OBJECTS;
const RECEIVERS = model_1.RECEIVE_OBJECTS;
const BOTH = model_1.BOUND_OBJECTS;
function naming(rule, patchers) {
    const findings = [];
    const pattern = new RegExp(rule.pattern);
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            let name = null;
            let what = '';
            if (rule.target === 'varname') {
                name = box.varname;
                what = 'scripting name';
            }
            else if (box.object !== null) {
                const sends = rule.target !== 'receive' && (SENDERS.has(box.object) || BOTH.has(box.object));
                const receives = rule.target !== 'send' && (RECEIVERS.has(box.object) || BOTH.has(box.object));
                if (sends || receives) {
                    name = box.args[0] ?? null;
                    what = `${SENDERS.has(box.object) ? 'send' : RECEIVERS.has(box.object) ? 'receive' : box.object} name`;
                }
            }
            if (name === null || pattern.test(name)) {
                continue;
            }
            findings.push({ patcher, box, message: message(rule, `${what} "${name}" on ${(0, model_1.boxLabel)(box)} does not match /${rule.pattern}/`) });
        }
    }
    return findings;
}
function holdersOf(patchers) {
    const holders = new Map();
    for (const patcher of patchers) {
        for (const box of patcher.boxes) {
            holders.set(box, patcher);
        }
    }
    return holders;
}
function patcherOf(finding, holders, document) {
    return finding.patcher ?? (finding.box === undefined ? undefined : holders.get(finding.box)) ?? document.root;
}
function script(rule, document, patchers, context) {
    if (rule.check === undefined) {
        throw new Error(`rule ${rule.id}: script module ${rule.module} was not loaded`);
    }
    const findings = [];
    const holders = holdersOf(patchers);
    const report = (finding) => {
        if (!(0, util_1.isRecord)(finding) || typeof finding.message !== 'string') {
            throw new Error(`a finding must be an object with a message, got ${JSON.stringify(finding) ?? String(finding)}`);
        }
        findings.push({ patcher: patcherOf(finding, holders, document), box: finding.box ?? null, message: finding.message, edits: finding.edits ?? [] });
    };
    const state = rule.state ?? {};
    rule.state = state;
    const returned = rule.check({
        rule,
        document,
        patchers,
        options: rule.options,
        state,
        report,
        relatedFiles: () => [...(context.relatedFiles ?? [])],
        connectionsFrom: (box, outlet) => {
            const p = holders.get(box);
            return p === undefined ? [] : (0, model_1.connectionsFrom)(p, box, outlet);
        },
        connectionsTo: (box, inlet) => {
            const p = holders.get(box);
            return p === undefined ? [] : (0, model_1.connectionsTo)(p, box, inlet);
        },
        boxesByObject: (name) => (0, model_1.boxesByObject)(patchers, name),
        sends: () => (0, model_1.sends)(patchers),
        receives: () => (0, model_1.receives)(patchers)
    });
    if (returned === undefined || returned === null) {
        return findings;
    }
    if (!Array.isArray(returned)) {
        throw new Error(`check must return a list of findings or nothing, got ${typeof returned}`);
    }
    returned.forEach(report);
    return findings;
}
function runRule(rule, document, patchers, context = {}) {
    switch (rule.kind) {
        case 'forbid-object':
            return forbidObject(rule, patchers);
        case 'forbid-path':
            return forbidPath(rule, patchers);
        case 'require-attribute':
            return requireAttribute(rule, patchers);
        case 'attribute-value':
            return attributeValue(rule, patchers);
        case 'max-instances':
            return maxInstances(rule, patchers);
        case 'fanout-without-trigger':
            return fanout(rule, patchers);
        case 'overlapping-boxes':
            return overlapping(rule, patchers);
        case 'naming':
            return naming(rule, patchers);
        case 'script':
            return script(rule, document, patchers, context);
    }
}
//# sourceMappingURL=kinds.js.map