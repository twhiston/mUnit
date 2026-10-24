"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
const libmunit_1 = require("libmunit");
outlets = 1;
const p = this.patcher;
const POLL_MS = 250;
let last = '';
let warned = false;
let polls = 0;
function hostFolder() {
    const path = (0, libmunit_1.savedPatchPath)(p.parentpatcher ?? p);
    return path === null ? null : (0, libmunit_1.parentFolder)((0, libmunit_1.toNativePath)(path));
}
hostFolder.local = 1;
function poll() {
    polls++;
    let front;
    try {
        front = max.frontpatcher;
    }
    catch (e) {
        if (!warned) {
            warned = true;
            post(`mUnit.lint: max.frontpatcher is not available (${String(e)}); only @folder is watched\n`);
        }
        return;
    }
    if (front === null || front === undefined) {
        return;
    }
    let file = '';
    try {
        file = String(front.filepath ?? '');
    }
    catch (e) {
        if (!warned) {
            warned = true;
            post(`mUnit.lint: cannot read the front patcher's path (${String(e)}); only @folder is watched\n`);
        }
        return;
    }
    if (file === '' || file === last) {
        return;
    }
    last = file;
    outlet(0, 'front', (0, libmunit_1.toNativePath)(file));
}
poll.local = 1;
const poller = new Task(poll);
poller.interval = POLL_MS;
function start() {
    poller.cancel();
    poller.repeat();
}
function stop() {
    poller.cancel();
}
function status() {
    post(`mUnit.lint helper: ${polls} polls, poller ${poller.running ? 'running' : 'stopped'}, last front patch: ${last === '' ? '(none)' : last}\n`);
}
function home() {
    const folder = hostFolder();
    if (folder === null) {
        error('mUnit.lint: save the patch first; @folder is relative to its folder\n');
        return;
    }
    outlet(0, 'home', folder);
    start();
}
function folder(value) {
    const given = value === undefined ? '' : String(value);
    outlet(0, 'folder', given === '' || given === 'none' ? given : (0, libmunit_1.toNativePath)(given));
}
function output(value) {
    const given = value === undefined ? '' : String(value);
    outlet(0, 'output', given === '' || given === 'none' ? given : (0, libmunit_1.toNativePath)(given));
}
function notifydeleted() {
    poller.cancel();
}
var module = {};
module.exports = {};
//# sourceMappingURL=mUnitLint.js.map