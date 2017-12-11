local MAJOR_VERSION = "LibGuild-1.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 30 $"):match("%d+")) or 0

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local BZ

local IsInGuild = IsInGuild
local GuildRoster = GuildRoster
local select = select
local next = next

local new, del, clear, doAll
do
	local cache = {}
	function new(...)
		local t = next(cache)
		if t then
			cache[t] = nil
			for i = 1, select('#', ...) do
				t[i] = select(i, ...)
			end
			return t
		else
			return { ... }
		end
	end
	function del(t)
		for k in pairs(t) do
			t[k] = nil
		end
		cache[t] = true
		return nil
	end
	function clear(t)
		for k in pairs(t) do
			t[k] = nil
		end
		return nil
	end
	function doAll(func, ...)
		for i=1, select('#', ...) do
			func(select(i, ...))
		end
	end
end

local frame
if lib.frame then
	frame = lib.frame
	frame:UnregisterAllEvents()
	frame:SetScript("OnEvent", nil)
	frame:SetScript("OnUpdate", nil)
else
	frame = CreateFrame("Frame", MAJOR_VERSION .. "_Frame")
	lib.frame = frame
end

frame:SetScript("OnEvent", function(this, event, ...)
	this[event](lib, ...)
end)

local timeSoFar = 0
frame:SetScript("OnUpdate", function(this, timeSinceLast)
	timeSoFar = timeSoFar + timeSinceLast
	if timeSoFar > 15 then
		timeSoFar = 0
		GuildRoster()
	end
end)

local CallbackHandler = LibStub:GetLibrary("CallbackHandler-1.0")
if lib.callbacks then
	lib:UnregisterAll(lib)
else
	lib.callbacks = LibStub("CallbackHandler-1.0"):New(lib, nil, nil, "UnregisterAll")
end

frame:RegisterEvent("PLAYER_GUILD_UPDATE")
frame:RegisterEvent("GUILD_ROSTER_UPDATE")

local players = {}
local playersOnline = {}
local playerOfflineTimes = {}
local playerRanks = {}
local playerRankIndexes = {}
local playerLevels = {}
local playerClasses = {}
local playerClassesEnglish = {}
local playerZones = {}
local playerStatuses = {}
local playerNotes = {}
local playerOfficerNotes = {}
local numPlayersOnline = 0
local numPlayersTotal = 0
local guildLeader = nil
local firstScanDone = false

-- Hooking the OnShow, which registers the event, to unregister it
-- so that the Guild Control Panel will not "reset" every 15 seconds
hooksecurefunc("GuildControlPopupFrame_OnShow", function()
	GuildControlPopupFrame:UnregisterEvent("GUILD_ROSTER_UPDATE")
end)

function frame:PLAYER_GUILD_UPDATE(unit)
	if unit and unit ~= 'player' then return end
	
	if IsInGuild() then
		-- We just joined a guild!
		frame:Show()
		GuildRoster()
		lib.callbacks:Fire("Joined")
	else
		frame:Hide()
		frame:GUILD_ROSTER_UPDATE()
		lib.callbacks:Fire("Left")
	end
end

local playersOnlineOld, playersOld, playerLevelsOld = {}, {}, {}
function frame:GUILD_ROSTER_UPDATE()
	timeSoFar = 0 -- in case other things than our repeater are prompting this
	if not IsInGuild() then
		doAll(clear,
			players, playersOnline, playerOfflineTimes, playerRanks, playerRankIndexes, playerLevels,
			playerClasses, playerClassesEnglish, playerZones, playerStatuses, playerNotes, playerOfficerNotes)
		numPlayersOnline = 0
		numPlayersTotal = 0
		guildLeader = nil
		return
	end
	playersOnline, playersOnlineOld = playersOnlineOld, playersOnline -- for signon/off events
	players, playersOld = playersOld, players -- for add/remove events
	playerLevels, playerLevelsOld = playerLevelsOld, playerLevels -- for ding events
	numPlayersOnline = 0
	numPlayersTotal = GetNumGuildMembers(true)
	
	for i = 1, numPlayersTotal do
		local name, rank, rankIndex, level, class, zone, note, officernote, online, status, englishClass = GetGuildRosterInfo(i)
		local yearsOffline, monthsOffline, daysOffline, hoursOffline, secondsOffline = GetGuildRosterLastOnline(i)
		local add, connect, ding

		if yearsOffline then
			secondsOffline = hoursOffline * 60 * 60
			secondsOffline = secondsOffline + daysOffline * 24 * 60 * 60
			secondsOffline = secondsOffline + monthsOffline * 30 * 24 * 60 * 60
			secondsOffline = secondsOffline + yearsOffline * 365 * 24 * 60 * 60
		else
			secondsOffline = nil
		end
		if status == "" then status = nil end
		if note == "" then note = nil end
		if officernote == "" then officernote = nil end
		if name then
			players[name] = true
			playerRanks[name] = rank or UNKNOWN
			playerRankIndexes[name] = rankIndex or -1
			playerLevels[name] = level or -1 -- note: -1 if offline
			playerClasses[name] = class or UNKNOWN
			playerClassesEnglish[name] = englishClass or UNKNOWN
			playerZones[name] = zone or UNKNOWN
			playerStatuses[name] = status
			playerNotes[name] = note
			playerOfficerNotes[name] = officernote
			playerOfflineTimes[name] = secondsOffline
			if rankIndex == 0 then
				guildLeader = name
			end

			if playersOld[name] then
				playersOld[name] = nil
				if online and playerLevelsOld[name] and playerLevelsOld[name] > 0 and playerLevelsOld[name] < level then
					ding = true
				end
				playerLevelsOld[name] = nil
			else
				add = true
			end
		end
		if online then
			numPlayersOnline = numPlayersOnline + 1
			if name then
				playersOnline[name] = true
				if playersOnlineOld[name] then
					playersOnlineOld[name] = nil
				elseif playersOld[name] then
					connect = true
				end
			end
		end
		if firstScanDone then
			if add then
				lib.callbacks:Fire("Added", name)
			end
			if connect then
				lib.callbacks:Fire("Connected", name)
			end
			if ding then
				lib.callbacks:Fire("LevelUp", name, level)
			end
		end
	end
	for name in pairs(playersOld) do
		playersOld[name] = nil
		lib.callbacks:Fire("Removed", name)
	end
	for name in pairs(playersOnlineOld) do
		playersOnlineOld[name] = nil
		lib.callbacks:Fire("Disconnected", name)
	end
	for name in pairs(playerLevelsOld) do
		playerLevelsOld[name] = nil
	end
	firstScanDone = true
	
	lib.callbacks:Fire("Update")
