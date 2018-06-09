--[[
Enigma Unit Frames 4.0.3 Main Script

Notice for developers:
- How to release new version?
update 'EUF_Version' and 'VERSION in EUF_CurrentOptions' to new version number

DO NOT update the 'COMPATIBLEVERSION in EUF_CurrentOptions' unless
you revise the structure of EUF_CurrentOptions, and want users to reset to default setting again.
]]

EUF_Version = "4.1.1"
EUF_AddonId = "EUF";
EUF_AddonName = "Enigma Unit Frames";
EUF_SysAddonName = "EN_UnitFrames";

EN_RealmName = GetCVar("realmName");
EN_PlayerName = UnitName("player");

if not EN_RealmName then
    EN_RealmName = "Enigma";
end;

if not EN_PlayerName then
    EN_PlayerName = "Unknown";
end;

EN_PlayerId = EN_RealmName .. "." .. EN_PlayerName;

EN_MAX_PLAYER_LEVEL = {
    [0] = 60,
    [1] = 70,
    [2] = 80,
    [3] = 85,
};

DuowanAddon_EUF_Options = {};

local EUF_DefaultOptions = {
    ["VERSION"] = "4.1.1",
    ["COMPATIBLEVERSION"] = "4.0.2",
    -- Player Info --
    ["PLAYERHP"] = 1,               -- 显示玩家生命值
    ["PLAYERMP"] = 1,               -- 显示玩家法力值
    ["PLAYERXP"] = 1,               -- 显示玩家经验条
    ["PLAYERXPAUTO"] = 0,           -- 满级自动隐藏经验条
    ["PLAYERRARE"] = 1,             -- 玩家头像边框风格 (0:精英(金龙), 1:稀有精英(银龙))
    ["PLAYERFRM"] = 1,              -- 显示头像边框
    ["PLAYER3DPORTRAIT"] = 1,       -- 显示玩家3D头像
    ["PLAYERPOSITION"] = 1,         -- 显示玩家坐标
    ["PLAYERPOSITIONAUTOHP"] = 1,   -- 在副本中显示生命值百分比
    ["PLAYERPOSITIONTOHP"] = 1,     -- 将坐标替换为生命值百分比
    ["PLAYERHPPERCENT"] = 0,        -- 玩家生命值百分比
    ["PLAYERMPPERCENT"] = 0,        -- 玩家魔法值百分比
    ["PLAYEREXTBAR"] = 1,           -- 显示扩展边框
    ["PLAYERAUTOHEALTHCOLOR"] = 1,  -- 自动调节生命条颜色
    ["PLAYERCLASSICONBIG"] = 0,     -- 显示玩家职业图标(大)
    ["PLAYERCLASSICONSMALL"] = 1,   -- 显示玩家职业图标(小)
    ["PLAYERPETHPMP"] = 0,          -- 显示宠物的HP和MP
    -- Target Info --
    ["TARGETHP"] = 1,               -- 显示目标生命值
    ["TARGETMP"] = 1,               -- 显示目标魔法值
    ["TARGETHPPERCENT"] = 1,        -- 显示目标生命值百分比
    ["TARGETMPPERCENT"] = 1,        -- 显示目标魔法值百分比
    ["TARGETPERCENTINSIDE"] = 0,    -- 将百分比显示在血条内
    ["TARGETINFO"] = 1,             -- 显示目标信息
    ["TARGETINFORACE"] = 1,         -- 目标信息 - 种族
    ["TARGETINFOCLASS"] = 1,        -- 目标信息 - 职业
    ["TARGETINFOELITE"] = 1,        -- 目标信息 - 精英类型
    ["TARGETINFOLEVEL"] = 1,        -- 目标信息 - 级别
    ["TARGET3DPORTRAIT"] = 0,       -- 显示目标3D头像
    ["TARGETOTWARNING"] = 1,        -- 仇恨报警
    ["TARGETINDICATOR"] = 0,        -- 目标头像显示战斗数值
    ["TARGETAUTOHEALTHCOLOR"] = 1,  -- 自动调节生命条颜色
    ["TARGETCLASSICONBIG"] = 0,     -- 显示目标职业图标(大)
    ["TARGETCLASSICONSMALL"] = 1,   -- 显示目标职业图标(小)
    -- ToT Info --
    ["TARGETINFOTARGET"] = 0,           -- 显示目标的目标(简略)
    ["TARGETTARGETFRAME"] = 1,          -- 显示目标的目标(标准)
    ["TARGETINFOBROKENSHIELD"] = 1,     -- 显示目标破甲值
    ["TARGETACCTUALHPMP"] = 1,          -- 不显示不精确的生命值(待测?)
    ["TARGETTARGETHPMPBAR"] = 1,        -- 显示目标的目标生命值/魔法值条
    ["TARGETTARGETHPPERCENT"] = 1,      -- 显示目标的目标生命值百分比
    ["TARGETTARGETHPPERCENTCOLOR"] = 1, -- 自动调整生命条颜色
    ["TARGETTARGETTARGETFRAME"] = 0,    -- 显示目标的目标的目标(标准)
    ["MOVINGTARGETTARGETFRAME"] = 1,    -- 移动目标的目标(标准)
    -- Focus Info --
    ["FOCUSHP"] = 1,                -- 显示焦点生命值
    ["FOCUSHPPERCENT"] = 1,         -- 显示焦点生命值百分比
    ["FOCUSPERCENTINSIDE"] = 0,     -- 将百分比显示在血条内
    ["FOCUSCLASSICONBIG"] = 0,      -- 显示焦点职业图标(大)
    ["FOCUSCLASSICONSMALL"] = 1,    -- 显示焦点职业图标(小)
    ["FOCUS3DPORTRAIT"] = 0,        -- 显示焦点3D头像
    -- Party Info --
    ["PARTYHP"] = 1,                -- 显示队友生命值
    ["PARTYMP"] = 1,                -- 显示队友魔法值
    ["PARTYHPPERCENT"] = 0,         -- 显示队友生命值百分比
    ["PARTYMPPERCENT"] = 0,         -- 显示队友魔法值百分比
    ["PARTYMANAFILTER"] = 0,        -- 无魔法的职业不显示魔法值
    ["PARTY3DPORTRAIT"] = 0,        -- 显示队友3D头像
    ["PARTYHIDE"] = 0,              -- 隐藏队伍框架
    ["PARTYLEVEL"] = 1,             -- 显示队友等级
    ["PARTYCLASS"] = 1,             -- 显示队友职业
    ["PARTYCLASSABRV"] = 0,         -- 以缩写方式显示职业
    ["PARTYCOLOR"] = 1,             -- 队友名字按职业着色
    ["PARTYAUTOHEALTHCOLOR"] = 1,   -- 自动调节生命条颜色
    ["PARTYCLASSICONBIG"] = 0,      -- 显示队友职业图标(大)
    ["PARTYCLASSICONSMALL"] = 1,    -- 显示队友职业图标(小)
    ["PARTYBUFF"] = 1,              -- 显示队友BUFF
    ["PARTYTARGET"] = 1,            -- 显示队友目标
    ["PARTYCAST"] = 1,              -- 显示队友施法条
    -- Party Buff/DeBuff/Target/CastBar Positions --
    ["PARTYBUFFPOSITIONX"] = 0,
    ["PARTYBUFFPOSITIONY"] = 0,
    ["PARTYDEBUFFPOSITIONX"] = 0,
    ["PARTYDEBUFFPOSITIONY"] = 0,
    ["PARTYTARGETPOSITIONX"] = 0,
    ["PARTYTARGETPOSITIONY"] = 0,
    ["PARTYCASTPOSITIONX"] = 0,
    ["PARTYCASTPOSITIONY"] = 0,
};

