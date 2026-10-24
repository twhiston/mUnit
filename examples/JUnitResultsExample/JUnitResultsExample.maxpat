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
			760,
			720
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
						760,
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
						590,
						29
					],
					"text": "JUnit results for CI",
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
						590,
						20
					],
					"text": "resultFormatter: JUnit writes logs/results.xml, which CI services render as a test report",
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
						630,
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
						575,
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
					"id": "obj-14",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						123,
						195,
						219,
						20
					],
					"text": "munit-lint disable use-munit-loadbang",
					"linecount": 1
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
						126,
						160,
						588,
						33
					],
					"text": "because we are passing in the config directly we can bang it into the handler which will then configure itself and bang when ready so the tests can be started."
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
						96,
						533,
						47
					],
					"text": "most CI platforms are able to ingest JUnit formatted test output and render it in some nice way to show any test failures etc... mUnit provides native support for a JUnit style results formatter. Just set it in the config to use it. Look in the example folder to see the output"
				}
			},
			{
				"box": {
					"id": "obj-13",
					"linecount": 4,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						75,
						472,
						315,
						60
					],
					"text": "Using this output from munit.handler will ensure that the bang which starts our tests happens after the core of mUnit has loaded. This is the same as using an [mUnit.loadbang]"
				}
			},
			{
				"box": {
					"id": "obj-8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 3,
					"outlettype": [
						"bang",
						"bang",
						"bang"
					],
					"patching_rect": [
						62,
						550,
						620,
						22
					],
					"text": "t b b b"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						663,
						627,
						59,
						22
					],
					"text": "random 4"
				}
			},
			{
				"box": {
					"id": "obj-4",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						363,
						627,
						59,
						22
					],
					"text": "random 2"
				}
			},
			{
				"box": {
					"id": "obj-18",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						62,
						587,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-15",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"int",
						"int"
					],
					"patching_rect": [
						84,
						623,
						93,
						22
					],
					"text": "t 2 1"
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
					"id": "obj-12",
					"maxclass": "newobj",
					"numinlets": 3,
					"numoutlets": 0,
					"patching_rect": [
						9,
						667,
						168,
						22
					],
					"text": "mUnit.assert in1 > in2"
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
						438,
						667,
						244,
						22
					],
					"text": "mUnit.assert in1 === 3 @suite boringTests"
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
					"id": "obj-2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						191,
						667,
						191,
						22
					],
					"text": "mUnit.assert @suite boringTests"
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
						62,
						160,
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
						62,
						412,
						105,
						22
					],
					"text": "prepend configure"
				}
			},
			{
				"box": {
					"code": "{\n\t\"logFormatter\": \"Txt\",\r\n\t\"resultFormatter\": \"JUnit\",\r\n\t\"ignoreConsoleErrors\": true,\r\n\t\"logOutputFilters\": [],\n\t\"logObjectFilters\": [\"print\"],\r\n\t\"outputDir\":  \"~/Documents/Max 9/Packages/mUnit/examples/JUnitResultsExample/logs\"\n}",
					"fontface": 0,
					"fontname": "<Monospaced>",
					"fontsize": 12,
					"id": "obj-1",
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
						62,
						219,
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
						62,
						444,
						83,
						22
					],
					"text": "mUnit.handler"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-38",
						0
					],
					"source": [
						"obj-1",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-12",
						2
					],
					"source": [
						"obj-15",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-12",
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
						"obj-8",
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
						"obj-15",
						0
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
						"obj-1",
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
						"obj-2",
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
						"obj-10",
						1
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
						"obj-18",
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
						"obj-4",
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
						"obj-7",
						0
					],
					"source": [
						"obj-8",
						2
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
