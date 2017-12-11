--[[
    This file is part of Decursive.
    
    Decursive (v 2.4.2_beta_6-12-g708f71e) add-on for World of Warcraft UI
    Copyright (C) 2006-2007-2008-2009 John Wellesz (archarodim AT teaser.fr) ( http://www.2072productions.com/?to=decursive.php )

    This is the continued work of the original Decursive (v1.9.4) by Quu
    "Decursive 1.9.4" is in public domain ( www.quutar.com )

    Decursive is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Decursive is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Decursive.  If not, see <http://www.gnu.org/licenses/>.
--]]
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- German localization
-------------------------------------------------------------------------------

--[=[
--			YOUR ATTENTION PLEASE
--
--	   !!!!!!! TRANSLATORS TRANSLATORS TRANSLATORS !!!!!!!
--
--    Thank you very much for your interest in translating Decursive.
--    Do not edit those files. Use the localization interface available at the following address:
--
--	################################################################
--	#  http://wow.curseforge.com/projects/decursive/localization/  #
--	################################################################
--
--    Your translations made using this interface will be automatically included in the next release.
--
--]=]

if not DcrLoadedFiles or not DcrLoadedFiles["enUS.lua"] then
    if not DcrCorrupted then message("Decursive installation is corrupted! (enUS.lua not loaded)"); end;
    DcrCorrupted = true;
    return;
end

local L = LibStub("AceLocale-3.0"):NewLocale("Decursive", "deDE");

if not L then
    DcrLoadedFiles["deDE.lua"] = "2.4.2_beta_6-12-g708f71e";
    return;
end;


L["ABOLISH_CHECK"] = "Zuvor überprüfen ob Reinigung nötig"
L["ABSENT"] = "Fehlt (%s)"
L["ALT"] = "Alt"
L["AMOUNT_AFFLIC"] = "Zeige Anzahl der Betroffenen: "
L["ANCHOR"] = "Decursive Textfenster"
L["BINDING_NAME_DCRMUFSHOWHIDE"] = "Micro-Unit-Fenster anzeigen oder verstecken"
L["BINDING_NAME_DCRPRADD"] = "Ziel zur Prioritätenliste hinzufügen"
L["BINDING_NAME_DCRPRCLEAR"] = "Prioritätenliste leeren"
L["BINDING_NAME_DCRPRLIST"] = "Prioritätenliste ausgeben"
L["BINDING_NAME_DCRPRSHOW"] = "Zeige/Verstecke die Prioritätenliste UI"
L["BINDING_NAME_DCRSHOW"] = "Zeige/Verstecke Decursive Main Bar"
L["BINDING_NAME_DCRSKADD"] = "Ziel zur Ignorierliste hinzufügen"
L["BINDING_NAME_DCRSKCLEAR"] = "Ignorierliste leeren"
L["BINDING_NAME_DCRSKLIST"] = "Ignorierliste ausgeben"
L["BINDING_NAME_DCRSKSHOW"] = "Zeige/Verstecke die Ignorierliste UI"
L["BLACK_LENGTH"] = "Sekunden auf der Blacklist: "
L["BLACKLISTED"] = "Black-listed"
L["CHARM"] = "Verführung" -- Needs review
L["CLASS_HUNTER"] = "Jäger"
L["CLEAR_PRIO"] = "C"
L["CLEAR_SKIP"] = "C"
L["CTRL"] = "Strg"
L["CURE_PETS"] = "Scanne und reinige Pets"
L["CURSE"] = "Fluch"
L["DEFAULT_MACROKEY"] = "NONE"
L["DISEASE"] = "Krankheit"
L["DONOT_BL_PRIO"] = "Keine Namen der Prioritätenliste bannen"
L["GLOR1"] = "In Gedenken an Glorfindal"
L["GLOR2"] = [=[Decursive ist Bertrand gewidmet, der uns viel zu früh verlassen hat.
Er wird immer in Erinnerung bleiben.]=]
L["GLOR3"] = [=[In Gedenken an Bertrand Sense
1969 - 2007]=]
L["GLOR4"] = [=[Freundschaft und Zuneigung haben ihre Wurzeln überall, die, die Glorfindal in World of Warcraft getroffen haben kennen einen Menschen großen Einsatzes und einen charismatischen Leiter.

Er war im echten Leben wie im Spiel, Selbstlos, Grosszügig, immer für seine Freunde da und vor allem ein enthusiastischer Mensch.

Er verließ uns mit 38 und lies nicht nur Anonyme Spieler in einer Virtuellen Welt, sondern echte Freunde zurück, die ihn immer vermissen werden.]=]
L["GLOR5"] = "Er wird immer in Erinnerung bleiben..."
L["HANDLEHELP"] = "Alle Micro-Unit-Fenster (MUFs) verschieben"
L["HIDE_LIVELIST"] = "Verstecke die Live-Liste"
L["HIDE_MAIN"] = "Verstecke Decursive Fenster"
L["HLP_LEFTCLICK"] = "Linksklick"
L["HLP_MIDDLECLICK"] = "Mittlere Maustaste"
L["HLP_NOTHINGTOCURE"] = "Es gibt nichts zu Heilen!"
L["HLP_RIGHTCLICK"] = "Rechtsklick"
L["HLP_USEXBUTTONTOCURE"] = "Benutze \"%s\" um dieses Gebrechen zu Heilen!"
L["HLP_WRONGMBUTTON"] = "Falscher Mausbutton!"
L["IGNORE_STEALTH"] = "Ignoriere getarnte Einheiten"
L["IS_HERE_MSG"] = "Decursive wurde geladen, kontrolliere bitte die Einstellungen"
L["MACROKEYMAPPINGFAILED"] = "Die Taste [%s] kann nicht an das Decursive-Macro gebunden werden"
L["MACROKEYMAPPINGSUCCESS"] = "Die Taste [%s] wurde erfolgreich an das Decursive-Macro gebunden"
L["MAGIC"] = "Magie"
L["NOSPELL"] = "Kein Zauber verfügbar"
L["OPT_ADDDEBUFF"] = "Ein Gebrechen manuell hinzufügen"
L["OPT_ADDDEBUFF_DESC"] = "Ein neues Gebrechen der Liste hinzufügen"
L["OPT_ADDDEBUFFFHIST_DESC"] = "Ein Gebrechen anhand der Historie hinzufügen"
L["OPT_ADDDEBUFF_USAGE"] = "<Affliction name>"
L["OPT_ADVDISP"] = "Erweiterte Anzeigeeinstellungen"
L["OPT_AFFLICTEDBYSKIPPED"] = "%s betroffen von %s, wird jedoch übersprungen"
L["OPT_ALWAYSIGNORE"] = "Auch ignorieren wenn nicht im Kampf"
L["OPT_AUTOHIDEMFS"] = "Automatisch verstecken"
L["OPT_BORDERTRANSP"] = "Rahmen-Transparenz"
L["OPT_BORDERTRANSP_DESC"] = "Rahmen-Transparenz setzten"
L["OPT_CURINGOPTIONS"] = "Aktuelle Einstellungen"
L["OPT_CURINGORDEROPTIONS"] = "Aktuelle Sortierungseinstellungen"
L["OPT_DEBUFFENTRY_DESC"] = "Auswählen welche Klasse im Kampf ignoriert werden soll wenn sie von dieser Krankheit betroffen ist."
L["OPT_DEBUFFFILTER"] = "Gebrechen gefilter"
L["OPT_DEBUFFFILTER_DESC"] = "Wähle Gebrechen anhand des Names und der Klasse welches innerhalb des Kampfes gefiltert werden soll."
L["OPT_DISPLAYOPTIONS"] = "Anzeigeoptionen"
L["OPT_DONOTBLPRIO_DESC"] = "Einheiten auf der Prioritätenliste werden nicht in die Blacklist übernommen."
L["OPT_GROWDIRECTION"] = "MUF-Anzeige umkehren"
L["OPT_GROWDIRECTION_DESC"] = "Das MUF von unten nach oben anzeigen"
L["OPT_HIDEMFS_GROUP"] = "Solo/Gruppe"
L["OPT_HIDEMFS_GROUP_DESC"] = "Das MUF verstecken wenn du nicht im Raid bist"
L["OPT_HIDEMFS_NEVER"] = "Nie"
L["OPT_HIDEMFS_NEVER_DESC"] = "Das MUF-Fenster nie automatisch verstecken."
L["OPT_HIDEMFS_SOLO"] = "Solo"
L["OPT_HIDEMFS_SOLO_DESC"] = "Das MUF-Fenster verstecken wenn du in keiner Gruppe oder Raidgruppe bist."
L["OPTION_MENU"] = "Decursive Einstellungen"
L["OPT_LIVELIST"] = "Live-Liste"
L["OPT_LIVELIST_DESC"] = "Optionen für die Live-Liste"
L["OPT_LLALPHA"] = "Transparenz Live-Liste"
L["OPT_LLSCALE"] = "Skalierung der Live-Liste"
L["OPT_LVONLYINRANGE"] = "Nur Einheiten in Reichweite"
L["OPT_LVONLYINRANGE_DESC"] = "Nur Einheiten in Dispelreichweite werden in der Live-Liste angezeigt"
L["OPT_MACROBIND"] = "Tastkombination für das Macro setzen"
L["OPT_MACROOPTIONS"] = "Macro-Optionen"
L["OPT_MACROOPTIONS_DESC"] = "Das Verhalten des Decursive-Macros festlegen"
L["OPT_MAXMFS"] = "Maximale Anzahl an Einheiten die angezeigt werden sollen"
L["OPT_MAXMFS_DESC"] = "Definiert die maximale Anzahl an Mikro-Unitframes die angezeigt werden sollen"
L["OPT_MESSAGES"] = "Nachrichten"
L["OPT_MFALPHA"] = "Transparenz"
L["OPT_MFALPHA_DESC"] = "Abweichende Transparenz der MUF's wenn Einheiten nicht betroffen sind"
L["OPT_MFPERFOPT"] = "Performance-Einstellungen"
L["OPT_MFREFRESHRATE"] = "Aktualisierungsrate"
L["OPT_MFREFRESHSPEED"] = "Aktualisierungsgeschwindigkeit"
L["OPT_MFREFRESHSPEED_DESC"] = "Anzahl der Micro-Unit-Fenster die in einem Durchgang aktualisiert werden sollen"
L["OPT_MFSCALE"] = "Scalieriung des Micro-Unit-Fensters"
L["OPT_MFSCALE_DESC"] = "Große des Micro-Unit-Fensters setzten"
L["OPT_MFSETTINGS"] = "Einstellungen des Micro-Unit-Fensters"
L["OPT_MUFSCOLORS"] = "Farben"
L["OPT_MUFSCOLORS_DESC"] = "Farben des Micro-Unit-Fensters verändern"
L["OPT_NOKEYWARN"] = "Warnen wenn keine Tastenbelegung angegeben"
L["OPT_NOKEYWARN_DESC"] = "Warnen wenn keinen Tastenbelegung angegeben"
L["OPT_PLAYSOUND_DESC"] = "Einen Ton abspielen wenn jemand von einem Fluch betroffen ist"
L["OPT_PRINT_CUSTOM_DESC"] = "Decursive-Nachrichten werden in einem eigenen Chat-Fenster angezeigt"
L["OPT_PRINT_ERRORS_DESC"] = "Fehler werden angezeigt"
L["OPT_PROFILERESET"] = "Profil zurückgestetzt..."
L["OPT_REMOVETHISDEBUFF"] = "Dieses Gebrechen entfernen"
L["OPT_RESETOPTIONS"] = "Optionen zurücksetzten"
L["OPT_RESETOPTIONS_DESC"] = "Aktuelles Profil zurücksetzten"
L["OPT_REVERSE_LIVELIST_DESC"] = "Live-Liste von unten nach oben befüllen"
L["OPT_SCANLENGTH_DESC"] = "Zeit zwischen jedem Scanvorgang festlegen"
L["OPT_SHOWHELP"] = "Hilfe anzeigen"
L["OPT_SHOWMFS"] = "Micro-Unit-Fenster anzeigen"
L["OPT_SHOWMINIMAPICON"] = "Minimap Icon"
L["OPT_SHOWMINIMAPICON_DESC"] = "Minimap Icon anzeigen/verstecken"
L["OPT_STICKTORIGHT"] = "MUF rechts ausrichten"
L["OPT_TIEXYSPACING"] = "Horizontaler und vertikaler Abstand"
L["OPT_UNITPERLINES"] = "Anzahl Einheiten pro Zeile"
L["OPT_UNITPERLINES_DESC"] = "Definiert die max. Anzahl an Micro-Unitframes die pro Zeile angezeigt werden sollen."
L["OPT_USERDEBUFF"] = "Diese Krankheit ist nicht Teil von Decursive's standardmässigen Krankheiten."
L["OPT_XSPACING"] = "Horizontaler Abstand"
L["OPT_XSPACING_DESC"] = "Den horizontalen Abstand zwischen MUFs festlegen."
L["OPT_YSPACING"] = "Vertikaler Abstand"
L["OPT_YSPACING_DESC"] = "Den vertikalen Abstand zwischen MUFs festlegen."
L["PLAY_SOUND"] = "Akustische Warnung falls Reinigung nötig"
L["POISON"] = "Gift"
L["POPULATE"] = "P"
L["POPULATE_LIST"] = "Schnellbestücken der Decursive Liste"
L["PRINT_CHATFRAME"] = "Nachrichten im Chat ausgeben"
L["PRINT_CUSTOM"] = "Nachrichten in Bildschirmmitte ausgeben"
L["PRINT_ERRORS"] = "Fehlernachrichten ausgeben"
L["PRIORITY_LIST"] = "Decursive Prioritätenliste"
L["PRIORITY_SHOW"] = "P"
L["RANDOM_ORDER"] = "Reinige in zufälliger Reihenfolge"
L["REVERSE_LIVELIST"] = "Zeige die Live-Liste umgekehrt"
L["SCAN_LENGTH"] = "Sekunden zwischen Live-Scans: "
L["SHIFT"] = "Shift"
L["SHOW_MSG"] = "Um das Decursive Fenster anzuzeigen, /dcrshow eingeben"
L["SHOW_TOOLTIP"] = "Zeige Tooltips in der Betroffenenliste"
L["SKIP_LIST_STR"] = "Decursive Ignorierliste"
L["SKIP_SHOW"] = "S"
L["SPELL_FOUND"] = "Zauber %s gefunden!"
L["STEALTHED"] = "Getarnt"
L["STR_CLOSE"] = "Schließen"
L["STR_DCR_PRIO"] = "Decursive Prioritätenliste"
L["STR_DCR_SKIP"] = "Decursive Ignorierliste"
L["STR_GROUP"] = "Gruppe "
L["STR_OPTIONS"] = "Einstellungen"
L["STR_OTHER"] = "Sonstige"
L["STR_POP"] = "Bestückungsliste"
L["STR_QUICK_POP"] = "Schnellbestücken"
L["SUCCESSCAST"] = "|cFF22FFFF%s %s|r |cFF00AA00Erfolgreich bei|r %s"
L["TARGETUNIT"] = "Zieleinheit"
L["TOOFAR"] = "Zu weit weg"
L["UNITSTATUS"] = "Einheitenstatus:"



DcrLoadedFiles["deDE.lua"] = "2.4.2_beta_6-12-g708f71e";
