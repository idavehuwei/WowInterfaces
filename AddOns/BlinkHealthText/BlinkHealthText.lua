-------------------------------------------------------------------------------
--
--  Mod Name : BlinkHealthText 2.10
--  Author   : Blink
--- Edited by Shippensburg for enGB - 168735999 - 2006/12/19 ---
--- Re-edited by Kill 16.05.2007
--  Date     : 2005/05/10
--  LastUpdate : 2007/05/16
--
-------------------------------------------------------------------------------
-- Settings (Shippensburg)
local showstuffstatus = 2; 	-- 0=show only in combat,1=show only if in combat and having a target,2=show all the time, 3=show only when having a target.
-------------------------------------------------------------------------------
-- Settings (Kill)
local showfriends = true;	-- true to show friendly players in the target HUD, false otherwise.
local BHT_position = -50;	-- y-position on screen for the centre of the addon.
-------------------------------------------------------------------------------

local BHT_TextAlphaValue = 0.8; -- Changed alpha.
local BHT_TextHeight = 40;
local BHT_InCombat = 0;
local _DEBUG = false;
local BHT_ManaBarColor = {};
BHT_ManaBarColor["MANA"] = {0.2,0.2,1.0}; -- Changed both levels of indexing
BHT_ManaBarColor["RAGE"] = {1.0,0.0,0.2}; -- Changed both levels of indexing
BHT_ManaBarColor["FOCUS"] = {1.0,0.5,0.5}; -- Changed both levels of indexing
BHT_ManaBarColor["ENERGY"] = {1.0,1.0,0.5}; -- Changed both levels of indexing
BHT_ManaBarColor["HAPPINESS"] = {0.5,1.0,1.0}; -- Changed both levels of indexing
BHT_ManaBarColor["RUNES"] = {0.5,0.5,0.5}; -- Changed both levels of indexing
BHT_ManaBarColor["RUNIC_POWER"] = {0.0,0.82,1.0}; -- Changed both levels of indexing

--evaluates if showstuffstatus is fulfilled.
local function showstuff() 
	if (showstuffstatus == 0 and BHT_InCombat==1) then
		return true;
	elseif (showstuffstatus == 1 and BHT_InCombat==1 and UnitExists("target") and (not UnitIsFriend("player", "target") or showfriends)) then
		return true;
	elseif (showstuffstatus == 2) then
		return true;
	elseif (showstuffstatus == 3 and UnitExists("target") and (not UnitIsFriend("player", "target") or showfriends)) then
		return true;
	else
		return false;
	end
end

function BlinkHealthText_OnLoad(self)
	SlashCmdList["BHT"] = BHT_SlashCmdHandler;
	SLASH_BHT1 = "/bht";

	self:RegisterEvent("ADDON_LOADED");
	BlinkHealthTextPlayerText:SetAlpha(0.2);
	BlinkPowerTextPlayerText:SetAlpha(0.3);
	BlinkHealthTextTargetText:SetAlpha(0.2);
	BlinkPowerTextTargetText:SetAlpha(0.3);
	if (_DEBUG) then
		BHT_Toggle(true)
	end	
end

