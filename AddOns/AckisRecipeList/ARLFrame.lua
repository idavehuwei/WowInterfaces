--[[

****************************************************************************************

ARLFrame.lua

Frame functions for all of AckisRecipeList

File date: 2009-08-02T22:27:41Z 
File revision: 2270 
Project revision: 2271
Project version: r2271

****************************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME	= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)

local BFAC		= LibStub("LibBabble-Faction-3.0"):GetLookupTable()
local BC		= LibStub("LibBabble-Class-3.0"):GetLookupTable()
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local QTip		= LibStub("LibQTip-1.0")

-------------------------------------------------------------------------------
-- Upvalued Lua globals
-------------------------------------------------------------------------------
local string = string
local sformat = string.format
local strlower = string.lower
local smatch = string.match

local select = select
local type = type

local table = table
local twipe = table.wipe
local tinsert, tremove = table.insert, table.remove
local ipairs, pairs = ipairs, pairs

local tonumber = tonumber
local math = math
local floor = math.floor

-------------------------------------------------------------------------------
-- Upvalued Blizzard globals
-------------------------------------------------------------------------------
local GetSpellInfo = GetSpellInfo
local GetSkillLineInfo = GetSkillLineInfo
local GetNumSkillLines = GetNumSkillLines
local ExpandSkillHeader = ExpandSkillHeader
local CollapseSkillHeader = CollapseSkillHeader
local GetTradeSkillLine = GetTradeSkillLine
local GetItemInfo = GetItemInfo
local UnitClass = UnitClass

-- Modifier functions which we deal with
local IsModifierKeyDown = IsModifierKeyDown
local IsShiftKeyDown = IsShiftKeyDown
local IsAltKeyDown = IsAltKeyDown
local IsControlKeyDown = IsControlKeyDown

-------------------------------------------------------------------------------
-- Local variables. Must be used by multiple functions to be listed here.
-------------------------------------------------------------------------------
local currentProfIndex = 0
local currentProfession = ""
local maxVisibleRecipes = 24
local FilterValueMap		-- Assigned in InitializeFrame()
local DisplayStrings = {}
local myFaction = ""

-------------------------------------------------------------------------------
-- Tables assigned in addon:DisplayFrame()
-------------------------------------------------------------------------------
local recipeDB, trainerDB, vendorDB, questDB, repDB, seasonDB, customDB, mobDB

local allSpecTable
local playerData

local sortedRecipeIndex

local seasonal = GetCategoryInfo(155)


-------------------------------------------------------------------------------
-- Fonts
-------------------------------------------------------------------------------
local narrowFont
local normalFont

-- Font Objects needed for arlTooltip
local narrowFontObj = CreateFont(MODNAME.."narrowFontObj")
local normalFontObj = CreateFont(MODNAME.."normalFontObj")

-- Fallback in case the user doesn't have LSM-3.0 installed
if (not LibStub:GetLibrary("LibSharedMedia-3.0", true)) then

	local locale = GetLocale()
	-- Fix for font issues on koKR
	if (locale == "koKR") then
		narrowFont = "Fonts\\2002.TTF"
		normalFont = "Fonts\\2002.TTF"
	else
		narrowFont = "Fonts\\ARIALN.TTF"
		normalFont = "Fonts\\FRIZQT__.TTF"
	end
else
	-- Register LSM 3.0
	local LSM3 = LibStub("LibSharedMedia-3.0")

	narrowFont = LSM3:Fetch(LSM3.MediaType.FONT, "Arial Narrow")
	normalFont = LSM3:Fetch(LSM3.MediaType.FONT, "Friz Quadrata TT")
end

local arlTooltip = _G["arlTooltip"]
local arlSpellTooltip = _G["arlSpellTooltip"]

local addonversion = GetAddOnMetadata("AckisRecipeList", "Version")
addonversion = string.gsub(addonversion, "@project.revision@", "SVN")

local ARL_SearchText,ARL_LastSearchedText
local ARL_ExpGeneralOptCB,ARL_ExpObtainOptCB,ARL_ExpBindingOptCB,ARL_ExpItemOptCB,ARL_ExpPlayerOptCB,ARL_ExpRepOptCB,ARL_RepOldWorldCB,ARL_RepBCCB,ARL_RepLKCB,ARL_ExpMiscOptCB

-- To make tabbing between professions easier 
local SortedProfessions = { 
	{ name = GetSpellInfo(51304),	texture = "alchemy" },	-- 1 
	{ name = GetSpellInfo(51300),	texture = "blacksmith" }, -- 2 
	{ name = GetSpellInfo(51296),	texture = "cooking" },	-- 3 
	{ name = GetSpellInfo(51313),	texture = "enchant" },	-- 4 
	{ name = GetSpellInfo(51306),	texture = "engineer" },	-- 5 
	{ name = GetSpellInfo(45542),	texture = "firstaid" },	-- 6 
	{ name = GetSpellInfo(45363),	texture = "inscribe" },	-- 7 
	{ name = GetSpellInfo(51311),	texture = "jewel" },	-- 8 
	{ name = GetSpellInfo(51302),	texture = "leather" },	-- 9 
	{ name = GetSpellInfo(53428),	texture = "runeforge" }, -- 10 
	{ name = GetSpellInfo(32606),	texture = "smelting" },	-- 11 
	{ name = GetSpellInfo(51309),	texture = "tailor" },	-- 12 
} 

local MaxProfessions = 12

-- Some variables I want to use in creating the GUI later... (ZJ 8/26/08)
local ExpButtonText = {
	L["General"],		-- 1
	L["Obtain"],		-- 2
	L["Binding"],		-- 3
	L["Item"],			-- 4
	L["Player Type"],	-- 5
	L["Reputation"],	-- 6
	L["Misc"]			-- 7
}

local ExpButtonTT = {
	L["FILTERING_GENERAL_DESC"],	-- 1
	L["FILTERING_OBTAIN_DESC"],		-- 2
	L["FILTERING_BINDING_DESC"],	-- 3
	L["FILTERING_ITEM_DESC"],		-- 4
	L["FILTERING_PLAYERTYPE_DESC"],	-- 5
	L["FILTERING_REP_DESC"],		-- 6
	L["FILTERING_MISC_DESC"]		-- 7
}


-- Define the static popups we're going to call when people don't have a
-- scanned or don't are blocking all recipes from being displayed
-- with current filters

StaticPopupDialogs["ARL_NOTSCANNED"] = {
	text = L["NOTSCANNED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLFILTERED"] = {
	text = L["ALL_FILTERED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLKNOWN"] = {
	text = L["ARL_ALLKNOWN"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_ALLEXCLUDED"] = {
	text = L["ARL_ALLEXCLUDED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}

StaticPopupDialogs["ARL_SEARCHFILTERED"] = {
	text = L["ARL_SEARCHFILTERED"],
	button1 = L["Ok"],
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
}


-------------------------------------------------------------------------------
-- Table cache mechanism
-------------------------------------------------------------------------------
local AcquireTable, ReleaseTable
do
	local table_cache = {}

	-- Returns a table
	function AcquireTable()
		local tbl = tremove(table_cache) or {}
		return tbl
	end

	-- Cleans the table and stores it in the cache
	function ReleaseTable(tbl)
		if not tbl then return end
		twipe(tbl)
		tinsert(table_cache, tbl)
	end
end	-- do block

-------------------------------------------------------------------------------
-- Close all possible pop-up windows
-------------------------------------------------------------------------------
function addon:ClosePopups()
	StaticPopup_Hide("ARL_NOTSCANNED")
	StaticPopup_Hide("ARL_ALLFILTERED")
	StaticPopup_Hide("ARL_ALLKNOWN")
	StaticPopup_Hide("ARL_ALLEXCLUDED")
	StaticPopup_Hide("ARL_SEARCHFILTERED")
end

-------------------------------------------------------------------------------
-- Hide the main recipe frame, and close all popups.
-------------------------------------------------------------------------------
function addon:CloseWindow()
	self:ClosePopups()
	self.Frame:Hide()
end

-------------------------------------------------------------------------------
-- Colours a skill level based on whether or not the player has a high enough
-- skill level or faction to learn it.
-------------------------------------------------------------------------------
local function ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr, recipeOrange, recipeYellow, recipeGreen, recipeGrey)

	-- Players skill level is not high enough or they do not have hte needed faction.
	if ((recipeSkill > playerSkill) or (not hasFaction)) then
		return addon:Red(recStr)
	-- Players skill level is above the threshold in which the recipe is grey
	elseif (playerSkill >= recipeGrey) then
		return addon:MidGrey(recStr)
	-- Players skills is at the threshold when the recipe turns green.
	elseif (playerSkill >= recipeGreen) then
		return addon:Green(recStr)
	-- Players skills is at the threshold when the recipe turns yellow.
	elseif (playerSkill >= recipeYellow) then
		return addon:Yellow(recStr)
	-- Players skills is at the threshold when the recipe turns orange.
	elseif (playerSkill >= recipeOrange) then
		return addon:Orange(recStr)
	-- Fallback
	else
		--@alpha@
		addon:Print("DEBUG: ColourSkillLevel fallback: " .. recStr)
		--@end-alpha@
		return addon:MidGrey(recStr)
	end
end

------------------------------------------------------------------------------
-- Locale-specific strings. Save some CPU by looking these up exactly once.
------------------------------------------------------------------------------
local factionHorde	= BFAC["Horde"]
local factionAlliance	= BFAC["Alliance"]
local factionNeutral	= BFAC["Neutral"]

-------------------------------------------------------------------------------
-- Constants for acquire types.
-------------------------------------------------------------------------------
local ACQUIRE_TRAINER		= 1
local ACQUIRE_VENDOR		= 2
local ACQUIRE_MOB		= 3
local ACQUIRE_QUEST		= 4
local ACQUIRE_SEASONAL		= 5
local ACQUIRE_REPUTATION	= 6
local ACQUIRE_WORLD_DROP	= 7
local ACQUIRE_CUSTOM		= 8

------------------------------------------------------------------------------
-- Description: Function to determine if the player has an appropiate level of faction.
-- Expected result: A boolean value determing if the player can learn the recipe based on faction
-- Input: The database, the index of the recipe, the players faction and reputation levels
-- Output: A boolean indicating if they can learn the recipe or not
------------------------------------------------------------------------------
local checkFactions
do
	------------------------------------------------------------------------------
	-- Reputation constants
	------------------------------------------------------------------------------
	local REP_MAGHAR	= 941
	local REP_HONOR_HOLD	= 946
	local REP_THRALLMAR	= 947
	local REP_KURENI	= 978

	function checkFactions(DB, recipeIndex, playerFaction, playerRep)
		local fac = true
		local acquire = DB[recipeIndex]["Acquire"]

		-- Scan through all acquire types
		for i in pairs(acquire) do
			-- If it's a reputation type
			if (acquire[i]["Type"] == ACQUIRE_REPUTATION) then
				local repid = acquire[i]["ID"]

				if (repid == REP_HONOR_HOLD) or (repid == REP_THRALLMAR) then
					if (playerFaction == factionAlliance) then
						repid = REP_HONOR_HOLD
					else
						repid = REP_THRALLMAR
					end
				elseif (repid == REP_MAGHAR) or (repid == REP_KURENI) then
					if (playerFaction == factionAlliance) then
						repid = REP_KURENI
					else
						repid = REP_MAGHAR
					end
				end

				if (not playerRep[repDB[repid]["Name"]]) or (playerRep[repDB[repid]["Name"]] < DB[recipeIndex]["Acquire"][i]["RepLevel"]) then
					fac = false
				else
					-- This means that the faction level is high enough to learn the recipe, so we'll set display to true and leave the loop
					-- This should allow recipes which have multiple reputations to work correctly
					fac = true
					break
				end
			end
		end
		return fac
	end
end	--do

-- Description: Sets the string to display baseed off of what type of sorting is being done.
-- Expected result:  Displayed string will have the skill level located in different areas
-- Input: The skil level of the recipe and the remaining string
-- Output:  A combined string with the skill level integrated into the skill

local function SetSortString(recipeSkill, recStr)

	local sorttype = addon.db.profile.sorting

	if (sorttype == "SkillAsc" or sorttype == "SkillDesc") then
		return "[" .. recipeSkill .. "] - " .. recStr
	else
		return recStr .. " - [" .. recipeSkill .. "]"
	end

end

-- Description: 

local function CheckDisplayFaction(filterDB, faction)

	if (filterDB.general.faction ~= true) then
		if ((faction == BFAC[myFaction]) or (faction == factionNeutral) or (faction == nil)) then
			return true
		else
			return false
		end
	else
		return true
	end

end

do

	local function LoadZones(c, y, ...)
		-- Fill up the list for normal lookup
		for i = 1, select('#', ...),1 do
			c[i] = select(i,...)
		end
		-- Reverse lookup to make work easier later on
		for i in pairs(c) do
			y[c[i]] = i
		end
	end

	local C1 = {}
	local C2 = {}
	local C3 = {}
	local C4 = {}
	local c1 = {}
	local c2 = {}
	local c3 = {}
	local c4 = {}

	LoadZones(C1, c1, GetMapZones(1))
	LoadZones(C2, c2, GetMapZones(2))
	LoadZones(C3, c3, GetMapZones(3))
	LoadZones(C4, c4, GetMapZones(4))

	local iconlist = {}

	-- Description: Clears all the icons from the map.
	-- Expected result: All icons are removed from the world map and the mini-map
	-- Input: None
	-- Output: All icons are removed.

	function addon:ClearMap()

		-- Make sure we have TomTom installed
		if (TomTom) then
			-- Remove all the waypoints from TomTom
			for i in pairs(iconlist) do
				TomTom:RemoveWaypoint(iconlist[i])
			end
			-- Nuke our own internal table
			iconlist = twipe(iconlist)
		end

	end

	local function CheckMapDisplay(v, filters)
		local display = false

		if (v["Type"] == ACQUIRE_TRAINER) then		-- If it's a trainer, we don't display them on the mini-map
			display = ((trainerDB[v["ID"]]["Faction"] == BFAC[myFaction]) or (trainerDB[v["ID"]]["Faction"] == factionNeutral))
		elseif (v["Type"] == ACQUIRE_VENDOR) then	-- If it's a vendor check to see if we're displaying it on the map
			display = ((vendorDB[v["ID"]]["Faction"] == BFAC[myFaction]) or (vendorDB[v["ID"]]["Faction"] == factionNeutral))
		elseif (v["Type"] == ACQUIRE_MOB) then		-- If it's a mob, always return true
			return true
		elseif (v["Type"] == ACQUIRE_QUEST) then	-- If it's a quest check to see if we're displaying it on the map
			display = ((questDB[v["ID"]]["Faction"] == BFAC[myFaction]) or (questDB[v["ID"]]["Faction"] == factionNeutral))
		end
		return display
	end

	-- Description: Adds mini-map and world map icons with tomtom.
	-- Expected result: Icons are added to the world map and mini-map.
	-- Input: An optional recipe ID
	-- Output: Points are added to the maps
	local maplist = {}
	function addon:SetupMap(singlerecipe)
		if (not TomTom) then
			return
		end

		local worldmap = addon.db.profile.worldmap
		local minimap = addon.db.profile.minimap

		if not (worldmap or minimap) then return end

		local icontext = "Interface\\AddOns\\AckisRecipeList\\img\\enchant_up"

		-- Get the proper icon to put on the mini-map
		for i, k in pairs(SortedProfessions) do
			if (k["name"] == playerData.playerProfession) then
				icontext = "Interface\\AddOns\\AckisRecipeList\\img\\" .. k["texture"] .. "_up"
				break
			end
		end
		local filters = addon.db.profile.filters
		local autoscanmap = addon.db.profile.autoscanmap

		twipe(maplist)

		-- We're only getting a single recipe, not a bunch
		if (singlerecipe) then
			-- loop through acquire methods, display each
			for k, v in pairs(recipeDB[singlerecipe]["Acquire"]) do
				if (CheckMapDisplay(v, filters)) then
					maplist[v["ID"]] = v["Type"]
				end
			end
		elseif (autoscanmap == true) then
			-- Scan through all recipes to display, and add the vendors to a list to get their acquire info
			for i = 1, #sortedRecipeIndex do
				local recipeIndex = sortedRecipeIndex[i]
				if ((recipeDB[recipeIndex]["Display"] == true) and (recipeDB[recipeIndex]["Search"] == true)) then
					-- loop through acquire methods, display each
					for k, v in pairs(recipeDB[recipeIndex]["Acquire"]) do
						if (CheckMapDisplay(v, filters)) then
							maplist[v["ID"]] = v["Type"]
						end
					end
				end
			end
		end

--		local ARLWorldMap = CreateFrame("Button","ARLWorldMap",WorldMapDetailFrame)
--		ARLWorldMap:ClearAllPoints()
--		ARLWorldMap:SetWidth(8)
--		ARLWorldMap:SetHeight(8)
--		ARLWorldMap.icon = ARLWorldMap:CreateTexture("ARTWORK") 
--		ARLWorldMap.icon:SetTexture(icontext)
--		ARLWorldMap.icon:SetAllPoints()

--		local ARLMiniMap = CreateFrame("Button","ARLMiniMap",MiniMap)
--		ARLMiniMap:ClearAllPoints()
--		ARLMiniMap:SetWidth(8)
--		ARLMiniMap:SetHeight(8)
--		ARLMiniMap.icon = ARLMiniMap:CreateTexture("ARTWORK") 
--		ARLMiniMap.icon:SetTexture(icontext)
--		ARLMiniMap.icon:SetAllPoints()

		for k, j in pairs(maplist) do

			local continent, zone
			local loc = nil

			-- Get the entries location
			if (maplist[k] == 1) then
				loc = trainerDB[k]
			elseif (maplist[k] == 2) then
				loc = vendorDB[k]
			elseif (maplist[k] == 3) then
				loc = mobDB[k]
			elseif (maplist[k] == 4) then
				loc = questDB[k]
			end

			-- We don't have a loc in our database for these entries
			if (not loc) then
				--@alpha@
				addon:Print("DEBUG: No continent/zone map match for ID " .. k .. " - loc is nil.")
				--@end-alpha@
				return
			end

			if (c1[loc["Location"]]) then
				continent = 1
				zone = c1[loc["Location"]]
			elseif (c2[loc["Location"]]) then
				continent = 2
				zone = c2[loc["Location"]]
			elseif (c3[loc["Location"]]) then
				continent = 3
				zone = c3[loc["Location"]]
			elseif (c4[loc["Location"]]) then
				continent = 4
				zone = c4[loc["Location"]]
			else
				--@alpha@
				addon:Print("DEBUG: No continent/zone map match for ID " .. k .. ".")
				--@end-alpha@
				return
			end
		
			if ((zone) and (continent)) then
				local iconuid = TomTom:AddZWaypoint(continent, zone, loc["Coordx"], loc["Coordy"], loc["Name"], false, minimap, worldmap)
				tinsert(iconlist, iconuid)
			end
		end
	end	-- addon:SetupMap()
end -- do block

-- Description: Parses the recipes and determines which ones to display, and makes them display appropiatly

local function WipeDisplayStrings()
	for i = 1, #DisplayStrings do
		ReleaseTable(DisplayStrings[i])
	end
	twipe(DisplayStrings)
end

local function initDisplayStrings()
	local exclude = addon.db.profile.exclusionlist

	WipeDisplayStrings()

	local insertIndex = 1

	for i = 1, #sortedRecipeIndex do

		local recipeIndex = sortedRecipeIndex[i]
		local recipeEntry = recipeDB[recipeIndex]

		if ((recipeEntry["Display"] == true) and (recipeEntry["Search"] == true)) then
			-- add in recipe difficulty coloring
			local recStr = ""

			if (exclude[recipeIndex] == true) then
				recStr = "** " .. recipeEntry["Name"] .. " **"
			else
				recStr = recipeEntry["Name"]
			end

			local recipeSkill = recipeEntry["Level"]
			local recipeOrange = recipeEntry["Orange"]
			local recipeYellow = recipeEntry["Yellow"]
			local recipeGreen = recipeEntry["Green"]
			local recipeGrey = recipeEntry["Grey"]
			local playerSkill = playerData.playerProfessionLevel

			recStr = SetSortString(recipeSkill, recStr)

			local hasFaction = checkFactions(recipeDB, recipeIndex, playerData.playerFaction, playerData["Reputation"])

			local t = AcquireTable()
			t.String = ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr, recipeOrange, recipeYellow, recipeGreen, recipeGrey)

			t.sID = recipeIndex
			t.IsRecipe = true
			t.IsExpanded = false
			tinsert(DisplayStrings, insertIndex, t)
			insertIndex = insertIndex + 1

		end

	end

end

-- Description: 

local function ClearRecipeButtonTooltip(bIndex)

	local pButton = addon.PlusListButton[bIndex]
	local rButton = addon.RecipeListButton[bIndex]
	pButton:SetScript("OnEnter", function () end)
	pButton:SetScript("OnLeave", function () end)
	rButton:SetScript("OnEnter", function () end)
	rButton:SetScript("OnLeave", function () end)

end

-- Description: Converting from hex to rgb (Thanks Maldivia)

local function toRGB(hex)

	local r, g, b = hex:match("(..)(..)(..)")

	return (tonumber(r, 16) / 256), (tonumber(g,16) / 256), (tonumber(b, 16) / 256)

end

-- Description: 

-- I want to do a bit more comprehensive tooltip processing. Things like changing font sizes,
-- adding padding to the left hand side, and using better color handling. So... this function
-- will do that for me.

local function ttAdd(
	leftPad,		-- number of times to pad two spaces on left side
	textSize,		-- add to or subtract from addon.db.profile.frameopts.fontsize to get fontsize
	narrow,			-- if 1, use ARIALN instead of FRITZQ
	str1,			-- left-hand string
	hexcolor1,		-- hex color code for left-hand side
	str2,			-- if present, this is the right-hand string
	hexcolor2)		-- if present, hex color code for right-hand side

	-- are we changing fontsize or narrow?
	local fontSize
	if ((narrow == 1) or (textSize ~= 0)) then
		local font, fontObj = normalFont, normalFontObj
		if (narrow == 1) then
			font = narrowFont
			fontObj = narrowFontObj
		end

		fontSize = addon.db.profile.frameopts.fontsize + textSize

		fontObj:SetFont(font, fontSize)
		arlTooltip:SetFont(fontObj)
	end

	-- Add in our left hand padding
	local loopPad = leftPad
	local leftStr = str1

	while (loopPad > 0) do
		leftStr = "  " .. leftStr
		loopPad = loopPad - 1
	end
	local lineNum

	if (str2) then
		lineNum = arlTooltip:AddLine()
		arlTooltip:SetCell(lineNum, 1, "|cff"..hexcolor1..leftStr.."|r")
		arlTooltip:SetCell(lineNum, 2, "|cff"..hexcolor2..str2.."|r", "RIGHT")
	else
		-- Text spans both columns - set maximum width to match fontSize to maintain uniform tooltip size. -Torhal
		local width = math.ceil(fontSize * 37.5)
		lineNum = arlTooltip:AddLine()
		arlTooltip:SetCell(lineNum, 1, "|cff"..hexcolor1..leftStr.."|r", nil, "LEFT", 2, nil, 0, 0, width, width)
	end
end

local function SetSpellTooltip(owner, loc, link)
	arlSpellTooltip:SetOwner(owner, "ANCHOR_NONE")
	arlSpellTooltip:ClearAllPoints()
	if (loc == "Top") then
		arlSpellTooltip:SetPoint("BOTTOMLEFT", owner, "TOPLEFT")
	elseif (loc == "Bottom") then
		arlSpellTooltip:SetPoint("TOPLEFT", owner, "BOTTOMLEFT")
	elseif (loc == "Left") then
		arlSpellTooltip:SetPoint("TOPRIGHT", owner, "TOPLEFT")
	elseif (loc == "Right") then
		arlSpellTooltip:SetPoint("TOPLEFT", owner, "TOPRIGHT")
	end
	arlSpellTooltip:SetHyperlink(link)
	arlSpellTooltip:Show()
end

-- Description: 
local function GenerateTooltipContent(owner, rIndex, playerFaction, exclude)
	local spellTooltipLocation = addon.db.profile.spelltooltiplocation
	local acquireTooltipLocation = addon.db.profile.acquiretooltiplocation
	local spellLink = recipeDB[rIndex]["RecipeLink"]

	if (acquireTooltipLocation == L["Off"]) then
		QTip:Release(arlTooltip)
		-- If we have the spell link tooltip, anchor it to addon.Frame instead so it shows
		if (spellTooltipLocation ~= L["Off"]) and (spellLink) then
			SetSpellTooltip(addon.Frame, spellTooltipLocation, spellLink)
		else
			arlSpellTooltip:Hide()
		end
		return
	end
	arlTooltip = QTip:Acquire(MODNAME.." Tooltip", 2, "LEFT", "LEFT")
	arlTooltip:SetScale(addon.db.profile.frameopts.tooltipscale)
	arlTooltip:ClearAllPoints()

	if (acquireTooltipLocation == "Right") then
		arlTooltip:SetPoint("TOPLEFT", addon.Frame, "TOPRIGHT")
	elseif (acquireTooltipLocation == "Left") then
		arlTooltip:SetPoint("TOPRIGHT", addon.Frame, "TOPLEFT")
	elseif (acquireTooltipLocation == "Top") then
		arlTooltip:SetPoint("BOTTOMLEFT", addon.Frame, "TOPLEFT")
	elseif (acquireTooltipLocation == "Bottom") then
		arlTooltip:SetPoint("TOPLEFT", addon.Frame, "BOTTOMLEFT")
	elseif (acquireTooltipLocation == "Mouse") then
		arlTooltip:ClearAllPoints()
		local x,y = GetCursorPosition()
		local uiscale = UIParent:GetEffectiveScale()
		x = x/uiscale
		y = y/uiscale
		arlTooltip:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", x, y)
	end

	if TipTac and TipTac.AddModifiedTip then
		-- Pass true as second parameter because hooking OnHide causes C stack overflows -Torhal
		TipTac:AddModifiedTip(arlTooltip, true)
	end
	local clr1, clr2 = "", ""

	arlTooltip:Clear()
	arlTooltip:AddHeader()
	arlTooltip:SetCell(1, 1, "|cff"..addon:hexcolor("HIGH")..recipeDB[rIndex]["Name"], "CENTER", 2)

	-- check if the recipe is excluded
	if (exclude[rIndex] == true) then
		ttAdd(0, -1, 1, L["RECIPE_EXCLUDED"], addon:hexcolor("RED"))
	end

	-- Add in skill level requirement, colored correctly
	clr1 = addon:hexcolor("NORMAL")

	local recipeSkill = recipeDB[rIndex]["Level"]
	local playerSkill = playerData.playerProfessionLevel

	if (recipeSkill > playerSkill) then
		clr2 = addon:hexcolor("RED")
	elseif ((playerSkill - recipeSkill) < 20) then
		clr2 = addon:hexcolor("ORANGE")
	elseif ((playerSkill - recipeSkill) < 30) then
		clr2 = addon:hexcolor("YELLOW")
	elseif ((playerSkill - recipeSkill) < 40) then
		clr2 = addon:hexcolor("GREEN") 
	else
		clr2 = addon:hexcolor("MIDGREY")
	end

	ttAdd(0, -1, 0, L["Required Skill"] .. " :", clr1, recipeDB[rIndex]["Level"], clr2)
	arlTooltip:AddSeparator()
	-- Binding info
	clr1 = addon:hexcolor("NORMAL")

	if (recipeDB[rIndex]["Flags"][36]) then
		ttAdd(0, -1, 1, L["BOEFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][37]) then
		ttAdd(0, -1, 1, L["BOPFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][38]) then
		ttAdd(0, -1, 1, L["BOAFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][40]) then
		ttAdd(0, -1, 1, L["RecipeBOEFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][41]) then
		ttAdd(0, -1, 1, L["RecipeBOPFilter"], clr1)
	end

	if (recipeDB[rIndex]["Flags"][42]) then
		ttAdd(0, -1, 1, L["RecipeBOAFilter"], clr1)
	end
	arlTooltip:AddSeparator()

	-- obtain info
	ttAdd(0, -1, 0, L["Obtained From"] .. " : ", addon:hexcolor("NORMAL"))

	local factiondisp = addon.db.profile.filters.general.faction

	-- loop through acquire methods, display each
	for k, v in pairs(recipeDB[rIndex]["Acquire"]) do
		if (v["Type"] == ACQUIRE_TRAINER) then
			-- Trainer:			TrainerName
			-- TrainerZone			TrainerCoords
			local trnr = trainerDB[v["ID"]]
			local cStr = ""

			clr1 = addon:hexcolor("TRAINER")
			-- Don't display trainers if it's opposite faction
			local displaytt = false
			if (trnr["Faction"] == factionHorde) then
				clr2 = addon:hexcolor("HORDE")
				if (playerFaction == factionHorde) then
					displaytt = true
				end
			elseif (trnr["Faction"] == factionAlliance) then
				clr2 = addon:hexcolor("ALLIANCE")
				if (playerFaction == factionAlliance) then
					displaytt = true
				end
			else
				clr2 = addon:hexcolor("NEUTRAL")
				displaytt = true
			end

			if (displaytt) then
				-- Add the trainer information to the tooltip
				ttAdd(0, -2, 0, L["Trainer"], clr1, trnr["Name"], clr2)
				-- If we have a coordinate, add the coordinates to the tooltop
				if (trnr["Coordx"] ~= 0) and (trnr["Coordy"] ~= 0) then
					cStr = "(" .. trnr["Coordx"] .. ", " .. trnr["Coordy"] .. ")"
				end
				clr1 = addon:hexcolor("NORMAL")
				clr2 = addon:hexcolor("HIGH")
				ttAdd(1, -2, 1, trnr["Location"], clr1, cStr, clr2)
			end
		elseif (v["Type"] == ACQUIRE_VENDOR) then
			-- Vendor:					VendorName
			-- VendorZone				VendorCoords
			local vndr = vendorDB[v["ID"]]
			local cStr = ""

			clr1 = addon:hexcolor("VENDOR")
			-- Don't display vendors of opposite faction
			local displaytt = false
			local faction

			if (vndr["Faction"] == factionHorde) then
				clr2 = addon:hexcolor("HORDE")
				if (playerFaction == factionHorde) then
					displaytt = true
				else
					faction = factionHorde
				end
			elseif (vndr["Faction"] == factionAlliance) then
				clr2 = addon:hexcolor("ALLIANCE")
				if (playerFaction == factionAlliance) then
					displaytt = true
				else
					faction = factionAlliance
				end
			else
				clr2 = addon:hexcolor("NEUTRAL")
				displaytt = true
			end

			if (displaytt) then
				if (vndr["Coordx"] ~= 0) and (vndr["Coordy"] ~= 0) then
					cStr = "(" .. vndr["Coordx"] .. ", " .. vndr["Coordy"] .. ")"
				end

				ttAdd(0, -1, 0, L["Vendor"], clr1, vndr["Name"], clr2)
				clr1 = addon:hexcolor("NORMAL")
				clr2 = addon:hexcolor("HIGH")
				ttAdd(1, -2, 1, vndr["Location"], clr1, cStr, clr2)
			elseif faction then
				ttAdd(0, -1, 0, faction.." "..L["Vendor"], clr1)
			end
		elseif (v["Type"] == ACQUIRE_MOB) then
			-- Mob Drop:				Mob Name
			-- MobZone				MobCoords
			local mob = mobDB[v["ID"]]
			local cStr = ""

			if (mob["Coordx"] ~= 0) and (mob["Coordy"] ~= 0) then
				cStr = "(" .. mob["Coordx"] .. ", " .. mob["Coordy"] .. ")"
			end

			clr1 = addon:hexcolor("MOBDROP")
			clr2 = addon:hexcolor("HORDE")
			ttAdd(0, -1, 0, L["Mob Drop"], clr1, mob["Name"], clr2)
			clr1 = addon:hexcolor("NORMAL")
			clr2 = addon:hexcolor("HIGH")
			ttAdd(1, -2, 1, mob["Location"], clr1, cStr, clr2)
		elseif (v["Type"] == ACQUIRE_QUEST) then
			-- Quest:				QuestName
			-- QuestZone				QuestCoords
			local qst = questDB[v["ID"]]

			if qst then
				clr1 = addon:hexcolor("QUEST")
				-- Don't display quests of opposite faction
				local displaytt = false
				local faction

				if (qst["Faction"] == factionHorde) then
					clr2 = addon:hexcolor("HORDE")
					if (playerFaction == factionHorde) then
						displaytt = true
					else
						faction = factionHorde
					end
				elseif (qst["Faction"] == factionAlliance) then
					clr2 = addon:hexcolor("ALLIANCE")
					if (playerFaction == factionAlliance) then
						displaytt = true
					else
						faction = factionAlliance
					end
				else
					clr2 = addon:hexcolor("NEUTRAL")
					displaytt = true
				end

				if (displaytt) then
					local cStr = ""
					if (qst["Coordx"] ~= 0) and (qst["Coordy"] ~= 0) then
						cStr = "(" .. qst["Coordx"] .. ", " .. qst["Coordy"] .. ")"
					end

					ttAdd(0, -1, 0, L["Quest"], clr1, qst["Name"], clr2)
					clr1 = addon:hexcolor("NORMAL")
					clr2 = addon:hexcolor("HIGH")
					ttAdd(1, -2, 1, qst["Location"], clr1, cStr, clr2)
				elseif faction then
					ttAdd(0, -1, 0, faction.." "..L["Quest"], clr1)
				end
			end
		elseif (v["Type"] == ACQUIRE_SEASONAL) then
			-- Seasonal:				SeasonEventName
			local ssnname = seasonDB[v["ID"]]["Name"]

			clr1 = addon:hexcolor("SEASON")
			ttAdd(0, -1, 0, seasonal, clr1, ssnname, clr1)
		elseif (v["Type"] == ACQUIRE_REPUTATION) then
			-- Reputation:				Faction
			-- FactionLevel				RepVendor				
			-- RepVendorZone			RepVendorCoords

			local repfac = repDB[v["ID"]]
			local repname = repfac["Name"] -- name
			local rplvl = v["RepLevel"]
			local repvndr = vendorDB[v["RepVendor"]]
			local cStr = ""

			if (repvndr["Coordx"] ~= 0) and (repvndr["Coordy"] ~= 0) then
				cStr = "(" .. repvndr["Coordx"] .. ", " .. repvndr["Coordy"] .. ")"
			end
			clr1 = addon:hexcolor("REP")
			clr2 = addon:hexcolor("NORMAL")
			ttAdd(0, -1, 0, L["Reputation"], clr1, repname, clr2)

			local rStr = ""
			if (rplvl == 0) then
				rStr = factionNeutral
				clr1 = addon:hexcolor("NEUTRAL")
			elseif (rplvl == 1) then
				rStr = BFAC["Friendly"]
				clr1 = addon:hexcolor("FRIENDLY")
			elseif (rplvl == 2) then
				rStr = BFAC["Honored"]
				clr1 = addon:hexcolor("HONORED")
			elseif (rplvl == 3) then
				rStr = BFAC["Revered"]
				clr1 = addon:hexcolor("REVERED")
			else
				rStr = BFAC["Exalted"]
				clr1 = addon:hexcolor("EXALTED")
			end

			local displaytt = false
			if (repvndr["Faction"] == factionHorde) then
				clr2 = addon:hexcolor("HORDE")
				if (playerFaction == factionHorde) then
					displaytt = true
				end
			elseif (repvndr["Faction"] == factionAlliance) then
				clr2 = addon:hexcolor("ALLIANCE")
				if (playerFaction == factionAlliance) then
					displaytt = true
				end
			else
				clr2 = addon:hexcolor("NEUTRAL")
				displaytt = true
			end

			if (displaytt) then
				ttAdd(1, -2, 0, rStr, clr1, repvndr["Name"], clr2)
				clr1 = addon:hexcolor("NORMAL")
				clr2 = addon:hexcolor("HIGH")
				ttAdd(2, -2, 1, repvndr["Location"], clr1, cStr, clr2)
			end
		elseif (v["Type"] == ACQUIRE_WORLD_DROP) then
			-- World Drop				RarityLevel
			if (v["ID"] == 1) then
				clr1 = addon:hexcolor("COMMON")
			elseif (v["ID"] == 2) then
				clr1 = addon:hexcolor("UNCOMMON")
			elseif (v["ID"] == 3) then
				clr1 = addon:hexcolor("RARE")
			elseif (v["ID"] == 4) then
				clr1 = addon:hexcolor("EPIC")
			else
				clr1 = addon:hexcolor("NORMAL")
			end
			ttAdd(0, -1, 0, L["World Drop"], clr1)
		elseif (v["Type"] == ACQUIRE_CUSTOM) then
			local customname = customDB[v["ID"]]["Name"]

			ttAdd(0, -1, 0, customname, addon:hexcolor("NORMAL"))

		else	-- Unhandled
			ttAdd(0, -1, 0, L["Unhandled Recipe"], addon:hexcolor("NORMAL"))
		end
	end
	arlTooltip:AddSeparator()
	arlTooltip:AddSeparator()

	clr1 = addon:hexcolor("NORMAL")

	ttAdd(0, -1, 0, L["ALT_CLICK"], clr1)
	ttAdd(0, -1, 0, L["CTRL_CLICK"], clr1)
	ttAdd(0, -1, 0, L["SHIFT_CLICK"], clr1)

	if addon.db.profile.worldmap or addon.db.profile.minimap then
		ttAdd(0, -1, 0, L["CTRL_SHIFT_CLICK"], clr1)
	end

	arlTooltip:Show()

	-- If we have the spell link tooltip, link it to the acquire tooltip.
	if (spellTooltipLocation ~= L["Off"]) and (spellLink) then
		SetSpellTooltip(arlTooltip, spellTooltipLocation, spellLink)
	else
		arlSpellTooltip:Hide()
	end
end

-- Description: This sets the tooltip on the button during a recipelist update

local function SetRecipeButtonTooltip(bIndex)

	local pButton = addon.PlusListButton[bIndex]
	local rButton = addon.RecipeListButton[bIndex]
	local dStringIndex = rButton.sI
	local rIndex = DisplayStrings[dStringIndex].sID
	local playerFaction = playerData.playerFaction
	local exclude = addon.db.profile.exclusionlist

	pButton:SetScript("OnEnter",
			function (pButton)
				GenerateTooltipContent(pButton, rIndex, playerFaction, exclude)
			end
		)

	pButton:SetScript("OnLeave",
			function()
				QTip:Release(arlTooltip)
				arlSpellTooltip:Hide()
			end
		)

	rButton:SetScript("OnEnter",
			function (rButton)
				GenerateTooltipContent(rButton, rIndex, playerFaction, exclude)
			end
		)

	rButton:SetScript("OnLeave",
			function()
				QTip:Release(arlTooltip)
				arlSpellTooltip:Hide()
			end
		)

end

-- Description: Scrollframe update stuff

local function RecipeList_Update()
	-- Clear out the current buttons
	for i = 1, maxVisibleRecipes do
		addon.RecipeListButton[i]:SetText("")
		addon.RecipeListButton[i].sI = 0
		addon.PlusListButton[i]:Hide()
		ClearRecipeButtonTooltip(i)
	end

	local entries = #DisplayStrings

	FauxScrollFrame_Update(ARL_RecipeScrollFrame, entries, maxVisibleRecipes, 16)

	-- close all popups
	addon:ClosePopups()

	if (entries > 0) then

		-- enable expand button
		ARL_ExpandButton:SetNormalFontObject("GameFontNormalSmall")
		ARL_ExpandButton:Enable()

		-- now fill in our buttons
		local listOffset = FauxScrollFrame_GetOffset(ARL_RecipeScrollFrame)
		local buttonIndex = 1
		local stringsIndex = buttonIndex + listOffset

		local stayInLoop = true

		while (stayInLoop == true) do

			if (DisplayStrings[stringsIndex].IsRecipe) then

				-- display the + symbol
				addon.PlusListButton[buttonIndex]:Show()

				-- Is it expanded or not?
				if (DisplayStrings[stringsIndex].IsExpanded) then
					addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
					addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Down")
					addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-MinusButton-Disabled")
				else
					addon.PlusListButton[buttonIndex]:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
					addon.PlusListButton[buttonIndex]:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
					addon.PlusListButton[buttonIndex]:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
					addon.PlusListButton[buttonIndex]:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
				end

			else
				addon.PlusListButton[buttonIndex]:Hide()
			end

			addon.RecipeListButton[buttonIndex]:SetText(DisplayStrings[stringsIndex].String)
			addon.RecipeListButton[buttonIndex].sI = stringsIndex

			-- Set the tooltip on the button
			SetRecipeButtonTooltip(buttonIndex)

			buttonIndex = buttonIndex + 1
			stringsIndex = stringsIndex + 1

			if ((buttonIndex > maxVisibleRecipes) or (stringsIndex > entries)) then
				stayInLoop = false
			end

		end

	-- Entries are 0 here, so we have 0 to display
	else
		-- disable expand button, it's useless here and would spam the same error again
		ARL_ExpandButton:SetNormalFontObject("GameFontDisableSmall")
		ARL_ExpandButton:Disable()

		local showpopup = false

		if (addon.db.profile.hidepopup ~= true) then
			showpopup = true
		end

		-- If we haven't run this before we'll show pop-ups for the first time.
		if (addon.db.profile.addonversion ~= addonversion) then
			addon.db.profile.addonversion = addonversion
			showpopup = true
		end

		-- If the recipe total is at 0, it means we have not scanned the profession yet
		if (playerData.recipes_total == 0) then
			if (showpopup == true) then
				StaticPopup_Show("ARL_NOTSCANNED")
			end
		-- We know all the recipes
		elseif (playerData.recipes_known == playerData.recipes_total) then
			if (showpopup == true) then
				StaticPopup_Show("ARL_ALLKNOWN")
			end
		-- Our filters are actually filtering something
		elseif ((playerData.recipes_total_filtered - playerData.recipes_known_filtered) == 0) then
			if (showpopup == true) then
				StaticPopup_Show("ARL_ALLFILTERED")
			end
		-- Our exclusion list is preventing something from being displayed
		elseif (playerData.excluded_recipes_unknown ~= 0) then
			if (showpopup == true) then
				StaticPopup_Show("ARL_ALLEXCLUDED")
			end
		-- We have some search text that is preventing stuff from being displayed
		elseif (ARL_SearchText:GetText() ~= "") then
			StaticPopup_Show("ARL_SEARCHFILTERED")
		else
			addon:Print(L["NO_DISPLAY"])
			addon:Print("DEBUG: recipes_total check for 0")
			addon:Print("DEBUG: recipes_total: " .. playerData.recipes_total)
			addon:Print("DEBUG: recipes_total check for equal to recipes_total")
			addon:Print("DEBUG: recipes_known: " .. playerData.recipes_known)
			addon:Print("DEBUG: recipes_total: " .. playerData.recipes_total)
			addon:Print("DEBUG: recipes_total_filtered - recipes_known_filtered = 0")
			addon:Print("DEBUG: recipes_total_filtered: " .. playerData.recipes_total_filtered)
			addon:Print("DEBUG: recipes_known_filtered: " .. playerData.recipes_known_filtered)
			addon:Print("DEBUG: excluded_recipes_unknown ~= 0")
			addon:Print("DEBUG: excluded_recipes_unknown: " .. playerData.excluded_recipes_unknown)
		end

	end
	
end

-- Description: Updates the progress bar based on the number of known / total recipes

local function SetProgressBar(playerData)

	local pbCur, pbMax

	if (addon.db.profile.includefiltered == true) then
		pbCur = playerData.recipes_known
		pbMax = playerData.recipes_total
	-- We're removing filtered recipes from the final count
	else
		pbCur = playerData.recipes_known_filtered
		pbMax = playerData.recipes_total_filtered
	end

	if (not addon.db.profile.includeexcluded and not addon.db.profile.ignoreexclusionlist) then
		pbCur = pbCur - playerData.excluded_recipes_unknown
		pbMax = pbMax - playerData.excluded_recipes_known
	end

	ARL_ProgressBar:SetMinMaxValues(0, pbMax)
	ARL_ProgressBar:SetValue(pbCur)

	if (floor(pbCur / pbMax * 100) < 101) and (pbCur >= 0) and (pbMax >= 0) then
		ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. floor(pbCur / pbMax * 100) .. "%")
	else
		pbCur = 0
		pbMax = 0
		ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. L["NOT_YET_SCANNED"])
	end

end

-- Description: 

function addon:ResetGUI()

	addon.db.profile.frameopts.offsetx = 0
	addon.db.profile.frameopts.offsety = 0
	addon.db.profile.frameopts.anchorTo = ""
	addon.db.profile.frameopts.anchorFrom = ""
	addon.db.profile.frameopts.uiscale = 1
	addon.db.profile.frameopts.tooltipscale = .9
	addon.db.profile.frameopts.fontsize = 11

end



-------------------------------------------------------------------------------
-- Sorts the recipe Database depending on the settings defined in the database.
-------------------------------------------------------------------------------
local SortMissingRecipes
do
	local tsort = table.sort

	local sortFuncs = nil		-- Sorting functions
	local SortedRecipeIndex = {}	-- Create a new array for the sorted index

	function SortMissingRecipes(RecipeDB)
		if (not sortFuncs) then
			sortFuncs = {}
			sortFuncs["SkillAsc"] = function(a, b)
				if (RecipeDB[a]["Level"] == RecipeDB[b]["Level"]) then
					return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]
				else
					return RecipeDB[a]["Level"] < RecipeDB[b]["Level"]
				end
			end

			sortFuncs["SkillDesc"] = function(a, b)
				if (RecipeDB[a]["Level"] == RecipeDB[b]["Level"]) then
					return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]
				else
					return RecipeDB[b]["Level"] < RecipeDB[a]["Level"]
				end
			end

			sortFuncs["Name"] = function(a, b)
				return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]
			end

			-- Will only sort based off of the first acquire type
			sortFuncs["Acquisition"] = function (a, b)
				local reca = RecipeDB[a]["Acquire"][1]
				local recb = RecipeDB[b]["Acquire"][1]
				if (reca and recb) then
					if (reca["Type"] == recb["Type"]) then
						return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]
					else
						return reca["Type"] < recb["Type"]
					end
				else
					return not not reca
				end
			end

			-- Will only sort based off of the first acquire type
			sortFuncs["Location"] = function (a, b)
				-- We do the or "" because of nil's, I think this would be better if I just left it as a table which was returned
				local reca = RecipeDB[a]["Locations"] or ""
				local recb = RecipeDB[b]["Locations"] or ""
				reca = smatch(reca,"(%w+),") or ""
				recb = smatch(recb,"(%w+),") or ""
				if (reca == recb) then
					return RecipeDB[a]["Name"] < RecipeDB[b]["Name"]
				else
					return (reca < recb)
				end
			end
		end
		twipe(SortedRecipeIndex)

		-- Get all the indexes of the RecipeListing
		for n, v in pairs(RecipeDB) do
			tinsert(SortedRecipeIndex, n)
		end
		tsort(SortedRecipeIndex, sortFuncs[addon.db.profile.sorting])

		return SortedRecipeIndex
	end
end

-- Under various conditions, I'm going to have to redisplay my recipe list
-- This could happen because a filter changes, a new profession is chosen, or
-- a new search occurred. Use this function to do all the dirty work

-- Description: 

local function ReDisplay()
	addon:UpdateFilters(recipeDB, allSpecTable, playerData)
	sortedRecipeIndex = SortMissingRecipes(recipeDB)

	playerData.excluded_recipes_known, playerData.excluded_recipes_unknown = addon:GetExclusions(recipeDB,playerData.playerProfession)

	initDisplayStrings()

	SetProgressBar(playerData)

	-- Make sure our expand all button is set to expandall
	ARL_ExpandButton:SetText(L["EXPANDALL"])
	addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

	-- And update our scrollframe
	RecipeList_Update()

end

-- Description: Creates the scan button for ARL. 

function addon:CreateScanButton()

	-- Create the scan button
	if (not addon.ScanButton) then
		addon.ScanButton = CreateFrame("Button", "ARL_ScanButton", UIParent, "UIPanelButtonTemplate")
	end

	-- Add to Skillet interface
	if (Skillet and Skillet:IsActive()) then
		addon.ScanButton:SetParent(SkilletFrame)
		addon.ScanButton:Show()
		Skillet:AddButtonToTradeskillWindow(addon.ScanButton)
		addon.ScanButton:SetWidth(80)
	end

	-- Set some of the common button properties
	addon.ScanButton:SetHeight(20)
	addon.ScanButton:RegisterForClicks("LeftButtonUp")
	addon.ScanButton:SetScript("OnClick",
			function()
				addon:ToggleFrame()
			end
		)

	addon.ScanButton:SetScript("OnEnter",
			function(this)
				GameTooltip_SetDefaultAnchor(GameTooltip, this)
				GameTooltip:SetText(L["SCAN_RECIPES_DESC"])
				GameTooltip:Show()
			end
		)

	addon.ScanButton:SetScript("OnLeave",
			function()
				GameTooltip:Hide()
			end
		)

	addon.ScanButton:SetText(L["Scan"])

	local buttonparent = addon.ScanButton:GetParent()
	local framelevel = buttonparent:GetFrameLevel()
	local framestrata = buttonparent:GetFrameStrata()

	-- Set the frame level of the button to be 1 deeper than its parent
	addon.ScanButton:SetFrameLevel(framelevel + 1)
	addon.ScanButton:SetFrameStrata(framestrata)

	addon.ScanButton:Enable()

end

-- Description: 

function addon:ShowScanButton()

	-- Anchor to ATSW
	if (ATSWFrame) then
		addon.ScanButton:SetParent(ATSWFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("RIGHT", ATSWOptionsButton, "LEFT", 0, 0)
		addon.ScanButton:SetHeight(ATSWOptionsButton:GetHeight())
		addon.ScanButton:SetWidth(90)
	-- Anchor to Cauldron
	elseif (CauldronFrame) then
		addon.ScanButton:SetParent(CauldronFrame)
		addon.ScanButton:ClearAllPoints()
		addon.ScanButton:SetPoint("TOP", CauldronFrame, "TOPRIGHT", -58, -52)
		addon.ScanButton:SetWidth(90)
	-- Anchor to trade window
	else
		addon.ScanButton:SetParent(TradeSkillFrame)
		addon.ScanButton:ClearAllPoints()

		local loc = addon.db.profile.scanbuttonlocation

		if (loc == "TR") then
			addon.ScanButton:SetPoint("RIGHT",TradeSkillFrameCloseButton,"LEFT",4,0)
		elseif (loc == "TL") then
			addon.ScanButton:SetPoint("LEFT",TradeSkillFramePortrait,"RIGHT",2,12)
		elseif (loc == "BR") then
			addon.ScanButton:SetPoint("TOP",TradeSkillCancelButton,"BOTTOM",0,-5)
		elseif (loc == "BL") then
			addon.ScanButton:SetPoint("TOP",TradeSkillCreateAllButton,"BOTTOM",0,-5)
		end
		addon.ScanButton:SetWidth(addon.ScanButton:GetTextWidth() + 10)
	end

	addon.ScanButton:Show()

end

-- Description: 

function addon:TooltipDisplay(this, textLabel)

	this:SetScript("OnEnter",
			function (this)
				GameTooltip_SetDefaultAnchor(GameTooltip, this)
				GameTooltip:SetText(textLabel, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				GameTooltip:Show()
			end
		)

	this:SetScript("OnLeave",
			function(this)
				GameTooltip:Hide()
			end
		)

end

-- Description: 

function addon.numFilters()

	-- IMPORTANT: If the number of filters we're maintaining changes, you'll need to change the FilterValueMap
	-- at the end (of CreateFrame), as well as the following index value:
	local MaxFilters = 91

	local total = 0
	local active = 0

	for i = 1, MaxFilters do
		if (FilterValueMap[i].svroot == "disabled") then
			-- ignore these filters in the totals
		elseif (FilterValueMap[i].svroot[ FilterValueMap[i].svval ] == true) then
			active = active + 1
			total = total + 1
		else
			total = total + 1
		end
	end
	return active, total

end

-- Description: 

function addon.resetTitle()

	-- reset the frame title line
	local myTitle = ""

	if (addon.Frame._Expanded == true) then

		local aFil, tFil = addon.numFilters()

		myTitle = "ARL (v." .. addonversion .. ") - " .. currentProfession ..
			" (" .. aFil .. "/" .. tFil .. " " .. L["Filters"] .. ")"

	else

		myTitle = "ARL (v." .. addonversion .. ") - " .. currentProfession

	end

	addon.Frame.HeadingText:SetText(addon:Normal(myTitle))

end

-- Description: 

function addon.filterSwitch(val)

	if (FilterValueMap[val].cb:GetChecked()) then
		FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = true
	else
		FilterValueMap[val].svroot[ FilterValueMap[val].svval ] = false
	end

	addon.resetTitle()

	-- Use new filters
	ReDisplay()

end

-- Description: 

local function HideARL_ExpOptCB(ignorevalue)

			ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1]))
			ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2]))
			ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3]))
			ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4]))
			ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5]))
			ARL_ExpRepOptCB.text:SetText(addon:White(ExpButtonText[6]))
			ARL_ExpMiscOptCB.text:SetText(addon:Yellow(ExpButtonText[7]))

	if (ignorevalue ~= "general") then
		ARL_ExpGeneralOptCB:SetChecked(false)
		ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1]))
	else
		ARL_ExpGeneralOptCB.text:SetText(addon:White(ExpButtonText[1]))
	end

	if (ignorevalue ~= "obtain") then
		ARL_ExpObtainOptCB:SetChecked(false)
		ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2])) 
	else
		ARL_ExpObtainOptCB.text:SetText(addon:White(ExpButtonText[2]))
	end

	if (ignorevalue ~= "binding") then
		ARL_ExpBindingOptCB:SetChecked(false)
		ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3]))
	else
		ARL_ExpBindingOptCB.text:SetText(addon:White(ExpButtonText[3]))
	end

	if (ignorevalue ~= "item") then
		ARL_ExpItemOptCB:SetChecked(false)
		ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4]))
	else
		ARL_ExpItemOptCB.text:SetText(addon:White(ExpButtonText[4]))
	end

	if (ignorevalue ~= "player") then
		ARL_ExpPlayerOptCB:SetChecked(false)
		ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5]))
	else
		ARL_ExpPlayerOptCB.text:SetText(addon:White(ExpButtonText[5]))
	end

	if (ignorevalue ~= "rep") then
		ARL_ExpRepOptCB:SetChecked(false)
		ARL_ExpRepOptCB.text:SetText(addon:Yellow(ExpButtonText[6]))
	else
		ARL_ExpRepOptCB.text:SetText(addon:White(ExpButtonText[6]))
	end

	if (ignorevalue ~= "misc") then
		ARL_ExpMiscOptCB:SetChecked(false)
		ARL_ExpMiscOptCB.text:SetText(addon:Yellow(ExpButtonText[7]))
	else
		ARL_ExpMiscOptCB.text:SetText(addon:White(ExpButtonText[7]))
	end

