local BabbleClass = LibStub("LibBabble-Class-3.0"):GetLookupTable();
local BabbleZone = LibStub("LibBabble-Zone-3.0"):GetLookupTable();
local BabbleInventory = LibStub("LibBabble-Inventory-3.0"):GetLookupTable();
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

AtlasLoot_Data["CRAFTINGMENU"] = {
        { 2, "ALCHEMYMENU", "INV_Potion_23", "=ds="..GetSpellInfo(2259), ""};
        { 3, "SMITHINGMENU", "Trade_BlackSmithing", "=ds="..GetSpellInfo(2018), ""};
        { 4, "ENCHANTINGMENU", "Trade_Engraving", "=ds="..GetSpellInfo(7411), ""};
        { 5, "ENGINEERINGMENU", "Trade_Engineering", "=ds="..GetSpellInfo(4036), ""};
        { 6, "INSCRIPTIONMENU", "INV_Inscription_Tradeskill01", "=ds="..GetSpellInfo(45357), ""};
        { 7, "JEWELCRAFTINGMENU", "INV_Misc_Gem_01", "=ds="..GetSpellInfo(25229), ""};
        { 8, "LEATHERWORKINGMENU", "INV_Misc_ArmorKit_17", "=ds="..GetSpellInfo(2108), ""};
        { 9, "Mining1", "Trade_Mining", "=ds="..GetSpellInfo(2575), ""};
        { 10, "TAILORINGMENU", "Trade_Tailoring", "=ds="..GetSpellInfo(3908), ""};
        { 17, "Cooking1", "INV_Misc_Food_15", "=ds="..GetSpellInfo(2550), ""};
        { 18, "FirstAid1", "Spell_Holy_SealOfSacrifice", "=ds="..GetSpellInfo(3273), ""};
        { 20, "CRAFTSET", "INV_Box_01", AL["Crafted Sets"], ""};
        { 21, "CraftedWeapons1", "INV_Sword_1H_Blacksmithing_02", AL["Crafted Epic Weapons"], ""};
		{ 23, "JewelcraftingDaily", "INV_Misc_Gem_01", AL["Jewelcrafting Daily"], ""};
		{ 24, "CookingDaily", "INV_Misc_Food_15", AL["Cooking Daily"], ""};
	};

