"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.BUILT_IN_SET_NAMES = exports.BUILT_IN_SETS = exports.TESTS = exports.RECOMMENDED = void 0;
exports.builtInRules = builtInRules;
exports.recommendedRules = recommendedRules;
const rules_1 = require("./rules");
exports.RECOMMENDED = 'mUnit:recommended';
exports.TESTS = 'mUnit:tests';
exports.BUILT_IN_SETS = {
    [exports.RECOMMENDED]: {
        rules: [
            {
                id: 'fanout-without-trigger',
                kind: 'fanout-without-trigger',
                level: 'warn',
                allow: ['loadbang', 'mUnit.loadbang', 'mUnit.harness']
            },
            {
                id: 'overlapping-boxes',
                kind: 'overlapping-boxes',
                level: 'warn',
                allow: ['panel'],
                scope: { namespace: ['*'] }
            }
        ]
    },
    [exports.TESTS]: {
        rules: [
            {
                id: 'one-handler-per-file',
                kind: 'max-instances',
                level: 'block',
                match: { object: 'mUnit.handler' },
                max: 1,
                per: 'file',
                message: 'a test patch may contain one [mUnit.handler]; a second one would collect the same results twice'
            },
            {
                id: 'use-munit-loadbang',
                kind: 'forbid-object',
                level: 'block',
                match: { object: 'loadbang' },
                message: 'a test patch must use [mUnit.loadbang], which waits for the handler to be ready, instead of [loadbang]',
                fix: { replace: { object: 'mUnit.loadbang', args: 'drop' } }
            }
        ]
    }
};
exports.BUILT_IN_SET_NAMES = Object.keys(exports.BUILT_IN_SETS);
function builtInRules(name) {
    const set = exports.BUILT_IN_SETS[name];
    if (set === undefined) {
        return null;
    }
    const { rules, errors } = (0, rules_1.parseRules)(set, name);
    if (errors.length > 0) {
        throw new Error(errors.join('\n'));
    }
    return rules;
}
function recommendedRules() {
    return builtInRules(exports.RECOMMENDED);
}
//# sourceMappingURL=recommended.js.map