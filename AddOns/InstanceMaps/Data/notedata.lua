local BB = LibStub("LibBabble-Boss-3.0")
local BBL = BB:GetLookupTable()

InstanceMaps_NotesDB = {
	["Ahn'Qiraj"] = {
		[39606460] = {
			["icon"] = "Square",
			["title"] = "Meritha of the Dream",
		},
		[41908210] = {
			["icon"] = "Skull",
			["title"] = BBL["Princess Huhuran"],
		},
		[90514870] = {
			["icon"] = "Skull",
			["title"] = BBL["Emperor Vek'lor"],
		},
		[71808510] = {
			["icon"] = "Skull",
			["title"] = BBL["Ouro"],
		},
		[74713450] = {
			["icon"] = "Skull",
			["title"] = BBL["Emperor Vek'nilash"],
		},
		[24111210] = {
			["icon"] = "Skull",
			["title"] = BBL["Viscidus"],
		},
		[38206290] = {
			["icon"] = "Square",
			["title"] = "Arygos",
		},
		[23307030] = {
			["icon"] = "Skull",
			["title"] = BBL["Battleguard Sartura"],
		},
		[39706380] = {
			["icon"] = "Square",
			["title"] = "Caelestrasz",
		},
		[31405300] = {
			["icon"] = "Skull",
			["title"] = BBL["Vem"],
		},
		[34606300] = {
			["title"] = BBL["C'Thun"],
			["info"] = "Eye of C'Thun",
			["icon"] = "Skull",
		},
		[32105270] = {
			["icon"] = "Skull",
			["title"] = BBL["Lord Kri"],
		},
		[33005450] = {
			["icon"] = "Skull",
			["title"] = BBL["Princess Yauj"],
		},
		[28406020] = {
			["icon"] = "Square",
			["title"] = "Vethsera",
		},
		[29406010] = {
			["icon"] = "Square",
			["title"] = "Kandrostrasz",
		},
		[16604500] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[21609490] = {
			["icon"] = "Skull",
			["title"] = BBL["Fankriss the Unyielding"],
		},
		[27605850] = {
			["icon"] = "Square",
			["title"] = "Andorgos",
		},
		[22005030] = {
			["icon"] = "Skull",
			["title"] = BBL["The Prophet Skeram"],
		},
	},
	["Armory"] = {
		[5906360] = {
			["title"] = BBL["Herod"],
			["icon"] = "Skull",
		},
	},
	["Auchenai Crypts"] = {
		[36710620] = {
			["icon"] = "Skull",
			["title"] = BBL["Exarch Maladaar"],
		},
		[63309550] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[57010240] = {
			["icon"] = "Skull",
			["title"] = BBL["Shirrak the Dead Watcher"],
		},
	},
	["Blackfathom Deeps"] = {
		[38008040] = {
			["info"] = "Lvl 25 Elite Humanoid",
			["icon"] = "Skull",
			["title"] = BBL["Gelihast"],
		},
		[80613690] = {
			["info"] = "Lvl 27 Elite Humanoid",
			["icon"] = "Skull",
			["title"] = BBL["Twilight Lord Kelris"],
		},
		[26904230] = {
			["info"] = "Lvl 25 Elite Humanoid",
			["icon"] = "Skull",
			["title"] = BBL["Lady Sarevess"],
		},
		[40406990] = {
			["info"] = "Lvl 25 Elite Giant Turtle",
			["icon"] = "Skull",
			["title"] = BBL["Ghamoo-ra"],
		},
		[49707070] = {
			["info2"] = "Linked to the quest 'In search of Thaelrid'",
			["title"] = "Argent Guard Thaelrid",
			["icon"] = "Square",
			["info"] = "Lvl 20 Elite Humanoid",
		},
		[83416080] = {
			["info2"] = "Linked to the quest 'The essence of Aku'mai'",
			["title"] = BBL["Aku'mai"],
			["icon"] = "Skull",
			["info"] = "Lvl 29 Elite Beast",
		},
		[79513150] = {
			["info"] = "Lvl 26 Elite Beast",
			["icon"] = "Skull",
			["title"] = BBL["Old Serra'kis"],
		},
		[71412010] = {
			["info2"] = "Linked to the quest 'Baron Aquanis'",
			["title"] = BBL["Baron Aquanis"],
			["icon"] = "Skull",
			["info"] = "Lvl 28 Elite Elemental",
		},
		[27705710] = {
			["info2"] = "Found in a chest in the water near the central island. Required for 'Knowledge of the Deeps' quest.",
			["title"] = "Lorgalis Manuscript",
			["icon"] = "Circle",
			["info"] = "Quest Item",
		},
		[42608990] = {
			["info"] = "Lvl 26 Elite Humanoid",
			["icon"] = "Skull",
			["title"] = "Lorgus Jett",
		},
		[8904460] = {
			["info2"] = "Dive into the water at temple entrance, under the arch and swim up to dry land inside.",
			["icon"] = "Star",
			["title"] = "Entrance",
		},
	},
	["Blackrock Depths"] = {
		[28706980] = {
			["info2"] = "Rare spawn",
			["info"] = "Lvl 57 Elite Elemental",
			["title"] = BBL["Panzor the Invincible"],
			["icon"] = "Skull",
		},
		[31008960] = {
			["info2"] = "Opposite the entrance can be found the object for the quest 'Attunement to the core'.",
			["info"] = "Entrance to the Molten Core",
			["title"] = "The Molten Core",
			["icon"] = "Star",
		},
		[36708160] = {
			["info2"] = "Calls forth many Flame adds during fight",
			["info"] = "Lvl 57 Elite Humanoid",
			["title"] = BBL["Ambassador Flamelash"],
			["icon"] = "Skull",
		},
		[9408340] = {
			["info2"] = "Linked to the quest 'A royal rescue' to free Princess Moira Bronzebeard",
			["info"] = "Lvl 59 Elite Humanoid",
			["title"] = BBL["Emperor Dagran Thaurissan"],
			["icon"] = "Skull",
		},
		[65109620] = {
			["info2"] = "Linked to the quests 'A shred of hope' and 'Operation: Death to Angerforge'",
			["info"] = "Lvl 57 Elite Humanoid",
			["title"] = BBL["General Angerforge"],
			["icon"] = "Skull",
		},
		[70511650] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Pyromancer Loregrain"],
		},
		[81811070] = {
			["info2"] = "Linked to the quest 'Overmaster Pyron' and 'Disharmony of flame'",
			["info"] = "Lvl 52 Elite Elemental",
			["title"] = "Overmaster Pyron",
			["icon"] = "Skull",
		},
		[66910220] = {
			["info2"] = "Needs to be activated to open the gates to BRD",
			["icon"] = "Circle",
			["title"] = "Shadowforge Lock",
		},
		[87913170] = {
			["info2"] = "Part of the lengthy Onyxia quest chain.",
			["info"] = "Lvl 52 Elite Humanoid",
			["title"] = "Marshal Windsor",
			["icon"] = "Square",
		},
		[88012770] = {
			["title"] = BBL["High Interrogator Gerstahn"],
			["info"] = "Lvl 52 Elite Humanoid",
			["icon"] = "Skull",
		},
		[38208910] = {
			["info2"] = "Drops the hammer for the quest 'Dark Iron Legacy'.",
			["info"] = "Lvl 54 Elite Humanoid",
			["title"] = BBL["Fineous Darkvire"],
			["icon"] = "Skull",
		},
		[81711460] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[51709790] = {
			["icon"] = "Skull",
			["title"] = BBL["Warder Stilgiss"],
		},
		[79912260] = {
			["info2"] = "Linked to the quest 'Kharan Mighthammer'",
			["info"] = "Lvl 53 Elite Humanoid",
			["title"] = "Kharan Mighthammer",
			["icon"] = "Skull",
		},
		[18806330] = {
			["info2"] = "Defeat the 7 dwarves to gain access to the rest of BRD, as well as a chest of goodies.",
			["icon"] = "Skull",
			["title"] = "Summoner's Tomb",
		},
		[59308130] = {
			["info2"] = "Linked to the quest 'A taste of flame'",
			["info"] = "Lvl 57 Elite Giant",
			["title"] = BBL["Bael'Gar"],
			["icon"] = "Skull",
		},
		[51508550] = {
			["info2"] = "Linked to the quest 'A shred of hope' and 'The rise of the machines'",
			["info"] = "Lvl 58 Elite Humanoid",
			["title"] = BBL["Golem Lord Argelmach"],
			["icon"] = "Skull",
		},
		[67510950] = {
			["info2"] = "Defeating the mobs in here will turn the hostile spectators on upper level to neutral.",
			["icon"] = "Circle",
			["title"] = "Ring of Law",
		},
		[44508430] = {
			["icon"] = "Circle",
			["title"] = "The Grim Guzzler",
		},
		[72611700] = {
			["info2"] = "Linked to the quest 'Dark Iron Legacy'.",
			["info"] = "Used to forge the BRD key",
			["title"] = "Franclorn Forgewright Monument",
			["icon"] = "Circle",
		},
		[49809890] = {
			["icon"] = "Circle",
			["title"] = "The Vault",
		},
		[20607440] = {
			["info2"] = "Used to smelt Dark Iron",
			["icon"] = "Circle",
			["title"] = "The Black Forge",
		},
		[44709110] = {
			["info2"] = "Linked to the quest 'Incendius!'. The Black Anvil is also located here.",
			["info"] = "Lvl 56 Elite Humanoid",
			["title"] = BBL["Lord Incendius"],
			["icon"] = "Skull",
		},
		[73111100] = {
			["title"] = BBL["Lord Roccor"],
			["info"] = "Lvl 51 Elite Elemental",
			["icon"] = "Skull",
		},
		[80711930] = {
			["info2"] = "Linked to the quest 'Commander Gor'shak'",
			["info"] = "Lvl 54 Elite Humanoid",
			["title"] = "Commander Gor'shak",
			["icon"] = "Skull",
		},
		[9207410] = {
			["title"] = BBL["Magmus"],
			["info"] = "Lvl 57 Elite Giant",
			["icon"] = "Skull",
		},
		[9306370] = {
			["info2"] = "Fight through fast spawning mobs and pick up 2 torches to light the flames which open the doors to t",
			["icon"] = "Circle",
			["title"] = "The Lyceum",
		},
	},
	["Blackrock Spire"] = {
		[82714390] = {
			["info2"] = "LBRS",
			["info"] = "Spawns after Halycon dies",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Gizrul the Slavener"],
		},
		[60911650] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Highlord Omokk"],
		},
		[63311790] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Spirestone Battle Lord"],
		},
		[87616110] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Quartermaster Zigris"],
		},
		[75713000] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Ghok Bashguud"],
		},
		[51510690] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["General Drakkisath"],
		},
		[38710700] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Square",
			["title"] = "Awbee",
		},
		[11008520] = {
			["title"] = "Portal to Blackwing Lair",
			["titleCol"] = 16727339,
			["icon"] = "Circle",
		},
		[61614100] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Overlord Wyrmthalak"],
		},
		[77715670] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Bannok Grimaxe"],
		},
		[60612010] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Spirestone Butcher"],
		},
		[42609080] = {
			["title"] = "Entrance",
			["titleCol"] = 16727339,
			["icon"] = "Star",
		},
		[63411980] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Spirestone Lord Magus"],
		},
		[37109440] = {
			["info"] = "Requires the Seal of Ascension",
			["titleCol"] = 16727339,
			["icon"] = "Circle",
			["title"] = "Door to Upper Blackrock Spire",
		},
		[78515430] = {
			["info2"] = "LBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Crystal Fang"],
		},
		[31908500] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Goraluk Anvilcrack"],
		},
		[31908250] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Pyroguard Emberseer"],
		},
		[27409570] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Gyth"],
		},
		[42912530] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["The Beast"],
		},
		[68014290] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Shadow Hunter Vosh'gajin"],
		},
		[52412470] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["War Master Voone"],
		},
		[86714450] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Halycon"],
		},
		[31908910] = {
			["info2"] = "UBRS",
			["info"] = "Rare spawn",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Jed Runewatcher"],
		},
		[30609890] = {
			["info"] = "UBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Warchief Rend Blackhand"],
		},
		[75915890] = {
			["info"] = "LBRS",
			["titleCol"] = 16727339,
			["icon"] = "Skull",
			["title"] = BBL["Mother Smolderweb"],
		},
	},
	["Blackwing Lair"] = {
		[18907310] = {
			["icon"] = "Skull",
			["title"] = BBL["Flamegor"],
		},
		[8606270] = {
			["icon"] = "Skull",
			["title"] = BBL["Ebonroc"],
		},
		[62810680] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[66313090] = {
			["icon"] = "Skull",
			["title"] = BBL["Nefarian"],
		},
		[33007950] = {
			["icon"] = "Skull",
			["title"] = BBL["Firemaw"],
		},
		[29007540] = {
			["icon"] = "Skull",
			["title"] = BBL["Vaelastrasz the Corrupt"],
		},
		[34008440] = {
			["icon"] = "Skull",
			["title"] = BBL["Chromaggus"],
		},
		[48509690] = {
			["icon"] = "Skull",
			["title"] = BBL["Razorgore the Untamed"],
		},
		[39208600] = {
			["icon"] = "Skull",
			["title"] = BBL["Broodlord Lashlayer"],
		},
	},
	["Black Temple"] = {
		[39109910] = {
			["title"] = BBL["Shade of Akama"],
			["icon"] = "Skull",
		},
		[23808830] = {
			["title"] = BBL["Illidan Stormrage"],
			["icon"] = "Skull",
		},
		[31209100] = {
			["title"] = BBL["Teron Gorefiend"],
			["icon"] = "Skull",
		},
		[4407640] = {
			["title"] = BBL["Mother Shahraz"],
			["icon"] = "Skull",
		},
		[41408560] = {
			["title"] = BBL["High Warlord Naj'entus"],
			["icon"] = "Skull",
		},
		[21707820] = {
			["title"] = BBL["Supremus"],
			["icon"] = "Skull",
		},
		[25809300] = {
			["title"] = BBL["Illidari Council"],
			["icon"] = "Skull",
		},
		[7007340] = {
			["title"] = BBL["Gurtogg Bloodboil"],
			["icon"] = "Skull",
		},
		[34610800] = {
			["title"] = BBL["Reliquary of Souls"],
			["icon"] = "Skull",
		},
	},
	["Cathedral"] = {
		[15006710] = {
			["title"] = BBL["High Inquisitor Fairbanks"],
			["icon"] = "Skull",
		},
		[5605100] = {
			["title"] = BBL["Scarlet Commander Mograine"],
			["icon"] = "Skull",
		},
		[5605300] = {
			["title"] = BBL["High Inquisitor Whitemane"],
			["icon"] = "Skull",
		},
	},
	["Dire Maul"] = {
		[53710690] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[28905880] = {
			["title"] = BBL["Captain Kromcrush"],
			["icon"] = "Skull",
		},
		[43109600] = {
			["title"] = BBL["Guard Fengus"],
			["icon"] = "Skull",
		},
		[53212740] = {
			["title"] = BBL["Isalien"],
			["icon"] = "Skull",
		},
		[63709090] = {
			["title"] = BBL["Tsu'zee"],
			["icon"] = "Skull",
		},
		[76110240] = {
			["title"] = BBL["Magister Kalendris"],
			["icon"] = "Skull",
		},
		[62608690] = {
			["title"] = BBL["Prince Tortheldrin"],
			["icon"] = "Skull",
		},
		[75412070] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[77614930] = {
			["title"] = BBL["Lethtendris"],
			["icon"] = "Skull",
		},
		[71010210] = {
			["title"] = BBL["Tendris Warpwood"],
			["icon"] = "Skull",
		},
		[53412610] = {
			["title"] = BBL["Alzzin the Wildshaper"],
			["icon"] = "Skull",
		},
		[45108560] = {
			["title"] = BBL["Guard Mol'dar"],
			["icon"] = "Skull",
		},
		[85815360] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[68112810] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[74108870] = {
			["title"] = BBL["Immol'thar"],
			["icon"] = "Skull",
		},
		[14104420] = {
			["title"] = BBL["King Gordok"],
			["icon"] = "Skull",
		},
		[37208520] = {
			["title"] = BBL["Stomper Kreeg"],
			["icon"] = "Skull",
		},
		[78210500] = {
			["title"] = BBL["Illyanna Ravenoak"],
			["icon"] = "Skull",
		},
		[31605870] = {
			["title"] = BBL["Guard Slip'kik"],
			["icon"] = "Skull",
		},
		[72314640] = {
			["title"] = BBL["Zevrim Thornhoof"],
			["icon"] = "Skull",
		},
		[74809100] = {
			["title"] = BBL["Lord Hel'nurath"],
			["icon"] = "Skull",
		},
		[71814420] = {
			["title"] = BBL["Hydrospawn"],
			["icon"] = "Skull",
		},
		[70815580] = {
			["title"] = BBL["Pusillin"],
			["icon"] = "Skull",
		},
		[69911510] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[12504110] = {
			["title"] = BBL["Cho'Rush the Observer"],
			["icon"] = "Skull",
		},
		[77615080] = {
			["title"] = BBL["Pimgib"],
			["icon"] = "Skull",
		},
	},
	["Gnomeregan"] = {
		[40709840] = {
			["icon"] = "Circle",
			["title"] = "Clean Zone",
		},
		[75812190] = {
			["icon"] = "Square",
			["title"] = "Matrix Punchograph 3005-D",
		},
		[43910430] = {
			["icon"] = "Square",
			["title"] = "Matrix Punchograph 3005-B",
		},
		[41012310] = {
			["icon"] = "Skull",
			["title"] = BBL["Grubbis"],
		},
		[78012260] = {
			["icon"] = "Skull",
			["title"] = BBL["Crowd Pummeler 9-60"],
		},
		[1806540] = {
			["icon"] = "Star",
			["title"] = "Front Entrance",
		},
		[55307260] = {
			["info"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Dark Iron Ambassador"],
		},
		[58013290] = {
			["icon"] = "Star",
			["title"] = "Back Entrance",
		},
		[29709420] = {
			["info"] = "Lower level",
			["icon"] = "Skull",
			["title"] = BBL["Viscous Fallout"],
		},
		[41706110] = {
			["icon"] = "Skull",
			["title"] = BBL["Mekgineer Thermaplugg"],
		},
		[43207580] = {
			["icon"] = "Skull",
			["title"] = BBL["Electrocutioner 6000"],
		},
		[44307510] = {
			["icon"] = "Square",
			["title"] = "Matrix Punchograph 3005-C",
		},
	},
	["Graveyard"] = {
		[53812310] = {
			["title"] = BBL["Interrogator Vishas"],
			["icon"] = "Skull",
		},
		[43607720] = {
			["title"] = BBL["Azshir the Sleepless"],
			["icon"] = "Skull",
		},
		[43607980] = {
			["title"] = BBL["Fallen Champion"],
			["icon"] = "Skull",
		},
		[53907960] = {
			["title"] = BBL["Bloodmage Thalnos"],
			["icon"] = "Skull",
		},
		[43508240] = {
			["title"] = BBL["Ironspine"],
			["icon"] = "Skull",
		},
	},
	["Gruul's Lair"] = {
		[17903140] = {
			["icon"] = "Skull",
			["title"] = BBL["Gruul the Dragonkiller"],
		},
		[42708670] = {
			["icon"] = "Skull",
			["title"] = BBL["High King Maulgar"],
		},
	},
	["Hellfire Peninsula"] = {
		[15407880] = {
			["icon"] = "Skull",
			["title"] = BBL["Doom Lord Kazzak"],
		},
	},
	["Hellfire Ramparts"] = {
		[26608500] = {
			["icon"] = "Skull",
			["title"] = BBL["Watchkeeper Gargolmar"],
		},
		[20605960] = {
			["icon"] = "Skull",
			["title"] = BBL["Omor the Unscarred"],
		},
		[60009580] = {
			["icon"] = "Skull",
			["title"] = BBL["Vazruden"],
		},
		[61809970] = {
			["icon"] = "Skull",
			["title"] = BBL["Nazan"],
		},
	},
	["Karazhan"] = {
		[84811440] = {
			["title"] = BBL["Shade of Aran"],
			["icon"] = "Skull",
		},
		[21104750] = {
			["title"] = BBL["Attumen the Huntsman"],
			["icon"] = "Skull",
		},
		[18108730] = {
			["title"] = BBL["Moroes"],
			["icon"] = "Skull",
		},
		[19708290] = {
			["title"] = BBL["The Crone"],
			["icon"] = "Skull",
		},
		[18608100] = {
			["title"] = BBL["Romulo"],
			["icon"] = "Skull",
		},
		[21408540] = {
			["title"] = BBL["The Big Bad Wolf"],
			["icon"] = "Skull",
		},
		[17107860] = {
			["title"] = BBL["Julianne"],
			["icon"] = "Skull",
		},
		[5107920] = {
			["title"] = BBL["Maiden of Virtue"],
			["icon"] = "Skull",
		},
		[69213700] = {
			["title"] = BBL["Prince Malchezaar"],
			["icon"] = "Skull",
		},
		[72309770] = {
			["title"] = BBL["The Curator"],
			["icon"] = "Skull",
		},
		[18209370] = {
			["title"] = BBL["Nightbane"],
			["icon"] = "Skull",
		},
		[85115150] = {
			["title"] = BBL["Netherspite"],
			["icon"] = "Skull",
		},
		[76611020] = {
			["title"] = BBL["Terestian Illhoof"],
			["icon"] = "Skull",
		},
		[72314490] = {
			["title"] = BBL["Chess Event"],
			["icon"] = "Skull",
		},
	},
	["Library"] = {
		[74711230] = {
			["title"] = BBL["Houndmaster Loksey"],
			["icon"] = "Skull",
		},
		[65615130] = {
			["title"] = BBL["Arcanist Doan"],
			["icon"] = "Skull",
		},
	},
	["Magtheridon's Lair"] = {
		[59010470] = {
			["title"] = BBL["Magtheridon"],
			["icon"] = "Skull",
		},
		[11804120] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
	},
	["Magisters' Terrace"] = {
		[14205240] = {
			["title"] = BBL["Selin Fireheart"],
			["icon"] = "Skull",
		},
		[39504520] = {
			["title"] = BBL["Kael'thas Sunstrider"],
			["icon"] = "Skull",
		},
		[45008000] = {
			["title"] = BBL["Priestess Delrissa"],
			["icon"] = "Skull",
		},
		[15707080] = {
			["title"] = "Tyrith",
			["info"] = "Bloodelf Spy",
			["icon"] = "Square",
		},
		[17509080] = {
			["title"] = BBL["Vexallus"],
			["icon"] = "Skull",
		},
	},
	["Mana-Tombs"] = {
		[28607260] = {
			["title"] = BBL["Pandemonius"],
			["icon"] = "Skull",
		},
		[3102690] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[75413210] = {
			["title"] = BBL["Tavarok"],
			["icon"] = "Skull",
		},
		[52908050] = {
			["title"] = BBL["Nexus-Prince Shaffar"],
			["icon"] = "Skull",
		},
	},
	["Maraudon"] = {
		[58610390] = {
			["icon"] = "Skull",
			["title"] = BBL["Landslide"],
		},
		[32306510] = {
			["icon"] = "Skull",
			["title"] = BBL["Celebras the Cursed"],
		},
		[82312770] = {
			["icon"] = "Skull",
			["title"] = BBL["Rotgrip"],
		},
		[32107850] = {
			["icon"] = "Skull",
			["title"] = BBL["Lord Vyletongue"],
		},
		[28809010] = {
			["title"] = "Maraudos",
			["info"] = "The Fourth Khan",
			["icon"] = "Square",
		},
		[72412370] = {
			["icon"] = "Skull",
			["title"] = BBL["Tinkerer Gizlock"],
		},
		[8806010] = {
			["title"] = "Veng",
			["info"] = "The Fifth Khan",
			["icon"] = "Square",
		},
		[14705170] = {
			["icon"] = "Skull",
			["title"] = BBL["Razorlash"],
		},
		[80611460] = {
			["icon"] = "Skull",
			["title"] = BBL["Princess Theradras"],
		},
		[3805010] = {
			["icon"] = "Skull",
			["title"] = BBL["Noxxion"],
		},
		[12707040] = {
			["icon"] = "Star",
			["title"] = "Entrance (Orange)",
		},
		[32810600] = {
			["icon"] = "Star",
			["title"] = "Entrance (Purple)",
		},
		[54609020] = {
			["icon"] = "Star",
			["title"] = "Entrance (Portal)",
		},
		[30507110] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Meshlok the Harvester"],
		},
	},
	["Molten Core"] = {
		[53310710] = {
			["icon"] = "Skull",
			["title"] = BBL["Ragnaros"],
		},
		[21908930] = {
			["icon"] = "Skull",
			["title"] = BBL["Magmadar"],
		},
		[62314230] = {
			["icon"] = "Skull",
			["title"] = BBL["Majordomo Executus"],
		},
		[79415870] = {
			["icon"] = "Skull",
			["title"] = BBL["Sulfuron Harbinger"],
		},
		[72612380] = {
			["icon"] = "Skull",
			["title"] = BBL["Baron Geddon"],
		},
		[58512370] = {
			["icon"] = "Skull",
			["title"] = BBL["Golemagg the Incinerator"],
		},
		[70310140] = {
			["icon"] = "Skull",
			["title"] = BBL["Garr"],
		},
		[80413400] = {
			["icon"] = "Skull",
			["title"] = BBL["Shazzrah"],
		},
		[9702800] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[39810200] = {
			["icon"] = "Skull",
			["title"] = BBL["Lucifron"],
		},
		[47308140] = {
			["icon"] = "Skull",
			["title"] = BBL["Gehennas"],
		},
	},
	["Naxxramas"] = {
		[86210930] = {
			["title"] = "Sir Zeliek",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
		[54313280] = {
			["title"] = "Loatheb",
			["info"] = "Necro Wing",
			["icon"] = "Skull",
		},
		[46209410] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[88411000] = {
			["title"] = "Highlord Mograine",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
		[84110580] = {
			["title"] = "Thane Korth'azz",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
		[18007610] = {
			["title"] = "Grand Widow Faerlina",
			["info"] = "Spider Wing",
			["icon"] = "Skull",
		},
		[23705620] = {
			["title"] = "Gluth",
			["info"] = "Abomination Wing",
			["icon"] = "Skull",
		},
		[65509520] = {
			["title"] = "Instructor Razuvious",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
		[12710360] = {
			["title"] = "Sapphiron",
			["info"] = "Frostwyrm Lair",
			["icon"] = "Skull",
		},
		[37706950] = {
			["title"] = "Patchwerk",
			["info"] = "Abomination Wing",
			["icon"] = "Skull",
		},
		[72812420] = {
			["title"] = "Noth the Plaguebringer",
			["info"] = "Necro Wing",
			["icon"] = "Skull",
		},
		[28907010] = {
			["title"] = "Grobbulus",
			["info"] = "Abomination Wing",
			["icon"] = "Skull",
		},
		[4707800] = {
			["title"] = "Maexxna",
			["info"] = "Spider Wing",
			["icon"] = "Skull",
		},
		[65612800] = {
			["title"] = "Heigan the Unclean",
			["info"] = "Necro Wing",
			["icon"] = "Skull",
		},
		[22407260] = {
			["title"] = "Anub'Rekhan",
			["info"] = "Spider Wing",
			["icon"] = "Skull",
		},
		[9410020] = {
			["title"] = "Kel'Thuzad",
			["info"] = "Frostwyrm Lair",
			["icon"] = "Skull",
		},
		[74611860] = {
			["title"] = "Gothik the Harvester",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
		[7802990] = {
			["title"] = "Thaddius",
			["info"] = "Abomination Wing",
			["icon"] = "Skull",
		},
		[86410660] = {
			["title"] = "Lady Blaumeux",
			["info"] = "Deathknight Wing",
			["icon"] = "Skull",
		},
	},
	["Old Hillsbrad Foothills"] = {
		[34009100] = {
			["title"] = BBL["Epoch Hunter"],
			["icon"] = "Skull",
		},
		[49412050] = {
			["title"] = BBL["Lieutenant Drake"],
			["icon"] = "Skull",
		},
		[52811960] = {
			["title"] = BBL["Captain Skarloc"],
			["icon"] = "Skull",
		},
	},
	["Onyxia's Lair"] = {
		[14402740] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[66811800] = {
			["icon"] = "Circle",
			["title"] = "Onyxian Warder",
		},
		[53508540] = {
			["icon"] = "Circle",
			["title"] = "Onyxian Warder",
		},
		[35707630] = {
			["icon"] = "Circle",
			["title"] = "Whelp Eggs",
		},
		[36309940] = {
			["icon"] = "Circle",
			["title"] = "Whelp Eggs",
		},
		[33706150] = {
			["icon"] = "Circle",
			["title"] = "Onyxian Warder",
		},
		[24707670] = {
			["icon"] = "Skull",
			["title"] = BBL["Onyxia"],
		},
		[78413290] = {
			["icon"] = "Circle",
			["title"] = "Onyxian Warder",
		},
		[49610860] = {
			["icon"] = "Circle",
			["title"] = "Whelp Eggs",
		},
		[49809460] = {
			["icon"] = "Circle",
			["title"] = "Whelp Eggs",
		},
	},
	["Ragefire Chasm"] = {
		[84011360] = {
			["icon"] = "Skull",
			["title"] = BBL["Jergosh the Invoker"],
		},
		[19207120] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[88712540] = {
			["icon"] = "Skull",
			["title"] = BBL["Bazzalan"],
		},
		[62809840] = {
			["icon"] = "Skull",
			["title"] = BBL["Taragaman the Hungerer"],
		},
		[58411390] = {
			["title"] = "Maur Grimtotem",
			["icon"] = "Triangle",
		},
	},
	["Razorfen Downs"] = {
		[12707550] = {
			["info2"] = "Teaches recipes for Goldthorn Tea & Mighty Troll's Blood Potion",
			["title"] = "Henry Stern",
			["icon"] = "Square",
			["info"] = "Lvl 36 Humanoid",
		},
		[53408100] = {
			["icon"] = "Skull",
			["title"] = BBL["Amnennar the Coldbringer"],
		},
		[9302020] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[25506770] = {
			["icon"] = "Skull",
			["title"] = BBL["Tuten'kash"],
		},
		[62909570] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Ragglesnout"],
		},
		[38411000] = {
			["icon"] = "Skull",
			["title"] = BBL["Mordresh Fire Eye"],
		},
		[60507660] = {
			["icon"] = "Skull",
			["title"] = BBL["Glutton"],
		},
	},
	["Razorfen Kraul"] = {
		[49812270] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[18409440] = {
			["icon"] = "Skull",
			["title"] = "Aggem Thorncurse",
		},
		[47108340] = {
			["icon"] = "Square",
			["title"] = "Willix the Importer",
		},
		[26309140] = {
			["icon"] = "Skull",
			["title"] = "Roogug",
		},
		[32908960] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Earthcaller Halmgar"],
		},
		[5708020] = {
			["icon"] = "Skull",
			["title"] = BBL["Death Speaker Jargba"],
		},
		[17907120] = {
			["icon"] = "Skull",
			["title"] = BBL["Overlord Ramtusk"],
		},
		[65608980] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Blind Hunter"],
		},
		[55608520] = {
			["icon"] = "Skull",
			["title"] = BBL["Charlga Razorflank"],
		},
		[91412860] = {
			["icon"] = "Skull",
			["title"] = BBL["Agathelos the Raging"],
		},
	},
	["Ruins of Ahn'Qiraj"] = {
		[65611250] = {
			["icon"] = "Skull",
			["title"] = BBL["General Rajaxx"],
		},
		[24908480] = {
			["icon"] = "Skull",
			["title"] = BBL["Moam"],
		},
		[64812370] = {
			["info2"] = "Level ?? Elite Boss",
			["icon"] = "Skull",
			["title"] = BBL["Kurinnaxx"],
		},
		[75609500] = {
			["icon"] = "Skull",
			["title"] = BBL["Ayamiss the Hunter"],
		},
		[86712890] = {
			["icon"] = "Skull",
			["title"] = BBL["Buru the Gorger"],
		},
		[72014810] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[38807020] = {
			["icon"] = "Skull",
			["title"] = BBL["Ossirian the Unscarred"],
		},
	},
	["Scholomance"] = {
		[38607490] = {
			["icon"] = "Circle",
			["title"] = "Secret Chest",
		},
		[23906200] = {
			["icon"] = "Circle",
			["title"] = "Torch Lever",
		},
		[74910750] = {
			["icon"] = "Square",
			["title"] = "Deed to Brill",
		},
		[82911270] = {
			["icon"] = "Skull",
			["title"] = BBL["Ras Frostwhisper"],
		},
		[43007870] = {
			["icon"] = "Skull",
			["title"] = BBL["Vectus"],
		},
		[26507650] = {
			["icon"] = "Skull",
			["title"] = BBL["Blood Steward of Kirtonos"],
		},
		[45907240] = {
			["icon"] = "Skull",
			["title"] = BBL["Rattlegore"],
		},
		[35810450] = {
			["icon"] = "Square",
			["title"] = "Deed to Caer Darrow",
		},
		[43007720] = {
			["icon"] = "Skull",
			["title"] = BBL["Marduk Blackpool"],
		},
		[57510990] = {
			["icon"] = "Skull",
			["title"] = BBL["Instructor Malicia"],
		},
		[13106700] = {
			["icon"] = "Skull",
			["title"] = BBL["Lady Illucia Barov"],
		},
		[27708500] = {
			["icon"] = "Square",
			["title"] = "Deed to Tarren Mill",
		},
		[13706930] = {
			["icon"] = "Skull",
			["title"] = BBL["Lorekeeper Polkelt"],
		},
		[31606460] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[36709120] = {
			["icon"] = "Skull",
			["title"] = BBL["Darkmaster Gandling"],
		},
		[69109590] = {
			["icon"] = "Circle",
			["title"] = "Alchemy Lab",
		},
		[57611320] = {
			["icon"] = "Skull",
			["title"] = BBL["The Ravenian"],
		},
		[32610150] = {
			["icon"] = "Skull",
			["title"] = BBL["Doctor Theolen Krastinov"],
		},
		[2904180] = {
			["icon"] = "Skull",
			["title"] = BBL["Kirtonos the Herald"],
		},
		[14505420] = {
			["icon"] = "Skull",
			["title"] = BBL["Jandice Barov"],
		},
		[25407770] = {
			["icon"] = "Square",
			["title"] = "Deed to Southshore",
		},
		[39110820] = {
			["icon"] = "Skull",
			["title"] = BBL["Lord Alexei Barov"],
		},
	},
	["Serpentshrine Cavern"] = {
		[50006670] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[77311710] = {
			["icon"] = "Skull",
			["title"] = BBL["Hydross the Unstable"],
		},
		[19106390] = {
			["icon"] = "Skull",
			["title"] = BBL["Leotheras the Blind"],
		},
		[22408490] = {
			["icon"] = "Skull",
			["title"] = BBL["Morogrim Tidewalker"],
		},
		[52412730] = {
			["icon"] = "Skull",
			["title"] = BBL["Lady Vashj"],
		},
		[11406310] = {
			["icon"] = "Skull",
			["title"] = BBL["Fathom-Lord Karathress"],
		},
		[51209440] = {
			["icon"] = "Skull",
			["title"] = BBL["The Lurker Below"],
		},
	},
	["Sethekk Halls"] = {
		[62311000] = {
			["icon"] = "Skull",
			["title"] = BBL["Darkweaver Syth"],
		},
		[47412400] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[24405700] = {
			["icon"] = "Skull",
			["title"] = BBL["Talon King Ikiss"],
		},
		[51408400] = {
			["icon"] = "Skull",
			["title"] = BBL["Anzu"],
			["info2"] = "Summoned Boss",
		},
	},
	["Shadow Labyrinth"] = {
		[36006060] = {
			["icon"] = "Skull",
			["title"] = BBL["Ambassador Hellmaw"],
		},
		[35911030] = {
			["icon"] = "Skull",
			["title"] = BBL["Murmur"],
		},
		[2602440] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[50210220] = {
			["icon"] = "Skull",
			["title"] = BBL["Grandmaster Vorpil"],
		},
		[62009150] = {
			["icon"] = "Skull",
			["title"] = BBL["Blackheart the Inciter"],
		},
	},
	["Shadowfang Keep"] = {
		[64013480] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[73510710] = {
			["icon"] = "Skull",
			["title"] = BBL["Razorclaw the Butcher"],
		},
		[75611610] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Deathsworn Captain"],
		},
		[75711830] = {
			["icon"] = "Square",
			["title"] = "Deathstalker Adamant",
		},
		[12806030] = {
			["icon"] = "Skull",
			["title"] = BBL["Archmage Arugal"],
		},
		[77911840] = {
			["icon"] = "Skull",
			["title"] = "Rethilgore",
		},
		[29107780] = {
			["icon"] = "Skull",
			["title"] = BBL["Wolf Master Nandos"],
		},
		[86111960] = {
			["icon"] = "Skull",
			["title"] = BBL["Baron Silverlaine"],
		},
		[73311220] = {
			["icon"] = "Skull",
			["title"] = BBL["Commander Springvale"],
		},
		[76211530] = {
			["icon"] = "Skull",
			["title"] = BBL["Odo the Blindwatcher"],
		},
		[79912280] = {
			["icon"] = "Square",
			["title"] = "Sorcerer Ashcrombe",
		},
		[32108070] = {
			["icon"] = "Skull",
			["title"] = BBL["Fenrus the Devourer"],
		},
	},
	["Shadowmoon Valley"] = {
		[44111490] = {
			["icon"] = "Skull",
			["title"] = BBL["Doomwalker"],
		},
	},
	["Stratholme"] = {
		[36510410] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Stonespine"],
		},
		[65911450] = {
			["icon"] = "Circle",
			["title"] = "King's Square Postbox",
		},
		[17308480] = {
			["icon"] = "Skull",
			["title"] = BBL["Maleki the Pallid"],
		},
		[74711770] = {
			["icon"] = "Circle",
			["title"] = "Fras Siabi's Postbox",
		},
		[74311940] = {
			["icon"] = "Skull",
			["title"] ="Stratholme Courier",
		},
		[52409490] = {
			["icon"] = "Circle",
			["title"] = "Market Row Postbox",
		},
		[34510770] = {
			["icon"] = "Skull",
			["title"] = BBL["Baroness Anastari"],
		},
		[60813080] = {
			["icon"] = "Square",
			["title"] = "Aurius",
		},
		[63913310] = {
			["icon"] = "Circle",
			["title"] = "Elders' Square Postbox",
		},
		[71611520] = {
			["icon"] = "Skull",
			["title"] = BBL["Fras Siabi"],
		},
		[48110250] = {
			["icon"] = "Skull",
			["title"] = BBL["The Unforgiven"],
		},
		[54608810] = {
			["icon"] = "Circle",
			["title"] = "Crusaders' Square Postbox",
		},
		[11807220] = {
			["icon"] = "Skull",
			["title"] = BBL["Magistrate Barthilas"],
		},
		[53209090] = {
			["icon"] = "Skull",
			["title"] = BBL["Timmy the Cruel"],
		},
		[14906120] = {
			["icon"] = "Skull",
			["title"] = BBL["Baron Rivendare"],
		},
		[71311670] = {
			["info2"] = "Rare spawn - Wanders",
			["icon"] = "Skull",
			["title"] = BBL["Skul"],
		},
		[77610520] = {
			["icon"] = "Skull",
			["title"] = BBL["Archivist Galford"],
		},
		[82210670] = {
			["icon"] = "Skull",
			["title"] = BBL["Balnazzar"],
		},
		[67713440] = {
			["icon"] = "Star",
			["title"] = "Service Entrance",
		},
		[50810000] = {
			["info"] = "Rare spawn - location varies",
			["icon"] = "Skull",
			["title"] = BBL["Hearthsinger Forresten"],
		},
		[76512960] = {
			["icon"] = "Star",
			["title"] = "Front Entrance",
		},
		[52110450] = {
			["icon"] = "Circle",
			["title"] = "Festival Lane Postbox",
		},
		[67608500] = {
			["icon"] = "Skull",
			["title"] = BBL["Cannon Master Willey"],
		},
		[13906550] = {
			["icon"] = "Skull",
			["title"] = BBL["Ramstein the Gorger"],
		},
		[33909400] = {
			["icon"] = "Skull",
			["title"] = BBL["Nerub'enkan"],
		},
	},
	["The Arcatraz"] = {
		[65210150] = {
			["icon"] = "Skull",
			["title"] = BBL["Dalliah the Doomsayer"],
		},
		[89413210] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[15407820] = {
			["icon"] = "Skull",
			["title"] = BBL["Harbinger Skyriss"],
		},
		[41910030] = {
			["icon"] = "Skull",
			["title"] = BBL["Zereketh the Unbound"],
		},
		[65709110] = {
			["icon"] = "Skull",
			["title"] = BBL["Wrath-Scryer Soccothrates"],
		},
	},
	["Hyjal Summit"] = {
		[53707840] = {
			["title"] = BBL["Rage Winterchill"],
			["icon"] = "Skull",
		},
		[54308020] = {
			["title"] = BBL["Anetheron"],
			["icon"] = "Skull",
		},
		[30607970] = {
			["title"] = BBL["Kaz'rogal"],
			["icon"] = "Skull",
		},
		[32908140] = {
			["title"] = BBL["Azgalor"],
			["icon"] = "Skull",
		},
		[29709920] = {
			["title"] = BBL["Archimonde"],
			["icon"] = "Skull",
		},
	},
	["The Black Morass"] = {
		[53808980] = {
			["title"] = BBL["Temporus"],
			["icon"] = "Skull",
		},
		[47308360] = {
			["title"] = BBL["Chrono Lord Deja"],
			["icon"] = "Skull",
		},
		[60409650] = {
			["title"] = BBL["Aeonus"],
			["icon"] = "Skull",
		},
	},
	["The Blood Furnace"] = {
		[15905750] = {
			["icon"] = "Skull",
			["title"] = BBL["Broggok"],
		},
		[36706680] = {
			["icon"] = "Skull",
			["title"] = BBL["The Maker"],
		},
		[35808830] = {
			["icon"] = "Skull",
			["title"] = BBL["Keli'dan the Breaker"],
		},
		[89613160] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
	},
	["The Botanica"] = {
		[23706110] = {
			["title"] = BBL["Commander Sarannis"],
			["icon"] = "Skull",
		},
		[43704810] = {
			["title"] = BBL["Thorngrin the Tender"],
			["icon"] = "Skull",
		},
		[80410980] = {
			["title"] = BBL["Laj"],
			["icon"] = "Skull",
		},
		[24904790] = {
			["title"] = BBL["High Botanist Freywinn"],
			["icon"] = "Skull",
		},
		[34006340] = {
			["title"] = BBL["Warp Splinter"],
			["icon"] = "Skull",
		},
	},
	["The Deadmines"] = {
		[33712850] = {
			["icon"] = "Skull",
			["title"] = BBL["Captain Greenskin"],
		},
		[27011870] = {
			["icon"] = "Skull",
			["title"] = BBL["Mr. Smite"],
		},
		[26412410] = {
			["icon"] = "Star",
			["title"] = "Exit",
		},
		[59209980] = {
			["icon"] = "Skull",
			["title"] = BBL["Rhahk'Zor"],
		},
		[33610440] = {
			["icon"] = "Circle",
			["title"] = "Defias Gunpowder",
		},
		[30512350] = {
			["icon"] = "Skull",
			["title"] = BBL["Edwin VanCleef"],
		},
		[85813630] = {
			["icon"] = "Skull",
			["title"] = BBL["Sneed"],
		},
		[23707300] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Miner Johnson"],
		},
		[29612510] = {
			["icon"] = "Skull",
			["title"] = BBL["Cookie"],
		},
		[2504230] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[57012170] = {
			["icon"] = "Skull",
			["title"] = BBL["Gilnid"],
		},
	},
	["The Eye"] = {
		[50510000] = {
			["title"] = BBL["Al'ar"],
			["icon"] = "Skull",
		},
		[43206810] = {
			["title"] = BBL["Void Reaver"],
			["icon"] = "Skull",
		},
		[42211680] = {
			["title"] = BBL["High Astromancer Solarian"],
			["icon"] = "Skull",
		},
		[8405770] = {
			["title"] = BBL["Kael'thas Sunstrider"],
			["icon"] = "Skull",
		},
	},
	["The Mechanar"] = {
		[41607280] = {
			["title"] = BBL["Pathaleon the Calculator"],
			["icon"] = "Skull",
		},
		[28507500] = {
			["title"] = BBL["Mechano-Lord Capacitus"],
			["icon"] = "Skull",
		},
		[5104850] = {
			["title"] = BBL["Nethermancer Sepethrea"],
			["icon"] = "Skull",
		},
	},
	["The Shattered Halls"] = {
		[56311940] = {
			["icon"] = "Skull",
			["title"] = BBL["Warchief Kargath Bladefist"],
		},
		[33008120] = {
			["icon"] = "Skull",
			["title"] = BBL["Warbringer O'mrogg"],
		},
		[94614910] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[63708840] = {
			["icon"] = "Skull",
			["title"] = BBL["Grand Warlock Nethekurse"],
		},
		[11903250] = {
			["icon"] = "Skull",
			["title"] = BBL["Blood Guard Porung"],
			["info"] = "Heroic Mode Only Boss",
		},
	},
	["The Slave Pens"] = {
		[36209020] = {
			["icon"] = "Skull",
			["title"] = BBL["Rokmar the Crackler"],
		},
		[20906670] = {
			["icon"] = "Skull",
			["title"] = BBL["Mennu the Betrayer"],
		},
		[81415680] = {
			["icon"] = "Skull",
			["title"] = BBL["Quagmirran"],
		},
		[11803410] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
	},
	["The Steamvault"] = {
		[81010850] = {
			["icon"] = "Skull",
			["title"] = BBL["Mekgineer Steamrigger"],
		},
		[30203920] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[40211820] = {
			["icon"] = "Skull",
			["title"] = BBL["Warlord Kalithresh"],
		},
		[9105620] = {
			["icon"] = "Skull",
			["title"] = BBL["Hydromancer Thespia"],
		},
	},
	["The Stockade"] = {
		[34610730] = {
			["icon"] = "Skull",
			["title"] = BBL["Hamhock"],
		},
		[34006150] = {
			["info2"] = "Rare spawn",
			["icon"] = "Skull",
			["title"] = BBL["Bruegal Ironknuckle"],
		},
		[11905850] = {
			["icon"] = "Skull",
			["title"] = BBL["Targorr the Dread"],
		},
		[17708120] = {
			["icon"] = "Skull",
			["title"] = BBL["Kam Deepfury"],
		},
		[42212330] = {
			["icon"] = "Skull",
			["title"] = BBL["Bazil Thredd"],
		},
		[48709500] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[10602220] = {
			["icon"] = "Skull",
			["title"] = BBL["Dextren Ward"],
		},
	},
	["The Temple of Atal'Hakkar"] = {
		[45010160] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[33708590] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[84913460] = {
			["icon"] = "Skull",
			["title"] = BBL["Hazzas"],
		},
		[44906890] = {
			["icon"] = "Skull",
			["title"] = BBL["Avatar of Hakkar"],
		},
		[33707750] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[49309260] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 3",
			["title"] = "Statue (South-West)",
		},
		[41908980] = {
			["info"] = "Lower level",
			["icon"] = "Skull",
			["title"] = BBL["Atal'alarion"],
		},
		[83314660] = {
			["info"] = "Cannot be attacked until Jammal'an has been killed",
			["icon"] = "Skull",
			["title"] = BBL["Shade of Eranikus"],
		},
		[82713060] = {
			["icon"] = "Skull",
			["title"] = BBL["Morphaz"],
		},
		[10705840] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[37711100] = {
			["icon"] = "Skull",
			["title"] = BBL["Ogom the Wretched"],
		},
		[51710640] = {
			["info"] = "Spawns after Jammal'an dies",
			["icon"] = "Skull",
			["title"] = BBL["Weaver"],
		},
		[53310130] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 1",
			["title"] = "Statue (South)",
		},
		[49210460] = {
			["info"] = "Spawns after Jammal'an dies",
			["icon"] = "Skull",
			["title"] = BBL["Dreamscythe"],
		},
		[56210810] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[78614530] = {
			["icon"] = "Circle",
			["title"] = "Essence Font",
		},
		[45208470] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[44509250] = {
			["info"] = "Lower level",
			["icon"] = "Circle",
			["title"] = "Altar of Hakkar",
		},
		[41008460] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 5",
			["title"] = "Statue (North-West)",
		},
		[56009970] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "Troll Miniboss",
		},
		[38611030] = {
			["info"] = "Inaccessible until Troll Minibosses are killed",
			["icon"] = "Skull",
			["title"] = BBL["Jammal'an the Prophet"],
		},
		[49310170] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 4",
			["title"] = "Statue (South-East)",
		},
		[36808480] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 2",
			["title"] = "Statue (North)",
		},
		[40809350] = {
			["info2"] = "Snake statues are activated in a specific sequence. When all are activated correctly, it will summon Atal'alarion",
			["icon"] = "Circle",
			["info"] = "Sequence No: 6",
			["title"] = "Statue (North-East)",
		},
	},
	["The Underbog"] = {
		[87614900] = {
			["icon"] = "Skull",
			["title"] = BBL["Hungarfen"],
		},
		[41506180] = {
			["icon"] = "Skull",
			["title"] = BBL["The Black Stalker"],
		},
		[27809870] = {
			["icon"] = "Skull",
			["title"] = BBL["Ghaz'an"],
		},
		[21105650] = {
			["icon"] = "Skull",
			["title"] = BBL["Swamplord Musel'ek"],
		},
		[66508970] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
	},
	["Uldaman"] = {
		[60210770] = {
			["info2"] = "Master Enchanter",
			["icon"] = "Square",
			["title"] = "Annora",
		},
		[92314980] = {
			["icon"] = "Skull",
			["title"] = BBL["Baelog"],
		},
		[32005640] = {
			["icon"] = "Skull",
			["title"] = BBL["Galgann Firehammer"],
		},
		[73114060] = {
			["icon"] = "Star",
			["title"] = "Front Entrance",
		},
		[43909040] = {
			["icon"] = "Skull",
			["title"] = BBL["Ancient Stone Keeper"],
		},
		[63311600] = {
			["icon"] = "Square",
			["title"] = "Remains of a Paladin",
		},
		[72812510] = {
			["icon"] = "Skull",
			["title"] = BBL["Revelosh"],
		},
		[4604170] = {
			["info"] = "Upper level",
			["icon"] = "Circle",
			["title"] = "The Discs of Norgannon",
		},
		[15105560] = {
			["info2"] = "Lower level",
			["icon"] = "Skull",
			["title"] = BBL["Archaedas"],
		},
		[60008740] = {
			["icon"] = "Skull",
			["title"] = BBL["Obsidian Sentinel"],
		},
		[77710360] = {
			["icon"] = "Star",
			["title"] = "Back Entrance",
		},
		[73410940] = {
			["icon"] = "Skull",
			["title"] = BBL["Ironaya"],
		},
		[25004460] = {
			["icon"] = "Skull",
			["title"] = BBL["Grimlok"],
		},
		[8104410] = {
			["info"] = "Lower level",
			["icon"] = "Circle",
			["title"] = "Ancient Treasure",
		},
	},
	["Wailing Caverns"] = {
		[28905620] = {
			["icon"] = "Skull",
			["title"] = BBL["Lady Anacondra"],
		},
		[48310330] = {
			["info"] = "Upper level",
			["icon"] = "Skull",
			["title"] = BBL["Lord Serpentis"],
		},
		[56709690] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[71415400] = {
			["icon"] = "Skull",
			["title"] = BBL["Skum"],
		},
		[15304550] = {
			["icon"] = "Skull",
			["title"] = BBL["Mutanus the Devourer"],
		},
		[26710240] = {
			["icon"] = "Skull",
			["title"] = BBL["Lord Pythas"],
		},
		[41208700] = {
			["icon"] = "Skull",
			["title"] = BBL["Kresh"],
		},
		[48608900] = {
			["icon"] = "Square",
			["title"] = "Disciple of Naralex",
		},
		[14204550] = {
			["icon"] = "Square",
			["title"] = "Naralex",
		},
		[44209470] = {
			["info"] = "Upper level",
			["icon"] = "Skull",
			["title"] = BBL["Verdan the Everliving"],
		},
		[52606680] = {
			["icon"] = "Skull",
			["title"] = BBL["Lord Cobrahn"],
		},
	},
	["Zul'Aman"] = {
		[38509450] = {
			["title"] = BBL["Malacrass"],
			["icon"] = "Skull",
		},
		[57309030] = {
			["title"] = BBL["Nalorakk"],
			["icon"] = "Skull",
		},
		[39011100] = {
			["title"] = BBL["Zul'jin"],
			["icon"] = "Skull",
		},
		[15806230] = {
			["title"] = BBL["Halazzi"],
			["icon"] = "Skull",
		},
		[38805690] = {
			["title"] = "Entrance",
			["icon"] = "Star",
		},
		[52909800] = {
			["title"] = BBL["Jan'alai"],
			["icon"] = "Skull",
		},
		[15504470] = {
			["title"] = BBL["Akil'zon"],
			["icon"] = "Skull",
		},
	},
	["Zul'Farrak"] = {
		[21907480] = {
			["icon"] = "Skull",
			["title"] = BBL["Witch Doctor Zum'rah"],
		},
		[30210200] = {
			["icon"] = "Skull",
			["title"] = BBL["Antu'sul"],
		},
		[44310410] = {
			["info2"] = "Rare spawn - Wanders",
			["icon"] = "Skull",
			["title"] = BBL["Zerillis"],
		},
		[85914970] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[42408400] = {
			["icon"] = "Skull",
			["title"] = BBL["Gahz'rilla"],
		},
		[44608780] = {
			["icon"] = "Skull",
			["title"] = BBL["Hydromancer Velratha"],
		},
		[39309140] = {
			["icon"] = "Skull",
			["title"] = BBL["Ruuzlu"],
		},
		[23405780] = {
			["icon"] = "Square",
			["title"] = "Sergeant Bly",
		},
		[23405950] = {
			["icon"] = "Skull",
			["title"] = BBL["Sandfury Executioner"],
		},
		[25206700] = {
			["icon"] = "Skull",
			["title"] = BBL["Nekrum Gutchewer"],
		},
                [22506430] = {
                        ["icon"] = "Skull",
                        ["title"] = "Shadowpriest Sezz'ziz",
                },
		[37009040] = {
			["icon"] = "Skull",
			["title"] = BBL["Chief Ukorz Sandscalp"],
		},
		[30709250] = {
			["icon"] = "Skull",
			["title"] = BBL["Theka the Martyr"],
		},
	},
	["Zul'Gurub"] = {
		[31208860] = {
			["icon"] = "Skull",
			["title"] = BBL["Gahz'ranka"],
		},
		[43610670] = {
			["icon"] = "Skull",
			["title"] = BBL["Hazza'rah"],
		},
		[36908870] = {
			["icon"] = "Skull",
			["title"] = BBL["Hakkar"],
		},
		[30708210] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[50710910] = {
			["title"] = "Zanza the Restless",
			["info"] = "ZG head & leg enchants",
			["icon"] = "Square",
		},
		[62912740] = {
			["icon"] = "Skull",
			["title"] = BBL["Bloodlord Mandokir"],
		},
		[69812130] = {
			["info2"] = "Summons Spider adds",
			["icon"] = "Skull",
			["title"] = BBL["High Priestess Mar'li"],
		},
		[65110750] = {
			["info2"] = "Summons Bat adds",
			["icon"] = "Skull",
			["title"] = BBL["High Priestess Jeklik"],
		},
		[20107060] = {
			["info2"] = "Summons swarms of Panther adds",
			["icon"] = "Skull",
			["title"] = BBL["High Priestess Arlokk"],
		},
		[21505800] = {
			["icon"] = "Skull",
			["title"] = BBL["Jin'do the Hexxer"],
		},
		[32707570] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[41010420] = {
			["icon"] = "Skull",
			["title"] = BBL["Wushoolay"],
		},
		[42508810] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[43109480] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[43910530] = {
			["icon"] = "Skull",
			["title"] = BBL["Renataki"],
		},
		[40809680] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[32309570] = {
			["icon"] = "Skull",
			["title"] = BBL["High Priest Thekal"],
		},
		[58711170] = {
			["icon"] = "Skull",
			["title"] = BBL["High Priest Venoxis"],
		},
		[45008160] = {
			["icon"] = "Star",
			["title"] = "Entrance",
		},
		[32708890] = {
			["icon"] = "Circle",
			["title"] = "Muddy Churning Waters",
		},
		[41410290] = {
			["icon"] = "Skull",
			["title"] = BBL["Gri'lek"],
		},
	},
	["Sunwell Plateau"] = {
		[16106840] = {
			["title"] = BBL["Kalecgos"],
			["icon"] = "Skull",
		},
		[15407030] = {
			["title"] = BBL["Sathrovarr the Corruptor"],
			["icon"] = "Skull",
		},
		[70312380] = {
			["title"] = BBL["Kil'jaeden"],
			["icon"] = "Skull",
		},
		[74111190] = {
			["title"] = BBL["Felmyst"],
			["icon"] = "Skull",
		},
		[73014080] = {
			["title"] = BBL["Entropius"],
			["icon"] = "Skull",
		},
		[70513790] = {
			["title"] = BBL["M'uru"],
			["icon"] = "Skull",
		},
		[68713270] = {
			["title"] = BBL["Grand Warlock Alythess"],
			["icon"] = "Skull",
		},
		[68713960] = {
			["title"] = BBL["Lady Sacrolash"],
			["icon"] = "Skull",
		},
		[71010870] = {
			["title"] = BBL["Brutallus"],
			["icon"] = "Skull",
		},
		[64613240] = {
			["title"] = BBL["The Eredar Twins"],
			["icon"] = "Skull",
		},
	},
}