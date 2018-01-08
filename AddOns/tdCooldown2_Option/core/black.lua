
local tCD = tdCooldown2;
if not tCD.methods.barloaded then return end
local L = TDCOOLDOWN2_OPTION_LACALE

local option = tCD.option;
local db = tCD.db;
local tCDblackData = tCDblackData;

local ClearCursor = ClearCursor;
local CreateFrame = CreateFrame;
local GetCursorInfo = GetCursorInfo;
local GetItemInfo = GetItemInfo;
local GetSpellName = GetSpellName;
local GetSpellTexture = GetSpellTexture;
local tinsert = tinsert;
local max = max;
local select = select;
local ceil = ceil;
local sort = sort;

local slider;
local buttons = {};
local maxcheck = 20;

local frame = option:CreateOptions(L["Black List"]);
local panel = option:CreatePanel(frame, L["Black List"], nil, "TOPLEFT:TOPLEFT:10:-20|BOTTOMRIGHT:BOTTOMRIGHT:-10:5");

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
title:SetHeight(150);
title:SetPoint("TOPLEFT", 10, -10);
title:SetPoint("TOPRIGHT", -10, -10);
title:SetNonSpaceWrap(true);
title:SetJustifyH("LEFT");
title:SetJustifyV("TOP");
title:SetText(L["Black Tip"]);

local function UpdateBlackList()
	local j, list, button = 1, {};
	for spell, icon in pairs(tCDblackData) do
		tinsert(list, {spell = spell, icon = icon});
	end
	sort(list, function(a, b)
		return a.spell < b.spell
	end)
	local maxValue = select(2, slider:GetMinMaxValues());
	local pages = max(1, ceil(#list / maxcheck));
	local value = slider:GetValue();
	if pages ~= maxValue then
		slider:SetMinMaxValues(1, pages);
		if value > pages then
			slider:SetValue(pages);
			value = pages;
		end
	end
	for i = (value - 1) * maxcheck + 1, value  * maxcheck do
		button = buttons[j];
		if list[i] then
			button:SetText(list[i].spell);
			button.icon:SetTexture(list[i].icon);
			button:Show();
		else
			button:SetText("");
			button:Hide();
		end
		j = j + 1;
	end
	slider.text:SetFormattedText(L["Page: %d"], value);
end

slider = CreateFrame("Slider", "tCDOptionBlackSlider", panel, "OptionsSliderTemplate")
slider:SetOrientation('VERTICAL');
slider:SetWidth(10);
slider:SetHeight(200);
slider:ClearAllPoints();
slider:SetPoint("TOPRIGHT", panel, "TOPRIGHT",-20,-75);
slider:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT",-20,10);
slider:SetValueStep(1);
slider:SetMinMaxValues(1, 1);
slider:SetValue(1);
slider:SetScript("OnValueChanged", UpdateBlackList);
tCDOptionBlackSliderLow:SetFormattedText(L["Page: %d"], 1);
tCDOptionBlackSliderHigh:SetText("");
slider.text = tCDOptionBlackSliderLow;
slider.text:ClearAllPoints();
slider.text:SetPoint("LEFT", 30)

local function AddList()
	local typ , id, a = GetCursorInfo();
	if typ == "spell" and id > 0 or typ == "item" then
		local name, icon, _;
		if typ == "item" then
			name,_,_,_,_,_,_,_,_,icon = GetItemInfo(id);
		else
			name = GetSpellName(id, typ);
			icon = GetSpellTexture(id, typ);
		end
		tCDblackData[name] = icon;
		UpdateBlackList();
		ClearCursor();
	end
end

local i, button
for i = 1, maxcheck do
	local button = CreateFrame("Button", nil, panel);
	button:SetWidth(130); button:SetHeight(30);
	
	button:SetNormalFontObject('GameFontNormalLeft');
	button:SetHighlightTexture("Interface/QuestFrame/UI-QuestTitleHighlight");
	button:RegisterForClicks("LeftButtonUp");
	button:EnableMouseWheel(nil);
	
	local icon = button:CreateTexture(nil, "BACKGROUND");
	icon:SetWidth(30); icon:SetHeight(30);
	icon:SetPoint("LEFT", -30, 0);
	icon:SetTexCoord(0.07, 0.93, 0.07, 0.93);
	button.icon = icon;
	
	button:SetScript("OnClick", function(self, button)
		if IsControlKeyDown() then
			tCDblackData[self:GetText()] = nil;
			UpdateBlackList();
		else
			AddList();
		end
	end)
	button:SetScript("OnReceiveDrag", AddList);
	
	button:Show();
	if i == 1 then
		button:SetPoint("TOPLEFT", panel, "TOPLEFT", 50, -75);
	elseif i == maxcheck / 2 + 1 then
		button:SetPoint("LEFT", buttons[1], "RIGHT", 42, 0);
	else
		button:SetPoint("TOP", buttons[i-1], "BOTTOM", 0, -2)
	end
	buttons[i] = button
end

panel:EnableMouseWheel(true);
panel:EnableMouse(true);
panel:SetScript("OnShow", UpdateBlackList);
panel:SetScript("OnMouseWheel", function(self, y)
	local value = slider:GetValue();
	local minValue, maxValue = slider:GetMinMaxValues();
	if y < 0 then
		if value < maxValue then
			slider:SetValue(value + 1);
		end
	else
		if value > minValue then
			slider:SetValue(value - 1);
		end
	end
end);

panel:SetScript("OnMouseUp", AddList);
panel:SetScript("OnReceiveDrag", AddList);

button = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate");
button:SetWidth(150); button:SetHeight(20);
button:SetText(L["Toggle Spell Book & Bags"]);
button:SetPoint("TOPRIGHT", 0, 18);
button:SetScript("OnClick", function(self)
	if not InCombatLockdown() then
		ToggleSpellBook(BOOKTYPE_SPELL);
		OpenAllBags();
	else
		tCD:print(L["Can't do it in combat."]);
	end
end)


