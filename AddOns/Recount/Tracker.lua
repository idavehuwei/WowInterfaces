local AceLocale = LibStub("AceLocale-3.0")
local L = AceLocale:GetLocale( "Recount" )
local BossIDs = LibStub("LibBossIDs-1.0")

local Recount = _G.Recount

local revision = tonumber(string.sub("$Revision: 1056 $", 12, -3))
if Recount.Version < revision then Recount.Version = revision end

local dbCombatants

--Data for Recount is tracked within this file
local Tracking={}

local UnitName = UnitName
local UnitHealth = UnitHealth
local UnitHealthMax = UnitHealthMax
local UnitIsFeignDeath = UnitIsFeignDeath
local GetTime = GetTime

local tonumber = tonumber
local type = type
local pairs = pairs
local unpack = unpack

local tinsert = table.insert

local string_upper = string.upper
local string_lower = string.lower
local string_sub = string.sub

local math_floor = math.floor
local math_abs = math.abs
local math_fmod = math.fmod

-- Elsia: This is straight from GUIDRegistryLib-0.1 by ArrowMaster.
local bit_bor	= bit.bor
local bit_band  = bit.band

local COMBATLOG_OBJECT_AFFILIATION_MINE		= COMBATLOG_OBJECT_AFFILIATION_MINE		or 0x00000001
local COMBATLOG_OBJECT_AFFILIATION_PARTY	= COMBATLOG_OBJECT_AFFILIATION_PARTY	or 0x00000002
local COMBATLOG_OBJECT_AFFILIATION_RAID		= COMBATLOG_OBJECT_AFFILIATION_RAID		or 0x00000004
local COMBATLOG_OBJECT_AFFILIATION_OUTSIDER	= COMBATLOG_OBJECT_AFFILIATION_OUTSIDER	or 0x00000008
local COMBATLOG_OBJECT_AFFILIATION_MASK		= COMBATLOG_OBJECT_AFFILIATION_MASK		or 0x0000000F
-- Reaction
local COMBATLOG_OBJECT_REACTION_FRIENDLY	= COMBATLOG_OBJECT_REACTION_FRIENDLY	or 0x00000010
local COMBATLOG_OBJECT_REACTION_NEUTRAL		= COMBATLOG_OBJECT_REACTION_NEUTRAL		or 0x00000020
local COMBATLOG_OBJECT_REACTION_HOSTILE		= COMBATLOG_OBJECT_REACTION_HOSTILE		or 0x00000040
local COMBATLOG_OBJECT_REACTION_MASK		= COMBATLOG_OBJECT_REACTION_MASK		or 0x000000F0
-- Ownership
local COMBATLOG_OBJECT_CONTROL_PLAYER		= COMBATLOG_OBJECT_CONTROL_PLAYER		or 0x00000100
local COMBATLOG_OBJECT_CONTROL_NPC			= COMBATLOG_OBJECT_CONTROL_NPC			or 0x00000200
local COMBATLOG_OBJECT_CONTROL_MASK			= COMBATLOG_OBJECT_CONTROL_MASK			or 0x00000300
-- Unit type
local COMBATLOG_OBJECT_TYPE_PLAYER			= COMBATLOG_OBJECT_TYPE_PLAYER			or 0x00000400
local COMBATLOG_OBJECT_TYPE_NPC				= COMBATLOG_OBJECT_TYPE_NPC				or 0x00000800
local COMBATLOG_OBJECT_TYPE_PET				= COMBATLOG_OBJECT_TYPE_PET				or 0x00001000
local COMBATLOG_OBJECT_TYPE_GUARDIAN		= COMBATLOG_OBJECT_TYPE_GUARDIAN		or 0x00002000
local COMBATLOG_OBJECT_TYPE_OBJECT			= COMBATLOG_OBJECT_TYPE_OBJECT			or 0x00004000
local COMBATLOG_OBJECT_TYPE_MASK			= COMBATLOG_OBJECT_TYPE_MASK			or 0x0000FC00

-- Special cases (non-exclusive)
local COMBATLOG_OBJECT_TARGET				= COMBATLOG_OBJECT_TARGET				or 0x00010000
local COMBATLOG_OBJECT_FOCUS				= COMBATLOG_OBJECT_FOCUS				or 0x00020000
local COMBATLOG_OBJECT_MAINTANK				= COMBATLOG_OBJECT_MAINTANK				or 0x00040000
local COMBATLOG_OBJECT_MAINASSIST			= COMBATLOG_OBJECT_MAINASSIST			or 0x00080000
local COMBATLOG_OBJECT_RAIDTARGET1			= COMBATLOG_OBJECT_RAIDTARGET1			or 0x00100000
local COMBATLOG_OBJECT_RAIDTARGET2			= COMBATLOG_OBJECT_RAIDTARGET2			or 0x00200000
local COMBATLOG_OBJECT_RAIDTARGET3			= COMBATLOG_OBJECT_RAIDTARGET3			or 0x00400000
local COMBATLOG_OBJECT_RAIDTARGET4			= COMBATLOG_OBJECT_RAIDTARGET4			or 0x00800000
local COMBATLOG_OBJECT_RAIDTARGET5			= COMBATLOG_OBJECT_RAIDTARGET5			or 0x01000000
local COMBATLOG_OBJECT_RAIDTARGET6			= COMBATLOG_OBJECT_RAIDTARGET6			or 0x02000000
local COMBATLOG_OBJECT_RAIDTARGET7			= COMBATLOG_OBJECT_RAIDTARGET7			or 0x04000000
local COMBATLOG_OBJECT_RAIDTARGET8			= COMBATLOG_OBJECT_RAIDTARGET8			or 0x08000000
local COMBATLOG_OBJECT_NONE					= COMBATLOG_OBJECT_NONE					or 0x80000000
local COMBATLOG_OBJECT_SPECIAL_MASK			= COMBATLOG_OBJECT_SPECIAL_MASK			or 0xFFFF0000

local LIB_FILTER_RAIDTARGET	= bit_bor(
	COMBATLOG_OBJECT_RAIDTARGET1, COMBATLOG_OBJECT_RAIDTARGET2, COMBATLOG_OBJECT_RAIDTARGET3, COMBATLOG_OBJECT_RAIDTARGET4,
	COMBATLOG_OBJECT_RAIDTARGET5, COMBATLOG_OBJECT_RAIDTARGET6, COMBATLOG_OBJECT_RAIDTARGET7, COMBATLOG_OBJECT_RAIDTARGET8
)
local LIB_FILTER_ME = bit_bor(
	COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_TYPE_PLAYER
)
local LIB_FILTER_MY_PET = bit_bor(
						COMBATLOG_OBJECT_AFFILIATION_MINE,
						COMBATLOG_OBJECT_CONTROL_PLAYER,
						COMBATLOG_OBJECT_TYPE_PET
						)
local LIB_FILTER_PARTY = bit_bor(COMBATLOG_OBJECT_TYPE_PLAYER, COMBATLOG_OBJECT_AFFILIATION_PARTY)
local LIB_FILTER_RAID  = bit_bor(COMBATLOG_OBJECT_TYPE_PLAYER, COMBATLOG_OBJECT_AFFILIATION_RAID)
local LIB_FILTER_GROUP = bit_bor(LIB_FILTER_PARTY, LIB_FILTER_RAID)

local HotTickTimeId={
	[746]=1, -- First Aid (rank 1)
	[1159]=1,
	[3267]=1,
	[3268]=1,
	[7926]=1,
	[7927]=1,
	[23569]=1,
	[24412]=1,
	[10838]=1,
	[10839]=1,
	[23568]=1,
	[24413]=1,
	[18608]=1,
	[18610]=1,
	[23567]=1,
	[23696]=1,
	[24414]=1,
	[27030]=1,
	[27031]=1, -- First Aid (rank 12)
	[33763]=1, -- Lifebloom (rank 1) no other ranks
}

local DotTickTimeId={
	-- Mage Ticks
	[133]=2, -- Fireball (rank 1)
	[143]=2,
	[145]=2,
	[3140]=2,
	[8400]=2,
	[8401]=2,
	[8402]=2,
	[10148]=2,
	[10149]=2,
	[10150]=2,
	[10151]=2,
	[25306]=2,
	[27070]=2,
	[38692]=2, -- Fireball (rank 14)
	[11119]=2, -- Ignite (rank 1)
	[11120]=2,
	[12846]=2,
	[12847]=2,
	[12848]=2, -- Ignite (rank 5)
	[15407]=1, -- Mind Flay (rank 1)
	[17311]=1,
	[17312]=1,
	[17313]=1,
	[17314]=1,
	[18807]=1,
	[25387]=1, -- Mind Flay (rank 7)
	[980]=2, -- Curse of Agony (rank 1)
	[1014]=2,
	[6217]=2,
	[11711]=2,
	[11712]=2,
	[11713]=2,
	[27218]=2, -- Curse of Agony (rank 7)
	[603]=60, -- Curse of Doom (rank 1)
	[30910]=60, -- Curse of Doom (rank 2)
	[689]=1, -- Drain Life (rank 1) Elsia: According to wowhead it's 1. Which makes sense compared to Mind Flay...
	[699]=1,
	[709]=1,
	[7651]=1,
	[11699]=1,
	[11700]=1,
	[27219]=1,
	[27220]=1, -- Drain Life (rank 8)
	[755]=1, -- Health Funnel (rank 1)
	[3698]=1,
	[3699]=1,
	[3700]=1,
	[11693]=1,
	[11694]=1,
	[11695]=1,
	[27259]=1, -- Health Funnel (rank 8)
	[1949]=1, -- Hellfire (rank 1)
	[11683]=1,
	[11684]=1,
	[27213]=1, -- Hellfire (rank 4)
}


local CCId={
	[118]=true, -- Polymorph (rank 1)
	[12824]=true, -- Polymorph (rank 2)
	[12825]=true, -- Polymorph (rank 3)
	[12826]=true, -- Polymorph (rank 4)
	[28272]=true, -- Polymorph (rank 1:pig)
	[28271]=true, -- Polymorph (rank 1:turtle)
	[9484]=true, -- Shackle Undead (rank 1)
	[9485]=true, -- Shackle Undead (rank 2)
	[10955]=true, -- Shackle Undead (rank 3)
	[3355]=true, -- Freezing Trap Effect (rank 1)
	[14308]=true, -- Freezing Trap Effect (rank 2)
	[14309]=true, -- Freezing Trap Effect (rank 3)
	[2637]=true, -- Hibernate (rank 1)
	[18657]=true, -- Hibernate (rank 2)
	[18658]=true, -- Hibernate (rank 3)
	[6770]=true, -- Sap (rank 1)
	[2070]=true, -- Sap (rank 2)
	[11297]=true, -- Sap (rank 3)
	[6358]=true, -- Seduction (succubus)
}
	
local RessesId={
	[2008]=true, -- Ancestral Spirit (Rank 1)
	[20609]=true, --Ancestral Spirit (Rank 2)
	[20610]=true, --Ancestral Spirit (Rank 3)
	[20776]=true, --Ancestral Spirit (Rank 4)
	[20777]=true, --Ancestral Spirit (Rank 5)
	[2006]=true, -- Resurrection (Rank 1)
	[2010]=true, -- Resurrection (Rank 2)
	[10880]=true, -- Resurrection (Rank 3)
	[10881]=true, -- Resurrection (Rank 4)
	[20770]=true, -- Resurrection (Rank 5)
	[25435]=true, -- Resurrection (Rank 6)
	[20484]=true, -- Rebirth (Rank 1)
	[20739]=true, -- Rebirth (Rank 2)
	[20742]=true, -- Rebirth (Rank 3)
	[20747]=true, -- Rebirth (Rank 4)
	[20748]=true, -- Rebirth (Rank 5)
	[26994]=true, -- Rebirth (Rank 6)
	[7328]=true, -- Redemption (Rank 1)
	[10322]=true, -- Redemption (Rank 2)
	[10324]=true, -- Redemption (Rank 3)
	[20772]=true, -- Redemption (Rank 4)
	[20773]=true, -- Redemption (Rank 5)
}

