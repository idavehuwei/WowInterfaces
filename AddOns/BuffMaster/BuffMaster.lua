BuffMaster_e2834e0a7893ec83a826b8dd5c13163d = 8;

if (GetLocale() == "zhCN") then
    BUFFMASTER_TITLE = { "增益魔法", "zengyimofa" };
    BUFFMASTER_SHOW_TIMELEFT = "显示增益魔法的详细秒数";
    BUFFMASTER_SHOW_PARTY_BUFF = "显示队伍成员的增益魔法";
    BUFFMASTER_SHOW_TARGET_BUFF = "显示目标的完整的增益魔法";
elseif (GetLocale() == "zhTW") then
    BUFFMASTER_TITLE = { "增益魔法", "zengyimofa" };
    BUFFMASTER_SHOW_TIMELEFT = "顯示增益魔法的剩餘時間";
    BUFFMASTER_SHOW_PARTY_BUFF = "顯示隊伍成員的增益魔法";
    BUFFMASTER_SHOW_TARGET_BUFF = "顯示目標的完整的增益魔法";
else
    BUFFMASTER_TITLE = "Buff Master";
    BUFFMASTER_SHOW_TIMELEFT = "Show time left of buff";
    BUFFMASTER_SHOW_PARTY_BUFF = "Show party members' buffs";
    BUFFMASTER_SHOW_TARGET_BUFF = "Show all buffs on target";
end

local BuffMaster_7f5efba01c95612f5e29b811158e740f = {
    ["pet"] = getglobal("PetFrame"),
    ["party1"] = PartyMemberFrame1,
    ["party2"] = PartyMemberFrame2,
    ["party3"] = PartyMemberFrame3,
    ["party4"] = PartyMemberFrame4,
};

local BuffMaster_e2102cef7e78b885d7075bb10028e39f = {
    [1] = getglobal("PetFrame"),
    [2] = PartyMemberFrame1PetFrame,
    [3] = PartyMemberFrame2PetFrame,
    [4] = PartyMemberFrame3PetFrame,
    [5] = PartyMemberFrame4PetFrame,
};

local BuffMaster_133104d326d458eda34112321a734dac = nil;
local BuffMaster_00d06be9b74a81db92d9a9da1a57b650 = nil;
local BuffMaster_7738894b0053175295e6fef354231fea = nil;
local BuffMaster_cc3105e145f6df0060a4d4779ae40c0e = nil;

local function BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button, isPet)
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT");
    if (isPet) then
        GameTooltip:SetUnitAura("pet", button:GetID(), "HELPFUL");
    else
        GameTooltip:SetUnitAura("party" .. button:GetParent():GetID(), button:GetID(), "HELPFUL");
    end
end

local function CreatePartyBuffFrmae(unit, parent)
    if (not unit or not parent) then
        return;
    end

    local fname = "BuffMaster" .. unit .. "BuffFrame";
    local frame = CreateFrame("Frame", fname, parent); frame:SetID(parent:GetID());
    frame:SetHeight(20);
    frame:SetWidth(150);
    if (unit == "pet") then
        frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 47, -42);
    else
        frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 47, -32);
    end

    local lastbutton, bname;
    for i = 1, 16, 1 do
        bname = fname .. "Buff" .. i;
        local button = CreateFrame("Frame", bname, frame, "PartyBuffFrameTemplate");
        button:SetID(i);
        if (i == 1) then
            button:SetPoint("TOPLEFT");
        else
            button:SetPoint("LEFT", lastbutton, "RIGHT", 2, 0);
        end
        if (unit == "pet") then
            button:SetScript("OnEnter", function() BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button, 1); end);
        else
            button:SetScript("OnEnter", function() BuffMaster_c31924e73a2e21b7c72a19121ea9200d(button); end);
        end

        lastbutton = button;
    end
end

