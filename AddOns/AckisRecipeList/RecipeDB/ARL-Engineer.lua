--[[

************************************************************************

ARL-Engineer.lua

Engineering data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-30T08:53:32Z 
File revision: 2263 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addTradeSkill(RecipeDB, SpellID, SkillLevel, ItemID, Rarity, Profession, Specialty, Game, Orange, Yellow, Green, Grey)

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

function addon:InitEngineering(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Rough Blasting Powder -- 3918
	self:addTradeSkill(RecipeDB,3918,1,4357,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3918,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3918,8,8)

	-- Rough Dynamite -- 3919
	self:addTradeSkill(RecipeDB,3919,1,4358,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3919,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3919,8,8)

	-- Crafted Light Shot -- 3920
	self:addTradeSkill(RecipeDB,3920,1,8067,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3920,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,3920,8,8)

	-- Handful of Copper Bolts -- 3922
	self:addTradeSkill(RecipeDB,3922,30,4359,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3922,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3922,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,33586,
	1,26991,1,33611,1,33634,1,1676)

	-- Rough Copper Bomb -- 3923
	self:addTradeSkill(RecipeDB,3923,30,4360,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3923,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3923,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Copper Tube -- 3924
	self:addTradeSkill(RecipeDB,3924,50,4361,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3924,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3924,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Rough Boomstick -- 3925
	self:addTradeSkill(RecipeDB,3925,50,4362,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3925,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3925,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Copper Modulator -- 3926
	self:addTradeSkill(RecipeDB,3926,65,4363,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3926,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3926,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Mechanical Squirrel -- 3928
	self:addTradeSkill(RecipeDB,3928,75,4401,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3928,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3928,7,2)

	-- Coarse Blasting Powder -- 3929
	self:addTradeSkill(RecipeDB,3929,75,4364,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3929,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3929,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Crafted Heavy Shot -- 3930
	self:addTradeSkill(RecipeDB,3930,75,8068,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3930,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,3930,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Coarse Dynamite -- 3931
	self:addTradeSkill(RecipeDB,3931,75,4365,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3931,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3931,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Target Dummy -- 3932
	self:addTradeSkill(RecipeDB,3932,85,4366,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3932,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3932,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,
	1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634,1,1676)

	-- Small Seaforium Charge -- 3933
	self:addTradeSkill(RecipeDB,3933,100,4367,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3933,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3933,7,2)

	-- Flying Tiger Goggles -- 3934
	self:addTradeSkill(RecipeDB,3934,100,4368,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3934,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3934,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,
	1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634,1,1676)

	-- Deadly Blunderbuss -- 3936
	self:addTradeSkill(RecipeDB,3936,105,4369,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3936,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3936,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Large Copper Bomb -- 3937
	self:addTradeSkill(RecipeDB,3937,105,4370,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3937,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3937,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Bronze Tube -- 3938
	self:addTradeSkill(RecipeDB,3938,105,4371,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3938,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3938,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Lovingly Crafted Boomstick -- 3939
	self:addTradeSkill(RecipeDB,3939,120,4372,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3939,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3939,2,2682,2,6730)

	-- Shadow Goggles -- 3940
	self:addTradeSkill(RecipeDB,3940,120,4373,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3940,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,3940,7,2)

	-- Small Bronze Bomb -- 3941
	self:addTradeSkill(RecipeDB,3941,120,4374,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3941,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Whirring Bronze Gizmo -- 3942
	self:addTradeSkill(RecipeDB,3942,125,4375,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3942,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3942,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Flame Deflector -- 3944
	self:addTradeSkill(RecipeDB,3944,125,4376,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3944,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3944,3,7800)

	-- Heavy Blasting Powder -- 3945
	self:addTradeSkill(RecipeDB,3945,125,4377,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3945,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3945,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Heavy Dynamite -- 3946
	self:addTradeSkill(RecipeDB,3946,125,4378,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3946,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3946,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Crafted Solid Shot -- 3947
	self:addTradeSkill(RecipeDB,3947,125,8069,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3947,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,3947,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Silver-plated Shotgun -- 3949
	self:addTradeSkill(RecipeDB,3949,130,4379,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3949,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3949,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Big Bronze Bomb -- 3950
	self:addTradeSkill(RecipeDB,3950,140,4380,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3950,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3950,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Minor Recombobulator -- 3952
	self:addTradeSkill(RecipeDB,3952,140,4381,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3952,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3952,2,2682,2,3495,2,2683)

	-- Bronze Framework -- 3953
	self:addTradeSkill(RecipeDB,3953,145,4382,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3953,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3953,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Moonsight Rifle -- 3954
	self:addTradeSkill(RecipeDB,3954,145,4383,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3954,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3954,7,2)

	-- Explosive Sheep -- 3955
	self:addTradeSkill(RecipeDB,3955,150,4384,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3955,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3955,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Green Tinted Goggles -- 3956
	self:addTradeSkill(RecipeDB,3956,150,4385,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3956,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,3956,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Ice Deflector -- 3957
	self:addTradeSkill(RecipeDB,3957,155,4386,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3957,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3957,2,2684)

	-- Iron Strut -- 3958
	self:addTradeSkill(RecipeDB,3958,160,4387,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3958,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3958,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Discombobulator Ray -- 3959
	self:addTradeSkill(RecipeDB,3959,160,4388,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3959,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3959,3,7800)

	-- Portable Bronze Mortar -- 3960
	self:addTradeSkill(RecipeDB,3960,165,4403,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3960,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3960,7,2)

	-- Gyrochronatom -- 3961
	self:addTradeSkill(RecipeDB,3961,170,4389,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3961,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,
	1,33586,1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Iron Grenade -- 3962
	self:addTradeSkill(RecipeDB,3962,175,4390,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3962,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3962,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,
	1,33586,1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Compact Harvest Reaper Kit -- 3963
	self:addTradeSkill(RecipeDB,3963,175,4391,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3963,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3963,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,
	1,33586,1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Advanced Target Dummy -- 3965
	self:addTradeSkill(RecipeDB,3965,185,4392,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3965,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3965,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,
	1,33586,1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Craftsman's Monocle -- 3966
	self:addTradeSkill(RecipeDB,3966,185,4393,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,3966,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,3966,7,3)

	-- Big Iron Bomb -- 3967
	self:addTradeSkill(RecipeDB,3967,190,4394,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3967,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3967,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,1,3494,
	1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Goblin Land Mine -- 3968
	self:addTradeSkill(RecipeDB,3968,195,4395,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3968,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3968,7,2)

	-- Mechanical Dragonling -- 3969
	self:addTradeSkill(RecipeDB,3969,200,4396,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3969,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3969,2,2687)

	-- Gnomish Cloaking Device -- 3971
	self:addTradeSkill(RecipeDB,3971,200,4397,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3971,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,3971,3,7800,2,6777)

	-- Large Seaforium Charge -- 3972
	self:addTradeSkill(RecipeDB,3972,200,4398,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,3972,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3972,7,2)

	-- Silver Contact -- 3973
	self:addTradeSkill(RecipeDB,3973,90,4404,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3973,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3973,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,
	1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634,1,1676)

	-- Crude Scope -- 3977
	self:addTradeSkill(RecipeDB,3977,60,4405,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3977,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3977,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,
	1,11028,1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,
	1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Standard Scope -- 3978
	self:addTradeSkill(RecipeDB,3978,110,4406,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3978,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3978,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,
	1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Accurate Scope -- 3979
	self:addTradeSkill(RecipeDB,3979,180,4407,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,3979,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,3979,2,2685)

	-- Ornate Spyglass -- 6458
	self:addTradeSkill(RecipeDB,6458,135,5507,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,6458,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,6458,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,
	1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Arclight Spanner -- 7430
	self:addTradeSkill(RecipeDB,7430,50,6219,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,7430,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7430,1,1702,1,2857,1,3290,1,3412,1,3494,1,4586,1,5174,1,5518,1,8736,1,11017,1,11025,1,11026,1,11028,
	1,11029,1,11031,1,11037,1,16668,1,16726,1,16743,1,17222,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,33586,1,26991,1,33611,1,33634,1,1676)

	-- Flash Bomb -- 8243
	self:addTradeSkill(RecipeDB,8243,185,4852,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,8243,1,2,5,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8243,3,7800,4,1559)

	-- Practice Lock -- 8334
	self:addTradeSkill(RecipeDB,8334,100,6712,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,8334,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,8334,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,1,19576,
	1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634,1,1676)

	-- EZ-Thro Dynamite -- 8339
	self:addTradeSkill(RecipeDB,8339,100,6714,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,8339,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,8339,7,2)

	-- Goblin Rocket Boots -- 8895
	self:addTradeSkill(RecipeDB,8895,225,7189,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,8895,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,8895,1,8126,1,29513)

	-- Gnomish Universal Remote -- 9269
	self:addTradeSkill(RecipeDB,9269,125,7506,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,9269,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,9269,3,7800,2,5175,2,6730)

	-- Aquadynamic Fish Attractor -- 9271
	self:addTradeSkill(RecipeDB,9271,150,6533,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,9271,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9271,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,
	1,19576,1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Goblin Jumper Cables -- 9273
	self:addTradeSkill(RecipeDB,9273,165,7148,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,9273,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,9273,3,7800,2,3537,2,4086)

	-- Gold Power Core -- 12584
	self:addTradeSkill(RecipeDB,12584,150,10558,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12584,1,1676,1,3412,1,5174,1,5518,1,8736,1,11017,1,11029,1,11031,1,16726,1,17634,1,17637,1,18752,1,18775,
	1,19576,1,16667,1,28697,1,1702,1,33586,1,3494,1,3290,1,26991,1,33611,1,33634)

	-- Solid Blasting Powder -- 12585
	self:addTradeSkill(RecipeDB,12585,175,10505,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12585,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12585,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Solid Dynamite -- 12586
	self:addTradeSkill(RecipeDB,12586,175,10507,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12586,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12586,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Bright-Eye Goggles -- 12587
	self:addTradeSkill(RecipeDB,12587,175,10499,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,12587,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12587,7,2)

	-- Mithril Tube -- 12589
	self:addTradeSkill(RecipeDB,12589,195,10559,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12589,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12589,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Gyromatic Micro-Adjustor -- 12590
	self:addTradeSkill(RecipeDB,12590,175,10498,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12590,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12590,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Unstable Trigger -- 12591
	self:addTradeSkill(RecipeDB,12591,200,10560,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12591,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12591,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Fire Goggles -- 12594
	self:addTradeSkill(RecipeDB,12594,205,10500,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12594,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12594,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Mithril Blunderbuss -- 12595
	self:addTradeSkill(RecipeDB,12595,205,10508,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12595,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12595,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Hi-Impact Mithril Slugs -- 12596
	self:addTradeSkill(RecipeDB,12596,210,10512,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12596,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,12596,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Deadly Scope -- 12597
	self:addTradeSkill(RecipeDB,12597,210,10546,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12597,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12597,2,8679,2,9544)

	-- Mithril Casing -- 12599
	self:addTradeSkill(RecipeDB,12599,215,10561,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12599,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12599,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Mithril Frag Bomb -- 12603
	self:addTradeSkill(RecipeDB,12603,215,10514,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12603,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12603,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Catseye Ultra Goggles -- 12607
	self:addTradeSkill(RecipeDB,12607,220,10501,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,12607,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12607,7,2)

	-- Mithril Heavy-bore Rifle -- 12614
	self:addTradeSkill(RecipeDB,12614,220,10510,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,12614,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,12614,7,2)

	-- Spellpower Goggles Xtreme -- 12615
	self:addTradeSkill(RecipeDB,12615,225,10502,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,12615,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12615,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Parachute Cloak -- 12616
	self:addTradeSkill(RecipeDB,12616,225,10518,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,12616,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,12616,7,2)

	-- Deepdive Helmet -- 12617
	self:addTradeSkill(RecipeDB,12617,230,10506,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12617,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,12617,2,8678)

	-- Rose Colored Goggles -- 12618
	self:addTradeSkill(RecipeDB,12618,230,10503,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12618,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12618,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Hi-Explosive Bomb -- 12619
	self:addTradeSkill(RecipeDB,12619,235,10562,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12619,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12619,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Sniper Scope -- 12620
	self:addTradeSkill(RecipeDB,12620,240,10548,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,12620,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,12620,7,3,8,33)

	-- Mithril Gyro-Shot -- 12621
	self:addTradeSkill(RecipeDB,12621,245,10513,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12621,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,12621,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Green Lens -- 12622
	self:addTradeSkill(RecipeDB,12622,245,10504,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12622,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Mithril Mechanical Dragonling -- 12624
	self:addTradeSkill(RecipeDB,12624,250,10576,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,12624,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12624,2,2688)

	-- Goblin Rocket Fuel Recipe -- 12715
	self:addTradeSkill(RecipeDB,12715,205,10644,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12715,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12715,1,8126,1,29513)

	-- Goblin Mortar -- 12716
	self:addTradeSkill(RecipeDB,12716,205,10577,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12716,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12716,1,8126,1,8738,1,29513)

	-- Goblin Mining Helmet -- 12717
	self:addTradeSkill(RecipeDB,12717,205,10542,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12717,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,12717,1,8126,1,8738,1,29513)

	-- Goblin Construction Helmet -- 12718
	self:addTradeSkill(RecipeDB,12718,205,10543,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12718,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,12718,1,8126,1,8738,1,29513)

	-- The Big One -- 12754
	self:addTradeSkill(RecipeDB,12754,235,10586,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12754,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12754,1,8126,1,8738,1,29513)

	-- Goblin Bomb Dispenser -- 12755
	self:addTradeSkill(RecipeDB,12755,230,10587,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12755,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12755,1,8126,1,8738,1,29513)

	-- Goblin Rocket Helmet -- 12758
	self:addTradeSkill(RecipeDB,12758,245,10588,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12758,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12758,1,8126,1,8738,1,29513)

	-- Gnomish Death Ray -- 12759
	self:addTradeSkill(RecipeDB,12759,240,10645,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12759,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12759,1,7406,1,7944,1,29514)

	-- Goblin Sapper Charge -- 12760
	self:addTradeSkill(RecipeDB,12760,205,10646,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12760,1,8126,1,29513)

	-- Inlaid Mithril Cylinder Plans -- 12895
	self:addTradeSkill(RecipeDB,12895,205,10713,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12895,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,12895,1,7406,1,7944,1,29514)

	-- Gnomish Goggles -- 12897
	self:addTradeSkill(RecipeDB,12897,210,10545,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12897,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,12897,1,7406,1,7944,1,29514)

	-- Gnomish Shrink Ray -- 12899
	self:addTradeSkill(RecipeDB,12899,205,10716,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12899,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12899,1,7406,1,7944,1,29514)

	-- Gnomish Net-o-Matic Projector -- 12902
	self:addTradeSkill(RecipeDB,12902,210,10720,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12902,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,12902,1,7406,1,7944,1,29514)

	-- Gnomish Harm Prevention Belt -- 12903
	self:addTradeSkill(RecipeDB,12903,215,10721,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12903,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,12903,1,7406,1,7944,1,29514)

	-- Gnomish Rocket Boots -- 12905
	self:addTradeSkill(RecipeDB,12905,225,10724,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12905,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12905,1,7406,1,7944,1,29514)

	-- Gnomish Battle Chicken -- 12906
	self:addTradeSkill(RecipeDB,12906,230,10725,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12906,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12906,1,7406,1,7944,1,29514)

	-- Gnomish Mind Control Cap -- 12907
	self:addTradeSkill(RecipeDB,12907,235,10726,1,4036,20219,0)
	self:addTradeFlags(RecipeDB,12907,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,12907,1,7406,1,7944,1,29514)

	-- Goblin Dragon Gun -- 12908
	self:addTradeSkill(RecipeDB,12908,240,10727,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,12908,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,12908,1,8126,1,8738,1,29513)

	-- The Mortar: Reloaded -- 13240
	self:addTradeSkill(RecipeDB,13240,205,10577,1,4036,20222,0)
	self:addTradeFlags(RecipeDB,13240,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,13240,1,8126,1,8738)

	-- Mechanical Repair Kit -- 15255
	self:addTradeSkill(RecipeDB,15255,200,11590,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,15255,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,15255,1,5174,1,8736,1,11017,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,33586,
	1,3494,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Pet Bombling -- 15628
	self:addTradeSkill(RecipeDB,15628,205,11825,2,4036,20222,0)
	self:addTradeFlags(RecipeDB,15628,1,2,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,15628,8,16)

	-- Lil' Smoky -- 15633
	self:addTradeSkill(RecipeDB,15633,205,11826,2,4036,20219,0)
	self:addTradeFlags(RecipeDB,15633,1,2,21,22,23,24,25,26,27,28,29,30,37,41)
	self:addTradeAcquire(RecipeDB,15633,8,16)

	-- Salt Shaker -- 19567
	self:addTradeSkill(RecipeDB,19567,250,15846,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19567,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19567,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Dense Blasting Powder -- 19788
	self:addTradeSkill(RecipeDB,19788,250,15992,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19788,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19788,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Thorium Grenade -- 19790
	self:addTradeSkill(RecipeDB,19790,260,15993,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19790,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19790,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Thorium Widget -- 19791
	self:addTradeSkill(RecipeDB,19791,260,15994,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19791,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19791,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Thorium Rifle -- 19792
	self:addTradeSkill(RecipeDB,19792,260,15995,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19792,1,2,3,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19792,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,
	1,3494,1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Lifelike Mechanical Toad -- 19793
	self:addTradeSkill(RecipeDB,19793,265,15996,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19793,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19793,7,2,8,33)

	-- Spellpower Goggles Xtreme Plus -- 19794
	self:addTradeSkill(RecipeDB,19794,270,15999,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19794,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,19794,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Thorium Tube -- 19795
	self:addTradeSkill(RecipeDB,19795,275,16000,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19795,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19795,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Dark Iron Rifle -- 19796
	self:addTradeSkill(RecipeDB,19796,275,16004,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19796,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19796,3,8897)

	-- Dark Iron Bomb -- 19799
	self:addTradeSkill(RecipeDB,19799,285,16005,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19799,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19799,3,8920)

	-- Thorium Shells -- 19800
	self:addTradeSkill(RecipeDB,19800,285,15997,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19800,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,78)
	self:addTradeAcquire(RecipeDB,19800,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Masterwork Target Dummy -- 19814
	self:addTradeSkill(RecipeDB,19814,275,16023,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19814,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19814,2,11185)

	-- Delicate Arcanite Converter -- 19815
	self:addTradeSkill(RecipeDB,19815,285,16006,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,19815,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19815,2,11185)

	-- Voice Amplification Modulator -- 19819
	self:addTradeSkill(RecipeDB,19819,290,16009,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19819,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19819,3,10426)

	-- Master Engineer's Goggles -- 19825
	self:addTradeSkill(RecipeDB,19825,290,16008,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19825,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,19825,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Arcanite Dragonling -- 19830
	self:addTradeSkill(RecipeDB,19830,300,16022,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19830,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19830,3,7437)

	-- Arcane Bomb -- 19831
	self:addTradeSkill(RecipeDB,19831,300,16040,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19831,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,19831,7,2)

	-- Flawless Arcanite Rifle -- 19833
	self:addTradeSkill(RecipeDB,19833,300,16007,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,19833,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,19833,3,8561)

	-- SnowMaster 9000 -- 21940
	self:addTradeSkill(RecipeDB,21940,190,17716,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,21940,1,2,7,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,21940,5,1)

	-- Field Repair Bot 74A -- 22704
	self:addTradeSkill(RecipeDB,22704,300,18232,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,22704,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22704,8,17)

	-- Biznicks 247x128 Accurascope -- 22793
	self:addTradeSkill(RecipeDB,22793,300,18283,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,22793,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22793,8,26)

	-- Core Marksman Rifle -- 22795
	self:addTradeSkill(RecipeDB,22795,300,18282,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,22795,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,22795,8,26)

	-- Force Reactive Disk -- 22797
	self:addTradeSkill(RecipeDB,22797,300,18168,3,4036,nil,0)
	self:addTradeFlags(RecipeDB,22797,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,64)
	self:addTradeAcquire(RecipeDB,22797,8,26)

	-- Red Firework -- 23066
	self:addTradeSkill(RecipeDB,23066,150,9318,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23066,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23066,2,3413)

	-- Blue Firework -- 23067
	self:addTradeSkill(RecipeDB,23067,150,9312,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23067,1,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23067,2,5175)

	-- Green Firework -- 23068
	self:addTradeSkill(RecipeDB,23068,150,9313,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23068,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23068,2,2838,2,3495)

	-- EZ-Thro Dynamite II -- 23069
	self:addTradeSkill(RecipeDB,23069,200,18588,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23069,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23069,2,8131)

	-- Dense Dynamite -- 23070
	self:addTradeSkill(RecipeDB,23070,250,18641,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23070,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23070,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Truesilver Transformer -- 23071
	self:addTradeSkill(RecipeDB,23071,260,18631,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23071,1,8736,1,17634,1,17637,1,18752,1,18775,1,19576,1,16667,1,28697,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,26991,1,33611,1,33634,1,1676)

	-- Gyrofreeze Ice Reflector -- 23077
	self:addTradeSkill(RecipeDB,23077,260,18634,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23077,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23077,2,11185)

	-- Goblin Jumper Cables XL -- 23078
	self:addTradeSkill(RecipeDB,23078,265,18587,2,4036,20222,0)
	self:addTradeFlags(RecipeDB,23078,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23078,3,9499)

	-- Major Recombobulator -- 23079
	self:addTradeSkill(RecipeDB,23079,275,18637,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,23079,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23079,8,32)

	-- Powerful Seaforium Charge -- 23080
	self:addTradeSkill(RecipeDB,23080,275,18594,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23080,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23080,2,11185)

	-- Hyper-Radiant Flame Reflector -- 23081
	self:addTradeSkill(RecipeDB,23081,290,18638,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,23081,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23081,3,10264)

	-- Ultra-Flash Shadow Reflector -- 23082
	self:addTradeSkill(RecipeDB,23082,300,18639,2,4036,nil,0)
	self:addTradeFlags(RecipeDB,23082,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,23082,3,10426)

	-- Alarm-O-Bot -- 23096
	self:addTradeSkill(RecipeDB,23096,265,18645,2,4036,20219,0)
	self:addTradeFlags(RecipeDB,23096,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23096,3,8920)

	-- World Enlarger -- 23129
	self:addTradeSkill(RecipeDB,23129,260,18660,2,4036,20219,0)
	self:addTradeFlags(RecipeDB,23129,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23129,3,8920)

	-- Dimensional Ripper - Everlook -- 23486
	self:addTradeSkill(RecipeDB,23486,260,18984,2,4036,20219,0)
	self:addTradeFlags(RecipeDB,23486,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,23486,8,21)

	-- Ultrasafe Transporter - Gadgetzan -- 23489
	self:addTradeSkill(RecipeDB,23489,260,18986,2,4036,20222,0)
	self:addTradeFlags(RecipeDB,23489,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,23489,8,20)

	-- Snake Burst Firework -- 23507
	self:addTradeSkill(RecipeDB,23507,250,19026,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,23507,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,23507,2,14637)

	-- Bloodvine Goggles -- 24356
	self:addTradeSkill(RecipeDB,24356,300,19999,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,24356,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,56,100)
	self:addTradeAcquire(RecipeDB,24356,6,270,2,14921)

	-- Bloodvine Lens -- 24357
	self:addTradeSkill(RecipeDB,24357,300,19998,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,24357,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24357,6,270,1,14921)

	-- Tranquil Mechanical Yeti -- 26011
	self:addTradeSkill(RecipeDB,26011,250,21277,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,26011,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26011,4,8798)

	-- Small Blue Rocket -- 26416
	self:addTradeSkill(RecipeDB,26416,125,21558,2,4036,nil,0,125,125,137,150)
	self:addTradeFlags(RecipeDB,26416,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26416,5,2,2,15909)

	-- Small Green Rocket -- 26417
	self:addTradeSkill(RecipeDB,26417,125,21559,2,4036,nil,0,125,125,137,150)
	self:addTradeFlags(RecipeDB,26417,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26417,5,2,2,15909)

	-- Small Red Rocket -- 26418
	self:addTradeSkill(RecipeDB,26418,125,21557,2,4036,nil,0,125,125,137,150)
	self:addTradeFlags(RecipeDB,26418,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26418,5,2,2,15909)

	-- Large Blue Rocket -- 26420
	self:addTradeSkill(RecipeDB,26420,175,21589,2,4036,nil,0,175,175,187,200)
	self:addTradeFlags(RecipeDB,26420,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26420,5,2,2,15909)

	-- Large Green Rocket -- 26421
	self:addTradeSkill(RecipeDB,26421,175,21590,2,4036,nil,0,175,175,187,200)
	self:addTradeFlags(RecipeDB,26421,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26421,5,2,2,15909)

	-- Large Red Rocket -- 26422
	self:addTradeSkill(RecipeDB,26422,175,21592,2,4036,nil,0,175,175,187,200)
	self:addTradeFlags(RecipeDB,26422,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26422,5,2,2,15909)

	-- Blue Rocket Cluster -- 26423
	self:addTradeSkill(RecipeDB,26423,225,21571,2,4036,nil,0,225,225,237,250)
	self:addTradeFlags(RecipeDB,26423,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26423,5,2,2,15909)

	-- Green Rocket Cluster -- 26424
	self:addTradeSkill(RecipeDB,26424,225,21574,2,4036,nil,0,225,225,237,250)
	self:addTradeFlags(RecipeDB,26424,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26424,5,2,2,15909)

	-- Red Rocket Cluster -- 26425
	self:addTradeSkill(RecipeDB,26425,225,21576,2,4036,nil,0,225,225,237,250)
	self:addTradeFlags(RecipeDB,26425,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26425,5,2,2,15909)

	-- Large Blue Rocket Cluster -- 26426
	self:addTradeSkill(RecipeDB,26426,275,21714,2,4036,nil,0,275,275,280,285)
	self:addTradeFlags(RecipeDB,26426,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26426,5,2,2,15909)

	-- Large Green Rocket Cluster -- 26427
	self:addTradeSkill(RecipeDB,26427,275,21716,2,4036,nil,0,275,275,280,285)
	self:addTradeFlags(RecipeDB,26427,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26427,5,2,2,15909)

	-- Large Red Rocket Cluster -- 26428
	self:addTradeSkill(RecipeDB,26428,275,21718,2,4036,nil,0,275,275,280,285)
	self:addTradeFlags(RecipeDB,26428,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26428,5,2,2,15909)

	-- Firework Launcher -- 26442
	self:addTradeSkill(RecipeDB,26442,225,21569,2,4036,nil,0,225,245,255,265)
	self:addTradeFlags(RecipeDB,26442,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26442,5,2,2,15909)

	-- Firework Cluster Launcher -- 26443
	self:addTradeSkill(RecipeDB,26443,275,21570,2,4036,nil,0,275,295,305,315)
	self:addTradeFlags(RecipeDB,26443,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,26443,5,2,2,15909)

	-- Steam Tonk Controller -- 28327
	self:addTradeSkill(RecipeDB,28327,275,22728,1,4036,nil,0)
	self:addTradeFlags(RecipeDB,28327,1,2,4,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,28327,4,9249,2,3413,2,5175)

	-- Elemental Blasting Powder -- 30303
	self:addTradeSkill(RecipeDB,30303,300,23781,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30303,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30303,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Fel Iron Casing -- 30304
	self:addTradeSkill(RecipeDB,30304,300,23782,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30304,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30304,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Handful of Fel Iron Bolts -- 30305
	self:addTradeSkill(RecipeDB,30305,300,23783,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30305,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30305,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Adamantite Frame -- 30306
	self:addTradeSkill(RecipeDB,30306,325,23784,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30306,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30306,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Hardened Adamantite Tube -- 30307
	self:addTradeSkill(RecipeDB,30307,340,23785,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30307,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Khorium Power Core -- 30308
	self:addTradeSkill(RecipeDB,30308,340,23786,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30308,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30308,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Felsteel Stabilizer -- 30309
	self:addTradeSkill(RecipeDB,30309,340,23787,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30309,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30309,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Fel Iron Bomb -- 30310
	self:addTradeSkill(RecipeDB,30310,300,23736,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30310,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30310,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Adamantite Grenade -- 30311
	self:addTradeSkill(RecipeDB,30311,325,23737,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30311,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30311,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Fel Iron Musket -- 30312
	self:addTradeSkill(RecipeDB,30312,320,23742,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30312,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30312,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Adamantite Rifle -- 30313
	self:addTradeSkill(RecipeDB,30313,350,23746,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30313,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,30313,2,16657,2,16782,2,19661)

	-- Felsteel Boomstick -- 30314
	self:addTradeSkill(RecipeDB,30314,360,23747,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30314,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30314,3,19960)

	-- Ornate Khorium Rifle -- 30315
	self:addTradeSkill(RecipeDB,30315,375,23748,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30315,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,63)
	self:addTradeAcquire(RecipeDB,30315,7,3)

	-- Cogspinner Goggles -- 30316
	self:addTradeSkill(RecipeDB,30316,340,23758,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30316,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,30316,2,18775,2,19836)

	-- Power Amplification Goggles -- 30317
	self:addTradeSkill(RecipeDB,30317,340,23761,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30317,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,30317,7,3)

	-- Ultra-Spectropic Detection Goggles -- 30318
	self:addTradeSkill(RecipeDB,30318,350,23762,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30318,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,56)
	self:addTradeAcquire(RecipeDB,30318,2,18775,2,19383)

	-- Hyper-Vision Goggles -- 30325
	self:addTradeSkill(RecipeDB,30325,360,23763,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30325,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,30325,3,19755)

	-- Adamantite Scope -- 30329
	self:addTradeSkill(RecipeDB,30329,335,23764,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30329,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30329,2,19351,2,19836)

	-- Khorium Scope -- 30332
	self:addTradeSkill(RecipeDB,30332,360,23765,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30332,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30332,3,20207)

	-- Stabilized Eternium Scope -- 30334
	self:addTradeSkill(RecipeDB,30334,375,23766,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30334,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30334,3,16152)

	-- Crashin' Thrashin' Robot -- 30337
	self:addTradeSkill(RecipeDB,30337,325,23767,2,4036,nil,1)
	self:addTradeFlags(RecipeDB,30337,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30337,7,2)

	-- White Smoke Flare -- 30341
	self:addTradeSkill(RecipeDB,30341,335,23768,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30341,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30341,2,16657,2,16782,2,18484,2,19383)

	-- Green Smoke Flare -- 30344
	self:addTradeSkill(RecipeDB,30344,335,23771,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30344,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,30344,6,942,1,17904)

	-- Fel Iron Shells -- 30346
	self:addTradeSkill(RecipeDB,30346,310,23772,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30346,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,30346,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Adamantite Shell Machine -- 30347
	self:addTradeSkill(RecipeDB,30347,335,34504,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30347,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,78)
	self:addTradeAcquire(RecipeDB,30347,2,16657,2,16782,2,18484)

	-- Fel Iron Toolbox -- 30348
	self:addTradeSkill(RecipeDB,30348,325,23774,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30348,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,30348,2,16657,2,16782,2,18484)
	
	-- Titanium Toolbox -- 30349
	self:addTradeSkill(RecipeDB,30349,440,23775,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,30349,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30349,2,28722)

	-- Elemental Seaforium Charge -- 30547
	self:addTradeSkill(RecipeDB,30547,350,23819,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30547,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,105)
	self:addTradeAcquire(RecipeDB,30547,6,933,3,20242,6,933,3,23007)

	-- Zapthrottle Mote Extractor -- 30548
	self:addTradeSkill(RecipeDB,30548,305,23821,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,30548,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30548,4,9635,4,9636)

	-- Healing Potion Injector -- 30551
	self:addTradeSkill(RecipeDB,30551,330,33092,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30551,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30551,3,24664)

	-- Mana Potion Injector -- 30552
	self:addTradeSkill(RecipeDB,30552,345,33093,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30552,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30552,3,24664)

	-- Rocket Boots Xtreme -- 30556
	self:addTradeSkill(RecipeDB,30556,355,23824,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,30556,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,30556,3,17796)

	-- The Bigger One -- 30558
	self:addTradeSkill(RecipeDB,30558,325,23826,1,4036,20222,1)
	self:addTradeFlags(RecipeDB,30558,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30558,1,8126,1,8738,1,29513)

	-- Super Sapper Charge -- 30560
	self:addTradeSkill(RecipeDB,30560,340,23827,1,4036,20222,1)
	self:addTradeFlags(RecipeDB,30560,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30560,1,8126,1,8738,1,29513)

	-- Goblin Rocket Launcher -- 30563
	self:addTradeSkill(RecipeDB,30563,350,23836,1,4036,20222,1)
	self:addTradeFlags(RecipeDB,30563,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30563,1,8126,1,8738,1,29513)

	-- Foreman's Enchanted Helmet -- 30565
	self:addTradeSkill(RecipeDB,30565,375,23838,1,4036,20222,1)
	self:addTradeFlags(RecipeDB,30565,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,30565,1,8126,1,8738,1,29513)

	-- Foreman's Reinforced Helmet -- 30566
	self:addTradeSkill(RecipeDB,30566,375,23839,1,4036,20222,1)
	self:addTradeFlags(RecipeDB,30566,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,30566,1,8126,1,8738,1,29513)

	-- Gnomish Flame Turret -- 30568
	self:addTradeSkill(RecipeDB,30568,325,23841,1,4036,20219,1)
	self:addTradeFlags(RecipeDB,30568,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,30568,1,7406,1,7944,1,29514)

	-- Gnomish Poultryizer -- 30569
	self:addTradeSkill(RecipeDB,30569,340,23835,1,4036,20219,1)
	self:addTradeFlags(RecipeDB,30569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,30569,1,7406,1,7944,1,29514)

	-- Nigh-Invulnerability Belt -- 30570
	self:addTradeSkill(RecipeDB,30570,350,23825,1,4036,20219,1)
	self:addTradeFlags(RecipeDB,30570,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,30570,1,7406,1,7944,1,29514)

	-- Gnomish Power Goggles -- 30574
	self:addTradeSkill(RecipeDB,30574,375,23828,1,4036,20219,1)
	self:addTradeFlags(RecipeDB,30574,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,56)
	self:addTradeAcquire(RecipeDB,30574,1,7406,1,7944,1,29514)

	-- Gnomish Battle Goggles -- 30575
	self:addTradeSkill(RecipeDB,30575,375,23829,1,4036,20219,1)
	self:addTradeFlags(RecipeDB,30575,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,30575,1,7406,1,7944,1,29514)

	-- Purple Smoke Flare -- 32814
	self:addTradeSkill(RecipeDB,32814,335,25886,2,4036,nil,1)
	self:addTradeFlags(RecipeDB,32814,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32814,7,2)

	-- Dimensional Ripper - Area 52 -- 36954
	self:addTradeSkill(RecipeDB,36954,350,30542,2,4036,20222,1)
	self:addTradeFlags(RecipeDB,36954,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,36954,8,20)

	-- Ultrasafe Transporter - Toshley's Station -- 36955
	self:addTradeSkill(RecipeDB,36955,350,30544,2,4036,20219,1)
	self:addTradeFlags(RecipeDB,36955,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,36955,8,21)

	-- Fused Wiring -- 39895
	self:addTradeSkill(RecipeDB,39895,275,7191,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,39895,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,39895,2,11185,2,19661)

	-- Icy Blasting Primers -- 39971
	self:addTradeSkill(RecipeDB,39971,335,32423,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,39971,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39971,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Frost Grenades -- 39973
	self:addTradeSkill(RecipeDB,39973,335,32413,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,39973,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,39973,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Furious Gizmatic Goggles -- 40274
	self:addTradeSkill(RecipeDB,40274,350,32461,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,40274,1,2,3,25,30,37,41,59)
	self:addTradeAcquire(RecipeDB,40274,1,17634,1,17637,1,18752,1,18775,1,19576,1,33586,1,28697)

	-- Gyro-balanced Khorium Destroyer -- 41307
	self:addTradeSkill(RecipeDB,41307,375,32756,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,41307,1,17634,1,17637,1,18752,1,18775,1,19576,1,28697,1,33586,1,26991,1,33611,1,33634)

	-- Justicebringer 2000 Specs -- 41311
	self:addTradeSkill(RecipeDB,41311,350,32472,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41311,1,2,3,25,37,41,59)
	self:addTradeAcquire(RecipeDB,41311,1,17634,1,18775,1,25277,1,26907,1,26955)

	-- Tankatronic Goggles -- 41312
	self:addTradeSkill(RecipeDB,41312,350,32473,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41312,1,2,3,25,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,41312,1,17634,1,17637,1,18752,1,18775,1,19576,1,25277,1,26907,1,26955,1,33586,1,28697)

	-- Surestrike Goggles v2.0 -- 41314
	self:addTradeSkill(RecipeDB,41314,350,32474,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41314,1,2,3,23,27,37,41,58)
	self:addTradeAcquire(RecipeDB,41314,1,17634,1,17637,1,18752,1,18775,1,19576,1,25277,1,26907,1,26955,1,26991)

	-- Gadgetstorm Goggles -- 41315
	self:addTradeSkill(RecipeDB,41315,350,32476,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,41315,1,2,3,27,37,41,58)
	self:addTradeAcquire(RecipeDB,41315,1,25277,1,26907,1,26955,1,26991)

	-- Living Replicator Specs -- 41316
	self:addTradeSkill(RecipeDB,41316,350,32475,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,41316,1,2,3,27,37,41,58)
	self:addTradeAcquire(RecipeDB,41316,1,25277,1,26907,1,26955,1,26991)

	-- Deathblow X11 Goggles -- 41317
	self:addTradeSkill(RecipeDB,41317,350,32478,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41317,1,2,3,22,28,37,41,57)
	self:addTradeAcquire(RecipeDB,41317,1,17634,1,17637,1,18752,1,18775,1,19576,1,25277,1,26907,1,26955,1,33611)

	-- Wonderheal XT40 Shades -- 41318
	self:addTradeSkill(RecipeDB,41318,350,32479,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,41318,1,2,3,22,37,41,57)
	self:addTradeAcquire(RecipeDB,41318,1,25277,1,26907,1,26955)

	-- Magnified Moon Specs -- 41319
	self:addTradeSkill(RecipeDB,41319,350,32480,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,41319,1,2,3,22,37,41,57)
	self:addTradeAcquire(RecipeDB,41319,1,25277,1,26907,1,26955)

	-- Destruction Holo-gogs -- 41320
	self:addTradeSkill(RecipeDB,41320,350,32494,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,41320,1,2,3,24,26,29,37,41,56)
	self:addTradeAcquire(RecipeDB,41320,1,17634,1,17637,1,18752,1,18775,1,19576,1,25277,1,26907,1,26955,1,33634)

	-- Powerheal 4000 Lens -- 41321
	self:addTradeSkill(RecipeDB,41321,350,32495,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,41321,1,2,3,26,37,41,56)
	self:addTradeAcquire(RecipeDB,41321,1,25277,1,26907,1,26955)

	-- Adamantite Arrow Maker -- 43676
	self:addTradeSkill(RecipeDB,43676,335,20475,2,4036,nil,1)
	self:addTradeFlags(RecipeDB,43676,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,43676,3,19707)

	-- Flying Machine -- 44155
	self:addTradeSkill(RecipeDB,44155,350,34060,3,4036,34090,1)
	self:addTradeFlags(RecipeDB,44155,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44155,1,24868,1,25099)

	-- Turbo-Charged Flying Machine -- 44157
	self:addTradeSkill(RecipeDB,44157,375,34061,4,4036,34091,1)
	self:addTradeFlags(RecipeDB,44157,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44157,1,24868,1,25099)

	-- Field Repair Bot 110G -- 44391
	self:addTradeSkill(RecipeDB,44391,360,34113,2,4036,nil,1)
	self:addTradeFlags(RecipeDB,44391,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44391,3,23385,3,23386)

	-- Wonderheal XT68 Shades -- 46106
	self:addTradeSkill(RecipeDB,46106,375,35183,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46106,1,2,6,22,37,41,57)
	self:addTradeAcquire(RecipeDB,46106,8,33)

	-- Justicebringer 3000 Specs -- 46107
	self:addTradeSkill(RecipeDB,46107,375,35185,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46107,1,2,6,25,37,41,59)
	self:addTradeAcquire(RecipeDB,46107,8,24)

	-- Powerheal 9000 Lens -- 46108
	self:addTradeSkill(RecipeDB,46108,375,35181,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46108,1,2,6,26,37,41,56)
	self:addTradeAcquire(RecipeDB,46108,8,24)

	-- Hyper-Magnified Moon Specs -- 46109
	self:addTradeSkill(RecipeDB,46109,375,35182,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46109,1,2,6,22,37,41,57)
	self:addTradeAcquire(RecipeDB,46109,8,24)

	-- Primal-Attuned Goggles -- 46110
	self:addTradeSkill(RecipeDB,46110,375,35184,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46110,1,2,6,27,37,41,58)
	self:addTradeAcquire(RecipeDB,46110,8,24)

	-- Annihilator Holo-Gogs -- 46111
	self:addTradeSkill(RecipeDB,46111,375,34847,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46111,1,2,6,24,26,29,37,41,56)
	self:addTradeAcquire(RecipeDB,46111,8,24)

	-- Lightning Etched Specs -- 46112
	self:addTradeSkill(RecipeDB,46112,375,34355,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46112,1,2,6,27,37,41,58)
	self:addTradeAcquire(RecipeDB,46112,8,24)

	-- Surestrike Goggles v3.0 -- 46113
	self:addTradeSkill(RecipeDB,46113,375,34356,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46113,1,2,6,23,27,37,41,58)
	self:addTradeAcquire(RecipeDB,46113,8,24)

	-- Mayhem Projection Goggles -- 46114
	self:addTradeSkill(RecipeDB,46114,375,34354,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46114,1,2,6,25,30,37,41,59)
	self:addTradeAcquire(RecipeDB,46114,8,24)

	-- Hard Khorium Goggles -- 46115
	self:addTradeSkill(RecipeDB,46115,375,34357,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46115,1,2,6,25,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,46115,8,24)

	-- Quad Deathblow X44 Goggles -- 46116
	self:addTradeSkill(RecipeDB,46116,375,34353,4,4036,nil,1)
	self:addTradeFlags(RecipeDB,46116,1,2,6,22,28,37,41,57)
	self:addTradeAcquire(RecipeDB,46116,8,24)

	-- Rocket Boots Xtreme Lite -- 46697
	self:addTradeSkill(RecipeDB,46697,355,35581,3,4036,nil,1)
	self:addTradeFlags(RecipeDB,46697,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,46697,3,19219)

	-- Volatile Blasting Trigger -- 53281
	self:addTradeSkill(RecipeDB,53281,350,39690,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,53281,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,53281,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Mark \"S\" Boomstick -- 54353
	self:addTradeSkill(RecipeDB,54353,400,39688,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,54353,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,54353,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Personal Electromagnetic Pulse Generator -- 54736
	self:addTradeSkill(RecipeDB,54736,390,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,54736,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54736,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Belt-Clipped Spynoculars -- 54793
	self:addTradeSkill(RecipeDB,54793,380,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,54793,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54793,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Hand-Mounted Pyro Rocket -- 54998
	self:addTradeSkill(RecipeDB,54998,400,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,54998,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54998,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Hyperspeed Accelerators -- 54999
	self:addTradeSkill(RecipeDB,54999,400,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,54999,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,54999,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Flexweave Underlay -- 55002
	self:addTradeSkill(RecipeDB,55002,380,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,55002,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55002,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Nitro Boosts -- 55016
	self:addTradeSkill(RecipeDB,55016,405,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,55016,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55016,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Scrapbot Construction Kit -- 55252
	self:addTradeSkill(RecipeDB,55252,425,40769,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,55252,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55252,1,25277,1,26907,1,26955)

	-- Handful of Cobalt Bolts -- 56349
	self:addTradeSkill(RecipeDB,56349,350,39681,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,56349,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56349,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Hammer Pick -- 56459
	self:addTradeSkill(RecipeDB,56459,375,40892,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,56459,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56459,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Cobalt Frag Bomb -- 56460
	self:addTradeSkill(RecipeDB,56460,350,40771,1,4036,nil,1)
	self:addTradeFlags(RecipeDB,56460,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56460,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Bladed Pickaxe -- 56461
	self:addTradeSkill(RecipeDB,56461,375,40893,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56461,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56461,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Gnomish Army Knife -- 56462
	self:addTradeSkill(RecipeDB,56462,435,40772,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56462,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56462,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Explosive Decoy -- 56463
	self:addTradeSkill(RecipeDB,56463,375,40536,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56463,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56463,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Overcharged Capacitor -- 56464
	self:addTradeSkill(RecipeDB,56464,375,39682,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56464,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56464,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Sonic Booster -- 56466
	self:addTradeSkill(RecipeDB,56466,420,40767,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56466,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,56466,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Noise Machine -- 56467
	self:addTradeSkill(RecipeDB,56467,420,40865,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,56467,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Saronite Bomb -- 56468
	self:addTradeSkill(RecipeDB,56468,405,41119,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56468,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56468,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Gnomish Lightning Generator -- 56469
	self:addTradeSkill(RecipeDB,56469,425,41121,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56469,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,63)
	self:addTradeAcquire(RecipeDB,56469,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Sun Scope -- 56470
	self:addTradeSkill(RecipeDB,56470,425,41146,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56470,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56470,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Froststeel Tube -- 56471
	self:addTradeSkill(RecipeDB,56471,390,39683,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56471,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56471,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- MOLL-E -- 56472
	self:addTradeSkill(RecipeDB,56472,425,40768,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56472,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56472,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Gnomish X-Ray Specs -- 56473
	self:addTradeSkill(RecipeDB,56473,425,40895,3,4036,20219,2)
	self:addTradeFlags(RecipeDB,56473,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,56473,1,25277,1,26907,1,26955,1,29514)

	-- Ultrasafe Bullet Machine -- 56474
	self:addTradeSkill(RecipeDB,56474,410,44507,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56474,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,78)
	self:addTradeAcquire(RecipeDB,56474,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Saronite Arrow Maker -- 56475
	self:addTradeSkill(RecipeDB,56475,415,44506,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56475,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56475,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Healing Injector Kit -- 56476
	self:addTradeSkill(RecipeDB,56476,410,37567,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56476,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56476,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Mana Injector Kit -- 56477
	self:addTradeSkill(RecipeDB,56477,415,42546,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56477,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56477,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Heartseeker Scope -- 56478
	self:addTradeSkill(RecipeDB,56478,430,41167,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56478,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56478,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Armor Plated Combat Shotgun -- 56479
	self:addTradeSkill(RecipeDB,56479,450,41168,4,4036,nil,2)
	self:addTradeFlags(RecipeDB,56479,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,63)
	self:addTradeAcquire(RecipeDB,56479,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Armored Titanium Goggles -- 56480
	self:addTradeSkill(RecipeDB,56480,440,42549,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56480,1,2,3,21,25,30,37,41,52,59)
	self:addTradeAcquire(RecipeDB,56480,1,25277,1,26907,1,26955,1,33586,1,28697)

	-- Weakness Spectralizers -- 56481
	self:addTradeSkill(RecipeDB,56481,440,42550,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56481,1,2,3,22,37,41,57)
	self:addTradeAcquire(RecipeDB,56481,1,25277,1,26907,1,26955)

	-- Charged Titanium Specs -- 56483
	self:addTradeSkill(RecipeDB,56483,440,42552,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56483,1,2,3,21,25,30,37,41,59)
	self:addTradeAcquire(RecipeDB,56483,1,25277,1,26907,1,26955,1,33586,1,28697)

	-- Visage Liquification Goggles -- 56484
	self:addTradeSkill(RecipeDB,56484,440,42553,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56484,1,2,3,24,26,29,37,41,56)
	self:addTradeAcquire(RecipeDB,56484,1,25277,1,26907,1,26955)

	-- Greensight Gogs -- 56486
	self:addTradeSkill(RecipeDB,56486,440,42554,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56486,1,2,3,22,37,41,57)
	self:addTradeAcquire(RecipeDB,56486,1,25277,1,26907,1,26955)

	-- Electroflux Sight Enhancers -- 56487
	self:addTradeSkill(RecipeDB,56487,440,42555,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56487,1,2,3,27,37,41,58)
	self:addTradeAcquire(RecipeDB,56487,1,25277,1,26907,1,26955,1,26991)

	-- Global Thermal Sapper Charge -- 56514
	self:addTradeSkill(RecipeDB,56514,425,42641,1,4036,20222,2)
	self:addTradeFlags(RecipeDB,56514,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,56514,1,25277,1,26907,1,26955,1,29513)

	-- Truesight Ice Blinders -- 56574
	self:addTradeSkill(RecipeDB,56574,440,42551,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,56574,1,2,3,23,27,37,41,58)
	self:addTradeAcquire(RecipeDB,56574,1,25277,1,26907,1,26955,1,26991)

	-- Mechano-hog -- 60866
	self:addTradeSkill(RecipeDB,60866,450,41508,4,4036,nil,2)
	self:addTradeFlags(RecipeDB,60866,2,4,21,22,23,24,25,26,27,28,29,30,36,41,130)
	self:addTradeAcquire(RecipeDB,60866,6,1052,4,32565,6,1052,4,32774)

	-- Mekgineer's Chopper -- 60867
	self:addTradeSkill(RecipeDB,60867,450,44413,4,4036,nil,2)
	self:addTradeFlags(RecipeDB,60867,1,4,21,22,23,24,25,26,27,28,29,30,36,41,130)
	self:addTradeAcquire(RecipeDB,60867,6,1037,4,32564,6,1037,4,32773)

	-- Nesingwary 4000 -- 60874
	self:addTradeSkill(RecipeDB,60874,450,44504,4,4036,nil,2)
	self:addTradeFlags(RecipeDB,60874,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,63)
	self:addTradeAcquire(RecipeDB,60874,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Diamond-cut Refractor Scope -- 61471
	self:addTradeSkill(RecipeDB,61471,390,44739,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,61471,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,61471,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Mechanized Snow Goggles (Cloth) -- 56465
	self:addTradeSkill(RecipeDB,56465,420,41112,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,56465,1,2,3,24,26,29,36,41,56)
	self:addTradeAcquire(RecipeDB,56465,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Mechanized Snow Goggles (Leather) -- 61481
	self:addTradeSkill(RecipeDB,61481,420,44742,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,61481,1,2,3,22,28,36,41,57)
	self:addTradeAcquire(RecipeDB,61481,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Mechanized Snow Goggles (Mail) -- 61482
	self:addTradeSkill(RecipeDB,61482,420,44742,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,61482,1,2,3,23,27,36,41,58)
	self:addTradeAcquire(RecipeDB,61482,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)	

	-- Mechanized Snow Goggles (Plate) -- 61483
	self:addTradeSkill(RecipeDB,61483,420,44742,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,61483,1,2,3,21,25,30,36,41,59)
	self:addTradeAcquire(RecipeDB,61483,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Unbreakable Healing Amplifiers -- 62271
	self:addTradeSkill(RecipeDB,62271,440,44949,3,4036,nil,2)
	self:addTradeFlags(RecipeDB,62271,1,2,3,25,37,41,53,59)
	self:addTradeAcquire(RecipeDB,62271,1,25277,1,26907,1,26955)

	-- Reticulated Armor Webbing -- 63770
	self:addTradeSkill(RecipeDB,63770,400,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,63770,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,52)
	self:addTradeAcquire(RecipeDB,63770,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- Springy Arachnoweave -- 63765
	self:addTradeSkill(RecipeDB,63765,380,nil,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,63765,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,53,54)
	self:addTradeAcquire(RecipeDB,63765,1,25277,1,26907,1,26955,1,26991,1,28697,1,33586)

	-- High-powered Flashlight -- 63750
	self:addTradeSkill(RecipeDB,63750,250,45631,1,4036,nil,2)
	self:addTradeFlags(RecipeDB,63750,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51,61)
	self:addTradeAcquire(RecipeDB,63750,1,25277,1,26907,1,26955,1,26991,1,28697,1,16667,1,1702,1,16726,1,11017,1,33586,1,3494,
	1,5174,1,3290,1,5518,1,33611,1,33634,1,1676,1,8736)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Goblin Beam Welder -- 67326
		self:addTradeSkill(RecipeDB,67326,450,47828,1,4036,nil,2)
		self:addTradeFlags(RecipeDB,67326,1,2)
		--self:addTradeAcquire(RecipeDB,67326

		return 292

	else

		return 291

	end

end