function BlinkHealthText_OnEvent(self, event)
	if ( event == "PLAYER_TARGET_CHANGED" )then
		if ( showstuff() ) then
			BHT_DisplayPlayerHealthText();
			BHT_DisplayPlayerPowerText();
			BlinkHealthTextPlayer:Show();
			BlinkPowerTextPlayer:Show();

			if (UnitExists("target") and (not UnitIsFriend("player", "target") or showfriends) ) then
				BHT_DisplayTargetHealthText();
				BHT_DisplayTargetPowerText();
				BlinkHealthTextTarget:Show();
				BlinkPowerTextTarget:Show();
				BlinkHitpointText:Show();
			else 					-- target is dead or something
				BlinkHealthTextTarget:Hide();
				BlinkPowerTextTarget:Hide();	
				BlinkHitpointText:Hide();
			end

		else
			BlinkHealthTextTarget:Hide();
			BlinkPowerTextTarget:Hide();
			BlinkHealthTextPlayer:Hide();
			BlinkPowerTextPlayer:Hide();
			BlinkHitpointText:Hide();
		end

	elseif ( event == "PLAYER_REGEN_DISABLED") then
		BHT_InCombat = 1;
		if (showstuff()) then
			BHT_DisplayPlayerHealthText();
			BHT_DisplayPlayerPowerText();
			BlinkHealthTextPlayer:Show();
			BlinkPowerTextPlayer:Show();
			if( UnitExists("target") and (not UnitIsFriend("player", "target") or showfriends) )then
				BHT_DisplayTargetHealthText();
				BHT_DisplayTargetPowerText();
				BlinkHealthTextTarget:Show();
				BlinkPowerTextTarget:Show();
				BlinkHitpointText:Show();
			else					-- target is dead or something, for weird zoning bug or despawn i guess
				BlinkHealthTextTarget:Hide();
				BlinkPowerTextTarget:Hide();
				BlinkHitpointText:Hide();
			end
		end
	elseif ( event == "PLAYER_REGEN_ENABLED") then
		BHT_InCombat = 0;
		if( not showstuff() ) then
			BlinkHealthTextPlayer:Hide();
			BlinkHealthTextTarget:Hide();
			BlinkPowerTextPlayer:Hide();
			BlinkPowerTextTarget:Hide();
			BlinkHitpointText:Hide();
		end
	elseif ( event == "ADDON_LOADED" and arg1 == "BlinkHealthText") then
		BHT_UpdateFrames();
	end
end

-------------------------------------------------------------------------------

function BlinkHealthTextPlayer_OnLoad(self)
	self:RegisterEvent("UNIT_HEALTH");
end

function BlinkHealthTextPlayer_OnEvent(self, event)
	if( arg1 == "player" )then
		BHT_DisplayPlayerHealthText();
	end
end

function BHT_DisplayPlayerHealthText()
	if (UnitHealthMax("player") > 0) then
		local perH = UnitHealth("player") / UnitHealthMax("player") * 100;
		if ( perH < 20 )then
			BlinkHealthTextPlayerText:SetTextColor(1.0, 0.0, 0.2);
		elseif( perH < 80 and perH >= 20 )then
			BlinkHealthTextPlayerText:SetTextColor(1.0, 1.0, 0.2);
		else
			BlinkHealthTextPlayerText:SetTextColor(0.0, 1.0, 0.2);
		end		

		BlinkHealthTextPlayerText:SetText(format("%d",perH).." %");	
		if (perH < 50) then
			BlinkHealthTextPlayerText:SetAlpha(BHT_TextAlphaValue);
			BlinkPowerTextPlayerText:SetAlpha(BHT_TextAlphaValue);
		else
			BlinkHealthTextPlayerText:SetAlpha(0.2);
			BlinkPowerTextPlayerText:SetAlpha(0.3);
		end
	end
end

-------------------------------------------------------------------------------

function BlinkPowerTextPlayer_OnLoad(self)
	-- Mana Events
	self:RegisterEvent("UNIT_MANA");
	self:RegisterEvent("UNIT_RAGE");
	self:RegisterEvent("UNIT_FOCUS");
	self:RegisterEvent("UNIT_ENERGY");
	self:RegisterEvent("UNIT_HAPPINESS");
	self:RegisterEvent("UNIT_MAXMANA");
	self:RegisterEvent("UNIT_MAXRAGE");
	self:RegisterEvent("UNIT_MAXFOCUS");
	self:RegisterEvent("UNIT_MAXENERGY");
	self:RegisterEvent("UNIT_MAXHAPPINESS");
	self:RegisterEvent("UNIT_DISPLAYPOWER");
	self:RegisterEvent("UNIT_RUNIC_POWER");
end

function BlinkPowerTextPlayer_OnEvent(self, event)
	if( arg1 == "player" )then
		BHT_DisplayPlayerPowerText();
	end
end

function BHT_DisplayPlayerPowerText()
	local currValue = UnitMana("player"); --Changed to specify the string explicity, grabbing "arg1" didn't work for some reason.	
	local info = BHT_ManaBarColor[select(2, UnitPowerType("player"))] or BHT_ManaBarColor["MANA"]; -- Changed indexing to LUA (starts at 1).
	BlinkPowerTextPlayerText:SetTextColor(info[1],info[2],info[3]); --Changed to specific indexing, somehow just giving it the whole array didn't work.
	BlinkPowerTextPlayerText:SetText(currValue);
	local perH = 0;
	if (UnitHealthMax("player") > 0) then
		perH = UnitHealth("player") / UnitHealthMax("player") * 100;
	end
	if (perH < 50) then
		BlinkPowerTextPlayerText:SetAlpha(BHT_TextAlphaValue);
	else
		BlinkPowerTextPlayerText:SetAlpha(0.3);
	end
