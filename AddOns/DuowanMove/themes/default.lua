--------------------------------------------
-- default - ver 1.0
-- 日期: 2010-4-9
-- 作者: dugu
-- 描述: 多玩提供的界面缺省方案
-- 版权所有 (c) Duowan.com
--------------------------------------------
DUOWANMOVE_DEFAULT_DB = {	
	["version"] = "1.0.1",
	["_themes"] = {
		["default"] = {			
			["lock"] = false,
			["useUiScale"] = true,
			["uiscale"] = 1,
			["ACTIONBAR"] = {				
				["dwMainBar"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 500,
					["linenum"] = 1,
					["height"] = 36,
					["lock"] = true,			-- 表示这个元素可以被执行刷新动作, lock == true表示这个元素处于系统缺省状态
					["move"] = true,		-- 这个元素是否可以移动(lock == false)时才具有价值
					["space"] = 6,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOMLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-465, -- [4]
						0, -- [5]
					}, -- [1]
				},
				["dwBottomLeftBar"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 500,
					["linenum"] = 1,
					["height"] = 38,
					["lock"] = true,
					["move"] = true,
					["space"] = 6,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-465, -- [4]
						86, -- [5]
					}, -- [1]
				},
				["dwBottomRightBar"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 500,
					["linenum"] = 1,
					["height"] = 38,
					["lock"] = true,
					["move"] = true,
					["space"] = 6,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						40, -- [4]
						86, -- [5]
					}, -- [1]						
				},
				["dwRightBar1"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 38,
					["linenum"] = 1,
					["height"] = 500,
					["lock"] = true,
					["move"] = true,
					["space"] = 5,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-7, -- [4]
						98, -- [5]
					}, -- [1]
				},
				["dwRightBar2"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 38,
					["linenum"] = 1,
					["height"] = 500,
					["lock"] = true,
					["move"] = true,
					["space"] = 5,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] ={
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-50, -- [4]
						98, -- [5]
					}, -- [1]
				},					
				["dwExtraBar1"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 36,
					["linenum"] = 1,
					["height"] = 454,
					["lock"] = true,
					["move"] = true,
					["space"] = 2,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						-116, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar2"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 36,
					["linenum"] = 1,
					["space"] = 2,
					["lock"] = true,
					["move"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						-60, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar3"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 36,
					["linenum"] = 1,
					["space"] = 2,
					["lock"] = true,
					["move"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar4"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 36,
					["linenum"] = 1,
					["space"] = 2,
					["lock"] = true,
					["move"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						60, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar5"] = {
					["visible"] = true,
					["num"] = 12,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 36,
					["linenum"] = 1,
					["space"] = 2,
					["lock"] = true,
					["move"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						116, -- [4]
						20, -- [5]
					},
				},	
				["dwPossessBar"] = {
					["visible"] = true,
					["num"] = 2,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 66,
					["linenum"] = 1,
					["space"] = 2,
					["lock"] = true,
					["move"] = true,
					["height"] = 32,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-450, -- [4]
						122, -- [5]
					},
				},	
				["dwPlayerPetBar"] = {
					["visible"] = true,
					["num"] = 10,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 509,
					["linenum"] = 1,
					["space"] = 5,
					["lock"] = true,
					["move"] = true,
					["height"] = 30,
					["arrange"] = 2,
					["invert"] = false,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-58, -- [4]
						125, -- [5]
					}, -- [1]
				},
				["dwBagBar"] = {
					["visible"] = true,
					["num"] = 6,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 169.9999990159591,
					["linenum"] = 1,
					["height"] = 29.99999929711365,
					["lock"] = true,
					["move"] = true,
					["space"] = 1,
					["invert"] = true,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						516, -- [4]
						2, -- [5]
					}, -- [1]
				},
				["dwShapeShiftBar"] = {
					["visible"] = true,
					["num"] = 10,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 344.9999964152796,
					["linenum"] = 1,
					["space"] = 5,
					["lock"] = true,
					["move"] = true,
					["height"] = 29.99999929711365,
					["arrange"] = 2,
					["invert"] = false,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-450, -- [4]
						122, -- [5]
					}, -- [1]
				},			
				["dwMenuBar"] = {
					["visible"] = true,
					["num"] = 10,
					["scale"] = 1,
					["minimize"] = false;
					["alpha"] = 1,
					["width"] = 298,
					["linenum"] = 1,
					["height"] = 35,
					["lock"] = true,
					["move"] = true,
					["space"] = -3,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOMLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						40, -- [4]
						6, -- [5]
					}, -- [1]
				},
				["dwMultiCastBar"] = {
					["visible"] = true,
					["num"] = 0,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 230,
					["height"] = 38,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["space"] = 2,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-450, -- [4]
						122, -- [5]
					},
				},
			},
			["CASTBAR"] = {
				["dwCastBarFrame"] = {
					["visible"] = true,
					["width"] = 193,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 14,
					["alpha"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-516.899952351334, -- [4]
						139.9999997188455, -- [5]
					}, -- [1]
				},
				["dwMirrorTimerFrame"] = {
					["visible"] = true,
					["width"] = 206,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 78,
					["alpha"] = 1,
					["pos"] = {
						"TOP", -- [1]
						"UIParent", -- [2]
						"TOP", -- [3]
						0, -- [4]
						-96, -- [5]
					}, -- [1]
				},
				["dwExBar"] = {
					["visible"] = true,
					["width"] = 1024,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 13,
					["alpha"] = 1,
					["pos"] = {
						"TOP", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						0, -- [4]
						53, -- [5]
					}, -- [1]
				},
			},
			["OTHER"] = {
				["dwMiniMapFrame"] = {
					["visible"] = true,
					["width"] = 192,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 182,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						0, -- [4]
						0, -- [5]
					}, -- [1]
				},
				["dwDurabilityFrame"] = {
					["visible"] = true,
					["width"] = 60,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 65,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						- 90, -- [4]
						-185, -- [5]
					}, -- [1]
				},
				["dwBuffFrame"] = {
					["visible"] = true,
					["width"] = 275,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 200,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						-180, -- [4]
						-13, -- [5]
					}, -- [1]
				},
			},
			["UNITFRAME"] = {
				["dwUnitTargetFrame"] = {
					["visible"] = true,
					["width"] = 232.0000005623091,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 99.99999465806371,
					["alpha"] = 1,
					["pos"] ={
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						370, -- [4]
						-8.00001180849074, -- [5]
					}, -- [1]
				},
				["dwUnitPartyFrame"] = {
					["visible"] = true,
					["width"] = 134,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 250,
					["alpha"] = 1,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						20.00000028115454, -- [4]
						-179.9999957826819, -- [5]
					}, -- [1]
				},
				["dwUnitPlayerFrame"] = {
					["visible"] = true,
					["width"] = 232.0000005623091,
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 99.99999465806371,
					["alpha"] = 1,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						0, -- [4]
						-8.00001180849074, -- [5]
					}, -- [1]
				},
				["dwUnitFocusFrame"] = {
					["visible"] = true,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						12, -- [4]
						-420, -- [5]
					}, -- [1]
					["lock"] = true,
					["move"] = true,
					["scale"] = 1,
					["height"] = 99,
					["alpha"] = 1,
					["width"] = 232,
				},
			},
		},
		["现代型"] = {
			["hideTab"] = false,
			["lock"] = false,
			["useUiScale"] = true,
			["uiscale"] = 0.83,
			["ACTIONBAR"] = {
				["dwBagBar"] = {
					["visible"] = true,
					["num"] = 6,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 148.0000475151175,
					["height"] = 38.00000210865906,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 0,
					["invert"] = true,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						0, -- [5]
					},
				},
				["dwShapeShiftBar"] = {
					["visible"] = true,
					["num"] = 3,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 99.99996766722774,
					["space"] = 5,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["height"] = 30.00002403871329,
					["arrange"] = 2,
					["invert"] = false,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-145.4027013750074, -- [4]
						111.9888381647047, -- [5]
					},
				},
				["dwMainBar"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 465,
					["height"] = 36,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 3,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						33, -- [4]
						0, -- [5]
					},
				},
				["dwPossessBar"] = {
					["visible"] = true,
					["num"] = 2,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 29.99999254940465,
					["space"] = 2,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["height"] = 62.0000105432953,
					["arrange"] = 2,
					["invert"] = false,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-179.350704232381, -- [4]
						78.93707501294541, -- [5]
					},
				},
				["dwRightBar2"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 38,
					["height"] = 500,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 5,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-50, -- [4]
						98, -- [5]
					},
				},
				["dwRightBar1"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 38,
					["height"] = 500,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 5,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-7, -- [4]
						98, -- [5]
					},
				},
				["dwBottomLeftBar"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 465,
					["height"] = 36,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 3,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						33, -- [4]
						74, -- [5]
					},
				},
				["dwBottomRightBar"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 465,
					["height"] = 36,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 3,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						33, -- [4]
						37, -- [5]
					},
				},
				["dwExtraBar2"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 36,
					["space"] = 2,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						-60, -- [4]
						20, -- [5]
					},
				},
				["dwMenuBar"] = {
					["visible"] = true,
					["num"] = 11,
					["move"] = true,
					["scale"] = 0.800000011920929,
					["alpha"] = 1,
					["width"] = 253.000022562652,
					["height"] = 37.99999311171374,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = -3,
					["invert"] = false,
					["arrange"] = 2,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						44.70352260633634, -- [5]
					},
				},
				["dwExtraBar5"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 36,
					["space"] = 2,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						116, -- [4]
						20, -- [5]
					},
				},
				["dwPlayerPetBar"] = {
					["visible"] = true,
					["num"] = 10,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 344.9999964152796,
					["space"] = 5,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["height"] = 30.00000154634998,
					["arrange"] = 2,
					["invert"] = false,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						206.0288243853206, -- [4]
						112.8848709405765, -- [5]
					},
				},
				["dwExtraBar3"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 36,
					["space"] = 2,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						0, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar4"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 36,
					["space"] = 2,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["height"] = 454,
					["arrange"] = 1,
					["invert"] = false,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						60, -- [4]
						20, -- [5]
					},
				},
				["dwExtraBar1"] = {
					["visible"] = true,
					["num"] = 12,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 36,
					["height"] = 454,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = true,
					["space"] = 2,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						-116, -- [4]
						20, -- [5]
					},
				},
				["dwMultiCastBar"] = {
					["visible"] = true,
					["num"] = 0,
					["move"] = true,
					["scale"] = 1,
					["alpha"] = 1,
					["width"] = 230,
					["height"] = 38,
					["linenum"] = 1,
					["minimize"] = false,
					["lock"] = false,
					["space"] = 2,
					["invert"] = false,
					["arrange"] = 1,
					["pos"] = {
						"BOTTOM", -- [1]
						"UIParent", -- [2]
						"BOTTOM", -- [3]
						-145.4027013750074, -- [4]
						111.9888381647047, -- [5]
					},
				},
			},
			["CASTBAR"] = {
				["dwExBar"] = {
					["visible"] = true,
					["width"] = 204.7999856048875,
					["move"] = true,
					["lock"] = false,
					["scale"] = 1,
					["height"] = 12.99999669643414,
					["alpha"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						0, -- [4]
						78.92621569993669, -- [5]
					},
				},
				["dwCastBarFrame"] = {
					["visible"] = true,
					["width"] = 193,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 14,
					["alpha"] = 1,
					["pos"] = {
						"BOTTOMRIGHT", -- [1]
						"UIParent", -- [2]
						"BOTTOMRIGHT", -- [3]
						-516.899952351334, -- [4]
						139.9999997188455, -- [5]
					},
				},
				["dwMirrorTimerFrame"] = {
					["visible"] = true,
					["width"] = 206,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 78,
					["alpha"] = 1,
					["pos"] = {
						"TOP", -- [1]
						"UIParent", -- [2]
						"TOP", -- [3]
						0, -- [4]
						-96, -- [5]
					},
				},
			},
			["OTHER"] = {
				["dwDurabilityFrame"] = {
					["visible"] = true,
					["width"] = 60,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 65,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						-90, -- [4]
						-185, -- [5]
					},
				},
				["dwBuffFrame"] = {
					["visible"] = true,
					["width"] = 275,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 200,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						-180, -- [4]
						-13, -- [5]
					},
				},
				["dwMiniMapFrame"] = {
					["visible"] = true,
					["width"] = 192,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 182,
					["alpha"] = 1,
					["pos"] = {
						"TOPRIGHT", -- [1]
						"UIParent", -- [2]
						"TOPRIGHT", -- [3]
						0, -- [4]
						0, -- [5]
					},
				},
			},
			["UNITFRAME"] = {
				["dwUnitTargetFrame"] = {
					["visible"] = true,
					["width"] = 232.0000185561997,
					["move"] = true,
					["lock"] = false,
					["scale"] = 1,
					["height"] = 99.99996766722774,
					["alpha"] = 1,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						181.9559496904875, -- [4]
						-118.3291294872001, -- [5]
					},
				},
				["dwUnitPartyFrame"] = {
					["visible"] = true,
					["width"] = 134,
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 250,
					["alpha"] = 1,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						20.00000028115454, -- [4]
						-179.9999957826819, -- [5]
					},
				},
				["dwUnitPlayerFrame"] = {
					["visible"] = true,
					["width"] = 232.0000185561997,
					["move"] = true,
					["lock"] = false,
					["scale"] = 1,
					["height"] = 99.99996766722774,
					["alpha"] = 1,
					["pos"] = {
						"CENTER", -- [1]
						"UIParent", -- [2]
						"CENTER", -- [3]
						-172.2630006738571, -- [4]
						-119.0190962273208, -- [5]
					},
				},
				["dwUnitFocusFrame"] = {
					["visible"] = true,
					["pos"] = {
						"TOPLEFT", -- [1]
						"UIParent", -- [2]
						"TOPLEFT", -- [3]
						12, -- [4]
						-420, -- [5]
					},
					["move"] = true,
					["lock"] = true,
					["scale"] = 1,
					["height"] = 99,
					["alpha"] = 1,
					["width"] = 232,
				},
			},
		},
	},
};
