--------------------------------------------------------------------------------
-- Addon declaration
--------------------------------------------------------------------------------
-- #DEFAULT_NODOC

CastYeller = LibStub("AceAddon-3.0"):NewAddon("CastYeller", "AceConsole-3.0", "AceEvent-3.0")
local CastYeller = CastYeller

--------------------------------------------------------------------------------
-- Globals made local for performance
--------------------------------------------------------------------------------

local _G = _G
local pairs = _G.pairs
local ipairs = _G.ipairs
local next = _G.next
local select = _G.select
local type = _G.type

local GetChannelName = _G.GetChannelName
local UnitName = _G.UnitName
local UnitIsPlayer = _G.UnitIsPlayer
local UnitCastingInfo = _G.UnitCastingInfo
local UnitChannelInfo = _G.UnitChannelInfo
local IsInInstance = _G.IsInInstance
local IsRaidLeader = _G.IsRaidLeader
local IsRaidOfficer = _G.IsRaidOfficer
local GetSpellName = _G.GetSpellName
local GetSpellLink = _G.GetSpellLink
local GetSpellInfo = _G.GetSpellInfo
local GetItemInfo = _G.GetItemInfo

-- Slightly modified globals
local GetNumRaidMembers = function() return _G.GetNumRaidMembers() or 0 end
local GetNumPartyMembers = function() return _G.GetNumPartyMembers() or 0 end
local GetNumBattlefieldScores = function() return _G.GetNumBattlefieldScores() or 0 end
local IsPassiveSpell = IsPassiveSpell or IsSpellPassive

--------------------------------------------------------------------------------
-- Externals
--------------------------------------------------------------------------------

local L = LibStub("AceLocale-3.0"):GetLocale("CastYeller")

local AceEvent = LibStub("AceEvent-3.0")

--------------------------------------------------------------------------------
-- Locals
--------------------------------------------------------------------------------

local announces = {}
local spellDefaults = {}
local funnyAnnounces
local usedChannels = {}
local yellCooldown = {}
local undefinedCustomAlert = false
local playerName
local nameToAnnounce = {}
local events = {
	start = {},
	success = {},
	failure = {},
	miss = {},
}
--[[ Listed for localisation purpose:
	L['event-start'] L['event-success'] L['event-failure'] L['event-miss']
--]]

local getAnnounce, getAnnounceFunny
local funnyAnnounceCredits

local db

local blizzardOptionsFrame

--[===[@debug@
CastYeller.announces = announces
CastYeller.events = events
--@end-debug@]===]

--------------------------------------------------------------------------------
-- Local function declarations
--------------------------------------------------------------------------------
local validateAnnounce, setupCustomAnnounceOptions, refreshCustomAnnounceOptions

--------------------------------------------------------------------------------
-- Helpers
--------------------------------------------------------------------------------

local function erase(...)
	for i=1,select('#', ...) do
		local t = select(i, ...)
		local	mt = getmetatable(t)
		setmetatable(t, nil)
		for k in pairs(t) do
			t[k] = nil
		end
		setmetatable(t, mt)
	end
end

local new, del
do
	local list = setmetatable({}, {__mode='k'})
	function new(...)
		local t = next(list)
		if t then
			list[t] = nil
			for i = 1, select('#', ...) do
				t[i] = select(i, ...)
			end
			return t
		else
			return {...}
		end
	end
	function del(t)
		if type(t) == 'table' then
			setmetatable(t, nil)
			for k in pairs(t) do
				t[k] = nil
			end
			list[t] = true
		end
		return nil
	end
end

local function isInSet(set, value)
	for i = 1,#set do
		if set[i] == value then
			return i
		end
	end
	return false
end

local function removeFromSet(set, value)
	local index = isInSet(set, value)
	if index then
			table.remove(set, index)
	end
end

local function addToSet(set, value)
	if not isInSet(set, value) then
		table.insert(set, value)
	end
end

--------------------------------------------------------------------------------
-- Addon setup
--------------------------------------------------------------------------------

