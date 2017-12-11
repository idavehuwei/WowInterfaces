--[[

************************************************************************

ARL-Runeforge.lua

Runeforging data for all of Ackis Recipe List

************************************************************************

File date: 2009-06-23T18:55:32Z 
File revision: 2151 
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

function addon:InitRuneforging(RecipeDB)

	if initialized then
		return
	end

	initialized = true

	-- Rune of the Fallen Crusader - 53344
	self:addTradeSkill(RecipeDB,53344,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53344,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53344,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordshattering - 53323
	self:addTradeSkill(RecipeDB,53323,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53323,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53323,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Swordbreaking - 54446
	self:addTradeSkill(RecipeDB,54446,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,54446,1,2,3,21)
	self:addTradeAcquire(RecipeDB,54446,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellshattering - 53342
	self:addTradeSkill(RecipeDB,53342,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53342,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53342,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Spellbreaking - 54447
	self:addTradeSkill(RecipeDB,54447,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,54447,1,2,3,21)
	self:addTradeAcquire(RecipeDB,54447,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Razorice - 53343
	self:addTradeSkill(RecipeDB,53343,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53343,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53343,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Lichbane - 53331
	self:addTradeSkill(RecipeDB,53331,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53331,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53331,1,29194,1,29196,1,29195,1,31084)

	-- Rune of Cinderglacier - 53341
	self:addTradeSkill(RecipeDB,53341,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,53341,1,2,3,21)
	self:addTradeAcquire(RecipeDB,53341,1,29194,1,29196,1,29195,1,31084)

	-- Rune of the Stoneskin Gargoyle - 62158
	self:addTradeSkill(RecipeDB,62158,1,nil,1,53428,2,1,1,1,2)
	self:addTradeFlags(RecipeDB,62158,1,2,3,21)
	self:addTradeAcquire(RecipeDB,62158,1,29194,1,29196,1,29195,1,31084)

	return 9

end
