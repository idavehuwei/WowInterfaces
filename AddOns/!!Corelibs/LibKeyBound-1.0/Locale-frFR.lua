--[[
	LibKeyBound-1.0 localization file
		French by ?
--]]

if (GetLocale() ~= "frFR") then
	return
end

local REVISION = 90000 + tonumber(("$Revision: 83 $"):match("%d+"))
if (LibKeyBoundLocale10 and REVISION <= LibKeyBoundLocale10.REVISION) then
	return
end

LibKeyBoundLocale10 = {
	REVISION = REVISION;
	Enabled = "Mode Raccourcis activé";
	Disabled = "Mode Raccourcis désactivé";
	ClearTip = format("Appuyez sur %s pour effacer tous les raccourcis", GetBindingText("ESCAPE", "KEY_"));
	NoKeysBoundTip = "Aucun raccourci";
	ClearedBindings = "Suppression de tous les raccourcis de %s";
	BoundKey = "%s associé à %s";
	UnboundKey = "%s n'est plus associé à %s";
	CannotBindInCombat = "Impossible de faire des raccourcis en combat";
	CombatBindingsEnabled = "Sortie de combat, mode Raccourcis activé";
	CombatBindingsDisabled = "Entrée en combat, mode Raccourcis désactivé";
	BindingsHelp = "Survolez un bouton, puis appuyez sur une touche pour définir son raccourci.  Pour effacer le raccourci actuel d'un bouton, appuyez sur %s";

	-- This is the short display version you see on the Button
	["Alt"] = "A",
	["Ctrl"] = "C",
	["Shift"] = "S",
	["NumPad"] = "N",

	["Backspace"] = "BS",
	["Button1"] = "S1",
	["Button2"] = "S2",
	["Button3"] = "S3",
	["Button4"] = "S4",
	["Button5"] = "S5",
	["Capslock"] = "Cp",
	["Clear"] = "Cl",
	["Delete"] = "Del",
	["End"] = "En",
	["Home"] = "HM",
	["Insert"] = "Ins",
	["Mouse Wheel Down"] = "WD",
	["Mouse Wheel Up"] = "WU",
	["Num Lock"] = "NL",
	["Page Down"] = "PD",
	["Page Up"] = "PU",
	["Scroll Lock"] = "SL",
	["Spacebar"] = "Sp",
	["Tab"] = "Tb",

	["Down Arrow"] = "BA",
	["Left Arrow"] = "GA",
	["Right Arrow"] = "DA",
	["Up Arrow"] = "HA",
}
setmetatable(LibKeyBoundLocale10, {__index = LibKeyBoundBaseLocale10})
