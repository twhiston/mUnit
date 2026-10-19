/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/

"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/libmunit.ts
var libmunit_exports = {};
__export(libmunit_exports, {
  AssertEngine: () => AssertEngine,
  DEFAULT_TOLERANCE: () => DEFAULT_TOLERANCE,
  DspController: () => DspController,
  EXACT: () => EXACT,
  HELPER_NAMES: () => HELPER_NAMES,
  LogLevel: () => LogLevel,
  MAX_DATA_INLETS: () => MAX_DATA_INLETS,
  OUTPUT_DIR_ENV: () => OUTPUT_DIR_ENV,
  OverallState: () => OverallState,
  PREVIEW_CHARS: () => PREVIEW_CHARS,
  REFERENCE_FOLDER: () => REFERENCE_FOLDER,
  RUN_CONTEXT_DICT: () => RUN_CONTEXT_DICT,
  STATUS_FILE_ENV: () => STATUS_FILE_ENV,
  State: () => State,
  TAKE_REFERENCES_ENV: () => TAKE_REFERENCES_ENV,
  alignLag: () => alignLag,
  alignedPair: () => alignedPair,
  approxEqual: () => approxEqual,
  artifactPath: () => artifactPath,
  asMatrix: () => asMatrix,
  assertSettings: () => assertSettings,
  assertState: () => assertState,
  checkDetails: () => checkDetails,
  compactInputs: () => compactInputs,
  compileExpression: () => compileExpression,
  copyDefined: () => copyDefined,
  customEvaluator: () => customEvaluator,
  dcOffset: () => dcOffset,
  deepEqual: () => deepEqual,
  describeDetails: () => describeDetails,
  describeMatrix: () => describeMatrix,
  diffMatrix: () => diffMatrix,
  diffValues: () => diffValues,
  encodeJxf: () => encodeJxf,
  expressionEvaluator: () => expressionEvaluator,
  expressionInputs: () => expressionInputs,
  formatProgress: () => formatProgress,
  frequency: () => frequency,
  hasKey: () => hasKey,
  isAbsolutePath: () => isAbsolutePath,
  isList: () => isList,
  isMatrix: () => isMatrix,
  isMatrixType: () => isMatrixType,
  isOutcome: () => isOutcome,
  isRecord: () => isRecord,
  isState: () => isState,
  jsonReplacer: () => jsonReplacer,
  judge: () => judge,
  makeHelpers: () => makeHelpers,
  matchDetails: () => matchDetails,
  matchGlob: () => matchGlob,
  matchMatrix: () => matchMatrix,
  matchMessage: () => matchMessage,
  matchSignal: () => matchSignal,
  matrixArray: () => matrixArray,
  matrixCell: () => matrixCell,
  matrixCells: () => matrixCells,
  matrixFromJitter: () => matrixFromJitter,
  matrixReferenceEvaluator: () => matrixReferenceEvaluator,
  matrixToTyped: () => matrixToTyped,
  maxDiff: () => maxDiff,
  noReferenceMessage: () => noReferenceMessage,
  parentFolder: () => parentFolder,
  parseJxf: () => parseJxf,
  peak: () => peak,
  planeStats: () => planeStats,
  preview: () => preview,
  referencePath: () => referencePath,
  resolvePath: () => resolvePath,
  resolveReference: () => resolveReference,
  rms: () => rms,
  round: () => round,
  safeFileName: () => safeFileName,
  samePairs: () => samePairs,
  samples: () => samples,
  savedPatchPath: () => savedPatchPath,
  showValue: () => showValue,
  signalReferenceEvaluator: () => signalReferenceEvaluator,
  snrDb: () => snrDb,
  splitComparison: () => splitComparison,
  toNativePath: () => toNativePath
});
module.exports = __toCommonJS(libmunit_exports);

// src/state.ts
var State = /* @__PURE__ */ ((State2) => {
  State2["Fail"] = "Fail";
  State2["Success"] = "Success";
  State2["Continue"] = "Continue";
  State2["Skipped"] = "Skipped";
  return State2;
})(State || {});
var OverallState = /* @__PURE__ */ ((OverallState2) => {
  OverallState2["Passed"] = "Passed";
  OverallState2["Failed"] = "Failed";
  return OverallState2;
})(OverallState || {});
var LogLevel = /* @__PURE__ */ ((LogLevel2) => {
  LogLevel2["ERROR"] = "ERROR";
  LogLevel2["INFO"] = "INFO";
  LogLevel2["WARN"] = "WARN";
  return LogLevel2;
})(LogLevel || {});
var MAX_DATA_INLETS = 10;
var assertSettings = class {
  /** `@maxCalls`: how many calls the assert may take to reach a verdict. Default 1. */
  maxCalls = 1;
  /** `@timeout`: milliseconds from the first input (or the suite start) before a call counts as failed; -1 (the default) for none. */
  timeout = -1;
  /** `@tolerance`, custom and `@every` asserts: how many Fail results are tolerated before failing. */
  tolerance = 0;
  /** `@name`, or the uuid when the assert has none. */
  name = null;
  /** `@suite`, or the name of the patch the assert sits in. */
  suite = null;
  /** `@accumulate`: inputs are summed across calls instead of replaced. */
  accumulate = false;
  /** `@dataInlets`: how many data inlets the assert reads (`in1`..`inN`). */
  dataInlets = 1;
  /** The assert object's unique id, which the results carry too. */
  uuid = null;
  /** What kind of assert this is. */
  kind = "expression";
  /** The expression, the custom script's file name, or the reference file. */
  expression = null;
  /**
   * `@every`, expression asserts: every call must be true (e.g. a table of
   * cases), rather than any one of them.
   */
  every = false;
  /** `@skip`: report the assert as Skipped without evaluating it. */
  skip = false;
  /** `@only`: when any assert in the suite has it, every other one is Skipped. */
  only = false;
  /**
   * `@reference`, signal and matrix asserts: the reference file (next to the
   * test patch, in `references/`) the capture is compared with; null for an
   * expression.
   */
  reference = null;
  /**
   * `@snr`, signal asserts: the least signal-to-noise ratio, in dB, that
   * counts as a match (60 dB is about 0.1% of the signal).
   */
  snr = 60;
  /**
   * `@maxLatency`, signal asserts: how many samples the capture may lead or
   * lag the reference; 0 compares them as they are.
   */
  maxLatency = 0;
  /** `@exact`, signal asserts: every sample must be identical (bit-exact). */
  exact = false;
  /**
   * `@maxDiff`, matrix asserts: the largest difference a cell may have from
   * the reference, in the matrix's units (0-255 for char).
   */
  maxDiff = 0;
  /** `@maxFraction`, matrix asserts: the largest fraction of cells (0 to 1) that may exceed `maxDiff`. */
  maxFraction = 0;
};
var assertState = class {
  /** The assert's unique id, matching its {@link assertSettings.uuid}. */
  uuid = null;
  /** The verdict: `Success`, `Fail` or `Skipped` once the assert has finished. */
  finalState = "Continue" /* Continue */;
  /** How many calls the assert made. */
  count = 0;
  /** How many of them returned Fail. */
  failCount = 0;
  /** Whether the verdict is in (left out of the written results). */
  finished = false;
  /** Every call, in order. */
  runs = [];
  /** The expression, the custom script's file name, or the reference file. */
  expression = null;
  /** The custom assert's function, in the assert object only (left out of the written results). */
  expressionHandler = null;
  /** Why the assert failed (or was skipped), or null when it passed. */
  message = null;
  /** From the first input (or the suite start) to the verdict, in milliseconds. */
  durationMs = null;
  /** A failure's expected value, as in {@link Run.expected}. */
  expected;
  /** A failure's actual value, as in {@link Run.actual}. */
  actual;
  /** A failure's comparison operator, as in {@link Run.operator}. */
  operator;
  /** A failure's differences, as in {@link Run.diff}. */
  diff;
  /** Files kept with a failure. */
  attachments;
  /** Reference files written when taking references. */
  recordings;
};
var STATUS_FILE_ENV = "MUNIT_STATUS_FILE";
var OUTPUT_DIR_ENV = "MUNIT_OUTPUT_DIR";
var TAKE_REFERENCES_ENV = "MUNIT_TAKE_REFERENCES";
function formatProgress(entry) {
  const mark = entry.state === "Success" /* Success */ ? "ok  " : entry.state === "Skipped" /* Skipped */ ? "skip" : "FAIL";
  const name = [entry.suite, entry.name].filter((part) => part !== null && part !== "").join(" \u203A ");
  const why = entry.state !== "Success" /* Success */ && entry.message !== null ? `: ${entry.message.split("\n")[0] ?? ""}` : "";
  return `${mark} ${name === "" ? "(unnamed)" : name}${why}`;
}
var RUN_CONTEXT_DICT = "munit.run";

