-- $Id: localization.fr.lua 79 2009-05-21 18:19:42Z arithmandar $
-- [[
-- Language: French
-- Translated by: oXid_FoX, Ksys
-- Last Updated: May 14, 2009
-- ]]
--------------------------
-- Translatable strings --
--------------------------
if (GetLocale() == "frFR") then
FQ_Formats = {
	"QuêteNom",
	"[QuêteNiveau] QuêteNom",
	"[QuêteNiveau+] QuêteNom",
	"[QuêteNiveau+] QuêteNom (Tag)",
};
--
EPA_TestPatterns = {
 	"^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$",
 	"^(.+): terminée.$",				-- ERR_QUEST_COMPLETE_S
 	"^(.+)\(Terminée)$",				-- ERR_QUEST_OBJECTIVE_COMPLETE_S
 	"^Quête acceptée : .+$",			-- ERR_QUEST_ACCEPTED_S
 	"^Expérience gagnée : .+$",			-- ERR_QUEST_REWARD_EXP_I
 	"^Découverte : .+$",				-- ERR_ZONE_EXPLORED
};
--
FQ_QUEST_TEXT =		"(.*): %s*([-%d]+)%s*/%s*([-%d]+)%s*$";
--
FQ_LOADED = 		"|cff00ffffFastQuest Classic "..FASTQUEST_CLASSIC_VERSION.." est maintenant chargé. Tapez /fq pour plus de détails. Tapez /fq options pour ouvrir la fenêtre d'options.";
FQ_INFO =			"|cff00ffffFastQuest Classic: |r|cffffffff";
-- Strings in Option Frame
FQ_OPT_OPTIONS_TITLE			= "FastQuest Classic Options";
FQ_OPT_FRM_NOTIFY_TITLE			= "Options de notification";
FQ_OPT_AUTONOTIFY_TITLE			= "Auto-notification";
FQ_OPT_AUTONOTIFY_TIP = "Notifier automatiquement les infos relatives à la quête aux joueurs proches, groupe, raid, et/ou membres de la guilde.";
FQ_OPT_DOUBLEWIDTH_TITLE = "Journal de quêtes double largeur";
FQ_OPT_DOUBLEWIDTH_TIP = "simple ou double largeur du journal de quêtes";
FQ_OPT_NOTIFYCHANNEL_TITLE = "Canal de notification";
FQ_OPT_NOTIFYNEARBY_TITLE = "Notifier aux joueurs proches";
FQ_OPT_NOTIFYNEARBY_TIP = "Notification des infos relatives à la quête aux joueurs proches.";
FQ_OPT_NOTIFYPARTY_TITLE = "Notifier au groupe";
FQ_OPT_NOTIFYPARTY_TIP = "Notification des infos relatives à la quête au membres du groupe.";
FQ_OPT_NOTIFYRAID_TITLE = "Notifier au raid";
FQ_OPT_NOTIFYRAID_TIP = "Notification des infos relatives à la quête aux membres du raid.";
FQ_OPT_NOTIFYGUILD_TITLE = "Notifier à la guilde";
FQ_OPT_NOTIFYGUILD_TIP = "Notification des infos relatives à la quête aux membres de la guilde.";
FQ_OPT_NOTIFYDETAIL_TITLE = "Notification des détails de la progression";
FQ_OPT_NOTIFYDETAIL_TIP = "Notifier les détails de progression de la quête (exemple : 3/9 items) .";
FQ_OPT_NOTIFYEXP_TITLE = "Notification du gain d'expérience";
FQ_OPT_NOTIFYEXP_TIP = "Notifier l'expérience gagnée en complétant les quêtes.";
FQ_OPT_NOTIFYZONE_TITLE = "Notification des découvertes de zone";
FQ_OPT_NOTIFYZONE_TIP = "Notifier lorsqu'on découvre une nouvelle zone.";
FQ_OPT_NOTIFYLEVELUP_TITLE = "Notification de la montée de niveau";
FQ_OPT_NOTIFYLEVELUP_TIP = "Notifier les infos de la montée de niveau.";
FQ_OPT_FRM_QUESTFORMAT_TITLE = "Format d'affichage des quêtes";
FQ_OPT_QUESTFORMAT_TITLE = "Choix du format d'affichage des quêtes";
FQ_OPT_QUESTFORMAT_TIP = "Choix du format d'affichage des quêtes pour montrer dans la fenêtre de discussion.";
FQ_OPT_QUESTLOGOPTIONS_TITLE = "Options du journal de quêtes";
FQ_OPT_COLOR_TITLE = "Activer les couleurs";
FQ_OPT_COLOR_TIP = "Activer la coloration (basée sur la difficulté de la quête) du titre des quête dans la liste de suivi.";
FQ_OPT_MEMBERINFO_TITLE = "Afficher le nombre de joueurs suggérés";
FQ_OPT_MEMBERINFO_TIP = "Afficher le nombre de joueurs suggérés dans le journal de quêtes.";
FQ_OPT_MINIMAP_POSITION_TITLE = "Position sur la minimap";
FQ_OPT_SHOWTYPE_TITLE = "Afficher le type de quêtes";
FQ_OPT_SHOWTYPE_TIP = "Afficher le type de quêtes dans la liste de suivi.";
FQ_OPT_LOCK_TITLE = "Verrouiller la liste de suivi des quêtes";
FQ_OPT_LOCK_TIP = "Verrouiller la position de la liste de suivi des quêtes.";
FQ_OPT_AUTOADD_TITLE = "Ajout/suppression auto des quêtes";
FQ_OPT_AUTOADD_TIP = "Ajouter ou supprimer automatiquement les quêtes dans la liste de suivi.";
FQ_OPT_AUTOCOMPLETE_TITLE = "Auto-complétion des quêtes";
FQ_OPT_AUTOCOMPLETE_TIP = "Terminer automatiquement les quêtes finies.";
FQ_OPT_FRM_MISC_TITLE = "Options diverses";
FQ_OPT_SHOWMINIMAP_TITLE = "Afficher l'icone de la minimap";
FQ_OPT_SHOWMINIMAP_TIP = "afficher ou masquer l'icone de la minimap";

