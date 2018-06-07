-- Version 1570
CT_ITEMREG = "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):%d+|h%[.-%]|h|r)%";
CT_ITEMREG_MULTI = "(|c%x+|Hitem:%d+:%d+:%d+:%d+:%d+:%d+:(%-?%d+):(%-?%d+):%d+|h%[.-%]|h|r)x(%d+)%";

CT_RaidTracker_Zones = {
	"Molten Core",
	"Blackwing Lair",
	"Zul'Gurub",
	"Onyxia's Lair",
	"Ahn'Qiraj Ruins",
	"Ahn'Qiraj Temple",
	"Naxxramas",
	"Worldboss",
	-- TBC
	"Karazhan",
	"Gruul's Lair",
	"Magtheridon's Lair",
	"Serpentshrine Cavern",
	"Caverns Of Time",
	"Tempest Keep: The Eye",
	"Black Temple",
	"Battle of Mount Hyjal",
	"Zul'Aman",
	"Sunwell Plateau",
	-- TBC
};

CT_RaidTracker_Bosses = {
	["Molten Core"] = {
		"Lucifron",
		"Magmadar",
		"Gehennas",
		"Garr",
		"Baron Geddon",
		"Shazzrah",
		"Sulfuron Harbinger",
		"Golemagg the Incinerator",
		"Majordomo Executus",
		"Ragnaros",
	},
	["Blackwing Lair"] = {
		"Razorgore the Untamed",
		"Vaelastrasz the Corrupt",
		"Broodlord Lashlayer",
		"Firemaw",
		"Ebonroc",
		"Flamegor",
		"Chromaggus",
		"Nefarian",
	},
	["Zul'Gurub"] = {
		"High Priestess Jeklik",
		"High Priest Venoxis",
		"High Priestess Mar'li",
		"High Priest Thekal",
		"High Priestess Arlokk",
		"Hakkar",
		"Bloodlord Mandokir",
		"Jin'do the Hexxer",
		"Gahz'ranka",
		"Hazza'rah",
		"Gri'lek",
		"Renataki",
		"Wushoolay",
	},
	["Ahn'Qiraj Temple"] = {
		"The Prophet Skeram",
		"Fankriss the Unyielding",
		"Battleguard Sartura",
		"Princess Huhuran",
		"Twin Emperors",
		"C'Thun",
		"Vem",
		"Princess Yauj",
		"Lord Kri",
		"Viscidus",
		"Ouro",
	},
	["Ahn'Qiraj Ruins"] = {
		"Kurinnaxx",
		"General Rajaxx",
		"Ayamiss the Hunter",
		"Moam",
		"Buru The Gorger",
		"Ossirian The Unscarred",
	},
	["Naxxramas"] = {
		"Patchwerk",
		"Grobbulus",
		"Gluth",
		"Thaddius",
		"Instructor Razuvious",
		"Gothik the Harvester",
		"Highlord Mograine",
		"Thane Korth'azz",
		"Lady Blaumeux",
		"Sir Zeliek",
		"Noth The Plaguebringer",
		"Heigan the Unclean",
		"Loatheb",
		"Anub'Rekhan",
		"Grand Widow Faerlina",
		"Maexxna",
		"Sapphiron",
		"Kel'Thuzad",
	},
	["Worldboss"] = {
	  "Onyxia",
		"Lord Kazzak",
		"Azuregos",
		-- tbc
		"Highlord Kruul",	
		"Doom Lord Kazzak",
		"Doomwalker",
	  -- tbc		
	},
	["Emerald Dragon"] = {
		"Ysondre",
		"Taerar",
		"Emeriss",
		"Lethon",
	},
	-- TBC
	["Karazhan"] = {
		"Attumen the Huntsman",
		"Moroes",
		"Maiden of Virtue",
		["Theater Event"] = {
			"Unknown",
			"The Crone",
			"The Big Bad Wolf",
			"Romulo and Julianne",
		},
		"The Curator",
		"Terestian Illhoof",
		"Shade of Aran",
		"Chess Event",
		"Prince Malchezaar",

		"Netherspite",
		"Nightbane",
		"Rokad the Ravager",
		"Hyakiss the Lurker",
		"Shadikith the Glider",
		"Echo of Medivh",
		"Image of Medivh",
	},
	["Gruul's Lair"] = {
		"High King Maulgar",
		"Gruul the Dragonkiller",
	},
	["Magtheridon's Lair"] = {
		"Magtheridon",
	},
	["Serpentshrine Cavern"] = {
		"Hydross the Unstable",
		"The Lurker Below",
		"Leotheras the Blind",
		"Fathom-Lord Karathress",
		"Morogrim Tidewalker",
		"Lady Vashj",
	},
	["Caverns Of Time"] = {
		"Unknown",
	},
	["Black Temple"] = {
		"High Warlord Naj'entus",
		"Supremus",
		"Gurtogg Bloodboil",
		"Teron Gorefiend",
		"Shade of Akama",
		"Reliquary of Souls",
		"Mother Shahraz",
		"Illidari Council",
		"Illidan Stormrage",
	},
	["Tempest Keep: The Eye"] = {
		"Al'ar",
		"High Astromancer Solarian",
		"Void Reaver",
		"Kael'thas Sunstrider",
	},
	["Battle of Mount Hyjal"] = {
		"Rage Winterchill",
		"Anetheron",
		"Kaz'rogal",
		"Azgalor",
		"Archimonde",
	},
	["Zul'Aman"] = {
		"Nalorakk",
		"Akil'Zon",
		"Jan'Alai",
		"Halazzi",
		"Witch Doctor",
		"Hex Lord Malacrass",
		"Zul'jin",
	},
	["Sunwell Plateau"] = {
      "Kalecgos",
      "Sathrovarr the Corruptor",
      "Brutallus",
      "Felmyst",
      "Eredar Twins",
      "Entropius",
      "Kil'jaeden",
   },	
	
	--TBC	
	["Trash mob"] = 1,
};

	CT_RaidTracker_lang_LeftGroup = "([^%s]+)离开了团队。";
	CT_RaidTracker_lang_JoinedGroup = "([^%s]+)加入了团队。";
	CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+)获得了物品："..CT_ITEMREG.."。";
	CT_RaidTracker_lang_ReceivesLoot2 = "你获得了物品："..CT_ITEMREG.."。";
	CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+)得到了物品："..CT_ITEMREG_MULTI.."。";
	CT_RaidTracker_lang_ReceivesLoot4 = "你得到了物品："..CT_ITEMREG_MULTI.."。";
	CT_RaidTracker_lang_ReceivesLootYou = "你";

CT_RaidTracker_ZoneTriggers = {
	["Molten Core"] = "Molten Core",
	["Blackwing Lair"] = "Blackwing Lair",
	["Zul'Gurub"] = "Zul'Gurub",
	["Onyxia's Lair"] = "Onyxia's Lair",
	["Ruins of Ahn'Qiraj"] = "Ahn'Qiraj Ruins",
	["Ahn'Qiraj"] = "Ahn'Qiraj Temple",
	["Naxxramas"] = "Naxxramas",
	-- TBC
	["Karazhan"] = "Karazhan",
	["Gruul's Lair"] = "Gruul's Lair",
	["Magtheridon's Lair"] = "Magtheridon's Lair",
	["Serpentshrine Cavern"] = "Serpentshrine Cavern",
	["Caverns Of Time"] = "Caverns Of Time",
	["Black Temple"] = "Black Temple",
	["Tempest Keep"] = "Tempest Keep: The Eye",
	["Hyjal Summit"] = "Battle of Mount Hyjal",
	["Zul'Aman"] = "Zul'Aman",
	["Sunwell Plateau"] = "Sunwell Plateau"
	-- TBC
};

