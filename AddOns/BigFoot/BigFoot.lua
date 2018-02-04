--[[ BigFoot.lua
-- 这里设置的主要是关于变量存储的数据
-- 同时，一些简单的接口开关也设置在这里
-- 同时一个主要的功能是 定义设置界面的接口
-- 包括：
-- BigFoot_RegisterCheckBox
-- BigFoot_RegisterTitle
-- BigFoot_RegisterButton
-- BigFoot_SetModVariable
-- BigFoot_GetModVariable
-- BigFoot_ShowKeyBindingFrame
-- 版本：1.15 更新时间：2004年10月24日
-- 更新作者：Andy Xiao ]]

if (GetLocale() == "zhCN") then
    BF_BANK_OPEN_ALL_BAGS = "显示银行界面时打开所有背包";
    BF_SHOW_ACTUAL_LEVEL = "总是显示目标的详细等级";
    MOD_BAG_MANAGEMENT_TITLE = { "背包管理", "beibaoguanli" };
    BF_BANK_PURCHASE_CONFIRM = "在购买背包时需要得到确认";
    BF_BUY_CONFIRM = "你将购买一个新的背包，你确信是要购买吗？";
    BF_RELOADUI_CONFIRM = "该操作将会重新载入所有的插件，你确信要这么做吗？";
    BF_CENTER_TOOLTIP = "将信息提示放置在屏幕顶上";
    BF_MERCHANT_OPEN_ALL_BAGS = "同商人交易时自动打开背包";
    BF_TRADE_OPEN_ALL_BAGS = "与玩家交易时自动打开背包";
    BF_SHOW_FREE_SLOTS = "显示剩余背包空间";
    BF_URL_TEXT = "|cffffffff该功能将开启游戏外的网页，会导致当前任务切换到游戏外的IE浏览器。\n\n如果你想继续，请按\"|cffffd100Ctrl+C|r\"。\n|cff00ffff(该功能仅在客户端开启时才有效)|r|r";
    BF_HEADER = "大脚设置";
    BF_NAME = "大脚插件";
    TAB_OTHERS = "其它设置";
    TAB_ACTIONBAR = "动作条";
    TAB_GENERAL = "一般设置";
    ERR_FRIEND_ONLINE_SS = "|Hplayer:%s|h[%s]|h上线了。";
    BF_MINIBUTTON_TIP_TITLE = "大脚设置";
    BF_MINIBUTTON_TIP_TEXT = "◇左键单击按钮打开设置。\n◇右键单击按钮查看额外信息功能。\n◇按住按钮进行拖动，可以沿小地图外\n　沿改变按钮的位置。";
    BF_CLASS_WARRIOR = "战士";
    BF_CLASS_MAGE = "法师";
    BF_CLASS_SHAMAN = "萨满祭司";
    BF_CLASS_PALADIN = "圣骑士";
    BF_CLASS_ROGUE = "潜行者";
    BF_CLASS_HUNTER = "猎人";
    BF_CLASS_WARLOCK = "术士";
    BF_CLASS_PRIEST = "牧师";
    BF_CLASS_DRUID = "德鲁伊";
    BF_CLASS_DEATHKNIGHT = "死亡骑士";
    BF_VERSION_PATTERN = "|cff00e0e0当前大脚插件的版本为：<%s>。|r";
    BF_CHANGELOG_TEXT = "更新日志";
    BF_BASIC_INFO = "基本信息";
    BF_EXTRA_FUNCTION = "额外功能";
    BF_VERSION_INFO = "版本信息";
    BF_SHUANGCAI = "双采";
    MOD_HANDY_TOOLKIT = { "便捷工具", "bianjiegongju" };
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TITLE = "开启快速设置焦点的功能";
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TOOLTIP = "开启后，你可以通过按住Shift键点击目标头像来设置焦点目标";
    BF_BILLING_NAG_TITLE = "在线充值帐号";
    BF_BILLING_NAG_TEXT = "您的帐户中还有%d%s的剩余游戏时间，大脚(BigFoot)提供|cff00e0e0在线充值|r的功能，您是否想要在线充值帐号？";
    BF_FINDING_MINING = "寻找矿物";
    BF_FINDING_HERBS = "寻找草药";
elseif (GetLocale() == "zhTW") then
    BF_BANK_OPEN_ALL_BAGS = "顯示銀行界面時打開所有背包";
    BF_SHOW_ACTUAL_LEVEL = "總是顯示目標的詳細等級";
    MOD_BAG_MANAGEMENT_TITLE = { "背包管理", "beibaoguanli" };
    BF_BANK_PURCHASE_CONFIRM = "在購買背包時需要得到確認";
    BF_BUY_CONFIRM = "你將購買一個新的背包，你確定要購買嗎？";
    BF_RELOADUI_CONFIRM = "該操作將會重新載入所有的插件，你確信要這麼做嗎？";
    BF_CENTER_TOOLTIP = "將訊息提示放置在螢幕頂端";
    BF_MERCHANT_OPEN_ALL_BAGS = "與商人交易時自動打開背包";
    BF_TRADE_OPEN_ALL_BAGS = "與玩家交易時自動打開背包";
    BF_SHOW_FREE_SLOTS = "顯示剩餘背包空間";
    BF_URL_TEXT = "|cffffffff該功能將開啟遊戲外的網頁，會導致當前任務切換到遊戲外的IE流覽器。\n\n如果你想繼續，請按\"|cffffd100Ctrl+C|r\"。\n|cff00ffff(該功能僅在用戶端開啟時才有效)|r|r";
    BF_HEADER = "大腳設置";
    BF_NAME = "大腳插件";
    TAB_OTHERS = "其它設置";
    TAB_ACTIONBAR = "快捷列";
    TAB_GENERAL = "一般設置";
    BF_MINIBUTTON_TIP_TITLE = "大腳設置";
    BF_MINIBUTTON_TIP_TEXT = "◇左鍵單擊按鈕打開設置。\n◇右鍵單擊按鈕查看額外資訊功能。\n◇按住按鈕進行拖動，可以沿小地圖外\n　沿改變按鈕的位置。";
    BF_CLASS_WARRIOR = "戰士";
    BF_CLASS_MAGE = "法師";
    BF_CLASS_SHAMAN = "薩滿";
    BF_CLASS_PALADIN = "聖騎士";
    BF_CLASS_ROGUE = "盜賊";
    BF_CLASS_HUNTER = "獵人";
    BF_CLASS_WARLOCK = "術士";
    BF_CLASS_PRIEST = "牧師";
    BF_CLASS_DRUID = "德魯伊";
    BF_CLASS_DEATHKNIGHT = "死亡騎士";
    BF_VERSION_PATTERN = "|cff00e0e0當前大腳插件的版本為：<%s>。|r";
    BF_CHANGELOG_TEXT = "更新日誌";
    BF_BASIC_INFO = "基本資訊";
    BF_VERSION_INFO = "版本資訊";
    BF_EXTRA_FUNCTION = "額外功能";
    BF_SHUANGCAI = "雙采";
    MOD_HANDY_TOOLKIT = { "便捷工具", "bianjiegongju" };
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TITLE = "開啟快速設置焦點的功能";
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TOOLTIP = "開啟後，你可以通過按住Shift鍵點擊目標頭像來設置焦點目標";
    BF_FINDING_MINING = "尋找礦物";
    BF_FINDING_HERBS = "尋找草藥";
else
    BF_BANK_OPEN_ALL_BAGS = "Open all bags while talking with banker";
    BF_SHOW_ACTUAL_LEVEL = "Always show target's level";
    MOD_BAG_MANAGEMENT_TITLE = "Bag Management";
    BF_BANK_PURCHASE_CONFIRM = "Prompt before buy slots";
    BF_RELOADUI_CONFIRM = "The all addons will be reloaded. Are you sure?";
    BF_CENTER_TOOLTIP = "Rearrange Tooltip";
    BF_MERCHANT_OPEN_ALL_BAGS = "Open all bags while talking with vendor";
    BF_TRADE_OPEN_ALL_BAGS = "Open all bags while trading with player";
    BF_SHOW_FREE_SLOTS = "Show free bag slots";
    BF_URL_TEXT = "|cffffffThe function will open web page outside, it will change current task to Internet Explorer.\n\nIf you want to continue, press\"|cffffd100Ctrl+C|r\".\n|cff00ffff(Available when BigFoot Client is runing)|r|r";
    BF_HEADER = "BigFoot Menu";
    BF_NAME = "BigFoot";
    TAB_OTHERS = "Others";
    TAB_ACTIONBAR = "Action Bar";
    TAB_GENERAL = "General";
    BF_MINIBUTTON_TIP_TITLE = "BigFoot Settings";
    BF_MINIBUTTON_TIP_TEXT = "Left click to open settings window.\nRight click to view extra functions and information.\nDrag the button to change the position.";
    BF_BUY_CONFIRM = "You will buy a new slot, are you sure?";
    BF_CLASS_WARRIOR = "Warrior";
    BF_CLASS_MAGE = "Mage";
    BF_CLASS_SHAMAN = "Shaman";
    BF_CLASS_PALADIN = "Paladin";
    BF_CLASS_ROGUE = "Rogue";
    BF_CLASS_HUNTER = "Hunter";
    BF_CLASS_WARLOCK = "Warlock";
    BF_CLASS_PRIEST = "Priest";
    BF_CLASS_DRUID = "Druid";
    BF_CLASS_DEATHKNIGHT = "Death Knight";
    BF_VERSION_PATTERN = "|cff00e0e0The current version is <%s>.|r";
    BF_CHANGELOG_TEXT = "ChangeLog";
    BF_BASIC_INFO = "Basic Information";
    BF_VERSION_INFO = "Version Information";
    BF_EXTRA_FUNCTION = "Extra Function";
    BF_SHUANGCAI = "Dual Finding";
    MOD_HANDY_TOOLKIT = { "Handy Toolkit", "bianjiegongju" };
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TITLE = "Enable Fast Focus";
    MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TOOLTIP = "After you enable it, you can click target from by hold shift key to set focus frame.";
    BF_FINDING_MINING = "Find Minerals";
    BF_FINDING_HERBS = "Find Herbs";
