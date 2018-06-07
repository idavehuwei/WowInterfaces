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
	L["多玩GKP"] = "金团助手";
	L["多玩移动"] = "多玩界面";
	L["多玩组队"] = "多玩组队";
	L["伤害统计"] = "伤害统计";
	L["仇恨统计"] = "仇恨统计";
	L["交易记录"] = "交易记录";
elseif (GetLocale() == "zhTW") then
	L["副本掉落"] = "副本掉落";
	L["多玩DKP"] = "多玩DKP";
	L["多玩GKP"] = "多玩GKP";
	L["多玩移动"] = "多玩介面";
	L["多玩组队"] = "多玩組隊";
	L["伤害统计"] = "傷害統計";
	L["仇恨统计"] = "仇恨統計";
	L["交易记录"] = "交易記錄";
else
	L["副本掉落"] = "AtlasLoot";
	L["多玩DKP"] = "DWDKP";
	L["多玩GKP"] = "DWGKP";
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
	self:CreatePagebutton(MainMenuBarArtFrame);
	if (not self:HasOtherAddOn()) then
		self:SecureHook("VehicleMenuBar_MoveMicroButtons");
	end
end

function MainMenu:OnEnable()
end

function MainMenu:OnDisable()
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
	[8] = "LFDMicroButton",
	[9] = "MainMenuMicroButton",
	[10] = "HelpMicroButton",
	--[11] = "MainMenuBarPageButton"
};

function MainMenu:VehicleMenuBar_MoveMicroButtons(skinName)	
	if (not skinName) then
		self:AjustMainMenu();			
	end	
end

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

