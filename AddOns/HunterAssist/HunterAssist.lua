HunterAssist = BLibrary("BEvent");
HunterAssist.H = BLibrary("BHook");
local HunterAssist = HunterAssist;
local HunterAssist_Enabled = false;
--local HunterAssist_460a7b5508d73d75379f9512c18b8ff7 = nil;

local groupmate = bit.bor(
    COMBATLOG_OBJECT_AFFILIATION_MINE,
    COMBATLOG_OBJECT_AFFILIATION_PARTY,
    COMBATLOG_OBJECT_REACTION_FRIENDLY,
    COMBATLOG_OBJECT_CONTROL_PLAYER,
    COMBATLOG_OBJECT_CONTROL_NPC,
    COMBATLOG_OBJECT_TYPE_PLAYER,
    COMBATLOG_OBJECT_TYPE_PET,
    COMBATLOG_OBJECT_TYPE_GUARDIAN,
    COMBATLOG_OBJECT_TYPE_OBJECT
);

local enable_tracking = true;
local tracking = {};
local orig_tracking_id = nil;
local track_talent;
local creature = {
    [HUNTERASSIST_BEAST] = "Beast";
    [HUNTERASSIST_HUMANOID] = "Humanoid";
    [HUNTERASSIST_UNDEAD] = "Undead";
    [HUNTERASSIST_GIANT] = "Giant";
    [HUNTERASSIST_ELEMENTAL] = "Elemental";
    [HUNTERASSIST_DEMON] = "Demon";
    [HUNTERASSIST_DRAGONKIN] = "Dragonkin";
};

local ignor_tracking_buff = {
    ["player"] = { 5384, 13481 },
    ["target"] = { 13481 }
};

local aspectSpellID = {
    [1] = 13163,
    [2] = 13165,
    [3] = 61846,
    [4] = 5118,
    [5] = 13159,
    [6] = 13161,
    [7] = 20043,
    [8] = 34074,
};
local aspectInfo = {};
local aspectNum = 0;

local misDirect = GetSpellInfo(34477);
local misDirectPlayer;
local enablemisDirect = false;

local distanceSpell = {
    [1] = 2974,
    [2] = 19503,
    [3] = 2764,
    [4] = 75,
};
local DISTANCE_MAX_RANGE = 0;
local spellDistance = {};

local function HideHunterAssistCastBar()
    if not HunterAssistCasteBar:IsVisible() then
        HunterAssistCasteBar:Hide();
    end
    if HunterAssistCasteBar:IsShown() then
        local min, max = HunterAssistCasteBar:GetMinMaxValues();
        HunterAssistCasteBar:SetValue(max);
        HunterAssistCasteBar:SetStatusBarColor(0.0, 1.0, 0.0);
        HunterAssistCasteBarSpark:Hide();
        HunterAssistCasteBarFlash:SetAlpha(0.0);
        HunterAssistCasteBarFlash:Show();
        HunterAssistCasteBar.showCastBar = nil;
        HunterAssistCasteBar.flashCastBar = 1;
        HunterAssistCasteBar.hideCastBar = 1;
    end
end

local function ShowHunterAssistCastBar(spell)
    local min, max = GetTime();
    if (spell and spell == HUNTERASSIST_AUTO or spell == HUNTERASSIST_AIMED) then
        max = min + UnitRangedDamage("player");
        HunterAssistCasteBar:SetStatusBarColor(1.0, 0.7, 0.0);
        HunterAssistCasteBar:SetMinMaxValues(min, max);
        HunterAssistCasteBar:SetValue(min);
        HunterAssistCasteBar:SetAlpha(1.0);
        HunterAssistCasteBar.showCastBar = 1;
        HunterAssistCasteBar.hideCastBar = nil;
        HunterAssistCasteBarTextLeft:SetText(HUNTERASSIST_AUTO);
        HunterAssistCasteBarSpark:Show();
        HunterAssistCasteBar:Show();
    end
end

