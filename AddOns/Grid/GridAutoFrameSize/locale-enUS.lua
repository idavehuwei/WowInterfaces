local L = AceLibrary("AceLocale-2.2"):new("GridAutoFrameSize")

L:RegisterTranslations("enUS", function() return
{
	["GridAutoFrameSize"] = "GridAutoFrameSize",
	AUTO_SIZE = "Auto resize raid frame",
	AUTO_SIZE_DESC = "Automatically adjusts frame layout to raid size",
	FORCE_PETS = "Always use pet layouts",
	FORCE_PETS_DESC = "Uses layouts with pets by default.",
	WITH_PETS = "Use pet layouts, when your pet is active",
	WITH_PETS_DESC = "Uses layouts with pets, when your pet is active.",
	ZONE_SIZE = "Use predefined zone size",
	ZONE_SIZE_DESC = "Automatically adjust size of the layout to the zone you enter and locks it so it doesnt get resized when groups are changed. e.g. Black Temple / Sunwell by Group 25",
}

end)