AtlasLoot_Data["CRAFTSET"] = {
        { 1, "", "INV_Chest_Plate05", "=q6="..GetSpellInfo(2018), "=q5="..BabbleInventory["Plate"] };
        { 2, "ImperialPlate", "INV_Belt_01", "=ds="..AL["Imperial Plate"], "" };
        { 3, "TheDarksoul", "INV_Shoulder_01", "=ds="..AL["The Darksoul"], "" };
        { 4, "FelIronPlate", "INV_Chest_Plate07", "=ds="..AL["Fel Iron Plate"], "" };
        { 5, "AdamantiteB", "INV_Gauntlets_30", "=ds="..AL["Adamantite Battlegear"], "" };
        { 6, "FlameG", "INV_Helmet_22", "=ds="..AL["Flame Guard"], "=q5="..AL["Fire Resistance Gear"] };
        { 7, "EnchantedAdaman", "INV_Belt_29", "=ds="..AL["Enchanted Adamantite Armor"], "=q5="..AL["Arcane Resistance Gear"] };
        { 8, "KhoriumWard", "INV_Boots_Chain_01", "=ds="..AL["Khorium Ward"], "" };
        { 9, "FaithFelsteel", "INV_Pants_Plate_06", "=ds="..AL["Faith in Felsteel"], "" };
        { 10, "BurningRage", "INV_Gauntlets_26", "=ds="..AL["Burning Rage"], "" };
        { 12, "", "INV_Chest_Chain_04", "=q6="..GetSpellInfo(2018), "=q5="..BabbleInventory["Mail"] };
        { 13, "BloodsoulEmbrace", "INV_Shoulder_15", "=ds="..AL["Bloodsoul Embrace"], "" };
        { 14, "FelIronChain", "INV_Helmet_35", "=ds="..AL["Fel Iron Chain"], "" };
        { 16, "", "INV_Chest_Cloth_21", "=q6="..GetSpellInfo(3908), "" };
        { 17, "BloodvineG", "INV_Pants_Cloth_14", "=ds="..AL["Bloodvine Garb"], "" };
        { 18, "NeatherVest", "INV_Chest_Cloth_29", "=ds="..AL["Netherweave Vestments"], "" };
        { 19, "ImbuedNeather", "INV_Pants_Leather_09", "=ds="..AL["Imbued Netherweave"], "" };
        { 20, "ArcanoVest", "INV_Chest_Cloth_01", "=ds="..AL["Arcanoweave Vestments"], "=q5="..AL["Arcane Resistance Gear"] };
        { 21, "TheUnyielding", "INV_Belt_03", "=ds="..AL["The Unyielding"], "" };
        { 22, "WhitemendWis", "INV_Helmet_53", "=ds="..AL["Whitemend Wisdom"], "" };
        { 23, "SpellstrikeInfu", "INV_Pants_Cloth_14", "=ds="..AL["Spellstrike Infusion"], "" };
        { 24, "BattlecastG", "INV_Helmet_70", "=ds="..AL["Battlecast Garb"], "" };
        { 25, "SoulclothEm", "INV_Chest_Cloth_12", "=ds="..AL["Soulcloth Embrace"], "=q5="..AL["Arcane Resistance Gear"] };
        { 26, "PrimalMoon", "INV_Chest_Cloth_04", "=ds="..AL["Primal Mooncloth"], "=q5="..GetSpellInfo(26798) };
        { 27, "ShadowEmbrace", "INV_Shoulder_25", "=ds="..AL["Shadow's Embrace"], "=q5="..GetSpellInfo(26801) };
        { 28, "SpellfireWrath", "INV_Gauntlets_19", "=ds="..AL["Wrath of Spellfire"], "=q5="..GetSpellInfo(26797) };
        Back = "CRAFTINGMENU";
        Next = "CRAFTSET2";
    };

AtlasLoot_Data["CRAFTSET2"] = {
        { 1, "", "INV_Chest_Leather_04", "=q6="..GetSpellInfo(2108), "=q5="..BabbleInventory["Leather"] };
        { 2, "VolcanicArmor", "INV_Pants_06", "=ds="..AL["Volcanic Armor"], "=q5="..AL["Fire Resistance Gear"] };
        { 3, "IronfeatherArmor", "INV_Chest_Leather_06", "=ds="..AL["Ironfeather Armor"], "" };
        { 4, "StormshroudArmor", "INV_Chest_Leather_08", "=ds="..AL["Stormshroud Armor"], "" };
        { 5, "DevilsaurArmor", "INV_Pants_Wolf", "=ds="..AL["Devilsaur Armor"], "" };
        { 6, "BloodTigerH", "INV_Shoulder_23", "=ds="..AL["Blood Tiger Harness"], "" };
        { 7, "PrimalBatskin", "INV_Chest_Leather_03", "=ds="..AL["Primal Batskin"], "" };
        { 8, "WildDraenishA", "INV_Pants_Leather_07", "=ds="..AL["Wild Draenish Armor"], "" };
        { 9, "ThickDraenicA", "INV_Boots_Chain_01", "=ds="..AL["Thick Draenic Armor"], "" };
        { 10, "FelSkin", "INV_Gauntlets_22", "=ds="..AL["Fel Skin"], "" };
        { 11, "SClefthoof", "INV_Boots_07", "=ds="..AL["Strength of the Clefthoof"], "" };
        { 12, "PrimalIntent", "INV_Chest_Cloth_45", "=ds="..AL["Primal Intent"], "=q5="..GetSpellInfo(10658) };
        { 13, "WindhawkArmor", "INV_Chest_Leather_01", "=ds="..AL["Windhawk Armor"], "=q5="..GetSpellInfo(10660) };
        { 16, "", "INV_Chest_Chain_12", "=q6="..GetSpellInfo(2108), "=q5="..BabbleInventory["Mail"] };
        { 17, "GreenDragonM", "INV_Pants_05", "=ds="..AL["Green Dragon Mail"], "=q5="..AL["Nature Resistance Gear"] };
        { 18, "BlueDragonM", "INV_Chest_Chain_04", "=ds="..AL["Blue Dragon Mail"], "=q5="..AL["Arcane Resistance Gear"] };
        { 19, "BlackDragonM", "INV_Pants_03", "=ds="..AL["Black Dragon Mail"], "=q5="..AL["Fire Resistance Gear"] };
        { 20, "ScaledDraenicA", "INV_Pants_Mail_07", "=ds="..AL["Scaled Draenic Armor"], "" };
        { 21, "FelscaleArmor", "INV_Boots_Chain_08", "=ds="..AL["Felscale Armor"], "" };
        { 22, "FelstalkerArmor", "INV_Belt_13", "=ds="..AL["Felstalker Armor"], "" };
        { 23, "NetherFury", "INV_Pants_Plate_12", "=ds="..AL["Fury of the Nether"], "" };
        { 24, "NetherscaleArmor", "INV_Belt_29", "=ds="..AL["Netherscale Armor"], "=q5="..GetSpellInfo(10656) };
        { 25, "NetherstrikeArmor", "INV_Belt_03", "=ds="..AL["Netherstrike Armor"], "=q5="..GetSpellInfo(10656) };
        Back = "CRAFTINGMENU";
        Prev = "CRAFTSET";
    };
    