end

-------------------------------------------------------------------------------

function BlinkHealthTextTarget_OnLoad(self)
	self:RegisterEvent("UNIT_HEALTH");
end

function BlinkHealthTextTarget_OnEvent(self, event)
	if( arg1 == "target" )then
		BHT_DisplayTargetHealthText();
	end
end

function BHT_DisplayTargetHealthText()
	local hp = UnitHealth("target");
	local hMax = UnitHealthMax("target");
	local perH = math.floor((hp/hMax)*100);
	hp = FormatLargeValue(hp);
	local dispText = "";
	local MHfound = false;
	--SendChatMessage("Arg1: "..arg1 ,"SAY","COMMON");
	if (UnitIsDead("target") or UnitIsGhost("target")) then -- Added dead check
		dispText = "Dead";
		BlinkHealthTextTargetText:SetTextColor(1.0, 0.0, 0.2);
	else		
		dispText = hp.." hp\n  "..perH.." %";	
		
		if ( perH < 20 )then
			BlinkHealthTextTargetText:SetTextColor(1.0, 0.0, 0.2);
		elseif( perH < 80 and perH >= 20 )then
			BlinkHealthTextTargetText:SetTextColor(1.0, 1.0, 0.2);
		else
			BlinkHealthTextTargetText:SetTextColor(0.0, 1.0, 0.2);
		end

		if (perH <50) then
			BlinkHealthTextTargetText:SetAlpha(BHT_TextAlphaValue);
			BlinkPowerTextTargetText:SetAlpha(BHT_TextAlphaValue);
		else
			BlinkHealthTextTargetText:SetAlpha(0.2);
			BlinkPowerTextTargetText:SetAlpha(0.3);
		end
	end
	if (dispText == "Dead") then
		BlinkHealthTextTargetText:SetAlpha(0.2);
	end
	BlinkHealthTextTargetText:SetText(dispText);	
end

-------------------------------------------------------------------------------

function BlinkPowerTextTarget_OnLoad(self)
	self:RegisterEvent("UNIT_MANA");
	self:RegisterEvent("UNIT_RAGE");
	self:RegisterEvent("UNIT_FOCUS");
	self:RegisterEvent("UNIT_ENERGY");
	self:RegisterEvent("UNIT_HAPPINESS");
	self:RegisterEvent("UNIT_MAXMANA");
	self:RegisterEvent("UNIT_MAXRAGE");
	self:RegisterEvent("UNIT_MAXFOCUS");
	self:RegisterEvent("UNIT_MAXENERGY");
	self:RegisterEvent("UNIT_MAXHAPPINESS");
	self:RegisterEvent("UNIT_DISPLAYPOWER");
end

function BlinkPowerTextTarget_OnEvent(self, event)
	if( arg1 == "target" )then
		BHT_DisplayTargetPowerText();
	end
end

function BHT_DisplayTargetPowerText()
	
	local maxValue = UnitManaMax("target"); --Changed way of determining Maximum "mana bar" value, old one always returned 100.
	local info = BHT_ManaBarColor[select(2, UnitPowerType("player"))] or BHT_ManaBarColor["MANA"]; -- Changed indexing to LUA (starts at 1).
	local class = "";
	local colorcode = "";
	
	if (UnitIsFriend("player", "target")) then
		colorcode = "|cFF00FF00";
	else
		colorcode = "|cFFFFFFFF";
	end

	local pvalue = "";
	if (maxValue == 0 or not UnitExists("target") or UnitIsDead("target") or UnitIsGhost("target") or not UnitIsConnected("target")) then -- Ripped from AG_UNITFRAMES
		pvalue= "";
	else
		currValue = UnitMana("target"); --Changed function for getting current value (old one gave errors).
		if( UnitClass("target") == "Rogue" and maxValue > 100 )then
			pvalue = currValue .. "/" .. maxValue;
		else
			pvalue = currValue;
		end
	end

	BlinkPowerTextTargetText:SetTextColor(info[1],info[2],info[3]); --Changed to specific indexing, somehow just giving it the whole array didn't work.
	BlinkPowerTextTargetText:SetText(pvalue .."\n"..colorcode..class);
	local perH = 0;
	if (UnitHealthMax("target") > 0) then
		perH = math.floor((UnitHealth("target") / UnitHealthMax("target"))*100);
	end
	if (perH < 50) then
		BlinkPowerTextTargetText:SetAlpha(BHT_TextAlphaValue);
	else			
		BlinkPowerTextTargetText:SetAlpha(0.3);
	end