// src/internal.ts
function isList(value) {
  return Array.isArray(value) || ArrayBuffer.isView(value) && !(value instanceof DataView);
}
function isRecord(value) {
  return value !== null && typeof value === "object" && !isList(value);
}
function hasKey(record, key) {
  return Object.prototype.hasOwnProperty.call(record, key);
}
function jsonReplacer(_key, value) {
  return ArrayBuffer.isView(value) && !(value instanceof DataView) ? Array.from(value) : value;
}
function showValue(value) {
  try {
    return JSON.stringify(value, jsonReplacer) ?? String(value);
  } catch {
    return String(value);
  }
}
var PREVIEW_CHARS = 120;
function preview(value) {
  const text = showValue(value);
  return text.length > PREVIEW_CHARS ? `${text.slice(0, PREVIEW_CHARS)}\u2026` : text;
}
var EXACT = { abs: 0, rel: 0 };
function samples(name, value) {
  if (typeof value === "number") {
    return [value];
  }
  if (isList(value)) {
    return value;
  }
  throw new TypeError(`${name}() needs a list of numbers, got ${preview(value)}`);
}
function samePairs(name, actual, expected) {
  const a = samples(name, actual);
  const e = samples(name, expected);
  if (a.length !== e.length) {
    throw new RangeError(`${name}() needs lists of the same length, got ${a.length} and ${e.length}`);
  }
  return [a, e];
}
function safeFileName(name) {
  const safe = name.replace(/[^\w.-]+/g, "_").replace(/^\.+/, "_");
  return safe === "" ? "_" : safe;
}
function round(value, places) {
  return Number.isFinite(value) ? Number(value.toFixed(places)) : value;
}
function copyDefined(target, source, keys) {
  for (const key of keys) {
    const value = source[key];
    if (value !== void 0) {
      target[key] = value;
    }
  }
}
function noReferenceMessage(file) {
  return `no reference at ${file}; take it with munit run --take-references (or MUNIT_TAKE_REFERENCES=1)`;
}
function artifactPath(dir, name, file) {
  return dir === null ? null : `${dir.replace(/[\\/]+$/, "")}/${safeFileName(name)}.${file}`;
}
function resolveReference(file, io, write, read, missing) {
  if (io.takeReferences()) {
    return {
      kind: "outcome",
      outcome: write() ? { state: "Success" /* Success */, recordings: [{ path: file }] } : { state: "Fail" /* Fail */, error: `couldn't write the reference ${file}` }
    };
  }
  const reference = read();
  if (reference === null) {
    return { kind: "outcome", outcome: { state: "Fail" /* Fail */, message: noReferenceMessage(file), ...missing() } };
  }
  return { kind: "reference", reference };
}

// src/values.ts
var DEFAULT_TOLERANCE = { abs: 1e-6, rel: 0 };
var MAX_DIFFS = 20;
function approxEqual(actual, expected, tolerance = DEFAULT_TOLERANCE) {
  if (actual === expected) {
    return true;
  }
  const difference = Math.abs(actual - expected);
  return Number.isFinite(difference) && difference <= Math.max(tolerance.abs, tolerance.rel * Math.abs(expected));
}
function childPath(path, key) {
  if (typeof key === "number") {
    return `${path}[${key}]`;
  }
  return /^[A-Za-z_$][\w$]*$/.test(key) ? `${path}.${key}` : `${path}[${JSON.stringify(key)}]`;
}
function diffValues(actual, expected, tolerance = EXACT) {
  const out = [];
  let more = 0;
  const add = (line) => {
    if (out.length < MAX_DIFFS) {
      out.push(line);
    } else {
      more++;
    }
  };
  const walk = (a, e, path) => {
    if (typeof a === "number" && typeof e === "number") {
      if (!approxEqual(a, e, tolerance)) {
        add(`${path}: expected ${preview(e)}, got ${preview(a)}`);
      }
      return;
    }
    if (isList(a) && isList(e)) {
      if (a.length !== e.length) {
        add(`${path}: expected ${e.length} item(s), got ${a.length}`);
      }
      const n = Math.min(a.length, e.length);
      for (let i = 0; i < n; i++) {
        walk(a[i], e[i], childPath(path, i));
      }
      return;
    }
    if (isRecord(a) && isRecord(e)) {
      for (const key of Object.keys(e)) {
        if (hasKey(a, key)) {
          walk(a[key], e[key], childPath(path, key));
        } else {
          add(`${childPath(path, key)}: missing, expected ${preview(e[key])}`);
        }
      }
      for (const key of Object.keys(a)) {
        if (!hasKey(e, key)) {
          add(`${childPath(path, key)}: unexpected ${preview(a[key])}`);
        }
      }
      return;
    }
    if (a !== e) {
      add(`${path}: expected ${preview(e)}, got ${preview(a)}`);
    }
  };
  walk(actual, expected, "$");
  if (more > 0) {
    out.push(`... and ${more} more difference(s)`);
  }
  return out;
}
function deepEqual(actual, expected, tolerance = EXACT) {
  return diffValues(actual, expected, tolerance).length === 0;
}
function rms(values) {
  const xs = samples("rms", values);
  let sum = 0;
  for (let i = 0; i < xs.length; i++) {
    sum += Number(xs[i]) ** 2;
  }
  return xs.length === 0 ? 0 : Math.sqrt(sum / xs.length);
}
function peak(values) {
  const xs = samples("peak", values);
  let max = 0;
  for (let i = 0; i < xs.length; i++) {
    max = Math.max(max, Math.abs(Number(xs[i])));
  }
  return max;
}
function dcOffset(values) {
  const xs = samples("dc", values);
  let sum = 0;
  for (let i = 0; i < xs.length; i++) {
    sum += Number(xs[i]);
  }
  return xs.length === 0 ? 0 : sum / xs.length;
}
function maxDiff(actual, expected) {
  const [a, e] = samePairs("maxDiff", actual, expected);
  let max = 0;
  for (let i = 0; i < a.length; i++) {
    max = Math.max(max, Math.abs(Number(a[i]) - Number(e[i])));
  }
  return max;
}
function snrDb(actual, reference) {
  const [a, r] = samePairs("snr", actual, reference);
  let signal = 0;
  let noise = 0;
  for (let i = 0; i < a.length; i++) {
    signal += Number(r[i]) ** 2;
    noise += (Number(a[i]) - Number(r[i])) ** 2;
  }
  if (noise === 0) {
    return Infinity;
  }
  return signal === 0 ? -Infinity : 10 * Math.log10(signal / noise);
}

