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
			665,
			280,
			580,
			500
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
						580,
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
						540,
						29
					],
					"text": "clean: lintMe with every finding fixed",
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
						540,
						20
					],
					"text": "Save it with lintExample open: the console reports it clean",
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
					"id": "obj-c1",
					"linecount": 4,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						96,
						500,
						60
					],
					"text": "lintMe.maxpat with every finding fixed: a [t b b] orders the prints, [list.reg] replaces [zl reg], the attributes are set, one [metro] drives the send, a lower_snake_case send name with its receive, and a named subpatcher. `munit lint .` reports nothing here."
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
						30,
						196,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-t",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 2,
					"outlettype": [
						"bang",
						"bang"
					],
					"patching_rect": [
						30,
						226,
						40,
						22
					],
					"text": "t b b"
				}
			},
			{
				"box": {
					"id": "obj-p1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						266,
						70,
						22
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
					"patching_rect": [
						123,
						266,
						80,
						22
					],
					"text": "print second"
				}
			},
			{
				"box": {
					"id": "obj-zl",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						316,
						54,
						22
					],
					"text": "list.reg"
				}
			},
			{
				"box": {
					"id": "obj-v8",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						30,
						376,
						100,
						22
					],
					"text": "v8 @autowatch 0"
				}
			},
			{
				"box": {
					"id": "obj-coll",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 4,
					"outlettype": [
						"",
						"",
						"",
						""
					],
					"patching_rect": [
						30,
						436,
						86,
						22
					],
					"text": "coll @embed 1"
				}
			},
			{
				"box": {
					"id": "obj-m1",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						300,
						316,
						64,
						22
					],
					"text": "metro 100"
				}
			},
			{
				"box": {
					"id": "obj-send",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						300,
						376,
						100,
						22
					],
					"text": "s my_good_name"
				}
			},
			{
				"box": {
					"id": "obj-p",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 0,
					"patching_rect": [
						300,
						436,
						56,
						22
					],
					"text": "p named",
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
							100,
							100,
							400,
							300
						],
						"boxes": [],
						"lines": [],
						"autosave": 0
					}
				}
			},
			{
				"box": {
					"id": "obj-recv",
					"maxclass": "newobj",
					"numinlets": 0,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						420,
						376,
						100,
						22
					],
					"text": "r my_good_name"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-t",
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
						"obj-t",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-p1",
						0
					],
					"source": [
						"obj-t",
						1
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-send",
						0
					],
					"source": [
						"obj-m1",
						0
					]
				}
			}
		],
		"autosave": 0
	}
}
