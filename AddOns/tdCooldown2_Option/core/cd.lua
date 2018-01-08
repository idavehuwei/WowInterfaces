

local tCD = tdCooldown2;
if not tCD.methods.cdloaded then return end
local L = TDCOOLDOWN2_OPTION_LACALE

local option = tCD.option;
local frame, panel, check, slider, editbox, dropdown, color;

frame = option:CreateOptions(L["Cooldown Count"]);

panel = option:CreatePanel(frame, L["Scale & Color"], true, "TOPLEFT:TOPLEFT:10:-20|BOTTOMRIGHT:TOPRIGHT:-10:-120");

slider = option:CreateSlider(panel, DAYS, "days", "s", nil, 0.5, 1.5, 0.05);
color = option:CreateColor(slider, nil, "days");
color:SetPoint("TOPRIGHT", 0, 15);

slider = option:CreateSlider(panel, HOURS, "hrs", "s", nil, 0.5, 1.5, 0.05);
color = option:CreateColor(slider, nil, "hrs");
color:SetPoint("TOPRIGHT", 0, 15);

slider = option:CreateSlider(panel, MINUTES, "mins", "s", nil, 0.5, 1.5, 0.05);
color = option:CreateColor(slider, nil, "mins");
color:SetPoint("TOPRIGHT", 0, 15);

slider = option:CreateSlider(panel, SECONDS, "secs", "s", nil, 0.5, 1.5, 0.05);
color = option:CreateColor(slider, nil, "secs");
color:SetPoint("TOPRIGHT", 0, 15);

slider = option:CreateSlider(panel, L["Under 5 s"], "short", "s", nil, 0.5, 1.5, 0.05);
color = option:CreateColor(slider, nil, "short");
color:SetPoint("TOPRIGHT", 0, 15);

panel = option:CreatePanel(frame, L["Action Bars"], nil, "TOPLEFT:TOPLEFT:10:-135|BOTTOMRIGHT:BOTTOM:-5:5");

option:CreateCheckButton(panel, L["Enable"], "ACTION", "config");
option:CreateCheckButton(panel, L["Hide default Effect"], "ACTION", "hidecooldown");
option:CreateCheckButton(panel, L["Show Precise Duration"], "ACTION", "long");
option:CreateCheckButton(panel, L["Enable Shining"], "ACTION", "shine");
option:CreateSlider(panel, L["Font Alpha"], "ACTION", "alpha", nil, 0, 1, 0.05);
option:CreateSlider(panel, L["Font Size"], "ACTION", "size", nil, 5, 36, 1);
option:CreateSlider(panel, L["Shining Scale"], "ACTION", "scale", nil, 2, 10, 0.5);
option:CreateDropdown(panel, L["Shining Texture"], "ACTION", "style", nil, {
	{value = 0, text = L["Icon"]},
	{value = 1, text = L["System"]},
	{value = 2, text = L["Round"]},
	{value = 3, text = L["Explosive"]},
	{value = 4, text = L["Heart"]},
});
cfont = option:CreateEditBox(panel, L["Font"], "ACTION", "font", nil, nil, function(value) return tCD:TestFont(value) end);
--if tdDropdown then tdCreateDropDown({name = cfont:GetName(), profile = "tdCooldown2Font", short = true}) end
option:CreateEditBox(panel, L["Min Displayable Cooldown Duration"], "ACTION", "min", nil, true, function(value) return value < 0 and 0 or value end);

panel = option:CreatePanel(frame, L["Buff and Debuff"], nil, "TOPLEFT:TOP:5:-135|BOTTOMRIGHT:BOTTOMRIGHT:-10:5");

option:CreateCheckButton(panel, L["Enable"], "BUFF", "config");
option:CreateCheckButton(panel, L["Hide default Effect"], "BUFF", "hidecooldown");
option:CreateCheckButton(panel, L["Show Precise Duration"], "BUFF", "long");
option:CreateSlider(panel, L["Font Alpha"], "BUFF", "alpha", nil, 0, 1, 0.05);
option:CreateSlider(panel, L["Font Size"], "BUFF", "size", nil, 5, 36, 1);
option:CreateDropdown(panel, L["Anchor offset"], "BUFF", "point", nil, {
	{value = "TOPLEFT", text = L["Top Left"]},
	{value = "TOP", text = L["Top"]},
	{value = "TOPRIGHT", text = L["Top Right"]},
	{value = "LEFT", text = L["Left"]},
	{value = "CENTER", text = L["Center"]},
	{value = "RIGHT", text = L["Right"]},
	{value = "BOTTOMLEFT", text = L["Bottom Left"]},
	{value = "BOTTOM", text = L["Bottom"]},
	{value = "BOTTOMRIGHT", text = L["Bottom Right"]},
});
cfont = option:CreateEditBox(panel, L["Font"], "BUFF", "font", nil, nil, function(value) return tCD:TestFont(value) end);
--if tdDropdown then tdCreateDropDown({name = cfont:GetName(), profile = "tdCooldown2Font", short = true}) end
option:CreateEditBox(panel, L["Max Displayable Cooldown Duration"], "BUFF", "max", nil, true, function(value) return value < 0 and 0 or value end);


