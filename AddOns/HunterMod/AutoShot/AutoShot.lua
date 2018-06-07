------------------------------------------------------------------------------------------
-- AutoShotBar ver 1.0
-- 日期: 2010-4-6
-- 作者: dugu
-- 描述: 猎人自动射击进度条
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
AutoShot = HunterMod:NewModule("AutoShotBar", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HunterMod");
local AutoShotBar_Enable = nil;

function AutoShotBar_OnLoad(self)
	dwRegisterForSaveFrame(self);
	self:SetMinMaxValues(0, 1);
	self:SetValue(1);
end

function AutoShot:FlashBar()
	if not AutoShotBar:IsVisible() then
		AutoShotBar:Hide();
	end
	if AutoShotBar:IsShown() then
		local min, max = AutoShotBar:GetMinMaxValues();
		AutoShotBar:SetValue(max);
		AutoShotBar:SetStatusBarColor(0.0, 1.0, 0.0);
		AutoShotBarSpark:Hide();
		AutoShotBarFlash:SetAlpha(0.0);
		AutoShotBarFlash:Show();
		AutoShotBar.casting = nil;
		AutoShotBar.flash = 1;
		AutoShotBar.fadeOut = 1;
	end
end

function AutoShot:StartCast(spell)
	local min, max = GetTime();
	
	if (spell and spell == L["Auto Shot"] or spell == L["Aimed Shot"]) then
		max = min + UnitRangedDamage("player");	
		AutoShotBar:SetStatusBarColor(1.0, 0.7, 0.0);		
		AutoShotBar:SetMinMaxValues(min, max);	
		AutoShotBar:SetValue(min);	
		AutoShotBar:SetAlpha(1.0);
		AutoShotBar.casting = 1;
		AutoShotBar.fadeOut = nil;
		AutoShotBarTextLeft:SetText(L["Auto Shot"]);
		AutoShotBarSpark:Show();
		AutoShotBar:Show();
	end
end
	   	   
function AutoShot:STOP_AUTOREPEAT_SPELL()	
	self:FlashBar();
end

function AutoShot:PLAYER_LOGIN()
	self:STOP_AUTOREPEAT_SPELL();
end

function AutoShot:PLAYER_ENTERING_WORLD()
	self:STOP_AUTOREPEAT_SPELL();
end

function AutoShot:UNIT_SPELLCAST_SENT(event, unit, spell, _, player)	
	--if (unit == "player" and spell == misDirect ) then
	--	misDirectPlayer = player;
	--end	
end

function AutoShot:UNIT_SPELLCAST_SUCCEEDED(event, unit, spell)	
	if (AutoShotBar_Enable and unit == "player") then
		self:StartCast(spell);
	end
	--[[
	if (enablemisDirect) then
		if (unit == "player" and spell == misDirect and IsInInstance()) then
			self:Yell(string.gsub(MISDIRECT_PATTERN, "$player", misDirectPlayer));
		end	
	end	
	]]
end

function AutoShotBar_OnUpdate(self)
	if (not AutoShotBar_Enable) then
		return;
	end

	local min, max = AutoShotBar:GetMinMaxValues();
	if self.casting then
		local status = GetTime();
		if status > max then
			status = max;
		end
		AutoShotBarTextRight:SetText(format("%0.1f",max-status));
		AutoShotBar:SetValue(status);
		AutoShotBarFlash:Hide();
		local sparkPosition = ((status - min) / (max - min)) * 195;
		if sparkPosition < 0 then
			sparkPosition = 0;
		end
		AutoShotBarSpark:SetPoint("CENTER", AutoShotBar, "LEFT", sparkPosition, 0);
	elseif self.flash then
		local alpha = AutoShotBarFlash:GetAlpha() + CASTING_BAR_FLASH_STEP;
		if alpha < 1 then
			AutoShotBarFlash:SetAlpha(alpha);
		else
			AutoShotBarFlash:SetAlpha(1.0);
			self.flash = nil;
		end
	elseif self.fadeOut then
		local alpha = self:GetAlpha() - CASTING_BAR_ALPHA_STEP;
		if alpha > 0 then
			self:SetAlpha(alpha);
		else
			self.fadeOut = nil;
			self:Hide();
		end
	end
end	

function AutoShotBar_OnMouseDown(self, button)
	if (not self.locked and IsShiftKeyDown()) then
		self:StartMoving()
		self.isMoving = true
	end
end

function AutoShotBar_OnMouseUp(self, button)
	if (self.isMoving) then
		self:StopMovingOrSizing()
		self.isMoving = false
	end
end

function AutoShot:Toggle(switch)
	if (switch) then
		self:RegisterEvent("STOP_AUTOREPEAT_SPELL");		
		self:RegisterEvent("PLAYER_LOGIN");
		self:RegisterEvent("PLAYER_ENTERING_WORLD");
		self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		AutoShotBar_Enable = true;
	else
		self:UnregisterEvent("STOP_AUTOREPEAT_SPELL");				
		self:UnregisterEvent("PLAYER_LOGIN");
		self:UnregisterEvent("PLAYER_ENTERING_WORLD");
		self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		self:FlashBar();

		AutoShotBar_Enable = false;
	end
end

function AutoShot:ToggleLock(switch)
	if (switch) then
		AutoShotBar:SetMovable(false);
		AutoShotBar.locked = true;
	else
		AutoShotBar:SetMovable(true);
		AutoShotBar.locked = false;
		if (self.isMoving) then
			self:StopMovingOrSizing()
			self.isMoving = false
		end
	end
end

function AutoShotBar_OnEnter(self)
	if (not AutoShotBar.locked) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
		GameTooltip:SetText(L["HunterMod:"], 1, 1, 1);
		GameTooltip:AddLine(L["Hold shift to move frame"]);
		GameTooltip:Show();
	end	
end

function AutoShotBar_OnLeave(self)
	GameTooltip:Hide();
end
