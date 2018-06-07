local oRA = LibStub("AceAddon-3.0"):GetAddon("oRA3");
local util = oRA.util;
local module = oRA:NewModule("GearScore", "AceEvent-3.0", "AceConsole-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("oRA3");

module.VERSION = tonumber(("$Revision: 150 $"):sub(12, -3));

local gsList = {};
local INIT_GEARSCOR_TEXT = "|CFFFFFFFF--|R"
function module:OnRegister()
	oRA:RegisterList(
		L["GSPF"],
		gsList,
		L["Name"],
		L["GearScore"]
	);

	oRA.RegisterCallback(self, "OnListSelected");
	oRA.RegisterCallback(self, "OnGroupChanged");
	oRA.RegisterCallback(self, "OnStartup");
end

function module:OnEnable()
	self.player = UnitName("player");
	self:RegisterEvent("CHAT_MSG_ADDON");
end

function module:SendSync(prefix, msg)
	if GetRealNumRaidMembers() > 0 then
		SendAddonMessage(prefix, msg, "RAID");
	elseif GetRealNumPartyMembers() > 0 then
		SendAddonMessage(prefix, msg, "PARTY");
	else
		SendAddonMessage(prefix, msg);
	end
end

function module:CHAT_MSG_ADDON(event, ...)
	local prefix, msg, channel, sender = ...;
	if sender ~= self.player and msg and channel ~= "WHISPER" and prefix == "Duowan_GearScore" then
		if (msg ~= "CheckGearScore") then					
			self:AddPlayer(sender, msg);
			oRA:UpdateList(L["GSPF"], true);
		end
	end
end

function module:OnListSelected(event, list, flag)
	if list == L["GSPF"] then	
		if (not flag) then wipe(gsList); end
		self:UpdateGearScoreList();
		if (not flag) then self:SendSync("Duowan_GearScore", "CheckGearScore"); end
	end
end

function module:OnGroupChanged(event, status, members)
	if (oRA3Frame and oRA3Frame:IsShown()) then
		self:UpdateGearScoreList();
		self:SendSync("Duowan_GearScore", "CheckGearScore");
		oRA:UpdateList(L["GSPF"]);
	end	
end

function module:AddPlayer(name, gearScore)
	if not name then return end
	local k = util:inTable(gsList, name, 1);
	if not k then
		gsList[#gsList + 1] = { name };
		k = #gsList;
	end

	gearScore = gearScore or gsList[k][2] or INIT_GEARSCOR_TEXT;
	gsList[k][2] = gearScore;
end

function module:GetGearScoreString(unit)
	local gsText = nil;
	if (GearScore_GetScore and CanInspect(unit, false)) then
		NotifyInspect(unit); 
		local name = UnitName(unit);
		local gs = GearScore_GetScore(name, unit);		
		local r, b, g;
		if (gs < 500) then 
			r, b, g = 1, 1, 1;
		else
			r, b, g = GearScore_GetQuality(gs);
		end
		gsText = format("|cff%02x%02x%02x%d|r", r*255, g*255, b*255, gs);		
	end

	return gsText;
end

function module:UpdateGearScoreList()
	local name, gsText;
	if GetRealNumRaidMembers() > 0 then		
		for i=1, 40 do			
			name = UnitName("raid" .. i);
			if (name) then
				NotifyInspect("raid" .. i); 
				gsText = self:GetGearScoreString("raid" .. i);
				self:AddPlayer(name, gsText);
			end			
		end
	elseif GetRealNumPartyMembers() > 0 then
		for i=1, MAX_PARTY_MEMBERS do			
			name = UnitName("party"..i);
			if (name) then
				NotifyInspect("party"..i); 
				gsText = self:GetGearScoreString("party" .. i);
				self:AddPlayer(name, gsText);
			end					
		end

		name = UnitName("player");
		gsText = self:GetGearScoreString("player");
		self:AddPlayer(name, gsText);
	end	
end

function module:OnStartup()
	wipe(gsList);

	self:UpdateGearScoreList();
end
