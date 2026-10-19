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
        "rect": [ 956.0, 130.0, 406.0, 241.0 ],
        "openinpresentation": 1,
        "description": "mUnit: lint the patch you save, wherever it is",
        "digest": "A lint server for the Extras menu: automatic, or with a project folder as the top of the config cascade",
        "tags": "mUnit",
        "boxes": [
            {
                "box": {
                    "id": "obj-5",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 142.0, 85.0, 150.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 150.33333333333337, 77.0, 18.0, 20.0 ],
                    "text": "|"
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 12.0, 564.0, 215.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 219.0, 195.0, 20.0 ],
                    "text": "Go to patching mode for more info"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 555.0, 437.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 102.0, 300.0, 20.0 ],
                    "text": "Status"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 24.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 14.0, 400.0, 33.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 14.0, 355.0, 33.0 ],
                    "text": "mUnit Lint Server"
                }
            },
            {
                "box": {
                    "id": "obj-intro",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 50.0, 477.0, 33.0 ],
                    "text": "Lints whatever patch you save, wherever it is on the disk, and posts the findings to the Max console. Leave this window open while you work; it needs nothing in your patches."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-modeh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 95.0, 300.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 52.0, 300.0, 20.0 ],
                    "text": "Mode"
                }
            },
            {
                "box": {
                    "id": "obj-auto",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 125.0, 80.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 76.0, 80.0, 22.0 ],
                    "text": "automatic"
                }
            },
            {
                "box": {
                    "id": "obj-autoc",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 109.0, 112.5, 622.0, 47.0 ],
                    "text": "(the default) Each patch you save is linted with the munit-lint.json nearest to it: the configs in its folder and in the folders above it, cascading, up to one that says \"root\": true. None anywhere: the built-in mUnit:recommended rules. The console names the configs whenever they change."
                }
            },
            {
                "box": {
                    "id": "obj-proj",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 514.0, 270.0, 160.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 76.0, 160.0, 22.0 ],
                    "text": "choose a project folder..."
                }
            },
            {
                "box": {
                    "id": "obj-projc",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 514.0, 199.0, 545.0, 60.0 ],
                    "text": "Project mode. The folder is watched, and it is the top of the config cascade: a saved patch takes the configs from its own folder up to the project folder and nothing above it, so the folder's munit-lint.json rules the whole project, with subfolders adding their own. A patch outside the folder takes the folder's configs. Set it to the root of your repository and patch away."
                }
            },
            {
                "box": {
                    "id": "obj-now",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 459.0, 665.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 124.0, 355.0, 22.0 ],
                    "text": "automatic: the patch in front, with the munit-lint.json nearest to it"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-acth",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 38.0, 299.0, 207.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 171.0, 195.0, 20.0 ],
                    "text": "Actions"
                }
            },
            {
                "box": {
                    "id": "obj-lint",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 210.0, 324.0, 35.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 180.0, 193.0, 35.0, 22.0 ],
                    "text": "lint"
                }
            },
            {
                "box": {
                    "id": "obj-lintc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 247.0, 324.0, 191.0, 33.0 ],
                    "text": "everything again: the project folder, or every patch seen in front"
                }
            },
            {
                "box": {
                    "id": "obj-stop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 38.0, 324.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 72.0, 193.0, 40.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-start",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 85.0, 324.0, 40.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 193.0, 40.0, 22.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "obj-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 133.0, 324.0, 45.0, 22.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 124.0, 193.0, 45.0, 22.0 ],
                    "text": "status"
                }
            },
            {
                "box": {
                    "id": "obj-actc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 36.0, 264.5, 350.0, 33.0 ],
                    "text": "stop and start watching; status: what the front-window helper has seen, for when a patch is not being linted"
                }
            },
            {
                "box": {
                    "id": "obj-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 514.0, 304.0, 100.0, 22.0 ],
                    "text": "opendialog fold"
                }
            },
            {
                "box": {
                    "id": "obj-tproj",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 514.0, 338.0, 177.0, 22.0 ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "obj-setproj",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 514.0, 379.0, 150.0, 22.0 ],
                    "text": "root 1, folder $1, start"
                }
            },
            {
                "box": {
                    "id": "obj-dispproj",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 672.0, 379.0, 80.0, 22.0 ],
                    "text": "prepend set"
                }
            },
            {
                "box": {
                    "id": "obj-tauto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 20.0, 150.0, 40.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-setauto",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 199.0, 150.0, 22.0 ],
                    "text": "folder none, root 0, start"
                }
            },
            {
                "box": {
                    "id": "obj-dispauto",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 190.0, 199.0, 260.0, 35.0 ],
                    "text": "set automatic: the patch in front, with the munit-lint.json nearest to it"
                }
            },
            {
                "box": {
                    "id": "obj-server",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "started" ],
                    "patching_rect": [ 20.0, 490.0, 160.0, 22.0 ],
                    "text": "mUnit.lint @folder none"
                }
            },
            {
                "box": {
                    "id": "obj-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 161.0, 532.0, 100.0, 22.0 ],
                    "text": "print mUnit.lint"
                }
            },
            {
                "box": {
                    "id": "obj-wirec",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 269.0, 490.0, 431.0, 47.0 ],
                    "text": "[mUnit.lint @folder none] is the server, you could put it in your patches or use the linter with the mUnit cli tool (since it looks at the json directly, max is not required to lint or fix issues. "
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-tauto", 0 ],
                    "source": [ "obj-auto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tproj", 0 ],
                    "source": [ "obj-dialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-now", 0 ],
                    "source": [ "obj-dispauto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-now", 0 ],
                    "source": [ "obj-dispproj", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-lint", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dialog", 0 ],
                    "source": [ "obj-proj", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print", 0 ],
                    "source": [ "obj-server", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-setauto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-setproj", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-status", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-stop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dispauto", 0 ],
                    "source": [ "obj-tauto", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-setauto", 0 ],
                    "source": [ "obj-tauto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dispproj", 0 ],
                    "source": [ "obj-tproj", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-setproj", 0 ],
                    "source": [ "obj-tproj", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}