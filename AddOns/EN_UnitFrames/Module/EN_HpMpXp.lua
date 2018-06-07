local RED     = "|cffff0000";
local GREEN   = "|cff00ff00";
local BLUE    = "|cff0000ff";
local MAGENTA = "|cffff00ff";
local YELLOW  = "|cffffff00";
local CYAN    = "|cff00ffff";
local WHITE   = "|cffffffff";
local NORMAL  = "|r";

function EUF_HpMpXp_OnLoad(self)
	self:RegisterEvent("VARIABLES_LOADED");
	self:RegisterEvent("UNIT_MANA");
	self:RegisterEvent("UNIT_HEALTH");
	self:RegisterEvent("UNIT_RAGE");
	self:RegisterEvent("UNIT_FOCUS");
	self:RegisterEvent("UNIT_ENERGY");
	self:RegisterEvent("UNIT_LEVEL");
	self:RegisterEvent("UNIT_MAXMANA");
	self:RegisterEvent("UNIT_MAXRAGE");
	self:RegisterEvent("UNIT_MAXFOCUS");
	self:RegisterEvent("UNIT_MAXENERGY");
	self:RegisterEvent("UNIT_MAXHAPPINESS");
	self:RegisterEvent("UNIT_MAXRUNIC_POWER");
	self:RegisterEvent("UNIT_DISPLAYPOWER");
	self:RegisterEvent("UPDATE_EXHAUSTION");
	self:RegisterEvent("UPDATE_FACTION");
	self:RegisterEvent("UPDATE_SHAPESHIFT_FORMS");
	self:RegisterEvent("UNIT_DISPLAYPOWER");
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE");
	self:RegisterEvent("UNIT_PET")
	self:RegisterEvent("PARTY_MEMBERS_CHANGED");
	self:RegisterEvent("PARTY_MEMBER_ENABLE");
	self:RegisterEvent("PARTY_MEMBER_DISABLE");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_LEVEL_UP");
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("PLAYER_XP_UPDATE");
	TargetFrameTextureFrameManaBarText:SetAlpha(0);
	TargetFrameTextureFrameHealthBarText:SetAlpha(0);
	FocusFrameTextureFrameHealthBarText:SetAlpha(0);
	FocusFrameTextureFrameManaBarText:SetAlpha(0);
	--FocusFrameManaBarText:SetAlpha(0);
	--FocusFrameHealthBarText:SetAlpha(0);
	local parent = PlayerFrame;
	parent =  CreateFrame("Frame","PlayerValueFrame",parent);
	parent:SetWidth(PlayerFrame:GetWidth()-100);
	parent:SetHeight(PlayerFrame:GetHeight());
	parent:ClearAllPoints();
	parent:SetFrameLevel(PlayerFrame:GetFrameLevel()+2);
	parent:SetPoint("RIGHT",PlayerFrame,"RIGHT");
	
	local FontString = parent:CreateFontString("","OVERLAY");
	FontString:SetFont(ChatFontNormal:GetFont(),14)
	
	FontString:SetAllPoints(parent);
	FontString:ClearAllPoints();
	FontString:SetPoint("CENTER",parent,"CENTER",0,-8);
	parent.NewManaValue = FontString;	
	
	FontString = parent:CreateFontString("","OVERLAY");
	FontString:SetFont(ChatFontNormal:GetFont(),14)
	
	FontString:SetAllPoints(parent);
	FontString:ClearAllPoints();
	FontString:SetPoint("CENTER",parent,"CENTER",0,6);
	parent.NewHealthValue = FontString;
	parent:Hide();
	
end

