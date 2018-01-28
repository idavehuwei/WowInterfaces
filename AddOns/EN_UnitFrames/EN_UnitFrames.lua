
EN_RealmName = GetCVar("realmName");
if not EN_RealmName then
    EN_RealmName = "Enigma";
end;
EN_PlayerName = UnitName("player");
if not EN_PlayerName then
    EN_PlayerName = "Unknown";
end;
EN_PlayerId = EN_RealmName .. "." .. EN_PlayerName;

EUF_Version = "3.1.1"
EUF_AddonId = "EUF";
EUF_AddonName = "Enigma Unit Frames";

EUF_Options = {};

local EUF_DefaultOptions = {
    ["TARGETCLASSICONBIG"] = 0,
    ["PARTYCLASSICONBIG"] = 0,
    ["PLAYERCLASSICONSMALL"] = 1,
    ["PLAYERXP"] = 1,
    ["PARTYAUTOHEALTHCOLOR"] = 1,
    ["PARTYMANAFILTER"] = 0,
    ["TARGETHPPERCENT"] = 1,
    ["PARTY3DPORTRAIT"] = 0,
    ["PARTYMPPERCENT"] = 0,
    ["TARGETACCTUALHPMP"] = 1,
    ["PLAYERPOSITION"] = 1,
    ["TARGETINFOBROKENSHIELD"] = 1,
    ["TARGETAUTOHEALTHCOLOR"] = 1,
    ["VERSION"] = "3.1.1",
    ["TARGETCLASSICONSMALL"] = 1,
    ["TARGETTARGETHPMPBAR"] = 1,
    ["TARGETINFO"] = 1,
    ["PARTYHPPERCENT"] = 0,
    ["PLAYERCLASSICONBIG"] = 0,
    ["MOVINGTARGETTARGETFRAME"] = 1,
    ["TARGETINFORACE"] = 1,
    ["PARTYMP"] = 1,
    ["TARGETINDICATOR"] = 1,
    ["TARGETTARGETTARGETFRAME"] = 0,
    ["PARTYLEVEL"] = 1,
    ["PLAYERHP"] = 1,
    ["PLAYERMANAFILTER"] = 0,
    ["TARGETINFOCLASS"] = 1,
    ["COMPATIBLEVERSION"] = "3.1.1",
    ["PARTYCLASSICONSMALL"] = 1,
    ["PLAYERMPPERCENT"] = 0,
    ["PLAYER3DPORTRAIT"] = 0,
    ["TARGETINFOTARGET"] = 0,
    ["TARGET3DPORTRAIT"] = 0,
    ["TARGETMP"] = 1,
    ["PLAYERRARE"] = 1,
    ["PLAYERAUTOHEALTHCOLOR"] = 1,
    ["PLAYERXPAUTO"] = 1,
    ["PLAYERMP"] = 1,
    ["TARGETHP"] = 1,
    ["PARTYHIDE"] = 0,
    ["PARTYCOLOR"] = 1,
    ["TARGETTARGETHPPERCENTCOLOR"] = 1,
    ["TARGETOTWARNING"] = 1,
    ["PARTYCLASSABRV"] = 0,
    ["PLAYEREXTBAR"] = 1,
    ["TARGETTARGETFRAME"] = 1,
    ["PLAYERHPPERCENT"] = 0,
    ["PLAYERPOSITIONAUTO"] = 1,
    ["TARGETINFOELITE"] = 1,
    ["TARGETPERCENTBOSS"] = 0,
    ["PLAYERPETHPMP"] = 1,
    ["TARGETINFOLEVEL"] = 1,
    ["TARGETTARGETHPPERCENT"] = 1,
    ["TARGETMPPERCENT"] = 1,
    ["PLAYERFRM"] = 1,
    ["PARTYHP"] = 1,
    ["PLAYERPOSITIONMANA"] = 1,
    ["PARTYCLASS"] = 1,
};

function EUF_OnLoad()
    this:RegisterEvent("VARIABLES_LOADED");
    --this:RegisterEvent("PARTY_MEMBERS_CHANGED");

    --Slash Command Handler
    SLASH_EUF1 = "/euf";
    SLASH_EUF2 = "/enigmaunitframes";
    SlashCmdList[EUF_AddonId] = function(msg)
        EUF_SlashCommandHandler(msg);
    end;
end

;

function EUF_OnEvent(event)
    if event == "VARIABLES_LOADED" then
        EUF_Options_Init();
        if EUF_HpMpXp_Init then
            EUF_HpMpXp_Init();
        end;
        if EUF_FrameClassIcon_Update then
            EUF_FrameClassIcon_Update();
        end;
        if EUF_PartyInfo_Update then
            EUF_PartyInfo_Update();
        end;
        if EUF_TargetInfo_Update then
            EUF_TargetInfo_Update();
        end;
        DEFAULT_CHAT_FRAME:AddMessage(string.format("%s %s loaded.", EUF_AddonName, EUF_Version));
        DEFAULT_CHAT_FRAME:AddMessage(EUF_TEXT_OPTION_HELP);
        --else
        --EN_Msg("Event", event);
    end;