local function UnitIsA(unitFlags, flagType)
    if (bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_AFFILIATION_MASK) > 0 and
            bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_REACTION_MASK) > 0 and
            bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_CONTROL_MASK) > 0 and
            bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_TYPE_MASK) > 0) or
            bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_SPECIAL_MASK) > 0 then
        return true
    end
    return false
end

local function delayTracking(trackingID)
    if (trackingID > 0 and HunterAssist:GetCurTrackingID() ~= tracingID and InCombatLockdown() and not HunterAssist:UnitHasIgnoreBuff()) then
        SetTracking(trackingID);
    end
end

local function HunterAssist_ReTracking()
    if (enable_tracking and track_talent and orig_tracking_id and orig_tracking_id ~= HunterAssist:GetCurTrackingID() and not InCombatLockdown()) then
        if (HunterAssist:UnitHasIgnoreBuff() or not HunterAssist:CanTracking()) then
            BigFoot_DelayCall(HunterAssist_ReTracking, 0.5);
        else
            SetTracking(orig_tracking_id);
        end
        orig_tracking_id = nil;
    end
end

local function HunterAssistAspect_Hook(switch)
    if (switch) then
        HunterAssist.H:Hook("GetNumShapeshiftForms", HunterAssist_GetNumShapeshiftForms);
        HunterAssist.H:Hook("GetShapeshiftFormInfo", HunterAssist_GetShapeshiftFormInfo);
        HunterAssist.H:Hook("GetShapeshiftForm", HunterAssist_GetShapeshiftForm);
        HunterAssist.H:Hook("GetShapeshiftFormCooldown", HunterAssist_GetShapeshiftFormCooldown);
    else
        HunterAssist.H:Unhook("GetNumShapeshiftForms");
        HunterAssist.H:Unhook("GetShapeshiftFormInfo");
        HunterAssist.H:Unhook("GetShapeshiftForm");
        HunterAssist.H:Unhook("GetShapeshiftFormCooldown");
    end
end

local function HunterAssistAspect_Event(switch)
    if (switch) then
        HunterAssist:RegisterEvent("UNIT_AURA");
        HunterAssist:RegisterEvent("LEARNED_SPELL_IN_TAB");
        HunterAssist:RegisterEvent("ACTIONBAR_UPDATE_USABLE");
        HunterAssist:RegisterEvent("UPDATE_BINDINGS");
        HunterAssist:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
    else
        HunterAssist:UnregisterEvent("UNIT_AURA");
        HunterAssist:UnregisterEvent("LEARNED_SPELL_IN_TAB");
        HunterAssist:UnregisterEvent("ACTIONBAR_UPDATE_USABLE");
        HunterAssist:UnregisterEvent("UPDATE_BINDINGS");
        HunterAssist:UnregisterEvent("ACTIONBAR_UPDATE_COOLDOWN");
    end
end

function HunterAssist:AntiDaze(guid)
    local buffID = self:IsBuffActive(HUNTERASSIST_ASPECT_ASPECT_PACK);
    if (guid == UnitGUID("player")) then
        buffID = self:IsBuffActive(HUNTERASSIST_ASPECT_CHEETAH);
    end
    if (buffID and type(buffID) == "number" and buffID >= 0) then
        CancelUnitBuff("player", buffID);
    end
end

function HunterAssist:CheckSpell(spell)
    local i, val = 1, nil;
    local spellName = GetSpellName(i, BOOKTYPE_SPELL);
    while (spellName) do
        if (spellName == spell) then
            val = i;
        end
        i = i + 1;
        spellName = GetSpellName(i, BOOKTYPE_SPELL);
    end
    return val;
end

function HunterAssist:GetInfoFromID(buttonID)
    if (aspectInfo[buttonID]) then
        return aspectInfo[buttonID].spellIcon, aspectInfo[buttonID].spellName;
    else
        return nil, nil;
    end
end