end

BigFoot_5d3b9a2ca6fc05177c9c7949d0c9c6bf = 1;
BigFoot_LinkStatus = nil;
BigFoot_54712cfd3a2c182c0e5e07016c830ccb = {};

function MyIsShiftKeyDown()
    return not OldIsShiftKeyDown();
end

BigFoot_UiConfig = {};
BigFoot_Config = {};
BigFoot_Error = {};
BigFoot_Frames = {};
BigFoot_d3806086ba4f940b19e37717b6597f67 = nil;
BigFoot_1f0d236c734e8dd748891fc599685c78 = nil;
BigFoot_4d59c08ec7296e19dbad0febf86782fe = nil;
BigFoot_957ce86c4aba56a885cb1d30b235db38 = nil;
local BigFoot_43104c47cab724af636c611abe21ff77 = -1;
StaticPopupDialogs["PURCHASE"] = {
    text = BF_BUY_CONFIRM,
    button1 = TEXT(YES),
    button2 = TEXT(NO),
    OnAccept = function() BigFoot_957ce86c4aba56a885cb1d30b235db38(); end,
    OnCancel = function(BigFoot_3a41fa2f33897b6c190993d845e6b222) end,
    showAlert = 1,
    timeout = 0,
};
StaticPopupDialogs["RELOADUI_CONFIRM"] = {
    text = BF_RELOADUI_CONFIRM,
    button1 = TEXT(YES),
    button2 = TEXT(NO),
    OnAccept = function() ReloadUI(); end,
    OnCancel = function(data, reason)
        if (reason == "clicked" and type(StaticPopupDialogs["RELOADUI_CONFIRM"].onCancelled) == "function") then
            StaticPopupDialogs["RELOADUI_CONFIRM"].onCancelled();
        end
    end,
    showAlert = 1,
    timeout = 0,
    hideOnEscape = 1
};

function BigFoot_1e887744aaa20ee4406e11065d887af8()
    SetCVar("LinkStatus", "");
end

function BigFoot_OnInit(self)
    local BigFoot_9b3039b3425f7448d0cb3db285647465 = false;
    local locale = GetCVar("locale");
    if (string.len(locale) == 4) then
        BigFoot_9b3039b3425f7448d0cb3db285647465 = true;
        SetCVar("locale", locale .. " ");
    end
    RegisterCVar("BFClient");
    RegisterCVar("BFClient2");
    if (BigFoot_9b3039b3425f7448d0cb3db285647465) then
        if (GetCVar("BFClient") == "1") then
            BFClient_Running = true;
            SetCVar("BFClient2", "1");
        else
            BFClient_Running = false;
            SetCVar("BFClient2", "0");
        end
    else
        if (GetCVar("BFClient2") == "1") then
            BFClient_Running = true;
        else
            BFClient_Running = false;
        end
    end
    SetCVar("BFClient", "0");
    self:RegisterEvent("VARIABLES_LOADED");
    self:RegisterEvent("PLAYER_LOGIN");
    GameMenuFrame:SetWidth(165);
    GameMenuFrame:SetHeight(255);
    GameMenuButtonOptions:SetPoint("TOP", "BigFootMenuButtonOptions", "BOTTOM", 0, -1);
    ModManagement_RegisterMod("BagManagement", "Interface\\Icons\\INV_Misc_Bag_16", MOD_BAG_MANAGEMENT_TITLE, "", nil);
    ModManagement_RegisterCheckBox("BagManagement", BF_MERCHANT_OPEN_ALL_BAGS, nil, "EnabelOpenAllBagsOnMerchant", 0, function(arg)
        if (arg == 1) then
            BigFootFrame:RegisterEvent("MERCHANT_SHOW");
            BigFootFrame:RegisterEvent("MERCHANT_CLOSED");
        else
            BigFootFrame:UnregisterEvent("MERCHANT_SHOW");
            BigFootFrame:UnregisterEvent("MERCHANT_CLOSED");
        end
    end);
    ModManagement_RegisterCheckBox("BagManagement", BF_BANK_OPEN_ALL_BAGS, nil, "EnabelOpenAllBagsOnBank", 0, function(arg)
        if (arg == 1) then
            BigFootFrame:RegisterEvent("BANKFRAME_OPENED");
            BigFootFrame:RegisterEvent("BANKFRAME_CLOSED");
        else
            BigFootFrame:UnregisterEvent("BANKFRAME_OPENED");
            BigFootFrame:UnregisterEvent("BANKFRAME_CLOSED");
        end
    end);
    ModManagement_RegisterCheckBox("BagManagement", BF_TRADE_OPEN_ALL_BAGS, nil, "EnabelOpenAllBagsOnTrading", 0, function(arg)
        if (arg == 1) then
            BigFootFrame:RegisterEvent("TRADE_SHOW");
            BigFootFrame:RegisterEvent("TRADE_CLOSED");
        else
            BigFootFrame:UnregisterEvent("TRADE_SHOW");
            BigFootFrame:UnregisterEvent("TRADE_CLOSED");
        end
    end);
    ModManagement_RegisterCheckBox("BagManagement", BF_BANK_PURCHASE_CONFIRM, nil, "EnablePurchaseConfirm", 1, function(arg)
        if (arg == 1) then
            if (not BigFoot_957ce86c4aba56a885cb1d30b235db38) then
                BigFoot_957ce86c4aba56a885cb1d30b235db38 = PurchaseSlot;
                PurchaseSlot = BigFoot_c2c8715b508af07adc7d4906f8fdbbd3;
            end
        else
            if (BigFoot_957ce86c4aba56a885cb1d30b235db38) then
                PurchaseSlot = BigFoot_957ce86c4aba56a885cb1d30b235db38;
                BigFoot_957ce86c4aba56a885cb1d30b235db38 = nil;
            end
        end
    end);
    ModManagement_RegisterCheckBox("BagManagement", BF_SHOW_FREE_SLOTS, nil, "ShowFreeSlots", 1, function(arg)
        if (arg == 1) then
            SetCVar("displayFreeBagSlots", 1);
            MainMenuBarBackpackButtonCount:Show();
        else
            SetCVar("displayFreeBagSlots", 0);
            MainMenuBarBackpackButtonCount:Hide();
        end
    end);
    local Button;
    ModManagement_RegisterMod("HandyToolkit", "Interface\\Icons\\Spell_Holy_AvengineWrath", MOD_HANDY_TOOLKIT);
    ModManagement_RegisterCheckBox("HandyToolkit", MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TITLE, MOD_ARENA_TOOLKIT_ENABLE_FAST_FOCUS_TOOLTIP, "EnableFasyFocus", 1, function(arg)
        if (arg == 1) then
            TargetFrame:SetAttribute("shift-type1", "focus");
            TargetFrame:SetAttribute("shift-type2", "macro");
            TargetFrame:SetAttribute("macrotext", "/CLEARFOCUS");
        else
            TargetFrame:SetAttribute("shift-type1", nil);
            TargetFrame:SetAttribute("shift-type2", nil);
            TargetFrame:SetAttribute("macrotext", nil);
        end
    end);
    ModManagementFrame:SetAttribute("UIPanelLayout-defined", true);
    ModManagementFrame:SetAttribute("UIPanelLayout-area", "center");
    ModManagementFrame:SetAttribute("UIPanelLayout-pushable", 0);
    ModManagementFrame:SetAttribute("UIPanelLayout-enabled", true);
    SlashCmdList["STOPMOVING"] = BigFoot_6b2b31b051710342eee9ef69c10b3393;

    SLASH_STOPMOVING1 = "/stopmoving";
    SLASH_STOPMOVING2 = "/stop";
    SlashCmdList["LANGUAGE"] = BigFoot_8d79bb4c337dcca50609d247e0e62569;
    SLASH_LANGUAGE1 = "/language";
    SLASH_LANGUAGE2 = "/lang";

    BigFoot_fff18c914a5b3a8d509f2dff0f3fc382();
    if (BigFoot_IsClientRunning() and GetLocale() == "zhCN") then
        StaticPopupDialogs["BILLING_NAG"] = {
            text = BF_BILLING_NAG_TEXT,
            button1 = OKAY,
            button2 = CANCEL,
            OnAccept = function()
                BigFoot_LaunchURL(BF_BILLING_NAG_TITLE, "http://www.ofcard.com/ddtx.do?cardid=220902&username=sharak");
            end,
            timeout = 0,
            hideOnEscape = 1
        };
        UIParent:UnregisterEvent("BILLING_NAG_DIALOG");
        self:RegisterEvent("BILLING_NAG_DIALOG");
    end
