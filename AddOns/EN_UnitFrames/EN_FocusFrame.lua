-- Localize it for non-English clients.
FOCUSFRAME_TITLE = "Focus";
FOCUSFRAME_DRAG = "Drag to move";
FOCUSFRAME_DRAG_LOCKED = "Use /focusframe unlock to move.";

if GetLocale() == "zhCN" then
    FOCUSFRAME_TITLE = "\231\132\166\231\130\185\231\155\174\230\160\135"
    FOCUSFRAME_DRAG = "\230\140\137\228\189\143\233\188\160\230\160\135\229\183\166\233\148\174\230\139\150\229\138\168\230\157\165\231\167\187\229\138\168\230\161\134\228\189\147"
    FOCUSFRAME_DRAG_LOCKED = "\228\189\191\231\148\168 /focusframe unlock"
elseif GetLocale() == "zhTW" then
    FOCUSFRAME_TITLE = "\231\132\166\233\187\158\231\155\174\230\168\153"
    FOCUSFRAME_DRAG = "\230\140\137\228\189\143\230\187\145\233\188\160\229\183\166\233\141\181\230\139\150\229\139\149\228\190\134\231\167\187\229\139\149\230\161\134\233\171\148"
    FOCUSFRAME_DRAG_LOCKED = "\228\189\191\231\148\168 /focusframe unlock"
end

-- Packages all local variables of TgFocusFrame Addon.
TgFocusFrameLocalVariables = {};
local l = TgFocusFrameLocalVariables;
local i, j, k;

l.MAX_FOCUS_DEBUFFS = 16;
l.MAX_FOCUS_BUFFS = 32;
l.CURRENT_FOCUS_NUM_DEBUFFS = 0;
l.TARGET_BUFFS_PER_ROW = 8;
l.TARGET_DEBUFFS_PER_ROW = 8;
l.LARGE_BUFF_SIZE = 21;
l.LARGE_BUFF_FRAME_SIZE = 23;
l.SMALL_BUFF_SIZE = 17;
l.SMALL_BUFF_FRAME_SIZE = 19;

l.FocusUnitReactionColor = {
    { r = 1.0, g = 0.0, b = 0.0 },
    { r = 1.0, g = 0.0, b = 0.0 },
    { r = 1.0, g = 0.5, b = 0.0 },
    { r = 1.0, g = 1.0, b = 0.0 },
    { r = 0.0, g = 1.0, b = 0.0 },
    { r = 0.0, g = 1.0, b = 0.0 },
    { r = 0.0, g = 1.0, b = 0.0 },
    { r = 0.0, g = 1.0, b = 0.0 },
    { r = 0.0, g = 1.0, b = 0.0 },
};

l.largeBuffList = {};
l.largeDebuffList = {};

-- Saved variables
FocusFrameOptions = FocusFrameOptions or {};

local function TgFocusFrame_SlashCommand(msg)
    local cmd, var = strsplit(' ', msg or "")
    if cmd == "scale" and tonumber(var) then
        TgFocusFrame_SetScale(var);
    elseif cmd == "reset" then
        TgFocusFrame_Reset();
    elseif cmd == "lock" then
        FocusFrameOptions.lockpos = true;
    elseif cmd == "unlock" then
        FocusFrameOptions.lockpos = nil;
    elseif cmd == "hidewhendead" then
        TgFocusFrame_HideWhenDead(true);
    else
        TgFocusFrame_Help();
    end
end

SlashCmdList["FOCUSFRAME"] = TgFocusFrame_SlashCommand;
SLASH_FOCUSFRAME1 = "/focusframe";

function TgFocusFrame_Help()
    DEFAULT_CHAT_FRAME:AddMessage('TgFocusFrame usage:');
    DEFAULT_CHAT_FRAME:AddMessage('/focusframe scale <num> : Set scale (e.g. /focusframe scale 0.7).');
    DEFAULT_CHAT_FRAME:AddMessage('/focusframe reset : Reset position.');
    DEFAULT_CHAT_FRAME:AddMessage('/focusframe lock : Lock position.');
    DEFAULT_CHAT_FRAME:AddMessage('/focusframe unlock : Unlock position.');
    DEFAULT_CHAT_FRAME:AddMessage('/focusframe hidewhendead : Hide when focused enemy target is dead. [' .. ((FocusFrameOptions.hidewhendead and 'ON') or 'OFF') .. ']');
end

