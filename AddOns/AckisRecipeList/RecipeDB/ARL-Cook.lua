--[[

************************************************************************

ARL-Cook.lua

Cooking data for all of Ackis Recipe List

************************************************************************

File date: 2009-08-04T04:45:37Z 
File revision: 2271 
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

function addon:InitCooking(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Charred Wolf Meat -- 2538
	self:addTradeSkill(RecipeDB,2538,1,2679,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2538,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2538,8,8)

	-- Spiced Wolf Meat -- 2539
	self:addTradeSkill(RecipeDB,2539,10,2680,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2539,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2539,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Roasted Boar Meat -- 2540
	self:addTradeSkill(RecipeDB,2540,1,2681,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2540,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2540,8,8)

	-- Coyote Steak -- 2541
	self:addTradeSkill(RecipeDB,2541,50,2684,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2541,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2541,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Goretusk Liver Pie -- 2542
	self:addTradeSkill(RecipeDB,2542,50,724,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2542,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2542,4,22,2,340)

	-- Westfall Stew -- 2543
	self:addTradeSkill(RecipeDB,2543,75,733,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2543,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2543,4,38,2,340)

	-- Crab Cake -- 2544
	self:addTradeSkill(RecipeDB,2544,75,2683,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2544,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2544,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Cooked Crab Claw -- 2545
	self:addTradeSkill(RecipeDB,2545,85,2682,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2545,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2545,7,1,2,340)

	-- Dry Pork Ribs -- 2546
	self:addTradeSkill(RecipeDB,2546,80,2687,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2546,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2546,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Redridge Goulash -- 2547
	self:addTradeSkill(RecipeDB,2547,100,1082,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2547,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2547,4,92,2,340)

	-- Succulent Pork Ribs -- 2548
	self:addTradeSkill(RecipeDB,2548,110,2685,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2548,1,2,4,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2548,7,1,2,340)

	-- Seasoned Wolf Kabob -- 2549
	self:addTradeSkill(RecipeDB,2549,100,1017,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2549,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2549,4,90,2,340)

	-- Beer Basted Boar Ribs -- 2795
	self:addTradeSkill(RecipeDB,2795,10,2888,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,2795,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,2795,4,384,2,340)

	-- Crocolisk Steak -- 3370
	self:addTradeSkill(RecipeDB,3370,80,3662,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3370,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3370,4,385,2,340)

	-- Blood Sausage -- 3371
	self:addTradeSkill(RecipeDB,3371,60,3220,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3371,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3371,4,418,2,340)

	-- Murloc Fin Soup -- 3372
	self:addTradeSkill(RecipeDB,3372,90,3663,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3372,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3372,4,127,2,340)

	-- Crocolisk Gumbo -- 3373
	self:addTradeSkill(RecipeDB,3373,120,3664,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3373,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3373,4,471,2,340)

	-- Curiously Tasty Omelet -- 3376
	self:addTradeSkill(RecipeDB,3376,130,3665,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3376,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3376,4,296,2,340,2,1148,2,2821)

	-- Gooey Spider Cake -- 3377
	self:addTradeSkill(RecipeDB,3377,110,3666,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3377,1,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3377,4,93,2,340)

	-- Big Bear Steak -- 3397
	self:addTradeSkill(RecipeDB,3397,110,3726,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3397,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3397,4,498,2,3960,2,12246)

	-- Hot Lion Chops -- 3398
	self:addTradeSkill(RecipeDB,3398,125,3727,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3398,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3398,4,501,2,3489,2,12245)

	-- Tasty Lion Steak -- 3399
	self:addTradeSkill(RecipeDB,3399,150,3728,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3399,1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3399,4,564)

	-- Soothing Turtle Bisque -- 3400
	self:addTradeSkill(RecipeDB,3400,175,3729,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,3400,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3400,4,555,4,7321)

	-- Barbecued Buzzard Wing -- 4094
	self:addTradeSkill(RecipeDB,4094,175,4457,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,4094,1,2,3,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,4094,4,703,1,2818,2,2814,2,12246)

	-- Kaldorei Spider Kabob -- 6412
	self:addTradeSkill(RecipeDB,6412,10,5472,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6412,1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6412,4,4161)

	-- Scorpid Surprise -- 6413
	self:addTradeSkill(RecipeDB,6413,20,5473,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6413,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6413,2,3881)

	-- Roasted Kodo Meat -- 6414
	self:addTradeSkill(RecipeDB,6414,35,5474,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6414,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6414,2,3081)

	-- Fillet of Frenzy -- 6415
	self:addTradeSkill(RecipeDB,6415,50,5476,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6415,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6415,2,4200)

	-- Strider Stew -- 6416
	self:addTradeSkill(RecipeDB,6416,50,5477,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6416,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6416,4,2178,2,3482)

	-- Crispy Lizard Tail -- 6418
	self:addTradeSkill(RecipeDB,6418,100,5479,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6418,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6418,2,3482)

	-- Lean Venison -- 6419
	self:addTradeSkill(RecipeDB,6419,110,5480,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6419,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6419,2,3960,2,12245)

	-- Boiled Clams -- 6499
	self:addTradeSkill(RecipeDB,6499,50,5525,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6499,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6499,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Goblin Deviled Clams -- 6500
	self:addTradeSkill(RecipeDB,6500,125,5527,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6500,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6500,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Clam Chowder -- 6501
	self:addTradeSkill(RecipeDB,6501,90,5526,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,6501,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6501,2,4305,2,4307)

	-- Giant Clam Scorcho -- 7213
	self:addTradeSkill(RecipeDB,7213,175,6038,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7213,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7213,2,2664)

	-- Brilliant Smallfish -- 7751
	self:addTradeSkill(RecipeDB,7751,1,6290,1,2550,nil,0,1,45,65,85)
	self:addTradeFlags(RecipeDB,7751,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7751,2,66,2,1684,2,3029,2,3550,2,4265,2,4574,2,5494,2,5940,2,8508)

	-- Slitherskin Mackerel -- 7752
	self:addTradeSkill(RecipeDB,7752,1,787,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7752,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7752,2,3550,2,4305,2,5162,2,5942,2,10118)

	-- Longjaw Mud Snapper -- 7753
	self:addTradeSkill(RecipeDB,7753,50,4592,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7753,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7753,2,66,2,1684,2,3027,2,4265,2,4574,2,5162,2,5748,2,5940)

	-- Loch Frenzy Delight -- 7754
	self:addTradeSkill(RecipeDB,7754,50,6316,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7754,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7754,2,1684)

	-- Bristle Whisker Catfish -- 7755
	self:addTradeSkill(RecipeDB,7755,100,4593,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7755,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7755,2,2383,2,2397,2,3027,2,3029,2,3497,2,4553,2,5494)

	-- Rainbow Fin Albacore -- 7827
	self:addTradeSkill(RecipeDB,7827,50,5095,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7827,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7827,2,3178,2,3333,2,3497,2,4305,2,4307,2,4553,2,5494,2,5748,2,5942,2,10118)

	-- Rockscale Cod -- 7828
	self:addTradeSkill(RecipeDB,7828,175,4594,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,7828,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7828,2,2383,2,2664,2,3178,2,3333,2,4307,2,4574,2,5162,2,12033,2,12962)

	-- Savory Deviate Delight -- 8238
	self:addTradeSkill(RecipeDB,8238,85,6657,2,2550,nil,0)
	self:addTradeFlags(RecipeDB,8238,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8238,7,2)

	-- Herb Baked Egg -- 8604
	self:addTradeSkill(RecipeDB,8604,1,6888,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,8604,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8604,8,8)

	-- Smoked Bear Meat -- 8607
	self:addTradeSkill(RecipeDB,8607,40,6890,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,8607,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8607,2,1465,2,3556)

	-- Thistle Tea -- 9513
	self:addTradeSkill(RecipeDB,9513,60,7676,2,2550,nil,0)
	self:addTradeFlags(RecipeDB,9513,1,2,4,8,28,36,41)
	self:addTradeAcquire(RecipeDB,9513,4,2359,4,2478,2,6779)

	-- Goldthorn Tea -- 13028
	self:addTradeSkill(RecipeDB,13028,175,10841,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,13028,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,13028,8,13)

	-- Lean Wolf Steak -- 15853
	self:addTradeSkill(RecipeDB,15853,125,12209,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15853,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15853,2,12246)

	-- Roast Raptor -- 15855
	self:addTradeSkill(RecipeDB,15855,175,12210,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15855,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15855,2,734,2,1148,2,2810,2,2821,2,4879,2,4897,2,12245)

	-- Hot Wolf Ribs -- 15856
	self:addTradeSkill(RecipeDB,15856,175,13851,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15856,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15856,2,7947,2,8145,2,12246)

	-- Jungle Stew -- 15861
	self:addTradeSkill(RecipeDB,15861,175,12212,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15861,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15861,2,734,2,1148,2,12245)

	-- Carrion Surprise -- 15863
	self:addTradeSkill(RecipeDB,15863,175,12213,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15863,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15863,2,989,2,4879,2,9636,2,12245)

	-- Mystery Stew -- 15865
	self:addTradeSkill(RecipeDB,15865,175,12214,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15865,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15865,2,4897,2,8150,2,12246)

	-- Dragonbreath Chili -- 15906
	self:addTradeSkill(RecipeDB,15906,200,12217,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15906,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15906,2,4879,2,4897,2,12246)

	-- Heavy Kodo Stew -- 15910
	self:addTradeSkill(RecipeDB,15910,200,12215,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15910,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15910,2,8150,2,9636,2,12245)

	-- Spiced Chili Crab -- 15915
	self:addTradeSkill(RecipeDB,15915,225,12216,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15915,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15915,2,989,2,1149,2,4305)

	-- Monster Omelet -- 15933
	self:addTradeSkill(RecipeDB,15933,225,12218,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15933,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15933,2,2803,2,2806,2,11187)

	-- Crispy Bat Wing -- 15935
	self:addTradeSkill(RecipeDB,15935,1,12224,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,15935,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,15935,2,2118)

	-- Spotted Yellowtail -- 18238
	self:addTradeSkill(RecipeDB,18238,225,6887,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18238,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18238,2,8137)

	-- Cooked Glossy Mightfish -- 18239
	self:addTradeSkill(RecipeDB,18239,225,13927,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18239,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18239,2,2664)

	-- Grilled Squid -- 18240
	self:addTradeSkill(RecipeDB,18240,240,13928,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18240,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18240,2,8137)

	-- Filet of Redgill -- 18241
	self:addTradeSkill(RecipeDB,18241,225,13930,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18241,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18241,2,2664)

	-- Hot Smoked Bass -- 18242
	self:addTradeSkill(RecipeDB,18242,240,13929,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18242,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18242,2,2664)

	-- Nightfin Soup -- 18243
	self:addTradeSkill(RecipeDB,18243,250,13931,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18243,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18243,2,8137)

	-- Poached Sunscale Salmon -- 18244
	self:addTradeSkill(RecipeDB,18244,250,13932,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18244,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18244,2,8137)

	-- Lobster Stew -- 18245
	self:addTradeSkill(RecipeDB,18245,275,13933,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18245,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18245,2,7947,2,8145)

	-- Mightfish Steak -- 18246
	self:addTradeSkill(RecipeDB,18246,275,13934,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18246,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18246,2,7947,2,8145)

	-- Baked Salmon -- 18247
	self:addTradeSkill(RecipeDB,18247,275,13935,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,18247,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18247,2,7947,2,8145)

	-- Undermine Clam Chowder -- 20626
	self:addTradeSkill(RecipeDB,20626,225,16766,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,20626,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20626,2,8139)

	-- Mithril Head Trout -- 20916
	self:addTradeSkill(RecipeDB,20916,175,8364,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,20916,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,20916,2,2383,2,2664,2,3178,2,3333,2,4307,2,4574,2,5162,2,12033,2,12962)

	-- Gingerbread Cookie -- 21143
	self:addTradeSkill(RecipeDB,21143,1,17197,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,21143,1,2,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21143,5,1,2,13420,2,13429,2,13432,2,13433,2,13435,2,23010,2,23012,2,23064)

	-- Egg Nog -- 21144
	self:addTradeSkill(RecipeDB,21144,35,17198,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,21144,1,2,7,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21144,5,1,2,13420,2,13429,2,13432,2,13433,2,13435,2,23010,2,23012,2,23064)

	-- Spider Sausage -- 21175
	self:addTradeSkill(RecipeDB,21175,200,17222,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,21175,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,21175,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Tender Wolf Steak -- 22480
	self:addTradeSkill(RecipeDB,22480,225,18045,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,22480,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,22480,2,4782,2,7733,2,8125)

	-- Runn Tum Tuber Surprise -- 22761
	self:addTradeSkill(RecipeDB,22761,275,18254,2,2550,nil,0)
	self:addTradeFlags(RecipeDB,22761,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22761,3,14354)

	-- Heavy Crocolisk Stew -- 24418
	self:addTradeSkill(RecipeDB,24418,150,20074,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,24418,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,24418,2,4879)

	-- Smoked Desert Dumplings -- 24801
	self:addTradeSkill(RecipeDB,24801,285,20452,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,24801,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,24801,4,8307)

	-- Dirge's Kickin' Chimaerok Chops -- 25659
	self:addTradeSkill(RecipeDB,25659,300,21023,4,2550,nil,0)
	self:addTradeFlags(RecipeDB,25659,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25659,4,8586)

	-- Smoked Sagefish -- 25704
	self:addTradeSkill(RecipeDB,25704,80,21072,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,25704,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25704,2,2381,2,2397,2,2664,2,3027,2,3085,2,3400,2,4223,2,4265,2,4553,2,5160,2,5483,2,8307,2,12033,2,14738,2,16253,2,16677,2,16718,2,17246,2,19195,2,26868)

	-- Sagefish Delight -- 25954
	self:addTradeSkill(RecipeDB,25954,175,21217,1,2550,nil,0)
	self:addTradeFlags(RecipeDB,25954,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,25954,2,2381,2,2397,2,2664,2,3027,2,3085,2,3400,2,4223,2,4265,2,4553,2,5160,2,5483,2,8307,2,12033,2,14738,2,16253,2,16677,2,16718,2,17246,2,19195,2,26868)

	-- Crunchy Spider Surprise -- 28267
	self:addTradeSkill(RecipeDB,28267,60,22645,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,28267,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,28267,4,9171,2,16253,2,18427)

	-- Lynx Steak -- 33276
	self:addTradeSkill(RecipeDB,33276,1,27635,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33276,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33276,2,16262)

	-- Roasted Moongraze Tenderloin -- 33277
	self:addTradeSkill(RecipeDB,33277,1,24105,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33277,1,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33277,4,9454)

	-- Bat Bites -- 33278
	self:addTradeSkill(RecipeDB,33278,50,27636,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33278,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33278,2,16253)

	-- Buzzard Bites -- 33279
	self:addTradeSkill(RecipeDB,33279,300,27651,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33279,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33279,4,9356)

	-- Ravager Dog -- 33284
	self:addTradeSkill(RecipeDB,33284,300,27655,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33284,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33284,2,16585,2,16826)

	-- Sporeling Snack -- 33285
	self:addTradeSkill(RecipeDB,33285,310,27656,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33285,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33285,2,18382)

	-- Blackened Basilisk -- 33286
	self:addTradeSkill(RecipeDB,33286,315,27657,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33286,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33286,2,18957,2,19038)

	-- Roasted Clefthoof -- 33287
	self:addTradeSkill(RecipeDB,33287,325,27658,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33287,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33287,2,20096,2,20097)

	-- Warp Burger -- 33288
	self:addTradeSkill(RecipeDB,33288,325,27659,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33288,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33288,2,18957,2,19038)

	-- Talbuk Steak -- 33289
	self:addTradeSkill(RecipeDB,33289,325,27660,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33289,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33289,2,20096,2,20097)

	-- Blackened Trout -- 33290
	self:addTradeSkill(RecipeDB,33290,300,27661,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33290,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33290,2,18015,2,20028)

	-- Feltail Delight -- 33291
	self:addTradeSkill(RecipeDB,33291,300,27662,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33291,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33291,2,18011,2,20028)

	-- Blackened Sporefish -- 33292
	self:addTradeSkill(RecipeDB,33292,310,27663,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33292,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33292,2,18911)

	-- Grilled Mudfish -- 33293
	self:addTradeSkill(RecipeDB,33293,320,27664,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33293,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33293,2,20096,2,20097)

	-- Poached Bluefish -- 33294
	self:addTradeSkill(RecipeDB,33294,320,27665,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33294,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33294,2,20096,2,20097)

	-- Golden Fish Sticks -- 33295
	self:addTradeSkill(RecipeDB,33295,325,27666,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33295,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33295,2,18960,2,19296)

	-- Spicy Crawdad -- 33296
	self:addTradeSkill(RecipeDB,33296,350,27667,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,33296,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,33296,2,18960,2,19296)

	-- Clam Bar -- 36210
	self:addTradeSkill(RecipeDB,36210,300,30155,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,36210,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,36210,2,18382)

	-- Spice Bread -- 37836
	self:addTradeSkill(RecipeDB,37836,1,30816,1,2550,nil,1,1,30,35,40)
	self:addTradeFlags(RecipeDB,37836,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,37836,1,1355,1,1382,1,1430,1,1699,1,3026,1,3067,1,3087,1,3399,1,4210,1,4552,1,5159,1,5482,1,6286,1,8306,1,16253,1,16277,1,16676,1,16719,1,17246,1,18987,1,18988,1,18993,1,19185,1,19369)

	-- Mok'Nathal Shortribs -- 38867
	self:addTradeSkill(RecipeDB,38867,335,31672,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,38867,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38867,4,10860,2,20916,2,21113)

	-- Crunchy Serpent -- 38868
	self:addTradeSkill(RecipeDB,38868,335,31673,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,38868,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,38868,4,10860,2,20916,2,21113)

	-- Stewed Trout -- 42296
	self:addTradeSkill(RecipeDB,42296,320,33048,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,42296,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42296,1,19186)

	-- Fisherman's Feast -- 42302
	self:addTradeSkill(RecipeDB,42302,350,33052,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,42302,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42302,1,19186)

	-- Hot Buttered Trout -- 42305
	self:addTradeSkill(RecipeDB,42305,350,33053,1,2550,nil,1)
	self:addTradeFlags(RecipeDB,42305,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,42305,1,19186)

	-- Skullfish Soup -- 43707
	self:addTradeSkill(RecipeDB,43707,325,33825,2,2550,nil,1)
	self:addTradeFlags(RecipeDB,43707,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43707,8,6)

	-- Stormchops -- 43758
	self:addTradeSkill(RecipeDB,43758,300,33866,3,2550,nil,1)
	self:addTradeFlags(RecipeDB,43758,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43758,8,5,8,6,8,38)

	-- Broiled Bloodfin -- 43761
	self:addTradeSkill(RecipeDB,43761,300,33867,2,2550,nil,1)
	self:addTradeFlags(RecipeDB,43761,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43761,8,6)

	-- Spicy Hot Talbuk -- 43765
	self:addTradeSkill(RecipeDB,43765,325,33872,2,2550,nil,1)
	self:addTradeFlags(RecipeDB,43765,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43765,8,5)

	-- Kibler's Bits -- 43772
	self:addTradeSkill(RecipeDB,43772,300,33874,2,2550,nil,1)
	self:addTradeFlags(RecipeDB,43772,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43772,8,5)

	-- Delicious Chocolate Cake -- 43779
	self:addTradeSkill(RecipeDB,43779,1,33924,3,2550,nil,1)
	self:addTradeFlags(RecipeDB,43779,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43779,8,5,8,6,8,38)

	-- Hot Apple Cider -- 45022
	self:addTradeSkill(RecipeDB,45022,325,34411,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45022,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45022,5,1,2,13420,2,13433)

	-- Mammoth Meal -- 45549
	self:addTradeSkill(RecipeDB,45549,350,34748,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45549,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45549,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Shoveltusk Steak -- 45550
	self:addTradeSkill(RecipeDB,45550,350,34749,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45550,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45550,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Wyrm Delight -- 45551
	self:addTradeSkill(RecipeDB,45551,350,34750,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45551,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45551,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Roasted Worg -- 45552
	self:addTradeSkill(RecipeDB,45552,350,34751,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45552,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Rhino Dogs -- 45553
	self:addTradeSkill(RecipeDB,45553,350,34752,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45553,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45553,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Feast -- 45554
	self:addTradeSkill(RecipeDB,45554,375,34753,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45554,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,45554,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Mega Mammoth Meal -- 45555
	self:addTradeSkill(RecipeDB,45555,400,34754,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45555,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,45555,2,31031,2,31032)

	-- Tender Shoveltusk Steak -- 45556
	self:addTradeSkill(RecipeDB,45556,400,34755,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45556,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,45556,2,31031,2,31032)

	-- Spiced Wyrm Burger -- 45557
	self:addTradeSkill(RecipeDB,45557,400,34756,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45557,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45557,2,31031,2,31032)

	-- Very Burnt Worg -- 45558
	self:addTradeSkill(RecipeDB,45558,400,34757,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45558,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45558,2,31031,2,31032)

	-- Mighty Rhino Dogs -- 45559
	self:addTradeSkill(RecipeDB,45559,400,34758,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45559,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45559,2,31031,2,31032)

	-- Smoked Rockfin -- 45560
	self:addTradeSkill(RecipeDB,45560,350,34759,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45560,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45560,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Grilled Bonescale -- 45561
	self:addTradeSkill(RecipeDB,45561,350,34760,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45561,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45561,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Sauteed Goby -- 45562
	self:addTradeSkill(RecipeDB,45562,350,34761,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45562,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45562,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Grilled Sculpin -- 45563
	self:addTradeSkill(RecipeDB,45563,350,34762,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45563,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45563,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Smoked Salmon -- 45564
	self:addTradeSkill(RecipeDB,45564,350,34763,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45564,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45564,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Poached Nettlefish -- 45565
	self:addTradeSkill(RecipeDB,45565,350,34764,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45565,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45565,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Pickled Fangtooth -- 45566
	self:addTradeSkill(RecipeDB,45566,350,34765,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45566,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45566,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Poached Northern Sculpin -- 45567
	self:addTradeSkill(RecipeDB,45567,400,34766,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45567,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,45567,2,31031,2,31032)

	-- Firecracker Salmon -- 45568
	self:addTradeSkill(RecipeDB,45568,400,34767,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45568,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,45568,2,31031,2,31032)

	-- Baked Manta Ray -- 45569
	self:addTradeSkill(RecipeDB,45569,350,42942,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,45569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45569,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Imperial Manta Steak -- 45570
	self:addTradeSkill(RecipeDB,45570,400,34769,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45570,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45570,2,31031,2,31032)

	-- Spicy Blue Nettlefish -- 45571
	self:addTradeSkill(RecipeDB,45571,400,34768,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45571,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45571,2,31031,2,31032)

	-- Captain Rumsey's Lager -- 45695
	self:addTradeSkill(RecipeDB,45695,100,34832,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,45695,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45695,8,7)

	-- Charred Bear Kabobs -- 46684
	self:addTradeSkill(RecipeDB,46684,250,35563,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,46684,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,46684,2,2803,2,2806)

	-- Juicy Bear Burger -- 46688
	self:addTradeSkill(RecipeDB,46688,250,35565,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,46688,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,46688,2,2803,2,2806)

	-- Kungaloosh -- 53056
	self:addTradeSkill(RecipeDB,53056,375,39520,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,53056,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53056,4,13571,8,36)

	-- Fish Feast -- 57423
	self:addTradeSkill(RecipeDB,57423,450,43015,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,57423,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,57423,2,31031,2,31032)

	-- Worg Tartare -- 62350
	self:addTradeSkill(RecipeDB,62350,400,44953,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,62350,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,62350,2,31031,2,31032)

	-- Northern Stew -- 57421
	self:addTradeSkill(RecipeDB,57421,350,34747,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,57421,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,51,52,53,54)
	self:addTradeAcquire(RecipeDB,57421,4,13087,4,13088,4,13089,4,13090)

	-- Spicy Fried Herring -- 57433
	self:addTradeSkill(RecipeDB,57433,400,42993,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57433,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57433,2,31031,2,31032)

	-- Rhinolicious Wyrmsteak -- 57434
	self:addTradeSkill(RecipeDB,57434,400,42994,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57434,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,57434,2,31031,2,31032)

	-- Critter Bites -- 57435
	self:addTradeSkill(RecipeDB,57435,400,43004,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57435,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57435,2,31031,2,31032)

	-- Hearty Rhino -- 57436
	self:addTradeSkill(RecipeDB,57436,400,42995,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57436,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,57436,2,31031,2,31032)

	-- Snapper Extreme -- 57437
	self:addTradeSkill(RecipeDB,57437,400,42996,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57437,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57437,2,31031,2,31032)

	-- Blackened Worg Steak -- 57438
	self:addTradeSkill(RecipeDB,57438,400,42997,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57438,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57438,2,31031,2,31032)

	-- Cuttlesteak -- 57439
	self:addTradeSkill(RecipeDB,57439,400,42998,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57439,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,57439,2,31031,2,31032)

	-- Spiced Mammoth Treats -- 57440
	self:addTradeSkill(RecipeDB,57440,400,43005,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57440,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,57440,2,31031,2,31032)

	-- Blackened Dragonfin -- 57441
	self:addTradeSkill(RecipeDB,57441,400,42999,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57441,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,57441,2,31031,2,31032)

	-- Dragonfin Filet -- 57442
	self:addTradeSkill(RecipeDB,57442,400,43000,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57442,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,57442,2,31031,2,31032)

	-- Tracker Snacks -- 57443
	self:addTradeSkill(RecipeDB,57443,400,43001,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,57443,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57443,2,31031,2,31032)

	-- Dalaran Clam Chowder -- 58065
	self:addTradeSkill(RecipeDB,58065,350,43268,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,58065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58065,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Tasty Cupcake -- 58512
	self:addTradeSkill(RecipeDB,58512,350,43490,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58512,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58512,7,2)

	-- Last Week's Mammoth -- 58521
	self:addTradeSkill(RecipeDB,58521,350,43488,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58521,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58521,7,2)

	-- Bad Clams -- 58523
	self:addTradeSkill(RecipeDB,58523,350,43491,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58523,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58523,7,2)

	-- Haunted Herring -- 58525
	self:addTradeSkill(RecipeDB,58525,350,43492,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58525,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58525,7,2)

	-- Gigantic Feast -- 58527
	self:addTradeSkill(RecipeDB,58527,425,43478,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58527,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58527,2,31031,2,31032)

	-- Small Feast -- 58528
	self:addTradeSkill(RecipeDB,58528,425,43480,2,2550,nil,2)
	self:addTradeFlags(RecipeDB,58528,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,58528,2,31031,2,31032)

	-- Dig Rat Stew -- 6417
	self:addTradeSkill(RecipeDB,6417,90,44977,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,6417,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6417,4,862,2,3392)

	-- Black Jelly -- 64358
	self:addTradeSkill(RecipeDB,64358,400,45932,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,64358,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,64358,1,26905,1,26953,1,26972,1,26989,1,28705,1,29631,1,33587)

	-- Clamlette Magnifique -- 64054
	self:addTradeSkill(RecipeDB,64054,225,33004,1,2550,nil,2)
	self:addTradeFlags(RecipeDB,64054,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,64054,4,6610)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Pumpkin Pie -- 62044
		self:addTradeSkill(RecipeDB,62044,45,44839,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,62044,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,62044,5,5)

		-- Slow-Roasted Turkey -- 62045
		self:addTradeSkill(RecipeDB,62045,45,44839,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,62045,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,62045,5,5)

		-- Cranberry Chutney -- 62049
		self:addTradeSkill(RecipeDB,62049,25,44840,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,62049,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,62049,5,5)

		-- Spice Bread Stuffing -- 62050
		self:addTradeSkill(RecipeDB,62050,75,44837,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,62050,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,62050,5,5)

		-- Candied Yam -- 62051
		self:addTradeSkill(RecipeDB,62051,45,44839,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,62051,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,62051,5,5)

		-- Bread of the Dead -- 65454
		self:addTradeSkill(RecipeDB,65454,45,46691,1,2550,nil,2)
		self:addTradeFlags(RecipeDB,65454,1,2,7,21,22,23,24,25,26,27,28,29,30,36,41)
		self:addTradeAcquire(RecipeDB,65454,5,6)

		return 170

	else

		return 164

	end

end
