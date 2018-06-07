local L = AceLibrary("AceLocale-2.2"):new("GridAutoFrameSize")

L:RegisterTranslations("zhCN", function() return
{
	["GridAutoFrameSize"] = "自动调整",
	AUTO_SIZE = "自动调整团队框体", -- Needs review
	AUTO_SIZE_DESC = "根据团队类型自动调整团队框体",
	FORCE_PETS = "总是使用宠物布局",
	FORCE_PETS_DESC = "缺省使用带宠物的布局方式.",
	WITH_PETS = "使用显示宠物的布局", -- Needs review
	WITH_PETS_DESC = "默认使用显示宠物的布局。在40人团队时无效。", -- Needs review
	ZONE_SIZE = "根据地图设定适应的框体",
	ZONE_SIZE_DESC = "根据地区自动设定适应的框体。例如：黑暗神庙/太阳之井高地自动选择25人框体",
}

end)