FQ_BUTTON_TOOLTIP = "Clic gauche pour ouvrir le journal de quêtes\nClic central pour les options FastQuest Classic\nClic droit et glisser pour déplacer ce bouton.";

-- Information Message
FQ_INFO_NOTIFYGUILD = 	"Notifier aux membres de la guilde : ";
FQ_INFO_NOTIFYRAID = 	"Notifier aux membres du raid : ";
FQ_INFO_NOTIFYNEARBY = 	"Notifier aux joueurs proches : ";
FQ_INFO_NOTIFYPARTY = 	"Notifier aux membres du groupe : ";
FQ_INFO_AUTOADD = "Ajout/suppression auto des quêtes dans la liste de suivi : ";
FQ_INFO_AUTOCOMPLETE = "Auto-complétion des quêtes : ";
FQ_INFO_AUTONOTIFY = "Auto-notification : ";
FQ_INFO_CLEAR = "Toutes les quêtes dans la liste de suivi ont été supprimées. ";
FQ_INFO_COLOR = "Titres des quêtes colorés : ";
FQ_INFO_DETAIL = "Notification des détails de la progression des quêtes : ";
FQ_INFO_DISPLAY_AS = "Format sélectionné : ";
FQ_INFO_DOUBLEWIDTH = "Le journal de quêtes est en double largeur.";
FQ_INFO_FORMAT = "Choix du format d'affichage des quêtes : ";
FQ_INFO_LOCK = "La liste de suivi des quêtes a été |cffff0000verrouillée|r|cffffffff";
FQ_INFO_MEMBERINFO = "Affichage du nombre de joueurs suggérés : ";
FQ_INFO_NOTIFYDISCOVER = "Notification des zones que vous découvrez : ";
FQ_INFO_NOTIFYEXP = "Notification du gain d'expérience des quêtes : ";
FQ_INFO_NOTIFYLEVELUP = "Notification de la montée de niveau : ";
FQ_INFO_QUEST_TAG = "Affichage des tags de quête (Elite, PvP, Raid, etc.) dans la liste de suivi : ";
FQ_INFO_RESET = "La position de la liste de suivi a été réinitialisée";
FQ_INFO_SHOWMINIMAP = "Montrer les icônes sur minimap";
FQ_INFO_UNLOCK = "La liste de suivi des quêtes a été |cff00ff00déverrouillée|r|cffffffff";
FQ_INFO_USAGE = 		"|cffffff00utilisation: /fastquest [command] ou /fq [command]|r|cffffffff";
--
FQ_MUST_RELOAD =		"Vous devez rechargez l'UI pour que ce changement soit effectif. Tapez /console reloadui";
--
FQ_USAGE_NOTIFYGUILD = "(dés)activer la notification auto aux membres de la guilde.";
FQ_USAGE_NOTIFYRAID = "(dés)activer la notification auto aux membres du raid.";
FQ_USAGE_NOTIFYNEARBY = "(dés)activer la notification auto aux joueurs proches.";
FQ_USAGE_NOTIFYPARTY = "(dés)activer la notification auto aux membres du groupe.";
FQ_USAGE_AUTOADD = "(dés)activer l'ajout/suppression auto des quêtes dans la liste de suivi.";
FQ_USAGE_AUTOCOMPLETE = "(dés)activer l'auto-complétion des quêtes lorsque vous les rendez. (Vous ne verrez pas les infos de fin de quête du PNJ.)";
FQ_USAGE_AUTONOTIFY = "(dés)activer la notification auto.";
FQ_USAGE_CLEAR = "Vide la liste de suivi des quêtes.";
FQ_USAGE_COLOR = "(dés)activer les titres des quêtes colorés dans la liste de suivi.";
FQ_USAGE_DETAIL = "(dés)activer la notification des détails de la progression des quêtes.";
FQ_USAGE_FORMAT = "Changement du format d'affichage des quêtes.";
FQ_USAGE_LOCK = "Verrouille/déverrouille la liste de suivi.";
FQ_USAGE_MEMBERINFO = "(dés)activer l'affichage du nombre de joueurs suggérés.";
FQ_USAGE_NOTIFYDISCOVER = "(dés)activer la notification auto des zones que vous découvrez.";
FQ_USAGE_NOTIFYEXP = "(dés)activer la notification auto du gain d'expérience des quêtes.";
FQ_USAGE_NOTIFYLEVELUP = "(dés)activer la notification auto de la montée de niveau.";
FQ_USAGE_RESET = "Réinitialise la position de la liste de suivi.";
FQ_USAGE_STATUS = "Affiche l'état de toutes les options de FastQuest Classic.";
FQ_USAGE_OPTIONS = "Ouvre la fenêtre d'options.";
FQ_USAGE_TAG = "Affichage des tags de quête (Elite, PvP, Raid, etc.)";
--
--BINDING_CATEGORY_FASTQUEST_CLASSIC		= "Quest Enhancement"; -- to translate ?
BINDING_HEADER_FASTQUEST_CLASSIC	= "FastQuest Classic";
BINDING_NAME_FASTQUEST_OPTIONS		= "Options de FastQuest Classic";
BINDING_NAME_FQ_TAG = "Tag de quête";
BINDING_NAME_FQ_FORMAT = "Format des quêtes";
BINDING_NAME_FQ_AOUTNOTIFY = "Auto-notification";
BINDING_NAME_FQ_AOUTCOMPLETE = "Auto-complétion des quêtes";
BINDING_NAME_FQ_AOUTADD = "Ajout/suppression auto des quêtes";
BINDING_NAME_FQ_LOCK = "Verrouiller/déverrouiller la liste de suivi";
--
FQ_QUEST_PROGRESS = "Progression de la quête : ";
--
FQ_QUEST_ISDONE = " est maintenant terminée!";
FQ_QUEST_COMPLETED = " (Quête terminée)";
FQ_DRAG_DISABLED =		"FastQuest Classic: Draging is disabled, use /fq nodrag to toggle. Vous devrez aussi rechargez l'UI pour que ce changement soit effectif";
--
FQ_ENABLED =			"|cff00ff00Activ\195\169|r|cffffffff";
FQ_DISABLED =			"|cffff0000D\195\169sactiv\195\169|r|cffffffff";
FQ_LOCK =				"|cffff0000Verrouill\195\169|r|cffffffff";
FQ_UNLOCK =				"|cff00ff00D\195\169verrouill\195\169|r|cffffffff";
--
end