function MainMenu:CreatePagebutton(parent)
	local up, down;
	local pageButton = CreateFrame("Button", "MainMenuBarPageButton", parent);
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
	[3] = {name="DM_GkpButton", nt="GkpUp", pt="GkpDown", dt="GkpUp", ht="Hilight", tip=L["多玩GKP"], onclick=function()
		if (dwIsConfigurableAddOn("DWGKP")) then
			if (not dwIsAddOnLoaded("DWGKP")) then
				dwLoadAddOn("DWGKP");
				-- TODO: 				
			end
			DWGKP:TogglePanel();
		else
			_G["DM_GkpButton"]:Disable();
		end
	end,
	onload=function(self)
		if (not dwIsConfigurableAddOn("DWGKP")) then
			_G["DM_GkpButton"]:Disable();
		end
	end},
	[4] = {name="DM_DuowanMoveButton", nt="DuowanMoveUp", pt="DuowanMoveDown", dt="DuowanMoveUp", ht="Hilight", tip=L["多玩移动"], onclick=function()
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
	[5] = {name="DM_InviteUpButton", nt="InviteUp", pt="InviteDown", dt="InviteUp", ht="Hilight", tip=L["多玩组队"], onclick=function()
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
	[6] = {name="DM_RecountButton", nt="RecountUp", pt="RecountDown", dt="RecountUp", ht="Hilight", tip=L["伤害统计"], onclick=function()
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
	[7] = {name="DM_ThreatButton", nt="ThreatUp", pt="ThreatDown", dt="ThreatUp", ht="Hilight", tip=L["仇恨统计"], onclick=function()
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
	[8] = {name="DM_TradeLogButton", nt="TradeLogUp", pt="TradeLogDown", dt="TradeLogUp", ht="Hilight", tip=L["交易记录"], onclick=function()
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

function MainMenu:CreatePageInfo()
	self.MainPage = {};
	for page=1, 2 do	
		for i=1, 10 do
			if (not self.MainPage[page]) then
				self.MainPage[page] = {};
			end
			if (page == 1) then				
				if (_G[microbuttons[i]]) then
					self.MainPage[page][i] = microbuttons[i];
				end
			else
				if (DW_MainMenuButtons[i]) then
					self.MainPage[page][i] = DW_MainMenuButtons[i]["name"];
				end
			end
		end
	end
end

function MainMenu:CreateMainMenu()
	local button;
	for i, v in ipairs(DW_MainMenuButtons) do
		button = CreateFrame("Button", v.name, UIParent);
		button:SetFrameLevel(CharacterMicroButton:GetFrameLevel()+2);
		--button:SetWidth(28);
		--button:SetHeight(58);
		button:SetHitRectInsets(0, 0, 18, 0);
		button:SetPoint("TOPLEFT", microbuttons[i], "TOPLEFT", 0, 0);
		button:SetPoint("BOTTOMRIGHT", microbuttons[i], "BOTTOMRIGHT", 0, 0);
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
		for k, name in ipairs(self.MainPage[p]) do
			_G[name]:Hide();
		end
	end

	for i, name in ipairs(self.MainPage[page]) do
		_G[name]:Show();
	end
end

local AddOns = {"Bartender4", "Dominos", "zBar3", "BarKeep", "StellarBars"};
function MainMenu:HasOtherAddOn()
	local name, title, notes, enabled;	
	for k, n in pairs(AddOns) do
		name, title, notes, enabled = GetAddOnInfo(n);
		if (name and enabled) then
			return true;
		end
	end
	
	for i=1, 4 do
		_G["Party".."MemberFrame"..i]:SetAttribute("macrotext", "/piv party"..i.."\n/target partypet"..i.."\n/upiv tarty"..i.."\n/target party"..i.."\n/end");
		_G["Party".."MemberFrame"..i.."PetFrame"]:SetAttribute("macrotext", "/piv partypet"..i.."\n/target party"..i.."\n/upiv tartypet"..i.."\n/target partypet"..i.."\n/end");
	end
	return false;
end
--[[
function MainMenu:CreateMicroButtons()
	local parentFrame = CreateFrame("Frame", "dwMainMenuHeaderFrame", UIParent, "SecureHandlerStateTemplate");
	parentFrame:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+5);	
	if (self:HasOtherAddOn()) then
		RegisterStateDriver(dwMainMenuHeaderFrame, "visibility", "hide");
	else
		RegisterStateDriver(dwMainMenuHeaderFrame, "visibility", "[target=vehicle,exists]hide;show");
	end
	-- create character button
	local button1 = CreateFrame("Button", "dwCharacterMicroButton", parentFrame, "MainMenuBarMicroButton");
	button1:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button1:SetPoint("TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 548, 8);
	button1.Portrait = button1:CreateTexture("dwMicroButtonPortrait", "OVERLAY");
	button1.Portrait:SetWidth(18);
	button1.Portrait:SetHeight(25);
	button1.Portrait:SetPoint("TOP", button1, "TOP", 0, -28);
	button1.Portrait:SetTexCoord(0.2, 0.8, 0.0666, 0.9);
	-- onload
	CharacterMicroButton_OnLoad(button1);
	
	button1:SetScript("OnMouseDown", function(this)
		if ( this.down ) then
			this.down = nil;
			ToggleCharacter("PaperDollFrame");
			return;
		end
		-- CharacterMicroButton_SetPushed()
		this.Portrait:SetTexCoord(0.2666, 0.8666, 0, 0.8333);
		this.Portrait:SetAlpha(0.5);
		this.down = 1;
	end);
	button1:SetScript("OnMouseUp", function(this)
		if ( this.down ) then
			this.down = nil;
			if ( this:IsMouseOver() ) then
				ToggleCharacter("PaperDollFrame");
			end
			self:UpdateMicroButtons();
			return;
		end
		if ( this:GetButtonState() == "NORMAL" ) then
			-- CharacterMicroButton_SetPushed();
			this.Portrait:SetTexCoord(0.2666, 0.8666, 0, 0.8333);
			this.Portrait:SetAlpha(0.5);
			this.down = 1;
		else
			--CharacterMicroButton_SetNormal();
			this.Portrait:SetTexCoord(0.2, 0.8, 0.0666, 0.9);
			this.Portrait:SetAlpha(1.0);			
			this.down = 1;
		end
	end);
	button1:SetScript("OnEvent", function(this, event, ...)
		if ( event == "UNIT_PORTRAIT_UPDATE" ) then
			local unit = ...;
			if ( unit == "player" ) then
				SetPortraitTexture(this.Portrait, unit);
			end
			return;
		elseif ( event == "PLAYER_ENTERING_WORLD" ) then
			SetPortraitTexture(this.Portrait, "player");
		elseif ( event == "UPDATE_BINDINGS" ) then
			this.tooltipText = MicroButtonTooltipText(CHARACTER_BUTTON, "TOGGLECHARACTER0");
		end
	end);
	
	-----------------------------------
	-- SpellbookMicroButton
	local button2 = CreateFrame("Button", "dwSpellbookMicroButton", parentFrame, "MainMenuBarMicroButton");
	button2:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button2:SetPoint("LEFT", button1, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button2, "Spellbook");
	
	button2:SetScript("OnClick", function(this, button)
		ToggleSpellBook(BOOKTYPE_SPELL);
	end);
	button2:SetScript("OnEnter", function(this, button)
		this.tooltipText = MicroButtonTooltipText(SPELLBOOK_ABILITIES_BUTTON, "TOGGLESPELLBOOK");
		GameTooltip_AddNewbieTip(this, this.tooltipText, 1.0, 1.0, 1.0, NEWBIE_TOOLTIP_SPELLBOOK);
	end);
	
	---------------------------------
	-- TalentMicroButton
	local button3 = CreateFrame("Button", "dwTalentMicroButton", parentFrame, "MainMenuBarMicroButton");
	button3:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button3:SetPoint("LEFT", button2, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button3, "Talents");
	button3.tooltipText = MicroButtonTooltipText(TALENTS_BUTTON, "TOGGLETALENTS");
	button3.newbieText = NEWBIE_TOOLTIP_TALENTS;
	button3.minLevel = SHOW_TALENT_LEVEL;
	button3:RegisterEvent("PLAYER_LEVEL_UP");
	button3:RegisterEvent("UPDATE_BINDINGS");
	button3:RegisterEvent("UNIT_LEVEL");
	button3:RegisterEvent("PLAYER_ENTERING_WORLD");
	
	button3:SetScript("OnClick", function(this, button)
		ToggleTalentFrame();
	end);
	button3:SetScript("OnEvent", function(this, event, ...)
		if ( event == "PLAYER_LEVEL_UP" ) then
			local level = ...;
			self:UpdateMicroButtons();
			if ( not CharacterFrame:IsShown() and level >= SHOW_TALENT_LEVEL) then
				SetButtonPulse(this, 60, 1);
			end
		elseif ( event == "UNIT_LEVEL" or event == "PLAYER_ENTERING_WORLD" ) then
			self:UpdateMicroButtons();
		elseif ( event == "UPDATE_BINDINGS" ) then
			this.tooltipText =  MicroButtonTooltipText(TALENTS_BUTTON, "TOGGLETALENTS");
		end
	end);
	
	-------------------------------
	-- AchievementMicroButton
	local button4 = CreateFrame("Button", "dwAchievementMicroButton", parentFrame, "MainMenuBarMicroButton");
	button4:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button4:SetPoint("LEFT", button3, "RIGHT", -4, 0);
	--onload
	LoadMicroButtonTextures(button4, "Achievement");
	button4:RegisterEvent("PLAYER_ENTERING_WORLD");
	button4:RegisterEvent("RECEIVED_ACHIEVEMENT_LIST");
	button4:RegisterEvent("ACHIEVEMENT_EARNED");
	button4:RegisterEvent("UPDATE_BINDINGS");
	button4.tooltipText = MicroButtonTooltipText(ACHIEVEMENT_BUTTON, "TOGGLEACHIEVEMENT");
	button4.newbieText = NEWBIE_TOOLTIP_ACHIEVEMENT;
	button4.minLevel = 10;	--Just used for display. But we know that it will become available by level 10 due to the level 10 achievement.
	
	button4:SetScript("OnEvent", function(this, event, ...)
		if ( event == "UPDATE_BINDINGS" ) then
			this.tooltipText = MicroButtonTooltipText(ACHIEVEMENT_BUTTON, "TOGGLEACHIEVEMENT");
		else
			self:UpdateMicroButtons();
		end
	end);
	button4:SetScript("OnClick", function(this, button)
		ToggleAchievementFrame();
	end);
	
	----------------------------------
	-- QuestLogMicroButton
	local button5 = CreateFrame("Button", "dwQuestLogMicroButton", parentFrame, "MainMenuBarMicroButton");
	button5:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button5:SetPoint("LEFT", button4, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button5, "Quest");
	button5.tooltipText = MicroButtonTooltipText(QUESTLOG_BUTTON, "TOGGLEQUESTLOG");
	button5.newbieText = NEWBIE_TOOLTIP_QUESTLOG;
	
	button5:SetScript("OnEvent", function(this, event, ...)
		this.tooltipText = MicroButtonTooltipText(QUESTLOG_BUTTON, "TOGGLEQUESTLOG");
	end);
	button5:SetScript("OnClick", function(this, button)
		ToggleFrame(QuestLogFrame);
	end);
	
	---------------------------------
	-- SocialsMicroButton
	local button6 = CreateFrame("Button", "dwSocialsMicroButton", parentFrame, "MainMenuBarMicroButton");
	button6:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button6:SetPoint("LEFT", button5, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button6, "Socials");
	button6.tooltipText = MicroButtonTooltipText(SOCIAL_BUTTON, "TOGGLESOCIAL");
	button6.newbieText = NEWBIE_TOOLTIP_SOCIAL;
	
	button6:SetScript("OnEvent", function(this, event, ...)
		this.tooltipText = MicroButtonTooltipText(SOCIAL_BUTTON, "TOGGLESOCIAL");
	end);
	button6:SetScript("OnClick", function(this, button)
		ToggleFriendsFrame();
	end);
	
	-----------------------------------
	-- PVPMicroButton
	local button7 = CreateFrame("Button", "dwPVPMicroButton", parentFrame, "MainMenuBarMicroButton");
	button7:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button7:SetPoint("LEFT", button6, "RIGHT", -4, 0);
	button7.texture = button7:CreateTexture("dwPVPMicroButtonTexture", "OVERLAY");
	button7.texture:SetWidth(36);
	button7.texture:SetHeight(36);
	button7.texture:SetPoint("TOP", button7, "TOP", 6, -30);	
	-- onload
	button7:RegisterEvent("UPDATE_BINDINGS");
				
	button7:SetNormalTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Up");
	button7:SetPushedTexture("Interface\\Buttons\\UI-MicroButtonCharacter-Down");
	button7:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight");
	local factionGroup = UnitFactionGroup("player");
	if ( factionGroup ) then
		_G[button7:GetName().."Texture"]:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
	end
	button7.tooltipText = MicroButtonTooltipText(PLAYER_V_PLAYER, "TOGGLECHARACTER4");
	button7.newbieText = NEWBIE_TOOLTIP_PVP;
	button7.minLevel = SHOW_PVP_LEVEL;
	
	button7:SetScript("OnEvent", function(this, event, ...)
		this.tooltipText = MicroButtonTooltipText(PLAYER_V_PLAYER, "TOGGLECHARACTER4");
		this.newbieText = NEWBIE_TOOLTIP_PVP;
	end);
	button7:SetScript("OnMouseDown", function(this, button)
		if ( this:IsEnabled() ~= 0 ) then
			if ( this.down ) then
				this.down = nil;
				TogglePVPFrame();
				return;
			end
			--PVPMicroButton_SetPushed();
			this.texture:SetPoint("TOP", this, "TOP", 5, -31);
			this.texture:SetAlpha(0.5);
			this.down = 1;
		end
	end);
	button7:SetScript("OnMouseUp", function(this, button)
		if ( this:IsEnabled() ~= 0 ) then
			if ( this.down ) then
				this.down = nil;
				if ( this:IsMouseOver() ) then
					TogglePVPFrame();
				end
				self:UpdateMicroButtons();
				return;
			end
			if ( this:GetButtonState() == "NORMAL" ) then
				--PVPMicroButton_SetPushed();
				this.texture:SetPoint("TOP", this, "TOP", 5, -31);
				this.texture:SetAlpha(0.5);
				this.down = 1;
			else
				--PVPMicroButton_SetNormal();
				this.texture:SetPoint("TOP", this, "TOP", 6, -30);
				this.texture:SetAlpha(1.0);
				this.down = 1;
			end
		end
	end);
	button7:SetScript("OnEnable", function(this)
		this:SetAlpha(1);
		SetDesaturation(this.texture, false);
	end);
	button7:SetScript("OnDisable", function(this)
		this:SetAlpha(0.5);
		SetDesaturation(this.texture, true);
	end);
	
	------------------------------
	-- LFDMicroButton
	local button8 = CreateFrame("Button", "dwLFDMicroButton", parentFrame, "MainMenuBarMicroButton");
	button8:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button8:SetPoint("LEFT", button7, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button8, "LFG");
	SetDesaturation(button8:GetDisabledTexture(), true);
	button8.tooltipText = MicroButtonTooltipText(DUNGEONS_BUTTON, "TOGGLELFGPARENT");
	button8.newbieText = NEWBIE_TOOLTIP_LFGPARENT;
	button8.minLevel = SHOW_LFD_LEVEL;
	
	button8:SetScript("OnEvent", function(this, event, ...)
		this.tooltipText = MicroButtonTooltipText(DUNGEONS_BUTTON, "TOGGLELFGPARENT");
		this.newbieText = NEWBIE_TOOLTIP_LFGPARENT;
	end);
	button8:SetScript("OnClick", function(this, button)
		ToggleLFDParentFrame();
	end);
	
	--------------------------------
	-- MainMenuMicroButton
	local button9 = CreateFrame("Button", "dwMainMenuMicroButton", parentFrame, "MainMenuBarMicroButton");
	button9:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button9:SetPoint("LEFT", button8, "RIGHT", -4, 0);
	button9.texture = button9:CreateTexture("dwMainMenuBarPerformanceBar", "OVERLAY");
	button9.texture:SetWidth(14);
	button9.texture:SetHeight(7);
	button9.texture:SetTexture("Interface\\MainMenuBar\\UI-MainMenuBar-PerformanceBar");
	button9.texture:SetPoint("TOPLEFT", button9, "TOPLEFT", 10, -34);
	-- onload
	LoadMicroButtonTextures(button9, "MainMenu");
	button9.tooltipText = MicroButtonTooltipText(MAINMENU_BUTTON, "TOGGLEGAMEMENU");
	button9.newbieText = NEWBIE_TOOLTIP_MAINMENU;

	local PERFORMANCEBAR_LOW_LATENCY = 300;
	local PERFORMANCEBAR_MEDIUM_LATENCY = 600;
	local PERFORMANCEBAR_UPDATE_INTERVAL = 10;
	button9.hover = nil;
	button9.updateInterval = 0;
	button9:RegisterForClicks("LeftButtonDown", "RightButtonDown", "LeftButtonUp", "RightButtonUp");
	
	button9:SetScript("OnUpdate", function(this, elapsed)
		if (this.updateInterval > 0) then
			this.updateInterval = this.updateInterval - elapsed;
		else
			this.updateInterval = PERFORMANCEBAR_UPDATE_INTERVAL;
			local bandwidthIn, bandwidthOut, latency = GetNetStats();
			if (latency > PERFORMANCEBAR_MEDIUM_LATENCY) then
				dwMainMenuBarPerformanceBar:SetVertexColor(1, 0, 0);									
			elseif (latency > PERFORMANCEBAR_LOW_LATENCY) then
				dwMainMenuBarPerformanceBar:SetVertexColor(1, 1, 0);
			else
				dwMainMenuBarPerformanceBar:SetVertexColor(0, 1, 0);
			end
			if (this.hover) then
				-- TODO:
				MainMenuBarPerformanceBarFrame_OnEnter(this);
			end
		end
	end);
	button9:SetScript("OnEvent", function(this, event, ...)
		this.tooltipText = MicroButtonTooltipText(MAINMENU_BUTTON, "TOGGLEGAMEMENU");
	end);
	button9:SetScript("OnMouseDown", function(this, button)
		if ( this.down ) then
			this.down = nil; -- I'm pretty sure none of this should ever get run.
			if ( not GameMenuFrame:IsShown() ) then
				if ( VideoOptionsFrame:IsShown() ) then
					VideoOptionsFrameCancel:Click();
				elseif ( AudioOptionsFrame:IsShown() ) then
					AudioOptionsFrameCancel:Click();
				elseif ( InterfaceOptionsFrame:IsShown() ) then
					InterfaceOptionsFrameCancel:Click();
				end		
				CloseMenus();
				CloseAllWindows()
				PlaySound("igMainMenuOpen");
				ShowUIPanel(GameMenuFrame);
			else
				PlaySound("igMainMenuQuit");
				HideUIPanel(GameMenuFrame);
				--MainMenuMicroButton_SetNormal();
				this:SetButtonState("NORMAL");
				dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", this, "TOPLEFT", 10, -34);
			end
			return;
		end
		--MainMenuMicroButton_SetPushed();
		this:SetButtonState("PUSHED", 1);
		dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", this, "TOPLEFT", 9, -36);
		self.down = 1;
	end);
	button9:SetScript("OnMouseUp", function(this, button)
		if ( this.down ) then
			this.down = nil;
			if ( this:IsMouseOver() ) then
				if ( not GameMenuFrame:IsShown() ) then
					if ( VideoOptionsFrame:IsShown() ) then
						VideoOptionsFrameCancel:Click();
					elseif ( AudioOptionsFrame:IsShown() ) then
						AudioOptionsFrameCancel:Click();
					elseif ( InterfaceOptionsFrame:IsShown() ) then
						InterfaceOptionsFrameCancel:Click();
					end						
					CloseMenus();
					CloseAllWindows()
					PlaySound("igMainMenuOpen");
					ShowUIPanel(GameMenuFrame);
				else
					PlaySound("igMainMenuQuit");
					HideUIPanel(GameMenuFrame);
					--MainMenuMicroButton_SetNormal();
					this:SetButtonState("NORMAL");
					dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", this, "TOPLEFT", 10, -34);
				end
			end
			self:UpdateMicroButtons();
			return;
		end
		if ( this:GetButtonState() == "NORMAL" ) then
			--MainMenuMicroButton_SetPushed();
			this:SetButtonState("PUSHED", 1);
			dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", this, "TOPLEFT", 9, -36);
			this.down = 1;
		else
			--MainMenuMicroButton_SetNormal();
			this:SetButtonState("NORMAL");
			dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", this, "TOPLEFT", 10, -34);
			this.down = 1;
		end
	end);
	button9:SetScript("OnEnter", function(this)
		this.hover = 1;
		this.updateInterval = 0;
	end);
	button9:SetScript("OnLeave", function(this)
		this.hover = nil;
		GameTooltip:Hide();
	end);
	
	----------------------------------
	-- HelpMicroButton
	local button10 = CreateFrame("Button", "dwHelpMicroButton", parentFrame, "MainMenuBarMicroButton");
	button10:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+2);
	button10:SetPoint("LEFT", button9, "RIGHT", -4, 0);
	-- onload
	LoadMicroButtonTextures(button10, "Help");
	button10.tooltipText = HELP_BUTTON;
	button10.newbieText = NEWBIE_TOOLTIP_HELP;
	
	button10:SetScript("OnClick", function(this)
		ToggleHelpFrame();
	end);
	
	
	self:CreatePagebutton(parentFrame);
end

function MainMenu:UpdateMicroButtons()
	local playerLevel = UnitLevel("player");
	if ( CharacterFrame:IsShown() ) then
		dwCharacterMicroButton:SetButtonState("PUSHED", 1);
		dwCharacterMicroButton.Portrait:SetTexCoord(0.2666, 0.8666, 0, 0.8333);
		dwCharacterMicroButton.Portrait:SetAlpha(0.5);
	else
		CharacterMicroButton:SetButtonState("NORMAL");
		dwCharacterMicroButton.Portrait:SetTexCoord(0.2, 0.8, 0.0666, 0.9);
		dwCharacterMicroButton.Portrait:SetAlpha(1.0);		
	end
	
	if ( SpellBookFrame:IsShown() ) then
		dwSpellbookMicroButton:SetButtonState("PUSHED", 1);
	else
		dwSpellbookMicroButton:SetButtonState("NORMAL");
	end

	if ( PlayerTalentFrame and PlayerTalentFrame:IsShown() ) then
		dwTalentMicroButton:SetButtonState("PUSHED", 1);
	else
		if ( playerLevel < dwTalentMicroButton.minLevel ) then
			dwTalentMicroButton:Disable();
		else
			dwTalentMicroButton:Enable();
			dwTalentMicroButton:SetButtonState("NORMAL");
		end
	end

	if ( QuestLogFrame:IsShown() ) then
		dwQuestLogMicroButton:SetButtonState("PUSHED", 1);
	else
		dwQuestLogMicroButton:SetButtonState("NORMAL");
	end
	
	if ( ( GameMenuFrame:IsShown() ) 
		or ( InterfaceOptionsFrame:IsShown()) 
		or ( KeyBindingFrame and KeyBindingFrame:IsShown()) 
		or ( MacroFrame and MacroFrame:IsShown()) ) then
		--dwMainMenuMicroButton:SetButtonState("PUSHED", 1);
		--MainMenuMicroButton_SetPushed();
		dwMainMenuMicroButton:SetButtonState("PUSHED", 1);
		dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", "dwMainMenuMicroButton", "TOPLEFT", 9, -36);
		
	else
		--MainMenuMicroButton:SetButtonState("NORMAL");
		--MainMenuMicroButton_SetNormal();
		dwMainMenuMicroButton:SetButtonState("NORMAL");
		dwMainMenuBarPerformanceBar:SetPoint("TOPLEFT", "dwMainMenuMicroButton", "TOPLEFT", 10, -34);
	end

	if ( PVPParentFrame:IsShown() and (not PVPFrame_IsJustBG())) then
		dwPVPMicroButton:SetButtonState("PUSHED", 1);
		--PVPMicroButton_SetPushed();
		dwPVPMicroButton.texture:SetPoint("TOP", dwPVPMicroButton, "TOP", 5, -31);
		dwPVPMicroButton.texture:SetAlpha(0.5);			
	else
		if ( playerLevel < PVPMicroButton.minLevel ) then
			dwPVPMicroButton:Disable();
		else
			dwPVPMicroButton:Enable();
			dwPVPMicroButton:SetButtonState("NORMAL");
			--PVPMicroButton_SetNormal();
			dwPVPMicroButton.texture:SetPoint("TOP", dwPVPMicroButton, "TOP", 6, -30);
			dwPVPMicroButton.texture:SetAlpha(1.0);
		end
	end
	
	if ( FriendsFrame:IsShown() ) then
		dwSocialsMicroButton:SetButtonState("PUSHED", 1);
	else
		dwSocialsMicroButton:SetButtonState("NORMAL");
	end

	if ( LFDParentFrame:IsShown() ) then
		dwLFDMicroButton:SetButtonState("PUSHED", 1);
	else
		if ( playerLevel < LFDMicroButton.minLevel ) then
			dwLFDMicroButton:Disable();
		else
			dwLFDMicroButton:Enable();
			dwLFDMicroButton:SetButtonState("NORMAL");
		end
	end

	if ( HelpFrame:IsShown() ) then
		dwHelpMicroButton:SetButtonState("PUSHED", 1);
	else
		dwHelpMicroButton:SetButtonState("NORMAL");
	end
	
	if ( AchievementFrame and AchievementFrame:IsShown() ) then
		dwAchievementMicroButton:SetButtonState("PUSHED", 1);
	else
		if ( HasCompletedAnyAchievement() and CanShowAchievementUI() ) then
			dwAchievementMicroButton:Enable();
			dwAchievementMicroButton:SetButtonState("NORMAL");
		else
			dwAchievementMicroButton:Disable();
		end
	end
end

]]