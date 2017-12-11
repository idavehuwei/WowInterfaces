--[[
Name: LibTalentQuery-1.0
Revision: $Rev: 58 $
Author: Rich Martel (richmartel@gmail.com)
Documentation: http://wowace.com/wiki/LibTalentQuery-1.0
SVN: http://svn.wowace.com/wowace/trunk/LibTalentQuery-1.0
Description: Library to help with querying unit talents
Dependancies: LibStub, CallbackHandler-1.0
License: LGPL v2.1

Example Usage:
	local TalentQuery = LibStub:GetLibrary("LibTalentQuery-1.0")
	TalentQuery.RegisterCallback(self, "TalentQuery_Ready")

	local raidTalents = {}
	...
	TalentQuery:Query(unit)
	...
	function MyAddon:TalentQuery_Ready(e, name, realm, unitid)
		local isnotplayer = not UnitIsUnit(unitid, "player")
		local spec = {}
		for tab = 1, GetNumTalentTabs(isnotplayer) do
			local treename, _, pointsspent = GetTalentTabInfo(tab, isnotplayer)
			tinsert(spec, pointsspent)
		end
		raidTalents[UnitGUID(unitid)] = spec
	end
]]

local MAJOR, MINOR = "LibTalentQuery-1.0", 90000 + tonumber(("$Rev: 58 $"):match("(%d+)"))

local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end

local INSPECTDELAY = 1
local INSPECTTIMEOUT = 5
if not lib.events then
	lib.events = LibStub("CallbackHandler-1.0"):New(lib)
end

local frame = lib.frame
if not frame then
	frame = CreateFrame("Frame", MAJOR .. "_Frame")
	lib.frame = frame
end
frame:UnregisterAllEvents()
frame:RegisterEvent("INSPECT_TALENT_READY")
frame:SetScript("OnEvent", function(this, event, ...)
	return lib[event](lib, ...)
end)

do
	local lastUpdateTime = 0
	frame:SetScript("OnUpdate", function(this, elapsed)
		lastUpdateTime = lastUpdateTime + elapsed
		if lastUpdateTime > INSPECTDELAY then
			lib:CheckInspectQueue()
			lastUpdateTime = 0
		end
	end)
	frame:Hide()
end

local inspectQueue = lib.inspectQueue
if not inspectQueue then
	inspectQueue = {}
	lib.inspectQueue = inspectQueue
end
if next(inspectQueue) then
	frame:Show()
end

local UnitIsPlayer = _G.UnitIsPlayer
local UnitName = _G.UnitName
local UnitExists = _G.UnitExists
local UnitGUID = _G.UnitGUID
local GetNumRaidMembers = _G.GetNumRaidMembers
local GetNumPartyMembers = _G.GetNumPartyMembers
local UnitIsVisible = _G.UnitIsVisible
local UnitIsConnected = _G.UnitIsConnected
local UnitCanAttack = _G.UnitCanAttack
local CanInspect = _G.CanInspect

local function UnitFullName(unit)
	local name, realm = UnitName(unit)
	local namerealm = realm and realm ~= "" and name .. "-" .. realm or name
	return namerealm
end

-- GuidToUnitID
local function GuidToUnitID(guid)
	-- This properly detects target units
	if (UnitGUID("target") == guid) then
        return "target"
	elseif (UnitGUID("focus") == guid) then
		return "focus"
    end

	local prefix, min, max = "raid", 0, GetNumRaidMembers()
	if max == 0 then
		prefix, min, max = "party", 0, GetNumPartyMembers()
	end
	for i = min, max + 3 do
		local unit
		if i == 0 then
			unit = "player"
		elseif i == max + 1 then
			unit = "target"
		elseif i == max + 2 then
			unit = "focus"
		elseif i == max + 3 then
			unit = "mouseover"
		else
			unit = prefix .. i
		end
		if (UnitGUID(unit) == guid) then
			return unit
		elseif (UnitGUID(unit .. "target") == guid) then
			return unit .. "target"
		elseif (i <= max and UnitGUID(unit.."pettarget") == guid) then
			return unit .. "pettarget"
		end
	end
	return nil
end

