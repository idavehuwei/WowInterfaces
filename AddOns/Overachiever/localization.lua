
-- Thank you to all of the translators that have helped localize Overachiever. In addition to those mentioned
-- below in their respective sections, recognition is due to all who have used the localization system provided
-- for Overachiever by Curse Forge. See a list of them here:
-- http://wow.curseforge.com/projects/overachiever/localization/translators/

OVERACHIEVER_STRINGS = {
	BINDING_NAME_OVERACHIEVER_TAB_SEARCH = "Open Search Tab";
	BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = "Open Suggestions Tab";
	BINDING_NAME_OVERACHIEVER_TAB_WATCH = "Open Watch Tab";

	SERIESTIP = "Part of a series:";
	REQUIREDFORMETATIP = "Required for:";

	PROGRESS = "Progress";
	YOURPROGRESS = "Your Progress";
	COMPLETEDATE = "Completed on %2$d/%1$02d/%3$02d";  -- 1 - day 2 - month 3 - year
	INCOMPLETE = "Incomplete";

	KILL_INCOMPLETE = "Need to kill";
	KILL_COMPLETE = "Already killed";

	CRITTER = "Critter";
	ACH_LOVECRITTERS_INCOMPLETE = "Needs some /love";
	ACH_LOVECRITTERS_COMPLETE = "Already /loved";

	ACH_WELLREAD_INCOMPLETE = "Needs to be read";
	ACH_WELLREAD_COMPLETE = "Already read";

	ACH_ANGLER_INCOMPLETE = "Need to fish";
	ACH_ANGLER_COMPLETE = "Already fished";

	ACH_CONSUME_INCOMPLETE = "Need to consume";
	ACH_CONSUME_COMPLETE = "Already consumed";
	ACH_CONSUME_INCOMPLETE_EXTRA = "Haven't consumed";

	ACH_LETITSNOW_INCOMPLETE = "Need to use Handful of Snowflakes";
	ACH_LETITSNOW_COMPLETE = "Already used Handful of Snowflakes";
	ACH_FISTFULOFLOVE_INCOMPLETE = "Need to use Handful of Rose Petals";
	ACH_FISTFULOFLOVE_COMPLETE = "Already used Handful of Rose Petals";
	ACH_BUNNYMAKER_INCOMPLETE = "Need to use Spring Flowers";
	ACH_BUNNYMAKER_COMPLETE = "Already used Spring Flowers";

	MSG_INVALIDID = "Invalid input: No achievement with that ID.";
	MSG_NAMENOTFOUND = 'No achievement with name containing "|cffffffff%s|r" was found.';
	MSG_OPENINGTO = "Opening to: ";
	MSG_ONEFOUND = "1 other achievement found: ";
	MSG_NUMFOUNDLIST = "%s other achievements found:";
	MSG_ACHNOTFOUND = "Achievement not found.";

	OPT_LABEL_ACHTWO = '"%s" and "%s"';
	OPT_LABEL_ACHTHREE = '"%s," "%s," and|n"%s"';

	OPT_ACHUNKNOWN = "<Unknown>";

	OPT_LABEL_TOOLTIPS = "Achievement Tooltips and Links";
	OPT_SHOWPROGRESS = "Add your progress";
	OPT_SHOWPROGRESS_TIP = 'Add your progress when an achievement has quantity-based criteria, such as "Obtain 10 mounts."';
	OPT_SHOWPROGRESS_OTHER = "Compare progress in others' links";
	OPT_SHOWPROGRESS_OTHER_TIP = "Add your progress when the achievement info shown is that of another player.";
	OPT_SHOWID = "Show achievement IDs";

	OPT_LABEL_TRACKING = "Achievement Tracking";
	OPT_AUTOTRACKTIMED = "Auto-track timed achievements";
	OPT_AUTOTRACKTIMED_TIP = "Automatically track achievements with timed criteria when the timer starts. Does not switch if tracking another achievement unless it was automatically tracked by Overachiever.";
	OPT_AUTOTRACKEXPLORE = "Auto-track exploration achievements as you travel";
	OPT_AUTOTRACKEXPLORE_TIP = "When you enter a zone, automatically track the exploration achievement associated with it. Does not switch if currently tracking something other than another zone's exploration achievement.";
	OPT_AUTOTRACKEXPLORE_COMPLETED = "Including completed achievements";

	OPT_CRITTERTIPS = "Add /loved status of critters to their tooltips";
	OPT_CRITTERTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to /love that type of critter.";
	OPT_PESTCONTROLTIPS = "Add whether you've exterminated a pest to its tooltip";
	OPT_PESTCONTROLTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to exterminate them.";
	OPT_WELLREADTIPS = "Add whether you've read a book to its tooltip";
	OPT_WELLREADTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of books that are part of its criteria to indicate whether you need to read them.";
	OPT_ANGLERTIPS = "Add whether you've fished a node to its tooltip";
	OPT_ANGLERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of fishing nodes that are part of its criteria to indicate whether you need to fish from them.";
	OPT_LETITSNOWTIPS = "Add whether you need to use a Handful of Snowflakes";
	OPT_LETITSNOWTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Snowflakes on them.";
	OPT_FISTFULOFLOVETIPS = "Add whether you need to use a Handful of Rose Petals";
	OPT_FISTFULOFLOVETIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Rose Petals on them.";
	OPT_BUNNYMAKERTIPS = "Add whether you need to use Spring Flowers";
	OPT_BUNNYMAKERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate gender and level to indicate whether you need to use Spring Flowers on them. Note that enemy players that are 10 or more levels higher than you are assumed to be at least level 18.";

	OPT_CONSUMEITEMTIPS = "Add whether items need to consumed to their tooltips";
	OPT_CONSUMEITEMTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of items that are part of its criteria to indicate whether you need to consume them.";
	OPT_CONSUMEITEMTIPS_TIP2 = "Items that you are too low level to consume will not trigger a reminder sound.";
	OPT_CONSUMEITEMTIPS_TIP3 = "Note: This option can add a few seconds to your initial load time.";
	OPT_CONSUMEITEMTIPS_WHENCOMPLETE = "Show even if achievement is complete";

	OPT_LABEL_NEEDTOKILL = 'Kill Creature Achievements ("%s," "%s," etc.)';
	OPT_KILLCREATURETIPS = "Add whether you need to kill a creature";
	OPT_KILLCREATURETIPS_TIP = "Add a line to the tooltips of creatures (excluding critters) that need to be killed to meet the criteria of an incomplete achievement indicating whether you still need to kill them.";
	OPT_KILLCREATURETIPS_TIP2 = "Note: At startup (or when this is option is enabled), every achievement is scanned to find unit IDs. Not all achievements provide such IDs. Most do, but the tooltips of creatures which are the criteria of those that don't won't be altered by this option.";

	OPT_LABEL_MAINUI = "Main Achievement UI Modifications";
	OPT_UI_SERIESTIP = "Tooltip for achievements that are part of a series";
	OPT_UI_SERIESTIP_TIP = "When the cursor is over an achievement that is part of a series, display the names of others in the series and its relation to them.";
	OPT_UI_REQUIREDFORMETATIP = "Tooltip for achievements required by others";
	OPT_UI_REQUIREDFORMETATIP_TIP = "When the cursor is over an achievement that is required to earn another achievement, display the name of the meta-achievement.";
	OPT_DRAGGABLE = "Make draggable";
	OPT_DRAGSAVE = "Remember position";

	OPT_SELECTSOUND = "Incomplete Achievement Reminder Sound";
	OPT_SELECTSOUND_TIP = "Play the selected sound when an incomplete achievement reminder is added to the tooltip.";
	OPT_SELECTSOUND_TIP2 = "Sounds will only play once every 15 seconds.";
	OPT_SELECTSOUND_ANGLERCHECKPOLE = "Exclude fishing node reminders if pole is equipped";
	OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP = "Don't play reminder sound from fishing nodes if your fishing pole is equipped.";

	SOUND_BELL_ALLIANCE = "Bell - Alliance";
	SOUND_BELL_HORDE = "Bell - Horde";
	SOUND_BELL_NIGHTELF = "Bell - Night Elf";
	SOUND_DRUMHIT = "Drum Hit";
	SOUND_BELL_BOATARRIVED = "Bells - Boat Arrived";
	SOUND_GONG_TROLL = "Gong - Troll";
	SOUND_BELL_MELLOW = "Mellow Bells";
	SOUND_ENTERQUEUE = "Enter Queue";
	SOUND_HEARTHBIND = "Hearthstone Bind";
	SOUND_BELL_KARA = "Karazhan Bell";
	SOUND_DING_AUCTION = "Auction Ding";
	SOUND_BELL_AUCTION = "Auction Bells";
	SOUND_ALARM1 = "Alarm Clock 1";
	SOUND_ALARM2 = "Alarm Clock 2";
	SOUND_ALARM3 = "Alarm Clock 3";
	SOUND_MAP_PING = "Map Ping";
	SOUND_SIMON_DING = "Simon Ding";
	SOUND_SIMON_STARTGAME = "Simon Start Game";
	SOUND_SIMON_STARTLEVEL = "Simon Start Level";
	SOUND_YAR = "Yarrrr";
}

