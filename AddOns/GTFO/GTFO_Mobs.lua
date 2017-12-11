--------------------------------------------------------------------------
-- GTFO_Mobs.lua 
--------------------------------------------------------------------------
--[[
GTFO Mob List
Author: Zensunim of Malygos

Change Log:
	v2.2
		- Added Mob List
		- Added Deathbringer Saurfang's Blood Beast
		- Added Lady Deathwhisper's Vengeful Shades
	v2.2.3
		- Reduced memory footprint
	v3.2
		- Added Sethekk Spirit
	v3.2.1
		- Added Zombie Chow
	v3.2.3
		- Added Walking Bomb
		
Sample:

GTFO.MobID["12345"] = {
	--desc = "Mob Name - Boss - Instance";
	sound = 1;
	tankSound = 1;
	damageOnly = true;
};

]]--

GTFO.MobID["38508"] = {
	--desc = "Blood Beast - Valithria Dreamwalker - ICC";
	sound = 1;
};

GTFO.MobID["38222"] = {
	--desc = "Vengeful Shade - Lady Deathwhisper - ICC";
	sound = 3;
};

GTFO.MobID["18703"] = {
	--desc = "Sethekk Spirit - Sethekk Halls";
	sound = 1;
	tankSound = 0;
	trivialLevel = 80;
};

GTFO.MobID["16360"] = {
	--desc = "Zombie Chow - Naxx";
	sound = 1;
	tankSound = 2;
	trivialLevel = 85;
};

GTFO.MobID["7915"] = {
	--desc = "Walking Bomb - Gnomeregan";
	sound = 3;
	tankSound = 2;
	trivialLevel = 50;
};
