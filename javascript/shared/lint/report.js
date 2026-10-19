"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.REPORT_FORMATS = exports.EXIT_ERROR = exports.EXIT_BLOCKED = exports.EXIT_CLEAN = void 0;
exports.summarise = summarise;
exports.exitCodeFor = exitCodeFor;
exports.summaryText = summaryText;
exports.renderText = renderText;
exports.renderJson = renderJson;
exports.renderJUnit = renderJUnit;
exports.renderRuleList = renderRuleList;
exports.render = render;
exports.EXIT_CLEAN = 0;
exports.EXIT_BLOCKED = 1;
exports.EXIT_ERROR = 2;
exports.REPORT_FORMATS = ['text', 'json', 'junit'];
function summarise(run) {
    return {
        files: run.files.length,
        block: run.diagnostics.filter((d) => d.level === 'block').length,
        warn: run.diagnostics.filter((d) => d.level === 'warn').length,
        errors: run.errors.length,
        fixed: run.fixed ?? 0
    };
}
function exitCodeFor(run) {
    if (run.errors.length > 0) {
        return exports.EXIT_ERROR;
    }
    return run.diagnostics.some((d) => d.level === 'block') ? exports.EXIT_BLOCKED : exports.EXIT_CLEAN;
}
function painter(on, code) {
    return on ? (text) => `\u001b[${code}m${text}\u001b[0m` : (text) => text;
}
function palette(on) {
    return {
        bold: painter(on, '1'),
        dim: painter(on, '2'),
        red: painter(on, '31'),
        yellow: painter(on, '33'),
        green: painter(on, '32'),
        cyan: painter(on, '36')
    };
}
function paintLevel(c, level) {
    return level === 'block' ? c.red(level.padEnd(5)) : c.yellow(level.padEnd(5));
}
function summaryText(summary, colour = false) {
    const c = palette(colour);
    const parts = [];
    if (summary.block > 0) {
        parts.push(c.red(`${summary.block} blocking`));
    }
    if (summary.warn > 0) {
        parts.push(c.yellow(`${summary.warn} warning${summary.warn === 1 ? '' : 's'}`));
    }
    if (summary.errors > 0) {
        parts.push(c.red(`${summary.errors} error${summary.errors === 1 ? '' : 's'}`));
    }
    const fixed = summary.fixed > 0 ? `${c.green(`fixed ${summary.fixed}`)}, ` : '';
    return `${fixed}${parts.length === 0 ? c.green('clean') : parts.join(', ')}`;
}
function summaryLine(summary, colour = false) {
    const c = palette(colour);
    return `${c.bold('mUnit lint:')} ${summary.files} file${summary.files === 1 ? '' : 's'}, ${summaryText(summary, colour)}`;
}
function groupByFile(diagnostics) {
    const byFile = new Map();
    for (const d of diagnostics) {
        const list = byFile.get(d.file) ?? [];
        list.push(d);
        byFile.set(d.file, list);
    }
    return byFile;
}
function renderText(run, options = { colour: false }) {
    const c = palette(options.colour);
    const lines = [];
    for (const [file, diagnostics] of groupByFile(run.diagnostics)) {
        lines.push(c.bold(file));
        for (const d of diagnostics) {
            const where = d.location !== '' ? `${c.cyan(d.location)}: ` : '';
            lines.push(`  ${paintLevel(c, d.level)}  ${c.dim(d.rule)}  ${where}${d.message}`);
        }
    }
    for (const error of run.errors) {
        lines.push(`${c.red('error:')} ${error}`);
    }
    lines.push(summaryLine(summarise(run), options.colour));
    return lines.join('\n');
}
function renderJson(run) {
    return JSON.stringify({ summary: summarise(run), files: run.files, findings: run.diagnostics, errors: run.errors }, null, 2);
}
const INVALID_XML = /[\u0000-\u0008\u000B\u000C\u000E-\u001F￾￿]/g;
function escapeXml(text) {
    return String(text)
        .replace(INVALID_XML, '')
        .replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&apos;');
}
function renderJUnit(run) {
    const suites = [];
    let tests = 0;
    let failures = 0;
    let errors = 0;
    const byFile = groupByFile(run.diagnostics);
    for (const file of run.files) {
        const diagnostics = byFile.get(file) ?? [];
        const cases = [];
        if (diagnostics.length === 0) {
            cases.push(`    <testcase name="clean" classname="${escapeXml(file)}"/>`);
        }
        let suiteFailures = 0;
        for (const d of diagnostics) {
            const name = escapeXml(`${d.rule}: ${d.location}`);
            const open = `    <testcase name="${name}" classname="${escapeXml(file)}">`;
            if (d.level === 'block') {
                suiteFailures++;
                cases.push(open, `      <failure message="${escapeXml(d.message)}" type="${escapeXml(d.rule)}">${escapeXml(`${d.location}\n${d.message}`)}</failure>`, '    </testcase>');
            }
            else {
                cases.push(open, `      <system-out>${escapeXml(`warning: ${d.message}`)}</system-out>`, '    </testcase>');
            }
        }
        const count = Math.max(diagnostics.length, 1);
        tests += count;
        failures += suiteFailures;
        suites.push(`  <testsuite name="${escapeXml(file)}" tests="${count}" failures="${suiteFailures}" errors="0" skipped="0">`, ...cases, '  </testsuite>');
    }
    if (run.errors.length > 0) {
        const cases = run.errors.map((e) => {
            const first = escapeXml(e.split('\n')[0]);
            return `    <testcase name="${first}" classname="mUnit lint">\n      <error message="${first}" type="LintError">${escapeXml(e)}</error>\n    </testcase>`;
        });
        tests += run.errors.length;
        errors += run.errors.length;
        suites.push(`  <testsuite name="mUnit lint" tests="${run.errors.length}" failures="0" errors="${run.errors.length}" skipped="0">`, ...cases, '  </testsuite>');
    }
    return [
        '<?xml version="1.0" encoding="UTF-8"?>',
        `<testsuites name="mUnit lint" tests="${tests}" failures="${failures}" errors="${errors}" skipped="0">`,
        ...suites,
        '</testsuites>'
    ].join('\n');
}
function renderRuleList(run, format, options = { colour: false }) {
    const lists = run.ruleLists ?? [];
    if (format === 'json') {
        return JSON.stringify({ files: lists, errors: run.errors }, null, 2);
    }
    const c = palette(options.colour);
    const lines = [];
    for (const { file, rules } of lists) {
        lines.push(c.bold(file));
        const width = Math.max(0, ...rules.map((r) => r.id.length));
        for (const r of rules) {
            lines.push(`  ${paintLevel(c, r.level)}  ${r.id.padEnd(width)}  ${c.dim(r.kind)}  ${c.cyan(r.source)}`);
            if (r.description !== undefined) {
                lines.push(`         ${' '.repeat(width)}  ${c.dim(r.description)}`);
            }
        }
        if (rules.length === 0) {
            lines.push(`  ${c.dim('no rules in force')}`);
        }
    }
    for (const error of run.errors) {
        lines.push(`${c.red('error:')} ${error}`);
    }
    lines.push(`${c.bold('mUnit lint:')} ${lists.length} file${lists.length === 1 ? '' : 's'}, rules listed`);
    return lines.join('\n');
}
function render(run, format, options = { colour: false }) {
    switch (format) {
        case 'json':
            return renderJson(run);
        case 'junit':
            return renderJUnit(run);
        case 'text':
            return renderText(run, options);
    }
}
//# sourceMappingURL=report.js.map