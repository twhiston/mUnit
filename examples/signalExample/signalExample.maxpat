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
        "rect": [ 134.0, 164.0, 940.0, 660.0 ],
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
                    "patching_rect": [ 0.0, 0.0, 940.0, 64.0 ],
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
                    "patching_rect": [ 20.0, 11.0, 770.0, 29.0 ],
                    "text": "Signals: mUnit.stimulus~ and mUnit.assert~",
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
                    "patching_rect": [ 20.0, 41.0, 770.0, 20.0 ],
                    "text": "Measured in the expression or compared with a wav reference; the first run takes the references",
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
                    "patching_rect": [ 810.0, 20.0, 110.0, 24.0 ],
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
                    "patching_rect": [ 755.0, 68.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "background": 1,
                    "bubble": 1,
                    "bubbleside": 2,
                    "fontsize": 12.0,
                    "id": "obj-21",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 160.0, 509.0, 153.0, 66.0 ],
                    "text": "This test fails because the reference does not exist yet",
                    "textjustification": 1
                }
            },
            {
                "box": {
                    "id": "obj-22",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 696.0, 96.0, 97.0, 22.0 ],
                    "text": "takeReference 1"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 9,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 96.0, 444.0, 127.0 ],
                    "text": "A signal assert records its inlets into its own buffer~ for @duration ms and then treats each channel as a list of samples, so the expression, the helpers (rms, peak, dc, freq, approx, ...) and custom scripts work on them. With @reference it compares the capture with references/<file>.wav next to this patch instead.\n\nmunit.config.js here sets dsp: { driver: \"NonRealTime\", sr: 48000, vs: 64 }: the handler switches to the non-realtime driver (no audio hardware, faster than real time, the same on every run), turns DSP on, and restores your settings afterwards."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 810.0, 96.0, 98.5, 22.0 ],
                    "text": "mUnit.harness"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 810.0, 136.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 226.0, 290.0, 47.0 ],
                    "text": "A sine, measured. mUnit.stimulus~ starts when the suite starts, at the same moment as the capture. Passes."
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 288.0, 290.0, 22.0 ],
                    "text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-8",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 328.0, 290.0, 49.0 ],
                    "text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.3536, 0.005)\" @duration 200 @timeout 10000 @name sine"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 368.0, 226.0, 294.0, 60.0 ],
                    "text": "A filter against a reference. Seeded noise through lores~; the capture must match references/lores.wav at 50 dB or better, aligned within 64 samples. Passes once recorded (see below)."
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 340.0, 288.0, 290.0, 22.0 ],
                    "text": "mUnit.stimulus~ @type noise @seed 7 @amp 0.5"
                }
            },
            {
                "box": {
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 340.0, 323.0, 111.5, 22.0 ],
                    "text": "lores~ 1000 0.5"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-12",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 340.0, 358.0, 290.0, 49.0 ],
                    "text": "mUnit.assert~ @reference lores.wav @snr 50 @maxLatency 64 @duration 300 @timeout 10000 @name filter"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 48.0, 381.0, 290.0, 47.0 ],
                    "text": "A synth voice: a sine shaped by a line~ envelope started by mUnit.loadbang, against references/voice.wav. Passes once recorded."
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 84.0, 464.0, 105.0, 22.0 ],
                    "text": "mUnit.loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-15",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 84.0, 491.0, 98.5, 22.0 ],
                    "text": "0, 1 20 0 200"
                }
            },
            {
                "box": {
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 2,
                    "outlettype": [ "signal", "bang" ],
                    "patching_rect": [ 84.0, 518.0, 46.5, 22.0 ],
                    "text": "line~"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 436.0, 221.0, 22.0 ],
                    "text": "mUnit.stimulus~ @type sine @freq 220."
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "signal" ],
                    "patching_rect": [ 20.0, 541.0, 40.0, 22.0 ],
                    "text": "*~"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-19",
                    "linecount": 3,
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 20.0, 576.0, 290.0, 49.0 ],
                    "text": "mUnit.assert~ @reference voice.wav @snr 40 @maxLatency 256 @duration 300 @timeout 10000 @name voice"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 340.0, 417.0, 551.0, 74.0 ],
                    "text": "Taking references: the first run of a reference assert fails with \"no reference at ... take it with munit run --take-references\". Run `munit run <this folder>/signalExample.maxpat --take-references` (or set takeReferences: true in munit.config.js, or send takeReferences 1 to the handler) once; the captures are written as 32-bit float wavs in references/. Commit them with the test. A failure keeps the capture as actual.wav in logs/artifacts/ next to a link to the reference, so the two can be compared in an editor."
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.65, 0.05, 1.0 ],
                    "fontname": "Arial Bold",
                    "fontsize": 12.0,
                    "hint": "",
                    "id": "step-1-20-226",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 226.0, 20.0, 20.0 ],
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
                    "id": "step-2-340-226",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 340.0, 226.0, 20.0, 20.0 ],
                    "rounded": 60.0,
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.lesson_step_circle"
                        }
                    },
                    "text": "2",
                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
                }
            },
            {
                "box": {
                    "bgcolor": [ 0.9, 0.65, 0.05, 1.0 ],
                    "fontname": "Arial Bold",
                    "fontsize": 12.0,
                    "hint": "",
                    "id": "step-3-20-381",
                    "ignoreclick": 1,
                    "legacytextcolor": 1,
                    "maxclass": "textbutton",
                    "numinlets": 1,
                    "numoutlets": 3,
                    "outlettype": [ "", "", "int" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 20.0, 381.0, 20.0, 20.0 ],
                    "rounded": 60.0,
                    "saved_attribute_attributes": {
                        "bgcolor": {
                            "expression": "themecolor.lesson_step_circle"
                        }
                    },
                    "text": "3",
                    "textcolor": [ 0.34902, 0.34902, 0.34902, 1.0 ]
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
                    "destination": [ "obj-11", 0 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 1 ],
                    "source": [ "obj-11", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 0 ],
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 0 ],
                    "source": [ "obj-15", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 1 ],
                    "source": [ "obj-16", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "source": [ "obj-17", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-19", 1 ],
                    "source": [ "obj-18", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-22", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-4", 0 ],
                    "source": [ "obj-3", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-8", 1 ],
                    "source": [ "obj-7", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}