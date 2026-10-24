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
			441,
			221,
			620,
			560
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
						620,
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
						450,
						29
					],
					"text": "A folder of tests, run by a harness",
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
						450,
						20
					],
					"text": "@loadFolder opens every patch in tests/ and runs them as one suite",
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
						490,
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
						435,
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
					"id": "obj-4",
					"linecount": 31,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						215,
						96,
						337,
						422
					],
					"text": "This example shows the \"test wrangler\" pattern.\n\nIf you're creating a suite of tests this is probably something you will want to do often since it's the easiest way to instrument the running and reporting of a large number of tests.\n\n1 .The folder for this patch contains an munit.config.js which is loaded into the handler by the test harness.\n\n2. The test harness, being passed the @loadFolder arg, will look for this named subfolder folder beneath the current path, and will load any maxpats found. \n\n3. File opening, test registration, result collection and closing of these patches and asserts will be handled by the harness/handler combination. Tests will be run concurrently\n \nAs such the test patchers do not need individual configuration, they can just be simple patchers with events into asserts, triggered by an mUnit.loadbang.\n\nLook inside the example folder to see the tests which this harness ran.\n\nSee the sequentialHarnessExample for more configuration options.\n\nYou can take this concept even further by using the cli tool to also orchestrate starting and stopping Max itself for your test suites"
				}
			},
			{
				"box": {
					"id": "obj-2",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						22,
						101,
						187,
						22
					],
					"text": "mUnit.harness @loadFolder tests"
				}
			},
			{
				"box": {
					"id": "obj-1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						22,
						159,
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
						"obj-1",
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