CT_RaidTracker_BossUnitTriggers = {
	["Lucifron"] = "Lucifron",
	["Magmadar"] = "Magmadar",
	["Gehennas"] = "Gehennas",
	["Garr"] = "Garr",
	["Baron Geddon"] = "Baron Geddon",
	["Shazzrah"] = "Shazzrah",
	["Sulfuron Harbinger"] = "Sulfuron Harbinger",
	["Golemagg the Incinerator"] = "Golemagg the Incinerator",
	["Majordomo Executus"] = "Majordomo Executus",
	["Ragnaros"] = "Ragnaros",
	["Core Hound"] = "IGNORE",
	["Firesworn"] = "IGNORE",
	["Core Rager"] = "IGNORE",
	["Flamewaker Healer"] = "IGNORE",
	["Flamewaker Elite"] = "IGNORE",
	["Son of Flame"] = "IGNORE",
	
	["Razorgore the Untamed"] = "Razorgore the Untamed",
	["Vaelastrasz the Corrupt"] = "Vaelastrasz the Corrupt",
	["Broodlord Lashlayer"] = "Broodlord Lashlayer",
	["Firemaw"] = "Firemaw",
	["Ebonroc"] = "Ebonroc",
	["Flamegor"] = "Flamegor",
	["Chromaggus"] = "Chromaggus",
	["Nefarian"] = "Nefarian",
	["Lord Victor Nefarius"] = "Nefarian",
	["Grethok the Controller"] = "IGNORE",
	["Blackwing Guardsman"] = "IGNORE",
	["Blackwing Legionnaire"] = "IGNORE",
	["Blackwing Mage"] = "IGNORE",
	["Death Talon Dragonspawn"] = "IGNORE",
	["Black Drakonid"] = "IGNORE",
	["Blue Drakonid"] = "IGNORE",
	["Bronze Drakonid"] = "IGNORE",
	["Green Drakonid"] = "IGNORE",
	["Red Drakonid"] = "IGNORE",
	["Chromatic Drakonid"] = "IGNORE",
	["Bone Construct"] = "IGNORE",
	["Corrupted Infernal"] = "IGNORE",
	["Corrupted Blue Whelp"] = "IGNORE",
	["Corrupted Red Whelp"] = "IGNORE",
	["Corrupted Green Whelp"] = "IGNORE",
	["Corrupted Bronze Whelp"] = "IGNORE",
	["Death Talon Hatcher"] = "IGNORE",
	["Blackwing Taskmaster"] = "IGNORE",
	
	["High Priestess Jeklik"] = "High Priestess Jeklik",
	["High Priest Venoxis"] =	"High Priest Venoxis",
	["High Priestess Mar'li"] =	"High Priestess Mar'li",
	["High Priest Thekal"] = "High Priest Thekal",
	["High Priestess Arlokk"] =	"High Priestess Arlokk",
	["Hakkar"] = "Hakkar",
	["Bloodlord Mandokir"] = "Bloodlord Mandokir",
	["Jin'do the Hexxer"] = "Jin'do the Hexxer",
	["Gahz'ranka"] = "Gahz'ranka",
	["Hazza'rah"] = "Hazza'rah",
	["Gri'lek"] = "Gri'lek",
	["Renataki"] = "Renataki",
	["Wushoolay"] = "Wushoolay",
	["Zulian Prowler"] = "IGNORE",
	["Zulian Guardian"] = "IGNORE",
	["Parasitic Serpent"] = "IGNORE",
	["Spawn of Mar'li"] = "IGNORE",
	["Ohgan"] = "IGNORE",
	["Frenzied Bloodseeker Bat"] = "IGNORE",
	["Poisonous Cloud"] = "IGNORE",
	
	["Onyxia"] = "Onyxia",
	["Lord Kazzak"] = "Lord Kazzak",
	["Azuregos"] = "Azuregos",
	["Ysondre"] = "Ysondre",
	["Taerar"] = "Taerar",
	["Emeriss"] = "Emeriss",
	["Lethon"] = "Lethon",
	
	["Onyxian Whelp"] = "IGNORE",
	["Onyxian Warder"] = "IGNORE",
	["Shade of Taerar"] = "IGNORE",
	["Spirit Shade"] = "IGNORE",
	["Demented Druid Spirit"] = "IGNORE",
	
	["Kurinnaxx"] = "Kurinnaxx",
	["General Rajaxx"] = "General Rajaxx",
	["Ayamiss the Hunter"] = "Ayamiss the Hunter",
	["Buru the Gorger"] = "Buru The Gorger",
	["Moam"] = "Moam",
	["Ossirian the Unscarred"] = "Ossirian The Unscarred",
	["Buru Egg"] = "IGNORE",
	["Canal Frenzy"] = "IGNORE",
	["Mana Fiend"] = "IGNORE",
	["Silicate Feeder"] = "IGNORE",
	["Hive'Zara Hatchling"] = "IGNORE",
	["Hive'Zara Larva"] = "IGNORE",
	["Vekniss Hatchling"] = "IGNORE",
	["Anubisath Warrior"] = "IGNORE",
	
	["The Prophet Skeram"] = "The Prophet Skeram",
	["Fankriss the Unyielding"] = "Fankriss the Unyielding",
	["Battleguard Sartura"] = "Battleguard Sartura",
	["Princess Huhuran"] = "Princess Huhuran",
	["Emperor Vek'lor"] = "Twin Emperors",
	["Emperor Vek'nilash"] = "Twin Emperors",
	["C'Thun"] = "C'Thun",
	["Vem"] = "Vem",
	["Princess Yauj"] = "Princess Yauj",
	["Lord Kri"] = "Lord Kri",
	["Viscidus"] = "Viscidus",
	["Ouro"] = "Ouro",
	["Ouro Scarab"] = "IGNORE",
	["Spawn of Fankriss"] = "IGNORE",
	["Qiraji Scorpion"] = "IGNORE",
	["Qiraji Scarab"] = "IGNORE",
	["Vile Scarab"] = "IGNORE",
	["Yauj Brood"] = "IGNORE",
	["Sartura's Royal Guard"] = "IGNORE",
	["Sartura's Royal Guard"] = "IGNORE",
	["Poison Cloud"] = "IGNORE",
	["Vekniss Drone"] = "IGNORE",
	["Glob of Viscidus"] = "IGNORE",
	
	["Patchwerk"] = "Patchwerk",
	["Grobbulus"] = "Grobbulus",
	["Gluth"] = "Gluth",
	["Thaddius"] = "Thaddius",
	["Instructor Razuvious"] = "Instructor Razuvious",
	["Gothik the Harvester"] = "Gothik the Harvester",
	["Highlord Mograine"] = "Highlord Mograine",
	["Thane Korth'azz"] = "Thane Korth'azz",
	["Lady Blaumeux"] = "Lady Blaumeux",
	["Sir Zeliek"] = "Sir Zeliek",
	["Noth The Plaguebringer"] = "Noth The Plaguebringer",
	["Heigan the Unclean"] = "Heigan the Unclean",
	["Loatheb"] = "Loatheb",
	["Anub'Rekhan"] = "Anub'Rekhan",
	["Grand Widow Faerlina"] = "Grand Widow Faerlina",
	["Maexxna"] = "Maexxna",
	["Sapphiron"] = "Sapphiron",
	["Kel'Thuzad"] = "Kel'Thuzad",

		["Fangnetz"] = "IGNORE",
		["Verstrahlter Br\195\188hschleimer"] = "IGNORE",
		
	["Crypt Guard"] = "IGNORE",
	["Grobbulus Cloud"] = "IGNORE",
	["Deathknight Understudy"] = "IGNORE",
	["Maggot"] = "IGNORE",
	["Maexxna Spiderling"] = "IGNORE",
	["Plagued Warrior"] = "IGNORE",
	["Zombie Chow"] = "IGNORE",
	["Corpse Scarab"] = "IGNORE",
	["Naxxramas Follower"] = "IGNORE",
	["Naxxramas Worshipper"] = "IGNORE",
	["Web Wrap"] = "IGNORE",
	["Fallout Slime"] = "IGNORE",
	["Diseased Maggot"] = "IGNORE",
	["Rotting Maggot"] = "IGNORE",
	["Living Poison"] = "IGNORE",
	["Spore"] = "IGNORE",
	
	["Spotlight"] = "IGNORE",
	["Roach"] = "IGNORE",
	["Snake"] = "IGNORE",
	["Brown Snake"] = "IGNORE",
	["Crimson Snake"] = "IGNORE",
	["Black Kingsnake"] = "IGNORE",
	["Beetle"] = "IGNORE",
	["Dupe Bug"] = "IGNORE",
	["Fire Beetle"] = "IGNORE",
	["Scorpion"] = "IGNORE",
	["Frog"] = "IGNORE",
	["Hooktooth Frenzy"] = "IGNORE",
	["Sacrificed Troll"] = "IGNORE",
	["Spider"] = "IGNORE",
	["Rat"] = "IGNORE",
	["Jungle Toad"] = "IGNORE",
	["Field Repair Bot 74A"] = "IGNORE",
	
	-- TBC
	--Karazhan
	["Doom Lord Kazzak"] = "Doom Lord Kazzak",
	["Doomwalker"] = "Doomwalker",
	["Attumen the Huntsman"] = "Attumen the Huntsman",
	["Dorothee"] = "IGNORE",
	["Maiden of Virtue"] = "Maiden of Virtue",
	["Midnight"] = "IGNORE",
	["Moroes"] = "Moroes",
		["Baron Rafe Dreuger"] = "IGNORE", -- Moroes add
		["Baroness Dorothea Millstipe"] = "IGNORE", -- Moroes add
		["Lady Catriona Von'Indi"] = "IGNORE", -- Moroes add
		["Lady Keira Berrybuck"] = "IGNORE", -- Moroes add
		["Lord Crispin Ference"] = "IGNORE", -- Moroes add
		["Lord Robin Daris"] = "IGNORE", -- Moroes add
	["Netherspite"] = "Netherspite",
	["Nightbane"] = "Nightbane",
	["Prince Malchezaar"] = "Prince Malchezaar",
	["Shade of Aran"] = "Shade of Aran",
	["Strawman"] = "IGNORE",
	["Terestian Illhoof"] = "Terestian Illhoof",
	["Kil'rek"] = "IGNORE",
	["The Big Bad Wolf"] = "The Big Bad Wolf",
	["The Crone"] = "The Crone",
	["The Curator"] = "The Curator",
	["Tinhead"] = "IGNORE",
	["Tito"] = "IGNORE",
	["Rokad the Ravager"] = "Rokad the Ravager",
	["Hyakiss the Lurker"] = "Hyakiss the Lurker",
	["Shadikith the Glider"] = "Shadikith the Glider",
	["Chess Event"] = "Chess Event",
	["Julianne"] = "Romulo and Julianne",
	["Roar"] = "IGNORE",
	["Romulo"] = "IGNORE",
	["Echo of Medivh"] = "Echo of Medivh",
	["Image of Medivh"] = "Image of Medivh",
	-- Zul'Aman
	["Nalorakk"] = "Nalorakk",	
	["Akil'Zon"] = "Akil'zon",	
	["Jan'Alai"] = "Jan'alai",	
	["Halazzi"] = "Halazzi",	
	["Witch Doctor"] = "Witch Doctor",	
	["Hex Lord Malacrass"] = "Hex Lord Malacrass",	
	["Zul'jin"] = "Zul'jin",	
	--Gruul
	["High King Maulgar"] = "High King Maulgar",
	["Gruul the Dragonkiller"] = "Gruul the Dragonkiller",
	["Blindeye the Seer"] = "IGNORE",
	["Kiggler the Crazed"] = "IGNORE",
	["Krosh Firehand"] = "IGNORE",
	["Olm the Summoner"] = "IGNORE",
	-- Magtheridon
	["Magtheridon"] = "Magtheridon",
	["Hellfire Warder"] = "IGNORE",
	["Hellfire Channeler"] = "IGNORE",
	--Serpentshrine Cavern
	["Hydross the Unstable"] = "Hydross the Unstable",
	["The Lurker Below"] = 		"The Lurker Below",
	["Leotheras the Blind"] = "Leotheras the Blind",
	["Fathom-Lord Karathress"] = "Fathom-Lord Karathress",
	["Morogrim Tidewalker"] = "Morogrim Tidewalker",
	["Lady Vashj"] = "Lady Vashj",
		-- Bossadds
			-- Hydross Adds
      ["Pure Spawn of Hydross"] = "IGNORE", -- Pure Spawn of Hydross
      ["Tainted Spawn of Hydross"] = "IGNORE", -- Tainted Spawn of Hydross
      ["Tainted Water Elemental"] = "IGNORE", -- Tainted Water Elemental
      ["Purified Water Elemental"] = "IGNORE", -- Purified Water Elemental  
      
      -- Morogrim Adds
      ["Tidewalker Lurker"] = "IGNORE", -- Tidewalker Lurker
      ["Water Globule"] = "IGNORE", -- Water Globule (Waterbubbles Tidewalker summons at 25%) 

			-- Fathom-Lord Karathress Adds
			["Spitfire Totem"] = "IGNORE", -- Spitfire Totem
			["Greater Earthbind Totem"] = "IGNORE", -- Greater Earthbind Totem
			["Greater Poison Cleansing Totem"] = "IGNORE", -- Greater Poison Cleansing Totem
			["Fathom Lurker"] = "IGNORE", -- Fathom Lurker
			["Fathom Sporebat"] = "IGNORE", -- Fathom Sporebat
			["Fathom-Guard Caribdis"] = "IGNORE", -- Fathom-Guard Caribdis
			["Fathom-Guard Tidalvess"] = "IGNORE", -- Fathom-Guard Tidalvess
			["Fathom-Guard Sharkkis"] = "IGNORE", -- Fathom-Guard Sharkkis
			
			-- The Lurker Below Adds
			["Coilfang Guardian"] = "IGNORE", -- Coilfang Guardian
			["Coilfang Ambusher"] = "IGNORE", -- Coilfang Ambusher
			
			-- Leotheras the Blind Adds
			["Inner Demon"] = "IGNORE", -- Inner Demon
			
      -- Vashj Adds
      ["Toxic Spore Bat"] = "IGNORE",  -- Toxic Spore Bat
      ["Tainted Elemental"] = "IGNORE", -- Tainted Elemental
      ["Coilfang Elite"] = "IGNORE", -- Coilfang Elite
      ["Coilfang Strider"] = "IGNORE", -- Coilfang Strider
      ["Enchanted Elemental"] = "IGNORE", -- Enchanted Elemental			
      -- SSC Trashmobs 
      ["Coilfang Beast-Tamer"] = "IGNORE",	-- Coilfang Beast-Tamer
      ["Vashj'ir Honor Guard"] = "IGNORE",	-- Vashj'ir Honor Guard
      ["Greyheart Tidecaller"] = "IGNORE", -- Greyheart Tidecaller
      ["Tidewalker Harpooner"] = "IGNORE", -- Tidewalker Harpooner
      ["Coilfang Hate-Screamer"] = "IGNORE", -- Coilfang Hate-Screamer
      ["Tidewalker Warrior"] = "IGNORE", -- Tidewalker Warrior
      ["Serpentshrine Lurker"] = "IGNORE", -- Serpentshrine Lurker
      ["Greyheart Nether-Mage"] = "IGNORE", -- Greyheart Nether-Mage
      ["Coilfang Priestess"] = "IGNORE", -- Coilfang Priestess
      ["Tidewalker Shaman"] = "IGNORE", -- Tidewalker Shaman
      ["Greyheart Shield-Bearer"] = "IGNORE", -- Greyheart Shield-Bearer
      ["Coilfang Serpentguard"] = "IGNORE", -- Coilfang Serpentguard
      ["Greyheart Skulker"] = "IGNORE", -- Greyheart Skulker
      ["Serpentshrine Sporebat"] = "IGNORE", -- Serpentshrine Sporebat
      ["Greyheart Technician"] = "IGNORE", -- Greyheart Technician
      ["Coilfang Fathom-Witch"] = "IGNORE", -- Coilfang Fathom-Witch
      ["Tidewalker Depth-Seer"] = "IGNORE", -- Tidewalker Depth-Seer
      ["Underbog Colossus"] = "IGNORE", -- Underbog Colossus
      ["Tidewalker Hydromancer"] = "IGNORE", -- Tidewalker Hydromancer
      ["Coilfang Shatterer"] = "IGNORE", -- Coilfang Shatterer
      -- SSC Trashmobs without loot
			["Coilfang Frenzy"] = "IGNORE", -- Coilfang Frenzy
			["Serpentshrine Tidecaller"] = "IGNORE", -- Serpentshrine Tidecaller
			["Colossus Lurker"] = "IGNORE", -- Colossus Lurker
			["Colossus Rager"] = "IGNORE", -- Colossus Rager
			["Serpentshrine Parasite"] = "IGNORE", -- Serpentshrine Parasite
			["Underbog Mushroom"] = "IGNORE", -- Underbog Mushroom
			["Water Elemental Totem"] = "IGNORE", -- Water Elemental Totem
			["Greyheart Spellbinder"] = "IGNORE", -- Greyheart Spellbinder
			["Priestess Spirit"] = "IGNORE", -- Priestess Spirit	
	--Black Temple
	["High Warlord Naj'entus"] = "High Warlord Naj'entus",
	["Supremus"] = "Supremus",
	["Gurtogg Bloodboil"] = "Gurtogg Bloodboil",
	["Teron Gorefiend"] = "Teron Gorefiend",
	["Shade of Akama"] = "Shade of Akama",
	["Essence of Anger"] = "Reliquary of Souls",
	["Mother Shahraz"] = "Mother Shahraz",
	 ["Gathios the Shatterer"] = "Illidari Council",
	 ["High Nethermancer Zerevor"] = "Illidari Council",
	 ["Lady Malande"] = "Illidari Council",
	 ["Veras Darkshadow"] = "Illidari Council",	
	["Illidan Stormrage"] = "Illidan Stormrage",	
	--Tempest Keep: The Eye
	["Al'ar"] = "Al'ar",
	["High Astromancer Solarian"] = "High Astromancer Solarian",	
	["Void Reaver"] = "Void Reaver",
	["Kael'thas Sunstrider"] = "Kael'thas Sunstrider",
    -- Bossadds
	-- Al'ar Adds
    ["Ember of Al'ar"] = "IGNORE", -- Ember of Al'ar
    -- Astromancer Adds
    ["Solarium Agent"] = "IGNORE", -- Solarium Agent
    ["Solarium Priest"] = "IGNORE", -- Solarium Priest
    -- Kael'thas Adds
    ["Lord Sanguinar"] = "IGNORE", -- Lord Sanguinar
    ["Grand Astromancer Capernian"] = "IGNORE", -- Grand Astromancer Capernian  
    ["Master Engineer Telonicus"] = "IGNORE", -- Master Engineer Telonicus
    ["Phoenix Egg"] = "IGNORE", -- Phoenix Egg
    ["Phoenix"] = "IGNORE", -- Phoenix
    ["Thaladred the Darkener"] = "IGNORE", -- Thaladred the Darkener
    -- Kael'thas Weapons
    ["Infinity Blades"] = "IGNORE", -- Infinity Blades
    ["Cosmic Infuser"] = "IGNORE", -- Cosmic Infuser
    ["Netherstrand Longbow"] = "IGNORE", -- Netherstrand Longbow
    ["Phaseshift Bulwark"] = "IGNORE", -- Phaseshift Bulwark
    ["Staff of Disintegration"] = "IGNORE", -- Staff of Disintegration
    ["Devastation"] = "IGNORE", -- Devastation
    ["Warp Slicer"] = "IGNORE", -- Warp Slicer
		-- TK Trash
		["Astromancer"] = "IGNORE", -- Astromancer
		["Astromancer Lord"] = "IGNORE", -- Astromancer Lord
		["Novice Astromancer"] = "IGNORE", -- Novice Astromancer
		["Crimson Hand Blood Knight"] = "IGNORE", -- Crimson Hand Blood Knight
		["Tempest Falconer"] = "IGNORE", -- Tempest Falconer
		["Crimson Hand Inquisitor"] = "IGNORE", -- Crimson Hand Inquisitor
		["Crimson Hand Battle Mage"] = "IGNORE", -- Crimson Hand Battle Mage
		["Bloodwarder Squir"] = "IGNORE", -- Bloodwarder Squire
		["Crystalcore Mechanic"] = "IGNORE", -- Crystalcore Mechanic
		["Crystalcore Sentinel"] = "IGNORE", -- Crystalcore Sentinel
		["Crystalcore Devastator"] = "IGNORE", -- Crystalcore Devastator
		["Bloodwarder Legionnaire"] = "IGNORE", -- Bloodwarder Legionnaire
		["Bloodwarder Marshal"] = "IGNORE", -- Bloodwarder Marshal
		["Nether Scryer"] = "IGNORE", -- Nether Scryer
		["Phoenix-Hawk Hatchlings"] = "IGNORE", -- Phoenix-Hawk Hatchling
		["Phoenix-Hawk"] = "IGNORE", -- Phoenix-Hawk
		["Tempest-Smith"] = "IGNORE", -- Tempest-Smith
		["Star Scryer"] = "IGNORE", -- Star Scryer
		["Apprentice Star Scryer"] = "IGNORE", -- Apprentice Star Scryer
		["Bloodwarder Vindicator"] = "IGNORE", -- Bloodwarder Vindicator
		["Crimson Hand Centurion"] = "IGNORE", -- Crimson Hand Centurion

	["Lord Illidan Stormrage"] = "Lord Illidan Stormrage",
	["Highlord Kruul"] = "Highlord Kruul",	

	--Battle of Mount Hyjal
	["Rage Winterchill"] = "Rage Winterchill",
	["Anetheron"] = "Anetheron",
	["Kaz'rogal"] = "Kaz'rogal",
	["Azgalor"] = "Azgalor",
	["Archimonde"] = "Archimonde",
	
  --Sunwell Plateau
	["Kalecgos"] =  "IGNORE", -- Kalecgos
		["Sathrovarr the Corruptor"] = "Sathrovarr the Corruptor",
		["Sathrovarr the Corruptor"] = "Kalecgos",
	["Brutallus"] = "Brutallus",
		["Madrigosa"] = "IGNORE", -- Madrigosa	
	["Felmyst"] = "Felmyst",
	["Lady Sacrolash"] = "Eredar Twins",
	["Grand Warlock Alythess"] = "Eredar Twins",
	["Entropius"] = "Entropius",
	["Kil'jaeden"] = "Kil'jaeden",	
	["M'uru"] = "IGNORE",
	["Shadowsword Berserker"] = "IGNORE", -- Shadowsword Berserker
	["Shadowsword Fury Mage"] = "IGNORE", -- Shadowsword Fury Mage
	["Void Sentinel"] = "IGNORE", -- Void Sentinel
	["Void Spawn"] = "IGNORE", -- Void Spawn
	
	-- TBC	
	
	["DEFAULTBOSS"] = "Trash mob",
};

CT_RaidTracker_lang_BossKills_Majordomo_Yell = "Impossible! Stay your attack, mortals... I submit! I submit!";
CT_RaidTracker_lang_BossKills_Majordomo_BossName = "Majordomo Executus";
CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "I'm free!  That device shall never torment me again!";
CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben."; -- need english translation
CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "Chess Event";
--
CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "O happy dagger! This is thy sheath; there rust, and let me die!";
CT_RaidTracker_lang_BossKills_Julianne_BossName = "Julianne";
CT_RaidTracker_lang_BossKills_Sathrovarr_Yell = "I'm... never on... the losing... side...";
CT_RaidTracker_lang_BossKills_Sathrovarr_BossName = "Sathrovarr the Corruptor";