AtlasLoot_Data["ALCHEMYMENU"] = {
        { 2, "AlchemyBattleElixir1", "INV_Potion_23", "=ds="..AL["Battle Elixirs"], "" };
        { 3, "AlchemyPotion1", "INV_Potion_23", "=ds="..AL["Potions"], "" };
        { 4, "AlchemyTransmute1", "INV_Potion_23", "=ds="..AL["Transmutes"], "" };
        { 17, "AlchemyGuardianElixir1", "INV_Potion_23", "=ds="..AL["Guardian Elixirs"], "" };
        { 18, "AlchemyFlask1", "INV_Potion_23", "=ds="..AL["Flasks"], "" };
        { 19, "AlchemyMisc1", "INV_Potion_23", "=ds="..AL["Miscellaneous"], "" };
        Back = "CRAFTINGMENU";
    };

AtlasLoot_Data["SMITHINGMENU"] = {
        { 2, "SmithingArmorOld1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Armor"], "=q5="..AL["Original WoW"] };
        { 3, "SmithingArmorBC1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Armor"], "=q5="..AL["Burning Crusade"] };
        { 4, "SmithingArmorWrath1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Armor"], "=q5="..AL["Wrath of the Lich King"] };
        { 5, "SmithingEnhancement1", "Trade_BlackSmithing", "=ds="..AL["Item Enhancements"], "" };
        { 7, "Armorsmith1", "Trade_BlackSmithing", "=ds="..GetSpellInfo(9788), "" };
        { 8, "Axesmith1", "Trade_BlackSmithing", "=ds="..GetSpellInfo(17041), "" };
        { 9, "Swordsmith1", "Trade_BlackSmithing", "=ds="..GetSpellInfo(17039), "" };
        { 17, "SmithingWeaponOld1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Weapon"], "=q5="..AL["Original WoW"] };
        { 18, "SmithingWeaponBC1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Weapon"], "=q5="..AL["Burning Crusade"] };
        { 19, "SmithingWeaponWrath1", "Trade_BlackSmithing", "=ds="..BabbleInventory["Weapon"], "=q5="..AL["Wrath of the Lich King"] };
        { 20, "SmithingMisc1", "Trade_BlackSmithing", "=ds="..AL["Miscellaneous"], "" };
        { 22, "Weaponsmith1", "Trade_BlackSmithing", "=ds="..GetSpellInfo(9787), "" };
        { 23, "Hammersmith1", "Trade_BlackSmithing", "=ds="..GetSpellInfo(17040), "" };
        Back = "CRAFTINGMENU";
    };
    
