-- $Id: localization.de.lua 79 2009-05-21 18:19:42Z arithmandar $
-- [[
-- Language: German
-- Translated by:  Killekille of Blackrock
-- Last Updated:  2006/12/22 00:05
-- ]]
--------------------------
-- Translatable strings --
--------------------------
if (GetLocale() == "deDE") then
FQ_Formats = {
	"QuestName",
	"[QuestLevel] QuestName",
	"[QuestLevel+] QuestName",
	"[QuestLevel+] QuestName (Tag)",
};
--
EPA_TestPatterns = {
 	"^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$",
 	"^(.+)[^Handel] abgeschlossen.$",		-- ERR_QUEST_COMPLETE_S: "%s abgeschlossen."
 	"^(.+)\(Abgeschlossen\)%s$",			-- ERR_QUEST_OBJECTIVE_COMPLETE_S: "%s (Abgeschlossen)"
 	"^Quest angenommen: .+$",				-- ERR_QUEST_ACCEPTED_S: "Quest angenommen: %s"
 	"^Erhaltene Erfahrung: .+$",			-- ERR_QUEST_REWARD_EXP_I: "Erhaltene Erfahrung: %d."
 	"^Entdeckt: .+$",						-- ERR_ZONE_EXPLORED: "Entdeckt: %s"
};
--
FQ_QUEST_TEXT =		"(.*): %s*([-%d]+)%s*/%s*([-%d]+)%s*$";		-- -- ERR_QUEST_ADD_FOUND_SII = "%1$s: %2$d/%3$d", ERR_QUEST_ADD_ITEM_SII = "%1$s: %2$d/%3$d", ERR_QUEST_ADD_KILL_SII = "%1$s getötet: %2$d/%3$d"
--
FQ_LOADED = 		"|cff00ffffFastQuest Classic "..FASTQUEST_CLASSIC_VERSION.." ist nun geladen. Gib /fq ein f\195\188r mehr Details. Type /fq options to toggle option frame.";
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

FQ_BUTTON_TOOLTIP				= "Linke Maustaste drücken, um Quest Log zu öffnen.\nMittlere Maustaste drücken, um FastQuest Classic Optionen anzuzeigen.\nRechte Maustaste gedrückt halten, um diesen Schalter zu verschieben.";