function TgFocusFrame_SetScale(scale)
    if InCombatLockdown() then
        DEFAULT_CHAT_FRAME:AddMessage('TgFocusFrame: You cannot change scale while in combat.');
        return;
    end

    scalenum = tonumber(scale);
    if scalenum and scalenum <= 10 then
        FocusFrameOptions.scale = scalenum;
        local os = TgFocusFrame:GetScale();
        local ox = TgFocusFrame:GetLeft();
        local oy = TgFocusFrame:GetTop();
        TgFocusFrame:SetScale(scale);
        TgFocusFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", ox * os / scale, oy * os / scale);
    else
        DEFAULT_CHAT_FRAME:AddMessage('Usage: /focusframe scale <num> : Set scale (e.g. /focusframe scale 0.7).');
    end
end

function TgFocusFrame_Reset()
    TgFocusFrame:SetPoint("TOPLEFT", UIParent, "CENTER", 0, 0);
end

function TgFocusFrame_HideWhenDead(toggle)
    if FocusFrameOptions.hidewhendead == nil then
        -- Default is ON
        FocusFrameOptions.hidewhendead = true;
    end
    if toggle then
        if InCombatLockdown() then
            DEFAULT_CHAT_FRAME:AddMessage('TgFocusFrame: You cannot toggle hidewhendead while in combat.');
            return;
        end
        if FocusFrameOptions.hidewhendead then
            FocusFrameOptions.hidewhendead = false;
            DEFAULT_CHAT_FRAME:AddMessage('TgFocusFrame: hidewhendead is now [OFF]. TgFocusFrame will be always shown.');
        else
            FocusFrameOptions.hidewhendead = true;
            DEFAULT_CHAT_FRAME:AddMessage('TgFocusFrame: hidewhendead is now [ON]. TgFocusFrame will be hide when enemy target is dead.');
        end
    end
    if FocusFrameOptions.hidewhendead then
        RegisterStateDriver(TgFocusFrame, "visibility", "[target=focus,noexists][target=focus,harm,dead]hide;show");
    else
        RegisterStateDriver(TgFocusFrame, "visibility", "[target=focus,noexists]hide;show");
    end
end

-- Borrowed from XPerl
function TgFocusFrame_BlizzFrameDisable(self)
    UnregisterUnitWatch(self) -- Should stop Archaeologist from re-showing target frame
    self:UnregisterAllEvents()
    self:Hide()
    -- Make it so it won't be visible, even if shown by another mod
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", -400, 500)

    local healthBar = getglobal(self:GetName() .. "HealthBar")
    if (healthBar) then
        healthBar:UnregisterAllEvents()
    end

    local manaBar = getglobal(self:GetName() .. "ManaBar")
    if (manaBar) then
        manaBar:UnregisterAllEvents()
    end
end

function TgFocusFrame_OnLoad(self)
    TgFocusFrame_BlizzFrameDisable(FocusFrame);
    self.statusCounter = 0;
    self.statusSign = -1;
    self.unitHPPercent = 1;

    self.buffStartX = 5;
    self.buffStartY = 32;
    self.buffSpacing = 3;

    TgFocusFrame_Update(self);
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("PLAYER_FOCUS_CHANGED");
    self:RegisterEvent("UNIT_HEALTH");
    self:RegisterEvent("UNIT_LEVEL");
    self:RegisterEvent("UNIT_FACTION");
    self:RegisterEvent("UNIT_CLASSIFICATION_CHANGED");
    self:RegisterEvent("UNIT_AURA");
    self:RegisterEvent("PLAYER_FLAGS_CHANGED");
    self:RegisterEvent("PARTY_MEMBERS_CHANGED");
    self:RegisterEvent("RAID_TARGET_UPDATE");
    self:RegisterEvent("VARIABLES_LOADED");

    local frameLevel = TgFocusFrameTextureFrame:GetFrameLevel();
    TgFocusFrameHealthBar:SetFrameLevel(frameLevel - 1);
    TgFocusFrameManaBar:SetFrameLevel(frameLevel - 1);
    TgFocusFrameSpellBar:SetFrameLevel(frameLevel - 1);

    local showmenu = function()
        ToggleDropDownMenu(1, nil, TgFocusFrameDropDown, "TgFocusFrame", 120, 10);
    end
    SecureUnitButton_OnLoad(self, "focus", showmenu);

    ClickCastFrames = ClickCastFrames or {};
    ClickCastFrames[self] = true;
end

function TgFocusFrame_Update(self)
    -- This check is here so the frame will hide when the focus goes away
    -- even if some of the functions below are hooked by addons.
    if (UnitExists("focus")) then
        TargetofTgFocus_Update(self);
        UnitFrame_Update(self);
        TgFocusFrame_CheckLevel(self);
        TgFocusFrame_CheckFaction(self);
        TgFocusFrame_CheckClassification(self);
        TgFocusFrame_CheckDead(self);
        if (UnitIsPartyLeader("focus")) then
            TgFocusLeaderIcon:Show();
        else
            TgFocusLeaderIcon:Hide();
        end
        FocusDebuffButton_Update(self);
        TgFocusPortrait:SetAlpha(1.0);
    end
