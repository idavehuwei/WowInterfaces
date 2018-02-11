--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2008 Dan Gilbert
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

if ( GetLocale() == "frFR" ) then

AtlasDLLocale = {

	--Common
	["Battlegrounds"] = "Champs de bataille";
	["Blue"] = "Bleu "; -- Espace pour le blanc avant une double ponctuation française
	["Dungeon Locations"] = "Emplacements des instances";
	["Instances"] = "Instances";
	["White"] = "Blanc "; -- Espace pour le blanc avant une double ponctuation française

	--Places
	["Ahn'kahet: The Old Kingdom"] = "Ahn'kahet : l'Ancien royaume";
	["Alterac Mountains"] = "Montagnes d'Alterac";
	["Alterac Valley"] = "Vallée d'Alterac";
	["Arathi Basin"] = "Bassin d'Arathi";
	["Arathi Highlands"] = "Hautes-Terres d'Arathi";
	["Ashenvale"] = "Orneval";
	["Auchenai Crypts"] = "Cryptes Auchenaï";
	["Auchindoun"] = "Auchindoun";
	["Azjol-Nerub"] = "Azjol-Nérub";
	["Azjol-Nerub: The Upper Kingdom"] = "Azjol-Nérub";
	["Badlands"] = "Terres ingrates";
	["Black Temple"] = "Temple Noir";
	["Blackfathom Deeps"] = "Profondeurs de Brassenoire";
	["Blackrock Depths"] = "Profondeurs de Rochenoire";
	["Blackrock Mountain"] = "Mont Rochenoire";
	["Blackrock Spire"] = "Pic Rochenoire";
	["Blackwing Lair"] = "Repaire de l'Aile Noire";
	["Blade's Edge Mountains"] = "Les Tranchantes";
	["Caverns of Time"] = "Grottes du Temps";
	["Coilfang Reservoir"] = "Réservoir de Glissecroc";
	["Coldarra"] = "Frimarra";
	["Dalaran"] = "Dalaran";
	["Deadwind Pass"] = "Défilé de Deuillevent";
	["Desolace"] = "Désolace";
	["Dire Maul"] = "Hache-tripes";
	["Dragonblight"] = "Désolation des dragons";
	["Drak'Tharon Keep"] = "Donjon de Drak'Tharon";
	["Dun Morogh"] = "Dun Morogh";
	["Dustwallow Marsh"] = "Marécage d'Âprefange";
	["Eastern Kingdoms"] = "Royaumes de l'Est";
	["Eastern Plaguelands"] = "Maleterres de l'est";
	["Feralas"] = "Féralas";
	["Ghostlands"] = "Terres Fantômes";
	["Gnomeregan"] = "Gnomeregan";
	["Grizzly Hills"] = "Les Grisonnes";
	["Gruul's Lair"] = "Repaire de Gruul";
	["Gundrak"] = "Gundrak";
	["Halls of Lightning"] = "Les salles de Foudre";
	["Halls of Stone"] = "Les salles de Pierre";
	["Hellfire Citadel"] = "Citadelle des Flammes infernales";
	["Hellfire Peninsula"] = "Péninsule des Flammes infernales";
	["Hellfire Ramparts"] = "Remparts des Flammes infernales";
	["Hillsbrad Foothills"] = "Contreforts de Hautebrande";
	["Howling Fjord"] = "Fjord Hurlant";
	["Hyjal Summit"] = "Sommet d'Hyjal";
	["Icecrown Citadel"] = "Citadelle de la Couronne de glace";
	["Icecrown"] = "La Couronne de glace";
	["Isle of Quel'Danas"] = "Île de Quel’Danas";
	["Kalimdor"] = "Kalimdor";
	["Karazhan"] = "Karazhan";
	["Magisters' Terrace"] = "Terrasse des Magistères";
	["Magtheridon's Lair"] = "Le repaire de Magtheridon";
	["Mana-Tombs"] = "Tombes-mana";
	["Maraudon"] = "Maraudon";
	["Molten Core"] = "Cœur du Magma";
	["Naxxramas"] = "Naxxramas";
	["Netherstorm"] = "Raz-de-Néant";
	["Northrend"] = "Norfendre";
	["Old Hillsbrad Foothills"] = "Contreforts de Hautebrande d'antan";
	["Onyxia's Lair"] = "Repaire d'Onyxia";
	["Orgrimmar"] = "Orgrimmar";
	["Outland"] = "Outreterre";
	["Ragefire Chasm"] = "Gouffre de Ragefeu";
	["Razorfen Downs"] = "Souilles de Tranchebauge";
	["Razorfen Kraul"] = "Kraal de Tranchebauge";
	["Ruins of Ahn'Qiraj"] = "Ruines d'Ahn'Qiraj";
	["Scarlet Monastery"] = "Monastère écarlate";
	["Scholomance"] = "Scholomance";
	["Serpentshrine Cavern"] = "Caverne du sanctuaire du Serpent";
	["Sethekk Halls"] = "Les salles des Sethekk";
	["Shadow Labyrinth"] = "Labyrinthe des ombres";
	["Shadowfang Keep"] = "Donjon d'Ombrecroc";
	["Shadowmoon Valley"] = "Vallée d'Ombrelune";
	["Silithus"] = "Silithus";
	["Silverpine Forest"] = "Forêt des Pins Argentés";
	["Stormwind City"] = "Hurlevent";
	["Stranglethorn Vale"] = "Vallée de Strangleronce";
	["Stratholme"] = "Stratholme";
	["Stratholme Past"] = "L'Épuration de Stratholme";
	["Sunken Temple"] = "Temple englouti";
	["Sunwell Plateau"] = "Plateau du Puits de soleil";
	["Swamp of Sorrows"] = "Marais des Chagrins";
	["Tanaris"] = "Tanaris";
	["Tempest Keep"] = "Donjon de la Tempête";
	["Temple of Ahn'Qiraj"] = "Ahn'Qiraj";
	["Terokkar Forest"] = "Forêt de Terokkar";
	["The Arcatraz"] = "L'Arcatraz";
	["The Barrens"] = "Les Tarides";
	["The Black Morass"] = "Le Noir Marécage";
	["The Blood Furnace"] = "La Fournaise du sang";
	["The Botanica"] = "La Botanica";
	["The Deadmines"] = "Les Mortemines";
	["The Eye of Eternity"] = "L'Œil de l'éternité";
	["The Eye"] = "L'Œil";
	["The Mechanar"] = "Le Méchanar";
	["The Nexus"] = "Le Nexus";
	["The Obsidian Sanctum"] = "Le sanctum Obsidien";
	["The Oculus"] = "L'Oculus";
	["The Shattered Halls"] = "Les Salles brisées";
	["The Slave Pens"] = "Les enclos aux esclaves";
	["The Steamvault"] = "Le Caveau de la vapeur";
	["The Stockade"] = "La Prison";
	["The Storm Peaks"] = "Les pics Foudroyés";
	["The Underbog"] = "La Basse-tourbière";
	["The Violet Hold"] = "Le fort Pourpre";
	["Tirisfal Glades"] = "Clairières de Tirisfal";
	["Uldaman"] = "Uldaman";
	["Ulduar"] = "Ulduar";
	["Utgarde Keep"] = "Donjon d'Utgarde";
	["Utgarde Pinnacle"] = "Cime d'Utgarde";
	["Wailing Caverns"] = "Cavernes des lamentations";
	["Warsong Gulch"] = "Goulet des Chanteguerres";
	["Western Plaguelands"] = "Maleterres de l'ouest";
	["Westfall"] = "Marche de l'Ouest";
	["Zangarmarsh"] = "Marécage de Zangar";
	["Zul'Aman"] = "Zul'Aman";
	["Zul'Drak"] = "Zul'Drak";
	["Zul'Farrak"] = "Zul'Farrak";
	["Zul'Gurub"] = "Zul'Gurub";

};
end