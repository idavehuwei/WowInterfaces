--============================================
-- 名称: DWB 
-- 日期: 2010-11-10
-- 描述: 重新定义宠物动作条
-- 作者: dugu
-- 鸣谢: CWDG
-- 版权所有 (C) duowan
--============================================

dwPetActionBar = LibStub("AceAddon-3.0"):NewAddon("dwPetActionBar");
local P = dwPetActionBar;
---------------------
-- 宠物动作条
local PETACTIONBAR_XPOS = 0;	-- 本地化变量
local PETACTIONBAR_YPOS = 0;
local PetActionBarPositionCache = {};
local EnablePosition = true;

local function UpdatePositionValue()
	-- x pos
	if ( P:PetActionBarFrame_IsAboveShapeshift(true) ) then
		PETACTIONBAR_XPOS = 36;
	elseif ( MainMenuBarVehicleLeaveButton and MainMenuBarVehicleLeaveButton:IsShown() ) then
		PETACTIONBAR_XPOS = MainMenuBarVehicleLeaveButton:GetRight() + 20;
	elseif ( ShapeshiftBarFrame and ShapeshiftBarFrame:IsShown() and GetNumShapeshiftForms() > 0 ) then
		PETACTIONBAR_XPOS = _G["ShapeshiftButton"..GetNumShapeshiftForms()]:GetRight() + 20;
	elseif ( MultiCastActionBarFrame and HasMultiCastActionBar() ) then
		PETACTIONBAR_XPOS = MultiCastActionBarFrame:GetRight() + 20;	
	else
		PETACTIONBAR_XPOS = 36;
	end
	
	if ( AspectPosionBar and AspectPosionBar:IsShown() and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then		
		local index = AspectPosionBarFrame:GetNumShapeshiftForms();
		PETACTIONBAR_XPOS = _G["AspectPosionBarButton" .. index]:GetRight() + 5;
	end

	-- y pos	
	PETACTIONBAR_YPOS = 0;
	if ( MultiBarBottomLeft:IsShown() ) then			
		PETACTIONBAR_YPOS = 45;
	end

	if ( ReputationWatchBar:IsShown() and MainMenuExpBar:IsShown() ) then
		PETACTIONBAR_YPOS = PETACTIONBAR_YPOS + 10;
	end
	if ( MainMenuBarMaxLevelBar:IsShown() ) then
		PETACTIONBAR_YPOS = PETACTIONBAR_YPOS + 1;
	end
end

function dwUpdatePetPosition()	
	UpdatePositionValue();

	if (EnablePosition and not InCombatLockdown() --[[and 
	    (not PetActionBarPositionCache[4] or not PetActionBarPositionCache[5] or 
	    math.abs(PetActionBarPositionCache[4] - PETACTIONBAR_XPOS) > 5 or 
	    (PETACTIONBAR_YPOS - PetActionBarPositionCache[5] > 5))]]) then
		dwPetActionBarFrame:ClearAllPoints();
		local anchorTo = MainMenuBar;
		if (dwPetActionBarFrame:GetParent() ~= UIParent) then
			anchorTo = dwPetActionBarFrame:GetParent();
		end
		dwPetActionBarFrame:SetPoint("BOTTOMLEFT", anchorTo, "TOPLEFT", PETACTIONBAR_XPOS, PETACTIONBAR_YPOS); 
	end

	if ( MultiBarBottomLeft:IsShown() or (dwPetActionBarFrame:GetBottom() > MultiBarBottomLeft:GetTop())) then
		P.bar.tex0:SetAlpha(0);
		P.bar.tex1:SetAlpha(0);
	else
		P.bar.tex0:SetAlpha(1);
		P.bar.tex1:SetAlpha(1);
	end
end

function RePositionPetActionBar()
	dwSecureCall(dwUpdatePetPosition);
end

function P:PetActionBar_OnLoad (this)
	this:RegisterEvent("PLAYER_CONTROL_LOST");
	this:RegisterEvent("PLAYER_CONTROL_GAINED");
	this:RegisterEvent("PLAYER_FARSIGHT_FOCUS_CHANGED");
	this:RegisterEvent("UNIT_PET");
	this:RegisterEvent("UNIT_FLAGS");
	this:RegisterEvent("UNIT_AURA");
	this:RegisterEvent("PET_BAR_UPDATE");
	this:RegisterEvent("PET_BAR_UPDATE_COOLDOWN");
	this:RegisterEvent("PET_BAR_SHOWGRID");
	this:RegisterEvent("PET_BAR_HIDEGRID");
	this:RegisterEvent("PLAYER_REGEN_DISABLED");
	PetActionBarFrame:Hide();
	UIPARENT_MANAGED_FRAME_POSITIONS["PETACTIONBAR_YPOS"] = nil;
	this.showgrid = 0;
	self:PetActionBar_Update(this);	
end

function P:PetActionBar_OnEvent (this, event, ...)
	local arg1 = ...;

	if ( event == "PET_BAR_UPDATE" or (event == "UNIT_PET" and arg1 == "player") ) then
		self:PetActionBar_Update(this);
	elseif ( event == "PLAYER_CONTROL_LOST" or event == "PLAYER_CONTROL_GAINED" or event == "PLAYER_FARSIGHT_FOCUS_CHANGED" ) then
		self:PetActionBar_Update(this);
	elseif ( (event == "UNIT_FLAGS") or (event == "UNIT_AURA") ) then
		if ( arg1 == "pet" ) then
			self:PetActionBar_Update(this);
		end
	elseif ( event =="PET_BAR_UPDATE_COOLDOWN" ) then
		self:PetActionBar_UpdateCooldowns();
	elseif ( event =="PET_BAR_SHOWGRID" ) then
		self:PetActionBar_ShowGrid(this);
	elseif ( event =="PET_BAR_HIDEGRID" ) then
		self:PetActionBar_HideGrid(this);
	elseif (event == "PLAYER_REGEN_DISABLED") then
		RePositionPetActionBar();
	end
end

function P:CreatePetActionBar()	
	self.bar = CreateFrame("Frame", "dwPetActionBarFrame", UIParent, "SecureHandlerStateTemplate");
	self.bar:SetWidth(509);
	self.bar:SetHeight(43);
	self.bar:SetPoint("TOPLEFT", MainMenuBar, "BOTTOMLEFT", 40, 112);
	
	self.bar.tex0 = self.bar:CreateTexture(nil, "LOW");
	self.bar.tex0:SetWidth(256);
	self.bar.tex0:SetHeight(44);
	self.bar.tex0:SetTexture("Interface\\PetActionBar\\UI-PetBar");
	self.bar.tex0:SetTexCoord(0, 1, 0.015625, 0.359375);
	self.bar.tex0:SetPoint("TOPLEFT", self.bar,"TOPLEFT", 0, 0);

	self.bar.tex1 = self.bar:CreateTexture(nil, "LOW");
	self.bar.tex1:SetWidth(184);
	self.bar.tex1:SetHeight(44);
	self.bar.tex1:SetTexture("Interface\\PetActionBar\\UI-PetBar");
	self.bar.tex1:SetTexCoord(0, 0.71875, 0.375, 0.71875);
	self.bar.tex1:SetPoint("LEFT", self.bar.tex0,"RIGHT", 0, 0);
	
	self.bar.button = {};
	local name = "";
	for i=1, NUM_PET_ACTION_SLOTS do
		name = "dwPetActionButton"..i;
		self.bar.button[i] = CreateFrame("CheckButton", name, self.bar, "PetActionButtonTemplate");
		self.bar.button[i]:SetID(i);
		self.bar.button[i].flash = _G[name .. "Flash"];
		self.bar.button[i].cooldown = _G[name .. "Cooldown"];
		self.bar.button[i].icon = _G[name .. "Icon"];
		self.bar.button[i].autocastable = _G[name .. "AutoCastable"];
		self.bar.button[i].autocast = _G[name .. "Shine"];
		self.bar.button[i].hotkey = _G[name .. "HotKey"];
		self.bar.button[i]:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2");
		--local oldNT = self.bar.button[i]:GetNormalTexture();
		--oldNT:Hide();

		--self.bar.button[i].normalTexture = self.bar.button[i]:CreateTexture(("%sDWNT"):format(name));
		self.bar.button[i].normalTexture = self.bar.button[i]:GetNormalTexture();
		--self.bar.button[i].normalTexture:SetAllPoints(oldNT);
		self.bar.button[i].pushedTexture = self.bar.button[i]:GetPushedTexture();
		self.bar.button[i].highlightTexture = self.bar.button[i]:GetHighlightTexture();

		self.bar.button[i].textureCache = {};
		self.bar.button[i].textureCache.normal = self.bar.button[i].normalTexture:GetTexture();
		self.bar.button[i].textureCache.pushed = self.bar.button[i].pushedTexture:GetTexture();
		self.bar.button[i].textureCache.highlight = self.bar.button[i].highlightTexture:GetTexture();

		if (i == 1) then
			self.bar.button[i]:SetPoint("BOTTOMLEFT", self.bar, "BOTTOMLEFT", 36, 2);
		else
			self.bar.button[i]:SetPoint("LEFT", self.bar.button[i-1], "RIGHT", 8, 0);
		end   
	end
	
	RegisterStateDriver(self.bar, "visibility", "[nopet]hide;[target=vehicle,exists,bonusbar:5]hide;show");
	
	self:PetActionBar_OnLoad (self.bar);

	self.bar:SetScript("OnEvent", function(this, event, ...)
		self:PetActionBar_OnEvent (this, event, ...);
	end);
	
	self.bar:SetScript("OnShow", function(this)
		UIParent_ManageFramePositions();
	end);
	self.bar:SetScript("OnHide", function(this)
		UIParent_ManageFramePositions();
	end);

	hooksecurefunc(dwPetActionBarFrame, "SetPoint", function(this, ...)
		PetActionBarPositionCache = {...};
	end);
	hooksecurefunc("UIParent_ManageFramePositions", function()	
		RePositionPetActionBar();
		dwDelayCall("RePositionPetActionBar", 0.5);
	end);
end

----------------
-- 判断是否有姿态条
function P:PetActionBarFrame_IsAboveShapeshift(ignoreShowing)
	return ( ((ShapeshiftBarFrame and GetNumShapeshiftForms() > 0) or (MultiCastActionBarFrame and HasMultiCastActionBar()) or
		(MainMenuBarVehicleLeaveButton and MainMenuBarVehicleLeaveButton:IsShown())) and
		(not MultiBarBottomLeft:IsShown() and MultiBarBottomRight:IsShown()) and
		(ignoreShowing or (PetActionBarFrame and PetActionBarFrame:IsShown())) and
		(ignoreShowing or (dwPetActionBarFrame and dwPetActionBarFrame:IsShown())));
end

function P:PetActionBar_Update (this)
	local button;
	for i=1, NUM_PET_ACTION_SLOTS, 1 do
		button = this.button[i];

		local name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(i);
		if ( not isToken ) then
			button.icon:SetTexture(texture);
			button.tooltipName = name;
		else
			button.icon:SetTexture(_G[texture]);
			button.tooltipName = _G[name];	
		end

		button.isToken = isToken;
		button.tooltipSubtext = subtext;

		if ( isActive ) then
			if ( IsPetAttackAction(i) ) then
				PetActionButton_StartFlash(button);			
				button:GetCheckedTexture():SetAlpha(0.5);
			else
				button:GetCheckedTexture():SetAlpha(1.0);
			end
			button:SetChecked(1);
		else
			if ( IsPetAttackAction(i) ) then
				PetActionButton_StopFlash(button);
			end
			button:SetChecked(0);
		end

		if ( autoCastAllowed ) then
			button.autocastable:Show();
		else
			button.autocastable:Hide();
		end
		if ( autoCastEnabled ) then
			AutoCastShine_AutoCastStart(button.autocast);
		else
			AutoCastShine_AutoCastStop(button.autocast);
		end
		
		if ( texture ) then
			if ( GetPetActionSlotUsable(i) ) then
				SetDesaturation(button.icon, nil);
			else
				SetDesaturation(button.icon, 1);
			end
			button.icon:Show();
			button.normalTexture:SetTexture(button.textureCache.normal);
			button.normalTexture:Show();
			button.pushedTexture:SetTexture(button.textureCache.pushed);
			button.highlightTexture:SetTexture(button.textureCache.highlight);
		else
			button.icon:Hide();
			--button.normalTexture:SetTexture("Interface\\Buttons\\UI-Quickslot2");
			if (this.showgrid == 0) then				
				button.normalTexture:Hide();
			end
			button.textureCache.normal = button.normalTexture:GetTexture();
			button.textureCache.pushed = button.pushedTexture:GetTexture();
			button.textureCache.highlight = button.highlightTexture:GetTexture();
			button.pushedTexture:SetTexture("");
			button.highlightTexture:SetTexture("");
		end
	end
		
	self:PetActionBar_UpdateCooldowns();	
end

function P:PetActionBar_UpdateCooldowns()
	local cooldown;
	for i=1, NUM_PET_ACTION_SLOTS, 1 do
		cooldown = self.bar.button[i].cooldown;
		local start, duration, enable = GetPetActionCooldown(i);
		CooldownFrame_SetTimer(cooldown, start, duration, enable);
	end
end

function P:PetActionBar_ShowGrid(this)
	this.showgrid = this.showgrid + 1;
	for i=1, NUM_PET_ACTION_SLOTS do
		this.button[i].normalTexture:SetTexture(this.button[i].textureCache.normal or "Interface\\Buttons\\UI-Quickslot2");
		this.button[i].normalTexture:Show();
	end
end

function P:PetActionBar_HideGrid(this)	
	if (this.showgrid > 0) then this.showgrid = this.showgrid - 1 end
	
	if (this.showgrid == 0) then
		local name;
		for i=1, NUM_PET_ACTION_SLOTS do	
			name = GetPetActionInfo(this.button[i]:GetID());
			if (not name) then
				this.button[i].normalTexture:SetTexture("");
				this.button[i].normalTexture:Hide();
			end
		end
	end
end

local function dwHidePetActionBar()
	local frame = CreateFrame("Frame");
	PetActionBarFrame:UnregisterAllEvents();
	PetActionBarFrame:SetParent(frame);
	frame:Hide();
end

function dwPetActionBarPosition_Toggle(switch)
	if (switch) then
		EnablePosition = true;
	else
		EnablePosition = false;
	end
end

dwHidePetActionBar();
P:CreatePetActionBar();

do
	if (IsAddOnLoaded("Bartender4")) then
		RegisterStateDriver(dwPetActionBarFrame, "visibility", "hide");
	else
		local frame = CreateFrame("Frame");
		frame:RegisterEvent("ADDON_LOADED");
		frame:SetScript("OnEvent", function(self, event, addon)
			if (event == "ADDON_LOADED" and (addon == "Bartender4" or addon == "Dominos")) then
				RegisterStateDriver(dwPetActionBarFrame, "visibility", "hide");
			end
		end);
	end	
end


------------------------
-- 载具按键
do
local HideFrame = CreateFrame("Frame");
HideFrame:Hide();
MainMenuBarVehicleLeaveButton:SetParent(HideFrame);
local _DEBUG = false;
function P:CreateLeaverVehicleButton()
	if (not self.leavebtn) then
		self.leavebtn = CreateFrame("Button", nil, UIParent);
		self.leavebtn:SetWidth(32);
		self.leavebtn:SetHeight(32);
		self.leavebtn:SetNormalTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up");
		self.leavebtn:GetNormalTexture():SetTexCoord(0.140625, 0.859375, 0.140625, 0.859375);
		self.leavebtn:SetPushedTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up");
		self.leavebtn:GetPushedTexture():SetTexCoord(0.140625, 0.859375, 0.140625, 0.859375);
		self.leavebtn:SetHighlightTexture("Interface\\Vehicles\\UI-Vehicles-Button-Highlight", "ADD");
		self.leavebtn:GetHighlightTexture():SetTexCoord(0.130625, 0.879375, 0.130625, 0.879375);

		self.leavebtn:SetScript("OnClick", VehicleExit);
		self.leavebtn:SetScript("OnEnter", function(self)
			GameTooltip_AddNewbieTip(self, LEAVE_VEHICLE, 1.0, 1.0, 1.0, nil);
		end);
		self.leavebtn:SetScript("OnLeave", function(self)
			GameTooltip:Hide();
		end);

		hooksecurefunc("MainMenuBarVehicleLeaveButton_Update", function()
			if ( CanExitVehicle() or _DEBUG) then
				self.leavebtn:ClearAllPoints();
				if ( IsPossessBarVisible() ) then
					self.leavebtn:SetPoint("LEFT", PossessButton2, "RIGHT", 30, 0);
				elseif (AspectPosionBarFrame and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then
					local num = AspectPosionBarFrame:GetNumShapeshiftForms()
					self.leavebtn:SetPoint("LEFT", "AspectPosionBarButton"..num, "RIGHT", 30, 0);
				elseif ( GetNumShapeshiftForms() > 0 ) then
					self.leavebtn:SetPoint("LEFT", "ShapeshiftButton"..GetNumShapeshiftForms(), "RIGHT", 30, 0);
				elseif ( HasMultiCastActionBar() ) then
					self.leavebtn:SetPoint("LEFT", MultiCastActionBarFrame, "RIGHT", 30, 0);
				else
					self.leavebtn:SetPoint("LEFT", PossessBarFrame, "LEFT", 10, 0);
				end
				self.leavebtn:Show();
			else
				self.leavebtn:Hide();
			end
		end);
	end
end

P:CreateLeaverVehicleButton()
end