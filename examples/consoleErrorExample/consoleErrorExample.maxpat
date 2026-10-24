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
			59,
			119,
			800,
			820
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
						800,
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
						630,
						29
					],
					"text": "Console errors fail a test",
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
						630,
						20
					],
					"text": "ignoreConsoleErrors: false in the config makes any console error fail the suite, whatever the asserts say",
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
						670,
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
						615,
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
					"id": "obj-10",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						80,
						170,
						216,
						20
					],
					"text": "munit-lint disable use-munit-loadbang",
					"linecount": 1
				}
			},
			{
				"box": {
					"id": "obj-17",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"int",
						"bang",
						"int"
					],
					"patching_rect": [
						177,
						509,
						572,
						22
					],
					"text": "t 1 b 1"
				}
			},
			{
				"box": {
					"id": "obj-6",
					"linecount": 4,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						96,
						533,
						60
					],
					"text": "Depending on what you are testing you might want console errors to fail your test, regardless of the state of your asserts (for example if you are testing some internal state which logs to the console but cannot be captured).\nSImply set `ignoreConsoleErrors: false` in your config and mUnit will fail on any console error"
				}
			},
			{
				"box": {
					"id": "obj-11",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						730,
						546,
						29.5,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "obj-13",
					"linecount": 2,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						134,
						390,
						538,
						33
					],
					"text": "When ignoreConsoleErrors is set to false a test will fail if there is a console error, even if all the asserts are passing"
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
						581,
						584,
						168,
						22
					],
					"text": "mUnit.assert"
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
						221,
						551,
						187,
						22
					],
					"text": "printerror \"This is a console error\""
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
					"id": "obj-4",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						28,
						584,
						168,
						22
					],
					"text": "mUnit.assert in1 == 1"
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
						169,
						58,
						22
					],
					"text": "loadbang"
				}
			},
			{
				"box": {
					"id": "obj-38",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						20,
						431,
						105,
						22
					],
					"text": "prepend configure"
				}
			},
			{
				"box": {
					"code": "{\n\t\"logFormatter\": \"Txt\",\r\n\t\"resultFormatter\": \"Json\",\r\n\t\"ignoreConsoleErrors\": false,\r\n\t\"logOutputFilters\": [],\n\t\"logObjectFilters\": [],\r\n\t\"outputDir\":  \"~/Documents/Max 9/Packages/mUnit/examples/consoleErrorExample/logs\"\n}",
					"fontface": 0,
					"fontname": "<Monospaced>",
					"fontsize": 12,
					"id": "obj-2",
					"maxclass": "dict.codebox",
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
						203,
						652,
						179
					],
					"saved_object_attributes": {
						"legacy": 0,
						"parameter_enable": 0,
						"parameter_mappable": 0
					}
				}
			},
			{
				"box": {
					"id": "obj-16",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						20,
						471,
						83,
						22
					],
					"text": "mUnit.handler"
				}
			},
			{
				"box": {
					"code": "function printerror(val) {\n    error(val + \"\\n\");\n}",
					"filename": "none",
					"fontface": 0,
					"fontname": "<Monospaced>",
					"fontsize": 12,
					"id": "obj-1",
					"maxclass": "v8.codebox",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						221,
						584,
						340,
						200
					],
					"saved_object_attributes": {
						"parameter_enable": 0
					}
				}
			},
			{
				"box": {
					"id": "bub-err",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						418,
						548,
						200,
						28
					],
					"text": "logs a console error on purpose",
					"background": 1,
					"bubble": 1,
					"bubbleside": 1,
					"fontsize": 12,
					"textjustification": 1,
					"linecount": 1
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-5",
						1
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
						"obj-17",
						0
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
						"obj-11",
						0
					],
					"source": [
						"obj-17",
						2
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-4",
						1
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
						"obj-9",
						0
					],
					"source": [
						"obj-17",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-38",
						0
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
						"obj-2",
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
						"obj-16",
						0
					],
					"source": [
						"obj-38",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-1",
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