local function CreatePartyDebuff(unit, parent)
    if (not parent) then return; end

    for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d, 1 do
        local name = parent:GetName() .. "Debuff" .. i;
        local button = CreateFrame("Frame", name, parent, "PartyBuffFrameTemplate");
        local lastbutton = getglobal(parent:GetName() .. "Debuff" .. (i - 1));
        button:SetPoint("LEFT", lastbutton, "RIGHT", 2, 0); button:SetID(i);
    end
end

local function CreateTargetDebuff()
    local lastbutton;
    for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d, 1 do
        local name = "TargetofTargetFrameDebuff" .. i;
        local button = CreateFrame("Frame", name, TargetofTargetFrame, "TargetofTargetDebuffFrameTemplate");
        button:SetID(i);
        if (i == 5) then
            button:SetPoint("TOPLEFT", TargetofTargetFrameDebuff1, "BOTTOMLEFT", 0, -1);
        else
            button:SetPoint("LEFT", lastbutton, "RIGHT", 1, 0);
        end

        lastbutton = button;
    end
end

local function CreatePetDebuff(parent)
    local lastbutton;
    for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d, 1 do
        local name = parent:GetName() .. "Debuff" .. i;
        local button = CreateFrame("Frame", name, parent, "PartyBuffFrameTemplate");
        button:SetID(i);
        lastbutton = getglobal(parent:GetName() .. "Debuff" .. (i - 1));
        button:SetPoint("LEFT", lastbutton, "RIGHT", 2, 0);
    end
end

local function CreateRaidDebuff(pulloutButton)
    local bName = pulloutButton:GetName();
    if (strfind(bName, "^RaidPullout")) then
        if (getglobal(pulloutButton:GetName() .. "Debuff" .. 5)) then
            return;
        end
        local lastbutton;
        for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d, 1 do
            local name = pulloutButton:GetName() .. "Debuff" .. i;
            local button = CreateFrame("Button", name, pulloutButton, "PartyBuffButtonTemplate");
            button:SetID(i);
        end
        for j = 1, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d, 1 do
            local button = getglobal(pulloutButton:GetName() .. "Debuff" .. j);
            local border = getglobal(button:GetName() .. "Border");
            button:SetHeight(10);
            button:SetWidth(10);
            border:SetHeight(10.5);
            border:SetWidth(10.5);
            button:ClearAllPoints();
            if (j == 1) then
                button:SetPoint("TOPLEFT", pulloutButton, "TOPRIGHT", 8, 4);
            elseif (j == 5) then
                button:SetPoint("TOPLEFT", getglobal(pulloutButton:GetName() .. "Debuff" .. 1), "TOPRIGHT", 1, 0);
            else
                button:SetPoint("TOPLEFT", lastbutton, "BOTTOMLEFT", 0, -1);
            end
            lastbutton = button;
        end
    end
end

local function BuffMaster_17107aa3a9294eaac1b70bf7d4e141f8(BuffMaster_5e57c2750895232501d674704d8ef219)
    local BuffMaster_a22192947cbcf5f27a4eaf500379d03d, BuffMaster_9a992620b1ab448fb232dcdc06401e99;
    BuffMaster_a22192947cbcf5f27a4eaf500379d03d = math.floor(BuffMaster_5e57c2750895232501d674704d8ef219 / 60);
    BuffMaster_9a992620b1ab448fb232dcdc06401e99 = math.floor(BuffMaster_5e57c2750895232501d674704d8ef219 - BuffMaster_a22192947cbcf5f27a4eaf500379d03d * 60);
    return string.format("%d:%02d", BuffMaster_a22192947cbcf5f27a4eaf500379d03d, BuffMaster_9a992620b1ab448fb232dcdc06401e99);
end

function BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe()
    if (BuffMaster_00d06be9b74a81db92d9a9da1a57b650) then
        PartyMemberBuffTooltip:Hide();
    end
end

local BuffMaster_Hooker = BLibrary("BHook");
local BuffMaster_Eventer = BLibrary("BEvent");