end

function TgFocusFrame_OnEvent(self, event, ...)
    UnitFrame_OnEvent(self, event, ...);

    local arg1 = ...;
    if (event == "PLAYER_ENTERING_WORLD") then
        TgFocusFrame_Update(self);
    elseif (event == "PLAYER_FOCUS_CHANGED") then
        TgFocusFrame_Update(self);
        TgFocusFrame_UpdateRaidTargetIcon(self);
        CloseDropDownMenus();

        --		if ( UnitExists("focus") ) then
        --			if ( UnitIsEnemy("focus", "player") ) then
        --				PlaySound("igCreatureAggroSelect");
        --			elseif ( UnitIsFriend("player", "focus") ) then
        --				PlaySound("igCharacterNPCSelect");
        --			else
        --				PlaySound("igCreatureNeutralSelect");
        --			end
        --		end
    elseif (event == "UNIT_HEALTH") then
        if (arg1 == "focus") then
            TgFocusFrame_CheckDead(self);
        end
    elseif (event == "UNIT_LEVEL") then
        if (arg1 == "focus") then
            TgFocusFrame_CheckLevel(self);
        end
    elseif (event == "UNIT_FACTION") then
        if (arg1 == "focus" or arg1 == "player") then
            TgFocusFrame_CheckFaction(self);
            TgFocusFrame_CheckLevel(self);
        end
    elseif (event == "UNIT_CLASSIFICATION_CHANGED") then
        if (arg1 == "focus") then
            TgFocusFrame_CheckClassification(self);
        end
    elseif (event == "UNIT_AURA") then
        if (arg1 == "focus") then
            FocusDebuffButton_Update(self);
        end
    elseif (event == "PLAYER_FLAGS_CHANGED") then
        if (arg1 == "focus") then
            if (UnitIsPartyLeader("focus")) then
                TgFocusLeaderIcon:Show();
            else
                TgFocusLeaderIcon:Hide();
            end
        end
    elseif (event == "PARTY_MEMBERS_CHANGED") then
        TargetofTgFocus_Update(self);
        TgFocusFrame_CheckFaction(self);
    elseif (event == "RAID_TARGET_UPDATE") then
        TgFocusFrame_UpdateRaidTargetIcon(self);
    elseif (event == "VARIABLES_LOADED") then
        FocusFrameOptions.scale = FocusFrameOptions.scale or 1;
        TgFocusFrame_SetScale(FocusFrameOptions.scale);
        TgFocusFrame_HideWhenDead(false);
    end
end

function TgFocusFrame_OnHide(self)
    PlaySound("INTERFACESOUND_LOSTTARGETUNIT");
    CloseDropDownMenus();
end

function TgFocusFrame_CheckLevel(self)
    local targetLevel = UnitLevel("focus");

    if (UnitIsCorpse("focus")) then
        TgFocusLevelText:Hide();
        TgFocusHighLevelTexture:Show();
    elseif (targetLevel > 0) then
        -- Normal level target
        TgFocusLevelText:SetText(targetLevel);
        -- Color level number
        if (UnitCanAttack("player", "focus")) then
            local color = GetDifficultyColor(targetLevel);
            TgFocusLevelText:SetVertexColor(color.r, color.g, color.b);
        else
            TgFocusLevelText:SetVertexColor(1.0, 0.82, 0.0);
        end
        TgFocusLevelText:Show();
        TgFocusHighLevelTexture:Hide();
    else
        -- Focus is too high level to tell
        TgFocusLevelText:Hide();
        TgFocusHighLevelTexture:Show();
    end
end

