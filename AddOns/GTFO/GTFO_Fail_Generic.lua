--------------------------------------------------------------------------
-- GTFO_Fail_Generic.lua 
--------------------------------------------------------------------------
--[[
GTFO Fail List - Generic
Author: Zensunim of Malygos

Change Log:
	v2.5.1
		- Added Cleave (Dragon Bosses)
	v3.2
		- Added Cleave x2
	v3.2.1
		- Added Cleave x2

]]--

GTFO.SpellID["19983"] = {
	--desc = "Cleave (Dragon Bosses)";
	tankSound = 0;
	sound = 3;
};

GTFO.SpellID["15284"] = {
	--desc = "Cleave";
	tankSound = 0;
	sound = 3;
	specificMobs = { 
		28586, -- General Bjarngrim, HoL
		12017, -- Broodlord Lashlayer, BWL
		12129, -- Onyxian Warder, Onyxia's Lair
	};
	trivialLevel = 85;
};

GTFO.SpellID["15496"] = {
	--desc = "Cleave";
	tankSound = 0;
	sound = 3;
	specificMobs = { 
		20923, -- Blood Guard Porung, SH
		7267, -- Chief Ukorz Sandscalp, ZF
		3975, -- Herod, SM
	};
	trivialLevel = 80;
};

GTFO.SpellID["40504"] = {
	--desc = "Cleave";
	tankSound = 0;
	sound = 3;
	specificMobs = { 
		17881, -- Aeonus, BM
		15511, -- Lord Kri, AQ40
		17942, -- Quagmirran, Slave Pens
		37022, -- Blighted Abomination, ICC
	};
	trivialLevel = 85;
};

GTFO.SpellID["40505"] = {
	--desc = "Cleave";
	tankSound = 0;
	sound = 3;
	specificMobs = { 
		37534, -- Spinestalker, ICC
		37069, -- Lumbering Abomination, HoR
	};
	trivialLevel = 85;
};

GTFO.SpellID["42724"] = {
	--desc = "Cleave";
	tankSound = 0;
	sound = 3;
	specificMobs = { 
		23954, -- Ingvar the Plunderer, Utgarde Keep
	};
	trivialLevel = 85;
};