end

;

function EUF_SlashCommandHandler(msg)
    if ((msg or "") == "") then
        EN_Msg(EUF_AddonName .. " " .. EUF_Version .. " (http://wowbox.tw/bbs/) ");
        if EUF_OptionFrame then
            EUF_OptionFrame:Show();
        else
            EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_NOTINSTALLED);
            EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_HELP1);
            EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_HELP2);
            EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_HELP3);
        end;
    else
        local slExists, _, slCommand, slArg = string.find(string.lower(msg), "^([^%s]+) ([^%s]+)");
        if slExists then
            if slArg == "on" then
                slArg = 1;
            end;
            if slArg == "off" then
                slArg = 0;
            end;
            local result = EUF_Options_Update(slCommand, slArg);
            if result == -1 then
                EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_INVALIDPARAM);
            else
                EN_Msg(EUF_AddonId, string.format(EUF_TEXT_OPTION_SET, slCommand, slArg));
            end;

        else
            EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_INVALIDPARAM);
        end;
    end;
end

function EUF_Options_Init()
    if not EUF_Options then
        EUF_Options = {};
    end;
    EUF_CurrentOptions = EUF_Options[EN_PlayerId];
    if not EUF_CurrentOptions then
        EUF_OptionsDefault_Load();
    end;

    if not EUF_CurrentOptions["VERSION"] or EUF_DefaultOptions["COMPATIBLEVERSION"] > EUF_CurrentOptions["VERSION"] then
        EUF_OptionsDefault_Load();
        EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_NOTCOMPATIBLE);
    end;

    EUF_CurrentOptions["VERSION"] = null;
    local index, value;
    for index, value in pairs(EUF_DefaultOptions) do
        if not EUF_CurrentOptions[index] then
            EUF_CurrentOptions[index] = value;
        end;
    end;
end

;

function EUF_OptionsDefault_Load()
    if not EUF_Options then
        EUF_Options = {};
    end;
    EUF_Options[EN_PlayerId] = {};
    for index, value in pairs(EUF_DefaultOptions) do
        EUF_Options[EN_PlayerId][index] = value;
    end;
    EUF_CurrentOptions = EUF_Options[EN_PlayerId];
end

;

