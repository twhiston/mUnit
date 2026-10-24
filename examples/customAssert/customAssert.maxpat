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
        "rect": [ 59.0, 119.0, 760.0, 580.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 145.0, 212.0, 20.0 ],
                    "text": "munit-lint disable use-munit-loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 112.0, 96.0, 573.0, 47.0 ],
                    "text": "Loadbang is used here because we are configuring the handler from inside the test, and not from a file next to it, in this case the config is loaded first, then the handler set up, then mUnit.loadbang or outlet 1 from the handler fires to begin the tests."
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
                    "patching_rect": [ 0.0, 0.0, 760.0, 64.0 ],
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
                    "patching_rect": [ 20.0, 11.0, 590.0, 29.0 ],
                    "text": "A custom assert in JavaScript",
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
                    "patching_rect": [ 20.0, 41.0, 590.0, 20.0 ],
                    "text": "uniqueValue.js, next to the patch, judges each call; the assert names the file instead of an expression",
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
                    "patching_rect": [ 630.0, 20.0, 110.0, 24.0 ],
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
                    "patching_rect": [ 575.0, 68.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 52.0, 479.0, 59.0, 22.0 ],
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
                    "patching_rect": [ 52.0, 445.0, 40.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 372.0, 202.0, 181.0 ],
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
                    "patching_rect": [ 43.0, 527.0, 241.0, 22.0 ],
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
                    "patching_rect": [ 52.0, 96.0, 58.0, 22.0 ],
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
                    "patching_rect": [ 52.0, 372.0, 105.0, 22.0 ],
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
                    "patching_rect": [ 52.0, 167.0, 652.0, 179.0 ],
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
                    "patching_rect": [ 52.0, 412.0, 83.0, 22.0 ],
                    "text": "mUnit.handler"
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