function EUF_HpMpXp_OnEvent(event)
	if event == "UNIT_HEALTH" then
		EUF_HP_Update(arg1);
	elseif event == "UNIT_POWER" or event == "UNIT_MANA" or event == "UNIT_RAGE" or event == "UNIT_FOCUS" or event == "UNIT_ENERGY" or event == "UNIT_HAPPINESS" or event == "UNIT_MAXMANA" or event == "UNIT_MAXRAGE" or event == "UNIT_MAXFOCUS" or event == "UNIT_MAXENERGY" or event == "UNIT_MAXHAPPINESS" or event == "UNIT_DISPLAYPOWER" or event == "UNIT_RUNIC_POWER" or event == "UNIT_MAXRUNIC_POWER" then
		EUF_MP_Update(arg1);
	elseif event == "UNIT_PET" then
		EUF_PetFrameHPMP_Update()
	elseif event == "PARTY_MEMBERS_CHANGED" then
		EUF_PartyFrameHPMP_Update();
		EUF_PartyFrameDisplay_Update();
	elseif event == "PLAYER_TARGET_CHANGED" then
		EUF_TargetFrameHPMP_Update();
	elseif event == "PLAYER_ENTERING_WORLD" then
		EUF_Frame_Update();
		PlayerHp_Update();
		PlayerPower_Update();
	elseif event == "UNIT_LEVEL" or event == "UNIT_DISPLAYPOWER" then
		EUF_HP_Update(arg1);
		EUF_MP_Update(arg1);
	elseif event == "PLAYER_XP_UPDATE" or event == "UPDATE_FACTION" then
		EUF_PlayerFrameXp_Update();
	end
end

function PlayerHp_Update()
	local currValue
	local valueMax
	local percent
	
	local unit = PlayerFrame.unit or "player";
	currValue = UnitHealth(unit)
	valueMax = UnitHealthMax(unit)
	percent = math.floor(100 * currValue / valueMax);
	PlayerValueFrame.NewHealthValue:SetText( currValue.."/"..valueMax);

	EUF_PlayerFrameHP:SetText(currValue.."/"..valueMax)
	EUF_PlayerFrameHPPercent:SetText(percent .. "%")
end

function PlayerPower_Update()
	local currValue, valueMax, percent;
	local unit = PlayerFrame.unit or "player";
	currValue = UnitPower(unit);
	valueMax = UnitPowerMax(unit);	
	
 	if valueMax > 0 then
		PlayerValueFrame.NewManaValue:SetText( currValue.."/"..valueMax);
		EUF_PlayerFrameMP:SetText(currValue.."/"..valueMax);
	else
		PlayerValueFrame.NewManaValue:SetText("0/0");
		EUF_PlayerFrameMP:SetText("");
	end
end

--加入即時更新血量及上載具時更新為載具血量
PlayerFrameHealthBar:SetScript("OnValueChanged", function(self, value)
	local _, valueMax = self:GetMinMaxValues()
	local Value = self:GetValue()
	local percent = math.floor(100 * Value / valueMax)
	if(EUF_CurrentOptions) then
		if EUF_CurrentOptions["AUTOHEALTHCOLOR"] == 1 then
			PlayerFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(Value, valueMax));
		end
	end

	PlayerValueFrame.NewHealthValue:SetText( Value.."/"..valueMax);

	EUF_PlayerFrameHP:SetText(Value.."/"..valueMax)
	EUF_PlayerFrameHPPercent:SetText(percent .. "%")
end)

--加入即時更新魔力、能量、怒氣、符能值及上載具時更新為載具魔力
PlayerFrameManaBar:SetScript("OnValueChanged", function(self)
	local _, valueMax = self:GetMinMaxValues();
	local Value = self:GetValue();
	local percent = math.floor(100 * Value / valueMax);
	
	if valueMax > 0 then
		PlayerValueFrame.NewManaValue:SetText( Value.."/"..valueMax);
		EUF_PlayerFrameMP:SetText(Value.."/"..valueMax);
	else		
		PlayerValueFrame.NewManaValue:SetText("0/0");
		EUF_PlayerFrameMP:SetText("");
	end
end)

TargetFrameHealthBar:HookScript("OnValueChanged", function(self)
	EUF_HP_Update("target");
end)

function EUF_HpMpXp_Init()
	TargetFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPRIGHT", 95, 0);
	PetFrame:SetPoint("TOPLEFT","PlayerFrame","TOPLEFT",72,-72);
	PetName:SetPoint("BOTTOMLEFT","PetFrame","BOTTOMLEFT",50,31);	
	PartyMemberFrame1:ClearAllPoints();
	PartyMemberFrame1:SetPoint("TOPLEFT","UIParent","TOPLEFT",20,-180);
	PartyMemberFrame2:SetPoint("TOPLEFT","PartyMemberFrame1PetFrame","BOTTOMLEFT",-23,-16);
	PartyMemberFrame3:SetPoint("TOPLEFT","PartyMemberFrame2PetFrame","BOTTOMLEFT",-23,-16);
	PartyMemberFrame4:SetPoint("TOPLEFT","PartyMemberFrame3PetFrame","BOTTOMLEFT",-23,-16);
	EUF_Frame_Update();
