--============================================
-- 名称: DuowanPatch
-- 日期: 2009-12-16
-- 描述: 修复系统和其他插件的一些bug
-- 作者: dugu@bigfoot
-- 鸣谢: CWDG
-- 版权所有 (C) duowan
--============================================
-- 修复团队框架和宠物动作条bug
function cwdg_WatchRaidGroupButtons()
    local i;
    local button;
    for i=1, 40 do
        button = getglobal("RaidGroupButton"..i);
        button:SetAttribute("type", "target");
        button:SetAttribute("unit", button.unit);
    end
end

function cwdg_WatchPetActionBar()
    PetActionBarFrame:SetAttribute("unit", "pet");
    RegisterUnitWatch(PetActionBarFrame);
end

-- local cwdg_button = CreateFrame("Frame");
-- cwdg_button:RegisterEvent("VARIABLES_LOADED");
-- cwdg_button:RegisterEvent("ADDON_LOADED");
-- cwdg_button:RegisterEvent("PLAYER_TARGET_CHANGED");
-- cwdg_button:SetScript("OnEvent", function(self, event, modname)
--     if (event == "ADDON_LOADED" and modname == "Blizzard_RaidUI") then
--         dwSecureCall(cwdg_WatchRaidGroupButtons);
--     elseif (event == "VARIABLES_LOADED") then
--         -- dwSecureCall(cwdg_WatchPetActionBar);
--     end
-- end);

if GetLocale() == "zhTW" then
    -- talent
    --[[
    CreateFrame("Frame", "TalentFrameTab1Text");
    CreateFrame("Frame", "TalentFrameTab1");
    CreateFrame("Frame", "TalentFrameTab2Text");
    CreateFrame("Frame", "TalentFrameTab2");
    CreateFrame("Frame", "TalentFrameTab3Text");
    CreateFrame("Frame", "TalentFrameTab3");
    CreateFrame("Frame", "TalentFrameTalentPointsText");
    CreateFrame("Frame", "TalentFrame");
    CreateFrame("Frame", "TalentFramePointsMiddle");
    local function fixTalentBug()
        PlayerTalentFrameTalentPoints:SetPoint("RIGHT", "PlayerTalentFrameTalentPointsText", "LEFT", -3, 0);
        PlayerTalentFrameTalentPointsText:SetPoint("BOTTOMRIGHT", "PlayerTalentFrame", "BOTTOMLEFT", 252, 87);
        PlayerTalentFrameSpentPoints:SetPoint("TOP", "PlayerTalentFramePointsMiddle", "TOP", 0, -5);
    end

    function talentFrame_OnEvent(self, event, ...)
        if event == "ADDON_LOADED" then
            local addon = select(1, ...);
            if addon == "Blizzard_TalentUI" then
                fixTalentBug();
            end
        end
    end

    local fixFrame = CreateFrame("Frame");
    fixFrame:RegisterEvent("ADDON_LOADED");
    fixFrame:SetScript("OnEvent", function(self, event, ...)
        talentFrame_OnEvent(self, event, ...);
    end)

    PanelTemplates_TabResize_Origin = PanelTemplates_TabResize;
    PanelTemplates_TabResize = function(tab, padding, absoluteSize, maxWidth, absoluteTextSize)
        if( type(tab) == "number" ) then
            PanelTemplates_TabResize_Origin(padding, tab, absoluteSize, maxWidth, absoluteTextSize);
        else
            PanelTemplates_TabResize_Origin(tab, padding, absoluteSize, maxWidth, absoluteTextSize);
        end
    end
    ]]
end

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
SetTextStatusBarTextPrefix(PlayerFrameHealthBar, "");
SetTextStatusBarTextPrefix(PlayerFrameManaBar, "");
SetTextStatusBarTextPrefix(MainMenuExpBar, "");

hooksecurefunc("UnitFrameManaBar_Update", function(statusbar, unit)
    if ( statusbar and unit == statusbar.unit ) then
        SetTextStatusBarTextPrefix(statusbar, "");
        TextStatusBar_UpdateTextString(statusbar);
    end
end);

TextStatusBarText:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE");

NumberFontNormal:SetFont(STANDARD_TEXT_FONT, 13, "OUTLINE");

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

--local normal = GameTimeFrame:CreateTexture(nil);
--normal:SetTexture("Interface\\AddOns\\Duowan\\textures\\UI-Calendar-Button");
--normal:SetTexCoord(1, 0.390625, 0.0, 0.78125);
--GameTimeFrame:SetNormalTexture("Interface\\AddOns\\Duowan\\textures\\UI-Calendar-Button");

