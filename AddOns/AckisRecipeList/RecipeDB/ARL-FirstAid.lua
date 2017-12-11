--[[

************************************************************************

ARL-FirstAid.lua

First Aid data for all of Ackis Recipe List

************************************************************************

File date: 2009-08-01T17:48:06Z 
File revision: 2266 
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

function addon:InitFirstAid(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Linen Bandage -- 3275
	self:addTradeSkill(RecipeDB,3275,1,1251,1,45542,nil,0,1,30,45,60)
	self:addTradeFlags(RecipeDB,3275,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3275,8,8)

	-- Heavy Linen Bandage -- 3276
	self:addTradeSkill(RecipeDB,3276,40,2581,1,45542,nil,0,40,50,75,100)
	self:addTradeFlags(RecipeDB,3276,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3276,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Wool Bandage -- 3277
	self:addTradeSkill(RecipeDB,3277,80,3530,1,45542,nil,0,0,80,115,150)
	self:addTradeFlags(RecipeDB,3277,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3277,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Heavy Wool Bandage -- 3278
	self:addTradeSkill(RecipeDB,3278,115,3531,1,45542,nil,0,0,115,150,185)
	self:addTradeFlags(RecipeDB,3278,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,3278,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Silk Bandage -- 7928
	self:addTradeSkill(RecipeDB,7928,150,6450,1,45542,nil,0,0,150,180,210)
	self:addTradeFlags(RecipeDB,7928,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7928,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Heavy Silk Bandage -- 7929
	self:addTradeSkill(RecipeDB,7929,180,6451,1,45542,nil,0,0,180,210,240)
	self:addTradeFlags(RecipeDB,7929,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7929,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,
	1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,
	1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Anti-Venom -- 7934
	self:addTradeSkill(RecipeDB,7934,80,6452,1,45542,nil,0,0,80,115,150)
	self:addTradeFlags(RecipeDB,7934,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,7934,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,1,4211,
	1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,1,17424,
	1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Strong Anti-Venom -- 7935
	self:addTradeSkill(RecipeDB,7935,130,6453,2,45542,nil,0,0,130,165,200)
	self:addTradeFlags(RecipeDB,7935,1,2,10,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,7935,7,2)

	-- Mageweave Bandage -- 10840
	self:addTradeSkill(RecipeDB,10840,210,8544,1,45542,nil,0,0,210,240,270)
	self:addTradeFlags(RecipeDB,10840,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,10840,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Heavy Mageweave Bandage -- 10841
	self:addTradeSkill(RecipeDB,10841,240,8545,1,45542,nil,0,0,240,270,300)
	self:addTradeFlags(RecipeDB,10841,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,10841,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Runecloth Bandage -- 18629
	self:addTradeSkill(RecipeDB,18629,260,14529,1,45542,nil,0,0,260,290,320)
	self:addTradeFlags(RecipeDB,18629,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18629,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Heavy Runecloth Bandage -- 18630
	self:addTradeSkill(RecipeDB,18630,290,14530,1,45542,nil,0,0,290,320,350)
	self:addTradeFlags(RecipeDB,18630,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,18630,1,2326,1,2327,1,2329,1,2798,1,3181,1,3373,
	1,4211,1,4591,1,5150,1,5759,1,5939,1,5943,1,6094,1,16272,1,16662,1,16731,1,17214,
	1,17424,1,19184,1,19478,1,22477,1,33589,1,28706,1,33621,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Powerful Anti-Venom -- 23787
	self:addTradeSkill(RecipeDB,23787,300,19440,1,45542,nil,0,0,300,330,360)
	self:addTradeFlags(RecipeDB,23787,1,2,4,21,22,23,24,25,26,27,28,29,30,36,41,96)
	self:addTradeAcquire(RecipeDB,23787,6,529,2,10856,6,529,2,10857,6,529,2,11536)

	-- Netherweave Bandage -- 27032
	self:addTradeSkill(RecipeDB,27032,300,21990,1,45542,nil,1,0,330,347,365)
	self:addTradeFlags(RecipeDB,27032,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27032,1,33589,1,28706,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Heavy Netherweave Bandage -- 27033
	self:addTradeSkill(RecipeDB,27033,330,21991,1,45542,nil,1,0,360,367,375)
	self:addTradeFlags(RecipeDB,27033,1,2,3,21,22,23,24,25,26,27,28,29,30,36,40)
	self:addTradeAcquire(RecipeDB,27033,1,33589,1,28706,1,18991,1,29233,1,18990,1,26956,
	1,26992,1,23734)

	-- Frostweave Bandage -- 45545
	self:addTradeSkill(RecipeDB,45545,350,34721,1,45542,nil,2,350,375,392,410)
	self:addTradeFlags(RecipeDB,45545,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45545,1,23734,1,26956,1,26992,1,28706,1,29233,1,33589)

	-- Heavy Frostweave Bandage -- 45546
	self:addTradeSkill(RecipeDB,45546,400,34722,2,45542,nil,2,0,400,430,470)
	self:addTradeFlags(RecipeDB,45546,1,2,10,21,22,23,24,25,26,27,28,29,30,36,41)
	self:addTradeAcquire(RecipeDB,45546,7,2)

	return 17

end
