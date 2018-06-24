--[[Author:     Cyprias
    License:    All Rights Reserved
    Contact:    Cyprias on Curse.com or WowAce.com

    Only Curse.com, Wowace.com and WoWInterface.com have permission to host this addon.
    I have not given permission for Plate Buffs to be used in any addon compilation or UI pack.]]
local folder, core = ...

-- global lookup
local _G = _G
local pairs = pairs
local InterfaceOptionsFrame_OpenToCategory = InterfaceOptionsFrame_OpenToCategory
local GetTime = GetTime
local table_sort = table.sort
local string_sub = string.sub
local string_len = string.len
local LibStub = LibStub
local table_getn = table.getn
local UnitGUID = UnitGUID
local UnitBuff = UnitBuff
local UnitDebuff = UnitDebuff
local table_insert = table.insert
local UnitExists = UnitExists
local UnitIsUnit = UnitIsUnit
local Debug = core.Debug
local UnitIsPlayer = UnitIsPlayer
local UnitClassification = UnitClassification
local UnitName = UnitName
local date = date
local table_remove = table.remove
local _ --underscore so GetGlobals doesn't nag me.
local table_getn = table.getn
local GetSpellInfo = GetSpellInfo
local select = select
local type = type

-- PlateBuffs = core --global table
local LibNameplate = LibStub("LibNameplate-1.0", true)
if not LibNameplate then error(folder .. " requires LibNameplate-1.0.") return end

-- local
core.title = "Plate Buffs"
core.version = GetAddOnMetadata(folder, "X-Curse-Packaged-Version") or ""
core.titleFull = core.title .. " " .. core.version
core.addonDir = "Interface\\AddOns\\" .. folder .. "\\"

core.LibNameplate = LibNameplate

LibStub("AceAddon-3.0"):NewAddon(core, folder, "AceConsole-3.0", "AceEvent-3.0", "AceSerializer-3.0")
-- L = LibStub("AceLocale-3.0"):GetLocale(folder, true)

core.L = LibStub("AceLocale-3.0"):GetLocale(folder, true)
local L = core.L

local totemList = {
    --Nameplates with these names are totems. By default we ignore totem nameplates.
    2484, --Earthbind Totem
    8143, --Tremor Totem
    8177, --Grounding Totem
    8512, --Windfury Totem
    6495, --Sentry Totem - removed
    8170, --Cleansing Totem - removed
    3738, --Wrath of Air Totem
    2062, --Earth Elemental Totem
    2894, --Fire Elemental Totem
    58734, --Magma Totem - changed
    8190, --Magma Totem
    58582, --Stoneclaw Totem - changed
    5730, --Stoneclaw Totem
    58753, --Stoneskin Totem - changed
    8071, --Stoneskin Totem
    58739, --Fire Resistance Totem - removed
    58656, --Flametongue Totem - changed
    8227, --Flametongue Totem
    58745, --Frost Resistance Totem - removed
    58757, --Healing Stream Totem - changed
    5394, --Healing Stream Totem
    58774, --Mana Spring Totem - changed
    5675, --Mana Spring Totem
    58749, --Nature Resistance Totem - removed
    58704, --Searing Totem - changed
    3599, --Searing Totem
    58643, --Strength of Earth Totem - changed
    8075, --Strength of Earth Totem
    57722, --Totem of Wrath - changed
    3738, --Totem of Wrath
    8184, --Elemental Resistance Totem - new
    87718, --Totem of Tranquil Mind - new
}

local defaultSpells1 = {
    --Important spells, add them with huge icons.
    118, --Polymorph
    51514, --Hex
    710, --Banish
    6358, --Seduction
    6770, --Sap
    605, --Mind Control
    33786, --Cyclone
    5782, --Fear
    5484, --Howl of Terror
    6789, --Death Coil
    45438, --Ice Block
    642, --Divine Shield
    8122, --Psychic Scream
    339, --Entangling Roots
    23335, -- Silverwing Flag (alliance WSG flag)
    23333, -- Warsong Flag (horde WSG flag)
    34976, -- Netherstorm Flag (EotS flag)
    2094, --Blind
    33206, --Pain Suppression (priest)
    29166, --Innervate (druid)
    47585, --Dispersion (priest)
    19386, --Wyvern Sting (hunter)
}

