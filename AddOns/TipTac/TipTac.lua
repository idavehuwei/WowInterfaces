local _G = getfenv(0);
local abs = abs;
local gtt = GameTooltip;
local UnitExists = UnitExists;
local modName = "TipTac";
local tt = CreateFrame("Frame", modName, UIParent);

-- Global Chat Message Function
function AzMsg(msg) DEFAULT_CHAT_FRAME:AddMessage(tostring(msg):gsub("|1", "|cffffff80"):gsub("|2", "|cffffffff"), 0.5, 0.75, 1.0); end

-- Config Data Variables
local cfg;
local TT_DefaultConfig = {
    showUnitTip = true,
    showStatus = true,
    showGuildRank = false,
    nameType = "title",
    showRealm = "show",
    showTarget = "last",
    targetYouText = TT_TargetYOU,
    showTargetedBy = true,
    gttScale = 1,
    updateFreq = 0.5,
    colSameGuild = "|cffff32ff",
    colRace = "|cffffffff",
    colLevel = "|cffc0c0c0",
    colorNameByClass = true,
    classColoredBorder = false,
    itemQualityBorder = true,
    reactText = true,
    colReactText1 = "|cffc0c0c0",
    colReactText2 = "|cffff0000",
    colReactText3 = "|cffff7f00",
    colReactText4 = "|cffffff00",
    colReactText5 = "|cff00ff00",
    colReactText6 = "|cff25c1eb",
    colReactText7 = "|cff808080",
    reactColoredBackdrop = false,
    reactColoredBorder = false,
    colReactBack1 = { 0.2, 0.2, 0.2 },
    colReactBack2 = { 0.3, 0, 0 },
    colReactBack3 = { 0.3, 0.15, 0 },
    colReactBack4 = { 0.3, 0.3, 0 },
    colReactBack5 = { 0, 0.3, 0.1 },
    colReactBack6 = { 0, 0, 0.5 },
    colReactBack7 = { 0.05, 0.05, 0.05 },
    tipBackdropBG = "Interface\\Tooltips\\UI-Tooltip-Background",
    tipBackdropEdge = "Interface\\Tooltips\\UI-Tooltip-Border",
    backdropEdgeSize = 14,
    backdropInsets = 2.5,
    tipColor = { 0.1, 0.1, 0.2 },
    tipBorderColor = { 0.3, 0.3, 0.4 },
    gradientTip = false,
    gradientColor = { 0.8, 0.8, 0.8, 0.2 },
    modifyFonts = false,
    fontFace = TT_Font,
    fontSize = 12,
    fontFlags = "",
    classification_normal = "%s ",
    classification_elite = TT_Elite,
    classification_worldboss = TT_WorldBoss,
    classification_rare = TT_Rare,
    classification_rareelite = TT_RareElite,
    overrideFade = true,
    preFadeTime = 0.1,
    fadeTime = 0.1,
    hideWorldTips = true,
    hideDefaultBar = true,
    healthBar = true,
    healthBarClassColor = true,
    healthBarText = "value",
    healthBarColor = { 0.3, 0.9, 0.3 },
    manaBar = true,
    manaBarText = "value",
    manaBarColor = { 0.3, 0.55, 0.9 },
    powerBar = false,
    powerBarText = "value",
    barFontFace = TT_BarFont,
    barFontSize = 12,
    barFontFlags = "OUTLINE",
    barHeight = 10,
    barTexture = "Interface\\TargetingFrame\\UI-StatusBar",
    aurasAtBottom = false,
    showBuffs = true,
    showDebuffs = true,
    selfAurasOnly = false,
    auraSize = 20,
    auraMaxRows = 2,
    showAuraCooldown = true,
    iconRaid = true,
    iconFaction = true,
    iconCombat = false,
    iconAnchor = "TOPLEFT",
    iconSize = 24,
    anchorWorldUnitType = "mouse",
    anchorWorldUnitPoint = "TOPLEFT",
    anchorWorldTipType = "mouse",
    anchorWorldTipPoint = "TOPLEFT",
    anchorFrameUnitType = "parent",
    anchorFrameUnitPoint = "TOPRIGHT",
    anchorFrameTipType = "parent",
    anchorFrameTipPoint = "TOPRIGHT",
    mouseOffsetX = 30,
    mouseOffsetY = -30,
    hideUFTipsInCombat = false,
    hideAllTipsInCombat = false,
    showHiddenTipsOnShift = false,
    showTalents = true,
    talentFormat = 1,
    talentCacheSize = 25,
    top = 98,
    left = -84,
};

-- Tips modified by TipTac in appearance and scale, you can add to this list if you want to modify more tips
local TT_TipsToModify = {
    "GameTooltip",
    "ShoppingTooltip1",
    "ShoppingTooltip2",
    "ShoppingTooltip3",
    "ItemRefTooltip",
    "WorldMapTooltip",
    "AtlasLootTooltip",
    "QuestHelperTooltip",
    "QuestGuru_QuestWatchTooltip",
};

local tipBackdrop = { tile = false, insets = {} };

-- Constants
local TT_LevelMatch = "^" .. TOOLTIP_UNIT_LEVEL:gsub("%%s", ".+"); -- Was changed to match other localizations properly, used to match: "^"..LEVEL.." .+" -- Az: doesn't actually match the level line on the russian client!
local TT_NotSpecified = TT_Not_Specified;
local TT_Reaction = {
    TT_Tapped, -- No localized string of this
    FACTION_STANDING_LABEL2, -- Hostile
    FACTION_STANDING_LABEL3, -- Unfriendly (Caution)
    FACTION_STANDING_LABEL4, -- Neutral
    FACTION_STANDING_LABEL5, -- Friendly
    FACTION_STANDING_LABEL5, -- Friendly (Exalted)
    DEAD, -- Dead
};

-- Colors
local CLASS_COLORS = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS;
local COL_WHITE = "|cffffffff";
local COL_LIGHTGRAY = "|cffc0c0c0";
local TT_ClassColors = {};
for class, color in next, CLASS_COLORS do
    TT_ClassColors[class] = ("|cff%.2x%.2x%.2x"):format(color.r * 255, color.g * 255, color.b * 255);
end

-- Mirror Anchors
local TT_MirrorAnchors = {
    TOP = "BOTTOM",
    TOPLEFT = "TOPRIGHT",
    TOPRIGHT = "TOPLEFT",
    BOTTOM = "TOP",
    BOTTOMLEFT = "BOTTOMRIGHT",
    BOTTOMRIGHT = "BOTTOMLEFT",
    LEFT = "RIGHT",
    RIGHT = "LEFT",
    CENTER = "CENTER",
};

