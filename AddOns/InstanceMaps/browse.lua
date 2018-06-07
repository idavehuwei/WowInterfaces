local addon = LibStub("AceAddon-3.0"):GetAddon("InstanceMaps")
local mod = addon:NewModule("Browse", "AceEvent-3.0", "AceHook-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("InstanceMaps")
local BZ = LibStub("LibBabble-Zone-3.0")
local BZL = BZ:GetLookupTable()
local BZR = BZ:GetReverseLookupTable()
local BB = LibStub("LibBabble-Boss-3.0")
local BBL = BB:GetLookupTable()
local BBR = BB:GetReverseLookupTable()
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
	if(bossListFrame)then bossListFrame:Hide(); end
	self:WorldMapFrame_Show()
end
function mod:InstanceMap_Hide()
	current_instance = nil
	self:WorldMapFrame_Show()
	if(bossListFrame)then bossListFrame:Hide(); end
end	

local dropdown_info
function addon:callInstanceShow(zone)
	addon:ShowInstance(zone)
end

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

	for i=1, 4 do
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
			--func = Tourist.IsInNorthrend
		end
		
		if i ~= 4 then
			for k in pairs(addon.MapData) do
				if func(Tourist, BZL[k]) then
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
		elseif (i == 4) then
			-- YssBossLoot
			if (YssBossGenerateMapInfo) then
				dropdown = YssBossGenerateMapInfo();
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
--[[
local function _CreateLine(parent,i)
	local b = CreateFrame("Button", parent:GetName().."_Line"..i, parent);
	b.core = parent;
	b.handlers = {};
	b.handlerValues = {};

	b:RegisterForClicks("LeftButton")
	b:EnableMouse(true)
	--b:Set

	--b:SetScript("OnMouseDown", function() print(222) end)

	local left = b:CreateFontString(b:GetName().."_Left", "OVERLAY");
	local right = b:CreateFontString(b:GetName().."_Right", "OVERLAY");

	left:SetPoint("TOPLEFT", b)
	right:SetPoint("TOPRIGHT", b)

	b.left = left
	b.right = right

	if i == 1 then
		b:SetPoint("TOPLEFT", parent, 5, -5)
	else
		b:SetPoint("TOPLEFT", parent.lines[i-1], "BOTTOMLEFT", 0, 0)
	end

	wipe(b.handlers)
	wipe(b.handlerValues)
	local default_font = ChatFontNormal:GetFont();
	b.left:SetFont(default_font, 12, "");
	b.right:SetFont(default_font, 12, "");
	b.left:SetTextColor(1, 0.82, 0)
	b.left:SetJustifyH("LEFT")
	b.right:SetTextColor(1, 0.82, 0)
	b.right:SetJustifyH("RIGHT")
	b.right:SetWidth(0)
	b:SetWidth(b.core:GetWidth() - 10)
	b:SetHeight(12)

	return b
end

local function AddLine(self, left, right, wrap, indent)	
	indent = indent or 0;
	left = left or ""
	right = right or ""

	self.current_line = self.current_line + 1
	if not self.lines[self.current_line] then
		self.lines[self.current_line] = _CreateLine(self, self.current_line)
	end
	local l = self.lines[self.current_line];
	l.left:SetPoint("TOPLEFT", l, "TOPLEFT", indent, 0);
	l.left:SetText(left)
	l.right:SetText(right)

	local _, left_size = l.left:GetFont()
	local _, right_size = l.right:GetFont()
	local biggest_size = max(left_size, right_size);
	if biggest_size > l:GetHeight() then
		l:SetHeight(biggest_size)
	end

	l.left:SetWidth(l:GetWidth() - l.right:GetWidth() - indent);
	if wrap then
		l:SetHeight(max(l.left:GetHeight(), l.right:GetHeight()))
	else
		l.left:SetHeight(l:GetHeight())
		l.right:SetHeight(l:GetHeight())
	end
	
	l:Show()
	return l
end

local function Clear(self)	
	for i, l in ipairs(self.lines) do
		wipe(l.handlers)
		wipe(l.handlerValues)
		local default_font = ChatFontNormal:GetFont();
		l.left:SetFont(default_font, 12, "");
		l.right:SetFont(default_font, 12, "");
		l.left:SetTextColor(1, 0.82, 0)
		l.left:SetJustifyH("LEFT")
		l.right:SetTextColor(1, 0.82, 0)
		l.right:SetJustifyH("RIGHT")
		l.right:SetWidth(0)
		l:SetWidth(l.core:GetWidth() - 10)
		l:SetHeight(12)
	end
	self.current_line = 0

	return self
end
]]
--local button
local dropdown
local bossListFrame
local first = true;
function mod:WorldMapFrame_Show()
	WorldMapZoomOutButton:Hide()

	if WorldMapLevelDropDown then
		WorldMapLevelDropDown:SetPoint("TOPRIGHT", WorldMapFrame, "TOPRIGHT", -100, -34)
	end
	
	if not dropdown then
		dropdown = CreateFrame("Frame", "InstanceMaps_Browse_Dropdown", WorldMapFrame, "UIDropDownMenuTemplate")
		dropdown:ClearAllPoints();
		dropdown:SetPoint("LEFT", WorldMapZoneDropDown, "RIGHT", -25, 0)
		local label = dropdown:CreateFontString("InstanceMaps_Browse_Label", "ARTWORK","GameFontNormalSmall")
		label:SetPoint("TOPLEFT", dropdown, "TOPLEFT", 20, 10)
		label:SetText(L["Instances"])		
		--UIDropDownMenu_SetButtonWidth(dropdown,150);
		--UIDropDownMenu_SetText(dropdown, L["Instances"]);
	end

	if not dropdown_info then
		generate_dropdown()
	end
	UIDropDownMenu_Initialize(dropdown, init_dropdown)
	UIDropDownMenu_SetWidth(dropdown, 130)
	
	if ((GetCurrentMapContinent() == 0) or (GetCurrentMapContinent() == WORLDMAP_COSMIC_ID)) or (not current_instance) then
		UIDropDownMenu_ClearAll(dropdown)
	else
		--print(current_instance);
		UIDropDownMenu_SetSelectedValue(dropdown, current_instance)
	end

	
--	local backdrop = {
--		bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
--		edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]],
--		tile = true, edgeSize = 16, tileSize = 16,
--		insets = {left = 5, right = 5, top = 5, bottom = 5},
--	}
	--[[
	--new method	
	if not bossListFrame then
		
		bossListFrame = CreateFrame("Frame", "InstanceMaps_Browse_Frame", WorldMapFrame);
		
		bossListFrame:SetBackdrop(backdrop);
		bossListFrame:SetBackdropBorderColor(0.9, 0.82, 0);
		bossListFrame:SetBackdropColor(0, 0, 0);
		bossListFrame:SetMovable(true);
		bossListFrame:SetClampedToScreen(true);

		bossListFrame:SetFrameStrata("DIALOG");
		bossListFrame:SetWidth(230);
		bossListFrame:SetPoint("TOPLEFT", WorldMapFrame, "TOPRIGHT", 0, 0);
		bossListFrame:SetPoint("BOTTOMLEFT", WorldMapFrame, "BOTTOMRIGHT", 0, 0);
		bossListFrame:Hide();
		bossListFrame.lines = {}
		bossListFrame.current_line = 0
		
		textute = bossListFrame:CreateTexture(bossListFrame.."Texture", "OVERLAY")
		textute:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background");
		textute:SetWidth(bossListFrame:GetWidth());
		textute:SetHeight(bossListFrame:GetHeight());
		textute:SetPoint("CENTER", bossListFrame, "CENTER");
		--textute:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy)
		--textute:Show();
		
	end

	local isInstance, instanceType = IsInInstance();
	if (isInstance) and (instanceType == "party" or instanceType=="raid") then
		--bossListFrame:Show();
		--Clear(bossListFrame)
		local zone, type, diff = GetInstanceInfo()
		--AddLine(bossListFrame, zone)
		--AddLine(bossListFrame, "")
		local bzone = BZR[zone] and BZR[zone] or zone
		if (bzone) then
			addon:GetBossList(bzone);
			local bosses = addon.bosses[bzone]
			if bosses then
				for boss, _ in pairs(bosses) do
					if boss then
						if(BBL[boss]~="")then

						local l = AddLine(bossListFrame, BBL[boss]);
						l:SetScript("OnMouseDown", function() addon:ShowBoss(bzone, boss) end)
						end
					end
				end
			end
		end
	else
		bossListFrame:Hide()
	end
	
	if(bossListFrame)then
	bossListFrame:SetFrameLevel(instanceMapFrame:GetFrameLevel() + 5);
	end
	--]]
end

function mod:PLAYER_LEVEL_UP()
	dropdown_info = nil
end

