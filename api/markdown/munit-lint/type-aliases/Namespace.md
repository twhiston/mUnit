[munit-lint](../README.md) / Namespace

# Type Alias: Namespace

```ts
type Namespace = "box" | "dsp.gen" | "jit.gen" | "rnbo" | string;
```

What kind of patcher: `box` for an ordinary Max patcher, `dsp.gen` inside
`[gen~]` and `.gendsp` files, `jit.gen` inside `[jit.gen]`, `[jit.pix]` and
`[jit.gl.pix]`, `rnbo` inside `[rnbo~]` and `.rnbopat` files. Max's
`classnamespace`, so other values are possible.
