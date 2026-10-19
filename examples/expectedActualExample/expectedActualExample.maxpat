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
        "rect": [ 384.0, 226.0, 1137.0, 620.0 ],
        "boxes": [
            {
                "box": {
                    "id": "obj-30",
                    "linecount": 5,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 141.0, 115.0, 360.0, 74.0 ],
                    "text": "mUnit.loadbang only bangs once mUnit is up and running. Because mUnit is written in node you need to wait for it to start before you begin your tests, so use this instead of a normal loadbang. You can use the built-in \"test\" linting rules configuration to ensure you don't use loadbangs in your test patches"
                }
            },
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 807.0, 16.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 807.0, 65.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-of1c",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 887.0, 16.0, 87.0, 47.0 ],
                    "text": "this example's files and results"
                }
            },
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-1",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 15.0, 600.0, 24.0 ],
                    "text": "Expected versus actual, and the helpers"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 45.0, 583.0, 60.0 ],
                    "text": "Three of these asserts fail on purpose. Watch the console: each result is one line (ok / FAIL with the reason). Then open logs/results.json: a failed result carries expected, actual, operator and, for lists and dicts, a diff per path. A plain comparison like in1 * 2 == in2 is split at its operator, so the left side is the actual value."
                }
            },
            {
                "box": {
                    "id": "obj-3",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 660.0, 45.0, 98.5, 22.0 ],
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
                    "patching_rect": [ 660.0, 85.0, 98.5, 22.0 ],
                    "text": "mUnit.handler"
                }
            },
            {
                "box": {
                    "id": "obj-5",
                    "linecount": 4,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 660.0, 115.0, 226.0, 60.0 ],
                    "text": "mUnit.harness reads munit.config.js from this folder and configures mUnit.handler. Every [mUnit.loadbang] then fires."
                }
            },
            {
                "box": {
                    "id": "obj-6",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "bang" ],
                    "patching_rect": [ 20.0, 118.0, 105.0, 22.0 ],
                    "text": "mUnit.loadbang"
                }
            },
            {
                "box": {
                    "id": "obj-7",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 6,
                    "outlettype": [ "bang", "bang", "bang", "bang", "bang", "bang" ],
                    "patching_rect": [ 20.0, 153.0, 110.0, 22.0 ],
                    "text": "t b b b b b b"
                }
            },
            {
                "box": {
                    "id": "obj-8",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 250.0, 155.0, 33.0 ],
                    "text": "A plain comparison. Fails: actual 6, expected 7"
                }
            },
            {
                "box": {
                    "id": "obj-9",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 179.0, 250.0, 30.0, 22.0 ],
                    "text": "3"
                }
            },
            {
                "box": {
                    "id": "obj-10",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 275.5, 250.0, 30.0, 22.0 ],
                    "text": "7"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-11",
                    "maxclass": "newobj",
                    "numinlets": 3,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 290.0, 274.5, 22.0 ],
                    "text": "mUnit.assert in1 * 2 == in2 @name doubled"
                }
            },
            {
                "box": {
                    "id": "obj-12",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 179.0, 211.0, 115.5, 22.0 ],
                    "text": "t b b"
                }
            },
            {
                "box": {
                    "id": "obj-13",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 343.25, 243.0, 290.0, 47.0 ],
                    "text": "approx(actual, expected, abs): quote an expression that has commas. Passes within 0.001, fails within 0.0001"
                }
            },
            {
                "box": {
                    "id": "obj-14",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 638.0, 250.0, 53.0, 22.0 ],
                    "text": "0.5004"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-15",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 319.5, 290.0, 337.5, 22.0 ],
                    "text": "mUnit.assert \"approx(in1, 0.5, 0.001)\" @name near"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-16",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 319.5, 325.0, 357.0, 22.0 ],
                    "text": "mUnit.assert \"approx(in1, 0.5, 0.0001)\" @name tooFar"
                }
            },
            {
                "box": {
                    "id": "obj-17",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 726.0, 244.5, 290.0, 33.0 ],
                    "text": "equals(actual, expected) on a list. Fails, and the diff says which element differs ($[2])"
                }
            },
            {
                "box": {
                    "id": "obj-18",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 1022.0, 259.0, 46.5, 22.0 ],
                    "text": "1 2 4"
                }
            },
            {
                "box": {
                    "color": [ 0.9490196078431372, 0.14901960784313725, 0.07450980392156863, 1.0 ],
                    "id": "obj-19",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 671.0, 290.0, 370.0, 22.0 ],
                    "text": "mUnit.assert \"equals(in1, [1, 2, 3])\" @name listEquals"
                }
            },
            {
                "box": {
                    "id": "obj-20",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 371.0, 292.0, 47.0 ],
                    "text": "Inputs can be any type: a symbol compares with === (single quotes: Max strips double quotes in an object box), a list has a length"
                }
            },
            {
                "box": {
                    "id": "obj-21",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.0, 396.0, 46.5, 22.0 ],
                    "text": "hello"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-22",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 426.0, 318.0, 22.0 ],
                    "text": "mUnit.assert in1 === 'hello' @name symbolInput"
                }
            },
            {
                "box": {
                    "id": "obj-23",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 319.0, 470.0, 66.0, 22.0 ],
                    "text": "10 20 30"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-24",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 20.0, 496.0, 318.0, 22.0 ],
                    "text": "mUnit.assert in1.length === 3 @name listLength"
                }
            },
            {
                "box": {
                    "id": "obj-25",
                    "linecount": 2,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 391.0, 378.0, 290.0, 33.0 ],
                    "text": "The measures work on lists of numbers: rms, peak, dc, maxDiff and snr (in dB). Passes."
                }
            },
            {
                "box": {
                    "id": "obj-26",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 781.0, 392.0, 124.5, 22.0 ],
                    "text": "0.1 -0.1 0.2 -0.2"
                }
            },
            {
                "box": {
                    "color": [ 0.1803921568627451, 0.8, 0.44313725490196076, 1.0 ],
                    "id": "obj-27",
                    "maxclass": "newobj",
                    "numinlets": 2,
                    "numoutlets": 0,
                    "patching_rect": [ 385.0, 426.0, 415.5, 22.0 ],
                    "text": "mUnit.assert \"rms(in1) < 0.5 && peak(in1) <= 0.2\" @name quiet"
                }
            },
            {
                "box": {
                    "id": "obj-28",
                    "linecount": 3,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 522.0, 453.0, 278.0, 47.0 ],
                    "text": "Every helper is also passed to custom asserts (see failureFilesExample) and exported from libmunit."
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-11", 2 ],
                    "source": [ "obj-10", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-10", 0 ],
                    "source": [ "obj-12", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-9", 0 ],
                    "source": [ "obj-12", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-15", 1 ],
                    "midpoints": [ 647.5, 282.0, 647.5, 282.0 ],
                    "order": 1,
                    "source": [ "obj-14", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-16", 1 ],
                    "midpoints": [ 647.5, 282.0, 667.0, 282.0 ],
                    "order": 0,
                    "source": [ "obj-14", 0 ]
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
                    "destination": [ "obj-22", 1 ],
                    "source": [ "obj-21", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-24", 1 ],
                    "source": [ "obj-23", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-27", 1 ],
                    "source": [ "obj-26", 0 ]
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
                    "destination": [ "obj-7", 0 ],
                    "source": [ "obj-6", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-12", 0 ],
                    "source": [ "obj-7", 5 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-14", 0 ],
                    "midpoints": [ 102.3, 237.0, 647.5, 237.0 ],
                    "source": [ "obj-7", 4 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-18", 0 ],
                    "midpoints": [ 84.1, 237.0, 1031.5, 237.0 ],
                    "source": [ "obj-7", 3 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-21", 0 ],
                    "midpoints": [ 65.9, 237.0, 6.0, 237.0, 6.0, 357.0, 328.5, 357.0 ],
                    "source": [ "obj-7", 2 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-23", 0 ],
                    "midpoints": [ 47.7, 237.0, 6.0, 237.0, 6.0, 465.0, 328.5, 465.0 ],
                    "source": [ "obj-7", 1 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-26", 0 ],
                    "midpoints": [ 29.5, 237.0, 6.0, 237.0, 6.0, 357.0, 790.5, 357.0 ],
                    "source": [ "obj-7", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-11", 1 ],
                    "source": [ "obj-9", 0 ]
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