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
        "rect": [ 300.0, 100.0, 1337.0, 928.0 ],
        "bglocked": 1,
        "openinpresentation": 1,
        "toolbarvisible": 0,
        "enablehscroll": 0,
        "enablevscroll": 0,
        "description": "mUnit: the JavaScript API reference",
        "digest": "The reference for custom asserts, formatters, munit.config.js and script lint rules, as a web page",
        "tags": "mUnit",
        "title": "mUnit API",
        "boxes": [
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 554.0, 401.0, 19.0, 22.0 ],
                    "text": "t l"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 554.0, 284.0, 54.0, 22.0 ],
                    "text": "deferlow"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "reload", "" ],
                    "patching_rect": [ 554.0, 362.0, 55.0, 22.0 ],
                    "text": "t reload l"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 512.0, 50.0, 129.0, 22.0 ],
                    "text": "list.reg window getsize"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 512.0, 206.0, 61.0, 22.0 ],
                    "text": "list.slice 2"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 554.0, 323.0, 182.0, 22.0 ],
                    "text": "prepend presentation_rect 0. 34."
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 554.0, 245.0, 66.0, 22.0 ],
                    "text": "list.change"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-13",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 512.0, 11.0, 119.0, 22.0 ],
                    "text": "qmetro 44 @active 1"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 512.0, 167.0, 61.0, 22.0 ],
                    "text": "route size"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-32",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 512.0, 128.0, 79.0, 22.0 ],
                    "text": "route window"
                }
            },
            {
                "box": {
                    "fontface": 0,
                    "fontname": "Arial",
                    "fontsize": 12.0,
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 512.0, 89.0, 67.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 602.0, 413.0, 150.0, 20.0 ],
                    "text": "<<-- plug into jweb"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 90.0, 311.0, 57.0, 22.0 ],
                    "text": "tosymbol"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "linecount": 7,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 11.0, 443.0, 100.0 ],
                    "text": "mUnit API: the reference for custom asserts, formatters, munit.config.js and script lint rules, as a web page inside Max. The pages are api/html in the package, generated by TypeDoc from the same sources as api/libmunit, api/munit-lint and the typings (pnpm run api-docs). This patcher only finds the package folder from its own and reads index.html into jweb: jweb reads a full path, but not one with .. in it, so the regexp swaps the extras folder for the html one. Back, Forward and Home are jweb's own history and the same load again."
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 29.0, 167.0, 90.0, 22.0 ],
                    "text": "loadmess path"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 29.0, 200.0, 80.0, 22.0 ],
                    "save": [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
                    "text": "thispatcher"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "int" ],
                    "patching_rect": [ 90.0, 240.0, 140.0, 22.0 ],
                    "text": "conformpath slash boot"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 5,
                    "outlettype": [ "", "", "", "", "" ],
                    "patching_rect": [ 90.0, 280.0, 330.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacyoutputorder": 1
                    },
                    "text": "regexp extras/mUnit/$ @substitute api/html/index.html"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 90.0, 342.0, 100.0, 22.0 ],
                    "text": "prepend readfile"
                }
            },
            {
                "box": {
                    "disablefind": 0,
                    "id": "obj-7",
                    "maxclass": "jweb",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 440.0, 440.0, 280.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 34.0, 1336.0, 895.0 ],
                    "rendermode": 0,
                    "url": "file:///Users/twhiston/Code/mUnit/max/packages/mUnit/api/html/index.html"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 240.0, 240.0, 220.0, 20.0 ],
                    "text": "the folder of this patcher, slash style"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 343.0, 260.0, 20.0 ],
                    "text": "the window: the jweb fills it in presentation"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-b0",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 110.0, 372.0, 60.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 8.0, 5.0, 60.0, 24.0 ],
                    "text": "Back"
                }
            },
            {
                "box": {
                    "id": "obj-m0",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 110.0, 412.0, 60.0, 22.0 ],
                    "text": "back"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-b1",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 220.0, 372.0, 60.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 72.0, 5.0, 60.0, 24.0 ],
                    "text": "Forward"
                }
            },
            {
                "box": {
                    "id": "obj-m1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 220.0, 412.0, 60.0, 22.0 ],
                    "text": "forward"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-b2",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 29.0, 132.0, 60.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 136.0, 5.0, 60.0, 24.0 ],
                    "text": "Home"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 101.0, 134.0, 315.0, 20.0 ],
                    "text": "Home loads index.html again (loadmess outputs on bang)"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-6", 0 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-32", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-17", 0 ],
                    "source": [ "obj-13", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-20", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "source": [ "obj-16", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-18", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-19", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-3", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-20", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 0 ],
                    "source": [ "obj-32", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-5", 0 ],
                    "source": [ "obj-4", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-5", 0 ]
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
                    "destination": [ "obj-m0", 0 ],
                    "source": [ "obj-b0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-m1", 0 ],
                    "source": [ "obj-b1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-2", 0 ],
                    "source": [ "obj-b2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-m0", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-m1", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}