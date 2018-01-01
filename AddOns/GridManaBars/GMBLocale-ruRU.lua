local L = AceLibrary("AceLocale-2.2"):new("GridManaBars")

L:RegisterTranslations("ruRU", function() return {
	["Mana"] = "Мана",
	["Mana Bar"] = "Полоса маны",
	["Mana Bar options."] = "Настройки полосы маны.",

	["Size"] = "Размер",
	["Percentage of frame for mana bar"] = "Размер полосы маны в процентах.",
	["Side"] = "Сторона",
	["Side of frame manabar attaches to"] = "Сторона фрейма к которой прикрепить полосы маны.",
	["Left"] = "Слево",
	["Top"] = "Сверху",
	["Right"] = "Справо",
	["Bottom"] = "Снизу",

	["Colours"] = "Окраска",
	["Colours for the various powers"] = "Окраска различной энергии.",
	["Mana color"] = "Цвет маны",
	["Color for mana"] = "Окраска маны.",
	["Energy color"] = "Цвет энергии",
	["Color for energy"] = "Окраска энергии.",
	["Rage color"] = "Цвет ярости",
	["Color for rage"] = "Окраска ярости.",

	["Ignore Non-Mana"] = "Игнор без-маны",
	["Don't track power for non-mana users"] = "Не отслеживать энергию играков, которых класс не использует ману.",
	["Ignore Pets"] = "Игнор питомцев",
	["Don't track power for pets"] = "Не отслеживать энергию питомцев.",
} end)