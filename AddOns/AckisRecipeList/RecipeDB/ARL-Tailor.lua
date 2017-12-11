--[[

************************************************************************

ARL-Tailor.lua

Tailoring data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-30T08:53:32Z 
File revision: 2263 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addTradeSkill(RecipeDB,Spell ID,Skill Level,Item ID,Rarity,Specialty)

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

function addon:InitTailoring(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Brown Linen Vest -- 2385
	self:addTradeSkill(RecipeDB,2385,10,2568,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2385,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,2385,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Linen Boots -- 2386
	self:addTradeSkill(RecipeDB,2386,65,2569,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2386,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2386,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Linen Cloak -- 2387
	self:addTradeSkill(RecipeDB,2387,1,2570,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2387,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2387,8,8)

	-- Red Linen Robe -- 2389
	self:addTradeSkill(RecipeDB,2389,40,2572,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,2389,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,2389,7,2)

	-- Red Linen Shirt -- 2392
	self:addTradeSkill(RecipeDB,2392,40,2575,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2392,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2392,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- White Linen Shirt -- 2393
	self:addTradeSkill(RecipeDB,2393,1,2576,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2393,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2393,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Blue Linen Shirt -- 2394
	self:addTradeSkill(RecipeDB,2394,40,2577,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2394,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2394,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Barbaric Linen Vest -- 2395
	self:addTradeSkill(RecipeDB,2395,70,2578,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2395,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2395,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Green Linen Shirt -- 2396
	self:addTradeSkill(RecipeDB,2396,70,2579,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2396,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2396,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Reinforced Linen Cape -- 2397
	self:addTradeSkill(RecipeDB,2397,60,2580,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2397,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2397,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Green Woolen Vest -- 2399
	self:addTradeSkill(RecipeDB,2399,85,2582,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2399,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,2399,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Woolen Boots -- 2401
	self:addTradeSkill(RecipeDB,2401,95,2583,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2401,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,2401,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Woolen Cape -- 2402
	self:addTradeSkill(RecipeDB,2402,75,2584,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2402,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2402,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Gray Woolen Robe -- 2403
	self:addTradeSkill(RecipeDB,2403,105,2585,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,2403,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,2403,7,2)

	-- Gray Woolen Shirt -- 2406
	self:addTradeSkill(RecipeDB,2406,100,2587,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2406,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2406,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Bolt of Linen Cloth -- 2963
	self:addTradeSkill(RecipeDB,2963,1,2996,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2963,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2963,8,8)

	-- Bolt of Woolen Cloth -- 2964
	self:addTradeSkill(RecipeDB,2964,75,2997,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,2964,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2964,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Linen Bag -- 3755
	self:addTradeSkill(RecipeDB,3755,45,4238,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3755,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3755,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,3704,1,33580,1,27001,1,33613,1,33636)

	-- Woolen Bag -- 3757
	self:addTradeSkill(RecipeDB,3757,80,4240,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3757,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3757,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Green Woolen Bag -- 3758
	self:addTradeSkill(RecipeDB,3758,95,4241,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3758,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3758,7,2)

	-- Small Silk Pack -- 3813
	self:addTradeSkill(RecipeDB,3813,150,4245,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3813,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3813,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Bolt of Silk Cloth -- 3839
	self:addTradeSkill(RecipeDB,3839,125,4305,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3839,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3839,1,1346,1,3004,1,3363,1,4576,1,5153,1,5567,1,11049,1,11557,1,16640,1,16729,1,17487,1,18749,1,18772,1,28699,
	1,4159,1,3484,1,3704,1,2627,1,33580,1,1103,1,27001,1,33613,1,33636,1,11052)

	-- Heavy Linen Gloves -- 3840
	self:addTradeSkill(RecipeDB,3840,35,4307,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3840,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3840,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Green Linen Bracers -- 3841
	self:addTradeSkill(RecipeDB,3841,60,4308,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3841,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Handstitched Linen Britches -- 3842
	self:addTradeSkill(RecipeDB,3842,70,4309,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3842,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3842,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Heavy Woolen Gloves -- 3843
	self:addTradeSkill(RecipeDB,3843,85,4310,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3843,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3843,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Heavy Woolen Cloak -- 3844
	self:addTradeSkill(RecipeDB,3844,100,4311,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3844,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,3844,7,2)

	-- Soft-soled Linen Boots -- 3845
	self:addTradeSkill(RecipeDB,3845,80,4312,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3845,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3845,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Red Woolen Boots -- 3847
	self:addTradeSkill(RecipeDB,3847,95,4313,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3847,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3847,7,2)

	-- Double-stitched Woolen Shoulders -- 3848
	self:addTradeSkill(RecipeDB,3848,110,4314,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3848,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3848,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Reinforced Woolen Shoulders -- 3849
	self:addTradeSkill(RecipeDB,3849,120,4315,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3849,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3849,7,2)

	-- Heavy Woolen Pants -- 3850
	self:addTradeSkill(RecipeDB,3850,110,4316,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3850,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3850,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Phoenix Pants -- 3851
	self:addTradeSkill(RecipeDB,3851,125,4317,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3851,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3851,7,2)

	-- Gloves of Meditation -- 3852
	self:addTradeSkill(RecipeDB,3852,130,4318,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3852,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3852,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Azure Silk Gloves -- 3854
	self:addTradeSkill(RecipeDB,3854,145,4319,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3854,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3854,2,2679,2,9636)

	-- Spidersilk Boots -- 3855
	self:addTradeSkill(RecipeDB,3855,125,4320,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3855,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3855,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Spider Silk Slippers -- 3856
	self:addTradeSkill(RecipeDB,3856,140,4321,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3856,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3856,7,2)

	-- Enchanter's Cowl -- 3857
	self:addTradeSkill(RecipeDB,3857,165,4322,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3857,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3857,2,2670)

	-- Shadow Hood -- 3858
	self:addTradeSkill(RecipeDB,3858,170,4323,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3858,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3858,7,2)

	-- Azure Silk Vest -- 3859
	self:addTradeSkill(RecipeDB,3859,150,4324,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3859,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,3859,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,
	1,17487,1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Boots of the Enchanter -- 3860
	self:addTradeSkill(RecipeDB,3860,175,4325,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3860,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3860,7,2)

	-- Long Silken Cloak -- 3861
	self:addTradeSkill(RecipeDB,3861,185,4326,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3861,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,3861,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Icy Cloak -- 3862
	self:addTradeSkill(RecipeDB,3862,200,4327,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3862,1,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,3862,2,2381)

	-- Spider Belt -- 3863
	self:addTradeSkill(RecipeDB,3863,180,4328,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3863,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,3863,7,2)

	-- Star Belt -- 3864
	self:addTradeSkill(RecipeDB,3864,200,4329,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3864,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3864,7,2)

	-- Bolt of Mageweave -- 3865
	self:addTradeSkill(RecipeDB,3865,175,4339,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3865,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3865,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Stylish Red Shirt -- 3866
	self:addTradeSkill(RecipeDB,3866,110,4330,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3866,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3866,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,1,18749,
	1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Phoenix Gloves -- 3868
	self:addTradeSkill(RecipeDB,3868,125,4331,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,3868,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,3868,7,2)

	-- Bright Yellow Shirt -- 3869
	self:addTradeSkill(RecipeDB,3869,135,4332,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3869,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3869,2,2668)

	-- Dark Silk Shirt -- 3870
	self:addTradeSkill(RecipeDB,3870,155,4333,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3870,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3870,2,2394,2,2669)

	-- Formal White Shirt -- 3871
	self:addTradeSkill(RecipeDB,3871,170,4334,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3871,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3871,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

    -- Rich Purple Silk Shirt -- 3872
	self:addTradeSkill(RecipeDB,3872,185,4335,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,3872,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3872,7,2) 

	-- Black Swashbuckler's Shirt -- 3873
	self:addTradeSkill(RecipeDB,3873,200,4336,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3873,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3873,2,2663)

	-- Brown Linen Pants -- 3914
	self:addTradeSkill(RecipeDB,3914,30,4343,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3914,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3914,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Brown Linen Shirt -- 3915
	self:addTradeSkill(RecipeDB,3915,1,4344,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,3915,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3915,8,8)

	-- Pearl-clasped Cloak -- 6521
	self:addTradeSkill(RecipeDB,6521,90,5542,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,6521,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,6521,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Red Linen Bag -- 6686
	self:addTradeSkill(RecipeDB,6686,70,5762,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,6686,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6686,3,590,3,3530,3,3531,2,843,2,3005,2,4189,2,16224)

	-- Red Woolen Bag -- 6688
	self:addTradeSkill(RecipeDB,6688,115,5763,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,6688,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6688,3,450,3,2264,2,777,2,1454,2,1474,2,3005,2,3364,2,3485,2,3537,2,3683,2,4189,2,4577,2,5944)

	-- Lesser Wizard's Robe -- 6690
	self:addTradeSkill(RecipeDB,6690,135,5766,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,6690,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,6690,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Robes of Arcana -- 6692
	self:addTradeSkill(RecipeDB,6692,150,5770,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,6692,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,6692,3,910,3,2337,3,10760)

	-- Green Silk Pack -- 6693
	self:addTradeSkill(RecipeDB,6693,175,5764,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,6693,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6693,7,2)

	-- Black Silk Pack -- 6695
	self:addTradeSkill(RecipeDB,6695,185,5765,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,6695,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,6695,3,2242,3,2434,3,4834)

	-- Brown Linen Robe -- 7623
	self:addTradeSkill(RecipeDB,7623,30,6238,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7623,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7623,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- White Linen Robe -- 7624
	self:addTradeSkill(RecipeDB,7624,30,6241,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7624,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,7624,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Red Linen Vest -- 7629
	self:addTradeSkill(RecipeDB,7629,55,6239,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,7629,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7629,7,2)

	-- Blue Linen Vest -- 7630
	self:addTradeSkill(RecipeDB,7630,55,6240,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7630,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7630,2,66,2,3364,2,3485,2,3522,2,4189)

	-- Blue Linen Robe -- 7633
	self:addTradeSkill(RecipeDB,7633,70,6242,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7633,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7633,2,1250,2,3485,2,4168)

	-- Blue Overalls -- 7639
	self:addTradeSkill(RecipeDB,7639,100,6263,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7639,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7639,2,843,2,1347,2,2394)

	-- Greater Adept's Robe -- 7643
	self:addTradeSkill(RecipeDB,7643,115,6264,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,7643,1,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,7643,2,1454,2,1474,2,4168)

	-- Stylish Blue Shirt -- 7892
	self:addTradeSkill(RecipeDB,7892,120,6384,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,7892,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7892,7,2)

	-- Stylish Green Shirt -- 7893
	self:addTradeSkill(RecipeDB,7893,120,6385,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,7893,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7893,7,2)

	-- Simple Dress -- 8465
	self:addTradeSkill(RecipeDB,8465,40,6786,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8465,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- White Woolen Dress -- 8467
	self:addTradeSkill(RecipeDB,8467,110,6787,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8467,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- White Swashbuckler's Shirt -- 8483
	self:addTradeSkill(RecipeDB,8483,160,6795,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8483,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8483,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Red Swashbuckler's Shirt -- 8489
	self:addTradeSkill(RecipeDB,8489,175,6796,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8489,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8489,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Azure Silk Pants -- 8758
	self:addTradeSkill(RecipeDB,8758,140,7046,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8758,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8758,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Azure Silk Hood -- 8760
	self:addTradeSkill(RecipeDB,8760,145,7048,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8760,1,1346,1,2399,1,2627,1,3004,1,3363,1,3704,1,4159,1,4576,1,5153,1,5567,1,11049,1,11052,1,11557,1,16640,1,16729,1,17487,
	1,18749,1,18772,1,28699,1,3484,1,33580,1,1103,1,27001,1,33613,1,33636)

	-- Silk Headband -- 8762
	self:addTradeSkill(RecipeDB,8762,160,7050,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8762,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8762,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Earthen Vest -- 8764
	self:addTradeSkill(RecipeDB,8764,170,7051,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8764,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Azure Silk Belt -- 8766
	self:addTradeSkill(RecipeDB,8766,175,7052,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8766,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,4159)

	-- Robe of Power -- 8770
	self:addTradeSkill(RecipeDB,8770,190,7054,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8770,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8770,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,4159)

	-- Crimson Silk Belt -- 8772
	self:addTradeSkill(RecipeDB,8772,175,7055,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8772,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8772,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Green Silken Shoulders -- 8774
	self:addTradeSkill(RecipeDB,8774,180,7057,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8774,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8774,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,4159)

	-- Linen Belt -- 8776
	self:addTradeSkill(RecipeDB,8776,15,7026,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8776,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,8776,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Hands of Darkness -- 8780
	self:addTradeSkill(RecipeDB,8780,145,7047,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8780,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8780,7,2)

	-- Truefaith Gloves -- 8782
	self:addTradeSkill(RecipeDB,8782,150,7049,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8782,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8782,7,2)

	-- Green Silk Armor -- 8784
	self:addTradeSkill(RecipeDB,8784,165,7065,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8784,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,8784,7,2)

	-- Azure Silk Cloak -- 8786
	self:addTradeSkill(RecipeDB,8786,175,7053,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8786,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,8786,2,6574,2,6576)

	-- Crimson Silk Cloak -- 8789
	self:addTradeSkill(RecipeDB,8789,180,7056,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8789,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,8789,2,2670)

	-- Crimson Silk Vest -- 8791
	self:addTradeSkill(RecipeDB,8791,185,7058,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8791,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8791,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636,1,4159)

	-- Crimson Silk Shoulders -- 8793
	self:addTradeSkill(RecipeDB,8793,190,7059,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8793,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8793,7,2)

	-- Azure Shoulders -- 8795
	self:addTradeSkill(RecipeDB,8795,190,7060,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8795,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8795,7,2)

	-- Earthen Silk Belt -- 8797
	self:addTradeSkill(RecipeDB,8797,195,7061,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,8797,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8797,7,2)

	-- Crimson Silk Pantaloons -- 8799
	self:addTradeSkill(RecipeDB,8799,195,7062,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8799,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,8799,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Crimson Silk Robe -- 8802
	self:addTradeSkill(RecipeDB,8802,205,7063,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8802,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,8802,2,6568)

	-- Crimson Silk Gloves -- 8804
	self:addTradeSkill(RecipeDB,8804,210,7064,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,8804,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,8804,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,33613,1,33636,1,27001)

	-- Simple Linen Pants -- 12044
	self:addTradeSkill(RecipeDB,12044,1,10045,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12044,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12044,8,8)

	-- Simple Linen Boots -- 12045
	self:addTradeSkill(RecipeDB,12045,20,10046,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12045,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12045,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Simple Kilt -- 12046
	self:addTradeSkill(RecipeDB,12046,75,10047,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12046,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12046,1,1103,1,1300,1,1346,1,1703,1,2399,1,2627,1,2855,1,3004,1,3363,1,3484,1,3523,1,3704,1,4159,1,4193,1,4576,1,5153,1,5567,
	1,11048,1,11049,1,11050,1,11051,1,11052,1,11557,1,16366,1,16639,1,16640,1,16729,1,16746,1,17487,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Colorful Kilt -- 12047
	self:addTradeSkill(RecipeDB,12047,120,10048,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12047,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12047,7,2)

	-- Black Mageweave Vest -- 12048
	self:addTradeSkill(RecipeDB,12048,205,9998,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12048,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12048,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Black Mageweave Leggings -- 12049
	self:addTradeSkill(RecipeDB,12049,205,9999,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12049,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12049,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Black Mageweave Robe -- 12050
	self:addTradeSkill(RecipeDB,12050,210,10001,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12050,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12050,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Shadoweave Pants -- 12052
	self:addTradeSkill(RecipeDB,12052,210,10002,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12052,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12052,1,4578,1,9584)

	-- Black Mageweave Gloves -- 12053
	self:addTradeSkill(RecipeDB,12053,215,10003,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12053,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12053,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Shadoweave Robe -- 12055
	self:addTradeSkill(RecipeDB,12055,215,10004,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12055,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12055,1,4578,1,9584)

	-- Red Mageweave Vest -- 12056
	self:addTradeSkill(RecipeDB,12056,215,10007,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12056,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12056,7,2)

	-- White Bandit Mask -- 12059
	self:addTradeSkill(RecipeDB,12059,215,10008,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12059,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12059,7,2)

	-- Red Mageweave Pants -- 12060
	self:addTradeSkill(RecipeDB,12060,215,10009,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12060,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12060,7,2)

	-- Orange Mageweave Shirt -- 12061
	self:addTradeSkill(RecipeDB,12061,215,10056,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12061,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12061,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Orange Martial Shirt -- 12064
	self:addTradeSkill(RecipeDB,12064,220,10052,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12064,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12064,2,3005,2,4168)

	-- Mageweave Bag -- 12065
	self:addTradeSkill(RecipeDB,12065,225,10050,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12065,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Red Mageweave Gloves -- 12066
	self:addTradeSkill(RecipeDB,12066,225,10018,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12066,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12066,7,2)

	-- Dreamweave Gloves -- 12067
	self:addTradeSkill(RecipeDB,12067,225,10019,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12067,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12067,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cindercloth Robe -- 12069
	self:addTradeSkill(RecipeDB,12069,225,10042,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12069,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12069,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Dreamweave Vest -- 12070
	self:addTradeSkill(RecipeDB,12070,225,10021,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12070,1,1346,1,2399,1,4576,1,11052,1,11557,1,18749,1,18772,1,28699,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Shadoweave Gloves -- 12071
	self:addTradeSkill(RecipeDB,12071,225,10023,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12071,1,4578,1,9584)

	-- Black Mageweave Headband -- 12072
	self:addTradeSkill(RecipeDB,12072,230,10024,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12072,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12072,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Black Mageweave Boots -- 12073
	self:addTradeSkill(RecipeDB,12073,230,10026,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12073,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12073,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Black Mageweave Shoulders -- 12074
	self:addTradeSkill(RecipeDB,12074,230,10027,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12074,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12074,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Lavender Mageweave Shirt -- 12075
	self:addTradeSkill(RecipeDB,12075,230,10054,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12075,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12075,2,3364,2,8681)

	-- Shadoweave Shoulders -- 12076
	self:addTradeSkill(RecipeDB,12076,235,10028,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12076,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12076,1,4578,1,9584)

	-- Simple Black Dress -- 12077
	self:addTradeSkill(RecipeDB,12077,235,10053,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12077,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12077,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Red Mageweave Shoulders -- 12078
	self:addTradeSkill(RecipeDB,12078,235,10029,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12078,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12078,7,2)

	-- Red Mageweave Bag -- 12079
	self:addTradeSkill(RecipeDB,12079,235,10051,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12079,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12079,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Pink Mageweave Shirt -- 12080
	self:addTradeSkill(RecipeDB,12080,235,10055,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12080,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12080,2,3364,2,8681)

	-- Admiral's Hat -- 12081
	self:addTradeSkill(RecipeDB,12081,240,10030,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12081,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12081,2,2672)

	-- Shadoweave Boots -- 12082
	self:addTradeSkill(RecipeDB,12082,240,10031,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12082,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12082,1,4578,1,9584)

	-- Red Mageweave Headband -- 12084
	self:addTradeSkill(RecipeDB,12084,240,10033,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12084,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12084,7,2)

	-- Tuxedo Shirt -- 12085
	self:addTradeSkill(RecipeDB,12085,240,10034,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12085,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12085,2,4577,2,8681)

	-- Shadoweave Mask -- 12086
	self:addTradeSkill(RecipeDB,12086,245,10025,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,12086,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,12086,4,3402)

	-- Cindercloth Boots -- 12088
	self:addTradeSkill(RecipeDB,12088,245,10044,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12088,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12088,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Tuxedo Pants -- 12089
	self:addTradeSkill(RecipeDB,12089,245,10035,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12089,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12089,2,4577,2,8681)

	-- White Wedding Dress -- 12091
	self:addTradeSkill(RecipeDB,12091,250,10040,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12091,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12091,2,1347,2,3005)

	-- Dreamweave Circlet -- 12092
	self:addTradeSkill(RecipeDB,12092,250,10041,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12092,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,12092,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Tuxedo Jacket -- 12093
	self:addTradeSkill(RecipeDB,12093,250,10036,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,12093,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12093,2,4577,2,8681)

	-- Bolt of Runecloth -- 18401
	self:addTradeSkill(RecipeDB,18401,250,14048,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18401,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18401,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Runecloth Belt -- 18402
	self:addTradeSkill(RecipeDB,18402,255,13856,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18402,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18402,1,2399,1,11052,1,11557,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Frostweave Tunic -- 18403
	self:addTradeSkill(RecipeDB,18403,255,13869,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18403,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18403,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Frostweave Robe -- 18404
	self:addTradeSkill(RecipeDB,18404,255,13868,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18404,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18404,7,2)

	-- Runecloth Bag -- 18405
	self:addTradeSkill(RecipeDB,18405,260,14046,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18405,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18405,2,11189)

	-- Runecloth Robe -- 18406
	self:addTradeSkill(RecipeDB,18406,260,13858,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18406,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18406,1,2399,1,11052,1,18749,1,18772,2,7940,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Runecloth Tunic -- 18407
	self:addTradeSkill(RecipeDB,18407,260,13857,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18407,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18407,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cindercloth Vest -- 18408
	self:addTradeSkill(RecipeDB,18408,260,14042,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18408,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18408,3,5861)

	-- Runecloth Cloak -- 18409
	self:addTradeSkill(RecipeDB,18409,265,13860,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18409,1,2,3,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,18409,1,2399,1,11052,1,18749,1,18772,2,7940,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Ghostweave Belt -- 18410
	self:addTradeSkill(RecipeDB,18410,265,14143,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18410,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18410,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Frostweave Gloves -- 18411
	self:addTradeSkill(RecipeDB,18411,265,13870,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18411,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18411,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cindercloth Gloves -- 18412
	self:addTradeSkill(RecipeDB,18412,270,14043,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18412,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18412,3,5861)

	-- Ghostweave Gloves -- 18413
	self:addTradeSkill(RecipeDB,18413,270,14142,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18413,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18413,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Brightcloth Robe -- 18414
	self:addTradeSkill(RecipeDB,18414,270,14100,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18414,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18414,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Brightcloth Gloves -- 18415
	self:addTradeSkill(RecipeDB,18415,270,14101,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18415,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18415,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Ghostweave Vest -- 18416
	self:addTradeSkill(RecipeDB,18416,275,14141,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18416,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18416,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Runecloth Gloves -- 18417
	self:addTradeSkill(RecipeDB,18417,275,13863,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18417,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18417,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cindercloth Cloak -- 18418
	self:addTradeSkill(RecipeDB,18418,275,14044,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18418,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,18418,3,7037)

	-- Felcloth Pants -- 18419
	self:addTradeSkill(RecipeDB,18419,275,14107,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18419,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18419,2,12022)

	-- Brightcloth Cloak -- 18420
	self:addTradeSkill(RecipeDB,18420,275,14103,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18420,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,18420,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Wizardweave Leggings -- 18421
	self:addTradeSkill(RecipeDB,18421,275,14132,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18421,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18421,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cloak of Fire -- 18422
	self:addTradeSkill(RecipeDB,18422,275,14134,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18422,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,18422,3,9026)

	-- Runecloth Boots -- 18423
	self:addTradeSkill(RecipeDB,18423,280,13864,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18423,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18423,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Frostweave Pants -- 18424
	self:addTradeSkill(RecipeDB,18424,280,13871,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18424,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18424,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Cindercloth Pants -- 18434
	self:addTradeSkill(RecipeDB,18434,280,14045,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18434,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18434,3,7037)

	-- Robe of Winter Night -- 18436
	self:addTradeSkill(RecipeDB,18436,285,14136,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18436,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18436,3,7437)

	-- Felcloth Boots -- 18437
	self:addTradeSkill(RecipeDB,18437,285,14108,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18437,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18437,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Runecloth Pants -- 18438
	self:addTradeSkill(RecipeDB,18438,285,13865,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18438,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18438,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Brightcloth Pants -- 18439
	self:addTradeSkill(RecipeDB,18439,290,14104,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18439,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18439,7,2)

	-- Mooncloth Leggings -- 18440
	self:addTradeSkill(RecipeDB,18440,290,14137,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18440,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18440,7,2)

	-- Ghostweave Pants -- 18441
	self:addTradeSkill(RecipeDB,18441,290,14144,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18441,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18441,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Felcloth Hood -- 18442
	self:addTradeSkill(RecipeDB,18442,290,14111,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18442,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18442,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Runecloth Headband -- 18444
	self:addTradeSkill(RecipeDB,18444,295,13866,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18444,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18444,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Mooncloth Bag -- 18445
	self:addTradeSkill(RecipeDB,18445,300,14155,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18445,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18445,7,2)

	-- Wizardweave Robe -- 18446
	self:addTradeSkill(RecipeDB,18446,300,14128,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18446,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18446,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Mooncloth Vest -- 18447
	self:addTradeSkill(RecipeDB,18447,300,14138,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18447,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18447,7,2)

	-- Mooncloth Shoulders -- 18448
	self:addTradeSkill(RecipeDB,18448,300,14139,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18448,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18448,7,2)

	-- Runecloth Shoulders -- 18449
	self:addTradeSkill(RecipeDB,18449,300,13867,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18449,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18449,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Wizardweave Turban -- 18450
	self:addTradeSkill(RecipeDB,18450,300,14130,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18450,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,18450,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Felcloth Robe -- 18451
	self:addTradeSkill(RecipeDB,18451,300,14106,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18451,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18451,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Mooncloth Circlet -- 18452
	self:addTradeSkill(RecipeDB,18452,300,14140,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18452,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18452,7,2)

	-- Felcloth Shoulders -- 18453
	self:addTradeSkill(RecipeDB,18453,300,14112,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,18453,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18453,1,2399,1,11052,1,18749,1,18772,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,27001,1,33613,1,33636)

	-- Gloves of Spell Mastery -- 18454
	self:addTradeSkill(RecipeDB,18454,300,14146,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,18454,1,2,6,11,24,26,29,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18454,7,2)

	-- Bottomless Bag -- 18455
	self:addTradeSkill(RecipeDB,18455,300,14156,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,18455,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18455,7,2)

	-- Truefaith Vestments -- 18456
	self:addTradeSkill(RecipeDB,18456,300,14154,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,18456,1,2,5,26,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18456,3,10813)

	-- Robe of the Archmage -- 18457
	self:addTradeSkill(RecipeDB,18457,300,14152,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,18457,1,2,5,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,18457,3,9264)

	-- Robe of the Void -- 18458
	self:addTradeSkill(RecipeDB,18458,300,14153,4,3908,nil,0,300,315,330,345)
	self:addTradeFlags(RecipeDB,18458,1,2,5,21,22,23,24,25,26,27,28,29,30,37,40,53,54,56)
	self:addTradeAcquire(RecipeDB,18458,3,1853)

	-- Mooncloth -- 18560
	self:addTradeSkill(RecipeDB,18560,250,14342,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,18560,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,18560,2,11189)

	-- Mooncloth Boots -- 19435
	self:addTradeSkill(RecipeDB,19435,290,15802,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,19435,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,19435,4,6032)

	-- Flarecore Mantle -- 20848
	self:addTradeSkill(RecipeDB,20848,300,16980,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,20848,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,20848,6,59,2,12944)

	-- Flarecore Gloves -- 20849
	self:addTradeSkill(RecipeDB,20849,300,16979,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,20849,1,2,4,24,26,29,36,41,56,98)
	self:addTradeAcquire(RecipeDB,20849,6,59,1,12944)

	-- Green Holiday Shirt -- 21945
	self:addTradeSkill(RecipeDB,21945,190,17723,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,21945,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21945,5,1)

	-- Flarecore Wraps -- 22759
	self:addTradeSkill(RecipeDB,22759,300,18263,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,22759,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,22759,8,26)

	-- Gordok Ogre Suit -- 22813
	self:addTradeSkill(RecipeDB,22813,275,18258,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,22813,1,2,5,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22813,4,5518)

	-- Belt of the Archmage -- 22866
	self:addTradeSkill(RecipeDB,22866,300,18405,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,22866,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,22866,8,23)

	-- Felcloth Gloves -- 22867
	self:addTradeSkill(RecipeDB,22867,300,18407,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,22867,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22867,8,23)

	-- Inferno Gloves -- 22868
	self:addTradeSkill(RecipeDB,22868,300,18408,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,22868,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22868,8,23)

	-- Mooncloth Gloves -- 22869
	self:addTradeSkill(RecipeDB,22869,300,18409,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,22869,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,22869,8,23)

	-- Cloak of Warding -- 22870
	self:addTradeSkill(RecipeDB,22870,300,18413,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,22870,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,52,60)
	self:addTradeAcquire(RecipeDB,22870,8,23)

	-- Mooncloth Robe -- 22902
	self:addTradeSkill(RecipeDB,22902,300,18486,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,22902,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,22902,2,14371)

	-- Wisdom of the Timbermaw -- 23662
	self:addTradeSkill(RecipeDB,23662,290,19047,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23662,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,99)
	self:addTradeAcquire(RecipeDB,23662,6,576,2,11557)

	-- Mantle of the Timbermaw -- 23663
	self:addTradeSkill(RecipeDB,23663,300,19050,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23663,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,99)
	self:addTradeAcquire(RecipeDB,23663,6,576,3,11557)

	-- Argent Boots -- 23664
	self:addTradeSkill(RecipeDB,23664,290,19056,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23664,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,53,54,96)
	self:addTradeAcquire(RecipeDB,23664,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Argent Shoulders -- 23665
	self:addTradeSkill(RecipeDB,23665,300,19059,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23665,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,53,54,96)
	self:addTradeAcquire(RecipeDB,23665,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Flarecore Robe -- 23666
	self:addTradeSkill(RecipeDB,23666,300,19156,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23666,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,23666,6,59,2,12944)

	-- Flarecore Leggings -- 23667
	self:addTradeSkill(RecipeDB,23667,300,19165,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,23667,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,98)
	self:addTradeAcquire(RecipeDB,23667,6,59,3,12944)

	-- Bloodvine Vest -- 24091
	self:addTradeSkill(RecipeDB,24091,300,19682,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,24091,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24091,6,270,3,14921)

	-- Bloodvine Leggings -- 24092
	self:addTradeSkill(RecipeDB,24092,300,19683,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,24092,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24092,6,270,2,14921)

	-- Bloodvine Boots -- 24093
	self:addTradeSkill(RecipeDB,24093,300,19684,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,24093,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,100)
	self:addTradeAcquire(RecipeDB,24093,6,270,1,14921)

	-- Runed Stygian Leggings -- 24901
	self:addTradeSkill(RecipeDB,24901,300,20538,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,24901,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,24901,4,8323)

	-- Runed Stygian Belt -- 24902
	self:addTradeSkill(RecipeDB,24902,300,20539,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,24902,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,24902,4,8323)

	-- Runed Stygian Boots -- 24903
	self:addTradeSkill(RecipeDB,24903,300,20537,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,24903,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,24903,4,8323)

	-- Soul Pouch -- 26085
	self:addTradeSkill(RecipeDB,26085,260,21340,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,26085,1,2,4,29,36,40)
	self:addTradeAcquire(RecipeDB,26085,2,6568)

	-- Felcloth Bag -- 26086
	self:addTradeSkill(RecipeDB,26086,280,21341,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,26086,1,2,5,29,36,41)
	self:addTradeAcquire(RecipeDB,26086,3,10503,8,30)

	-- Core Felcloth Bag -- 26087
	self:addTradeSkill(RecipeDB,26087,300,21342,3,3908,nil,0)
	self:addTradeFlags(RecipeDB,26087,1,2,6,11,29,36,40)
	self:addTradeAcquire(RecipeDB,26087,8,26)

	-- Festival Dress -- 26403
	self:addTradeSkill(RecipeDB,26403,250,21154,2,3908,nil,0,250,265,280,295)
	self:addTradeFlags(RecipeDB,26403,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,26403,5,2,2,15909)

	-- Festive Red Pant Suit -- 26407
	self:addTradeSkill(RecipeDB,26407,250,21542,2,3908,nil,0,250,265,280,295)
	self:addTradeFlags(RecipeDB,26407,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26407,5,2,2,15909)

	-- Bolt of Netherweave -- 26745
	self:addTradeSkill(RecipeDB,26745,300,21840,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26745,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26745,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Bag -- 26746
	self:addTradeSkill(RecipeDB,26746,315,21841,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26746,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26746,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Bolt of Imbued Netherweave -- 26747
	self:addTradeSkill(RecipeDB,26747,325,21842,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26747,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26747,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Bag -- 26749
	self:addTradeSkill(RecipeDB,26749,340,21843,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26749,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26749,2,19015,2,19213)

	-- Bolt of Soulcloth -- 26750
	self:addTradeSkill(RecipeDB,26750,345,21844,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26750,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26750,2,16638,2,16767,2,19015,2,19017)

	-- Primal Mooncloth -- 26751
	self:addTradeSkill(RecipeDB,26751,350,21845,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26751,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,26751,2,22208,2,29512)

	-- Spellfire Belt -- 26752
	self:addTradeSkill(RecipeDB,26752,355,21846,1,3908,26797,1)
	self:addTradeFlags(RecipeDB,26752,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26752,2,22213,2,29511)

	-- Spellfire Gloves -- 26753
	self:addTradeSkill(RecipeDB,26753,365,21847,1,3908,26797,1)
	self:addTradeFlags(RecipeDB,26753,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26753,2,22213,2,29511)

	-- Spellfire Robe -- 26754
	self:addTradeSkill(RecipeDB,26754,375,21848,1,3908,26797,1)
	self:addTradeFlags(RecipeDB,26754,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26754,2,22213,2,29511)

	-- Spellfire Bag -- 26755
	self:addTradeSkill(RecipeDB,26755,375,21858,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,26755,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26755,3,20134,3,20135,2,22213,2,29511)

	-- Frozen Shadoweave Shoulders -- 26756
	self:addTradeSkill(RecipeDB,26756,355,21869,1,3908,26801,1)
	self:addTradeFlags(RecipeDB,26756,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26756,2,22212,2,29510)

	-- Frozen Shadoweave Boots -- 26757
	self:addTradeSkill(RecipeDB,26757,365,21870,1,3908,26801,1)
	self:addTradeFlags(RecipeDB,26757,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26757,2,22212,2,29510)

	-- Frozen Shadoweave Robe -- 26758
	self:addTradeSkill(RecipeDB,26758,375,21871,1,3908,26801,1)
	self:addTradeFlags(RecipeDB,26758,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26758,2,22212,2,29510)

	-- Ebon Shadowbag -- 26759
	self:addTradeSkill(RecipeDB,26759,375,21872,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,26759,1,2,4,29,36,41)
	self:addTradeAcquire(RecipeDB,26759,2,22212,2,29510)

	-- Primal Mooncloth Belt -- 26760
	self:addTradeSkill(RecipeDB,26760,355,21873,1,3908,26798,1)
	self:addTradeFlags(RecipeDB,26760,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26760,2,22208,2,29512)

	-- Primal Mooncloth Shoulders -- 26761
	self:addTradeSkill(RecipeDB,26761,365,21874,1,3908,26798,1)
	self:addTradeFlags(RecipeDB,26761,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26761,2,22208,2,29512)

	-- Primal Mooncloth Robe -- 26762
	self:addTradeSkill(RecipeDB,26762,375,21875,1,3908,26798,1)
	self:addTradeFlags(RecipeDB,26762,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26762,2,22208,2,29512)

	-- Primal Mooncloth Bag -- 26763
	self:addTradeSkill(RecipeDB,26763,375,21876,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,26763,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26763,3,18872,2,22208,2,29512)

	-- Netherweave Bracers -- 26764
	self:addTradeSkill(RecipeDB,26764,310,21849,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26764,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Belt -- 26765
	self:addTradeSkill(RecipeDB,26765,310,21850,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26765,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26765,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Gloves -- 26770
	self:addTradeSkill(RecipeDB,26770,320,21851,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26770,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26770,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Pants -- 26771
	self:addTradeSkill(RecipeDB,26771,325,21852,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26771,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26771,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Boots -- 26772
	self:addTradeSkill(RecipeDB,26772,335,21853,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26772,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26772,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Netherweave Robe -- 26773
	self:addTradeSkill(RecipeDB,26773,340,21854,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26773,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26773,2,16638,2,16767,2,19213)

	-- Netherweave Tunic -- 26774
	self:addTradeSkill(RecipeDB,26774,345,21855,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26774,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26774,2,16638,2,16767,2,19213)

	-- Imbued Netherweave Pants -- 26775
	self:addTradeSkill(RecipeDB,26775,340,21859,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26775,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26775,2,18011,2,19722)

	-- Imbued Netherweave Boots -- 26776
	self:addTradeSkill(RecipeDB,26776,350,21860,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26776,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26776,2,18011,2,19722)

	-- Imbued Netherweave Robe -- 26777
	self:addTradeSkill(RecipeDB,26777,360,21861,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26777,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26777,2,19521)

	-- Imbued Netherweave Tunic -- 26778
	self:addTradeSkill(RecipeDB,26778,360,21862,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26778,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26778,2,19521)

	-- Soulcloth Gloves -- 26779
	self:addTradeSkill(RecipeDB,26779,355,21863,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,26779,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,26779,2,19015,2,19017)

	-- Soulcloth Shoulders -- 26780
	self:addTradeSkill(RecipeDB,26780,365,21864,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,26780,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26780,3,16406)

	-- Soulcloth Vest -- 26781
	self:addTradeSkill(RecipeDB,26781,375,21865,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,26781,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,26781,3,16408)

	-- Arcanoweave Bracers -- 26782
	self:addTradeSkill(RecipeDB,26782,350,21866,2,3908,nil,1)
	self:addTradeFlags(RecipeDB,26782,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,26782,3,20869)

	-- Arcanoweave Boots -- 26783
	self:addTradeSkill(RecipeDB,26783,360,21867,2,3908,nil,1)
	self:addTradeFlags(RecipeDB,26783,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,26783,3,19168)

	-- Arcanoweave Robe -- 26784
	self:addTradeSkill(RecipeDB,26784,370,21868,2,3908,nil,1)
	self:addTradeFlags(RecipeDB,26784,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,26784,3,19220)

	-- Enchanted Mageweave Pouch -- 27658
	self:addTradeSkill(RecipeDB,27658,225,22246,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,27658,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27658,2,1318,2,3012,2,3346,2,4228,2,4617,2,5158,2,5757,2,5758,2,15419,2,16635,2,16722,2,18753,2,18773,2,18951,2,19234,2,19537,2,19540,2,19663,2,26569,2,27030,2,27054,2,27147,2,28714)

	-- Enchanted Runecloth Bag -- 27659
	self:addTradeSkill(RecipeDB,27659,275,22248,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,27659,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27659,2,15419)

	-- Big Bag of Enchantment -- 27660
	self:addTradeSkill(RecipeDB,27660,300,22249,2,3908,nil,0)
	self:addTradeFlags(RecipeDB,27660,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27660,3,11487)

	-- Cenarion Herb Bag -- 27724
	self:addTradeSkill(RecipeDB,27724,275,22251,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,27724,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB,27724,6,609,1,15179)

	-- Satchel of Cenarius -- 27725
	self:addTradeSkill(RecipeDB,27725,300,22252,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,27725,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,97)
	self:addTradeAcquire(RecipeDB,27725,6,609,3,15179)

	-- Glacial Gloves -- 28205
	self:addTradeSkill(RecipeDB,28205,300,22654,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,28205,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28205,6,529,3,16365,8,41)

	-- Glacial Vest -- 28207
	self:addTradeSkill(RecipeDB,28207,300,22652,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,28207,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28207,6,529,4,16365,8,41)

	-- Glacial Cloak -- 28208
	self:addTradeSkill(RecipeDB,28208,300,22658,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,28208,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,28208,6,529,2,16365,8,41)

	-- Glacial Wrists -- 28209
	self:addTradeSkill(RecipeDB,28209,300,22655,4,3908,nil,0)
	self:addTradeFlags(RecipeDB,28209,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,28209,6,529,3,16365,8,41)

	-- Gaea's Embrace -- 28210
	self:addTradeSkill(RecipeDB,28210,300,22660,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,28210,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,60,97)
	self:addTradeAcquire(RecipeDB,28210,6,609,3,15179)

	-- Sylvan Vest -- 28480
	self:addTradeSkill(RecipeDB,28480,300,22756,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,28480,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,97)
	self:addTradeAcquire(RecipeDB,28480,6,609,3,15179)

	-- Sylvan Crown -- 28481
	self:addTradeSkill(RecipeDB,28481,300,22757,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,28481,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,53,54,97)
	self:addTradeAcquire(RecipeDB,28481,6,609,2,15179)

	-- Sylvan Shoulders -- 28482
	self:addTradeSkill(RecipeDB,28482,300,22758,1,3908,nil,0)
	self:addTradeFlags(RecipeDB,28482,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56,97)
	self:addTradeAcquire(RecipeDB,28482,6,609,1,15179)

	-- Spellcloth -- 31373
	self:addTradeSkill(RecipeDB,31373,350,24271,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31373,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,31373,2,22213,2,29511)

	-- Mystic Spellthread -- 31430
	self:addTradeSkill(RecipeDB,31430,335,24273,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31430,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,31430,6,934,2,19331)

	-- Silver Spellthread -- 31431
	self:addTradeSkill(RecipeDB,31431,335,24275,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31431,1,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,101)
	self:addTradeAcquire(RecipeDB,31431,6,932,2,19321)

	-- Runic Spellthread -- 31432
	self:addTradeSkill(RecipeDB,31432,375,24274,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31432,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,110)
	self:addTradeAcquire(RecipeDB,31432,6,934,4,19331)

	-- Golden Spellthread -- 31433
	self:addTradeSkill(RecipeDB,31433,375,24276,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31433,1,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,101)
	self:addTradeAcquire(RecipeDB,31433,6,932,4,19321)

	-- Unyielding Bracers -- 31434
	self:addTradeSkill(RecipeDB,31434,350,24249,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31434,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,31434,3,24664)

	-- Bracers of Havok -- 31435
	self:addTradeSkill(RecipeDB,31435,350,24250,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31435,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31435,7,3)

	-- Blackstrike Bracers -- 31437
	self:addTradeSkill(RecipeDB,31437,350,24251,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31437,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31437,7,3)

	-- Cloak of the Black Void -- 31438
	self:addTradeSkill(RecipeDB,31438,350,24252,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31438,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31438,7,3)

	-- Cloak of Eternity -- 31440
	self:addTradeSkill(RecipeDB,31440,350,24253,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31440,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,52,60)
	self:addTradeAcquire(RecipeDB,31440,7,3)

	-- White Remedy Cape -- 31441
	self:addTradeSkill(RecipeDB,31441,350,24254,3,3908,nil,1)
	self:addTradeFlags(RecipeDB,31441,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31441,7,3)

	-- Unyielding Girdle -- 31442
	self:addTradeSkill(RecipeDB,31442,365,24255,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31442,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31442,3,24664)

	-- Girdle of Ruination -- 31443
	self:addTradeSkill(RecipeDB,31443,365,24256,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31443,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31443,7,4)

	-- Black Belt of Knowledge -- 31444
	self:addTradeSkill(RecipeDB,31444,365,24257,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31444,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,31444,7,4)

	-- Resolute Cape -- 31448
	self:addTradeSkill(RecipeDB,31448,365,24258,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31448,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,31448,7,4)

	-- Vengeance Wrap -- 31449
	self:addTradeSkill(RecipeDB,31449,365,24259,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31449,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,31449,7,4)

	-- Manaweave Cloak -- 31450
	self:addTradeSkill(RecipeDB,31450,365,24260,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31450,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,60)
	self:addTradeAcquire(RecipeDB,31450,7,4)

	-- Whitemend Pants -- 31451
	self:addTradeSkill(RecipeDB,31451,375,24261,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31451,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31451,3,20885)

	-- Spellstrike Pants -- 31452
	self:addTradeSkill(RecipeDB,31452,375,24262,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31452,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31452,3,18708)

	-- Battlecast Pants -- 31453
	self:addTradeSkill(RecipeDB,31453,375,24263,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31453,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31453,3,17978)

	-- Whitemend Hood -- 31454
	self:addTradeSkill(RecipeDB,31454,375,24264,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31454,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31454,3,17977)

	-- Spellstrike Hood -- 31455
	self:addTradeSkill(RecipeDB,31455,375,24266,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31455,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31455,3,16807)

	-- Battlecast Hood -- 31456
	self:addTradeSkill(RecipeDB,31456,375,24267,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,31456,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,31456,3,17798)

	-- Bag of Jewels -- 31459
	self:addTradeSkill(RecipeDB,31459,340,24270,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31459,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB,31459,6,933,2,20242,6,933,2,23007)

	-- Netherweave Net -- 31460
	self:addTradeSkill(RecipeDB,31460,300,24268,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,31460,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,31460,1,11557,1,18749,1,18772,1,28699,1,33580,1,27001,1,33613,1,33636)

	-- Belt of Blasting -- 36315
	self:addTradeSkill(RecipeDB,36315,375,30038,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,36315,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36315,8,37)

	-- Belt of the Long Road -- 36316
	self:addTradeSkill(RecipeDB,36316,375,30036,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,36316,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36316,8,37)

	-- Boots of Blasting -- 36317
	self:addTradeSkill(RecipeDB,36317,375,30037,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,36317,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36317,8,37)

	-- Boots of the Long Road -- 36318
	self:addTradeSkill(RecipeDB,36318,375,30035,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,36318,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,36318,8,37)

	-- Shadowcloth -- 36686
	self:addTradeSkill(RecipeDB,36686,350,24272,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,36686,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,36686,2,22212,2,29510)

	-- Cloak of Arcane Evasion -- 37873
	self:addTradeSkill(RecipeDB,37873,350,30831,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,37873,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,60,107)
	self:addTradeAcquire(RecipeDB,37873,6,1011,2,21655)

	-- Flameheart Bracers -- 37882
	self:addTradeSkill(RecipeDB,37882,350,30837,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,37882,1,4,21,22,23,24,25,26,27,28,29,30,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37882,6,932,1,19321)

	-- Flameheart Gloves -- 37883
	self:addTradeSkill(RecipeDB,37883,360,30838,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,37883,1,4,21,22,23,24,25,26,27,28,29,30,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37883,6,932,2,19321)

	-- Flameheart Vest -- 37884
	self:addTradeSkill(RecipeDB,37884,370,30839,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,37884,1,4,21,22,23,24,25,26,27,28,29,30,36,41,56,101)
	self:addTradeAcquire(RecipeDB,37884,6,932,4,19321)

	-- Soulguard Slippers -- 40020
	self:addTradeSkill(RecipeDB,40020,375,32391,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,40020,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40020,6,1012,2,23159)

	-- Soulguard Bracers -- 40021
	self:addTradeSkill(RecipeDB,40021,375,32392,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,40021,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40021,6,1012,1,23159)

	-- Soulguard Leggings -- 40023
	self:addTradeSkill(RecipeDB,40023,375,32389,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,40023,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40023,6,1012,2,23159)

	-- Soulguard Girdle -- 40024
	self:addTradeSkill(RecipeDB,40024,375,32390,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,40024,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,102)
	self:addTradeAcquire(RecipeDB,40024,6,1012,1,23159)

	-- Night's End -- 40060
	self:addTradeSkill(RecipeDB,40060,375,32420,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,40060,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,60,102)
	self:addTradeAcquire(RecipeDB,40060,6,1012,2,23159)

	-- Bracers of Nimble Thought -- 41205
	self:addTradeSkill(RecipeDB,41205,375,32586,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,41205,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,41205,8,28)

	-- Mantle of Nimble Thought -- 41206
	self:addTradeSkill(RecipeDB,41206,375,32587,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,41206,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,41206,8,34)

	-- Swiftheal Wraps -- 41207
	self:addTradeSkill(RecipeDB,41207,375,32584,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,41207,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,41207,8,34)

	-- Swiftheal Mantle -- 41208
	self:addTradeSkill(RecipeDB,41208,375,32585,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,41208,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,41208,7,4)

	-- Green Winter Clothes -- 44950
	self:addTradeSkill(RecipeDB,44950,250,34087,2,3908,nil,1)
	self:addTradeFlags(RecipeDB,44950,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,44950,2,13420)

	-- Red Winter Clothes -- 44958
	self:addTradeSkill(RecipeDB,44958,250,34085,2,3908,nil,1)
	self:addTradeFlags(RecipeDB,44958,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,44958,2,13433)

	-- Sunfire Handwraps -- 46128
	self:addTradeSkill(RecipeDB,46128,365,34366,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,46128,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46128,8,24)

	-- Hands of Eternal Light -- 46129
	self:addTradeSkill(RecipeDB,46129,365,34367,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,46129,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,46129,8,24)

	-- Sunfire Robe -- 46130
	self:addTradeSkill(RecipeDB,46130,365,34364,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,46130,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46130,8,24)

	-- Robe of Eternal Light -- 46131
	self:addTradeSkill(RecipeDB,46131,365,34365,4,3908,nil,1)
	self:addTradeFlags(RecipeDB,46131,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,53,54,56)
	self:addTradeAcquire(RecipeDB,46131,8,24)

	-- Dress Shoes -- 49677
	self:addTradeSkill(RecipeDB,49677,250,6836,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,49677,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,49677,2,15165)

	-- Mycah's Botanical Bag -- 50194
	self:addTradeSkill(RecipeDB,50194,375,38225,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,50194,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,113)
	self:addTradeAcquire(RecipeDB,50194,6,970,3,18382)

	-- Haliscan Jacket -- 50644
	self:addTradeSkill(RecipeDB,50644,250,38277,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,50644,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,50644,2,15165)

	-- Haliscan Pantaloons -- 50647
	self:addTradeSkill(RecipeDB,50647,245,38278,1,3908,nil,1)
	self:addTradeFlags(RecipeDB,50647,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,50647,2,15165)

	-- Lightweave Embroidery -- 55642
	self:addTradeSkill(RecipeDB,55642,420,nil,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55642,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,55642,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Darkglow Embroidery -- 55769
	self:addTradeSkill(RecipeDB,55769,420,nil,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55769,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55769,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Swordguard Embroidery -- 55777
	self:addTradeSkill(RecipeDB,55777,420,nil,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55777,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,55777,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostweave Net -- 55898
	self:addTradeSkill(RecipeDB,55898,360,41509,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55898,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55898,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Bolt of Frostweave -- 55899
	self:addTradeSkill(RecipeDB,55899,350,41510,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55899,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Bolt of Imbued Frostweave -- 55900
	self:addTradeSkill(RecipeDB,55900,400,41511,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55900,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55900,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Leggings -- 55901
	self:addTradeSkill(RecipeDB,55901,395,41548,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55901,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55901,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Shoulders -- 55902
	self:addTradeSkill(RecipeDB,55902,350,41513,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55902,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55902,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Robe -- 55903
	self:addTradeSkill(RecipeDB,55903,360,41515,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55903,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55903,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Gloves -- 55904
	self:addTradeSkill(RecipeDB,55904,360,44211,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55904,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55904,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Boots -- 55906
	self:addTradeSkill(RecipeDB,55906,375,41520,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55906,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55906,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Cowl -- 55907
	self:addTradeSkill(RecipeDB,55907,380,41521,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55907,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55907,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Belt -- 55908
	self:addTradeSkill(RecipeDB,55908,370,41522,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55908,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55908,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Shoulders -- 55910
	self:addTradeSkill(RecipeDB,55910,385,41523,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55910,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55910,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Robe -- 55911
	self:addTradeSkill(RecipeDB,55911,390,41525,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55911,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55911,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Mystic Frostwoven Wristwraps -- 55913
	self:addTradeSkill(RecipeDB,55913,385,41528,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55913,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55913,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Belt -- 55914
	self:addTradeSkill(RecipeDB,55914,395,41543,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55914,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,55914,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Cowl -- 55919
	self:addTradeSkill(RecipeDB,55919,395,41546,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55919,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55919,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Wristwraps -- 55920
	self:addTradeSkill(RecipeDB,55920,400,41551,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55920,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55920,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Robe -- 55921
	self:addTradeSkill(RecipeDB,55921,405,41549,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55921,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55921,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Gloves -- 55922
	self:addTradeSkill(RecipeDB,55922,405,41545,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55922,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55922,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Shoulders -- 55923
	self:addTradeSkill(RecipeDB,55923,410,41550,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55923,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55923,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Leggings -- 55925
	self:addTradeSkill(RecipeDB,55925,415,41553,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55925,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55925,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Robe -- 55941
	self:addTradeSkill(RecipeDB,55941,420,41554,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55941,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Black Duskweave Wristwraps -- 55943
	self:addTradeSkill(RecipeDB,55943,415,41555,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,55943,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55943,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Red Lumberjack Shirt -- 55993
	self:addTradeSkill(RecipeDB,55993,400,41248,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55993,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55993,7,2)

	-- Blue Lumberjack Shirt -- 55994
	self:addTradeSkill(RecipeDB,55994,400,41249,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55994,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55994,7,2)

	-- Yellow Lumberjack Shirt -- 55995
	self:addTradeSkill(RecipeDB,55995,400,41251,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,55995,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55995,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Green Lumberjack Shirt -- 55996
	self:addTradeSkill(RecipeDB,55996,400,41250,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55996,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55996,7,2)

	-- Red Workman's Shirt -- 55997
	self:addTradeSkill(RecipeDB,55997,400,41252,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55997,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55997,7,2)

	-- Blue Workman's Shirt -- 55998
	self:addTradeSkill(RecipeDB,55998,400,41253,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55998,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55998,7,2)

	-- Rustic Workman's Shirt -- 55999
	self:addTradeSkill(RecipeDB,55999,400,41254,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,55999,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,55999,7,2)

	-- Green Workman's Shirt -- 56000
	self:addTradeSkill(RecipeDB,56000,400,41255,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56000,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56000,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud -- 56001
	self:addTradeSkill(RecipeDB,56001,415,41594,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,56001,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56001,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave -- 56002
	self:addTradeSkill(RecipeDB,56002,415,41593,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,56002,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56002,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave -- 56003
	self:addTradeSkill(RecipeDB,56003,415,41595,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,56003,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56003,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Abyssal Bag -- 56004
	self:addTradeSkill(RecipeDB,56004,435,41597,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56004,1,2,4,29,36,41,117)
	self:addTradeAcquire(RecipeDB,56004,6,1098,3,32538)

	-- Glacial Bag -- 56005
	self:addTradeSkill(RecipeDB,56005,445,41600,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56005,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,119)
	self:addTradeAcquire(RecipeDB,56005,6,1119,4,32540)

	-- Mysterious Bag -- 56006
	self:addTradeSkill(RecipeDB,56006,440,41598,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56006,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,122)
	self:addTradeAcquire(RecipeDB,56006,6,1091,3,32533)

	-- Frostweave Bag -- 56007
	self:addTradeSkill(RecipeDB,56007,410,41599,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,56007,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56007,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Shining Spellthread -- 56008
	self:addTradeSkill(RecipeDB,56008,400,41601,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,56008,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56008,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Brilliant Spellthread -- 56009
	self:addTradeSkill(RecipeDB,56009,430,41602,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56009,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,115)
	self:addTradeAcquire(RecipeDB,56009,6,1106,4,30431)

	-- Azure Spellthread -- 56010
	self:addTradeSkill(RecipeDB,56010,400,41603,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,56010,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56010,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Sapphire Spellthread -- 56011
	self:addTradeSkill(RecipeDB,56011,430,41604,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56011,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,53,54,118)
	self:addTradeAcquire(RecipeDB,56011,6,1090,4,32287)

	-- Cloak of the Moon -- 56014
	self:addTradeSkill(RecipeDB,56014,390,41607,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,56014,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56014,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Cloak of Frozen Spirits -- 56015
	self:addTradeSkill(RecipeDB,56015,395,41608,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56015,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56015,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Wispcloak -- 56016
	self:addTradeSkill(RecipeDB,56016,415,41609,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56016,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56016,1,26914,1,26964,1,26969)

	-- Deathchill Cloak -- 56017
	self:addTradeSkill(RecipeDB,56017,415,41610,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56017,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,56017,1,26914,1,26964,1,26969)

	-- Hat of Wintry Doom -- 56018
	self:addTradeSkill(RecipeDB,56018,425,41984,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56018,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,56018,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Silky Iceshard Boots -- 56019
	self:addTradeSkill(RecipeDB,56019,420,41985,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56019,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56019,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Deep Frozen Cord -- 56020
	self:addTradeSkill(RecipeDB,56020,420,41986,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56020,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56020,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostmoon Pants -- 56021
	self:addTradeSkill(RecipeDB,56021,425,42093,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56021,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56021,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Light Blessed Mittens -- 56022
	self:addTradeSkill(RecipeDB,56022,420,42095,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56022,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56022,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Aurora Slippers -- 56023
	self:addTradeSkill(RecipeDB,56023,420,42096,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56023,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56023,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud Robe -- 56024
	self:addTradeSkill(RecipeDB,56024,440,42100,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,56024,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56024,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Moonshroud Gloves -- 56025
	self:addTradeSkill(RecipeDB,56025,435,42103,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56025,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56025,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave Robe -- 56026
	self:addTradeSkill(RecipeDB,56026,440,42101,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56026,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56026,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Ebonweave Gloves -- 56027
	self:addTradeSkill(RecipeDB,56027,435,42111,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56027,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56027,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave Robe -- 56028
	self:addTradeSkill(RecipeDB,56028,440,42102,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56028,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56028,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spellweave Gloves -- 56029
	self:addTradeSkill(RecipeDB,56029,435,42113,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56029,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56029,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Leggings -- 56030
	self:addTradeSkill(RecipeDB,56030,380,41519,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,56030,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56030,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostwoven Wristwraps -- 56031
	self:addTradeSkill(RecipeDB,56031,350,41512,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,56031,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,56031,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Master's Spellthread -- 56034
	self:addTradeSkill(RecipeDB,56034,405,nil,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56034,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56034,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Sanctified Spellthread -- 56039
	self:addTradeSkill(RecipeDB,56039,405,nil,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,56039,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,56039,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Belt -- 59582
	self:addTradeSkill(RecipeDB,59582,415,43969,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59582,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59582,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Bracers -- 59583
	self:addTradeSkill(RecipeDB,59583,415,43974,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59583,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59583,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Shoulders -- 59584
	self:addTradeSkill(RecipeDB,59584,420,43973,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59584,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Boots -- 59585
	self:addTradeSkill(RecipeDB,59585,420,43970,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59585,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59585,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Gloves -- 59586
	self:addTradeSkill(RecipeDB,59586,420,41516,2,3908,nil,2)
	self:addTradeFlags(RecipeDB,59586,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59586,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Robe -- 59587
	self:addTradeSkill(RecipeDB,59587,420,43972,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59587,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59587,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Leggings -- 59588
	self:addTradeSkill(RecipeDB,59588,420,43975,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59588,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59588,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostsavage Cowl -- 59589
	self:addTradeSkill(RecipeDB,59589,420,43971,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,59589,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,59589,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Flying Carpet -- 60969
	self:addTradeSkill(RecipeDB,60969,410,44554,3,3908,nil,2,410,420,425,430)
	self:addTradeFlags(RecipeDB,60969,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60969,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Magnificent Flying Carpet -- 60971
	self:addTradeSkill(RecipeDB,60971,425,44558,4,3908,nil,2,425,435,445,455)
	self:addTradeFlags(RecipeDB,60971,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,60971,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Waistband -- 60990
	self:addTradeSkill(RecipeDB,60990,420,43584,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,60990,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,60990,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Robe -- 60993
	self:addTradeSkill(RecipeDB,60993,425,43583,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,60993,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,60993,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Glacial Slippers -- 60994
	self:addTradeSkill(RecipeDB,60994,420,43585,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,60994,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,60994,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Duskweave Boots -- 55924
	self:addTradeSkill(RecipeDB,55924,410,41544,1,3908,nil,2,410,410,410,420)
	self:addTradeFlags(RecipeDB,55924,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,56)
	self:addTradeAcquire(RecipeDB,55924,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Cord of the White Dawn -- 63205
	self:addTradeSkill(RecipeDB,63205,450,45104,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,63205,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63205,8,39)

	-- Sash of Ancient Power -- 63203
	self:addTradeSkill(RecipeDB,63203,450,45102,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,63203,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63203,8,39)

	-- Savior's Slippers -- 63206
	self:addTradeSkill(RecipeDB,63206,450,45567,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,63206,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63206,8,39)

	-- Spellslinger's Slippers -- 63204
	self:addTradeSkill(RecipeDB,63204,450,45566,4,3908,nil,2)
	self:addTradeFlags(RecipeDB,63204,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,53,54,56)
	self:addTradeAcquire(RecipeDB,63204,8,39)

	-- Emerald Bag -- 63924
	self:addTradeSkill(RecipeDB,63924,435,45773,3,3908,nil,2)
	self:addTradeFlags(RecipeDB,63924,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,120)
	self:addTradeAcquire(RecipeDB,63924,6,1073,3,31916,6,1073,3,32763)

	-- Cloak of Crimson Snow -- 64730
	self:addTradeSkill(RecipeDB,64730,405,45810,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,64730,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54,60)
	self:addTradeAcquire(RecipeDB,64730,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Frostguard Drape -- 64729
	self:addTradeSkill(RecipeDB,64729,400,45811,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,64729,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,64729,1,26914,1,26964,1,26969,1,27001,1,28699,1,33580)

	-- Spidersilk Drape -- 63742
	self:addTradeSkill(RecipeDB,63742,125,45626,1,3908,nil,2)
	self:addTradeFlags(RecipeDB,63742,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,53,54)
	self:addTradeAcquire(RecipeDB,63742,1,26914,1,26964,1,26969,1,27001,1,28699,1,1346,1,4159,1,16729,1,3004,1,3484,1,3704,1,2627,1,33580,1,3363,1,1103,1,33613,1,33636,1,11052)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Bejeweled Wizard's Bracers -- 67079
		self:addTradeSkill(RecipeDB,67079,450,47585,3,3908,nil,2)
		self:addTradeFlags(RecipeDB,67079,1,2)
		--self:addTradeAcquire(RecipeDB,67079

		-- Merlin's Robe -- 67066
		self:addTradeSkill(RecipeDB,67066,450,47603,3,3908,nil,2)
		self:addTradeFlags(RecipeDB,670661,1,2)
		--self:addTradeAcquire(RecipeDB,67066

		-- Royal Moonshroud Bracers -- 67065
		self:addTradeSkill(RecipeDB,67065,450,47587,3,3908,nil,2)
		self:addTradeFlags(RecipeDB,67065,1,2)
		--self:addTradeAcquire(RecipeDB,67065

		-- Royal Moonshroud Robe -- 67144
		self:addTradeSkill(RecipeDB,67144,450,47606,3,3908,nil,2)
		self:addTradeFlags(RecipeDB,67144,1,2)
		--self:addTradeAcquire(RecipeDB,67144
	
		return 405

	else

		return 401

	end
end
