--=============================================
-- 名称: Localiziaon
-- 日期: 2009-12-19
-- 描述: 本地化信息文件
-- 作者: dugu
-- 版权所有 (c) duowan.com
--=============================================
DUOWAN_LOCALIZATION = {}
local L = DUOWAN_LOCALIZATION;
if (GetLocale() == "zhCN") then	
	L["禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块"] = "禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块";
	L["左键打开多玩配置界面\n右键弹出小地图按键包"]= "左键 - 打开多玩配置界面\n右键 - 弹出小地图按键包";
	DUOWAN_ADDONS_NAME = "多玩魔盒";
	DUOWAN_COFNIG_TEXT = "多玩魔盒设置";
	DUOWAN_VERSION = "版本: " .. dwGetVersion();
	DUOWAN_CONFIG_ACP = "插件管理";
	DUOWAN_CONFIG_LEV = "关 闭";
	DUOWAN_PRVE_PAGE = "上一页";
	DUOWAN_NEXT_PAGE = "下一页";
	DUOWAN_CONFIG_TAB_NORMAL = "常 规";
	DUOWAN_CONFIG_TAB_RAID = "团 队";
	DUOWAN_RELOAD = "|cff999999<重载>|r";
	DUOWAN_RELOAD_DESC  = "该插件采用了动态载入技术. 反选\n此项将|cff3366ff重新载入界面|r, 重载后该插\n件不再占用任何资源. ";
	DUOWAN_MINI_TIP_HEAD = "小提示: ";
	DUOWAN_MINI_TIPS = {
		"Clique + Grid 治疗驱散两不误",
		"伤害统计面板不见了? 请查看团队分页",
		"哦, 天啦! 你真是个好人",
		"好友面板的\"导\"可以导入其他角色的好友",
		"Shift + 左键点击目标可以快速设置焦点",
		"合理游戏, 多玩会儿少玩会儿多少玩会儿",
	};
	DW_TRADEMONEY_CONFIRMATION="确定要将下列金额交易给%s吗？";
	DUOWAN_CHANGELOG_FONT = "Fonts\\ZYHei.TTF";
	L["确定|cffff7000重新载入界面|r?"] = "确定|cffff7000重新载入界面|r?";
	DUOWAN_LOADED_TITLE = "==魔盒公告==";
	DUOWAN_LOADED_STRING = "　　　YY魔盒官方频道正式开通, |cffffffffID: 23|r。多玩魔兽专属电台|cffffffffYY303|r，魔兽人共同的家。在这里，没有喧嚣，只有真实的声音；在这里，没有征战，只有真实的故事。\n";
	DUOWAN_ON_DATA_STRING = "　　　大脚、魔盒、精灵、月光宝盒、wowui.cn、魔兽藏宝箱、炽火、急云等，3月12日齐聚|cffffffffYY303|r频道。热血从未冷却，梦想不曾枯萎，《UI寻梦2005-2011》，致敬我们幕后的英雄。3月12日晚8点，和插件有个约会。";
	L["Close"] = "关 闭";
	L["FootText"] = "详情请咨询魔盒官方频道 YY:23";
	RUNEFRAME_MENU_TITLE_TEXT = "多玩符文条";
	RUNEFRAME_MENU_REPOS_TEXT = "重置位置";
	RUNEFRAME_MENU_SCALE_TEXT = "缩放尺寸";
	RUNEFRAME_MENU_TIP_TEXT1 = "Shift+左键移动位置";
	RUNEFRAME_MENU_TIP_TEXT2 = "Shift+右键恢复定位";
	DUOWAN_TEAMNOTICE_HEAD = "魔盒团队提示: ";
	DUOWAN_TEAMNOTICE_TEXT = "海内存知己，魔盒最懂你！欢迎加入我们的团队！";
	DUOWAN_TEAMNOTICE_ADD_TEXT = "请输入要发送的团队公告信息";
	DUOWAN_QUESTINFO_DIALOG_TEXT = "确认开启任务查询<QuestInfo>\n";
	DUOWAN_QUESTINFO_TEXT = "任务查询";
	DUOWAN_QUESTINFO_LOAD_TEXT = "载入任务查询";
