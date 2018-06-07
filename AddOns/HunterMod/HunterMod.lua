HunterMod = LibStub("AceAddon-3.0"):NewAddon("HunterMod", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HunterMod");
local H = HunterMod;

local defaults = {
  profile = {
    test = "songgenqing",
  }
}
function H:OnInitialize()	
	self.db = LibStub("AceDB-3.0"):New("HunterModDB", defaults, true);
end

function H.raid(message)
	if GetNumRaidMembers() > 0 then
		SendChatMessage(message, "raid")
		return 1
	end
end

function H.party(message)
	if GetNumPartyMembers() > 0 then
		SendChatMessage(message, "party")
		return 1
	end
end

function H.raidWarning(message)
	if (IsRaidLeader() or IsRaidOfficer()) or (GetNumRaidMembers() == 0 and GetNumPartyMembers() > 0) then
		SendChatMessage(message, "raid_warning")
		return 1
	end
end

function H.print(message)
	DEFAULT_CHAT_FRAME:AddMessage("|cffffd200" .. L["HunterMod:"] .. "|r "..message, 1, 1, 1)
	return 1
end

function H.yell(message)
	SendChatMessage(message, "yell")
	return 1
end

function H.channel(message, channel)
	if channel and channel > 0 then
		SendChatMessage(message, "channel", nil, channel)
		return 1
	end
end

function HunterMod_AlignButtons(direction, distance)
	--[[
	local t = {}
	t["BOTTOM"] = "TOP"
	t["TOP"] = "BOTTOM"
	t["LEFT"] = "RIGHT"
	t["RIGHT"] = "LEFT"
	distance = tonumber(distance) or 0
	local x, y = 0, 0
	direction = string.upper(direction or "BOTTOM")
	if direction == "TOP" or direction == "BOTTOM" then
		y = distance
	elseif direction == "LEFT" or direction == "RIGHT" then
		x = distance
	else
		direction = "BOTTOM"
		y = distance
	end
	if direction == "LEFT" or direction == "BOTTOM" then
		x = x * -1
		y = y * -1
	end
	
	ZTrack:ClearAllPoints()
	ZTrack:SetPoint(t[direction], ZAspect, direction, x, y)
	ZTrap:ClearAllPoints()
	ZTrap:SetPoint(t[direction], ZTrack, direction, x, y)
	ZPet:ClearAllPoints()
	ZPet:SetPoint(t[direction], ZTrap, direction, x, y)
	]]
end