function HunterAssist:IsBuffActive(name)
    local i = 1;
    local buffName = UnitBuff("player", i);
    while (buffName) do
        if (buffName == name) then
            return i;
        end
        i = i + 1;
        buffName = UnitBuff("player", i);
    end
    return false;
end

function HunterAssist:SetDistanceBarText(tex, dis)
    local r, g, b = 0, 0, 0;
    if (dis >= 46) then
        b = 1;
    elseif (dis >= 35) then
        g = 1;
    elseif (dis >= 25) then
        r = 1;
        g = 1;
    elseif (dis >= 5) then
        r = 1;
        g = 0.5;
    else
        r = 1;
    end
    HunterAssist.dFrame.bar.tex:SetText(tostring(tex));
    HunterAssist.dFrame.bar:SetVertexColor(r, g, b);
end

function HunterAssist:Yell(msg)
    SendChatMessage(msg, "yell");
end

function HunterAssist:GetCurTrackingID()
    for id = 1, GetNumTrackingTypes() do
        local name, texture, active, category = GetTrackingInfo(id);
        if (active) then
            return id;
        end
    end
    return false;
end

function HunterAssist:GetDistanceText()
    if (not HunterAssistDistanceFrame) then
        HunterAssist:CreateDistanceFrame();
    end
    local texVal, minDis, maxDis = nil, 0, 100;
    local out = false;
    if (UnitExists("target")) then
        if (UnitCanAttack("player", "target")) then
            if (spellDistance[2974][2] and IsSpellInRange(spellDistance[2974][2], "target") == 1) then
                maxDis = 5;
                minDis = 0;
            elseif (CheckInteractDistance("target", 3) == 1) then
                maxDis = 9.9;
                minDis = 5;
            elseif (CheckInteractDistance("target", 2) == 1) then
                maxDis = 11.11;
                minDis = 9.9;
            elseif (spellDistance[19503][2] and IsSpellInRange(spellDistance[19503][2], "target") == 1) then
                maxDis = spellDistance[19503][1];
                minDis = 11.11;
            elseif (spellDistance[2764][2] and IsSpellInRange(spellDistance[2764][2], "target") == 1) then
                maxDis = spellDistance[2764][1];
                if (spellDistance[19503][2]) then
                    minDis = spellDistance[19503][1];
                elseif (CheckInteractDistance("target", 2) ~= 1) then
                    minDis = 11.11;
                end
            elseif (spellDistance[75][2] and IsSpellInRange(spellDistance[75][2], "target") == 1) then
                maxDis = spellDistance[75][1];
                minDis = spellDistance[2764][1];
            else
                texVal = HUNTERASSIST_OOR;
            end
            if (not texVal) then
                texVal = string.format("%sm - %sm", tostring(minDis), tostring(maxDis));
            end
            HunterAssistDistanceFrame:SetAlpha(1.0);
        else
            texVal = HUNTERASSIST_FRIEND;
            HunterAssistDistanceFrame:SetAlpha(0.5);
        end
    else
        texVal = HUNTERASSIST_NO_TARGET;
        HunterAssistDistanceFrame:SetAlpha(0.5);
    end
    return texVal, minDis, maxDis;
end

function HunterAssist:CanTracking()
    local spellName = GetSpellInfo(19883);
    local start, duration, enabled = GetSpellCooldown(spellName);
    if (duration == 0) then
        return true;
    else
        return false;
    end
end

function HunterAssist:UnitHasIgnoreBuff()
    local spellName, debuffName;
    local i = 1;
    if (ignor_tracking_buff.player) then
        local buffName = UnitAura("player", i, "HELPFUL");
        while (buffName) do
            for k, v in pairs(ignor_tracking_buff.player) do
                spellName = GetSpellInfo(v);
                if (buffName == spellName) then
                    return true;
                end
            end
            i = i + 1;
            buffName = UnitAura("player", i, "HELPFUL");
        end
    end
    if (ignor_tracking_buff.target) then
        i = 1;
        debuffName = UnitAura("target", i, "HARMFUL|PLAYER");
        while (debuffName) do
            for k, v in ipairs(ignor_tracking_buff.target) do
                spellName = GetSpellInfo(v);
                if (debuffName == spellName) then
                    return true;
                end
            end
            i = i + 1;
            debuffName = UnitAura("target", i, "HARMFUL|PLAYER");
        end
    end
    return false;
