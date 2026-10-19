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
        "rect": [ 59.0, 119.0, 1000.0, 755.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 123.0, 144.0, 219.0, 20.0 ],
                    "text": "munit-lint disable use-munit-loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 126.0, 109.0, 588.0, 33.0 ],
                    "text": "because we are passing in the config directly we can bang it into the handler which will then configure itself and bang when ready so the tests can be started."
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 533.0, 47.0 ],
                    "text": "most CI platforms are able to ingest JUnit formatted test output and render it in some nice way to show any test failures etc... mUnit provides native support for a JUnit style results formatter. Just set it in the config to use it. Look in the example folder to see the output"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 530.0, 24.0 ],
                    "text": "JUnit Result Output"
                }
            },
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 37.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 560.0, 70.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 75.0, 421.0, 315.0, 60.0 ],
                    "text": "Using this output from munit.handler will ensure that the bang which starts our tests happens after the core of mUnit has loaded. This is the same as using an [mUnit.loadbang]"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 62.0, 499.0, 620.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 663.0, 576.0, 59.0, 22.0 ],
                    "text": "random 4"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 363.0, 576.0, 59.0, 22.0 ],
                    "text": "random 2"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 62.0, 536.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "int", "int" ],
                    "patching_rect": [ 84.0, 572.0, 93.0, 22.0 ],
                    "text": "t 2 1"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 9.0, 616.0, 168.0, 22.0 ],
                    "text": "mUnit.assert in1 > in2"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 438.0, 616.0, 244.0, 22.0 ],
                    "text": "mUnit.assert in1 === 3 @suite boringTests"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 191.0, 616.0, 191.0, 22.0 ],
                    "text": "mUnit.assert @suite boringTests"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 62.0, 109.0, 58.0, 22.0 ],
                    "text": "loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 62.0, 361.0, 105.0, 22.0 ],
                    "text": "prepend configure"
                }
            },
            {
                "box": {
                    "code": "{\n\t\"logFormatter\": \"Txt\",\r\n\t\"resultFormatter\": \"JUnit\",\r\n\t\"ignoreConsoleErrors\": true,\r\n\t\"logOutputFilters\": [],\n\t\"logObjectFilters\": [\"print\"],\r\n\t\"outputDir\":  \"~/Documents/Max 9/Packages/mUnit/examples/JUnitResultsExample/logs\"\n}",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "dict.codebox",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 62.0, 168.0, 652.0, 179.0 ],
                    "saved_object_attributes": {
                        "legacy": 0,
                        "parameter_enable": 0,
                        "parameter_mappable": 0
                    }
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 62.0, 393.0, 83.0, 22.0 ],
                    "text": "mUnit.handler"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 2 ],
                    "source": [ "obj-15", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-38", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 1 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 1 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-8", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-8", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-8", 2 ]
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