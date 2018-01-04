local BabbleClass = LibStub("LibBabble-Class-3.0"):GetLookupTable();
local BabbleZone = LibStub("LibBabble-Zone-3.0"):GetLookupTable();
local BabbleInventory = LibStub("LibBabble-Inventory-3.0"):GetLookupTable();
local AL = LibStub("AceLocale-3.0"):GetLocale("AtlasLoot");

local RED = "|cffff0000";
local ORANGE = "|cffFF8400";

function AtlasLootPVPSetMenu()
    for i = 1, 30, 1 do
        getglobal("AtlasLootItem_"..i):Hide();
    end
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i):Hide();
        getglobal("AtlasLootMenuItem_"..i).isheader = false;
    end
    getglobal("AtlasLootItemsFrame_BACK"):Show();
    getglobal("AtlasLootItemsFrame_BACK").lootpage = "LEVEL60PVPREWARDS";
    getglobal("AtlasLootItemsFrame_NEXT"):Hide();
    getglobal("AtlasLootItemsFrame_PREV"):Hide();
    --Druid
    AtlasLootMenuItem_3_Name:SetText(BabbleClass["Druid"]);
    AtlasLootMenuItem_3_Extra:SetText("");
    AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration");
    AtlasLootMenuItem_3.lootpage="PVPDruid";
    AtlasLootMenuItem_3:Show();
    --Mage
    AtlasLootMenuItem_4_Name:SetText(BabbleClass["Mage"]);
    AtlasLootMenuItem_4_Extra:SetText("");
    AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm");
    AtlasLootMenuItem_4.lootpage="PVPMage";
    AtlasLootMenuItem_4:Show();
    --Priest
    AtlasLootMenuItem_5_Name:SetText(BabbleClass["Priest"]);
    AtlasLootMenuItem_5_Extra:SetText("");
    AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield");
    AtlasLootMenuItem_5.lootpage="PVPPriest";
    AtlasLootMenuItem_5:Show();
    --Shaman
    AtlasLootMenuItem_6_Name:SetText(BabbleClass["Shaman"]);
    AtlasLootMenuItem_6_Extra:SetText("");
    AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01");
    AtlasLootMenuItem_6.lootpage="PVPShaman";
    AtlasLootMenuItem_6:Show();
    --Warrior
    AtlasLootMenuItem_7_Name:SetText(BabbleClass["Warrior"]);
    AtlasLootMenuItem_7_Extra:SetText("");
    AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Shield_05");
    AtlasLootMenuItem_7.lootpage="PVPWarrior";
    AtlasLootMenuItem_7:Show();
    --Hunter
    AtlasLootMenuItem_18_Name:SetText(BabbleClass["Hunter"]);
    AtlasLootMenuItem_18_Extra:SetText("");
    AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot");
    AtlasLootMenuItem_18.lootpage="PVPHunter";
    AtlasLootMenuItem_18:Show();
    --Paladin
    AtlasLootMenuItem_19_Name:SetText(BabbleClass["Paladin"]);
    AtlasLootMenuItem_19_Extra:SetText("");
    AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight");
    AtlasLootMenuItem_19.lootpage="PVPPaladin";
    AtlasLootMenuItem_19:Show();
    --Rogue
    AtlasLootMenuItem_20_Name:SetText(BabbleClass["Rogue"]);
    AtlasLootMenuItem_20_Extra:SetText("");
    AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Ability_BackStab");
    AtlasLootMenuItem_20.lootpage="PVPRogue";
    AtlasLootMenuItem_20:Show();
    --Warlock
    AtlasLootMenuItem_21_Name:SetText(BabbleClass["Warlock"]);
    AtlasLootMenuItem_21_Extra:SetText("");
    AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges");
    AtlasLootMenuItem_21.lootpage="PVPWarlock";
    AtlasLootMenuItem_21:Show();
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
    end
    AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["PvP Armor Sets"]..": "..AL["Level 60"]);
    AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLootPVP70RepSetMenu()
    for i = 1, 30, 1 do
        getglobal("AtlasLootItem_"..i):Hide();
    end
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i):Hide();
        getglobal("AtlasLootMenuItem_"..i).isheader = false;
    end
    getglobal("AtlasLootItemsFrame_BACK"):Show();
    getglobal("AtlasLootItemsFrame_BACK").lootpage = "LEVEL70PVPREWARDS";
    getglobal("AtlasLootItemsFrame_NEXT"):Hide();
    getglobal("AtlasLootItemsFrame_PREV"):Hide();
    --Druid
    AtlasLootMenuItem_3_Name:SetText(BabbleClass["Druid"]);
    AtlasLootMenuItem_3_Extra:SetText("");
    AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration");
    AtlasLootMenuItem_3.lootpage="PVP70RepLeather";
    AtlasLootMenuItem_3:Show();
    --Mage
    AtlasLootMenuItem_4_Name:SetText(BabbleClass["Mage"]);
    AtlasLootMenuItem_4_Extra:SetText("");
    AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm");
    AtlasLootMenuItem_4.lootpage="PVP70RepCloth";
    AtlasLootMenuItem_4:Show();
    --Priest
    AtlasLootMenuItem_5_Name:SetText(BabbleClass["Priest"]);
    AtlasLootMenuItem_5_Extra:SetText("");
    AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield");
    AtlasLootMenuItem_5.lootpage="PVP70RepCloth";
    AtlasLootMenuItem_5:Show();
    --Shaman
    AtlasLootMenuItem_6_Name:SetText(BabbleClass["Shaman"]);
    AtlasLootMenuItem_6_Extra:SetText("");
    AtlasLootMenuItem_6_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01");
    AtlasLootMenuItem_6.lootpage="PVP70RepMail";
    AtlasLootMenuItem_6:Show();
    --Warrior
    AtlasLootMenuItem_7_Name:SetText(BabbleClass["Warrior"]);
    AtlasLootMenuItem_7_Extra:SetText("");
    AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\INV_Shield_05");
    AtlasLootMenuItem_7.lootpage="PVP70RepPlate";
    AtlasLootMenuItem_7:Show();
    --Hunter
    AtlasLootMenuItem_18_Name:SetText(BabbleClass["Hunter"]);
    AtlasLootMenuItem_18_Extra:SetText("");
    AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot");
    AtlasLootMenuItem_18.lootpage="PVP70RepMail";
    AtlasLootMenuItem_18:Show();
    --Paladin
    AtlasLootMenuItem_19_Name:SetText(BabbleClass["Paladin"]);
    AtlasLootMenuItem_19_Extra:SetText("");
    AtlasLootMenuItem_19_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight");
    AtlasLootMenuItem_19.lootpage="PVP70RepPlate";
    AtlasLootMenuItem_19:Show();
    --Rogue
    AtlasLootMenuItem_20_Name:SetText(BabbleClass["Rogue"]);
    AtlasLootMenuItem_20_Extra:SetText("");
    AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Ability_BackStab");
    AtlasLootMenuItem_20.lootpage="PVP70RepLeather";
    AtlasLootMenuItem_20:Show();
    --Warlock
    AtlasLootMenuItem_21_Name:SetText(BabbleClass["Warlock"]);
    AtlasLootMenuItem_21_Extra:SetText("");
    AtlasLootMenuItem_21_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges");
    AtlasLootMenuItem_21.lootpage="PVP70RepCloth";
    AtlasLootMenuItem_21:Show();
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
    end
    AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["PvP Reputation Sets"]..": "..AL["Level 70"]);
    AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end

