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
						"mUnit.harness"
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
					"text": "js helpstarter.js mUnit.harness"
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
										"mUnit.harness"
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
									"text": "[mUnit.harness] points mUnit.handler at your munit.config.js and, with @loadFolder, opens a folder of test patches, so one patch runs a whole suite. Connect its outlet to the handler's inlet. It runs when its patch opens; the patch must be saved, since its folder is where the config and the tests are found. Without @loadFolder it only loads the config, as here.",
									"linecount": 4
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
										228,
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
										268,
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
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										298,
										300,
										49
									],
									"text": "Loads help/munit.config.js, next to this file, and the suite in this patch runs: the assert on the right turns green.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 1,
									"patching_rect": [
										350,
										228,
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
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										350,
										263,
										30,
										22
									],
									"text": "1"
								}
							},
							{
								"box": {
									"id": "obj-8",
									"maxclass": "newobj",
									"numinlets": 2,
									"numoutlets": 0,
									"patching_rect": [
										350,
										298,
										199,
										22
									],
									"text": "mUnit.assert @name inThisPatch"
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										367,
										780,
										91
									],
									"text": "@loadFolder <path>: the folder of test patches, relative to the harness's patch (absolute paths work too).\n@configFolder <path>: the folder with munit.config.js. Default: the harness's patch folder.\n@pattern <glob>: which files are tests. Default *.maxpat; * and ? work, e.g. test_*.maxpat.\n@recursive 1: also search subfolders.\n@sequential 1: open one test patch at a time, wait until its asserts have finished, close it, then open the next.",
									"linecount": 6
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
									"text": "A folder of test patches",
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
									"text": "mySuite/\n  testWrangler.maxpat      [mUnit.harness @loadFolder tests @recursive 1] -> [mUnit.handler]\n  munit.config.js\n  tests/\n    test_one.maxpat        asserts fed by [mUnit.loadbang]; no handler or harness of their own\n    test_two.maxpat\n    more/test_three.maxpat\n  logs/                    results.json, log.txt, artifacts/",
									"linecount": 8,
									"fontname": "Menlo"
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
										173,
										780,
										146
									],
									"text": "Every matching patch is opened at once and closed when the suite has finished. The test patches need no handler or harness of their own: their asserts register with the running handler, and mUnit.loadbang fires in them once it is ready, whether they opened before or after that moment.\n\nWith @sequential 1 the harness opens one patch, waits until its asserts have settled, closes it and opens the next. Slower, but patches can't interfere through shared [s]/[r] names, DSP state or CPU load, and each patch's mUnit.teardown fires before that patch is closed; the result files are written once at the end.\n\nloadInFolderExample and sequentialHarnessExample in examples/ are complete, runnable copies of this layout. This help has no tests folder, so the harness form is shown rather than live.",
									"linecount": 10
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
										334,
										780,
										63
									],
									"text": "From the command line (macOS), the runner starts Max, runs the suite, quits Max and exits 0 passed, 1 failed, 2 could not run:\nnode \"$MUNIT/javascript/nodejs/runner/munit-cli.js\" run mySuite --tests tests --recursive --sequential\nnode \"$MUNIT/javascript/nodejs/runner/munit-cli.js\" run mySuite/testWrangler.maxpat",
									"linecount": 4,
									"fontname": "Menlo"
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						125,
						67,
						22
					],
					"saved_object_attributes": {
						"globalpatchername": ""
					},
					"text": "p folders"
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
