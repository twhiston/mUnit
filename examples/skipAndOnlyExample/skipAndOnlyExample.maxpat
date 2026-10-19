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
        "rect": [ 126.0, 136.0, 1287.0, 438.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-18",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 647.0, 292.0, 246.0, 33.0 ],
                    "text": "Would fail, but is reported as skipped because another assert has @only"
                }
            },
            {
                "box": {
                    "id": "obj-19",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 952.0, 292.0, 29.5, 22.0 ],
                    "text": "2"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 647.0, 327.0, 324.0, 22.0 ],
                    "text": "mUnit.assert in1 == 1 @name failed"
                }
            },
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 504.0, 44.5, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 504.0, 93.5, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-of1c",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 584.0, 44.5, 87.0, 47.0 ],
                    "text": "this example's files and results"
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
                    "patching_rect": [ 20.0, 15.0, 600.0, 24.0 ],
                    "text": "@skip and @only"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 11,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 485.0, 154.0 ],
                    "text": "Sometimes while working on tests you may want to disable an assertion which currently fails, or disable all but one test in the file while you develop it. @skip and @only allow you to do this.\n\n@skip 1 reports an assert as skipped without evaluating it; skipped asserts count neither as passed nor failed, and JUnit shows them as <skipped/>.\n\n@only 1 on any assert makes the handler run that assert alone: every other assert in the suite is reported as skipped, whatever it found. It is for focusing on one test while working on it. \nSet forbidOnly: true in munit.config.js (as in CI) to fail the suite if an @only slips in."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 695.0, 15.0, 98.5, 22.0 ],
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
                    "patching_rect": [ 695.0, 55.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 695.0, 85.0, 161.0, 74.0 ],
                    "text": "mUnit.harness reads munit.config.js from this folder and configures mUnit.handler. Every [mUnit.loadbang] then fires."
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 213.0, 105.0, 22.0 ],
                    "text": "mUnit.loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 20.0, 248.0, 1188.0, 22.0 ],
                    "text": "t b b b b"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 995.0, 281.0, 190.0, 47.0 ],
                    "text": "Would pass, but is reported as skipped because another assert has @only"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1189.0, 292.0, 30.0, 22.0 ],
                    "text": "1"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 995.0, 327.0, 213.0, 22.0 ],
                    "text": "mUnit.assert in1 == 1 @name normal"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 292.0, 254.0, 33.0 ],
                    "text": "Skipped: @skip 1. The input is never looked at"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 605.0, 292.0, 30.0, 22.0 ],
                    "text": "0"
                }
            },
            {
                "box": {
                    "color": [ 0.9450980392156862, 0.7686274509803921, 0.058823529411764705, 1.0 ],
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 327.0, 324.0, 22.0 ],
                    "text": "mUnit.assert in1 == 1 @skip 1 @name notReady"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 293.0, 211.0, 20.0 ],
                    "text": "Runs, and passes: the @only assert"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 256.0, 292.0, 30.0, 22.0 ],
                    "text": "2"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 327.0, 255.0, 22.0 ],
                    "text": "mUnit.assert in1 == 2 @only 1 @name focus"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 300.0, 360.0, 324.0, 47.0 ],
                    "text": "Remove @only 1 from the third assert to see the first one pass as well. The console summary shows \"skip\" for skipped asserts."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-13", 1 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 1 ],
                    "source": [ "obj-19", 0 ]
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
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-7", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-7", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-9", 0 ]
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