function EUF_OnLoad(this)
    this:RegisterEvent("PLAYER_ENTERING_WORLD");
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("ADDON_LOADED");

    -- Slash Command Handler
    SLASH_EUF1 = "/euf";
    SLASH_EUF2 = "/enigmaunitframes";
    SlashCmdList[EUF_AddonId] = function(msg)
        InterfaceOptionsFrame_OpenToCategory("EN_UnitFrames");
        EN_Msg(EUF_AddonName .. " " .. EUF_Version .. " (http://wowbox.tw/bbs/) ");
    end;
end

function EUF_OnEvent(self, event, ...)
    local name = ...;

    if event == "ADDON_LOADED" and name == EUF_SysAddonName then
        EUF_Options_Init();

        if EUF_FrameClassIcon_Update then
            EUF_FrameClassIcon_Update();
        end

        if EUF_PartyInfo_Update then
            EUF_PartyInfo_Update();
        end

        if EUF_TargetInfo_Update then
            EUF_TargetInfo_Update();
        end

        EN_Msg(string.format("%s %s loaded.", EUF_AddonName, EUF_Version));
        EN_Msg(EUF_TEXT_OPTION_HELP);
    elseif event == "PLAYER_ENTERING_WORLD" then
        EUF_PlayerFrameFrm_Update();
        EUF_PlayerFrameExtBar_Update();
        EUF_PlayerFrameXp_Update();
        EUF_ObjectDisplay_Update(EUF_PlayerFrameXP, EUF_CanXPBarShow());
        EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, EUF_CanXPBarShow());
        EUF_HidePartyToggle();
        PartyTarget_Toggle();
        PartyBuff_Toggle();
        --else
        --    EN_Msg("Event", event);
    end
