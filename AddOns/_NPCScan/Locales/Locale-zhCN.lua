--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhCN.lua - Localized string constants (zh-CN).              *
  ****************************************************************************]]

local L = LibStub("AceLocale-3.0"):NewLocale("_NPCScan", "zhCN");

if (not L) then return; end

L["NPCs"] = {
        [ 18684 ] = "独行者布罗加斯",
        [ 33776 ] = "古德利亚",
	[ 1140 ] = "刺喉雌龙",
	[ 5842 ] = "“跳跃者”塔克",
	[ 6581 ] = "暴掠龙女王",
	[ 14232 ] = "达尔特",
	[ 32491 ] = "迷失的始祖幼龙",
	[ 35189 ] = "逐日",
	[ 38453 ] = "阿克图瑞斯",
};

L["BUTTON_FOUND"] = "发现NPC!";
L["CACHED_FORMAT"] = "下列NPC已在缓存中: %s.";
L["CACHED_LONG_FORMAT"] = "下面这些NPC已经在缓存中. 可以用|cff808080“/npcscan”|r来清除他们, 或者清除你的缓存来重新搜索: %s.";
L["CACHED_PET_RESTING_FORMAT"] = "下列可驯服的宠物在你休息时缓存到: %s.";
L["CACHED_WORLD_FORMAT"] = "下列 %2$s 单位已经在缓存中: %1$s.";
L["CACHELIST_ENTRY_FORMAT"] = "|cff808080“%s”|r";
L["CACHELIST_SEPARATOR"] = "; ";
L["CMD_ADD"] = "ADD";
L["CMD_CACHE"] = "CACHE";
L["CMD_CACHE_EMPTY"] = "没有任何寻找中的怪物在缓存中";
L["CMD_HELP"] = "命令为 |cff808080“/npcscan add <NpcID> <Name>”|r, |cff808080“/npcscan remove <NpcID or Name>”|r, |cff808080“/npcscan cache”|r 列出缓存里的怪物, 输入 |cff808080“/npcscan”|r 将显示此帮助.";
L["CMD_REMOVE"] = "REMOVE";
L["CMD_REMOVENOTFOUND_FORMAT"] = "|cff808080“%s”|r 没有找到.";
L["CONFIG_ALERT"] = "提示选项";
L["CONFIG_ALERT_SOUND"] = "声音提示";
L["CONFIG_ALERT_SOUND_DEFAULT"] = "|cffffd200默认|r";
L["CONFIG_ALERT_SOUND_DESC"] = "选择一个声音, 会在找到NPC时播放.  可以用 |cff808080“SharedMedia”|r 来添加新的声音.";
L["CONFIG_ALERT_UNMUTE"] = "在播放音效时取消禁音";
L["CONFIG_ALERT_UNMUTE_DESC"] = "在找到追踪的怪物后打开被禁用的音效以播放声音提示, 完成后会自动禁用音效";
L["CONFIG_CACHEWARNINGS"] = "在读条后提示你清除缓存";
L["CONFIG_CACHEWARNINGS_DESC"] = "如果一个NPC已经在缓存里了, 在你读条完之后会在聊天框提示你.";
L["CONFIG_DESC"] = "设置检测到稀有NPC后怎样提示";
L["CONFIG_TEST"] = "测试音效";
L["CONFIG_TEST_DESC"] = "测试 |cff808080“找到NPC”|r 提示.";
--CONFIG_TEST_HELP_FORMAT"] = "点击Click the target button or use the provided keybinding to target the found mob.  Hold |cffffffff<%s>|r and drag to move the target button.  Note that if an NPC is found while you're in combat, the button will only appear after you exit combat.";
L["CONFIG_TEST_HELP_FORMAT"] = "点击选中按钮或绑定的快捷键来选择. 按住|cffffffff<%s>|拖动选中按钮. 如果在npc在战斗中被发现, 按钮只能在战斗结束后出现.";
L["CONFIG_TEST_NAME"] = "你! (测试)";
L["CONFIG_TITLE"] = "稀有精英探测";
L["FOUND_FORMAT"] = "找到 |cff808080“%s”|r!";
L["FOUND_TAMABLE_FORMAT"] = "找到 |cff808080“%s”|r!  |cffff2020(提示: 可驯服宠物, 可能只是个宠物.)|r";
L["FOUND_TAMABLE_WRONGZONE_FORMAT"] = "|cffff2020错误警报:|r 找到可驯服宠物 |cff808080“%s”|r 在 %s 而不是 %s (ID %d); 肯定是别人的宠物.";
L["PRINT_FORMAT"] = "_|cffCCCC88NPCScan|r: %s";
L["SEARCH_ACHIEVEMENTADDFOUND"] = "寻找成就要求的 NPC";
L["SEARCH_ACHIEVEMENTADDFOUND_DESC"] = "继续寻找所有的NPC, 即使你之前已经找到过.";
L["SEARCH_ACHIEVEMENT_DISABLED"] = "Disabled";
L["SEARCH_ADD"] = "+";
L["SEARCH_ADD_DESC"] = "添加新的NPC或保存修改";
L["SEARCH_ADD_TAMABLE_FORMAT"] = "提示: |cff808080“%s”|r 是可驯服的, 所以看到其他猎人的宠物可能会造成错误警报.";
L["SEARCH_CACHED"] = "已缓存";
L["SEARCH_COMPLETED"] = "已完成";
L["SEARCH_DESC"] = "这个表允许你添加/删除需搜索的成就/npc";
L["SEARCH_ID"] = "NPC ID:";
L["SEARCH_ID_DESC"] = "被寻找NPC的ID, 可以在db.duowan.com之类的网站找到";
L["SEARCH_NAME"] = "名字:";
L["SEARCH_NAME_DESC"] = "不需要和NPC名字一模一样";
L["SEARCH_NPCS"] = "自定义 NPC";
L["SEARCH_NPCS_DESC"] = "添加NPC到搜索列表, 即使没有成就也可以";
L["SEARCH_REMOVE"] = "-";
L["SEARCH_TITLE"] = "搜索";
L["SEARCH_WORLD"] = "世界:";
L["SEARCH_WORLD_DESC"] = "可选世界名, 可以是大陆或|cffff7f3副本|r (需要完全匹配).";
L["SEARCH_WORLD_FORMAT"] = "(%s)";