end

function DistanceAlert_Toggle(switch)
    if (switch) then
        BigFoot_DistanceAlert = {};
        BigFoot_DistanceAlert.color = {};
        BigFoot_DistanceAlert.color.r = 0.5;
        BigFoot_DistanceAlert.color.g = 0.1;
        BigFoot_DistanceAlert.color.b = 0.1;
        if (not BigFoot_9efc0a3d4d310212f05ebe4125da9332) then
            hooksecurefunc("ActionButton_OnUpdate", BigFoot_ActionButton_OnUpdate);
            BigFoot_9efc0a3d4d310212f05ebe4125da9332 = true
        end
    else
        BigFoot_DistanceAlert = nil;
    end
end

function BigFoot_OnEvent(self, event, arg1)
    if (event == "PLAYER_LOGIN") then
        BigFoot_5cce98c7af8139064e065c4da9901881();
    elseif (event == "BANKFRAME_OPENED" or event == "MERCHANT_SHOW" or event == "TRADE_SHOW") then
        OpenAllBags(1);
    elseif (event == "BANKFRAME_CLOSED" or event == "MERCHANT_CLOSED" or event == "TRADE_CLOSED") then
        CloseAllBags();
    elseif (event == "BILLING_NAG_DIALOG") then
        StaticPopup_Show("BILLING_NAG", arg1);
    end
end

function BigFoot_RegisterCheckBox(__mod, page, text, BigFoot_6c162b1123a1eb57c1827271b32b6959, BigFoot_be741bd2030ad8ad70d14fb34b673ab8, BigFoot_45843be1bc05f0297089e6a3e93d0ab0, BigFoot_6aec56fd400c2ff60374decd93586868, BigFoot_1d5d5e28f21a78eec0db2c41dbfd6351)
    local BigFoot_7e7860987b220bb966092ef46f8a8f44 = {};
    BigFoot_7e7860987b220bb966092ef46f8a8f44.type = "CHECKBOX";
    BigFoot_7e7860987b220bb966092ef46f8a8f44.mod = __mod;
    if (page == nil) then
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = "TAB_GENERAL";
    else
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = page;
    end
    BigFoot_7e7860987b220bb966092ef46f8a8f44.text = text;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.tooltip = BigFoot_6c162b1123a1eb57c1827271b32b6959;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.variable = BigFoot_be741bd2030ad8ad70d14fb34b673ab8;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.default = BigFoot_45843be1bc05f0297089e6a3e93d0ab0;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.callback = BigFoot_6aec56fd400c2ff60374decd93586868;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.filter = BigFoot_1d5d5e28f21a78eec0db2c41dbfd6351;
    table.insert(BigFoot_UiConfig, BigFoot_7e7860987b220bb966092ef46f8a8f44);
end

function BigFoot_RegisterEditBox(__mod, page, text, BigFoot_6c162b1123a1eb57c1827271b32b6959, BigFoot_be741bd2030ad8ad70d14fb34b673ab8, BigFoot_45843be1bc05f0297089e6a3e93d0ab0, BigFoot_6aec56fd400c2ff60374decd93586868, BigFoot_1d5d5e28f21a78eec0db2c41dbfd6351)
    local BigFoot_7e7860987b220bb966092ef46f8a8f44 = {};
    BigFoot_7e7860987b220bb966092ef46f8a8f44.type = "EDITBOX";
    BigFoot_7e7860987b220bb966092ef46f8a8f44.mod = __mod;
    if (page == nil) then
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = "TAB_GENERAL";
    else
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = page;
    end
    BigFoot_7e7860987b220bb966092ef46f8a8f44.text = text;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.tooltip = BigFoot_6c162b1123a1eb57c1827271b32b6959;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.variable = BigFoot_be741bd2030ad8ad70d14fb34b673ab8;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.default = BigFoot_45843be1bc05f0297089e6a3e93d0ab0;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.callback = BigFoot_6aec56fd400c2ff60374decd93586868;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.filter = BigFoot_1d5d5e28f21a78eec0db2c41dbfd6351;
    table.insert(BigFoot_UiConfig, BigFoot_7e7860987b220bb966092ef46f8a8f44);
end

function BigFoot_RegisterTitle(__mod, page, text)
    local BigFoot_7e7860987b220bb966092ef46f8a8f44 = {};
    BigFoot_7e7860987b220bb966092ef46f8a8f44.type = "TITLE";
    BigFoot_7e7860987b220bb966092ef46f8a8f44.mod = __mod;
    if (page == nil) then
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = "TAB_GENERAL";
    else
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = page;
    end
    BigFoot_7e7860987b220bb966092ef46f8a8f44.text = text;
    table.insert(BigFoot_UiConfig, BigFoot_7e7860987b220bb966092ef46f8a8f44);
end

function BigFoot_RegisterButton(__mod, page, text, BigFoot_6c162b1123a1eb57c1827271b32b6959, BigFoot_6aec56fd400c2ff60374decd93586868)
    local BigFoot_7e7860987b220bb966092ef46f8a8f44 = {};
    BigFoot_7e7860987b220bb966092ef46f8a8f44.type = "BUTTON";
    BigFoot_7e7860987b220bb966092ef46f8a8f44.mod = __mod;
    if (page == nil) then
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = "TAB_GENERAL";
    else
        BigFoot_7e7860987b220bb966092ef46f8a8f44.page = page;
    end
    BigFoot_7e7860987b220bb966092ef46f8a8f44.text = text;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.tooltip = BigFoot_6c162b1123a1eb57c1827271b32b6959;
    BigFoot_7e7860987b220bb966092ef46f8a8f44.callback = BigFoot_6aec56fd400c2ff60374decd93586868;
    table.insert(BigFoot_UiConfig, BigFoot_7e7860987b220bb966092ef46f8a8f44);
end

function BigFoot_a7b561b7f447a75e6e1b9a0478c24d60(__mod, BigFoot_be741bd2030ad8ad70d14fb34b673ab8)
    for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_7e7860987b220bb966092ef46f8a8f44 in pairs(BigFoot_UiConfig) do
        if (__mod == BigFoot_7e7860987b220bb966092ef46f8a8f44.mod and BigFoot_be741bd2030ad8ad70d14fb34b673ab8 == BigFoot_7e7860987b220bb966092ef46f8a8f44.variable) then
            return BigFoot_7e7860987b220bb966092ef46f8a8f44.default;
        end
    end
end

function BigFoot_GetModVariable(__mod, BigFoot_be741bd2030ad8ad70d14fb34b673ab8)
    local BigFoot_051cc0cd78a11469a8f78d2062970ca9 = BigFoot_Config[__mod];
    if (not BigFoot_051cc0cd78a11469a8f78d2062970ca9) then
        BigFoot_22055e427df00b6ded4c974381125d87(__mod);
        BigFoot_051cc0cd78a11469a8f78d2062970ca9 = BigFoot_Config[__mod];
    end
    if (not BigFoot_051cc0cd78a11469a8f78d2062970ca9) then
        return nil;
    end
    if (not BigFoot_051cc0cd78a11469a8f78d2062970ca9[BigFoot_be741bd2030ad8ad70d14fb34b673ab8]) then
        if (BigFoot_be741bd2030ad8ad70d14fb34b673ab8) then
            BigFoot_051cc0cd78a11469a8f78d2062970ca9[BigFoot_be741bd2030ad8ad70d14fb34b673ab8] = ModManagement_GetDefaultValue(__mod, BigFoot_be741bd2030ad8ad70d14fb34b673ab8);
        end
    end
    return BigFoot_051cc0cd78a11469a8f78d2062970ca9[BigFoot_be741bd2030ad8ad70d14fb34b673ab8];
end

function BigFoot_SetModVariable(__mod, BigFoot_be741bd2030ad8ad70d14fb34b673ab8, BigFoot_2361bab8b48b1041ad740bb561b21aee)
    if (not BigFoot_Config[__mod]) then
        BigFoot_Config[__mod] = {};
    end
    BigFoot_Config[__mod][BigFoot_be741bd2030ad8ad70d14fb34b673ab8] = BigFoot_2361bab8b48b1041ad740bb561b21aee;
end

function BigFoot_FindTableValue(BigFoot_49ccc92cd1bef60d860c1c7f84aaab89, BigFoot_2361bab8b48b1041ad740bb561b21aee)
    for BigFoot_413bf9c15ce77baa8ebf1cda4cbf4887, BigFoot_536473f22dedf9f29b94b1004a62b8a0 in pairs(BigFoot_49ccc92cd1bef60d860c1c7f84aaab89) do
        if (BigFoot_2361bab8b48b1041ad740bb561b21aee == BigFoot_536473f22dedf9f29b94b1004a62b8a0) then
            return BigFoot_413bf9c15ce77baa8ebf1cda4cbf4887;
        end
    end
    return nil;
