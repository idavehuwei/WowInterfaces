--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-enUS.lua - Localized string constants (en-US).              *
  ****************************************************************************]]
local L = LibStub("AceLocale-3.0"):NewLocale("_NPCScan", "enUS", true);

-- See http://wow.curseforge.com/addons/npcscan/localization/enUS/

L["NPCs"] = {
	[ 18684 ] = "Bro'Gaz the Clanless",
	[ 32491 ] = "Time-Lost Proto Drake",
	[ 33776 ] = "Gondria",
	[ 35189 ] = "Skoll",
	[ 38453 ] = "Arcturis",
	[ 1140 ] = "Razormaw Matriarch",
	[ 5842 ] = "Takk the Leaper",
	[ 6581 ] = "Ravasaur Matriarch",
	[ 14232 ] = "Dart",
};

L["BUTTON_FOUND"] = "NPC found!";
L["CACHED_FORMAT"] = "The following unit(s) are already cached: %s.";
L["CACHED_LONG_FORMAT"] = "The following unit(s) are already cached.  Consider removing them using |cff808080“/npcscan”|r's menu or resetting them by clearing your cache: %s.";
L["CACHED_PET_RESTING_FORMAT"] = "The following tamable pet(s) were cached while resting: %s.";
L["CACHED_WORLD_FORMAT"] = "The following %2$s unit(s) are already cached: %1$s.";
L["CACHELIST_ENTRY_FORMAT"] = "|cff808080“%s”|r";
L["CACHELIST_SEPARATOR"] = "; ";
L["CMD_ADD"] = "ADD";
L["CMD_CACHE"] = "CACHE";
L["CMD_CACHE_EMPTY"] = "None of the mobs being searched for are cached.";
L["CMD_HELP"] = "Commands are |cff808080“/npcscan add <NpcID> <Name>”|r, |cff808080“/npcscan remove <NpcID or Name>”|r, |cff808080“/npcscan cache”|r to list cached mobs, and simply |cff808080“/npcscan”|r for the options menu.";
L["CMD_REMOVE"] = "REMOVE";
L["CMD_REMOVENOTFOUND_FORMAT"] = "NPC |cff808080“%s”|r not found.";
L["CONFIG_ALERT"] = "Alert Options";
L["CONFIG_ALERT_SOUND"] = "Alert sound file";
L["CONFIG_ALERT_SOUND_DEFAULT"] = "|cffffd200Default|r";
L["CONFIG_ALERT_SOUND_DESC"] = "Choose the alert sound to play when an NPC is found.  Additional sounds can be added through |cff808080“SharedMedia”|r addons.";
L["CONFIG_ALERT_UNMUTE"] = "Unmute for alert sound";
L["CONFIG_ALERT_UNMUTE_DESC"] = "Briefly enables game sound when an NPC is found to play an alert tone if you have muted the game.";
L["CONFIG_CACHEWARNINGS"] = "Print cache reminders on login and world changes";
L["CONFIG_CACHEWARNINGS_DESC"] = "If an NPC is already cached when you log in or change worlds, this option prints a reminder of which chached mobs can't be searched for.";
L["CONFIG_DESC"] = "These options let you configure the way _NPCScan alerts you when it finds rare NPCs.";
L["CONFIG_TEST"] = "Test Found Alert";
L["CONFIG_TEST_DESC"] = "Simulates an |cff808080“NPC found”|r alert to let you know what to look out for.";
L["CONFIG_TEST_HELP_FORMAT"] = "Click the target button or use the provided keybinding to target the found mob.  Hold |cffffffff<%s>|r and drag to move the target button.  Note that if an NPC is found while you're in combat, the button will only appear after you exit combat.";
L["CONFIG_TEST_NAME"] = "You! (Test)";
L["CONFIG_TITLE"] = "_|cffCCCC88NPCScan|r";
L["FOUND_FORMAT"] = "Found |cff808080“%s”|r!";
L["FOUND_TAMABLE_FORMAT"] = "Found |cff808080“%s”|r!  |cffff2020(Note: Tamable mob, may only be a pet.)|r";
L["FOUND_TAMABLE_WRONGZONE_FORMAT"] = "|cffff2020False alarm:|r Found tamable mob |cff808080“%s”|r in %s instead of %s (ID %d); Definitely a pet.";
L["PRINT_FORMAT"] = "_|cffCCCC88NPCScan|r: %s";
L["SEARCH_ACHIEVEMENTADDFOUND"] = "Search for completed Achievement NPCs";
L["SEARCH_ACHIEVEMENTADDFOUND_DESC"] = "Continues searching for all achievement NPCs, even if you no longer need them.";
L["SEARCH_ACHIEVEMENT_DISABLED"] = "Disabled";
L["SEARCH_ADD"] = "+";
L["SEARCH_ADD_DESC"] = "Add new NPC or save changes to existing one.";
L["SEARCH_ADD_TAMABLE_FORMAT"] = "Note: |cff808080“%s”|r is tamable, so seeing it as a tamed hunter's pet will cause a false alarm.";
L["SEARCH_CACHED"] = "Cached";
L["SEARCH_COMPLETED"] = "Done";
L["SEARCH_DESC"] = "This table allows you to add or remove NPCs and achievements to scan for.";
L["SEARCH_ID"] = "NPC ID:";
L["SEARCH_ID_DESC"] = "The ID of the NPC to search for.  This value can be found on sites like Wowhead.com.";
L["SEARCH_NAME"] = "Name:";
L["SEARCH_NAME_DESC"] = "A label for the NPC.  It doesn't have to match the NPC's actual name.";
L["SEARCH_NPCS"] = "Custom NPCs";
L["SEARCH_NPCS_DESC"] = "Add any NPC to track, even if it has no achievement.";
L["SEARCH_REMOVE"] = "-";
L["SEARCH_TITLE"] = "Search";
L["SEARCH_WORLD"] = "World:";
L["SEARCH_WORLD_DESC"] = "An optional world name to limit searching to.  Can be a continent name or |cffff7f3finstance name|r (case-sensitive).";
L["SEARCH_WORLD_FORMAT"] = "(%s)";

