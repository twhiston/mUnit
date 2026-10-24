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
		"rect": [
			134.0,
			164.0,
			820.0,
			780.0
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
						10.0,
						10.0,
						305.0,
						55.0
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
						459.0,
						85.0,
						167.0,
						22.0
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
							"minor": 2,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0.0,
							26.0,
							820.0,
							754.0
						],
						"gridsize": [
							5.0,
							5.0
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"border": 0,
									"filename": "helpdetails.js",
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
										10.0,
										10.0,
										790.0,
										155.0
									]
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "newobj",
									"numinlets": 0,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20.0,
										185.0,
										92.0,
										22.0
									],
									"text": "mUnit.harness"
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
										20.0,
										225.0,
										92.0,
										22.0
									],
									"text": "mUnit.handler"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										265.0,
										80.0,
										22.0
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
										110.0,
										265.0,
										99.0,
										22.0
									],
									"text": "print finished"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"linecount": 6,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										295.0,
										228.0,
										87.0
									],
									"text": "mUnit.harness loads help/munit.config.js, next to this file, and the suite starts: ready prints, the assert runs, finished prints once the results are written to help/logs. To run again, close and reopen the file."
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										"bang"
									],
									"patching_rect": [
										350.0,
										185.0,
										99.0,
										22.0
									],
									"text": "mUnit.loadbang"
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
										350.0,
										220.0,
										30.0,
										22.0
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
										1.0
									],
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										350.0,
										255.0,
										206.0,
										22.0
									],
									"text": "mUnit.assert @name helloHandler"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										350.0,
										285.0,
										220.0,
										33.0
									],
									"text": "One test, so the suite has something to report."
								}
							},
							{
								"box": {
									"id": "obj-12",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										406.0,
										736.0,
										60.0
									],
									"text": "In the Max console: \"munit.handler: configured; results go to .../help/logs\", then a line per assert as it finishes, then \"Passed: 1 passed, 0 failed, 0 skipped; written to ...\". A run finishes exactly once; on a suite timeout every unfinished assert is reported as failed, so a CI run always ends. The command-line runner (javascript/nodejs/runner/munit-cli.js) starts Max, runs a suite, quits Max and exits 0, 1 or 2 for CI."
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
						10.0,
						85.0,
						55.0,
						22.0
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
							"minor": 2,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0.0,
							26.0,
							820.0,
							754.0
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14.0,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										15.0,
										780.0,
										22.0
									],
									"text": "Messages"
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 6,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										40.0,
										696.0,
										87.0
									],
									"text": "configure <dict>: configure from a dict instead of munit.config.js. A dict has no folder, so outputDir must be absolute (a leading ~ is expanded). takeReferences [0|1]: the asserts that register next take their references; snapshots and reference comparisons write what they get, and pass. reset: forget the current run and start a new one with the same configuration; mUnit.harness sends it when it runs again. start, hold, mark, done, hydrateConfiguration and the assert and teardown registrations are sent by the other mUnit objects, not by you. Messages can also reach the handler through [s munit.handler], which is how the asserts talk to it."
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
										20.0,
										146.0,
										489.0,
										22.0
									],
									"text": "set resultFormatter JUnit, set outputDir ~/mUnit-help-logs, set settleMs 500"
								}
							},
							{
								"box": {
									"id": "obj-4",
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
										20.0,
										181.0,
										36.0,
										22.0
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
									"id": "obj-5",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20.0,
										216.0,
										118.0,
										22.0
									],
									"text": "prepend configure"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										251.0,
										105.0,
										22.0
									],
									"text": "s munit.handler"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										281.0,
										487.0,
										47.0
									],
									"text": "Click to reconfigure: the next run (reopen this file) writes JUnit results to ~/mUnit-help-logs. An invalid configuration is rejected with a message in the console that says what is wrong."
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
										539.0,
										146.0,
										103.0,
										22.0
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
										648.0,
										146.0,
										103.0,
										22.0
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
										539.0,
										181.0,
										105.0,
										22.0
									],
									"text": "s munit.handler"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										539.0,
										211.0,
										176.0,
										60.0
									],
									"text": "Take references on or off for the asserts that register next. The console warns while it is on."
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
						10.0,
						125.0,
						73.0,
						22.0
					],
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
							"minor": 2,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							134.0,
							190.0,
							820.0,
							754.0
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14.0,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										15.0,
										780.0,
										22.0
									],
									"text": "munit.config.js"
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
										20.0,
										40.0,
										718.0,
										47.0
									],
									"text": "The preferred configuration is a munit.config.js in the folder of the patch that holds mUnit.harness (or its @configFolder). It is read fresh each time the patch opens, so edits apply without restarting node.script. Every key is optional; without the file, the defaults apply."
								}
							},
							{
								"box": {
									"code": "module.exports = {\n  logFormatter: \"Txt\",         // or a formatter object\n  resultFormatter: \"Json\",     // \"Json\", \"JUnit\", or an object\n  ignoreConsoleErrors: true,   // false: any console error fails the suite\n  logOutputFilters: [],        // regexes; matching lines are left out\n  logObjectFilters: [\"node.script\"],  // objects not captured\n  outputDir: \"./logs\",         // relative to this file's folder\n  settleMs: 1000,              // quiet time that ends the suite\n  suiteTimeout: 300000,        // 0 disables it\n  teardownMs: 2000,            // wait for [mUnit.teardown] hooks\n  dsp: { driver: \"NonRealTime\", sr: 48000, vs: 64 },\n  runFolder: false,            // true: <outputDir>/<timestamp>/\n  takeReferences: false,       // write references instead of comparing\n  forbidOnly: false,           // fail the suite if any assert has @only\n};",
									"filename": "none",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12.0,
									"id": "obj-3",
									"maxclass": "v8.codebox",
									"numinlets": 1,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20.0,
										104.0,
										607.0,
										259.0
									],
									"saved_object_attributes": {
										"parameter_enable": 0
									}
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										382.0,
										607.0,
										20.0
									],
									"text": "Custom formatters implement render() and fileExtension(); see the README."
								}
							},
							{
								"box": {
									"id": "obj-5",
									"linecount": 6,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20.0,
										421.0,
										607.0,
										87.0
									],
									"text": "Results: results.json lists every assert with its state, expected and actual values, runs and attachments. The JUnit formatter writes results.xml, one testsuite per @suite, with failures, skips and attachments linked for CI. log.txt is the captured Max console. Files an assert keeps with a failure go to artifacts/<uuid>/. The dsp settings are applied when the suite starts and DSP is switched on; the tests start only once DSP is confirmed on those settings (otherwise none run and the suite fails), a change while the suite runs fails it, and everything is restored after the teardowns."
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10.0,
						165.0,
						61.0,
						22.0
					],
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
							"minor": 2,
							"revision": 0,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							0.0,
							26.0,
							820.0,
							754.0
						],
						"showontab": 1,
						"boxes": [],
						"lines": []
					},
					"patching_rect": [
						390.0,
						205.0,
						50.0,
						22.0
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
