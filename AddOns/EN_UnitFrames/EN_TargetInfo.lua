local EUF_SHIELD_THRESHOLD_RED = 2250;
local EUF_SHIELD_THRESHOLD_YELLOW = 900;
local EUF_TARGET_INTERVAL = 0;
local EUF_TARGET_INTERVAL_MID = 10;
local EUF_TARGET_INTERVAL_MAX = 20;
local ShieldYOffset = 28;

function EUF_TargetInfo_OnLoad(this)
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("PLAYER_TARGET_CHANGED");
end

function EUF_TargetInfo_OnEvent(self, event, ...)
    if event == "PLAYER_TARGET_CHANGED" then
        EUF_TargetInfoClass_Update();
        EUF_TOTSELF_SOUND = 0;
    elseif event == "VARIABLES_LOADED" then
        Place(UIErrorsFrame, "TOP", "UIParent", "TOP", 0, -165);
        EUF_TargetTargetHpPercentDisplay_Update();
    end;
end

function EUF_TargetInfo_Update(self, button)
    local tempOffset = 0;

    if EUF_CurrentOptions["TARGETINFOTARGET"] == 1 and UnitIsVisible("targettarget") then
        tempOffset = -16;
        EUF_TargetInfoTarget:SetAlpha(1);
    else
        EUF_TargetInfoTarget:SetAlpha(0);
    end;

    if EUF_CurrentOptions["TARGETTARGETHPMPBAR"] == 1 and UnitIsVisible("targettarget") then
        tempOffset = -28;
        EUF_TargetInfoTargetHPMPBar:Show();
    else
        EUF_TargetInfoTargetHPMPBar:Hide();
    end;

    -- Set TargetInfoShield YOffset
    Place(EUF_TargetInfoShield, "TOPLEFT", EUF_TargetInfoTarget , "TOPLEFT", 0, tempOffset);
end

function EUF_TargetTargetHpPercentDisplay_Update(self, button)
    if EUF_CurrentOptions["TARGETTARGETHPPERCENT"] == 1 then
        EUF_TargetInfoTargetHPPercent:Show();
    else
        EUF_TargetInfoTargetHPPercent:Hide();
    end;
end

-- Class Info
function EUF_TargetInfoClass_Update(self, button)
    if (EUF_CurrentOptions["TARGETINFO"] == 1) then
        EUF_TargetInfo:SetText(EUF_GetUnitInfoString("target", EUF_CurrentOptions["TARGETINFOLEVEL"], 1, EUF_CurrentOptions["TARGETINFORACE"], EUF_CurrentOptions["TARGETINFOCLASS"], EUF_CurrentOptions["TARGETINFOELITE"]));
    end;
end

-- TargetTarget
function EUF_TargetInfoTarget_Update(self, button)
    local targetTarget = UnitName("targettarget");
    local targetIsFriend = UnitIsFriend("targettarget", "player");

    if not targetTarget then
        targetTarget = "";
    end;

    local targetString = "";

    if targetIsFriend then
        if ((targetTarget == EN_PlayerName) and UnitCanAttack("target", "player")) then
            if EUF_TOTSELF_SOUND ~= 1 then
                EUF_TargetFrameToTSound_Play();
            end;

            EUF_TARGET_INTERVAL = EUF_TARGET_INTERVAL + 1;

            if (EUF_TARGET_INTERVAL > EUF_TARGET_INTERVAL_MID) then
                targetString = "|cffff0000" .. targetTarget .. "|r";
            else
                targetString = "|cffffff00" .. targetTarget .. "|r";
            end;

            if (EUF_TARGET_INTERVAL > EUF_TARGET_INTERVAL_MAX) then
                EUF_TARGET_INTERVAL = 0;
            end;
        else
            EUF_TOTSELF_SOUND = 0;
            targetString = "|cffffffff" .. targetTarget .. "|r";
        end;
    else
        targetString = "|cffff0000" .. targetTarget .. "|r";
    end;

    EUF_TargetInfoTargetName:SetText(EUF_TEXT_TARGET .. targetString);
end

function EUF_TargetInfoTargetHPMP_Update(self, button)
    local color = PowerBarColor[UnitPowerType("targettarget")];

    if ( not color ) then
        -- couldn't find a power token entry...default to indexing by power type or just mana if we don't have that either
        color = PowerBarColor[UnitPowerType("targettarget")] or PowerBarColor["MANA"];
    end;

    EUF_TargetInfoTargetMPBar:SetStatusBarColor(color.r, color.g, color.b);
    EUF_TargetInfoTargetMPBkg:SetStatusBarColor(color.r, color.g, color.b, 0.25);
    EUF_TargetInfoTargetHPBar:SetMinMaxValues(0, UnitHealthMax("targettarget"));
    EUF_TargetInfoTargetHPBar:SetValue(UnitHealth("targettarget"));
    EUF_TargetInfoTargetMPBar:SetMinMaxValues(0, UnitManaMax("targettarget"));
    EUF_TargetInfoTargetMPBar:SetValue(UnitMana("targettarget"));

    local curHp = UnitHealth("targettarget");
    local maxHp = UnitHealthMax("targettarget");

    if curHp and maxHp then
        EUF_TargetInfoTargetHPPercent:SetText(math.floor(curHp * 100 / maxHp) .. "%");

        if EUF_CurrentOptions["TARGETTARGETHPPERCENTCOLOR"] == 1 then
            EUF_TargetInfoTargetHPPercent:SetTextColor(EUF_GetPercentColor(curHp, maxHp));
        else
            EUF_TargetInfoTargetHPPercent:SetTextColor(1, 0.75, 0);
        end;
    else
        EUF_TargetInfoTargetHPPercent:SetText("");
    end;
