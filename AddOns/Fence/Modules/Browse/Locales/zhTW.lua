local L = AceLibrary("AceLocale-2.2"):new("Fence_Browse")

-- Localization
L:RegisterTranslations("zhTW", function() return {
		["Browse"] = "瀏覽",
		["Displays price per item."] = "顯示每件物品價格。",
		["Show Bid"] = "顯示競標狀態",
		["Show price per item"] = "顯示每件物品價格",
		["Price per item style"] = "每件物品價格樣式",
		['Show price for single items'] = "顯示單一物品價格",
		['Toggles whether prices are shown for items in stacks of 1'] = "總是顯示單一物品價格",
		["Changes price per item style."] = "改變每件物品價格樣式。",
		["Bid"] = "有競標",
		["Changes bid style."] = "改變競標狀態樣式。",
		["Bid Style"] = "競標狀態樣式",
		["short"] = "簡短",
		["full"] = "完整",
		["condensed"] = "扼要",
		["text"] = "文字",
		["fade"] = "漸暗",
		["|cff00ff00Add|r %s"]		= "|cff00ff00添加|r %s",
		["|cffff0000Remove|r %s"]	= "|cffff0000移除|r %s",	
		["Warning: List is full."]	= "警告:記錄物品已滿!",
		["|cff00ff00[%s]|r has been removed from query list."] = "|cff00ff00[%s]|r 已成功移除出查詢列表!",
		["|cff00ff00[%s]|r has been added to query list."] = "|cff00ff00[%s]|r 已成功添加入查詢列表!",
	}
end)