end

function HunterAssist:CastTracking()
    if (not track_talent) then
        return
    end
    local creatureType = UnitCreatureType("target");
    local trackingID = 0;
    if (creatureType and creature[creatureType]) then
        if (UnitCanAttack("player", "target") and not UnitIsDeadOrGhost("target")) then
            trackingID = tracking[creature[creatureType]] or 0;
        end
    end
    if (trackingID > 0 and self:GetCurTrackingID() ~= trackingID) then
        if (not self:UnitHasIgnoreBuff() and self:CanTracking()) then
            SetTracking(trackingID);
        else
            BigFoot_DelayCall(delayTracking, 1.5, trackingID);
        end
    end
end

function HunterAssist:OnSkillChange()
    self:UpdateTrackingID();
end

function HunterAssist:OnTalentChange()
    self:UpdateTrackTalent();
end

function HunterAssist:AspectButtonUpdate()
    local numForms = GetNumShapeshiftForms();
    local texture, name, isActive, isCastable;
    local button, icon, cooldown, ssb;
    local start, duration, enable;
    ShapeshiftBar_Update();
    for i = 1, NUM_SHAPESHIFT_SLOTS do
        button = getglobal("HuterAssistAspectButton" .. i);
        icon = getglobal("HuterAssistAspectButton" .. i .. "Icon");
        if (i <= numForms) then
            texture, name, isActive, isCastable = GetShapeshiftFormInfo(i);
            icon:SetTexture(texture);
            cooldown = getglobal("HuterAssistAspectButton" .. i .. "Cooldown");
            if (texture) then
                cooldown:Show();
            else
                cooldown:Hide();
            end
            self:UpdateAspectCooldown();
            if (isActive) then
                button:SetChecked(1);
            else
                button:SetChecked(0);
            end
            if (isCastable) then
                icon:SetVertexColor(1.0, 1.0, 1.0);
            else
                icon:SetVertexColor(0.4, 0.4, 0.4);
            end
            button:SetAttribute("spell", name);
            button:SetNormalTexture(nil);
            button:Show();
        else
            button:Hide();
        end
    end
end

function HunterAssist:UpdateAspectInfo()
    local name, rank, icon;
    local num = 0;
    for k, v in ipairs(aspectSpellID) do
        name, rank, icon = GetSpellInfo(v);
        if (name and self:CheckSpell(name)) then
            num = num + 1;
            aspectInfo[num] = aspectInfo[k] or {};
            aspectInfo[num]["spellName"] = name;
            aspectInfo[num]["spellIcon"] = icon;
            aspectInfo[num]["spellID"] = v;
        end
    end
    aspectNum = num;
end

function HunterAssist:UpdateAspectCooldown()
    local numForms = GetNumShapeshiftForms();
    local start, duration, enable, cooldown;
    for i = 1, numForms do
        cooldown = getglobal("HuterAssistAspectButton" .. i .. "Cooldown");
        start, duration, enable = GetShapeshiftFormCooldown(i);
        if (cooldown and start and duration) then
            CooldownFrame_SetTimer(cooldown, start, duration, enable);
        end
    end
end

function HunterAssist:UpdateTrackTalent()
    local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 1);
    if (rank and rank >= 1) then
        track_talent = true;
    else
        track_talent = false;
    end
end

function HunterAssist:UpdateTrackingID()
    for id = 1, GetNumTrackingTypes() do
        local name, texture, active, category = GetTrackingInfo(id);
        if (name == GetSpellInfo(1494)) then
            tracking["Beast"] = id;
        elseif (name == GetSpellInfo(19883)) then
            tracking["Humanoid"] = id;
        elseif (name == GetSpellInfo(19884)) then
            tracking["Undead"] = id;
        elseif (name == GetSpellInfo(19882)) then
            tracking["Giant"] = id;
        elseif (name == GetSpellInfo(19880)) then
            tracking["Elemental"] = id;
        elseif (name == GetSpellInfo(19878)) then
            tracking["Demon"] = id;
        elseif (name == GetSpellInfo(19879)) then
            tracking["Dragonkin"] = id;
        end
    end
