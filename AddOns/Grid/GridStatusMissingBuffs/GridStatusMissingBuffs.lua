-- This was written by North101, msl etc.  Toadkiller added it to wowace so it can be kept up to date.
-- http://www.wowace.com/projects/grid-status-missing-buffs/
-- http://forums.wowace.com/showthread.php?t=5350

local L = AceLibrary("AceLocale-2.2"):new("GridStatusMissingBuffs")
local GridRoster = Grid:GetModule("GridRoster")
local _

local playerClass, englishClass = UnitClass("player")
local classes = LOCALIZED_CLASS_NAMES_FEMALE

local GridStatusMissingBuffs = Grid:GetModule("GridStatus"):NewModule("GridStatusMissingBuffs")
GridStatusMissingBuffs.menuName = L["Missing Buffs"]

local function compactSpellName(spell)
	return string.gsub(spell, L["[^%a]"], "")
end

local function statusForSpell(spell)
	return "buffGroup_"..compactSpellName(spell)
end

local spellNameList = {}
local spellIconList = {}
--spellNameList["Horn of Winter"], _, spellIconList["Horn of Winter"] = GetSpellInfo(57330)

spellNameList["Gift of the Wild"], _, spellIconList["Gift of the Wild"] = GetSpellInfo(26991)
spellNameList["Mark of the Wild"], _, spellIconList["Mark of the Wild"] = GetSpellInfo(26990)

--spellNameList["Thorns"], _, spellIconList["Thorns"] = GetSpellInfo(26992)

spellNameList["Arcane Intellect"], _, spellIconList["Arcane Intellect"] = GetSpellInfo(27126)
spellNameList["Arcane Brilliance"], _, spellIconList["Arcane Brilliance"] = GetSpellInfo(27127)
spellNameList["Dalaran Intellect"], _, spellIconList["Dalaran Intellect"] = GetSpellInfo(61024)
spellNameList["Dalaran Brilliance"], _, spellIconList["Dalaran Brilliance"] = GetSpellInfo(61316)

spellNameList["Blessing of Kings"], _, spellIconList["Blessing of Kings"] = GetSpellInfo(20217)
spellNameList["Greater Blessing of Kings"], _, spellIconList["Greater Blessing of Kings"] = GetSpellInfo(25898)

--spellNameList["Blessing of Light"], _, spellIconList["Blessing of Light"] = GetSpellInfo(27144)

spellNameList["Blessing of Might"], _, spellIconList["Blessing of Might"] = GetSpellInfo(27140)
spellNameList["Greater Blessing of Might"], _, spellIconList["Greater Blessing of Might"] = GetSpellInfo(27141)

--spellNameList["Blessing of Salvation"], _, spellIconList["Blessing of Salvation"] = GetSpellInfo(1038)

spellNameList["Blessing of Sanctuary"], _, spellIconList["Blessing of Sanctuary"] = GetSpellInfo(20911)
spellNameList["Greater Blessing of Sanctuary"], _, spellIconList["Greater Blessing of Sanctuary"] = GetSpellInfo(25899)

spellNameList["Blessing of Wisdom"], _, spellIconList["Blessing of Wisdom"] = GetSpellInfo(19742)
spellNameList["Greater Blessing of Wisdom"], _, spellIconList["Greater Blessing of Wisdom"] = GetSpellInfo(25894)

spellNameList["Shadow Protection"], _, spellIconList["Shadow Protection"] = GetSpellInfo(976)
spellNameList["Prayer of Shadow Protection"], _, spellIconList["Prayer of Shadow Protection"] = GetSpellInfo(27683)

spellNameList["Divine Spirit"], _, spellIconList["Divine Spirit"] = GetSpellInfo(14752)
spellNameList["Prayer of Spirit"], _, spellIconList["Prayer of Spirit"] = GetSpellInfo(27681)