end

function lib:GetNumOnline()
	return numPlayersOnline
end

function lib:GetNumTotal()
	return numPlayersTotal
end

local playerName = UnitName("player")

function lib:HasMember(name)
	return players[name or playerName]
end

function lib:IsMemberOnline(name)
	return playersOnline[name or playerName] or false
end

function lib:GetRank(name)
	return playerRanks[name or playerName]
end

function lib:GetRankIndex(name)
	return playerRankIndexes[name or playerName]
end

function lib:GetLevel(name)
	return playerLevels[name or playerName]
end

function lib:GetClass(name)
	return playerClasses[name or playerName], playerClassesEnglish[name or playerName]
end

function lib:GetClassColor(name)
	local class = playerClassesEnglish[name or playerName]
	if not class then return 0.8, 0.8, 0.8 end
	local c = RAID_CLASS_COLORS[class]
	return c.r, c.g, c.b
end

function lib:GetClassHexColor(name)
	local class = playerClassesEnglish[name or playerName]
	if not class then return 'cccccc' end
	local c = RAID_CLASS_COLORS[class]
	return ("%02X%02X%02X"):format(c.r*255, c.g*255, c.b*255)
end

function lib:GetZone(name)
	return playerZones[name or playerName]
end

function lib:GetEnglishZone(name)
	if not BZ then BZ = LibStub("LibBabble-Zone-3.0"):GetReverseLookupTable() end
	local zone = playerZones[name]
	if zone ~= UNKNOWN then
		return BZ[zone]
	else
		return "Unknown"
	end
end

function lib:GetStatus(name)
	return playerStatuses[name or playerName]
end

function lib:GetNote(name)
	return playerNotes[name or playerName]
end

function lib:GetOfficerNote(name)
	return playerOfficerNotes[name or playerName]
end

function lib:GetSecondsOffline(name)
	return playerOfflineTimes[name or playerName]
end

function lib:GetGuildName()
	return (GetGuildInfo('player'))
end

function lib:GetGuildLeader()
	return guildLeader
end

local sorts; sorts = {
	NAME = function(a,b)
		return a < b
	end,
	LEVEL = function(a,b)
		if playerLevels[a] == playerLevels[b] then
			return sorts.NAME(a,b)
		else
			return playerLevels[a] < playerLevels[b]
		end
	end,
	CLASS = function(a,b)
		if playerClasses[a] == playerClasses[b] then
			return sorts.LEVEL(a,b)
		else
			return playerClasses[a] < playerClasses[b]
		end
	end,
	ZONE = function(a,b)
		if playerZones[a] == playerZones[b] then
			return sorts.CLASS(a,b)
		else
			return playerZones[a] < playerZones[b]
		end
	end,
	RANK = function(a,b)
		if playerRankIndexes[a] == playerRankIndexes[b] then
			return sorts.CLASS(a,b)
		else
			return playerRankIndexes[a] < playerRankIndexes[b]
		end
	end,
	ONLINE = function(a,b)
		if playersOnline[a] == playersOnline[b] then
			return sorts.CLASS(a,b)
		else
			return connected[a] --1 or nil, you see.
		end
	end,
}

local iter = function(t)
	local n = t.n + 1
	t.n = n
	return t[n] or del(t)
end
function lib:GetIterator(sort, includeOffline)
	local sortFunc = sorts[sort or "NAME"]
	if not sortFunc then
		error('Argument #2 must be "NAME", "LEVEL", "CLASS", "ZONE", "ONLINE", or nil.')
	end
	
	local tmp = new()
	for k in pairs(includeOffline and players or playersOnline) do
		tmp[#tmp+1] = k
	end
	
	table.sort(tmp, sortFunc)
	tmp.n = 0
	
	return iter, tmp, nil
end

if IsInGuild() then
	frame:Show()
	GuildRoster()
else
	frame:Hide()
end
