local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
local mod = addon:NewModule("Browse", "AceEvent-3.0", "AceHook-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("InstanceMaps")
local BZ = LibStub("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZR = BZ:GetReverseLookupTable()
local Tourist = LibStub("LibTourist-3.0")

local current_instance

function mod:OnEnable()
	self:RegisterMessage("InstanceMap_Show")
	self:RegisterMessage("InstanceMap_Hide")
	self:SecureHook(WorldMapFrame, "Show", "WorldMapFrame_Show")
	self:RegisterEvent("PLAYER_LEVEL_UP")
end

function mod:InstanceMap_Show(event, zone)
	current_instance = zone
	self:WorldMapFrame_Show()
end
function mod:InstanceMap_Hide()
	current_instance = nil
	self:WorldMapFrame_Show()
end

local dropdown_info
local function generate_dropdown()
	local function instancemenu_sorter(a, b)
		return (a.sortBy or a.text) < (b.sortBy or b.text)
	end
	local function show_instance(_, instance)
		addon:ShowInstance(instance)
		CloseDropDownMenus()
	end
	dropdown_info = {
		[1] = {
		},
		[2] = {
		},
	}

	for i=1, 5 do
		local dropdown = {}
		
		local name = select(i, GetMapContinents())
		
		local func
		if i == 1 then
			func = Tourist.IsInKalimdor
		elseif i == 2 then
			func = Tourist.IsInEasternKingdoms
		elseif i == 3 then
			func = Tourist.IsInOutland
		elseif i == 4 then
			func = Tourist.IsInNorthrend
		end
		
		if i ~= 5 then
			for k in pairs(addon.MapData) do
				if func and func(Tourist, BZL[k]) then
					local v = BZL[k]
					local text = v
					local low, high = Tourist:GetLevel(v)
					local r, g, b = Tourist:GetLevelColor(v)
					local levelText
					if low == 0 then
						levelText = ""
					elseif low == high then
						levelText = (" |cff%02x%02x%02x[%d]|r"):format(r * 255, g * 255, b * 255, high)
					else
						levelText = (" |cff%02x%02x%02x[%d-%d]|r"):format(r * 255, g * 255, b * 255, low, high)
					end
					local r, g, b = Tourist:GetFactionColor(v)
					local complex = Tourist:GetComplex(v)
					if complex then
						text = complex .. " - " .. text
					end
					text = ("|cff%02x%02x%02x%s|r%s"):format(r*255, g*255, b*255, text, levelText)
					local groupSize = Tourist:GetInstanceGroupSize(v)
					if groupSize > 0 then
						text = text .. " " .. (L["%d-man"]):format(groupSize)
					end
					
					table.insert(dropdown, {
						text = text,
						func = show_instance,
						arg1 = k,
						value = k,
						sortBy = complex or v,
					})
				end
			end
		end

		if next(dropdown) then
			table.sort(dropdown, instancemenu_sorter)
			table.insert(dropdown_info[1], {
				text = name,
				hasArrow = true,
				value = name,
			})
			dropdown_info[2][name] = dropdown
		end
	end
	table.insert(dropdown_info[1], {
		text = L["Close"],
		func = CloseDropDownMenus(1),
	})
end

local function init_dropdown(_, level)
	-- Make sure level is set to 1, if not supplied
	level = level or 1

	-- Get the current level from the info table
	local info = dropdown_info[level]

	-- If a value has been set, try to find it at the current level
	if level > 1 and UIDROPDOWNMENU_MENU_VALUE then
		if info[UIDROPDOWNMENU_MENU_VALUE] then
			info = info[UIDROPDOWNMENU_MENU_VALUE]
		end
	end

	-- Add the buttons to the menu
	for idx,entry in ipairs(info) do
		if type(entry.checked) == "function" then
			-- Make this button dynamic
			local new = {}
			for k,v in pairs(entry) do new[k] = v end
			new.checked = new.checked()
			entry = new
		else
			entry.checked = nil
		end

		UIDropDownMenu_AddButton(entry, level)
	end
end

--local button
local dropdown
function mod:WorldMapFrame_Show()
	WorldMapZoomOutButton:Hide()
	
	if not dropdown then
		dropdown = CreateFrame("Frame", "InstanceMaps_Browse_Dropdown", WorldMapFrame, "UIDropDownMenuTemplate")
		dropdown:SetPoint("LEFT", WorldMapZoneDropDown, "RIGHT", -33, 0)
		local label = dropdown:CreateFontString("InstanceMaps_Browse_Label", "ARTWORK", "GameFontNormalSmall")
		label:SetPoint("TOPLEFT", dropdown, "TOPLEFT", 20, 10)
		label:SetText(L["Instances"])
	end

	if not dropdown_info then
		generate_dropdown()
	end
	UIDropDownMenu_Initialize(dropdown, init_dropdown)
	UIDropDownMenu_SetWidth(dropdown, 130)

	if ((GetCurrentMapContinent() == 0) or (GetCurrentMapContinent() == WORLDMAP_COSMIC_ID)) or (not current_instance) then
		UIDropDownMenu_ClearAll(dropdown)
	else
		UIDropDownMenu_SetSelectedValue(dropdown, current_instance)
	end
end

function mod:PLAYER_LEVEL_UP()
	-- Kill the dropdown, which will make it be regenerated next time it's requested.
	dropdown_info = nil
end

