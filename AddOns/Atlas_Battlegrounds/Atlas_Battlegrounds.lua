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

local myCategory = AtlasBGLocale["Battleground Maps"];

local myData = {
	AlteracValleyNorth = {
		ZoneName = { AtlasBGLocale["Alterac Valley"].." ("..AtlasBGLocale["North"]..", "..AtlasBGLocale["Alliance"]..")", 2597 };
		Acronym = AtlasBGLocale["AV"];
		Location = { AtlasBGLocale["Alterac Mountains"], 36 };
		LevelRange = "51-80";
		MinLevel = "51";
		PlayerLimit = "40";
		Continent = AtlasBGLocale["Eastern Kingdoms"];
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["Stormpike Guard"], FACTION, 730 };
		{ BLUE.."A) "..AtlasBGLocale["Entrance"] };
		{ BLUE.."B) "..AtlasBGLocale["Dun Baldar"] };
		{ BLUE..INDENT..AtlasBGLocale["Vanndar Stormpike <Stormpike General>"], NPC, 11948 };
		{ BLUE..INDENT..AtlasBGLocale["Dun Baldar North Marshal"], NPC, 14762 };
		{ BLUE..INDENT..AtlasBGLocale["Dun Baldar South Marshal"], NPC, 14763 };
		{ BLUE..INDENT..AtlasBGLocale["Icewing Marshal"], NPC, 14764 };
		{ BLUE..INDENT..AtlasBGLocale["Stonehearth Marshal"], NPC, 14765 };
		{ BLUE..INDENT..AtlasBGLocale["Prospector Stonehewer"], NPC, 13816 };
		{ _RED.."1) "..AtlasBGLocale["Irondeep Mine"] };
		{ GREY..INDENT..AtlasBGLocale["Morloch"].." ("..AtlasBGLocale["Neutral"]..")", NPC, 11657 };
		{ GREY..INDENT..AtlasBGLocale["Umi Thorson"], NPC, 13078 };
		{ GREY..INDENT..AtlasBGLocale["Keetar"].." ("..AtlasBGLocale["Horde"]..")", NPC, 13079 };
		{ GREY.."2) "..AtlasBGLocale["Arch Druid Renferal"], NPC, 13442 };
		{ ORNG.."3) "..AtlasBGLocale["Dun Baldar North Bunker"] };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Mulverick"].." ("..AtlasBGLocale["Horde"]..")", NPC, 13181 };
		{ GREY.."4) "..AtlasBGLocale["Murgot Deepforge"], NPC, 13257 };
		{ GREY..INDENT..AtlasBGLocale["Dirk Swindle <Bounty Hunter>"], NPC, 14188 };
		{ GREY..INDENT..AtlasBGLocale["Athramanis <Bounty Hunter>"], NPC, 14187 };
		{ GREY..INDENT..AtlasBGLocale["Lana Thunderbrew <Blacksmithing Supplies>"], NPC, 4257 };
		{ _RED.."5) "..AtlasBGLocale["Stormpike Aid Station"] };
		{ GREY.."6) "..AtlasBGLocale["Stormpike Stable Master <Stable Master>"], NPC, 13617 };
		{ GREY..INDENT..AtlasBGLocale["Stormpike Ram Rider Commander"], NPC, 13577 };
		{ GREY..INDENT..AtlasBGLocale["Svalbrad Farmountain <Trade Goods>"], NPC, 5135 };
		{ GREY..INDENT..AtlasBGLocale["Kurdrum Barleybeard <Reagents & Poison Supplies>"], NPC, 5139 };
		{ GREY.."7) "..AtlasBGLocale["Stormpike Quartermaster"], NPC, 12096 };
		{ GREY..INDENT..AtlasBGLocale["Jonivera Farmountain <General Goods>"], NPC, 5134 };
		{ GREY..INDENT..AtlasBGLocale["Brogus Thunderbrew <Food & Drink>"], NPC, 4255 };
		{ GREY.."8) "..AtlasBGLocale["Wing Commander Ichman"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13437 };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Slidore"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13438 };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Vipore"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13439 };
		{ ORNG.."9) "..AtlasBGLocale["Dun Baldar South Bunker"] };
		{ GREY..INDENT..AtlasBGLocale["Corporal Noreg Stormpike"], NPC, 13447 };
		{ GREY..INDENT..AtlasBGLocale["Gaelden Hammersmith <Stormpike Supply Officer>"], NPC, 13216 };
		{ _RED.."10) "..AtlasBGLocale["Stormpike Graveyard"] };
		{ GREY.."11) "..AtlasBGLocale["Icewing Cavern"] };
		{ GREY..INDENT..AtlasBGLocale["Stormpike Banner"], OBJECT, 179024 };
		{ GREY.."12) "..AtlasBGLocale["Stormpike Lumber Yard"] };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Jeztor"].." ("..AtlasBGLocale["Horde"]..")", NPC, 13180 };
		{ ORNG.."13) "..AtlasBGLocale["Icewing Bunker"] };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Guse"].." ("..AtlasBGLocale["Horde"]..")", NPC, 13179 };
		{ _RED.."14) "..AtlasBGLocale["Stonehearth Graveyard"] };
		{ GREY.."15) "..AtlasBGLocale["Stormpike Ram Rider Commander"], NPC, 13577 };
		{ ORNG.."16) "..AtlasBGLocale["Stonehearth Outpost"] };
		{ GREY..INDENT..AtlasBGLocale["Captain Balinda Stonehearth <Stormpike Captain>"], NPC, 11949 };
		{ _RED.."17) "..AtlasBGLocale["Snowfall Graveyard"] };
		{ GREY..INDENT..AtlasBGLocale["Ichman's Beacon"], ITEM, 17505 };
		{ GREY..INDENT..AtlasBGLocale["Mulverick's Beacon"].." ("..AtlasBGLocale["Horde"]..")", ITEM, 17323 };
		{ ORNG.."18) "..AtlasBGLocale["Stonehearth Bunker"] };
		{ GREY.."19) "..AtlasBGLocale["Ivus the Forest Lord"].." ("..AtlasBGLocale["Summon"]..")", NPC, 13419 };
		{ GREY.."20) "..AtlasBGLocale["Western Crater"] };
		{ GREY..INDENT..AtlasBGLocale["Vipore's Beacon"], ITEM, 17506 };
		{ GREY..INDENT..AtlasBGLocale["Jeztor's Beacon"].." ("..AtlasBGLocale["Horde"]..")", ITEM, 17325 };
		{ GREY.."21) "..AtlasBGLocale["Eastern Crater"] };
		{ GREY..INDENT..AtlasBGLocale["Slidore's Beacon"], ITEM, 17507 };
		{ GREY..INDENT..AtlasBGLocale["Guse's Beacon"].." ("..AtlasBGLocale["Horde"]..")", ITEM, 17324 };
		{ "" };
		{ _RED..AtlasBGLocale["Red"]..": "..BLUE..AtlasBGLocale["Graveyards, Capturable Areas"] };
		{ ORNG..AtlasBGLocale["Orange"]..": "..BLUE..AtlasBGLocale["Bunkers, Towers, Destroyable Areas"] };
		{ GREY..AtlasBGLocale["White"]..": "..BLUE..AtlasBGLocale["Assault NPCs, Quest Areas"] };
	};
	AlteracValleySouth = {
		ZoneName = { AtlasBGLocale["Alterac Valley"].." ("..AtlasBGLocale["South"]..", "..AtlasBGLocale["Horde"]..")", 2597 };
		Acronym = AtlasBGLocale["AV"];
		Location = { AtlasBGLocale["Hillsbrad Foothills"], 36 };
		LevelRange = "51-80";
		MinLevel = "51";
		PlayerLimit = "40";
		Continent = AtlasBGLocale["Eastern Kingdoms"];
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["Frostwolf Clan"], FACTION, 729 };
		{ BLUE.."A) "..AtlasBGLocale["Entrance"].." ("..AtlasBGLocale["Horde"]..")" };
		{ BLUE.."B) "..AtlasBGLocale["Frostwolf Keep"] };
		{ BLUE..INDENT..AtlasBGLocale["Drek'Thar <Frostwolf General>"], NPC, 11946 };
		{ BLUE..INDENT..AtlasBGLocale["Duros"], NPC, 12122 };
		{ BLUE..INDENT..AtlasBGLocale["Drakan"], NPC, 12121 };
		{ BLUE..INDENT..AtlasBGLocale["West Frostwolf Warmaster"], NPC, 14777 };
		{ BLUE..INDENT..AtlasBGLocale["East Frostwolf Warmaster"], NPC, 14772 };
		{ BLUE..INDENT..AtlasBGLocale["Tower Point Warmaster"], NPC, 14776 };
		{ BLUE..INDENT..AtlasBGLocale["Iceblood Warmaster"], NPC, 14773 };
		{ _RED.."1) "..AtlasBGLocale["Lokholar the Ice Lord"].." ("..AtlasBGLocale["Summon"]..")", NPC, 13256 };
		{ ORNG.."2) "..AtlasBGLocale["Iceblood Garrison"] };
		{ GREY..INDENT..AtlasBGLocale["Captain Galvangar <Frostwolf Captain>"], NPC, 11947 };
		{ ORNG.."3) "..AtlasBGLocale["Iceblood Tower"] };
		{ _RED.."4) "..AtlasBGLocale["Iceblood Graveyard"] };
		{ ORNG.."5) "..AtlasBGLocale["Tower Point"] };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Slidore"].." ("..AtlasBGLocale["Alliance"]..")", NPC, 13438 };
		{ _RED.."6) "..AtlasBGLocale["Coldtooth Mine"] };
		{ GREY..INDENT..AtlasBGLocale["Taskmaster Snivvle"].." ("..AtlasBGLocale["Neutral"]..")", NPC, 11677 };
		{ GREY..INDENT..AtlasBGLocale["Masha Swiftcut"], NPC, 13088 };
		{ GREY..INDENT..AtlasBGLocale["Aggi Rumblestomp"].." ("..AtlasBGLocale["Alliance"]..")", NPC, 13086 };
		{ _RED.."7) "..AtlasBGLocale["Frostwolf Graveyard"] };
		{ GREY.."8) "..AtlasBGLocale["Wing Commander Vipore"].." ("..AtlasBGLocale["Alliance"]..")", NPC, 13439 };
		{ GREY..INDENT..AtlasBGLocale["Jotek"], NPC, 13798 };
		{ GREY..INDENT..AtlasBGLocale["Smith Regzar"], NPC, 13176 };
		{ GREY..INDENT..AtlasBGLocale["Primalist Thurloga"], NPC, 13236 };
		{ GREY..INDENT..AtlasBGLocale["Sergeant Yazra Bloodsnarl"], NPC, 13448 };
		{ GREY.."9) "..AtlasBGLocale["Frostwolf Stable Master <Stable Master>"], NPC, 13616 };
		{ GREY..INDENT..AtlasBGLocale["Frostwolf Wolf Rider Commander"], NPC, 13441 };
		{ GREY.."10) "..AtlasBGLocale["Frostwolf Quartermaster"], NPC, 12097 };
		{ ORNG.."11) "..AtlasBGLocale["West Frostwolf Tower"] };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Ichman"].." ("..AtlasBGLocale["Alliance"]..")", NPC, 13437 };
		{ ORNG.."12) "..AtlasBGLocale["East Frostwolf Tower"] };
		{ GREY.."13) "..AtlasBGLocale["Wing Commander Guse"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13179 };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Jeztor"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13180 };
		{ GREY..INDENT..AtlasBGLocale["Wing Commander Mulverick"].." ("..AtlasBGLocale["Rescued"]..")", NPC, 13181 };
		{ _RED.."14) "..AtlasBGLocale["Frostwolf Relief Hut"] };
		{ GREY.."15) "..AtlasBGLocale["Wildpaw Cavern"] };
		{ GREY..INDENT..AtlasBGLocale["Frostwolf Banner"], OBJECT, 179025 };
		{ "" };
		{ _RED..AtlasBGLocale["Red"]..": "..BLUE..AtlasBGLocale["Graveyards, Capturable Areas"] };
		{ ORNG..AtlasBGLocale["Orange"]..": "..BLUE..AtlasBGLocale["Bunkers, Towers, Destroyable Areas"] };
		{ GREY..AtlasBGLocale["White"]..": "..BLUE..AtlasBGLocale["Assault NPCs, Quest Areas"] };
	};
	ArathiBasin = {
		ZoneName = { AtlasBGLocale["Arathi Basin"], 3358 };
		Acronym = AtlasBGLocale["AB"];
		Location = { AtlasBGLocale["Arathi Highlands"], 45 };
		LevelRange = "20-80";
		MinLevel = "20";
		PlayerLimit = "15";
		Continent = AtlasBGLocale["Eastern Kingdoms"];
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["The Defilers"].." ("..AtlasBGLocale["Horde"]..")", FACTION, 510 };
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["The League of Arathor"].." ("..AtlasBGLocale["Alliance"]..")", FACTION, 509 };
		{ BLUE.."A) "..AtlasBGLocale["Trollbane Hall"].." ("..AtlasBGLocale["Alliance"]..")" };
		{ BLUE.."B) "..AtlasBGLocale["Defiler's Den"].." ("..AtlasBGLocale["Horde"]..")" };
		{ GREY.."1) "..AtlasBGLocale["Stables"] };
		{ GREY.."2) "..AtlasBGLocale["Gold Mine"] };
		{ GREY.."3) "..AtlasBGLocale["Smithy"] };
		{ GREY.."4) "..AtlasBGLocale["Lumber Mill"] };
		{ GREY.."5) "..AtlasBGLocale["Farm"] };
	};
	WarsongGulch = {
		ZoneName = { AtlasBGLocale["Warsong Gulch"], 3277 };
		Acronym = AtlasBGLocale["WSG"];
		Location = { AtlasBGLocale["Ashenvale"].." / "..AtlasBGLocale["The Barrens"], 331, 17 };
		LevelRange = "10-80";
		MinLevel = "10";
		PlayerLimit = "10";
		Continent = AtlasBGLocale["Kalimdor"];
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["Warsong Outriders"].." ("..AtlasBGLocale["Horde"]..")", FACTION, 889 };
		{ ORNG..AtlasBGLocale["Reputation"]..": "..AtlasBGLocale["Silverwing Sentinels"].." ("..AtlasBGLocale["Alliance"]..")", FACTION, 890 };
		{ BLUE.."A) "..AtlasBGLocale["Silverwing Hold"].." ("..AtlasBGLocale["Alliance"]..")" };
		{ BLUE.."B) "..AtlasBGLocale["Warsong Lumber Mill"].." ("..AtlasBGLocale["Horde"]..")" };
	};
	EyeOfTheStorm = {
		ZoneName = { AtlasBGLocale["Eye of the Storm"], 3820 };
		Acronym = AtlasBGLocale["EotS"];
		Location = { AtlasBGLocale["Netherstorm"], 3523 };
		LevelRange = "61-80";
		MinLevel = "61";
		PlayerLimit = "15";
		Continent = AtlasBGLocale["Outland"];
		{ BLUE.."A) "..AtlasBGLocale["Entrance"].." ("..AtlasBGLocale["Alliance"]..")" };
		{ BLUE.."B) "..AtlasBGLocale["Entrance"].." ("..AtlasBGLocale["Horde"]..")" };
		{ _RED.."X) "..AtlasBGLocale["Graveyard"] };
		{ ORNG.."X) "..AtlasBGLocale["Flag"] };
		{ GREY.."1) "..AtlasBGLocale["Mage Tower"] };
		{ GREY.."2) "..AtlasBGLocale["Draenei Ruins"] };
		{ GREY.."3) "..AtlasBGLocale["Fel Reaver Ruins"] };
		{ GREY.."4) "..AtlasBGLocale["Blood Elf Tower"] };
	};
	StrandOfTheAncients = {
		ZoneName = { AtlasBGLocale["Strand of the Ancients"], 4384 };
		Acronym = AtlasBGLocale["SotA"];
		Location = { AtlasBGLocale["Dragonblight"], 65 };
		LevelRange = "71-80";
		MinLevel = "71";
		PlayerLimit = "15";
		Continent = AtlasBGLocale["Northrend"];
		{ ORNG..AtlasBGLocale["Gates are marked with their colors."] };
		{ BLUE.."A) "..AtlasBGLocale["Start"].." ("..AtlasBGLocale["Attacking Team"]..")" };
		{ BLUE.."B) "..AtlasBGLocale["Start"].." ("..AtlasBGLocale["Defending Team"]..")" };
		{ GREY.."1) "..AtlasBGLocale["Massive Seaforium Charge"], NPC, 21848 };
		{ GREY.."2) "..AtlasBGLocale["Battleground Demolisher"], NPC, 28781 };
		{ GREY.."3) "..AtlasBGLocale["Resurrection Point"] };
		{ GREY.."4) "..AtlasBGLocale["Graveyard Flag"] };
		{ GREY.."5) "..AtlasBGLocale["Titan Relic"], OBJECT, 192829 };
	};
};

Atlas_RegisterPlugin("Atlas_Battlegrounds", myCategory, myData);