end

function HunterAssist:UpdateDistanceSpell()
    for k, v in ipairs(distanceSpell) do
        local name, _, _, _, _, _, _, _, maxRange = GetSpellInfo(v);
        local bookID = self:CheckSpell(name);
        if (bookID) then
            DISTANCE_MAX_RANGE = maxRange;
        end
        spellDistance[v] = { maxRange, bookID };
    end
end

function HunterAssist:CreateAspectBar()
    if (getglobal("HuterAssistAspectButton1")) then
        return;
    end
    local button;
    for i = 1, NUM_SHAPESHIFT_SLOTS, 1 do
        button = CreateFrame("CheckButton", "HuterAssistAspectButton" .. i, ShapeshiftBarFrame, "SecureActionButtonTemplate, ActionButtonTemplate");
        button:SetHeight(30);
        button:SetWidth(30);
        button:RegisterForClicks("AnyUp");
        button:SetPoint("CENTER", getglobal("ShapeshiftButton" .. i), "CENTER", 0, 0);
        button:SetNormalTexture(nil);
        button:SetAttribute("type", "spell");
        local ssb = getglobal("ShapeshiftButton" .. i);
        setglobal("OldShapshiftButton" .. i, ssb);
        setglobal("ShapeshiftButton" .. i, button);
        button:SetFrameLevel(ssb:GetFrameLevel() + 2);
        button:SetScript("OnEnter", function(this)
            if (GetCVar("UberTooltips") == "1") then
                GameTooltip_SetDefaultAnchor(GameTooltip, this);
            else
                GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
            end
            local spellName = aspectInfo[i]["spellName"];
            local bookID = self:CheckSpell(spellName);
            GameTooltip:SetSpell(bookID, BOOKTYPE_SPELL); GameTooltip:Show();
        end);
        button:SetScript("OnLeave", function(this)
            GameTooltip:Hide();
        end);
        button:Hide();
        ssb:Hide();
    end
    ShapeshiftBarFrame:Show();
end

function HunterAssist:CreateDistanceFrame()
    if (HunterAssistDistanceFrame) then
        return;
    end
    local frame = CreateFrame("Button", "HunterAssistDistanceFrame", UIParent);
    frame:SetWidth(125);
    frame:SetHeight(20);
    frame:SetMovable(true);
    frame:SetPoint("TOP", "UIParent", "BOTTOM", 0, 237);
    frame:SetClampedToScreen(true);
    frame.bar = frame:CreateTexture("HunterAssistDistanceFrameBarTexture", "BACKGROUND");
    frame.bar:SetWidth(119);
    frame.bar:SetHeight(14);
    frame.bar:SetPoint("CENTER", frame, "CENTER", 0, 0);
    frame.bar:SetTexture("Interface\\TargetingFrame\\UI-StatusBar");
    frame.bar:SetVertexColor(1, 0.85, 0);
    frame.bar.border = frame:CreateTexture("HunterAssistDistanceFrameBarBorder", "ARTWORK");
    frame.bar.border:SetTexture("Interface\\Tooltips\\UI-StatusBar-Border");
    frame.bar.border:SetAllPoints(frame);
    frame.bar.tex = frame:CreateFontString("HunterAssistDistanceFrameBarText", "OVERLAY", "GameFontHighlight");
    frame:SetWidth(125);
    frame:SetHeight(20);
    frame.bar.tex:SetPoint("CENTER", frame, "CENTER", 0, 1);
    frame.bar.tex:SetJustifyH("CENTER");
    frame.bar.tex:SetJustifyV("CENTER");
    frame:SetScript("OnMouseDown", function(self, button)
        if (IsShiftKeyDown() and button == "LeftButton") then
            self:StartMoving();
            self.ismoving = true;
        end
    end);
    frame:SetScript("OnMouseUp", function(self, button)
        if (self.ismoving) then
            self:StopMovingOrSizing();
            self.ismoving = false;
        end
    end);
    frame:SetScript("OnEnter", function(self)
        GameTooltip_SetDefaultAnchor(GameTooltip, self);
        GameTooltip:SetText(HUNTERASSIST_NAME);
        GameTooltip:AddLine(HUNTERASSIST_RANGE_TOOLTIP);
        GameTooltip:Show();
    end);
    frame:SetScript("OnLeave", function(self)
        GameTooltip:Hide();
    end);
    RegisterForSaveFrame(frame);
    self.dFrame = frame;