if (GetLocale() == "deDE") then
	CT_RaidTracker_lang_LeftGroup = "([^%s]+) hat die Schlachtgruppe verlassen.";
	CT_RaidTracker_lang_JoinedGroup = "([^%s]+) hat sich der Schlachtgruppe angeschlossen.";
	CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+) bekommt Beute: "..CT_ITEMREG..".";
	CT_RaidTracker_lang_ReceivesLoot2 = "Ihr erhaltet Beute: "..CT_ITEMREG..".";
	CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+) erh\195\164lt Beute: "..CT_ITEMREG_MULTI..".";
	CT_RaidTracker_lang_ReceivesLoot4 = "Ihr erhaltet Beute: "..CT_ITEMREG_MULTI..".";
	CT_RaidTracker_lang_ReceivesLootYou = "Ihr";
	
	CT_RaidTracker_ZoneTriggers = {
		["Geschmolzener Kern"] = "Molten Core",
		["Pechschwingenhort"] = "Blackwing Lair",
		["Zul'Gurub"] = "Zul'Gurub",
		["Onyxias Hort"] = "Onyxia's Lair",
		["Ruinen von Ahn'Qiraj"] = "Ahn'Qiraj Ruins",
		["Ahn'Qiraj"] = "Ahn'Qiraj Temple",
		["Naxxramas"] = "Naxxramas",
		-- TBC
		["Karazhan"] = "Karazhan",
		["Gruuls Unterschlupf"] = "Gruul's Lair",
		["Magtheridons Kammer"] = "Magtheridon's Lair",
		["H\195\182hle des Schlangenschreins"] = "Serpentshrine Lair",
		["Festung der St\195\188rme"] = "Tempest Keep: The Eye",
		["Hyjal der Vergangenheit"] = "Caverns Of Time",
		["Der Schwarze Tempel"] = "Black Temple",
		["Hyjalgipfel"] = "Battle of Mount Hyjal",
		["Zul'Aman"] = "Zul'Aman";
		["Sonnenbrunnenplateau"] = "Sunwell Plateau",
		-- TBC
--		["Sturmwind"] = "Sunwell Plateau",
--		["Wald von Elwynn"] = "Zul'Aman",
	};
		
	CT_RaidTracker_BossUnitTriggers = {
		["Taschendieb der Defias"] = "Lucifron",
		["Lucifron"] = "Lucifron",
		["Magmadar"] = "Magmadar",
		["Gehennas"] = "Gehennas",
		["Garr"] = "Garr",
		["Baron Geddon"] = "Baron Geddon",
		["Shazzrah"] = "Shazzrah",
		["Sulfuronherold"] = "Sulfuron Harbinger",
		["Golemagg der Verbrenner"] = "Golemagg the Incinerator",
		["Majordomus Executus"] = "Majordomo Executus",
		["Ragnaros"] = "Ragnaros",
		["Kernhund"] = "IGNORE",
		["Feueranbeter"] = "IGNORE",
		["Kernw\195\188terich"] = "IGNORE",
		["Flamewaker-Heiler"] = "IGNORE",
		["Flamewaker-Elite"] = "IGNORE",
		["Sohn der Flamme"] = "IGNORE",
		
		["Razorgore der Ungez\195\164hmte"] = "Razorgore the Untamed",
		["Vaelastrasz der Verdorbene"] = "Vaelastrasz the Corrupt",
		["Brutw\195\164chter Dreschbringer"] = "Broodlord Lashlayer",
		["Feuerschwinge"] = "Firemaw",
		["Schattenschwinge"] = "Ebonroc",
		["Flammenmaul"] = "Flamegor",
		["Chromaggus"] = "Chromaggus",
		["Nefarian"] = "Nefarian",
		["Lord Victor Nefarius"] = "Nefarian",
		["Grethok der Aufseher"] = "IGNORE",
		["Gardist der Pechschwingen"] = "IGNORE",
		["Legion\195\164r der Pechschwingen"] = "IGNORE",
		["Magier der Pechschwingen"] = "IGNORE",
		["Drachenbrut der Todeskrallen"] = "IGNORE",
		["Schwarzer Drakonid"] = "IGNORE",
		["Blauer Drakonid"] = "IGNORE",
		["Bronzener Drakonid"] = "IGNORE",
		["Gr\195\188ner Drakonid"] = "IGNORE",
		["Roter Drakonid"] = "IGNORE",
		["Prismatischer Drakonid"] = "IGNORE",
		["Knochenkonstrukt"] = "IGNORE",
		["Verdorbene H\195\182llenbestie"] = "IGNORE",
		["Verderbter blauer Welpe"] = "IGNORE",
		["Verderbter roter Welpe"] = "IGNORE",
		["Verderbter gr\195\188ner Welpe"] = "IGNORE",
		["Verderbter bronzener Welpe"] = "IGNORE",
		["Brutw\195\164chter der Todeskrallen"] = "IGNORE",
		["Zuchtmeister der Pechschwingen"] = "IGNORE",
		
		["Hohepriesterin Jeklik"] = "High Priestess Jeklik",
		["Hohepriester Venoxis"] =	"High Priest Venoxis",
		["Hohepriesterin Mar'li"] =	"High Priestess Mar'li",
		["Hohepriester Thekal"] = "High Priest Thekal",
		["Hohepriesterin Arlokk"] =	"High Priestess Arlokk",
		["Hakkar"] = "Hakkar",
		["Blutf\195\188rst Mandokir"] = "Bloodlord Mandokir",
		["Jin'do der Verhexer"] = "Jin'do the Hexxer",
		["Gahz'ranka"] = "Gahz'ranka",
		["Hazza'rah"] = "Hazza'rah",
		["Gri'lek"] = "Gri'lek",
		["Renataki"] = "Renataki",
		["Wushoolay"] = "Wushoolay",
		["Zulianischer Streuner"] = "IGNORE",
		["Zulianischer W\195\164chter"] = "IGNORE",
		["Schmarotzerschlange"] = "IGNORE",
		["Brut von Mar'li"] = "IGNORE",
		["Ohgan"] = "IGNORE",
		["Rasende Blutsucherfledermaus"] = "IGNORE",
		["Giftige Wolke"] = "IGNORE",
		
		["Kurinnaxx"] = "Kurinnaxx",
		["General Rajaxx"] = "General Rajaxx",
		["Ayamiss der J\195\164ger"] = "Ayamiss the Hunter",
		["Buru der Verschlinger"] = "Buru The Gorger",
		["Moam"] = "Moam",
		["Ossirian der Narbenlose"] = "Ossirian The Unscarred",
		["Ei von Buru"] = "IGNORE",
		["Kanalfrenzy"] = "IGNORE",
		["Manageist"] = "IGNORE",
		["Silikatfresser"] = "IGNORE",
		["Jungtier des Zaraschwarms"] = "IGNORE",
		["Larve des Zaraschwarms"] = "IGNORE",

		["Der Prophet Skeram"] = "The Prophet Skeram",
		["Fankriss der Unnachgiebige"] = "Fankriss the Unyielding",
		["Schlachtwache Sartura"] = "Battleguard Sartura",
		["Prinzessin Huhuran"] = "Princess Huhuran",
		["Imperator Vek'lor"] = "Twin Emperors",
		["Imperator Vek'nilash"] = "Twin Emperors",
		["C'Thun"] = "C'Thun",
		["Vem"] = "Vem",
		["Prinzessin Yauj"] = "Princess Yauj",
		["Lord Kri"] = "Lord Kri",
		["Viscidus"] = "Viscidus",
		["Ouro"] = "Ouro",
		["Skarab\195\164us von Ouro"] = "IGNORE",
		["Brut von Fankriss"] = "IGNORE",
		["Skorpion der Qiraji"] = "IGNORE",
		["Skarab\195\164us der Qiraji"] = "IGNORE",
		["\195\156bler Skarab\195\164us"] = "IGNORE",
		["Yaujbrut"] = "IGNORE",
		["Saturas K\195\182nigswache"] = "IGNORE",
		["Sarturas K\195\182nigswache"] = "IGNORE",
		["Jungtier der Vekniss"] = "IGNORE",
		["Krieger des Anubisath "] = "IGNORE",
		["Giftwolke"] = "IGNORE",
		["Drohne der Vekniss"] = "IGNORE",
		["Klumpen von Viscidus"] = "IGNORE",
		
		["Flickwerk"] = "Patchwerk",
		["Grobbulus"] = "Grobbulus",
		["Gluth"] = "Gluth",
		["Thaddius"] = "Thaddius",
		["Instrukteur Razuvious"] = "Instructor Razuvious",
		["Gothik der Seelenj\195\164ger"] = "Gothik the Harvester",
		["Hochlord Mograine"] = "Highlord Mograine",
		["Thane Korth'azz"] = "Thane Korth'azz",
		["Lady Blaumeux"] = "Lady Blaumeux",
		["Sire Zeliek"] = "Sir Zeliek",
		["Noth der Seuchenf\195\188rst"] = "Noth The Plaguebringer",
		["Heigan der Unreine"] = "Heigan the Unclean",
		["Loatheb"] = "Loatheb",
		["Anub'Rekhan"] = "Anub'Rekhan",
		["Gro\195\159witwe Faerlina"] = "Grand Widow Faerlina",
		["Maexxna"] = "Maexxna",
		["Sapphiron"] = "Sapphiron", -- needs translation
		["Kel'Thuzad"] = "Kel'Thuzad", -- needs translation
		["Gruftwache"] = "IGNORE",
		["Wolke von Grobbulus"] = "IGNORE",
		["Reservist der Todesritter"] = "IGNORE",
		["Made"] = "IGNORE",
		["Maexxnaspinnling"] = "IGNORE",
		["Verseuchter Krieger"] = "IGNORE",
		["Zombiefra\195\159"] = "IGNORE",
		["Leichenskarab\195\164us"] = "IGNORE",
		["Anh\195\164nger von Naxxramas"] = "IGNORE",
		["J\195\188nger von Naxxramas"] = "IGNORE",
		["Fangnetz"] = "IGNORE",
		["Verstrahlter Br\195\188hschleimer"] = "IGNORE",
		["Kranke Made"] = "IGNORE",
		["Faulende Made"] = "IGNORE",
		["Lebende Giftlache"] = "IGNORE",
		["Spore"] = "IGNORE",
		
		["Onyxia"] = "Onyxia",
		["Lord Kazzak"] = "Lord Kazzak",
		["Azuregos"] = "Azuregos",
		["Ysondre"] = "Ysondre",
		["Taerar"] = "Taerar",
		["Emeriss"] = "Emeriss",
		["Lethon"] = "Lethon",
		
		["Onyxia-Welpe"] = "IGNORE",
		["Onyxias W\195\164rter"] = "IGNORE",
		["Taerars Schemen"] = "IGNORE",
		["Geisterschatten"] = "IGNORE",
		["Verr\195\188ckter Druidengeist"] = "IGNORE",
		
		["Spotlight"] = "IGNORE",
		["Schabe"] = "IGNORE",
		["Natter"] = "IGNORE",
		["Braune Natter"] = "IGNORE",
		["Purpurrote Natter"] = "IGNORE",
		["Schwarze K\195\182nigsnatter"] = "IGNORE",
		["K\195\164fer"] = "IGNORE",
		["T\195\164uschk\195\164fer"] = "IGNORE",
		["Feuerk\195\164fer"] = "IGNORE",
		["Skorpion"] = "IGNORE",
		["Frosch"] = "IGNORE",
		["Fangzahnfrenzy"] = "IGNORE",
		["Opfertroll"] = "IGNORE",
		["Spinne"] = "IGNORE",
		["Ratte"] = "IGNORE",
		["Dschungelkr\195\182te"] = "IGNORE",
		["Feldreparaturbot-74A"] = "IGNORE",
		
		-- TBC
		["Verdammnislord Kazzak"] = "Doom Lord Kazzak",
		["Hochlord Kazzak"] = "Highlord Kruul",
		["Verdammniswandler"] = "Doomwalker",
		-- Karazhan
		["Attumen der J\195\164ger"] = "Attumen the Huntsman",
		["Tugendhafte Maid"] = "Maiden of Virtue",
		["Moroes"] = "Moroes",
			["Baron Rafe Dreuger"] = "IGNORE", -- Moroes add
			["Baroness Dorothea M\195\188hlenstein"] = "IGNORE", -- Moroes add
			["Lady Catriona Von'Indi"] = "IGNORE", -- Moroes add
			["Lady Keira Beerhas"] = "IGNORE", -- Moroes add
			["Lord Crispin Ference"] = "IGNORE", -- Moroes add
			["Lord Robin Daris"] = "IGNORE", -- Moroes add
		["Nethergroll"] = "Netherspite",
		["Schrecken der Nacht"] = "Nightbane",
		["Prinz Malchezaar"] = "Prince Malchezaar",
		["Arans Schemen"] = "Shade of Aran",
		["Terestian Siechhuf"] = "Terestian Illhoof",
		["Kil'rek"] = "IGNORE",
		["Der gro\195\159e b\195\182se Wolf"] = "The Big Bad Wolf",
		["Die b\195\182se Hexe"] = "The Crone",
		["Der Kurator"] = "The Curator",
		["Rokad der Verheerer"] = "Rokad the Ravager",
		["Hyakiss der Lauerer"] = "Hyakiss the Lurker",
		["Shadidkith der Gleiter"] = "Shadikith the Glider",
		["Schach Event"] = "Chess Event",
		["Julianne"] = "Romulo and Julianne",
		["Romulo"] = "IGNORE",
		["Echo Medivhs"] = "Echo of Medivh",
		["Abbild von Medivh"] = "Image of Medivh",			
		-- Zul'Aman
		["Nalorakk"] = "Nalorakk",	
		["Akil'zon"] = "Akil'zon",	
		["Jan'alai"] = "Jan'alai",	
		["Halazzi"] = "Halazzi",	
		["Witch Doctor"] = "Witch Doctor",	
		["Hexlord Malacrass"] = "Hex Lord Malacrass",	
		["Zul'jin"] = "Zul'jin",			
		-- Gruul
		["Hochk\195\182nig Maulgar"] = "High King Maulgar",
		["Gruul der Drachenschl\195\164chter"] = "Gruul the Dragonkiller",
		["Blindauge der Seher"] = "IGNORE",
		["Gicherer der Wahnsinnige"] = "IGNORE",
		["Krosh Feuerhand"] = "IGNORE",
		["Olm der Beschw\195\182rer"] = "IGNORE",
		--Magtheridon
		["Magtheridon"] = "Magtheridon",
		["H\195\182llenfeuerw\195\164rter"] = "IGNORE",
		["Kanalisierer d3es H\195\182llenfeuers"] = "IGNORE",
		
		--Serpentshrine Cavern
		["Hydross der Unstete"] = "Hydross the Unstable",
		["Das Grauen aus der Tiefe"] = "The Lurker Below",
		["Leotheras der Blinde"] = "Leotheras the Blind",
		["Tiefenlord Karathress"] = "Fathom-Lord Karathress",
		["Morogrim Gezeitenwandler"] = "Morogrim Tidewalker",
		["Lady Vashj"] = "Lady Vashj",
		
		-- Bossadds
			-- Hydross Adds
      ["Gereinigter Nachkomme Hydross"] = "IGNORE", -- Pure Spawn of Hydross
      ["Besudelter Nachkomme Hydross"] = "IGNORE", -- Tainted Spawn of Hydross
      ["Besudelter Wasserelementar"] = "IGNORE", -- Tainted Water Elemental
      ["Gel\195\164uterter Wasserelementar"] = "IGNORE", -- Purified Water Elemental  
      
      -- Morogrim Adds
      ["Lauerer der Gezeitenwandler"] = "IGNORE", -- Tidewalker Lurker
      ["Wasserkugel"] = "IGNORE", -- Water Globule (Waterbubbles Tidewalker summons at 25%) 

			-- Fathom-Lord Karathress Adds
			["Feuerspuckendes Totem"] = "IGNORE", -- Spitfire Totem
			["Großes Totem der Erdbindung"] = "IGNORE", -- Greater Earthbind Totem
			["Großes Totem der Giftreinigung"] = "IGNORE", -- Greater Poison Cleansing Totem
			["Tiefenlauerer"] = "IGNORE", -- Fathom Lurker
			["Tiefensegler"] = "IGNORE", -- Fathom Sporebat
			["Tiefenw\195\164chter Caribdis"] = "IGNORE", -- Fathom-Guard Caribdis
			["Tiefenw\195\164chter Flutvess"] = "IGNORE", -- Fathom-Guard Tidalvess
			["Tiefenw\195\164chter Haikis"] = "IGNORE", -- Fathom-Guard Sharkkis
			
			-- The Lurker Below Adds
			["W\195\164chter des Echsenkessels"] = "IGNORE", -- Coilfang Guardian
			["Wegelagerer des Echsenkessels"] = "IGNORE", -- Coilfang Ambusher
			
			-- Leotheras the Blind Adds
			["Innerer D\195\164mon"] = "IGNORE", -- Inner Demon
			
      -- Vashj Adds
      ["Toxischer Sporensegler"] = "IGNORE",  -- Toxic Spore Bat
      ["Besudelter Elementar"] = "IGNORE", -- Tainted Elemental
      ["Elitesoldat des Echsenkessels"] = "IGNORE", -- Coilfang Elite
      ["Schreiter des Echsenkessels"] = "IGNORE", -- Coilfang Strider
      ["Verzauberter Elementar"] = "IGNORE", -- Enchanted Elemental		

 
      -- SSC Trashmobs 
      ["Bestienb\195\164ndiger des Echsenkessels"] = "IGNORE",	-- Coilfang Beast-Tamer
      ["Ehrenwache der Vashj'ir"] = "IGNORE",	-- Vashj'ir Honor Guard
      ["Gezeitenrufer der Grauherzen"] = "IGNORE", -- Greyheart Tidecaller
      ["Harpunenk\195\164mpfer der Gezeitenwandler"] = "IGNORE", -- Tidewalker Harpooner
      ["Hasssch\195\188rer des Echsenkessels"] = "IGNORE", -- Coilfang Hate-Screamer
      ["Krieger der Gezeitenwandler"] = "IGNORE", -- Tidewalker Warrior
      ["Lauerer des Schlangenschreins"] = "IGNORE", -- Serpentshrine Lurker
      ["Nethermagier der Grauherzen"] = "IGNORE", -- Greyheart Nether-Mage
      ["Priesterin des Echsenkessels"] = "IGNORE", -- Coilfang Priestess
      ["Schamane der Gezeitenwandler"] = "IGNORE", -- Tidewalker Shaman
      ["Schildtr\195\164ger der Grauherzen"] = "IGNORE", -- Greyheart Shield-Bearer
      ["Schlangenwache des Echsenkessels"] = "IGNORE", -- Coilfang Serpentguard
      ["Schleicher der Grauherzen"] = "IGNORE", -- Greyheart Skulker
      ["Sporensegler des Echsenkessels"] = "IGNORE", -- Serpentshrine Sporebat
      ["Techniker der Grauherzen"] = "IGNORE", -- Greyheart Technician
      ["Tiefenhexe des Echsenkessels"] = "IGNORE", -- Coilfang Fathom-Witch
      ["Tiefenseher der Gezeitenwandler"] = "IGNORE", -- Tidewalker Depth-Seer
      ["Tiefensumpfkoloss"] = "IGNORE", -- Underbog Colossus
      ["Wasserbeschw\195\182rer der Gezeitenwandler"] = "IGNORE", -- Tidewalker Hydromancer
      ["Zertr\195\188mmerer des Echsenkessels"] = "IGNORE", -- Coilfang Shatterer
      
      -- SSC Trashmobs without loot
			["Echsenkesselfrenzy"] = "IGNORE", -- Coilfang Frenzy
			["Gezeitenrufer des Schlangenschreins"] = "IGNORE", -- Serpentshrine Tidecaller
			["Kolosslauerer"] = "IGNORE", -- Colossus Lurker
			["Kolossw\195\188ter"] = "IGNORE", -- Colossus Rager
			["Parasit des Schlangenschreins"] = "IGNORE", -- Serpentshrine Parasite
			["Tiefensumpfpilz"] = "IGNORE", -- Underbog Mushroom
			["Totem des Wasserelementars"] = "IGNORE", -- Water Elemental Totem
			["Zauberbinder der Grauherzen"] = "IGNORE", -- Greyheart Spellbinder
			["Geist einer Priesterin"] = "IGNORE", -- Priestess Spirit		
		
		--Black Temple
			["Oberster Kriegsf\195\188rst Naj'entus"] = "High Warlord Naj'entus",
			["Supremus"] = "Supremus",
			["Gurtogg Siedeblut"] = "Gurtogg Bloodboil",
			["Teron Blutschatten"] = "Teron Gorefiend",
			["Akamas Schemen"] = "Shade of Akama",
			["Reliquium der Seelen"] = "Reliquary of Souls",
			 ["Essenz der Seelen"] = "Reliquary of Souls",
			 ["Essenz der Begierde"] = "Reliquary of Souls",
			 ["Essenz des Zorns"] = "Reliquary of Souls",
             --
			["Mutter Shahraz"] = "Mother Shahraz",
			["Rat der Illidari"] = "Illidari Council",
			  ["Gathios der Zerschmetterer"] = "Illidari Council",
			  ["Hochnethermant Zerevor"] = "Illidari Council",
			  ["Lady Malande"] = "Illidari Council",
			  ["Veras Schwarzschatten"] = "Illidari Council",
			["Illidan Sturmgrimm"] = "Illidan Stormrage",
			["F\195\188rst Illidan Sturmgrimm"] = "Lord Illidan Stormrage",   

		--Tempest Keep: The Eye
		["Al'ar"] = "Al'ar",
		["Hochastromant Solarian"] = "High Astromancer Solarian",	
		["Hochastronom Solarian"] = "High Astromancer Solarian",	
		["Leerh\195\164scher"] = "Void Reaver",
		["Kael'thas Sonnenwanderer"] = "Kael'thas Sunstrider", --todo
			-- Bossadds
			-- Al'ar Adds
			["Al'ars Asche"] = "IGNORE", -- Ember of Al'ar
			-- Astromancer Adds
			["Solarisagent"] = "IGNORE", -- Solarium Agent
			["Solarispriester"] = "IGNORE", -- Solarium Priest
			-- Kael'thas Adds
			["F\195\188rst Blutdurst"] = "IGNORE", -- Lord Sanguinar
			["Großastronom Capernian"] = "IGNORE", -- Grand Astromancer Capernian  
			["Meisteringenieur Telonicus"] = "IGNORE", -- Master Engineer Telonicus
			["Ph\195\182nixei"] = "IGNORE", -- Phoenix Egg
			["Ph\195\182nix"] = "IGNORE", -- Phoenix
			["Thaladred der Verfinsterer"] = "IGNORE", -- Thaladred the Darkener
			-- Kael'thas Weapons
			["Klinge der Unendlichkeit"] = "IGNORE", -- Infinity Blades
			["Kosmische Macht"] = "IGNORE", -- Cosmic Infuser
			["Netherbespannter Langbogen"] = "IGNORE", -- Netherstrand Longbow
			["Phasenverschobenes Bollwerk"] = "IGNORE", -- Phaseshift Bulwark
			["Stab der Aufl\195\182sung"] = "IGNORE", -- Staff of Disintegration
			["Verw\195\188stung"] = "IGNORE", -- Devastation
			["Warpschnitter"] = "IGNORE", -- Warp Slicer
			-- TK Trash
			["Astronom"] = "IGNORE", -- Astromancer
			["Astronomlord"] = "IGNORE", -- Astromancer Lord
			["Astronomnovize"] = "IGNORE", -- Novice Astromancer
			["Blutritter der Purpurhand"] = "IGNORE", -- Crimson Hand Blood Knight
			["Falkner der St\195\188rme"] = "IGNORE", -- Tempest Falconer
			["Inquisitor der Purpurhand"] = "IGNORE", -- Crimson Hand Inquisitor
			["Kampfmagier der Purpurhand"] = "IGNORE", -- Crimson Hand Battle Mage
			["Knappe der Blutw\195\164rter"] = "IGNORE", -- Bloodwarder Squire
			["Kristallkernmechaniker"] = "IGNORE", -- Crystalcore Mechanic
			["Kristallkernschildwache"] = "IGNORE", -- Crystalcore Sentinel
			["Kristallkernverw\195\188ster"] = "IGNORE", -- Crystalcore Devastator
			["Legion\195\164r der Blutw\195\164rter"] = "IGNORE", -- Bloodwarder Legionnaire
			["Marschall der Blutw\195\164rter"] = "IGNORE", -- Bloodwarder Marshal
			["Netherseher"] = "IGNORE", -- Nether Scryer
			["Ph\195\182nixfalkenjunges"] = "IGNORE", -- Phoenix-Hawk Hatchling
			["Ph\195\182nixfalke"] = "IGNORE", -- Phoenix-Hawk
			["Schmied der St\195\188rme"] = "IGNORE", -- Tempest-Smith
			["Sternenseher"] = "IGNORE", -- Star Scryer
			["Sternenseherlehrling"] = "IGNORE", -- Apprentice Star Scryer
			["Verteidiger der Blutw\195\164rter"] = "IGNORE", -- Bloodwarder Vindicator
			["Zenturio der Purpurhand"] = "IGNORE", -- Crimson Hand Centurion
		
		--Battle of Mount Hyjal
		["Furor Winterfrost"] = "Rage Winterchill",
		["Anetheron"] = "Anetheron",
		["Kaz'rogal"] = "Kaz'rogal",
		["Azgalor"] = "Azgalor",
		["Archimonde"] = "Archimonde",
   
		--Sunwell Plateau
		["Kalecgos"] =  "IGNORE", -- Kalecgos
			["Sathrovarr the Corruptor"] = "Sathrovarr the Corruptor",
			["Sathrovarr the Corruptor"] = "Kalecgos",
		["Brutallus"] = "Brutallus",
			["Madrigosa"] = "IGNORE", -- Madrigosa	
		["Teufelsruch"] = "Felmyst",
		["Lady Sacrolash"] = "Eredar Twins",
		["Grand Warlock Alythess"] = "Eredar Twins",
		["Entropius"] = "Entropius",
		["Kil'jaeden"] = "Kil'jaeden",	
		["M'uru"] = "IGNORE",
		["Shadowsword Berserker"] = "IGNORE", -- Shadowsword Berserker
		["Shadowsword Fury Mage"] = "IGNORE", -- Shadowsword Fury Mage
		["Void Sentinel"] = "IGNORE", -- Void Sentinel
		["Void Spawn"] = "IGNORE", -- Void Spawn	
		-- TBC		
		
		["DEFAULTBOSS"] = "Trash mob",
	};
	
	CT_RaidTracker_lang_BossKills_Majordomo_Yell = "Unm\195\182glich! Haltet ein, Sterbliche... Ich gebe auf! Ich gebe auf!";
	CT_RaidTracker_lang_BossKills_Majordomo_BossName = "Majordomus Executus";
	CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "Ich bin frei! Dieses Ger\195\164t wird mich niemals wieder qu\195\164len!";
	CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben.";
	CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "Schach Event";
	CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "O willkommener Dolch! Dies werde deine Scheide. Roste da und lass mich sterben!"; -- need english translation
	CT_RaidTracker_lang_BossKills_Julianne_BossName = "Julianne";
	CT_RaidTracker_lang_BossKills_Sathrovarr_Yell = "Ich bin niemals auf der... Verlierer... seite!";
	CT_RaidTracker_lang_BossKills_Sathrovarr_BossName = "Sathrovarr der Verderber";