end

function EUF_Options_Init()
    -- 载入配置
    if not DuowanAddon_EUF_Options then
        DuowanAddon_EUF_Options = {};
    end
    if DuowanAddon_EUF_Options[EN_PlayerId] then
        EUF_CurrentOptions = DuowanAddon_EUF_Options[EN_PlayerId];
    end

    if not EUF_CurrentOptions then
        EUF_CurrentOptions = {};
        EUF_OptionsDefault_Load();
    end;

    if (not EUF_CurrentOptions["VERSION"]) or (EUF_DefaultOptions["COMPATIBLEVERSION"] > EUF_CurrentOptions["VERSION"]) then
        EUF_OptionsDefault_Load();
        EN_Msg(EUF_AddonId, EUF_TEXT_OPTION_NOTCOMPATIBLE);
    end;

    -- clear the version, and update the version number later no matter whether the default settings are loaded
    EUF_CurrentOptions["VERSION"] = nil;

    local index, value;

    for index, value in pairs(EUF_DefaultOptions) do
        if not EUF_CurrentOptions[index] then
            EUF_CurrentOptions[index] = value;
        end;
    end;
end

-- 载入缺省配置
function EUF_OptionsDefault_Load()
    if not DuowanAddon_EUF_Options then
        DuowanAddon_EUF_Options = {};
    end
    DuowanAddon_EUF_Options[EN_PlayerId] = {};
    for index, value in pairs(EUF_DefaultOptions) do
        DuowanAddon_EUF_Options[EN_PlayerId][index] = value;
    end
    EUF_CurrentOptions = DuowanAddon_EUF_Options[EN_PlayerId];
end

function EUF_GetCurrentOptions(oOptionId)
    if not EUF_CurrentOptions or not oOptionId then
        return nil;
    end

    local optionId = string.upper(oOptionId);

    return EUF_CurrentOptions[optionId];
end