end

-- Description: 

function addon.ToggleFilters()

	local xPos = addon.Frame:GetLeft()
	local yPos = addon.Frame:GetBottom()

	if (addon.Frame._Expanded == true) then
		-- Adjust the frame size and texture
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(293)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\main]])
		addon.bgTexture:SetAllPoints(addon.Frame)
		addon.bgTexture:SetTexCoord(0, (293/512), 0, (447/512))
		addon.Frame._Expanded = false
		addon.Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos)
		ARL_ProgressBar:SetWidth(195)

		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText(L["FILTER_OPEN"])
		addon:TooltipDisplay(ARL_FilterButton, L["FILTER_OPEN_DESC"])

		-- Hide my 7 buttons
		ARL_ExpGeneralOptCB:Hide()
		ARL_ExpObtainOptCB:Hide()
		ARL_ExpBindingOptCB:Hide()
		ARL_ExpItemOptCB:Hide()
		ARL_ExpPlayerOptCB:Hide()
		ARL_ExpRepOptCB:Hide()
		ARL_ExpMiscOptCB:Hide()

		-- Uncheck the seven buttons
		HideARL_ExpOptCB()

		-- Hide the flyaway panel
		addon.Flyaway:Hide()

		ARL_ResetButton:Hide()
	else

		-- Adjust the frame size and texture
		addon.Frame:ClearAllPoints()
		addon.Frame:SetWidth(444)
		addon.Frame:SetHeight(447)
		addon.bgTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\expanded]])
		addon.bgTexture:SetAllPoints(addon.Frame)
		addon.bgTexture:SetTexCoord(0, (444/512), 0, (447/512))
		addon.Frame._Expanded = true
		addon.Frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", xPos, yPos)
		ARL_ProgressBar:SetWidth(345)

		-- Change the text and tooltip for the filter button
		ARL_FilterButton:SetText(L["FILTER_CLOSE"])
		addon:TooltipDisplay(ARL_FilterButton, L["FILTER_CLOSE_DESC"])

		-- Show my 7 buttons
		ARL_ExpGeneralOptCB:Show()
		ARL_ExpObtainOptCB:Show()
		ARL_ExpBindingOptCB:Show()
		ARL_ExpItemOptCB:Show()
		ARL_ExpPlayerOptCB:Show()
		ARL_ExpRepOptCB:Show()
		ARL_ExpMiscOptCB:Show()

		ARL_ResetButton:Show()

		-- and finally, show our frame
	end

	-- Reset our title
	addon.resetTitle()

