--============================================
-- 名称: DuowanPatch
-- 日期: 2009-12-16
-- 描述: 修复系统和其他插件的一些bug
-- 作者: dugu
-- 鸣谢: CWDG
-- 版权所有 (C) duowan
--============================================
-- 修复团队框架和宠物动作条bug
function cwdg_WatchRaidGroupButtons()
	local i;
	local button;
	for i=1, 40 do
		button = dwGetglobal("RaidGroupButton"..i);
		button:SetAttribute("type", "target");
		button:SetAttribute("unit", button.unit);
	end
end

function cwdg_WatchPetActionBar()
--	PetActionBarFrame:SetAttribute("unit", "pet");
--	RegisterUnitWatch(PetActionBarFrame);
end

local cwdg_button = CreateFrame("Frame");
cwdg_button:RegisterEvent("VARIABLES_LOADED");
cwdg_button:RegisterEvent("ADDON_LOADED");
cwdg_button:RegisterEvent("PLAYER_TARGET_CHANGED");
cwdg_button:SetScript("OnEvent", function(self, event, modname)
	if (event == "ADDON_LOADED" and modname == "Blizzard_RaidUI") then		
		dwSecureCall(cwdg_WatchRaidGroupButtons);
	elseif (event == "VARIABLES_LOADED") then		
		dwSecureCall(cwdg_WatchPetActionBar);
		
		--TargetFrame.totFrame = nil;
		--TargetFrameToT:SetAttribute("unit", "targettarget");
		--RegisterUnitWatch(TargetFrameToT);
	end
end);

-- 屏蔽界面失效的提醒
UIParent:UnregisterEvent("ADDON_ACTION_BLOCKED");


-------------------
-- 修正玩家进入战场后会出现脚本错误的问题。(BLZ the idiot)
-------------------
--[[
function WorldStateAlwaysUpFrame_FilterChatMsgSystem (message)
	local playerName;
	
	if ( GetBattlefieldWinner() ) then
		-- Filter out leaving messages when the battleground is over.
		for i, str in next, FILTERED_BG_CHAT_SUBTRACT do
			playerName = string.match(message, str);
			if ( playerName ) then
				return true;
			end
		end
	elseif ( WORLDSTATEALWAYSUPFRAME_TIMESINCESTART < WORLDSTATEALWAYSUPFRAME_TIMETORUN ) then
		-- Filter out leaving and joining messages when the battleground starts.
		for i, str in next, FILTERED_BG_CHAT_ADD do
			if (message) then
				playerName = string.match(message, str);
				if ( playerName ) then
					-- Trim realm names
					playerName = string.match(playerName, "([^%-]+)%-?.*") or playerName;
					ADDED_PLAYERS[playerName] = true;
					return true;
				end
			end
		end
		
		for i, str in next, FILTERED_BG_CHAT_SUBTRACT do
			playerName = string.match(message, str);
			if ( playerName ) then
				playerName = string.match(playerName, "([^%-]+)%-?.*") or playerName;
				SUBTRACTED_PLAYERS[playerName] = true;
				return true;
			end
		end
	end
	return false;
end
]]
if (not VoiceOptionsFrameAudioLabel) then
	CreateFrame("Frame", "VoiceOptionsFrameAudioLabel", UIParent);
end

-------------------
-- 和谐难看的字体
-------------------
--[[
SetTextStatusBarTextPrefix(PlayerFrameHealthBar, "");
SetTextStatusBarTextPrefix(PlayerFrameManaBar, "");
SetTextStatusBarTextPrefix(MainMenuExpBar, "");

hooksecurefunc("UnitFrameManaBar_Update", function(statusbar, unit)	
	if ( statusbar and unit == statusbar.unit ) then			
		SetTextStatusBarTextPrefix(statusbar, "");
		TextStatusBar_UpdateTextString(statusbar);		
	end	
end);


TextStatusBarText:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE");
NumberFontNormal:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE");
]]
--------------------
-- 交易和转让会长时提示

