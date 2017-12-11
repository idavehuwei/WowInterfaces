------------------------------------------------------------------------------
-- MainMenu ver 1.0
-- 日期: 2010年6月27日
-- 作者: dugu@bigfoot
-- 描述: 扩展系统的菜单栏, 加入自定义菜单项
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------
MainMenu = LibStub("AceAddon-3.0"):NewAddon("MainMenu", "AceHook-3.0", "AceEvent-3.0");
local L = {};
if (GetLocale() == "zhCN") then
	L["副本掉落"] = "副本掉落";
	L["多玩DKP"] = "多玩DKP";
	L["多玩移动"] = "多玩移动";
	L["多玩组队"] = "多玩组队";
	L["伤害统计"] = "伤害统计";
	L["仇恨统计"] = "仇恨统计";
	L["交易记录"] = "交易记录";
elseif (GetLocale() == "zhTW") then
	L["副本掉落"] = "副本掉落";
	L["多玩DKP"] = "多玩DKP";
	L["多玩移动"] = "多玩移動";
	L["多玩组队"] = "多玩組隊";
	L["伤害统计"] = "傷害統計";
	L["仇恨统计"] = "仇恨統計";
	L["交易记录"] = "交易記錄";
else
	L["副本掉落"] = "AtlasLoot";
	L["多玩DKP"] = "Duowan DKP";
	L["多玩移动"] = "Duowan Move";
	L["多玩组队"] = "sskfdlsa";
	L["伤害统计"] = "Recount";
	L["仇恨统计"] = "Omen";
	L["交易记录"] = "Trade Log";
end

function MainMenu:OnInitialize()
	self:AjustMainMenu();	
	self:CreatePageInfo();
	self:CreateMainMenu();
	self:CreatePagebutton();
	self:SecureHook("AchievementMicroButton_Update");
	self:SecureHook("UpdateTalentButton");
end

function MainMenu:OnEnable()
end

function MainMenu:OnDisable()
end

function MainMenu:AchievementMicroButton_Update()	
	if ( not CanShowAchievementUI() ) then
		AchievementMicroButton:Show();
		AchievementMicroButton:Disable();
		QuestLogMicroButton:SetPoint("BOTTOMLEFT", "AchievementMicroButton", "BOTTOMRIGHT", -4, 0);
	else
		AchievementMicroButton:Enable();
	end
end

function MainMenu:UpdateTalentButton()
	if ( UnitLevel("player") < 10 ) then
		TalentMicroButton:Show();
		TalentMicroButton:Disable();
		AchievementMicroButton:SetPoint("BOTTOMLEFT", "TalentMicroButton", "BOTTOMRIGHT", -4, 0);
	else
		TalentMicroButton:Enable();
	end
end
------------------
-- 调整菜单栏间距等
local MAINMENU_PATH = "Interface\\AddOns\\Duowan\\Modules\\MainMenu\\Texture\\";
local CurentPage = 1;
local microbuttons = {
	[1] = "CharacterMicroButton",
	[2] = "SpellbookMicroButton",
	[3] = "TalentMicroButton",
	[4] = "AchievementMicroButton",
	[5] = "QuestLogMicroButton",
	[6] = "SocialsMicroButton",
	[7] = "PVPMicroButton",
	[8] = "LFGMicroButton",
	[9] = "MainMenuMicroButton",
	[10] = "HelpMicroButton",
};

