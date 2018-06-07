
local L = {};
if (GetLocale() == "zhCN") then
	L["Zone Info"] = "区域信息";
	L["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "显示鼠标所指的区域信息, 在世界地图上显示该区域的适合等级，该区域的副本及副本人数限制（例如5人、40人）。";
	L["Instances"] = "副本";
	L["%d-man"] = "%d人";
	L[" and "] = " and ";
elseif (GetLocale() == "zhTW") then
	L["Zone Info"] = "地區資訊";
	L["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "顯示游標所在地區資訊的模組，在世界地圖上顯示此地區的適合等級，此地區的副本和副本的人數限制 (例如: 5人、40人)。";
	L["Instances"] = "副本";
	L["%d-man"] = "%d人";
	L[" and "] = " and ";
else
	L["Zone Info"] = "Zone Info";
	L["Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man)."] = "Module which on hovering over a zone, will show the levels of the zone, the instances in the zone, their levels, and the group size the instance is made for (e.g. 5-man, 40-man).";
	L["Instances"] = "Instances";
	L["%d-man"] = "%d-man";
	L[" and "] = " and ";
end

local Tourist = LibStub("LibTourist-3.0");
local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster")
local ZoneInfo = Mapster:NewModule("ZoneInfo", "AceHook-3.0")

function ZoneInfo:OnInitialize()
	self.name = L["Zone Info"]
	self.title = L["Zone Info"]
	--[[
	WorldMapButton:HookScript("OnUpdate", function(...)
		ZoneInfo:WorldMapButton_OnUpdate(...)
	end);
	]]
end

local fishingLevels
do
	local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
	fishingLevels = {
		[BZ["Borean Tundra"]]		= 380,
		[BZ["Dragonblight"]]		= 380,
		[BZ["Grizzly Hills"]]		= 380,
		[BZ["Howling Fjord"]]		= 380,
		[BZ["Zul'Drak"]]		= 380,
		[BZ["Crystalsong Forest"]]	= 405,
		[BZ["Dalaran"]]			= 430,
		[BZ["Sholazar Basin"]]		= 430,
		[BZ["Wintergrasp"]]		= 430,
		[BZ["Icecrown"]]		= 455,
		[BZ["The Storm Peaks"]]		= 455,
		[BZ["Ulduar"]]			= 455,
		[BZ["The Frozen Sea"]]		= 480,
	}
end

function ZoneInfo:OnEnable()	
	if not self.frame then
		self.frame = CreateFrame("Frame", "CartographerZoneInfo", WorldMapFrame)
		
		self.frame.text = WorldMapFrameAreaFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
		local text = self.frame.text
		local font, size = GameFontHighlightLarge:GetFont()
		text:SetFont(font, size*1.2, "OUTLINE")
		text:SetPoint("TOP", WorldMapFrameAreaDescription, "BOTTOM", 0, -5)
		text:SetWidth(1024)		
	end
	self.frame:Show();
	self:SecureHookScript(WorldMapButton, "OnUpdate", "WorldMapButton_OnUpdate");
end

function ZoneInfo:OnDisable()
	self.frame:SetScript("OnUpdate", nil);
	self.frame:Hide()
	WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
	self:Unhook(WorldMapButton, "OnUpdate");
end

local lastZone
local t = {}

function ZoneInfo:WorldMapButton_OnUpdate(...)
	local self = ZoneInfo;
	if not self.frame or not self.frame:IsShown() then
		return
	end
	if not WorldMapDetailFrame:IsShown() or not WorldMapFrameAreaLabel:IsShown() then
		self.frame.text:SetText("")
		lastZone = nil
		return
	end

	local underAttack = false
	local zone = WorldMapFrameAreaLabel:GetText()
	if zone then
		zone = string.gsub(WorldMapFrameAreaLabel:GetText(), " |cff.+$", "")
		if WorldMapFrameAreaDescription:GetText() then
			underAttack = true
			zone = string.gsub(WorldMapFrameAreaDescription:GetText(), " |cff.+$", "")
		end
	end
	if GetCurrentMapContinent() == 0 then
		local c1, c2 = GetMapContinents()
		if zone == c1 or zone == c2 then
			WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
			self.frame.text:SetText("")
			return
		end
	end
	if not zone or not Tourist:IsZoneOrInstance(zone) then
		zone = WorldMapFrame.areaName
	end
	WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
	if zone and (Tourist:IsZoneOrInstance(zone) or Tourist:DoesZoneHaveInstances(zone)) then
		if not underAttack then
			WorldMapFrameAreaLabel:SetTextColor(Tourist:GetFactionColor(zone))
			WorldMapFrameAreaDescription:SetTextColor(1, 1, 1)
		else
			WorldMapFrameAreaLabel:SetTextColor(1, 1, 1)
			WorldMapFrameAreaDescription:SetTextColor(Tourist:GetFactionColor(zone))
		end
		local low, high = Tourist:GetLevel(zone)
		-- fishing changes
		local minFish
		if GetCurrentMapContinent() == 4 then
			minFish = fishingLevels[zone]
		else
			minFish = Tourist:GetFishingLevel(zone)
		end
		local fishing_skill_text
		if minFish then
			local numSkills = GetNumSkillLines();
			local skillName
			for i=1, numSkills do
				local _, skillRank
				skillName, _, _, skillRank, _, _, _, _, _, _, _, _, _ = GetSkillLineInfo(i);
				local fishingSpell = GetSpellInfo(7620) -- 7620 Fishing
				if skillName == fishingSpell then
					local r,g,b = 1,1,0
					local r1,g1,b1 = 1,0,0
					if minFish < skillRank then
						r1,g1,b1 = 0,1,0
					end
					fishing_skill_text = string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r",r * 255, g * 255, b * 255,fishingSpell, r1 * 255, g1 * 255, b1 * 255, minFish)
				end
			end
			if not fishing_skill_text then
				minFish = nil
			end
		end
		-- end change
		if low > 0 and high > 0 then
			local r, g, b = Tourist:GetLevelColor(zone)
			local levelText
			if low == high then
				levelText = string.format(" |cff%02x%02x%02x[%d]|r", r * 255, g * 255, b * 255, high)
			else
				levelText = string.format(" |cff%02x%02x%02x[%d-%d]|r", r * 255, g * 255, b * 255, low, high)
			end
			local groupSize = Tourist:GetInstanceGroupSize(zone)
			local sizeText = ""
			if groupSize > 0 then
				sizeText = " " .. string.format(L["%d-man"], groupSize)
			end
			if not underAttack then
				WorldMapFrameAreaLabel:SetText(string.gsub(WorldMapFrameAreaLabel:GetText(), " |cff.+$", "") .. levelText .. sizeText)
			else
				WorldMapFrameAreaDescription:SetText(string.gsub(WorldMapFrameAreaDescription:GetText(), " |cff.+$", "") .. levelText .. sizeText)
			end
		end
		
		if Tourist:DoesZoneHaveInstances(zone) then
			if lastZone ~= zone then
				lastZone = zone
				table.insert(t, string.format("|cffffff00%s:|r", L["Instances"]))
				for instance in Tourist:IterateZoneInstances(zone) do
					local complex = Tourist:GetComplex(instance)
					local low, high = Tourist:GetLevel(instance)
					local r1, g1, b1 = Tourist:GetFactionColor(instance)
					local r2, g2, b2 = Tourist:GetLevelColor(instance)
					local groupSize = Tourist:GetInstanceGroupSize(instance)
					--local altGroupSize = Tourist:GetInstanceAltGroupSize(instance)
					local name = instance
					if complex then
						name = complex .. " - " .. instance
					end
					if low == high then
						if groupSize > 0 then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r " .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, high, groupSize))
						else
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d]|r", r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, high))
						end
					else
						if groupSize > 0 then
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d-%d]|r " .. L["%d-man"], r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, low, high, groupSize))
						else
							table.insert(t, string.format("|cff%02x%02x%02x%s|r |cff%02x%02x%02x[%d-%d]|r", r1 * 255, g1 * 255, b1 * 255, name, r2 * 255, g2 * 255, b2 * 255, low, high))
						end
					end
				end
				if minFish and fishing_skill_text then
					table.insert(t,fishing_skill_text)
				end
				self.frame.text:SetText(table.concat(t, "\n"))
				for k in pairs(t) do
					t[k] = nil
				end
			end			
		else
			if minFish and fishing_skill_text then
				self.frame.text:SetText(fishing_skill_text)
			else
				self.frame.text:SetText("")
			end
			lastZone = nil
		end		
	elseif not zone then
		lastZone = nil
		self.frame.text:SetText("")
	end
end