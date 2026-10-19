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
            347.0,
            170.0,
            520.0,
            260.0
        ],
        "boxes": [
            {
                "box": {
                    "id": "obj-c1",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        20.0,
                        440.0,
                        47.0
                    ],
                    "text": "A test patch: `munit run . --tests tests` from the example folder opens it under a generated harness. The config's override makes fan-out a blocking lint finding in tests/, where message order matters most."
                }
            },
            {
                "box": {
                    "id": "obj-lb",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        "bang"
                    ],
                    "patching_rect": [
                        30.0,
                        90.0,
                        93.0,
                        22.0
                    ],
                    "text": "mUnit.loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-one",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [
                        "int"
                    ],
                    "patching_rect": [
                        30.0,
                        130.0,
                        29.5,
                        22.0
                    ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "id": "obj-assert",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [
                        30.0,
                        170.0,
                        140.0,
                        22.0
                    ],
                    "text": "mUnit.assert in1 == 1"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [
                        "obj-one",
                        0
                    ],
                    "source": [
                        "obj-lb",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "destination": [
                        "obj-assert",
                        1
                    ],
                    "source": [
                        "obj-one",
                        0
                    ]
                }
            }
        ],
        "autosave": 0
    }
}
