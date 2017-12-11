--[[
Copyright (c) 2009, Hendrik "Nevcairiel" Leppkes < h.leppkes@gmail.com >
All rights reserved.
]]

local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster")
local L = LibStub("AceLocale-3.0"):GetLocale("Mapster")

local MODNAME = "InstanceMaps"
local Maps = Mapster:NewModule(MODNAME, "AceHook-3.0")

local LBZ = LibStub("LibBabble-Zone-3.0", true)
local BZ = LBZ and LBZ:GetLookupTable() or setmetatable({}, {__index = function(t,k) return k end})

-- Credit for the initial data goes to Xinhuan
-- for the effort in gathering
local data = {
	-- Northrend Instances
	{
		["Ahn'kahet: The Old Kingdom"] = {
			"AhnKahet",
			2,
		},
		["Azjol-Nerub"] = {
			"AzjolNerub",
			3,
		},
		["The Culling of Stratholme"] = {
			"CoTStratholme",
			--"TheCullingofStratholme",
			2,
		},
		["Drak'Tharon Keep"] = {
			"DrakTharonKeep",
			--"DrakTheron",
			2,
		},
		--["Gundrak"] = "GunDrak",
		["Gundrak"] = {
			"GunDrak",
			1,
		},
		["The Nexus"] = {
			"TheNexus",
			1,
		},
		--["The Nexus"] = "TheNexus",
		["The Oculus"] = {
			"Nexus80",
			--"TheOculus",
			4,
		},
		["Halls of Lightning"] = {
			"HallsofLightning",
			2,
		},
		["Halls of Stone"] = {
			"Ulduar77",
			--"HallsofStone",
			1,
		},
		["Utgarde Keep"] = {
			"UtgardeKeep",
			3,
		},
		["Utgarde Pinnacle"] = {
			"UtgardePinnacle",
			2,
		},
		--["Violet Hold"] = "VioletHold",
		["The Violet Hold"] = {
			"VioletHold",
			1,
		},
	},

	-- Northrend Raids
	{
		["Naxxramas"] = {
			"Naxxramas",
			6,
			{BZ["The Construct Quarter"], BZ["The Arachnid Quarter"], BZ["The Military Quarter"], BZ["The Plague Quarter"], BZ["Naxxramas"], BZ["Frostwyrm Lair"]},
		},
		--["The Eye of Eternity"] = "EyeOfEternity",
		["The Eye of Eternity"] = {
			"EyeOfEternity",
			1,
		},
		["The Obsidian Sanctum"] = "TheObsidianSanctum",
--		["The Obsidian Sanctum"] = {
--			"TheObsidianSanctum",
--			{"Area 1"},
--		},
		["Ulduar"] = {
			"Ulduar",
			5,
			{(select(2, GetAchievementInfo(2886))), (select(2, GetAchievementInfo(2888))), (select(2, GetAchievementInfo(2890))), (select(2, GetAchievementInfo(2892))), BZ["The Spark of Imagination"]},
		},
		["Vault of Archavon"] = {
			"VaultofArchavon",
			1,
		},
	},
	{
		["Alterac Valley"] = "AlteracValley",
		["Arathi Basin"] = "ArathiBasin",
		["Eye of the Storm"] = "NetherstormArena",
		["Strand of the Ancients"] = "StrandoftheAncients",
		["Warsong Gulch"] = "WarsongGulch",
	},
}

local options
local function getOptions()
	if not options then
		options = {
			type = "group",
			name = L["Instance Maps"],
			arg = MODNAME,
			get = optGetter,
			set = optSetter,
			args = {
				intro = {
					order = 1,
					type = "description",
					name = L["The Instance Maps module allows you to view the Instance and Battleground Maps provided by the game without being in the instance yourself."],
				},
				enabled = {
					order = 2,
					type = "toggle",
					name = L["Enable Instance Maps"],
					get = function() return Mapster:GetModuleEnabled(MODNAME) end,
					set = function(info, value) Mapster:SetModuleEnabled(MODNAME, value) end,
				},
			},
		}
	end

	return options
end

local cont_offset