function MainMenu:AjustMainMenu()	
	local lastButton;
	for index, name in ipairs(microbuttons) do
		_G[name]:ClearAllPoints();
		if (index == 1) then
			_G[name]:SetPoint("TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 548, 8);
		else
			_G[name]:SetPoint("LEFT", lastButton, "RIGHT", -4, 0);
		end
		lastButton = name;
	end
end

function MainMenu:CreatePagebutton()
	local up, down;
	local pageButton = CreateFrame("Button", "MainMenuBarPageButton", MainMenuBarArtFrame);
	pageButton:SetWidth(28); 
	pageButton:SetHeight(58);
	pageButton:SetPoint("BOTTOMLEFT", "HelpMicroButton", "BOTTOMRIGHT", -6, 0);
		
	up = CreateFrame("Button", "MainMenuBarUpButton", pageButton);
	down = CreateFrame("Button", "MainMenuBarDownButton", pageButton);

	up:SetWidth(32);
	up:SetHeight(32);
	up:SetPoint("LEFT", pageButton, "LEFT", 0, -3);
	up:SetHitRectInsets(6, 6, 7, 7);
	up:SetNormalTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollUpButton-Up");
	up:SetPushedTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollUpButton-Down");
	up:SetDisabledTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollUpButton-Up");
	up:GetDisabledTexture():SetDesaturated(true);
	up:SetHighlightTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollUpButton-Highlight", "ADD");	
	up:SetScript("OnClick", function()
		self:SetPage(2);
		up:Disable();
		down:Enable();
	end);
	
	down:SetWidth(32);
	down:SetHeight(32);
	down:SetPoint("LEFT", pageButton, "LEFT", 0, -19);
	down:SetHitRectInsets(6, 6, 7, 7);
	down:SetNormalTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollDownButton-Up");
	down:SetPushedTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollDownButton-Down");
	down:SetDisabledTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollDownButton-Up");
	down:GetDisabledTexture():SetDesaturated(true);
	down:SetHighlightTexture("Interface\\MainMenuBar\\UI-MainMenu-ScrollDownButton-Highlight", "ADD");	
	down:SetScript("OnClick", function()
		self:SetPage(1);
		up:Enable();
		down:Disable();
	end);

	down:Click();
end

local DW_MainMenuButtons = {
	[1] = {name="DM_AtlasLootButton", nt="AtlasLootUp", pt="AtlasLootDown", dt="AtlasLootUp", ht="Hilight", tip=L["副本掉落"], onclick=function()
		if (dwIsConfigurableAddOn("AtlasLoot")) then
			if (not dwIsAddOnLoaded("AtlasLoot")) then
				dwLoadAddOn("AtlasLoot");
				dwSetCVar("AtlasLootMod", "AtlasLootEnable", 1);
				AtlasLootDefaultFrame:Show();
				return;
			end

			if AtlasLootDefaultFrame:IsShown() then
			    AtlasLootDefaultFrame:Hide();
			else
			    AtlasLootDefaultFrame:Show();
			end
		else
			_G["DM_AtlasLootButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("AtlasLoot")) then
			_G["DM_AtlasLootButton"]:Disable();
		end
	end},
	[2] = {name="DM_DkpButton", nt="DkpUp", pt="DkpDown", dt="DkpUp", ht="Hilight", tip=L["多玩DKP"], onclick=function()
		if (dwIsConfigurableAddOn("DuowanDKP")) then
			if (not dwIsAddOnLoaded("DuowanDKP")) then
				dwLoadAddOn("DuowanDKP");
				-- TODO: 
			end

		else
			_G["DM_DkpButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("DuowanDKP")) then
			_G["DM_DkpButton"]:Disable();
		end
	end},
	[3] = {name="DM_DuowanMoveButton", nt="DuowanMoveUp", pt="DuowanMoveDown", dt="DuowanMoveUp", ht="Hilight", tip=L["多玩移动"], onclick=function()
		if (dwIsConfigurableAddOn("DuowanMove")) then
			if (not dwIsAddOnLoaded("DuowanMove")) then
				dwLoadAddOn("DuowanMove");
				dwSetCVar("DuowanMoveMod", "DuowanMoveEnable", 1);
			end
			DuowanMove_ToggleConfig();
		else
			_G["DM_DuowanMoveButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("DuowanMove")) then
			_G["DM_DuowanMoveButton"]:Disable();
		end
	end},
	[4] = {name="DM_InviteUpButton", nt="InviteUp", pt="InviteDown", dt="InviteUp", ht="Hilight", tip=L["多玩组队"], onclick=function()
		if (dwIsConfigurableAddOn("DuowanInvite")) then
			if (not dwIsAddOnLoaded("DuowanInvite")) then
				dwLoadAddOn("DuowanInvite");
				-- TODO: 
			end

		else
			_G["DM_InviteUpButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("DuowanInvite")) then
			_G["DM_InviteUpButton"]:Disable();
		end
	end},
	[5] = {name="DM_RecountButton", nt="RecountUp", pt="RecountDown", dt="RecountUp", ht="Hilight", tip=L["伤害统计"], onclick=function()
		if (dwIsConfigurableAddOn("Recount")) then
			if (not dwIsAddOnLoaded("Recount")) then
				dwLoadAddOn("Recount");
				dwSetCVar("RecountMod", "RecountEnable", 1);
				Recount.MainWindow:Show();
				return;
			end
			if (Recount.MainWindow:IsShown()) then
				Recount.MainWindow:Hide();
			else
				Recount.MainWindow:Show();
			end
			Recount:RefreshMainWindow();
		else
			_G["DM_RecountButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("Recount")) then
			_G["DM_RecountButton"]:Disable();
		end
	end},
	[6] = {name="DM_ThreatButton", nt="ThreatUp", pt="ThreatDown", dt="ThreatUp", ht="Hilight", tip=L["仇恨统计"], onclick=function()
		if (dwIsConfigurableAddOn("Omen")) then
			if (not dwIsAddOnLoaded("Omen")) then
				dwLoadAddOn("Omen");
				dwSetCVar("OmenMod", "OmenEnable", 1);
			end
			OmenToggle();
		else
			_G["DM_ThreatButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("Omen")) then
			_G["DM_ThreatButton"]:Disable();
		end
	end},
	[7] = {name="DM_TradeLogButton", nt="TradeLogUp", pt="TradeLogDown", dt="TradeLogUp", ht="Hilight", tip=L["交易记录"], onclick=function()
		if (dwIsConfigurableAddOn("TheBurningTrade")) then
			if (not dwIsAddOnLoaded("TheBurningTrade")) then
				dwLoadAddOn("TheBurningTrade");
				dwSetCVar("TheBurningTrade", "EnableBuringTrade", 1);
				TradeListFrame:Show();
				return;
			end
			if( TradeListFrame:IsShown() ) then
				TradeListFrame:Hide();
			else
				TradeListFrame:Show();
			end
		else
			_G["DM_TradeLogButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("TheBurningTrade")) then
			_G["DM_TradeLogButton"]:Disable();
		end
	end},
};

local DW_MainPage = {};
function MainMenu:CreatePageInfo()	
	for page=1, 2 do	
		for i=1, 10 do
			if (not DW_MainPage[page]) then
				DW_MainPage[page] = {};
			end
			if (page == 1) then				
				if (microbuttons[i]) then
					DW_MainPage[page][i] = microbuttons[i];
				end
			else
				if (DW_MainMenuButtons[i]) then
					DW_MainPage[page][i] = DW_MainMenuButtons[i]["name"];
				end
			end
		end
	end
end

function MainMenu:CreateMainMenu()
	local button;
	for i, v in ipairs(DW_MainMenuButtons) do
		button = CreateFrame("Button", v.name, UIParent);
		button:SetWidth(28);
		button:SetHeight(58);
		button:SetHitRectInsets(0, 0, 18, 0);
		button:SetPoint("CENTER", microbuttons[i], "CENTER", 0, 0);
		button:SetNormalTexture(MAINMENU_PATH .. v.nt);
		button:SetPushedTexture(MAINMENU_PATH .. v.pt);
		button:SetDisabledTexture(MAINMENU_PATH .. v.dt);
		button:GetDisabledTexture():SetDesaturated(true);
		button:SetHighlightTexture(MAINMENU_PATH .. v.ht, "ADD");
		v.onload();
		button:SetScript("OnClick", v.onclick);
		button:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self,  "ANCHOR_RIGHT");
			GameTooltip:SetText(v.tip, 1, 1, 1);
			GameTooltip:Show();
		end);
		button:SetScript("OnLeave", function(self)
			GameTooltip:Hide();
		end);
	end
end

function MainMenu:SetPage(page)
	for p=1, 2 do
		for k, name in ipairs(DW_MainPage[p]) do
			_G[name]:Hide();
		end
	end

	for i, name in ipairs(DW_MainPage[page]) do
		_G[name]:Show();
	end
end