end 

function EUF_TargetInfoShield_Update(self, button)
    local targetShield = EUF_GetTargetShield();

    if targetShield ~= 0 then
        local targetShieldString;

        if (targetShield < EUF_SHIELD_THRESHOLD_YELLOW) then
            targetShieldString = "|cffffffff" .. targetShield .. "|r";
        elseif  (targetShield < EUF_SHIELD_THRESHOLD_RED) then
            targetShieldString = "|cffffff00" .. targetShield .. "|r";
        else
            targetShieldString = "|cffff0000" .. targetShield .. "|r";
        end;

        EUF_TargetInfoShieldValue:SetText(EUF_TEXT_BROKENSHIELD .. targetShieldString);
    else
        EUF_TargetInfoShieldValue:SetText("");
    end;
end

function EUF_TargetInfoDisplay_Update(self, button)
    EUF_ObjectDisplay_Update(EUF_TargetInfoShield, EUF_CurrentOptions["TARGETINFOBROKENSHIELD"]);
    EUF_ObjectDisplay_Update(EUF_TargetInfo, EUF_CurrentOptions["TARGETINFO"]);
end

function EUF_TargetFrameToTSound_Play()
    if EUF_CurrentOptions["TARGETOTWARNING"] == 1 and (GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0) then
        if (EUF_TOTSELF_SOUND ~= 1) and (UnitIsUnit("player", "targettarget") and UnitCanAttack("target", "player")) or (UnitIsUnit("player", "targettargettarget") and UnitCanAttack("targettarget", "player")) then
            PlaySoundFile("Sound\\Doodad\\BellTollNightElf.wav");
            EUF_TOTSELF_SOUND = 1;
        else
            EUF_TOTSELF_SOUND = 0;
        end;
    end;
end

function EUF_TargetInfoGap_Update(self, button)
    local targetclf = UnitClassification("target");

    if targetclf and targetclf ~= "normal" then
        Place(EUF_TargetInfoTarget, "TOPLEFT", "TargetFrame", "TOPLEFT", 126, -98);
    end;
end

function EUF_GetTargetShield(self, button)
    if EUF_CurrentOptions["TARGETINFOBROKENSHIELD"] == 1 then
        local i, debuffTexture, debuffTimes;

        for i = 1, 16 do
            _, _, debuffTexture, debuffTimes = UnitDebuff("target", i);

            if debuffTexture and debuffTimes and debuffTexture == "Interface\\Icons\\Ability_Warrior_Sunder" then
                return debuffTimes * 450;
            end;
        end;

        return 0;
    else
        return 0;
    end;
end

function EUF_GetUnitInfoString(unit, withLevel, withLevelTag, withRace, withClass, withElite)
    local tempstring = "";
    local isElite = 0;

    if withLevel == 1 then
        local level= UnitLevel(unit);

        if not (level and level >= 1) then
            level = "??";
        end;

        if withLevelTag == 1 then
            level = string.format(EUF_TEXT_LEVELTAG, level);
        end;

        tempstring = tempstring .. level .. " ";
    end;

    if withElite == 1 then
        local unitclf = UnitClassification(unit);

        if unitclf and unitclf ~= "normal" and UnitHealth(unit) > 0 then
            isElite = 1;

            if (unitclf == "elite") then
                tempstring = tempstring .. EUF_TEXT_ELITE .. " ";
            elseif (unitclf == "worldboss") then
                tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_WORLDBOSS .. "|r ";
            elseif (unitclf == "rare") then
                tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_RARE .. "|r ";
            elseif (unitclf == "rareelite") then
                tempstring = tempstring .. "|cffffffff" .. EUF_TEXT_RAREELITE .. "|r ";
            end;
        end;
    end;

    if withRace == 1 and isElite == 0 then
        if UnitRace(unit) and UnitIsPlayer(unit) then
            tempstring = tempstring .. UnitRace(unit) .. " ";
        elseif UnitPlayerControlled(unit) then
            if UnitCreatureFamily(unit) then
                tempstring = tempstring .. UnitCreatureFamily(unit) .. " ";
            end;
        else
            if UnitCreatureType(unit) then
                tempstring = tempstring .. UnitCreatureType(unit) .. " ";
            end;
        end;
    end;

    if withClass == 1 then
        local class = UnitClass(unit);

        if class and UnitIsPlayer(unit) then
            tempstring = tempstring .. class;
        end;
    end;

    return tempstring;
end

function EUF_TargetInfoTarget_OnLoad(this)
    local showmenu = (function()
        ToggleDropDownMenu(1, nil, EUF_TargetInfoTargetDropDown, "EUF_TargetInfoTarget", 40, 0);
    end);

    SecureUnitButton_OnLoad(this, "targettarget", showmenu);
end