--------------------
-- 成就的报错
function AchievementMicroButton_Update()

end

-------------------
-- 解决奖励动作条冷却时间和主动做条冲突问题
--
--function Duowan_FixActionBarCooldown()
--  local frame = DWActionBarAnchorFrame or CreateFrame("Frame", "DWActionBarAnchorFrame", UIParent, "SecureHandlerStateTemplate");
--
--  for i=1, NUM_ACTIONBAR_BUTTONS, 1 do
--      getglobal("ActionButton" .. i):SetParent(frame);
--  end
--
--  frame:Execute([[
--      buttons = table.new(self:GetChildren());
--  ]])
--
--  RegisterStateDriver(frame, "vis", "[bonusbar:1] hide; [bonusbar:2] hide; [bonusbar:3] hide; [bonusbar:4] hide; [bonusbar:6] hide; show");
--  frame:SetAttribute("_onstate-vis", [[
--      if (newstate == "show") then
--          for i, button in ipairs(buttons) do
--              button:Show();
--              button:SetAttribute("statehidden", nil);
--          end
--      else
--          for i, button in ipairs(buttons) do
--              button:Hide();
--              button:SetAttribute("statehidden", 1);
--          end
--      end
--  ]]
--  );
--  MainMenuBar:SetFrameStrata("LOW");
--  BonusActionBarFrame:SetFrameStrata("MEDIUM");
--end
--
--local ccframe = CreateFrame("Frame");
--ccframe:RegisterEvent("ADDON_LOADED");
--ccframe:SetScript("OnEvent", function(self, event, addon)
--  if (addon == "Duowan") then
--      Duowan_FixActionBarCooldown();
--  end
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

----------------------
-- 重新定位宠物动作条
do
local frame = CreateFrame("Frame");
local PETACTIONBAR_XPOS;    -- 本地化变量
local enable = false;
local function UpdatePositionValue()
    if ( PetActionBarFrame_IsAboveShapeshift(true) ) then
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

    -- if ( AspectPosionBar and AspectPosionBar:IsShown() and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then
    --     local index = AspectPosionBarFrame:GetNumShapeshiftForms();
    --     PETACTIONBAR_XPOS = _G["AspectPosionBarButton" .. index]:GetRight() + 5;
    -- end
end

PetActionBarFrame_UpdatePosition = function()
    if (enable) then
        UpdatePositionValue();
        PetActionBarFrame.slideTimer=nil;
        PetActionBarFrame:ClearAllPoints();
        if ( AspectPosionBar and AspectPosionBar:IsShown() and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then
            PetActionBarFrame:SetPoint("TOPRIGHT", PetActionBarFrame:GetParent(), "BOTTOMRIGHT", 65, PETACTIONBAR_YPOS);
        else
            PetActionBarFrame:SetPoint("TOPLEFT", PetActionBarFrame:GetParent(), "BOTTOMLEFT", PETACTIONBAR_XPOS, PETACTIONBAR_YPOS);
        end
    end
end

frame:SetScript("OnEvent", PetActionBarFrame_UpdatePosition);
hooksecurefunc("UIParent_ManageFramePositions", function()
    RePositionPetActionBar();
    dwDelayCall("RePositionPetActionBar", 0.5);
end);

--hooksecurefunc("PetActionBar_UpdatePositionValues", function()
--  if (enable) then
        --UpdatePositionValue();
--  end
--end);

function PetActionBarFrameRePosition_Toggle(switch)
    if (switch) then
        enable = true;
        frame:RegisterEvent("PLAYER_REGEN_DISABLED");
    else
        enable = false;
        frame:UnregisterEvent("PLAYER_REGEN_DISABLED");
    end
    RePositionPetActionBar();
end

function IsRePositionPetActionBar()
    return enable;
end

function RePositionPetActionBar()
    dwSecureCall(PetActionBarFrame_UpdatePosition)
end
end

---------------------------
-- 离开载具后重新指定unit属性
do
    local UnitFrames = {
        "PlayerFrame",
        -- "TargetFrame",
        "PetFrame",
        "PartyMemberFrame1",
        "PartyMemberFrame2",
        "PartyMemberFrame3",
        "PartyMemberFrame4",
    };

    local frame = CreateFrame("Frame");
    frame:RegisterEvent("PLAYER_REGEN_ENABLED");
    frame:SetScript("OnEvent", function()
        for i, name in ipairs(UnitFrames) do
            if (_G[name] and _G[name].unit) then
                _G[name]:SetAttribute("unit", _G[name].unit);
            end
        end
    end);
end

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