DWSecure_MoneyAmount = 1000000;

StaticPopupDialogs["DW_TRADE_MONEY"] = {
	text = DW_TRADEMONEY_CONFIRMATION,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		AcceptTrade()
	end,
	OnCancel = function(self)
	end,
	OnShow = function(self)
		MoneyFrame_Update(self.moneyFrame, MoneyInputFrame_GetCopper(TradePlayerInputMoneyFrame));
	end,
	hasMoneyFrame = 1,
	timeout = 0,
	hideOnEscape = 1,
};

TradeFrameTradeButton:SetScript("OnClick",function()
	local copper=MoneyInputFrame_GetCopper(TradePlayerInputMoneyFrame);
	if copper>=DWSecure_MoneyAmount then-- if copper >100G
		StaticPopup_Show("DW_TRADE_MONEY", UnitName("NPC"));
	else
		AcceptTrade()
	end
end);

SlashCmdList["GUILD_LEADER"] = function (msg)
	if( msg and (strlen(msg) > MAX_CHARACTER_NAME_BYTES) ) then
		ChatFrame_DisplayUsageError(ERR_NAME_TOO_LONG2);
		return;
	end
	if strlen(msg)>0 then
		StaticPopup_Show("CONFIRM_GUILD_PROMOTE", msg)
	elseif UnitName("target") then
		StaticPopup_Show("CONFIRM_GUILD_PROMOTE", UnitName("target"))
	end
end

--------------------
-- 成就的报错
function AchievementMicroButton_Update()
	
end

-------------------
-- 解决奖励动作条冷却时间和主动做条冲突问题
--
--function Duowan_FixActionBarCooldown()
--	local frame = DWActionBarAnchorFrame or CreateFrame("Frame", "DWActionBarAnchorFrame", UIParent, "SecureHandlerStateTemplate");
--
--	for i=1, NUM_ACTIONBAR_BUTTONS, 1 do
--		dwGetglobal("ActionButton" .. i):SetParent(frame);
--	end
--
--	frame:Execute([[
--		buttons = table.new(self:GetChildren());
--	]])
--
--	RegisterStateDriver(frame, "vis", "[bonusbar:1] hide; [bonusbar:2] hide; [bonusbar:3] hide; [bonusbar:4] hide; [bonusbar:6] hide; show");
--	frame:SetAttribute("_onstate-vis", [[
--		if (newstate == "show") then
--			for i, button in ipairs(buttons) do
--				button:Show();
--				button:SetAttribute("statehidden", nil);
--			end
--		else
--			for i, button in ipairs(buttons) do
--				button:Hide();
--				button:SetAttribute("statehidden", 1);
--			end
--		end
--	]]
--	);
--	MainMenuBar:SetFrameStrata("LOW");
--	BonusActionBarFrame:SetFrameStrata("MEDIUM");
--end
--
--local ccframe = CreateFrame("Frame");
--ccframe:RegisterEvent("ADDON_LOADED");
--ccframe:SetScript("OnEvent", function(self, event, addon)	
--	if (addon == "Duowan") then
--		Duowan_FixActionBarCooldown();
--	end
--end);

---------------------
-- LUA报错

function FixLuaDebugError()	
	ScriptErrorsFrameScrollFrameText.cursorOffset = 0;
end

dwAsynCall("Blizzard_DebugTools", "FixLuaDebugError");

----------------------
--  修复AtlastLoot报错

local function SetTranslations(...)
	local L = {}
	for i=1, select("#",...), 2 do
		local v, k = select(i,...)
		L[k] = v
	end
	LOCALIZED_CLASS_NAMES_MALE = L
end

