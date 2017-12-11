--[[
	KeyBound localization file
		English
--]]

local REVISION = 90000 + tonumber(("$Revision: 1800 $"):match("%d+"))
if (LibKeyBoundBaseLocale10 and REVISION <= LibKeyBoundBaseLocale10.BASEREVISION) then
	return
end

LibKeyBoundBaseLocale10 = {
	REVISION = 0;
	BASEREVISION = REVISION;
	BindingMode = "Binding Mode";
	Enabled = 'Bindings mode enabled';
	Disabled = 'Bindings mode disabled';
	ClearTip = format('Press %s to clear all bindings', GetBindingText('ESCAPE', 'KEY_'));
	NoKeysBoundTip = 'No current bindings';
	ClearedBindings = 'Removed all bindings from %s';
	BoundKey = 'Set %s to %s';
	UnboundKey = 'Unbound %s from %s';
	CannotBindInCombat = 'Cannot bind keys in combat';
	CombatBindingsEnabled = 'Exiting combat, keybinding mode enabled';
	CombatBindingsDisabled = 'Entering combat, keybinding mode disabled';
	BindingsHelp = "Hover over a button, then press a key to set its binding.  To clear a button's current keybinding, press %s.";

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

	["Down Arrow"] = "Dn",
	["Left Arrow"] = "Lf",
	["Right Arrow"] = "Rt",
	["Up Arrow"] = "Up",
}
if not LibKeyBoundLocale10 then
	LibKeyBoundLocale10 = LibKeyBoundBaseLocale10
else
	setmetatable(LibKeyBoundLocale10, {__index = LibKeyBoundBaseLocale10})
end
--[[
World of Warcraft/Blizzard Interface Data (enUS)/FrameXML/GlobalStrings.lua:

KEY_APOSTROPHE = "'";
KEY_BACKSLASH = "\\";
KEY_BACKSPACE = "Backspace";
KEY_BACKSPACE_MAC = "Delete";
KEY_BINDING = "Key Binding";
KEY_BINDINGS = "Key Bindings"; -- Title for the key bindings frame
KEY_BINDINGS_MAC = "Bindings";
KEY_BOUND = "Key Bound Successfully";
KEY_BUTTON1 = "Left Mouse Button";
KEY_BUTTON2 = "Right Mouse Button";
KEY_BUTTON3 = "Middle Mouse";
KEY_BUTTON4 = "Mouse Button 4";
KEY_BUTTON5 = "Mouse Button 5";
KEY_COMMA = ",";
KEY_DELETE = "Delete";
KEY_DELETE_MAC = "Del";
KEY_DOWN = "Down Arrow";
KEY_END = "End";
KEY_HOME = "Home";
KEY_INSERT = "Insert";
KEY_INSERT_MAC = "Help";
KEY_LEFT = "Left Arrow";
KEY_LEFTBRACKET = "[";
KEY_MINUS = "-";
KEY_MOUSEWHEELDOWN = "Mouse Wheel Down";
KEY_MOUSEWHEELUP = "Mouse Wheel Up";
KEY_NUMLOCK = "Num Lock";
KEY_NUMLOCK_MAC = "Clear";
KEY_NUMPAD0 = "Num Pad 0";
KEY_NUMPAD1 = "Num Pad 1";
KEY_NUMPAD2 = "Num Pad 2";
KEY_NUMPAD3 = "Num Pad 3";
KEY_NUMPAD4 = "Num Pad 4";
KEY_NUMPAD5 = "Num Pad 5";
KEY_NUMPAD6 = "Num Pad 6";
KEY_NUMPAD7 = "Num Pad 7";
KEY_NUMPAD8 = "Num Pad 8";
KEY_NUMPAD9 = "Num Pad 9";
KEY_NUMPADDECIMAL = "Num Pad .";
KEY_NUMPADDIVIDE = "Num Pad /";
KEY_NUMPADMINUS = "Num Pad -";
KEY_NUMPADMULTIPLY = "Num Pad *";
KEY_NUMPADPLUS = "Num Pad +";
KEY_PAGEDOWN = "Page Down";
KEY_PAGEUP = "Page Up";
KEY_PAUSE = "Pause";
KEY_PAUSE_MAC = "F15";
KEY_PERIOD = ".";
KEY_PLUS = "+";
KEY_PRINTSCREEN = "Print Screen";
KEY_PRINTSCREEN_MAC = "F13";
KEY_RIGHT = "Right Arrow";
KEY_RIGHTBRACKET = "]";
KEY_SCROLLLOCK = "Scroll Lock";
KEY_SCROLLLOCK_MAC = "F14";
KEY_SEMICOLON = ";";
KEY_SLASH = "/";
KEY_SPACE = "Spacebar"; -- Spacebar
KEY_TAB = "Tab";
KEY_TILDE = "~";
KEY_UNBOUND_ERROR = "|cffff0000%s Function is Now Unbound!|r";
KEY_UP = "Up Arrow";

KEY_ESCAPE = "Escape";
--]]