local defaultSpells2 = {
    --semi-important spells, add them with mid size icons.
    15487, --Silence (priest)
    10060, --Power Infusion (priest)
    2825, --Bloodlust
    5246, --Intimidating Shout (warrior)
    31224, --Cloak of Shadows (rogue)
    498, --Divine Protection
    47476, --Strangulate (warlock)
    31884, --Avenging Wrath (pally)
    37587, --Bestial Wrath (hunter)
    12042, --Arcane Power (mage) (texture matches Innervate)
    12472, --Icy Veins (mage)
    49039, --Lichborne (DK)
    48792, --Icebound Fortitude (DK)
    5277, --Evasion (rogue)
    53563, --Beacon of Light (pally)
    22812, --Barkskin (druid)
    67867, --Trampled (ToC arena spell when you run over someone)
    1499, --Freezing Trap
    2637, --Hibernate
    64044, --Psychic Horror
    19503, --Scatter Shot (hunter)
    34490, --Silencing Shot (hunter)
    10278, --Hand of Protection (pally) - Changed
    1022, --Hand of Protection (pally)
    10326, --Turn Evil (pally)
    44572, --Deep Freeze (mage)
    20066, --Repentance (pally)
    46968, --Shockwave (warrior)
    46924, --Bladestorm (warrior)
    16689, --Nature's Grasp (Druid)
    2983, --Sprint (rogue)
    2335, --Swiftness Potion
    6624, --Free Action Potion
    3448, --Lesser Invisibility Potion
    11464, --Invisibility Potion
    17634, --Potion of Petrification
    53905, --Indestructible Potion
    54221, --Potion of Speed
    1850, --Dash
}

