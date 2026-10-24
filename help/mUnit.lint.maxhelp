{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 1,
			"revision": 4,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			86,
			210,
			820,
			780
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
						"mUnit.lint"
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
					"text": "js helpstarter.js mUnit.lint"
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
							"revision": 4,
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
									"border": 0,
									"filename": "helpdetails.js",
									"id": "obj-1",
									"ignoreclick": 1,
									"jsarguments": [
										"mUnit.lint"
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
										790,
										155
									]
								}
							},
							{
								"box": {
									"id": "obj-4",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										20,
										185,
										35,
										22
									],
									"text": "lint"
								}
							},
							{
								"box": {
									"id": "obj-5",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										65,
										185,
										140,
										22
									],
									"text": "lint lint/lintMe.maxpat"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "message",
									"numinlets": 2,
									"numoutlets": 1,
									"outlettype": [
										""
									],
									"patching_rect": [
										215,
										185,
										40,
										22
									],
									"text": "start"
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
										265,
										185,
										35,
										22
									],
									"text": "stop"
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
										310,
										185,
										45,
										22
									],
									"text": "status"
								}
							},
							{
								"box": {
									"id": "obj-9",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 2,
									"outlettype": [
										"",
										"started"
									],
									"patching_rect": [
										20,
										225,
										150,
										22
									],
									"text": "mUnit.lint @folder lint"
								}
							},
							{
								"box": {
									"id": "obj-10",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										151,
										263,
										100,
										22
									],
									"text": "print mUnit.lint"
								}
							},
							{
								"box": {
									"id": "obj-11",
									"maxclass": "newobj",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										263,
										90,
										22
									],
									"text": "print findings"
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
										380,
										185,
										423,
										60
									],
									"text": "This help watches help/lint, next to it. Open lint/lintMe.maxpat, save it, and read the console: its button fans out to two prints without a [trigger], which the recommended rules warn about. Put a [t b b] between them, save again, and the console says clean."
								}
							},
							{
								"box": {
									"id": "obj-13",
									"linecount": 6,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										380,
										258,
										378,
										102
									],
									"text": "lint: the whole folder again, and the patch in front when it lies outside (unless @followfront 0). lint <path>: one file, relative to this patch. fix and fix <path>: the same, applying the fixes the rules describe and writing the files back. start and stop the watcher. folder <path>, root <0|1> and followfront <0|1> change the mode for the next start. status: what the front-window helper has seen, for when a patch outside the folder is not being linted."
								}
							},
							{
								"box": {
									"id": "obj-14",
									"linecount": 6,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										300,
										343,
										88
									],
									"text": "Left outlet: the findings of every lint as a dict (files, summary, errors, and findings with rule, level, file, patchers, location, box, position, message; patchers lists the subpatchers on the way to the box, empty at the top level), for building your own display.\nRight outlet: the server's messages (started)."
								}
							},
							{
								"box": {
									"id": "obj-15",
									"linecount": 11,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										395,
										552,
										202
									],
									"text": "@folder <path>: the folder to watch, relative to this patch (default: the patch's own). Subfolders are watched too. @folder none watches no folder: the patch in front is linted when you save it, with the configs in and above its own folder, wherever it is. That is how Extras > mUnit Lint Server runs.\n@root 1: the folder is the top of the config cascade; a munit-lint.json above it is ignored, as if the folder's config said \"root\": true. Project mode: set @folder to the root of your repository.\n@followfront 0: lint the folder and below only. By default the patch in front is linted on save even when it lies outside the folder, with the folder's configs; with 0 it is left alone, so a project is linted the same way whatever else you have open. Not with @folder none, which then has nothing to lint.\n@config <file>: one config file for everything, relative to this patch. Default: the munit-lint.json files in the folder and above it, cascading (the config tab says how); without any, mUnit:recommended applies.\n@rules <file...>: extra rule files, like the command line's --rules.\nfolder <path>, root <0|1> and followfront <0|1> may also be sent as messages; they take effect at the next start."
								}
							}
						],
						"lines": [
							{
								"patchline": {
									"destination": [
										"obj-9",
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
										"obj-9",
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
										"obj-9",
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
										1
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
										"obj-9",
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
							"revision": 4,
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
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										168,
										38
									],
									"text": "Rules and the config file"
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
										45,
										780,
										20
									],
									"text": "munit-lint.json, in the folder or above it (several cascade; the config tab says how), says which rules apply to which files:",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-3",
									"maxclass": "dict.codebox",
									"code": "{\n  \"rules\": [\"mUnit:recommended\", \"mUnit:tests\", \"./lint-rules/*.json\"],\n  \"files\": [\"**/*.maxpat\", \"**/*.maxhelp\", \"**/*.gendsp\", \"**/*.rnbopat\"],\n  \"ignore\": [\"**/_scratch/**\"],\n  \"overrides\": [\n    { \"files\": [\"**/*.maxhelp\"], \"rules\": { \"no-zl-reg\": \"off\" } }\n  ]\n}",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12,
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
										70,
										780,
										150
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
									"id": "obj-4",
									"linecount": 4,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										232,
										684,
										60
									],
									"text": "Two rule sets are built in, and shipped as lint-rules/*.json in the package to copy from. mUnit:recommended is general patcher hygiene and applies when there is no config: it warns about fan-out from one message outlet to several inlets without a [trigger]. mUnit:tests is for patches that run under mUnit: one [mUnit.handler] per file, and [mUnit.loadbang] instead of [loadbang]."
								}
							},
							{
								"box": {
									"id": "obj-5",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										307,
										770,
										33
									],
									"text": "A rule is one JSON object; a rule file holds one rule, a list, or { \"rules\": [...] }. kind picks what is checked, level is off, warn or block (block fails CI):"
								}
							},
							{
								"box": {
									"id": "obj-6",
									"maxclass": "dict.codebox",
									"code": "{\n  \"id\": \"no-zl-reg\",\n  \"level\": \"block\",\n  \"kind\": \"forbid-object\",\n  \"match\": { \"object\": \"zl.reg\" },\n  \"message\": \"zl.reg is not allowed here, use list.reg\"\n}",
									"fontface": 0,
									"fontname": "<Monospaced>",
									"fontsize": 12,
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
										347,
										780,
										135
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
									"id": "obj-7",
									"linecount": 10,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										493,
										564,
										141
									],
									"text": "Kinds: forbid-object (a box matches), require-attribute and attribute-value (an attribute is set, inline or saved on the box), max-instances (at most N of an object per file or patcher), fanout-without-trigger, naming (scripting, send and receive names against a regular expression), script (a JS module exporting check(ctx)).\n\nmatch takes object (names are normalised: t, trigger, zl reg and zl.reg all work), maxclass, args and text. scope.namespace picks the patchers a rule looks at: box (the default), dsp.gen, jit.gen, rnbo or *, so a rule reaches into [gen~] subpatchers and .gendsp files alike. A finding reads [p main] > [gen~] > [+ 1].\n\nThe package README (Linting patchers) has every setting."
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						125,
						60,
						22
					],
					"text": "p rules"
				}
			},
			{
				"box": {
					"id": "obj-8",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patcher": {
						"fileversion": 1,
						"appversion": {
							"major": 9,
							"minor": 1,
							"revision": 4,
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
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										300,
										22
									],
									"text": "Which configs apply",
									"linecount": 1
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
										45,
										780,
										20
									],
									"text": "Rules come from munit-lint.json files, and they cascade. For each file [mUnit.lint] lints:",
									"linecount": 1
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
										72,
										780,
										20
									],
									"text": "1. @config <file>, when it is given: that file alone, for every file linted. Relative to this patch.",
									"linecount": 1
								}
							},
							{
								"box": {
									"id": "obj-4",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										98,
										654,
										47
									],
									"text": "2. Otherwise every munit-lint.json in the file's folder and in the folders above it, up to one that says \"root\": true or the top of the disk, applied outermost first. On start the console names the ones in force at @folder and the ones its subfolders add."
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
										159,
										780,
										20
									],
									"text": "3. None anywhere: the built-in mUnit:recommended set alone, and the console says so.",
									"linecount": 1
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
										190,
										680,
										60
									],
									"text": "Each inner config adds to the outer ones: its rules join the set (a rule with an id already seen replaces that rule), its overrides apply after the outer ones, its ignore patterns add to theirs, and its files list, when it has one, replaces theirs. So a subfolder can be stricter or looser than its parent without repeating what it inherits, and a folder-wide run and a save in a subfolder agree."
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
										20,
										274,
										780,
										47
									],
									"text": "Every path in a config is relative to the folder of that config file, not to the watched folder: rule files and globs in rules, and the patterns in files, ignore and overrides. An override that leaves files out applies to every file under its config. @rules adds rule files as the innermost layer. Within one config or rule file an id may appear only once."
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
										20,
										340,
										768,
										47
									],
									"text": "The patch in front is linted when you save it even outside the watched folder, with the watched folder's configs, as if it were inside. The command line does the same for each file it visits, so munit-cli.js lint <folder> reports what this object does; --config <file> turns the cascade off."
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
										406,
										781,
										47
									],
									"text": "\"root\": true stops the walk, so nothing above that config can change a project's results. Without it, a munit-lint.json in your home folder or in Max's Documents folder is a baseline for every project below it. The name has a hyphen on purpose: munit.lint.json shadows the [mUnit.lint] object in Max, which then fails to load, and the linter refuses that name."
								}
							},
							{
								"box": {
									"id": "obj-10",
									"linecount": 8,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										472,
										780,
										114
									],
									"text": "A typical project:\nmyProject/\n    munit-lint.json            \"root\": true, the rule sets and rule files for everything below\n    lint-rules/*.json          named in it as \"./lint-rules/*.json\"\n    lint.maxpat                holds [mUnit.lint @folder tests]\n    tests/munit-lint.json      adds mUnit:tests, or raises a level with an override that names no files\n    tests/...                  watched: the outer config, then tests/munit-lint.json\n    help/...                   the outer config alone; lint it from the command line"
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
										20,
										627,
										718,
										33
									],
									"text": "A worked example with three patches to save, a nested config that raises a level and an override: Extras > mUnit > lintConfigExample."
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						165,
						60,
						22
					],
					"text": "p config"
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
							"revision": 4,
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
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										144,
										38
									],
									"text": "Reading the console"
								}
							},
							{
								"box": {
									"fontname": "Menlo",
									"id": "obj-2",
									"linecount": 7,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										45,
										876,
										104
									],
									"text": "mUnit.lint: watching /path/to/tests; findings are posted here as you save\nmUnit.lint: rules from /path/to/munit-lint.json (3 rules active)\nmUnit.lint: subfolders add their own: /path/to/tests/munit-lint.json\nmUnit.lint: lintMe.maxpat: [button]: outlet 0 of [button] fans out to 2 inlets; put a [trigger] between them so the order is explicit [fanout-without-trigger]\nmUnit.lint: to silence a rule in one patcher, add a comment box there reading: munit-lint disable fanout-without-trigger\nmUnit.lint: lintMe.maxpat: 1 warning"
								}
							},
							{
								"box": {
									"id": "obj-3",
									"linecount": 11,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										163,
										502,
										154
									],
									"text": "A finding line is file: location: message [rule]. The location walks into subpatchers, so [p main] > [gen~] > [+ 1] is the [+ 1] inside the gen~ inside [p main]. A warn rule posts at warning level (yellow), a block rule at error level (red), and the last line per file sums up. Without a config the first lines say so and mUnit:recommended applies.\n\nTo silence a rule in one patcher, add a comment box there reading munit-lint disable followed by the rule ids (or nothing, for all of them). It applies to that patcher, not to its subpatchers.\n\nfix (the folder) or fix <path> applies the fixes the rules describe and writes the files back; only the boxes with findings change. Max should auto-reload the patch as it gets fixed, so your editor should reflect the changes at all times."
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						205,
						70,
						22
					],
					"text": "p console"
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
							"minor": 1,
							"revision": 4,
							"architecture": "x64",
							"modernui": 1
						},
						"classnamespace": "box",
						"rect": [
							86,
							236,
							820,
							754
						],
						"showontab": 1,
						"boxes": [
							{
								"box": {
									"fontface": 1,
									"fontsize": 14,
									"id": "obj-1",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										15,
										266,
										38
									],
									"text": "The same rules from the command line"
								}
							},
							{
								"box": {
									"id": "obj-2",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										45,
										768,
										33
									],
									"text": "What passes in Max passes in CI: the same engine runs from the command line over the same config, without starting Max, so it works on any machine, including GitHub-hosted runners. There are two ways to get it."
								}
							},
							{
								"box": {
									"id": "obj-5",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										85,
										768,
										47
									],
									"text": "From npm, the usual way in a project or CI job: add munit-cli as a dev dependency and call munit from a script. The package is self-contained, so the machine needs Node only, not Max or the mUnit package."
								}
							},
							{
								"box": {
									"fontname": "Menlo",
									"id": "obj-6",
									"linecount": 5,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										135,
										768,
										76
									],
									"text": "npm install --save-dev munit-cli\nnpx munit lint path/to/project                            # every file the config selects\nnpx munit lint path/to/project/tests/testFoo.maxpat       # one file, plus the .gendsp/.rnbopat it loads\nnpx munit lint path/to/project --format junit --output build/lint.xml\n\"scripts\": { \"lint:patchers\": \"munit lint patchers\" }     # in package.json, then npm run lint:patchers"
								}
							},
							{
								"box": {
									"id": "obj-7",
									"linecount": 2,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										220,
										768,
										33
									],
									"text": "From the Max package, with nothing to install: the same script ships inside it, so a machine that has Max has the command line too. It takes the same arguments."
								}
							},
							{
								"box": {
									"fontname": "Menlo",
									"id": "obj-3",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										258,
										758,
										47
									],
									"text": "MUNIT=\"$HOME/Documents/Max 9/Packages/mUnit/javascript/nodejs/runner/munit-cli.js\"\nnode \"$MUNIT\" lint path/to/project\nnode \"$MUNIT\" --help"
								}
							},
							{
								"box": {
									"id": "obj-4",
									"linecount": 3,
									"maxclass": "comment",
									"numinlets": 1,
									"numoutlets": 0,
									"patching_rect": [
										20,
										315,
										686,
										47
									],
									"text": "Exit codes: 0 clean or warnings only, 1 any block finding, 2 could not lint (a bad config or rule file, a patch that is not JSON). --rules <file> adds rule files, --config <file> names the config, --format text, json or junit. The text report is coloured on a terminal."
								}
							}
						],
						"lines": []
					},
					"patching_rect": [
						10,
						245,
						45,
						22
					],
					"text": "p cli"
				}
			},
			{
				"box": {
					"id": "obj-7",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patcher": {
						"fileversion": 1,
						"appversion": {
							"major": 9,
							"minor": 1,
							"revision": 4,
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
						"showontab": 1,
						"boxes": [],
						"lines": []
					},
					"patching_rect": [
						390,
						245,
						50,
						22
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
