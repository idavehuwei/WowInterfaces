--[[
Name: SpecialEvents-Aura-2.0
Revision: $Rev: 209 $
Author: Tekkub Stoutwrithe (tekkub@gmail.com)
Website: http://www.wowace.com/
Description: Special events for Auras, (de)buffs gained, lost etc.
Dependencies: AceLibrary, AceEvent-2.0
--]]

local vmajor, vminor = "SpecialEvents-Aura-2.0", 90000 + tonumber(("$Revision: 209 $"):match("(%d+)"))

local AceLibrary = AceLibrary

if not AceLibrary then error(vmajor .. " requires AceLibrary.") end
if not AceLibrary:HasInstance("AceEvent-2.0") then error(vmajor .. " requires AceEvent-2.0.") end
if not AceLibrary:IsNewVersion(vmajor, vminor) then return end

local DEBUG = nil

local lib = {}
AceLibrary("AceEvent-2.0"):embed(lib)

local RL

local pairs = pairs
local string = string
local string_format = string.format
local next = next
local type = type
local UnitExists = UnitExists
local UnitIsUnit = UnitIsUnit
local GetNumRaidMembers = GetNumRaidMembers
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff

----------------------------
--     Initialization     --
----------------------------

local function debug(txt)
	ChatFrame1:AddMessage("SEEA: " .. txt)
end

local function registerevents(self)
	if self:IsEventRegistered("UNIT_AURA") then return end
	self:RegisterEvent("UNIT_AURA", "AuraScan")
	self:RegisterEvent("UNIT_AURASTATE", "AuraScan")
	self:RegisterBucketEvent("PLAYER_AURAS_CHANGED", 0.2)
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
	-- scan the player auras every second; there is no event fired when a player's buff is refreshed by another player, so period scan is necessary
	self:ScheduleRepeatingEvent("SEEAScanPlayerAuras", self.AuraScan, 1, self, "player", "Periodic for player")
	-- scan the player item buffs every 0.2 seconds; there is no event that fires when these are added or removed.
	self:ScheduleRepeatingEvent("SEEAScanPlayerItemBuffs", self.PlayerItemBuffScan, 0.2, self)
	-- check if RosterLib exists. We need to do that here and not earlier.
	if AceLibrary:HasInstance("Roster-2.1") then -- We're compatible with both.
		RL = AceLibrary("Roster-2.1")
	elseif AceLibrary:HasInstance("RosterLib-2.0") then
		RL = AceLibrary("RosterLib-2.0")
	end
	if RL then
		self:RegisterBucketEvent("RosterLib_UnitChanged", 0.2)
	else
		self:RegisterBucketEvent("PARTY_MEMBERS_CHANGED", 0.2)
		self:RegisterBucketEvent("RAID_ROSTER_UPDATE", 0.2)
	end
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ScanAllAuras")
end


-- Activate a new instance of this library
local function activate(self, oldLib, oldDeactivate)
	lib = self
	if oldLib then
		self.vars = oldLib.vars
		if type(self.vars) ~= "table" then self.vars = {} end
		if type(self.vars.buffs) ~= "table" then self.vars.buffs = {} end
		if type(self.vars.debuffs) ~= "table" then self.vars.debuffs = {} end
	else
		self.vars = { buffs = {}, debuffs = {} }
	end
	if not self.vars.tooltip then
		local tt = CreateFrame("GameTooltip")
		self.vars.tooltip = tt
		tt:SetOwner(UIParent, "ANCHOR_NONE")
		
		tt.left, tt.right = {}, {}
		for i = 1, 30 do
			tt.left[i], tt.right[i] = tt:CreateFontString(), tt:CreateFontString()
			tt.left[i]:SetFontObject(GameFontNormal)
			tt.right[i]:SetFontObject(GameFontNormal)
			tt:AddFontStrings(tt.left[i], tt.right[i])
		end
	end

	-- There's no need to re-scan all the auras if we have an oldLib and it has
	-- registered for events, which means it has already done one for us, and
	-- the data should be available in self.vars.
	if AceLibrary("AceEvent-2.0"):IsFullyInitialized() and (not oldLib or oldLib:IsEventRegistered("UNIT_AURA")) then
		self:PLAYER_LOGIN()
	end
	self:RegisterEvent("PLAYER_LOGIN")

	if oldLib and oldLib:IsEventRegistered("UNIT_AURA") then
		registerevents(self)
		oldLib:UnregisterAllEvents()
	end

	if oldDeactivate then oldDeactivate(oldLib) end
