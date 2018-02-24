--[[
Name        : TradeskillInfoFu
Version     : 1.1
Author      : Daviesh (oma_daviesh@hotmail.com)
Description : Adds TradeskillInfoFu to FuBar.
]]

--Invoke libraries
local tablet = AceLibrary("Tablet-2.0");

--Define the plugin
TradeskillInfoFu = AceLibrary("AceAddon-2.0"):new("AceEvent-2.0", "AceDB-2.0", "FuBarPlugin-2.0");
TradeskillInfoFu.title = "TradeskillInfoFu";
TradeskillInfoFu.hasIcon = "Interface\\Icons\\INV_Elemental_Mote_Nether";
TradeskillInfoFu.defaultPosition = "LEFT";
TradeskillInfoFu.defaultMinimapPosition = 200;
TradeskillInfoFu.cannotDetachTooltip = true;

-- Activate menu options to hide icon/text (no point in having the colour option)
TradeskillInfoFu.hasNoColor = true;
TradeskillInfoFu:RegisterDB("TradeskillInfoFuDB");

--Make sure the plugin is the rightt format when activated
function TradeskillInfoFu:OnEnable()
    self:Update();
end

--Define text to display when the cursor mouses over the plugin
function TradeskillInfoFu:OnTooltipUpdate()
    local cat = tablet:AddCategory()
    cat:AddLine("text", TRADESKILLINFOFU_LEFTCLICK)
    cat:AddLine("text", TRADESKILLINFOFU_SHIFTCLICK)
end

--Define what to do when the plugin is clicked
function TradeskillInfoFu:OnClick(button)
    --Left click -> open TradeskillInfo window
    --Shift Left Click -> open TradeskillInfo options
    if IsShiftKeyDown() then
        TradeskillInfo:ConfigToggle();
    else
        TradeskillInfo:UI_Toggle();
    end
end
