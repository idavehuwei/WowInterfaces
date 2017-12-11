--{{{ Libraries
local HealComm = LibStub:GetLibrary("LibHealComm-3.0", true)
if not HealComm then return end
local L = AceLibrary("AceLocale-2.2"):new("Grid")
--}}}

GridStatusHeals = GridStatus:NewModule("GridStatusHeals")
GridStatusHeals.menuName = L["Heals"]

--{{{ AceDB defaults

GridStatusHeals.defaultDB = {
	debug = false,
	alert_heals = {
		text = L["Incoming heals"],
		enable = true,
		color = { r = 0, g = 1, b = 0, a = 1 },
		priority = 50,
		range = false,
		ignore_self = false,
		icon = nil,
	},
}

--}}}

GridStatusHeals.options = false

local healsOptions = {
	ignoreSelf = {
		type = "toggle",
		name = L["Ignore Self"],
		desc = L["Ignore heals cast by you."],
		get  = function()
			return GridStatusHeals.db.profile.alert_heals.ignore_self
		end,
		set  = function(v)
			GridStatusHeals.db.profile.alert_heals.ignore_self = v
		end,
	},
	versioncheck = {
		type = "execute",
		name = L["Show HealComm Users"],
		desc = L["Displays HealComm users and versions."],
		func = function() GridStatusHeals:ShowHealCommVersions() end,
	},
}

local settings
local playerName = UnitName("player")
local ownHeals = {}

--{{{ Initialisation
function GridStatusHeals:OnInitialize()
	self.super.OnInitialize(self)

	settings = GridStatusHeals.db.profile.alert_heals
	self:RegisterStatus("alert_heals", L["Incoming heals"], healsOptions, true)
end

function GridStatusHeals:OnStatusEnable(status)
	if status == "alert_heals" then
		-- register events
		self:RegisterEvent("Grid_UnitLeft")
		self:RegisterEvent("Grid_PartyTransition")
		self:RegisterEvent("UNIT_HEALTH", "UpdateHealsForUnit")
		self:RegisterEvent("UNIT_HEALTH_MAX", "UpdateHealsForUnit")

		-- register callbacks
		HealComm.RegisterCallback(self, "HealComm_DirectHealStart")
		HealComm.RegisterCallback(self, "HealComm_DirectHealStop")
		HealComm.RegisterCallback(self, "HealComm_DirectHealDelayed")
		HealComm.RegisterCallback(self, "HealComm_HealModifierUpdate")
	end
end

function GridStatusHeals:OnStatusDisable(status)
	if status == "alert_heals" then
		self:UnregisterEvent("Grid_UnitLeft")
		self:UnregisterEvent("Grid_PartyTransition")
		self:UnregisterEvent("UNIT_HEALTH")
		self:UnregisterEvent("UNIT_HEALTH_MAX")

		HealComm.UnregisterCallback(self, "HealComm_DirectHealStart")
		HealComm.UnregisterCallback(self, "HealComm_DirectHealStop")
		HealComm.UnregisterCallback(self, "HealComm_DirectHealDelayed")
		HealComm.UnregisterCallback(self, "HealComm_HealModifierUpdate")

		self.core:SendStatusLostAllUnits("alert_heals")
	end
end
--}}}

--{{{ Event/Callback handling

--[[free the leaving units entry in own-heals-table]]
function GridStatusHeals:Grid_UnitLeft(guid)
	local fullName = GridRoster:GetFullNameByGUID(guid)
	ownHeals[fullName] = nil
end

--[[wipe own-heals-table clean]]
function GridStatusHeals:Grid_PartyTransition(current_state)
	if current_state == "solo" then
		wipe(ownHeals)
	end
end

function GridStatusHeals:HealComm_DirectHealStart(event, healerFullName, healSize, endTime, ...)
	self:HandleIncomingHeal(healerFullName, healSize, ...)
end

function GridStatusHeals:HealComm_DirectHealStop(event, healerFullName, healSize, succeeded, ...)
	--set healSize to zero to make track of ownHeals easier
	--remember this in case you nead the healsize in the future
	self:HandleIncomingHeal(healerFullName, 0, ...)
end

function GridStatusHeals:HealComm_DirectHealDelayed(event, healerFullName, healSize, endTime, ...)
	self:HandleIncomingHeal(healerFullName, healSize, ...)
end

function GridStatusHeals:HealComm_HealModifierUpdate(event, unit, targetFullName, healModifier)
	self:UpdateIncomingHeals(targetFullName)
end

function GridStatusHeals:HandleIncomingHeal(healerFullName, healSize, ...)
	local isOwnHeal = healerFullName == playerName
	if isOwnHeal and settings.ignore_self then
		return
	end

	--iterate through targets of heal and update them
	for i = 1, select("#", ...) do
		local targetFullName = select(i, ...)
		--track own heals
		if isOwnHeal then
			ownHeals[targetFullName] = healSize
		end
		self:UpdateIncomingHeals(targetFullName, isOwnHeal)
	end
end

function GridStatusHeals:UpdateHealsForUnit(unitid)
	local name, realm = UnitName(unitid)
	self:UpdateIncomingHeals(type(realm) == "string" and name .. "-" .. realm or name)
end

--}}}

--{{{ General functionality

function GridStatusHeals:ShowHealCommVersions()
	local versions = HealComm:GetRaidOrPartyVersions()
	Grid:Print(L["HealComm Users"])
	local your_version = versions[playerName]
	for user, version in pairs(versions) do
		if version then
			if version < your_version then
				version = ("|cffff0000%d|r"):format(version)
			elseif version > your_version then
				version = ("|cff00ff00%d|r"):format(version)
			end
			Grid:Print(("%s: %s"):format(user, version))
		end
	end
end

function GridStatusHeals:UpdateIncomingHeals(fullName, isOwnHeal)
	--get incoming heals from other healers
	local incoming = HealComm:UnitIncomingHealGet(fullName, GetTime() + 100.0) or 0

	--add own incoming heals if not ignored
	if not settings.ignore_self then
		incoming = incoming + (ownHeals[fullName] or 0)
	end

	local guid = GridRoster:GetGUIDByFullName(fullName)
	if incoming > 0 and not UnitIsDeadOrGhost(fullName) then
		local effectiveIncoming = incoming * HealComm:UnitHealModifierGet(fullName)
		self:SendIncomingHealsStatus(
			guid,
			effectiveIncoming,
			UnitHealth(fullName) + effectiveIncoming,
			UnitHealthMax(fullName)
		)
	else
		self.core:SendStatusLost(guid, "alert_heals")
	end
end

function GridStatusHeals:SendIncomingHealsStatus(gridName, incoming, estimatedHealth, maxHealth)
	--add heal modifier to incoming value caused by buffs and debuffs
	--local modifier = UnitHealModifierGet(unitName)
	-- local effectiveIncoming = modifier * incoming

	local incomingText = self:FormatIncomingText(incoming)
	self.core:SendStatusGained(
		gridName, "alert_heals",
		settings.priority,
		(settings.range and 40),
		settings.color,
		incomingText,
		estimatedHealth, maxHealth,
		settings.icon
	)
end

function GridStatusHeals:FormatIncomingText(incoming)
	local incomingText
	if incoming > 999 then
		incomingText = string.format("+%.1fk", incoming/1000.0)
	else
		incomingText = string.format("+%d", incoming)
	end
	return incomingText
end
--}}}

