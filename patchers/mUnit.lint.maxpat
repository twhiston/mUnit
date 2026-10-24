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
            715.0,
            166.0,
            761.0,
            520.0
        ],
        "boxes": [
            {
                "box": {
                    "comment": "start, stop, lint, lint <path>, fix, fix <path>, folder <path>, root <0|1>, status",
                    "id": "obj-in",
                    "index": 1,
                    "maxclass": "inlet",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        30.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-c1",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        82.0,
                        17.0,
                        600.0,
                        74.0
                    ],
                    "text": "mUnit.lint: lints the patches in @folder (relative to this patch) as they are saved, with the rules in @config (default: the munit-lint.json files in the folder and above it, cascading; @root 1 stops at the folder). @followfront 0 lints the folder and below only, not the patch in front. @folder none watches no folder: the patch in front is linted on save with its own configs. @autofix 1 applies the fixes the rules describe with every lint; @output writes each lint's report to a file (@format text, json or junit; auto by extension). Findings go to the Max console: warn at WARN level, block at ERROR level."
                }
            },
            {
                "box": {
                    "id": "obj-c2",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        184.0,
                        93.0,
                        353.0,
                        60.0
                    ],
                    "text": "The node script watches the folder and whatever patch is in front (the v8 helper polls max.frontpatcher) and lints each file on save. A folder or an output file sent at run time goes through the v8 helper, which turns Max's path style into a native one."
                }
            },
            {
                "box": {
                    "id": "obj-node",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        153.5,
                        156.0,
                        290.0,
                        22.0
                    ],
                    "saved_object_attributes": {
                        "autostart": 1,
                        "defer": 0,
                        "node_bin_path": "",
                        "npm_bin_path": "",
                        "watch": 0
                    },
                    "text": "node.script munit.Lint.js @autostart 1 @watch 0",
                    "textfile": {
                        "filename": "munit.Lint.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-route",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        154.0,
                        200.0,
                        276.0,
                        22.0
                    ],
                    "text": "route findings started"
                }
            },
            {
                "box": {
                    "id": "obj-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [
                        "bang",
                        "int",
                        "home",
                        "started"
                    ],
                    "patching_rect": [
                        162.83333333333331,
                        247.0,
                        105.0,
                        22.0
                    ],
                    "text": "t b 1 home started"
                }
            },
            {
                "box": {
                    "id": "obj-args",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        153.5,
                        323.0,
                        260.0,
                        22.0
                    ],
                    "text": "patcherargs @folder . @root 0 @followfront 1 @autofix 0"
                }
            },
            {
                "box": {
                    "filename": "mUnitLint.js",
                    "id": "obj-v8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        279.0,
                        110.0,
                        22.0
                    ],
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    },
                    "text": "v8 mUnitLint.js",
                    "textfile": {
                        "filename": "mUnitLint.js",
                        "flags": 0,
                        "embed": 0,
                        "autowatch": 1
                    }
                }
            },
            {
                "box": {
                    "id": "obj-c3",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        276.0,
                        240.0,
                        406.0,
                        47.0
                    ],
                    "text": "started: open the gate, ask the v8 helper for this patch's folder (home), then re-send the attributes (folder, root, followfront, autofix, config, rules, output, format, done) to the server. The gate drops what patcherargs sends at load, before the server is ready."
                }
            },
            {
                "box": {
                    "comment": "findings <dict> after every lint",
                    "id": "obj-out1",
                    "index": 1,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        154.0,
                        415.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "comment": "started, and anything else the server says",
                    "id": "obj-out2",
                    "index": 2,
                    "maxclass": "outlet",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        411.0,
                        415.0,
                        30.0,
                        30.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-gate",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        191.5,
                        284.0,
                        40.0,
                        22.0
                    ],
                    "text": "gate"
                }
            },
            {
                "box": {
                    "id": "obj-inroute",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 4,
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        100.0,
                        142.5,
                        22.0
                    ],
                    "text": "routepass status folder output"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-gate",
                        1
                    ],
                    "midpoints": [
                        324.0,
                        348.0,
                        345.0,
                        348.0,
                        345.0,
                        297.0,
                        243.0,
                        297.0,
                        243.0,
                        279.0,
                        222.0,
                        279.0
                    ],
                    "source": [
                        "obj-args",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-node",
                        0
                    ],
                    "midpoints": [
                        201.0,
                        309.0,
                        150.0,
                        309.0,
                        150.0,
                        153.0,
                        163.0,
                        153.0
                    ],
                    "source": [
                        "obj-gate",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-inroute",
                        0
                    ],
                    "source": [
                        "obj-in",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-node",
                        0
                    ],
                    "source": [
                        "obj-inroute",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-v8",
                        0
                    ],
                    "source": [
                        "obj-inroute",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-v8",
                        0
                    ],
                    "source": [
                        "obj-inroute",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-route",
                        0
                    ],
                    "source": [
                        "obj-node",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out1",
                        0
                    ],
                    "source": [
                        "obj-route",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out2",
                        0
                    ],
                    "source": [
                        "obj-route",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-t",
                        0
                    ],
                    "source": [
                        "obj-route",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-args",
                        0
                    ],
                    "source": [
                        "obj-t",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-gate",
                        0
                    ],
                    "source": [
                        "obj-t",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-out2",
                        0
                    ],
                    "midpoints": [
                        258.3333333333333,
                        309.0,
                        420.5,
                        309.0
                    ],
                    "source": [
                        "obj-t",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-v8",
                        0
                    ],
                    "source": [
                        "obj-t",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-node",
                        0
                    ],
                    "midpoints": [
                        39.5,
                        306.0,
                        15.0,
                        306.0,
                        15.0,
                        147.0,
                        163.0,
                        147.0
                    ],
                    "source": [
                        "obj-v8",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-v8",
                        0
                    ],
                    "source": [
                        "obj-inroute",
                        2
                    ]
                }
            }
        ]
    }
}