local myClass = select(2, UnitClass("player"))
if myClass == "DRUID" or myClass == "ROGUE" then
    table.insert(defaultSpells2, #defaultSpells2 + 1, 132) --Detect Invisibility
    table.insert(defaultSpells2, #defaultSpells2 + 1, 16882) --Detect Greater Invisibility
    table.insert(defaultSpells2, #defaultSpells2 + 1, 6512) --Detect Lesser Invisibility
end

--useful spells to know about, add with small icons.
--[[
local defaultSpells3 = {
    50334, --Berserk (druid) note: rouges seem to have this too? (same name)
    48447, --Tranquility (druid)
    3442, --Enslave
    1776, --Gouge
    8983, --Bash (druid)
    49803, --Pounce (druid)
    22570, --Maim (druid)
    16979, --Feral Charge - Bear (druid)
    49376, --Feral Charge - Cat (druid)
    19577, --Intimidation (hunter pet)
    1833, --Cheap Shot (rogue)
    41389, --Kidney Shot (Rogue)
    12311, --Gag Order (Warrior) talent?
    49203, --Hungering Cold (DK)
    1330, --Garrote - Silence (Rogue)
    19244, --Spell Lock (warlock pet)
    54785, --Demon Charge (warlock pet)
}
]]

local regEvents = {
    "PLAYER_TARGET_CHANGED",
    "UPDATE_MOUSEOVER_UNIT",
    "UNIT_AURA",
    "UNIT_TARGET",
    -- "PLAYER_REGEN_ENABLED",
    -- "PLAYER_REGEN_DISABLED",
}
core.db = {}
local db
local P --db.profile

core.defaultSettings = {
    profile = {
        spellOpts = {},
        ignoreDefaultSpell = {}, --default spells that user has removed. Seems odd but this'll save space in the DB file allowing PB to load faster.
    },
    -- global = {
    -- },
}

core.buffFrames = {}
core.guidBuffs = {}
core.nametoGUIDs = {} -- w/o servername
core.buffBars = {}

local buffBars = core.buffBars
local guidBuffs = core.guidBuffs
local nametoGUIDs = core.nametoGUIDs
local buffFrames = core.buffFrames
local defaultSettings = core.defaultSettings

core.iconTestMode = false
local coreOpts
local spellUI
local dspellUI
local profileUI
local whoUI
local barUI

local totems = {}
local name, texture
for i = 1, table_getn(totemList) do
    name, _, texture = GetSpellInfo(totemList[i])
    -- totems[i] = {name = name, texture = texture}
    if (name) then
        totems[name] = texture
    end
end

--Add default spells to defaultSettings table.
local spellName
for i = 1, table_getn(defaultSpells1) do
    spellName = GetSpellInfo(defaultSpells1[i])
    -- print("defaultSpells1", spellName)
    if spellName then
        core.defaultSettings.profile.spellOpts[spellName] = {
            iconSize = 80, --max size
            cooldownSize = 18, --almost max.
            show = 1, --always show spell
            stackSize = 18,
            -- when = date("%c"),--when isn't really used for anything. =/
        }
        -- print("defaultSpells1", spellName)
    end
end

for i = 1, table_getn(defaultSpells2) do
    spellName = GetSpellInfo(defaultSpells2[i])
    -- print("defaultSpells2", spellName)
    if spellName then
        core.defaultSettings.profile.spellOpts[spellName] = {
            iconSize = 40, --mid size
            cooldownSize = 14,
            show = 1, --always show spell
            stackSize = 14,
            -- when = date("%c"),--when isn't really used for anything. =/
        }
    end
end


function core:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("PB_DB", core.defaultSettings, true)
    self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
    self.db.RegisterCallback(self, "OnProfileDeleted", "OnProfileChanged")
    self:RegisterChatCommand("pb", "MySlashProcessorFunc")

    local config = LibStub("AceConfig-3.0")
    local dialog = LibStub("AceConfigDialog-3.0")
    config:RegisterOptionsTable(self.title, self.CoreOptionsTable)
    coreOpts = dialog:AddToBlizOptions(self.title, self.titleFull)

    config:RegisterOptionsTable(self.title .. "Who", self.WhoOptionsTable)
    whoUI = dialog:AddToBlizOptions(self.title .. "Who", L["Who"], self.titleFull)

    config:RegisterOptionsTable(self.title .. "Spells", self.SpellOptionsTable)
    spellUI = dialog:AddToBlizOptions(self.title .. "Spells", L["Specific Spells"], self.titleFull)

    config:RegisterOptionsTable(self.title .. "dSpells", self.DefaultSpellOptionsTable)
    dspellUI = dialog:AddToBlizOptions(self.title .. "dSpells", L["Default Spells"], self.titleFull)

    config:RegisterOptionsTable(self.title .. "Rows", self.BarOptionsTable)
    barUI = dialog:AddToBlizOptions(self.title .. "Rows", L["Rows"], self.titleFull)

    --last UI
    config:RegisterOptionsTable(self.title .. "Profile", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db))
    profileUI = dialog:AddToBlizOptions(self.title .. "Profile", L["Profiles"], self.titleFull)
end

--[===[@debug@
function PB_NewPlates()-- /run PB_NewPlates()
    for plate, name in pairs(LibNameplate.nameplates) do
        if plate:IsShown() then
            Debug("OnEnable", plate, name, LibNameplate:GetName(plate))
            core:LibNameplate_NewNameplate("LibNameplate_NewNameplate", plate)
        end
    end
end
--@end-debug@]===]

local prev_OnEnable = core.OnEnable
function core:OnEnable(...)
    if prev_OnEnable then prev_OnEnable(self, ...) end

    db = self.db
    P = db.profile

    for i, event in pairs(regEvents) do
        self:RegisterEvent(event)
    end

    LibNameplate.RegisterCallback(self, "LibNameplate_NewNameplate")
    LibNameplate.RegisterCallback(self, "LibNameplate_FoundGUID")
    LibNameplate.RegisterCallback(self, "LibNameplate_RecycleNameplate")

    if P.playerCombatWithOnly == true or P.npcCombatWithOnly == true then
        LibNameplate.RegisterCallback(self, "LibNameplate_CombatChange")
        LibNameplate.RegisterCallback(self, "LibNameplate_ThreatChange")
    end

    --Update old options.
    if P.cooldownSize < 6 then
        P.cooldownSize = core.defaultSettings.profile.cooldownSize
    end
    if P.stackSize < 6 then
        P.stackSize = core.defaultSettings.profile.stackSize
    end

    -- PB_NewPlates()

    for plate in pairs(core.buffBars) do
        for i = 1, table_getn(core.buffBars[plate]) do
            core.buffBars[plate][i]:Show() --reshow incase user disabled addon.
        end
    end
end

local prev_OnDisable = core.OnDisable
function core:OnDisable(...)
    if prev_OnDisable then prev_OnDisable(self, ...) end

    LibNameplate.UnregisterAllCallbacks(self)

    for plate in pairs(core.buffBars) do
        for i = 1, table_getn(core.buffBars[plate]) do
            core.buffBars[plate][i]:Hide() --makesure all frames stop OnUpdating.
        end
    end
end

----------------------------------------------------------------------
-- User has reset proflie, so we reset our spell exists options.    --
----------------------------------------------------------------------
function core:OnProfileChanged(...) --
    -- Shut down anything left from previous settings
    self:Disable()
    -- Enable again with the new settings
    self:Enable()
end

----------------------------------------------
-- /da function brings up the UI options.   --
----------------------------------------------
function core:MySlashProcessorFunc(input) --
    InterfaceOptionsFrame_OpenToCategory(spellUI) --open subtab
    InterfaceOptionsFrame_OpenToCategory(coreOpts)
end

--[[ Outdated callback.
function core:LibNameplate_VisiblePlateChange(event, plate, visiblePlate)
    if buffBars[plate] then
        if buffBars[plate][1] then
            self:ResetBarPoint(buffBars[plate][1], plate, visiblePlate)
        end
        for i=2, table_getn(buffBars[plate]) do
            buffBars[plate][i]:SetParent(visiblePlate)
        end
    end
end
]]

function core:HidePlateSpells(plate)
    --note to self, not buffBars
    if buffFrames[plate] then
        for i = 1, table_getn(buffFrames[plate]) do
            buffFrames[plate][i]:Hide()
        end
    end
end

function core:LibNameplate_RecycleNameplate(event, plate)
    self:HidePlateSpells(plate)
end

local function isTotem(name)
--[[
    for i=1,table_getn(totems) do
        if name:find(totems[i].name) then
            return totems[i].texture
        end
    end
]]
    return totems[name]
end

function core:ShouldAddBuffs(plate, spam)
    local plateName = LibNameplate:GetName(plate) or "UNKNOWN"
    -- Debug("ShouldAddBuffs 1", plateName)

    if P.showTotems == false and isTotem(plateName) then
        -- Debug("ShouldAddBuffs", plateName, "totem")
        return false
    end

    local plateType = LibNameplate:GetType(plate)
    if (P.abovePlayers == true and plateType == "PLAYER") or (P.aboveNPC == true and plateType == "NPC") then
        if plateType == "PLAYER" and P.playerCombatWithOnly == true and (not LibNameplate:IsInCombat(plate)) then --  and LibNameplate:GetThreatSituation(plate) == "LOW"
            -- Debug("ShouldAddBuffs A", "We're not in combat with",plateName)
            return false
        end

        if plateType == "NPC" and P.npcCombatWithOnly == true and (not LibNameplate:IsInCombat(plate) and LibNameplate:GetThreatSituation(plate) == "LOW") then --
            -- Debug("ShouldAddBuffs B", "We're not in combat with",plateName)
            return false
        end

        local plateReaction = LibNameplate:GetReaction(plate)
        if P.aboveFriendly == true and plateReaction == "FRIENDLY" then

            -- if spam then
            --     Debug("ShouldAddBuffs A", plate, plateName, plateType, plateReaction, LibNameplate:IsInCombat(plate), LibNameplate:GetThreatSituation(plate))
            -- end

            return true
        elseif P.aboveNeutral == true and plateReaction == "NEUTRAL" then
            -- if spam then
            --     Debug("ShouldAddBuffs B", plate, plateName, plateType, plateReaction, LibNameplate:IsInCombat(plate), LibNameplate:GetThreatSituation(plate))
            -- end
            return true
        elseif P.aboveHostile == true and plateReaction == "HOSTILE" then
            -- if spam then
            --     Debug("ShouldAddBuffs C", plate, plateName, plateType, plateReaction, LibNameplate:IsInCombat(plate), LibNameplate:GetThreatSituation(plate))
            -- end
            return true
        end
    end

    return false
end

function core:AddOurStuffToPlate(plate)
    local GUID = LibNameplate:GetGUID(plate)
    if GUID then
        self:RemoveOldSpells(GUID)
        self:AddBuffsToPlate(plate, GUID)
        return
    end

    local plateName = LibNameplate:GetName(plate) or "UNKNOWN"
    if P.saveNameToGUID == true and nametoGUIDs[plateName] and (LibNameplate:GetType(plate) == "PLAYER" or LibNameplate:IsBoss(plate)) then
        self:RemoveOldSpells(nametoGUIDs[plateName])
        self:AddBuffsToPlate(plate, nametoGUIDs[plateName])
    elseif P.unknownSpellDataIcon == true then
        self:AddUnknownIcon(plate)
    end
end

function core:LibNameplate_NewNameplate(event, plate)
    -- Debug("NewNameplate 1", plate, LibNameplate:GetName(plate) or "UNKNOWN", LibNameplate:IsInCombat(plate), LibNameplate:GetThreatSituation(plate))
    if self:ShouldAddBuffs(plate, true) == true then
        core:AddOurStuffToPlate(plate)
    end
end

function core:LibNameplate_FoundGUID(event, plate, GUID, unitID)
    if self:ShouldAddBuffs(plate) == true then
        -- local plateName =  LibNameplate:GetName(plate) or "UNKNOWN"
        -- Debug("FoundGUID", plateName, plate, plate.extended)

        if not guidBuffs[GUID] then
            self:CollectUnitInfo(unitID)
        end

        self:RemoveOldSpells(GUID)
        self:AddBuffsToPlate(plate, GUID)
    end
--[===[@debug@
    Debug("FoundGUID", plateName,
        GUID,
        unitID,
        LibNameplate:GetLevel(plate),
        LibNameplate:GetReaction(plate),
        LibNameplate:GetType(plate),
        LibNameplate:IsBoss(plate),
        LibNameplate:GetHealthMax(plate),
        LibNameplate:GetClass(plate),
        LibNameplate:IsElite(plate),
        LibNameplate:GetThreatSituation(plate),
        LibNameplate:GetAlpha(plate),
        LibNameplate:IsTarget(plate),
        LibNameplate:GetHealth(plate),
        LibNameplate:GetHealthMax(plate),
        LibNameplate:IsMouseover(plate),
        LibNameplate:IsCasting(plate),
        LibNameplate:IsInCombat(plate),
        LibNameplate:IsMarked(plate),
        LibNameplate:GetRaidIcon(plate),
        LibNameplate:GetGUID(plate),
        "" --nada
    )

    --Do nothing API calls to test library.
    LibNameplate:GetName(plate)
    LibNameplate:GetLevel(plate)
    LibNameplate:GetReaction(plate)
    LibNameplate:GetType(plate)
    LibNameplate:IsBoss(plate)
    LibNameplate:GetHealthMax(plate)
    LibNameplate:GetClass(plate)
    LibNameplate:IsElite(plate)
    LibNameplate:GetThreatSituation(plate)
    LibNameplate:IsTarget(plate)
    LibNameplate:GetHealth(plate)
    LibNameplate:GetHealthMax(plate)
    LibNameplate:IsMouseover(plate)
    LibNameplate:IsCasting(plate)
    LibNameplate:IsInCombat(plate)
    LibNameplate:IsMarked(plate)
    LibNameplate:GetRaidIcon(plate)
    LibNameplate:GetGUID(plate)
--@end-debug@]===]
end

--[===[@debug@
function PB_TargetTest()--/run PB_TargetTest()
    local unitID = "target"
    local GUID = UnitGUID(unitID)
        local name = UnitName(unitID)
    local plate = LibNameplate:GetNameplateByGUID(GUID)

    Debug(GUID, plate, name, plate and LibNameplate:GetName(plate))
end
--@end-debug@]===]

function core:HaveSpellOpts(spellName)
    if not P.ignoreDefaultSpell[spellName] and P.spellOpts[spellName] then
        return P.spellOpts[spellName]
    end
    return false
end

--P.spellOpts
function core:CollectUnitInfo(unitID)
    local GUID = UnitGUID(unitID)
    local name = UnitName(unitID) --returns 2 values, only want name.
    if P.saveNameToGUID == true and UnitIsPlayer(unitID) or UnitClassification(unitID) == "worldboss" then
        --These should always have unique names.
        nametoGUIDs[name] = GUID
    end

    if P.watchUnitIDAuras == true then
        guidBuffs[GUID] = guidBuffs[GUID] or {}
        --Remove all the entries.
        for i = table_getn(guidBuffs[GUID]), 1, -1 do
            table_remove(guidBuffs[GUID], i)
        end

        local i = 1;
        local name, rank, icon, count, dispelType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId
        while UnitBuff(unitID, i) do
            name, rank, icon, count, dispelType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitBuff(unitID, i)

            for _, _, shortIcon in icon:gmatch("(.+)\\(.+)\\(.+)") do
                icon = shortIcon
                break
            end

            local spellOpts = self:HaveSpellOpts(name)

            if spellOpts and spellOpts.show then
                if spellOpts.show == 1 or (spellOpts.show == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        sID = spellId,
                        caster = unitCaster and core:GetFullName(unitCaster),
                    })
                end
            else
                if P.defaultBuffShow == 1 or (P.defaultBuffShow == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name,
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        sID = spellId,
                        caster = unitCaster and core:GetFullName(unitCaster),
                    })
                end
            end

            --[[
            if P.spellOpts[name] and P.spellOpts[name].show then
                if P.spellOpts[name].show == 1 or (P.spellOpts[name].show == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        sID = spellId,
                        caster = unitCaster and  core:GetFullName(unitCaster),
                    })
                end
            else
                if P.defaultBuffShow == 1 or (P.defaultBuffShow == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name,
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        sID = spellId,
                        caster = unitCaster and  core:GetFullName(unitCaster),
                    })
                end
            end]]

            i = i + 1
        end

        i = 1;
        local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId
        while UnitDebuff(unitID, i) do
            name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId = UnitDebuff(unitID, i)
            for _, _, shortIcon in icon:gmatch("(.+)\\(.+)\\(.+)") do
                icon = shortIcon
                break
            end

            local spellOpts = self:HaveSpellOpts(name)

            if spellOpts and spellOpts.show then
                if spellOpts.show == 1 or (spellOpts.show == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        debuffType = debuffType,
                        isDebuff = true,
                        sID = spellId,
                        caster = unitCaster and core:GetFullName(unitCaster),
                    })
                end
            else
                if P.defaultDebuffShow == 1 or (P.defaultDebuffShow == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        debuffType = debuffType,
                        isDebuff = true,
                        sID = spellId,
                        caster = unitCaster and core:GetFullName(unitCaster),
                    })
                end
            end

            --[[
            if P.spellOpts[name] and P.spellOpts[name].show then
                if P.spellOpts[name].show == 1 or (P.spellOpts[name].show == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        debuffType = debuffType,
                        isDebuff = true,
                        sID = spellId,
                        caster = unitCaster and  core:GetFullName(unitCaster),
                    })
                end
            else
                if P.defaultDebuffShow == 1 or (P.defaultDebuffShow == 2 and unitCaster and unitCaster == "player") then
                    table_insert(guidBuffs[GUID], {
                        name = name, --needed for spell options.
                        icon = icon,
                        expirationTime = expirationTime,
                        startTime = expirationTime - duration,
                        duration = duration,
                        playerCast = unitCaster and unitCaster == "player" and 1,
                        stackCount = count,
                        debuffType = debuffType,
                        isDebuff = true,
                        sID = spellId,
                        caster = unitCaster and  core:GetFullName(unitCaster),
                    })
                end
            end]]
            i = i + 1
        end

        if core.iconTestMode == true then
            for i = table_getn(guidBuffs[GUID]), 1, -1 do
                for t = 1, P.iconsPerBar - 1 do
                    table_insert(guidBuffs[GUID], i, guidBuffs[GUID][i]) --reinsert the entry abunch of times.
                end
            end
        end
    end

    -- core:UpdatePlateByGUID(GUID)
    if not self:UpdatePlateByGUID(GUID) and (UnitIsPlayer(unitID) or UnitClassification(unitID) == "worldboss") then
        --LibNameplate can't find a nameplate that matches that GUID. Since the unitID's a player/worldboss which have unique names, add buffs to the frame that matches that name.
        --Note, this /can/ add buffs to the wrong frame if a hunter pet has the same name as a player. This is so rare that I'll risk it.
        self:UpdatePlateByName(name)
    end