function TgFocusFrame_CheckFaction(self)
    if (UnitPlayerControlled("focus")) then
        local r, g, b;
        if (UnitCanAttack("focus", "player")) then
            -- Hostile players are red
            if (not UnitCanAttack("player", "focus")) then
                r = 0.0;
                g = 0.0;
                b = 1.0;
            else
                r = l.FocusUnitReactionColor[2].r;
                g = l.FocusUnitReactionColor[2].g;
                b = l.FocusUnitReactionColor[2].b;
            end
        elseif (UnitCanAttack("player", "focus")) then
            -- Players we can attack but which are not hostile are yellow
            r = l.FocusUnitReactionColor[4].r;
            g = l.FocusUnitReactionColor[4].g;
            b = l.FocusUnitReactionColor[4].b;
        elseif (UnitIsPVP("focus") and not UnitIsPVPSanctuary("focus") and not UnitIsPVPSanctuary("player")) then
            -- Players we can assist but are PvP flagged are green
            r = l.FocusUnitReactionColor[6].r;
            g = l.FocusUnitReactionColor[6].g;
            b = l.FocusUnitReactionColor[6].b;
        else
            -- All other players are blue (the usual state on the "blue" server)
            r = 0.0;
            g = 0.0;
            b = 1.0;
        end
        TgFocusFrameNameBackground:SetVertexColor(r, g, b);
        TgFocusPortrait:SetVertexColor(1.0, 1.0, 1.0);
    elseif (UnitIsTapped("focus") and not UnitIsTappedByPlayer("focus")) then
        TgFocusFrameNameBackground:SetVertexColor(0.5, 0.5, 0.5);
        TgFocusPortrait:SetVertexColor(0.5, 0.5, 0.5);
    else
        local reaction = UnitReaction("focus", "player");
        if (reaction) then
            local r, g, b;
            r = l.FocusUnitReactionColor[reaction].r;
            g = l.FocusUnitReactionColor[reaction].g;
            b = l.FocusUnitReactionColor[reaction].b;
            TgFocusFrameNameBackground:SetVertexColor(r, g, b);
        else
            TgFocusFrameNameBackground:SetVertexColor(0, 0, 1.0);
        end
        TgFocusPortrait:SetVertexColor(1.0, 1.0, 1.0);
    end

    local factionGroup = UnitFactionGroup("focus");
    if (UnitIsPVPFreeForAll("focus")) then
        TgFocusPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
        TgFocusPVPIcon:Show();
    elseif (factionGroup and UnitIsPVP("focus")) then
        TgFocusPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-" .. factionGroup);
        TgFocusPVPIcon:Show();
    else
        TgFocusPVPIcon:Hide();
    end
end

function TgFocusFrame_CheckClassification(self)
    local classification = UnitClassification("focus");
    if (classification == "worldboss") then
        TgFocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
    elseif (classification == "rareelite") then
        TgFocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite");
    elseif (classification == "elite") then
        TgFocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
    elseif (classification == "rare") then
        TgFocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare");
    else
        TgFocusFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
    end
end

function TgFocusFrame_CheckDead(self)
    if ((MobHealthDB == nil) and (UnitHealth("focus") <= 0) and UnitIsConnected("focus")) then
        TgFocusDeadText:Show();
    else
        TgFocusDeadText:Hide();
    end
end

function TgFocusFrame_OnUpdate(self, elapsed)
    if (TargetofTgFocusFrame:IsShown() ~= UnitExists("focustarget")) then
        TargetofTgFocus_Update(self, elapsed);
    end
end

