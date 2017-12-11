------------------------------------------------------------
-- OptionFrame.lua
--
-- Displays an option frame for EasyTrinket configuration.
--
-- Abin
-- 2008-1-14
------------------------------------------------------------


local VERSION = GetAddOnMetadata("EasyTrinket", "Version") or ""; -- Addon version
local L = EASYTRINKET_LOCALE; -- locale table
local BUTTONFACADE_LOADED = IsAddOnLoaded("ButtonFacade");
Duowan_EasyTrinket_ToggleCheck = nil;
-- Hotkey binding UI texts
BINDING_HEADER_EASYTRINKET_TITLE = L["title"];
BINDING_NAME_EASYTRINKET_HOTKEY1 = L["use trinket 1"];
BINDING_NAME_EASYTRINKET_HOTKEY2 = L["use trinket 2"];
--BINDING_NAME_EASYTRINKET_OPEN_OPTION = L["open option page"];
local db; 
------------------------------------------------------------
-- The Option Frame
------------------------------------------------------------

local dialog = UICreateDialogFrame("EasyTrinket_OptionFrame", nil, L["title"], "ChildPage");

function EasyTrinket_ShowOptionFrame()
	dialog:Open();
end


local secureWidgets = {}; -- widgets to be disabled when enters combat
local prevAnchor = nil;

-- Create a check button
local function CreateOptionCheckButton(text, isSecure, dbKey, x, y)
	local button = UICreateCheckButton(nil, dialog, text);
	button.dbKey = dbKey;	

	if isSecure then
		table.insert(secureWidgets, button);
	end

	if prevAnchor then
		button:SetPoint("TOPLEFT", prevAnchor, "BOTTOMLEFT", x, y);
	else
		button:SetPoint("TOPLEFT", dialog, "TOPLEFT", x, y);
	end

	button:SetScript("OnClick", function(self)
		db[self.dbKey] = self:GetChecked();
		if self.OnClick then
			self:OnClick(self:GetChecked());
		end
	end);

	button:SetScript("OnShow", function(self)
		self:SetChecked(db[self.dbKey]);
	end);

	prevAnchor = button;
	return button;
end

-- Create a combo box
local function CreateOptionComboBox(text, isSecure, dbKey, x, y)
	local combo =  UICreateComboBox(nil , dialog , text);
	combo.dbKey = dbKey;

	if isSecure then
		table.insert(secureWidgets, combo);
	end

	local label = combo:GetLabelFontString();
	if prevAnchor then
		label:SetPoint("TOPLEFT", prevAnchor, "BOTTOMLEFT", x, y);
	else
		label:SetPoint("TOPLEFT", dialog, "TOPLEFT", x, y);
	end

	combo:SetPoint("LEFT", label, "LEFT", 140, 0);
	combo:SetWidth(180);
	prevAnchor = label;

	combo.OnInitShow = function(self, func)
		self:SetCurSel(db[self.dbKey]);
		self.func = func;

		self.OnComboSelect = function(self, id)
			db[self.dbKey] = id;
			if self.func then
				self:func(id);
			end			
		end
	end

	return combo;
end

-- Create a slider
local function CreateOptionSlider(text, isSecure, dbKey, x, y, minVal, maxVal, valStep)
	local slider = UICreateSlider(nil, dialog, text);
	slider.dbKey = dbKey;

	if isSecure then
		table.insert(secureWidgets, slider);
	end

	slider:SetMinMaxValues(minVal, maxVal);
	if valStep then
		slider:SetValueStep(valStep);
	end

	slider:SetWidth(170);
	if prevAnchor then
		slider:SetPoint("TOPLEFT", prevAnchor, "BOTTOMLEFT", x, y);
	else
		slider:SetPoint("TOPLEFT", dialog, "TOPLEFT", x, y);
	end

	slider:SetMinMaxValues(minVal, maxVal);
	slider:SetValueStep(valStep);
	prevAnchor = slider;

	slider.OnInitShow = function(self, func)
		self:SetValue(db[self.dbKey]);
		self.func = func;

		self:SetScript("OnValueChanged", function(self, value)
			db[self.dbKey] = value;
			if self.func then
				self:func(value);
			end			
		end);
	end

	return slider;
end

-- Minimap option combo box
local mmCombo = CreateOptionComboBox(L["minimap button"], false, "minimapbutton", 18, -70);
mmCombo:AddLine(L["round minimap"]);
mmCombo:AddLine(L["square minimap"]);
mmCombo:AddLine(L["hide minimap button"]);