end



function core:PLAYER_TARGET_CHANGED(event, ...)
    if UnitExists("target") then
        self:CollectUnitInfo("target")
    end
end


function core:UNIT_TARGET(event, unitID) --this fires half a second after PLAYER_TARGET_CHANGED. Not good for rapid targeting.
    if not UnitIsUnit(unitID, "player") and UnitExists(unitID .. "target") then
        self:CollectUnitInfo(unitID .. "target")
    end
    -- Debug(event, ...)
end

--[[
local function ExitCombatChanges(count, ...)
    -- Debug("ExitCombatChanges", count, "------")
    for i = 1, count do
        local plate = select(i, ...)
        if plate:IsShown() then
            if not core:ShouldAddBuffs(plate) then
                core:HidePlateSpells(plate)
            end
        end
    end
end

local function EnterCombatChanges(count, ...)
    -- Debug("EnterCombatChanges", count, "-------")
    for i = 1, count do
        local plate = select(i, ...)
        if plate:IsShown() then
            if core:ShouldAddBuffs(plate) == true then
                core:AddOurStuffToPlate(plate)
            end
        end
    end
end

function core:PLAYER_REGEN_ENABLED(event, unitID)--exit combat
    ExitCombatChanges(LibNameplate:GetAllNameplates())
end

function core:PLAYER_REGEN_DISABLED(event, unitID)-- enter combat
    EnterCombatChanges(LibNameplate:GetAllNameplates())
end
]]