end

-- Description: 

do
	local PUSHDOWN = {
		[64] = 1, [65] = 1, [66] = 1, [67] = 1, [85] = 1,
	}

	function addon:GenericMakeCB(cButton, anchorFrame, ttText, scriptVal, row, col, misc)

		-- set the position of the new checkbox
		local xPos = 2 + ((col - 1) * 100)
		local yPos = -3 - ((row - 1) * 17)
		if (PUSHDOWN[scriptVal]) then yPos = yPos - 5 end
		cButton:SetPoint("TOPLEFT", anchorFrame, "TOPLEFT", xPos, yPos)
		cButton:SetHeight(24)
		cButton:SetWidth(24)
		-- depending if we're on the misc panel thingers or not, set an alternative OnClick method
		if (misc == 0) then
			cButton:SetScript("OnClick", function() addon.filterSwitch(scriptVal) end)
		else
			cButton:SetScript("OnClick", function() addon.db.profile.ignoreexclusionlist = not addon.db.profile.ignoreexclusionlist ReDisplay() end)
		end

		addon:TooltipDisplay(cButton, ttText, 1)
	end
end	-- do

-- Description: 

function addon:GenericCreateButton(
	bName, parentFrame,	bHeight, bWidth,
	anchorFrom, anchorFrame, anchorTo, xOffset, yOffset,
	bNormFont, bHighFont, initText, tAlign, tooltipText, noTextures)

	-- I hate stretchy buttons. Thanks very much to ckknight for this code
	-- (found in RockConfig)

	-- when pressed, the button should look pressed
	local function button_OnMouseDown(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Down]])
		end
	end
	-- when depressed, return to normal
	local function button_OnMouseUp(this)
		if this:IsEnabled() == 1 then
			this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
			this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		end
	end

	local function button_Disable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Disabled]])
		this:__Disable()
		this:EnableMouse(false)
	end

	local function button_Enable(this)
		this.left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this.right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		this:__Enable()
		this:EnableMouse(true)
	end

	local button = CreateFrame("Button", bName, parentFrame)

	button:SetWidth(bWidth)
	button:SetHeight(bHeight)

	if (noTextures == 1) then
		local left = button:CreateTexture(button:GetName() .. "_LeftTexture", "BACKGROUND")
		button.left = left
		local middle = button:CreateTexture(button:GetName() .. "_MiddleTexture", "BACKGROUND")
		button.middle = middle
		local right = button:CreateTexture(button:GetName() .. "_RightTexture", "BACKGROUND")
		button.right = right

		left:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		middle:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])
		right:SetTexture([[Interface\Buttons\UI-Panel-Button-Up]])

		left:SetPoint("TOPLEFT")
		left:SetPoint("BOTTOMLEFT")
		left:SetWidth(12)
		left:SetTexCoord(0, 0.09375, 0, 0.6875)

		right:SetPoint("TOPRIGHT")
		right:SetPoint("BOTTOMRIGHT")
		right:SetWidth(12)
		right:SetTexCoord(0.53125, 0.625, 0, 0.6875)

		middle:SetPoint("TOPLEFT", left, "TOPRIGHT")
		middle:SetPoint("BOTTOMRIGHT", right, "BOTTOMLEFT")
		middle:SetTexCoord(0.09375, 0.53125, 0, 0.6875)

		button:SetScript("OnMouseDown", button_OnMouseDown)
		button:SetScript("OnMouseUp", button_OnMouseUp)
		button:SetScript("OnEnter", SubControl_OnEnter)
		button:SetScript("OnLeave", SubControl_OnLeave)

		button.__Enable = button.Enable
		button.__Disable = button.Disable
		button.Enable = button_Enable
		button.Disable = button_Disable

		local highlight = button:CreateTexture(button:GetName() .. "_Highlight", "OVERLAY", "UIPanelButtonHighlightTexture")
		button:SetHighlightTexture(highlight)
	elseif (noTextures == 2) then
		button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-PlusButton-Disabled")
	elseif (noTextures == 3) then
		button:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		button:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Hilight")
		button:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disable")
	end

	local text = button:CreateFontString(button:GetName() .. "_FontString", "ARTWORK")
	button:SetFontString(text)
	button.text = text
	text:SetPoint("LEFT", button, "LEFT", 7, 0)
	text:SetPoint("RIGHT", button, "RIGHT", -7, 0)
	text:SetJustifyH(tAlign)

	text:SetFontObject(bNormFont)
--	text:SetHighlightFontObject(bHighFont)
--	text:SetDisabledFontObject(GameFontDisableSmall)

	text:SetText(initText)		

	button:SetPoint(anchorFrom, anchorFrame, anchorTo, xOffset, yOffset)

	if (tooltipText ~= "") then

		addon:TooltipDisplay(button, tooltipText)

	end

	return button

end

-- Description: Generic function for creating my expanded panel buttons

function addon:CreateExpCB(bName, bTex, panelIndex)
	local ExpTextureSize = 34

	if ((bName == "ARL_RepOldWorldCB") or (bName == "ARL_RepBCCB") or (bName == "ARL_RepLKCB")) then
		local cButton = CreateFrame("CheckButton", bName, addon.Fly_Rep) -- , "UICheckButtonTemplate")
			cButton:SetWidth(100)
			cButton:SetHeight(46)
			cButton:SetChecked(false)
	
		local iconTex = cButton:CreateTexture(cButton:GetName() .. "buttonTex", "BORDER")
			if (bName == "ARL_RepLKCB") then
				iconTex:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\" .. bTex)
			else
				iconTex:SetTexture('Interface/Glues/Common/' .. bTex)
			end
			iconTex:SetWidth(100)
			iconTex:SetHeight(46)
			iconTex:SetAllPoints(cButton)

		local pushedTexture = cButton:CreateTexture(cButton:GetName() .. "pTex", "ARTWORK")
			pushedTexture:SetTexture('Interface/Buttons/UI-Quickslot-Depress')
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture('Interface/Buttons/ButtonHilight-Square')
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode('ADD')
			cButton:SetHighlightTexture(highlightTexture)
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture('Interface/Buttons/CheckButtonHilight')
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode('ADD')
			cButton:SetCheckedTexture(checkedTexture)

		-- And throw up a tooltip
		if (bName == "ARL_RepOldWorldCB") then
			addon:TooltipDisplay(cButton, L["FILTERING_OLDWORLD_DESC"])
		elseif (bName == "ARL_RepBCCB") then
			addon:TooltipDisplay(cButton, L["FILTERING_BC_DESC"])
		else
			addon:TooltipDisplay(cButton, L["FILTERING_WOTLK_DESC"])
		end

		return cButton
	else 
		local cButton = CreateFrame("CheckButton", bName, addon.Frame) -- , "UICheckButtonTemplate")
			cButton:SetWidth(ExpTextureSize)
			cButton:SetHeight(ExpTextureSize)
			cButton:SetScript("OnClick", function() 
				addon.DoFlyaway(panelIndex)
			end)

		local bgTex = cButton:CreateTexture(cButton:GetName() .. "bgTex", "BACKGROUND")
			bgTex:SetTexture('Interface/SpellBook/UI-Spellbook-SpellBackground')
			bgTex:SetHeight(ExpTextureSize + 6)
			bgTex:SetWidth(ExpTextureSize + 4)
			bgTex:SetTexCoord(0, (43/64), 0, (43/64))
			bgTex:SetPoint("CENTER", cButton, "CENTER", 0, 0)
		local iconTex = cButton:CreateTexture(cButton:GetName() .. "iconTex", "BORDER")
			iconTex:SetTexture('Interface/Icons/' .. bTex)
			iconTex:SetAllPoints(cButton)
		local pushedTexture = cButton:CreateTexture(cButton:GetName() .. "pTex", "ARTWORK")
			pushedTexture:SetTexture('Interface/Buttons/UI-Quickslot-Depress')
			pushedTexture:SetAllPoints(cButton)
			cButton:SetPushedTexture(pushedTexture)
		local highlightTexture = cButton:CreateTexture()
			highlightTexture:SetTexture('Interface/Buttons/ButtonHilight-Square')
			highlightTexture:SetAllPoints(cButton)
			highlightTexture:SetBlendMode('ADD')
			cButton:SetHighlightTexture(highlightTexture)
		local checkedTexture = cButton:CreateTexture()
			checkedTexture:SetTexture('Interface/Buttons/CheckButtonHilight')
			checkedTexture:SetAllPoints(cButton)
			checkedTexture:SetBlendMode('ADD')
			cButton:SetCheckedTexture(checkedTexture)
		-- Create the text object to go along with it
		local cbText = cButton:CreateFontString("cbText", "OVERLAY", "GameFontHighlight")
			cbText:SetText(addon:Yellow(ExpButtonText[panelIndex]))
			cbText:SetPoint("LEFT", cButton, "RIGHT", 5, 0)
			cbText:SetHeight(14)
			cbText:SetWidth(100)
			cbText:SetJustifyH("LEFT")
			cButton.text = cbText

		-- And throw up a tooltip
		addon:TooltipDisplay(cButton, ExpButtonTT[panelIndex])
		cButton:Hide()
		return cButton

	end

end

do

	local currentProfession = nil

	-- Description: Provides logic for when you are clicking the scan button.
	-- Expected result: Does appropiate task depending on what button has been clicked and the current state.
	-- Input: None.
	-- Output: Frame is toggled, etc depending on state.

	function addon:ToggleFrame()

		-- What profession is opened?
		local cprof = GetTradeSkillLine()

		-- The frame is visible
		if (addon.Frame and addon.Frame:IsVisible()) then
			-- Shift only (Text dump)
			if (IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
				self:AckisRecipeList_Command(true)
			-- Alt only (Wipe icons from map)
			elseif (not IsShiftKeyDown() and IsAltKeyDown() and not IsControlKeyDown()) then
				self:ClearMap()
			-- If we have the same profession open, then we close the scanned window
			elseif (not IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) and (currentProfession == cprof) then
				addon.Frame:Hide()
			-- If we have a different profession open we do a scan
			elseif (not IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
				self:AckisRecipeList_Command(false)
				self:SetupMap()
				currentProfession = cprof
			end
		-- Frame is hidden
		else
			currentProfession = cprof
			-- Shift only (Text dump)
			if (IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
				self:AckisRecipeList_Command(true)
			-- Alt only (Wipe icons from map)
			elseif (not IsShiftKeyDown() and IsAltKeyDown() and not IsControlKeyDown()) then
				self:ClearMap()
			-- No modification
			elseif (not IsShiftKeyDown() and not IsAltKeyDown() and not IsControlKeyDown()) then
				self:AckisRecipeList_Command(false)
				self:SetupMap()
			end
		end

	end

end

-- Description: Set the texture on the switcher button.

local function SetSwitcherTexture(tex)

	-- This is really only called the first time its displayed. It should reflect the first
	-- profession the user has selected, or that shows up in his lists.

	-- For now, just display the first texture
	local ARL_S_NTexture = ARL_SwitcherButton:CreateTexture("ARL_S_NTexture", "BACKGROUND")
	ARL_S_NTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]])
	ARL_S_NTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_NTexture:SetAllPoints(ARL_SwitcherButton)

	local ARL_S_PTexture = ARL_SwitcherButton:CreateTexture("ARL_S_PTexture", "BACKGROUND")
	ARL_S_PTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_down]])
	ARL_S_PTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_PTexture:SetAllPoints(ARL_SwitcherButton)

	local ARL_S_DTexture = ARL_SwitcherButton:CreateTexture("ARL_S_DTexture", "BACKGROUND")
	ARL_S_DTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\]] .. tex .. [[_up]])
	ARL_S_DTexture:SetTexCoord(0, 1, 0, 1)
	ARL_S_DTexture:SetAllPoints(ARL_SwitcherButton)

	ARL_SwitcherButton:SetNormalTexture(ARL_S_NTexture)
	ARL_SwitcherButton:SetPushedTexture(ARL_S_PTexture)
	ARL_SwitcherButton:SetDisabledTexture(ARL_S_DTexture)

end

-- Description: Switch the displayed profession in the main panel
function addon:SwitchProfs(button)
	-- Known professions should be in playerData["Professions"]

	-- This loop is gonna be weird. The reason is because we need to
	-- ensure that we cycle through all the known professions, but also
	-- that we do so in order. That means that if the currently displayed
	-- profession is the last one in the list, we're actually going to
	-- iterate completely once to get to the currently displayed profession
	-- and then iterate again to make sure we display the next one in line.
	-- Further, there is the nuance that the person may not know any
	-- professions yet at all. User are so annoying.
	local startLoop = 0
	local endLoop = 0
	local displayProf = 0

	self:ClosePopups()

	-- ok, so first off, if we've never done this before, there is no "current"
	-- and a single iteration will do nicely, thank you
	if button == "LeftButton" then
		-- normal profession switch
		if (currentProfIndex == 0) then
			startLoop = 1
			endLoop = addon.MaxProfessions + 1
		else
			startLoop = currentProfIndex + 1
			endLoop = currentProfIndex
		end
		local index = startLoop
	
		while (index ~= endLoop) do
			if (index > MaxProfessions) then
				index = 1
			else
				if (playerData["Professions"][SortedProfessions[index].name] == true) then
					displayProf = index
					currentProfIndex = index
					break
				else
					index = index + 1
				end
			end
		end
	elseif button == "RightButton" then
		-- reverse profession switch
		if (currentProfIndex == 0) then
			startLoop = addon.MaxProfessions + 1
			endLoop = 0
		else
			startLoop = currentProfIndex - 1
			endLoop = currentProfIndex
		end
		local index = startLoop
	
		while (index ~= endLoop) do
			if (index < 1) then
				index = MaxProfessions
			else
				if (playerData["Professions"][SortedProfessions[index].name] == true) then
					displayProf = index
					currentProfIndex = index
					break
				else
					index = index - 1
				end
			end
		end
	end

	-- Redisplay the button with the new skill
	SetSwitcherTexture(SortedProfessions[currentProfIndex].texture)
	playerData.playerProfession = SortedProfessions[currentProfIndex].name
	currentProfession = playerData.playerProfession

	-- Lets get the new skill level
	-- Expand all headers first

	local NumSkillLines = GetNumSkillLines()
	local expandtable = AcquireTable()

	for i = NumSkillLines, 1, -1 do
		local skillName, _, isExpanded = GetSkillLineInfo(i)
		if (not isExpanded) then
			expandtable[skillName] = true
			ExpandSkillHeader(i)
		end
	end

	NumSkillLines = GetNumSkillLines()

	-- Get the skill level
	for i = 1, NumSkillLines, 1 do
		local skillName, _, _, skillRank = GetSkillLineInfo(i)
		if (skillName == currentProfession) then
			playerData.playerProfessionLevel = skillRank
			break
		end
	end

	-- Collapse expanded headers
	for i = NumSkillLines, 1, -1 do
		local skillName, _, isExpanded = GetSkillLineInfo(i)
		if (expandtable[skillName] == true) then
			CollapseSkillHeader(i)
		end
	end
	ReleaseTable(expandtable)
	ReDisplay()
	addon.resetTitle()

end

local faction_strings	-- This is populated in expandEntry()