end

function BHT_UpdateFrames()
	BlinkHealthTextFrame:SetPoint("CENTER",0,BHT_position);
end
-------------------------------------------------------------------------------
--aguf rip
function FormatLargeValue(value)
	if value < 9999 then
		return value;
	elseif value < 999999 then
		return string.format("%.1fk", value / 1000);
	else
		return string.format("%.2fm", value / 1000000);
	end
end

function BlinkHitpointText_OnLoad(self)
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("UNIT_COMBO_POINTS");
	BlinkHitpointTextTargetText:SetTextColor(1.0,1.0,0.5);
	BlinkHitTextTargetText:SetTextColor(1.0,1.0,0.5);
end

------------------
-- 这个也会引起taint
local AnimatingFrames = {};

local AnimUpdateFrame = CreateFrame("Frame");

local function Animation_UpdateFrame(self, animElapsed, animTable)
	local totalTime = animTable.totalTime
	if ( animElapsed and (animElapsed < totalTime)) then	--Should be animating
		local elapsedFraction = self.animReverse and (1-animElapsed/totalTime) or (animElapsed/totalTime);
		animTable.updateFunc(self, animTable.getPosFunc(self, elapsedFraction));
	else	--Just finished animating
		animTable.updateFunc(self, animTable.getPosFunc(self, self.animReverse and 0 or 1));
		self.animating = false;
		
		AnimatingFrames[self][animTable.updateFunc] = 0;	--We use 0 instead of nil'ing out because we don't want to mess with 'next' (used in pairs)
		
		if ( self.animPostFunc ) then
			self.animPostFunc(self);
		end

	end
end

local totalElapsed = 0;
local function Animation_OnUpdate(self, elapsed)
	totalElapsed = totalElapsed + elapsed;
	local isAnyFrameAnimating = false;
	for frame, frameTable in pairs(AnimatingFrames) do
		for frameTable, animTable in pairs(frameTable) do
			if ( animTable ~= 0 ) then
				Animation_UpdateFrame(frame, totalElapsed - frame.animStartTime, animTable);
				isAnyFrameAnimating = true;
			end
		end
	end
	if ( not isAnyFrameAnimating ) then
		table.wipe(AnimatingFrames);
		AnimUpdateFrame:SetScript("OnUpdate", nil);
	end
end

local function SetUpAnimation(frame, animTable, postFunc, reverse)
	if ( type(animTable.updateFunc) == "string" ) then
		animTable.updateFunc = frame[animTable.updateFunc];
	end
	if ( not AnimatingFrames[frame] ) then
		AnimatingFrames[frame] = {};
	end
	
	AnimatingFrames[frame][animTable.updateFunc] = animTable;
	
	frame.animStartTime = totalElapsed;
	frame.animReverse = reverse;	
	frame.animPostFunc = postFunc;
	frame.animating = true;
	
	animTable.updateFunc(frame, animTable.getPosFunc(frame, frame.animReverse and 1 or 0));
	
	AnimUpdateFrame:SetScript("OnUpdate", Animation_OnUpdate);
end

local function BlinkFirstHitpointText_AnimPos(self, fraction)
	return "CENTER", BlinkHealthTextFrame, "CENTER", 50 - fraction*50, 0;
end

local function BlinkOnHitpoint_AnimPos(self, fraction)
	return "CENTER", BlinkHealthTextFrame, "CENTER", 0 - fraction*5, 0;
end

local function BlinkOnHitpoint_AnimFinished(self)
	self:ClearAllPoints();
	self:SetPoint("CENTER", BlinkHealthTextFrame, "CENTER", 0, 0);
end

local HitComboAnimTable = {
	totalTime = 0.1,
	updateFunc = "SetPoint",
	getPosFunc = BlinkHitpointText_AnimPos,
}