if GetLocale() == "zhCN" then
	SetTranslations( "术士", "WARLOCK", "战士", "WARRIOR", "猎人", "HUNTER", "法师", "MAGE", "牧师", "PRIEST", "德鲁伊", "DRUID", "圣骑士", "PALADIN", "萨满祭司", "SHAMAN", "潜行者", "ROGUE", "死亡骑士", "DEATHKNIGHT", "术士", "WARLOCK", "战士", "WARRIOR", "猎人", "HUNTER", "法师", "MAGE", "牧师", "PRIEST", "德鲁伊", "DRUID", "圣骑士", "PALADIN", "萨满祭司", "SHAMAN", "潜行者", "ROGUE", "死亡骑士", "DEATHKNIGHT" )
elseif GetLocale()  == "zhTW" then
	SetTranslations( "術士", "WARLOCK", "戰士", "WARRIOR", "獵人", "HUNTER", "法師", "MAGE", "牧師", "PRIEST", "德魯伊", "DRUID", "聖騎士", "PALADIN", "薩滿", "SHAMAN", "盜賊", "ROGUE", "死亡騎士", "DEATHKNIGHT", "術士", "WARLOCK", "戰士", "WARRIOR", "獵人", "HUNTER", "法師", "MAGE", "牧師", "PRIEST", "德魯伊", "DRUID", "聖騎士", "PALADIN", "薩滿", "SHAMAN", "盜賊", "ROGUE", "死亡騎士", "DEATHKNIGHT" )
end

----------------------
-- 修复聊天记录上次发言
ChatTypeInfo.WHISPER.sticky = 0   -----将"1"全改为"0"即可
ChatTypeInfo.OFFICER.sticky = 0
ChatTypeInfo.RAID_WARNING.sticky = 0
ChatTypeInfo.CHANNEL.sticky = 0
ChatTypeInfo.BN_WHISPER.sticky = 0