// src/matrix.ts
function isMatrix(value) {
  if (!isRecord(value)) {
    return false;
  }
  const m = value;
  return Array.isArray(m.dim) && typeof m.planes === "number" && typeof m.type === "string" && m.data !== void 0 && isList(m.data);
}
function asMatrix(name, value) {
  if (!isMatrix(value)) {
    throw new TypeError(`${name}() needs a matrix (a jit_matrix on a data inlet), got ${preview(value)}`);
  }
  return value;
}
function matrixArray(type, values) {
  switch (type) {
    case "char":
      return new Uint8Array(values);
    case "long":
      return new Int32Array(values);
    case "float32":
      return new Float32Array(values);
    default:
      return new Float64Array(values);
  }
}
function isMatrixType(type) {
  return type === "char" || type === "long" || type === "float32" || type === "float64";
}
function matrixFromJitter(m) {
  const dim = Array.isArray(m.dim) ? m.dim.map(Number) : [Number(m.dim)];
  const planes = Number(m.planecount);
  const type = String(m.type);
  if (!isMatrixType(type) || !(planes >= 1) || dim.some((d) => !(d >= 1))) {
    return null;
  }
  const data = matrixArray(type, dim.reduce((n, d) => n * d, 1) * planes);
  m.copymatrixtoarray(data);
  return { dim, planes, type, data };
}
function matrixToTyped(m) {
  const d = m.data;
  if (d instanceof Uint8Array || d instanceof Int32Array || d instanceof Float32Array || d instanceof Float64Array) {
    return d;
  }
  const out = matrixArray(m.type, d.length);
  for (let i = 0; i < d.length; i++) {
    out[i] = Number(d[i]);
  }
  return out;
}
function matrixCells(m) {
  return m.dim.reduce((n, d) => n * d, 1);
}
function describeMatrix(m) {
  return { dim: [...m.dim], planes: m.planes, type: m.type };
}
function planeStats(value, plane = 0) {
  const m = asMatrix("planeStats", value);
  if (plane < 0 || plane >= m.planes) {
    throw new RangeError(`plane ${plane} doesn't exist: the matrix has ${m.planes} plane(s), numbered from 0`);
  }
  const cells = matrixCells(m);
  if (cells === 0) {
    return { min: 0, mean: 0, max: 0 };
  }
  let min = Infinity;
  let max = -Infinity;
  let sum = 0;
  for (let i = 0; i < cells; i++) {
    const v = Number(m.data[i * m.planes + plane]);
    min = Math.min(min, v);
    max = Math.max(max, v);
    sum += v;
  }
  return { min, mean: sum / cells, max };
}
function matrixCell(value, x, y = 0, plane) {
  const m = asMatrix("cell", value);
  const width = m.dim[0] ?? 0;
  const height = m.dim[1] ?? 1;
  if (x < 0 || x >= width || y < 0 || y >= height) {
    throw new RangeError(`cell (${x}, ${y}) is outside a ${m.dim.join("x")} matrix`);
  }
  if (plane !== void 0 && (plane < 0 || plane >= m.planes)) {
    throw new RangeError(`plane ${plane} doesn't exist: the matrix has ${m.planes} plane(s), numbered from 0`);
  }
  const base = (y * width + x) * m.planes;
  if (plane !== void 0) {
    return Number(m.data[base + plane]);
  }
  const out = [];
  for (let p = 0; p < m.planes; p++) {
    out.push(Number(m.data[base + p]));
  }
  return out;
}
function sameShape(a, e) {
  return a.planes === e.planes && a.type === e.type && a.dim.length === e.dim.length && a.dim.every((d, i) => d === e.dim[i]);
}
function matchMatrix(actual, expected, options) {
  const cells = matrixCells(expected);
  if (!sameShape(actual, expected)) {
    return { pass: false, sameShape: false, maxDiff: Infinity, differing: cells, fraction: 1, cells };
  }
  const planes = expected.planes;
  let maxDiff2 = 0;
  let differing = 0;
  for (let cell = 0; cell < cells; cell++) {
    let over = false;
    for (let plane = 0; plane < planes; plane++) {
      const i = cell * planes + plane;
      const d = Math.abs(Number(actual.data[i]) - Number(expected.data[i]));
      if (d > maxDiff2) {
        maxDiff2 = d;
      }
      if (d > options.maxDiff) {
        over = true;
      }
    }
    if (over) {
      differing++;
    }
  }
  const fraction = cells === 0 ? 0 : differing / cells;
  return { pass: fraction <= options.maxFraction, sameShape: true, maxDiff: maxDiff2, differing, fraction, cells };
}
function diffMatrix(actual, expected) {
  const values = matrixCells(actual) * actual.planes;
  const data = new Array(values);
  for (let i = 0; i < values; i++) {
    const d = Math.abs(Number(actual.data[i]) - Number(expected.data[i] ?? 0));
    data[i] = actual.type === "char" ? Math.min(255, Math.round(d)) : d;
  }
  return { dim: [...actual.dim], planes: actual.planes, type: actual.type, data };
}
function matchDetails(m) {
  return { ...m.sameShape ? { maxDiff: round(m.maxDiff, 6) } : {}, differing: m.differing, fraction: round(m.fraction, 6), cells: m.cells, sameShape: m.sameShape };
}
function matchMessage(m, maxDiff2, maxFraction) {
  if (!m.sameShape) {
    return "the matrices differ in dimensions, plane count or type";
  }
  return `${m.differing} of ${m.cells} cell(s) (${round(m.fraction * 100, 3)}%) differ by more than ${maxDiff2}; largest difference ${round(m.maxDiff, 6)}; allowed ${round(maxFraction * 100, 3)}%`;
}
var JXF_TYPES = { CHAR: "char", LONG: "long", FL32: "float32", FL64: "float64" };
var JXF_TAGS = { char: "CHAR", long: "LONG", float32: "FL32", float64: "FL64" };
var CELL_IO = {
  char: {
    bytes: 1,
    get: (v, at) => v.getUint8(at),
    set: (v, at, n) => {
      v.setUint8(at, n);
    }
  },
  long: {
    bytes: 4,
    get: (v, at) => v.getInt32(at),
    set: (v, at, n) => {
      v.setInt32(at, n);
    }
  },
  float32: {
    bytes: 4,
    get: (v, at) => v.getFloat32(at),
    set: (v, at, n) => {
      v.setFloat32(at, n);
    }
  },
  float64: {
    bytes: 8,
    get: (v, at) => v.getFloat64(at),
    set: (v, at, n) => {
      v.setFloat64(at, n);
    }
  }
};
function tagAt(view, at) {
  return String.fromCharCode(view.getUint8(at), view.getUint8(at + 1), view.getUint8(at + 2), view.getUint8(at + 3));
}
function parseJxf(bytes) {
  const buffer = bytes instanceof ArrayBuffer ? bytes : Uint8Array.from(bytes).buffer;
  const view = new DataView(buffer);
  if (view.byteLength < 12 || tagAt(view, 0) !== "FORM" || tagAt(view, 8) !== "JIT!") {
    throw new Error("not a JXF file");
  }
  let at = 12;
  while (at + 8 <= view.byteLength) {
    const tag = tagAt(view, at);
    const size = view.getUint32(at + 4);
    if (size < 8) {
      break;
    }
    if (tag === "MTRX") {
      const offset = view.getUint32(at + 8);
      const type = JXF_TYPES[tagAt(view, at + 12)];
      const planes = view.getUint32(at + 16);
      const dimcount = view.getUint32(at + 20);
      if (type === void 0 || planes < 1 || dimcount < 1) {
        throw new Error("the JXF matrix header is not one this reader understands");
      }
      const dim = [];
      for (let d = 0; d < dimcount; d++) {
        dim.push(view.getUint32(at + 24 + d * 4));
      }
      const values = dim.reduce((n, x) => n * x, 1) * planes;
      const start = at + offset;
      const { bytes: bytes2, get } = CELL_IO[type];
      if (start + values * bytes2 > view.byteLength) {
        throw new Error("the JXF file is shorter than its matrix");
      }
      const data = matrixArray(type, values);
      for (let i = 0; i < values; i++) {
        data[i] = get(view, start + i * bytes2);
      }
      return { dim, planes, type, data };
    }
    at += size;
  }
  throw new Error("the JXF file has no matrix");
}
function encodeJxf(m) {
  const values = matrixCells(m) * m.planes;
  const { bytes, set } = CELL_IO[m.type];
  const dataBytes = values * bytes;
  const offset = Math.max(32, Math.ceil((24 + 4 * m.dim.length) / 8) * 8);
  const mtrxSize = offset + dataBytes;
  const total = 24 + mtrxSize;
  const out = new Uint8Array(total);
  const view = new DataView(out.buffer);
  const put = (at, tag) => {
    for (let i = 0; i < 4; i++) {
      view.setUint8(at + i, tag.charCodeAt(i));
    }
  };
  put(0, "FORM");
  view.setUint32(4, total);
  put(8, "JIT!");
  put(12, "FVER");
  view.setUint32(16, 12);
  view.setUint32(20, 1016323200);
  put(24, "MTRX");
  view.setUint32(28, mtrxSize);
  view.setUint32(32, offset);
  put(36, JXF_TAGS[m.type]);
  view.setUint32(40, m.planes);
  view.setUint32(44, m.dim.length);
  m.dim.forEach((d, i) => {
    view.setUint32(48 + i * 4, d);
  });
  const start = 24 + offset;
  for (let i = 0; i < values; i++) {
    set(view, start + i * bytes, Number(m.data[i]));
  }
  return out;
}
function matrixReferenceEvaluator(reference, io, name) {
  const keep = (file, m) => {
    const path = artifactPath(io.artifactsDir(), name(), file);
    return path !== null && io.writeMatrix(path, m) ? [{ name: file, path }] : [];
  };
  const options = { maxDiff: reference.maxDiff, maxFraction: reference.maxFraction };
  return {
    kind: "matrix",
    mode: "any",
    inputs: 1,
    evaluate: (data) => {
      const actual = data[0];
      if (!isMatrix(actual)) {
        return { state: "Fail" /* Fail */, error: `the matrix assert needs a jit_matrix on its data inlet, got ${preview(actual)}` };
      }
      const found = resolveReference(
        reference.file,
        io,
        () => io.writeMatrix(reference.file, actual),
        () => io.readMatrix(reference.file),
        () => ({ actual: describeMatrix(actual), attachments: [...keep("actual.jxf", actual), ...keep("actual.png", actual)] })
      );
      if (found.kind === "outcome") {
        return found.outcome;
      }
      const expected = found.reference;
      const match = matchMatrix(actual, expected, options);
      const details = { ...describeMatrix(actual), ...matchDetails(match) };
      if (match.pass) {
        return { state: "Success" /* Success */, expected: describeMatrix(expected), actual: details };
      }
      const attachments = [...keep("actual.jxf", actual), ...keep("actual.png", actual)];
      if (match.sameShape) {
        attachments.push(...keep("diff.png", diffMatrix(actual, expected)));
      }
      attachments.push({ name: "expected.jxf", path: reference.file });
      return {
        state: "Fail" /* Fail */,
        message: `the matrix doesn't match ${reference.file}: ${matchMessage(match, reference.maxDiff, reference.maxFraction)}`,
        expected: describeMatrix(expected),
        actual: details,
        attachments
      };
    }
  };
}