end

function HunterAssist:PLAYER_TARGET_CHANGED()
    self:UpdateDistanceSpell();
end

function HunterAssist:UNIT_SPELLCAST_SENT(unit, spell, _, player)
    if (unit == "player" and spell == misDirect) then
        misDirectPlayer = player;
    end
end

function HunterAssist:UNIT_SPELLCAST_SUCCEEDED(unit, spell)
    if (HunterAssist_Enabled and unit == "player") then
        ShowHunterAssistCastBar(spell);
    end
    if (enablemisDirect) then
        if (unit == "player" and spell == misDirect and IsInInstance()) then
            self:Yell(string.gsub(MISDIRECT_PATTERN, "$player", misDirectPlayer));
        end
    end
end

function HunterAssist:UNIT_AURA(unit)
    if (unit == "player") then
        self:AspectButtonUpdate();
    end
end

function HunterAssist:LEARNED_SPELL_IN_TAB()
    self:UpdateAspectInfo();
    self:AspectButtonUpdate();
end

function HunterAssist:ACTIONBAR_UPDATE_USABLE()
    self:AspectButtonUpdate();
end

function HunterAssist:ACTIONBAR_UPDATE_COOLDOWN()
    self:UpdateAspectCooldown();
end

function HunterAssist:UPDATE_BINDINGS()
    local numForms = GetNumShapeshiftForms();
    ClearOverrideBindings(ShapeshiftBarFrame);
    for i = 1, numForms do
        local button = getglobal("HuterAssistAspectButton" .. i);
        local key1, key2 = GetBindingKey("SHAPESHIFTBUTTON" .. i);
        if (key1) then
            SetOverrideBindingClick(ShapeshiftBarFrame, true, key1, "HuterAssistAspectButton" .. i);
        end
        if (key2) then
            SetOverrideBindingClick(ShapeshiftBarFrame, true, key2, "HuterAssistAspectButton" .. i);
        end
    end
end

function HunterAssist:SPELL_AURA_APPLIED(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
    if (UnitIsA(destFlags, groupmate)) then
        local spellName, spellSchool, auraType, amount = select(2, ...);
        if (auraType == "DEBUFF" and spellName == HUNTERASSIST_ASPECT_DAZED) then
            self:AntiDaze(destGUID);
        end
    end
end

function HunterAssist:SPELL_AURA_APPLIED_DOSE(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)
    self:SPELL_AURA_APPLIED(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...);
end

function HunterAssist:STOP_AUTOREPEAT_SPELL()
    HideHunterAssistCastBar();
end

function HunterAssist:PLAYER_REGEN_ENABLED()
    HideHunterAssistCastBar();
    HunterAssist_ReTracking();
end

function HunterAssist:PLAYER_REGEN_DISABLED()
    if HunterAssistCasteBarMove:IsVisible() then
        HunterAssistCasteBarMove:Hide();
    end
    orig_tracking_id = self:GetCurTrackingID();
    if (enable_tracking) then
        self:CastTracking();
    end
    PetActionBar_UpdatePositionValues();
    PetActionBarFrame.slideTimer = nil
    -- PetActionBarFrame:SetPoint("TOPLEFT", PetActionBarFrame:GetParent(), "BOTTOMLEFT", PETACTIONBAR_XPOS, PETACTIONBAR_YPOS);
end

function HunterAssist:PLAYER_LOGIN()
    self:STOP_AUTOREPEAT_SPELL();
end

function HunterAssist:PLAYER_ENTERING_WORLD()
    self:STOP_AUTOREPEAT_SPELL();
end

function ShowPetActionBar_Hook(doNotSlide)
    local point, relativeTo, relativePoint, xOfs, yOfs = PetActionBarFrame:GetPoint(1)
    -- print("ShowPetActionBar_Hook point: "..tostring(point)..", relativeTo: "..tostring(relativeTo:GetName()..", relativePoint: "..tostring(relativePoint)))
    -- print("ShowPetActionBar_Hook xOfs: "..tostring(xOfs)..", yOfs: "..tostring(yOfs))

    PetActionBarFrame:ClearAllPoints();
    PetActionBarFrame:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs);
