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
						"mUnit.stimulus~"
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
					"text": "js helpstarter.js mUnit.stimulus~"
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
										"mUnit.stimulus~"
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
										63
									],
									"text": "[mUnit.stimulus~] makes a repeatable test signal for mUnit.assert~. It starts when the suite starts (@trigger auto, the default) or on a bang (@trigger manual), at the same moment as an mUnit.assert~ capture, and stop stops it. Everything but a sound file is computed sample by sample from a counter in gen~, so two runs give the same samples whatever the vector size. The types are on the next tab.",
									"linecount": 4
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
										228,
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
										263,
										722,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in1), 440, 1) && approx(peak(in1), 0.5, 0.01)\" @duration 200 @timeout 10000 @name sine",
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
										293,
										722,
										22
									],
									"text": "A sine at 440 Hz with @amp 0.5, captured for 200 ms and measured."
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
										330,
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
										365,
										67,
										22
									],
									"text": "delay 500",
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
										400,
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
										435,
										344,
										22
									],
									"text": "mUnit.stimulus~ @type sine @freq 220. @trigger manual",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										464,
										400,
										36,
										22
									],
									"text": "stop"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										470,
										634,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in1), 220, 1)\" @trigger manual @duration 200 @timeout 10000 @name manual",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										500,
										634,
										36
									],
									"text": "@trigger manual: a bang starts it, so a stimulus and a capture can be started together by hand, here half a second after the suite starts. stop silences it.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"patching_rect": [
										20,
										556,
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
									"id": "obj-14",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"patching_rect": [
										20,
										591,
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
									"id": "obj-15",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										265,
										556,
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
										"obj-9",
										0
									],
									"source": [
										"obj-10",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-11",
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
										"obj-11",
										0
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
										"obj-14",
										0
									],
									"source": [
										"obj-13",
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
									"text": "The signal types",
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
										77
									],
									"text": "@type sine (default): a sine at @freq Hz (default 440) and @amp (default 1). @type impulse: one sample of @amp, then silence. @type sweep: a linear sweep from @freq to @freq2 (default 2000) over @duration ms (default 1000). @type noise: white noise from @seed (default 1), the same every run. @type silence. @type file @file <sound file>: a sound file from the search path, played once. Each is captured by an mUnit.assert~ below and checked.",
									"linecount": 5
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
										127,
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
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										162,
										521,
										22
									],
									"text": "mUnit.assert~ \"approx(freq(in1), 440, 1)\" @duration 200 @timeout 10000 @name sine",
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
										561,
										127,
										239,
										36
									],
									"text": "A sine: the frequency is measured from the zero crossings.",
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
										199,
										250,
										22
									],
									"text": "mUnit.stimulus~ @type impulse @amp 0.8",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										234,
										678,
										22
									],
									"text": "mUnit.assert~ \"approx(peak(in1), 0.8, 1e-6) && rms(in1) < 0.05\" @duration 200 @timeout 10000 @name impulse",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										264,
										678,
										22
									],
									"text": "An impulse: one sample of 0.8, so the peak is 0.8 and the rms tiny."
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										301,
										426,
										22
									],
									"text": "mUnit.stimulus~ @type sweep @freq 200. @freq2 2000. @duration 200.",
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
										336,
										590,
										22
									],
									"text": "mUnit.assert~ \"freq(in1) > 200 && freq(in1) < 2000\" @duration 200 @timeout 10000 @name sweep",
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
										366,
										590,
										22
									],
									"text": "A sweep from 200 to 2000 Hz over 200 ms: the average frequency lies between."
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										403,
										231,
										22
									],
									"text": "mUnit.stimulus~ @type noise @seed 7",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										438,
										571,
										22
									],
									"text": "mUnit.assert~ \"rms(in1) > 0.1 && peak(in1) <= 1\" @duration 200 @timeout 10000 @name noise",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-14",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										468,
										571,
										22
									],
									"text": "Seeded white noise: the same samples on every run and every machine."
								}
							},
							{
								"box": {
									"id": "obj-15",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										505,
										193,
										22
									],
									"text": "mUnit.stimulus~ @type silence",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-16",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										540,
										483,
										22
									],
									"text": "mUnit.assert~ \"peak(in1) < 1e-9\" @duration 200 @timeout 10000 @name silence",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-17",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										523,
										505,
										277,
										36
									],
									"text": "Silence: a control, or what a patch does with no input.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "obj-18",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										577,
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
									"id": "obj-19",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 1,
									"patching_rect": [
										20,
										612,
										458,
										22
									],
									"text": "mUnit.assert~ \"rms(in1) > 0.01\" @duration 500 @timeout 10000 @name file",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-20",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										498,
										577,
										302,
										36
									],
									"text": "A sound file from Max's media folder, played once from the start of the capture.",
									"linecount": 2
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
										"obj-7",
										1
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
										"obj-13",
										1
									],
									"source": [
										"obj-12",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-16",
										1
									],
									"source": [
										"obj-15",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-19",
										1
									],
									"source": [
										"obj-18",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						125,
						55,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p types"
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
						"boxes": [],
						"lines": []
					},
					"patching_rect": [
						390,
						165,
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
