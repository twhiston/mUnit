"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __exportStar = (this && this.__exportStar) || function(m, exports) {
    for (var p in m) if (p !== "default" && !Object.prototype.hasOwnProperty.call(exports, p)) __createBinding(exports, m, p);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.runRule = exports.valueEquals = void 0;
__exportStar(require("./model"), exports);
__exportStar(require("./glob"), exports);
__exportStar(require("./diagnostics"), exports);
__exportStar(require("./rules"), exports);
var kinds_1 = require("./kinds");
Object.defineProperty(exports, "valueEquals", { enumerable: true, get: function () { return kinds_1.valueEquals; } });
Object.defineProperty(exports, "runRule", { enumerable: true, get: function () { return kinds_1.runRule; } });
__exportStar(require("./schema"), exports);
__exportStar(require("./engine"), exports);
__exportStar(require("./config"), exports);
__exportStar(require("./recommended"), exports);
__exportStar(require("./report"), exports);
__exportStar(require("./jsontree"), exports);
__exportStar(require("./fix"), exports);
__exportStar(require("./util"), exports);
//# sourceMappingURL=index.js.map