end

function HunterAssistCasteBar_OnLoad(self)
    RegisterForSaveFrame(self);
    self:SetMinMaxValues(0, 1);
    self:SetValue(1);
end

function HunterAssistCasteBar_OnUpdate(self)
    if (not HunterAssist_Enabled) then
        return;
    end
    local min, max = HunterAssistCasteBar:GetMinMaxValues();
    if self.showCastBar then
        local uptime = GetTime();
        if uptime > max then
            uptime = max;
        end
        HunterAssistCasteBarTextRight:SetText(format("%0.1f", max - uptime));
        HunterAssistCasteBar:SetValue(uptime);
        HunterAssistCasteBarFlash:Hide();
        local step = ((uptime - min) / (max - min)) * 195;
        if step < 0 then
            step = 0;
        end
        HunterAssistCasteBarSpark:SetPoint("CENTER", HunterAssistCasteBar, "LEFT", step, 0);
    elseif self.flashCastBar then
        local alpha = HunterAssistCasteBarFlash:GetAlpha() + CASTING_BAR_FLASH_STEP;
        if alpha < 1 then
            HunterAssistCasteBarFlash:SetAlpha(alpha);
        else
            HunterAssistCasteBarFlash:SetAlpha(1.0);
            self.flashCastBar = nil;
        end
    elseif self.hideCastBar then
        local alpha = self:GetAlpha() - CASTING_BAR_ALPHA_STEP;
        if alpha > 0 then
            self:SetAlpha(alpha);
        else
            self.hideCastBar = nil;
            self:Hide();
        end
    end
end

function HunterAssistCasteBar_AjustPosition()
    if HunterAssistCasteBarMove:IsVisible() then
        HunterAssistCasteBarMove:Hide()
        HunterAssistCasteBar:Hide()
    else
        HunterAssistCasteBarMove:Show()
        HunterAssistCasteBar:Show()
        HunterAssistCasteBar:SetAlpha(1)
        HideUIPanel(ModManagementFrame);
    end
end

function HunterAssist_GetNumShapeshiftForms(origfunc)
    local num = aspectNum or 0; num = (num > 0 and num) or origfunc();
    return num;
end

function HunterAssist_GetShapeshiftFormInfo(origfunc, buttonId)
    local texture, name, isActive, isCastable; texture, name = HunterAssist:GetInfoFromID(buttonId);
    if (name) then
        isActive = HunterAssist:IsBuffActive(name);
        isCastable = true;
    else
        texture, name, isActive, isCastable = origfunc(buttonId);
    end
    return texture, name, isActive, isCastable;
end

function HunterAssist_GetShapeshiftForm(origfunc, var)
    local texture, name, isActive, isCastable;
    for i = 1, NUM_SHAPESHIFT_SLOTS, 1 do
        texture, name, isActive, isCastable = GetShapeshiftFormInfo(i);
        if (isActive) then
            return i;
        end
    end
end