local function expandEntry(dsIndex)
	-- insertIndex is the position in DisplayStrings that we want
	-- to expand. Since we are expanding the current entry, the return
	-- value should be the index of the next button after the expansion
	-- occurs

	local filterDB = addon.db.profile.filters
	local obtainDB = filterDB.obtain
	local recipeIndex = DisplayStrings[dsIndex].sID
	local pad = "  "

	dsIndex = dsIndex + 1

	-- Need to loop through the available acquires and put them all in
	for k, v in pairs(recipeDB[recipeIndex]["Acquire"]) do
		-- Initialize the first line here, since every type below will have one.
		local t = AcquireTable()
		t.IsRecipe = false
		t.sID = recipeIndex
		t.IsExpanded = true

		if (v["Type"] == ACQUIRE_TRAINER) and obtainDB.trainer then
			local trainer = trainerDB[v["ID"]]

			if CheckDisplayFaction(filterDB, trainer["Faction"]) then
				local nStr = ""
				local cStr = ""

				if (trainer["Coordx"] ~= 0) and (trainer["Coordy"] ~= 0) then
					cStr = addon:Coords("(" .. trainer["Coordx"] .. ", " .. trainer["Coordy"] .. ")")
				end

				if (trainer["Faction"] == factionHorde) then
					nStr = addon:Horde(trainer["Name"])
				elseif (trainer["Faction"] == factionAlliance) then
					nStr = addon:Alliance(trainer["Name"])
				else
					nStr = addon:Neutral(trainer["Name"])
				end
				t.String = pad .. addon:Trainer(L["Trainer"] .. " : ") .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				t = AcquireTable()
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true
				t.String = pad .. pad .. trainer["Location"] .. " " .. cStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1
			end
		elseif (v["Type"] == ACQUIRE_VENDOR) and obtainDB.vendor then
			local vendor = vendorDB[v["ID"]]

			if CheckDisplayFaction(filterDB, vendor["Faction"]) then
				local cStr = ""

				if (vendor["Coordx"] ~= 0) and (vendor["Coordy"] ~= 0) then
					cStr = addon:Coords("(" .. vendor["Coordx"] .. ", " .. vendor["Coordy"] .. ")")
				end
				local nStr = ""

				if (vendor["Faction"] == factionHorde) then
					nStr = addon:Horde(vendor["Name"])
				elseif (vendor["Faction"] == factionAlliance) then
					nStr = addon:Alliance(vendor["Name"])
				else
					nStr = addon:Neutral(vendor["Name"])
				end
				t.String = pad .. addon:Vendor(L["Vendor"] .. " : ") .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				t = AcquireTable()
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true
				t.String = pad .. pad .. vendor["Location"] .. " " .. cStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1
			end
		elseif (v["Type"] == ACQUIRE_MOB) and (obtainDB.mobdrop or obtainDB.instance or obtainDB.raid) then
			local mob = mobDB[v["ID"]]
			local cStr = ""

			if (mob["Coordx"] ~= 0) and (mob["Coordy"] ~= 0) then
				cStr = addon:Coords("(" .. mob["Coordx"] .. ", " .. mob["Coordy"] .. ")")
			end
			t.String = pad .. addon:MobDrop(L["Mob Drop"] .. " : ") .. addon:Red(mob["Name"])

			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1

			t = AcquireTable()
			t.IsRecipe = false
			t.sID = recipeIndex
			t.IsExpanded = true
			t.String = pad .. pad .. mob["Location"] .. " " .. cStr

			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1
		elseif (v["Type"] == ACQUIRE_QUEST) and obtainDB.quest then
			local quest = questDB[v["ID"]]

			if CheckDisplayFaction(filterDB, quest["Faction"]) then
				local nStr = ""

				if (quest["Faction"] == factionHorde) then
					nStr = addon:Horde(quest["Name"])
				elseif (quest["Faction"] == factionAlliance) then
					nStr = addon:Alliance(quest["Name"])
				else
					nStr = addon:Neutral(quest["Name"])
				end
				t.String = pad .. addon:Quest(L["Quest"] .. " : ") .. nStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				local cStr = ""

				if (quest["Coordx"] ~= 0) and (quest["Coordy"] ~= 0) then
					cStr = addon:Coords("(" .. quest["Coordx"] .. ", " .. quest["Coordy"] .. ")")
				end
				t = AcquireTable()
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true
				t.String = pad .. pad .. quest["Location"] .. " " .. cStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1
			end
		elseif (v["Type"] == ACQUIRE_SEASONAL) and obtainDB.seasonal then
			t.String = pad .. addon:Season(seasonal .. " : " .. seasonDB[v["ID"]]["Name"])
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1
		elseif (v["Type"] == ACQUIRE_REPUTATION) then -- Need to check if we're displaying the currently id'd rep or not as well
			-- Reputation Obtain
			-- Rep: ID, Faction
			-- RepLevel = 0 (Neutral), 1 (Friendly), 2 (Honored), 3 (Revered), 4 (Exalted)
			-- RepVendor - VendorID
			local rep_vendor = vendorDB[v["RepVendor"]]

			if CheckDisplayFaction(filterDB, rep_vendor["Faction"]) then
				t.String = pad .. addon:Rep(L["Reputation"] .. " : ") .. repDB[v["ID"]]["Name"]
				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				if not faction_strings then
					faction_strings = {
						[0] = addon:Neutral(factionNeutral .. " : "),
						[1] = addon:Friendly(BFAC["Friendly"] .. " : "),
						[2] = addon:Honored(BFAC["Honored"] .. " : "),
						[3] = addon:Revered(BFAC["Revered"] .. " : "),
						[4] = addon:Exalted(BFAC["Exalted"] .. " : ")
					}
				end
				local nStr = ""

				if (rep_vendor["Faction"] == factionHorde) then
					nStr = addon:Horde(rep_vendor["Name"])
				elseif (rep_vendor["Faction"] == factionAlliance) then
					nStr = addon:Alliance(rep_vendor["Name"])
				else
					nStr = addon:Neutral(rep_vendor["Name"])
				end
				t = AcquireTable()
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true

				t.String = pad .. pad .. faction_strings[v["RepLevel"]] .. nStr 

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1

				local cStr = ""

				if (rep_vendor["Coordx"] ~= 0) and (rep_vendor["Coordy"] ~= 0) then
					cStr = addon:Coords("(" .. rep_vendor["Coordx"] .. ", " .. rep_vendor["Coordy"] .. ")")
				end
				t = AcquireTable()
				t.IsRecipe = false
				t.sID = recipeIndex
				t.IsExpanded = true
				t.String = pad .. pad .. pad .. rep_vendor["Location"] .. " " .. cStr

				tinsert(DisplayStrings, dsIndex, t)
				dsIndex = dsIndex + 1
			end
		elseif (v["Type"] == ACQUIRE_WORLD_DROP) and obtainDB.worlddrop then
			t.String = pad .. addon:RarityColor(v["ID"] + 1, L["World Drop"])
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1
		elseif (v["Type"] == ACQUIRE_CUSTOM) then
			t.String = pad .. addon:Normal(customDB[v["ID"]]["Name"])
			tinsert(DisplayStrings, dsIndex, t)
			dsIndex = dsIndex + 1
		else	-- We have an acquire type we aren't sure how to deal with.
--			t.String = "Unhandled Acquire Case - Type: " .. v["Type"]
--			tinsert(DisplayStrings, dsIndex, t)
--			dsIndex = dsIndex + 1
		end
	end
	return dsIndex
end

function addon.RecipeItem_OnClick(button)
	local clickedIndex = addon.RecipeListButton[button].sI

	-- Don't do anything if they've clicked on an empty button
	if not clickedIndex or (clickedIndex == 0) then return end

	local clicked_line = DisplayStrings[clickedIndex]
	local traverseIndex = 0

	-- First, check if this is a "modified" click, and react appropriately
	if IsModifierKeyDown() then
		if IsControlKeyDown() and IsShiftKeyDown() then
			addon:SetupMap(clicked_line.sID)
		elseif IsShiftKeyDown() then
			local itemID = recipeDB[clicked_line.sID]["ItemID"]
			if itemID then
				local _, itemLink = GetItemInfo(itemID)

				if itemLink then
					ChatFrameEditBox:Insert(itemLink)
				else
					addon:Print(L["NoItemLink"])
				end
			else
				addon:Print(L["NoItemLink"])
			end
		elseif IsControlKeyDown() then
			ChatFrameEditBox:Insert(recipeDB[clicked_line.sID]["RecipeLink"])
		elseif IsAltKeyDown() then
			-- Code needed here to insert this item into the "Ignore List"
			addon:ToggleExcludeRecipe(clicked_line.sID)
			ReDisplay()
		end
	elseif clicked_line.IsRecipe then
		-- three possibilities here (all with no modifiers)
		-- 1) We clicked on the recipe button on a closed recipe
		-- 2) We clicked on the recipe button of an open recipe
		-- 3) we clicked on the expanded text of an open recipe
		if clicked_line.IsExpanded then
			traverseIndex = clickedIndex + 1

			-- get rid of our expanded lines
			while (DisplayStrings[traverseIndex] and DisplayStrings[traverseIndex].IsRecipe == false) do
				ReleaseTable(tremove(DisplayStrings, traverseIndex))
				-- if this is the last entry in the whole list, we should break out
				if not DisplayStrings[traverseIndex] then
					break
				end
			end
			clicked_line.IsExpanded = false
		else
			expandEntry(clickedIndex)
			clicked_line.IsExpanded = true
		end
	else
		-- this inherently implies that we're on an expanded recipe
		-- first, back up in the list of buttons until we find our recipe line
		traverseIndex = clickedIndex - 1

		while (DisplayStrings[traverseIndex] and DisplayStrings[traverseIndex].IsRecipe == false) do
			traverseIndex = traverseIndex - 1
		end
		DisplayStrings[traverseIndex].IsExpanded = false	-- unexpand it
		traverseIndex = traverseIndex + 1

		-- now remove the expanded lines until we get to a recipe again
		while (DisplayStrings[traverseIndex] and DisplayStrings[traverseIndex].IsRecipe == false) do
			ReleaseTable(tremove(DisplayStrings, traverseIndex))
			-- if this is the last entry in the whole list, we should break out
			if not DisplayStrings[traverseIndex] then
				break
			end
		end
	end
	-- finally, call our scrollframe updater
	RecipeList_Update()
end

-- Description: Rep Filtering panel switcher

function addon.RepFilterSwitch(whichrep)
	-- 1	ARL_RepOldWorldCB		Old World Rep
	-- 2	ARL_RepBCCB				Burning Crusade
	-- 3	ARL_RepLKCB				Wrath of the Lich King
	local ShowPanel = false

	if (whichrep == 1) then

		if (ARL_RepOldWorldCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Show()
			addon.Fly_Rep_BC:Hide()
			addon.Fly_Rep_LK:Hide()
			ARL_RepBCCB:SetChecked(false)
			ARL_RepLKCB:SetChecked(false)

		else

			ShowPanel = false

		end

	elseif (whichrep == 2) then

		if (ARL_RepBCCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Hide()
			addon.Fly_Rep_BC:Show()
			addon.Fly_Rep_LK:Hide()
			ARL_RepOldWorldCB:SetChecked(false)
			ARL_RepLKCB:SetChecked(false)

		else

			ShowPanel = false

		end

	else -- whichrep == 3 (WotLK)

		if (ARL_RepLKCB:GetChecked()) then

			ShowPanel = true
			addon.Fly_Rep_OW:Hide()
			addon.Fly_Rep_BC:Hide()
			addon.Fly_Rep_LK:Show()
			ARL_RepOldWorldCB:SetChecked(false)
			ARL_RepBCCB:SetChecked(false)

		else

			ShowPanel = false

		end

	end

	if (ShowPanel == true) then

		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(296)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_repcol]])
		addon.flyTexture:SetAllPoints(addon.Flyaway)
		addon.flyTexture:SetTexCoord(0, (296/512), 0, (312/512))

		addon.Fly_Rep_OW:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -14)
		addon.Fly_Rep_BC:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -14)
		addon.Fly_Rep_LK:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -14)

	else

		addon.flyTexture:ClearAllPoints()
		addon.Flyaway:SetWidth(136)
		addon.Flyaway:SetHeight(312)
		addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
		addon.flyTexture:SetAllPoints(addon.Flyaway)
		addon.flyTexture:SetTexCoord(0, (136/256), 0, (312/512))
		addon.Fly_Rep_OW:Hide()
		addon.Fly_Rep_BC:Hide()
		addon.Fly_Rep_LK:Hide()
		ARL_RepOldWorldCB:SetChecked(false)
		ARL_RepBCCB:SetChecked(false)
		ARL_RepLKCB:SetChecked(false)

	end

end

-- Description: 

function addon.setFlyawayState()

	-- This function sets all the current options in the flyaway panel to make
	-- sure they are consistent with the SV options. This is run every time the
	-- Flyaway panel "OnShow" triggers
	local filterdb = addon.db.profile.filters
	local armordb = filterdb.item.armor
	local weapondb = filterdb.item.weapon
	-- General Options
	ARL_SpecialtyCB:SetChecked(filterdb.general.specialty)
	ARL_LevelCB:SetChecked(filterdb.general.skill)
	ARL_FactionCB:SetChecked(filterdb.general.faction)
	ARL_KnownCB:SetChecked(filterdb.general.known)
	ARL_UnknownCB:SetChecked(filterdb.general.unknown)
	-- Classes
	ARL_DeathKnightCB:SetChecked(filterdb.classes.deathknight)
	ARL_DruidCB:SetChecked(filterdb.classes.druid)
	ARL_HunterCB:SetChecked(filterdb.classes.hunter)
	ARL_MageCB:SetChecked(filterdb.classes.mage)
	ARL_PaladinCB:SetChecked(filterdb.classes.paladin)
	ARL_PriestCB:SetChecked(filterdb.classes.priest)
	ARL_RogueCB:SetChecked(filterdb.classes.rogue)
	ARL_ShamanCB:SetChecked(filterdb.classes.shaman)
	ARL_WarlockCB:SetChecked(filterdb.classes.warlock)
	ARL_WarriorCB:SetChecked(filterdb.classes.warrior)
	-- Obtain Options
	ARL_InstanceCB:SetChecked(filterdb.obtain.instance)
	ARL_RaidCB:SetChecked(filterdb.obtain.raid)
	ARL_QuestCB:SetChecked(filterdb.obtain.quest)
	ARL_SeasonalCB:SetChecked(filterdb.obtain.seasonal)
	ARL_TrainerCB:SetChecked(filterdb.obtain.trainer)
	ARL_VendorCB:SetChecked(filterdb.obtain.vendor)
	ARL_PVPCB:SetChecked(filterdb.obtain.pvp)
	ARL_DiscoveryCB:SetChecked(filterdb.obtain.discovery)
	ARL_WorldDropCB:SetChecked(filterdb.obtain.worlddrop)
	ARL_MobDropCB:SetChecked(filterdb.obtain.mobdrop)
	ARL_OriginalWoWCB:SetChecked(filterdb.obtain.originalwow)
	ARL_BCCB:SetChecked(filterdb.obtain.bc)
	ARL_WrathCB:SetChecked(filterdb.obtain.wrath)
	-- Binding Options
	ARL_iBoECB:SetChecked(filterdb.binding.itemboe)
	ARL_iBoPCB:SetChecked(filterdb.binding.itembop)
	ARL_rBoECB:SetChecked(filterdb.binding.recipeboe)
	ARL_rBoPCB:SetChecked(filterdb.binding.recipebop)
	-- Armor Options
	ARL_ArmorClothCB:SetChecked(armordb.cloth)
	ARL_ArmorLeatherCB:SetChecked(armordb.leather)
	ARL_ArmorMailCB:SetChecked(armordb.mail)
	ARL_ArmorPlateCB:SetChecked(armordb.plate)
	ARL_ArmorCloakCB:SetChecked(armordb.cloak)
	ARL_ArmorNecklaceCB:SetChecked(armordb.necklace)
	ARL_ArmorRingCB:SetChecked(armordb.ring)
	ARL_ArmorTrinketCB:SetChecked(armordb.trinket)
	ARL_ArmorShieldCB:SetChecked(armordb.shield)
	-- Weapon Options
	ARL_Weapon1HCB:SetChecked(weapondb.onehand)
	ARL_Weapon2HCB:SetChecked(weapondb.twohand)
	ARL_WeaponDaggerCB:SetChecked(weapondb.dagger)
	ARL_WeaponAxeCB:SetChecked(weapondb.axe)
	ARL_WeaponMaceCB:SetChecked(weapondb.mace)
	ARL_WeaponSwordCB:SetChecked(weapondb.sword)
	ARL_WeaponPolearmCB:SetChecked(weapondb.polearm)
	ARL_WeaponWandCB:SetChecked(weapondb.wand)
	ARL_WeaponThrownCB:SetChecked(weapondb.thrown)
	ARL_WeaponAmmoCB:SetChecked(weapondb.ammo)
	ARL_WeaponFistCB:SetChecked(weapondb.fist)
	ARL_WeaponGunCB:SetChecked(weapondb.gun)
--[[
	--Disable weapon options. Probably don't need to touch these...
	ARL_WeaponStaffCB
	ARL_WeaponBowCB
	ARL_WeaponCrossbowCB
]]--
	-- Player Type Options
	ARL_PlayerTankCB:SetChecked(filterdb.player.tank)
	ARL_PlayerMeleeCB:SetChecked(filterdb.player.melee)
	ARL_PlayerHealerCB:SetChecked(filterdb.player.healer)
	ARL_PlayerCasterCB:SetChecked(filterdb.player.caster)
	-- Old World Rep Options
	ARL_RepArgentDawnCB:SetChecked(filterdb.rep.argentdawn)
	ARL_RepCenarionCircleCB:SetChecked(filterdb.rep.cenarioncircle)
	ARL_RepThoriumCB:SetChecked(filterdb.rep.thoriumbrotherhood)
	ARL_RepTimbermawCB:SetChecked(filterdb.rep.timbermaw)
	ARL_RepZandalarCB:SetChecked(filterdb.rep.zandalar)
	-- BC Rep Options
	ARL_RepAldorCB:SetChecked(filterdb.rep.aldor)
	ARL_RepAshtongueCB:SetChecked(filterdb.rep.ashtonguedeathsworn)
	ARL_RepCenarionExpeditionCB:SetChecked(filterdb.rep.cenarionexpedition)
	ARL_RepConsortiumCB:SetChecked(filterdb.rep.consortium)
	ARL_RepHonorHoldCB:SetChecked(filterdb.rep.hellfire)
	ARL_RepKeepersOfTimeCB:SetChecked(filterdb.rep.keepersoftime)
	ARL_RepKurenaiCB:SetChecked(filterdb.rep.nagrand)
	ARL_RepLowerCityCB:SetChecked(filterdb.rep.lowercity)
	ARL_RepScaleSandsCB:SetChecked(filterdb.rep.scaleofthesands)
	ARL_RepScryersCB:SetChecked(filterdb.rep.scryer)
	ARL_RepShatarCB:SetChecked(filterdb.rep.shatar)
	ARL_RepShatteredSunCB:SetChecked(filterdb.rep.shatteredsun)
	ARL_RepSporeggarCB:SetChecked(filterdb.rep.sporeggar)
	ARL_RepVioletEyeCB:SetChecked(filterdb.rep.violeteye)
	-- WotLK Rep Options
	ARL_RepArgentCrusadeCB:SetChecked(filterdb.rep.argentcrusade)
	ARL_RepFrenzyheartCB:SetChecked(filterdb.rep.frenzyheart)
	ARL_RepEbonBladeCB:SetChecked(filterdb.rep.ebonblade)
	ARL_RepKirinTorCB:SetChecked(filterdb.rep.kirintor)
	ARL_RepSonsOfHodirCB:SetChecked(filterdb.rep.sonsofhodir)
	ARL_RepKaluakCB:SetChecked(filterdb.rep.kaluak)
	ARL_RepOraclesCB:SetChecked(filterdb.rep.oracles)
	ARL_RepWyrmrestCB:SetChecked(filterdb.rep.wyrmrest)
	ARL_WrathCommon1CB:SetChecked(filterdb.rep.wrathcommon1)
--[[
	--Disable unused Rep Options
	ARL_WrathCommon2CB:SetChecked(filterdb.rep.wrathcommon2)
	ARL_WrathCommon3CB:SetChecked(filterdb.rep.wrathcommon3)
	ARL_WrathCommon4CB:SetChecked(filterdb.rep.wrathcommon4)
	ARL_WrathCommon5CB:SetChecked(filterdb.rep.wrathcommon5)
]]--
	-- Miscellaneous Options
	ARL_IgnoreCB:SetChecked(addon.db.profile.ignoreexclusionlist)
end

-- Description: 

local function recursiveReset(t)

	-- Thanks to Antiarc for this code

	for k, v in pairs(t) do

		if type(v) == "table" then

			recursiveReset(v)

		else

			t[k] = true

		end

	end

end

-- Description: 

function addon.resetFilters() 

	local filterdb = addon.db.profile.filters

	-- Reset all filters to true
	recursiveReset(addon.db.profile.filters)

	-- Reset specific filters to false
	filterdb.general.class = false
	filterdb.general.specialty = false
	filterdb.general.known = false

	-- Reset all classes to false
	filterdb.classes.deathknight = false
	filterdb.classes.druid = false
	filterdb.classes.hunter = false
	filterdb.classes.mage = false
	filterdb.classes.paladin = false
	filterdb.classes.priest = false
	filterdb.classes.rogue = false
	filterdb.classes.shaman = false
	filterdb.classes.warlock = false
	filterdb.classes.warrior = false

	-- Set your own class to true
	local _, currentclass = UnitClass("player")
	filterdb.classes[strlower(currentclass)] = true

	if (addon.Frame and addon.Frame:IsVisible()) then
		addon.resetTitle()

		-- Uncheck the seven buttons
		HideARL_ExpOptCB()

		-- Hide the flyaway panel
		addon.Flyaway:Hide()

		-- Reset the display
		ReDisplay()
	end
end

-- Description: 

function addon.DoFlyaway(panel)

	-- This is going to manage the flyaway panel, as well as checking or unchecking the
	-- buttons that got us here in the first place
	--
	-- our panels are:
	-- 1	ARL_ExpGeneralOptCB			General Filters
	-- 2	ARL_ExpObtainOptCB			Obtain Filters
	-- 3	ARL_ExpBindingOptCB			Binding Filters
	-- 4	ARL_ExpItemOptCB			Item Filters
	-- 5	ARL_ExpPlayerOptCB			Player Type Filters
	-- 6	ARL_ExpRepOptCB				Reputation Filters
	-- 7	ARL_ExpMiscOptCB			Miscellaneous Filters

	local ChangeFilters = false

	addon.Fly_Rep_OW:Hide()
	addon.Fly_Rep_BC:Hide()
	addon.Fly_Rep_LK:Hide()
	ARL_RepOldWorldCB:SetChecked(false)
	ARL_RepBCCB:SetChecked(false)
	ARL_RepLKCB:SetChecked(false)

	if (panel == 1) then

		if (ARL_ExpGeneralOptCB:GetChecked()) then

			-- uncheck all other buttons
			HideARL_ExpOptCB("general")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Show()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpGeneralOptCB.text:SetText(addon:Yellow(ExpButtonText[1])) 
			ChangeFilters = false

		end

	elseif (panel == 2) then

		if (ARL_ExpObtainOptCB:GetChecked()) then

			HideARL_ExpOptCB("obtain")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Show()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpObtainOptCB.text:SetText(addon:Yellow(ExpButtonText[2])) 
			ChangeFilters = false

		end

	elseif (panel == 3) then

		if (ARL_ExpBindingOptCB:GetChecked()) then

			HideARL_ExpOptCB("binding")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Show()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpBindingOptCB.text:SetText(addon:Yellow(ExpButtonText[3])) 
			ChangeFilters = false

		end

	elseif (panel == 4) then

		if (ARL_ExpItemOptCB:GetChecked()) then

			HideARL_ExpOptCB("item")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Show()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpItemOptCB.text:SetText(addon:Yellow(ExpButtonText[4])) 
			ChangeFilters = false

		end

	elseif (panel == 5) then

		if (ARL_ExpPlayerOptCB:GetChecked()) then

			HideARL_ExpOptCB("player")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Show()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpPlayerOptCB.text:SetText(addon:Yellow(ExpButtonText[5])) 
			ChangeFilters = false

		end

	elseif (panel == 6) then

		if (ARL_ExpRepOptCB:GetChecked()) then

			HideARL_ExpOptCB("rep")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Show()
			addon.Fly_Misc:Hide()

			ChangeFilters = true

		else

			ARL_ExpRepOptCB.text:SetText(addon:Yellow(ExpButtonText[6])) 
			ChangeFilters = false

		end

	elseif (panel == 7) then

		if (ARL_ExpMiscOptCB:GetChecked()) then

			HideARL_ExpOptCB("misc")

			-- display the correct subframe with all the buttons and such, hide the others
			addon.Fly_General:Hide()
			addon.Fly_Obtain:Hide()
			addon.Fly_Binding:Hide()
			addon.Fly_Item:Hide()
			addon.Fly_Player:Hide()
			addon.Fly_Rep:Hide()
			addon.Fly_Misc:Show()

			ChangeFilters = true

		else

			ARL_ExpMiscOptCB.text:SetText(addon:Yellow(ExpButtonText[7])) 
			ChangeFilters = false

		end

	end

	if (ChangeFilters == true) then

		-- Depending on which panel we're showing, either display one column
		-- or two column
		if ((panel == 3) or (panel == 4) or (panel == 7)) then

			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(234)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_2col]])
			addon.flyTexture:SetAllPoints(addon.Flyaway)
			addon.flyTexture:SetTexCoord(0, (234/256), 0, (312/512))

		elseif ((panel == 1) or (panel == 2) or (panel == 5) or (panel == 6)) then

			addon.flyTexture:ClearAllPoints()
			addon.Flyaway:SetWidth(136)
			addon.Flyaway:SetHeight(312)
			addon.flyTexture:SetTexture([[Interface\Addons\AckisRecipeList\img\fly_1col]])
			addon.flyTexture:SetAllPoints(addon.Flyaway)
			addon.flyTexture:SetTexCoord(0, (136/256), 0, (312/512))

		end

		-- Change the filters to the current panel
		addon.Flyaway:Show()

	else

		-- We're hiding, don't bother changing anything
		addon.Flyaway:Hide()

	end

end

-- Description: This does an initial fillup of the DisplayStrings, as above.
-- However, in this case, it expands every recipe

local function expandallDisplayStrings()

	local exclude = addon.db.profile.exclusionlist

	WipeDisplayStrings()

	local insertIndex = 1

	for i = 1, #sortedRecipeIndex do

		local recipeIndex = sortedRecipeIndex[i]
		local recipeEntry = recipeDB[recipeIndex]

		if ((recipeEntry["Display"] == true) and (recipeEntry["Search"] == true)) then
			-- add in recipe difficulty coloring
			local recStr = ""

			if (exclude[recipeIndex] == true) then
				recStr = "** " .. recipeEntry["Name"] .. " **"
			else
				recStr = recipeEntry["Name"]
			end

			local recipeSkill = recipeEntry["Level"]
			local playerSkill = playerData.playerProfessionLevel
			local recipeOrange = recipeEntry["Orange"]
			local recipeYellow = recipeEntry["Yellow"]
			local recipeGreen = recipeEntry["Green"]
			local recipeGrey = recipeEntry["Grey"]

			recStr = SetSortString(recipeSkill, recStr)

			local hasFaction = checkFactions(recipeDB, recipeIndex, playerData.playerFaction, playerData["Reputation"])

			local t = AcquireTable()
			t.String = ColourSkillLevel(recipeSkill, playerSkill, hasFaction, recStr, recipeOrange, recipeYellow, recipeGreen, recipeGrey)

			t.sID = sortedRecipeIndex[i]
			t.IsRecipe = true

			if (recipeEntry["Acquire"]) then
				-- we have acquire information for this. push the title entry into the strings
				-- and start processing the acquires
				t.IsExpanded = true
				tinsert(DisplayStrings, insertIndex, t)
				insertIndex = expandEntry(insertIndex)
			else
				t.IsExpanded = false
				tinsert(DisplayStrings, insertIndex, t)
				insertIndex = insertIndex + 1
			end

		end

	end

