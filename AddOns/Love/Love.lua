	------------------------------------------------------------------------------------------
-- Love ver 1.0
-- 日期: 2010-3-29
-- 作者: dugu
-- 描述: 游戏中我们也有真心的朋友, 鱼别丢了, 我永远记得你; 现实中我们有自己心爱的人,
--			愿与之生死相随; 愿大家珍惜这份友情和爱情, 愿世间充满爱.
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
LoveDB = {};
local ident; 
local palyerName;
local playerFaction;
local curRealm;
-----------------
-- 记录好友信息, 并可以导入小号
local db;
local PlayerList = {};
local IMPORT_FRIEND_TEXT = "";
if (GetLocale() == "zhCN") then
	IMPORT_FRIEND_LABEL = "确定将|cFF00FF00>>%s<<|R的好友导入当前角色";
	LOVE_SELECT_NAME = "选择名字";
	LOVE_SET_FOCUS = "◆Shift - 左键设置焦点";
	LOVE_CLEAR_FOCUS = "◆Shift - 右键取消焦点";
	LOVE_FRIEND_LOG_TEXT = "爱心工具";
	LOVE_FRIEND_LOG_TIP = "将所选角色的好友导入当前角色";	
	LOVE_FRIEND_LOG_NONE = "没有 > %s < 的好友信息";
	LOVE_IMPORT_BUTTON_TEXT = "导";
	LOVE_FRIEND_NO_SELECT = "请选择一个角色";
elseif (GetLocale() == "zhTW") then
	IMPORT_FRIEND_LABEL = "確定將|cFF00FF00>>%s<<|R的好友導入當前角色";
	LOVE_SELECT_NAME = "選擇名字";
	LOVE_SET_FOCUS = "Shift - 左鍵設置焦點";
	LOVE_CLEAR_FOCUS = "Shift - 右鍵取消焦點";
	LOVE_FRIEND_LOG_TEXT = "愛心工具";
	LOVE_FRIEND_LOG_TIP = "將所選角色的好友導入當前角色";	
	LOVE_FRIEND_LOG_NONE = "沒有 > %s < 的好友資訊";
	LOVE_IMPORT_BUTTON_TEXT = "導";
	LOVE_FRIEND_NO_SELECT = "請選擇一個角色";
else
	IMPORT_FRIEND_LABEL = "确定将|cFF00FF00>>%s<<|R的好友导入当前角色";
	LOVE_SELECT_NAME = "选择名字";
	LOVE_SET_FOCUS = "Shift - 左键设置焦点";
	LOVE_CLEAR_FOCUS = "Shift - 右键取消焦点";
	LOVE_FRIEND_LOG_TEXT = "love Tool";
	LOVE_FRIEND_LOG_TIP = "Click to inport frinds information";
	LOVE_FRIEND_LOG_NONE = "None infomation about this charactor > %s <";
	LOVE_IMPORT_BUTTON_TEXT = "IM";
	LOVE_FRIEND_NO_SELECT = "请选择一个角色";
end

local frame = CreateFrame("Frame");
frame:RegisterEvent("FRIENDLIST_UPDATE");
frame:RegisterEvent("ADDON_LOADED");