--[[local bossIDs = {
	[17881] = true, --"Aeonus", 
	[4422] = true, --"Agathelos the Raging",
	[25740] = true, --"Ahune",
	[23574] = true, --"Akil'zon",
	[4829] = true, --"Aku'mai",
	[19514] = true, --"Al'ar",
	[11492] = true, --"Alzzin the Wildshaper",
	[30258] = true, --"Amanitar",
	[9156] = true, --"Ambassador Flamelash",
	[18731] = true, --"Ambassador Hellmaw",
	[7358] = true, --"Amnennar the Coldbringer",
	--[7206] = true, --"Ancient Stone Keeper",
	[17808] = true, --"Anetheron",
	[17808] = true, --"Anger'rel",
	[26763] = true, --"Anomalus",
	[8127] = true, --"Antu'sul",
	[29120] = true, --"Anub'arak",
	--[15277] = true, --"Anubisath Defender",
	--[15355] = true, --"Anubisath Guardian",
	[15956] = true, --"Anub'Rekhan",
	[9031] = true, --"Anub'shiah",
	[23035] = true, --"Anzu",
	--[16485] = true, --"Arcane Watchman",
	[6487] = true, --"Arcanist Doan",
	[2748] = true, --"Archaedas",
	[31125] = true, --"Archavon the Stone Watcher",
	[17968] = true, --"Archimonde",
	[10811] = true, --"Archivist Galford",
	[4275] = true, --"Archmage Arugal",
	[4627] = true, --"Arugal's Voidwalker",
	[8580] = true, --"Atal'alarion",
	[15550] = true, --"Attumen the Huntsman",
	[14464] = true, --"Avalanchion",
	[8443] = true, --"Avatar of Hakkar",
	[15369] = true, --"Ayamiss the Hunter",
	[17842] = true, --"Azgalor",
	[6490] = true, --"Azshir the Sleepless",
	[6109] = true, --"Azuregos",
	[9016] = true, --"Bael'Gar",
	[6906] = true, --"Baelog",
	[10813] = true, --"Balnazzar",
	[9596] = true, --"Bannok Grimaxe",
	[12876] = true, --"Baron Aquanis",
	[14461] = true, --"Baron Charr",
	[10436] = true, --"Baroness Anastari",
	[12056] = true, --"Baron Geddon",
	[15205] = true, --"Baron Kazum",
	[10440] = true, --"Baron Rivendare", -- Strath
	[30549] = true, --"Baron Rivendare", -- Naxx
	[3887] = true, --"Baron Silverlaine",
	[15516] = true, --"Battleguard Sartura",
	[1716] = true, --"Bazil Thredd",
	[11519] = true, --"Bazzalan",
	[11121] = true, --"Black Guard Swordsmith",
	[18667] = true, --"Blackheart the Inciter",
	[18836] = true, --"Blindeye the Seer",
	[4425] = true, --"Blind Hunter",
	[20923] = true, --"Blood Guard Porung",
	[11382] = true, --"Bloodlord Mandokir",
	[4543] = true, --"Bloodmage Thalnos",
	--[14861] = true, --"Blood Steward of Kirtonos",
	[3672] = true, --"Boahn",
	[596] = true, --"Brainwashed Noble",
	[17380] = true, --"Broggok",
	[18398] = true, --"Brokentoe",
	[12017] = true, --"Broodlord Lashlayer",
	[1720] = true, --"Bruegal Ironknuckle",
	[24882] = true, --"Brutallus",
	[10263] = true, --"Burning Felguard",
	[15370] = true, --"Buru the Gorger",
	-- Not a mob ["Cache of the Firelord"] = true, --"Cache of the Firelord",
	[10997] = true, --"Cannon Master Willey",
	[647] = true, --"Captain Greenskin",
	[14325] = true, --"Captain Kromcrush",
	[17862] = true, --"Captain Skarloc",
	[12225] = true, --"Celebras the Cursed",
	[4421] = true, --"Charlga Razorflank",
	-- not a mob ["Chess Event"] = true, --"Chess Event",
	-- not a mob ["Chest of The Seven"] = true, --"Chest of The Seven",
	[7267] = true, --"Chief Ukorz Sandscalp",
	[14324] = true, --"Cho'Rush the Observer",
	[14020] = true, --"Chromaggus",
	[17879] = true, --"Chrono Lord Deja",
	[26532] = true, --"Chrono-Lord Epoch",
	[17827] = true, --"Claw",
	--[22055] = true, --"Coilfang Elite",
	--[22056] = true, --"Coilfang Strider",
	[26798] = true, --"Commander Kolurg",
	[17976] = true, --"Commander Sarannis",
	[4278] = true, --"Commander Springvale",
	[26796] = true, --"Commander Stoutbeard",
	-- Unknown ["Constructor & Controller"] = true, --"Constructor & Controller",
	[645] = true, --"Cookie",
	[21270] = true, --"Cosmic Infuser",
	[11120] = true, --"Crimson Hammersmith",
	[6229] = true, --"Crowd Pummeler 9-60",
	[10376] = true, --"Crystal Fang",
	[15727] = true, --"C'Thun",
	[31134] = true, --"Cyanigosa",
	[20885] = true, --"Dalliah the Doomsayer",
	[27389] = true, --"Dalronn the Controller",
	[24201] = true, --"Dalronn the Controller",
	[6228] = true, --"Dark Iron Ambassador",
	[1853] = true, --"Darkmaster Gandling",
	[18472] = true, --"Darkweaver Syth",
	[14516] = true, --"Death Knight Darkreaver",
	[16803] = true, --"Death Knight Understudy",
	[4428] = true, --"Death Speaker Jargba",
	[3872] = true, --"Deathsworn Captain",
	[21269] = true, --"Devastation",
	[5912] = true, --"Deviate Faerie Dragon",
	[1663] = true, --"Dextren Ward",
	[7057] = true, --"Digmaster Shovelphlange",
	[11261] = true, --"Doctor Theolen Krastinov",
	[18728] = true, --"Doom Lord Kazzak",
	[9039] = true, --"Doom'rel",
	[17711] = true, --"Doomwalker",
	[9040] = true, --"Dope'rel",
	[17535] = true, --"Dorothee",
	[29307] = true, --"Drakkari Colossus",
	[27654] = true, --"Drakos the Interrogator",
	[5721] = true, --"Dreamscythe",
	-- not a mob ["Dust Covered Chest"] = true, --"Dust Covered Chest",
	[10081] = true, --"Dustwraith",
	[4842] = true, --"Earthcaller Halmgar",
	[14601] = true, --"Ebonroc",
	[29932] = true, --"Eck the Ferocious",
	[639] = true, --"Edwin VanCleef",
	[29309] = true, --"Elder Nadox",
	[6235] = true, --"Electrocutioner 6000",
	[14889] = true, --"Emeriss",
	[9019] = true, --"Emperor Dagran Thaurissan",
	[15276] = true, --"Emperor Vek'lor",
	[15275] = true, --"Emperor Vek'nilash",
	[25840] = true, --"Entropius",
	[18096] = true, --"Epoch Hunter",
	[29315] = true, --"Erekem",
	[23420] = true, --"Essence of Anger",
	[23419] = true, --"Essence of Desire",
	[23418] = true, --"Essence of Suffering",
	[9029] = true, --"Eviscerator",
	[18373] = true, --"Exarch Maladaar",
	[15589] = true, --"Eye of C'Thun",
	[6488] = true, --"Fallen Champion",
	[15510] = true, --"Fankriss the Unyielding",
	[21214] = true, --"Fathom-Lord Karathress",
	[25038] = true, --"Felmyst",
	[4274] = true, --"Fenrus the Devourer",
	[15930] = true, --"Feugen",
	[9056] = true, --"Fineous Darkvire",
	[11983] = true, --"Firemaw",
	[11981] = true, --"Flamegor",
	[33113] = true, --"Flame Leviathan", -- 3.1 PTR missing
	[626] = true, --"Foreman Thistlenettle",
	-- not a mob ["Four Horsemen Chest"] = true, --"Four Horsemen Chest",
	[11058] = true, --"Fras Siabi",
	[32906] = true, --"Freya",-- 3.1 PTR missing
	[15114] = true, --"Gahz'ranka",
	[7273] = true, --"Gahz'rilla",
	[29306] = true, --"Gal'darah",
	[7291] = true, --"Galgann Firehammer",
	[12057] = true, --"Garr",
	[5713] = true, --"Gasher",
	[19218] = true, --"Gatewatcher Gyro-Kill",
	[19710] = true, --"Gatewatcher Iron-Hand",
	[22949] = true, --"Gathios the Shatterer",
	[12259] = true, --"Gehennas",
	[6243] = true, --"Gelihast",
	[13741] = true, --"Gelk",
	[9033] = true, --"General Angerforge",
	[28586] = true, --"General Bjarngrim",
	[10363] = true, --"General Drakkisath",
	[15341] = true, --"General Rajaxx",
	[33271] = true, --"General Vezax",-- 3.1 PTR missing
	[4887] = true, --"Ghamoo-ra",
	[18105] = true, --"Ghaz'an",
	[9718] = true, --"Ghok Bashguud",
	[1763] = true, --"Gilnid",
	[10268] = true, --"Gizrul the Slavener",
	[9037] = true, --"Gloom'rel",
	[15932] = true, --"Gluth",
	[8567] = true, --"Glutton",
	[11988] = true, --"Golemagg the Incinerator",
	[8983] = true, --"Golem Lord Argelmach",
	[10899] = true, --"Goraluk Anvilcrack",
	[9027] = true, --"Gorosh the Dervish",
	[26687] = true, --"Gortok Palehoof",
	[16060] = true, --"Gothik the Harvester",
	[20062] = true, --"Grand Astromancer Capernian",
	[26731] = true, --"Grand Magus Telestra",
	[26832] = true, --"Grand Magus Telestra",
	[26928] = true, --"Grand Magus Telestra",
	[26929] = true, --"Grand Magus Telestra",
	[26730] = true, --"Grand Magus Telestra",
	[18732] = true, --"Grandmaster Vorpil",
	-- non-attackable [17603] = true, --"Grandmother",
	[25166] = true, --"Grand Warlock Alythess",
	[16807] = true, --"Grand Warlock Nethekurse",
	[15953] = true, --"Grand Widow Faerlina",
	[12557] = true, --"Grethok the Controller",
	[15082] = true, --"Gri'lek",
	[4854] = true, --"Grimlok",
	[9028] = true, --"Grizzle",
	[15931] = true, --"Grobbulus",
	[7361] = true, --"Grubbis",
	[19044] = true, --"Gruul the Dragonkiller",
	[14321] = true, --"Guard Fengus",
	[14326] = true, --"Guard Mol'dar",
	[14323] = true, --"Guard Slip'kik",
	[22948] = true, --"Gurtogg Bloodboil",
	[10339] = true, --"Gyth",
	[28921] = true, --"Hadronox",
	[14834] = true, --"Hakkar",
	[23577] = true, --"Halazzi",
	[28517] = true, --"Halazzi",
	[29022] = true, --"Halazzi",
	[10220] = true, --"Halycon",
	[1717] = true, --"Hamhock",
	[20912] = true, --"Harbinger Skyriss",
	[9034] = true, --"Hate'rel",
	[15083] = true, --"Hazza'rah",
	[5722] = true, --"Hazzas",
	[23682] = true, --"Headless Horseman",
	[23800] = true, --"Headless Horseman",
	[10558] = true, --"Hearthsinger Forresten",
	[9032] = true, --"Hedrum the Creeper",
	[15936] = true, --"Heigan the Unclean",
	-- Maggy trash [17256] = true, --"Hellfire Channeler",
	-- friendly NPC [8696] = true, --"Henry Stern",
	[29311] = true, --"Herald Volazj",
	[3975] = true, --"Herod",
	[24239] = true, --"Hex Lord Malacrass",
	[18805] = true, --"High Astromancer Solarian",
	[17975] = true, --"High Botanist Freywinn",
	[4542] = true, --"High Inquisitor Fairbanks",
	[3977] = true, --"High Inquisitor Whitemane",
	[9018] = true, --"High Interrogator Gerstahn",
	[18831] = true, --"High King Maulgar",
	[16062] = true, --"Highlord Mograine",
	[9196] = true, --"Highlord Omokk",
	[15204] = true, --"High Marshal Whirlaxis",
	[22950] = true, --"High Nethermancer Zerevor",
	[14515] = true, --"High Priestess Arlokk",
	[14517] = true, --"High Priestess Jeklik",
	[14510] = true, --"High Priestess Mar'li",
	[10076] = true, --"High Priestess of Thaurissan",
	[14509] = true, --"High Priest Thekal",
	[14507] = true, --"High Priest Venoxis",
	[22887] = true, --"High Warlord Naj'entus",
	[32845] = true, --"Hodir", -- 3.1 PTR missing
	[9319] = true, --"Houndmaster Grebmar",
	[3974] = true, --"Houndmaster Loksey",
	[5715] = true, --"Hukku",
	[17770] = true, --"Hungarfen",
	[9537] = true, --"Hurley Blackbreath",
	[16179] = true, --"Hyakiss the Lurker",
	[17797] = true, --"Hydromancer Thespia",
	[7795] = true, --"Hydromancer Velratha",
	[13280] = true, --"Hydrospawn",
	[21216] = true, --"Hydross the Unstable",
	[29313] = true, --"Ichoron",
	[33118] = true, --"Ignis the Furnace Master", -- 3.1 PTR missing
	[22917] = true, --"Illidan Stormrage", -- Not adding solo quest IDs for now
	[23426] = true, --"Illidari Council",
	[11488] = true, --"Illyanna Ravenoak",
	[11496] = true, --"Immol'thar",
	[32273] = true, --"Infinite Corruptor",
	[21271] = true, --"Infinity Blades",
	[23954] = true, --"Ingvar the Plunderer",
	[23980] = true, --"Ingvar the Plunderer",
	[10505] = true, --"Instructor Malicia",
	[16061] = true, --"Instructor Razuvious",
	[3983] = true, --"Interrogator Vishas",
	[28546] = true, --"Ionar",
	[7228] = true, --"Ironaya",
	[6489] = true, --"Ironspine",
	[16097] = true, --"Isalien",
	[1063] = true, --"Jade",
	[5710] = true, --"Jammal'an the Prophet",
	[23578] = true, --"Jan'alai",
	[28515] = true, --"Jan'alai",
	[29023] = true, --"Jan'alai",
	[10503] = true, --"Jandice Barov",
	[29310] = true, --"Jedoga Shadowseeker",
	[10509] = true, --"Jed Runewatcher",
	[11518] = true, --"Jergosh the Invoker",
	[11380] = true, --"Jin'do the Hexxer",
	-- Not found ["Jormungar Behemoth"] = true, --"Jormungar Behemoth",
	[17534] = true, --"Julianne",
	[24664] = true, --"Kael'thas Sunstrider",
	[19622] = true, --"Kael'thas Sunstrider",
	[24891] = true, --"Kalecgos",
	[25319] = true, --"Kalecgos",
	[24850] = true, --"Kalecgos",
	[1666] = true, --"Kam Deepfury",
	[5401] = true, --"Kazkaz the Unholy",
	[17888] = true, --"Kaz'rogal",
	[17377] = true, --"Keli'dan the Breaker",
	[15990] = true, --"Kel'Thuzad",
	[25465] = true, --"Kel'Thuzad",
	[26723] = true, --"Keristrasza",
	[18835] = true, --"Kiggler the Crazed",
	[25315] = true, --"Kil'jaeden",
	[17229] = true, --"Kil'rek",
	[27483] = true, --"King Dred",
	[11501] = true, --"King Gordok",
	-- Considering this a pet [21684] = true, --"King Llane Piece",
	[26861] = true, --"King Ymiron",
	[10506] = true, --"Kirtonos the Herald",
	-- not a mob ["Knot Thimblejack's Cache"] = true, --"Knot Thimblejack's Cache",
	[13742] = true, --"Kolk",
	[16118] = true, --"Kormok",
	[3653] = true, --"Kresh",
	[28684] = true, --"Krik'thir the Gatewatcher",
	[18832] = true, --"Krosh Firehand",
	[27977] = true, --"Krystallus",
	[15348] = true, --"Kurinnaxx",
	[3671] = true, --"Lady Anacondra",
	[16065] = true, --"Lady Blaumeux",
	[10502] = true, --"Lady Illucia Barov",
	[22951] = true, --"Lady Malande",
	[25165] = true, --"Lady Sacrolash",
	[4831] = true, --"Lady Sarevess",
	[21212] = true, --"Lady Vashj",
	[17980] = true, --"Laj",
	[12203] = true, --"Landslide",
	[29312] = true, --"Lavanthor",
	[21215] = true, --"Leotheras the Blind",
	[14888] = true, --"Lethon",
	[14327] = true, --"Lethtendris",
	[27656] = true, --"Ley-Guardian Eregos",
	[17848] = true, --"Lieutenant Drake",
	-- friendly ally [15471] = true, --"Lieutenant General Andorov",
	[16011] = true, --"Loatheb",
	[28923] = true, --"Loken",
	[10504] = true, --"Lord Alexei Barov",
	[3669] = true, --"Lord Cobrahn",
	[14506] = true, --"Lord Hel'nurath",
	[9017] = true, --"Lord Incendius",
	[12397] = true, --"Lord Kazzak",
	[15511] = true, --"Lord Kri",
	[3670] = true, --"Lord Pythas",
	[9025] = true, --"Lord Roccor",
	[20060] = true, --"Lord Sanguinar",
	[3673] = true, --"Lord Serpentis",
	[15305] = true, --"Lord Skwol",
	[16042] = true, --"Lord Valthalak",
	[10162] = true, --"Lord Victor Nefarius",
	[12236] = true, --"Lord Vyletongue",
	[10901] = true, --"Lorekeeper Polkelt",
	[5714] = true, --"Loro",
	[12118] = true, --"Lucifron",
	[3655] = true, --"Mad Magglish",
	[15952] = true, --"Maexxna",
	[27655] = true, --"Mage-Lord Urom",
	[11487] = true, --"Magister Kalendris",
	[10435] = true, --"Magistrate Barthilas",
	[11982] = true, --"Magmadar",
	[9938] = true, --"Magmus",
	[13740] = true, --"Magra",
	[17257] = true, --"Magtheridon",
	[27975] = true, --"Maiden of Grief",
	[16457] = true, --"Maiden of Virtue",
	[12018] = true, --"Majordomo Executus",
	[24239] = true, --"Malacrass",
	[10438] = true, --"Maleki the Pallid",
	[26533] = true, --"Mal'Ganis",
	[29620] = true, --"Mal'Ganis",
	[28859] = true, --"Malygos",
	[13739] = true, --"Maraudos",
	[10433] = true, --"Marduk Blackpool",
	[599] = true, --"Marisa du'Paige",
	[20063] = true, --"Master Engineer Telonicus",
	[11834] = true, --"Maur Grimtotem",
	[26529] = true, --"Meathook",
	[19219] = true, --"Mechano-Lord Capacitus",
	-- Friendly NPC Medivh = true, --"Medivh",
	[17796] = true, --"Mekgineer Steamrigger",
	[7800] = true, --"Mekgineer Thermaplugg",
	[17941] = true, --"Mennu the Betrayer",
	[12237] = true, --"Meshlok the Harvester",
	[16151] = true, --"Midnight",
	[5717] = true, --"Mijan",
	[3586] = true, --"Miner Johnson",
	[15340] = true, --"Moam",
	[18069] = true, --"Mogor",
	[29305] = true, --"Moorabi",
	[29316] = true, --"Moragg",
	[7357] = true, --"Mordresh Fire Eye",
	[16080] = true, --"Mor Grayhoof",
	[15687] = true, --"Moroes",
	[21213] = true, --"Morogrim Tidewalker",
	[5719] = true, --"Morphaz",
	[22947] = true, --"Mother Shahraz",
	[10596] = true, --"Mother Smolderweb",
	[646] = true, --"Mr. Smite",
	[18399] = true, --"Murkblood Twin",
	-- not found ["Murkblood Twins"] = true, --"Murkblood Twins",
	[18708] = true, --"Murmur",
	[7608] = true, --"Murta Grimgut",
	[25741] = true, --"M'uru",
	[11447] = true, --"Mushgog",
	[3654] = true, --"Mutanus the Devourer",
	[29024] = true, --"Nalorakk",
	[28514] = true, --"Nalorakk",
	[23576] = true, --"Nalorakk",
	[17536] = true, --"Nazan",
	[11583] = true, --"Nefarian",
	[7796] = true, --"Nekrum Gutchewer",
	[10437] = true, --"Nerub'enkan",
	[19221] = true, --"Nethermancer Sepethrea",
	[15689] = true, --"Netherspite",
	[21268] = true, --"Netherstrand Longbow",
	[18344] = true, --"Nexus-Prince Shaffar",
	[17225] = true, --"Nightbane",
	[15954] = true, --"Noth the Plaguebringer",
	[26631] = true, --"Novos the Summoner",
	[13282] = true, --"Noxxion",
	-- [7023] = true, --"Obsidian Sentinel",
	[4279] = true, --"Odo the Blindwatcher",
	[5711] = true, --"Ogom the Wretched",
	[9030] = true, --"Ok'thor the Breaker",
	[4830] = true, --"Old Serra'kis",
	[18834] = true, --"Olm the Summoner",
	[17308] = true, --"Omor the Unscarred",
	[10184] = true, --"Onyxia",
	[26794] = true, --"Ormorok the Tree-Shaper",
	[7606] = true, --"Oro Eyegouge",
	[15339] = true, --"Ossirian the Unscarred",
	[15517] = true, --"Ouro",
	[4420] = true, --"Overlord Ramtusk",
	[9568] = true, --"Overlord Wyrmthalak",
	[9026] = true, --"Overmaster Pyron",
	-- not found ["Overseer Tidewrath"] = true, --"Overseer Tidewrath",
	[18341] = true, --"Pandemonius",
	[8923] = true, --"Panzor the Invincible",
	[16028] = true, --"Patchwerk",
	[19220] = true, --"Pathaleon the Calculator",
	[9502] = true, --"Phalanx",
	[21273] = true, --"Phaseshift Bulwark",
	[14349] = true, --"Pimgib",
	[7356] = true, --"Plaguemaw the Rotting",
	[9499] = true, --"Plugger Spazzring",
	[11143] = true, --"Postmaster Malown",
	[24560] = true, --"Priestess Delrissa",
	[23953] = true, --"Prince Keleseth",
	[15690] = true, --"Prince Malchezaar",
	[15203] = true, --"Prince Skaldrenox",
	[15509] = true, --"Princess Huhuran",
	[8929] = true, --"Princess Moira Bronzebeard",
	[14457] = true, --"Princess Tempestria",
	[12201] = true, --"Princess Theradras",
	[15543] = true, --"Princess Yauj",
	[29308] = true, --"Prince Taldaram",
	[11486] = true, --"Prince Tortheldrin",
	-- Hydross trash [22035] = true, --"Pure Spawn of Hydross",
	[14354] = true, --"Pusillin",
	[9816] = true, --"Pyroguard Emberseer",
	[9024] = true, --"Pyromancer Loregrain",
	[17942] = true, --"Quagmirran",
	[9736] = true, --"Quartermaster Zigris",
	[17767] = true, --"Rage Winterchill",
	[7354] = true, --"Ragglesnout",
	[11502] = true, --"Ragnaros",
	[10439] = true, --"Ramstein the Gorger",
	[10508] = true, --"Ras Frostwhisper",
	[11622] = true, --"Rattlegore",
	[3886] = true, --"Razorclaw the Butcher",
	[12435] = true, --"Razorgore the Untamed",
	[12258] = true, --"Razorlash",
	-- not found Razorscale = true, --"Razorscale",
	-- not found ["Reliquary of Souls"] = true, --"Reliquary of Souls",
	[15084] = true, --"Renataki",
	[17261] = true, --"Restless Skeleton",
	[6910] = true, --"Revelosh",
	[644] = true, --"Rhahk'Zor",
	[9543] = true, --"Ribbly Screwspigot",
	[17546] = true, --"Roar",
	[16181] = true, --"Rokad the Ravager",
	[18400] = true, --"Rokdar the Sundered Lord",
	[17991] = true, --"Rokmar the Crackler",
	[17533] = true, --"Romulo",
	-- not found ["Romulo & Julianne"] = true, --"Romulo & Julianne",
	[13596] = true, --"Rotgrip",
	-- not found ["Runemaster Molgeim"] = true, --"Runemaster Molgeim",
	[7797] = true, --"Ruuzlu",
	[26530] = true, --"Salramm the Fleshcrafter",
	[10080] = true, --"Sandarr Dunereaver",
	[7274] = true, --"Sandfury Executioner",
	[15989] = true, --"Sapphiron",
	[28860] = true, --"Sartharion",
	[24892] = true, --"Sathrovarr the Corruptor",
	[3976] = true, --"Scarlet Commander Mograine",
	[9038] = true, --"Seeth'rel",
	[24723] = true, --"Selin Fireheart",
	[7604] = true, --"Sergeant Bly",
	[22841] = true, --"Shade of Akama",
	[16524] = true, --"Shade of Aran",
	[5709] = true, --"Shade of Eranikus",
	[16180] = true, --"Shadikith the Glider",
	[9236] = true, --"Shadow Hunter Vosh'gajin",
	[21875] = true, --"Shadow of Leotheras",
	[7275] = true, --"Shadowpriest Sezz'ziz",
	[30451] = true, --"Shadron",
	[12264] = true, --"Shazzrah",
	[18371] = true, --"Shirrak the Dead Watcher",
	[16063] = true, --"Sir Zeliek",
	[27978] = true, --"Sjonnir The Ironshaper",
	[26693] = true, --"Skadi the Ruthless",
	[11498] = true, --"Skarr the Unbreakable",
	[27390] = true, --"Skarvald the Constructor",
	[24200] = true, --"Skarvald the Constructor",
	[18401] = true, --"Skra'gath",
	[10393] = true, --"Skul",
	[3674] = true, --"Skum",
	[29304] = true, --"Slad'ran",
	[643] = true, --"Sneed",
	[642] = true, --"Sneed's Shredder",
	[10264] = true, --"Solakar Flamewreath",
	-- Solarium trash [18925] = true, --"Solarium Agent",
	-- Solarium trash [18806] = true, --"Solarium Priest",
	[9218] = true, --"Spirestone Battle Lord",
	[9219] = true, --"Spirestone Butcher",
	[9217] = true, --"Spirestone Lord Magus",
	[21274] = true, --"Staff of Disintegration",
	[15929] = true, --"Stalagg",
	-- not found Steelbreaker = true, --"Steelbreaker",
	[14322] = true, --"Stomper Kreeg",
	[10809] = true, --"Stonespine",
	-- not found ["Stormcaller Brundir"] = true, --"Stormcaller Brundir",
	[17543] = true, --"Strawman",
	[12098] = true, --"Sulfuron Harbinger",
	[22898] = true, --"Supremus",
	[26668] = true, --"Svala Sorrowgrave",
	[17826] = true, --"Swamplord Musel'ek",
	[14890] = true, --"Taerar",
	-- hydross trash [22036] = true, --"Tainted Spawn of Hydross",
	[18473] = true, --"Talon King Ikiss",
	[11520] = true, --"Taragaman the Hungerer",
	[1696] = true, --"Targorr the Dread",
	[18343] = true, --"Tavarok",
	[6231] = true, --"Techbot",
	[17880] = true, --"Temporus",
	[11489] = true, --"Tendris Warpwood",
	[30452] = true, --"Tenebron",
	[15688] = true, --"Terestian Illhoof",
	[22871] = true, --"Teron Gorefiend",
	[15928] = true, --"Thaddius",
	[20064] = true, --"Thaladred the Darkener",
	[16064] = true, --"Thane Korth'azz",
	[10430] = true, --"The Beast",
	[17521] = true, --"The Big Bad Wolf",
	[17882] = true, --"The Black Stalker",
	-- not found ["The Blue Brothers"] = true, --"The Blue Brothers",
	-- not found ["The Bug Family"] = true, --"The Bug Family",
	[18168] = true, --"The Crone",
	[15691] = true, --"The Curator",
	-- not found ["The Eredar Twins"] = true, --"The Eredar Twins",
	-- not found ["The Four Horsemen"] = true, --"The Four Horsemen",
	[23426] = true, --"The Illidari Council",
	-- not found ["The Iron Council"] = true, --"The Iron Council",
	[7272] = true, --"Theka the Martyr",
	[21217] = true, --"The Lurker Below",
	[17381] = true, --"The Maker",
	[15263] = true, --"The Prophet Skeram",
	[26632] = true, --"The Prophet Tharon'ja",
	[27696] = true, --"The Prophet Tharon'ja",
	[10507] = true, --"The Ravenian",
	[11497] = true, --"The Razza",
	-- not found ["The Seven Dwarves"] = true, --"The Seven Dwarves",
	[28234] = true, --"The Tribunal of Ages",
	-- not found ["The Twin Emperors"] = true, --"The Twin Emperors",
	[10516] = true, --"The Unforgiven",
	[14454] = true, --"The Windreaver",
	-- friendly NPC Thorim = true, --"Thorim",
	[17978] = true, --"Thorngrin the Tender",
	-- Morogrim trash [21920] = true, --"Tidewalker Lurker",
	[10808] = true, --"Timmy the Cruel",
	[17547] = true, --"Tinhead",
	[13601] = true, --"Tinkerer Gizlock",
	[17548] = true, --"Tito",
	[3652] = true, --"Trigore the Lasher",
	[26630] = true, --"Trollgore",
	[11467] = true, --"Tsu'zee",
	[7355] = true, --"Tuten'kash",
	[4832] = true, --"Twilight Lord Kelris",
	[10584] = true, --"Urok Doomhowl",
	[13020] = true, --"Vaelastrasz the Corrupt",
	[27447] = true, --"Varos Cloudstrider",
	[17537] = true, --"Vazruden",
	[17307] = true, --"Vazruden the Herald",
	[10432] = true, --"Vectus",
	[15544] = true, --"Vem",
	[13738] = true, --"Veng",
	[22952] = true, --"Veras Darkshadow",
	[5775] = true, --"Verdan the Everliving",
	[9042] = true, --"Verek",
	[30449] = true, --"Vesperon",
	[24744] = true, --"Vexallus",
	[5399] = true, --"Veyzhak the Cannibal",
	[9036] = true, --"Vile'rel",
	[15299] = true, --"Viscidus",
	[7079] = true, --"Viscous Fallout",
	[19516] = true, --"Void Reaver",
	[28587] = true, --"Volkhan",
	[16809] = true, --"Warbringer O'mrogg",
	-- treated as pet ["Warchief Blackhand Piece"] = true, --"Warchief Blackhand Piece",
	[16808] = true, --"Warchief Kargath Bladefist",
	[10429] = true, --"Warchief Rend Blackhand",
	[20904] = true, --"Warden Mellichar",
	[9041] = true, --"Warder Stilgiss",
	[17798] = true, --"Warlord Kalithresh",
	[9237] = true, --"War Master Voone",
	[18402] = true, --"Warmaul Champion",
	[21272] = true, --"Warp Slicer",
	[17977] = true, --"Warp Splinter",
	[17306] = true, --"Watchkeeper Gargolmar",
	[5720] = true, --"Weaver",
	[7271] = true, --"Witch Doctor Zum'rah",
	[3927] = true, --"Wolf Master Nandos",
	[20886] = true, --"Wrath-Scryer Soccothrates",
	[15085] = true, --"Wushoolay",
	[29266] = true, --"Xevozz",
	-- not found ["XT-002 Deconstructor"] = true, --"XT-002 Deconstructor",
	[14887] = true, --"Ysondre",
	[5400] = true, --"Zekkis",
	[17830] = true, --"Zelemar the Wrathful",
	[20870] = true, --"Zereketh the Unbound",
	[10082] = true, --"Zerillis",
	[11490] = true, --"Zevrim Thornhoof",
	[5712] = true, --"Zolo",
	-- trash ["Zul'Farrak Dead Hero"] = true, --"Zul'Farrak Dead Hero",
	[23863] = true, --"Zul'jin",
	[5716] = true, --"Zul'Lor",
	[29314] = true, --"Zuramat the Obliterator",
}
]]

