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

local BLUE = "|cff6666ff";
local GREY = "|cff999999";
local GREN = "|cff66cc33";
local _RED = "|cffcc6666";
local ORNG = "|cffcc9933";
local PURP = "|cff9900ff";
local INDENT = "      ";

local ZONE = 1;
local NPC = 2;
local ITEM = 3;
local OBJECT = 4;
local FACTION = 5;
local QUEST = 6;

--Now with GUIDs!

local myCategory = AtlasDLLocale["Dungeon Locations"];

local myData = {
	DLEast = {
		ZoneName = { AtlasDLLocale["Eastern Kingdoms"] };
		{ BLUE.."A) "..AtlasDLLocale["Alterac Valley"]..", ".._RED..AtlasDLLocale["Alterac Mountains"].." / "..AtlasDLLocale["Hillsbrad Foothills"], ZONE, 2597, 36, 267 };
		{ BLUE.."B) "..AtlasDLLocale["Arathi Basin"]..", ".._RED..AtlasDLLocale["Arathi Highlands"], ZONE, 3358, 45 };
		{ GREY.."1) "..AtlasDLLocale["Magisters' Terrace"]..", ".._RED..AtlasDLLocale["Isle of Quel'Danas"], ZONE, 4095, 4080 };
		{ GREY..INDENT..AtlasDLLocale["Sunwell Plateau"]..", ".._RED..AtlasDLLocale["Isle of Quel'Danas"], ZONE, 4075, 4080 };
		{ GREY.."2) "..AtlasDLLocale["Zul'Aman"]..", ".._RED..AtlasDLLocale["Ghostlands"], ZONE, 3805, 3433 };
		{ GREY.."3) "..AtlasDLLocale["Scarlet Monastery"]..", ".._RED..AtlasDLLocale["Tirisfal Glades"], ZONE, 796, 85 };
		{ GREY.."4) "..AtlasDLLocale["Stratholme"]..", ".._RED..AtlasDLLocale["Eastern Plaguelands"], ZONE, 2017, 139 };
		{ GREY.."5) "..AtlasDLLocale["Scholomance"]..", ".._RED..AtlasDLLocale["Western Plaguelands"], ZONE, 2057, 28 };
		{ GREY.."6) "..AtlasDLLocale["Shadowfang Keep"]..", ".._RED..AtlasDLLocale["Silverpine Forest"], ZONE, 209, 130 };
		{ GREY.."7) "..AtlasDLLocale["Gnomeregan"]..", ".._RED..AtlasDLLocale["Dun Morogh"], ZONE, 133, 1 };
		{ GREY.."8) "..AtlasDLLocale["Uldaman"]..", ".._RED..AtlasDLLocale["Badlands"], ZONE, 1337, 3 };
		{ GREY.."9) "..AtlasDLLocale["Blackwing Lair"]..", ".._RED..AtlasDLLocale["Blackrock Spire"], ZONE, 2677, 1583 };
		{ GREY..INDENT..AtlasDLLocale["Blackrock Depths"]..", ".._RED..AtlasDLLocale["Blackrock Mountain"], ZONE, 1584, 25 };
		{ GREY..INDENT..AtlasDLLocale["Blackrock Spire"]..", ".._RED..AtlasDLLocale["Blackrock Mountain"], ZONE, 1583, 25 };
		{ GREY..INDENT..AtlasDLLocale["Molten Core"]..", ".._RED..AtlasDLLocale["Blackrock Depths"], ZONE, 2717, 1584 };
		{ GREY.."10) "..AtlasDLLocale["The Stockade"]..", ".._RED..AtlasDLLocale["Stormwind City"], ZONE, 717, 1519 };
		{ GREY.."11) "..AtlasDLLocale["The Deadmines"]..", ".._RED..AtlasDLLocale["Westfall"], ZONE, 1581, 40 };
		{ GREY.."12) "..AtlasDLLocale["Zul'Gurub"]..", ".._RED..AtlasDLLocale["Stranglethorn Vale"], ZONE, 19, 33 };
		{ GREY.."13) "..AtlasDLLocale["Karazhan"]..", ".._RED..AtlasDLLocale["Deadwind Pass"], ZONE, 2562, 41 };
		{ GREY.."14) "..AtlasDLLocale["Sunken Temple"]..", ".._RED..AtlasDLLocale["Swamp of Sorrows"], ZONE, 1417, 8 };
		{ "" };
		{ BLUE..AtlasDLLocale["Blue"]..": "..ORNG..AtlasDLLocale["Battlegrounds"] };
		{ GREY..AtlasDLLocale["White"]..": "..ORNG..AtlasDLLocale["Instances"] };
	};
	DLWest = {
		ZoneName = { AtlasDLLocale["Kalimdor"] };
		{ BLUE.."A) "..AtlasDLLocale["Warsong Gulch"]..", ".._RED..AtlasDLLocale["The Barrens"].." / "..AtlasDLLocale["Ashenvale"], ZONE, 3277, 17, 331 };
		{ GREY.."1) "..AtlasDLLocale["Blackfathom Deeps"]..", ".._RED..AtlasDLLocale["Ashenvale"], ZONE, 719, 331 };
		{ GREY.."2) "..AtlasDLLocale["Ragefire Chasm"]..", ".._RED..AtlasDLLocale["Orgrimmar"], ZONE, 2437, 1637 };
		{ GREY.."3) "..AtlasDLLocale["Wailing Caverns"]..", ".._RED..AtlasDLLocale["The Barrens"], ZONE, 718, 17 };
		{ GREY.."4) "..AtlasDLLocale["Maraudon"]..", ".._RED..AtlasDLLocale["Desolace"], ZONE, 2100, 405 };
		{ GREY.."5) "..AtlasDLLocale["Dire Maul"]..", ".._RED..AtlasDLLocale["Feralas"], ZONE, 2557, 357 };
		{ GREY.."6) "..AtlasDLLocale["Razorfen Kraul"]..", ".._RED..AtlasDLLocale["The Barrens"], ZONE, 491, 17 };
		{ GREY.."7) "..AtlasDLLocale["Razorfen Downs"]..", ".._RED..AtlasDLLocale["The Barrens"], ZONE, 722, 17 };
		{ GREY.."8) "..AtlasDLLocale["Onyxia's Lair"]..", ".._RED..AtlasDLLocale["Dustwallow Marsh"], ZONE, 2159, 15 };
		{ GREY.."9) "..AtlasDLLocale["Zul'Farrak"]..", ".._RED..AtlasDLLocale["Tanaris"], ZONE, 978, 440 };
		{ GREY.."10) "..AtlasDLLocale["Caverns of Time"]..", ".._RED..AtlasDLLocale["Tanaris"], ZONE, 0, 440 };
		{ GREY..INDENT..AtlasDLLocale["Old Hillsbrad Foothills"], ZONE, 2367 };
		{ GREY..INDENT..AtlasDLLocale["The Black Morass"], ZONE, 2366 };
		{ GREY..INDENT..AtlasDLLocale["Hyjal Summit"], ZONE, 3606 };
		{ GREY..INDENT..AtlasDLLocale["Stratholme Past"], ZONE, 4100 };
		{ GREY.."11) "..AtlasDLLocale["Ruins of Ahn'Qiraj"]..", ".._RED..AtlasDLLocale["Silithus"], ZONE, 3429, 1377 };
		{ GREY..INDENT..AtlasDLLocale["Temple of Ahn'Qiraj"]..", ".._RED..AtlasDLLocale["Silithus"], ZONE, 3428, 1377 };
		{ "" };
		{ BLUE..AtlasDLLocale["Blue"]..": "..ORNG..AtlasDLLocale["Battlegrounds"] };
		{ GREY..AtlasDLLocale["White"]..": "..ORNG..AtlasDLLocale["Instances"] };
	};
	DLOutland = {
		ZoneName = { AtlasDLLocale["Outland"] };
		{ GREY.."1) "..AtlasDLLocale["Gruul's Lair"]..", ".._RED..AtlasDLLocale["Blade's Edge Mountains"], ZONE, 3618, 3522 };
		{ GREY.."2) "..AtlasDLLocale["Tempest Keep"]..", ".._RED..AtlasDLLocale["Netherstorm"], ZONE, nil, 3523 };
		{ GREY..INDENT..AtlasDLLocale["The Mechanar"], ZONE, 3849 };
		{ GREY..INDENT..AtlasDLLocale["The Botanica"], ZONE, 3847 };
		{ GREY..INDENT..AtlasDLLocale["The Arcatraz"], ZONE, 3846 };
		{ GREY..INDENT..AtlasDLLocale["The Eye"], ZONE, 3842 };
		{ GREY.."3) "..AtlasDLLocale["Coilfang Reservoir"]..", ".._RED..AtlasDLLocale["Zangarmarsh"], ZONE, nil, 3521 };
		{ GREY..INDENT..AtlasDLLocale["The Slave Pens"], ZONE, 3717 };
		{ GREY..INDENT..AtlasDLLocale["The Underbog"], ZONE, 3716 };
		{ GREY..INDENT..AtlasDLLocale["The Steamvault"], ZONE, 3715 };
		{ GREY..INDENT..AtlasDLLocale["Serpentshrine Cavern"], ZONE, 3607 };
		{ GREY.."4) "..AtlasDLLocale["Hellfire Citadel"]..", ".._RED..AtlasDLLocale["Hellfire Peninsula"], ZONE, nil, 3483 };
		{ GREY..INDENT..AtlasDLLocale["Hellfire Ramparts"], ZONE, 3562 };
		{ GREY..INDENT..AtlasDLLocale["The Blood Furnace"], ZONE, 3713 };
		{ GREY..INDENT..AtlasDLLocale["The Shattered Halls"], ZONE, 3714 };
		{ GREY..INDENT..AtlasDLLocale["Magtheridon's Lair"], ZONE, 3836 };
		{ GREY.."5) "..AtlasDLLocale["Auchindoun"]..", ".._RED..AtlasDLLocale["Terokkar Forest"], ZONE, nil, 3519 };
		{ GREY..INDENT..AtlasDLLocale["Mana-Tombs"], ZONE, 3792 };
		{ GREY..INDENT..AtlasDLLocale["Auchenai Crypts"], ZONE, 3790 };
		{ GREY..INDENT..AtlasDLLocale["Sethekk Halls"], ZONE, 3791 };
		{ GREY..INDENT..AtlasDLLocale["Shadow Labyrinth"], ZONE, 3789 };
		{ GREY.."6) "..AtlasDLLocale["Black Temple"]..", ".._RED..AtlasDLLocale["Shadowmoon Valley"], ZONE, 3959, 3520 };
	};
	DLNorthrend = {
		ZoneName = { AtlasDLLocale["Northrend"] };
		{ GREY.."1) "..AtlasDLLocale["The Nexus"]..", ".._RED..AtlasDLLocale["Coldarra"], ZONE, nil, 3537 };
		{ GREY..INDENT..AtlasDLLocale["The Nexus"], ZONE, 4120 };
		{ GREY..INDENT..AtlasDLLocale["The Oculus"], ZONE, 4228 };
		{ GREY..INDENT..AtlasDLLocale["The Eye of Eternity"], ZONE, 4500 };
		{ GREY.."2) "..AtlasDLLocale["Azjol-Nerub"]..", ".._RED..AtlasDLLocale["Dragonblight"], ZONE, nil, 65 };
		{ GREY..INDENT..AtlasDLLocale["Azjol-Nerub: The Upper Kingdom"], ZONE, 3477 };
		{ GREY..INDENT..AtlasDLLocale["Ahn'kahet: The Old Kingdom"], ZONE, 4494 };
		{ GREY.."3) "..AtlasDLLocale["The Obsidian Sanctum"]..", ".._RED..AtlasDLLocale["Dragonblight"], ZONE, 4493, 65 };
		{ GREY.."4) "..AtlasDLLocale["Naxxramas"]..", ".._RED..AtlasDLLocale["Dragonblight"], ZONE, 3456, 65 };
		{ GREY.."5) "..AtlasDLLocale["Drak'Tharon Keep"]..", ".._RED..AtlasDLLocale["Grizzly Hills"], ZONE, 4196, 394 };
		{ GREY.."6) "..AtlasDLLocale["Utgarde Keep"]..", ".._RED..AtlasDLLocale["Howling Fjord"], ZONE, nil, 495 };
		{ GREY..INDENT..AtlasDLLocale["Utgarde Keep"], ZONE, 206 };
		{ GREY..INDENT..AtlasDLLocale["Utgarde Pinnacle"], ZONE, 1196 };
		{ GREY.."7) "..AtlasDLLocale["Gundrak"]..", ".._RED..AtlasDLLocale["Zul'Drak"], ZONE, 4375, 66 };
		{ GREY.."8) "..AtlasDLLocale["The Violet Hold"]..", ".._RED..AtlasDLLocale["Dalaran"], ZONE, 4415, 4395 };
		{ GREY.."9) "..AtlasDLLocale["Icecrown Citadel"]..", ".._RED..AtlasDLLocale["Icecrown"], ZONE, nil, 210 };
		{ GREY.."10) "..AtlasDLLocale["Ulduar"]..", ".._RED..AtlasDLLocale["The Storm Peaks"], ZONE, nil, 67 };
		{ GREY..INDENT..AtlasDLLocale["Ulduar"], ZONE, 4273 };
		{ GREY..INDENT..AtlasDLLocale["Halls of Stone"], ZONE, 4264 };
		{ GREY..INDENT..AtlasDLLocale["Halls of Lightning"], ZONE, 4272 };
	};
};

Atlas_RegisterPlugin("Atlas_DungeonLocs", myCategory, myData);