L["OVERLAY_CONFIG_ALPHA"] = "透明度";
L["OVERLAY_CONFIG_DESC"] = "设定在哪张地图显示怪物移动路径。大部分的地图插件都针对世界地图做设定。";
L["OVERLAY_CONFIG_SHOWALL"] = "永远显示所有路径";
L["OVERLAY_CONFIG_SHOWALL_DESC"] = "通常地图上不会显示非搜寻中的怪物的路径图。开启这个选项将永远显示所有已知的路径图。";
L["OVERLAY_CONFIG_TITLE"] = "路径图";
L["OVERLAY_CONFIG_TITLE_STANDALONE"] = "稀有精英路径图";
L["OVERLAY_CONFIG_ZONE"] = "地区:";
L["OVERLAY_MODULE_ALPHAMAP3"] = "AlphaMap3 插件";
L["OVERLAY_MODULE_BATTLEFIELDMINIMAP"] = "显示战场迷你地图";
L["OVERLAY_MODULE_MINIMAP"] = "小地图";
L["OVERLAY_MODULE_RANGERING_DESC"] = "提示： 在有稀有怪的地图才显示距离环(例如主城跟冬握就不会显示).";
L["OVERLAY_MODULE_RANGERING_FORMAT"] = "显示大概 %d码的侦测距离环";
L["OVERLAY_MODULE_WORLDMAP"] = "主要世界地图";
L["OVERLAY_MODULE_WORLDMAP_KEY"] = "稀有精英路径图";
L["OVERLAY_MODULE_WORLDMAP_KEY_FORMAT"] = "· %s";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE"] = "稀有精英路径图";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE_DESC"] = "如果开启，显示已知稀有精英路径的路径图。";


BINDING_HEADER__NPCSCAN = "稀有精英探测";
_G[ "BINDING_NAME_CLICK _NPCScanButton:LeftButton" ] = [=[选中最后发现的稀有精英
|cff808080(当获得通知时)|r]=];