local bossIDs = BossIDs.BossIDs

function Recount.IsBoss(GUID)
   return GUID and bossIDs[tonumber(GUID:sub(9, 12), 16)]
end

	
-- Base Events: SWING ‚Äì These events relate to melee swings, commonly called ‚ÄúWhite Damage‚Äù. RANGE ‚Äì These events relate to hunters shooting their bow or a warlock shooting their wand. SPELL ‚Äì These events relate to spells and abilities. SPELL_CAST ‚Äì These events relate to spells starting and failing. SPELL_AURA ‚Äì These events relate to buffs and debuffs. SPELL_PERIODIC ‚Äì These events relate to HoT, DoTs and similar effects. DAMAGE_SHIELD ‚Äì These events relate to damage shields, such as Thorns ENCHANT ‚Äì These events relate to temporary and permanent item buffs. ENVIRONMENTAL ‚Äì This is any damage done by the world. Fires, Lava, Falling, etc.
-- Suffixes: _DAMAGE ‚Äì If the event resulted in damage, here it is. _MISSED - If the event resulted in failure, such as missing, resisting or being blocked. _HEAL ‚Äì If the event resulted in a heal. _ENERGIZE ‚Äì If the event resulted in a power restoration. _LEECH ‚Äì If the event transferred health or power. _DRAIN ‚Äì If the event reduces power, but did not transfer it.
-- Special Events: PARTY_KILL ‚Äì Fired when you or a party member kills something. UNIT_DIED ‚Äì Fired when any nearby unit dies. 