function FocusDebuffButton_Update(self)
    local button;
    local name, rank, icon, count, debuffType, duration, expirationTime;
    local buffCount;
    local numBuffs = 0;
    --	local largeBuffList = {};
    local playerIsFocus = UnitIsUnit("player", "focus");
    local cooldown;

    for i = 1, l.MAX_FOCUS_BUFFS do
        name, rank, icon, count, debuffType, duration, expirationTime = UnitBuff("focus", i);
        button = getglobal("TgFocusFrameBuff" .. i);
        if (not button) then
            if (not icon) then
                break;
            else
                button = CreateFrame("Button", "TgFocusFrameBuff" .. i, TgFocusFrame, "TgFocusBuffButtonTemplate");
            end
        end

        if (icon) then
            getglobal("TgFocusFrameBuff" .. i .. "Icon"):SetTexture(icon);
            buffCount = getglobal("TgFocusFrameBuff" .. i .. "Count");
            button:Show();
            if (count > 1) then
                buffCount:SetText(count);
                buffCount:Show();
            else
                buffCount:Hide();
            end

            -- Handle cooldowns
            cooldown = getglobal("TgFocusFrameBuff" .. i .. "Cooldown");
            if (duration) then
                if (duration > 0) then
                    cooldown:Show();
                    CooldownFrame_SetTimer(cooldown, expirationTime - duration, duration, 1);
                else
                    cooldown:Hide();
                end

                -- Set the buff to be big if the buff is cast by the player and the focus is not the player
                if (not playerIsFocus) then
                    l.largeBuffList[i] = 1;
                else
                    l.largeBuffList[i] = nil;
                end
            else
                cooldown:Hide();
            end

            button.id = i;
            numBuffs = numBuffs + 1;
            button:ClearAllPoints();
        else
            button:Hide();
        end
    end

    local debuffType, color;
    local debuffCount;
    local numDebuffs = 0;
    --	local largeDebuffList = {};
    for i = 1, l.MAX_FOCUS_DEBUFFS do
        local debuffBorder = getglobal("TgFocusFrameDebuff" .. i .. "Border");
        name, rank, icon, count, debuffType, duration, expirationTime = UnitDebuff("focus", i);
        button = getglobal("TgFocusFrameDebuff" .. i);
        if (not button) then
            if (not icon) then
                break;
            else
                button = CreateFrame("Button", "TgFocusFrameDebuff" .. i, TgFocusFrame, "TgFocusDebuffButtonTemplate");
                debuffBorder = getglobal("TgFocusFrameDebuff" .. i .. "Border");
            end
        end
        if (icon) then
            getglobal("TgFocusFrameDebuff" .. i .. "Icon"):SetTexture(icon);
            debuffCount = getglobal("TgFocusFrameDebuff" .. i .. "Count");
            if (debuffType) then
                color = DebuffTypeColor[debuffType];
            else
                color = DebuffTypeColor["none"];
            end
            if (count > 1) then
                debuffCount:SetText(count);
                debuffCount:Show();
            else
                debuffCount:Hide();
            end

            -- Handle cooldowns
            cooldown = getglobal("TgFocusFrameDebuff" .. i .. "Cooldown");
            if (duration) then
                if (duration > 0) then
                    cooldown:Show();
                    CooldownFrame_SetTimer(cooldown, expirationTime - duration, duration, 1);
                else
                    cooldown:Hide();
                end
                -- Set the buff to be big if the buff is cast by the player
                l.largeDebuffList[i] = 1;
            else
                cooldown:Hide();
                l.largeDebuffList[i] = nil;
            end

            debuffBorder:SetVertexColor(color.r, color.g, color.b);
            button:Show();
            numDebuffs = numDebuffs + 1;
            button:ClearAllPoints();
        else
            button:Hide();
        end
        button.id = i;
    end

    -- Figure out general information that affects buff sizing and positioning
    local numFirstRowBuffs;
    local buffSize = l.LARGE_BUFF_SIZE;
    local buffFrameSize = l.LARGE_BUFF_FRAME_SIZE;
    if (TargetofTgFocusFrame:IsShown()) then
        numFirstRowBuffs = 5;
    else
        numFirstRowBuffs = 6;
    end
    if (getn(l.largeBuffList) > 0 or getn(l.largeDebuffList) > 0) then
        numFirstRowBuffs = numFirstRowBuffs - 1;
    end
    -- Shrink the buffs if there are too many of them
    if ((numBuffs >= numFirstRowBuffs) or (numDebuffs >= numFirstRowBuffs)) then
        buffSize = l.SMALL_BUFF_SIZE;
        buffFrameSize = l.SMALL_BUFF_FRAME_SIZE;
    end

    -- Reset number of buff rows
    TgFocusFrame.buffRows = 0;
    -- Position buffs
    local size;
    local previousWasPlayerCast;
    local offset;
    for i = 1, numBuffs do
        if (l.largeBuffList[i]) then
            size = l.LARGE_BUFF_SIZE;
            offset = 3;
            previousWasPlayerCast = 1;
        else
            size = buffSize;
            offset = 3;
            if (previousWasPlayerCast) then
                offset = 6;
                previousWasPlayerCast = nil;
            end
        end
        TgFocusFrame_UpdateBuffAnchor("TgFocusFrameBuff", i, numFirstRowBuffs, numDebuffs, size, offset, TargetofTgFocusFrame:IsShown());
    end
    -- Position debuffs
    previousWasPlayerCast = nil;
    for i = 1, numDebuffs do
        if (l.largeDebuffList[i]) then
            size = l.LARGE_BUFF_SIZE;
            offset = 4;
            previousWasPlayerCast = 1;
        else
            size = buffSize;
            offset = 4;
            if (previousWasPlayerCast) then
                offset = 6;
                previousWasPlayerCast = nil;
            end
        end
        TgFocusFrame_UpdateDebuffAnchor("TgFocusFrameDebuff", i, numFirstRowBuffs, numBuffs, size, offset, TargetofTgFocusFrame:IsShown());
    end

    -- update the spell bar position
    Focus_Spellbar_AdjustPosition(self);
end

function TgFocusFrame_UpdateBuffAnchor(buffName, index, numFirstRowBuffs, numDebuffs, buffSize, offset, hasTargetofTgFocus)
    local buff = getglobal(buffName .. index);

    if (index == 1) then
        if (UnitIsFriend("player", "focus")) then
            buff:SetPoint("TOPLEFT", TgFocusFrame, "BOTTOMLEFT", TgFocusFrame.buffStartX, TgFocusFrame.buffStartY);
        else
            if (numDebuffs > 0) then
                buff:SetPoint("TOPLEFT", TgFocusFrameDebuffs, "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
            else
                buff:SetPoint("TOPLEFT", TgFocusFrame, "BOTTOMLEFT", TgFocusFrame.buffStartX, TgFocusFrame.buffStartY);
            end
        end
        TgFocusFrameBuffs:SetPoint("TOPLEFT", buff, "TOPLEFT", 0, 0);
        TgFocusFrameBuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif (index == (numFirstRowBuffs + 1)) then
        buff:SetPoint("TOPLEFT", getglobal(buffName .. 1), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameBuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif (hasTargetofTgFocus and index == (2 * numFirstRowBuffs + 1)) then
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (numFirstRowBuffs + 1)), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameBuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif ((index > numFirstRowBuffs) and (mod(index + (l.TARGET_BUFFS_PER_ROW - numFirstRowBuffs), l.TARGET_BUFFS_PER_ROW) == 1) and not hasTargetofTgFocus) then
        -- Make a new row, have to take the number of buffs in the first row into account
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (index - l.TARGET_BUFFS_PER_ROW)), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameBuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    else
        -- Just anchor to previous
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (index - 1)), "TOPRIGHT", offset, 0);
    end

    -- Resize
    buff:SetWidth(buffSize);
    buff:SetHeight(buffSize);
