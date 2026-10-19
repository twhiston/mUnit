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
            580.0,
            253.0
        ],
        "gridsize": [
            15.0,
            15.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-c1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        520.0,
                        58.0
                    ],
                    "text": "Save this patch with lintConfigExample.maxpat open: clean. The same [zl.reg] is here, but the config has an override for project/legacy/** that turns no-zl-reg off. Move the patch up into project/ and the warning comes back.",
                    "linecount": 3
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
                        93.0,
                        24.0,
                        24.0
                    ]
                }
            },
            {
                "box": {
                    "id": "obj-list",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        90.0,
                        93.0,
                        50.0,
                        22.0
                    ],
                    "text": "1 2 3"
                }
            },
            {
                "box": {
                    "id": "obj-reg",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        30.0,
                        138.0,
                        60.0,
                        22.0
                    ],
                    "text": "zl.reg"
                }
            },
            {
                "box": {
                    "id": "obj-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        30.0,
                        183.0,
                        70.0,
                        22.0
                    ],
                    "text": "print old"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-reg",
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
                        "obj-reg",
                        1
                    ],
                    "source": [
                        "obj-list",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-print",
                        0
                    ],
                    "source": [
                        "obj-reg",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
