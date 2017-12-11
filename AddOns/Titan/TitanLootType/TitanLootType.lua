-- **************************************************************************
-- * TitanLootType.lua
-- *
-- * By: TitanMod, Dark Imakuni, Adsertor and the Titan Development Team
-- *     (HonorGoG, jaketodd422, joejanko, Lothayer, Tristanian)
-- **************************************************************************

-- ******************************** Constants *******************************
local TITAN_LOOTTYPE_ID = "LootType";
local _G = getfenv(0);
local L = LibStub("AceLocale-3.0"):GetLocale("Titan")
local TitanLootMethod = {};
local updateTable = {TITAN_LOOTTYPE_ID, TITAN_PANEL_UPDATE_ALL};
TitanLootMethod["freeforall"] = {text = L["TITAN_LOOTTYPE_FREE_FOR_ALL"]};
TitanLootMethod["roundrobin"] = {text = L["TITAN_LOOTTYPE_ROUND_ROBIN"]};
TitanLootMethod["master"] = {text = L["TITAN_LOOTTYPE_MASTER_LOOTER"]};
TitanLootMethod["group"] = {text = L["TITAN_LOOTTYPE_GROUP_LOOT"]};
TitanLootMethod["needbeforegreed"] = {text = L["TITAN_LOOTTYPE_NEED_BEFORE_GREED"]};
-- ******************************** Variables *******************************

-- ******************************** Functions *******************************

-- **************************************************************************
-- NAME : TitanPanelLootTypeButton_OnLoad()
-- DESC : Registers the plugin upon it loading
-- **************************************************************************
function TitanPanelLootTypeButton_OnLoad(self)
     self.registry = {
          id = TITAN_LOOTTYPE_ID,
          builtIn = 1,
          version = TITAN_VERSION,
          menuText = L["TITAN_LOOTTYPE_MENU_TEXT"],
          buttonTextFunction = "TitanPanelLootTypeButton_GetButtonText", 
          tooltipTitle = L["TITAN_LOOTTYPE_TOOLTIP"],
          tooltipTextFunction = "TitanPanelLootTypeButton_GetTooltipText",
          icon = "Interface\\AddOns\\Titan\\TitanLootType\\TitanLootType",
          iconWidth = 16,
          savedVariables = {
               ShowIcon = 1,
               ShowLabelText = 1,
               RandomRoll = 100,
               ShowDungeonDiff = false,
          }
     };     

    self:RegisterEvent("PARTY_MEMBERS_CHANGED");
    self:RegisterEvent("PARTY_LOOT_METHOD_CHANGED");
    self:RegisterEvent("CHAT_MSG_SYSTEM");
end

function TitanPanelLootTypeButton_GetDungeonDifficultyText(withpar)
 	local diffstr = "|cffffff9a".._G["UNKNOWN"].."|r"
 	local par1, par2 = "", ""
 	local diff = GetCurrentDungeonDifficulty()
 	if withpar then par1, par2 = "(", ")" end
 	if diff == 1 then 
 		diffstr = _G["GREEN_FONT_COLOR_CODE"]..par1.._G["DUNGEON_DIFFICULTY1"]..par2.."|r"
 	elseif diff == 2 then		
		diffstr = _G["RED_FONT_COLOR_CODE"]..par1.._G["DUNGEON_DIFFICULTY2"]..par2.."|r"
	elseif diff == 3 and _G["DUNGEON_DIFFICULTY3"] then
		diffstr = "|cffa335ee"..par1.._G["DUNGEON_DIFFICULTY3"]..par2.."|r"
	end
	return diffstr
end

-- **************************************************************************
-- NAME : TitanPanelLootTypeButton_OnEvent()
-- DESC : Parse events registered to plugin and act on them
-- **************************************************************************
function TitanPanelLootTypeButton_OnEvent(self, event, ...)
			local arg1 = ...;
			if event == "CHAT_MSG_SYSTEM" then
				-- Match difficulty system message to alert addon for possible update
  			local strm1 = format( _G["ERR_DUNGEON_DIFFICULTY_CHANGED_S"], _G["DUNGEON_DIFFICULTY1"])
  			local strm2 = format( _G["ERR_DUNGEON_DIFFICULTY_CHANGED_S"], _G["DUNGEON_DIFFICULTY2"])
  			local strm3 = format( _G["ERR_DUNGEON_DIFFICULTY_CHANGED_S"], _G["DUNGEON_DIFFICULTY3"])
  			
  			if (arg1 == strm1 or arg1 == strm2 or arg1 == strm3) and TitanGetVar(TITAN_LOOTTYPE_ID, "ShowDungeonDiff") then
  				TitanPanelPluginHandle_OnUpdate(updateTable)
				end
				return;
			end
		 TitanPanelPluginHandle_OnUpdate(updateTable)
