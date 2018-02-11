--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2009 Dan Gilbert
	Email me at loglow@gmail.com

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]

if ( GetLocale() == "deDE" ) then

AtlasTransLocale = {

	["Aerie Peak"] = "Nistgipfel";
	["Agmar's Hammer"] = "Agmars Hammer";
	["Allerian Stronghold"] = "Allerias Feste";
	["Alliance"] = "Allianz";
	["Altar of Sha'tar"] = "Altar der Sha'tar";
	["Amber Ledge"] = "Bernsteinflöz";
	["Amberpine Lodge"] = "Ammertannhütte";
	["Apothecary Camp"] = "Apothekerlager";
	["Arathi Highlands"] = "Arathihochland";
	["Area 52"] = "Area 52";
	["Argent Tournament Grounds"] = "Argentumturnierplatz";
	["Ashenvale"] = "Eschental";
	["Astranaar"] = "Astranaar";
	["Auberdine"] = "Auberdine";
	["Azshara"] = "Azshara";
	["Azuremyst Isle"] = "Azurmythosinsel";
	["Badlands"] = "Ödland";
	["Blackwind Landing"] = "Schattenwindlager";
	["Blade's Edge Mountains"] = "Schergrat";
	["Blasted Lands"] = "Verwüstete Lande";
	["Blood Watch"] = "Blutwacht";
	["Bloodmyst Isle"] = "Blutmythosinsel";
	["Bloodvenom Post"] = "Blutgiftposten";
	["Booty Bay"] = "Beutebucht";
	["Bor'Gorok Outpost"] = "Außenposten Bor'gorok";
	["Borean Tundra"] = "Boreanische Tundra";
	["Bouldercrag's Refuge"] = "Bergfels' Zuflucht";
	["Brackenwall Village"] = "Brackenwall";
	["Brann Bronzebeard's Camp"] = "Branns Basislager";
	["Burning Steppes"] = "Brennende Steppe";
	["Camp Mojache"] = "Camp Mojache";
	["Camp One'Qwah"] = "Camp Oneqwah";
	["Camp Taurajo"] = "Camp Taurajo";

	["Camp Tunka'lo"] = "Camp Tunka'lo";
	["Camp Winterhoof"] = "Lager der Winterhufe";
	["Caverns of Time"] = "Höhlen der Zeit";
	["Cenarion Hold"] = "Burg Cenarius";
	["Chillwind Point"] = "Zugwindlager";
	["Coldarra"] = "Kaltarra";
	["Conquest Hold"] = "Burg Siegeswall";
	["Cosmowrench"] = "Kosmozang";
	["Crossroads"] = "Das Wegekreuz";
	["Crusaders' Pinnacle"] = "Kreuzfahrerturm";
	["Crystalsong Forest"] = "Kristallsangwald";
	["Dalaran"] = "Dalaran";
	["Darkshire"] = "Dunkelhain";
	["Darkshore"] = "Dunkelküste";
	["Darnassus"] = "Darnassus";
	["Death's Rise"] = "Todesanhöhe";
	["Desolace"] = "Desolace";
	["Dragonblight"] = "Drachenöde";
	["Druid-only"] = "Nur Druiden";
	["Dun Morogh"] = "Dun Morogh";
	["Dun Nifflelem"] = "Dun Niffelem";
	["Durotar"] = "Durotar";
	["Duskwood"] = "Dämmerwald";
	["Dustwallow Marsh"] = "Düstermarschen";
	["Eastern Kingdoms"] = "Östliche Königreiche";
	["Eastern Plaguelands"] = "Östliche Pestländer";
	["Ebon Watch"] = "Die Schwarze Wacht";
	["Elwynn Forest"] = "Wald von Elwynn";
	["Emerald Sanctuary"] = "Smaragdrefugium";
	["Evergrove"] = "Der ewige Hain";
	["Everlook"] = "Ewige Warte";
	["Eversong Woods"] = "Immersangwald";
	["Falcon Watch"] = "Falkenwacht";
	["Feathermoon Stronghold"] = "Mondfederfeste";
	["Felwood"] = "Teufelswald";
	["Feralas"] = "Feralas";
	["Fizzcrank Airstrip"] = "Landebahn Kurbelzisch";
	["Flame Crest"] = "Flammenkamm";
	["Fordragon Keep"] = "Feste Fordragon";
	["Forest Song"] = "Waldeslied";
	["Fort Wildevar"] = "Fort Wildervar";
	["Freewind Post"] = "Freiwindposten";
	["Frosthold"] = "Eisfestung";
	["Gadgetzan"] = "Gadgetzan";
	["Garadar"] = "Garadar";
	["Ghostlands"] = "Geisterlande";
	["Grizzly Hills"] = "Grizzlyhügel";
	["Grom'Gol Base Camp"] = "Basislager von Grom'gol";
	["Grom'arsh Crash-Site"] = "Absturzstelle Grom'ash";
	["Gundrak"] = "Gundrak";
	["Hammerfall"] = "Hammerfall";
	["Hatchet Hills"] = "Axthügel";
	["Hellfire Peninsula"] = "Höllenfeuerhalbinsel";
	["Hillsbrad Foothills"] = "Vorgebirge des Hügellands";
	["Honor Hold"] = "Ehrenfeste";
	["Horde"] = "Horde";
	["Howling Fjord"] = "Der heulende Fjord";
	["Icecrown"] = "Eiskrone";
	["Ironforge"] = "Eisenschmiede";
	["Isle of Quel'Danas"] = "Insel von Quel'Danas";
	["K3"] = "K3";
	["Kalimdor"] = "Kalimdor";
	["Kamagua"] = "Kamagua";
	["Kargath"] = "Kargath";
	["Kor'Kron Vanguard"] = "Vorposten der Kor'kron";
	["Lakeshire"] = "Seenhain";
	["Light's Breach"] = "Die Lichtbresche";
	["Light's Hope Chapel"] = "Kapelle des hoffnungsvollen Lichts";
	["Loch Modan"] = "Loch Modan";
	["Marshal's Refuge"] = "Marschalls Zuflucht";
	["Menethil Harbor"] = "Hafen von Menethil";
	["Moa'ki Harbor"] = "Hafen Moa'ki";
	["Mok'Nathal Village"] = "Dorf der Mok'Nathal";
	["Moonglade"] = "Mondlichtung";
	["Morgan's Vigil"] = "Morgans Wacht";
	["Mudsprocket"] = "Morastwinkel";
	["Mulgore"] = "Mulgore";
	["Nagrand"] = "Nagrand";
	["Nesingwary Base Camp"] = "Nesingwarys Basislager";
	["Nethergarde Keep"] = "Burg Nethergarde";
	["Netherstorm"] = "Nethersturm";
	["New Agamand"] = "Neu-Agamand";
	["Nighthaven"] = "Nachthafen";
	["Nijel's Point"] = "Die Nijelspitze";
	["Northrend"] = "Nordend";
	["Orebor Harborage"] = "Oreborzuflucht";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Scherbenwelt";
	["Ratchet"] = "Ratschet";
	["Rebel Camp"] = "Rebellenlager";
	["Redridge Mountains"] = "Rotkammgebirge";
	["Refuge Pointe"] = "Die Zuflucht";
	["Requires honored faction with Sha'tari Skyguard"] = "Benötigt wohlwollenden Ruf bei Himmelswache der Sha'tari";
	["Revantusk Village"] = "Dorf der Bruchhauer";
	["River's Heart"] = "Flussnabel";
	["Rut'Theran Village"] = "Rut'theran";
	["Sanctum of the Stars"] = "Sanktum der Sterne";
	["Searing Gorge"] = "Sengende Schlucht";
	["Sentinel Hill"] = "Späherkuppe";
	["Shadowmoon Valley"] = "Schattenmondtal";
	["Shadowmoon Village"] = "Schattenmond";
	["Shadowprey Village"] = "Schattenflucht";
	["Shatter Point"] = "Trümmerposten";
	["Shattrath City"] = "Shattrath";
	["Sholazar Basin"] = "Sholazarbecken";
	["Silithus"] = "Silithus";
	["Silvermoon City"] = "Silbermond";
	["Silverpine Forest"] = "Silberwald";
	["Skyguard Outpost"] = "Außenposten der Himmelswache";
	["South of the path along Lake Elune'ara"] = "Südlich des Elune'ara Seewegs";
	["Southshore"] = "Süderstade";
	["Spinebreaker Post"] = "Rückenbrecherposten";
	["Splintertree Post"] = "Splitterholzposten";
	["Star's Rest"] = "Sternenruh";
	["Stonard"] = "Steinard";
	["Stonebreaker Hold"] = "Steinbrecherfeste";
	["Stonetalon Mountains"] = "Steinkrallengebirge";
	["Stonetalon Peak"] = "Der Steinkrallengipfel";
	["The Storm Peaks"] = "Die Sturmgipfel";
	["Stormwind City"] = "Sturmwind";
	["Stranglethorn Vale"] = "Schlingendorntal";
	["Sun Rock Retreat"] = "Sonnenfels";
	["Sun's Reach"] = "Sonnenweiten";
	["Sun's Reach Sanctum"] = "Sanktum der Sonnenweiten";
	["Sunreaver's Command"] = "Sonnenhäschers Schar";
	["Swamp of Sorrows"] = "Sümpfe des Elends";
	["Swamprat Post"] = "Sumpfrattenposten";
	["Sylvanaar"] = "Sylvanaar";
	["Talonbranch Glade"] = "Nachtlaublichtung";
	["Talrendis Point"] = "Talrendisspitze";
	["Tanaris"] = "Tanaris";
	["Tarren Mill"] = "Tarrens Mühle";
	["Taunka'le Village"] = "Taunka'le";
	["Telaar"] = "Telaar";
	["Teldrassil"] = "Teldrassil";
	["Telredor"] = "Telredor";
	["Temple of Telhamat"] = "Tempel von Telhamat";
	["Terokkar Forest"] = "Wälder von Terokkar";
	["Thalanaar"] = "Thalanaar";
	["The Aldor"] = "Die Aldor";
	["The Argent Stand"] = "Die Argentumwache";
	["The Argent Vanguard"] = "Die Argentumvorhut";
	["The Barrens"] = "Brachland";
	["The Dark Portal"] = "Das Dunkle Portal";
	["The Exodar"] = "Die Exodar";
	["The Forgotten Coast"] = "Die vergessene Küste";
	["The Hinterlands"] = "Hinterland";
	["The Scryers"] = "Die Seher";
	["The Sepulcher"] = "Das Grabmal";
	["The Shadow Vault"] = "Das Schattengewölbe";
	["The Stormspire"] = "Die Sturmsäule";
	["Thelsamar"] = "Thelsamar";
	["Theramore Isle"] = "Die Insel Theramore";
	["Thorium Point"] = "Thoriumspitze";
	["Thousand Needles"] = "Tausend Nadeln";
	["Thrallmar"] = "Thrallmar";
	["Thunder Bluff"] = "Donnerfels";
	["Thunderlord Stronghold"] = "Donnerfeste";
	["Tirisfal Glades"] = "Tirisfal";
	["Toshley's Station"] = "Toshleys Station";
	["Tranquillien"] = "Tristessa";
	["Transitus Shield"] = "Transitusschild";
	["Transportation Maps"] = "Beförderungsmittel";
	["Ulduar"] = "Ulduar";
	["Un'Goro Crater"] = "Krater von Un'Goro";
	["Undercity"] = "Unterstadt";
	["Unu'pe"] = "Unu'pe";
	["Valaar's Berth"] = "Valaars Steg";
	["Valgarde"] = "Valgarde";
	["Valiance Keep"] = "Valianzfeste";
	["Valiance Landing Camp"] = "Valianzlager";
	["Valormok"] = "Valormok";
	["Vengeance Landing"] = "Hafen der Vergeltung";
	["Venomspite"] = "Gallgrimm";
	["Warsong Hold"] = "Kriegshymnenfeste";
	["Warsong Landing Camp"] = "Kriegshymnenlager";
	["West of the path to Timbermaw Hold"] = "Westlich des Weges zur Holzschlundfeste";
	["Western Plaguelands"] = "Westliche Pestländer";
	["Westfall Brigade Encampment"] = "Lager der Westfallbrigade";
	["Westfall"] = "Westfall";
	["Westguard Keep"] = "Westwacht";
	["Wetlands"] = "Sumpfland";
	["Wildhammer Stronghold"] = "Wildhammerfeste";
	["Windrunner's Overlook"] = "Windläufers Warte";
	["Wintergarde Keep"] = "Feste Wintergarde";
	["Wintergrasp"] = "Tausendwintersee";
	["Winterspring"] = "Winterquell";
	["Wyrmrest Temple"] = "Wyrmruhtempel";
	["Zabra'jin"] = "Zabra'jin";
	["Zangarmarsh"] = "Zangarmarschen";
	["Zim'Torga"] = "Zim'Torga";
	["Zoram'gar Outpost"] = "Außenposten von Zoram'gar";
	["Zul'Drak"] = "Zul'Drak";

};

end