local SPELLSCHOOL_PHYSICAL = 1
local SPELLSCHOOL_HOLY = 2
local SPELLSCHOOL_FIRE = 4
local SPELLSCHOOL_NATURE = 8
local SPELLSCHOOL_FROST = 16
local SPELLSCHOOL_SHADOW = 32
local SPELLSCHOOL_ARCANE = 64

Recount.SpellSchoolName = {
	[SPELLSCHOOL_PHYSICAL] = "Physical",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_HOLY] = "Holy",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_FIRE] = "Fire",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_NATURE] = "Nature",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_FROST] = "Frost",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_SHADOW] = "Shadow",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[SPELLSCHOOL_ARCANE] = "Arcane",  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
}

local POWERTYPE_MANA = 0
local POWERTYPE_RAGE = 1
local POWERTYPE_FOCUS = 2
local POWERTYPE_ENERGY = 3
local POWERTYPE_HAPPINESS = 4;
local POWERTYPE_RUNES = 5;
local POWERTYPE_RUNIC_POWER = 6;

Recount.PowerTypeName = { -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	[POWERTYPE_MANA] = "Mana",
	[POWERTYPE_RAGE] = "Rage",
	[POWERTYPE_ENERGY] = "Energy",
	[POWERTYPE_FOCUS] = "Focus",
	[POWERTYPE_HAPPINESS] = "Happiness",
	[POWERTYPE_RUNES] = "Runes",
	[POWERTYPE_RUNIC_POWER] = "Runic Power",	
}

function Recount:MatchGUID(nName,nGUID,nFlags)
	if not Recount.PlayerName or not Recount.PlayerGUID then
		if bit_band(nFlags, LIB_FILTER_ME) == LIB_FILTER_ME then
			Recount.PlayerName = nName
			Recount.PlayerGUID = nGUID
			return
		end
	end
--[[
	if bit_band(nFlags,LIB_FILTER_MY_PET) == LIB_FILTER_MY_PET then
		if not Recount.PlayerPet or not Recount.PlayerPetGUID or nGUID~=Recount.PlayerPetGUID then
			--Recount:Print("NewPet detected: "..nName.." "..nGUID.."("..(Recount.PlayerPetGUID or "nil")..")")
			Recount.PlayerPetGUID = nGUID
			if Recount.PlayerPet ~= nName then
				Recount.PlayerPet = nName
			end
			return
		end
	end]]
end

function Recount:SwingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,amount, overkill,school, resisted, blocked, absorbed, critical, glancing, crushing)
	Recount:SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,0, L["Melee"], SPELLSCHOOL_PHYSICAL, amount, overkill,school, resisted, blocked, absorbed, critical, glancing, crushing)
end

function Recount:SpellBuildingDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)
-- Ignoring these for now
end

function Recount:SpellBuildingHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, overheal,critical)
-- Ignoring these for now
end

function Recount:SpellDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)

--	amount = amount - overkill -- Taking out overdamage on killing blows

	local HitType="Hit" -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
        local isDot
	if eventtype == "SPELL_PERIODIC_DAMAGE" then

		HitType="Tick"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
		spellName = spellName .." ("..L["DoT"]..")"
		isDot = true
	end
	if critical then
		HitType="Crit"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	if eventtype == "DAMAGE_SPLIT" then
		HitType="Split"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	if crushing then
		HitType="Crushing"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	if glancing	then
		HitType="Glancing"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
--[[	if blocked then
		HitType="Block"
	end
	if absorbed then
		HitType="Absorbed"
	end--]]
	if eventtype == "RANGE_DAMAGE" then spellSchool = school end

	Recount:AddDamageData(srcName, dstName, spellName, Recount.SpellSchoolName[spellSchool], HitType, amount, resisted, srcGUID, srcFlags, dstGUID, dstFlags, spellId, blocked, absorbed, isDot)
end

function Recount:EnvironmentalDamage(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,enviromentalType, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing)

	local HitType = "Hit"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	if critical then
		HitType="Crit"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	if crushing then
		HitType="Crushing"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	if glancing	then
		HitType="Glancing"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end
	--[[if blocked then
		HitType="Block"
	end
	if absorbed then
		HitType="Absorbed"
	end--]]

	Recount:AddDamageData("Environment", dstName, Recount:FixCaps(enviromentalType), Recount.SpellSchoolName[school], HitType, amount, resisted, srcGUID, 0, dstGUID, dstFlags, nil, blocked, absorbed)
end

function Recount:FixCaps(capsstr)
	if type(capsstr)=="string" then
		return string_upper(string_sub(capsstr,1,1))..string_lower(string_sub(capsstr,2))
	else
		return nil
	end
end

function Recount:SwingMissed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, missType, missAmount)
	
	Recount:AddDamageData(srcName, dstName, L["Melee"], nil, Recount:FixCaps(missType),nil,nil, srcGUID, srcFlags, dstGUID, dstFlags)  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
end

function Recount:SpellMissed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, missType, missAmount)

	Recount:AddDamageData(srcName, dstName, spellName, nil, Recount:FixCaps(missType),nil,nil, srcGUID, srcFlags, dstGUID, dstFlags, spellId)
end

function Recount:SpellHeal(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, overheal,critical)

	local healtype="Hit"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
        local isHot
	if eventtype == "SPELL_PERIODIC_HEAL" then
	   
		healtype="Tick"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	        isHot = true
		-- Not activated yet: spellName=spellName.." ("..L["HoT"]..")"
	end

	if critical then
		healtype="Crit"  -- Elsia: Do NOT localize this, it breaks functionality!!! If you need this localized contact me on WowAce or Curse.
	end

	Recount:AddHealData(srcName, dstName, spellName, healtype, amount,overheal, srcGUID,srcFlags,dstGUID,dstFlags,spellId,isHot)-- Elsia: Overheal missing!!!
end

function Recount:SpellEnergize(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, powerType)

	Recount:AddGain(dstName, srcName, spellName, amount, Recount.PowerTypeName[powerType], dstGUID, dstFlags, srcGUID, srcFlags, spellId)
end

local extraattacks

function Recount:SpellExtraAttacks(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount)
--[[	source = Recount.curr_srcName
	victim = Recount.curr_dstName

	local healtype="Hit"

	Recount:Print(Recount.curr_type.." "..spellName.." "..amount)
	Recount:AddDamageData(source, victim, spellName, Recount.SpellSchoolName[spellSchool], HitType, amount)--]]

	-- Elsia: Don't have use for extra attacks currently, amount is number of extra attacks it seems from combat log traces.
	
	extraattacks = extraattacks or {}
	if extraattacks[srcName] then
		Recount:DPrint("Double proc: "..spellName.." "..extraattacks[srcName].spellName)
	else
		extraattacks[srcName] = {}
		extraattacks[srcName].spellName = spellName
		extraattacks[srcName].amount = amount
		extraattacks[srcName].proctime = GetTime()
		Recount:DPrint("Proc: "..spellName.." "..extraattacks[srcName].spellName)
	end
end

function Recount:SpellInterrupt(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSpellSchool)

	if not spellName   then
		spellName = "Melee"
	end
	local ability = extraSpellName .. " (" .. spellName .. ")"
	Recount:AddInterruptData(srcName, dstName, ability, srcGUID, srcFlags, dstGUID, dstFlags, extraSpellId) -- Elsia: Keep both interrupting spell and interrupted spell
end

function Recount:SpellDrain(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, powerType, extraAmount)

-- Currently unused.
end

function Recount:SpellLeech(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, amount, powerType, extraAmount)
	Recount:AddGain(srcName, dstName, spellName, extraAmount, Recount.PowerTypeName[powerType], srcGUID, srcFlags, dstGUID, dstFlags, spellId)
end

function Recount:SpellAuraBroken(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSpellSchool)
	if not spellName then
		spellName = "Melee"
	end
	
	local ability
	if extraSpellName then 
	        ability = spellName .. " (" .. extraSpellName .. ")"
	else
		ability = spellName .." (Melee)"
	end

	if CCId[spellId] then
		Recount:AddCCBreaker(srcName, dstName, ability, srcGUID, srcFlags, dstGUID, dstFlags, extraSpellId)
	end
end

function Recount:SpellAuraDispelledStolen(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSpellSchool)

	if eventtype == "SPELL_DISPEL_FAILED" then
		return -- Not covering failures.
	end

	if not spellName then
		spellName = "Melee"
	end
	local ability = extraSpellName .. " (" .. spellName .. ")"

	Recount:AddDispelData(srcName, dstName, ability, srcGUID, srcFlags, dstGUID, dstFlags, extraSpellId)
end

function Recount:SpellAuraAppliedRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, auraType)

	-- Spirit of Redemption and Shadow of Death handling
	if eventtype == "SPELL_AURA_REMOVED" and (spellId == 54223 or spellId == 27827) then
		Recount:HandleDoubleDeath(srcName, dstName, spellName,srcGUID,srcFlags,dstGUID,dstFlags,spellId)		
	end
end

function Recount:SpellAuraAppliedRemovedDose(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, auraType, amount)
-- Not sure yet how to handle this

end