-----------------------
-- 获得金钱显示字符串
-----------------------
function GetMoneyString(money)
	local goldString, silverString, copperString;
	local gold = floor(money / (COPPER_PER_SILVER * SILVER_PER_GOLD));
	local silver = floor((money - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER);
	local copper = mod(money, COPPER_PER_SILVER);
	
	if ( ENABLE_COLORBLIND_MODE == "1" ) then
		goldString = gold..GOLD_AMOUNT_SYMBOL;
		silverString = silver..SILVER_AMOUNT_SYMBOL;
		copperString = copper..COPPER_AMOUNT_SYMBOL;
	else
		goldString = format(GOLD_AMOUNT_TEXTURE, gold, 0, 0);
		silverString = format(SILVER_AMOUNT_TEXTURE, silver, 0, 0);
		copperString = format(COPPER_AMOUNT_TEXTURE, copper, 0, 0);
	end
	
	local moneyString = "";
	local separator = "";	
	if ( gold > 0 ) then
		moneyString = goldString;
		separator = " ";
	end
	if ( silver > 0 ) then
		moneyString = moneyString..separator..silverString;
		separator = " ";
	end
	if ( copper > 0 or moneyString == "" ) then
		moneyString = moneyString..separator..copperString;
	end
	
	return moneyString;
end

-----------------------
-- GetCurrentDungeonDifficulty
function GetCurrentDungeonDifficulty()
	local SysDif = 1;	--小队：1=普通 2=英雄		团队：1=10人  2=25人  3=10人(英雄)  4=25人(英雄)
	local EQDif = 0;	--返回值：1=普通  2=英雄  0=未知
	if UnitInRaid("player") then
		SysDif = GetRaidDifficulty();
		if not SysDif then return 0;end
		if SysDif == 1 or SysDif == 2 then
			EQDif = 1;
		else
			EQDif = 2;
		end
	elseif GetNumPartyMembers() > 0 then
		SysDif = GetDungeonDifficulty();
		if not SysDif then return 0;end
		if SysDif == 1 then
			EQDif = 1;
		else
			EQDif = 2;
		end
	end
	return EQDif;
end

-------------
-- 反和谐大脚的和谐
local oldSendChatMessage = SendChatMessage;
local dw2hx = {
	["多玩"] = "多·玩",
	["魔盒"] = "魔·盒",
	["盒子"] = "盒·子",
	["duowan"] = "duo-wan",
	["wowbox"] = "wow-box",
};

function SendChatMessage(msg, ...)
	local chatType, language, channel = ...;
	local msg = msg:gsub("多玩魔盒", "多·玩·魔·盒");
	for k, v in pairs(dw2hx) do
		msg = msg:gsub(k, v);
	end

	if (chatType and chatType == "WHISPER") then
		channel = channel:gsub("·", "");
	end
	oldSendChatMessage(msg, chatType, language, channel);
end

-------------
-- 拍卖行
function dwFixAuctionFrame()	
	AuctionFrame:SetAttribute("UIPanelLayout-enabled", false);
	hooksecurefunc(AuctionFrame, "SetAttribute", function(self, arg1, value)
		if (arg1 == "UIPanelLayout-enabled" and AuctionFrame:GetAttribute("UIPanelLayout-enabled")) then
			AuctionFrame:SetAttribute("UIPanelLayout-enabled", false);
		end		
	end)
end
tinsert(UISpecialFrames, "AuctionFrame");
dwAsynCall("Blizzard_AuctionUI", "dwFixAuctionFrame");

----------------------
-- 修复战斗记录溢出问题
do
local frame = CreateFrame("Frame");
frame.time = 0;
frame:SetScript("OnUpdate", function(self, elapsed)
	self.time = self.time + elapsed;
	if (self.time > 300) then
		self.time = 0;
		CombatLogClearEntries();
	end
end);
end
--------------
-- getglobal

function getglobal(name)
	return _G[name];
end
----------------------
-- DK 符文条
do
local AddOns = {"RuneHUD", "MagicRunes", "RuneWatch", "XPerl"};
local hasAddOn = false;
function dwRuneFrameHasOtherAddOn()
	local name, title, notes, enabled;
	if (hasAddOn) then
		return true;
	end
	for k, n in pairs(AddOns) do
		name, title, notes, enabled = GetAddOnInfo(n);
		if (name and enabled) then
			hasAddOn = true;
			return true;
		end
	end

	return false;
end

function dwUpdateRuneFrame()
	local _,class = UnitClass("player");
	if (class~="DEATHKNIGHT" or dwRuneFrameHasOtherAddOn()) then
		return;
	end
	local value = dwRawGetCVar("DuowanConfig", "isRuneFrameMove", 0);
	local scale = dwRawGetCVar("DuowanConfig", "RuneFrameScale", 1);
	dwSetScale(RuneFrame, scale);
	if (value == 0) then		
		if (PetFrame:IsVisible()) then			
			RuneFrame:ClearAllPoints();
			RuneFrame:SetPoint("TOP","PetFrame","BOTTOM", 25, 4);
		else
			RuneFrame:ClearAllPoints();
			RuneFrame:SetPoint("TOP", "PlayerFrame","BOTTOM", 90, 15);
		end
	else
		local pos = dwRawGetCVar("DuowanConfig", "RuneFramePos", nil);
		if (pos and type(pos) == "table" and not RuneFrame.isMoving) then
			RuneFrame:ClearAllPoints();
			RuneFrame:SetPoint(unpack(pos));
		end
	end
end
end

---------------
-- baseAlpha错误

--WatchFrame_SetBaseAlpha (1);

---------------
-- 使聊天栏可交互
do
	for i=1, 10 do
		local chatFrame = _G["ChatFrame"..i];
		FCF_SetUninteractable(chatFrame, false);
	end
	
	hooksecurefunc("FloatingChatFrame_Update", function (id, onUpdateEvent)
		local chatFrame = _G["ChatFrame"..id];
		FCF_SetUninteractable(chatFrame, false);
	end);
end

------------------
-- 屏蔽大脚世界频道进进出出的消息
ChatFrame_RemoveMessageGroup(ChatFrame1, "CHANNEL")

------------------
-- 调高连接点图层
--ComboFrame:SetFrameStrata("HIGH");
ComboFrame:SetFrameLevel(ComboFrame:GetFrameLevel()+5);