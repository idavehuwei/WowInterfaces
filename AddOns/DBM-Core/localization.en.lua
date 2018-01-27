DBM_CORE_LOAD_MOD_ERROR				= "Error while loading boss mods for %s: %s"
DBM_CORE_LOAD_MOD_SUCCESS			= "Loaded '%s' boss mods!"
DBM_CORE_LOAD_GUI_ERROR				= "Could not load GUI: %s"

DBM_CORE_COMBAT_STARTED				= "%s engaged. Good luck and have fun! :)";
DBM_CORE_BOSS_DOWN					= "%s down after %s!"
DBM_CORE_BOSS_DOWN_LONG				= "%s down after %s! Your last kill took %s and your fastest kill %s."
DBM_CORE_BOSS_DOWN_NEW_RECORD		= "%s down after %s! This is a new record! (old record was %s)"
DBM_CORE_COMBAT_ENDED				= "Combat against %s ended after %s."

DBM_CORE_TIMER_FORMAT_SECS			= "%d |4second:seconds;"
DBM_CORE_TIMER_FORMAT_MINS			= "%d |4minute:minutes;"
DBM_CORE_TIMER_FORMAT				= "%d |4minute:minutes; and %d |4second:seconds;"

DBM_CORE_MIN						= "min"
DBM_CORE_SEC						= "sec"
DBM_CORE_DEAD						= "dead"
DBM_CORE_OK							= "Okay"

DBM_CORE_GENERIC_WARNING_ENRAGE		= "Enrage in %s %s"
DBM_CORE_GENERIC_TIMER_ENRAGE		= "Enrage"
DBM_CORE_OPTION_TIMER_ENRAGE		= "Show Enrage timer"
DBM_CORE_OPTION_HEALTH_FRAME		= "Show boss health frame"

DBM_CORE_OPTION_CATEGORY_TIMERS		= "Bars"
DBM_CORE_OPTION_CATEGORY_WARNINGS	= "Announces"
DBM_CORE_OPTION_CATEGORY_MISC		= "Miscellaneous"

DBM_CORE_AUTO_RESPONDED				= "Auto-responded."
DBM_CORE_STATUS_WHISPER				= "%s: %s, %d/%d people alive"
DBM_CORE_AUTO_RESPOND_WHISPER		= "%s is busy fighting against %s (%s, %d/%d people alive)"

DBM_CORE_VERSIONCHECK_HEADER		= "Deadly Boss Mods - Versions"
DBM_CORE_VERSIONCHECK_ENTRY			= "%s: %s (r%d)"
DBM_CORE_VERSIONCHECK_ENTRY_NO_DBM	= "%s: DBM not installed"
DBM_CORE_VERSIONCHECK_FOOTER		= "Found %d players with Deadly Boss Mods"

DBM_CORE_UPDATEREMINDER_HEADER		= "Your version of Deadly Boss Mods is outdated.\n Version %s (r%d) is available for download here:"
DBM_CORE_UPDATEREMINDER_FOOTER		= "Press Ctrl-C to copy the download link to your clipboard."
DBM_CORE_UPDATEREMINDER_NOTAGAIN	= "Show popup when a new version is available"

DBM_CORE_MOVABLE_BAR				= "Drag me!"

DBM_PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h sent you a pizza timer: '%2$s'\n|HDBM:cancel:%2$s:nil|h|cff3588ff[Cancel this timer]|r|h  |HDBM:ignore:%2$s:%1$s|h|cff3588ff[Ignore timers from %1$s]|r|h"
DBM_PIZZA_CONFIRM_IGNORE			= "Do you really want to ignore pizza timers from %s for this session?"
DBM_PIZZA_ERROR_USAGE				= "Usage: /dbm [broadcast] timer <time> <text>"

DBM_CORE_ERROR_DBMV3_LOADED			= "Deadly Boss Mods is running twice because you have DBMv3 and DBMv4 installed and enabled!\nClick \"Okay\" to disable DBMv3 and reload your interface.\nYou should also clean up your AddOns folder by deleting the old DBMv3 folders."

DBM_CORE_MINIMAP_TOOLTIP_HEADER		= "Deadly Boss Mods"
DBM_CORE_MINIMAP_TOOLTIP_FOOTER		= "Shift+click or right-click to move\nAlt+shift+click for free drag&drop"

DBM_CORE_RANGECHECK_HEADER			= "Range Check (%d yd)"
DBM_CORE_RANGECHECK_SETRANGE		= "Set range"
DBM_CORE_RANGECHECK_HIDE			= "Hide"
DBM_CORE_RANGECHECK_SETRANGE_TO		= "%d yd"

DBM_CORE_SLASHCMD_HELP				= {
	"Available Slash Commands:",
	"/dbm version: performans a raid-wide version check (alias: ver)",
	"/dbm unlock: shows a movable status bar timer (alias: move)",
	"/dbm timer <x> <text>: Starts a <x> second Pizza Timer with the name <text>",
	"/dbm broadcast timer <x> <text>: Broadcasts a <x> second Pizza Timer with the name <text> to the raid (required promoted or leader)",
	"/dbm help: shows this help",
}

DBM_ERROR_NO_PERMISSION				= "You don't have the required permission to do this."

DBM_CORE_BOSSHEALTH_HIDE_FRAME		= "Hide"

DBM_CORE_ALLIANCE					= "Alliance"
DBM_CORE_HORDE						= "Horde"

DBM_CORE_UNKNOWN					= "unknown"

DBM_CORE_TIMER_PULL					= "Pull in"
DBM_CORE_ANNOUNCE_PULL				= "Pull in %d sec"
DBM_CORE_ANNOUNCE_PULL_NOW			= "Pull now!"


-- Generic Warnings (deprecated)
DBM_CORE_GENERIC_TARGET_WARN = "%s on >%%s<!"
DBM_CORE_GENERIC_TARGET_OPTION = "Announce target of %s"

DBM_CORE_ACHIEVEMENT_TIMER_SPEED_KILL = "Speed Kill"

-- Auto-generated Timer Localizations
DBM_CORE_AUTO_TIMER_TEXTS = {
	target = "%s: %%s",
	cast = "%s",
	active = "%s",
	cd = "%s CD",
	next = "Next %s",
	achievement = "%s",
}

DBM_CORE_AUTO_TIMER_OPTIONS = {
	target = "Show |cff71d5ff|Hspell:%d|h%s|h|r debuff timer",
	cast = "Show |cff71d5ff|Hspell:%d|h%s|h|r cast timer",
	active = "Show |cff71d5ff|Hspell:%d|h%s|h|r duration timer",
	cd = "Show |cff71d5ff|Hspell:%d|h%s|h|r cooldown timer",
	next = "Show timer for next |cff71d5ff|Hspell:%d|h%s|h|r",
	achievement = "Show timer for %s",
}