function Recount:SpellResurrect(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
			Recount:AddRes(srcName, dstName, spellName, srcGUID, srcFlags, dstGUID, dstFlags, spellId)
end

function Recount:SpellCastStartSuccess(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
	if eventtype == "SPELL_INSTAKILL" then
		--Recount:Print(Recount.curr_type .." "..source.." "..victim)
		Recount:AddDeathData(srcName, dstName, nil, srcGUID, srcFlags, dstGUID, dstFlags, spellId)
	end
end

-- Note: GetSpellLink(id) gets spell name from ID.
--  GetSpellInfo(id)

function Recount:SpellCastFailed(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool, failedType)
-- Not sure yet how to handle this, are these interrupts?
end

function Recount:EnchantAppliedRemoved(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellName, itemId, itemName)
-- Not sure yet how to handle this, 
end

function Recount:PartyKill(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags)
	--Recount:AddDeathData(srcName , dstName, nil, srcGUID, srcFlags, dstGUID, dstFlags, nil)
-- Could be killing blow tracker
end

function Recount:UnitDied(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags)
	Recount:AddDeathData(nil , dstName, nil, srcGUID, srcFlags, dstGUID, dstFlags, nil)
end

function Recount:SpellSummon(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
	Recount:AddPetCombatant(dstGUID,dstName,dstFlags,srcGUID,srcName,srcFlags)
end

function Recount:SpellCreate(timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags,spellId, spellName, spellSchool)
-- Elsia: We do nothing for these yet.
end

local EventParse =
{
	["SWING_DAMAGE"] = Recount.SwingDamage, -- Elsia: Melee swing damage
	["RANGE_DAMAGE"] = Recount.SpellDamage, -- Elsia: Ranged and spell damage types
	["SPELL_DAMAGE"] = Recount.SpellDamage,
	["SPELL_PERIODIC_DAMAGE"] = Recount.SpellDamage,
	["DAMAGE_SHIELD"] = Recount.SpellDamage,
	["DAMAGE_SPLIT"] = Recount.SpellDamage,
	["ENVIRONMENTAL_DAMAGE"] = Recount.EnvironmentalDamage, -- Elsia: Environmental damage
	["SWING_MISSED"] = Recount.SwingMissed, -- Elsia: Misses
	["RANGE_MISSED"] = Recount.SpellMissed,
	["SPELL_MISSED"] = Recount.SpellMissed,
	["SPELL_PERIODIC_MISSED"] = Recount.SpellMissed,
	["DAMAGE_SHIELD_MISSED"] = Recount.SpellMissed,
	["SPELL_HEAL"] = Recount.SpellHeal, -- Elsia: heals
	["SPELL_PERIODIC_HEAL"] = Recount.SpellHeal,
	["SPELL_ENERGIZE"] = Recount.SpellEnergize, -- Elsia: Energize
	["SPELL_PERIODIC_ENERGIZE"] = Recount.SpellEnergize,
	["SPELL_EXTRA_ATTACKS"] = Recount.SpellExtraAttacks, -- Elsia: Extra attacks
	["SPELL_INTERRUPT"] = Recount.SpellInterrupt, -- Elsia: Interrupts
	["SPELL_DRAIN"] = Recount.SpellDrain, -- Elsia: Drains and leeches.
	["SPELL_LEECH"] = Recount.SpellLeech,
	["SPELL_PERIODIC_DRAIN"] = Recount.SpellDrain,
	["SPELL_PERIODIC_LEECH"] = Recount.SpellLeech,
	["SPELL_DISPEL_FAILED"] = Recount.SpellAuraDispelledStolen, -- Elsia: Failed dispell
--	["SPELL_AURA_DISPELLED"] = Recount.SpellAuraDispelledStolen, -- Removed with 2.4.3
--	["SPELL_AURA_STOLEN"] = Recount.SpellAuraDispelledStolen, -- Removed with 2.4.3
	["SPELL_AURA_APPLIED"] = Recount.SpellAuraAppliedRemoved, -- Elsia: Auras
	["SPELL_AURA_REMOVED"] = Recount.SpellAuraAppliedRemoved,
	["SPELL_AURA_APPLIED_DOSE"] = Recount.SpellAuraAppliedRemovedDose, -- Elsia: Aura doses
	["SPELL_AURA_REMOVED_DOSE"] = Recount.SpellAuraAppliedRemovedDose,
	["SPELL_CAST_START"] = Recount.SpellCastStartSuccess, -- Elsia: Spell casts
	["SPELL_CAST_SUCCESS"] = Recount.SpellCastStartSuccess,
	["SPELL_INSTAKILL"] = Recount.SpellCastStartSuccess,
	["SPELL_DURABILITY_DAMAGE"] = Recount.SpellCastStartSuccess,
	["SPELL_DURABILITY_DAMAGE_ALL"] = Recount.SpellCastStartSuccess,
	["SPELL_CAST_FAILED"] = Recount.SpellCastFailed, -- Elsia: Spell aborts/fails
	["ENCHANT_APPLIED"] = Recount.EnchantAppliedRemoved, -- Elsia: Enchants
	["ENCHANT_REMOVED"] = Recount.EnchantAppliedRemoved,
	["PARTY_KILL"] = Recount.PartyKill, -- Elsia: Party killing blow
	["UNIT_DIED"] = Recount.UnitDied, -- Elsia: Unit died
	["UNIT_DESTROYED"] = Recount.UnitDied,
	["SPELL_SUMMON"] = Recount.SpellSummon, -- Elsia: Summons
	["SPELL_CREATE"] = Recount.SpellCreate, -- Elsia: Creations
	["SPELL_AURA_BROKEN"] = Recount.SpellAuraBroken, -- New with 2.4.3
	["SPELL_AURA_BROKEN_SPELL"] = Recount.SpellAuraBroken, -- New with 2.4.3
	["SPELL_AURA_REFRESH"] = Recount.SpellAuraAppliedRemoved, -- New with 2.4.3
	["SPELL_DISPEL"] = Recount.SpellAuraDispelledStolen, -- Post 2.4.3
	["SPELL_STOLEN"] = Recount.SpellAuraDispelledStolen, -- Post 2.4.3
	["SPELL_RESURRECT"] = Recount.SpellResurrect, -- Post WotLK
	["SPELL_BUILDING_DAMAGE"] = Recount.SpellBuildingDamage, -- Post WotLK
	["SPELL_BUILDING_HEAL"] = Recount.SpellBuildingHeal
}

local QuickExitEvents =
{
	["SPELL_AURA_APPLIED"] = true,
--	["SPELL_AURA_REMOVED"] = true,
	["SPELL_AURA_APPLIED_DOSE"] = true,
	["SPELL_AURA_REMOVED_DOSE"] = true,
	["SPELL_AURA_REFRESH"] = true,
	["SPELL_CAST_START"] = true,
	["SPELL_CAST_SUCCESS"] = true,
	["SPELL_CAST_FAILED"] = true,
	["SPELL_DRAIN"] = true, 
--	["SPELL_LEECH"] = true, 
	["PARTY_KILL"] = true,
	["SPELL_PERIODIC_DRAIN"] = true, 
--	["SPELL_PERIODIC_LEECH"] = true, 
	["SPELL_DISPEL_FAILED"] = true,
	["SPELL_DURABILITY_DAMAGE"] = true,
	["SPELL_DURABILITY_DAMAGE_ALL"] = true,
	["ENCHANT_APPLIED"] = true,
	["ENCHANT_REMOVED"] = true,
	["SPELL_CREATE"] = true,
	["SPELL_BUILDING_DAMAGE"] = true,
}


local GROUPED_FILTER_BITMASK = COMBATLOG_OBJECT_AFFILIATION_MINE+COMBATLOG_OBJECT_AFFILIATION_PARTY+COMBATLOG_OBJECT_AFFILIATION_RAID
local SELF_FILTER_BITMASK = COMBATLOG_OBJECT_AFFILIATION_MINE+COMBATLOG_OBJECT_TYPE_PLAYER
local UNGROUPED_FILTER_BITMASK = COMBATLOG_OBJECT_TYPE_PLAYER+COMBATLOG_OBJECT_REACTION_FRIENDLY
local PET_FILTER_BITMASK = COMBATLOG_OBJECT_TYPE_PET+COMBATLOG_OBJECT_TYPE_GUARDIAN
local GROUPED_PET_FILTER_BITMASK = COMBATLOG_OBJECT_AFFILIATION_PARTY+COMBATLOG_OBJECT_AFFILIATION_RAID
local UNGROUPED_PET_FILTER_BITMASK = COMBATLOG_OBJECT_AFFILIATION_OUTSIDER+COMBATLOG_OBJECT_REACTION_FRIENDLY

function Recount:CheckRetentionFromFlags(nameFlags,name,nameGUID)

  local filters = Recount.db.profile.Filters.Data

  if filters["Grouped"] and bit_band(nameFlags, GROUPED_FILTER_BITMASK) ~= 0 then

    return true -- Grouped

  elseif filters["Self"] and bit_band(nameFlags, SELF_FILTER_BITMASK) == SELF_FILTER_BITMASK then

    return true -- Self

  elseif filters["Ungrouped"] and bit_band(nameFlags, UNGROUPED_FILTER_BITMASK) == UNGROUPED_FILTER_BITMASK then

    return true -- Ungrouped

  elseif filters["Hostile"] and bit_band(nameFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) ~=0 then

    return true

  elseif filters["Pet"] and bit_band(nameFlags, PET_FILTER_BITMASK) ~=0 then

    if filters["Self"] and bit_band(nameFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~=0 then

      return true

    elseif filters["Grouped"] and  bit_band(nameFlags, GROUPED_PET_FILTER_BITMASK) ~=0 then

      return true

    elseif filters["Ungrouped"] and bit_band(nameFlags, UNGROUPED_PET_FILTER_BITMASK) == UNGROUPED_PET_FILTER_BITMASK then

      return true

	elseif bit_band(nameFlags, COMBATLOG_OBJECT_TYPE_GUARDIAN)~=0 and Recount:GetGuardianOwnerByGUID(nameGUID) then -- This is necessary because guardian combat log flags can be wrong in 3.0.9

	  return true

    end

  elseif bit_band(nameFlags, COMBATLOG_OBJECT_CONTROL_NPC) ~=0 then 

     local isBoss = Recount.IsBoss(nameGUID) 

     if not isBoss and (filters["Trivial"] or filters["Nontrivial"]) then

        return true

     elseif isBoss and filters["Boss"] then

        return true

     end

  end

  return false

end

local srcRetention
local dstRetention
local parsefunc
function Recount:CombatLogEvent(_,timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
	if not Recount.db.profile.GlobalDataCollect or not Recount.CurrentDataCollect then
		return
	end

	if QuickExitEvents[eventtype] then -- Counter bursty combat log events we don't care about.
		return
	end
	
	srcRetention = Recount:CheckRetentionFromFlags(srcFlags,srcName,srcGUID)
	dstRetention = Recount:CheckRetentionFromFlags(dstFlags,dstName,dstGUID)
 	
	if not srcRetention and not dstRetention then
		return
	end

	if srcName == nil then
		srcName = "No One"
	else
		Recount:MatchGUID(srcName,srcGUID,srcFlags)
	end
	if dstName == nil then
		dstName = "No One"
	else
		Recount:MatchGUID(dstName,dstGUID,dstFlags)
	end

	parsefunc = EventParse[eventtype]
	
	if parsefunc then
		parsefunc(self, timestamp, eventtype, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
	else
		Recount:Print("Unknown combat log event type: "..eventtype)
	end
end

function Recount:SetActive(who)
	if not who then return end

	who.LastActive=Recount.CurTime
end

local eventtime
local Adding
function Recount:AddTimeEvent(who, onWho, ability, friendly)

	if not who then return end

	eventtime=GetTime()
	who.LastAbility = who.LastAbility or 0
	Adding=eventtime-who.LastAbility
	
	who.LastAbility=eventtime
	
	if Adding>3.5 then
		Adding=3.5
	end

	Adding=math_floor(100*Adding+0.5)/100

	Recount:AddOwnerPetLazySyncAmount(who,"ActiveTime", Adding)
	--Recount:AddSyncAmount(who,"ActiveTime", Adding)
	

	Recount:AddAmount(who,"ActiveTime",Adding)
	Recount:AddTableDataSum(who,"TimeSpent",onWho,ability,Adding)

	if friendly then
		Recount:AddAmount(who,"TimeHeal",Adding)
		Recount:AddTableDataSum(who,"TimeHealing",onWho,ability,Adding)
	else
		Recount:AddAmount(who,"TimeDamage",Adding)
		Recount:AddTableDataSum(who,"TimeDamaging",onWho,ability,Adding)
	end
end


--Only care about event tracking for those we want to track deaths for
function Recount:AddCurrentEvent(who, eventType, incoming, number, event)
	if not who then return end
	if Recount.db.profile.Filters.TrackDeaths[who.type] then
		who.LastEvents = who.LastEvents or {}
		who.LastEventTimes = who.LastEventTimes or {}
		who.LastEventType = who.LastEventType or {}
		who.LastEventIncoming = who.LastEventIncoming or {}
		who.NextEventNum = who.NextEventNum or 1
		who.LastEventTimes[who.NextEventNum]=GetTime()
		who.LastEventType[who.NextEventNum]=eventType
		who.LastEventIncoming[who.NextEventNum]=incoming
		who.LastEvents[who.NextEventNum]=event --(eventType or "").." "..(abiliy or "").." "..(number or "")

		if (not who.unit) or (UnitName(who.unit)~=who.Name) and who.UnitLockout<Recount.UnitLockout then
			who.unit=Recount:FindUnit(who.Name)
			who.UnitLockout=Recount.CurTime
		end
		
		if who.unit then
			if UnitHealthMax(who.unit)~=100 then
				who.LastEventHealth = who.LastEventHealth or {}
				who.LastEventHealth[who.NextEventNum]=UnitHealth(who.unit).." ("..math_floor(100*UnitHealth(who.unit)/UnitHealthMax(who.unit)).."%)"
				if number then
					who.LastEventNum = who.LastEventNum or {}
					who.LastEventNum[who.NextEventNum]=100*number/UnitHealthMax(who.unit)
				elseif who.LastEventNum then
					who.LastEventNum[who.NextEventNum]=nil
				end
			else
				who.LastEventHealth = who.LastEventHealth or {}
				who.LastEventHealth[who.NextEventNum]=UnitHealth(who.unit).."%"
				if who.LastEventNum then
					who.LastEventNum[who.NextEventNum]=nil
				end
			end
			who.LastEventHealthNum = who.LastEventHealthNum or {}
			who.LastEventHealthNum[who.NextEventNum]=100*UnitHealth(who.unit)/UnitHealthMax(who.unit)
		else
			who.LastEventHealth = who.LastEventHealth or {}
			who.LastEventHealthNum = who.LastEventHealthNum or {}
			who.LastEventHealth[who.NextEventNum]="???"
			who.LastEventHealthNum[who.NextEventNum]=0
			if who.LastEventNum then
				who.LastEventNum[who.NextEventNum]=nil
			end
		end		
		
		who.NextEventNum=who.NextEventNum+1

		if who.NextEventNum>Recount.db.profile.MessagesTracked then
			who.NextEventNum=who.NextEventNum-Recount.db.profile.MessagesTracked
		end
	end
end

--Functions for adding data 

function Recount:AddAmount(who,datatype,amount)
	if not who then return end
	if not Recount.db.profile.Filters.Data[who.type] or not Recount.db.profile.GlobalDataCollect or not Recount.CurrentDataCollect then
		return
	end

	Recount.NewData = true -- Inform MainWindow that we got new data stored.

	--We add the data to both overall & current fight data
	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or 0
	who.Fights.OverallData[datatype]=who.Fights.OverallData[datatype]+amount
	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or 0
	who.Fights.CurrentFightData[datatype]=who.Fights.CurrentFightData[datatype]+amount

	--Now add the time data
--	if who.TimeWindows[datatype] then
	who.TimeWindows = who.TimeWindows or {}
	who.TimeWindows[datatype] = who.TimeWindows[datatype] or {}
	who.TimeWindows[datatype][Recount.TimeStep] = who.TimeWindows[datatype][Recount.TimeStep] or 0
	who.TimeWindows[datatype][Recount.TimeStep]=who.TimeWindows[datatype][Recount.TimeStep]+amount

	who.TimeLast = who.TimeLast or {}
	who.TimeLast[datatype]=Recount.CurTime
	who.TimeLast["OVERALL"]=Recount.CurTime
--	end
end

--Meant for like elemental data and this type isn't expected to be initialized 
function Recount:AddAmount2(who,datatype,secondary,amount)
	if not who then return end
	if not Recount.db.profile.Filters.Data[who.type]  or not Recount.db.profile.GlobalDataCollect or not Recount.CurrentDataCollect then
		return
	end
	if not secondary then
		Recount:DPrint("Empty secondary: "..datatype)
		return
	end
	
	--We add the data to both overall & current fight data
	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or {}
	who.Fights.OverallData[datatype][secondary]=(who.Fights.OverallData[datatype][secondary] or 0)+amount
	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or {}
	who.Fights.CurrentFightData[datatype][secondary]=(who.Fights.CurrentFightData[datatype][secondary] or 0)+amount
end

--Two Different Types of table functions
--First type tracks min/max & count while the other only counts the total sum in the count column
local CurTable
local Details
function Recount:AddTableDataStats(who,datatype,secondary,detailtype,amount)
	if not who then return end
	if not Recount.db.profile.Filters.Data[who.type] or not Recount.db.profile.GlobalDataCollect or not Recount.CurrentDataCollect then
		return
	end

	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or {}
	CurTable=who.Fights.OverallData[datatype][secondary]

	if type(CurTable)~="table" then
		who.Fights.OverallData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.OverallData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end	

	CurTable.count=CurTable.count+1
	CurTable.amount=CurTable.amount+amount

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
		CurTable.Details[detailtype].amount=0
	end
	Details=CurTable.Details[detailtype]

	Details.count=Details.count+1
	Details.amount=Details.amount+amount

	if Details.max then
		if amount>Details.max then
			Details.max=amount
		elseif amount<Details.min then
			Details.min=amount
		end
	else--If no max has been set time to initialize
		Details.max=amount
		Details.min=amount
	end
	
	--[[if type(who.Fights.CurrentFightData[datatype])~="table" then
		who.Fights.CurrentFightData[datatype]=Recount:GetTable()
	end]]
	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or {}
	CurTable=who.Fights.CurrentFightData[datatype][secondary]
	--Now for the current fight data
	if type(CurTable)~="table" then
		who.Fights.CurrentFightData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.CurrentFightData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end

	

	CurTable.count=CurTable.count+1
	CurTable.amount=CurTable.amount+amount

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
		CurTable.Details[detailtype].amount=0
	end
	Details=CurTable.Details[detailtype]

	Details.count=Details.count+1
	Details.amount=Details.amount+amount

	if Details.max then
		if amount>Details.max then
			Details.max=amount
		elseif amount<Details.min then
			Details.min=amount
		end
	else--If no max has been set time to initialize
		Details.max=amount
		Details.min=amount
	end
end
local first=false
function Recount:CorrectTableData(who,datatype,secondary,amount)
	if not who then return end
	if not Recount.db.profile.Filters.Data[who.type]   or Recount.db.profile.GlobalDataCollect == false  or not Recount.CurrentDataCollect then
		return
	end

	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or {}
	CurTable=who.Fights.OverallData[datatype][secondary]

	if type(CurTable)~="table" then
		who.Fights.OverallData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.OverallData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end	
--[[	if not CurTable.count and not first then
		Recount:Print(datatype,secondary,amount)
		Recount:Print(debugstack())
	end]]
	if CurTable.count then
		CurTable.count=CurTable.count-1
	end
	CurTable.amount=CurTable.amount-amount

	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or {}
	CurTable=who.Fights.CurrentFightData[datatype][secondary]
	--Now for the current fight data
	if type(CurTable)~="table" then
		who.Fights.CurrentFightData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.CurrentFightData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end

	
	if CurTable.count then
		CurTable.count=CurTable.count-1
	end
	CurTable.amount=CurTable.amount-amount
end



function Recount:AddTableDataStatsNoAmount(who,datatype,secondary,detailtype)
	if not who then return end
	if not Recount.db.profile.Filters.Data[who.type] or not Recount.db.profile.GlobalDataCollect or not Recount.CurrentDataCollect then
		return
	end

	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or {}
	CurTable=who.Fights.OverallData[datatype][secondary]

	if type(CurTable)~="table" then
		who.Fights.OverallData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.OverallData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end


	
	CurTable.count=CurTable.count+1

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
		CurTable.Details[detailtype].amount=0
	end
	Details=CurTable.Details[detailtype]

	Details.count=Details.count+1

	--Now for the current fight data
	--[[if type(who.Fights.CurrentFightData[datatype])~="table" then
		who.Fights.CurrentFightData[datatype]=Recount:GetTable()
	end]]
	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or {}
	CurTable=who.Fights.CurrentFightData[datatype][secondary]
	if type(CurTable)~="table" then
		who.Fights.CurrentFightData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.CurrentFightData[datatype][secondary]
		CurTable.count=0
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end



	CurTable.count=CurTable.count+1

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
		CurTable.Details[detailtype].amount=0
	end
	Details=CurTable.Details[detailtype]

	Details.count=Details.count+1
end

function Recount:AddTableDataSum(who,datatype,secondary,detailtype,amount)
	if not who then return end
	if (not Recount.db.profile.Filters.Data[who.type]) or not Recount.db.profile.GlobalDataCollect  or not Recount.CurrentDataCollect then
		--Have to make sure this won't be used by something that needs to have data recorded for it
		
		if dbCombatants[secondary] then
			if not Recount.db.profile.Filters.Data[dbCombatants[secondary].type] or Recount.db.profile.GlobalDataCollect == false then
				return
			end
		else		
			return
		end
	end

	who.Fights = who.Fights or {}
	who.Fights.OverallData = who.Fights.OverallData or {}
	who.Fights.OverallData[datatype] = who.Fights.OverallData[datatype] or {}
	
	CurTable=who.Fights.OverallData[datatype][secondary]
	if type(CurTable)~="table" then
		who.Fights.OverallData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.OverallData[datatype][secondary]
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end

	CurTable.amount=(CurTable.amount or 0)+amount

	if detailtype == nil then
		Recount:DPrint("DEBUG at: ".. (who or "nil").." "..(datatype or "nil").." ".. (secondary or "nil"))
	end

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
	end

	Details=CurTable.Details[detailtype]
	Details.count=Details.count+amount

	--Now for the current fight data
	--[[if type(who.Fights.CurrentFightData[datatype])~="table" then
		who.Fights.CurrentFightData[datatype]=Recount:GetTable()
	end]]
	who.Fights.CurrentFightData = who.Fights.CurrentFightData or {}
	who.Fights.CurrentFightData[datatype] = who.Fights.CurrentFightData[datatype] or {}
	CurTable=who.Fights.CurrentFightData[datatype][secondary]

	if type(CurTable)~="table" then
		who.Fights.CurrentFightData[datatype][secondary]=Recount:GetTable()
		CurTable=who.Fights.CurrentFightData[datatype][secondary]
		CurTable.amount=0
		CurTable.Details=Recount:GetTable()
	end

	CurTable.amount=(CurTable.amount or 0)+amount

	if type(CurTable.Details[detailtype])~="table" then
		CurTable.Details[detailtype]=Recount:GetTable()
		CurTable.Details[detailtype].count=0
	end

	Details=CurTable.Details[detailtype]

	Details.count=Details.count+amount
end

-- Elsia: Borrowed shamelessly from Threat-2.0
function Recount:NPCID(guid)
	return tonumber(guid:sub(-12,-7),16)
end

function Recount:DetectPet(name, nGUID, nFlags)
	local ownerID
	local owner
	local petName
	
	petName, owner = name:match("(.-) <(.*)>")
	
	if not petName then
		petName = name
	else
		name = petName
	end
	
	if nFlags and bit_band(nFlags, COMBATLOG_OBJECT_TYPE_PET+COMBATLOG_OBJECT_TYPE_GUARDIAN)~=0 then
		if bit_band(nFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~=0 then
			name = name.." <"..Recount.PlayerName..">"
			owner = Recount.PlayerName -- Elsia: Fix up so that owner properly gets set
			ownerID = Recount.PlayerGUID
			if bit_band(nFlags, COMBATLOG_OBJECT_TYPE_PET) ~=0 then
--				Recount.PlayerPetGUID = nGUID
			else -- Guardians
				Recount.LatestGuardian = Recount.LatestGuardian + 1
				Recount.GuardiansGUIDs[Recount.LatestGuardian]=nGUID
				if Recount.LatestGuardian > 20 then -- Elsia: Max guardians set to 20 for now
					Recount.LatestGuardian = 0
				end
--[[				if Recount.NPCID then
					local npcid = Recount:NPCID(nGUID) -- Elsia: 15438 and 15352 are mobids of shaman's greater elementals
					if (npcid == 15438 or npcid == 15352) and (not dbCombatants[name] or dbCombatants[name].GUID ~= nGUID) then -- Elsia: Only Sync new elementals
						Recount:AnnouncePetGUID(owner,petName,nGUID)
					end
				end]]
			end
		elseif bit_band(nFlags, COMBATLOG_OBJECT_AFFILIATION_PARTY+COMBATLOG_OBJECT_AFFILIATION_RAID)~=0 then
			if nFlags and bit_band(nFlags, COMBATLOG_OBJECT_TYPE_PET)~=0 then
				owner, ownerID = Recount:FindOwnerPetFromGUID(name,nGUID)
			
				if owner then
					name=name.." <"..owner..">"
				else
				   Recount:DPrint("NoOwner: "..name.." "..(nGUID or "nil"))
				end
			elseif nFlags and bit_band(nFlags, COMBATLOG_OBJECT_TYPE_GUARDIAN)~=0 then
				owner = Recount:GetGuardianOwnerByGUID(nGUID)
				ownerID = owner and dbCombatants[owner] and dbCombatants[owner].GUID
				if owner then name = name.." <"..owner..">" end
				--Recount:DPrint("Party guardian: "..name.." "..(nGUID or "nil").." "..(owner or "nil").." "..(ownerID or "nil"))
			end
		elseif nFlags and bit_band(nFlags, COMBATLOG_OBJECT_TYPE_GUARDIAN)~=0 then
			petName = Recount:GetGuardianOwnerByGUID(nameGUID)
			if petName then
				petName, owner = petName:match("(.-) <(.*)>")
			end
		end
	end
	return name, owner, ownerID
end

function Recount:BossFightWho(srcFlags,dstFlags,victimData, victim)
	if Recount:InGroup(srcFlags) and not Recount:IsFriend(dstFlags) then
		if not victimData.level then
			--Recount:Print(victimData.Name.." lacks level, please report") -- This happens for freezing traps intriguingly enough
			victimData.level = 1
		end
		if (victimData.level==-1) or ((Recount.FightingLevel~=-1) and (victimData.level>Recount.FightingLevel)) then
			Recount.FightingWho=victim
			Recount.FightingLevel=victimData.level
		end
	end
end

function Recount:BossFightWhoFromFlags(srcFlags, dstFlags, victim, victimGUID)
	if Recount:InGroup(srcFlags) and not Recount:IsFriend(dstFlags) then
	   if Recount.IsBoss(victimGUID) then 
	      Recount.FightingWho = victim
	      Recount.FightingLevel = -1
	   elseif Recount.FightingWho=="" then
	      Recount.FightingWho = victim
	      Recount.FightingLevel = 1
	   end
	end
end

local dottime -- Duration of a dot
local DPass -- nil or damage to record
function Recount:AddDamageData(source, victim, ability, element, hittype, damage, resist, srcGUID, srcFlags, dstGUID, dstFlags, spellId, blocked, absorbed, isDot)

	--Is this friendly fire?
	local FriendlyFire = Recount:IsFriendlyFire(srcFlags,dstFlags)
	
	--Before any further processing need to check if we are going to be placed in combat or in combat 
	if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
		if (not FriendlyFire) and (Recount:InGroup(srcFlags) or Recount:InGroup(dstFlags)) then
			Recount:PutInCombat()
		end
	end

	-- Name and ID of pet owners
	local sourceowner
	local sourceownerID
	local victimowner
	local victimownerID

	source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)

	-- Extra attack handling
	if extraattacks and extraattacks[source] and not extraattacks[source].ability then
		Recount:DPrint("Proc ability: "..ability)
		extraattacks[source].ability = ability
	elseif extraattacks and extraattacks[source] and extraattacks[source].ability and ability==L["Melee"] then
		if extraattacks[source].proctime < GetTime()-5 then -- This is an outdated proc of which we never saw damage contributions. Timeout at 5 seconds
			extraattacks[source] = nil
		else
			Recount:DPrint("Damage proc: "..ability.." "..extraattacks[source].spellName.." "..(damage or "0"))
			ability = extraattacks[source].ability .. " ("..extraattacks[source].spellName..")"
			extraattacks[source].amount = extraattacks[source].amount - 1
			if extraattacks[source].amount == 0 then
				extraattacks[source] = nil
			end
		end
	end

	-- Death log entry text
	Recount.cleventtext = source.." "..ability.." "..victim.." "..hittype
	if damage then
		Recount.cleventtext = Recount.cleventtext.." -"..damage
	end
	if resist and resist > 0 then
		Recount.cleventtext = Recount.cleventtext .." ("..resist..L[" resisted"]..")"
	end
	if element then
		Recount.cleventtext = Recount.cleventtext.." ("..element..")"
	end

	if srcRetention then
		if not dbCombatants[source] then
			Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags, sourceownerID)
		end
	

		-- Reference to combatant data
		local sourceData=dbCombatants[source]

		if sourceData then
		
			Recount:SetActive(sourceData)
			--Need to add events for potential deaths
			Recount:AddCurrentEvent(sourceData, "DAMAGE", false, nil,Recount.cleventtext)

			--Fight tracking purposes to speed up leaving combat
			sourceData.LastFightIn=Recount.db2.FightNum
			--Melee is always considered Melee since its handled differently from specials keep it seperate
			if ability==L["Melee"] then
				element="Melee"
			end
			--Need to set the source as active
			Recount:AddTimeEvent(sourceData,victim,ability,false)
			--Stats for keeping track of DOT Uptime
			if isDot or hittype=="Tick" then
				--3 is default time since most abilities have 3 seconds inbetween ticks

				dottime = DotTickTimeId[spellId] or 3
				Recount:AddAmount(sourceData,"DOT_Time",dottime)
				Recount:AddTableDataSum(sourceData,"DOTs",ability,victim,dottime)
			end
			if damage then
				--Record the element type
--			sourceData.AbilityType = sourceData.AbilityType or {}
--			sourceData.AbilityType[ability]=element
					
				--Alright now if there was a friendly damage done or not decides where this data goes for the source
				if not FriendlyFire then
					Recount:AddOwnerPetLazySyncAmount(sourceData,"Damage", damage)
					--Recount:AddSyncAmount(sourceData, "Damage", damage)
					Recount:AddAmount(sourceData,"Damage",damage)	
					Recount:AddTableDataStats(sourceData,"Attacks",ability,hittype,damage)
					Recount:AddAmount2(sourceData,"ElementDone",element,damage)
				else
					--Recount:AddOwnerPetLazySyncAmount(sourceData,"FDamage", damage) -- We don't currently sync friendly damage
					--Recount:AddSyncAmount(sourceData, "FDamage", damage)
					Recount:AddAmount(sourceData,"FDamage",damage)
					Recount:AddTableDataStats(sourceData,"FAttacks",ability,hittype,damage)
					Recount:AddTableDataSum(sourceData,"FDamagedWho",victim,ability,damage)
					return
				end

				-- Elsia: Moved this out because we want this recorded regardless whether it was friendly damage or not
				-- Elsia: Also removed bug, victims resist/block/absorb!
				if resist then
					Recount:AddAmount2(sourceData,"ElementDoneResist",element,resist)
				end

				if blocked then
					Recount:AddAmount2(sourceData,"ElementDoneBlock",element,blocked)
				end
					
				if absorbed then
					Recount:AddAmount2(sourceData,"ElementDoneAbsorb",element,absorbed)
				end
					
				Recount:AddTableDataSum(sourceData,"DamagedWho",victim,ability,damage)	
			else
				Recount:AddTableDataStatsNoAmount(sourceData,"Attacks",ability,hittype)
			end

			--Needs to be here for tracking so we don't add Friendly Damage as well
			if Tracking["DAMAGE"] then
				if Tracking["DAMAGE"][source] then
					for _, v in pairs(Tracking["DAMAGE"][source]) do
						v.func(v.pass,damage)
					end
				end

				if Recount:InGroup(srcFlags) and Tracking["DAMAGE"]["!RAID"] then
					for _, v in pairs(Tracking["DAMAGE"]["!RAID"]) do
						v.func(v.pass,damage)
					end
				end
			end
		

			Recount:BossFightWho(dstFlags,srcFlags,sourceData,source)

			if element then
				Recount:AddTableDataSum(sourceData,"ElementHitsDone",element,hittype,1)
			end	
		     end
		  else
		     Recount:BossFightWhoFromFlags(dstFlags,srcFlags,source,srcGUID)
	end
		
	if dstRetention then
		if not dbCombatants[victim] then
			Recount:AddCombatant(victim,victimowner,dstGUID,dstFlags, victimownerID)
		end

		-- Reference to combatant data
		local victimData=dbCombatants[victim]

		if victimData then
			
			Recount:SetActive(victimData)
			--Need to add events for potential deaths
			DPass=damage
			if DPass==0 then
				DPass=nil
			end
			Recount:AddCurrentEvent(victimData, "DAMAGE", true, DPass, Recount.cleventtext)

			--Fight tracking purposes to speed up leaving combat
			victimData.LastFightIn=Recount.db2.FightNum
			--Melee is always considered Melee since its handled differently from specials keep it seperate
			if ability==L["Melee"] then
				element="Melee"
			end

			if damage then
				--Victim always cares
				Recount:AddAmount(victimData,"DamageTaken",damage)		
				Recount:AddTableDataSum(victimData,"WhoDamaged",source,ability,damage)	

				--Sync Data
				Recount:AddOwnerPetLazySyncAmount(victimData,"DamageTaken", damage)
				--Recount:AddSyncAmount(victimData, "DamageTaken", damage)

				Recount:AddAmount2(victimData,"ElementTaken",element,damage)
				
				if resist then -- Elsia: Fixed bug, source has to "take" resists, blocks and absorbs.
					if hittype=="Crit" then
						resist=resist*2
					end
					Recount:AddAmount2(victimData,"ElementTakenResist",element,resist)
					if resist<(damage/2.5) then
						--25% Resist
						Recount:AddTableDataStats(victimData,"PartialResist",ability,"25%"..L["Resist"],resist)
					elseif resist<(1.25*damage) then
						--50% Resist
						Recount:AddTableDataStats(victimData,"PartialResist",ability,"50%"..L["Resist"],resist)
					else
						--75% Resist
						Recount:AddTableDataStats(victimData,"PartialResist",ability,"75%"..L["Resist"],resist)
					end
				else
					Recount:AddTableDataStats(victimData,"PartialResist",ability,L["No Resist"],0)
				end
				
				if blocked or hittype=="Block" then
					Recount:AddAmount2(victimData,"ElementTakenBlock",element,blocked)
					if blocked then
						Recount:AddTableDataStats(victimData,"PartialBlock",ability,L["Blocked"],blocked)
					else
						Recount:AddTableDataStats(victimData,"PartialBlock",ability,L["No Block"],0)
					end
				end
				
				if absorbed then
					Recount:AddAmount2(victimData,"ElementTakenAbsorb",element,absorbed)
					Recount:AddTableDataStats(victimData,"PartialAbsorb",ability,L["Absorbed"],absorbed)
				else
					Recount:AddTableDataStats(victimData,"PartialAbsorb",ability,L["No Absorb"],0)
				end
				-- Elsia: Moved this out because we want this recorded regardless whether it was friendly damage or not
				-- Elsia: Also removed bug, victims resist/block/absorb!

				--For identifying who killed when no message is triggered
				victimData.LastAttackedBy=source
				victimData.LastDamageTaken=damage
				victimData.LastDamageAbility=ability
			end

			--Tracking for passing data to other functions	
			if Tracking["DAMAGETAKEN"] then 
				if Tracking["DAMAGETAKEN"][victim] then
					for _, v in pairs(Tracking["DAMAGETAKEN"][victim]) do
						v.func(v.pass,damage)
					end
				end

				if Recount:InGroup(dstFlags) and Tracking["DAMAGETAKEN"]["!RAID"] then
					for _, v in pairs(Tracking["DAMAGETAKEN"]["!RAID"]) do
						v.func(v.pass,damage)
					end
				end
			end

			Recount:BossFightWho(srcFlags,dstFlags,victimData, victim)
			
			if element then
				Recount:AddTableDataSum(victimData,"ElementHitsTaken",element,hittype,1)
			end	
		end
	else
		     Recount:BossFightWhoFromFlags(srcFlags,dstFlags,victim,dstGUID)
	end

end

function Recount:AddHealData(source, victim, ability, healtype, amount, overheal,srcGUID,srcFlags,dstGUID,dstFlags,spellId,isHot)
   --First lets figure if there was overhealing
   --Get the tables	
   -- Name and ID of pet owners
   local sourceowner
   local sourceownerID
   local victimowner
   local victimownerID
   
   source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
   
   victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)
   
   Recount.cleventtext = source.." "..ability.." "..victim
   if healtype then
      Recount.cleventtext = Recount.cleventtext.." "..healtype
   end
   if amount then
      Recount.cleventtext = Recount.cleventtext.." +"..amount
   end
   
   if overheal and overheal ~= 0 then 
      Recount.cleventtext = Recount.cleventtext .." ("..overheal..L[" overheal"]..")"
   end

   local sourceData

   if srcRetention then
      if not dbCombatants[source] then
		Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags,sourceownerID)
      end
      
      sourceData=dbCombatants[source]
      if sourceData then
	 Recount:SetActive(sourceData)
	 
	 --Need to add events for potential deaths
	 if source~=victim then
		Recount:AddCurrentEvent(sourceData, "HEAL", false, nil,Recount.cleventtext)
	 end	 
      end
   end
   
   local victimData
   if dstRetention then
      if not dbCombatants[victim] then
	 Recount:AddCombatant(victim,victimowner,dstGUID,dstFlags, victimownerID) -- Elsia: Bug, owner was missing here
      end
      victimData=dbCombatants[victim]
      if victimData then
	 
	 Recount:SetActive(victimData)
	 --Need to add events for potential deaths
	 Recount:AddCurrentEvent(victimData, "HEAL", true, amount,Recount.cleventtext)
      end

      --Before any further processing need to check if we are in combat 
      if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
	 return
      end
   end
      --Fight tracking purposes to speed up leaving combat
      
      --if not sourceData then Recount:DPrint("Source-less heal: "..(ability or "nil")..(source or "nil").." "..(victim or "nil").." Please report!") end
      
   if overheal == nil then
      overheal=0
   elseif  overheal > 0 then
      amount = amount - overheal
   end
      
   if srcRetention and sourceData then
	 
      sourceData.LastFightIn=Recount.db2.FightNum
      
      Recount:AddOwnerPetLazySyncAmount(sourceData,"Healing", amount)
      Recount:AddOwnerPetLazySyncAmount(sourceData,"Overhealing", overheal)
      
      
      --Tracking for passing data to other functions
      if Tracking["HEALING"] then
	 if Tracking["HEALING"][source] then
	    for _, v in pairs(Tracking["HEALING"][source]) do
	       v.func(v.pass,amount)
	    end
	 end
	 
	 if sourceData and Recount:InGroup(srcFlags) and Tracking["HEALING"]["!RAID"] then
	    for _, v in pairs(Tracking["HEALING"]["!RAID"]) do
	       v.func(v.pass,amount)
	    end
	 end
      end
	 
      --Need to set the source as active
      Recount:AddTimeEvent(sourceData,victim,ability,true)
	 
      --Stats for keeping track of HOT Uptime
      if isHot or healtype=="Tick" then
	 --3 is default time since most abilities have 3 seconds inbetween ticks
	 local hottime=HotTickTimeId[spellId] or 3
	 Recount:AddAmount(sourceData,"HOT_Time",hottime)
	 Recount:AddTableDataSum(sourceData,"HOTs",ability,victim,hottime)
      end
	 
      --No reason to add information if everything was overhealing
      if amount>0 then
	 Recount:AddAmount(sourceData,"Healing",amount)
	 Recount:AddTableDataStats(sourceData,"Heals",ability,healtype,amount)
	 Recount:AddTableDataSum(sourceData,"HealedWho",victim,ability,amount)
      end
	 
      --Now if there was overhealing lets add that data in
      if overheal>0 then
	 Recount:AddAmount(sourceData,"Overhealing",overheal)
	 Recount:AddTableDataStats(sourceData,"OverHeals",ability,healtype,overheal)
      end
   end
   
   if dstRetention and victimData then
	 
      victimData.LastFightIn=Recount.db2.FightNum
	 
--[[	 local VictimUnit=victimData.unit
	 
	 if (not VictimUnit or victim~=UnitName(VictimUnit)) and (victimData.UnitLockout>Recount.UnitLockout) then
	    victimData.UnitLockout=Recount.CurTime
	    VictimUnit=Recount:FindUnit(victim)
	    victimData.unit=VictimUnit
	 end
]]	 
      Recount:AddOwnerPetLazySyncAmount(victimData,"HealingTaken", amount)
	 
      if Tracking["HEALINGTAKEN"] then
	 if Tracking["HEALINGTAKEN"][victim] then
	    for _, v in pairs(Tracking["HEALINGTAKEN"][victim]) do
	       v.func(v.pass,amount)
	    end
	 end
	    
	 if Recount:InGroup(dstFlags) and Tracking["HEALINGTAKEN"]["!RAID"] then
	    for _, v in pairs(Tracking["HEALINGTAKEN"]["!RAID"]) do
	       v.func(v.pass,amount)
	    end
	 end
      end
	 
      --No reason to add information if everything was overhealing
      if amount>0 then
	 Recount:AddAmount(victimData,"HealingTaken",amount)
	 Recount:AddTableDataSum(victimData,"WhoHealed",source,ability,amount)
      end
   end
end

function Recount:AddInterruptData(source, victim, ability, srcGUID,srcFlags, dstGUID,dstFlags, spellId)

	--Friendly fire interrupt? (Duels)
	local FriendlyFire = Recount:IsFriendlyFire(srcFlags,dstFlags)
	--Before any further processing need to check if we are going to be placed in combat or in combat 
	if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
		if (not FriendlyFire) and (Recount:InGroup(srcFlags) or Recount:InGroup(dstFlags)) then
			Recount:PutInCombat()
		else
		   return
		end
	end

	--Need to add events for potential deaths	
	Recount.cleventtext = source.." interrupts "..victim.." "..ability

	-- Name and ID of pet owners
	local sourceowner
	local sourceownerID
	local victimowner
	local victimownerID

	source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)

	if srcRetention then
	   if not dbCombatants[source] then
	      Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags, sourceownerID)
	   end -- Elsia: Until here is if pets interupts anybody.
	   local sourceData=dbCombatants[source]
	 
	   if sourceData then
	      Recount:SetActive(sourceData)
	      Recount:AddCurrentEvent(sourceData,"MISC", false,nil,Recount.cleventtext)
	      --Fight tracking purposes to speed up leaving combat
	      sourceData.LastFightIn=Recount.db2.FightNum

	      Recount:AddAmount(sourceData,"Interrupts",1)
	      Recount:AddTableDataSum(sourceData,"InterruptData",victim,ability,1)
	   end

	end

	if dstRetention then

	   if not dbCombatants[victim] then
	      Recount:AddCombatant(victim, victimowner,dstGUID,dstFlags, victimownerID) -- Elsia: Bug, owner missing here
	   end

	   local victimData=dbCombatants[victim]

	   if victimData then
	      Recount:SetActive(victimData)
	      Recount:AddCurrentEvent(victimData,"MISC", true,nil,Recount.cleventtext)
	      --Fight tracking purposes to speed up leaving combat
	      victimData.LastFightIn=Recount.db2.FightNum

	   end
	end
end

function Recount:AddDispelData(source, victim, ability,srcGUID,srcFlags,dstGUID,dstFlags,spellId)
	
        --Friendly fire interrupt? (Duels)
        local FriendlyFire = Recount:IsFriendlyFire(srcFlags,dstFlags)
	--Before any further processing need to check if we are going to be placed in combat or in combat 
	if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
	   if (not FriendlyFire) and (Recount:InGroup(srcFlags) or Recount:InGroup(dstFlags)) then
	      Recount:PutInCombat()
	   else
	      return
	   end
	end
   
	-- Name and ID of pet owners
	local sourceowner
	local sourceownerID
	local victimowner
	local victimownerID

	source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)

	--Need to add events for potential deaths	
	Recount.cleventtext = source.." dispels "..victim.." "..ability

	if srcRetention then

	   if not dbCombatants[source] or not dbCombatants[source] then
	      Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags, sourceownerID)
	   end -- Elsia: Until here is if pets dispelled anybody.
	   local sourceData=dbCombatants[source]

	   if sourceData then
	      Recount:SetActive(sourceData)
	      --Fight tracking purposes to speed up leaving combat
	      sourceData.LastFightIn=Recount.db2.FightNum

	      Recount:AddCurrentEvent(sourceData, "MISC", false,nil,Recount.cleventtext)
	      Recount:AddAmount(sourceData,"Dispels",1)
	      Recount:AddTableDataSum(sourceData,"DispelledWho",victim,ability,1)
	   end

	end

	if dstRetention then

	   if not dbCombatants[victim] then
	      Recount:AddCombatant(victim,victimowner,dstGUID,dstFlags, victimownerID) -- Elsia: Bug owner missing
	   end
	   local victimData=dbCombatants[victim]
	
	   if victimData then
	      Recount:SetActive(victimData)
	      --Fight tracking purposes to speed up leaving combat
	      victimData.LastFightIn=Recount.db2.FightNum

	      Recount:AddCurrentEvent(victimData, "MISC", true,nil,Recount.cleventtext)
		Recount:AddAmount(victimData,"Dispelled",1)
		Recount:AddTableDataSum(victimData,"WhoDispelled",source,ability,1)
	   end
	end
