local L = LibStub("AceLocale-3.0"):NewLocale("Love", "enUS",true)
if not L then return end
--[[L["ezIcons"] = true
L["Radial"] =true
L["Mouseover"] =true
L["Massicon"] =true
L["Set Icon"]=true
L["Remove Icon"] =true
L["Reset Icons"] =true
L["Enable/Disable the radial target icon menu"] =true
L["Enable/Disable mouseover set icon keybindings"] =true
L["Enable/Disable mass mouseover set icon modifier keys"] =true]]

L["Dalaran"] = true;
L["Wintergrasp"] = true;
L["Krasus\' Landing"] = true;
L["Purple Parlor"] = true;
L["Underbelly"] = true;
L["Ahn'Qiraj"] = true;

if GetLocale()=="enUS" then
	BINDING_HEADER_EZICONS= "ezIcons"
	BINDING_NAME_EZICONS_SETICON = "Set Icons"
	BINDING_NAME_EZICONS_REMOVEICON = "Remove Icons"
	BINDING_NAME_EZICONS_RESETICONS= "Reset Icons"
end