--	CT_RaidTracker_lang_BossKills_Ignore_Julianne_Yell = "Ich komme, Romulo! Oh... dies trink' ich dir!";
--	CT_RaidTracker_lang_BossKills_Ignore_Romulo_Yell = "Und du l\195\164chelst zu dem Streich, der mich ermordet.";

elseif (GetLocale() == "frFR") then
	CT_RaidTracker_lang_LeftGroup = "([^%s]+) a quitt\195\169 le groupe de raid";
	CT_RaidTracker_lang_JoinedGroup = "([^%s]+) a rejoint le group de raid";
	CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+) re\195\167oit le butin.+: "..CT_ITEMREG..".";
	CT_RaidTracker_lang_ReceivesLoot2 = "Vous recevez le butin.+: "..CT_ITEMREG..".";
	CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+) re\195\167oit le butin.+: "..CT_ITEMREG_MULTI..".";
	CT_RaidTracker_lang_ReceivesLoot4 = "Vous recevez le butin.+: "..CT_ITEMREG_MULTI..".";
	CT_RaidTracker_lang_ReceivesLootYou = "Vous";
	
	CT_RaidTracker_ZoneTriggers = {
		["C\197\147ur du Magma"] = "Molten Core",
		["Repaire de l'Aile noire"] = "Blackwing Lair",
		["Zul'Gurub"] = "Zul'Gurub",
		["Repaire d'Onyxia"] = "Onyxia's Lair",
		["Ruines d'Ahn'Qiraj"] = "Ahn'Qiraj Ruins",
		["Ahn'Qiraj"] = "Ahn'Qiraj Temple",
		["Naxxramas"] = "Naxxramas",
		
		-- TBC
			["Karazhan"] = "Karazhan",
			["Repaire de Gruul"] = "Gruul's Lair",
			["Le repaire de Magtheridon"] = "Magtheridon's Lair",
			["Caverne du sanctuaire du Serpent"] = "Serpentshrine Lair",
			["Donjon de la Temp\195\170te"] = "Tempest Keep: The Eye",
			["Grote des temps"] = "Caverns Of Time",
      ["Temple noir"] = "Black Temple",  -- Working
      ["Sommet d'Hyjal"] = "Battle of Mount Hyjal",  -- Working
			["Zul'Aman"] = "Zul'Aman",
			["Sonnenbrunnenplateau"] = "Sunwell Plateau",
		-- TBC		
	};
	
	CT_RaidTracker_BossUnitTriggers = {
		["Lucifron"] = "Lucifron",
		["Magmadar"] = "Magmadar",
		["Gehennas"] = "Gehennas",
		["Garr"] = "Garr",
		["Baron Geddon"] = "Baron Geddon",
		["Shazzrah"] = "Shazzrah",
		["Messager de Sulfuron"] = "Sulfuron Harbinger",
		["Golemagg l'Incin\195\169rateur"] = "Golemagg the Incinerator",
		["Chambellan Executus"] = "Majordomo Executus",
		["Ragnaros"] = "Ragnaros",
		["Chien du Magma"] = "IGNORE",
		["Lige du feu"] = "IGNORE",
		["Rageur du Magma"] = "IGNORE",
		["Soigneur Flamewaker"] = "IGNORE",
		["Elite Flamewaker"] = "IGNORE",
		["Fils des flammes"] = "IGNORE",
		
		["Razorgore l'Indompt\195\169"] = "Razorgore the Untamed",
		["Caelastrasz le Corrumpu"] = "Vaelastrasz the Corrupt",
		["Seigneur des couv\195\169es Lashslayer"] = "Broodlord Lashlayer",
		["Gueule-de-feu"] = "Firemaw",
		["Ebonroc"] = "Ebonroc",
		["Flamegor"] = "Flamegor",
		["Chromaggus"] = "Chromaggus",
		["Nefarian"] = "Nefarian",
		["Seigneur Victor Nefarius"] = "Nefarian",
		["Grethok le Contr\195\180leur"] = "IGNORE",
		["Garde de l'Aile noire"] = "IGNORE",
		["L\195\169gionnaire de l'Aile noire"] = "IGNORE",
		["Mage de l'Aile noire"] = "IGNORE",
		["Draconide Griffemort"] = "IGNORE",
		["Drak\195\180nide noir"] = "IGNORE",
		["Drak\195\180nide bleu"] = "IGNORE",
		["Drak\195\180nide bronze"] = "IGNORE",
		["Drak\195\180nide vert"] = "IGNORE",
		["Drak\195\180nide rouge"] = "IGNORE",
		["Drak\195\180nide chromatique"] = "IGNORE",
		["Assemblage d'os"] = "IGNORE",
		["Infernal corrompu"] = "IGNORE",
		["Dragonnet bleu corrompu"] = "IGNORE",
		["Dragonnet rouge corrompu"] = "IGNORE",
		["Dragonnet vert corrompu"] = "IGNORE",
		["Dragonnet bronze corrompu"] = "IGNORE",
		["Eveilleur Griffemort"] = "IGNORE",
		["Contrema\195\174tre de l'Aile noire"] = "IGNORE",
		["Nuage toxique"] = "IGNORE",
		
		["Grande pr\195\170tresse Jeklik"] = "High Priestess Jeklik",
		["Grand pr\195\170tre Venoxis"] =	"High Priest Venoxis",
		["Grande pr\195\170tresse Mar'li"] =	"High Priestess Mar'li",
		["Grand pr\195\170tre Thekal"] = "High Priest Thekal",
		["Grande pr\195\170tresse Arlokk"] =	"High Priestess Arlokk",
		["Hakkar"] = "Hakkar",
		["Seigneur sanglant Mandokir"] = "Bloodlord Mandokir",
		["Jin'do le Mal\195\169ficieur"] = "Jin'do the Hexxer",
		["Gahz'ranka"] = "Gahz'ranka",
		["Hazza'rah"] = "Hazza'rah",
		["Gri'lek"] = "Gri'lek",
		["Renataki"] = "Renataki",
		["Wushoolay"] = "Wushoolay",
		["R\195\180deur zulien"] = "IGNORE",
		["Gardien zulien"] = "IGNORE",
		["Serpent parasite"] = "IGNORE",
		["Rejetons de Mar'li"] = "IGNORE",
		["Ohgan"] = "IGNORE",
		["Chauve-souris sanguinaire fr\195\169n\195\169tique"] = "IGNORE",
		
		["Kurinnaxx"] = "Kurinnaxx",
		["G\195\169n\195\169ral Rajaxx"] = "General Rajaxx",
		["Ayamiss le Chasseur"] = "Ayamiss the Hunter",
		["Buru Grandgosier"] = "Buru the Gorger",
		["Moam"] = "Moam",
		["Ossirian l'Intouch\195\169"] = "Ossirian the Unscarred",
		["\197\146uf de Buru"] = "IGNORE",
		["Furie des canaux"] = "IGNORE",
		["D\195\169mon de mana"] = "IGNORE",
		["Nourrisseur silicieux"] = "IGNORE",
		["Jeune de la Ruche'Zara"] = "IGNORE",
		["Larve de la Ruche'Zara"] = "IGNORE",
				
		["Le Proph\195\168te Skeram"] = "The Prophet Skeram",
		["Fankriss l'Inflexible"] = "Fankriss the Unyielding",
		["Garde de guerre Sartura"] = "Battleguard Sartura",
		["Princesse Huhuran"] = "Princess Huhuran",
		["Empereur Vek'lor"] = "Twin Emperors",
		["Empereur Vek'nilash"] = "Twin Emperors",
		["C'Thun"] = "C'Thun",
		["Vem"] = "Vem",
		["Princesse Yauj "] = "Princess Yauj",
		["Seigneur Kri"] = "Lord Kri",
		["Viscidus"] = "Viscidus",
		["Ouro"] = "Ouro",
		["Scarab\195\169e d'Ouro"] = "IGNORE",
		["Rejeton de Fankriss"] = "IGNORE",
		["Scorpion qiraji"] = "IGNORE",
		["Scarab\195\169e qiraji"] = "IGNORE",
		["Scarab\195\169e vil"] = "IGNORE",
		["Rejeton de Yauj"] = "IGNORE",
		["Garde royal de Sartura"] = "IGNORE",
		["Jeune vekniss"] = "IGNORE",
		["Guerrier Anubisath"] = "IGNORE",
		["Nuage empoisonn\195\169"] = "IGNORE",
		["Bourdon vekniss"] = "IGNORE",
		["Globule de Viscidus"] = "IGNORE",
		
		["Le Recousu"] = "Patchwerk",
		["Grobbulus"] = "Grobbulus",
		["Gluth"] = "Gluth",
		["Thaddius"] = "Thaddius",
		["Instructeur Razuvious"] = "Instructor Razuvious",
		["Gothik le Moissonneur"] = "Gothik the Harvester",
		["Généralissime Mograine"] = "Highlord Mograine",
		["Thane Korth'azz"] = "Thane Korth'azz",
		["Dame Blaumeux"] = "Lady Blaumeux",
		["Sire Zeliek"] = "Sir Zeliek",
		["Noth le Porte-peste"] = "Noth The Plaguebringer",
		["Heigan l'Impur"] = "Heigan the Unclean",
		["Horreb"] = "Loatheb",
		["Anub'Rekhan"] = "Anub'Rekhan",
		["Grande veuve Faerlina"] = "Grand Widow Faerlina",
		["Maexxna"] = "Maexxna",
		["Sapphiron"] = "Sapphiron",
		["Kel'Thuzad"] = "Kel'Thuzad",
		["Gardien des cryptes"] = "IGNORE",
		["Nuage de Grobbulus"] = "IGNORE",
		["Doublure de chevalier de la mort"] = "IGNORE",
		["Asticot "] = "IGNORE",
		["Jeune araign\195\169e de Maexxna"] = "IGNORE",
		["Guerrier pestif\195\169r\195\169"] = "IGNORE",
		["Croq'zombie"] = "IGNORE",
		["Scarab\195\169e mange-cadavres"] = "IGNORE",
		["Suivant de Naxxramas"] = "IGNORE",
		["Adorateur de Naxxramas"] = "IGNORE",
		["Entoilage"] = "IGNORE",
		["Gel\195\169e pollu\195\169e"] = "IGNORE",
		["Asticot malade"] = "IGNORE",
		["Asticot pourrissant"] = "IGNORE",
		["Poison vivant"] = "IGNORE",
		["Spore"] = "IGNORE",
		
		["Onyxia"] = "Onyxia",
		["Seigneur Kazzak"] = "Lord Kazzak",
		["Azuregos"] = "Azuregos",
		["Ysondre"] = "Ysondre",
		["Taerar"] = "Taerar",
		["Emeriss"] = "Emeriss",
		["L\195\169thon"] = "Lethon",
		
		["Dragonnet d'onyx"] = "IGNORE",
		["Gardien d'onyx"] = "IGNORE",
		["Ombre de Taerar"] = "IGNORE",
		["Ombre spirituelle"] = "IGNORE",
		["Esprit de druide d\195\169ment"] = "IGNORE",
		
		["Tache de lumi\195\168re"] = "IGNORE",
		["Blatte"] = "IGNORE",
		["Serpent"] = "IGNORE",
		["Serpent brun"] = "IGNORE",
		["Serpent cramoisi"] = "IGNORE",
		["Cobra noir"] = "IGNORE",
		["Hanneton"] = "IGNORE",
		["Blatte m\195\169canique"] = "IGNORE",
		["Hanneton de feu"] = "IGNORE",
		["Scorpion"] = "IGNORE",
		["Grenouille"] = "IGNORE",
		["Crochedents fr\195\169n\195\169tique"] = "IGNORE",
		["Troll sacrifi\195\169"] = "IGNORE",
		["Araign\195\169e"] = "IGNORE",
		["Rat"] = "IGNORE",
		["Crapaud de la jungle"] = "IGNORE",
		["Robot r\195\169parateur 74A"] = "IGNORE",
		-- tbc
		["G\195\169n\195\169eralissime Kruul"] = "Highlord Kruul",			
		
		-- TBC : Karazhan
		["Attumen le Veneur"]="Attumen the Huntsman",
		["Doroth\195\169e"]="Dorothee",
		["Damoiselle de vertu"]="Maiden of Virtue",
		["Minuit"]="Midnight",
		["Moroes"]="Moroes",
			["Baron Rafe Dreuger"] = "IGNORE", -- Moroes add
			["Baronne Dorothea Millstipe"] = "IGNORE", -- Moroes add
			["Dame Catriona Von'Indi"] = "IGNORE", -- Moroes add
			["Dame Keira Berrybuck"] = "IGNORE", -- Moroes add
			["Seigneur Crispin Ference"] = "IGNORE", -- Moroes add
			["Seigneur Robin Daris"] = "IGNORE", -- Moroes add
		["D\195\169dain-du-N\195\169ant"]="Netherspite",
		["Plaie-de-nuit"]="Nightbane",
		["Prince Malchezaar"]="Prince Malchezaar",
		["Ombre d'Aran"]="Shade of Aran",
		["Terestian Malsabot"]="Terestian Illhoof",
		["Kil'rek"] = "IGNORE",
		["Le Grand M\195\169chant Loup"]="The Big Bad Wolf",
		["La M\195\169g\195\168re"]="The Crone",
		["Le conservateur"]="The Curator",
		["Rodak le ravageur"]="Rokad the Ravager",
		["Hyakiss la R\195\180deuse"]="Hyakiss the Lurker",
		["Shadikith le glisseur"]="Shadikith the Glider",
		["Julianne"]="Romulo and Julianne",
		["Romulo"]="IGNORE",
		
		["Chess Event"]="Chess Event", -- translation needed
		-- Zul'Aman
		["Nalorakk"] = "Nalorakk",	
		["Akil'Zon"] = "Akil'zon",	
		["Jan'Alai"] = "Jan'alai",	
		["Halazzi"] = "Halazzi",	
		["Witch Doctor"] = "Witch Doctor",	
		["Seigneur des mal\195\169fices Malacrass"] = "Hex Lord Malacrass",	
		["Zul'jin"] = "Zul'jin",			
		-- TBC : Grull
		["Haut Roi Maulgar"]="High King Maulgar",
		["Gruul le Tue-dragon"]="Gruul the Dragonkiller",
		["Oeillaveugle le Voyant"]="IGNORE", -- maulgar add
		["Kiggler le Cingl\195\169"]="IGNORE", -- maulgar add
		["Krosh Brasemain"]="IGNORE", -- maulgar add
		["Olm l'Invocateur"]="IGNORE", -- maulgar add		

    -- Magtheridon
	  ["Magtheridon"] = "Magtheridon",
	  ["Canaliste des Flammes infernales"] = "IGNORE",
    ["Gardien des flammes infernales"] = "IGNORE",

		["Seigneur funeste Kazzak"] = "Doom Lord Kazzak",
		["Marche-funeste"] = "Doomwalker",	
		
		--Serpentshrine Cavern
		["Hydross l'Instable"] = "Hydross the Unstable",
		["Le R\195\180deur d'En-bas"] = "The Lurker Below",
		["Leotheras l'Aveugle"] = "Leotheras the Blind",
		["Seigneur des fonds Karathress"] = "Fathom-Lord Karathress",
		["Morogrim Marcheur-des-flots"] = "Morogrim Tidewalker",
		["Dame Vashj"] = "Lady Vashj",
		
		--Black Temple
    ["Grand seigneur de guerre Naj'entus"] = "High Warlord Naj'entus",
    ["Supremus"] = "Supremus",
    ["Gurtogg Fi\195\168vresang"] = "Gurtogg Bloodboil",
    ["Teron Fielsang"] = "Teron Gorefiend",
    ["Ombre d'Akama"] = "Shade of Akama",
    ["Essence de la col\195\168re"] = "Essence of Souls",
    ["M\195\168re Shahraz"] = "Mother Shahraz",
    ["Conseil illidari"] = "Illidari Council", -- need translation
    ["Illidan Hurlorage"] = "Illidan Stormrage",
    ["Seigneur Illidan Hurlorage"] = "Lord Illidan Stormrage",      
		
		--Tempest Keep: The Eye
		["Al'ar"] = "Al'ar",
		["Grande astromancienne Solarian"] = "High Astromancer Solarian",
		["Saccageur du Vide"] = "Void Reaver", --todo
		["Kael'thas Haut-soleil"] = "Kael'thas Sunstrider", --todo
	
		--Battle of Mount Hyjal
    ["Rage Froidhiver"] = "Rage Winterchill",
    ["Anetheron"] = "Anetheron",
    ["Kaz'rogal"] = "Kaz'rogal",
    ["Azgalor"] = "Azgalor",
    ["Archimonde"] = "Archimonde",
			
		--Sunwell Plateau
		["Kalecgos"] =  "IGNORE", -- Kalecgos
			["Sathrovarr the Corruptor"] = "Sathrovarr the Corruptor",
			["Sathrovarr the Corruptor"] = "Kalecgos",
		["Brutallus"] = "Brutallus",
			["Madrigosa"] = "IGNORE", -- Madrigosa	
		["Felmyst"] = "Felmyst",
		["Lady Sacrolash"] = "Eredar Twins",
		["Grand Warlock Alythess"] = "Eredar Twins",
		["Entropius"] = "Entropius",
		["Kil'jaeden"] = "Kil'jaeden",	
		["M'uru"] = "IGNORE",
		["Shadowsword Berserker"] = "IGNORE", -- Shadowsword Berserker
		["Shadowsword Fury Mage"] = "IGNORE", -- Shadowsword Fury Mage
		["Void Sentinel"] = "IGNORE", -- Void Sentinel
		["Void Spawn"] = "IGNORE", -- Void Spawn

		
		-- tbc
		["DEFAULTBOSS"] = "Trash mob",
	};
	
	CT_RaidTracker_lang_BossKills_Majordomo_Yell = "Impossible ! Arr\195\170tez votre attaque, mortels... Je me rends ! Je me rends !";
	CT_RaidTracker_lang_BossKills_Majordomo_BossName = "Majordome Executus";
	CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben."; -- need france translation
	--CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Les salles de Karazhan tremblent, tandis qu'est lev\195\169e la mal\195\169diction qui scellait les portes du hall du Flambeur.";
	CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "Chess Event";
	CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "Je suis libre ! Cet instrument ne me torturera plus jamais !";
	CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "O willkommener Dolch! Dies werde deine Scheide. Roste da und lass mich sterben!"; -- need english translation
	CT_RaidTracker_lang_BossKills_Julianne_BossName = "Julianne";	