AtlasLoot_Data["ENCHANTINGMENU"] = {
        { 2, "EnchantingBoots1", "Trade_Engraving", "=ds="..AL["Enchant Boots"], "" };
        { 3, "EnchantingChest1", "Trade_Engraving", "=ds="..AL["Enchant Chest"], "" };
        { 4, "EnchantingGloves1", "Trade_Engraving", "=ds="..AL["Enchant Gloves"], "" };
        { 5, "EnchantingShield1", "Trade_Engraving", "=ds="..AL["Enchant Shield"], "" };
        { 6, "Enchanting2HWeapon1", "Trade_Engraving", "=ds="..AL["Enchant 2H Weapon"], "" };
        { 7, "EnchantingMisc1", "Trade_Engraving", "=ds="..AL["Miscellaneous"], "" };
        { 17, "EnchantingBracer1", "Trade_Engraving", "=ds="..AL["Enchant Bracer"], "" };
        { 18, "EnchantingCloak1", "Trade_Engraving", "=ds="..AL["Enchant Cloak"], "" };
        { 19, "EnchantingRing1", "Trade_Engraving", "=ds="..AL["Enchant Ring"], "" };
        { 20, "EnchantingStaff1", "Trade_Engraving", "=ds="..BabbleInventory["Staff"], "" };
        { 21, "EnchantingWeapon1", "Trade_Engraving", "=ds="..AL["Enchant Weapon"], "" };
        Back = "CRAFTINGMENU";
    };
    
AtlasLoot_Data["ENGINEERINGMENU"] = {
        { 2, "EngineeringAmmo1", "Trade_Engineering", "=ds="..AL["Ammunition"], "" };
        { 3, "EngineeringExplosives1", "Trade_Engineering", "=ds="..AL["Explosives"], "" };
        { 4, "EngineeringMisc1", "Trade_Engineering", "=ds="..AL["Miscellaneous"], "" };
        { 5, "EngineeringWeapon1", "Trade_Engineering", "=ds="..BabbleInventory["Weapon"], "" };
        { 7, "Gnomish1", "Trade_Engineering", "=ds="..GetSpellInfo(20220), "" };
        { 17, "EngineeringArmor1", "Trade_Engineering", "=ds="..BabbleInventory["Armor"], "" };
        { 18, "EngineeringItemEnhancements1", "Trade_Engineering", "=ds="..AL["Item Enhancements"], "" };
        { 19, "EngineeringReagents1", "Trade_Engineering", "=ds="..AL["Reagents"], "" };
        { 22, "Goblin1", "Trade_Engineering", "=ds="..GetSpellInfo(20221), "" };
        Back = "CRAFTINGMENU";
    };

