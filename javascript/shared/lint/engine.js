"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.DISABLE_COMMENT = void 0;
exports.disabledRules = disabledRules;
exports.toDiagnostic = toDiagnostic;
exports.lintDocument = lintDocument;
const kinds_1 = require("./kinds");
const model_1 = require("./model");
exports.DISABLE_COMMENT = /^\s*munit-lint\s+disable(?:\s+(.*))?\s*$/i;
function disabledRules(patcher) {
    const disabled = new Set();
    for (const box of patcher.boxes) {
        if (box.maxclass !== 'comment' || box.text === null) {
            continue;
        }
        const m = exports.DISABLE_COMMENT.exec(box.text);
        if (m === null) {
            continue;
        }
        const ids = (m[1] ?? '').split(/[\s,]+/).filter((s) => s !== '');
        if (ids.length === 0) {
            disabled.add('*');
        }
        ids.forEach((id) => disabled.add(id));
    }
    return disabled;
}
function toDiagnostic(ruleId, level, file, patcher, box, message, edits = []) {
    return {
        rule: ruleId,
        level,
        file,
        patchers: patcher?.path ?? [],
        location: patcher !== null ? (0, model_1.describeLocation)(patcher, box) : box !== null ? (0, model_1.boxLabel)(box) : '',
        box: box?.id ?? null,
        position: box !== null && box.rect !== null ? [box.rect[0], box.rect[1]] : null,
        message,
        edits
    };
}
function lintDocument(document, rules, options = {}) {
    const diagnostics = [];
    const patchers = [...(0, model_1.walkPatchers)(document.root)];
    const disabled = new Map(patchers.map((p) => [p, disabledRules(p)]));
    for (const rule of rules) {
        if (rule.level === 'off') {
            continue;
        }
        const inScope = patchers.filter((p) => rule.scope.namespace.includes(p.namespace) || rule.scope.namespace.includes('*'));
        if (inScope.length === 0) {
            continue;
        }
        let findings;
        try {
            findings = (0, kinds_1.runRule)(rule, document, inScope, { relatedFiles: options.relatedFiles });
        }
        catch (e) {
            if (options.onRuleError === undefined) {
                throw e;
            }
            options.onRuleError(rule, e);
            continue;
        }
        for (const finding of findings) {
            const off = disabled.get(finding.patcher);
            if (off !== undefined && (off.has('*') || off.has(rule.id))) {
                continue;
            }
            diagnostics.push(toDiagnostic(rule.id, rule.level, document.file, finding.patcher, finding.box, finding.message, finding.edits ?? []));
        }
    }
    return diagnostics;
}
//# sourceMappingURL=engine.js.map