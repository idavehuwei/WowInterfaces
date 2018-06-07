------------------------------------------------------------------------------------------
-- CastDelayBar - ver 1.0
-- 作者: dugu
-- 日期: 2010年3月13日
-- 描述: 在系统的施法条上增加一条延迟条, 用以辅助判断施法是否完成
-- 版权所有 (c) duowan.com
-------------------------------------------------------------------------------------------

CastDelayBar = LibStub("AceAddon-3.0"):NewAddon("CastDelayBar", "AceEvent-3.0", "AceHook-3.0");
local C = CastDelayBar;
C.enable = true;
C.desc = true;

local CHANNELDELAY = "|cffff2020%-.2f|r"
local CASTDELAY = "|cffff2020%.1f|r"
local CASTCURR = "|cffFFFFFF%.1f|r"
local CASTMAX = "|cffFFFFFF%.1f|r"
local sendTime, timeDiff;

function C:OnInitialize()	
	self.playerName = UnitName("player");
	self.delayText = CastingBarFrame:CreateFontString(nil, "ARTWORK");
	self.delayText:SetPoint("RIGHT", CastingBarFrame, "RIGHT", -3, 2);
	self.delayText:SetFont(GameFontHighlight:GetFont(), 14);

	self.delayBar = CastingBarFrame:CreateTexture("StatusBar", "BACKGROUND");
	self.delayBar:SetHeight(CastingBarFrame:GetHeight());
	self.delayBar:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
	self.delayBar:SetVertexColor(0.8, 0, 0, 0.8)
	self.delayBar:Hide()	
	self:SecureHook("CastingBarFrame_OnUpdate");
end

function C:Toggle(switch)
	if (switch) then
		self:RegisterEvent("UNIT_SPELLCAST_SENT");
		self:RegisterEvent("UNIT_SPELLCAST_START");
		self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");		
		self:RegisterEvent("UNIT_SPELLCAST_DELAYED");
		self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE");
		self:RegisterEvent("UNIT_SPELLCAST_FAILED");
		self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
		self:RegisterEvent("UNIT_SPELLCAST_STOP", "SpellOther");
		self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", "SpellOther");
		
		self.enable = true;
	else
		self:UnregisterAllEvents();
		self.delayBar:Hide();
		self.delayText:Hide();
		self.enable = false;
	end
end

-- OnXX BEGIN --
function C:UNIT_SPELLCAST_SENT(event, unit, spell, rank, target)
	if unit ~= 'player' then
		return
	end
	if target then
		self.targetName = target;
	else
		self.targetName = self.playerName;
	end

	self.sendTime = GetTime()
end


function C:UNIT_SPELLCAST_START(event, unit)
	if unit ~= 'player' then
		return;
	end
	local spellName, _, _,_,startTime, endTime = UnitCastingInfo(unit);
	self.startTime = startTime / 1000;
	self.endTime = endTime / 1000;
	self.delay = 0;
	self.casting = true;
	self.channeling = nil;
	self.fadeOut = nil;
	self.spellName = spellName;

	if not self.sendTime then return end
	self.timeDiff = GetTime() - self.sendTime;
	local castlength = endTime - startTime;
	self.timeDiff = self.timeDiff > castlength and castlength or self.timeDiff;
end

function C:UNIT_SPELLCAST_CHANNEL_START(event, unit)
	if unit ~="player" or not self.sendTime then return end
	local spellName, _, _,_,startTime,endTime = UnitChannelInfo(unit);
	
	startTime = startTime / 1000;
	endTime = endTime / 1000;

	self.startTime = startTime;
	self.endTime = endTime;
	self.delay = 0;

	self.casting = nil;
	self.channeling = true;
	self.fadeOut = nil;	
	self.spellName = spellName;

	self.timeDiff = GetTime() - self.sendTime;
	local castlength = endTime - startTime;
	self.timeDiff = self.timeDiff > castlength and castlength or self.timeDiff;
end

function C:UNIT_SPELLCAST_DELAYED(event, unit)
	if unit ~= "player" then return end
	local oldStart = self.startTime;
	local spellName,_,text,_,startTime,endTime = UnitCastingInfo(unit);
	if not startTime then self.delay = 0 return end
	
	startTime = startTime/1000;
	endTime = endTime/1000;
	self.startTime = startTime;
	self.endTime = endTime;
	self.delay = (self.delay or 0) + (startTime - (oldStart or startTime));
	self.spellName = spellName;
