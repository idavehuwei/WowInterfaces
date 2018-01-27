-- $Id: localization.en.lua 79 2009-05-21 18:19:42Z arithmandar $
-- [[
-- Language: English, and default language
-- Last Updated: May 14, 2009
-- ]]
--------------------------
-- Translatable strings --
--------------------------
-- if (GetLocale() == "enUS") then
FQ_Formats = {
	"QuestName",
	"[QuestLevel] QuestName",
	"[QuestLevel+] QuestName",
	"[QuestLevel+] QuestName (Tag)",
};
--
EPA_TestPatterns = {
	"^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$",
 	"^(.+)[^Trade]completed.$",							-- ERR_QUEST_COMPLETE_S
 	"^(.+)\(Complete\)$",								-- ERR_QUEST_OBJECTIVE_COMPLETE_S
 	"^Quest accepted: .+$",								-- ERR_QUEST_ACCEPTED_S
 	"^Experience gained: .+$",							-- ERR_QUEST_REWARD_EXP_I
 	"^Discovered: .+$",									-- ERR_ZONE_EXPLORED
};
--
FQ_QUEST_TEXT =		"(.*): %s*([-%d]+)%s*/%s*([-%d]+)%s*$";
--
FQ_LOADED = 		"|cff00ffffFastQuest Classic "..FASTQUEST_CLASSIC_VERSION.." is now loaded. Type /fq for more details. Type /fq options to toggle option frame.";
FQ_INFO =			"|cff00ffffFastQuest Classic: |r|cffffffff";
-- Strings in Option Frame
FQ_OPT_OPTIONS_TITLE			= "FastQuest Classic Options";
FQ_OPT_FRM_NOTIFY_TITLE			= "Notify Options";
FQ_OPT_AUTONOTIFY_TITLE			= "Auto Notify";
FQ_OPT_AUTONOTIFY_TIP			= "Automatically notify the quest related info to nearby, party, raid, and/or guild members.";
FQ_OPT_DOUBLEWIDTH_TITLE		= "Double QuestLog Frame Width";
FQ_OPT_DOUBLEWIDTH_TIP			= "Toggle the QuestLog Frame to be double or normal.";
FQ_OPT_NOTIFYCHANNEL_TITLE		= "Notify Channel";
FQ_OPT_NOTIFYNEARBY_TITLE		= "Notify Nearby";
FQ_OPT_NOTIFYNEARBY_TIP			= "Notify nearby for the quest related information.";
FQ_OPT_NOTIFYPARTY_TITLE		= "Notify Party";
FQ_OPT_NOTIFYPARTY_TIP			= "Notify party members for the quest related information.";
FQ_OPT_NOTIFYRAID_TITLE			= "Notify Raid";
FQ_OPT_NOTIFYRAID_TIP			= "Notify raid members for the quest related information.";
FQ_OPT_NOTIFYGUILD_TITLE		= "Notify Guild";
FQ_OPT_NOTIFYGUILD_TIP			= "Notify guild members for the quest related information.";
FQ_OPT_NOTIFYDETAIL_TITLE		= "Notify Details";
FQ_OPT_NOTIFYDETAIL_TIP			= "Notify the detail quest progress.";
FQ_OPT_NOTIFYEXP_TITLE			= "Notify Experience Gained";
FQ_OPT_NOTIFYEXP_TIP			= "Notify the experience gained from a completed quest.";
FQ_OPT_NOTIFYZONE_TITLE			= "Notify Zone Discovered";
FQ_OPT_NOTIFYZONE_TIP			= "Notify the new zone being discovered.";
FQ_OPT_NOTIFYLEVELUP_TITLE		= "Notify Level Up";
FQ_OPT_NOTIFYLEVELUP_TIP		= "Notify the level up information.";
FQ_OPT_FRM_QUESTFORMAT_TITLE	= "Quest Display Format Options";
FQ_OPT_QUESTFORMAT_TITLE		= "Select Quest Display Format";
FQ_OPT_QUESTFORMAT_TIP			= "Select the quest display format to show in chat frame.";
FQ_OPT_QUESTLOGOPTIONS_TITLE	= "Quest Log Options";
FQ_OPT_COLOR_TITLE				= "Enable Color";
FQ_OPT_COLOR_TIP				= "Enable the quest title in the quest tracker window to be show in different color base on the quest difficulty.";
FQ_OPT_MEMBERINFO_TITLE			= "Display Suggested Member Info";
FQ_OPT_MEMBERINFO_TIP			= "Display the quest's suggested member info in the quest log window.";
FQ_OPT_MINIMAP_POSITION_TITLE	= "MiniMap Position";
FQ_OPT_SHOWTYPE_TITLE			= "Show Quest Type";
FQ_OPT_SHOWTYPE_TIP				= "Show the quest type in quest tracker window.";
FQ_OPT_LOCK_TITLE				= "Lock Quest Tracker";
FQ_OPT_LOCK_TIP					= "Lock the quest tracker window's position.";
FQ_OPT_AUTOADD_TITLE			= "Auto Add/Remove Quest";
FQ_OPT_AUTOADD_TIP				= "Automatically add or remove quest into quest tracker window.";
FQ_OPT_AUTOCOMPLETE_TITLE		= "Auto Complete";
FQ_OPT_AUTOCOMPLETE_TIP			= "Automatically turn-in the finished quest.";
FQ_OPT_FRM_MISC_TITLE			= "Misc Options";
FQ_OPT_SHOWMINIMAP_TITLE		= "Show Minimap Icon";
FQ_OPT_SHOWMINIMAP_TIP			= "Toggle show minimap icon.";