local TT_MirrorAnchorsSmart = {
    TOPLEFT = "BOTTOMRIGHT",
    TOPRIGHT = "BOTTOMLEFT",
    BOTTOMLEFT = "TOPRIGHT",
    BOTTOMRIGHT = "TOPLEFT",
};

-- Data Variables
local isColorBlind;
local pLevel;
local u = {};
local lineOne = {};
local lineInfo = {};
local targetedList = {};
local auras = {};
local bars = {};
local tipIcon;

--------------------------------------------------------------------------------------------------------
-- TipTac Anchor Creation                                       --
--------------------------------------------------------------------------------------------------------

tt:SetWidth(114);
tt:SetHeight(24);
tt:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", tile = true, tileSize = 8, edgeSize = 12, insets = { left = 2, right = 2, top = 2, bottom = 2 } });
tt:SetBackdropColor(0.1, 0.1, 0.2, 1);
tt:SetBackdropBorderColor(0.1, 0.1, 0.1, 1);
tt:SetMovable(1);
tt:EnableMouse(1);
tt:SetToplevel(1);
tt:SetClampedToScreen(1);
tt:SetPoint("CENTER");
tt:Hide();

tt.text = tt:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
tt.text:SetText(TTAnchor_Text);
tt.text:SetPoint("LEFT", 6, 0);

tt.close = CreateFrame("Button", nil, tt, "UIPanelCloseButton");
tt.close:SetWidth(24);
tt.close:SetHeight(24);
tt.close:SetPoint("RIGHT");

-- Cursor Update -- This is a workaround so that gatherer addons can get the name of nodes
function tt:CURSOR_UPDATE(event)
    if (gtt:IsShown()) and (gtt:IsOwned(UIParent)) and (not u.token) then
        local backup = GameTooltipTextLeft1:GetText();
        gtt:Hide();
        GameTooltipTextLeft1:SetText(backup);
    end
end

-- Login -- Set Level
function tt:PLAYER_LOGIN(event)
    pLevel = UnitLevel("player");
    self[event] = nil;
end

-- Level Up -- Update Level
function tt:PLAYER_LEVEL_UP(event, newLevel)
    pLevel = newLevel;
end

-- Variables Loaded
function tt:VARIABLES_LOADED(event)
    isColorBlind = (GetCVar("colorblindMode") == "1");
    -- Init Config
    if (not TipTac_Config) then
        TipTac_Config = {};
    end
    cfg = setmetatable(TipTac_Config, { __index = TT_DefaultConfig });
    -- Default the bar texture if it no longer exists
    bars[1]:SetStatusBarTexture(cfg.barTexture);
    if (not bars[1]:GetStatusBarTexture()) then
        cfg.barTexture = nil;
    end
    -- Hook Tips & Apply Settings
    self:HookTips();
    self:ApplySettings();
    -- Position
    if (cfg.left and cfg.top) then
        self:ClearAllPoints();
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", cfg.left, cfg.top);
    else
        self:Show();
        -- Just set left and top here, in case the player just closes the anchor without moving, so it doesn't keep showing up when they log in
        cfg.left, cfg.top = self:GetLeft(), self:GetTop();
    end
    -- Cleanup
    self:UnregisterEvent(event);
    self[event] = nil;
end

-- Console Var Change
function tt:CVAR_UPDATE(event, var, value)
    if (var == "USE_COLORBLIND_MODE") then
        isColorBlind = (value == "1");
    end
end

tt:SetScript("OnMouseDown", tt.StartMoving);
tt:SetScript("OnMouseUp", function(self) self:StopMovingOrSizing(); cfg.left, cfg.top = self:GetLeft(), self:GetTop(); end);
tt:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...); end);

tt:RegisterEvent("PLAYER_LOGIN");
tt:RegisterEvent("PLAYER_LEVEL_UP");
tt:RegisterEvent("VARIABLES_LOADED");
tt:RegisterEvent("CVAR_UPDATE");

--------------------------------------------------------------------------------------------------------
-- Slash Handling                                           --
--------------------------------------------------------------------------------------------------------
_G["SLASH_" .. modName .. "1"] = "/tip";
_G["SLASH_" .. modName .. "2"] = "/tiptac";
SlashCmdList[modName] = function(cmd)
    -- Extract Parameters
    local param1, param2 = cmd:match("^([^%s]+)%s*(.*)$");
    param1 = (param1 and param1:lower() or cmd:lower());
    -- Options
    if (param1 == "") then
        local loaded, reason = LoadAddOn("TipTacOptions");
        if (loaded) then
            if (TipTacOptions:IsShown()) then
                TipTacOptions:Hide();
            else
                TipTacOptions:Show();
            end
        else
            AzMsg(TTParam_Options1 .. tostring(reason) .. TTParam_Options2);
        end
        -- Show Anchor
    elseif (param1 == "anchor") then
        tt:Show();
        -- Invalid or No Command
    else
        UpdateAddOnMemoryUsage();
        AzMsg(format("----- |2%s|r |1%s|r ----- |1%.2f |2kb|r -----", modName, GetAddOnMetadata(modName, "Version"), GetAddOnMemoryUsage(modName)));
        AzMsg(TTParam_Invalid1);
        AzMsg(TTParam_Invalid2);
    end
end
--------------------------------------------------------------------------------------------------------
-- Modify Unit Tooltip                                        --
--------------------------------------------------------------------------------------------------------