end

-- **************************************************************************
-- NAME : TitanPanelLootTypeButton_GetButtonText(id)
-- DESC : Calculate loottype and then display data on button
-- VARS : id = button ID
-- **************************************************************************
function TitanPanelLootTypeButton_GetButtonText(id)
     local lootTypeText, lootThreshold, color, dungeondiff;
     if (GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0) then
          lootTypeText = TitanLootMethod[GetLootMethod()].text;
          lootThreshold = GetLootThreshold();
          color = ITEM_QUALITY_COLORS[lootThreshold];
     else
          lootTypeText = L["TITAN_NA"];
          color = HIGHLIGHT_FONT_COLOR;
     end
     
     if TitanGetVar(TITAN_LOOTTYPE_ID, "ShowDungeonDiff") then
     	dungeondiff = " "..TitanPanelLootTypeButton_GetDungeonDifficultyText(true)
     else
     	dungeondiff = "";
     end
     
     return L["TITAN_LOOTTYPE_BUTTON_LABEL"], TitanUtils_GetColoredText(lootTypeText, color)..dungeondiff;
end

-- **************************************************************************
-- NAME : TitanPanelLootTypeButton_GetTooltipText()
-- DESC : Display tooltip text
-- **************************************************************************
function TitanPanelLootTypeButton_GetTooltipText()
     if (GetNumPartyMembers() > 0) or (GetNumRaidMembers() > 0) then
          local lootTypeText = TitanLootMethod[GetLootMethod()].text;
          local lootThreshold = GetLootThreshold();
          local itemQualityDesc = _G["ITEM_QUALITY"..lootThreshold.."_DESC"];
          local color = ITEM_QUALITY_COLORS[lootThreshold];
          return ""..
          			L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL"]..": \t"..TitanPanelLootTypeButton_GetDungeonDifficultyText().."\n"..
               _G["LOOT_METHOD"]..": \t"..TitanUtils_GetHighlightText(lootTypeText).."\n"..
               _G["LOOT_THRESHOLD"]..": \t"..TitanUtils_GetColoredText(itemQualityDesc, color).."\n"..               
               TitanUtils_GetGreenText(L["TITAN_LOOTTYPE_TOOLTIP_HINT1"]).."\n"..
               TitanUtils_GetGreenText(L["TITAN_LOOTTYPE_TOOLTIP_HINT2"]);
    else
          return L["TITAN_LOOTTYPE_DUNGEONDIFF_LABEL"]..": \t"..TitanPanelLootTypeButton_GetDungeonDifficultyText().."\n"..
          TitanUtils_GetNormalText(ERR_NOT_IN_GROUP).."\n"..
          TitanUtils_GetGreenText(L["TITAN_LOOTTYPE_TOOLTIP_HINT1"]).."\n"..
          TitanUtils_GetGreenText(L["TITAN_LOOTTYPE_TOOLTIP_HINT2"]);
    end
end

-- **************************************************************************
-- NAME : TitanPanelLootType_Random100()
-- DESC : Define random 100 loottype
-- **************************************************************************
function TitanPanelLootType_Random100()
     TitanSetVar(TITAN_LOOTTYPE_ID, "RandomRoll", 100);
end

-- **************************************************************************
-- NAME : TitanPanelLootType_Random1000()
-- DESC : Define random 1000 loottype
-- **************************************************************************
function TitanPanelLootType_Random1000()
	TitanSetVar(TITAN_LOOTTYPE_ID, "RandomRoll", 1000);
end

-- **************************************************************************
-- NAME : TitanPanelLootType_GetRoll(num)
-- DESC : Confirm loottype is random roll
-- **************************************************************************
function TitanPanelLootType_GetRoll(num)
	local temp;
	temp = TitanGetVar(TITAN_LOOTTYPE_ID, "RandomRoll");
	if temp == num then
		return 1;
	end
	return nil;
end

