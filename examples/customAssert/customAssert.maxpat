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
        "boxes": [ {"box": {"id": "obj-of1", "maxclass": "message", "text": "open folder", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [684.0, 270.0, 75.0, 22.0]}}, {"box": {"id": "obj-of2", "maxclass": "newobj", "text": "mUnit.examples.openFolder", "numinlets": 1, "numoutlets": 0, "patching_rect": [684.0, 303.0, 165.0, 22.0]}}, {"box": {"id": "obj-of1c", "maxclass": "comment", "text": "this example's files and results", "numinlets": 1, "numoutlets": 0, "patching_rect": [764.0, 270.0, 190.0, 20.0]}},
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 52.0, 409.0, 59.0, 22.0 ],
                    "text": "random 3"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "int" ],
                    "patching_rect": [ 52.0, 375.0, 40.0, 22.0 ],
                    "text": "uzi 3"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "linecount": 13,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 249.0, 302.0, 206.0, 181.0 ],
                    "text": "This example uses a custom assert instead of a simple expression. The assert code should be placed in the folder with the test and should be referenced as the first argument to the assert object.\n\nBy writing custom asserts in code you can create more complex test cases.\nIn this instance the test will only pass if the assert receives three unique numbers"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 43.0, 457.0, 241.0, 22.0 ],
                    "text": "mUnit.assert uniqueValue.js @maxCalls 3"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 83.0, 27.0, 58.0, 22.0 ],
                    "text": "mUnit.loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "button",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 52.0, 26.0, 24.0, 24.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-38",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 52.0, 302.0, 105.0, 22.0 ],
                    "text": "prepend configure"
                }
            },
            {
                "box": {
                    "code": "{\n\t\"logFormatter\": \"Txt\",\r\n\t\"resultFormatter\": \"Json\",\r\n\t\"ignoreConsoleErrors\": true,\r\n\t\"logOutputFilters\": [],\n\t\"logObjectFilters\": [\"print\"],\r\n\t\"outputDir\":  \"~/Documents/Max 9/Packages/mUnit/examples/customAssert/logs\"\n}",
                    "fontface": 0,
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "id": "obj-1",
                    "maxclass": "dict.codebox",
                    "numinlets": 2,
                    "numoutlets": 5,
                    "outlettype": [ "dictionary", "", "", "", "" ],
                    "patching_rect": [ 52.0, 74.0, 652.0, 179.0 ],
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
                    "patching_rect": [ 52.0, 342.0, 81.0, 22.0 ],
                    "text": "mUnit.handler"
                }
            }
        ],
        "lines": [ {"patchline": {"destination": ["obj-of2", 0], "source": ["obj-of1", 0]}},
            {
                "patchline": {
                    "destination": [ "obj-38", 0 ],
                    "source": [ "obj-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-23", 0 ]
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
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-5", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}