-- Get Reaction Index
local function GetUnitReactionIndex(unit)
    -- Deadies
    if (UnitIsDead(unit)) then
        return 7;
        -- Players (Can't rely on UnitPlayerControlled() alone, since it always returns nil on units out of range)
    elseif (UnitIsPlayer(unit) or UnitPlayerControlled(unit)) then
        if (UnitCanAttack(unit, "player")) then
            return (UnitCanAttack("player", unit) and 2 or 3);
        elseif (UnitCanAttack("player", unit)) then
            return 4;
        elseif (UnitIsPVP(unit) and not UnitIsPVPSanctuary(unit) and not UnitIsPVPSanctuary("player")) then
            return 5;
        else
            return 6;
        end
        -- Tapped
    elseif (UnitIsTapped(unit) and not UnitIsTappedByPlayer(unit)) then
        return 1;
        -- Others
    else
        local reaction = (UnitReaction(unit, "player") or 3);
        return (reaction > 5 and 5) or (reaction < 2 and 2) or reaction;
    end
end

-- Returns the correct difficulty color compared to the player
local function GetDifficultyLevelColor(level)
    level = (level - pLevel);
    if (level > 4) then
        return "|cffff2020"; -- red
    elseif (level > 2) then
        return "|cffff8040"; -- orange
    elseif (level >= -2) then
        return "|cffffff00"; -- yellow
    elseif (level >= -GetQuestGreenRange()) then
        return "|cff40c040"; -- green
    else
        return "|cff808080"; -- gray
    end
end

-- Add target
local function AddTarget(lineList, target)
    local targetUnit = u.token .. "target";
    if (UnitIsUnit("player", targetUnit)) then
        lineList[#lineList + 1] = COL_WHITE;
        lineList[#lineList + 1] = cfg.targetYouText;
    else
        local targetReaction = cfg["colReactText" .. GetUnitReactionIndex(targetUnit)];
        lineList[#lineList + 1] = targetReaction;
        lineList[#lineList + 1] = "[";
        if (UnitIsPlayer(targetUnit)) then
            local _, targetClass = UnitClass(targetUnit);
            lineList[#lineList + 1] = (TT_ClassColors[targetClass] or COL_LIGHTGRAY);
            lineList[#lineList + 1] = target;
            lineList[#lineList + 1] = targetReaction;
        else
            lineList[#lineList + 1] = target;
        end
        lineList[#lineList + 1] = "]";
    end
end

-- Gather Unit Details
local function ModifyUnitTooltip()
    wipe(lineOne);
    wipe(lineInfo);
    local unit = u.token;
    local reaction = cfg["colReactText" .. u.reactionIndex];
    local name, realm = UnitName(unit);
    local hasGuildTitle;
    -- Level + Classification
    local level = UnitLevel(unit);
    local tttData = (TipTacTalents and TipTacTalents.current);
    if (tttData) and (level == -1) and (u.isPlayer) and (tttData.name == name) and (tttData[3]) then -- Using TipTacTalents, determine level of ?? players by adding talent points together
        level = (tttData[1] + tttData[2] + tttData[3] + 9);
    end
    local classification = UnitClassification(unit);
    lineInfo[#lineInfo + 1] = (UnitCanAttack(unit, "player") or UnitCanAttack("player", unit)) and GetDifficultyLevelColor(level ~= -1 and level or 500) or cfg.colLevel;
    lineInfo[#lineInfo + 1] = (cfg["classification_" .. classification] or "%d "):format(level == -1 and "??" or level);
    -- Players
    if (u.isPlayer) then
        -- race
        lineInfo[#lineInfo + 1] = " ";
        lineInfo[#lineInfo + 1] = cfg.colRace;
        lineInfo[#lineInfo + 1] = UnitRace(unit);
        -- class
        local class, classEng = UnitClass(unit);
        lineInfo[#lineInfo + 1] = " ";
        lineInfo[#lineInfo + 1] = (TT_ClassColors[classEng] or COL_WHITE);
        lineInfo[#lineInfo + 1] = class;
        u.classEng = classEng;
        -- name
        lineOne[#lineOne + 1] = (cfg.colorNameByClass and (TT_ClassColors[classEng] or COL_WHITE) or reaction);
        lineOne[#lineOne + 1] = (cfg.nameType == "original" and u.originalName) or (cfg.nameType == "title" and UnitPVPName(unit)) or name;
        if (realm) and (realm ~= "") and (cfg.showRealm ~= "none") then
            if (cfg.showRealm == "show") then
                lineOne[#lineOne + 1] = " - ";
                lineOne[#lineOne + 1] = realm;
            else
                lineOne[#lineOne + 1] = " (*)";
            end
        end
        -- dc, afk or dnd
        if (cfg.showStatus) then
            local status = (not UnitIsConnected(unit) and TT_DC) or (UnitIsAFK(unit) and TT_AFK) or (UnitIsDND(unit) and TT_DND);
            if (status) then
                lineOne[#lineOne + 1] = COL_WHITE;
                lineOne[#lineOne + 1] = status;
            end
        end
        -- guild
        local guild, guildRank = GetGuildInfo(unit);
        if (guild) then
            local pGuild = GetGuildInfo("player");
            local guildColor = (guild ~= pGuild and reaction or cfg.colSameGuild);
            GameTooltipTextLeft2:SetFormattedText(cfg.showGuildRank and guildRank and "%s<%s> %s%s" or "%s<%s>", guildColor, guild, COL_LIGHTGRAY, guildRank);
            hasGuildTitle = true;
        end
        -- NPCs
    else
        -- name
        lineOne[#lineOne + 1] = reaction;
        lineOne[#lineOne + 1] = name;
        -- guild/title
        if (u.title) then
            -- Az: this doesn't work with mini diablo, which has the format: 1) Mini Diablo 2) Lord of Terror 3) Player's Pet 4) Level 1 Non-combat Pet
            (isColorBlind and GameTooltipTextLeft3 or GameTooltipTextLeft2):SetFormattedText("%s<%s>", reaction, u.title);
            hasGuildTitle = true;
        end
        -- class
        local class = UnitCreatureFamily(unit) or UnitCreatureType(unit);
        if (not class or class == TT_NotSpecified) then
            class = TT_Unknown;
        end
        lineInfo[#lineInfo + 1] = " ";
        lineInfo[#lineInfo + 1] = cfg.colRace;
        lineInfo[#lineInfo + 1] = class;
    end
    -- Target
    if (cfg.showTarget ~= "none") then
        local targetUnit = unit .. "target";
        local target = UnitName(targetUnit);
        if (target) and (target ~= UNKNOWN and target ~= "" or UnitExists(targetUnit)) then
            if (cfg.showTarget == "first") then
                lineOne[#lineOne + 1] = COL_WHITE;
                lineOne[#lineOne + 1] = " : |r";
                AddTarget(lineOne, target);
            elseif (cfg.showTarget == "second") then
                lineOne[#lineOne + 1] = "\n  ";
                AddTarget(lineOne, target);
            elseif (cfg.showTarget == "last") then
                lineInfo[#lineInfo + 1] = TT_Targeting;
                AddTarget(lineInfo, target);
            end
        end
    end
    -- Reaction Text
    if (cfg.reactText) then
        lineInfo[#lineInfo + 1] = "\n";
        lineInfo[#lineInfo + 1] = cfg["colReactText" .. u.reactionIndex];
        lineInfo[#lineInfo + 1] = TT_Reaction[u.reactionIndex];
    end
    -- Line One + Guild
    GameTooltipTextLeft1:SetFormattedText(("%s"):rep(#lineOne), unpack(lineOne));
    -- Info Line
    local lineIndex = 2 + (isColorBlind and UnitIsVisible(unit) and 1 or 0) + (hasGuildTitle and 1 or 0);
    local gttLine = _G["GameTooltipTextLeft" .. lineIndex];
    gttLine:SetFormattedText(("%s"):rep(#lineInfo), unpack(lineInfo));
    gttLine:SetTextColor(1, 1, 1);
end

-- Add "Targeted By" line
local function AddTargetedBy()
    local numParty, numRaid = GetNumPartyMembers(), GetNumRaidMembers();
    if (numParty > 0 or numRaid > 0) then
        for i = 1, (numRaid > 0 and numRaid or numParty) do
            local unit = (numRaid > 0 and "raid" .. i or "party" .. i);
            if (UnitIsUnit(unit .. "target", u.token)) and (not UnitIsUnit(unit, "player")) then
                local _, class = UnitClass(unit);
                targetedList[#targetedList + 1] = TT_ClassColors[class];
                targetedList[#targetedList + 1] = UnitName(unit);
                targetedList[#targetedList + 1] = "|r, ";
            end
        end
        if (#targetedList > 0) then
            targetedList[#targetedList] = nil;
            gtt:AddLine(" ", nil, nil, nil, 1);
            local line = _G["GameTooltipTextLeft" .. gtt:NumLines()];
            line:SetFormattedText(TT_TargetedBy, (#targetedList + 1) / 3, table.concat(targetedList));
            wipe(targetedList);
        end
    end
end

--------------------------------------------------------------------------------------------------------
-- Health & Power Bars                                         --
--------------------------------------------------------------------------------------------------------

-- Make Two StatusBars
for i = 1, 2 do
    local bar = CreateFrame("StatusBar", nil, gtt);
    bar:SetWidth(0); -- Az: As of patch 3.3.3, setting the initial size will somehow mess up the texture. Previously this initilization was needed to fix an anchoring issue.
    bar:SetHeight(0);

    bar.bg = bar:CreateTexture(nil, "BACKGROUND");
    bar.bg:SetTexture(0.3, 0.3, 0.3, 0.6);
    bar.bg:SetAllPoints();

    bar.text = bar:CreateFontString(nil, "ARTWORK");
    bar.text:SetPoint("CENTER");
    bar.text:SetTextColor(1, 1, 1);

    bars[#bars + 1] = bar;
end

-- Configures the Health and Power Bars
local function SetupHealthAndPowerBar()
    u.powerType = UnitPowerType(u.token);
    -- Visibility
    if (cfg.healthBar) then
        bars[1]:Show();
        if (u.isPlayer) and (cfg.healthBarClassColor) then
            local color = CLASS_COLORS[u.classEng];
            bars[1]:SetStatusBarColor(color.r, color.g, color.b);
        else
            bars[1]:SetStatusBarColor(unpack(cfg.healthBarColor));
        end
    else
        bars[1]:Hide();
    end
    if (UnitPowerMax(u.token) ~= 0) and (cfg.manaBar and u.powerType == 0 or cfg.powerBar and u.powerType ~= 0) then
        if (u.powerType == 0) then
            bars[2]:SetStatusBarColor(unpack(cfg.manaBarColor));
        else
            u.powerColor = PowerBarColor[u.powerType or 5];
            bars[2]:SetStatusBarColor(u.powerColor.r, u.powerColor.g, u.powerColor.b);
        end
        bars[2]:Show();
    else
        bars[2]:Hide();
    end
    -- Anchor Frames
    bars[2]:ClearAllPoints();
    bars[1]:ClearAllPoints();
    if (bars[2]:IsShown()) then
        bars[2]:SetPoint("BOTTOMLEFT", 8, 9);
        bars[2]:SetPoint("BOTTOMRIGHT", -8, 9);
        if (bars[1]:IsShown()) then
            bars[1]:SetPoint("BOTTOMLEFT", bars[2], "TOPLEFT", 0, 4);
            bars[1]:SetPoint("BOTTOMRIGHT", bars[2], "TOPRIGHT", 0, 4);
        end
    elseif (bars[1]:IsShown()) then
        bars[1]:SetPoint("BOTTOMLEFT", 8, 9);
        bars[1]:SetPoint("BOTTOMRIGHT", -8, 9);
    end
    -- Calculate the space needed for the shown bars
    bars.offset = 0;
    for _, bar in ipairs(bars) do
        if (bar:IsShown()) then
            bars.offset = (bars.offset + cfg.barHeight + 5);
        end
    end
    if (bars.offset == 0) then
        bars.offset = nil;
    end
    -- Hide GTT Status bar, we have our own, which is prettier!
    if (cfg.hideDefaultBar) then
        GameTooltipStatusBar:Hide();
    end
end

-- Format Number Value
local function FormatValue(val)
    if (val < 10000) then
        return val;
    elseif (val < 1000000) then
        return ("%.1fk"):format(val / 1000);
    else
        return ("%.2fm"):format(val / 1000000);
    end
end

-- Format Bar Text
local function FormatBarValues(fs, val, max, type)
    if (type == "none") then
        fs:SetText("");
    elseif (type == "auto") then
        fs:SetFormattedText("%s / %s", FormatValue(val), FormatValue(max));
    elseif (type == "deficit") then
        fs:SetFormattedText("%s%d", (val == max and "" or "-"), max - val);
    elseif (type == "value") or (max == 0) then -- max should never be zero, but if it is, dont let it pass through to the "percent" type, or there will be an error
        fs:SetFormattedText("%d / %d", val, max);
    elseif (type == "percent") then
        fs:SetFormattedText("%.0f%%", val / max * 100);
    end
end

-- Update Health & Power
local function UpdateHealthAndPowerBar()
    -- Health
    if (bars[1]:IsShown()) then
        local val, max = UnitHealth(u.token), UnitHealthMax(u.token);
        bars[1]:SetMinMaxValues(0, max);
        bars[1]:SetValue(val);
        FormatBarValues(bars[1].text, val, max, cfg.healthBarText);
    end
    -- Power
    if (bars[2]:IsShown()) then
        local val, max = UnitPower(u.token), UnitPowerMax(u.token);
        bars[2]:SetMinMaxValues(0, max);
        bars[2]:SetValue(val);
        local barText = (u.powerType == 0 and cfg.manaBarText or cfg.powerBarText);
        FormatBarValues(bars[2].text, val, max, barText);
    end
end

--------------------------------------------------------------------------------------------------------
-- Auras - Buffs & Debuffs                                      --
--------------------------------------------------------------------------------------------------------
local function CreateAura()
    local aura = CreateFrame("Frame", nil, gtt);
    aura:SetWidth(cfg.auraSize);
    aura:SetHeight(cfg.auraSize);
    aura.count = aura:CreateFontString(nil, "OVERLAY");
    aura.count:SetPoint("BOTTOMRIGHT", 1, 0);
    aura.count:SetFont(GameFontNormal:GetFont(), (cfg.auraSize / 2), "OUTLINE");
    aura.icon = aura:CreateTexture(nil, "BACKGROUND");
    aura.icon:SetAllPoints();
    aura.icon:SetTexCoord(0.07, 0.93, 0.07, 0.93);
    aura.cooldown = CreateFrame("Cooldown", nil, aura, "CooldownFrameTemplate");
    aura.cooldown:SetReverse(1);
    aura.cooldown:SetAllPoints();
    aura.cooldown:SetFrameLevel(aura:GetFrameLevel());
    aura.border = aura:CreateTexture(nil, "OVERLAY");
    aura.border:SetPoint("TOPLEFT", -1, 1);
    aura.border:SetPoint("BOTTOMRIGHT", 1, -1);
    aura.border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays");
    aura.border:SetTexCoord(0.296875, 0.5703125, 0, 0.515625);
    auras[#auras + 1] = aura;
    return aura;
end

-- The outer variable "pos" is the actual index of the shown auras we are actually going to use, in case certain auras are filtered. The "index" variable is for querying the auras.
local function SetupAuras()
    -- Init
    local pos = 1;
    local maxAuras = floor(gtt:GetWidth() / (cfg.auraSize + 1));
    -- Get Buffs
    if (cfg.showBuffs) then
        local index = 1;
        while (true) do
            local _, _, iconTexture, count, debuffType, duration, endTime, casterUnit = UnitAura(u.token, index, "HELPFUL");
            if (not iconTexture) or (pos / maxAuras > cfg.auraMaxRows) then
                break;
            end
            if (not cfg.selfAurasOnly or casterUnit == "player" or casterUnit == "pet" or casterUnit == "vehicle") then
                local aura = auras[pos] or CreateAura();
                -- Anchor It
                aura:ClearAllPoints();
                if (pos == 1) then
                    if (cfg.aurasAtBottom) then
                        aura:SetPoint("TOPLEFT", gtt, "BOTTOMLEFT");
                    else
                        aura:SetPoint("BOTTOMLEFT", gtt, "TOPLEFT");
                    end
                elseif (maxAuras == 1) or (pos % maxAuras == 1) then
                    if (cfg.aurasAtBottom) then
                        aura:SetPoint("TOP", auras[pos - maxAuras], "BOTTOM", 0, 1);
                    else
                        aura:SetPoint("BOTTOM", auras[pos - maxAuras], "TOP", 0, 1);
                    end
                else
                    aura:SetPoint("LEFT", auras[pos - 1], "RIGHT", 1, 0);
                end
                -- Cooldown
                if (cfg.showAuraCooldown) and (duration and duration > 0 and endTime and endTime > 0) then
                    aura.cooldown:SetCooldown(endTime - duration, duration);
                else
                    aura.cooldown:Hide();
                end
                -- Set Texture + Count
                aura.icon:SetTexture(iconTexture);
                aura.count:SetText(count and count > 1 and count or "");
                -- Border
                aura.border:Hide();
                -- Show + Next, Break if exceed max desired rows of auras
                aura:Show();
                pos = (pos + 1);
            end
            index = (index + 1);
        end
    end
    -- Get Debuffs
    if (cfg.showDebuffs) and (pos / maxAuras <= cfg.auraMaxRows) then
        local index = 1;
        local buffCount = (pos - 1);
        local lineOffset = floor(buffCount / maxAuras);
        local buffsOnFirstLine = (maxAuras - buffCount % maxAuras);
        while (true) do
            local _, _, iconTexture, count, debuffType, duration, endTime, casterUnit = UnitAura(u.token, index, "HARMFUL");
            if (not iconTexture) or (pos / maxAuras > cfg.auraMaxRows) then
                break;
            end
            if (not cfg.selfAurasOnly or casterUnit == "player" or casterUnit == "pet" or casterUnit == "vehicle") then
                local aura = auras[pos] or CreateAura();
                -- Anchor It
                aura:ClearAllPoints();
                if (pos == buffCount + 1) then
                    if (cfg.aurasAtBottom) then
                        aura:SetPoint("TOPRIGHT", gtt, "BOTTOMRIGHT", -1, (cfg.auraSize + 1) * lineOffset * -1);
                    else
                        aura:SetPoint("BOTTOMRIGHT", gtt, "TOPRIGHT", -1, (cfg.auraSize + 1) * lineOffset);
                    end
                elseif ((pos - 1) % maxAuras == 0) then
                    if (cfg.aurasAtBottom) then
                        aura:SetPoint("TOPRIGHT", gtt, "BOTTOMRIGHT", 0, (cfg.auraSize + 1) * floor(pos / maxAuras) * -1);
                    else
                        aura:SetPoint("BOTTOMRIGHT", gtt, "TOPRIGHT", 0, (cfg.auraSize + 1) * floor(pos / maxAuras));
                    end
                else
                    aura:SetPoint("RIGHT", auras[pos - 1], "LEFT", -1, 0);
                end
                -- Cooldown
                if (cfg.showAuraCooldown) and (duration and duration > 0 and endTime and endTime > 0) then
                    aura.cooldown:SetCooldown(endTime - duration, duration);
                else
                    aura.cooldown:Hide();
                end
                -- Set Texture + Count
                aura.icon:SetTexture(iconTexture);
                aura.count:SetText(count and count > 1 and count or "");
                -- Border
                local color = DebuffTypeColor[debuffType] or DebuffTypeColor["none"];
                aura.border:SetVertexColor(color.r, color.g, color.b);
                aura.border:Show();
                -- Show + Next, Break if exceed max desired rows of aura
                aura:Show();
                pos = (pos + 1);
            end
            index = (index + 1);
        end
    end
    -- Hide the Unused
    for i = pos, #auras do
        auras[i]:Hide();
    end
end

--------------------------------------------------------------------------------------------------------
-- GameTooltip Hooks                                         --
--------------------------------------------------------------------------------------------------------

--[[
    USEFUL NOTES :: This is apparently the order at which the GTT construsts the tip
    - GameTooltip_SetDefaultAnchor()
    - Internal_Function_Which_Fills_Tip()		-- GTT:GetUnit() becomes valid after this!
    - GTT:Show()								-- Will Resize the tip
    - GTT.OnTooltipSetUnit()
    - Something that resizes the tip, Show() already does this, but it's also done after OnTooltipSetUnit() again. Or maybe it's just another addon's hook doing it. Tested without any addons loaded, and it still resizes after.
--]]

-- GTT Control Variables
local gtt_lastUpdate = 0;
local gtt_newHeight;
local gtt_anchorType;
local gtt_anchorPoint;

-- Get The Anchor Position Depending on the Tip Content and Parent Frame -- Do not depend on "u.token" here, as it might not have been cleared yet!
-- Checking "mouseover" here isn't ideal due to actionbars, it will sometimes return true because of selfcast.
local function GetAnchorPosition()
    local mouseFocus = GetMouseFocus();
    local isUnit = UnitExists("mouseover") or (mouseFocus and mouseFocus:GetAttribute("unit"));
    local var = "anchor" .. (mouseFocus == WorldFrame and "World" or "Frame") .. (isUnit and "Unit" or "Tip");
    return cfg[var .. "Type"], cfg[var .. "Point"];
end

-- HOOK: GTT:Show -- If there are any bar offsets, resize the tip
local gttShow = gtt.Show;
gtt.Show = function(self, ...)
    gttShow(self, ...);
    if (bars.offset) then
        gtt_newHeight = (self:GetHeight() + bars.offset);
        self:SetHeight(gtt_newHeight);
    end
end

-- HOOK: GTT:FadeOut -- This allows us to check when the tip is fading out.
local gttFadeOut = gtt.FadeOut;
gtt.FadeOut = function(self, ...)
    if (not u.token) or (not cfg.overrideFade) then
        self.fadeOut = 2; -- Don't allow the OnUpdate handler to run the fadeout/update code
        gttFadeOut(self, ...);
    elseif (cfg.preFadeTime == 0 and cfg.fadeTime == 0) then
        self:Hide();
    else
        self.fadeOut = 1;
        gtt_lastUpdate = 0;
    end
end

-- HOOK: GTT OnShow -- This ensures that default anchored world frame tips have the proper color, their internal function seems to set them to a dark blue color
local function GTTHook_OnShow(self, ...)
    gtt_anchorType, gtt_anchorPoint = GetAnchorPosition();
    if (gtt_anchorType == "mouse") and (self:GetAnchorType() ~= "ANCHOR_CURSOR") then
        tt:AnchorFrameToMouse(self);
    end
    if (self:IsOwned(UIParent)) and (not self:GetUnit()) then
        self:SetBackdropColor(unpack(cfg.tipColor));
    end
end

-- HOOK: GTT OnUpdate
local function GTTHook_OnUpdate(self, elapsed)
    -- This ensures that mouse anchored world frame tips have the proper color, their internal function seems to set them to a dark blue color
    if (self:GetAnchorType() == "ANCHOR_CURSOR") then
        self:SetBackdropColor(unpack(cfg.tipColor));
        self:SetBackdropBorderColor(unpack(cfg.tipBorderColor));
        return;
        -- Anchor GTT to Mouse
    elseif (gtt_anchorType == "mouse") then
        tt:AnchorFrameToMouse(self);
    end

    -- Fadeout / Update Tip if Showing a Unit
    -- Do not allow (fadeOut == 2), as that is only for non overridden fadeouts, but we still need to keep resizing the tip
    if (u.token) and (self.fadeOut ~= 2) then
        gtt_lastUpdate = (gtt_lastUpdate + elapsed);
        if (self.fadeOut) then
            self:Show(); -- Overrides self:FadeOut()
            if (gtt_lastUpdate > cfg.fadeTime + cfg.preFadeTime) then
                self.fadeOut = nil;
                self:Hide();
            elseif (gtt_lastUpdate > cfg.preFadeTime) then
                self:SetAlpha(1 - (gtt_lastUpdate - cfg.preFadeTime) / cfg.fadeTime);
            end
            -- This is only really useful for worldframe unit tips, when u.token == "mouseover", they do not call the GTT:FadeOut()
        elseif (not UnitExists(u.token)) then
            self:FadeOut();
        elseif (cfg.updateFreq > 0) and (gtt_lastUpdate > cfg.updateFreq) then
            gtt_lastUpdate = 0;
            tt:ApplyGeneralAppearance();
        end
    end

    -- Resize the Tooltip if it's size has changed more than 0.1 units
    if (gtt_newHeight) and (abs(self:GetHeight() - gtt_newHeight) > 0.1) then
        self:SetHeight(gtt_newHeight);
    end
end

-- HOOK: GTT OnTooltipSetUnit
local function GTTHook_OnTooltipSetUnit(self, ...)
    -- Hides the tip in combat if one of those options are set. Also checks if the Shift key is pressed, and cancels hiding of the tip (if that option is set, that is)
    if (cfg.hideAllTipsInCombat or cfg.hideUFTipsInCombat and self:GetOwner() ~= UIParent) and (not cfg.showHiddenTipsOnShift or not IsShiftKeyDown()) and (UnitAffectingCombat("player")) then
        self:Hide();
        return;
    end
    local _, unit = self:GetUnit();
    -- Concated unit tokens such as "targettarget" cannot be returned as the unit by GTT:GetUnit() and it will return as "mouseover", but the "mouseover" unit is still invalid at this point for those unitframes!
    -- To overcome this problem, we look if the mouse is over a unitframe, and if that unitframe has a unit attribute set?
    if (not unit) then
        local mFocus = GetMouseFocus();
        unit = mFocus and mFocus:GetAttribute("unit");
    end
    -- A mage's mirror images sometimes doesn't return a unit, this would fix it
    if (not unit) and (UnitExists("mouseover")) then
        unit = "mouseover";
    end
    -- Sometimes when you move your mouse quicky over units in the worldframe, we can get here without a unit
    if (not unit) then
        self:Hide();
        return;
    end
    -- A "mouseover" unit is better to have as we can then safely say the tip should no longer show when it becomes invalid. Harder to say with a "party2" unit.
    -- This also helps fix the problem that "mouseover" units aren't valid for group members out of range, a bug that has been in WoW since 3.0.2 I think.
    if (UnitIsUnit(unit, "mouseover")) then
        unit = "mouseover";
    end
    -- We're done, apply appearance
    u.token = unit;
    self.fadeOut = nil; -- Az: Sometimes this wasn't getting reset, the fact a cleanup isn't performed at this point, now that it was moved to "OnTooltipCleared" is very bad, so this is a fix
    tt:ApplyGeneralAppearance(true);
end

-- HOOK: GTT OnTooltipCleared -- This will clean up auras, bars, raid icon and vars for the gtt when we aren't showing a unit
local function GTTHook_OnTooltipCleared(self, ...)
    wipe(u);
    gtt_lastUpdate = 0;
    gtt_newHeight = nil;
    self.fadeOut = nil;
    bars.offset = nil;
    for i = 1, #bars do
        bars[i]:Hide();
    end
    for i = 1, #auras do
        auras[i]:Hide();
    end
    if (tipIcon) then
        tipIcon:Hide();
    end
end

-- OnHide Script -- Used to default the background and border color
local function TipHook_OnHide(self, ...)
    self:SetBackdropColor(unpack(cfg.tipColor)); -- Default: For most: (0.1,0.1,0.2), World Objects?: (0,0.2,0.35)
    self:SetBackdropBorderColor(unpack(cfg.tipBorderColor)); -- Default: (1,1,1,1)
end

-- OnTooltipSetItem Script -- For item colored border
local function TipHook_OnTooltipSetItem(self, ...)
    if (cfg.itemQualityBorder) then
        local _, link = self:GetItem();
        if (link) then
            local _, _, rarity = GetItemInfo(link);
            self:SetBackdropBorderColor(GetItemQualityColor(rarity or 0));
        end
    end
end

-- Function to loop through tips to modify and hook
function tt:HookTips()
    -- Need to be called as late as possible during load, as we want to try and be the last addon to hook "OnTooltipSetUnit" so we always have a "completed" tip to work on
    gtt:HookScript("OnShow", GTTHook_OnShow);
    gtt:HookScript("OnUpdate", GTTHook_OnUpdate);
    gtt:HookScript("OnTooltipSetUnit", GTTHook_OnTooltipSetUnit);
    gtt:HookScript("OnTooltipCleared", GTTHook_OnTooltipCleared);
    -- HOOK: OnHide & OnTooltipSetItem Scripts
    for index, tip in ipairs(TT_TipsToModify) do
        tip = (_G[tip] or false); -- don't want to nil out an entry
        TT_TipsToModify[index] = tip;
        if (type(tip) == "table") and (type(tip.GetObjectType) == "function") then
            tip:HookScript("OnHide", TipHook_OnHide);
            if (tip:HasScript("OnTooltipSetItem")) then
                tip:HookScript("OnTooltipSetItem", TipHook_OnTooltipSetItem);
            end
        end
    end
    -- Replace GameTooltip_SetDefaultAnchor (For Re-Anchoring) -- Patch 3.2 made this function secure for some reason
    hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
        -- Return if no tooltip or parent
        if (not tooltip or not parent) then
            return;
        end
        -- Position Tip to Normal, Mouse or Parent anchor
        gtt_anchorType, gtt_anchorPoint = GetAnchorPosition();
        tooltip:SetOwner(parent, "ANCHOR_NONE");
        if (gtt_anchorType == "mouse") then
            tt:AnchorFrameToMouse(tooltip);
        elseif (gtt_anchorType == "parent") then
            tooltip:SetPoint(TT_MirrorAnchorsSmart[gtt_anchorPoint] or TT_MirrorAnchors[gtt_anchorPoint], parent, gtt_anchorPoint);
        else
            tooltip:SetPoint(gtt_anchorPoint, tt);
        end
        tooltip.default = 1;
    end);
    -- Clear this function as it's not needed anymore
    self.HookTips = nil;
end

--------------------------------------------------------------------------------------------------------
-- Settings                                              --
--------------------------------------------------------------------------------------------------------

-- Setup Gradient Tip
local function SetupGradientTip(tip)
    local g = tip.tipTacGradient;
    if (not cfg.gradientTip) then
        if (g) then
            g:Hide();
        end
        return;
    elseif (not g) then
        g = tip:CreateTexture();
        g:SetTexture(1, 1, 1, 1);
        tip.tipTacGradient = g;
    end
    g:SetGradientAlpha("VERTICAL", 0, 0, 0, 0, unpack(cfg.gradientColor));
    g:SetPoint("TOPLEFT", cfg.backdropInsets, cfg.backdropInsets * -1);
    g:SetPoint("BOTTOMRIGHT", tip, "TOPRIGHT", cfg.backdropInsets * -1, -36);
    g:Show();
end

-- Apply Settings
function tt:ApplySettings()
    -- Hide World Tips Instantly
    if (cfg.hideWorldTips) then
        self:RegisterEvent("CURSOR_UPDATE");
    else
        self:UnregisterEvent("CURSOR_UPDATE");
    end
    -- Set Backdrop
    tipBackdrop.bgFile = cfg.tipBackdropBG;
    tipBackdrop.edgeFile = cfg.tipBackdropEdge;
    tipBackdrop.edgeSize = cfg.backdropEdgeSize;
    tipBackdrop.insets.left = cfg.backdropInsets;
    tipBackdrop.insets.right = cfg.backdropInsets;
    tipBackdrop.insets.top = cfg.backdropInsets;
    tipBackdrop.insets.bottom = cfg.backdropInsets;
    -- Set Scale, Backdrop, Gradient
    for _, tip in ipairs(TT_TipsToModify) do
        if (type(tip) == "table") and (type(tip.GetObjectType) == "function") then
            SetupGradientTip(tip);
            tip:SetScale(cfg.gttScale);
            tip:SetBackdrop(tipBackdrop);
            tip:SetBackdropColor(unpack(cfg.tipColor));
            tip:SetBackdropBorderColor(unpack(cfg.tipBorderColor));
        end
    end
    -- Bar Appearances
    GameTooltipStatusBar:SetStatusBarTexture(cfg.barTexture);
    GameTooltipStatusBar:GetStatusBarTexture():SetHorizTile(false); -- Az: 3.3.3 fix
    GameTooltipStatusBar:GetStatusBarTexture():SetVertTile(false); -- Az: 3.3.3 fix
    GameTooltipStatusBar:SetHeight(cfg.barHeight);
    for _, bar in ipairs(bars) do
        bar:SetStatusBarTexture(cfg.barTexture);
        bar:GetStatusBarTexture():SetHorizTile(false); -- Az: 3.3.3 fix
        bar:GetStatusBarTexture():SetVertTile(false); -- Az: 3.3.3 fix
        bar:SetHeight(cfg.barHeight);
        bar.text:SetFont(cfg.barFontFace, cfg.barFontSize, cfg.barFontFlags);
    end
    -- If disabled, hide auras, else set their size
    for _, aura in ipairs(auras) do
        if (cfg.showBuffs or cfg.showDebuffs) then
            aura:SetWidth(cfg.auraSize);
            aura:SetHeight(cfg.auraSize);
            aura.count:SetFont(TT_Font, (cfg.auraSize / 2), "OUTLINE");
        else
            aura:Hide();
        end
    end
    -- GameTooltip Font Templates
    if (cfg.modifyFonts) then
        GameTooltipHeaderText:SetFont(cfg.fontFace, cfg.fontSize + 2, cfg.fontFlags);
        GameTooltipText:SetFont(cfg.fontFace, cfg.fontSize, cfg.fontFlags);
        GameTooltipTextSmall:SetFont(cfg.fontFace, cfg.fontSize - 2, cfg.fontFlags);
    end
    -- Raid Icon
    if (cfg.iconRaid or cfg.iconFaction or cfg.iconCombat) and (not tipIcon) then
        tipIcon = gtt:CreateTexture(nil, "BACKGROUND");
    end
    if (tipIcon) then
        if (cfg.iconRaid or cfg.iconFaction or cfg.iconCombat) then
            tipIcon:SetWidth(cfg.iconSize);
            tipIcon:SetHeight(cfg.iconSize);
            tipIcon:ClearAllPoints();
            tipIcon:SetPoint(TT_MirrorAnchors[cfg.iconAnchor], gtt, cfg.iconAnchor);
        else
            tipIcon:Hide();
        end
    end
end

--------------------------------------------------------------------------------------------------------
-- TipTac Functions                                          --
--------------------------------------------------------------------------------------------------------

-- Allows other mods to "register" tooltips or frames to be modified by TipTac
function tt:AddModifiedTip(tip, noHooks)
    if (type(tip) == "string") then
        tip = _G[tip];
    end
    if (type(tip) == "table") and (type(tip.GetObjectType) == "function") then
        TT_TipsToModify[#TT_TipsToModify + 1] = tip;
        if (not noHooks) then
            tip:HookScript("OnHide", TipHook_OnHide);
            if (tip:HasScript("OnTooltipSetItem")) then
                tip:HookScript("OnTooltipSetItem", TipHook_OnTooltipSetItem);
            end
        end
        self:ApplySettings();
    end
end

-- Anchor any given frame to mouse position
function tt:AnchorFrameToMouse(frame)
    local x, y = GetCursorPosition();
    local effScale = frame:GetEffectiveScale();
    frame:ClearAllPoints();
    frame:SetPoint(gtt_anchorPoint, UIParent, "BOTTOMLEFT", (x / effScale + cfg.mouseOffsetX), (y / effScale + cfg.mouseOffsetY));
end

-- Apply TipTac Appearance
local function ApplyTipTacAppearance(first)
    -- Store Original Name
    if (first) and (cfg.nameType == "original") then
        u.originalName = GameTooltipTextLeft1:GetText();
    end
    -- Find NPC Title -- Az: 09.08.22: Should work with colorblind mode now
    if (first) and (not u.isPlayer) then
        u.title = (isColorBlind and GameTooltipTextLeft3 or GameTooltipTextLeft2):GetText();
        if (u.title) and (u.title:find(TT_LevelMatch)) then
            u.title = nil;
        end
    end
    -- Modify the Tip
    ModifyUnitTooltip();
    if (first) and (cfg.showTargetedBy) then
        AddTargetedBy();
    end
    -- Bars
    if (first) or (UnitPowerType(u.token) ~= u.powerType) then
        SetupHealthAndPowerBar();
    end
    UpdateHealthAndPowerBar();
    -- Remove PVP Line, which makes the tip look a bit bad
    for i = 2, gtt:NumLines() do
        local line = _G["GameTooltipTextLeft" .. i];
        if (line:GetText() == PVP_ENABLED) then
            line:SetText(nil);
            break;
        end
    end
    -- Show & Adjust Height
    gtt:Show();
end

-- Apply General Appearance
function tt:ApplyGeneralAppearance(first)
    u.isPlayer = UnitIsPlayer(u.token);
    u.reactionIndex = GetUnitReactionIndex(u.token);
    -- Reaction Backdrop/Border Color
    if (cfg.reactColoredBackdrop) then
        gtt:SetBackdropColor(unpack(cfg["colReactBack" .. u.reactionIndex]));
    end
    if (cfg.reactColoredBorder) then
        gtt:SetBackdropBorderColor(unpack(cfg["colReactBack" .. u.reactionIndex]));
        -- Class Colored Border
    elseif (first) and (cfg.classColoredBorder) and (u.isPlayer) then
        local _, classEng = UnitClass(u.token);
        local color = CLASS_COLORS[classEng];
        gtt:SetBackdropBorderColor(color.r, color.g, color.b);
    end
    -- Raid Icon
    if (cfg.iconRaid or cfg.iconFaction or cfg.iconCombat) then
        local raidIconIndex = GetRaidTargetIndex(u.token);
        if (cfg.iconRaid) and (raidIconIndex) then
            tipIcon:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcons");
            SetRaidTargetIconTexture(tipIcon, raidIconIndex);
            tipIcon:Show();
        elseif (cfg.iconFaction) and (UnitIsPVPFreeForAll(u.token)) then
            tipIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
            tipIcon:SetTexCoord(0, 0.62, 0, 0.62);
            tipIcon:Show();
        elseif (cfg.iconFaction) and (UnitIsPVP(u.token)) and (UnitFactionGroup(u.token)) then
            tipIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-" .. UnitFactionGroup(u.token));
            tipIcon:SetTexCoord(0, 0.62, 0, 0.62);
            tipIcon:Show();
        elseif (cfg.iconCombat) and (UnitAffectingCombat(u.token)) then
            tipIcon:SetTexture("Interface\\CharacterFrame\\UI-StateIcon");
            tipIcon:SetTexCoord(0.5, 1, 0, 0.5);
            tipIcon:Show();
        else
            tipIcon:Hide();
        end
    end
    -- TipTac Appearance
    if (cfg.showUnitTip) then
        ApplyTipTacAppearance(first);
    end
    -- Auras - Has to be updated last because it depends on the tips new dimention
    if (cfg.showBuffs or cfg.showDebuffs) then
        SetupAuras();
    end
end