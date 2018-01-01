--local L = Rock("LibRockLocale-1.0"):GetTranslationNamespace("Cartographer_QuestInfo")
local L = LibStub("AceLocale-3.0"):NewLocale("Cartographer_QuestInfo", "enUS", true);

if (L) then
-- Core.lua
	L["Enabled"] = true;
	L["Suspend/resume this module."] = true;
	L["Icon alpha"] = true;
	L["Alpha transparency of the icon."] = true;
	L["Icon size"] = true;
	L["Size of the icons on the map."] = true;
	L["Show minimap icons"] = true;
	L["Show quest icons on the minimap."] = true;
	L["Show all quest givers"] = true;
	L["Show all quest givers, or just show givers around your level."] = true;
	L["Include giver's quest list"] = true;
	L["Include quest list when showing quest givers, or just show the number of quests (which is much faster)."] = true;
	L["Show world map button"] = true;
	L["Show button on the world map."] = true;
	L["Show quest level"] = true;
	L["Show quest level in quest log and NPC dialog."] = true;
	L["Make quest log double wide"] = true;
	L["Make the quest log window double wide, this will require UI reload."] = true;
	L["Auto update quest icons"] = true;
	L["Auto update quest icons after quest or objective completed."] = true;
	L["Update tracked quests only"] = true;
	L["Update tracked quests only, or update all active quests."] = true;
	L["Quest Info"] = true;
	L["Module description"] = "Quest library for mob location and other information";
	L["GROUP"] = GROUP;

-- LocationFrame.lua
	L["Close"] = true;

-- Map.lua
	L["Quest Start"] = true;
	L["Quest End"] = true;
	L["Quest Giver"] = true;
	L["Quest Objective"] = true;
	L["Show active quests"] = true;
	L["Show all info of active quests on current map."] = true;
	L["Show tracked quests"] = true;
	L["Show all info of tracked quests on current map."] = true;
	L["Show available quests"] = true;
	L["Show the givers of available quests on current map."] = true;
	L["Clear quest icons"] = true;
	L["Clear quest icons generated by QuestInfo."] = true;
	L["Open QuestInfo menu"] = true;
	L["Alt-Click: "] = true;
	L["Shift-Click: "] = true;
	L["Elite"] = true;
	L["Rare Elite"] = true;
	L["Boss"] = true;
	L["Name:"] = true;
	L["Objective:"] = true;
	L["Source:"] = true;
	L["Level:"] = true;
	L["Location:"] = true;
	L["Quests:"] = true;
	L["%d Quests"] = true;

-- QuestFuPatch.lua
	L["(done)"] = true;

-- QuestLogPatch.lua
	L[" ..."] = true;
	L["... more"] = true;

-- SeriesFrame.lua
	L["Quest Series"] = true;
	L["Requires:"] = true;
	L["Sharable"] = true;
	L["Series:"] = true;	

	-- Notes
	L["Notes"] = true
	L["Module which allows you to put notes on the map.\n\nHint: /note is available to create notes with the command line."] = true
	L["Icon size"] = true
	L["Size of the icons on the map"] = true
	L["Show minimap icons"] = true
	L["Show icons on the minimap"] = true
	L["Minimap icon size"] = true
	L["Size of the icons on the minimap"] = true
	L["Clear all notes on map"] = true
	L["This will clear all notes on map"] = true
	L["Enable Notes"] = true

	L["Can't create a note for your current position"] = true
	L["Create a note success"] = true
	L["Create a new note"] = true
	L["New note"] = true
	L['Okay'] =true
	L['Cancel'] = true
	L['White'] =true
	L['Gray'] = true
	L['Pink'] = true
	L['Red'] = true
	L['Orange'] = true
	L['Yellow'] = true
	L['Green'] = true
	L['Stone grey'] = true
	L['Cyan'] = true
	L['Blue'] = true
	L['Sky-blue'] = true
	L['Purple'] =true
	L["X Offset"] = true
	L["Y Offset"] =true
	L["Zone"] = true
	L["Title"] = true
	L["Info1"] = true
	L["Info2"] =  true
	L["Creator"] = true
	L["Custom Icon"] = true
	L["New Note"] = true
	L["Edit note"] = true
	L['Range'] = true
	L["Creator: "] = true
	L['Delete note'] = true
	L["Send"] = true
	L["Send to Party/Raid"] = true
	L["Send to guild"] = true
	L["Send to player"] =true
	L[" at "] = true
	L["Right-Click on map to zoom out"] = true
	L["Left-Click on map to zoom in"] = true
	L["Ctrl-Right-Click on map to add a note"] = true

	L["Mapster"] = true
	L["General Settings"] = true
	L["Show note creator"] = true
end