function Maps:OnInitialize()
	self.db = Mapster.db:RegisterNamespace(MODNAME, defaults)
	db = self.db.profile

	self:SetEnabledState(Mapster:GetModuleEnabled(MODNAME))
	Mapster:RegisterModuleOptions(MODNAME, getOptions, L["Instance Maps"])

	cont_offset = select('#', GetMapContinents())

	self.zone_names = {}
	self.zone_data = {}

	for i, idata in pairs(data) do
		local id = i + cont_offset

		local names = {}
		local name_data = {}
		for name, zdata in pairs(idata) do
			tinsert(names, BZ[name])
			--print(name)
			name_data[BZ[name]] = zdata
		end
		table.sort(names)
		self.zone_names[id] = names

		local zone_data = {}
		for k,v in pairs(names) do
			zone_data[k] = name_data[v]
		end
		self.zone_data[id] = zone_data
	end
	data = nil
end

function Maps:OnEnable()
	self:RawHook("WorldMapContinentsDropDown_Update", true)
	self:RawHook("WorldMapFrame_LoadContinents", true)

	self:RawHook("WorldMapZoneDropDown_Update", true)
	self:RawHook("WorldMapZoneDropDown_Initialize", true)
	self:RawHook("WorldMapZoneButton_OnClick", true)

	self:RawHook("WorldMapLevelDropDown_Update", true)
	self:RawHook("WorldMapLevelDropDown_Initialize", true)
	WorldMapLevelUpButton:SetScript("OnClick", self.WorldMapLevelUp_OnClick)
	WorldMapLevelDownButton:SetScript("OnClick", self.WorldMapLevelDown_OnClick)

	self:RawHook("SetMapZoom", true)
	self:RawHook("SetDungeonMapLevel", true)
	self:Hook("SetMapToCurrentZone", true)

	self:RawHook("WorldMapFrame_Update", true)
end

function Maps:OnDisable()
	self:UnhookAll()
	self.mapCont, self.mapZone, self.dungeonLevel = nil, nil, nil
	WorldMapFrame_Update()
	WorldMapContinentsDropDown_Update()
	WorldMapZoneDropDown_Update()
	WorldMapLevelDropDown_Update()

	WorldMapLevelUpButton:SetScript("OnClick", WorldMapLevelUp_OnClick)
	WorldMapLevelDownButton:SetScript("OnClick", WorldMapLevelDown_OnClick)
end

function Maps:GetZoneData()
	return self.zone_data[self.mapCont][self.mapZone]
end

function Maps:WorldMapContinentsDropDown_Update()
	self.hooks.WorldMapContinentsDropDown_Update()
	if self.mapCont then
		UIDropDownMenu_SetSelectedID(WorldMapContinentDropDown, self.mapCont)
	end
end

function Maps:WorldMapFrame_LoadContinents(...)
	self.hooks.WorldMapFrame_LoadContinents(...)

	local info = UIDropDownMenu_CreateInfo()
	info.text =  L["Northrend Instances"]
	info.func = WorldMapContinentButton_OnClick;
	info.checked = nil;
	UIDropDownMenu_AddButton(info)

	info.text =  L["Northrend Raids"]
	info.func = WorldMapContinentButton_OnClick;
	info.checked = nil;
	UIDropDownMenu_AddButton(info)

	info.text =  L["Battlegrounds"]
	info.func = WorldMapContinentButton_OnClick;
	info.checked = nil;
	UIDropDownMenu_AddButton(info)
end

function Maps:WorldMapZoneDropDown_Update()
	self.hooks.WorldMapZoneDropDown_Update()
	if self.mapZone then
		UIDropDownMenu_SetSelectedID(WorldMapZoneDropDown, self.mapZone)
	end
end

function Maps:WorldMapZoneDropDown_Initialize()
	if self.mapCont then
		WorldMapFrame_LoadZones(unpack(self.zone_names[self.mapCont]))
	else
		self.hooks.WorldMapZoneDropDown_Initialize()
	end
end

function Maps:WorldMapZoneButton_OnClick(frame)
	if self.mapCont then
		UIDropDownMenu_SetSelectedID(WorldMapZoneDropDown, frame:GetID())
		SetMapZoom(self.mapCont, frame:GetID())
	else
		self.hooks.WorldMapZoneButton_OnClick(frame)
	end
end

function Maps:WorldMapLevelDropDown_Update()
	self.hooks.WorldMapLevelDropDown_Update()
	if self.mapCont and self.mapZone and self:GetNumDungeonMapLevels() > 1 then
		UIDropDownMenu_SetSelectedID(WorldMapLevelDropDown, self.dungeonLevel)
		WorldMapLevelDropDown:Show()
		WorldMapLevelUpButton:Show()
		WorldMapLevelDownButton:Show()
	end
