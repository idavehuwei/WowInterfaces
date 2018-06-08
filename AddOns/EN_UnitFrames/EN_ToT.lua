function ETT_OnUpdate(self, elapsed)
    if EUF_CurrentOptions["TARGETTARGETFRAME"] == 1 and UnitIsVisible("targettarget") then
        ETT_TargetTargetFrame:SetAlpha(1);
    else
        ETT_TargetTargetFrame:SetAlpha(0);
    end;

    if EUF_CurrentOptions["TARGETTARGETFRAME"] == 1 and EUF_CurrentOptions["TARGETTARGETTARGETFRAME"] == 1 and UnitIsVisible("targettargettarget") then
        ETT_TargetTargetTargetFrame:SetAlpha(1);
    else
        ETT_TargetTargetTargetFrame:SetAlpha(0);
    end;
end

function ETT_TargetTargetFrame_OnUpdate(self, elapsed)
    ETT_TargetTargetFrameName:SetText(UnitName("targettarget"));

    local color = PowerBarColor[UnitPowerType("targettarget")];

    if not color then
        -- couldn't find a power token entry...default to indexing by power type or just mana if we don't have that either
        color = PowerBarColor[UnitPowerType("targettarget")] or PowerBarColor["MANA"];
    end;

    ETT_TargetTargetFrameManaBar:SetStatusBarColor(color.r, color.g, color.b);
    SetPortraitTexture(ETT_TargetTargetFramePortrait, "targettarget");

    if UnitHealthMax("targettarget") == 0 then
        ETT_TargetTargetFrameHealthBar:SetValue(0);
    else
        ETT_TargetTargetFrameHealthBar:SetValue(UnitHealth("targettarget") / UnitHealthMax("targettarget") * 100);
    end;

    if UnitManaMax("targettarget") == 0 then
        ETT_TargetTargetFrameManaBar:SetValue(0);
    else
        ETT_TargetTargetFrameManaBar:SetValue(UnitMana("targettarget") / UnitManaMax("targettarget") * 100);
    end;
end

function ETT_TargetTargetTargetFrame_OnUpdate(self, elapsed)
    ETT_TargetTargetTargetFrameName:SetText(UnitName("targettargettarget"));

    local color = PowerBarColor[UnitPowerType("targettargettarget")];

    if not color then
        -- couldn't find a power token entry...default to indexing by power type or just mana if we don't have that either
        color = PowerBarColor[UnitPowerType("targettargettarget")] or PowerBarColor["MANA"];
    end;

    ETT_TargetTargetTargetFrameManaBar:SetStatusBarColor(color.r, color.g, color.b);
    SetPortraitTexture(ETT_TargetTargetTargetFramePortrait, "targettargettarget");

    if UnitHealthMax("targettargettarget") == 0 then
        ETT_TargetTargetTargetFrameHealthBar:SetValue(0);
    else
        ETT_TargetTargetTargetFrameHealthBar:SetValue(UnitHealth("targettargettarget") / UnitHealthMax("targettargettarget") * 100);
    end;

    if UnitManaMax("targettargettarget") == 0 then
        ETT_TargetTargetTargetFrameManaBar:SetValue(0);
    else
        ETT_TargetTargetTargetFrameManaBar:SetValue(UnitMana("targettargettarget") / UnitManaMax("targettargettarget") * 100);
    end;
end

function ETT_TargetTargetFrame_OnLoad(this)
    this:RegisterForClicks("AnyUp");
    this:RegisterForDrag("LeftButton");

    local showmenu = (function()
        ToggleDropDownMenu(1, nil, ETT_TargetTargetFrameDropDown, "ETT_TargetTargetFrame", 40, 0);
    end);

    SecureUnitButton_OnLoad(this, "targettarget", showmenu);
end

function ETT_TargetTargetTargetFrame_OnLoad(this)
    local showmenu = (function()
        ToggleDropDownMenu(1, nil, ETT_TargetTargetTargetFrameDropDown, "ETT_TargetTargetTargetFrame", 40, 0);
    end);

    SecureUnitButton_OnLoad(this, "targettargettarget", showmenu);
end

function ETT_TargetTargetFrame_DragStart(self, button)
    if EUF_CurrentOptions["MOVINGTARGETTARGETFRAME"] == 1 and button == "LeftButton" then
        ETT_TargetTargetFrame:StartMoving();
    end;
end

function ETT_TargetTargetFrame_DragStop(self, button)
    ETT_TargetTargetFrame:StopMovingOrSizing();
end