// src/paths.ts
var WINDOWS_DRIVE = /^[A-Za-z]:[\\/]/;
var MAX_VOLUME = /^[^/\\:]+:(\/.*)$/;
function toNativePath(maxPath, bootVolume = null) {
  const p = maxPath.replace(/\\/g, "/");
  if (WINDOWS_DRIVE.test(p)) {
    return p;
  }
  const volume = MAX_VOLUME.exec(p);
  if (volume !== null) {
    const name = p.slice(0, p.indexOf(":"));
    const rest = volume[1];
    return bootVolume !== null && name !== bootVolume ? `/Volumes/${name}${rest}` : rest;
  }
  return p;
}
function savedPatchPath(patcher) {
  let current = patcher;
  while (current !== null && current !== void 0) {
    const file = String(current.filepath ?? "");
    if (file !== "") {
      return file;
    }
    current = current.parentpatcher;
  }
  return null;
}
function isAbsolutePath(p) {
  return p.startsWith("/") || p.startsWith("\\") || WINDOWS_DRIVE.test(p) || MAX_VOLUME.test(p);
}
function parentFolder(p) {
  const normal = p.replace(/\\/g, "/").replace(/\/+$/, "");
  const cut = normal.lastIndexOf("/");
  if (cut < 0) {
    return "";
  }
  return cut === 0 || /^[A-Za-z]:$/.test(normal.slice(0, cut)) ? normal.slice(0, cut + 1) : normal.slice(0, cut);
}
function resolvePath(base, rel) {
  const joined = isAbsolutePath(rel) ? rel : `${base.replace(/\/+$/, "")}/${rel}`;
  const normal = joined.replace(/\\/g, "/");
  const drive = WINDOWS_DRIVE.test(normal) ? normal.slice(0, 2) : "";
  const out = [];
  for (const part of normal.slice(drive.length).split("/")) {
    if (part === "" || part === ".") {
      continue;
    }
    if (part === "..") {
      out.pop();
    } else {
      out.push(part);
    }
  }
  return `${drive}/${out.join("/")}`;
}
function matchGlob(name, pattern) {
  const re = pattern.replace(/[.+^${}()|[\]\\]/g, "\\$&").replace(/\*/g, ".*").replace(/\?/g, ".");
  return new RegExp(`^${re}$`).test(name);
}

