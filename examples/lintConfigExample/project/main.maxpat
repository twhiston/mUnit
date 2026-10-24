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
			580,
			350
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
					"text": "main.maxpat: two warnings",
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
					"text": "Save it with lintConfigExample open and read the Max console",
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
						76
					],
					"text": "Save this patch with lintConfigExample.maxpat open: two warnings. [zl.reg] breaks no-zl-reg from the munit-lint.json one level above the project folder, found by walking up from it. The bare [print] breaks named-print from extra-rules.json, which @rules adds on top. Both rules are warn, so the file would still pass in CI.",
					"linecount": 4
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
						187,
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
						187,
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
						232,
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
						277,
						40,
						22
					],
					"text": "print"
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
