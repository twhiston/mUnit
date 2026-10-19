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
        "rect": [ 134.0, 167.0, 1137.0, 560.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 582.5, 16.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 582.5, 49.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-of1c",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 662.5, 16.0, 190.0, 20.0 ],
                    "text": "this example's files and results"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 317.0, 375.0, 33.0 ],
                    "text": "If you need the reference file and the test @name to be different pass the file name as the second argument to snapshot"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 239.0, 243.0, 33.0 ],
                    "text": "The asserts will look for a reference file with @name"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 366.0, 274.0, 263.0, 22.0 ],
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
                    "patching_rect": [ 295.5, 132.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 554.0, 24.0 ],
                    "text": "Dicts, snapshots and taking references"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 554.0, 74.0 ],
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
                    "patching_rect": [ 888.0, 15.0, 98.5, 22.0 ],
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
                    "patching_rect": [ 888.0, 55.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 888.0, 88.0, 226.0, 60.0 ],
                    "text": "mUnit.harness reads munit.config.js from this folder and configures mUnit.handler. Every [mUnit.loadbang] then fires."
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 295.5, 171.0, 300.0, 22.0 ],
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
                    "patching_rect": [ 295.5, 205.0, 40.0, 22.0 ],
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
                    "id": "obj-9",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 239.0, 270.0, 33.0 ],
                    "text": "Passes: the dict matches references/settings.json"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 274.0, 285.5, 22.0 ],
                    "text": "mUnit.assert snapshot(in1) @name settings"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 330.0, 280.0, 20.0 ],
                    "text": "Passes: a key of the dict in an expression"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 29.0, 354.0, 324.5, 22.0 ],
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
                    "patching_rect": [ 757.0, 244.0, 293.0, 74.0 ],
                    "text": "Fails on purpose: there is no references/missing.json or references/alsoMissing.json yet. \nThe console message says how to take it, and the dict it got is kept as logs/artifacts/<uuid>/missing.actual.json"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 367.0, 354.0, 389.5, 22.0 ],
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
                    "patching_rect": [ 29.0, 399.0, 727.5, 114.0 ],
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
                    "patching_rect": [ 995.0, 29.0, 105.0, 22.0 ],
                    "text": "takeReferences 1"
                }
            }
        ],
        "lines": [
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
            },
            {
                "patchline": {
                    "destination": [ "obj-of2", 0 ],
                    "source": [ "obj-of1", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}