StaticPopupDialogs["IMPORT_FRIEND"] = {
	text = IMPORT_FRIEND_LABEL,
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function(self)
		local name = UIDropDownMenu_GetText(ImPortFriendDropDown);
		ReAddFriends(name);
		self:Hide();
	end,	
	showAlert = 1,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

local function canAdd(name)
	for i, n in ipairs(db) do
		if (n == name) then
			return false;
		end
	end
	return true;
end

local function SaveFriendsInfo()
	local name, level, class, area, connected, status, note;
	local maxNum = GetNumFriends();
	for index=1, maxNum do
		name, level, class, area, connected, status, note = GetFriendInfo(index);
		if (canAdd(name)) then
			table.insert(db, name);
		end
	end
end

local function GetIdentInfo(id)	
	local releam, faction, name = strsplit("_", id);
	return releam, faction, name;
end

local function UpdatePlayerNames()
	local releam, faction, name;	
	for id, v in pairs(LoveDB) do
		releam, faction, name = GetIdentInfo(id);		
		if (releam == curRealm and faction == playerFaction and name ~= palyerName) then
			tinsert(PlayerList, name);
		end
	end
end

function ReAddFriends(name)
	assert(name and type(name) == "string", "Argument #1 must be a string value.");

	local id = name and string.format("%s_%s_%s", curRealm, playerFaction, name) or ident;
	local db = LoveDB[id];
	if (not db or db == {}) then
		print(format(LOVE_FRIEND_LOG_NONE, tostring(id)));
		return;
	end

	for i, name in ipairs(db.FriendsLogDB) do
		AddFriend(name);
	end
end

local dropdown = CreateFrame("Frame", "ImPortFriendDropDown", FriendsListFrame, "UIDropDownMenuTemplate");
--dropdown:SetPoint("BOTTOMLEFT", IgnoreFrameToggleTab2, "BOTTOMRIGHT", -12, -6);
dropdown:SetPoint("BOTTOMLEFT", FriendsFrameStatusDropDown, "BOTTOMRIGHT", 120, -28);
UIDropDownMenu_SetWidth(dropdown, 26);
UIDropDownMenu_SetButtonWidth(dropdown, 24);
UIDropDownMenu_JustifyText(dropdown, "LEFT");
local name, fontHeight, flags = _G[dropdown:GetName().."Text"]:GetFont();
_G[dropdown:GetName().."Text"]:SetFont(name, 12, flags);
UIDropDownMenu_SetText(dropdown, LOVE_SELECT_NAME);

local dText = dropdown:CreateFontString(nil, "OVERLAY");
dText:SetFont(DUOWAN_CHANGELOG_FONT, 11, "OUTLINE");
dText:SetJustifyH("CENTER");
dText:SetTextColor(1, 1, 1);
dText:SetPoint("LEFT", dropdown, "LEFT", 22, 2);
dText:SetText("●");

local button = CreateFrame("Button", nil, FriendsListFrame, "UIPanelButtonTemplate");
button:RegisterForDrag("LeftButton");
button:SetWidth(25);
button:SetHeight(25);
button:SetPoint("LEFT", dropdown, "RIGHT", -15, 2);
button:EnableMouse(true);
button:SetMovable(true);
button:SetText(LOVE_IMPORT_BUTTON_TEXT);
button:SetScript("OnClick", function(self)
	local name = UIDropDownMenu_GetText(dropdown);
	if (LOVE_SELECT_NAME == name) then
		UIErrorsFrame:AddMessage(LOVE_FRIEND_NO_SELECT, 1, 0.2, 0);
	else
		IMPORT_FRIEND_TEXT = format(IMPORT_FRIEND_LABEL, name);
		StaticPopupDialogs["IMPORT_FRIEND"].text = IMPORT_FRIEND_TEXT;
		StaticPopup_Show("IMPORT_FRIEND");	
	end	
end);
button:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(LOVE_FRIEND_LOG_TEXT);
	GameTooltip:AddLine(LOVE_FRIEND_LOG_TIP, 1, 1, 1);	
	GameTooltip:Show();
end);
button:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end);
button:SetScript("OnDragStart", function(self)
	self:StartMoving();
end);
button:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing();
end);

