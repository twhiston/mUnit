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
        "rect": [ 100.0, 100.0, 880.0, 620.0 ],
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
                    "patching_rect": [ 0.0, 0.0, 880.0, 64.0 ],
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
                    "patching_rect": [ 20.0, 11.0, 710.0, 29.0 ],
                    "text": "Gen inside a signal test",
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
                    "patching_rect": [ 20.0, 41.0, 710.0, 20.0 ],
                    "text": "gen~ is an ordinary MSP object between a stimulus and a signal assert; nothing special is needed",
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
                    "patching_rect": [ 750.0, 20.0, 110.0, 24.0 ],
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
                    "patching_rect": [ 695.0, 68.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "c-intro",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 96.0, 560.0, 60.0 ],
                    "text": "Nothing special is needed to test Gen inside Max: patch [gen~] between a stimulus and a signal assert, as any MSP object. munit.config.js sets the non-realtime driver, so the suite renders faster than real time and the same on every run. (Testing an exported gen~ outside Max, without a licence, is the other half of the story.)"
                }
            },
            {
                "box": {
                    "id": "harness",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 750.0, 96.0, 90.0, 22.0 ],
                    "text": "mUnit.harness"
                }
            },
            {
                "box": {
                    "id": "handler",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 750.0, 136.0, 90.0, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "c-embedded",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 178.0, 560.0, 33.0 ],
                    "text": "An embedded [gen~]: a gain of 0.5 on a 440 Hz sine. The assert measures frequency and level, as for any signal object. Passes."
                }
            },
            {
                "box": {
                    "id": "stim-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 222.0, 280.0, 22.0 ],
                    "text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5"
                }
            },
            {
                "box": {
                    "id": "gen-embedded",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patcher": {
                        "fileversion": 1,
                        "appversion": {
                            "major": 9,
                            "minor": 2,
                            "revision": 0,
                            "architecture": "x64",
                            "modernui": 1
                        },
                        "classnamespace": "dsp.gen",
                        "rect": [ 0.0, 0.0, 400.0, 300.0 ],
                        "boxes": [
                            {
                                "box": {
                                    "id": "gen-in",
                                    "maxclass": "newobj",
                                    "numinlets": 0,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 30.0, 40.0, 22.0 ],
                                    "text": "in 1"
                                }
                            },
                            {
                                "box": {
                                    "id": "gen-mul",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 30.0, 80.0, 46.0, 22.0 ],
                                    "text": "* 0.5"
                                }
                            },
                            {
                                "box": {
                                    "id": "gen-out",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 30.0, 130.0, 46.0, 22.0 ],
                                    "text": "out 1"
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "gen-mul", 0 ],
                                    "source": [ "gen-in", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "gen-out", 0 ],
                                    "source": [ "gen-mul", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 20.0, 262.0, 44.0, 22.0 ],
                    "text": "gen~"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "assert-1",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 302.0, 722.0, 22.0 ],
                    "text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.1768, 0.005)\" @duration 200 @timeout 10000 @name gen_embedded"
                }
            },
            {
                "box": {
                    "id": "c-file",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 352.0, 560.0, 20.0 ],
                    "text": "[gen~ gain] loads gain.gendsp from this folder: the same gain as a file, tested the same way. Passes."
                }
            },
            {
                "box": {
                    "id": "stim-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 396.0, 280.0, 22.0 ],
                    "text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5"
                }
            },
            {
                "box": {
                    "id": "gen-file",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 436.0, 70.0, 22.0 ],
                    "text": "gen~ gain"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "assert-2",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 476.0, 680.0, 22.0 ],
                    "text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.1768, 0.005)\" @duration 200 @timeout 10000 @name gen_file"
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.65, 0.05, 1.0 ],
                    "fontname": "Arial Bold",
                    "fontsize": 12.0,
                    "hint": "",
                    "id": "step-1-20-260",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 178.0, 20.0, 20.0 ],
                    "rounded": 60.0,
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.lesson_step_circle"
                        }
                    },
                    "text": "1",
                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.65, 0.05, 1.0 ],
                    "fontname": "Arial Bold",
                    "fontsize": 12.0,
                    "hint": "",
                    "id": "step-2-20-434",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 352.0, 20.0, 20.0 ],
                    "rounded": 60.0,
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.lesson_step_circle"
                        }
                    },
                    "text": "2",
                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "assert-1", 1 ],
                    "source": [ "gen-embedded", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "assert-2", 1 ],
                    "source": [ "gen-file", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "handler", 0 ],
                    "source": [ "harness", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "hdr-openfolder", 0 ],
                    "hidden": 1,
                    "source": [ "hdr-open", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen-embedded", 0 ],
                    "source": [ "stim-1", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "gen-file", 0 ],
                    "source": [ "stim-2", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}