// src/signal.ts
function frequency(values, sampleRate) {
  const xs = samples("freq", values);
  if (!(sampleRate > 0)) {
    throw new RangeError(`freq() needs a sample rate above 0, got ${String(sampleRate)}`);
  }
  let first = -1;
  let last = -1;
  let count = 0;
  for (let i = 1; i < xs.length; i++) {
    const a = Number(xs[i - 1]);
    const b = Number(xs[i]);
    if (a <= 0 && b > 0) {
      const t = i - 1 + -a / (b - a);
      if (first < 0) {
        first = t;
      }
      last = t;
      count++;
    }
  }
  return count < 2 ? 0 : (count - 1) * sampleRate / (last - first);
}
function alignLag(actual, reference, maxLag) {
  const a = samples("align", actual);
  const r = samples("align", reference);
  const n = Math.min(a.length, r.length);
  let bestLag = 0;
  let best = -Infinity;
  for (let lag = -Math.floor(maxLag); lag <= Math.floor(maxLag); lag++) {
    let sum = 0;
    let energyA = 0;
    let energyR = 0;
    for (let i = 0; i < n; i++) {
      const j = i + lag;
      if (j < 0 || j >= a.length) {
        continue;
      }
      const x = Number(a[j]);
      const y = Number(r[i]);
      sum += x * y;
      energyA += x * x;
      energyR += y * y;
    }
    const score = energyA === 0 || energyR === 0 ? 0 : sum / Math.sqrt(energyA * energyR);
    if (score > best || score === best && Math.abs(lag) < Math.abs(bestLag)) {
      best = score;
      bestLag = lag;
    }
  }
  return bestLag;
}
function alignedPair(actual, reference, lag) {
  const a = samples("align", actual);
  const r = samples("align", reference);
  const outA = [];
  const outR = [];
  for (let i = 0; i < r.length; i++) {
    const j = i + lag;
    if (j >= 0 && j < a.length) {
      outA.push(Number(a[j]));
      outR.push(Number(r[i]));
    }
  }
  return [outA, outR];
}
function matchSignal(actual, reference, options) {
  const latency = options.maxLatency > 0 ? alignLag(actual, reference, options.maxLatency) : 0;
  const [a, r] = alignedPair(actual, reference, latency);
  if (a.length === 0) {
    return { pass: false, snrDb: -Infinity, maxDiff: Infinity, latency, samples: 0 };
  }
  const snr = snrDb(a, r);
  const diff = maxDiff(a, r);
  const pass = options.exact ? diff === 0 : snr >= options.snrDb;
  return { pass, snrDb: snr, maxDiff: diff, latency, samples: a.length };
}
function signalReferenceEvaluator(reference, io, name) {
  const actualFile = () => {
    const file = artifactPath(io.artifactsDir(), name(), "actual.wav");
    return file !== null && io.writeSignal(file) ? [{ name: "actual.wav", path: file }] : [];
  };
  const options = { snrDb: reference.snrDb, maxLatency: reference.maxLatency, exact: reference.exact };
  const expected = reference.exact ? { maxDiff: 0 } : { snrDb: `>= ${reference.snrDb}` };
  return {
    kind: "signal",
    mode: "any",
    inputs: reference.channels,
    evaluate: (data) => {
      const captured = data.slice(0, reference.channels);
      if (captured.some((ch) => !isList(ch))) {
        return { state: "Fail" /* Fail */, error: "the signal assert received no capture" };
      }
      const found = resolveReference(reference.file, io, () => io.writeSignal(reference.file), () => io.readSignal(reference.file), () => ({ attachments: actualFile() }));
      if (found.kind === "outcome") {
        return found.outcome;
      }
      const ref = found.reference;
      if (ref.length < reference.channels) {
        return { state: "Fail" /* Fail */, message: `${reference.file} has ${ref.length} channel(s), the assert captures ${reference.channels}`, attachments: actualFile() };
      }
      const matches = captured.map((ch, i) => matchSignal(ch, ref[i], options));
      const worst = matches.reduce((w, m) => m.snrDb < w.snrDb ? m : w);
      const describe = (m) => ({ snrDb: round(m.snrDb, 2), maxDiff: round(m.maxDiff, 6), latency: m.latency, samples: m.samples, identical: m.maxDiff === 0 });
      const actual = matches.length === 1 ? describe(worst) : matches.map(describe);
      if (matches.every((m) => m.pass)) {
        return { state: "Success" /* Success */, expected, actual };
      }
      const detail = reference.exact ? `max difference ${round(worst.maxDiff, 6)}` : `SNR ${round(worst.snrDb, 2)} dB, needs ${reference.snrDb}; max difference ${round(worst.maxDiff, 6)}`;
      return {
        state: "Fail" /* Fail */,
        message: `the capture doesn't match ${reference.file} (${detail}, latency ${worst.latency} samples)`,
        expected,
        actual,
        attachments: [...actualFile(), { name: "expected.wav", path: reference.file }]
      };
    }
  };
}

// src/helpers.ts
var HELPER_NAMES = [
  "approx",
  "equals",
  "snapshot",
  "rms",
  "peak",
  "dc",
  "maxDiff",
  "snr",
  "freq",
  "planeMin",
  "planeMean",
  "planeMax",
  "cell",
  "sameMatrix"
];
var REFERENCE_FOLDER = "references";
function referencePath(patchFolder, name) {
  const file = name.endsWith(".json") ? name : `${name}.json`;
  return resolvePath(`${patchFolder.replace(/[\\/]+$/, "")}/${REFERENCE_FOLDER}`, file);
}
function snapshotCheck(actual, name, context) {
  const refName = name ?? context.name;
  if (refName === null || refName === "") {
    throw new Error('snapshot() needs a name: give the assert a @name, or call snapshot(in1, "name")');
  }
  const folder = context.io?.patchFolder() ?? null;
  if (context.io === null || folder === null) {
    throw new Error("snapshot() keeps its reference next to the test patch: save the patch first");
  }
  const file = referencePath(folder, refName);
  const content = `${JSON.stringify(actual, jsonReplacer, 2) ?? "null"}
`;
  const normalised = JSON.parse(content);
  const actualFile = { name: `${safeFileName(refName)}.actual.json`, content };
  if (context.io.takeReferences()) {
    return { helper: "snapshot", pass: true, recordings: [{ path: file, content }] };
  }
  const text = context.io.readText(file);
  if (text === null) {
    return {
      helper: "snapshot",
      pass: false,
      actual: normalised,
      message: noReferenceMessage(file),
      attachments: [actualFile]
    };
  }
  let expected;
  try {
    expected = JSON.parse(text);
  } catch (e) {
    return { helper: "snapshot", pass: false, message: `the reference ${file} isn't valid JSON: ${String(e)}`, attachments: [actualFile] };
  }
  const diff = diffValues(normalised, expected);
  if (diff.length === 0) {
    return { helper: "snapshot", pass: true };
  }
  return {
    helper: "snapshot",
    pass: false,
    expected,
    actual: normalised,
    diff,
    message: `snapshot "${refName}" doesn't match ${file}`,
    attachments: [actualFile, { name: `${safeFileName(refName)}.expected.json`, path: file }]
  };
}
function makeHelpers(checks, context = { name: null, io: null }) {
  const compare = (helper, actual, expected, tolerance) => {
    const diff = diffValues(actual, expected, tolerance);
    const pass = diff.length === 0;
    checks.push(pass ? { helper, pass } : { helper, pass, expected, actual, diff });
    return pass;
  };
  return {
    approx: (actual, expected, abs = DEFAULT_TOLERANCE.abs, rel = DEFAULT_TOLERANCE.rel) => compare("approx", actual, expected, { abs, rel }),
    equals: (actual, expected) => compare("equals", actual, expected, EXACT),
    snapshot: (actual, name) => {
      const check = snapshotCheck(actual, name, context);
      checks.push(check);
      return check.pass;
    },
    rms,
    peak,
    dc: dcOffset,
    maxDiff,
    snr: snrDb,
    freq: (values) => {
      if (context.sampleRate === void 0) {
        throw new Error("freq() needs a captured signal: it is only available in a signal assert");
      }
      return frequency(values, context.sampleRate);
    },
    planeMin: (m, plane = 0) => planeStats(m, plane).min,
    planeMean: (m, plane = 0) => planeStats(m, plane).mean,
    planeMax: (m, plane = 0) => planeStats(m, plane).max,
    cell: matrixCell,
    sameMatrix: (actual, expected, maxDiff2 = 0, maxFraction = 0) => {
      const a = asMatrix("sameMatrix", actual);
      const e = asMatrix("sameMatrix", expected);
      const match = matchMatrix(a, e, { maxDiff: maxDiff2, maxFraction });
      checks.push(match.pass ? { helper: "sameMatrix", pass: true } : { helper: "sameMatrix", pass: false, expected: describeMatrix(e), actual: { ...describeMatrix(a), ...matchDetails(match) }, message: matchMessage(match, maxDiff2, maxFraction) });
      return match.pass;
    }
  };
}

