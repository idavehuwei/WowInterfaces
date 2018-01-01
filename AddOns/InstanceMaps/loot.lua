local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
local mod = addon:NewModule("Loot", "AceEvent-3.0", "AceTimer-3.0", "AceConsole-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("InstanceMaps")
local pt = LibStub("LibPeriodicTable-3.1")
local BB = LibStub("LibBabble-Boss-3.0")
local BBL = BB:GetLookupTable()
local BBR = BB:GetReverseLookupTable()
local BZ = LibStub("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZR = BZ:GetReverseLookupTable()

local boss, current_zone, viewer

local InstanceMaps_Loot_ScanTooltip
function mod:OnEnable()
	self:RegisterMessage("InstanceMaps_Notes_Click")
	self:RegisterMessage("InstanceMap_Show")
	self:RegisterMessage("InstanceMap_Hide", "HideViewer")

	InstanceMaps_Loot_ScanTooltip = CreateFrame("GameTooltip", "InstanceMaps_Loot_ScanTooltip", UIParent, "GameTooltipTemplate")
	InstanceMaps_Loot_ScanTooltip:SetOwner(UIParent, "ANCHOR_NONE")
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

	if boss == old_boss then
		-- close the viewer
		boss = nil
		return self:HideViewer()
	end
	
	self:UpdateViewer()
end

function mod:UpdateViewer()
	if not (boss and current_zone) then return end
	if not viewer then
		viewer = LibStub("LibSimpleFrame-1.0"):New("InstanceMaps_LootViewer", {
			position = {point="CENTER", x=0, y=0},
			lock = false,
			scale = 1,
			strata = "FULLSCREEN",
			fade = 1,
			opacity = 1,
			width = 250,
			border = {0.9, 0.82, 0, 1},
			background = {0, 0, 0, 1},
			min_height = 20,
		})
		local close = CreateFrame("Button", nil, viewer, "UIPanelCloseButton")
		close:SetPoint("TOPRIGHT", viewer)
		close:SetScript("OnClick", self.HideViewer)
	end

	-- haxxor
	if (current_zone == "Blackrock Spire") then
		if pt("InstanceLoot.Upper " .. current_zone .. "." .. boss) then
			current_zone = "Upper Blackrock Spire"
		elseif pt("InstanceLoot.Lower " .. current_zone .. "." .. boss) then
			current_zone = "Lower Blackrock Spire"
		end
	end
	-- end haxxor

	if not pt("InstanceLoot." .. current_zone .. "." .. boss) and not pt("InstanceLootHeroic." .. current_zone .. "." .. boss) then
		self:Print(("PT3 has no table InstanceLoot.%s.%s"):format(current_zone, boss))
		return self:HideViewer()
	end
	
	viewer:Clear()
	
	viewer:AddLine(BBL[boss])

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

	--viewer:AddLine("Close"):Handler("OnLeftClick", hide_viewer)

	viewer:Size()
	viewer:SetPosition()
	viewer:Show()
end

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
			line = viewer:AddLine("|T"..texture..":12|t "..name, percentage):Color(r, g, b)
				:Handler("OnEnter", self.OnMouseEnter, link)
		else
			line = viewer:AddLine(id, percentage):Color(1, 0, 0)
				:Handler("OnEnter", self.OnUnknownEnter)
		end
		line:Handler("OnLeftClick", self.DropClick, id):Handler("OnLeave", self.OnMouseLeave)
	end
end

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
		if not ChatFrameEditBox:IsVisible() then
			ChatFrameEditBox:Show()
		end
		ChatFrameEditBox:Insert(link)
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
	GameTooltip:SetOwner(viewer, "ANCHOR_RIGHT")
	GameTooltip:SetHyperlink(link)
end

function mod.OnUnknownEnter()
	--GameTooltip_SetDefaultAnchor(GameTooltip, this)
	GameTooltip:SetOwner(viewer, "ANCHOR_RIGHT")
	GameTooltip:SetText(L["Unknown item; click to query"])
end

function mod.OnMouseLeave()
	GameTooltip:Hide()
end

