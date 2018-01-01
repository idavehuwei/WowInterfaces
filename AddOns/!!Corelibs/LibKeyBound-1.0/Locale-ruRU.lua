--[[
	KeyBound localization file
		Russian by ?
--]]

if (GetLocale() ~= "ruRU") then
	return
end

local REVISION = 90000 + tonumber(("$Revision: 83 $"):match("%d+"))
if (LibKeyBoundLocale10 and REVISION <= LibKeyBoundLocale10.REVISION) then
	return
end

LibKeyBoundLocale10 = {
	REVISION = REVISION;
	Enabled = 'Режим назначения клавиш включен';
	Disabled = 'Режим назначения клавиш отключен';
	ClearTip = format('Нажмите %s для сброса всех назначений', GetBindingText('ESCAPE', 'KEY_'));
	NoKeysBoundTip = 'Нет текущих назначений';
	ClearedBindings = 'Удалить все назначения с %s';
	BoundKey = 'Установить %s на %s';
	UnboundKey = 'Снять назначение %s с %s';
	CannotBindInCombat = 'Невозможно назначить клавишу в бою';
	CombatBindingsEnabled = 'Выход из боя, режим назначения клавиш включен';
	CombatBindingsDisabled = 'Начало боя, режим назначения клавиш отключен';
	BindingsHelp = "Зависните над кнопкой, и тогда нажмите клавишу для установки назначения.  Для очистки текущих назначений клавиш, нажмите %s.";

	-- This is the short display version you see on the Button
	["Alt"] = "A",
	["Ctrl"] = "C",
	["Shift"] = "S",
	["NumPad"] = "Ц",

	["Backspace"] = "BS",
	["Button1"] = "B1",
	["Button2"] = "B2",
	["Button3"] = "B3",
	["Button4"] = "B4",
	["Button5"] = "B5",
	["Capslock"] = "Cp",
	["Clear"] = "Cl",
	["Delete"] = "Del",
	["End"] = "En",
	["Home"] = "HM",
	["Insert"] = "Ins",
	["Mouse Wheel Down"] = "КМВХ",
	["Mouse Wheel Up"] = "КМВЗ",
	["Num Lock"] = "NL",
	["Page Down"] = "PD",
	["Page Up"] = "PU",
	["Scroll Lock"] = "SL",
	["Spacebar"] = "Прбл",
	["Tab"] = "Tb",

	["Down Arrow"] = "Dn",
	["Left Arrow"] = "Lf",
	["Right Arrow"] = "Rt",
	["Up Arrow"] = "Up",
}
setmetatable(LibKeyBoundLocale10, {__index = LibKeyBoundBaseLocale10})
