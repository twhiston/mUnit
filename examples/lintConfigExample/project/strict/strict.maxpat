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
			600,
			370
		],
		"gridsize": [
			15,
			15
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
						600,
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
						560,
						29
					],
					"text": "strict/strict.maxpat: a blocking error",
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
						560,
						20
					],
					"text": "strict/munit-lint.json sits on the outer config and raises no-zl-reg to block",
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
					"maxclass": "comment",
					"numinlets": 1,
					"numoutlets": 0,
					"patching_rect": [
						30,
						96,
						520,
						93
					],
					"text": "Save this patch with lintConfigExample.maxpat open: a blocking error. The munit-lint.json next to this patch sits on top of the one above project/ and raises no-zl-reg to block with an override that names no files, so it applies to everything in strict/. The rule itself is still defined once, in the outer config. The command line agrees: munit lint .../project exits with 1 because of this file.",
					"linecount": 5
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
						204,
						24,
						24
					]
				}
			},
			{
				"box": {
					"id": "obj-list",
					"maxclass": "message",
					"numinlets": 2,
					"numoutlets": 1,
					"outlettype": [
						""
					],
					"patching_rect": [
						90,
						204,
						50,
						22
					],
					"text": "1 2 3"
				}
			},
			{
				"box": {
					"id": "obj-reg",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 2,
					"outlettype": [
						"",
						""
					],
					"patching_rect": [
						30,
						249,
						60,
						22
					],
					"text": "zl.reg"
				}
			},
			{
				"box": {
					"id": "obj-print",
					"maxclass": "newobj",
					"numinlets": 1,
					"numoutlets": 0,
					"outlettype": [],
					"patching_rect": [
						30,
						294,
						70,
						22
					],
					"text": "print strict"
				}
			}
		],
		"lines": [
			{
				"patchline": {
					"destination": [
						"obj-reg",
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
						"obj-reg",
						1
					],
					"source": [
						"obj-list",
						0
					]
				}
			},
			{
				"patchline": {
					"destination": [
						"obj-print",
						0
					],
					"source": [
						"obj-reg",
						0
					]
				}
			}
		],
		"autosave": 0
	}
}
