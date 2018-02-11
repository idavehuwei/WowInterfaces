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

local myCategory = AtlasORLocale["Outdoor Raid Encounters"];

local myData = {
	Azuregos = {
		ZoneName = { AtlasORLocale["Azuregos"], NPC, 6109 };
		Location = { AtlasORLocale["Azshara"], ZONE, 16 };
		LevelRange = "60+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Azuregos"], NPC, 6109 };
	};
	FourDragons = {
		ZoneName = { AtlasORLocale["Dragons of Nightmare"] };
		Location = { AtlasORLocale["Various"] };
		LevelRange = "60+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Twilight Grove"]..", ".._RED..AtlasORLocale["Duskwood"], ZONE, 10 };
		{ GREY.."2) "..AtlasORLocale["Seradane"]..", ".._RED..AtlasORLocale["The Hinterlands"], ZONE, 47 };
		{ GREY..INDENT..AtlasORLocale["Rothos"], NPC, 5718 };
		{ GREY..INDENT..AtlasORLocale["Dreamtracker"], NPC, 12496 };
		{ GREY.."3) "..AtlasORLocale["Dream Bough"]..", ".._RED..AtlasORLocale["Feralas"], ZONE, 357 };
		{ GREY..INDENT..AtlasORLocale["Lethlas"], NPC, 5312 };
		{ GREY..INDENT..AtlasORLocale["Dreamroarer"], NPC, 12497 };
		{ GREY.."4) "..AtlasORLocale["Bough Shadow"]..", ".._RED..AtlasORLocale["Ashenvale"], ZONE, 331 };
		{ GREY..INDENT..AtlasORLocale["Phantim"], NPC, 5314 };
		{ GREY..INDENT..AtlasORLocale["Dreamstalker"], NPC, 12498 };
		{ "" };
		{ GREN..AtlasORLocale["The Dragons"] };
		{ GREY..INDENT..AtlasORLocale["Lethon"], NPC, 14888 };
		{ GREY..INDENT..AtlasORLocale["Emeriss"], NPC, 14889 };
		{ GREY..INDENT..AtlasORLocale["Taerar"], NPC, 14890 };
		{ GREY..INDENT..AtlasORLocale["Ysondre"], NPC, 14887 };
	};
	HighlordKruul = {
		ZoneName = { AtlasORLocale["Highlord Kruul"], NPC, 18338 };
		Location = { AtlasORLocale["Blasted Lands"], ZONE, 4 };
		LevelRange = "60+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Highlord Kruul"], NPC, 18338 };
		{ GREY.."2) "..AtlasORLocale["Nethergarde Keep"] };
	};
	DoomLordKazzak = {
		ZoneName = { AtlasORLocale["Doom Lord Kazzak"], NPC, 18728 };
		Location = { AtlasORLocale["Hellfire Peninsula"], ZONE, 3483 };
		LevelRange = "70+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Doom Lord Kazzak"], NPC, 18728 };
		{ GREY.."2) "..AtlasORLocale["Invasion Point: Annihilator"] };
		{ GREY.."3) "..AtlasORLocale["Forge Camp: Rage"] };
		{ GREY.."4) "..AtlasORLocale["Forge Camp: Mageddon"] };
		{ GREY.."5) "..AtlasORLocale["Thrallmar"] };
	};
	Doomwalker = {
		ZoneName = { AtlasORLocale["Doomwalker"], NPC, 17711 };
		Location = { AtlasORLocale["Shadowmoon Valley"], ZONE, 3520 };
		LevelRange = "70+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Doomwalker"], NPC, 17711 };
	};
	Skettis = {
		ZoneName = { AtlasORLocale["Skettis"] };
		Location = { AtlasORLocale["Blackwind Valley"]..", "..AtlasORLocale["Terokkar Forest"], ZONE, 3519 };
		LevelRange = "70+";
		MinLevel = "--";
		PlayerLimit = "40";
		{ GREY.."1) "..AtlasORLocale["Blackwind Landing"] };
		{ GREY..INDENT..AtlasORLocale["Sky Commander Adaris"], NPC, 23038 };
		{ GREY..INDENT..AtlasORLocale["Sky Sergeant Doryn"], NPC, 23048 };
		{ GREY..INDENT..AtlasORLocale["Skyguard Handler Deesak"], NPC, 23415 };
		{ GREY..INDENT..AtlasORLocale["Severin <Skyguard Medic>"], NPC, 23042 };
		{ GREY..INDENT..AtlasORLocale["Grella <Skyguard Quartermaster>"], NPC, 23367 };
		{ GREY..INDENT..AtlasORLocale["Hazzik"], NPC, 23306 };
		{ GREY.."2) "..AtlasORLocale["Ancient Skull Pile"], OBJECT, 185928 };
		{ GREY..INDENT..AtlasORLocale["Terokk"].." ("..AtlasORLocale["Summon"]..")", NPC, 21838 };
		{ GREY.."3) "..AtlasORLocale["Sahaak <Keeper of Scrolls>"], NPC, 23363 };
		{ GREY.."4) "..AtlasORLocale["Skyguard Prisoner"].." ("..AtlasORLocale["Random"]..")", NPC, 23383 };
		{ GREY.."5) "..AtlasORLocale["Talonpriest Ishaal"], NPC, 23066 };
		{ GREY.."6) "..AtlasORLocale["Talonpriest Skizzik"], NPC, 23067 };
		{ GREY.."7) "..AtlasORLocale["Talonpriest Zellek"], NPC, 23068 };
		{ GREY.."8) "..AtlasORLocale["Hazzik's Package"], OBJECT, 185954 };
		{ GREY.."9) "..AtlasORLocale["Graveyard"] };
		{ GREN.."1') "..AtlasORLocale["Skull Pile"], OBJECT, 185913 };
		{ GREN..INDENT..AtlasORLocale["Darkscreecher Akkarai"].." ("..AtlasORLocale["Summon"]..")", NPC, 23161 };
		{ GREN..INDENT..AtlasORLocale["Gezzarak the Huntress"].." ("..AtlasORLocale["Summon"]..")", NPC, 23163 };
		{ GREN..INDENT..AtlasORLocale["Karrog"].." ("..AtlasORLocale["Summon"]..")", NPC, 23165 };
		{ GREN..INDENT..AtlasORLocale["Vakkiz the Windrager"].." ("..AtlasORLocale["Summon"]..")", NPC, 23162 };
	};
};

Atlas_RegisterPlugin("Atlas_OutdoorRaids", myCategory, myData);