--	CT_RaidTracker_lang_BossKills_Ignore_Julianne_Yell = "Ich komme, Romulo! Oh... dies trink' ich dir!"; -- need france translation
--	CT_RaidTracker_lang_BossKills_Ignore_Romulo_Yell = "Und du l\195\164chelst zu dem Streich, der mich ermordet.";	-- need france translation
	CT_RaidTracker_lang_BossKills_Sathrovarr_Yell = "I'm... never on... the losing... side..."; -- need france translation
	CT_RaidTracker_lang_BossKills_Sathrovarr_BossName = "Sathrovarr the Corruptor"; -- need france translation

elseif (GetLocale() == "esES") then
	CT_RaidTracker_lang_LeftGroup = "([^%s]+) se ha marchado de la banda."; 
	CT_RaidTracker_lang_JoinedGroup = "([^%s]+) se ha unido a la banda."; 
	CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+) recibe el bot\195\173n: "..CT_ITEMREG.."."; 
	CT_RaidTracker_lang_ReceivesLoot2 = "Recibes bot\195\173n: "..CT_ITEMREG.."."; 
	CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+) recibe el bot\195\173n: "..CT_ITEMREG_MULTI.."."; 
	CT_RaidTracker_lang_ReceivesLoot4 = "Recibes bot\195\173n: "..CT_ITEMREG_MULTI.."."; 
	CT_RaidTracker_lang_ReceivesLootYou = "Recibes";	
	
	CT_RaidTracker_ZoneTriggers = {
		["NÃºcleo de Magma"] = "Molten Core",
		["Guarida Alanegra"] = "Blackwing Lair",
		["Zul'Gurub"] = "Zul'Gurub",
		["Guarida de Onyxia"] = "Onyxia's Lair",
		["Ruinas de Ahn'Qiraj"] = "Ahn'Qiraj Ruins",
		["Ahn'Qiraj"] = "Ahn'Qiraj Temple",
		["Naxxramas"] = "Naxxramas",
		
		-- TBC
			["Karazhan"] = "Karazhan",
			["Guarida de Gruul"] = "Gruul's Lair",
			["Guarida de Magtheridon"] = "Magtheridon's Lair",
			["Caverne du sanctuaire du Serpent"] = "Serpentshrine Cavern",
			["Donjon de la Tempête"] = "Tempest Keep: The Eye",
			["Cavernas del Tiempo"] = "Caverns Of Time",
			["El Templo Oscuro"] = "Black Temple",
			["Hyjal"] = "Battle of Mount Hyjal",
			["Zul'Aman"] = "Zul'Aman";
		-- TBC		
	};
	
	CT_RaidTracker_lang_BossKills_Majordomo_Yell = "Impossible ! Arr\195\170tez votre attaque, mortels... Je me rends ! Je me rends !";
	CT_RaidTracker_lang_BossKills_Majordomo_BossName = "Majordome Executus";
	CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben."; -- need france translation
	--CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Les salles de Karazhan tremblent, tandis qu'est lev\195\169e la mal\195\169diction qui scellait les portes du hall du Flambeur.";
	CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "Chess Event";
	CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "Je suis libre ! Cet instrument ne me torturera plus jamais !";
	CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "O willkommener Dolch! Dies werde deine Scheide. Roste da und lass mich sterben!"; -- need english translation
	CT_RaidTracker_lang_BossKills_Julianne_BossName = "";
--	CT_RaidTracker_lang_BossKills_Ignore_Julianne_Yell = "Ich komme, Romulo! Oh... dies trink' ich dir!"; -- need france translation
--	CT_RaidTracker_lang_BossKills_Ignore_Romulo_Yell = "Und du l\195\164chelst zu dem Streich, der mich ermordet.";	-- need france translation
	CT_RaidTracker_lang_BossKills_Sathrovarr_Yell = "I'm... never on... the losing... side..."; -- need Spain translation
	CT_RaidTracker_lang_BossKills_Sathrovarr_BossName = "Sathrovarr the Corruptor";	-- need Spain translation
	elseif (GetLocale() == "ruRU") then
CT_RaidTracker_lang_LeftGroup = "([^%s]+) покидает рейдовую группу";
CT_RaidTracker_lang_JoinedGroup = "([^%s]+) присоединятся к рейдовой группе";
CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+) получает добычу: "..CT_ITEMREG..".";
CT_RaidTracker_lang_ReceivesLoot2 = "Ваша добыча: "..CT_ITEMREG..".";
CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+) получает добычу: "..CT_ITEMREG_MULTI..".";
CT_RaidTracker_lang_ReceivesLoot4 = "Ваша добыча: "..CT_ITEMREG_MULTI..".";
CT_RaidTracker_lang_ReceivesLootYou = "Вы";

CT_RaidTracker_ZoneTriggers = {
	["Molten Core"] = "Molten Core",
	["Blackwing Lair"] = "Blackwing Lair",
	["Zul'Gurub"] = "Zul'Gurub",
	["Onyxia's Lair"] = "Onyxia's Lair",
	["Ruins of Ahn'Qiraj"] = "Ahn'Qiraj Ruins",
	["Ahn'Qiraj"] = "Ahn'Qiraj Temple",
	["Naxxramas"] = "Naxxramas",
	-- TBC
	["Каражан"] = "Karazhan",
	["Gruul's Lair"] = "Gruul's Lair",
	["Magtheridon's Lair"] = "Magtheridon's Lair",
	["Serpentshrine Cavern"] = "Serpentshrine Cavern",
	["Caverns Of Time"] = "Caverns Of Time",
	["Черный храм"] = "Black Temple",
	["Tempest Keep"] = "Tempest Keep: The Eye",
	["Вершина Хиджала"] = "Battle of Mount Hyjal",
	["Zul'Aman"] = "Zul'Aman",
	["Плато Солнечного Колодца"] = "Sunwell Plateau"
	-- TBC
};