-- Auto whip option combo box
local whipCombo = CreateOptionComboBox(L["autowhip"], false, "autowhip", 0, -10);
whipCombo:AddLine(L["autowhip always"]);
whipCombo:AddLine(L["autowhip out BG"]);
whipCombo:AddLine(L["autowhip never"]);

if EasyTrinket_AutoWhip_Monitor then
	EasyTrinket_AutoWhip_Monitor.OnLevelDisable = function()
		whipCombo:SetCurSel(3);
		db["autowhip"] = 3;
		--whipCombo:Disable();
	end
else
	whipCombo:SetCurSel(3);
	whipCombo:Disable();
end

-- Disable on this player check box
local disableCheck = CreateOptionCheckButton(L["disable"], true, "disabled", -2, -8);
disableCheck.OnClick = function(self, checked)
	if checked then
		--EasyTrinketMainBar:Hide();
	else
		--EasyTrinketMainBar:Show();
	end
end
Duowan_EasyTrinket_ToggleCheck = disableCheck;

-- Lock frame check box
local lockCheck = CreateOptionCheckButton(L["lock"], false, "lock");

-- Simple tooltip check box
local simpleTipCheck = CreateOptionCheckButton(L["simple tooltip"], false, "simpleTooltip");

-- Dream-layout check box
local dLayoutCheck = CreateOptionCheckButton(L["DLayout"], false, "dlayout");

if BUTTONFACADE_LOADED then
	dLayoutCheck:SetScript("OnShow", nil);
	dLayoutCheck:SetScript("OnClick", nil);
	dLayoutCheck:SetChecked(false)
	dLayoutCheck:Disable()
else
	dLayoutCheck.OnClick = function(self, checked)
		EasyTrinketMainBar:UpdateDLayout(checked);
	end
end

-- Show hotkeys check box
local showHotkeyCheck = CreateOptionCheckButton(L["show hotkey"], false, "showhotkey");
showHotkeyCheck.OnClick = function(self, checked)
	if checked then
		EasyTrinket_Trinket1.hotkey:Show();
		EasyTrinket_Trinket2.hotkey:Show();
	else
		EasyTrinket_Trinket1.hotkey:Hide();
		EasyTrinket_Trinket2.hotkey:Hide();
	end
end

-- Show cooldown check box
local showCDCheck = CreateOptionCheckButton(L["show cd"], false, "showcd");
showCDCheck.OnClick = function(self, checked)
	local i;
	for i = 1, 2 do
		if checked then
			getglobal("EasyTrinket_Trinket"..i).cooldown.text:Show();
		else
			getglobal("EasyTrinket_Trinket"..i).cooldown.text:Hide();
		end
	end
			
	for i = 1, EASYTRINKET_MENUBUTTON_NUM do
		if checked then
			getglobal("EasyTrinket_MenuTrinket"..i).cooldown.text:Show();
		else
			getglobal("EasyTrinket_MenuTrinket"..i).cooldown.text:Hide();
		end
	end
end

-- Vertical alignment check box
local verticalCheck = CreateOptionCheckButton(L["vertical"], true, "vertical");
verticalCheck.OnClick = function(self, checked) EasyTrinketMainBar:SetOrientation(checked) end

-- modifier key for displaying menu
local keyCombo = CreateOptionComboBox(L["menu key"], false, "menukey", 4, -7);
keyCombo:SetWidth(140);
keyCombo:AddLine(NONE);
keyCombo:AddLine(ALT_KEY);
keyCombo:AddLine(CTRL_KEY);
keyCombo:AddLine(SHIFT_KEY);

-- Left side menu check box
local leftCheck = CreateOptionCheckButton(L["left menu"], false, "leftmenu", -4, -4);

-- Menu rows slider
local rowsSlider = CreateOptionSlider(L["rows"], false, "rows", 4, -26, 1, 32, 1);

-- Frame scale slider
local scaleSlider = CreateOptionSlider(L["scale"], true, "scale", 0, -34, 50, 200, 5);
scaleSlider:SetValueTextFormats("%d%%", "%d%%", "%d%%");
scaleSlider:ClearAllPoints();
scaleSlider:SetPoint("LEFT", rowsSlider, "RIGHT", 16, 0);

