{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 2,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [ 134.0, 167.0, 1140.0, 600.0 ],
        "boxes": [
            {
                "box": {
                    "angle": 0.0,
                    "background": 1,
                    "bgcolor": [ 0.16, 0.17, 0.2, 1 ],
                    "id": "hdr-panel",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 0.0, 0.0, 1140.0, 64.0 ],
                    "proportion": 0.39,
                    "shadow": -1
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "hdr-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 11.0, 970.0, 29.0 ],
                    "text": "Dicts, snapshots and taking references",
                    "textcolor": [ 0.97, 0.97, 0.97, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "hdr-sub",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 41.0, 970.0, 20.0 ],
                    "text": "snapshot(in1) compares a dict with references/<name>.json next to the patch; a missing reference fails",
                    "textcolor": [ 0.75, 0.77, 0.82, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "this example's folder: the patch, its config, references and results",
                    "id": "hdr-open",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 1010.0, 20.0, 110.0, 24.0 ],
                    "text": "Open folder"
                }
            },
            {
                "box": {
                    "hidden": 1,
                    "id": "hdr-openfolder",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 955.0, 68.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontsize": 12.0,
                    "id": "obj-18",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 357.0, 375.0, 52.0 ],
                    "text": "For a reference named differently from @name, pass the name as the second argument of snapshot",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontsize": 12.0,
                    "id": "obj-19",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 284.0, 247.0, 52.0 ],
                    "text": "The asserts will look for a reference file with @name",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "color": [ 0.46, 0.46, 0.46, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 325.0, 263.0, 22.0 ],
                    "text": "mUnit.assert snapshot(in1) @name alsoMissing"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 295.5, 183.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 96.0, 554.0, 74.0 ],
                    "text": "A dict on a data inlet arrives as a plain object, so in1.name works in an expression and snapshot(in1) can compare the whole thing with a reference file.\n\nReferences live in references/<name>.json next to the test patch. The name is the assert's @name, or the second argument of snapshot(). Numbers survive the JSON round trip, so the comparison is exact."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1010.0, 96.0, 98.5, 22.0 ],
                    "text": "mUnit.harness"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 1010.0, 136.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.5, 222.0, 300.0, 22.0 ],
                    "text": "clear, set name munit, set sizes 1 2 3, bang"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 295.5, 256.0, 40.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 1,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    },
                    "text": "dict"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontsize": 12.0,
                    "id": "obj-9",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 284.0, 270.0, 52.0 ],
                    "text": "Passes: the dict matches references/settings.json",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "color": [ 0.46, 0.46, 0.46, 1.0 ],
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 325.0, 285.5, 22.0 ],
                    "text": "mUnit.assert snapshot(in1) @name settings"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontsize": 12.0,
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 369.0, 280.0, 39.0 ],
                    "text": "Passes: a key of the dict in an expression",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "color": [ 0.46, 0.46, 0.46, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 405.0, 324.5, 22.0 ],
                    "text": "mUnit.assert in1.name === 'munit' @name dictKey"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 757.0, 295.0, 293.0, 74.0 ],
                    "text": "Fails on purpose: there is no references/missing.json or references/alsoMissing.json yet. \nThe console message says how to take it, and the dict it got is kept as logs/artifacts/<uuid>/missing.actual.json"
                }
            },
            {
                "box": {
                    "color": [ 0.46, 0.46, 0.46, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 367.0, 405.0, 389.5, 22.0 ],
                    "text": "mUnit.assert \"snapshot(in1, 'missing')\" @name notRecorded"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 450.0, 727.5, 114.0 ],
                    "text": "Taking references makes every snapshot write what it gets as the new reference, and pass. Turn it on with:\n-  `munit run --take-references`\n- MUNIT_TAKE_REFERENCES=1\n- takeReferences: true in munit.config.js\n- send the message \"takeReferences 1\" to the [mUnit.handler] before the next run (reopen the patch to run again). \n\nTo test that in this patch hit take references, run the test, close the patch and open it again. The tests will then pass.\nThen you may want to go to the example folder and delete the references"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 897.0, 96.0, 105.0, 22.0 ],
                    "text": "takeReferences 1"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "fontsize": 12.0,
                    "id": "bub-dict",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 329.5, 181.0, 190.0, 24.0 ],
                    "text": "click to send the dict again",
                    "textjustification": 1
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "hdr-openfolder", 0 ],
                    "hidden": 1,
                    "source": [ "hdr-open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "order": 3,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "midpoints": [ 305.0, 237.0, 344.0, 237.0 ],
                    "order": 2,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 1 ],
                    "midpoints": [ 305.0, 237.0, 747.0, 237.0 ],
                    "order": 0,
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-6", 1 ],
                    "midpoints": [ 305.0, 237.0, 619.5, 237.0 ],
                    "order": 1,
                    "source": [ "obj-8", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}