local L = AceLibrary("AceLocale-2.2"):new("Fence_AutoFill")

-- Localization
L:RegisterTranslations("enUS", function() 
	return {
		["Auto-Fill"] = true,
		["Auto-Fill - automatically inserts known auction prices"] = true,
		["Auction Runtime"] = true,
		["Sets default auction runtime."] = true,
		["Remembers last used auction runtime."] = true,
		["%s now set to %s hours."] = true,
		["Type in 12, 24 or 48"] = true,
		["Duration"] = true,
		["Auto-Buyout"] = true,
		["Markup"] = true,
		["Sets markup for auto-buy function."] = true,
		["Auto-fills buyout * customized markup if no price informations are available."] = true,
		["Auto-Search"] = true,
		["Performs auto-search on items you want to sell."] = true,
		["|cff00ff00Add|r %s"] = true,
		["|cffff0000Remove|r %s"] = true,
		["|cff00ff00[%s]|r has been removed from query list."] = true,
	}
end)