end

function BigFoot_22055e427df00b6ded4c974381125d87(__mod)
    if (__mod) then
        if (not BigFoot_ModOptionConfig[__mod]) then
            return;
        end
        BigFoot_Config[__mod] = {};
        local __index, BigFoot_2361bab8b48b1041ad740bb561b21aee;
        for __index, BigFoot_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_ModOptionConfig[__mod]) do
            if (BigFoot_2361bab8b48b1041ad740bb561b21aee.variable) then
                BigFoot_Config[__mod][BigFoot_2361bab8b48b1041ad740bb561b21aee.variable] = BigFoot_2361bab8b48b1041ad740bb561b21aee.default;
            end
        end
    else
        BigFoot_Config = {};
        local BigFoot_7c2206e66bf7b5bacd2aa77f76bf4ff2, BigFoot_3bb367e1f150a93c099e99df8d49e180;
        for BigFoot_7c2206e66bf7b5bacd2aa77f76bf4ff2, BigFoot_3bb367e1f150a93c099e99df8d49e180 in pairs(BigFoot_ModOptionConfig) do
            if (not BigFoot_Config[BigFoot_7c2206e66bf7b5bacd2aa77f76bf4ff2]) then
                BigFoot_Config[BigFoot_7c2206e66bf7b5bacd2aa77f76bf4ff2] = {};
            end
            local __index, BigFoot_2361bab8b48b1041ad740bb561b21aee;
            for __index, BigFoot_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_ModOptionConfig[__mod]) do
                if (BigFoot_2361bab8b48b1041ad740bb561b21aee.variable) then
                    BigFoot_Config[BigFoot_7c2206e66bf7b5bacd2aa77f76bf4ff2][BigFoot_2361bab8b48b1041ad740bb561b21aee.variable] = BigFoot_2361bab8b48b1041ad740bb561b21aee.default;
                end
            end
        end
    end
end

function BigFoot_5cce98c7af8139064e065c4da9901881()
    local __mod, BigFoot_3bb367e1f150a93c099e99df8d49e180;
    local BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_2361bab8b48b1041ad740bb561b21aee;
    for __mod, BigFoot_3bb367e1f150a93c099e99df8d49e180 in pairs(BigFoot_ModOptionConfig) do
        for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_2361bab8b48b1041ad740bb561b21aee in pairs(BigFoot_3bb367e1f150a93c099e99df8d49e180) do
            if (BigFoot_2361bab8b48b1041ad740bb561b21aee.callback and BigFoot_2361bab8b48b1041ad740bb561b21aee.type ~= "BUTTON") then
                pcall(BigFoot_2361bab8b48b1041ad740bb561b21aee.callback, BigFoot_GetModVariable(__mod, BigFoot_2361bab8b48b1041ad740bb561b21aee.variable));
            end
        end
    end
end

function BigFoot_ShowKeyBindingFrame(arg)
    if (arg == nil) then
        KeyBindingFrame_LoadUI();
        ShowUIPanel(KeyBindingFrame);
        return;
    end
    local BigFoot_b52e349dfc92773f7d6f1dd51228ec0a = GetNumBindings();
    for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f = 1, BigFoot_b52e349dfc92773f7d6f1dd51228ec0a, 1 do
        local BigFoot_d28056e4bcd8f214a25daeabfe052d6e, BigFoot_31c593401a06ae783f934538e503e6e1, BigFoot_59981dde119ddaafbcbf4b1ac8eae22d = GetBinding(BigFoot_e914904fab9d05d3f54d52bfc31a0f3f);
        if (BigFoot_d28056e4bcd8f214a25daeabfe052d6e == arg) then
            KeyBindingFrame_LoadUI();
            ShowUIPanel(KeyBindingFrame); KeyBindingFrameScrollFrameScrollBar:SetValue((BigFoot_e914904fab9d05d3f54d52bfc31a0f3f - 1) * KEY_BINDING_HEIGHT);
        end
    end
end

function BigFoot_786b766d1fd0bf879fd94c1f876cd079(self)
    if (BigFoot_44494375213dfd73e10daddf227fe7fd) then
        OpenAllBags(1);
    end
end

function BigFoot_f044c02de3e35387101ef8bf33fca114(self)
    if (BigFoot_44494375213dfd73e10daddf227fe7fd) then
        CloseAllBags();
    end
end

function BigFoot_DelayCall(func, BigFoot_fa0e20b884d24b5fee3e57d9608679e2, ...)
    if (not BigFootFrame.callroutine) then
        BigFootFrame.callroutine = {};
    end
    local BigFoot_2e00ffac12aadb3a1fd865993ec505b9 = {};
    local arg = { ... };
    BigFoot_2e00ffac12aadb3a1fd865993ec505b9["func"] = func;
    BigFoot_2e00ffac12aadb3a1fd865993ec505b9["delay"] = BigFoot_fa0e20b884d24b5fee3e57d9608679e2;
    BigFoot_2e00ffac12aadb3a1fd865993ec505b9["lastUpdate"] = 0;
    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.arg = arg;
    table.insert(BigFootFrame.callroutine, BigFoot_2e00ffac12aadb3a1fd865993ec505b9);
end

function BigFootMiniButton_OnEvent(self, event)
    if (event == "VARIABLES_LOADED") then
        if (BigFoot_Config.minimapButtonAngle) then
            BigFoot_2cd6d30137147eaf4045a1d63ab32af9();
        end
    end
end

function BigFoot_2cd6d30137147eaf4045a1d63ab32af9()
    BigFoot_96785dbeac1ff7b552e8c52e67934253 = 80 * cos(BigFoot_Config.minimapButtonAngle or 0);
    BigFoot_ea25800b8ac2e4371898ff0014a4cb39 = 80 * sin(BigFoot_Config.minimapButtonAngle or 0);
    BigFootMinimapButton:SetPoint("TOPLEFT", "Minimap", "TOPLEFT", 52 - BigFoot_96785dbeac1ff7b552e8c52e67934253, BigFoot_ea25800b8ac2e4371898ff0014a4cb39 - 52);
end