function HunterAssist_GetShapeshiftFormCooldown(origfunc, buttonId)
    local texture, name = HunterAssist:GetInfoFromID(buttonId);
    local bookID = HunterAssist:CheckSpell(name);
    if (bookID > -1) then
        return GetSpellCooldown(bookID, BOOKTYPE_SPELL);
    end
    return origfunc(buttonId);
end

function HunterAssistAspect_Toggle(switch)
    HunterAssist:CreateAspectBar();
    HunterAssist:UpdateAspectInfo();
    HunterAssistAspect_Hook(switch);
    HunterAssistAspect_Event(switch);
    HunterAssist:AspectButtonUpdate();
end

function HunterAssistMisdirect_Toggle(switch)
    if (switch) then
        HunterAssist:RegisterEvent("UNIT_SPELLCAST_SENT");
        HunterAssist:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
        enablemisDirect = true;
    else
        HunterAssist:UnregisterEvent("UNIT_SPELLCAST_SENT");
        enablemisDirect = false;
    end
end

function HunterAssistDistance_Toggle(switch)
    HunterAssist:CreateDistanceFrame();
    if (switch) then
        HunterAssist:RegisterEvent("PLAYER_TARGET_CHANGED");
        HunterAssistDistanceFrame:SetScript("OnUpdate", function(self)
            local tex, minDis, maxDis = HunterAssist:GetDistanceText();
            HunterAssist:SetDistanceBarText(tex, maxDis);
        end);
        HunterAssistDistanceFrame:Show();
    else
        HunterAssist:UnregisterEvent("PLAYER_TARGET_CHANGED");
        HunterAssistDistanceFrame:SetScript("OnUpdate", function() end);
        HunterAssistDistanceFrame:Hide();
    end
end

function HunterAssistTracking_Toogle(switch)
    HunterAssist:UpdateTrackingID();
    HunterAssist:UpdateTrackTalent();
    if (switch) then
        enable_tracking = true;
        HunterAssist:RegisterEvent("CHAT_MSG_SKILL", "OnSkillChange");
        HunterAssist:RegisterEvent("CHARACTER_POINTS_CHANGED", "OnTalentChange");
        HunterAssist:RegisterEvent("PLAYER_REGEN_DISABLED");
        HunterAssist:RegisterEvent("PLAYER_REGEN_ENABLED");
    else
        enable_tracking = false;
        HunterAssist:UnregisterEvent("CHAT_MSG_SKILL");
        HunterAssist:UnregisterEvent("CHARACTER_POINTS_CHANGED");
    end
end

function HunterAssistDaze_Toggle(enabled)
    if (enabled) then
        HunterAssist:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED");
        HunterAssist:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED_DOSE");
    else
        HunterAssist:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED");
        HunterAssist:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED_DOSE");
    end
end

function HunterAssistBar_Toggle(enabled)
    if (enabled) then
        HunterAssist:RegisterEvent("STOP_AUTOREPEAT_SPELL");
        HunterAssist:RegisterEvent("PLAYER_REGEN_DISABLED");
        HunterAssist:RegisterEvent("PLAYER_REGEN_ENABLED");
        HunterAssist:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
        HunterAssist:RegisterEvent("PLAYER_LOGIN");
        HunterAssist:RegisterEvent("PLAYER_ENTERING_WORLD");
--        hooksecurefunc("ShowPetActionBar", ShowPetActionBar_Hook)
        HunterAssist_Enabled = true;
    else
        HunterAssist:UnregisterEvent("STOP_AUTOREPEAT_SPELL");
        HunterAssist:UnregisterEvent("PLAYER_LOGIN");
        HunterAssist:UnregisterEvent("PLAYER_ENTERING_WORLD");
        HideHunterAssistCastBar();
        HunterAssist_Enabled = false;
    end
end

function HunterAssist_Toggle(enabled)
    HunterAssistBar_Toggle(enabled);
    HunterAssistDaze_Toggle(enabled);
    HunterAssistTracking_Toogle(enabled);
end