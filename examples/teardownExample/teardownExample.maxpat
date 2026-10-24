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
			134,
			167,
			820,
			700
		],
		"boxes": [
			{
				"box": {
					"id": "hdr-panel",
					"maxclass": "panel",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						0,
						0,
						820,
						64
					],
					"angle": 0,
					"mode": 0,
					"proportion": 0.39,
					"shadow": -1,
					"background": 1,
					"bgcolor": [
						0.16,
						0.17,
						0.2,
						1
					]
				}
			},
			{
				"box": {
					"id": "hdr-title",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						11,
						650,
						29
					],
					"text": "Teardown hooks: cleaning up after a test",
					"fontface": 1,
					"fontsize": 20,
					"textcolor": [
						0.97,
						0.97,
						0.97,
						1
					],
					"linecount": 1
				}
			},
			{
				"box": {
					"id": "hdr-sub",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						41,
						650,
						20
					],
					"text": "[mUnit.teardown] bangs after the results are written, at once or, with @hold 1, when you say done",
					"fontsize": 12,
					"textcolor": [
						0.75,
						0.77,
						0.82,
						1
					],
					"linecount": 1
				}
			},
			{
				"box": {
					"id": "hdr-open",
					"maxclass": "textbutton",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						690,
						20,
						110,
						24
					],
					"text": "Open folder",
					"fontsize": 12,
					"hint": "this example's folder: the patch, its config, references and results"
				}
			},
			{
				"box": {
					"id": "hdr-openfolder",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						635,
						68,
						165,
						22
					],
					"text": "mUnit.examples.openFolder",
					"hidden": 1
				}
			},
			{
				"box": {
					"id": "obj-2",
					"linecount": 7,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						96,
						480,
						100
					],
					"text": "[mUnit.teardown] is the counterpart of [mUnit.loadbang]: it bangs once the handler has frozen this patch's results, after the result files are written and before the patch would be closed or Max quit. Use it to stop what the test started.\n\nThe handler waits for every teardown to report done (up to teardownMs, see munit.config.js) before it goes on. Console errors while teardowns run never fail the suite."
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
						693,
						96,
						98.5,
						22
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
						693,
						136,
						98.5,
						22
					],
					"text": "mUnit.handler"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"linecount": 2,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						48,
						204,
						416,
						33
					],
					"text": "The test: a metro counts up; the assert passes when the count reaches 3. The metro is still running afterwards."
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
						20,
						241,
						105,
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
						20,
						279,
						30,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "obj-9",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						20,
						336,
						72.5,
						22
					],
					"text": "metro 200"
				}
			},
			{
				"box": {
					"id": "obj-10",
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
						371,
						59.5,
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
					"id": "obj-11",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						20,
						424,
						350.5,
						22
					],
					"text": "mUnit.assert in1 >= 3 @maxCalls 5 @name metroCounts"
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
						243,
						241,
						400,
						33
					],
					"text": "Cleanup: the plain teardown fires its outlet and reports done at once. Here it stops the metro."
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
						215,
						279,
						105,
						22
					],
					"text": "mUnit.teardown"
				}
			},
			{
				"box": {
					"id": "obj-14",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"int"
					],
					"patching_rect": [
						215,
						306,
						32,
						22
					],
					"text": "t b 0"
				}
			},
			{
				"box": {
					"id": "obj-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						215,
						374,
						95,
						22
					],
					"text": "print teardown"
				}
			},
			{
				"box": {
					"id": "obj-17",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						215,
						342,
						95,
						22
					],
					"text": "metro stopped"
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
						48,
						471,
						595,
						33
					],
					"text": "Slow cleanup: with @hold 1 the teardown reports done only when something arrives at its inlet. This one waits half a second, as a stand-in for closing a file or stopping DSP."
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
						37,
						521,
						157,
						22
					],
					"text": "mUnit.teardown @hold 1"
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
						37,
						556,
						72.5,
						22
					],
					"text": "delay 500"
				}
			},
			{
				"box": {
					"id": "obj-21",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						37,
						591,
						70,
						22
					],
					"text": "t b b"
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
						88,
						619,
						150.5,
						22
					],
					"text": "slow cleanup finished"
				}
			},
			{
				"box": {
					"id": "obj-23",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						88,
						648,
						105,
						22
					],
					"text": "print teardown"
				}
			},
			{
				"box": {
					"id": "obj-24",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						37,
						629,
						40,
						22
					],
					"text": "done"
				}
			},
			{
				"box": {
					"id": "obj-25",
					"linecount": 4,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						205,
						521,
						312,
						60
					],
					"text": "Watch the Max console: the assert passes, the results are written, then both teardowns print. Try it headless too:\n  munit run <this folder>/teardownExample.maxpat"
				}
			},
			{
				"box": {
					"id": "step-1-20-204",
					"maxclass": "textbutton",
					"text": "1",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						20,
						204,
						20,
						20
					],
					"bgcolor": [
						0.9,
						0.65,
						0.05,
						1
					],
					"fontname": "Arial Bold",
					"hint": "",
					"ignoreclick": 1,
					"legacytextcolor": 1,
					"rounded": 60,
					"fontsize": 12,
					"saved_attribute_attributes": {
						"bgcolor": {
							"expression": "themecolor.lesson_step_circle"
						}
					},
					"textcolor": [
						0.34902,
						0.34902,
						0.34902,
						1
					]
				}
			},
			{
				"box": {
					"id": "step-2-215-241",
					"maxclass": "textbutton",
					"text": "2",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						215,
						241,
						20,
						20
					],
					"bgcolor": [
						0.9,
						0.65,
						0.05,
						1
					],
					"fontname": "Arial Bold",
					"hint": "",
					"ignoreclick": 1,
					"legacytextcolor": 1,
					"rounded": 60,
					"fontsize": 12,
					"saved_attribute_attributes": {
						"bgcolor": {
							"expression": "themecolor.lesson_step_circle"
						}
					},
					"textcolor": [
						0.34902,
						0.34902,
						0.34902,
						1
					]
				}
			},
			{
				"box": {
					"id": "step-3-20-471",
					"maxclass": "textbutton",
					"text": "3",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"",
						"",
						"int"
					],
					"parameter_enable": 0,
					"patching_rect": [
						20,
						471,
						20,
						20
					],
					"bgcolor": [
						0.9,
						0.65,
						0.05,
						1
					],
					"fontname": "Arial Bold",
					"hint": "",
					"ignoreclick": 1,
					"legacytextcolor": 1,
					"rounded": 60,
					"fontsize": 12,
					"saved_attribute_attributes": {
						"bgcolor": {
							"expression": "themecolor.lesson_step_circle"
						}
					},
					"textcolor": [
						0.34902,
						0.34902,
						0.34902,
						1
					]
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-11",
						1
					],
					"midpoints": [
						29.5,
						360,
						361,
						360
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
						"obj-17",
						0
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
						"obj-9",
						0
					],
					"midpoints": [
						237.5,
						279,
						102,
						279,
						102,
						278.5625,
						29.5,
						278.5625
					],
					"source": [
						"obj-14",
						1
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
						"obj-17",
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
						"obj-21",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-24",
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
						"obj-23",
						0
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
						"obj-19",
						0
					],
					"midpoints": [
						46.5,
						603,
						24,
						603,
						24,
						465,
						46.5,
						465
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
			},
			{
				"patchline": {
					"destination": [
						"hdr-openfolder",
						0
					],
					"source": [
						"hdr-open",
						0
					],
					"hidden": 1
				}
			}
		],
		"autosave": 0
	}
}