-- **************************************************************************
-- NAME : TitanPanelRightClickMenu_PrepareLootTypeMenu()
-- DESC : Display rightclick menu options
-- **************************************************************************
function TitanPanelRightClickMenu_PrepareLootTypeMenu()
	if UIDROPDOWNMENU_MENU_LEVEL == 2  and UIDROPDOWNMENU_MENU_VALUE == "RandomRoll" then
	local info = {};
 
	info.text = "100";
	info.value = 100;
	info.func = TitanPanelLootType_Random100;
	info.checked = TitanPanelLootType_GetRoll(info.value);
	UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_LEVEL);

	info.text = "1000";
	info.value = 1000;
	info.func = TitanPanelLootType_Random1000;
	info.checked = TitanPanelLootType_GetRoll(info.value);
	UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_LEVEL);
	
 elseif UIDROPDOWNMENU_MENU_LEVEL == 2  and UIDROPDOWNMENU_MENU_VALUE == "SetDungeonDiff" then
 local info = {};
 info.text = _G["GREEN_FONT_COLOR_CODE"].._G["DUNGEON_DIFFICULTY1"].."|r";
 info.func = function() SetDungeonDifficulty(1) end
 info.checked = function() if tonumber(GetCurrentDungeonDifficulty()) == 1 then return true end return false end
 local inParty = 0;
 	if (UnitExists("party1") or UnitInRaid("player")) then
		inParty = 1;
	end
	local isLeader = 0;
	 if (IsPartyLeader() or IsRaidLeader()) then
		isLeader = 1;
	 end
	local inInstance = IsInInstance()
	local playerlevel = UnitLevel("player")
	 if inInstance or (inParty == 1 and isLeader == 0) or playerlevel < 65 then
		info.disabled = 1
	 else
	 	info.disabled = false
	 end
 UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_LEVEL);
 
 info = {}
 info.text = _G["RED_FONT_COLOR_CODE"].._G["DUNGEON_DIFFICULTY2"].."|r";
 info.func = function() SetDungeonDifficulty(2) end
 info.checked = function() if tonumber(GetCurrentDungeonDifficulty()) == 2 then return true end return false end
 local inParty = 0;
 	if (UnitExists("party1") or UnitInRaid("player")) then
		inParty = 1;
	end
	local isLeader = 0;
	 if (IsPartyLeader() or IsRaidLeader()) then
		isLeader = 1;
	 end
	local inInstance = IsInInstance()
	local playerlevel = UnitLevel("player")
	 if inInstance or (inParty == 1 and isLeader == 0) or playerlevel < 65 then
		info.disabled = 1
	 else
	 	info.disabled = false
	 end
 UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_LEVEL);
 
 else
     TitanPanelRightClickMenu_AddTitle(TitanPlugins[TITAN_LOOTTYPE_ID].menuText);
     local info = {};
     TitanPanelRightClickMenu_AddToggleVar(L["TITAN_LOOTTYPE_SHOWDUNGEONDIFF_LABEL"], TITAN_LOOTTYPE_ID, "ShowDungeonDiff")
     info = {}
     info.text = L["TITAN_LOOTTYPE_SETDUNGEONDIFF_LABEL"];
     info.value = "SetDungeonDiff";
     info.hasArrow = 1;     
     UIDropDownMenu_AddButton(info);
     info = {};
		 info.text = L["TITAN_LOOTTYPE_RANDOM_ROLL_LABEL"];
		 info.value = "RandomRoll";
     info.hasArrow = 1;
     UIDropDownMenu_AddButton(info);
     TitanPanelRightClickMenu_AddSpacer();
     TitanPanelRightClickMenu_AddToggleIcon(TITAN_LOOTTYPE_ID);
     TitanPanelRightClickMenu_AddToggleLabelText(TITAN_LOOTTYPE_ID);
     
     TitanPanelRightClickMenu_AddSpacer();
     TitanPanelRightClickMenu_AddCommand(L["TITAN_PANEL_MENU_HIDE"], TITAN_LOOTTYPE_ID, TITAN_PANEL_MENU_FUNC_HIDE);
     end
end

-- **************************************************************************
-- NAME : TitanPanelBagButton_OnClick(button)
-- DESC : Generate random roll on leftclick of button
-- **************************************************************************
function TitanPanelLootTypeButton_OnClick(self, button)
	if button == "LeftButton" then
		RandomRoll(1, TitanGetVar(TITAN_LOOTTYPE_ID, "RandomRoll"));
	end
end
