--[[

************************************************************************

ARL-Mob.lua

Monster data for all of Ackis Recipe List

************************************************************************

File date: 2009-07-29T07:23:13Z 
File revision: 2259 
Project revision: 2271
Project version: r2271

************************************************************************

Format:

	self:addLookupList(MobDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)
	the "Faction" parameter isn't used in this specific database
	
************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

]]--

local MODNAME		= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZONE		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()
local BBOSS		= LibStub("LibBabble-Boss-3.0"):GetLookupTable()

function addon:InitMob(MobDB)

-- Zones
	-- Alterac Mountains
	self:addLookupList(MobDB,2242,L["Syndicate Spy"],BZONE["Alterac Mountains"],63.0,40.6)
	self:addLookupList(MobDB,2246,L["Syndicate Assassin"],BZONE["Alterac Mountains"],40.6,16.8)
	-- Arathi Highlands
	self:addLookupList(MobDB,2556,L["Witherbark Headhunter"],BZONE["Arathi Highlands"],70.5,70.4)
	self:addLookupList(MobDB,2557,L["Witherbark Shadow Hunter"],BZONE["Arathi Highlands"],70.3,78.9)
	self:addLookupList(MobDB,2558,L["Witherbark Berserker"],BZONE["Arathi Highlands"],24.2,66.2)
	self:addLookupList(MobDB,2606,L["Nimar the Slayer"],BZONE["Arathi Highlands"],66.6,64.0)
	self:addLookupList(MobDB,2636,L["Blackwater Deckhand"],BZONE["Arathi Highlands"],33.0,81.3)
	-- Ashenvale
	self:addLookupList(MobDB,3834,L["Crazed Ancient"],BZONE["Ashenvale"],59.4,43.0)
	self:addLookupList(MobDB,3919,L["Withered Ancient"],BZONE["Ashenvale"],58.5,36.1)
	-- Azshara
	self:addLookupList(MobDB,6138,L["Arkkoran Oracle"],BZONE["Azshara"],78.0,41.8)
	self:addLookupList(MobDB,6144,L["Son of Arkkoroc"],BZONE["Azshara"],65.5,54.4)
	self:addLookupList(MobDB,6146,L["Cliff Breaker"],BZONE["Azshara"],66.0,13.2)
	self:addLookupList(MobDB,6201,L["Legashi Rogue"],BZONE["Azshara"],50.1,19.6)
	-- Blade's Edge Mountains
	self:addLookupList(MobDB,16952,L["Anger Guard"],BZONE["Blade's Edge Mountains"],72.0,40.5)
	self:addLookupList(MobDB,19952,L["Bloodmaul Geomancer"],BZONE["Blade's Edge Mountains"],45.0,68.5)
	self:addLookupList(MobDB,19960,L["Doomforge Engineer"],BZONE["Blade's Edge Mountains"],75.1,39.8)
	self:addLookupList(MobDB,19973,L["Abyssal Flamebringer"],BZONE["Blade's Edge Mountains"],30.0,81.0)
	self:addLookupList(MobDB,19984,L["Vekh'nir Dreadhawk"],BZONE["Blade's Edge Mountains"],78.0,74.3)
	self:addLookupList(MobDB,22242,L["Bash'ir Spell-Thief"],BZONE["Blade's Edge Mountains"],51.0,16.5)
	self:addLookupList(MobDB,23385,L["Simon Unit"],BZONE["Blade's Edge Mountains"],33.5,51.5)
	self:addLookupList(MobDB,23386,L["Gan'arg Analyzer"],BZONE["Blade's Edge Mountains"],33.0,52.5)
	-- Blasted Lands
	self:addLookupList(MobDB,5981,L["Portal Seeker"],BZONE["Blasted Lands"],51.1,34.0)
	self:addLookupList(MobDB,6005,L["Shadowsworn Thug"],BZONE["Blasted Lands"],63.8,32.0)
	-- Burning Steppes
	self:addLookupList(MobDB,7025,L["Blackrock Soldier"],BZONE["Burning Steppes"],44.0,52.8)
	self:addLookupList(MobDB,7027,L["Blackrock Slayer"],BZONE["Burning Steppes"],44.4,50.7)
	self:addLookupList(MobDB,7029,L["Blackrock Battlemaster"],BZONE["Burning Steppes"],40.5,35.8)
	self:addLookupList(MobDB,7035,L["Firegut Brute"],BZONE["Burning Steppes"],82.5,48.1)
	self:addLookupList(MobDB,7037,L["Thaurissan Firewalker"],BZONE["Burning Steppes"],61.1,42.0)
	self:addLookupList(MobDB,10119,L["Volchan"],BZONE["Burning Steppes"],73.0,49.3)
	-- Darkshore
	self:addLookupList(MobDB,2337,L["Dark Strand Voidcaller"],BZONE["Darkshore"],56.2,26.0)
	-- Deadwind Pass
	self:addLookupList(MobDB,7372,L["Deadwind Warlock"],BZONE["Deadwind Pass"],59.8,74.4)
	-- Dragonblight
	self:addLookupList(MobDB,27333,L["Onslaught Mason"],BZONE["Dragonblight"],85.8,36.0)
	-- Duskwood
	self:addLookupList(MobDB,910,L["Defias Enchanter"],BZONE["Duskwood"],49.5,75.6)
	-- Dustwallow Marsh
	self:addLookupList(MobDB,4364,L["Strashaz Warrior"],BZONE["Dustwallow Marsh"],76.5,22.3)
	self:addLookupList(MobDB,4366,L["Strashaz Serpent Guard"],BZONE["Dustwallow Marsh"],74.1,18.2)
	self:addLookupList(MobDB,4368,L["Strashaz Myrmidon"],BZONE["Dustwallow Marsh"],75.1,14.2)
	self:addLookupList(MobDB,4834,L["Theramore Infiltrator"],BZONE["Dustwallow Marsh"],44.0,27.3)
	self:addLookupList(MobDB,16072,L["Tidelord Rrurgaz"],BZONE["Dustwallow Marsh"],76.7,19.5)
	-- Eastern Plaguelands
	self:addLookupList(MobDB,8546,L["Dark Adept"],BZONE["Eastern Plaguelands"],65.8,37.9)
	self:addLookupList(MobDB,8550,L["Shadowmage"],BZONE["Eastern Plaguelands"],78.5,35.3)
	self:addLookupList(MobDB,8561,L["Mossflayer Shadowhunter"],BZONE["Eastern Plaguelands"],60.9,21.5)
	self:addLookupList(MobDB,9451,L["Scarlet Archmage"],BZONE["Eastern Plaguelands"],81.5,75.4)
	-- Grizzly Hills
	self:addLookupList(MobDB,26270,L["Iron Rune-Shaper"],BZONE["Grizzly Hills"],67.8,16.3)
	self:addLookupList(MobDB,26679,L["Silverbrook Trapper"],BZONE["Grizzly Hills"],27.3,33.9)
	self:addLookupList(MobDB,26708,L["Silverbrook Villager"],BZONE["Grizzly Hills"],27.3,33.9)
	self:addLookupList(MobDB,27546,L["Silverbrook Hunter"],BZONE["Grizzly Hills"],37.5,68.0)
	self:addLookupList(MobDB,27676,L["Silverbrook Defender"],BZONE["Grizzly Hills"],24.6,33.3)
	-- Hillsbrad Foothills
	self:addLookupList(MobDB,2434,L["Shadowy Assassin"],BZONE["Hillsbrad Foothills"],52.7,52.8)
	-- Icecrown
	self:addLookupList(MobDB,30921,L["Skeletal Runesmith"],BZONE["Icecrown"],60.0,73.1)
	self:addLookupList(MobDB,31702,L["Frostbrood Spawn"],BZONE["Icecrown"],75.3,43.4)
	self:addLookupList(MobDB,32289,L["Damned Apothecary"],BZONE["Icecrown"],49.8,32.7)
	self:addLookupList(MobDB,32290,L["Cult Alchemist"],BZONE["Icecrown"],49.5,33.1)
	self:addLookupList(MobDB,32297,L["Cult Researcher"],BZONE["Icecrown"],50.7,30.9)
	self:addLookupList(MobDB,32349,L["Cultist Shard Watcher"],BZONE["Icecrown"],48.1,67.9)
	-- Felwood
	self:addLookupList(MobDB,7106,L["Jadefire Rogue"],BZONE["Felwood"],37.5,66.5)
	self:addLookupList(MobDB,7158,L["Deadwood Shaman"],BZONE["Felwood"],62.5,10.3)
	self:addLookupList(MobDB,7441,L["Winterfall Totemic"],BZONE["Felwood"],41.5,42.7)
	-- Hillsbrad Foothills
	self:addLookupList(MobDB,2264,L["Hillsbrad Tailor"],BZONE["Hillsbrad Foothills"],36.6,44.4)
	self:addLookupList(MobDB,2374,L["Torn Fin Muckdweller"],BZONE["Hillsbrad Foothills"],31.5,72.1)
	self:addLookupList(MobDB,2375,L["Torn Fin Coastrunner"],BZONE["Hillsbrad Foothills"],25.1,70.5)
	self:addLookupList(MobDB,2376,L["Torn Fin Oracle"],BZONE["Hillsbrad Foothills"],42.0,68.0)
	self:addLookupList(MobDB,2377,L["Torn Fin Tidehunter"],BZONE["Hillsbrad Foothills"],39.0,69.0)
	self:addLookupList(MobDB,14276,L["Scargil"],BZONE["Hillsbrad Foothills"],26.6,71.2)
	-- Nagrand
	self:addLookupList(MobDB,17136,L["Boulderfist Warrior"],BZONE["Nagrand"],51.0,57.0)
	self:addLookupList(MobDB,17150,L["Vir'aani Arcanist"],BZONE["Nagrand"],40.5,69.6)
	self:addLookupList(MobDB,18203,L["Murkblood Raider"],BZONE["Nagrand"],31.5,43.5)
	-- Netherstorm
	self:addLookupList(MobDB,18853,L["Sunfury Bloodwarder"],BZONE["Netherstorm"],27.0,72.0)
	self:addLookupList(MobDB,18866,L["Mageslayer"],BZONE["Netherstorm"],55.5,85.5)
	self:addLookupList(MobDB,18870,L["Voidshrieker"],BZONE["Netherstorm"],60.0,39.0)
	self:addLookupList(MobDB,18872,L["Disembodied Vindicator"],BZONE["Netherstorm"],36.0,55.5)
	self:addLookupList(MobDB,18873,L["Disembodied Protector"],BZONE["Netherstorm"],31.8,52.7)
	self:addLookupList(MobDB,19707,L["Sunfury Archer"],BZONE["Netherstorm"],55.5,81.0)
	self:addLookupList(MobDB,22822,L["Ethereum Nullifier"],BZONE["Netherstorm"],66.0,49.5)
	self:addLookupList(MobDB,20134,L["Sunfury Arcanist"],BZONE["Netherstorm"],51.0,82.5)
	self:addLookupList(MobDB,20135,L["Sunfury Arch Mage"],BZONE["Netherstorm"],46.5,81.0)
	self:addLookupList(MobDB,20136,L["Sunfury Researcher"],BZONE["Netherstorm"],48.2,82.5)
	self:addLookupList(MobDB,20207,L["Sunfury Bowman"],BZONE["Netherstorm"],61.5,67.5)
	self:addLookupList(MobDB,23008,L["Ethereum Jailor"],BZONE["Netherstorm"],58.8,35.6)
	-- Searing Gorge
	self:addLookupList(MobDB,5844,L["Dark Iron Slaver"],BZONE["Searing Gorge"],43.8,33.8)
	self:addLookupList(MobDB,5846,L["Dark Iron Taskmaster"],BZONE["Searing Gorge"],44.4,41.1)
	self:addLookupList(MobDB,5861,L["Twilight Fire Guard"],BZONE["Searing Gorge"],25.5,33.8)
	self:addLookupList(MobDB,8637,L["Dark Iron Watchman"],BZONE["Searing Gorge"],69.3,34.8)
	self:addLookupList(MobDB,9026,BBOSS["Overmaster Pyron"],BZONE["Searing Gorge"],26.2,74.9)
	-- Shadowmoon Valley
	self:addLookupList(MobDB,19740,L["Wrathwalker"],BZONE["Shadowmoon Valley"],25.5,33.0)
	self:addLookupList(MobDB,19754,L["Deathforge Tinkerer"],BZONE["Shadowmoon Valley"],39.0,38.7)
	self:addLookupList(MobDB,19755,L["Mo'arg Weaponsmith"],BZONE["Shadowmoon Valley"],25.5,31.5)
	self:addLookupList(MobDB,19756,L["Deathforge Smith"],BZONE["Shadowmoon Valley"],37.5,42.0)
	self:addLookupList(MobDB,19768,L["Coilskar Siren"],BZONE["Shadowmoon Valley"],46.5,30.0)
	self:addLookupList(MobDB,19792,L["Eclipsion Centurion"],BZONE["Shadowmoon Valley"],48.0,61.8)
	self:addLookupList(MobDB,19795,L["Eclipsion Blood Knight"],BZONE["Shadowmoon Valley"],52.7,63.2)
	self:addLookupList(MobDB,19796,L["Eclipsion Archmage"],BZONE["Shadowmoon Valley"],49.5,58.5)
	self:addLookupList(MobDB,19806,L["Eclipsion Bloodwarder"],BZONE["Shadowmoon Valley"],46.5,66.0)
	self:addLookupList(MobDB,19826,L["Dark Conclave Shadowmancer"],BZONE["Shadowmoon Valley"],37.5,29.0)
	self:addLookupList(MobDB,20878,L["Deathforge Guardian"],BZONE["Shadowmoon Valley"],39.0,47.0)
	self:addLookupList(MobDB,20887,L["Deathforge Imp"],BZONE["Shadowmoon Valley"],40.5,39.1)
	self:addLookupList(MobDB,21050,L["Enraged Earth Spirit"],BZONE["Shadowmoon Valley"],46.5,45.0)
	self:addLookupList(MobDB,21059,L["Enraged Water Spirit"],BZONE["Shadowmoon Valley"],51.0,25.5)
	self:addLookupList(MobDB,21060,L["Enraged Air Spirit"],BZONE["Shadowmoon Valley"],70.5,28.5)
	self:addLookupList(MobDB,21061,L["Enraged Fire Spirit"],BZONE["Shadowmoon Valley"],48.0,43.5)
	self:addLookupList(MobDB,21302,L["Shadow Council Warlock"],BZONE["Shadowmoon Valley"],22.9,38.2)
	self:addLookupList(MobDB,21314,L["Terrormaster"],BZONE["Shadowmoon Valley"],24.0,45.0)
	self:addLookupList(MobDB,21454,L["Ashtongue Warrior"],BZONE["Shadowmoon Valley"],57.0,36.0)
	self:addLookupList(MobDB,22016,L["Eclipsion Soldier"],BZONE["Shadowmoon Valley"],52.8,66.5)
	self:addLookupList(MobDB,22017,L["Eclipsion Spellbinder"],BZONE["Shadowmoon Valley"],52.7,63.4)
	self:addLookupList(MobDB,22018,L["Eclipsion Cavalier"],BZONE["Shadowmoon Valley"],52.7,61.1)
	self:addLookupList(MobDB,22076,L["Torloth the Magnificent"],BZONE["Shadowmoon Valley"],51.2,72.5)
	self:addLookupList(MobDB,22093,L["Illidari Watcher"],BZONE["Shadowmoon Valley"],52.5,72.0)
	self:addLookupList(MobDB,23305,L["Crazed Murkblood Foreman"],BZONE["Shadowmoon Valley"],72.3,90.0)
	self:addLookupList(MobDB,23324,L["Crazed Murkblood Miner"],BZONE["Shadowmoon Valley"],73.5,88.5)
	-- Sholazar Basin
	self:addLookupList(MobDB,28123,L["Venture Co. Excavator"],BZONE["Sholazar Basin"],35.8,45.5)      
	self:addLookupList(MobDB,28379,L["Shattertusk Mammoth"],BZONE["Sholazar Basin"],53.5,24.4)
	-- Silithus
	self:addLookupList(MobDB,14454,BBOSS["The Windreaver"],BZONE["Silithus"],27.0,26.8)
	-- Silverpine Forest
	self:addLookupList(MobDB,3530,L["Pyrewood Tailor"],BZONE["Silverpine Forest"],45.7,71.0)
	self:addLookupList(MobDB,3531,L["Moonrage Tailor"],BZONE["Silverpine Forest"],45.5,73.3)
	-- Stonetalon Mountains
	self:addLookupList(MobDB,4028,L["Charred Ancient"],BZONE["Stonetalon Mountains"],34.0,66.1)
	self:addLookupList(MobDB,4029,L["Blackened Ancient"],BZONE["Stonetalon Mountains"],33.0,70.7)
	self:addLookupList(MobDB,4030,L["Vengeful Ancient"],BZONE["Stonetalon Mountains"],33.0,72.4)
	-- Stranglethorn Vale
	self:addLookupList(MobDB,674,L["Venture Co. Strip Miner"],BZONE["Stranglethorn Vale"],40.5,43.7)
	self:addLookupList(MobDB,938,L["Kurzen Commando"],BZONE["Stranglethorn Vale"],47.2,7.6)
	self:addLookupList(MobDB,1561,L["Bloodsail Raider"],BZONE["Stranglethorn Vale"],27.0,69.9)
	-- Swamp of Sorrows
	self:addLookupList(MobDB,764,L["Swampwalker"],BZONE["Swamp of Sorrows"],51.0,36.7)
	self:addLookupList(MobDB,765,L["Swampwalker Elder"],BZONE["Swamp of Sorrows"],12.0,33.2)
	self:addLookupList(MobDB,766,L["Tangled Horror"],BZONE["Swamp of Sorrows"],12.0,31.8)
	self:addLookupList(MobDB,1081,L["Mire Lord"],BZONE["Swamp of Sorrows"],5.6,31.4)
	self:addLookupList(MobDB,14448,L["Molt Thorn"],BZONE["Swamp of Sorrows"],30.4,41.4)
	-- Tanaris
  	self:addLookupList(MobDB,5615,L["Wastewander Rogue"],BZONE["Tanaris"],60.4,39.3)
	self:addLookupList(MobDB,5616,L["Wastewander Thief"],BZONE["Tanaris"],63.0,29.9)
	self:addLookupList(MobDB,5617,L["Wastewander Shadow Mage"],BZONE["Tanaris"],60.0,37.4)
	self:addLookupList(MobDB,5618,L["Wastewander Bandit"],BZONE["Tanaris"],63.6,30.6)
	self:addLookupList(MobDB,5623,L["Wastewander Assassin"],BZONE["Tanaris"],58.6,36.1)
	self:addLookupList(MobDB,7805,L["Wastewander Scofflaw"],BZONE["Tanaris"],66.1,35.0)
	self:addLookupList(MobDB,7883,L["Andre Firebeard"],BZONE["Tanaris"],73.4,47.1)
	-- Terokkar Forest
	self:addLookupList(MobDB,16810,L["Bonechewer Backbreaker"],BZONE["Terokkar Forest"],66.0,55.2)
	self:addLookupList(MobDB,22148,L["Gordunni Head-Splitter"],BZONE["Terokkar Forest"],22.5,8.3)
	self:addLookupList(MobDB,23022,L["Gordunni Soulreaper"],BZONE["Terokkar Forest"],22.9,8.8)
	self:addLookupList(MobDB,22143,L["Gordunni Back-Breaker"],BZONE["Terokkar Forest"],21.2,8.1)
	self:addLookupList(MobDB,22144,L["Gordunni Elementalist"],BZONE["Terokkar Forest"],21.3,12.0)
	-- The Barrens
	self:addLookupList(MobDB,3385,L["Theramore Marine"],BZONE["The Barrens"],61.2,52.2)
	self:addLookupList(MobDB,3386,L["Theramore Preserver"],BZONE["The Barrens"],63.1,56.7)
	-- The Hinterlands
	self:addLookupList(MobDB,2644,L["Vilebranch Hideskinner"],BZONE["The Hinterlands"],62.2,69.2)
	-- The Storm Peaks
	self:addLookupList(MobDB,29370,L["Stormforged Champion"],BZONE["The Storm Peaks"],26.1,47.5)
	self:addLookupList(MobDB,29376,L["Stormforged Artificer"],BZONE["The Storm Peaks"],31.5,44.2)
	self:addLookupList(MobDB,29402,L["Ironwool Mammoth"],BZONE["The Storm Peaks"],36.0,83.5)
	self:addLookupList(MobDB,29570,L["Nascent Val'kyr"],BZONE["The Storm Peaks"],27.1,60.0)
	self:addLookupList(MobDB,29792,L["Frostfeather Screecher"],BZONE["The Storm Peaks"],33.5,65.5)
	self:addLookupList(MobDB,29793,L["Frostfeather Witch"],BZONE["The Storm Peaks"],33.0,66.8)
	self:addLookupList(MobDB,30208,L["Stormforged Ambusher"],BZONE["The Storm Peaks"],70.3,57.5)
	self:addLookupList(MobDB,30222,L["Stormforged Infiltrator"],BZONE["The Storm Peaks"],58.5,63.2)
	self:addLookupList(MobDB,30260,L["Stoic Mammoth"],BZONE["The Storm Peaks"],54.8,64.9)
	self:addLookupList(MobDB,30448,L["Plains Mammoth"],BZONE["The Storm Peaks"],66.1,45.6)
	-- Thousand Needles
	self:addLookupList(MobDB,10760,L["Grimtotem Geomancer"],BZONE["Thousand Needles"],33.1,35.4)
	-- Un'Goro Crater
	self:addLookupList(MobDB,6556,L["Muculent Ooze"],BZONE["Un'Goro Crater"],62.2,25.4)
	self:addLookupList(MobDB,6557,L["Primal Ooze"],BZONE["Un'Goro Crater"],51.8,34.9)
	self:addLookupList(MobDB,6559,L["Glutinous Ooze"],BZONE["Un'Goro Crater"],39.0,37.7)
	self:addLookupList(MobDB,9477,L["Cloned Ooze"],BZONE["Un'Goro Crater"],45.5,22.7)
	-- Western Plaguelands
	self:addLookupList(MobDB,1783,L["Skeletal Flayer"],BZONE["Western Plaguelands"],50.7,80.5)
	self:addLookupList(MobDB,1791,L["Slavering Ghoul"],BZONE["Western Plaguelands"],36.0,56.5)
	self:addLookupList(MobDB,1812,L["Rotting Behemoth"],BZONE["Western Plaguelands"],64.5,36.6)
	self:addLookupList(MobDB,1813,L["Decaying Horror"],BZONE["Western Plaguelands"],62.0,37.6)
	self:addLookupList(MobDB,1836,L["Scarlet Cavalier"],BZONE["Western Plaguelands"],42.5,16.0)
	self:addLookupList(MobDB,1844,L["Foreman Marcrid"],BZONE["Western Plaguelands"],47.7,35.4)
	self:addLookupList(MobDB,1885,L["Scarlet Smith"],BZONE["Western Plaguelands"],45.4,14.5)
	self:addLookupList(MobDB,4494,L["Scarlet Spellbinder"],BZONE["Western Plaguelands"],52.7,38.4)
	-- Westfall
	self:addLookupList(MobDB,450,L["Defias Renegade Mage"],BZONE["Westfall"],53.0,78.8)
	self:addLookupList(MobDB,590,L["Defias Looter"],BZONE["Westfall"],37.5,58.4)
	-- Wetlands
	self:addLookupList(MobDB,1051,L["Dark Iron Dwarf"],BZONE["Wetlands"],60.1,25.7)
	self:addLookupList(MobDB,1052,L["Dark Iron Saboteur"],BZONE["Wetlands"],58.5,24.2)
	self:addLookupList(MobDB,1053,L["Dark Iron Tunneler"],BZONE["Wetlands"],61.4,27.7)
	self:addLookupList(MobDB,1054,L["Dark Iron Demolitionist"],BZONE["Wetlands"],59.5,29.7)
	self:addLookupList(MobDB,1160,L["Captain Halyndor"],BZONE["Wetlands"],15.0,24.0)
	self:addLookupList(MobDB,1364,L["Balgaras the Foul"],BZONE["Wetlands"],60.0,28.7)
	-- Winterspring
	self:addLookupList(MobDB,7428,L["Frostmaul Giant"],BZONE["Winterspring"],58.5,70.0)
	self:addLookupList(MobDB,7437,L["Cobalt Mageweaver"],BZONE["Winterspring"],59.5,49.2)
	self:addLookupList(MobDB,7438,L["Winterfall Ursa"],BZONE["Winterspring"],67.5,36.3)
	self:addLookupList(MobDB,7440,L["Winterfall Den Watcher"],BZONE["Winterspring"],68.0,35.5)
	self:addLookupList(MobDB,7524,L["Anguished Highborne"],BZONE["Winterspring"],50.7,41.9)
	self:addLookupList(MobDB,14457,BBOSS["Princess Tempestria"],BZONE["Winterspring"],52.7,41.9)
	-- Zul'drak
	self:addLookupList(MobDB,28851,L["Enraged Mammoth"],BZONE["Zul'Drak"],72.0,41.1)
	self:addLookupList(MobDB,29235,L["Gundrak Savage"],BZONE["Zul'Drak"],66.8,42.4)
