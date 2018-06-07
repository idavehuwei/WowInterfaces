
local YBL_WMS = {}

local L = LibStub("AceLocale-3.0"):GetLocale("YssBossLoot", true)
local BZ = LibStub("LibBabble-Zone-3.0", true):GetUnstrictLookupTable()
local BB = LibStub("LibBabble-Boss-3.0", true):GetUnstrictLookupTable()

local function GetMapType()
	local id = GetCurrentMapAreaID() - 1
	local currCont = YssBossLoot.IDs.type[id]
	if currCont then
		local currZone = YssBossLoot.IDs['r'..currCont][id]
		local currLevel = GetCurrentMapDungeonLevel()
		return currCont, currZone, currLevel
	end
end

--WorldMapFrame_Update()
local WorldMapDetailFrame = _G['WorldMapDetailFrame']

local oldMapID, oldMapLevel -- lets check if we are on a different map before we update
hooksecurefunc("WorldMapFrame_Update", function(...) --detect ingame map location
	local MapID = GetCurrentMapAreaID()
	local MapLevel = GetCurrentMapDungeonLevel()
	if oldMapID ~= MapID or oldMapLevel ~= MapLevel then
		oldMapID, oldMapLevel = MapID, MapLevel
		YBL_WMS.currCont, YBL_WMS.currZone = nil, nil, nil
		YssBossLoot:ClearBosses(WorldMapDetailFrame)
		if YssBossLoot.LootFrame:IsVisible() then
			YssBossLoot.LootFrame:Hide()
		end
		local currCont, currZone, currLevel = GetMapType()
		if currCont then
			YssBossLoot:AddBosses(WorldMapDetailFrame, currCont, currZone, currLevel)
			YBL_WMS.currCont = currCont
			YBL_WMS.currZone = currZone
		end
	end
end)

local WorldMapContinentButton_OnClick_old = WorldMapContinentButton_OnClick
function WorldMapContinentButton_OnClick(self, arg1, ...)
	YBL_WMS.currCont = nil
	if YssBossLoot.MapTypes[arg1] then
		SetMapZoom(-1)
		YBL_WMS.currCont = arg1
		UIDropDownMenu_SetSelectedID(WorldMapContinentDropDown, self:GetID())
	else
		WorldMapContinentButton_OnClick_old(self, arg1, ...)
	end
end

local WorldMapContinentDropDownText_SetText = WorldMapContinentDropDownText.SetText
function WorldMapContinentDropDownText.SetText(self, text)
	if YBL_WMS.currCont then
		text = YssBossLoot.MapTypes[YBL_WMS.currCont]
	end
	WorldMapContinentDropDownText_SetText(self, text)
end

local info = {}
hooksecurefunc("WorldMapFrame_LoadContinents", function(...)
	wipe(info)

	local sortedLConts = {}
	local rConts = {}
	for c, lc in pairs(YssBossLoot.MapTypes) do
		rConts[lc] = c
		sortedLConts[#sortedLConts+1] = lc
	end
	table.sort(sortedLConts)

	local currCont, currZone, currLevel = GetMapType()
	for i = 1, #sortedLConts do
		info.text = NORMAL_FONT_COLOR_CODE..sortedLConts[i]
		info.arg1 = rConts[sortedLConts[i]]
		info.func = WorldMapContinentButton_OnClick
		info.checked = rConts[sortedLConts[i]] == currCont
		UIDropDownMenu_AddButton(info)
	end
end)

local WorldMapZoneDropDownText_SetText = WorldMapZoneDropDownText.SetText
function WorldMapZoneDropDownText.SetText(self, text)
	if YBL_WMS.currZone then
		text = BZ[YBL_WMS.currZone] or YBL_WMS.currZone
	end
	WorldMapZoneDropDownText_SetText(self, text)
end

local function InstanceClick(button, arg1, arg2)
	YBL_WMS.currZone = arg1
	UIDropDownMenu_SetSelectedID(WorldMapZoneDropDown, button:GetID())
	SetMapByID(arg2)
end

hooksecurefunc("WorldMapFrame_LoadZones", function(...)
	if YBL_WMS.currCont then
		wipe(info)

		local sortedLZones = {}
		local zoneIDs = {}
		local rLZones = {}
		for z, id in pairs(YssBossLoot.IDs[YBL_WMS.currCont]) do
			local Lzone = BZ[z] or z
			zoneIDs[Lzone] = id
			rLZones[Lzone] = z
			sortedLZones[#sortedLZones+1] = Lzone
		end
		table.sort(sortedLZones)

		for i = 1, #sortedLZones do
			info.text = sortedLZones[i]
			info.arg1 = rLZones[sortedLZones[i]]
			info.arg2 = zoneIDs[sortedLZones[i]]
			info.func = InstanceClick
			info.checked = rLZones[sortedLZones[i]] == YBL_WMS.currZone
			UIDropDownMenu_AddButton(info)
		end
	end
end)

--[==[ bah we can use this to hopefully detect what is causeing map resets
local SetMapByID_old = SetMapByID
function SetMapByID(...)
	SetMapByID_old(...)
	Spew('SetMapByID', debugstack())
end
local SetDungeonMapLevel_old = SetDungeonMapLevel
function SetDungeonMapLevel(...)
	SetDungeonMapLevel_old(...)
	Spew('SetDungeonMapLevel', debugstack())
end
local SetMapZoom_old = SetMapZoom
function SetMapZoom(...)
	SetMapZoom_old(...)
	Spew('SetMapZoom', debugstack())
end
local SetMapToCurrentZone_old = SetMapToCurrentZone
function SetMapToCurrentZone(...)
	SetMapToCurrentZone_old(...)
	Spew('SetMapToCurrentZone', debugstack())
end
]==]--

----------------------------
-- InstanceMap 入口
-- 获得5人副本和团队副本的列表
do
	local MapID = {};
	for k, v in pairs(YssBossLoot.IDs) do
		if (k == "Dungeon" or k == "Raid") then
			for z, id in pairs(v) do
				MapID[z] = id;
			end
		end
	end
	
	local function _InstanceClick(button, arg1)		
		if MapID[arg1] then
			local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
			if (addon) then
				addon:HideInstanceFrame()
			end
			SetMapByID(MapID[arg1])		
		end
	end

	local lootInfo_list;
	function YssBossGenerateMapInfo()
		if (not lootInfo_list) then
			lootInfo_list = {};
			local info = {};
			for z, id in pairs(MapID) do
				info = {};
				info.text = BZ[z] or z
				info.arg1 = z
				info.value = z
				info.sortBy = BZ[z] or z
				info.func = _InstanceClick
				
				table.insert(lootInfo_list, info)
			end
		end	
		
		return lootInfo_list;
	end
end
