-- **************************************************************************
-- * TitanTrack.lua
-- *
-- * By: dean
-- **************************************************************************
local TITAN_TRACK_ID = "Track";
local updateTable = {TITAN_TRACK_ID, TITAN_PANEL_UPDATE_BUTTON} ;
-- ******************************** Variables *******************************
local LT = LibStub("AceLocale-3.0"):GetLocale("Titan")
local AceTimer = LibStub("AceTimer-3.0")
local TrackTimer = nil;
local tracksNum = 0;
-- ******************************** Functions *******************************

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnLoad()
-- DESC : Registers the plugin upon it loading
-- **************************************************************************

function TitanPanelTrackButton_OnLoad(self)
        self.registry = {
             id = TITAN_TRACK_ID,
             builtIn = 1,
             version = TITAN_VERSION,
             menuText = TITAN_TRACK_MENU_TEXT,
             --buttonTextFunction = "TitanPanelTrackButton_GetButtonText",
             tooltipTitle = TITAN_TRACK_TOOLTIP,
             tooltipTextFunction = "TitanPanelTrackButton_GetTooltipText",
             icon = "Interface\\Minimap\\Tracking\\None",
	     iconWidth = 16,
             savedVariables = {
                  ShowIcon = 1,
                  --ShowLabelText = 1,
                  ShowColoredText = 1,
		  DisplayOnRightSide = true,
		  CurrentTrackName = NONE,
          }
     };
	self:RegisterEvent("MINIMAP_UPDATE_TRACKING");
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnEvent()
-- DESC : Parse events registered to plugin and act on them
-- **************************************************************************
function TitanPanelTrackButton_OnEvent(self, event, ...)
	if (event == "MINIMAP_UPDATE_TRACKING" ) then
		if ( TitanPanelTrackButton:IsVisible() and not TrackTimer )then
     			TrackTimer = AceTimer.ScheduleTimer("TitanPanelTrack", TitanPanelTrackButton_OnUpdate,0.1,updateTable)
		else
			TitanPanelTrackButton_OnUpdate(updateTable);
		end
	end
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnClick()
-- DESC : Left click for checking tracking menu
-- **************************************************************************
function TitanPanelTrackButton_OnClick(self)
	GameTooltip:Hide();
	ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, self:GetName(), 0, -5);
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnUpdate()
-- DESC : Update button
-- **************************************************************************
local function TitanPanelTrackUpdate()
	if tracksNum == 0 then
		tracksNum = GetNumTrackingTypes();
	end
	local texture = GetTrackingTexture();
	local button  = TitanUtils_GetButton(TITAN_TRACK_ID, true);
	if button then
		button.registry.icon = texture;
	end
	--TitanSetVar(TITAN_TRACK_ID, "CurrentTexture", texture);
	local currentName;
	for id=1,tracksNum do
		local name,temptexture = GetTrackingInfo(id);
		if temptexture == texture then
			currentName = name;
			break;
		end
	end
	if not currentName then
		currentName = NONE;
	end
	TitanSetVar(TITAN_TRACK_ID, "CurrentTrackName",currentName);
end

function TitanPanelTrackButton_OnUpdate(table)
	TitanPanelTrackUpdate();
	TitanPanelPluginHandle_OnUpdate(table)
	AceTimer.CancelAllTimers("TitanPanelTrack")
	TrackTimer = nil;
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnShow()
-- DESC : Display button when plugin is visible
-- **************************************************************************
function TitanPanelTrackButton_OnShow()
	if ( TitanPanelTrackButton:IsVisible() and not TrackTimer ) then
		TrackTimer = AceTimer.ScheduleTimer("TitanPanelTrack", TitanPanelTrackButton_OnUpdate,0.1, updateTable);
	end
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_OnHide()
-- DESC : Destroy repeating timer when plugin is hidden
-- **************************************************************************
function TitanPanelTrackButton_OnHide()
	AceTimer.CancelTimer("TitanPanelTrack", TrackTimer, true)
	TrackTimer = nil;
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_GetButtonText(id)
-- DESC : Get tracking name and texture then display data on button
-- VARS : id = button ID
-- **************************************************************************
function TitanPanelTrackButton_GetButtonText(id)
	local button, id = TitanUtils_GetButton(id, true);
        return TITAN_TRACK_BUTTON_LABEL;
end

-- **************************************************************************
-- NAME : TitanPanelTrackButton_GetTooltipText()
-- DESC : Display tooltip text
-- **************************************************************************
function TitanPanelTrackButton_GetTooltipText()
	local trackName = TitanGetVar(TITAN_TRACK_ID,"CurrentTrackName");
	local toolText;

	toolText = TITAN_TRACK_TOOLTIP_HINT2.."\t"..TitanUtils_GetHighlightText(trackName).."\n"..
		TitanUtils_GetGreenText(TITAN_TRACK_TOOLTIP_HINT1);
	return toolText;
end

-- **************************************************************************
-- NAME : TitanPanelRightClickMenu_PrepareTrackMenu()
-- DESC : Display rightclick menu options
-- **************************************************************************
function TitanPanelRightClickMenu_PrepareTrackMenu()
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_TRACK_ID].menuText);
    --[[
     local info = {};
     info.text = LT["TITAN_BAG_MENU_SHOW_USED_SLOTS"];
     info.func = TitanPanelBagButton_ShowUsedSlots;
     info.checked = TitanGetVar(TITAN_BAG_ID, "ShowUsedSlots");
     UIDropDownMenu_AddButton(info);


     info = {};
     info.text = LT["TITAN_BAG_MENU_IGNORE_PROF_BAGS_SLOTS"];
     info.func = TitanPanelBagButton_ToggleIgnoreProfBagSlots;
     info.checked = TitanUtils_Toggle(TitanGetVar(TITAN_BAG_ID, "CountProfBagSlots"));
     UIDropDownMenu_AddButton(info);
--]]
       TitanPanelRightClickMenu_AddSpacer();
       TitanPanelRightClickMenu_AddToggleIcon(TITAN_TRACK_ID);
       TitanPanelRightClickMenu_AddToggleLabelText(TITAN_TRACK_ID);
       TitanPanelRightClickMenu_AddToggleColoredText(TITAN_TRACK_ID);

       TitanPanelRightClickMenu_AddSpacer();
       TitanPanelRightClickMenu_AddCommand(LT["TITAN_PANEL_MENU_HIDE"], TITAN_TRACK_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end