end

function TgFocusFrame_UpdateDebuffAnchor(buffName, index, numFirstRowBuffs, numBuffs, buffSize, offset, hasTargetofTgFocus)
    local buff = getglobal(buffName .. index);

    if (index == 1) then
        if (UnitIsFriend("player", "focus") and (numBuffs > 0)) then
            buff:SetPoint("TOPLEFT", TgFocusFrameBuffs, "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        else
            buff:SetPoint("TOPLEFT", TgFocusFrame, "BOTTOMLEFT", TgFocusFrame.buffStartX, TgFocusFrame.buffStartY);
        end
        TgFocusFrameDebuffs:SetPoint("TOPLEFT", buff, "TOPLEFT", 0, 0);
        TgFocusFrameDebuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif (index == (numFirstRowBuffs + 1)) then
        buff:SetPoint("TOPLEFT", getglobal(buffName .. 1), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameDebuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif (hasTargetofTgFocus and index == (2 * numFirstRowBuffs + 1)) then
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (numFirstRowBuffs + 1)), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameDebuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    elseif ((index > numFirstRowBuffs) and (mod(index + (l.TARGET_DEBUFFS_PER_ROW - numFirstRowBuffs), l.TARGET_DEBUFFS_PER_ROW) == 1) and not hasTargetofTgFocus) then
        -- Make a new row
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (index - l.TARGET_DEBUFFS_PER_ROW)), "BOTTOMLEFT", 0, -TgFocusFrame.buffSpacing);
        TgFocusFrameDebuffs:SetPoint("BOTTOMLEFT", buff, "BOTTOMLEFT", 0, 0);
        TgFocusFrame.buffRows = TgFocusFrame.buffRows + 1;
    else
        -- Just anchor to previous
        buff:SetPoint("TOPLEFT", getglobal(buffName .. (index - 1)), "TOPRIGHT", offset, 0);
    end

    -- Resize
    buff:SetWidth(buffSize);
    buff:SetHeight(buffSize);
    local debuffFrame = getglobal(buffName .. index .. "Border");
    debuffFrame:SetWidth(buffSize + 2);
    debuffFrame:SetHeight(buffSize + 2);
end

function TgFocusFrame_HealthUpdate(self, elapsed, unit)
    if (UnitIsPlayer(unit)) then
        if ((self.unitHPPercent > 0) and (self.unitHPPercent <= 0.2)) then
            local alpha = 255;
            local counter = self.statusCounter + elapsed;
            local sign = self.statusSign;

            if (counter > 0.5) then
                sign = -sign;
                self.statusSign = sign;
            end
            counter = mod(counter, 0.5);
            self.statusCounter = counter;

            if (sign == 1) then
                alpha = (127 + (counter * 256)) / 255;
            else
                alpha = (255 - (counter * 256)) / 255;
            end
            TgFocusPortrait:SetAlpha(alpha);
        end
    end
end

function FocusHealthCheck(self)
    if (UnitIsPlayer("focus")) then
        local unitHPMin, unitHPMax, unitCurrHP;
        unitHPMin, unitHPMax = self:GetMinMaxValues();
        unitCurrHP = self:GetValue();
        self:GetParent().unitHPPercent = unitCurrHP / unitHPMax;
        if (UnitIsDead("focus")) then
            TgFocusPortrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
        elseif (UnitIsGhost("focus")) then
            TgFocusPortrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
        elseif ((self:GetParent().unitHPPercent > 0) and (self:GetParent().unitHPPercent <= 0.2)) then
            TgFocusPortrait:SetVertexColor(1.0, 0.0, 0.0);
        else
            TgFocusPortrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
        end
    end
end

function TgFocusFrameDropDown_OnLoad(self)
    UIDropDownMenu_Initialize(self, TgFocusFrameDropDown_Initialize, "MENU");
end