spellNameList["Power Word: Fortitude"], _, spellIconList["Power Word: Fortitude"] = GetSpellInfo(1243)
spellNameList["Prayer of Fortitude"], _, spellIconList["Prayer of Fortitude"] = GetSpellInfo(21562)

--spellNameList["Inner Fire"], _, spellIconList["Inner Fire"] = GetSpellInfo(25431)

GridStatusMissingBuffs.defaultDB = {
	debug = false,
	buffGroup_MarkoftheWild = {
		text = spellNameList["Mark of the Wild"],
		desc = L["Buff Group: "]..spellNameList["Mark of the Wild"],
		icon = "GiftoftheWild",
		buffs = {
			MarkoftheWild = spellNameList["Mark of the Wild"],
			GiftoftheWild = spellNameList["Gift of the Wild"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = true,
			HUNTER = false,
			MAGE = false,
			PALADIN = false,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_Fortitude = {
		text = spellNameList["Power Word: Fortitude"],
		desc = L["Buff Group: "]..spellNameList["Power Word: Fortitude"],
		icon = "PrayerofFortitude",
		buffs = {
			PowerWordFortitude = spellNameList["Power Word: Fortitude"],
			PrayerofFortitude = spellNameList["Prayer of Fortitude"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = false,
			PRIEST = true,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_DivineSpirit = {
		text = spellNameList["Divine Spirit"],
		desc = L["Buff Group: "]..spellNameList["Divine Spirit"],
		icon = "PrayerofSpirit",
		buffs = {
			DivineSpirit = spellNameList["Divine Spirit"],
			PrayerofSpirit = spellNameList["Prayer of Spirit"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = false,
			PRIEST = true,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_ShadowProtection = {
		text = spellNameList["Shadow Protection"],
		desc = L["Buff Group: "]..spellNameList["Shadow Protection"],
		icon = "PrayerofShadowProtection",
		buffs = {
			ShadowProtection = spellNameList["Shadow Protection"],
			PrayerofShadowProtection = spellNameList["Prayer of Shadow Protection"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = false,
			PRIEST = true,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 1, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_ArcaneIntellect = {
		text = spellNameList["Arcane Intellect"],
		desc = L["Buff Group: "]..spellNameList["Arcane Intellect"],
		icon = "DalaranBrilliance",
		buffs = {
			ArcaneIntellect = spellNameList["Arcane Intellect"],
			ArcaneBrilliance = spellNameList["Arcane Brilliance"],
			DalaranIntellect = spellNameList["Dalaran Intellect"],
			DalaranBrilliance = spellNameList["Dalaran Brilliance"],
		},
		classFilter = {
			DEATHKNIGHT = false,
			ROGUE = false,
			WARRIOR = false,
		},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = true,
			PALADIN = false,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_BlessingofKings = {
		text = spellNameList["Blessing of Kings"],
		desc = L["Buff Group: "]..spellNameList["Blessing of Kings"],
		icon = "GreaterBlessingofKings",
		buffs = {
			BlessingofKings = spellNameList["Blessing of Kings"],
			GreaterBlessingofKings = spellNameList["Greater Blessing of Kings"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = true,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		offline = false,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_BlessingofMight = {
		text = spellNameList["Blessing of Might"],
		desc = L["Buff Group: "]..spellNameList["Blessing of Might"],
		icon = "GreaterBlessingofMight",
		buffs = {
			BlessingofMight = spellNameList["Blessing of Might"],
			GreaterBlessingofMight = spellNameList["Greater Blessing of Might"],
		},
		classFilter = {
			PRIEST = false,
			SHAMAN = false,
			MAGE = false,
			WARLOCK = false,
		},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = true,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		onself = true,
		onparty = true,
		onraid = true,
		offline = false,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_BlessingofWisdom = {
		text = spellNameList["Blessing of Wisdom"],
		desc = L["Buff Group: "]..spellNameList["Blessing of Wisdom"],
		icon = "GreaterBlessingofWisdom",
		buffs = {
			BlessingofWisdom = spellNameList["Blessing of Wisdom"],
			GreaterBlessingofWisdom = spellNameList["Greater Blessing of Wisdom"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = true,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		offline = false,
		onself = true,
		onparty = true,
		onraid = true,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
	buffGroup_BlessingofSanctuary = {
		text = spellNameList["Blessing of Sanctuary"],
		desc = L["Buff Group: "]..spellNameList["Blessing of Sanctuary"],
		icon = "GreaterBlessingofSanctuary",
		buffs = {
			BlessingofSanctuary = spellNameList["Blessing of Sanctuary"],
			GreaterBlessingofSanctuary = spellNameList["Greater Blessing of Sanctuary"],
		},
		classFilter = {},
		yourClassFilter = {
			DEATHKNIGHT = false,
			DRUID = false,
			HUNTER = false,
			MAGE = false,
			PALADIN = true,
			PRIEST = false,
			ROGUE = false,
			SHAMAN = false,
			WARLOCK = false,
			WARRIOR = false,
		},
		combat = false,
		dead = false,
		offline = false,
		enable = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
}

local dbVersion = 1
function GridStatusMissingBuffs:Upgrade()
	self.db.profile.buffGroup_HornofWinter = nil
	self.db.profile.buffGroup_Thorns = nil
	self.db.profile.buffGroup_BlessingofLight = nil
	self.db.profile.buffGroup_BlessingofSalvation = nil
	self.db.profile.buffGroup_InnerFire = nil
	self.db.profile.dbVersion = dbVersion
end

function GridStatusMissingBuffs:OnInitialize()
	self.super.OnInitialize(self)

	if (not self.db.profile.dbVersion or self.db.profile.dbVersion < dbVersion) then
		self:Upgrade()
	end

	self:RegisterStatuses()
end

function GridStatusMissingBuffs:OnEnable()
	self.debugging = self.db.profile.debug

	self:CreateAddRemoveOptions()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_LEAVING_WORLD")
end

function GridStatusMissingBuffs:EnabledStatusCount()
	local enabledStatusCount = 0

	for status, settings in pairs(self.db.profile) do
		if (type(settings) == "table" and settings.enable) then
			enabledStatusCount = enabledStatusCount + 1
		end
	end

	return enabledStatusCount
end

function GridStatusMissingBuffs:PLAYER_LEAVING_WORLD()
	self:UnregisterEvent("UNIT_AURA")
end

function GridStatusMissingBuffs:PLAYER_ENTERING_WORLD()
	if (self:EnabledStatusCount() > 0) then
		self:UpdateAllUnits()
		self:RegisterEvent("UNIT_AURA", "UpdateUnit")
	end
end

function GridStatusMissingBuffs:Grid_UnitJoined(guid, unitid)
	self:Debug("Grid_UnitJoined", unitid)
	self:UpdateUnit(unitid)
end

function GridStatusMissingBuffs:RegisterStatuses()
	local status, settings, desc

	for status, settings in self:ConfiguredStatusIterator() do
		desc = settings.desc or settings.text or ""
		if not settings.classFilter then
			self.db.profile[status].classFilter = {}
		end
		if not settings.yourClassFilter then
			self.db.profile[status].yourClassFilter = {}
		end
		self:Debug("registering", status, desc)
		self:RegisterStatus(status, desc, self:GetBuffGroupOptions(status))
	end
end

function GridStatusMissingBuffs:UnregisterStatuses()
	local status, moduleName, desc
	for status, moduleName, desc in self.core:RegisteredStatusIterator() do
		if (moduleName == self.name) then
			self:Debug("unregistering", status, desc)
			self:UnregisterStatus(status)
			self.options.args[status] = nil
		end
	end
end

function GridStatusMissingBuffs:ConfiguredStatusIterator()
	local profile = self.db.profile
	local status

	return function ()
		status = next(profile, status)

		-- skip any non-table entries
		while status ~= nil and type(profile[status]) ~= "table" do
			status = next(profile, status)
		end

		if status == nil then
			return nil
		end

		return status, profile[status]
	end
end

function GridStatusMissingBuffs:GetBuffGroupOptions(status)
	local classFilterArgs = {}
	local yourClassFilterArgs = {}

	for class,name in pairs(classes) do
		local class,name = class,name
		classFilterArgs[class] = {
			type = "toggle",
			name = name,
			desc = string.format(L["Show on %s."], name),
			get = function ()
				return self.db.profile[status].classFilter[class] ~= false
			end,
			set = function (v)
				 self.db.profile[status].classFilter[class] = v
				 GridStatusMissingBuffs:UpdateAllUnits()
			end,
		}
		yourClassFilterArgs[class] = {
			type = "toggle",
			name = name,
			desc = string.format(L["Show if you are a %s."], name),
			get = function ()
				return self.db.profile[status].yourClassFilter[class] ~= false
			end,
			set = function (v)
				 self.db.profile[status].yourClassFilter[class] = v
				 GridStatusMissingBuffs:UpdateAllUnits()
			end,
		}
	end

	return {
		show = {
			type = "group",
			name = L["Show"],
			desc = L["Configure when to show the buff group"],
			order = 110.1,
			args = {
				onself = {
					type = "toggle",
					name =  L["On self"],
					desc =  L["Show missing buff group on self"],
					order = 1,
					get = function()
						return self.db.profile[status].onself
					end,
					set = function()
						self.db.profile[status].onself = not self.db.profile[status].onself
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
				onparty = {
					type = "toggle",
					name =  L["On party"],
					desc =  L["Show missing buff group on party"],
					order = 2,
					get = function()
						return self.db.profile[status].onparty
					end,
					set = function()
						self.db.profile[status].onparty = not self.db.profile[status].onparty
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
				onraid = {
					type = "toggle",
					name =  L["On raid"],
					desc =  L["Show missing buff group on raid"],
					order = 3,
					get = function()
						return self.db.profile[status].onraid
					end,
					set = function()
						self.db.profile[status].onraid = not self.db.profile[status].onraid
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
				combat = {
					type = "toggle",
					name =  L["When in Combat"],
					desc =  L["Show missing buff group when in combat"],
					order = 4,
					get = function()
						return self.db.profile[status].combat
					end,
					set = function()
						self.db.profile[status].combat = not self.db.profile[status].combat
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
				offline = {
					type = "toggle",
					name =  L["When Offline"],
					desc =  L["Show missing buff group for offline players"],
					order = 5,
					get = function()
						return self.db.profile[status].offline
					end,
					set = function(v)
						self.db.profile[status].offline = not self.db.profile[status].offline
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
				dead = {
					type = "toggle",
					name =  L["When Dead"],
					desc =  L["Show missing buff group for dead players"],
					order = 6,
					get = function()
						return self.db.profile[status].dead
					end,
					set = function(v)
						self.db.profile[status].dead = not self.db.profile[status].dead
						GridStatusMissingBuffs:UpdateAllUnits()
					end,
				},
			}
		},
		classFilter = {
			type = "group",
			name =  L["Class Filter"],
			desc =  L["Show status for the selected classes."],
			order = 110.2,
			args = classFilterArgs
		},
		yourClassFilter = {
			type = "group",
			name =  L["Your Class Filter"],
			desc =  L["Show status if you are one of the selected classes."],
			order = 110.3,
			args = yourClassFilterArgs
		},
		add_buff = {
			type = "text",
			name = L["Add Buff"],
			desc = L["Adds a new buff to the buff group"],
			get = false,
			order = 110.4,
			usage = L["<buff name>"],
			set = function(v) self:AddBuff(status, v) end
		},
		delete_buff = {
			type = "group",
			name = L["Delete Buff"],
			desc = L["Deletes an existing buff from the buff group"],
			order = 110.5,
			disable = function() return next(self.db.profile[status].buffs) == nil end,
			args = {}
		},
		buff_icon = {
			type = 'text',
			name = L["Buff Icon"],
			desc = L["The icon to appear when no buffs in the buff group are active."],
			order = 110.6,
			validate = self.db.profile[status].buffs,
			disable = function() return next(self.db.profile[status].buffs) == nil end,
			get = function()
				return self.db.profile[status].icon
			end,
			set = function(v)
				self.db.profile[status].icon = v
			end,
		},
		spacer = {
			type = "header",
			order = 110.7
		},
	}
end

function GridStatusMissingBuffs:Reset()
	self.super.Reset(self)
	self:UnregisterStatuses()
	self:RegisterStatuses()
	self:CreateAddRemoveOptions()
	self:UpdateAllUnits()
end

function GridStatusMissingBuffs:CreateAddRemoveOptions()
	local status, settings

	self.options.args["add_buff_group"] = {
		type = "text",
		name =  L["Add Buff Group"],
		desc =  L["Adds a new buff group to the status module"],
		get = false,
		usage =  L["<buff name>"],
		set = function(v) self:AddBuffGroup(v) end,
		order = 201
	}
	self.options.args["delete_buff_group"] = {
		type = "group",
		name =  L["Delete Buff Group"],
		desc =  L["Deletes an existing buff group from the status module"],
		disable = function() return next(self.db.profile[status]) == nil end,
		args = {},
		order = 202
	}

	for status, settings in self:ConfiguredStatusIterator() do
		local status, settings = status, settings
		local buffName = (settings.desc or settings.text or "")
		self.options.args["delete_buff_group"].args[status] = {
			type = "execute",
			name = buffName,
			desc = string.format(L["Remove %s from the menu"], buffName),
			func = function() return self:DeleteBuffGroup(status) end
		}

		self.options.args["delete_buff_group"].args[status] = {
			type = "execute",
			name = buffName,
			desc = string.format(L["Remove %s from the menu"], buffName),
			func = function() return self:DeleteBuffGroup(status) end
		}
		if (settings.buffs) then
			local buffId, buffName
			for buffId, buffName in pairs(settings.buffs) do
				local buffId, buffName = buffId, buffName
				self.options.args[status].args["delete_buff"].args[buffId] = {
					type = "execute",
					name = buffName,
					desc = string.format(L["Remove %s from the menu"], buffName),
					func = function() return self:DeleteBuff(status, buffId) end
				}
			end
		end
	end
end

function GridStatusMissingBuffs:AddBuffGroup(name)
	local status = statusForSpell(name)
	local desc = L["Buff Group: "]..name
	local buff = name
	local compactName = compactSpellName(name)

	self.db.profile[status] = {
		text = name,
		desc = desc,
		enable = true,
		buffs = {
			[compactName] = buff,
		},
		icon = compactName,
		priority = 90,
		range = false,
		color = { r = 0, g = 0, b = 1, a = 1 },
		classFilter = {},
		yourClassFilter = {},
		combat = false,
		dead = false,
		offline = false,
	}

	self:RegisterStatus(status, desc, self:GetBuffGroupOptions(status))
	self:CreateAddRemoveOptions()
end

function GridStatusMissingBuffs:DeleteBuffGroup(status)
	self:UnregisterStatus(status)
	self.options.args[status] = nil
	self.options.args["delete_buff_group"].args[status] = nil
	self.db.profile[status] = nil
	self:CreateAddRemoveOptions()
end

function GridStatusMissingBuffs:AddBuff(status, name)
	local buffId = statusForSpell(name)
	self.db.profile[status].buffs[buffId] = name
end

function GridStatusMissingBuffs:DeleteBuff(status, buffId)
	self.options.args[status].args["delete_buff"].args[buffId] = nil
	self.db.profile[status].buffs[buffId] = nil
end

function GridStatusMissingBuffs:UpdateAllUnits()
	for guid, unitid in GridRoster:IterateRoster() do
		self:UpdateUnit(unitid)
	end
end

function GridStatusMissingBuffs:UpdateUnit(unitid)
	self:Debug("Updating Unit", UnitName(unitid))
	local guid = UnitGUID(unitid)
	if not GridRoster:IsGUIDInRaid(guid) then
		return
	end

	for status in self:ConfiguredStatusIterator() do
		self:ShowMissingBuffs(unitid, status, guid)
	end
end

function GridStatusMissingBuffs:ShowMissingBuffs(unitid, status, guid)
	local settings = self.db.profile[status]

	if not settings.enable or
	   (not settings.combat and (UnitAffectingCombat("player") or UnitAffectingCombat(unitid))) or
	   (not settings.dead and UnitIsDeadOrGhost(unitid)) or
	   (not settings.offline and not UnitIsConnected(unitid)) or
	   (not settings.onself and (unitid == "player")) or
	   (not settings.onparty and not (unitid == "player") and UnitInParty(unitid)) or
	   (not settings.onraid and not (unitid == "player") and not UnitInParty(unitid) and UnitInRaid(unitid)) or
	   (settings.yourClassFilter[englishClass or ""] == false)
	then
		return self.core:SendStatusLost(guid, status)
	end

	local _, class = UnitClass(unitid)
	if settings.classFilter[class or ""] == false then
		return self.core:SendStatusLost(guid, status)
	end

	for buffId, buff in pairs(settings.buffs) do
		local name, rank, icon, count, debuffType, duration, expirationTime, caster, isStealable = UnitAura(unitid, buff, nil, "HELPFUL")
		if (name and count) then
			return self.core:SendStatusLost(guid, status)
		end
	end

	local tex = spellIconList[settings.icon] or GetSpellTexture(settings.buffs[settings.icon])

	self:Debug("gained", status)
	self.core:SendStatusGained(
		guid,
		status,
		settings.priority,
		(settings.range and 40),
		settings.color,
		settings.text,
		nil,
		nil,
		tex)
end


function GridStatusMissingBuffs:OnStatusEnable(status)
--	self:RegisterEvent("PLAYER_ENTERING_WORLD")
--	self:RegisterEvent("PLAYER_LEAVING_WORLD")
	self:RegisterEvent("PLAYER_ALIVE", "UpdateAllUnits")
	self:RegisterEvent("PLAYER_DEAD", "UpdateAllUnits")
	self:RegisterEvent("PLAYER_UNGHOST", "UpdateAllUnits")
	self:RegisterEvent("Grid_UnitJoined")

	self:RegisterEvent("UNIT_AURA", "UpdateUnit")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "UpdateAllUnits")
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "UpdateAllUnits")

	self:UpdateAllUnits()
end

function GridStatusMissingBuffs:OnStatusDisable(status)
	self.core:SendStatusLostAllUnits(status)
	self:UpdateAllUnits()

	if (self:EnabledStatusCount() == 0) then
--		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
--		self:UnregisterEvent("PLAYER_LEAVING_WORLD")
		self:UnregisterEvent("PLAYER_ALIVE", "UpdateAllUnits")
		self:UnregisterEvent("PLAYER_DEAD", "UpdateAllUnits")
		self:UnregisterEvent("PLAYER_UNGHOST", "UpdateAllUnits")
		self:UnregisterEvent("Grid_UnitJoined")

		self:UnregisterEvent("UNIT_AURA")
		self:UnregisterEvent("PLAYER_REGEN_ENABLED", "UpdateAllUnits")
		self:UnregisterEvent("PLAYER_REGEN_DISABLED", "UpdateAllUnits")
	end
end