function BigFoot_OnUpdate(self, BigFoot_0e2babf2e3097eec96cf9280d1412ab5)
    if (df_tracking_enabled) then
        if (not df_tracking_time) then
            df_tracking_time = 0;
        end
        df_tracking_time = df_tracking_time + BigFoot_0e2babf2e3097eec96cf9280d1412ab5;
        if (df_tracking_time > 3) then
            local count = GetNumTrackingTypes();
            if (df_tracking_count ~= count) then
                local name, texture, active, category;
                for i = 1, count, 1 do
                    name, texture, active, category = GetTrackingInfo(i);
                    if (name == BF_FINDING_MINING) then
                        df_fmi = i;
                    elseif (name == BF_FINDING_HERBS) then
                        df_fmh = i;
                    end
                end
                df_tracking_count = count;
            end
            df_tracking_time = 0;
            if (finding_mining) then
                local start, duration, enabled = GetSpellCooldown(BF_FINDING_MINING);
                local spell = UnitCastingInfo("player");
                local combat = UnitAffectingCombat("player");
                if (combat or spell or (start and duration and start > 0 and duration > 0)) then
                else
                    SetTracking(df_fmi);
                    finding_mining = false;
                end
            else
                local start, duration, enabled = GetSpellCooldown(BF_FINDING_HERBS);
                local spell = UnitCastingInfo("player");
                local combat = UnitAffectingCombat("player");
                if (combat or spell or (start and duration and start > 0 and duration > 0)) then
                else
                    SetTracking(df_fmh);
                    finding_mining = true;
                end
            end
        end
    end
    for __index, BigFoot_2361bab8b48b1041ad740bb561b21aee in pairs(BigFootFrame.callroutine) do
        BigFoot_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] = BigFoot_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] + BigFoot_0e2babf2e3097eec96cf9280d1412ab5;
        if (BigFoot_2361bab8b48b1041ad740bb561b21aee["lastUpdate"] > BigFoot_2361bab8b48b1041ad740bb561b21aee["delay"]) then
            if (type(BigFoot_2361bab8b48b1041ad740bb561b21aee["func"]) == "string") then
                local func = getglobal(BigFoot_2361bab8b48b1041ad740bb561b21aee["func"]);
                if (BigFoot_2361bab8b48b1041ad740bb561b21aee.arg and table.maxn(BigFoot_2361bab8b48b1041ad740bb561b21aee.arg) > 0) then
                    func(unpack(BigFoot_2361bab8b48b1041ad740bb561b21aee.arg));
                else
                    func();
                end
            else
                if (BigFoot_2361bab8b48b1041ad740bb561b21aee.arg and table.maxn(BigFoot_2361bab8b48b1041ad740bb561b21aee.arg) > 0) then
                    BigFoot_2361bab8b48b1041ad740bb561b21aee["func"](unpack(BigFoot_2361bab8b48b1041ad740bb561b21aee.arg));
                else
                    BigFoot_2361bab8b48b1041ad740bb561b21aee["func"]();
                end
            end
            table.remove(BigFootFrame.callroutine, __index);
        end
    end
    if (BigFootAnim_LastUpdated) then
        BigFootAnim_LastUpdated = BigFootAnim_LastUpdated + BigFoot_0e2babf2e3097eec96cf9280d1412ab5;
        if (BigFootAnim_LastUpdated > BIGFOOT_ANIM_INTERVAL) then
            BigFootAnim_LastUpdated = 0;
        else
            for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_5e57ab95c762a48d9a126b104db1056f in pairs(BigFoot_AnimManager) do
                BigFoot_StepRunAnim(BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_0e2babf2e3097eec96cf9280d1412ab5);
            end
        end
    end
    if (BigFootMinimapButton.pending_moving) then
        local BigFoot_96785dbeac1ff7b552e8c52e67934253, BigFoot_ea25800b8ac2e4371898ff0014a4cb39 = GetCursorPosition();
        BigFoot_8e59e6407a121fffb508976db42293b0 = math.floor(math.abs(BigFootMinimapButton.x - BigFoot_96785dbeac1ff7b552e8c52e67934253) + 0.5);
        BigFoot_1fc6b72d49cb9dbf25c5a4fd525bf807 = math.floor(math.abs(BigFootMinimapButton.y - BigFoot_ea25800b8ac2e4371898ff0014a4cb39) + 0.5);
        if (math.sqrt(BigFoot_8e59e6407a121fffb508976db42293b0 * BigFoot_8e59e6407a121fffb508976db42293b0 + BigFoot_1fc6b72d49cb9dbf25c5a4fd525bf807 * BigFoot_1fc6b72d49cb9dbf25c5a4fd525bf807) > 20) then
            BigFootMinimapButton.moving = true;
        end
    end
    if (BigFootMinimapButton.moving) then
        local BigFoot_96785dbeac1ff7b552e8c52e67934253, BigFoot_ea25800b8ac2e4371898ff0014a4cb39 = GetCursorPosition();
        BigFoot_8e59e6407a121fffb508976db42293b0 = math.floor(BigFoot_96785dbeac1ff7b552e8c52e67934253 + 0.5);
        BigFoot_1fc6b72d49cb9dbf25c5a4fd525bf807 = math.floor(BigFoot_ea25800b8ac2e4371898ff0014a4cb39 + 0.5);
        if (BigFoot_8e59e6407a121fffb508976db42293b0 ~= BigFootMinimapButton.x or BigFoot_1fc6b72d49cb9dbf25c5a4fd525bf807 ~= BigFootMinimapButton.y) then
            local BigFoot_fcc5b76d5be74ab65dd635d6b69da581, BigFoot_04dae8db65b9a02901953baacc9c71b3 = Minimap:GetLeft() or 400, Minimap:GetBottom() or 400;
            BigFoot_96785dbeac1ff7b552e8c52e67934253 = BigFoot_fcc5b76d5be74ab65dd635d6b69da581 - BigFoot_96785dbeac1ff7b552e8c52e67934253 / Minimap:GetEffectiveScale() + 70;
            BigFoot_ea25800b8ac2e4371898ff0014a4cb39 = BigFoot_ea25800b8ac2e4371898ff0014a4cb39 / Minimap:GetEffectiveScale() - BigFoot_04dae8db65b9a02901953baacc9c71b3 - 70;
            BigFoot_Config.minimapButtonAngle = math.deg(math.atan2(BigFoot_ea25800b8ac2e4371898ff0014a4cb39, BigFoot_96785dbeac1ff7b552e8c52e67934253));
            BigFoot_2cd6d30137147eaf4045a1d63ab32af9();
        end
    end
end

function BigFoot_6b2b31b051710342eee9ef69c10b3393()
    if (MOVING_BIGFOOTBAR) then
        MOVING_BIGFOOTBAR:StopMovingOrSizing();
    end
    if (MOVING_INFOBOX) then
        MOVING_INFOBOX:StopMovingOrSizing();
    end
end

function BigFoot_Report(BigFoot_6d5e7d83d8358745ae4dcf61d16bd1f3, BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88)
    local BigFoot_411b8aa6d5954c6020f0b9c9e80e847a = DEFAULT_CHAT_FRAME;
    if (BigFoot_411b8aa6d5954c6020f0b9c9e80e847a) then
        if (BigFoot_6d5e7d83d8358745ae4dcf61d16bd1f3 == "info") then
            BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:AddMessage(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88, 1.0, 1.0, 0.0);
        elseif (BigFoot_6d5e7d83d8358745ae4dcf61d16bd1f3 == "error") then
            BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:AddMessage(BigFoot_c9bd86bc8bc59457d49315cf5b8c5b88, 1.0, 0.0, 0.0);
        end
    end
end

function BigFoot_c2c8715b508af07adc7d4906f8fdbbd3()
    StaticPopup_Show("PURCHASE");
end

function BigFoot_a9ccdced48307818b972a7083516c3dd(text, BigFoot_0e2babf2e3097eec96cf9280d1412ab5, BigFoot_00ae4bc475ffbcf97f789256a2e707de, BigFoot_6599f8c6a1b53d0212dfbab04e14e329, BigFoot_18bd17b74c56bfd23801044c9c9e8d4e, BigFoot_a29776f66159eb25625ce8ff4969048f, BigFoot_fe4d4227ea1d91e3a69c7b2a27e8150f, BigFoot_ff9ac8c817fb600a8633bbac91acd135, BigFoot_d2a75f7d621ef7006d92cec86286568b) local BigFoot_71ac8c04e9eae3efc1f0b8abcf51fc4c = BigFoot_GenCheckSum(text); BigFoot_Error[BigFoot_71ac8c04e9eae3efc1f0b8abcf51fc4c] = text; BigFoot_7e509fa6eb57f1a7c21df230042b0a81(text, BigFoot_0e2babf2e3097eec96cf9280d1412ab5, BigFoot_00ae4bc475ffbcf97f789256a2e707de, BigFoot_6599f8c6a1b53d0212dfbab04e14e329, BigFoot_18bd17b74c56bfd23801044c9c9e8d4e, BigFoot_a29776f66159eb25625ce8ff4969048f, BigFoot_fe4d4227ea1d91e3a69c7b2a27e8150f, BigFoot_ff9ac8c817fb600a8633bbac91acd135, BigFoot_d2a75f7d621ef7006d92cec86286568b); end

function BigFoot_GenCheckSum(BigFoot_6e4d0db7491d6883f86de390d20dbe5b)
    if (BigFoot_6e4d0db7491d6883f86de390d20dbe5b == nil) then
        return nil;
    end
    local __len = string.len(BigFoot_6e4d0db7491d6883f86de390d20dbe5b);
    local BigFoot_b38a7bb9216803102fdc3d9f7a3d2e84 = 0;
    local BigFoot_05a435746a4fa320ec7c59ba02cf6c6a = 0;
    for __index = 1, __len, 1 do
        if (math.mod(__index, 2) == 0) then
            BigFoot_05a435746a4fa320ec7c59ba02cf6c6a = BigFoot_05a435746a4fa320ec7c59ba02cf6c6a + string.byte(BigFoot_6e4d0db7491d6883f86de390d20dbe5b, __index);
        else
            BigFoot_b38a7bb9216803102fdc3d9f7a3d2e84 = BigFoot_b38a7bb9216803102fdc3d9f7a3d2e84 + string.byte(BigFoot_6e4d0db7491d6883f86de390d20dbe5b, __index);
        end
    end
    return (BigFoot_b38a7bb9216803102fdc3d9f7a3d2e84 * BigFoot_05a435746a4fa320ec7c59ba02cf6c6a);
end

BigFoot_7e509fa6eb57f1a7c21df230042b0a81 = message;
message = BigFoot_a9ccdced48307818b972a7083516c3dd;

function BigFoot_InvokeLink(__mode, BigFoot_3ae8eb6ec90242df1e30110fba73067d)
    RegisterCVar("BFMode", "");
    SetCVar("BFMode", __mode);
    local BigFoot_15ad1e501e228eb80be1cc7800ab967d = BigFoot_3ae8eb6ec90242df1e30110fba73067d .. "<<END>>";
    local __len = string.len(BigFoot_15ad1e501e228eb80be1cc7800ab967d);
    local BigFoot_3f50417fb16be9b1078eb68d24fa9c26 = 1;
    for __index = 1, __len, 180 do
        if (BigFoot_3f50417fb16be9b1078eb68d24fa9c26 <= 15) then
            local BigFoot_536473f22dedf9f29b94b1004a62b8a0 = string.sub(BigFoot_15ad1e501e228eb80be1cc7800ab967d, __index, 200);
            local BigFoot_fedf0d740772fb420daef72fe53901e5 = "BFLink" .. BigFoot_3f50417fb16be9b1078eb68d24fa9c26;
            RegisterCVar(BigFoot_fedf0d740772fb420daef72fe53901e5, "");
            SetCVar(BigFoot_fedf0d740772fb420daef72fe53901e5, BigFoot_536473f22dedf9f29b94b1004a62b8a0);
            BigFoot_3f50417fb16be9b1078eb68d24fa9c26 = BigFoot_3f50417fb16be9b1078eb68d24fa9c26 + 1;
        end
    end
    BigFoot_DelayCall(BigFoot_RemoveLink, 5);
