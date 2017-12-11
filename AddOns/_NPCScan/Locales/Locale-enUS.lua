--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-enUS.lua - Localized string constants (en-US).              *
  ****************************************************************************]]


do
	local Title = "_|cffCCCC88NPCScan|r";
	local LDQuo, RDQuo = GRAY_FONT_COLOR_CODE.."\226\128\156", "\226\128\157|r";


	local Metatable = {
		__index = function ( self, Key )
			if ( Key ~= nil ) then
				rawset( self, Key, Key );
				return Key;
			end
		end;
	};
	_NPCScanLocalization = setmetatable( {
		NPCS = setmetatable( {}, Metatable );

		MESSAGE_FORMAT = Title..": %s";

		FOUND_FORMAT = "Found "..LDQuo.."%s"..RDQuo.."!";
		FOUND_TAMABLE_FORMAT = "Found "..LDQuo.."%s"..RDQuo.."!  "..RED_FONT_COLOR_CODE.."(Note: Tamable mob, may only be a pet.)|r";
		FOUND_TAMABLE_WRONGZONE_FORMAT = RED_FONT_COLOR_CODE.."False alarm:|r Found tamable mob "..LDQuo.."%s"..RDQuo.." in %s instead of %s; Definitely a pet."; -- Name, CurrentZone, ExpectedZone
		FOUND_TAMABLE_RESTING_FORMAT = RED_FONT_COLOR_CODE.."False alarm:|r Found tamable mob "..LDQuo.."%s"..RDQuo.." while resting; Probably a pet.";
		BUTTON_FOUND = "NPC found!";

		CACHED_LONG_FORMAT = "The following unit(s) are already cached.  Consider removing them using "..LDQuo.."/npcscan"..RDQuo.."'s menu or resetting them by clearing your cache: %s.";
		CACHED_FORMAT = "The following unit(s) are already cached: %s.";
		CACHED_NAME_FORMAT = LDQuo.."%s"..RDQuo;
		CACHED_SEPARATOR = ", ";

		OVERLAY_INCOMPATIBLE = "Your versions of %s ("..GRAY_FONT_COLOR_CODE.."%s|r) and "..Title.." ("..GRAY_FONT_COLOR_CODE.."%s|r) are incompatible.  Please update both so they can work together."; -- Overlay name, Overlay version, _NPCScan version


		CONFIG_TITLE = Title;
		CONFIG_DESC = "These options let you configure the way _NPCScan alerts you when it finds rare NPCs.";

		CONFIG_CACHEWARNINGS = "Print login reminders to empty the cache";
		CONFIG_CACHEWARNINGS_DESC = "If an NPC is already cached when you log in, this option prints a reminder to clear your cache.";


		CONFIG_ALERT = "Alert Options";

		CONFIG_TEST = "Test Found Alert";
		CONFIG_TEST_DESC = "Simulates an "..LDQuo.."NPC found"..RDQuo.." alert to let you know what to look out for.";
		CONFIG_TEST_NAME = "You! (Test)";
		CONFIG_TEST_HELP_FORMAT = "Click the target button or use the provided keybinding to target the found mob.  Hold "..HIGHLIGHT_FONT_COLOR_CODE.."<%s>|r and drag to move the target button.  Note that if an NPC is found while you're in combat, the button will only appear after you exit combat.";

		CONFIG_ALERT_UNMUTE = "Unmute for alert sound";
		CONFIG_ALERT_UNMUTE_DESC = "Briefly enables game sound when an NPC is found to play an alert tone if you have muted the game.";
		CONFIG_ALERT_SOUND = "Alert sound file";
		CONFIG_ALERT_SOUND_DESC = "Choose the alert sound to play when an NPC is found.  Additional sounds can be added through "..LDQuo.."SharedMedia"..RDQuo.." addons.";
		CONFIG_ALERT_SOUND_DEFAULT = NORMAL_FONT_COLOR_CODE..DEFAULT.."|r";


		SEARCH_TITLE = "Search";
		SEARCH_DESC = "This table allows you to add or remove NPCs and achievements to scan for.";

		SEARCH_FINDTAMABLE = "Search for tamable NPCs";
		SEARCH_FINDTAMABLE_DESC = "Scans for NPCs tamable by hunters.";
		SEARCH_FINDTAMABLE_WARNING = RED_FONT_COLOR_CODE.."Warning: Pets that originally were rare NPCs will trigger the found alert.|r";
		SEARCH_ACHIEVEMENTADDFOUND = "Search for completed Achievement NPCs";
		SEARCH_ACHIEVEMENTADDFOUND_DESC = "Continues searching for all achievement NPCs, even if you no longer need them.";

		SEARCH_NPCS = "Custom NPCs";
		SEARCH_NPCS_DESC = "Add any NPC to track, even if it has no achievement.";
		SEARCH_ACHIEVEMENT_DISABLED = "Disabled";

		SEARCH_CACHED = "Cached";
		SEARCH_NAME = "Name:";
		SEARCH_NAME_DESC = "A label for the NPC.  It is case insensitive and doesn't have to match the NPC's actual name.";
		SEARCH_ID = "NPC ID:";
		SEARCH_ID_DESC = "The ID of the NPC to search for.  This value can be found on sites like WowHead.com.";
		SEARCH_COMPLETED = "Done";

		SEARCH_CACHED_YES = "|T"..READY_CHECK_NOT_READY_TEXTURE..":0|t";
		SEARCH_CACHED_NO = "";
		SEARCH_COMPLETED_YES = "|T"..READY_CHECK_READY_TEXTURE..":0|t";
		SEARCH_COMPLETED_NO = "";

		SEARCH_ADD = "+";
		SEARCH_REMOVE = "-";
		SEARCH_ADD_TAMABLE_FORMAT = "Note: "..LDQuo.."%s"..RDQuo.." is tamable, so seeing it as a tamed hunter's pet will cause a false alarm.";


		CMD_ADD = "ADD";
		CMD_REMOVE = "REMOVE";
		CMD_REMOVENOTFOUND_FORMAT = "NPC "..LDQuo.."%s"..RDQuo.." not found.";
		CMD_HELP = "Commands are "..LDQuo.."/npcscan add <NpcID> <Name>"..RDQuo..", "..LDQuo.."/npcscan remove <Name>"..RDQuo..", and simply "..LDQuo.."/npcscan"..RDQuo.." for the options menu.";
	}, Metatable );




--------------------------------------------------------------------------------
-- Globals
----------

	SLASH__NPCSCAN1 = "/npcscan";
	SLASH__NPCSCAN2 = "/scan";

	BINDING_HEADER__NPCSCAN = Title;
	_G[ "BINDING_NAME_CLICK _NPCScanButton:LeftButton" ] = "Target last found mob\n"..GRAY_FONT_COLOR_CODE.."(Use when _NPCScan alerts you)|r";
end
