
local L, locale = OVERACHIEVER_STRINGS, GetLocale()

L.SEARCH_TAB = "Search";
L.SEARCH_HELP = "Use this tab to search for achievements. You can also search for achievements by name or ID using slash commands. See Overachiever's readme.txt file for details.";
L.SEARCH_NAME = "Name:";
L.SEARCH_DESC = "Description:";
L.SEARCH_CRITERIA = "Criteria:";
L.SEARCH_REWARD = "Reward:";
L.SEARCH_ANY = "Any of the above:";
L.SEARCH_FULLLIST = "Search all achievements";
L.SEARCH_FULLLIST_TIP = "Include in the search achievements that aren't normally listed in the default UI, such as those exclusive to the opposing faction, unacquired Feats of Strength, etc.";
L.SEARCH_SUBMIT = "Search";
L.SEARCH_RESET = "Reset";
L.SEARCH_RESULTS = "Found %s |4achievement:achievements;.";

L.SUGGESTIONS_TAB = "Suggestions";
L.SUGGESTIONS_HELP = "Suggested achievements are listed here based on your current location. Also listed are any achievements you were reminded about through a tooltip within the last 2 minutes.";
L.SUGGESTIONS_REFRESH = "Refresh";
L.SUGGESTIONS_EMPTY = "Overachiever has no suggestions for you at this time.";
L.SUGGESTIONS_RESULTS = "%d |4suggestion:suggestions; found.";
L.SUGGESTIONS_RESULTS_TRADESKILL = "%s: %d |4suggestion:suggestions; found.";
L.SUGGESTIONS_EMPTY_TRADESKILL = "%s: Overachiever has no suggestions for you at this time.";

L.WATCH_TAB = "Watch";
L.WATCH_HELP = "Create your watch list by |cffffffffalt+clicking|r on achievements in the other tabs or achievement chat links. |cffffffffAlt+click|r on one displayed here to stop watching it.";
L.WATCH_EMPTY = "Your watch list is empty. Alt+click on an achievement in another tab or an achievement's chat link to watch it.";

L.TAB_SORT = "Sort by:";
L.TAB_SORT_NAME = "Name";
L.TAB_SORT_ID = "ID";
L.TAB_SORT_POINTS = "Point value";
L.TAB_SORT_COMPLETE = "Date completed";
L.TAB_HELP = "|cffffffffCtrl-click|r on an achievement to jump to its place in the standard UI.|n|nA |cffffffffblue background|r means it is part of a series for which you haven't completed an earlier step.|n|nA |cffffffffred background|r means it cannot be found in the standard UI for this character because it is exclusive to the opposing faction or is an unacquired Feat of Strength.|n|nA |cffffffffgreen background|r means a reminder about this achievement was displayed in a tooltip recently.";

if (locale == "zhTW") then  -- Traditional Chinese
L["SEARCH_ANY"] = "以上皆可:"
L["SEARCH_CRITERIA"] = "條件:"
L["SEARCH_DESC"] = "描述:"
L["SEARCH_FULLLIST"] = "搜索所有成就"
L["SEARCH_FULLLIST_TIP"] = "包括所有成就,已完成的,未完成的,無法完成的,等等."
L["SEARCH_HELP"] = "使用此標籤來搜索成就。您也可以使用命令搜索成就的名稱或編號。見 Overachiever 的 Readme.txt 文件的相關內容。"
L["SEARCH_NAME"] = "名稱:"
L["SEARCH_RESET"] = "重置"
L["SEARCH_RESULTS"] = "搜索到 %s |4achievement:個成就;."
L["SEARCH_REWARD"] = "獎勵:"
L["SEARCH_SUBMIT"] = "搜索"
L["SEARCH_TAB"] = "搜索"
L["SUGGESTIONS_EMPTY"] = "Overachiever現在沒有任何建議。"
L["SUGGESTIONS_EMPTY_TRADESKILL"] = "%s: Overachiever 此時無法提供建議."
L["SUGGESTIONS_HELP"] = "根據你目前的位置建議追蹤成就。"
L["SUGGESTIONS_REFRESH"] = "刷新"
L["SUGGESTIONS_RESULTS"] = "找到 %d 個建議."
L["SUGGESTIONS_RESULTS_TRADESKILL"] = "%s: 找到 %d 個建議."
L["SUGGESTIONS_TAB"] = "建議"
L["TAB_HELP"] = "|cffffffffCtrl + 點選|r 所選成就會跳轉到該成就的頁面.|n|n |cffffffff藍色背景|r表示此成就是你還沒有完成前續內容的系列成就部分.|n|n |cffffffff紅色背景|r表示此成就無法在你當前人物的標準成就界面中找到,因為這是陣營專屬成就,或者是你尚未取得的『光輝事跡』成就."
L["TAB_SORT"] = "類型:"
L["TAB_SORT_COMPLETE"] = "完成時間"
L["TAB_SORT_ID"] = "成就ID"
L["TAB_SORT_NAME"] = "名稱"
L["TAB_SORT_POINTS"] = "成就點數"
L["WATCH_EMPTY"] = "你的觀察列表示空的. Alt+click在其它成就標籤上或是成就連結來觀察."
L["WATCH_HELP"] = "在其他成就標籤上或是成就連結使用 |cffffffffalt+clicking|r來新建你的觀察列表. |cffffffffAlt+click|r 將停止觀察. "
L["WATCH_TAB"] = "觀察"