-- Validate user data
local function ValidateNumber(number, minVal, maxVal, defaultVal, integer)
	if type(number) ~= "number" then
		return defaultVal;
	end	

	if integer then
		number = math.floor(number);
	end

	if type(minVal) == "number" and number < minVal then
		number = minVal;
	end

	if type(maxVal) == "number" and number > maxVal then
		number = maxVal;
	end	

	return number;
end

-- User data manipulation
dialog:RegisterEvent("ADDON_LOADED");

dialog:SetScript("OnEvent", function(self, event, name)
	if event == "ADDON_LOADED" and name == "EasyTrinket" then
		self:UnregisterEvent("ADDON_LOADED");
		--Debug(format("%s => %s", event, name))

		if type(DuowanAddon_EasyTrinketDB) ~= "table" then
			DuowanAddon_EasyTrinketDB = { ["showhotkey"] = 1, ["autowhip"] = 3, ["scale"] = 95, ["rows"] = 5, ["prevMounted"] = 1, ["simpleTooltip"] = 1, ["menukey"] = 1, ["minimapbutton"] = 1 };
		end		
		db = DuowanAddon_EasyTrinketDB;
		db["rows"] = ValidateNumber(db["rows"], 1, 32, 5, true);
		db["scale"] = ValidateNumber(db["scale"], 50, 200, 100, true);
		if db["scale"] ~= 100 then
			EasyTrinketMainBar:SetScale(db["scale"] / 100);
		end
		--[[
		if db["disabled"] then
			EasyTrinketMainBar:Hide();
		end
		]]
		if not db["showhotkey"] then
			EasyTrinket_Trinket1.hotkey:Hide();
			EasyTrinket_Trinket2.hotkey:Hide();
		end

		if not db["showcd"] then
			local i;
			for i = 1, 2 do
				getglobal("EasyTrinket_Trinket"..i).cooldown.text:Hide();
			end
			
			for i = 1, EASYTRINKET_MENUBUTTON_NUM do
				getglobal("EasyTrinket_MenuTrinket"..i).cooldown.text:Hide();
			end
		end
		
		if EasyTrinket_AutoWhip_Monitor then
			--db["autowhip"] = ValidateNumber(db["autowhip"], 1, 3, 2, true);
			--if  db["autowhip"] ~= 3 then
				--EasyTrinket_AutoWhip_Monitor:Show();
			--end
		end

		db["menukey"] = ValidateNumber(db["menukey"], 1, 4, 1, true);
		if db["altmenu"] then
			db["menukey"] = 2;
			db["altmenu"] = nil; -- downward compatible
		end

		EasyTrinketMainBar:SetOrientation(db["vertical"]);
		EasyTrinketMainBar:UpdateDLayout(db["dlayout"]);


		db["minimapbutton"] = ValidateNumber(db["minimapbutton"], 1, 3, 1, true);
		if db["minimapbutton"] == 3 then
			EasyTrinketMinimapButton:Hide();
		elseif db["minimapbutton"] == 2 then
			EasyTrinketMinimapButton:SetOrbit(true);
		end
	end
end);

local function ResetAddon()
	scaleSlider:SetValue(100);
	EasyTrinketMainBar:ClearAllPoints();
	EasyTrinketMainBar:SetPoint("CENTER", UIParent, "CENTER");
	DuowanAddon_EasyTrinketDB["position"] = nil;
end

-- Combat secure handling
dialog.OnEnterCombat = function(self)
	local widget;
	for _, widget in ipairs(secureWidgets) do
		widget:Disable();
	end
end

dialog.OnLeaveCombat = function(self)
	if self._needReset then
		self._needReset = nil;
		ResetAddon();
	end

	local widget;
	for _, widget in ipairs(secureWidgets) do
		widget:Enable();
	end
end

-- Reset frame position/scale
dialog.OnReset = function(self)
	if InCombatLockdown() then
		self._needReset = 1;
	else
		ResetAddon();
	end
end

dialog.OnInitShow = function(self)
	mmCombo:OnInitShow(function(self, id)
		EasyTrinketMinimapButton:SetOrbit(id == 2);
		if id == 3 then
			EasyTrinketMinimapButton:Hide();
		else
			EasyTrinketMinimapButton:Show();
		end
	end);

	if EasyTrinket_AutoWhip_Monitor then	
		whipCombo:OnInitShow(function(self, id)		
			if id == 3 then
				EasyTrinket_AutoWhip_Monitor:Hide();
			else
				EasyTrinket_AutoWhip_Monitor:Show();
			end
		
		end);
	end

	keyCombo:OnInitShow();

	rowsSlider:OnInitShow();
	scaleSlider:OnInitShow(function(self, value)
		EasyTrinketMainBar:SetScale(value / 100);
	end);	