AtlasLoot_Data["INSCRIPTIONMENU"] = {
        { 2, "Inscription_Scrolls1", "INV_Inscription_Tradeskill01", "=ds="..AL["Scrolls"], "" };
        { 3, "Inscription_Misc1", "INV_Inscription_Tradeskill01", "=ds="..AL["Miscellaneous"], "" };
        { 5, "Inscription_DeathKnightMajor1", "Spell_Deathknight_DeathStrike", "=ds="..BabbleClass["Deathknight"], "=q5="..AL["Major Glyph"] };
        { 6, "Inscription_DruidMajor1", "Spell_Nature_Regeneration", "=ds="..BabbleClass["Druid"], "=q5="..AL["Major Glyph"] };
        { 7, "Inscription_HunterMajor1", "Ability_Hunter_RunningShot", "=ds="..BabbleClass["Hunter"], "=q5="..AL["Major Glyph"] };
        { 8, "Inscription_MageMajor1", "Spell_Frost_IceStorm", "=ds="..BabbleClass["Mage"], "=q5="..AL["Major Glyph"] };
        { 9, "Inscription_PaladinMajor1", "Spell_Holy_SealOfMight", "=ds="..BabbleClass["Paladin"], "=q5="..AL["Major Glyph"] };
        { 10, "Inscription_PriestMajor1", "Spell_Holy_PowerWordShield", "=ds="..BabbleClass["Priest"], "=q5="..AL["Major Glyph"] };
        { 11, "Inscription_RogueMajor1", "Ability_BackStab", "=ds="..BabbleClass["Rogue"], "=q5="..AL["Major Glyph"] };
        { 12, "Inscription_ShamanMajor1", "Spell_FireResistanceTotem_01", "=ds="..BabbleClass["Shaman"], "=q5="..AL["Major Glyph"] };
        { 13, "Inscription_WarlockMajor1", "Spell_Shadow_CurseOfTounges", "=ds="..BabbleClass["Warlock"], "=q5="..AL["Major Glyph"] };
        { 14, "Inscription_WarriorMajor1", "Ability_Warrior_BattleShout", "=ds="..BabbleClass["Warrior"], "=q5="..AL["Major Glyph"] };
        { 17, "Inscription_OffHand1", "INV_Inscription_Tradeskill01", "=ds="..AL["Off-Hand Items"], "" };
        { 18, "Inscription_Reagents1", "INV_Inscription_Tradeskill01", "=ds="..AL["Reagents"], "" };
        { 20, "Inscription_DeathKnightMinor1", "Spell_Deathknight_DeathStrike", "=ds="..BabbleClass["Deathknight"], "=q5="..AL["Minor Glyph"] };
        { 21, "Inscription_DruidMinor1", "Spell_Nature_Regeneration", "=ds="..BabbleClass["Druid"], "=q5="..AL["Minor Glyph"] };
        { 22, "Inscription_HunterMinor1", "Ability_Hunter_RunningShot", "=ds="..BabbleClass["Hunter"], "=q5="..AL["Minor Glyph"] };
        { 23, "Inscription_MageMinor1", "Spell_Frost_IceStorm", "=ds="..BabbleClass["Mage"], "=q5="..AL["Minor Glyph"] };
        { 24, "Inscription_PaladinMinor1", "Spell_Holy_SealOfMight", "=ds="..BabbleClass["Paladin"], "=q5="..AL["Minor Glyph"] };
        { 25, "Inscription_PriestMinor1", "Spell_Holy_PowerWordShield", "=ds="..BabbleClass["Priest"], "=q5="..AL["Minor Glyph"] };
        { 26, "Inscription_RogueMinor1", "Ability_BackStab", "=ds="..BabbleClass["Rogue"], "=q5="..AL["Minor Glyph"] };
        { 27, "Inscription_ShamanMinor1", "Spell_FireResistanceTotem_01", "=ds="..BabbleClass["Shaman"], "=q5="..AL["Minor Glyph"] };
        { 28, "Inscription_WarlockMinor1", "Spell_Shadow_CurseOfTounges", "=ds="..BabbleClass["Warlock"], "=q5="..AL["Minor Glyph"] };
        { 29, "Inscription_WarriorMinor1", "Ability_Warrior_BattleShout", "=ds="..BabbleClass["Warrior"], "=q5="..AL["Minor Glyph"] };
        Back = "CRAFTINGMENU";
    };
    
AtlasLoot_Data["JEWELCRAFTINGMENU"] = {
        { 2, "JewelRed1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Red"].." "..BabbleInventory["Gem"], "" };
        { 3, "JewelBlue1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Blue"].." "..BabbleInventory["Gem"], "" };
        { 4, "JewelYellow1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Yellow"].." "..BabbleInventory["Gem"], "" };
        { 5, "JewelMeta1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Meta"].." "..BabbleInventory["Gem"], "" };
        { 7, "JewelNeck1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Neck"], "" };
        { 8, "JewelTrinket1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Trinket"], "" };
        { 17, "JewelGreen1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Green"].." "..BabbleInventory["Gem"], "" };
        { 18, "JewelOrange1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Orange"].." "..BabbleInventory["Gem"], "" };
        { 19, "JewelPurple1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Purple"].." "..BabbleInventory["Gem"], "" };
        { 20, "JewelPrismatic1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Prismatic"].." "..BabbleInventory["Gem"], "" };
        { 22, "JewelRing1", "INV_Misc_Gem_01", "=ds="..BabbleInventory["Ring"], "" };
        { 23, "JewelMisc1", "INV_Misc_Gem_01", "=ds="..AL["Miscellaneous"], "" };
        Back = "CRAFTINGMENU";
    };
    