-- Phrases localized by default UI
L["FOUND_ZONE_UNKNOWN"] = UNKNOWN;
L["SEARCH_LEVEL_TYPE_FORMAT"] = UNIT_TYPE_LEVEL_TEMPLATE; -- Level, Type

L["OVERLAY_CONFIG_ALPHA"] = "Alpha";
L["OVERLAY_CONFIG_DESC"] = "Control which maps will show mob path overlays.  Most map-modifying addons are controlled with the World Map option.";
L["OVERLAY_CONFIG_SHOWALL"] = "Always show all paths";
L["OVERLAY_CONFIG_SHOWALL_DESC"] = "Normally when a mob isn't being searched for, its path gets taken off the map.  Enable this setting to always show every known patrol instead.";
L["OVERLAY_CONFIG_TITLE"] = "Overlay";
L["OVERLAY_CONFIG_TITLE_STANDALONE"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_CONFIG_ZONE"] = "Zone:";
L["OVERLAY_MODULE_ALPHAMAP3"] = "AlphaMap3 AddOn";
L["OVERLAY_MODULE_BATTLEFIELDMINIMAP"] = "Battlefield-Minimap Popout";
L["OVERLAY_MODULE_MINIMAP"] = "Minimap";
L["OVERLAY_MODULE_RANGERING_DESC"] = "Note: The range ring only appears in zones with tracked rares.";
L["OVERLAY_MODULE_RANGERING_FORMAT"] = "Show %dyd ring for approximate detection range";
L["OVERLAY_MODULE_WORLDMAP"] = "Main World Map";
L["OVERLAY_MODULE_WORLDMAP_KEY"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_MODULE_WORLDMAP_KEY_FORMAT"] = "· %s";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE_DESC"] = "If enabled, displays _|cffCCCC88NPCScan|r.Overlay's paths for tracked NPCs.";

-- Phrases localized by default UI
L["OVERLAY_CONFIG_ENABLE"] = ENABLE;



SLASH__NPCSCAN1 = "/npcscan";
SLASH__NPCSCAN2 = "/scan";
SLASH__NPCSCAN_OVERLAY1 = "/npcscanoverlay";
SLASH__NPCSCAN_OVERLAY2 = "/npcoverlay";
SLASH__NPCSCAN_OVERLAY3 = "/overlay";

BINDING_HEADER__NPCSCAN = "_|cffCCCC88NPCScan|r";
_G[ "BINDING_NAME_CLICK _NPCScanButton:LeftButton" ] = [=[Target last found mob
|cff808080(Use when _NPCScan alerts you)|r]=];