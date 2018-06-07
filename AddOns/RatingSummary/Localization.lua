
if (GetLocale() == "zhTW") then
	RATING_SUMMARY_ANNOUNCE = "|cffFFCC66RatingSummary|r-裝備屬性統計,|cffFFCC66Warbaby|r@|cffFF00FF聖光之願<冰封十字軍>|r"
	RATING_SUMMARY_ARMOR_PENETRATION = "護甲穿透"
	RATING_SUMMARY_TOTAL_AVOID = "免傷"

	--stat category in short
	RATING_SUMMARY_MELEE_CRIT = "物爆:"
	RATING_SUMMARY_SPELL_CRIT = "法爆:"
	RATING_SUMMARY_MANA_REGEN = "回藍:"


	RATING_SUMMARY_ITEM_LEVEL_TITLE = "裝備級別"
	RATING_SUMMARY_ITEM_LEVEL_FORMAT = "%2d 件 %3.0f 級"
	RATING_SUMMARY_ITEM_QUANLITY_NAME = {
		[7] = "金色",
		[6] = "紅色",
		[5] = "橙色",
		[4] = "紫色",
		[3] = "藍色",
		[2] = "綠色",
	}
	RATING_SUMMARY_OTHER = "其他"

	RATING_SUMMARY_TALENT = "天賦: ";
	RATING_SUMMARY_BASE = "基本屬性: ";

	RATING_SUMMARY_STRENGTH = "力量: ";
	RATING_SUMMARY_AGILITY = "敏捷: ";
	RATING_SUMMARY_STAMINA = "耐力: ";
	RATING_SUMMARY_INTELLECT = "智力: ";
	RATING_SUMMARY_SPIRIT = "精神: ";
	RATING_SUMMARY_RESILIENCE = "韌性: ";
	RATING_SUMMARY_ARMOR = "護甲: ";
elseif (GetLocale() == "zhCN") then
	RATING_SUMMARY_ANNOUNCE = "|cffFFCC66RatingSummary|r-装备属性统计,|cffFFCC66Warbaby|r@|cffFF00FF圣光之愿<冰封十字军>|r"
	RATING_SUMMARY_ARMOR_PENETRATION = "护甲穿透"
	RATING_SUMMARY_TOTAL_AVOID = "免伤"

	--stat category in short
	RATING_SUMMARY_MELEE_CRIT = "物爆:"
	RATING_SUMMARY_SPELL_CRIT = "法爆:"
	RATING_SUMMARY_MANA_REGEN = "回蓝:"


	RATING_SUMMARY_ITEM_LEVEL_TITLE = "装备级别"
	RATING_SUMMARY_ITEM_LEVEL_FORMAT = "%2d 件 %3.0f 级"
	RATING_SUMMARY_ITEM_QUANLITY_NAME = {
		[7] = "金色",
		[6] = "红色",
		[5] = "橙色",
		[4] = "紫色",
		[3] = "蓝色",
		[2] = "绿色",
	}
	RATING_SUMMARY_OTHER = "其他"

	RATING_SUMMARY_TALENT = "天赋: ";
	RATING_SUMMARY_BASE = "基本属性: ";

	RATING_SUMMARY_STRENGTH = "力量: ";
	RATING_SUMMARY_AGILITY = "敏捷: ";
	RATING_SUMMARY_STAMINA = "耐力: ";
	RATING_SUMMARY_INTELLECT = "智力: ";
	RATING_SUMMARY_SPIRIT = "精神: ";
	RATING_SUMMARY_RESILIENCE = "韧性: ";
	RATING_SUMMARY_ARMOR = "护甲: ";
else
	RATING_SUMMARY_ANNOUNCE = "|cffFFCC66RatingSummary|r-装备属性统计,|cffFFCC66Warbaby|r@|cffFF00FF圣光之愿<冰封十字军>|r"
	RATING_SUMMARY_ARMOR_PENETRATION = "护甲穿透"
	RATING_SUMMARY_TOTAL_AVOID = "免伤"

	--stat category in short
	RATING_SUMMARY_MELEE_CRIT = "物爆:"
	RATING_SUMMARY_SPELL_CRIT = "法爆:"
	RATING_SUMMARY_MANA_REGEN = "回蓝:"


	RATING_SUMMARY_ITEM_LEVEL_TITLE = "装备级别"
	RATING_SUMMARY_ITEM_LEVEL_FORMAT = "%2d 件 %3.0f 级"
	RATING_SUMMARY_ITEM_QUANLITY_NAME = {
		[7] = "金色",
		[6] = "红色",
		[5] = "橙色",
		[4] = "紫色",
		[3] = "蓝色",
		[2] = "绿色",
	}
	RATING_SUMMARY_OTHER = "其他"

	RATING_SUMMARY_TALENT = "天赋: ";
	RATING_SUMMARY_BASE = "基本属性: ";

	RATING_SUMMARY_STRENGTH = "力量: ";
	RATING_SUMMARY_AGILITY = "敏捷: ";
	RATING_SUMMARY_STAMINA = "耐力: ";
	RATING_SUMMARY_INTELLECT = "智力: ";
	RATING_SUMMARY_SPIRIT = "精神: ";
	RATING_SUMMARY_RESILIENCE = "韧性: ";
	RATING_SUMMARY_ARMOR = "护甲: ";
end

--[[
function a(start)
	local i;
	for i=start,start do
		ChatFrame1:AddMessage(i.."         ".."|cff9d9d9d|Hitem:39:"..i..":0:0:0:0:0:0:1|h[新兵束褲]|h|r");
	end
end

function b()
	local t = {3232, 3296, 3788, 3247, 3826, 3238, 3244}
	local i;
	for _, i in pairs(t) do
		a(i);
	end
end
]]