end

function lib:PLAYER_LOGIN()
	-- self:ScanAllAuras()
	registerevents(self)
end

--------------------------------
--      Tracking methods      --
--------------------------------

local player_last_raid_id
function lib:PLAYER_AURAS_CHANGED()
	self:AuraScan("player", "PLAYER_AURAS_CHANGED")
	local id = player_last_raid_id
	if id and UnitIsUnit(id, "player") then
		self:AuraScan(id, "PLAYER_AURAS_CHANGED Raid Player")
	else
		for i = 1, GetNumRaidMembers() do
			id = "raid"..i
			if UnitIsUnit(id, "player") then
				player_last_raid_id = id
				self:AuraScan(id, "PLAYER_AURAS_CHANGED Raid Player")
				break
			end
		end
	end
end


function lib:PLAYER_TARGET_CHANGED()
	self:AuraScan("target", "TARGET_CHANGED")
	self:TriggerEvent("SpecialEvents_AuraTargetChanged")
end


function lib:PLAYER_FOCUS_CHANGED()
	self:AuraScan("focus", "FOCUS_CHANGED")
	self:TriggerEvent("SpecialEvents_AuraFocusChanged")
end


function lib:RosterLib_UnitChanged(units)
	for unit in pairs(units) do
		if unit and UnitExists(unit) then
			self:AuraScan(unit, "RosterLib_UnitChanged")
		end
	end
	if GetNumRaidMembers() > 0 then
		self:TriggerEvent("SpecialEvents_AuraRaidRosterUpdate")
	else
		self:TriggerEvent("SpecialEvents_AuraPartyMembersChanged")
	end
end


function lib:PARTY_MEMBERS_CHANGED()
	if UnitExists("pet") then self:AuraScan("pet", "PMC Pet") end

	for i=1,4 do
		if UnitExists("party"..i) then self:AuraScan("party"..i, "PMC Party") end
		if UnitExists("partypet"..i) then self:AuraScan("partypet"..i, "PMC Party Pet") end
	end
	self:TriggerEvent("SpecialEvents_AuraPartyMembersChanged")
end


function lib:RAID_ROSTER_UPDATE()
	for i=1,40 do
		if UnitExists("raid"..i) then self:AuraScan("raid"..i, "RRU Raid") end
		if UnitExists("raidpet"..i) then self:AuraScan("raidpet"..i, "RRU Raid Pet") end
	end
	self:TriggerEvent("SpecialEvents_AuraRaidRosterUpdate")
end

function lib:ScanAllAuras()
	if UnitExists("player") then self:AuraScan("player", "ALL Player") end
	if UnitExists("pet") then self:AuraScan("pet", "ALL Pet") end

	for i=1,4 do
		if UnitExists("party"..i) then self:AuraScan("party"..i, "ALL Party") end
		if UnitExists("partypet"..i) then self:AuraScan("partypet"..i, "ALL Party Pet") end
	end

	for i=1,40 do
		if UnitExists("raid"..i) then self:AuraScan("raid"..i, "ALL Raid") end
		if UnitExists("raidpet"..i) then self:AuraScan("raidpet"..i, "ALL Raid Pet") end
	end

	if UnitExists("target") then self:AuraScan("target", "ALL Target") end
	if UnitExists("focus") then self:AuraScan("focus", "ALL Focus") end
--~~ 	if UnitExists("mouseover") then self:AuraScan("mouseover") end
end