BuffMaster_Eventer:Init {
    name = "BuffMaster", func = function()
        for BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56 in pairs(BuffMaster_7f5efba01c95612f5e29b811158e740f) do
            CreatePartyBuffFrmae(BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56);
            CreatePartyDebuff(BuffMaster_63a9ce6f1eeac72ef41293b7d0303335, BuffMaster_8d0644c92128c1ff68223fd74ba63b56);
        end
        for BuffMaster_e914904fab9d05d3f54d52bfc31a0f3f, BuffMaster_8d0644c92128c1ff68223fd74ba63b56 in ipairs(BuffMaster_e2102cef7e78b885d7075bb10028e39f) do
            CreatePetDebuff(BuffMaster_8d0644c92128c1ff68223fd74ba63b56);
        end
        local debuff1 = getglobal("PetFrameDebuff1");
        debuff1:ClearAllPoints();
        debuff1:SetPoint("BOTTOMLEFT", parent, "BOTTOMRIGHT", 18, 15);
        TargetofTargetFrameDebuff3:ClearAllPoints();
        TargetofTargetFrameDebuff3:SetPoint("LEFT", TargetofTargetFrameDebuff2, "RIGHT", 1, 0);
        PartyMemberFrame1:ClearAllPoints();
        PartyMemberFrame1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -138);
        CreateTargetDebuff();
        BuffMaster_OnLoad();
    end
};

function BuffMaster_OnLoad()
    ModManagement_RegisterMod("BuffMaster", "Interface\\Icons\\Spell_Nature_BloodLust", BUFFMASTER_TITLE, "", nil);
    ModManagement_RegisterCheckBox("BuffMaster", BUFFMASTER_SHOW_TIMELEFT, nil, "BuffMasterShowTimeLeft", 1, function(BuffMaster_7739b813d90aed43ab9d0eb84ec1c1ae)
        if (BuffMaster_7739b813d90aed43ab9d0eb84ec1c1ae == 1) then
            BuffMaster_7738894b0053175295e6fef354231fea = true;
            if (not BuffMaster_cc3105e145f6df0060a4d4779ae40c0e) then
                hooksecurefunc("AuraButton_UpdateDuration", BuffMaster_1a92d5dc80e48e09f7d29aaaab46094b);
                hooksecurefunc("AuraButton_Update", BuffMaster_81244f624fe0b105f47a78834d1c8775);
                hooksecurefunc("TempEnchantButton_OnUpdate", BuffMaster_cfd39af31951c0ec4dc60d7b4dd5feb4);
                hooksecurefunc("RefreshBuffs", BuffMaster_d688be4f66f383156a44a06b3d729c9a);
                BuffMaster_cc3105e145f6df0060a4d4779ae40c0e = true;
            end
        else
            BuffMaster_7738894b0053175295e6fef354231fea = nil;
        end
    end);
    ModManagement_RegisterCheckBox("BuffMaster", BUFFMASTER_SHOW_PARTY_BUFF, nil, "EnablePartyBuffer", 1, function(BuffMaster_7739b813d90aed43ab9d0eb84ec1c1ae)
        if (BuffMaster_7739b813d90aed43ab9d0eb84ec1c1ae == 1) then
            BuffMaster_Eventer:RegisterEvent("PARTY_MEMBERS_CHANGED", BufferMasterPartyBuffFrame_OnEvent);
            BuffMaster_Eventer:RegisterEvent("UNIT_AURA", BufferMasterPartyBuffFrame_OnEvent);
            BuffMasterparty1BuffFrame:Show();
            BuffMasterparty2BuffFrame:Show();
            BuffMasterparty3BuffFrame:Show();
            BuffMasterparty4BuffFrame:Show();
            for i = 1, 4, 1 do
                local button = getglobal("PartyMemberFrame" .. i .. "Debuff1");
                local parent = getglobal("PartyMemberFrame" .. i);
                button:ClearAllPoints();
                parent:RegisterAnchorFrame(button, 1, "TOPLEFT", "TOPRIGHT", -4, -14, 0);
                if (not BuffMaster_133104d326d458eda34112321a734dac) then
                    parent:HookScript("OnEnter", BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe);
                end
            end
            if (not BuffMaster_133104d326d458eda34112321a734dac) then
                PetFrame:HookScript("OnEnter", BuffMaster_4903ba6fc20fb685cdeed62d86bf1ebe);
            end

            BuffMaster_133104d326d458eda34112321a734dac = true;
            BuffMaster_00d06be9b74a81db92d9a9da1a57b650 = true;
            BufferMasterPartyBuffFrame_RefreshAll();
        else
            BuffMaster_Eventer:UnregisterEvent("PARTY_MEMBERS_CHANGED");
            BuffMaster_Eventer:UnregisterEvent("UNIT_AURA");
            BuffMasterparty1BuffFrame:Hide();
            BuffMasterparty2BuffFrame:Hide();
            BuffMasterparty3BuffFrame:Hide();
            BuffMasterparty4BuffFrame:Hide();
            for i = 1, 4, 1 do
                local button = getglobal("PartyMemberFrame" .. i .. "Debuff1");
                local parent = getglobal("PartyMemberFrame" .. i);
                button:ClearAllPoints();
                button:SetPoint("TOPLEFT", parent, "TOPLEFT", 48, -32);
                parent:UnregisterAnchorFrame(button);
            end
            BuffMaster_00d06be9b74a81db92d9a9da1a57b650 = nil;
        end
    end);
