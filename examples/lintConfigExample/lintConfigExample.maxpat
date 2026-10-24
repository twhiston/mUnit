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
			100,
			100,
			820,
			560
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15,
			15
		],
		"gridsnaponopen": 1,
		"objectsnaponopen": 1,
		"statusbarvisible": 2,
		"toolbarvisible": 1,
		"lefttoolbarpinned": 0,
		"toptoolbarpinned": 0,
		"righttoolbarpinned": 0,
		"bottomtoolbarpinned": 0,
		"toolbars_unpinned_last_save": 0,
		"tallnewobj": 0,
		"boxanimatetime": 200,
		"enablehscroll": 1,
		"enablevscroll": 1,
		"devicewidth": 0,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "tab-1",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patching_rect": [
						20,
						20,
						150,
						22
					],
					"text": "p Cascade",
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
							0,
							26,
							820,
							534
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12,
						"default_fontface": 0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15,
							15
						],
						"gridsnaponopen": 1,
						"objectsnaponopen": 1,
						"statusbarvisible": 2,
						"toolbarvisible": 1,
						"enablehscroll": 1,
						"enablevscroll": 1,
						"showontab": 1,
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
									"text": "Which munit-lint.json applies?",
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
									"text": "Configs cascade from the folder of a file upwards; this patch watches the project folder next to it",
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
									"id": "obj-intro",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										96,
										780,
										44
									],
									"text": "[mUnit.lint @folder project @rules extra-rules.json] below watches the project folder next to this patch. Rules come from munit-lint.json files, and in a large project several of them take part. How they combine:",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "step-1-20-150",
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
										150,
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
									"id": "obj-p1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										150,
										752,
										24
									],
									"text": "@config <file> wins when it is given (relative to this patch). That one file applies alone, to every file linted.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "step-2-20-184",
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
										20,
										184,
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
									"id": "obj-p2",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										184,
										752,
										60
									],
									"text": "Otherwise configs cascade. The ones that apply to a file are every munit-lint.json in its folder and in the folders above it, up to one that says \"root\": true or the top of the disk, applied outermost first. For project/main.maxpat that is the munit-lint.json next to this patch. For project/strict/strict.maxpat it is that one and then strict's own on top.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "step-3-20-250",
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
										250,
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
									"id": "obj-p3",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										250,
										752,
										60
									],
									"text": "Each inner config adds to the outer ones rather than replacing them: its rules join the set (a rule with an id already seen replaces that rule), its overrides apply after the outer ones, its ignore patterns add to theirs, and its files list, when it has one, replaces theirs. So an inner folder can be stricter or looser without repeating what it inherits.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "step-4-20-316",
									"maxclass": "textbutton",
									"text": "4",
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
										316,
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
									"id": "obj-p4",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										316,
										752,
										60
									],
									"text": "Every path in a config is relative to the folder of that config file: rule files and globs in rules, and the patterns in files, ignore and overrides. That is why the outer config says project/**/*.maxpat and project/legacy/**. An override that leaves files out applies to everything under its config.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "step-5-20-382",
									"maxclass": "textbutton",
									"text": "5",
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
										382,
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
									"id": "obj-p5",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										382,
										752,
										44
									],
									"text": "@rules adds rule files as the innermost layer, like --rules on the command line (extra-rules.json here). Within one config or rule file an id may appear only once.",
									"linecount": 2
								}
							}
						],
						"lines": [
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
						]
					}
				}
			},
			{
				"box": {
					"id": "tab-2",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patching_rect": [
						20,
						60,
						150,
						22
					],
					"text": "p Details",
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
							0,
							26,
							820,
							534
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12,
						"default_fontface": 0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15,
							15
						],
						"gridsnaponopen": 1,
						"objectsnaponopen": 1,
						"statusbarvisible": 2,
						"toolbarvisible": 1,
						"enablehscroll": 1,
						"enablevscroll": 1,
						"showontab": 1,
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
									"text": "Which munit-lint.json applies?",
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
									"text": "Configs cascade from the folder of a file upwards; this patch watches the project folder next to it",
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
									"id": "step-6-20-96",
									"maxclass": "textbutton",
									"text": "6",
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
										96,
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
									"id": "obj-p6",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										96,
										752,
										44
									],
									"text": "No munit-lint.json in the folder or anywhere above it: the built-in mUnit:recommended set alone, and the console says so.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "step-7-20-150",
									"maxclass": "textbutton",
									"text": "7",
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
										150,
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
									"id": "obj-p7",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										150,
										752,
										44
									],
									"text": "The patch in front is linted when you save it even when it lies outside the watched folder, with the watched folder's configs, as if it were inside.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "step-8-20-204",
									"maxclass": "textbutton",
									"text": "8",
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
									"id": "obj-p8",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										204,
										752,
										47
									],
									"text": "The command line does the same for each file it visits: munit lint <this folder>/project (npm install --save-dev munit-cli, or node .../javascript/nodejs/runner/munit-cli.js in the package) reports exactly what this object does. --config <file> turns the cascade off and applies that file alone.",
									"linecount": 3
								}
							},
							{
								"box": {
									"id": "step-9-20-258",
									"maxclass": "textbutton",
									"text": "9",
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
										258,
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
									"id": "obj-p9",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										258,
										752,
										60
									],
									"text": "\"root\": true in a config stops the walk there. This example's outer config says it, so nothing above the example folder can change its results. Without it, a munit-lint.json in your home folder or in Max's Documents folder is a baseline for every project below it.",
									"linecount": 2
								}
							},
							{
								"box": {
									"id": "step-10-20-324",
									"maxclass": "textbutton",
									"text": "10",
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
										324,
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
									"fontsize": 9,
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
									"id": "obj-p10",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										48,
										324,
										752,
										44
									],
									"text": "The name has a hyphen on purpose. A file called munit.lint.json shadows the [mUnit.lint] object in Max, which then fails to load; the linter refuses that name with an error that says so.",
									"linecount": 2
								}
							}
						],
						"lines": [
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
						]
					}
				}
			},
			{
				"box": {
					"id": "tab-3",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patching_rect": [
						20,
						100,
						150,
						22
					],
					"text": "p \"Try it\"",
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
							0,
							26,
							820,
							534
						],
						"bglocked": 0,
						"openinpresentation": 0,
						"default_fontsize": 12,
						"default_fontface": 0,
						"default_fontname": "Arial",
						"gridonopen": 1,
						"gridsize": [
							15,
							15
						],
						"gridsnaponopen": 1,
						"objectsnaponopen": 1,
						"statusbarvisible": 2,
						"toolbarvisible": 1,
						"enablehscroll": 1,
						"enablevscroll": 1,
						"showontab": 1,
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
									"text": "Which munit-lint.json applies?",
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
									"text": "Configs cascade from the folder of a file upwards; this patch watches the project folder next to it",
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
									"id": "obj-try1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										96,
										780,
										130
									],
									"text": "Open a patch below, save it, and read the Max console. On start the console names the configs in force and the ones subfolders add.\nproject/main.maxpat: two warnings. [zl.reg] breaks no-zl-reg from munit-lint.json; the bare [print] breaks named-print from extra-rules.json.\nproject/legacy/old.maxpat: clean. The override for project/legacy/** turns no-zl-reg off there.\nproject/strict/strict.maxpat: a blocking error. strict/munit-lint.json sits on top of the outer config and raises no-zl-reg to block for everything in strict/.",
									"linecount": 5
								}
							},
							{
								"box": {
									"id": "obj-m1",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										236,
										35,
										22
									],
									"text": "lint"
								}
							},
							{
								"box": {
									"id": "obj-m2",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										65,
										236,
										145,
										22
									],
									"text": "lint project/main.maxpat"
								}
							},
							{
								"box": {
									"id": "obj-m3",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										220,
										236,
										170,
										22
									],
									"text": "lint project/strict/strict.maxpat"
								}
							},
							{
								"box": {
									"id": "obj-m4",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										400,
										236,
										45,
										22
									],
									"text": "status"
								}
							},
							{
								"box": {
									"id": "obj-mc",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										455,
										233,
										330,
										41
									],
									"text": "the folder again, one file (relative to this patch), what the front-window helper has seen",
									"linecount": 2
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
										""
									],
									"patching_rect": [
										20,
										276,
										300,
										22
									],
									"text": "mUnit.lint @folder project @rules extra-rules.json"
								}
							},
							{
								"box": {
									"id": "obj-pf",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"outlettype": [],
									"patching_rect": [
										20,
										316,
										90,
										22
									],
									"text": "print findings"
								}
							},
							{
								"box": {
									"id": "obj-pl",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"outlettype": [],
									"patching_rect": [
										241,
										316,
										100,
										22
									],
									"text": "print mUnit.lint"
								}
							},
							{
								"box": {
									"id": "obj-foot",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										356,
										780,
										150
									],
									"text": "The folder on disk:\nlintConfigExample/\n    lintConfigExample.maxpat        this patch\n    munit-lint.json                 the outer config, \"root\": true; found from every folder under project/\n    extra-rules.json                added by @rules, innermost\n    project/main.maxpat             the outer config and extra-rules.json\n    project/legacy/old.maxpat       the same, with no-zl-reg off by an override in the outer config\n    project/strict/munit-lint.json  cascades onto the outer config for the files in strict/\n    project/strict/strict.maxpat    outer config, then strict's, then extra-rules.json",
									"linecount": 9,
									"fontname": "Menlo",
									"fontsize": 11
								}
							}
						],
						"lines": [
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
							},
							{
								"patchline": {
									"destination": [
										"obj-lint",
										0
									],
									"source": [
										"obj-m1",
										0
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
										"obj-m2",
										0
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
										"obj-m3",
										0
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
										"obj-m4",
										0
									]
								}
							},
							{
								"patchline": {
									"destination": [
										"obj-pf",
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
										"obj-pl",
										0
									],
									"source": [
										"obj-lint",
										1
									]
								}
							}
						]
					}
				}
			}
		],
		"lines": [],
		"showrootpatcherontab": 0,
		"showontab": 0
	}
}