local L, locale = OVERACHIEVER_STRINGS, GetLocale()

--if (locale == "enGB") then  -- English (EU)
-- Unfortunately, GetLocale() returns "enUS" even when "enGB" would be more appropriate, and the SHORTDATE
-- global string is defined incorrectly for enGB clients (it's set as it is for enUS), so we have to do things
-- this way:
if (ACHIEVEMENT_TOOLTIP_COMPLETE == "Achievement earned by %1$s on %3$d/%2$d/20%4$02d") then
	L["COMPLETEDATE"] = "Completed on %1$d/%2$02d/%3$02d";  -- 1 - day 2 - month 3 - year
end

if (locale == "zhTW") then  -- Traditional Chinese
-- Thanks to user xyrho at wowinterface.com and laincat at curse.com for these translations:
L["ACH_ANGLER_COMPLETE"] = "已釣過"
L["ACH_ANGLER_INCOMPLETE"] = "未釣過"
L["ACH_BUNNYMAKER_COMPLETE"] = "已經使用春日鮮花"
L["ACH_BUNNYMAKER_INCOMPLETE"] = "需要使用春日鮮花"
L["ACH_CONSUME_COMPLETE"] = "已使用過"
L["ACH_CONSUME_INCOMPLETE"] = "需要使用"
L["ACH_CONSUME_INCOMPLETE_EXTRA"] = "未使用過"
L["ACH_FISTFULOFLOVE_COMPLETE"] = "已用過一把玫瑰花瓣"
L["ACH_FISTFULOFLOVE_INCOMPLETE"] = "需使用一把玫瑰花瓣"
L["ACH_LETITSNOW_COMPLETE"] = "已用過一捧雪花"
L["ACH_LETITSNOW_INCOMPLETE"] = "需使用一捧雪花"
L["ACH_LOVECRITTERS_COMPLETE"] = "已 /愛 過"
L["ACH_LOVECRITTERS_INCOMPLETE"] = "需要 /愛"
L["ACH_WELLREAD_COMPLETE"] = "已讀過"
L["ACH_WELLREAD_INCOMPLETE"] = "未讀過"
L["BINDING_NAME_OVERACHIEVER_TAB_SEARCH"] = "啟用搜索標籤"
L["BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS"] = "啟用建議標籤"
L["BINDING_NAME_OVERACHIEVER_TAB_WATCH"] = "開啟觀察標籤"
L["COMPLETEDATE"] = "已完成 %1$d/%2$02d/%3$02d"
L["CRITTER"] = "小動物"
L["INCOMPLETE"] = "未完成"
L["KILL_COMPLETE"] = "已擊殺"
L["KILL_INCOMPLETE"] = "需要擊殺"
L["MSG_ACHNOTFOUND"] = "找不到該成就."
L["MSG_INVALIDID"] = "無效的ID."
L["MSG_NAMENOTFOUND"] = "找不到含有 \"|cffffffff%s|r\" 的成就."
L["MSG_NUMFOUNDLIST"] = "另外找到 %s 項成就:"
L["MSG_ONEFOUND"] = "找到 1 項成就: "
L["MSG_OPENINGTO"] = "開啟: "
L["OPT_ACHUNKNOWN"] = "<未知>"
L["OPT_ANGLERTIPS"] = "提示魚點是否釣過"
L["OPT_ANGLERTIPS_TIP"] = "增加魚點提示說明."
L["OPT_AUTOTRACKEXPLORE"] = "自動追蹤探索成就"
L["OPT_AUTOTRACKEXPLORE_COMPLETED"] = "包括已完成的成就"
L["OPT_AUTOTRACKEXPLORE_TIP"] = "轉換地圖時自動追蹤該區域探索成就."
L["OPT_AUTOTRACKTIMED"] = "自動追蹤計時成就"
L["OPT_AUTOTRACKTIMED_TIP"] = "自動追蹤的成就時，與標準時間的計時器啟動。如果不切換追蹤的另一項成就，除非它會自動追踪Overachiever 。"
L["OPT_BUNNYMAKERTIPS"] = "新增任何你需要許用春日鮮花"
-- L["OPT_BUNNYMAKERTIPS_TIP"] = ""
L["OPT_CONSUMEITEMTIPS"] = "提示食物是否吃過"
L["OPT_CONSUMEITEMTIPS_TIP"] = "增加食物提示說明"
L["OPT_CONSUMEITEMTIPS_TIP2"] = "如果你的等級不足以食用這個物品時，將不做提示"
L["OPT_CONSUMEITEMTIPS_TIP3"] = "注意:這個選項可能會增加你的載入時間"
L["OPT_CONSUMEITEMTIPS_WHENCOMPLETE"] = "完成後是否繼續提示"
L["OPT_CRITTERTIPS"] = "提示小動物是否愛過"
L["OPT_CRITTERTIPS_TIP"] = "在小動物的提示說明中註明."
L["OPT_DRAG_ACHFRAME"] = "可移動成就視窗"
L["OPT_DRAG_ACHTRACKER"] = "可移動成就追蹤框架"
L["OPT_DRAGGABLE"] = "使拖曳"
L["OPT_DRAGLOCK"] = "鎖定框架位置"
L["OPT_DRAGSAVE"] = "記住視窗位置"
L["OPT_FISTFULOFLOVETIPS"] = "提示是否需要使用一把玫瑰花瓣"
L["OPT_FISTFULOFLOVETIPS_TIP"] = "增加玩家提示說明."
L["OPT_KILLCREATURETIPS"] = "新增您是否需要殺死的怪物"
L["OPT_KILLCREATURETIPS_TIP"] = "新增一行動物提示(不包括小動物 )需要加以殺害，以符合標準的未完成的成就說明，表明您是否仍然需要殺死他們。"
-- L["OPT_KILLCREATURETIPS_TIP2"] = ""
L["OPT_LABEL_ACHTHREE"] = "\"%s,\" \"%s,\" 和 \"%s\""
L["OPT_LABEL_ACHTWO"] = "\"%s\" 和 \"%s\""
L["OPT_LABEL_DRAG"] = "移動視窗"
L["OPT_LABEL_MAINUI"] = "主要成就的UI修改"
L["OPT_LABEL_NEEDTOKILL"] = "殺死怪物成就 (\"%s,\" \"%s,\" etc.)"
L["OPT_LABEL_TOOLTIPS"] = "提示及連結設定"
L["OPT_LABEL_TRACKING"] = "追蹤設定"
L["OPT_LETITSNOWTIPS"] = "提示是否需要使用一捧雪花"
L["OPT_LETITSNOWTIPS_TIP"] = "增加玩家提示說明."
-- L["OPT_PESTCONTROLTIPS"] = ""
-- L["OPT_PESTCONTROLTIPS_TIP"] = ""
L["OPT_SELECTSOUND"] = "選擇提示音效"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE"] = "裝備魚竿時不提示釣魚成就"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP"] = "裝備魚竿時不聲音提示釣魚成就"
L["OPT_SELECTSOUND_TIP"] = "在發現一個需要完成的成就提示時播出提示音效"
L["OPT_SELECTSOUND_TIP2"] = "每15秒這個聲音只會出現1次"
L["OPT_SHOWID"] = "顯示成就ID"
L["OPT_SHOWPROGRESS"] = "顯示進度"
L["OPT_SHOWPROGRESS_OTHER"] = "比較其他人的進度連結"
L["OPT_SHOWPROGRESS_OTHER_TIP"] = "在別人的成就訊息連結說明中顯示自己的進度."
L["OPT_SHOWPROGRESS_TIP"] = "在提示說明中顯示成就進度."
L["OPT_TRACKERGREENCHECK"] = "顯示完成圖示"
L["OPT_TRACKERGREENCHECK_TIP"] = "在追蹤項目旁顯示已完成圖示."
-- L["OPT_UI_REQUIREDFORMETATIP"] = ""
L["OPT_UI_REQUIREDFORMETATIP_TIP"] = "當游標位於一個成就，需要獲得的另一項成就，顯示成就樹名稱。"
L["OPT_UI_SERIESTIP"] = "顯示系列成就的提示"
L["OPT_UI_SERIESTIP_TIP"] = "當滑鼠指向一個系列成就時，顯示系列中其他成就的名字和與目前成就的關係"
L["OPT_WELLREADTIPS"] = "提示書本是否閱讀過"
L["OPT_WELLREADTIPS_TIP"] = "增加書本提示說明."
L["PROGRESS"] = "進度"
L["REQUIREDFORMETATIP"] = "需要:"
L["SERIESTIP"] = "系列成就:"
L["SOUND_ALARM1"] = "鬧鈴聲 1"
L["SOUND_ALARM2"] = "鬧鈴聲 2"
L["SOUND_ALARM3"] = "鬧鈴聲 3"
-- L["SOUND_BELL_ALLIANCE"] = ""
-- L["SOUND_BELL_AUCTION"] = ""
-- L["SOUND_BELL_BOATARRIVED"] = ""
-- L["SOUND_BELL_HORDE"] = ""
-- L["SOUND_BELL_KARA"] = ""
-- L["SOUND_BELL_MELLOW"] = ""
-- L["SOUND_BELL_NIGHTELF"] = ""
-- L["SOUND_DING_AUCTION"] = ""
-- L["SOUND_DRUMHIT"] = ""
-- L["SOUND_ENTERQUEUE"] = ""
-- L["SOUND_GONG_TROLL"] = ""
-- L["SOUND_HEARTHBIND"] = ""
-- L["SOUND_MAP_PING"] = ""
-- L["SOUND_SIMON_DING"] = ""
-- L["SOUND_SIMON_STARTGAME"] = ""
-- L["SOUND_SIMON_STARTLEVEL"] = ""
-- L["SOUND_YAR"] = ""
L["YOURPROGRESS"] = "你的進度"