function BlinkOnHitpoint_Animation(self, comboPoints)
	if (comboPoints == 1) then		
		HitComboAnimTable.getPosFunc = BlinkFirstHitpointText_AnimPos;
	elseif (comboPoints > 1) then
		HitComboAnimTable.getPosFunc = BlinkOnHitpoint_AnimPos;
	end
	SetUpAnimation(self, HitComboAnimTable, BlinkOnHitpoint_AnimFinished, false)
end

function BlinkHitpointText_OnEvent(self, event)
	if ( event == "PLAYER_TARGET_CHANGED" or (event == "UNIT_COMBO_POINTS" and arg1 == PlayerFrame.unit)) then
		local comboPoints = GetComboPoints(PlayerFrame.unit, "target");
		if (comboPoints > 0) then			
			BlinkHitpointTextTargetText:SetText(comboPoints);
			BlinkHitTextTargetText:SetText("hit");
			if (event == "UNIT_COMBO_POINTS") then
				BlinkOnHitpoint_Animation(self, comboPoints)
			end
		else
			BlinkHitpointTextTargetText:SetText("");
			BlinkHitTextTargetText:SetText("");
		end
	end
end

function BHT_SlashCmdHandler(msg)
	local _, _, carg1, carg2 = string.find(msg, "^([^ ]+)$");
	if not carg1 then
		_, _, carg1, carg2 = string.find(msg, "^([^ ]+)[ ]+([^ ]+)");
	end
	if carg1 then
		carg1 = string.lower(carg1);
	end

	if carg1 == "status" then
		if carg2 and (carg2 == "0" or carg2 == "1" or carg2 =="2" or carg2 == "3") then
			carg2 = floor(tonumber(carg2));
			showstuffstatus = carg2;
			BHT_UpdateFrames();
			DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r status set to: |cffaaaaaa"..showstuffstatus.."|r");
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r status: |cffaaaaaa"..showstuffstatus.."|r");
		end
	elseif carg1 == "showfriends" then
		if carg2 and (carg2=="true" or carg2=="false") then
			carg2 = BHT_convString(carg2);
            		showfriends = carg2;
		        BHT_UpdateFrames();
		        DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r showfriends set to: |cffaaaaaa"..BHT_convBool(showfriends).."|r");
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r showfriends: |cffaaaaaa"..BHT_convBool(showfriends).."|r");
		end
	elseif carg1 == "position" then
			if carg2 then
				carg2 = floor(tonumber(carg2));
	            		BHT_position = carg2;
			        BHT_UpdateFrames();
			        DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r y-position set to: |cffaaaaaa"..BHT_position.."|r");
			        BHT_UpdateFrames();
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBHT|r y-position: |cffaaaaaa"..BHT_position.."|r");
			end
	else
		DEFAULT_CHAT_FRAME:AddMessage("|cFF77BBFFBlinkHealthText continued|r v2.1");
	        DEFAULT_CHAT_FRAME:AddMessage(" - |cFFFFFF99status:|r 0=show only in combat,1=show only if in combat and having a target,2=show all the time, 3=show only when having a target. (|cffaaaaaa"..showstuffstatus .."|r)");
	        DEFAULT_CHAT_FRAME:AddMessage(" - |cFFFFFF99showfriends:|r Decides wether to show friendly targets or not. Set to true or false. (|cffaaaaaa".. BHT_convBool(showfriends) .."|r)");
	        DEFAULT_CHAT_FRAME:AddMessage(" - |cFFFFFF99position:|r Y-coordinate for the centre of the HUD. A normal value should be between -300 to 300. (|cffaaaaaa".. BHT_position .."|r)");
	end	
end

function BHT_convBool(value)
	if (value) then
		return "true";
	else
		return "false";
	end
end

function BHT_convString(value)
	if (value =="true") then
		return true;
	else
		return false;
	end
end

function BHT_Toggle(switch)
	if (switch) then
		BlinkHealthTextFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
		BlinkHealthTextFrame:RegisterEvent("PLAYER_REGEN_ENABLED");
		BlinkHealthTextFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
		BlinkHealthTextFrame:Show();
	else
		BlinkHealthTextFrame:UnregisterEvent("PLAYER_REGEN_DISABLED");
		BlinkHealthTextFrame:UnregisterEvent("PLAYER_REGEN_ENABLED");
		BlinkHealthTextFrame:UnregisterEvent("PLAYER_TARGET_CHANGED");
		BlinkHealthTextFrame:Hide();
	end
end