end

-- Description: 

function addon.ExpandAll_Clicked()

	-- Called when the expand all button is clicked
	if (ARL_ExpandButton:GetText() == L["EXPANDALL"]) then
		ARL_ExpandButton:SetText(L["CONTRACTALL"])
		addon:TooltipDisplay(ARL_ExpandButton, L["CONTRACTALL_DESC"])
		expandallDisplayStrings()
	else
		ARL_ExpandButton:SetText(L["EXPANDALL"])
		addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])
		initDisplayStrings()
	end
	RecipeList_Update()

end

-- Description: 

local function SetSortName()

	local sorttype = addon.db.profile.sorting

	if (sorttype == "Name") then
		ARL_DD_SortText:SetText(L["Sort"] .. ": " .. L["Name"])
	elseif (sorttype == "SkillAsc") then
		ARL_DD_SortText:SetText(L["Sort"] .. ": " .. L["Skill (Asc)"])
	elseif (sorttype == "SkillDesc") then
		ARL_DD_SortText:SetText(L["Sort"] .. ": " .. L["Skill (Desc)"])
	elseif (sorttype == "Acquisition") then
		ARL_DD_SortText:SetText(L["Sort"] .. ": " .. L["Acquisition"])
	elseif (sorttype == "Location") then
		ARL_DD_SortText:SetText(L["Sort"] .. ": " .. L["Location"])
	end

end

-- Description: 

local function ARL_DD_Sort_OnClick(button, value)
	CloseDropDownMenus()
	addon.db.profile.sorting = value
	SetSortName()
	ReDisplay()
end

-- Description: 

local function ARL_DD_Sort_Initialize()

	local k
	local info = UIDropDownMenu_CreateInfo()

	k = "Name"
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = (addon.db.profile.sorting == k)
		UIDropDownMenu_AddButton(info)
	k = "SkillAsc"
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = (addon.db.profile.sorting == k)
		UIDropDownMenu_AddButton(info)
	k = "SkillDesc"
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = (addon.db.profile.sorting == k)
		UIDropDownMenu_AddButton(info)
	k = "Acquisition"
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = (addon.db.profile.sorting == k)
		UIDropDownMenu_AddButton(info)
	k = "Location"
		info.text = k
		info.arg1 = info.text
		info.func = ARL_DD_Sort_OnClick
		info.checked = (addon.db.profile.sorting == k)
		UIDropDownMenu_AddButton(info)

	SetSortName()

end

-- Description: Saves the frame position into the database 
-- Expected result: Frame coordinates are saved
-- Input: None
-- Output: Database values updated with frame position

local function SaveFramePosition()

	local opts = addon.db.profile.frameopts
	local from, _, to, x, y = addon.Frame:GetPoint()
	opts.anchorFrom = from
	opts.anchorTo = to
	if (addon.Frame._Expanded == true) then
		if (opts.anchorFrom == "TOPLEFT") or
		(opts.anchorFrom == "LEFT") or
		(opts.anchorFrom == "BOTTOMLEFT") then
			opts.offsetx = x
		elseif (opts.anchorFrom == "TOP") or
		(opts.anchorFrom == "CENTER") or
		(opts.anchorFrom == "BOTTOM") then
			opts.offsetx = x - 151/2
		elseif (opts.anchorFrom == "TOPRIGHT") or
		(opts.anchorFrom == "RIGHT") or
		(opts.anchorFrom == "BOTTOMRIGHT") then
			opts.offsetx = x - 151
		end
	else
		opts.offsetx = x
	end
	opts.offsety = y

end

local function SetFramePosition()

	addon.Frame:ClearAllPoints()

	local opts = addon.db.profile.frameopts
	local FixedOffsetX = opts.offsetx
	
	if (opts.anchorTo == "") then
		-- no values yet, clamp to whatever frame is appropriate
		if (ATSWFrame) then
			-- Anchor frame to ATSW
			addon.Frame:SetPoint("CENTER", ATSWFrame, "CENTER", 490, 0)
		elseif (CauldronFrame) then
			-- Anchor frame to Cauldron
			addon.Frame:SetPoint("CENTER", CauldronFrame, "CENTER", 490, 0)
		elseif (Skillet) then
			-- Anchor frame to Skillet
			addon.Frame:SetPoint("CENTER", SkilletFrame, "CENTER", 468, 0)
		else
			-- Anchor to default tradeskill frame
			addon.Frame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPRIGHT", 10, 0)
		end
	else
		if (addon.Frame._Expanded == true) then
			if (opts.anchorFrom == "TOPLEFT") or
			(opts.anchorFrom == "LEFT") or
			(opts.anchorFrom == "BOTTOMLEFT") then
				FixedOffsetX = opts.offsetx
			elseif (opts.anchorFrom == "TOP") or
			(opts.anchorFrom == "CENTER") or
			(opts.anchorFrom == "BOTTOM") then
				FixedOffsetX = opts.offsetx + 151/2
			elseif (opts.anchorFrom == "TOPRIGHT") or
			(opts.anchorFrom == "RIGHT") or
			(opts.anchorFrom == "BOTTOMRIGHT") then
				FixedOffsetX = opts.offsetx + 151
			end
		end
		addon.Frame:SetPoint(opts.anchorFrom, UIParent, opts.anchorTo, FixedOffsetX, opts.offsety)
	end

end

-------------------------------------------------------------------------------
-- Data used in GenerateClickableTT() and its support functions.
-------------------------------------------------------------------------------
local click_info = {
	anchor = nil,
	change_realm = nil,
	target_realm = nil,
	modified = nil,
	name = nil,
	realm = nil,
}
local clicktip
local GenerateClickableTT	-- Upvalued!

-------------------------------------------------------------------------------
-- Clicktip OnMouseUp scripts.
-------------------------------------------------------------------------------
local function ChangeRealm(cell, arg, button)
	click_info.modified = true
	click_info.realm = nil
	click_info.change_realm = true
	click_info.target_realm = nil
	GenerateClickableTT()
end

local function SelectRealm(cell, arg, button)
	click_info.modified = true

	if click_info.change_realm then
		click_info.target_realm = arg
	end
	click_info.realm = arg
	GenerateClickableTT()
end

local function SelectName(cell, arg, button)
	click_info.modified = true
	click_info.name = arg

	-- Wipe tradeskill information for the selected toon. -Torhal
	if IsAltKeyDown() and button == "LeftButton" then
		local tskl_list = addon.db.global.tradeskill
		tskl_list[click_info.realm][click_info.name] = nil

		-- See if there are any toons left on the realm. If not, nuke it as well.
		local found = false
		for name in pairs(tskl_list[click_info.realm]) do
			found = true
		end
		if not found then 
			tskl_list[click_info.realm] = nil
		end
		local anchor = click_info.anchor
		twipe(click_info)
		click_info.anchor = anchor
		GenerateClickableTT()
		return
	end
	GenerateClickableTT()
end

local function SelectProfession(cell, arg, button)
	local tskl_list = addon.db.global.tradeskill
	click_info.modified = true
	addon:Print(click_info.name .. " - " .. click_info.realm .. ": " .. tskl_list[click_info.realm][click_info.name][arg])
end

-------------------------------------------------------------------------------
-- Creates a list of names/alts/etc in a tooltip which can be clicked.
-------------------------------------------------------------------------------
function GenerateClickableTT(anchor)
	local tskl_list = addon.db.global.tradeskill
	local tip = clicktip
	local y, x
	local prealm = GetRealmName()
	local target_realm = prealm

	if click_info.change_realm then
		target_realm = click_info.target_realm
		click_info.change_realm = nil
	end
	tip:Clear()

	if not click_info.realm then
		local other_realms = nil
		local header = nil
		for realm in pairs(tskl_list) do
			if target_realm and (realm ~= target_realm) then
				other_realms = true
			end

			if not target_realm and (realm ~= prealm) then
				if not header then
					tip:AddHeader(L["Other Realms"])
					tip:AddSeparator()
					header = true
				end
				y, x = tip:AddLine()
				tip:SetCell(y, x, realm)
				tip:SetCellScript(y, x, "OnMouseUp", SelectRealm, realm)
			elseif realm == target_realm then
				tip:AddHeader(realm)
				tip:AddSeparator()

				click_info.realm = realm
				for name in pairs(tskl_list[click_info.realm]) do
					if name ~= UnitName("player") then
						y, x = tip:AddLine()
						tip:SetCell(y, x, name)
						tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
					end
				end
			end
		end
		if other_realms then
			tip:AddSeparator()
			y, x = tip:AddLine()
			tip:SetCell(y, x, L["Other Realms"])
			tip:SetCellScript(y, x, "OnMouseUp", ChangeRealm)
		end
		tip:AddSeparator()
	elseif not click_info.name then
		local realm_list = tskl_list[click_info.realm]

		if realm_list then
			tip:AddLine(click_info.realm)
			tip:AddSeparator()
			for name in pairs(realm_list) do
				y, x = tip:AddLine()
				tip:SetCell(y, x, name)
				tip:SetCellScript(y, x, "OnMouseUp", SelectName, name)
			end
			tip:AddSeparator()
		end
	else
		tip:AddHeader(click_info.name)
		tip:AddSeparator()
		for prof in pairs(tskl_list[click_info.realm][click_info.name]) do
			y, x = tip:AddLine()
			tip:SetCell(y, x, prof)
			tip:SetCellScript(y, x, "OnMouseUp", SelectProfession, prof)
		end
		tip:AddSeparator()
	end
	if anchor then
		click_info.anchor = anchor
		tip:SetPoint("TOP", anchor, "BOTTOM")
	else
		tip:SetPoint("TOP", click_info.anchor, "BOTTOM")
	end
	tip:Show()
end