function core:LibNameplate_CombatChange(event, plate, inCombat)
    -- Debug(event, plate, inCombat, LibNameplate:GetName(plate), core:ShouldAddBuffs(plate))
    if core:ShouldAddBuffs(plate) == true then
        -- Debug(event, plate, inCombat, "Showing buffs!", LibNameplate:GetName(plate))
        core:AddOurStuffToPlate(plate)
    else
        -- Debug(event, plate, inCombat, "Hiding buffs!", LibNameplate:GetName(plate))
        core:HidePlateSpells(plate)
    end
end

--[[]]
function core:LibNameplate_ThreatChange(event, plate, threatSit)
    -- Debug(event, plate, threatSit, LibNameplate:GetName(plate), core:ShouldAddBuffs(plate))

    if core:ShouldAddBuffs(plate) == true then
        -- Debug(event, plate, inCombat, "Showing buffs!", LibNameplate:GetName(plate))
        core:AddOurStuffToPlate(plate)
    else
        -- Debug(event, plate, inCombat, "Hiding buffs!", LibNameplate:GetName(plate))
        core:HidePlateSpells(plate)
    end
end

function core:UPDATE_MOUSEOVER_UNIT(event, ...)
    if UnitExists("mouseover") then
        self:CollectUnitInfo("mouseover")
    end
    -- Debug(event, ...)