-- Instances
	-- Ahn'kahet: The Old Kingdom
	self:addLookupList(MobDB,29311,BBOSS["Herald Volazj"],BZONE["Ahn'kahet: The Old Kingdom"],0,0)
	-- Auchenai Crypts
	self:addLookupList(MobDB,18497,L["Auchenai Monk"],BZONE["Auchenai Crypts"],0,0)
	self:addLookupList(MobDB,18521,L["Raging Skeleton"],BZONE["Auchenai Crypts"],0,0)
	-- Azjol-Nerub
	self:addLookupList(MobDB,29120,BBOSS["Anub'arak"],BZONE["Azjol-Nerub"],0,0)
	-- Blackrock Depths
	self:addLookupList(MobDB,8897,L["Doomforge Craftsman"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8898,L["Anvilrage Marshal"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8903,L["Anvilrage Captain"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8920,L["Weapon Technician"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,8983,BBOSS["Golem Lord Argelmach"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9024,BBOSS["Pyromancer Loregrain"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9025,BBOSS["Lord Roccor"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9028,BBOSS["Grizzle"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9499,BBOSS["Plugger Spazzring"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9543,BBOSS["Ribbly Screwspigot"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,9554,L["Hammered Patron"],BZONE["Blackrock Depths"],0,0)
	self:addLookupList(MobDB,10043,L["Ribbly's Crony"],BZONE["Blackrock Depths"],0,0)
	-- Blackrock Spire
	self:addLookupList(MobDB,9216,L["Spirestone Warlord"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9259,L["Firebrand Grunt"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9260,L["Firebrand Legionnaire"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9262,L["Firebrand Invoker"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9264,L["Firebrand Pyromancer"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9596,BBOSS["Bannok Grimaxe"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,9736,BBOSS["Quartermaster Zigris"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10264,BBOSS["Solakar Flamewreath"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10317,L["Blackhand Elite"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10339,BBOSS["Gyth"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10363,BBOSS["General Drakkisath"],BZONE["Blackrock Spire"],0,0)
	self:addLookupList(MobDB,10899,BBOSS["Goraluk Anvilcrack"],BZONE["Blackrock Spire"],0,0)
	-- Blackwing Lair
	self:addLookupList(MobDB,14401,L["Master Elemental Shaper Krixix"],BZONE["Blackwing Lair"],0,0)
	-- Dire Maul
	self:addLookupList(MobDB,11487,BBOSS["Magister Kalendris"],BZONE["Dire Maul"],0,0)
	self:addLookupList(MobDB,14354,BBOSS["Pusillin"],BZONE["Dire Maul"],0,0)
	-- Drak'Tharon Keep
	self:addLookupList(MobDB,26632,BBOSS["The Prophet Tharon'ja"],BZONE["Drak'Tharon Keep"],0,0)
	-- Gnomeregan
	self:addLookupList(MobDB,7800,BBOSS["Mekgineer Thermaplugg"],BZONE["Gnomeregan"],0,0)
	-- Halls of Lightning
	self:addLookupList(MobDB,28923,BBOSS["Loken"],BZONE["Halls of Lightning"],0,0)
	-- Halls of Stone
	self:addLookupList(MobDB,27978,BBOSS["Sjonnir The Ironshaper"],BZONE["Halls of Stone"],0,0)
	-- Karazhan
	self:addLookupList(MobDB,16406,L["Phantom Attendant"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16408,L["Phantom Valet"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16472,L["Phantom Stagehand"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15687,BBOSS["Moroes"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,15688,BBOSS["Terestian Illhoof"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16152,BBOSS["Attumen the Huntsman"],BZONE["Karazhan"],0,0)
	self:addLookupList(MobDB,16524,BBOSS["Shade of Aran"],BZONE["Karazhan"],0,0)
	-- Magister's Terrace
	self:addLookupList(MobDB,24560,BBOSS["Priestess Delrissa"],BZONE["Magisters' Terrace"],0,0)
	self:addLookupList(MobDB,24664,BBOSS["Kael'thas Sunstrider"],BZONE["Magisters' Terrace"],0,0)
	-- Mana-Tombs
	self:addLookupList(MobDB,18314,L["Nexus Stalker"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,18317,L["Ethereal Priest"],BZONE["Mana-Tombs"],0,0)
	self:addLookupList(MobDB,18344,BBOSS["Nexus-Prince Shaffar"],BZONE["Mana-Tombs"],0,0)
	-- Oculus
	self:addLookupList(MobDB,27656,BBOSS["Ley-Guardian Eregos"],BZONE["The Oculus"],0,0)
	-- Old Hillsbrad Foothills
	self:addLookupList(MobDB,17820,L["Durnholde Rifleman"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,17862,BBOSS["Captain Skarloc"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,18096,BBOSS["Epoch Hunter"],BZONE["Old Hillsbrad Foothills"],0,0)
	self:addLookupList(MobDB,28132,L["Don Carlos"],BZONE["Old Hillsbrad Foothills"],0,0)
	-- Ruins of Ahn'Qiraj
	self:addLookupList(MobDB,15340,BBOSS["Moam"],BZONE["Ruins of Ahn'Qiraj"],0,0)
	-- Scholomance
	self:addLookupList(MobDB,1853,BBOSS["Darkmaster Gandling"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10469,L["Scholomance Adept"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10499,L["Spectral Researcher"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10503,BBOSS["Jandice Barov"],BZONE["Scholomance"],0,0)
	self:addLookupList(MobDB,10508,BBOSS["Ras Frostwhisper"],BZONE["Scholomance"],0,0)
	-- Sethekk Halls
	self:addLookupList(MobDB,18320,L["Time-Lost Shadowmage"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,18322,L["Sethekk Ravenguard"],BZONE["Sethekk Halls"],0,0)
	self:addLookupList(MobDB,18472,BBOSS["Darkweaver Syth"],BZONE["Sethekk Halls"],0,0)
	-- Shadow Labyrinth
	self:addLookupList(MobDB,18667,BBOSS["Blackheart the Inciter"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18708,BBOSS["Murmur"],BZONE["Shadow Labyrinth"],0,0)
	self:addLookupList(MobDB,18830,L["Cabal Fanatic"],BZONE["Shadow Labyrinth"],0,0)
	-- Stratholme
	self:addLookupList(MobDB,10398,L["Thuzadin Shadowcaster"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10422,L["Crimson Sorcerer"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10426,L["Crimson Inquisitor"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10813,BBOSS["Balnazzar"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10438,BBOSS["Maleki the Pallid"],BZONE["Stratholme"],0,0)
	self:addLookupList(MobDB,10997,BBOSS["Cannon Master Willey"],BZONE["Stratholme"],0,0)
	-- Temple of Ahn'Qiraj
	self:addLookupList(MobDB,15263,BBOSS["The Prophet Skeram"],BZONE["Temple of Ahn'Qiraj"],0,0)
	self:addLookupList(MobDB,15275,BBOSS["Emperor Vek'nilash"],BZONE["Temple of Ahn'Qiraj"],0,0)
	self:addLookupList(MobDB,15276,BBOSS["Emperor Vek'lor"],BZONE["Temple of Ahn'Qiraj"],0,0)
	-- The Arcatraz
	self:addLookupList(MobDB,20869,L["Arcatraz Sentinel"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20880,L["Eredar Deathbringer"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20898,L["Gargantuan Abyssal"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20900,L["Unchained Doombringer"],BZONE["The Arcatraz"],0,0)
	self:addLookupList(MobDB,20885,BBOSS["Dalliah the Doomsayer"],BZONE["The Arcatraz"],0,0)
	--The Black Morass
	self:addLookupList(MobDB,21104,L["Rift Keeper"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,17839,L["Rift Lord"],BZONE["The Black Morass"],0,0)
	self:addLookupList(MobDB,17879,BBOSS["Chrono Lord Deja"],BZONE["The Black Morass"],0,0)
	-- The Botanica
	self:addLookupList(MobDB,17975,BBOSS["High Botanist Freywinn"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,18422,L["Sunseeker Botanist"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,17977,BBOSS["Warp Splinter"],BZONE["The Botanica"],0,0)
	self:addLookupList(MobDB,17978,BBOSS["Thorngrin the Tender"],BZONE["The Botanica"],0,0)
	-- The Deadmines
	self:addLookupList(MobDB,657,L["Defias Pirate"],BZONE["The Deadmines"],0,0)
	self:addLookupList(MobDB,1732,L["Defias Squallshaper"],BZONE["The Deadmines"],0,0)
	-- The Mechanar
	self:addLookupList(MobDB,19168,L["Sunseeker Astromage"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19219,BBOSS["Mechano-Lord Capacitus"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19220,BBOSS["Pathaleon the Calculator"],BZONE["The Mechanar"],0,0)
	self:addLookupList(MobDB,19221,BBOSS["Nethermancer Sepethrea"],BZONE["The Mechanar"],0,0)
	-- The Nexus
	self:addLookupList(MobDB,26723,BBOSS["Keristrasza"],BZONE["The Nexus"],0,0)
	-- The Shattered Halls
	self:addLookupList(MobDB,17465,L["Shattered Hand Centurion"],BZONE["The Shattered Halls"],0,0)
	self:addLookupList(MobDB,16807,BBOSS["Grand Warlock Nethekurse"],BZONE["The Shattered Halls"],0,0)
	-- The Slave Pens
	self:addLookupList(MobDB,17941,BBOSS["Mennu the Betrayer"],BZONE["The Slave Pens"],0,0)
	-- The Steamvault
	self:addLookupList(MobDB,17722,L["Coilfang Sorceress"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17803,L["Coilfang Oracle"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17796,BBOSS["Mekgineer Steamrigger"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17797,BBOSS["Hydromancer Thespia"],BZONE["The Steamvault"],0,0)
	self:addLookupList(MobDB,17798,BBOSS["Warlord Kalithresh"],BZONE["The Steamvault"],0,0)
	-- The Temple of Atal'Hakkar
	self:addLookupList(MobDB,5226,L["Murk Worm"],BZONE["The Temple of Atal'Hakkar"],0,0)
	-- The Violet Hold
	self:addLookupList(MobDB,31134,BBOSS["Cyanigosa"],BZONE["The Violet Hold"],0,0)
	-- Utgarde Keep
	self:addLookupList(MobDB,23954,BBOSS["Ingvar the Plunderer"],BZONE["Utgarde Keep"],0,0)
	-- Utgarde Pinnacle
	self:addLookupList(MobDB,26861,BBOSS["King Ymiron"],BZONE["Utgarde Pinnacle"],0,0)

end