-------------------------------------------------------------------------------
-- Creates the initial frame to display recipes into.
-------------------------------------------------------------------------------
function InitializeFrame()
	-------------------------------------------------------------------------------
	-- Check to see if we're Horde or Alliance, and change the displayed
	-- reputation strings to be faction-correct.
	-------------------------------------------------------------------------------
	local isAlliance = (myFaction == "Alliance")

	local HonorHold_Thrallmar_FactionText = isAlliance and BFAC["Honor Hold"] or BFAC["Thrallmar"]
	local Kurenai_Maghar_FactionText = isAlliance and BFAC["Kurenai"] or BFAC["The Mag'har"]
	local Vanguard_Expedition_FactionText = isAlliance and BFAC["Alliance Vanguard"] or BFAC["Horde Expedition"]
	local SilverConv_Sunreaver_FactionText = isAlliance and BFAC["The Silver Covenant"] or BFAC["The Sunreavers"]
	local Valiance_Warsong_FactionText = isAlliance and BFAC["Valiance Expedition"] or BFAC["Warsong Offensive"]
	local Frostborn_Taunka_FactionText = isAlliance and BFAC["The Frostborn"] or BFAC["The Taunka"]
	local Explorer_Hand_FactionText = isAlliance and BFAC["Explorers' League"] or BFAC["The Hand of Vengeance"]

	-------------------------------------------------------------------------------
	-- Create the main frame.
	-------------------------------------------------------------------------------
	addon.Frame = CreateFrame("Frame", "AckisRecipeList.Frame", UIParent)

	-- Allows ARL to be closed with the Escape key
	tinsert(UISpecialFrames, "AckisRecipeList.Frame")

	addon.Frame:SetWidth(293)
	addon.Frame:SetHeight(447)

	addon.bgTexture = addon.Frame:CreateTexture("AckisRecipeList.bgTexture", "ARTWORK")
	addon.bgTexture:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\main")
	addon.bgTexture:SetAllPoints(addon.Frame)
	addon.bgTexture:SetTexCoord(0, (293/512), 0, (447/512))
	addon.Frame:SetFrameStrata("DIALOG")
	addon.Frame:SetHitRectInsets(5, 5, 5, 5)

	addon.Frame:EnableMouse(true)
	addon.Frame:EnableKeyboard(true)
	addon.Frame:SetMovable(true)

	-------------------------------------------------------------------------------
	-- Assign the frame scripts, then show it.
	-------------------------------------------------------------------------------
	addon.Frame:SetScript("OnMouseDown", function() addon.Frame:StartMoving() end)
	addon.Frame:SetScript("OnHide", function() addon:CloseWindow() end)
	addon.Frame:SetScript("OnMouseUp",
			      function()
				      addon.Frame:StopMovingOrSizing()
				      SaveFramePosition()
			      end)

	addon.Frame:Show()
	addon.Frame._Expanded = false

	-------------------------------------------------------------------------------
	-- Create and position the header.
	-------------------------------------------------------------------------------
	addon.Frame.HeadingText = addon.Frame:CreateFontString("ARL_Frame.HeadingText", "ARTWORK")
	addon.Frame.HeadingText:SetFontObject("GameFontHighlightSmall")
	addon.Frame.HeadingText:ClearAllPoints()
	addon.Frame.HeadingText:SetPoint("TOP", addon.Frame, "TOP", 20, -16)
	addon.Frame.HeadingText:SetJustifyH("CENTER")

	-------------------------------------------------------------------------------
	-- Create the switcher button and assign its scripts.
	-------------------------------------------------------------------------------
	local ARL_SwitcherButton = CreateFrame("Button", "ARL_SwitcherButton", addon.Frame, "UIPanelButtonTemplate")
	ARL_SwitcherButton:SetWidth(64)
	ARL_SwitcherButton:SetHeight(64)
	ARL_SwitcherButton:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 1, -2)
	ARL_SwitcherButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_SwitcherButton:SetScript("OnClick", function(self, button) addon:SwitchProfs(button) end)

	-------------------------------------------------------------------------------
	-- Stuff in the non-expanded frame (or both)
	-------------------------------------------------------------------------------
	local ARL_CloseXButton = CreateFrame("Button", "ARL_CloseXButton", addon.Frame, "UIPanelCloseButton")
	-- Close all possible pop-up windows
	ARL_CloseXButton:SetScript("OnClick", function(self) addon:CloseWindow() end)
	ARL_CloseXButton:SetPoint("TOPRIGHT", addon.Frame, "TOPRIGHT", 5, -6)

	-------------------------------------------------------------------------------
	-- Create the filter button, position it, and set its scripts.
	-------------------------------------------------------------------------------
	local ARL_FilterButton = addon:GenericCreateButton("ARL_FilterButton", addon.Frame,
							   25, 90, "TOPRIGHT", addon.Frame, "TOPRIGHT", -8, -40, "GameFontNormalSmall",
							   "GameFontHighlightSmall", L["FILTER_OPEN"], "CENTER", L["FILTER_OPEN_DESC"], 1)
	ARL_FilterButton:SetScript("OnClick", addon.ToggleFilters)

	-------------------------------------------------------------------------------
	-- Check for old skill sorting, and create the sort frame.
	-------------------------------------------------------------------------------
	if (addon.db.profile.sorting == "Skill") then
		addon.db.profile.sorting = "SkillAsc"
	end

	local ARL_DD_Sort = CreateFrame("Frame", "ARL_DD_Sort", addon.Frame, "UIDropDownMenuTemplate")
	ARL_DD_Sort:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 55, -39)
	ARL_DD_Sort:SetHitRectInsets(16, 16, 0, 0)
	SetSortName()
	UIDropDownMenu_SetWidth(ARL_DD_Sort, 105)

	local ARL_ExpandButton = addon:GenericCreateButton("ARL_ExpandButton", addon.Frame,
							   21, 40, "TOPRIGHT", ARL_DD_Sort, "BOTTOMLEFT", -2, 0, "GameFontNormalSmall",
							   "GameFontHighlightSmall", L["EXPANDALL"], "CENTER", L["EXPANDALL_DESC"], 1)
	ARL_ExpandButton:SetScript("OnClick", addon.ExpandAll_Clicked)

	local ARL_SearchButton = addon:GenericCreateButton("ARL_SearchButton", addon.Frame,
							   25, 74, "TOPLEFT", ARL_DD_Sort, "BOTTOMRIGHT", 1, 4, "GameFontDisableSmall",
							   "GameFontHighlightSmall", L["Search"], "CENTER", L["SEARCH_DESC"], 1)
	ARL_SearchButton:Disable()
	ARL_SearchButton:SetScript("OnClick",
				   function(this)
					   local searchtext = ARL_SearchText:GetText()
					   searchtext = searchtext:trim()

					   if (searchtext ~= "") then
						   ARL_LastSearchedText = searchtext

						   addon:SearchRecipeDB(recipeDB, searchtext)
						   initDisplayStrings()
						   RecipeList_Update()

						   ARL_ExpandButton:SetText(L["EXPANDALL"])
						   addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

						   ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						   ARL_SearchButton:Disable()
					   end
				   end)

	local ARL_ClearButton = addon:GenericCreateButton("ARL_ClearButton", addon.Frame,
							  28, 28, "RIGHT", ARL_SearchButton, "LEFT", 4, -1, "GameFontNormalSmall",
							  "GameFontHighlightSmall", "", "CENTER", L["CLEAR_DESC"], 3)
	ARL_ClearButton:SetScript("OnClick",
				  function()
					  addon:ResetSearch(recipeDB)
					  ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])

					  -- Make sure our expand all button is set to expandall
					  ARL_ExpandButton:SetText(L["EXPANDALL"])
					  addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

					  -- Make sure to clear the focus of the searchbox
					  ARL_SearchText:ClearFocus()

					  -- Disable the search button since we're not searching for anything now
					  ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
					  ARL_SearchButton:Disable()

					  -- Make sure to clear text for last search
					  ARL_LastSearchedText = ""

					  initDisplayStrings()
					  RecipeList_Update()
				  end)
	ARL_SearchText = CreateFrame("EditBox", "ARL_SearchText", addon.Frame, "InputBoxTemplate")
	ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])
	ARL_SearchText:SetScript("OnEnterPressed",
				 function(this)
					 local searchtext = ARL_SearchText:GetText()
					 searchtext = searchtext:trim()
					 if (searchtext ~= "") and (searchtext ~= L["SEARCH_BOX_DESC"]) then
						 ARL_LastSearchedText = searchtext

						 addon:SearchRecipeDB(recipeDB, searchtext)
						 initDisplayStrings()
						 RecipeList_Update()

						 ARL_ExpandButton:SetText(L["EXPANDALL"])
						 addon:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

						 ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						 ARL_SearchButton:Disable()
					 end
				 end)
	ARL_SearchText:SetScript("OnEditFocusGained",
				 function(this)
					 if (this:GetText() == L["SEARCH_BOX_DESC"]) then
						 this:SetText("")
					 end
				 end)
	ARL_SearchText:SetScript("OnEditFocusLost",
				 function(this)
					 if (this:GetText() == "") then
						 this:SetText(L["SEARCH_BOX_DESC"])
					 end
				 end)
	ARL_SearchText:SetScript("OnTextChanged",
				 function(this)
					 if (this:GetText() ~= "" and this:GetText() ~= L["SEARCH_BOX_DESC"] and this:GetText() ~= ARL_LastSearchedText) then
						 ARL_SearchButton:SetNormalFontObject("GameFontNormalSmall")
						 ARL_SearchButton:Enable()
					 else
						 ARL_SearchButton:SetNormalFontObject("GameFontDisableSmall")
						 ARL_SearchButton:Disable()
					 end
				 end)
	ARL_SearchText:EnableMouse(true)
	ARL_SearchText:SetAutoFocus(false)
	ARL_SearchText:SetFontObject(ChatFontNormal)
	ARL_SearchText:SetWidth(130)
	ARL_SearchText:SetHeight(12)
	ARL_SearchText:SetPoint("RIGHT", ARL_ClearButton, "LEFT", 3, -1)
	ARL_SearchText:Show()

	local ARL_CloseButton = addon:GenericCreateButton("ARL_CloseButton", addon.Frame,
							  22, 69, "BOTTOMRIGHT", addon.Frame, "BOTTOMRIGHT", -4, 3, "GameFontNormalSmall",
							  "GameFontHighlightSmall", L["Close"], "CENTER", L["CLOSE_DESC"], 1)
	-- Close all possible pop-up windows
	ARL_CloseButton:SetScript("OnClick", function(self) addon:CloseWindow() end)

	-------------------------------------------------------------------------------
	-- ProgressBar for our skills
	-------------------------------------------------------------------------------
	-- Values for the progressbar (defaults)
	local pbMin = 0
	local pbMax = 100
	local pbCur = 50

	local ARL_ProgressBar = CreateFrame("StatusBar", "ARL_ProgressBar", addon.Frame)
	ARL_ProgressBar:SetWidth(195)
	ARL_ProgressBar:SetHeight(14)
	ARL_ProgressBar:ClearAllPoints()
	ARL_ProgressBar:SetPoint("BOTTOMLEFT", addon.Frame, 17, 7)
	ARL_ProgressBar:SetStatusBarTexture("Interface\\Addons\\AckisRecipeList\\img\\progressbar")
	ARL_ProgressBar:SetOrientation("HORIZONTAL")
	ARL_ProgressBar:SetStatusBarColor(0.25, 0.25, 0.75)
	ARL_ProgressBar:SetMinMaxValues(pbMin, pbMax)
	ARL_ProgressBar:SetValue(pbCur)

	local ARL_ProgressBarText = ARL_ProgressBar:CreateFontString("ARL_ProgressBarText", "ARTWORK")
	ARL_ProgressBarText:SetWidth(195)
	ARL_ProgressBarText:SetHeight(14)
	ARL_ProgressBarText:SetFontObject("GameFontHighlightSmall")
	ARL_ProgressBarText:ClearAllPoints()
	ARL_ProgressBarText:SetPoint("CENTER", ARL_ProgressBar, "CENTER", 0, 0)
	ARL_ProgressBarText:SetJustifyH("CENTER")
	ARL_ProgressBarText:SetText(pbCur .. " / " .. pbMax .. " - " .. floor(pbCur / pbMax * 100) .. "%")

	-------------------------------------------------------------------------------
	-- I'm going to use my own tooltip for recipebuttons
	-------------------------------------------------------------------------------
	arlSpellTooltip = CreateFrame("GameTooltip", "arlSpellTooltip", addon.Frame, "GameTooltipTemplate")

	-- Add TipTac Support
	if (TipTac) and (TipTac.AddModifiedTip) then
		TipTac:AddModifiedTip(arlSpellTooltip)
	end

	-------------------------------------------------------------------------------
	-- The main recipe list buttons and scrollframe
	-------------------------------------------------------------------------------
	addon.PlusListButton = {}
	addon.RecipeListButton = {}

	for i = 1, maxVisibleRecipes do
		local Temp_Plus = addon:GenericCreateButton("ARL_PlusListButton" .. i, addon.Frame,
							    16, 16, "TOPLEFT", addon.Frame, "TOPLEFT", 20, -100, "GameFontNormalSmall",
							    "GameFontHighlightSmall", "", "LEFT", "", 2)

		local Temp_Recipe = addon:GenericCreateButton("ARL_RecipeListButton" .. i, addon.Frame,
							      16, 224, "TOPLEFT", addon.Frame, "TOPLEFT", 37, -100, "GameFontNormalSmall",
							      "GameFontHighlightSmall", "Blort", "LEFT", "", 0)

		if not (i == 1) then
			Temp_Plus:SetPoint("TOPLEFT", addon.PlusListButton[i-1], "BOTTOMLEFT", 0, 3)
			Temp_Recipe:SetPoint("TOPLEFT", addon.RecipeListButton[i-1], "BOTTOMLEFT", 0, 3)
		end

		Temp_Plus:SetScript("OnClick", function() addon.RecipeItem_OnClick(i) end)

		Temp_Recipe:SetScript("OnClick", function() addon.RecipeItem_OnClick(i) end)

		addon.PlusListButton[i] = Temp_Plus
		addon.RecipeListButton[i] = Temp_Recipe
	end

	local ARL_RecipeScrollFrame = CreateFrame("ScrollFrame", "ARL_RecipeScrollFrame", addon.Frame, "FauxScrollFrameTemplate")
	ARL_RecipeScrollFrame:SetHeight(322)
	ARL_RecipeScrollFrame:SetWidth(243)
	ARL_RecipeScrollFrame:SetPoint("TOPLEFT", addon.Frame, "TOPLEFT", 20, -97)
	ARL_RecipeScrollFrame:SetScript("OnVerticalScroll",
					function(self, arg1)
						FauxScrollFrame_OnVerticalScroll(self, arg1, 16, RecipeList_Update)
					end)

	-------------------------------------------------------------------------------
	-- Stuff that appears on the main frame only when expanded
	-------------------------------------------------------------------------------
	local ARL_ResetButton = addon:GenericCreateButton("ARL_ResetButton", addon.Frame,
							  25, 90, "TOPRIGHT", ARL_FilterButton, "BOTTOMRIGHT", 0, -2, "GameFontNormalSmall",
							  "GameFontHighlightSmall", L["Reset"], "CENTER", L["RESET_DESC"], 1)
	ARL_ResetButton:SetScript("OnClick", addon.resetFilters)
	ARL_ResetButton:Hide()

	-------------------------------------------------------------------------------
	-- EXPANDED : 7 buttons for opening/closing the flyaway
	-------------------------------------------------------------------------------
	ARL_ExpGeneralOptCB = addon:CreateExpCB("ARL_ExpGeneralOptCB", "INV_Misc_Note_06", 1)
	ARL_ExpGeneralOptCB:SetPoint("TOPRIGHT", ARL_FilterButton, "BOTTOMLEFT", -1, -50)

	ARL_ExpObtainOptCB = addon:CreateExpCB("ARL_ExpObtainOptCB", "Spell_Shadow_MindRot", 2)
	ARL_ExpObtainOptCB:SetPoint("TOPLEFT", ARL_ExpGeneralOptCB, "BOTTOMLEFT", 0, -8)

	ARL_ExpBindingOptCB = addon:CreateExpCB("ARL_ExpBindingOptCB", "INV_Belt_20", 3)
	ARL_ExpBindingOptCB:SetPoint("TOPLEFT", ARL_ExpObtainOptCB, "BOTTOMLEFT", -0, -8)

	ARL_ExpItemOptCB = addon:CreateExpCB("ARL_ExpItemOptCB", "INV_Misc_EngGizmos_19", 4)
	ARL_ExpItemOptCB:SetPoint("TOPLEFT", ARL_ExpBindingOptCB, "BOTTOMLEFT", -0, -8)

	ARL_ExpPlayerOptCB = addon:CreateExpCB("ARL_ExpPlayerOptCB", "INV_Misc_GroupLooking", 5)
	ARL_ExpPlayerOptCB:SetPoint("TOPLEFT", ARL_ExpItemOptCB, "BOTTOMLEFT", -0, -8)

	ARL_ExpRepOptCB = addon:CreateExpCB("ARL_ExpRepOptCB", "INV_Scroll_05", 6)
	ARL_ExpRepOptCB:SetPoint("TOPLEFT", ARL_ExpPlayerOptCB, "BOTTOMLEFT", -0, -8)

	ARL_ExpMiscOptCB = addon:CreateExpCB("ARL_ExpMiscOptCB", "Trade_Engineering", 7)
	ARL_ExpMiscOptCB:SetPoint("TOPLEFT", ARL_ExpRepOptCB, "BOTTOMLEFT", -0, -8)

	-------------------------------------------------------------------------------
	-- Frame for the flyaway pane
	-------------------------------------------------------------------------------
	addon.Flyaway = CreateFrame("Frame", "ARL_Flyaway", addon.Frame)
	addon.Flyaway:SetWidth(234)
	addon.Flyaway:SetHeight(312)

	addon.flyTexture = addon.Flyaway:CreateTexture("AckisRecipeList.flyTexture", "ARTWORK")
	addon.flyTexture:SetTexture("Interface\\Addons\\AckisRecipeList\\img\\fly_2col")
	addon.flyTexture:SetAllPoints(addon.Flyaway)
	addon.flyTexture:SetTexCoord(0, (234/256), 0, (312/512))
	addon.Flyaway:SetHitRectInsets(5, 5, 5, 5)

	addon.Flyaway:EnableMouse(true)
	addon.Flyaway:EnableKeyboard(true)
	addon.Flyaway:SetMovable(false)

	addon.Flyaway:ClearAllPoints()
	addon.Flyaway:SetPoint("TOPLEFT", addon.Frame, "TOPRIGHT", -6, -102)

	addon.Flyaway:SetScript("OnShow", addon.setFlyawayState) 
	addon.Flyaway:Hide()

	-------------------------------------------------------------------------------
	-- Flyaway virtual frames to group buttons/text easily (and make them easy to show/hide)
	-------------------------------------------------------------------------------
	addon.Fly_General = CreateFrame("Frame", "ARL_Fly_General", addon.Flyaway)
	addon.Fly_General:SetWidth(112)
	addon.Fly_General:SetHeight(280)
	addon.Fly_General:EnableMouse(true)
	addon.Fly_General:EnableKeyboard(true)
	addon.Fly_General:SetMovable(false)
	addon.Fly_General:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_General:Hide()


	-------------------------------------------------------------------------------
	--			() Craft Specialty recipes
	--			() All skill levels
	--			() Cross-Faction
	--			() Known
	--			() Unknown
	--			Classes:
	--			() Deathknight
	--			() Druid
	--			() Hunter
	--			() Mage
	--			() Paladin
	--			() Priest
	--			() Rogue
	--			() Shaman
	--			() Warlock
	--			() Warrior
	-------------------------------------------------------------------------------
	local ARL_SpecialtyCB = CreateFrame("CheckButton", "ARL_SpecialtyCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_SpecialtyCB, addon.Fly_General, L["SPECIALTY_DESC"], 2, 1, 1, 0)
	ARL_SpecialtyCBText:SetText(L["Specialties"])

	local ARL_LevelCB = CreateFrame("CheckButton", "ARL_LevelCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_LevelCB, addon.Fly_General, L["SKILL_DESC"], 3, 2, 1, 0)
	ARL_LevelCBText:SetText(L["Skill"])

	local ARL_FactionCB = CreateFrame("CheckButton", "ARL_FactionCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_FactionCB, addon.Fly_General, L["FACTION_DESC"], 4, 3, 1, 0)
	ARL_FactionCBText:SetText(L["Faction"])

	local ARL_KnownCB = CreateFrame("CheckButton", "ARL_KnownCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_KnownCB, addon.Fly_General, L["KNOWN_DESC"], 5, 4, 1, 0)
	ARL_KnownCBText:SetText(L["Known"])

	local ARL_UnknownCB = CreateFrame("CheckButton", "ARL_UnknownCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_UnknownCB, addon.Fly_General, L["UNKNOWN_DESC"], 6, 5, 1, 0)
	ARL_UnknownCBText:SetText(L["Unknown"])

	local ARL_ClassButton = addon:GenericCreateButton("ARL_ClassButton", addon.Fly_General,
							  20, 70, "TOPLEFT", ARL_UnknownCB, "BOTTOMLEFT", -4, 6, "GameFontHighlight",
							  "GameFontHighlightSmall", L["Classes"], "LEFT", L["CLASS_TEXT_DESC"], 0)
	ARL_ClassButton:SetText(L["Classes"] .. ":")
	ARL_ClassButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_ClassButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_ClassButton:SetScript("OnClick",
				  function(self,button)
					  local filterdb = addon.db.profile.filters
					  if button == "LeftButton" then
						  -- Reset all classes to true
						  filterdb.classes.deathknight = true
						  filterdb.classes.druid = true
						  filterdb.classes.hunter = true
						  filterdb.classes.mage = true
						  filterdb.classes.paladin = true
						  filterdb.classes.priest = true
						  filterdb.classes.rogue = true
						  filterdb.classes.shaman = true
						  filterdb.classes.warlock = true
						  filterdb.classes.warrior = true
					  elseif button == "RightButton" then
						  -- Reset all classes to false
						  filterdb.classes.deathknight = false
						  filterdb.classes.druid = false
						  filterdb.classes.hunter = false
						  filterdb.classes.mage = false
						  filterdb.classes.paladin = false
						  filterdb.classes.priest = false
						  filterdb.classes.rogue = false
						  filterdb.classes.shaman = false
						  filterdb.classes.warlock = false
						  filterdb.classes.warrior = false
						  -- Set your own class to true
						  local _, currentclass = UnitClass("player")
						  filterdb.classes[strlower(currentclass)] = true
					  end
					  -- Update the checkboxes with the new value
					  ARL_DeathKnightCB:SetChecked(filterdb.classes.deathknight)
					  ARL_DruidCB:SetChecked(filterdb.classes.druid)
					  ARL_HunterCB:SetChecked(filterdb.classes.hunter)
					  ARL_MageCB:SetChecked(filterdb.classes.mage)
					  ARL_PaladinCB:SetChecked(filterdb.classes.paladin)
					  ARL_PriestCB:SetChecked(filterdb.classes.priest)
					  ARL_RogueCB:SetChecked(filterdb.classes.rogue)
					  ARL_ShamanCB:SetChecked(filterdb.classes.shaman)
					  ARL_WarlockCB:SetChecked(filterdb.classes.warlock)
					  ARL_WarriorCB:SetChecked(filterdb.classes.warrior)
					  -- Reset our title
					  addon.resetTitle()
					  -- Use new filters
					  ReDisplay()
				  end)
	local ARL_DeathKnightCB = CreateFrame("CheckButton", "ARL_DeathKnightCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_DeathKnightCB, addon.Fly_General, L["CLASS_DESC"], 87, 7, 1, 0)
	ARL_DeathKnightCBText:SetText(BC["Deathknight"])

	local ARL_DruidCB = CreateFrame("CheckButton", "ARL_DruidCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_DruidCB, addon.Fly_General, L["CLASS_DESC"], 88, 8, 1, 0)
	ARL_DruidCBText:SetText(BC["Druid"])

	local ARL_HunterCB = CreateFrame("CheckButton", "ARL_HunterCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_HunterCB, addon.Fly_General, L["CLASS_DESC"], 19, 9, 1, 0)
	ARL_HunterCBText:SetText(BC["Hunter"])

	local ARL_MageCB = CreateFrame("CheckButton", "ARL_MageCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_MageCB, addon.Fly_General, L["CLASS_DESC"], 20, 10, 1, 0)
	ARL_MageCBText:SetText(BC["Mage"])

	local ARL_PaladinCB = CreateFrame("CheckButton", "ARL_PaladinCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PaladinCB, addon.Fly_General, L["CLASS_DESC"], 25, 11, 1, 0)
	ARL_PaladinCBText:SetText(BC["Paladin"])

	local ARL_PriestCB = CreateFrame("CheckButton", "ARL_PriestCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PriestCB, addon.Fly_General, L["CLASS_DESC"], 26, 12, 1, 0)
	ARL_PriestCBText:SetText(BC["Priest"])

	local ARL_RogueCB = CreateFrame("CheckButton", "ARL_RogueCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RogueCB, addon.Fly_General, L["CLASS_DESC"], 81, 13, 1, 0)
	ARL_RogueCBText:SetText(BC["Rogue"])

	local ARL_ShamanCB = CreateFrame("CheckButton", "ARL_ShamanCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ShamanCB, addon.Fly_General, L["CLASS_DESC"], 83, 14, 1, 0)
	ARL_ShamanCBText:SetText(BC["Shaman"])

	local ARL_WarlockCB = CreateFrame("CheckButton", "ARL_WarlockCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WarlockCB, addon.Fly_General, L["CLASS_DESC"], 78, 15, 1, 0)
	ARL_WarlockCBText:SetText(BC["Warlock"])

	local ARL_WarriorCB = CreateFrame("CheckButton", "ARL_WarriorCB", addon.Fly_General, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WarriorCB, addon.Fly_General, L["CLASS_DESC"], 1, 16, 1, 0)
	ARL_WarriorCBText:SetText(BC["Warrior"])

	addon.Fly_Obtain = CreateFrame("Frame", "ARL_Fly_Obtain", addon.Flyaway)
	addon.Fly_Obtain:SetWidth(112)
	addon.Fly_Obtain:SetHeight(280)
	addon.Fly_Obtain:EnableMouse(true)
	addon.Fly_Obtain:EnableKeyboard(true)
	addon.Fly_Obtain:SetMovable(false)
	addon.Fly_Obtain:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Obtain:Hide()

	-------------------------------------------------------------------------------
	--			() Instance	() Raid
	--			() Quest	() Seasonal
	--			() Trainer	() Vendor
	--			() PVP		() Discovery
	--			() World Drop	() Mob Drop
	-------------------------------------------------------------------------------
	local ARL_InstanceCB = CreateFrame("CheckButton", "ARL_InstanceCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_InstanceCB, addon.Fly_Obtain, L["INSTANCE_DESC"], 7, 1, 1, 0)
	ARL_InstanceCBText:SetText(L["Instance"])

	local ARL_RaidCB = CreateFrame("CheckButton", "ARL_RaidCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RaidCB, addon.Fly_Obtain, L["RAID_DESC"], 8, 2, 1, 0)
	ARL_RaidCBText:SetText(L["Raid"])

	local ARL_QuestCB = CreateFrame("CheckButton", "ARL_QuestCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_QuestCB, addon.Fly_Obtain, L["QUEST_DESC"], 9, 3, 1, 0)
	ARL_QuestCBText:SetText(L["Quest"])

	local ARL_SeasonalCB = CreateFrame("CheckButton", "ARL_SeasonalCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_SeasonalCB, addon.Fly_Obtain, L["SEASONAL_DESC"], 10, 4, 1, 0)
	ARL_SeasonalCBText:SetText(seasonal)

	local ARL_TrainerCB = CreateFrame("CheckButton", "ARL_TrainerCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_TrainerCB, addon.Fly_Obtain, L["TRAINER_DESC"], 11, 5, 1, 0)
	ARL_TrainerCBText:SetText(L["Trainer"])

	local ARL_VendorCB = CreateFrame("CheckButton", "ARL_VendorCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_VendorCB, addon.Fly_Obtain, L["VENDOR_DESC"], 12, 6, 1, 0)
	ARL_VendorCBText:SetText(L["Vendor"])

	local ARL_PVPCB = CreateFrame("CheckButton", "ARL_PVPCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PVPCB, addon.Fly_Obtain, L["PVP_DESC"], 13, 7, 1, 0)
	ARL_PVPCBText:SetText(L["PVP"])

	local ARL_DiscoveryCB = CreateFrame("CheckButton", "ARL_DiscoveryCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_DiscoveryCB, addon.Fly_Obtain, L["DISCOVERY_DESC"], 14, 8, 1, 0)
	ARL_DiscoveryCBText:SetText(L["Discovery"])

	local ARL_WorldDropCB = CreateFrame("CheckButton", "ARL_WorldDropCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WorldDropCB, addon.Fly_Obtain, L["WORLD_DROP_DESC"], 39, 9, 1, 0)
	ARL_WorldDropCBText:SetText(L["World Drop"])

	local ARL_MobDropCB = CreateFrame("CheckButton", "ARL_MobDropCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_MobDropCB, addon.Fly_Obtain, L["MOB_DROP_DESC"], 40, 10, 1, 0)
	ARL_MobDropCBText:SetText(L["Mob Drop"])

	local ARL_OriginalWoWCB = CreateFrame("CheckButton", "ARL_OriginalWoWCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_OriginalWoWCB, addon.Fly_Obtain, L["ORIGINAL_WOW_DESC"], 89, 12, 1, 0)
	ARL_OriginalWoWCBText:SetText(L["Old World"])

	local ARL_BCCB = CreateFrame("CheckButton", "ARL_BCCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_BCCB, addon.Fly_Obtain, L["BC_WOW_DESC"], 90, 13, 1, 0)
	ARL_BCCBText:SetText(L["Burning Crusade"])

	local ARL_WrathCB = CreateFrame("CheckButton", "ARL_WrathCB", addon.Fly_Obtain, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCB, addon.Fly_Obtain, L["LK_WOW_DESC"], 91, 14, 1, 0)
	ARL_WrathCBText:SetText(L["Lich King"])

	addon.Fly_Binding = CreateFrame("Frame", "ARL_Fly_Binding", addon.Flyaway)
	addon.Fly_Binding:SetWidth(210)
	addon.Fly_Binding:SetHeight(280)
	addon.Fly_Binding:EnableMouse(true)
	addon.Fly_Binding:EnableKeyboard(true)
	addon.Fly_Binding:SetMovable(false)
	addon.Fly_Binding:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Binding:Hide()

	-------------------------------------------------------------------------------
	--			() Crafted Item is Bind on Equip
	--			() Crafted Item is Bind on Pickup
	--			() Recipe is Bind on Equip
	--			() Recipe is Bind on Pickup
	-------------------------------------------------------------------------------
	local ARL_iBoECB = CreateFrame("CheckButton", "ARL_iBoECB", addon.Fly_Binding, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_iBoECB, addon.Fly_Binding, L["BOE_DESC"], 15, 1, 1, 0)
	ARL_iBoECBText:SetText(L["BOEFilter"])

	local ARL_iBoPCB = CreateFrame("CheckButton", "ARL_iBoPCB", addon.Fly_Binding, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_iBoPCB, addon.Fly_Binding, L["BOP_DESC"], 16, 2, 1, 0)
	ARL_iBoPCBText:SetText(L["BOPFilter"])

	local ARL_rBoECB = CreateFrame("CheckButton", "ARL_rBoECB", addon.Fly_Binding, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_rBoECB, addon.Fly_Binding, L["RECIPE_BOE_DESC"], 17, 3, 1, 0)
	ARL_rBoECBText:SetText(L["RecipeBOEFilter"])

	local ARL_rBoPCB = CreateFrame("CheckButton", "ARL_rBoPCB", addon.Fly_Binding, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_rBoPCB, addon.Fly_Binding, L["RECIPE_BOP_DESC"], 18, 4, 1, 0)
	ARL_rBoPCBText:SetText(L["RecipeBOPFilter"])

	addon.Fly_Item = CreateFrame("Frame", "ARL_Fly_Item", addon.Flyaway)
	addon.Fly_Item:SetWidth(210)
	addon.Fly_Item:SetHeight(280)
	addon.Fly_Item:EnableMouse(true)
	addon.Fly_Item:EnableKeyboard(true)
	addon.Fly_Item:SetMovable(false)
	addon.Fly_Item:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Item:Hide()

	-------------------------------------------------------------------------------
	--			Armor:
	--				() Cloth	() Leather
	--				() Mail		() Plate
	--				() Cloak	() Necklace
	--				() Rings	() Trinkets 
	--				() Shield
	-------------------------------------------------------------------------------
	local ARL_ArmorButton = addon:GenericCreateButton("ARL_ArmorButton", addon.Fly_Item,
							  20, 60, "TOPLEFT", addon.Fly_Item, "TOPLEFT", -2, -4, "GameFontHighlight",
							  "GameFontHighlightSmall", L["Armor"], "LEFT", L["ARMOR_TEXT_DESC"], 0)
	ARL_ArmorButton:SetText(L["Armor"] .. ":")
	ARL_ArmorButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_ArmorButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_ArmorButton:SetScript("OnClick",
				  function(self, button)
					  local armordb = addon.db.profile.filters.item.armor
					  if button == "LeftButton" then
						  -- Reset all armor to true
						  armordb.cloth = true
						  armordb.leather = true
						  armordb.mail = true
						  armordb.plate = true
						  armordb.cloak = true
						  armordb.necklace = true
						  armordb.ring = true
						  armordb.trinket = true
						  armordb.shield = true
					  elseif button == "RightButton" then
						  -- Reset all armor to false
						  armordb.cloth = false
						  armordb.leather = false
						  armordb.mail = false
						  armordb.plate = false
						  armordb.cloak = false
						  armordb.necklace = false
						  armordb.ring = false
						  armordb.trinket = false
						  armordb.shield = false
					  end
					  -- Update the checkboxes with the new value
					  ARL_ArmorClothCB:SetChecked(armordb.cloth)
					  ARL_ArmorLeatherCB:SetChecked(armordb.leather)
					  ARL_ArmorMailCB:SetChecked(armordb.mail)
					  ARL_ArmorPlateCB:SetChecked(armordb.plate)
					  ARL_ArmorCloakCB:SetChecked(armordb.cloak)
					  ARL_ArmorNecklaceCB:SetChecked(armordb.necklace)
					  ARL_ArmorRingCB:SetChecked(armordb.ring)
					  ARL_ArmorTrinketCB:SetChecked(armordb.trinket)
					  ARL_ArmorShieldCB:SetChecked(armordb.shield)
					  -- Reset our title
					  addon.resetTitle()
					  -- Use new filters
					  ReDisplay()
				  end)

	local ARL_ArmorClothCB = CreateFrame("CheckButton", "ARL_ArmorClothCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorClothCB, addon.Fly_Item, L["CLOTH_DESC"], 21, 2, 1, 0)
	ARL_ArmorClothCBText:SetText(L["Cloth"])

	local ARL_ArmorLeatherCB = CreateFrame("CheckButton", "ARL_ArmorLeatherCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorLeatherCB, addon.Fly_Item, L["LEATHER_DESC"], 22, 2, 2, 0)
	ARL_ArmorLeatherCBText:SetText(L["Leather"])

	local ARL_ArmorMailCB = CreateFrame("CheckButton", "ARL_ArmorMailCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorMailCB, addon.Fly_Item, L["MAIL_DESC"], 23, 3, 1, 0)
	ARL_ArmorMailCBText:SetText(L["Mail"])

	local ARL_ArmorPlateCB = CreateFrame("CheckButton", "ARL_ArmorPlateCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorPlateCB, addon.Fly_Item, L["PLATE_DESC"], 24, 3, 2, 0)
	ARL_ArmorPlateCBText:SetText(L["Plate"])

	local ARL_ArmorCloakCB = CreateFrame("CheckButton", "ARL_ArmorCloakCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorCloakCB, addon.Fly_Item, L["CLOAK_DESC"], 64, 4, 1, 0)
	ARL_ArmorCloakCBText:SetText(L["Cloak"])

	local ARL_ArmorNecklaceCB = CreateFrame("CheckButton", "ARL_ArmorNecklaceCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorNecklaceCB, addon.Fly_Item, L["NECKLACE_DESC"], 65, 4, 2, 0)
	ARL_ArmorNecklaceCBText:SetText(L["Necklace"])

	local ARL_ArmorRingCB = CreateFrame("CheckButton", "ARL_ArmorRingCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorRingCB, addon.Fly_Item, L["RING_DESC"], 66, 5, 1, 0)
	ARL_ArmorRingCBText:SetText(L["Ring"])

	local ARL_ArmorTrinketCB = CreateFrame("CheckButton", "ARL_ArmorTrinketCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorTrinketCB, addon.Fly_Item, L["TRINKET_DESC"], 67, 5, 2, 0)
	ARL_ArmorTrinketCBText:SetText(L["Trinket"])

	local ARL_ArmorShieldCB = CreateFrame("CheckButton", "ARL_ArmorShieldCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_ArmorShieldCB, addon.Fly_Item, L["SHIELD_DESC"], 85, 6, 1, 0)
	ARL_ArmorShieldCBText:SetText(L["Shield"])

	-------------------------------------------------------------------------------
	--			Weapon:
	--				() 1H		() 2H
	--				() Dagger	() Axe
	--				() Mace		() Sword
	--				() Polearm	() Thrown
	--				() Bow		() Crossbow
	--				() Staff    () Fist
	-------------------------------------------------------------------------------
	local ARL_WeaponButton = addon:GenericCreateButton("ARL_WeaponButton", addon.Fly_Item,
							   20, 75, "TOPLEFT", addon.Fly_Item, "TOPLEFT", -2, -122, "GameFontHighlight",
							   "GameFontHighlightSmall", L["Weapon"], "LEFT", L["WEAPON_TEXT_DESC"], 0)
	ARL_WeaponButton:SetText(L["Weapon"] .. ":")
	ARL_WeaponButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_WeaponButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_WeaponButton:SetScript("OnClick",
				   function(self,button)
					   local weapondb = addon.db.profile.filters.item.weapon
					   if button == "LeftButton" then
						   -- Reset all weapon to true
						   weapondb.onehand = true
						   weapondb.twohand = true
						   weapondb.dagger = true
						   weapondb.axe = true
						   weapondb.mace = true
						   weapondb.sword = true
						   weapondb.polearm = true
						   weapondb.wand = true
						   weapondb.thrown = true
						   weapondb.ammo = true
						   weapondb.fist = true
						   weapondb.gun = true
					   elseif button == "RightButton" then
						   -- Reset all weapon to false
						   weapondb.onehand = false
						   weapondb.twohand = false
						   weapondb.dagger = false
						   weapondb.axe = false
						   weapondb.mace = false
						   weapondb.sword = false
						   weapondb.polearm = false
						   weapondb.wand = false
						   weapondb.thrown = false
						   weapondb.ammo = false
						   weapondb.fist = false
						   weapondb.gun = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_Weapon1HCB:SetChecked(weapondb.onehand)
					   ARL_Weapon2HCB:SetChecked(weapondb.twohand)
					   ARL_WeaponDaggerCB:SetChecked(weapondb.dagger)
					   ARL_WeaponAxeCB:SetChecked(weapondb.axe)
					   ARL_WeaponMaceCB:SetChecked(weapondb.mace)
					   ARL_WeaponSwordCB:SetChecked(weapondb.sword)
					   ARL_WeaponPolearmCB:SetChecked(weapondb.polearm)
					   ARL_WeaponWandCB:SetChecked(weapondb.wand)
					   ARL_WeaponThrownCB:SetChecked(weapondb.thrown)
					   ARL_WeaponAmmoCB:SetChecked(weapondb.ammo)
					   ARL_WeaponFistCB:SetChecked(weapondb.fist)
					   ARL_WeaponGunCB:SetChecked(weapondb.gun)
					   -- Reset our title
					   addon.resetTitle()
					   -- Use new filters
					   ReDisplay()
				   end)

	local ARL_Weapon1HCB = CreateFrame("CheckButton", "ARL_Weapon1HCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_Weapon1HCB, addon.Fly_Item, L["ONEHAND_DESC"], 27, 9, 1, 0)
	ARL_Weapon1HCBText:SetText(L["One Hand"])

	local ARL_Weapon2HCB = CreateFrame("CheckButton", "ARL_Weapon2HCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_Weapon2HCB, addon.Fly_Item, L["TWOHAND_DESC"], 28, 9, 2, 0)
	ARL_Weapon2HCBText:SetText(L["Two Hand"])

	local ARL_WeaponDaggerCB = CreateFrame("CheckButton", "ARL_WeaponDaggerCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponDaggerCB, addon.Fly_Item, L["DAGGER_DESC"], 29, 10, 1, 0)
	ARL_WeaponDaggerCBText:SetText(L["Dagger"])

	local ARL_WeaponAxeCB = CreateFrame("CheckButton", "ARL_WeaponAxeCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponAxeCB, addon.Fly_Item, L["AXE_DESC"], 30, 10, 2, 0)
	ARL_WeaponAxeCBText:SetText(L["Axe"])

	local ARL_WeaponMaceCB = CreateFrame("CheckButton", "ARL_WeaponMaceCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponMaceCB, addon.Fly_Item, L["MACE_DESC"], 31, 11, 1, 0)
	ARL_WeaponMaceCBText:SetText(L["Mace"])

	local ARL_WeaponSwordCB = CreateFrame("CheckButton", "ARL_WeaponSwordCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponSwordCB, addon.Fly_Item, L["SWORD_DESC"], 32, 11, 2, 0)
	ARL_WeaponSwordCBText:SetText(L["Sword"])

	local ARL_WeaponPolearmCB = CreateFrame("CheckButton", "ARL_WeaponPolearmCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponPolearmCB, addon.Fly_Item, L["POLEARM_DESC"], 33, 12, 1, 0)
	ARL_WeaponPolearmCBText:SetText(L["Polearm"])

	local ARL_WeaponFistCB = CreateFrame("CheckButton", "ARL_WeaponFistCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponFistCB, addon.Fly_Item, L["FIST_DESC"], 84, 12, 2, 0)
	ARL_WeaponFistCBText:SetText(L["Fist"])

	local ARL_WeaponStaffCB = CreateFrame("CheckButton", "ARL_WeaponStaffCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponStaffCB, addon.Fly_Item, L["STAFF_DESC"], 34, 13, 1, 0)
	ARL_WeaponStaffCBText:SetText(L["Staff"])
	ARL_WeaponStaffCBText:SetText(addon:Grey(L["Staff"]))
	ARL_WeaponStaffCB:Disable()

	local ARL_WeaponWandCB = CreateFrame("CheckButton", "ARL_WeaponWandCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponWandCB, addon.Fly_Item, L["WAND_DESC"], 68, 13, 2, 0)
	ARL_WeaponWandCBText:SetText(L["Wand"])

	local ARL_WeaponThrownCB = CreateFrame("CheckButton", "ARL_WeaponThrownCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponThrownCB, addon.Fly_Item, L["THROWN_DESC"], 35, 14, 1, 0)
	ARL_WeaponThrownCBText:SetText(L["Thrown"])

	local ARL_WeaponBowCB = CreateFrame("CheckButton", "ARL_WeaponBowCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponBowCB, addon.Fly_Item, L["BOW_DESC"], 36, 14, 2, 0)
	ARL_WeaponBowCBText:SetText(L["Bow"])
	ARL_WeaponBowCBText:SetText(addon:Grey(L["Bow"]))
	ARL_WeaponBowCB:Disable()

	local ARL_WeaponCrossbowCB = CreateFrame("CheckButton", "ARL_WeaponCrossbowCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponCrossbowCB, addon.Fly_Item, L["CROSSBOW_DESC"], 37, 15, 1, 0)
	ARL_WeaponCrossbowCBText:SetText(L["Crossbow"])
	ARL_WeaponCrossbowCBText:SetText(addon:Grey(L["Crossbow"]))
	ARL_WeaponCrossbowCB:Disable()

	local ARL_WeaponAmmoCB = CreateFrame("CheckButton", "ARL_WeaponAmmoCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponAmmoCB, addon.Fly_Item, L["AMMO_DESC"], 38, 15, 2, 0)
	ARL_WeaponAmmoCBText:SetText(L["Ammo"])

	local ARL_WeaponGunCB = CreateFrame("CheckButton", "ARL_WeaponGunCB", addon.Fly_Item, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WeaponGunCB, addon.Fly_Item, L["GUN_DESC"], 92, 16, 1, 0)
	ARL_WeaponGunCBText:SetText(L["Gun"])

	addon.Fly_Player = CreateFrame("Frame", "ARL_Fly_Player", addon.Flyaway)
	addon.Fly_Player:SetWidth(112)
	addon.Fly_Player:SetHeight(280)
	addon.Fly_Player:EnableMouse(true)
	addon.Fly_Player:EnableKeyboard(true)
	addon.Fly_Player:SetMovable(false)
	addon.Fly_Player:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Player:Hide()

	local ARL_PlayerTankCB = CreateFrame("CheckButton", "ARL_PlayerTankCB", addon.Fly_Player, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PlayerTankCB, addon.Fly_Player, L["TANKS_DESC"], 41, 1, 1, 0)
	ARL_PlayerTankCBText:SetText(L["Tanks"])

	local ARL_PlayerMeleeCB = CreateFrame("CheckButton", "ARL_PlayerMeleeCB", addon.Fly_Player, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PlayerMeleeCB, addon.Fly_Player, L["MELEE_DPS_DESC"], 42, 2, 1, 0)
	ARL_PlayerMeleeCBText:SetText(L["Melee DPS"])

	local ARL_PlayerHealerCB = CreateFrame("CheckButton", "ARL_PlayerHealerCB", addon.Fly_Player, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PlayerHealerCB, addon.Fly_Player, L["HEALERS_DESC"], 43, 3, 1, 0)
	ARL_PlayerHealerCBText:SetText(L["Healers"])

	local ARL_PlayerCasterCB = CreateFrame("CheckButton", "ARL_PlayerCasterCB", addon.Fly_Player, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_PlayerCasterCB, addon.Fly_Player, L["CASTER_DPS_DESC"], 44, 4, 1, 0)
	ARL_PlayerCasterCBText:SetText(L["Caster DPS"])

	addon.Fly_Rep = CreateFrame("Frame", "ARL_Fly_Rep", addon.Flyaway)
	addon.Fly_Rep:SetWidth(112)
	addon.Fly_Rep:SetHeight(280)
	addon.Fly_Rep:EnableMouse(true)
	addon.Fly_Rep:EnableKeyboard(true)
	addon.Fly_Rep:SetMovable(false)
	addon.Fly_Rep:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Rep:Hide()

	ARL_RepOldWorldCB = addon:CreateExpCB("ARL_RepOldWorldCB", "Glues-WoW-Logo", 1)
	ARL_RepOldWorldCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -10)
	ARL_RepOldWorldCB:SetScript("OnClick", function() addon.RepFilterSwitch(1) end)

	ARL_RepBCCB = addon:CreateExpCB("ARL_RepBCCB", "GLUES-WOW-BCLOGO", 1)
	ARL_RepBCCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -60)
	ARL_RepBCCB:SetScript("OnClick", function() addon.RepFilterSwitch(2) end)

	ARL_RepLKCB = addon:CreateExpCB("ARL_RepLKCB", "wotlk_logo", 1)
	ARL_RepLKCB:SetPoint("TOPLEFT", addon.Fly_Rep, "TOPLEFT", 0, -110)
	ARL_RepLKCB:SetScript("OnClick", function() addon.RepFilterSwitch(3) end)

	-------------------------------------------------------------------------------
	-- Original Reputations
	-------------------------------------------------------------------------------
	addon.Fly_Rep_OW = CreateFrame("Frame", "ARL_Fly_Rep_OW", addon.Fly_Rep)
	addon.Fly_Rep_OW:SetWidth(150)
	addon.Fly_Rep_OW:SetHeight(280)
	addon.Fly_Rep_OW:EnableMouse(true)
	addon.Fly_Rep_OW:EnableKeyboard(true)
	addon.Fly_Rep_OW:SetMovable(false)
	addon.Fly_Rep_OW:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
	addon.Fly_Rep_OW:Hide()

	local ARL_Rep_OWButton = addon:GenericCreateButton("ARL_Rep_OWButton", addon.Fly_Rep_OW,
							   20, 85, "TOPLEFT", addon.Fly_Rep_OW, "TOPLEFT", -2, -4, "GameFontHighlight",
							   "GameFontHighlightSmall", L["Reputation"], "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_OWButton:SetText(L["Reputation"] .. ":")
	ARL_Rep_OWButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_OWButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_OWButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Reset all armor to true
						   filterdb.argentdawn = true
						   filterdb.cenarioncircle = true
						   filterdb.thoriumbrotherhood = true
						   filterdb.timbermaw = true
						   filterdb.zandalar = true
					   elseif button == "RightButton" then
						   -- Reset all armor to false
						   filterdb.argentdawn = false
						   filterdb.cenarioncircle = false
						   filterdb.thoriumbrotherhood = false
						   filterdb.timbermaw = false
						   filterdb.zandalar = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepArgentDawnCB:SetChecked(filterdb.argentdawn)
					   ARL_RepCenarionCircleCB:SetChecked(filterdb.cenarioncircle)
					   ARL_RepThoriumCB:SetChecked(filterdb.thoriumbrotherhood)
					   ARL_RepTimbermawCB:SetChecked(filterdb.timbermaw)
					   ARL_RepZandalarCB:SetChecked(filterdb.zandalar)
					   -- Reset our title
					   addon.resetTitle()
					   -- Use new filters
					   ReDisplay()
				   end)

	local ARL_RepArgentDawnCB = CreateFrame("CheckButton", "ARL_RepArgentDawnCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepArgentDawnCB, addon.Fly_Rep_OW,sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Dawn"]), 45, 2, 1, 0)
	ARL_RepArgentDawnCBText:SetText(BFAC["Argent Dawn"])
	ARL_RepArgentDawnCBText:SetFont(narrowFont, 11)

	local ARL_RepCenarionCircleCB = CreateFrame("CheckButton", "ARL_RepCenarionCircleCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepCenarionCircleCB, addon.Fly_Rep_OW,sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Circle"]), 46, 3, 1, 0)
	ARL_RepCenarionCircleCBText:SetText(BFAC["Cenarion Circle"])
	ARL_RepCenarionCircleCBText:SetFont(narrowFont, 11)

	local ARL_RepThoriumCB = CreateFrame("CheckButton", "ARL_RepThoriumCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepThoriumCB, addon.Fly_Rep_OW,sformat(L["SPECIFIC_REP_DESC"], BFAC["Thorium Brotherhood"]), 47, 4, 1, 0)
	ARL_RepThoriumCBText:SetText(BFAC["Thorium Brotherhood"])
	ARL_RepThoriumCBText:SetFont(narrowFont, 11)

	local ARL_RepTimbermawCB = CreateFrame("CheckButton", "ARL_RepTimbermawCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepTimbermawCB, addon.Fly_Rep_OW,sformat(L["SPECIFIC_REP_DESC"], BFAC["Timbermaw Hold"]), 48, 5, 1, 0)
	ARL_RepTimbermawCBText:SetText(BFAC["Timbermaw Hold"])
	ARL_RepTimbermawCBText:SetFont(narrowFont, 11)

	local ARL_RepZandalarCB = CreateFrame("CheckButton", "ARL_RepZandalarCB", addon.Fly_Rep_OW, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepZandalarCB, addon.Fly_Rep_OW,sformat(L["SPECIFIC_REP_DESC"], BFAC["Zandalar Tribe"]), 49, 6, 1, 0)
	ARL_RepZandalarCBText:SetText(BFAC["Zandalar Tribe"])
	ARL_RepZandalarCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- The Burning Crusade Reputations
	-------------------------------------------------------------------------------
	addon.Fly_Rep_BC = CreateFrame("Frame", "ARL_Fly_Rep_BC", addon.Fly_Rep)
	addon.Fly_Rep_BC:SetWidth(150)
	addon.Fly_Rep_BC:SetHeight(280)
	addon.Fly_Rep_BC:EnableMouse(true)
	addon.Fly_Rep_BC:EnableKeyboard(true)
	addon.Fly_Rep_BC:SetMovable(false)
	addon.Fly_Rep_BC:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
	addon.Fly_Rep_BC:Hide()

	local ARL_Rep_BCButton = addon:GenericCreateButton("ARL_Rep_OWButton", addon.Fly_Rep_BC,
							   20, 85, "TOPLEFT", addon.Fly_Rep_BC, "TOPLEFT", -2, -4, "GameFontHighlight",
							   "GameFontHighlightSmall", L["Reputation"], "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_BCButton:SetText(L["Reputation"] .. ":")
	ARL_Rep_BCButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_BCButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_BCButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Reset all armor to true
						   filterdb.aldor = true
						   filterdb.ashtonguedeathsworn = true
						   filterdb.cenarionexpedition = true
						   filterdb.consortium = true
						   filterdb.hellfire = true
						   filterdb.keepersoftime = true
						   filterdb.nagrand = true
						   filterdb.lowercity = true
						   filterdb.scaleofthesands = true
						   filterdb.scryer = true
						   filterdb.shatar = true
						   filterdb.shatteredsun = true
						   filterdb.sporeggar = true
						   filterdb.violeteye = true
					   elseif button == "RightButton" then
						   -- Reset all armor to false
						   filterdb.aldor = false
						   filterdb.ashtonguedeathsworn = false
						   filterdb.cenarionexpedition = false
						   filterdb.consortium = false
						   filterdb.hellfire = false
						   filterdb.keepersoftime = false
						   filterdb.nagrand = false
						   filterdb.lowercity = false
						   filterdb.scaleofthesands = false
						   filterdb.scryer = false
						   filterdb.shatar = false
						   filterdb.shatteredsun = false
						   filterdb.sporeggar = false
						   filterdb.violeteye = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepAldorCB:SetChecked(filterdb.aldor)
					   ARL_RepAshtongueCB:SetChecked(filterdb.ashtonguedeathsworn)
					   ARL_RepCenarionExpeditionCB:SetChecked(filterdb.cenarionexpedition)
					   ARL_RepConsortiumCB:SetChecked(filterdb.consortium)
					   ARL_RepHonorHoldCB:SetChecked(filterdb.hellfire)
					   ARL_RepKeepersOfTimeCB:SetChecked(filterdb.keepersoftime)
					   ARL_RepKurenaiCB:SetChecked(filterdb.nagrand)
					   ARL_RepLowerCityCB:SetChecked(filterdb.lowercity)
					   ARL_RepScaleSandsCB:SetChecked(filterdb.scaleofthesands)
					   ARL_RepScryersCB:SetChecked(filterdb.scryer)
					   ARL_RepShatarCB:SetChecked(filterdb.shatar)
					   ARL_RepShatteredSunCB:SetChecked(filterdb.shatteredsun)
					   ARL_RepSporeggarCB:SetChecked(filterdb.sporeggar)
					   ARL_RepVioletEyeCB:SetChecked(filterdb.violeteye)
					   -- Reset our title
					   addon.resetTitle()
					   -- Use new filters
					   ReDisplay()
				   end)

	local ARL_RepAldorCB = CreateFrame("CheckButton", "ARL_RepAldorCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepAldorCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Aldor"]), 50, 2, 1, 0)
	ARL_RepAldorCBText:SetText(BFAC["The Aldor"])
	ARL_RepAldorCBText:SetFont(narrowFont, 11)

	local ARL_RepAshtongueCB = CreateFrame("CheckButton", "ARL_RepAshtongueCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepAshtongueCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Ashtongue Deathsworn"]), 51, 3, 1, 0)
	ARL_RepAshtongueCBText:SetText(BFAC["Ashtongue Deathsworn"])
	ARL_RepAshtongueCBText:SetFont(narrowFont, 11)

	local ARL_RepCenarionExpeditionCB = CreateFrame("CheckButton", "ARL_RepCenarionExpeditionCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepCenarionExpeditionCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Cenarion Expedition"]), 52, 4, 1, 0)
	ARL_RepCenarionExpeditionCBText:SetText(BFAC["Cenarion Expedition"])
	ARL_RepCenarionExpeditionCBText:SetFont(narrowFont, 11)

	local ARL_RepConsortiumCB = CreateFrame("CheckButton", "ARL_RepConsortiumCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepConsortiumCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Consortium"]), 53, 5, 1, 0)
	ARL_RepConsortiumCBText:SetText(BFAC["The Consortium"])
	ARL_RepConsortiumCBText:SetFont(narrowFont, 11)

	local ARL_RepHonorHoldCB = CreateFrame("CheckButton", "ARL_RepHonorHoldCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepHonorHoldCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], HonorHold_Thrallmar_FactionText), 54, 6, 1, 0)
	ARL_RepHonorHoldCBText:SetText(HonorHold_Thrallmar_FactionText)
	ARL_RepHonorHoldCBText:SetFont(narrowFont, 11)

	local ARL_RepKeepersOfTimeCB = CreateFrame("CheckButton", "ARL_RepKeepersOfTimeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepKeepersOfTimeCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Keepers of Time"]), 55, 7, 1, 0)
	ARL_RepKeepersOfTimeCBText:SetText(BFAC["Keepers of Time"])
	ARL_RepKeepersOfTimeCBText:SetFont(narrowFont, 11)

	local ARL_RepKurenaiCB = CreateFrame("CheckButton", "ARL_RepKurenaiCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepKurenaiCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], Kurenai_Maghar_FactionText), 56, 8, 1, 0)
	ARL_RepKurenaiCBText:SetText(Kurenai_Maghar_FactionText)
	ARL_RepKurenaiCBText:SetFont(narrowFont, 11)

	local ARL_RepLowerCityCB = CreateFrame("CheckButton", "ARL_RepLowerCityCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepLowerCityCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Lower City"]), 57, 9, 1, 0)
	ARL_RepLowerCityCBText:SetText(BFAC["Lower City"])
	ARL_RepLowerCityCBText:SetFont(narrowFont, 11)

	local ARL_RepScaleSandsCB = CreateFrame("CheckButton", "ARL_RepScaleSandsCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepScaleSandsCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scale of the Sands"]), 58, 10, 1, 0)
	ARL_RepScaleSandsCBText:SetText(BFAC["The Scale of the Sands"])
	ARL_RepScaleSandsCBText:SetFont(narrowFont, 11)

	local ARL_RepScryersCB = CreateFrame("CheckButton", "ARL_RepScryersCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepScryersCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Scryers"]), 59, 11, 1, 0)
	ARL_RepScryersCBText:SetText(BFAC["The Scryers"])
	ARL_RepScryersCBText:SetFont(narrowFont, 11)

	local ARL_RepShatarCB = CreateFrame("CheckButton", "ARL_RepShatarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepShatarCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sha'tar"]), 60, 12, 1, 0)
	ARL_RepShatarCBText:SetText(BFAC["The Sha'tar"])
	ARL_RepShatarCBText:SetFont(narrowFont, 11)

	local ARL_RepShatteredSunCB = CreateFrame("CheckButton", "ARL_RepShatteredSunCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepShatteredSunCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Shattered Sun Offensive"]), 61, 13, 1, 0)
	ARL_RepShatteredSunCBText:SetText(BFAC["Shattered Sun Offensive"])
	ARL_RepShatteredSunCBText:SetFont(narrowFont, 11)

	local ARL_RepSporeggarCB = CreateFrame("CheckButton", "ARL_RepSporeggarCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepSporeggarCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["Sporeggar"]), 62, 14, 1, 0)
	ARL_RepSporeggarCBText:SetText(BFAC["Sporeggar"])
	ARL_RepSporeggarCBText:SetFont(narrowFont, 11)

	local ARL_RepVioletEyeCB = CreateFrame("CheckButton", "ARL_RepVioletEyeCB", addon.Fly_Rep_BC, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepVioletEyeCB, addon.Fly_Rep_BC,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Violet Eye"]), 63, 15, 1, 0)
	ARL_RepVioletEyeCBText:SetText(BFAC["The Violet Eye"])
	ARL_RepVioletEyeCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- Wrath of the Lich King Reputations
	-------------------------------------------------------------------------------
	addon.Fly_Rep_LK= CreateFrame("Frame", "ARL_Fly_Rep_LK", addon.Fly_Rep)
	addon.Fly_Rep_LK:SetWidth(150)
	addon.Fly_Rep_LK:SetHeight(280)
	addon.Fly_Rep_LK:EnableMouse(true)
	addon.Fly_Rep_LK:EnableKeyboard(true)
	addon.Fly_Rep_LK:SetMovable(false)
	addon.Fly_Rep_LK:SetPoint("TOPRIGHT", addon.Flyaway, "TOPRIGHT", -7, -16)
	addon.Fly_Rep_LK:Hide()

	local ARL_Rep_LKButton = addon:GenericCreateButton("ARL_Rep_OWButton", addon.Fly_Rep_LK,
							   20, 85, "TOPLEFT", addon.Fly_Rep_LK, "TOPLEFT", -2, -4, "GameFontHighlight",
							   "GameFontHighlightSmall", L["Reputation"], "LEFT", L["REP_TEXT_DESC"], 0)
	ARL_Rep_LKButton:SetText(L["Reputation"] .. ":")
	ARL_Rep_LKButton:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
	ARL_Rep_LKButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	ARL_Rep_LKButton:SetScript("OnClick",
				   function(self,button)
					   local filterdb = addon.db.profile.filters.rep
					   if button == "LeftButton" then
						   -- Reset all armor to true
						   filterdb.argentcrusade = true
						   filterdb.frenzyheart = true
						   filterdb.ebonblade = true
						   filterdb.kirintor = true
						   filterdb.sonsofhodir = true
						   filterdb.kaluak = true
						   filterdb.oracles = true
						   filterdb.wyrmrest = true
						   filterdb.wrathcommon1 = true
					   elseif button == "RightButton" then
						   -- Reset all armor to false
						   filterdb.argentcrusade = false
						   filterdb.frenzyheart = false
						   filterdb.ebonblade = false
						   filterdb.kirintor = false
						   filterdb.sonsofhodir = false
						   filterdb.kaluak = false
						   filterdb.oracles = false
						   filterdb.wyrmrest = false
						   filterdb.wrathcommon1 = false
					   end
					   -- Update the checkboxes with the new value
					   ARL_RepArgentCrusadeCB:SetChecked(filterdb.argentcrusade)
					   ARL_RepFrenzyheartCB:SetChecked(filterdb.frenzyheart)
					   ARL_RepEbonBladeCB:SetChecked(filterdb.ebonblade)
					   ARL_RepKirinTorCB:SetChecked(filterdb.kirintor)
					   ARL_RepSonsOfHodirCB:SetChecked(filterdb.sonsofhodir)
					   ARL_RepKaluakCB:SetChecked(filterdb.kaluak)
					   ARL_RepOraclesCB:SetChecked(filterdb.oracles)
					   ARL_RepWyrmrestCB:SetChecked(filterdb.wyrmrest)
					   ARL_WrathCommon1CB:SetChecked(filterdb.wrathcommon1)
					   -- Reset our title
					   addon.resetTitle()
					   -- Use new filters
					   ReDisplay()
				   end)

	local ARL_WrathCommon1CB = CreateFrame("CheckButton", "ARL_WrathCommon1CB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCommon1CB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"],  Vanguard_Expedition_FactionText), 86, 2, 1, 0)
	ARL_WrathCommon1CBText:SetText(Vanguard_Expedition_FactionText)
	ARL_WrathCommon1CBText:SetFont(narrowFont, 11)

	local ARL_RepArgentCrusadeCB = CreateFrame("CheckButton", "ARL_RepArgentCrusadeCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepArgentCrusadeCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["Argent Crusade"]), 69, 3, 1, 0)
	ARL_RepArgentCrusadeCBText:SetText(BFAC["Argent Crusade"])
	ARL_RepArgentCrusadeCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon5CB = CreateFrame("CheckButton", "ARL_WrathCommon5CB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCommon5CB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], Explorer_Hand_FactionText), 79, 4, 1, 0)
	ARL_WrathCommon5CBText:SetText(Explorer_Hand_FactionText)
	ARL_WrathCommon5CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon5CBText:SetText(addon:Grey(Explorer_Hand_FactionText))
	ARL_WrathCommon5CB:Disable()

	local ARL_RepFrenzyheartCB = CreateFrame("CheckButton", "ARL_RepFrenzyheartCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepFrenzyheartCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["Frenzyheart Tribe"]), 70, 5, 1, 0)
	ARL_RepFrenzyheartCBText:SetText(BFAC["Frenzyheart Tribe"])
	ARL_RepFrenzyheartCBText:SetFont(narrowFont, 11)

	local ARL_RepKaluakCB = CreateFrame("CheckButton", "ARL_RepKaluakCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepKaluakCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Kalu'ak"]), 74, 6, 1, 0)
	ARL_RepKaluakCBText:SetText(BFAC["The Kalu'ak"])
	ARL_RepKaluakCBText:SetFont(narrowFont, 11)

	local ARL_RepKirinTorCB = CreateFrame("CheckButton", "ARL_RepKirinTorCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepKirinTorCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["Kirin Tor"]), 72, 7, 1, 0)
	ARL_RepKirinTorCBText:SetText(BFAC["Kirin Tor"])
	ARL_RepKirinTorCBText:SetFont(narrowFont, 11)

	local ARL_RepEbonBladeCB = CreateFrame("CheckButton", "ARL_RepEbonBladeCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepEbonBladeCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["Knights of the Ebon Blade"]), 71, 8, 1, 0)
	ARL_RepEbonBladeCBText:SetText(BFAC["Knights of the Ebon Blade"])
	ARL_RepEbonBladeCBText:SetFont(narrowFont, 11)

	local ARL_RepOraclesCB = CreateFrame("CheckButton", "ARL_RepOraclesCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepOraclesCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Oracles"]), 75, 9, 1, 0)
	ARL_RepOraclesCBText:SetText(BFAC["The Oracles"])
	ARL_RepOraclesCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon2CB = CreateFrame("CheckButton", "ARL_WrathCommon2CB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCommon2CB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], SilverConv_Sunreaver_FactionText), 77, 10, 1, 0)
	ARL_WrathCommon2CBText:SetText(SilverConv_Sunreaver_FactionText)
	ARL_WrathCommon2CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon2CBText:SetText(addon:Grey(SilverConv_Sunreaver_FactionText))
	ARL_WrathCommon2CB:Disable()

	local ARL_RepSonsOfHodirCB = CreateFrame("CheckButton", "ARL_RepSonsOfHodirCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepSonsOfHodirCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Sons of Hodir"]), 73, 11, 1, 0)
	ARL_RepSonsOfHodirCBText:SetText(BFAC["The Sons of Hodir"])
	ARL_RepSonsOfHodirCBText:SetFont(narrowFont, 11)

	local ARL_WrathCommon4CB = CreateFrame("CheckButton", "ARL_WrathCommon4CB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCommon4CB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], Frostborn_Taunka_FactionText), 82, 12, 1, 0)
	ARL_WrathCommon4CBText:SetText(Frostborn_Taunka_FactionText)
	ARL_WrathCommon4CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon4CBText:SetText(addon:Grey(Frostborn_Taunka_FactionText))
	ARL_WrathCommon4CB:Disable()

	local ARL_WrathCommon3CB = CreateFrame("CheckButton", "ARL_WrathCommon3CB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_WrathCommon3CB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], Valiance_Warsong_FactionText), 80, 13, 1, 0)
	ARL_WrathCommon3CBText:SetText(Valiance_Warsong_FactionText)
	ARL_WrathCommon3CBText:SetFont(narrowFont, 11)
	ARL_WrathCommon3CBText:SetText(addon:Grey(Valiance_Warsong_FactionText))
	ARL_WrathCommon3CB:Disable()

	local ARL_RepWyrmrestCB = CreateFrame("CheckButton", "ARL_RepWyrmrestCB", addon.Fly_Rep_LK, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_RepWyrmrestCB, addon.Fly_Rep_LK,sformat(L["SPECIFIC_REP_DESC"], BFAC["The Wyrmrest Accord"]), 76, 14, 1, 0)
	ARL_RepWyrmrestCBText:SetText(BFAC["The Wyrmrest Accord"])
	ARL_RepWyrmrestCBText:SetFont(narrowFont, 11)

	-------------------------------------------------------------------------------
	-- Miscellaneous Flyaway Frame
	-------------------------------------------------------------------------------
	addon.Fly_Misc = CreateFrame("Frame", "ARL_Fly_Misc", addon.Flyaway)
	addon.Fly_Misc:SetWidth(210)
	addon.Fly_Misc:SetHeight(280)
	addon.Fly_Misc:EnableMouse(true)
	addon.Fly_Misc:EnableKeyboard(true)
	addon.Fly_Misc:SetMovable(false)
	addon.Fly_Misc:SetPoint("TOPLEFT", addon.Flyaway, "TOPLEFT", 17, -16)
	addon.Fly_Misc:Hide()

	local ARL_MiscText = addon.Fly_Misc:CreateFontString("ARL_MiscText", "OVERLAY", "GameFontHighlight")
	ARL_MiscText:SetText(L["Miscellaneous"] .. ":")
	ARL_MiscText:SetPoint("TOPLEFT", addon.Fly_Misc, "TOPLEFT", 5, -8)
	ARL_MiscText:SetHeight(14)
	ARL_MiscText:SetWidth(150)
	ARL_MiscText:SetJustifyH("LEFT")

	local ARL_IgnoreCB = CreateFrame("CheckButton", "ARL_IgnoreCB", addon.Fly_Misc, "UICheckButtonTemplate")
	addon:GenericMakeCB(ARL_IgnoreCB, addon.Fly_Misc, L["DISPLAY_EXCLUSION_DESC"], 0, 2, 1, 1)
	ARL_IgnoreCBText:SetText(L["Display Exclusions"])

	local ARL_MiscAltText = addon.Fly_Misc:CreateFontString("ARL_MiscAltBtn", "OVERLAY", "GameFontNormal")
	ARL_MiscAltText:SetText(L["Alt-Tradeskills"] .. ":")
	ARL_MiscAltText:SetPoint("TOPLEFT", ARL_IgnoreCB, "BOTTOMLEFT", 4, 0)
	ARL_MiscAltText:SetHeight(14)
	ARL_MiscAltText:SetWidth(95)
	ARL_MiscAltText:SetJustifyH("LEFT")

	local ARL_MiscAltBtn = CreateFrame("Button", "ARL_IgnoreCB", addon.Fly_Misc)
	ARL_MiscAltBtn:SetPoint("LEFT", ARL_MiscAltText, "RIGHT")
	ARL_MiscAltBtn:SetHeight(22)
	ARL_MiscAltBtn:SetWidth(22)
	ARL_MiscAltBtn:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
	ARL_MiscAltBtn:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Down")
	ARL_MiscAltBtn:SetDisabledTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Disabled")
	ARL_MiscAltBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
	addon:TooltipDisplay(ARL_MiscAltBtn, L["ALT_TRADESKILL_DESC"], 1)
	ARL_MiscAltBtn:RegisterForClicks("LeftButtonUp")
	ARL_MiscAltBtn:SetScript("OnClick",
				 function(this, button)
					 if clicktip then
						 if not click_info.modified then
							 clicktip = QTip:Release(clicktip)
							 twipe(click_info)
						 else
							 twipe(click_info)
							 GenerateClickableTT(this)
						 end
					 else
						 clicktip = QTip:Acquire("ARL_Clickable", 1, "CENTER")
						 twipe(click_info)
						 if TipTac and TipTac.AddModifiedTip then
							 TipTac:AddModifiedTip(clicktip, true)
						 end
						 GenerateClickableTT(this)
					 end
				 end)
	ARL_MiscAltBtn:SetScript("OnHide",
				 function(this, button)
					 clicktip = QTip:Release(clicktip)
					 twipe(click_info)
				 end)

	-------------------------------------------------------------------------------
	-- Now that everything exists, populate the global filter table
	-------------------------------------------------------------------------------
	local filterdb = addon.db.profile.filters

	FilterValueMap = {
		------------------------------------------------------------------------------------------------------------------------------
		-- General Options
		------------------------------------------------------------------------------------------------------------------------------
		[2]  = { cb = ARL_SpecialtyCB,				svroot = filterdb.general,		svval = "specialty" },
		[3]  = { cb = ARL_LevelCB,				svroot = filterdb.general,		svval = "skill" },
		[4]  = { cb = ARL_FactionCB,				svroot = filterdb.general,		svval = "faction" },
		[5]  = { cb = ARL_KnownCB,				svroot = filterdb.general,		svval = "known" },
		[6]  = { cb = ARL_UnknownCB,				svroot = filterdb.general,		svval = "unknown" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Classes
		------------------------------------------------------------------------------------------------------------------------------
		[87] = { cb = ARL_DeathKnightCB,			svroot = filterdb.classes,		svval = "deathknight" },
		[88] = { cb = ARL_DruidCB,				svroot = filterdb.classes,		svval = "druid" },
		[19] = { cb = ARL_HunterCB,				svroot = filterdb.classes,		svval = "hunter" },
		[20] = { cb = ARL_MageCB,				svroot = filterdb.classes,		svval = "mage" },
		[25] = { cb = ARL_PaladinCB,				svroot = filterdb.classes,		svval = "paladin" },
		[26] = { cb = ARL_PriestCB,				svroot = filterdb.classes,		svval = "priest" },
		[81] = { cb = ARL_RogueCB,				svroot = filterdb.classes,		svval = "rogue" },
		[83] = { cb = ARL_ShamanCB,				svroot = filterdb.classes,		svval = "shaman" },
		[78] = { cb = ARL_WarlockCB,				svroot = filterdb.classes,		svval = "warlock" },
		[1]  = { cb = ARL_WarriorCB,				svroot = filterdb.classes,		svval = "warrior" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Obtain Options
		------------------------------------------------------------------------------------------------------------------------------
		[7]  = { cb = ARL_InstanceCB,				svroot = filterdb.obtain,		svval = "instance" },
		[8]  = { cb = ARL_RaidCB,				svroot = filterdb.obtain,		svval = "raid" },
		[9]  = { cb = ARL_QuestCB,				svroot = filterdb.obtain,		svval = "quest" },
		[10] = { cb = ARL_SeasonalCB,				svroot = filterdb.obtain,		svval = "seasonal" },
		[11] = { cb = ARL_TrainerCB,				svroot = filterdb.obtain,		svval = "trainer" },
		[12] = { cb = ARL_VendorCB,				svroot = filterdb.obtain,		svval = "vendor" },
		[13] = { cb = ARL_PVPCB,				svroot = filterdb.obtain,		svval = "pvp" },
		[14] = { cb = ARL_DiscoveryCB,				svroot = filterdb.obtain,		svval = "discovery" },
		[39] = { cb = ARL_WorldDropCB,				svroot = filterdb.obtain,		svval = "worlddrop" },
		[40] = { cb = ARL_MobDropCB,				svroot = filterdb.obtain,		svval = "mobdrop" },
		[89]  = { cb = ARL_OriginalWoWCB,			svroot = filterdb.obtain,		svval = "originalwow" },
		[90]  = { cb = ARL_BCCB,				svroot = filterdb.obtain,		svval = "bc" },
		[91]  = { cb = ARL_WrathCB,				svroot = filterdb.obtain,		svval = "wrath" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Binding Options
		------------------------------------------------------------------------------------------------------------------------------
		[15] = { cb = ARL_iBoECB,				svroot = filterdb.binding,		svval = "itemboe" },
		[16] = { cb = ARL_iBoPCB,				svroot = filterdb.binding,		svval = "itembop" },
		[17] = { cb = ARL_rBoECB,				svroot = filterdb.binding,		svval = "recipeboe" },
		[18] = { cb = ARL_rBoPCB,				svroot = filterdb.binding,		svval = "recipebop" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Armor Options
		------------------------------------------------------------------------------------------------------------------------------
		[21] = { cb = ARL_ArmorClothCB,				svroot = filterdb.item.armor,		svval = "cloth" },
		[22] = { cb = ARL_ArmorLeatherCB,			svroot = filterdb.item.armor,		svval = "leather" },
		[23] = { cb = ARL_ArmorMailCB,				svroot = filterdb.item.armor,		svval = "mail" },
		[24] = { cb = ARL_ArmorPlateCB,				svroot = filterdb.item.armor,		svval = "plate" },
		[64] = { cb = ARL_ArmorCloakCB,				svroot = filterdb.item.armor,		svval = "cloak" },
		[65] = { cb = ARL_ArmorNecklaceCB,			svroot = filterdb.item.armor,		svval = "necklace" },
		[66] = { cb = ARL_ArmorRingCB,				svroot = filterdb.item.armor,		svval = "ring" },
		[67] = { cb = ARL_ArmorTrinketCB,			svroot = filterdb.item.armor,		svval = "trinket" },
		[85] = { cb = ARL_ArmorShieldCB,			svroot = filterdb.item.armor,		svval = "shield" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Weapon Options
		------------------------------------------------------------------------------------------------------------------------------
		[27] = { cb = ARL_Weapon1HCB,				svroot = filterdb.item.weapon,		svval = "onehand" },
		[28] = { cb = ARL_Weapon2HCB,				svroot = filterdb.item.weapon,		svval = "twohand" },
		[29] = { cb = ARL_WeaponDaggerCB,			svroot = filterdb.item.weapon,		svval = "dagger" },
		[30] = { cb = ARL_WeaponAxeCB,				svroot = filterdb.item.weapon,		svval = "axe" },
		[31] = { cb = ARL_WeaponMaceCB,				svroot = filterdb.item.weapon,		svval = "mace" },
		[32] = { cb = ARL_WeaponSwordCB,			svroot = filterdb.item.weapon,		svval = "sword" },
		[33] = { cb = ARL_WeaponPolearmCB,			svroot = filterdb.item.weapon,		svval = "polearm" },
		[84] = { cb = ARL_WeaponFistCB,				svroot = filterdb.item.weapon,		svval = "fist" },
		[34] = { cb = ARL_WeaponStaffCB,			svroot = "disabled",			svval = "" },
		[68] = { cb = ARL_WeaponWandCB,				svroot = filterdb.item.weapon,		svval = "wand" },
		[35] = { cb = ARL_WeaponThrownCB,			svroot = filterdb.item.weapon,		svval = "thrown" },
		[36] = { cb = ARL_WeaponBowCB,				svroot = "disabled",			svval = "" },
		[37] = { cb = ARL_WeaponCrossbowCB,			svroot = "disabled",			svval = "" },
		[38] = { cb = ARL_WeaponAmmoCB,				svroot = filterdb.item.weapon,		svval = "ammo" },
		[92] = { cb = ARL_WeaponGunCB,				svroot = filterdb.item.weapon,		svval = "gun" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Player Type Options
		------------------------------------------------------------------------------------------------------------------------------
		[41] = { cb = ARL_PlayerTankCB,				svroot = filterdb.player,		svval = "tank" },
		[42] = { cb = ARL_PlayerMeleeCB,			svroot = filterdb.player,		svval = "melee" },
		[43] = { cb = ARL_PlayerHealerCB,			svroot = filterdb.player,		svval = "healer" },
		[44] = { cb = ARL_PlayerCasterCB,			svroot = filterdb.player,		svval = "caster" },
		------------------------------------------------------------------------------------------------------------------------------
		-- Old World Rep Options
		------------------------------------------------------------------------------------------------------------------------------
		[45] = { cb = ARL_RepArgentDawnCB,			svroot = filterdb.rep,			svval = "argentdawn" },
		[46] = { cb = ARL_RepCenarionCircleCB,			svroot = filterdb.rep,			svval = "cenarioncircle" },
		[47] = { cb = ARL_RepThoriumCB,				svroot = filterdb.rep,			svval = "thoriumbrotherhood" },
		[48] = { cb = ARL_RepTimbermawCB,			svroot = filterdb.rep,			svval = "timbermaw" },
		[49] = { cb = ARL_RepZandalarCB,			svroot = filterdb.rep,			svval = "zandalar" },
		------------------------------------------------------------------------------------------------------------------------------
		-- BC Rep Options
		------------------------------------------------------------------------------------------------------------------------------
		[50] = { cb = ARL_RepAldorCB,				svroot = filterdb.rep,			svval = "aldor" },
		[51] = { cb = ARL_RepAshtongueCB,			svroot = filterdb.rep,			svval = "ashtonguedeathsworn" },
		[52] = { cb = ARL_RepCenarionExpeditionCB,		svroot = filterdb.rep,			svval = "cenarionexpedition" },
		[53] = { cb = ARL_RepConsortiumCB,			svroot = filterdb.rep,			svval = "consortium" },
		[54] = { cb = ARL_RepHonorHoldCB,			svroot = filterdb.rep,			svval = "hellfire" },
		[55] = { cb = ARL_RepKeepersOfTimeCB,			svroot = filterdb.rep,			svval = "keepersoftime" },
		[56] = { cb = ARL_RepKurenaiCB,				svroot = filterdb.rep,			svval = "nagrand" },
		[57] = { cb = ARL_RepLowerCityCB,			svroot = filterdb.rep,			svval = "lowercity" },
		[58] = { cb = ARL_RepScaleSandsCB,			svroot = filterdb.rep,			svval = "scaleofthesands" },
		[59] = { cb = ARL_RepScryersCB,				svroot = filterdb.rep,			svval = "scryer" },
		[60] = { cb = ARL_RepShatarCB,				svroot = filterdb.rep,			svval = "shatar" },
		[61] = { cb = ARL_RepShatteredSunCB,			svroot = filterdb.rep,			svval = "shatteredsun" },
		[62] = { cb = ARL_RepSporeggarCB,			svroot = filterdb.rep,			svval = "sporeggar" },
		[63] = { cb = ARL_RepVioletEyeCB,			svroot = filterdb.rep,			svval = "violeteye" },
		------------------------------------------------------------------------------------------------------------------------------
		-- LK Rep Options
		------------------------------------------------------------------------------------------------------------------------------
		[69] = { cb = ARL_RepArgentCrusadeCB,			svroot = filterdb.rep,			svval = "argentcrusade" },
		[70] = { cb = ARL_RepFrenzyheartCB,			svroot = filterdb.rep,			svval = "frenzyheart" },
		[71] = { cb = ARL_RepEbonBladeCB,			svroot = filterdb.rep,			svval = "ebonblade" },
		[72] = { cb = ARL_RepKirinTorCB,			svroot = filterdb.rep,			svval = "kirintor" },
		[73] = { cb = ARL_RepSonsOfHodirCB,			svroot = filterdb.rep,			svval = "sonsofhodir" },
		[74] = { cb = ARL_RepKaluakCB,				svroot = filterdb.rep,			svval = "kaluak" },
		[75] = { cb = ARL_RepOraclesCB,				svroot = filterdb.rep,			svval = "oracles" },
		[76] = { cb = ARL_RepWyrmrestCB,			svroot = filterdb.rep,			svval = "wyrmrest" },
		[86] = { cb = ARL_WrathCommon1CB,			svroot = filterdb.rep,			svval = "wrathcommon1" },
		[77] = { cb = ARL_WrathCommon2CB,			svroot = "disabled",			svval = "" },
		[80] = { cb = ARL_WrathCommon3CB,			svroot = "disabled",			svval = "" },
		[82] = { cb = ARL_WrathCommon4CB,			svroot = "disabled",			svval = "" },
		[79] = { cb = ARL_WrathCommon5CB,			svroot = "disabled",			svval = "" },
	}
end

-------------------------------------------------------------------------------
-- Displays the main recipe frame if it exists. Otherwise, create the frame
-- and initialize it, then show it.
-------------------------------------------------------------------------------
function addon:DisplayFrame(
	cPlayer,	-- playerdata
	asTable,	-- AllSpecialtiesTable
	trList,		-- TrainerList
	vList,		-- VendorList
	qList,		-- QuestList
	rList,		-- ReputationList
	sList,		-- SeasonalList
	mList,		-- MobList
	cList)		-- Customlist
	-------------------------------------------------------------------------------
	-- cPlayer is a table containing:
	--	.playerProfession == player profession which has been opened
	--	.playerProfessionLevel == skill level of profession
	--	.playerSpecialty == Specialty if any or ""
	--	.totalRecipes == Total recipes added to the database
	--	.foundRecipes == Total recipes found that the player knows
	--	.otherRecipes == Total non-profession recipes in the database
	--	.filteredRecipes == Total recipes filtered
	--	.playerFaction == Faction of the player
	--	["Professions"] == list of all professions with the ones the player knows set as true
	--	["Reputation"] == Reputation levels, what I had in current ARLform was if you didn't have the rep level, it would display it in red
	-------------------------------------------------------------------------------
	myFaction = cPlayer.playerFaction

	allSpecTable = asTable
	playerData = cPlayer
	currentProfession = playerData.playerProfession
	trainerDB = trList
	vendorDB = vList
	questDB = qList
	repDB = rList
	seasonDB = sList
	mobDB = mList
	customDB = cList

	WipeDisplayStrings()	-- reset current display items

	-- get our current profession's index
	for k, v in pairs(SortedProfessions) do
		if (v.name == currentProfession) then
			currentProfIndex = k
			break
		end
	end

	if (not self.Frame) then
		InitializeFrame()
	end
	SetFramePosition()							-- Set our addon frame position
	ARL_DD_Sort.initialize = ARL_DD_Sort_Initialize				-- Initialize dropdown

	-- reset the scale
	self.Frame:SetScale(addon.db.profile.frameopts.uiscale)
	arlSpellTooltip:SetScale(addon.db.profile.frameopts.tooltipscale)

	-- We'll be in "ExpandAll" mode to start with. Make sure the button knows that:
	ARL_ExpandButton:SetText(L["EXPANDALL"])
	self:TooltipDisplay(ARL_ExpandButton, L["EXPANDALL_DESC"])

	self.resetTitle()							-- Reset our addon title text
	SetSwitcherTexture(SortedProfessions[currentProfIndex].texture)		-- Set the texture on our switcher button correctly

	-- Acquire the list, then sort it
	recipeDB = self:GetRecipeTable()
	sortedRecipeIndex = SortMissingRecipes(recipeDB)
	initDisplayStrings()							-- Take our sorted list, and fill up DisplayStrings
	SetProgressBar(cPlayer)							-- Update our progressbar

	-- And update our scrollframe
	RecipeList_Update()
	self.Frame:Show()

	-- Make sure to reset search gui elements
	ARL_LastSearchedText = ""
	ARL_SearchText:SetText(L["SEARCH_BOX_DESC"])

end

-- Description: Creates a new frame with the contents of a text dump so you can copy and paste
-- Expected result: New frame with all recipes listed and acquire info
-- Input: A text string of what to paste
-- Output: None
-- Creates a frame where you can copy and paste contents from.  Adds the textdump text into that frame.
-- Code stolen from Antiarc and Chatter

local PaneBackdrop  = {
	bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
	edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
	tile = true, tileSize = 16, edgeSize = 16,
	insets = { left = 3, right = 3, top = 5, bottom = 3 }
}

function addon:DisplayTextDump(RecipeDB, profession, text)

	local textdump

	-- If we don't send in a RecipeDB and profession, just dump the text
	if (not RecipeDB and not profession) then
		textdump = text
	else
		textdump = self:GetTextDump(RecipeDB,profession)
	end

	-- If we haven't created these frames, then lets do so now.
	if (not addon.ARLCopyFrame) then
		addon.ARLCopyFrame = CreateFrame("Frame", "ARLCopyFrame", UIParent)
		tinsert(UISpecialFrames, "ARLCopyFrame")
		addon.ARLCopyFrame:SetBackdrop(PaneBackdrop)
		addon.ARLCopyFrame:SetBackdropColor(0,0,0,1)
		addon.ARLCopyFrame:SetWidth(750)
		addon.ARLCopyFrame:SetHeight(400)
		addon.ARLCopyFrame:SetPoint("CENTER", UIParent, "CENTER")
		addon.ARLCopyFrame:SetFrameStrata("DIALOG")
		
		local scrollArea = CreateFrame("ScrollFrame", "ARLCopyScroll", addon.ARLCopyFrame, "UIPanelScrollFrameTemplate")
		scrollArea:SetPoint("TOPLEFT", addon.ARLCopyFrame, "TOPLEFT", 8, -30)
		scrollArea:SetPoint("BOTTOMRIGHT", addon.ARLCopyFrame, "BOTTOMRIGHT", -30, 8)
		
		addon.ARLCopyFrame.editBox = CreateFrame("EditBox", "ARLCopyEdit", addon.ARLCopyFrame)
		addon.ARLCopyFrame.editBox:SetMultiLine(true)
		addon.ARLCopyFrame.editBox:SetMaxLetters(99999)
		addon.ARLCopyFrame.editBox:EnableMouse(true)
		addon.ARLCopyFrame.editBox:SetAutoFocus(true)
		addon.ARLCopyFrame.editBox:SetFontObject(ChatFontNormal)
		addon.ARLCopyFrame.editBox:SetWidth(650)
		addon.ARLCopyFrame.editBox:SetHeight(270)
		addon.ARLCopyFrame.editBox:SetScript("OnEscapePressed", function() addon.ARLCopyFrame:Hide() end)
		addon.ARLCopyFrame.editBox:SetText(textdump)
		addon.ARLCopyFrame.editBox:HighlightText(0)
		
		scrollArea:SetScrollChild(addon.ARLCopyFrame.editBox)
		
		local close = CreateFrame("Button", nil, addon.ARLCopyFrame, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", addon.ARLCopyFrame, "TOPRIGHT")
		
		addon.ARLCopyFrame:Show()
	else
		addon.ARLCopyFrame.editBox:SetText(textdump)
		addon.ARLCopyFrame.editBox:HighlightText(0)
		addon.ARLCopyFrame:Show()
	end

end