// src/expression.ts
var INPUT_PATTERN = /(?<![\w$.])in(\d+)\b/g;
var QUOTED = /"(?:[^"\\\n]|\\.)*"|'(?:[^'\\\n]|\\.)*'/g;
function expressionInputs(expression) {
  const found = /* @__PURE__ */ new Set();
  for (const match of expression.replace(QUOTED, '""').matchAll(INPUT_PATTERN)) {
    found.add(Number(match[1]));
  }
  return [...found].sort((a, b) => a - b);
}
function splitComparison(expression) {
  const s = expression;
  let depth = 0;
  let quote = null;
  let equality = null;
  let relational = null;
  for (let i = 0; i < s.length; i++) {
    const c = s.charAt(i);
    if (quote !== null) {
      if (c === "\\") {
        i++;
      } else if (c === quote) {
        quote = null;
      }
      continue;
    }
    if (c === '"' || c === "'" || c === "`") {
      quote = c;
    } else if ("([{".includes(c)) {
      depth++;
    } else if (")]}".includes(c)) {
      depth--;
    } else if (depth !== 0) {
      continue;
    } else if ("&|^,".includes(c)) {
      return null;
    } else if (c === "?") {
      if (s.charAt(i + 1) === "." && !/\d/.test(s.charAt(i + 2))) {
        i++;
        continue;
      }
      return null;
    } else if (c === "=" || c === "!") {
      const op = ["===", "!==", "==", "!="].find((o) => s.startsWith(o, i));
      if (op !== void 0) {
        equality = [i, op];
        i += op.length - 1;
      } else if (c === "=") {
        return null;
      }
    } else if (c === "<" || c === ">") {
      const shift = /^(<<|>>>?)=?/.exec(s.slice(i));
      if (shift !== null) {
        if (shift[0].endsWith("=")) {
          return null;
        }
        i += shift[0].length - 1;
      } else if (s.charAt(i + 1) === "=") {
        relational = [i, `${c}=`];
        i++;
      } else {
        relational = [i, c];
      }
    }
  }
  const split = equality ?? relational;
  if (quote !== null || depth !== 0 || split === null) {
    return null;
  }
  const [at, operator] = split;
  const left = s.slice(0, at).trim();
  const right = s.slice(at + operator.length).trim();
  return left === "" || right === "" ? null : { left, operator, right };
}
function compileBody(params, body) {
  return new Function(...params, `"use strict";
return (${body}
);`);
}
function compileExpression(expression) {
  const used = expressionInputs(expression);
  for (const n of used) {
    if (n < 1 || n > MAX_DATA_INLETS) {
      throw new Error(`in${n} is out of range: use in1 to in${MAX_DATA_INLETS}`);
    }
  }
  const inputs = Math.max(1, ...used);
  const params = [];
  for (let i = 1; i <= inputs; i++) {
    params.push(`in${i}`);
  }
  params.push(...HELPER_NAMES);
  const fn = compileBody(params, expression);
  const args = (values, helpers) => {
    const h = helpers ?? makeHelpers([]);
    const out = [];
    for (let i = 0; i < inputs; i++) {
      out.push(values[i]);
    }
    for (const name of HELPER_NAMES) {
      out.push(h[name]);
    }
    return out;
  };
  let describe = null;
  const comparison = splitComparison(expression);
  if (comparison !== null) {
    try {
      const left = compileBody(params, comparison.left);
      const right = compileBody(params, comparison.right);
      describe = (values, helpers) => {
        const a = args(values, helpers);
        return { actual: left(...a), expected: right(...a), operator: comparison.operator };
      };
    } catch {
    }
  }
  return {
    source: expression,
    inputs,
    evaluate: (values, helpers) => fn(...args(values, helpers)),
    describe
  };
}

// src/evaluators.ts
function isState(value) {
  return value === "Success" /* Success */ || value === "Fail" /* Fail */ || value === "Continue" /* Continue */ || value === "Skipped" /* Skipped */;
}
function isOutcome(value) {
  return isRecord(value) && isState(value["state"]);
}
function checkDetails(checks) {
  const failed = checks.find((c) => !c.pass);
  if (failed === void 0) {
    return {};
  }
  const details = {};
  copyDefined(details, failed, ["message", "expected", "actual", "diff"]);
  return details;
}
function expressionEvaluator(expression, every = false) {
  const compiled = compileExpression(expression);
  return {
    kind: "expression",
    mode: every ? "every" : "any",
    inputs: compiled.inputs,
    evaluate: (data, helpers, checks) => {
      const value = compiled.evaluate(data, helpers);
      if (value === true) {
        return { state: every ? "Continue" /* Continue */ : "Success" /* Success */ };
      }
      const outcome = { state: "Fail" /* Fail */, ...checkDetails(checks) };
      if (outcome.expected === void 0 && outcome.actual === void 0 && compiled.describe !== null) {
        try {
          Object.assign(outcome, compiled.describe(data, makeHelpers([])));
        } catch {
        }
      }
      if (typeof value !== "boolean" && outcome.message === void 0) {
        outcome.message = `${expression} returned ${preview(value)}, not true`;
      }
      return outcome;
    }
  };
}
function customEvaluator(handler, name) {
  return {
    kind: "custom",
    mode: "every",
    inputs: null,
    evaluate: (data, helpers, checks) => {
      const returned = handler(data.slice(), helpers);
      if (isState(returned)) {
        return returned === "Fail" /* Fail */ ? { state: returned, ...checkDetails(checks) } : { state: returned };
      }
      if (isOutcome(returned)) {
        const own = returned.expected !== void 0 || returned.actual !== void 0 || returned.diff !== void 0;
        return returned.state === "Fail" /* Fail */ && !own ? { ...checkDetails(checks), ...returned } : returned;
      }
      return { state: "Fail" /* Fail */, error: `${name} returned ${preview(returned)}, not a State` };
    }
  };
}
function judge(rules, count, failCount, call) {
  if (call === "Success" /* Success */ || call === "Skipped" /* Skipped */) {
    return { finished: true, state: call };
  }
  const atLimit = count >= rules.maxCalls;
  if (rules.mode === "any") {
    return atLimit ? { finished: true, state: "Fail" /* Fail */ } : { finished: false, state: "Continue" /* Continue */ };
  }
  if (failCount > rules.tolerance) {
    return { finished: true, state: "Fail" /* Fail */ };
  }
  return atLimit ? { finished: true, state: "Success" /* Success */ } : { finished: false, state: "Continue" /* Continue */ };
}
function describeDetails(outcome) {
  if (outcome.diff !== void 0 && outcome.diff.length > 0) {
    const shown = outcome.diff.slice(0, 3).join("; ");
    return `: ${outcome.diff.length} difference(s): ${shown}${outcome.diff.length > 3 ? "; ..." : ""}`;
  }
  if (outcome.expected === void 0 && outcome.operator === void 0) {
    return "";
  }
  const op = outcome.operator !== void 0 && outcome.operator !== "==" && outcome.operator !== "===" ? `${outcome.operator} ` : "";
  return `: expected ${op}${preview(outcome.expected)}, got ${preview(outcome.actual)}`;
}

