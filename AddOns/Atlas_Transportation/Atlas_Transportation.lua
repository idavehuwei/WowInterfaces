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

local myCategory = AtlasTransLocale["Transportation Maps"];

local myData = {
	TransAllianceEast = {
		ZoneName = { AtlasTransLocale["Eastern Kingdoms"].." ("..AtlasTransLocale["Alliance"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Valgarde"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ BLUE.."B) "..AtlasTransLocale["Valiance Keep"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ BLUE.."C) "..AtlasTransLocale["Auberdine"]..", ".._RED..AtlasTransLocale["Darkshore"], ZONE, 148 };
		{ BLUE.."D) "..AtlasTransLocale["Ratchet"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ BLUE.."E) "..AtlasTransLocale["Theramore Isle"]..", ".._RED..AtlasTransLocale["Dustwallow Marsh"], ZONE, 15 };
		{ BLUE.."F) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."1) "..AtlasTransLocale["Sun's Reach"]..", ".._RED..AtlasTransLocale["Isle of Quel'Danas"], ZONE, 4080 };
		{ GREY.."2) "..AtlasTransLocale["Hatchet Hills"]..", ".._RED..AtlasTransLocale["Ghostlands"], ZONE, 3433 };
		{ GREY.."3) "..AtlasTransLocale["Light's Hope Chapel"]..", ".._RED..AtlasTransLocale["Eastern Plaguelands"], ZONE, 139 };
		{ GREY.."4) "..AtlasTransLocale["Chillwind Point"]..", ".._RED..AtlasTransLocale["Western Plaguelands"], ZONE, 28 };
		{ GREY.."5) "..AtlasTransLocale["Aerie Peak"]..", ".._RED..AtlasTransLocale["The Hinterlands"], ZONE, 47 };
		{ GREY.."6) "..AtlasTransLocale["Southshore"]..", ".._RED..AtlasTransLocale["Hillsbrad Foothills"], ZONE, 267 };
		{ GREY.."7) "..AtlasTransLocale["Refuge Pointe"]..", ".._RED..AtlasTransLocale["Arathi Highlands"], ZONE, 45 };
		{ GREY.."8) "..AtlasTransLocale["Menethil Harbor"]..", ".._RED..AtlasTransLocale["Wetlands"], ZONE, 11 };
		{ GREY.."9) "..AtlasTransLocale["Ironforge"]..", ".._RED..AtlasTransLocale["Dun Morogh"], ZONE, 1 };
		{ GREY.."10) "..AtlasTransLocale["Thelsamar"]..", ".._RED..AtlasTransLocale["Loch Modan"], ZONE, 38 };
		{ GREY.."11) "..AtlasTransLocale["Thorium Point"]..", ".._RED..AtlasTransLocale["Searing Gorge"], ZONE, 51 };
		{ GREY.."12) "..AtlasTransLocale["Morgan's Vigil"]..", ".._RED..AtlasTransLocale["Burning Steppes"], ZONE, 46 };
		{ GREY.."13) "..AtlasTransLocale["Stormwind City"]..", ".._RED..AtlasTransLocale["Elwynn Forest"], ZONE, 12 };
		{ GREY.."14) "..AtlasTransLocale["Lakeshire"]..", ".._RED..AtlasTransLocale["Redridge Mountains"], ZONE, 44 };
		{ GREY.."15) "..AtlasTransLocale["Sentinel Hill"]..", ".._RED..AtlasTransLocale["Westfall"], ZONE, 40 };
		{ GREY.."16) "..AtlasTransLocale["Darkshire"]..", ".._RED..AtlasTransLocale["Duskwood"], ZONE, 10 };
		{ GREY.."17) "..AtlasTransLocale["Nethergarde Keep"]..", ".._RED..AtlasTransLocale["Blasted Lands"], ZONE, 4 };
		{ GREY.."18) "..AtlasTransLocale["Rebel Camp"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."19) "..AtlasTransLocale["Booty Bay"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."20) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Blasted Lands"], ZONE, 4 };
	};
	TransAllianceWest = {
		ZoneName = { AtlasTransLocale["Kalimdor"].." ("..AtlasTransLocale["Alliance"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Menethil Harbor"]..", ".._RED..AtlasTransLocale["Wetlands"], ZONE, 11 };
		{ BLUE.."B) "..AtlasTransLocale["Stormwind City"]..", ".._RED..AtlasTransLocale["Elwynn Forest"], ZONE, 12 };
		{ BLUE.."C) "..AtlasTransLocale["Booty Bay"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."1) "..AtlasTransLocale["Rut'Theran Village"]..", ".._RED..AtlasTransLocale["Teldrassil"], ZONE, 141 };
		{ GREY.."2) "..AtlasTransLocale["Nighthaven"]..GREY..", ".._RED..AtlasTransLocale["Moonglade"]..GREN.." ("..AtlasTransLocale["Druid-only"]..")", ZONE, 493 };
		{ GREY.."3) "..AtlasTransLocale["South of the path along Lake Elune'ara"]..", ".._RED..AtlasTransLocale["Moonglade"], ZONE, 493 };
		{ GREY.."4) "..AtlasTransLocale["Everlook"]..", ".._RED..AtlasTransLocale["Winterspring"], ZONE, 618 };
		{ GREY.."5) "..AtlasTransLocale["Auberdine"]..", ".._RED..AtlasTransLocale["Darkshore"], ZONE, 148 };
		{ GREY.."6) "..AtlasTransLocale["Talonbranch Glade"]..", ".._RED..AtlasTransLocale["Felwood"], ZONE, 361 };
		{ GREY.."7) "..AtlasTransLocale["Emerald Sanctuary"]..", ".._RED..AtlasTransLocale["Felwood"], ZONE, 361 };
		{ GREY.."8) "..AtlasTransLocale["Stonetalon Peak"]..", ".._RED..AtlasTransLocale["Stonetalon Mountains"], ZONE, 406 };
		{ GREY.."9) "..AtlasTransLocale["Astranaar"]..", ".._RED..AtlasTransLocale["Ashenvale"], ZONE, 331 };
		{ GREY.."10) "..AtlasTransLocale["Forest Song"]..", ".._RED..AtlasTransLocale["Ashenvale"], ZONE, 331 };
		{ GREY.."11) "..AtlasTransLocale["Talrendis Point"]..", ".._RED..AtlasTransLocale["Azshara"], ZONE, 16 };
		{ GREY.."12) "..AtlasTransLocale["Nijel's Point"]..", ".._RED..AtlasTransLocale["Desolace"], ZONE, 405 };
		{ GREY.."13) "..AtlasTransLocale["Ratchet"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ GREY.."14) "..AtlasTransLocale["Theramore Isle"]..", ".._RED..AtlasTransLocale["Dustwallow Marsh"], ZONE, 15 };
		{ GREY.."15) "..AtlasTransLocale["Mudsprocket"]..", ".._RED..AtlasTransLocale["Dustwallow Marsh"], ZONE, 15 };
		{ GREY.."16) "..AtlasTransLocale["Feathermoon Stronghold"]..", ".._RED..AtlasTransLocale["Feralas"], ZONE, 357 };
		{ GREY.."17) "..AtlasTransLocale["The Forgotten Coast"]..", ".._RED..AtlasTransLocale["Feralas"], ZONE, 357 };
		{ GREY.."18) "..AtlasTransLocale["Thalanaar"]..", ".._RED..AtlasTransLocale["Feralas"], ZONE, 357 };
		{ GREY.."19) "..AtlasTransLocale["Marshal's Refuge"]..", ".._RED..AtlasTransLocale["Un'Goro Crater"], ZONE, 490 };
		{ GREY.."20) "..AtlasTransLocale["Cenarion Hold"]..", ".._RED..AtlasTransLocale["Silithus"], ZONE, 1377 };
		{ GREY.."21) "..AtlasTransLocale["Gadgetzan"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
		{ GREY.."22) "..AtlasTransLocale["Blood Watch"]..", ".._RED..AtlasTransLocale["Bloodmyst Isle"], ZONE, 3525 };
		{ GREY.."23) "..AtlasTransLocale["Valaar's Berth"]..", ".._RED..AtlasTransLocale["Azuremyst Isle"], ZONE, 3524 };
	};
	TransHordeEast = {
		ZoneName = { AtlasTransLocale["Eastern Kingdoms"].." ("..AtlasTransLocale["Horde"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Vengeance Landing"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ BLUE.."B) "..AtlasTransLocale["Orgrimmar"]..", ".._RED..AtlasTransLocale["Durotar"], ZONE, 14 };
		{ BLUE.."C) "..AtlasTransLocale["Ratchet"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ BLUE.."D) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."1) "..AtlasTransLocale["Sun's Reach"]..", ".._RED..AtlasTransLocale["Isle of Quel'Danas"], ZONE, 4080 };
		{ GREY.."2) "..AtlasTransLocale["Silvermoon City"]..", ".._RED..AtlasTransLocale["Eversong Woods"], ZONE, 3430 };
		{ GREY.."3) "..AtlasTransLocale["Tranquillien"]..", ".._RED..AtlasTransLocale["Ghostlands"], ZONE, 3433 };
		{ GREY.."4) "..AtlasTransLocale["Hatchet Hills"]..", ".._RED..AtlasTransLocale["Ghostlands"], ZONE, 3433 };
		{ GREY.."5) "..AtlasTransLocale["Light's Hope Chapel"]..", ".._RED..AtlasTransLocale["Eastern Plaguelands"], ZONE, 139 };
		{ GREY.."6) "..AtlasTransLocale["Undercity"]..", ".._RED..AtlasTransLocale["Tirisfal Glades"], ZONE, 85 };
		{ GREY.."7) "..AtlasTransLocale["The Sepulcher"]..", ".._RED..AtlasTransLocale["Silverpine Forest"], ZONE, 130 };
		{ GREY.."8) "..AtlasTransLocale["Tarren Mill"]..", ".._RED..AtlasTransLocale["Hillsbrad Foothills"], ZONE, 267 };
		{ GREY.."9) "..AtlasTransLocale["Revantusk Village"]..", ".._RED..AtlasTransLocale["The Hinterlands"], ZONE, 47 };
		{ GREY.."10) "..AtlasTransLocale["Hammerfall"]..", ".._RED..AtlasTransLocale["Arathi Highlands"], ZONE, 45 };
		{ GREY.."11) "..AtlasTransLocale["Thorium Point"]..", ".._RED..AtlasTransLocale["Searing Gorge"], ZONE, 51 };
		{ GREY.."12) "..AtlasTransLocale["Kargath"]..", ".._RED..AtlasTransLocale["Badlands"], ZONE, 3 };
		{ GREY.."13) "..AtlasTransLocale["Flame Crest"]..", ".._RED..AtlasTransLocale["Burning Steppes"], ZONE, 46 };
		{ GREY.."14) "..AtlasTransLocale["Stonard"]..", ".._RED..AtlasTransLocale["Swamp of Sorrows"], ZONE, 8 };
		{ GREY.."15) "..AtlasTransLocale["Grom'Gol Base Camp"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."16) "..AtlasTransLocale["Booty Bay"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."17) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Blasted Lands"], ZONE, 4 };
	};
	TransHordeWest = {
		ZoneName = { AtlasTransLocale["Kalimdor"].." ("..AtlasTransLocale["Horde"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Warsong Hold"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ BLUE.."B) "..AtlasTransLocale["Undercity"]..", ".._RED..AtlasTransLocale["Tirisfal Glades"], ZONE, 85 };
		{ BLUE.."C) "..AtlasTransLocale["Grom'Gol Base Camp"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ BLUE.."D) "..AtlasTransLocale["Booty Bay"]..", ".._RED..AtlasTransLocale["Stranglethorn Vale"], ZONE, 33 };
		{ GREY.."1) "..AtlasTransLocale["Nighthaven"]..GREY..", ".._RED..AtlasTransLocale["Moonglade"]..GREN.." ("..AtlasTransLocale["Druid-only"]..")", ZONE, 493 };
		{ GREY.."2) "..AtlasTransLocale["West of the path to Timbermaw Hold"]..", ".._RED..AtlasTransLocale["Moonglade"], ZONE, 493 };
		{ GREY.."3) "..AtlasTransLocale["Everlook"]..", ".._RED..AtlasTransLocale["Winterspring"], ZONE, 618 };
		{ GREY.."4) "..AtlasTransLocale["Bloodvenom Post"]..", ".._RED..AtlasTransLocale["Felwood"], ZONE, 361 };
		{ GREY.."5) "..AtlasTransLocale["Emerald Sanctuary"]..", ".._RED..AtlasTransLocale["Felwood"], ZONE, 361 };
		{ GREY.."6) "..AtlasTransLocale["Zoram'gar Outpost"]..", ".._RED..AtlasTransLocale["Ashenvale"], ZONE, 331 };
		{ GREY.."7) "..AtlasTransLocale["Valormok"]..", ".._RED..AtlasTransLocale["Azshara"], ZONE, 16 };
		{ GREY.."8) "..AtlasTransLocale["Splintertree Post"]..", ".._RED..AtlasTransLocale["Ashenvale"], ZONE, 331 };
		{ GREY.."9) "..AtlasTransLocale["Orgrimmar"]..", ".._RED..AtlasTransLocale["Durotar"], ZONE, 14 };
		{ GREY.."10) "..AtlasTransLocale["Sun Rock Retreat"]..", ".._RED..AtlasTransLocale["Stonetalon Mountains"], ZONE, 406 };
		{ GREY.."11) "..AtlasTransLocale["Crossroads"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ GREY.."12) "..AtlasTransLocale["Ratchet"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ GREY.."13) "..AtlasTransLocale["Shadowprey Village"]..", ".._RED..AtlasTransLocale["Desolace"], ZONE, 405 };
		{ GREY.."14) "..AtlasTransLocale["Thunder Bluff"]..", ".._RED..AtlasTransLocale["Mulgore"], ZONE, 215 };
		{ GREY.."15) "..AtlasTransLocale["Camp Taurajo"]..", ".._RED..AtlasTransLocale["The Barrens"], ZONE, 17 };
		{ GREY.."16) "..AtlasTransLocale["Brackenwall Village"]..", ".._RED..AtlasTransLocale["Dustwallow Marsh"], ZONE, 15 };
		{ GREY.."17) "..AtlasTransLocale["Mudsprocket"]..", ".._RED..AtlasTransLocale["Dustwallow Marsh"], ZONE, 15 };
		{ GREY.."18) "..AtlasTransLocale["Camp Mojache"]..", ".._RED..AtlasTransLocale["Feralas"], ZONE, 357 };
		{ GREY.."19) "..AtlasTransLocale["Freewind Post"]..", ".._RED..AtlasTransLocale["Thousand Needles"], ZONE, 400 };
		{ GREY.."20) "..AtlasTransLocale["Marshal's Refuge"]..", ".._RED..AtlasTransLocale["Un'Goro Crater"], ZONE, 490 };
		{ GREY.."21) "..AtlasTransLocale["Cenarion Hold"]..", ".._RED..AtlasTransLocale["Silithus"], ZONE, 1377 };
		{ GREY.."22) "..AtlasTransLocale["Gadgetzan"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
	};
	TransHordeOutland = {
		ZoneName = { AtlasTransLocale["Outland"].." ("..AtlasTransLocale["Horde"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Blasted Lands"], ZONE, 4 };
		{ BLUE.."B) "..AtlasTransLocale["Orgrimmar"]..", ".._RED..AtlasTransLocale["Durotar"], ZONE, 14 };
		{ BLUE..INDENT..AtlasTransLocale["Thunder Bluff"]..", ".._RED..AtlasTransLocale["Mulgore"], ZONE, 215 };
		{ BLUE..INDENT..AtlasTransLocale["Undercity"]..", ".._RED..AtlasTransLocale["Tirisfal Glades"], ZONE, 85 };
		{ BLUE..INDENT..AtlasTransLocale["Silvermoon City"]..", ".._RED..AtlasTransLocale["Eversong Woods"], ZONE, 3430 };
		{ BLUE..INDENT..AtlasTransLocale["Sun's Reach Sanctum"]..", ".._RED..AtlasTransLocale["Isle of Quel'Danas"], ZONE, 4080 };
		{ BLUE..INDENT..AtlasTransLocale["Caverns of Time"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
		{ GREY.."1) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."2) "..AtlasTransLocale["Thrallmar"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."3) "..AtlasTransLocale["Spinebreaker Post"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."4) "..AtlasTransLocale["Falcon Watch"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."5) "..AtlasTransLocale["Swamprat Post"]..", ".._RED..AtlasTransLocale["Zangarmarsh"], ZONE, 3521 };
		{ GREY.."6) "..AtlasTransLocale["Zabra'jin"]..", ".._RED..AtlasTransLocale["Zangarmarsh"], ZONE, 3521 };
		{ GREY.."7) "..AtlasTransLocale["Garadar"]..", ".._RED..AtlasTransLocale["Nagrand"], ZONE, 3518 };
		{ GREY.."8) "..AtlasTransLocale["Shattrath City"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREY.."9) "..AtlasTransLocale["Stonebreaker Hold"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREY.."10) "..AtlasTransLocale["Shadowmoon Village"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"], ZONE, 3520 };
		{ GREY.."11) "..AtlasTransLocale["Altar of Sha'tar"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"]..BLUE.." ("..AtlasTransLocale["The Aldor"]..")", ZONE, 3520 , FACTION, 932 };
		{ GREY.."12) "..AtlasTransLocale["Sanctum of the Stars"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"]..BLUE.." ("..AtlasTransLocale["The Scryers"]..")", ZONE, 3520 , FACTION, 934 };
		{ GREY.."13) "..AtlasTransLocale["Thunderlord Stronghold"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."14) "..AtlasTransLocale["Evergrove"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."15) "..AtlasTransLocale["Mok'Nathal Village"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."16) "..AtlasTransLocale["Area 52"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREY.."17) "..AtlasTransLocale["The Stormspire"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREY.."18) "..AtlasTransLocale["Cosmowrench"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREN.."1') "..AtlasTransLocale["Blackwind Landing"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREN.."2') "..AtlasTransLocale["Skyguard Outpost"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREN..INDENT.."("..AtlasTransLocale["Requires honored faction with Sha'tari Skyguard"]..")", FACTION, 1031 };
	};
	TransAllianceOutland = {
		ZoneName = { AtlasTransLocale["Outland"].." ("..AtlasTransLocale["Alliance"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Blasted Lands"], ZONE, 4 };
		{ BLUE.."B) "..AtlasTransLocale["Ironforge"]..", ".._RED..AtlasTransLocale["Dun Morogh"], ZONE, 1 };
		{ BLUE..INDENT..AtlasTransLocale["Stormwind City"]..", ".._RED..AtlasTransLocale["Elwynn Forest"], ZONE, 12 };
		{ BLUE..INDENT..AtlasTransLocale["Darnassus"]..", ".._RED..AtlasTransLocale["Teldrassil"], ZONE, 141 };
		{ BLUE..INDENT..AtlasTransLocale["The Exodar"]..", ".._RED..AtlasTransLocale["Azuremyst Isle"], ZONE, 3524 };
		{ BLUE..INDENT..AtlasTransLocale["Sun's Reach Sanctum"]..", ".._RED..AtlasTransLocale["Isle of Quel'Danas"], ZONE, 4080 };
		{ BLUE..INDENT..AtlasTransLocale["Caverns of Time"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
		{ GREY.."1) "..AtlasTransLocale["The Dark Portal"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."2) "..AtlasTransLocale["Shatter Point"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."3) "..AtlasTransLocale["Honor Hold"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."4) "..AtlasTransLocale["Temple of Telhamat"]..", ".._RED..AtlasTransLocale["Hellfire Peninsula"], ZONE, 3483 };
		{ GREY.."5) "..AtlasTransLocale["Telredor"]..", ".._RED..AtlasTransLocale["Zangarmarsh"], ZONE, 3521 };
		{ GREY.."6) "..AtlasTransLocale["Orebor Harborage"]..", ".._RED..AtlasTransLocale["Zangarmarsh"], ZONE, 3521 };
		{ GREY.."7) "..AtlasTransLocale["Telaar"]..", ".._RED..AtlasTransLocale["Nagrand"], ZONE, 3518 };
		{ GREY.."8) "..AtlasTransLocale["Shattrath City"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREY.."9) "..AtlasTransLocale["Allerian Stronghold"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREY.."10) "..AtlasTransLocale["Wildhammer Stronghold"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"], ZONE, 3520 };
		{ GREY.."11) "..AtlasTransLocale["Altar of Sha'tar"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"]..BLUE.." ("..AtlasTransLocale["The Aldor"]..")", ZONE, 3520 , FACTION, 932 };
		{ GREY.."12) "..AtlasTransLocale["Sanctum of the Stars"]..", ".._RED..AtlasTransLocale["Shadowmoon Valley"]..BLUE.." ("..AtlasTransLocale["The Scryers"]..")", ZONE, 3520 , FACTION, 934 };
		{ GREY.."13) "..AtlasTransLocale["Sylvanaar"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."14) "..AtlasTransLocale["Evergrove"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."15) "..AtlasTransLocale["Toshley's Station"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREY.."16) "..AtlasTransLocale["Area 52"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREY.."17) "..AtlasTransLocale["The Stormspire"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREY.."18) "..AtlasTransLocale["Cosmowrench"]..", ".._RED..AtlasTransLocale["Netherstorm"], ZONE, 3523 };
		{ GREN.."1') "..AtlasTransLocale["Blackwind Landing"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ GREN.."2') "..AtlasTransLocale["Skyguard Outpost"]..", ".._RED..AtlasTransLocale["Blade's Edge Mountains"], ZONE, 3522 };
		{ GREN..INDENT.."("..AtlasTransLocale["Requires honored faction with Sha'tari Skyguard"]..")", FACTION, 1031 };
	};
	TransHordeNorthrend = {
		ZoneName = { AtlasTransLocale["Northrend"].." ("..AtlasTransLocale["Horde"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Orgrimmar"]..", ".._RED..AtlasTransLocale["Durotar"], ZONE, 14 };
		{ BLUE.."B) "..AtlasTransLocale["Undercity"]..", ".._RED..AtlasTransLocale["Tirisfal Glades"], ZONE, 85 };
		{ BLUE.."C) "..AtlasTransLocale["Orgrimmar"]..", ".._RED..AtlasTransLocale["Durotar"], ZONE, 14 };
		{ BLUE..INDENT..AtlasTransLocale["Silvermoon City"]..", ".._RED..AtlasTransLocale["Eversong Woods"], ZONE, 3430 };
		{ BLUE..INDENT..AtlasTransLocale["Undercity"]..", ".._RED..AtlasTransLocale["Tirisfal Glades"], ZONE, 85 };
		{ BLUE..INDENT..AtlasTransLocale["Thunder Bluff"]..", ".._RED..AtlasTransLocale["Mulgore"], ZONE, 215 };
		{ BLUE..INDENT..AtlasTransLocale["Shattrath City"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ BLUE..INDENT..AtlasTransLocale["Caverns of Time"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
		{ GREY.."1) "..AtlasTransLocale["Warsong Hold"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."2) "..AtlasTransLocale["Amber Ledge"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."3) "..AtlasTransLocale["Transitus Shield"]..", ".._RED..AtlasTransLocale["Coldarra"], ZONE, 3537 };
		{ GREY.."4) "..AtlasTransLocale["Bor'Gorok Outpost"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."5) "..AtlasTransLocale["Taunka'le Village"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."6) "..AtlasTransLocale["Unu'pe"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."7) "..AtlasTransLocale["Nesingwary Base Camp"]..", ".._RED..AtlasTransLocale["Sholazar Basin"], ZONE, 3711 };
		{ GREY.."8) "..AtlasTransLocale["River's Heart"]..", ".._RED..AtlasTransLocale["Sholazar Basin"], ZONE, 3711 };
		{ GREY.."9) "..AtlasTransLocale["Agmar's Hammer"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."10) "..AtlasTransLocale["Moa'ki Harbor"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."11) "..AtlasTransLocale["Kor'Kron Vanguard"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."12) "..AtlasTransLocale["Wyrmrest Temple"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."13) "..AtlasTransLocale["Venomspite"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."14) "..AtlasTransLocale["Kamagua"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."15) "..AtlasTransLocale["New Agamand"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."16) "..AtlasTransLocale["Vengeance Landing"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."17) "..AtlasTransLocale["Apothecary Camp"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."18) "..AtlasTransLocale["Camp Winterhoof"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."19) "..AtlasTransLocale["Conquest Hold"]..", ".._RED..AtlasTransLocale["Grizzly Hills"], ZONE, 394 };
		{ GREY.."20) "..AtlasTransLocale["Camp One'Qwah"]..", ".._RED..AtlasTransLocale["Grizzly Hills"], ZONE, 394 };
		{ GREY.."21) "..AtlasTransLocale["Gundrak"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."22) "..AtlasTransLocale["Zim'Torga"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."23) "..AtlasTransLocale["The Argent Stand"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."24) "..AtlasTransLocale["Light's Breach"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."25) "..AtlasTransLocale["Ebon Watch"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."26) "..AtlasTransLocale["Sunreaver's Command"]..", ".._RED..AtlasTransLocale["Crystalsong Forest"], ZONE, 2817 };
		{ GREY.."27) "..AtlasTransLocale["Dalaran"]..", ".._RED..AtlasTransLocale["Crystalsong Forest"], ZONE, 2817 };
		{ GREY.."28) "..AtlasTransLocale["K3"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."29) "..AtlasTransLocale["Camp Tunka'lo"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."30) "..AtlasTransLocale["Grom'arsh Crash-Site"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."31) "..AtlasTransLocale["Bouldercrag's Refuge"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."32) "..AtlasTransLocale["Ulduar"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."33) "..AtlasTransLocale["Dun Nifflelem"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."34) "..AtlasTransLocale["The Argent Vanguard"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."35) "..AtlasTransLocale["Crusaders' Pinnacle"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."36) "..AtlasTransLocale["Argent Tournament Grounds"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."37) "..AtlasTransLocale["The Shadow Vault"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."38) "..AtlasTransLocale["Death's Rise"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."39) "..AtlasTransLocale["Warsong Landing Camp"]..", ".._RED..AtlasTransLocale["Wintergrasp"], ZONE, 4197 };
	};
	TransAllianceNorthrend = {
		ZoneName = { AtlasTransLocale["Northrend"].." ("..AtlasTransLocale["Alliance"]..")" };
		{ BLUE.."A) "..AtlasTransLocale["Stormwind City"]..", ".._RED..AtlasTransLocale["Elwynn Forest"], ZONE, 12 };
		{ BLUE.."B) "..AtlasTransLocale["Menethil Harbor"]..", ".._RED..AtlasTransLocale["Wetlands"], ZONE, 11 };
		{ BLUE.."C) "..AtlasTransLocale["Stormwind City"]..", ".._RED..AtlasTransLocale["Elwynn Forest"], ZONE, 12 };
		{ BLUE..INDENT..AtlasTransLocale["The Exodar"]..", ".._RED..AtlasTransLocale["Azuremyst Isle"], ZONE, 3524 };
		{ BLUE..INDENT..AtlasTransLocale["Ironforge"]..", ".._RED..AtlasTransLocale["Dun Morogh"], ZONE, 1 };
		{ BLUE..INDENT..AtlasTransLocale["Darnassus"]..", ".._RED..AtlasTransLocale["Teldrassil"], ZONE, 141 };
		{ BLUE..INDENT..AtlasTransLocale["Shattrath City"]..", ".._RED..AtlasTransLocale["Terokkar Forest"], ZONE, 3519 };
		{ BLUE..INDENT..AtlasTransLocale["Caverns of Time"]..", ".._RED..AtlasTransLocale["Tanaris"], ZONE, 440 };
		{ GREY.."1) "..AtlasTransLocale["Valiance Keep"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."2) "..AtlasTransLocale["Amber Ledge"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."3) "..AtlasTransLocale["Transitus Shield"]..", ".._RED..AtlasTransLocale["Coldarra"], ZONE, 3537 };
		{ GREY.."4) "..AtlasTransLocale["Fizzcrank Airstrip"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."5) "..AtlasTransLocale["Unu'pe"]..", ".._RED..AtlasTransLocale["Borean Tundra"], ZONE, 3537 };
		{ GREY.."6) "..AtlasTransLocale["Nesingwary Base Camp"]..", ".._RED..AtlasTransLocale["Sholazar Basin"], ZONE, 3711 };
		{ GREY.."7) "..AtlasTransLocale["River's Heart"]..", ".._RED..AtlasTransLocale["Sholazar Basin"], ZONE, 3711 };
		{ GREY.."8) "..AtlasTransLocale["Star's Rest"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."9) "..AtlasTransLocale["Moa'ki Harbor"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."10) "..AtlasTransLocale["Fordragon Keep"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."11) "..AtlasTransLocale["Wyrmrest Temple"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."12) "..AtlasTransLocale["Wintergarde Keep"]..", ".._RED..AtlasTransLocale["Dragonblight"], ZONE, 65 };
		{ GREY.."13) "..AtlasTransLocale["Westguard Keep"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."14) "..AtlasTransLocale["Kamagua"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."15) "..AtlasTransLocale["Valgarde"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."16) "..AtlasTransLocale["Fort Wildevar"]..", ".._RED..AtlasTransLocale["Howling Fjord"], ZONE, 495 };
		{ GREY.."17) "..AtlasTransLocale["Amberpine Lodge"]..", ".._RED..AtlasTransLocale["Grizzly Hills"], ZONE, 394 };
		{ GREY.."18) "..AtlasTransLocale["Westfall Brigade Encampment"]..", ".._RED..AtlasTransLocale["Grizzly Hills"], ZONE, 394 };
		{ GREY.."19) "..AtlasTransLocale["Gundrak"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."20) "..AtlasTransLocale["Zim'Torga"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."21) "..AtlasTransLocale["The Argent Stand"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."22) "..AtlasTransLocale["Light's Breach"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."23) "..AtlasTransLocale["Ebon Watch"]..", ".._RED..AtlasTransLocale["Zul'Drak"], ZONE, 66 };
		{ GREY.."24) "..AtlasTransLocale["Windrunner's Overlook"]..", ".._RED..AtlasTransLocale["Crystalsong Forest"], ZONE, 2817 };
		{ GREY.."25) "..AtlasTransLocale["Dalaran"]..", ".._RED..AtlasTransLocale["Crystalsong Forest"], ZONE, 2817 };
		{ GREY.."26) "..AtlasTransLocale["Frosthold"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."27) "..AtlasTransLocale["K3"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."28) "..AtlasTransLocale["Bouldercrag's Refuge"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."29) "..AtlasTransLocale["Ulduar"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."30) "..AtlasTransLocale["Dun Nifflelem"]..", ".._RED..AtlasTransLocale["The Storm Peaks"], ZONE, 67 };
		{ GREY.."31) "..AtlasTransLocale["The Argent Vanguard"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."32) "..AtlasTransLocale["Crusaders' Pinnacle"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."33) "..AtlasTransLocale["Argent Tournament Grounds"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."34) "..AtlasTransLocale["The Shadow Vault"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."35) "..AtlasTransLocale["Death's Rise"]..", ".._RED..AtlasTransLocale["Icecrown"], ZONE, 210 };
		{ GREY.."36) "..AtlasTransLocale["Valiance Landing Camp"]..", ".._RED..AtlasTransLocale["Wintergrasp"], ZONE, 4197 };
	};
};

Atlas_RegisterPlugin("Atlas_Transportation", myCategory, myData);
