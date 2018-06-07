local L = AceLibrary("AceLocale-2.2"):new("Fence_Browse")

-- Localization
L:RegisterTranslations("zhCN", function() return {
		["Browse"] = "浏览",
		["Displays price per item."] = "显示物品单价。",
		["Show Bid"] = "显示竞标状态",
		["Show price per item"] = "显示物品单价",
		["Price per item style"] = "物品单价显示样式",
		["Changes price per item style."] = "改变物品单价显示样式。",
		["Bid"] = "竞标状态",
		["Changes bid style."] = "改变竞标状态显示样式。",
		["Bid Style"] = "竞标状态显示样式",
		["Bid"]	= "已竞",
		["Changes bid style."] = "改變競標狀態樣式。",
		["Bid Style"] = "競標狀態樣式",
		["short"] = "簡短",
		["full"] = "完整",
		["condensed"] = "扼要",
		["text"] = "文字",
		["fade"] = "漸暗",
		["|cff00ff00Add|r %s"]	= "|cff00ff00添加|r %s",
		["|cffff0000Remove|r %s"]	= "|cffff0000移除|r %s",
		["Warning: List is full."]	= "警告:记录物品已满!",
		["|cff00ff00[%s]|r has been removed from query list."] = "|cff00ff00[%s]|r 已成功移除出查询列表!",
		["|cff00ff00[%s]|r has been added to query list."] = "|cff00ff00[%s]|r 已成功添加入查询列表!",
	}
end)
