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
			60,
			152,
			1040,
			520
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
						1040,
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
						870,
						29
					],
					"text": "Custom asserts with details and failure files",
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
						870,
						20
					],
					"text": "withDetails.js returns an Outcome: state, message, expected, actual and attachments kept with a failure",
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
						910,
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
						855,
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
					"id": "obj-17",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						22,
						426,
						35,
						22
					],
					"text": "open"
				}
			},
			{
				"box": {
					"filename": "withDetails.js",
					"id": "obj-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						22,
						458,
						95,
						22
					],
					"saved_object_attributes": {
						"parameter_enable": 0
					},
					"text": "v8 withDetails.js",
					"textfile": {
						"filename": "withDetails.js",
						"flags": 0,
						"embed": 0,
						"autowatch": 1
					}
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
						96,
						589,
						74
					],
					"text": "A custom assert (a .js file next to the patch) receives the inputs and the helpers, and may return an Outcome instead of a State: { state, message, expected, actual, attachments }. An attachment is a file kept with the failure: the handler writes it to logs/artifacts/<uuid>/<name> and lists its path in the results. With the JUnit formatter (used here) the file is linked from the report with the [[ATTACHMENT|path]] convention that Jenkins and GitLab understand."
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
						922,
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
						922,
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
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						257,
						214,
						105,
						22
					],
					"text": "mUnit.loadbang"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						257,
						247,
						403,
						22
					],
					"text": "t b b"
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
						22,
						271,
						230,
						47
					],
					"text": "Fails on purpose: 1 + 2 + 3 is 6, not 10. See withDetails.js. Then open logs/results.xml and logs/artifacts/"
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
						257,
						288,
						46.5,
						22
					],
					"text": "1 2 3"
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
					"id": "obj-10",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						22,
						323,
						298.5,
						22
					],
					"text": "mUnit.assert withDetails.js @name sumsToTen"
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						501,
						283,
						100,
						34
					],
					"text": "Passes: 4 + 6",
					"background": 1,
					"bubble": 1,
					"bubbleside": 2,
					"fontsize": 12,
					"textjustification": 1,
					"linecount": 1
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
						641,
						289,
						33.5,
						22
					],
					"text": "4 6"
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
						342,
						323,
						318,
						22
					],
					"text": "mUnit.assert withDetails.js @name sumsToTenToo"
				}
			},
			{
				"box": {
					"id": "obj-14",
					"linecount": 4,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						22,
						356,
						580,
						60
					],
					"text": "A custom assert returns a state and you should include the expected and actual values in that response so they are passed to the output rendering for the CI. Note in this example how the failed test  creates an artifact file with the input the assertion received, and the JUnit failure message is enriched with the expected and actual values from the test"
				}
			}
		],
		"lines": [
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
						"obj-15",
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
						"obj-12",
						0
					],
					"source": [
						"obj-7",
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
						"obj-7",
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
