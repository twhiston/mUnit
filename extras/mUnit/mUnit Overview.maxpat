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
        "rect": [ 603.0, 185.0, 900.0, 600.0 ],
        "description": "mUnit: help, examples and links",
        "digest": "Open the help patchers and examples of the mUnit package",
        "tags": "mUnit",
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "id": "tab-1",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 603.0, 211.0, 900.0, 574.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-help",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 420.0, 81.0, 22.0 ],
                                    "text": "prepend help"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-pcontrol",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 454.0, 53.0, 22.0 ],
                                    "text": "pcontrol"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-10",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 146.0, 130.0, 22.0 ],
                                    "text": "mUnit.assert"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-10-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 147.0, 500.0, 20.0 ],
                                    "text": "check a value"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-11",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 174.0, 130.0, 22.0 ],
                                    "text": "mUnit.assert~"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-11-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 175.0, 500.0, 20.0 ],
                                    "text": "check a signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-12",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 202.0, 130.0, 22.0 ],
                                    "text": "mUnit.stimulus~"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-12-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 203.0, 500.0, 20.0 ],
                                    "text": "play a repeatable test signal"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-13",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 230.0, 130.0, 22.0 ],
                                    "text": "mUnit.handler"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-13-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 231.0, 500.0, 20.0 ],
                                    "text": "run a suite and write the results"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-14",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 258.0, 130.0, 22.0 ],
                                    "text": "mUnit.harness"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-14-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 259.0, 500.0, 20.0 ],
                                    "text": "open every test patch in a folder"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-15",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 286.0, 130.0, 22.0 ],
                                    "text": "mUnit.loadbang"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-15-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 287.0, 500.0, 20.0 ],
                                    "text": "start a test once mUnit is ready"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-16",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 314.0, 130.0, 22.0 ],
                                    "text": "mUnit.teardown"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-16-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 315.0, 500.0, 20.0 ],
                                    "text": "clean up after a test"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-17",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 342.0, 130.0, 22.0 ],
                                    "text": "mUnit.lint"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-17-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 343.0, 500.0, 20.0 ],
                                    "text": "lint a folder each time you save"
                                }
                            },
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
                                    "patching_rect": [ 0.0, 0.0, 900.0, 64.0 ],
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
                                    "patching_rect": [ 20.0, 11.0, 860.0, 29.0 ],
                                    "text": "mUnit",
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
                                    "patching_rect": [ 20.0, 41.0, 860.0, 20.0 ],
                                    "text": "Unit testing for Max: asserts in your patches, results for CI, and a patcher linter",
                                    "textcolor": [ 0.75, 0.77, 0.82, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "intro",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 74.0, 860.0, 47.0 ],
                                    "text": "mUnit is a unit testing framework for Max. You build test patchers, add asserts and run them as a suite: in Max, from the command line and on CI. \nEvery help patcher has a basic tab, one tab per feature and a ? tab with the reference page. Each runs its asserts when it opens, so keep one open at a time and watch the Max console."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "ch-pcontrol", 0 ],
                                    "hidden": 1,
                                    "source": [ "ch-help", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-10", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-11", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-12", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-13", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-14", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-15", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-16", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-help", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-17", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 20.0, 20.0, 59.0, 22.0 ],
                    "text": "p Objects"
                }
            },
            {
                "box": {
                    "id": "tab-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 900.0, 574.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-1",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 398.0, 81.0, 22.0 ],
                                    "text": "prepend help"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-load",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 116.0, 398.0, 80.0, 22.0 ],
                                    "text": "prepend load"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "obj-2",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 432.0, 53.0, 22.0 ],
                                    "text": "pcontrol"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-browser",
                                    "linecount": 2,
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 300.0, 398.0, 129.0, 35.0 ],
                                    "text": ";\rmax launchbrowser $1"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "h-tools",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 76.0, 300.0, 22.0 ],
                                    "text": "Tools"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-3",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 106.0, 130.0, 22.0 ],
                                    "text": "\"mUnit Lint Server\""
                                }
                            },
                            {
                                "box": {
                                    "id": "row-3-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 107.0, 700.0, 20.0 ],
                                    "text": "lints whatever patch you save, wherever it is, uses closest lint config and posts the findings to the Max console"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 134.0, 130.0, 22.0 ],
                                    "text": "\"mUnit Glossary\""
                                }
                            },
                            {
                                "box": {
                                    "id": "row-4-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 135.0, 700.0, 20.0 ],
                                    "text": "Index of important mUnit terms and ideas, each with its help patcher, example and manual section a click away"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 162.0, 130.0, 22.0 ],
                                    "text": "\"mUnit API\""
                                }
                            },
                            {
                                "box": {
                                    "id": "row-5-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 160.0, 163.0, 700.0, 20.0 ],
                                    "text": "the JavaScript reference for developers: custom asserts, formatters, munit.config.js and script lint rules"
                                }
                            },
                            {
                                "box": {
                                    "id": "n-tools",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 190.0, 600.0, 20.0 ],
                                    "text": "All three are also in the Extras menu, under mUnit.",
                                    "textcolor": [ 0.45, 0.45, 0.47, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "h-read",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 228.0, 300.0, 22.0 ],
                                    "text": "Read more"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 258.0, 300.0, 22.0 ],
                                    "text": "https://github.com/twhiston/mUnit"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-6-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 259.0, 540.0, 20.0 ],
                                    "text": "the manual (README), on GitHub; it is also README.md in the package folder"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 286.0, 300.0, 22.0 ],
                                    "text": "https://github.com/twhiston/mUnit/releases"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-7-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 287.0, 540.0, 20.0 ],
                                    "text": "download a release"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-8",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 314.0, 300.0, 22.0 ],
                                    "text": "https://github.com/twhiston/mUnit/issues"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-8-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 315.0, 540.0, 20.0 ],
                                    "text": "report a problem"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-9",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 342.0, 300.0, 22.0 ],
                                    "text": "https://www.npmjs.com/package/munit-cli"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-9-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 330.0, 343.0, 540.0, 20.0 ],
                                    "text": "munit, the command line, on npm"
                                }
                            },
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
                                    "patching_rect": [ 0.0, 0.0, 900.0, 64.0 ],
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
                                    "patching_rect": [ 20.0, 11.0, 860.0, 29.0 ],
                                    "text": "mUnit",
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
                                    "patching_rect": [ 20.0, 41.0, 860.0, 20.0 ],
                                    "text": "Tools to help you use mUnit, and links for further reading",
                                    "textcolor": [ 0.75, 0.77, 0.82, 1.0 ]
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "hidden": 1,
                                    "source": [ "ch-load", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-2", 0 ],
                                    "hidden": 1,
                                    "source": [ "obj-1", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-3", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-browser", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-browser", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-browser", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-browser", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 20.0, 96.0, 46.0, 22.0 ],
                    "text": "p Tools"
                }
            },
            {
                "box": {
                    "id": "tab-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 0,
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
                        "rect": [ 0.0, 26.0, 900.0, 574.0 ],
                        "showontab": 1,
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
                                    "patching_rect": [ 0.0, 0.0, 900.0, 64.0 ],
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
                                    "patching_rect": [ 20.0, 11.0, 860.0, 29.0 ],
                                    "text": "mUnit",
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
                                    "patching_rect": [ 20.0, 41.0, 860.0, 20.0 ],
                                    "text": "Examples: click one to open it; each is a folder with its config and files",
                                    "textcolor": [ 0.75, 0.77, 0.82, 1.0 ]
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-load",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 580.0, 80.0, 22.0 ],
                                    "text": "prepend load"
                                }
                            },
                            {
                                "box": {
                                    "hidden": 1,
                                    "id": "ch-pcontrol",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 613.0, 53.0, 22.0 ],
                                    "text": "pcontrol"
                                }
                            },
                            {
                                "box": {
                                    "id": "intro",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 75.0, 860.0, 33.0 ],
                                    "text": "Each example is a folder: the patch, its munit.config.js and the references or scripts it needs. The Open folder button in each shows those files and the results it wrote."
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "g-Asserts",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 125.0, 300.0, 20.0 ],
                                    "text": "Asserts"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-18",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 151.0, 185.0, 22.0 ],
                                    "text": "simpleConfigExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-18-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 152.0, 235.0, 20.0 ],
                                    "text": "assert attributes and a config dict"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-19",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 187.0, 185.0, 22.0 ],
                                    "text": "expectedActualExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-19-c",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 188.0, 235.0, 33.0 ],
                                    "text": "expected versus actual, helpers, symbols and lists"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-20",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 223.0, 185.0, 22.0 ],
                                    "text": "customAssert"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-20-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 224.0, 235.0, 20.0 ],
                                    "text": "a custom assert in JavaScript"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-21",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 259.0, 185.0, 22.0 ],
                                    "text": "tableOfCasesExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-21-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 260.0, 235.0, 20.0 ],
                                    "text": "a table of cases with @every"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-22",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 295.0, 185.0, 22.0 ],
                                    "text": "snapshotExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-22-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 296.0, 235.0, 20.0 ],
                                    "text": "dicts checked against a reference file"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-23",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 331.0, 185.0, 22.0 ],
                                    "text": "skipAndOnlyExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-23-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 332.0, 235.0, 20.0 ],
                                    "text": "@skip, @only and forbidOnly"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-24",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 367.0, 185.0, 22.0 ],
                                    "text": "failureFilesExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-24-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 368.0, 235.0, 20.0 ],
                                    "text": "details and files kept with a failure"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-25",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 403.0, 185.0, 22.0 ],
                                    "text": "teardownExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-25-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 404.0, 235.0, 20.0 ],
                                    "text": "[mUnit.teardown], plain and with @hold"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "g-Linting",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 447.0, 300.0, 20.0 ],
                                    "text": "Linting"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-26",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 473.0, 185.0, 22.0 ],
                                    "text": "lintExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-26-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 474.0, 235.0, 20.0 ],
                                    "text": "one lint rule of each kind"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-27",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 509.0, 185.0, 22.0 ],
                                    "text": "lintConfigExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-27-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 215.0, 510.0, 235.0, 20.0 ],
                                    "text": "which munit-lint.json applies where"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "g-Signalsandvideo",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 460.0, 125.0, 300.0, 20.0 ],
                                    "text": "Signals and video"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-28",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 151.0, 185.0, 22.0 ],
                                    "text": "signalExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-28-c",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 152.0, 235.0, 33.0 ],
                                    "text": "signals, measured and against wav references"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-29",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 187.0, 185.0, 22.0 ],
                                    "text": "genExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-29-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 188.0, 235.0, 20.0 ],
                                    "text": "gen~ inside a signal test"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-30",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 223.0, 185.0, 22.0 ],
                                    "text": "jitterExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-30-c",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 224.0, 235.0, 33.0 ],
                                    "text": "matrices and GL shaders against .jxf references"
                                }
                            },
                            {
                                "box": {
                                    "fontface": 1,
                                    "id": "g-Runningsuites",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 460.0, 267.0, 300.0, 20.0 ],
                                    "text": "Running suites"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-31",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 293.0, 185.0, 22.0 ],
                                    "text": "loadInFolderExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-31-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 294.0, 235.0, 20.0 ],
                                    "text": "a harness over a folder of tests"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-32",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 329.0, 185.0, 22.0 ],
                                    "text": "sequentialHarnessExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-32-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 330.0, 235.0, 20.0 ],
                                    "text": "one test patch at a time"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-33",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 365.0, 185.0, 22.0 ],
                                    "text": "customResultAndLogFormatters"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-33-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 366.0, 235.0, 20.0 ],
                                    "text": "a custom log formatter"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-34",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 401.0, 185.0, 22.0 ],
                                    "text": "JUnitResultsExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-34-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 402.0, 235.0, 20.0 ],
                                    "text": "JUnit results for CI"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-35",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 460.0, 437.0, 185.0, 22.0 ],
                                    "text": "consoleErrorExample"
                                }
                            },
                            {
                                "box": {
                                    "id": "row-35-c",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 655.0, 438.0, 235.0, 20.0 ],
                                    "text": "failing on console errors"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "ch-pcontrol", 0 ],
                                    "hidden": 1,
                                    "source": [ "ch-load", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-18", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-19", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-20", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-21", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-22", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-23", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-24", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-25", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-26", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-27", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-28", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-29", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-30", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-31", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-32", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-33", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-34", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "ch-load", 0 ],
                                    "hidden": 1,
                                    "source": [ "row-35", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 20.0, 56.0, 150.0, 22.0 ],
                    "text": "p Examples"
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}