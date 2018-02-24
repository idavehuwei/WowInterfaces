--------------------------------------------------------------------------
-- GTFO_Spells_Generic.lua 
--------------------------------------------------------------------------
--[[
GTFO Spell List - Generic List
Author: Zensunim of Malygos

Change Log:
	v0.2
		- Added Spells
	v1.0.1
		- Replaced some spell names with spell IDs
	v1.1
		- Replaced some spell names with spell IDs
	v1.2.2
		- Added Hellfire Effect	
	v2.1
		- Added Consecration (PvP)
	v2.2.3
		- Reduced memory footprint
	v2.5
		- Split spell files into sections
		- Added Starfall (PvP)
	v2.8.1
		- Replaced some spell names with spell IDs
		- Removed obsolete Consecration (PvP) spells
		- Added Shaman's Earthquake (PvP)
		- Added Shaman's Fire Nova (PvP)
		- Added Mage's Flame Orb (PvP)
		- Added Mage's Frostfire Orb (PvP)
		- Added Mage's Ring of Frost (PvP)
		- Added Death Knight's Desecration (PvP)
	v2.9.1
		- Added Rain of Fire (Generic)
		- Added Flame Patch (Generic)
	v3.0
		- Replaced all spell names with spell IDs
		- Reclassified generic spells to their specific encounters
	v3.2.6
		- Added Whirlwind (Generic)

Sample:
	GTFO.SpellID["12345"] = {
		--desc = "Ring of Frost (PvP)";
		sound = 2;
		tankSound = 0;
		trivialLevel = 80;
		alwaysAlert = true;
		applicationOnly = true;
		minimumStacks = 1;
		specificMobs = { 123, 234, 345 };
		test = true;
		vehicle = true;
	};
		
]]--

GTFO.SpellID["46264"] = {
	--desc = "Void Zone Effect (Generic - Unknown)";
	sound = 1;
};

GTFO.SpellID["49699"] = {
	--desc = "Consumption (Generic)";
	sound = 1;
};

GTFO.SpellID["39004"] = {
	--desc = "Consumption (Generic)";
	sound = 1;
};

GTFO.SpellID["30538"] = {
	--desc = "Consumption (Generic)";
	sound = 1;
};

GTFO.SpellID["30498"] = {
	--desc = "Consumption (Generic)";
	sound = 1;
};

GTFO.SpellID["35951"] = {
	--desc = "Consumption (Generic)";
	sound = 1;
};

-- Paladin
GTFO.SpellID["81297"] = {
	--desc = "Consecration (PvP)";
	sound = 2;
};

-- Mage
GTFO.SpellID["2120"] = {
	--desc = "Flamestrike (PvP)";
	sound = 2;
};

GTFO.SpellID["10"] = {
	--desc = "Blizzard (PvP)";
	sound = 2;
};

GTFO.SpellID["42208"] = {
	--desc = "Blizzard (PvP)";
	sound = 2;
};

GTFO.SpellID["82739"] = {
	--desc = "Flame Orb (PvP)";
	sound = 2;
};

GTFO.SpellID["84721"] = {
	--desc = "Frostfire Orb (PvP)";
	sound = 2;
};

GTFO.SpellID["82691"] = {
	--desc = "Ring of Frost (PvP)";
	sound = 3;
};

-- Warlock
GTFO.SpellID["5740"] = {
	--desc = "Rain of Fire (PvP)";
	sound = 2;
};

GTFO.SpellID["42223"] = {
	--desc = "Rain of Fire (PvP)";
	sound = 2;
};

GTFO.SpellID["5857"] = {
	--desc = "Hellfire Effect (PvP)";
	sound = 2;
	ignoreSelfInflicted = true;
};

-- Druid
GTFO.SpellID["50288"] = {
	--desc = "Starfall (PvP)";
	sound = 2;
};

GTFO.SpellID["16914"] = {
	--desc = "Hurricane (PvP)";
	sound = 2;
};

GTFO.SpellID["42231"] = {
	--desc = "Hurricane (PvP)";
	sound = 2;
};

-- Death Knight
GTFO.SpellID["43265"] = {
	--desc = "Death and Decay (PvP)";
	sound = 2;
};

GTFO.SpellID["52212"] = {
	--desc = "Death and Decay (PvP)";
	sound = 2;
};

GTFO.SpellID["68766"] = {
	--desc = "Desecration (PvP)";
	sound = 2;
};

-- Shaman
GTFO.SpellID["8187"] = {
	--desc = "Magma Totem (PvP)";
	sound = 2;
};

GTFO.SpellID["8349"] = {
	--desc = "Fire Nova (PvP)";
	sound = 2;
};

GTFO.SpellID["77478"] = {
	--desc = "Earthquake (PvP)";
	sound = 2;
};

GTFO.SpellID["20754"] = {
	--desc = "Rain of Fire (Generic)";
	sound = 2;
};

GTFO.SpellID["36808"] = {
	--desc = "Rain of Fire (Generic)";
	sound = 2;
};

GTFO.SpellID["76055"] = {
	--desc = "Flame Patch (Generic)";
	sound = 2;
};

GTFO.SpellID["33239"] = {
	--desc = "Whirlwind (Generic)";
	sound = 1;
	specificMobs = { 
		18831, -- High King Maulgar - Gruul's Lair
		46944, -- Hurp'Derp, Twilight Highlands
	};
};

