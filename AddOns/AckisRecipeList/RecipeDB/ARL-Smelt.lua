--[[

************************************************************************

ARL-Smelt.lua

Smelting data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-12T19:16:10Z 
File revision: 2199 
Project revision: 2271
Project version: r2271

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

function addon:InitSmelting(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Smelt Copper -- 2657
	self:addTradeSkill(RecipeDB,2657,1,2840,1,32606,nil,0,1,25,47,70)
	self:addTradeFlags(RecipeDB,2657,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2657,8,8)

	-- Smelt Silver -- 2658
	self:addTradeSkill(RecipeDB,2658,75,2842,1,32606,nil,0,75,115,122,130)
	self:addTradeFlags(RecipeDB,2658,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2658,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Bronze -- 2659
	self:addTradeSkill(RecipeDB,2659,65,2841,1,32606,nil,0,0,65,90,115)
	self:addTradeFlags(RecipeDB,2659,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2659,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Tin -- 3304
	self:addTradeSkill(RecipeDB,3304,65,3576,1,32606,nil,0,0,65,70,75)
	self:addTradeFlags(RecipeDB,3304,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3304,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Iron -- 3307
	self:addTradeSkill(RecipeDB,3307,125,3575,1,32606,nil,0,125,130,145,160)
	self:addTradeFlags(RecipeDB,3307,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3307,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Gold -- 3308
	self:addTradeSkill(RecipeDB,3308,155,3577,1,32606,nil,0,155,170,177,185)
	self:addTradeFlags(RecipeDB,3308,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3308,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Steel -- 3569
	self:addTradeSkill(RecipeDB,3569,165,3859,1,32606,nil,0,0,0,0,165)
	self:addTradeFlags(RecipeDB,3569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3569,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Mithril -- 10097
	self:addTradeSkill(RecipeDB,10097,175,3860,1,32606,nil,0,0,175,202,230)
	self:addTradeFlags(RecipeDB,10097,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10097,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Truesilver -- 10098
	self:addTradeSkill(RecipeDB,10098,230,6037,1,32606,nil,0,230,235,242,250)
	self:addTradeFlags(RecipeDB,10098,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10098,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Dark Iron -- 14891
	self:addTradeSkill(RecipeDB,14891,230,11371,1,32606,nil,0,230,300,305,310)
	self:addTradeFlags(RecipeDB,14891,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,14891,4,4083)

	-- Smelt Thorium -- 16153
	self:addTradeSkill(RecipeDB,16153,250,12359,1,32606,nil,0,0,250,270,290)
	self:addTradeFlags(RecipeDB,16153,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,16153,1,1681,1,1701,1,3001,1,3137,1,3175,1,3357,1,3555,1,4254,1,4598,1,5392,
	1,5513,1,6297,1,8128,1,16663,1,16752,1,17488,1,18747,1,18779,1,18804,1,26999,1,33617,1,28698,1,26962,1,26976,
	1,33682)

	-- Smelt Elementium -- 22967
	self:addTradeSkill(RecipeDB,22967,300,17771,5,32606,nil,0,300,350,362,375)
	self:addTradeFlags(RecipeDB,22967,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22967,8,27,3,14401)

	-- Smelt Fel Iron -- 29356
	self:addTradeSkill(RecipeDB,29356,300,23445,1,32606,nil,1,0,300,307,315)
	self:addTradeFlags(RecipeDB,29356,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29356,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Adamantite -- 29358
	self:addTradeSkill(RecipeDB,29358,325,23446,1,32606,nil,1,0,325,332,340)
	self:addTradeFlags(RecipeDB,29358,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29358,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Eternium -- 29359
	self:addTradeSkill(RecipeDB,29359,350,23447,1,32606,nil,1,0,350,357,365)
	self:addTradeFlags(RecipeDB,29359,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29359,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Felsteel -- 29360
	self:addTradeSkill(RecipeDB,29360,350,23448,1,32606,nil,1,0,350,357,375)
	self:addTradeFlags(RecipeDB,29360,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29360,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Khorium -- 29361
	self:addTradeSkill(RecipeDB,29361,375,23449,1,32606,nil,1,0,0,0,375)
	self:addTradeFlags(RecipeDB,29361,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29361,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Hardened Adamantite -- 29686
	self:addTradeSkill(RecipeDB,29686,375,23573,1,32606,nil,1,0,0,0,375)
	self:addTradeFlags(RecipeDB,29686,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,29686,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Earth Shatter -- 35750
	self:addTradeSkill(RecipeDB,35750,300,22573,1,32606,nil,1,0,0,0,300)
	self:addTradeFlags(RecipeDB,35750,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35750,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Fire Sunder -- 35751
	self:addTradeSkill(RecipeDB,35751,300,22574,1,32606,nil,1,0,0,0,300)
	self:addTradeFlags(RecipeDB,35751,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35751,1,18747,1,18779,1,26999,1,33617,1,28698,1,26962,1,26976,1,33682)

	-- Smelt Cobalt -- 49252
	self:addTradeSkill(RecipeDB,49252,350,36916,1,32606,nil,2,0,350,362,375)
	self:addTradeFlags(RecipeDB,49252,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,49252,1,26912,1,26962,1,26976,1,26999,1,28698)

	-- Smelt Saronite -- 49258
	self:addTradeSkill(RecipeDB,49258,400,36913,1,32606,nil,2,0,0,0,400)
	self:addTradeFlags(RecipeDB,49258,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,49258,1,26912,1,26962,1,26976,1,26999,1,28698)

	-- Smelt Titansteel -- 55208
	self:addTradeSkill(RecipeDB,55208,450,37663,2,32606,nil,2,0,0,0,450)
	self:addTradeFlags(RecipeDB,55208,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55208,1,26912,1,26962,1,26976,1,26999,1,28698)

	-- Smelt Titanium -- 55211
	self:addTradeSkill(RecipeDB,55211,450,41163,2,32606,nil,2,0,0,0,450)
	self:addTradeFlags(RecipeDB,55211,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,55211,1,26912,1,26962,1,26976,1,26999,1,28698)

	-- Smelt Hardened Khorium -- 46353
	self:addTradeSkill(RecipeDB,46353,375,35128,3,32606,nil,1,0,0,0,375)
	self:addTradeFlags(RecipeDB,46353,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,46353,8,24)

	return 25

end
