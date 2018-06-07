--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhTW.lua - Localized string constants (zh-TW).              *
  ****************************************************************************]]


local L = LibStub("AceLocale-3.0"):NewLocale("_NPCScan", "zhTW");

if (not L) then return; end


-- See http://wow.curseforge.com/addons/npcscan/localization/zhTW/

L["NPCs"] = {
	[ 18684 ] = "無氏族的伯卡茲",
	[ 32491 ] = "時光流逝元龍",
	[ 33776 ] = "剛卓亞",
	[ 35189 ] = "史科爾",
	[ 38453 ] = "大角",
	[ 1140 ] = "刺喉龍族母",
	[ 5842 ] = "『跳躍者』塔克",
	[ 6581 ] = "暴掠龍族母",
	[ 14232 ] = "達爾特",
};

L["BUTTON_FOUND"] = "NPC 發現!";
L["CACHED_FORMAT"] = "下列單位已在cache中: %s。";
L["CACHED_LONG_FORMAT"] = "下列單位已在cache中。可由 |cff808080“/npcscan”|r 的選單移除牠們，或是清除你的cache來重啟搜尋: %s。";
L["CACHED_WORLD_FORMAT"] = "下列%2$s單位已在cache中: %1$s。";
L["CACHELIST_ENTRY_FORMAT"] = "|cff808080“%s”|r";
L["CACHELIST_SEPARATOR"] = "; ";
L["CMD_ADD"] = "ADD";
L["CMD_CACHE"] = "CACHE";
L["CMD_CACHE_EMPTY"] = "沒有任何尋找中的怪物存在cache中。";
L["CMD_HELP"] = "指令為|cff808080“/npcscan add <NpcID> <Name>”|r, |cff808080“/npcscan remove <Name>”|r, |cff808080“/npcscan cache”|r 列出已在cache中的怪物，可直接由|cff808080“/npcscan”|r 開啟選單。";
L["CMD_REMOVE"] = "REMOVE";
L["CMD_REMOVENOTFOUND_FORMAT"] = "找不到 |cff808080“%s”|r NPC。";
L["CONFIG_ALERT"] = "警報選項";
L["CONFIG_ALERT_SOUND"] = "警報音效檔";
L["CONFIG_ALERT_SOUND_DEFAULT"] = "|cffffd200預設|r";
L["CONFIG_ALERT_SOUND_DESC"] = "選擇發現NPC時的警報聲。其他音效可由加入|cff808080“SharedMedia”|r插件來新增。";
L["CONFIG_ALERT_UNMUTE"] = "使警報聲作響";
L["CONFIG_ALERT_UNMUTE_DESC"] = "如果您將遊戲靜音了，這將在發現NPC時暫時取消靜音以發出警報聲。";
L["CONFIG_CACHEWARNINGS"]= "登入或區域改變時提示已在cache中的怪物。";
L["CONFIG_CACHEWARNINGS_DESC"] = "勾選這個選項後，當你登入或是區域改變時，如果NPC已在cache中，會列出那些因為已經在cache中而無法再搜尋的怪物。";
L["CONFIG_DESC"] = "這些選項讓你設定當_NPCScan發現稀有NPC時提醒您的方式。";
L["CONFIG_TEST"] = "測試發現警報";
L["CONFIG_TEST_DESC"] = "模擬了 |cff808080“NPC 發現”|r 警報，讓你知道該怎麼看出來的。";
L["CONFIG_TEST_HELP_FORMAT"] = "點擊怪物目標按鈕或使用設定的鍵盤，將剛發現的怪物設為目標。按住|cffffffff<%s>|r鍵拖曳滑鼠可移動目標按鈕。注意假如發現NPC你剛好在戰鬥中，該按鍵會在你拖離戰鬥後才出現。";
L["CONFIG_TEST_NAME"] = "你! (測試)";
L["CONFIG_TITLE"] = "_|cffCCCC88NPCScan|r";
L["FOUND_FORMAT"] = "發現 |cff808080“%s”|r!";
L["FOUND_TAMABLE_FORMAT"] = "發現 |cff808080“%s”|r!  |cffff2020(Note: Tamable mob, may only be a pet.)|r";
L["FOUND_TAMABLE_WRONGZONE_FORMAT"] = "|cffff2020假警鈴:|r 發現可馴服的怪物|cff808080“%s”|r出現在%s而不是在%s (編號%d)，顯然是獵人的寵物。";
L["PRINT_FORMAT"] = "_|cffCCCC88NPCScan|r: %s";
L["SEARCH_ACHIEVEMENTADDFOUND"] = "繼續搜尋成就裡已經完成的NPC。";
L["SEARCH_ACHIEVEMENTADDFOUND_DESC"] = "繼續尋找所有與成就相關的NPC，即使你不需要再擊殺牠們。";
L["SEARCH_ACHIEVEMENT_DISABLED"] = "關閉";
L["SEARCH_ADD"] = "+";
L["SEARCH_ADD_DESC"] = "新增NPC或在此儲存變更。";
L["SEARCH_ADD_TAMABLE_FORMAT"] = "注意：|cff808080“%s”|r可被馴服，如果發現牠被馴服為獵人的寵物時將出現假警報。";
L["SEARCH_CACHED"] = "已cache";
L["SEARCH_COMPLETED"] = "完成";
L["SEARCH_DESC"] = "你可以在下表中新增或移除NPC，或是選擇需要搜尋NPC的相關成就。";
L["SEARCH_ID"] = "NPC ID";
L["SEARCH_ID_DESC"] = "想尋找的NPC的ID。這個編號可以在類似Wowhead.com的資料庫網站上找到。";
L["SEARCH_NAME"] = "名稱";
L["SEARCH_NAME_DESC"] = "NPC的稱呼。這個稱呼不需要和NPC原來的名字完全相同。";
L["SEARCH_NPCS"] = "自訂NPC";
L["SEARCH_NPCS_DESC"] = "新增任何你想尋找的NPC，即使不在成就的項目中。";
L["SEARCH_REMOVE"] = "-";
L["SEARCH_TITLE"] = "搜尋";
L["SEARCH_WORLD"] = "世界:";
L["SEARCH_WORLD_DESC"] = "一個非必要的區域名稱，用來限制搜尋區域。可以是世界地圖名稱或是|cffff7f3f副本名稱|r (較敏感)。";
L["SEARCH_WORLD_FORMAT"] = "(%s)";