// src/engine.ts
var ATTR_NAMES = [
  "maxCalls",
  "timeout",
  "tolerance",
  "name",
  "suite",
  "accumulate",
  "dataInlets",
  "every",
  "skip",
  "only",
  "reference",
  "snr",
  "maxLatency",
  "exact",
  "channels",
  "maxDiff",
  "maxFraction"
];
var FLAG_NAMES = ["accumulate", "every", "skip", "only", "exact"];
var ATTRS = new Set(ATTR_NAMES);
var FLAGS = new Set(FLAG_NAMES);
var INLINE_LIST = 32;
function compactInputs(data) {
  return data.map((value) => {
    if (isMatrix(value)) {
      return { ...describeMatrix(value), cells: matrixCells(value) };
    }
    if (isList(value) && value.length > INLINE_LIST) {
      const xs = value;
      return { length: xs.length, rms: round(rms(xs), 6), peak: round(peak(xs), 6), head: Array.from(xs).slice(0, 8) };
    }
    return value;
  });
}
function positiveInt(value, fallback) {
  const n = Math.floor(Number(value));
  return Number.isFinite(n) && n >= 1 ? n : fallback;
}
function accumulate(total, next) {
  if (total === void 0 || next === void 0) {
    return total === void 0 ? next : total;
  }
  if (typeof total === "number" && typeof next === "number" || typeof total === "string" && typeof next === "string") {
    return total + next;
  }
  if (isList(total) && isList(next)) {
    const out = [];
    for (let i = 0; i < Math.max(total.length, next.length); i++) {
      out.push(Number(total[i] ?? 0) + Number(next[i] ?? 0));
    }
    return out;
  }
  return next;
}
var AssertEngine = class {
  settings = new assertSettings();
  state = new assertState();
  host;
  evaluator = null;
  registered = false;
  // The assert has no @name of its own (it defaults to the uuid, which
  // changes each load), so it can't name a snapshot
  unnamed = false;
  queue = [];
  // Latest value per input: index 0 holds in1
  values = [];
  accumulated = [];
  // Reference writes, by path: kept from every call, not just the last
  recordings = /* @__PURE__ */ new Map();
  startedAt = null;
  // Signal asserts: the rate of the capture, for freq()
  sampleRate = void 0;
  constructor(host) {
    this.host = host;
  }
  get isRegistered() {
    return this.registered;
  }
  setUuid(id) {
    this.settings.uuid = String(id);
    this.state.uuid = String(id);
  }
  // Signal asserts: the capture's sample rate, before its channels arrive
  setSampleRate(sampleRate) {
    this.sampleRate = sampleRate > 0 ? sampleRate : void 0;
  }
  // Returns false when the attribute is unknown, invalid or arrives too late
  setAttr(attr, value) {
    if (this.registered) {
      this.host.log("WARN" /* WARN */, `@${attr} ignored: attributes can't change after the assert has registered`);
      return false;
    }
    if (!ATTRS.has(attr)) {
      this.host.log("WARN" /* WARN */, `unknown attribute @${attr}`);
      return false;
    }
    const s = this.settings;
    if (FLAGS.has(attr)) {
      s[attr] = value === true || Number(value) === 1;
      return true;
    }
    switch (attr) {
      case "timeout": {
        const ms = Number(value);
        if (ms === -1) {
          s[attr] = -1;
          return true;
        }
        if (!Number.isFinite(ms) || ms <= 0) {
          this.host.log("ERROR" /* ERROR */, `@timeout must be more than 0 ms, got ${showValue(value)}; no timeout set`);
          return false;
        }
        s[attr] = ms;
        return true;
      }
      case "maxCalls":
      case "dataInlets":
      case "channels":
        s[attr === "channels" ? "dataInlets" : attr] = attr === "maxCalls" ? positiveInt(value, 1) : Math.min(MAX_DATA_INLETS, positiveInt(value, 1));
        return true;
      case "snr": {
        const db = Number(value);
        if (!Number.isFinite(db)) {
          this.host.log("ERROR" /* ERROR */, `@snr must be a number of dB, got ${showValue(value)}`);
          return false;
        }
        s[attr] = db;
        return true;
      }
      case "maxLatency": {
        const n = Math.floor(Number(value));
        s[attr] = Number.isFinite(n) && n > 0 ? n : 0;
        return true;
      }
      case "maxDiff":
      case "maxFraction": {
        const n = Number(value);
        if (!Number.isFinite(n) || n < 0) {
          this.host.log("ERROR" /* ERROR */, `@${attr} must be a number of 0 or more, got ${showValue(value)}`);
          return false;
        }
        s[attr] = attr === "maxFraction" ? Math.min(1, n) : n;
        return true;
      }
      case "tolerance": {
        const n = Math.floor(Number(value));
        s[attr] = Number.isFinite(n) && n > 0 ? n : 0;
        return true;
      }
      default:
        s[attr] = value === null || value === void 0 ? null : String(value);
        return true;
    }
  }
  // Compiles the expression (or loads the custom assert script), then
  // registers as registerWith does. Returns the number of data inlets the
  // assert needs. `parentName` is the default suite name.
  register(expression, loadHandler, parentName) {
    if (this.registered) {
      this.host.log("WARN" /* WARN */, "assert is already registered; ignoring the new expression");
      return this.settings.dataInlets;
    }
    if (expression.endsWith(".js")) {
      try {
        const handler = loadHandler(expression);
        if (typeof handler !== "function") {
          throw new Error(`${expression} must export a function`);
        }
        this.state.expressionHandler = handler;
        return this.use(expression, customEvaluator(handler, expression), null, parentName);
      } catch (e) {
        return this.use(expression, null, `can't load ${expression}: ${String(e)}`, parentName);
      }
    }
    try {
      return this.use(expression, expressionEvaluator(expression, this.settings.every), null, parentName);
    } catch (e) {
      return this.use(expression, null, `invalid expression "${expression}": ${String(e)}`, parentName);
    }
  }
  // Registers with an evaluator the host built, e.g. a signal assert's.
  // Sends the registration and replays any input that arrived first.
  registerWith(description, evaluator, parentName) {
    if (this.registered) {
      this.host.log("WARN" /* WARN */, "assert is already registered; ignoring the new evaluator");
      return this.settings.dataInlets;
    }
    return this.use(description, evaluator, null, parentName);
  }
  use(description, evaluator, problem, parentName) {
    const s = this.settings;
    if (s.suite === null) {
      s.suite = parentName;
    }
    if (s.name === null) {
      s.name = s.uuid;
      this.unnamed = true;
    }
    s.expression = description;
    s.kind = evaluator?.kind ?? (description.endsWith(".js") ? "custom" : "expression");
    if (evaluator?.inputs !== null && evaluator?.inputs !== void 0) {
      s.dataInlets = evaluator.inputs;
    }
    this.state.expression = description;
    this.evaluator = evaluator;
    this.registered = true;
    this.host.send("registerAssert", JSON.stringify(s));
    if (problem !== null) {
      this.host.log("ERROR" /* ERROR */, problem);
      this.finish("Fail" /* Fail */, problem);
      return s.dataInlets;
    }
    if (s.skip) {
      this.queue.length = 0;
      this.finish("Skipped" /* Skipped */, "skipped (@skip)");
      return s.dataInlets;
    }
    for (const [inlet, value] of this.queue.splice(0)) {
      this.input(inlet, value);
    }
    return s.dataInlets;
  }
  // The suite has started: the timeout clock runs from now if it isn't
  // already running because an input arrived first
  start() {
    this.startClock();
  }
  // A value on data inlet n (1 = in1, the hot inlet). Cold inlets only store.
  input(inlet, value) {
    if (!this.registered) {
      this.queue.push([inlet, value]);
      return;
    }
    if (inlet < 1 || inlet > MAX_DATA_INLETS) {
      return;
    }
    if (inlet > 1) {
      this.values[inlet - 1] = value;
      return;
    }
    this.values[0] = value;
    this.evaluate();
  }
  // Evaluate again with the stored values (a bang on the hot inlet)
  bang() {
    if (!this.registered) {
      this.queue.push([1, this.values[0]]);
      return;
    }
    this.evaluate();
  }
  // The host's timer fired: counts as a failed call
  onTimeout() {
    if (this.state.finished) {
      return;
    }
    this.record({ state: "Fail" /* Fail */, error: `timed out after ${this.settings.timeout} ms` }, ["timeout"]);
    if (!this.state.finished) {
      this.host.schedule(this.settings.timeout);
    }
  }
  // The object is being deleted
  dispose() {
    this.host.cancel();
  }
  startClock() {
    if (this.startedAt !== null || this.state.finished) {
      return;
    }
    this.startedAt = this.host.now();
    if (this.settings.timeout > 0) {
      this.host.schedule(this.settings.timeout);
    }
  }
  currentInputs() {
    const n = this.settings.dataInlets;
    const current = [];
    for (let i = 0; i < n; i++) {
      current.push(this.values[i]);
    }
    if (!this.settings.accumulate) {
      return current;
    }
    for (let i = 0; i < n; i++) {
      this.accumulated[i] = accumulate(this.accumulated[i], current[i]);
    }
    return this.accumulated.slice(0, n);
  }
  evaluate() {
    if (this.state.finished) {
      this.host.log("INFO" /* INFO */, "input ignored: the assert has already finished");
      return;
    }
    this.startClock();
    const data = this.currentInputs();
    const checks = [];
    const helpers = makeHelpers(checks, { name: this.unnamed ? null : this.settings.name, io: this.host.io ?? null, sampleRate: this.sampleRate });
    let outcome;
    try {
      outcome = this.evaluator === null ? { state: "Fail" /* Fail */, error: "the assert has nothing to evaluate" } : this.evaluator.evaluate(data, helpers, checks);
    } catch (e) {
      outcome = { ...checkDetails(checks), state: "Fail" /* Fail */, error: String(e) };
    }
    const attachments = [...outcome.attachments ?? []];
    for (const check of checks) {
      if (!check.pass) {
        attachments.push(...check.attachments ?? []);
      }
      for (const r of check.recordings ?? []) {
        this.recordings.set(r.path, r);
      }
    }
    for (const r of outcome.recordings ?? []) {
      this.recordings.set(r.path, r);
    }
    this.record({ ...outcome, attachments }, data);
  }
  record(outcome, data) {
    const st = this.state;
    st.count++;
    if (outcome.state === "Fail" /* Fail */) {
      st.failCount++;
    }
    const run = { state: outcome.state, data: compactInputs(data) };
    copyDefined(run, outcome, ["error", "expected", "actual", "operator", "diff"]);
    st.runs.push(run);
    const s = this.settings;
    const mode = this.evaluator?.mode ?? "any";
    const verdict = judge({ mode, maxCalls: s.maxCalls, tolerance: s.tolerance }, st.count, st.failCount, outcome.state);
    if (!verdict.finished) {
      return;
    }
    let message = null;
    if (verdict.state === "Fail" /* Fail */) {
      message = outcome.error ?? `${outcome.message ?? this.defaultFailure(mode)}${describeDetails(outcome)}; last inputs ${preview(compactInputs(data))}`;
    } else if (verdict.state === "Skipped" /* Skipped */) {
      message = outcome.message ?? `skipped by ${String(s.expression)}`;
    }
    this.finish(verdict.state, message, outcome);
  }
  defaultFailure(mode) {
    const s = this.settings;
    const st = this.state;
    if (s.kind === "custom") {
      return `${String(s.expression)} returned Fail ${st.failCount} time(s), tolerance ${s.tolerance}`;
    }
    if (s.kind === "signal" || s.kind === "matrix") {
      return `${String(s.expression)} didn't match`;
    }
    return mode === "every" ? `${String(s.expression)} was not true on call ${st.count} of ${s.maxCalls}` : `${String(s.expression)} was not true after ${st.count} of ${s.maxCalls} call(s)`;
  }
  finish(state, message, outcome = null) {
    const st = this.state;
    st.finished = true;
    st.finalState = state;
    st.message = message;
    st.durationMs = this.startedAt === null ? 0 : this.host.now() - this.startedAt;
    if (outcome !== null && state === "Fail" /* Fail */) {
      copyDefined(st, outcome, ["expected", "actual", "operator", "diff"]);
      if (outcome.attachments !== void 0 && outcome.attachments.length > 0) {
        st.attachments = outcome.attachments;
      }
    }
    if (this.recordings.size > 0) {
      st.recordings = [...this.recordings.values()];
    }
    this.host.cancel();
    this.host.finished(state);
    this.host.log("INFO" /* INFO */, "Assert Complete", state);
    this.host.send("result", JSON.stringify(st, (key, value) => {
      return key === "finished" || key === "expressionHandler" ? void 0 : jsonReplacer(key, value);
    }));
  }
};