-- Information Message
FQ_INFO_NOTIFYGUILD = 	"Automatische Benachrichtigung der Gilden-Mitglieder \195\188ber deinen Quest-Fortschritt wurde ";
FQ_INFO_NOTIFYRAID = 	"Automatische Benachrichtigung der Raid-Mitglieder \195\188ber deinen Quest-Fortschritt wurde";
FQ_INFO_NOTIFYNEARBY = 	"Notify nearby members regarding my quest progress: ";
FQ_INFO_NOTIFYPARTY = 	"Notify party members regarding my quest progress: ";
FQ_INFO_AUTOADD = 		"Automatisches Hinzuf\195\188gen/Entfernen von ge\195\164nderten Quests zum QuestTracker wurde ";
FQ_INFO_AUTOCOMPLETE = 	"Automatisches Quest beenden wurde ";
FQ_INFO_AUTONOTIFY = 	"Automatische Benachrichtigung der Gruppenmitglieder \195\188ber deinen Quest-Fortschritt wurde ";
FQ_INFO_CLEAR =			"Alle Quest-Tracker Quests wurden gel\195\182scht ";
FQ_INFO_COLOR =			"Quest-Titel in anderer Farbe anzeigen wurde ";
FQ_INFO_DETAIL =		"Benachrichtigung \195\188ber Details zum Questfortschritt wurde ";
FQ_INFO_DISPLAY_AS =	"Gew\195\164hltes Format: ";
FQ_INFO_DOUBLEWIDTH =	"QuestLog Frame Double Width is now ";
FQ_INFO_FORMAT =		"Zwischen Ausgabeformaten umschalten ";
FQ_INFO_LOCK =			"Bewegbare Komponenten wurden |cffff0000gesperrt|r|cffffffff";
FQ_INFO_MEMBERINFO = 	"Quest's suggested to go with group info is now ";
FQ_INFO_NOTIFYDISCOVER = "Notify the new zone you discovered. ";
FQ_INFO_NOTIFYEXP = 	"Notify the experience gained from a quest. ";FQ_INFO_RESET = 		"Bewegbare Komponenten wurden zur\195\188ckgesetzt";
FQ_INFO_NOTIFYLEVELUP = "Notify the level-up information: ";
FQ_INFO_QUEST_TAG =		"Anzeige der Quest-Tags im QuestTracker wurde ";
FQ_INFO_RESET = 		"Bewegbare Komponenten wurden zur\195\188ckgesetzt";
FQ_INFO_SHOWMINIMAP =	"Show icon in MiniMap: ";
FQ_INFO_UNLOCK =		"Bewegbare Komponenten wurden |cff00ff00entsperrt|r|cffffffff";
FQ_INFO_USAGE = 		"|cffffff00benutze: /fastquest [befehl] oder /fq [befehl]|r|cffffffff";
--
FQ_MUST_RELOAD =		"Das UI muss neu geladen werden, damit die \195\132nderungen wirksam werden. Gib /console reloadui ein";
--
FQ_USAGE_NOTIFYGUILD =	"Umschalten der automatischen Benachrichtigung von Gilden-Mitgliedern.";
FQ_USAGE_NOTIFYRAID =	"Umschalten der automatischen Benachrichtigung von Raid-Mitgliedern.";
FQ_USAGE_NOTIFYNEARBY =	"Toggle automatic notification to nearby area.";
FQ_USAGE_NOTIFYPARTY =	"Toggle automatic notification of party members.";
FQ_USAGE_AUTOADD =		"Umschalten des automatischen Hinzuf\195\188gens von ge\195\164nderten Quests zum Quest-Tracker.";
FQ_USAGE_AUTOCOMPLETE =	"Umschalten der automatischen Beendigung von Quests beim Abgeben. (Die Beenden-Meldung des NPC wird dabei nicht angezeigt!!)";
FQ_USAGE_AUTONOTIFY =	"Umschalten der automatischen Benachrichtigung von Gruppenmitgliedern.";
FQ_USAGE_CLEAR =		"QuestTracker-Fenster aus allen Quests l\195\182schen.";
FQ_USAGE_COLOR =		"Farbigen Quest-Titel im Quest-Tracker-Fenster umschalten.";
FQ_USAGE_DETAIL =		"Umschalten zwischen kurzer und detaillierter Quest-Benachrichtigung.";
FQ_USAGE_FORMAT =		"Ausgabeformat der Benachrichtigungen umschalten.";
FQ_USAGE_LOCK =			"(ent)sperrt das Quest-Tracker-Fenster.";
FQ_USAGE_MEMBERINFO = 	"Toggle quest's suggested to go with group info to be displayed or not.";	-- TO BE TRANSLATED
--FQ_USAGE_NODRAG =		"Ziehen des Quest-Trackers umschalten; UI neu laden, damit die \195\132nderung wirksam wird.";
FQ_USAGE_NOTIFYDISCOVER = "Toggle automatic notification of the new zone you discovered.";
FQ_USAGE_NOTIFYEXP =	"Toggle automatic notification of experience gained from a quest.";
FQ_USAGE_NOTIFYLEVELUP = "Toggle automatic notification of level-up information.";
FQ_USAGE_RESET =		"Zur\195\188cksetzen der beweglichen Komponenten von FastQuest Classic(Ziehen muss aktiviert sein).";
FQ_USAGE_STATUS =		"Den FastQuest Classic Konfigurationsstatus anzeigen.";
FQ_USAGE_OPTIONS =		"Toggle option frame.";
FQ_USAGE_TAG =			"Anzeige der Quest-Tags umschalten (Elite, Raid, etc.) ";
--
--FQ_BINDING_CATEGORY_FASTQUEST		= "Quest Erweiterung";
BINDING_HEADER_FASTQUEST_CLASSIC	= "FastQuest Classic";
BINDING_NAME_FASTQUEST_OPTIONS		= "FastQuest Classic Options";
BINDING_NAME_FQ_TAG					= "Quest Tag";
BINDING_NAME_FQ_FORMAT				= "Quest Format";
BINDING_NAME_FQ_AOUTNOTIFY			= "Auto-Benachrichtigung Gruppe";
BINDING_NAME_FQ_AOUTCOMPLETE		= "Auto-Best\195\164tigen Quest";
BINDING_NAME_FQ_AOUTADD				= "Auto-Hinzuf\195\188gen QuestTracker";
BINDING_NAME_FQ_LOCK				= "Lock/Unlock QuestTracker";
--
FQ_QUEST_PROGRESS =		"Quest-Fortschritt: ";
--
FQ_QUEST_ISDONE =		" ist nun fertig!";
FQ_QUEST_COMPLETED =	" (FERTIG)";
FQ_DRAG_DISABLED =		"FastQuest Classic: Ziehen ist ausgeschaltet, benutze /fq nodrag zum Umschalten. Das UI muss danach neu geladen werden";
--
FQ_ENABLED =			"|cff00ff00eingeschaltet|r|cffffffff";
FQ_DISABLED =			"|cffff0000ausgeschaltet|r|cffffffff";
FQ_LOCK =				"|cffff0000gesperrt|r|cffffffff";
FQ_UNLOCK =				"|cff00ff00entsperrt|r|cffffffff";
end