elseif (locale == "zhCN") then  -- Simplified Chinese
L["SEARCH_ANY"] = "以上所有：" -- Needs review
L["SEARCH_CRITERIA"] = "条件：" -- Needs review
L["SEARCH_DESC"] = "描述：" -- Needs review
L["SEARCH_FULLLIST"] = "搜索所有成就" -- Needs review
L["SEARCH_FULLLIST_TIP"] = "包括没有在默认列表中显示的成就，例如阵营专属成就、‘光辉事迹’成就等。" -- Needs review
L["SEARCH_HELP"] = "使用这个标签来搜索成就。你也可以通过斜杠命令用名字或ID来搜索成就。详细请参见Overachiever的readme.txt文件。" -- Needs review
L["SEARCH_NAME"] = "名字：" -- Needs review
L["SEARCH_RESET"] = "重置" -- Needs review
L["SEARCH_RESULTS"] = "找到 %s |4achievement:个成就;." -- Needs review
L["SEARCH_REWARD"] = "奖励：" -- Needs review
L["SEARCH_SUBMIT"] = "搜索" -- Needs review
L["SEARCH_TAB"] = "搜索" -- Needs review
L["SUGGESTIONS_EMPTY"] = "Overachiever现在没有任何建议。" -- Needs review
-- L["SUGGESTIONS_EMPTY_TRADESKILL"] = ""
L["SUGGESTIONS_HELP"] = "根据你的当前位置建议追踪成就。" -- Needs review
L["SUGGESTIONS_REFRESH"] = "刷新" -- Needs review
L["SUGGESTIONS_RESULTS"] = "找到 %d |4成就:成就;." -- Needs review
-- L["SUGGESTIONS_RESULTS_TRADESKILL"] = ""
L["SUGGESTIONS_TAB"] = "建议" -- Needs review
L["TAB_HELP"] = "|cffffffffCtrl-点击|r一个成就跳转到它在标准成就界面的位置。|n|n |cffffffff蓝色背景|r表示此成就是你还没有完成前续内容的系列成就。|n|n |cffffffff红色背景|r表示此成就无法在当前人物的标准成就界面中找到，因为这是阵营专属成就，或是无法取得的‘光辉事迹’成就。|n|n  |cffffffff绿色背景|r 是提醒此成就最近在鼠标提示中显示过。" -- Needs review
L["TAB_SORT"] = "按……排序：" -- Needs review
L["TAB_SORT_COMPLETE"] = "完成时间" -- Needs review
L["TAB_SORT_ID"] = "成就ID" -- Needs review
L["TAB_SORT_NAME"] = "名字" -- Needs review
L["TAB_SORT_POINTS"] = "成就点数" -- Needs review
-- L["WATCH_EMPTY"] = ""
-- L["WATCH_HELP"] = ""
-- L["WATCH_TAB"] = ""

end
