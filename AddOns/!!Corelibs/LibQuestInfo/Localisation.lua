--assert(false, "test")

local MAJOR_VERSION = "LibBabble-LibQuestInfoHeader-3.0"
local MINOR_VERSION = tonumber(("$Rev: 1 $"):match("%d+"))

if not LibStub then error(MAJOR_VERSION .. " requires LibStub.") end
local lib = LibStub("LibBabble-3.0"):New(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local GAME_LOCALE = GetLocale()

lib:SetBaseTranslations {
	-- main professions
	["Alchemy"] = "Alchemy",
	["Blacksmithing"] = "Blacksmithing",
	["Enchanting"] = "Enchanting",
	["Engineering"] = "Engineering",
	["Herbalism"] = "Herbalism",
	["Inscription"] = "Inscription",
	["Jewelcrafting"] = "Jewelcrafting",
	["Letherworking"] = "Letherworking",
	["Mining"] = "Mining",
	["Skinning"] = "Skinning",
	["Tailoring"] = "Tailoring",
	-- secondary professions
	["Cooking"] = "Cooking",
	["First Aid"] = "First Aid",
	["Fishing"] = "Fishing",

	-- periodic events
	["Brewfest"] = "Brewfest",
	["Midsummer"] = "Midsummer",
	["Lunar Festival"] = "Lunar Festival",
	["Darkmoon Faire"] = "Darkmoon Faire",
	["Seasonal"] = "Seasonal",

	-- other events
	["Epic"] = "Epic",
	["Battleground"] = "Battleground",
	["Treasure Map"] = "Treasure Map",
	["Special"] = "Special",
	["Legendary"] = "Legendary",
	["Ahn'Qiraj War"] = "Ahn'Qiraj War",
	["Reputation"] = "Reputation", 
	["Invasion"] = "Invasion",
	["Tournament"] = "Tournament",
	
	-- reseved words
	["nyi"] = "_ Not yet implemented",
	["UNKNOWN"] = "_ Unknown",
}


if GAME_LOCALE == "enUS" then
	lib:SetCurrentTranslations(true)
elseif GAME_LOCALE == "deDE" then
	lib:SetCurrentTranslations {
	-- main professions
		["Alchemy"] = "Alchimie",
		["Blacksmithing"] = "Schmiedekunst",
		["Enchanting"] = "Verzauberungskunst",
		["Engineering"] = "Ingenieurskunst",
		["Herbalism"] = "Kräuterkunde",
		["Inscription"] = "Inschriftenkunde",
		["Jewelcrafting"] = "Juwelenschleifen",
		["Leatherworking"] = "Lederverarbeitung",
		["Mining"] = "Bergbau",
		["Skinning"] = "Kürschnerei",
		["Tailoring"] = "Schneiderei",
	-- secondary professions
		["Cooking"] = "Kochkunst",
		["First Aid"] = "Erste Hilfe",
		["Fishing"] = "Angeln",

	-- periodic events
		["Brewfest"] = "Braufest",
		["Midsummer"] = "Sonnenwendfest",
		["Lunar Festival"] = "Mondfest",
		["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt",
		["Seasonal"] = "Saisonbedingt",
		["Noblegarden"] = "Nobelgarten",

	-- other events
		["Epic"] = "Episch",
		["Battleground"] = "Schlachtfeld",
		["Treasure Map"] = "Schatzkarte",
		["Special"] = "Spezial",
		["Legendary"] = "Legendär",
		["Ahn'Qiraj War"] = "Krieg von Ahn'Qiraj",
		["Reputation"] = "Ruf" ,
		["Invasion"] = "Invasion der Geißel",
		["Tournament"] = "Turnier",
		
	-- zones
		["Alcaz Island"] = "Insel Alcaz",
		--["Stratholme Past"] = "Das Ausmerzen von Stratholme",
		["Kharanos"] = "Kharanos",
		["Skettis"] = "Skettis",
		["Timbermaw Hold"] = "Holzschlundfeste",
		["Feathermoon Stronghold"] = "Mondfederfeste",
		["The Barrier Hills"] = "Die Hügelwand",
		--["Stormwind Stockade"] = "Verließ von Sturmwind",
		
	
	-- Starting Zones
	-- alliance
		["Northshire Valley"] = "Nordhaintal", -- human
		["Anvilmar"] = "Eisklammtal",-- gomes, darfs
		["Shadowglen"] = "Laubschattental",-- night elves
		["Ammen Vale"] = "Am'mental",-- Drenai
	
	-- horde
		["Valley of Trials"] = "Tal der Prüfungen",-- orc, troll
		["Deathknell"] = "Todesend",-- undeath
		["Red Cloud Mesa"] = "Hochwolkenebene",-- tauren
		["Sunstrider Isle"] = "Insel der Sonnenwanderer",-- bloodelves
	
	-- reseved words
	["nyi"] = "_ Nicht Implementiert",
	["UNKNOWN"] = "_ Unbekannt",
	}
end
