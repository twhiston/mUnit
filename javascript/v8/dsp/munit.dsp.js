"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
const libmunit_1 = require("libmunit");
inlets = 5;
outlets = 5;
const SETTINGS = ['control', 'driver', 'sr', 'sigvs', 'switch'];
const OUTLET = { driver: 1, sr: 2, sigvs: 3, switch: 4 };
const tasks = [];
const controller = new libmunit_1.DspController({
    toAdstatus: (setting, value) => {
        outlet(OUTLET[setting], value);
    },
    toDsp: (name, value) => {
        messnamed('dsp', name, value);
    },
    reply: (message, ...args) => {
        outlet(0, message, ...args);
    },
    schedule: (fn, ms) => {
        const t = new Task(fn);
        tasks.push(t);
        t.schedule(ms);
    }
});
function setting() {
    const s = SETTINGS[inlet];
    return s === undefined || s === 'control' ? null : s;
}
setting.local = 1;
function clear() {
    const s = setting();
    if (s !== null) {
        controller.menu(s, 'clear', []);
    }
}
function append(...item) {
    const s = setting();
    if (s !== null) {
        controller.menu(s, 'append', item);
    }
}
function set(...args) {
    const s = setting();
    if (s !== null) {
        controller.menu(s, 'set', args);
    }
}
function driverValue(v) {
    controller.setValue('driver', v);
}
function srValue(v) {
    controller.setValue('sr', v);
}
function sigvsValue(v) {
    controller.setValue('sigvs', v);
}
function switchValue(v) {
    controller.setValue('switch', v);
}
function dspOn(v) {
    controller.dspState('on', v);
}
function dspSr(v) {
    controller.dspState('sr', v);
}
function dspVs(v) {
    controller.dspState('vs', v);
}
function apply(driver, sr, vs, settleMs) {
    controller.apply(String(driver ?? ''), Number(sr), Number(vs), Number(settleMs));
}
function restore(settleMs) {
    controller.restore(Number(settleMs));
}
function anything() {
    post('munit.dsp: unknown message', messagename, 'on inlet', inlet, '\n');
}
var module = {};
module.exports = {};
//# sourceMappingURL=munit.dsp.js.map