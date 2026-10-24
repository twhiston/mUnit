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
			347,
			170,
			520,
			300
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
						520,
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
						480,
						29
					],
					"text": "A test patch under tests/",
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
						480,
						20
					],
					"text": "Run by munit run --tests tests; here a fan-out is a blocking finding",
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
					"linecount": 3,
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						96,
						440,
						47
					],
					"text": "A test patch: `munit run . --tests tests` from the example folder opens it under a generated harness. The config's override makes fan-out a blocking lint finding in tests/, where message order matters most."
				}
			},
			{
				"box": {
					"id": "obj-lb",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 1,
					"outlettype": [
						"bang"
					],
					"patching_rect": [
						30,
						166,
						93,
						22
					],
					"text": "mUnit.loadbang"
				}
			},
			{
				"box": {
					"id": "obj-one",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						"int"
					],
					"patching_rect": [
						30,
						206,
						29.5,
						22
					],
					"text": "1"
				}
			},
			{
				"box": {
					"id": "obj-assert",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"patching_rect": [
						30,
						246,
						140,
						22
					],
					"text": "mUnit.assert in1 == 1"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-one",
						0
					],
					"source": [
						"obj-lb",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-assert",
						1
					],
					"source": [
						"obj-one",
						0
					]
				}
			}
		],
		"autosave": 0
	}
}