end

function Maps:WorldMapLevelDropDown_Initialize()
	if self.mapCont and self.mapZone then
		local info = UIDropDownMenu_CreateInfo()
		local level = self.dungeonLevel

		local mapname = strupper(self:GetMapInfo() or "")

		local zone_data = self:GetZoneData()
		for i=1, self:GetNumDungeonMapLevels() do
			local floorname =_G["DUNGEON_FLOOR_" .. mapname .. i]
			local floorname_mapster = zone_data[3] and zone_data[3][i]
			info.text = floorname or floorname_mapster or string.format(FLOOR_NUMBER, i)
			info.func = WorldMapLevelButton_OnClick
			info.checked = (i == level)
			UIDropDownMenu_AddButton(info)
		end
	else
		self.hooks.WorldMapLevelDropDown_Initialize()
	end
end

function Maps.WorldMapLevelUp_OnClick(frame)
	if Maps.mapCont and Maps.mapZone then
		Maps:SetDungeonMapLevel(Maps.dungeonLevel - 1)
		UIDropDownMenu_SetSelectedID(WorldMapLevelDropDown, Maps.dungeonLevel)
		PlaySound("UChatScrollButton")
	else
		WorldMapLevelUp_OnClick(frame)
	end
end

function Maps.WorldMapLevelDown_OnClick(frame)
	if Maps.mapCont and Maps.mapZone then
		Maps:SetDungeonMapLevel(Maps.dungeonLevel + 1)
		UIDropDownMenu_SetSelectedID(WorldMapLevelDropDown, Maps.dungeonLevel)
		PlaySound("UChatScrollButton")
	else
		WorldMapLevelDown_OnClick(frame)
	end
end

function Maps:SetMapZoom(cont, zone)
	if self.zone_names[cont] then
		self.mapCont = cont
		self.mapZone = zone
		if zone then
			if self:GetNumDungeonMapLevels() > 0 then
				self.dungeonLevel = (self:GetNumDungeonMapLevels() > 0) and 1 or 0
			end
		end
		self:WorldMapFrame_Update()
		self.hooks.SetMapZoom(-1)
	else
		self.mapCont, self.mapZone, self.dungeonLevel = nil, nil, nil
		self.hooks.SetMapZoom(cont, zone)
	end
end

function Maps:GetNumDungeonMapLevels()
	if self.mapCont and self.mapZone then
		local zone_data = self:GetZoneData()
		if type(zone_data) == "table" then
			return zone_data[2]
		else
			return 0
		end
	else
		return GetNumDungeonMapLevels()
	end
end

function Maps:SetDungeonMapLevel(level)
	if self.mapCont and self.mapZone then
		self.dungeonLevel = max(1, min(level, self:GetNumDungeonMapLevels()))
		self:WorldMapFrame_Update()
	else
		self.hooks.SetDungeonMapLevel(level)
	end
end

function Maps:SetMapToCurrentZone()
	self.mapCont, self.mapZone, self.dungeonLevel = nil, nil, nil
end

function Maps:GetMapInfo()
	if self.mapCont and self.mapZone then
		local zone_data = self:GetZoneData()
		if type(zone_data) == "table" then
			return zone_data[1]
		else
			return zone_data
		end
	else
		return GetMapInfo()
	end
end

function Maps:WorldMapFrame_Update()
	if self.mapCont and self.mapZone then
		OutlandButton:Hide()
		AzerothButton:Hide()

		local mapFileName = self:GetMapInfo()

		local texName
		local dungeonLevel = self.dungeonLevel and (mapFileName == "Ulduar" and self.dungeonLevel - 1 or self.dungeonLevel) or 0
		for i=1, NUM_WORLDMAP_DETAIL_TILES do
			if ( dungeonLevel > 0 ) then
				texName = "Interface\\WorldMap\\"..mapFileName.."\\"..mapFileName..dungeonLevel.."_"..i;
			else
				texName = "Interface\\WorldMap\\"..mapFileName.."\\"..mapFileName..i;
			end
			_G["WorldMapDetailTile"..i]:SetTexture(texName);
		end
	else
		self.hooks.WorldMapFrame_Update()
	end
end
