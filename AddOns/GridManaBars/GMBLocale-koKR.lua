local L = AceLibrary("AceLocale-2.2"):new("GridManaBars")

L:RegisterTranslations("koKR", function() return {
	["Mana"] = "마나",
	["Mana Bar"] = "마나 바",
	["Mana Bar options."] = "마나 바 옵션을 설정합니다.",

	["Size"] = "크기",
	["Percentage of frame for mana bar"] = "마나 바의 크기를 설정합니다.",
	["Side"] = "위치",
	["Side of frame manabar attaches to"] = "마나 바의 위치를 설정합니다.",
	["Left"] = "좌측",
	["Top"] = "상단",
	["Right"] = "우측",
	["Bottom"] = "하단",

	["Colours"] = "색상",
	["Colours for the various powers"] = "다양한 파워 바의 색상을 설정합니다.",
	["Mana color"] = "마나 색상",
	["Color for mana"] = "마나의 색상을 설정합니다.",
	["Energy color"] = "기력 색상",
	["Color for energy"] = "기력의 색상을 설정합니다.",
	["Rage color"] = "분노 색상",
	["Color for rage"] = "분노의 색상을 설정합니다.",

	["Ignore Non-Mana"] = "비-마나 무시",
	["Don't track power for non-mana users"] = "비-마나 사용자를 위해 파워 바를 표시하지 않습니다.",
	["Ignore Pets"] = "소환수 무시",
	["Don't track power for pets"] = "소환수의 파워를 표시하지 않습니다.",
} end)