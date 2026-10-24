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
			80,
			80,
			520,
			200
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
					"text": "tests/helper.maxpat: not a test",
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
					"text": "Left out by the pattern test_*.maxpat, so its assert never registers",
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
					"id": "obj-2",
					"maxclass": "newobj",
					"numinlets": 2,
					"numoutlets": 0,
					"outlettype": [],
					"patching_rect": [
						20,
						96,
						292,
						22
					],
					"text": "mUnit.assert in1 == 1 @name helperNotATest"
				}
			}
		],
		"lines": []
	}
}
