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
        "rect": [ 86.0, 210.0, 820.0, 780.0 ],
        "showrootpatcherontab": 0,
        "showontab": 0,
        "boxes": [
            {
                "box": {
                    "border": 0,
                    "filename": "helpname.js",
                    "id": "obj-1",
                    "ignoreclick": 1,
                    "jsarguments": [ "mUnit.lint" ],
                    "maxclass": "jsui",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "parameter_enable": 0,
                    "patching_rect": [ 10.0, 10.0, 305.0, 55.0 ]
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 459.0, 85.0, 160.0, 22.0 ],
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
                        "rect": [ 0.0, 26.0, 820.0, 754.0 ],
                        "gridsize": [ 5.0, 5.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "border": 0,
                                    "filename": "helpdetails.js",
                                    "id": "obj-1",
                                    "ignoreclick": 1,
                                    "jsarguments": [ "mUnit.lint" ],
                                    "maxclass": "jsui",
                                    "numinlets": 1,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "parameter_enable": 0,
                                    "patching_rect": [ 10.0, 10.0, 620.0, 125.0 ]
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "linecount": 5,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 150.0, 604.0, 88.0 ],
                                    "text": "[mUnit.lint] watches a folder and lints every patcher file in it (.maxpat, .maxhelp, .gendsp, .rnbopat) the moment it is saved, without leaving Max. Findings go to the Max console: a warn rule posts a warning, a block rule posts an error, then one line per file sums up. The patch you are editing is linted too, even outside the folder: the object keeps an eye on the front window (@followfront 0 turns that off). The patch holding [mUnit.lint] must be saved, since @folder is relative to it."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 20.0, 245.0, 35.0, 22.0 ],
                                    "text": "lint"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 65.0, 245.0, 140.0, 22.0 ],
                                    "text": "lint lint/lintMe.maxpat"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 215.0, 245.0, 40.0, 22.0 ],
                                    "text": "start"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 265.0, 245.0, 35.0, 22.0 ],
                                    "text": "stop"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-8",
                                    "maxclass": "message",
                                    "numinlets": 2,
                                    "numoutlets": 1,
                                    "outlettype": [ "" ],
                                    "patching_rect": [ 310.0, 245.0, 45.0, 22.0 ],
                                    "text": "status"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-9",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 2,
                                    "outlettype": [ "", "started" ],
                                    "patching_rect": [ 20.0, 285.0, 150.0, 22.0 ],
                                    "text": "mUnit.lint @folder lint"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-10",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 151.0, 323.0, 100.0, 22.0 ],
                                    "text": "print mUnit.lint"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-11",
                                    "maxclass": "newobj",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 323.0, 90.0, 22.0 ],
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
                                    "patching_rect": [ 380.0, 245.0, 423.0, 60.0 ],
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
                                    "patching_rect": [ 380.0, 318.0, 378.0, 102.0 ],
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
                                    "patching_rect": [ 20.0, 360.0, 343.0, 88.0 ],
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
                                    "patching_rect": [ 20.0, 455.0, 552.0, 202.0 ],
                                    "text": "@folder <path>: the folder to watch, relative to this patch (default: the patch's own). Subfolders are watched too. @folder none watches no folder: the patch in front is linted when you save it, with the configs in and above its own folder, wherever it is. That is how Extras > mUnit Lint Server runs.\n@root 1: the folder is the top of the config cascade; a munit-lint.json above it is ignored, as if the folder's config said \"root\": true. Project mode: set @folder to the root of your repository.\n@followfront 0: lint the folder and below only. By default the patch in front is linted on save even when it lies outside the folder, with the folder's configs; with 0 it is left alone, so a project is linted the same way whatever else you have open. Not with @folder none, which then has nothing to lint.\n@config <file>: one config file for everything, relative to this patch. Default: the munit-lint.json files in the folder and above it, cascading (the config tab says how); without any, mUnit:recommended applies.\n@rules <file...>: extra rule files, like the command line's --rules.\nfolder <path>, root <0|1> and followfront <0|1> may also be sent as messages; they take effect at the next start."
                                }
                            }
                        ],
                        "lines": [
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-4", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-5", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-6", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-7", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-9", 0 ],
                                    "source": [ "obj-8", 0 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-10", 0 ],
                                    "source": [ "obj-9", 1 ]
                                }
                            },
                            {
                                "patchline": {
                                    "destination": [ "obj-11", 0 ],
                                    "source": [ "obj-9", 0 ]
                                }
                            }
                        ]
                    },
                    "patching_rect": [ 10.0, 85.0, 55.0, 22.0 ],
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
                        "rect": [ 0.0, 26.0, 820.0, 754.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "obj-1",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 15.0, 168.0, 38.0 ],
                                    "text": "Rules and the config file"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 45.0, 780.0, 20.0 ],
                                    "text": "munit-lint.json, in the folder or above it (several cascade; the config tab says how), says which rules apply to which files:"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Menlo",
                                    "id": "obj-3",
                                    "linecount": 8,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 70.0, 780.0, 118.0 ],
                                    "text": "{\n  \"rules\": [\"mUnit:recommended\", \"mUnit:tests\", \"./lint-rules/*.json\"],\n  \"files\": [\"**/*.maxpat\", \"**/*.maxhelp\", \"**/*.gendsp\", \"**/*.rnbopat\"],\n  \"ignore\": [\"**/_scratch/**\"],\n  \"overrides\": [\n    { \"files\": [\"**/*.maxhelp\"], \"rules\": { \"no-zl-reg\": \"off\" } }\n  ]\n}"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 200.0, 684.0, 60.0 ],
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
                                    "patching_rect": [ 20.0, 275.0, 770.0, 33.0 ],
                                    "text": "A rule is one JSON object; a rule file holds one rule, a list, or { \"rules\": [...] }. kind picks what is checked, level is off, warn or block (block fails CI):"
                                }
                            },
                            {
                                "box": {
                                    "fontname": "Menlo",
                                    "id": "obj-6",
                                    "linecount": 7,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 315.0, 780.0, 104.0 ],
                                    "text": "{\n  \"id\": \"no-zl-reg\",\n  \"level\": \"block\",\n  \"kind\": \"forbid-object\",\n  \"match\": { \"object\": \"zl.reg\" },\n  \"message\": \"zl.reg is not allowed here, use list.reg\"\n}"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-7",
                                    "linecount": 10,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 430.0, 564.0, 141.0 ],
                                    "text": "Kinds: forbid-object (a box matches), require-attribute and attribute-value (an attribute is set, inline or saved on the box), max-instances (at most N of an object per file or patcher), fanout-without-trigger, naming (scripting, send and receive names against a regular expression), script (a JS module exporting check(ctx)).\n\nmatch takes object (names are normalised: t, trigger, zl reg and zl.reg all work), maxclass, args and text. scope.namespace picks the patchers a rule looks at: box (the default), dsp.gen, jit.gen, rnbo or *, so a rule reaches into [gen~] subpatchers and .gendsp files alike. A finding reads [p main] > [gen~] > [+ 1].\n\nThe package README (Linting patchers) has every setting."
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 125.0, 60.0, 22.0 ],
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
                        "rect": [ 0.0, 26.0, 820.0, 754.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "obj-1",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 15.0, 300.0, 22.0 ],
                                    "text": "Which configs apply"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-2",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 45.0, 780.0, 20.0 ],
                                    "text": "Rules come from munit-lint.json files, and they cascade. For each file [mUnit.lint] lints:"
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-3",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 72.0, 780.0, 20.0 ],
                                    "text": "1. @config <file>, when it is given: that file alone, for every file linted. Relative to this patch."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-4",
                                    "linecount": 3,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 98.0, 654.0, 47.0 ],
                                    "text": "2. Otherwise every munit-lint.json in the file's folder and in the folders above it, up to one that says \"root\": true or the top of the disk, applied outermost first. On start the console names the ones in force at @folder and the ones its subfolders add."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-5",
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 159.0, 780.0, 20.0 ],
                                    "text": "3. None anywhere: the built-in mUnit:recommended set alone, and the console says so."
                                }
                            },
                            {
                                "box": {
                                    "id": "obj-6",
                                    "linecount": 4,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 190.0, 680.0, 60.0 ],
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
                                    "patching_rect": [ 20.0, 274.0, 780.0, 47.0 ],
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
                                    "patching_rect": [ 20.0, 340.0, 768.0, 47.0 ],
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
                                    "patching_rect": [ 20.0, 406.0, 781.0, 47.0 ],
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
                                    "patching_rect": [ 20.0, 472.0, 780.0, 114.0 ],
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
                                    "patching_rect": [ 20.0, 627.0, 718.0, 33.0 ],
                                    "text": "A worked example with three patches to save, a nested config that raises a level and an override: Extras > mUnit > lintConfigExample."
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 165.0, 60.0, 22.0 ],
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
                        "rect": [ 0.0, 26.0, 820.0, 754.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "obj-1",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 15.0, 144.0, 38.0 ],
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
                                    "patching_rect": [ 20.0, 45.0, 876.0, 104.0 ],
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
                                    "patching_rect": [ 20.0, 163.0, 502.0, 154.0 ],
                                    "text": "A finding line is file: location: message [rule]. The location walks into subpatchers, so [p main] > [gen~] > [+ 1] is the [+ 1] inside the gen~ inside [p main]. A warn rule posts at warning level (yellow), a block rule at error level (red), and the last line per file sums up. Without a config the first lines say so and mUnit:recommended applies.\n\nTo silence a rule in one patcher, add a comment box there reading munit-lint disable followed by the rule ids (or nothing, for all of them). It applies to that patcher, not to its subpatchers.\n\nfix (the folder) or fix <path> applies the fixes the rules describe and writes the files back; only the boxes with findings change. Max should auto-reload the patch as it gets fixed, so your editor should reflect the changes at all times."
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 205.0, 70.0, 22.0 ],
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
                        "rect": [ 86.0, 236.0, 820.0, 754.0 ],
                        "showontab": 1,
                        "boxes": [
                            {
                                "box": {
                                    "fontface": 1,
                                    "fontsize": 14.0,
                                    "id": "obj-1",
                                    "linecount": 2,
                                    "maxclass": "comment",
                                    "numinlets": 1,
                                    "numoutlets": 0,
                                    "patching_rect": [ 20.0, 15.0, 266.0, 38.0 ],
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
                                    "patching_rect": [ 20.0, 45.0, 768.0, 33.0 ],
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
                                    "patching_rect": [ 20.0, 85.0, 768.0, 47.0 ],
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
                                    "patching_rect": [ 20.0, 135.0, 768.0, 76.0 ],
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
                                    "patching_rect": [ 20.0, 220.0, 768.0, 33.0 ],
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
                                    "patching_rect": [ 20.0, 258.0, 758.0, 47.0 ],
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
                                    "patching_rect": [ 20.0, 315.0, 686.0, 47.0 ],
                                    "text": "Exit codes: 0 clean or warnings only, 1 any block finding, 2 could not lint (a bad config or rule file, a patch that is not JSON). --rules <file> adds rule files, --config <file> names the config, --format text, json or junit. The text report is coloured on a terminal."
                                }
                            }
                        ],
                        "lines": []
                    },
                    "patching_rect": [ 10.0, 245.0, 45.0, 22.0 ],
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
                        "rect": [ 0.0, 26.0, 820.0, 754.0 ],
                        "showontab": 1,
                        "boxes": [],
                        "lines": []
                    },
                    "patching_rect": [ 390.0, 245.0, 50.0, 22.0 ],
                    "text": "p ?",
                    "varname": "q_tab"
                }
            }
        ],
        "lines": [],
        "autosave": 0
    }
}
