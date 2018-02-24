--------------------------------------------------------------------------
-- frFR.lua 
--------------------------------------------------------------------------
--[[
GTFO French Localization
Translator: Blubibulga

Change Log:
	v3.1.1
		- Added French localization
	v3.2.2
		- Added untranslated strings
	v4.3.2
		- Added untranslated strings
]]--

if (GetLocale() == "frFR") then

GTFOLocal = 
{
	Active_Off = "Addon suspendu",
	Active_On = "Addon actif",
	ClosePopup_Message = "Vous pouvez configurer vos paramètres de GTFO plus tard en tapant : %s",
	Group_None = "Aucun",
	Group_NotInGroup = "Vous n'êtes pas dans un groupe ou un raid.",
	Group_PartyMembers = "%d des %d membres du groupe utilisent cet addon.",
	Group_RaidMembers = "%d des %d membres du raid utilisent cet addon.",
	Help_Intro = "v%s (|cFFFFFFFFListe de commande|r)",
	Help_Options = "Options d'affichage",
	Help_Suspend = "Suspendre/Activer l'Addon",
	Help_Suspended = "L'addon est actuellement suspendue.",
	Help_TestFail = "Jouer un test sonore (alerte d'échec)",
	Help_TestFriendlyFire = "Jouer un test sonore (ami enflammé)",
	Help_TestHigh = "Jouer un test sonore (dommages élevé)",
	Help_TestLow = "Jouer un test sonore (dommages faible)",
	Help_Version = "Afficher les autres attaquants exécutant cet addon",
	LoadingPopup_Message = "Vos paramètres de GTFO ont été réinitialisées par défaut.  Vous voulez configurer vos paramètres maintenant ?",
	Loading_Loaded = "v%s chargé.",
	Loading_LoadedSuspended = "v%s chargé. (|cFFFF1111Suspendu|r)",
	Loading_LoadedWithPowerAuras = "v%s chargé avec Power Auras.",
	Loading_NewDatabase = "v%s: Nouvelle version de base de données détectée, réinitialiser les paramètres par défaut.",
	Loading_OutOfDate = "v%s est maintenant disponible en téléchargement !  |cFFFFFFFFVeuillez mettre à jour.|r",
	Loading_PowerAurasOutOfDate = "Votre version de |cFFFFFFFFPower Auras Classic|r est obsolète !  GTFO & l'intégration de Power Auras n'a pas pu être chargée.",
	UI_Enabled = "Activé",
	UI_EnabledDescription = "Activer l'addon GTFO.",
	UI_Fail = "Sons d'Alertes d'Échecs",
	UI_FailDescription = "Activer les sons d'alertes GTFO lorsque vous êtes SUPPOSÉ allez plus loin -- j'espère que vous apprendrez pour la prochaine fois !",
	UI_FriendlyFire = "Sons d'ami enflammé",
	UI_FriendlyFireDescription = "Activer les sons d'alerte de GTFO lorsque vos coéquipiers marchent dans des explosions -- un de vos meilleurs déplacement !",
	UI_HighDamage = "Sons de Raid/Haut Dommage",
	UI_HighDamageDescription = "Activer les sons du buzzer de GTFO pour les environnements dangereux qui vous devez éviter d'immédiatement.",
	UI_LowDamage = "Sons de JcJ/Environnement/Faible Dommage",
	UI_LowDamageDescription = "Activer les sons de crétins de GTFO -- utiliser votre discrétion ou non pour bouger de ces environnements de dommages faible",
	UI_Test = "Test",
	UI_TestDescription = "Tester le son.",
	UI_TestMode = "Mode Expérimental/Bêta",
	UI_TestModeDescription = "Activer les alertes non testées/non vérifiées (Beta/PTR)",
	UI_TestModeDescription2 = "Veuillez signaler tout problème à |cFF44FFFF%s@%s.%s|r",
	UI_Trivial = "Alertes de contenu triviales",
	UI_TrivialDescription = "Activer les alertes pour les rencontres de bas niveau qui seraient autrement jugés triviales pour niveau actuel du votre personnage.",
	UI_Unmute = "Jouer les sons lorsque mis en sourdine",
	UI_UnmuteDescription = "Si vous avez le son principal ou les effets sonores mis en sourdine, GTFO activera temporairement le son brièvement pour jouer les sons de GTFO.",
	UI_UnmuteDescription2 = "Cela exige que les curseur de volume soit supérieur à 0 %.",
	UI_Volume = "Volume GTFO",
	UI_VolumeDescription = "Définissez le volume de la lecture des sons.",
	UI_VolumeLoud = "4: Fort",
	UI_VolumeLouder = "5: Fort",
	UI_VolumeMax = "Max",
	UI_VolumeMin = "Min",
	UI_VolumeNormal = "3: Normal (Recommandé)",
	UI_VolumeQuiet = "1: Calme",
	UI_VolumeSoft = "2: Doux",
	-- Untranslated
	TestSound_Fail = "Test sound (fail alert) playing.",
	TestSound_FailMuted = "Test sound (fail alert) playing. [|cFFFF4444MUTED|r]",
	TestSound_High = "Test sound (high damage) playing.",
	TestSound_HighMuted = "Test sound (high damage) playing. [|cFFFF4444MUTED|r]",
	TestSound_Low = "Test sound (low damage) playing.",
	TestSound_LowMuted = "Test sound (low damage) playing. [|cFFFF4444MUTED|r]",
	TestSound_FriendlyFire = "Test sound (friendly fire) playing.",
	TestSound_FriendlyFireMuted = "Test sound (friendly fire) playing. [|cFFFF4444MUTED|r]",
}

end