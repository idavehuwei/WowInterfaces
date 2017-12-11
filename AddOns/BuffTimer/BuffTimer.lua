------------------------------------------------------------------------------------------
-- BuffTimer ver 1.0
-- 日期: 2010-3-31
-- 作者: dugu@bigfoot
-- 描述: 显示玩家Buff的详细时间, 无时间的显示N/A. 显示武器buff次数.
-- 版权所有 (c) duowan.com
-------------------------------------------------------------------------------------------

local BuffTimer = LibStub("AceAddon-3.0"):NewAddon("BuffTimer", "AceHook-3.0");
local B = BuffTimer;
local _G = _G;
B.enable = false;

function B:OnInitialize()
	SetCVar("buffDurations", "1");
	self:SecureHook("AuraButton_UpdateDuration");
	self:SecureHook("AuraButton_Update");
	self:SecureHook("TempEnchantButton_OnUpdate");
end

function B:GetFormatText(seconds)
	local tempTime, second;
	if (seconds) then
		if (seconds >= 86400) then
			tempTime = ceil(seconds / 86400);
			return format(DAY_ONELETTER_ABBR, tempTime);
		elseif (seconds >= 3600) then
			tempTime = ceil(seconds / 3600);
			return format(HOUR_ONELETTER_ABBR, tempTime);
		else
			tempTime = floor(seconds / 60);
			second = seconds - tempTime * 60;
			return format("%2d:%02d", tempTime, second);
		end
	end
end

-- 显示详细时间
function B:AuraButton_UpdateDuration(auraButton, timeLeft)
	-- 让系统自己的duration不可见	
	local duration = _G[auraButton:GetName().."Duration"];
	if (B.enable)then	
		duration:SetAlpha(0);
	else		
		duration:SetAlpha(1.0);		
	end
	
	-- 创建并显示时间
	local timerName = auraButton:GetName().."LeftTimer"
	local timer = _G[timerName];
	if (not timer) then
		timer = auraButton:CreateFontString(timerName, "BACKGROUND", "GameFontNormalSmall");
		timer:SetPoint("TOP", auraButton, "BOTTOM");
	end

	if (B.enable and timeLeft) then
		timer:SetText(self:GetFormatText(timeLeft));
		if (timeLeft < BUFF_WARNING_TIME) then
			timer:SetVertexColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b);
		elseif ( timeLeft < BUFF_DURATION_WARNING_TIME ) then
			timer:SetVertexColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
		else
			timer:SetVertexColor(GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b);
		end
		timer:Show();
	else
		timer:Hide();
	end	
end

-- 显示"N/A"
function B:AuraButton_Update(buttonName, _index, filter)	
	local buffName = buttonName.._index;
	local buff = _G[buffName];
	local buffDuration;
	if (buff) then
		buffDuration = _G[buffName.."Duration"];
		if (B.enable) then
			buffDuration:SetAlpha(0);
		else
			buffDuration:SetAlpha(1);
		end
		
		local unit = PlayerFrame.unit;
		local timerName = buff:GetName().."LeftTimer"
		local timer = _G[timerName];
		if (not timer) then
			timer = buff:CreateFontString(timerName, "BACKGROUND", "GameFontNormalSmall");
			timer:SetPoint("TOP", buff, "BOTTOM");
		end
		
		local name, rank, texture, count, debuffType, duration, expirationTime = UnitAura(unit, _index, filter);
		if (B.enable and name and (not expirationTime or expirationTime == 0)) then
			timer:Show();
			timer:SetText("|cff00ff00N/A|r");
		else
			timer:Hide();
		end
	end	
end

-- 显示次数
function B:TempEnchantButton_OnUpdate(self, elapsed)	
	local hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges = GetWeaponEnchantInfo();
	if ( hasOffHandEnchant ) then
		if (B.enable and offHandCharges > 0) then
			TempEnchant1Count:SetText("|cff00ff00"..offHandCharges.."|r");
			TempEnchant1Count:Show();
		else
			TempEnchant1Count:Hide();
		end
	end
	if ( hasMainHandEnchant ) then
		if (B.enable and mainHandCharges > 0) then
			TempEnchant2Count:SetText("|cff00ff00"..mainHandCharges.."|r");
			TempEnchant2Count:Show();
		else
			TempEnchant2Count:Hide();
		end
	end	
end

function BuffTimer_Toggle(switch)
	if (switch) then		
		B.enable = true;
	else
		B.enable = false;
	end
	BuffFrame_Update();
end