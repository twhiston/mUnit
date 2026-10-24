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
        "rect": [ 306.0, 89.0, 439.0, 430.0 ],
        "bglocked": 1,
        "openinpresentation": 1,
        "toolbarvisible": 0,
        "enablehscroll": 0,
        "enablevscroll": 0,
        "description": "mUnit: lint the patch you save, wherever it is",
        "digest": "A lint server for the Extras menu: automatic, or with a project folder as the top of the config cascade",
        "tags": "mUnit",
        "title": "mUnit Lint Server",
        "boxes": [
            {
                "box": {
                    "angle": 0.0,
                    "background": 1,
                    "bgcolor": [ 0.16, 0.17, 0.2, 1.0 ],
                    "id": "obj-hdr",
                    "maxclass": "panel",
                    "mode": 0,
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 60.0, 440.0, 64.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 0.0, 0.0, 440.0, 64.0 ],
                    "proportion": 0.39,
                    "shadow": -1
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.16, 0.17, 0.2, 1.0 ],
                    "hint": "green: watching, red: stopped, amber: starting",
                    "id": "obj-led",
                    "maxclass": "led",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "offcolor": [ 0.95, 0.69, 0.2, 1.0 ],
                    "oncolor": [ 0.3, 0.8, 0.4, 1.0 ],
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 240.0, 990.0, 16.0, 16.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 24.0, 16.0, 16.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 20.0,
                    "id": "obj-title",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 14.0, 300.0, 29.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 44.0, 16.0, 250.0, 29.0 ],
                    "text": "mUnit Lint Server",
                    "textcolor": [ 0.97, 0.97, 0.97, 1.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-stateword",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 400.0, 988.0, 120.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 300.0, 21.0, 120.0, 20.0 ],
                    "text": "watching",
                    "textcolor": [ 0.75, 0.77, 0.82, 1.0 ],
                    "textjustification": 2
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "id": "obj-statusline",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 564.0, 990.0, 400.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 76.0, 400.0, 20.0 ],
                    "text": "Lints each patch you save and posts the findings to the Max console"
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-last",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 894.0, 146.0, 31.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 96.0, 400.0, 19.0 ],
                    "text": "Last lint: mUnit Lint Server.maxpat: clean",
                    "textcolor": [ 0.45, 0.45, 0.47, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-modeh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 129.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 124.0, 100.0, 20.0 ],
                    "text": "Mode"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "automatic: lint each patch you save with the config nearest to it; project: watch a folder as the top of the config cascade",
                    "id": "obj-mode",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 120.0, 250.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 146.0, 250.0, 24.0 ],
                    "rounded": 4.0,
                    "spacing_y": 0.0,
                    "tabs": [ "Automatic", "Project folder..." ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.0, 0.0, 0.0, 0.0 ],
                    "border": 0.0,
                    "fontsize": 11.0,
                    "id": "obj-modeinfo",
                    "linecount": 2,
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 470.0, 322.0, 400.0, 34.0 ],
                    "presentation": 1,
                    "presentation_linecount": 2,
                    "presentation_rect": [ 20.0, 176.0, 400.0, 53.0 ],
                    "readonly": 1,
                    "text": "Each patch you save is linted with the munit-lint.json nearest to it or with mUnit:recommended when there is none",
                    "textcolor": [ 0.45, 0.45, 0.47, 1.0 ]
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-outh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 782.0, 129.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 233.0, 100.0, 20.0 ],
                    "text": "Findings"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "also write every lint's report to a file: JSON for .json, JUnit for .xml, text otherwise",
                    "id": "obj-out",
                    "maxclass": "tab",
                    "multiline": 0,
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 45.0, 344.0, 250.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 255.0, 250.0, 24.0 ],
                    "rounded": 4.0,
                    "spacing_y": 0.0,
                    "tabs": [ "Max console", "Console + a file..." ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.0, 0.0, 0.0, 0.0 ],
                    "border": 0.0,
                    "fontsize": 11.0,
                    "id": "obj-outinfo",
                    "maxclass": "textedit",
                    "numinlets": 1,
                    "numoutlets": 4,
                    "outlettype": [ "", "int", "", "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 400.0, 534.0, 400.0, 34.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 286.0, 400.0, 34.0 ],
                    "readonly": 1,
                    "text": "Posted to the Max console as they are found",
                    "textcolor": [ 0.45, 0.45, 0.47, 1.0 ]
                }
            },
            {
                "box": {
                    "hint": "every lint applies the fixes the rules describe and writes the files back; a save is linted two seconds later so Max reloads the fix",
                    "id": "obj-fix",
                    "maxclass": "toggle",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ -167.0, 581.0, 20.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 106.0, 344.0, 20.0, 20.0 ]
                }
            },
            {
                "box": {
                    "fontsize": 11.0,
                    "id": "obj-fixc",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 158.0, 290.0, 19.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 132.0, 344.0, 48.0, 19.0 ],
                    "text": "AutoFix"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "apply the fixes once, now: the project folder, or every patch seen in front, whether or not the switch is on",
                    "id": "obj-fixnow",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ -73.0, 620.0, 80.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 342.0, 80.0, 24.0 ],
                    "text": "Fix now"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 12.0,
                    "id": "obj-acth",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 890.0, 131.0, 100.0, 20.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 320.0, 100.0, 20.0 ],
                    "text": "Actions"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "lint everything again: the project folder, or every patch seen in front",
                    "id": "obj-lint",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 620.0, 80.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 368.0, 80.0, 24.0 ],
                    "text": "Lint now"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "watch again",
                    "id": "obj-start",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 106.0, 620.0, 56.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 106.0, 368.0, 56.0, 24.0 ],
                    "text": "Start"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "stop watching; nothing is linted until Start",
                    "id": "obj-stop",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 168.0, 620.0, 56.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 168.0, 368.0, 56.0, 24.0 ],
                    "text": "Stop"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "bring the Max console to the front: the findings are posted there",
                    "id": "obj-console",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 230.0, 620.0, 100.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 230.0, 368.0, 100.0, 24.0 ],
                    "text": "Max console"
                }
            },
            {
                "box": {
                    "fontsize": 12.0,
                    "hint": "open the mUnit.lint help patcher",
                    "id": "obj-help",
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 336.0, 620.0, 84.0, 24.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 336.0, 368.0, 84.0, 24.0 ],
                    "text": "Help"
                }
            },
            {
                "box": {
                    "fontsize": 10.0,
                    "id": "obj-footer",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 180.0, 400.0, 18.0 ],
                    "presentation": 1,
                    "presentation_rect": [ 20.0, 404.0, 400.0, 18.0 ],
                    "text": "Findings appear in the Max console. Leave this window open while you work.",
                    "textcolor": [ 0.45, 0.45, 0.47, 1.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-intro",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 50.0, 620.0, 47.0 ],
                    "text": "Lints whatever patch you save, wherever it is on the disk, and posts the findings to the Max console. Leave the window open while you work; it needs nothing in your patches. The objects on the right (x > 1000) are the presentation view: the light, the readouts and the labels."
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "id": "obj-presh",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 675.0, 38.0, 420.0, 20.0 ],
                    "text": "Presentation view: the window you see from the Extras menu"
                }
            },
            {
                "box": {
                    "id": "obj-modec",
                    "linecount": 12,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -398.0, 140.5, 384.0, 167.0 ],
                    "text": "Automatic (the default): each patch you save is linted with the munit-lint.json nearest to it: the configs in its folder and in the folders above it, cascading, up to one that says \"root\": true. None anywhere: the built-in mUnit:recommended rules. The console names the configs whenever they change.\n\nProject folder: the folder is watched, and it is the top of the config cascade: a saved patch takes the configs from its own folder up to the project folder and nothing above it, so the folder's munit-lint.json rules the whole project, with subfolders adding their own. A patch outside the folder takes the folder's configs. Set it to the root of your repository and patch away. Cancelling the dialog puts the tab back."
                }
            },
            {
                "box": {
                    "id": "obj-sel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 20.0, 160.0, 50.0, 22.0 ],
                    "text": "sel 0 1"
                }
            },
            {
                "box": {
                    "id": "obj-tauto",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 25.0, 200.0, 109.0, 22.0 ],
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
                    "patching_rect": [ 25.0, 240.0, 150.0, 22.0 ],
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
                    "patching_rect": [ 115.0, 277.0, 440.0, 35.0 ],
                    "text": "set Each patch you save is linted with the munit-lint.json nearest to it or with mUnit:recommended when there is none"
                }
            },
            {
                "box": {
                    "id": "obj-dialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "bang" ],
                    "patching_rect": [ 300.0, 140.5, 100.0, 22.0 ],
                    "text": "opendialog fold"
                }
            },
            {
                "box": {
                    "id": "obj-untab",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 381.0, 167.0, 40.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "obj-tproj",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 300.0, 200.0, 179.0, 22.0 ],
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
                    "patching_rect": [ 300.0, 240.0, 150.0, 22.0 ],
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
                    "patching_rect": [ 460.0, 240.0, 300.0, 22.0 ],
                    "text": "sprintf set Project: %s (the top of the config cascade)"
                }
            },
            {
                "box": {
                    "id": "obj-outc",
                    "linecount": 6,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -398.0, 347.5, 400.0, 87.0 ],
                    "text": "Findings always go to the Max console. Console + a file: every lint's report is also written to the file you choose, the whole folder after a start or Lint now, one patch after a save; JSON for .json, JUnit for .xml, text otherwise (@output and @format on [mUnit.lint]). For an editor, a dashboard or a CI step to pick up. Cancelling the dialog puts the tab back."
                }
            },
            {
                "box": {
                    "id": "obj-osel",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "" ],
                    "patching_rect": [ 45.0, 380.0, 50.0, 22.0 ],
                    "text": "sel 0 1"
                }
            },
            {
                "box": {
                    "id": "obj-tnone",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 45.0, 420.0, 40.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-setnone",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 45.0, 460.0, 80.0, 22.0 ],
                    "text": "output none"
                }
            },
            {
                "box": {
                    "id": "obj-dispnone",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 66.0, 500.0, 300.0, 22.0 ],
                    "text": "set Posted to the Max console as they are found"
                }
            },
            {
                "box": {
                    "id": "obj-sdialog",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "bang" ],
                    "patching_rect": [ 310.0, 369.0, 70.0, 22.0 ],
                    "text": "savedialog"
                }
            },
            {
                "box": {
                    "id": "obj-unout",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 361.0, 402.0, 40.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "obj-tout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 310.0, 437.0, 109.0, 22.0 ],
                    "text": "t s s"
                }
            },
            {
                "box": {
                    "id": "obj-setout",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 310.0, 470.0, 70.0, 22.0 ],
                    "text": "output $1"
                }
            },
            {
                "box": {
                    "id": "obj-dispout",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 470.0, 190.0, 22.0 ],
                    "text": "sprintf set Also written to: %s"
                }
            },
            {
                "box": {
                    "id": "obj-fixpc",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -401.0, 500.0, 403.0, 74.0 ],
                    "text": "Apply fixes: every lint applies the fixes the rules describe and writes the files back, the way the fix message does (@autofix 1); Fix now does it once, switch or no switch. Max reloads an open patch when its file changes, but ignores a change for a moment after saving it, so with this on a save is linted two seconds later and the fix shows up in the patch."
                }
            },
            {
                "box": {
                    "id": "obj-setfix",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -167.0, 621.0, 70.0, 22.0 ],
                    "text": "autofix $1"
                }
            },
            {
                "box": {
                    "id": "obj-mfix",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -73.0, 660.0, 35.0, 22.0 ],
                    "text": "fix"
                }
            },
            {
                "box": {
                    "id": "obj-actc",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -401.0, 712.0, 420.0, 60.0 ],
                    "text": "Lint now: everything again, the project folder or every patch seen in front. Start and Stop: watching. Max console: where the findings are. Help: the mUnit.lint help patcher. status (here only): what the front-window helper has seen, for when a patch is not being linted."
                }
            },
            {
                "box": {
                    "id": "obj-mlint",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 660.0, 35.0, 22.0 ],
                    "text": "lint"
                }
            },
            {
                "box": {
                    "id": "obj-mstart",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 106.0, 660.0, 40.0, 22.0 ],
                    "text": "start"
                }
            },
            {
                "box": {
                    "id": "obj-mstop",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 168.0, 660.0, 40.0, 22.0 ],
                    "text": "stop"
                }
            },
            {
                "box": {
                    "id": "obj-mconsole",
                    "linecount": 2,
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 230.0, 660.0, 100.0, 35.0 ],
                    "text": ";\rmax maxwindow"
                }
            },
            {
                "box": {
                    "id": "obj-mhelp",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 336.0, 660.0, 100.0, 22.0 ],
                    "text": "help mUnit.lint"
                }
            },
            {
                "box": {
                    "id": "obj-pcontrol",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 336.0, 700.0, 55.0, 22.0 ],
                    "text": "pcontrol"
                }
            },
            {
                "box": {
                    "id": "obj-status",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 125.0, 718.0, 45.0, 22.0 ],
                    "text": "status"
                }
            },
            {
                "box": {
                    "id": "obj-server",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "started" ],
                    "patching_rect": [ 20.0, 750.0, 160.0, 22.0 ],
                    "text": "mUnit.lint @folder none"
                }
            },
            {
                "box": {
                    "id": "obj-wirec",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 200.0, 742.0, 520.0, 33.0 ],
                    "text": "[mUnit.lint @folder none] is the server. Put it in your own patches, or lint from the command line with munit-cli: it reads the json directly, so Max is not needed to lint or to fix."
                }
            },
            {
                "box": {
                    "id": "obj-text",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "", "" ],
                    "patching_rect": [ 20.0, 790.0, 110.0, 22.0 ],
                    "saved_object_attributes": {
                        "legacy": 1
                    },
                    "text": "dict.unpack text:"
                }
            },
            {
                "box": {
                    "id": "obj-fromsym",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 820.0, 71.0, 22.0 ],
                    "text": "fromsymbol"
                }
            },
            {
                "box": {
                    "id": "obj-lastset",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 850.0, 140.0, 22.0 ],
                    "text": "prepend set Last lint:"
                }
            },
            {
                "box": {
                    "id": "obj-dictc",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -400.0, 790.0, 415.0, 33.0 ],
                    "text": "the findings of every lint, as a dict: files, summary, findings, errors and text, the console's one-line summary, shown under the title"
                }
            },
            {
                "box": {
                    "id": "obj-route",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 240.0, 820.0, 130.0, 22.0 ],
                    "text": "route state started"
                }
            },
            {
                "box": {
                    "id": "obj-states",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "" ],
                    "patching_rect": [ 240.0, 860.0, 150.0, 22.0 ],
                    "text": "route watching stopped"
                }
            },
            {
                "box": {
                    "id": "obj-print",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 480.0, 841.0, 100.0, 22.0 ],
                    "text": "print mUnit.lint"
                }
            },
            {
                "box": {
                    "id": "obj-statec",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ -73.0, 988.0, 310.0, 60.0 ],
                    "text": "state watching and state stopped drive the light and the readouts; started (the server is up, in automatic mode) selects the first tab of each row; whatever else the server says goes to the console"
                }
            },
            {
                "box": {
                    "id": "obj-tstarted",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ -90.0, 59.0, 69.0, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-modeset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -90.0, 99.0, 40.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "obj-outset",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ -40.0, 99.0, 40.0, 22.0 ],
                    "text": "set 0"
                }
            },
            {
                "box": {
                    "id": "obj-twatch",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 240.0, 900.0, 339.0, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "obj-ledon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 240.0, 940.0, 150.0, 22.0 ],
                    "text": "oncolor 0.3 0.8 0.4 1., 1"
                }
            },
            {
                "box": {
                    "id": "obj-wordon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 400.0, 940.0, 80.0, 22.0 ],
                    "text": "set watching"
                }
            },
            {
                "box": {
                    "id": "obj-lineon",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 560.0, 940.0, 400.0, 22.0 ],
                    "text": "set Lints each patch you save and posts the findings to the Max console"
                }
            },
            {
                "box": {
                    "id": "obj-tstop",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "bang", "bang", "bang" ],
                    "patching_rect": [ 305.5, 1020.0, 344.5, 22.0 ],
                    "text": "t b b b"
                }
            },
            {
                "box": {
                    "id": "obj-ledoff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 305.5, 1060.0, 154.0, 22.0 ],
                    "text": "offcolor 0.86 0.25 0.25 1., 0"
                }
            },
            {
                "box": {
                    "id": "obj-wordoff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 468.25, 1060.0, 80.0, 22.0 ],
                    "text": "set stopped"
                }
            },
            {
                "box": {
                    "id": "obj-lineoff",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 631.0, 1060.0, 300.0, 22.0 ],
                    "text": "set Not watching. Press Start to lint on save again"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-mconsole", 0 ],
                    "source": [ "obj-console", 0 ]
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
                    "destination": [ "obj-untab", 0 ],
                    "source": [ "obj-dialog", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-modeinfo", 0 ],
                    "source": [ "obj-dispauto", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outinfo", 0 ],
                    "source": [ "obj-dispnone", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outinfo", 0 ],
                    "source": [ "obj-dispout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-modeinfo", 0 ],
                    "source": [ "obj-dispproj", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-setfix", 0 ],
                    "source": [ "obj-fix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mfix", 0 ],
                    "source": [ "obj-fixnow", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lastset", 0 ],
                    "source": [ "obj-fromsym", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mhelp", 0 ],
                    "source": [ "obj-help", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-last", 0 ],
                    "source": [ "obj-lastset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led", 0 ],
                    "source": [ "obj-ledoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-led", 0 ],
                    "source": [ "obj-ledon", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-statusline", 0 ],
                    "source": [ "obj-lineoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-statusline", 0 ],
                    "source": [ "obj-lineon", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mlint", 0 ],
                    "source": [ "obj-lint", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-mfix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-pcontrol", 0 ],
                    "source": [ "obj-mhelp", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-mlint", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sel", 0 ],
                    "source": [ "obj-mode", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mode", 0 ],
                    "source": [ "obj-modeset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-mstart", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-mstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-sdialog", 0 ],
                    "source": [ "obj-osel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tnone", 0 ],
                    "source": [ "obj-osel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-osel", 0 ],
                    "source": [ "obj-out", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out", 0 ],
                    "source": [ "obj-outset", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print", 0 ],
                    "source": [ "obj-route", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-states", 0 ],
                    "source": [ "obj-route", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tstarted", 0 ],
                    "source": [ "obj-route", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tout", 0 ],
                    "source": [ "obj-sdialog", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-unout", 0 ],
                    "source": [ "obj-sdialog", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dialog", 0 ],
                    "source": [ "obj-sel", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tauto", 0 ],
                    "source": [ "obj-sel", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-route", 0 ],
                    "source": [ "obj-server", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-text", 0 ],
                    "source": [ "obj-server", 0 ]
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
                    "source": [ "obj-setfix", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-setnone", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-server", 0 ],
                    "source": [ "obj-setout", 0 ]
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
                    "destination": [ "obj-mstart", 0 ],
                    "source": [ "obj-start", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-print", 0 ],
                    "source": [ "obj-states", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-tstop", 0 ],
                    "source": [ "obj-states", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-twatch", 0 ],
                    "source": [ "obj-states", 0 ]
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
                    "destination": [ "obj-mstop", 0 ],
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
                    "destination": [ "obj-fromsym", 0 ],
                    "source": [ "obj-text", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dispnone", 0 ],
                    "source": [ "obj-tnone", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-setnone", 0 ],
                    "source": [ "obj-tnone", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-dispout", 0 ],
                    "source": [ "obj-tout", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-setout", 0 ],
                    "source": [ "obj-tout", 0 ]
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
            },
            {
                "patchline": {
                    "destination": [ "obj-modeset", 0 ],
                    "source": [ "obj-tstarted", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-outset", 0 ],
                    "source": [ "obj-tstarted", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ledoff", 0 ],
                    "source": [ "obj-tstop", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lineoff", 0 ],
                    "source": [ "obj-tstop", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wordoff", 0 ],
                    "source": [ "obj-tstop", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-ledon", 0 ],
                    "source": [ "obj-twatch", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-lineon", 0 ],
                    "source": [ "obj-twatch", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-wordon", 0 ],
                    "source": [ "obj-twatch", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-out", 0 ],
                    "source": [ "obj-unout", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-mode", 0 ],
                    "source": [ "obj-untab", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stateword", 0 ],
                    "source": [ "obj-wordoff", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-stateword", 0 ],
                    "source": [ "obj-wordon", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}