-- whee, aura scanning is fun
do
	local seenBuffs, seenDebuffs = {}, {}

	local removedBuffs = {
		name = {},
		rank = {},
		icon = {},
		count = {},
		duration = {},
		timeEnd = {},
	}

	local removedDebuffs = {
		name = {},
		rank = {},
		icon = {},
		count = {},
		dispelType = {},
		duration = {},
		timeEnd = {},
	}

	function lib:AuraScan(unit, reason)
		local buffs, debuffs = self.vars.buffs[unit], self.vars.debuffs[unit]
		local timeNow = GetTime()

		if not reason then reason = "UNIT_AURA[STATE]" end

		-- have we seen this unit before?
		if not buffs then
			buffs = {
				index = {},
				name = {},
				rank = {},
				icon = {},
				count = {},
				duration = {},
				timeEnd = {},
			}

			self.vars.buffs[unit] = buffs

			debuffs = {
				index = {},
				name = {},
				rank = {},
				icon = {},
				count = {},
				dispelType = {},
				duration = {},
				timeEnd = {},
			}

			self.vars.debuffs[unit] = debuffs
		end

		--
		-- Update buffs for unit
		--

		-- check for new buffs
		local i = 1
		while true do
			local name, rank, icon, count, debuffType, duration, timeLeft, isMine, isStealable = UnitBuff(unit, i)
			if not name then break end

			local timeEnd = timeLeft and (timeLeft > 0) and (timeNow + timeLeft) or nil
			
			-- buffs are the same if their name, rank, and icon are the same
			local buffIndex = string_format("%s_%s_%s", name, rank, icon)

			-- handle multiple instances of the same buff (stacked HoTs)
			while seenBuffs[buffIndex] do
				buffIndex = buffIndex .. "_"
			end

			-- this is the only buff field that is allowed to change without triggering an event
			buffs.index[buffIndex] = i

			-- new buff?
			if not buffs.name[buffIndex] then
				buffs.name[buffIndex] = name
				buffs.rank[buffIndex] = rank
				buffs.icon[buffIndex] = icon
				buffs.count[buffIndex] = count
				buffs.duration[buffIndex] = duration
				buffs.timeEnd[buffIndex] = timeEnd

				seenBuffs[buffIndex] = "new"

			-- did the count change?
			elseif buffs.count[buffIndex] ~= count then
				buffs.count[buffIndex] = count

				seenBuffs[buffIndex] = "changed"

			-- was the buff refreshed? only look at significant refreshes i.e. more than a second after the original buff
			elseif timeEnd and buffs.timeEnd[buffIndex] and timeEnd > (buffs.timeEnd[buffIndex] + 1) then
				buffs.duration[buffIndex] = duration
				buffs.timeEnd[buffIndex] = timeEnd

				seenBuffs[buffIndex] = "refreshed"

			-- no changes
			else
				seenBuffs[buffIndex] = true
			end
			
			i = i + 1
		end

		-- remove old buffs
		for buffIndex in pairs(buffs.index) do
			if not seenBuffs[buffIndex] then
				-- copy to removed table
				removedBuffs.name[buffIndex] = buffs.name[buffIndex]
				removedBuffs.rank[buffIndex] = buffs.rank[buffIndex]
				removedBuffs.icon[buffIndex] = buffs.icon[buffIndex]
				removedBuffs.count[buffIndex] = buffs.count[buffIndex]
				removedBuffs.duration[buffIndex] = buffs.duration[buffIndex]
				removedBuffs.timeEnd[buffIndex] = buffs.timeEnd[buffIndex]

				-- remove buff from unit
				buffs.index[buffIndex] = nil
				buffs.name[buffIndex] = nil
				buffs.rank[buffIndex] = nil
				buffs.icon[buffIndex] = nil
				buffs.count[buffIndex] = nil
				buffs.duration[buffIndex] = nil
				buffs.timeEnd[buffIndex] = nil
			end
		end

		--
		-- Update debuffs for unit
		--

		-- check for new debuffs
		i = 1
		while true do
			local name, rank, icon, count, dispelType, duration, timeLeft, isMine, isStealable = UnitDebuff(unit, i)
			if not name then break end

			local timeEnd = timeLeft and (timeLeft > 0) and (timeNow + timeLeft) or nil

			-- debuffs are the same if their name, rank, and icon are the same
			local debuffIndex = string_format("%s_%s_%s", name, rank, icon)

			-- handle multiple instances of the same debuff
			while seenDebuffs[debuffIndex] do
				debuffIndex = debuffIndex .. "_"
			end

			-- these are the only debuff fields that are allowed to change without triggering an event
			debuffs.index[debuffIndex] = i
			debuffs.dispelType[debuffIndex] = dispelType or ""

			-- new debuff?
			if not debuffs.name[debuffIndex] then
				debuffs.name[debuffIndex] = name
				debuffs.rank[debuffIndex] = rank
				debuffs.icon[debuffIndex] = icon
				debuffs.count[debuffIndex] = count
				debuffs.duration[debuffIndex] = duration
					debuffs.timeEnd[debuffIndex] = timeEnd

				seenDebuffs[debuffIndex] = "new"

			-- did the count change?
			elseif debuffs.count[debuffIndex] ~= count then
				debuffs.count[debuffIndex] = count

				seenDebuffs[debuffIndex] = "changed"

				-- was the debuff refreshed? only look at significant refreshes i.e. more than a second after the original debuff
			elseif timeEnd and debuffs.timeEnd[debuffIndex] and timeEnd > (debuffs.timeEnd[debuffIndex] + 1) then
				debuffs.duration[debuffIndex] = duration
				debuffs.timeEnd[debuffIndex] = timeEnd

				seenDebuffs[debuffIndex] = "refreshed"

			-- no changes
			else
				seenDebuffs[debuffIndex] = true
			end
			
			i = i + 1
		end

		-- remove old debuffs
		for debuffIndex in pairs(debuffs.index) do
			if not seenDebuffs[debuffIndex] then
				-- copy to removed table
				removedDebuffs.name[debuffIndex] = debuffs.name[debuffIndex]
				removedDebuffs.rank[debuffIndex] = debuffs.rank[debuffIndex]
				removedDebuffs.icon[debuffIndex] = debuffs.icon[debuffIndex]
				removedDebuffs.count[debuffIndex] = debuffs.count[debuffIndex]
				removedDebuffs.dispelType[debuffIndex] = debuffs.dispelType[debuffIndex]
				removedDebuffs.duration[debuffIndex] = debuffs.duration[debuffIndex]
				removedDebuffs.timeEnd[debuffIndex] = debuffs.timeEnd[debuffIndex]

				-- remove debuff from unit
				debuffs.index[debuffIndex] = nil
				debuffs.name[debuffIndex] = nil
				debuffs.rank[debuffIndex] = nil
				debuffs.icon[debuffIndex] = nil
				debuffs.count[debuffIndex] = nil
				debuffs.dispelType[debuffIndex] = nil
				debuffs.duration[debuffIndex] = nil
				debuffs.timeEnd[debuffIndex] = nil
			end
		end

		--
		-- Done scanning, it's time to trigger events!
		--

		-- send events for lost buffs
		for buffIndex in pairs(removedBuffs.name) do
			local name = removedBuffs.name[buffIndex]
			local count = removedBuffs.count[buffIndex]
			local icon = removedBuffs.icon[buffIndex]
			local rank = removedBuffs.rank[buffIndex]
			local duration = removedBuffs.duration[buffIndex]

			-- unit, name, count, icon, rank
			self:TriggerEvent("SpecialEvents_UnitBuffLost", unit, name, count, icon, rank, duration, buffIndex)

			if unit == "player" then
				-- name, count, icon, rank
				self:TriggerEvent("SpecialEvents_PlayerBuffLost", name, count, icon, rank, buffIndex)
			end

			if DEBUG then
				debug("SpecialEvents_UnitBuffLost " .. unit .. ":" .. name .. ", " .. reason)
			end

			removedBuffs.name[buffIndex] = nil
			removedBuffs.rank[buffIndex] = nil
			removedBuffs.icon[buffIndex] = nil
			removedBuffs.count[buffIndex] = nil
		end

		-- send events for lost debuffs
		for debuffIndex in pairs(removedDebuffs.name) do
			local name = removedDebuffs.name[debuffIndex]
			local count = removedDebuffs.count[debuffIndex]
			local dispelType = removedDebuffs.dispelType[debuffIndex]
			local icon = removedDebuffs.icon[debuffIndex]
			local rank = removedDebuffs.rank[debuffIndex]
			local duration = removedDebuffs.duration[debuffIndex]

			-- unit, name, count, dispelType, icon, rank
			self:TriggerEvent("SpecialEvents_UnitDebuffLost", unit, name, count, dispelType, icon, rank, duration, debuffIndex)

			if unit == "player" then
				-- name, count, dispelType, icon, rank
				self:TriggerEvent("SpecialEvents_PlayerDebuffLost", name, count, dispelType, icon, rank, debuffIndex)
			end

			if DEBUG then
				debug("SpecialEvents_UnitDebuffLost " .. unit .. ":" .. name .. ", " .. reason)
			end

			removedDebuffs.name[debuffIndex] = nil
			removedDebuffs.rank[debuffIndex] = nil
			removedDebuffs.icon[debuffIndex] = nil
			removedDebuffs.count[debuffIndex] = nil
			removedDebuffs.dispelType[debuffIndex] = nil
		end

		-- send events for new/changed buffs
		for buffIndex in pairs(buffs.index) do
			if seenBuffs[buffIndex] == "new" then
				local name = buffs.name[buffIndex]
				local index = buffs.index[buffIndex]
				local count = buffs.count[buffIndex]
				local icon = buffs.icon[buffIndex]
				local rank = buffs.rank[buffIndex]
				local duration = buffs.duration[buffIndex]
				local timeLeft = buffs.timeEnd[buffIndex] and (buffs.timeEnd[buffIndex] - timeNow) or nil

				-- unit, name, index, count, icon, rank
				self:TriggerEvent("SpecialEvents_UnitBuffGained", unit, name, index, count, icon, rank, duration, timeLeft, buffIndex)

				if unit == "player" then
					-- name, index, count, icon, rank
					self:TriggerEvent("SpecialEvents_PlayerBuffGained", name, index, count, icon, rank, duration, timeLeft, buffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitBuffGained " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end

			elseif seenBuffs[buffIndex] == "changed" then
				local name = buffs.name[buffIndex]
				local index = buffs.index[buffIndex]
				local count = buffs.count[buffIndex]
				local icon = buffs.icon[buffIndex]
				local rank = buffs.rank[buffIndex]
				local duration = buffs.duration[buffIndex]
				local timeLeft = buffs.timeEnd[buffIndex] and (buffs.timeEnd[buffIndex] - timeNow) or nil

				-- unit, name, index, count, icon, rank
				self:TriggerEvent("SpecialEvents_UnitBuffCountChanged", unit, name, index, count, icon, rank, duration, timeLeft, buffIndex)

				if unit == "player" then
					-- unit, name, index, count, icon, rank
					self:TriggerEvent("SpecialEvents_PlayerBuffCountChanged", name, index, count, icon, rank, duration, timeLeft, buffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitBuffCountChanged " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end

			elseif seenBuffs[buffIndex] == "refreshed" then
				local name = buffs.name[buffIndex]
				local index = buffs.index[buffIndex]
				local count = buffs.count[buffIndex]
				local icon = buffs.icon[buffIndex]
				local rank = buffs.rank[buffIndex]
				local duration = buffs.duration[buffIndex]
				local timeLeft = buffs.timeEnd[buffIndex] and (buffs.timeEnd[buffIndex] - timeNow) or nil

				-- unit, name, index, count, icon, rank
				self:TriggerEvent("SpecialEvents_UnitBuffRefreshed", unit, name, index, count, icon, rank, duration, timeLeft, buffIndex)

				if unit == "player" then
					-- name, index, count, icon, rank
					self:TriggerEvent("SpecialEvents_PlayerBuffRefreshed", name, index, count, icon, rank, duration, timeLeft, buffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitBuffRefreshed " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end
			end
		end

		-- send events for new/changed debuffs
		for debuffIndex in pairs(debuffs.index) do
			if seenDebuffs[debuffIndex] == "new" then
				local name = debuffs.name[debuffIndex]
				local count = debuffs.count[debuffIndex]
				local dispelType = debuffs.dispelType[debuffIndex]
				local icon = debuffs.icon[debuffIndex]
				local rank = debuffs.rank[debuffIndex]
				local index = debuffs.index[debuffIndex]
				local duration = debuffs.duration[debuffIndex]
				local timeLeft = debuffs.timeEnd[debuffIndex] and (debuffs.timeEnd[debuffIndex] - timeNow) or nil

				-- unit, name, count, dispelType, icon, rank, index
				self:TriggerEvent("SpecialEvents_UnitDebuffGained", unit, name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)

				if unit == "player" then
					-- name, count, dispelType, icon, rank, index
					self:TriggerEvent("SpecialEvents_PlayerDebuffGained", name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitDebuffGained " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end

			elseif seenDebuffs[debuffIndex] == "changed" then
				local name = debuffs.name[debuffIndex]
				local count = debuffs.count[debuffIndex]
				local dispelType = debuffs.dispelType[debuffIndex]
				local icon = debuffs.icon[debuffIndex]
				local rank = debuffs.rank[debuffIndex]
				local index = debuffs.index[debuffIndex]
				local duration = debuffs.duration[debuffIndex]
				local timeLeft = debuffs.timeEnd[debuffIndex] and (debuffs.timeEnd[debuffIndex] - timeNow) or nil

				-- unit, name, count, dispelType, icon, rank, index
				self:TriggerEvent("SpecialEvents_UnitDebuffCountChanged", unit, name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)

				if unit == "player" then
					-- name, count, dispelType, icon, rank, index
					self:TriggerEvent("SpecialEvents_PlayerDebuffCountChanged", name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitDebuffCountChanged " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end

			elseif seenDebuffs[debuffIndex] == "refreshed" then
				local name = debuffs.name[debuffIndex]
				local count = debuffs.count[debuffIndex]
				local dispelType = debuffs.dispelType[debuffIndex]
				local icon = debuffs.icon[debuffIndex]
				local rank = debuffs.rank[debuffIndex]
				local index = debuffs.index[debuffIndex]
				local duration = debuffs.duration[debuffIndex]
				local timeLeft = debuffs.timeEnd[debuffIndex] and (debuffs.timeEnd[debuffIndex] - timeNow) or nil

				-- unit, name, count, dispelType, icon, rank, index
				self:TriggerEvent("SpecialEvents_UnitDebuffRefreshed", unit, name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)

				if unit == "player" then
					-- name, count, dispelType, icon, rank, index
					self:TriggerEvent("SpecialEvents_PlayerDebuffRefreshed", name, count, dispelType, icon, rank, index, duration, timeLeft, debuffIndex)
				end

				if DEBUG then
					debug("SpecialEvents_UnitDebuffRefreshed " .. unit .. ":" .. name .. ", " .. reason .. ", " .. tostring(timeLeft) .. "/" .. tostring(duration))
				end
			end
		end

		--
		-- cleanup
		--

		for k in pairs(seenBuffs) do
			seenBuffs[k] = nil
		end

		for k in pairs(seenDebuffs) do
			seenDebuffs[k] = nil
		end
	end
end

do
	local function GetItemBuffName(slot)
		local tt = lib.vars.tooltip
		tt:ClearLines()
		tt:SetInventoryItem("player", slot)
		
		local left = tt.left
		for i = 1, 30 do
			local text = left[i]:GetText()
			if text then
				local buffName = text:match("^([^%(]+) %(%d+ [^%)]+%)$")
				if buffName then
					return buffName
				end
			else
				break
			end
		end
	end

	local mainhandItemBuff
	local offhandItemBuff
	local mainhandTimeLeft
	local offhandTimeLeft
	local offhandCharges
	local function refreshItemBuffs()
		local mainhand, mainhandtimeleft, _, offhand, offhandtimeleft, _ = GetWeaponEnchantInfo()
		mainhandItemBuff = mainhand and GetItemBuffName(GetInventorySlotInfo("MainHandSlot"))
		offhandItemBuff = offhand and GetItemBuffName(GetInventorySlotInfo("SecondaryHandSlot"))
		mainhandTimeLeft = mainhandtimeleft and mainhandtimeleft/1000
		offhandTimeLeft = offhandtimeleft and offhandtimeleft/1000
		offhandCharges = offhandcharges
	end

	local first = true
	function lib:PlayerItemBuffScan()
-- 		if first then
-- 			refreshItemBuffs()
-- 			first = false
-- 			return
-- 		end
		local oldMainhandItemBuff = mainhandItemBuff
		local oldOffhandItemBuff = offhandItemBuff
		local oldMainhandTimeLeft = mainhandTimeLeft
		local oldOffhandTimeLeft = offhandTimeLeft
		refreshItemBuffs()
		if oldMainhandItemBuff ~= mainhandItemBuff then -- either loss or gain
			if oldMainhandItemBuff then -- loss
				-- name, rank, isMainHand
				local name, rank = oldMainhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffLost", name or oldMainhandItemBuff, rank, true)
			end
			if mainhandItemBuff then -- gain
				-- name, rank, isMainHand
				local name, rank = mainhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffGained", name or mainhandItemBuff, rank, true, mainhandTimeLeft)
			end
		elseif mainhandItemBuff and oldMainhandTimeLeft + 1 < mainhandTimeLeft then -- duration refreshed
				local name, rank = mainhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffRefreshed", name or mainhandItemBuff, rank, true, mainhandTimeLeft)
		end
		if oldOffhandItemBuff ~= offhandItemBuff then
			if oldOffhandItemBuff then -- loss
				-- name, rank, isMainHand
				local name, rank = oldOffhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffLost", name or oldOffhandItemBuff, rank, false)
			end
			if offhandItemBuff then -- gain
				-- name, rank, isMainHand
				local name, rank = offhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffGained", name or offhandItemBuff, rank, false, offhandTimeLeft)
			end
		elseif offhandItemBuff and oldOffhandTimeLeft + 1 < offhandTimeLeft then -- duration refreshed
				local name, rank = offhandItemBuff:match("^(.*) (%d+)$")
				self:TriggerEvent("SpecialEvents_PlayerItemBuffRefreshed", name or offhandItemBuff, rank, false, offhandTimeLeft)
		end
	end

	function lib:GetPlayerMainHandItemBuff()
		if mainhandItemBuff then
			local name, rank = mainhandItemBuff:match("^(.*) (%d+)$")
			return name or mainhandItemBuff, rank
		end
	end
	function lib:GetPlayerOffHandItemBuff()
		if offhandItemBuff then
			local name, rank = offhandItemBuff:match("^(.*) (%d+)$")
			return name or offhandItemBuff, rank
		end
	end
end

-----------------------------
--      Query Methods      --
-----------------------------

function lib:UnitHasBuff(unit, name, rank, icon)
	local unitBuffs = self.vars.buffs[unit]

	if not unitBuffs then return end

	if name and rank and icon then
		local buffIndex = string.format("%s_%s_%s", name, rank, icon)

		if unitBuffs.index[buffIndex] then
			-- index; count, icon, rank
			return unitBuffs.index[buffIndex], unitBuffs.count[buffIndex], unitBuffs.icon[buffIndex], unitBuffs.rank[buffIndex]
		else
			return
		end
	end

	for buffIndex in pairs(unitBuffs.index) do
		if (not name or name == unitBuffs.name[buffIndex]) and
			(not rank or rank == unitBuffs.rank[buffIndex]) and
			(not icon or icon == unitBuffs.icon[buffIndex]) then

			-- index; count, icon, rank
			return unitBuffs.index[buffIndex], unitBuffs.count[buffIndex], unitBuffs.icon[buffIndex], unitBuffs.rank[buffIndex]
		end
	end
end


function lib:UnitHasDebuff(unit, name, rank, icon)
	local unitDebuffs = self.vars.debuffs[unit]

	if not unitDebuffs then return end

	if name and rank and icon then
		local debuffIndex = string.format("%s_%s_%s", name, rank, icon)

		if unitDebuffs.index[debuffIndex] then
			-- index; count, icon, rank
			return unitDebuffs.index[debuffIndex], unitDebuffs.count[debuffIndex], unitDebuffs.icon[debuffIndex], unitDebuffs.rank[debuffIndex]
		else
			return
		end
	end

	for debuffIndex, debuffName in pairs(unitDebuffs.name) do
		if (not name or name == debuffName) and
			(not rank or rank == unitDebuffs.rank[debuffIndex]) and
			(not icon or icon == unitDebuffs.icon[debuffIndex]) then

			-- index; count, icon, rank
			return unitDebuffs.index[debuffIndex], unitDebuffs.count[debuffIndex], unitDebuffs.icon[debuffIndex], unitDebuffs.rank[debuffIndex]
		end
	end
end


function lib:UnitHasDebuffType(unit, dispelType)
	local unitDebuffs = self.vars.debuffs[unit]

	if not unitDebuffs then return end

	for debuffIndex, debuffDispelType in pairs(unitDebuffs.dispelType) do
		if debuffDispelType == dispelType then
			-- index, count, icon, rank
			return unitDebuffs.index[debuffIndex], unitDebuffs.count[debuffIndex], unitDebuffs.icon[debuffIndex], unitDebuffs.rank[debuffIndex]
		end
	end
end

local cache = setmetatable({},{__mode='k'})

local function donothing() end

local function iter(t)
	local unitBuffs, buffIndex = t.unitBuffs, t.buffIndex
	local index
	buffIndex, index = next(unitBuffs.index, buffIndex)
	if buffIndex then
		t.buffIndex = buffIndex
		-- name, index; count, icon, rank, duration, identifier
		return unitBuffs.name[buffIndex], index, unitBuffs.count[buffIndex], unitBuffs.icon[buffIndex], unitBuffs.rank[buffIndex], unitBuffs.duration[buffIndex], buffIndex
	else
		t.unitBuffs = nil
		t.buffIndex = nil
		cache[t] = true
	end
end
function lib:BuffIter(unit)
	local unitBuffs = self.vars.buffs[unit]
	local buffIndex

	if not unitBuffs then
		return donothing
	end

	local t = next(cache) or {}
	cache[t] = nil
	t.unitBuffs = unitBuffs

	return iter, t
end

local function iter(t)
	local unitDebuffs, debuffIndex = t.unitDebuffs, t.debuffIndex
	local index
	debuffIndex, index = next(unitDebuffs.index, debuffIndex)
	if debuffIndex then
		t.debuffIndex = debuffIndex
		-- name, count, dispelType, icon, rank, index, duration, identifier
		return unitDebuffs.name[debuffIndex], unitDebuffs.count[debuffIndex], unitDebuffs.dispelType[debuffIndex], unitDebuffs.icon[debuffIndex], unitDebuffs.rank[debuffIndex], index, unitDebuffs.duration[debuffIndex], debuffIndex
	else
		t.unitDebuffs = nil
		t.debuffIndex = nil
		cache[t] = true
	end
end
function lib:DebuffIter(unit)
	local unitDebuffs = self.vars.debuffs[unit]
	local debuffIndex, index

	if not unitDebuffs then
		return donothing
	end

	local t = next(cache) or {}
	cache[t] = nil
	t.unitDebuffs = unitDebuffs

	return iter, t
end

-------------------------------
--  Say hello to AceLibrary  --
-------------------------------
AceLibrary:Register(lib, vmajor, vminor, activate)
