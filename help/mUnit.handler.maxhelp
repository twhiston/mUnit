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
						"mUnit.handler"
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
					"text": "js helpstarter.js mUnit.handler"
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
										"mUnit.handler"
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
										105
									],
									"text": "[mUnit.handler] orchestrates a suite. It registers every mUnit.assert that loads, collects their results and, once all have reported and nothing has registered or reported for settleMs (or suiteTimeout expires), writes results.json (or results.xml with the JUnit formatter) and log.txt, posts each assert to the Max console (ok, FAIL with the reason, skip), fires the mUnit.teardown hooks and bangs its right outlet. The left outlet bangs when the handler is ready, which is also what fires every mUnit.loadbang. It needs a configuration before the tests start: mUnit.harness reads munit.config.js from its patch's folder, or send a configure dict (messages tab). Keep one handler open at a time: asserts register with whichever handler is running.",
									"linecount": 7
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"patching_rect": [
										20,
										270,
										92,
										22
									],
									"text": "mUnit.harness",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"patching_rect": [
										20,
										310,
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
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										350,
										80,
										22
									],
									"text": "print ready"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										110,
										350,
										99,
										22
									],
									"text": "print finished"
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
										380,
										300,
										91
									],
									"text": "mUnit.harness loads help/munit.config.js, next to this file, and the suite starts: ready prints, the assert runs, finished prints once the results are written to help/logs. To run again, close and reopen the file.",
									"linecount": 6
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										350,
										270,
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
									"id": "obj-9",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										350,
										305,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										350,
										340,
										206,
										22
									],
									"text": "mUnit.assert @name helloHandler"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										350,
										370,
										220,
										36
									],
									"text": "One test, so the suite has something to report.",
									"linecount": 2
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
										491,
										780,
										63
									],
									"text": "In the Max console: \"munit.handler: configured; results go to .../help/logs\", then a line per assert as it finishes, then \"Passed: 1 passed, 0 failed, 0 skipped; written to ...\". A run finishes exactly once; on a suite timeout every unfinished assert is reported as failed, so a CI run always ends. The command-line runner (javascript/nodejs/runner/munit-cli.js) starts Max, runs a suite, quits Max and exits 0, 1 or 2 for CI.",
									"linecount": 4
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
										"obj-4",
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
										"obj-8",
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
									"text": "Messages",
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
										91
									],
									"text": "configure <dict>: configure from a dict instead of munit.config.js. A dict has no folder, so outputDir must be absolute (a leading ~ is expanded). takeReferences [0|1]: the asserts that register next take their references; snapshots and reference comparisons write what they get, and pass. reset: forget the current run and start a new one with the same configuration; mUnit.harness sends it when it runs again. start, hold, mark, done, hydrateConfiguration and the assert and teardown registrations are sent by the other mUnit objects, not by you. Messages can also reach the handler through [s munit.handler], which is how the asserts talk to it.",
									"linecount": 6
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										146,
										489,
										22
									],
									"text": "set resultFormatter JUnit, set outputDir ~/mUnit-help-logs, set settleMs 500"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 4,
									"patching_rect": [
										20,
										181,
										36,
										22
									],
									"text": "dict",
									"outlettype": [
										"dictionary",
										"",
										"",
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										20,
										216,
										118,
										22
									],
									"text": "prepend configure",
									"outlettype": [
										""
									]
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										251,
										105,
										22
									],
									"text": "s munit.handler"
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
										281,
										489,
										49
									],
									"text": "Click to reconfigure: the next run (reopen this file) writes JUnit results to ~/mUnit-help-logs. An invalid configuration is rejected with a message in the console that says what is wrong.",
									"linecount": 3
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
										539,
										146,
										99,
										22
									],
									"text": "takeReferences 1"
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										648,
										146,
										99,
										22
									],
									"text": "takeReferences 0"
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										539,
										181,
										105,
										22
									],
									"text": "s munit.handler"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										539,
										211,
										220,
										63
									],
									"text": "Take references on or off for the asserts that register next. The console warns while it is on.",
									"linecount": 4
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
										"obj-10",
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
						125,
						73,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p messages"
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
									"text": "munit.config.js",
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
										49
									],
									"text": "The preferred configuration is a munit.config.js in the folder of the patch that holds mUnit.harness (or its @configFolder). It is read fresh each time the patch opens, so edits apply without restarting node.script. Every key is optional; without the file, the defaults apply.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										104,
										500,
										256
									],
									"text": "module.exports = {\n  logFormatter: \"Txt\",         // or a formatter object\n  resultFormatter: \"Json\",     // \"Json\", \"JUnit\", or an object\n  ignoreConsoleErrors: true,   // false: any console error fails the suite\n  logOutputFilters: [],        // regexes; matching lines are left out\n  logObjectFilters: [\"node.script\"],  // objects not captured\n  outputDir: \"./logs\",         // relative to this file's folder\n  settleMs: 1000,              // quiet time that ends the suite\n  suiteTimeout: 300000,        // 0 disables it\n  teardownMs: 2000,            // wait for [mUnit.teardown] hooks\n  dsp: { driver: \"NonRealTime\", sr: 48000, vs: 64 },\n  runFolder: false,            // true: <outputDir>/<timestamp>/\n  takeReferences: false,       // write references instead of comparing\n  forbidOnly: false,           // fail the suite if any assert has @only\n};",
									"linecount": 18,
									"fontname": "Menlo"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										370,
										500,
										36
									],
									"text": "Custom formatters implement render() and fileExtension(); see the README.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										540,
										104,
										260,
										187
									],
									"text": "Results: results.json lists every assert with its state, expected and actual values, runs and attachments. The JUnit formatter writes results.xml, one testsuite per @suite, with failures, skips and attachments linked for CI. log.txt is the captured Max console. Files an assert keeps with a failure go to artifacts/<uuid>/. The dsp settings are applied when the suite starts and DSP is switched on; the tests start only once DSP is confirmed on those settings (otherwise none run and the suite fails), a change while the suite runs fails it, and everything is restored after the teardowns.",
									"linecount": 13
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						165,
						61,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p config"
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