function TgFocusFrameDropDown_Initialize(self)
    local menu;
    local name;
    local id = nil;
    if (UnitIsUnit("focus", "player")) then
        menu = "SELF";
    elseif (UnitIsUnit("focus", "pet")) then
        menu = "PET";
    elseif (UnitIsPlayer("focus")) then
        id = UnitInRaid("focus");
        if (id) then
            menu = "RAID_PLAYER";
        elseif (UnitInParty("focus")) then
            menu = "PARTY";
        else
            menu = "PLAYER";
        end
    else
        menu = "RAID_TARGET_ICON";
        name = RAID_TARGET_ICON;
    end
    if (menu) then
        UnitPopup_ShowMenu(TgFocusFrameDropDown, menu, "focus", name, id);
    end
end



-- Raid target icon function
function TgFocusFrame_UpdateRaidTargetIcon(self)
    local index = GetRaidTargetIndex("focus");
    if (index) then
        SetRaidTargetIconTexture(TgFocusRaidTargetIcon, index);
        TgFocusRaidTargetIcon:Show();
    else
        TgFocusRaidTargetIcon:Hide();
    end
end


function TargetofTgFocus_OnLoad(self)
    UnitFrame_Initialize(self, "focustarget", TargetofTgFocusName, TargetofTgFocusPortrait,
        TargetofTgFocusHealthBar, TargetofTgFocusHealthBarText,
        TargetofTgFocusManaBar, TargetofTgFocusFrameManaBarText);
    SetTextStatusBarTextZeroText(TargetofTgFocusHealthBar, TEXT(DEAD));
    self:RegisterEvent("UNIT_AURA");

    SecureUnitButton_OnLoad(self, "focustarget");
    RegisterUnitWatch(TargetofTgFocusFrame);
    ClickCastFrames = ClickCastFrames or {};
    ClickCastFrames[self] = true;
end

function TargetofTgFocus_OnHide(self)
    FocusDebuffButton_Update(self);
end

function TargetofTgFocus_Update(self)
    if (TargetofTgFocusFrame:IsShown()) then
        UnitFrame_Update(self);
        TargetofTgFocus_CheckDead(self);
        TargetofTgFocusHealthCheck(self);
        RefreshBuffs(TargetofTgFocusFrame, 0, "focustarget");
    end
end

function TargetofTgFocus_CheckDead(self)
    if ((UnitHealth("focustarget") <= 0) and UnitIsConnected("focustarget")) then
        TargetofTgFocusBackground:SetAlpha(0.9);
        TargetofTgFocusDeadText:Show();
    else
        TargetofTgFocusBackground:SetAlpha(1);
        TargetofTgFocusDeadText:Hide();
    end
end

function TargetofTgFocusHealthCheck(self)
    if (UnitIsPlayer("focustarget")) then
        local unitHPMin, unitHPMax, unitCurrHP;
        unitHPMin, unitHPMax = TargetofTgFocusHealthBar:GetMinMaxValues();
        unitCurrHP = TargetofTgFocusHealthBar:GetValue();
        TargetofTgFocusFrame.unitHPPercent = unitCurrHP / unitHPMax;
        if (UnitIsDead("focustarget")) then
            TargetofTgFocusPortrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
        elseif (UnitIsGhost("focustarget")) then
            TargetofTgFocusPortrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
        elseif ((TargetofTgFocusFrame.unitHPPercent > 0) and (TargetofTgFocusFrame.unitHPPercent <= 0.2)) then
            TargetofTgFocusPortrait:SetVertexColor(1.0, 0.0, 0.0);
        else
            TargetofTgFocusPortrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
        end
    end
end


function SetFocusSpellbarAspect(self)
    local frameText = getglobal(TgFocusFrameSpellBar:GetName() .. "Text");
    if (frameText) then
        frameText:SetTextHeight(10);
        frameText:ClearAllPoints();
        frameText:SetPoint("TOP", TgFocusFrameSpellBar, "TOP", 0, 4);
    end

    local frameBorder = getglobal(TgFocusFrameSpellBar:GetName() .. "Border");
    if (frameBorder) then
        frameBorder:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small");
        frameBorder:SetWidth(197);
        frameBorder:SetHeight(49);
        frameBorder:ClearAllPoints();
        frameBorder:SetPoint("TOP", TgFocusFrameSpellBar, "TOP", 0, 20);
    end

    local frameFlash = getglobal(TgFocusFrameSpellBar:GetName() .. "Flash");
    if (frameFlash) then
        frameFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small");
        frameFlash:SetWidth(197);
        frameFlash:SetHeight(49);
        frameFlash:ClearAllPoints();
        frameFlash:SetPoint("TOP", TgFocusFrameSpellBar, "TOP", 0, 20);
    end
end

