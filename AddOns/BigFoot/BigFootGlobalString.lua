--[[
        BigFootGlobalString.lua

        一些BigFoot需要的全局变量

        版本：1.12
        更新时间：2004年10月19日
        更新作者：Andy Xiao
]] --

if (GetLocale() == "zhCN") then
    BF_NAME = "大脚插件";
    BF_HEADER = "大脚设置";
    BF_SHOW_QUEST_LEVEL = "显示任务的详细等级";
    BF_DISABLE_QUEST_FADING = "立即显示任务文字";
    BF_MERCHANT_OPEN_ALL_BAGS = "同商人交易时自动打开背包";
    BF_CENTER_TOOLTIP = "将信息提示放置在屏幕顶上";
    TAB_GENERAL = "一般设置";
    TAB_ACTIONBAR = "动作条";
    TAB_OTHERS = "其它设置";

    RAID_TOOLKIT_TITLE = "团队工具";
elseif (GetLocale() == "zhTW") then
    BF_NAME = "大腳插件";
    BF_HEADER = "大腳設置";
    BF_SHOW_QUEST_LEVEL = "顯示任務的詳細等級";
    BF_DISABLE_QUEST_FADING = "立即顯示任務文字";
    BF_MERCHANT_OPEN_ALL_BAGS = "同商人交易時自動打開背包";
    BF_CENTER_TOOLTIP = "將信息提示放置在屏幕頂上";
    TAB_GENERAL = "一般設置";
    TAB_ACTIONBAR = "動作條";
    TAB_OTHERS = "其它設置";

    RAID_TOOLKIT_TITLE = "團隊工具";
else
    BF_NAME = "BigFoot";
    BF_HEADER = "BigFoot Menu";
    BF_SHOW_QUEST_LEVEL = "Show the detail level of quests";
    BF_DISABLE_QUEST_FADING = "Disable Quest Fading";
    BF_MERCHANT_OPEN_ALL_BAGS = "Open all bags while talking with vendor";
    BF_CENTER_TOOLTIP = "Rearrange Tooltip";
    TAB_GENERAL = "General";
    TAB_ACTIONBAR = "Action Bar";
    TAB_OTHERS = "Others";

    RAID_TOOLKIT_TITLE = "Raid Toolkit";
end
