--[[
Name: LibBanzai-2.0
Revision: $Revision: 40 $
Author(s): Rabbit (rabbit.magtheridon@gmail.com), maia
Documentation: http://www.wowace.com/index.php/Banzai-2.0_API_Documentation
SVN: http://svn.wowace.com/wowace/trunk/BanzaiLib/Banzai-2.0
Description: Aggro notification library.
Dependencies: LibStub
]]

-------------------------------------------------------------------------------
-- Locals
-------------------------------------------------------------------------------

local MAJOR_VERSION = "LibBanzai-2.0-GUID"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 40 $"):match("(%d+)"))

if not LibStub then error(MAJOR_VERSION .. " requires LibStub.") end
local lib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

lib.callbacks = lib.callbacks or {}
local callbacks = lib.callbacks
lib.frame = lib.frame or CreateFrame("Frame")
local frame = lib.frame

local _G = _G
local table_insert = table.insert
local UnitExists = _G.UnitExists
local UnitGUID = _G.UnitGUID
local UnitCanAttack = _G.UnitCanAttack
local GetNumRaidMembers = _G.GetNumRaidMembers
local GetNumPartyMembers = _G.GetNumPartyMembers
local unpack = _G.unpack
local type = _G.type
local assert = _G.assert

-------------------------------------------------------------------------------
-- Local heap
-------------------------------------------------------------------------------

local new, del
do
	local cache = setmetatable({},{__mode='k'})
	function new()
		local t = next(cache)
		if t then
			cache[t] = nil
			return t
		else
			return {}
		end
	end
	function del(t)
		for k in pairs(t) do
			t[k] = nil
		end
		cache[t] = true
		return nil
	end
end

-------------------------------------------------------------------------------
-- Roster
-------------------------------------------------------------------------------

local raidUnits = setmetatable({}, {__index =
	function(self, key)
		self[key] = ("raid%d"):format(key)
		return self[key]
	end
})
local raidPetUnits = setmetatable({}, {__index =
	function(self, key)
		self[key] = ("raidpet%d"):format(key)
		return self[key]
	end
})
local partyUnits = {"party1","party2","party3","party4"}
local partyPetUnits = {"partypet1","partypet2","partypet3","partypet4"}
local roster = {}
local needsUpdate = nil

-- If some pet has the same name as a person in the raid, they'll end up being
-- the same unit for the purposes of banzai, but we won't care right now.
local function addUnit(unit)
	if not UnitExists(unit) then return end
	local guid = UnitGUID(unit)
	if not roster[guid] then roster[guid] = new() end
	table_insert(roster[guid], unit)
end

local function actuallyUpdateRoster()
	for k in pairs(roster) do roster[k] = del(roster[k]) end
	addUnit("player")
	addUnit("pet")
	addUnit("focus")
	for i = 1, GetNumRaidMembers() do
		addUnit(raidUnits[i])
		addUnit(raidPetUnits[i])
	end
	for i = 1, GetNumPartyMembers() do
		addUnit(partyUnits[i])
		addUnit(partyPetUnits[i])
	end
	needsUpdate = nil
end

local function updateRoster()
	needsUpdate = true
end

-------------------------------------------------------------------------------
-- Banzai
-------------------------------------------------------------------------------

local targets = setmetatable({}, {__index =
	function(self, key)
		self[key] = key .. "target"
		return self[key]
	end
})

local aggro = {}
local banzai = {}

local total = 0
local function updateBanzai(_, elapsed)
	total = total + elapsed
	if total > 0.2 then
		if needsUpdate then actuallyUpdateRoster() end
		for guid, units in pairs(roster) do
			local unit = units[1]
			local targetId = targets[unit]
			if UnitExists(targetId) then
				local ttId = targets[targetId]
				if unit == "focus" and UnitIsEnemy("focus", "player") then
					ttId = "focustarget"
					targetId = "focus"
				end
				if UnitExists(ttId) and UnitCanAttack(ttId, targetId) then
					for n, u in pairs(roster) do
						if UnitIsUnit(u[1], ttId) then
							banzai[n] = (banzai[n] or 0) + 10
							break
						end
					end
				end
			end
			if banzai[guid] then
				if banzai[guid] >= 5 then banzai[guid] = banzai[guid] - 5 end
				if banzai[guid] > 25 then banzai[guid] = 25 end
			end
		end
		for guid, units in pairs(roster) do
			if banzai[guid] and banzai[guid] > 15 then
				if not aggro[guid] then
					aggro[guid] = true
					for i, v in ipairs(callbacks) do
						v(1, guid, unpack(units))
					end
				end
			elseif aggro[guid] then
				aggro[guid] = nil
				for i, v in ipairs(callbacks) do
					v(0, guid, unpack(units))
				end
			end
		end
		total = 0
	end
end

-------------------------------------------------------------------------------
-- Starting and stopping
-------------------------------------------------------------------------------

local running = nil
local function start()
	if running then return end
	updateRoster()
	frame:SetScript("OnUpdate", updateBanzai)
	frame:SetScript("OnEvent", updateRoster)
	frame:RegisterEvent("RAID_ROSTER_UPDATE")
	frame:RegisterEvent("PARTY_MEMBERS_CHANGED")
	frame:RegisterEvent("UNIT_PET")
	frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
	running = true
end

local function stop()
	if not running then return end
	frame:SetScript("OnUpdate", nil)
	frame:SetScript("OnEvent", nil)
	frame:UnregisterAllEvents()
	running = nil
end

-------------------------------------------------------------------------------
-- API
-------------------------------------------------------------------------------

function lib:IsRunning() return running end
function lib:GetUnitAggroByUnitGUID(guid) return aggro[guid] end
function lib:GetUnitAggroByUnitId(unit)
	if not UnitExists(unit) then return end
	return aggro[UnitGUID(unit)]
end

function lib:RegisterCallback(func)
	if type(func) ~= "function" then
		error(("Bad argument to :RegisterCallback, function expected, got %q."):format(type(func)), 2)
	end

	table_insert(callbacks, func)
	start()
end

function lib:UnregisterCallback(func)
	if type(func) ~= "function" then
		error(("Bad argument to :UnregisterCallback, function expected, got %q."):format(type(func)), 2)
	end

	local found = nil
	for i, v in ipairs(callbacks) do
		if v == func then
			table.remove(callbacks, i)
			found = true
			break
		end
	end
	if #callbacks == 0 then stop() end

	if not found then
		error("Bad argument to :UnregisterCallback, the provided function was not registered.", 2)
	end
end

-------------------------------------------------------------------------------
-- Initialization
-------------------------------------------------------------------------------

frame:SetScript("OnUpdate", nil)
frame:SetScript("OnEvent", nil)
frame:UnregisterAllEvents()
if #callbacks > 0 then start() end

