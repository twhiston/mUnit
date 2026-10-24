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
		"rect": [
			100,
			100,
			820,
			799
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
						"mUnit.assert"
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
					"text": "js helpstarter.js mUnit.assert"
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
							"revision": 4,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0,
							26,
							820,
							773
						],
						"gridsize": [
							5,
							5
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-25",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										613,
										318,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-26",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										683,
										353,
										29.5,
										22
									],
									"text": "foo"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-27",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										361,
										393,
										351,
										22
									],
									"text": "mUnit.assert in1 === 'foo' @name whatAFailureLooksLike"
								}
							},
							{
								"box": {
									"id": "obj-28",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										361,
										358,
										301,
										33
									],
									"text": "Write string literals with single quotes: Max strips double quotes from an object box's arguments."
								}
							},
							{
								"box": {
									"border": 0,
									"filename": "helpdetails.js",
									"id": "obj-1",
									"ignoreclick": 1,
									"jsarguments": [
										"mUnit.assert"
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
										790,
										140
									]
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										226,
										170,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										226,
										205,
										30,
										22
									],
									"text": "3"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										240,
										225,
										22
									],
									"text": "mUnit.assert in1 > 2 @name greater"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										10,
										170,
										221,
										47
									],
									"text": "mUnit.loadbang fires once the handler is ready, so the input is not sent too early."
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										384,
										170,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										384,
										205,
										128,
										22
									],
									"text": "t 3 5"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 0,
									"patching_rect": [
										275,
										240,
										237,
										22
									],
									"text": "mUnit.assert in1 < in2 @name ordered"
								}
							},
							{
								"box": {
									"id": "obj-12",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										275,
										270,
										237,
										33
									],
									"text": "Right to left: the cold input (in2) first, then the hot one (in1) evaluates."
								}
							},
							{
								"box": {
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										238,
										318,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-14",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										238,
										353,
										73,
										22
									],
									"text": "symbol bar"
								}
							},
							{
								"box": {
									"color": [
										0.9490196078431372,
										0.14901960784313725,
										0.07450980392156863,
										1
									],
									"id": "obj-15",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										15,
										393,
										322,
										22
									],
									"text": "mUnit.assert in1 === 'foo' @name whatAFailureLooksLike"
								}
							},
							{
								"box": {
									"id": "obj-16",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										340,
										196,
										47
									],
									"text": "A failure on purpose. The Max console says: expected foo, got bar."
								}
							},
							{
								"box": {
									"id": "obj-17",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										238,
										448,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-18",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										238,
										483,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-19",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										516,
										237,
										22
									],
									"text": "mUnit.assert @name defaultExpression"
								}
							},
							{
								"box": {
									"id": "obj-20",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										546,
										225,
										20
									],
									"text": "No expression: the default is in1 === 1.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-21",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										601,
										92,
										22
									],
									"text": "mUnit.harness"
								}
							},
							{
								"box": {
									"id": "obj-22",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										20,
										639,
										92,
										22
									],
									"text": "mUnit.handler"
								}
							},
							{
								"box": {
									"id": "obj-23",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										132,
										601,
										522,
										60
									],
									"text": "The suite runs when this help opens: mUnit.harness reads help/munit.config.js and configures mUnit.handler, then every mUnit.loadbang fires. Results go to help/logs. To run again, close and reopen the file. Keep one suite open at a time: asserts register with whichever handler is running."
								}
							}
						],
						"lines": [
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
							},
							{
								"patchline": {
									"destination": [
										"obj-15",
										1
									],
									"source": [
										"obj-14",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-18",
										0
									],
									"source": [
										"obj-17",
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
							},
							{
								"patchline": {
									"destination": [
										"obj-22",
										0
									],
									"source": [
										"obj-21",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-26",
										0
									],
									"source": [
										"obj-25",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-27",
										1
									],
									"source": [
										"obj-26",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-4",
										0
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
										1
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
										"obj-11",
										2
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
										"obj-11",
										1
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
						85,
						55,
						22
					],
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
							"revision": 4,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										22
									],
									"text": "Attributes",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 5,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										695,
										74
									],
									"text": "@maxCalls (default 1): how many inputs the assert evaluates; an expression assert fails once it has been false this many times, and ignores inputs after its verdict. @timeout: how many ms the assert may take, counted from when the suite starts or the first input, whichever is first; a timeout counts as a failed call. @accumulate 1: sum (or, for symbols, concatenate) each input over the calls before evaluating. @skip 1: report the assert as skipped without evaluating it. @only 1: report every other assert in the suite as skipped. @name (default: a UUID) and @suite (default: the patch name) label the test in the console and the results."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										146,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										181,
										67,
										22
									],
									"text": "metro 100"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 5,
									"numoutlets": 4,
									"outlettype": [
										"int",
										"",
										"",
										"int"
									],
									"patching_rect": [
										20,
										216,
										55,
										22
									],
									"text": "counter"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										251,
										300,
										22
									],
									"text": "mUnit.assert in1 >= 3 @maxCalls 5 @name counts"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										140,
										146,
										99,
										22
									],
									"text": "mUnit.teardown"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										140,
										181,
										36,
										22
									],
									"text": "stop"
								}
							},
							{
								"box": {
									"id": "obj-9",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										281,
										300,
										47
									],
									"text": "@maxCalls 5: up to five inputs; passes at the first true one. mUnit.teardown stops the metro once the results are final."
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										350,
										146,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 3,
									"outlettype": [
										"bang",
										"bang",
										"int"
									],
									"patching_rect": [
										350,
										181,
										42,
										22
									],
									"text": "uzi 3"
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										350,
										216,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										350,
										251,
										376,
										22
									],
									"text": "mUnit.assert in1 >= 3 @accumulate 1 @maxCalls 3 @name sums"
								}
							},
							{
								"box": {
									"id": "obj-14",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										350,
										281,
										376,
										33
									],
									"text": "@accumulate 1: three 1s add up to 3 before the expression sees them."
								}
							},
							{
								"box": {
									"id": "obj-15",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										355,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-16",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										390,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"color": [
										0.9450980392156862,
										0.7686274509803921,
										0.058823529411764705,
										1
									],
									"id": "obj-17",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										425,
										275,
										22
									],
									"text": "mUnit.assert in1 == 1 @skip 1 @name notYet"
								}
							},
							{
								"box": {
									"id": "obj-18",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										455,
										275,
										33
									],
									"text": "@skip 1: reported as skipped and never evaluated. The box turns yellow."
								}
							},
							{
								"box": {
									"id": "obj-19",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										325,
										355,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-20",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										325,
										390,
										67,
										22
									],
									"text": "delay 300"
								}
							},
							{
								"box": {
									"id": "obj-21",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										325,
										425,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-22",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										325,
										460,
										313,
										22
									],
									"text": "mUnit.assert in1 == 1 @timeout 2000 @name inTime"
								}
							},
							{
								"box": {
									"id": "obj-23",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										325,
										490,
										253,
										60
									],
									"text": "@timeout 2000: the input arrives after 300 ms, in time. With @maxCalls 3 the clock would restart after each timeout, allowing 6 s in all."
								}
							},
							{
								"box": {
									"id": "obj-24",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										578,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-25",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										613,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-26",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										648,
										269,
										22
									],
									"text": "mUnit.assert @name named @suite helpSuite"
								}
							},
							{
								"box": {
									"id": "obj-27",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										678,
										261,
										47
									],
									"text": "@name and @suite: how the test appears in the console, results.json and the JUnit testsuite."
								}
							},
							{
								"box": {
									"id": "obj-28",
									"linecount": 7,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										319,
										578,
										244,
										100
									],
									"text": "@only 1 on one assert skips every other one in the suite, so it is not shown live here.\nSee the example patcher from the launcher to see this is in action.\n\nSet forbidOnly: true in munit.config.js on CI, so an @only can't be committed by mistake."
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-11",
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
										"obj-12",
										0
									],
									"source": [
										"obj-11",
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
										0
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
										"obj-17",
										1
									],
									"source": [
										"obj-16",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-20",
										0
									],
									"source": [
										"obj-19",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-21",
										0
									],
									"source": [
										"obj-20",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-22",
										1
									],
									"source": [
										"obj-21",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-25",
										0
									],
									"source": [
										"obj-24",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-26",
										1
									],
									"source": [
										"obj-25",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-4",
										0
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
										"obj-6",
										1
									],
									"source": [
										"obj-5",
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
										"obj-4",
										0
									],
									"midpoints": [
										149.5,
										204,
										99,
										204,
										99,
										177,
										29.5,
										177
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
						86,
						22
					],
					"text": "p attributes"
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
							"revision": 4,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										22
									],
									"text": "Helpers: approx, equals and the measures",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										711,
										60
									],
									"text": "Expressions can call approx(actual, expected, abs = 1e-6, rel = 0), equals(actual, expected) and snapshot(actual, name?), and for lists of numbers rms(x), peak(x), dc(x), maxDiff(a, e) and snr(a, reference) in dB. When a helper fails, the failure reports its expected value, actual value and the differences. Quote an expression that contains commas, so Max keeps it as one argument. For an expression whose top level is one comparison, the left side is reported as the actual value and the right side as the expected one."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										132,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										167,
										48,
										22
									],
									"text": "0.5001"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										202,
										319,
										22
									],
									"text": "mUnit.assert \"approx(in1, 0.5, 0.001)\" @name near"
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
										232,
										319,
										20
									],
									"text": "approx: within an absolute tolerance.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										369,
										132,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										369,
										167,
										42,
										22
									],
									"text": "1 2 3"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										369,
										202,
										338,
										22
									],
									"text": "mUnit.assert \"equals(in1, [1, 2, 3])\" @name sameList"
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										369,
										232,
										338,
										20
									],
									"text": "equals: lists, dicts and symbols, exactly.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										279,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										314,
										124,
										22
									],
									"text": "0.1 -0.2 0.15 0.05"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										349,
										395,
										22
									],
									"text": "mUnit.assert \"rms(in1) < 0.5 && peak(in1) <= 0.2\" @name quiet"
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
										379,
										395,
										20
									],
									"text": "The measures take a list of numbers.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-15",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										445,
										279,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-16",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										445,
										314,
										80,
										22
									],
									"text": "hello world"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-17",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										445,
										349,
										300,
										22
									],
									"text": "mUnit.assert in1.length === 2 @name listLength"
								}
							},
							{
								"box": {
									"id": "obj-18",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										445,
										379,
										300,
										33
									],
									"text": "Lists arrive as JavaScript arrays: .length and in1[0] === 'hello' work."
								}
							},
							{
								"box": {
									"id": "obj-19",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										440,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-20",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										20,
										475,
										42,
										22
									],
									"text": "t b b"
								}
							},
							{
								"box": {
									"id": "obj-21",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										510,
										30,
										22
									],
									"text": "11"
								}
							},
							{
								"box": {
									"id": "obj-22",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										80,
										510,
										30,
										22
									],
									"text": "10"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-23",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 0,
									"patching_rect": [
										20,
										545,
										395,
										22
									],
									"text": "mUnit.assert \"approx(in1, in2, 0, 0.2)\" @name within20percent"
								}
							},
							{
								"box": {
									"id": "obj-24",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										575,
										395,
										20
									],
									"text": "rel 0.2: within 20% of the expected value, in2.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-25",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										445,
										440,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-26",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										445,
										475,
										42,
										22
									],
									"text": "t b b"
								}
							},
							{
								"box": {
									"id": "obj-27",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										445,
										510,
										30,
										22
									],
									"text": "3"
								}
							},
							{
								"box": {
									"id": "obj-28",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										505,
										510,
										30,
										22
									],
									"text": "6"
								}
							},
							{
								"box": {
									"id": "obj-29",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										445,
										545,
										30,
										22
									],
									"text": "* 2"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-30",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 0,
									"patching_rect": [
										445,
										580,
										244,
										22
									],
									"text": "mUnit.assert in1 == in2 @name doubled"
								}
							},
							{
								"box": {
									"id": "obj-31",
									"linecount": 5,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										445,
										610,
										192,
										74
									],
									"text": "The unit under test feeds in1, the expected value in2. A failure would read: in1 == in2 was not true after 1 of 1 call(s): expected 6, got 5."
								}
							}
						],
						"lines": [
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
										0
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
										"obj-17",
										1
									],
									"source": [
										"obj-16",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-20",
										0
									],
									"source": [
										"obj-19",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-21",
										0
									],
									"source": [
										"obj-20",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-22",
										0
									],
									"source": [
										"obj-20",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-23",
										1
									],
									"source": [
										"obj-21",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-23",
										2
									],
									"source": [
										"obj-22",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-26",
										0
									],
									"source": [
										"obj-25",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-27",
										0
									],
									"source": [
										"obj-26",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-28",
										0
									],
									"source": [
										"obj-26",
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-29",
										0
									],
									"source": [
										"obj-27",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-30",
										2
									],
									"source": [
										"obj-28",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-30",
										1
									],
									"source": [
										"obj-29",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-4",
										0
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
										1
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
							}
						]
					},
					"patching_rect": [
						10,
						165,
						67,
						22
					],
					"text": "p helpers"
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
							"revision": 4,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										22
									],
									"text": "Tables of cases: @every and @tolerance",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										744,
										47
									],
									"text": "@every 1 makes an expression pass only when every call is true, up to @maxCalls, rather than any one of them. It fails on the first false case and says which call it was. @tolerance n lets that many false cases through. One row per message: the input and the expected value."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										104,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										139,
										92,
										22
									],
									"text": "1 2, 2 4, 3 6"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										20,
										174,
										73,
										22
									],
									"text": "unpack 0 0"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										20,
										209,
										30,
										22
									],
									"text": "* 2"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 0,
									"patching_rect": [
										20,
										244,
										376,
										22
									],
									"text": "mUnit.assert in1 == in2 @every 1 @maxCalls 3 @name doubles"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										274,
										376,
										47
									],
									"text": "unpack sends the expected value (right outlet) first, then the input goes through the unit under test into in1. Three cases, all true: passes."
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										348,
										99,
										22
									],
									"text": "mUnit.loadbang"
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
										20,
										383,
										92,
										22
									],
									"text": "1 2, 2 5, 3 6"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"int",
										"int"
									],
									"patching_rect": [
										20,
										418,
										73,
										22
									],
									"text": "unpack 0 0"
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										"int"
									],
									"patching_rect": [
										20,
										453,
										30,
										22
									],
									"text": "* 2"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 3,
									"numoutlets": 0,
									"patching_rect": [
										20,
										488,
										458,
										22
									],
									"text": "mUnit.assert in1 == in2 @every 1 @maxCalls 3 @tolerance 1 @name lenient"
								}
							},
							{
								"box": {
									"id": "obj-14",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										518,
										400,
										33
									],
									"text": "The second case is wrong, but @tolerance 1 lets one false case through: passes. Without it, the failure would say: call 2 of 3, expected 5, got 4."
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-11",
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
										"obj-12",
										0
									],
									"source": [
										"obj-11",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-13",
										2
									],
									"source": [
										"obj-11",
										1
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
										"obj-4",
										0
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
										"obj-6",
										0
									],
									"source": [
										"obj-5",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-7",
										2
									],
									"source": [
										"obj-5",
										1
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
										0
									],
									"source": [
										"obj-9",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						205,
						61,
						22
					],
					"text": "p tables"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										686,
										22
									],
									"text": "Dicts and snapshots",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 10,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										39,
										686,
										141
									],
									"text": "A dict on a data inlet arrives as a plain object, so an expression can read its keys. snapshot(in1) compares it, or any value, with references/<name>.json next to the test patch; the name is the assert's @name, or the second argument: snapshot(in1, \"presets/default\"). A missing reference fails. \n\nTaking references makes every snapshot write what it got as its reference and pass: \n        munit run --take-references, \n        MUNIT_TAKE_REFERENCES=1, \n        takeReferences: true in munit.config.js, \n        or a'takeReferences 1\" message to mUnit.handler. On a failure the actual value is kept next to the results, in artifacts/<uuid>/."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										180,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										20,
										215,
										42,
										22
									],
									"text": "t b b"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										43,
										249,
										193,
										22
									],
									"text": "set name munit, set version 2"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 5,
									"outlettype": [
										"dictionary",
										"",
										"",
										"",
										""
									],
									"patching_rect": [
										20,
										285,
										36,
										22
									],
									"saved_object_attributes": {
										"legacy": 1,
										"parameter_enable": 0,
										"parameter_mappable": 0
									},
									"text": "dict"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										320,
										445,
										22
									],
									"text": "mUnit.assert in1.name === 'munit' && in1.version === 2 @name dictKeys"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										350,
										445,
										33
									],
									"text": "The dict is filled, then banged into in1. Numbers survive the round trip, so the comparison is exact."
								}
							},
							{
								"box": {
									"id": "obj-9",
									"linecount": 7,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										274,
										203,
										434,
										100
									],
									"text": "A snapshot test needs a saved patch and a reference, so it isn't live in this help; \n\ntests/\n  my_test.maxpat   [mUnit.assert snapshot(in1) @name settings]\n  references/settings.json\n\nsnapshotExample in examples/ (or from the launcher) has a working example"
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-4",
										0
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
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-6",
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
										"obj-6",
										0
									],
									"source": [
										"obj-5",
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
							}
						]
					},
					"patching_rect": [
						10,
						245,
						55,
						22
					],
					"text": "p dicts"
				}
			},
			{
				"box": {
					"id": "obj-8",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										624,
										22
									],
									"text": "Custom asserts in JavaScript",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 10,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										695,
										141
									],
									"text": "Instead of an expression, pass the name of a JavaScript file on the search path. It exports a function that takes the inputs as an array ([in1, in2, ...]) and returns a State from libmunit: \n        Success passes at once, Fail fails at once (unless @tolerance allows it), Continue means no verdict yet, and Skipped skips.\n \nAn assert that reaches @maxCalls without failing passes. \nA script can't say how many inputs it needs, so set @dataInlets if you need more than one. \nThe second argument holds the helpers (approx, equals, snapshot, rms, ...)\nreturn { state, expected, actual, message } instead of a simple State to report details for test output, and use attachments to keep files with a failure. \ncustomAssert and failureFilesExample in examples/ show both of these in more detail."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "v8.codebox",
									"code": "// munit.help.uniqueValue.js: every input must be new\nconst mLib = require(\"libmunit\");\nconst seen = [];\nfunction assert(data) {\n  const found = seen.includes(data[0]);\n  seen.push(data[0]);\n  return found ? mLib.State.Fail : mLib.State.Continue;\n}\nmodule.exports = assert;",
									"filename": "none",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12,
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										188,
										480,
										165
									],
									"saved_object_attributes": {
										"parameter_enable": 0
									}
								}
							},
							{
								"box": {
									"id": "obj-4",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										368,
										400,
										33
									],
									"text": "A script that throws, or returns something other than a State, counts as Fail."
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										422,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										457,
										55,
										22
									],
									"text": "1, 2, 3"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										492,
										407,
										22
									],
									"text": "mUnit.assert munit.help.uniqueValue.js @maxCalls 3 @name unique"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										522,
										407,
										47
									],
									"text": "Three different values: Continue, Continue, Continue, then @maxCalls is reached: passes. Send 1 twice and it fails. The script lives next to this help file."
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-6",
										0
									],
									"source": [
										"obj-5",
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
							}
						]
					},
					"patching_rect": [
						10,
						285,
						61,
						22
					],
					"text": "p custom"
				}
			},
			{
				"box": {
					"id": "obj-9",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
						"rect": [
							100,
							126,
							820,
							773
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"id": "obj-15",
									"maxclass": "jit.pwindow",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"jit_matrix",
										""
									],
									"patching_rect": [
										263,
										439,
										60,
										60
									],
									"sync": 1
								}
							},
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										780,
										22
									],
									"text": "Matrices: testing Jitter output",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 8,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										40,
										603,
										114
									],
									"text": "A jit_matrix on a data inlet arrives as a value with dim, planes, type and every cell, so in1.dim[0] and in1.planes work in an expression. planeMin(m, plane), planeMean(m, plane) and planeMax(m, plane) give a plane's statistics (planes from 0), cell(m, x, y, plane) one cell, and sameMatrix(a, e, maxDiff, maxFraction) compares two matrices. Char cells are 0 to 255. @reference <file.jxf> compares the matrix with references/<file> next to the test patch instead: @maxDiff is the largest difference a cell may have, @maxFraction the largest fraction of cells that may exceed it (@maxDiff 2 @maxFraction 0.001 is what GPU output needs). A failure keeps actual.jxf, actual.png and diff.png. jitterExample in examples/ has jit.pix and jit.gl.pix shaders read back from the GPU."
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										173,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"bang",
										"bang"
									],
									"patching_rect": [
										20,
										208,
										42,
										22
									],
									"text": "t b b"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										43,
										242,
										63,
										22
									],
									"text": "setall 0.25"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"jit_matrix",
										""
									],
									"patching_rect": [
										20,
										278,
										162,
										22
									],
									"text": "jit.matrix 1 float32 8 8"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 2,
									"outlettype": [
										"jit_matrix",
										""
									],
									"patching_rect": [
										20,
										313,
										136,
										22
									],
									"text": "jit.op @op * @val 2."
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										348,
										546,
										22
									],
									"text": "mUnit.assert \"approx(planeMean(in1, 0), 0.5, 0.001) && in1.dim[0] == 8\" @name doubled"
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "jit.pwindow",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"jit_matrix",
										""
									],
									"patching_rect": [
										260,
										278,
										60,
										60
									],
									"sync": 1
								}
							},
							{
								"box": {
									"id": "obj-10",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										378,
										470,
										33
									],
									"text": "Fill a matrix with 0.25, double it with jit.op and check the mean of plane 0 and the width."
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										20,
										439,
										99,
										22
									],
									"text": "mUnit.loadbang"
								}
							},
							{
								"box": {
									"id": "obj-12",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"jit_matrix",
										""
									],
									"patching_rect": [
										20,
										474,
										168,
										22
									],
									"text": "jit.noise 1 float32 16 16"
								}
							},
							{
								"box": {
									"color": [
										0.1803921568627451,
										0.8,
										0.44313725490196076,
										1
									],
									"id": "obj-13",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										20,
										509,
										603,
										22
									],
									"text": "mUnit.assert \"planeMin(in1, 0) >= 0 && planeMax(in1, 0) <= 1 && in1.planes == 1\" @name inRange"
								}
							},
							{
								"box": {
									"id": "obj-14",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										539,
										603,
										33
									],
									"text": "Random cells, but their range is known. In the results a matrix appears as its shape and cell count, not cell by cell."
								}
							}
						],
						"lines": [
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
							},
							{
								"patchline": {
									"destination": [
										"obj-13",
										1
									],
									"order": 0,
									"source": [
										"obj-12",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-15",
										0
									],
									"order": 1,
									"source": [
										"obj-12",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-4",
										0
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
										1
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-6",
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
										"obj-6",
										0
									],
									"source": [
										"obj-5",
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
										1
									],
									"order": 0,
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
									"order": 1,
									"source": [
										"obj-7",
										0
									]
								}
							}
						]
					},
					"patching_rect": [
						10,
						325,
						73,
						22
					],
					"text": "p matrices"
				}
			},
			{
				"box": {
					"id": "obj-10",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
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
						"rect": [
							0,
							26,
							820,
							773
						],
						"showontab": 1,
						"boxes": [],
						"lines": []
					},
					"patching_rect": [
						390,
						365,
						50,
						22
					],
					"text": "p ?",
					"varname": "q_tab"
				}
			}
		],
		"lines": [],
		"autosave": 0
	}
}
