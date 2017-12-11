--[[
Name: LibGuildPositions-1.0
Revision: $Rev: 37 $
Author: Cameron Kenneth Knight (ckknight@gmail.com)
Website: http://www.wowace.com/
Description: Communicates with guild members for their positions on the world map
License: MIT
]]

local MAJOR_VERSION = "LibGuildPositions-1.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 37 $"):match("%d+")) or 0

-- #AUTODOC_NAMESPACE lib

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then
	return
end

local COMM_PREFIX = "LGP"

local _G = _G
local pairs = _G.pairs
local next = _G.next
local IsInGuild = _G.IsInGuild
local GetNumGuildMembers = _G.GetNumGuildMembers
local GetGuildRosterInfo = _G.GetGuildRosterInfo
local GetTime = _G.GetTime
local IsInInstance = _G.IsInInstance
local GetPlayerMapPosition = _G.GetPlayerMapPosition
local GetMapInfo = _G.GetMapInfo
local string_char = _G.string.char
local math_floor = _G.math.floor
local math_max = _G.math.max

local frame = lib.frame
if not frame then
	frame = _G.CreateFrame("Frame")
	lib.frame = frame
end
frame:UnregisterAllEvents()
frame:SetScript("OnUpdate", nil)
frame:SetScript("OnEvent", nil)
frame:Show()

local callbacks = lib.callbacks
if not callbacks then
	callbacks = LibStub("CallbackHandler-1.0"):New(lib)
	lib.callbacks = callbacks
end

if not lib.IsGCPFHooked then
--[[
	Hooking the OnShow, which registers the event, to unregister it so that
	the Guild Control Panel (for guildmasters) will not "reset" every 15
	seconds because this library performs GuildRoster() every 15 seconds.
]]
	hooksecurefunc("GuildControlPopupFrame_OnShow", function()
		GuildControlPopupFrame:UnregisterEvent("GUILD_ROSTER_UPDATE")
	end)
	lib.IsGCPFHooked = true
end

local guildieX = {}
local guildieY = {}
local guildieZone = {}
local guildieExpireTime = {}

local function iter(_, guildieName)
	local guildieName, x = next(guildieX, guildieName)
	if not guildieName then
		return nil
	end
	local y = guildieY[guildieName]
	local zone = guildieZone[guildieName]
	return guildieName, x, y, zone
end

--[[
Notes:
	x and y are in the range [0, 1]
	zone is the map texture that the guild member is in, not the localized name.
Returns:
	iterator that returns name, x, y, and zone
Example:
	for name, x, y, zone in LibStub("LibGuildPositions-1.0"):IterateGuildMembers() do
		-- do stuff here
	end
]]
function lib:IterateGuildMembers()
	return iter
end

--[[
Notes:
x and y are in the range [0, 1]
	zone is the map texture that the guild member is in, not the localized name.
Returns:
	x, y, zone - the horizontal position, vertical position, and map texture of the guild member. All nil if unknown or not on the map or offline.
Example:
	for name, x, y, zone in LibStub("LibGuildPositions-1.0"):GetPositionOfMember() do
		-- do stuff here
	end
]]
function lib:GetPositionOfMember(name)
	local x = guildieX[name]
	if x then
		return x, guildieY[name], guildieZone[name]
	else
		return nil, nil, nil
	end
end

local clear_byte = ("C"):byte()
local position_byte = ("P"):byte()

local numGuildies = 0

local nextGuildRoster = 0
_G.hooksecurefunc("GuildRoster", function()
	nextGuildRoster = GetTime() + 15
end)

local function SendMessage(data)
	_G.SendAddonMessage(COMM_PREFIX, data, "GUILD")
end

local events = {}

function events.ADDON_LOADED()
	if _G.ChatThrottleLib then
		local ChatThrottleLib = _G.ChatThrottleLib
		function SendMessage(data)
			ChatThrottleLib:SendAddonMessage("NORMAL", COMM_PREFIX, data, "GUILD", nil, MAJOR_VERSION)
		end
		frame:UnregisterEvent("ADDON_LOADED")
		events.ADDON_LOADED = nil
	end
end

local groupMembers = {}
_G.groupMembers = groupMembers

function events.RAID_ROSTER_UPDATE(event)
	local prefix, amount = "raid", GetNumRaidMembers()
	if amount == 0 then
		prefix, amount = "party", GetNumPartyMembers()
	end
	for k in pairs(groupMembers) do
		groupMembers[k] = nil
	end

	for i = 1, amount do
		local name, realm = UnitName(prefix .. i)
		if not realm or realm == "" then
			groupMembers[name] = true
			if guildieX[name] then
				guildieX[name] = nil
				guildieY[name] = nil
				guildieZone[name] = nil
				guildieExpireTime[name] = nil

				callbacks:Fire("Clear", name)
			end
		end
	end
