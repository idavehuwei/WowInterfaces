local LowHealthWarnings = {
    ["player"] = false,
    ["party1"] = false,
    ["party2"] = false,
    ["party3"] = false,
    ["party4"] = false,
    ["target"] = false,
    ["focus"] = false
}

local UNIT_MODELS = {
    ["player"] = "EUF_3DPortrait_PlayerModel",
    ["party1"] = "EUF_3DPortrait_Party1Model",
    ["party2"] = "EUF_3DPortrait_Party2Model",
    ["party3"] = "EUF_3DPortrait_Party3Model",
    ["party4"] = "EUF_3DPortrait_Party4Model",
    ["target"] = "EUF_3DPortrait_TargetModel",
    ["focus"] = "EUF_3DPortrait_FocusModel"
}

local UNIT_PORTRAITS = {
    ["player"] = "PlayerPortrait",
    ["target"] = "TargetFramePortrait",
    ["focus"] = "TgFocusPortrait",
    ["party1"] = "PartyMemberFrame1Portrait",
    ["party2"] = "PartyMemberFrame2Portrait",
    ["party3"] = "PartyMemberFrame3Portrait",
    ["party4"] = "PartyMemberFrame4Portrait"
}

function EUF_3DPortrait_OnLoad(this)
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("PARTY_MEMBERS_CHANGED");
    this:RegisterEvent("PLAYER_TARGET_CHANGED");
    this:RegisterEvent("PLAYER_FOCUS_CHANGED");
    this:RegisterEvent("UNIT_PORTRAIT_UPDATE");
    this:RegisterEvent("UNIT_HEALTH");
end

function EUF_3DPortrait_OnEvent(self, event, ...)
    local arg1, arg2, arg3 = ...; 

    if EUF_3DPortrait_Show3D then
        if event == "PLAYER_TARGET_CHANGED" then
            EUF_3DPortrait_Update3D("target");
        elseif event == "PLAYER_FOCUS_CHANGED" then
            EUF_3DPortrait_Update3D("focus");
        elseif event == "UNIT_PORTRAIT_UPDATE" and UNIT_MODELS[arg1] then
            EUF_3DPortrait_Update3D(arg1);
        elseif event == "UNIT_HEALTH" and UNIT_MODELS[arg1] then
            EUF_3DPortrait_SetLights3D(arg1);
        end;
    end;

    if event == "PARTY_MEMBERS_CHANGED" or event == "VARIABLES_LOADED" then
        if EUF_3DPortrait_Show3D and GetNumPartyMembers() > 0 then
            EUF_3DPortraitFramePartyChecker:Show();
        else
            EUF_3DPortraitFramePartyChecker:Hide();
        end;

        EUF_3DPortrait_OnUpdate();
    end;
end

function EUF_3DPortrait_OnUpdate()
    if EUF_CurrentOptions["PLAYER3DPORTRAIT"] == 1 then
        EUF_3DPortrait_Show3D = EUF_CurrentOptions["PLAYER3DPORTRAIT"];
        EUF_3DPortrait_PlayerModel:Show();
        EUF_3DPortrait_Update3D("player");
    else
        EUF_3DPortraitFramePartyChecker:Hide();
        PlayerPortrait:Show();
        EUF_3DPortrait_PlayerModel:Hide();
    end;
 
    if EUF_CurrentOptions["TARGET3DPORTRAIT"] == 1 then
        EUF_3DPortrait_Show3D = EUF_CurrentOptions["TARGET3DPORTRAIT"];
        EUF_3DPortrait_TargetModel:Show();
        EUF_3DPortrait_Update3D("target");
    else
        EUF_3DPortraitFramePartyChecker:Hide();
        TargetFramePortrait:Show();
        EUF_3DPortrait_TargetModel:Hide();
    end;
    
    if EUF_CurrentOptions["FOCUS3DPORTRAIT"] == 1  then
    EUF_3DPortrait_Show3D=EUF_CurrentOptions["FOCUS3DPORTRAIT"];
    EUF_3DPortrait_FocusModel:Show();
    EUF_3DPortrait_Update3D("focus");
    else
    EUF_3DPortraitFramePartyChecker:Hide();
    TgFocusPortrait:Show();
    EUF_3DPortrait_FocusModel:Hide();
    end;

    if EUF_CurrentOptions["PARTY3DPORTRAIT"] == 1 then
        EUF_3DPortrait_Show3D = EUF_CurrentOptions["PARTY3DPORTRAIT"];

        if not PartyMemberFrame1:IsVisible() then
            EUF_3DPortrait_Party1Model:ClearModel();
        end;

        if not PartyMemberFrame2:IsVisible() then
            EUF_3DPortrait_Party2Model:ClearModel();
        end;

        if not PartyMemberFrame3:IsVisible() then
            EUF_3DPortrait_Party3Model:ClearModel();
        end;

        if not PartyMemberFrame4:IsVisible() then
            EUF_3DPortrait_Party4Model:ClearModel();
        end;

        EUF_3DPortrait_Party1Model:Show();
        EUF_3DPortrait_Update3D("party1");
        EUF_3DPortrait_Party2Model:Show();
        EUF_3DPortrait_Update3D("party2");
        EUF_3DPortrait_Party3Model:Show();
        EUF_3DPortrait_Update3D("party3");
        EUF_3DPortrait_Party4Model:Show();
        EUF_3DPortrait_Update3D("party4");

        if GetNumPartyMembers() > 0 then
            EUF_3DPortraitFramePartyChecker:Show();
        end;
    else
        EUF_3DPortraitFramePartyChecker:Hide();

        PartyMemberFrame1Portrait:Show();
        PartyMemberFrame2Portrait:Show();
        PartyMemberFrame3Portrait:Show();
        PartyMemberFrame4Portrait:Show();

        EUF_3DPortrait_Party1Model:Hide();
        EUF_3DPortrait_Party2Model:Hide();
        EUF_3DPortrait_Party3Model:Hide();
        EUF_3DPortrait_Party4Model:Hide();
    end;
