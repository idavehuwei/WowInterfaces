local L = AceLibrary("AceLocale-2.2"):new("Fence_AutoFill")

-- Localization
L:RegisterTranslations("zhCN", function() 
	return {
		["Auto-Fill"] = "自动填写",
		["Auto-Fill - automatically inserts known auction prices"] = "自动填写 - 自动填写入上次该物品的拍卖价格",
		["Auction Runtime"] = "拍卖时限",
		["Sets default auction runtime."] = "设定默认拍卖时限。",
		["Remembers last used auction runtime."] = "保存上次所使用的拍卖时限。",
		["%s now set to %s hours."] = "%s现在设定为%s小时。",
		["Type in 12, 24 or 48"] = "输入12，24或48",
		["Duration"] = "时限",
		["Auto-Buyout"] = "自动填写一口价",
		["Markup"] = "一口价系数",
		["Sets markup for auto-buy function."] = "设定自动填写一口价功能的一口价系数。",
		["Auto-fills buyout * customized markup if no price informations are available."] = "当缺乏一口价信息历史记录时，自动填写入相当于起始价格乘以一口价系数的一口价数额。",
		["Auto-Search"] = "自动搜索",
		["Performs auto-search on items you want to sell."] = "自动搜索你想拍卖的物品。",
		--["|cff00ff00Add|r %s"] = "|cff00ff00添加|r %s"",
		--["|cffff0000Remove|r %s"] = "|cffff0000刪除|r %s",
		--["|cff00ff00[%s]|r has been removed from query list."] = "|cff00ff00[%s]|r 被移除出查询列表.",
	}
end)
