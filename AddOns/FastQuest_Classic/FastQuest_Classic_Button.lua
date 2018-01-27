-- $Id: FastQuest_Classic_Button.lua 79 2009-05-21 18:19:42Z arithmandar $
--[[
    FastQuest_Class_Button.lua
]]

FastQuest_Classic_BUTTON_TOOLTIP = "Toggle FastQuest_Classic Options Frame";

function FastQuest_Classic_Button_OnClick()
    FQ_Debug_Print("FastQuest_Classic_Button_OnClick()");

    if FastQuestOptionsFrame:IsVisible() then
        HideUIPanel(FastQuestOptionsFrame);
    else
        ShowUIPanel(FastQuestOptionsFrame);
    end
end

function FastQuest_Classic_Button_Init()
    FQ_Debug_Print("FastQuest_Classic_Button_Init()");

    if (FQD.ShowButton) then
        FastQuest_Classic_ButtonFrame:Show();
    else
        FastQuest_Classic_ButtonFrame:Hide();
    end
end

function FastQuest_Classic_Button_Toggle()
    FQ_Debug_Print("FastQuest_Classic_Button_Toggle()");

    if (FastQuest_Classic_ButtonFrame:IsVisible()) then
        FastQuest_Classic_ButtonFrame:Hide();
        FQD.ShowButton = false;
    else
        FastQuest_Classic_ButtonFrame:Show();
        FQD.ShowButton = true;
    end
end

function FastQuest_Classic_Button_UpdatePosition()
    FQ_Debug_Print("FastQuest_Classic_Button_UpdatePosition()");

    FastQuest_Classic_ButtonFrame:SetPoint("TOPLEFT",
        "Minimap",
        "TOPLEFT",
        55 - (75 * cos(FQD.ButtonPos)),
        (75 * sin(FQD.ButtonPos)) - 55);
end

-- Codes adopted from Yatlas
function FastQuest_Classic_BeingDragged()
    local xpos, ypos = GetCursorPosition()
    local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom()

    xpos = xmin - xpos / UIParent:GetScale() + 70
    ypos = ypos / UIParent:GetScale() - ymin - 70

    FastQuest_Classic_SetPosition(math.deg(math.atan2(ypos, xpos)));
end

function FastQuest_Classic_SetPosition(v)
    if (v < 0) then
        v = v + 360;
    end

    FQD.ButtonPos = v;
    FastQuest_Classic_Button_UpdatePosition();
end
