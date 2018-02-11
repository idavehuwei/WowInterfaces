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

AtlasDLLocale = {

	--Common
	["Battlegrounds"] = "Schlachtfelder";
	["Blue"] = "Blau";
	["Dungeon Locations"] = "Instanzen-Standorte";
	["Instances"] = "Instanzen";
	["White"] = "Weiß";

	--Places
	["Ahn'kahet: The Old Kingdom"] = "Ahn'kahet: Das Alte Königreich";
	["Alterac Mountains"] = "Alteracgebirge";
	["Alterac Valley"] = "Alteractal";
	["Arathi Basin"] = "Arathibecken";
	["Arathi Highlands"] = "Arathihochland";
	["Ashenvale"] = "Eschental";
	["Auchenai Crypts"] = "Auchenaikrypta";
	["Auchindoun"] = "Auchindoun";
	["Azjol-Nerub"] = "Azjol-Nerub";
	["Azjol-Nerub: The Upper Kingdom"] = "Azjol-Nerub: Das obere Königreich";
	["Badlands"] = "Ödland";
	["Black Temple"] = "Der Schwarze Tempel";
	["Blackfathom Deeps"] = "Tiefschwarze Grotte";
	["Blackrock Depths"] = "Schwarzfelstiefen";
	["Blackrock Mountain"] = "Der Schwarzfels";
	["Blackrock Spire"] = "Schwarzfelsspitze";
	["Blackwing Lair"] = "Pechschwingenhort";
	["Blade's Edge Mountains"] = "Schergrat";
	["Caverns of Time"] = "Höhlen der Zeit";
	["Coilfang Reservoir"] = "Der Echsenkessel";
	["Coldarra"] = "Kaltarra";
	["Dalaran"] = "Dalaran";
	["Deadwind Pass"] = "Gebirgspass der Totenwinde";
	["Desolace"] = "Desolace";
	["Dire Maul"] = "Düsterbruch";
	["Dragonblight"] = "Drachenöde";
	["Drak'Tharon Keep"] = "Feste Drak'Tharon";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Düstermarschen";
	["Eastern Kingdoms"] = "Östliche Königreiche";
	["Eastern Plaguelands"] = "Östliche Pestländer";
	["Feralas"] = "Feralas";
	["Ghostlands"] = "Geisterlande";
	["Gnomeregan"] = "Gnomeregan";
	["Grizzly Hills"] = "Grizzlyhügel";
	["Gruul's Lair"] = "Gruuls Unterschlupf";
	["Gundrak"] = "Gundrak";
	["Halls of Lightning"] = "Die Hallen der Blitze";
	["Halls of Stone"] = "Die Hallen des Steins";
	["Hellfire Citadel"] = "Höllenfeuerzitadelle";
	["Hellfire Peninsula"] = "Höllenfeuerhalbinsel";
	["Hellfire Ramparts"] = "Höllenfeuerbollwerk";
	["Hillsbrad Foothills"] = "Vorgebirge des Hügellands";
	["Howling Fjord"] = "Der heulende Fjord";
	["Hyjal Summit"] = "Hyjalgipfel";
	["Icecrown Citadel"] = "Eiskronenzitadelle";
	["Icecrown"] = "Eiskrone";
	["Isle of Quel'Danas"] = "Insel von Quel'Danas";
	["Kalimdor"] = "Kalimdor";
	["Karazhan"] = "Karazhan";
	["Magisters' Terrace"] = "Terrasse der Magister";
	["Magtheridon's Lair"] = "Magtheridons Kammer";
	["Mana-Tombs"] = "Managruft";
	["Maraudon"] = "Maraudon";
	["Molten Core"] = "Geschmolzener Kern";
	["Naxxramas"] = "Naxxramas";
	["Netherstorm"] = "Nethersturm";
	["Northrend"] = "Nordend";
	["Old Hillsbrad Foothills"] = "Vorgebirge des Alten Hügellands";
	["Onyxia's Lair"] = "Onyxias Hort";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Scherbenwelt";
	["Ragefire Chasm"] = "Der Flammenschlund";
	["Razorfen Downs"] = "Hügel der Klingenhauer";
	["Razorfen Kraul"] = "Kral der Klingenhauer";
	["Ruins of Ahn'Qiraj"] = "Ruinen von Ahn'Qiraj";
	["Scarlet Monastery"] = "Das scharlachrote Kloster";
	["Scholomance"] = "Scholomance";
	["Serpentshrine Cavern"] = "Höhle des Schlangenschreins";
	["Sethekk Halls"] = "Sethekkhallen";
	["Shadow Labyrinth"] = "Schattenlabyrinth";
	["Shadowfang Keep"] = "Burg Schattenfang";
	["Shadowmoon Valley"] = "Schattenmondtal";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Silberwald";
	["Stormwind City"] = "Sturmwind";
	["Stranglethorn Vale"] = "Schlingendorntal";
	["Stratholme"] = "Stratholme";
	["Stratholme Past"] = "Das Ausmerzen von Stratholme";
	["Sunken Temple"] = "Der Tempel von Atal'Hakkar";
	["Sunwell Plateau"] = "Sonnenbrunnenplateau";
	["Swamp of Sorrows"] = "Sümpfe des Elends";
	["Tanaris"] = "Tanaris";
	["Tempest Keep"] = "Festung der Stürme";
	["Temple of Ahn'Qiraj"] = "Tempel von Ahn'Qiraj";
	["Terokkar Forest"] = "Wälder von Terrokar";
	["The Arcatraz"] = "Die Arkatraz";
	["The Barrens"] = "Brachland";
	["The Black Morass"] = "Der schwarze Morast";
	["The Blood Furnace"] = "Der Blutkessel";
	["The Botanica"] = "Die Botanika";
	["The Deadmines"] = "Die Todesminen";
	["The Eye of Eternity"] = "Das Auge der Ewigkeit";
	["The Eye"] = "Festung der Stürme";
	["The Mechanar"] = "Die Mechanar";
	["The Nexus"] = "Der Nexus";
	["The Obsidian Sanctum"] = "Das Obsidiansanktum";
	["The Oculus"] = "Das Oculus";
	["The Shattered Halls"] = "Die zerschmetterten Hallen";
	["The Slave Pens"] = "Die Sklavenunterkünfte";
	["The Steamvault"] = "Die Dampfkammer";
	["The Stockade"] = "Das Verlies";
	["The Storm Peaks"] = "Die Sturmgipfel";
	["The Underbog"] = "Der Tiefensumpf";
	["The Violet Hold"] = "Die Violette Festung";
	["Tirisfal Glades"] = "Tirisfal";
	["Uldaman"] = "Uldaman";
	["Ulduar"] = "Ulduar";
	["Utgarde Keep"] = "Burg Utgarde";
	["Utgarde Pinnacle"] = "Turm Utgarde";
	["Wailing Caverns"] = "Die Höhlen des Wehklagens";
	["Warsong Gulch"] = "Kriegshymnenschlucht";
	["Western Plaguelands"] = "Westliche Pestländer";
	["Westfall"] = "Westfall";
	["Zangarmarsh"] = "Zangarmarschen";
	["Zul'Aman"] = "Zul'Aman";
	["Zul'Drak"] = "Zul'Drak";
	["Zul'Farrak"] = "Zul'Farrak";
	["Zul'Gurub"] = "Zul'Gurub";

};

end