FQ_BUTTON_TOOLTIP				= "Left-click to open Quest Log.\nMiddle-click for FastQuest Classic options.\nRight-click and drag to move this button.";

-- Information Message
FQ_INFO_NOTIFYGUILD = 	"Notify guild members regarding my quest progress: ";
FQ_INFO_NOTIFYRAID = 	"Notify raid members regarding my quest progress: ";
FQ_INFO_NOTIFYNEARBY = 	"Notify nearby members regarding my quest progress: ";
FQ_INFO_NOTIFYPARTY = 	"Notify party members regarding my quest progress: ";
FQ_INFO_AUTOADD = 		"Automatic addition/removal of changed quests to QuestTracker: ";
FQ_INFO_AUTOCOMPLETE = 	"Automatic quest completion: ";
FQ_INFO_AUTONOTIFY = 	"Automatically notify my quest progress: ";
FQ_INFO_CLEAR =			"All quests in QuestTracker have been removed. ";
FQ_INFO_COLOR =			"Quest title to be displayed with different color: ";
FQ_INFO_DETAIL =		"Notify quest progress' detail: ";
FQ_INFO_DISPLAY_AS =	"Selected format: ";
FQ_INFO_DOUBLEWIDTH =	"QuestLog Frame Double Width is now ";
FQ_INFO_FORMAT =		"Toggle beetween output formats ";
FQ_INFO_LOCK =			"Movable components have been |cffff0000Locked|r|cffffffff";
FQ_INFO_MEMBERINFO = 	"Quest's suggested to go with group info is now ";
FQ_INFO_NOTIFYDISCOVER = "Notify the new zone you discovered. ";
FQ_INFO_NOTIFYEXP = 	"Notify the experience gained from a quest. ";
FQ_INFO_NOTIFYLEVELUP = "Notify the level-up information: ";
FQ_INFO_QUEST_TAG =		"Display of quest-tags (Elite, PvP, Raid, etc.) in the QuestTracker has been ";
FQ_INFO_RESET = 		"QuestTracker window's position has been reset";
FQ_INFO_SHOWMINIMAP =	"Show icon in MiniMap: ";
FQ_INFO_UNLOCK =		"Movable components have been |cff00ff00Unlocked|r|cffffffff";
FQ_INFO_USAGE = 		"|cffffff00usage: /fastquest [command] or /fq [command]|r|cffffffff";
--
FQ_MUST_RELOAD =		"You must reload UI for this change to apply. Type /console reloadui";
--
FQ_USAGE_NOTIFYGUILD =	"Toggle automatic notification of guild members.";
FQ_USAGE_NOTIFYRAID =	"Toggle automatic notification of raid members.";
FQ_USAGE_NOTIFYNEARBY =	"Toggle automatic notification to nearby area.";
FQ_USAGE_NOTIFYPARTY =	"Toggle automatic notification of party members.";
FQ_USAGE_AUTOADD =		"Toggle automatic addition of changed quests to QuestTracker.";
FQ_USAGE_AUTOCOMPLETE =	"Toggle automatic completion of quests when turning them in. (You will not see the quest completion information from NPC.)";
FQ_USAGE_AUTONOTIFY =	"Toggle automatic notification of party members.";
FQ_USAGE_CLEAR =		"Clear QuestTracker window from all quests.";
FQ_USAGE_COLOR =		"Toggle colorful quest title in QuestTracker window.";
FQ_USAGE_DETAIL =		"Toggle quest notification in brief or in detail.";
FQ_USAGE_FORMAT =		"Toggle quest notification output format.";
FQ_USAGE_LOCK =			"Locks/Unlocks quest tracker window.";
FQ_USAGE_MEMBERINFO = 	"Toggle quest's suggested to go with group info to be displayed or not.";
FQ_USAGE_NOTIFYDISCOVER = "Toggle automatic notification of the new zone you discovered.";
FQ_USAGE_NOTIFYEXP =	"Toggle automatic notification of experience gained from a quest.";
FQ_USAGE_NOTIFYLEVELUP = "Toggle automatic notification of level-up information.";
FQ_USAGE_RESET =		"Resets QuestTracker window's position";
FQ_USAGE_STATUS =		"Display all the FastQuest Classic configuration status.";
FQ_USAGE_OPTIONS =		"Toggle option frame.";
FQ_USAGE_TAG =			"Toggle display of quest tags (elite, raid, etc) ";
--
--BINDING_CATEGORY_FASTQUEST_CLASSIC		= "Quest Enhancement";
BINDING_HEADER_FASTQUEST_CLASSIC	= "FastQuest Classic";
BINDING_NAME_FASTQUEST_OPTIONS		= "Toggle FQ Options";
BINDING_NAME_FQ_TAG					= "Toggle Quest Tag";
BINDING_NAME_FQ_FORMAT				= "Quest Display Format";
BINDING_NAME_FQ_AOUTNOTIFY			= "Auto Notify";
BINDING_NAME_FQ_AOUTCOMPLETE		= "Auto Commit Quest";
BINDING_NAME_FQ_AOUTADD				= "Auto Add QuestTracker";
BINDING_NAME_FQ_LOCK				= "Lock/Unlock QuestTracker";
--
FQ_QUEST_PROGRESS =		"Quest progress: ";
--
FQ_QUEST_ISDONE =		" is now completed!";	-- The sentence will be "[xxxx] is now completed!", where xxxx refer to quest name
FQ_QUEST_COMPLETED =	" (Quest Completed)";
FQ_DRAG_DISABLED =		"FastQuest Classic: Draging is disabled, use /fq nodrag to toggle you must also reload UI for changes to take affect";
--
FQ_ENABLED =			"|cff00ff00Enabled|r|cffffffff";
FQ_DISABLED =			"|cffff0000Disabled|r|cffffffff";
FQ_LOCK =				"|cffff0000Locked|r|cffffffff";
FQ_UNLOCK =				"|cff00ff00Unlocked|r|cffffffff";
--
-- end