L["OVERLAY_CONFIG_ALPHA"] = "透明度";
L["OVERLAY_CONFIG_DESC"] = "設定在哪張地圖顯示怪物移動路徑。大部分的地圖插件都針對世界地圖做設定。";
L["OVERLAY_CONFIG_SHOWALL"] = "永遠顯示所有路徑";
L["OVERLAY_CONFIG_SHOWALL_DESC"] = "通常地圖上不會顯示非搜尋中的怪物的路徑圖。開啟這個選項將永遠顯示所有已知的路徑圖。";
L["OVERLAY_CONFIG_TITLE"] = "路徑圖";
L["OVERLAY_CONFIG_TITLE_STANDALONE"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_CONFIG_ZONE"] = "地區:";
L["OVERLAY_MODULE_ALPHAMAP3"] = "AlphaMap3 插件";
L["OVERLAY_MODULE_BATTLEFIELDMINIMAP"] = "顯示戰場迷你地圖";
L["OVERLAY_MODULE_MINIMAP"] = "小地圖";
L["OVERLAY_MODULE_RANGERING_DESC"] = "提示： 在有稀有怪的地圖才顯示距離環(例如主城跟冬握就不會顯示).";
L["OVERLAY_MODULE_RANGERING_FORMAT"] = "顯示大概 %d碼的偵測距離環";
L["OVERLAY_MODULE_WORLDMAP"] = "主要世界地圖";
L["OVERLAY_MODULE_WORLDMAP_KEY"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_MODULE_WORLDMAP_KEY_FORMAT"] = "• %s";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE"] = "_|cffCCCC88NPCScan|r.Overlay";
L["OVERLAY_MODULE_WORLDMAP_TOGGLE_DESC"] = "如果開啟，顯示_|cffCCCC88NPCScan|r.Overlay已知怪物路徑的路徑圖。";



_G["BINDING_NAME_CLICK _NPCScanButton:LeftButton"] = [=[最後找到的目標怪物
|cff808080(當_NPCScan通知你時使用)|r]=];