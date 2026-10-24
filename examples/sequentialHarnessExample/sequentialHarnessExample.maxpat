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
			164,
			760,
			460
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
					"text": "A folder of tests, one patch at a time",
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
					"text": "@sequential 1 opens, runs and closes each test patch in turn, so tests cannot interfere",
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
					"id": "obj-2",
					"linecount": 8,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						96,
						530,
						114
					],
					"text": "[mUnit.harness] opens every patch in a folder that matches @pattern (default *.maxpat), searching subfolders with @recursive 1. With @sequential 1 it opens, runs and closes one patch at a time, so tests can't interfere through shared [s]/[r] names, DSP state or CPU load. Each patch's [mUnit.teardown] fires before that patch is closed; the result files are written once at the end.\n\nHere tests/ holds test_one, test_two, more/test_three and a helper.maxpat that the pattern leaves out."
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
						20,
						236,
						520,
						22
					],
					"text": "mUnit.harness @loadFolder tests @pattern test_*.maxpat @recursive 1 @sequential 1"
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
						276,
						98.5,
						22
					],
					"text": "mUnit.handler"
				}
			},
			{
				"box": {
					"id": "obj-5",
					"linecount": 7,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						20,
						331,
						710,
						100
					],
					"text": "The same suite from the command line, which starts Max, runs it and exits 0 or 1:\n  munit run <this folder>/testWrangler.maxpat\nor, from munit.config.js and the folder of tests without this patch:\n  munit run <this folder> --tests tests --sequential\n\nThe \"munit\" command comes from the munit-cli npm package (npm install --save-dev munit-cli)\nthe same script ships in this Max package as javascript/nodejs/runner/munit-cli.js"
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