-- Query
function lib:Query(unit)
	if UnitIsUnit(unit, "player") then
		self.events:Fire("TalentQuery_Ready", UnitName("player"), nil, "player")
	else
		if type(unit) ~= "string" then
			error(("Bad argument #2 to 'Query'. Expected %q, received %q (%s)"):format("string", type(unit), tostring(unit)), 2)
		elseif not UnitExists(unit) or not UnitIsPlayer(unit) then
			error(("Bad argument #2 to 'Query'. %q is not a valid player unit"):format(tostring(unit)), 2)
		elseif not UnitExists(unit) or not UnitIsPlayer(unit) then
			error(("Bad argument #2 to 'Query'. %q does not require a server query before reading talents"):format("player"), 2)
		else
			inspectQueue[UnitFullName(unit)] = UnitGUID(unit)
			frame:Show()
			self:CheckInspectQueue()
		end
	end
end

-- CheckInspectQueue
-- Originally, it would wait until no pending NotifyInspect() were expected, and then do it's own.
-- It was also only bother looking at ready results if it had triggered the Notify for that occasion.
-- For the changes I've done, no assumption is made about which mod is performing NotifyInspect().
-- We note the name, unit, time of any inspects done whether from this queue or any other source,
-- we remove from our queue any we were expecting, and use a seperate event in case extra talent
-- info is any time wanted (opportunistic refreshes etc) - Zeksie, 20th May 2009
function lib:CheckInspectQueue()
	if (_G.InspectFrame and _G.InspectFrame:IsShown()) then
		return
	end

	if (not self.lastInspectTime or self.lastInspectTime < GetTime() - INSPECTTIMEOUT) then
		self.lastInspectPending = 0
	end

	if (self.lastInspectPending > 0) then
		return
	end

	if (self.lastQueuedInspectReceived and self.lastQueuedInspectReceived < GetTime() - 60) then
		-- No queued results received for a minute, so purge the queue as invalid and move on with our lives
		self.lastQueuedInspectReceived = nil
		inspectQueue = {}
		lib.inspectQueue = inspectQueue
		frame:Hide()
		return
	end

	for name,guid in pairs(inspectQueue) do
		local unit = GuidToUnitID(guid)
		if (not unit) then
			inspectQueue[name] = nil
		else
			if (UnitIsVisible(unit) and UnitIsConnected(unit) and not UnitCanAttack("player", unit) and not UnitCanAttack(unit, "player") and CanInspect(unit)) then
				NotifyInspect(unit)
				break
			end
		end
	end

	if (not next(inspectQueue)) then
		frame:Hide()
	end
end

-- NotifyInspect
if not lib.NotifyInspect then -- don't hook twice
	hooksecurefunc("NotifyInspect", function(...) return lib:NotifyInspect(...) end)
end
function lib:NotifyInspect(unit)
	if (UnitIsUnit("player", unit) or not (UnitExists(unit) and UnitIsVisible(unit) and UnitIsConnected(unit) and CheckInteractDistance(unit, 4))) then
		return
	end

	self.lastInspectUnit = unit
	self.lastInspectTime = GetTime()
	self.lastInspectName = UnitFullName(unit)
	self.lastInspectPending = self.lastInspectPending + 1
end

-- Reset
function lib:Reset()
	self.lastInspectPending = 0
	self.lastInspectUnit = nil
	self.lastInspectTime = nil
	self.lastInspectName = nil
end

-- INSPECT_TALENT_READY
function lib:INSPECT_TALENT_READY()
	self.lastInspectPending = self.lastInspectPending - 1

	-- Results are valid only when we have received as many events as we have posted notifies
	if (self.lastInspectName and self.lastInspectPending == 0) then
		local name, realm = strsplit("-", self.lastInspectName)
		if (inspectQueue[self.lastInspectName]) then
			-- Notify of expected talent results

			self.lastQueuedInspectReceived = GetTime()

			inspectQueue[self.lastInspectName] = nil
			self.events:Fire("TalentQuery_Ready", name, realm, self.lastInspectUnit)
		else
			-- Also notify of non-expected ones, as it's entirely useful to refresh them if they're there
			-- It is up to the receiving applicating to determine whether they want to receive the information
			self.events:Fire("TalentQuery_Ready_Outsider", name, realm, self.lastInspectUnit)
		end

		self:Reset()
		self:CheckInspectQueue()
	end
end

lib:Reset()
