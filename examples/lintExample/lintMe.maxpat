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
					"text": "lintMe: every rule fires once",
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
					"text": "Save it with lintExample open and read the Max console",
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
					"text": "Every rule in lint-rules/ fires once on this patch: run `munit lint .` here, or save it with lintExample.maxpat open and read the Max console. clean.maxpat is the same patch with every finding fixed; `munit lint . --fix` fixes the three that have fixes."
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
						30,
						171,
						340,
						20
					],
					"text": "fanout-without-trigger: one outlet, two inlets, no [trigger]"
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
					"id": "obj-p1",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						246,
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
						246,
						80,
						22
					],
					"text": "print second"
				}
			},
			{
				"box": {
					"id": "obj-c3",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						291,
						180,
						20
					],
					"text": "forbid-object, with a fix"
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
						46,
						22
					],
					"text": "zl reg"
				}
			},
			{
				"box": {
					"id": "obj-c4",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						351,
						260,
						20
					],
					"text": "require-attribute: @autowatch is missing"
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
						30,
						22
					],
					"text": "v8"
				}
			},
			{
				"box": {
					"id": "obj-c5",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						411,
						260,
						20
					],
					"text": "attribute-value: @embed 1 is missing"
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
						36,
						22
					],
					"text": "coll"
				}
			},
			{
				"box": {
					"id": "obj-c6",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						300,
						291,
						240,
						20
					],
					"text": "max-instances: one [metro] per patcher"
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
					"id": "obj-m2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						380,
						316,
						64,
						22
					],
					"text": "metro 100"
				}
			},
			{
				"box": {
					"id": "obj-c7",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						300,
						351,
						260,
						20
					],
					"text": "naming: send names are lower_snake_case"
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
						82,
						22
					],
					"text": "s MyBadName"
				}
			},
			{
				"box": {
					"id": "obj-c8",
					"linecount": 1,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						300,
						411,
						220,
						20
					],
					"text": "script: a [p] without a name"
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
						24,
						22
					],
					"text": "p",
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
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-p1",
						0
					],
					"order": 1,
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
					"order": 0,
					"source": [
						"obj-btn",
						0
					]
				}
			}
		],
		"autosave": 0
	}
}