end

function core:UNIT_AURA(event, unitID)
    if UnitExists(unitID) then
        self:CollectUnitInfo(unitID)
    end
    -- Debug(event, ...)
end

function core:AddNewSpell(spellName)
    Debug("AddNewSpell", spellName)

    P.ignoreDefaultSpell[spellName] = nil

    -- if not P.spellOpts[spellName] then
    P.spellOpts[spellName] = {
        -- show = P.defaultSpells,
        -- iconSize = P.iconSize,
        -- cooldownSize = P.cooldownSize,
        -- stackSize = P.stackSize,
        show = 1, --always show
        -- when = date("%c"),
    }
    -- else
    --     self.echo(spellName.." is already in the list.")
    -- end

    self:BuildSpellUI()
end

function core:RemoveSpell(spellName)
    if self.defaultSettings.profile.spellOpts[spellName] then
        P.ignoreDefaultSpell[spellName] = true
    end
    P.spellOpts[spellName] = nil
    core:BuildSpellUI()
end

function core:UpdatePlateByGUID(GUID)
    local plate = LibNameplate:GetNameplateByGUID(GUID)
    if plate then
        if self:ShouldAddBuffs(plate) == true then

            core:AddBuffsToPlate(plate, GUID)
            return true
        end
    end
    return false
