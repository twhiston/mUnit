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
                    "text": "lintMe.maxpat with every finding fixed: a [t b b] orders the prints, [list.reg] replaces [zl reg], the attributes are set, one [metro] drives the send, a lower_snake_case send name with its receive, and a named subpatcher. `munit lint .` reports nothing here."
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
                    "id": "obj-t",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "bang",
                        "bang"
                    ],
                    "patching_rect": [
                        30.0,
                        150.0,
                        40.0,
                        22.0
                    ],
                    "text": "t b b"
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
                        190.0,
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
                        190.0,
                        80.0,
                        22.0
                    ],
                    "text": "print second"
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
                        54.0,
                        22.0
                    ],
                    "text": "list.reg"
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
                        100.0,
                        22.0
                    ],
                    "text": "v8 @autowatch 0"
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
                        86.0,
                        22.0
                    ],
                    "text": "coll @embed 1"
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
                    "id": "obj-send",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        300.0,
                        300.0,
                        100.0,
                        22.0
                    ],
                    "text": "s my_good_name"
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
                        56.0,
                        22.0
                    ],
                    "text": "p named",
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
            },
            {
                "box": {
                    "id": "obj-recv",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        420.0,
                        300.0,
                        100.0,
                        22.0
                    ],
                    "text": "r my_good_name"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-t",
                        0
                    ],
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
                    "source": [
                        "obj-t",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-p1",
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
                        "obj-send",
                        0
                    ],
                    "source": [
                        "obj-m1",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