end

function EUF_3DPortrait_Update3D(unit)
    getglobal(UNIT_MODELS[unit]):ClearModel();
    getglobal(UNIT_MODELS[unit]):SetUnit(unit);
    getglobal(UNIT_MODELS[unit]):SetCamera(0);

    EUF_3DPortrait_SetLights3D(unit);

    if EUF_3DPortrait_IsMeshLoaded(unit) then
        getglobal(UNIT_PORTRAITS[unit]):Hide();
    elseif EUF_CurrentOptions["FOCUS3DPORTRAIT"] == 1 and unit == "focus" then
        getglobal(UNIT_PORTRAITS[unit]):Hide();
    else
        getglobal(UNIT_PORTRAITS[unit]):Show();
    end;
end

function EUF_3DPortrait_SetLights3D(unit)
    LowHealthWarnings[unit] = false;

    if (not UnitIsConnected(unit)) or UnitIsGhost(unit) then
        getglobal(UNIT_MODELS[unit]):SetLight(1, 0, 0, 0, 0, 1.0, 0.25, 0.25, 0.25);
    elseif UnitIsDead(unit) then
        getglobal(UNIT_MODELS[unit]):SetLight(1, 0, 0, 0, 0, 1.0, 1, 0.3, 0.3);
    elseif EUF_3DPortrait_Percent(UnitHealth(unit), UnitHealthMax(unit)) < 20 then
        LowHealthWarnings[unit] = true;
        EUF_3DPortraitFrame:Show();
    else
        getglobal(UNIT_MODELS[unit]):SetLight(1, 0, 0, 0, 0, 1.0, 1, 1, 1);
    end;
end

function EUF_3DPortrait_IsMeshLoaded(unit)
    return type(getglobal(UNIT_MODELS[unit]):GetModel()) == "string";
end

function EUF_3DPortrait_LoadPartyMesh(unit)
    if not EUF_3DPortrait_IsMeshLoaded(unit) then
        EUF_3DPortrait_Update3D(unit);
    end;
end

function EUF_3DPortrait_Percent(value, maxValue)
    if maxValue ~= 0 then
        return math.floor(value * 100 / maxValue);
    end;

    return 0;
end

local timer = 0;
local sign = 1;

function EUF_3DPortrait_Update(self, elapsed)
    timer = timer + elapsed;

    if timer > 0.5 then
        sign = -sign;
    end;

    timer = mod(timer, 0.5);

    local redIntensity = 0;

    if sign == 1 then
        redIntensity = 0.7 - timer;
    else
        redIntensity = timer + 0.2;
    end;

    local hide = true;

    for unit, warn in pairs(LowHealthWarnings) do
        if warn and getglobal(UNIT_MODELS[unit]):IsVisible() then
            getglobal(UNIT_MODELS[unit]):SetLight(1, 0, 0, 0, 0, 1.0, 1, redIntensity, redIntensity);
            hide = false;
        end;
    end;

    if hide then
        EUF_3DPortraitFrame:Hide();
    end;
end