end

function Recount:HandleDoubleDeath(source, victim, skill,srcGUID,srcFlags,dstGUID,dstFlags,spellId)

   if dstRetention then
      
      -- Name and ID of pet owners
      local victimowner
      local victimownerID

      victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)
      
      --Get the tables	
      if not dbCombatants[victim] then
	 Recount:AddCombatant(victim, victimowner,dstGUID,dstFlags, victimownerID) -- Elsia: Bug owner missing
      end
      
      local victimData=dbCombatants[victim]
      if not victimData then return end
      
      victimData.DoubleDeathSpellID = spellId
      victimData.DoubleDeathSpellName = skill
      victimData.DoubleDeathTime = GetTime()
   end
end

local deathargs={}
local timeofdeath
local doubleDeathDelay
function Recount:AddDeathData(source, victim, skill,srcGUID,srcFlags,dstGUID,dstFlags,spellId)
	--Before any further processing need to check if we are in combat 
	
	--Recount:DPrint("Add Death: "..victim)
	
--[[	if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
		--Recount:Print("Death out of combat, not recorded")
		return
	end]] -- Record all deaths.

        -- Name and ID of pet owners
        local sourceowner
        local sourceownerID
        local victimowner
        local victimownerID

	if source and type(source) == "string" then -- Elsia: Fix bug when death doesn't have a killer
	
		source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)

	end
		
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)
	
	if srcRetention then
	   
	   --Need to add events for potential deaths	
	   if source and source~=victim then -- Elsia: May be worth removing the source~=victim check
	      if not dbCombatants[source] then
		 Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags, sourceownerID)
	      end
	      local sourceData=dbCombatants[source]
	      if sourceData then
		 sourceData.LastFightIn=Recount.db2.FightNum
		 Recount:AddCurrentEvent(sourceData, "MISC", false)
	      end
	   end	
	end

	if dstRetention then

	   --Get the tables	
	   if not dbCombatants[victim] then
	      Recount:AddCombatant(victim, victimowner,dstGUID,dstFlags, victimownerID) -- Elsia: Bug owner missing
	   end

	   local victimData=dbCombatants[victim]
	   
	   if victimData then

	      -- This is fix to prevent feign death to show as real deaths.
	      if Recount:InGroup(dstFlags) and UnitIsFeignDeath(victim) then
		 --Recount:Print("Yikes: Feign Death reported as real, please report!")
		 return -- No need to record this!
	      end
	
	      --Fight tracking purposes to speed up leaving combat
	      victimData.LastFightIn=Recount.db2.FightNum
	     
	      Recount.cleventtext = victim..L[" dies."]
	
	      -- Check for Spirit of Redemption or Ghoul
	      timeofdeath = GetTime()
	      doubleDeathDelay = victimData.DoubleDeathTime and timeofdeath-victimData.DoubleDeathTime or 10
	      
	      if doubleDeathDelay < 2 then
		 Recount.cleventtext = Recount.cleventtext .. " ("..victimData.DoubleDeathSpellName..")"
		 
	      end

	      Recount:AddCurrentEvent(victimData, "MISC", true,nil,Recount.cleventtext)
	      --This saves who/what killed the victim
	      if source then
		 victimData.LastKilledBy=source
		 victimData.LastKilledAt=timeofdeath
	      elseif skill then
		 victimData.LastKilledBy=skill
		 victimData.LastKilledAt=timeofdeath
	      elseif not victimData.DoubleDeathSpellID or doubleDeathDelay >= 2 then -- We don't count spirits and ghouls
		 --The case where we actually add a deathcount
		 Recount:AddAmount(victimData,"DeathCount",1)
	      end
	      
	      -- Removed cached double event if it existed.
	      victimData.DoubleDeathSpellID = nil
	      victimData.DoubleDeathSpellName = nil
	      victimData.DoubleDeathTime = nil
	      
	      --We delay the saving of the event logs just in case more messages come later
	      if Recount.db.profile.Filters.TrackDeaths[victimData.type] then
		 --Recount:ScheduleTimer(Recount.HandleDeath,2,Recount,victim,GetTime(),dstGUID,dstFlags)
		 deathargs={} -- Elsia: Make sure we create new ones in case of overlapping deaths!
		 deathargs[1]=victim
		 deathargs[2]=timeofdeath
		 deathargs[3]=dstGUID
		 deathargs[4]=dstFlags
		 Recount:ScheduleTimer("HandleDeath",2,deathargs)
		 --Recount:HandleDeath(deathargs)
	      end
	   end
	end
