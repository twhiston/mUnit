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
			100,
			80,
			820,
			780
		],
		"gridsize": [
			15,
			15
		],
		"showrootpatcherontab": 0,
		"showontab": 0,
		"boxes": [
			{
				"box": {
					"border": 0,
					"filename": "helpname.js",
					"id": "obj-1",
					"ignoreclick": 1,
					"jsarguments": [
						"mUnit.assert~"
					],
					"maxclass": "jsui",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"parameter_enable": 0,
					"patching_rect": [
						10,
						10,
						305,
						55
					]
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						459,
						85,
						160,
						22
					],
					"saved_object_attributes": {
						"filename": "helpstarter.js",
						"parameter_enable": 0
					},
					"text": "js helpstarter.js mUnit.assert~"
				}
			},
			{
				"box": {
					"id": "obj-3",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
							0,
							26,
							820,
							754
						],
						"gridsize": [
							5,
							5
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-1",
									"border": 0,
									"filename": "helpdetails.js",
									"ignoreclick": 1,
									"jsarguments": [
										"mUnit.assert~"
									],
									"maxclass": "jsui",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"parameter_enable": 0,
									"patching_rect": [
										10,
										10,
										620,
										125
									]
								}
							},
							{
								"box": {
									"id": "obj-2",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										150,
										780,
										91
									],
									"text": "[mUnit.assert~] is an assert for signals. It records @duration ms (default 1000) of its signal inlets into its own buffer~, starting when the suite starts (@trigger auto) or on a bang to the left inlet (@trigger manual), then evaluates the expression with each channel as a list of samples: in1, and with @channels 2 also in2. All the mUnit.assert helpers and attributes apply, plus freq(x): the frequency in Hz from the zero crossings. The default expression is rms(in1) > 0. The outlet bangs once the capture has been evaluated. Give it a @timeout, so a suite with DSP off still ends.",
									"linecount": 6
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										256,
										300,
										22
									],
									"text": "mUnit.stimulus~ @type sine @freq 440. @amp 0.5",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										291,
										741,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(rms(in1), 0.3536, 0.005)\" @duration 200 @timeout 10000 @name sine",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										326,
										99,
										22
									],
									"text": "print captured"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										356,
										741,
										22
									],
									"text": "A sine, measured: 440 Hz within 1 Hz, and rms 0.5 / sqrt(2). The outlet bangs once the capture is in."
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										393,
										288,
										22
									],
									"text": "mUnit.stimulus~ @type noise @seed 7 @amp 0.5",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										428,
										105,
										22
									],
									"text": "lores~ 1000 0.5",
									"outlettype": [
										"signal"
									]
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										463,
										609,
										22
									],
									"text": "mUnit.assert~ \"rms(in1) > 0.05 && peak(in1) <= 0.5\" @duration 200 @timeout 10000 @name filtered",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										493,
										609,
										36
									],
									"text": "Seeded noise through a filter: the unit under test sits between the stimulus and the assert, and gets the same samples every run.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"patching_rect": [
										20,
										549,
										225,
										22
									],
									"text": "mUnit.harness @configFolder signal",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"patching_rect": [
										20,
										584,
										92,
										22
									],
									"text": "mUnit.handler",
									"outlettype": [
										"bang",
										"bang"
									]
								}
							},
							{
								"box": {
									"id": "obj-13",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										265,
										549,
										535,
										118
									],
									"text": "The suite runs when this help opens: mUnit.harness reads help/signal/munit.config.js and configures mUnit.handler, then every mUnit.loadbang fires. Results go to help/logs. To run again, close and reopen the file. Keep one suite open at a time: asserts register with whichever handler is running. help/signal/munit.config.js asks for the NonRealTime audio driver at 44.1 kHz (the rate of the sounds Max ships with), which needs no audio hardware and renders faster than real time. The handler puts your audio settings back when the suite ends.",
									"linecount": 8
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-4",
										1
									],
									"source": [
										"obj-3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-5",
										0
									],
									"source": [
										"obj-4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-8",
										0
									],
									"source": [
										"obj-7",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-9",
										1
									],
									"source": [
										"obj-8",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-12",
										0
									],
									"source": [
										"obj-11",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						85,
						55,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p basic",
					"varname": "basic_tab"
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
							0,
							26,
							820,
							754
						],
						"gridsize": [
							15,
							15
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										24
									],
									"text": "Two channels, and starting by hand",
									"fontsize": 14,
									"fontface": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										45,
										244,
										22
									],
									"text": "mUnit.stimulus~ @type sine @freq 440.",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										284,
										45,
										244,
										22
									],
									"text": "mUnit.stimulus~ @type sine @freq 880.",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										80,
										672,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in2), 2 * freq(in1), 1)\" @channels 2 @duration 200 @timeout 10000 @name stereo",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										110,
										672,
										36
									],
									"text": "@channels 2: the second signal inlet is captured too, as in2. Here in2 must be an octave above in1.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										166,
										99,
										22
									],
									"text": "mUnit.loadbang",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"patching_rect": [
										20,
										201,
										73,
										22
									],
									"text": "delay 1000",
									"outlettype": [
										"bang"
									]
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"patching_rect": [
										20,
										236,
										42,
										22
									],
									"text": "t b b",
									"outlettype": [
										"bang",
										"bang"
									]
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										100,
										271,
										351,
										22
									],
									"text": "mUnit.stimulus~ @type sine @freq 1000. @trigger manual",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										306,
										640,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in1), 1000, 1)\" @trigger manual @duration 200 @timeout 10000 @name manual",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										336,
										640,
										49
									],
									"text": "@trigger manual on both: one bang starts the stimulus and the capture together, here one second after the suite starts. In a test it could come from anything, e.g. once a preset has loaded.",
									"linecount": 3
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-4",
										1
									],
									"source": [
										"obj-2",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-4",
										2
									],
									"source": [
										"obj-3",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-7",
										0
									],
									"source": [
										"obj-6",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-8",
										0
									],
									"source": [
										"obj-7",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-9",
										0
									],
									"source": [
										"obj-8",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-10",
										1
									],
									"source": [
										"obj-9",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-10",
										0
									],
									"source": [
										"obj-8",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						125,
						73,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p channels"
				}
			},
			{
				"box": {
					"id": "obj-5",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
							0,
							26,
							820,
							754
						],
						"gridsize": [
							15,
							15
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										24
									],
									"text": "Comparing with a reference file",
									"fontsize": 14,
									"fontface": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										780,
										118
									],
									"text": "@reference <file.wav> compares the capture with references/<file> next to the test patch instead of evaluating an expression. It passes when the signal-to-noise ratio against the reference is at least @snr dB (default 60, about 0.1% of the signal); @exact 1 demands identical samples. @maxLatency <samples> (default 0) lets the capture lead or lag the reference by up to that many samples; the alignment is found by cross-correlation and reported as latency. A failure says the SNR, the largest difference and the latency, and keeps the capture as actual.wav in the run's artifacts folder, next to a link to the reference. References are compared at the suite's sample rate, so set one with the dsp config. When there is no such file in references/, a file of that name on Max's search path is used instead, such as the sounds Max ships with.",
									"linecount": 8
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										173,
										281,
										22
									],
									"text": "mUnit.stimulus~ @type file @file jongly.aif",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										208,
										659,
										22
									],
									"text": "mUnit.assert~ @reference jongly.aif @snr 40 @maxLatency 256 @duration 500 @timeout 10000 @name sameFile",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										238,
										659,
										49
									],
									"text": "Live: the stimulus plays jongly.aif, one of Max's own sounds, and the capture is compared with that same file from the search path. The first half second must match at 40 dB or better, aligned within 256 samples.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										307,
										780,
										77
									],
									"text": "[mUnit.stimulus~ @type noise @seed 7 @amp 0.5]\n  |\n[lores~ 1000 0.5]\n  |\n[mUnit.assert~ @reference lores.wav @snr 50 @maxLatency 64 @duration 300 @timeout 10000 @name filter]",
									"linecount": 5,
									"fontname": "Menlo"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										394,
										780,
										77
									],
									"text": "The usual case is a reference taken from the capture. The first run fails with \"no reference at ...; take it with munit run --take-references\". Run once taking references (munit run <patch> --take-references, takeReferences: true in munit.config.js, or a takeReferences 1 message to mUnit.handler): the capture is written as a 32-bit float wav in references/. Review it and commit it with the test. signalExample in examples/ has this test, with its reference.",
									"linecount": 5
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-4",
										1
									],
									"source": [
										"obj-3",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						165,
						80,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p reference"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
							0,
							26,
							820,
							754
						],
						"gridsize": [
							15,
							15
						],
						"showontab": 1,
						"boxes": [],
						"lines": []
					},
					"patching_rect": [
						390,
						205,
						50,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p ?",
					"varname": "q_tab"
				}
			}
		],
		"lines": [],
		"autosave": 0
	}
}
