// A script rule that uses the context helpers: every [send] in a file needs
// a [receive] of the same name in the same file (and the other way round),
// and a [send] with nothing connected to its inlet sends nothing. The names
// in options.ignore live in another patch, so they are left alone.
//
// munit lint (and [mUnit.lint] in Max) validates options against meta.options
// before any patch is linted, so a misspelt option is a config error, and
// prints meta.description with --list-rules.

/** @type {import("munit-lint").ScriptMeta} */
exports.meta = {
  description: "every send has a receive of the same name in the file, and a send has a cord into it",
  options: {
    type: "object",
    properties: {
      ignore: { type: "array", items: { type: "string" }, description: "names that are sent or received in another patch" },
    },
    additionalProperties: false,
  },
};

/** @type {import("munit-lint").ScriptCheck} */
exports.check = (ctx) => {
  const ignore = new Set(/** @type {{ ignore?: string[] }} */ (ctx.options ?? {}).ignore ?? []);
  const sent = new Set(ctx.sends().map((s) => s.name));
  const received = new Set(ctx.receives().map((r) => r.name));
  for (const s of ctx.sends()) {
    if (s.role === "send" && !received.has(s.name) && !ignore.has(s.name)) {
      ctx.report({ box: s.box, message: `nothing in this patch receives "${s.name}"` });
    }
    if (s.role === "send" && ctx.connectionsTo(s.box, 0).length === 0) {
      ctx.report({ box: s.box, message: `nothing is connected to [${s.box.text}], so it never sends` });
    }
  }
  for (const r of ctx.receives()) {
    if (r.role === "receive" && !sent.has(r.name) && !ignore.has(r.name)) {
      ctx.report({ box: r.box, message: `nothing in this patch sends to "${r.name}"` });
    }
  }
};