function AtlasLootARENASetMenu()
    for i = 1, 30, 1 do
        getglobal("AtlasLootItem_"..i):Hide();
    end
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i):Hide();
        getglobal("AtlasLootMenuItem_"..i).isheader = false;
    end
    getglobal("AtlasLootItemsFrame_BACK"):Show();
    getglobal("AtlasLootItemsFrame_BACK").lootpage = "LEVEL70PVPREWARDS";
    getglobal("AtlasLootItemsFrame_NEXT"):Hide();
    getglobal("AtlasLootItemsFrame_PREV"):Hide();
    --Druid Balance
    AtlasLootMenuItem_3_Name:SetText(BabbleClass["Druid"]);
    AtlasLootMenuItem_3_Extra:SetText(ORANGE..AL["Balance"]);
    AtlasLootMenuItem_3_Icon:SetTexture("Interface\\Icons\\Spell_Nature_InsectSwarm");
    AtlasLootMenuItem_3.lootpage="ArenaDruidBalance";
    AtlasLootMenuItem_3:Show();
    --Druid Feral
    AtlasLootMenuItem_4_Name:SetText(BabbleClass["Druid"]);
    AtlasLootMenuItem_4_Extra:SetText(ORANGE..AL["Feral"]);
    AtlasLootMenuItem_4_Icon:SetTexture("Interface\\Icons\\Ability_Druid_Maul");
    AtlasLootMenuItem_4.lootpage="ArenaDruidFeral";
    AtlasLootMenuItem_4:Show();
    --Druid Restoration
    AtlasLootMenuItem_5_Name:SetText(BabbleClass["Druid"]);
    AtlasLootMenuItem_5_Extra:SetText(ORANGE..AL["Restoration"]);
    AtlasLootMenuItem_5_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Regeneration");
    AtlasLootMenuItem_5.lootpage="ArenaDruidRestoration";
    AtlasLootMenuItem_5:Show();
    --Hunter
    AtlasLootMenuItem_7_Name:SetText(BabbleClass["Hunter"]);
    AtlasLootMenuItem_7_Extra:SetText("");
    AtlasLootMenuItem_7_Icon:SetTexture("Interface\\Icons\\Ability_Hunter_RunningShot");
    AtlasLootMenuItem_7.lootpage="ArenaHunter";
    AtlasLootMenuItem_7:Show();
    --Mage
    AtlasLootMenuItem_9_Name:SetText(BabbleClass["Mage"]);
    AtlasLootMenuItem_9_Extra:SetText("");
    AtlasLootMenuItem_9_Icon:SetTexture("Interface\\Icons\\Spell_Frost_IceStorm");
    AtlasLootMenuItem_9.lootpage="ArenaMage";
    AtlasLootMenuItem_9:Show();
    --Paladin Holy
    AtlasLootMenuItem_11_Name:SetText(BabbleClass["Paladin"]);
    AtlasLootMenuItem_11_Extra:SetText(ORANGE..AL["Holy"]);
    AtlasLootMenuItem_11_Icon:SetTexture("Interface\\Icons\\Spell_Holy_HolyBolt");
    AtlasLootMenuItem_11.lootpage="ArenaPaladinHoly";
    AtlasLootMenuItem_11:Show();
    --Paladin Protection
    AtlasLootMenuItem_12_Name:SetText(BabbleClass["Paladin"]);
    AtlasLootMenuItem_12_Extra:SetText(ORANGE..AL["Protection"]);
    AtlasLootMenuItem_12_Icon:SetTexture("Interface\\Icons\\Spell_Holy_SealOfMight");
    AtlasLootMenuItem_12.lootpage="ArenaPaladinProtection";
    AtlasLootMenuItem_12:Show();
    --Paladin Retribution
    AtlasLootMenuItem_13_Name:SetText(BabbleClass["Paladin"]);
    AtlasLootMenuItem_13_Extra:SetText(ORANGE..AL["Retribution"]);
    AtlasLootMenuItem_13_Icon:SetTexture("Interface\\Icons\\Spell_Holy_AuraOfLight");
    AtlasLootMenuItem_13.lootpage="ArenaPaladinRetribution";
    AtlasLootMenuItem_13:Show();
    --Priest Holy
    AtlasLootMenuItem_17_Name:SetText(BabbleClass["Priest"]);
    AtlasLootMenuItem_17_Extra:SetText(ORANGE..AL["Holy"]);
    AtlasLootMenuItem_17_Icon:SetTexture("Interface\\Icons\\Spell_Holy_PowerWordShield");
    AtlasLootMenuItem_17.lootpage="ArenaPriestHoly";
    AtlasLootMenuItem_17:Show();
    --Priest Shadow
    AtlasLootMenuItem_18_Name:SetText(BabbleClass["Priest"]);
    AtlasLootMenuItem_18_Extra:SetText(ORANGE..AL["Shadow"]);
    AtlasLootMenuItem_18_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_AntiShadow");
    AtlasLootMenuItem_18.lootpage="ArenaPriestShadow";
    AtlasLootMenuItem_18:Show();
    --Rogue
    AtlasLootMenuItem_20_Name:SetText(BabbleClass["Rogue"]);
    AtlasLootMenuItem_20_Extra:SetText("");
    AtlasLootMenuItem_20_Icon:SetTexture("Interface\\Icons\\Ability_BackStab");
    AtlasLootMenuItem_20.lootpage="ArenaRogue";
    AtlasLootMenuItem_20:Show();
    --Shaman Elemental
    AtlasLootMenuItem_22_Name:SetText(BabbleClass["Shaman"]);
    AtlasLootMenuItem_22_Extra:SetText(ORANGE..AL["Elemental"]);
    AtlasLootMenuItem_22_Icon:SetTexture("Interface\\Icons\\Spell_Nature_Lightning");
    AtlasLootMenuItem_22.lootpage="ArenaShamanElemental";
    AtlasLootMenuItem_22:Show();
    --Shaman Enhancement
    AtlasLootMenuItem_23_Name:SetText(BabbleClass["Shaman"]);
    AtlasLootMenuItem_23_Extra:SetText(ORANGE..AL["Enhancement"]);
    AtlasLootMenuItem_23_Icon:SetTexture("Interface\\Icons\\Spell_FireResistanceTotem_01");
    AtlasLootMenuItem_23.lootpage="ArenaShamanEnhancement";
    AtlasLootMenuItem_23:Show();
    --Shaman Restoration
    AtlasLootMenuItem_24_Name:SetText(BabbleClass["Shaman"]);
    AtlasLootMenuItem_24_Extra:SetText(ORANGE..AL["Restoration"]);
    AtlasLootMenuItem_24_Icon:SetTexture("Interface\\Icons\\Spell_Nature_HealingWaveGreater");
    AtlasLootMenuItem_24.lootpage="ArenaShamanRestoration";
    AtlasLootMenuItem_24:Show();
    --Warlock Demonology
    AtlasLootMenuItem_26_Name:SetText(BabbleClass["Warlock"]);
    AtlasLootMenuItem_26_Extra:SetText(ORANGE..AL["Demonology"]);
    AtlasLootMenuItem_26_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges");
    AtlasLootMenuItem_26.lootpage="ArenaWarlockDemonology";
    AtlasLootMenuItem_26:Show();
    --Warlock Destruction
    AtlasLootMenuItem_27_Name:SetText(BabbleClass["Warlock"]);
    AtlasLootMenuItem_27_Extra:SetText(ORANGE..AL["Destruction"]);
    AtlasLootMenuItem_27_Icon:SetTexture("Interface\\Icons\\Spell_Shadow_CurseOfTounges");
    AtlasLootMenuItem_27.lootpage="ArenaWarlockDestruction";
    AtlasLootMenuItem_27:Show();
    --Warrior
    AtlasLootMenuItem_29_Name:SetText(BabbleClass["Warrior"]);
    AtlasLootMenuItem_29_Extra:SetText();
    AtlasLootMenuItem_29_Icon:SetTexture("Interface\\Icons\\Ability_Warrior_BattleShout");
    AtlasLootMenuItem_29.lootpage="ArenaWarrior";
    AtlasLootMenuItem_29:Show();
    for i = 1, 30, 1 do
        getglobal("AtlasLootMenuItem_"..i.."_Extra"):Show();
    end
    AtlasLoot_BossName:SetText("|cffFFFFFF"..AL["Arena PvP Sets"]);
    AtlasLoot_SetItemInfoFrame(AtlasLoot_AnchorFrame);
end