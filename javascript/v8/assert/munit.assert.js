"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
const libmunit_1 = require("libmunit");
inlets = 1 + libmunit_1.MAX_DATA_INLETS;
outlets = 2;
const p = this.patcher;
let timer = null;
let captureBuffer = null;
let referenceBuffer = null;
const GREY = [0.46, 0.46, 0.46, 1];
const GREEN = [46, 204, 113, 1];
const RED = [242, 38, 19, 1];
const YELLOW = [241, 196, 15, 1];
function log(level, ...msg) {
    const s = engine.settings;
    if (level === libmunit_1.LogLevel.ERROR) {
        error('munit', s.suite, s.uuid, s.name, ':', ...msg, '\n');
    }
    else {
        post('munit', s.suite, s.uuid, s.name, ':', ...msg, '\n');
    }
}
log.local = 1;
function dictValue(name) {
    try {
        const parsed = JSON.parse(new Dict(name).stringify());
        return parsed !== null && typeof parsed === 'object' ? parsed : null;
    }
    catch {
        return null;
    }
}
dictValue.local = 1;
function patchFolder() {
    const file = (0, libmunit_1.savedPatchPath)(p.parentpatcher);
    return file === null ? null : (0, libmunit_1.parentFolder)((0, libmunit_1.toNativePath)(file));
}
patchFolder.local = 1;
const READ_BYTES = 65536;
function readBytes(path) {
    const f = new File(path, 'read');
    if (!f.isopen) {
        return null;
    }
    try {
        const out = new Uint8Array(f.eof);
        let at = 0;
        while (f.position < f.eof) {
            const chunk = f.readbytes(Math.min(READ_BYTES, f.eof - f.position));
            if (chunk.length === 0) {
                break;
            }
            out.set(chunk, at);
            at += chunk.length;
        }
        return at === f.eof ? out : out.slice(0, at);
    }
    finally {
        f.close();
    }
}
readBytes.local = 1;
const READ_CHUNK = 4096;
function readText(path) {
    const f = new File(path, 'read');
    if (!f.isopen) {
        return null;
    }
    let text = '';
    try {
        while (f.position < f.eof) {
            const chunk = f.readstring(READ_CHUNK);
            if (chunk.length === 0) {
                break;
            }
            text += chunk;
        }
    }
    finally {
        f.close();
    }
    return text;
}
readText.local = 1;
function fileExists(path) {
    const f = new File(path, 'read');
    const open = f.isopen;
    if (open) {
        f.close();
    }
    return open;
}
fileExists.local = 1;
function findReference(path) {
    if (fileExists(path)) {
        return path;
    }
    const name = path.replace(/^.*[\\/]/, '');
    const f = new File(name, 'read');
    if (!f.isopen) {
        return null;
    }
    const folder = String(f.foldername).replace(/[\\/:]+$/, '');
    const found = `${folder}/${String(f.filename)}`;
    f.close();
    return (0, libmunit_1.toNativePath)(found);
}
findReference.local = 1;
function readMatrix(name) {
    const m = new JitterMatrix(name);
    const value = (0, libmunit_1.matrixFromJitter)(m);
    if (value === null) {
        log(libmunit_1.LogLevel.ERROR, `matrix ${name} has a shape or cell type this assert can't read: ${String(m.dim)} ${String(m.planecount)} ${String(m.type)}`);
    }
    return value;
}
readMatrix.local = 1;
function writeMatrix(path, matrix) {
    const m = new JitterMatrix(matrix.planes, matrix.type, ...matrix.dim);
    try {
        m.copyarraytomatrix((0, libmunit_1.matrixToTyped)(matrix));
        const extension = /\.(\w+)$/.exec(path)?.[1]?.toLowerCase() ?? '';
        if (['png', 'jpg', 'jpeg', 'tif', 'tiff', 'bmp'].includes(extension)) {
            m.exportimage(path, extension === 'jpg' ? 'jpeg' : extension, 0);
        }
        else {
            m.write(path);
        }
        return fileExists(path);
    }
    finally {
        m.freepeer();
    }
}
writeMatrix.local = 1;
const io = {
    patchFolder,
    readText,
    takeReferences: () => {
        const takeReferences = dictValue(libmunit_1.RUN_CONTEXT_DICT)?.['takeReferences'];
        return takeReferences === 1 || takeReferences === true;
    },
    readSignal: (path) => {
        const file = findReference(path);
        if (referenceBuffer === null || file === null) {
            return null;
        }
        const b = new Buffer(referenceBuffer);
        b.send('replace', file);
        const frames = b.framecount();
        const channels = [];
        for (let c = 1; c <= b.channelcount(); c++) {
            channels.push(b.peek(c, 0, frames));
        }
        return channels;
    },
    writeSignal: (path) => {
        if (captureBuffer === null) {
            return false;
        }
        const b = new Buffer(captureBuffer);
        b.send('samptype', 'float32');
        b.send('writewave', path);
        return fileExists(path);
    },
    artifactsDir: () => {
        const dir = dictValue(libmunit_1.RUN_CONTEXT_DICT)?.['artifactsDir'];
        return typeof dir === 'string' && dir !== '' ? dir : null;
    },
    readMatrix: (path) => matrixCache.get(path) ?? loadMatrixFile(path),
    writeMatrix
};
const matrixCache = new Map();
function loadMatrixFile(path) {
    const file = findReference(path);
    const bytes = file === null ? null : readBytes(file);
    if (bytes === null) {
        return null;
    }
    try {
        return (0, libmunit_1.parseJxf)(bytes);
    }
    catch (e) {
        log(libmunit_1.LogLevel.ERROR, `can't read the reference ${path}: ${String(e)}`);
        return null;
    }
}
loadMatrixFile.local = 1;
const engine = new libmunit_1.AssertEngine({
    send: (message, json) => {
        outlet(0, message, json);
    },
    log,
    schedule: (ms) => {
        if (timer === null) {
            timer = new Task(() => {
                engine.onTimeout();
            });
        }
        timer.schedule(ms);
    },
    cancel: () => {
        timer?.cancel();
    },
    now: () => Date.now(),
    finished: (state) => {
        p.box.setboxattr('color', state === libmunit_1.State.Success ? GREEN : state === libmunit_1.State.Skipped ? YELLOW : RED);
    },
    io
});
function symbolValue(name, args) {
    return args.length === 0 ? name : [name, ...args];
}
function dataIn(value) {
    if (inlet === 0) {
        log(libmunit_1.LogLevel.WARN, 'data sent to the control inlet is ignored:', value);
        return;
    }
    engine.input(inlet, value);
}
function uuid(id, ...rest) {
    if (inlet !== 0) {
        dataIn(symbolValue('uuid', [id, ...rest]));
        return;
    }
    engine.setUuid(id);
}
function setAttr(attr, ...data) {
    if (inlet !== 0) {
        dataIn(symbolValue('setAttr', [attr, ...data]));
        return;
    }
    engine.setAttr(attr, data.length === 1 ? data[0] : data);
}
function processExpression(expr, ...rest) {
    if (inlet !== 0) {
        dataIn(symbolValue('processExpression', [expr, ...rest]));
        return;
    }
    p.box.setboxattr('color', GREY);
    const reference = engine.settings.reference;
    if (reference !== null && reference !== '') {
        const folder = patchFolder();
        const file = (0, libmunit_1.isAbsolutePath)(reference) || folder === null
            ? reference
            : (0, libmunit_1.resolvePath)(`${folder}/${libmunit_1.REFERENCE_FOLDER}`, /\.\w+$/.test(reference) ? reference : `${reference}.wav`);
        engine.settings.reference = file;
        const s = engine.settings;
        const name = () => s.name ?? s.uuid ?? 'capture';
        const isMatrix = /\.jxf$/i.test(file);
        if (isMatrix && !io.takeReferences()) {
            const loaded = loadMatrixFile(file);
            if (loaded !== null) {
                matrixCache.set(file, loaded);
                log(libmunit_1.LogLevel.INFO, `reference ${file}: ${loaded.dim.join('x')}, ${loaded.planes} plane(s), ${loaded.type}`);
            }
        }
        const evaluator = isMatrix
            ? (0, libmunit_1.matrixReferenceEvaluator)({ file, maxDiff: s.maxDiff, maxFraction: s.maxFraction }, io, name)
            : (0, libmunit_1.signalReferenceEvaluator)({ file, channels: s.dataInlets, snrDb: s.snr, maxLatency: s.maxLatency, exact: s.exact }, io, name);
        removeUnusedInlets(engine.registerWith(`reference ${reference}`, evaluator, p.parentpatcher.name));
        return;
    }
    const dataInlets = engine.register(String(expr), (path) => require(path), p.parentpatcher.name);
    removeUnusedInlets(dataInlets);
}
function captureBufferName(name, ...rest) {
    if (inlet !== 0) {
        dataIn(symbolValue('captureBufferName', [name, ...rest]));
        return;
    }
    captureBuffer = String(name);
}
function referenceBufferName(name, ...rest) {
    if (inlet !== 0) {
        dataIn(symbolValue('referenceBufferName', [name, ...rest]));
        return;
    }
    referenceBuffer = String(name);
}
function capture(frames, sampleRate, ...rest) {
    if (inlet !== 0) {
        dataIn(symbolValue('capture', [frames, sampleRate, ...rest]));
        return;
    }
    if (captureBuffer === null) {
        log(libmunit_1.LogLevel.ERROR, 'capture arrived before the capture buffer was named');
        return;
    }
    const b = new Buffer(captureBuffer);
    const n = Math.min(Number(frames), b.framecount());
    const channels = Math.min(engine.settings.dataInlets, b.channelcount());
    log(libmunit_1.LogLevel.INFO, `captured ${n} frame(s) of ${channels} channel(s) at ${String(sampleRate)} Hz (buffer holds ${b.framecount()})`);
    if (!(n > 0)) {
        log(libmunit_1.LogLevel.ERROR, `the capture is empty: asked for ${String(frames)} frame(s)`);
    }
    engine.setSampleRate(Number(sampleRate));
    for (let c = channels; c >= 1; c--) {
        engine.input(c, b.peek(c, 0, n));
    }
    outlet(1, 'bang');
}
function start(...args) {
    if (inlet !== 0) {
        dataIn(symbolValue('start', args));
        return;
    }
    engine.start();
}
function free(...args) {
    if (inlet !== 0) {
        dataIn(symbolValue('free', args));
        return;
    }
    p.box.setboxattr('color', GREY);
}
function notifydeleted() {
    engine.dispose();
}
function bang() {
    if (inlet === 1) {
        engine.bang();
    }
}
function msg_int(value) {
    dataIn(value);
}
function msg_float(value) {
    dataIn(value);
}
function list(...values) {
    dataIn(values);
}
function jit_matrix(name) {
    if (inlet === 0) {
        dataIn(symbolValue('jit_matrix', [name]));
        return;
    }
    const value = readMatrix(String(name));
    if (value !== null) {
        dataIn(value);
    }
}
function dictionary(name) {
    if (inlet === 0) {
        dataIn(symbolValue('dictionary', [name]));
        return;
    }
    const value = dictValue(String(name));
    if (value === null) {
        log(libmunit_1.LogLevel.ERROR, `can't read dict ${String(name)}`);
        return;
    }
    dataIn(value);
}
function anything(...args) {
    dataIn(symbolValue(messagename, args));
}
function removeUnusedInlets(dataInlets) {
    for (let i = dataInlets; i < libmunit_1.MAX_DATA_INLETS; i++) {
        const unused = p.getnamed(`assertDataInlet${i}`);
        if (unused !== null && unused !== undefined) {
            p.remove(unused);
        }
    }
}
removeUnusedInlets.local = 1;
symbolValue.local = 1;
dataIn.local = 1;
var module = {};
module.exports = {};
//# sourceMappingURL=munit.assert.js.map