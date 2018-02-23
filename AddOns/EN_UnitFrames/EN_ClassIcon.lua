--[[
2009.08.17  Upgrade to 3.2.1 by 誰機@鬼霧峰TW
2010.10.26  Upgrade to 4.0.1 by 誰機@鬼霧峰TW
]]
local EUF_CLASS_TEXTURE = "Interface\\AddOns\\EN_UnitFrames\\EN_ClassIcon";
local EUF_CLASS_ICON = {
    ["WARRIOR"] = {0, 0.25, 0, 0.25},
    ["MAGE"] = {0.25, 0.49609375, 0, 0.25},
    ["ROGUE"] = {0.49609375, 0.7421875, 0, 0.25},
    ["DRUID"] = {0.7421875, 0.98828125, 0, 0.25},
    ["HUNTER"] = {0, 0.25, 0.25, 0.5},
    ["SHAMAN"] = {0.25, 0.49609375, 0.25, 0.5},
    ["PRIEST"] = {0.49609375, 0.7421875, 0.25, 0.5},
    ["WARLOCK"] = {0.7421875, 0.98828125, 0.25, 0.5},
    ["PALADIN"] = {0, 0.25, 0.5, 0.75},
    ["DEATHKNIGHT"] = {0.25, 0.49609375, 0.5, 0.75},
}

function EUF_SetClass(portrait, unit)
    -- Set 8 class icon
    local class, category, categoryId, signal;
    signal = 0;
    
    if unit == "player" then
        signal = 1;
        category = "Player";
        categoryId = "";
    end;

    if unit == "target" then
        signal = 1;
        category = "Target";
        categoryId = "";
    end;

    if unit == "focus" then
    signal = 1;
    category = "Focus";
    categoryId = "";
    end;

    if (unit == "party1" or unit == "party2" or unit == "party3" or unit == "party4") then
        local partyexists, _, partyid = string.find(unit, "^party(%d)$");
        if partyexists then
            signal = 1;
            category = "Party";
            categoryId = partyid;
        end;
    end;

    if signal == 0 then
        return;
    end;
    
    portrait:SetTexCoord(0, 1, 0, 1);

    local classLoc, class = UnitClass(unit);    
    if classLoc then
        if EUF_CurrentOptions[string.upper(category) .. "CLASSICONBIG"] == 1 then
            if class and UnitIsPlayer(unit) then
                EUF_SetPortraitTexture(portrait, class);
            end;
        end;
        
        if EUF_CurrentOptions[string.upper(category) .. "CLASSICONSMALL"] == 1 then
            if class and UnitIsPlayer(unit) then
                EUF_SetPortraitTexture(getglobal("EUF_" .. category .. "Frame" .. categoryId .. "PortraitIcon"), class);
                getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Show();
            else
                getglobal("EUF_" .. category .. "Frame" .. categoryId .. "Portrait"):Hide();
            end;
        end;
    end;
end

function EUF_SetPortraitTexture(portrait, class)
    -- Set 8 class icon
    portrait:SetTexture(EUF_CLASS_TEXTURE);
    portrait:SetTexCoord(EUF_CLASS_ICON[class][1],EUF_CLASS_ICON[class][2],EUF_CLASS_ICON[class][3],EUF_CLASS_ICON[class][4]);
end

function EUF_ClassIcon_Update(unit, iconType, value)
    local player_set, target_set, party_set, focus_set = 0;

    -- Update player portrait
    if EUF_CurrentOptions["PLAYERCLASSICONBIG"] == 0 then
        PlayerPortrait:SetTexCoord(0, 1, 0, 1);
        SetPortraitTexture(PlayerPortrait, "player");
    else
        player_set = 1;
    end;
    
    if EUF_CurrentOptions["PLAYERCLASSICONSMALL"] == 0 then
        EUF_PlayerFramePortrait:Hide();
    else
        player_set = 1;
    end;

    if player_set ~= 0 then
        EUF_SetClass(PlayerPortrait, "player");
    end;

    -- Update target portrait
    if EUF_CurrentOptions["TARGETCLASSICONBIG"] == 0 then
        TargetFramePortrait:SetTexCoord(0, 1, 0, 1);
        SetPortraitTexture(TargetFramePortrait,"target");
    else
        target_set = 1;
    end;
    
    if EUF_CurrentOptions["TARGETCLASSICONSMALL"] == 0 then
        EUF_TargetFramePortrait:Hide();
    else
        target_set = 1;
    end;

    if target_set ~= 0 then
        EUF_SetClass(TargetFramePortrait, "target");
    end;

-- Update focus portrait

    if EUF_CurrentOptions["FOCUSCLASSICONBIG"] == 0 then
        TgFocusPortrait:SetTexCoord(0, 1, 0, 1);
        SetPortraitTexture(TgFocusPortrait,"focus");
    else
        focus_set = 1;
    end;
    
    if EUF_CurrentOptions["FOCUSCLASSICONSMALL"] == 0 then
        EUF_FocusFramePortrait:Hide();
    else
        focus_set = 1;
    end;

    if focus_set ~= 0 then
        EUF_SetClass(TgFocusPortrait, "focus");
    end;
-- Update party portraits
    if EUF_CurrentOptions["PARTYCLASSICONBIG"] == 0 then
        for i = 1, 4, 1 do
            if (GetPartyMember(i)) then
                getglobal("PartyMemberFrame" .. i .. "Portrait"):SetTexCoord(0, 1, 0, 1);
                SetPortraitTexture(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party" .. i);
            end;
        end;
    else
        party_set = 1;
    end;

    if EUF_CurrentOptions["PARTYCLASSICONSMALL"] == 0 then
        for i = 1, 4, 1 do
            if (GetPartyMember(i)) then
                getglobal("EUF_PartyFrame" .. i .. "Portrait"):Hide();
            end;
        end;
    else
        party_set = 1;
    end;

    if party_set ~= 0 then
        for i = 1, 4, 1 do
            if (GetPartyMember(i)) then
                EUF_SetClass(getglobal("PartyMemberFrame" .. i .. "Portrait"), "party" .. i);
            end;
        end;
    end;
end

function EUF_FrameClassIcon_Update()
    EUF_ClassIcon_Update(0, 0, 0);
end

function EUF_UnitFrame_OnEvent(self, event, ...)
    if ((event == "UNIT_PORTRAIT_UPDATE") and (arg1 == self.unit)) then
        EUF_SetClass(self.portrait, self.unit);
    end;
end

function EUF_UnitFrame_Update(this)
    EUF_SetClass(this.portrait, this.unit);
end

hooksecurefunc("UnitFrame_OnEvent", EUF_UnitFrame_OnEvent);

hooksecurefunc("UnitFrame_Update", EUF_UnitFrame_Update);