end

function Recount:HandleDeath(arg)

	local victim,DeathTime,dstGUID,dstFlags = unpack(arg)
	
--	Recount:DPrint("death: "..victim)
		
	if not dbCombatants[victim] then
		return
	end

	local who=dbCombatants[victim]

	
	local num=Recount.db.profile.MessagesTracked
	local DeathLog=Recount:GetTable()

	DeathLog.DeathAt=Recount.CurTime
	DeathLog.Messages=Recount:GetTable()
	DeathLog.MessageTimes=Recount:GetTable()
	DeathLog.MessageType=Recount:GetTable()
	DeathLog.MessageIncoming=Recount:GetTable()
	DeathLog.Health=Recount:GetTable()
	DeathLog.HealthNum=Recount:GetTable()
	DeathLog.EventNum=Recount:GetTable()

	if who.LastKilledBy and math_abs(who.LastKilledAt-DeathTime)<2 then
		DeathLog.KilledBy=who.LastKilledBy
	elseif who.LastAttackedBy then
		DeathLog.KilledBy=who.LastAttackedBy
		who.LastAttackedBy=nil
	end
			
	local offset
	for i=1,num do
		offset=math_fmod(who.NextEventNum+i+num-2,num)+1
		if who.LastEvents[offset] and (who.LastEventTimes[offset]-DeathTime)>-15 then
			DeathLog.MessageTimes[#DeathLog.MessageTimes+1]=who.LastEventTimes[offset]-DeathTime
			DeathLog.Messages[#DeathLog.Messages+1]=who.LastEvents[offset] or ""
			DeathLog.MessageType[#DeathLog.MessageType+1]=who.LastEventType[offset] or "MISC"
			DeathLog.MessageIncoming[#DeathLog.MessageIncoming+1]=who.LastEventIncoming[offset] or false
			DeathLog.Health[#DeathLog.Health+1]=who.LastEventHealth[offset] or 0
			DeathLog.HealthNum[#DeathLog.HealthNum+1]=who.LastEventHealthNum[offset] or 0
			DeathLog.EventNum[#DeathLog.HealthNum]=who.LastEventNum and who.LastEventNum[offset] or 0
		end
	end

	who.DeathLogs = who.DeathLogs or {}
	tinsert(who.DeathLogs,1,DeathLog)

	if RecountDeathTrack then
		--Recount:DPrint(who.LastDamageTaken)
		RecountDeathTrack:AddDeath(victim, DeathTime-(Recount.InCombatT2 or DeathTime), who.LastDamageTaken , who, who.DeathLogs)--[[who.LastDamageAbility.." "..who.LastDamageTaken]]--
	end

	--who.DeathLogs[#who.DeathLogs+1]=DeathLog
end

function Recount:AddCCBreaker(source, victim, ability,srcGUID,srcFlags,dstGUID,dstFlags)

        --Friendly fire interrupt? (Duels)
        local FriendlyFire = Recount:IsFriendlyFire(srcFlags,dstFlags)
	--Before any further processing need to check if we are going to be placed in combat or in combat 
	if not Recount.InCombat and Recount.db.profile.RecordCombatOnly then
	   if (not FriendlyFire) and (Recount:InGroup(srcFlags) or Recount:InGroup(dstFlags)) then
	      Recount:PutInCombat()
	   else
	      return
	   end
	end

	-- Name and ID of pet owners
	local sourceowner
	local sourceownerID
	local victimowner
	local victimownerID

	source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)


	if srcRetention then
	   
	   if not dbCombatants[source] then
	      Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags, sourceownerID)
	   end -- Elsia: Until here is if pets heal anybody.
	   local sourceData=dbCombatants[source]
	   if sourceData then

	      Recount:SetActive(sourceData)

	      --Fight tracking purposes to speed up leaving combat
	      sourceData.LastFightIn=Recount.db2.FightNum
	      if not FriendlyFire then
		 Recount:AddAmount(sourceData,"CCBreak",1)
		 Recount:AddTableDataSum(sourceData,"CCBroken",ability,victim,1)
	      end
	   end
	end


	if dstRetention then

	   if not dbCombatants[victim] then
	      Recount:AddCombatant(victim,victimowner,dstGUID,dstFlags, victimownerID)
	   end
	   local victimData=dbCombatants[victim]
	   if victimData then 
	      Recount:SetActive(victimData)

	      --Fight tracking purposes to speed up leaving combat
	      victimData.LastFightIn=Recount.db2.FightNum
	   end
	end
end


local DataAmount, DataTable, DataTable2
function Recount:AddGain(source, victim, ability, amount, attribute,srcGUID,srcFlags,dstGUID,dstFlags,spellId)

	if attribute=="Mana" then
		DataAmount="ManaGain"
		DataTable="ManaGained"
		DataTable2="ManaGainedFrom"
	elseif attribute=="Energy" or attribute=="Focus" then -- Elsia: Focus for pet.
		DataAmount="EnergyGain"
		DataTable="EnergyGained"
		DataTable2="EnergyGainedFrom"
	elseif attribute=="Rage" then
		DataAmount="RageGain"
		DataTable="RageGained"
		DataTable2="RageGainedFrom"
	elseif attribute=="Runic Power" then
		DataAmount="RunicPowerGain"
		DataTable="RunicPowerGained"
		DataTable2="RunicPowerGainedFrom"
	else
		return
	end

	-- Name and ID of pet owners
	local sourceowner
	local sourceownerID
	local victimowner
	local victimownerID

	source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)

	if srcRetention then

	   if not dbCombatants[source] then
	      Recount:AddCombatant(source,sourceowner,srcGUID,srcFlags,sourceownerID)
	   end -- Elsia: Until here is if pets heal anybody.
	   local sourceData=dbCombatants[source]
	   Recount:SetActive(sourceData)

	   Recount:AddAmount(sourceData,DataAmount,amount)
	   Recount:AddTableDataSum(sourceData,DataTable,ability,victim,amount)
	   Recount:AddTableDataSum(sourceData,DataTable2,victim,ability,amount)
	end
end

function Recount:AddRes(source, victim, ability,srcGUID,srcFlags, dstGUID,dstFlags,spellId)
	--Get the tables

        -- Name and ID of pet owners
        local sourceowner
        local sourceownerID
        local victimowner
        local victimownerID

        source, sourceowner, sourceownerID = Recount:DetectPet(source, srcGUID, srcFlags)
	victim, victimowner, victimownerID = Recount:DetectPet(victim, dstGUID, dstFlags)


        if srcRetention then
	   if not dbCombatants[source] then
	      Recount:AddCombatant(source, nil, srcGUID,srcFlags)
	   end

	
	   local sourceData=dbCombatants[source]
	   if sourceData then

	      Recount:SetActive(sourceData)

	      Recount:AddAmount(sourceData,"Ressed",1)
	      Recount:AddTableDataSum(sourceData,"RessedWho",victim,ability,1)
	   end
	end
end

--Potential Tracking
--"DAMAGE"
--"DAMAGETAKEN"
--"HEALING"
--"HEALINGTAKEN"

--function Recount:FPSUpdate(pass)
--end

function Recount:RegisterTracking(id, who, stat, func, pass)
	--Special trackers handled first
	
	local idtoken
	
	if stat=="FPS" then
		idtoken=Recount:ScheduleRepeatingTimer(function() func(pass,GetFramerate()*0.1) end,0.1) -- id.."_TRACKER",
		--return -- Elsia: Removed this so we store tokens
	elseif stat=="LAG" then
		idtoken=Recount:ScheduleRepeatingTimer(function() local _, _, lag = GetNetStats(); func(pass,lag*0.1) end,0.1)
	elseif stat=="UP_TRAFFIC" then
		idtoken=Recount:ScheduleRepeatingTimer(function() local _, up  = GetNetStats(); func(pass,1024*up*0.1) end,0.1)
	elseif stat=="DOWN_TRAFFIC" then
		idtoken=Recount:ScheduleRepeatingTimer(function() local down  = GetNetStats(); func(pass,1024*down*0.1) end,0.1)
	elseif stat=="AVAILABLE_BANDWIDTH" then
		idtoken=Recount:ScheduleRepeatingTimer(function() func(pass,ChatThrottleLib:UpdateAvail()*0.1) end,0.1)
	end
	
	if type(Tracking[stat])~="table" then
		Tracking[stat]=Recount:GetTable()
	end

	if type(Tracking[stat][who])~="table" then
		Tracking[stat][who]=Recount:GetTable()
	end

	if type(Tracking[stat][who][id])~="table" then
		Tracking[stat][who][id]=Recount:GetTable()
	end

	Tracking[stat][who][id].func=func
	Tracking[stat][who][id].pass=pass
	Tracking[stat][who][id].token=idtoken
end	

function Recount:UnregisterTracking(id, who, stat)
	if stat=="FPS" or stat=="LAG" or stat=="UP_TRAFFIC" or stat=="DOWN_TRAFFIC" or stat=="AVAILABLE_BANDWIDTH" then
		Recount:CancelTimer(Tracking[stat][who][id].token) -- Was id.."_TRACKER"
		return
	end

	if type(Tracking[stat])~="table" or type(Tracking[stat][who])~="table"  then
		return
	end

	Tracking[stat][who][id]=nil
end

local oldlocalizer = Recount.LocalizeCombatants
function Recount.LocalizeCombatants()
	dbCombatants = Recount.db2.combatants
	oldlocalizer()
end

