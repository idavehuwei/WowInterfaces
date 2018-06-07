local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
local mod = addon:NewModule("Loot", "AceEvent-3.0", "AceTimer-3.0", "AceConsole-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("InstanceMaps")
--local pt = LibStub("LibPeriodicTable-3.1")
local BB = LibStub("LibBabble-Boss-3.0")
local BBL = BB:GetLookupTable()
local BBR = BB:GetReverseLookupTable()
local BZ = LibStub("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZR = BZ:GetReverseLookupTable()
local LibData = LibStub("LibInstanceLootData_data-1.0");
local LibLoot = LibStub("LibInstanceLootData-1.0");

local boss, current_zone, viewer, current_boss
local instanceTypeList = {};

local InstanceMaps_Loot_ScanTooltip

function mod:OnEnable()
	self:RegisterMessage("InstanceMaps_Notes_Click")
	self:RegisterMessage("InstanceMap_Show")
	self:RegisterMessage("InstanceMap_Hide", "HideViewer")

	self:InitinstanceTypeList();
	InstanceMaps_Loot_ScanTooltip = CreateFrame("GameTooltip", 
	"InstanceMaps_Loot_ScanTooltip", 
	UIParent, "GameTooltipTemplate")
	InstanceMaps_Loot_ScanTooltip:SetOwner(UIParent, "ANCHOR_NONE")
end

function mod:InitinstanceTypeList()
	for k, v in pairs(LibData["Loot"]) do
		for n, _ in pairs(v) do
			instanceTypeList[n] = k;
		end
	end
end

function mod:HasBossLoot(instance, boss)
	local iType = instanceTypeList[instance];
	if (iType and LibData["Loot"][iType][instance][boss]) then
		return true;
	end
end

local bosslist
function mod:InstanceMap_Show()
	self:HideViewer() -- it'll be an old boss's data
	
	--[[if not bosslist then
		bosslist = CreateFrame("Button", "InstanceMaps_BossListButton")
	end--]]
end

function mod:InstanceMaps_Notes_Click(event, title, zone, data)
	if not (title and BBR[title]) then return end
	self:DisplayLoot(zone, title)	
end

function mod:DisplayLoot(zone, title)
	local old_boss = boss
	boss = BBR[title]
	current_zone = zone
	current_boss = boss
	if boss == old_boss then
		-- close the viewer
		boss = nil
		return self:HideViewer()
	end
	
	self:UpdateViewer()
end

function addon:ShowBoss(zone, boss)
	local old_boss = boss
	boss = BBR[boss] and BBR[boss] or boss
	if boss == current_boss then
		return mod:HideViewer()
	end
	current_boss = boss
	current_zone = zone
	mod:UpdateViewer()
end

function mod:UpdateViewer()
	boss = current_boss;
	if not (current_boss and current_zone) then return end
	if not viewer then
		local scroll = CreateFrame("ScrollFrame", "InstanceMaps_ScrollFrame", UIParent, "UIPanelScrollFrameTemplate");
		scroll:SetWidth(250);
		scroll:SetPoint("TOPRIGHT", instanceMapFrame, "TOPRIGHT", -20, 0);
		scroll:SetPoint("BOTTOMRIGHT", instanceMapFrame, "BOTTOMRIGHT", -2, 0);
		scroll:SetFrameStrata("FULLSCREEN");		
		instanceMapFrame:SetScript("OnShow", function(self)
			scroll:SetFrameLevel(self:GetFrameLevel() + 3);
			scroll:Show();
		end);
		instanceMapFrame:SetScript("OnHide", function(self)
			scroll:Hide();
		end);
		
		viewer = LibStub("LibSimpleFrame-1.0"):New("InstanceMaps_LootViewer", {
			position = {point="TOPLEFT", relpoint="TOPLEFT", x=-2, y=0},
			lock = false,
			scale = 1,
			strata = "FULLSCREEN",
			fade = 1,
			opacity = 1,
			width = 250,
			border = {0.9, 0.82, 0, 0},
			background = {0, 0, 0, 0.3},
			min_height = 20,
		}, 0, scroll);
		local close = CreateFrame("Button", nil, viewer, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", viewer)
		close:SetScript("OnClick", self.HideViewer)				
		viewer.core:SetClampedToScreen(false);
		viewer.core:SetFrameLevel(scroll:GetFrameLevel() + 3);
		scroll:SetScrollChild(viewer.core);
		viewer:Attach("TOPRIGHT", scroll, "TOPRIGHT", -2, 0);
	end

	-- haxxor 黑石塔
	--[[
	if (current_zone == "Blackrock Spire") then
		if pt("InstanceLoot.Upper " .. current_zone .. "." .. boss) then
			current_zone = "Upper Blackrock Spire"
		elseif pt("InstanceLoot.Lower " .. current_zone .. "." .. boss) then
			current_zone = "Lower Blackrock Spire"
		end
	end
	]]
	-- end haxxor

	-- 血色修道院
	if (current_zone == "Armory" or current_zone == "Cathedral" or current_zone == "Graveyard" or current_zone == "Library") then
		current_zone = "Scarlet Monastery";
	end
	-- 检查是否有boss掉落信息
	if (not self:HasBossLoot(current_zone, boss)) then
		return self:HideViewer();
	end
	--[[
	if not pt("InstanceLoot." .. current_zone .. "." .. boss) and not 
	pt("InstanceLootHeroic." .. 
	current_zone .. "." .. boss) then
		self:Print(("PT3 has no table InstanceLoot.%s.%s"):format(current_zone, boss))
		return self:HideViewer()
	end
	]]
	viewer:Clear()
	
	viewer:AddLine(BBL[boss])
	
	-- ===BEGEIN BOSS INFO===
	local iType =  instanceTypeList[current_zone];
	local difficultiesList = LibLoot:GetBossDifficulties(iType, current_zone, boss);
	local Loots, droprate;
	for i, difficulty in ipairs(difficultiesList) do
		viewer:AddLine()
		viewer:AddLine(L[LibLoot:GetDifficultyString(iType, difficulty)] or LibLoot:GetDifficultyString(iType, difficulty));
		Loots = LibLoot:GetBossLootByDifficulties(iType, current_zone, boss, difficulty);
		for _, id in ipairs(Loots) do
			droprate = LibLoot:GetBossLootDropRate(iType, current_zone, boss, difficulty, id);
			local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(id)
			local percentage = ("%.1f%%"):format(droprate or 0);
			local line
			if link then
				local r, g, b = GetItemQualityColor(rarity)
				line = viewer:AddLine("|T"..texture..":12|t "..name, percentage):Color(r, g, 
				b):Handler("OnEnter", self.OnMouseEnter, link)
			else
				line = viewer:AddLine(id, percentage):Color(1, 0, 0):Handler("OnEnter", self.OnUnknownEnter)
			end
			line:Handler("OnLeftClick", self.DropClick, id):Handler("OnLeave", self.OnMouseLeave)
		end
	end
		
	--[[
	if pt("InstanceLoot." .. current_zone .. "." .. boss) then
		viewer:AddLine()
		viewer:AddLine(L["Normal Drops"])
		self:AddSetTo(viewer, "InstanceLoot." .. current_zone .. "." .. boss)
	end
	if pt("InstanceLootHeroic." .. current_zone .. "." .. boss) then
		viewer:AddLine()
		viewer:AddLine(L["Heroic Drops"])
		self:AddSetTo(viewer, "InstanceLootHeroic." .. current_zone .. "." .. boss)
	end
	]]
	-- ===END BOSS INFO===
	--viewer:AddLine("Close"):Handler("OnLeftClick", hide_viewer)
	viewer:Size()
	viewer:SetPosition()
	for i,l in pairs(viewer.lines) do
		l:RegisterForDrag(nil)		
	end
	viewer:Show()
end
--[[
local sort_set
do
	local itemids, droprates = {}, {}
	local function by_droprate(a, b)
		return tonumber(droprates[a]) > tonumber(droprates[b])
	end
	function sort_set(set)
		for k,v in pairs(itemids) do itemids[k] = nil end
		for k,v in pairs(droprates) do droprates[k] = nil end
		for id, drop in pt:IterateSet(set) do
			droprates[id] = drop
			table.insert(itemids, id)
		end
		table.sort(itemids, by_droprate)
		return itemids, droprates
	end
end

function mod:AddSetTo(viewer, set)
	local itemids, droprates = sort_set(set)
	for i, id in ipairs(itemids) do
		local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(id)
		local percentage = ("%.1f%%"):format(droprates[id] / 10)
		local line
		if link then
			local r, g, b = GetItemQualityColor(rarity)
			line = viewer:AddLine("|T"..texture..":12|t "..name, percentage):Color(r, g, 
			b):Handler("OnEnter", self.OnMouseEnter, link)
		else
			line = viewer:AddLine(id, percentage):Color(1, 0, 0):Handler("OnEnter", self.OnUnknownEnter)
		end
		line:Handler("OnLeftClick", self.DropClick, id):Handler("OnLeave", self.OnMouseLeave)
	end
end
]]
function mod:HideViewer()
	if viewer then
		boss = nil
		viewer:Hide()
	end
end

function mod.DropClick(_, id)
	local name, link, rarity, _,_,_,_,_,_, texture = GetItemInfo(id)
	if not name then
		InstanceMaps_Loot_ScanTooltip:SetOwner(UIParent, "ANCHOR_NONE")
		InstanceMaps_Loot_ScanTooltip:SetHyperlink("item:" .. id)
		InstanceMaps_Loot_ScanTooltip:Hide()
		mod:ScheduleTimer(mod.UpdateViewer, 1, mod)
		return
	end
	if IsModifiedClick("DRESSUP") then
		DressUpItemLink(link)
	elseif IsModifiedClick("CHATLINK") then
		if not SELECTED_CHAT_FRAME.editBox:IsVisible() then
			SELECTED_CHAT_FRAME.editBox:Show()
		end
		SELECTED_CHAT_FRAME.editBox:Insert(link)
	else
		ShowUIPanel(ItemRefTooltip)
		if not ItemRefTooltip:IsVisible() then
			ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
		end
		ItemRefTooltip:SetHyperlink(link)
	end
end

function mod.OnMouseEnter(_, link)
	--GameTooltip_SetDefaultAnchor(GameTooltip, this)	
	WorldMapTooltip:SetOwner(viewer, "ANCHOR_RIGHT");	
	WorldMapTooltip:SetHyperlink(link)
end

function mod.OnUnknownEnter()
	--GameTooltip_SetDefaultAnchor(GameTooltip, this)
	WorldMapTooltip:SetOwner(viewer, "ANCHOR_RIGHT")
	WorldMapTooltip:SetText(L["Unknown item; click to query"])
end

function mod.OnMouseLeave()
	WorldMapTooltip:Hide()
end

