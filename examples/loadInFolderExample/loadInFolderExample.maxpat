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
        "rect": [ 441.0, 221.0, 1000.0, 755.0 ],
        "boxes": [
            {
                "box": {
                    "fontface": 1,
                    "fontsize": 16.0,
                    "id": "obj-3",
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 22.0, 14.0, 600.0, 24.0 ],
                    "text": "A test folder, and a test orchestration with a \"wrangler\""
                }
            },
            {
                "box": {
                    "id": "obj-of1",
                    "maxclass": "message",
                    "numinlets": 2,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 553.0, 65.0, 75.0, 22.0 ],
                    "text": "open folder"
                }
            },
            {
                "box": {
                    "id": "obj-of2",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 553.0, 98.0, 165.0, 22.0 ],
                    "text": "mUnit.examples.openFolder"
                }
            },
            {
                "box": {
                    "id": "obj-4",
                    "linecount": 31,
                    "maxclass": "comment",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "patching_rect": [ 215.0, 65.0, 337.0, 422.0 ],
                    "text": "This example shows the \"test wrangler\" pattern.\n\nIf you're creating a suite of tests this is probably something you will want to do often since it's the easiest way to instrument the running and reporting of a large number of tests.\n\n1 .The folder for this patch contains an munit.config.js which is loaded into the handler by the test harness.\n\n2. The test harness, being passed the @loadFolder arg, will look for this named subfolder folder beneath the current path, and will load any maxpats found. \n\n3. File opening, test registration, result collection and closing of these patches and asserts will be handled by the harness/handler combination. Tests will be run concurrently\n \nAs such the test patchers do not need individual configuration, they can just be simple patchers with events into asserts, triggered by an mUnit.loadbang.\n\nLook inside the example folder to see the tests which this harness ran.\n\nSee the sequentialHarnessExample for more configuration options.\n\nYou can take this concept even further by using the cli tool to also orchestrate starting and stopping Max itself for your test suites"
                }
            },
            {
                "box": {
                    "id": "obj-2",
                    "maxclass": "newobj",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [ "" ],
                    "patching_rect": [ 22.0, 70.0, 187.0, 22.0 ],
                    "text": "mUnit.harness @loadFolder tests"
                }
            },
            {
                "box": {
                    "id": "obj-1",
                    "maxclass": "newobj",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [ "bang", "bang" ],
                    "patching_rect": [ 22.0, 128.0, 83.0, 22.0 ],
                    "text": "mUnit.handler"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "destination": [ "obj-1", 0 ],
                    "source": [ "obj-2", 0 ]
                }
            },
            {
                "patchline": {
                    "destination": [ "obj-of2", 0 ],
                    "source": [ "obj-of1", 0 ]
                }
            }
        ],
        "autosave": 0
    }
}