function EUF_Options_Update(oOptionId, oValue)
    if not EUF_CurrentOptions then
        return;
    end
    if not oOptionId or not oValue then
        return -1;
    end;

    local optionId = string.upper(oOptionId);
    local value = tonumber(oValue);

    if not EUF_CurrentOptions[optionId] or EUF_CurrentOptions[optionId] == value then
        return;
    end

    EUF_CurrentOptions[optionId] = value;

    if (optionId == "PLAYERHP") or (optionId == "PLAYERMP") or (optionId == "PLAYERHPPERCENT") or (optionId == "PLAYERMPPERCENT") then
        if EUF_PlayerFrameDisplay_Update then
            EUF_PlayerFrameDisplay_Update();
        end
    elseif (optionId == "PLAYERPOSITION") or (optionId == "PLAYERPOSITIONTOHP") then
        if EUF_PlayerFrameDisplay_Update then
            EUF_PlayerFrameDisplay_Update();
        end
    elseif (optionId == "PLAYERXP") or (optionId == "PLAYERXPAUTO") then
        if EUF_PlayerFrameDisplay_Update then
            EUF_ObjectDisplay_Update(EUF_PlayerFrameXP, EUF_CanXPBarShow());
            EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, EUF_CanXPBarShow());
        end
    elseif (optionId == "PLAYERPOSITIONAUTOHP") then
        if EUF_PlayerFramePosition_Update then
            EUF_PlayerFramePosition_Update();
        end
    elseif (optionId == "PLAYERAUTOHEALTHCOLOR") then
        if EUF_PlayerFrameHPMP_Update then
            EUF_PlayerFrameHPMP_Update();
        end
    elseif (optionId == "PLAYERFRM") then
        if EUF_PlayerFrameFrm_Update then
            EUF_PlayerFrameFrm_Update();
        end
    elseif (optionId == "PLAYERRARE") then
        if EUF_PlayerFrameFrm_Update then
            EUF_PlayerFrameFrm_Update();
        end
    elseif (optionId == "PLAYEREXTBAR") then
        if EUF_PlayerFrameExtBar_Update and EUF_PlayerFrameExtBar_Update then
            EUF_PlayerFrameExtBar_Update();
            EUF_PlayerFrameXp_Update();
        end
    elseif (optionId == "PLAYERCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("player", "Big", value);
        end
    elseif (optionId == "PLAYERCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("player", "Small", value);
        end
    elseif (optionId == "PLAYERPETHPMP") then
        if EUF_PetFrameDisplay_Update then
            EUF_PetFrameDisplay_Update();
        end
    elseif (optionId == "PARTYHP") or (optionId == "PARTYMP") or (optionId == "PARTYHPPERCENT") or (optionId == "PARTYMPPERCENT") then
        if EUF_PartyFrameDisplay_Update then
            EUF_PartyFrameDisplay_Update();
        end
    elseif (optionId == "PARTYAUTOHEALTHCOLOR") or (optionId == "PARTYMANAFILTER") then
        if EUF_PartyFrameHPMP_Update then
            EUF_PartyFrameHPMP_Update();
        end
    elseif (optionId == "PARTYTIME") then
        if BuffFrame_UpdateDuration then
            BuffFrame_UpdateDuration();
        end
    elseif (optionId == "PARTYLEVEL") or (optionId == "PARTYCLASS") or (optionId == "PARTYCLASSABRV") then
        if EUF_FramePartyInfo_Update then
            EUF_FramePartyInfo_Update();
        end
    elseif (optionId == "PARTYCOLOR") then
        if EUF_PartyMember_CheckClass then
            EUF_PartyMember_CheckClass();
        end
    elseif (optionId == "PARTYCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("party", "Big", value);
        end
    elseif (optionId == "PARTYCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("party", "Small", value);
        end
    elseif (optionId == "PARTYHIDE") then
        if EUF_HidePartyToggle then
            EUF_HidePartyToggle();
        end
    elseif (optionId == "TARGETHP") or (optionId == "TARGETMP") then
        if EUF_TargetFrameDisplay_Update then
            EUF_TargetFrameDisplay_Update();
        end
    elseif (optionId == "TARGETHPPERCENT") or (optionId == "TARGETMPPERCENT") then
        if EUF_TargetFrameDisplay_Update then
            EUF_TargetFrameDisplay_Update();
        end
    elseif (optionId == "TARGETAUTOHEALTHCOLOR") then
        if EUF_TargetFrameHPMP_Update then
            EUF_TargetFrameHPMP_Update();
        end
    elseif (optionId == "TARGETACCTUALHPMP") then
        if EUF_HP_Update then
            EUF_HP_Update("target");
        end
    elseif (optionId == "TARGETINDICATOR") then
        if EUF_TargetHitIndicator_OnEvent and EUF_TargetHitIndicator_OnUpdate then
            EUF_TargetHitIndicator_OnEvent(event);
            EUF_TargetHitIndicator_OnUpdate(elapsed);
        end
    elseif (optionId == "TARGETINFO") then
        if EUF_TargetInfoDisplay_Update then
            EUF_TargetInfoDisplay_Update();
        end
    elseif (optionId == "TARGETINFOLEVEL") or (optionId == "TARGETINFORACE") or (optionId == "TARGETINFOCLASS") or (optionId == "TARGETINFOELITE") then
        if EUF_TargetInfoClass_Update then
            EUF_TargetInfoClass_Update();
        end
    elseif (optionId == "TARGETINFOBROKENSHIELD") then
        if EUF_TargetInfoDisplay_Update then
            EUF_TargetInfoDisplay_Update();
        end
    elseif (optionId == "TARGETTARGETHPPERCENT") then
        if EUF_TargetTargetHpPercentDisplay_Update then
            EUF_TargetTargetHpPercentDisplay_Update();
        end
    elseif (optionId == "TARGETCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("target", "Big", value);
        end
    elseif (optionId == "TARGETCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("target", "Small", value);
        end
    elseif (optionId == "FOCUSCLASSICONBIG") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("focus", "Big", value);
        end
    elseif (optionId == "FOCUSCLASSICONSMALL") then
        if EUF_ClassIcon_Update then
            EUF_ClassIcon_Update("focus", "Small", value);
        end
    elseif (optionId == "TARGETOTWARNING") then
        if TARGETOTWARNING_OnUpdate then
            TARGETOTWARNING_OnUpdate();
        end
    elseif (optionId == "PLAYER3DPORTRAIT") or (optionId == "PARTY3DPORTRAIT") or (optionId == "TARGET3DPORTRAIT") or (optionId == "FOCUS3DPORTRAIT") then
        if EUF_3DPortrait_OnUpdate then
            EUF_3DPortrait_OnUpdate();
        end
    elseif (optionId == "PARTYTARGET") then
        PartyTarget_UpdateAll();
    elseif (optionId == "PARTYBUFF") then
        PartyBuff_UpdateAll();
    elseif (optionId == "FOCUSHP") or (optionId == "FOCUSHPPERCENT") or (optionId == "FOCUSPERCENTINSIDE") then
        TgFocusFrameHealthBarText_UpdateTextString(TgFocusFrameHealthBar);
    elseif optionId == "PARTYBUFFPOSITIONX" or optionId == "PARTYBUFFPOSITIONY" then
        PartyBuffPositionUpdate();
    elseif optionId == "PARTYDEBUFFPOSITIONX" or optionId == "PARTYDEBUFFPOSITIONY" then
        PartyDebuffPositionUpdate();
    elseif optionId == "PARTYTARGETPOSITIONX" or optionId == "PARTYTARGETPOSITIONY" then
        PartyTargetPositionUpdate();
    elseif optionId == "PARTYCASTPOSITIONX" or optionId == "PARTYCASTPOSITIONY" then
        PartyCastPositionUpdate();
    else
        return -1;
    end
end

function EUF_GetPercentColor(value, valueMax)
    local r = 0;
    local g = 1;
    local b = 0;

    if (value and valueMax) then
        local valuePercent = tonumber(value) / tonumber(valueMax);

        if valuePercent >= 0 and valuePercent <= 1 then
            if (valuePercent > 0.5) then
                r = (1.0 - valuePercent) * 2;
                g = 1.0;
            else
                r = 1.0;
                g = valuePercent * 2;
            end
        end
    end

    if r < 0 then
        r = 0;
    elseif r > 1 then
        r = 1;
    end

    if g < 0 then
        g = 0;
    elseif g > 1 then
        g = 1;
    end

    if b < 0 then
        b = 0;
    elseif b > 1 then
        b = 1;
    end

    return r, g, b;
end

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

    DEFAULT_CHAT_FRAME:AddMessage(msg, 1, 1, 1);
end

function EUF_ObjectDisplay_Update(obj, status)
    if status == 1 then
        obj:Show();
    else
        obj:Hide();
    end;
end

---------------
-- 用于初始化生命条状态
function EUF_InitCVar()
    local ver = dwRawGetCVar("EN_UnitFrames", "ver", "3.1.1");
    if (ver ~= EUF_Version) then
        SetCVar("playerStatusText", "1");
        SetCVar("petStatusText", "1");
        SetCVar("partyStatusText", "1");
        SetCVar("statusTextPercentage", "1");
        SetCVar("showPartyPets", "1"); -- 显示队友目标
        dwSetCVar("EN_UnitFrames", "ver", EUF_Version);
    end
end

function EN_ShowFramePosition(frame)
    if (frame == nil or type(frame) ~= type(table)) then return; end

    local point, parent, relativePoint, x, y;
    local relativeTo = nil
    local output = tostring(frame:GetName())

    point, relativeTo, relativePoint, x, y = frame:GetPoint();

    output = output .. ": " .. tostring(point)

    if (relativeTo) then
        output = output .. ", " .. tostring(relativeTo:GetName())
    end

    output = output .. ", " .. tostring(relativePoint)
    output = output .. ", " .. tostring(x)
    output = output .. ", " .. tostring(y)

    print(output)
end

function Place(obj, arg1, arg2, arg3, arg4, arg5)
    obj:ClearAllPoints();
    obj:SetPoint(arg1, arg2, arg3, arg4, arg5);
end