CT_RaidTracker_BossUnitTriggers = {
	["Lucifron"] = "Lucifron",
	["Magmadar"] = "Magmadar",
	["Gehennas"] = "Gehennas",
	["Garr"] = "Garr",
	["Baron Geddon"] = "Baron Geddon",
	["Shazzrah"] = "Shazzrah",
	["Sulfuron Harbinger"] = "Sulfuron Harbinger",
	["Golemagg the Incinerator"] = "Golemagg the Incinerator",
	["Majordomo Executus"] = "Majordomo Executus",
	["Ragnaros"] = "Ragnaros",
	["Core Hound"] = "IGNORE",
	["Firesworn"] = "IGNORE",
	["Core Rager"] = "IGNORE",
	["Flamewaker Healer"] = "IGNORE",
	["Flamewaker Elite"] = "IGNORE",
	["Son of Flame"] = "IGNORE",
	
	["Razorgore the Untamed"] = "Razorgore the Untamed",
	["Vaelastrasz the Corrupt"] = "Vaelastrasz the Corrupt",
	["Broodlord Lashlayer"] = "Broodlord Lashlayer",
	["Firemaw"] = "Firemaw",
	["Ebonroc"] = "Ebonroc",
	["Flamegor"] = "Flamegor",
	["Chromaggus"] = "Chromaggus",
	["Nefarian"] = "Nefarian",
	["Lord Victor Nefarius"] = "Nefarian",
	["Grethok the Controller"] = "IGNORE",
	["Blackwing Guardsman"] = "IGNORE",
	["Blackwing Legionnaire"] = "IGNORE",
	["Blackwing Mage"] = "IGNORE",
	["Death Talon Dragonspawn"] = "IGNORE",
	["Black Drakonid"] = "IGNORE",
	["Blue Drakonid"] = "IGNORE",
	["Bronze Drakonid"] = "IGNORE",
	["Green Drakonid"] = "IGNORE",
	["Red Drakonid"] = "IGNORE",
	["Chromatic Drakonid"] = "IGNORE",
	["Bone Construct"] = "IGNORE",
	["Corrupted Infernal"] = "IGNORE",
	["Corrupted Blue Whelp"] = "IGNORE",
	["Corrupted Red Whelp"] = "IGNORE",
	["Corrupted Green Whelp"] = "IGNORE",
	["Corrupted Bronze Whelp"] = "IGNORE",
	["Death Talon Hatcher"] = "IGNORE",
	["Blackwing Taskmaster"] = "IGNORE",
	
	["High Priestess Jeklik"] = "High Priestess Jeklik",
	["High Priest Venoxis"] =	"High Priest Venoxis",
	["High Priestess Mar'li"] =	"High Priestess Mar'li",
	["High Priest Thekal"] = "High Priest Thekal",
	["High Priestess Arlokk"] =	"High Priestess Arlokk",
	["Hakkar"] = "Hakkar",
	["Bloodlord Mandokir"] = "Bloodlord Mandokir",
	["Jin'do the Hexxer"] = "Jin'do the Hexxer",
	["Gahz'ranka"] = "Gahz'ranka",
	["Hazza'rah"] = "Hazza'rah",
	["Gri'lek"] = "Gri'lek",
	["Renataki"] = "Renataki",
	["Wushoolay"] = "Wushoolay",
	["Zulian Prowler"] = "IGNORE",
	["Zulian Guardian"] = "IGNORE",
	["Parasitic Serpent"] = "IGNORE",
	["Spawn of Mar'li"] = "IGNORE",
	["Ohgan"] = "IGNORE",
	["Frenzied Bloodseeker Bat"] = "IGNORE",
	["Poisonous Cloud"] = "IGNORE",
	
	["Onyxia"] = "Onyxia",
	["Lord Kazzak"] = "Lord Kazzak",
	["Azuregos"] = "Azuregos",
	["Ysondre"] = "Ysondre",
	["Taerar"] = "Taerar",
	["Emeriss"] = "Emeriss",
	["Lethon"] = "Lethon",
	
	["Onyxian Whelp"] = "IGNORE",
	["Onyxian Warder"] = "IGNORE",
	["Shade of Taerar"] = "IGNORE",
	["Spirit Shade"] = "IGNORE",
	["Demented Druid Spirit"] = "IGNORE",
	
	["Kurinnaxx"] = "Kurinnaxx",
	["General Rajaxx"] = "General Rajaxx",
	["Ayamiss the Hunter"] = "Ayamiss the Hunter",
	["Buru the Gorger"] = "Buru The Gorger",
	["Moam"] = "Moam",
	["Ossirian the Unscarred"] = "Ossirian The Unscarred",
	["Buru Egg"] = "IGNORE",
	["Canal Frenzy"] = "IGNORE",
	["Mana Fiend"] = "IGNORE",
	["Silicate Feeder"] = "IGNORE",
	["Hive'Zara Hatchling"] = "IGNORE",
	["Hive'Zara Larva"] = "IGNORE",
	["Vekniss Hatchling"] = "IGNORE",
	["Anubisath Warrior"] = "IGNORE",
	
	["The Prophet Skeram"] = "The Prophet Skeram",
	["Fankriss the Unyielding"] = "Fankriss the Unyielding",
	["Battleguard Sartura"] = "Battleguard Sartura",
	["Princess Huhuran"] = "Princess Huhuran",
	["Emperor Vek'lor"] = "Twin Emperors",
	["Emperor Vek'nilash"] = "Twin Emperors",
	["C'Thun"] = "C'Thun",
	["Vem"] = "Vem",
	["Princess Yauj"] = "Princess Yauj",
	["Lord Kri"] = "Lord Kri",
	["Viscidus"] = "Viscidus",
	["Ouro"] = "Ouro",
	["Ouro Scarab"] = "IGNORE",
	["Spawn of Fankriss"] = "IGNORE",
	["Qiraji Scorpion"] = "IGNORE",
	["Qiraji Scarab"] = "IGNORE",
	["Vile Scarab"] = "IGNORE",
	["Yauj Brood"] = "IGNORE",
	["Sartura's Royal Guard"] = "IGNORE",
	["Sartura's Royal Guard"] = "IGNORE",
	["Poison Cloud"] = "IGNORE",
	["Vekniss Drone"] = "IGNORE",
	["Glob of Viscidus"] = "IGNORE",
	
	["Patchwerk"] = "Patchwerk",
	["Grobbulus"] = "Grobbulus",
	["Gluth"] = "Gluth",
	["Thaddius"] = "Thaddius",
	["Instructor Razuvious"] = "Instructor Razuvious",
	["Gothik the Harvester"] = "Gothik the Harvester",
	["Highlord Mograine"] = "Highlord Mograine",
	["Thane Korth'azz"] = "Thane Korth'azz",
	["Lady Blaumeux"] = "Lady Blaumeux",
	["Sir Zeliek"] = "Sir Zeliek",
	["Noth The Plaguebringer"] = "Noth The Plaguebringer",
	["Heigan the Unclean"] = "Heigan the Unclean",
	["Loatheb"] = "Loatheb",
	["Anub'Rekhan"] = "Anub'Rekhan",
	["Grand Widow Faerlina"] = "Grand Widow Faerlina",
	["Maexxna"] = "Maexxna",
	["Sapphiron"] = "Sapphiron",
	["Kel'Thuzad"] = "Kel'Thuzad",

		["Fangnetz"] = "IGNORE",
		["Verstrahlter Br\195\188hschleimer"] = "IGNORE",
		
	["Crypt Guard"] = "IGNORE",
	["Grobbulus Cloud"] = "IGNORE",
	["Deathknight Understudy"] = "IGNORE",
	["Maggot"] = "IGNORE",
	["Maexxna Spiderling"] = "IGNORE",
	["Plagued Warrior"] = "IGNORE",
	["Zombie Chow"] = "IGNORE",
	["Corpse Scarab"] = "IGNORE",
	["Naxxramas Follower"] = "IGNORE",
	["Naxxramas Worshipper"] = "IGNORE",
	["Web Wrap"] = "IGNORE",
	["Fallout Slime"] = "IGNORE",
	["Diseased Maggot"] = "IGNORE",
	["Rotting Maggot"] = "IGNORE",
	["Living Poison"] = "IGNORE",
	["Spore"] = "IGNORE",
	
	["Spotlight"] = "IGNORE",
	["Roach"] = "IGNORE",
	["Snake"] = "IGNORE",
	["Brown Snake"] = "IGNORE",
	["Crimson Snake"] = "IGNORE",
	["Black Kingsnake"] = "IGNORE",
	["Beetle"] = "IGNORE",
	["Dupe Bug"] = "IGNORE",
	["Fire Beetle"] = "IGNORE",
	["Scorpion"] = "IGNORE",
	["Frog"] = "IGNORE",
	["Hooktooth Frenzy"] = "IGNORE",
	["Sacrificed Troll"] = "IGNORE",
	["Spider"] = "IGNORE",
	["Rat"] = "IGNORE",
	["Jungle Toad"] = "IGNORE",
	["Field Repair Bot 74A"] = "IGNORE",
	
	-- TBC
	--Karazhan
	["Каззак Владыка Рока"] = "Doom Lord Kazzak",
	["Владыка Рока"] = "Doomwalker",
	["Attumen the Huntsman"] = "Attumen the Huntsman",
	["Dorothee"] = "IGNORE",
	["Maiden of Virtue"] = "Maiden of Virtue",
	["Midnight"] = "IGNORE",
	["Moroes"] = "Moroes",
		["Baron Rafe Dreuger"] = "IGNORE", -- Moroes add
		["Baroness Dorothea Millstipe"] = "IGNORE", -- Moroes add
		["Lady Catriona Von'Indi"] = "IGNORE", -- Moroes add
		["Lady Keira Berrybuck"] = "IGNORE", -- Moroes add
		["Lord Crispin Ference"] = "IGNORE", -- Moroes add
		["Lord Robin Daris"] = "IGNORE", -- Moroes add
	["Netherspite"] = "Netherspite",
	["Nightbane"] = "Nightbane",
	["Prince Malchezaar"] = "Prince Malchezaar",
	["Shade of Aran"] = "Shade of Aran",
	["Strawman"] = "IGNORE",
	["Terestian Illhoof"] = "Terestian Illhoof",
	["Kil'rek"] = "IGNORE",
	["The Big Bad Wolf"] = "The Big Bad Wolf",
	["The Crone"] = "The Crone",
	["The Curator"] = "The Curator",
	["Tinhead"] = "IGNORE",
	["Tito"] = "IGNORE",
	["Rokad the Ravager"] = "Rokad the Ravager",
	["Hyakiss the Lurker"] = "Hyakiss the Lurker",
	["Shadikith the Glider"] = "Shadikith the Glider",
	["Chess Event"] = "Chess Event",
	["Julianne"] = "Romulo and Julianne",
	["Roar"] = "IGNORE",
	["Romulo"] = "IGNORE",
	["Echo of Medivh"] = "Echo of Medivh",
	["Image of Medivh"] = "Image of Medivh",
	-- Zul'Aman
	["Nalorakk"] = "Nalorakk",	
	["Akil'Zon"] = "Akil'zon",	
	["Jan'Alai"] = "Jan'alai",	
	["Halazzi"] = "Halazzi",	
	["Witch Doctor"] = "Witch Doctor",	
	["Hex Lord Malacrass"] = "Hex Lord Malacrass",	
	["Zul'jin"] = "Zul'jin",	
	--Gruul
	["High King Maulgar"] = "High King Maulgar",
	["Gruul the Dragonkiller"] = "Gruul the Dragonkiller",
	["Blindeye the Seer"] = "IGNORE",
	["Kiggler the Crazed"] = "IGNORE",
	["Krosh Firehand"] = "IGNORE",
	["Olm the Summoner"] = "IGNORE",
	-- Magtheridon
	["Magtheridon"] = "Magtheridon",
	["Hellfire Warder"] = "IGNORE",
	["Hellfire Channeler"] = "IGNORE",
	--Serpentshrine Cavern
	["Hydross the Unstable"] = "Hydross the Unstable",
	["The Lurker Below"] = 		"The Lurker Below",
	["Leotheras the Blind"] = "Leotheras the Blind",
	["Fathom-Lord Karathress"] = "Fathom-Lord Karathress",
	["Morogrim Tidewalker"] = "Morogrim Tidewalker",
	["Lady Vashj"] = "Lady Vashj",
		-- Bossadds
			-- Hydross Adds
      ["Pure Spawn of Hydross"] = "IGNORE", -- Pure Spawn of Hydross
      ["Tainted Spawn of Hydross"] = "IGNORE", -- Tainted Spawn of Hydross
      ["Tainted Water Elemental"] = "IGNORE", -- Tainted Water Elemental
      ["Purified Water Elemental"] = "IGNORE", -- Purified Water Elemental  
      
      -- Morogrim Adds
      ["Tidewalker Lurker"] = "IGNORE", -- Tidewalker Lurker
      ["Water Globule"] = "IGNORE", -- Water Globule (Waterbubbles Tidewalker summons at 25%) 

			-- Fathom-Lord Karathress Adds
			["Spitfire Totem"] = "IGNORE", -- Spitfire Totem
			["Greater Earthbind Totem"] = "IGNORE", -- Greater Earthbind Totem
			["Greater Poison Cleansing Totem"] = "IGNORE", -- Greater Poison Cleansing Totem
			["Fathom Lurker"] = "IGNORE", -- Fathom Lurker
			["Fathom Sporebat"] = "IGNORE", -- Fathom Sporebat
			["Fathom-Guard Caribdis"] = "IGNORE", -- Fathom-Guard Caribdis
			["Fathom-Guard Tidalvess"] = "IGNORE", -- Fathom-Guard Tidalvess
			["Fathom-Guard Sharkkis"] = "IGNORE", -- Fathom-Guard Sharkkis
			
			-- The Lurker Below Adds
			["Coilfang Guardian"] = "IGNORE", -- Coilfang Guardian
			["Coilfang Ambusher"] = "IGNORE", -- Coilfang Ambusher
			
			-- Leotheras the Blind Adds
			["Inner Demon"] = "IGNORE", -- Inner Demon
			
      -- Vashj Adds
      ["Toxic Spore Bat"] = "IGNORE",  -- Toxic Spore Bat
      ["Tainted Elemental"] = "IGNORE", -- Tainted Elemental
      ["Coilfang Elite"] = "IGNORE", -- Coilfang Elite
      ["Coilfang Strider"] = "IGNORE", -- Coilfang Strider
      ["Enchanted Elemental"] = "IGNORE", -- Enchanted Elemental			
      -- SSC Trashmobs 
      ["Coilfang Beast-Tamer"] = "IGNORE",	-- Coilfang Beast-Tamer
      ["Vashj'ir Honor Guard"] = "IGNORE",	-- Vashj'ir Honor Guard
      ["Greyheart Tidecaller"] = "IGNORE", -- Greyheart Tidecaller
      ["Tidewalker Harpooner"] = "IGNORE", -- Tidewalker Harpooner
      ["Coilfang Hate-Screamer"] = "IGNORE", -- Coilfang Hate-Screamer
      ["Tidewalker Warrior"] = "IGNORE", -- Tidewalker Warrior
      ["Serpentshrine Lurker"] = "IGNORE", -- Serpentshrine Lurker
      ["Greyheart Nether-Mage"] = "IGNORE", -- Greyheart Nether-Mage
      ["Coilfang Priestess"] = "IGNORE", -- Coilfang Priestess
      ["Tidewalker Shaman"] = "IGNORE", -- Tidewalker Shaman
      ["Greyheart Shield-Bearer"] = "IGNORE", -- Greyheart Shield-Bearer
      ["Coilfang Serpentguard"] = "IGNORE", -- Coilfang Serpentguard
      ["Greyheart Skulker"] = "IGNORE", -- Greyheart Skulker
      ["Serpentshrine Sporebat"] = "IGNORE", -- Serpentshrine Sporebat
      ["Greyheart Technician"] = "IGNORE", -- Greyheart Technician
      ["Coilfang Fathom-Witch"] = "IGNORE", -- Coilfang Fathom-Witch
      ["Tidewalker Depth-Seer"] = "IGNORE", -- Tidewalker Depth-Seer
      ["Underbog Colossus"] = "IGNORE", -- Underbog Colossus
      ["Tidewalker Hydromancer"] = "IGNORE", -- Tidewalker Hydromancer
      ["Coilfang Shatterer"] = "IGNORE", -- Coilfang Shatterer
      -- SSC Trashmobs without loot
			["Coilfang Frenzy"] = "IGNORE", -- Coilfang Frenzy
			["Serpentshrine Tidecaller"] = "IGNORE", -- Serpentshrine Tidecaller
			["Colossus Lurker"] = "IGNORE", -- Colossus Lurker
			["Colossus Rager"] = "IGNORE", -- Colossus Rager
			["Serpentshrine Parasite"] = "IGNORE", -- Serpentshrine Parasite
			["Underbog Mushroom"] = "IGNORE", -- Underbog Mushroom
			["Water Elemental Totem"] = "IGNORE", -- Water Elemental Totem
			["Greyheart Spellbinder"] = "IGNORE", -- Greyheart Spellbinder
			["Priestess Spirit"] = "IGNORE", -- Priestess Spirit	
	--Black Temple
	["Великий полководец Наджентус"] = "High Warlord Naj'entus",
	["Супремус"] = "Supremus",
	["Гуртогг Кипящая Кровь"] = "Gurtogg Bloodboil",
	["Терон Жестокосердный"] = "Teron Gorefiend",
	["Тень Акамы"] = "Shade of Akama",
	["Сущность гнева"] = "Reliquary of Souls",
	["Матушка Шахраз"] = "Mother Shahraz",
	 ["Гатиос Раскольщик"] = "Illidari Council",
	 ["Верховный хаомант Зеревор"] = "Illidari Council",
	 ["Леди Маланда"] = "Illidari Council",
	 ["Верас Черная Тень"] = "Illidari Council",	
	["Иллидан Грозовая Ярость"] = "Illidan Stormrage",	
	--Tempest Keep: The Eye
	["Al'ar"] = "Al'ar",
	["High Astromancer Solarian"] = "High Astromancer Solarian",	
	["Void Reaver"] = "Void Reaver",
	["Kael'thas Sunstrider"] = "Kael'thas Sunstrider",
    -- Bossadds
	-- Al'ar Adds
    ["Ember of Al'ar"] = "IGNORE", -- Ember of Al'ar
    -- Astromancer Adds
    ["Solarium Agent"] = "IGNORE", -- Solarium Agent
    ["Solarium Priest"] = "IGNORE", -- Solarium Priest
    -- Kael'thas Adds
    ["Lord Sanguinar"] = "IGNORE", -- Lord Sanguinar
    ["Grand Astromancer Capernian"] = "IGNORE", -- Grand Astromancer Capernian  
    ["Master Engineer Telonicus"] = "IGNORE", -- Master Engineer Telonicus
    ["Phoenix Egg"] = "IGNORE", -- Phoenix Egg
    ["Phoenix"] = "IGNORE", -- Phoenix
    ["Thaladred the Darkener"] = "IGNORE", -- Thaladred the Darkener
    -- Kael'thas Weapons
    ["Infinity Blades"] = "IGNORE", -- Infinity Blades
    ["Cosmic Infuser"] = "IGNORE", -- Cosmic Infuser
    ["Netherstrand Longbow"] = "IGNORE", -- Netherstrand Longbow
    ["Phaseshift Bulwark"] = "IGNORE", -- Phaseshift Bulwark
    ["Staff of Disintegration"] = "IGNORE", -- Staff of Disintegration
    ["Devastation"] = "IGNORE", -- Devastation
    ["Warp Slicer"] = "IGNORE", -- Warp Slicer
		-- TK Trash
		["Astromancer"] = "IGNORE", -- Astromancer
		["Astromancer Lord"] = "IGNORE", -- Astromancer Lord
		["Novice Astromancer"] = "IGNORE", -- Novice Astromancer
		["Crimson Hand Blood Knight"] = "IGNORE", -- Crimson Hand Blood Knight
		["Tempest Falconer"] = "IGNORE", -- Tempest Falconer
		["Crimson Hand Inquisitor"] = "IGNORE", -- Crimson Hand Inquisitor
		["Crimson Hand Battle Mage"] = "IGNORE", -- Crimson Hand Battle Mage
		["Bloodwarder Squir"] = "IGNORE", -- Bloodwarder Squire
		["Crystalcore Mechanic"] = "IGNORE", -- Crystalcore Mechanic
		["Crystalcore Sentinel"] = "IGNORE", -- Crystalcore Sentinel
		["Crystalcore Devastator"] = "IGNORE", -- Crystalcore Devastator
		["Bloodwarder Legionnaire"] = "IGNORE", -- Bloodwarder Legionnaire
		["Bloodwarder Marshal"] = "IGNORE", -- Bloodwarder Marshal
		["Nether Scryer"] = "IGNORE", -- Nether Scryer
		["Phoenix-Hawk Hatchlings"] = "IGNORE", -- Phoenix-Hawk Hatchling
		["Phoenix-Hawk"] = "IGNORE", -- Phoenix-Hawk
		["Tempest-Smith"] = "IGNORE", -- Tempest-Smith
		["Star Scryer"] = "IGNORE", -- Star Scryer
		["Apprentice Star Scryer"] = "IGNORE", -- Apprentice Star Scryer
		["Bloodwarder Vindicator"] = "IGNORE", -- Bloodwarder Vindicator
		["Crimson Hand Centurion"] = "IGNORE", -- Crimson Hand Centurion

	["Lord Illidan Stormrage"] = "Lord Illidan Stormrage",
	["Highlord Kruul"] = "Highlord Kruul",	

	--Battle of Mount Hyjal
	["Лютый Хлад"] = "Rage Winterchill",
	["Анетерон"] = "Anetheron",
	["Каз'рогал"] = "Kaz'rogal",
	["Азгалор"] = "Azgalor",
	["Архимонд"] = "Archimonde",
	
  --Sunwell Plateau
	["Калецгос"] =  "IGNORE", -- Kalecgos
		["Сатроварр Осквернитель"] = "Sathrovarr the Corruptor",
		["Сатроварр Осквернитель"] = "Kalecgos",
	["Бруталл"] = "Brutallus",
		["Madrigosa"] = "IGNORE", -- Madrigosa	
	["Сквернотуман"] = "Felmyst",
	["Lady Sacrolash"] = "Eredar Twins",
	["Grand Warlock Alythess"] = "Eredar Twins",
	["Энтропий"] = "Entropius",
	["Kil'jaeden"] = "Kil'jaeden",	
	["М'ару"] = "IGNORE",
	["Shadowsword Berserker"] = "IGNORE", -- Shadowsword Berserker
	["Shadowsword Fury Mage"] = "IGNORE", -- Shadowsword Fury Mage
	["Void Sentinel"] = "IGNORE", -- Void Sentinel
	["Void Spawn"] = "IGNORE", -- Void Spawn
	
	-- TBC	
	
	["DEFAULTBOSS"] = "Trash mob",
};

CT_RaidTracker_lang_BossKills_Majordomo_Yell = "Impossible! Stay your attack, mortals... I submit! I submit!";
CT_RaidTracker_lang_BossKills_Majordomo_BossName = "Majordomo Executus";
CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "I'm free!  That device shall never torment me again!";
CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "Als sich der Fluch, der auf den T\195\188ren der Halle der Spiele lastete, l\195\182st, beginnen die Mauern von Karazhan zu beben."; -- need english translation
CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "Chess Event";
--
CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "O happy dagger! This is thy sheath; there rust, and let me die!";
CT_RaidTracker_lang_BossKills_Julianne_BossName = "Julianne";
CT_RaidTracker_lang_BossKills_Sathrovarr_Yell = "I'm... never on... the losing... side...";
CT_RaidTracker_lang_BossKills_Sathrovarr_BossName = "Sathrovarr the Corruptor";

end