end

-- PlayerFrame
function EUF_PlayerFramePosition_Update()
	
end

-- HP/MP/XP
function EUF_HP_Update(unit)
	if (unit and (unit == "player" or unit == "pet" or unit=="target" or unit =="focus" or  
	PartyMemberFrame1.unit == unit or PartyMemberFrame2.unit == unit or PartyMemberFrame3.unit == unit
	or PartyMemberFrame4.unit == unit)) then
		local currValue = UnitHealth(unit);
		local maxValue = UnitHealthMax(unit);
		local percent = math.floor(currValue * 100 / maxValue);
		local digit = EUF_FormatNumericValue(currValue)  .. " / " .. EUF_FormatNumericValue(maxValue);
		if (string.find(unit, "^party") or unit == PetFrame.unit) then
			digit = EUF_FormatNumericValue(currValue)  .. "/" .. EUF_FormatNumericValue(maxValue);
		end
		
		if percent and maxValue ~= 0 then
			
			percent = percent .. "%";
		else
			percent = "";
			digit = "";
		end

		if unit == "target" and 
			(UnitIsDead("target") or (MobHealth_GetTargetCurHP and UnitCanAttack("player", "target") and not UnitIsDead("target") and not UnitIsFriend("player", "target"))) then
			digit = "";
		end

		local unitObj, unitPercentObj, unitObjShow, unitPercentObjShow, unitId;

		if unit == PlayerFrame.unit then
			PlayerValueFrame.NewHealthValue:SetText( currValue.."/"..maxValue);
	--		unitObj = EUF_PlayerFrameHP;
	--		unitPercentObj = EUF_PlayerFrameHPPercent;
			if(EUF_CurrentOptions) then
				if EUF_CurrentOptions["AUTOHEALTHCOLOR"] == 1 then
					PlayerFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
				end
			end
		elseif unit == PetFrame.unit then
			unitObj = EUF_PetFrameHP;
			PetFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
		elseif unit == "target" then
			unitObj = EUF_TargetFrameHP;
			unitPercentObj = EUF_TargetFrameHPPercent;
			if EUF_CurrentOptions["AUTOHEALTHCOLOR"] == 1 then
				TargetFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
			end
		elseif (unit == "focus") then
			unitObj = EUF_FocusFrameHP;
			unitPercentObj = EUF_FocusFrameHPPercent;
			if EUF_CurrentOptions["AUTOHEALTHCOLOR"] == 1 then
				FocusFrameHealthBar:SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
			end
		else
			unitId = string.match(unit, "(%d)");
			if (unitId) then
				unitObj = dwGetglobal("EUF_PartyFrame" .. unitId .. "HP");
				unitPercentObj = dwGetglobal("EUF_PartyFrame" .. unitId .. "HPPercent");
				if(EUF_CurrentOptions)then
					if EUF_CurrentOptions["AUTOHEALTHCOLOR"] == 1 then
						dwGetglobal("PartyMemberFrame" .. unitId .. "HealthBar"):SetStatusBarColor(EUF_GetPercentColor(currValue, maxValue));
					end
				end
			end
			
		end
		if unitObj then
			unitObj:SetText(digit);
		end
		if unitPercentObj then
			unitPercentObj:SetText(percent);
		end
	end
end

function EUF_MP_Update(unit)
	if (unit and (unit == "player" or unit == "pet" or unit=="target" or unit =="focus" or  
	PartyMemberFrame1.unit == unit or PartyMemberFrame2.unit == unit or PartyMemberFrame3.unit == unit
	or PartyMemberFrame4.unit == unit)) then
		local currValue = UnitMana(unit);
		local maxValue = UnitManaMax(unit);
		local percent = math.floor(currValue * 100 / maxValue);
		local digit = EUF_FormatNumericValue(currValue)  .. " / " .. EUF_FormatNumericValue(maxValue);
		if (string.find(unit, "^party") or unit == "pet") then
			digit = EUF_FormatNumericValue(currValue)  .. "/" .. EUF_FormatNumericValue(maxValue);
		end
		
		if percent and maxValue ~= 0 then
			PlayerValueFrame.NewManaValue:SetText( currValue.."/"..maxValue);
			percent = percent .. "%";
		else
			percent = "";
			digit = "";
		end

		local unitObj, unitPercentObj, unitObjShow, unitPercentObjShow, unitId;

		if unit == PetFrame.unit then
			unitObj = EUF_PetFrameMP;
		elseif unit == "target" then
			unitObj = EUF_TargetFrameMP;
			--unitPercentObj = EUF_TargetFrameMPPercent;
		elseif unit == "focus" then
			unitObj = EUF_FocusFrameMP;
		else		
			unitId = string.match(unit, "(%d)");
			if (unitId) then
				unitObj = dwGetglobal("EUF_PartyFrame" .. unitId .. "MP");
				unitPercentObj = dwGetglobal("EUF_PartyFrame" .. unitId .. "MPPercent");	
			end		
		end

		if unitObj then
			unitObj:SetText(digit);
		end
		if unitPercentObj then
			unitPercentObj:SetText(percent);
		end
	end