end

-- Inject our option page into Blizzard option panel
--dialog:AddToBlizzardOptionPanel(L["title"], L["title"], string.format(L["sub title"], VERSION));

function EasyTrinket_OpenConfig()
	--InterfaceOptionsFrame_OpenToCategory(L["title"]);	
end

-- Minimap button
--[[
local mmButton = UICreateMinimapButton("EasyTrinketMinimapButton", "Interface\\Icons\\INV_Gizmo_HardenedAdamantiteTube", 20);
mmButton:RegisterDB("DuowanAddon_EasyTrinketDB");
mmButton:AddTooltipLine(L["title"].." "..VERSION);
mmButton:AddTooltipLine(L["minimap tooltip 1"], 0, 1, 0);
mmButton:AddTooltipLine(L["minimap tooltip 2"], 0, 1, 0);
mmButton:RegisterForClicks("AnyUp");
mmButton:SetScript("OnClick", EasyTrinket_ShowOptionFrame);
]]
-- Slash command handling
--[[
SLASH_EASYTRINKET1 = "/easytrinket";
SLASH_EASYTRINKET2 = "/ezt";
SlashCmdList["EASYTRINKET"] = EasyTrinket_ShowOptionFrame;
]]
-- Here we come
--[[
DEFAULT_CHAT_FRAME:AddMessage("|cffffff78"..L["title"].." "..VERSION.."|r by Abin loaded.");
DEFAULT_CHAT_FRAME:AddMessage(L["prompt"]);
]]
------------------------------
-- Duowan Interface
local MenuKeyMap = {
	[NONE] = 1,
	[ALT_KEY] = 2,
	[CTRL_KEY] = 3,
	[SHIFT_KEY] = 4,
};

function EasyTrinket_Toggle(switch)
	if (switch) then
		DuowanAddon_EasyTrinketDB["disabled"] = false;		
	else
		DuowanAddon_EasyTrinketDB["disabled"] = true;
		dwSecureCall(EasyTrinket_ToggleMainBar, false);
	end
	if (not DuowanAddon_EasyTrinketDB["disabled"]) then
		if (GetInventoryItemTexture("player",13) or GetInventoryItemTexture("player",14)) then
			dwSecureCall(EasyTrinket_ToggleMainBar, true);		
			EasyTrinketMainBar:UnregisterEvent("UNIT_INVENTORY_CHANGED");
			EasyTrinketMainBar:UnregisterEvent("SPELLS_CHANGED");
			EasyTrinketMainBar:UnregisterEvent("ADDON_LOADED");
		else
			dwSecureCall(EasyTrinket_ToggleMainBar, false);
		end
	end
end

function EasyTrinket_AutoWhip_Toggle(switch)
	if (switch) then
		EasyTrinket_AutoWhip_Monitor:Show();
		
	else
		EasyTrinket_AutoWhip_Monitor:Hide();		
	end
end

function EasyTrinket_AutoWhip_OutBG(switch)
	if (switch) then
		DuowanAddon_EasyTrinketDB["autowhip"] = 2;
	else
		DuowanAddon_EasyTrinketDB["autowhip"] = 1;
	end
end

function EasyTrinket_SetMenuKey(name)
	local value = MenuKeyMap[name];	
	DuowanAddon_EasyTrinketDB["menukey"] = value or DuowanAddon_EasyTrinketDB["menukey"];	
end

function EasyTrinket_SimpleTip_Toggle(switch)
	if (switch) then
		DuowanAddon_EasyTrinketDB["simpleTooltip"] = 1;
	else
		DuowanAddon_EasyTrinketDB["simpleTooltip"] = false;
	end
end

function EasyTrinket_LockPosition_Toggle(switch)
	if (switch) then
		DuowanAddon_EasyTrinketDB["lock"] = 1;
	else
		DuowanAddon_EasyTrinketDB["lock"] = false;
	end
end

function EasyTrinket_OpenBinding()	
	dwShowKeyBindingFrame("HEADER_EASYTRINKET_TITLE");
end