end

function BigFoot_RemoveLink()
    RegisterCVar("BFMode", "");
    SetCVar("BFMode", "");
    for __index = 1, 15, 1 do
        local BigFoot_fedf0d740772fb420daef72fe53901e5 = "BFLink" .. __index;
        RegisterCVar(BigFoot_fedf0d740772fb420daef72fe53901e5, "");
        SetCVar(BigFoot_fedf0d740772fb420daef72fe53901e5, "");
    end
end

function BigFoot_1a95fe6d806b1a06262a2112c3c20e9d(self)
    local icon = getglobal(self:GetName() .. "Icon");
    local normalTexture = getglobal(self:GetName() .. "NormalTexture");
    local isUsable, notEnoughMana = IsUsableAction(ActionButton_GetPagedID(self));
    if (isUsable) then
        if (BigFoot_DistanceAlert and IsActionInRange(ActionButton_GetPagedID(self)) == 0) then
            icon:SetVertexColor(BigFoot_DistanceAlert.color.r, BigFoot_DistanceAlert.color.g, BigFoot_DistanceAlert.color.b);
        else
            icon:SetVertexColor(1.0, 1.0, 1.0);
        end
        normalTexture:SetVertexColor(1.0, 1.0, 1.0);
    elseif (notEnoughMana) then
        if (BigFoot_DistanceAlert and IsActionInRange(ActionButton_GetPagedID(self)) == 0) then
            icon:SetVertexColor(BigFoot_DistanceAlert.color.r, BigFoot_DistanceAlert.color.g, BigFoot_DistanceAlert.color.b);
        else
            icon:SetVertexColor(0.5, 0.5, 1.0);
        end
        normalTexture:SetVertexColor(0.5, 0.5, 1.0);
    else
        if (BigFoot_DistanceAlert and IsActionInRange(ActionButton_GetPagedID(self)) == 0) then
            icon:SetVertexColor(BigFoot_DistanceAlert.color.r, BigFoot_DistanceAlert.color.g, BigFoot_DistanceAlert.color.b);
        else
            icon:SetVertexColor(0.4, 0.4, 0.4);
        end
        normalTexture:SetVertexColor(1.0, 1.0, 1.0);
    end
end

function BigFoot_ActionButton_OnUpdate(self, elapsed)
    if (not BigFoot_DistanceAlert) then
        return;
    end
    if (self.rangeTimer) then
        self.checkTimer = self.checkTimer and (self.checkTimer - elapsed) or -1;
        if (self.checkTimer <= 0) then
            local count = getglobal(self:GetName() .. "HotKey");
            local icon = getglobal(self:GetName() .. "Icon");
            if (count:GetText() == RANGE_INDICATOR) then
                count:SetAlpha(0);
            else
                count:SetAlpha(1);
            end
            if (IsActionInRange(ActionButton_GetPagedID(self)) == 0) then
                if (BigFoot_DistanceAlert) then
                    icon:SetVertexColor(BigFoot_DistanceAlert.color.r, BigFoot_DistanceAlert.color.g, BigFoot_DistanceAlert.color.b);
                end
                count:SetVertexColor(1.0, 0.1, 0.1);
            else
                if (BigFoot_DistanceAlert) then
                    BigFoot_1a95fe6d806b1a06262a2112c3c20e9d(self);
                end
                count:SetVertexColor(0.6, 0.6, 0.6);
            end
            self.checkTimer = TOOLTIP_UPDATE_TIME;
        end
    end
end

function BigFoot_Tooltip_Init()
    local __index = 1;
    while (true) do
        local BigFoot_02d5b157042609dded01e369ca208f41 = getglobal("BigFootTooltipTextLeft" .. __index);
        local BigFoot_6387f51b49ed3543b0709dfc88751d8d = getglobal("BigFootTooltipTextRight" .. __index);
        if (BigFoot_02d5b157042609dded01e369ca208f41) then
            BigFoot_02d5b157042609dded01e369ca208f41:SetText("");
        end
        if (BigFoot_6387f51b49ed3543b0709dfc88751d8d) then
            BigFoot_6387f51b49ed3543b0709dfc88751d8d:SetText("");
        end
        if (not BigFoot_02d5b157042609dded01e369ca208f41 and not BigFoot_6387f51b49ed3543b0709dfc88751d8d) then
            break;
        else
            __index = __index + 1;
        end
    end;
    BigFootTooltip:SetOwner(UIParent, "ANCHOR_NONE");
    BigFootTooltip:SetPoint("TOPLEFT", "UIParent", "BOTTOMRIGHT", 5, -5);
    BigFootTooltip:SetText("BigFootTooltip");
    BigFootTooltip:Show();
end

function BigFoot_Tooltip_GetText(BigFoot_6c162b1123a1eb57c1827271b32b6959, BigFoot_7a1ab73436a3d1380515c4e77b1113c9)
    if (not BigFoot_6c162b1123a1eb57c1827271b32b6959) then
        BigFoot_6c162b1123a1eb57c1827271b32b6959 = BigFootTooltip;
    end
    if (not BigFoot_7a1ab73436a3d1380515c4e77b1113c9) then
        BigFoot_7a1ab73436a3d1380515c4e77b1113c9 = "<n>";
    end
    local BigFoot_05a2ee39a27ddf26690d89d2a15c072a = "";
    BigFoot_6c162b1123a1eb57c1827271b32b6959:Show();
    local __index = 1;
    while (true) do
        local BigFoot_02d5b157042609dded01e369ca208f41 = getglobal(BigFoot_6c162b1123a1eb57c1827271b32b6959:GetName() .. "TextLeft" .. __index);
        local BigFoot_6387f51b49ed3543b0709dfc88751d8d = getglobal(BigFoot_6c162b1123a1eb57c1827271b32b6959:GetName() .. "TextRight" .. __index);
        local BigFoot_674a0525bf6cebf28d1da789fb00abc6;
        local BigFoot_887f51c189169ceb8bbde7cf4cf5895c;
        BigFoot_674a0525bf6cebf28d1da789fb00abc6 = BigFoot_02d5b157042609dded01e369ca208f41 and BigFoot_02d5b157042609dded01e369ca208f41:GetText();
        BigFoot_887f51c189169ceb8bbde7cf4cf5895c = BigFoot_6387f51b49ed3543b0709dfc88751d8d and BigFoot_6387f51b49ed3543b0709dfc88751d8d:GetText();
        local BigFoot_7919c7a86c7e610ee782028a3dfb88c1 = "";
        if (__index == 1) then
            if (BigFoot_674a0525bf6cebf28d1da789fb00abc6 == nil) then
                return;
            end
            BigFoot_8a0dddd2057d6aaf060f58abb298e7ab = BigFoot_674a0525bf6cebf28d1da789fb00abc6;
        end
        if (BigFoot_674a0525bf6cebf28d1da789fb00abc6 == nil and BigFoot_887f51c189169ceb8bbde7cf4cf5895c == nil) then
            BigFoot_7919c7a86c7e610ee782028a3dfb88c1 = "";
        else
            if (BigFoot_674a0525bf6cebf28d1da789fb00abc6 == nil) then
                BigFoot_674a0525bf6cebf28d1da789fb00abc6 = "";
            end
            if (BigFoot_887f51c189169ceb8bbde7cf4cf5895c == nil) then
                BigFoot_887f51c189169ceb8bbde7cf4cf5895c = "";
            end
            if (BigFoot_887f51c189169ceb8bbde7cf4cf5895c ~= "") then
                BigFoot_7919c7a86c7e610ee782028a3dfb88c1 = BigFoot_674a0525bf6cebf28d1da789fb00abc6 .. "<t>" .. BigFoot_887f51c189169ceb8bbde7cf4cf5895c;
            else
                BigFoot_7919c7a86c7e610ee782028a3dfb88c1 = BigFoot_674a0525bf6cebf28d1da789fb00abc6;
            end
        end
        if (BigFoot_7919c7a86c7e610ee782028a3dfb88c1 ~= "") then
            BigFoot_05a2ee39a27ddf26690d89d2a15c072a = BigFoot_05a2ee39a27ddf26690d89d2a15c072a .. BigFoot_7919c7a86c7e610ee782028a3dfb88c1 .. BigFoot_7a1ab73436a3d1380515c4e77b1113c9;
        end
        if (not BigFoot_02d5b157042609dded01e369ca208f41 and not BigFoot_6387f51b49ed3543b0709dfc88751d8d) then
            break;
        else
            __index = __index + 1;
        end
    end
    return BigFoot_05a2ee39a27ddf26690d89d2a15c072a;
end

