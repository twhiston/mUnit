{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100.0,
      100.0,
      620.0,
      568.0
    ],
    "boxes": [ {"box": {"id": "obj-of1", "maxclass": "message", "text": "open folder", "numinlets": 2, "numoutlets": 1, "outlettype": [""], "patching_rect": [400.0, 120.0, 75.0, 22.0]}}, {"box": {"id": "obj-of2", "maxclass": "newobj", "text": "mUnit.examples.openFolder", "numinlets": 1, "numoutlets": 0, "patching_rect": [400.0, 153.0, 165.0, 22.0]}}, {"box": {"id": "obj-of1c", "maxclass": "comment", "text": "this example's files and results", "numinlets": 1, "numoutlets": 0, "patching_rect": [480.0, 120.0, 190.0, 20.0]}},
      {
        "box": {
          "id": "c-title",
          "linecount": 1,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            10.0,
            560.0,
            22.0
          ],
          "text": "Gen in mUnit: gen~ is an ordinary signal object"
        }
      },
      {
        "box": {
          "id": "c-intro",
          "linecount": 4,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            36.0,
            560.0,
            62.0
          ],
          "text": "Nothing special is needed to test Gen inside Max: patch [gen~] between a stimulus and a signal assert, as any MSP object. munit.config.js sets the non-realtime driver, so the suite renders faster than real time and the same on every run. (Testing an exported gen~ outside Max, without a licence, is the other half of the story.)"
        }
      },
      {
        "box": {
          "id": "harness",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            110.0,
            90.0,
            22.0
          ],
          "text": "mUnit.harness"
        }
      },
      {
        "box": {
          "id": "handler",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            150.0,
            90.0,
            22.0
          ],
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
          "patching_rect": [
            20.0,
            200.0,
            560.0,
            36.0
          ],
          "text": "1. An embedded [gen~]: a gain of 0.5 on a 440 Hz sine. The assert measures frequency and level, as for any signal object. Passes."
        }
      },
      {
        "box": {
          "id": "stim-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            244.0,
            280.0,
            22.0
          ],
          "text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5"
        }
      },
      {
        "box": {
          "id": "gen-embedded",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            20.0,
            284.0,
            44.0,
            22.0
          ],
          "text": "gen~",
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "dsp.gen",
            "rect": [
              0.0,
              0.0,
              400.0,
              300.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "gen-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    30.0,
                    30.0,
                    40.0,
                    22.0
                  ],
                  "text": "in 1"
                }
              },
              {
                "box": {
                  "id": "gen-mul",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    30.0,
                    80.0,
                    46.0,
                    22.0
                  ],
                  "text": "* 0.5"
                }
              },
              {
                "box": {
                  "id": "gen-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    30.0,
                    130.0,
                    46.0,
                    22.0
                  ],
                  "text": "out 1"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "gen-mul",
                    0
                  ],
                  "source": [
                    "gen-in",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "gen-out",
                    0
                  ],
                  "source": [
                    "gen-mul",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "assert-1",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            324.0,
            560.0,
            22.0
          ],
          "text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.1768, 0.005)\" @duration 200 @timeout 10000 @name gen_embedded"
        }
      },
      {
        "box": {
          "id": "c-file",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            374.0,
            560.0,
            36.0
          ],
          "text": "2. [gen~ gain] loads gain.gendsp from this folder: the same gain as a file, tested the same way. Passes."
        }
      },
      {
        "box": {
          "id": "stim-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            418.0,
            280.0,
            22.0
          ],
          "text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5"
        }
      },
      {
        "box": {
          "id": "gen-file",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            20.0,
            458.0,
            70.0,
            22.0
          ],
          "text": "gen~ gain"
        }
      },
      {
        "box": {
          "id": "assert-2",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            498.0,
            560.0,
            22.0
          ],
          "text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.1768, 0.005)\" @duration 200 @timeout 10000 @name gen_file"
        }
      }
    ],
    "lines": [ {"patchline": {"destination": ["obj-of2", 0], "source": ["obj-of1", 0]}},
      {
        "patchline": {
          "destination": [
            "handler",
            0
          ],
          "source": [
            "harness",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "gen-embedded",
            0
          ],
          "source": [
            "stim-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "assert-1",
            1
          ],
          "source": [
            "gen-embedded",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "gen-file",
            0
          ],
          "source": [
            "stim-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "assert-2",
            1
          ],
          "source": [
            "gen-file",
            0
          ]
        }
      }
    ],
    "autosave": 0
  }
}
