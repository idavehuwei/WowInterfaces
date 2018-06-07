local L = AceLibrary("AceLocale-2.2"):new("GridAutoFrameSize")
local GridL = AceLibrary("AceLocale-2.2"):new("Grid")
local BZ = LibStub("LibBabble-Zone-3.0"):GetReverseLookupTable()

local math_ceil = math.ceil
local math_max = math.max
local string_find = string.find

local GetNumPartyMembers = GetNumPartyMembers
local GetNumRaidMembers = GetNumRaidMembers
local GetRaidRosterInfo = GetRaidRosterInfo
local GetInstanceDifficulty = GetInstanceDifficulty
local UnitExists = UnitExists

GridAutoFrameSize = Grid:NewModule("GridAutoFrameSize")
local GridAutoFrameSize = GridAutoFrameSize
local GridLayout = Grid:GetModule("GridLayout")

GridAutoFrameSize.defaultDB = {
  autoSizeFrames = false,
  autoZoneSize = false,
  withPets = false,
  forcePets = false,
  lastSize = nil,
}

local fixedSizeInstances = {
  ["Alterac Valley"] = 40,
  ["Arathi Basin"] = 15,
  ["Eye of the Storm"] = 15,
  ["Isle of Conquest"] = 40,
  ["Strand of the Ancients"] = 15,
  ["Warsong Gulch"] = 10,
}

local dynamicSizeInstances = {
  ["Icecrown Citadel"] = true,
  ["Naxxramas"] = true,
  ["Onyxia's Lair"] = true,
  ["The Eye of Eternity"] = true,
  ["The Obsidian Sanctum"] = true,
  ["Trial of the Crusader"] = true,
  ["Vault of Archavon"] = true,
  ["Ulduar"] = true,
}

-- Returns mode of instance, 10 for normal, 25 for heroic
local function getMode()
	if not IsInInstance() then
		return 0
	end

	local mode = GetInstanceDifficulty()
	if mode == 1 or mode == 3 then
		return 10
	elseif mode == 2 or mode == 4 then
		return 25
	else
		return 0
	end
end

-- Returns max raid size of given instance, locale independent
local function getPredefinedZoneSize()
	local zone = GetRealZoneText()
	local englishZone = BZ[zone]

	if fixedSizeInstances[englishZone] then
		return fixedSizeInstances[englishZone]
	end

	if dynamicSizeInstances[englishZone] then
		return getMode()
	end

	return 0
end

-- Returns localized name of given layout from Grid's localization data
local function getLocalizedLayout(layout)
	if layout == nil then
		return nil
	end

	if GridL[layout] == nil then
		return layout
	end

	return GridL[layout]
end

local function getRaidSize()
	local layoutSize = 0
	local raidSize = GetNumRaidMembers()
	if raidSize > 0 then
		local maxGroup = math_ceil(raidSize / 5)
		for i = 1, raidSize do
			local group = select(3, GetRaidRosterInfo(i))
			maxGroup = math_max(maxGroup, group)
		end
		if (maxGroup > 5) or (raidSize > 25) then
			layoutSize = 40
		else
			if 5 * maxGroup == 20 then
				layoutSize = 25
			else
				layoutSize =  5 * maxGroup
			end
		end
	elseif GetNumPartyMembers() > 0 then
		layoutSize = 5
	end

	return layoutSize
end

-- Depending on options, returns layout name with or without pets
local function getWithPetsLayout(size)
	if size == 0 then
		return "None"
	end

	petLayout = false
	if GridAutoFrameSize.db.profile.forcePets then
		petLayout = true
	elseif GridAutoFrameSize.db.profile.withPets and UnitExists("pet") then
		petLayout = true
	end

	if petLayout then
		return "By Group "..size.." w/Pets"
	else
		return "By Group "..size
	end
end

function GridAutoFrameSize:OnInitialize()
	self.super.OnInitialize(self)
end

function GridAutoFrameSize:OnEnable()
  local opt = Grid.options.args
  opt["gridAutoFrameSize"] = {
    type = "group",
    name = L["GridAutoFrameSize"],
    desc = L["GridAutoFrameSize"],
    args = {
      autoSizeFrames = {
        type = "toggle",
        name = L["AUTO_SIZE"],
        desc = L["AUTO_SIZE_DESC"],
        order = 1,
        get = function ()	return self.db.profile.autoSizeFrames	end,
        set = function ()
          self.db.profile.autoSizeFrames = not self.db.profile.autoSizeFrames
          self:CheckRoster()
        end,
      },
      autoZoneSize = {
        type = "toggle",
        name = L["ZONE_SIZE"],
        desc = L["ZONE_SIZE_DESC"],
        order = 2,
        get = function ()	return self.db.profile.autoZoneSize end,
        set = function ()
          self.db.profile.autoZoneSize = not self.db.profile.autoZoneSize
          self:CheckRoster()
        end,
      },
      withPets = {
        type = "toggle",
        name = L["WITH_PETS"],
        desc = L["WITH_PETS_DESC"],
        order = 3,
        get = function() return self.db.profile.withPets end,
        set = function()
          self.db.profile.withPets = not self.db.profile.withPets
          self:CheckRoster()
        end,
      },
      forcePets = {
        type = "toggle",
        name = L["FORCE_PETS"],
        desc = L["FORCE_PETS_DESC"],
        order = 4,
        get = function() return self.db.profile.forcePets end,
        set = function()
          self.db.profile.forcePets = not self.db.profile.forcePets
          self:CheckRoster()
        end,
      },
    },
  }

  self.super.OnEnable(self)

  self:RegisterBucketEvent({"UNIT_PET", "RAID_ROSTER_UPDATE", "PARTY_MEMBERS_CHANGED", "ZONE_CHANGED_NEW_AREA"}, 1, "CheckRoster")
  self:RegisterEvent("PLAYER_REGEN_ENABLED", "ScheduleUpdate")

  self.scheduleUpdate = false
  self:ScheduleEvent(GridAutoFrameSize.CheckRoster, 3)
end

function GridAutoFrameSize:OnDisable()
  self.scheduleUpdate = false
  self:UnregisterAllEvents()
end

function GridAutoFrameSize:ScheduleUpdate()
  if self.scheduleUpdate then
    self.scheduleUpdate = false
    self:CheckRoster()
  end
end

function GridAutoFrameSize:CheckRoster()
	if self == nil then
		self = GridAutoFrameSize
	end

	if InCombatLockdown() then
		self.scheduleUpdate = true
		return
	end

	-- dont change layout, when auto frame size is disabled
	if not self.db.profile.autoSizeFrames then
		return
	end

	local layoutSize = getRaidSize()
	local zoneSize = getPredefinedZoneSize()

	if self.db.profile.autoZoneSize and (zoneSize ~= 0) then
		layoutSize = zoneSize
	end

	local newLayout = getWithPetsLayout(layoutSize)
	newLayout = getLocalizedLayout(newLayout)

	if InCombatLockdown() then
		self.scheduleUpdate = true
	else
		self.db.profile.lastLayout = newLayout
		GridLayout:LoadLayout(newLayout)
	end
end