if (GetLocale() == "zhCN") then


	CT_RaidTracker_Zones = {
		"熔火之心",
		"黑翼之巢",
		"祖尔格拉布",
		"奥妮克希亚的巢穴",
		"安其拉",
		"安其拉废墟",
		"纳克萨玛斯",
		-- TBC
		"卡拉赞",
		"格鲁尔的巢穴",
		"玛瑟里顿的巢穴",
		"毒蛇神殿",
		"风暴要塞",
		"海加尔峰",
		"黑暗神殿",
		"祖阿曼",
		"太阳井高地",
		"世界首领",
		-- WLK
		"红玉圣殿",
		"奥妮克希亚的巢穴",
		"纳克萨玛斯",
		"永恒之眼",	
		"黑曜石圣殿",
		"阿尔卡冯的宝库",	
		"奥杜尔",
		"十字军的试炼",
		"冰冠堡垒",
	};

	CT_RaidTracker_Bosses = {
		["熔火之心"] = {
			"鲁西弗隆",
			"玛格曼达",
			"基赫纳斯",
			"加尔",
			"沙斯拉尔",
			"迦顿男爵",
			"焚化者古雷曼格",
			"萨弗隆先驱者",
			"管理者埃克索图斯",
			"拉格纳罗斯",
		},
		["黑翼之巢"] = {
			"狂野的拉佐格尔",
			"堕落的瓦拉斯塔兹",
			"勒什雷尔",
			"费尔默",
			"埃博诺克",
			"弗莱格尔",
			"克洛玛古斯",
			"奈法利安",
		},
		["祖尔格拉布"] = {
			"高阶祭司耶克里克",
			"高阶祭司温诺希斯",
			"高阶祭司玛尔里",
			"高阶祭司塞卡尔",
			"高阶祭司娅尔罗",
			"哈卡",
			"血领主曼多基尔",
			"哈扎拉尔",
			"加兹兰卡",
			"乌苏雷",
			"妖术师金度",
			"格里雷克",
			"雷纳塔基",
		},
		["安其拉废墟"] = {
			"库林纳克斯",
			"拉贾克斯将军",
			"吞咽者布鲁",
			"狩猎者阿亚米斯",
			"莫阿姆",
			"无疤者奥斯里安",
		},
		["安其拉"] = {
			"预言者斯克拉姆",
			"克里勋爵",
			"亚尔基公主",
			"维姆",
			"沙尔图拉",
			"顽强的范克瑞斯",
			"哈霍兰公主",
			"维希度斯",
			"维克尼拉斯大帝",
			"维克洛尔大帝",
			"奥罗",
			"克苏恩",
		},
		--[[
		["纳克萨玛斯"] = {
			"阿努布雷坎",
			"教官拉苏维奥斯",
			"收割者戈提克",
			"大领主莫格莱尼",
			"瘟疫使者诺斯",
			"肮脏的希尔盖",
			"洛欧塞布",
			"迈克斯纳",
			"黑女巫法琳娜",
			"帕奇维克",
			"格罗布鲁斯",
			"格拉斯",
			"塔迪乌斯",
			"萨菲隆",
			"克尔苏加德",
			"大领主莫格莱尼",
			"库尔塔兹领主",
			"女公爵布劳缪克斯",
			"瑟里耶克爵士",
		},
		
		["奥妮克希亚的巢穴"] = {
			"奥妮克希亚",
		},
		]]
		["翡翠龙王"] = {
			"莱索恩",
			"泰拉尔",
			"艾莫莉丝",
			"伊森德雷",
		},
		["卡拉赞"] = {
			"猎手阿图门",	-- Attumen the Huntsman
			"莫罗斯", -- Moroes
			"贞节圣女", -- Maiden of Virtue",
			["剧院"] = {
				"绿野仙踪", -- Dorothee
				"小红帽", -- The Big Bad Wolf
				"罗密欧与朱丽叶",
			},
			"馆长", -- The Curator
			"特雷斯坦·邪蹄", -- Terestian Illhoof
			"埃兰之影", -- Shade of Aran
			"虚空幽龙", -- Netherspite
			"象棋事件",
			"玛克扎尔王子", -- Prince Malchezaar
			"夜之魇", -- Nightbane
			"蹂躏者洛卡德", -- Rokad the Ravager
			"潜伏者希亚其斯", -- Hyakiss the Lurker
			"滑翔者沙德基斯", -- Shadikith the Glider
		},
		["祖阿曼"] = {
			"纳洛拉克",
			"埃基尔松",
			"哈尔拉兹",
			"加亚莱",
			"妖术领主玛拉卡斯",
			"祖尔金",
		},
		["格鲁尔的巢穴"] = {
			"莫加尔大王",
			"屠龙者格鲁尔",
		},
		["玛瑟里顿的巢穴"] = {
			"玛瑟里顿",
		},
		["毒蛇神殿"] = {
			"不稳定的海度斯",
			"深水领主卡拉瑟雷斯",
			"莫洛格里·踏潮者",
			"盲眼者莱欧瑟拉斯",
			"鱼斯拉",
			"瓦丝琪",
		},
		["风暴要塞"] = {
			"奥",
			"大星术师索兰莉安",
			"凯尔萨斯·逐日者",
			"空灵机甲",
		},
		["海加尔峰"] = {
			"雷基·冬寒",
			"安纳塞隆",
			"卡兹洛加",
			"阿兹加洛",
			"阿克蒙德",
		},
		["黑暗神殿"] = {
			"高阶督军纳因图斯",
			"苏普雷姆斯",
			"阿卡玛之影",
			"塔隆·血魔",
			"古尔图格·血沸",
			"灵魂之匣",
			"莎赫拉丝主母",
			"伊利达雷议会",
			"伊利丹·怒风",
		},
		["太阳井高地"] = {
			"卡雷苟斯",
			"布鲁塔卢斯",
			"菲米丝",
			"高阶术士奥蕾塞丝",
			"萨洛拉丝女王",
			"穆鲁",
			"基尔加丹",
		},	
		-- WLK
		["红玉圣殿"] = {
			"扎瑞斯莱恩将军",
			"『怒火』萨维安娜",
			"『战争之子』巴尔萨拉斯",
			"海里昂",
		},
		["奥妮克希亚的巢穴"] = {
			"奥妮克希亚",
		},
		["纳克萨玛斯"] = {
			"阿努布雷坎",
			"教官拉苏维奥斯",
			"收割者戈提克",
			"大领主莫格莱尼",
			"瘟疫使者诺斯",
			"肮脏的希尔盖",
			"洛欧塞布",
			"迈克斯纳",
			"黑女巫法琳娜",
			"帕奇维克",
			"格罗布鲁斯",
			"格拉斯",
			"塔迪乌斯",
			"萨菲隆",
			"克尔苏加德",
			"四骑士",
			["四骑士"] = {
				"戴文瑞尔男爵",
				"库尔塔兹领主",
				"女公爵布劳缪克斯",
				"瑟里耶克爵士",
			}
		},
		["永恒之眼"] = {
			"玛里苟斯",
		},
		["黑曜石圣殿"] = {
			"萨塔里奥",
		},
		["阿尔卡冯的宝库"] = {
			"风暴看守者埃玛尔隆",		
			"火焰看守者科拉隆",
			"岩石看守者阿尔卡冯",
			"寒冰看守者图拉旺",
		},
		["奥杜尔"] = {
			"霍迪尔",
			"唤雷者布隆迪尔",
			"托里姆",
			"观察者奥尔加隆"	,
			"弗蕾亚",
			"柯洛刚恩",	
			"烈焰巨兽",	
			"掌炉者伊格尼斯",
			"锋鳞",
			"维扎克斯将军",
			"尤格-萨隆",
			"XT-002拆解者",	
			"米米尔隆",	
			"欧尔莉亚",
		},
		["十字军的试炼"] = {			
			"冰吼",		
			"加拉克苏斯大王",
			"阵营勇士",
			"瓦格里双子",
			["瓦格里双子"] = {
				"光明邪使菲奥拉",
				"黑暗邪使艾蒂丝",
			},
			"阿努巴拉克",
		},
		["冰冠堡垒"] = {
			"玛洛加尔领主",
			"亡语者女士",
			"炮艇战",
			"死亡使者萨鲁法尔",
			"烂肠",
			"腐面",
			"普崔塞德教授",
			"血亲王议会",
			["血亲王议会"] = {
				"瓦拉纳王子",
				"凯雷希斯王子",
				"泰尔达朗王子",
			},
			"鲜血女王兰娜瑟尔",
			"踏梦者瓦莉瑟瑞娅",
			"辛达苟萨",
			"巫妖王",
		},
		["世界首领"] = {
			"卡扎克",
			"艾索雷葛斯",
			-- tbc
			"末日领主卡扎克",
			"末日行者",
			-- tbc
		},
		["小怪掉落"] = 1,
	};

	CT_RaidTracker_lang_LeftGroup = "([^%s]+)离开了团队。";
	CT_RaidTracker_lang_JoinedGroup = "([^%s]+)加入了团队。";
	CT_RaidTracker_lang_ReceivesLoot1 = "([^%s]+)获得了物品："..CT_ITEMREG.."。";
	CT_RaidTracker_lang_ReceivesLoot2 = "你获得了物品："..CT_ITEMREG.."。";
	CT_RaidTracker_lang_ReceivesLoot3 = "([^%s]+)得到了物品："..CT_ITEMREG_MULTI.."。";
	CT_RaidTracker_lang_ReceivesLoot4 = "你得到了物品："..CT_ITEMREG_MULTI.."。";
	CT_RaidTracker_lang_ReceivesLootYou = "你";

	CT_RaidTracker_ZoneTriggers = {
			["熔火之心"] = "熔火之心",
			["黑翼之巢"] = "黑翼之巢",
			["祖尔格拉布"] = "祖尔格拉布",
			["奥妮克希亚的巢穴"] = "奥妮克希亚的巢穴",
			["安其拉"] = "安其拉",
			["安其拉废墟"] = "安其拉废墟",
			["纳克萨玛斯"] = "纳克萨玛斯",
			-- TBC
			["卡拉赞"] = "卡拉赞",
			["格鲁尔的巢穴"] = "格鲁尔的巢穴",
			["玛瑟里顿的巢穴"] = "玛瑟里顿的巢穴",
			["海加尔峰"] = "海加尔峰",
			["毒蛇神殿"] = "毒蛇神殿",
			["黑暗神殿"] = "黑暗神殿",
			["风暴要塞"] = "风暴要塞",
			["祖阿曼"] = "祖阿曼",
			["太阳井高地"] = "太阳井高地",
			-- WLK
			["红玉圣殿"] = "红玉圣殿",
			["奥妮克希亚的巢穴"] = "奥妮克希亚的巢穴",
			["纳克萨玛斯"] = "纳克萨玛斯",
			["永恒之眼"] = "永恒之眼",	
			["黑曜石圣殿"] = "黑曜石圣殿",
			["阿尔卡冯的宝库"] = "阿尔卡冯的宝库",	
			["奥杜尔"] = "奥杜尔",
			["十字军的试炼"] = "十字军的试炼",
			["冰冠堡垒"] = "冰冠堡垒",
	};
	CT_RaidTracker_BossUnitTriggers = {

	--MC
		["鲁西弗隆"] = "鲁西弗隆", --Lucifron
		["玛格曼达"] = "玛格曼达", --Magmadar
		["基赫纳斯"] = "基赫纳斯", --Gehennas
		["加尔"] = "加尔", --Garr
		["迦顿男爵"] = "迦顿男爵", --Baron Geddon
		["沙斯拉尔"] = "沙斯拉尔", --Shazzrah
		["萨弗隆先驱者"] = "萨弗隆先驱者", --Sulfuron Harbinger
		["焚化者古雷曼格"] = "焚化者古雷曼格", --Golemagg the Incinerator
		["管理者埃克索图斯"] = "管理者埃克索图斯", --Majordomo Executus
		["拉格纳罗斯"] = "拉格纳罗斯", --Ragnaros
		["熔火恶犬"] = "IGNORE", --Core Hound
		["火誓者"] = "IGNORE", --Firesworn
		["熔火怒犬"] = "IGNORE", --Core Rager
		["烈焰行者医师"] = "IGNORE", --Flamewaker Healer
		["烈焰行者精英"] = "IGNORE", --Flamewaker Elite
		["烈焰之子"] = "IGNORE", --Son of Flame
		["上古熔火恶犬"] = "IGNORE",
		["火焰之王"] = "IGNORE",
		["火焰行者"] = "IGNORE",
		["烈焰小鬼"] = "IGNORE",
		["烈焰之子"] = "IGNORE",
		["烈焰守卫"] = "IGNORE",
		["烈焰行者祭司"] = "IGNORE",
		["烈焰行者护卫"] = "IGNORE",
		["熔岩元素"] = "IGNORE",
		["熔岩爪牙"] = "IGNORE",
		["熔岩奔腾者"] = "IGNORE",
		["熔岩掠夺者"] = "IGNORE",
		["熔岩歼灭者"] = "IGNORE",
		["熔核巨人"] = "IGNORE",
		["熔核摧毁者"] = "IGNORE",
		
	--BWL
		["狂野的拉佐格尔"] = "狂野的拉佐格尔", --Razorgore the Untamed"
		["堕落的瓦拉斯塔兹"] = "堕落的瓦拉斯塔兹", --Vaelastrasz the Corrupt
		["勒什雷尔"] = "勒什雷尔", --Broodlord Lashlayer
		["费尔默"] = "费尔默", --Firemaw
		["埃博诺克"] = "埃博诺克", --Ebonroc
		["弗莱格尔"] = "弗莱格尔", --Flamegor
		["克洛玛古斯"] = "克洛玛古斯", --Chromaggus
		["奈法利安"] = "奈法利安", --Nefarian
		["维克多·奈法里奥斯"] = "奈法利安", --Lord Victor Nefarius
		["黑翼控制者"] = "IGNORE", --Grethok the Controller
		["黑翼卫士"] = "IGNORE", --Blackwing Guardsman
		["黑翼军团士兵"] = "IGNORE", --Blackwing Legionnaire
		["黑翼法师"] = "IGNORE", --Blackwing Mage
		["死爪龙人"] = "IGNORE", --Death Talon Dragonspawn
		["黑色龙兽"] = "IGNORE", --Black Drakonid
		["蓝色龙兽"] = "IGNORE", --Blue Drakonid
		["青铜龙兽"] = "IGNORE", --Bronze Drakonid
		["绿色龙兽"] = "IGNORE", --Green Drakonid
		["红色龙兽"] = "IGNORE", --Red Drakonid
		["多彩龙兽"] = "IGNORE", --Chromatic Drakonid
		["白骨魔像"] = "IGNORE", --Bone Construct
		["堕落地狱火"] = "IGNORE", --Corrupted Infernal
		["腐化的蓝色雏龙"] = "IGNORE", --Corrupted Blue Whelp
		["腐化的红色雏龙"] = "IGNORE", --Corrupted Red Whelp
		["腐化的绿色雏龙"] = "IGNORE", --Corrupted Green Whelp
		["腐化的青铜雏龙"] = "IGNORE", --Corrupted Bronze Whelp
		["死爪地卜师"] = "IGNORE", --Death Talon Hatcher
		["黑翼工头"] = "IGNORE", --Blackwing Taskmaster
		
	--ZG
		["高阶祭司耶克里克"] = "高阶祭司耶克里克", --High Priestess Jeklik
		["高阶祭司温诺希斯"] =	"高阶祭司温诺希斯", --High Priest Venoxis
		["高阶祭司玛尔里"] =	"高阶祭司玛尔里", --High Priestess Mar'li
		["高阶祭司塞卡尔"] = "高阶祭司塞卡尔", --High Priest Thekal
		["高阶祭司娅尔罗"] = "高阶祭司娅尔罗", --High Priestess Arlokk
		["哈卡"] = "哈卡", --Hakkar
		["血领主曼多基尔"] = "血领主曼多基尔", --Bloodlord Mandokir
		["妖术师金度"] = "妖术师金度", --Jin'do the Hexxer
		["加兹兰卡"] = "加兹兰卡", --Gahz'ranka
		["哈扎拉尔"] = "哈扎拉尔", --Hazza'rah
		["格里雷克"] = "格里雷克", --Gri'lek
		["雷纳塔基"] = "雷纳塔基", --Renataki
		["乌苏雷"] = "乌苏雷", --Wushoolay
		["祖利安徘徊者"] = "IGNORE", --Zulian Prowler
		["祖利安守护者"] = "IGNORE", --Zulian Guardian
		["寄居蛇"] = "IGNORE", --Parasitic Serpent
		["玛尔里的爪牙"] = "IGNORE", --Spawn of Mar'li
		["奥根"] = "IGNORE", --Ohgan
		["疯狂的觅血蝙蝠"] = "IGNORE", --Frenzied Bloodseeker Bat
		["毒性云雾"] = "IGNORE", --Poisonous Cloud
		["古拉巴什狂暴者"] = "IGNORE",
		["古拉巴什勇士"] = "IGNORE",
		["古拉巴什乘蝠者"] = "IGNORE",
		["古拉巴什饮血者"] = "IGNORE",
		["古拉巴什掷斧者"] = "IGNORE",
		["古拉巴什猎头者"] = "IGNORE",
		["巨型喷泉"] = "IGNORE",
		["血顶食人妖大使"] = "IGNORE",
		["血顶部族演讲者"] = "IGNORE",
		["巫毒奴隶"] = "IGNORE",
		["沙怒食人妖大使"] = "IGNORE",
		["沙怒部族演讲者"] = "IGNORE",
		["狂热者札斯"] = "IGNORE",
		["邪枝食人妖大使"] = "IGNORE",
		["邪枝部族演讲者"] = "IGNORE",
		["拉札希迅猛龙"] = "IGNORE",
		["拉札希奎蛇"] = "IGNORE",
		["拉札希毒液蜘蛛"] = "IGNORE",
		["拉札希寡妇蜘蛛"] = "IGNORE",
		["拉札希诱捕者"] = "IGNORE",
		["拉沙希毒蛇"] = "IGNORE",
		["拉沙希眼镜蛇"] = "IGNORE",
		["金度之影"] = "IGNORE",
		["阿塔莱侍女"] = "IGNORE",
		["哈卡之子"] = "IGNORE",
		["哈卡莱巫医"] = "IGNORE",
		["哈卡莱高阶祭司"] = "IGNORE",
		["哈卡莱祭司"] = "IGNORE",
		["哈卡莱暗影法师"] = "IGNORE",
		["枯木食人妖大使"] = "IGNORE",
		["枯木部族演讲者"] = "IGNORE",
		["洗脑图腾"] = "IGNORE",
		["祖利安幼虎"] = "IGNORE",
		["祖利安守护者"] = "IGNORE",
		["祖利安捕猎者"] = "IGNORE",
		["祖利安徘徊者"] = "IGNORE",
		["祖利安猛虎"] = "IGNORE",
		["祖利安雌猎虎"] = "IGNORE",
		["祖利安鳄鱼"] = "IGNORE",
		["衰老的侍女"] = "IGNORE",
		["强力治疗结界"] = "IGNORE",
		["眼镜王蛇"] = "IGNORE",
		["祭品食人妖"] = "IGNORE",
		["被召唤的骷髅"] = "IGNORE",
		["被禁锢的灵魂"] = "IGNORE",
		["觅血蝙蝠"] = "IGNORE",
		["无眠者赞札"] = "IGNORE",
		["超强治疗结界"] = "IGNORE",
		["梦魔幻象"] = "IGNORE",
		["玛尔里的爪牙"] = "IGNORE",
		["疯狂虚空行者"] = "IGNORE",
		["疯狂仆从"] = "IGNORE",
		["劈颅食人妖大使"] = "IGNORE",
		["劈颅部族演讲者"] = "IGNORE",
		["灵魂掠夺者"] = "IGNORE",

	--Onyx	
		["奥妮克希亚"] = "奥妮克希亚", --Onyxia
		["奥妮克希亚雏龙"] = "IGNORE", --Onyxian Whelp
		["奥妮克希亚守卫"] = "IGNORE", --Onyxian Warder
		
		["卡扎克"] = "卡扎克", --Lord Kazzak
		["艾索雷葛斯"] = "艾索雷葛斯", --Azuregos
		["伊森德雷"] = "伊森德雷", --Ysondre
		["泰拉尔"] = "泰拉尔", --Taerar
		["艾莫莉丝"] = "艾莫莉丝", --Emeriss
		["莱索恩"] = "莱索恩", --Lethon

		["泰拉尔之影"] = "IGNORE", --Shade of Taerar
		["灵魂之影"] = "IGNORE", --Spirit Shade
		["疯狂的德鲁伊灵魂"] = "IGNORE", --Demented Druid Spirit
		
	--RAQ
		["库林纳克斯"] = "库林纳克斯", --Kurinnaxx
		["拉贾克斯将军"] = "拉贾克斯将军", --General Rajaxx
		["狩猎者阿亚米斯"] = "狩猎者阿亚米斯", --Ayamiss the Hunter
		["吞咽者布鲁"] = "吞咽者布鲁", --Buru The Gorger
		["莫阿姆"] = "莫阿姆", --Moam
		["无疤者奥斯里安"] = "无疤者奥斯里安", --Ossirian The Unscarred
		["布鲁的卵"] = "IGNORE", --Buru Egg
		["运河狂鱼"] = "IGNORE", --Canal Frenzy
		["法力恶魔"] = "IGNORE", --Mana Fiend
		["硅酸盐吞噬者"] = "IGNORE", --Silicate Feeder
		["札拉雏虫"] = "IGNORE", --Hive'Zara Hatchling
		["维克尼斯雏虫"] = "IGNORE", --Vekniss Hatchling
		["阿努比萨斯战士"] = "IGNORE", --Anubisath Warrior
		["甲壳虫"] = "IGNORE",
		["卡多雷精英"] = "IGNORE",
		["札拉士兵"] = "IGNORE",
		["札拉幼虫"] = "IGNORE",
		["札拉沙行者"] = "IGNORE",
		["札拉毒蝎"] = "IGNORE",
		["札拉采集者"] = "IGNORE",
		["札拉异种蝎"] = "IGNORE",
		["札拉雄蜂"] = "IGNORE",
		["札拉黄蜂"] = "IGNORE",
		["札拉虫群"] = "IGNORE",
		["安多洛夫中将"] = "IGNORE",
		["血肉猎手"] = "IGNORE",
		["邪恶的甲虫"] = "IGNORE",
		["其拉角斗士"] = "IGNORE",
		["其拉战士"] = "IGNORE",
		["其拉虫群卫士"] = "IGNORE",
		["阿努比萨斯守卫者"] = "IGNORE",
		["阿努比萨斯战士"] = "IGNORE",
		["阿努比萨斯虫群卫士"] = "IGNORE",
		["黑曜石毁灭者"] = "IGNORE",
		["喷液甲虫"] = "IGNORE",
		["食脑甲虫"] = "IGNORE",
		["虫群守卫尼德勒"] = "IGNORE",
		["帕康少校"] = "IGNORE",
		["德兰上尉"] = "IGNORE",
		["泽朗上校"] = "IGNORE",
		["叶吉斯少校"] = "IGNORE",
		["瑟瑞姆上尉"] = "IGNORE",
		["奎兹上尉"] = "IGNORE",

	--taq	
		["预言者斯克拉姆"] = "预言者斯克拉姆",
		["克里勋爵"] = "克里勋爵",
		["亚尔基公主"] = "亚尔基公主",
		["维姆"] = "维姆",
		["沙尔图拉"] = "沙尔图拉",
		["顽强的范克瑞斯"] = "顽强的范克瑞斯",
		["哈霍兰公主"] = "哈霍兰公主",
		["维希度斯"] = "维希度斯",
		["维克尼拉斯大帝"] = "维克尼拉斯大帝",
		["维克洛尔大帝"] = "维克洛尔大帝",
		["奥罗"] = "奥罗",
		["克苏恩"] = "克苏恩",
		["其拉甲虫"] = "IGNORE",
		["其拉蝎虫"] = "IGNORE",
		["奥罗甲虫"] = "IGNORE", --Ouro Scarab
		["范克里斯的爪牙"] = "IGNORE", --Spawn of Fankriss
		["其拉蝎虫"] = "IGNORE", --Qiraji Scorpion
		["其拉甲虫"] = "IGNORE", --Qiraji Scarab
		["邪恶的甲虫 "] = "IGNORE", --Vile Scarab
		["亚尔基的子嗣"] = "IGNORE", --Yauj Brood
		["沙尔图拉皇家卫士"] = "IGNORE", --Sartura's Royal Guard
		["毒性云雾"] = "IGNORE", --Poison Cloud
		["维克尼斯雄蜂"] = "IGNORE", --Vekniss Drone
		["维希度斯水滴"] = "IGNORE", --Glob of Viscidus

	--nax		
		["阿努布雷坎"] = "阿努布雷坎",
		["教官拉苏维奥斯"] = "教官拉苏维奥斯",
		["收割者戈提克"] = "收割者戈提克",
		["大领主莫格莱尼"] = "大领主莫格莱尼",
		["瘟疫使者诺斯"] = "瘟疫使者诺斯",
		["肮脏的希尔盖"] = "肮脏的希尔盖",
		["洛欧塞布"] = "洛欧塞布",
		["迈克斯纳"] = "迈克斯纳",
		["黑女巫法琳娜"] = "黑女巫法琳娜",
		["帕奇维克"] = "帕奇维克",
		["格罗布鲁斯"] = "格罗布鲁斯",
		["格拉斯"] = "格拉斯",
		["塔迪乌斯"] = "塔迪乌斯",
		["萨菲隆"] = "萨菲隆",
		["克尔苏加德"] = "克尔苏加德",
		["大领主莫格莱尼"] = "大领主莫格莱尼",
		["库尔塔兹领主"] = "库尔塔兹领主",
		["女公爵布劳缪克斯"] = "女公爵布劳缪克斯",
		["瑟里耶克爵士"] = "瑟里耶克爵士",

	--tbc
	--Gruul
		["莫加尔大王"] = "莫加尔大王",
		["屠龙者格鲁尔"] = "屠龙者格鲁尔",
		["疯狂的基戈尔"] = "IGNORE",
		["盲眼先知"] = "IGNORE",
		["召唤者沃尔姆"] = "IGNORE",
		["克洛什·火拳"] = "IGNORE",
		["野蛮的魔能猎犬"] = "IGNORE",
	--Karazhan
		["猎手阿图门"] = "猎手阿图门",
		["午夜"] = "IGNORE",
		["莫罗斯"] = "莫罗斯",
		["杜萝希·米尔斯提女伯爵"] = "IGNORE",
		["卡翠欧娜·冯因迪女伯爵"] = "IGNORE",
		["吉拉·拜瑞巴克女伯爵"] = "IGNORE",
		["拉弗·杜格尔男爵"] = "IGNORE",
		["罗宾·达瑞斯伯爵"] = "IGNORE",
		["克里斯宾·费伦斯伯爵"] = "IGNORE",
		["贞节圣女"] = "贞节圣女",
		["大灰狼"] = "小红帽",
		["巫婆"] = "绿野仙踪",
		["稻草人"] = "IGNORE",
		["铁皮人"] = "IGNORE",
		["托托"] = "IGNORE",
		["胆小的狮子"] = "IGNORE",
		["多萝茜"] = "IGNORE",
		["罗密欧"] = "罗密欧与朱丽叶",
		["朱丽叶"] = "罗密欧与朱丽叶",
		["虚空幽龙"] = "虚空幽龙",
		["夜之魇"] = "夜之魇",
		["玛克扎尔王子"] = "玛克扎尔王子",
		["特雷斯坦·邪蹄"] = "特雷斯坦·邪蹄",
		["基尔里克"] = "IGNORE",
		["恶魔小鬼"] = "IGNORE",
		["埃兰之影"] = "埃兰之影",
		["馆长"] = "馆长",
		["象棋事件"] = "象棋事件",
	--TheEye
		["奥"] = "奥",
		["大星术师索兰莉安"] = "大星术师索兰莉安",
		["凯尔萨斯·逐日者"] = "凯尔萨斯·逐日者",
		["空灵机甲"] = "空灵机甲",
		["亵渎者萨拉德雷"] = "IGNORE",
		["萨古纳尔男爵"] = "IGNORE",
		["星术师卡波妮娅"] = "IGNORE",
		["首席技师塔隆尼库斯"] = "IGNORE",
	--Hjef
		["雷基·冬寒"] = "雷基·冬寒",
		["安纳塞隆"] = "安纳塞隆",
		["卡兹洛加"] = "卡兹洛加",
		["阿兹加洛"] = "阿兹加洛",
		["阿克蒙德"] = "阿克蒙德",
	--BT
		["高阶督军纳因图斯"] = "高阶督军纳因图斯",
		["苏普雷姆斯"] = "苏普雷姆斯",      
		["阿卡玛之影"] = "阿卡玛之影",      
		["塔隆·血魔"] = "塔隆·血魔",      
		["古尔图格·血沸"] = "古尔图格·血沸",  
		["愤怒精华"] = "灵魂之匣",        
		["莎赫拉丝主母"] = "莎赫拉丝主母",    
		["击碎者加西奥斯"] = "伊利达雷议会",               
		["伊利丹·怒风"] = "伊利丹·怒风",
	--ZulAman
		["纳洛拉克"] = "纳洛拉克",
		["埃基尔松"] = "埃基尔松",
		["哈尔拉兹"] = "哈尔拉兹",
		["加亚莱"] = "加亚莱",
		["妖术领主玛拉卡斯"] = "妖术领主玛拉卡斯",
		["祖尔金"] = "祖尔金",
	--SunWell
		["卡雷苟斯"] = "IGNORE",
		["腐蚀者萨索瓦尔"] = "卡雷苟斯",
		["布鲁塔卢斯"] = "布鲁塔卢斯",
		["菲米丝"] = "菲米丝",        
		["玛蒂苟萨"] = "IGNORE", -- Madrigosa	
		["高阶术士奥蕾塞丝"] = "艾瑞达双子",
		["萨洛拉丝女王"] = "艾瑞达双子",       
		["熵魔"] = "熵魔",
		["穆鲁"] = "IGNORE",
		["基尔加丹"] = "基尔加丹",
	
	-- WLK
	-- 红玉圣殿
		["扎瑞斯莱恩将军"] = "扎瑞斯莱恩将军",
		["『怒火』萨维安娜"] = "『怒火』萨维安娜",
		["『战争之子』巴尔萨拉斯"] = "『战争之子』巴尔萨拉斯",
		["海里昂"] = "海里昂",

	-- 奥妮克希亚的巢穴		
		["奥妮克希亚"] = "奥妮克希亚",
	
	-- 纳克萨玛斯	
		["阿努布雷坎"] = "阿努布雷坎",
		["教官拉苏维奥斯"] = "教官拉苏维奥斯",
		["收割者戈提克"] = "收割者戈提克",
		["大领主莫格莱尼"] = "大领主莫格莱尼",
		["瘟疫使者诺斯"] = "瘟疫使者诺斯",
		["肮脏的希尔盖"] = "肮脏的希尔盖",
		["洛欧塞布"] = "洛欧塞布",
		["迈克斯纳"] = "迈克斯纳",
		["黑女巫法琳娜"] = "黑女巫法琳娜",
		["帕奇维克"] = "帕奇维克",
		["格罗布鲁斯"] = "格罗布鲁斯",
		["格拉斯"] = "格拉斯",
		["塔迪乌斯"] = "塔迪乌斯",
		["萨菲隆"] = "萨菲隆",
		["克尔苏加德"] = "克尔苏加德",		
		["戴文瑞尔男爵"] = "戴文瑞尔男爵",
		["库尔塔兹领主"] = "库尔塔兹领主",
		["女公爵布劳缪克斯"] = "女公爵布劳缪克斯",
		["瑟里耶克爵士"] = "瑟里耶克爵士",
		
	-- 永恒之眼
		["玛里苟斯"] = "玛里苟斯",

	-- 黑曜石圣殿
		["萨塔里奥"] = "萨塔里奥",

	-- 阿尔卡冯的宝库
		["风暴看守者埃玛尔隆"] = "风暴看守者埃玛尔隆",		
		["火焰看守者科拉隆"] = "火焰看守者科拉隆",
		["岩石看守者阿尔卡冯"] = "岩石看守者阿尔卡冯",
		["寒冰看守者图拉旺"] = "寒冰看守者图拉旺",
	
	-- 奥杜尔
		["霍迪尔"] = "霍迪尔",
		["唤雷者布隆迪尔"] = "唤雷者布隆迪尔",
		["托里姆"] = "托里姆",
		["观察者奥尔加隆"] = "观察者奥尔加隆"	,
		["弗蕾亚"] = "弗蕾亚",
		["柯洛刚恩"] = "柯洛刚恩",	
		["烈焰巨兽"] = "烈焰巨兽",	
		["掌炉者伊格尼斯"] = "掌炉者伊格尼斯",
		["锋鳞"] = "锋鳞",
		["维扎克斯将军"] = "维扎克斯将军",
		["尤格-萨隆"] = "尤格-萨隆",
		["XT-002拆解者"] = "XT-002拆解者",	
		["米米尔隆"] = "米米尔隆",	
		["欧尔莉亚"] = "欧尔莉亚",

	-- 十字军的试炼	
		["冰吼"] = "冰吼",
		["加拉克苏斯大王"] = "加拉克苏斯大王",
		["勇士的宝箱"] = "勇士的宝箱",		
		["光明邪使菲奥拉"] = "光明邪使菲奥拉",
		["黑暗邪使艾蒂丝"] = "黑暗邪使艾蒂丝",
		["阿努巴拉克"] = "阿努巴拉克",
		["贡品"] = "贡品",

	-- ICC	
		["玛洛加尔领主"] = "玛洛加尔领主",
		["亡语者女士"] = "亡语者女士",
		["炮艇战"] = "炮艇战",
		["死亡使者萨鲁法尔"] = "死亡使者萨鲁法尔",
		["烂肠"] = "烂肠",
		["腐面"] = "腐面",
		["普崔塞德教授"] = "普崔塞德教授",		
		["瓦拉纳王子"] = "瓦拉纳王子",
		["凯雷希斯王子"] = "凯雷希斯王子",
		["泰尔达朗王子"] = "泰尔达朗王子",
		["鲜血女王兰娜瑟尔"] = "鲜血女王兰娜瑟尔",
		["踏梦者瓦莉瑟瑞娅"] = "踏梦者瓦莉瑟瑞娅",
		["辛达苟萨"] = "辛达苟萨",
		["巫妖王"] = "巫妖王",		
      
      -- 其他
		["玛瑟里顿"] = "玛瑟里顿",
		["末日领主卡扎克"] = "末日领主卡扎克",
		["末日行者"] = "末日行者",

		["棕色蟒蛇"] = "IGNORE",
		["青蛙"] = "IGNORE",
		["老鼠"] = "IGNORE",
		["蟑螂"] = "IGNORE",
		["小蛇"] = "IGNORE",
		["蛇"] = "IGNORE",
		["蝎子"] = "IGNORE",
		["修理机器人74A型"] = "IGNORE", --Field Repair Bot 74A
		["战地修理机器人110G"]= "IGNORE",

		["杂斑野猪"] = "IGNORE",
		
		["DEFAULTBOSS"] = "小怪掉落",
	};

	CT_RaidTracker_lang_BossKills_Majordomo_Yell = "不……不可能！等一下……我投降！我投降！";
	CT_RaidTracker_lang_BossKills_Majordomo_BossName = "管理者埃克索图斯";
	CT_RaidTracker_lang_BossKills_Ignore_Razorgore_Yell = "I'm free!  That device shall never torment me again!";
	CT_RaidTracker_lang_BossKills_Chess_Event_Yell = "当附着在象棋大厅门上的诅咒被驱散的同时，卡拉赞的大厅也开始剧烈的颤抖。"; -- need english translation
	CT_RaidTracker_lang_BossKills_Chess_Event_BossName = "象棋事件";
	CT_RaidTracker_lang_BossKills_Julianne_Die_Yell = "啊，好刀子！这就是你的鞘子；你插了进去，让我死了吧。";
	CT_RaidTracker_lang_BossKills_Julianne_BossName = "朱丽叶";
	-- 十字军的试练
	CT_RaidTracker_lang_BossKills_Hero_Yell =  "肤浅且可悲的胜利。今天的内耗让我们又一次被削弱了。这种愚蠢的行为只能让巫妖王受益！伟大的战士们就这样白白牺牲，而真正的威胁却步步逼近。巫妖王正计算着我们的死期。";
	CT_RaidTracker_lang_BossKills_Hero_BossName = "阵营勇士";
	
	PlayerGroupsIndexes = {"战士","牧师","法师","潜行者","圣骑士","德鲁伊","术士","萨满祭司","猎人","未知职业"};
	RAID_CLASS_COLORS_CN = {
              ["猎人"] = { r = 0.67, g = 0.83, b = 0.45 },
              ["术士"] = { r = 0.58, g = 0.51, b = 0.79 },
              ["牧师"] = { r = 1.0, g = 1.0, b = 1.0 },
              ["圣骑士"] = { r = 0.96, g = 0.55, b = 0.73 },
              ["法师"] = { r = 0.41, g = 0.8, b = 0.94 },
              ["潜行者"] = { r = 1.0, g = 0.96, b = 0.41 },
              ["德鲁伊"] = { r = 1.0, g = 0.49, b = 0.04 },
              ["萨满祭司"] = { r = 0.14, g = 0.35, b = 1.0 },
              ["战士"] = { r = 0.78, g = 0.61, b = 0.43 },
              ["未知职业"] = { r = 1.0, g = 1.0, b = 1.0 },
	}
end