-- **************************************************************************
-- * TitanMail.lua
-- *
-- * By: dean
-- **************************************************************************
local TITAN_MAIL_ID = "Mail";
--local updateTable = {TITAN_MAIL_ID, TITAN_PANEL_UPDATE_BUTTON} ;
-- ******************************** Variables *******************************
local LT = LibStub("AceLocale-3.0"):GetLocale("Titan")
local AceTimer = LibStub("AceTimer-3.0")

local TITAN_PANEL_MAIL_ICON_NEW = "Interface\\AddOns\\Titan\\TitanMail\\newmail";
local TITAN_PANEL_MAIL_ICON_NOT = "Interface\\AddOns\\Titan\\TitanMail\\nomail";

-- ******************************** Functions *******************************

-- **************************************************************************
-- NAME : TitanPanelMailButton_OnLoad()
-- DESC : Registers the plugin upon it loading
-- **************************************************************************
function TitanPanelMailButton_OnLoad(self)
    self.registry = {
        id = TITAN_MAIL_ID,
        builtIn = 1,
        version = TITAN_VERSION,
        menuText = TITAN_MAIL_MENU_TEXT,
        buttonTextFunction = "TitanPanelMailButton_GetButtonText",
        tooltipTitle = TITAN_MAIL_TOOLTIP,
        tooltipTextFunction = "TitanPanelMailButton_GetTooltipText",
        icon = TITAN_PANEL_MAIL_ICON_NEW,
        iconWidth = 16,
        savedVariables = {
            ShowIcon = 1,
            ShowLabelText = 1,
            ShowColoredText = 1,
            --NewMail = 0,
            --TotalMail = 0,
            HideMm = 1,
            ShowButtonText = 1,
            --ShowCount = 1,
        }
    };

    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    self:RegisterEvent("UPDATE_PENDING_MAIL");
    self:RegisterEvent("MAIL_INBOX_UPDATE");
end

-- **************************************************************************
-- NAME : TitanPanelMailButton_OnEvent()
-- DESC : Parse events registered to plugin and act on them
-- **************************************************************************
function TitanPanelMailButton_OnEvent()
    TitanMailButtonUpdate();
end

function TitanMailButtonUpdate()
	local button = TitanUtils_GetButton(TITAN_MAIL_ID, true);
	if button then
		if (HasNewMail()) then
			button.registry.icon = TITAN_PANEL_MAIL_ICON_NEW;
		else
			button.registry.icon = TITAN_PANEL_MAIL_ICON_NOT;
		end
	end

	TitanPanelButton_UpdateButton(TITAN_MAIL_ID);
end

-- **************************************************************************
-- NAME : TitanPanelMailButton_GetButtonText(id)
-- DESC : Calculate Mail unread then display data on button
-- VARS : id = button ID
-- **************************************************************************
function TitanPanelMailButton_GetButtonText(id)
	local showText = TitanGetVar(TITAN_MAIL_ID,"ShowButtonText");

	local buttonRichText = "";
	if(showText) then
		if ( HasNewMail() ) then
			buttonRichText = TitanUtils_GetGreenText(TITAN_MAIL_BUTTON_LABEL_MAIL);
		else
			buttonRichText = TitanUtils_GetNormalText(TITAN_MAIL_BUTTON_LABEL_NOMAIL);
		end
	end
	return buttonRichText;
end

-- **************************************************************************
-- NAME : TitanPanelMailButton_GetTooltipText()
-- DESC : Display tooltip text
-- **************************************************************************
function TitanPanelMailButton_GetTooltipText()
	local retstr = "";
	retstr = retstr .. "\n";
	if(HasNewMail()) then
		retstr = retstr.. TitanUtils_GetGreenText(TITAN_MAIL_TOOLTIP_HINT1);
		local sender1,sender2,sender3 = GetLatestThreeSenders();
		if( sender1 ) then
			retstr = retstr.."\n"..sender1;
		end
		if( sender2 ) then
			retstr = retstr.."\n"..sender2;
		end
		if( sender3 ) then
			retstr = retstr.."\n"..sender3;
		end
	else
		retstr = TitanUtils_GetGreenText(TITAN_MAIL_TOOLTIP_HINT2);
	end
	return retstr;
end

-- **************************************************************************
-- NAME : TitanPanelRightClickMenu_PrepareMailMenu()
-- DESC : Display rightclick menu options
-- **************************************************************************
function TitanPanelRightClickMenu_PrepareMailMenu()
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_MAIL_ID].menuText);

    local info = {};
	info.text = TITAN_MAIL_MENU_STEXT;
	info.value = "ShowButtonText";
	info.func = TitanMail_Toggle;
	info.checked = TitanGetVar(TITAN_MAIL_ID, "ShowButtonText");
	info.keepShownOnClick = 1;
	UIDropDownMenu_AddButton(info);

    TitanPanelRightClickMenu_AddSpacer();
    TitanPanelRightClickMenu_AddToggleIcon(TITAN_MAIL_ID);
    TitanPanelRightClickMenu_AddToggleLabelText(TITAN_MAIL_ID);
    TitanPanelRightClickMenu_AddToggleColoredText(TITAN_MAIL_ID);

    TitanPanelRightClickMenu_AddSpacer();
    TitanPanelRightClickMenu_AddCommand(LT["TITAN_PANEL_MENU_HIDE"], TITAN_MAIL_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end

function TitanMail_Toggle()
	TitanToggleVar(TITAN_MAIL_ID, this.value);
	TitanMailButtonUpdate();
end
