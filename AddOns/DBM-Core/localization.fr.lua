﻿if GetLocale() ~= "frFR" then return end

DBM_CORE_LOAD_MOD_ERROR				= "Erreur durant le chargement du boss mod pour %s: %s"
DBM_CORE_LOAD_MOD_SUCCESS			= "Boss mod pour '%s' chargé!"
DBM_CORE_LOAD_GUI_ERROR				= "Ne peut charger le GUI: %s"

DBM_CORE_COMBAT_STARTED				= "%s engagé. Bonne chance et amusez-vous bien ! :)";
DBM_CORE_BOSS_DOWN					= "%s est mort après %s!"
DBM_CORE_BOSS_DOWN_LONG				= "%s est mort après %s! Votre dernier down a durée %s et le plus rapide a durée %s."
DBM_CORE_BOSS_DOWN_NEW_RECORD		= "%s est mort après %s! C'est un nouveau record! (l'ancien record était de %s)"
DBM_CORE_COMBAT_ENDED				= "Combat contre %s terminé après %s."

DBM_CORE_TIMER_FORMAT_SECS			= "%d |4seconde:secondes;"
DBM_CORE_TIMER_FORMAT_MINS			= "%d |4minute:minutes;"
DBM_CORE_TIMER_FORMAT				= "%d |4minute:minutes; et %d |4seconde:secondes;"

DBM_CORE_MIN						= "min"
DBM_CORE_SEC						= "sec"
DBM_CORE_DEAD						= "mort"
DBM_CORE_OK							= "Okay"

DBM_CORE_GENERIC_WARNING_ENRAGE		= "Frénésie dans %s %s"
DBM_CORE_GENERIC_TIMER_ENRAGE		= "Frénésie"
DBM_CORE_OPTION_TIMER_ENRAGE		= "Afficher le timer pour la Frénésie"
DBM_CORE_OPTION_HEALTH_FRAME		= "Afficher la fenêtre de vie du Boss"

DBM_CORE_OPTION_CATEGORY_TIMERS		= "Barres"
DBM_CORE_OPTION_CATEGORY_WARNINGS	= "Annonces"
DBM_CORE_OPTION_CATEGORY_MISC		= "Divers"

DBM_CORE_AUTO_RESPONDED				= "Réponse automatique."
DBM_CORE_STATUS_WHISPER				= "%s: %s, %d/%d personnes en vie"
DBM_CORE_AUTO_RESPOND_WHISPER		= "%s est occupé(e) à combattre contre %s (%s, %d/%d personnes en vie)"

DBM_CORE_VERSIONCHECK_HEADER		= "Deadly Boss Mods - Versions"
DBM_CORE_VERSIONCHECK_ENTRY			= "%s: %s (r%d)"
DBM_CORE_VERSIONCHECK_ENTRY_NO_DBM	= "%s: DBM non installé"
DBM_CORE_VERSIONCHECK_FOOTER		= "a trouvé %d joueurs avec Deadly Boss Mods"

DBM_CORE_UPDATEREMINDER_HEADER		= "Votre version de Deadly Boss Mods est périmée.\n Version %s (r%d) disponible ici:"
DBM_CORE_UPDATEREMINDER_FOOTER		= "Faites Ctrl-C pour copier le lien ?otre presse-papier."

DBM_CORE_MOVABLE_BAR				= "Déplace moi!"

DBM_PIZZA_SYNC_INFO					= "|Hplayer:%1$s|h[%1$s]|h vous envoie un timer pizza: '%2$s'\n|HDBM:annuler:%2$s:nil|h|cff3588ff[Annuler ce timer]|r|h  |HDBM:ignorer:%2$s:%1$s|h|cff3588ff[Ignorer les timers de %1$s]|r|h"
DBM_PIZZA_CONFIRM_IGNORE			= "Voulez vous vraiment ignorer les timers pizza de %s pour cette session?"
DBM_PIZZA_ERROR_USAGE				= "Usage: /dbm [broadcast] timer <time> <text>"

DBM_CORE_ERROR_DBMV3_LOADED			= "Deadly Boss Mods est lancé en double car vous avez DBMv3 et DBMv4 d'installé et d'activé!\nCliquez sur \"Okay\" pour désactiver DBMv3 et recharger votre interfarce.\nVous pouvez aussi nettoyer votre fichier AddOns en supprimant l'ancien fichier DBMv3."

DBM_CORE_MINIMAP_TOOLTIP_HEADER		= "Deadly Boss Mods"
DBM_CORE_MINIMAP_TOOLTIP_FOOTER		= "Shift+clique ou clique droit pour déplacer"

DBM_CORE_RANGECHECK_HEADER			= "Vérifie la portée (%d m)"
DBM_CORE_RANGECHECK_SETRANGE		= "Définir la portée"
DBM_CORE_RANGECHECK_HIDE			= "Cacher"
DBM_CORE_RANGECHECK_SETRANGE_TO		= "%d yd"

DBM_CORE_SLASHCMD_HELP				= {
	"Commandes slash disponible:",
	"/dbm version: Vérifie la version du raid (alias: ver)",
	"/dbm unlock: Affiche un Timer Status déplacable (alias: move)",
	"/dbm timer <x> <text>: Commence un <x> second Timer Pizza avec le nom <text>",
	"/dbm broadcast timer <x> <text>: Diffuse un Timer Pizza de <x> secondes avec le nom <text> au raid (Nécessite d'étre promu ou leader)",
	"/dbm help: Affiche l'aide",
}

DBM_ERROR_NO_PERMISSION				= "Vous n'avez pas les permissions requises pour faire ceci."

DBM_CORE_BOSSHEALTH_HIDE_FRAME		= "Cacher"

DBM_CORE_ALLIANCE					= "Alliance"
DBM_CORE_HORDE						= "Horde"

DBM_CORE_UNKNOWN					= "Inconnu"

DBM_CORE_TIMER_PULL					= "Pull dans"
DBM_CORE_ANNOUNCE_PULL				= "Pull dans %d sec"
DBM_CORE_ANNOUNCE_PULL_NOW			= "Pull maintenant!"

-- Generic Warnings (deprecated)
DBM_CORE_GENERIC_TARGET_WARN = "%s sur >%%s<!"
DBM_CORE_GENERIC_TARGET_OPTION = "Annoncer la cible de: %s"

-- Auto-generated Timer Localizations
DBM_CORE_AUTO_TIMER_TEXTS = {
	target = "%s: %%s",
	cast = "%s",
	active = "%s",
	cd = "CD de: %s",
	next = "Prochain(e) %s",
	achievement = "%s"
}

DBM_CORE_AUTO_TIMER_OPTIONS = {
	target = "Afficher le temps du debuff pour: |cff71d5ff|Hspell:%d|h%s|h|r",
	cast = "Afficher la barre d'incantation pour: |cff71d5ff|Hspell:%d|h%s|h|r",
	active = "Afficher le timer pour la fin de: |cff71d5ff|Hspell:%d|h%s|h|r",
	cd = "Afficher le cooldown pour: |cff71d5ff|Hspell:%d|h%s|h|r",
	next = "Afficher le timer pour le prochain: |cff71d5ff|Hspell:%d|h%s|h|r",
	achievement = "Show timer for %s" -- translate
}