CastYeller.options = {
	handler = CastYeller,
	type = 'group',
	childGroups = 'tab',
	get = function(info)
		return db[info[#info]]
	end,
	set = function(info, v)
		db[info[#info]] = v
	end,
	args = {
		enable = {
			name = L['Enabled'],
			desc = L['Enable CastYeller.'],
			type = 'toggle',
			order = 100,
			get = 'IsEnabled',
			set = function(info, v)
				if v then
					CastYeller:Enable()
				else
					CastYeller:Disable()
				end
			end,
		},
		announces = {
			name = L['Announces'],
			desc = L['Set up active announces, events and channels.'],
			type = 'group',
			order = 110,
			args = {
				spell = {
					name = L['Spells to announce'],
					desc = L['Only events related to the selected spells are announced.'],
					type = 'multiselect',
					order = 110,
					values = 'GetSpellList',
					get = function(info, k)
						return db.spells[k]
					end,
					set = function(info, k, v)
						db.spells[k] = v
						CastYeller:SetupEvents()
					end,
				},
				channel = {
					name = L['Output channels'],
					desc = L['Announces are sent only to the selected channels.'],
					type = 'multiselect',
					order = 115,
					values = 'GetChannelList',
					get = function(info, k)
						return db.channels[k]
					end,
					set = function(info, k, v)
						db.channels[k] = v
						CastYeller:SetupEvents()
					end,
				},
				customChannel = {
					name = L['CHANNEL-chat'],
					desc = L['Enter the name of the custom channel if it is enabled.'],
					type = 'input',
					order = 120,
					width = 'double',
					pattern = '^%w+$',
					usage = L['<channelName>'],
					disabled = function() return not CastYeller:IsEnabled() or not db.channels.CHANNEL end,
					hidden = function() return not usedChannels.CHANNEL end,
				},
				event = {
					name = L['Events to announce'],
					desc = L['Only the selected events are announced.'],
					type = 'multiselect',
					order = 125,
					values = 'GetEventList',
					get = function(info, k)
						return db.events[k]
					end,
					set = function(info, k, v)
						db.events[k] = v
						CastYeller:SetupEvents()
					end,
				},
			},
		},
		misc = {
			name = L['Miscellaneous'],
			desc = L['Other settings'],
			type = 'group',
			order = 120,
			args = {
				instanceOnly = {
					name = L['Only in instance'],
					desc = L['Only announce spell cast in instance.'],
					type = 'toggle',
					order = 100,
					width = 'double',
				},
				noBattleground = {
					name = L['Not in battleground'],
					desc = L['Disable announces in battleground.'],
					type = 'toggle',
					order = 110,
					width = 'double',
				},
				funnyAnnounces = {
					name = L['Use funny announces'],
					desc = L['Enable the use of funny announces.'],
					type = 'toggle',
					order = 119,
					get = function() return funnyAnnounces and db.funnyAnnounces end,
					hidden = function() return not funnyAnnounces end,
					width = 'double',
				},
				funnyInfo = {
					type = 'description',
					order = 120,
					name = function() 
						if funnyAnnounces then
							return L["Funny announces provided by: %s"]:format(funnyAnnounceCredits or L["some anonymous people"])
						else
							return L['There is no funny announce for your class and locale yet. Feel free to contribute on the Wowace forums.']
						end
					end,
					hidden = function() return not funnyAnnounces end,
				},
				useSquareBrackets = {
					name = L['Use square brackets'],
					desc = L['Put square brackets around announce text to distinguish it from "normal" chatting.'],
					type = 'toggle',
					order = 130,
					width = 'double',
				},
				groupOverride = {
					name = L['Group destination'],
					desc = L['Choose where the group announces should be sent.'],
					type = 'select',
					order = 140,
					width = 'double',
					values = {
						guess = L["Guess: battleground, raid or party"],
						party = L["Always party"],
						raid = L["Always raid"],
					}
				}
			},
		},
		custom = {
			name = L['Custom Announces'],
			desc = L['Allow you to set up announces for any spell or item.'],
			type = 'group',
			order = 130,
			args = {
				add = {
					name = L['Add'],
					desc = L['Add a new custom announce'],
					usage = L['<name or link of a spell or an item>'],
					type = 'input',
					get = false,
					set = function(info, input) CastYeller:AddCustomAnnounce(input) end,
					validate = function(info, input) return CastYeller:ValidateNewCustomText(input) end,
					order = -10,
				},
			}
		},
	}
}

--[===[@debug@
LibStub('LibDebugLog-1.0'):Embed(CastYeller)
CastYeller.options.args.debug = LibStub('LibDebugLog-1.0'):GetAce3OptionTable(CastYeller)
--@end-debug@]===]
--@non-debug@
CastYeller.Debug = function() end
CastYeller.IsDebugLogEnabled = function() return false end
--@end-non-debug@

--------------------------------------------------------------------------------
-- Constants
--------------------------------------------------------------------------------

-- Announce conditions
local conditions = {
	combat       = function() return UnitAffectingCombat('player') end,
	party        = function() return GetNumPartyMembers() > 0 end,
	raid         = function() return GetNumRaidMembers() > 0 end,
	battleground = function() return GetNumBattlefieldScores() > 0 end,
	instance     = function()
		local inInstance, iType = IsInInstance()
		return inInstance and (iType == 'party' or iType == 'raid')
	end,
	debug        = function() return CastYeller:IsDebugLogEnabled() end
}
--[[ Listed for localisation purpose:
	L['condition-combat'] L['condition-party'] L['condition-raid'] L['condition-battleground'] L['condition-instance'] L['condition-debug'] L['condition-always']
--]]

-- Announce channels
local channels
channels = {
	EMOTE        = true,
	BATTLEGROUND = true,
	PARTY        = true,
	RAID         = true,
	CHANNEL      = true,
	WHISPER      = true,
	YELL         = true,
	SAY          = true,
	RAID_WARNING = true,
	_DEBUG       = true,

	_BROADCAST    = { '_DEBUG', '_CHANNEL', '_GROUP', 'YELL', 'SAY', '_RAID_WARNING' },
	_PARTY_BROADCAST    = { '_DEBUG', '_CHANNEL', '_PARTY', 'YELL', 'SAY' },

	_CHANNEL      = function()
		local success, id = pcall(GetChannelName, db.customChannel)
		if success and id and id > 0 then
			return 'CHANNEL', id
		else
			if db.channels.CHANNEL and not undefinedCustomAlert then
				-- Warn one time
				CastYeller:Print(L['Please define a custom channel or disable custom channel announces.'])
				undefinedCustomAlert = true
			end
			CastYeller:Debug('<_CHANNEL> Undefined channel %q', db.customChannel)
		end
	end,

	_WHISPER     = function(_, channel, target)
		local success, result = pcall(UnitExists, target)
		if success and result and UnitIsPlayer(target) and not UnitIsUnit(target, 'player') then
			return 'WHISPER', target
		else
			CastYeller:Debug('<%s> Cannot whisper to %q', channel, target)
		end
	end,
	
	_BATTLEGROUND = function(_, channel)
		if GetNumBattlefieldScores() > 0 then
			return 'BATTLEGROUND'
		else
			CastYeller:Debug('<%s> Not in battleground', channel)
		end
	end,

	_PARTY = function(_, channel)
		if GetNumPartyMembers() > 0 then
			return 'PARTY'
		else
			CastYeller:Debug('<%s> Not in party', channel)
		end
	end,

	_RAID = function(_, channel)
		if GetNumRaidMembers() > 0 then
			return 'RAID'
		else
			CastYeller:Debug('<%s> Not in raid', channel)
		end
	end,

	_RAID_WARNING = function()
		if GetNumPartyMembers() > 0 and (GetNumRaidMembers() == 0 or IsRaidLeader() or IsRaidOfficer()) then
			return 'RAID_WARNING'
		else
			CastYeller:Debug('<_RAID_WARNING> Not in party/raid or not raid leader/assistant')
		end
	end,

	_GROUP = function(...)
		local override = db.groupOverride
		if override == 'guess' then
			return channels._BATTLEGROUND(...) or channels._RAID(...) or channels._PARTY(...)
		elseif override == 'raid' then
			return channels._RAID(...)
		else
			return channels._PARTY(...)
		end
	end,
}
--[[ Listed for localisation purpose:
	L['BATTLEGROUND-chat'] L['PARTY-chat'] L['RAID-chat'] L['CHANNEL-chat'] L['WHISPER-chat']
	L['YELL-chat'] L['SAY-chat'] L['RAID_WARNING-chat'] L['_DEBUG-chat'] L['_BROADCAST-chat']
	L['_PARTY_BROADCAST-chat'] L['_CHANNEL-chat'] L['_WHISPER-chat'] L['_PARTY-chat'] L['_RAID-chat']
	L['_RAID_WARNING-chat'] L['_GROUP-chat']
--]]

-- Translate channel key to effective list of potential channels
local flatChannels = {
	EMOTE        = true,
	BATTLEGROUND = true,
	PARTY        = true,
	RAID         = true,
	CHANNEL      = true,
	WHISPER      = true,
	YELL         = true,
	SAY          = true,
	RAID_WARNING = true,
	_CHANNEL      = { 'CHANNEL' } ,
	_WHISPER      = { 'WHISPER' } ,
	_BROADCAST    = { 'CHANNEL', 'BATTLEGROUND', 'PARTY', 'RAID', 'YELL', 'SAY', 'RAID_WARNING' },
	_PARTY_BROADCAST = { 'CHANNEL', 'BATTLEGROUND', 'PARTY', 'YELL', 'SAY' },
	_PARTY        = { 'PARTY' },
	_RAID         = { 'RAID' },
	_RAID_WARNING = { 'RAID_WARNING' },
	_GROUP        = { 'BATTLEGROUND', 'PARTY', 'RAID' },
}

-- Channels available for custom announces
local customAnnounceChannels = {
	EMOTE            = true,
	_BROADCAST       = true,
	_PARTY_BROADCAST = true,
	_WHISPER         = true,
	_CHANNEL         = true,
}

-- Failure you don't want to announce
local ignoreFailures = {
	[SPELL_FAILED_NOT_STANDING] = true,
	[SPELL_FAILED_NOTHING_TO_DISPEL] = true,
}

-- Basic announces
local basicAnnounces = {
	["*ANYSPELL*"]         = L["*ANYSPELL*"],
	["WHISPER:*ANYSPELL*"] = L["WHISPER:*ANYSPELL*"],
	["EMOTE:*ANYSPELL*"]   = L["EMOTE:*ANYSPELL*"],
	["failure:*ANYSPELL*"] = L["failure:*ANYSPELL*"],
	["miss:*ANYSPELL*"]    = L["miss:*ANYSPELL*"],
}

-- Minimum delay (in seconds) between two announces about the same event of the same spell
local YELL_COOLDOWN = 6

--------------------------------------------------------------------------------
-- Addon initializing and enabling
--------------------------------------------------------------------------------

function CastYeller:RegisterAnnounces(newAnnounces)
	for id, announce in pairs(newAnnounces) do
		if validateAnnounce(id, announce) then
			announces[id] = announce
			spellDefaults[announce.key] = not announce.defaultDisabled
		end
	end
	newAnnounces = del(newAnnounces)
end

function CastYeller:RegisterFunnyAnnounces(newAnnounces)
	if not funnyAnnounces then
		funnyAnnounces = new()
		getAnnounce = getAnnounceFunny
	end

	for k, v in pairs(newAnnounces) do
		if k == '__credit' then
			if funnyAnnounceCredits then
				funnyAnnounceCredits = funnyAnnounceCredits .. ", " .. v
			else
				funnyAnnounceCredits = v
			end
		else
			funnyAnnounces[k] = v
		end
	end
	
	newAnnounces = del(newAnnounces)
end

function CastYeller:OnInitialize()
	spellDefaults['*'] = true

	self.db = LibStub("AceDB-3.0"):New("DuowanAddon_CastYellerDB", {
		profile = {
			instanceOnly      = false,
			noBattleground    = true,
			funnyAnnounces    = true,
			useSquareBrackets = true,
			groupOverride     = 'guess',
			events           = {
				['*'] = true
			},
			channels         = {
				EMOTE         = true,
				BATTLEGROUND  = true,
				PARTY         = true,
				RAID          = true,
				WHISPER       = true,
				CHANNEL       = false,
				YELL          = false,
				SAY           = false,
				RAID_WARNING  = false,
			},
			debug = false,
			spells = spellDefaults,
			customAnnounces = {
				['**'] = {
					custom = true,
				},
			},
		}
	})

	-- Set up upvalues
	playerName = UnitName('player')

	-- Register options and chat commands
	LibStub("AceConfig-3.0"):RegisterOptionsTable(self.name, self.options)
	self:RegisterChatCommand("cy", "ChatCommand")
	self:RegisterChatCommand("castyeller", "ChatCommand")
	--blizzardOptionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.name, self.name)

	-- Register profile options
	local profile_opts = LibStub('AceDBOptions-3.0'):GetOptionsTable(self.db)
	profile_opts.order = -10
	self.options.args.profile = profile_opts

	-- Create the LDB launcher
	LibStub('LibDataBroker-1.1'):NewDataObject(self.name, {
		type = 'launcher',
		icon = 'Interface\\Icons\\Ability_Warrior_BattleShout',
		OnClick = function() self:OpenGUI() end,
		tooltiptext = select(2, GetAddOnInfo(self.name))
	})

	setupCustomAnnounceOptions()
	self:LoadProfile()
end
-----------------------
-- Duowan Interface
function CastYeller_OpenConfig()
	CastYeller:OpenGUI();
end

local castyeller_enable = false;
function CastYeller:Toggle(switch)
	if (switch) then
		if (not castyeller_enable) then
			castyeller_enable = true;
			self:RegisterEvent('SPELLS_CHANGED', 'UpdateNameMap')
			self:UpdateNameMap();
			refreshCustomAnnounceOptions();
			self:SetupEvents();
		end
	else
		if (castyeller_enable) then
			castyeller_enable = false;
			self:UnregisterAllEvents()
		end
	end
end

function CastYeller:LoadProfile()
	-- Update our upvalue
	db = self.db.profile

	-- Drop surely-outdated custom announces
	for id,announce in pairs(announces) do
		if announce.custom then
			if announce.name then
				nameToAnnounce[announce.name] = nil
			end
			announces[id] = nil
		end
	end

	-- Copy custom announces to common announce table
	for id, announce in pairs(db.customAnnounces) do
		if validateAnnounce(id, announce) then
			announces[id] = announce
		else
			db.customAnnounces[id] = nil
		end
	end

	self:UpdateNameMap()
	refreshCustomAnnounceOptions()
end

function CastYeller:OnDatabaseShutdown()
	-- Cleanup custom announces content
	for id,announce in pairs(db.customAnnounces) do
		announce.key = nil
		announce.name = nil
		announce.isSpell = nil
		announce.itemId = nil
		announce.IsKnown = nil
	end
end

function CastYeller:OnEnable()
	self.db.RegisterCallback(self, "OnNewProfile", "LoadProfile")
	self.db.RegisterCallback(self, "OnProfileChanged", "LoadProfile")
	self.db.RegisterCallback(self, "OnProfileCopied", "LoadProfile")
	self.db.RegisterCallback(self, "OnProfileReset", "LoadProfile")
	self.db.RegisterCallback(self, "OnDatabaseShutdown")
end

function CastYeller:OpenGUI()
	--if blizzardOptionsFrame then
	--	InterfaceOptionsFrame_OpenToCategory(blizzardOptionsFrame)
	--else
		LibStub("AceConfigDialog-3.0"):Open(self.name)
	--end
end

function CastYeller:ChatCommand(input)
	if not input or input:trim() == "" then
		self:OpenGUI()
	else
		LibStub("AceConfigCmd-3.0").HandleCommand(self, "cy", self.name, input)
	end
end

--------------------------------------------------------------------------------
-- Setup event listening
--------------------------------------------------------------------------------

do
	local unmappedAnnounces = {}

	function CastYeller:UpdateNameMap()
		for id,announce in pairs(announces) do
			if not announce.name and not unmappedAnnounces[id] then
				self:Debug('Looking for %s', id)
				unmappedAnnounces[id] = announce
			end
		end

		-- Nothing to look for
		if not next(unmappedAnnounces) then
			return
		end

		-- Look for unmapped announces
		local changed = false
		for id, announce in pairs(unmappedAnnounces) do
			local name
			if announce.isSpell then
				for rankNum,rankId in ipairs(announce.ranks) do
					name = GetSpellInfo(rankId)
					if name then
						break
					end
				end
			else
				name = GetItemInfo(announce.itemId)
			end
			if name then
				announce.name = name
				unmappedAnnounces[id] = nil
				nameToAnnounce[name] = announce
				changed = true
			end
		end

		if changed then
			refreshCustomAnnounceOptions()
			self:SetupEvents()
		end
	end
end

do
	local function usesChannel(channel)
		if type(channel) == 'table' then
			for i,channel in ipairs(channel) do
				usesChannel(channel)
			end
		elseif flatChannels[channel] ~= true then
			return usesChannel(flatChannels[channel])
		end

		usedChannels[channel] = true
	end

	function CastYeller:SetupEvents()
		erase(usedChannels)
		for event in pairs(events) do
			erase(events[event])
		end

		local anySpell = false
		for name, announce in pairs(nameToAnnounce) do
			if announce:IsKnown() and db.spells[announce.key] then
				for event in pairs(announce.events) do
					anySpell = true
					events[event][name] = announce
				end
				usesChannel(announce.channel)
			else
				self:Debug('Unknown: %q', name)
			end
		end

		if anySpell then
			self:RegisterEvent("UNIT_SPELLCAST_SENT")
			self:RegisterEvent("UNIT_SPELLCAST_START")
			self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
			self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
			self:RegisterEvent("UNIT_SPELLCAST_STOP", "ClearSpellCast")
			self:RegisterEvent("UNIT_SPELLCAST_FAILED", "ClearSpellCast")
			self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", "ClearSpellCast")
			self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", "ClearSpellCast")
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		else
			self:UnregisterEvent("UNIT_SPELLCAST_SENT")
			self:UnregisterEvent("UNIT_SPELLCAST_START")
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START")
			self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
			self:UnregisterEvent("UNIT_SPELLCAST_STOP")
			self:UnregisterEvent("UNIT_SPELLCAST_FAILED")
			self:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED")
			self:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_STOP")
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		end
	end
end

--------------------------------------------------------------------------------
-- Announce stuff
--------------------------------------------------------------------------------

local function checkConditions(self, condTable, spell, target)
	for i,cond in pairs(condTable) do
		local reverse = false
		if cond:match('^no(.+)$') then
			reverse, cond = true, cond:match('^no(.+)$')
		end
		local result = conditions[cond](spell, target) and true or false
		if result == reverse then
			self:Debug('Condition %s failed (%q, should be %q)', cond, result, not reverse)
			return false
		end
	end
	return true
end

local function additionnalTags(...)
	local pClass = select(2,UnitClass('player'))
	if (pClass == 'HUNTER' or pClass == 'WARLOCK') and UnitExists('pet') then
		return 'PET', UnitName('pet'), ...
	end
	return ...
end

local function notEmptyString(text)
	return type(text) == 'string' and text:trim():len() > 0 and text
end

local function formatAnnounce(text, ...)
	for i = 1,select('#', ...),2 do
		local key, value = select(i, ...)
		if notEmptyString(value) then
			text = text:gsub('%[(.-)%$%{'..key..'%}(.-)#.-%]', '%1'..value..'%2')
			text = text:gsub('%[(.-)%$%{'..key..'%}(.-)%]', '%1'..value..'%2')
			text = text:gsub('%$'..key, value)
 		end
	end
	text = text:gsub('%[.-%$%{%a+%}.-#(.-)%]', '%1')
	text = text:gsub('%[.-%$%{%a+%}.-%]', '')
	text = text:gsub('%$%a+', '')
	return text
end

function getAnnounceBasic(self, spell, event, target, channel)
	return basicAnnounces[('%s:*ANYSPELL*'):format(event)]
	    or basicAnnounces[('%s:*ANYSPELL*'):format(channel)]
	    or basicAnnounces['*ANYSPELL*']
end

function getAnnounceFunny(self, spell, event, target, channel)
	if not db.funnyAnnounces then
		return getAnnounceBasic(self, spell, event, target, channel)
	else
		return funnyAnnounces[('%s:%s:%s'):format(channel, event, spell)]
		    or funnyAnnounces[('%s:%s'):format(event, spell)]
		    or basicAnnounces[('%s:*ANYSPELL*'):format(event)]
	      or funnyAnnounces[('%s:%s'):format(channel, spell)]
		    or basicAnnounces[('%s:*ANYSPELL*'):format(channel)]
		    or funnyAnnounces[spell]
		    or basicAnnounces['*ANYSPELL*']
	end
end

-- Use basic announces by default
getAnnounce = getAnnounceBasic

local expandedChannel = {}
local seenChannel = {}

local function expandChannel(self, channel, sendTarget)
	if not channel then
		self:Debug("No channel Oo'")
	end

	if seenChannel[channel] then
		self:Debug("<%s> Already seen", channel)
		return
	else
		seenChannel[channel] = true
	end

	if type(channel) == 'table' then
		self:Debug('<%s> Announcing to: %s', channel, table.concat(channel, ','))
		for i,subChannel in pairs(channel) do
			expandChannel(self, subChannel, sendTarget)
		end

	elseif flatChannels[channel] == true and not db.channels[channel] then
		self:Debug('<%s> Disabled', channel)

	elseif type(channels[channel]) == 'function' then
		local newChannel, newSendTarget = channels[channel](target, channel, sendTarget)
		if newChannel then
			self:Debug('<%s> Redirecting to : %s', channel, newChannel)
			return expandChannel(self, newChannel, newSendTarget or sendTarget)
		end

	elseif type(channels[channel]) == 'table' then
		self:Debug('<%s> Broadcasting to: %s', channel, table.concat(channels[channel], ','))
		for i,subChannel in pairs(channels[channel]) do
			expandChannel(self, subChannel, sendTarget)
		end

	else
		expandedChannel[channel] = sendTarget or true
	end
end


local function sendAnnounce(self, channel, target, spell, key, event, ...)
	expandChannel(self, channel, target)
	erase(seenChannel)
	if not next(expandedChannel) then
		return
	end
	yellCooldown[event..':'..key] = GetTime() + YELL_COOLDOWN

	for realChannel,sendTarget in pairs(expandedChannel) do
		local text = getAnnounce(self, key, event, target, realChannel)
		if type(text) == 'table' then
			text = text[math.random(1,#text)]
		end
		text = formatAnnounce(text, 'SPELL', spell, 'TARGET', (realChannel == 'WHISPER' and L['you'] or target), 'REALTARGET', target, 'PLAYER', playerName, ...)
		if notEmptyString(text) then
			if db.useSquareBrackets and realChannel ~= 'EMOTE' then
				text = '<<< '..text..' >>>'
			end
			self:Debug('<%s> Send announce: %q', realChannel, text)
			if realChannel ~= '_DEBUG' then
				SendChatMessage(text, realChannel, nil, (realChannel == 'CHANNEL' or realChannel == 'WHISPER') and sendTarget or nil)
			end
		else
			self:Debug('<%s> Empty announce', realChannel)
		end
	end

	erase(expandedChannel)
end

function CastYeller:Yell(name, target, event, ...)
	local announce = events[event] and events[event][name]
	if not announce then
		return
	end
	local key = announce.key

	self:Debug('Spell event : %s for %s', event, key)

	if db.instanceOnly and not conditions.instance() then
		return self:Debug('Announces only in instances')

	elseif db.noBattleground and conditions.battleground() then
		return self:Debug('No announces in battleground')

	elseif not db.spells[key] then
		return self:Debug('%s announces are disabled', key)

	elseif not self.dev and announce.conditions and not checkConditions(self, announce.conditions, name, target) then
		return

	elseif yellCooldown[event..':'..key] and yellCooldown[event..':'..key] > GetTime() then
		return self:Debug('%s %s announces are cooled down', key, event)

	end

	return sendAnnounce(self, announce.channel, target, name, key, event, additionnalTags(...))
end

--------------------------------------------------------------------------------
-- Spell event handlers
--------------------------------------------------------------------------------

do
	local spellName, spellType, spellTarget

	function CastYeller:UNIT_SPELLCAST_SENT(event, unit, name, rank, target)
		if unit == "player" and name then
			spellName, spellTarget, spellType = name, target, 'instant'
			local announce = nameToAnnounce[name]
			if announce and announce.usePlayerTarget then
				spellTarget = UnitName('target')
			end
		end
	end

	function CastYeller:UNIT_SPELLCAST_START(event, unit, name)
		if unit == "player" and spellName == name then
			spellType = 'cast'
			self:Yell(spellName, spellTarget, 'start')
		end
	end

	function CastYeller:UNIT_SPELLCAST_CHANNEL_START(event, unit, name)
		if unit == "player" and spellName == name then
			spellType = 'channel'
		end
	end

	function CastYeller:UNIT_SPELLCAST_SUCCEEDED(event, unit, name)
		if unit == "player" and spellName == name then
			self:Yell(spellName, spellTarget, spellType == 'channel' and 'start' or 'success')
		end
	end

	local logToEventTypes = {
		RANGE_MISSED = 'miss',
		SPELL_MISSED = 'miss',
		SPELL_PERIODIC_MISSED = 'miss',
		SPELL_CAST_FAILED = 'failure',
		RANGE_CAST_FAILED = 'failure',
	}

	function CastYeller:COMBAT_LOG_EVENT_UNFILTERED(event, ...)
		local _, eventType, _, _, srcFlags, _, dstName, _, _, spellName, _, reason = ...
		if srcFlags == COMBATLOG_FILTER_ME and logToEventTypes[eventType] then
			local msg = logToEventTypes[eventType]
			if msg == 'failure' and ignoreFailures[reason] then
				return
			end
			--self:Debug(event, eventType, spellName, dstName, msg, reason)
			return self:Yell(spellName, dstName, msg, 'REASON', reason)
		end
		if eventType:match('_INTERRUPT$') and self:IsDebugLogEnabled() then
			self:Debug(event, ...)
		end
	end

	function CastYeller:ClearSpellCast(event, unit, spell)
		if unit == "player" and spell == spellName then
			spellName, spellType, spellTarget = nil
		end
	end

end

--------------------------------------------------------------------------------
-- Options handling
--------------------------------------------------------------------------------

local function channelDisplayName(channel)
	return _G[channel..'_MESSAGE'] or L[channel..'-chat']
end

local function eventDisplayName(event)
	return L["event-"..event] or event
end

local function conditionDisplayName(condition)
	return L["condition-"..condition] or condition
end

do
	local spellList = {}
	function CastYeller:GetSpellList()
		erase(spellList)
		for name, announce in pairs(nameToAnnounce) do
			if announce:IsKnown() and not spellList[announce.key] then
				spellList[announce.key] = announce.custom and L["%s (Custom)"]:format(name) or name
			end
		end
		return spellList
	end
end

do
	local channelList = {}
	function CastYeller:GetChannelList()
		erase(channelList)
		for k in pairs(channels) do
			if usedChannels[k] then
				channelList[k] = channelDisplayName(k)
			end
		end
		return channelList
	end
end

do
	local eventList = {}
	function CastYeller:GetEventList()
		erase(eventList)
		for k,v in pairs(events) do
			if next(v) then
				eventList[k] = L['event-'..k]
			end
		end
		return eventList
	end
end

--------------------------------------------------------------------------------
-- Custom announce options handling
--------------------------------------------------------------------------------

local customAnnounceHandler = {}
local customAnnounceOptions = {
	type = 'group',
	handler = customAnnounceHandler,
	name = function(info)
		return announces[info[#info]].name
	end,
	args = {
		events = {
			name = L["Watched events"],
			desc = L["What casting events should trigger an announce."],
			type = 'multiselect',
			order = 100,
			values = {},
			get = 'IsEnabledForEvent',
			set = 'ToggleEvent',
		},
		conditions = {
			name = L["Restrictions"],
			desc = L["Restrict when the announce should be sent.\nNo restrictions means 'always'."],
			type = 'multiselect',
			order = 110,
			values = {},
			get = 'IsConditionChecked',
			set = 'ToggleCondition',
		},
		channels = {
			name = L["Destination channels"],
			desc = L["Where this announce should be send to."],
			type = 'multiselect',
			order = 120,
			values = {},
			get = 'IsChannelEnabled',
			set = 'ToggleChannel',
		},
		remove = {
			name = L["Remove"],
			desc = L["Definitively remove this announce."],
			type = 'execute',
			func = 'Remove',
			confirm = true,
			order = -10,
		},
	},
}

function setupCustomAnnounceOptions()
	local opts

	-- Events for custom announce
	opts = customAnnounceOptions.args.events.values
	for event in pairs(events) do
		opts[event] = L['event-'..event]
	end

	-- Conditions of custom announce
	opts = customAnnounceOptions.args.conditions.values
	for condition in pairs(conditions) do
		opts[condition] = L['condition-'..condition]
	end

	-- Channels of custom announce
	opts = customAnnounceOptions.args.channels.values
	for channel in pairs(customAnnounceChannels) do
		opts[channel] = channelDisplayName(channel)
	end
end

function refreshCustomAnnounceOptions()
	local options = CastYeller.options.args.custom.args

	-- Add missing custom announce options
	for id, announce in pairs(announces) do
		if announce.custom and not options[id] then
			options[id] = customAnnounceOptions
		end
	end

	-- Remove old custom announce options
	for id, group in pairs(options) do
		if id ~= 'add' and not (announces[id] and announces[id].custom) then
			options[id] = nil
		end
	end
end

local function guessAnnounceInfo(text)
	local id, name = nil, nil, nil
	local success, link = pcall(GetSpellLink, text)
	if success and link then
		id = link:match('spell:(%d+)')
		return 'spell-'..id, GetSpellInfo(id)
	end
	success, name, link = pcall(GetItemInfo, text)
	if name then
		return 'item-'..link:match('item:(%d+)'), name
	end
end

function CastYeller:ValidateNewCustomText(text, ...)
	local id, name = guessAnnounceInfo(text)
	if not id then
		return false
	end
	return announces[id] and L['There already is a announce for %s.']:format(name) or true
end

function CastYeller:AddCustomAnnounce(text, ...)
	local id, name = guessAnnounceInfo(text)
	self:Debug('AddCustomAnnounce', text, id, ...)

	local announce = new()
	announce.custom = true
	announce.events = new()
	for e in pairs(events) do
		announce.events[e] = true
	end
	announce.channel = new()
	table.insert(announce.channel, '_BROADCAST')

	validateAnnounce(id, announce)

	announce.name = name

	db.customAnnounces[announce.key] = announce
	db.spells[announce.key] = true
	announces[announce.key] = announce
	nameToAnnounce[announce.name] = announce

	refreshCustomAnnounceOptions()
	self:SetupEvents()
end

function CastYeller:RemoveCustomAnnounce(id)
	local announce = db.customAnnounces[id]
	if not announce then return end
	announces[announce.key] = nil
	if announce.name then
		nameToAnnounce[announce.name] = nil
	end
	db.spells[announce.key] = nil
	db.customAnnounces[announce.key] = del(db.customAnnounces[announce.key])

	refreshCustomAnnounceOptions()
	self:SetupEvents()
end

local function getCustomAnnounceData(info)
	local spell = info[#info-1]
	return spell, db.customAnnounces[spell]
end

function customAnnounceHandler:IsEnabledForEvent(info, event)
	local spell, announce = getCustomAnnounceData(info)
	return announce.events[event] and true or false
end

function customAnnounceHandler:ToggleEvent(info, event, v)
	local spell, announce = getCustomAnnounceData(info)
	announce.events[event] = v and true or nil
	CastYeller:SetupEvents()
end

function customAnnounceHandler:IsConditionChecked(info, condition)
	local spell, announce = getCustomAnnounceData(info)
	local conditions = announce.conditions
	return conditions and isInSet(conditions, condition)
end

function customAnnounceHandler:ToggleCondition(info, condition, v)
	local spell, announce = getCustomAnnounceData(info)
	local conditions = announce.conditions
	if v then
		if not conditions then
			conditions = new()
		end
		addToSet(conditions, condition)
	else
		removeFromSet(conditions, condition)
		if #conditions == 0 then
			conditions = del(conditions)
		end
	end
	announce.conditions = conditions
end

function customAnnounceHandler:IsChannelEnabled(info, channel)
	local spell, announce = getCustomAnnounceData(info)
	return isInSet(announce.channel, channel)
end

function customAnnounceHandler:ToggleChannel(info, channel, v)
	local spell, announce = getCustomAnnounceData(info)
	if v then
		addToSet(announce.channel, channel)
	else
		removeFromSet(announce.channel, channel)
	end
end

function customAnnounceHandler:Remove(info)
	return CastYeller:RemoveCustomAnnounce(getCustomAnnounceData(info))
end

--------------------------------------------------------------------------------
-- Validate announce data
--------------------------------------------------------------------------------

do
	local error = error
	local currentId
	local function _error(msg)
		error(currentId..': '..msg, 3)
		return false
	end

	local function isKnownSpell(announce)
		return announce.name and GetSpellName(announce.name)
	end

	local function isKnownItem(announce)
		return announce.name
	end

	function validateAnnounce(id, announce) -- it's already local
		currentId = id

		if type(announce.events) ~= 'table' or not next(announce.events) then
			return _error('.events is mandatory and should be a table')
		end
		for event,value in pairs(announce.events) do
			if type(event) ~= 'string' or not events[event] then
				return _error(string.format('invalid event: %q', tostring(event)))
			elseif type(value) ~= 'string' and type(value) ~= 'table' and value ~= true then
				return _error('invalid event data, should be a string, a table of strings or true')
			end
		end

		if announce.conditions then
			if type(announce.conditions) == 'string' then
				announce.conditions = { announce.conditions }
			elseif type(announce.conditions) ~= 'table' then
				return _error('.conditions should be a table of strings')
			end
			for i,c in ipairs(announce.conditions) do
				if type(c) ~= 'string' then
					return _error('.conditions should be a table of strings')
				end
				if c:match('^no(.*)$') then
					c = c:match('^no(.*)$')
				end
				if not conditions[c] then
					return _error('condition '..c..' does not exist')
				end
			end
		end

		if announce.channel then
			if type(announce.channel) == 'table' then
				for i,c in ipairs(announce.channel) do
					if type(c) ~= 'string' then
						return _error('.channel should be a string or table of strings')
					end
					if not channels[c] then
						return _error('channel '..c..' does not exist')
					end
				end
			elseif type(announce.channel) == 'string' then
				announce.channel = new(announce.channel)
			else
				return _error('channel should be a string or a table of strings')
			end
		else
			return _error('.channel is mandatory')
		end

		announce.key = announce.group or id
		announce.isSpell = id:match('^spell%-%d+$') and true or false
		if announce.isSpell then
			announce.ranks = announce.ranks or { tonumber(id:match('%d+')) }
			announce.IsKnown = announce.IsKnown or isKnownSpell
		else
			announce.itemId = tonumber(id:match('%d+'))
			announce.IsKnown = announce.IsKnown or isKnownItem
		end

		return true
	end
end