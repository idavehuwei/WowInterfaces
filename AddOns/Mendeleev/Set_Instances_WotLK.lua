	local BB = LibStub("LibBabble-Boss-3.0"):GetLookupTable()
	local BZ = LibStub("LibBabble-Zone-3.0"):GetLookupTable()
	local L = LibStub("AceLocale-3.0"):GetLocale("Mendeleev")
	
	local showDropRate = function (v)
		v = tonumber(v)
		return v and (" (%.1f%%)"):format(v / 10) or ""
	end

--~ 	table.insert(MENDELEEV_SETS, {
--~ 		name = BZ["<INSTANCE>"],
--~ 		setindex = "InstanceLoot.<INSTANCE>",
--~ 		colour = "|cffB0C4DE",
--~ 		header = BZ["<INSTANCE>"],
--~ 		useval = showDropRate,
--~ 		quality = 3,
--~ 		sets = {
--~ 			["InstanceLoot.<INSTANCE>.<BOSS>"] = BB["<BOSS>"],
--~ 			["InstanceLoot.<INSTANCE>.<BOSS>"] = BB["<BOSS>"],
--~ 		},
--~ 	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Ahn'kahet: The Old Kingdom"],
		setindex = "InstanceLoot.Ahn'kahet: The Old Kingdom",
		colour = "|cffB0C4DE",
		header = BZ["Ahn'kahet: The Old Kingdom"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Ahn'kahet: The Old Kingdom.Elder Nadox"] = BB["Elder Nadox"],
			["InstanceLoot.Ahn'kahet: The Old Kingdom.Herald Volazj"] = BB["Herald Volazj"],
			["InstanceLoot.Ahn'kahet: The Old Kingdom.Jedoga Shadowseeker"] = BB["Jedoga Shadowseeker"],
			["InstanceLoot.Ahn'kahet: The Old Kingdom.Prince Taldaram"] = BB["Prince Taldaram"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Ahn'kahet: The Old Kingdom"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Ahn'kahet: The Old Kingdom",
		colour = "|cffB0C4DE",
		header = BZ["Ahn'kahet: The Old Kingdom"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Ahn'kahet: The Old Kingdom.Amanitar"] = BB["Amanitar"],
			["InstanceLootHeroic.Ahn'kahet: The Old Kingdom.Elder Nadox"] = BB["Elder Nadox"],
			["InstanceLootHeroic.Ahn'kahet: The Old Kingdom.Herald Volazj"] = BB["Herald Volazj"],
			["InstanceLootHeroic.Ahn'kahet: The Old Kingdom.Jedoga Shadowseeker"] = BB["Jedoga Shadowseeker"],
			["InstanceLootHeroic.Ahn'kahet: The Old Kingdom.Prince Taldaram"] = BB["Prince Taldaram"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Azjol-Nerub"],
		setindex = "InstanceLoot.Azjol-Nerub",
		colour = "|cffB0C4DE",
		header = BZ["Azjol-Nerub"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Azjol-Nerub.Anub'arak"] = BB["Anub'arak"],
			["InstanceLoot.Azjol-Nerub.Hadronox"] = BB["Hadronox"],
			["InstanceLoot.Azjol-Nerub.Krik'thir the Gatewatcher"] = BB["Krik'thir the Gatewatcher"],
		},
	})

		table.insert(MENDELEEV_SETS, {
		name = BZ["Azjol-Nerub"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Azjol-Nerub",
		colour = "|cffB0C4DE",
		header = BZ["Azjol-Nerub"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Azjol-Nerub.Anub'arak"] = BB["Anub'arak"],
			["InstanceLootHeroic.Azjol-Nerub.Hadronox"] = BB["Hadronox"],
			["InstanceLootHeroic.Azjol-Nerub.Krik'thir the Gatewatcher"] = BB["Krik'thir the Gatewatcher"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Culling of Stratholme"],
		setindex = "InstanceLoot.The Culling of Stratholme",
		colour = "|cffB0C4DE",
		header = BZ["The Culling of Stratholme"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Culling of Stratholme.Chrono-Lord Epoch"] = BB["Chrono-Lord Epoch"],
			["InstanceLoot.The Culling of Stratholme.Mal'Ganis"] = BB["Mal'Ganis"],
			["InstanceLoot.The Culling of Stratholme.Meathook"] = BB["Meathook"],
			["InstanceLoot.The Culling of Stratholme.Salramm the Fleshcrafter"] = BB["Salramm the Fleshcrafter"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Culling of Stratholme"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Culling of Stratholme",
		colour = "|cffB0C4DE",
		header = BZ["The Culling of Stratholme"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Culling of Stratholme.Chrono-Lord Epoch"] = BB["Chrono-Lord Epoch"],
			["InstanceLootHeroic.The Culling of Stratholme.Infinite Corruptor"] = BB["Infinite Corruptor"],
			["InstanceLootHeroic.The Culling of Stratholme.Mal'Ganis"] = BB["Mal'Ganis"],
			["InstanceLootHeroic.The Culling of Stratholme.Meathook"] = BB["Meathook"],
			["InstanceLootHeroic.The Culling of Stratholme.Salramm the Fleshcrafter"] = BB["Salramm the Fleshcrafter"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Drak'Tharon Keep"],
		setindex = "InstanceLoot.Drak'Tharon Keep",
		colour = "|cffB0C4DE",
		header = BZ["Drak'Tharon Keep"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Drak'Tharon Keep.King Dred"] = BB["King Dred"],
			["InstanceLoot.Drak'Tharon Keep.Novos the Summoner"] = BB["Novos the Summoner"],
			["InstanceLoot.Drak'Tharon Keep.The Prophet Tharon'ja"] = BB["The Prophet Tharon'ja"],
			["InstanceLoot.Drak'Tharon Keep.Trollgore"] = BB["Trollgore"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Drak'Tharon Keep"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Drak'Tharon Keep",
		colour = "|cffB0C4DE",
		header = BZ["Drak'Tharon Keep"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Drak'Tharon Keep.King Dred"] = BB["King Dred"],
			["InstanceLootHeroic.Drak'Tharon Keep.Novos the Summoner"] = BB["Novos the Summoner"],
			["InstanceLootHeroic.Drak'Tharon Keep.The Prophet Tharon'ja"] = BB["The Prophet Tharon'ja"],
			["InstanceLootHeroic.Drak'Tharon Keep.Trollgore"] = BB["Trollgore"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Gundrak"],
		setindex = "InstanceLoot.Gundrak",
		colour = "|cffB0C4DE",
		header = BZ["Gundrak"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Gundrak.Drakkari Colossus"] = BB["Drakkari Colossus"],
			["InstanceLoot.Gundrak.Gal'darah"] = BB["Gal'darah"],
			["InstanceLoot.Gundrak.Moorabi"] = BB["Moorabi"],
			["InstanceLoot.Gundrak.Slad'ran"] = BB["Slad'ran"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Gundrak"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Gundrak",
		colour = "|cffB0C4DE",
		header = BZ["Gundrak"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Gundrak.Drakkari Colossus"] = BB["Drakkari Colossus"],
			["InstanceLootHeroic.Gundrak.Eck the Ferocious"] = BB["Eck the Ferocious"],
			["InstanceLootHeroic.Gundrak.Gal'darah"] = BB["Gal'darah"],
			["InstanceLootHeroic.Gundrak.Moorabi"] = BB["Moorabi"],
			["InstanceLootHeroic.Gundrak.Slad'ran"] = BB["Slad'ran"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Naxxramas"],
		setindex = "InstanceLoot.Naxxramas",
		colour = "|cffB0C4DE",
		header = BZ["Naxxramas"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Naxxramas.Anub'Rekhan"] = BB["Anub'Rekhan"],
			["InstanceLoot.Naxxramas.Four Horsemen Chest"] = BB["Four Horsemen Chest"],
			["InstanceLoot.Naxxramas.Gluth"] = BB["Gluth"],
			["InstanceLoot.Naxxramas.Gothik the Harvester"] = BB["Gothik the Harvester"],
			["InstanceLoot.Naxxramas.Grand Widow Faerlina"] = BB["Grand Widow Faerlina"],
			["InstanceLoot.Naxxramas.Grobbulus"] = BB["Grobbulus"],
			["InstanceLoot.Naxxramas.Heigan the Unclean"] = BB["Heigan the Unclean"],
			["InstanceLoot.Naxxramas.Instructor Razuvious"] = BB["Instructor Razuvious"],
			["InstanceLoot.Naxxramas.Kel'Thuzad"] = BB["Kel'Thuzad"],
			["InstanceLoot.Naxxramas.Loatheb"] = BB["Loatheb"],
			["InstanceLoot.Naxxramas.Maexxna"] = BB["Maexxna"],
			["InstanceLoot.Naxxramas.Noth the Plaguebringer"] = BB["Noth the Plaguebringer"],
			["InstanceLoot.Naxxramas.Patchwerk"] = BB["Patchwerk"],
			["InstanceLoot.Naxxramas.Sapphiron"] = BB["Sapphiron"],
			["InstanceLoot.Naxxramas.Thaddius"] = BB["Thaddius"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Naxxramas"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Naxxramas",
		colour = "|cffB0C4DE",
		header = BZ["Naxxramas"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Naxxramas.Anub'Rekhan"] = BB["Anub'Rekhan"],
			["InstanceLootHeroic.Naxxramas.Four Horsemen Chest"] = BB["Four Horsemen Chest"],
			["InstanceLootHeroic.Naxxramas.Gluth"] = BB["Gluth"],
			["InstanceLootHeroic.Naxxramas.Gothik the Harvester"] = BB["Gothik the Harvester"],
			["InstanceLootHeroic.Naxxramas.Grand Widow Faerlina"] = BB["Grand Widow Faerlina"],
			["InstanceLootHeroic.Naxxramas.Grobbulus"] = BB["Grobbulus"],
			["InstanceLootHeroic.Naxxramas.Heigan the Unclean"] = BB["Heigan the Unclean"],
			["InstanceLootHeroic.Naxxramas.Instructor Razuvious"] = BB["Instructor Razuvious"],
			["InstanceLootHeroic.Naxxramas.Kel'Thuzad"] = BB["Kel'Thuzad"],
			["InstanceLootHeroic.Naxxramas.Loatheb"] = BB["Loatheb"],
			["InstanceLootHeroic.Naxxramas.Maexxna"] = BB["Maexxna"],
			["InstanceLootHeroic.Naxxramas.Noth the Plaguebringer"] = BB["Noth the Plaguebringer"],
			["InstanceLootHeroic.Naxxramas.Patchwerk"] = BB["Patchwerk"],
			["InstanceLootHeroic.Naxxramas.Sapphiron"] = BB["Sapphiron"],
			["InstanceLootHeroic.Naxxramas.Thaddius"] = BB["Thaddius"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Eye of Eternity"],
		setindex = "InstanceLoot.The Eye of Eternity",
		colour = "|cffB0C4DE",
		header = BZ["The Eye of Eternity"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Eye of Eternity.Malygos"] = BB["Malygos"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Eye of Eternity"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Eye of Eternity",
		colour = "|cffB0C4DE",
		header = BZ["The Eye of Eternity"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Eye of Eternity.Malygos"] = BB["Malygos"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Nexus"],
		setindex = "InstanceLoot.The Nexus",
		colour = "|cffB0C4DE",
		header = BZ["The Nexus"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Nexus.Anomalus"] = BB["Anomalus"],
			["InstanceLoot.The Nexus.Grand Magus Telestra"] = BB["Grand Magus Telestra"],
			["InstanceLoot.The Nexus.Keristrasza"] = BB["Keristrasza"],
			["InstanceLoot.The Nexus.Ormorok the Tree-Shaper"] = BB["Ormorok the Tree-Shaper"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Nexus"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Nexus",
		colour = "|cffB0C4DE",
		header = BZ["The Nexus"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Nexus.Anomalus"] = BB["Anomalus"],
			["InstanceLootHeroic.The Nexus.Commander Stoutbeard"] = BB["Commander Stoutbeard"],
			["InstanceLootHeroic.The Nexus.Grand Magus Telestra"] = BB["Grand Magus Telestra"],
			["InstanceLootHeroic.The Nexus.Keristrasza"] = BB["Keristrasza"],
			["InstanceLootHeroic.The Nexus.Ormorok the Tree-Shaper"] = BB["Ormorok the Tree-Shaper"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Oculus"],
		setindex = "InstanceLoot.The Oculus",
		colour = "|cffB0C4DE",
		header = BZ["The Oculus"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Oculus.Drakos the Interrogator"] = BB["Drakos the Interrogator"],
			["InstanceLoot.The Oculus.Ley-Guardian Eregos"] = BB["Ley-Guardian Eregos"],
			["InstanceLoot.The Oculus.Mage-Lord Urom"] = BB["Mage-Lord Urom"],
			["InstanceLoot.The Oculus.Varos Cloudstrider"] = BB["Varos Cloudstrider"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Oculus"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Oculus",
		colour = "|cffB0C4DE",
		header = BZ["The Oculus"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Oculus.Drakos the Interrogator"] = BB["Drakos the Interrogator"],
			["InstanceLootHeroic.The Oculus.Ley-Guardian Eregos"] = BB["Ley-Guardian Eregos"],
			["InstanceLootHeroic.The Oculus.Mage-Lord Urom"] = BB["Mage-Lord Urom"],
			["InstanceLootHeroic.The Oculus.Varos Cloudstrider"] = BB["Varos Cloudstrider"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Violet Hold"],
		setindex = "InstanceLoot.The Violet Hold",
		colour = "|cffB0C4DE",
		header = BZ["The Violet Hold"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Violet Hold.Cyanigosa"] = BB["Cyanigosa"],
			["InstanceLoot.The Violet Hold.Erekem"] = BB["Erekem"],
			["InstanceLoot.The Violet Hold.Ichoron"] = BB["Ichoron"],
			["InstanceLoot.The Violet Hold.Lavanthor"] = BB["Lavanthor"],
			["InstanceLoot.The Violet Hold.Moragg"] = BB["Moragg"],
			["InstanceLoot.The Violet Hold.Xevozz"] = BB["Xevozz"],
			["InstanceLoot.The Violet Hold.Zuramat the Obliterator"] = BB["Zuramat the Obliterator"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Violet Hold"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Violet Hold",
		colour = "|cffB0C4DE",
		header = BZ["The Violet Hold"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Violet Hold.Cyanigosa"] = BB["Cyanigosa"],
			["InstanceLootHeroic.The Violet Hold.Erekem"] = BB["Erekem"],
			["InstanceLootHeroic.The Violet Hold.Ichoron"] = BB["Ichoron"],
			["InstanceLootHeroic.The Violet Hold.Lavanthor"] = BB["Lavanthor"],
			["InstanceLootHeroic.The Violet Hold.Moragg"] = BB["Moragg"],
			["InstanceLootHeroic.The Violet Hold.Xevozz"] = BB["Xevozz"],
			["InstanceLootHeroic.The Violet Hold.Zuramat the Obliterator"] = BB["Zuramat the Obliterator"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Obsidian Sanctum"],
		setindex = "InstanceLoot.The Obsidian Sanctum",
		colour = "|cffB0C4DE",
		header = BZ["The Obsidian Sanctum"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.The Obsidian Sanctum.Sartharion"] = BB["Sartharion"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["The Obsidian Sanctum"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.The Obsidian Sanctum",
		colour = "|cffB0C4DE",
		header = BZ["The Obsidian Sanctum"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.The Obsidian Sanctum.Sartharion"] = BB["Sartharion"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Halls of Lightning"],
		setindex = "InstanceLoot.Halls of Lightning",
		colour = "|cffB0C4DE",
		header = BZ["Halls of Lightning"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Halls of Lightning.General Bjarngrim"] = BB["General Bjarngrim"],
			["InstanceLoot.Halls of Lightning.Ionar"] = BB["Ionar"],
			["InstanceLoot.Halls of Lightning.Loken"] = BB["Loken"],
			["InstanceLoot.Halls of Lightning.Volkhan"] = BB["Volkhan"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Halls of Lightning"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Halls of Lightning",
		colour = "|cffB0C4DE",
		header = BZ["Halls of Lightning"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Halls of Lightning.General Bjarngrim"] = BB["General Bjarngrim"],
			["InstanceLootHeroic.Halls of Lightning.Ionar"] = BB["Ionar"],
			["InstanceLootHeroic.Halls of Lightning.Loken"] = BB["Loken"],
			["InstanceLootHeroic.Halls of Lightning.Volkhan"] = BB["Volkhan"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Halls of Stone"],
		setindex = "InstanceLoot.Halls of Stone",
		colour = "|cffB0C4DE",
		header = BZ["Halls of Stone"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Halls of Stone.Krystallus"] = BB["Krystallus"],
			["InstanceLoot.Halls of Stone.Maiden of Grief"] = BB["Maiden of Grief"],
			["InstanceLoot.Halls of Stone.Sjonnir The Ironshaper"] = BB["Sjonnir The Ironshaper"],
			["InstanceLoot.Halls of Stone.Tribunal Chest"] = BB["The Tribunal of Ages"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Halls of Stone"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Halls of Stone",
		colour = "|cffB0C4DE",
		header = BZ["Halls of Stone"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Halls of Stone.Krystallus"] = BB["Krystallus"],
			["InstanceLootHeroic.Halls of Stone.Maiden of Grief"] = BB["Maiden of Grief"],
			["InstanceLootHeroic.Halls of Stone.Sjonnir The Ironshaper"] = BB["Sjonnir The Ironshaper"],
			["InstanceLootHeroic.Halls of Stone.Tribunal Chest"] = BB["The Tribunal of Ages"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Utgarde Keep"],
		setindex = "InstanceLoot.Utgarde Keep",
		colour = "|cffB0C4DE",
		header = BZ["Utgarde Keep"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Utgarde Keep.Dalronn the Controller"] = BB["Dalronn the Controller"],
			["InstanceLoot.Utgarde Keep.Ingvar the Plunderer"] = BB["Ingvar the Plunderer"],
			["InstanceLoot.Utgarde Keep.Prince Keleseth"] = BB["Prince Keleseth"],
			["InstanceLoot.Utgarde Keep.Skarvald the Constructor"] = BB["Skarvald the Constructor"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Utgarde Keep"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Utgarde Keep",
		colour = "|cffB0C4DE",
		header = BZ["Utgarde Keep"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Utgarde Keep.Dalronn the Controller"] = BB["Dalronn the Controller"],
			["InstanceLootHeroic.Utgarde Keep.Ingvar the Plunderer"] = BB["Ingvar the Plunderer"],
			["InstanceLootHeroic.Utgarde Keep.Prince Keleseth"] = BB["Prince Keleseth"],
			["InstanceLootHeroic.Utgarde Keep.Skarvald the Constructor"] = BB["Skarvald the Constructor"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Utgarde Pinnacle"],
		setindex = "InstanceLoot.Utgarde Pinnacle",
		colour = "|cffB0C4DE",
		header = BZ["Utgarde Pinnacle"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Utgarde Pinnacle.Gortok Palehoof"] = BB["Gortok Palehoof"],
			["InstanceLoot.Utgarde Pinnacle.King Ymiron"] = BB["King Ymiron"],
			["InstanceLoot.Utgarde Pinnacle.Skadi the Ruthless"] = BB["Skadi the Ruthless"],
			["InstanceLoot.Utgarde Pinnacle.Svala Sorrowgrave"] = BB["Svala Sorrowgrave"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Utgarde Pinnacle"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Utgarde Pinnacle",
		colour = "|cffB0C4DE",
		header = BZ["Utgarde Pinnacle"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Utgarde Pinnacle.Gortok Palehoof"] = BB["Gortok Palehoof"],
			["InstanceLootHeroic.Utgarde Pinnacle.King Ymiron"] = BB["King Ymiron"],
			["InstanceLootHeroic.Utgarde Pinnacle.Skadi the Ruthless"] = BB["Skadi the Ruthless"],
			["InstanceLootHeroic.Utgarde Pinnacle.Svala Sorrowgrave"] = BB["Svala Sorrowgrave"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Vault of Archavon"],
		setindex = "InstanceLoot.Vault of Archavon",
		colour = "|cffB0C4DE",
		header = BZ["Vault of Archavon"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLoot.Vault of Archavon.Archavon the Stone Watcher"] = BB["Archavon the Stone Watcher"],
		},
	})

	table.insert(MENDELEEV_SETS, {
		name = BZ["Vault of Archavon"] .. " " .. L["Heroic"],
		setindex = "InstanceLootHeroic.Vault of Archavon",
		colour = "|cffB0C4DE",
		header = BZ["Vault of Archavon"] .. " " .. L["Heroic"],
		useval = showDropRate,
		quality = 3,
		sets = {
			["InstanceLootHeroic.Vault of Archavon.Archavon the Stone Watcher"] = BB["Archavon the Stone Watcher"],
		},
	})
