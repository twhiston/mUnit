{
	"patcher": {
		"fileversion": 1,
		"appversion": {
			"major": 9,
			"minor": 0,
			"revision": 6,
			"architecture": "x64",
			"modernui": 1
		},
		"classnamespace": "box",
		"rect": [
			140.0,
			140.0,
			560.0,
			240.0
		],
		"bglocked": 0,
		"openinpresentation": 0,
		"default_fontsize": 12.0,
		"default_fontface": 0,
		"default_fontname": "Arial",
		"gridonopen": 1,
		"gridsize": [
			15.0,
			15.0
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
		"devicewidth": 0.0,
		"description": "",
		"digest": "",
		"tags": "",
		"style": "",
		"subpatcher_template": "",
		"assistshowspatchername": 0,
		"boxes": [
			{
				"box": {
					"id": "obj-c1",
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30.0,
						20.0,
						480.0,
						60.0
					],
					"text": "Save this patch with [mUnit.lint] running in lintExample.maxpat: the button below fans out to two prints without a [trigger], which the recommended rules warn about. Put a [t b b] between them, save again, and the console says clean.",
					"linecount": 3
				}
			},
			{
				"box": {
					"id": "obj-btn",
					"maxclass": "button",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"parameter_enable": 0,
					"patching_rect": [
						30.0,
						100.0,
						24.0,
						24.0
					]
				}
			},
			{
				"box": {
					"id": "obj-p1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"patching_rect": [
						30.0,
						150.0,
						70.0,
						22.0
					],
					"text": "print first"
				}
			},
			{
				"box": {
					"id": "obj-p2",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"patching_rect": [
						130.0,
						150.0,
						80.0,
						22.0
					],
					"text": "print second"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-p1",
						0
					],
					"source": [
						"obj-btn",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-p2",
						0
					],
					"source": [
						"obj-btn",
						0
					]
				}
			}
		],
		"dependency_cache": [],
		"autosave": 0
	}
}
