local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");
local BabbleBoss = LibStub("LibBabble-Boss-3.0"):GetLookupTable();
local BabbleFaction = LibStub("LibBabble-Faction-3.0"):GetLookupTable();
local BabbleZone = LibStub("LibBabble-Zone-3.0"):GetLookupTable();

-- Index
--- Dungeons & Raids
---- Keys
---- Utgarde Keep
---- The Nexus
---- Azjol-Nerub
---- Ahn'kahet: The Old Kingdom
---- Drak'Tharon Keep
---- The Violet Hold
---- Gundrak
---- Halls of Stone
---- Halls of Lightning
---- Caverns of Time: Old Stratholme
---- Utgarde Pinnacle
---- The Oculus
---- Vault of Archavon
---- Naxxramas
----- Construct Quarter
----- Arachnid Quarter
----- Military Quarter
----- Plague Quarter
----- Frostwyrm Lair
---- Obsidian Sanctum
---- The Eye of Eternity
---- Ulduar
--- Factions
---- Alliance Vanguard
---- Argent Crusade
---- Frenzyheart Tribe
---- Horde Expedition
---- Kirin Tor
---- Knights of the Ebon Blade
---- The Kalu'ak
---- The Oracles
---- The Sons of Hodir
---- Winterfin Retreat
---- The Wyrmrest Accord
--- PvP
---- Armor Sets
---- Level 80 Epic Non-Sets
---- Savage Gladiator Weapons [unused]
---- Deadly Gladiator Weapons [unused]
---- Furious Gladiator Weapons
---- PvP Jewelcrafting Designs and Gems
---- World PvP - Wintergrasp
---- World PvP - Grizzly Hills: Venture Bay
--- Sets & Collections
---- Naxx Sets (T7)/Ulduar Sets (T8)
---- Tier 9 (T9)
---- Wrath Of The Lich King Sets
---- Blizzard Collectables
---- Legendaries
---- Tabards
---- Trading Card Game
---- Pets
---- Mounts
---- BoE World Epics
---- Emblem of Heroism Items
---- Emblem of Valor Items
---- Emblem of Conquest Items

	------------------------
	--- Dungeons & Raids ---
	------------------------

		------------
		--- Keys ---
		------------

	AtlasLoot_Data["WrathKeys"] = {
		{ 1, 44582, "", "=q4=Key to the Focusing Iris", "=ds=#e9#"};
		{ 2, 44581, "", "=q4=Heroic Key to the Focusing Iris", "=ds=#e9#"};
		{ 3, 45796, "", "=q1=Celestial Planetarium Key", "=ds=#e9#"};
		{ 4, 45798, "", "=q1=Heroic Celestial Planetarium Key", "=ds=#e9#"};
		{ 5, 42482, "", "=q1=The Violet Hold Key", "=ds=#e9#"};
	};

		--------------------
		--- Utgarde Keep ---
		--------------------

	AtlasLoot_Data["UtgardeKeepKeleseth"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35572, "", "=q3=Reinforced Velvet Helm", "=ds=#s1#, #a1#", "", "28%"};
		{ 3, 35571, "", "=q3=Dragon Stabler's Gauntlets", "=ds=#s9#, #a3#", "", "31%"};
		{ 4, 35570, "", "=q3=Keleseth's Blade of Evocation", "=ds=#h3#, #w4#", "", "28%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37180, "", "=q3=Battlemap Hide Helm", "=ds=#s1#, #a2#", "", "21%"};
		{ 19, 37178, "", "=q3=Strategist's Belt", "=ds=#s10#, #a4#", "", "22%"};
		{ 20, 37179, "", "=q3=Infantry Assault Blade", "=ds=#h1#, #w10#", "", "21%"};
		{ 21, 37177, "", "=q3=Wand of the San'layn", "=ds=#w12#", "", "21%"};
		Next = "UtgardeKeepSkarvald";
	};

	AtlasLoot_Data["UtgardeKeepSkarvald"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35575, "", "=q3=Skarvald's Dragonskin Habergeon", "=ds=#s5#, #a2#", "", "31%"};
		{ 3, 35574, "", "=q3=Chestplate of the Northern Lights", "=ds=#s5#, #a4#", "", "28%"};
		{ 4, 35573, "", "=q3=Arm Blade of Augelmir", "=ds=#h3#, #w13#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37183, "", "=q3=Bindings of the Tunneler", "=ds=#s8#, #a2#", "", "21%"};
		{ 19, 37184, "", "=q3=Dalronn's Jerkin", "=ds=#s5#, #a3#", "", "21%"};
		{ 20, 37182, "", "=q3=Helmet of the Constructor", "=ds=#s1#, #a4#", "", "21%"};
		{ 21, 37181, "", "=q3=Dagger of Betrayal", "=ds=#h1#, #w4#", "", "21%"};
		Prev = "UtgardeKeepKeleseth";
		Next = "UtgardeKeepIngvar";
	};

	AtlasLoot_Data["UtgardeKeepIngvar"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35577, "", "=q3=Holistic Patchwork Breeches", "=ds=#s11#, #a2#", "", "28%"};
		{ 3, 35578, "", "=q3=Overlaid Chain Spaulders", "=ds=#s3#, #a3#", "", "26%"};
		{ 4, 35576, "", "=q3=Ingvar's Monolithic Cleaver", "=ds=#h2#, #w1#", "", "27%"};
		{ 6, 33330, "", "=q1=Ingvar's Head", "=ds=#m3#"};
		{ 7, 38218, "", "=q3=Executioner's Band", "=q1=#m4#: =ds=#s13#"};
		{ 8, 38219, "", "=q3=Ring of Decimation", "=q1=#m4#: =ds=#s13#"};
		{ 9, 38220, "", "=q3=Signet of Swift Judgement", "=q1=#m4#: =ds=#s13#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37194, "", "=q4=Sharp-Barbed Leather Belt", "=ds=#s10#, #a2#", "", "20%"};
		{ 19, 37193, "", "=q4=Staggering Legplates", "=ds=#s11#, #a4#", "", "18%"};
		{ 20, 37192, "", "=q4=Annhylde's Ring", "=ds=#s13#", "", "18%"};
		{ 21, 37191, "", "=q4=Drake-Mounted Crossbow", "=ds=#w3#", "", "19%"};
		{ 22, 37189, "", "=q3=Breeches of the Caller", "=ds=#s11#, #a1#", "", "19%"};
		{ 23, 37188, "", "=q3=Plunderer's Helmet", "=ds=#s1#, #a3#", "", "20%"};
		{ 24, 37186, "", "=q3=Unsmashable Heavy Band", "=ds=#s13#", "", "20%"};
		{ 25, 37190, "", "=q3=Enraged Feral Staff", "=ds=#w9#", "", "20%"};
		{ 26, 41793, "", "=q3=Design: Fierce Monarch Topaz", "=ds=#p12# (390)", "", "8%"};
		{ 28, 43662, "", "=q1=Axe of the Plunderer", "=ds=#m3#"};
		Prev = "UtgardeKeepSkarvald";
		Next = "UtgardeKeepTrash";
	};

	AtlasLoot_Data["UtgardeKeepTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35580, "", "=q3=Skein Woven Mantle", "=ds=#s3#, #a1#", "", "1%"};
		{ 3, 35579, "", "=q3=Vrykul Shackles", "=ds=#s8#, #a2#", "", "2%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37197, "", "=q3=Tattered Castle Drape", "=ds=#s4#", "", "1%"};
		{ 18, 37196, "", "=q3=Runecaster's Mantle", "=ds=#s3#, #a1#", "", "1%"};
		Prev = "UtgardeKeepSkarvald";
	};

		-----------------
		--- The Nexus ---
		-----------------

	AtlasLoot_Data["TheNexusOrmorok"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35602, "", "=q3=Chiseled Stalagmite Pauldrons", "=ds=#s3#, #a4#", "", "30%"};
		{ 3, 35603, "", "=q3=Greaves of the Blue Flight", "=ds=#s12#, #a4#", "", "32%"};
		{ 4, 35601, "", "=q3=Drakonid Arm Blade", "=ds=#h4#, #w13#", "", "33%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37153, "", "=q3=Gloves of the Crystal Gardener", "=ds=#s9#, #a1#", "", "21%"};
		{ 19, 37155, "", "=q3=Frozen Forest Kilt", "=ds=#s11#, #a3#", "", "22%"};
		{ 20, 37152, "", "=q3=Girdle of Ice", "=ds=#s10#, #a4#", "", "22%"};
		{ 21, 37151, "", "=q3=Band of Frosted Thorns", "=ds=#s13#", "", "22%"};
		Next = "TheNexusAnomalus";
	};

	AtlasLoot_Data["TheNexusAnomalus"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35599, "", "=q3=Gauntlets of Serpent Scales", "=ds=#s9#, #a3#", "", "31%"};
		{ 3, 35600, "", "=q3=Cleated Ice Boots", "=ds=#s12#, #a3#", "", "29%" };
		{ 4, 35598, "", "=q3=Tome of the Lore Keepers", "=ds=#s15#", "", "29%" };
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37149, "", "=q3=Helm of Anomalus", "=ds=#s1#, #a2#", "", "21%"};
		{ 19, 37144, "", "=q3=Hauberk of the Arcane Wraith", "=ds=#s5#, #a3#", "", "22%"};
		{ 20, 37150, "", "=q3=Rift Striders", "=ds=#s12#, #a4#", "", "22%"};
		{ 21, 37141, "", "=q3=Amulet of Dazzling Light", "=ds=#s2#", "", "21%"};
		Prev = "TheNexusOrmorok";
		Next = "TheNexusTelestra";
	};

	AtlasLoot_Data["TheNexusTelestra"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35605, "", "=q3=Belt of Draconic Runes", "=ds=#s10#, #a2#", "", "29%" };
		{ 3, 35604, "", "=q3=Insulating Bindings", "=ds=#s8#, #a4#", "", "29%" };
		{ 4, 35617, "", "=q3=Wand of Shimmering Scales", "=ds=#w12#", "", "28%" };
		{ 6, 21524, "", "=q2=Red Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37139, "", "=q3=Spaulders of the Careless Thief", "=ds=#s3#, #a2#", "", "21%"};
		{ 19, 37138, "", "=q3=Bands of Channeled Energy", "=ds=#s8#, #a3#", "", "21%" };
		{ 20, 37135, "", "=q3=Arcane-Shielded Helm", "=ds=#s1#, #a4#", "", "21%" };
		{ 21, 37134, "", "=q3=Telestra's Journal", "=ds=#s15#", "", "20%" };
		{ 23, 21524, "", "=q2=Red Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		Prev = "TheNexusAnomalus";
		Next = "TheNexusKolurgStoutbeardHEROIC";
	};

	AtlasLoot_Data["TheNexusKolurgStoutbeardHEROIC"] = {
		{ 1, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 2, 37728, "", "=q3=Cloak of the Enemy", "=ds=#s4#", "", "20%"};
		{ 3, 37731, "", "=q3=Opposed Stasis Leggings", "=ds=#s11#, #a1#", "", "20%"};
		{ 4, 37730, "", "=q3=Cleric's Linen Shoes", "=ds=#s12#, #a1#", "", "19%"};
		{ 5, 37729, "", "=q3=Grips of Sculptured Icicles", "=ds=#s9#, #a4#", "", "20%"};
		Prev = "TheNexusTelestra";
		Next = "TheNexusKeristrasza";
	};

	AtlasLoot_Data["TheNexusKeristrasza"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35596, "", "=q3=Attuned Crystalline Boots", "=ds=#s12#, #a1#", "", "29%"};
		{ 3, 35595, "", "=q3=Glacier Sharpened Vileblade", "=ds=#h1#, #w4#", "", "30%"};
		{ 4, 35597, "", "=q3=Band of Glittering Permafrost", "=ds=#s13#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37172, "", "=q4=Gloves of Glistening Runes", "=ds=#s9#, #a1#", "", "19%"};
		{ 19, 37170, "", "=q4=Interwoven Scale Bracers", "=ds=#s8#, #a3#", "", "20%"};
		{ 20, 37171, "", "=q4=Flame-Bathed Steel Girdle", "=ds=#s10#, #a4#", "", "19%"};
		{ 21, 37169, "", "=q4=War Mace of Unrequited Love", "=ds=#h3#, #w6#", "", "18%"};
		{ 22, 37165, "", "=q3=Crystal-Infused Tunic", "=ds=#s5#, #a2#", "", "20%"};
		{ 23, 37167, "", "=q3=Dragon Slayer's Sabatons", "=ds=#s12#, #a3#", "", "20%"};
		{ 24, 37166, "", "=q3=Sphere of Red Dragon's Blood", "=ds=#s14#", "", "20%"};
		{ 25, 37162, "", "=q3=Bulwark of the Noble Protector", "=ds=#w8#", "", "20%"};
		{ 26, 41794, "", "=q3=Design: Deadly Monarch Topaz", "=ds=#p12# (390)", "", "9%"};
		{ 28, 43665, "", "=q1=Keristrasza's Broken Heart", "=ds=#m3#"};
		Prev = "TheNexusKolurgStoutbeardHEROIC";
	};

		-------------------
		--- Azjol-Nerub ---
		-------------------

	AtlasLoot_Data["AzjolNerubKrikthir"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35657, "", "=q3=Exquisite Spider-Silk Footwraps", "=ds=#s12#, #a1#", "", "30%"};
		{ 3, 35656, "", "=q3=Aura Focused Gauntlets", "=ds=#s9#, #a4#", "", "32%"};
		{ 4, 35655, "", "=q3=Cobweb Machete", "=ds=#h1#, #w4#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37218, "", "=q3=Stone-Worn Footwraps", "=ds=#s12#, #a1#", "", "21%"};
		{ 19, 37219, "", "=q3=Custodian's Chestpiece", "=ds=#s5#, #a2#", "", "21%"};
		{ 20, 37217, "", "=q3=Golden Limb Bands", "=ds=#s8#, #a4#", "", "22%"};
		{ 21, 37216, "", "=q3=Facade Shield of Glyphs", "=ds=#w8#", "", "22%"};
		Next = "AzjolNerubHadronox";
	};

	AtlasLoot_Data["AzjolNerubHadronox"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35660, "", "=q3=Spinneret Epaulets", "=ds=#s3#, #a2#", "", "30%"};
		{ 3, 35659, "", "=q3=Treads of Aspiring Heights", "=ds=#s12#, #a2#", "", "30%"};
		{ 4, 35658, "", "=q3=Life-Staff of the Web Lair", "=ds=#w9#", "", "29%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37222, "", "=q3=Egg Sac Robes", "=ds=#s5#, #a1#", "", "21%"};
		{ 19, 37230, "", "=q3=Grotto Mist Gloves", "=ds=#s9#, #a2#", "", "21%"};
		{ 20, 37221, "", "=q3=Hollowed Mandible Legplates", "=ds=#s11#, #a3#", "", "20%"};
		{ 21, 37220, "", "=q3=Essence of Gossamer", "=ds=#s14#", "", "20%"};
		Prev = "AzjolNerubKrikthir";
		Next = "AzjolNerubAnubarak";
	};

	AtlasLoot_Data["AzjolNerubAnubarak"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35663, "", "=q3=Charmed Silken Cord", "=ds=#s10#, #a1#", "", "29%"};
		{ 3, 35662, "", "=q3=Wing Cover Girdle", "=ds=#s10#, #a3#", "", "29%"};
		{ 4, 35661, "", "=q3=Signet of Arachnathid Command", "=ds=#s13#", "", "28%"};
		{ 6, 43411, "", "=q1=Anub'arak's Broken Husk", "=ds=#m3#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37242, "", "=q4=Sash of the Servant", "=ds=#s10#, #a1#", "", "19%"};
		{ 19, 37240, "", "=q4=Flamebeard's Bracers", "=ds=#s8#, #a4#", "", "19%"};
		{ 20, 37241, "", "=q4=Ancient Aligned Girdle", "=ds=#s10#, #a4#", "", "19%"};
		{ 21, 37238, "", "=q4=Rod of the Fallen Monarch", "=ds=#w12#", "", "19%"};
		{ 22, 37236, "", "=q3=Insect Vestments", "=ds=#s5#, #a2#", "", "20%"};
		{ 23, 37237, "", "=q3=Chitin Shell Greathelm", "=ds=#s1#, #a4#", "", "20%"};
		{ 24, 37232, "", "=q3=Ring of the Traitor King", "=ds=#s13#", "", "19%"};
		{ 25, 37235, "", "=q3=Crypt Lord's Deft Blade", "=ds=#h1#, #w10#", "", "21%"};
		{ 26, 41796, "", "=q3=Design: Infused Twilight Opal", "=ds=#p12# (390)", "", "12%"};
		{ 28, 43726, "", "=q1=The Idle Crown of Anub'arak", "=ds=#m3#"};
		Prev = "AzjolNerubHadronox";
		Next = "AzjolNerubTrash";
	};

	AtlasLoot_Data["AzjolNerubTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 2, 37243, "", "=q3=Treasure Seeker's Belt", "=ds=#s10#, #a2#", "", "1%"};
		{ 3, 37625, "", "=q3=Web Winder Gloves", "=ds=#s9#, #a4#", "", "1%"};
		{ 4, 37624, "", "=q3=Stained-Glass Shard Ring", "=ds=#s13#", "", "1%"};
		Prev = "AzjolNerubAnubarak";
	};

		----------------------------------
		--- Ahn'kahet: The Old Kingdom ---
		----------------------------------

	AtlasLoot_Data["AhnkahetNadox"] = {		
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35607, "", "=q3=Ahn'kahar Handwraps", "=ds=#s9#, #a2#", "", "30%"};
		{ 3, 35608, "", "=q3=Crawler-Emblem Belt", "=ds=#s10#, #a4#", "", "29%"};
		{ 4, 35606, "", "=q3=Blade of Nadox", "=ds=#h1#, #w4#", "", "31%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37594, "", "=q3=Elder Headpiece", "=ds=#s1#, #a1#", "", "22%"};
		{ 19, 37593, "", "=q3=Sprinting Shoulderpads", "=ds=#s3#, #a2#", "", "23%"};
		{ 20, 37592, "", "=q3=Brood Plague Helmet", "=ds=#s1#, #a3#", "", "22%"};
		{ 21, 37591, "", "=q3=Nerubian Shield Ring", "=ds=#s13#", "", "22%"};
		Next = "AhnkahetTaldaram";
	};

	AtlasLoot_Data["AhnkahetTaldaram"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35611, "", "=q3=Gloves of the Blood Prince", "=ds=#s9#, #a1#", "", "30%"};
		{ 3, 35610, "", "=q3=Slasher's Amulet", "=ds=#s2#", "", "31%"};
		{ 4, 35609, "", "=q3=Talisman of Scourge Command", "=ds=#s15#", "", "29%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37613, "", "=q3=Flame Sphere Bindings", "=ds=#s8#, #a1#", "", "21%"};
		{ 19, 37614, "", "=q3=Gauntlets of the Plundering Geist", "=ds=#s9#, #a3#", "", "21%"};
		{ 20, 37612, "", "=q3=Bonegrinder Breastplate", "=ds=#s5#, #a4#", "", "20%"};
		{ 21, 37595, "", "=q3=Necklace of Taldaram", "=ds=#s2#", "", "21%"};
		Prev = "AhnkahetNadox";
		Next = "AhnkahetAmanitarHEROIC";
	};

	AtlasLoot_Data["AhnkahetAmanitarHEROIC"] = {
		{ 1, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 2, 43287, "", "=q3=Silken Bridge Handwraps", "=ds=#s9#, #a1#", "", "21%"};
		{ 3, 43286, "", "=q3=Legguards of Swarming Attacks", "=ds=#s11#, #a2#", "", "23%"};
		{ 4, 43285, "", "=q3=Amulet of the Spell Flinger", "=ds=#s2#", "", "22%"};
		{ 5, 43284, "", "=q3=Amanitar Skullbow", "=ds=#w3#", "", "22%"};
		Prev = "AhnkahetTaldaram";
		Next = "AhnkahetJedoga";
	};

	AtlasLoot_Data["AhnkahetJedoga"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 43278, "", "=q3=Cloak of the Darkcaster", "=ds=#s4#", "", "30%"};
		{ 3, 43279, "", "=q3=Battlechest of the Twilight Cult", "=ds=#s5#, #a4#", "", "29%"};
		{ 4, 43277, "", "=q3=Jedoga's Greatring", "=ds=#s13#", "", "28%"};
		{ 6, 21524, "", "=q2=Red Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 43283, "", "=q3=Subterranean Waterfall Shroud", "=ds=#s4#", "", "21%"};
		{ 19, 43280, "", "=q3=Faceguard of the Hammer Clan", "=ds=#s1#, #a4#", "", "21%"};
		{ 20, 43282, "", "=q3=Shadowseeker's Pendant", "=ds=#s2#", "", "22%"};
		{ 21, 43281, "", "=q3=Edge of Oblivion", "=ds=#h2#, #w1#", "", "22%"};
		{ 23, 21524, "", "=q2=Red Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		Prev = "AhnkahetAmanitarHEROIC";
		Next = "AhnkahetVolazj";
	};

	AtlasLoot_Data["AhnkahetVolazj"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35612, "", "=q3=Mantle of Echoing Bats", "=ds=#s3#, #a1#", "", "29%"};
		{ 3, 35613, "", "=q3=Pyramid Embossed Belt", "=ds=#s10#, #a2#", "", "31%"};
		{ 4, 35614, "", "=q3=Volazj's Sabatons", "=ds=#s12#, #a4#", "", "31%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37622, "", "=q4=Skirt of the Old Kingdom", "=ds=#s11#, #a1#", "", "19%"};
		{ 19, 37623, "", "=q4=Fiery Obelisk Handguards", "=ds=#s9#, #a3#", "", "19%"};
		{ 20, 37620, "", "=q4=Bracers of the Herald", "=ds=#s8#, #a4#", "", "18%"};
		{ 21, 37619, "", "=q4=Wand of Ahnkahet", "=ds=#w12#", "", "18%"};
		{ 22, 37616, "", "=q3=Kilt of the Forgotten One", "=ds=#s11#, #a2#", "", "19%"};
		{ 23, 37618, "", "=q3=Greaves of Ancient Evil", "=ds=#s12#, #a4#", "", "20%"};
		{ 24, 37617, "", "=q3=Staff of Sinister Claws", "=ds=#w9#", "", "19%"};
		{ 25, 37615, "", "=q3=Titanium Compound Bow", "=ds=#w2#", "", "19%"};
		{ 26, 41790, "", "=q3=Design: Precise Scarlet Ruby", "=ds=#p12# (390)", "", "17%"};
		{ 28, 43821, "", "=q1=Faceless One's Withered Brain", "=ds=#m3#"};
		Prev = "AhnkahetJedoga";
		Next = "AhnkahetTrash";
	};

	AtlasLoot_Data["AhnkahetTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35616, "", "=q3=Spored Tendrils Spaulders", "=ds=#s3#, #a3#", "", "1%"};
		{ 3, 35615, "", "=q3=Glowworm Cavern Bindings", "=ds=#s8#, #a3#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37625, "", "=q3=Web Winder Gloves", "=ds=#s9#, #a4#", "", "1%"};
		{ 18, 37624, "", "=q3=Stained-Glass Shard Ring", "=ds=#s13#", "", "1%"};
		Prev = "AhnkahetVolazj";
	};

		------------------------
		--- Drak'Tharon Keep ---
		------------------------

	AtlasLoot_Data["DrakTharonKeepTrollgore"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35620, "", "=q3=Berserker's Horns", "=ds=#s1#, #a2#", "", "33%"};
		{ 3, 35619, "", "=q3=Infection Resistant Legguards", "=ds=#s11#, #a3#", "", "28%"};
		{ 4, 35618, "", "=q3=Troll Butcherer", "=ds=#h2#, #w10#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37715, "", "=q3=Cowl of the Dire Troll", "=ds=#s1#, #a1#", "", "21%"};
		{ 19, 37714, "", "=q3=Batrider's Cord", "=ds=#s10#, #a2#", "", "22%"};
		{ 20, 37717, "", "=q3=Legs of Physical Regeneration", "=ds=#s11#, #a4#", "", "22%"};
		{ 21, 37712, "", "=q3=Terrace Defence Boots", "=ds=#s12#, #a4#", "", "22%"};
		Next = "DrakTharonKeepNovos";
	};

	AtlasLoot_Data["DrakTharonKeepNovos"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35632, "", "=q3=Robes of Novos", "=ds=#s5#, #a1#", "", "32%"};
		{ 3, 35631, "", "=q3=Crystal Pendant of Warding", "=ds=#s2#", "", "28%"};
		{ 4, 35630, "", "=q3=Summoner's Stone Gavel", "=ds=#h1#, #w6#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37722, "", "=q3=Breastplate of Undeath", "=ds=#s5#, #a4#", "", "22%"};
		{ 19, 37718, "", "=q3=Temple Crystal Fragment", "=ds=#s15#", "", "21%"};
		{ 20, 37721, "", "=q3=Cursed Lich Blade", "=ds=#h3#, #w10#", "", "22%"};
		Prev = "DrakTharonKeepTrollgore";
		Next = "DrakTharonKeepKingDred";
	};

	AtlasLoot_Data["DrakTharonKeepKingDred"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35635, "", "=q3=Stable Master's Breeches", "=ds=#s11#, #a1#", "", "28%"};
		{ 3, 35634, "", "=q3=Scabrous-Hide Helm", "=ds=#s1#, #a2#", "", "28%"};
		{ 4, 35633, "", "=q3=Staff of the Great Reptile", "=ds=#w9#", "", "31%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37725, "", "=q3=Savage Wound Wrap", "=ds=#s8#, #a1#", "", "21%"};
		{ 19, 37724, "", "=q3=Handler's Arm Strap", "=ds=#s8#, #a2#", "", "21%"};
		{ 20, 37726, "", "=q3=King Dred's Helm", "=ds=#s1#, #a3#", "", "21%"};
		{ 21, 37723, "", "=q3=Incisor Fragment", "=ds=#s14#", "", "21%"};
		Prev = "DrakTharonKeepNovos";
		Next = "DrakTharonKeepTharonja";
	};

	AtlasLoot_Data["DrakTharonKeepTharonja"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35638, "", "=q3=Helmet of Living Flesh", "=ds=#s1#, #a3#", "", "33%"};
		{ 3, 35637, "", "=q3=Muradin's Lost Greaves", "=ds=#s11#, #a4#", "", "28%"};
		{ 4, 35636, "", "=q3=Tharon'ja's Aegis", "=ds=#w8#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37798, "", "=q4=Overlook Handguards", "=ds=#s9#, #a1#", "", "19%"};
		{ 19, 37791, "", "=q4=Leggings of the Winged Serpent", "=ds=#s11#, #a2#", "", "20%"};
		{ 20, 37788, "", "=q4=Limb Regeneration Bracers", "=ds=#s8#, #a3#", "", "21%"};
		{ 21, 37784, "", "=q4=Keystone Great-Ring", "=ds=#s13#", "", "19%"};
		{ 22, 37735, "", "=q3=Ziggurat Imprinted Chestguard", "=ds=#s5#, #a4#", "", "21%"};
		{ 23, 37732, "", "=q3=Spectral Seal of the Prophet", "=ds=#s13#", "", "20%"};
		{ 24, 37734, "", "=q3=Talisman of Troll Divinity", "=ds=#s14#", "", "21%"};
		{ 25, 37733, "", "=q3=Mojo Masked Crusher", "=ds=#h2#, #w6#", "", "21%"};
		{ 26, 41795, "", "=q3=Design: Timeless Forest Emerald", "=ds=#p12# (390)", "", "14%"};
		{ 28, 43670, "", "=q1=Prophet's Enchanted Tiki", "=ds=#m3#"};
		Prev = "DrakTharonKeepKingDred";
		Next = "DrakTharonKeepTrash";
	};

	AtlasLoot_Data["DrakTharonKeepTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35641, "", "=q3=Scytheclaw Boots", "=ds=#s12#, #a2#", "", "1%"};
		{ 3, 35640, "", "=q3=Darkweb Bindings", "=ds=#s8#, #a3#", "", "1%"};
		{ 4, 35639, "", "=q3=Brighthelm of Guarding", "=ds=#s1#, #a4#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37799, "", "=q3=Reanimator's Cloak", "=ds=#s4#", "", "1%"};
		{ 18, 37800, "", "=q3=Aviary Guardsman's Hauberk", "=ds=#s5#, #a3#", "", "1%"};
		{ 19, 37801, "", "=q3=Waistguard of the Risen Knight", "=ds=#s10#, #a4#", "", "1%"};
		Prev = "DrakTharonKeepTharonja";
	};

		-----------------------
		--- The Violet Hold ---
		-----------------------

	AtlasLoot_Data["VioletHoldErekem"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 43363, "", "=q3=Screeching Cape", "=ds=#s4#", "", "43%"};
		{ 3, 43375, "", "=q3=Trousers of the Arakkoa", "=ds=#s11#, #a1#", "", "45%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 43406, "", "=q3=Cloak of the Gushing Wound", "=ds=#s4#", "", "29%"};
		{ 19, 43405, "", "=q3=Sabatons of Erekem", "=ds=#s12#, #a4#", "", "29%"};
		{ 20, 43407, "", "=q3=Stormstrike Mace", "=ds=#h1#, #w6#", "", "30%"};
		Next = "VioletHoldZuramat";
	};

	AtlasLoot_Data["VioletHoldZuramat"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 43353, "", "=q3=Void Sentry Legplates", "=ds=#s11#, #a4#", "", "44%"};
		{ 3, 43358, "", "=q3=Pendant of Shadow Beams", "=ds=#s2#", "", "41%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 43403, "", "=q3=Shroud of Darkness", "=ds=#s1#, #a2#", "", "28%"};
		{ 19, 43402, "", "=q3=The Obliterator Greaves", "=ds=#s12#, #a4#", "", "28%"};
		{ 20, 43404, "", "=q3=Zuramat's Necklace", "=ds=#s2#", "", "28%"};
		Prev = "VioletHoldErekem";
		Next = "VioletHoldXevozz";
	};

	AtlasLoot_Data["VioletHoldXevozz"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35644, "", "=q3=Xevozz's Belt", "=ds=#s10#, #a3#", "", "43%"};
		{ 3, 35642, "", "=q3=Riot Shield", "=ds=#w8#", "", "42%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37867, "", "=q3=Footwraps of Teleportation", "=ds=#s12#, #a1#", "", "29%"};
		{ 19, 37868, "", "=q3=Girdle of the Ethereal", "=ds=#s10#, #a3#", "", "29%"};
		{ 20, 37861, "", "=q3=Necklace of Arcane Spheres", "=ds=#s2#", "", "29%"};
		Prev = "VioletHoldZuramat";
		Next = "VioletHoldIchoron";
	};

	AtlasLoot_Data["VioletHoldIchoron"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35647, "", "=q3=Handguards of Rapid Pursuit", "=ds=#s9#, #a2#", "", "44%"};
		{ 3, 35643, "", "=q3=Spaulders of Ichoron", "=ds=#s3#, #a4#", "", "40%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 43401, "", "=q3=Water-Drenched Robe", "=ds=#s5#, #a1#", "", "28%"};
		{ 19, 37862, "", "=q3=Gauntlets of the Water Revenant", "=ds=#s9#, #a4#", "", "28%"};
		{ 20, 37869, "", "=q3=Globule Signet", "=ds=#s13#", "", "28%"};
		Prev = "VioletHoldXevozz";
		Next = "VioletHoldMoragg";
	};

	AtlasLoot_Data["VioletHoldMoragg"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 43387, "", "=q3=Shoulderplates of the Beholder", "=ds=#s3#, #a4#", "", "43%"};
		{ 3, 43382, "", "=q3=Band of Eyes", "=ds=#s13#", "", "43%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 43410, "", "=q3=Moragg's Chestguard", "=ds=#s5#, #a3#", "", "29%"};
		{ 19, 43408, "", "=q3=Solitare of Reflecting Beams", "=ds=#s13#", "", "29%"};
		{ 20, 43409, "", "=q3=Saliva Corroded Pike", "=ds=#w7#", "", "30%"};
		Prev = "VioletHoldIchoron";
		Next = "VioletHoldLavanthor";
	};

	AtlasLoot_Data["VioletHoldLavanthor"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35646, "", "=q3=Lava Burn Gloves", "=ds=#s9#, #a1#", "", "44%"};
		{ 3, 35645, "", "=q3=Prison Warden's Shotgun", "=ds=#w5#", "", "45%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37870, "", "=q3=Twin-Headed Boots", "=ds=#s12#, #a3#", "", "30%"};
		{ 19, 37872, "", "=q3=Lavanthor's Talisman", "=ds=#s14#", "", "30%"};
		{ 20, 37871, "", "=q3=The Key", "=ds=#h1#, #w1#", "", "29%"};
		Prev = "VioletHoldMoragg";
		Next = "VioletHoldCyanigosa";
	};

	AtlasLoot_Data["VioletHoldCyanigosa"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35650, "", "=q3=Boots of the Portal Guardian", "=ds=#s12#, #a3#", "", "31%"};
		{ 3, 35651, "", "=q3=Plate Claws of the Dragon", "=ds=#s9#, #a4#", "", "31%"};
		{ 4, 35649, "", "=q3=Jailer's Baton", "=ds=#w9#", "", "31%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37884, "", "=q4=Azure Cloth Bindings", "=ds=#s8#, #a1#", "", "20%"};
		{ 19, 37886, "", "=q4=Handgrips of the Savage Emissary", "=ds=#s9#, #a3#", "", "21%"};
		{ 20, 43500, "", "=q4=Bolstered Legplates", "=ds=#s11#, #a4#", "", "20%"};
		{ 21, 37883, "", "=q4=Staff of Trickery", "=ds=#w9#", "", "21%"};
		{ 23, 37876, "", "=q3=Cyanigosa's Leggings", "=ds=#s11#, #a1#", "", "22%"};
		{ 24, 37875, "", "=q3=Spaulders of the Violet Hold", "=ds=#s3#, #a3#", "", "21%"};
		{ 25, 37874, "", "=q3=Gauntlets of Capture", "=ds=#s9#, #a4#", "", "21%"};
		{ 26, 37873, "", "=q3=Mark of the War Prisoner", "=ds=#s14#", "", "20%"};
		{ 27, 41791, "", "=q3=Design: Thick Autumn's Glow", "=ds=#p12# (390)", "", "9%"};
		{ 29, 43823, "", "=q1=Head of Cyanigosa", "=ds=#m3#"};
		Prev = "VioletHoldLavanthor";
		Next = "VioletHoldTrash";
	};

	AtlasLoot_Data["VioletHoldTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35654, "", "=q3=Bindings of the Bastille", "=ds=#s8#, #a1#", "", "1%"};
		{ 3, 35653, "", "=q3=Dungeon Girdle", "=ds=#s10#, #a4#", "", "1%"};
		{ 4, 35652, "", "=q3=Incessant Torch", "=ds=#w12#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 35654, "", "=q3=Bindings of the Bastille", "=ds=#s8#, #a1#", "", "1%"};
		{ 18, 37890, "", "=q3=Chain Gang Legguards", "=ds=#s11#, #a2#", "", "1%"};
		{ 19, 37891, "", "=q3=Cast Iron Shackles", "=ds=#s8#, #a4#", "", "1%"};
		{ 20, 35653, "", "=q3=Dungeon Girdle", "=ds=#s10#, #a4#", "", "1%"};
		{ 21, 37889, "", "=q3=Prison Manifest", "=ds=#s15#", "", "1%"};
		{ 22, 35652, "", "=q3=Incessant Torch", "=ds=#w12#", "", "1%"};
		Prev = "VioletHoldCyanigosa";
	};

		---------------
		--- Gundrak ---
		---------------

	AtlasLoot_Data["GundrakSladran"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35584, "", "=q3=Embroidered Gown of Zul'drak", "=ds=#s5#, #a1#", "", "28%"};
		{ 3, 35585, "", "=q3=Cannibal's Legguards", "=ds=#s11#, #a3#", "", "29%"};
		{ 4, 35583, "", "=q3=Witch Doctor's Wildstaff", "=ds=#w9#", "", "28%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37629, "", "=q3=Slithering Slippers", "=ds=#s12#, #a1#", "", "21%"};
		{ 19, 37628, "", "=q3=Slad'ran's Coiled Cord", "=ds=#s10#, #a3#", "", "20%"};
		{ 20, 37627, "", "=q3=Snake Den Spaulders", "=ds=#s3#, #a4#", "", "20%"};
		{ 21, 37626, "", "=q3=Wand of Sseratus", "=ds=#w12#", "", "20%"};
		Next = "GundrakColossus";
	};

	AtlasLoot_Data["GundrakColossus"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35591, "", "=q3=Shoulderguards of the Ice Troll", "=ds=#s3#, #a2#", "", "25%"};
		{ 3, 35592, "", "=q3=Hauberk of Totemic Mastery", "=ds=#s5#, #a3#", "", "26%"};
		{ 4, 35590, "", "=q3=Drakkari Hunting Bow", "=ds=#w2#", "", "26%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37637, "", "=q3=Living Mojo Belt", "=ds=#s10#, #a1#", "", "20%"};
		{ 19, 37636, "", "=q3=Helm of Cheated Fate", "=ds=#s1#, #a2#", "", "21%"};
		{ 20, 37634, "", "=q3=Bracers of the Divine Elemental", "=ds=#s8#, #a2#", "", "20%"};
		{ 21, 37635, "", "=q3=Pauldrons of the Colossus", "=ds=#s3#, #a4#", "", "20%"};
		Prev = "GundrakSladran";
		Next = "GundrakMoorabi";
	};

	AtlasLoot_Data["GundrakMoorabi"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35588, "", "=q3=Forlorn Breastplate of War", "=ds=#s5#, #a4#", "", "29%"};
		{ 3, 35589, "", "=q3=Arcane Focal Signet", "=ds=#s13#", "", "29%"};
		{ 4, 35587, "", "=q3=Frozen Scepter of Necromancy", "=ds=#h3#, #w6#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37630, "", "=q3=Shroud of Moorabi", "=ds=#s4#", "", "21%"};
		{ 19, 37633, "", "=q3=Ground Tremor Helm", "=ds=#s1#, #a4#", "", "22%"};
		{ 20, 37632, "", "=q3=Mojo Frenzy Greaves", "=ds=#s12#, #a4#", "", "22%"};
		{ 21, 37631, "", "=q3=Fist of the Deity", "=ds=#h3#, #w13#", "", "22%"};
		Prev = "GundrakColossus";
		Next = "GundrakEckHEROIC";
	};

	AtlasLoot_Data["GundrakEckHEROIC"] = {
		{ 1, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 2, 43313, "", "=q3=Leggings of the Ruins Dweller", "=ds=#s11#, #a1#", "", "23%"};
		{ 3, 43312, "", "=q3=Gorloc Muddy Footwraps", "=ds=#s12#, #a2#", "", "23%"};
		{ 4, 43311, "", "=q3=Helmet of the Shrine", "=ds=#s1#, #a3#", "", "22%"};
		{ 5, 43310, "", "=q3=Engraved Chestplate of Eck", "=ds=#s5#, #a4#", "", "23%"};
		Prev = "GundrakMoorabi";
		Next = "GundrakGaldarah";
	};

	AtlasLoot_Data["GundrakGaldarah"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 43305, "", "=q3=Shroud of Akali", "=ds=#s4#", "", "28%"};
		{ 3, 43309, "", "=q3=Amulet of the Stampede", "=ds=#s2#", "", "31%"};
		{ 4, 43306, "", "=q3=Gal'darah's Signet", "=ds=#s13#", "", "30%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37643, "", "=q4=Sash of Blood Removal", "=ds=#s10#, #a2#", "", "19%"};
		{ 19, 37644, "", "=q4=Gored Hide Legguards", "=ds=#s11#, #a2#", "", "19%"};
		{ 20, 37645, "", "=q4=Horn-Tipped Gauntlets", "=ds=#s9#, #a4#", "", "19%"};
		{ 21, 37642, "", "=q4=Hemorrhaging Circle", "=ds=#s13#", "", "18%"};
		{ 22, 37641, "", "=q3=Arcane Flame Altar-Garb", "=ds=#s5#, #a1#", "", "19%"};
		{ 23, 37640, "", "=q3=Boots of Transformation", "=ds=#s12#, #a2#", "", "20%"};
		{ 24, 37639, "", "=q3=Grips of the Beast God", "=ds=#s9#, #a3#", "", "20%"};
		{ 25, 37638, "", "=q3=Offering of Sacrifice", "=ds=#s14#", "", "20%"};
		{ 27, 43693, "", "=q1=Mojo Remnant of Akali", "=ds=#m3#"};
		Prev = "GundrakEckHEROIC";
		Next = "GundrakTrash";
	};

	AtlasLoot_Data["GundrakTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35594, "", "=q3=Snowmelt Silken Cinch", "=ds=#s10#, #a1#", "", "2%"};
		{ 3, 35593, "", "=q3=Steel Bear Trap Bracers", "=ds=#s8#, #a4#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37647, "", "=q3=Cloak of Bloodied Waters", "=ds=#s4#", "", "1%"};
		{ 18, 37648, "", "=q3=Belt of Tasseled Lanterns", "=ds=#s10#, #a3#", "", "1%"};
		{ 19, 37646, "", "=q3=Burning Skull Pendant", "=ds=#s2#", "", "1%"};
		Prev = "GundrakGaldarah";
	}; 

		----------------------
		--- Halls of Stone ---
		----------------------

	AtlasLoot_Data["HallsofStoneMaiden"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 38614, "", "=q3=Embrace of Sorrow", "=ds=#s4#", "", "28%"};
		{ 3, 38613, "", "=q3=Chain of Fiery Orbs", "=ds=#s2#", "", "29%"};
		{ 4, 38611, "", "=q3=Ringlet of Repose", "=ds=#s13#", "", "29%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 38616, "", "=q3=Maiden's Girdle", "=ds=#s10#, #a2#", "", "21%"};
		{ 19, 38615, "", "=q3=Lightning-Charged Gloves", "=ds=#s9#, #a3#", "", "21%"};
		{ 20, 38617, "", "=q3=Woeful Band", "=ds=#s13#", "", "22%"};
		{ 21, 38618, "", "=q3=Hammer of Grief", "=ds=#h2#, #w6#", "", "22%"};
		Next = "HallsofStoneKrystallus";
	};

	AtlasLoot_Data["HallsofStoneKrystallus"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35673, "", "=q3=Leggings of Burning Gleam", "=ds=#s11#, #a1#", "", "29%"};
		{ 3, 35672, "", "=q3=Hollow Geode Helm", "=ds=#s1#, #a3#", "", "30%"};
		{ 4, 35670, "", "=q3=Brann's Lost Mining Helmet", "=ds=#s1#, #a4#", "", "26%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37652, "", "=q3=Spaulders of Krystallus", "=ds=#s3#, #a2#", "", "28%"};
		{ 19, 37650, "", "=q3=Shardling Legguards", "=ds=#s11#, #a4#", "", "27%"};
		{ 20, 37651, "", "=q3=The Prospector's Prize", "=ds=#s13#", "", "27%"};
		Prev = "HallsofStoneMaiden";
		Next = "HallsofStoneTribunal";
	};

	AtlasLoot_Data["HallsofStoneTribunal"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35677, "", "=q3=Cosmos Vestments", "=ds=#s5#, #a2#", "", "25%"};
		{ 3, 35676, "", "=q3=Constellation Leggings", "=ds=#s11#, #a2#", "", "26%"};
		{ 4, 35675, "", "=q3=Linked Armor of the Sphere", "=ds=#s5#, #a3#", "", "24%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37655, "", "=q3=Mantle of the Tribunal", "=ds=#s3#, #a1#", "", "16%"};
		{ 19, 37656, "", "=q3=Raging Construct Bands", "=ds=#s8#, #a3#", "", "16%"};
		{ 20, 37654, "", "=q3=Sabatons of the Ages", "=ds=#s12#, #a3#", "", "14%"};
		{ 21, 37653, "", "=q3=Sword of Justice", "=ds=#h2#, #w10#", "", "16%"};
		Prev = "HallsofStoneKrystallus";
		Next = "HallsofStoneSjonnir";
	};

	AtlasLoot_Data["HallsofStoneSjonnir"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35679, "", "=q3=Static Cowl", "=ds=#s1#, #a1#", "", "28%"};
		{ 3, 35678, "", "=q3=Ironshaper's Legplates", "=ds=#s11#, #a4#", "", "28%"};
		{ 4, 35680, "", "=q3=Amulet of Wills", "=ds=#s2#", "", "29%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37669, "", "=q4=Leggings of the Stone Halls", "=ds=#s11#, #a3#", "", "18%"};
		{ 19, 37668, "", "=q4=Bands of the Stoneforge", "=ds=#s8#, #a4#", "", "18%"};
		{ 20, 37670, "", "=q4=Sjonnir's Girdle", "=ds=#s10#, #a4#", "", "18%"};
		{ 21, 37667, "", "=q4=The Fleshshaper", "=ds=#h1#, #w4#", "", "18%"};
		{ 23, 37666, "", "=q3=Boots of the Whirling Mist", "=ds=#s12#, #a2#", "", "19%"};
		{ 24, 37658, "", "=q3=Sun-Emblazoned Chestplate", "=ds=#s5#, #a4#", "", "19%"};
		{ 25, 37657, "", "=q3=Spark of Life", "=ds=#s14#", "", "19%"};
		{ 26, 37660, "", "=q3=Forge Ember", "=ds=#s14#", "", "18%"};
		{ 27, 41792, "", "=q3=Design: Deft Monarch Topaz", "=ds=#p12# (390)", "", "15%"};
		{ 29, 43699, "", "=q1=The Curse of Flesh Disc", "=ds=#m3#"};
		Prev = "HallsofStoneTribunal";
		Next = "HallsofStoneTrash";
	};

	AtlasLoot_Data["HallsofStoneTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 35682, "", "=q3=Rune Giant Bindings", "=ds=#s8#, #a1#", "", "0.44%"};
		{ 3, 35683, "", "=q3=Palladium Ring", "=ds=#s13#", "", "0.46%"};
		{ 4, 35681, "", "=q3=Unrelenting Blade", "=ds=#h1#, #w4#", "", "0.41%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37673, "", "=q3=Dark Runic Mantle", "=ds=#s3#, #a1#", "", "1%"};
		{ 18, 37672, "", "=q3=Patina-Coated Breastplate", "=ds=#s5#, #a4#", "", "1%"};
		{ 19, 37671, "", "=q3=Refined Ore Gloves", "=ds=#s9#, #a4#", "", "1%"};
		Prev = "HallsofStoneSjonnir";
	};

		--------------------------
		--- Halls of Lightning ---
		--------------------------

	AtlasLoot_Data["HallsofLightningBjarngrim"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36982, "", "=q3=Mantle of Electrical Charges", "=ds=#s3#, #a1#", "", "22%"};
		{ 3, 36979, "", "=q3=Bjarngrim Family Signet", "=ds=#s13#", "", "22%"};
		{ 4, 36980, "", "=q3=Hewn Sparring Quarterstaff", "=ds=#w9#", "", "22%"};
		{ 5, 36981, "", "=q3=Hardened Vrykul Throwing Axe", "=ds=#w11#", "", "23%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37825, "", "=q3=Traditionally Dyed Handguards", "=ds=#s9#, #a1#", "", "21%"};
		{ 19, 37818, "", "=q3=Patroller's War-Kilt", "=ds=#s11#, #a3#", "", "21%"};
		{ 20, 37814, "", "=q3=Iron Dwarf Smith Pauldrons", "=ds=#s3#, #a4#", "", "21%"};
		{ 21, 37826, "", "=q3=The General's Steel Girdle", "=ds=#s10#, #a4#", "", "22%"};
		Next = "HallsofLightningVolkhan";
	};

	AtlasLoot_Data["HallsofLightningVolkhan"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36983, "", "=q3=Cape of Seething Steam", "=ds=#s4#", "", "22%"};
		{ 3, 36985, "", "=q3=Volkhan's Hood", "=ds=#s1#, #a1#", "", "23%"};
		{ 4, 36986, "", "=q3=Kilt of Molten Golems", "=ds=#s11#, #a3#", "", "22%"};
		{ 5, 36984, "", "=q3=Eternally Folded Blade", "=ds=#h1#, #w10#", "", "22%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37840, "", "=q3=Shroud of Reverberation", "=ds=#s4#", "", "21%"};
		{ 19, 37843, "", "=q3=Giant-Hair Woven Gloves", "=ds=#s9#, #a1#", "", "21%"};
		{ 20, 37842, "", "=q3=Belt of Vivacity", "=ds=#s10#, #a2#", "", "21%"};
		{ 21, 37841, "", "=q3=Slag Footguards", "=ds=#s12#, #a2#", "", "21%"};
		Prev = "HallsofLightningBjarngrim";
		Next = "HallsofLightningIonar";
	};

	AtlasLoot_Data["HallsofLightningIonar"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 39536, "", "=q3=Thundercloud Grasps", "=ds=#s9#, #a1#", "", "22%"};
		{ 3, 39657, "", "=q3=Tornado Cuffs", "=ds=#s8#, #a3#", "", "21%"};
		{ 4, 39534, "", "=q3=Pauldrons of the Lightning Revenant", "=ds=#s3#, #a4#", "", "21%"};
		{ 5, 39535, "", "=q3=Ionar's Girdle", "=ds=#s10#, #a4#", "", "21%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37846, "", "=q3=Charged-Bolt Grips", "=ds=#s9#, #a2#", "", "20%"};
		{ 19, 37845, "", "=q3=Cord of Swirling Winds", "=ds=#s10#, #a3#", "", "21%"};
		{ 20, 37826, "", "=q3=The General's Steel Girdle", "=ds=#s10#, #a4#", "", "22%"};
		{ 21, 37844, "", "=q3=Winged Talisman", "=ds=#s14#", "", "21%"};
		Prev = "HallsofLightningVolkhan";
		Next = "HallsofLightningLoken";
	};

	AtlasLoot_Data["HallsofLightningLoken"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36991, "", "=q3=Raiments of the Titans", "=ds=#s5#, #a1#", "", "22%"};
		{ 3, 36996, "", "=q3=Hood of the Furtive Assassin", "=ds=#s1#, #a2#", "", "22%"};
		{ 4, 36992, "", "=q3=Leather-Braced Chain Leggings", "=ds=#s11#, #a3#", "", "22%"};
		{ 5, 36995, "", "=q3=Fists of Loken", "=ds=#s9#, #a4#", "", "22%"};
		{ 6, 36988, "", "=q3=Chaotic Spiral Amulet", "=ds=#s2#", "", "22%"};
		{ 7, 36993, "", "=q3=Seal of the Pantheon", "=ds=#s14#", "", "18%"};
		{ 8, 36994, "", "=q3=Projectile Activator", "=ds=#w5#", "", "21%"};
		{ 9, 36989, "", "=q3=Ancient Measuring Rod", "=ds=#w12#", "", "21%"};
		{ 10, 41799, "", "=q3=Design: Eternal Earthsiege Diamond", "=ds=#p12# (420)", "", "11%"};
		{ 12, 43151, "", "=q1=Loken's Tongue", "=ds=#m3#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37854, "", "=q4=Woven Bracae Leggings", "=ds=#s11#, #a1#", "", "18%"};
		{ 19, 37853, "", "=q4=Advanced Tooled-Leather Bands", "=ds=#s8#, #a2#", "", "18%"};
		{ 20, 37855, "", "=q4=Mail Girdle of the Audient Earth", "=ds=#s10#, #a3#", "", "19%"};
		{ 21, 37852, "", "=q4=Colossal Skull-Clad Cleaver", "=ds=#h2#, #w1#", "", "18%"};
		{ 23, 37851, "", "=q3=Ornate Woolen Stola", "=ds=#s5#, #a1#", "", "19%"};
		{ 24, 37850, "", "=q3=Flowing Sash of Order", "=ds=#s10#, #a1#", "", "19%"};
		{ 25, 37849, "", "=q3=Planetary Helm", "=ds=#s1#, #a4#", "", "19%"};
		{ 26, 37848, "", "=q3=Lightning Giant Staff", "=ds=#w9#", "", "18%"};
		{ 27, 41799, "", "=q3=Design: Eternal Earthsiege Diamond", "=ds=#p12# (420)", "", "11%"};
		{ 29, 43724, "", "=q1=Celestial Ruby Ring", "=ds=#m3#", "", "31%"};
		{ 30, 43151, "", "=q1=Loken's Tongue", "=ds=#m3#"};
		Prev = "HallsofLightningIonar";
		Next = "HallsofLightningTrash";
	};

	AtlasLoot_Data["HallsofLightningTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36997, "", "=q3=Sash of the Hardened Watcher", "=ds=#s10#, #a1#", "", "1%"};
		{ 3, 37000, "", "=q3=Storming Vortex Bracers", "=ds=#s8#, #a2#", "", "1%"};
		{ 4, 36999, "", "=q3=Boots of the Terrestrial Guardian", "=ds=#s12#, #a3#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37858, "", "=q3=Awakened Handguards", "=ds=#s9#, #a2#", "", "1%"};
		{ 18, 37857, "", "=q3=Helm of the Lightning Halls", "=ds=#s1#, #a3#", "", "1%"};
		{ 19, 37856, "", "=q3=Librarian's Paper Cutter", "=ds=#h1#, #w4#", "", "1%"};
		Prev = "HallsofLightningLoken";
	};

		---------------------------------------
		--- Caverns of Time: Old Stratholme ---
		---------------------------------------

	AtlasLoot_Data["CoTStratholmeMeathook"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37083, "", "=q3=Kilt of Sewn Flesh", "=ds=#s11#, #a2#", "", "23%"};
		{ 3, 37082, "", "=q3=Slaughterhouse Sabatons", "=ds=#s12#, #a4#", "", "22%"};
		{ 4, 37079, "", "=q3=Enchanted Wire Stitching", "=ds=#s13#", "", "23%"};
		{ 5, 37081, "", "=q3=Meathook's Slicer", "=ds=#h1#, #w10#", "", "22%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37680, "", "=q3=Belt of Unified Souls", "=ds=#s10#, #a1#", "", "22%"};
		{ 19, 37678, "", "=q3=Bile-Cured Gloves", "=ds=#s9#, #a2#", "", "22%"};
		{ 20, 37679, "", "=q3=Spaulders of the Abomination", "=ds=#s3#, #a3#", "", "21%"};
		{ 21, 37675, "", "=q3=Legplates of Steel Implants", "=ds=#s11#, #a4#", "", "23%"};
		Next = "CoTStratholmeSalramm";
	};

	AtlasLoot_Data["CoTStratholmeSalramm"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37084, "", "=q3=Flowing Cloak of Command", "=ds=#s4#", "", "22%"};
		{ 3, 37095, "", "=q3=Waistband of the Thuzadin", "=ds=#s10#, #a3#", "", "23%"};
		{ 4, 37088, "", "=q3=Spiked Metal Cilice", "=ds=#s10#, #a4#", "", "22%"};
		{ 5, 37086, "", "=q3=Tome of Salramm", "=ds=#s15#", "", "23%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37684, "", "=q3=Forgotten Shadow Hood", "=ds=#s1#, #a1#", "", "22%"};
		{ 19, 37682, "", "=q3=Bindings of Dark Will", "=ds=#s8#, #a4#", "", "22%"};
		{ 20, 37683, "", "=q3=Necromancer's Amulet", "=ds=#s2#", "", "22%"};
		{ 21, 37681, "", "=q3=Gavel of the Fleshcrafter", "=ds=#h3#, #w6#", "", "22%"};
		Prev = "CoTStratholmeMeathook";
		Next = "CoTStratholmeEpoch";
	};

	AtlasLoot_Data["CoTStratholmeEpoch"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37106, "", "=q3=Ouroboros Belt", "=ds=#s10#, #a2#", "", "23%"};
		{ 3, 37105, "", "=q3=Treads of Altered History", "=ds=#s12#, #a3#", "", "24%"};
		{ 4, 37096, "", "=q3=Necklace of the Chrono-Lord", "=ds=#s2#", "", "22%"};
		{ 5, 37099, "", "=q3=Sempiternal Staff", "=ds=#w9#", "", "22%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37687, "", "=q3=Gloves of Distorted Time", "=ds=#s9#, #a1#", "", "23%"};
		{ 19, 37686, "", "=q3=Cracked Epoch Grasps", "=ds=#s9#, #a3#", "", "23%"};
		{ 20, 37688, "", "=q3=Legplates of the Infinite Drakonid", "=ds=#s11#, #a4#", "", "23%"};
		{ 21, 37685, "", "=q3=Mobius Band", "=ds=#s13#", "", "23%"};
		Prev = "CoTStratholmeSalramm";
		Next = "CoTStratholmeInfiniteCorruptorHEROIC";
	};

	AtlasLoot_Data["CoTStratholmeInfiniteCorruptorHEROIC"] = {
		{ 1, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 2, 43951, "", "=q4=Reins of the Bronze Drake", "=ds=#e12#", "", "100%"};
		Prev = "CoTStratholmeEpoch";
		Next = "CoTStratholmeMalGanis";
	};

	AtlasLoot_Data["CoTStratholmeMalGanis"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37113, "", "=q3=Demonic Fabric Bands", "=ds=#s8#, #a1#", "", "16%"};
		{ 3, 37114, "", "=q3=Gloves of Northern Lordaeron", "=ds=#s9#, #a2#", "", "19%"};
		{ 4, 37110, "", "=q3=Gauntlets of Dark Conversion", "=ds=#s9#, #a3#", "", "18%"};
		{ 5, 37109, "", "=q3=Discarded Silver Hand Spaulders", "=ds=#s3#, #a4#", "", "18%"};
		{ 6, 37111, "", "=q3=Soul Preserver", "=ds=#s14#", "", "14%"};
		{ 7, 37108, "", "=q3=Dreadlord's Blade", "=ds=#h2#, #w10#", "", "16%"};
		{ 8, 37112, "", "=q3=Beguiling Scepter", "=ds=#h3#, #w6#", "", "19%"};
		{ 9, 37107, "", "=q3=Leeka's Shield", "=ds=#w8#", "", "18%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37696, "", "=q4=Plague-Infected Bracers", "=ds=#s8#, #a2#", "", "11%"};
		{ 19, 37695, "", "=q4=Legguards of Nature's Power", "=ds=#s11#, #a3#", "", "11%"};
		{ 20, 37694, "", "=q4=Band of Guile", "=ds=#s13#", "", "11%"};
		{ 21, 37693, "", "=q4=Greed", "=ds=#h3#, #w13#", "", "11%"};
		{ 22, 43085, "", "=q4=Royal Crest of Lordaeron", "=ds=#w8#", "", "10%"};
		{ 23, 37691, "", "=q3=Mantle of Deceit", "=ds=#s3#, #a1#", "", "14%"};
		{ 24, 37690, "", "=q3=Pauldrons of Destiny", "=ds=#s3#, #a4#", "", "14%"};
		{ 25, 37689, "", "=q3=Pendant of the Nathrezim", "=ds=#s2#", "", "14%"};
		{ 26, 37692, "", "=q3=Pierce's Pistol", "=ds=#w5#", "", "14%"};
		{ 28, 43697, "", "=q1=Artifact from the Nathrezim Homeworld", "=ds=#m3#"};
		Prev = "CoTStratholmeInfiniteCorruptorHEROIC";
		Next = "CoTStratholmeTrash";
	};

	AtlasLoot_Data["CoTStratholmeTrash"] = {
		{ 1, 37117, "", "=q3=King's Square Bracers", "=ds=#s8#, #a2#", "", "1%"};
		{ 2, 37116, "", "=q3=Epaulets of Market Row", "=ds=#s3#, #a3#", "", "1%"};
		{ 3, 37115, "", "=q3=Crusader's Square Pauldrons", "=ds=#s3#, #a4#", "", "1%"};
		Prev = "CoTStratholmeMalGanis";		
	};

		------------------------
		--- Utgarde Pinnacle ---
		------------------------

	AtlasLoot_Data["UPSorrowgrave"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37043, "", "=q3=Tear-Linked Gauntlets", "=ds=#s9#, #a3#", "", "24%"};
		{ 3, 37040, "", "=q3=Svala's Bloodied Shackles", "=ds=#s8#, #a4#", "", "23%"};
		{ 4, 37037, "", "=q3=Ritualistic Athame", "=ds=#h1#, #w4#", "", "22%"};
		{ 5, 37038, "", "=q3=Brazier Igniter", "=ds=#w12#", "", "21%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37370, "", "=q3=Cuffs of the Trussed Hall", "=ds=#s8#, #a1#", "", "21%"};
		{ 19, 37369, "", "=q3=Sorrowgrave's Breeches", "=ds=#s11#, #a1#", "", "22%"};
		{ 20, 37368, "", "=q3=Silent Spectator Shoulderpads", "=ds=#s3#, #a2#", "", "22%"};
		{ 21, 37367, "", "=q3=Echoing Stompers", "=ds=#s12#, #a4#", "", "22%"};
		Next = "UPPalehoof";
	};

	AtlasLoot_Data["UPPalehoof"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37048, "", "=q3=Shroud of Resurrection", "=ds=#s4#", "", "24%"};
		{ 3, 37052, "", "=q3=Reanimated Armor", "=ds=#s5#, #a4#", "", "21%"};
		{ 4, 37051, "", "=q3=Seal of Valgarde", "=ds=#s15#", "", "21%"};
		{ 5, 37050, "", "=q3=Trophy Gatherer", "=ds=#w2#", "", "24%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37374, "", "=q3=Ravenous Leggings of the Furbolg", "=ds=#s11#, #a2#", "", "22%"};
		{ 19, 37373, "", "=q3=Massive Spaulders of the Jormungar", "=ds=#s3#, #a3#", "", "21%"};
		{ 20, 37376, "", "=q3=Ferocious Pauldrons of the Rhino", "=ds=#s3#, #a4#", "", "21%"};
		{ 21, 37371, "", "=q3=Ring of the Frenzied Wolvar", "=ds=#s13#", "", "22%"};
		Prev = "UPSorrowgrave";
		Next = "UPSkadi";
	};

	AtlasLoot_Data["UPSkadi"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37055, "", "=q3=Silken Amice of the Ymirjar", "=ds=#s3#, #a1#", "", "23%"};
		{ 3, 37057, "", "=q3=Drake Rider's Tunic", "=ds=#s5#, #a2#", "", "23%"};
		{ 4, 37056, "", "=q3=Harpooner's Striders", "=ds=#s12#, #a4#", "", "22%"};
		{ 5, 37053, "", "=q3=Amulet of Deflected Blows", "=ds=#s2#", "", "20%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 44151, "", "=q4=Reins of the Blue Proto-Drake", "=ds=#e12#", "", "1%"};
		{ 19, 37389, "", "=q3=Crenelation Leggings", "=ds=#s11#, #a2#", "", "21%"};
		{ 20, 37379, "", "=q3=Skadi's Iron Belt", "=ds=#s10#, #a4#", "", "22%"};
		{ 21, 37377, "", "=q3=Netherbreath Spellblade", "=ds=#h3#, #w4#", "", "21%"};
		{ 22, 37384, "", "=q3=Staff of Wayward Principles", "=ds=#w9#", "", "21%"};
		Prev = "UPPalehoof";
		Next = "UPYmiron";
	};

	AtlasLoot_Data["UPYmiron"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37067, "", "=q3=Ceremonial Pyre Mantle", "=ds=#s3#, #a2#", "", "19%"};
		{ 3, 37062, "", "=q3=Crown of Forgotten Kings", "=ds=#s1#, #a4#", "", "21%"};
		{ 4, 37066, "", "=q3=Ancient Royal Legguards", "=ds=#s11#, #a4#", "", "23%"};
		{ 5, 37058, "", "=q3=Signet of Ranulf", "=ds=#s13#", "", "22%"};
		{ 6, 37064, "", "=q3=Vestige of Haldor", "=ds=#s14#", "", "24%"};
		{ 7, 37060, "", "=q3=Jeweled Coronation Sword", "=ds=#h3#, #w10#", "", "20%"};
		{ 8, 37065, "", "=q3=Ymiron's Blade", "=ds=#h1#, #w10#", "", "20%"};
		{ 9, 37061, "", "=q3=Tor's Crest", "=ds=#w8#", "", "23%"};
		{ 10, 41797, "", "=q3=Design: Austere Earthsiege Diamond", "=ds=#p12# (420)", "", "10%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37408, "", "=q4=Girdle of Bane", "=ds=#s10#, #a1#", "", "19%"};
		{ 19, 37409, "", "=q4=Gilt-Edged Leather Gauntlets", "=ds=#s9#, #a2#", "", "19%"};
		{ 20, 37407, "", "=q4=Sovereign's Belt", "=ds=#s10#, #a3#", "", "20%"};
		{ 21, 37401, "", "=q4=Red Sword of Courage", "=ds=#h1#, #w10#", "", "18%"};
		{ 23, 37398, "", "=q3=Mantle of Discarded Ways", "=ds=#s3#, #a3#", "", "20%"};
		{ 24, 37395, "", "=q3=Ornamented Plate Regalia", "=ds=#s5#, #a4#", "", "20%"};
		{ 25, 37397, "", "=q3=Gold Amulet of Kings", "=ds=#s2#", "", "20%"};
		{ 26, 37390, "", "=q3=Meteorite Whetstone", "=ds=#s14#", "", "20%"};
		{ 27, 41797, "", "=q3=Design: Austere Earthsiege Diamond", "=ds=#p12# (420)", "", "10%"};
		{ 29, 43669, "", "=q1=Locket of the Deceased Queen", "=ds=#m3#", "", "25%"};
		Prev = "UPSkadi";
		Next = "UPTrash";
	};

	AtlasLoot_Data["UPTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 37070, "", "=q3=Tundra Wolf Boots", "=ds=#s12#, #a2#", "", "2%"};
		{ 3, 37069, "", "=q3=Dragonflayer Seer's Bindings", "=ds=#s8#, #a3#", "", "1%"};
		{ 4, 37068, "", "=q3=Berserker's Sabatons", "=ds=#s12#, #a4#", "", "3%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37587, "", "=q3=Ymirjar Physician's Robe", "=ds=#s5#, #a2#", "", "1%"};
		{ 18, 37590, "", "=q3=Bands of Fading Light", "=ds=#s8#, #a4#", "", "1%"};
		{ 19, 37410, "", "=q3=Tracker's Balanced Knives", "=ds=#w11#", "", "1%"};
		Prev = "UPYmiron";
	};

		------------------
		--- The Oculus ---
		------------------

	AtlasLoot_Data["OcuDrakos"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36945, "", "=q3=Verdisa's Cuffs of Dreaming", "=ds=#s8#, #a1#", "", "21%"};
		{ 3, 36946, "", "=q3=Runic Cage Chestpiece", "=ds=#s5#, #a3#", "", "23%"};
		{ 4, 36943, "", "=q3=Timeless Beads of Eternos", "=ds=#s2#", "", "21%"};
		{ 5, 36944, "", "=q3=Lifeblade of Belgaristrasz", "=ds=#h1#, #w4#", "", "25%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37258, "", "=q3=Drakewing Raiments", "=ds=#s5#, #a1#", "", "22%"};
		{ 19, 37256, "", "=q3=Scaled Armor of Drakos", "=ds=#s5#, #a3#", "", "23%"};
		{ 20, 37257, "", "=q3=Band of Torture", "=ds=#s13#", "", "23%"};
		{ 21, 37255, "", "=q3=The Interrogator", "=ds=#h1#, #w10#", "", "23%"};
		Next = "OcuCloudstrider";
	};

	AtlasLoot_Data["OcuCloudstrider"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36947, "", "=q3=Centrifuge Core Cloak", "=ds=#s4#", "", "21%"};
		{ 3, 36949, "", "=q3=Gloves of the Azure-Lord", "=ds=#s9#, #a1#", "", "21%"};
		{ 4, 36948, "", "=q3=Horned Helm of Varos", "=ds=#s1#, #a2#", "", "22%"};
		{ 5, 36950, "", "=q3=Wing Commander's Breastplate", "=ds=#s5#, #a4#", "", "23%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37261, "", "=q3=Gloves of Radiant Light", "=ds=#s9#, #a2#", "", "22%"};
		{ 19, 37262, "", "=q3=Azure Ringmail Leggings", "=ds=#s11#, #a3#", "", "21%"};
		{ 20, 37263, "", "=q3=Legplates of the Oculus Guardian", "=ds=#s11#, #a4#", "", "21%"};
		{ 21, 37260, "", "=q3=Cloudstrider's Waraxe", "=ds=#h1#, #w1#", "", "21%"};
		Prev = "OcuDrakos";
		Next = "OcuUrom";
	};

	AtlasLoot_Data["OcuUrom"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36954, "", "=q3=The Conjurer's Slippers", "=ds=#s12#, #a1#", "", "21%"};
		{ 3, 36951, "", "=q3=Sidestepping Handguards", "=ds=#s9#, #a2#", "", "20%"};
		{ 4, 36953, "", "=q3=Spaulders of Skillful Maneuvers", "=ds=#s3#, #a3#", "", "21%"};
		{ 5, 36952, "", "=q3=Girdle of Obscuring", "=ds=#s10#, #a4#", "", "18%"};
		{ 7, 21525, "", "=q2=Green Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37289, "", "=q3=Sash of Phantasmal Images", "=ds=#s10#, #a1#", "", "18%"};
		{ 19, 37288, "", "=q3=Catalytic Bands", "=ds=#s8#, #a4#", "", "18%"};
		{ 20, 37195, "", "=q3=Band of Enchanted Growth", "=ds=#s13#", "", "20%"};
		{ 21, 37264, "", "=q3=Pendulum of Telluric Currents", "=ds=#s14#", "", "20%"};
		{ 23, 21525, "", "=q2=Green Winter Hat", "=ds=#s1#, #a1# =q2=#m28#"};
		Prev = "OcuCloudstrider";
		Next = "OcuEregos";
	};

	AtlasLoot_Data["OcuEregos"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36973, "", "=q3=Vestments of the Scholar", "=ds=#s5#, #a1#", "", "18%"};
		{ 3, 36971, "", "=q3=Headguard of Westrift", "=ds=#s1#, #a3#", "", "17%"};
		{ 4, 36969, "", "=q3=Helm of the Ley-Guardian", "=ds=#s1#, #a4#", "", "14%"};
		{ 5, 36974, "", "=q3=Eredormu's Ornamented Chestguard", "=ds=#s5#, #a4#", "", "18%"};
		{ 6, 36961, "", "=q3=Dragonflight Great-Ring", "=ds=#s13#", "", "17%"};
		{ 7, 36972, "", "=q3=Tome of Arcane Phenomena", "=ds=#s14#", "", "15%"};
		{ 8, 36962, "", "=q3=Wyrmclaw Battleaxe", "=ds=#h2#, #w1#", "", "17%"};
		{ 9, 36975, "", "=q3=Malygos's Favor", "=ds=#w9#", "", "17%"};
		{ 10, 41798, "", "=q3=Design: Bracing Earthsiege Diamond", "=ds=#p12# (420)", "", "7%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 18, 37361, "", "=q4=Cuffs of Winged Levitation", "=ds=#s8#, #a1#", "", "14%"};
		{ 19, 37363, "", "=q4=Gauntlets of Dragon Wrath", "=ds=#s9#, #a4#", "", "13%"};
		{ 20, 37362, "", "=q4=Leggings of Protective Auras", "=ds=#s11#, #a4#", "", "13%"};
		{ 21, 37360, "", "=q4=Staff of Draconic Combat", "=ds=#w9#", "", "14%"};
		{ 23, 37291, "", "=q3=Ancient Dragon Spirit Cape", "=ds=#s4#", "", "14%"};
		{ 24, 37294, "", "=q3=Crown of Unbridled Magic", "=ds=#s1#, #a1#", "", "14%"};
		{ 25, 37293, "", "=q3=Mask of the Watcher", "=ds=#s1#, #a2#", "", "15%"};
		{ 26, 37292, "", "=q3=Ley-Guardian's Legguards", "=ds=#s11#, #a4#", "", "15%"};
		{ 28, 43668, "", "=q1=Ley Line Tuner", "=ds=#m3#"};
		Prev = "OcuUrom";
		Next = "OcuTrash";
	};

	AtlasLoot_Data["OcuTrash"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j1#", ""};
		{ 2, 36978, "", "=q3=Ley-Whelphide Belt", "=ds=#s10#, #a2#", "", "0.45%"};
		{ 3, 36977, "", "=q3=Bindings of the Construct", "=ds=#s8#, #a4#", "", "1%"};
		{ 4, 36976, "", "=q3=Ring-Lord's Leggings", "=ds=#s11#, #a1#", "", "1%"};
		{ 16, 0, "INV_Box_01", "=q6=#j3#", ""};
		{ 17, 37366, "", "=q3=Drake-Champion's Bracers", "=ds=#s8#, #a2#", "", "1%"};
		{ 18, 37365, "", "=q3=Bands of the Sky Ring", "=ds=#s8#, #a3#", "", "1%"};
		{ 19, 37290, "", "=q3=Dragon Prow Amulet", "=ds=#s2#", "", "1%"};
		{ 20, 37364, "", "=q3=Frostbridge Orb", "=ds=#s15#", "", "1%"};
		Prev = "OcuEregos";
	};

		-------------------------
		--- Vault of Archavon ---
		-------------------------

	AtlasLoot_Data["VoAArchavon1"] = {
		{ 1, 39492, "", "=q4=Heroes' Frostfire Robe", "=ds=#s5#, #a1#", "", ""};
		{ 2, 39495, "", "=q4=Heroes' Frostfire Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 3, 39493, "", "=q4=Heroes' Frostfire Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 5, 39515, "", "=q4=Heroes' Robe of Faith", "=ds=#s5#, #a1#", "", ""};
		{ 6, 39519, "", "=q4=Heroes' Gloves of Faith", "=ds=#s9#, #a1#", "", ""};
		{ 7, 39517, "", "=q4=Heroes' Leggings of Faith", "=ds=#s11#, #a1#", "", ""};
		{ 9, 39523, "", "=q4=Heroes' Raiments of Faith", "=ds=#s5#, #a1#", "", ""};
		{ 10, 39530, "", "=q4=Heroes' Handwraps of Faith", "=ds=#s9#, #a1#", "", ""};
		{ 11, 39528, "", "=q4=Heroes' Pants of Faith", "=ds=#s11#, #a1#", "", ""};
		{ 13, 39497, "", "=q4=Heroes' Plagueheart Robe", "=ds=#s5#, #a1#", "", ""};
		{ 14, 39500, "", "=q4=Heroes' Plagueheart Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 15, 39498, "", "=q4=Heroes' Plagueheart Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 16, 41950, "", "=q4=Hateful Gladiator's Silk Raiment", "=ds=#s5#, #a1#", "", ""};
		{ 17, 41969, "", "=q4=Hateful Gladiator's Silk Handguards", "=ds=#s9#, #a1#", "", ""};
		{ 18, 41957, "", "=q4=Hateful Gladiator's Silk Trousers", "=ds=#s11#, #a1#", "", ""};
		{ 20, 41857, "", "=q4=Hateful Gladiator's Mooncloth Robe", "=ds=#s5#, #a1#", "", ""};
		{ 21, 41872, "", "=q4=Hateful Gladiator's Mooncloth Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 22, 41862, "", "=q4=Hateful Gladiator's Mooncloth Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 24, 41919, "", "=q4=Hateful Gladiator's Satin Robe", "=ds=#s5#, #a1#", "", ""};
		{ 25, 41938, "", "=q4=Hateful Gladiator's Satin Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 26, 41925, "", "=q4=Hateful Gladiator's Satin Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 28, 42001, "", "=q4=Hateful Gladiator's Felweave Raiment", "=ds=#s5#, #a1#", "", ""};
		{ 29, 42015, "", "=q4=Hateful Gladiator's Felweave Handguards", "=ds=#s9#, #a1#", "", ""};
		{ 30, 42003, "", "=q4=Hateful Gladiator's Felweave Trousers", "=ds=#s11#, #a1#", "", ""};
		Next = "VoAArchavon2";
	};

	AtlasLoot_Data["VoAArchavon2"] = {
		{ 1, 39547, "", "=q4=Heroes' Dreamwalker Vestments", "=ds=#s5#, #a2#", "", ""};
		{ 2, 39544, "", "=q4=Heroes' Dreamwalker Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 3, 39546, "", "=q4=Heroes' Dreamwalker Trousers", "=ds=#s11#, #a2#", "", ""};
		{ 5, 39554, "", "=q4=Heroes' Dreamwalker Raiments", "=ds=#s5#, #a2#", "", ""};
		{ 6, 39557, "", "=q4=Heroes' Dreamwalker Handgrips", "=ds=#s9#, #a2#", "", ""};
		{ 7, 39555, "", "=q4=Heroes' Dreamwalker Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 9, 39538, "", "=q4=Heroes' Dreamwalker Robe", "=ds=#s5#, #a2#", "", ""};
		{ 10, 39543, "", "=q4=Heroes' Dreamwalker Handguards", "=ds=#s9#, #a2#", "", ""};
		{ 11, 39539, "", "=q4=Heroes' Dreamwalker Leggings", "=ds=#s11#, #a2#", "", ""};
		{ 13, 39558, "", "=q4=Heroes' Bonescythe Breastplate", "=ds=#s5#, #a2#", "", ""};
		{ 14, 39560, "", "=q4=Heroes' Bonescythe Gauntlets", "=ds=#s9#, #a2#", "", ""};
		{ 15, 39564, "", "=q4=Heroes' Bonescythe Legplates", "=ds=#s11#, #a2#", "", ""};
		{ 16, 41314, "", "=q4=Hateful Gladiator's Wyrmhide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 17, 41291, "", "=q4=Hateful Gladiator's Wyrmhide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 18, 41302, "", "=q4=Hateful Gladiator's Wyrmhide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 20, 41659, "", "=q4=Hateful Gladiator's Dragonhide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 21, 41771, "", "=q4=Hateful Gladiator's Dragonhide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 22, 41665, "", "=q4=Hateful Gladiator's Dragonhide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 24, 41308, "", "=q4=Hateful Gladiator's Kodohide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 25, 41284, "", "=q4=Hateful Gladiator's Kodohide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 26, 41296, "", "=q4=Hateful Gladiator's Kodohide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 28, 41648, "", "=q4=Hateful Gladiator's Leather Tunic", "=ds=#s5#, #a2#", "", ""};
		{ 29, 41765, "", "=q4=Hateful Gladiator's Leather Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 30, 41653, "", "=q4=Hateful Gladiator's Leather Legguards", "=ds=#s11#, #a2#", "", ""};
		Prev = "VoAArchavon1";
		Next = "VoAArchavon3";
	};

	AtlasLoot_Data["VoAArchavon3"] = {
		{ 1, 39579, "", "=q4=Heroes' Crypstalker Tunic", "=ds=#s5#, #a3#", "", ""};
		{ 2, 39582, "", "=q4=Heroes' Crypstalker Handguards", "=ds=#s9#, #a3#", "", ""};
		{ 3, 39580, "", "=q4=Heroes' Crypstalker Legguards", "=ds=#s11#, #a3#", "", ""};
		{ 5, 39592, "", "=q4=Heroes' Earthshatter Hauberk", "=ds=#s5#, #a3#", "", ""};
		{ 6, 39593, "", "=q4=Heroes' Earthshatter Gloves", "=ds=#s9#, #a3#", "", ""};
		{ 7, 39595, "", "=q4=Heroes' Earthshatter Kilt", "=ds=#s11#, #a3#", "", ""};
		{ 9, 39597, "", "=q4=Heroes' Earthshatter Chestguard", "=ds=#s5#, #a3#", "", ""};
		{ 10, 39601, "", "=q4=Heroes' Earthshatter Grips", "=ds=#s9#, #a3#", "", ""};
		{ 11, 39603, "", "=q4=Heroes' Earthshatter War-Kilt", "=ds=#s11#, #a3#", "", ""};
		{ 13, 39588, "", "=q4=Heroes' Earthshatter Tunic", "=ds=#s5#, #a3#", "", ""};
		{ 14, 39591, "", "=q4=Heroes' Earthshatter Handguards", "=ds=#s9#, #a3#", "", ""};
		{ 15, 39589, "", "=q4=Heroes' Earthshatter Legguards", "=ds=#s11#, #a3#", "", ""};
		{ 16, 41085, "", "=q4=Hateful Gladiator's Chain Armor", "=ds=#s5#, #a3#", "", ""};
		{ 17, 41141, "", "=q4=Hateful Gladiator's Chain Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 18, 41203, "", "=q4=Hateful Gladiator's Chain Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 20, 40989, "", "=q4=Hateful Gladiator's Mail Armor", "=ds=#s5#, #a3#", "", ""};
		{ 21, 41005, "", "=q4=Hateful Gladiator's Mail Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 22, 41031, "", "=q4=Hateful Gladiator's Mail Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 24, 41079, "", "=q4=Hateful Gladiator's Linked Armor", "=ds=#s5#, #a3#", "", ""};
		{ 25, 41135, "", "=q4=Hateful Gladiator's Linked Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 26, 41162, "", "=q4=Hateful Gladiator's Linked Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 28, 40988, "", "=q4=Hateful Gladiator's Ringmail Armor", "=ds=#s5#, #a3#", "", ""};
		{ 29, 40999, "", "=q4=Hateful Gladiator's Ringmail Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 30, 41025, "", "=q4=Hateful Gladiator's Ringmail Leggings", "=ds=#s11#, #a3#", "", ""};
		Prev = "VoAArchavon2";
		Next = "VoAArchavon4";
	};

	AtlasLoot_Data["VoAArchavon4"] = {
		{ 1, 39617, "", "=q4=Heroes' Scourgeborne Battleplate", "=ds=#s5#, #a4#", "", ""};
		{ 2, 39618, "", "=q4=Heroes' Scourgeborne Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 3, 39620, "", "=q4=Heroes' Scourgeborne Legplates", "=ds=#s11#, #a4#", "", ""};
 		{ 5, 39623, "", "=q4=Heroes' Scourgeborne Chestguard", "=ds=#s5#, #a4#", "", ""};
		{ 6, 39624, "", "=q4=Heroes' Scourgeborne Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 7, 39626, "", "=q4=Heroes' Scourgeborne Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 9, 39629, "", "=q4=Heroes' Redemption Tunic", "=ds=#s5#, #a4#", "", ""};
		{ 10, 39632, "", "=q4=Heroes' Redemption Gloves", "=ds=#s9#, #a4#", "", ""};
		{ 11, 39630, "", "=q4=Heroes' Redemption Greaves", "=ds=#s11#, #a4#", "", ""};
		{ 13, 39633, "", "=q4=Heroes' Redemption Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 14, 39634, "", "=q4=Heroes' Redemption Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 15, 39636, "", "=q4=Heroes' Redemption Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 16, 40781, "", "=q4=Hateful Gladiator's Dreadplate Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 17, 40803, "", "=q4=Hateful Gladiator's Dreadplate Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 18, 40841, "", "=q4=Hateful Gladiator's Dreadplate Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 24, 40925, "", "=q4=Hateful Gladiator's Ornamented Chestguard", "=ds=#s5#, #a4#", "", ""};
		{ 25, 40904, "", "=q4=Hateful Gladiator's Ornamented Gloves", "=ds=#s9#, #a4#", "", ""};
		{ 26, 40937, "", "=q4=Hateful Gladiator's Ornamented Legplates", "=ds=#s11#, #a4#", "", ""}; 
		{ 28, 40782, "", "=q4=Hateful Gladiator's Scaled Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 29, 40802, "", "=q4=Hateful Gladiator's Scaled Gauntlets", "=ds=#s11#, #a4#", "", ""};
		{ 30, 40842, "", "=q4=Hateful Gladiator's Scaled Legguards", "=ds=#s11#, #a4#", "", ""};
		Prev = "VoAArchavon3";
		Next = "VoAArchavon5";
	};

	AtlasLoot_Data["VoAArchavon5"] = {
		{ 1, 39638, "", "=q4=Heroes' Redemption Breastplate", "=ds=#s5#, #a4#", "", ""};
		{ 2, 39639, "", "=q4=Heroes' Redemption Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 3, 39641, "", "=q4=Heroes' Redemption Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 5, 39606, "", "=q4=Heroes' Dreadnaught Battleplate", "=ds=#s5#, #a4#", "", ""};
		{ 6, 39609, "", "=q4=Heroes' Dreadnaught Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 7, 39607, "", "=q4=Heroes' Dreadnaught Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 9, 39611, "", "=q4=Heroes' Dreadnaught Breastplate", "=ds=#s5#, #a4#", "", ""};
		{ 10, 39622, "", "=q4=Heroes' Dreadnaught Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 11, 39612, "", "=q4=Heroes' Dreadnaught Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 16, 40752, "", "=q4=Emblem of Heroism", "=ds=#e15#", "", "100%"};
		{ 17, 43959, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m7#", "", ""};
		{ 18, 44083, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m6#", "", ""};
		{ 20, 40783, "", "=q4=Hateful Gladiator's Plate Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 21, 40801, "", "=q4=Hateful Gladiator's Plate Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 22, 40840, "", "=q4=Hateful Gladiator's Plate Legguards", "=ds=#s11#, #a4#", "", ""};
		Prev = "VoAArchavon4";
	};

	AtlasLoot_Data["VoAArchavon125Man"] = {
		{ 1, 40418, "", "=q4=Valorous Frostfire Robe", "=ds=#s5#, #a1#", "", ""};
		{ 2, 40415, "", "=q4=Valorous Frostfire Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 3, 40417, "", "=q4=Valorous Frostfire Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 5, 40449, "", "=q4=Valorous Robe of Faith", "=ds=#s5#, #a1#", "", ""};
		{ 6, 40445, "", "=q4=Valorous Gloves of Faith", "=ds=#s9#, #a1#", "", ""};
		{ 7, 40448, "", "=q4=Valorous Leggings of Faith", "=ds=#s11#, #a1#", "", ""};
		{ 9, 40458, "", "=q4=Valorous Raiments of Faith", "=ds=#s5#, #a1#", "", ""};
		{ 10, 40454, "", "=q4=Valorous Handwraps of Faith", "=ds=#s9#, #a1#", "", ""};
		{ 11, 40457, "", "=q4=Valorous Pants of Faith", "=ds=#s11#, #a1#", "", ""};
		{ 13, 40423, "", "=q4=Valorous Plagueheart Robe", "=ds=#s5#, #a1#", "", ""};
		{ 14, 40420, "", "=q4=Valorous Plagueheart Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 15, 40422, "", "=q4=Valorous Plagueheart Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 16, 41951, "", "=q4=Deadly Gladiator's Silk Raiment", "=ds=#s5#, #a1#", "", ""};
		{ 17, 41970, "", "=q4=Deadly Gladiator's Silk Handguards", "=ds=#s9#, #a1#", "", ""};
		{ 18, 41958, "", "=q4=Deadly Gladiator's Silk Trousers", "=ds=#s11#, #a1#", "", ""};
		{ 20, 41858, "", "=q4=Deadly Gladiator's Mooncloth Robe", "=ds=#s5#, #a1#", "", ""};
		{ 21, 41873, "", "=q4=Deadly Gladiator's Mooncloth Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 22, 41863, "", "=q4=Deadly Gladiator's Mooncloth Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 24, 41920, "", "=q4=Deadly Gladiator's Satin Robe", "=ds=#s5#, #a1#", "", ""};
		{ 25, 41939, "", "=q4=Deadly Gladiator's Satin Gloves", "=ds=#s9#, #a1#", "", ""};
		{ 26, 41926, "", "=q4=Deadly Gladiator's Satin Leggings", "=ds=#s11#, #a1#", "", ""};
		{ 28, 41997, "", "=q4=Deadly Gladiator's Felweave Raiment", "=ds=#s5#, #a1#", "", ""};
		{ 29, 42016, "", "=q4=Deadly Gladiator's Felweave Handguards", "=ds=#s9#, #a1#", "", ""};
		{ 30, 42004, "", "=q4=Deadly Gladiator's Felweave Trousers", "=ds=#s11#, #a1#", "", ""};
		Next = "VoAArchavon225Man";
	};

	AtlasLoot_Data["VoAArchavon225Man"] = {
		{ 1, 40469, "", "=q4=Valorous Dreamwalker Vestments", "=ds=#s5#, #a2#", "", ""};
		{ 2, 40466, "", "=q4=Valorous Dreamwalker Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 3, 40468, "", "=q4=Valorous Dreamwalker Trousers", "=ds=#s11#, #a2#", "", ""};
		{ 5, 40471, "", "=q4=Valorous Dreamwalker Raiments", "=ds=#s5#, #a2#", "", ""};
		{ 6, 40472, "", "=q4=Valorous Dreamwalker Handgrips", "=ds=#s9#, #a2#", "", ""};
		{ 7, 40493, "", "=q4=Valorous Dreamwalker Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 9, 40463, "", "=q4=Valorous Dreamwalker Robe", "=ds=#s5#, #a2#", "", ""};
		{ 10, 40460, "", "=q4=Valorous Dreamwalker Handguards", "=ds=#s9#, #a2#", "", ""};
		{ 11, 40462, "", "=q4=Valorous Dreamwalker Leggings", "=ds=#s11#, #a2#", "", ""};
		{ 13, 40495, "", "=q4=Valorous Bonescythe Breastplate", "=ds=#s5#, #a2#", "", ""};
		{ 14, 40496, "", "=q4=Valorous Bonescythe Gauntlets", "=ds=#s9#, #a2#", "", ""};
		{ 15, 40500, "", "=q4=Valorous Bonescythe Legplates", "=ds=#s11#, #a2#", "", ""};
		{ 16, 41315, "", "=q4=Deadly Gladiator's Wyrmhide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 17, 41292, "", "=q4=Deadly Gladiator's Wyrmhide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 18, 41303, "", "=q4=Deadly Gladiator's Wyrmhide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 20, 41660, "", "=q4=Deadly Gladiator's Dragonhide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 21, 41772, "", "=q4=Deadly Gladiator's Dragonhide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 22, 41666, "", "=q4=Deadly Gladiator's Dragonhide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 24, 41309, "", "=q4=Deadly Gladiator's Kodohide Robes", "=ds=#s5#, #a2#", "", ""};
		{ 25, 41286, "", "=q4=Deadly Gladiator's Kodohide Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 26, 41297, "", "=q4=Deadly Gladiator's Kodohide Legguards", "=ds=#s11#, #a2#", "", ""};
		{ 28, 41649, "", "=q4=Deadly Gladiator's Leather Tunic", "=ds=#s5#, #a2#", "", ""};
		{ 29, 41766, "", "=q4=Deadly Gladiator's Leather Gloves", "=ds=#s9#, #a2#", "", ""};
		{ 30, 41654, "", "=q4=Deadly Gladiator's Leather Legguards", "=ds=#s11#, #a2#", "", ""};
		Prev = "VoAArchavon125Man";
		Next = "VoAArchavon325Man";
	};

	AtlasLoot_Data["VoAArchavon325Man"] = {
		{ 1, 40503, "", "=q4=Valorous Crypstalker Tunic", "=ds=#s5#, #a3#", "", ""};
		{ 2, 40504, "", "=q4=Valorous Crypstalker Handguards", "=ds=#s9#, #a3#", "", ""};
		{ 3, 40506, "", "=q4=Valorous Crypstalker Legguards", "=ds=#s11#, #a3#", "", ""};
		{ 5, 40514, "", "=q4=Valorous Earthshatter Hauberk", "=ds=#s5#, #a3#", "", ""};
		{ 6, 40515, "", "=q4=Valorous Earthshatter Gloves", "=ds=#s9#, #a3#", "", ""};
		{ 7, 40517, "", "=q4=Valorous Earthshatter Kilt", "=ds=#s11#, #a3#", "", ""};
		{ 9, 40523, "", "=q4=Valorous Earthshatter Chestguard", "=ds=#s5#, #a3#", "", ""};
		{ 10, 40520, "", "=q4=Valorous Earthshatter Grips", "=ds=#s9#, #a3#", "", ""};
		{ 11, 40522, "", "=q4=Valorous Earthshatter War-Kilt", "=ds=#s11#, #a3#", "", ""};
		{ 13, 40508, "", "=q4=Valorous Earthshatter Tunic", "=ds=#s5#, #a3#", "", ""};
		{ 14, 40509, "", "=q4=Valorous Earthshatter Handguards", "=ds=#s9#, #a3#", "", ""};
		{ 15, 40512, "", "=q4=Valorous Earthshatter Legguards", "=ds=#s11#, #a3#", "", ""};
		{ 16, 41086, "", "=q4=Deadly Gladiator's Chain Armor", "=ds=#s5#, #a3#", "", ""};
		{ 17, 41142, "", "=q4=Deadly Gladiator's Chain Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 18, 41204, "", "=q4=Deadly Gladiator's Chain Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 20, 40991, "", "=q4=Deadly Gladiator's Mail Armor", "=ds=#s5#, #a3#", "", ""};
		{ 21, 41006, "", "=q4=Deadly Gladiator's Mail Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 22, 41032, "", "=q4=Deadly Gladiator's Mail Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 24, 41080, "", "=q4=Deadly Gladiator's Linked Armor", "=ds=#s5#, #a3#", "", ""};
		{ 25, 41136, "", "=q4=Deadly Gladiator's Linked Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 26, 41198, "", "=q4=Deadly Gladiator's Linked Leggings", "=ds=#s11#, #a3#", "", ""};
		{ 28, 40990, "", "=q4=Deadly Gladiator's Ringmail Armor", "=ds=#s5#, #a3#", "", ""};
		{ 29, 41000, "", "=q4=Deadly Gladiator's Ringmail Gauntlets", "=ds=#s9#, #a3#", "", ""};
		{ 30, 41026, "", "=q4=Deadly Gladiator's Ringmail Leggings", "=ds=#s11#, #a3#", "", ""};
		Prev = "VoAArchavon2";
		Next = "VoAArchavon4";
	};

	AtlasLoot_Data["VoAArchavon425Man"] = {
		{ 1, 40550, "", "=q4=Valorous Scourgeborne Battleplate", "=ds=#s5#, #a4#", "", ""};
		{ 2, 40552, "", "=q4=Valorous Scourgeborne Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 3, 40556, "", "=q4=Valorous Scourgeborne Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 5, 40559, "", "=q4=Valorous Scourgeborne Chestguard", "=ds=#s5#, #a4#", "", ""};
		{ 6, 40563, "", "=q4=Valorous Scourgeborne Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 7, 40567, "", "=q4=Valorous Scourgeborne Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 9, 40569, "", "=q4=Valorous Redemption Tunic", "=ds=#s5#, #a4#", "", ""};
		{ 10, 40570, "", "=q4=Valorous Redemption Gloves", "=ds=#s9#, #a4#", "", ""};
		{ 11, 40572, "", "=q4=Valorous Redemption Greaves", "=ds=#s11#, #a4#", "", ""};
		{ 13, 40574, "", "=q4=Valorous Redemption Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 14, 40575, "", "=q4=Valorous Redemption Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 15, 40577, "", "=q4=Valorous Redemption Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 16, 40784, "", "=q4=Deadly Gladiator's Dreadplate Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 17, 40806, "", "=q4=Deadly Gladiator's Dreadplate Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 18, 40845, "", "=q4=Deadly Gladiator's Dreadplate Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 24, 40785, "", "=q4=Deadly Gladiator's Scaled Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 25, 40805, "", "=q4=Deadly Gladiator's Scaled Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 26, 40846, "", "=q4=Deadly Gladiator's Scaled Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 28, 40905, "", "=q4=Deadly Gladiator's Ornamented Chestguard", "=ds=#s5#, #a4#", "", ""};
		{ 29, 40926, "", "=q4=Deadly Gladiator's Ornamented Gloves", "=ds=#s9#, #a4#", "", ""};
		{ 30, 40938, "", "=q4=Deadly Gladiator's Ornamented Legplates", "=ds=#s11#, #a4#", "", ""};
		Prev = "VoAArchavon325Man";
		Next = "VoAArchavon525Man";
	};

	AtlasLoot_Data["VoAArchavon525Man"] = {
		{ 1, 40579, "", "=q4=Valorous Redemption Breastplate", "=ds=#s5#, #a4#", "", ""};
		{ 2, 40580, "", "=q4=Valorous Redemption Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 3, 40583, "", "=q4=Valorous Redemption Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 5, 40525, "", "=q4=Valorous Dreadnaught Battleplate", "=ds=#s5#, #a4#", "", ""};
		{ 6, 40527, "", "=q4=Valorous Dreadnaught Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 7, 40529, "", "=q4=Valorous Dreadnaught Legplates", "=ds=#s11#, #a4#", "", ""};
		{ 9, 40544, "", "=q4=Valorous Dreadnaught Breastplate", "=ds=#s5#, #a4#", "", ""};
		{ 10, 40545, "", "=q4=Valorous Dreadnaught Handguards", "=ds=#s9#, #a4#", "", ""};
		{ 11, 40547, "", "=q4=Valorous Dreadnaught Legguards", "=ds=#s11#, #a4#", "", ""};
		{ 16, 40753, "", "=q4=Emblem of Valor", "=ds=#e15#", "", "100%"};
		{ 17, 43959, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m7#", "", ""};
		{ 18, 44083, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m6#", "", ""};
		{ 20, 40786, "", "=q4=Deadly Gladiator's Plate Chestpiece", "=ds=#s5#, #a4#", "", ""};
		{ 21, 40804, "", "=q4=Deadly Gladiator's Plate Gauntlets", "=ds=#s9#, #a4#", "", ""};
		{ 22, 40844, "", "=q4=Deadly Gladiator's Plate Legguards", "=ds=#s11#, #a4#", "", ""};
		Prev = "VoAArchavon425Man";
	};

		-----------------
		--- Naxxramas ---
		-----------------

		-------------------------
		--- Construct Quarter ---
		-------------------------

	AtlasLoot_Data["Naxx80Patchwerk"] = {
		{ 1, 39272, "", "=q4=Drape of Surgery", "=ds=#s4#", "", "10%"};
		{ 2, 39273, "", "=q4=Sullen Cloth Boots", "=ds=#s12#, #a1#", "", "10%"};
		{ 3, 39275, "", "=q4=Contagion Gloves", "=ds=#s9#, #a2#", "", "10%"};
		{ 4, 39274, "", "=q4=Retcher's Shoulderpads", "=ds=#s3#, #a3#", "", "10%"};
		{ 5, 39267, "", "=q4=Abomination Shoulderblades", "=ds=#s3#, #a4#", "", "13%"};
		{ 6, 39262, "", "=q4=Gauntlets of Combined Strength", "=ds=#s9#, #a4#", "", "24%"};
		{ 7, 39261, "", "=q4=Tainted Girdle of Mending", "=ds=#s10#, #a4#", "", "13%"};
		{ 8, 39271, "", "=q4=Blade of Dormant Memories", "=ds=#h3#, #w4#", "", "10%"};
		{ 9, 39270, "", "=q4=Hatestrike", "=ds=#h1#, #w10#", "", "13%"};
		Next = "Naxx80Grobbulus";
	};

	AtlasLoot_Data["Naxx80Patchwerk25Man"] = {
		{ 1, 40271, "", "=q4=Sash of Solitude", "=ds=#s10#, #a1#", "", "19%"};
		{ 2, 40269, "", "=q4=Boots of Persuasion", "=ds=#s12#, #a1#", "", "9%"};
		{ 3, 40260, "", "=q4=Belt of the Tortured", "=ds=#s10#, #a2#", "", "9%"};
		{ 4, 40270, "", "=q4=Boots of Septic Wounds", "=ds=#s12#, #a2#", "", "9%"};
		{ 5, 40262, "", "=q4=Gloves of Calculated Risk", "=ds=#s9#, #a3#", "", "9%"};
		{ 6, 40272, "", "=q4=Girdle of the Gambit", "=ds=#s10#, #a3#", "", "9%"};
		{ 7, 40261, "", "=q4=Crude Discolored Battlegrips", "=ds=#s9#, #a4#", "", "9%"};
		{ 8, 40263, "", "=q4=Fleshless Girdle", "=ds=#s10#. #a4#", "", "19%"};
		{ 9, 40259, "", "=q4=Waistguard of Divine Grace", "=ds=#s10#, #a4#", "", "9%"};
		{ 10, 40071, "", "=q4=Chains of Adoration", "=ds=#s2#", "", "11%"};
		{ 11, 40065, "", "=q4=Fool's Trial", "=ds=#s2#", "", "11%"};
		{ 12, 40069, "", "=q4=Heritage", "=ds=#s2#", "", "11%"};
		{ 13, 40064, "", "=q4=Thunderstorm Amulet", "=ds=#s2#", "", "11%"};
		{ 14, 40080, "", "=q4=Lost Jewel", "=ds=#s13#", "", "11%"};
		{ 15, 40075, "", "=q4=Ruthlessness", "=ds=#s13#", "", "11%"};
		{ 16, 40107, "", "=q4=Sand-Worn Band", "=ds=#s13#", "", "11%"};
		{ 17, 40074, "", "=q4=Strong-Handed Ring", "=ds=#s13#", "", "12%"};
		{ 18, 40273, "", "=q4=Surplus Limb", "=ds=#s15#", "", "9%"};
		{ 19, 40267, "", "=q4=Totem of Hex", "=ds=#s16#, #w15#", "", "9%"};
		{ 20, 40268, "", "=q4=Libram of Tolerance", "=ds=#s16#, #w16#", "", "19%"};
		{ 21, 40264, "", "=q4=Split Greathammer", "=ds=#h1#, #w6#", "", "9%"};
		{ 22, 40266, "", "=q4=Hero's Surrender", "=ds=#w8#", "", "9%"};
		{ 23, 40265, "", "=q4=Arrowsong", "=ds=#w2#", "", "19%"};
		Next = "Naxx80Grobbulus25Man";
	};

	AtlasLoot_Data["Naxx80Grobbulus"] = {
		{ 1, 39284, "", "=q4=Miasma Mantle", "=ds=#s3#, #a1#", "", "18%"};
		{ 2, 39285, "", "=q4=Handgrips of Turmoil", "=ds=#s9#, #a1#", "", "10%"};
		{ 3, 39283, "", "=q4=Putrescent Bands", "=ds=#s8#, #a2#", "", "10%"};
		{ 4, 39279, "", "=q4=Blistered Belt of Decay", "=ds=#s10#, #a2#", "", "9%"};
		{ 5, 39278, "", "=q4=Bands of Anxiety", "=ds=#s8#, #a3#", "", "9%"};
		{ 6, 39280, "", "=q4=Leggings of Innumerable Barbs", "=ds=#s11#, #a4#", "", "10%"};
		{ 7, 39282, "", "=q4=Bone-Linked Amulet", "=ds=#s2#", "", "10%"};
		{ 8, 39277, "", "=q4=Sealing Ring of Grobbulus", "=ds=#s13#", "", "9%"};
		{ 9, 39281, "", "=q4=Infection Repulser", "=ds=#h3#, #w6#", "", "19%"};
		{ 10, 39276, "", "=q4=The Skull of Ruin", "=ds=#w8#", "", "9%"};
		Prev = "Naxx80Patchwerk";
		Next = "Naxx80Gluth1";
	};

	AtlasLoot_Data["Naxx80Grobbulus25Man"] = {
		{ 1, 40250, "", "=q4=Aged Winter Cloak", "=ds=#s4#", "", "11%"};
		{ 2, 40254, "", "=q4=Cloak of Averted Crisis", "=ds=#s4#", "", "11%"};
		{ 3, 40252, "", "=q4=Cloak of the Shadowed Sun", "=ds=#s4#", "", "11%"};
		{ 4, 40253, "", "=q4=Shawl of the Old Maid", "=ds=#s4#", "", "11%"};
		{ 5, 40251, "", "=q4=Shroud of Luminosity", "=ds=#s4#", "", "11%"};
		{ 6, 40287, "", "=q4=Cowl of Vanity", "=ds=#s1#, #a1#", "", "19%"};
		{ 7, 40286, "", "=q4=Mantle of the Corrupted", "=ds=#s3#, #a1#", "", "1%"};
		{ 8, 40351, "", "=q4=Mantle of the Fatigued Sage", "=ds=#s3#, #a1#", "", "19%"};
		{ 9, 40289, "", "=q4=Sympathetic Amice", "=ds=#s3#, #a1#", "", "9%"};
		{ 10, 40277, "", "=q4=Tunic of Indulgence", "=ds=#s5#, #a2#", "", "18%"};
		{ 11, 40285, "", "=q4=Desecrated Past", "=ds=#s11#, #a2#", "", "9%"};
		{ 12, 40288, "", "=q4=Spaulders of Incoherence", "=ds=#s3#, #a3#", "", "19%"};
		{ 13, 40283, "", "=q4=Fallout Impervious Tunic", "=ds=#s5#, #a3#", "", "9%"};
		{ 14, 40282, "", "=q4=Slime Stream Bands", "=ds=#s8#, #a3#", "", "9%"};
		{ 15, 40275, "", "=q4=Depraved Linked Belt", "=ds=#s10#, #a3#", "", "9%"};
		{ 16, 40279, "", "=q4=Chestguard of the Exhausted", "=ds=#s5#, #a4#", "", "9%"};
		{ 17, 40274, "", "=q4=Bracers of Liberation", "=ds=#s8#, #a4#", "", "18%"};
		{ 18, 40278, "", "=q4=Girdle of Chivalry", "=ds=#s10#, #a4#", "", "9%"};
		{ 19, 40257, "", "=q4=Defender's Code", "=ds=#s14#", "", "11%"};
		{ 20, 40255, "", "=q4=Dying Curse", "=ds=#s14#", "", "11%"};
		{ 21, 40258, "", "=q4=Forethought Talisman", "=ds=#s14#", "", "11%"};
		{ 22, 40256, "", "=q4=Grim Toll", "=ds=#s14#", "", "11%"};
		{ 23, 40281, "", "=q4=Twilight Mist", "=ds=#h1#, #w4#", "", "19%"};
		{ 24, 40280, "", "=q4=Origin of Nightmares", "=ds=#w9#", "", "9%"};
		{ 25, 40284, "", "=q4=Plague Igniter", "=ds=#w12#", "", "9%"};
		Prev = "Naxx80Patchwerk25Man";
		Next = "Naxx80Gluth125Man";
	};

	AtlasLoot_Data["Naxx80Gluth1"] = {
		{ 1, 39272, "", "=q4=Drape of Surgery", "=ds=#s4#", "", "10%"};
		{ 2, 39284, "", "=q4=Miasma Mantle", "=ds=#s3#, #a1#", "", "18%"};
		{ 3, 39396, "", "=q4=Gown of Blaumeux", "=ds=#s5#, #a1#", "", "0.43%"};
		{ 4, 39309, "", "=q4=Leggings of the Instructor", "=ds=#s11#, #a1#", "", "10%"};
		{ 5, 39237, "", "=q4=Spaulders of Resumed Battle", "=ds=#s3#, #a2#", "", "10%"};
		{ 6, 39279, "", "=q4=Blistered Belt of Decay", "=ds=#s10#, #a2#", "", "9%"};
		{ 7, 39191, "", "=q4=Splint-Bound Leggings", "=ds=#s11#, #a2#", "", "11%"};
		{ 8, 39215, "", "=q4=Boots of the Follower", "=ds=#s12#, #a2#", "", "11%"};
		{ 9, 39294, "", "=q4=Arc-Scorched Helmet", "=ds=#s1#, #a3#", "", "9%"};
		{ 10, 39248, "", "=q4=Tunic of the Lost Pack", "=ds=#s5#, #a3#", "", "10%"};
		{ 11, 39194, "", "=q4=Rusted-Link Spiked Gauntlets", "=ds=#s9#, #a3#", "", "10%"};
		{ 12, 39251, "", "=q4=Necrogenic Belt", "=ds=#s10#, #a3#", "", "10%"};
		{ 13, 39379, "", "=q4=Spectral Rider's Girdle", "=ds=#s10#, #a3#", "", "10%"};
		{ 14, 39188, "", "=q4=Chivalric Chestguard", "=ds=#s5#, #a4#", "", "10%"};
		{ 15, 39345, "", "=q4=Girdle of the Ascended Phantom", "=ds=#s10#, #a4#", "", "20%"};
		{ 16, 39146, "", "=q4=Collar of Dissolution", "=ds=#s2#", "", "10%"};
		{ 17, 39232, "", "=q4=Pendant of Lost Vocations", "=ds=#s2#", "", "10%"};
		{ 18, 39193, "", "=q4=Band of Neglected Pleas", "=ds=#s13#", "", "11%"};
		{ 19, 39388, "", "=q4=Spirit-World Glass", "=ds=#s14#", "", "10%"};
		{ 20, 39200, "", "=q4=Grieving Spellblade", "=ds=#h3#, #w10#", "", "11%"};
		{ 21, 39344, "", "=q4=Slayer of the Lifeless", "=ds=#h1#, #w10#", "", "10%"};
		{ 22, 39281, "", "=q4=Infection Repulser", "=ds=#h3#, #w6#", "", "19%"};
		{ 23, 39394, "", "=q4=Charmed Cierge", "=ds=#w9#", "", "0.44%"};
		Prev = "Naxx80Grobbulus";
		Next = "Naxx80Gluth2";
	};

	AtlasLoot_Data["Naxx80Gluth2"] = {
		{ 1, 40622, "", "=q4=Spaulders of the Lost Conqueror", "=ds=#e15#", "", "29%"};
		{ 2, 40623, "", "=q4=Spaulders of the Lost Protector", "=ds=#e15#", "", "30%"};
		{ 3, 40624, "", "=q4=Spaulders of the Lost Vanquisher", "=ds=#e15#", "", "38%"};
		{ 4, 40610, "", "=q4=Chestguard of the Lost Conqueror", "=ds=#e15#", "", "9%"};
		{ 5, 40611, "", "=q4=Chestguard of the Lost Protector", "=ds=#e15#", "", "9%"};
		{ 6, 40612, "", "=q4=Chestguard of the Lost Vanquisher", "=ds=#e15#", "", "12%"};
		{ 7, 40619, "", "=q4=Leggings of the Lost Conqueror", "=ds=#e15#", "", "27%"};
		{ 8, 40620, "", "=q4=Leggings of the Lost Protector", "=ds=#e15#", "", "28%"};
		{ 9, 40621, "", "=q4=Leggings of the Lost Vanquisher", "=ds=#e15#", "", "36%"};
		Prev = "Naxx80Gluth1";
		Next = "Naxx80Thaddius";
	};

	AtlasLoot_Data["Naxx80Gluth125Man"] = {
		{ 1, 40247, "", "=q4=Cowl of Innocent Delight", "=ds=#s1#, #a1#", "", "9%"};
		{ 2, 40289, "", "=q4=Sympathetic Amice", "=ds=#s3#, #a1#", "", "9%"};
		{ 3, 40602, "", "=q4=Robes of Mutation", "=ds=#s5#, #a1#", "", "19%"};
		{ 4, 39733, "", "=q4=Gloves of Token Respect", "=ds=#s9#, #a1#", "", "19%"};
		{ 5, 40303, "", "=q4=Wraps of the Persecuted", "=ds=#s9#, #a1#", "", "9%"};
		{ 6, 40326, "", "=q4=Boots of Forlorn Wishes", "=ds=#s12#, #a1#", "", "20%"};
		{ 7, 40296, "", "=q4=Cover of Silence", "=ds=#s1#, #a2#", "", "8%"};
		{ 8, 39768, "", "=q4=Cowl of the Perished", "=ds=#s1#, #a2#", "", "9%"};
		{ 9, 40319, "", "=q4=Chestpiece of Suspicion", "=ds=#s5#, #a2#", "", "9%"};
		{ 10, 40260, "", "=q4=Belt of the Tortured", "=ds=#s10#, #a2#", "", "9%"};
		{ 11, 40205, "", "=q4=Stalk-Skin Belt", "=ds=#s10#, #a2#", "", "9%"};
		{ 12, 40270, "", "=q4=Boots of Septic Wounds", "=ds=#s12#, #a2#", "", "9%"};
		{ 13, 40193, "", "=q4=Tunic of Masked Suffering", "=ds=#s5#, #a3#", "", "20%"};
		{ 14, 40209, "", "=q4=Bindings of the Decrepit", "=ds=#s8#, #a3#", "", "9%"};
		{ 15, 40302, "", "=q4=Benefactor's Gauntlets", "=ds=#s9#, #a3#", "", "8%"};
		{ 16, 39718, "", "=q4=Corpse Scarab Handguards", "=ds=#s9#, #a3#", "", "9%"};
		{ 17, 40242, "", "=q4=Grotesque Handgrips", "=ds=#s9#, #a3#", "", "19%"};
		{ 18, 39760, "", "=q4=Helm of Diminished Pride", "=ds=#s1#, #a4#", "", "18%"};
		{ 19, 40185, "", "=q4=Shoulderguards of Opportunity", "=ds=#s3#, #a4#", "", "9%"};
		{ 20, 40203, "", "=q4=Breastplate of Tormented Rage", "=ds=#s5#, #a4#", "", "18%"};
		{ 21, 40332, "", "=q4=Abetment Bracers", "=ds=#s8#, #a4#", "", "19%"};
		{ 22, 40188, "", "=q4=Gauntlets of the Disobediant", "=ds=#s9#, #a4#", "", "9%"};
		{ 23, 40259, "", "=q4=Waistguard of Divine Grace", "=ds=#s10#, #a4#", "", "9%"};
		{ 24, 40204, "", "=q4=Legguards of the Apostle", "=ds=#s11#, #a4#", "", "9%"};
		{ 25, 39717, "", "=q4=Inexorable Sabatons", "=ds=#s12#, #a4#", "", "23%"};
		{ 26, 40206, "", "=q4=Iron-Spring Jumpers", "=ds=#s12#, #a4#", "", "9%"};
		{ 27, 40297, "", "=q4=Sabatons of Endurance", "=ds=#s12#, #a4#", "", "17%"};
		{ 28, 40350, "", "=q4=Urn of Lost Memories", "=ds=#s15#", "", "1%"};
		{ 29, 40191, "", "=q4=Libram of Radiance", "=ds=#s16#, #w16#", "", "9%"};
		Prev = "Naxx80Grobbulus25Man";
		Next = "Naxx80Gluth225Man";
	};

	AtlasLoot_Data["Naxx80Gluth225Man"] = {
		{ 1, 40281, "", "=q4=Twilight Mist", "=ds=#h1#, #w4#", "", "19%"};
		{ 2, 39714, "", "=q4=Webbed Death", "=ds=#h1#, #w4#", "", "24%"};
		{ 3, 39730, "", "=q4=Widow's Fury", "=ds=#h1#, #w10#", "", "9%"};
		{ 4, 40343, "", "=q4=Armageddon", "=ds=#h2#, #w10#", "", "1%"};
		{ 5, 40239, "", "=q4=The Hand of Nerub", "=ds=#h4#, #w13#", "", "19%"};
		{ 6, 40280, "", "=q4=Origin of Nightmares", "=ds=#w9#", "", "9%"};
		{ 7, 39716, "", "=q4=Shield of Assimilation", "=ds=#w8#", "", "24%"};
		{ 8, 40265, "", "=q4=Arrowsong", "=ds=#w2#", "", "19%"};
		{ 9, 40346, "", "=q4=Final Voyage", "=ds=#w3#", "", "1%"};
		{ 16, 40637, "", "=q4=Mantle of the Lost Conqueror", "=ds=#e15#", "", "57%"};
		{ 17, 40638, "", "=q4=Mantle of the Lost Protector", "=ds=#e15#", "", "58%"};
		{ 18, 40639, "", "=q4=Mantle of the Lost Vanquisher", "=ds=#e15#", "", "76%"};
		{ 19, 40625, "", "=q4=Breastplate of the Lost Conqueror", "=ds=#e15#", "", "17%"};
		{ 20, 40626, "", "=q4=Breastplate of the Lost Protector", "=ds=#e15#", "", "19%"};
		{ 21, 40627, "", "=q4=Breastplate of the Lost Vanquisher", "=ds=#e15#", "", "24%"};
		{ 22, 40634, "", "=q4=Legplates of the Lost Conqueror", "=ds=#e15#", "", "56%"};
		{ 23, 40635, "", "=q4=Legplates of the Lost Protector", "=ds=#e15#", "", "58%"};
		{ 24, 40636, "", "=q4=Legplates of the Lost Vanquisher", "=ds=#e15#", "", "76%"};
		Prev = "Naxx80Gluth125Man";
		Next = "Naxx80Thaddius25Man";
	};

	AtlasLoot_Data["Naxx80Thaddius"] = {
		{ 1, 39295, "", "=q4=Cowl of Sheet Lightning", "=ds=#s1#, #a1#", "", "9%"};
		{ 2, 39294, "", "=q4=Arc-Scorched Helmet", "=ds=#s1#, #a3#", "", "9%"};
		{ 3, 39293, "", "=q4=Blackened Legplates of Feugen", "=ds=#s11#, #a4#", "", "9%"};
		{ 4, 39292, "", "=q4=Repelling Charge", "=ds=#s14#", "", "9%"};
		{ 5, 39291, "", "=q4=Torment of the Banished", "=ds=#h1#, #w10#", "", "9%"};
		{ 16, 40619, "", "=q4=Leggings of the Lost Conqueror", "=ds=#e15#", "", "27%"};
		{ 17, 40620, "", "=q4=Leggings of the Lost Protector", "=ds=#e15#", "", "28%"};
		{ 18, 40621, "", "=q4=Leggings of the Lost Vanquisher", "=ds=#e15#", "", "36%"};
		Prev = "Naxx80Gluth2";
	};

	AtlasLoot_Data["Naxx80Thaddius25Man"] = {
		{ 1, 40303, "", "=q4=Wraps of the Persecuted", "=ds=#s9#, #a1#", "", "9%"};
		{ 2, 40301, "", "=q4=Cincture of Polarity", "=ds=#s10#, #a1#", "", "9%"};
		{ 3, 40296, "", "=q4=Cover of Silence", "=ds=#s1#, #a2#", "", "8%"};
		{ 4, 40304, "", "=q4=Headpiece of Fungal Bloom", "=ds=#s1#, #a2#", "", "9%"};
		{ 5, 40299, "", "=q4=Pauldrons of the Abandoned", "=ds=#s3#, #a3#", "", "9%"};
		{ 6, 40302, "", "=q4=Benefactor's Gauntlets", "=ds=#s9#, #a3#", "", "8%"};
		{ 7, 40298, "", "=q4=Faceguard of the Succumbed", "=ds=#s1#, #a4#", "", "9%"};
		{ 8, 40294, "", "=q4=Riveted Abomination Leggings", "=ds=#s11#, #a4#", "", "8%"};
		{ 9, 40297, "", "=q4=Sabatons of Endurance", "=ds=#s12#, #a4#", "", "17%"};
		{ 10, 40300, "", "=q4=Spire of Sunset", "=ds=#w9#", "", "9%"};
		{ 16, 40634, "", "=q4=Legplates of the Lost Conqueror", "=ds=#e15#", "", "56%"};
		{ 17, 40635, "", "=q4=Legplates of the Lost Protector", "=ds=#e15#", "", "58%"};
		{ 18, 40636, "", "=q4=Legplates of the Lost Vanquisher", "=ds=#e15#", "", "76%"};
		Prev = "Naxx80Gluth225Man";
	};

		------------------------
		--- Arachnid Quarter ---
		------------------------

	AtlasLoot_Data["Naxx80AnubRekhan"] = {
		{ 1, 39192, "", "=q4=Gloves of Dark Gestures", "=ds=#s9#, #a1#", "", "10%"};
		{ 2, 39190, "", "=q4=Agonal Sash", "=ds=#s10#, #a1#", "", "10%"};
		{ 3, 39191, "", "=q4=Splint-Bound Leggings", "=ds=#s11#, #a2#", "", "11%"};
		{ 4, 39189, "", "=q4=Boots of Persistence", "=ds=#s12#, #a3#", "", "10%"};
		{ 5, 39188, "", "=q4=Chivalric Chestguard", "=ds=#s5#, #a4#", "", "10%"};
		{ 6, 39139, "", "=q4=Ravaging Sabatons", "=ds=#s12#, #a4#", "", "11%"};
		{ 7, 39146, "", "=q4=Collar of Dissolution", "=ds=#s2#", "", "10%"};
		{ 8, 39193, "", "=q4=Band of Neglected Pleas", "=ds=#s13#", "", "11%"};
		{ 9, 39141, "", "=q4=Deflection Band", "=ds=#s13#", "", "10%"};
		{ 10, 39140, "", "=q4=Knife of Incision", "=ds=#h1#, #w4#", "", "11%"};
		Next = "Naxx80Faerlina";
	};

	AtlasLoot_Data["Naxx80AnubRekhan25Man"] = {
		{ 1, 39719, "", "=q4=Mantle of the Locusts", "=ds=#s3#, #a1#", "", "9%"};
		{ 2, 39721, "", "=q4=Sash of the Parlor", "=ds=#s10#, #a1#", "", "19%"};
		{ 3, 39720, "", "=q4=Leggings of Atrophy", "=ds=#s11#, #a1#", "", "9%"};
		{ 4, 39722, "", "=q4=Swarm Bindings", "=ds=#s8#, #a2#", "", "9%"};
		{ 5, 39701, "", "=q4=Dawnwalkers", "=ds=#s12#, #a2#", "", "19%"};
		{ 6, 39702, "", "=q4=Arachnoid Gold Band", "=ds=#s8#, #a3#", "", "8%"};
		{ 7, 39718, "", "=q4=Corpse Scarab Handguards", "=ds=#s9#, #a3#", "", "9%"};
		{ 8, 39704, "", "=q4=Pauldrons of Unnatural Death", "=ds=#s3#, #a4#", "", "19%"};
		{ 9, 39703, "", "=q4=Rescinding Grips", "=ds=#s9#, #a4#", "", "19%"};
		{ 10, 39717, "", "=q4=Inexorable Sabatons", "=ds=#s12#, #a4#", "", "23%"};
		{ 11, 39706, "", "=q4=Sabatons of Sudden Reprisal", "=ds=#s12#, #a4#", "", "9%"};
		{ 12, 40071, "", "=q4=Chains of Adoration", "=ds=#s2#", "", "11%"};
		{ 13, 40065, "", "=q4=Fool's Trial", "=ds=#s2#", "", "11%"};
		{ 14, 40069, "", "=q4=Heritage", "=ds=#s2#", "", "11%"};
		{ 15, 40064, "", "=q4=Thunderstorm Amulet", "=ds=#s2#", "", "11%"};
		{ 16, 40080, "", "=q4=Lost Jewel", "=ds=#s13#", "", "11%"};
		{ 17, 40075, "", "=q4=Ruthlessness", "=ds=#s13#", "", "11%"};
		{ 18, 40107, "", "=q4=Sand-Worn Band", "=ds=#s13#", "", "11%"};
		{ 19, 40074, "", "=q4=Strong-Handed Ring", "=ds=#s13#", "", "12%"};
		{ 20, 39714, "", "=q4=Webbed Death", "=ds=#h1#, #w4#", "", "24%"};
		{ 21, 40208, "", "=q4=Cryptfiend's Bite", "=ds=#w7#", "", "10%"};
		{ 22, 39716, "", "=q4=Shield of Assimilation", "=ds=#w8#", "", "24%"};
		{ 23, 39712, "", "=q4=Gemmed Wand of the Nerubians", "=ds=#w12#", "", "24%"};
		Next = "Naxx80Faerlina25Man";
	};

	AtlasLoot_Data["Naxx80Faerlina"] = {
		{ 1, 39216, "", "=q4=Sash of Mortal Desire", "=ds=#s10#, #a1#", "", "10%"};
		{ 2, 39215, "", "=q4=Boots of the Follower", "=ds=#s12#, #a2#", "", "11%"};
		{ 3, 39196, "", "=q4=Boots of the Worshiper", "=ds=#s12#, #a2#", "", "11%"};
		{ 4, 39217, "", "=q4=Avenging Combat Leggings", "=ds=#s11#, #a3#", "", "11%"};
		{ 5, 39194, "", "=q4=Rusted-Link Spiked Gauntlets", "=ds=#s9#, #a3#", "", "10%"};
		{ 6, 39198, "", "=q4=Frostblight Pauldrons", "=ds=#s3#, #a4#", "", "10%"};
		{ 7, 39195, "", "=q4=Bracers of Lost Sentiments", "=ds=#s8#, #a4#", "", "11%"};
		{ 8, 39197, "", "=q4=Gauntlets of the Master", "=ds=#s9#, #a4#", "", "10%"};
		{ 9, 39199, "", "=q4=Watchful Eye", "=ds=#s15#", "", "11%"};
		{ 10, 39200, "", "=q4=Grieving Spellblade", "=ds=#h3#, #w10#", "", "11%"};
		Prev = "Naxx80AnubRekhan";
		Next = "Naxx80Maexxna";
	};

	AtlasLoot_Data["Naxx80Faerlina25Man"] = {
		{ 1, 39732, "", "=q4=Faerlina's Madness", "=ds=#s1#, #a1#", "", "8%"};
		{ 2, 39731, "", "=q4=Punctilious Bindings", "=ds=#s8#, #a1#", "", "9%"};
		{ 3, 39733, "", "=q4=Gloves of Token Respect", "=ds=#s9#, #a1#", "", "19%"};
		{ 4, 39735, "", "=q4=Belt of False Dignity", "=ds=#s10#, #a1#", "", "9%"};
		{ 5, 39756, "", "=q4=Tunic of Prejudice", "=ds=#s5#, #a2#", "", "19%"};
		{ 6, 39727, "", "=q4=Dislocating Handguards", "=ds=#s9#, #a2#", "", "10%"};
		{ 7, 39724, "", "=q4=Cult's Chestguard", "=ds=#s5#, #a3#"};
		{ 8, 39734, "", "=q4=Atonement Greaves", "=ds=#s12#, #a3#", "", "8%"};
		{ 9, 39723, "", "=q4=Fire-Scorched Greathelm", "=ds=#s1#, #a4#", "", "23%"};
		{ 10, 39725, "", "=q4=Epaulets of the Grieving Servant", "=ds=#s3#, #a4#", "", "11%"};
		{ 11, 39729, "", "=q4=Bracers of the Tyrant", "=ds=#s8#, #a4#", "", "8%"};
		{ 12, 39726, "", "=q4=Callous-Hearted Gauntlets", "=ds=#s9#, #a4#", "", "24%"};
		{ 13, 40071, "", "=q4=Chains of Adoration", "=ds=#s2#", "", "11%"};
		{ 14, 40065, "", "=q4=Fool's Trial", "=ds=#s2#", "", "11%"};
		{ 15, 40069, "", "=q4=Heritage", "=ds=#s2#", "", "11%"};
		{ 16, 40064, "", "=q4=Thunderstorm Amulet", "=ds=#s2#", "", "11%"};
		{ 17, 40080, "", "=q4=Lost Jewel", "=ds=#s13#", "", "11%"};
		{ 18, 40075, "", "=q4=Ruthlessness", "=ds=#s13#", "", "11%"};
		{ 19, 40107, "", "=q4=Sand-Worn Band", "=ds=#s13#", "", "11%"};
		{ 20, 40108, "", "=q4=Seized Beauty", "=ds=#s13#", "", "11%"};
		{ 21, 40074, "", "=q4=Strong-Handed Ring", "=ds=#s13#", "", "12%"};
		{ 22, 39757, "", "=q4=Idol of Worship", "=ds=#s16#, #w14#", "", "9%"};
		{ 23, 39728, "", "=q4=Totem of Misery", "=ds=#s16#, #w15#", "", "9%"};
		{ 24, 39730, "", "=q4=Widow's Fury", "=ds=#h1#, #w10#", "", "9%"};
		Prev = "Naxx80AnubRekhan25Man";
		Next = "Naxx80Maexxna25Man";
	};

	AtlasLoot_Data["Naxx80Maexxna"] = {
		{ 1, 39225, "", "=q4=Cloak of Armed Strife", "=ds=#s4#", "", "10%"};
		{ 2, 39230, "", "=q4=Spaulders of the Monstrosity", "=ds=#s3#, #a2#", "", "11%"};
		{ 3, 39224, "", "=q4=Leggings of Discord", "=ds=#s11#, #a2#", "", "10%"};
		{ 4, 39228, "", "=q4=Web Cocoon Grips", "=ds=#s9#, #a4#", "", "10%"};
		{ 5, 39232, "", "=q4=Pendant of Lost Vocations", "=ds=#s2#", "", "10%"};
		{ 6, 39231, "", "=q4=Timeworn Silken Band", "=ds=#s13#", "", "10%"};
		{ 7, 39229, "", "=q4=Embrace of the Spider", "=ds=#s14#", "", "11%"};
		{ 8, 39226, "", "=q4=Maexxna's Femur", "=ds=#h1#, #w6#", "", "10%"};
		{ 9, 39221, "", "=q4=Wraith Spear", "=ds=#w7#", "", "10%"};
		{ 10, 39233, "", "=q4=Aegis of Damnation", "=ds=#w8#", "", "10%"};
		Prev = "Naxx80Faerlina";
	};

	AtlasLoot_Data["Naxx80Maexxna25Man"] = {
		{ 1, 40250, "", "-q4-Aged Winter Cloak", "=ds=#s4#", "", "11%"};
		{ 2, 40254, "", "=q4=Cloak of Averted Crisis", "=ds=#s4#", "", "11%"};
		{ 3, 40252, "", "=q4=Cloak of the Shadowed Sun", "=ds=#s4#", "", "11%"};
		{ 4, 40253, "", "=q4=Shawl of the Old Maid", "=ds=#s4#", "", "11%"};
		{ 5, 40251, "", "=q4=Shroud of Luminosity", "=ds=#s4#", "", "11%"};
		{ 6, 40062, "", "=q4=Digested Silken Robes", "=ds=#s5#, #a1#", "", "9%"};
		{ 7, 40060, "", "=q4=Distorted Limbs", "=ds=#s11#, #a1#", "", "9%"};
		{ 8, 39768, "", "=q4=Cowl of the Perished", "=ds=#s1#, #a2#", "", "9%"};
		{ 9, 40063, "", "=q4=Mantle of Shattered Kinship", "=ds=#s3#, #a2#", "", "9%"};
		{ 10, 39765, "", "=q4=Sinner's Bindings", "=ds=#s8#, #a2#", "", "19%"};
		{ 11, 39761, "", "=q4=Infectious Skitterer Leggings", "=ds=#s11#, #a2#", "", "8%"};
		{ 12, 40061, "", "=q4=Quivering Tunic", "=ds=#s5#, #a3#", "", "19%"};
		{ 13, 39762, "", "=q4=Torn Web Wrapping", "=ds=#s10#, #a3#", "", "9%"};
		{ 14, 39760, "", "=q4=Helm of Diminished Pride", "=ds=#s1#, #a4#", "", "18%"};
		{ 15, 39767, "", "=q4=Undiminished Battleplate", "=ds=#s5#, #a4#", "", "9%"};
		{ 16, 39764, "", "=q4=Bindings of the Hapless Prey", "=ds=#s8#, #a4#", "", "9%"};
		{ 17, 39759, "", "=q4=Ablative Chitin Girdle", "=ds=#s10#, #a4#", "", "8%"};
		{ 18, 40257, "", "=q4=Defender's Code", "=ds=#s14#", "", "11%"};
		{ 19, 40255, "", "=q4=Dying Curse", "=ds=#s14#", "", "11%"};
		{ 20, 40258, "", "=q4=Forethought Talisman", "=ds=#s14#", "", "11%"};
		{ 21, 40256, "", "=q4=Grim Toll", "=ds=#s14#", "", "11%"};
		{ 22, 39766, "", "=q4=Matriarch's Spawn", "=ds=#s15#", "", "19%"};
		{ 23, 39763, "", "=q4=Wraith Strike", "=ds=#h3#, #w13#", "", "9%"};
		{ 24, 39758, "", "=q4=The Jawbone", "=ds=#h2#, #w6#", "", "9%"};
		Prev = "Naxx80Faerlina25Man";
	};

		------------------------
		--- Military Quarter ---
		------------------------

	AtlasLoot_Data["Naxx80Razuvious"] = {
		{ 1, 39297, "", "=q4=Cloak of Darkening", "=ds=#s4#", "", "10%"};
		{ 2, 39310, "", "=q4=Mantle of the Extensive Mind", "=ds=#s3#, #a1#", "", "10%"};
		{ 3, 39309, "", "=q4=Leggings of the Instructor", "=ds=#s11#, #a1#", "", "10%"};
		{ 4, 39299, "", "=q4=Rapid Attack Gloves", "=ds=#s9#, #a2#", "", "10%"};
		{ 5, 39308, "", "=q4=Girdle of Lenience", "=ds=#s10#, #a2#", "", "10%"};
		{ 6, 39307, "", "=q4=Iron Rings of Endurance", "=ds=#s8#, #a3#", "", "10%"};
		{ 7, 39306, "", "=q4=Plated Gloves of Relief", "=ds=#s9#, #a4#", "", "10%"};
		{ 8, 39298, "", "=q4=Waistguard of the Tutor", "=ds=#s10#, #a4#", "", "10%"};
		{ 9, 39311, "", "=q4=Scepter of Murmuring Spirits", "=ds=#s15#", "", "10%"};
		{ 10, 39296, "", "=q4=Accursed Bow of the Elite", "=ds=#w2#", "", "10%"};
		Next = "Naxx80Gothik";
	};

	AtlasLoot_Data["Naxx80Razuvious25Man"] = {
		{ 1, 40325, "", "=q4=Bindings of the Expansive Mind", "=ds=#s8#, #a1#", "", "9%"};
		{ 2, 40326, "", "=q4=Boots of Forlorn Wishes", "=ds=#s12#, #a1#", "", "20%"};
		{ 3, 40305, "", "=q4=Spaulders of Egotism", "=ds=#s3#, #a2#", "", "8%"};
		{ 4, 40319, "", "=q4=Chestpiece of Suspicion", "=ds=#s5#, #a2#", "", "9%"};
		{ 5, 40323, "", "=q4=Esteemed Bindings", "=ds=#s8#, #a2#", "", "9%"};
		{ 6, 40315, "", "=q4=Shoulderpads of Secret Arts", "=ds=#s3#, #a3#", "", "9%"};
		{ 7, 40324, "", "=q4=Bands of Mutual Respect", "=ds=#s8#, #a3#", "", "9%"};
		{ 8, 40327, "", "=q4=Girdle of Recuperation", "=ds=#s10#, #a3#", "", "9%"};
		{ 9, 40306, "", "=q4=Bracers of the Unholy Knight", "=ds=#s8#, #a4#", "", "9%"};
		{ 10, 40316, "", "=q4=Gauntlets of Guiding Touch", "=ds=#s9#, #a4#", "", "9%"};
		{ 11, 40317, "", "=q4=Girdle of Razuvious", "=ds=#s10#, #a4#", "", "9%"};
		{ 12, 40318, "", "=q4=Legplates of Double Strikes", "=ds=#s11#, #a4#", "", "9%"};
		{ 13, 40320, "", "=q4=Faithful Steel Sabatons", "=ds=#s12#, #a4#", "", "9%"};
		{ 14, 40071, "", "=q4=Chains of Adoration", "=ds=#s2#", "", "11%"};
		{ 15, 40065, "", "=q4=Fool's Trial", "=ds=#s2#", "", "11%"};
		{ 16, 40069, "", "=q4=Heritage", "=ds=#s2#", "", "11%"};
		{ 17, 40064, "", "=q4=Thunderstorm Amulet", "=ds=#s2#", "", "11%"};
		{ 18, 40080, "", "=q4=Lost Jewel", "=ds=#s13#", "", "11%"};
		{ 19, 40075, "", "=q4=Ruthlessness", "=ds=#s13#", "", "11%"};
		{ 20, 40107, "", "=q4=Sand-Worn Band", "=ds=#s13#", "", "11%"};
		{ 21, 40074, "", "=q4=Strong-Handed Ring", "=ds=#s13#", "", "12%"};
		{ 22, 40321, "", "=q4=Idol of the Shooting Star", "=ds=#s16#, #w14#", "", "9%"};
		{ 23, 40322, "", "=q4=Totem of Dueling", "=ds=#s16#, #w15#", "", "9%"};
		Next = "Naxx80Gothik25Man";
	};

	AtlasLoot_Data["Naxx80Gothik"] = {
		{ 1, 39390, "", "=q4=Resurgent Phantom Bindings", "=ds=#s8#, #a1#", "", "10%"};
		{ 2, 39386, "", "=q4=Tunic of Dislocation", "=ds=#s5#, #a2#", "", "19%"};
		{ 3, 39391, "", "=q4=Heinous Mail Chestguard", "=ds=#s5#, #a3#", "", "11%"};
		{ 4, 39379, "", "=q4=Spectral Rider's Girdle", "=ds=#s10#, #a3#", "", "10%"};
		{ 5, 39345, "", "=q4=Girdle of the Ascended Phantom", "=ds=#s10#, #a4#", "", "20%"};
		{ 6, 39369, "", "=q4=Sabatons of Deathlike Gloom", "=ds=#s12#, #a4#", "", "10%"};
		{ 7, 39392, "", "=q4=Veiled Amulet of Life", "=ds=#s2#", "", "10%"};
		{ 8, 39389, "", "=q4=Signet of the Malevolent", "=ds=#s2#", "", "10%"};
		{ 9, 39388, "", "=q4=Spirit-World Glass", "=ds=#s14#", "", "10%"};
		{ 10, 39344, "", "=q4=Slayer of the Lifeless", "=ds=#h1#, #w10#", "", "10%"};
		Prev = "Naxx80Razuvious";
		Next = "Naxx80FourHorsemen";
	};

	AtlasLoot_Data["Naxx80Gothik25Man"] = {
		{ 1, 40250, "", "-q4-Aged Winter Cloak", "=ds=#s4#", "", "11%"};
		{ 2, 40254, "", "=q4=Cloak of Averted Crisis", "=ds=#s4#", "", "11%"};
		{ 3, 40252, "", "=q4=Cloak of the Shadowed Sun", "=ds=#s4#", "", "11%"};
		{ 4, 40253, "", "=q4=Shawl of the Old Maid", "=ds=#s4#", "", "11%"};
		{ 5, 40251, "", "=q4=Shroud of Luminosity", "=ds=#s4#", "", "11%"};
		{ 6, 40339, "", "=q4=Gothik's Cowl", "=ds=#s1#, #a1#", "", "19%"};
		{ 7, 40338, "", "=q4=Bindings of Yearning", "=ds=#s8#, #a1#", "", "19%"};
		{ 8, 40329, "", "=q4=Hood of the Exodus", "=ds=#s1#, #a2#", "", "9%"};
		{ 9, 40341, "", "=q4=Shackled Cinch", "=ds=#s10#, #a2#", "", "9%"};
		{ 10, 40333, "", "=q4=Leggings of Fleeting Moments", "=ds=#s11#, #a2#", "", "9%"};
		{ 11, 40340, "", "=q4=Helm of Unleashed Energy", "=ds=#s1#, #a3#", "", "9%"};
		{ 12, 40331, "", "=q4=Leggings of Failed Escape", "=ds=#s11#, #a3#", "", "9%"};
		{ 13, 40328, "", "=q4=Helm of Vital Protection", "=ds=#s1#, #a4#", "", "9%"};
		{ 14, 40334, "", "=q4=Burdened Shoulderplates", "=ds=#s3#, #a4#", "", "9%"};
		{ 15, 40332, "", "=q4=Abetment Bracers", "=ds=#s8#, #a4#", "", "19%"};
		{ 16, 40330, "", "=q4=Bracers of Unrelenting Attack", "=ds=#s8#, #a4#", "", "9%"};
		{ 17, 40257, "", "=q4=Defender's Code", "=ds=#s14#", "", "11%"};
		{ 18, 40255, "", "=q4=Dying Curse", "=ds=#s14#", "", "11%"};
		{ 19, 40258, "", "=q4=Forethought Talisman", "=ds=#s14#", "", "11%"};
		{ 20, 40256, "", "=q4=Grim Toll", "=ds=#s14#", "", "11%"};
		{ 21, 40342, "", "=q4=Idol of Awakening", "=ds=#s16#, #w14#", "", "9%"};
		{ 22, 40337, "", "=q4=Libram of Resurgence", "=ds=#s16#, #w16#", "", "19%"};
		{ 23, 40336, "", "=q4=Life and Death", "=ds=#h3#, #w10#", "", "19%"};
		{ 24, 40335, "", "=q4=Touch of Horror", "=ds=#w12#", "", "9%"};
		Prev = "Naxx80Razuvious25Man";
		Next = "Naxx80FourHorsemen25Man";
	};

	AtlasLoot_Data["Naxx80FourHorsemen"] = {
		{ 1, 39396, "", "=q4=Gown of Blaumeux", "=ds=#s5#, #a1#", "", "12%"};
		{ 2, 39397, "", "=q4=Pauldrons of Havoc", "=ds=#s3#, #a3#", "", "12%"};
		{ 3, 39395, "", "=q4=Thane's Tainted Greathelm", "=ds=#s1#, #a4#", "", "12%"};
		{ 4, 39393, "", "=q4=Claymore of Ancient Power", "=ds=#h2#, #w10#", "", "12%"};
		{ 5, 39394, "", "=q4=Charmed Cierge", "=ds=#w9#", "", "12%"};
		{ 16, 40610, "", "=q4=Chestguard of the Lost Conqueror", "=ds=#e15#", "", "18%"};
		{ 17, 40611, "", "=q4=Chestguard of the Lost Protector", "=ds=#e15#", "", "19%"};
		{ 18, 40612, "", "=q4=Chestguard of the Lost Vanquisher", "=ds=#e15#", "", "25%"};
		Prev = "Naxx80Gothik";
	};

	AtlasLoot_Data["Naxx80FourHorsemen25Man"] = {
		{ 1, 40349, "", "=q4=Gloves of Peaceful Death", "=ds=#s9#, #a2#", "", "11%"};
		{ 2, 40344, "", "=q4=Helm of the Grave", "=ds=#s1#, #a3#", "", "10%"};
		{ 3, 40352, "", "=q4=Leggings of Voracious Shadows", "=ds=#s11#, #a3#", "", "10%"};
		{ 4, 40347, "", "=q4=Zeliek's Gauntlets", "=ds=#s9#, #a4#", "", "8%"};
		{ 5, 40350, "", "=q4=Urn of Lost Memories", "=ds=#s15#", "", "10%"};
		{ 6, 40345, "", "=q4=Broken Promise", "=ds=#h1#, #w10#", "", "10%"};
		{ 8, 40343, "", "=q4=Armageddon", "=ds=#h2#, #w10#", "", "9%"};
		{ 7, 40348, "", "=q4=Damnation", "=ds=#w9#", "", "10%"};
		{ 9, 40346, "", "=q4=Final Voyage", "=ds=#w3#", "", "10%"};
		{ 16, 40625, "", "=q4=Breastplate of the Lost Conqueror", "=ds=#e15#", "", "30%"};
		{ 17, 40626, "", "=q4=Breastplate of the Lost Protector", "=ds=#e15#", "", "30%"};
		{ 18, 40627, "", "=q4=Breastplate of the Lost Vanquisher", "=ds=#e15#", "", "40%"};
		Prev = "Naxx80Gothik25Man";
	};

		----------------------
		--- Plague Quarter ---
		----------------------

	AtlasLoot_Data["Naxx80Noth"] = {
		{ 1, 39241, "", "=q4=Dark Shroud of the Scourge", "=ds=#s4#", "", "10%"};
		{ 2, 39242, "", "=q4=Robes of Hoarse Breaths", "=ds=#s5#, #a1#", "", "10%"};
		{ 3, 39240, "", "=q4=Noth's Curse", "=ds=#s1#, #a2#", "", "10%"};
		{ 4, 39237, "", "=q4=Spaulders of Resumed Battle", "=ds=#s3#, #a2#", "", "10%"};
		{ 5, 39243, "", "=q4=Handgrips of the Foredoomed", "=ds=#s9#, #a3#", "", "10%"};
		{ 6, 39236, "", "=q4=Trespasser's Boots", "=ds=#s12#, #a3#", "", "10%"};
		{ 7, 39239, "", "=q4=Chestplate of the Risen Soldier", "=ds=#s5#, #a4#", "", "10%"};
		{ 8, 39235, "", "=q4=Bone-Framed Bracers", "=ds=#s8#, #a4#", "", "10%"};
		{ 9, 39234, "", "=q4=Plague-Impervious Boots", "=ds=#s12#, #a4#", "", "10%"};
		{ 10, 39244, "", "=q4=Ring of the Fated", "=ds=#s13#", "", "10%"};
		Next = "Naxx80Heigan";
	};

	AtlasLoot_Data["Naxx80Noth25Man"] = {
		{ 1, 40602, "", "=q4=Robes of Mutation", "=ds=#s5#, #a1#", "", "19%"};
		{ 2, 40198, "", "=q4=Bands of Impurity", "=ds=#s8#, #a1#", "", "9%"};
		{ 3, 40197, "", "=q4=Gloves of the Fallen Wizard", "=ds=#s9#, #a1#", "", "9%"};
		{ 4, 40186, "", "=q4=Thrusting Bands", "=ds=#s8#, #a2#", "", "9%"};
		{ 5, 40200, "", "=q4=Belt of Potent Chanting", "=ds=#s10#, #a2#", "", "9%"};
		{ 6, 40193, "", "=q4=Tunic of Masked Suffering", "=ds=#s5#, #a3#", "", "20%"};
		{ 7, 40196, "", "=q4=Legguards of the Undisturbed", "=ds=#s11#, #a3#", "", "9%"};
		{ 8, 40184, "", "=q4=Crippled Treads", "=ds=#s12#, #a3#", "", "9%"};
		{ 9, 40185, "", "=q4=Shoulderguards of Opportunity", "=ds=#s3#, #a4#", "", "9%"};
		{ 10, 40188, "", "=q4=Gauntlets of the Disobediant", "=ds=#s9#, #a4#", "", "9%"};
		{ 11, 40187, "", "=q4=Poignant Sabatons", "=ds=#s12#, #a4#", "", "9%"};
		{ 12, 40071, "", "=q4=Chains of Adoration", "=ds=#s2#", "", "11%"};
		{ 13, 40065, "", "=q4=Fool's Trial", "=ds=#s2#", "", "11%"};
		{ 14, 40069, "", "=q4=Heritage", "=ds=#s2#", "", "11%"};
		{ 15, 40064, "", "=q4=Thunderstorm Amulet", "=ds=#s2#", "", "11%"};
		{ 16, 40080, "", "=q4=Lost Jewel", "=ds=#s13#", "", "11%"};
		{ 17, 40075, "", "=q4=Ruthlessness", "=ds=#s13#", "", "11%"};
		{ 18, 40107, "", "=q4=Sand-Worn Band", "=ds=#s13#", "", "11%"};
		{ 29, 40074, "", "=q4=Strong-Handed Ring", "=ds=#s13#", "", "12%"};
		{ 20, 40192, "", "=q4=Accursed Spine", "=ds=#s15#", "", "9%"};
		{ 21, 40191, "", "=q4=Libram of Radiance", "=ds=#s16#, #w16#", "", "9%"};
		{ 22, 40189, "", "=q4=Angry Dread", "=ds=#h1#, #w6#", "", "19%"};
		{ 23, 40190, "", "=q4=Spinning Fate", "=ds=#w11#", "", "9%"};
		Next = "Naxx80Heigan25Man";
	};

	AtlasLoot_Data["Naxx80Heigan"] = {
		{ 1, 39252, "", "=q4=Preceptor's Bindings", "=ds=#s8#, #a1#", "", "9%"};
		{ 2, 39254, "", "=q4=Saltarello Shoes", "=ds=#s12#, #a1#", "", "10%"};
		{ 3, 39247, "", "=q4=Cuffs of Dark Shadows", "=ds=#s8#, #a2#", "", "9%"};
		{ 4, 39248, "", "=q4=Tunic of the Lost Pack", "=ds=#s5#, #a3#", "", "10%"};
		{ 5, 39251, "", "=q4=Necrogenic Belt", "=ds=#s10#, #a3#", "", "10%"};
		{ 6, 39249, "", "=q4=Shoulderplates of Bloodshed", "=ds=#s3#, #a4#", "", "9%"};
		{ 7, 39246, "", "=q4=Amulet of Autopsy", "=ds=#s2#", "", "9%"};
		{ 8, 39250, "", "=q4=Ring of Holy Cleansing", "=ds=#s13#", "", "10%"};
		{ 9, 39245, "", "=q4=Demise", "=ds=#h2#, #w6#", "", "9%"};
		{ 10, 39255, "", "=q4=Staff of the Plague Beast", "=ds=#w9#", "", "9%"};
		Prev = "Naxx80Noth";
		Next = "Naxx80Loatheb";
	};

	AtlasLoot_Data["Naxx80Heigan25Man"] = {
		{ 1, 40250, "", "=q4=Aged Winter Cloak", "=ds=#s4#", "", "11%"};
		{ 2, 40254, "", "=q4=Cloak of Averted Crisis", "=ds=#s4#", "", "11%"};
		{ 3, 40252, "", "=q4=Cloak of the Shadowed Sun", "=ds=#s4#", "", "11%"};
		{ 4, 40253, "", "=q4=Shawl of the Old Maid", "=ds=#s4#", "", "11%"};
		{ 5, 40251, "", "=q4=Shroud of Luminosity", "=ds=#s4#", "", "11%"};
		{ 6, 40234, "", "=q4=Heigan's Putrid Vestments", "=ds=#s5#, #a1#", "", "9%"};
		{ 7, 40236, "", "=q4=Serene Echoes", "=ds=#s12#, #a1#", "", "19%"};
		{ 8, 40238, "", "=q4=Gloves of the Dancing Bear", "=ds=#s9#, #a2#", "", "9%"};
		{ 9, 40205, "", "=q4=Stalk-Skin Belt", "=ds=#s10#, #a2#", "", "9%"};
		{ 10, 40235, "", "=q4=Helm of Pilgrimage", "=ds=#s1#, #a3#", "", "10%"};
		{ 11, 40209, "", "=q4=Bindings of the Decrepit", "=ds=#s8#, #a3#", "", "9%"};
		{ 12, 40201, "", "=q4=Leggings of Colossal Strides", "=ds=#s11#, #a3#", "", "9%"};
		{ 13, 40237, "", "=q4=Eruption-Scared Boots", "=ds=#s12#, #a3#", "", "10%"};
		{ 14, 40203, "", "=q4=Breastplate of Tormented Rage", "=ds=#s5#, #a4#", "", "18%"};
		{ 15, 40210, "", "=q4=Chestguard of Bitter Charms", "=ds=#s5#, #a4#", "", "9%"};
		{ 16, 40204, "", "=q4=Legguards of the Apostle", "=ds=#s11#, #a4#", "", "9%"};
		{ 17, 40206, "", "=q4=Iron-Spring Jumpers", "=ds=#s12#, #a4#", "", "9%"};
		{ 18, 40257, "", "=q4=Defender's Code", "=ds=#s14#", "", "11%"};
		{ 19, 40255, "", "=q4=Dying Curse", "=ds=#s14#", "", "11%"};
		{ 20, 40258, "", "=q4=Forethought Talisman", "=ds=#s14#", "", "11%"};
		{ 21, 40256, "", "=q4=Grim Toll", "=ds=#s14#", "", "11%"};
		{ 22, 40207, "", "=q4=Sigil of Awareness", "=ds=#s16#, #w21#", "", "9%"};
		{ 23, 40208, "", "=q4=Cryptfiend's Bite", "=ds=#w7#", "", "10%"};
		{ 24, 40233, "", "=q4=The Undeath Carrier", "=ds=#w9#", "", "9%"};
		Prev = "Naxx80Noth25Man";
		Next = "Naxx80Loatheb25Man";
	};

	AtlasLoot_Data["Naxx80Loatheb"] = {
		{ 1, 39259, "", "=q4=Fungi-Stained Coverings", "=ds=#s5#, #a2#", "", "10%"};
		{ 2, 39260, "", "=q4=Helm of the Corrupted Mind", "=ds=#s1#, #a4#", "", "10%"};
		{ 3, 39258, "", "=q4=Legplates of Inescapable Death", "=ds=#s11#, #a4#", "", "10%"};
		{ 4, 39257, "", "=q4=Loatheb's Shadow", "=ds=#s14#", "", "10%"};
		{ 5, 39256, "", "=q4=Sulfur Stave", "=ds=#w9#", "", "10%"};
		{ 16, 40622, "", "=q4=Spaulders of the Lost Conqueror", "=ds=#e15#", "", "29%"};
		{ 17, 40623, "", "=q4=Spaulders of the Lost Protector", "=ds=#e15#", "", "30%"};
		{ 18, 40624, "", "=q4=Spaulders of the Lost Vanquisher", "=ds=#e15#", "", "38%"};
		Prev = "Naxx80Heigan";
	};

	AtlasLoot_Data["Naxx80Loatheb25Man"] = {
		{ 1, 40247, "", "=q4=Cowl of Innocent Delight", "=ds=#s1#, #a1#", "", "9%"};
		{ 2, 40246, "", "=q4=Boots of Impetuous Ideals", "=ds=#s12#, #a1#", "", "9%"};
		{ 3, 40249, "", "=q4=Vest of Vitality", "=ds=#s5#, #a2#", "", "10%"};
		{ 4, 40243, "", "=q4=Footwraps of Vile Deceit", "=ds=#s12#, #a2#", "", "10%"};
		{ 5, 40242, "", "=q4=Grotesque Handgrips", "=ds=#s9#, #a3#", "", "19%"};
		{ 6, 40241, "", "=q4=Girdle of Unity", "=ds=#s10#, #a4#", "", "10%"};
		{ 7, 40240, "", "=q4=Greaves of Turbulence", "=ds=#s11#, #a4#", "", "9%"};
		{ 8, 40244, "", "=q4=The Impossible Dream", "=ds=#h3#, #w6#", "", "10%"};
		{ 9, 40239, "", "=q4=The Hand of Nerub", "=ds=#h4#, #w13#", "", "19%"};
		{ 10, 40245, "", "=q4=Fading Glow", "=ds=#w12#", "", "10%"};
		{ 16, 40637, "", "=q4=Mantle of the Lost Conqueror", "=ds=#e15#", "", "57%"};
		{ 17, 40638, "", "=q4=Mantle of the Lost Protector", "=ds=#e15#", "", "58%"};
		{ 18, 40639, "", "=q4=Mantle of the Lost Vanquisher", "=ds=#e15#", "", "76%"};
		Prev = "Naxx80Heigan25Man";
	};

		----------------------
		--- Frostwyrm Lair ---
		----------------------

	AtlasLoot_Data["Naxx80Sapphiron"] = {
		{ 1, 39415, "", "=q4=Shroud of the Citadel", "=ds=#s4#", "", "19%"};
		{ 2, 39404, "", "=q4=Cloak of Mastery", "=ds=#s4#", "", "18%"};
		{ 3, 39409, "", "=q4=Cowl of Winged Fear", "=ds=#s1#, #a1#", "", "18%"};
		{ 4, 39408, "", "=q4=Leggings of Sapphiron", "=ds=#s11#, #a1#", "", "19%"};
		{ 5, 39399, "", "=q4=Helm of the Vast Legions", "=ds=#s1#, #a2#", "", "17%"};
		{ 6, 39405, "", "=q4=Helmet of the Inner Sanctum", "=ds=#s1#, #a3#", "", "18%"};
		{ 7, 39403, "", "=q4=Helm of the Unsubmissive", "=ds=#s1#, #a4#", "", "17%"};
		{ 8, 39398, "", "=q4=Massive Skeletal Ribcage", "=ds=#s5#, #a4#", "", "19%"};
		{ 9, 39401, "", "=q4=Circle of Death", "=ds=#s13#", "", "19%"};
		{ 10, 39407, "", "=q4=Circle of Life", "=ds=#s13#", "", "18%"};
		{ 11, 44569, "", "=q4=Key to the Focusing Iris", "=ds=#m2#", "", "91%"};
		{ 12, 44582, "", "=q4=Key to the Focusing Iris", "=q1=#m4#: =ds=#e9#"};
		Next = "Naxx80KelThuzad";
	};

	AtlasLoot_Data["Naxx80Sapphiron25Man"] = {
		{ 1, 40381, "", "=q4=Sympathy", "=ds=#s5#, #a1#", "", "19%"};
		{ 2, 40380, "", "=q4=Gloves of Grandeur", "=ds=#s9#, #a1#", "", "18%"};
		{ 3, 40376, "", "=q4=Legwraps of the Defeated Dragon", "=ds=#s11#, #a1#", "", "19%"};
		{ 4, 40362, "", "=q4=Gloves of Fast Reactions", "=ds=#s9#, #a2#", "", "17%"};
		{ 5, 40379, "", "=q4=Legguards of the Boneyard", "=ds=#s11#, #a2#", "", "19%"};
		{ 6, 40367, "", "=q4=Boots of the Great Construct", "=ds=#s12#, #a3#", "", "18%"};
		{ 7, 40366, "", "=q4=Platehelm of the Great Wyrm", "=ds=#s1#, #a4#", "", "18%"};
		{ 8, 40377, "", "=q4=Noble Birthright Pauldrons", "=ds=#s3#, #a4#", "", "18%"};
		{ 9, 40365, "", "=q4=Breastplate of Frozen Pain", "=ds=#s5#, #a4#", "", "19%"};
		{ 10, 40363, "", "=q4= Bone-Inlaid Legguards", "=ds=#s11#, #a4#", "", "18%"};
		{ 11, 40378, "", "=q4=Ceaseless Pity", "=ds=#s2#", "", "19%"};
		{ 12, 40374, "", "=q4=Cosmic Lights", "=ds=#s2#", "", "19%"};
		{ 13, 40369, "", "=q4=Icy Blast Amulet", "=ds=#s2#", "", "18%"};
		{ 14, 40370, "", "=q4=Gatekeeper", "=ds=#s13#", "", "18%"};
		{ 15, 40375, "", "=q4=Ring of Decaying Beauty", "=ds=#s13#", "", "20%"};
		{ 16, 40371, "", "=q4=Bandit's Insignia", "=ds=#s14#", "", "18%"};
		{ 17, 40373, "", "=q4=Extract of Necromatic Power", "=ds=#s14#", "", "18%"};
		{ 18, 40372, "", "=q4=Rune of Repulsion", "=ds=#s14#", "", "19%"};
		{ 19, 40382, "", "=q4=Soul of the Dead", "=ds=#s14#", "", "20%"};
		{ 20, 40368, "", "=q4=Murder", "=ds=#h1#, #w4#", "", "19%"};
		{ 22, 44577, "", "=q4=Heroic Key to the Focusing Iris", "=ds=#m2#", "", "92%"};
		{ 23, 44581, "", "=q4=Heroic Key to the Focusing Iris", "=q1=#m4#: =ds=#e9#"};
		Next = "Naxx80KelThuzad25Man";
	};

	AtlasLoot_Data["Naxx80KelThuzad"] = {
		{ 1, 39425, "", "=q4=Cloak of the Dying", "=ds=#s4#", "", "19%"};
		{ 2, 39421, "", "=q4=Gem of Imprisoned Vassals", "=ds=#s2#", "", "19%"};
		{ 3, 39416, "", "=q4=Kel'Thuzad's Reach", "=ds=#h3#, #w13#", "", "18%"};
		{ 4, 39424, "", "=q4=The Soulblade", "=ds=#h3#, #w4#", "", "19%"};
		{ 5, 39420, "", "=q4=Anarchy", "=ds=#h1#, #w4#", "", "18%"};
		{ 6, 39417, "", "=q4=Death's Bite", "=ds=#h2#, #w1#", "", "18%"};
		{ 7, 39423, "", "=q4=Hammer of the Astral Plane", "=ds=#h3#, #w6#", "", "18%"};
		{ 8, 39422, "", "=q4=Staff of the Plaguehound", "=ds=#w9#", "", "19%"};
		{ 9, 39426, "", "=q4=Wand of the Archlich", "=ds=#w12#", "", "19%"};
		{ 10, 39419, "", "=q4=Nerubian Conquerer", "=ds=#w5#", "", "19%"};
		{ 16, 40616, "", "=q4=Helm of the Lost Conqueror", "=ds=#e15#", "", "28%"};
		{ 17, 40617, "", "=q4=Helm of the Lost Protector", "=ds=#e15#", "", "28%"};
		{ 18, 40618, "", "=q4=Helm of the Lost Vanquisher", "=ds=#e15#", "", "38%"};
		Prev = "Naxx80Sapphiron";
		Next = "Naxx80Trash";
	};

	AtlasLoot_Data["Naxx80KelThuzad25Man"] = {
		{ 1, 40405, "", "=q4=Cape of the Unworthy Wizard", "=ds=#s4#", "", "18%"};
		{ 2, 40403, "", "=q4=Drape of the Deadly Foe", "=ds=#s4#", "", "18%"};
		{ 3, 40398, "", "=q4=Leggings of Mortal Arrogance", "=ds=#s11#, #a1#", "", "18%"};
		{ 4, 40387, "", "=q4=Boundless Ambition", "=ds=#s2#", "", "18%"};
		{ 5, 40399, "", "=q4=Signet of Manifested Pain", "=ds=#s13#", "", "17%"};
		{ 6, 40383, "", "=q4=Calamity's Grasp", "=ds=#h3#, #w13#", "", "18%"};
		{ 7, 40386, "", "=q4=Sinister Revenge", "=ds=#h1#, #w4#", "", "17%"};
		{ 8, 40396, "", "=q4=The Turning Tide", "=ds=#h3#, #w10#", "", "18%"};
		{ 9, 40402, "", "=q4=Last Laugh", "=ds=#h1#, #w1#", "", "18%"};
		{ 10, 40384, "", "=q4=Betrayer of Humanity", "=ds=#h2#, #w1#", "", "17%"};
		{ 11, 40395, "", "=q4=Torch of Holy Fire", "=ds=#h3#, #w6#", "", "18%"};
		{ 12, 40388, "", "=q4=Journey's End", "=ds=#w9#", "", "18%"};
		{ 13, 40401, "", "=q4=Voice of Reason", "=ds=#w8#", "", "17%"};
		{ 14, 40400, "", "=q4=Wall of Terror", "=ds=#w8#", "", "18%"};
		{ 15, 40385, "", "=q4=Envoy of Mortality", "=ds=#w5#", "", "17%"};
		{ 16, 40631, "", "=q4=Crown of the Lost Conqueror", "=ds=#e15#", "", "54%"};
		{ 17, 40632, "", "=q4=Crown of the Lost Protector", "=ds=#e15#", "", "57%"};
		{ 18, 40633, "", "=q4=Crown of the Lost Vanquisher", "=ds=#e15#", "", "73%"};
		Prev = "Naxx80Sapphiron25Man";
		Next = "Naxx80Trash25Man";
	};

	AtlasLoot_Data["Naxx80Trash"] = {
		{ 1, 39467, "", "=q4=Minion Bracers", "=ds=#s8#, #a4#", "", "1%"};
		{ 2, 39472, "", "=q4=Chain of Latent Energies", "=ds=#s2#", "", "1%"};
		{ 3, 39470, "", "=q4=Medallion of the Disgraced", "=ds=#s2#", "", "1%"};
		{ 4, 39427, "", "=q4=Omen of Ruin", "=ds=#h1#, #w4#", "", "1%"};
		{ 5, 39468, "", "=q4=The Stray", "=ds=#h4#, #w13#", "", "1%"};
		{ 6, 39473, "", "=q4=Contortion", "=ds=#w12#", "", "1%"};
		Prev = "Naxx80KelThuzad";
	};

	AtlasLoot_Data["Naxx80Trash25Man"] = {
		{ 1, 40410, "", "=q4=Shadow of the Ghoul", "=ds=#s4#", "", "1%"};
		{ 2, 40409, "", "=q4=Boots of the Escaped Captive", "=ds=#s12#, #a2#", "", "1%"};
		{ 3, 40414, "", "=q4=Shoulderguards of the Undaunted", "=ds=#s3#, #a4#", "", "1%"};
		{ 4, 40412, "", "=q4=Ousted Bead Necklace", "=ds=#s2#", "", "1%"};
		{ 5, 40408, "", "=q4=Haunting Call", "=ds=#h3#, #w4#", "", "1%"};
		{ 6, 40407, "", "=q4=Silent Crusader", "=ds=#h1#, #w10#", "", "1%"};
		{ 7, 40406, "", "=q4=Inevitable Defeat", "=ds=#h2#, #w6#", "", "1%"};
		Prev = "Naxx80KelThuzad25Man";
	};

		------------------------
		--- Obsidian Sanctum ---
		------------------------

	AtlasLoot_Data["Sartharion"] = {
		{ 1, 40428, "", "=q4=Titan's Outlook", "=ds=#s1#, #a4#", "", "18%"};
		{ 2, 40427, "", "=q4=Circle of Arcane Streams", "=ds=#s2#", "", "18%"};
		{ 3, 40426, "", "=q4=Signet of the Accord", "=ds=#s13#", "", "19%"};
		{ 4, 40433, "", "=q4=Wyrmrest Band", "=ds=#s13#", "", "7%"};
		{ 5, 40430, "", "=q4=Majestic Dragon Figurine", "=ds=#s14#", "", "18%"};
		{ 6, 40429, "", "=q4=Crimson Steel", "=ds=#h3#, #w13#", "", "18%"};
		{ 7, 43345, "", "=q4=Dragon Hide Bag", "=ds=#e1#", "", "100%"};
		{ 8, 43347, "", "=q4=Satchel of Spoils", "", "", "100%"};
		{ 10, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["One Drake Left"]};
		{ 11, 43988, "", "=q4=Gale-Proof Cloak", "=ds=#s4#", "", "1%"};
		{ 12, 43990, "", "=q4=Blade-Scarred Tunic", "=ds=#s5#, #a2#", "", "2%"};
		{ 13, 43991, "", "=q4=Legguards of Composure", "=ds=#s11#, #a2#", "", "1%"};
		{ 14, 43989, "", "=q4=Remembrance Girdle", "=ds=#s10#, #a4#", "", "2%"};
		{ 15, 43992, "", "=q4=Volitant Amulet", "=ds=#s2#", "", "2%"};
		{ 16, 40613, "", "=q4=Gloves of the Lost Conqueror", "=ds=#e15#", "", "28%"};
		{ 17, 40614, "", "=q4=Gloves of the Lost Protector", "=ds=#e15#", "", "29%"};
		{ 18, 40615, "", "=q4=Gloves of the Lost Vanquisher", "=ds=#e15#", "", "37%"};
		{ 20, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["Two Drakes Left"]};
		{ 21, 43995, "", "=q4=Enamored Cowl", "=ds=#s1#, #a1#", "", "0.00%"};
		{ 22, 43998, "", "=q4=Chestguard of Flagrant Prowess", "=ds=#s5#, #a3#"};
		{ 23, 43996, "", "=q4=Sabatons of Firmament", "=ds=#s12#, #a3#"};
		{ 24, 43994, "", "=q4=Belabored Legplates", "=ds=#s11#, #a4#"};
		{ 25, 43993, "", "=q4=Greatring of Collision", "=ds=#s13#"};
		{ 27, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["Three Drakes Left"]};
		{ 28, 43986, "", "=q4=Reins of the Black Drake", "=ds=#e12#", "", "100%"};
	};

	AtlasLoot_Data["Sartharion25Man"] = {
		{ 1, 40437, "", "=q4=Concealment Shoulderpads", "=ds=#s3#, #a2#", "", "16%"};
		{ 2, 40439, "", "=q4=Mantle of the Eternal Sentinel", "=ds=#s3#, #a2#", "", "19%"};
		{ 3, 40451, "", "=q4=Hyaline Helm of the Sniper", "=ds=#s1#, #a3#", "", "16%"};
		{ 4, 40438, "", "=q4=Council Chamber Epaulets", "=ds=#s3#, #a3#", "", "19%"};
		{ 5, 40453, "", "=q4=Chestplate of the Great Aspects", "=ds=#s5#, #a4#", "", "17%"};
		{ 6, 40446, "", "=q4=Dragon Brood Legguards", "=ds=#s11#, #a4#", "", "17%"};
		{ 7, 40433, "", "=q4=Wyrmrest Band", "=ds=#s13#", "", "7%"};
		{ 8, 40431, "", "=q4=Fury of the Five Flights", "=ds=#s14#", "", "17%"};
		{ 9, 40432, "", "=q4=Illustration of the Dragon Soul", "=ds=#s14#", "", "19%"};
		{ 10, 40455, "", "=q4=Staff of Restraint", "=ds=#w9#", "", "19%"};
		{ 11, 43345, "", "=q4=Dragon Hide Bag", "=ds=#e1#", "", "100%"};
		{ 12, 43346, "", "=q4=Large Satchel of Spoils", "", "", "100%"};
		{ 13, 40628, "", "=q4=Gauntlets of the Lost Conqueror", "=ds=#e15#", "", "51%"};
		{ 14, 40629, "", "=q4=Gauntlets of the Lost Protector", "=ds=#e15#", "", "53%"};
		{ 15, 40630, "", "=q4=Gauntlets of the Lost Vanquisher", "=ds=#e15#", "", "67%"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["One Drake Left"]};
		{ 17, 44002, "", "=q4=The Sanctum's Flowing Vestments", "=ds=#s5#, #a1#", "", "7%"};
		{ 18, 44003, "", "=q4=Upstanding Spaulders", "=ds=#s3#, #a3#", "", "7%"};
		{ 19, 44004, "", "=q4=Bountiful Gauntlets", "=ds=#s9#, #a3#", "", "6%"};
		{ 20, 44000, "", "=q4=Dragonstorm Breastplate", "=ds=#s5#, #a4#", "", "6%"};
		{ 22, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["Two Drakes Left"]};
		{ 23, 44005, "", "=q4=Pennant Cloak", "=ds=#s4#", "", "3%"};
		{ 24, 44008, "", "=q4=Unsullied Cuffs", "=ds=#s8#, #a1#", "", "3%"};
		{ 25, 44007, "", "=q4=Headpiece of Reconciliation", "=ds=#s1#, #a2#", "", "3%"};
		{ 26, 44011, "", "=q4=Leggings of the Honored", "=ds=#s11#, #a2#", "", "3%"};
		{ 27, 44006, "", "=q4=Obsidian Greathelm", "=ds=#s1#, #a4#", "", "3%"};
		{ 29, 0, "INV_Box_01", "=q6="..AL["Bonus Loot"], "=q5="..AL["Three Drakes Left"]};
		{ 30, 43954, "", "=q4=Reins of the Twilight Drake", "=ds=#e12#", "", "100%"};
	};

		---------------------------
		--- The Eye of Eternity ---
		---------------------------

	AtlasLoot_Data["Malygos"] = {
		{ 1, 40526, "", "=q4=Gown of the Spell-Weaver", "=ds=#s5#, #a1#", "", "12%"};
		{ 2, 40519, "", "=q4=Footsteps of Malygos", "=ds=#s12#, #a2#", "", "12%"};
		{ 3, 40511, "", "=q4=Focusing Energy Epaulets", "=ds=#s3#, #a4#", "", "13%"};
		{ 4, 40486, "", "=q4=Necklace of the Glittering Chamber", "=ds=#s2#", "", "12%"};
		{ 5, 40474, "", "=q4=Surge Needle Ring", "=ds=#s13#", "", "10%"};
		{ 6, 40491, "", "=q4=Hailstorm", "=ds=#h1#, #w10#", "", "11%"};
		{ 7, 40488, "", "=q4=Ice Spire Scepter", "=ds=#h3#, #w6#", "", "12%"};
		{ 8, 40489, "", "=q4=Greatstaff of the Nexus", "=ds=#w9#", "", "12%"};
		{ 9, 40497, "", "=q4=Black Ice", "=ds=#w7#", "", "10%"};
		{ 10, 40475, "", "=q4=Barricade of Eternity", "=ds=#w8#", "", "11%"};
		{ 11, 43953, "", "=q4=Reins of the Blue Drake", "=ds=#e12#", "", "1%"};
		{ 13, 44569, "", "=q4=Key to the Focusing Iris", "=ds=#m3#", "", "91%"};
		{ 16, 44650, "", "=q1=Heart of Magic", "=ds=#m3#", "", "100%"};
		{ 17, 44658, "", "=q4=Chain of the Ancient Wyrm", "=q1=#m4#: =ds=#s2#"};
		{ 18, 44660, "", "=q4=Drakescale Collar", "=q1=#m4#: =ds=#s2#"};
		{ 19, 44659, "", "=q4=Pendant of the Dragonsworn", "=q1=#m4#: =ds=#s2#"};
		{ 20, 44657, "", "=q4=Torque of the Red Dragonflight", "=q1=#m4#: =ds=#s2#"};
	};

	AtlasLoot_Data["Malygos25Man"] = {
		{ 1, 40562, "", "=q4=Hood of Rationality", "=ds=#s1#, #a1#", "", "9%"};
		{ 2, 40555, "", "=q4=Mantle of Dissemination", "=ds=#s3#, #a1#", "", "9%"};
		{ 3, 40194, "", "=q4=Blanketing Robes of Snow", "=ds=#s5#, #a1#", "", "9%"};
		{ 4, 40561, "", "=q4=Leash of Heedless Magic", "=ds=#s10#, #a1#", "", "9%"};
		{ 5, 40560, "", "=q4=Leggings of the Wanton Spellcaster", "=ds=#s11#, #a1#", "", "10%"};
		{ 6, 40558, "", "=q4=Arcanic Tramplers", "=ds=#s12#, #a1#", "", "7%"};
		{ 7, 40594, "", "=q4=Spaulders of Catatonia", "=ds=#s3#, #a2#", "", "10%"};
		{ 8, 40539, "", "=q4=Chestguard of the Recluse", "=ds=#s5#, #a2#", "", "8%"};
		{ 9, 40541, "", "=q4=Frosted Adroit Handguards", "=ds=#s9#, #a2#", "", "9%"};
		{ 10, 40566, "", "=q4=Unravelling Strands of Sanity", "=ds=#s10#, #a2#", "", "11%"};
		{ 11, 40543, "", "=q4=Blue Aspect Helm", "=ds=#s1#, #a3#", "", "9%"};
		{ 12, 40588, "", "=q4=Tunic of the Artifact Guardian", "=ds=#s5#, #a3#", "", "9%"};
		{ 13, 40564, "", "=q4=Winter Spectacle Gloves", "=ds=#s9#, #a3#", "", "9%"};
		{ 14, 40549, "", "=q4=Boots of the Renewed Flight", "=ds=#s12#, #a3#", "", "8%"};
		{ 15, 40590, "", "=q4=Elevated Lair Pauldrons", "=ds=#s3#, #a4#", "", "9%"};
		{ 16, 40589, "", "=q4=Legplates of Sovereignty", "=ds=#s11#, #a4#", "", "9%"};
		{ 17, 40592, "", "=q4=Boots of Healing Energies", "=ds=#s12#, #a4#", "", "10%"};
		{ 18, 40591, "", "=q4=Melancholy Sabatons", "=ds=#s12#, #a4#", "", "9%"};
		{ 19, 40532, "", "=q4=Living Ice Crystals", "=ds=#s14#", "", "9%"};
		{ 20, 40531, "", "=q4=Mark of Norgannon", "=ds=#s14#", "", "8%"};
		{ 21, 43952, "", "=q4=Reins of the Azure Drake", "=ds=#e12#", "", "1%"};
		{ 23, 44577, "", "=q4=Heroic Key to the Focusing Iris", "=ds=#m3#", "", "92%"};
		{ 25, 44650, "", "=q1=Heart of Magic", "=ds=#m3#", "", "100%"};
		{ 26, 44664, "", "=q4=Favor of the Dragon Queen", "=q1=#m4#: =ds=#s2#"};
		{ 27, 44662, "", "=q4=Life-Binder's Locket", "=q1=#m4#: =ds=#s2#"};
		{ 28, 44665, "", "=q4=Nexus War Champion Beads", "=q1=#m4#: =ds=#s2#"};
		{ 29, 44661, "", "=q4=Wyrmrest Necklace of Power", "=q1=#m4#: =ds=#s2#"};
	};

		--------------
		--- Ulduar ---
		--------------

	AtlasLoot_Data["UlduarLeviathan"] = {
		{ 1, 45289, "", "=q4=Lifespark Visage", "=ds=#s1#, #a1#", "", "22%"};
		{ 2, 45291, "", "=q4=Combustion Bracers", "=ds=#s8#, #a1#", "", "17%"};
		{ 3, 45288, "", "=q4=Firestrider Chestguard", "=ds=#s5#, #a3#", "", "22%"};
		{ 4, 45283, "", "=q4=Flamewatch Armguards", "=ds=#s8#, #a4#", "", "19%"};
		{ 5, 45285, "", "=q4=Might of the Leviathan", "=ds=#s2#", "", "18%"};
		{ 6, 45292, "", "=q4=Energy Siphon", "=ds=#s14#", "", "18%"};
		{ 7, 45286, "", "=q4=Pyrite Infuser", "=ds=#s14#", "", "17%"};
		{ 8, 45284, "", "=q4=Kinetic Ripper", "=ds=#h4#, #w13#", "", "19%"};
		{ 9, 45287, "", "=q4=Firesoul", "=ds=#h3#, #w10#", "", "17%"};
		{ 10, 45282, "", "=q4=Ironsoul", "=ds=#h2#, #w6#", "", "19%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45293, "", "=q4=Handguards of Potent Cures", "=ds=#s9#, #a2#", "", "0.18%"};
		{ 18, 45300, "", "=q4=Mantle of Fiery Vengeance", "=ds=#s3#, #a3#"};
		{ 19, 45295, "", "=q4=Gilded Steel Legplates", "=ds=#s11#, #a4#", "", "0.25%"};
		{ 20, 45297, "", "=q4=Shimmering Seal", "=ds=#s13#", "", "0.11%"};
		{ 21, 45296, "", "=q4=Twirling Blades", "=ds=#w11#", "", "0.36%"};
		Next = "UlduarRazorscale";
	};

	AtlasLoot_Data["UlduarLeviathan25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45117, "", "=q4=Constructor's Handwraps", "=ds=#s9#, #a1#", "", "19%"};
		{ 5, 45119, "", "=q4=Embrace of the Leviathan", "=ds=#s10#, #a1#", "", "20%"};
		{ 6, 45108, "", "=q4=Mechanist's Bindings", "=ds=#s8#, #a2#", "", "19%"};
		{ 7, 45118, "", "=q4=Steamworker's Goggles", "=ds=#s1#, #a3#", "", "20%"};
		{ 8, 45109, "", "=q4=Gloves of the Fiery Behemoth", "=ds=#s9#, #a3#", "", "18%"};
		{ 9, 45107, "", "=q4=Iron Riveted War Helm", "=ds=#s1#, #a4#", "", "17%"};
		{ 10, 45111, "", "=q4=Mimiron's Inferno Couplings", "=ds=#s8#, #a4#", "", "18%"};
		{ 11, 45116, "", "=q4=Freya's Choker of Warding", "=ds=#s2#", "", "19%"};
		{ 12, 45113, "", "=q4=Glowing Ring of Reclamation", "=ds=#s13#", "", "19%"};
		{ 13, 45106, "", "=q4=Strength of the Automaton", "=ds=#s13#", "", "16%"};
		{ 14, 45112, "", "=q4=The Leviathan's Coil", "=ds=#s13#", "", "19%"};
		{ 15, 45115, "", "=q4=Overcharged Fuel Rod", "=ds=#s15#", "", "18%"};
		{ 16, 45114, "", "=q4=Steamcaller's Totem", "=ds=#s16#, #w15#", "", "18%"};
		{ 17, 45110, "", "=q4=Titanguard", "=ds=#h1#, #w10#", "", "18%"};
		{ 18, 45086, "", "=q4=Rising Sun", "=ds=#w11#", "", "18%"};
		{ 20, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 21, 45135, "", "=q4=Boots of Fiery Resolution", "=ds=#s12#, #a1#", "", "0.27%"};
		{ 22, 45136, "", "=q4=Shoulderpads of Dormant Energies", "=ds=#s3#, #a2#"};
		{ 23, 45134, "", "=q4=Plated Leggings of Ruination", "=ds=#s11#, #a4#"};
		{ 24, 45133, "", "=q4=Pendant of Fiery Havoc", "=ds=#s2#"};
		{ 25, 45132, "", "=q4=Golden Saronite Dragon", "=ds=#h3#, #w13#", "", "0.11%"};
		Next = "UlduarRazorscale25Man";
	};

	AtlasLoot_Data["UlduarRazorscale"] = {
		{ 1, 45306, "", "=q4=Binding of the Dragon Matriarch", "=ds=#s10#, #a1#", "", "20%"};
		{ 2, 45302, "", "=q4=Treads of the Invader", "=ds=#s12#, #a2#", "", "19%"};
		{ 3, 45301, "", "=q4=Bracers of the Smothering Inferno", "=ds=#s8#, #a3#", "", "20%"};
		{ 4, 45307, "", "=q4=Ironscale Leggings", "=ds=#s11#, #a3#", "", "20%"};
		{ 5, 45299, "", "=q4=Dragonsteel Faceplate", "=ds=#s1#, #a4#", "", "19%"};
		{ 6, 45305, "", "=q4=Breastplate of the Afterlife", "=ds=#s5#, #a4#", "", "19%"};
		{ 7, 45304, "", "=q4=Stormtempered Girdle", "=ds=#s10#, #a4#", "", "19%"};
		{ 8, 45303, "", "=q4=Band of Draconic Guile", "=ds=#s13#", "", "20%"};
		{ 9, 45308, "", "=q4=Eye of the Broodmother", "=ds=#s14#", "", "21%"};
		{ 10, 45298, "", "=q4=Razorscale Talon", "=ds=#h1#, #w10#", "", "20%"};
		Prev = "UlduarLeviathan";
		Next = "UlduarIgnis";
	};

	AtlasLoot_Data["UlduarRazorscale25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45138, "", "=q4=Drape of the Drakerider", "=ds=#s4#", "", "20%"};
		{ 5, 45150, "", "=q4=Collar of the Wyrmhunter", "=ds=#s1#, #a1#", "", "20%"};
		{ 6, 45146, "", "=q4=Shackles of the Odalisque", "=ds=#s8#, #a1#", "", "20%"};
		{ 7, 45149, "", "=q4=Bracers of the Broodmother", "=ds=#s8#, #a2#", "", "21%"};
		{ 8, 45141, "", "=q4=Proto-hide Leggings", "=ds=#s11#, #a2#", "", "19%"};
		{ 9, 45151, "", "=q4=Belt of the Fallen Wyrm", "=ds=#s10#, #a3#", "", "19%"};
		{ 10, 45143, "", "=q4=Saronite Mesh Legguards", "=ds=#s11#, #a3#", "", "20%"};
		{ 11, 45140, "", "=q4=Razorscale Shoulderguards", "=ds=#s3#, #a4#", "", "19%"};
		{ 12, 45139, "", "=q4=Dragonslayer's Brace", "=ds=#s10#, #a4#", "", "19%"};
		{ 13, 45148, "", "=q4=Living Flame", "=ds=#s14#", "", "19%"};
		{ 14, 45510, "", "=q4=Libram of Discord", "=ds=#s16#, #w16#", "", "19%"};
		{ 15, 45144, "", "=q4=Sigil of Deflection", "=ds=#s16#, #w21#", "", "19%"};
		{ 16, 45142, "", "=q4=Remorse", "=ds=#h1#, #w10#", "", "19%"};
		{ 17, 45147, "", "=q4=Guiding Star", "=ds=#h3#, #w6#", "", "19%"};
		{ 18, 45137, "", "=q4=Veranus' Bane", "=ds=#w5#", "", "18%"};
		Prev = "UlduarLeviathan25Man";
		Next = "UlduarIgnis25Man";
	};

	AtlasLoot_Data["UlduarIgnis"] = {
		{ 1, 45317, "", "=q4=Shawl of the Caretaker", "=ds=#s4#", "", "20%"};
		{ 2, 45318, "", "=q4=Drape of Fuming Anger", "=ds=#s4#", "", "19%"};
		{ 3, 45312, "", "=q4=Gloves of Smoldering Touch", "=ds=#s9#, #a2#", "", "20%"};
		{ 4, 45316, "", "=q4=Armbraces of the Vibrant Flame", "=ds=#s8#, #a3#", "", "19%"};
		{ 5, 45321, "", "=q4=Pauldrons of Tempered Will", "=ds=#s3#, #a4#", "", "21%"};
		{ 6, 45310, "", "=q4=Gauntlets of the Iron Furnace", "=ds=#s9#, #a4#", "", "20%"};
		{ 7, 45313, "", "=q4=Furnace Stone", "=ds=#s14#", "", "19%"};
		{ 8, 45314, "", "=q4=Igniter Rod", "=ds=#s15#", "", "19%"};
		{ 9, 45311, "", "=q4=Relentless Edge", "=ds=#w7#", "", "20%"};
		{ 10, 45309, "", "=q4=Rifle of the Platinum Guard", "=ds=#w5#", "", "19%"};
		Prev = "UlduarRazorscale";
		Next = "UlduarDeconstructor";
	};

	AtlasLoot_Data["UlduarIgnis25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45186, "", "=q4=Soot-Covered Mantle", "=ds=#s3#, #a1#", "", "18%"};
		{ 5, 45185, "", "=q4=Flamewrought Cinch", "=ds=#s10#, #a2#", "", "20%"};
		{ 6, 45162, "", "=q4=Flamestalker Boots", "=ds=#s12#, #a2#", "", "18%"};
		{ 7, 45164, "", "=q4=Helm of the Furnace Master", "=ds=#s1#, #a3#", "", "19%"};
		{ 8, 45187, "", "=q4=Wristguards of the Firetender", "=ds=#s8#, #a3#", "", "19%"};
		{ 9, 45167, "", "=q4=Lifeforge Breastplate", "=ds=#s5#, #a4#", "", "19%"};
		{ 10, 45161, "", "=q4=Girdle of Embers", "=ds=#s10#, #a4#", "", "19%"};
		{ 11, 45166, "", "=q4=Charred Saronite Greaves", "=ds=#s12#, #a4#", "", "20%"};
		{ 12, 45157, "", "=q4=Cindershard Ring", "=ds=#s13#", "", "20%"};
		{ 13, 45168, "", "=q4=Pyrelight Circle", "=ds=#s13#", "", "20%"};
		{ 14, 45158, "", "=q4=Heart of Iron", "=ds=#s14#", "", "19%"};
		{ 15, 45169, "", "=q4=Totem of the Dancing Flame", "=ds=#s16#, #w15#", "", "21%"};
		{ 16, 45165, "", "=q4=Worldcarver", "=ds=#h2#, #w1#", "", "19%"};
		{ 17, 45171, "", "=q4=Intensity", "=ds=#w9#", "", "20%"};
		{ 18, 45170, "", "=q4=Scepter of Creation", "=ds=#w12#", "", "21%"};
		Prev = "UlduarRazorscale25Man";
		Next = "UlduarDeconstructor25Man";
	};

	AtlasLoot_Data["UlduarDeconstructor"] = {
		{ 1, 45694, "", "=q4=Conductive Cord", "=ds=#s10#, #a1#", "", "21%"};
		{ 2, 45677, "", "=q4=Treacherous Shoulderpads", "=ds=#s3#, #a2#", "", "19%"};
		{ 3, 45686, "", "=q4=Vest of the Glowing Crescent", "=ds=#s5#, #a2#", "", "21%"};
		{ 4, 45687, "", "=q4=Helm of Veiled Energies", "=ds=#s1#, #a3#", "", "21%"};
		{ 5, 45679, "", "=q4=Gloves of Taut Grip", "=ds=#s9#, #a3#", "", "19%"};
		{ 6, 45676, "", "=q4=Chestplate of Vicious Potency", "=ds=#s5#, #a4#", "", "19%"};
		{ 7, 45680, "", "=q4=Armbands of the Construct", "=ds=#s8#, #a4#", "", "18%"};
		{ 8, 45675, "", "=q4=Power Enhancing Loop", "=ds=#s13#", "", "20%"};
		{ 9, 45685, "", "=q4=Plasma Foil", "=ds=#h3#, #w4#", "", "22%"};
		{ 10, 45682, "", "=q4=Pulsing Spellshield", "=ds=#w8#", "", "14%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45869, "", "=q4=Fluxing Energy Coils", "=ds=#s8#, #a2#", "", "3%"};
		{ 18, 45867, "", "=q4=Breastplate of the Stoneshaper", "=ds=#s5#, #a3#", "", "2%"};
		{ 19, 45871, "", "=q4=Seal of Ulduar", "=ds=#s13#", "", "2%"};
		{ 20, 45868, "", "=q4=Aesir's Edge", "=ds=#h2#, #w10#", "", "2%"};
		{ 21, 45870, "", "=q4=Magnetized Projectile Emitter", "=ds=#w5#", "", "3%"};
		Prev = "UlduarIgnis";
		Next = "UlduarIronCouncil";
	};

	AtlasLoot_Data["UlduarDeconstructor25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45253, "", "=q4=Mantle of Wavering Calm", "=ds=#s3#, #a1#", "", "19%"};
		{ 5, 45258, "", "=q4=Sandals of Rash Temperament", "=ds=#s12#, #a1#", "", "19%"};
		{ 6, 45260, "", "=q4=Boots of Hasty Revival", "=ds=#s12#, #a2#", "", "21%"};
		{ 7, 45259, "", "=q4=Quartz-studded Harness", "=ds=#s5#, #a3#", "", "18%"};
		{ 8, 45249, "", "=q4=Brass-lined Boots", "=ds=#s12#, #a3#", "", "18%"};
		{ 9, 45251, "", "=q4=Shoulderplates of the Deconstructor", "=ds=#s3#, #a4#", "", "18%"};
		{ 10, 45252, "", "=q4=Horologist's Wristguards", "=ds=#s8#, #a4#", "", "19%"};
		{ 11, 45248, "", "=q4=Clockwork Legplates", "=ds=#s11#, #a4#", "", "19%"};
		{ 12, 45250, "", "=q4=Crazed Construct Ring", "=ds=#s13#", "", "18%"};
		{ 13, 45247, "", "=q4=Signet of the Earthshaker", "=ds=#s13#", "", "20%"};
		{ 14, 45254, "", "=q4=Sigil of the Vengeful Heart", "=ds=#s16#, #w21#", "", "20%"};
		{ 15, 45255, "", "=q4=Thunderfall Totem", "=ds=#s16#, #w15#", "", "20%"};
		{ 16, 45246, "", "=q4=Golem-Shard Sticker", "=ds=#h1#, #w4#", "", "19%"};
		{ 17, 45256, "", "=q4=Twisted Visage", "=ds=#w9#", "", "19%"};
		{ 18, 45257, "", "=q4=Quartz Crystal Wand", "=ds=#w12#", "", "20%"};
		{ 20, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 21, 45446, "", "=q4=Grasps of Reason", "=ds=#s8#, #a1#", "", "0.16%"};
		{ 22, 45444, "", "=q4=Gloves of the Steady Hand", "=ds=#s9#, #a3#", "", "0.29%"};
		{ 23, 45445, "", "=q4=Breastplate of the Devoted", "=ds=#s5#, #a4#", "", "0.16%"};
		{ 24, 45443, "", "=q4=Charm of Meticulous Timing", "=ds=#s2#", "", "0.15%"};
		{ 25, 45442, "", "=q4=Sorthalis, Hammer of the Watchers", "=ds=#h1#, #w6#", "", "0.28%"};
		Prev = "UlduarIgnis25Man";
		Next = "UlduarIronCouncil25Man";
	};

	AtlasLoot_Data["UlduarIronCouncil"] = {
		{ 1, 45322, "", "=q4=Cloak of the Iron Council", "=ds=#s4#", "", "18%"};
		{ 2, 45423, "", "=q4=Runetouch Handwraps", "=ds=#s8#, #a1#", "", "24%"};
		{ 3, 45324, "", "=q4=Leggings of Swift Reflexes", "=ds=#s11#, #a2#", "", "19%"};
		{ 4, 45378, "", "=q4=Boots of the Petrified Forest", "=ds=#s12#, #a2#", "", "17%"};
		{ 5, 45329, "", "=q4=Circlet of True Sight", "=ds=#s1#, #a3#", "", "19%"};
		{ 6, 45333, "", "=q4=Belt of the Iron Servant", "=ds=#s10#, #a3#", "", "22%"};
		{ 7, 45321, "", "=q4=Pauldrons of Tempered Will", "=ds=#s3#, #a4#", "", "21%"};
		{ 8, 45418, "", "=q4=Lady Maye's Sapphire Ring", "=ds=#s13#", "", "21%"};
		{ 9, 45332, "", "=q4=Stormtip", "=ds=#h3#, #w4#", "", "23%"};
		{ 10, 45331, "", "=q4=Rune-Etched Nightblade", "=ds=#h1#, #w10#", "", "19%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45455, "", "=q4=Belt of the Crystal Tree", "=ds=#s10#, #a2#", "", "19%"};
		{ 18, 45330, "", "=q4=Greaves of Iron Intensity", "=ds=#s12#, #a4#", "", "23%"};
		{ 19, 45447, "", "=q4=Watchful Eye", "=ds=#s2#", "", "18%"};
		{ 20, 45456, "", "=q4=Loop of the Agile", "=ds=#s13#", "", "16%"};
		{ 21, 45449, "", "=q4=The Masticator", "=ds=#h3#, #w13#", "", "18%"};
		{ 22, 45448, "", "=q4=Perilous Bite", "=ds=#h1#, #w4#", "", "17%"};
		{ 23, 45506, "", "=q4=Archivum Data Disc", "=ds=#m2#", "", "91%"};
		Prev = "UlduarDeconstructor";
		Next = "UlduarKologarn";
	};

	AtlasLoot_Data["UlduarIronCouncil25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45224, "", "=q4=Drape of the Lithe", "=ds=#s4#", "", "19%"};
		{ 5, 45240, "", "=q4=Raiments of the Iron Council", "=ds=#s5#, #a1#", "", "24%"};
		{ 6, 45238, "", "=q4=Overload Legwraps", "=ds=#s11#, #a1#", "", "20%"};
		{ 7, 45237, "", "=q4=Phaelia's Vestments of the Sprouting Seed", "=ds=#s5#, #a2#", "", "23%"};
		{ 8, 45232, "", "=q4=Runed Ironhide Boots", "=ds=#s12#, #a2#", "", "22%"};
		{ 9, 45227, "", "=q4=Iron-studded Mantle", "=ds=#s3#, #a3#", "", "22%"};
		{ 10, 45239, "", "=q4=Runeshaper's Gloves", "=ds=#s9#, #a3#", "", "20%"};
		{ 11, 45226, "", "=q4=Ancient Iron Heaume", "=ds=#s1#, #a4#", "", "20%"};
		{ 12, 45225, "", "=q4=Steelbreaker's Embrace", "=ds=#s5#, #a4#", "", "19%"};
		{ 13, 45228, "", "=q4=Handguards of the Enclave", "=ds=#s9#, #a4#", "", "21%"};
		{ 14, 45193, "", "=q4=Insurmountable Fervor", "=ds=#s2#", "", "19%"};
		{ 15, 45236, "", "=q4=Unblinking Eye", "=ds=#s2#", "", "19%"};
		{ 16, 45235, "", "=q4=Radiant Seal", "=ds=#s13#", "", "20%"};
		{ 17, 45233, "", "=q4=Rune Edge", "=ds=#h2#, #w10#", "", "20%"};
		{ 18, 45234, "", "=q4=Rapture", "=ds=#w9#", "", "19%"};
		{ 20, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 21, 45242, "", "=q4=Drape of Mortal Downfall", "=ds=#s4#", "", "21%"};
		{ 22, 45245, "", "=q4=Shoulderpads of the Intruder", "=ds=#s3#, #a2#", "", "14%"};
		{ 23, 45244, "", "=q4=Greaves of Swift Vengeance", "=ds=#s12#, #a3#", "", "9%"};
		{ 24, 45241, "", "=q4=Belt of Colossal Rage", "=ds=#s10#, #a4#", "", "15%"};
		{ 25, 45243, "", "=q4=Sapphire Amulet of Renewal", "=ds=#s2#", "", "10%"};
		{ 26, 45607, "", "=q4=Fang of Oblivion", "=ds=#h1#, #w4#", "", "18%"};
		{ 27, 45857, "", "=q4=Archivum Data Disc", "=ds=#m2#", "", "94%"};
		Prev = "UlduarDeconstructor25Man";
		Next = "UlduarKologarn25Man";
	};

	AtlasLoot_Data["UlduarKologarn"] = {
		{ 1, 45704, "", "=q4=Shawl of the Shattered Giant", "=ds=#s4#", "", "19%"};
		{ 2, 45701, "", "=q4=Greaves of the Earthbinder", "=ds=#s12#, #a3#", "", "21%"};
		{ 3, 45697, "", "=q4=Shoulderguards of the Solemn Watch", "=ds=#s3#, #a4#", "", "18%"};
		{ 4, 45698, "", "=q4=Sabatons of the Iron Watcher", "=ds=#s12#, #a4#", "", "18%"};
		{ 5, 45696, "", "=q4=Mark of the Unyielding", "=ds=#s2#", "", "19%"};
		{ 6, 45699, "", "=q4=Pendant of the Piercing Glare", "=ds=#s2#", "", "17%"};
		{ 7, 45702, "", "=q4=Emerald Signet Ring", "=ds=#s13#", "", "18%"};
		{ 8, 45703, "", "=q4=Spark of Hope", "=ds=#s14#", "", "17%"};
		{ 9, 45700, "", "=q4=Stoneguard", "=ds=#h1#, #w10#", "", "19%"};
		{ 10, 45695, "", "=q4=Spire of Withering Dreams", "=ds=#w9#", "", "21%"};
		Prev = "UlduarIronCouncil";
		Next = "UlduarAuriaya";
	};

	AtlasLoot_Data["UlduarKologarn25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45272, "", "=q4=Robes of the Umbral Brute", "=ds=#s5#, #a1#", "", "20%"};
		{ 5, 45275, "", "=q4=Bracers of Unleashed Magic", "=ds=#s8#, #a1#", "", "18%"};
		{ 6, 45273, "", "=q4=Handwraps of Plentiful Recovery", "=ds=#s9#, #a1#", "", "18%"};
		{ 7, 45265, "", "=q4=Shoulderpads of the Monolith", "=ds=#s3#, #a2#", "", "16%"};
		{ 8, 45274, "", "=q4=Leggings of the Stoneweaver", "=ds=#s11#, #a3#", "", "14%"};
		{ 9, 45264, "", "=q4=Decimator's Armguards", "=ds=#s8#, #a4#", "", "16%"};
		{ 10, 45269, "", "=q4=Unfaltering Armguards", "=ds=#s8#, #a4#", "", "16%"};
		{ 11, 45268, "", "=q4=Gloves of the Pythonic Guardian", "=ds=#s9#, #a4#", "", "18%"};
		{ 12, 45267, "", "=q4=Saronite Plated Legguards", "=ds=#s11#, #a4#", "", "18%"};
		{ 13, 45262, "", "=q4=Necklace of Unerring Mettle", "=ds=#s2#", "", "18%"};
		{ 14, 45263, "", "=q4=Wrathstone", "=ds=#s14#", "", "18%"};
		{ 15, 45271, "", "=q4=Ironmender", "=ds=#s15#", "", "17%"};
		{ 16, 45270, "", "=q4=Idol of the Crying Wind", "=ds=#s16#, #w14#", "", "17%"};
		{ 17, 45266, "", "=q4=Malice", "=ds=#h1#, #w10#", "", "18%"};
		{ 18, 45261, "", "=q4=Giant's Bane", "=ds=#w5#", "", "16%"};
		Prev = "UlduarIronCouncil25Man";
		Next = "UlduarAuriaya25Man";
	};

	AtlasLoot_Data["UlduarAlgalon"] = {
		{ 1, 46042, "", "=q4=Drape of the Messenger", "=ds=#s4#"};
		{ 2, 46045, "", "=q4=Pulsar Gloves", "=ds=#s9#, #a1#", "", "40%"};
		{ 3, 46050, "", "=q4=Starlight Treads", "=ds=#s12#, #a1#"};
		{ 4, 46043, "", "=q4=Gloves of the Endless Dark", "=ds=#s9#, #a2#"};
		{ 5, 46049, "", "=q4=Zodiac Leggings", "=ds=#s11#, #a2#"};
		{ 6, 46044, "", "=q4=Observer's Mantle", "=ds=#s3#, #a3#"};
		{ 7, 46037, "", "=q4=Shoulderplates of the Celestial Watch", "=ds=#s3#, #a4#"};
		{ 8, 46039, "", "=q4=Breastplate of the Timeless", "=ds=#s5#, #a4#"};
		{ 9, 46041, "", "=q4=Starfall Girdle", "=ds=#s10#, #a4#"};
		{ 10, 46047, "", "=q4=Pendant of the Somber Witness", "=ds=#s2#"};
		{ 11, 46040, "", "=q4=Strength of the Heavens", "=ds=#s2#", "", "40%"};
		{ 12, 46048, "", "=q4=Band of Lights", "=ds=#s13#"};
		{ 13, 46038, "", "=q4=Dark Matter", "=ds=#s13#"};
		{ 14, 46046, "", "=q4=Nebula Band", "=ds=#s13#"};
		{ 15, 46051, "", "=q4=Meteorite Crystal", "=ds=#s14#", "", "40%"};
		{ 16, 46052, "", "=q4=Reply-Code Alpha", "=ds=#m2#", "", "60%"};
		{ 17, 46320, "", "=q4=Drape of the Skyherald", "=q1=#m4#: =ds=#s4#"};
		{ 18, 46321, "", "=q4=Sunglimmer Drape", "=q1=#m4#: =ds=#s4#"};
		{ 19, 46322, "", "=q4=Brann's Sealing Ring", "=q1=#m4#: =ds=#s13#"};
		{ 20, 46323, "", "=q4=Starshine Signet", "=q1=#m4#: =ds=#s13#"};
		Prev = "UlduarIronCouncil";
		Next = "UlduarAuriaya";
	};

	AtlasLoot_Data["UlduarAlgalon25Man"] = {
		{ 1, 45665, "", "=q4=Pharos Gloves", "=ds=#s9#, #a1#", "", "40%"};
		{ 2, 45611, "", "=q4=Solar Bindings", "=ds=#s8#, #a2#", "", "40%"};
		{ 3, 45610, "", "=q4=Boundless Gaze", "=ds=#s1#, #a3#"};
		{ 4, 45594, "", "=q4=Legplates of the Endless Void", "=ds=#s11#, #a4#", "", "20%"};
		{ 5, 45599, "", "=q4=Sabatons of Lifeless Night", "=ds=#s12#, #a4#"};
		{ 6, 45617, "", "=q4=Cosmos", "=ds=#s15#"};
		{ 7, 45494, "", "=q4=Starshard Edge", "=ds=#h3#, #w4#"};
		{ 8, 45607, "", "=q4=Fang of Oblivion", "=ds=#h1#, #w4#", "", "18%"};
		{ 9, 45612, "", "=q4=Constellus", "=ds=#h3#, #w6#", "", "11%"};
		{ 10, 45613, "", "=q4=Dreambinder", "=ds=#w9#", "", "1%"};
		{ 11, 45587, "", "=q4=Bulwark of Algalon", "=ds=#w8#"};
		{ 12, 45570, "", "=q4=Skyforge Crossbow", "=ds=#w3#", "", "1%"};
		{ 16, 46053, "", "=q4=Reply-Code Alpha", "=ds=#m2#", "", "40%"};
		{ 17, 45588, "", "=q4=Drape of the Skyborn", "=q1=#m4#: =ds=#s4#"};
		{ 18, 45618, "", "=q4=Sunglimmer Cloak", "=q1=#m4#: =ds=#s4#"};
		{ 19, 45608, "", "=q4=Brann's Signet Ring", "=q1=#m4#: =ds=#s13#"};
		{ 20, 45614, "", "=q4=Starshine Circle", "=q1=#m4#: =ds=#s13#"};
		Prev = "UlduarIronCouncil25Man";
		Next = "UlduarAuriaya25Man";
	};

	AtlasLoot_Data["UlduarAuriaya"] = {
		{ 1, 45832, "", "=q4=Mantle of the Preserver", "=ds=#s3#, #a1#", "", "19%"};
		{ 2, 45865, "", "=q4=Raiments of the Corrupted", "=ds=#s5#, #a1#", "", "20%"};
		{ 3, 45864, "", "=q4=Cover of the Keepers", "=ds=#s1#, #a2#", "", "20%"};
		{ 4, 45709, "", "=q4=Nimble Climber's Belt", "=ds=#s10#, #a2#", "", "19%"};
		{ 5, 45711, "", "=q4=Ironaya's Discarded Mantle", "=ds=#s3#, #a3#", "", "19%"};
		{ 6, 45712, "", "=q4=Chestplate of Titanic Fury", "=ds=#s5#, #a4#", "", "20%"};
		{ 7, 45708, "", "=q4=Archaedas' Lost Legplates", "=ds=#s11#, #a4#", "", "20%"};
		{ 8, 45866, "", "=q4=Elemental Focus Stone", "=ds=#s14#", "", "19%"};
		{ 9, 45707, "", "=q4=Shieldwall of the Breaker", "=ds=#w8#", "", "19%"};
		{ 10, 45713, "", "=q4=Nurturing Touch", "=ds=#w12#", "", "21%"};
		Prev = "UlduarKologarn";
		Next = "UlduarHodir";
	};

	AtlasLoot_Data["UlduarAuriaya25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45319, "", "=q4=Cloak of the Makers", "=ds=#s4#", "", "19%"};
		{ 5, 45435, "", "=q4=Cowl of the Absolute", "=ds=#s1#, #a1#", "", "19%"};
		{ 6, 45441, "", "=q4=Sandals of the Ancient Keeper", "=ds=#s12#, #a1#", "", "20%"};
		{ 7, 45439, "", "=q4=Unwavering Stare", "=ds=#s1#, #a2#", "", "20%"};
		{ 8, 45325, "", "=q4=Gloves of the Stonereaper", "=ds=#s9#, #a2#", "", "20%"};
		{ 9, 45440, "", "=q4=Amice of the Stoic Watch", "=ds=#s3#, #a3#", "", "20%"};
		{ 10, 45320, "", "=q4=Shoulderplates of the Eternal", "=ds=#s3#, #a4#", "", "20%"};
		{ 11, 45334, "", "=q4=Unbreakable Chestguard", "=ds=#s5#, #a4#", "", "18%"};
		{ 12, 45434, "", "=q4=Greaves of the Rockmender", "=ds=#s12#, #a4#", "", "20%"};
		{ 13, 45326, "", "=q4=Platinum Band of the Aesir", "=ds=#s13#", "", "19%"};
		{ 14, 45438, "", "=q4=Ring of the Faithful Servant", "=ds=#s13#", "", "19%"};
		{ 15, 45436, "", "=q4=Libram of the Resolute", "=ds=#s16#, #w16#", "", "20%"};
		{ 16, 45437, "", "=q4=Runescribed Blade", "=ds=#h3#, #w10#", "", "20%"};
		{ 17, 45315, "", "=q4=Stonerender", "=ds=#h1#, #w6#", "", "19%"};
		{ 18, 45327, "", "=q4=Siren's Cry", "=ds=#w2#", "", "20%"};
		Prev = "UlduarKologarn25Man";
		Next = "UlduarHodir25Man";
	};

	AtlasLoot_Data["UlduarHodir"] = {
		{ 1, 45873, "", "=q4=Winter's Frigid Embrace", "=ds=#s4#", "", "15%"};
		{ 2, 45464, "", "=q4=Cowl of Icy Breaths", "=ds=#s1#, #a1#", "", "20%"};
		{ 3, 45874, "", "=q4=Signet of Winter", "=ds=#s13#", "", "16%"};
		{ 4, 45458, "", "=q4=Stormedge", "=ds=#h2#, #w1#", "", "17%"};
		{ 5, 45872, "", "=q4=Avalanche", "=ds=#w2#", "", "22%"};
		{ 7, 45650, "", "=q4=Leggings of the Wayward Conqueror", "=ds=#e15#", "", "29%"};
		{ 8, 45651, "", "=q4=Leggings of the Wayward Protector", "=ds=#e15#", "", "29%"};
		{ 9, 45652, "", "=q4=Leggings of the Wayward Vanquisher", "=ds=#e15#", "", "34%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45888, "", "=q4=Bitter Cold Armguards", "=ds=#s8#, #a4#", "", "18%"};
		{ 18, 45876, "", "=q4=Shiver", "=ds=#h1#, #w6#", "", "16%"};
		{ 19, 45886, "", "=q4=Icecore Staff", "=ds=#w9#", "", "20%"};
		{ 20, 45887, "", "=q4=Ice Layered Barrier", "=ds=#w8#", "", "18%"};
		{ 21, 45877, "", "=q4=The Boreal Guard", "=ds=#w8#", "", "17%"};
		{ 23, 45786, "", "=q1=Hodir's Sigil", "=ds=#m3#", "", "23%"};
		Prev = "UlduarAuriaya";
		Next = "UlduarThorim";
	};

	AtlasLoot_Data["UlduarHodir25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45453, "", "=q4=Winter's Icy Embrace", "=ds=#s5#, #a2#", "", "16%"};
		{ 5, 45454, "", "=q4=Frost-bound Chain Bracers", "=ds=#s8#, #a3#", "", "18%"};
		{ 6, 45452, "", "=q4=Frostplate Greaves", "=ds=#s11#, #a4#", "", "16%"};
		{ 7, 45451, "", "=q4=Frozen Loop", "=ds=#s13#", "", "15%"};
		{ 8, 45450, "", "=q4=Northern Barrier", "=ds=#w8#", "", "19%"};
		{ 10, 45632, "", "=q4=Breastplate of the Wayward Conqueror", "=ds=#e15#", "", "52%"};
		{ 11, 45633, "", "=q4=Breastplate of the Wayward Protector", "=ds=#e15#", "", "50%"};
		{ 12, 45634, "", "=q4=Breastplate of the Wayward Vanquisher", "=ds=#e15#", "", "71%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45461, "", "=q4=Drape of Icy Intent", "=ds=#s4#", "", "19%"};
		{ 18, 45462, "", "=q4=Gloves of the Frozen Glade", "=ds=#s9#, #a2#", "", "10%"};
		{ 19, 45460, "", "=q4=Bindings of Winter Gale", "=ds=#s8#, #a3#", "", "12%"};
		{ 20, 45459, "", "=q4=Frigid Strength of Hodir", "=ds=#s2#", "", "13%"};
		{ 21, 45612, "", "=q4=Constellus", "=ds=#h3#, #w6#", "", "11%"};
		{ 22, 45457, "", "=q4=Staff of Endless Winter", "=ds=#w9#", "", "19%"};
		{ 24, 45815, "", "=q1=Hodir's Sigil", "=ds=#m3#", "", "21%"};
		Prev = "UlduarAuriaya25Man";
		Next = "UlduarThorim25Man";
	};

	AtlasLoot_Data["UlduarThorim"] = {
		{ 1, 45893, "", "=q4=Guise of the Midgard Serpent", "=ds=#s1#, #a2#", "", "19%"};
		{ 2, 45927, "", "=q4=Handwraps of Resonance", "=ds=#s9#, #a1#", "", "17%"};
		{ 3, 45894, "", "=q4=Leggings of Unstable Discharge", "=ds=#s11#, #a1#", "", "17%"};
		{ 4, 45895, "", "=q4=Belt of the Blood Pit", "=ds=#s10#, #a3#", "", "18%"};
		{ 5, 45892, "", "=q4=Legacy of Thunder", "=ds=#h1# #w6#", "", "18%"};
		{ 7, 45659, "", "=q4=Spaulders of the Wayward Conqueror", "=ds=#e15#", "", "25%"};
		{ 8, 45660, "", "=q4=Spaulders of the Wayward Protector", "=ds=#e15#", "", "28%"};
		{ 9, 45661, "", "=q4=Spaulders of the Wayward Vanquisher", "=ds=#e15#", "", "34%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45928, "", "=q4=Gauntlets of the Thunder God", "=ds=#s9#, #a4#", "", "5%"};
		{ 18, 45933, "", "=q4=Pendant of the Shallow Grave", "=ds=#s2#", "", "4%"};
		{ 19, 45931, "", "=q4=Mjolnir Runestone", "=ds=#s14#", "", "5%"};
		{ 20, 45929, "", "=q4=Sif's Remembrance", "=ds=#s14#", "", "4%"};
		{ 21, 45930, "", "=q4=Combatant's Bootblade", "=ds=#h1# #w4#", "", "5%"};
		{ 23, 45784, "", "=q1=Thorim's Sigil", "=ds=#m3#", "", "5%"};
		Prev = "UlduarHodir";
		Next = "UlduarFreya";
	};

	AtlasLoot_Data["UlduarThorim25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45468, "", "=q4=Leggings of Lost Love", "=ds=#s11#, #a1#", "", "17%"};
		{ 5, 45467, "", "=q4=Belt of the Betrayed", "=ds=#s10#, #a3#", "", "17%"};
		{ 6, 45469, "", "=q4=Sif's Promise", "=ds=#s13#", "", "14%"};
		{ 7, 45466, "", "=q4=Scale of Fates", "=ds=#s14#", "", "17%"};
		{ 8, 45463, "", "=q4=Vulmir, the Northern Tempest", "=ds=#h1# #w6#", "", "18%"};
		{ 10, 45638, "", "=q4=Crown of the Wayward Conqueror", "=ds=#e15#", "", "50%"};
		{ 11, 45639, "", "=q4=Crown of the Wayward Protector", "=ds=#e15#", "", "57%"};
		{ 12, 45640, "", "=q4=Crown of the Wayward Vanquisher", "=ds=#e15#", "", "71%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45473, "", "=q4=Embrace of the Gladiator", "=ds=#s5#, #a2#", "", "2%"};
		{ 18, 45474, "", "=q4=Pauldrons of the Combatant", "=ds=#s3#, #a3#", "", "2%"};
		{ 19, 45472, "", "=q4=Warhelm of the Champion", "=ds=#s1#, #a4#", "", "1%"};
		{ 20, 45471, "", "=q4=Fate's Clutch", "=ds=#s13#", "", "1%"};
		{ 21, 45570, "", "=q4=Skyforge Crossbow", "=ds=#w3#", "", "1%"};
		{ 22, 45470, "", "=q4=Wisdom's Hold", "=ds=#w8#", "", "2%"};
		{ 24, 45817, "", "=q1=Thorim's Sigil", "=ds=#m3#", "", "3%"};
		Prev = "UlduarHodir25Man";
		Next = "UlduarFreya25Man";
	};

	AtlasLoot_Data["UlduarFreya"] = {
		{ 1, 45940, "", "=q4=Tunic of the Limber Stalker", "=ds=#s5#, #a2#", "", "15%"};
		{ 2, 45941, "", "=q4=Chestguard of the Lasher", "=ds=#s5#, #a3#", "", "15%"};
		{ 3, 45935, "", "=q4=Ironbark Faceguard", "=ds=#s1#, #a4#", "", "17%"};
		{ 4, 45936, "", "=q4=Legplates of Flourishing Resolve", "=ds=#s11#, #a4#", "", "15%"};
		{ 5, 45934, "", "=q4=Unraveling Reach", "=ds=#w9#", "", "18%"};
		{ 7, 45644, "", "=q4=Gloves of the Wayward Conqueror", "=ds=#e15#", "", "25%"};
		{ 8, 45645, "", "=q4=Gloves of the Wayward Protector", "=ds=#e15#", "", "23%"};
		{ 9, 45646, "", "=q4=Gloves of the Wayward Vanquisher", "=ds=#e15#", "", "30%"};
		{ 11, 46110, "", "=q3=Alchemist's Cache", "=ds=#p1# (425)", "", "66%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45943, "", "=q4=Gloves of Whispering Winds", "=ds=#s9#, #a3#", "", "2%"};
		{ 18, 45945, "", "=q4=Seed of Budding Carnage", "=ds=#s2#", "", "2%"};
		{ 19, 45946, "", "=q4=Fire Orchid Signet", "=ds=#s13#", "", "2%"};
		{ 20, 45947, "", "=q4=Serilas, Blood Blade of Invar One-Arm", "=ds=#h1# #w10#", "", "2%"};
		{ 21, 45294, "", "=q4=Petrified Ivy Sprig", "=ds=#w12#", "", "1%"};
		{ 23, 45788, "", "=q1=Freya's Sigil", "=ds=#m3#", "", "4%"};
		Prev = "UlduarThorim";
		Next = "UlduarMimiron";
	};

	AtlasLoot_Data["UlduarFreya25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45483, "", "=q4=Boots of the Servant", "=ds=#s12#, #a1#", "", "15%"};
		{ 5, 45482, "", "=q4=Leggings of the Lifetender", "=ds=#s11#, #a2#", "", "17%"};
		{ 6, 45481, "", "=q4=Gauntlets of Ruthless Reprisal", "=ds=#s9#, #a4#", "", "16%"};
		{ 7, 45480, "", "=q4=Nymph Heart Charm", "=ds=#s2#", "", "13%"};
		{ 8, 45479, "", "=q4=The Lifebinder", "=ds=#w9#", "", "19%"};
		{ 10, 45653, "", "=q4=Legplates of the Wayward Conqueror", "=ds=#e15#", "", "43%"};
		{ 11, 45654, "", "=q4=Legplates of the Wayward Protector", "=ds=#e15#", "", "52%"};
		{ 12, 45655, "", "=q4=Legplates of the Wayward Vanquisher", "=ds=#e15#", "", "69%"};
		{ 14, 46110, "", "=q3=Alchemist's Cache", "=ds=#p1# (425)", "", "66%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45486, "", "=q4=Drape of the Sullen Goddess", "=ds=#s4#"};
		{ 18, 45488, "", "=q4=Leggings of the Enslaved Idol", "=ds=#s11#, #a1#", "", "0.13%"};
		{ 19, 45487, "", "=q4=Handguards of Revitalization", "=ds=#s9#, #a4#", "", "0.34%"};
		{ 20, 45485, "", "=q4=Bronze Pendant of the Vanir", "=ds=#s2#"};
		{ 21, 45484, "", "=q4=Bladetwister", "=ds=#h1#, #w4#", "", "0.27%"};
		{ 22, 45613, "", "=q4=Dreambinder", "=ds=#w9#", "", "1%"};
		{ 24, 45814, "", "=q1=Freya's Sigil", "=ds=#m3#", "", "0.27%"};
		Prev = "UlduarThorim25Man";
		Next = "UlduarMimiron25Man";
	};

	AtlasLoot_Data["UlduarMimiron"] = {
		{ 1, 45973, "", "=q4=Stylish Power Cape", "=ds=#s4#", "", "19%"};
		{ 2, 45976, "", "=q4=Static Charge Handwraps", "=ds=#s9#, #a1#", "", "20%"};
		{ 3, 45974, "", "=q4=Shoulderguards of Assimilation", "=ds=#s3#, #a2#", "", "75%"};
		{ 4, 45975, "", "=q4=Cable of the Metrognome", "=ds=#s10#, #a4#", "", "11%"};
		{ 5, 45972, "", "=q4=Pulse Baton", "=ds=#h3#, #w6#", "", "0.13%"};
		{ 7, 45647, "", "=q4=Helm of the Wayward Conqueror", "=ds=#e15#", "", "28%"};
		{ 8, 45648, "", "=q4=Helm of the Wayward Protector", "=ds=#e15#", "", "75%"};
		{ 9, 45649, "", "=q4=Helm of the Wayward Vanquisher", "=ds=#e15#", "", "37%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45993, "", "=q4=Mimiron's Flight Goggles", "=ds=#s1#, #a2#", "", "1%"};
		{ 18, 45989, "", "=q4=Tempered Mercury Greaves", "=ds=#s12#, #a3#", "", "0.34%"};
		{ 19, 45982, "", "=q4=Fused Alloy Legplates", "=ds=#s11#, #a4#", "", "0.34%"};
		{ 20, 45988, "", "=q4=Greaves of the Iron Army", "=ds=#s12#, #a4#"};
		{ 21, 45990, "", "=q4=Fusion Blade", "=ds=#h1#, #w10#", "", "0.13%"};
		{ 23, 45787, "", "=q1=Mimiron's Sigil", "=ds=#m3#", "", "2%"};
		Prev = "UlduarFreya";
		Next = "UlduarVezax";
	};

	AtlasLoot_Data["UlduarMimiron25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45493, "", "=q4=Asimov's Drape", "=ds=#s4#", "", "11%"};
		{ 5, 45492, "", "=q4=Malleable Steelweave Mantle", "=ds=#s3#, #a2#", "", "25%"};
		{ 6, 45491, "", "=q4=Waistguard of the Creator", "=ds=#s10#, #a2#", "", "17%"};
		{ 7, 45490, "", "=q4=Pandora's Plea", "=ds=#s14#", "", "17%"};
		{ 8, 45489, "", "=q4=Insanity's Grip", "=ds=#h3#, #w13#", "", "15%"};
		{ 10, 45641, "", "=q4=Gauntlets of the Wayward Conqueror", "=ds=#e15#", "", "45%"};
		{ 11, 45642, "", "=q4=Gauntlets of the Wayward Protector", "=ds=#e15#", "", "50%"};
		{ 12, 45643, "", "=q4=Gauntlets of the Wayward Vanquisher", "=ds=#e15#", "", "68%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 45496, "", "=q4=Titanskin Cloak", "=ds=#s4#", "", "0.33%"};
		{ 18, 45497, "", "=q4=Crown of Luminescence", "=ds=#s1#, #a1#"};
		{ 19, 45663, "", "=q4=Armbands of Bedlam", "=ds=#s8#, #a4#"};
		{ 20, 45495, "", "=q4=Conductive Seal", "=ds=#s13#"};
		{ 21, 45494, "", "=q4=Delirium's Touch", "=ds=#h4#, #w13#"};
		{ 22, 45494, "", "=q4=Starshard Edge", "=ds=#h3#, #w4#"};
		{ 24, 45816, "", "=q1=Mimiron's Sigil", "=ds=#m3#", "", "0.16%"};
		Prev = "UlduarFreya25Man";
		Next = "UlduarVezax25Man";
	};

	AtlasLoot_Data["UlduarVezax"] = {
		{ 1, 46014, "", "=q4=Saronite Animus Cloak", "=ds=#s4#", "", "22%"};
		{ 2, 46013, "", "=q4=Underworld Mantle", "=ds=#s3#, #a1#", "", "20%"};
		{ 3, 46012, "", "=q4=Vestments of the Piercing Light", "=ds=#s5#, #a1#", "", "20%"};
		{ 4, 46009, "", "=q4=Bindings of the Depths", "=ds=#s8#, #a2#", "", "17%"};
		{ 5, 46346, "", "=q4=Boots of Unsettled Prey", "=ds=#s12#, #a3#", "", "6%"};
		{ 6, 45997, "", "=q4=Gauntlets of the Wretched", "=ds=#s9#, #a4#", "", "17%"};
		{ 7, 46008, "", "=q4=Choker of the Abyss", "=ds=#s2#", "", "18%"};
		{ 8, 46015, "", "=q4=Pendant of Endless Despair", "=ds=#s2#", "", "18%"};
		{ 9, 46010, "", "=q4=Darkstone Ring", "=ds=#s13#", "", "21%"};
		{ 10, 46011, "", "=q4=Shadowbite", "=ds=#h1#, #w4#", "", "19%"};
		{ 11, 45996, "", "=q4=Hoperender", "=ds=#w7#", "", "22%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 46032, "", "=q4=Drape of the Faceless General", "=ds=#s4#", "", "2%"};
		{ 18, 46034, "", "=q4=Leggings of Profound Darkness", "=ds=#s11#, #a1#", "", "3%"};
		{ 19, 46036, "", "=q4=Void Sabre", "=ds=#h1#, #w10#", "", "2%"};
		{ 20, 46035, "", "=q4=Aesuga, Hand of the Ardent Champion", "=ds=#h1#, #w6#", "", "3%"};
		{ 21, 46033, "", "=q4=Tortured Earth", "=ds=#w9#", "", "4%"};
		Prev = "UlduarMimiron";
		Next = "UlduarYoggSaron";
	};

	AtlasLoot_Data["UlduarVezax25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45514, "", "=q4=Mantle of the Unknowing", "=ds=#s3#, #a1#", "", "20%"};
		{ 5, 45508, "", "=q4=Belt of the Darkspeaker", "=ds=#s10#, #a1#", "", "21%"};
		{ 6, 45512, "", "=q4=Grips of the Unbroken", "=ds=#s9#, #a2#", "", "19%"};
		{ 7, 45504, "", "=q4=Darkcore Leggings", "=ds=#s11#, #a3#", "", "18%"};
		{ 8, 45513, "", "=q4=Boots of the Forgotten Depths", "=ds=#s12#, #a3#", "", "18%"};
		{ 9, 45502, "", "=q4=Helm of the Faceless", "=ds=#s1#, #a4#", "", "19%"};
		{ 10, 45505, "", "=q4=Belt of Clinging Hope", "=ds=#s10#, #a4#", "", "19%"};
		{ 11, 45501, "", "=q4=Boots of the Underdweller", "=ds=#s12#, #a4#", "", "17%"};
		{ 12, 45503, "", "=q4=Metallic Loop of the Sufferer", "=ds=#s13#", "", "20%"};
		{ 13, 45515, "", "=q4=Ring of the Vacant Eye", "=ds=#s13#", "", "21%"};
		{ 14, 45507, "", "=q4=The General's Heart", "=ds=#s14#", "", "20%"};
		{ 15, 45509, "", "=q4=Idol of the Corruptor", "=ds=#s16#, #w14#", "", "17%"};
		{ 16, 45145, "", "=q4=Libram of the Sacred Shield", "=ds=#s16#, #w16#", "", "19%"};
		{ 17, 45498, "", "=q4=Lotrafen, Spear of the Damned", "=ds=#w7#", "", "20%"};
		{ 18, 45511, "", "=q4=Scepter of Lost Souls", "=ds=#w12#", "", "19%"};
		{ 20, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 21, 45520, "", "=q4=Handwraps of the Vigilant", "=ds=#s9#, #a1#", "", "0.32%"};
		{ 22, 45519, "", "=q4=Vestments of the Blind Denizen", "=ds=#s5#, #a2#", "", "0.32%"};
		{ 23, 45517, "", "=q4=Pendulum of Infinity", "=ds=#s2#", "", "0.36%"};
		{ 24, 45518, "", "=q4=Flare of the Heavens", "=ds=#s14#"};
		{ 25, 45516, "", "=q4=Voldrethar, Dark Blade of Oblivion", "=ds=#h2#, #w10#"};
		Prev = "UlduarMimiron25Man";
		Next = "UlduarYoggSaron25Man";
	};

	AtlasLoot_Data["UlduarYoggSaron"] = {
		{ 1, 46030, "", "=q4=Treads of the Dragon Council", "=ds=#s12#, #a1#", "", "17%"};
		{ 2, 46019, "", "=q4=Leggings of the Insatiable", "=ds=#s11#, #a3#", "", "12%"};
		{ 3, 46028, "", "=q4=Faceguard of the Eyeless Horror", "=ds=#s1#, #a4#", "", "17%"};
		{ 4, 46022, "", "=q4=Pendant of a Thousand Maws", "=ds=#s2#", "", "8%"};
		{ 5, 46021, "", "=q4=Royal Seal of King Llane", "=ds=#s14#", "", "12%"};
		{ 6, 46024, "", "=q4=Kingsbane", "=ds=#h1#, #w4#", "", "10%"};
		{ 7, 46016, "", "=q4=Abaddon", "=ds=#h2#, #w10#", "", "17%"};
		{ 8, 46031, "", "=q4=Touch of Madness", "=ds=#h1#, #w1#", "", "25%"};
		{ 9, 46025, "", "=q4=Devotion", "=ds=#w9#", "", "23%"};
		{ 10, 46018, "", "=q4=Deliverance", "=ds=#w3#", "", "35%"};
		{ 12, 45632, "", "=q4=Breastplate of the Wayward Conqueror", "=ds=#e15#", "", "52%"};
		{ 13, 45633, "", "=q4=Breastplate of the Wayward Protector", "=ds=#e15#", "", "50%"};
		{ 14, 45637, "", "=q4=Chestguard of the Wayward Vanquisher", "=ds=#e15#", "", "27%"};
		{ 16, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 17, 46068, "", "=q4=Amice of Inconceivable Horror", "=ds=#s3#, #a1#"};
		{ 18, 46095, "", "=q4=Soul-Devouring Cinch", "=ds=#s10#, #a2#"};
		{ 19, 46096, "", "=q4=Signet of Soft Lament", "=ds=#s13#"};
		{ 20, 46097, "", "=q4=Caress of Insanity", "=ds=#h1#, #w6#"};
		{ 21, 46067, "", "=q4=Hammer of Crushing Whispers", "=ds=#h2#, #w6#"};
		Prev = "UlduarMimiron";
		Prev = "UlduarVezax";
	};

	AtlasLoot_Data["UlduarYoggSaron25Man"] = {
		{ 1, 45038, "", "=q5=Fragment of Val'anyr", "=ds=#m3#", "", "40%"};
		{ 2, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=q1=#m4#: =ds=#h1#, #w6#"};
		{ 4, 45529, "", "=q4=Shawl of Haunted Memories", "=ds=#s4#", "", "25%"};
		{ 5, 45532, "", "=q4=Cowl of Dark Whispers", "=ds=#s1#, #a1#", "", "17%"};
		{ 6, 45523, "", "=q4=Garona's Guise", "=ds=#s1#, #a2#", "", "18%"};
		{ 7, 45524, "", "=q4=Chestguard of Insidious Intent", "=ds=#s5#, #a3#", "", "13%"};
		{ 8, 45531, "", "=q4=Chestguard of the Fallen God", "=ds=#s5#, #a3#", "", "16%"};
		{ 9, 45525, "", "=q4=Godbane Signet", "=ds=#s13#", "", "11%"};
		{ 10, 45530, "", "=q4=Sanity's Bond", "=ds=#s13#", "", "18%"};
		{ 11, 45522, "", "=q4=Blood of the Old God", "=ds=#s14#", "", "20%"};
		{ 12, 45527, "", "=q4=Soulscribe", "=ds=#h3#, #w4#", "", "9%"};
		{ 13, 45521, "", "=q4=Earthshaper", "=ds=#h2#, #w6#", "", "15%"};
		{ 16, 45656, "", "=q4=Mantle of the Wayward Conqueror", "=ds=#e15#", "", "59%"};
		{ 17, 45657, "", "=q4=Mantle of the Wayward Protector", "=ds=#e15#", "", "54%"};
		{ 18, 45658, "", "=q4=Mantle of the Wayward Vanquisher", "=ds=#e15#", "", "66%"};
		{ 20, 0, "INV_Box_01", "=q6=#j53#", ""};
		{ 21, 45537, "", "=q4=Treads of the False Oracle", "=ds=#s12#, #a1#", "", "1%"};
		{ 22, 45536, "", "=q4=Legguards of Cunning Deception", "=ds=#s11#, #a2#", "", "1%"};
		{ 23, 45534, "", "=q4=Seal of the Betrayed King", "=ds=#s13#"};
		{ 24, 45535, "", "=q4=Show of Faith", "=ds=#s14#"};
		{ 25, 45533, "", "=q4=Dark Edge of Depravity", "=ds=#h2#, #w1#", "", "1%"};
		Prev = "UlduarVezax25Man";
	};

	AtlasLoot_Data["UlduarTrash"] = {
		{ 1, 46341, "", "=q4=Drape of the Spellweaver", "=ds=#s4#", "", "2%"};
		{ 2, 46347, "", "=q4=Cloak of the Dormant Blaze", "=ds=#s4#", "", "2%"};
		{ 3, 46344, "", "=q4=Iceshear Mantle", "=ds=#s3#, #a1#", "", "2%"};
		{ 4, 46346, "", "=q4=Boots of Unsettled Prey", "=ds=#s12#, #a3#", "", "6%"};
		{ 5, 46345, "", "=q4=Bracers of Righteous Reformation", "=ds=#s8#, #a4#", "", "2%"};
		{ 6, 46340, "", "=q4=Adamant Handguards", "=ds=#s9#, #a4#", "", "2%"};
		{ 7, 46343, "", "=q4=Fervor of the Protectorate", "=ds=#s2#", "", "2%"};
		{ 8, 46339, "", "=q4=Mimiron's Repeater", "=ds=#w5#", "", "2%"};
		{ 9, 46351, "", "=q4=Bloodcrush Cudgel", "=ds=#h1# #w6#", "", "2%"};
		{ 10, 46350, "", "=q4=Pillar of Fortitude", "=ds=#w9#", "", "2%"};
		{ 11, 46342, "", "=q4=Golemheart Longbow", "=ds=#w2#", "", "2%"};
	};

	AtlasLoot_Data["UlduarTrash25Man"] = {
		{ 1, 45541, "", "=q4=Shroud of Alteration", "=ds=#s4#", "", "2%"};
		{ 2, 45549, "", "=q4=Grips of Chaos", "=ds=#s8#, #a1#", "", "3%"};
		{ 3, 45547, "", "=q4=Relic Hunter's Cord", "=ds=#s10#, #a2#", "", "3%"};
		{ 4, 45548, "", "=q4=Belt of the Sleeper", "=ds=#s10#, #a2#", "", "2%"};
		{ 5, 45543, "", "=q4=Shoulders of Misfortune", "=ds=#s3#, #a3#", "", "2%"};
		{ 6, 45544, "", "=q4=Leggings of the Tortured Earth", "=ds=#s11#, #a3#", "", "2%"};
		{ 7, 45542, "", "=q4=Greaves of the Stonewarder", "=ds=#s12#, #a4#", "", "2%"};
		{ 8, 45540, "", "=q4=Bladebearer's Signet", "=ds=#s13#", "", "2%"};
		{ 9, 45539, "", "=q4=Pendant of Focused Energies", "=ds=#s2#", "", "6%"};
		{ 10, 45538, "", "=q4=Titanstone Pendant", "=ds=#s2#", "", "3%"};
		{ 11, 46138, "", "=q4=Idol of the Flourishing Life", "=ds=#s16#, #w14#", "", "6%"};
		{ 12, 45605, "", "=q4=Daschal's Bite", "=ds=#h1# #w4#", "", "2%"};
	};

	AtlasLoot_Data["UlduarPatterns"] = {
		{ 1, 46027, "", "=q4=Formula: Enchant Weapon - Blade Ward", "=ds=#p4# (450)"};
		{ 2, 46348, "", "=q4=Formula: Enchant Weapon - Blood Draining", "=ds=#p4# (450)"};
		{ 3, 45104, "", "=q4=Pattern: Cord of the White Dawn", "=ds=#p8# (450)"};
		{ 4, 45102, "", "=q4=Pattern: Sash of Ancient Power", "=ds=#p8# (450)"};
		{ 5, 45105, "", "=q4=Pattern: Savior's Slippers", "=ds=#p8# (450)"};
		{ 6, 45103, "", "=q4=Pattern: Spellslinger's Slippers", "=ds=#p8# (450)"};
		{ 7, 45100, "", "=q4=Pattern: Belt of Arctic Life", "=ds=#p7# (450)"};
		{ 8, 45094, "", "=q4=Pattern: Belt of Dragons", "=ds=#p7# (450)"};
		{ 9, 45096, "", "=q4=Pattern: Blue Belt of Chaos", "=ds=#p7# (450)"};
		{ 10, 45095, "", "=q4=Pattern: Boots of Living Scale", "=ds=#p7# (450)"};
		{ 11, 45101, "", "=q4=Pattern: Boots of Wintry Endurance", "=ds=#p7# (450)"};
		{ 12, 45098, "", "=q4=Pattern: Death-warmed Belt", "=ds=#p7# (450)"};
		{ 13, 45099, "", "=q4=Pattern: Footpads of Silence", "=ds=#p7# (450)"};
		{ 14, 45097, "", "=q4=Pattern: Lightning Grounded Boots", "=ds=#p7# (450)"};
		{ 15, 45089, "", "=q4=Plans: Battlelord's Plate Boots", "=ds=#p2# (450)"};
		{ 16, 45088, "", "=q4=Plans: Belt of the Titans", "=ds=#p2# (450)"};
		{ 17, 45092, "", "=q4=Plans: Indestructible Plate Girdle", "=ds=#p2# (450)"};
		{ 18, 45090, "", "=q4=Plans: Plate Girdle of Righteousness", "=ds=#p2# (450)"};
		{ 19, 45093, "", "=q4=Plans: Spiked Deathdealers", "=ds=#p2# (450)"};
	};

	----------------
	--- Factions ---
	----------------

		-------------------------
		--- Alliance Vanguard ---
		-------------------------

	AtlasLoot_Data["AllianceVanguard1"] = {
		{ 2, 0, "INV_Shield_36", "=q6=#r4#", ""};
		{ 3, 38459, "", "=q3=Orb of the Eastern Kingdoms", "=ds=#s15#"};
		{ 4, 38465, "", "=q3=Vanguard Soldier's Dagger", "=ds=#h1#, #w4#"};
		{ 5, 38455, "", "=q3=Hammer of the Alliance Vanguard", "=ds=#h1#, #w6#"};
		{ 6, 38463, "", "=q3=Lordaeron's Resolve", "=ds=#w8#"};
		{ 7, 38453, "", "=q3=Shield of the Lion-hearted", "=ds=#w8#"};
		{ 8, 38457, "", "=q3=Sawed-off Hand Cannon", "=ds=#w5#"};
		{ 9, 38464, "", "=q3=Gnomish Magician's Quill", "=ds=#w12#"};
		{ 17, 0, "INV_Shield_36", "=q6=#r5#", ""};
		{ 18, 44503, "", "=q4=Schematic: Mekgineer's Chopper", "=ds=#p5# (450)"};
		{ 19, 44937, "", "=q3=Plans: Titanium Plating", "=ds=#p2# (450)"};
		{ 20, 44701, "", "=q3=Arcanum of the Savage Gladiator", "=ds=#s1# #e17#"};
		Back = "REPMENU_WOTLK";
	};

		----------------------
		--- Argent Crusade ---
		----------------------

	AtlasLoot_Data["ArgentCrusade"] = {
		{ 1, 0, "INV_Jewelry_Talisman_08", "=q6=#r2#", ""};
		{ 2, 43154, "", "=q1=Tabard of the Argent Crusade", "=ds=#s7#"};
		{ 4, 0, "INV_Jewelry_Talisman_08", "=q6=#r4#", ""};
		{ 5, 44248, "", "=q3=Battle Mender's Helm", "=ds=#s1#, #a3#"};
		{ 6, 44247, "", "=q3=Fang-Deflecting Faceguard", "=ds=#s1#, #a4#"};
		{ 7, 44244, "", "=q3=Argent Skeleton Crusher", "=ds=#h2#, #w6#"};
		{ 8, 44245, "", "=q3=Zombie Sweeper Shotgun", "=ds=#w5#"};
		{ 9, 44214, "", "=q3=Purifying Torch", "=ds=#w12#"};
		{ 10, 41726, "", "=q3=Design: Guardian's Twilight Opal", "=ds=#p12# (390)"};
		{ 11, 44150, "", "=q3=Arcanum of the Stalwart Protector", "=ds=#s1# #e17#"};
		{ 16, 0, "INV_Jewelry_Talisman_08", "=q6=#r3#", ""};
		{ 17, 44216, "", "=q3=Cloak of Holy Extermination", "=ds=#s4#"};
		{ 18, 44240, "", "=q3=Special Issue Legplates", "=ds=#s11#, #a4#"};
		{ 19, 44239, "", "=q3=Standard Issue Legguards", "=ds=#s11#, #a4#"};
		{ 20, 44139, "", "=q3=Arcanum of the Fleeing Shadow", "=ds=#s1# #e17#"};
		{ 22, 0, "INV_Jewelry_Talisman_08", "=q6=#r5#", ""};
		{ 23, 44297, "", "=q4=Boots of the Neverending Path", "=ds=#s12#, #a2#"};
		{ 24, 44295, "", "=q4=Polished Regimental Hauberk", "=ds=#s5#, #a3#"};
		{ 25, 44296, "", "=q4=Helm of Purified Thoughts", "=ds=#s1#, #a4#"};
		{ 26, 44283, "", "=q4=Signet of Hopeful Light", "=ds=#s13#"};
		{ 27, 42187, "", "=q1=Pattern: Brilliant Spellthread", "=ds=#p8# (430)"};
		Back = "REPMENU_WOTLK";
	};

		-------------------------
		--- Frenzyheart Tribe ---
		-------------------------

	AtlasLoot_Data["FrenzyheartTribe"] = {
		{ 1, 0, "INV_Misc_Rune_14", "=q6=#r2#", ""};
		{ 2, 41561, "", "=q2=Design: Reckless Huge Citrine", "=ds=#p12# 350"};
		{ 3, 44064, "", "=q1=Nepeta Leaf", "=ds="};
		{ 4, 44072, "", "=q1=Roasted Mystery Beast", "=ds=#e3#"};
		{ 6, 0, "INV_Potion_139", "=q6="..AL["Ripe Disgusting Jar"], ""};
		{ 7, 44719, "", "=q3=Frenzyheart Brew", "=ds=", ""};
		{ 8, 39671, "", "=q1=Resurgent Healing Potion", "=ds=#e2#", ""};
		{ 9, 40067, "", "=q1=Icy Mana Potion", "=ds=#e2#", ""};
		{ 10, 40087, "", "=q1=Powerful Rejuvenation Potion", "=ds=#e2#", ""};
		{ 11, 44716, "", "=q1=Mysterious Fermented Liquid", "=ds=#e4#", ""};
		{ 16, 0, "INV_Misc_Rune_14", "=q6=#r4#", ""};
		{ 17, 44116, "", "=q3=Muddied Crimson Gloves", "=ds=#s9#, #a1#"};
		{ 18, 44117, "", "=q3=Azure Strappy Pants", "=ds=#s11#, #a2#"};
		{ 19, 44122, "", "=q3=Scavenged Feathery Leggings", "=ds=#s11#, #a3#"};
		{ 20, 44120, "", "=q3=Giant-Sized Gauntlets", "=ds=#s9#, #a4#"};
		{ 21, 44121, "", "=q3=Sparkly Shiny Gloves", "=ds=#s9#, #a4#"};
		{ 22, 44123, "", "=q3=Discarded Titanium Legplates", "=ds=#s11#, #a4#"};
		{ 23, 44118, "", "=q3=Stolen Vrykul Harpoon", "=ds=#w11#"};
		{ 24, 41723, "", "=q3=Design: Jagged Forest Emerald", "=ds=#p12# 390"};
		{ 25, 44717, "", "=q1=Disgusting Jar", "=ds="};
		{ 27, 0, "INV_Misc_Rune_14", "=q6=#r5#", ""};
		{ 28, 44073, "", "=q1=Frenzyheart Insignia of Fury", "=ds=#s14#"};
		Back = "REPMENU_WOTLK";
	};

		----------------------------
		--- The Horde Expedition ---
		----------------------------

	AtlasLoot_Data["HordeExpedition1"] = {
		{ 2, 0, "INV_Shield_50", "=q6=#r4#", ""};
		{ 3, 38458, "", "=q3=Darkspear Orb", "=ds=#s15#"};
		{ 4, 38461, "", "=q3=Warsong Shanker", "=ds=#h1#, #w4#"};
		{ 5, 38454, "", "=q3=Warsong Punisher", "=ds=#h1#, #w6#"};
		{ 6, 38452, "", "=q3=Bulwark of the Warchief", "=ds=#w8#"};
		{ 7, 38462, "", "=q3=Warsong Stormshield", "=ds=#w8#"};
		{ 8, 38456, "", "=q3=Sin'dorei Recurve Bow", "=ds=#w2#"};
		{ 9, 38460, "", "=q3=Charged Wand of the Cleft", "=ds=#w12#"};
		{ 17, 0, "INV_Shield_50", "=q6=#r5#", ""};
		{ 18, 44502, "", "=q4=Schematic: Mechano-hog", "=ds=#p5# (450)"};
		{ 19, 44938, "", "=q3=Plans: Titanium Plating", "=ds=#p2# (450)"};
		{ 20, 44702, "", "=q3=Arcanum of the Savage Gladiator", "=ds=#s1# #e17#"};
		Back = "REPMENU_WOTLK";
	};

		-----------------
		--- Kirin Tor ---
		-----------------

	AtlasLoot_Data["KirinTor"] = {
		{ 1, 0, "Spell_Fire_MasterOfElements", "=q6=#r2#", ""};
		{ 2, 43157, "", "=q1=Tabard of the Kirin Tor", "=ds=#s7#"};
		{ 4, 0, "Spell_Fire_MasterOfElements", "=q6=#r3#", ""};
		{ 5, 44167, "", "=q3=Shroud of Dedicated Research", "=ds=#s4#"};
		{ 6, 44170, "", "=q3=Helm of the Majestic Stag", "=ds=#s1#, #a2#"};
		{ 7, 44171, "", "=q3=Spaulders of Grounded Lightning", "=ds=#s3#, #a3#"};
		{ 8, 44166, "", "=q3=Lightblade Rivener", "=ds=#h1#, #w4#"};
		{ 9, 44141, "", "=q3=Arcanum of the Flame's Soul", "=ds=#s1# #e17#"};
		{ 16, 0, "Spell_Fire_MasterOfElements", "=q6=#r4#", ""};
		{ 17, 44179, "", "=q3=Mind-Expanding Leggings", "=ds=#s11#, #a2#"};
		{ 18, 44176, "", "=q3=Girdle of the Warrior Magi", "=ds=#s10#, #a4#"};
		{ 19, 44173, "", "=q3=Flameheart Spell Scalpel", "=ds=#h3#, #w4#"};
		{ 20, 44174, "", "=q3=Stave of Shrouded Mysteries", "=ds=#w9#"};
		{ 21, 44159, "", "=q3=Arcanum of Burning Mysteries", "=ds=#s1# #e17#"};
		{ 23, 0, "Spell_Fire_MasterOfElements", "=q6=#r5#", ""};
		{ 24, 44180, "", "=q4=Robes of Crackling Flame", "=ds=#s5#, #a1#"};
		{ 25, 44181, "", "=q4=Ghostflicker Waistband", "=ds=#s10#, #a2#"};
		{ 26, 44182, "", "=q4=Boots of Twinkling Stars", "=ds=#s12#, #a3#"};
		{ 27, 44183, "", "=q4=Fireproven Gauntlets", "=ds=#s9#, #a4#"};
		{ 28, 41718, "", "=q3=Design: Runed Scarlet Ruby", "=ds=#p12# (390)"};
		{ 29, 42188, "", "=q1=Pattern: Sapphire Spellthread", "=ds=#p8# (430)"};
		Back = "REPMENU_WOTLK";
	};

		---------------------------------
		--- Knights of the Ebon Blade ---
		---------------------------------

	AtlasLoot_Data["KnightsoftheEbonBlade"] = {
		{ 1, 0, "INV_Weapon_Hand_01", "=q6=#r2#", ""};
		{ 2, 41562, "", "=q2=Design: Deadly Huge Citrine", "=ds=#p12# (350)"};
		{ 3, 43155, "", "=q1=Tabard of the Ebon Blade", "=ds=#s7#"};
		{ 5, 0, "INV_Weapon_Hand_01", "=q6=#r3#", ""};
		{ 6, 44242, "", "=q3=Dark Soldier Cape", "=ds=#s4#"};
		{ 7, 44243, "", "=q3=Toxin-Tempered Sabatons", "=ds=#s12#, #a4#"};
		{ 8, 44241, "", "=q3=Unholy Persuader", "=ds=#h4#, #w13#"};
		{ 9, 44512, "", "=q3=Pattern: Nerubian Reinforced Quiver", "=ds=#p7# (415)"};
		{ 10, 44138, "", "=q3=Arcanum of Toxic Warding", "=ds=#s1# #e17#"};
		{ 16, 0, "INV_Weapon_Hand_01", "=q6=#r4#", ""};
		{ 17, 44256, "", "=q3=Sterile Flesh-Handling Gloves", "=ds=#s9#, #a1#"};
		{ 18, 44258, "", "=q3=Wound-Binder's Wristguards", "=ds=#s8#, #a2#"};
		{ 19, 44257, "", "=q3=Spaulders of the Black Arrow", "=ds=#s3#, #a3#"};
		{ 20, 44250, "", "=q3=Reaper of Dark Souls", "=ds=#h1#, #w10#"};
		{ 21, 44249, "", "=q3=Runeblade of Demonstrable Power", "=ds=#h2#, #w10#"};
		{ 22, 41721, "", "=q3=Design: Wicked Monarch Topaz", "=ds=#p12# (390)"};
		{ 23, 44149, "", "=q3=Arcanum of Torment", "=ds=#s1# #e17#"};
		{ 24, 42183, "", "=q1=Pattern: Abyssal Bag", "=ds=#p8# (435)"};
		{ 26, 0, "INV_Weapon_Hand_01", "=q6=#r5#", ""};
		{ 27, 44302, "", "=q4=Belt of Dark Mending", "=ds=#s10#, #a1#"};
		{ 28, 44303, "", "=q4=Darkheart Chestguard", "=ds=#s5#, #a2#"};
		{ 29, 44305, "", "=q4=Kilt of Dark Mercy", "=ds=#s11#, #a3#"};
		{ 30, 44306, "", "=q4=Death-Inured Sabatons", "=ds=#s12#, #a4#"};
		Back = "REPMENU_WOTLK";
	};

		-------------------
		--- The Kalu'ak ---
		-------------------

	AtlasLoot_Data["TheKaluak"] = {
		{ 1, 0, "INV_Fishingpole_03", "=q6=#r2#", ""};
		{ 2, 41568, "", "=q2=Design: Seer's Dark Jade", "=ds=#p12# (350)"};
		{ 3, 44049, "", "=q1=Freshly-Speared Emperor Salmon", "=ds=#e3#"};
		{ 5, 0, "INV_Fishingpole_03", "=q6=#r3#", ""};
		{ 6, 44061, "", "=q3=Pigment-Stained Robes", "=ds=#s5#, #a1#"};
		{ 7, 44062, "", "=q3=Turtle-Minders Robe", "=ds=#s5#, #a1#"};
		{ 8, 44054, "", "=q3=Whale-Skin Breastplate", "=ds=#s5#, #a2#"};
		{ 9, 44055, "", "=q3=Whale-Skin Vest", "=ds=#s5#, #a2#"};
		{ 10, 44059, "", "=q3=Cuttlefish Scale Breastplate", "=ds=#s5#, #a3#"};
		{ 11, 44060, "", "=q3=Cuttlefish Tooth Ringmail", "=ds=#s5#, #a3#"};
		{ 12, 44057, "", "=q3=Ivory-Reinforced Chestguard", "=ds=#s5#, #a4#"};
		{ 13, 44058, "", "=q3=Whalebone Carapace", "=ds=#s5#, #a4#"};
		{ 14, 44511, "", "=q3=Pattern: Dragonscale Ammo Pouch", "=ds=#p7# (415)"};
		{ 15, 41574, "", "=q2=Design: Defender's Shadow Crystal", "=ds=#p12# (350)"};
		{ 16, 0, "INV_Fishingpole_03", "=q6=#r4#", ""};
		{ 17, 44051, "", "=q3=Traditional Flensing Knife", "=ds=#h1#, #w4#"};
		{ 18, 44052, "", "=q3=Totemic Purification Rod", "=ds=#h3#, #w6#"};
		{ 19, 44053, "", "=q3=Whale-Stick Harpoon", "=ds=#w7#"};
		{ 20, 44509, "", "=q3=Pattern: Trapper's Traveling Pack", "=ds=#p7# (415)"};
		{ 21, 45774, "", "=q1=Pattern: Emerald Bag", "=ds=#p8# (435)"};
		{ 23, 0, "INV_Fishingpole_03", "=q6=#r5#", ""};
		{ 24, 44050, "", "=q4=Mastercraft Kalu'ak Fishing Pole", "=ds=#e20#"};
		{ 25, 44723, "", "=q3=Nurtured Penguin Egg", "=ds=#e13#"};
		Back = "REPMENU_WOTLK";
	};

		-------------------
		--- The Oracles ---
		-------------------

	AtlasLoot_Data["TheOracles"] = {
		{ 1, 0, "INV_Helmet_138", "=q6=#r2#", ""};
		{ 2, 41567, "", "=q2=Design: Vivid Dark Jade", "=ds=#p12# (350)"};
		{ 3, 44065, "", "=q1=Oracle Secret Solution", "=ds=#e2#"};
		{ 5, 0, "INV_Helmet_138", "=q6=#r3#", ""};
		{ 6, 44071, "", "=q1=Slow-Roasted Eel", "=ds=#e3#"};
		{ 8, 0, "INV_Egg_02", "=q6="..AL["Cracked Egg"], ""};
		{ 9, 44707, "", "=q4=Reins of the Green Proto-Drake", "=ds=#e12#", ""};
		{ 10, 39898, "", "=q1=Cobra Hatchling", "=ds=#e13#", ""};
		{ 11, 44721, "", "=q1=Proto-Drake Whelp", "=ds=#e13#", ""};
		{ 12, 39896, "", "=q1=Tickbird Hatchling", "=ds=#e13#", ""};
		{ 13, 39899, "", "=q1=White Tickbird Hatchling", "=ds=#e13#", ""};
		{ 14, 44722, "", "=q1=Aged Yolk", "=ds=#e3#", ""};
		{ 16, 0, "INV_Helmet_138", "=q6=#r4#", ""};
		{ 17, 44104, "", "=q3=Fishy Cinch", "=ds=#s10#, #a1#"};
		{ 18, 44106, "", "=q3=Glitterscale Wrap", "=ds=#s10#, #a2#" };
		{ 19, 44110, "", "=q3=Sharkjaw Cap", "=ds=#s1#, #a3#" };
		{ 20, 44109, "", "=q3=Toothslice Helm", "=ds=#s1#, #a3#" };
		{ 21, 44112, "", "=q3=Glimmershell Shoulder Protectors", "=ds=#s3#, #a4#"};
		{ 22, 44111, "", "=q3=Gold Star Spaulders", "=ds=#s3#, #a4#"};
		{ 23, 44108, "", "=q3=Shinygem Rod", "=ds=#w12#"};
		{ 24, 41724, "", "=q3=Design: Sundered Forest Emerald", "=ds=#p12# (390)"};
		{ 25, 39878, "", "=q1=Mysterious Egg", "=ds="};
		{ 27, 0, "INV_Helmet_138", "=q6=#r5#", ""};
		{ 28, 44074, "", "=q4=Oracle Talisman of Ablution", "=ds=#s14#"};
		Back = "REPMENU_WOTLK";
	};

		-------------------------
		--- The Sons of Hodir ---
		-------------------------

	AtlasLoot_Data["TheSonsofHodir1"] = {
		{ 1, 0, "Spell_Holy_DivinePurpose", "=q6=#r3#", ""};
		{ 2, 44190, "", "=q3=Spaulders of Frozen Knives", "=ds=#s3#, #a2#"};
		{ 3, 44189, "", "=q3=Giant Ring Belt", "=ds=#s10#, #a3#"};
		{ 4, 44510, "", "=q3=Pattern: Mammoth Mining Bag", "=ds=#p7# (415)"};
		{ 5, 44137, "", "=q3=Arcanum of the Frosty Soul", "=ds=#s1# #e17#"};
		{ 6, 44131, "", "=q3=Lesser Inscription of the Axe", "=ds=#s3# #e17#"};
		{ 7, 44130, "", "=q3=Lesser Inscription of the Crag", "=ds=#s3# #e17#"};
		{ 8, 44132, "", "=q3=Lesser Inscription of the Pinnacle", "=ds=#s3# #e17#"};
		{ 9, 44129, "", "=q3=Lesser Inscription of the Storm ", "=ds=#s3# #e17#"};
		{ 16, 0, "Spell_Holy_DivinePurpose", "=q6=#r4#", ""};
		{ 17, 43958, "", "=q4=Reins of the Ice Mammoth", "=ds=#e12# =ec1=#m7#"};
		{ 18, 44080, "", "=q4=Reins of the Ice Mammoth", "=ds=#e12# =ec1=#m6#"};
		{ 19, 44194, "", "=q3=Giant-Friend Kilt", "=ds=#s11#, #a2#" };
		{ 20, 44195, "", "=q3=Spaulders of the Giant Lords", "=ds=#s3#, #a4#"};
		{ 21, 44193, "", "=q3=Broken Stalactite", "=ds=#h1#, #w4#"};
		{ 22, 44192, "", "=q3=Stalactite Chopper", "=ds=#h1#, #w1#"};
		Next = "TheSonsofHodir2";
		Back = "REPMENU_WOTLK";
	};

	AtlasLoot_Data["TheSonsofHodir2"] = {
		{ 1, 0, "Spell_Holy_DivinePurpose", "=q6=#r5#", ""};
		{ 2, 43961, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e12# =ec1=#m7#"};
		{ 3, 44086, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e12# =ec1=#m6#"};
		{ 4, 44133, "", "=q4=Greater Inscription of the Axe", "=ds=#s3# #e17#"};
		{ 5, 44134, "", "=q4=Greater Inscription of the Crag", "=ds=#s3# #e17#"};
		{ 6, 44136, "", "=q4=Greater Inscription of the Pinnacle", "=ds=#s3# #e17#"};
		{ 7, 44135, "", "=q4=Greater Inscription of the Storm ", "=ds=#s3# #e17#"};
		{ 8, 41720, "", "=q3=Design: Smooth Autumn's Glow", "=ds=#p12# (390)"};
		{ 9, 42184, "", "=q1=Pattern: Glacial Bag", "=ds=#p8# (445)"};
		Prev = "TheSonsofHodir1";
		Back = "REPMENU_WOTLK";
	};

		-------------------------
		--- Winterfin Retreat ---
		-------------------------

	AtlasLoot_Data["WinterfinRetreat"] = {
		{ 2, 36784, "", "=q3=Siren's Tear", "=ds=#e7#", "60 #winterfinclam#"};
		{ 3, 37462, "", "=q2=Sea King's Crown", "=ds=#s1#, #a1#", "50 #winterfinclam#"};
		{ 4, 37463, "", "=q2=Winterfin Patch of Honor", "=ds=#s1#, #a2#", "50 #winterfinclam#"};
		{ 5, 37461, "", "=q2=Tidebreaker Trident", "=ds=#w7#", "100 #winterfinclam#"};
		{ 6, 36783, "", "=q2=Northsea Pearl", "=ds=#e7#", "30 #winterfinclam#"};
		{ 7, 37464, "", "=q1=Winterfin Horn of Distress", "=ds=#e22#", "20 #winterfinclam#"};
		{ 8, 37449, "", "=q1=Breath of Murloc", "=ds=#e2#", "5 #winterfinclam#"};
		{ 9, 38351, "", "=q1=Murliver Oil", "=ds=#e2#", "5 #winterfinclam#"};
		{ 10, 38350, "", "=q1=Winterfin \"Depth Charge\"", "=ds=#e4#", "1 #winterfinclam#"};
		{ 11, 17058, "", "=q1=Fish Oil", "=ds=#e8#", "1 #winterfinclam#"};
		{ 12, 17057, "", "=q1=Shiny Fish Scales", "=ds=#e8#", "1 #winterfinclam#"};
		{ 14, 34597, "", "=q1=Winterfin Clam", "=ds=#m17#"};
		Back = "REPMENU_WOTLK";
	};

		---------------------------
		--- The Wyrmrest Accord ---
		---------------------------

	AtlasLoot_Data["TheWyrmrestAccord"] = {
		{ 1, 0, "Ability_Druid_Eclipse", "=q6=#r1#", ""};
		{ 2, 43156, "", "=q1=Tabard of the Wyrmrest Accord", "=ds=#s7#"};
		{ 4, 0, "Ability_Druid_Eclipse", "=q6=#r3#", ""};
		{ 5, 44188, "", "=q3=Cloak of Peaceful Resolutions", "=ds=#s4#"};
		{ 6, 44196, "", "=q3=Sash of the Wizened Wyrm", "=ds=#s10#, #a1#"};
		{ 7, 44197, "", "=q3=Bracers of Accorded Courtesy", "=ds=#s8#, #a4#"};
		{ 8, 44187, "", "=q3=Fang of Truth", "=ds=#h1#, #w10#"};
		{ 9, 44140, "", "=q3=Arcanum of the Eclipsed Moon", "=ds=#s1# #e17#"};
		{ 16, 0, "Ability_Druid_Eclipse", "=q6=#r4#", ""};
		{ 17, 44200, "", "=q3=Ancestral Sinew Wristguards", "=ds=#s8#, #a1#"};
		{ 18, 44198, "", "=q3=Breastplate of the Solemn Council", "=ds=#s5#, #a4#"};
		{ 19, 44201, "", "=q3=Sabatons of Draconic Vigor", "=ds=#s12#, #a4#"};
		{ 20, 44199, "", "=q3=Gavel of the Brewing Storm", "=ds=#h3#, #w6#"};
		{ 21, 44152, "", "=q3=Arcanum of Blissful Mending", "=ds=#s1# #e17#"};
		{ 22, 42185, "", "=q1=Pattern: Mysterious Bag", "=ds=#p8# (440)"};
		{ 24, 0, "Ability_Druid_Eclipse", "=q6=#r5#", ""};
		{ 25, 44202, "", "=q4=Sandals of Crimson Fury", "=ds=#s12#, #a1#"};
		{ 26, 44203, "", "=q4=Dragonfriend Bracers", "=ds=#s8#, #a2#"};
		{ 27, 44204, "", "=q4=Grips of Fierce Pronouncements", "=ds=#s9#, #a3#"};
		{ 28, 44205, "", "=q4=Legplates of Bloody Reprisal", "=ds=#s11#, #a4#"};
		{ 29, 43955, "", "=q4=Reins of the Red Drake", "=ds=#e12#"};
		{ 30, 41722, "", "=q3=Design: Glimmering Monarch Topaz", "=ds=#p12# (390)"};
		Back = "REPMENU_WOTLK";
	};

	-----------
	--- PvP ---
	-----------

		------------------
		--- Armor Sets ---
		------------------

	AtlasLoot_Data["PvP80DeathKnight"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas10#", ""};
		{ 2, 40817, "", "=q3=Savage Gladiator's Dreadplate Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 40857, "", "=q3=Savage Gladiator's Dreadplate Shoulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40779, "", "=q3=Savage Gladiator's Dreadplate Chestpiece", "=ds=", "45 #eofheroism#"};
		{ 5, 40799, "", "=q3=Savage Gladiator's Dreadplate Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 40837, "", "=q3=Savage Gladiator's Dreadplate Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas10#", ""};
		{ 9, 40820, "", "=q4=Hateful Gladiator's Dreadplate Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 40860, "", "=q4=Hateful Gladiator's Dreadplate Shoulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40781, "", "=q4=Hateful Gladiator's Dreadplate Chestpiece", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 40803, "", "=q4=Hateful Gladiator's Dreadplate Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 40841, "", "=q4=Hateful Gladiator's Dreadplate Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas10#", ""};
		{ 17, 40824, "", "=q4=Deadly Gladiator's Dreadplate Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 40863, "", "=q4=Deadly Gladiator's Dreadplate Shoulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40784, "", "=q4=Deadly Gladiator's Dreadplate Chestpiece", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 40806, "", "=q4=Deadly Gladiator's Dreadplate Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 40845, "", "=q4=Deadly Gladiator's Dreadplate Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas10#", ""};
		{ 24, 40827, "", "=q4=Furious Gladiator's Dreadplate Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 40868, "", "=q4=Furious Gladiator's Dreadplate Shoulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40787, "", "=q4=Furious Gladiator's Dreadplate Chestpiece", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 40809, "", "=q4=Furious Gladiator's Dreadplate Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 40848, "", "=q4=Furious Gladiator's Dreadplate Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80DruidBalance"] = {
		{ 1, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", ""};
		{ 2, 41324, "", "=q3=Savage Gladiator's Wyrmhide Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41278, "", "=q3=Savage Gladiator's Wyrmhide Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41313, "", "=q3=Savage Gladiator's Wyrmhide Robes", "=ds=", "45 #eofheroism#"};
		{ 5, 41290, "", "=q3=Savage Gladiator's Wyrmhide Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41301, "", "=q3=Savage Gladiator's Wyrmhide Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", ""};
		{ 9, 41325, "", "=q4=Hateful Gladiator's Wyrmhide Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41279, "", "=q4=Hateful Gladiator's Wyrmhide Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41314, "", "=q4=Hateful Gladiator's Wyrmhide Robes", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41291, "", "=q4=Hateful Gladiator's Wyrmhide Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41302, "", "=q4=Hateful Gladiator's Wyrmhide Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Nature_InsectSwarm", "=q6=#arenas1_2#", ""};
		{ 17, 41326, "", "=q4=Deadly Gladiator's Wyrmhide Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41280, "", "=q4=Deadly Gladiator's Wyrmhide Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41315, "", "=q4=Deadly Gladiator's Wyrmhide Robes", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41292, "", "=q4=Deadly Gladiator's Wyrmhide Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41303, "", "=q4=Deadly Gladiator's Wyrmhide Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas1_2#", ""};
		{ 24, 41327, "", "=q4=Furious Gladiator's Wyrmhide Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41281, "", "=q4=Furious Gladiator's Wyrmhide Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41316, "", "=q4=Furious Gladiator's Wyrmhide Robes", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41293, "", "=q4=Furious Gladiator's Wyrmhide Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41304, "", "=q4=Furious Gladiator's Wyrmhide Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80DruidFeral"] = {
		{ 1, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", ""};
		{ 2, 41675, "", "=q3=Savage Gladiator's Dragonhide Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41712, "", "=q3=Savage Gladiator's Dragonhide Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41658, "", "=q3=Savage Gladiator's Dragonhide Robes", "=ds=", "45 #eofheroism#"};
		{ 5, 41770, "", "=q3=Savage Gladiator's Dragonhide Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41664, "", "=q3=Savage Gladiator's Dragonhide Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", ""};
		{ 9, 41676, "", "=q4=Hateful Gladiator's Dragonhide Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41713, "", "=q4=Hateful Gladiator's Dragonhide Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41659, "", "=q4=Hateful Gladiator's Dragonhide Robes", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41771, "", "=q4=Hateful Gladiator's Dragonhide Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41665, "", "=q4=Hateful Gladiator's Dragonhide Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Ability_Druid_Maul", "=q6=#arenas1_1#", ""};
		{ 17, 41677, "", "=q4=Deadly Gladiator's Dragonhide Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41714, "", "=q4=Deadly Gladiator's Dragonhide Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41660, "", "=q4=Deadly Gladiator's Dragonhide Robes", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41772, "", "=q4=Deadly Gladiator's Dragonhide Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41666, "", "=q4=Deadly Gladiator's Dragonhide Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas1_1#", ""};
		{ 24, 41678, "", "=q4=Furious Gladiator's Dragonhide Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41715, "", "=q4=Furious Gladiator's Dragonhide Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41661, "", "=q4=Furious Gladiator's Dragonhide Robes", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41773, "", "=q4=Furious Gladiator's Dragonhide Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41667, "", "=q4=Furious Gladiator's Dragonhide Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80DruidRestoration"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", ""};
		{ 2, 41269, "", "=q3=Savage Gladiator's Kodohide Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41271, "", "=q3=Savage Gladiator's Kodohide Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41272, "", "=q3=Savage Gladiator's Kodohide Robes", "=ds=", "45 #eofheroism#"};
		{ 5, 41268, "", "=q3=Savage Gladiator's Kodohide Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41270, "", "=q3=Savage Gladiator's Kodohide Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", ""};
		{ 9, 41319, "", "=q4=Hateful Gladiator's Kodohide Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41273, "", "=q4=Hateful Gladiator's Kodohide Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41308, "", "=q4=Hateful Gladiator's Kodohide Robes", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41284, "", "=q4=Hateful Gladiator's Kodohide Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41296, "", "=q4=Hateful Gladiator's Kodohide Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#arenas1_3#", ""};
		{ 17, 41320, "", "=q4=Deadly Gladiator's Kodohide Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41274, "", "=q4=Deadly Gladiator's Kodohide Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41309, "", "=q4=Deadly Gladiator's Kodohide Robes", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41286, "", "=q4=Deadly Gladiator's Kodohide Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41297, "", "=q4=Deadly Gladiator's Kodohide Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas1_3#", ""};
		{ 24, 41321, "", "=q4=Furious Gladiator's Kodohide Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41275, "", "=q4=Furious Gladiator's Kodohide Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41310, "", "=q4=Furious Gladiator's Kodohide Robes", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41287, "", "=q4=Furious Gladiator's Kodohide Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41298, "", "=q4=Furious Gladiator's Kodohide Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80Hunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", ""};
		{ 2, 41154, "", "=q3=Savage Gladiator's Chain Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41214, "", "=q3=Savage Gladiator's Chain Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41084, "", "=q3=Savage Gladiator's Chain Armor", "=ds=", "45 #eofheroism#"};
		{ 5, 41140, "", "=q3=Savage Gladiator's Chain Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 41202, "", "=q3=Savage Gladiator's Chain Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", ""};
		{ 9, 41155, "", "=q4=Hateful Gladiator's Chain Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41215, "", "=q4=Hateful Gladiator's Chain Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41085, "", "=q4=Hateful Gladiator's Chain Armor", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41141, "", "=q4=Hateful Gladiator's Chain Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41203, "", "=q4=Hateful Gladiator's Chain Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#arenas2#", ""};
		{ 17, 41156, "", "=q4=Deadly Gladiator's Chain Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41216, "", "=q4=Deadly Gladiator's Chain Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41086, "", "=q4=Deadly Gladiator's Chain Armor", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41142, "", "=q4=Deadly Gladiator's Chain Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41204, "", "=q4=Deadly Gladiator's Chain Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas2#", ""};
		{ 24, 41157, "", "=q4=Furious Gladiator's Chain Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41217, "", "=q4=Furious Gladiator's Chain Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41087, "", "=q4=Furious Gladiator's Chain Armor", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41143, "", "=q4=Furious Gladiator's Chain Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41205, "", "=q4=Furious Gladiator's Chain Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80Mage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", ""};
		{ 2, 41943, "", "=q3=Savage Gladiator's Silk Cowl", "=ds=", "45 #eofheroism#"};
		{ 3, 41962, "", "=q3=Savage Gladiator's Silk Amice", "=ds=", "30 #eofheroism#"};
		{ 4, 41949, "", "=q3=Savage Gladiator's Silk Raiment", "=ds=", "45 #eofheroism#"};
		{ 5, 41968, "", "=q3=Savage Gladiator's Silk Handguards", "=ds=", "30 #eofheroism#"};
		{ 6, 41956, "", "=q3=Savage Gladiator's Silk", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", ""};
		{ 9, 41944, "", "=q4=Hateful Gladiator's Silk Cowl", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41963, "", "=q4=Hateful Gladiator's Silk Amice", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41950, "", "=q4=Hateful Gladiator's Silk Raiment", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41969, "", "=q4=Hateful Gladiator's Silk Handguards", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41957, "", "=q4=Hateful Gladiator's Silk Trousers", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#arenas3#", ""};
		{ 17, 41945, "", "=q4=Deadly Gladiator's Silk Cowl", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41964, "", "=q4=Deadly Gladiator's Silk Amice", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41951, "", "=q4=Deadly Gladiator's Silk Raiment", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41970, "", "=q4=Deadly Gladiator's Silk Handguards", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41958, "", "=q4=Deadly Gladiator's Silk Trousers", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas3#", ""};
		{ 24, 41946, "", "=q4=Furious Gladiator's Silk Cowl", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41965, "", "=q4=Furious Gladiator's Silk Amice", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41953, "", "=q4=Furious Gladiator's Silk Raiment", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41971, "", "=q4=Furious Gladiator's Silk Handguards", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41959, "", "=q4=Furious Gladiator's Silk Trousers", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80PaladinRetribution"] = {
		{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", ""};
		{ 2, 40818, "", "=q3=Savage Gladiator's Scaled Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 40858, "", "=q3=Savage Gladiator's Scaled Shoulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40780, "", "=q3=Savage Gladiator's Scaled Chestpiece", "=ds=", "45 #eofheroism#"};
		{ 5, 40798, "", "=q3=Savage Gladiator's Scaled Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 40838, "", "=q3=Savage Gladiator's Scaled Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", ""};
		{ 9, 40821, "", "=q4=Hateful Gladiator's Scaled Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 40861, "", "=q4=Hateful Gladiator's Scaled Shoulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40782, "", "=q4=Hateful Gladiator's Scaled Chestpiece", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 40802, "", "=q4=Hateful Gladiator's Scaled Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 40842, "", "=q4=Hateful Gladiator's Scaled Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#arenas4_2#", ""};
		{ 17, 40825, "", "=q4=Deadly Gladiator's Scaled Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 40864, "", "=q4=Deadly Gladiator's Scaled Shoulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40785, "", "=q4=Deadly Gladiator's Scaled Chestpiece", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 40805, "", "=q4=Deadly Gladiator's Scaled Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 40846, "", "=q4=Deadly Gladiator's Scaled Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas4_2#", ""};
		{ 24, 40828, "", "=q4=Furious Gladiator's Scaled Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 40869, "", "=q4=Furious Gladiator's Scaled Shoulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40788, "", "=q4=Furious Gladiator's Scaled Chestpiece", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 40808, "", "=q4=Furious Gladiator's Scaled Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 40849, "", "=q4=Furious Gladiator's Scaled Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80PaladinHoly"] = {
		{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", ""};
		{ 2, 40930, "", "=q3=Savage Gladiator's Ornamented Headcover", "=ds=", "45 #eofheroism#"};
		{ 3, 40960, "", "=q3=Savage Gladiator's Ornamented Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40898, "", "=q3=Savage Gladiator's Ornamented Chestguard", "=ds=", "45 #eofheroism#"};
		{ 5, 40918, "", "=q3=Savage Gladiator's Ornamented Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 40936, "", "=q3=Savage Gladiator's Ornamented Legplates", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", ""};
		{ 9, 40931, "", "=q4=Hateful Gladiator's Ornamented Headcover", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 40961, "", "=q4=Hateful Gladiator's Ornamented Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40904, "", "=q4=Hateful Gladiator's Ornamented Gloves", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 40925, "", "=q4=Hateful Gladiator's Ornamented Chestguard", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 40937, "", "=q4=Hateful Gladiator's Ornamented Legplates", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#arenas4_3#", ""};
		{ 17, 40932, "", "=q4=Deadly Gladiator's Ornamented Headcover", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 40962, "", "=q4=Deadly Gladiator's Ornamented Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40905, "", "=q4=Deadly Gladiator's Ornamented Chestguard", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 40926, "", "=q4=Deadly Gladiator's Ornamented Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 40938, "", "=q4=Deadly Gladiator's Ornamented Legplates", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas4_3#", ""};
		{ 24, 40933, "", "=q4=Furious Gladiator's Ornamented Headcover", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 40963, "", "=q4=Furious Gladiator's Ornamented Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40907, "", "=q4=Furious Gladiator's Ornamented Chestguard", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 40927, "", "=q4=Furious Gladiator's Ornamented Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 40939, "", "=q4=Furious Gladiator's Ornamented Legplates", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80PriestShadow"] = {
		{ 1, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", ""};
		{ 2, 41912, "", "=q3=Savage Gladiator's Satin Hood", "=ds=", "45 #eofheroism#"};
		{ 3, 41930, "", "=q3=Savage Gladiator's Satin Mantle", "=ds=", "30 #eofheroism#"};
		{ 4, 41918, "", "=q3=Savage Gladiator's Satin Robe", "=ds=", "45 #eofheroism#"};
		{ 5, 41937, "", "=q3=Savage Gladiator's Satin Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41924, "", "=q3=Savage Gladiator's Satin Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", ""};
		{ 9, 41913, "", "=q4=Hateful Gladiator's Satin Hood", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41931, "", "=q4=Hateful Gladiator's Satin Mantle", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41919, "", "=q4=Hateful Gladiator's Satin Robe", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41938, "", "=q4=Hateful Gladiator's Satin Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41925, "", "=q4=Hateful Gladiator's Satin Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Shadow_AntiShadow", "=q6=#arenas5_1#", ""};
		{ 17, 41914, "", "=q4=Deadly Gladiator's Satin Hood", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41933, "", "=q4=Deadly Gladiator's Satin Mantle", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41920, "", "=q4=Deadly Gladiator's Satin Robe", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41939, "", "=q4=Deadly Gladiator's Satin Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41926, "", "=q4=Deadly Gladiator's Satin Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas5_1#", ""};
		{ 24, 41915, "", "=q4=Furious Gladiator's Satin Hood", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41934, "", "=q4=Furious Gladiator's Satin Mantle", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41921, "", "=q4=Furious Gladiator's Satin Robe", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41940, "", "=q4=Furious Gladiator's Satin Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41927, "", "=q4=Furious Gladiator's Satin Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80PriestHoly"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", ""};
		{ 2, 41848, "", "=q3=Savage Gladiator's Mooncloth Hood", "=ds=", "45 #eofheroism#"};
		{ 3, 41850, "", "=q3=Savage Gladiator's Mooncloth Mantle", "=ds=", "30 #eofheroism#"};
		{ 4, 41851, "", "=q3=Savage Gladiator's Mooncloth Robe", "=ds=", "45 #eofheroism#"};
		{ 5, 41847, "", "=q3=Savage Gladiator's Mooncloth Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41849, "", "=q3=Savage Gladiator's Mooncloth Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", ""};
		{ 9, 41852, "", "=q4=Hateful Gladiator's Mooncloth Hood", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41867, "", "=q4=Hateful Gladiator's Mooncloth Mantle", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41857, "", "=q4=Hateful Gladiator's Mooncloth Robe", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41872, "", "=q4=Hateful Gladiator's Mooncloth Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41862, "", "=q4=Hateful Gladiator's Mooncloth Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#arenas5_2#", ""};
		{ 17, 41853, "", "=q4=Deadly Gladiator's Mooncloth Hood", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41868, "", "=q4=Deadly Gladiator's Mooncloth Mantle", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41858, "", "=q4=Deadly Gladiator's Mooncloth Robe", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41873, "", "=q4=Deadly Gladiator's Mooncloth Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41863, "", "=q4=Deadly Gladiator's Mooncloth Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas5_2#", ""};
		{ 24, 41854, "", "=q4=Furious Gladiator's Mooncloth Hood", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41869, "", "=q4=Furious Gladiator's Mooncloth Mantle", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41859, "", "=q4=Furious Gladiator's Mooncloth Robe", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41874, "", "=q4=Furious Gladiator's Mooncloth Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41864, "", "=q4=Furious Gladiator's Mooncloth Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80Rogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#arenas6#", ""};
		{ 2, 41644, "", "=q3=Savage Gladiator's Leather Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41646, "", "=q3=Savage Gladiator's Leather Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41647, "", "=q3=Savage Gladiator's Leather Tunic", "=ds=", "45 #eofheroism#"};
		{ 5, 41643, "", "=q3=Savage Gladiator's Leather Gloves", "=ds=", "30 #eofheroism#"};
		{ 6, 41645, "", "=q3=Savage Gladiator's Leather Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Ability_BackStab", "=q6=#arenas6#", ""};
		{ 9, 41670, "", "=q4=Hateful Gladiator's Leather Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41681, "", "=q4=Hateful Gladiator's Leather Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41648, "", "=q4=Hateful Gladiator's Leather Tunic", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41765, "", "=q4=Hateful Gladiator's Leather Gloves", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41653, "", "=q4=Hateful Gladiator's Leather Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Ability_BackStab", "=q6=#arenas6#", ""};
		{ 17, 41671, "", "=q4=Deadly Gladiator's Leather Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41682, "", "=q4=Deadly Gladiator's Leather Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41649, "", "=q4=Deadly Gladiator's Leather Tunic", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41766, "", "=q4=Deadly Gladiator's Leather Gloves", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41654, "", "=q4=Deadly Gladiator's Leather Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas6#", ""};
		{ 24, 41672, "", "=q4=Furious Gladiator's Leather Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41683, "", "=q4=Furious Gladiator's Leather Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41650, "", "=q4=Furious Gladiator's Leather Tunic", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41767, "", "=q4=Furious Gladiator's Leather Gloves", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41655, "", "=q4=Furious Gladiator's Leather Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80ShamanElemental"] = {
		{ 1, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", ""};
		{ 2, 41016, "", "=q3=Savage Gladiator's Mail Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41041, "", "=q3=Savage Gladiator's Mail Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40987, "", "=q3=Savage Gladiator's Mail Armor", "=ds=", "45 #eofheroism#"};
		{ 5, 41004, "", "=q3=Savage Gladiator's Mail Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 41030, "", "=q3=Savage Gladiator's Mail Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", ""};
		{ 9, 41017, "", "=q4=Hateful Gladiator's Mail Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41042, "", "=q4=Hateful Gladiator's Mail Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40989, "", "=q4=Hateful Gladiator's Mail Armor", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41005, "", "=q4=Hateful Gladiator's Mail Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41031, "", "=q4=Hateful Gladiator's Mail Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Nature_Lightning", "=q6=#arenas7_2#", ""};
		{ 17, 41018, "", "=q4=Deadly Gladiator's Mail Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41043, "", "=q4=Deadly Gladiator's Mail Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40991, "", "=q4=Deadly Gladiator's Mail Armor", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41006, "", "=q4=Deadly Gladiator's Mail Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41032, "", "=q4=Deadly Gladiator's Mail Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas7_2#", ""};
		{ 24, 41019, "", "=q4=Furious Gladiator's Mail Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41044, "", "=q4=Furious Gladiator's Mail Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40993, "", "=q4=Furious Gladiator's Mail Armor", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41007, "", "=q4=Furious Gladiator's Mail Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41033, "", "=q4=Furious Gladiator's Mail Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80ShamanEnhancement"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", ""};
		{ 2, 41148, "", "=q3=Savage Gladiator's Linked Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41208, "", "=q3=Savage Gladiator's Linked Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 41078, "", "=q3=Savage Gladiator's Linked Armor", "=ds=", "45 #eofheroism#"};
		{ 5, 41134, "", "=q3=Savage Gladiator's Linked Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 41160, "", "=q3=Savage Gladiator's Linked Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", ""};
		{ 9, 41149, "", "=q4=Hateful Gladiator's Linked Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41209, "", "=q4=Hateful Gladiator's Linked Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 41079, "", "=q4=Hateful Gladiator's Linked Armor", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 41135, "", "=q4=Hateful Gladiator's Linked Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41162, "", "=q4=Hateful Gladiator's Linked Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#arenas7_1#", ""};
		{ 17, 41150, "", "=q4=Deadly Gladiator's Linked Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41210, "", "=q4=Deadly Gladiator's Linked Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41080, "", "=q4=Deadly Gladiator's Linked Armor", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41136, "", "=q4=Deadly Gladiator's Linked Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41198, "", "=q4=Deadly Gladiator's Linked Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas7_1#", ""};
		{ 24, 41151, "", "=q4=Furious Gladiator's Linked Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41211, "", "=q4=Furious Gladiator's Linked Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41081, "", "=q4=Furious Gladiator's Linked Armor", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41137, "", "=q4=Furious Gladiator's Linked Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41199, "", "=q4=Furious Gladiator's Linked Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80ShamanRestoration"] = {
		{ 1, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", ""};
		{ 2, 41010, "", "=q3=Savage Gladiator's Ringmail Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 41024, "", "=q3=Savage Gladiator's Ringmail Spaulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40986, "", "=q3=Savage Gladiator's Ringmail Armor", "=ds=", "45 #eofheroism#"};
		{ 5, 40998, "", "=q3=Savage Gladiator's Ringmail Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 41023, "", "=q3=Savage Gladiator's Ringmail Leggings", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", ""};
		{ 9, 41011, "", "=q4=Hateful Gladiator's Ringmail Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 41036, "", "=q4=Hateful Gladiator's Ringmail Spaulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40988, "", "=q4=Hateful Gladiator's Ringmail Armor", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 40999, "", "=q4=Hateful Gladiator's Ringmail Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 41025, "", "=q4=Hateful Gladiator's Ringmail Leggings", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Nature_HealingWaveGreater", "=q6=#arenas7_3#", ""};
		{ 17, 41012, "", "=q4=Deadly Gladiator's Ringmail Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 41037, "", "=q4=Deadly Gladiator's Ringmail Spaulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40990, "", "=q4=Deadly Gladiator's Ringmail Armor", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 41000, "", "=q4=Deadly Gladiator's Ringmail Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 41026, "", "=q4=Deadly Gladiator's Ringmail Leggings", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas7_3#", ""};
		{ 24, 41013, "", "=q4=Furious Gladiator's Ringmail Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 41038, "", "=q4=Furious Gladiator's Ringmail Spaulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40992, "", "=q4=Furious Gladiator's Ringmail Armor", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 41001, "", "=q4=Furious Gladiator's Ringmail Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 41027, "", "=q4=Furious Gladiator's Ringmail Leggings", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80Warlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", ""};
		{ 2, 41990, "", "=q3=Savage Gladiator's Felweave Cowl", "=ds=", "45 #eofheroism#"};
		{ 3, 42008, "", "=q3=Savage Gladiator's Felweave Amice", "=ds=", "30 #eofheroism#"};
		{ 4, 41996, "", "=q3=Savage Gladiator's Felweave Raiment", "=ds=", "45 #eofheroism#"};
		{ 5, 42014, "", "=q3=Savage Gladiator's Felweave Handguards", "=ds=", "30 #eofheroism#"};
		{ 6, 42002, "", "=q3=Savage Gladiator's Felweave Trousers", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", ""};
		{ 9, 41991, "", "=q4=Hateful Gladiator's Felweave Cowl", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 42009, "", "=q4=Hateful Gladiator's Felweave Amice", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 42001, "", "=q4=Hateful Gladiator's Felweave Raiment", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 42015, "", "=q4=Hateful Gladiator's Felweave Handguards", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 42003, "", "=q4=Hateful Gladiator's Felweave Trousers", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#arenas8_2#", ""};
		{ 17, 41992, "", "=q4=Deadly Gladiator's Felweave Cowl", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 42010, "", "=q4=Deadly Gladiator's Felweave Amice", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 41997, "", "=q4=Deadly Gladiator's Felweave Raiment", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 42016, "", "=q4=Deadly Gladiator's Felweave Handguards", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 42004, "", "=q4=Deadly Gladiator's Felweave Trousers", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#arenas8_2#", ""};
		{ 24, 41993, "", "=q4=Furious Gladiator's Felweave Cowl", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 42011, "", "=q4=Furious Gladiator's Felweave Amice", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 41998, "", "=q4=Furious Gladiator's Felweave Raiment", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 42017, "", "=q4=Furious Gladiator's Felweave Handguards", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 42005, "", "=q4=Furious Gladiator's Felweave Trousers", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

	AtlasLoot_Data["PvP80Warrior"] = {
		{ 1, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", ""};
		{ 2, 40816, "", "=q3=Savage Gladiator's Plate Helm", "=ds=", "45 #eofheroism#"};
		{ 3, 40856, "", "=q3=Savage Gladiator's Plate Shoulders", "=ds=", "30 #eofheroism#"};
		{ 4, 40778, "", "=q3=Savage Gladiator's Plate Chestpiece", "=ds=", "45 #eofheroism#"};
		{ 5, 40797, "", "=q3=Savage Gladiator's Plate Gauntlets", "=ds=", "30 #eofheroism#"};
		{ 6, 40836, "", "=q3=Savage Gladiator's Plate Legguards", "=ds=", "45 #eofheroism#"};
		{ 8, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", ""};
		{ 9, 40819, "", "=q4=Hateful Gladiator's Plate Helm", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 10, 40859, "", "=q4=Hateful Gladiator's Plate Shoulders", "=ds=", "31600 #faction# / 9600 #faction# 275 #arena# / 30 #eofvalor#"};
		{ 11, 40783, "", "=q4=Hateful Gladiator's Plate Chestpiece", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 12, 40801, "", "=q4=Hateful Gladiator's Plate Gauntlets", "=ds=", "31600 #faction# / 7200 #faction# 200 #arena# / 30 #eofvalor#"};
		{ 13, 40840, "", "=q4=Hateful Gladiator's Plate Legguards", "=ds=", "49600 #faction# / 12000 #faction# 350 #arena# / 45 #eofvalor#"};
		{ 16, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", ""};
		{ 17, 40823, "", "=q4=Deadly Gladiator's Plate Helm", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1450 / 58 #eofconquest#"};
		{ 18, 40862, "", "=q4=Deadly Gladiator's Plate Shoulders", "=ds=", "9600 #faction# 550 #arena# #reqrating# 1500 / 46 #eofconquest#"};
		{ 19, 40786, "", "=q4=Deadly Gladiator's Plate Chestpiece", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1400 / 58 #eofconquest#"};
		{ 20, 40804, "", "=q4=Deadly Gladiator's Plate Gauntlets", "=ds=", "7200 #faction# 400 #arena# #reqrating# 1300 / 46 #eofconquest#"};
		{ 21, 40844, "", "=q4=Deadly Gladiator's Plate Legguards", "=ds=", "12000 #faction# 700 #arena# #reqrating# 1350 / 58 #eofconquest#"};
		{ 23, 0, "Ability_Warrior_BattleShout", "=q6=#arenas9#", ""};
		{ 24, 40826, "", "=q4=Furious Gladiator's Plate Helm", "=ds=", "2150 #arena# #reqrating# 1900"};
		{ 25, 40866, "", "=q4=Furious Gladiator's Plate Shoulders", "=ds=", "1750 #arena# #reqrating# 2050"};
		{ 26, 40789, "", "=q4=Furious Gladiator's Plate Chestpiece", "=ds=", "2150 #arena# #reqrating# 1750"};
		{ 27, 40807, "", "=q4=Furious Gladiator's Plate Gauntlets", "=ds=", "1300 #arena# #reqrating# 1600"};
		{ 28, 40847, "", "=q4=Furious Gladiator's Plate Legguards", "=ds=", "2150 #arena# #reqrating# 1700"};
		Back = "LEVEL80PVPSETS";
	};

		------------------------------
		--- Level 80 Epic Non-Sets ---
		------------------------------

	AtlasLoot_Data["PvP80NonSet1"] = {
		{ 1, 42071, "", "=q4=Furious Gladiator's Cloak of Ascendancy", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 2, 42073, "", "=q4=Furious Gladiator's Cloak of Deliverance", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 3, 42069, "", "=q4=Furious Gladiator's Cloak of Dominance", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 4, 42072, "", "=q4=Furious Gladiator's Cloak of Salvation", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 5, 42070, "", "=q4=Furious Gladiator's Cloak of Subjugation", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 6, 42074, "", "=q4=Furious Gladiator's Cloak of Triumph", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 7, 42075, "", "=q4=Furious Gladiator's Cloak of Victory", "=ds=", "47400 #faction# #reqrating# 2000"};
		{ 9, 42116, "", "=q4=Furious Gladiator's Band of Dominance", "=ds=", "47400 #faction# #reqrating# 1650"};
		{ 10, 42117, "", "=q4=Furious Gladiator's Band of Triumph", "=ds=", "47400 #faction# #reqrating# 1650"};
		{ 12, 42124, "", "=q4=Medallion of the Alliance", "=ds=", "62000 #faction# #reqrating# 1800"};
		{ 13, 42123, "", "=q4=Medallion of the Alliance", "=ds=", "30400 #faction#"};
		{ 14, 42126, "", "=q4=Medallion of the Horde", "=ds=", "62000 #faction# #reqrating# 1800"};
		{ 15, 42122, "", "=q4=Medallion of the Horde", "=ds=", "30400 #faction#"};
		{ 16, 42037, "", "=q4=Furious Gladiator's Pendant of Ascendancy", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 17, 42039, "", "=q4=Furious Gladiator's Pendant of Deliverance", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 18, 42036, "", "=q4=Furious Gladiator's Pendant of Dominance", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 19, 42040, "", "=q4=Furious Gladiator's Pendant of Salvation", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 20, 42038, "", "=q4=Furious Gladiator's Pendant of Subjugation", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 21, 46373, "", "=q4=Furious Gladiator's Pendant of Sundering", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 22, 42034, "", "=q4=Furious Gladiator's Pendant of Triumph", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 23, 42035, "", "=q4=Furious Gladiator's Pendant of Victory", "=ds=", "47400 #faction# #reqrating# 1550"};
		{ 25, 42129, "", "=q4=Battlemaster's Accuracy", "=ds=", "49600 #faction#"};
		{ 26, 42130, "", "=q4=Battlemaster's Avidity", "=ds=", "49600 #faction#"};
		{ 27, 42131, "", "=q4=Battlemaster's Bravery", "=ds=", "49600 #faction#"};
		{ 28, 42132, "", "=q4=Battlemaster's Conviction", "=ds=", "49600 #faction#"};
		{ 29, 42128, "", "=q4=Battlemaster's Hostility", "=ds=", "49600 #faction#"};
		Next = "PvP80NonSet2";
		Back = "PVP80NONSETEPICS";
	};

	AtlasLoot_Data["PvP80NonSet2"] = {
		{ 1, 42064, "", "=q4=Deadly Gladiator's Cloak of Ascendancy", "=ds=", "38000 #faction#"};
		{ 2, 42066, "", "=q4=Deadly Gladiator's Cloak of Deliverance", "=ds=", "38000 #faction#"};
		{ 3, 42062, "", "=q4=Deadly Gladiator's Cloak of Dominance", "=ds=", "38000 #faction#"};
		{ 4, 42065, "", "=q4=Deadly Gladiator's Cloak of Salvation", "=ds=", "38000 #faction#"};
		{ 5, 42063, "", "=q4=Deadly Gladiator's Cloak of Subjugation", "=ds=", "38000 #faction#"};
		{ 6, 42067, "", "=q4=Deadly Gladiator's Cloak of Triumph", "=ds=", "38000 #faction#"};
		{ 7, 42068, "", "=q4=Deadly Gladiator's Cloak of Victory", "=ds=", "38000 #faction#"};
		{ 9, 42030, "", "=q4=Deadly Gladiator's Pendant of Ascendancy", "=ds=", "38000 #faction#"};
		{ 10, 42032, "", "=q4=Deadly Gladiator's Pendant of Deliverance", "=ds=", "38000 #faction#"};
		{ 11, 42029, "", "=q4=Deadly Gladiator's Pendant of Dominance", "=ds=", "38000 #faction#"};
		{ 12, 42033, "", "=q4=Deadly Gladiator's Pendant of Salvation", "=ds=", "38000 #faction#"};
		{ 13, 42031, "", "=q4=Deadly Gladiator's Pendant of Subjugation", "=ds=", "38000 #faction#"};
		{ 14, 42027, "", "=q4=Deadly Gladiator's Pendant of Triumph", "=ds=", "38000 #faction#"};
		{ 15, 42028, "", "=q4=Deadly Gladiator's Pendant of Victory", "=ds=", "38000 #faction#"};
		{ 16, 42114, "", "=q4=Deadly Gladiator's Band of Ascendancy", "=ds=", "38000 #faction#"};
		{ 17, 42115, "", "=q4=Deadly Gladiator's Band of Victory", "=ds=", "38000 #faction#"};
		{ 18, 42110, "", "=q4=Hateful Gladiator's Band of Dominance", "=ds=", "30400 #faction#"};
		{ 19, 42112, "", "=q4=Hateful Gladiator's Band of Triumph", "=ds=", "30400 #faction#"};
		{ 21, 42588, "", "=q4=Deadly Gladiator's Idol of Resolve", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 22, 42583, "", "=q4=Deadly Gladiator's Idol of Steadfastness", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 23, 42578, "", "=q4=Deadly Gladiator's Idol of Tenacity", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 24, 42852, "", "=q4=Deadly Gladiator's Libram of Fortitude", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 25, 42614, "", "=q4=Deadly Gladiator's Libram of Justice", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 26, 42620, "", "=q4=Deadly Gladiator's Sigil of Strife", "=ds=", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 27, 42607, "", "=q4=Deadly Gladiator's Totem of Indomitability", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 28, 42602, "", "=q4=Deadly Gladiator's Totem of Survival", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 29, 42597, "", "=q4=Deadly Gladiator's Totem of the Third Wind", "6400 #faction# 350 #arena# #reqrating# 1250"};
		Next = "PvP80NonSet3";
		Prev = "PvP80NonSet1";
		Back = "PVP80NONSETEPICS";
	};

--Cloth
	AtlasLoot_Data["PvP80NonSet3"] = {
		{ 1, 41908, "", "=q4=Deadly Gladiator's Cuffs of Dominance", "=ds=", "31600 #faction#"};
		{ 2, 41897, "", "=q4=Deadly Gladiator's Cord of Dominance", "=ds=", "49600 #faction#"};
		{ 3, 41902, "", "=q4=Deadly Gladiator's Treads of Dominance", "=ds=", "49600 #faction#"};
		{ 5, 41892, "", "=q4=Deadly Gladiator's Cuffs of Salvation", "=ds=", "31600 #faction#"};
		{ 6, 41880, "", "=q4=Deadly Gladiator's Cord of Salvation", "=ds=", "49600 #faction#"};
		{ 7, 41884, "", "=q4=Deadly Gladiator's Treads of Salvation", "=ds=", "49600 #faction#"};
		{ 16, 41909, "", "=q4=Furious Gladiator's Cuffs of Dominance", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 17, 41898, "", "=q4=Furious Gladiator's Cord of Dominance", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 18, 41903, "", "=q4=Furious Gladiator's Slippers of Dominance", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 20, 41893, "", "=q4=Furious Gladiator's Cuffs of Salvation", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 21, 41881, "", "=q4=Furious Gladiator's Cord of Salvation", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 22, 41885, "", "=q4=Furious Gladiator's Slippers of Salvation", "=ds=", "62000 #faction# #reqrating# 1500"};
		Next = "PvP80NonSet4";
		Prev = "PvP80NonSet2";
		Back = "PVP80NONSETEPICS";
	};

--Leather
	AtlasLoot_Data["PvP80NonSet4"] = {
		{ 1, 41639, "", "=q4=Deadly Gladiator's Armwraps of Dominance", "=ds=", "31600 #faction#"};
		{ 2, 41629, "", "=q4=Deadly Gladiator's Belt of Dominance", "=ds=", "49600 #faction#"};
		{ 3, 41634, "", "=q4=Deadly Gladiator's Boots of Dominance", "=ds=", "49600 #faction#"};
		{ 5, 41624, "", "=q4=Deadly Gladiator's Armwraps of Salvation", "=ds=", "31600 #faction#"};
		{ 6, 41616, "", "=q4=Deadly Gladiator's Belt of Salvation", "=ds=", "49600 #faction#"};
		{ 7, 41620, "", "=q4=Deadly Gladiator's Boots of Salvation", "=ds=", "49600 #faction#"};
		{ 9, 41839, "", "=q4=Deadly Gladiator's Armwraps of Triumph", "=ds=", "31600 #faction#"};
		{ 10, 41831, "", "=q4=Deadly Gladiator's Belt of Triumph", "=ds=", "49600 #faction#"};
		{ 11, 41835, "", "=q4=Deadly Gladiator's Boots of Triumph", "=ds=", "49600 #faction#"};
		{ 16, 41640, "", "=q4=Furious Gladiator's Armwraps of Dominance", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 17, 41630, "", "=q4=Furious Gladiator's Belt of Dominance", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 18, 41635, "", "=q4=Furious Gladiator's Boots of Dominance", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 20, 41625, "", "=q4=Furious Gladiator's Armwraps of Salvation", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 21, 41617, "", "=q4=Furious Gladiator's Belt of Salvation", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 22, 41621, "", "=q4=Furious Gladiator's Boots of Salvation", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 24, 41840, "", "=q4=Furious Gladiator's Armwraps of Triumph", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 25, 41832, "", "=q4=Furious Gladiator's Belt of Triumph", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 26, 41836, "", "=q4=Furious Gladiator's Boots of Triumph", "=ds=", "62000 #faction# #reqrating# 1500"};
		Next = "PvP80NonSet5";
		Prev = "PvP80NonSet3";
		Back = "PVP80NONSETEPICS";
	};

--Mail
	AtlasLoot_Data["PvP80NonSet5"] = {
		{ 1, 41064, "", "=q4=Deadly Gladiator's Wristguards of Dominance", "=ds=", "31600 #faction#"};
		{ 2, 41069, "", "=q4=Deadly Gladiator's Waistguard of Dominance", "=ds=", "49600 #faction#"};
		{ 3, 41074, "", "=q4=Deadly Gladiator's Sabatons of Dominance", "=ds=", "49600 #faction#"};
		{ 5, 41059, "", "=q4=Deadly Gladiator's Wristguards of Salvation", "=ds=", "31600 #faction#"};
		{ 6, 41048, "", "=q4=Deadly Gladiator's Waistguard of Salvation", "=ds=", "49600 #faction#"};
		{ 7, 41054, "", "=q4=Deadly Gladiator's Sabatons of Salvation", "=ds=", "49600 #faction#"};
		{ 9, 41224, "", "=q4=Deadly Gladiator's Wristguards of Triumph", "=ds=", "31600 #faction#"};
		{ 10, 41234, "", "=q4=Deadly Gladiator's Waistguard of Triumph", "=ds=", "49600 #faction#"};
		{ 11, 41229, "", "=q4=Deadly Gladiator's Sabatons of Triumph", "=ds=", "49600 #faction#"};
		{ 16, 41065, "", "=q4=Furious Gladiator's Wristguards of Dominance", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 17, 41070, "", "=q4=Furious Gladiator's Waistguard of Dominance", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 18, 41075, "", "=q4=Furious Gladiator's Sabatons of Dominance", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 20, 41060, "", "=q4=Furious Gladiator's Wristguards of Salvation", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 21, 41051, "", "=q4=Furious Gladiator's Waistguard of Salvation", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 22, 41055, "", "=q4=Furious Gladiator's Sabatons of Salvation", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 24, 41225, "", "=q4=Furious Gladiator's Wristguards of Triumph", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 25, 41235, "", "=q4=Furious Gladiator's Waistguard of Triumph", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 26, 41230, "", "=q4=Furious Gladiator's Sabatons of Triumph", "=ds=", "62000 #faction# #reqrating# 1500"};
		Next = "PvP80NonSet6";
		Prev = "PvP80NonSet4";
		Back = "PVP80NONSETEPICS";
	};

--Plate
	AtlasLoot_Data["PvP80NonSet6"] = {
		{ 1, 40982, "", "=q4=Deadly Gladiator's Bracers of Salvation", "=ds=", "31600 #faction#"};
		{ 2, 40974, "", "=q4=Deadly Gladiator's Girdle of Salvation", "=ds=", "49600 #faction#"};
		{ 3, 40975, "", "=q4=Deadly Gladiator's Greaves of Salvation", "=ds=", "49600 #faction#"};
		{ 5, 40888, "", "=q4=Deadly Gladiator's Bracers of Triumph", "=ds=", "31600 #faction#"};
		{ 6, 40879, "", "=q4=Deadly Gladiator's Girdle of Triumph", "=ds=", "49600 #faction#"};
		{ 7, 40880, "", "=q4=Deadly Gladiator's Greaves of Triumph", "=ds=", "49600 #faction#"};
		{ 16, 40983, "", "=q4=Furious Gladiator's Bracers of Salvation", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 17, 40976, "", "=q4=Furious Gladiator's Girdle of Salvation", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 18, 40977, "", "=q4=Furious Gladiator's Greaves of Salvation", "=ds=", "62000 #faction# #reqrating# 1500"};
		{ 20, 40889, "", "=q4=Furious Gladiator's Bracers of Triumph", "=ds=", "39400 #faction# #reqrating# 1400"};
		{ 21, 40881, "", "=q4=Furious Gladiator's Girdle of Triumph", "=ds=", "62000 #faction# #reqrating# 1450"};
		{ 22, 40882, "", "=q4=Furious Gladiator's Greaves of Triumph", "=ds=", "62000 #faction# #reqrating# 1500"};
		Prev = "PvP80NonSet5";
		Back = "PVP80NONSETEPICS";
	};

    --[[
		--------------------------------
		--- Savage Gladiator Weapons ---
		--------------------------------

	AtlasLoot_Data["PvP80Weapons1"] = {
		{ 1, 42294, "", "=q3=Savage Gladiator's Decapitator", "=ds=#h2#, #w1#", "0 #faction#", ""};
		{ 2, 42295, "", "=q3=Savage Gladiator's Bonegrinder", "=ds=#h2#, #w6#", "0 #faction#", ""};
		{ 3, 42297, "", "=q3=Savage Gladiator's Greatsword", "=ds=#h2#, #w10#", "0 #faction#", ""};
		{ 4, 42445, "", "=q3=Savage Gladiator's Longbow", "=ds=#w2#", "0 #faction#", ""};
		{ 5, 42343, "", "=q3=Savage Gladiator's Spellblade", "=ds=#h3#, #w10#", "0 #faction#", ""};
		{ 6, 42356, "", "=q3=Savage Gladiator's Battle Staff", "=ds=#w9#", "0 #faction#", ""};
		{ 7, 42448, "", "=q3=Savage Gladiator's Touch of Defeat", "=ds=#w12#", "0 #faction#", ""};
		{ 8, 42446, "", "=q3=Savage Gladiator's Heavy Crossbow", "=ds=#w3#", "0 #faction#", ""};
		{ 9, 42213, "", "=q3=Savage Gladiator's Hacker", "=ds=#h4#, #w1#", "0 #faction#", ""};
		{ 10, 42217, "", "=q3=Savage Gladiator's Shiv", "=ds=#h4#, #w4#", "0 #faction#", ""};
		{ 11, 42220, "", "=q3=Savage Gladiator's Left Ripper", "=ds=#h4#, #w13#", "0 #faction#", ""};
		{ 12, 42221, "", "=q3=Savage Gladiator's Bonecracker", "=ds=#h4#, #w6#", "0 #faction#", ""};
		{ 13, 42223, "", "=q3=Savage Gladiator's Quickblade", "=ds=#h4#, #w10#", "0 #faction#", ""};
		{ 14, 42447, "", "=q3=Savage Gladiator's Rifle", "=ds=#w5#", "0 #faction#", ""};
		{ 15, 42557, "", "=q3=Savage Gladiator's Barrier", "=ds=#w8#", "0 #faction#", ""};
		{ 16, 42568, "", "=q3=Savage Gladiator's Redoubt", "=ds=#w8#", "0 #faction#", ""};
		{ 17, 42344, "", "=q3=Savage Gladiator's Gavel", "=ds=#h3#, #w6#", "0 #faction#", ""};
		{ 18, 42296, "", "=q3=Savage Gladiator's Pike", "=ds=#h2#, #w7#", "0 #faction#", ""};
		{ 19, 42206, "", "=q3=Savage Gladiator's Cleaver", "=ds=#h1#, #w1#", "0 #faction#", ""};
		{ 20, 42216, "", "=q3=Savage Gladiator's Shanker", "=ds=#h1#, #w4#", "0 #faction#", ""};
		{ 21, 42222, "", "=q3=Savage Gladiator's Pummeler", "=ds=#h1#, #w6#", "0 #faction#", ""};
		{ 22, 42224, "", "=q3=Savage Gladiator's Slicer", "=ds=#h1#, #w10#", "0 #faction#", ""};
		{ 23, 42218, "", "=q3=Savage Gladiator's Right Ripper", "=ds=#h3#, #w13#", "0 #faction#", ""};
		{ 24, 42212, "", "=q3=Savage Gladiator's Chopper", "=ds=#h4#, #w1#", "0 #faction#", ""};
		{ 25, 42214, "", "=q3=Savage Gladiator's Waraxe", "=ds=#h4#, #w4#", "0 #faction#", ""};
		{ 26, 42219, "", "=q3=Savage Gladiator's Left Render", "=ds=#h4#, #w13#", "0 #faction#", ""};
		{ 27, 42517, "", "=q3=Savage Gladiator's Piercing Touch", "=ds=#w12#", "0 #faction#", ""};
		{ 28, 42511, "", "=q3=Savage Gladiator's Baton of Light", "=ds=#w12#", "0 #faction#", ""};
		{ 29, 42556, "", "=q3=Savage Gladiator's Shield Wall", "=ds=#w8#", "0 #faction#", ""};
		{ 30, 42444, "", "=q3=Savage Gladiator's War Edge", "=ds=#w11#", "0 #faction#", ""};
		Next = "PvP80Weapons2";
		Back = "LEVEL80PVPREWARDS";
	};

	AtlasLoot_Data["PvP80Weapons2"] = {
		{ 1, 42618, "", "=q3=Savage Gladiator's Sigil of Strife", "=ds=#s16#", "0 #faction#", ""};
		{ 2, 42574, "", "=q3=Savage Gladiator's Idol of Resolve", "=ds=#s16#", "0 #faction#", ""};
		{ 3, 42575, "", "=q3=Savage Gladiator's Idol of Steadfastness", "=ds=#s16#", "0 #faction#", ""};
		{ 4, 42576, "", "=q3=Savage Gladiator's Idol of Tenacity", "=ds=#s16#", "0 #faction#", ""};
		{ 5, 42612, "", "=q3=Savage Gladiator's Libram of Justice", "=ds=#s16#", "0 #faction#", ""};
		{ 6, 42611, "", "=q3=Savage Gladiator's Libram of Fortitude", "=ds=#s16#", "0 #faction#", ""};
		{ 7, 42595, "", "=q3=Savage Gladiator's Totem of the Third Wind", "=ds=#s16#", "0 #faction#", ""};
		{ 8, 42593, "", "=q3=Savage Gladiator's Totem of Indomitability", "=ds=#s16#", "0 #faction#", ""};
		{ 9, 42594, "", "=q3=Savage Gladiator's Totem of Survival", "=ds=#s16#", "0 #faction#", ""};
		Prev = "PvP80Weapons1";
		Back = "LEVEL80PVPREWARDS";
	};

		--------------------------------
		--- Deadly Gladiator Weapons ---
		--------------------------------

	AtlasLoot_Data["DeadlyGladiatorWeapons1"] = {
		{ 1, 42260, "", "=q4=Deadly Gladiator's Right Ripper", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 2, 42270, "", "=q4=Deadly Gladiator's Left Ripper", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 3, 42265, "", "=q4=Deadly Gladiator's Left Render", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 4, 42346, "", "=q4=Deadly Gladiator's Spellblade", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 5, 42255, "", "=q4=Deadly Gladiator's Mutilator", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 6, 42248, "", "=q4=Deadly Gladiator's Shiv", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 7, 42242, "", "=q4=Deadly Gladiator's Shanker", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 8, 42290, "", "=q4=Deadly Gladiator's Quickblade", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 9, 42285, "", "=q4=Deadly Gladiator's Slicer", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 10, 42332, "", "=q4=Deadly Gladiator's Greatsword", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 11, 42237, "", "=q4=Deadly Gladiator's Waraxe", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 12, 42208, "", "=q4=Deadly Gladiator's Cleaver", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 13, 42232, "", "=q4=Deadly Gladiator's Chopper", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 14, 42227, "", "=q4=Deadly Gladiator's Hacker", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 15, 42317, "", "=q4=Deadly Gladiator's Decapitator", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 16, 42352, "", "=q4=Deadly Gladiator's Gavel", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 17, 42280, "", "=q4=Deadly Gladiator's Bonecracker", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 18, 42275, "", "=q4=Deadly Gladiator's Pummeler", "=ds=", "3150 #arena# #reqrating# 2030"};
		{ 19, 42322, "", "=q4=Deadly Gladiator's Bonegrinder", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 20, 42327, "", "=q4=Deadly Gladiator's Pike", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 21, 42362, "", "=q4=Deadly Gladiator's Battle Staff", "4500 #arena# #reqrating# 2030"};
		{ 22, 42384, "", "=q4=Deadly Gladiator's Energy Staff", "4500 #arena# #reqrating# 2030"};
		{ 23, 44420, "", "=q4=Deadly Gladiator's Focus Staff", "4500 #arena# #reqrating# 2030"};
		{ 24, 44419, "", "=q4=Deadly Gladiator's War Staff", "4500 #arena# #reqrating# 2030"};
		Next = "DeadlyGladiatorWeapons2";
		Back = "LEVEL80PVPREWARDS";
	};

	AtlasLoot_Data["DeadlyGladiatorWeapons2"] = {
		{ 1, 42564, "", "=q4=Deadly Gladiator's Barrier", "=ds=", "2250 #arena# #reqrating# 2030"};
		{ 2, 42570, "", "=q4=Deadly Gladiator's Redoubt", "=ds=", "2250 #arena# #reqrating# 2030"};
		{ 3, 42559, "", "=q4=Deadly Gladiator's Shield Wall", "=ds=", "2250 #arena# #reqrating# 2030"};
		{ 4, 42450, "", "=q4=Deadly Gladiator's War Edge", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 5, 42490, "", "=q4=Deadly Gladiator's Longbow", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 6, 42495, "", "=q4=Deadly Gladiator's Heavy Crossbow", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 7, 42485, "", "=q4=Deadly Gladiator's Rifle", "=ds=", "4500 #arena# #reqrating# 2030"};
		{ 8, 42513, "", "=q4=Deadly Gladiator's Baton of Light", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 9, 42519, "", "=q4=Deadly Gladiator's Piercing Touch", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 10, 42502, "", "=q4=Deadly Gladiator's Touch of Defeat", "=ds=", "1200 #arena# #reqrating# 2030"};
		{ 11, 42525, "", "=q4=Deadly Gladiator's Endgame", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 12, 42537, "", "=q4=Deadly Gladiator's Grimoire", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 13, 42531, "", "=q4=Deadly Gladiator's Reprieve", "=ds=", "1350 #arena# #reqrating# 2030"};
		{ 16, 42588, "", "=q4=Deadly Gladiator's Idol of Resolve", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 17, 42583, "", "=q4=Deadly Gladiator's Idol of Steadfastness", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 18, 42578, "", "=q4=Deadly Gladiator's Idol of Tenacity", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 19, 42852, "", "=q4=Deadly Gladiator's Libram of Fortitude", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 20, 42614, "", "=q4=Deadly Gladiator's Libram of Justice", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 21, 42620, "", "=q4=Deadly Gladiator's Sigil of Strife", "=ds=", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 22, 42607, "", "=q4=Deadly Gladiator's Totem of Indomitability", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 23, 42602, "", "=q4=Deadly Gladiator's Totem of Survival", "6400 #faction# 350 #arena# #reqrating# 1250"};
		{ 24, 42597, "", "=q4=Deadly Gladiator's Totem of the Third Wind", "6400 #faction# 350 #arena# #reqrating# 1250"};
		Prev = "DeadlyGladiatorWeapons1";
		Back = "LEVEL80PVPREWARDS";
	};
]]

		---------------------------------
		--- Furious Gladiator Weapons ---
		---------------------------------

	AtlasLoot_Data["FuriousGladiatorWeapons1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Low Level"], ""};
		{ 2, 42261, "", "=q4=Furious Gladiator's Right Ripper", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 3, 42266, "", "=q4=Furious Gladiator's Left Render", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 4, 42271, "", "=q4=Furious Gladiator's Left Ripper", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 5, 42347, "", "=q4=Furious Gladiator's Spellblade", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 6, 42243, "", "=q4=Furious Gladiator's Shanker", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 7, 42256, "", "=q4=Furious Gladiator's Mutilator", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 8, 42249, "", "=q4=Furious Gladiator's Shiv", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 9, 42286, "", "=q4=Furious Gladiator's Slicer", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 10, 42291, "", "=q4=Furious Gladiator's Quickblade", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 11, 42333, "", "=q4=Furious Gladiator's Greatsword", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 12, 42209, "", "=q4=Furious Gladiator's Cleaver", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 13, 42233, "", "=q4=Furious Gladiator's Dicer", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 14, 42228, "", "=q4=Furious Gladiator's Splitter", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 15, 42318, "", "=q4=Furious Gladiator's Decapitator", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["High Level"], ""};
		{ 17, 45969, "", "=q4=Furious Gladiator's Grasp", "=ds=", "3000 #arena# #reqrating# 2200"};
		{ 18, 45968, "", "=q4=Furious Gladiator's Left Claw", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 19, 45963, "", "=q4=Furious Gladiator's Left Razor", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 20, 45970, "", "=q4=Furious Gladiator's Mageblade", "=ds=", "3585 #arena# #reqrating# 2200"};
		{ 21, 45958, "", "=q4=Furious Gladiator's Spike", "=ds=", "3000 #arena# #reqrating# 2200"};
		{ 22, 45962, "", "=q4=Furious Gladiator's Dirk", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 23, 45967, "", "=q4=Furious Gladiator's Eviscerator", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 24, 45960, "", "=q4=Furious Gladiator's Longblade", "=ds=", "3000 #arena# #reqrating# 2200"};
		{ 25, 45965, "", "=q4=Furious Gladiator's Swiftblade", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 26, 45950, "", "=q4=Furious Gladiator's Claymore", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 27, 45957, "", "=q4=Furious Gladiator's Handaxe", "=ds=", "3000 #arena# #reqrating# 2200"};
		{ 28, 45961, "", "=q4=Furious Gladiator's Dicer", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 29, 45966, "", "=q4=Furious Gladiator's Splitter", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 30, 45948, "", "=q4=Furious Gladiator's Sunderer", "=ds=", "4250 #arena# #reqrating# 2200"};
		Next = "FuriousGladiatorWeapons2";
		Back = "LEVEL80PVPREWARDS";
	};

	AtlasLoot_Data["FuriousGladiatorWeapons2"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Low Level"], ""};
		{ 2, 42353, "", "=q4=Furious Gladiator's Gavel", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 3, 42276, "", "=q4=Furious Gladiator's Pummeler", "=ds=", "35000 #faction# 1200 #arena# #reqrating# 1850"};
		{ 4, 42281, "", "=q4=Furious Gladiator's Bonecracker", "=ds=", "1100 #arena# #reqrating# 1850"};
		{ 5, 42323, "", "=q4=Furious Gladiator's Bonegrinder", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 6, 42328, "", "=q4=Furious Gladiator's Pike", "=ds=", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 7, 42364, "", "=q4=Furious Gladiator's Battle Staff", "=ds=", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 8, 42385, "", "=q4=Furious Gladiator's Energy Staff", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 9, 44422, "", "=q4=Furious Gladiator's Focus Staff", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 10, 42391, "", "=q4=Furious Gladiator's Staff", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 11, 44421, "", "=q4=Furious Gladiator's War Staff", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 12, 42491, "", "=q4=Furious Gladiator's Longbow", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 13, 42496, "", "=q4=Furious Gladiator's Heavy Crossbow", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 14, 42486, "", "=q4=Furious Gladiator's Rifle", "=ds=", "50000 #faction# 1400 #arena# #reqrating# 1850"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["High Level"], ""};
		{ 17, 45971, "", "=q4=Furious Gladiator's Salvation", "=ds=", "3585 #arena# #reqrating# 2200"};
		{ 18, 45959, "", "=q4=Furious Gladiator's Truncheon", "=ds=", "3000 #arena# #reqrating# 2200"};
		{ 19, 45964, "", "=q4=Furious Gladiator's Punisher", "=ds=", "1245 #arena# #reqrating# 2200"};
		{ 20, 45949, "", "=q4=Furious Gladiator's Crusher", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 21, 45951, "", "=q4=Furious Gladiator's Halberd", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 22, 45954, "", "=q4=Furious Gladiator's Acute Staff", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 23, 45953, "", "=q4=Furious Gladiator's Combat Staff", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 24, 45952, "", "=q4=Furious Gladiator's Greatstaff", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 25, 45956, "", "=q4=Furious Gladiator's Light Staff", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 26, 45955, "", "=q4=Furious Gladiator's Skirmish Staff", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 27, 45938, "", "=q4=Furious Gladiator's Recurve", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 28, 45939, "", "=q4=Furious Gladiator's Repeater", "=ds=", "4250 #arena# #reqrating# 2200"};
		{ 29, 45937, "", "=q4=Furious Gladiator's Shotgun", "=ds=", "4250 #arena# #reqrating# 2200"};
		Prev = "FuriousGladiatorWeapons1";
		Next = "FuriousGladiatorWeapons3";
		Back = "LEVEL80PVPREWARDS";
	};

	AtlasLoot_Data["FuriousGladiatorWeapons3"] = {
		{ 1, 42565, "", "=q4=Furious Gladiator's Barrier", "1950 #arena# #reqrating# 1850"};
		{ 2, 42571, "", "=q4=Furious Gladiator's Redoubt", "1950 #arena# #reqrating# 1850"};
		{ 3, 42560, "", "=q4=Furious Gladiator's Shield Wall", "1950 #arena# #reqrating# 1850"};
		{ 4, 42451, "", "=q4=Furious Gladiator's War Edge", "1150 #arena# #reqrating# 1950"};
		{ 5, 42514, "", "=q4=Furious Gladiator's Baton of Light", "1150 #arena# #reqrating# 1950"};
		{ 6, 42520, "", "=q4=Furious Gladiator's Piercing Touch", "1150 #arena# #reqrating# 1950"};
		{ 7, 42503, "", "=q4=Furious Gladiator's Touch of Defeat", "1150 #arena# #reqrating# 1950"};
		{ 8, 42526, "", "=q4=Furious Gladiator's Endgame", "1100 #arena# #reqrating# 1850"};
		{ 9, 42538, "", "=q4=Furious Gladiator's Grimoire", "1100 #arena# #reqrating# 1850"};
		{ 10, 42532, "", "=q4=Furious Gladiator's Reprieve", "1100 #arena# #reqrating# 1850"};
		{ 11, 42589, "", "=q4=Furious Gladiator's Idol of Resolve", "1150 #arena# #reqrating# 1950"};
		{ 12, 42584, "", "=q4=Furious Gladiator's Idol of Steadfastness", "1150 #arena# #reqrating# 1950"};
		{ 13, 42579, "", "=q4=Furious Gladiator's Idol of Tenacity", "1150 #arena# #reqrating# 1950"};
		{ 14, 42853, "", "=q4=Furious Gladiator's Libram of Fortitude", "1150 #arena# #reqrating# 1950"};
		{ 15, 42615, "", "=q4=Furious Gladiator's Libram of Justice", "1150 #arena# #reqrating# 1950"};
		{ 16, 42621, "", "=q4=Furious Gladiator's Sigil of Strife", "1150 #arena# #reqrating# 1950"};
		{ 17, 42608, "", "=q4=Furious Gladiator's Totem of Indomitability", "1150 #arena# #reqrating# 1950"};
		{ 18, 42603, "", "=q4=Furious Gladiator's Totem of Survival", "1150 #arena# #reqrating# 1950"};
		{ 19, 42598, "", "=q4=Furious Gladiator's Totem of the Third Wind", "1150 #arena# #reqrating# 1950"};
		Prev = "FuriousGladiatorWeapons2";
		Back = "LEVEL80PVPREWARDS";
	};

		------------------------------------------
		--- PvP Jewelcrafting Designs and Gems ---
		------------------------------------------

	AtlasLoot_Data["PvP80Jewelcrafting"] = {
		{ 1, 41563, "", "=q2=Design: Durable Huge Citrine", "=ds=#p12# (350)", "1250 #faction#"};
		{ 2, 41564, "", "=q2=Design: Empowered Huge Citrine", "=ds=#p12# (350)", "1250 #faction#"};
		{ 3, 41565, "", "=q2=Design: Lucent Huge Citrine", "=ds=#p12# (350)", "1250 #faction#"};
		{ 4, 41575, "", "=q2=Design: Mysterious Shadow Crystal", "=ds=#p12# (350)", "1250 #faction#"};
		{ 5, 41559, "", "=q2=Design: Mystic Sun Crystal", "=ds=#p12# (350)", "1250 #faction#"};
		{ 6, 41573, "", "=q2=Design: Opaque Dark Jade", "=ds=#p12# (350)", "1250 #faction#"};
		{ 7, 41566, "", "=q2=Design: Resplendent Huge Citrine", "=ds=#p12# (350)", "1250 #faction#"};
		{ 8, 41569, "", "=q2=Design: Shattered Dark Jade", "=ds=#p12# (350)", "1250 #faction#"};
		{ 9, 41572, "", "=q2=Design: Steady Dark Jade", "=ds=#p12# (350)", "1250 #faction#"};
		{ 10, 41560, "", "=q2=Design: Stormy Chalcedony", "=ds=#p12# (350)", "1250 #faction#"};
		{ 11, 41570, "", "=q2=Design: Tense Dark Jade", "=ds=#p12# (350)", "1250 #faction#"};
		{ 12, 41571, "", "=q2=Design: Turbid Dark Jade", "=ds=#p12# (350)", "1250 #faction#"};
		{ 16, 36921, "", "=q3=Autumn's Glow", "=ds=#e7#", "10000 #faction#"};
		{ 17, 36933, "", "=q3=Forest Emerald", "=ds=#e7#", "10000 #faction#"};
		{ 18, 36930, "", "=q3=Monarch Topaz", "=ds=#e7#", "10000 #faction#"};
		{ 19, 36918, "", "=q3=Scarlet Ruby", "=ds=#e7#", "10000 #faction#"};
		{ 20, 36924, "", "=q3=Sky Sapphire", "=ds=#e7#", "10000 #faction#"};
		{ 21, 36927, "", "=q3=Twilight Opal", "=ds=#e7#", "10000 #faction#"};
		Back = "LEVEL80PVPREWARDS";
	};

		--------------------------------
		--- World PvP - Wintergrasp  ---
		--------------------------------

	AtlasLoot_Data["LakeWintergrasp1"] = {
		{ 1, 46083, "", "=q4=Titan-forged Rune of Accuracy", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 2, 46085, "", "=q4=Titan-forged Rune of Alacrity", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 3, 46081, "", "=q4=Titan-forged Rune of Audacity", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 4, 46084, "", "=q4=Titan-forged Rune of Cruelty", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 5, 46082, "", "=q4=Titan-forged Rune of Determination", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 7, 43956, "", "=q4=Reins of the Black War Mammoth", "=ds=#e12#", "300 #wintergrasp#"};
		{ 8, 44077, "", "=q4=Reins of the Black War Mammoth", "=ds=#e12#", "300 #wintergrasp#"};
		{ 16, 44914, "", "=q4=Anvil of Titans", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 17, 44912, "", "=q4=Flow of Knowledge", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 18, 46086, "", "=q4=Platinum Disks of Battle", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 19, 46088, "", "=q4=Platinum Disks of Swiftness", "=ds=#s14#", "25 #wintergraspmark#" };
		{ 20, 46087, "", "=q4=Platinum Disks of Sorcery", "=ds=#s14#", "25 #wintergraspmark#" };
		Next = "LakeWintergrasp2";
		Back = "WINTERGRASPMENU";
	};

	AtlasLoot_Data["LakeWintergrasp2"] = {
		{ 1, 44910, "", "=q4=Titan-forged Hood of Dominance", "=ds=#s1#, #a1#", "40 #wintergraspmark#" };
		{ 2, 46065, "", "=q4=Titan-forged Raiment of Dominance", "=ds=#s5#, #a1#", "40 #wintergraspmark#" };
		{ 3, 46079, "", "=q4=Titan-forged Cord of Dominance", "=ds=#s10#, #a1#", "15 #wintergraspmark#" };
		{ 4, 44899, "", "=q4=Titan-forged Slippers of Dominance", "=ds=#s12#, #a1#", "15 #wintergraspmark#" };
		{ 6, 44909, "", "=q4=Titan-forged Hood of Salvation", "=ds=#s1#, #a1#", "40 #wintergraspmark#" };
		{ 7, 46066, "", "=q4=Titan-forged Raiment of Salvation", "=ds=#s5#, #a1#", "40 #wintergraspmark#" };
		{ 8, 46080, "", "=q4=Titan-forged Cord of Salvation", "=ds=#s10#, #a1#", "15 #wintergraspmark#" };
		{ 9, 44900, "", "=q4=Titan-forged Slippers of Salvation", "=ds=#s12#, #a1#", "15 #wintergraspmark#" };
		{ 16, 44907, "", "=q4=Titan-forged Leather Helm of Dominance", "=ds=#s1#, #a2#", "40 #wintergraspmark#" };
		{ 17, 46064, "", "=q4=Titan-forged Leather Chestguard of Dominance", "=ds=#s5#, #a2#", "40 #wintergraspmark#" };
		{ 18, 46076, "", "=q4=Titan-forged Belt of Dominance", "=ds=#s10#, #a2#", "15 #wintergraspmark#" };
		{ 19, 44891, "", "=q4=Titan-forged Boots of Dominance", "=ds=#s12#, #a2#", "15 #wintergraspmark#" };
		{ 21, 44906, "", "=q4=Titan-forged Leather Helm of Salvation", "=ds=#s1#, #a2#", "40 #wintergraspmark#" };
		{ 22, 46063, "", "=q4=Titan-forged Leather Chestguard of Salvation", "=ds=#s5#, #a2#", "40 #wintergraspmark#" };
		{ 23, 46077, "", "=q4=Titan-forged Belt of Salvation", "=ds=#s10#, #a2#", "15 #wintergraspmark#" };
		{ 24, 44892, "", "=q4=Titan-forged Boots of Salvation", "=ds=#s12#, #a2#", "15 #wintergraspmark#" };
		{ 26, 44908, "", "=q4=Titan-forged Leather Helm of Triumph", "=ds=#s1#, #a2#", "40 #wintergraspmark#" };
		{ 27, 46062, "", "=q4=Titan-forged Leather Tunic of Triumph", "=ds=#s5#, #a2#", "40 #wintergraspmark#" };
		{ 28, 46078, "", "=q4=Titan-forged Belt of Triumph", "=ds=#s10#, #a2#", "15 #wintergraspmark#" };
		{ 29, 44893, "", "=q4=Titan-forged Boots of Triumph", "=ds=#s12#, #a2#", "15 #wintergraspmark#" };
		Prev = "LakeWintergrasp1";
		Next = "LakeWintergrasp3";
		Back = "WINTERGRASPMENU";
	};

	AtlasLoot_Data["LakeWintergrasp3"] = {
		{ 1, 44904, "", "=q4=Titan-forged Mail Helm of Dominance", "=ds=#s1#, #a3#", "40 #wintergraspmark#" };
		{ 2, 46061, "", "=q4=Titan-forged Mail Armor of Domination", "=ds=#s5#, #a3#", "40 #wintergraspmark#" };
		{ 3, 46073, "", "=q4=Titan-forged Waistguard of Dominance", "=ds=#s10#, #a3#", "15 #wintergraspmark#" };
		{ 4, 44896, "", "=q4=Titan-forged Sabatons of Dominance", "=ds=#s12#, #a3#", "15 #wintergraspmark#" };
		{ 6, 44905, "", "=q4=Titan-forged Ringmail Helm of Salvation", "=ds=#s1#, #a3#", "40 #wintergraspmark#" };
		{ 7, 46060, "", "=q4=Titan-forged Ringmail of Salvation", "=ds=#s5#, #a3#", "40 #wintergraspmark#" };
		{ 8, 46074, "", "=q4=Titan-forged Waistguard of Salvation", "=ds=#s10#, #a3#", "15 #wintergraspmark#" };
		{ 9, 44897, "", "=q4=Titan-forged Sabatons of Salvation", "=ds=#s12#, #a3#", "15 #wintergraspmark#" };
		{ 11, 44903, "", "=q4=Titan-forged Chain Helm of Triumph", "=ds=#s1#, #a3#", "40 #wintergraspmark#" };
		{ 12, 46059, "", "=q4=Titan-forged Chain Armor of Triumph", "=ds=#s5#, #a3#", "40 #wintergraspmark#" };
		{ 13, 46075, "", "=q4=Titan-forged Waistguard of Triumph", "=ds=#s10#, #a3#", "15 #wintergraspmark#" };
		{ 14, 44898, "", "=q4=Titan-forged Sabatons of Triumph", "=ds=#s12#, #a3#", "15 #wintergraspmark#" };
		{ 16, 44901, "", "=q4=Titan-forged Plate Headcover of Salvation", "=ds=#s1#, #a4#", "40 #wintergraspmark#" };
		{ 17, 46057, "", "=q4=Titan-forged Chestguard of Salvation", "=ds=#s5#, #a4#", "40 #wintergraspmark#" };
		{ 18, 46071, "", "=q4=Titan-forged Girdle of Salvation", "=ds=#s10#, #a4#", "15 #wintergraspmark#" };
		{ 19, 44894, "", "=q4=Titan-forged Greaves of Salvation", "=ds=#s12#, #a4#", "15 #wintergraspmark#" };
		{ 21, 44902, "", "=q4=Titan-forged Plate Helm of Triumph", "=ds=#s12#, #a4#", "40 #wintergraspmark#" };
		{ 22, 46058, "", "=q4=Titan-forged Breastplate of Triumph", "=ds=#s5#, #a4#", "40 #wintergraspmark#" };
		{ 23, 46072, "", "=q4=Titan-forged Girdle of Triumph", "=ds=#s10#, #a4#", "15 #wintergraspmark#" };
		{ 24, 44895, "", "=q4=Titan-forged Greaves of Triumph", "=ds=#s12#, #a4#", "15 #wintergraspmark#" };
		Prev = "LakeWintergrasp2";
		Next = "LakeWintergrasp4";
		Back = "WINTERGRASPMENU";
	};

	AtlasLoot_Data["LakeWintergrasp4"] = {
		{ 1, 44066, "", "=q4=Kharmaa's Grace", "=ds=#e7#", "20 #wintergrasp#"};
		{ 2, 44081, "", "=q3=Enigmatic Starflare Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 3, 44084, "", "=q3=Forlorn Starflare Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 4, 44082, "", "=q3=Impassive Starflare Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 5, 44076, "", "=q3=Swift Starflare Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 6, 44078, "", "=q3=Swift Starflare Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 7, 44087, "", "=q3=Persistent Earthshatter Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 8, 44088, "", "=q3=Powerful Earthshatter Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 9, 44089, "", "=q3=Trenchant Earthshatter Diamond", "=ds=#e7#", "15 #wintergrasp#"};
		{ 11, 44075, "", "=q3=Arcanum of Dominance", "=ds=#s1# #e17#", "40 #wintergrasp#"};
		{ 12, 44069, "", "=q3=Arcanum of Triumph", "=ds=#s1# #e17#", "40 #wintergrasp#"};
		{ 13, 44068, "", "=q3=Inscription of Dominance", "=ds=#s3# #e17#", "30 #wintergrasp#"};
		{ 14, 44067, "", "=q3=Inscription of Triumph", "=ds=#s3# #e17#", "30 #wintergrasp#"};
		{ 16, 41730, "", "=q3=Design: Durable Monarch Topaz", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 17, 41732, "", "=q3=Design: Empowered Monarch Topaz", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 18, 41733, "", "=q3=Design: Lucent Monarch Topaz", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 19, 41735, "", "=q3=Design: Shattered Forest Emerald", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 20, 41739, "", "=q3=Design: Opaque Forest Emerald", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 21, 41736, "", "=q3=Design: Tense Forest Emerald", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 22, 41738, "", "=q3=Design: Steady Forest Emerald", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 23, 41734, "", "=q3=Design: Resplendent Monarch Topaz", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 24, 41727, "", "=q3=Design: Mystic Autumn's Glow", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 25, 41740, "", "=q3=Design: Mysterious Twilight Opal", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 26, 41728, "", "=q3=Design: Stormy Sky Sapphire", "=ds=#p12# (390)", "12 #wintergrasp#"};
		{ 27, 41742, "", "=q3=Design: Enigmatic Skyflare Diamond", "=ds=#p12# (420)", "24 #wintergrasp#"};
		{ 28, 41743, "", "=q3=Design: Forlorn Skyflare Diamond", "=ds=#p12# (420)", "24 #wintergrasp#"};
		{ 29, 41744, "", "=q3=Design: Impassive Skyflare Diamond", "=ds=#p12# (420)", "24 #wintergrasp#"};
		Prev = "LakeWintergrasp3";
		Next = "LakeWintergrasp5";
		Back = "WINTERGRASPMENU";
	};

	AtlasLoot_Data["LakeWintergrasp5"] = {
		{ 1, 44107, "", "=q7=Exquisite Sunderseer Mantle", "=ds=#s3#, #a1#", "200 #wintergrasp#"};
		{ 2, 44103, "", "=q7=Exceptional Stormshroud Shoulders", "=ds=#s3#, #a2#", "200 #wintergrasp#"};
		{ 3, 44105, "", "=q7=Lasting Feralheart Spaulders", "=ds=#s3#, #a2#", "200 #wintergrasp#"};
		{ 4, 44102, "", "=q7=Aged Pauldrons of The Five Thunders", "=ds=#s3#, #a3#", "200 #wintergrasp#"};
		{ 5, 44101, "", "=q7=Prized Beastmaster's Mantle", "=ds=#s3#, #a3#", "200 #wintergrasp#"};
		{ 6, 44100, "", "=q7=Pristine Lightforge Spaulders", "=ds=#s3#, #a4#", "200 #wintergrasp#"};
		{ 7, 44099, "", "=q7=Strengthened Stockade Pauldrons", "=ds=#s3#, #a4#", "200 #wintergrasp#"};
		{ 8, 44098, "", "=q7=Inherited Insignia of the Alliance", "=ds=#s14#", "250 #wintergrasp#"};
		{ 9, 44097, "", "=q7=Inherited Insignia of the Horde", "=ds=#s14#", "250 #wintergrasp#"};
		{ 10, 44091, "", "=q7=Sharpened Scarlet Kris", "=ds=#h1#, #w4#", "200 #wintergrasp#"};
		{ 11, 44096, "", "=q7=Battleworn Thrash Blade", "=ds=#h1#, #w10#", "200 #wintergrasp#"};
		{ 12, 44092, "", "=q7=Reforged Truesilver Champion", "=ds=#h2#, #w10#", "325 #wintergrasp#"};
		{ 13, 44094, "", "=q7=The Blessed Hammer of Grace", "=ds=#h3#, #w6#", "250 #wintergrasp#"};
		{ 14, 44095, "", "=q7=Grand Staff of Jordan", "=ds=#w9#", "325 #wintergrasp#"};
		{ 15, 44093, "", "=q7=Upgraded Dwarven Hand Cannon", "=ds=#w5#", "325 #wintergrasp#"};
		{ 16, 44115, "", "=q7=Wintergrasp Commendation", "=ds=", "30 #wintergrasp#"};
		Prev = "LakeWintergrasp4";
		Back = "WINTERGRASPMENU";
	};

		-----------------------------------------------
		--- World PvP - Grizzly Hills: Venture Bay  ---
		-----------------------------------------------

	AtlasLoot_Data["VentureBay1"] = {
		{ 1, 38354, "", "=q3=Oil-Stained Tarp", "=ds=#s4#", "50 #venturecoin#"};
		{ 2, 38355, "", "=q3=Thick Goblin Back Protector ", "=ds=#s4#", "50 #venturecoin#"};
		{ 3, 38353, "", "=q3=Venture Bay Buccaneer's Cape", "=ds=#s4#", "50 #venturecoin#"};
		{ 4, 38358, "", "=q3=Arcane Revitalizer", "=ds=#s14#", "70 #venturecoin#"};
		{ 5, 38359, "", "=q3=Goblin Repetition Reducer", "=ds=#s14#", "70 #venturecoin#"};
		{ 6, 38357, "", "=q3=Sharpened Throwing Gizmo", "=ds=#w11#", "30 #venturecoin#"};
		{ 7, 38356, "", "=q3=Venture Battle Wand", "=ds=#w12#", "30 #venturecoin#"};
		{ 8, 38360, "", "=q3=Idol of Arcane Terror", "=ds=#w14#", "30 #venturecoin#"};
		{ 9, 38365, "", "=q3=Idol of Perspicacious Attacks", "=ds=#w14#", "30 #venturecoin#"};
		{ 10, 38366, "", "=q3=Idol of Pure Thoughts", "=ds=#w14#", "30 #venturecoin#"};
		{ 11, 38364, "", "=q3=Venture Co. Libram of Mostly Holy Deeds", "=ds=#w16#", "30 #venturecoin#"};
		{ 12, 38363, "", "=q3=Venture Co. Libram of Protection", "=ds=#w16#", "30 #venturecoin#"};
		{ 13, 38362, "", "=q3=Venture Co. Libram of Retribution", "=ds=#w16#", "30 #venturecoin#"};
		{ 15, 37836, "", "=q1=Venture Coin", "=ds=#m17#"};
		{ 16, 38368, "", "=q3=Totem of the Bay", "=ds=#w15#", "30 #venturecoin#"};
		{ 17, 38367, "", "=q3=Venture Co. Flame Slicer", "=ds=#w15#", "30 #venturecoin#"};
		{ 18, 38361, "", "=q3=Venture Co. Lightning Rod", "=ds=#w15#", "30 #venturecoin#"};
		{ 19, 40875, "", "=q3=Sigil of Arthritic Binding", "=ds=#w21#", "30 #venturecoin#"};
		{ 20, 40822, "", "=q3=Sigil of the Frozen Conscience", "=ds=#w21#", "30 #venturecoin#"};
		{ 21, 40867, "", "=q3=Sigil of the Wild Buck", "=ds=#w21#", "30 #venturecoin#"};
		Back = "PVPMENU";
	};

	--------------------------
	--- Sets & Collections ---
	--------------------------

		---------------------------------------
		--- Naxx Sets (T7)/Ulduar Sets (T8) ---
		---------------------------------------

	AtlasLoot_Data["NaxxDeathKnightDPS"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t7s10_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39619, "", "=q4=Heroes' Scourgeborne Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39621, "", "=q4=Heroes' Scourgeborne Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39617, "", "=q4=Heroes' Scourgeborne Battleplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39618, "", "=q4=Heroes' Scourgeborne Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39620, "", "=q4=Heroes' Scourgeborne Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t7s10_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40554, "", "=q4=Valorous Scourgeborne Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40557, "", "=q4=Valorous Scourgeborne Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40550, "", "=q4=Valorous Scourgeborne Battleplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40552, "", "=q4=Valorous Scourgeborne Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40556, "", "=q4=Valorous Scourgeborne Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t8s10_1#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45342, "", "=q4=Valorous Darkruned Helmet", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45344, "", "=q4=Valorous Darkruned Shoulderplates", "=ds="..BabbleBoss.Thorim};
		{ 19, 45340, "", "=q4=Valorous Darkruned Battleplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45341, "", "=q4=Valorous Darkruned Gauntlets", "=ds="..BabbleBoss.Freya};
		{ 21, 45343, "", "=q4=Valorous Darkruned Legplates", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#t8s10_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46115, "", "=q4=Conqueror's Darkruned Helmet", "=ds="..BabbleBoss.Thorim};
		{ 25, 46117, "", "=q4=Conqueror's Darkruned Shoulderplates", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46111, "", "=q4=Conqueror's Darkruned Battleplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46113, "", "=q4=Conqueror's Darkruned Gauntlets", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46116, "", "=q4=Conqueror's Darkruned Legplates", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxDeathKnightTank"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t7s10_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39625, "", "=q4=Heroes' Scourgeborne Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39627, "", "=q4=Heroes' Scourgeborne Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39623, "", "=q4=Heroes' Scourgeborne Chestguard", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39624, "", "=q4=Heroes' Scourgeborne Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39626, "", "=q4=Heroes' Scourgeborne Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t7s10_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40565, "", "=q4=Valorous Scourgeborne Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40568, "", "=q4=Valorous Scourgeborne Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40559, "", "=q4=Valorous Scourgeborne Chestguard", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40563, "", "=q4=Valorous Scourgeborne Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40567, "", "=q4=Valorous Scourgeborne Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t8s10_2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45336, "", "=q4=Valorous Darkruned Faceguard", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45339, "", "=q4=Valorous Darkruned Pauldrons", "=ds="..BabbleBoss.Thorim};
		{ 19, 45335, "", "=q4=Valorous Darkruned Chestguard", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45337, "", "=q4=Valorous Darkruned Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45338, "", "=q4=Valorous Darkruned Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Deathknight_DeathStrike", "=q6=#t8s10_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46120, "", "=q4=Conqueror's Darkruned Faceguard", "=ds="..BabbleBoss.Thorim};
		{ 25, 46122, "", "=q4=Conqueror's Darkruned Pauldrons", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46118, "", "=q4=Conqueror's Darkruned Chestguard", "=ds="..BabbleBoss.Hodir};
		{ 27, 46119, "", "=q4=Conqueror's Darkruned Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46121, "", "=q4=Conqueror's Darkruned Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxDruidFeral"] = {
		{ 1, 0, "Ability_Druid_Maul", "=q6=#t7s1_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39553, "", "=q4=Heroes' Dreamwalker Headguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39556, "", "=q4=Heroes' Dreamwalker Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39554, "", "=q4=Heroes' Dreamwalker Raiments", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39557, "", "=q4=Heroes' Dreamwalker Handgrips", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39555, "", "=q4=Heroes' Dreamwalker Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Ability_Druid_Maul", "=q6=#t7s1_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40473, "", "=q4=Valorous Dreamwalker Headguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40494, "", "=q4=Valorous Dreamwalker Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40471, "", "=q4=Valorous Dreamwalker Raiments", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40472, "", "=q4=Valorous Dreamwalker Handgrips", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40493, "", "=q4=Valorous Dreamwalker Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Ability_Druid_Maul", "=q6=#t8s1_2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45356, "", "=q4=Valorous Nightsong Headguard", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45359, "", "=q4=Valorous Nightsong Shoulderpads", "=ds="..BabbleBoss.Thorim};
		{ 19, 45358, "", "=q4=Valorous Nightsong Raiments", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45355, "", "=q4=Valorous Nightsong Handgrips", "=ds="..BabbleBoss.Freya};
		{ 21, 45357, "", "=q4=Valorous Nightsong Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Ability_Druid_Maul", "=q6=#t8s1_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46161, "", "=q4=Conqueror's Nightsong Headguard", "=ds="..BabbleBoss.Thorim};
		{ 25, 46157, "", "=q4=Conqueror's Nightsong Shoulderpads", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46159, "", "=q4=Conqueror's Nightsong Raiments", "=ds="..BabbleBoss.Hodir};
		{ 27, 46158, "", "=q4=Conqueror's Nightsong Handgrips", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46160, "", "=q4=Conqueror's Nightsong Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxDruidRestoration"] = {
		{ 1, 0, "Spell_Nature_Regeneration", "=q6=#t7s1_3#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39531, "", "=q4=Heroes' Dreamwalker Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39542, "", "=q4=Heroes' Dreamwalker Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39538, "", "=q4=Heroes' Dreamwalker Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39543, "", "=q4=Heroes' Dreamwalker Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39539, "", "=q4=Heroes' Dreamwalker Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Nature_Regeneration", "=q6=#t7s1_3#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40461, "", "=q4=Valorous Dreamwalker Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40465, "", "=q4=Valorous Dreamwalker Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40463, "", "=q4=Valorous Dreamwalker Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40460, "", "=q4=Valorous Dreamwalker Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40462, "", "=q4=Valorous Dreamwalker Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Nature_Regeneration", "=q6=#t8s1_3#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45346, "", "=q4=Valorous Nightsong Headpiece", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45349, "", "=q4=Valorous Nightsong Spaulders", "=ds="..BabbleBoss.Thorim};
		{ 19, 45348, "", "=q4=Valorous Nightsong Robe", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45345, "", "=q4=Valorous Nightsong Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45347, "", "=q4=Valorous Nightsong Leggings", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Nature_Regeneration", "=q6=#t8s1_3#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46184, "", "=q4=Conqueror's Nightsong Headpiece", "=ds="..BabbleBoss.Thorim};
		{ 25, 46187, "", "=q4=Conqueror's Nightsong Spaulders", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46186, "", "=q4=Conqueror's Nightsong Robe", "=ds="..BabbleBoss.Hodir};
		{ 27, 46183, "", "=q4=Conqueror's Nightsong Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46185, "", "=q4=Conqueror's Nightsong Leggings", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxDruidBalance"] = {
		{ 1, 0, "Spell_Nature_InsectSwarm", "=q6=#t7s1_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39545, "", "=q4=Heroes' Dreamwalker Cover", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39548, "", "=q4=Heroes' Dreamwalker Mantle", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39547, "", "=q4=Heroes' Dreamwalker Vestments", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39544, "", "=q4=Heroes' Dreamwalker Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39546, "", "=q4=Heroes' Dreamwalker Trousers", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Nature_InsectSwarm", "=q6=#t7s1_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40467, "", "=q4=Valorous Dreamwalker Cover", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40470, "", "=q4=Valorous Dreamwalker Mantle", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40469, "", "=q4=Valorous Dreamwalker Vestments", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40466, "", "=q4=Valorous Dreamwalker Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40468, "", "=q4=Valorous Dreamwalker Trousers", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Nature_InsectSwarm", "=q6=#t8s1_1#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 46313, "", "=q4=Valorous Nightsong Cover", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45352, "", "=q4=Valorous Nightsong Mantle", "=ds="..BabbleBoss.Thorim};
		{ 19, 45354, "", "=q4=Valorous Nightsong Vestments", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45351, "", "=q4=Valorous Nightsong Gloves", "=ds="..BabbleBoss.Freya};
		{ 21, 45353, "", "=q4=Valorous Nightsong Trousers", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Nature_InsectSwarm", "=q6=#t8s1_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46191, "", "=q4=Conqueror's Nightsong Cover", "=ds="..BabbleBoss.Thorim};
		{ 25, 46196, "", "=q4=Conqueror's Nightsong Mantle", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46194, "", "=q4=Conqueror's Nightsong Vestments", "=ds="..BabbleBoss.Hodir};
		{ 27, 46189, "", "=q4=Conqueror's Nightsong Gloves", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46192, "", "=q4=Conqueror's Nightsong Trousers", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxHunter"] = {
		{ 1, 0, "Ability_Hunter_RunningShot", "=q6=#t7s2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39578, "", "=q4=Heroes' Crypstalker Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39581, "", "=q4=Heroes' Crypstalker Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39579, "", "=q4=Heroes' Crypstalker Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39582, "", "=q4=Heroes' Crypstalker Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39580, "", "=q4=Heroes' Crypstalker Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Ability_Hunter_RunningShot", "=q6=#t7s2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40505, "", "=q4=Valorous Crypstalker Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40507, "", "=q4=Valorous Crypstalker Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40503, "", "=q4=Valorous Crypstalker Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40504, "", "=q4=Valorous Crypstalker Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40506, "", "=q4=Valorous Crypstalker Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Ability_Hunter_RunningShot", "=q6=#t8s2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45361, "", "=q4=Valorous Scourgestalker Headpiece", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45363, "", "=q4=Valorous Scourgestalker Spaulders", "=ds="..BabbleBoss.Thorim};
		{ 19, 45364, "", "=q4=Valorous Scourgestalker Tunic", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45360, "", "=q4=Valorous Scourgestalker Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45362, "", "=q4=Valorous Scourgestalker Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Ability_Hunter_RunningShot", "=q6=#t8s2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46143, "", "=q4=Conqueror's Deathbringer Headpiece", "=ds="..BabbleBoss.Thorim};
		{ 25, 46145, "", "=q4=Conqueror's Deathbringer Spaulders", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46141, "", "=q4=Conqueror's Deathbringer Tunic", "=ds="..BabbleBoss.Hodir};
		{ 27, 46142, "", "=q4=Conqueror's Deathbringer Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46144, "", "=q4=Conqueror's Deathbringer Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxMage"] = {
		{ 1, 0, "Spell_Frost_IceStorm", "=q6=#t7s3#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39491, "", "=q4=Heroes' Frostfire Circlet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39494, "", "=q4=Heroes' Frostfire Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39492, "", "=q4=Heroes' Frostfire Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39495, "", "=q4=Heroes' Frostfire Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39493, "", "=q4=Heroes' Frostfire Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Frost_IceStorm", "=q6=#t7s3#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40416, "", "=q4=Valorous Frostfire Circlet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40419, "", "=q4=Valorous Frostfire Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40418, "", "=q4=Valorous Frostfire Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40415, "", "=q4=Valorous Frostfire Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40417, "", "=q4=Valorous Frostfire Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Frost_IceStorm", "=q6=#t8s3#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45365, "", "=q4=Valorous Kirin'dor Hood", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45369, "", "=q4=Valorous Kirin'dor Shoulderpads", "=ds="..BabbleBoss.Thorim};
		{ 19, 45368, "", "=q4=Valorous Kirin'dor Tunic", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 46131, "", "=q4=Valorous Kirin'dor Gauntlets", "=ds="..BabbleBoss.Freya};
		{ 21, 45367, "", "=q4=Valorous Kirin'dor Leggings", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Frost_IceStorm", "=q6=#t8s3#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46129, "", "=q4=Conqueror's Kirin'dor Hood", "=ds="..BabbleBoss.Thorim};
		{ 25, 46134, "", "=q4=Conqueror's Kirin'dor Shoulderpads", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46130, "", "=q4=Conqueror's Kirin'dor Tunic", "=ds="..BabbleBoss.Hodir};
		{ 27, 46132, "", "=q4=Conqueror's Kirin'dor Gauntlets", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46133, "", "=q4=Conqueror's Kirin'dor Leggings", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxPaladinHoly"] = {
		{ 1, 0, "Spell_Holy_HolyBolt", "=q6=#t7s4_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39628, "", "=q4=Heroes' Redemption Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39631, "", "=q4=Heroes' Redemption Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39629, "", "=q4=Heroes' Redemption Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39632, "", "=q4=Heroes' Redemption Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39630, "", "=q4=Heroes' Redemption Greaves", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Holy_HolyBolt", "=q6=#t7s4_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40571, "", "=q4=Valorous Redemption Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40573, "", "=q4=Valorous Redemption Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40569, "", "=q4=Valorous Redemption Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40570, "", "=q4=Valorous Redemption Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40572, "", "=q4=Valorous Redemption Greaves", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Holy_HolyBolt", "=q6=#t8s4_1#", "=q5=("..AL["10 Man"]..")"};
		{ 17, 45372, "", "=q4=Valorous Aegis Headpiece", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45373, "", "=q4=Valorous Aegis Spaulders", "=ds="..BabbleBoss.Thorim};
		{ 19, 45374, "", "=q4=Valorous Aegis Tunic", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45370, "", "=q4=Valorous Aegis Gloves", "=ds="..BabbleBoss.Freya};
		{ 21, 45371, "", "=q4=Valorous Aegis Greaves", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Holy_HolyBolt", "=q6=#t8s4_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46180, "", "=q4=Conqueror's Aegis Headpiece", "=ds="..BabbleBoss.Thorim};
		{ 25, 46182, "", "=q4=Conqueror's Aegis Spaulders", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46178, "", "=q4=Conqueror's Aegis Tunic", "=ds="..BabbleBoss.Hodir};
		{ 27, 46179, "", "=q4=Conqueror's Aegis Gloves", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46181, "", "=q4=Conqueror's Aegis Greaves", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxPaladinRetribution"] = {
		{ 1, 0, "Spell_Holy_AuraOfLight", "=q6=#t7s4_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39635, "", "=q4=Heroes' Redemption Helm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39637, "", "=q4=Heroes' Redemption Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39633, "", "=q4=Heroes' Redemption Chestpiece", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39634, "", "=q4=Heroes' Redemption Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39636, "", "=q4=Heroes' Redemption Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Holy_AuraOfLight", "=q6=#t7s4_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40576, "", "=q4=Valorous Redemption Helm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40578, "", "=q4=Valorous Redemption Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40574, "", "=q4=Valorous Redemption Chestpiece", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40575, "", "=q4=Valorous Redemption Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40577, "", "=q4=Valorous Redemption Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Holy_AuraOfLight", "=q6=#t8s4_2#", "=q5=("..AL["10 Man"]..")"};
		{ 17, 45377, "", "=q4=Valorous Aegis Helm", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45380, "", "=q4=Valorous Aegis Shoulderplates", "=ds="..BabbleBoss.Thorim};
		{ 19, 45375, "", "=q4=Valorous Aegis Battleplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45376, "", "=q4=Valorous Aegis Gauntlets", "=ds="..BabbleBoss.Freya};
		{ 21, 45379, "", "=q4=Valorous Aegis Legplates", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Holy_AuraOfLight", "=q6=#t8s4_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46156, "", "=q4=Conqueror's Aegis Helm", "=ds="..BabbleBoss.Thorim};
		{ 25, 46152, "", "=q4=Conqueror's Aegis Shoulderplates", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46154, "", "=q4=Conqueror's Aegis Battleplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46155, "", "=q4=Conqueror's Aegis Gauntlets", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46153, "", "=q4=Conqueror's Aegis Legplates", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxPaladinProtection"] = {
		{ 1, 0, "Spell_Holy_SealOfMight", "=q6=#t7s4_3#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39640, "", "=q4=Heroes' Redemption Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39642, "", "=q4=Heroes' Redemption Shouldergards", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39638, "", "=q4=Heroes' Redemption Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39639, "", "=q4=Heroes' Redemption Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39641, "", "=q4=Heroes' Redemption Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Holy_SealOfMight", "=q6=#t7s4_3#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40581, "", "=q4=Valorous Redemption Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40584, "", "=q4=Valorous Redemption Shouldergards", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40579, "", "=q4=Valorous Redemption Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40580, "", "=q4=Valorous Redemption Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40583, "", "=q4=Valorous Redemption Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Holy_SealOfMight", "=q6=#t8s4_3#", "=q5=("..AL["10 Man"]..")"};
		{ 17, 45382, "", "=q4=Valorous Aegis Faceguard", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45385, "", "=q4=Valorous Aegis Shouldergards", "=ds="..BabbleBoss.Thorim};
		{ 19, 45381, "", "=q4=Valorous Aegis Breastplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45383, "", "=q4=Valorous Aegis Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45384, "", "=q4=Valorous Aegis Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Holy_SealOfMight", "=q6=#t8s4_3#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46175, "", "=q4=Conqueror's Aegis Faceguard", "=ds="..BabbleBoss.Thorim};
		{ 25, 46177, "", "=q4=Conqueror's Aegis Shouldergards", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46173, "", "=q4=Conqueror's Aegis Breastplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46174, "", "=q4=Conqueror's Aegis Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46176, "", "=q4=Conqueror's Aegis Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxPriestShadow"] = {
		{ 1, 0, "Spell_Shadow_AntiShadow", "=q6=#t7s5_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39521, "", "=q4=Heroes' Circlet of Faith", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39529, "", "=q4=Heroes' Mantle of Faith", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39523, "", "=q4=Heroes' Raiments of Faith", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39530, "", "=q4=Heroes' Handwraps of Faith", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39528, "", "=q4=Heroes' Pants of Faith", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Shadow_AntiShadow", "=q6=#t7s5_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40456, "", "=q4=Valorous Circlet of Faith", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40459, "", "=q4=Valorous Mantle of Faith", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40458, "", "=q4=Valorous Raiments of Faith", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40454, "", "=q4=Valorous Handwraps of Faith", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40457, "", "=q4=Valorous Pants of Faith", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Shadow_AntiShadow", "=q6=#t8s5_2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45391, "", "=q4=Valorous Circlet of Sanctification", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45393, "", "=q4=Valorous Mantle of Sanctification", "=ds="..BabbleBoss.Thorim};
		{ 19, 45395, "", "=q4=Valorous Raiments of Sanctification", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45392, "", "=q4=Valorous Handwraps of Sanctification", "=ds="..BabbleBoss.Freya};
		{ 21, 45394, "", "=q4=Valorous Pants of Sanctification", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Shadow_AntiShadow", "=q6=#t8s5_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46172, "", "=q4=Conqueror's Circlet of Sanctification", "=ds="..BabbleBoss.Thorim};
		{ 25, 46165, "", "=q4=Conqueror's Mantle of Sanctification", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46168, "", "=q4=Conqueror's Raiments of Sanctification", "=ds="..BabbleBoss.Hodir};
		{ 27, 46163, "", "=q4=Conqueror's Handwraps of Sanctification", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46170, "", "=q4=Conqueror's Pants of Sanctification", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxPriestHoly"] = {
		{ 1, 0, "Spell_Holy_PowerWordShield", "=q6=#t7s5_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39514, "", "=q4=Heroes' Crown of Faith", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39518, "", "=q4=Heroes' Shoulderpads of Faith", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39515, "", "=q4=Heroes' Robe of Faith", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39519, "", "=q4=Heroes' Gloves of Faith", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39517, "", "=q4=Heroes' Leggings of Faith", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Holy_PowerWordShield", "=q6=#t7s5_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40447, "", "=q4=Valorous Crown of Faith", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40450, "", "=q4=Valorous Shoulderpads of Faith", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40449, "", "=q4=Valorous Robe of Faith", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40445, "", "=q4=Valorous Gloves of Faith", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40448, "", "=q4=Valorous Leggings of Faith", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Holy_PowerWordShield", "=q6=#t8s5_1#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45386, "", "=q4=Valorous Cowl of Sanctification", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45390, "", "=q4=Valorous Shoulderpads of Sanctification", "=ds="..BabbleBoss.Thorim};
		{ 19, 45389, "", "=q4=Valorous Robe of Sanctification", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45387, "", "=q4=Valorous Gloves of Sanctification", "=ds="..BabbleBoss.Freya};
		{ 21, 45388, "", "=q4=Valorous Leggings of Sanctification", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Holy_PowerWordShield", "=q6=#t8s5_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46197, "", "=q4=Conqueror's Cowl of Sanctification", "=ds="..BabbleBoss.Thorim};
		{ 25, 46190, "", "=q4=Conqueror's Shoulderpads of Sanctification", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46193, "", "=q4=Conqueror's Robe of Sanctification", "=ds="..BabbleBoss.Hodir};
		{ 27, 46188, "", "=q4=Conqueror's Gloves of Sanctification", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46195, "", "=q4=Conqueror's Leggings of Sanctification", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxRogue"] = {
		{ 1, 0, "Ability_BackStab", "=q6=#t7s6#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39561, "", "=q4=Heroes' Bonescythe Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39565, "", "=q4=Heroes' Bonescythe Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39558, "", "=q4=Heroes' Bonescythe Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39560, "", "=q4=Heroes' Bonescythe Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39564, "", "=q4=Heroes' Bonescythe Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Ability_BackStab", "=q6=#t7s6#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40499, "", "=q4=Valorous Bonescythe Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40502, "", "=q4=Valorous Bonescythe Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40495, "", "=q4=Valorous Bonescythe Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40496, "", "=q4=Valorous Bonescythe Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40500, "", "=q4=Valorous Bonescythe Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Ability_BackStab", "=q6=#t8s6#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45398, "", "=q4=Valorous Terrorblade Helmet", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45400, "", "=q4=Valorous Terrorblade Pauldrons", "=ds="..BabbleBoss.Thorim};
		{ 19, 45396, "", "=q4=Valorous Terrorblade Breastplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45397, "", "=q4=Valorous Terrorblade Gauntlets", "=ds="..BabbleBoss.Freya};
		{ 21, 45399, "", "=q4=Valorous Terrorblade Legplates", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Ability_BackStab", "=q6=#t8s6#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46125, "", "=q4=Conqueror's Terrorblade Helmet", "=ds="..BabbleBoss.Thorim};
		{ 25, 46127, "", "=q4=Conqueror's Terrorblade Pauldrons", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46123, "", "=q4=Conqueror's Terrorblade Breastplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46124, "", "=q4=Conqueror's Terrorblade Gauntlets", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46126, "", "=q4=Conqueror's Terrorblade Legplates", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxShamanRestoration"] = {
		{ 1, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t7s7_3#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39583, "", "=q4=Heroes' Earthshatter Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39590, "", "=q4=Heroes' Earthshatter Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39588, "", "=q4=Heroes' Earthshatter Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39591, "", "=q4=Heroes' Earthshatter Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39589, "", "=q4=Heroes' Earthshatter Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t7s7_3#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40510, "", "=q4=Valorous Earthshatter Headpiece", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40513, "", "=q4=Valorous Earthshatter Spaulders", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40508, "", "=q4=Valorous Earthshatter Tunic", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40509, "", "=q4=Valorous Earthshatter Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40512, "", "=q4=Valorous Earthshatter Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t8s7_3#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45402, "", "=q4=Valorous Worldbreaker Headpiece", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45404, "", "=q4=Valorous Worldbreaker Spaulders", "=ds="..BabbleBoss.Thorim};
		{ 19, 45405, "", "=q4=Valorous Worldbreaker Tunic", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45401, "", "=q4=Valorous Worldbreaker Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45403, "", "=q4=Valorous Worldbreaker Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Nature_HealingWaveGreater", "=q6=#t8s7_3#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46201, "", "=q4=Conqueror's Worldbreaker Headpiece", "=ds="..BabbleBoss.Thorim};
		{ 25, 46204, "", "=q4=Conqueror's Worldbreaker Spaulders", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46198, "", "=q4=Conqueror's Worldbreaker Tunic", "=ds="..BabbleBoss.Hodir};
		{ 27, 46199, "", "=q4=Conqueror's Worldbreaker Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46202, "", "=q4=Conqueror's Worldbreaker Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxShamanEnhancement"] = {
		{ 1, 0, "Spell_FireResistanceTotem_01", "=q6=#t7s7_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39602, "", "=q4=Heroes' Earthshatter Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39604, "", "=q4=Heroes' Earthshatter Shoulderguards", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39597, "", "=q4=Heroes' Earthshatter Chestguard", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39601, "", "=q4=Heroes' Earthshatter Grips", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39603, "", "=q4=Heroes' Earthshatter War-Kilt", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_FireResistanceTotem_01", "=q6=#t7s7_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40521, "", "=q4=Valorous Earthshatter Faceguard", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40524, "", "=q4=Valorous Earthshatter Shoulderguards", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40523, "", "=q4=Valorous Earthshatter Chestguard", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40520, "", "=q4=Valorous Earthshatter Grips", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40522, "", "=q4=Valorous Earthshatter War-Kilt", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_FireResistanceTotem_01", "=q6=#t8s7_2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45412, "", "=q4=Valorous Worldbreaker Faceguard", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45415, "", "=q4=Valorous Worldbreaker Shoulderguards", "=ds="..BabbleBoss.Thorim};
		{ 19, 45413, "", "=q4=Valorous Worldbreaker Chestguard", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45414, "", "=q4=Valorous Worldbreaker Grips", "=ds="..BabbleBoss.Freya};
		{ 21, 45416, "", "=q4=Valorous Worldbreaker War-Kilt", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_FireResistanceTotem_01", "=q6=#t8s7_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46212, "", "=q4=Conqueror's Worldbreaker Faceguard", "=ds="..BabbleBoss.Thorim};
		{ 25, 46203, "", "=q4=Conqueror's Worldbreaker Shoulderguards", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46205, "", "=q4=Conqueror's Worldbreaker Chestguard", "=ds="..BabbleBoss.Hodir};
		{ 27, 46200, "", "=q4=Conqueror's Worldbreaker Grips", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46208, "", "=q4=Conqueror's Worldbreaker War-Kilt", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxShamanElemental"] = {
		{ 1, 0, "Spell_Nature_Lightning", "=q6=#t7s7_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39594, "", "=q4=Heroes' Earthshatter Helm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39596, "", "=q4=Heroes' Earthshatter Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39592, "", "=q4=Heroes' Earthshatter Hauberk", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39593, "", "=q4=Heroes' Earthshatter Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39595, "", "=q4=Heroes' Earthshatter Kilt", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Nature_Lightning", "=q6=#t7s7_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40516, "", "=q4=Valorous Earthshatter Helm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40518, "", "=q4=Valorous Earthshatter Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40514, "", "=q4=Valorous Earthshatter Hauberk", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40515, "", "=q4=Valorous Earthshatter Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40517, "", "=q4=Valorous Earthshatter Kilt", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Nature_Lightning", "=q6=#t8s7_1#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45408, "", "=q4=Valorous Worldbreaker Helm", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45410, "", "=q4=Valorous Worldbreaker Shoulderpads", "=ds="..BabbleBoss.Thorim};
		{ 19, 45411, "", "=q4=Valorous Worldbreaker Hauberk", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45406, "", "=q4=Valorous Worldbreaker Gloves", "=ds="..BabbleBoss.Freya};
		{ 21, 45409, "", "=q4=Valorous Worldbreaker Kilt", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Nature_Lightning", "=q6=#t8s7_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46209, "", "=q4=Conqueror's Worldbreaker Helm", "=ds="..BabbleBoss.Thorim};
		{ 25, 46211, "", "=q4=Conqueror's Worldbreaker Shoulderpads", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46206, "", "=q4=Conqueror's Worldbreaker Hauberk", "=ds="..BabbleBoss.Hodir};
		{ 27, 46207, "", "=q4=Conqueror's Worldbreaker Gloves", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46210, "", "=q4=Conqueror's Worldbreaker Kilt", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxWarlock"] = {
		{ 1, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t7s8#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39496, "", "=q4=Heroes' Plagueheart Circlet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39499, "", "=q4=Heroes' Plagueheart Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39497, "", "=q4=Heroes' Plagueheart Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39500, "", "=q4=Heroes' Plagueheart Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39498, "", "=q4=Heroes' Plagueheart Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t7s8#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40421, "", "=q4=Valorous Plagueheart Circlet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40424, "", "=q4=Valorous Plagueheart Shoulderpads", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40423, "", "=q4=Valorous Plagueheart Robe", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40420, "", "=q4=Valorous Plagueheart Gloves", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40422, "", "=q4=Valorous Plagueheart Leggings", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t8s8#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45417, "", "=q4=Valorous Deathbringer Hood", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45422, "", "=q4=Valorous Deathbringer Shoulderpads", "=ds="..BabbleBoss.Thorim};
		{ 19, 45421, "", "=q4=Valorous Deathbringer Robe", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45419, "", "=q4=Valorous Deathbringer Gloves", "=ds="..BabbleBoss.Freya};
		{ 21, 45420, "", "=q4=Valorous Deathbringer Leggings", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Spell_Shadow_CurseOfTounges", "=q6=#t8s8#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46140, "", "=q4=Conqueror's Deathbringer Hood", "=ds="..BabbleBoss.Thorim};
		{ 25, 46136, "", "=q4=Conqueror's Deathbringer Shoulderpads", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46137, "", "=q4=Conqueror's Deathbringer Robe", "=ds="..BabbleBoss.Hodir};
		{ 27, 46135, "", "=q4=Conqueror's Deathbringer Gloves", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46139, "", "=q4=Conqueror's Deathbringer Leggings", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxWarriorFury"] = {
		{ 1, 0, "Ability_Warrior_BattleShout", "=q6=#t7s9_1#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39605, "", "=q4=Heroes' Dreadnaught Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39608, "", "=q4=Heroes' Dreadnaught Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39606, "", "=q4=Heroes' Dreadnaught Battleplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39609, "", "=q4=Heroes' Dreadnaught Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39607, "", "=q4=Heroes' Dreadnaught Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "Ability_Warrior_BattleShout", "=q6=#t7s9_1#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40528, "", "=q4=Valorous Dreadnaught Helmet", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40530, "", "=q4=Valorous Dreadnaught Shoulderplates", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40525, "", "=q4=Valorous Dreadnaught Battleplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40527, "", "=q4=Valorous Dreadnaught Gauntlets", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40529, "", "=q4=Valorous Dreadnaught Legplates", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "Ability_Warrior_BattleShout", "=q6=#t8s9_1#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45431, "", "=q4=Valorous Siegebreaker Helmet", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45433, "", "=q4=Valorous Siegebreaker Shoulderplates", "=ds="..BabbleBoss.Thorim};
		{ 19, 45429, "", "=q4=Valorous Siegebreaker Battleplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45430, "", "=q4=Valorous Siegebreaker Gauntlets", "=ds="..BabbleBoss.Freya};
		{ 21, 45432, "", "=q4=Valorous Siegebreaker Legplates", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "Ability_Warrior_BattleShout", "=q6=#t8s9_1#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46151, "", "=q4=Conqueror's Siegebreaker Helmet", "=ds="..BabbleBoss.Thorim};
		{ 25, 46149, "", "=q4=Conqueror's Siegebreaker Shoulderplates", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46146, "", "=q4=Conqueror's Siegebreaker Battleplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46148, "", "=q4=Conqueror's Siegebreaker Gauntlets", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46150, "", "=q4=Conqueror's Siegebreaker Legplates", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

	AtlasLoot_Data["NaxxWarriorProtection"] = {
		{ 1, 0, "INV_Shield_05", "=q6=#t7s9_2#", "=q5="..AL["Tier 7"].." ("..AL["10 Man"]..")"};
		{ 2, 39610, "", "=q4=Heroes' Dreadnaught Greathelm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 3, 39613, "", "=q4=Heroes' Dreadnaught Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 4, 39611, "", "=q4=Heroes' Dreadnaught Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 5, 39622, "", "=q4=Heroes' Dreadnaught Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 6, 39612, "", "=q4=Heroes' Dreadnaught Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 8, 0, "INV_Shield_05", "=q6=#t7s9_2#", "=q5="..AL["Tier 7"].." ("..AL["25 Man"]..")"};
		{ 9, 40546, "", "=q4=Valorous Dreadnaught Greathelm", "=ds="..BabbleBoss["Kel'Thuzad"]};
		{ 10, 40548, "", "=q4=Valorous Dreadnaught Pauldrons", "=ds="..BabbleBoss["Loatheb"]};
		{ 11, 40544, "", "=q4=Valorous Dreadnaught Breastplate", "=ds="..BabbleBoss["The Four Horsemen"]};
		{ 12, 40545, "", "=q4=Valorous Dreadnaught Handguards", "=ds="..BabbleBoss["Sartharion"]};
		{ 13, 40547, "", "=q4=Valorous Dreadnaught Legguards", "=ds="..BabbleBoss["Thaddius"]};
		{ 16, 0, "INV_Shield_05", "=q6=#t8s9_2#", "=q5="..AL["Tier 8"].." ("..AL["10 Man"]..")"};
		{ 17, 45425, "", "=q4=Valorous Siegebreaker Greathelm", "=ds="..BabbleBoss["Mimiron"]};
		{ 18, 45428, "", "=q4=Valorous Siegebreaker Pauldrons", "=ds="..BabbleBoss.Thorim};
		{ 19, 45424, "", "=q4=Valorous Siegebreaker Breastplate", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 20, 45426, "", "=q4=Valorous Siegebreaker Handguards", "=ds="..BabbleBoss.Freya};
		{ 21, 45427, "", "=q4=Valorous Siegebreaker Legguards", "=ds="..BabbleBoss.Hodir};
		{ 23, 0, "INV_Shield_05", "=q6=#t8s9_2#", "=q5="..AL["Tier 8"].." ("..AL["25 Man"]..")"};
		{ 24, 46166, "", "=q4=Conqueror's Siegebreaker Greathelm", "=ds="..BabbleBoss.Thorim};
		{ 25, 46167, "", "=q4=Conqueror's Siegebreaker Pauldrons", "=ds="..BabbleBoss["Yogg-Saron"]};
		{ 26, 46162, "", "=q4=Conqueror's Siegebreaker Breastplate", "=ds="..BabbleBoss.Hodir};
		{ 27, 46164, "", "=q4=Conqueror's Siegebreaker Handguards", "=ds="..BabbleBoss["Mimiron"]};
		{ 28, 46169, "", "=q4=Conqueror's Siegebreaker Legguards", "=ds="..BabbleBoss.Freya};
		Back = "T7T8SET";
	};

--Commenting out for the pre-3.2 version update, otherwise these pages are searchable
--[[        
        ------------------------
		--- Tier 9 Sets (T9) ---
		------------------------
		
	AtlasLoot_Data["T9DeathKnightDPS_A"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2a#", "=q5="..AL["Tier 9"]};
		{ 2, 48472, "", "=q4=Thassarian's Helmet of Conquest", "=ds="};
		{ 3, 48478, "", "=q4=Thassarian's Shoulderplates of Conquest", "=ds="};
		{ 4, 48474, "", "=q4=Thassarian's Battleplate of Conquest", "=ds="};
		{ 5, 48480, "", "=q4=Thassarian's Gauntlets of Conquest", "=ds="};
		{ 6, 48476, "", "=q4=Thassarian's Legplates of Conquest", "=ds="};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2a#", "=q5="..AL["Tier 9"]};
		{ 9, 48483, "", "=q4=Thassarian's Helmet of Triumph", "=ds="};
		{ 10, 48485, "", "=q4=Thassarian's Shoulderplates of Triumph", "=ds="};
		{ 11, 48481, "", "=q4=Thassarian's Battleplate of Triumph", "=ds="};
		{ 12, 48482, "", "=q4=Thassarian's Gauntlets of Triumph", "=ds="};
		{ 13, 48484, "", "=q4=Thassarian's Legplates of Triumph", "=ds="};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2a#", "=q5="..AL["Tier 9"]};
		{ 17, 48488, "", "=q4=Thassarian's Helmet of Triumph", "=ds="};
		{ 18, 48486, "", "=q4=Thassarian's Shoulderplates of Triumph", "=ds="};
		{ 19, 48490, "", "=q4=Thassarian's Battleplate of Triumph", "=ds="};
		{ 20, 48489, "", "=q4=Thassarian's Gauntlets of Triumph", "=ds="};
		{ 21, 48487, "", "=q4=Thassarian's Legplates of Triumph", "=ds="};
		Back = "";
	};

	AtlasLoot_Data["T9DeathKnightDPS_H"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2h#", "=q5="..AL["Tier 9"]};
		{ 2, 48503, "", "=q4=Koltira's Helmet of Conquest", "=ds="};
		{ 3, 48505, "", "=q4=Koltira's Shoulderplates of Conquest", "=ds="};
		{ 4, 48501, "", "=q4=Koltira's Battleplate of Conquest", "=ds="};
		{ 5, 48502, "", "=q4=Koltira's Gauntlets of Conquest", "=ds="};
		{ 6, 48504, "", "=q4=Koltira's Legplates of Conquest", "=ds="};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2h#", "=q5="..AL["Tier 9"]};
		{ 9, 48498, "", "=q4=Koltira's Helmet of Triumph", "=ds="};
		{ 10, 48496, "", "=q4=Koltira's Shoulderplates of Triumph", "=ds="};
		{ 11, 48500, "", "=q4=Koltira's Battleplate of Triumph", "=ds="};
		{ 12, 48499, "", "=q4=Koltira's Gauntlets of Triumph", "=ds="};
		{ 13, 48497, "", "=q4=Koltira's Legplates of Triumph", "=ds="};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_2h#", "=q5="..AL["Tier 9"]};
		{ 17, 48493, "", "=q4=Koltira's Helmet of Triumph", "=ds="};
		{ 18, 48495, "", "=q4=Koltira's Shoulderplates of Triumph", "=ds="};
		{ 19, 48491, "", "=q4=Koltira's Battleplate of Triumph", "=ds="};
		{ 20, 48492, "", "=q4=Koltira's Gauntlets of Triumph", "=ds="};
		{ 21, 48494, "", "=q4=Koltira's Legplates of Triumph", "=ds="};
		Back = "";
	};

	AtlasLoot_Data["T9DeathKnightTank_A"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1a#", "=q5="..AL["Tier 9"]};
		{ 2, 48529, "", "=q4=Thassarian's Faceguard of Conquest", "=ds="};
		{ 3, 48535, "", "=q4=Thassarian's Pauldrons of Conquest", "=ds="};
		{ 4, 48531, "", "=q4=Thassarian's Chestguard of Conquest", "=ds="};
		{ 5, 48537, "", "=q4=Thassarian's Handguards of Conquest", "=ds="};
		{ 6, 48533, "", "=q4=Thassarian's Legguards of Conquest", "=ds="};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1a#", "=q5="..AL["Tier 9"]};
		{ 9, 48540, "", "=q4=Thassarian's Faceguard of Triumph", "=ds="};
		{ 10, 48542, "", "=q4=Thassarian's Pauldrons of Triumph", "=ds="};
		{ 11, 48538, "", "=q4=Thassarian's Chestguard of Triumph", "=ds="};
		{ 12, 48539, "", "=q4=Thassarian's Handguards of Triumph", "=ds="};
		{ 13, 48541, "", "=q4=Thassarian's Legguards of Triumph", "=ds="};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1a#", "=q5="..AL["Tier 9"]};
		{ 17, 48545, "", "=q4=Thassarian's Faceguard of Triumph", "=ds="};
		{ 18, 48543, "", "=q4=Thassarian's Shoulderplates of Triumph", "=ds="};
		{ 19, 48547, "", "=q4=Thassarian's Battleplate of Triumph", "=ds="};
		{ 20, 48546, "", "=q4=Thassarian's Handguards of Triumph", "=ds="};
		{ 21, 48544, "", "=q4=Thassarian's Legguards of Triumph", "=ds="};
		Back = "";
	};

	AtlasLoot_Data["T9DeathKnightTank_H"] = {
		{ 1, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1h#", "=q5="..AL["Tier 9"]};
		{ 2, 48560, "", "=q4=Koltira's Faceguard of Conquest", "=ds="};
		{ 3, 48562, "", "=q4=Koltira's Pauldrons of Conquest", "=ds="};
		{ 4, 48558, "", "=q4=Koltira's Chestguard of Conquest", "=ds="};
		{ 5, 48559, "", "=q4=Koltira's Handguards of Conquest", "=ds="};
		{ 6, 48561, "", "=q4=Koltira's Legguards of Conquest", "=ds="};
		{ 8, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1h#", "=q5="..AL["Tier 9"]};
		{ 9, 48555, "", "=q4=Koltira's Faceguard of Triumph", "=ds="};
		{ 10, 48553, "", "=q4=Koltira's Pauldrons of Triumph", "=ds="};
		{ 11, 48557, "", "=q4=Koltira's Chestguard of Triumph", "=ds="};
		{ 12, 48556, "", "=q4=Koltira's Handguards of Triumph", "=ds="};
		{ 13, 48554, "", "=q4=Koltira's Legguards of Triumph", "=ds="};
		{ 16, 0, "Spell_Deathknight_DeathStrike", "=q6=#t9s9_1h#", "=q5="..AL["Tier 9"]};
		{ 17, 48550, "", "=q4=Koltira's Faceguard of Triumph", "=ds="};
		{ 18, 48552, "", "=q4=Koltira's Pauldrons of Triumph", "=ds="};
		{ 19, 48548, "", "=q4=Koltira's Chestguard of Triumph", "=ds="};
		{ 20, 48549, "", "=q4=Koltira's Handguards of Triumph", "=ds="};
		{ 21, 48551, "", "=q4=Koltira's Legguards of Triumph", "=ds="};
		Back = "";
	};
]]

		-----------------------------------
		--- Wrath Of The Lich King Sets ---
		-----------------------------------

	AtlasLoot_Data["WOTLKSets"] = {
		{ 1, 0, "INV_Box_01", "=q6=#wotlk1#", "=q1=#z17#"};
		{ 2, 37758, "", "=q3=Raine's Choker of Combustion", "=ds=#s2#"};
		{ 3, 37821, "", "=q3=Raine's Signet of Blasting", "=ds=#s13#"};
		Back = "SETSBURNINGCURSADE";
	};

		-------------------
		--- Legendaries ---
		-------------------

	AtlasLoot_Data["Legendaries"] = {
		{ 1, 34334, "", "=q5=Thori'dal, the Stars' Fury", "=ds=#w2#"};
		{ 3, 32837, "", "=q5=Warglaive of Azzinoth", "=ds=#h3#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
		{ 4, 32838, "", "=q5=Warglaive of Azzinoth", "=ds=#h4#, #w10#, =q1=#m1# =ds=#c9#, #c6#"};
		{ 6, 30312, "", "=q5=Infinity Blade", "=q1=#m26#: =ds=#h1#, #w4#"};
		{ 7, 30311, "", "=q5=Warp Slicer", "=q1=#m26#: =ds=#h1#, #w10#"};
		{ 8, 30317, "", "=q5=Cosmic Infuser", "=q1=#m26#: =ds=#h3#, #w6#"};
		{ 9, 30316, "", "=q5=Devastation", "=q1=#m26#: =ds=#h2#, #w1#"};
		{ 10, 30313, "", "=q5=Staff of Disintegration", "=q1=#m26#: =ds=#w9#"};
		{ 11, 30314, "", "=q5=Phaseshift Bulwark", "=q1=#m26#: =ds=#w8#"};
		{ 12, 30318, "", "=q5=Netherstrand Longbow", "=q1=#m26#: =ds=#w2#, =q1=#m1# =ds=#c2#"};
		{ 13, 30319, "", "=q5=Nether Spike", "=q1=#m26#: =ds=#w17#"};
		{ 16, 22736, "", "=q5=Andonisus, Reaper of Souls", "=q1=#m26#: =ds=#h3#, #w10#"};
		{ 17, 19019, "", "=q5=Thunderfury, Blessed Blade of the Windseeker", "=ds=#h1#, #w10#"};
		{ 18, 17182, "", "=q5=Sulfuras, Hand of Ragnaros", "=ds=#h2#, #w6#"};
		{ 19, 21176, "", "=q5=Black Qiraji Resonating Crystal", "=ds=#e12#"};
		{ 21, 22632, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c1#"};
		{ 22, 22589, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c3#"};
		{ 23, 22631, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c5#"};
		{ 24, 22630, "", "=q5=Atiesh, Greatstaff of the Guardian", "=ds=#w9#, =q1=#m1# =ds=#c8#"};
		{ 26, 46017, "", "=q5=Val'anyr, Hammer of Ancient Kings", "=ds=#h3# #w6#", "" };
		Back = "SETMENU";
	};

		---------------
		--- Tabards ---
		---------------

	AtlasLoot_Data["Tabards3"] = {
		{ 1, 38312, "", "=q4=Tabard of Brilliance", "=ds=#s7#, =q1=#m24#"};
		{ 2, 23705, "", "=q4=Tabard of Flame", "=ds=#s7#, =q1=#m24#"};
		{ 3, 23709, "", "=q4=Tabard of Frost", "=ds=#s7#, =q1=#m24#"};
		{ 4, 38313, "", "=q4=Tabard of Fury", "=ds=#s7#, =q1=#m24#"};
		{ 5, 38309, "", "=q4=Tabard of Nature", "=ds=#s7#, =q1=#m24#"};
		{ 6, 38310, "", "=q4=Tabard of the Arcane", "=ds=#s7#, =q1=#m24#"};
		{ 7, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#, =q1=#m24#"};
		{ 8, 38311, "", "=q4=Tabard of the Void", "=ds=#s7#, =q1=#m24#"};
		{ 9, 43349, "", "=q4=Tabard of Brute Force", "=ds=#m32#"};
		{ 10, 40643, "", "=q4=Tabard of the Achiever", "=ds=#m32#"};
		{ 11, 43348, "", "=q4=Tabard of the Explorer", "=ds=#m32#"};
		{ 12, 43300, "", "=q4=Loremaster's Colors", "=ds=#m32#"};
		{ 16, 43154, "", "=q1=Tabard of the Argent Crusade", "=ds=#s7#"};
		{ 17, 43157, "", "=q1=Tabard of the Kirin Tor", "=ds=#s7#"};
		{ 18, 43155, "", "=q1=Tabard of the Ebon Blade", "=ds=#s7#"};
		{ 19, 43156, "", "=q1=Tabard of the Wyrmrest Accord", "=ds=#s7#"};
		{ 21, 45579, "", "=q1=Darnassus Tabard", "=ds=#s7# =ec1=#m7#"};
		{ 22, 45580, "", "=q1=Exodar Tabard", "=ds=#s7# =ec1=#m7#"};
		{ 23, 45578, "", "=q1=Gnomeregan Tabard", "=ds=#s7# =ec1=#m7#"};
		{ 24, 45577, "", "=q1=Ironforge Tabard", "=ds=#s7# =ec1=#m7#"};
		{ 25, 45574, "", "=q1=Stormwind Tabard", "=ds=#s7# =ec1=#m7#"};
		{ 26, 45581, "", "=q1=Orgrimmar Tabard", "=ds=#s7# =ec1=#m6#"};
		{ 27, 45582, "", "=q1=Sen'Jin Tabard", "=ds=#s7# =ec1=#m6#"};
		{ 28, 45585, "", "=q1=Silvermoon Tabard", "=ds=#s7# =ec1=#m6#"};
		{ 29, 45584, "", "=q1=Thunder Bluff Tabard", "=ds=#s7# =ec1=#m6#"};
		{ 30, 45583, "", "=q1=Undercity Tabard", "=ds=#s7# =ec1=#m6#"};
		Next = "Tabards2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["Tabards2"] = {
		{ 1, 31779, "", "=q1=Aldor Tabard", "=ds=#s7#"};
		{ 2, 31804, "", "=q1=Cenarion Expedition Tabard", "=ds=#s7#"};
		{ 3, 31776, "", "=q1=Consortium Tabard", "=ds=#s7#"};
		{ 4, 23999, "", "=q1=Honor Hold Tabard", "=ds=#s7#, =ec1=#m7#"};
		{ 5, 31777, "", "=q1=Keepers of Time Tabard", "=ds=#s7#"};
		{ 6, 31774, "", "=q1=Kurenai Tabard", "=ds=#s7#, =ec1=#m7#"};
		{ 7, 31778, "", "=q1=Lower City Tabard", "=ds=#s7#"};
		{ 8, 31773, "", "=q1=Mag'har Tabard", "=ds=#s7#, =ec1=#m6#"};
		{ 9, 32828, "", "=q1=Ogri'la Tabard", "=ds=#s7#"};
		{ 10, 31781, "", "=q1=Sha'tar Tabard", "=ds=#s7#"};
		{ 11, 31775, "", "=q1=Sporeggar Tabard", "=ds=#s7#"};
		{ 12, 31780, "", "=q1=Scryers Tabard", "=ds=#s7#"};
		{ 13, 32445, "", "=q1=Skyguard Tabard", "=ds=#s7#"};
		{ 14, 35221, "", "=q1=Tabard of the Shattered Sun", "=ds=#s7#"};
		{ 15, 24004, "", "=q1=Thrallmar Tabard", "=ds=#s7#, =ec1=#m6#"};
		{ 16, 35279, "", "=q3=Tabard of Summer Skies", "=ds=#s7#, =q1=#m4#"};
		{ 17, 35280, "", "=q3=Tabard of Summer Flames", "=ds=#s7#, =q1=#m4#"};
		{ 18, 31404, "", "=q2=Green Trophy Tabard of the Illidari", "=ds=#s7#, =q1=#m4#"};
		{ 19, 31405, "", "=q2=Purple Trophy Tabard of the Illidari", "=ds=#s7#, =q1=#m4#"};
		{ 21, 24344, "", "=q1=Tabard of the Hand", "=ds=#s7#, =q1=#m4#, =ec1=#m7#"};
		{ 22, 25549, "", "=q1=Blood Knight Tabard", "=ds=#s7#, =ec1=#m6#"};
		Prev = "Tabards3";
		Next = "Tabards1";
		Back = "SETMENU";
	};

	AtlasLoot_Data["Tabards1"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#m7#", ""};
		{ 2, 15196, "", "=q1=Private's Tabard", "=ds=#s7#"};
		{ 3, 15198, "", "=q1=Knight's Colors", "=ds=#s7#"};
		{ 4, 20132, "", "=q1=Arathor Battle Tabard", "=ds=#s7#, =q1=#m4#"};
		{ 5, 19032, "", "=q1=Stormpike Battle Tabard", "=ds=#s7#"};
		{ 6, 19506, "", "=q1=Silverwing Battle Tabard", "=ds=#s7#"};
		{ 8, 0, "INV_BannerPVP_01", "=q6=#m6#", ""};
		{ 9, 15197, "", "=q1=Scout's Tabard", "=ds=#s7#"};
		{ 10, 15199, "", "=q1=Stone Guard's Herald", "=ds=#s7#"};
		{ 11, 20131, "", "=q1=Battle Tabard of the Defilers", "=ds=#s7#, =q1=#m4#"};
		{ 12, 19031, "", "=q1=Frostwolf Battle Tabard", "=ds=#s7#"};
		{ 13, 19505, "", "=q1=Warsong Battle Tabard", "=ds=#s7#"};
		{ 16, 23192, "", "=q2=Tabard of the Scarlet Crusade", "=ds=#s7#", "", "0.48%"};
		{ 17, 5976, "", "=q1=Guild Tabard", "=ds=#s7#"};
		{ 19, 0, "INV_Box_01", "=q6=#j29#", ""};
		{ 20, 36941, "", "=q3=Competitor's Tabard", "=ds=#s7#"};
		{ 21, 22999, "", "=q1=Tabard of the Agent Dawn", "=ds=#s7#, =q1=#m4#"};
		{ 22, 28788, "", "=q1=Tabard of the Protector", "=ds=#s7#, =q1=#m4#"};
		{ 23, 19160, "", "=q1=Contest Winner's Tabard", "=ds=#s7#"};
		Prev = "Tabards2";
		Back = "SETMENU";
	};

		-------------------------
		--- Trading Card Game ---
		-------------------------

	AtlasLoot_Data["CardGame1"] = {
		{ 1, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud35#"};
		{ 2, 46778, "", "=q4=Magic Rooster Egg", "=ds="};
		{ 3, 46780, "", "=q3=Ogre Pinata", "=ds="};
		{ 4, 46779, "", "=q1=Path of Cenarius", "=ds="};
		{ 6, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud31#"};
		{ 7, 45037, "", "=q4=Epic Purple Shirt", "=ds=#ud32#"};
		{ 8, 45063, "", "=q3=Foam Sword Rack", "=ds=#ud33#"};
		{ 9, 45047, "", "=q3=Sandbox Tiger", "=ds=#ud34#"};
		{ 11, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud27#"};
		{ 12, 38576, "", "=q4=Big Battle Bear", "=ds=#ud28#"};
		{ 13, 38578, "", "=q3=The Flag of Ownership", "=ds=#ud29#"};
		{ 14, 38577, "", "=q1=Party G.R.E.N.A.D.E.", "=ds=#ud30#"};
		{ 16, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud23#"};
		{ 17, 38050, "", "=q3=Soul-Trader Beacon", "=ds=#ud26#"};
		{ 18, 38301, "", "=q3=D.I.S.C.O", "=ds=#ud25#"};
		{ 19, 38233, "", "=q1=Path of Illidan", "=ds=#ud24#"};
		{ 21, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud19#"};
		{ 22, 35227, "", "=q4=Goblin Weather Machine - Prototype 01-B", "=ds=#ud21#"};
		{ 23, 35226, "", "=q4=X-51 Nether-Rocket X-TREME", "=ds=#ud22#"};
		{ 24, 35225, "", "=q3=X-51 Nether-Rocket", "=ds=#ud22#"};
		{ 25, 35223, "", "=q3=Papa Hummel's Old-Fashioned Pet Biscuit", "=ds=#ud20#"};
		{ 27, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud15#"};
		{ 28, 34493, "", "=q4=Dragon Kite", "=ds=#ud16#"};
		{ 29, 34492, "", "=q3=Rocket Chicken", "=ds=#ud17#"};
		{ 30, 34499, "", "=q3=Paper Flying Machine Kit", "=ds=#ud18#"};
		Next = "CardGame2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["CardGame2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud3#"};
		{ 2, 33225, "", "=q4=Reins of the Swift Spectral Tiger", "=ds=#ud14#"};
		{ 3, 33224, "", "=q3=Reins of the Spectral Tiger", "=ds=#ud14#"};
		{ 4, 33223, "", "=q3=Fishing Chair", "=ds=#ud13#"};
		{ 5, 33219, "", "=q3=Goblin Gumbo Kettle", "=ds=#ud12#"};
		{ 7, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud2#"};
		{ 8, 32588, "", "=q3=Banana Charm", "=ds=#ud9#"};
		{ 9, 32566, "", "=q3=Picnic Basket", "=ds=#ud10#"};
		{ 10, 32542, "", "=q3=Imp in a Ball", "=ds=#ud11#"};
		{ 12, 0, "INV_Box_01", "=q6=#ud4#", "=q1=#ud1#"};
		{ 13, 23705, "", "=q4=Tabard of Flame", "=ds=#ud6#"};
		{ 14, 23713, "", "=q4=Hippogryph Hatchling", "=ds=#ud7#"};
		{ 15, 23720, "", "=q4=Riding Turtle", "=ds=#ud8#"};
		{ 16, 0, "INV_Box_01", "=q6=#ud5#", ""};
		{ 17, 38312, "", "=q4=Tabard of Brilliance", "=ds=#s7#"};
		{ 18, 23709, "", "=q4=Tabard of Frost", "=ds=#s7#"};
		{ 19, 38313, "", "=q4=Tabard of Fury", "=ds=#s7#"};
		{ 20, 38309, "", "=q4=Tabard of Nature", "=ds=#s7#"};
		{ 21, 38310, "", "=q4=Tabard of the Arcane", "=ds=#s7#"};
		{ 22, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#"};
		{ 23, 38314, "", "=q4=Tabard of the Defender", "=ds=#s7#"};
		{ 24, 38311, "", "=q4=Tabard of the Void", "=ds=#s7#"};
		{ 25, 23716, "", "=q4=Carved Ogre Idol", "=ds=#s14#"};
		{ 26, 23714, "", "=q4=Perpetual Purple Firework", "=ds=#s14#"};
		Prev = "CardGame1";
		Back = "SETMENU";
	};

		------------
		--- Pets ---
		------------

	AtlasLoot_Data["PetsMerchant1"] = {
		{ 1, 44984, "", "=q3=Ammen Vale Lashling", "=ds="};
		{ 2, 44970, "", "=q3=Dun Morogh Cub", "=ds="};
		{ 3, 44973, "", "=q3=Durotar Scorpion", "=ds="};
		{ 4, 44974, "", "=q3=Elwynn Lamb", "=ds="};
		{ 5, 44982, "", "=q3=Enchanted Broom", "=ds="};
		{ 6, 39973, "", "=q3=Ghostly Skull", "=ds="};
		{ 7, 45002, "", "=q3=Mechanopeep", "=ds="};
		{ 8, 44980, "", "=q3=Mulgore Hatchling", "=ds="};
		{ 9, 45606, "", "=q3=Sen'jin Fetish", "=ds="};
		{ 10, 44965, "", "=q3=Teldrassil Sproutling", "=ds="};
		{ 11, 44971, "", "=q3=Tirisfal Batling", "=ds="};
		{ 12, 11023, "", "=q1=Ancona Chicken", "=ds="};
		{ 13, 10360, "", "=q1=Black Kingsnake", "=ds="};
		{ 14, 10361, "", "=q1=Brown Snake", "=ds="};
		{ 15, 29958, "", "=q1=Blue Dragonhawk Hatchling", "=ds="};
		{ 16, 29901, "", "=q1=Blue Moth Egg", "=ds="};
		{ 17, 29364, "", "=q1=Brown Rabbit Crate", "=ds="};
		{ 18, 8485, "", "=q1=Cat Carrier (Bombay)", "=ds="};
		{ 19, 8486, "", "=q1=Cat Carrier (Cornish Rex)", "=ds="};
		{ 20, 8487, "", "=q1=Cat Carrier (Orange Tabby)", "=ds="};
		{ 21, 8490, "", "=q1=Cat Carrier (Siamese)", "=ds="};
		{ 22, 8488, "", "=q1=Cat Carrier (Silver Tabby)", "=ds="};
		{ 23, 8489, "", "=q1=Cat Carrier (White Kitten)", "=ds="};
		{ 24, 10393, "", "=q1=Cockroach", "=ds="};
		{ 25, 10392, "", "=q1=Crimson Snake", "=ds="};
		{ 26, 29953, "", "=q1=Golden Dragonhawk Hatchling", "=ds="};
		{ 27, 8500, "", "=q1=Great Horned Owl", "=ds="};
		{ 28, 8501, "", "=q1=Hawk Owl", "=ds="};
		{ 29, 29363, "", "=q1=Mana Wyrmling", "=ds="};
		{ 30, 8496, "", "=q1=Parrot Cage (Cockatiel)", "=ds="};
		Next = "PetsMerchant2";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsMerchant2"] = {
		{ 1, 8492, "", "=q1=Parrot Cage (Green Wing Macaw)", "=ds="};
		{ 2, 8495, "", "=q1=Parrot Cage (Senegal)", "=ds="};
		{ 3, 10394, "", "=q1=Prairie Dog Whistle", "=ds="};
		{ 4, 8497, "", "=q1=Rabbit Crate (Snowshoe)", "=ds="};
		{ 5, 29956, "", "=q1=Red Dragonhawk Hatchling", "=ds="};
		{ 6, 29902, "", "=q1=Red Moth Egg", "=ds="};
		{ 7, 29957, "", "=q1=Silver Dragonhawk Hatchling", "=ds="};
		{ 8, 11026, "", "=q1=Tree Frog Box", "=ds="};
		{ 9, 29904, "", "=q1=White Moth Egg", "=ds="};
		{ 10, 11027, "", "=q1=Wood Frog Box", "=ds="};
		{ 11, 29903, "", "=q1=Yellow Moth Egg", "=ds="};
		Prev = "PetsMerchant1";
		Next = "PetsQuestCrafted1";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsQuestCrafted1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Quest"], ""};
		{ 2, 45022, "", "=q3=Argent Gruntling", "=ec1=#m6#"};
		{ 3, 44998, "", "=q3=Argent Squire", "=ec1=#m7#"};
		{ 4, 35350, "", "=q3=Chuck's Bucket", "=ds="};
		{ 5, 33818, "", "=q3=Muckbreath's Bucket", "=ds="};
		{ 6, 35349, "", "=q3=Snarly's Bucket", "=ds="};
		{ 7, 44983, "", "=q3=Strand Crawler", "=ds="};
		{ 8, 33816, "", "=q3=Toothy's Bucket", "=ds="};
		{ 9, 19450, "", "=q1=A Jubling's Tiny Home", "=ds="};
		{ 10, 11110, "", "=q1=Chicken Egg", "=ds="};
		{ 11, 10398, "", "=q1=Mechanical Chicken", "=ds="};
		{ 12, 31760, "", "=q1=Miniwing", "=ds="};
		{ 13, 12529, "", "=q1=Smolderweb Carrier", "=ds="};
		{ 14, 11474, "", "=q1=Sprite Darter Egg", "=ds="};
		{ 15, 12264, "", "=q1=Worg Carrier", "=ds="};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Crafted"], ""};
		{ 17, 15996, "", "=q1=Lifelike Mechanical Toad", "=ds="};
		{ 18, 11826, "", "=q1=Lil' Smoky", "=ds="};
		{ 19, 4401, "", "=q1=Mechanical Squirrel Box", "=ds="};
		{ 20, 11825, "", "=q1=Pet Bombling", "=ds="};
		{ 21, 21277, "", "=q1=Tranquil Mechanical Yeti", "=ds="};
		Prev = "PetsMerchant2";
		Next = "PetsRare1";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsRare1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Dungeon/Raid"], ""};
		{ 2, 33993, "", "=q3=Mojo", "=ds="};
		{ 3, 35504, "", "=q3=Phoenix Hatchling", "=ds="};
		{ 4, 38658, "", "=q3=Vampiric Batling", "=ds="};
		{ 6, 0, "INV_Box_01", "=q6="..AL["Faction"], ""};
		{ 7, 38628, "", "=q3=Nether Ray Fry", "=ds="};
		{ 8, 44723, "", "=q3=Nurtured Penguin Egg", "=ds="};
		{ 9, 34478, "", "=q3=Tiny Sporebat", "=ds="};
		{ 10, 39898, "", "=q1=Cobra Hatchling", "=ds="};
		{ 11, 44721, "", "=q1=Proto-Drake Whelp", "=ds="};
		{ 12, 39896, "", "=q1=Tickbird Hatchling", "=ds="};
		{ 13, 39899, "", "=q1=White Tickbird Hatchling", "=ds="};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Achievement"], ""};
		{ 17, 44738, "", "=q3=Kirin Tor Familiar", "=ds="};
		{ 18, 44841, "", "=q3=Little Fawn's Salt Lick", "=ds="};
		{ 19, 40653, "", "=q3=Reeking Pet Carrier", "=ds="};
		{ 20, 44819, "", "=q1=Baby Blizzard Bear", "=ds="};
		{ 22, 0, "INV_Box_01", "=q6=#z17#", ""};
		{ 23, 43698, "", "=q3=Giant Sewer Rat", "=ds="};
		{ 24, 34535, "", "=q1=Azure Whelpling", "=ds="};
		{ 25, 10822, "", "=q1=Dark Whelpling", "=ds="};
		{ 26, 20769, "", "=q1=Disgusting Oozeling", "=ds="};
		{ 27, 29960, "", "=q1=Captured Firefly", "=ds="};
		{ 28, 8491, "", "=q1=Cat Carrier (Black Tabby)", "=ds="};
		{ 29, 27445, "", "=q1=Magical Crawdad Box", "=ds="};
		{ 30, 8494, "", "=q1=Parrot Cage (Hyacinth Macaw)", "=ds="};
		Prev = "PetsQuestCrafted1";
		Next = "PetsRare2";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsRare2"] = {
		{ 1, 8499, "", "=q1=Tiny Crimson Whelpling", "=ds="};
		{ 2, 8498, "", "=q1=Tiny Emerald Whelpling", "=ds="};
		Prev = "PetsRare1";
		Next = "PetsEvent1";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsEvent1"] = {
		{ 1, 23083, "", "=q3=Captured Flame", "=ds="};
		{ 2, 34425, "", "=q3=Clockwork Rocket Bot", "=ds="};
		{ 3, 46545, "", "=q3=Curious Oracle Hatchling", "=ds="};
		{ 4, 46544, "", "=q3=Curious Wolvar Pup", "=ds="};
		{ 5, 32616, "", "=q3=Egbert's Egg", "=ds="};
		{ 6, 32622, "", "=q3=Elekk Training Collar", "=ds="};
		{ 7, 34955, "", "=q3=Scorched Stone", "=ds="};
		{ 8, 33154, "", "=q3=Sinister Squashling", "=ds="};
		{ 9, 32617, "", "=q3=Sleepy Willy", "=ds="};
		{ 10, 44794, "", "=q3=Spring Rabbit's Foot", "=ds="};
		{ 11, 32233, "", "=q3=Wolpertinger's Tankard", "=ds="};
		{ 12, 21301, "", "=q1=Green Helper Box", "=ds="};
		{ 13, 21308, "", "=q1=Jingling Bell", "=ds="};
		{ 14, 23007, "", "=q1=Piglet's Collar", "=ds="};
		{ 15, 23015, "", "=q1=Rat Cage", "=ds="};
		{ 16, 21305, "", "=q1=Red Helper Box", "=ds="};
		{ 17, 21309, "", "=q1=Snowman Kit", "=ds="};
		{ 18, 22235, "", "=q1=Truesilver Shafted Arrow", "=ds="};
		{ 19, 23002, "", "=q1=Turtle Box", "=ds="};
		Prev = "PetsRare1";
		Next = "PetsPromotional1";
		Back = "PETMENU";
	};

	AtlasLoot_Data["PetsPromotional1"] = {
		{ 1, 34493, "", "=q4=Dragon Kite", "=ds="};
		{ 2, 23713, "", "=q4=Hippogryph Hatchling", "=ds="};
		{ 3, 32588, "", "=q3=Banana Charm", "=ds="};
		{ 4, 46767, "", "=q3=Battle-Bot Ignition Key", "=ds="};
		{ 5, 20371, "", "=q3=Blue Murloc Egg", "=ds="};
		{ 6, 13584, "", "=q3=Diablo Stone", "=ds="};
		{ 7, 39286, "", "=q3=Frosty's Collar", "=ds="};
		{ 8, 37297, "", "=q3=Gold Medallion", "=ds="};
		{ 9, 46802, "", "=q3=Grunty's Heavy Murloc Egg", "=ds="};
		{ 10, 30360, "", "=q3=Lurky's Egg", "=ds="};
		{ 11, 45180, "", "=q3=Murkimus' Little Spear", "=ds="};
		{ 12, 25535, "", "=q3=Netherwhelp's Collar", "=ds="};
		{ 13, 13583, "", "=q3=Panda Collar", "=ds="};
		{ 14, 22114, "", "=q3=Pink Murloc Egg", "=ds="};
		{ 15, 34492, "", "=q3=Rocket Chicken", "=ds="};
		{ 16, 38050, "", "=q3=Soul-Trader Beacon", "=ds="};
		{ 17, 39656, "", "=q3=Tyrael's Hilt", "=ds="};
		{ 18, 13582, "", "=q3=Zergling Leash", "=ds="};
		Prev = "PetsEvent1";
		Back = "PETMENU";
	};

		--------------
		--- Mounts ---
		--------------

	AtlasLoot_Data["MountsAlliance1"] = {
		{ 1, 0, "inv_misc_tournaments_symbol_nightelf", "=q6="..BabbleFaction["Darnassus"].." #j30#", "=ec1=#m7#"};
		{ 2, 18766, "", "=q4=Reins of the Swift Frostsaber", "=ds=#e12#"};
		{ 3, 18767, "", "=q4=Reins of the Swift Mistsaber", "=ds=#e12#"};
		{ 4, 18902, "", "=q4=Reins of the Swift Stormsaber", "=ds=#e12#"};
		{ 5, 8632, "", "=q3=Reins of the Spotted Frostsaber", "=ds=#e12#"};
		{ 6, 47100, "", "=q3=Reins of the Striped Dawnsaber", "=ds=#e12#"};
		{ 7, 8631, "", "=q3=Reins of the Striped Frostsaber", "=ds=#e12#"};
		{ 8, 8629, "", "=q3=Reins of the Striped Nightsaber", "=ds=#e12#"};
		{ 16, 0, "inv_misc_tournaments_symbol_gnome", "=q6="..BabbleFaction["Gnomeregan Exiles"].." #j30#", "=ec1=#m7#"};
		{ 17, 18772, "", "=q4=Swift Green Mechanostrider", "=ds=#e12#"};
		{ 18, 18773, "", "=q4=Swift White Mechanostrider", "=ds=#e12#"};
		{ 19, 18774, "", "=q4=Swift Yellow Mechanostrider", "=ds=#e12#"};
		{ 20, 8595, "", "=q3=Blue Mechanostrider", "=ds=#e12#"};
		{ 21, 13321, "", "=q3=Green Mechanostrider", "=ds=#e12#"};
		{ 22, 8563, "", "=q3=Red Mechanostrider", "=ds=#e12#"};
		{ 23, 13322, "", "=q3=Unpainted Mechanostrider", "=ds=#e12#"};
		Next = "MountsAlliance2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsAlliance2"] = {
		{ 1, 0, "inv_misc_tournaments_symbol_dwarf", "=q6="..BabbleFaction["Ironforge"].." #j30#", "=ec1=#m7#"};
		{ 2, 18786, "", "=q4=Swift Brown Ram", "=ds=#e12#"};
		{ 3, 18787, "", "=q4=Swift Gray Ram", "=ds=#e12#"};
		{ 4, 18785, "", "=q4=Swift White Ram", "=ds=#e12#"};
		{ 5, 5872, "", "=q3=Brown Ram", "=ds=#e12#"};
		{ 6, 5864, "", "=q3=Gray Ram", "=ds=#e12#"};
		{ 7, 5873, "", "=q3=White Ram", "=ds=#e12#"};
		{ 9, 0, "inv_misc_tournaments_symbol_draenei", "=q6="..BabbleFaction["Exodar"].." #j30#", "=ec1=#m7#"};
		{ 10, 29745, "", "=q4=Great Blue Elekk", "=ds=#e12#"};
		{ 11, 29746, "", "=q4=Great Green Elekk", "=ds=#e12#"};
		{ 12, 29747, "", "=q4=Great Purple Elekk", "=ds=#e12#"};
		{ 13, 28481, "", "=q3=Brown Elekk", "=ds=#e12#"};
		{ 14, 29744, "", "=q3=Gray Elekk", "=ds=#e12#"};
		{ 15, 29743, "", "=q3=Purple Elekk", "=ds=#e12#"};
		{ 16, 0, "inv_misc_tournaments_symbol_human", "=q6="..BabbleFaction["Stormwind"].." #j30#", "=ec1=#m7#"};
		{ 17, 18777, "", "=q4=Swift Brown Steed", "=ds=#e12#"};
		{ 18, 18776, "", "=q4=Swift Palomino", "=ds=#e12#"};
		{ 19, 18778, "", "=q4=Swift White Steed", "=ds=#e12#"};
		{ 20, 2411, "", "=q3=Black Stallion Bridle", "=ds=#e12#"};
		{ 21, 5656, "", "=q3=Brown Horse Bridle", "=ds=#e12#"};
		{ 22, 5655, "", "=q3=Chestnut Mare Bridle", "=ds=#e12#"};
		{ 23, 2414, "", "=q3=Pinto Bridle", "=ds=#e12#"};
		Prev = "MountsAlliance1";
		Next = "MountsAlliance3";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsAlliance3"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6="..AL["Alliance Flying Mounts"], "=ec1=#m7#"};
		{ 2, 25473, "", "=q4=Swift Blue Gryphon", "=ds=#e12#"};
		{ 3, 25528, "", "=q4=Swift Green Gryphon", "=ds=#e12#"};
		{ 4, 25529, "", "=q4=Swift Purple Gryphon", "=ds=#e12#"};
		{ 5, 25527, "", "=q4=Swift Red Gryphon", "=ds=#e12#"};
		{ 6, 25471, "", "=q3=Ebon Gryphon", "=ds=#e12#"};
		{ 7, 25470, "", "=q3=Golden Gryphon", "=ds=#e12#"};
		{ 8, 25472, "", "=q3=Snowy Gryphon", "=ds=#e12#"};
		{ 10, 44225, "", "=q4=Reins of the Armored Brown Bear", "=ds=#e12#"};
		{ 11, 44230, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e12#"};
		{ 12, 44235, "", "=q4=Reins of the Traveler's Tundra Mammoth", "=ds=#e12#"};
		{ 13, 44689, "", "=q4=Armored Snowy Gryphon", "=ds=#e12#"};
		{ 16, 0, "INV_BannerPVP_02", "=q6="..BabbleFaction["Kurenai"].." #j30#", "=ec1=#m7#"};
		{ 17, 29227, "", "=q4=Reins of the Cobalt War Talbuk", "=ds=#e12#"};
		{ 18, 29229, "", "=q4=Reins of the Silver War Talbuk", "=ds=#e12#"};
		{ 19, 29230, "", "=q4=Reins of the Tan War Talbuk", "=ds=#e12#"};
		{ 20, 29231, "", "=q4=Reins of the White War Talbuk", "=ds=#e12#"};
		{ 21, 31830, "", "=q4=Reins of the Cobalt Riding Talbuk", "=ds=#e12#"};
		{ 22, 31832, "", "=q4=Reins of the Silver Riding Talbuk", "=ds=#e12#"};
		{ 23, 31834, "", "=q4=Reins of the Tan Riding Talbuk", "=ds=#e12#"};
		{ 24, 31836, "", "=q4=Reins of the White Riding Talbuk", "=ds=#e12#"};
		{ 26, 0, "INV_BannerPVP_02", "=q6="..BabbleFaction["Wintersaber Trainers"].." #j30#", "=ec1=#m7#"};
		{ 27, 13086, "", "=q4=Reins of the Winterspring Frostsaber", "=ds=#e12#"};
		{ 28, 0, "INV_BannerPVP_02", "=q6="..BabbleFaction["The Silver Covenant"].." #j30#", "=ec1=#m7#"};
		{ 29, 46815, "", "=q4=Quel'dorei Steed", "=ds=#e12#"};
		{ 30, 46813, "", "=q4=Silver Covenant Hippogryph", "=ds=#e12#"};
		Prev = "MountsAlliance2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsHorde1"] = {
		{ 1, 0, "inv_misc_tournaments_symbol_orc", "=q6="..BabbleFaction["Orgrimmar"].." #j30#", "=ec1=#m6#"};
		{ 2, 18796, "", "=q4=Horn of the Swift Brown Wolf", "=ds=#e12#"};
		{ 3, 18798, "", "=q4=Horn of the Swift Gray Wolf", "=ds=#e12#"};
		{ 4, 18797, "", "=q4=Horn of the Swift Timber Wolf", "=ds=#e12#"};
		{ 5, 46099, "", "=q3=Horn of the Black Wolf", "=ds=#e12#"};
		{ 6, 5668, "", "=q3=Horn of the Brown Wolf", "=ds=#e12#"};
		{ 7, 5665, "", "=q3=Horn of the Dire Wolf", "=ds=#e12#"};
		{ 8, 1132, "", "=q3=Horn of the Timber Wolf", "=ds=#e12#"};
		{ 16, 0, "inv_misc_tournaments_symbol_bloodelf", "=q6="..BabbleFaction["Silvermoon City"].." #j30#", "=ec1=#m6#"};
		{ 17, 29223, "", "=q4=Swift Green Hawkstrider", "=ds=#e12#"};
		{ 18, 28936, "", "=q4=Swift Pink Hawkstrider", "=ds=#e12#"};
		{ 19, 29224, "", "=q4=Swift Purple Hawkstrider", "=ds=#e12#"};
		{ 20, 29221, "", "=q3=Black Hawkstrider", "=ds=#e12#"};
		{ 21, 29220, "", "=q3=Blue Hawkstrider", "=ds=#e12#"};
		{ 22, 29222, "", "=q3=Purple Hawkstrider", "=ds=#e12#"};
		{ 23, 28927, "", "=q3=Red Hawkstrider", "=ds=#e12#"};
		Next = "MountsHorde2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsHorde2"] = {
		{ 1, 0, "inv_misc_tournaments_symbol_troll", "=q6="..BabbleFaction["Darkspear Trolls"].." #j30#", "=ec1=#m6#"};
		{ 2, 18788, "", "=q4=Swift Blue Raptor", "=ds=#e12#"};
		{ 3, 18789, "", "=q4=Swift Olive Raptor", "=ds=#e12#"};
		{ 4, 18790, "", "=q4=Swift Orange Raptor", "=ds=#e12#"};
		{ 5, 8588, "", "=q3=Whistle of the Emerald Raptor", "=ds=#e12#"};
		{ 6, 8591, "", "=q3=Whistle of the Turquoise Raptor", "=ds=#e12#"};
		{ 7, 8592, "", "=q3=Whistle of the Violet Raptor", "=ds=#e12#"};
		{ 9, 0, "inv_misc_tournaments_symbol_tauren", "=q6="..BabbleFaction["Thunder Bluff"].." #j30#", "=ec1=#m6#"};
		{ 10, 18794, "", "=q4=Great Brown Kodo", "=ds=#e12#"};
		{ 11, 18795, "", "=q4=Great Gray Kodo", "=ds=#e12#"};
		{ 12, 18793, "", "=q4=Great White Kodo", "=ds=#e12#"};
		{ 13, 15290, "", "=q3=Brown Kodo", "=ds=#e12#"};
		{ 14, 15277, "", "=q3=Gray Kodo", "=ds=#e12#"};
		{ 15, 46100, "", "=q3=White Kodo", "=ds=#e12#"};
		{ 16, 0, "inv_misc_tournaments_symbol_scourge", "=q6="..BabbleFaction["Undercity"].." #j30#", "=ec1=#m6#"};
		{ 17, 13334, "", "=q4=Green Skeletal Warhorse", "=ds=#e12#"};
		{ 18, 47101, "", "=q4=Ochre Skeletal Warhorse", "=ds=#e12#"};
		{ 19, 18791, "", "=q4=Purple Skeletal Warhorse", "=ds=#e12#"};
		{ 20, 46308, "", "=q3=Black Skeletal Horse", "=ds=#e12#"};
		{ 21, 13332, "", "=q3=Blue Skeletal Horse", "=ds=#e12#"};
		{ 22, 13333, "", "=q3=Brown Skeletal Horse", "=ds=#e12#"};
		{ 23, 13331, "", "=q3=Red Skeletal Horse", "=ds=#e12#"};
		Prev = "MountsHorde1";
		Next = "MountsHorde3";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsHorde3"] = {
		{ 1, 0, "INV_BannerPVP_01", "=q6="..AL["Horde Flying Mounts"], "=ec1=#m6#"};
		{ 2, 25531, "", "=q4=Swift Green Wind Rider", "=ds=#e12#"};
		{ 3, 25533, "", "=q4=Swift Purple Wind Rider", "=ds=#e12#"};
		{ 4, 25477, "", "=q4=Swift Red Wind Rider", "=ds=#e12#"};
		{ 5, 25532, "", "=q4=Swift Yellow Wind Rider", "=ds=#e12#"};
		{ 6, 25475, "", "=q3=Blue Wind Rider", "=ds=#e12#"};
		{ 7, 25476, "", "=q3=Green Wind Rider", "=ds=#e12#"};
		{ 8, 25474, "", "=q3=Tawny Wind Rider", "=ds=#e12#"};
		{ 10, 44226, "", "=q4=Reins of the Armored Brown Bear", "=ds=#e12#"};
		{ 11, 44231, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e12#"};
		{ 12, 44234, "", "=q4=Reins of the Traveler's Tundra Mammoth", "=ds=#e12#"};
		{ 13, 44690, "", "=q4=Armored Blue Wind Rider", "=ds=#e12#"};
		{ 16, 0, "INV_BannerPVP_01", "=q6="..BabbleFaction["The Mag'har"].." #j30#", "=ec1=#m6#"};
		{ 17, 29102, "", "=q4=Reins of the Cobalt War Talbuk", "=ds=#e12#"};
		{ 18, 29104, "", "=q4=Reins of the Silver War Talbuk", "=ds=#e12#"};
		{ 19, 29105, "", "=q4=Reins of the Tan War Talbuk", "=ds=#e12#"};
		{ 20, 29103, "", "=q4=Reins of the White War Talbuk", "=ds=#e12#"};
		{ 21, 31829, "", "=q4=Reins of the Cobalt Riding Talbuk", "=ds=#e12#"};
		{ 22, 31831, "", "=q4=Reins of the Silver Riding Talbuk", "=ds=#e12#"};
		{ 23, 31833, "", "=q4=Reins of the Tan Riding Talbuk", "=ds=#e12#"};
		{ 24, 31835, "", "=q4=Reins of the White Riding Talbuk", "=ds=#e12#"};
		{ 26, 0, "INV_BannerPVP_02", "=q6=Ravasaur Trainers #j30#", "=ec1=#m7#"};
		{ 27, 46102, "", "=q4=Whistle of the Venomhide Ravasaur", "=ds=#e12#"};
		{ 28, 0, "INV_BannerPVP_02", "=q6="..BabbleFaction["The Sunreavers"].." #j30#", "=ec1=#m7#"};
		{ 29, 46816, "", "=q4=Sunreaver Hawkstrider", "=ds=#e12#"};
		{ 30, 46814, "", "=q4=Sunreaver Dragonhawk", "=ds=#e12#"};
		Prev = "MountsHorde2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsFaction1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..BabbleFaction["Netherwing"].." #j30#", ""};
		{ 2, 32858, "", "=q4=Reins of the Azure Netherwing Drake", "=ds=#e12#"};
		{ 3, 32859, "", "=q4=Reins of the Cobalt Netherwing Drake", "=ds=#e12#"};
		{ 4, 32857, "", "=q4=Reins of the Onyx Netherwing Drake", "=ds=#e12#"};
		{ 5, 32860, "", "=q4=Reins of the Purple Netherwing Drake", "=ds=#e12#"};
		{ 6, 32861, "", "=q4=Reins of the Veridian Netherwing Drake", "=ds=#e12#"};
		{ 7, 32862, "", "=q4=Reins of the Violet Netherwing Drake", "=ds=#e12#"};
		{ 9, 0, "INV_Box_01", "=q6="..BabbleFaction["Sha'tari Skyguard"].." #j30#", ""};
		{ 10, 32319, "", "=q4=Blue Riding Nether Ray", "=ds=#e12#"};
		{ 11, 32314, "", "=q4=Green Riding Nether Ray", "=ds=#e12#"};
		{ 12, 32317, "", "=q4=Red Riding Nether Ray", "=ds=#e12#"};
		{ 13, 32316, "", "=q4=Purple Riding Nether Ray", "=ds=#e12#"};
		{ 14, 32318, "", "=q4=Silver Riding Nether Ray", "=ds=#e12#"};
		{ 16, 0, "INV_Box_01", "=q6="..BabbleFaction["Cenarion Expedition"].." #j30#", ""};
		{ 17, 33999, "", "=q4=Cenarion War Hippogryph", "=ds=#e12#"};
		{ 19, 0, "INV_Box_01", "=q6="..BabbleFaction["The Sons of Hodir"].." #j30#", ""};
		{ 20, 43958, "", "=q4=Reins of the Ice Mammoth", "=ds=#e12# =ec1=#m7#"};
		{ 21, 44080, "", "=q4=Reins of the Ice Mammoth", "=ds=#e12# =ec1=#m6#"};
		{ 22, 43961, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e12# =ec1=#m7#"};
		{ 23, 44086, "", "=q4=Reins of the Grand Ice Mammoth", "=ds=#e12# =ec1=#m6#"};
		{ 25, 0, "INV_Box_01", "=q6="..BabbleFaction["The Wyrmrest Accord"].." #j30#", ""};
		{ 26, 43955, "", "=q4=Reins of the Red Drake", "=ds=#e12#"};
		{ 28, 0, "INV_Box_01", "=q6="..BabbleFaction["The Oracles"].." #j30#", ""};
		{ 29, 44707, "", "=q4=Reins of the Green Proto-Drake", "=q2=#x38#", ""};
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsPvP1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Arena Reward"], ""};
		{ 2, 30609, "", "=q4=Swift Nether Drake", "=ds=#e12#"};
		{ 3, 34092, "", "=q4=Merciless Nether Drake", "=ds=#e12#"};
		{ 4, 37676, "", "=q4=Vengeful Nether Drake", "=ds=#e12#"};
		{ 5, 43516, "", "=q4=Brutal Nether Drake", "=ds=#e12#"};
		{ 6, 46171, "", "=q4=Deadly Gladiator's Frostwyrm", "=ds=#e12#"};
		{ 8, 0, "INV_Box_01", "=q6="..AL["Alliance PvP Mounts"], ""};
		{ 9, 29465, "", "=q4=Black Battlestrider", "=ds=#e12# =ec1=#m7#"};
		{ 10, 29467, "", "=q4=Black War Ram", "=ds=#e12# =ec1=#m7#"};
		{ 11, 29468, "", "=q4=Black War Steed Bridle", "=ds=#e12# =ec1=#m7#"};
		{ 12, 35906, "", "=q4=Reins of the Black War Elekk", "=ds=#e12# =ec1=#m7#"};
		{ 13, 29471, "", "=q4=Reins of the Black War Tiger", "=ds=#e12# =ec1=#m7#"};
		{ 14, 19030, "", "=q4=Stormpike Battle Charger", "=ds=#e12# =ec1=#m7#"};
		{ 15, 43956, "", "=q4=Reins of the Black War Mammoth", "=ds=#e12# =ec1=#m7#"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Halaa PvP Mounts"], ""};
		{ 17, 28915, "", "=q4=Reins of the Dark Riding Talbuk", "=ds=#e12#"};
		{ 18, 29228, "", "=q4=Reins of the Dark War Talbuk", "=ds=#e12#"};
		{ 23, 0, "INV_Box_01", "=q6="..AL["Horde PvP Mounts"], ""};
		{ 24, 29466, "", "=q4=Black War Kodo", "=ds=#e12# =ec1=#m6#"};
		{ 25, 29469, "", "=q4=Horn of the Black War Wolf", "=ds=#e12# =ec1=#m6#"};
		{ 26, 29470, "", "=q4=Red Skeletal Warhorse", "=ds=#e12# =ec1=#m6#"};
		{ 27, 34129, "", "=q4=Swift Warstrider", "=ds=#e12# =ec1=#m6#"};
		{ 28, 29472, "", "=q4=Whistle of the Black War Raptor", "=ds=#e12# =ec1=#m6#"};
		{ 29, 19029, "", "=q4=Horn of the Frostwolf Howler", "=ds=#e12# =ec1=#m6#"};
		{ 30, 44077, "", "=q4=Reins of the Black War Mammoth", "=ds=#e12# =ec1=#m6#"};
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsRare1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Dungeon/Raid"], ""};
		{ 2, 33809, "", "=q4=Amani War Bear", "=q2=#x33#, =q1=#z29#"};
		{ 3, 32458, "", "=q4=Ashes of Al'ar", "=q2=#n59#, =q1=#z19#"};
		{ 4, 13335, "", "=q4=Deathcharger's Reins", "=q2=#n52#, =q1=#z6#", "", "0.10%"};
		{ 5, 30480, "", "=q4=Fiery Warhorse's Reins", "=q2=#n53#, =q1=#z12#", "", "0.25%"};
		{ 6, 43986, "", "=q4=Reins of the Black Drake", "=q2=#n153#, =q1=#j37# #z38# #j46#", ""};
		{ 7, 43954, "", "=q4=Reins of the Twilight Drake", "=q2=#n153#, =q1=#j38# #z38# #j46#", ""};
		{ 8, 43953, "", "=q4=Reins of the Blue Drake", "=q2=#n154#, =q1=#j37# #z39#", ""};
		{ 9, 43952, "", "=q4=Reins of the Azure Drake", "=q2=#n154#, =q1=#j38# #z39#", ""};
		{ 10, 44151, "", "=q4=Reins of the Blue Proto-Drake", "=q2=#n151#, =q1=#j47# #z35#", ""};
		{ 11, 43951, "", "=q4=Reins of the Bronze Drake", "=q2=#n152#, =q1=#j47# #z36#", ""};
		{ 12, 43959, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m7#", "", ""};
		{ 13, 44083, "", "=q4=Reins of the Grand Black War Mammoth", "=ds=#e12# =ec1=#m6#", "", ""};
		{ 14, 32768, "", "=q4=Reins of the Raven Lord", "=q2=#n58#, =q1=#z16#"};
		{ 15, 35513, "", "=q4=Swift White Hawkstrider", "=q2=#n59#, =q1=#z30#"};
		{ 16, 19872, "", "=q4=Swift Razzashi Raptor", "=q2=#n33#, =q1=#z8#", "", "0.43%"};
		{ 17, 19902, "", "=q4=Swift Zulian Tiger", "=q2=#n28#, =q1=#z8#", "", " 0.70%"};
		{ 18, 21218, "", "=q3=Blue Qiraji Resonating Crystal", "=q2=#n11#,  =q1=#z11#", "", "10.91%"};
		{ 19, 21323, "", "=q3=Green Qiraji Resonating Crystal", "=q2=#n11#,  =q1=#z11#", "", "11.77%"};
		{ 20, 21321, "", "=q3=Red Qiraji Resonating Crystal", "=q2=#n11#,  =q1=#z11#", "", "1.32%"};
		{ 21, 21324, "", "=q3=Yellow Qiraji Resonating Crystal", "=q2=#n11#,  =q1=#z11#", "", "12.64%"};
		{ 23, 0, "INV_Box_01", "=q6="..AL["Rare Mounts"], ""};
		{ 24, 44168, "", "=q4=Reins of the Time-Lost Proto-Drake", "=q2=#n155#, =q1=#z37#", ""};
		{ 25, 46109, "", "=q3=Sea Turtle", "=q2=#p24#", ""};
		Next = "MountsRare2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsRare2"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Achievement Reward"], ""};
		{ 2, 44223, "", "=q4=Reins of the Black War Bear", "=ds=#e12# =ec1=#m7#"};
		{ 3, 44224, "", "=q4=Reins of the Black War Bear", "=ds=#e12# =ec1=#m6#"};
		{ 4, 44843, "", "=q4=Blue Dragonhawk Mount", "=ds=#e12# =ec1=#m7#"};
		{ 5, 44842, "", "=q4=Red Dragonhawk Mount", "=ds=#e12# =ec1=#m6#"};
		{ 6, 44178, "", "=q4=Reins of the Albino Drake", "=ds=#e12#"};
		{ 7, 44164, "", "=q4=Reins of the Black Proto-Drake", "=ds=#e12#"};
		{ 8, 45801, "", "=q4=Reins of the Ironbound Proto-Drake", "=ds=#e12#"};
		{ 9, 44175, "", "=q4=Reins of the Plagued Proto-Drake", "=ds=#e12#"};
		{ 10, 44160, "", "=q4=Reins of the Red Proto-Drake", "=ds=#e12#"};
		{ 11, 45802, "", "=q4=Reins of the Rusted Proto-Drake", "=ds=#e12#"};
		{ 12, "s60024", "Ability_Mount_Drake_Proto", "=q4=Reins of the Violet Proto-Drake", "=ds=#e12#"};
		Prev = "MountsRare1";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsCraftQuestPromotion1"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Quest Reward"], ""};
		{ 2, 21176, "", "=q5=Black Qiraji Resonating Crystal", "=q2=#m4#"};
		{ 3, 43962, "", "=q4=Reins of the White Polar Bear", "=q2=#m4#: #x39#", ""};
		{ 5, 0, "INV_Box_01", "=q6="..AL["Crafted Mounts"], ""};
		{ 6, 44558, "", "=q4=Magnificent Flying Carpet", "=q2=#p8#"};
		{ 7, 44413, "", "=q4=Mekgineer's Chopper", "=q2=#p5# =ec1=#m7#"};
		{ 8, 41508, "", "=q4=Mechano-hog", "=q2=#p5# =ec1=#m6#"};
		{ 9, 34061, "", "=q4=Turbo-Charged Flying Machine Control", "=q2=#p5#"};
		{ 10, 44554, "", "=q3=Flying Carpet", "=q2=#p8#"};
		{ 11, 34060, "", "=q3=Flying Machine Control", "=q2=#p5#"};
		{ 16, 0, "INV_Box_01", "=q6="..AL["Promotional Mounts"], ""};
		{ 17, 43599, "", "=q3=Big Blizzard Bear", "=ds=#e12#"};
		{ 18, 37719, "", "=q4=Swift Zhevra", "=ds=#e12#"};
		{ 20, 0, "INV_Box_01", "=q6="..AL["Card Game Mounts"], ""};
		{ 21, 38576, "", "=q4=Big Battle Bear", "=q2=#m24#"};
		{ 22, 46778, "", "=q4=Magic Rooster Egg", "=q2=#m24#"};
		{ 23, 33225, "", "=q4=Reins of the Swift Spectral Tiger", "=q2=#m24#"};
		{ 24, 23720, "", "=q4=Riding Turtle", "=q2=#m24#"};
		{ 25, 35226, "", "=q4=X-51 Nether-Rocket X-TREME", "=q2=#m24#"};
		{ 26, 33224, "", "=q3=Reins of the Spectral Tiger", "=q2=#m24#"};
		{ 27, 35225, "", "=q3=X-51 Nether-Rocket", "=q2=#m24#"};
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsEvent1"] = {
		{ 1, 0, "INV_BannerPVP_02", "=q6=#m7#", ""};
		{ 2, 45591, "", "=q4=Darnassian Nightsaber", "=ds=#e12#", "100 #champseal#"};
		{ 3, 45590, "", "=q4=Exodar Elekk", "=ds=#e12#", "100 #champseal#"};
		{ 4, 45589, "", "=q4=Gnomeregan Mechanostrider", "=ds=#e12#", "100 #champseal#"};
		{ 5, 45586, "", "=q4=Ironforge Ram", "=ds=#e12#", "100 #champseal#"};
		{ 6, 45125, "", "=q4=Stormwind Steed", "=ds=#e12#", "100 #champseal#"};
		{ 8, 46745, "", "=q4=Great Red Elekk", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 9, 46752, "", "=q4=Swift Gray Steed", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 10, 46744, "", "=q4=Swift Moonsaber", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 11, 46748, "", "=q4=Swift Violet Ram", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 12, 46747, "", "=q4=Turbostrider", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 14, 45725, "", "=q4=Argent Hippogryph", "=ds=#e12#", "150 #champseal#"};
		{ 16, 0, "INV_BannerPVP_01", "=q6=#m6#", ""};
		{ 17, 45593, "", "=q4=Darkspear Raptor", "=ds=#e12#", "100 #champseal#"};
		{ 18, 45597, "", "=q4=Forsaken Warhorse", "=ds=#e12#", "100 #champseal#"};
		{ 19, 45595, "", "=q4=Orgrimmar Wolf", "=ds=#e12#", "100 #champseal#"};
		{ 20, 45596, "", "=q4=Silvermoon Hawkstrider", "=ds=#e12#", "100 #champseal#"};
		{ 21, 45592, "", "=q4=Thunder Bluff Kodo", "=ds=#e12#", "100 #champseal#"};
		{ 23, 46750, "", "=q4=Great Golden Kodo", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 24, 46749, "", "=q4=Swift Burgundy Wolf", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 25, 46743, "", "=q4=Swift Purple Raptor", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 26, 46751, "", "=q4=Swift Red Hawkstrider", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		{ 27, 46746, "", "=q4=White Skeletal Warhorse", "=ds=#e12#", "500 #gold# 5 #champseal#"};
		Next = "MountsEvent2";
		Back = "MOUNTMENU";
	};

	AtlasLoot_Data["MountsEvent2"] = {
		{ 1, 0, "INV_Box_01", "=q6="..AL["Brewfest"], ""};
		{ 2, 37828, "", "=q4=Great Brewfest Kodo", "=q2=#n150#"};
		{ 3, 33977, "", "=q4=Swift Brewfest Ram", "=q2=#n150#"};
		{ 4, 33976, "", "=q3=Brewfest Ram", "=ds=#e12#"};
		{ 6, 0, "INV_Box_01", "=q6="..AL["Hallow's End"], ""};
		{ 7, 37012, "", "=q4=The Horseman's Reins", "=q2=#n136#"};
		{ 8, 37011, "", "=q3=Magic Broom", "=q2=#n136#"};
		Prev = "MountsEvent1";
		Back = "MOUNTMENU";
	};

		-----------------------
		--- BoE World Epics ---
		-----------------------

	AtlasLoot_Data["WorldEpicsWrath1"] = {
		{ 1, 44309, "", "=q4=Sash of Jordan", "=ds=#s10#, #a1#"};
		{ 2, 44312, "", "=q4=Wapach's Spaulders of Solidarity", "=ds=#s3#, #a4#"};
		{ 3, 44308, "", "=q4=Signet of Edward the Odd", "=ds=#s13#"};
		{ 4, 37835, "", "=q4=Je'Tze's Bell", "=ds=#s14#"};
		{ 5, 37254, "", "=q4=Super Simian Sphere", "=ds=#s14#"};
		{ 16, 44310, "", "=q4=Namlak's Supernumerary Sticker", "=ds=#h1#, #w4#"};
		{ 17, 43613, "", "=q4=The Dusk Blade", "=ds=#h1#, #w4#"};
		{ 18, 44311, "", "=q4=Avool's Sword of Jin", "=ds=#h1#, #w10#"};
		{ 19, 43611, "", "=q4=Krol Cleaver", "=ds=#h1#, #w10#"};
		{ 20, 44313, "", "=q4=Zom's Crackling Bulwark", "=ds=#w8#"};
		{ 21, 43612, "", "=q4=Spineslicer", "=ds=#w11#"};
		Prev = "WorldEpics4";
		Back = "WORLDEPICS";
	};

		-------------------------------
		--- Emblem of Heroism Items ---
		-------------------------------

	AtlasLoot_Data["EmblemofHeroism"] = {
		{ 1, 0, "INV_Box_01", "=q6=#a1#", ""};
		{ 2, 40697, "", "=q4=Elegant Temple Gardens' Girdle", "=ds=#s10#, #a1#", "40 #eofheroism#"};
		{ 3, 40696, "", "=q4=Plush Sash of Guzbah", "=ds=#s10#, #a1#", "40 #eofheroism#"};
		{ 5, 0, "INV_Box_01", "=q6=#a2#", ""};
		{ 6, 40694, "", "=q4=Jorach's Crocolisk Skin Belt", "=ds=#s10#, #a2#", "40 #eofheroism#"};
		{ 7, 40695, "", "=q4=Vine Belt of the Woodland Dryad", "=ds=#s10#, #a2#", "40 #eofheroism#"};
		{ 9, 0, "INV_Box_01", "=q6=#a3#", ""};
		{ 10, 40693, "", "=q4=Beadwork Belt of Shamanic Vision", "=ds=#s10#, #a3#", "40 #eofheroism#"};
		{ 11, 40692, "", "=q4=Vereesa's Silver Chain Belt", "=ds=#s10#, #a3#", "40 #eofheroism#"};
		{ 16, 0, "INV_Box_01", "=q6=#a4#", ""};
		{ 17, 40691, "", "=q4=Magroth's Meditative Cincture", "=ds=#s10#, #a4#", "40 #eofheroism#"};
		{ 18, 40688, "", "=q4=Verdungo's Barbarian Cord", "=ds=#s10#, #a4#", "40 #eofheroism#"};
		{ 19, 40689, "", "=q4=Waistguard of Living Iron", "=ds=#s10#, #a4#", "40 #eofheroism#"};
		{ 21, 0, "INV_Box_01", "=q6="..AL["Misc"], ""}; 
		{ 22, 44230, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e12# =ec1=#m7#", "200 #eofheroism#"};
		{ 23, 44231, "", "=q4=Reins of the Wooly Mammoth", "=ds=#e12# =ec1=#m6#", "200 #eofheroism#"};
		{ 24, 40610, "", "=q4=Chestguard of the Lost Conqueror", "=ds=#e15#", "80 #eofheroism#"};
		{ 25, 40611, "", "=q4=Chestguard of the Lost Protector", "=ds=#e15#", "80 #eofheroism#"};
		{ 26, 40612, "", "=q4=Chestguard of the Lost Vanquisher", "=ds=#e15#", "80 #eofheroism#"};
		{ 27, 40613, "", "=q4=Gloves of the Lost Conqueror", "=ds=#e15#", "60 #eofheroism#"};
		{ 28, 40614, "", "=q4=Gloves of the Lost Protector", "=ds=#e15#", "60 #eofheroism#"};
		{ 29, 40615, "", "=q4=Gloves of the Lost Vanquisher", "=ds=#e15#", "60 #eofheroism#"};
		{ 30, 43102, "", "=q3=Frozen Orb", "=ds=#e15#", "10 #eofheroism#"};
		Next = "EmblemofHeroism2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["EmblemofHeroism2"] = {
		{ 1, 0, "INV_Box_01", "=q6=#j50#", ""};
		{ 2, 40704, "", "=q4=Pride", "=ds=#w13#, #h4#", "50 #eofheroism#"};
		{ 3, 40702, "", "=q4=Rolfsen's Ripper", "=ds=#w4#, #h4#", "50 #eofheroism#"};
		{ 4, 40703, "", "=q4=Grasscutter", "=ds=#w10#, #h4#", "50 #eofheroism#"};
		{ 5, 40716, "", "=q4=Lillehoff's Winged Blades", "=ds=#w11#", "15 #eofheroism#"};
		{ 6, 40701, "", "=q4=Crygil's Discarded Plate Panel", "=ds=#w8#", "35 #eofheroism#"};
		{ 7, 40700, "", "=q4=Protective Barricade of the Light", "=ds=#w8#", "35 #eofheroism#"};
		{ 8, 40699, "", "=q4=Handbook of Obscure Remedies", "=ds=#s15#", "25 #eofheroism#"};
		{ 9, 40698, "", "=q4=Ward of the Violet Citadel", "=ds=#s15#", "25 #eofheroism#"};
		{ 16, 0, "INV_Box_01", "=q6=#j51#", ""};
		{ 17, 40679, "", "=q4=Chained Military Gorget", "=ds=#s2#", "25 #eofheroism#"};
		{ 18, 40680, "", "=q4=Encircling Burnished Gold Chains", "=ds=#s2#", "25 #eofheroism#"};
		{ 19, 40681, "", "=q4=Lattice Choker of Light", "=ds=#s2#", "25 #eofheroism#"};
		{ 20, 40678, "", "=q4=Pendant of the Outcast Hero", "=ds=#s2#", "25 #eofheroism#"};
		{ 21, 40684, "", "=q4=Mirror of Truth", "=ds=#s14#", "40 #eofheroism#"};
		{ 22, 40682, "", "=q4=Sundial of the Exiled", "=ds=#s14#", "40 #eofheroism#"};
		{ 23, 40685, "", "=q4=The Egg of Mortal Essence", "=ds=#s14#", "40 #eofheroism#"};
		{ 24, 40683, "", "=q4=Valor Medal of the First War", "=ds=#s14#", "40 #eofheroism#"};
		Prev = "EmblemofHeroism";
		Next = "EmblemofHeroism3";
		Back = "SETMENU";
	};

	AtlasLoot_Data["EmblemofHeroism3"] = {
		{ 1, 0, "INV_Box_01", "=q6=#w14#", ""};
		{ 2, 40711, "", "=q4=Idol of Lush Moss", "=ds=#w14#", "15 #eofheroism#"};
		{ 3, 40712, "", "=q4=Idol of Steadfast Renewal", "=ds=#w14#", "15 #eofheroism#"};
		{ 4, 40713, "", "=q4=Idol of the Ravenous Beast", "=ds=#w14#", "15 #eofheroism#"};
		{ 5, 0, "INV_Box_01", "=q6=#w16#", ""};
		{ 6, 40707, "", "=q4=Libram of Obstruction", "=ds=#w16#", "15 #eofheroism#"};
		{ 7, 40706, "", "=q4=Libram of Reciprocation", "=ds=#w16#", "15 #eofheroism#"};
		{ 8, 40705, "", "=q4=Libram of Renewal", "=ds=#w16#", "15 #eofheroism#"};
		{ 9, 0, "INV_Box_01", "=q6=#w21#", ""};
		{ 10, 40715, "", "=q4=Sigil of Haunted Dreams", "=ds=#w21#", "15 #eofheroism#"};
		{ 11, 40714, "", "=q4=Sigil of the Unfaltering Knight", "=ds=#w21#", "15 #eofheroism#"};
		{ 12, 0, "INV_Box_01", "=q6=#w15#", ""};
		{ 13, 40709, "", "=q4=Totem of Forest Growth", "=ds=#w15#", "15 #eofheroism#"};
		{ 14, 40710, "", "=q4=Totem of Splintering", "=ds=#w15#", "15 #eofheroism#"};
		{ 15, 40708, "", "=q4=Totem of the Elemental Plane", "=ds=#w15#", "15 #eofheroism#"};
		{ 16, 0, "INV_Box_01", "=q6=#j52#", ""};
		{ 17, 42985, "", "=q7=Tattered Dreadmist Mantle", "=ds=#s3#, #a1#", "40 #eofheroism#"};
		{ 18, 42984, "", "=q7=Preened Ironfeather Shoulders", "=ds=#s3#, #a2#", "40 #eofheroism#"};
		{ 19, 42952, "", "=q7=Stained Shadowcraft Spaulders", "=ds=#s3#, #a2#", "40 #eofheroism#"};
		{ 20, 42950, "", "=q7=Champion Herod's Shoulder", "=ds=#s3#, #a3#", "40 #eofheroism#"};
		{ 21, 42951, "", "=q7=Mystical Pauldrons of Elements", "=ds=#s3#, #a3#", "40 #eofheroism#"};
		{ 22, 42949, "", "=q7=Polished Spaulders of Valor", "=ds=#s3#, #a4#", "40 #eofheroism#"};
		{ 23, 42992, "", "=q7=Discerning Eye of the Beast", "=ds=#s14#", "50 #eofheroism#"};
		{ 24, 42991, "", "=q7=Swift Hand of Justice", "=ds=#s14#", "50 #eofheroism#"};
		{ 25, 42944, "", "=q7=Balanced Heartseeker", "=ds=#w4#, #h1#", "40 #eofheroism#"};
		{ 26, 42945, "", "=q7=Venerable Dal'Rend's Sacred Charge", "=ds=#w10#, #h3#", "40 #eofheroism#"};
		{ 27, 42943, "", "=q7=Bloodied Arcanite Reaper", "=ds=#w1#, #h2#", "65 #eofheroism#"};
		{ 28, 42948, "", "=q7=Devout Aurastone Hammer", "=ds=#w6#, #h3#", "50 #eofheroism#"};
		{ 29, 42947, "", "=q7=Dignified Headmaster's Charge", "=ds=#w9#", "65 #eofheroism#"};
		{ 30, 42946, "", "=q7=Charmed Ancient Bone Bow", "=ds=#w2#", "65 #eofheroism#"};
		Prev = "EmblemofHeroism2";
		Back = "SETMENU";
	};

		-----------------------------
		--- Emblem of Valor Items ---
		-----------------------------

	AtlasLoot_Data["EmblemofValor"] = {
		{ 1, 40724, "", "=q4=Cloak of Kea Feathers", "=ds=#s4#", "25 #eofvalor#"};
		{ 2, 40723, "", "=q4=Disguise of the Kumiho", "=ds=#s4#", "25 #eofvalor#"};
		{ 3, 40722, "", "=q4=Platinum Mesh Cloak", "=ds=#s4#", "25 #eofvalor#"};
		{ 4, 40721, "", "=q4=Hammerhead Sharkskin Cloak", "=ds=#s4#", "25 #eofvalor#"};
		{ 6, 40741, "", "=q4=Cuffs of the Shadow Ascendant", "=ds=#s8#, #a1#", "60 #eofvalor#"};
		{ 7, 40740, "", "=q4=Wraps of the Astral Traveler", "=ds=#s8#, #a1#", "60 #eofvalor#"};
		{ 8, 40751, "", "=q4=Slippers of the Holy Light", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 9, 40750, "", "=q4=Xintor's Expeditionary Boots", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 11, 40739, "", "=q4=Bands of the Great Tree", "=ds=#s8#, #a2#", "60 #eofvalor#"};
		{ 12, 40738, "", "=q4=Wristwraps of the Cutthroat", "=ds=#s8#, #a2#", "60 #eofvalor#"};
		{ 13, 40748, "", "=q4=Boots of Captain Ellis", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 14, 40749, "", "=q4=Rainey's Chewed Boots", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 16, 40736, "", "=q4=Armguard of the Tower Archer", "=ds=#s8#, #a3#", "60 #eofvalor#"};
		{ 17, 40737, "", "=q4=Pigmented Clan Bindings", "=ds=#s8#, #a3#", "60 #eofvalor#"};
		{ 18, 40746, "", "=q4=Pack-Ice Striders", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 19, 40747, "", "=q4=Treads of Coastal Wandering", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 21, 40734, "", "=q4=Bracers of Dalaran's Parapets", "=ds=#s8#, #a4#", "60 #eofvalor#"};
		{ 22, 40733, "", "=q4=Wristbands of the Sentinel Huntress", "=ds=#s8#, #a4#", "60 #eofvalor#"};
		{ 23, 40735, "", "=q4=Zartson's Jungle Vambraces", "=ds=#s8#, #a4#", "60 #eofvalor#"};
		{ 24, 40742, "", "=q4=Bladed Steelboots", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 25, 40743, "", "=q4=Kyzoc's Ground Stompers", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		{ 26, 40745, "", "=q4=Sabatons of Rapid Recovery", "=ds=#s12#, #a1#", "40 #eofvalor#"};
		Next = "EmblemofValor2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["EmblemofValor2"] = {
		{ 1, 40719, "", "=q4=Band of Channeled Magic", "=ds=#s13#", "25 #eofvalor#"};
		{ 2, 40720, "", "=q4=Renewal of Life", "=ds=#s13#", "25 #eofvalor#"};
		{ 3, 40717, "", "=q4=Ring of Invincibility", "=ds=#s13#", "25 #eofvalor#"};
		{ 4, 40718, "", "=q4=Signet of the Impregnable Fortress", "=ds=#s13#", "25 #eofvalor#"};
		{ 6, 40637, "", "=q4=Mantle of the Lost Conqueror", "=ds=#e15#", "60 #eofvalor#"};
		{ 7, 40638, "", "=q4=Mantle of the Lost Protector", "=ds=#e15#", "60 #eofvalor#"};
		{ 8, 40639, "", "=q4=Mantle of the Lost Vanquisher", "=ds=#e15#", "60 #eofvalor#"};
		{ 10, 40634, "", "=q4=Legplates of the Lost Conqueror", "=ds=#e15#", "75 #eofvalor#"};
		{ 11, 40635, "", "=q4=Legplates of the Lost Protector", "=ds=#e15#", "75 #eofvalor#"};
		{ 12, 40636, "", "=q4=Legplates of the Lost Vanquisher", "=ds=#e15#", "75 #eofvalor#"};
		{ 16, 40342, "", "=q4=Idol of Awakening", "=ds=#s16#, #w14#", "25 #eofvalor#" };
		{ 17, 40321, "", "=q4=Idol of the Shooting Star", "=ds=#s16#, #w14#", "25 #eofvalor#" };
		{ 18, 39757, "", "=q4=Idol of Worship", "=ds=#s16#, #w14#", "25 #eofvalor#" };
		{ 19, 40191, "", "=q4=Libram of Radiance", "=ds=#s16#, #w16#", "25 #eofvalor#" };
		{ 20, 40337, "", "=q4=Libram of Resurgence", "=ds=#s16#, #w16#", "25 #eofvalor#" };
		{ 21, 40268, "", "=q4=Libram of Tolerance", "=ds=#s16#, #w16#", "25 #eofvalor#" };
		{ 22, 40207, "", "=q4=Sigil of Awareness", "=ds=#s16#, #w21#", "25 #eofvalor#" };
		{ 23, 40322, "", "=q4=Totem of Dueling", "=ds=#s16#, #w15#", "25 #eofvalor#" };
		{ 24, 40267, "", "=q4=Totem of Hex", "=ds=#s16#, #w15#", "25 #eofvalor#" };
		{ 25, 39728, "", "=q4=Totem of Misery", "=ds=#s16#, #w15#", "25 #eofvalor#" };
		Prev = "EmblemofValor";
		Back = "SETMENU";
	};

		--------------------------------
		--- Emblem of Conquest Items ---
		--------------------------------

	AtlasLoot_Data["EmblemofConquest1"] = {
		{ 1, 45840, "", "=q4=Touch of the Occult", "=ds=#s9#, #a1#", "28 #eofconquest#" };
		{ 2, 45839, "", "=q4=Grips of the Secret Grove", "=ds=#s9#, #a2#", "28 #eofconquest#" };
		{ 3, 45838, "", "=q4=Gloves of the Blind Stalker", "=ds=#s9#, #a2#", "28 #eofconquest#" };
		{ 4, 45836, "", "=q4=Gloves of Unerring Aim", "=ds=#s9#, #a3#", "28 #eofconquest#" };
		{ 5, 45837, "", "=q4=Gloves of Augury", "=ds=#s9#, #a3#", "28 #eofconquest#" };
		{ 6, 45835, "", "=q4=Gauntlets of Serene Blessing", "=ds=#s9#, #a4#", "28 #eofconquest#" };
		{ 7, 45833, "", "=q4=Bladebreaker Gauntlets", "=ds=#s9#, #a4#", "28 #eofconquest#" };
		{ 8, 45834, "", "=q4=Gauntlets of the Royal Watch", "=ds=#s9#, #a4#", "28 #eofconquest#" };
		{ 10, 45822, "", "=q4=Evoker's Charm", "=ds=#s2#", "19 #eofconquest#" };
		{ 11, 45823, "", "=q4=Frozen Tear of Elune", "=ds=#s2#", "19 #eofconquest#" };
		{ 12, 45820, "", "=q4=Broach of the Wailing Night", "=ds=#s2#", "19 #eofconquest#" };
		{ 13, 45819, "", "=q4=Spiked Battleguard Choker", "=ds=#s2#", "19 #eofconquest#" };
		{ 14, 45821, "", "=q4=Shard of the Crystal Forest", "=ds=#s2#", "19 #eofconquest#" };
		{ 16, 45831, "", "=q4=Sash of Potent Incantations", "=ds=#s10#, #a1#", "28 #eofconquest#" };
		{ 17, 45830, "", "=q4=Belt of the Living Thicket", "=ds=#s10#, #a2#", "28 #eofconquest#" };
		{ 18, 45829, "", "=q4=Belt of the Twilight Assassin", "=ds=#s10#, #a2#", "28 #eofconquest#" };
		{ 19, 45827, "", "=q4=Belt of the Ardent Marksman", "=ds=#s10#, #a3#", "28 #eofconquest#" };
		{ 20, 45828, "", "=q4=Windchill Binding", "=ds=#s10#, #a3#", "28 #eofconquest#" };
		{ 21, 45826, "", "=q4=Girdle of Unyielding Trust", "=ds=#s10#, #a4#", "28 #eofconquest#" };
		{ 22, 45824, "", "=q4=Belt of the Singing Blade", "=ds=#s10#, #a4#", "28 #eofconquest#" };
		{ 23, 45825, "", "=q4=Shieldwarder Girdle", "=ds=#s10#, #a4#", "28 #eofconquest#" };
		Next = "EmblemofConquest2";
		Back = "SETMENU";
	};

	AtlasLoot_Data["EmblemofConquest2"] = {
		{ 1, 45848, "", "=q4=Legwraps of the Master Conjurer", "=ds=#s11#, #a1#", "39 #eofconquest#" };
		{ 2, 45847, "", "=q4=Wildstrider Legguards", "=ds=#s11#, #a2#", "39 #eofconquest#" };
		{ 3, 45846, "", "=q4=Leggings of Wavering Shadow", "=ds=#s11#, #a2#", "39 #eofconquest#" };
		{ 4, 45844, "", "=q4=Leggings of the Tireless Sentry", "=ds=#s11#, #a3#", "39 #eofconquest#" };
		{ 5, 45845, "", "=q4=Leggings of the Weary Mystic", "=ds=#s11#, #a3#", "39 #eofconquest#" };
		{ 6, 45843, "", "=q4=Legguards of the Peaceful Covenant", "=ds=#s11#, #a4#", "39 #eofconquest#" };
		{ 7, 45841, "", "=q4=Legplates of the Violet Champion", "=ds=#s11#, #a4#", "39 #eofconquest#" };
		{ 8, 45842, "", "=q4=Wyrmguard Legplates", "=ds=#s11#, #a4#", "39 #eofconquest#" };
		{ 10, 40753, "", "=q4=Emblem of Valor", "=ds=", "1 #eofconquest#" };
		{ 11, 45087, "", "=q3=Runed Orb", "=ds=", "18 #eofconquest#" };
		{ 16, 45632, "", "=q4=Breastplate of the Wayward Conqueror", "=ds=", "58 #eofconquest#" };
		{ 17, 45633, "", "=q4=Breastplate of the Wayward Protector", "=ds=", "58 #eofconquest#" };
		{ 18, 45634, "", "=q4=Breastplate of the Wayward Vanquisher", "=ds=", "58 #eofconquest#" };
		{ 20, 45638, "", "=q4=Crown of the Wayward Conqueror", "=ds=", "58 #eofconquest#" };
		{ 21, 45639, "", "=q4=Crown of the Wayward Protector", "=ds=", "58 #eofconquest#" };
		{ 22, 45640, "", "=q4=Crown of the Wayward Vanquisher", "=ds=", "58 #eofconquest#" };
		Prev = "EmblemofConquest1";
		Back = "SETMENU";
	};