end

------------------------------------------------------------------------------------------
-- This will add buff frames to a frame matching a given name.                          --
-- This should only be used for player names because mobs/npcs can share the same name. --
------------------------------------------------------------------------------------------
function core:UpdatePlateByName(name)
    -- name = self:RemoveServerName(name) -- Nameplates don't show server name.
    local GUID = nametoGUIDs[name] --We save buffs by GUID. make sure we have the name's guid in our list.
    if GUID then
        local plate = LibNameplate:GetNameplateByName(name)
        if plate then
            if self:ShouldAddBuffs(plate) == true then
                -- Debug("UpdatePlateByGUID","Found GUID from name, adding buffs.", name, GUID)
                core:AddBuffsToPlate(plate, GUID)
            end
            return true
        end
    end
end

function core:GetAllSpellIDs()
    --ugly function, but how else will I get spellIDs from spell names. =/
    local spells = {}
    local name
    for i, spellID in pairs(defaultSpells1) do
        name = GetSpellInfo(spellID)
        spells[name] = spellID
    end
    for i, spellID in pairs(defaultSpells2) do
        name = GetSpellInfo(spellID)
        spells[name] = spellID
    end
    -- for i, spellID in pairs(defaultSpells3) do
    --     name = GetSpellInfo(spellID)
    --     spells[name] = spellID
    -- end

    for i = 76567, 1, -1 do --76567
        name = GetSpellInfo(i)
        if name and not spells[name] then
            spells[name] = i
        end
    end
    return spells
end

--[[
local lastID = 0
for i = 1, 100000  do
    name = GetSpellInfo(i)
    if name then
        lastID = i
    end
end
print("lastID", lastID)
]]
