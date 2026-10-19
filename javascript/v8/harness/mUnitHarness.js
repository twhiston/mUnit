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
const settings = {
    loadFolder: null,
    configFolder: null,
    pattern: '*.maxpat',
    recursive: false,
    sequential: false
};
let runs = 0;
let opened = 0;
let queue = [];
let openRefs = [];
function say(...msg) {
    post('mUnit.harness:', ...msg, '\n');
}
say.local = 1;
function hostPath() {
    const path = (0, libmunit_1.savedPatchPath)(p.parentpatcher ?? p);
    return path === null ? null : (0, libmunit_1.toNativePath)(path);
}
hostPath.local = 1;
function loadFolder(path) {
    settings.loadFolder = String(path);
}
function configFolder(path) {
    settings.configFolder = String(path);
}
function pattern(glob) {
    settings.pattern = String(glob);
}
function recursive(on) {
    settings.recursive = Number(on) !== 0;
}
function sequential(on) {
    settings.sequential = Number(on) !== 0;
}
function anything() {
    error('mUnit.harness: unknown attribute or message', messagename, '\n');
}
function discover(folder, deep) {
    const files = [];
    const subfolders = [];
    const f = new Folder(folder);
    while (!f.end) {
        const name = f.filename;
        if (name !== '' && !name.startsWith('.')) {
            if (f.filetype === 'fold') {
                if (deep) {
                    subfolders.push(`${folder}/${name}`);
                }
            }
            else if ((0, libmunit_1.matchGlob)(name, settings.pattern)) {
                files.push(`${folder}/${name}`);
            }
        }
        f.next();
    }
    f.close();
    files.sort();
    for (const sub of subfolders.sort()) {
        files.push(...discover(sub, true));
    }
    return files;
}
discover.local = 1;
function openPatch(path) {
    const ref = `mUnit.harness.${Date.now()}.${opened++}`;
    openRefs.push(ref);
    max.openfile(ref, path);
}
openPatch.local = 1;
function closeAll() {
    for (const ref of openRefs) {
        max.closefile(ref);
    }
    openRefs = [];
}
closeAll.local = 1;
function openNext() {
    const next = queue.shift();
    if (next === undefined) {
        outlet(0, 'done');
        return;
    }
    openPatch(next);
    outlet(0, 'mark');
}
openNext.local = 1;
function run() {
    const path = hostPath();
    if (path === null) {
        error('mUnit.harness: save the patch first; its folder is where the tests and munit.config.js are found\n');
        return;
    }
    const home = (0, libmunit_1.parentFolder)(path);
    if (runs > 0) {
        closeAll();
        queue = [];
        outlet(0, 'reset');
    }
    runs++;
    outlet(0, 'hydrateConfiguration', (0, libmunit_1.resolvePath)(home, settings.configFolder ?? '.'));
    if (settings.loadFolder === null) {
        return;
    }
    const folder = (0, libmunit_1.resolvePath)(home, settings.loadFolder);
    queue = discover(folder, settings.recursive).filter((f) => f !== path);
    say(`${queue.length} test patch(es) in ${folder}${settings.sequential ? ', one at a time' : ''}`);
    if (settings.sequential) {
        outlet(0, 'hold');
        openNext();
        return;
    }
    for (const f of queue.splice(0)) {
        openPatch(f);
    }
}
function idle() {
    if (!settings.sequential) {
        return;
    }
    closeAll();
    openNext();
}
function finished() {
    queue = [];
    closeAll();
}
function notifydeleted() {
    closeAll();
}
var module = {};
module.exports = {};
//# sourceMappingURL=mUnitHarness.js.map