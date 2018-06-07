local L = AceLibrary("AceLocale-2.2"):new("GridAutoFrameSize")

L:RegisterTranslations("zhTW", function() return
{
	["GridAutoFrameSize"] = "自動調整",
	AUTO_SIZE = "自動調整團隊框架",
	AUTO_SIZE_DESC = "依照團隊的版面編排自動調整適合的團隊框架",
	FORCE_PETS = "總是使用寵物的版面編排",
	FORCE_PETS_DESC = "使用寵物的版面編排為預設值，但不作用於40人團隊。",
	WITH_PETS = "當你招喚出寵物時，使用寵物的版面編排",
	WITH_PETS_DESC = "當你招喚出寵物時，使用寵物的版面編排。",
	ZONE_SIZE = "依照預定地區自動調整團隊框架",
	ZONE_SIZE_DESC = "依照預定地區自動調整適合的團隊框架，例如：黑暗神廟/太陽井高地自動選擇為25人框架",
}

end)