elseif (locale == "zhCN") then  -- Simplified Chinese
-- Thanks to user Miste(晨光麦) at wowinterface.com and yeah-chen and chrisccc at curse.com for these translations:
L["ACH_ANGLER_COMPLETE"] = "已钓过" -- Needs review
L["ACH_ANGLER_INCOMPLETE"] = "未钓过" -- Needs review
-- L["ACH_BUNNYMAKER_COMPLETE"] = ""
-- L["ACH_BUNNYMAKER_INCOMPLETE"] = ""
L["ACH_CONSUME_COMPLETE"] = "已使用过" -- Needs review
L["ACH_CONSUME_INCOMPLETE"] = "需要使用" -- Needs review
L["ACH_CONSUME_INCOMPLETE_EXTRA"] = "未使用过" -- Needs review
L["ACH_FISTFULOFLOVE_COMPLETE"] = "已用过一把玫瑰花瓣" -- Needs review
L["ACH_FISTFULOFLOVE_INCOMPLETE"] = "需使用一把玫瑰花瓣" -- Needs review
L["ACH_LETITSNOW_COMPLETE"] = "已用过一捧雪花" -- Needs review
L["ACH_LETITSNOW_INCOMPLETE"] = "需使用一捧雪花" -- Needs review
L["ACH_LOVECRITTERS_COMPLETE"] = "已 /爱 过" -- Needs review
L["ACH_LOVECRITTERS_INCOMPLETE"] = "需要 /爱" -- Needs review
L["ACH_WELLREAD_COMPLETE"] = "已读过" -- Needs review
L["ACH_WELLREAD_INCOMPLETE"] = "未读过" -- Needs review
L["BINDING_NAME_OVERACHIEVER_TAB_SEARCH"] = "打开搜索标签"
L["BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS"] = "打开建议标签"
-- L["BINDING_NAME_OVERACHIEVER_TAB_WATCH"] = ""
L["COMPLETEDATE"] = "已完成 %1$d/%2$02d/%3$02d" -- Needs review
L["CRITTER"] = "小动物" -- Needs review
L["INCOMPLETE"] = "未完成" -- Needs review
L["KILL_COMPLETE"] = "已经击杀" -- Needs review
L["KILL_INCOMPLETE"] = "需要击杀" -- Needs review
L["MSG_ACHNOTFOUND"] = "找不到该成就." -- Needs review
L["MSG_INVALIDID"] = "无效的ID." -- Needs review
L["MSG_NAMENOTFOUND"] = "找不到含有 \"|cffffffff%s|r\" 的成就." -- Needs review
L["MSG_NUMFOUNDLIST"] = "另外找到 %s 项成就:" -- Needs review
L["MSG_ONEFOUND"] = "找到 1 项成就: " -- Needs review
L["MSG_OPENINGTO"] = "开启: " -- Needs review
-- L["OPT_ACHUNKNOWN"] = ""
L["OPT_ANGLERTIPS"] = "提示鱼点是否钓过" -- Needs review
L["OPT_ANGLERTIPS_TIP"] = "增加鱼点提示说明." -- Needs review
L["OPT_AUTOTRACKEXPLORE"] = "自动追踪探索成就" -- Needs review
L["OPT_AUTOTRACKEXPLORE_COMPLETED"] = "包括已完成的成就" -- Needs review
L["OPT_AUTOTRACKEXPLORE_TIP"] = "转换地图时自动追踪该区域探索成就." -- Needs review
-- L["OPT_AUTOTRACKTIMED"] = ""
-- L["OPT_AUTOTRACKTIMED_TIP"] = ""
-- L["OPT_BUNNYMAKERTIPS"] = ""
-- L["OPT_BUNNYMAKERTIPS_TIP"] = ""
L["OPT_CONSUMEITEMTIPS"] = "提示食物是否吃过" -- Needs review
L["OPT_CONSUMEITEMTIPS_TIP"] = "增加食物提示说明" -- Needs review
L["OPT_CONSUMEITEMTIPS_TIP2"] = "如果你的等级不足以食用这个物品时，将不做提示" -- Needs review
L["OPT_CONSUMEITEMTIPS_TIP3"] = "此功能会让你的游戏载入时间延长几秒钟。" -- Needs review
L["OPT_CONSUMEITEMTIPS_WHENCOMPLETE"] = "完成后是否继续提示" -- Needs review
L["OPT_CRITTERTIPS"] = "提示小动物是否爱過" -- Needs review
L["OPT_CRITTERTIPS_TIP"] = "在小动物的提示说明中注明." -- Needs review
L["OPT_DRAG_ACHFRAME"] = "可移动成就窗体" -- Needs review
L["OPT_DRAG_ACHTRACKER"] = "可移动成就追踪框体" -- Needs review
-- L["OPT_DRAGGABLE"] = ""
L["OPT_DRAGLOCK"] = "锁定框架位置" -- Needs review
L["OPT_DRAGSAVE"] = "记住窗体位置" -- Needs review
L["OPT_FISTFULOFLOVETIPS"] = "提示是否需要使用一把玫瑰花瓣" -- Needs review
L["OPT_FISTFULOFLOVETIPS_TIP"] = "增加玩家提示说明." -- Needs review
-- L["OPT_KILLCREATURETIPS"] = ""
-- L["OPT_KILLCREATURETIPS_TIP"] = ""
-- L["OPT_KILLCREATURETIPS_TIP2"] = ""
L["OPT_LABEL_ACHTHREE"] = "\"%s,\" \"%s,\" 和 \"%s\"" -- Needs review
L["OPT_LABEL_ACHTWO"] = "\"%s\" 和 \"%s\"" -- Needs review
L["OPT_LABEL_DRAG"] = "移动窗体" -- Needs review
L["OPT_LABEL_MAINUI"] = "主成就界面修正" -- Needs review
-- L["OPT_LABEL_NEEDTOKILL"] = ""
L["OPT_LABEL_TOOLTIPS"] = "提示及连接设定" -- Needs review
L["OPT_LABEL_TRACKING"] = "追踪设定" -- Needs review
L["OPT_LETITSNOWTIPS"] = "提示是否需要使用一捧雪花" -- Needs review
L["OPT_LETITSNOWTIPS_TIP"] = "增加玩家提示说明." -- Needs review
-- L["OPT_PESTCONTROLTIPS"] = ""
-- L["OPT_PESTCONTROLTIPS_TIP"] = ""
L["OPT_SELECTSOUND"] = "选择提示音" -- Needs review
L["OPT_SELECTSOUND_ANGLERCHECKPOLE"] = "装备鱼竿时不提示钓鱼成就" -- Needs review
L["OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP"] = "装备鱼竿时不声音提示钓鱼成就" -- Needs review
L["OPT_SELECTSOUND_TIP"] = "在发现一个需要完成的成就提示时播出提示音" -- Needs review
L["OPT_SELECTSOUND_TIP2"] = "每15秒这个声音只会出现1次" -- Needs review
L["OPT_SHOWID"] = "显示成就ID" -- Needs review
L["OPT_SHOWPROGRESS"] = "显示进度" -- Needs review
L["OPT_SHOWPROGRESS_OTHER"] = "比较其他人的进度连接" -- Needs review
L["OPT_SHOWPROGRESS_OTHER_TIP"] = "在別人的成就讯息连接说明中显示自己的进度." -- Needs review
L["OPT_SHOWPROGRESS_TIP"] = "在提示说明中显示成就进度." -- Needs review
L["OPT_TRACKERGREENCHECK"] = "显示完成图示" -- Needs review
L["OPT_TRACKERGREENCHECK_TIP"] = "在追踪项目旁显示已完成图示." -- Needs review
-- L["OPT_UI_REQUIREDFORMETATIP"] = ""
-- L["OPT_UI_REQUIREDFORMETATIP_TIP"] = ""
L["OPT_UI_SERIESTIP"] = "提示系列成就" -- Needs review
L["OPT_UI_SERIESTIP_TIP"] = "当鼠标指向一个系列成就时，显示系列中其他成就的名字和与当前成就的关系" -- Needs review
L["OPT_WELLREADTIPS"] = "提示书本是否阅读过" -- Needs review
L["OPT_WELLREADTIPS_TIP"] = "增加书本提示说明." -- Needs review
L["PROGRESS"] = "进度" -- Needs review
L["REQUIREDFORMETATIP"] = "要求:" -- Needs review
L["SERIESTIP"] = "系列成就" -- Needs review
L["SOUND_ALARM1"] = "闹铃声 1" -- Needs review
L["SOUND_ALARM2"] = "闹铃声 2" -- Needs review
L["SOUND_ALARM3"] = "闹铃声 3" -- Needs review
L["SOUND_BELL_ALLIANCE"] = "联盟钟声" -- Needs review
L["SOUND_BELL_AUCTION"] = "拍卖行钟声" -- Needs review
L["SOUND_BELL_BOATARRIVED"] = "船只到港钟声" -- Needs review
L["SOUND_BELL_HORDE"] = "部落钟声" -- Needs review
L["SOUND_BELL_KARA"] = "卡拉赞的钟声" -- Needs review
L["SOUND_BELL_MELLOW"] = "圆润的钟声" -- Needs review
L["SOUND_BELL_NIGHTELF"] = "暗夜精灵钟声" -- Needs review
L["SOUND_DING_AUCTION"] = "拍卖行-叮" -- Needs review
L["SOUND_DRUMHIT"] = "鼓声" -- Needs review
L["SOUND_ENTERQUEUE"] = "进入战场列队声" -- Needs review
L["SOUND_GONG_TROLL"] = "巨魔锣声" -- Needs review
L["SOUND_HEARTHBIND"] = "炉石绑定声" -- Needs review
L["SOUND_MAP_PING"] = "小地图信号声" -- Needs review
L["SOUND_SIMON_DING"] = "叮(西蒙)" -- Needs review
L["SOUND_SIMON_STARTGAME"] = "游戏开始(西蒙)" -- Needs review
L["SOUND_SIMON_STARTLEVEL"] = "升级(西蒙)" -- Needs review
L["SOUND_YAR"] = "啊啊啊啊啊……" -- Needs review
L["YOURPROGRESS"] = "你的进度" -- Needs review

end

BINDING_HEADER_OVERACHIEVER = GetAddOnMetadata("Overachiever", "Title")
BINDING_NAME_OVERACHIEVER_TAB_SEARCH = L.BINDING_NAME_OVERACHIEVER_TAB_SEARCH;
BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = L.BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS;
BINDING_NAME_OVERACHIEVER_TAB_WATCH = L.BINDING_NAME_OVERACHIEVER_TAB_WATCH;