end

-- XP
function EUF_PlayerFrameXp_Update()
	local name, reaction, mini, max, value = GetWatchedFactionInfo();
	max = max - mini;
	value = value - mini;
	mini = 0;
	local color = FACTION_BAR_COLORS[reaction]
	local playerReputation = value;
	local playerReputationMax = max;

	local playerXP = UnitXP("player");
	local playerXPMax = UnitXPMax("player");
	local playerXPRest = GetXPExhaustion();
	
	-- 显示声望
	if UnitLevel("player") == 80 and name then
		if(EUF_CurrentOptions) then
			if EUF_CurrentOptions["PLAYERHPMP"] == 1 then
				EUF_PlayerFrameXP:SetText(WHITE..string.format("%s %s/%s", name or "", value, max))
			else
				EUF_PlayerFrameXP:SetText(WHITE..string.format("%s/%s", value, max))
			end
		else
			EUF_PlayerFrameXP:SetText(WHITE..string.format("%s/%s", value, max))
		end

		EUF_PlayerFrameXPBar:SetMinMaxValues(min(0, playerReputation), playerReputationMax)
		EUF_PlayerFrameXPBar:SetValue(value)
		EUF_PlayerFrameXPBar:SetStatusBarColor(color.r, color.g, color.b)		
	else
		if EUF_CurrentOptions then 
			if not playerXPRest or EUF_CurrentOptions["PLAYERHPMP"] ~= 1 then				
				EUF_PlayerFrameXP:SetText(string.format("%s / %s", playerXP, playerXPMax));				
			else			
				EUF_PlayerFrameXP:SetText(string.format("%s/%s (+%s)", playerXP, playerXPMax, playerXPRest/2));				
			end
		
			EUF_PlayerFrameXPBar:SetMinMaxValues(min(0, playerXP), playerXPMax);
			EUF_PlayerFrameXPBar:SetValue(playerXP);
			EUF_PlayerFrameXPBar:SetStatusBarColor(0, 0.4, 1)
		end
	end
end

function EUF_PlayerFrameHPMP_Update()
	PlayerFrameHealthBar.lockColor = true;	
	PetFrameHealthBar.lockColor = true;
	local unit = PlayerFrame.unit or "player";	
	EUF_HP_Update(unit);
	EUF_MP_Update(unit);
end

function EUF_PetFrameHPMP_Update()
	local unit = PetFrame.unit or "pet";	
	EUF_HP_Update(unit);
	EUF_MP_Update(unit);
end

function EUF_TargetFrameHPMP_Update()
	TargetFrameHealthBar.lockColor = true;
	FocusFrameHealthBar.lockColor = true;
	EUF_HP_Update("target");
	EUF_MP_Update("target");
end

function EUF_FocusFrameHPMP_Update()	
	EUF_HP_Update("focus");
	EUF_MP_Update("focus");
end

function EUF_PartyFrameHPMP_Update()
	local unit;
	for i=1, GetNumPartyMembers() do
		_G["PartyMemberFrame"..i].lockColor = true;
		unit = _G["PartyMemberFrame"..i].unit or "party"..i;
		EUF_HP_Update(unit);
		EUF_MP_Update(unit);
	end
end

function EUF_FrameHPMP_Update()
	EUF_PlayerFrameHPMP_Update();
	EUF_PetFrameHPMP_Update();
	EUF_TargetFrameHPMP_Update();
	EUF_PartyFrameHPMP_Update();
	EUF_FocusFrameHPMP_Update()
end


-- Frame position / display adjust

function EUF_PlayerFrameFrm_Update()
end

