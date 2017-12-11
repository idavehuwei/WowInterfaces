--[[

	Copyright (c) 2009 Adrian L Lange <adrianlund@gmail.com>
	All rights reserved.

	You're allowed to use this addon, free of monetary charge,
	but you are not allowed to modify, alter, or redistribute
	this addon without express, written permission of the author.

--]]

local addonName, ns = ...
local L = ns.L

local pendingName, pendingIcon
local addon = CreateFrame('Frame', addonName)
local broker = LibStub('LibDataBroker-1.1'):NewDataObject(addonName, {
	type = 'data source',
	iconCoords = {0.065, 0.935, 0.065, 0.935}
})

-- Borrowed from tekkub's EquipSetUpdater
local function GetTextureIndex(tex)
	RefreshEquipmentSetIconInfo()
	tex = tex:lower()
	local numicons = GetNumMacroIcons()
	for i=INVSLOT_FIRST_EQUIPPED,INVSLOT_LAST_EQUIPPED do if GetInventoryItemTexture("player", i) then numicons = numicons + 1 end end
	for i=1,numicons do
		local texture, index = GetEquipmentSetIconInfo(i)
		if texture:lower() == tex then return index end
	end
end

local function equipped(name)
	for slot, location in next, GetEquipmentSetLocations(name) do
		local located = true

		if(location == 0) then
			located = not GetInventoryItemLink('player', slot)
		elseif(location ~= 1) then
			local player, bank, bags = EquipmentManager_UnpackLocation(location)
			located = player and not bank and not bags
		end

		if(not located) then
			return
		end
	end

	return true
end

local function menuClick(button, name, icon)
	if(IsShiftKeyDown()) then
		local dialog = StaticPopup_Show('CONFIRM_OVERWRITE_EQUIPMENT_SET', name)
		dialog.data = name
		dialog.selectedIcon = GetTextureIndex(icon)
	elseif(IsControlKeyDown()) then
		local dialog = StaticPopup_Show('CONFIRM_DELETE_EQUIPMENT_SET', name)
		dialog.data = name
	else
		EquipmentManager_EquipSet(name)

		if(InCombatLockdown()) then
			pendingName, pendingIcon = name, icon
			addon:RegisterEvent('PLAYER_REGEN_ENABLED')
		end
	end
end

local function updateInfo(name, icon)
	broker.text = pendingName and '|cffff0000'..pendingName or name
	broker.icon = pendingIcon or icon

	Broker_EquipmentDB.text = pendingName or name
	Broker_EquipmentDB.icon = pendingIcon or icon
end

function broker:OnClick(button)
	if(button == 'RightButton') then
		if(GearManagerDialog:IsVisible()) then
			if(PaperDollFrame:IsVisible()) then
				ToggleCharacter('PaperDollFrame')
			end
			GearManagerDialog:Hide()
		else
			if(not PaperDollFrame:IsVisible()) then
				ToggleCharacter('PaperDollFrame')
			end
			GearManagerDialog:Show()
		end
	elseif(GetNumEquipmentSets() > 0) then
		ToggleDropDownMenu(1, nil, addon, self, 0, 0)
	end

	if(GameTooltip:GetOwner() == self) then
		GameTooltip:Hide()
	end
end

function broker:OnTooltipShow()
	self:AddLine('|cff0090ffBroker Equipment|r')
	self:AddLine(L[2])
end

function addon:initialize(level)
	local info = wipe(self.info)
	info.isTitle = 1
	info.notCheckable = 1
	info.text = '|cff0090ffBroker Equipment|r\n '
	UIDropDownMenu_AddButton(info, level)

	wipe(info)
	for index = 1, GetNumEquipmentSets() do
		local name, icon = GetEquipmentSetInfo(index)
		info.text = string.format('|T%s:20|t %s', icon, name)
		info.arg1 = name
		info.arg2 = icon
		info.func = menuClick
		info.checked = equipped(name) or pending and pending == name
		UIDropDownMenu_AddButton(info, level)
	end

	wipe(info)
	info.text = ' '
	info.disabled = 1
	info.notCheckable = 1
	UIDropDownMenu_AddButton(info, level)

	info.text = L[3]
	UIDropDownMenu_AddButton(info, level)
end

function addon:ADDON_LOADED(event, name)
	if(name ~= addonName) then return end

	Broker_EquipmentDB = Broker_EquipmentDB or {text = L[1], icon = [=[Interface\PaperDollInfoFrame\UI-EquipmentManager-Toggle]=]}

	self.info = {}
	self.displayMode = 'MENU'

	updateInfo(Broker_EquipmentDB.text, Broker_EquipmentDB.icon)
	self:RegisterEvent('EQUIPMENT_SETS_CHANGED')
	self:RegisterEvent('UNIT_INVENTORY_CHANGED')
	self:RegisterEvent('VARIABLES_LOADED')
	self:UnregisterEvent(event)
end

function addon:VARIABLES_LOADED(event)
	SetCVar('equipmentManager', 1)
	GearManagerToggleButton:Show()

	self:UnregisterEvent(event)
end

function addon:PLAYER_REGEN_ENABLED(event)
	EquipmentManager_EquipSet(pendingName)
	pendingName, pendingIcon = nil, nil
	self:UnregisterEvent(event)
end

function addon:UNIT_INVENTORY_CHANGED(event, unit)
	if(unit and unit ~= 'player') then return end

	for index = 1, GetNumEquipmentSets() do
		local name, icon = GetEquipmentSetInfo(index)
		if(equipped(name)) then
			updateInfo(name, icon)
			break
		else
			updateInfo(UNKNOWN, [=[Interface\Icons\INV_Misc_QuestionMark]=])
		end
	end
end

addon.EQUIPMENT_SETS_CHANGED = addon.UNIT_INVENTORY_CHANGED
addon:RegisterEvent('ADDON_LOADED')
addon:SetScript('OnEvent', function(self, event, ...) self[event](self, event, ...) end)