// src/dsp.ts
var DSP_STEP_MS = 300;
var DspController = class {
  menus = { driver: [], sr: [], sigvs: [], switch: [] };
  index = { driver: -1, sr: -1, sigvs: -1, switch: -1 };
  value = { driver: -1, sr: -1, sigvs: -1, switch: -1 };
  dsp = { on: -1, sr: -1, vs: -1 };
  saved = null;
  host;
  constructor(host) {
    this.host = host;
  }
  // A umenu message from an adstatus left outlet
  menu(setting, message, args) {
    if (message === "clear") {
      this.menus[setting] = [];
    } else if (message === "append") {
      this.menus[setting].push(args.map(String).join(" "));
    } else if (message === "set") {
      this.index[setting] = Number(args[0]);
    }
  }
  // The value from an adstatus right outlet
  setValue(setting, value) {
    this.value[setting] = Number(value);
  }
  // What dspstate~ reports
  dspState(field, value) {
    this.dsp[field] = Number(value);
  }
  driverName() {
    return this.menus.driver[this.index.driver] ?? `driver ${this.index.driver}`;
  }
  // The menu index of a driver named loosely ("NonRealTime", "non real time"); -1 if none
  findDriver(name) {
    const key = (s) => s.toLowerCase().replace(/[^a-z0-9]/g, "");
    return this.menus.driver.findIndex((item) => key(item) === key(name));
  }
  // dsp apply <driver or ""> <sr or 0> <vs or 0> <settleMs>: switches the
  // driver, waits settleMs for the change to land, sets the rates, switches
  // DSP on and answers dspReady with what DSP really runs at
  apply(driver, sr, vs, settleMs) {
    if (this.saved === null) {
      this.saved = { driver: this.index.driver, sr: this.value.sr, sigvs: this.value.sigvs, on: this.value.switch > 0 ? 1 : 0 };
    }
    const settle = Math.max(0, Number(settleMs) || 0);
    let changing = false;
    if (driver !== "") {
      const i = this.findDriver(driver);
      if (i < 0) {
        this.host.reply("dspProblem", `no audio driver called "${driver}"; the choices are ${this.menus.driver.join(", ")}`);
      } else if (i !== this.index.driver) {
        this.host.toAdstatus("driver", i);
        changing = true;
      }
    }
    this.host.schedule(() => {
      this.setRates(sr, vs);
      this.host.schedule(() => {
        this.host.toAdstatus("switch", 1);
        this.host.schedule(() => {
          if (sr > 0 && this.dsp.sr !== sr) {
            this.host.reply("dspProblem", `asked for ${sr} Hz but DSP runs at ${this.dsp.sr}`);
          }
          if (vs > 0 && this.dsp.vs !== vs) {
            this.host.reply("dspProblem", `asked for a vector size of ${vs} but DSP runs with ${this.dsp.vs}`);
          }
          this.host.reply("dspReady", this.dsp.sr, this.dsp.vs, this.driverName());
        }, Math.max(DSP_STEP_MS, settle / 3));
      }, DSP_STEP_MS);
    }, changing ? settle : 0);
  }
  // dsp restore <settleMs>: the state before apply(), then dspRestored
  restore(settleMs) {
    const was = this.saved;
    this.saved = null;
    if (was === null) {
      this.host.reply("dspRestored");
      return;
    }
    const settle = Math.max(0, Number(settleMs) || 0);
    this.host.toAdstatus("switch", was.on);
    let changing = false;
    if (was.driver >= 0 && was.driver !== this.index.driver) {
      this.host.toAdstatus("driver", was.driver);
      changing = true;
    }
    this.host.schedule(() => {
      this.setRates(was.sr, was.sigvs);
      this.host.schedule(() => {
        this.host.reply("dspRestored");
      }, DSP_STEP_MS);
    }, changing ? settle : 0);
  }
  setRates(sr, vs) {
    if (sr > 0) {
      this.host.toAdstatus("sr", sr);
      this.host.toDsp("sr", sr);
    }
    if (vs > 0) {
      this.host.toAdstatus("sigvs", vs);
      this.host.toDsp("sigvs", vs);
    }
  }
};
