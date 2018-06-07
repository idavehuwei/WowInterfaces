local L = AceLibrary("AceLocale-2.2"):new("Fence_Browse")

-- Localization
L:RegisterTranslations("enUS", function() return {
		["Browse"] = true,
		["Displays price per item."] = true,
		["Show Bid"] = true,
		["Show price per item"] = true,
		["Price per item style"] = true,
		['Show price for single items'] = true,
		['Toggles whether prices are shown for items in stacks of 1'] = true,
		["Changes price per item style."] = true,
		["Bid"] = true,
		["Changes bid style."] = true,
		["Bid Style"] = true,
		["short"] = true,
		["full"] = true,
		["condensed"] = true,
		["text"] = true,
		["fade"] = true,
		["|cff00ff00Add|r %s"]	= true,
		["|cffff0000Remove|r %s"]	= true,
		["Warning: List is full."]	= true,
		["|cff00ff00[%s]|r has been removed from query list."] = true,
		["|cff00ff00[%s]|r has been added to query list."] = true,
	}
end)
