
local L, locale = OVERACHIEVER_STRINGS, GetLocale()

L.TRADE_SKILLET_ACHSORT = "By Achievement";

if (locale == "enUS" or locale == "enGB") then  -- English
	L.TRADE_COOKING_OBJRENAME = [[
Spiced Wyrm Burger=Spiced Worm Burger
]]
end

if (locale == "zhTW") then  -- Traditional Chinese
-- L["TRADE_COOKING_OBJRENAME"] = ""
L["TRADE_SKILLET_ACHSORT"] = "的成就"


elseif (locale == "zhCN") then  -- Simplified Chinese
-- L["TRADE_COOKING_OBJRENAME"] = ""
L["TRADE_SKILLET_ACHSORT"] = "的成就" -- Needs review

end
