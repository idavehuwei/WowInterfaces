--[[

************************************************************************

ARL-Seasonal.lua

 Seasonal data for all of AckisRecipeList

************************************************************************

File date: 2009-06-25T16:12:03Z 
File revision: 2157 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addLookupList(SeasonDB, Season ID, Season Name)

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

local GetCategoryInfo = GetCategoryInfo

function addon:InitSeasons(SeasonDB)

	local name = ""
	local seasonal = GetCategoryInfo(155)

	name = GetCategoryInfo(156) -- Winter's Veil
	self:addLookupList(SeasonDB,1,name,seasonal)
	name = GetCategoryInfo(160) -- Lunar Festival
	self:addLookupList(SeasonDB,2,name,seasonal)
	name = GetCategoryInfo(157) -- Darkmoon Faire
	self:addLookupList(SeasonDB,3,name,seasonal)
	name = GetCategoryInfo(161) -- Midsummer
	self:addLookupList(SeasonDB,4,name,seasonal)

	local _,_,_,toc = GetBuildInfo()

	if (toc == 30200) then
		name = GetCategoryInfo(161) -- Pilgrim
		self:addLookupList(SeasonDB,5,name,seasonal)
		name = GetCategoryInfo(161) -- Dead
		self:addLookupList(SeasonDB,6,name,seasonal)
	end

end
