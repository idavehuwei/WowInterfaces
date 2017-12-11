--------------------------------------------------------------------------
-- deDE.lua 
--------------------------------------------------------------------------
--[[
GTFO German Localization
Translator: Freydis88

Change Log:
	v2.8.1
		- Added German localization
	v3.1
		- Updated German localization for 3.0
	v3.2.2
		- Added untranslated strings
]]--

if (GetLocale() == "deDE") then

GTFOLocal = 
{
	Active_Off = "Add-On pausiert",
	Active_On = "Add-On wird fortgesetzt",
	Group_None = "Keine",
	Group_NotInGroup = "Du bist weder in einer Gruppe, noch in einem Schlachtzug",
	Group_PartyMembers = "%d von %d Gruppenmitgliedern verwenden dieses Add-On",
	Group_RaidMembers = "%d von %d Schlachtzugsmitgliedern verwenden dieses Add-On",
	Help_Intro = "v%s (|cFFFFFFFFBefehlsliste|r)",
	Help_Options = "Optionen anzeigen",
	Help_Suspend = "Add-On pausieren/fortsetzen",
	Help_Suspended = "Derzeit pausiert das Add-On.",
	Help_TestFail = "Tonsignal zum Testen abspielen (Warnsignal für Fehlschläge)",
	Help_TestHigh = "Tonsignal zum Testen abspielen (hoher Schaden)",
	Help_TestLow = "Tonsignal zum Testen abspielen (niedriger Schaden)",
	Help_Version = "Andere Schlachtzugsmitglieder anzeigen, die dieses Add-On aktiviert haben.",
	Loading_Loaded = "v%s wurde geladen.",
	Loading_LoadedSuspended = "v%s wurde geladen. (|cFFFF1111Pausiert|r)",
	Loading_LoadedWithPowerAuras = "v%s mit Power Auras wurde geladen.",
	Loading_NewDatabase = "v%s: Eine neue Version der Datenbank wurde gefunden; es wird auf die Standardeinstellungen zurückgesetzt.",
	Loading_OutOfDate = "v%s ist nun zum Herunterladen verfügbar!  |cFFFFFFFFBitte aktualisieren.|r",
	Loading_PowerAurasOutOfDate = "Deine Version von |cFFFFFFFFPower Auras Classic|r ist veraltet!  GTFO & Power-Auras-Integration konnte nicht geladen werden.",
	TestSound_Fail = "Tonsignal zum Testen (Warnsignal für Fehlschläge) wird abgespielt.",
	TestSound_FailMuted = "Tonsignal zum Testen (Warnsignal für Fehlschläge) wird abgespielt. [|cFFFF4444VERSTUMMT|r]",
	TestSound_High = "Tonsignal zum Testen (hoher Schaden) wird abgespielt.",
	TestSound_HighMuted = "Tonsignal zum Testen (hoher Schaden) wird abgespielt. [|cFFFF4444VERSTUMMT|r]",
	TestSound_Low = "Tonsignal zum Testen (niedriger Schaden) wird abgespielt.",
	TestSound_LowMuted = "Tonsignal zum Testen (niedriger Schaden) wird abgespielt. [|cFFFF4444VERSTUMMT|r]",
	UI_Enabled = "Aktiviert",
	UI_EnabledDescription = "GTFO-Add-On aktivieren",
	UI_Fail = "Warnsignale für Fehlschläge",
	UI_FailDescription = "GTFO-Warnsignale für den Fall, dass du dich wegbewegen sollst, aktivieren -- hoffentlich lernst du es für das nächste Mal!",
	UI_HighDamage = "Tonsignale für Schlachtzug/hoher Schaden",
	UI_HighDamageDescription = "GTFO-Summer-Tonsignale für gefährliche Umgebungen, aus denen du sofort verschwinden solltest, aktivieren.",
	UI_LowDamage = "Tonsignale für PvP/Umgebung/miedriger Schaden",
	UI_LowDamageDescription = "GTFO-Deppen-Tonsignale aktivieren -- entscheide nach deinem Ermessen, ob du aus diesen Umgebungen mit niedrigem Schaden verschwindest oder nicht.",
	UI_Test = "Test",
	UI_TestDescription = "Tonsignale testen.",
	UI_Volume = "GTFO-Lautstärke",
	UI_VolumeDescription = "Audiolautstärke einstellen.",
	UI_VolumeLoud = "4: Laut",
	UI_VolumeMax = "Max. ",
	UI_VolumeMin = "Min. ",
	UI_VolumeNormal = "3: Normal (wird empfohlen)",
	UI_VolumeQuiet = "1: Still",
	UI_VolumeSoft = "2: Leise",
	UI_VolumeLouder = "5: Laut",
	-- 3.0
	UI_Unmute = "Tonsignale abspielen, wenn stummgeschaltet",
	UI_UnmuteDescription = "Falls Du die allgemeine Tonausgabe oder die Sound-Effekte stummgeschaltet haben solltest, aktiviert GTFO vorübergehend die Audiosignale, um ausschließlich jene von GTFO abzuspielen.",
	-- 3.1
	UI_UnmuteDescription2 = "This requires the volume sliders to be higher than 0%.";
	Help_TestFriendlyFire = "Play a test sound (friendly fire)",
	TestSound_FriendlyFire = "Test sound (friendly fire) playing.",
	TestSound_FriendlyFireMuted = "Test sound (friendly fire) playing. [|cFFFF4444MUTED|r]",
	UI_FriendlyFire = "Friendly Fire sounds",
	UI_FriendlyFireDescription = "Enable GTFO alert sounds for when fellow teammates are walking explosions -- one of you better move!",
	LoadingPopup_Message = "Your settings for GTFO have been reset to default.  Do you want to configure your settings now?",
	ClosePopup_Message = "You can configure your GTFO settings later by typing: %s",
	UI_TestMode = "Experimental/Beta Mode",
	UI_TestModeDescription = "Activate untested/unverified alerts (Beta/PTR)",
	UI_TestModeDescription2 = "Please report any issues to |cFF44FFFF%s@%s.%s|r",
	UI_Trivial = "Trivial content alerts",
	UI_TrivialDescription = "Enable alerts for low-level encounters that would otherwise be considered trivial for your character's current level.",
}

end