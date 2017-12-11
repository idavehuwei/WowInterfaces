--[[

************************************************************************

ARL-Blacksmith.lua

Blacksmithing data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-27T22:30:06Z 
File revision: 2256 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, Spell ID, Skill Level, Item ID, Rarity, Specialty)

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

local initialized	= false

function addon:InitBlacksmithing(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Rough Sharpening Stone -- 2660
	self:addTradeSkill(RecipeDB,2660,1,2862,1,2018,nil,0,1,15,35,55)
	self:addTradeFlags(RecipeDB,2660,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2660,8,8)

	-- Copper Chain Belt -- 2661
	self:addTradeSkill(RecipeDB,2661,35,2851,1,2018,nil,0,35,75,95,115)
	self:addTradeFlags(RecipeDB,2661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2661,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,
	1,6299,1,10266,1,10276,1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,
	1,33609,1,33631)

	-- Copper Chain Pants -- 2662
	self:addTradeSkill(RecipeDB,2662,1,2852,1,2018,nil,0,1,50,70,90)
	self:addTradeFlags(RecipeDB,2662,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2662,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,
	1,10266,1,10276,1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,3478,1,26988,
	1,33609,1,33631)

	-- Copper Bracers -- 2663
	self:addTradeSkill(RecipeDB,2663,1,2853,1,2018,nil,0,1,20,40,60)
	self:addTradeFlags(RecipeDB,2663,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2663,8,8)

	-- Runed Copper Bracers -- 2664
	self:addTradeSkill(RecipeDB,2664,90,2854,1,2018,nil,0,90,115,127,140)
	self:addTradeFlags(RecipeDB,2664,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2664,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Coarse Sharpening Stone -- 2665
	self:addTradeSkill(RecipeDB,2665,65,2863,1,2018,nil,0,65,65,72,80)
	self:addTradeFlags(RecipeDB,2665,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2665,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,
	1,10276,1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Runed Copper Belt -- 2666
	self:addTradeSkill(RecipeDB,2666,70,2857,1,2018,nil,0,70,110,130,150)
	self:addTradeFlags(RecipeDB,2666,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2666,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,
	1,10276,1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Runed Copper Breastplate -- 2667
	self:addTradeSkill(RecipeDB,2667,80,2864,2,2018,nil,0,80,120,140,160)
	self:addTradeFlags(RecipeDB,2667,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,2667,7,2)

	-- Rough Bronze Leggings -- 2668
	self:addTradeSkill(RecipeDB,2668,105,2865,1,2018,nil,0,105,145,160,175)
	self:addTradeFlags(RecipeDB,2668,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2668,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,28694,1,27034,1,514,
	1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Rough Bronze Cuirass -- 2670
	self:addTradeSkill(RecipeDB,2670,105,2866,1,2018,nil,0,105,145,160,175)
	self:addTradeFlags(RecipeDB,2670,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2670,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Patterned Bronze Bracers -- 2672
	self:addTradeSkill(RecipeDB,2672,120,2868,1,2018,nil,0,120,150,165,180)
	self:addTradeFlags(RecipeDB,2672,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2672,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Silvered Bronze Breastplate -- 2673
	self:addTradeSkill(RecipeDB,2673,130,2869,2,2018,nil,0,130,160,175,190)
	self:addTradeFlags(RecipeDB,2673,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,2673,7,2)

	-- Heavy Sharpening Stone -- 2674
	self:addTradeSkill(RecipeDB,2674,125,2871,1,2018,nil,0,125,125,132,140)
	self:addTradeFlags(RecipeDB,2674,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2674,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Shining Silver Breastplate -- 2675
	self:addTradeSkill(RecipeDB,2675,145,2870,1,2018,nil,0,145,175,190,205)
	self:addTradeFlags(RecipeDB,2675,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,2675,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Copper Mace -- 2737
	self:addTradeSkill(RecipeDB,2737,15,2844,1,2018,nil,0,15,55,75,95)
	self:addTradeFlags(RecipeDB,2737,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,2737,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Copper Axe -- 2738
	self:addTradeSkill(RecipeDB,2738,20,2845,1,2018,nil,0,20,60,80,100)
	self:addTradeFlags(RecipeDB,2738,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,2738,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Copper Shortsword -- 2739
	self:addTradeSkill(RecipeDB,2739,25,2847,1,2018,nil,0,25,65,85,105)
	self:addTradeFlags(RecipeDB,2739,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,2739,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Bronze Mace -- 2740
	self:addTradeSkill(RecipeDB,2740,110,2848,1,2018,nil,0,110,140,155,170)
	self:addTradeFlags(RecipeDB,2740,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,2740,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Bronze Axe -- 2741
	self:addTradeSkill(RecipeDB,2741,115,2849,1,2018,nil,0,115,145,160,175)
	self:addTradeFlags(RecipeDB,2741,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,2741,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Bronze Shortsword -- 2742
	self:addTradeSkill(RecipeDB,2742,120,2850,1,2018,nil,0,120,150,165,180)
	self:addTradeFlags(RecipeDB,2742,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,2742,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Rough Weightstone -- 3115
	self:addTradeSkill(RecipeDB,3115,1,3239,1,2018,nil,0,125,125,132,140)
	self:addTradeFlags(RecipeDB,3115,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3115,8,8)

	-- Coarse Weightstone -- 3116
	self:addTradeSkill(RecipeDB,3116,65,3240,1,2018,nil,0,65,65,72,80)
	self:addTradeFlags(RecipeDB,3116,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3116,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Heavy Weightstone -- 3117
	self:addTradeSkill(RecipeDB,3117,125,3241,1,2018,nil,0,125,125,132,140)
	self:addTradeFlags(RecipeDB,3117,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3117,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Heavy Copper Broadsword -- 3292
	self:addTradeSkill(RecipeDB,3292,95,3487,1,2018,nil,0,95,135,155,175)
	self:addTradeFlags(RecipeDB,3292,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,3292,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Copper Battle Axe -- 3293
	self:addTradeSkill(RecipeDB,3293,35,3488,1,2018,nil,0,35,75,95,115)
	self:addTradeFlags(RecipeDB,3293,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,3293,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Thick War Axe -- 3294
	self:addTradeSkill(RecipeDB,3294,70,3489,1,2018,nil,0,70,110,130,150)
	self:addTradeFlags(RecipeDB,3294,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,3294,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Deadly Bronze Poniard -- 3295
	self:addTradeSkill(RecipeDB,3295,125,3490,2,2018,nil,0,125,155,170,195)
	self:addTradeFlags(RecipeDB,3295,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,72)
	self:addTradeAcquire(RecipeDB,3295,7,2)

	-- Heavy Bronze Mace -- 3296
	self:addTradeSkill(RecipeDB,3296,130,3491,1,2018,nil,0,130,160,175,190)
	self:addTradeFlags(RecipeDB,3296,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,3296,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Mighty Iron Hammer -- 3297
	self:addTradeSkill(RecipeDB,3297,145,3492,2,2018,nil,0,145,175,190,205)
	self:addTradeFlags(RecipeDB,3297,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,3297,7,2)

	-- Copper Chain Boots -- 3319
	self:addTradeSkill(RecipeDB,3319,20,3469,1,2018,nil,0,20,60,80,100)
	self:addTradeFlags(RecipeDB,3319,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3319,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,3478,1,26988,1,33609,1,33631)

	-- Rough Grinding Stone -- 3320
	self:addTradeSkill(RecipeDB,3320,25,3470,1,2018,nil,0,25,45,65,85)
	self:addTradeFlags(RecipeDB,3320,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3320,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,28694,1,27034,1,33591,1,3478,1,26988,1,33609,1,33631)

	-- Copper Chain Vest -- 3321
	self:addTradeSkill(RecipeDB,3321,35,3471,2,2018,nil,0,35,75,95,115)
	self:addTradeFlags(RecipeDB,3321,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3321,7,2)

	-- Runed Copper Gauntlets -- 3323
	self:addTradeSkill(RecipeDB,3323,40,3472,1,2018,nil,0,40,80,100,120)
	self:addTradeFlags(RecipeDB,3323,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3323,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Runed Copper Pants -- 3324
	self:addTradeSkill(RecipeDB,3324,45,3473,1,2018,nil,0,45,85,105,125)
	self:addTradeFlags(RecipeDB,3324,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3324,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Gemmed Copper Gauntlets -- 3325
	self:addTradeSkill(RecipeDB,3325,60,3474,2,2018,nil,0,60,100,120,140)
	self:addTradeFlags(RecipeDB,3325,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3325,7,2)

	-- Coarse Grinding Stone -- 3326
	self:addTradeSkill(RecipeDB,3326,75,3478,1,2018,nil,0,75,75,87,100)
	self:addTradeFlags(RecipeDB,3326,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3326,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Rough Bronze Shoulders -- 3328
	self:addTradeSkill(RecipeDB,3328,110,3480,1,2018,nil,0,115,140,155,170)
	self:addTradeFlags(RecipeDB,3328,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3328,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Silvered Bronze Shoulders -- 3330
	self:addTradeSkill(RecipeDB,3330,125,3481,2,2018,nil,0,125,155,170,185)
	self:addTradeFlags(RecipeDB,3330,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3330,7,2)

	-- Silvered Bronze Boots -- 3331
	self:addTradeSkill(RecipeDB,3331,130,3482,1,2018,nil,0,130,160,175,190)
	self:addTradeFlags(RecipeDB,3331,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3331,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Silvered Bronze Gauntlets -- 3333
	self:addTradeSkill(RecipeDB,3333,135,3483,1,2018,nil,0,135,165,180,195)
	self:addTradeFlags(RecipeDB,3333,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3333,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Green Iron Boots -- 3334
	self:addTradeSkill(RecipeDB,3334,145,3484,2,2018,nil,0,145,175,190,205)
	self:addTradeFlags(RecipeDB,3334,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3334,7,2)

	-- Green Iron Gauntlets -- 3336
	self:addTradeSkill(RecipeDB,3336,150,3485,2,2018,nil,0,150,180,195,210)
	self:addTradeFlags(RecipeDB,3336,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3336,7,2)

	-- Heavy Grinding Stone -- 3337
	self:addTradeSkill(RecipeDB,3337,125,3486,1,2018,nil,0,125,125,137,150)
	self:addTradeFlags(RecipeDB,3337,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3337,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Big Bronze Knife -- 3491
	self:addTradeSkill(RecipeDB,3491,105,3848,1,2018,nil,0,105,135,150,165)
	self:addTradeFlags(RecipeDB,3491,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,72)
	self:addTradeAcquire(RecipeDB,3491,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,
	1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Hardened Iron Shortsword -- 3492
	self:addTradeSkill(RecipeDB,3492,160,3849,1,2018,nil,0,160,185,197,210)
	self:addTradeFlags(RecipeDB,3492,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,3492,2,2843,2,5512)

	-- Jade Serpentblade -- 3493
	self:addTradeSkill(RecipeDB,3493,175,3850,2,2018,nil,0,175,200,212,225)
	self:addTradeFlags(RecipeDB,3493,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,3493,7,2)

	-- Solid Iron Maul -- 3494
	self:addTradeSkill(RecipeDB,3494,155,3851,1,2018,nil,0,155,180,192,205)
	self:addTradeFlags(RecipeDB,3494,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,3494,2,1471,2,8878,2,9179)

	-- Golden Iron Destroyer -- 3495
	self:addTradeSkill(RecipeDB,3495,170,3852,2,2018,nil,0,170,195,207,220)
	self:addTradeFlags(RecipeDB,3495,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,3495,7,2)

	-- Moonsteel Broadsword -- 3496
	self:addTradeSkill(RecipeDB,3496,180,3853,1,2018,nil,0,180,205,217,230)
	self:addTradeFlags(RecipeDB,3496,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,3496,2,2482)

	-- Frost Tiger Blade -- 3497
	self:addTradeSkill(RecipeDB,3497,200,3854,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,3497,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63,69)
	self:addTradeAcquire(RecipeDB,3497,7,2)

	-- Massive Iron Axe -- 3498
	self:addTradeSkill(RecipeDB,3498,185,3855,1,2018,nil,0,185,210,222,235)
	self:addTradeFlags(RecipeDB,3498,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,3498,2,2483)

	-- Shadow Crescent Axe -- 3500
	self:addTradeSkill(RecipeDB,3500,200,3856,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,3500,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,3500,7,2)

	-- Green Iron Bracers -- 3501
	self:addTradeSkill(RecipeDB,3501,165,3835,1,2018,nil,0,165,190,202,215)
	self:addTradeFlags(RecipeDB,3501,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3501,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Green Iron Helm -- 3502
	self:addTradeSkill(RecipeDB,3502,170,3836,1,2018,nil,0,170,195,207,220)
	self:addTradeFlags(RecipeDB,3502,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3502,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,
	1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Golden Scale Coif -- 3503
	self:addTradeSkill(RecipeDB,3503,190,3837,1,2018,nil,0,190,215,227,240)
	self:addTradeFlags(RecipeDB,3503,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3503,2,5411)

	-- Green Iron Shoulders -- 3504
	self:addTradeSkill(RecipeDB,3504,160,3840,2,2018,nil,0,160,185,197,210)
	self:addTradeFlags(RecipeDB,3504,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3504,7,2)

	-- Golden Scale Shoulders -- 3505
	self:addTradeSkill(RecipeDB,3505,175,3841,3,2018,nil,0,175,200,212,225)
	self:addTradeFlags(RecipeDB,3505,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3505,7,3)

	-- Green Iron Leggings -- 3506
	self:addTradeSkill(RecipeDB,3506,155,3842,1,2018,nil,0,155,180,192,205)
	self:addTradeFlags(RecipeDB,3506,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3506,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,
	1,16724,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Golden Scale Leggings -- 3507
	self:addTradeSkill(RecipeDB,3507,170,3843,2,2018,nil,0,170,195,207,220)
	self:addTradeFlags(RecipeDB,3507,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3507,7,2)

	-- Green Iron Hauberk -- 3508
	self:addTradeSkill(RecipeDB,3508,180,3844,1,2018,nil,0,180,205,217,230)
	self:addTradeFlags(RecipeDB,3508,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,3508,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,
	1,1241,1,16724,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Golden Scale Cuirass -- 3511
	self:addTradeSkill(RecipeDB,3511,195,3845,2,2018,nil,0,195,220,232,245)
	self:addTradeFlags(RecipeDB,3511,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3511,7,2)

	-- Polished Steel Boots -- 3513
	self:addTradeSkill(RecipeDB,3513,185,3846,2,2018,nil,0,185,210,222,235)
	self:addTradeFlags(RecipeDB,3513,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,3513,7,2)

	-- Golden Scale Boots -- 3515
	self:addTradeSkill(RecipeDB,3515,200,3847,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,3515,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,51,58)
	self:addTradeAcquire(RecipeDB,3515,7,2)

	-- Pearl-handled Dagger -- 6517
	self:addTradeSkill(RecipeDB,6517,110,5540,1,2018,nil,0,110,140,155,170)
	self:addTradeFlags(RecipeDB,6517,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,72)
	self:addTradeAcquire(RecipeDB,6517,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,
	1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Iridescent Hammer -- 6518
	self:addTradeSkill(RecipeDB,6518,140,5541,2,2018,nil,0,140,170,185,200)
	self:addTradeFlags(RecipeDB,6518,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,6518,7,2)

	-- Iron Shield Spike -- 7221
	self:addTradeSkill(RecipeDB,7221,150,6042,2,2018,nil,0,150,180,195,210)
	self:addTradeFlags(RecipeDB,7221,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7221,7,2)

	-- Iron Counterweight -- 7222
	self:addTradeSkill(RecipeDB,7222,165,6043,2,2018,nil,0,165,190,202,215)
	self:addTradeFlags(RecipeDB,7222,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7222,7,2)

	-- Golden Scale Bracers -- 7223
	self:addTradeSkill(RecipeDB,7223,185,6040,1,2018,nil,0,185,210,222,235)
	self:addTradeFlags(RecipeDB,7223,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,7223,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,
	1,514,1,1241,1,16724,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Steel Weapon Chain -- 7224
	self:addTradeSkill(RecipeDB,7224,190,6041,2,2018,nil,0,190,215,227,240)
	self:addTradeFlags(RecipeDB,7224,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7224,7,2)

	-- Heavy Copper Maul -- 7408
	self:addTradeSkill(RecipeDB,7408,65,6214,1,2018,nil,0,65,105,125,145)
	self:addTradeFlags(RecipeDB,7408,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,7408,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Rough Bronze Boots -- 7817
	self:addTradeSkill(RecipeDB,7817,95,6350,1,2018,nil,0,95,125,140,155)
	self:addTradeFlags(RecipeDB,7817,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,7817,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,1,27034,
	1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Silver Rod -- 7818
	self:addTradeSkill(RecipeDB,7818,100,6338,1,2018,nil,0,100,105,107,110)
	self:addTradeFlags(RecipeDB,7818,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7818,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,28694,1,27034,1,514,
	1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Ironforge Breastplate -- 8367
	self:addTradeSkill(RecipeDB,8367,100,6731,2,2018,nil,0,100,140,160,180)
	self:addTradeFlags(RecipeDB,8367,1,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,8367,4,1618)

	-- Iron Buckle -- 8768
	self:addTradeSkill(RecipeDB,8768,150,7071,1,2018,nil,0,150,150,152,155)
	self:addTradeFlags(RecipeDB,8768,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8768,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Copper Dagger -- 8880
	self:addTradeSkill(RecipeDB,8880,30,7166,1,2018,nil,0,30,70,90,110)
	self:addTradeFlags(RecipeDB,8880,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,72)
	self:addTradeAcquire(RecipeDB,8880,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,
	1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Barbaric Iron Shoulders -- 9811
	self:addTradeSkill(RecipeDB,9811,160,7913,2,2018,nil,0,160,185,197,210)
	self:addTradeFlags(RecipeDB,9811,2,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9811,4,2752)

	-- Barbaric Iron Breastplate -- 9813
	self:addTradeSkill(RecipeDB,9813,160,7914,2,2018,nil,0,160,185,197,210)
	self:addTradeFlags(RecipeDB,9813,2,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9813,4,2751)

	-- Barbaric Iron Helm -- 9814
	self:addTradeSkill(RecipeDB,9814,175,7915,2,2018,nil,0,175,200,212,225)
	self:addTradeFlags(RecipeDB,9814,2,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9814,4,2754)

	-- Barbaric Iron Boots -- 9818
	self:addTradeSkill(RecipeDB,9818,180,7916,2,2018,nil,0,180,205,217,230)
	self:addTradeFlags(RecipeDB,9818,2,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9818,4,2753)

	-- Barbaric Iron Gloves -- 9820
	self:addTradeSkill(RecipeDB,9820,185,7917,2,2018,nil,0,185,210,222,235)
	self:addTradeFlags(RecipeDB,9820,2,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9820,4,2755)

	-- Steel Breastplate -- 9916
	self:addTradeSkill(RecipeDB,9916,200,7963,1,2018,nil,0,200,225,237,250)
	self:addTradeFlags(RecipeDB,9916,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,9916,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,1,2998,
	1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Solid Sharpening Stone -- 9918
	self:addTradeSkill(RecipeDB,9918,200,7964,1,2018,nil,0,200,200,205,210)
	self:addTradeFlags(RecipeDB,9918,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9918,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,1,2998,
	1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Solid Grinding Stone -- 9920
	self:addTradeSkill(RecipeDB,9920,200,7966,1,2018,nil,0,200,200,205,210)
	self:addTradeFlags(RecipeDB,9920,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9920,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,1,2998,
	1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Solid Weightstone -- 9921
	self:addTradeSkill(RecipeDB,9921,200,7965,1,2018,nil,0,200,200,205,210)
	self:addTradeFlags(RecipeDB,9921,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9921,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Heavy Mithril Shoulder -- 9926
	self:addTradeSkill(RecipeDB,9926,205,7918,1,2018,nil,0,205,225,235,245)
	self:addTradeFlags(RecipeDB,9926,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9926,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Heavy Mithril Gauntlet -- 9928
	self:addTradeSkill(RecipeDB,9928,205,7919,1,2018,nil,0,205,225,235,245)
	self:addTradeFlags(RecipeDB,9928,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9928,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Mithril Scale Pants -- 9931
	self:addTradeSkill(RecipeDB,9931,210,7920,1,2018,nil,0,210,230,240,250)
	self:addTradeFlags(RecipeDB,9931,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,58)
	self:addTradeAcquire(RecipeDB,9931,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Heavy Mithril Pants -- 9933
	self:addTradeSkill(RecipeDB,9933,210,7921,2,2018,nil,0,210,230,240,250)
	self:addTradeFlags(RecipeDB,9933,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,9933,7,2)

	-- Steel Plate Helm -- 9935
	self:addTradeSkill(RecipeDB,9935,215,7922,1,2018,nil,0,215,235,245,255)
	self:addTradeFlags(RecipeDB,9935,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9935,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Mithril Scale Bracers -- 9937
	self:addTradeSkill(RecipeDB,9937,215,7924,1,2018,nil,0,215,235,245,255)
	self:addTradeFlags(RecipeDB,9937,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9937,2,8161,2,8176)

	-- Mithril Shield Spike -- 9939
	self:addTradeSkill(RecipeDB,9939,215,7967,3,2018,nil,0,215,235,245,255)
	self:addTradeFlags(RecipeDB,9939,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,9939,7,3)

	-- Ornate Mithril Pants -- 9945
	self:addTradeSkill(RecipeDB,9945,220,7926,2,2018,nil,0,220,240,250,260)
	self:addTradeFlags(RecipeDB,9945,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,9945,4,2761)

	-- Ornate Mithril Gloves -- 9950
	self:addTradeSkill(RecipeDB,9950,220,7927,2,2018,nil,0,220,240,250,260)
	self:addTradeFlags(RecipeDB,9950,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9950,4,2762)

	-- Ornate Mithril Shoulder -- 9952
	self:addTradeSkill(RecipeDB,9952,225,7928,2,2018,nil,0,225,245,255,265)
	self:addTradeFlags(RecipeDB,9952,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,9952,4,2763)

	-- Truesilver Gauntlets -- 9954
	self:addTradeSkill(RecipeDB,9954,225,7938,1,2018,nil,0,225,245,255,265)
	self:addTradeFlags(RecipeDB,9954,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9954,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Heavy Mithril Breastplate -- 9959
	self:addTradeSkill(RecipeDB,9959,230,7930,1,2018,nil,0,230,250,260,270)
	self:addTradeFlags(RecipeDB,9959,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9959,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,
	1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Mithril Coif -- 9961
	self:addTradeSkill(RecipeDB,9961,230,7931,1,2018,nil,0,230,250,260,270)
	self:addTradeFlags(RecipeDB,9961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,9961,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,
	1,514,1,1241,1,16724,1,3355,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Mithril Spurs -- 9964
	self:addTradeSkill(RecipeDB,9964,235,7969,2,2018,nil,0,235,255,265,275)
	self:addTradeFlags(RecipeDB,9964,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,9964,7,2)

	-- Mithril Scale Shoulders -- 9966
	self:addTradeSkill(RecipeDB,9966,235,7932,3,2018,nil,0,235,255,265,275)
	self:addTradeFlags(RecipeDB,9966,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,9966,7, 3, 8, 33)

	-- Heavy Mithril Boots -- 9968
	self:addTradeSkill(RecipeDB,9968,235,7933,1,2018,nil,0,235,255,265,275)
	self:addTradeFlags(RecipeDB,9968,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9968,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,
	1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,1,10276,1,10277,1,10278,1,15400,
	1,16583,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Heavy Mithril Helm -- 9970
	self:addTradeSkill(RecipeDB,9970,245,7934,2,2018,nil,0,245,255,265,275)
	self:addTradeFlags(RecipeDB,9970,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,9970,7,2)

	-- Ornate Mithril Breastplate -- 9972
	self:addTradeSkill(RecipeDB,9972,240,7935,2,2018,nil,0,260,260,270,280)
	self:addTradeFlags(RecipeDB,9972,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,9972,4,2773)

	-- Truesilver Breastplate -- 9974
	self:addTradeSkill(RecipeDB,9974,245,7939,1,2018,nil,0,265,265,275,285)
	self:addTradeFlags(RecipeDB,9974,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9974,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Ornate Mithril Boots -- 9979
	self:addTradeSkill(RecipeDB,9979,245,7936,2,2018,nil,0,265,265,275,285)
	self:addTradeFlags(RecipeDB,9979,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,9979,4,2772)

	-- Ornate Mithril Helm -- 9980
	self:addTradeSkill(RecipeDB,9980,245,7937,2,2018,nil,0,265,265,275,285)
	self:addTradeFlags(RecipeDB,9980,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,9980,4,2771)

	-- Copper Claymore -- 9983
	self:addTradeSkill(RecipeDB,9983,30,7955,1,2018,nil,0,30,70,90,110)
	self:addTradeFlags(RecipeDB,9983,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,9983,1,514,1,957,1,1241,1,1383,1,2836,1,2998,1,3136,1,3174,1,3355,1,3478,1,3557,1,4258,1,4596,1,4605,1,5511,1,6299,1,10266,
	1,10276,1,10277,1,10278,1,15400,1,16583,1,16669,1,16671,1,16724,1,16740,1,16823,1,17245,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Bronze Warhammer -- 9985
	self:addTradeSkill(RecipeDB,9985,125,7956,1,2018,nil,0,125,155,170,185)
	self:addTradeFlags(RecipeDB,9985,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,9985,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Bronze Greatsword -- 9986
	self:addTradeSkill(RecipeDB,9986,130,7957,1,2018,nil,0,130,160,175,190)
	self:addTradeFlags(RecipeDB,9986,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,9986,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Bronze Battle Axe -- 9987
	self:addTradeSkill(RecipeDB,9987,135,7958,1,2018,nil,0,135,165,180,195)
	self:addTradeFlags(RecipeDB,9987,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,9987,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,1,19341,1,28694,
	1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Heavy Mithril Axe -- 9993
	self:addTradeSkill(RecipeDB,9993,210,7941,1,2018,nil,0,210,235,247,260)
	self:addTradeFlags(RecipeDB,9993,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,68)
	self:addTradeAcquire(RecipeDB,9993,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,1,2998,1,3478,
	1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Blue Glittering Axe -- 9995
	self:addTradeSkill(RecipeDB,9995,220,7942,2,2018,nil,0,220,245,257,270)
	self:addTradeFlags(RecipeDB,9995,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,9995,7,2)

	-- Wicked Mithril Blade -- 9997
	self:addTradeSkill(RecipeDB,9997,225,7943,2,2018,nil,0,225,250,262,275)
	self:addTradeFlags(RecipeDB,9997,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,9997,7,2)

	-- Big Black Mace -- 10001
	self:addTradeSkill(RecipeDB,10001,230,7945,1,2018,nil,0,230,255,267,280)
	self:addTradeFlags(RecipeDB,10001,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,10001,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,1,2998,
	1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- The Shatterer -- 10003
	self:addTradeSkill(RecipeDB,10003,235,7954,1,2018,nil,0,235,260,272,285)
	self:addTradeFlags(RecipeDB,10003,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,70)
	self:addTradeAcquire(RecipeDB,10003,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Dazzling Mithril Rapier -- 10005
	self:addTradeSkill(RecipeDB,10005,240,7944,2,2018,nil,0,240,265,277,290)
	self:addTradeFlags(RecipeDB,10005,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,10005,7,2)

	-- Phantom Blade -- 10007
	self:addTradeSkill(RecipeDB,10007,245,7961,1,2018,nil,0,245,270,282,295)
	self:addTradeFlags(RecipeDB,10007,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,10007,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Runed Mithril Hammer -- 10009
	self:addTradeSkill(RecipeDB,10009,245,7946,3,2018,nil,0,245,270,282,295)
	self:addTradeFlags(RecipeDB,10009,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,10009,7, 3, 8, 33)

	-- Blight -- 10011
	self:addTradeSkill(RecipeDB,10011,250,7959,1,2018,nil,0,250,275,287,300)
	self:addTradeFlags(RecipeDB,10011,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,71)
	self:addTradeAcquire(RecipeDB,10011,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Ebon Shiv -- 10013
	self:addTradeSkill(RecipeDB,10013,255,7947,1,2018,nil,0,255,280,292,305)
	self:addTradeFlags(RecipeDB,10013,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,72)
	self:addTradeAcquire(RecipeDB,10013,2,11278)

	-- Truesilver Champion -- 10015
	self:addTradeSkill(RecipeDB,10015,260,7960,1,2018,nil,0,260,285,297,310)
	self:addTradeFlags(RecipeDB,10015,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,69)
	self:addTradeAcquire(RecipeDB,10015,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Inlaid Mithril Cylinder -- 11454
	self:addTradeSkill(RecipeDB,11454,200,9060,1,2018,nil,0,200,225,237,250)
	self:addTradeFlags(RecipeDB,11454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,11454,8,9)

	-- Golden Scale Gauntlets -- 11643
	self:addTradeSkill(RecipeDB,11643,205,9366,2,2018,nil,0,205,225,235,245)
	self:addTradeFlags(RecipeDB,11643,1,8,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,11643,4,2758)

	-- Silvered Bronze Leggings -- 12259
	self:addTradeSkill(RecipeDB,12259,155,10423,2,2018,nil,0,155,180,192,205)
	self:addTradeFlags(RecipeDB,12259,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,12259,7,2)

	-- Rough Copper Vest -- 12260
	self:addTradeSkill(RecipeDB,12260,1,10421,1,2018,nil,0,1,15,35,55)
	self:addTradeFlags(RecipeDB,12260,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,12260,8,8)

	-- Golden Rod -- 14379
	self:addTradeSkill(RecipeDB,14379,150,11128,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,14379,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,14379,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,
	1,19341,1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Truesilver Rod -- 14380
	self:addTradeSkill(RecipeDB,14380,200,11144,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,14380,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,14380,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,
	1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Dark Iron Pulverizer -- 15292
	self:addTradeSkill(RecipeDB,15292,265,11608,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,15292,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,15292,3,9028)

	-- Dark Iron Sunderer -- 15294
	self:addTradeSkill(RecipeDB,15294,275,11607,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,15294,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,15294,3,9554,3,10043)

	-- Dark Iron Plate -- 15296
	self:addTradeSkill(RecipeDB,15296,285,11604,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,15296,1,2,5,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,15296,3,9543)

	-- Glinting Steel Dagger -- 15972
	self:addTradeSkill(RecipeDB,15972,180,12259,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,15972,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,72)
	self:addTradeAcquire(RecipeDB,15972,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,
	1,16724,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Searing Golden Blade -- 15973
	self:addTradeSkill(RecipeDB,15973,190,12260,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,15973,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63,72)
	self:addTradeAcquire(RecipeDB,15973,7,2)

	-- Dense Grinding Stone -- 16639
	self:addTradeSkill(RecipeDB,16639,250,12644,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,16639,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,16639,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Dense Weightstone -- 16640
	self:addTradeSkill(RecipeDB,16640,250,12643,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,16640,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,16640,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Dense Sharpening Stone -- 16641
	self:addTradeSkill(RecipeDB,16641,250,12404,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,16641,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,16641,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Thorium Armor -- 16642
	self:addTradeSkill(RecipeDB,16642,250,12405,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16642,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16642,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Thorium Belt -- 16643
	self:addTradeSkill(RecipeDB,16643,250,12406,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16643,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16643,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Thorium Bracers -- 16644
	self:addTradeSkill(RecipeDB,16644,255,12408,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16644,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16644,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Radiant Belt -- 16645
	self:addTradeSkill(RecipeDB,16645,260,12416,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16645,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16645,7,2,8,33)

	-- Imperial Plate Shoulders -- 16646
	self:addTradeSkill(RecipeDB,16646,265,12428,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16646,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16646,4,7659)

	-- Imperial Plate Belt -- 16647
	self:addTradeSkill(RecipeDB,16647,265,12424,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16647,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16647,4,7653)

	-- Radiant Breastplate -- 16648
	self:addTradeSkill(RecipeDB,16648,270,12415,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16648,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16648,7,2)

	-- Imperial Plate Bracers -- 16649
	self:addTradeSkill(RecipeDB,16649,270,12425,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16649,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16649,4,7655)

	-- Wildthorn Mail -- 16650
	self:addTradeSkill(RecipeDB,16650,270,12624,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16650,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16650,7,2)

	-- Thorium Shield Spike -- 16651
	self:addTradeSkill(RecipeDB,16651,275,12645,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16651,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,16651,7,2,8,33)

	-- Thorium Boots -- 16652
	self:addTradeSkill(RecipeDB,16652,280,12409,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16652,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16652,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Thorium Helm -- 16653
	self:addTradeSkill(RecipeDB,16653,280,12410,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16653,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16653,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Radiant Gloves -- 16654
	self:addTradeSkill(RecipeDB,16654,285,12418,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16654,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,51,58)
	self:addTradeAcquire(RecipeDB,16654,7,2)

	-- Fiery Plate Gauntlets -- 16655
	self:addTradeSkill(RecipeDB,16655,290,12631,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16655,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16655,4,5124)

	-- Radiant Boots -- 16656
	self:addTradeSkill(RecipeDB,16656,290,12419,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16656,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16656,7,2)

	-- Imperial Plate Boots -- 16657
	self:addTradeSkill(RecipeDB,16657,295,12426,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16657,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16657,4,7654)

	-- Imperial Plate Helm -- 16658
	self:addTradeSkill(RecipeDB,16658,295,12427,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16658,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16658,4,7657)

	-- Radiant Circlet -- 16659
	self:addTradeSkill(RecipeDB,16659,295,12417,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16659,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16659,7,2)

	-- Dawnbringer Shoulders -- 16660
	self:addTradeSkill(RecipeDB,16660,290,12625,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16660,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16660,7,2)

	-- Storm Gauntlets -- 16661
	self:addTradeSkill(RecipeDB,16661,295,12632,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16661,1,2,4,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16661,7,2,2,11278)

	-- Thorium Leggings -- 16662
	self:addTradeSkill(RecipeDB,16662,300,12414,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16662,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16662,7,2,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,33609,1,33631,1,3174)

	-- Imperial Plate Chest -- 16663
	self:addTradeSkill(RecipeDB,16663,300,12422,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16663,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16663,4,7656)

	-- Runic Plate Shoulders -- 16664
	self:addTradeSkill(RecipeDB,16664,300,12610,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16664,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16664,3,4366)

	-- Runic Plate Boots -- 16665
	self:addTradeSkill(RecipeDB,16665,300,12611,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16665,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16665,3,1836)

	-- Demon Forged Breastplate -- 16667
	self:addTradeSkill(RecipeDB,16667,285,12628,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16667,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16667,4,5127)

	-- Whitesoul Helm -- 16724
	self:addTradeSkill(RecipeDB,16724,300,12633,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16724,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16724,7,2)

	-- Radiant Leggings -- 16725
	self:addTradeSkill(RecipeDB,16725,300,12420,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16725,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16725,7,2)

	-- Runic Plate Helm -- 16726
	self:addTradeSkill(RecipeDB,16726,300,12612,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16726,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16726,3,4364)

	-- Helm of the Great Chief -- 16728
	self:addTradeSkill(RecipeDB,16728,300,12636,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16728,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,16728,7,2)

	-- Lionheart Helm -- 16729
	self:addTradeSkill(RecipeDB,16729,300,12640,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,16729,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,16729,7,2)

	-- Imperial Plate Leggings -- 16730
	self:addTradeSkill(RecipeDB,16730,300,12429,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16730,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16730,4,7658)

	-- Runic Breastplate -- 16731
	self:addTradeSkill(RecipeDB,16731,300,12613,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16731,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16731,3,4368,3,16072)

	-- Runic Plate Leggings -- 16732
	self:addTradeSkill(RecipeDB,16732,300,12614,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16732,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,16732,3,1885)

	-- Stronghold Gauntlets -- 16741
	self:addTradeSkill(RecipeDB,16741,300,12639,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,16741,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,16741,7,2)

	-- Enchanted Thorium Helm -- 16742
	self:addTradeSkill(RecipeDB,16742,300,12620,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16742,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,16742,4,7651)

	-- Enchanted Thorium Leggings -- 16744
	self:addTradeSkill(RecipeDB,16744,300,12619,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16744,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,16744,4,7650)

	-- Enchanted Thorium Breastplate -- 16745
	self:addTradeSkill(RecipeDB,16745,300,12618,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16745,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,16745,4,7649)

	-- Invulnerable Mail -- 16746
	self:addTradeSkill(RecipeDB,16746,300,12641,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,16746,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,58)
	self:addTradeAcquire(RecipeDB,16746,7,2)

	-- Ornate Thorium Handaxe -- 16969
	self:addTradeSkill(RecipeDB,16969,275,12773,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16969,1,2,3,4,21,22,23,24,25,26,27,28,29,30,37,41,68)
	self:addTradeAcquire(RecipeDB,16969,2,11278,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Dawn's Edge -- 16970
	self:addTradeSkill(RecipeDB,16970,275,12774,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16970,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,63,68)
	self:addTradeAcquire(RecipeDB,16970,4,5306)

	-- Huge Thorium Battleaxe -- 16971
	self:addTradeSkill(RecipeDB,16971,280,12775,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,16971,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,63,68)
	self:addTradeAcquire(RecipeDB,16971,2,11278,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,2836,1,2998,1,3478,1,3136,1,4596,1,3174,1,33609,1,33631)

	-- Enchanted Battlehammer -- 16973
	self:addTradeSkill(RecipeDB,16973,280,12776,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16973,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,52,63,70)
	self:addTradeAcquire(RecipeDB,16973,4,5305)

	-- Blazing Rapier -- 16978
	self:addTradeSkill(RecipeDB,16978,280,12777,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16978,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,16978,4,5307)

	-- Serenity -- 16983
	self:addTradeSkill(RecipeDB,16983,285,12781,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16983,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,16983,8,31)

	-- Volcanic Hammer -- 16984
	self:addTradeSkill(RecipeDB,16984,290,12792,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,16984,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,16984,3,10119)

	-- Corruption -- 16985
	self:addTradeSkill(RecipeDB,16985,290,12782,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,16985,1,2,5,21,22,23,24,25,26,27,28,29,30,37,41,69)
	self:addTradeAcquire(RecipeDB,16985,8,31)

	-- Hammer of the Titans -- 16988
	self:addTradeSkill(RecipeDB,16988,300,12796,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16988,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,16988,3,10438)

	-- Arcanite Champion -- 16990
	self:addTradeSkill(RecipeDB,16990,300,12790,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16990,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,16990,3,10899)

	-- Annihilator -- 16991
	self:addTradeSkill(RecipeDB,16991,300,12798,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16991,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,16991,3,9736)

	-- Frostguard -- 16992
	self:addTradeSkill(RecipeDB,16992,300,12797,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16992,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,16992,3,1844)

	-- Masterwork Stormhammer -- 16993
	self:addTradeSkill(RecipeDB,16993,300,12794,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16993,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,16993,3,10899)

	-- Arcanite Reaper -- 16994
	self:addTradeSkill(RecipeDB,16994,300,12784,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16994,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63,68)
	self:addTradeAcquire(RecipeDB,16994,3,9596)

	-- Heartseeker -- 16995
	self:addTradeSkill(RecipeDB,16995,300,12783,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,16995,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63,72)
	self:addTradeAcquire(RecipeDB,16995,3,10997)

	-- Silver Skeleton Key -- 19666
	self:addTradeSkill(RecipeDB,19666,100,15869,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,19666,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19666,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,
	1,19341,1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Golden Skeleton Key -- 19667
	self:addTradeSkill(RecipeDB,19667,150,15870,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,19667,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19667,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,1,16823,
	1,19341,1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Truesilver Skeleton Key -- 19668
	self:addTradeSkill(RecipeDB,19668,200,15871,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,19668,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19668,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,1,16724,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Arcanite Skeleton Key -- 19669
	self:addTradeSkill(RecipeDB,19669,275,15872,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,19669,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19669,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Arcanite Rod -- 20201
	self:addTradeSkill(RecipeDB,20201,275,16206,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,20201,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20201,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,1,3355,1,33591,
	1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Fiery Chain Girdle -- 20872
	self:addTradeSkill(RecipeDB,20872,295,16989,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20872,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,98)
	self:addTradeAcquire(RecipeDB,20872,6,59,2,12944)

	-- Fiery Chain Shoulders -- 20873
	self:addTradeSkill(RecipeDB,20873,300,16988,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20873,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,98)
	self:addTradeAcquire(RecipeDB,20873,6,59,3,12944)

	-- Dark Iron Bracers -- 20874
	self:addTradeSkill(RecipeDB,20874,295,17014,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20874,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,98)
	self:addTradeAcquire(RecipeDB,20874,6,59,1,12944)

	-- Dark Iron Leggings -- 20876
	self:addTradeSkill(RecipeDB,20876,300,17013,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20876,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,98)
	self:addTradeAcquire(RecipeDB,20876,6,59,3,12944)

	-- Dark Iron Reaver -- 20890
	self:addTradeSkill(RecipeDB,20890,300,17015,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20890,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,69,98)
	self:addTradeAcquire(RecipeDB,20890,6,59,2,12944)

	-- Dark Iron Destroyer -- 20897
	self:addTradeSkill(RecipeDB,20897,300,17016,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,20897,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,68,98)
	self:addTradeAcquire(RecipeDB,20897,6,59,2,12944)

	-- Sulfuron Hammer -- 21161
	self:addTradeSkill(RecipeDB,21161,300,17193,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,21161,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,21161,4,7604)

	-- Edge of Winter -- 21913
	self:addTradeSkill(RecipeDB,21913,190,17704,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,21913,1,2,7,11,21,22,23,24,25,26,27,28,29,30,36,40,68)
	self:addTradeAcquire(RecipeDB,21913,5,1)

	-- Elemental Sharpening Stone -- 22757
	self:addTradeSkill(RecipeDB,22757,300,18262,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,22757,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22757,8,26)

	-- Heavy Timbermaw Belt -- 23628
	self:addTradeSkill(RecipeDB,23628,290,19043,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23628,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,99)
	self:addTradeAcquire(RecipeDB,23628,6,576,2,11557)

	-- Heavy Timbermaw Boots -- 23629
	self:addTradeSkill(RecipeDB,23629,300,19048,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23629,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,99)
	self:addTradeAcquire(RecipeDB,23629,6,576,3,11557)

	-- Girdle of the Dawn -- 23632
	self:addTradeSkill(RecipeDB,23632,290,19051,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23632,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,96)
	self:addTradeAcquire(RecipeDB,23632,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Gloves of the Dawn -- 23633
	self:addTradeSkill(RecipeDB,23633,300,19057,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23633,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,96)
	self:addTradeAcquire(RecipeDB,23633,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Dark Iron Helm -- 23636
	self:addTradeSkill(RecipeDB,23636,300,19148,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23636,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,98)
	self:addTradeAcquire(RecipeDB,23636,6,59,2,12944)

	-- Dark Iron Gauntlets -- 23637
	self:addTradeSkill(RecipeDB,23637,300,19164,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23637,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,98)
	self:addTradeAcquire(RecipeDB,23637,6,59,3,12944)

	-- Black Amnesty -- 23638
	self:addTradeSkill(RecipeDB,23638,300,19166,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23638,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,72,98)
	self:addTradeAcquire(RecipeDB,23638,6,59,3,12944)

	-- Blackfury -- 23639
	self:addTradeSkill(RecipeDB,23639,300,19167,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23639,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63,71,98)
	self:addTradeAcquire(RecipeDB,23639,6,59,3,12944)

	-- Ebon Hand -- 23650
	self:addTradeSkill(RecipeDB,23650,300,19170,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23650,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,70,98)
	self:addTradeAcquire(RecipeDB,23650,6,59,2,12944)

	-- Blackguard -- 23652
	self:addTradeSkill(RecipeDB,23652,300,19168,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23652,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,63,69,98)
	self:addTradeAcquire(RecipeDB,23652,6,59,2,12944)

	-- Nightfall -- 23653
	self:addTradeSkill(RecipeDB,23653,300,19169,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,23653,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,68,98)
	self:addTradeAcquire(RecipeDB,23653,6,59,4,12944)

	-- Bloodsoul Breastplate -- 24136
	self:addTradeSkill(RecipeDB,24136,300,19690,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24136,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,100)
	self:addTradeAcquire(RecipeDB,24136,6,270,3,14921)

	-- Bloodsoul Shoulders -- 24137
	self:addTradeSkill(RecipeDB,24137,300,19691,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24137,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,100)
	self:addTradeAcquire(RecipeDB,24137,6,270,2,14921)

	-- Bloodsoul Gauntlets -- 24138
	self:addTradeSkill(RecipeDB,24138,300,19692,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24138,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,100)
	self:addTradeAcquire(RecipeDB,24138,6,270,1,14921)

	-- Darksoul Breastplate -- 24139
	self:addTradeSkill(RecipeDB,24139,300,19693,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24139,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,100)
	self:addTradeAcquire(RecipeDB,24139,6,270,3,14921)

	-- Darksoul Leggings -- 24140
	self:addTradeSkill(RecipeDB,24140,300,19694,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24140,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,100)
	self:addTradeAcquire(RecipeDB,24140,6,270,2,14921)

	-- Darksoul Shoulders -- 24141
	self:addTradeSkill(RecipeDB,24141,300,19695,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24141,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,100)
	self:addTradeAcquire(RecipeDB,24141,6,270,1,14921)

	-- Dark Iron Boots -- 24399
	self:addTradeSkill(RecipeDB,24399,300,20039,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,24399,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,98)
	self:addTradeAcquire(RecipeDB,24399,6,59,4,12944)

	-- Darkrune Gauntlets -- 24912
	self:addTradeSkill(RecipeDB,24912,300,20549,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,24912,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,24912,4,8323)

	-- Darkrune Helm -- 24913
	self:addTradeSkill(RecipeDB,24913,300,20551,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,24913,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,24913,4,8323)

	-- Darkrune Breastplate -- 24914
	self:addTradeSkill(RecipeDB,24914,300,20550,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,24914,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,24914,4,8323)

	-- Heavy Obsidian Belt -- 27585
	self:addTradeSkill(RecipeDB,27585,300,22197,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,27585,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,97)
	self:addTradeAcquire(RecipeDB,27585,6,609,1,15176)

	-- Jagged Obsidian Shield -- 27586
	self:addTradeSkill(RecipeDB,27586,300,22198,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,27586,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,64,97)
	self:addTradeAcquire(RecipeDB,27586,6,609,3,15471)

	-- Thick Obsidian Breastplate -- 27587
	self:addTradeSkill(RecipeDB,27587,300,22196,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,27587,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,27587,3,15263)

	-- Light Obsidian Belt -- 27588
	self:addTradeSkill(RecipeDB,27588,300,22195,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,27588,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,27588,6,609,2,15176)

	-- Black Grasp of the Destroyer -- 27589
	self:addTradeSkill(RecipeDB,27589,300,22194,3,2018,nil,0)
	self:addTradeFlags(RecipeDB,27589,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,27589,3,15340)

	-- Obsidian Mail Tunic -- 27590
	self:addTradeSkill(RecipeDB,27590,300,22191,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,27590,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,27590,6,609,4,15471)

	-- Titanic Leggings -- 27829
	self:addTradeSkill(RecipeDB,27829,300,22385,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,27829,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,27829,7,2)

	-- Persuader -- 27830
	self:addTradeSkill(RecipeDB,27830,300,22384,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,27830,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,70)
	self:addTradeAcquire(RecipeDB,27830,7,2)

	-- Sageblade -- 27832
	self:addTradeSkill(RecipeDB,27832,300,22383,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,27832,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,54,63,69)
	self:addTradeAcquire(RecipeDB,27832,7,2)

	-- Icebane Breastplate -- 28242
	self:addTradeSkill(RecipeDB,28242,300,22669,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,28242,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,28242,6,529,4,16365,8,41)

	-- Icebane Gauntlets -- 28243
	self:addTradeSkill(RecipeDB,28243,300,22670,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,28243,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,28243,6,529,3,16365,8,41)

	-- Icebane Bracers -- 28244
	self:addTradeSkill(RecipeDB,28244,300,22671,4,2018,nil,0)
	self:addTradeFlags(RecipeDB,28244,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,28244,6,529,3,16365,8,41)

	-- Ironvine Breastplate -- 28461
	self:addTradeSkill(RecipeDB,28461,300,22762,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,28461,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,97)
	self:addTradeAcquire(RecipeDB,28461,6,609,3,15176)

	-- Ironvine Gloves -- 28462
	self:addTradeSkill(RecipeDB,28462,300,22763,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,28462,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,97)
	self:addTradeAcquire(RecipeDB,28462,6,609,2,15176)

	-- Ironvine Belt -- 28463
	self:addTradeSkill(RecipeDB,28463,300,22764,1,2018,nil,0)
	self:addTradeFlags(RecipeDB,28463,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,97)
	self:addTradeAcquire(RecipeDB,28463,6,609,1,15176)

	-- Fel Iron Plate Gloves -- 29545
	self:addTradeSkill(RecipeDB,29545,300,23482,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29545,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29545,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Plate Belt -- 29547
	self:addTradeSkill(RecipeDB,29547,305,23484,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29547,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29547,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Plate Boots -- 29548
	self:addTradeSkill(RecipeDB,29548,315,23487,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29548,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29548,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Plate Pants -- 29549
	self:addTradeSkill(RecipeDB,29549,315,23488,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29549,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29549,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Breastplate -- 29550
	self:addTradeSkill(RecipeDB,29550,325,23489,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29550,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29550,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Chain Coif -- 29551
	self:addTradeSkill(RecipeDB,29551,300,23493,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29551,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Chain Gloves -- 29552
	self:addTradeSkill(RecipeDB,29552,310,23491,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29552,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Chain Bracers -- 29553
	self:addTradeSkill(RecipeDB,29553,315,23494,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29553,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Chain Tunic -- 29556
	self:addTradeSkill(RecipeDB,29556,320,23490,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29556,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Hatchet -- 29557
	self:addTradeSkill(RecipeDB,29557,310,23497,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29557,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,68)
	self:addTradeAcquire(RecipeDB,29557,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Hammer -- 29558
	self:addTradeSkill(RecipeDB,29558,315,23498,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29558,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,29558,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Fel Iron Greatsword -- 29565
	self:addTradeSkill(RecipeDB,29565,320,23499,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29565,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,69)
	self:addTradeAcquire(RecipeDB,29565,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Adamantite Maul -- 29566
	self:addTradeSkill(RecipeDB,29566,325,23502,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29566,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,70)
	self:addTradeAcquire(RecipeDB,29566,2,16670,2,16713,2,19662)

	-- Adamantite Cleaver -- 29568
	self:addTradeSkill(RecipeDB,29568,330,23503,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29568,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,68)
	self:addTradeAcquire(RecipeDB,29568,2,16670,2,16713,2,19662)

	-- Adamantite Dagger -- 29569
	self:addTradeSkill(RecipeDB,29569,330,23504,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29569,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63,72)
	self:addTradeAcquire(RecipeDB,29569,2,16670,2,16713,2,19662)

	-- Adamantite Rapier -- 29571
	self:addTradeSkill(RecipeDB,29571,335,23505,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29571,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,52,63,69)
	self:addTradeAcquire(RecipeDB,29571,2,16670,2,16713,2,19662)

	-- Adamantite Plate Bracers -- 29603
	self:addTradeSkill(RecipeDB,29603,335,23506,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29603,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29603,2,19342,2,19694)

	-- Adamantite Plate Gloves -- 29605
	self:addTradeSkill(RecipeDB,29605,335,23508,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29605,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29605,2,19342,2,19694)

	-- Adamantite Breastplate -- 29606
	self:addTradeSkill(RecipeDB,29606,340,23507,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29606,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29606,2,19342,2,19694)

	-- Enchanted Adamantite Belt -- 29608
	self:addTradeSkill(RecipeDB,29608,355,23510,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29608,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,110)
	self:addTradeAcquire(RecipeDB,29608,6,934,1,19331)

	-- Enchanted Adamantite Breastplate -- 29610
	self:addTradeSkill(RecipeDB,29610,360,23509,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29610,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,110)
	self:addTradeAcquire(RecipeDB,29610,6,934,3,19331)

	-- Enchanted Adamantite Boots -- 29611
	self:addTradeSkill(RecipeDB,29611,355,23511,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29611,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,110)
	self:addTradeAcquire(RecipeDB,29611,6,934,2,19331)

	-- Enchanted Adamantite Leggings -- 29613
	self:addTradeSkill(RecipeDB,29613,365,23512,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29613,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,110)
	self:addTradeAcquire(RecipeDB,29613,6,934,4,19331)

	-- Flamebane Bracers -- 29614
	self:addTradeSkill(RecipeDB,29614,350,23515,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29614,1,4,21,22,23,24,25,26,27,28,29,30,36,41,59,101)
	self:addTradeAcquire(RecipeDB,29614,6,932,1,19321)

	-- Flamebane Helm -- 29615
	self:addTradeSkill(RecipeDB,29615,355,23516,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29615,1,4,21,22,23,24,25,26,27,28,29,30,36,41,59,101)
	self:addTradeAcquire(RecipeDB,29615,6,932,4,19321)

	-- Flamebane Gloves -- 29616
	self:addTradeSkill(RecipeDB,29616,360,23514,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29616,1,4,21,22,23,24,25,26,27,28,29,30,36,41,59,101)
	self:addTradeAcquire(RecipeDB,29616,6,932,2,19321)

	-- Flamebane Breastplate -- 29617
	self:addTradeSkill(RecipeDB,29617,365,23513,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29617,1,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,101)
	self:addTradeAcquire(RecipeDB,29617,6,932,3,19321)

	-- Felsteel Gloves -- 29619
	self:addTradeSkill(RecipeDB,29619,360,23517,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29619,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,29619,3,18497)

	-- Felsteel Leggings -- 29620
	self:addTradeSkill(RecipeDB,29620,360,23518,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29620,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,29620,3,20900)

	-- Felsteel Helm -- 29621
	self:addTradeSkill(RecipeDB,29621,365,23519,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29621,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,29621,3,18830)

	-- Gauntlets of the Iron Tower -- 29622
	self:addTradeSkill(RecipeDB,29622,365,23532,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29622,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,29622,7,4)

	-- Khorium Belt -- 29628
	self:addTradeSkill(RecipeDB,29628,360,23524,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29628,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29628,3,18203)

	-- Khorium Pants -- 29629
	self:addTradeSkill(RecipeDB,29629,360,23523,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29629,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29629,3,20878)

	-- Khorium Boots -- 29630
	self:addTradeSkill(RecipeDB,29630,365,23525,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29630,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29630,3,18873)

	-- Ragesteel Gloves -- 29642
	self:addTradeSkill(RecipeDB,29642,365,23520,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29642,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29642,3,17136)

	-- Ragesteel Helm -- 29643
	self:addTradeSkill(RecipeDB,29643,365,23521,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29643,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29643,3,16952)

	-- Ragesteel Breastplate -- 29645
	self:addTradeSkill(RecipeDB,29645,370,23522,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29645,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,29645,3,21454,3,23305,3,23324)

	-- Swiftsteel Gloves -- 29648
	self:addTradeSkill(RecipeDB,29648,370,23526,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29648,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29648,3,18314)

	-- Earthpeace Breastplate -- 29649
	self:addTradeSkill(RecipeDB,29649,370,23527,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29649,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,29649,3,17975)

	-- Fel Sharpening Stone -- 29654
	self:addTradeSkill(RecipeDB,29654,300,23528,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29654,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29654,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Adamantite Sharpening Stone -- 29656
	self:addTradeSkill(RecipeDB,29656,350,23529,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29656,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51,103)
	self:addTradeAcquire(RecipeDB,29656,6,942,2,17904)

	-- Felsteel Shield Spike -- 29657
	self:addTradeSkill(RecipeDB,29657,360,23530,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29657,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,29657,6,946,4,17657,6,947,4,17585)

	-- Felfury Gauntlets -- 29658
	self:addTradeSkill(RecipeDB,29658,365,23531,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29658,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,29658,7,2)

	-- Steelgrip Gauntlets -- 29662
	self:addTradeSkill(RecipeDB,29662,365,23533,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29662,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29662,7,4)

	-- Storm Helm -- 29663
	self:addTradeSkill(RecipeDB,29663,365,23534,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29663,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,29663,7,4)

	-- Helm of the Stalwart Defender -- 29664
	self:addTradeSkill(RecipeDB,29664,365,23535,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29664,1,2,5,6,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,29664,7,4)

	-- Oathkeeper's Helm -- 29668
	self:addTradeSkill(RecipeDB,29668,365,23536,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29668,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,29668,7,4)

	-- Black Felsteel Bracers -- 29669
	self:addTradeSkill(RecipeDB,29669,365,23537,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29669,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29669,7,4)

	-- Bracers of the Green Fortress -- 29671
	self:addTradeSkill(RecipeDB,29671,365,23538,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29671,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,29671,7,4)

	-- Blessed Bracers -- 29672
	self:addTradeSkill(RecipeDB,29672,365,23539,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29672,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,29672,7,4)

	-- Felsteel Longblade -- 29692
	self:addTradeSkill(RecipeDB,29692,365,23540,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29692,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,29692,7,2)

	-- Khorium Champion -- 29693
	self:addTradeSkill(RecipeDB,29693,365,23541,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29693,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,69)
	self:addTradeAcquire(RecipeDB,29693,7,4)

	-- Fel Edged Battleaxe -- 29694
	self:addTradeSkill(RecipeDB,29694,365,23542,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29694,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,68)
	self:addTradeAcquire(RecipeDB,29694,7,4)

	-- Felsteel Reaper -- 29695
	self:addTradeSkill(RecipeDB,29695,365,23543,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29695,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,68)
	self:addTradeAcquire(RecipeDB,29695,7,4)

	-- Runic Hammer -- 29696
	self:addTradeSkill(RecipeDB,29696,365,23544,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29696,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,70)
	self:addTradeAcquire(RecipeDB,29696,7,2)

	-- Fel Hardened Maul -- 29697
	self:addTradeSkill(RecipeDB,29697,365,23546,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29697,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,70)
	self:addTradeAcquire(RecipeDB,29697,7,4)

	-- Eternium Runed Blade -- 29698
	self:addTradeSkill(RecipeDB,29698,365,23554,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29698,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,72)
	self:addTradeAcquire(RecipeDB,29698,7,4)

	-- Dirge -- 29699
	self:addTradeSkill(RecipeDB,29699,365,23555,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29699,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,72)
	self:addTradeAcquire(RecipeDB,29699,7,2)

	-- Hand of Eternity -- 29700
	self:addTradeSkill(RecipeDB,29700,365,23556,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,29700,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,63,70)
	self:addTradeAcquire(RecipeDB,29700,7,2)

	-- Lesser Ward of Shielding -- 29728
	self:addTradeSkill(RecipeDB,29728,340,23575,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,29728,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,29728,2,16583,2,19373)

	-- Greater Ward of Shielding -- 29729
	self:addTradeSkill(RecipeDB,29729,375,23576,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,29729,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29729,3,18853)

	-- Lesser Rune of Warding -- 32284
	self:addTradeSkill(RecipeDB,32284,325,23559,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,32284,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,32284,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Greater Rune of Warding -- 32285
	self:addTradeSkill(RecipeDB,32285,350,25521,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,32285,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,32285,6,942,2,17904)

	-- Fel Iron Rod -- 32655
	self:addTradeSkill(RecipeDB,32655,300,25843,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,32655,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,32655,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Adamantite Rod -- 32656
	self:addTradeSkill(RecipeDB,32656,350,25844,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,32656,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32656,2,19662)

	-- Eternium Rod -- 32657
	self:addTradeSkill(RecipeDB,32657,375,25845,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,32657,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32657,2,16583,2,19373)

	-- Nether Chain Shirt -- 34529
	self:addTradeSkill(RecipeDB,34529,350,23563,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,34529,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,34529,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Twisting Nether Chain Shirt -- 34530
	self:addTradeSkill(RecipeDB,34530,375,23564,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,34530,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,34530,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Breastplate of Kings -- 34533
	self:addTradeSkill(RecipeDB,34533,350,28483,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,34533,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,34533,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Bulwark of Kings -- 34534
	self:addTradeSkill(RecipeDB,34534,375,28484,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,34534,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,34534,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Fireguard -- 34535
	self:addTradeSkill(RecipeDB,34535,350,28425,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,34535,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,34535,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Blazeguard -- 34537
	self:addTradeSkill(RecipeDB,34537,375,28426,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,34537,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,34537,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Lionheart Blade -- 34538
	self:addTradeSkill(RecipeDB,34538,350,28428,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,34538,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,34538,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Lionheart Champion -- 34540
	self:addTradeSkill(RecipeDB,34540,375,28429,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,34540,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,34540,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- The Planar Edge -- 34541
	self:addTradeSkill(RecipeDB,34541,350,28431,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,34541,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,34541,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Black Planar Edge -- 34542
	self:addTradeSkill(RecipeDB,34542,375,28432,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,34542,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,34542,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Lunar Crescent -- 34543
	self:addTradeSkill(RecipeDB,34543,350,28434,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,34543,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,34543,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Mooncleaver -- 34544
	self:addTradeSkill(RecipeDB,34544,375,28435,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,34544,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,34544,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Drakefist Hammer -- 34545
	self:addTradeSkill(RecipeDB,34545,350,28437,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,34545,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,34545,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Dragonmaw -- 34546
	self:addTradeSkill(RecipeDB,34546,375,28438,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,34546,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,34546,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Thunder -- 34547
	self:addTradeSkill(RecipeDB,34547,350,28440,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,34547,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,34547,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Deep Thunder -- 34548
	self:addTradeSkill(RecipeDB,34548,375,28441,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,34548,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,34548,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Fel Weightstone -- 34607
	self:addTradeSkill(RecipeDB,34607,300,28420,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34607,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,34607,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Adamantite Weightstone -- 34608
	self:addTradeSkill(RecipeDB,34608,350,28421,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34608,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51,103)
	self:addTradeAcquire(RecipeDB,34608,6,942,2,17904)

	-- Thick Bronze Darts -- 34979
	self:addTradeSkill(RecipeDB,34979,100,29201,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34979,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,75)
	self:addTradeAcquire(RecipeDB,34979,1,1383,1,2836,1,2998,1,3136,1,3355,1,3478,1,4258,1,4596,1,5511,1,10276,1,16583,1,16669,1,16724,
	1,16823,1,19341,1,28694,1,27034,1,514,1,1241,1,33591,1,3174,1,26988,1,33609,1,33631)

	-- Whirling Steel Axes -- 34981
	self:addTradeSkill(RecipeDB,34981,200,29202,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34981,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,75)
	self:addTradeAcquire(RecipeDB,34981,1,2836,1,3355,1,4258,1,16583,1,16669,1,16823,1,19341,1,28694,1,27034,1,5511,1,514,1,1241,
	1,16724,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Enchanted Thorium Blades -- 34982
	self:addTradeSkill(RecipeDB,34982,300,29203,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34982,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,75)
	self:addTradeAcquire(RecipeDB,34982,1,2836,1,16583,1,16823,1,19341,1,28694,1,27034,1,4258,1,5511,1,514,1,1241,1,16724,
	1,3355,1,33591,1,2998,1,3478,1,3136,1,4596,1,3174,1,26988,1,33609,1,33631)

	-- Felsteel Whisper Knives -- 34983
	self:addTradeSkill(RecipeDB,34983,350,29204,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,34983,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,75)
	self:addTradeAcquire(RecipeDB,34983,1,16583,1,16823,1,19341,1,28694,1,27034,1,33591,1,26988,1,33609,1,33631)

	-- Earthforged Leggings -- 36122
	self:addTradeSkill(RecipeDB,36122,260,30069,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36122,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,36122,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Windforged Leggings -- 36124
	self:addTradeSkill(RecipeDB,36124,260,30070,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36124,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36124,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Light Earthforged Blade -- 36125
	self:addTradeSkill(RecipeDB,36125,260,30071,1,2018,9787,1)
	self:addTradeFlags(RecipeDB,36125,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,69)
	self:addTradeAcquire(RecipeDB,36125,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Light Skyforged Axe -- 36126
	self:addTradeSkill(RecipeDB,36126,260,30072,1,2018,9787,1)
	self:addTradeFlags(RecipeDB,36126,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,36126,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Light Emberforged Hammer -- 36128
	self:addTradeSkill(RecipeDB,36128,260,30073,1,2018,9787,1)
	self:addTradeFlags(RecipeDB,36128,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,70)
	self:addTradeAcquire(RecipeDB,36128,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Heavy Earthforged Breastplate -- 36129
	self:addTradeSkill(RecipeDB,36129,330,30074,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36129,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,36129,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Stormforged Hauberk -- 36130
	self:addTradeSkill(RecipeDB,36130,330,30076,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36130,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36130,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Windforged Rapier -- 36131
	self:addTradeSkill(RecipeDB,36131,330,30077,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,36131,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,36131,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Stoneforged Claymore -- 36133
	self:addTradeSkill(RecipeDB,36133,330,30086,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,36133,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,69)
	self:addTradeAcquire(RecipeDB,36133,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Stormforged Axe -- 36134
	self:addTradeSkill(RecipeDB,36134,330,30087,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,36134,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,68)
	self:addTradeAcquire(RecipeDB,36134,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Skyforged Great Axe -- 36135
	self:addTradeSkill(RecipeDB,36135,330,30088,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,36135,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,36135,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Lavaforged Warhammer -- 36136
	self:addTradeSkill(RecipeDB,36136,330,30089,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,36136,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,70)
	self:addTradeAcquire(RecipeDB,36136,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Great Earthforged Hammer -- 36137
	self:addTradeSkill(RecipeDB,36137,330,30093,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,36137,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,70)
	self:addTradeAcquire(RecipeDB,36137,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Embrace of the Twisting Nether -- 36256
	self:addTradeSkill(RecipeDB,36256,375,23565,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36256,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36256,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Bulwark of the Ancient Kings -- 36257
	self:addTradeSkill(RecipeDB,36257,375,28485,1,2018,9788,1)
	self:addTradeFlags(RecipeDB,36257,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,36257,1,5164,1,7230,1,11177,1,20125,1,29506)

	-- Blazefury -- 36258
	self:addTradeSkill(RecipeDB,36258,375,28427,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,36258,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,36258,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Lionheart Executioner -- 36259
	self:addTradeSkill(RecipeDB,36259,375,28430,1,2018,17039,1)
	self:addTradeFlags(RecipeDB,36259,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,36259,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Wicked Edge of the Planes -- 36260
	self:addTradeSkill(RecipeDB,36260,375,28433,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,36260,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,36260,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Bloodmoon -- 36261
	self:addTradeSkill(RecipeDB,36261,375,28436,1,2018,17041,1)
	self:addTradeFlags(RecipeDB,36261,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,68)
	self:addTradeAcquire(RecipeDB,36261,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Dragonstrike -- 36262
	self:addTradeSkill(RecipeDB,36262,375,28439,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,36262,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,36262,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Stormherald -- 36263
	self:addTradeSkill(RecipeDB,36263,375,28442,1,2018,17040,1)
	self:addTradeFlags(RecipeDB,36263,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,70)
	self:addTradeAcquire(RecipeDB,36263,1,7231,1,7232,1,11146,1,11178,1,20124,1,29505)

	-- Belt of the Guardian -- 36389
	self:addTradeSkill(RecipeDB,36389,375,30034,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,36389,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,36389,8,37)

	-- Red Belt of Battle -- 36390
	self:addTradeSkill(RecipeDB,36390,375,30032,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,36390,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,36390,8,37)

	-- Boots of the Protector -- 36391
	self:addTradeSkill(RecipeDB,36391,375,30033,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,36391,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,36391,8,37)

	-- Red Havoc Boots -- 36392
	self:addTradeSkill(RecipeDB,36392,375,30031,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,36392,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,36392,8,37)

	-- Wildguard Breastplate -- 38473
	self:addTradeSkill(RecipeDB,38473,375,31364,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38473,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,103)
	self:addTradeAcquire(RecipeDB,38473,6,942,4,17904)

	-- Wildguard Leggings -- 38475
	self:addTradeSkill(RecipeDB,38475,375,31367,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38475,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,103)
	self:addTradeAcquire(RecipeDB,38475,6,942,3,17904)

	-- Wildguard Helm -- 38476
	self:addTradeSkill(RecipeDB,38476,375,31368,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38476,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,103)
	self:addTradeAcquire(RecipeDB,38476,6,942,3,17904)

	-- Iceguard Breastplate -- 38477
	self:addTradeSkill(RecipeDB,38477,375,31369,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38477,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,114)
	self:addTradeAcquire(RecipeDB,38477,6,967,2,16388)

	-- Iceguard Leggings -- 38478
	self:addTradeSkill(RecipeDB,38478,375,31370,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38478,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,114)
	self:addTradeAcquire(RecipeDB,38478,6,967,3,16388)

	-- Iceguard Helm -- 38479
	self:addTradeSkill(RecipeDB,38479,375,31371,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,38479,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,59,114)
	self:addTradeAcquire(RecipeDB,38479,6,967,2,16388)

	-- Shadesteel Sabots -- 40033
	self:addTradeSkill(RecipeDB,40033,375,32402,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,40033,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,102)
	self:addTradeAcquire(RecipeDB,40033,6,1012,2,23159)

	-- Shadesteel Bracers -- 40034
	self:addTradeSkill(RecipeDB,40034,375,32403,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,40034,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,102)
	self:addTradeAcquire(RecipeDB,40034,6,1012,1,23159)

	-- Shadesteel Greaves -- 40035
	self:addTradeSkill(RecipeDB,40035,375,32404,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,40035,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,102)
	self:addTradeAcquire(RecipeDB,40035,6,1012,2,23159)

	-- Shadesteel Girdle -- 40036
	self:addTradeSkill(RecipeDB,40036,375,32401,1,2018,nil,1)
	self:addTradeFlags(RecipeDB,40036,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,59,102)
	self:addTradeAcquire(RecipeDB,40036,6,1012,1,23159)

	-- Swiftsteel Bracers -- 41132
	self:addTradeSkill(RecipeDB,41132,375,32568,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,41132,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,41132,8,34)

	-- Swiftsteel Shoulders -- 41133
	self:addTradeSkill(RecipeDB,41133,375,32570,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,41133,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,41133,7,4)

	-- Dawnsteel Bracers -- 41134
	self:addTradeSkill(RecipeDB,41134,375,32571,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,41134,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,41134,7,4)

	-- Dawnsteel Shoulders -- 41135
	self:addTradeSkill(RecipeDB,41135,375,32573,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,41135,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,41135,8,34)

	-- Ragesteel Shoulders -- 42662
	self:addTradeSkill(RecipeDB,42662,365,33173,3,2018,nil,1)
	self:addTradeFlags(RecipeDB,42662,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,42662,3,21050,3,21059,3,21060,3,21061)

	-- Adamantite Weapon Chain -- 42688   ---THERE'S 2 VERSIONS?
	self:addTradeSkill(RecipeDB,42688,335,33185,2,2018,nil,1)
	self:addTradeFlags(RecipeDB,42688,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42688,3,24664)

	-- Heavy Copper Longsword -- 43549
	self:addTradeSkill(RecipeDB,43549,35,33791,2,2018,nil,1)
	self:addTradeFlags(RecipeDB,43549,1,8,21,22,23,24,25,26,27,28,29,30,36,40,69)
	self:addTradeAcquire(RecipeDB,43549,4,1578)

	-- Hammer of Righteous Might -- 43846
	self:addTradeSkill(RecipeDB,43846,365,32854,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,43846,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63,70)
	self:addTradeAcquire(RecipeDB,43846,7,4)

	-- Sunblessed Gauntlets -- 46140
	self:addTradeSkill(RecipeDB,46140,365,34380,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,46140,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,46140,8,24)

	-- Hard Khorium Battlefists -- 46141
	self:addTradeSkill(RecipeDB,46141,365,34378,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,46141,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,59)
	self:addTradeAcquire(RecipeDB,46141,8,24)

	-- Sunblessed Breastplate -- 46142
	self:addTradeSkill(RecipeDB,46142,365,34379,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,46142,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,46142,8,24)

	-- Hard Khorium Battleplate -- 46144
	self:addTradeSkill(RecipeDB,46144,365,34377,4,2018,nil,1)
	self:addTradeFlags(RecipeDB,46144,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,46144,8,24)

	-- Cobalt Legplates -- 52567
	self:addTradeSkill(RecipeDB,52567,370,39086,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52567,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52567,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Belt -- 52568
	self:addTradeSkill(RecipeDB,52568,350,39087,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52568,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52568,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Boots -- 52569
	self:addTradeSkill(RecipeDB,52569,350,39088,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52569,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Chestpiece -- 52570
	self:addTradeSkill(RecipeDB,52570,375,39085,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52570,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52570,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Helm -- 52571
	self:addTradeSkill(RecipeDB,52571,370,39084,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52571,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52571,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Shoulders -- 52572
	self:addTradeSkill(RecipeDB,52572,360,39083,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,52572,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,52572,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Triangle Shield -- 54550
	self:addTradeSkill(RecipeDB,54550,360,40668,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54550,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,64)
	self:addTradeAcquire(RecipeDB,54550,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Belt -- 54551
	self:addTradeSkill(RecipeDB,54551,395,40669,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54551,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Boots -- 54552
	self:addTradeSkill(RecipeDB,54552,400,40671,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54552,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Breastplate -- 54553
	self:addTradeSkill(RecipeDB,54553,400,40672,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54553,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Legplates -- 54554
	self:addTradeSkill(RecipeDB,54554,395,40674,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54554,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54554,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Helm -- 54555
	self:addTradeSkill(RecipeDB,54555,405,40673,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54555,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Shoulders -- 54556
	self:addTradeSkill(RecipeDB,54556,405,40675,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,54556,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Saronite Defender -- 54557
	self:addTradeSkill(RecipeDB,54557,390,40670,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,54557,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,64)
	self:addTradeAcquire(RecipeDB,54557,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Helm -- 54917
	self:addTradeSkill(RecipeDB,54917,375,40942,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54917,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54917,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Boots -- 54918
	self:addTradeSkill(RecipeDB,54918,380,40949,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54918,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54918,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Shoulders -- 54941
	self:addTradeSkill(RecipeDB,54941,385,40950,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54941,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Chestpiece -- 54944
	self:addTradeSkill(RecipeDB,54944,385,40951,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54944,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54944,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Gauntlets -- 54945
	self:addTradeSkill(RecipeDB,54945,390,40952,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54945,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54945,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Belt -- 54946
	self:addTradeSkill(RecipeDB,54946,395,40953,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54946,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54946,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Legplates -- 54947
	self:addTradeSkill(RecipeDB,54947,395,40943,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54947,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54947,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Cobalt Bracers -- 54948
	self:addTradeSkill(RecipeDB,54948,400,40954,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54948,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54948,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Horned Cobalt Helm -- 54949
	self:addTradeSkill(RecipeDB,54949,400,40955,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54949,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54949,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Reinforced Cobalt Shoulders -- 54978
	self:addTradeSkill(RecipeDB,54978,375,40956,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54978,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54978,3,27333)

	-- Reinforced Cobalt Helm -- 54979
	self:addTradeSkill(RecipeDB,54979,375,40957,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54979,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54979,3,26270)

	-- Reinforced Cobalt Legplates -- 54980
	self:addTradeSkill(RecipeDB,54980,375,40958,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54980,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54980,3,29235)

	-- Reinforced Cobalt Chestpiece -- 54981
	self:addTradeSkill(RecipeDB,54981,375,40959,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,54981,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,54981,3,28123)

	-- Saronite Protector -- 55013
	self:addTradeSkill(RecipeDB,55013,390,41117,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55013,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,64)
	self:addTradeAcquire(RecipeDB,55013,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Saronite Bulwark -- 55014
	self:addTradeSkill(RecipeDB,55014,410,41113,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55014,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,64)
	self:addTradeAcquire(RecipeDB,55014,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Gauntlets -- 55015
	self:addTradeSkill(RecipeDB,55015,415,41114,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55015,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55015,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Saronite Bracers -- 55017
	self:addTradeSkill(RecipeDB,55017,410,41116,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55017,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55017,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Legplates -- 55055
	self:addTradeSkill(RecipeDB,55055,395,41126,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55055,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55055,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Gauntlets -- 55056
	self:addTradeSkill(RecipeDB,55056,400,41127,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55056,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55056,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Boots -- 55057
	self:addTradeSkill(RecipeDB,55057,405,41128,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55057,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55057,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Breastplate -- 55058
	self:addTradeSkill(RecipeDB,55058,415,41129,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55058,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55058,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Honed Cobalt Cleaver -- 55174
	self:addTradeSkill(RecipeDB,55174,390,41181,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55174,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,68)
	self:addTradeAcquire(RecipeDB,55174,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Cobalt Slicer -- 55177
	self:addTradeSkill(RecipeDB,55177,395,41182,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55177,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,69)
	self:addTradeAcquire(RecipeDB,55177,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Saronite Ambusher -- 55179
	self:addTradeSkill(RecipeDB,55179,400,41183,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55179,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,72)
	self:addTradeAcquire(RecipeDB,55179,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Saronite Shiv -- 55181
	self:addTradeSkill(RecipeDB,55181,405,41184,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55181,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,72)
	self:addTradeAcquire(RecipeDB,55181,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Furious Saronite Beatstick -- 55182
	self:addTradeSkill(RecipeDB,55182,410,41185,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55182,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,55182,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Corroded Saronite Edge -- 55183
	self:addTradeSkill(RecipeDB,55183,415,41186,3,2018,9787,2)
	self:addTradeFlags(RecipeDB,55183,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,55183,1,26564,1,26904,1,26952,1,26981,1,29924,1,11146,1,29505,1,11178)

	-- Corroded Saronite Woundbringer -- 55184
	self:addTradeSkill(RecipeDB,55184,415,41187,3,2018,9787,2)
	self:addTradeFlags(RecipeDB,55184,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,69)
	self:addTradeAcquire(RecipeDB,55184,1,26564,1,26904,1,26952,1,26981,1,29924,1,11146,1,29505,1,11178)

	-- Saronite Mindcrusher -- 55185
	self:addTradeSkill(RecipeDB,55185,415,41188,3,2018,9787,2)
	self:addTradeFlags(RecipeDB,55185,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63,70)
	self:addTradeAcquire(RecipeDB,55185,1,26564,1,26904,1,26952,1,26981,1,29924,1,11146,1,29505,1,11178)

	-- Chestplate of Conquest -- 55186
	self:addTradeSkill(RecipeDB,55186,415,41189,3,2018,9788,2)
	self:addTradeFlags(RecipeDB,55186,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,55186,1,26564,1,26904,1,26952,1,26981,1,29924,1,29506,1,5164,1,11177)

	-- Legplates of Conquest -- 55187
	self:addTradeSkill(RecipeDB,55187,415,41190,3,2018,9788,2)
	self:addTradeFlags(RecipeDB,55187,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,59)
	self:addTradeAcquire(RecipeDB,55187,1,26564,1,26904,1,26952,1,26981,1,29924,1,29506,1,5164,1,11177)

	-- Sturdy Cobalt Quickblade -- 55200
	self:addTradeSkill(RecipeDB,55200,380,41239,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55200,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,69)
	self:addTradeAcquire(RecipeDB,55200,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Tenderizer -- 55201
	self:addTradeSkill(RecipeDB,55201,380,41240,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55201,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,55201,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Sure-fire Shuriken -- 55202
	self:addTradeSkill(RecipeDB,55202,385,41241,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55202,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,75)
	self:addTradeAcquire(RecipeDB,55202,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Forged Cobalt Claymore -- 55203
	self:addTradeSkill(RecipeDB,55203,385,41242,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55203,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,69)
	self:addTradeAcquire(RecipeDB,55203,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Notched Cobalt War Axe -- 55204
	self:addTradeSkill(RecipeDB,55204,390,41243,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55204,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,68)
	self:addTradeAcquire(RecipeDB,55204,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Deadly Saronite Dirk -- 55206
	self:addTradeSkill(RecipeDB,55206,405,41245,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55206,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,75)
	self:addTradeAcquire(RecipeDB,55206,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Vengeance Bindings -- 55298
	self:addTradeSkill(RecipeDB,55298,420,41355,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55298,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55298,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Righteous Gauntlets -- 55300
	self:addTradeSkill(RecipeDB,55300,420,41356,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55300,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55300,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Daunting Handguards -- 55301
	self:addTradeSkill(RecipeDB,55301,420,41357,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55301,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55301,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Helm of Command -- 55302
	self:addTradeSkill(RecipeDB,55302,425,41344,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55302,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55302,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Daunting Legplates -- 55303
	self:addTradeSkill(RecipeDB,55303,425,41345,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55303,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55303,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Righteous Greaves -- 55304
	self:addTradeSkill(RecipeDB,55304,425,41346,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55304,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55304,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Bracers -- 55305
	self:addTradeSkill(RecipeDB,55305,420,41354,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55305,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55305,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Pauldrons -- 55306
	self:addTradeSkill(RecipeDB,55306,420,41351,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55306,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55306,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Waistguard -- 55307
	self:addTradeSkill(RecipeDB,55307,420,41352,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55307,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Walkers -- 55308
	self:addTradeSkill(RecipeDB,55308,420,41348,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55308,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55308,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Gauntlets -- 55309
	self:addTradeSkill(RecipeDB,55309,420,41349,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55309,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55309,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Legplates -- 55310
	self:addTradeSkill(RecipeDB,55310,425,41347,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55310,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55310,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Hauberk -- 55311
	self:addTradeSkill(RecipeDB,55311,425,41353,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55311,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55311,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Savage Saronite Skullshield -- 55312
	self:addTradeSkill(RecipeDB,55312,425,41350,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55312,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55312,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titansteel Destroyer -- 55369
	self:addTradeSkill(RecipeDB,55369,440,41257,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55369,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,55369,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titansteel Bonecrusher -- 55370
	self:addTradeSkill(RecipeDB,55370,440,41383,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55370,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,55370,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titansteel Guardian -- 55371
	self:addTradeSkill(RecipeDB,55371,440,41384,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55371,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,55371,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Titansteel Helm -- 55372
	self:addTradeSkill(RecipeDB,55372,440,41386,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55372,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55372,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Titansteel Helm -- 55373
	self:addTradeSkill(RecipeDB,55373,440,41387,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55373,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55373,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Titansteel Helm -- 55374
	self:addTradeSkill(RecipeDB,55374,440,41388,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55374,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55374,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Spiked Titansteel Treads -- 55375
	self:addTradeSkill(RecipeDB,55375,440,41391,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55375,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55375,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Tempered Titansteel Treads -- 55376
	self:addTradeSkill(RecipeDB,55376,440,41392,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55376,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55376,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Titansteel Treads -- 55377
	self:addTradeSkill(RecipeDB,55377,440,41394,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,55377,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,55377,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Socket Bracer -- 55628
	self:addTradeSkill(RecipeDB,55628,400,nil,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,55628,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55628,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Socket Gloves -- 55641
	self:addTradeSkill(RecipeDB,55641,400,nil,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,55641,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55641,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Eternal Belt Buckle -- 55656
	self:addTradeSkill(RecipeDB,55656,415,41611,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,55656,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55656,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titanium Rod -- 55732
	self:addTradeSkill(RecipeDB,55732,420,41745,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,55732,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55732,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Bracers -- 55834
	self:addTradeSkill(RecipeDB,55834,360,41974,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55834,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55834,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Gauntlets -- 55835
	self:addTradeSkill(RecipeDB,55835,370,41975,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55835,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,59)
	self:addTradeAcquire(RecipeDB,55835,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titanium Weapon Chain -- 55839
	self:addTradeSkill(RecipeDB,55839,420,41976,2,2018,nil,2)
	self:addTradeFlags(RecipeDB,55839,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55839,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titansteel Shanker -- 56234
	self:addTradeSkill(RecipeDB,56234,440,42435,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,56234,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,72)
	self:addTradeAcquire(RecipeDB,56234,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cudgel of Saronite Justice -- 56280
	self:addTradeSkill(RecipeDB,56280,410,42443,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,56280,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,70)
	self:addTradeAcquire(RecipeDB,56280,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titanium Shield Spike -- 56357
	self:addTradeSkill(RecipeDB,56357,420,42500,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56357,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56357,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titansteel Shield Wall -- 56400
	self:addTradeSkill(RecipeDB,56400,440,42508,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,56400,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,64)
	self:addTradeAcquire(RecipeDB,56400,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Bracers -- 56549
	self:addTradeSkill(RecipeDB,56549,420,42723,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56549,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56549,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Pauldrons -- 56550
	self:addTradeSkill(RecipeDB,56550,420,42727,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56550,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56550,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Waistguard -- 56551
	self:addTradeSkill(RecipeDB,56551,420,42729,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56551,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Walkers -- 56552
	self:addTradeSkill(RecipeDB,56552,420,42730,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,56552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56552,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Gauntlets -- 56553
	self:addTradeSkill(RecipeDB,56553,420,42724,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56553,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Legplates -- 56554
	self:addTradeSkill(RecipeDB,56554,425,42726,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56554,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56554,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Hauberk -- 56555
	self:addTradeSkill(RecipeDB,56555,425,42725,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,56555,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56555,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Ornate Saronite Skullshield -- 56556
	self:addTradeSkill(RecipeDB,56556,425,42728,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,56556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,56556,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Cobalt Skeleton Key -- 59405
	self:addTradeSkill(RecipeDB,59405,350,43854,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59405,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59405,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Titanium Skeleton Key -- 59406
	self:addTradeSkill(RecipeDB,59406,430,43853,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59406,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,59406,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Belt -- 59436
	self:addTradeSkill(RecipeDB,59436,395,43860,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59436,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,59436,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Bracers -- 59438
	self:addTradeSkill(RecipeDB,59438,400,43864,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59438,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,59438,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Pauldrons -- 59440
	self:addTradeSkill(RecipeDB,59440,405,43865,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59440,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,59440,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Brilliant Saronite Helm -- 59441
	self:addTradeSkill(RecipeDB,59441,415,43870,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59441,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,59441,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Saronite Spellblade -- 59442
	self:addTradeSkill(RecipeDB,59442,410,43871,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,59442,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63,69)
	self:addTradeAcquire(RecipeDB,59442,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Icebane Chestguard -- 61008
	self:addTradeSkill(RecipeDB,61008,425,43586,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,61008,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,61008,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Icebane Girdle -- 61009
	self:addTradeSkill(RecipeDB,61009,420,43587,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,61009,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,61009,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Icebane Treads -- 61010
	self:addTradeSkill(RecipeDB,61010,420,43588,1,2018,nil,2)
	self:addTradeFlags(RecipeDB,61010,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,59)
	self:addTradeAcquire(RecipeDB,61010,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	-- Orcish War Leggings -- 9957
	self:addTradeSkill(RecipeDB, 9957,230,7929,2,2018,nil,0)
	self:addTradeFlags(RecipeDB, 9957,2,8,21,22,23,24,25,26,27,28,29,30,36,41,51,52,58)
	self:addTradeAcquire(RecipeDB, 9957,4,2756)

	-- Dark Iron Mail -- 15293
	self:addTradeSkill(RecipeDB,15293,270,11606,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,15293,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,51,52,58)
	self:addTradeAcquire(RecipeDB,15293,8,25)

	-- Dark Iron Shoulders -- 15295
	self:addTradeSkill(RecipeDB,15295,280,11605,2,2018,nil,0)
	self:addTradeFlags(RecipeDB,15295,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,51,52,59)
	self:addTradeAcquire(RecipeDB,15295,8,25)

	-- Titanium Plating -- 62202
	self:addTradeSkill(RecipeDB,62202,450,44936,3,2018,nil,2)
	self:addTradeFlags(RecipeDB,62202,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,130,131)
	self:addTradeAcquire(RecipeDB,62202,6,1052,4,32565,6,1052,4,32774,6,1037,4,32564,6,1037,4,32773)

	-- Battlelord's Plate Boots -- 63188
	self:addTradeSkill(RecipeDB,63188,450,45089,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63188,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,51,59)
	self:addTradeAcquire(RecipeDB,63188,8,39)

	-- Belt of the Titans -- 63187
	self:addTradeSkill(RecipeDB,63187,450,45088,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63187,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,51,59)
	self:addTradeAcquire(RecipeDB,63187,8,39)

	-- Indestructible Plate Girdle -- 63191
	self:addTradeSkill(RecipeDB,63191,450,45092,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63191,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,63191,8,39)

	-- Plate Girdle of the Righteous -- 63189
	self:addTradeSkill(RecipeDB,63189,450,45090,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63189,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,59)
	self:addTradeAcquire(RecipeDB,63189,8,39)

	-- Spiked Deathdealers -- 63192
	self:addTradeSkill(RecipeDB,63192,450,45093,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63192,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,52,59)
	self:addTradeAcquire(RecipeDB,63192,8,39)

	-- Treads of Destiny -- 63190
	self:addTradeSkill(RecipeDB,63190,450,45091,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63190,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,59)
	self:addTradeAcquire(RecipeDB,63190,8,39)

	-- Titanstell Spellblade -- 63182
	self:addTradeSkill(RecipeDB,63182,440,45085,4,2018,nil,2)
	self:addTradeFlags(RecipeDB,63182,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51,72)
	self:addTradeAcquire(RecipeDB,63182,1,26564,1,26904,1,26952,1,26981,1,26988,1,27034,1,28694,1,29924,1,33591)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Breastplate of the White Knight -- 67091
		self:addTradeSkill(RecipeDB,67091,450,47591,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67091,1,2)
		--self:addTradeAcquire(RecipeDB,67091
		
		-- Saronite Swordbreakers -- 67131
		self:addTradeSkill(RecipeDB,67131,450,47571,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67131,1,2)
		--self:addTradeAcquire(RecipeDB,67131

		-- Sunforged Bracers -- 67135
		self:addTradeSkill(RecipeDB,67135,450,47575,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67135,1,2)
		--self:addTradeAcquire(RecipeDB,67135

		-- Sunforged Breastplate -- 67095
		self:addTradeSkill(RecipeDB,67095,450,47593,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67095,1,2)
		--self:addTradeAcquire(RecipeDB,67095

		-- Titanium Razorplate -- 67132
		self:addTradeSkill(RecipeDB,67132,450,47590,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67132,1,2)
		--self:addTradeAcquire(RecipeDB,67132

		-- Titanium Spikeguards -- 67133
		self:addTradeSkill(RecipeDB,67133,450,47573,4,2018,nil,2)
		self:addTradeFlags(RecipeDB,67133,1,2)
		--self:addTradeAcquire(RecipeDB,67133

		return 493

	else

		return 487
	
	end

end