AtlasLoot_Data["LEATHERWORKINGMENU"] = {
        { 2, "LeatherLeatherArmorOld1", "INV_Misc_ArmorKit_17", "=ds="..AL["Leather Armor"], "=q5="..AL["Original WoW"] };
        { 3, "LeatherLeatherArmorBC1", "INV_Misc_ArmorKit_17", "=ds="..AL["Leather Armor"], "=q5="..AL["Burning Crusade"] };
        { 4, "LeatherLeatherArmorWrath1", "INV_Misc_ArmorKit_17", "=ds="..AL["Leather Armor"], "=q5="..AL["Wrath of the Lich King"] };
        { 6, "LeatherCloaks1", "INV_Misc_ArmorKit_17", "=ds="..AL["Cloaks"], "" };
        { 7, "LeatherQuiversPouches1", "INV_Misc_ArmorKit_17", "=ds="..AL["Quivers and Ammo Pouches"], "" };
        { 8, "LeatherLeather1", "INV_Misc_ArmorKit_17", "=ds="..BabbleInventory["Leather"], "" };
        { 10, "Dragonscale1", "INV_Misc_ArmorKit_17", "=ds="..GetSpellInfo(10656), "" };
        { 11, "Tribal1", "INV_Misc_ArmorKit_17", "=ds="..GetSpellInfo(10660), "" };
        { 17, "LeatherMailArmorOld1", "INV_Misc_ArmorKit_17", "=ds="..AL["Mail Armor"], "=q5="..AL["Original WoW"] };
        { 18, "LeatherMailArmorBC1", "INV_Misc_ArmorKit_17", "=ds="..AL["Mail Armor"], "=q5="..AL["Burning Crusade"] };
        { 19, "LeatherMailArmorWrath1", "INV_Misc_ArmorKit_17", "=ds="..AL["Mail Armor"], "=q5="..AL["Wrath of the Lich King"] };
        { 21, "LeatherItemEnhancement1", "INV_Misc_ArmorKit_17", "=ds="..AL["Item Enhancements"], "" };
        { 22, "LeatherDrumsBagsMisc1", "INV_Misc_ArmorKit_17", "=ds="..AL["Drums, Bags and Misc."], "" };
        { 25, "Elemental1", "INV_Misc_ArmorKit_17", "=ds="..GetSpellInfo(10658), "" };
        Back = "CRAFTINGMENU";
    };
    
AtlasLoot_Data["TAILORINGMENU"] = {
        { 2, "TailoringArmorOld1", "Trade_Tailoring", "=ds="..AL["Cloth Armor"], "=q5="..AL["Original WoW"] };
        { 3, "TailoringArmorBC1", "Trade_Tailoring", "=ds="..AL["Cloth Armor"], "=q5="..AL["Burning Crusade"] };
        { 4, "TailoringArmorWotLK1", "Trade_Tailoring", "=ds="..AL["Cloth Armor"], "=q5="..AL["Wrath of the Lich King"] };
        { 6, "Mooncloth1", "Trade_Tailoring", "=ds="..GetSpellInfo(26798), "" };
        { 7, "Shadoweave1", "Trade_Tailoring", "=ds="..GetSpellInfo(26801), "" };
        { 17, "TailoringBags1", "Trade_Tailoring", "=ds="..AL["Bags"], "" };
        { 18, "TailoringMisc1", "Trade_Tailoring", "=ds="..AL["Miscellaneous"], "" };
        { 19, "TailoringShirts1", "Trade_Tailoring", "=ds="..AL["Shirts"], "" };
        { 21, "Spellfire1", "Trade_Tailoring", "=ds="..GetSpellInfo(26797), "" };
        Back = "CRAFTINGMENU";
    };

AtlasLoot_Data["EmptyTable"] = {
    };