end
events.PARTY_MEMBERS_CHANGED = events.RAID_ROSTER_UPDATE
events.PLAYER_LOGIN = events.RAID_ROSTER_UPDATE

local playerName = UnitName("player")
function events.CHAT_MSG_ADDON(event, prefix, message, distribution, sender)
	if prefix ~= COMM_PREFIX or distribution ~= "GUILD" or playerName == sender or groupMembers[sender] then
		return
	end
	
	local b = message:byte()
	if not b then
		return
	end

	if b == clear_byte then
		guildieX[sender] = nil
		guildieY[sender] = nil
		guildieZone[sender] = nil
		guildieExpireTime[sender] = nil
		
		callbacks:Fire("Clear", sender)
	elseif b == position_byte then
		local x_1, x_2, y_1, y_2, zone_len = message:byte(2, 6)
		if not zone_len then
			return
		end
		local x = ((x_1-1)*255 + (x_2-1)) / (255^2)
		local y = ((y_1-1)*255 + (y_2-1)) / (255^2)
		zone_len = zone_len-1
		local zone = message:sub(7, 6+zone_len)
		guildieX[sender] = x
		guildieY[sender] = y
		guildieZone[sender] = zone
		guildieExpireTime[sender] = GetTime() + 120
		
		callbacks:Fire("Position", sender, x, y, zone)
	end
end
function events.PLAYER_GUILD_UPDATE()
	if IsInGuild() then
		_G.GuildRoster()
	else
		numGuildies = 0
	end
end

local nextSpamTime
local safe = {}
function events.GUILD_ROSTER_UPDATE()
	if IsInGuild() then
		numGuildies = 0
		nextGuildRoster = GetTime() + 15
		for i = 1, GetNumGuildMembers(true) do
			local name, _, _, _, _, _, _, _, online = GetGuildRosterInfo(i)
			if online then
				safe[name] = true
				numGuildies = numGuildies + 1
			end
		end
	else
		numGuildies = 0
	end	
	for name in pairs(guildieX) do
		if not safe[name] then
			guildieX[name] = nil
			guildieY[name] = nil
			guildieZone[name] = nil
			guildieExpireTime[name] = nil
			
			callbacks:Fire("Clear", name)
		end
	end
	for name in pairs(safe) do
		safe[name] = nil
	end
	if not nextSpamTime then
		nextSpamTime = 0
	end
end

for event in pairs(events) do
	frame:RegisterEvent(event)
end
frame:SetScript("OnEvent", function(this, event, ...)
	events[event](event, ...)
end)

local clearedLast = false
local last_x, last_y, last_zone
local last_sendTime = 0
local nextOnUpdate = 0
frame:SetScript("OnUpdate", function(this, elapsed)
	local currentTime = GetTime()
	if nextOnUpdate > currentTime then
		return
	end
	nextOnUpdate = currentTime + 2
	
	if currentTime > nextGuildRoster then
		if _G.IsInGuild() then
			_G.GuildRoster()
		end
	end
	
	if nextSpamTime and currentTime > nextSpamTime then
		nextSpamTime = currentTime + math_max(10, numGuildies/4)
		
		if numGuildies >= 2 then -- yourself and someone else at least
			if IsInInstance() then
				if not clearedLast then
					clearedLast = true
					SendMessage(string_char(clear_byte))
				end
			else
				local x, y = GetPlayerMapPosition("player")
				local zone = GetMapInfo()
				if (x ~= last_x or y ~= last_y or zone ~= last_zone or last_sendTime < currentTime-90) and x ~= 0 and y ~= 0 and zone then
					last_x = x
					last_y = y
					last_zone = zone
					last_sendTime = currentTime
					x = math_floor(x * 255^2 + 0.5)
					y = math_floor(y * 255^2 + 0.5)
					local x_1 = math_floor(x / 255) + 1
					local x_2 = (x % 255) + 1
					local y_1 = math_floor(y / 255) + 1
					local y_2 = (y % 255) + 1
					clearedLast = false
					SendMessage(string_char(position_byte, x_1, x_2, y_1, y_2, #zone+1) .. zone)
				end
			end
		end
	end
	
	for name, time in pairs(guildieExpireTime) do
		if currentTime > time then
			guildieX[name] = nil
			guildieY[name] = nil
			guildieZone[name] = nil
			guildieExpireTime[name] = nil
			
			callbacks:Fire("Clear", name)
		end
	end
end)
