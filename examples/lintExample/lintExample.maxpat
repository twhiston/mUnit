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
        "rect": [ 81.0, 150.0, 864.0, 520.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-7",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 16.0, 8.0, 530.0, 24.0 ],
                    "text": "Linting"
                }
            },
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 548.0, 39.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 548.0, 72.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-c1",
                    "linecount": 11,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 16.0, 39.0, 526.0, 154.0 ],
                    "text": "mUnit also includes a full suite of linting tools which work both live inside of Max and standalone on the CLI (no max installation needed) so you can use it in CI environments.\n\nLint on demand: [mUnit.lint] watches @folder and lints every patch there as you save it. \nHit lint below and check the console output, then open the folder, edit the\nOpen this examples lintMe.maxpat, change something, save, and read the Max console. \n\nThe rules come from munit-lint.json next to this patch, and to make the linting experience your own you're probably going to end up writing your own linting rules and reconfiguring the linter for the rules which you wish to enforce. Check the mUnit.linter help, the package README.md and the api/ folder in the package for more information about how to do this."
                }
            },
            {
                "box": {
                    "id": "obj-lint",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "started" ],
                    "patching_rect": [ 16.0, 262.0, 191.0, 22.0 ],
                    "text": "mUnit.lint @folder . @followfront 0"
                }
            },
            {
                "box": {
                    "id": "obj-msg",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 16.0, 208.0, 35.0, 22.0 ],
                    "text": "lint"
                }
            },
            {
                "box": {
                    "id": "obj-c2",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 61.0, 208.0, 94.0, 47.0 ],
                    "text": "lint everything in the folder again"
                }
            },
            {
                "box": {
                    "id": "obj-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 188.0, 311.0, 100.0, 22.0 ],
                    "text": "print mUnit.lint"
                }
            },
            {
                "box": {
                    "id": "obj-dict",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 16.0, 311.0, 110.0, 22.0 ],
                    "text": "print findings"
                }
            },
            {
                "box": {
                    "id": "obj-c3",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 16.0, 346.0, 240.0, 47.0 ],
                    "text": "The left outlet carries the findings as a dict, for building your own UI on them; the right one passes the server's messages through."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-dict", 0 ],
                    "source": [ "obj-lint", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print", 0 ],
                    "source": [ "obj-lint", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lint", 0 ],
                    "source": [ "obj-msg", 0 ]
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