hooksecurefunc("PetFrame_Update", function(self, override) 
	if EUF_CurrentOptions["PLAYERHPMP"] == 1 then	
		PetFrameTexture:SetTexture("Interface\\AddOns\\EN_UnitFrames\\Texture\\UI-PetFrameTexture");
	end
end)

if (_PetFrame_Update) then
	hooksecurefunc("_PetFrame_Update", function(...)
		if EUF_CurrentOptions["PLAYERHPMP"] == 1 then	
			PetFrameTexture:SetTexture("Interface\\AddOns\\EN_UnitFrames\\Texture\\UI-PetFrameTexture");
		end
	end);
end

function EUF_PlayerFrameExtBar_Update()
	if EUF_CurrentOptions["PLAYERHPMP"] == 1 then		
		EUF_PlayerFrameHP:Show();
		EUF_PlayerFrameMP:Show();		
		EUF_PlayerFrameHPPercent:Show();		
		EUF_PlayerFrameBackground:Show();
		EUF_PlayerFrameTextureExt:Show();
		EUF_PlayerFrameXPBarBorders:Show();
		-- 玩家头像
		PlayerFrameBackground:Hide();
		PlayerFrameTexture:Hide();
		-- 宠物头像
		PetFrameTexture:SetWidth(256);
		PetFrameTexture:SetTexture("Interface\\AddOns\\EN_UnitFrames\\Texture\\UI-PetFrameTexture");
		PetFrameHappiness:ClearAllPoints();
		PetFrameHappiness:SetPoint("LEFT", "PetFrame", "RIGHT", 70, -4);
		-- 闪烁纹理
		PlayerFrameFlash:SetWidth(335);
		PlayerFrameFlash:SetTexture("Interface\\AddOns\\EN_UnitFrames\\Texture\\UI-TargetingFrame-Flash");
		PlayerFrameFlash:SetTexCoord(0.7421875, 0, 0, 0.7265625);
		-- 目标头像
		dwSecureCall(TargetFrame.SetPoint, TargetFrame, "TOPLEFT", "PlayerFrame", "TOPRIGHT", 95, 0);
	else	
		EUF_PlayerFrameHP:Hide();
		EUF_PlayerFrameMP:Hide();
		EUF_PlayerFrameHPPercent:Hide();
		EUF_PlayerFrameBackground:Hide();
		EUF_PlayerFrameTextureExt:Hide();
		EUF_PlayerFrameXPBarBorders:Hide();
		-- 玩家头像
		PlayerFrameBackground:Show();
		PlayerFrameTexture:Show();
		-- 宠物头像
		PetFrameTexture:SetWidth(128);
		PetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-SmallTargetingFrame");
		PetFrameHappiness:ClearAllPoints();
		PetFrameHappiness:SetPoint("LEFT", "PetFrame", "RIGHT", -7, -4);
		-- 闪烁纹理
		PlayerFrameFlash:SetWidth(242);
		PlayerFrameFlash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
		PlayerFrameFlash:SetTexCoord(0.9453125, 0, 0, 0.181640625);
		-- 目标头像
		dwSecureCall(TargetFrame.SetPoint, TargetFrame, "TOPLEFT", "PlayerFrame", "TOPRIGHT", 10, 0);
	end
end

function EUF_PlayerFrameDisplay_Update()
	if (EUF_CurrentOptions)then
		-- 生命值
		if EUF_CurrentOptions["PLAYERHPMP"] == 0 then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHP, 0);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHPPercent, 0);
		else			
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHP, 1);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameHPPercent, 1);
		end
		
		-- 发力值
		if EUF_CurrentOptions["PLAYERHPMP"] == 0 then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMP, 0);			
		else
			EUF_ObjectDisplay_Update(EUF_PlayerFrameMP, 1);
		end

		-- 刷新经验条
		if (PlayerFrameAlternateManaBar:IsShown()) then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXP, 0);
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 0);
		else
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXP, EUF_CanXPBarShow());
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, EUF_CanXPBarShow());
		end
		
	end
end


function EUF_XPBarToggle(switch)
	if (switch) then
		EUF_CurrentOptions["PLAYERXP"] = 1;
		if (PlayerFrameAlternateManaBar:IsShown()) then
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 0);
		else
			EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 1);
		end
	else
		EUF_CurrentOptions["PLAYERXP"] = 0;		
		EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 0);
	end
