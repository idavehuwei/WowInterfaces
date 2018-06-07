-- **************************************************************************
-- * TitanWinterTimer.lua
-- *
-- * By: dugu
-- **************************************************************************

local TITAN_WINTERTIMER_ID = "WinterTimer";
local TITAN_WT_FREQUENCY = 0.5;
local updateTable = {TITAN_WINTERTIMER_ID, TITAN_PANEL_UPDATE_BUTTON} ;
local AceTimer = LibStub("AceTimer-3.0")

if (GetLocale() == "zhCN") then
	TITAN_WINTERTIMER_WARNING_TEXT = "距冬拥湖战斗开始还有>>%s<<分钟";
	TITAN_WINTERTIMER_START = "战斗中...";
	TITAN_WINTERTIMER_BEGIN_TEXT = "冬拥湖战斗开始";
	TITAN_WINTERTIMER_TOOLTIP_TEXT = "显示距冬拥湖战斗开始的时间";
elseif (GetLocale() == "zhTW") then
	TITAN_WINTERTIMER_WARNING_TEXT = "距冬擁湖戰鬥開始還有>>%s<<分鐘";
	TITAN_WINTERTIMER_START = "戰鬥中...";
	TITAN_WINTERTIMER_BEGIN_TEXT = "冬擁湖戰鬥開始";
	TITAN_WINTERTIMER_TOOLTIP_TEXT = "顯示距冬擁湖戰鬥開始的時間";
else
	TITAN_WINTERTIMER_WARNING_TEXT = "距冬拥湖战斗开始还有>>%s<<分钟";
	TITAN_WINTERTIMER_START = "战斗中...";
	TITAN_WINTERTIMER_BEGIN_TEXT = "冬拥湖战斗开始";
	TITAN_WINTERTIMER_TOOLTIP_TEXT = "显示距冬拥湖战斗开始的时间";
end

function TitanWinterTimerButton_OnLoad(self)
	self.registry = {
		id = TITAN_WINTERTIMER_ID,
		builtIn = 1,
		version = TITAN_VERSION,
		menuText = TITAN_WINTERTIMER_MENU_TEXT,
		buttonTextFunction = "TitanWinterTimerButton_GetButtonText",
		tooltipTitle = TITAN_WINTERTIMER_TOOLTIP,
		tooltipTextFunction = "TitanWinterTimerButton_GetTooltipText",
		icon = "Interface\\Icons\\Spell_Frost_WizardMark",
		iconWidth = 16,
		savedVariables = {
			ShowIcon = 1,	
			ShowColoredText = 1,
			DisplayOnRightSide = false,
		}
	};	
end

function TitanWinterTimerButton_OnUpdate(self, elapsed)
	TITAN_WT_FREQUENCY = TITAN_WT_FREQUENCY - elapsed;
	if (TITAN_WT_FREQUENCY < 0) then
		TITAN_WT_FREQUENCY = 0.5;
		TitanPanelPluginHandle_OnUpdate(updateTable)
	end
end

function TitanWinterTimerButton_OnShow(self)
	
end

function TitanWinterTimerButton_OnHide(self)
	
end

function TitanWinterTimer_Warning(value)
	if (value == "0:15:00") then
		RaidNotice_AddMessage(RaidBossEmoteFrame, format(TITAN_WINTERTIMER_WARNING_TEXT, TitanUtils_GetGreenText("15")), ChatTypeInfo["RAID_WARNING"]);
	elseif (value == "0:05:00") then
		RaidNotice_AddMessage(RaidBossEmoteFrame, format(TITAN_WINTERTIMER_WARNING_TEXT, TitanUtils_GetGreenText("5")), ChatTypeInfo["RAID_WARNING"]);
	elseif (value == "0:00:01") then
		RaidNotice_AddMessage(RaidBossEmoteFrame, TITAN_WINTERTIMER_BEGIN_TEXT, ChatTypeInfo["RAID_WARNING"]);
	end	
end

function TitanWinterTimerButton_OnClick(self)
	GameTooltip:Hide();	
end

local function TWT_ConvertTime(value)
	local hours = floor(value / 3600)
	local minutes = value - (hours * 3600)
	minutescorrupt = floor(minutes / 60)
	if(minutescorrupt < 10)then minutesfixed = "0"..minutescorrupt..""
	else minutesfixed = minutescorrupt end
	local seconds = floor(value - ((hours * 3600) + (minutescorrupt * 60)))
	if(seconds < 10)then secondsfixed = "0"..seconds..""
	else secondsfixed = seconds end
	if (hours > 0) then
		return hours..":"..minutesfixed..":"..secondsfixed
	elseif (minutescorrupt > 0) then
		return "0:"..minutesfixed..":"..secondsfixed
	else
		return "0:00:"..secondsfixed
	end
end

function TitanWinterTimerButton_GetButtonText()
	local timeText;
	if (GetWintergraspWaitTime()) then
		timeText = TWT_ConvertTime(GetWintergraspWaitTime());
		TitanWinterTimer_Warning(timeText);
	else
		if(IsInInstance())then
			timeText = "|cff00CC00  N/A|r";
		else
			timeText = "|cff00CC00"..TITAN_WINTERTIMER_START.."|r";
		end
	end

	return timeText;
end

function TitanWinterTimerButton_GetTooltipText()
	return TitanUtils_GetGreenText(TITAN_WINTERTIMER_TOOLTIP_TEXT);	
end

function TitanPanelRightClickMenu_PrepareWinterTimerMenu()
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_WINTERTIMER_ID].menuText);

	TitanPanelRightClickMenu_AddSpacer();     
	TitanPanelRightClickMenu_AddToggleIcon(TITAN_WINTERTIMER_ID);
	TitanPanelRightClickMenu_AddToggleLabelText(TITAN_WINTERTIMER_ID);
	TitanPanelRightClickMenu_AddToggleColoredText(TITAN_WINTERTIMER_ID);
     
	TitanPanelRightClickMenu_AddSpacer();
	TitanPanelRightClickMenu_AddCommand(L["TITAN_PANEL_MENU_HIDE"], TITAN_WINTERTIMER_ID, TITAN_PANEL_MENU_FUNC_HIDE);
end
