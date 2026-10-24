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
			81,
			150,
			640,
			480
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
						640,
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
						470,
						29
					],
					"text": "Linting patchers",
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
						470,
						20
					],
					"text": "Lint on save in Max; the same rules run on the command line and on CI",
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
						510,
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
						455,
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
					"id": "obj-c1",
					"linecount": 11,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						16,
						96,
						526,
						154
					],
					"text": "mUnit also includes a full suite of linting tools which work both live inside of Max and standalone on the CLI (no max installation needed) so you can use it in CI environments.\n\nLint on demand: [mUnit.lint] watches @folder and lints every patch there as you save it. \nHit lint below and check the console output, then open the folder, edit the\nOpen this examples lintMe.maxpat, change something, save, and read the Max console. \n\nThe rules come from munit-lint.json next to this patch, and to make the linting experience your own you're probably going to end up writing your own linting rules and reconfiguring the linter for the rules which you wish to enforce. Check the mUnit.linter help, the package README.md and the api/ folder in the package for more information about how to do this."
				}
			},
			{
				"box": {
					"id": "obj-lint",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"",
						"started"
					],
					"patching_rect": [
						16,
						319,
						191,
						22
					],
					"text": "mUnit.lint @folder . @followfront 0"
				}
			},
			{
				"box": {
					"id": "obj-msg",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						16,
						265,
						35,
						22
					],
					"text": "lint"
				}
			},
			{
				"box": {
					"id": "obj-c2",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						60,
						261,
						260,
						30
					],
					"text": "lint everything in the folder again",
					"background": 1,
					"bubble": 1,
					"bubbleside": 1,
					"fontsize": 12,
					"textjustification": 1
				}
			},
			{
				"box": {
					"id": "obj-print",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						188,
						368,
						100,
						22
					],
					"text": "print mUnit.lint"
				}
			},
			{
				"box": {
					"id": "obj-dict",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						16,
						368,
						110,
						22
					],
					"text": "print findings"
				}
			},
			{
				"box": {
					"id": "obj-c3",
					"linecount": 3,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						16,
						403,
						240,
						47
					],
					"text": "The left outlet carries the findings as a dict, for building your own UI on them; the right one passes the server's messages through."
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-dict",
						0
					],
					"source": [
						"obj-lint",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-print",
						0
					],
					"source": [
						"obj-lint",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-lint",
						0
					],
					"source": [
						"obj-msg",
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