end

function C:UNIT_SPELLCAST_CHANNEL_UPDATE(event, unit)
	if unit ~= "player" then return end

	local oldStart = self.startTime;
	local spellName, _, _, _, startTime, endTime = UnitChannelInfo(unit);


	if (not startTime) then self.delay = 0 return end
	startTime = startTime/1000;
	endTime = endTime/1000;
	self.startTime = startTime;
	self.endTime = endTime;
	self.spellName = spellName;

	self.delay = (self.delay or 0) + ((oldStart or startTime) - startTime);
end

function C:SpellOther(event, unit)
	if unit ~="player" then return end
	
	if event == "UNIT_SPELLCAST_STOP" then
		if self.casting then
			self.targetName = nil;
			self.casting = nil;
			self.fadeOut = true;
			self.stopTime = GetTime();
		end
	elseif (event == "UNIT_SPELLCAST_CHANNEL_STOP") then
		if self.channeling then
			self.channeling = nil;
			self.fadeOut = true;
			self.stopTime = GetTime();
		end
	end
end

function C:UNIT_SPELLCAST_FAILED(event, unit)
	if unit ~= "player" or self.channeling then return end
	self.targetName = nil;
	self.casting = nil;
	self.channeling = nil;
	self.fadeOut = true;
	if (not self.stopTime) then
		self.stopTime = GetTime();
	end
end

function C:UNIT_SPELLCAST_INTERRUPTED(event, unit)
	if unit ~= "player" then return end
	self.targetName = nil;
	self.casting = nil;
	self.channeling = nil;
	self.fadeOut = true;
	if (not self.stopTime) then
		self.stopTime = GetTime();
	end
end
----- END  ----

function C:CastingBarFrame_OnUpdate(frame, elapsed, ...)
	if frame.unit ~= "player" then return end	

	local currentTime = GetTime();
	local startTime = self.startTime;
	local endTime = self.endTime;
	local timeLeft,finishTime;
	if(endTime and startTime and self.timeDiff)then
		finishTime = endTime - startTime -self.timeDiff;
		timeLeft = currentTime - startTime - self.timeDiff;
		if(timeLeft<0)then 
			timeLeft=currentTime - startTime;
		end

		local castTime = finishTime - timeLeft;
		local duration = endTime - startTime;
		
		if (self.desc) then
			-- 倒数计时
			if(castTime > 0)then			
				self.delayText:SetText(format(CASTCURR, castTime))
			else
				self.delayText:SetText(format(CASTCURR, castTime));
			end
		else
			-- 正计时
			if(castTime > 0)then
				CastingBarFrameText:SetText(format("%s ("..CASTCURR.."/"..CASTMAX..")", self.spellName, timeLeft, duration));
				--self.delayText:SetText(format(CASTCURR.."/"..CASTMAX, timeLeft, duration))
			else
				CastingBarFrameText:SetText(format("%s ("..CASTCURR.."/"..CASTMAX..")", self.spellName, duration, duration));
				--self.delayText:SetText(format(CASTCURR.."/"..CASTMAX, duration, duration));
			end
		end		
	end
	if (self.casting) then
		if (currentTime > endTime) then
			self.casting = nil;
			self.fadeOut = true;
			self.stopTime = currentTime;
			return;
		end
	elseif(self.channeling) then
		if (currentTime > endTime) then
			self.channeling = nil
			self.fadeOut = true
			self.stopTime = currentTime
			return;
		end		
	end	

	if (self.enable and self.timeDiff) then			
		if (self.casting) then
			local modulus = self.timeDiff / frame.maxValue;
			if modulus > 1 then
				modulus = 1;
			elseif modulus < 0 then
				modulus = 0;
			end

			self.delayBar:SetPoint("RIGHT", frame, "RIGHT",  0, 0);
			self.delayBar:SetWidth(frame:GetWidth() * modulus);
			self.delayBar:Show();			
		elseif (self.channeling) then
			self.delayBar:Hide()			
		end
	end
end

function C:CastingOder_Toggle(switch)
	if (switch) then
		self.desc = false;
	else
		self.desc = true;
	end
end