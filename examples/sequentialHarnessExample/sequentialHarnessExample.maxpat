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
        "rect": [ 134.0, 164.0, 900.0, 460.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 559.0, 46.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 559.0, 79.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
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
                    "patching_rect": [ 20.0, 15.0, 530.0, 24.0 ],
                    "text": "A test folder, run one patch at a time"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 8,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 530.0, 114.0 ],
                    "text": "[mUnit.harness] opens every patch in a folder that matches @pattern (default *.maxpat), searching subfolders with @recursive 1. With @sequential 1 it opens, runs and closes one patch at a time, so tests can't interfere through shared [s]/[r] names, DSP state or CPU load. Each patch's [mUnit.teardown] fires before that patch is closed; the result files are written once at the end.\n\nHere tests/ holds test_one, test_two, more/test_three and a helper.maxpat that the pattern leaves out."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 185.0, 520.0, 22.0 ],
                    "text": "mUnit.harness @loadFolder tests @pattern test_*.maxpat @recursive 1 @sequential 1"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 20.0, 225.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 280.0, 710.0, 100.0 ],
                    "text": "The same suite from the command line, which starts Max, runs it and exits 0 or 1:\n  munit run <this folder>/testWrangler.maxpat\nor, from munit.config.js and the folder of tests without this patch:\n  munit run <this folder> --tests tests --sequential\n\nThe \"munit\" command comes from the munit-cli npm package (npm install --save-dev munit-cli)\nthe same script ships in this Max package as javascript/nodejs/runner/munit-cli.js"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
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