function BigFootMiniButton_OnEnter(self)
    GameTooltip_SetDefaultAnchor(GameTooltip, self);
    GameTooltip:ClearLines();
    GameTooltip:SetText(BF_MINIBUTTON_TIP_TITLE, 1.0, 1.0, 1.0);
    GameTooltip:AddLine(BF_MINIBUTTON_TIP_TEXT, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
    GameTooltip:Show();
end

function BigFoot_ShowNewbieTooltip(text, ...)
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetText(text, 1.0, 1.0, 1.0);
    local args = { ... };
    local i;
    for i = 1, table.maxn(args), 1 do
        GameTooltip:AddLine(args[i], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1.0, 1);
    end
    GameTooltip:Show();
end

function BigFoot_HideNewbieTooltip()
    GameTooltip:Hide();
end

function BigFootMiniButton_OnDragStart(self, button)
    self:SetFrameStrata("HIGH");
    local PosX, PosY = GetCursorPosition();
    self.x = math.floor(PosX + 0.5);
    self.y = math.floor(PosY + 0.5);
    self.timestamp = GetTime();
    self.pending_moving = true;
    self.moving = nil;
end

function BigFootMiniButton_OnDragStop(self, button)
    self:SetFrameStrata("LOW");
    self.pending_moving = nil;
    self.moving = nil;
end

function BigFootMiniButton_OnClick(self, button)
    if (button == "LeftButton") then
        if (not ModManagementFrame:IsVisible()) then
            PlaySound("igMainMenuOption");
            ShowUIPanel(ModManagementFrame);
        end
    elseif (button == "RightButton") then
        BToggleDropDownMenu(1, nil, getglobal(self:GetName() .. "DropDown"), self:GetName(), 10, 3);
        PlaySound("UChatScrollButton");
    end
end

function BigFoot_f5b6f344e3abaf8220ddb46306cf34fc()
    BigFoot_Print(string.format(BF_VERSION_PATTERN, BIGFOOT_VERSION));
end

function BigFoot_97401a5bc610241b41f9546a71f92484()
    BigFootReader_ShowBook(BF_CHANGELOG_TEXT);
end

function BigFoot_86fe97520da716173394d4f6dd39a9e7(self, arg1, arg2, checked)
    if (checked) then
        df_tracking_enabled = true;
    else
        df_tracking_enabled = false;
    end
end

function BigFoot_b5d3fbbb39737107d19770a6601568c8()
    local BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.text = BF_BASIC_INFO;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.isTitle = 1;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.notCheckable = 1;
    BDropDownMenu_AddButton(BigFoot_a44ecbf575d7f2eca081a0592e8d84fa);
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.text = BF_VERSION_INFO;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.func = BigFoot_f5b6f344e3abaf8220ddb46306cf34fc;
    BDropDownMenu_AddButton(BigFoot_a44ecbf575d7f2eca081a0592e8d84fa);
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.text = BF_CHANGELOG_TEXT;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.func = BigFoot_97401a5bc610241b41f9546a71f92484;
    BDropDownMenu_AddButton(BigFoot_a44ecbf575d7f2eca081a0592e8d84fa);
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.text = BF_EXTRA_FUNCTION;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.isTitle = 1;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.notCheckable = 1;
    BDropDownMenu_AddButton(BigFoot_a44ecbf575d7f2eca081a0592e8d84fa);
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa = {};
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.text = BF_SHUANGCAI;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.func = BigFoot_86fe97520da716173394d4f6dd39a9e7;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.checked = function() return df_tracking_enabled; end;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.keepShownOnClick = true;
    BigFoot_a44ecbf575d7f2eca081a0592e8d84fa.notCheckable = nil;
    BDropDownMenu_AddButton(BigFoot_a44ecbf575d7f2eca081a0592e8d84fa);
end

function BigFootMiniButtonDropDown_OnLoad(self)
    BDropDownMenu_Initialize(self, BigFoot_b5d3fbbb39737107d19770a6601568c8, "MENU");
    BDropDownMenu_SetButtonWidth(self, 50);
    BDropDownMenu_SetWidth(self, 50);
end

function IsConfigurableAddOn(name)
    if (GetAddOnMetadata(name, "X-Revision") ~= "BigFoot") then
        return false;
    end
    local name, title, notes, enabled, loadable, reason, security = GetAddOnInfo(name);
    if (not enabled) then
        return false;
    end
    return true;
end

function BigFoot_1bdcf5fc00385b1029774854d47cba7c(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, BigFoot_8d0febf2348ea712b2b375ae95601d5f)
    if (BigFoot_411b8aa6d5954c6020f0b9c9e80e847a and BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:IsVisible()) then
        local BigFoot_92fc56267c7e14d288fbcf74f912203d = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetLeft();
        local BigFoot_0694c14294eb642e50750f9964155ae0 = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetTop();
        local BigFoot_aacf928ffa23e474a000b1b6292d02a9 = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetWidth();
        local BigFoot_ba70ac59c8a4b2cc67cf63223c84b656 = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetHeight();
        if (BigFoot_92fc56267c7e14d288fbcf74f912203d and BigFoot_0694c14294eb642e50750f9964155ae0 and BigFoot_aacf928ffa23e474a000b1b6292d02a9 and BigFoot_ba70ac59c8a4b2cc67cf63223c84b656) then
            BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f] = {};
            BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].X = math.floor(BigFoot_92fc56267c7e14d288fbcf74f912203d + 0.5);
            BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].Y = math.floor(BigFoot_0694c14294eb642e50750f9964155ae0 + 0.5);
            BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].W = math.floor(BigFoot_aacf928ffa23e474a000b1b6292d02a9 + 0.5);
            BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].H = math.floor(BigFoot_ba70ac59c8a4b2cc67cf63223c84b656 + 0.5);
        end
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.BigFoot_22682cb060092ed963ec91a4859bd63b = true;
    end
end

function BigFoot_55aac641913aad9d65fc712727a3248d(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, BigFoot_8d0febf2348ea712b2b375ae95601d5f)
    if (BigFoot_411b8aa6d5954c6020f0b9c9e80e847a and BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f]) then
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:ClearAllPoints();
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].X, BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].Y);
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetWidth(BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].W);
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:SetHeight(BigFoot_Frames[BigFoot_8d0febf2348ea712b2b375ae95601d5f].H);
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.BigFoot_22682cb060092ed963ec91a4859bd63b = true;
    end
end

function BigFoot_f15ea7f7aae04ef7b7e8a263b876d1ee(BigFoot_c933410cf37b41b19e2f71899bab1b9b)
    if (BigFoot_c933410cf37b41b19e2f71899bab1b9b.BigFoot_7d60a253b945e31985d1479f4a52c17b) then
        BigFoot_c933410cf37b41b19e2f71899bab1b9b.BigFoot_7d60a253b945e31985d1479f4a52c17b(BigFoot_c933410cf37b41b19e2f71899bab1b9b);
    end BigFoot_DelayCall(BigFoot_1bdcf5fc00385b1029774854d47cba7c, 1, BigFoot_c933410cf37b41b19e2f71899bab1b9b, BigFoot_c933410cf37b41b19e2f71899bab1b9b.BigFoot_1cb044235400aab072f1c2316e753f42);
end

function RegisterForSaveFrame(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, BigFoot_8d0febf2348ea712b2b375ae95601d5f, BigFoot_af26eec00d0d21214b25667471fa9350)
    assert(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a ~= nil, "frame must be assigned.");
    assert(type(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a) == "table", "RegisterForSaveFrame: the first parameter must be frame object.");
    if (not BigFoot_8d0febf2348ea712b2b375ae95601d5f) then
        BigFoot_8d0febf2348ea712b2b375ae95601d5f = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetName();
    end
    assert(BigFoot_8d0febf2348ea712b2b375ae95601d5f ~= nil, "The frame has no name, can not be used as default id.");
    BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.BigFoot_1cb044235400aab072f1c2316e753f42 = BigFoot_8d0febf2348ea712b2b375ae95601d5f;
    if (not BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.rfsf_hooked) then
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.rfsf_hooked = true;
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.BigFoot_7d60a253b945e31985d1479f4a52c17b = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.StopMovingOrSizing;
        BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.StopMovingOrSizing = BigFoot_f15ea7f7aae04ef7b7e8a263b876d1ee;
    end
    if (not BigFoot_af26eec00d0d21214b25667471fa9350) then
        BigFoot_55aac641913aad9d65fc712727a3248d(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, BigFoot_8d0febf2348ea712b2b375ae95601d5f);
    end
end

