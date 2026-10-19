"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.isRecord = isRecord;
function isRecord(value) {
    return value !== null && typeof value === 'object' && !Array.isArray(value);
}
//# sourceMappingURL=util.js.map