end

function BufferMasterPartyBuffFrame_OnEvent(BuffMaster_d0708241b607c9a9dd1953c812fadfb7, BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c)
    local BuffMaster_8983c60d66c8593ec7165ea9dbedb584;
    if (BuffMaster_d0708241b607c9a9dd1953c812fadfb7 == "PARTY_MEMBERS_CHANGED") then
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party1");
        if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name1 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name1 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584;
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party1", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party2");
        if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name2 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name2 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584;
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party2", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party3");
        if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name3 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name3 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584;
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party3", "BuffMasterparty1BuffFrame");
        end
        BuffMaster_8983c60d66c8593ec7165ea9dbedb584 = UnitName("party4");
        if (BuffMaster_8983c60d66c8593ec7165ea9dbedb584 and BuffMaster_Eventer.name4 ~= BuffMaster_8983c60d66c8593ec7165ea9dbedb584) then
            BuffMaster_Eventer.name4 = BuffMaster_8983c60d66c8593ec7165ea9dbedb584;
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party4", "BuffMasterparty1BuffFrame");
        end
    elseif (BuffMaster_d0708241b607c9a9dd1953c812fadfb7 == "UNIT_AURA") then
        if (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "pet") then
            BuffMaster_a7a5d1c62680ce174d03162c66977383("pet", "BuffMasterpetBuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party1") then
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party1", "BuffMasterparty1BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party2") then
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party2", "BuffMasterparty2BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party3") then
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party3", "BuffMasterparty3BuffFrame");
        elseif (BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c == "party4") then
            BuffMaster_a7a5d1c62680ce174d03162c66977383("party4", "BuffMasterparty4BuffFrame");
        end
    end
end

function BufferMasterPartyBuffFrame_RefreshAll()
    BuffMaster_a7a5d1c62680ce174d03162c66977383("pet", "BuffMasterpetBuffFrame");
    BuffMaster_a7a5d1c62680ce174d03162c66977383("party1", "BuffMasterparty1BuffFrame");
    BuffMaster_a7a5d1c62680ce174d03162c66977383("party2", "BuffMasterparty2BuffFrame");
    BuffMaster_a7a5d1c62680ce174d03162c66977383("party3", "BuffMasterparty3BuffFrame");
    BuffMaster_a7a5d1c62680ce174d03162c66977383("party4", "BuffMasterparty4BuffFrame");
