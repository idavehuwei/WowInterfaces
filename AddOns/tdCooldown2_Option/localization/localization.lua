TDCOOLDOWN2_OPTION_LACALE = {}

local L = TDCOOLDOWN2_OPTION_LACALE

L["Cooldown Count"] = true;
L["Scale & Color"] = true;
L["All"] = true;
L["Under 5 s"] = true;
L["Action Bars"] = true;
L["Enable"] = true;
L["Hide default Effect"] = true;
L["Show Precise Duration"] = true;
L["Enable Shining"] = true;
L["Font Alpha"] = true;
L["Font Size"] = true;
L["Shining Width"] = true;
L["Shining Texture"] = true;
L["Icon"] = true;
L["System"] = true;
L["Round"] = true;
L["Explosive"] = true;
L["Heart"] = true;
L["Font"] = true;
L["Min Displayable Cooldown Duration"] = true;
L["Max Displayable Cooldown Duration"] = true;
L["Anchor offset"] = true;
L["Buff and Debuff"] = true;
L["Top Left"] = true;
L["Top"] = true;
L["Top Right"] = true;
L["Left"] = true;
L["Center"] = true;
L["Right"] = true;
L["Bottom Left"] = true;
L["Bottom"] = true;
L["Bottom Right"] = true;
L["Spell"] = true;
L["Bar and Center"] = true;
L["Bar"] = true;
L["Hide Bar"] = true;
L["Locked"] = true;
L["Reserve sort"] = true;
L["Sound"] = true;
L["Width"] = true;
L["Height"] = true;
L["Spacing"] = true;
L["Alpha"] = true;
L["Test"] = true;
L["Center Icon"] = true;
L["Only Icon"] = true; 
L["Icon no Border"] = true;
L["Highlight HoT Icon"] = true;
L["Text in center"] = true;
L["Center Style"] = true;
L["Duration"] = true;
L["Color of spell name"] = true;
L["Effect Test (on|off)"] = true;
L["Black List"] = true;
L["Page: %d"] = true;
L["Can't do it in combat."] = true;
L["Toggle Spell Book & Bags"] = true;
L["Black Tip"] = [[
Description: 
   Drag skills or items here can be added into the black list. 
   <Ctrl+Click>Remove skill or item. 
]]

for i, v in pairs(L) do
	L[i] = type(v) == "string" and v or i;
end