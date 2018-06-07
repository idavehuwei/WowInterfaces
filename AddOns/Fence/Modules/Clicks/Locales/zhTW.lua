local L = AceLibrary("AceLocale-2.2"):new("Fence_Clicks")

-- Localization
L:RegisterTranslations("zhTW", function() 
	return {
		["Clicks"] = "點擊",
		["Toggle click options for all available modules."] = "為所有模組切換點擊選項。\n|cffeda55fAlt-左擊: |r增加物品到拍賣視窗/交易視窗。\n|cffeda55fAlt-Shift-左擊: |r增加物品到拍賣視窗並開始拍賣。\n|cffeda55fCtrl-右擊: |r在拍賣場搜尋物品。\n|cffeda55fAlt-右擊: |r分開並拿起一件物品。\n|cffeda55fShift-右擊: |r分開並拿起一半物品。",
		["Fill"] = "填寫",
		["Search"] = "搜尋",
		["Split"] = "分開",
		["Trade"] = "交易",
		["QuickLeft"]="右鍵直接放入拍賣框",
		["QuickSearch"]="Shift+左鍵查詢",
	}
end)
