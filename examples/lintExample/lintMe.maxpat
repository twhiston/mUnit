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
            665.0,
            280.0,
            580.0,
            440.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-c1",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        500.0,
                        60.0
                    ],
                    "text": "Every rule in lint-rules/ fires once on this patch: run `munit lint .` here, or save it with lintExample.maxpat open and read the Max console. clean.maxpat is the same patch with every finding fixed; `munit lint . --fix` fixes the three that have fixes."
                }
            },
            {
                "box": {
                    "id": "obj-c2",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        95.0,
                        340.0,
                        20.0
                    ],
                    "text": "fanout-without-trigger: one outlet, two inlets, no [trigger]"
                }
            },
            {
                "box": {
                    "id": "obj-btn",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "parameter_enable": 0,
                    "patching_rect": [
                        30.0,
                        120.0,
                        24.0,
                        24.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-p1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        170.0,
                        70.0,
                        22.0
                    ],
                    "text": "print first"
                }
            },
            {
                "box": {
                    "id": "obj-p2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        123.0,
                        170.0,
                        80.0,
                        22.0
                    ],
                    "text": "print second"
                }
            },
            {
                "box": {
                    "id": "obj-c3",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        215.0,
                        180.0,
                        20.0
                    ],
                    "text": "forbid-object, with a fix"
                }
            },
            {
                "box": {
                    "id": "obj-zl",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        240.0,
                        46.0,
                        22.0
                    ],
                    "text": "zl reg"
                }
            },
            {
                "box": {
                    "id": "obj-c4",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        275.0,
                        260.0,
                        20.0
                    ],
                    "text": "require-attribute: @autowatch is missing"
                }
            },
            {
                "box": {
                    "id": "obj-v8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        300.0,
                        30.0,
                        22.0
                    ],
                    "text": "v8"
                }
            },
            {
                "box": {
                    "id": "obj-c5",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        335.0,
                        260.0,
                        20.0
                    ],
                    "text": "attribute-value: @embed 1 is missing"
                }
            },
            {
                "box": {
                    "id": "obj-coll",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [
                        "",
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        360.0,
                        36.0,
                        22.0
                    ],
                    "text": "coll"
                }
            },
            {
                "box": {
                    "id": "obj-c6",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        215.0,
                        240.0,
                        20.0
                    ],
                    "text": "max-instances: one [metro] per patcher"
                }
            },
            {
                "box": {
                    "id": "obj-m1",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        300.0,
                        240.0,
                        64.0,
                        22.0
                    ],
                    "text": "metro 100"
                }
            },
            {
                "box": {
                    "id": "obj-m2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        380.0,
                        240.0,
                        64.0,
                        22.0
                    ],
                    "text": "metro 100"
                }
            },
            {
                "box": {
                    "id": "obj-c7",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        275.0,
                        260.0,
                        20.0
                    ],
                    "text": "naming: send names are lower_snake_case"
                }
            },
            {
                "box": {
                    "id": "obj-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        300.0,
                        82.0,
                        22.0
                    ],
                    "text": "s MyBadName"
                }
            },
            {
                "box": {
                    "id": "obj-c8",
                    "linecount": 1,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        335.0,
                        220.0,
                        20.0
                    ],
                    "text": "script: a [p] without a name"
                }
            },
            {
                "box": {
                    "id": "obj-p",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        360.0,
                        24.0,
                        22.0
                    ],
                    "text": "p",
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
                            400.0,
                            300.0
                        ],
                        "boxes": [],
                        "lines": [],
                        "autosave": 0
                    }
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-p1",
                        0
                    ],
                    "order": 1,
                    "source": [
                        "obj-btn",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p2",
                        0
                    ],
                    "order": 0,
                    "source": [
                        "obj-btn",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
