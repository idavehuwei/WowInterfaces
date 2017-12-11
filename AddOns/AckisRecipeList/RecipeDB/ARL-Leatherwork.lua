--[[

************************************************************************

ARL-Leatherwork.lua

Leatherworking data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-27T22:30:06Z 
File revision: 2256 
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

function addon:InitLeatherworking(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Handstitched Leather Boots -- 2149
	self:addTradeSkill(RecipeDB,2149,10,2302,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2149,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2149,8,8)

	-- Light Armor Kit -- 2152
	self:addTradeSkill(RecipeDB,2152,1,2304,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2152,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2152,8,8)

	-- Handstitched Leather Pants -- 2153
	self:addTradeSkill(RecipeDB,2153,15,2303,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2153,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2153,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,1,3549,
	1,3605,1,3703,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,1,11084,1,11096,1,
	11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,1,18771,1,19187,1,
	21087,1,1385,1,3967,1,33612,1,33635)

	-- Fine Leather Boots -- 2158
	self:addTradeSkill(RecipeDB,2158,90,2307,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,2158,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,51,57)
	self:addTradeAcquire(RecipeDB,2158,7,2)

	-- Fine Leather Cloak -- 2159
	self:addTradeSkill(RecipeDB,2159,85,2308,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2159,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2159,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,1,5127,
	1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,1,19187,1,21087,1,
	1632,1,5784,1,3549,1,33612,1,33635)

	-- Embossed Leather Vest -- 2160
	self:addTradeSkill(RecipeDB,2160,40,2300,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2160,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2160,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,1,3549,
	1,3605,1,3703,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,1,11084,1,11096,
	1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,1,18771,1,19187,
	1,21087,1,1385,1,3967,1,33612,1,33635)

	-- Embossed Leather Boots -- 2161
	self:addTradeSkill(RecipeDB,2161,55,2309,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2161,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2161,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,1,3549,
	1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,1,11084,1,11096,
	1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,1,18771,1,19187,
	1,21087,1,1385,1,33612,1,33635)

	-- Embossed Leather Cloak -- 2162
	self:addTradeSkill(RecipeDB,2162,60,2310,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2162,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2162,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,1,3549,
	1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,1,11084,
	1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,1,18771,
	1,19187,1,21087,1,1385,1,33612,1,33635)

	-- White Leather Jerkin -- 2163
	self:addTradeSkill(RecipeDB,2163,60,2311,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,2163,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,2163,7,2)

	-- Fine Leather Gloves -- 2164
	self:addTradeSkill(RecipeDB,2164,75,2312,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,2164,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,2164,7,2)

	-- Medium Armor Kit -- 2165
	self:addTradeSkill(RecipeDB,2165,100,2313,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2165,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2165,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,1,5127,
	1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,1,19187,1,21087,
	1,1632,1,5784,1,1385,1,3549,1,33612,1,33635)

	-- Toughened Leather Armor -- 2166
	self:addTradeSkill(RecipeDB,2166,120,2314,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2166,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2166,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dark Leather Boots -- 2167
	self:addTradeSkill(RecipeDB,2167,100,2315,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2167,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,2167,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dark Leather Cloak -- 2168
	self:addTradeSkill(RecipeDB,2168,110,2316,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2168,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,2168,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dark Leather Tunic -- 2169
	self:addTradeSkill(RecipeDB,2169,100,2317,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,2169,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,2169,7,2)

	-- Light Leather -- 2881
	self:addTradeSkill(RecipeDB,2881,1,2318,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,2881,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,2881,8,8)

	-- Handstitched Leather Belt -- 3753
	self:addTradeSkill(RecipeDB,3753,25,4237,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3753,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3753,1,223,1,1385,1,1466,1,1632,1,3007,1,3008,
	1,3069,1,3365,1,3549,1,3605,1,3703,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,
	1,11081,1,11083,1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,
	1,16745,1,17442,1,18754,1,18771,1,19187,1,21087,1,3967,1,33612,1,33635)

	-- Embossed Leather Gloves -- 3756
	self:addTradeSkill(RecipeDB,3756,55,4239,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3756,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3756,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,
	1,3365,1,3549,1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,
	1,11081,1,11083,1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,
	1,16745,1,17442,1,18754,1,18771,1,19187,1,21087,1,1385,1,33635,1,33612)

	-- Embossed Leather Pants -- 3759
	self:addTradeSkill(RecipeDB,3759,75,4242,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3759,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3759,1,223,1,1385,1,1466,1,1632,1,3007,1,3008,
	1,3069,1,3365,1,3549,1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,
	1,5811,1,11081,1,11083,1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,
	1,16728,1,16745,1,17442,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Hillman's Cloak -- 3760
	self:addTradeSkill(RecipeDB,3760,150,3719,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3760,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,3760,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Fine Leather Tunic -- 3761
	self:addTradeSkill(RecipeDB,3761,85,4243,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3761,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3761,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,1385,1,3549,1,33635,1,33612)

	-- Hillman's Leather Vest -- 3762
	self:addTradeSkill(RecipeDB,3762,100,4244,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3762,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3762,7,2)

	-- Fine Leather Belt -- 3763
	self:addTradeSkill(RecipeDB,3763,80,4246,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3763,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3763,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,1385,1,3549,1,33635,1,33612)

	-- Hillman's Leather Gloves -- 3764
	self:addTradeSkill(RecipeDB,3764,145,4247,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3764,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3764,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dark Leather Gloves -- 3765
	self:addTradeSkill(RecipeDB,3765,120,4248,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3765,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3765,7,2)

	-- Dark Leather Belt -- 3766
	self:addTradeSkill(RecipeDB,3766,125,4249,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3766,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3766,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Hillman's Belt -- 3767
	self:addTradeSkill(RecipeDB,3767,120,4250,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3767,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3767,7,2)

	-- Hillman's Shoulders -- 3768
	self:addTradeSkill(RecipeDB,3768,130,4251,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3768,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3768,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dark Leather Shoulders -- 3769
	self:addTradeSkill(RecipeDB,3769,140,4252,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3769,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3769,7,2)

	-- Toughened Leather Gloves -- 3770
	self:addTradeSkill(RecipeDB,3770,135,4253,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3770,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3770,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Barbaric Gloves -- 3771
	self:addTradeSkill(RecipeDB,3771,150,4254,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3771,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3771,7,2)

	-- Green Leather Armor -- 3772
	self:addTradeSkill(RecipeDB,3772,155,4255,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3772,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3772,2,2679,2,2698)

	-- Guardian Armor -- 3773
	self:addTradeSkill(RecipeDB,3773,175,4256,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3773,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3773,7,2)

	-- Green Leather Belt -- 3774
	self:addTradeSkill(RecipeDB,3774,160,4257,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3774,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3774,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Guardian Belt -- 3775
	self:addTradeSkill(RecipeDB,3775,170,4258,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,3775,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3775,7,3)

	-- Green Leather Bracers -- 3776
	self:addTradeSkill(RecipeDB,3776,180,4259,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3776,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,3776,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Guardian Leather Bracers -- 3777
	self:addTradeSkill(RecipeDB,3777,195,4260,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,3777,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3777,7,2)

	-- Gem-studded Leather Belt -- 3778
	self:addTradeSkill(RecipeDB,3778,185,4262,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3778,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3778,2,2699)

	-- Barbaric Belt -- 3779
	self:addTradeSkill(RecipeDB,3779,200,4264,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,3779,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,3779,7,2)

	-- Heavy Armor Kit -- 3780
	self:addTradeSkill(RecipeDB,3780,150,4265,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3780,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3780,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Cured Light Hide -- 3816
	self:addTradeSkill(RecipeDB,3816,35,4231,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3816,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3816,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,
	1,3549,1,3605,1,3703,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,
	1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,
	1,18754,1,18771,1,19187,1,21087,1,1385,1,3967,1,33612,1,33635)

	-- Cured Medium Hide -- 3817
	self:addTradeSkill(RecipeDB,3817,100,4233,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3817,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3817,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,1,5127,
	1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,1,19187,
	1,21087,1,1632,1,5784,1,1385,1,3549,1,33612,1,33635)

	-- Cured Heavy Hide -- 3818
	self:addTradeSkill(RecipeDB,3818,150,4236,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,3818,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3818,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Raptor Hide Belt -- 4097
	self:addTradeSkill(RecipeDB,4097,165,4456,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,4097,1,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,4097,2,2816)

	-- Kodo Hide Bag -- 5244
	self:addTradeSkill(RecipeDB,5244,40,5081,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,5244,2,8,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,5244,4,769)

	-- Barbaric Harness -- 6661
	self:addTradeSkill(RecipeDB,6661,190,5739,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,6661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,6661,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Murloc Scale Belt -- 6702
	self:addTradeSkill(RecipeDB,6702,90,5780,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,6702,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,6702,3,1732,3,3385,2,843,2,3556,2,4186)

	-- Murloc Scale Breastplate -- 6703
	self:addTradeSkill(RecipeDB,6703,95,5781,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,6703,1,2,4,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,6703,3,657,3,3386,2,843,2,3556,2,4186)

	-- Thick Murloc Armor -- 6704
	self:addTradeSkill(RecipeDB,6704,170,5782,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,6704,1,2,4,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,6704,3,938,3,1160,2,2381,2,2393)

	-- Murloc Scale Bracers -- 6705
	self:addTradeSkill(RecipeDB,6705,190,5783,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,6705,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,6705,3,2636,3,1561)

	-- Handstitched Leather Vest -- 7126
	self:addTradeSkill(RecipeDB,7126,10,5957,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7126,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,7126,8,8)

	-- Fine Leather Pants -- 7133
	self:addTradeSkill(RecipeDB,7133,105,5958,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,7133,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,7133,7,2)

	-- Dark Leather Pants -- 7135
	self:addTradeSkill(RecipeDB,7135,115,5961,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7135,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,7135,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,1,5127,
	1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,1,19187,1,21087,
	1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Guardian Pants -- 7147
	self:addTradeSkill(RecipeDB,7147,160,5962,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7147,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,7147,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Barbaric Leggings -- 7149
	self:addTradeSkill(RecipeDB,7149,170,5963,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7149,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,7149,2,2810,2,2821,2,3958,2,4877)

	-- Barbaric Shoulders -- 7151
	self:addTradeSkill(RecipeDB,7151,175,5964,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7151,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,7151,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,1632,1,5784,1,16728,1,1385,1,3549,1,3365,1,3967,1,3703,1,33612,1,33635)

	-- Guardian Cloak -- 7153
	self:addTradeSkill(RecipeDB,7153,185,5965,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,7153,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,7153,7,2)

	-- Guardian Gloves -- 7156
	self:addTradeSkill(RecipeDB,7156,190,5966,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7156,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,7156,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,1632,1,5784,1,16728,1,1385,1,3549,1,3365,1,3967,1,3703,1,33612,1,33635)

	-- Deviate Scale Cloak -- 7953
	self:addTradeSkill(RecipeDB,7953,90,6466,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7953,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,7953,2,5783)

	-- Deviate Scale Gloves -- 7954
	self:addTradeSkill(RecipeDB,7954,105,6467,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,7954,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,7954,2,5783)

	-- Deviate Scale Belt -- 7955
	self:addTradeSkill(RecipeDB,7955,115,6468,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,7955,1,2,8,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,7955,4,1487)

	-- Moonglow Vest -- 8322
	self:addTradeSkill(RecipeDB,8322,90,6709,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,8322,1,8,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,8322,4,1582)

	-- Handstitched Leather Cloak -- 9058
	self:addTradeSkill(RecipeDB,9058,10,7276,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9058,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,9058,8,8)

	-- Handstitched Leather Bracers -- 9059
	self:addTradeSkill(RecipeDB,9059,10,7277,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9059,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9059,8,8)

	-- Light Leather Quiver -- 9060
	self:addTradeSkill(RecipeDB,9060,30,7278,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9060,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9060,1,223,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,1,3549,
	1,3605,1,3703,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,1,11084,1,11096,
	1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,1,18771,1,19187,
	1,21087,1,1385,1,3967,1,33612,1,33635)

	-- Small Leather Ammo Pouch -- 9062
	self:addTradeSkill(RecipeDB,9062,30,7279,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9062,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9062,1,223,1,1385,1,1466,1,1632,1,3007,1,3008,1,3069,1,3365,
	1,3549,1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,1,11083,
	1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,1,18754,
	1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Rugged Leather Pants -- 9064
	self:addTradeSkill(RecipeDB,9064,35,7280,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9064,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9064,7,2)

	-- Light Leather Bracers -- 9065
	self:addTradeSkill(RecipeDB,9065,70,7281,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9065,1,223,1,1385,1,1466,1,1632,1,3007,1,3008,1,3069,
	1,3365,1,3549,1,3605,1,3703,1,3967,1,4212,1,4588,1,5127,1,5564,1,5784,1,5811,1,11081,
	1,11083,1,11084,1,11096,1,11097,1,11098,1,16278,1,16687,1,16688,1,16728,1,16745,1,17442,
	1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Light Leather Pants -- 9068
	self:addTradeSkill(RecipeDB,9068,95,7282,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9068,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9068,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,1,19187,
	1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Black Whelp Cloak -- 9070
	self:addTradeSkill(RecipeDB,9070,100,7283,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9070,1,4,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,9070,2,2697)

	-- Red Whelp Gloves -- 9072
	self:addTradeSkill(RecipeDB,9072,120,7284,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9072,1,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9072,2,2679)

	-- Nimble Leather Gloves -- 9074
	self:addTradeSkill(RecipeDB,9074,120,7285,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9074,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9074,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Fletcher's Gloves -- 9145
	self:addTradeSkill(RecipeDB,9145,125,7348,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9145,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,57)
	self:addTradeAcquire(RecipeDB,9145,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Herbalist's Gloves -- 9146
	self:addTradeSkill(RecipeDB,9146,135,7349,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9146,1,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9146,2,6731)

	-- Earthen Leather Shoulders -- 9147
	self:addTradeSkill(RecipeDB,9147,135,7352,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9147,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9147,2,3537)

	-- Pilferer's Gloves -- 9148
	self:addTradeSkill(RecipeDB,9148,140,7358,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9148,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9148,7,2)

	-- Heavy Earthen Gloves -- 9149
	self:addTradeSkill(RecipeDB,9149,145,7359,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9149,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9149,7,2)

	-- Heavy Quiver -- 9193
	self:addTradeSkill(RecipeDB,9193,150,7371,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9193,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9193,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Heavy Leather Ammo Pouch -- 9194
	self:addTradeSkill(RecipeDB,9194,150,7372,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9194,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,9194,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Dusky Leather Leggings -- 9195
	self:addTradeSkill(RecipeDB,9195,165,7373,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9195,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9195,7,2)

	-- Dusky Leather Armor -- 9196
	self:addTradeSkill(RecipeDB,9196,175,7374,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9196,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9196,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Green Whelp Armor -- 9197
	self:addTradeSkill(RecipeDB,9197,175,7375,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9197,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9197,7,2)

	-- Frost Leather Cloak -- 9198
	self:addTradeSkill(RecipeDB,9198,180,7377,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9198,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,9198,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Dusky Bracers -- 9201
	self:addTradeSkill(RecipeDB,9201,185,7378,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9201,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9201,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Green Whelp Bracers -- 9202
	self:addTradeSkill(RecipeDB,9202,190,7386,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9202,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9202,2,7854,2,4589,2,7852,2,4225)

	-- Dusky Belt -- 9206
	self:addTradeSkill(RecipeDB,9206,195,7387,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,9206,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,9206,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Dusky Boots -- 9207
	self:addTradeSkill(RecipeDB,9207,200,7390,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,9207,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9207,7,2)

	-- Swift Boots -- 9208
	self:addTradeSkill(RecipeDB,9208,200,7391,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,9208,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,9208,7,2)

	-- Cured Thick Hide -- 10482
	self:addTradeSkill(RecipeDB,10482,200,8172,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10482,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10482,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Thick Armor Kit -- 10487
	self:addTradeSkill(RecipeDB,10487,200,8173,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10487,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10487,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Comfortable Leather Hat -- 10490
	self:addTradeSkill(RecipeDB,10490,200,8174,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,10490,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,10490,7,2)

	-- Nightscape Tunic -- 10499
	self:addTradeSkill(RecipeDB,10499,205,8175,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10499,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10499,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Nightscape Headband -- 10507
	self:addTradeSkill(RecipeDB,10507,205,8176,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10507,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10507,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Turtle Scale Gloves -- 10509
	self:addTradeSkill(RecipeDB,10509,205,8187,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10509,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10509,2,7852,2,7854)

	-- Turtle Scale Breastplate -- 10511
	self:addTradeSkill(RecipeDB,10511,210,8189,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10511,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10511,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Nightscape Shoulders -- 10516
	self:addTradeSkill(RecipeDB,10516,210,8192,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10516,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10516,2,7854,2,8160)

	-- Turtle Scale Bracers -- 10518
	self:addTradeSkill(RecipeDB,10518,210,8198,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10518,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10518,1,3007,1,4212,1,11097,1,11098,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Big Voodoo Robe -- 10520
	self:addTradeSkill(RecipeDB,10520,215,8200,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10520,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,10520,7,2)

	-- Tough Scorpid Breastplate -- 10525
	self:addTradeSkill(RecipeDB,10525,220,8203,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10525,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10525,3,5618)

	-- Wild Leather Shoulders -- 10529
	self:addTradeSkill(RecipeDB,10529,220,8210,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10529,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10529,4,2848,4,2855)

	-- Big Voodoo Mask -- 10531
	self:addTradeSkill(RecipeDB,10531,220,8201,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10531,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,10531,7,2)

	-- Tough Scorpid Bracers -- 10533
	self:addTradeSkill(RecipeDB,10533,220,8205,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10533,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10533,3,5617)

	-- Tough Scorpid Gloves -- 10542
	self:addTradeSkill(RecipeDB,10542,225,8204,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10542,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10542,3,5616)

	-- Wild Leather Vest -- 10544
	self:addTradeSkill(RecipeDB,10544,225,8211,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10544,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10544,4,2849,4,2856)

	-- Wild Leather Helmet -- 10546
	self:addTradeSkill(RecipeDB,10546,225,8214,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10546,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10546,4,2850,4,2857)

	-- Nightscape Pants -- 10548
	self:addTradeSkill(RecipeDB,10548,230,8193,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10548,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10548,1,11097,1,11098,1,18754,1,18771,1,19187,1,21087,
	1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Turtle Scale Helm -- 10552
	self:addTradeSkill(RecipeDB,10552,230,8191,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10552,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10552,1,11097,1,11098,1,18754,1,18771,1,19187,1,21087,
	1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Tough Scorpid Boots -- 10554
	self:addTradeSkill(RecipeDB,10554,235,8209,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10554,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10554,3,5615)

	-- Turtle Scale Leggings -- 10556
	self:addTradeSkill(RecipeDB,10556,235,8185,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10556,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10556,1,11097,1,11098,1,18754,1,18771,1,19187,1,21087,
	1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Nightscape Boots -- 10558
	self:addTradeSkill(RecipeDB,10558,235,8197,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10558,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10558,1,11097,1,11098,1,18754,1,18771,1,19187,1,21087,
	1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Big Voodoo Pants -- 10560
	self:addTradeSkill(RecipeDB,10560,240,8202,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10560,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,10560,7,2)

	-- Big Voodoo Cloak -- 10562
	self:addTradeSkill(RecipeDB,10562,240,8216,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10562,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,10562,7,2)

	-- Tough Scorpid Shoulders -- 10564
	self:addTradeSkill(RecipeDB,10564,240,8207,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10564,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10564,3,5623,3,7805,3,7883)

	-- Wild Leather Boots -- 10566
	self:addTradeSkill(RecipeDB,10566,245,8213,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10566,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10566,4,2851,4,2858)

	-- Tough Scorpid Leggings -- 10568
	self:addTradeSkill(RecipeDB,10568,245,8206,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10568,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10568,3,5615)

	-- Tough Scorpid Helm -- 10570
	self:addTradeSkill(RecipeDB,10570,250,8208,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10570,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,10570,3,5623,3,7805,3,7883)

	-- Wild Leather Leggings -- 10572
	self:addTradeSkill(RecipeDB,10572,250,8212,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10572,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10572,4,2852,4,2859)

	-- Wild Leather Cloak -- 10574
	self:addTradeSkill(RecipeDB,10574,250,8215,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,10574,1,2,8,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,10574,4,2853,4,2860)

	-- Dragonscale Gauntlets -- 10619
	self:addTradeSkill(RecipeDB,10619,225,8347,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10619,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10619,1,7866,1,7867,1,29508)

	-- Wolfshead Helm -- 10621
	self:addTradeSkill(RecipeDB,10621,225,8345,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10621,1,2,3,22,36,41,57)
	self:addTradeAcquire(RecipeDB,10621,1,7870,1,7871,1,29509)

	-- Gauntlets of the Sea -- 10630
	self:addTradeSkill(RecipeDB,10630,230,8346,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10630,1,7868,1,7869,1,29507)

	-- Helm of Fire -- 10632
	self:addTradeSkill(RecipeDB,10632,250,8348,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10632,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10632,1,7868,1,7869,1,29507)

	-- Feathered Breastplate -- 10647
	self:addTradeSkill(RecipeDB,10647,250,8349,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10647,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,10647,1,7870,1,7871,1,29509)

	-- Dragonscale Breastplate -- 10650
	self:addTradeSkill(RecipeDB,10650,255,8367,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,10650,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,10650,1,7866,1,7867,1,29508)

	-- Quickdraw Quiver -- 14930
	self:addTradeSkill(RecipeDB,14930,225,8217,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,14930,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,14930,1,3007,1,4212,1,11097,1,11098,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Thick Leather Ammo Pouch -- 14932
	self:addTradeSkill(RecipeDB,14932,225,8218,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,14932,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,14932,1,3007,1,4212,1,11097,1,11098,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Cured Rugged Hide -- 19047
	self:addTradeSkill(RecipeDB,19047,250,15407,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19047,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19047,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Heavy Scorpid Bracers -- 19048
	self:addTradeSkill(RecipeDB,19048,255,15077,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19048,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,19048,2,12956)

	-- Wicked Leather Gauntlets -- 19049
	self:addTradeSkill(RecipeDB,19049,260,15083,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19049,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19049,2,12942,2,12943)

	-- Green Dragonscale Breastplate -- 19050
	self:addTradeSkill(RecipeDB,19050,260,15045,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19050,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19050,2,11874)

	-- Heavy Scorpid Vest -- 19051
	self:addTradeSkill(RecipeDB,19051,265,15076,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19051,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19051,3,5981,3,6005)

	-- Wicked Leather Bracers -- 19052
	self:addTradeSkill(RecipeDB,19052,265,15084,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19052,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19052,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,
	1,3967,1,33612,1,33635)

	-- Chimeric Gloves -- 19053
	self:addTradeSkill(RecipeDB,19053,265,15074,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19053,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,19053,2,12957)

	-- Red Dragonscale Breastplate -- 19054
	self:addTradeSkill(RecipeDB,19054,300,15047,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19054,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,19054,3,10363)

	-- Runic Leather Gauntlets -- 19055
	self:addTradeSkill(RecipeDB,19055,270,15091,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19055,1,2,3,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19055,7,2,1,1385,1,3007,1,3365,1,3703,1,3967,
	1,4212,1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Rugged Armor Kit -- 19058
	self:addTradeSkill(RecipeDB,19058,250,15564,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19058,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,19058,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Volcanic Leggings -- 19059
	self:addTradeSkill(RecipeDB,19059,270,15054,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19059,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19059,3,7035)

	-- Green Dragonscale Leggings -- 19060
	self:addTradeSkill(RecipeDB,19060,270,15046,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19060,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19060,3,5226)

	-- Living Shoulders -- 19061
	self:addTradeSkill(RecipeDB,19061,270,15061,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19061,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19061,2,7852,2,7854)

	-- Ironfeather Shoulders -- 19062
	self:addTradeSkill(RecipeDB,19062,270,15067,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19062,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,19062,2,12958)

	-- Chimeric Boots -- 19063
	self:addTradeSkill(RecipeDB,19063,275,15073,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19063,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19063,7,2)

	-- Heavy Scorpid Gauntlets -- 19064
	self:addTradeSkill(RecipeDB,19064,275,15078,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19064,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19064,3,7025)

	-- Runic Leather Bracers -- 19065
	self:addTradeSkill(RecipeDB,19065,275,15092,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19065,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19065,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Frostsaber Boots -- 19066
	self:addTradeSkill(RecipeDB,19066,275,15071,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19066,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,19066,2,11189)

	-- Stormshroud Pants -- 19067
	self:addTradeSkill(RecipeDB,19067,275,15057,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19067,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,52,57)
	self:addTradeAcquire(RecipeDB,19067,2,12942,2,12943)

	-- Warbear Harness -- 19068
	self:addTradeSkill(RecipeDB,19068,275,15064,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19068,1,2,4,6,11,21,22,23,24,25,26,27,28,29,30,36,41,57,99)
	self:addTradeAcquire(RecipeDB,19068,6,576,1,11557)

	-- Heavy Scorpid Belt -- 19070
	self:addTradeSkill(RecipeDB,19070,280,15082,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19070,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19070,7,2)

	-- Wicked Leather Headband -- 19071
	self:addTradeSkill(RecipeDB,19071,280,15086,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19071,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19071,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Runic Leather Belt -- 19072
	self:addTradeSkill(RecipeDB,19072,280,15093,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19072,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19072,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,1632,1,5784,1,16728,1,3007,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Chimeric Leggings -- 19073
	self:addTradeSkill(RecipeDB,19073,280,15072,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19073,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19073,7,2)

	-- Frostsaber Leggings -- 19074
	self:addTradeSkill(RecipeDB,19074,285,15069,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19074,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19074,3,7440)

	-- Heavy Scorpid Leggings -- 19075
	self:addTradeSkill(RecipeDB,19075,285,15079,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19075,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19075,3,7027)

	-- Volcanic Breastplate -- 19076
	self:addTradeSkill(RecipeDB,19076,285,15053,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19076,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19076,3,9259)

	-- Blue Dragonscale Breastplate -- 19077
	self:addTradeSkill(RecipeDB,19077,285,15048,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19077,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,19077,2,12957)

	-- Living Leggings -- 19078
	self:addTradeSkill(RecipeDB,19078,285,15060,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19078,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19078,3,7158)

	-- Stormshroud Armor -- 19079
	self:addTradeSkill(RecipeDB,19079,285,15056,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19079,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,52,57)
	self:addTradeAcquire(RecipeDB,19079,3,6138)

	-- Warbear Woolies -- 19080
	self:addTradeSkill(RecipeDB,19080,285,15065,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19080,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,99)
	self:addTradeAcquire(RecipeDB,19080,6,576,1,11557)

	-- Chimeric Vest -- 19081
	self:addTradeSkill(RecipeDB,19081,290,15075,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19081,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19081,7,2)

	-- Runic Leather Headband -- 19082
	self:addTradeSkill(RecipeDB,19082,290,15094,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19082,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19082,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Wicked Leather Pants -- 19083
	self:addTradeSkill(RecipeDB,19083,290,15087,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19083,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19083,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Devilsaur Gauntlets -- 19084
	self:addTradeSkill(RecipeDB,19084,290,15063,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19084,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19084,2,12959)

	-- Black Dragonscale Breastplate -- 19085
	self:addTradeSkill(RecipeDB,19085,290,15050,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19085,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,19085,2,9499)

	-- Ironfeather Breastplate -- 19086
	self:addTradeSkill(RecipeDB,19086,290,15066,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19086,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19086,3,2644)

	-- Frostsaber Gloves -- 19087
	self:addTradeSkill(RecipeDB,19087,295,15070,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19087,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19087,3,7441)

	-- Heavy Scorpid Helm -- 19088
	self:addTradeSkill(RecipeDB,19088,295,15080,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,19088,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,19088,2,12956)

	-- Blue Dragonscale Shoulders -- 19089
	self:addTradeSkill(RecipeDB,19089,295,15049,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19089,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19089,3,6146)

	-- Stormshroud Shoulders -- 19090
	self:addTradeSkill(RecipeDB,19090,295,15058,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19090,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,52,57)
	self:addTradeAcquire(RecipeDB,19090,3,6144)

	-- Runic Leather Pants -- 19091
	self:addTradeSkill(RecipeDB,19091,300,15095,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19091,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19091,1,11097,1,11098,1,18754,1,18771,1,19187,
	1,21087,1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,
	1,3967,1,33612,1,33635)

	-- Wicked Leather Belt -- 19092
	self:addTradeSkill(RecipeDB,19092,300,15088,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19092,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19092,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Onyxia Scale Cloak -- 19093
	self:addTradeSkill(RecipeDB,19093,300,15138,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19093,1,2,6,8,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,19093,4,7493,4,7497,8,10)

	-- Black Dragonscale Shoulders -- 19094
	self:addTradeSkill(RecipeDB,19094,300,15051,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19094,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19094,3,8898)

	-- Living Breastplate -- 19095
	self:addTradeSkill(RecipeDB,19095,300,15059,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19095,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19095,3,1813)

	-- Devilsaur Leggings -- 19097
	self:addTradeSkill(RecipeDB,19097,300,15062,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19097,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19097,3,6556,3,6557,3,6559,3,9477)

	-- Wicked Leather Armor -- 19098
	self:addTradeSkill(RecipeDB,19098,300,15085,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19098,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19098,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Heavy Scorpid Shoulders -- 19100
	self:addTradeSkill(RecipeDB,19100,300,15081,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19100,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19100,3,7029)

	-- Volcanic Shoulders -- 19101
	self:addTradeSkill(RecipeDB,19101,300,15055,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19101,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19101,3,9260)

	-- Runic Leather Armor -- 19102
	self:addTradeSkill(RecipeDB,19102,300,15090,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19102,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19102,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Runic Leather Shoulders -- 19103
	self:addTradeSkill(RecipeDB,19103,300,15096,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19103,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19103,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Frostsaber Tunic -- 19104
	self:addTradeSkill(RecipeDB,19104,300,15068,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,19104,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,19104,3,7438)

	-- Black Dragonscale Leggings -- 19107
	self:addTradeSkill(RecipeDB,19107,300,15052,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,19107,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,19107,3,8903)

	-- Medium Leather -- 20648
	self:addTradeSkill(RecipeDB,20648,100,2319,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20648,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20648,1,3007,1,3365,1,3703,1,3967,1,4212,1,4588,
	1,5127,1,5564,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,1,18754,1,18771,
	1,19187,1,21087,1,1632,1,5784,1,1385,1,3549,1,33635,1,33612)

	-- Heavy Leather -- 20649
	self:addTradeSkill(RecipeDB,20649,150,4234,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20649,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20649,1,1385,1,3007,1,3365,1,3703,1,3967,1,4212,
	1,4588,1,5127,1,5564,1,8153,1,11081,1,11084,1,11097,1,11098,1,16688,1,16728,
	1,18754,1,18771,1,19187,1,21087,1,1632,1,5784,1,3549,1,33612,1,33635)

	-- Thick Leather -- 20650
	self:addTradeSkill(RecipeDB,20650,200,4304,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20650,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,20650,1,3007,1,4212,1,11097,1,11098,1,18754,
	1,18771,1,19187,1,21087,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,
	1,3967,1,33612,1,33635)

	-- Corehound Boots -- 20853
	self:addTradeSkill(RecipeDB,20853,295,16982,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20853,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,20853,2,12944)

	-- Molten Helm -- 20854
	self:addTradeSkill(RecipeDB,20854,300,16983,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20854,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57)
	self:addTradeAcquire(RecipeDB,20854,2,12944)

	-- Black Dragonscale Boots -- 20855
	self:addTradeSkill(RecipeDB,20855,300,16984,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,20855,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,98)
	self:addTradeAcquire(RecipeDB,20855,6,59,2,12944)

	-- Gloves of the Greatfather -- 21943
	self:addTradeSkill(RecipeDB,21943,190,17721,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,21943,1,2,7,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,21943,5,1)

	-- Rugged Leather -- 22331
	self:addTradeSkill(RecipeDB,22331,250,8170,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,22331,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22331,1,11097,1,11098,1,18754,1,18771,1,19187,1,21087,
	1,4212,1,3007,1,1632,1,5784,1,16728,1,3703,1,1385,1,3549,1,3365,1,3967,1,33612,1,33635)

	-- Shadowskin Gloves -- 22711
	self:addTradeSkill(RecipeDB,22711,200,18238,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,22711,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,22711,2,2699)

	-- Core Armor Kit -- 22727
	self:addTradeSkill(RecipeDB,22727,300,18251,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,22727,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22727,8,26)

	-- Gordok Ogre Suit -- 22815
	self:addTradeSkill(RecipeDB,22815,275,18258,2,2108,nil,0)
	self:addTradeFlags(RecipeDB,22815,1,2,5,8,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,22815,4,5518)

	-- Girdle of Insight -- 22921
	self:addTradeSkill(RecipeDB,22921,300,18504,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,22921,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,22921,8,23)

	-- Mongoose Boots -- 22922
	self:addTradeSkill(RecipeDB,22922,300,18506,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,22922,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,22922,8,23)

	-- Swift Flight Bracers -- 22923
	self:addTradeSkill(RecipeDB,22923,300,18508,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,22923,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,22923,8,23)

	-- Chromatic Cloak -- 22926
	self:addTradeSkill(RecipeDB,22926,300,18509,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,22926,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,22926,8,23)

	-- Hide of the Wild -- 22927
	self:addTradeSkill(RecipeDB,22927,300,18510,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,22927,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,60)
	self:addTradeAcquire(RecipeDB,22927,8,23)

	-- Shifting Cloak -- 22928
	self:addTradeSkill(RecipeDB,22928,300,18511,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,22928,1,2,5,21,22,23,24,25,26,27,28,29,30,36,40,52,60)
	self:addTradeAcquire(RecipeDB,22928,8,23)

	-- Heavy Leather Ball -- 23190
	self:addTradeSkill(RecipeDB,23190,150,18662,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23190,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,23190,2,5128,2,3366)

	-- Barbaric Bracers -- 23399
	self:addTradeSkill(RecipeDB,23399,155,18948,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23399,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,23399,2,4225,2,4589)

	-- Might of the Timbermaw -- 23703
	self:addTradeSkill(RecipeDB,23703,290,19044,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,99)
	self:addTradeAcquire(RecipeDB,23703,6,576,2,11557)

	-- Timbermaw Brawlers -- 23704
	self:addTradeSkill(RecipeDB,23704,300,19049,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23704,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,99)
	self:addTradeAcquire(RecipeDB,23704,6,576,3,11557)

	-- Dawn Treaders -- 23705
	self:addTradeSkill(RecipeDB,23705,290,19052,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23705,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57,96)
	self:addTradeAcquire(RecipeDB,23705,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Golden Mantle of the Dawn -- 23706
	self:addTradeSkill(RecipeDB,23706,300,19058,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23706,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57,96)
	self:addTradeAcquire(RecipeDB,23706,6,529,3,10856,6,529,3,10857,6,529,3,11536)

	-- Lava Belt -- 23707
	self:addTradeSkill(RecipeDB,23707,300,19149,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23707,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,98)
	self:addTradeAcquire(RecipeDB,23707,6,59,2,12944)

	-- Chromatic Gauntlets -- 23708
	self:addTradeSkill(RecipeDB,23708,300,19157,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23708,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,98)
	self:addTradeAcquire(RecipeDB,23708,6,59,3,12944)

	-- Corehound Belt -- 23709
	self:addTradeSkill(RecipeDB,23709,300,19162,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23709,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,98)
	self:addTradeAcquire(RecipeDB,23709,6,59,3,12944)

	-- Molten Belt -- 23710
	self:addTradeSkill(RecipeDB,23710,300,19163,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,23710,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,98)
	self:addTradeAcquire(RecipeDB,23710,6,59,3,12944)

	-- Primal Batskin Jerkin -- 24121
	self:addTradeSkill(RecipeDB,24121,300,19685,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24121,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24121,6,270,3,14921)

	-- Primal Batskin Gloves -- 24122
	self:addTradeSkill(RecipeDB,24122,300,19686,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24122,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24122,6,270,2,14921)

	-- Primal Batskin Bracers -- 24123
	self:addTradeSkill(RecipeDB,24123,300,19687,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24123,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24123,6,270,1,14921)

	-- Blood Tiger Breastplate -- 24124
	self:addTradeSkill(RecipeDB,24124,300,19688,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24124,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24124,6,270,3,14921)

	-- Blood Tiger Shoulders -- 24125
	self:addTradeSkill(RecipeDB,24125,300,19689,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24125,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,100)
	self:addTradeAcquire(RecipeDB,24125,6,270,2,14921)

	-- Blue Dragonscale Leggings -- 24654
	self:addTradeSkill(RecipeDB,24654,300,20295,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24654,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,24654,1,7866,1,7867,1,29508)

	-- Green Dragonscale Gauntlets -- 24655
	self:addTradeSkill(RecipeDB,24655,280,20296,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24655,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,24655,1,7866,1,7867,1,29508)

	-- Dreamscale Breastplate -- 24703
	self:addTradeSkill(RecipeDB,24703,300,20380,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24703,6,609,4,15293)

	-- Spitfire Bracers -- 24846
	self:addTradeSkill(RecipeDB,24846,300,20481,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24846,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24846,6,609,1,15293)

	-- Spitfire Gauntlets -- 24847
	self:addTradeSkill(RecipeDB,24847,300,20480,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24847,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24847,6,609,2,15293)

	-- Spitfire Breastplate -- 24848
	self:addTradeSkill(RecipeDB,24848,300,20479,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24848,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24848,6,609,3,15293)

	-- Sandstalker Bracers -- 24849
	self:addTradeSkill(RecipeDB,24849,300,20476,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24849,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24849,6,609,1,15293)

	-- Sandstalker Gauntlets -- 24850
	self:addTradeSkill(RecipeDB,24850,300,20477,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24850,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24850,6,609,2,15293)

	-- Sandstalker Breastplate -- 24851
	self:addTradeSkill(RecipeDB,24851,300,20478,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24851,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,97)
	self:addTradeAcquire(RecipeDB,24851,6,609,3,15293)

	-- Black Whelp Tunic -- 24940
	self:addTradeSkill(RecipeDB,24940,100,20575,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,24940,1,4,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,24940,2,777)

	-- Stormshroud Gloves -- 26279
	self:addTradeSkill(RecipeDB,26279,300,21278,3,2108,nil,0)
	self:addTradeFlags(RecipeDB,26279,1,2,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,26279,3,14454,3,14457)

	-- Polar Tunic -- 28219
	self:addTradeSkill(RecipeDB,28219,300,22661,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28219,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,28219,6,529,4,16365,8,41)

	-- Polar Gloves -- 28220
	self:addTradeSkill(RecipeDB,28220,300,22662,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28220,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,28220,6,529,3,16365,8,41)

	-- Polar Bracers -- 28221
	self:addTradeSkill(RecipeDB,28221,300,22663,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28221,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,28221,6,529,3,16365,8,41)

	-- Icy Scale Breastplate -- 28222
	self:addTradeSkill(RecipeDB,28222,300,22664,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28222,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,28222,6,529,4,16365,8,41)

	-- Icy Scale Gauntlets -- 28223
	self:addTradeSkill(RecipeDB,28223,300,22666,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28223,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,28223,6,529,3,16365,8,41)

	-- Icy Scale Bracers -- 28224
	self:addTradeSkill(RecipeDB,28224,300,22665,4,2108,nil,0)
	self:addTradeFlags(RecipeDB,28224,1,2,4,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,28224,6,529,3,16365,8,41)

	-- Bramblewood Helm -- 28472
	self:addTradeSkill(RecipeDB,28472,300,22759,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,28472,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,97)
	self:addTradeAcquire(RecipeDB,28472,6,609,3,15293)

	-- Bramblewood Boots -- 28473
	self:addTradeSkill(RecipeDB,28473,300,22760,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,28473,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,97)
	self:addTradeAcquire(RecipeDB,28473,6,609,2,15293)

	-- Bramblewood Belt -- 28474
	self:addTradeSkill(RecipeDB,28474,300,22761,1,2108,nil,0)
	self:addTradeFlags(RecipeDB,28474,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,97)
	self:addTradeAcquire(RecipeDB,28474,6,609,1,15293)

	-- Knothide Leather -- 32454
	self:addTradeSkill(RecipeDB,32454,300,21887,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32454,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,32454,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Heavy Knothide Leather -- 32455
	self:addTradeSkill(RecipeDB,32455,325,23793,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32455,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32455,2,16689,2,16748,2,19196)

	-- Knothide Armor Kit -- 32456
	self:addTradeSkill(RecipeDB,32456,300,25650,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32456,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,32456,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Vindicator's Armor Kit -- 32457
	self:addTradeSkill(RecipeDB,32457,325,25651,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32457,1,4,21,22,23,24,25,26,27,28,29,30,36,41,101)
	self:addTradeAcquire(RecipeDB,32457,6,932,3,19321)

	-- Magister's Armor Kit -- 32458
	self:addTradeSkill(RecipeDB,32458,325,25652,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32458,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,110)
	self:addTradeAcquire(RecipeDB,32458,6,934,3,19331)

	-- Riding Crop -- 32461
	self:addTradeSkill(RecipeDB,32461,350,25653,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32461,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40,61)
	self:addTradeAcquire(RecipeDB,32461,2,18672)

	-- Felscale Gloves -- 32462
	self:addTradeSkill(RecipeDB,32462,300,25654,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32462,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32462,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Felscale Boots -- 32463
	self:addTradeSkill(RecipeDB,32463,310,25655,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32463,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32463,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Felscale Pants -- 32464
	self:addTradeSkill(RecipeDB,32464,320,25656,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32464,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32464,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Felscale Breastplate -- 32465
	self:addTradeSkill(RecipeDB,32465,335,25657,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32465,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32465,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Scaled Draenic Pants -- 32466
	self:addTradeSkill(RecipeDB,32466,300,25662,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32466,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32466,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Scaled Draenic Gloves -- 32467
	self:addTradeSkill(RecipeDB,32467,310,25661,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32467,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32467,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Scaled Draenic Vest -- 32468
	self:addTradeSkill(RecipeDB,32468,325,25660,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32468,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32468,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Scaled Draenic Boots -- 32469
	self:addTradeSkill(RecipeDB,32469,335,25659,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32469,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32469,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Thick Draenic Gloves -- 32470
	self:addTradeSkill(RecipeDB,32470,300,25669,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32470,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32470,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Thick Draenic Pants -- 32471
	self:addTradeSkill(RecipeDB,32471,315,25670,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32471,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32471,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Thick Draenic Boots -- 32472
	self:addTradeSkill(RecipeDB,32472,320,25668,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32472,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32472,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Thick Draenic Vest -- 32473
	self:addTradeSkill(RecipeDB,32473,330,25671,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32473,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32473,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Wild Draenish Boots -- 32478
	self:addTradeSkill(RecipeDB,32478,300,25673,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32478,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32478,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Wild Draenish Gloves -- 32479
	self:addTradeSkill(RecipeDB,32479,310,25674,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32479,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32479,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Wild Draenish Leggings -- 32480
	self:addTradeSkill(RecipeDB,32480,320,25675,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32480,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32480,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Wild Draenish Vest -- 32481
	self:addTradeSkill(RecipeDB,32481,330,25676,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32481,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,54,57)
	self:addTradeAcquire(RecipeDB,32481,1,18754,1,18771,1,19187,1,21087,1,33635,1,33612)

	-- Comfortable Insoles -- 32482
	self:addTradeSkill(RecipeDB,32482,300,25679,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,32482,1,2,4,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,32482,2,16689,2,16748)

	-- Stylin' Purple Hat -- 32485
	self:addTradeSkill(RecipeDB,32485,350,25680,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32485,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32485,3,18667)

	-- Stylin' Adventure Hat -- 32487
	self:addTradeSkill(RecipeDB,32487,350,25681,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32487,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32487,3,17820,3,28132)

	-- Stylin' Crimson Hat -- 32488
	self:addTradeSkill(RecipeDB,32488,350,25683,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32488,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,32488,3,18322)

	-- Stylin' Jungle Hat -- 32489
	self:addTradeSkill(RecipeDB,32489,350,25682,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32489,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,32489,3,17839,3,21104)

	-- Fel Leather Gloves -- 32490
	self:addTradeSkill(RecipeDB,32490,340,25685,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32490,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51,57,105)
	self:addTradeAcquire(RecipeDB,32490,6,933,1,20242,6,933,1,23007)

	-- Fel Leather Boots -- 32493
	self:addTradeSkill(RecipeDB,32493,350,25686,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32493,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51,57,105)
	self:addTradeAcquire(RecipeDB,32493,6,933,2,20242,6,933,2,23007)

	-- Fel Leather Leggings -- 32494
	self:addTradeSkill(RecipeDB,32494,350,25687,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32494,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,51,57,105)
	self:addTradeAcquire(RecipeDB,32494,6,933,3,20242,6,933,3,23007)

	-- Heavy Clefthoof Vest -- 32495
	self:addTradeSkill(RecipeDB,32495,360,25689,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32495,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57,103)
	self:addTradeAcquire(RecipeDB,32495,6,942,2,17904)

	-- Heavy Clefthoof Leggings -- 32496
	self:addTradeSkill(RecipeDB,32496,355,25690,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32496,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57,103)
	self:addTradeAcquire(RecipeDB,32496,6,942,2,17904)

	-- Heavy Clefthoof Boots -- 32497
	self:addTradeSkill(RecipeDB,32497,355,25691,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32497,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,52,57,103)
	self:addTradeAcquire(RecipeDB,32497,6,942,1,17904)

	-- Felstalker Belt -- 32498
	self:addTradeSkill(RecipeDB,32498,350,25695,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32498,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,104)
	self:addTradeAcquire(RecipeDB,32498,6,946,1,17657)

	-- Felstalker Bracer -- 32499
	self:addTradeSkill(RecipeDB,32499,360,25697,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32499,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,104)
	self:addTradeAcquire(RecipeDB,32499,6,946,2,17657)

	-- Felstalker Breastplate -- 32500
	self:addTradeSkill(RecipeDB,32500,360,25696,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32500,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,104)
	self:addTradeAcquire(RecipeDB,32500,6,946,2,17657)

	-- Netherfury Belt -- 32501
	self:addTradeSkill(RecipeDB,32501,340,25694,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32501,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,108)
	self:addTradeAcquire(RecipeDB,32501,6,978,1,20240)

	-- Netherfury Leggings -- 32502
	self:addTradeSkill(RecipeDB,32502,340,25692,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32502,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,108)
	self:addTradeAcquire(RecipeDB,32502,6,978,2,20240)

	-- Netherfury Boots -- 32503
	self:addTradeSkill(RecipeDB,32503,350,25693,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,32503,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,108)
	self:addTradeAcquire(RecipeDB,32503,6,978,3,20240)

	-- Shadow Armor Kit -- 35520
	self:addTradeSkill(RecipeDB,35520,340,29483,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,35520,1,2,5,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35520,3,18320)

	-- Flame Armor Kit -- 35521
	self:addTradeSkill(RecipeDB,35521,340,29485,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,35521,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35521,3,20898)

	-- Frost Armor Kit -- 35522
	self:addTradeSkill(RecipeDB,35522,340,29486,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,35522,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35522,3,17797)

	-- Nature Armor Kit -- 35523
	self:addTradeSkill(RecipeDB,35523,340,29487,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,35523,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35523,3,17941)

	-- Arcane Armor Kit -- 35524
	self:addTradeSkill(RecipeDB,35524,340,29488,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,35524,1,2,5,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35524,3,17879)

	-- Enchanted Felscale Leggings -- 35525
	self:addTradeSkill(RecipeDB,35525,350,29489,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35525,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,110)
	self:addTradeAcquire(RecipeDB,35525,6,934,4,19331)

	-- Enchanted Felscale Gloves -- 35526
	self:addTradeSkill(RecipeDB,35526,350,29490,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35526,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,110)
	self:addTradeAcquire(RecipeDB,35526,6,934,2,19331)

	-- Enchanted Felscale Boots -- 35527
	self:addTradeSkill(RecipeDB,35527,350,29491,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35527,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,110)
	self:addTradeAcquire(RecipeDB,35527,6,934,3,19331)

	-- Flamescale Boots -- 35528
	self:addTradeSkill(RecipeDB,35528,350,29493,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35528,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,101)
	self:addTradeAcquire(RecipeDB,35528,6,932,3,19321)

	-- Flamescale Leggings -- 35529
	self:addTradeSkill(RecipeDB,35529,350,29492,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35529,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,101)
	self:addTradeAcquire(RecipeDB,35529,6,932,4,19321)

	-- Reinforced Mining Bag -- 35530
	self:addTradeSkill(RecipeDB,35530,325,29540,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35530,1,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB,35530,6,978,2,20240)

	-- Flamescale Belt -- 35531
	self:addTradeSkill(RecipeDB,35531,350,29494,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35531,1,4,21,22,23,24,25,26,27,28,29,30,36,41,58,101)
	self:addTradeAcquire(RecipeDB,35531,6,932,2,19321)

	-- Enchanted Clefthoof Leggings -- 35532
	self:addTradeSkill(RecipeDB,35532,350,29495,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35532,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,110)
	self:addTradeAcquire(RecipeDB,35532,6,934,4,19331)

	-- Enchanted Clefthoof Gloves -- 35533
	self:addTradeSkill(RecipeDB,35533,350,29496,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35533,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,110)
	self:addTradeAcquire(RecipeDB,35533,6,934,3,19331)

	-- Enchanted Clefthoof Boots -- 35534
	self:addTradeSkill(RecipeDB,35534,350,29497,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35534,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,110)
	self:addTradeAcquire(RecipeDB,35534,6,934,2,19331)

	-- Blastguard Pants -- 35535
	self:addTradeSkill(RecipeDB,35535,350,29498,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35535,1,4,21,22,23,24,25,26,27,28,29,30,36,41,57,101)
	self:addTradeAcquire(RecipeDB,35535,6,932,4,19321)

	-- Blastguard Boots -- 35536
	self:addTradeSkill(RecipeDB,35536,350,29499,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35536,1,4,21,22,23,24,25,26,27,28,29,30,36,41,57,101)
	self:addTradeAcquire(RecipeDB,35536,6,932,3,19321)

	-- Blastguard Belt -- 35537
	self:addTradeSkill(RecipeDB,35537,350,29500,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35537,1,4,21,22,23,24,25,26,27,28,29,30,36,41,57,101)
	self:addTradeAcquire(RecipeDB,35537,6,932,2,19321)

	-- Drums of Panic -- 35538
	self:addTradeSkill(RecipeDB,35538,370,29532,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35538,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,106)
	self:addTradeAcquire(RecipeDB,35538,6,989,2,21643)

	-- Drums of Restoration -- 35539
	self:addTradeSkill(RecipeDB,35539,350,29531,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35539,1,4,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB,35539,6,978,2,20240)

	-- Drums of War -- 35540
	self:addTradeSkill(RecipeDB,35540,340,29528,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35540,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,35540,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Drums of Battle -- 35543
	self:addTradeSkill(RecipeDB,35543,365,29529,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35543,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,111)
	self:addTradeAcquire(RecipeDB,35543,6,935,2,21432)

	-- Drums of Speed -- 35544
	self:addTradeSkill(RecipeDB,35544,345,29530,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35544,1,2,4,5,21,22,23,24,25,26,27,28,29,30,36,41,108)
	self:addTradeAcquire(RecipeDB,35544,6,941,2,20241,6,978,2,20240)

	-- Cobrahide Leg Armor -- 35549
	self:addTradeSkill(RecipeDB,35549,335,29533,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35549,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,35549,6,946,2,17657,6,947,2,17585)

	-- Nethercobra Leg Armor -- 35554
	self:addTradeSkill(RecipeDB,35554,365,29535,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35554,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,35554,6,946,4,17657,6,947,4,17585)

	-- Clefthide Leg Armor -- 35555
	self:addTradeSkill(RecipeDB,35555,335,29534,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35555,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,35555,6,942,2,17904)

	-- Nethercleft Leg Armor -- 35557
	self:addTradeSkill(RecipeDB,35557,365,29536,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,35557,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,103)
	self:addTradeAcquire(RecipeDB,35557,6,942,4,17904)

	-- Cobrascale Hood -- 35558
	self:addTradeSkill(RecipeDB,35558,365,29502,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35558,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,35558,7,4)

	-- Cobrascale Gloves -- 35559
	self:addTradeSkill(RecipeDB,35559,365,29503,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35559,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,35559,3,24664,7,4)

	-- Windscale Hood -- 35560
	self:addTradeSkill(RecipeDB,35560,365,29504,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35560,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,35560,7,4)

	-- Hood of Primal Life -- 35561
	self:addTradeSkill(RecipeDB,35561,365,29505,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35561,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,35561,7,4)

	-- Gloves of the Living Touch -- 35562
	self:addTradeSkill(RecipeDB,35562,365,29506,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35562,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,35562,3,24664)

	-- Windslayer Wraps -- 35563
	self:addTradeSkill(RecipeDB,35563,365,29507,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35563,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,35563,7,4)

	-- Living Dragonscale Helm -- 35564
	self:addTradeSkill(RecipeDB,35564,365,29508,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35564,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,35564,7,4)

	-- Earthen Netherscale Boots -- 35567
	self:addTradeSkill(RecipeDB,35567,365,29512,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35567,1,2,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,35567,7,4)

	-- Windstrike Gloves -- 35568
	self:addTradeSkill(RecipeDB,35568,365,29509,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35568,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,35568,3,24664)

	-- Netherdrake Helm -- 35572
	self:addTradeSkill(RecipeDB,35572,365,29510,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35572,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,35572,7,4)

	-- Netherdrake Gloves -- 35573
	self:addTradeSkill(RecipeDB,35573,365,29511,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35573,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,35573,3,24664)

	-- Thick Netherscale Breastplate -- 35574
	self:addTradeSkill(RecipeDB,35574,365,29514,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,35574,1,2,5,6,11,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,35574,7,4)

	-- Ebon Netherscale Breastplate -- 35575
	self:addTradeSkill(RecipeDB,35575,375,29515,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35575,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35575,1,7866,1,7867,1,29508)

	-- Ebon Netherscale Belt -- 35576
	self:addTradeSkill(RecipeDB,35576,375,29516,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35576,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35576,1,7866,1,7867,1,29508)

	-- Ebon Netherscale Bracers -- 35577
	self:addTradeSkill(RecipeDB,35577,375,29517,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35577,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35577,1,7866,1,7867,1,29508)

	-- Netherstrike Breastplate -- 35580
	self:addTradeSkill(RecipeDB,35580,375,29519,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35580,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35580,1,7866,1,7867,1,29508)

	-- Netherstrike Belt -- 35582
	self:addTradeSkill(RecipeDB,35582,375,29520,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35582,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35582,1,7866,1,7867,1,29508)

	-- Netherstrike Bracers -- 35584
	self:addTradeSkill(RecipeDB,35584,375,29521,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,35584,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,35584,1,7866,1,7867,1,29508)

	-- Windhawk Hauberk -- 35585
	self:addTradeSkill(RecipeDB,35585,375,29522,1,2108,10660,1)
	self:addTradeFlags(RecipeDB,35585,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35585,1,7870,1,7871,1,29509)

	-- Windhawk Belt -- 35587
	self:addTradeSkill(RecipeDB,35587,375,29524,1,2108,10660,1)
	self:addTradeFlags(RecipeDB,35587,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35587,1,7870,1,7871,1,29509)

	-- Windhawk Bracers -- 35588
	self:addTradeSkill(RecipeDB,35588,375,29523,1,2108,10660,1)
	self:addTradeFlags(RecipeDB,35588,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35588,1,7870,1,7871,1,29509)

	-- Primalstrike Vest -- 35589
	self:addTradeSkill(RecipeDB,35589,375,29525,1,2108,10658,1)
	self:addTradeFlags(RecipeDB,35589,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35589,1,7868,1,7869,1,29507)

	-- Primalstrike Belt -- 35590
	self:addTradeSkill(RecipeDB,35590,375,29526,1,2108,10658,1)
	self:addTradeFlags(RecipeDB,35590,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35590,1,7868,1,7869,1,29507)

	-- Primalstrike Bracers -- 35591
	self:addTradeSkill(RecipeDB,35591,375,29527,1,2108,10658,1)
	self:addTradeFlags(RecipeDB,35591,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,35591,1,7868,1,7869,1,29507)

	-- Blackstorm Leggings -- 36074
	self:addTradeSkill(RecipeDB,36074,260,29964,1,2108,10658,1)
	self:addTradeFlags(RecipeDB,36074,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36074,1,7868,1,7869,1,29507)

	-- Wildfeather Leggings -- 36075
	self:addTradeSkill(RecipeDB,36075,260,29970,1,2108,10660,1)
	self:addTradeFlags(RecipeDB,36075,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36075,1,7870,1,7871,1,29509)

	-- Dragonstrike Leggings -- 36076
	self:addTradeSkill(RecipeDB,36076,260,29971,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,36076,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36076,1,7866,1,7867,1,29508)

	-- Primalstorm Breastplate -- 36077
	self:addTradeSkill(RecipeDB,36077,330,29973,1,2108,10658,1)
	self:addTradeFlags(RecipeDB,36077,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36077,1,7868,1,7869,1,29507)

	-- Living Crystal Breastplate -- 36078
	self:addTradeSkill(RecipeDB,36078,330,29974,1,2108,10660,1)
	self:addTradeFlags(RecipeDB,36078,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36078,1,7870,1,7871,1,29509)

	-- Golden Dragonstrike Breastplate -- 36079
	self:addTradeSkill(RecipeDB,36079,330,29975,1,2108,10656,1)
	self:addTradeFlags(RecipeDB,36079,1,2,3,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36079,1,7866,1,7867,1,29508)

	-- Belt of Natural Power -- 36349
	self:addTradeSkill(RecipeDB,36349,375,30042,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36349,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,36349,8,37)

	-- Belt of Deep Shadow -- 36351
	self:addTradeSkill(RecipeDB,36351,375,30040,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36351,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,36351,8,37)

	-- Belt of the Black Eagle -- 36352
	self:addTradeSkill(RecipeDB,36352,375,30046,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36352,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,36352,8,37)

	-- Monsoon Belt -- 36353
	self:addTradeSkill(RecipeDB,36353,375,30044,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36353,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,36353,8,37)

	-- Boots of Natural Grace -- 36355
	self:addTradeSkill(RecipeDB,36355,375,30041,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36355,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36355,8,37)

	-- Boots of Utter Darkness -- 36357
	self:addTradeSkill(RecipeDB,36357,375,30039,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36357,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,36357,8,37)

	-- Boots of the Crimson Hawk -- 36358
	self:addTradeSkill(RecipeDB,36358,375,30045,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36358,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36358,8,37)

	-- Hurricane Boots -- 36359
	self:addTradeSkill(RecipeDB,36359,375,30043,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,36359,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,36359,8,37)

	-- Boots of Shackled Souls -- 39997
	self:addTradeSkill(RecipeDB,39997,375,32398,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,39997,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,102)
	self:addTradeAcquire(RecipeDB,39997,6,1012,1,23159)

	-- Greaves of Shackled Souls -- 40001
	self:addTradeSkill(RecipeDB,40001,375,32400,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40001,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,102)
	self:addTradeAcquire(RecipeDB,40001,6,1012,2,23159)

	-- Waistguard of Shackled Souls -- 40002
	self:addTradeSkill(RecipeDB,40002,375,32397,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40002,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,102)
	self:addTradeAcquire(RecipeDB,40002,6,1012,2,23159)

	-- Redeemed Soul Moccasins -- 40003
	self:addTradeSkill(RecipeDB,40003,375,32394,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40003,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,102)
	self:addTradeAcquire(RecipeDB,40003,6,1012,2,23159)

	-- Redeemed Soul Wristguards -- 40004
	self:addTradeSkill(RecipeDB,40004,375,32395,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40004,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,102)
	self:addTradeAcquire(RecipeDB,40004,6,1012,2,23159)

	-- Redeemed Soul Legguards -- 40005
	self:addTradeSkill(RecipeDB,40005,375,32396,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40005,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,102)
	self:addTradeAcquire(RecipeDB,40005,6,1012,1,23159)

	-- Redeemed Soul Cinch -- 40006
	self:addTradeSkill(RecipeDB,40006,375,32393,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,40006,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,102)
	self:addTradeAcquire(RecipeDB,40006,6,1012,1,23159)

	-- Bracers of Renewed Life -- 41156
	self:addTradeSkill(RecipeDB,41156,375,32582,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41156,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,41156,7,4)

	-- Shoulderpads of Renewed Life -- 41157
	self:addTradeSkill(RecipeDB,41157,375,32583,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41157,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,41157,8,34)

	-- Swiftstrike Bracers -- 41158
	self:addTradeSkill(RecipeDB,41158,375,32580,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41158,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,41158,8,34)

	-- Swiftstrike Shoulders -- 41160
	self:addTradeSkill(RecipeDB,41160,375,32581,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41160,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,41160,7,4)

	-- Bindings of Lightning Reflexes -- 41161
	self:addTradeSkill(RecipeDB,41161,375,32574,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41161,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,41161,8,34)

	-- Shoulders of Lightning Reflexes -- 41162
	self:addTradeSkill(RecipeDB,41162,375,32575,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41162,1,2,10,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,41162,7,4)

	-- Living Earth Bindings -- 41163
	self:addTradeSkill(RecipeDB,41163,375,32577,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41163,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,41163,7,4)

	-- Living Earth Shoulders -- 41164
	self:addTradeSkill(RecipeDB,41164,375,32579,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,41164,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,41164,8,34)

	-- Cloak of Darkness -- 42546
	self:addTradeSkill(RecipeDB,42546,360,33122,3,2108,nil,1)
	self:addTradeFlags(RecipeDB,42546,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,60,114)
	self:addTradeAcquire(RecipeDB,42546,6,967,4,18255)

	-- Shadowprowler's Chestguard -- 42731
	self:addTradeSkill(RecipeDB,42731,365,33204,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,42731,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57,114)
	self:addTradeAcquire(RecipeDB,42731,6,967,3,18255)

	-- Knothide Ammo Pouch -- 44343
	self:addTradeSkill(RecipeDB,44343,315,34099,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,44343,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44343,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Knothide Quiver -- 44344
	self:addTradeSkill(RecipeDB,44344,315,34100,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,44344,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51)
	self:addTradeAcquire(RecipeDB,44344,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Quiver of a Thousand Feathers -- 44359
	self:addTradeSkill(RecipeDB,44359,350,34105,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,44359,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,107)
	self:addTradeAcquire(RecipeDB,44359,6,1011,3,21655)

	-- Netherscale Ammo Pouch -- 44768
	self:addTradeSkill(RecipeDB,44768,350,34106,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,44768,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,104)
	self:addTradeAcquire(RecipeDB,44768,6,947,3,17585,6,946,3,17657)

	-- Glove Reinforcements -- 44770
	self:addTradeSkill(RecipeDB,44770,350,34207,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,44770,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44770,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Winter Boots -- 44953
	self:addTradeSkill(RecipeDB,44953,285,34086,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,44953,1,2,4,7,21,22,23,24,25,26,27,28,29,30,36,41,56)
	self:addTradeAcquire(RecipeDB,44953,5,1,2,13420,2,13433)

	-- Heavy Knothide Armor Kit -- 44970
	self:addTradeSkill(RecipeDB,44970,350,34330,1,2108,nil,1)
	self:addTradeFlags(RecipeDB,44970,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,44970,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Leatherworker's Satchel -- 45100
	self:addTradeSkill(RecipeDB,45100,300,34482,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,45100,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45100,1,18754,1,18771,1,19187,1,21087,1,33681,1,33612,1,33635)

	-- Bag of Many Hides -- 45117
	self:addTradeSkill(RecipeDB,45117,360,34490,2,2108,nil,1)
	self:addTradeFlags(RecipeDB,45117,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45117,3,22143,3,22144,3,22148,3,23022)

	-- Leather Gauntlets of the Sun -- 46132
	self:addTradeSkill(RecipeDB,46132,365,34372,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46132,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,57)
	self:addTradeAcquire(RecipeDB,46132,8,24)

	-- Fletcher's Gloves of the Phoenix -- 46133
	self:addTradeSkill(RecipeDB,46133,365,34374,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46133,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,58)
	self:addTradeAcquire(RecipeDB,46133,8,24)

	-- Gloves of Immortal Dusk -- 46134
	self:addTradeSkill(RecipeDB,46134,365,34370,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46134,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,46134,8,24)

	-- Sun-Drenched Scale Gloves -- 46135
	self:addTradeSkill(RecipeDB,46135,365,34376,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46135,1,2,6,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,46135,8,24)

	-- Leather Chestguard of the Sun -- 46136
	self:addTradeSkill(RecipeDB,46136,365,34371,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46136,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,46136,8,24)

	-- Embrace of the Phoenix -- 46137
	self:addTradeSkill(RecipeDB,46137,365,34373,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46137,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,46137,8,24)

	-- Carapace of Sun and Shadow -- 46138
	self:addTradeSkill(RecipeDB,46138,365,34369,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46138,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,57)
	self:addTradeAcquire(RecipeDB,46138,8,24)

	-- Sun-Drenched Scale Chestguard -- 46139
	self:addTradeSkill(RecipeDB,46139,365,34375,4,2108,nil,1)
	self:addTradeFlags(RecipeDB,46139,1,2,6,21,22,23,24,25,26,27,28,29,30,37,41,58)
	self:addTradeAcquire(RecipeDB,46139,8,24)

	-- Heavy Borean Leather -- 50936
	self:addTradeSkill(RecipeDB,50936,390,38425,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50936,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50936,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Chestguard -- 50938
	self:addTradeSkill(RecipeDB,50938,375,38408,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50938,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50938,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Leggings -- 50939
	self:addTradeSkill(RecipeDB,50939,370,38410,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50939,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50939,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Shoulderpads -- 50940
	self:addTradeSkill(RecipeDB,50940,380,38411,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50940,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50940,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Gloves -- 50941
	self:addTradeSkill(RecipeDB,50941,370,38409,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50941,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50941,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Boots -- 50942
	self:addTradeSkill(RecipeDB,50942,375,38407,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50942,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50942,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Belt -- 50943
	self:addTradeSkill(RecipeDB,50943,380,38406,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50943,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50943,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Chestpiece -- 50944
	self:addTradeSkill(RecipeDB,50944,370,38400,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50944,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50944,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Leggings -- 50945
	self:addTradeSkill(RecipeDB,50945,375,38401,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50945,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50945,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Shoulderpads -- 50946
	self:addTradeSkill(RecipeDB,50946,380,38402,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50946,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50946,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Gloves -- 50947
	self:addTradeSkill(RecipeDB,50947,375,38403,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50947,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50947,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Boots -- 50948
	self:addTradeSkill(RecipeDB,50948,370,38404,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50948,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50948,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Belt -- 50949
	self:addTradeSkill(RecipeDB,50949,380,38405,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50949,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,50949,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Chestguard -- 50950
	self:addTradeSkill(RecipeDB,50950,375,38414,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50950,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50950,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Leggings -- 50951
	self:addTradeSkill(RecipeDB,50951,370,38416,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50951,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50951,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Shoulders -- 50952
	self:addTradeSkill(RecipeDB,50952,375,38424,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50952,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50952,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Gloves -- 50953
	self:addTradeSkill(RecipeDB,50953,380,38415,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50953,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50953,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Boots -- 50954
	self:addTradeSkill(RecipeDB,50954,380,38413,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50954,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50954,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Belt -- 50955
	self:addTradeSkill(RecipeDB,50955,370,38412,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50955,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50955,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Chestguard -- 50956
	self:addTradeSkill(RecipeDB,50956,375,38420,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50956,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50956,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Legguards -- 50957
	self:addTradeSkill(RecipeDB,50957,370,38422,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50957,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50957,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Shoulders -- 50958
	self:addTradeSkill(RecipeDB,50958,380,38417,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50958,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50958,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Gloves -- 50959
	self:addTradeSkill(RecipeDB,50959,370,38421,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50959,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50959,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Boots -- 50960
	self:addTradeSkill(RecipeDB,50960,380,38419,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50960,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50960,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Belt -- 50961
	self:addTradeSkill(RecipeDB,50961,375,38418,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50961,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,50961,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Borean Armor Kit -- 50962
	self:addTradeSkill(RecipeDB,50962,350,38375,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50962,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50962,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Heavy Borean Armor Kit -- 50963
	self:addTradeSkill(RecipeDB,50963,395,38376,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,50963,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50963,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Jormungar Leg Armor -- 50964
	self:addTradeSkill(RecipeDB,50964,405,38371,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50964,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50964,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frosthide Leg Armor -- 50965
	self:addTradeSkill(RecipeDB,50965,425,38373,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,50965,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50965,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Leg Armor -- 50966
	self:addTradeSkill(RecipeDB,50966,400,38372,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,50966,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50966,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Icescale Leg Armor -- 50967
	self:addTradeSkill(RecipeDB,50967,425,38374,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,50967,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,50967,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Trapper's Traveling Pack -- 50970
	self:addTradeSkill(RecipeDB,50970,415,38399,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,50970,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,120)
	self:addTradeAcquire(RecipeDB,50970,6,1073,3,31916,6,1073,3,32763)

	-- Mammoth Mining Bag -- 50971
	self:addTradeSkill(RecipeDB,50971,415,38347,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,50971,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,119)
	self:addTradeAcquire(RecipeDB,50971,6,1119,2,32540)

	-- Black Chitinguard Boots -- 51568
	self:addTradeSkill(RecipeDB,51568,400,38590,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,51568,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,51568,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Arctic Leggings -- 51569
	self:addTradeSkill(RecipeDB,51569,395,38591,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,51569,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,51569,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Arctic Chestpiece -- 51570
	self:addTradeSkill(RecipeDB,51570,395,38592,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,51570,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,51570,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Wristguards -- 51571
	self:addTradeSkill(RecipeDB,51571,385,38433,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,51571,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,51571,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Arctic Helm -- 51572
	self:addTradeSkill(RecipeDB,51572,385,38437,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,51572,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,51572,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Bracers of Shackled Souls -- 52733
	self:addTradeSkill(RecipeDB,52733,375,32399,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,52733,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58,102)
	self:addTradeAcquire(RecipeDB,52733,6,1012,1,23159)

	-- Cloak of Tormented Skies -- 55199
	self:addTradeSkill(RecipeDB,55199,395,41238,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,55199,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,60)
	self:addTradeAcquire(RecipeDB,55199,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Fur Lining - Attack Power -- 57683
	self:addTradeSkill(RecipeDB,57683,400,nil,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,57683,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57683,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Fur Lining - Stamina -- 57690
	self:addTradeSkill(RecipeDB,57690,400,nil,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,57690,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57690,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Fur Lining - Spell Power -- 57691
	self:addTradeSkill(RecipeDB,57691,400,nil,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,57691,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57691,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Fur Lining - Fire Resist -- 57692
	self:addTradeSkill(RecipeDB,57692,400,nil,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,57692,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57692,3,30921)

	-- Fur Lining - Frost Resist -- 57694
	self:addTradeSkill(RecipeDB,57694,400,nil,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,57694,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57694,3,32289)

	-- Fur Lining - Shadow Resist -- 57696
	self:addTradeSkill(RecipeDB,57696,400,nil,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,57696,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57696,3,32349)

	-- Fur Lining - Nature Resist -- 57699
	self:addTradeSkill(RecipeDB,57699,400,nil,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,57699,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57699,3,32290)

	-- Fur Lining - Arcane Resist -- 57701
	self:addTradeSkill(RecipeDB,57701,400,nil,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,57701,1,2,11,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,57701,3,31702,3,32297)

	-- Jormungar Leg Reinforcements -- 60583
	self:addTradeSkill(RecipeDB,60583,405,nil,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60583,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60583,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Leg Reinforcements -- 60584
	self:addTradeSkill(RecipeDB,60584,400,nil,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60584,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60584,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Bracers -- 60599
	self:addTradeSkill(RecipeDB,60599,385,38436,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60599,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60599,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Frostscale Helm -- 60600
	self:addTradeSkill(RecipeDB,60600,385,38440,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60600,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60600,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Frostscale Leggings -- 60601
	self:addTradeSkill(RecipeDB,60601,395,44436,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60601,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60601,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Frostscale Breastplate -- 60604
	self:addTradeSkill(RecipeDB,60604,395,44437,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60604,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60604,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dragonstompers -- 60605
	self:addTradeSkill(RecipeDB,60605,400,44438,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60605,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60605,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Wristguards -- 60607
	self:addTradeSkill(RecipeDB,60607,385,38434,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60607,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60607,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Iceborne Helm -- 60608
	self:addTradeSkill(RecipeDB,60608,385,38438,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60608,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60608,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Iceborne Leggings -- 60611
	self:addTradeSkill(RecipeDB,60611,395,44440,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60611,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60611,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Iceborne Chestguard -- 60613
	self:addTradeSkill(RecipeDB,60613,395,44441,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60613,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60613,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Bugsquashers -- 60620
	self:addTradeSkill(RecipeDB,60620,400,44442,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60620,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60620,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Bracers -- 60622
	self:addTradeSkill(RecipeDB,60622,385,38435,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60622,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60622,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nerubian Helm -- 60624
	self:addTradeSkill(RecipeDB,60624,385,38439,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60624,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60624,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Nerubian Leggings -- 60627
	self:addTradeSkill(RecipeDB,60627,395,44443,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60627,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60627,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dark Nerubian Chestpiece -- 60629
	self:addTradeSkill(RecipeDB,60629,395,44444,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60629,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60629,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Scaled Icewalkers -- 60630
	self:addTradeSkill(RecipeDB,60630,400,44445,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60630,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Cloak of Harsh Winds -- 60631
	self:addTradeSkill(RecipeDB,60631,380,38441,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60631,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,60631,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Ice Striker's Cloak -- 60637
	self:addTradeSkill(RecipeDB,60637,440,43566,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60637,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,60)
	self:addTradeAcquire(RecipeDB,60637,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Durable Nerubhide Cape -- 60640
	self:addTradeSkill(RecipeDB,60640,440,43565,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60640,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,52,60)
	self:addTradeAcquire(RecipeDB,60640,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Pack of Endless Pockets -- 60643
	self:addTradeSkill(RecipeDB,60643,415,44446,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60643,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,60643,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Dragonscale Ammo Pouch -- 60645
	self:addTradeSkill(RecipeDB,60645,415,44447,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60645,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,120)
	self:addTradeAcquire(RecipeDB,60645,6,1073,2,31916,6,1073,2,32763)

	-- Nerubian Reinforced Quiver -- 60647
	self:addTradeSkill(RecipeDB,60647,415,44448,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60647,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,117)
	self:addTradeAcquire(RecipeDB,60647,6,1098,2,32538)

	-- Razorstrike Breastplate -- 60649
	self:addTradeSkill(RecipeDB,60649,425,43129,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60649,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60649,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Virulent Spaulders -- 60651
	self:addTradeSkill(RecipeDB,60651,420,43130,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60651,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60651,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Eaglebane Bracers -- 60652
	self:addTradeSkill(RecipeDB,60652,420,43131,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60652,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60652,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nightshock Hood -- 60655
	self:addTradeSkill(RecipeDB,60655,425,43132,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60655,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60655,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Nightshock Girdle -- 60658
	self:addTradeSkill(RecipeDB,60658,420,43133,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60658,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60658,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Leggings of Visceral Strikes -- 60660
	self:addTradeSkill(RecipeDB,60660,425,42731,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60660,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60660,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Seafoam Gauntlets -- 60665
	self:addTradeSkill(RecipeDB,60665,420,43255,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60665,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60665,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Jormscale Footpads -- 60666
	self:addTradeSkill(RecipeDB,60666,420,43256,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60666,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60666,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Wildscale Breastplate -- 60669
	self:addTradeSkill(RecipeDB,60669,425,43257,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60669,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60669,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Purehorn Spaulders -- 60671
	self:addTradeSkill(RecipeDB,60671,420,43258,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,60671,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60671,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Eviscerator's Facemask -- 60697
	self:addTradeSkill(RecipeDB,60697,420,43260,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60697,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60697,2,32515)

	-- Eviscerator's Shoulderpads -- 60702
	self:addTradeSkill(RecipeDB,60702,420,43433,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60702,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60702,2,32515)

	-- Eviscerator's Chestguard -- 60703
	self:addTradeSkill(RecipeDB,60703,420,43434,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60703,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60703,2,32515)

	-- Eviscerator's Bindings -- 60704
	self:addTradeSkill(RecipeDB,60704,420,43435,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60704,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60704,2,32515)

	-- Eviscerator's Gauntlets -- 60705
	self:addTradeSkill(RecipeDB,60705,425,43436,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60705,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60705,2,32515)

	-- Eviscerator's Waistguard -- 60706
	self:addTradeSkill(RecipeDB,60706,425,43437,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60706,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60706,2,32515)

	-- Eviscerator's Legguards -- 60711
	self:addTradeSkill(RecipeDB,60711,425,43438,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60711,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60711,2,32515)

	-- Eviscerator's Treads -- 60712
	self:addTradeSkill(RecipeDB,60712,425,43439,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60712,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60712,2,32515)

	-- Overcast Headguard -- 60715
	self:addTradeSkill(RecipeDB,60715,420,43261,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60715,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60715,2,32515)

	-- Overcast Spaulders -- 60716
	self:addTradeSkill(RecipeDB,60716,420,43262,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60716,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60716,2,32515)

	-- Overcast Chestguard -- 60718
	self:addTradeSkill(RecipeDB,60718,420,43263,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60718,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60718,2,32515)

	-- Overcast Bracers -- 60720
	self:addTradeSkill(RecipeDB,60720,420,43264,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60720,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60720,2,32515)

	-- Overcast Handwraps -- 60721
	self:addTradeSkill(RecipeDB,60721,425,43265,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60721,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60721,2,32515)

	-- Overcast Belt -- 60723
	self:addTradeSkill(RecipeDB,60723,425,43266,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60723,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60723,2,32515)

	-- Overcast Leggings -- 60725
	self:addTradeSkill(RecipeDB,60725,425,43271,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60725,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60725,2,32515)

	-- Overcast Boots -- 60727
	self:addTradeSkill(RecipeDB,60727,425,43273,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60727,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60727,2,32515)

	-- Swiftarrow Helm -- 60728
	self:addTradeSkill(RecipeDB,60728,420,43447,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60728,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60728,2,32515)

	-- Swiftarrow Shoulderguards -- 60729
	self:addTradeSkill(RecipeDB,60729,420,43449,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60729,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60729,2,32515)

	-- Swiftarrow Hauberk -- 60730
	self:addTradeSkill(RecipeDB,60730,420,43445,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60730,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60730,2,32515)

	-- Swiftarrow Bracers -- 60731
	self:addTradeSkill(RecipeDB,60731,420,43444,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60731,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60731,2,32515)

	-- Swiftarrow Gauntlets -- 60732
	self:addTradeSkill(RecipeDB,60732,425,43446,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60732,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60732,2,32515)

	-- Swiftarrow Belt -- 60734
	self:addTradeSkill(RecipeDB,60734,425,43442,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60734,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60734,2,32515)

	-- Swiftarrow Leggings -- 60735
	self:addTradeSkill(RecipeDB,60735,425,43448,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60735,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60735,2,32515)

	-- Swiftarrow Boots -- 60737
	self:addTradeSkill(RecipeDB,60737,425,43443,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60737,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60737,2,32515)

	-- Stormhide Crown -- 60743
	self:addTradeSkill(RecipeDB,60743,420,43455,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60743,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60743,2,32515)

	-- Stormhide Shoulders -- 60746
	self:addTradeSkill(RecipeDB,60746,420,43457,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60746,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60746,2,32515)

	-- Stormhide Hauberk -- 60747
	self:addTradeSkill(RecipeDB,60747,420,43453,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60747,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60747,2,32515)

	-- Stormhide Wristguards -- 60748
	self:addTradeSkill(RecipeDB,60748,420,43452,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60748,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60748,2,32515)

	-- Stormhide Grips -- 60749
	self:addTradeSkill(RecipeDB,60749,425,43454,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60749,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60749,2,32515)

	-- Stormhide Belt -- 60750
	self:addTradeSkill(RecipeDB,60750,425,43450,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60750,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60750,2,32515)

	-- Stormhide Legguards -- 60751
	self:addTradeSkill(RecipeDB,60751,425,43456,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60751,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60751,2,32515)

	-- Stormhide Stompers -- 60752
	self:addTradeSkill(RecipeDB,60752,425,43451,3,2108,nil,2)
	self:addTradeFlags(RecipeDB,60752,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60752,2,32515)

	-- Giantmaim Legguards -- 60754
	self:addTradeSkill(RecipeDB,60754,440,43458,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60754,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60754,2,32515)

	-- Giantmaim Bracers -- 60755
	self:addTradeSkill(RecipeDB,60755,440,43459,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60755,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60755,2,32515)

	-- Revenant's Breastplate -- 60756
	self:addTradeSkill(RecipeDB,60756,440,43461,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60756,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60756,2,32515)

	-- Revenant's Treads -- 60757
	self:addTradeSkill(RecipeDB,60757,440,43469,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60757,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60757,2,32515)

	-- Trollwoven Spaulders -- 60758
	self:addTradeSkill(RecipeDB,60758,440,43481,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60758,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60758,2,32515)

	-- Trollwoven Girdle -- 60759
	self:addTradeSkill(RecipeDB,60759,440,43484,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60759,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60759,2,32515)

	-- Earthgiving Legguards -- 60760
	self:addTradeSkill(RecipeDB,60760,440,43495,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60760,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60760,2,32515)

	-- Earthgiving Boots -- 60761
	self:addTradeSkill(RecipeDB,60761,440,43502,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60761,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60761,2,32515)

	-- Polar Vest -- 60996
	self:addTradeSkill(RecipeDB,60996,425,43590,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60996,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60996,2,32515)

	-- Polar Cord -- 60997
	self:addTradeSkill(RecipeDB,60997,420,43591,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60997,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60997,2,32515)

	-- Polar Boots -- 60998
	self:addTradeSkill(RecipeDB,60998,420,43592,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60998,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,60998,2,32515)

	-- Icy Scale Chestguard -- 60999
	self:addTradeSkill(RecipeDB,60999,425,43593,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,60999,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,60999,2,32515)

	-- Icy Scale Belt -- 61000
	self:addTradeSkill(RecipeDB,61000,420,43594,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,61000,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,61000,2,32515)

	-- Icy Scale Boots -- 61002
	self:addTradeSkill(RecipeDB,61002,420,43595,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,61002,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,58)
	self:addTradeAcquire(RecipeDB,61002,2,32515)

	-- Raptor Hide Harness -- 4096
	self:addTradeSkill(RecipeDB,4096,165,4455,2,2108,nil,2)
	self:addTradeFlags(RecipeDB,4096,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,4096,2,2819)

	-- Windripper Boots -- 62176
	self:addTradeSkill(RecipeDB,62176,440,44930,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,62176,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,62176,2,32515)

	-- Windripper Leggings -- 62177
	self:addTradeSkill(RecipeDB,62177,440,44931,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,62177,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,57)
	self:addTradeAcquire(RecipeDB,62177,2,32515)

	-- Earthen Leg Armor -- 62448
	self:addTradeSkill(RecipeDB,62448,425,44963,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,62448,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,62448,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Borean Leather -- 64661
	self:addTradeSkill(RecipeDB,64661,350,33568,1,2108,nil,2)
	self:addTradeFlags(RecipeDB,64661,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,64661,1,26911,1,26961,1,26996,1,26998,1,28700,1,33581)

	-- Lightning Grounded Boots -- 63197
	self:addTradeSkill(RecipeDB,63197,450,45097,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63197,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,58)
	self:addTradeAcquire(RecipeDB,63197,8,39)

	-- Footpads of Silence -- 63199 
	self:addTradeSkill(RecipeDB,63199,450,45099,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63199,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,51,57)
	self:addTradeAcquire(RecipeDB,63199,8,39)

	-- Death-warmed Belt -- 63198
	self:addTradeSkill(RecipeDB,63198,450,45098,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63198,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,51,57)
	self:addTradeAcquire(RecipeDB,63198,8,39)

	-- Boots of Wintry Endurance -- 63201
	self:addTradeSkill(RecipeDB,63201,450,45101,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63201,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,57)
	self:addTradeAcquire(RecipeDB,63201,8,39)

	-- Boots of Living Scale -- 63195
	self:addTradeSkill(RecipeDB,63195,450,45095,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63195,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,51,58)
	self:addTradeAcquire(RecipeDB,63195,8,39)

	-- Blue Belt of Chaos -- 63196
	self:addTradeSkill(RecipeDB,63196,450,45096,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63196,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,58)
	self:addTradeAcquire(RecipeDB,63196,8,39)

	-- Belt of Dragons -- 63194
	self:addTradeSkill(RecipeDB,63194,450,45553,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63194,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,51,58)
	self:addTradeAcquire(RecipeDB,63194,8,39)

	-- Belt of Arctic Life -- 63200
	self:addTradeSkill(RecipeDB,63200,450,45100,4,2108,nil,2)
	self:addTradeFlags(RecipeDB,63200,1,2,6,21,22,23,24,25,26,27,28,29,30,36,40,53,54,57)
	self:addTradeAcquire(RecipeDB,63200,8,39)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then

		-- Black Chitin Bracers -- 67137
		-- Bracers of Swift Death -- 67139
		-- Crusader's Dragonscale Bracers -- 67083
		-- Crusader's Dragonscale Breastplate -- 67082
		-- Ensorceled Nerubian Breastplate -- 67080
		-- Knightbane Carapace -- 67086
		-- Lunar Eclipse Chestguard -- 67084
		-- Moonshadow Armguards -- 67141

		return 511

	else

		return 511

	end

end
