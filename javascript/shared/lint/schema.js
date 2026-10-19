"use strict";
/* @license
 * ************************************************************
 * Copyright: (C) 2026 Tom Whiston
 *            SPDX-License-Identifier: LicenseRef-Prosperity-3.0.0
 * ************************************************************
*/
Object.defineProperty(exports, "__esModule", { value: true });
exports.validateAgainstSchema = validateAgainstSchema;
function typeOf(value) {
    if (value === null) {
        return 'null';
    }
    if (Array.isArray(value)) {
        return 'array';
    }
    return typeof value;
}
function show(value) {
    try {
        const text = JSON.stringify(value) ?? String(value);
        return text.length > 60 ? `${text.slice(0, 60)}…` : text;
    }
    catch {
        return String(value);
    }
}
function hasType(value, type) {
    if (type === 'integer') {
        return typeof value === 'number' && Number.isInteger(value);
    }
    return typeOf(value) === type;
}
function sameJson(a, b) {
    try {
        return JSON.stringify(a) === JSON.stringify(b);
    }
    catch {
        return false;
    }
}
function validateAgainstSchema(value, schema, path = 'options') {
    const errors = [];
    const types = schema.type === undefined ? [] : Array.isArray(schema.type) ? schema.type : [schema.type];
    if (types.length > 0 && !types.some((t) => hasType(value, t))) {
        errors.push(`${path} must be ${types.join(' or ')}, got ${typeOf(value) === 'number' ? show(value) : typeOf(value)}`);
        return errors;
    }
    if (schema.enum !== undefined && !schema.enum.some((e) => sameJson(e, value))) {
        errors.push(`${path} must be one of ${schema.enum.map(show).join(', ')}, got ${show(value)}`);
    }
    if (schema.const !== undefined && !sameJson(schema.const, value)) {
        errors.push(`${path} must be ${show(schema.const)}, got ${show(value)}`);
    }
    if (typeof value === 'string') {
        if (schema.minLength !== undefined && value.length < schema.minLength) {
            errors.push(`${path} must be at least ${schema.minLength} character(s) long`);
        }
        if (schema.maxLength !== undefined && value.length > schema.maxLength) {
            errors.push(`${path} must be at most ${schema.maxLength} character(s) long`);
        }
        if (schema.pattern !== undefined && !new RegExp(schema.pattern).test(value)) {
            errors.push(`${path} must match /${schema.pattern}/, got ${show(value)}`);
        }
    }
    if (typeof value === 'number') {
        if (schema.minimum !== undefined && value < schema.minimum) {
            errors.push(`${path} must be at least ${schema.minimum}, got ${show(value)}`);
        }
        if (schema.maximum !== undefined && value > schema.maximum) {
            errors.push(`${path} must be at most ${schema.maximum}, got ${show(value)}`);
        }
    }
    if (Array.isArray(value)) {
        if (schema.minItems !== undefined && value.length < schema.minItems) {
            errors.push(`${path} must have at least ${schema.minItems} item(s)`);
        }
        if (schema.maxItems !== undefined && value.length > schema.maxItems) {
            errors.push(`${path} must have at most ${schema.maxItems} item(s)`);
        }
        if (schema.items !== undefined) {
            value.forEach((item, i) => errors.push(...validateAgainstSchema(item, schema.items, `${path}[${i}]`)));
        }
    }
    if (typeOf(value) === 'object') {
        const record = value;
        for (const key of schema.required ?? []) {
            if (!(key in record)) {
                errors.push(`${path}.${key} is required`);
            }
        }
        const known = schema.properties ?? {};
        for (const key of Object.keys(record)) {
            const sub = known[key];
            if (sub !== undefined) {
                errors.push(...validateAgainstSchema(record[key], sub, `${path}.${key}`));
            }
            else if (schema.additionalProperties === false) {
                const names = Object.keys(known);
                errors.push(`${path}.${key} is not a known option${names.length > 0 ? `; use ${names.join(', ')}` : ''}`);
            }
            else if (typeof schema.additionalProperties === 'object') {
                errors.push(...validateAgainstSchema(record[key], schema.additionalProperties, `${path}.${key}`));
            }
        }
    }
    if (schema.allOf !== undefined) {
        for (const sub of schema.allOf) {
            errors.push(...validateAgainstSchema(value, sub, path));
        }
    }
    if (schema.anyOf !== undefined && !schema.anyOf.some((sub) => validateAgainstSchema(value, sub, path).length === 0)) {
        errors.push(`${path} matches none of the allowed forms, got ${show(value)}`);
    }
    if (schema.oneOf !== undefined) {
        const matches = schema.oneOf.filter((sub) => validateAgainstSchema(value, sub, path).length === 0).length;
        if (matches !== 1) {
            errors.push(`${path} must match exactly one of the allowed forms, matches ${matches}, got ${show(value)}`);
        }
    }
    if (schema.not !== undefined && validateAgainstSchema(value, schema.not, path).length === 0) {
        errors.push(`${path} must not be ${show(value)}`);
    }
    return errors;
}
//# sourceMappingURL=schema.js.map