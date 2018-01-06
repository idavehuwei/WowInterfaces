local L = LibStub("AceLocale-3.0"):NewLocale("EventAlert", "enUS", true)

L["Event Alert Frame"] = true;
L["EventAlert: You must unlock the alert frame in order to move it or reset it's position."] = true;
L["EventAlert Options"] = true;
L["ShaysBell"] = true;
L["Flute"] = true;
L["Netherwind"] = true;
L["PolyCow"] = true;
L["Rockbiter"] = true;
L["Yarrrr!"] = true;
L["Broken Heart"] = true;
L["Millhouse 1!"] = true;
L["Millhouse 2!"] = true;
L["Pissed Satyr"] = true;
L["Pissed Dwarf"] = true;

--function EventAlert_LoadTextArray()
	EA_TOGGLE_PRIMARIESE = "enable/Disable Primaries";
	EA_SPELL_SORT_DESC = "Spells are sorted by spell ID.";
	EA_SPELL_LINK_DESC = "Spell IDs are listed in brackets.";
	EA_VISI_WOWHEAD = "To look up the spellID, copy the following:"
	EA_POSITION_OPTION = "Icon Position Options";
	EA_LOCK_FRAME = "Lock Frame";
	EA_ICON_SIZE = "Icon Size";
	EA_ICON_SIZE_BIG = "Large";
	EA_ICON_SIZE_SMALL = "Small";
	EA_HOR_SPACE = "Horizontal Spacing";
	EA_HOR_SPACE_MORE = "More";
	EA_HOR_SPACE_LESS = "Less";
	EA_VER_SPACE = "Vertical Spacing";
	EA_VER_SPACE_MORE = "More";
	EA_VER_SPACE_LESS = "Less";
	EA_TOGGLE_ALTERNATE_TITLE = "Enable/Disable Alternates";
	EA_TOOGLE_VISIBLE = "Show/Hide Alert Frame";
	EA_RESET_POSITION = "Reset Frame Position";
	EA_ICON_POSIZION_OPTION = "Icon Position Options";
	EA_SHOW_ALERTFRAME = "Show Alert Frame";
	EA_SHOW_BUFF_NAME = "Show Buff Name";
	EA_SHOW_BUFF_REMAIN = "Show Timer";
	EA_MOFANG_OMNICC = "Mimic OmniCC function";
	EA_SHOW_FULL_FLASH = "Show Fullscreen Flash Alert";
	EA_PLAY_ALERT_SOUND = "Play Sound Alert";
	EA_ESC_TO_CLOSE = "ESC Key Closes Alerts";
	EA_TOGGLE_ALTERNATE = "Enable Alternate Alerts";
	EA_TOGGLE_CLASS_ALERT = "Show/Hide Class Alerts";
	EA_OKAY = "Okay";

	EA_TTIP_DOALERTSOUND = "Play a sound when an event triggers.";
	EA_TTIP_ALERTSOUNDSELECT = "Choose which sound to play when an event triggers.";
	EA_TTIP_LOCKFRAME = "Locks the notification frame so it cannot be moved.";
	EA_TTIP_SHOWFRAME = "Toggle the showing/hiding of the notification frame on events.";
	EA_TTIP_SHOWNAME = "Toggle the showing/hiding of the buff's name on events.";
	EA_TTIP_SHOWFLASH = "Toggle the showing/hiding of the full screen flash on events.";
	EA_TTIP_SHOWTIMER = "Toggle the showing/hiding of the remaining buff time on events.";
	EA_TTIP_CHANGETIMER = "Changes the font and position of the remaining buff time.";
	EA_TTIP_ICONSIZE = "Change the size of the alert icon.";
	EA_TTIP_ALLOWESC = "Changes the ability to use the ESC key to close alert frames. (Note:  Requires a reload of the UI)";
	EA_TTIP_ALTALERTS = "Toggle the ability for EventAlert to alert on alternate non-buff events.";

	EA_TTIP_ICONXOFFSET = "Changes the horizontal spacing between notification frames.";
	EA_TTIP_ICONYOFFSET = "Changes the vertical spacing between notification frames.";

	EA_CLASS_DK = "DEATHKNIGHT";
	EA_CLASS_DRUID = "DRUID";
	EA_CLASS_HUNTER = "HUNTER";
	EA_CLASS_MAGE = "MAGE";
	EA_CLASS_PALADIN = "PALADIN";
	EA_CLASS_PRIEST = "PRIEST";
	EA_CLASS_ROGUE = "ROGUE";
	EA_CLASS_SHAMAN = "SHAMAN";
	EA_CLASS_WARLOCK = "WARLOCK";
	EA_CLASS_WARRIOR = "WARRIOR";
	EA_CLASS_FUNKY = "FUNKY";
	EA_CLASS_OTHER = "OTHER";
--end
