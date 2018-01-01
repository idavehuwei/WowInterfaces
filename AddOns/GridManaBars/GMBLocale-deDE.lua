local L = AceLibrary("AceLocale-2.2"):new("GridManaBars")

L:RegisterTranslations("deDE", function() return {
	["Mana"] = "Mana",
	["Mana Bar"] = "Manaleiste",
	["Mana Bar options."] = "Optionen für Manaleiste.",

	["Size"] = "Größe",
	["Percentage of frame for mana bar"] = "Prozentualer Anteil der Rahmengröße für die Manaleiste",
	["Side"] = "Seite",
	["Side of frame manabar attaches to"] = "Rahmenseite, an der die Manaleiste angebracht werden soll",
	["Left"] = "Links",
	["Top"] = "Oben",
	["Right"] = "Rechts",
	["Bottom"] = "Unten",

	["Colours"] = "Leistenfarben",
	["Colours for the various powers"] = "Farbe der verschiedenen Leisten",
	["Mana color"] = "Mana",
	["Color for mana"] = "Farbe für Mana",
	["Energy color"] = "Energie",
	["Color for energy"] = "Farbe für Energie",
	["Rage color"] = "Wut",
	["Color for rage"] = "Farbe für Wut",

	["Ignore Non-Mana"] = "Verstecken bei Nicht-Manaklassen",
	["Don't track power for non-mana users"] = "Versteckt Leiste für Nicht-Manaklassen",
	["Ignore Pets"] = "Begleiter ignorieren",
	["Don't track power for pets"] = "Versteckt die jeweiligen Leisten der Begleiter",
} end)