-- -------------------------------------------------------------------------- --
-- GridStatusThreat DEFAULT (english) Localization                            --
-- Please make sure to save this file as UTF-8. ¶                             --
-- -------------------------------------------------------------------------- --

local L = AceLibrary("AceLocale-2.2"):new("GridStatusThreat")

L:RegisterTranslations("enUS", function() return {
	["Threat"] = true,
	["Threat: Text"] = true,

	["AGGRO"] = true,

	["Threatcolors"] = true,
	["Specify colors for the different threat conditions."] = true,

	["Top Threat (>=%s%%)"] = true,
	["Top Threat"] = true,
	["Middle Threat (>=%s%% and <%s%%)"] = true,
	["Middle Threat"] = true,
	["Low Threat (>=%s%% and <%s%%)"] = true,
	["Low Threat (Start)"] = true,

	["Text options:"] = true,

	["Textcolor"] = true,
	["Specify textcolor."] = true,

	["Classcolor"] = true,
	
	["Threatcolor"] = true,
	
	["Fixed color"] = true,
	["Select fixed color"] = true,

} end)