end

function EUF_PetFrameDisplay_Update()
	local classLoc, class = UnitClass("player")

	if EUF_CurrentOptions then
		if EUF_CurrentOptions["PLAYERPETHPMP"] == 1 then
			EUF_PetFrameHP:Show()
		else
			EUF_PetFrameHP:Hide()
		end
	end
end

local partyTexts = {"HP", "HPPercent", "MP", "MPPercent"};
function EUF_PartyFrame_OnLoad(self)
	local text;
	for k, v in pairs(partyTexts) do
		text = dwGetglobal(self:GetName() .. v);
		text:SetFont(STANDARD_TEXT_FONT, 10, "OUTLINE");
	end
end

function EUF_PartyFrameExtBar_Update()
end

function EUF_PartyFrameDisplay_Update()
	EUF_PartyFrameExtBar_Update();
	for i=1, GetNumPartyMembers() do
		if EUF_CurrentOptions["PARTYHPMP"] == 0 then
			EUF_ObjectDisplay_Update(_G["EUF_PartyFrame"..i.."HP"], 0);
			EUF_ObjectDisplay_Update(_G["EUF_PartyFrame"..i.."MP"], 0);
			_G["PartyMemberFrame" .. i .. "Texture"]:SetWidth(128);
			_G["PartyMemberFrame" .. i .. "Texture"]:SetTexture("Interface\\TargetingFrame\\UI-PartyFrame");
			dwUpdateChatPopoPosition(0);
		else
			EUF_ObjectDisplay_Update(_G["EUF_PartyFrame"..i.."HP"], 1);
			EUF_ObjectDisplay_Update(_G["EUF_PartyFrame"..i.."MP"], 1);
			_G["PartyMemberFrame" .. i .. "Texture"]:SetWidth(260);
			_G["PartyMemberFrame" .. i .. "Texture"]:SetTexture("Interface\\AddOns\\EN_UnitFrames\\Texture\\UI-PartyFrame");
			dwUpdateChatPopoPosition(70);
		end
	end
end

function EUF_TargetFrameDisplay_Update()
	if(EUF_CurrentOptions) then
		EUF_ObjectDisplay_Update(EUF_TargetFrameHP, EUF_CurrentOptions["TARGETHPMP"]);
		EUF_ObjectDisplay_Update(EUF_TargetFrameHPPercent, EUF_CurrentOptions["TARGETHPMPPERCENT"]);
		EUF_ObjectDisplay_Update(EUF_TargetFrameMP, EUF_CurrentOptions["TARGETHPMP"]);
		EUF_ObjectDisplay_Update(EUF_TargetFrameMPPercent, EUF_CurrentOptions["TARGETHPMPPERCENT"]);
	end
end

function EUF_FrameDisplay_Update()
	EUF_PlayerFrameDisplay_Update();
	EUF_PetFrameDisplay_Update()
	EUF_TargetFrameDisplay_Update();
	EUF_PartyFrameDisplay_Update();
end

function EUF_Frame_Update()
	EUF_FrameDisplay_Update();
	EUF_FrameHPMP_Update();
	EUF_PlayerFrameXp_Update();
	EUF_PlayerFrameFrm_Update();
	EUF_PlayerFrameExtBar_Update();
	-- 加入上下載具時，頭像更新及死騎符文條位置
	dwUpdateRuneFrame();	
end

--Basic functions
function EUF_CanXPBarShow()
	local canShow = EUF_CurrentOptions["PLAYERXP"];
	-- 将AutoHide改为满级时显示声望条
	if (canShow == 1 and EUF_CurrentOptions["PLAYERXPAUTO"] == 0 and UnitLevel("player") and UnitLevel("player") >= 80) then
		canShow = 0;
	end
	return canShow;
end

-------------------
-- 经验条和德鲁伊发力条兼容
local function AlternateBarOnShow(self)
	local canShow = EUF_CanXPBarShow();
	if (canShow) then
		EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 0);
	end
end

local function AlternateBarOnHide(self)
	local canShow = EUF_CanXPBarShow();
	if (canShow) then
		EUF_ObjectDisplay_Update(EUF_PlayerFrameXPBar, 1);
	end
end

PlayerFrameAlternateManaBar:SetScript("OnShow", AlternateBarOnShow);
PlayerFrameAlternateManaBar:SetScript("OnHide", AlternateBarOnHide);