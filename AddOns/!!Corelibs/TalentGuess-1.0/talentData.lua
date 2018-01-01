if( IS_WRATH_BUILD == nil ) then IS_WRATH_BUILD = (select(4, GetBuildInfo()) >= 30000) end
if( IS_WRATH_BUILD ) then return end

local major = "TalentGuessData-1.0"
local minor = tonumber(string.match("$Revision: 703$", "(%d+)") or 1)

assert(LibStub, string.format("%s requires LibStub.", major))

local Data = LibStub:NewLibrary(major, minor)
if( not Data ) then return end

-- The format is pretty simple
-- [spellID] = "tree #:points required:checkBuffs:isCastOnly"
Data.Spells = {
	-- ROGUES

	--[[ Assassination ]]--
	[14181] = "1:11",
	[14177] = "1:21",
	[31663] = "1:23",
	[31234] = "1:36",
	[31235] = "1:37",
	[31236] = "1:38",
	[31237] = "1:39",
	[31238] = "1:40",
	[1329] = "1:41",
	[34411] = "1:41",
	[34412] = "1:41",
	[34413] = "1:41",
	
	--[[ Combat ]]--
	[14251] = "2:11",
	[13877] = "2:21",
	[13750] = "2:31",
	[35542] = "2:36",
	[35545] = "2:37",
	[35546] = "2:38",
	[35547] = "2:39",
	[35548] = "2:40",

	--[[ Subtlety ]]--
	[14278] = "3:11",
	[16511] = "3:21",
	[17347] = "3:21",
	[17348] = "3:21",
	[26864] = "3:21",
	[14185] = "3:21",
	[14183] = "3:31",
	[45182] = "3:33",
	[36554] = "3:41",

	-- DRUIDS
	
	--[[ Balance ]]--
	[16689] = "1:1",
	[16810] = "1:1",
	[16811] = "1:1",
	[16812] = "1:1",
	[16813] = "1:1",
	[17329] = "1:1",
	[27009] = "1:1",
	[5570] = "1:11",
	[24974] = "1:11",
	[24975] = "1:11",
	[24976] = "1:11",
	[24977] = "1:11",
	[27013] = "1:11",
	[16886] = "1:21",
	[24858] = "1:31",
	[33831] = "1:41",
	
	--[[ Feral ]]--
	[16979] = "2:11",
	[16959] = "2:17",	
	[16857] = "2:21",
	[17390] = "2:21",
	[17391] = "2:21",
	[17392] = "2:21",
	[27011] = "2:21",
	[33917] = "2:41",
	[33878] = "2:41",
	[33986] = "2:41",
	[33987] = "2:41",
	[33876] = "2:41",
	[33982] = "2:41",
	[33983] = "2:41",

	--[[ Resto ]]--
	[17057] = "3:5",
	[16864] = "3:11:true",
	[17116] = "3:21",
	[18562] = "3:31",
	[45281] = "3:32:true",
	[45282] = "3:33:true",
	[45283] = "3:34:true",
	[33891] = "3:41",
	
	-- HUNTERS
	
	--[[ Beast Mastery ]]--
	[6150] = "1:5",
	[24406] = "1:17",
	[19577] = "1:21",
	[19579] = "1:22:true",
	[24529] = "1:23:true",
	[19574] = "1:31",
	[34471] = "1:41",
		
	--[[ Marksmanship ]]--
	[19434] = "2:11",
	[20900] = "2:11",
	[20901] = "2:11",
	[20902] = "2:11",
	[20903] = "2:11",
	[20904] = "2:11",
	[27065] = "2:11",
	[19503] = "2:21",
	[34490] = "2:41",
	
	--[[ Survival ]]--
	[19263] = "3:11",
	[19306] = "3:21",
	[20909] = "3:21",
	[20910] = "3:21",
	[27067] = "3:21",
	[19386] = "3:31",
	[24132] = "3:31",
	[24133] = "3:31",
	[27068] = "3:31",
	[23989] = "3:41",
	
	-- MAGES
	
	--[[ Arcane ]]--
	[12536] = "1:10",
	[29442] = "1:10",
	[12043] = "1:21",
	[46989] = "1:22",
	[47000] = "1:23",
	[12042] = "1:31",
	[31589] = "1:41",
	
	--[[ Fire ]]--
	[29077] = "2:18",
	[11113] = "2:21",
	[13018] = "2:21",
	[13019] = "2:21",
	[13020] = "2:21",
	[13021] = "2:21",
	[27133] = "2:21",
	[33933] = "2:21",
	[31643] = "2:27",
	[11129] = "2:31",
	[31661] = "2:41",
	[33041] = "2:41",
	[33042] = "2:41",
	[33043] = "2:41",

	--[[ Frost ]]--
	[12472] = "3:11",
	[11958] = "3:21",
	[11426] = "3:31",
	[13031] = "3:31",
	[13032] = "3:31",
	[13033] = "3:31",
	[27134] = "3:31",
	[33405] = "3:31",
	[31687] = "3:41",
	
	-- PALADINS
	
	--[[ Holy ]]--
	[20272] = "1:20",
	[20216] = "1:21",
	[20473] = "1:31",
	[20929] = "1:31",
	[20930] = "1:31",
	[27174] = "1:31",
	[33072] = "1:31",
	[31834] = "1:33",
	[31842] = "1:41",
	
	--[[ Protection ]]--
	[20128] = "2:1",
	[20131] = "2:2",
	[20132] = "2:3",
	[20133] = "2:4",
	[32776] = "2:5",
	[20217] = "2:11:nil:true",
	[25898] = "2:11:nil:true",
	[20177] = "2:21",
	[20178] = "2:25",
	[20925] = "2:31",
	[20927] = "2:31",
	[20928] = "2:31",
	[27179] = "2:31",
	[31935] = "2:41",
	[32699] = "2:41",
	[32700] = "2:41",
	
	--[[ Retribution ]]--
	[20375] = "3:11",
	[20915] = "3:11",
	[20918] = "3:11",
	[20919] = "3:11",
	[20920] = "3:11",
	[27170] = "3:11",
	[25997] = "3:17",
	[31930] = "3:28",
	[20050] = "3:26",
	[20052] = "3:27",
	[20053] = "3:28",
	[20054] = "3:29",
	[20055] = "3:30",
	[20066] = "3:31",
	[35395] = "3:41",
	
	-- PRIESTS
	
	--[[ Disc ]]--
	[14743] = "1:6",
	[27828] = "1:7",
	[14751] = "1:11",
	[14752] = "1:21:nil:true",
	[14818] = "1:21:nil:true",
	[14819] = "1:21:nil:true",
	[27841] = "1:21:nil:true",
	[25312] = "1:21:nil:true",
	[10060] = "1:31:nil:true",
	[45237] = "1:32:true",
	[45241] = "1:33:true",
	[45242] = "1:34:true",
	[33206] = "1:41:nil:true",
	
	--[[ Holy ]]--
	[15237] = "2:11",
	[15430] = "2:11",
	[15431] = "2:11",
	[27799] = "2:11",
	[27800] = "2:11",
	[27801] = "2:11",
	[25331] = "2:11",
	[27811] = "2:11",
	[27815] = "2:12",
	[27816] = "2:13",
	[20711] = "2:21",
	[33150] = "2:26",
	[33154] = "2:27",
	[33145] = "2:31",
	[33145] = "2:32",
	[33146] = "2:33",
	[34754] = "2:33",
	[34861] = "2:41",
	[34863] = "2:41",
	[34864] = "2:41",
	[34865] = "2:41",
	[34866] = "2:41",
	
	--[[ Shadow ]]--
	[15407] = "3:11",
	[17311] = "3:11",
	[17312] = "3:11",
	[17313] = "3:11",
	[17314] = "3:11",
	[18807] = "3:11",
	[25387] = "3:11",
	[15286] = "3:21",
	[15487] = "3:21",
	[15473] = "3:31:true",
	[34914] = "3:41",
	[34916] = "3:41",
	[34917] = "3:41",
	
	-- SHAMANS
	
	--[[ Elemental ]]--
	[16246] = "1:11",
	[30165] = "1:16",
	[29177] = "1:17",
	[29178] = "1:18",
	[29063] = "1:18",
	[16166] = "1:31",
	[39805] = "1:40",
	[30706] = "1:41",
	
	--[[ Enhancement ]]--
	[2645] = "2:7",
	[43339] = "2:11",
	[16256] = "2:16",
	[16281] = "2:17",
	[16282] = "2:18",
	[16283] = "2:19",
	[16284] = "2:20",
	[32175] = "2:31",
	[32176] = "2:31",
	[30823] = "2:41",
	
	--[[ Resto ]]--
	[16188] = "3:21",
	[16190] = "3:31",
	[31616] = "3:35",
	[974] = "3:41:nil:true",
	[32593] = "3:41:nil:true",
	[32594]	= "3:41:nil:true",
	
	-- WARRIOR
	
	--[[ Arms ]]--
	[12292] = "1:21",
	[12294] = "1:31",
	[21551] = "1:31",
	[21552] = "1:31",
	[21553] = "1:31",
	[25248] = "1:31",
	[30330] = "1:31",
	[29841] = "1:32",
	[29842] = "1:33",
	
	--[[ Fury ]]--
	[12964] = "2:10",
	[12323] = "2:11",
	[16488] = "2:11",
	[16490] = "2:12",
	[16491] = "2:13",
	[12317] = "2:16",
	[13045] = "2:17",
	[13046] = "2:18",
	[13047] = "2:19",
	[13048] = "2:20",
	[12328] = "2:21",
	[12966] = "2:26",
	[12967] = "2:27",
	[12968] = "2:28",
	[12969] = "2:29",
	[12970] = "2:30",
	[23690] = "2:27",
	[23691] = "2:28",
	[23881] = "2:31",
	[23892] = "2:31",
	[23893] = "2:31",
	[23894] = "2:31",
	[25251] = "2:31",
	[30335] = "2:31",
	[29801] = "2:41",
	[30030] = "2:41",
	[30033] = "2:41",
	
	--[[ Protection ]]--
	[12975] = "3:11",
	[12809] = "3:21",
	[23922] = "3:31",
	[23923] = "3:31",
	[23924] = "3:31",
	[23925] = "3:31",
	[25258] = "3:31",
	[30356] = "3:31",
	[20243] = "3:41",
	[30016] = "3:41",
	[30022] = "3:41",
	
	-- WARLOCKS
	
	--[[ Affliction ]]--
	[18288] = "1:11:true",
	[18094] = "1:16",
	[18095] = "1:17",
	[18223] = "1:21",
	[18265] = "1:21",
	[18879] = "1:21",
	[18880] = "1:21",
	[18881] = "1:21",
	[27264] = "1:21",
	[30911] = "1:21",
	[18220] = "1:31",
	[18937] = "1:31",
	[18938] = "1:31",
	[27265] = "1:31",
	[30108] = "1:41",
	[30404] = "1:41",
	[30405] = "1:41",
	

	--[[ Demon ]]--
	[18708] = "2:11",
	[23830] = "2:30:true",
	[19028] = "2:31:true",
	[35691] = "2:32:true",
	[35692] = "2:33:true",
	[35693] = "2:34:true",
	[30146] = "2:41",
	
	--[[ Destro ]]--
	[17877] = "3:11",
	[18867] = "3:11",
	[18868] = "3:11",
	[18869] = "3:11",
	[18870] = "3:11",
	[18871] = "3:11",
	[27263] = "3:11",
	[30546] = "3:11",
	[30300] = "3:28",
	[34936] = "3:33",
	[30283] = "3:41",
	[30413] = "3:41",
	[30414] = "3:41",
}