local L = AceLibrary("AceLocale-2.2"):new("Fence_AutoFill")

-- Localization
L:RegisterTranslations("zhTW", function() 
	return {
		["Auto-Fill"] = "自動填寫",
		["Auto-Fill - automatically inserts known auction prices"] = "自動填寫 - 自動填寫上已知的拍賣價格",
		["Auction Runtime"] = "拍賣時限",
		["Sets default auction runtime."] = "設定預設拍賣時限。",
		["Remembers last used auction runtime."] = "記住前次使用的拍賣時限。",
		["%s now set to %s hours."] = "%s現在設定為%s小時。",
		["Type in 12, 24 or 48"] = "輸入12，24或48",
		["Duration"] = "時限",
		["Auto-Buyout"] = "自動填寫直購價",
		["Markup"] = "標高比率",
		["Sets markup for auto-buy function."] = "設定自動填寫直購價的標高比率。",
		["Auto-fills buyout * customized markup if no price informations are available."] = "當沒有價格資訊時，自動填寫直購價為起始價格乘以標高比率。",
		["Auto-Search"] = "自動搜尋",
		["Performs auto-search on items you want to sell."] = "自動搜尋想拍賣的物品。",
		--["|cff00ff00Add|r %s"] = "|cff00ff00添加|r %s"",
		--["|cffff0000Remove|r %s"] = "|cffff0000刪除|r %s",
		--["|cff00ff00[%s]|r has been removed from query list."] = "|cff00ff00[%s]|r 被移除出查詢列表.",
	}
end)