end

function BuffMaster_a7a5d1c62680ce174d03162c66977383(BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c, BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a)
    local name, rank, icon;
    for i = 1, MAX_PARTY_TOOLTIP_BUFFS do
        name, rank, icon = UnitAura(BuffMaster_fd724fd3c5e25aaf3b4226e1dae5257c, i, "HELPFUL");
        if (name) then
            getglobal(BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i .. "Icon"):SetTexture(icon);
            getglobal(BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i):Show();
        else
            getglobal(BuffMaster_411b8aa6d5954c6020f0b9c9e80e847a .. "Buff" .. i):Hide();
        end
    end
end

function BuffMaster_d688be4f66f383156a44a06b3d729c9a(button, showBuffs, unit, numbuffs)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end

    CreateRaidDebuff(button);
    local buttonName = button:GetName();
    local name, rank, icon, debuffType, debuffStack, debuffColor, unitStatus, statusColor, duration, expirationTime, ph;
    local debuffTotal = 0;

    button.hasDispellable = nil;

    if (not numbuffs or numbuffs <= BuffMaster_e2834e0a7893ec83a826b8dd5c13163d) then
        debuffTotal = button.debuffTotal;
    end

    for i = 5, BuffMaster_e2834e0a7893ec83a826b8dd5c13163d do
        local debuffBorder = getglobal(buttonName .. "Debuff" .. i .. "Border");
        local debuffIcon = getglobal(buttonName .. "Debuff" .. i .. "Icon");
        local coolDown = getglobal(buttonName .. "Debuff" .. i .. "Cooldown");
        if (debuffBorder) then
            if (unit == "party" .. i) then
                unitStatus = getglobal(buttonName .. "Status");
            end
            if (showBuffs == 1) then
                local filter;
                if (GetCVarBool("showCastableBuffs")) then
                    filter = "RAID";
                end
                name, rank, icon, ph, ph, duration, expirationTime = UnitBuff(unit, i, filter); debuffBorder:Show();
            elseif (showBuffs == 0) then
                name, rank, icon, debuffStack, debuffType, duration, expirationTime = UnitDebuff(unit, i);
                debuffBorder:Show();
            else
                local filter;
                if (GetCVarBool("showDispelDebuffs")) then
                    filter = "RAID";
                end
                name, rank, icon, debuffStack, debuffType, duration, expirationTime = UnitDebuff(unit, i, filter);
                debuffBorder:Show();
            end
            if (icon) then
                debuffIcon:SetTexture(icon);
                if (debuffType) then
                    debuffColor = DebuffTypeColor[debuffType];
                    statusColor = DebuffTypeColor[debuffType];
                    button.hasDispellable = 1;
                    debuffTotal = debuffTotal + 1;
                else
                    debuffColor = DebuffTypeColor["none"];
                end
                debuffBorder:SetVertexColor(debuffColor.r, debuffColor.g, debuffColor.b);
                if (coolDown) then
                    CooldownFrame_SetTimer(coolDown, expirationTime - duration, duration, 1);
                end
                getglobal(buttonName .. "Debuff" .. i):Show();
            else
                getglobal(buttonName .. "Debuff" .. i):Hide();
            end
        end
        button.debuffTotal = debuffTotal;
        if (button.numDebuffs) then
            if (debuffTotal >= button.numDebuffs) then
                button.debuffCountdown = 30;
            end
        end
        if (unitStatus and statusColor) then
            unitStatus:SetVertexColor(statusColor.r, statusColor.g, statusColor.b);
        end
    end
end

function BuffMaster_1a92d5dc80e48e09f7d29aaaab46094b(buffButton, timeLeft)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end

    local duration = getglobal(buffButton:GetName() .. "Duration");

    if (timeLeft) then
        duration:SetText(BuffMaster_17107aa3a9294eaac1b70bf7d4e141f8(timeLeft));
        if (timeLeft < BUFF_WARNING_TIME) then
            duration:SetVertexColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
        elseif (timeLeft < BUFF_DURATION_WARNING_TIME) then
            duration:SetVertexColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
        else
            duration:SetVertexColor(0.0, 1.0, 0.0);
        end
        duration:Show();
    else
        duration:Hide();
    end
