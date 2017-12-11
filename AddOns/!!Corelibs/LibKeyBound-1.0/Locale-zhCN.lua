--[[
	KeyBound localization file
		Chinese Simplified by ondh - http://www.ondh.cn
--]]

if (GetLocale() ~= "zhCN") then
	return
end

local REVISION = 90000 + tonumber(("$Revision: 1800 $"):match("%d+"))
if (LibKeyBoundLocale10 and REVISION <= LibKeyBoundLocale10.REVISION) then
	return
end

LibKeyBoundLocale10 = {
	REVISION = REVISION;
	BindingMode = "绑定模式";
	Enabled = "按键绑定模式已启用";
	Disabled = "按键绑定模式已禁用";
	ClearTip = format("按 %s 清除所有绑定", GetBindingText("ESCAPE", "KEY_"));
	NoKeysBoundTip = "当前没有绑定按键";
	ClearedBindings = "从 %s 移除按键绑定";
	BoundKey = "设置 %s 到 %s";
	UnboundKey = "取消绑定 %s 从 %s";
	CannotBindInCombat = "不能在战斗状态绑定按键";
	CombatBindingsEnabled = "离开战斗状态, 按键绑定模式已启用";
	CombatBindingsDisabled = "进入战斗状态, 按键绑定模式已禁用";
	BindingsHelp = "将鼠标停留在按钮上, 然后按下欲指定快捷键之后就能绑定。  要清除目前绑定的按钮请按 %s";

	-- This is the short display version you see on the Button
	["Alt"] = "A",
	["Ctrl"] = "C",
	["Shift"] = "S",
	["NumPad"] = "N",

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
	["Mouse Wheel Down"] = "WD",
	["Mouse Wheel Up"] = "WU",
	["Num Lock"] = "NL",
	["Page Down"] = "PD",
	["Page Up"] = "PU",
	["Scroll Lock"] = "SL",
	["Spacebar"] = "Sp",
	["Tab"] = "Tb",

	["Down Arrow"] = "DA",
	["Left Arrow"] = "LA",
	["Right Arrow"] = "RA",
	["Up Arrow"] = "UA",
}
setmetatable(LibKeyBoundLocale10, {__index = LibKeyBoundBaseLocale10})