frame:SetScript("OnEvent", function(self, event, name)
	if (event == "ADDON_LOADED" and name == "Love") then
		self:UnregisterEvent("ADDON_LOADED");
		palyerName = UnitName("player");
		curRealm = GetCVar("realmName");
		playerFaction = UnitFactionGroup("player");
		
		ident =  string.format("%s_%s_%s", curRealm, playerFaction, palyerName);
		LoveDB = LoveDB or {};
		LoveDB[ident] = LoveDB[ident] or {};
		LoveDB[ident].FriendsLogDB = LoveDB[ident].FriendsLogDB or {};
		db = LoveDB[ident].FriendsLogDB;
		SaveFriendsInfo();
		UpdatePlayerNames();
		
		UIDropDownMenu_Initialize(dropdown, function()	
			local info = UIDropDownMenu_CreateInfo();
			for i=1, #(PlayerList) do
				info.text = PlayerList[i];
				info.func = function(self)
					UIDropDownMenu_SetSelectedID(dropdown, self:GetID());					
				end;
				info.checked = nil;
				UIDropDownMenu_AddButton(info);
			end
		end);

		if (#(PlayerList) == 0) then
			UIDropDownMenu_DisableDropDown(dropdown);
			button:Disable();
		end
	elseif (event == "FRIENDLIST_UPDATE") then
		SaveFriendsInfo();
	end
end)

-- 接口
function Love_ImportFriend_Toggle(switch)
	if (switch) then
		button:Show();
		dropdown:Show();
	else
		button:Hide();
		dropdown:Hide();
	end
end
-----------------------------
-- 便捷焦点功能

local focusenabled = false;
local focusshowtip = false;
function Love_UnitFrame_OnEnter(self)
	if (focusenabled  and focusshowtip) then	
		if (self:GetName() == "TargetFrame") then
			GameTooltip:AddLine(LOVE_SET_FOCUS, 0, 0.68, 0.85);					
		elseif (self:GetName() == "TgFocusFrame" or self:GetName() == "FocusFrame") then
			GameTooltip:AddLine(LOVE_CLEAR_FOCUS, 0, 0.68, 0.85);	
		end
		
		GameTooltip:Show();	
	end	
end

hooksecurefunc("UnitFrame_OnEnter", Love_UnitFrame_OnEnter);
TargetFrame:HookScript("OnEnter", Love_UnitFrame_OnEnter);
FocusFrame:HookScript("OnEnter", Love_UnitFrame_OnEnter);

FocusFrame:HookScript("OnDragStart", function(self)
	if (FOCUS_FRAME_LOCKED) then
		if (IsShiftKeyDown()) then
			self:StartMoving();
		end
	end
end);

FocusFrame:HookScript("OnDragStop", function(self)
	self:StopMovingOrSizing();
	ValidateFramePosition(self, 25);
end);

function Love_QuickFocus_Toggle(switch)
	if (switch) then
		TargetFrame:SetAttribute("shift-type1", "focus");				
		--TgFocusFrame:SetAttribute("shift-type2", "macro");
		--TgFocusFrame:SetAttribute("macrotext", "/clearfocus");	
		FocusFrame:SetAttribute("shift-type2", "macro");
		FocusFrame:SetAttribute("macrotext", "/clearfocus");	
		focusenabled = true;
	else
		TargetFrame:SetAttribute("shift-type1", "");		
		--TgFocusFrame:SetAttribute("shift-type2", "");
		--TgFocusFrame:SetAttribute("macrotext", "");	
		FocusFrame:SetAttribute("shift-type2", "");
		FocusFrame:SetAttribute("macrotext", "");	
		focusenabled = false;
	end
end

function Love_QuickFocus_ShowTip(switch)
	if (switch) then
		focusshowtip = true;
	else
		focusshowtip = false;
	end
end

------------------------
-- 双采功能
local enableshuangcai = false;
local tracking_time = 0; 
local tracking_count = 0;
local DW_FINDING_HERB, DW_FINDING_MINING;
local tracking_herb, tracking_mining;
local curtacking = "mining";
if (GetLocale() == "zhCN") then
	DW_FINDING_HERB = "寻找草药";
	DW_FINDING_MINING = "寻找矿物";
elseif (GetLocale() == "zhTW") then
	DW_FINDING_HERB = "尋找草藥";
	DW_FINDING_MINING = "尋找礦物";
else
	DW_FINDING_HERB = "Find Herbs";
	DW_FINDING_MINING = "Find Minerals";
end

local frame = CreateFrame("Frame", nil, UIParent);
local function Love_ShuangCai_OnUpdate(self, elapsed)
	if (enableshuangcai) then
		tracking_time = tracking_time + elapsed;
		if (tracking_time > 3) then	
			tracking_time = 0;

			local count = GetNumTrackingTypes();
			if (tracking_count ~= count) then
				local name;
				tracking_herb, tracking_mining = false, false; 
				for i=1, count do
					name = GetTrackingInfo(i);
					if (name == DW_FINDING_HERB) then
						tracking_herb = i;
					elseif (name == DW_FINDING_MINING) then
						tracking_mining = i;
					end
				end
				tracking_count = count;
			end
			
			if (tracking_herb and tracking_mining) then
				if (curtacking == "mining") then
					local start, duration, enabled = GetSpellCooldown(DW_FINDING_MINING); 
					local spell = UnitCastingInfo("player"); 
					local combat = UnitAffectingCombat("player"); 
					if (not (combat or spell or (start and duration and start > 0 and duration > 0))) then
						SetTracking(tracking_mining); 
						curtacking = "herb"; 
					end
				else
					local start, duration, enabled = GetSpellCooldown(DW_FINDING_HERB); 
					local spell = UnitCastingInfo("player"); 
					local combat = UnitAffectingCombat("player"); 
					if (not (combat or spell or (start and duration and start > 0 and duration > 0))) then
						SetTracking(tracking_herb); 
						curtacking = "mining"; 
					end
				end				
			end
		end
	end
end

frame:SetScript("OnUpdate", Love_ShuangCai_OnUpdate);

function Love_ShuangCai_Toggle(switch)
	enableshuangcai = switch;
end