end

function BuffMaster_cfd39af31951c0ec4dc60d7b4dd5feb4(self, elapsed)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end

    local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();

    if (not hasMainHandEnchant and not hasOffHandEnchant) then
        TempEnchant1:Hide();
        TempEnchant1Duration:Hide();
        TempEnchant2:Hide();
        TempEnchant2Duration:Hide();
        BuffFrame:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPRIGHT", 0, 0);
        return;
    end

    local enchantButton;
    local textureName;
    local buffAlphaValue;
    local enchantIndex = 0;

    if (hasOffHandEnchant) then
        enchantIndex = enchantIndex + 1;
        textureName = GetInventoryItemTexture("player", 17);
        TempEnchant1:SetID(17);
        TempEnchant1Icon:SetTexture(textureName);
        TempEnchant1:Show();

        if (offHandCharges > 0) then
            TempEnchant1Count:SetText("|cff00ff00" .. offHandCharges .. "|r");
            TempEnchant1Count:Show();
        else
            TempEnchant1Count:Hide();
        end

        if (offHandExpiration) then
            offHandExpiration = offHandExpiration / 1000;
        end

        AuraButton_UpdateDuration(TempEnchant1, offHandExpiration);
        if (offHandExpiration and offHandExpiration < BUFF_WARNING_TIME) then
            TempEnchant1:SetAlpha(BuffFrame.BuffAlphaValue);
        else
            TempEnchant1:SetAlpha(1.0);
        end
    end
    if (hasMainHandEnchant) then
        enchantIndex = enchantIndex + 1;
        enchantButton = getglobal("TempEnchant" .. enchantIndex);
        enchantCount = getglobal("TempEnchant" .. enchantIndex .. "Count");
        textureName = GetInventoryItemTexture("player", 16);
        enchantButton:SetID(16);
        getglobal(enchantButton:GetName() .. "Icon"):SetTexture(textureName);
        enchantButton:Show();

        if (mainHandCharges > 0) then
            enchantCount:SetText("|cff00ff00" .. mainHandCharges .. "|r");
            enchantCount:Show();
        else
            enchantCount:Hide();
        end

        if (mainHandExpiration) then
            mainHandExpiration = mainHandExpiration / 1000;
        end

        AuraButton_UpdateDuration(enchantButton, mainHandExpiration);
        if (mainHandExpiration and mainHandExpiration < BUFF_WARNING_TIME) then
            enchantButton:SetAlpha(BuffFrame.BuffAlphaValue);
        else
            enchantButton:SetAlpha(1.0);
        end
    end

    for i = enchantIndex + 1, 2 do
        getglobal("TempEnchant" .. i):Hide();
        getglobal("TempEnchant" .. i .. "Duration"):Hide();
    end

    TemporaryEnchantFrame:SetWidth(enchantIndex * 32);
    BuffFrame:SetPoint("TOPRIGHT", "TemporaryEnchantFrame", "TOPLEFT", -5, 0);
end

function BuffMaster_81244f624fe0b105f47a78834d1c8775(buttonName, index, filter)
    if (not BuffMaster_7738894b0053175295e6fef354231fea) then return; end

    local buffName = buttonName .. index;
    local buff = getglobal(buffName);
    local buffDuration = getglobal(buffName .. "Duration");
    local unit = PlayerFrame.unit;
    local name, rank, texture, count, debuffType, duration, expirationTime = UnitAura(unit, index, filter);

    if (name and (not expirationTime or expirationTime == 0)) then
        buffDuration:Show();
        buffDuration:SetText("|cff00ff00N/A|r");
    end
end