function BigFoot_IsFramePlacedByUser(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
    assert(BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
    BigFoot_8d0febf2348ea712b2b375ae95601d5f = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a:GetName();
    return BigFoot_411b8aa6d5954c6020f0b9c9e80e847a.BigFoot_22682cb060092ed963ec91a4859bd63b;
end

function TestTaint(...)
    local BigFoot_6c391f92e72d1c9b7434bca8947c5e2c, BigFoot_f897f2e099a64c92cc66909fc41d8477 = issecurevariable(...);
    if (not BigFoot_6c391f92e72d1c9b7434bca8947c5e2c) then
        BigFoot_Print("The variable is taintied. Form: " .. BigFoot_f897f2e099a64c92cc66909fc41d8477);
    else
        BigFoot_Print("The variable is secure.");
    end
end

function BigFoot_RequestReloadUI(onCancelled)
    StaticPopupDialogs["RELOADUI_CONFIRM"].onCancelled = onCancelled;
    StaticPopup_Show("RELOADUI_CONFIRM");
end

function BigFoot_fff18c914a5b3a8d509f2dff0f3fc382()
    for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f = 1, 4, 1 do
        local BigFoot_9e83872083ad957c8f380801be754171 = getglobal("PartyMemberFrame" .. BigFoot_e914904fab9d05d3f54d52bfc31a0f3f);
        BigFoot_9e83872083ad957c8f380801be754171.anchor_frame = CreateFrame("Frame", nil, BigFoot_9e83872083ad957c8f380801be754171);
        BigFoot_9e83872083ad957c8f380801be754171.anchor_frame:SetPoint("TOP", BigFoot_9e83872083ad957c8f380801be754171, "TOP", 0, 0);
        BigFoot_9e83872083ad957c8f380801be754171.anchor_frame:SetPoint("BOTTOM", BigFoot_9e83872083ad957c8f380801be754171, "BOTTOM", 0, 0);
        BigFoot_9e83872083ad957c8f380801be754171.anchor_frame:SetPoint("LEFT", BigFoot_9e83872083ad957c8f380801be754171, "RIGHT", 0, 0);
        BigFoot_9e83872083ad957c8f380801be754171.anchor_frame:SetWidth(1); BigFoot_9e83872083ad957c8f380801be754171.virtual_frames = {};
        BigFoot_9e83872083ad957c8f380801be754171.UpdateAnchorFrames = function(self)
            self.virtual_width = 0;
            for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f = 9, 1, -1 do
                if (self.virtual_frames[BigFoot_e914904fab9d05d3f54d52bfc31a0f3f]) then
                    for BigFoot_5e57ab95c762a48d9a126b104db1056f, BigFoot_2e00ffac12aadb3a1fd865993ec505b9 in ipairs(self.virtual_frames[BigFoot_e914904fab9d05d3f54d52bfc31a0f3f]) do
                        BigFoot_2e00ffac12aadb3a1fd865993ec505b9.frame:SetPoint(BigFoot_2e00ffac12aadb3a1fd865993ec505b9.point,
                            self, BigFoot_2e00ffac12aadb3a1fd865993ec505b9.rpoint,
                            self.virtual_width + BigFoot_2e00ffac12aadb3a1fd865993ec505b9.x, BigFoot_2e00ffac12aadb3a1fd865993ec505b9.y);
                        self.virtual_width = self.virtual_width + BigFoot_2e00ffac12aadb3a1fd865993ec505b9.width;
                    end
                end
            end
        end;
        BigFoot_9e83872083ad957c8f380801be754171.RegisterAnchorFrame = function(self, BigFoot_411b8aa6d5954c6020f0b9c9e80e847a, BigFoot_8e2d4ef9193eed09cc6ce5849fad1f0a, BigFoot_7dce5c33f0d4836b30c14f18b2fc43f7, BigFoot_7c8715eaf85fa16b3da6112f58ebd62d, PosX, PosY, BigFoot_aacf928ffa23e474a000b1b6292d02a9)
            if (not self.virtual_frames[BigFoot_8e2d4ef9193eed09cc6ce5849fad1f0a]) then
                self.virtual_frames[BigFoot_8e2d4ef9193eed09cc6ce5849fad1f0a] = {};
            end
            for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_2e00ffac12aadb3a1fd865993ec505b9 in ipairs(self.virtual_frames[BigFoot_8e2d4ef9193eed09cc6ce5849fad1f0a]) do
                if (BigFoot_2e00ffac12aadb3a1fd865993ec505b9.frame == BigFoot_411b8aa6d5954c6020f0b9c9e80e847a) then
                    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.width = BigFoot_aacf928ffa23e474a000b1b6292d02a9;
                    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.point = BigFoot_7dce5c33f0d4836b30c14f18b2fc43f7;
                    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.rpoint = BigFoot_7c8715eaf85fa16b3da6112f58ebd62d;
                    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.x = PosX;
                    BigFoot_2e00ffac12aadb3a1fd865993ec505b9.y = PosY;
                    self:UpdateAnchorFrames();
                    return;
                end
            end
            local BigFoot_2e00ffac12aadb3a1fd865993ec505b9 = {};
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.frame = BigFoot_411b8aa6d5954c6020f0b9c9e80e847a;
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.width = BigFoot_aacf928ffa23e474a000b1b6292d02a9;
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.point = BigFoot_7dce5c33f0d4836b30c14f18b2fc43f7;
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.rpoint = BigFoot_7c8715eaf85fa16b3da6112f58ebd62d;
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.x = PosX;
            BigFoot_2e00ffac12aadb3a1fd865993ec505b9.y = PosY;
            table.insert(self.virtual_frames[BigFoot_8e2d4ef9193eed09cc6ce5849fad1f0a], BigFoot_2e00ffac12aadb3a1fd865993ec505b9);
            self:UpdateAnchorFrames();
        end;
        BigFoot_9e83872083ad957c8f380801be754171.UnregisterAnchorFrame = function(self, BigFoot_411b8aa6d5954c6020f0b9c9e80e847a)
            for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f = 1, 9, 1 do
                if (self.virtual_frames[BigFoot_e914904fab9d05d3f54d52bfc31a0f3f]) then
                    for BigFoot_5e57ab95c762a48d9a126b104db1056f, BigFoot_2e00ffac12aadb3a1fd865993ec505b9 in ipairs(self.virtual_frames[BigFoot_e914904fab9d05d3f54d52bfc31a0f3f]) do
                        if (BigFoot_2e00ffac12aadb3a1fd865993ec505b9.frame == BigFoot_411b8aa6d5954c6020f0b9c9e80e847a) then
                            table.remove(self.virtual_frames[BigFoot_e914904fab9d05d3f54d52bfc31a0f3f], BigFoot_5e57ab95c762a48d9a126b104db1056f);
                            self:UpdateAnchorFrames();
                            return;
                        end
                    end
                end
            end
        end;
    end
end

function BigFoot_LaunchURL(text, BigFoot_86f176ad313c87e2e12fa1a570d9d226)
    BigFootURLFrameTitle:SetText("|cffffd100" .. text .. "|r");
    BigFootURLFrameText:SetText(BF_URL_TEXT);
    local BigFoot_2c80f92e39ff003db50505a4a7c87a1f = "";
    local BigFoot_21f2ed854618a45c4e6bfb80ac6fc270;
    for BigFoot_e914904fab9d05d3f54d52bfc31a0f3f = 1, string.len(BigFoot_86f176ad313c87e2e12fa1a570d9d226), 1 do
        BigFoot_21f2ed854618a45c4e6bfb80ac6fc270 = string.byte(BigFoot_86f176ad313c87e2e12fa1a570d9d226, BigFoot_e914904fab9d05d3f54d52bfc31a0f3f);
        if (BigFoot_21f2ed854618a45c4e6bfb80ac6fc270 >= 128) then
            BigFoot_2c80f92e39ff003db50505a4a7c87a1f = BigFoot_2c80f92e39ff003db50505a4a7c87a1f .. string.format("%%%02X", BigFoot_21f2ed854618a45c4e6bfb80ac6fc270);
        else BigFoot_2c80f92e39ff003db50505a4a7c87a1f = BigFoot_2c80f92e39ff003db50505a4a7c87a1f .. string.sub(BigFoot_86f176ad313c87e2e12fa1a570d9d226, BigFoot_e914904fab9d05d3f54d52bfc31a0f3f, BigFoot_e914904fab9d05d3f54d52bfc31a0f3f);
        end
    end
    BigFootURLFrameURL.url = "bfurl:" .. BigFoot_2c80f92e39ff003db50505a4a7c87a1f;
    BigFootURLFrameURL:SetText(BigFootURLFrameURL.url);
    BigFootURLFrame:Show();
end

function BigFoot_IsClientRunning()
    return BFClient_Running;
end

function BigFoot_LoadAddOn(addon)
    if (not BigFoot_IsAddOnLoaded(addon)) then
        LoadAddOn(addon);
        BigFoot_54712cfd3a2c182c0e5e07016c830ccb[addon] = true;
    end
    return BigFoot_IsAddOnLoaded(addon);
end

function BigFoot_IsAddOnLoaded(addon)
    return IsAddOnLoaded(addon);
end

function BigFoot_IsAddOnLoadedFromBigFoot(addon)
    if (IsAddOnLoaded(addon)) then
        if (BigFoot_54712cfd3a2c182c0e5e07016c830ccb[addon]) then
            return true;
        end
    end
    return false;
end

function BigFoot_IsAddOnLoadedFromOther(addon)
    if (IsAddOnLoaded(addon)) then
        if (BigFoot_54712cfd3a2c182c0e5e07016c830ccb[addon]) then
            return false;
        end
        return true;
    end
    return false;
end

function BigFoot_HasAddon(name)
    if (not name or type(name) ~= "string") then
        return false;
    end
    local max_addon = GetNumAddOns();
    for i = 1, max_addon, 1 do
        local addon_name = GetAddOnInfo(i);
        if (addon_name == name) then
            return true;
        end
    end
    return false;
end

function BigFoot_SetTextColor(fontInstance, r, g, b, a)
    local text = fontInstance:GetText();
    fontInstance:SetText(text, r, g, b, a);
end