function Focus_Spellbar_OnLoad(self)
    self:RegisterEvent("PLAYER_FOCUS_CHANGED");
    self:RegisterEvent("CVAR_UPDATE");
    self:RegisterEvent("VARIABLES_LOADED");

    CastingBarFrame_OnLoad(self, "focus", false);

    local barIcon = getglobal(self:GetName() .. "Icon");
    barIcon:Show();

    --The target casting bar has less room for text than most, so shorten it
    getglobal(self:GetName() .. "Text"):SetWidth(150)
    -- check to see if the castbar should be shown
    if (GetCVar("ShowTargetCastbar") == "0") then
        self.showCastbar = false;
    end
    SetFocusSpellbarAspect(self);
end

function Focus_Spellbar_OnEvent(self, event, ...)
    local arg1 = ...

    --	Check for target specific events
    if ((event == "VARIABLES_LOADED") or (event == "CVAR_UPDATE") and (arg1 == "SHOW_TARGET_CASTBAR")) then
        if (GetCVar("ShowTargetCastbar") == "0") then
            self.showCastbar = false;
        else
            self.showCastbar = true;
        end

        if (not self.showCastbar) then
            self:Hide();
        elseif (self.casting or self.channeling) then
            self:Show();
        end
        return;
    elseif (event == "PLAYER_FOCUS_CHANGED") then
        -- check if the new target is casting a spell
        local nameChannel = UnitChannelInfo(self.unit);
        local nameSpell = UnitCastingInfo(self.unit);
        if (nameChannel) then
            event = "UNIT_SPELLCAST_CHANNEL_START";
            arg1 = "focus";
        elseif (nameSpell) then
            event = "UNIT_SPELLCAST_START";
            arg1 = "focus";
        else
            self.casting = nil;
            self.channeling = nil;
            self:SetMinMaxValues(0, 0);
            self:SetValue(0);
            self:Hide();
            return;
        end
        -- The position depends on the classification of the target
        Focus_Spellbar_AdjustPosition(self);
    end

    CastingBarFrame_OnEvent(self, event, arg1, select(2, ...));
end

function Focus_Spellbar_AdjustPosition(self)
    local yPos = 5;
    if (TgFocusFrame.buffRows and TgFocusFrame.buffRows <= 2) then
        yPos = 38;
    elseif (TgFocusFrame.buffRows) then
        yPos = 19 * TgFocusFrame.buffRows;
    end
    if (TargetofTgFocusFrame:IsShown()) then
        if (yPos <= 25) then
            yPos = yPos + 25;
        end
    else
        yPos = yPos - 5;
        local classification = UnitClassification("focus");
        if ((yPos < 17) and ((classification == "worldboss") or (classification == "rareelite") or (classification == "elite") or (classification == "rare"))) then
            yPos = 17;
        end
    end
    TgFocusFrameSpellBar:SetPoint("BOTTOM", "TgFocusFrame", "BOTTOM", -15, -yPos);
end

function TgFocusFrameHealthBarText_UpdateTextString(textStatusBar)
    if (not textStatusBar) then
        textStatusBar = self;
    end
    local string = TgFocusFrameHealthBarText;
    local value = textStatusBar:GetValue();
    local valueMin, valueMax = textStatusBar:GetMinMaxValues();
    if (valueMax > 0) then
        if (MobHealthDB) then
            -- No longer use default health bar text functions.
            TgFocusFrameHealthBar.TextString = nil;

            if (not UnitIsPlayer("focus") and not UnitIsUnit("focus", "pet")) then
                local focusName, focusLevel = UnitName("focus"), UnitLevel("focus");
                if (focusName == nil or focusLevel == nil) then
                    return;
                end
                local ppp = MobHealth_PPP(focusName .. ":" .. focusLevel);
                local curHP = math.floor(value * ppp + 0.5);
                local maxHP = math.floor(100 * ppp + 0.5);
                if (ppp and ppp ~= 0) then
                    string:SetText(curHP .. " / " .. maxHP);
                else
                    string:SetText(value .. "%");
                end
            else
                string:SetText(value .. " / " .. valueMax);
            end
            string:Show();
        end
    end
end

function TgFocusFrameHealthBar_OnValueChanged(self, value)
    TgFocusFrameHealthBarText_UpdateTextString(self);
    HealthBar_OnValueChanged(self, value);
end

function TgFocusFrame_OnDragStart(self)
    if (not FocusFrameOptions.lockpos) then
        self:GetParent():StartMoving();
        self.isMoving = true;
    end
end

function TgFocusFrame_OnDragStop(self)
    self:GetParent():StopMovingOrSizing();
    self.isMoving = false;
end

function TgFocusFrame_OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    if (not FocusFrameOptions.lockpos) then
        GameTooltip:SetText(FOCUSFRAME_DRAG, nil, nil, nil, nil, 1);
    else
        GameTooltip:SetText(FOCUSFRAME_DRAG_LOCKED, nil, nil, nil, nil, 1);
    end
end