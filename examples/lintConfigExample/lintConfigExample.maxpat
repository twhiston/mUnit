{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 1,
            "revision": 4,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            100.0,
            100.0,
            820.0,
            1085.0
        ],
        "gridsize": [
            15.0,
            15.0
        ],
        "boxes": [ {"box": {"id": "obj-of1", "maxclass": "message", "text": "open folder", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [600.0, 1065.0, 75.0, 22.0]}}, {"box": {"id": "obj-of2", "maxclass": "newobj", "text": "mUnit.examples.openFolder", "numinlets": 1, "numoutlets": 0, "patching_rect": [600.0, 1098.0, 165.0, 22.0]}}, {"box": {"id": "obj-of1c", "maxclass": "comment", "text": "this example's files and results", "numinlets": 1, "numoutlets": 0, "patching_rect": [680.0, 1065.0, 190.0, 20.0]}},
            {
                "box": {
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        15.0,
                        600.0,
                        26.0
                    ],
                    "text": "Which munit-lint.json applies?",
                    "fontsize": 14.0,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-intro",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        45.0,
                        760.0,
                        41.0
                    ],
                    "text": "[mUnit.lint @folder project @rules extra-rules.json] below watches the project folder next to this patch. Rules come from munit-lint.json files, and in a large project several of them take part. How they combine:",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-p1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        92.0,
                        760.0,
                        23.0
                    ],
                    "text": "1. @config <file> wins when it is given (relative to this patch). That one file applies alone, to every file linted."
                }
            },
            {
                "box": {
                    "id": "obj-p2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        118.0,
                        760.0,
                        58.0
                    ],
                    "text": "2. Otherwise configs cascade. The ones that apply to a file are every munit-lint.json in its folder and in the folders above it, up to one that says \"root\": true or the top of the disk, applied outermost first. For project/main.maxpat that is the munit-lint.json next to this patch. For project/strict/strict.maxpat it is that one and then strict's own on top.",
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-p3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        179.0,
                        760.0,
                        58.0
                    ],
                    "text": "3. Each inner config adds to the outer ones rather than replacing them: its rules join the set (a rule with an id already seen replaces that rule), its overrides apply after the outer ones, its ignore patterns add to theirs, and its files list, when it has one, replaces theirs. So an inner folder can be stricter or looser without repeating what it inherits.",
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-p4",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        240.0,
                        760.0,
                        58.0
                    ],
                    "text": "4. Every path in a config is relative to the folder of that config file: rule files and globs in rules, and the patterns in files, ignore and overrides. That is why the outer config says project/**/*.maxpat and project/legacy/**. An override that leaves files out applies to everything under its config.",
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-p5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        301.0,
                        760.0,
                        41.0
                    ],
                    "text": "5. @rules adds rule files as the innermost layer, like --rules on the command line (extra-rules.json here). Within one config or rule file an id may appear only once.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-p6",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        345.0,
                        760.0,
                        41.0
                    ],
                    "text": "6. No munit-lint.json in the folder or anywhere above it: the built-in mUnit:recommended set alone, and the console says so.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-p7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        389.0,
                        760.0,
                        41.0
                    ],
                    "text": "7. The patch in front is linted when you save it even when it lies outside the watched folder, with the watched folder's configs, as if it were inside.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-p8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        433.0,
                        760.0,
                        41.0
                    ],
                    "text": "8. The command line does the same for each file it visits: munit lint <this folder>/project (npm install --save-dev munit-cli, or node .../javascript/nodejs/runner/munit-cli.js in the package) reports exactly what this object does. --config <file> turns the cascade off and applies that file alone.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-p9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        477.0,
                        760.0,
                        58.0
                    ],
                    "text": "9. \"root\": true in a config stops the walk there. This example's outer config says it, so nothing above the example folder can change its results. Without it, a munit-lint.json in your home folder or in Max's Documents folder is a baseline for every project below it.",
                    "linecount": 3
                }
            },
            {
                "box": {
                    "id": "obj-p10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        538.0,
                        760.0,
                        41.0
                    ],
                    "text": "10. The name has a hyphen on purpose. A file called munit.lint.json shadows the [mUnit.lint] object in Max, which then fails to load; the linter refuses that name with an error that says so.",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-try",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        590.0,
                        600.0,
                        26.0
                    ],
                    "text": "Try it",
                    "fontsize": 14.0,
                    "fontface": 1
                }
            },
            {
                "box": {
                    "id": "obj-try1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        620.0,
                        760.0,
                        128.0
                    ],
                    "text": "Open a patch below, save it, and read the Max console. On start the console names the configs in force and the ones subfolders add.\nproject/main.maxpat: two warnings. [zl.reg] breaks no-zl-reg from munit-lint.json; the bare [print] breaks named-print from extra-rules.json.\nproject/legacy/old.maxpat: clean. The override for project/legacy/** turns no-zl-reg off there.\nproject/strict/strict.maxpat: a blocking error. strict/munit-lint.json sits on top of the outer config and raises no-zl-reg to block for everything in strict/.",
                    "linecount": 7
                }
            },
            {
                "box": {
                    "id": "obj-m1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        762.0,
                        35.0,
                        22.0
                    ],
                    "text": "lint"
                }
            },
            {
                "box": {
                    "id": "obj-m2",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        75.0,
                        762.0,
                        145.0,
                        22.0
                    ],
                    "text": "lint project/main.maxpat"
                }
            },
            {
                "box": {
                    "id": "obj-m3",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        230.0,
                        762.0,
                        170.0,
                        22.0
                    ],
                    "text": "lint project/strict/strict.maxpat"
                }
            },
            {
                "box": {
                    "id": "obj-m4",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        410.0,
                        762.0,
                        45.0,
                        22.0
                    ],
                    "text": "status"
                }
            },
            {
                "box": {
                    "id": "obj-mc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        465.0,
                        763.0,
                        300.0,
                        41.0
                    ],
                    "text": "the folder again, one file (relative to this patch), what the front-window helper has seen",
                    "linecount": 2
                }
            },
            {
                "box": {
                    "id": "obj-lint",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        802.0,
                        300.0,
                        22.0
                    ],
                    "text": "mUnit.lint @folder project @rules extra-rules.json"
                }
            },
            {
                "box": {
                    "id": "obj-pf",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        30.0,
                        842.0,
                        90.0,
                        22.0
                    ],
                    "text": "print findings"
                }
            },
            {
                "box": {
                    "id": "obj-pl",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        241.0,
                        842.0,
                        100.0,
                        22.0
                    ],
                    "text": "print mUnit.lint"
                }
            },
            {
                "box": {
                    "id": "obj-foot",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        882.0,
                        760.0,
                        163.0
                    ],
                    "text": "The folder on disk:\nlintConfigExample/\n    lintConfigExample.maxpat        this patch\n    munit-lint.json                 the outer config, \"root\": true; found from every folder under project/\n    extra-rules.json                added by @rules, innermost\n    project/main.maxpat             the outer config and extra-rules.json\n    project/legacy/old.maxpat       the same, with no-zl-reg off by an override in the outer config\n    project/strict/munit-lint.json  cascades onto the outer config for the files in strict/\n    project/strict/strict.maxpat    outer config, then strict's, then extra-rules.json",
                    "linecount": 9
                }
            }
        ],
        "lines": [ {"patchline": {"destination": ["obj-of2", 0], "source": ["obj-of1", 0]}},
            {
                "patchline": {
                    "destination": [
                        "obj-lint",
                        0
                    ],
                    "source": [
                        "obj-m1",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-lint",
                        0
                    ],
                    "source": [
                        "obj-m2",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-lint",
                        0
                    ],
                    "source": [
                        "obj-m3",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-lint",
                        0
                    ],
                    "source": [
                        "obj-m4",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pf",
                        0
                    ],
                    "source": [
                        "obj-lint",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-pl",
                        0
                    ],
                    "source": [
                        "obj-lint",
                        1
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
