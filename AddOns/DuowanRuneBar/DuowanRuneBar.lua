
local EnableDkMod = true;
local UpdateAlphaFlag = true;
local hasUnitFrameAddon = false;
local UnitFrameAddOns = { "EN_UnitFrames" };

local Dropdown_Options = {
    {
        text = RUNEFRAME_MENU_TITLE_TEXT,
        notCheckable = true,
        isTitle = true,
    },
    {
        text = RUNEFRAME_MENU_SCALE_TEXT,
        arg1 = 0.5, -- min value
        arg2 = 2, -- max value
        notCheckable = true,
        func = function(self, arg1, arg2)
            Duowan_ShowPopRange(arg1,
                arg2,
                dwRawGetCVar("DuowanConfig", "RuneFrameScale", 1),
                0.05,
                true,
                function(value)
                    dwSetScale(RuneFrame, value);
                    dwSetCVar("DuowanConfig", "RuneFrameScale", value);
                end,
                nil,
                function(value)
                    dwSetCVar("DuowanConfig", "RuneFrameScale", value);
                end,
                nil);
        end,
    },
    {
        text = CANCEL,
        notCheckable = true,
        func = function()
        end,
    },
};

local function CheckUnitFrameAddons()
    local name, title, notes, enabled;
    if (hasUnitFrameAddon) then
        return true;
    end
    for k, n in pairs(UnitFrameAddOns) do
        name, title, notes, enabled = GetAddOnInfo(n);
        if (name and enabled) then
            hasUnitFrameAddon = true;
            return true;
        end
    end

    return false;
end

local function SaveCurrentRuneFramePos()
    local pos = {}
    local point, relativeTo, relativePoint, xOfs, yOfs = RuneFrame:GetPoint()
    if (relativeTo ~= nil) then
        pos = { point, relativeTo:GetName(), relativePoint, xOfs, yOfs };
    else
        pos = { point, nil, relativePoint, xOfs, yOfs };
    end
    dwSetCVar("DuowanConfig", "RuneFramePos", pos);
end

local function Place(obj, ...)
    obj:ClearAllPoints();
    obj:SetPoint(...);
end

local function LoadRuneFramePos()
    local pos = dwRawGetCVar("DuowanConfig", "RuneFramePos", nil);
    if (pos and type(pos) == "table" and not RuneFrame.isMoving) then
        Place(RuneFrame, unpack(pos))
    end
end

local function RuneFrameOnStartMove()
    dwSetCVar("DuowanConfig", "isRuneFrameMove", 1);
    RuneFrame:SetMovable(true);
    RuneFrame:StartMoving();
    RuneFrame.isMoving = true;
end

local function RuneFrameOnStopMove()
    SaveCurrentRuneFramePos();
    RuneFrame:StopMovingOrSizing();
    RuneFrame.isMoving = false;
end

function DuowanRuneBar_Update()
    local value = dwRawGetCVar("DuowanConfig", "isRuneFrameMove", 0);

    if (EnableDkMod) then
        dwSetCVar("DuowanConfig", "RuneFrameScale", 1.2);
        if (value == 0) then
            Place(RuneFrame, "BOTTOM", "UIParent", "BOTTOM", 0, 175)
        else
            LoadRuneFramePos();
        end
    else
        dwSetCVar("DuowanConfig", "RuneFrameScale", 1);
        dwSetCVar("DuowanConfig", "isRuneFrameMove", 0);
        if (CheckUnitFrameAddons()) then
            if (EUF_CanXPBarShow) then
                if (EUF_CanXPBarShow() == 1) then
                    Place(RuneFrame, "TOP", "PlayerFrame", "BOTTOM", 64, 20);
                else
                    Place(RuneFrame, "TOP", "PlayerFrame", "BOTTOM", 64, 30);
                end
            end
        end
    end

    local scale = dwRawGetCVar("DuowanConfig", "RuneFrameScale", 1);
    dwSetScale(RuneFrame, scale);
end

function DuowanRuneBar_OnUpdate(self, elapsed)
    self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed
    if (self.TimeSinceLastUpdate > 0.05) then
        if (UpdateAlphaFlag) then
            if (UnitExists("target")) then
                RuneFrame:SetAlpha(1);
            else
                RuneFrame:SetAlpha(0.2);
            end
        else
            RuneFrame:SetAlpha(1);
        end

        self.TimeSinceLastUpdate = 0;
    end
end

function DuowanRuneBar_OnLoad(this)
    this:RegisterEvent("PLAYER_ENTERING_WORLD");
    this:RegisterEvent("VARIABLES_LOADED");
    this:RegisterEvent("ADDON_LOADED");
    this:RegisterEvent("PLAYER_LOGIN");

    local _, class = UnitClass("player");
    if (class ~= "DEATHKNIGHT" or dwRuneFrameHasOtherAddOn()) then
        return;
    end

    for i = 1, 6 do
        local rune = _G["RuneButtonIndividual" .. i];
        rune:RegisterForClicks("LeftButtonDown", "RightButtonDown");
        rune:SetScript("OnMouseDown", function(self, button)
            if (not (EnableDkMod and IsShiftKeyDown())) then
                return;
            end

            if (button == "LeftButton") then
                RuneFrameOnStartMove();
            end
        end);
        DWEasyMenu_Register(rune, Dropdown_Options);
        rune:SetScript("OnMouseUp", function(self, button)
            if (RuneFrame.isMoving) then
                RuneFrameOnStopMove();
            end
        end);
    end

    hooksecurefunc("RuneButton_OnEnter", function(self)
        if (EnableDkMod) then
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
            GameTooltip:ClearLines();
            GameTooltip:SetText(self.tooltipText);
            GameTooltip:AddLine("|cff00aeff" .. RUNEFRAME_MENU_TIP_TEXT1 .. "|r");
            GameTooltip:Show();
        end
    end);

    hooksecurefunc("UnitFrame_SetUnit", function(self, unit, healthbar, manabar)
        if ((self == PlayerFrame or self == PetFrame) and unit == "player") then
            DuowanRuneBar_Update();
        end
    end)
end

function DuowanRuneBar_OnEvent(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        DuowanRuneBar_Update();
    end
end

function DuowanRuneBar_Enable(switch)
    if (switch) then
        EnableDkMod = true;
    else
        EnableDkMod = false;
    end
    dwSetCVar("DuowanConfig", "EnableDkMod", EnableDkMod);
    DuowanRuneBar_Update();
end

function DuowanRuneBar_AlphaToggle(switch)
    if (switch) then
        UpdateAlphaFlag = true;
    else
        UpdateAlphaFlag = false;
    end
end
