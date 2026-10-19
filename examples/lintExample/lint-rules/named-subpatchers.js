// A script rule: every subpatcher box must have a name, so the patch reads
// as [p input] > [p filter] rather than [p] > [p]. Which objects count comes
// from the rule's "options" in script.json.
//
// munit lint (and [mUnit.lint] in Max) loads this module with require and
// calls check(ctx) once per file, with the patchers in the rule's scope. The
// example's jsconfig.json points an editor at api/munit-lint.d.ts, so
// `ctx.` completes here.

/** @type {import("munit-lint").ScriptCheck} */
exports.check = (ctx) => {
  const objects = new Set(/** @type {{ objects?: string[] }} */ (ctx.options ?? {}).objects ?? ["p"]);
  for (const patcher of ctx.patchers) {
    for (const box of patcher.boxes) {
      if (box.object !== null && objects.has(box.object) && box.args.length === 0) {
        ctx.report({ box, message: `give this [${box.object}] a name, e.g. [${box.object} input]` });
      }
    }
  }
};