function EUF_Options_Update(oOptionId, oValue)
    if not oOptionId or not oValue then
        return -1;
    end;
    local optionId = string.upper(oOptionId);
    local value = tonumber(oValue);
    if value ~= 1 then
        value = 0;
    end;
    if not EUF_CurrentOptions[optionId] or EUF_CurrentOptions[optionId] == value then
        return;
    end;
    EUF_CurrentOptions[optionId] = value;

    if (optionId == "PLAYERHP") or (optionId == "PLAYERMP") or (optionId == "PLAYERHPPERCENT") or (optionId == "PLAYERMPPERCENT") then
        if EUF_PlayerFrameDisplay_Update then
            EUF_PlayerFrameDisplay_Update();
        end;
    elseif (optionId == "PLAYERXP") or (optionId == "PLAYERXPAUTO") or (optionId == "PLAYERPOSITION") or (optionId == "PLAYERPOSITIONMANA") then
        if EUF_PlayerFrameDisplay_Update then
            EUF_PlayerFrameDisplay_Update();
        end;
    elseif (optionId == "PLAYERPOSITIONAUTO") then
        if EUF_PlayerFramePosition_Update then
            EUF_PlayerFramePosition_Update();
        end;
    elseif (optionId == "PLAYERAUTOHEALTHCOLOR") then
        if EUF_PlayerFrameHPMP_Update then
            EUF_PlayerFrameHPMP_Update();
        end;
    elseif (optionId == "PLAYERFRM") then
        if EUF_PlayerFrameFrm_Update then
            EUF_PlayerFrameFrm_Update();
        end;
    elseif (optionId == "PLAYERRARE") then
        if EUF_PlayerFrameFrm_Update then
            EUF_PlayerFrameFrm_Update();
        end;
    elseif (optionId == "PLAYEREXTBAR") then
        if EUF_PlayerFrameExtBar_Update and EUF_PlayerFrameExtBar_Update then
            EUF_PlayerFrameExtBar_Update();
            EUF_PlayerFrameXp_Update();
        end;
    elseif (optionId == "PLAYERCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("player", "Big", value);
        end;
    elseif (optionId == "PLAYERCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("player", "Small", value);
        end;
    elseif (optionId == "PLAYERPETHPMP") then
        if EUF_PetFrameDisplay_Update then
            EUF_PetFrameDisplay_Update()
        end
    elseif (optionId == "PARTYHP") or (optionId == "PARTYMP") or (optionId == "PARTYHPPERCENT") or (optionId == "PARTYMPPERCENT") then
        if EUF_PartyFrameDisplay_Update then
            EUF_PartyFrameDisplay_Update();
        end;
    elseif (optionId == "PARTYAUTOHEALTHCOLOR") or (optionId == "PARTYMANAFILTER") then
        if EUF_PartyFrameHPMP_Update then
            EUF_PartyFrameHPMP_Update();
        end;
    elseif (optionId == "PARTYTIME") then
        if BuffFrame_UpdateDuration then
            BuffFrame_UpdateDuration();
        end;
    elseif (optionId == "PARTYLEVEL") or (optionId == "PARTYCLASS") or (optionId == "PARTYCLASSABRV") then
        if EUF_FramePartyInfo_Update then
            EUF_FramePartyInfo_Update();
        end;
    elseif (optionId == "PARTYCOLOR") then
        if EUF_PartyMember_CheckClass then
            EUF_PartyMember_CheckClass();
        end;
    elseif (optionId == "PARTYCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("party", "Big", value);
        end;
    elseif (optionId == "PARTYCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("party", "Small", value);
        end;
    elseif (optionId == "PARTYHIDE") then
        if EUF_HidePartyFrames then
            EUF_HidePartyFrames();
        end;
    elseif (optionId == "TARGETHP") or (optionId == "TARGETMP") then
        if EUF_TargetFrameDisplay_Update then
            EUF_TargetFrameDisplay_Update();
        end;
    elseif (optionId == "TARGETHPPERCENT") or (optionId == "TARGETMPPERCENT") then
        if EUF_TargetFrameDisplay_Update then
            EUF_TargetFrameDisplay_Update();
        end;
    elseif (optionId == "TARGETAUTOHEALTHCOLOR") then
        if EUF_TargetFrameHPMP_Update then
            EUF_TargetFrameHPMP_Update();
        end;
    elseif (optionId == "TARGETACCTUALHPMP") then
        if EUF_HP_Update then
            EUF_HP_Update("target");
        end;
    elseif (optionId == "TARGETINDICATOR") then
        if EUF_TargetHitIndicator_OnEvent(event) and EUF_TargetHitIndicator_OnUpdate(elapsed) then
            EUF_TargetHitIndicator_OnEvent(event);
            EUF_TargetHitIndicator_OnUpdate(elapsed);
        end;
    elseif (optionId == "TARGETINFO") then
        if EUF_TargetInfoDisplay_Update then
            EUF_TargetInfoDisplay_Update();
        end;
    elseif (optionId == "TARGETINFOLEVEL") or (optionId == "TARGETINFORACE") or (optionId == "TARGETINFOCLASS") or (optionId == "TARGETINFOELITE") then
        if EUF_TargetInfoClass_Update then
            EUF_TargetInfoClass_Update();
        end;
    elseif (optionId == "TARGETINFOBROKENSHIELD") then
        if EUF_TargetInfoDisplay_Update then
            EUF_TargetInfoDisplay_Update();
        end;
    elseif (optionId == "TARGETTARGETHPPERCENT") then
        if EUF_TargetTargetHpPercentDisplay_Update then
            EUF_TargetTargetHpPercentDisplay_Update();
        end;
    elseif (optionId == "TARGETCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("target", "Big", value);
        end;
    elseif (optionId == "TARGETCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("target", "Small", value);
        end;
    elseif (optionId == "TARGETOTWARNING") then
        if TARGETOTWARNING_OnUpdate then
            TARGETOTWARNING_OnUpdate()
        end;
    elseif (optionId == "PLAYER3DPORTRAIT") or (optionId == "PARTY3DPORTRAIT") or (optionId == "TARGET3DPORTRAIT") then
        if EUF_3DPortrait_OnUpdate then
            EUF_3DPortrait_OnUpdate();
        end;
    else
        return -1;
    end;
end

;

function EUF_GetPercentColor(value, valueMax)
    local r = 0;
    local g = 1;
    local b = 0;
    if (value and valueMax) then
        local valuePercent = tonumber(value) / tonumber(valueMax);
        if (valuePercent >= 0 and valuePercent <= 1) then
            if (valuePercent > 0.5) then
                r = (1.0 - valuePercent) * 2;
                g = 1.0;
            else
                r = 1.0;
                g = valuePercent * 2;
            end;
        end;
    end;
    if r < 0 then
        r = 0;
    end;
    if g < 0 then
        g = 0;
    end;
    if b < 0 then
        b = 0;
    end;
    if r > 1 then
        r = 1;
    end;
    if g > 1 then
        g = 1;
    end;
    if b > 1 then
        b = 1;
    end;
    return r, g, b;
end

;

function EN_Msg(Msg1, Msg2)
    local msg = "";
    if Msg2 then
        msg = Msg2;
    end;
    if Msg1 then
        if msg == "" then
            msg = "|cffff9900" .. Msg1 .. "|r"
        else
            msg = "|cffff9900[" .. Msg1 .. "]|r " .. msg;
        end;
    end;
    DEFAULT_CHAT_FRAME:AddMessage(msg);
end

;

function EUF_ObjectDisplay_Update(obj, status)
    if status == 1 then
        obj:Show();
    else
        obj:Hide();
    end;
end

;