elseif (GetLocale() == "zhTW") then	
	L["禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块"] = "禁用插件要|cffff7000重新載入界面|r才能生效,\n是否選擇立即重載？\n如果取消|cffffff00下次登錄|r將會禁用此模塊";
	L["左键打开多玩配置界面\n右键弹出小地图按键包"] = "左鍵 - 打開多玩配置介面\n右鍵 - 彈出小地圖按鍵包";
	DUOWAN_ADDONS_NAME = "多玩魔盒";
	DUOWAN_COFNIG_TEXT = "多玩魔盒設置";
	DUOWAN_VERSION = "版本: " .. dwGetVersion();
	DUOWAN_CONFIG_ACP = "插件管理";
	DUOWAN_CONFIG_LEV = "關 閉";
	DUOWAN_PRVE_PAGE = "上一頁";
	DUOWAN_NEXT_PAGE = "下一頁";
	DUOWAN_CONFIG_TAB_NORMAL = "常 規";
	DUOWAN_CONFIG_TAB_RAID = "團 隊";
	DUOWAN_RELOAD = "|cff999999<重載>|r";
	DUOWAN_RELOAD_DESC  = "該插件採用了動態載入技術. 反選\n此項將|cff3366ff重新載入介面|r, 重載後該插\n件不再佔用任何資源. ";
	DUOWAN_MINI_TIP_HEAD = "小提示: ";
	DUOWAN_MINI_TIPS = {
		"Clique + Grid 治療驅散兩不誤",
		"傷害統計面板不見了? 請查看團隊分頁",
		"哦, 天啦! 你真是個好人",
		"好友面板的\"導\"可以導入其他角色的好友",
		"Shift + 左鍵點擊目標可以快速設置焦點",
		"合理遊戲, 多玩會兒少玩會兒多少玩會兒",
	};
	DW_TRADEMONEY_CONFIRMATION="確定要將下列金額交易給%s嗎？"
	DUOWAN_CHANGELOG_FONT = "Fonts\\bHEI01B.TTF";
	L["确定|cffff7000重新载入界面|r?"] = "確定|cffff7000重新載入介面|r?";
	DUOWAN_LOADED_TITLE = "==魔盒公告==";
	DUOWAN_LOADED_STRING = "       YY魔盒官方頻道正式開通, |cff3366ffID: 23|r。多玩魔獸專屬電臺|cff3366ffYY303|r，魔獸人共同的家。在這裏，沒有喧囂，只有真實的聲音；在這裏，沒有征戰，只有真實的故事。\n";
	DUOWAN_ON_DATA_STRING = "";
	L["Close"] = "關 閉";
	L["FootText"] = "詳情請諮詢魔盒官方頻道 YY:23";
	RUNEFRAME_MENU_TITLE_TEXT = "多玩符文條";
	RUNEFRAME_MENU_REPOS_TEXT = "重置位置";
	RUNEFRAME_MENU_SCALE_TEXT = "縮放尺寸";
	RUNEFRAME_MENU_TIP_TEXT1 = "Shift+左鍵移動位置";
	RUNEFRAME_MENU_TIP_TEXT2 = "Shift+右鍵恢復定位";
	DUOWAN_TEAMNOTICE_HEAD = "魔盒團隊提示: ";
	DUOWAN_TEAMNOTICE_TEXT = "海內存知己，魔盒最懂你！歡迎加入我們的團隊！";
	DUOWAN_TEAMNOTICE_ADD_TEXT = "請輸入要發送的團隊公告資訊";
	DUOWAN_QUESTINFO_DIALOG_TEXT = "確認開啟任務查詢<QuestInfo>\n";
	DUOWAN_QUESTINFO_TEXT = "任務查詢";
	DUOWAN_QUESTINFO_LOAD_TEXT = "載入任務查詢";
else	
	L["禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块"] = "Disable addons will be |cffff7000reload ui|r, Are you sure?\nIf cancel will disable it on |cffffff00next login|r";
	L["左键打开多玩配置界面\n右键弹出小地图按键包"] = "Left click to open config frame\nRight click to open MBB";
	DUOWAN_ADDONS_NAME = "DuoWan";
	DUOWAN_VERSION = "ver: " .. dwGetVersion();
	DUOWAN_COFNIG_TEXT = "Duowan Config";
	DUOWAN_CONFIG_ACP = "ACP";
	DUOWAN_CONFIG_LEV = "Close";
	DUOWAN_PRVE_PAGE = "Prev Page";
	DUOWAN_NEXT_PAGE = "Next Page";
	DUOWAN_CONFIG_TAB_NORMAL = "Normal";
	DUOWAN_CONFIG_TAB_RAID = "Raid";
	DUOWAN_RELOAD = "|cff999999<Reload>|r";
	DUOWAN_RELOAD_DESC  = "该插件采用了的动态载入技术. 反选此项将|cff6699cc重新载入界面|r, 重载后该插件不再占用任何资源. ";
	DUOWAN_MINI_TIP_HEAD = "小提示: ";
	DUOWAN_MINI_TIPS = {
		"Clique + Grid 治疗驱散两不误",
		"伤害统计面板不见了? 请查看团队分页",
		"哦, 天啦! 你真是个好人",
		"好友面板的\"导\"可以导入其他角色的好友",
		"Shift + 左键点击目标可以快速设置焦点",
		"合理游戏, 多玩会儿少玩会儿多少玩会儿",
	};
	DW_TRADEMONEY_CONFIRMATION="Will trade the follow amount of gold to %s, continue?"
	DUOWAN_CHANGELOG_FONT = "Fonts\\bHEI01B.TTF";
	L["确定|cffff7000重新载入界面|r?"] = "确定|cffff7000重新载入界面|r?";
	DUOWAN_LOADED_TITLE = "魔盒公告:";
	DUOWAN_LOADED_STRING = "";
	DUOWAN_ON_DATA_STRING = "";
	L["Close"] = "关 闭";
	L["FootText"] = "详情请咨询魔盒官方频道 YY:23";
	RUNEFRAME_MENU_TITLE_TEXT = "多玩符文条";
	RUNEFRAME_MENU_REPOS_TEXT = "重置位置";
	RUNEFRAME_MENU_SCALE_TEXT = "缩放尺寸";
	RUNEFRAME_MENU_TIP_TEXT1 = "Shift+左键移动位置";
	RUNEFRAME_MENU_TIP_TEXT2 = "Shift+右键恢复定位";
	DUOWAN_TEAMNOTICE_HEAD = "魔盒团队提示: ";
	DUOWAN_TEAMNOTICE_TEXT = "海内存知己，魔盒最懂你！欢迎加入我们的团队！";
	DUOWAN_TEAMNOTICE_ADD_TEXT = "请输入要发送的团队公告信息";
	DUOWAN_QUESTINFO_DIALOG_TEXT = "确认开启任务查询<QuestInfo>\n";
	DUOWAN_QUESTINFO_TEXT = "任务查询";
	DUOWAN_QUESTINFO_LOAD_TEXT = "载入任务查询";
end
