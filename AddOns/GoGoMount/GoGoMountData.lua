BINDING_HEADER_GOGOHEADER = "GoGoMount"
BINDING_NAME_GOGOBINDING = "Mount/Dismount"
BINDING_NAME_GOGOBINDING2 = "Mount/Dismount (no flying)"
BINDING_NAME_GOGOBINDING3 = "Mount/Dismount Passenger Mounts"

GoGo_Variables = {}
GoGo_Variables.Player = {}
GoGo_Variables.MountList = {}
--GoGo_DebugLog = {}
GoGo_Variables.Localize = {}
GoGo_Variables.Localize.Zone = {}
GoGo_Variables.Localize.String = {}
GoGo_Variables.Localize.Skill = {}

GoGo_Variables.MountDB = {
	[25953] = {[16] = true, [21] = true, [38] = true, [50] = true, [51] = true},  -- Blue Qiraji Battle Tank
	[26055] = {[16] = true, [21] = true, [38] = true, [50] = true, [51] = true},  -- Yellow Qiraji Battle Tank
	[26054] = {[16] = true, [21] = true, [38] = true, [50] = true, [51] = true},  -- Red Qiraji Battle Tank
	[26056] = {[16] = true, [21] = true, [38] = true, [50] = true, [51] = true},  -- Green Qiraji Battle Tank
	[26656] = {[16] = true, [21] = true, [37] = true, [51] = true},  -- Black Qiraji Battle Tank

	[30174] = {[15] = true, [25] = true, [39] = true},  -- Riding Turtle
	[64731] = {[5] = true, [15] = true, [25] = true, [120] = true, [39] = true},  -- Sea Turtle
	
	[33189] = {[4] = true, [15] = true, [25] = true, [39] = true},  -- Rickety Magic Broom  --  itemid
--	[42692] = {[15] = true, [25] = true, [39] = true, [999] = true},  -- Rickety Magic Broom

	[37011] = {[9] = true, [3] = true, [4] = true, [14] = true, [20] = true, [21] = true, [22] = true, [23] = true, [29] = true, [38] = true},  -- Magic Broom -- itemid

	[33183] = {[16] = true, [20] = true, [38] = true, [4] = true},  -- Magic Broom  --  itemid
--	[42680] = {[16] = true, [20] = true, [38] = true, [999] = true},  -- Magic Broom

---	[47977] = {[16] = true, [20] = true, [38] = true, [999] = true},  -- Magic Broom
---	[42681] = {[16] = true, [20] = true, [38] = true, [999] = true},  -- Magic Broom

--	[42683] = {[16] = true, [21] = true, [37] = true, [999] = true},  -- Swift Magic Broom
---	[42684] = {[16] = true, [21] = true, [37] = true, [999] = true},  -- Swift Magic Broom

	[33176] = {[12] = true, [22] = true, [36] = true, [9] = true, [4] = true},  -- Flying Broom  --  itemid
--	[42667] = {[12] = true, [22] = true, [36] = true, [9] = true, [999] = true},  -- Flying Broom
---	[42673] = {[12] = true, [22] = true, [36] = true, [9] = true, [999] = true},  -- Flying Broom

	[33182] = {[11] = true, [23] = true, [35] = true, [9] = true, [4] = true},  -- Swift Flying Broom  --  itemid
	[33184] = {[16] = true, [23] = true, [37] = true, [9] = true, [4] = true, [999] = true},  -- Swift Magic Broom  --  itemid
--	[42668] = {[11] = true, [23] = true, [35] = true, [9] = true, [999] = true},  -- Swift Flying Broom

---	[42679] = {[11] = true, [23] = true, [35] = true, [9] = true, [999] = true},  -- Swift Flying Broom

	[32243] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Tawny Wind Rider
	[32244] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Blue Wind Rider
	[32245] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Green Wind Rider
	[32246] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Red Wind Rider
	[32295] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Green Wind Rider
	[32296] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Yellow Wind Rider
	[32297] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Purple Wind Rider
	[44229] = {[18] = true, [22] = true, [39] = true, [9] = true, [4] = true, [52] = true},  -- Loaned Wind Rider Reins
	[61230] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Armored Blue Wind Rider

	[37015] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Swift Nether Drake
	[41513] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Onyx Netherwing Drake
	[41514] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Azure Netherwing Drake
	[41515] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Cobalt Netherwing Drake
	[41516] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Purple Netherwing Drake
	[41517] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Veridian Netherwing Drake
	[41518] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Violet Netherwing Drake
	[44317] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Merciless Nether Drake
	[44744] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Merciless Nether Drake
	[49193] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Vengeful Nether Drake
	[58615] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Brutal Nether Drake

	[39798] = {[11] = true, [23] = true, [35] = true, [9] = true, [70] = true},  -- Green Riding Nether Ray
	[39800] = {[11] = true, [23] = true, [35] = true, [9] = true, [70] = true},  -- Red Riding Nether Ray
	[39801] = {[11] = true, [23] = true, [35] = true, [9] = true, [70] = true},  -- Purple Riding Nether Ray
	[39802] = {[11] = true, [23] = true, [35] = true, [9] = true, [70] = true},  -- Silver Riding Nether Ray
	[39803] = {[11] = true, [23] = true, [35] = true, [9] = true, [70] = true},  -- Blue Riding Nether Ray

	[46199] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- X-51 Nether-Rocket X-TREME
	[46197] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- X-51 Nether-Rocket
	[71342] = {[9] = true, [3] = true, [14] = true, [20] = true, [21] = true, [22] = true, [29] = true, [23] = true, [38] = true},  -- Big Love Rocket
	[75973] = {[9] = true, [2] = true, [6] = true, [12] = true, [22] = true, [23] = true, [24] = false, [36] = true},  -- X-53 Touring Rocket
	
	[43927] = {[11] = true, [23] = true, [35] = true, [9] = true, [71] = true},  -- Cenarion War Hippogryph
	[63844] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Argent Hippogryph
	[66087] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Silver Covenant Hippogryph
	[74856] = {[9] = true, [3] = true, [14] = true, [20] = true, [21] = true, [22] = true, [29] = true, [23] = true, [38] = true, [24] = true},  -- Blazing Hippogryph

	[43810] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Frost Wyrm
	[51960] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Frostwyrm Mount
	[64927] = {[9] = true, [11] = true, [24] = true, [35] = true},  -- Deadly Gladiator's Frostwyrm
	[65439] = {[9] = true, [11] = true, [24] = true, [35] = true},  -- Furious Gladiator's Frost Wyrm
	[67336] = {[9] = true, [11] = true, [24] = true, [35] = true},  -- Relentless Gladiator's Frost Wyrm
	[71810] = {[9] = true, [11] = true, [24] = true, [35] = true},  -- Wrathful Gladiator's Frost Wyrm
	
	[72807] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Icebound Frostbrood Vanquisher
	[72808] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Bloodbathed Frostbrood Vanquisher

	[3363] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Nether Drake
	[28828] = {[11] = true, [26] = true, [35] = true, [9] = true},  -- Nether Drake
	[37815] = {[11] = true, [9] = true, [4] = true, [54] = true},  -- Emerald Drake
	[37859] = {[11] = true, [9] = true, [4] = true, [54] = true},  -- Amber Drake
	[37860] = {[11] = true, [9] = true, [4] = true, [54] = true},  -- Ruby Drake
	[59567] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Azure Drake
	[59568] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Blue Drake
	[59569] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Bronze Drake
	[59570] = {[11] = true, [23] = true, [35] = true, [9] = true, [72] = true},  -- Red Drake
	[59571] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Twilight Drake
	[59650] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Black Drake
	[60025] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Albino Drake
	[69395] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Onyxian Drake

	[59961] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Red Proto-Drake
	[59976] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Black Proto-Drake
	[59996] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Blue Proto-Drake
	[60002] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Time-Lost Proto-Drake
	[60021] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Plagued Proto-Drake
	[60024] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Violet Proto-Drake
	[61294] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Green Proto-Drake
	[63956] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Ironbound Proto-Drake
	[63963] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Rusted Proto-Drake

	[32345] = {[11] = true, [24] = true, [9] = true},  -- Peep the Phoenix Mount
	[40192] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Ashes of Al'ar

	[54726] = {[12] = true, [29] = true, [9] = true, [36] = true, [22] = true, [23] = true, [100] = true},  -- Winged Steed of the Ebon Blade
	[54727] = {[12] = true, [29] = true, [9] = true, [36] = true, [22] = true, [23] = true, [100] = true},  -- Winged Steed of the Ebon Blade
	[54729] = {[12] = true, [29] = true, [9] = true, [36] = true, [22] = true, [23] = true, [100] = true},  -- Winged Steed of the Ebon Blade

	[32235] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Golden Gryphon
	[32239] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Ebon Gryphon
	[32240] = {[12] = true, [22] = true, [36] = true, [9] = true},  -- Snowy Gryphon
	[32242] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Blue Gryphon
	[32289] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Red Gryphon
	[32290] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Green Gryphon
	[32292] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Purple Gryphon
	[44221] = {[18] = true, [22] = true, [39] = true, [9] = true, [4] = true, [52] = true},  -- Loaned Gryphon Reins
	[55164] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Swift Spectral Gryphon
	[61229] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Armored Snowy Gryphon

	[578] = {[14] = true, [20] = true, [38] = true},  -- Black Wolf
	[579] = {[16] = true, [21] = true, [37] = true},  -- Red Wolf
	[580] = {[14] = true, [20] = true, [38] = true},  -- Timber Wolf
	[581] = {[14] = true, [20] = true, [38] = true},  -- Winter Wolf
	[6653] = {[14] = true, [20] = true, [38] = true},  -- Dire Wolf
	[6654] = {[14] = true, [20] = true, [38] = true},  -- Brown Wolf
	[16080] = {[16] = true, [21] = true, [37] = true},  -- Red Wolf
	[16081] = {[16] = true, [21] = true, [37] = true},  -- Winter Wolf
	[22724] = {[16] = true, [21] = true, [37] = true},  -- Black War Wolf
	[23250] = {[16] = true, [21] = true, [37] = true},  -- Swift Brown Wolf
	[23251] = {[16] = true, [21] = true, [37] = true},  -- Swift Timber Wolf
	[23252] = {[16] = true, [21] = true, [37] = true},  -- Swift Gray Wolf
	[23509] = {[16] = true, [21] = true, [37] = true},  -- Frostwolf Howler
	[63640] = {[16] = true, [21] = true, [37] = true},  -- Origimmar Wolf (Swift Orgrimmar Wolf)
	[64658] = {[14] = true, [20] = true, [38] = true},  -- Black Wolf
	[65646] = {[16] = true, [21] = true, [37] = true},  -- Swift Burgundy Wolf
	[68056] = {[16] = true, [21] = true, [37] = true},  -- Swift Horde Wolf

	[18363] = {[14] = true, [20] = true, [38] = true},  -- Riding Kodo
	[18989] = {[14] = true, [20] = true, [38] = true},  -- Gray Kodo
	[18990] = {[14] = true, [20] = true, [38] = true},  -- Brown Kodo
	[18991] = {[16] = true, [21] = true, [37] = true},  -- Green Kodo
	[18992] = {[16] = true, [21] = true, [37] = true},  -- Teal Kodo
	[22718] = {[16] = true, [21] = true, [37] = true},  -- Black War Kodo
	[23247] = {[16] = true, [21] = true, [37] = true},  -- Great White Kodo
	[23248] = {[16] = true, [21] = true, [37] = true},  -- Great Gray Kodo
	[23249] = {[16] = true, [21] = true, [37] = true},  -- Great Brown Kodo
	[49378] = {[14] = true, [20] = true, [38] = true},  -- Brewfest Riding Kodo
	[49379] = {[16] = true, [21] = true, [37] = true},  -- Great Brewfest Kodo
	[50869] = {[14] = true, [20] = true, [38] = true},  -- Brewfest Kodo
	[63641] = {[16] = true, [21] = true, [37] = true},  -- Thunder Bluff Kodo (Great Mulgore Kodo)
	[64657] = {[14] = true, [20] = true, [38] = true},  -- White Kodo
	[65641] = {[16] = true, [21] = true, [37] = true},  -- Great Golden Kodo

	[34795] = {[14] = true, [20] = true, [38] = true},  -- Red Hawkstrider
	[35018] = {[14] = true, [20] = true, [38] = true},  -- Purple Hawkstrider
	[35020] = {[14] = true, [20] = true, [38] = true},  -- Blue Hawkstrider
	[35022] = {[14] = true, [20] = true, [38] = true},  -- Black Hawkstrider
	[33660] = {[16] = true, [21] = true, [37] = true},  -- Swift Pink Hawkstrider
	[35025] = {[16] = true, [21] = true, [37] = true},  -- Swift Green Hawkstrider
	[35027] = {[16] = true, [21] = true, [37] = true},  --Swift Purple Hawkstrider
	[35028] = {[16] = true, [21] = true, [37] = true},  -- Swift Warstrider
	[46628] = {[16] = true, [21] = true, [37] = true},  -- Swift White Hawkstrider
	[41252] = {[11] = true, [21] = true, [37] = true},  -- Raven Lord
	[63642] = {[16] = true, [21] = true, [37] = true},  -- Silvermoon Hawkstrider (Swift Silvermoon Hawkstrider)
	[65639] = {[16] = true, [21] = true, [37] = true},  -- Swift Red Hawkstrider
	[66091] = {[16] = true, [21] = true, [37] = true},  -- Sunreaver Hawkstrider

	[65917] = {[16] = true, [21] = true, [37] = true},  -- Magic Rooster
	[66122] = {[16] = true, [21] = true, [37] = true},  -- Magic Rooster
	[66123] = {[16] = true, [21] = true, [37] = true},  -- Magic Rooster
	[66124] = {[16] = true, [21] = true, [37] = true},  -- Magic Rooster

	[34790] = {[16] = true, [21] = true, [37] = true},  -- Dark War Talbuk
	[34896] = {[16] = true, [21] = true, [37] = true},  -- Cobalt War Talbuk
	[34897] = {[16] = true, [21] = true, [37] = true},  -- White War Talbuk
	[34898] = {[16] = true, [21] = true, [37] = true},  -- Silver War Talbuk
	[34899] = {[16] = true, [21] = true, [37] = true},  -- Tan War Talbuk
	[39315] = {[16] = true, [21] = true, [37] = true},  -- Cobalt Riding Talbuk
	[39316] = {[16] = true, [21] = true, [37] = true},  -- Dark Riding Talbuk
	[39317] = {[16] = true, [21] = true, [37] = true},  -- Silver Riding Talbuk
	[39318] = {[16] = true, [21] = true, [37] = true},  -- Tan Riding Talbuk
	[39319] = {[16] = true, [21] = true, [37] = true},  -- White Riding Talbuk

	[6777] = {[14] = true, [20] = true, [38] = true},  -- Gray Ram
	[6898] = {[14] = true, [20] = true, [38] = true},  -- White Ram
	[6899] = {[14] = true, [20] = true, [38] = true},  -- Brown Ram
	[17460] = {[16] = true, [21] = true, [37] = true},  -- Frost Ram
	[17461] = {[16] = true, [21] = true, [37] = true},  -- Black Ram
	[22720] = {[16] = true, [21] = true, [37] = true},  -- Black War Ram
	[23238] = {[16] = true, [21] = true, [37] = true},  -- Swift Brown Ram
	[23239] = {[16] = true, [21] = true, [37] = true},  -- Swift Gray Ram
	[23240] = {[16] = true, [21] = true, [37] = true},  -- Swift White Ram
	[23510] = {[16] = true, [21] = true, [37] = true},  -- Stormpike Battle Charger
	[43899] = {[14] = true, [20] = true, [38] = true},  -- Brewfest Ram
	[43900] = {[16] = true, [21] = true, [37] = true},  -- Swift Brewfest Ram
	[63636] = {[16] = true, [21] = true, [37] = true},  -- Ironforge Ram (Swift Ironforge Ram)
	[65643] = {[16] = true, [21] = true, [37] = true},  -- Swift Violet Ram

	[10873] = {[14] = true, [20] = true, [38] = true},  -- Red Mechanostrider
	[10969] = {[14] = true, [20] = true, [38] = true},  -- Blue Mechanostrider
	[15779] = {[16] = true, [21] = true, [37] = true},  -- White Mechanostrider Mod B
	[15780] = {[14] = true, [20] = true, [38] = true},  -- Green Mechanostrider
	[15781] = {[14] = true, [20] = true, [38] = true},  -- Steel Mechanostrider
	[17453] = {[14] = true, [20] = true, [38] = true},  -- Green Mechanostrider
	[17454] = {[14] = true, [20] = true, [38] = true},  -- Unpainted Mechanostrider
	[17455] = {[14] = true, [20] = true, [38] = true},  -- Purple Mechanostrider
	[17456] = {[14] = true, [20] = true, [38] = true},  -- Red and Blue Mechanostrider
	[17458] = {[14] = true, [20] = true, [38] = true},  -- Fluorescent Green Mechanostrider
	[17459] = {[16] = true, [21] = true, [37] = true},  -- Icy Blue Mechanostrider Mod A
	[22719] = {[16] = true, [21] = true, [37] = true},  -- Black Battlestrider
	[23222] = {[16] = true, [21] = true, [37] = true},  -- Swift Yellow Mechanostrider
	[23223] = {[16] = true, [21] = true, [37] = true},  -- Swift White Mechanostrider
	[23225] = {[16] = true, [21] = true, [37] = true},  -- Swift Green Mechanostrider
	[33630] = {[14] = true, [20] = true, [38] = true},  -- Blue Mechanostrider
	[63638] = {[16] = true, [21] = true, [37] = true},  -- Gnomeregan Mechanostrider (Turbostrider)
	[65642] = {[16] = true, [21] = true, [37] = true},  -- Turbostrider

	[8395] = {[14] = true, [20] = true, [38] = true},  -- Emerald Raptor
	[10795] = {[14] = true, [20] = true, [38] = true},  -- Ivory Raptor
	[10796] = {[14] = true, [20] = true, [38] = true},  -- Turquoise Raptor
	[10799] = {[14] = true, [20] = true, [38] = true},  -- Violet Raptor
	[16084] = {[16] = true, [21] = true, [37] = true},  -- Mottled Red Raptor
	[17450] = {[16] = true, [21] = true, [37] = true},  -- Ivory Raptor
	[22721] = {[16] = true, [21] = true, [37] = true},  -- Black War Raptor
	[23241] = {[16] = true, [21] = true, [37] = true},  -- Swift Blue Raptor
	[23242] = {[16] = true, [21] = true, [37] = true},  -- Swift Olive Raptor
	[23243] = {[16] = true, [21] = true, [37] = true},  -- Swift Orange Raptor
	[24242] = {[16] = true, [21] = true, [37] = true},  -- Swift Razzashi Raptor
	[63635] = {[16] = true, [21] = true, [37] = true},  -- Darkspear Raptor (Swift Darkspear Raptor)
	[64659] = {[16] = true, [21] = true, [38] = true},  -- Venomhide Ravasaur
	[65644] = {[16] = true, [21] = true, [37] = true},  -- Swift Purple Raptor
	
	[43688] = {[11] = true, [21] = true, [37] = true},  -- Amani War Bear
	[51412] = {[16] = true, [21] = true, [37] = true},  -- Big Battle Bear
	[54753] = {[16] = true, [21] = true, [37] = true},  -- White Polar Bear Mount
	[58983] = {[14] = true, [21] = true, [38] = true, [20] = true, [29] = true},  -- Big Blizzard Bear
	[59572] = {[16] = true, [21] = true, [37] = true},  -- Black Polar Bear
	[59573] = {[16] = true, [21] = true, [37] = true},  -- Brown Polar Bear
	[60114] = {[16] = true, [21] = true, [37] = true},  -- Armored Brown Bear
	[60116] = {[16] = true, [21] = true, [37] = true},  -- Armored Brown Bear
	[60118] = {[16] = true, [21] = true, [37] = true},  -- Black War Bear
	[60119] = {[16] = true, [21] = true, [37] = true},  -- Black War Bear
	--[64987] = {[14] = true, [20] = true, [21] = true, [29] = true, [38] = true, [999] = true},  --Big Blizzard Bear [PH] - ticket 211
	
	[8394] = {[14] = true, [20] = true, [38] = true},  -- Striped Frostsaber
	[10789] = {[14] = true, [20] = true, [38] = true},  -- Spotted Frostsaber
	[10793] = {[14] = true, [20] = true, [38] = true},  -- Striped Nightsaber
	[16055] = {[16] = true, [21] = true, [37] = true},  -- Black Nightsaber
	[16056] = {[16] = true, [21] = true, [37] = true},  -- Ancient Frostsaber
	[16058] = {[14] = true, [20] = true, [38] = true},  -- Primal Leopard
	[16059] = {[14] = true, [20] = true, [38] = true},  -- Tawny Sabercat
	[16060] = {[14] = true, [20] = true, [38] = true},  -- Golden Sabercat
	[17229] = {[16] = true, [21] = true, [38] = true},  -- Winterspring Frostsaber
	[22723] = {[16] = true, [21] = true, [37] = true},  -- Black War Tiger
	[23219] = {[16] = true, [21] = true, [37] = true},  -- Swift Mistsaber
	[23220] = {[16] = true, [21] = true, [37] = true},  -- Swift Dawnsaber
	[23221] = {[16] = true, [21] = true, [37] = true},  -- Swift Frostsaber
	[23338] = {[16] = true, [21] = true, [37] = true},  -- Swift Stormsaber
	[24252] = {[16] = true, [21] = true, [37] = true},  -- Swift Zulian Tiger
	[42776] = {[14] = true, [20] = true, [38] = true},  -- Spectral Tiger
	[42777] = {[16] = true, [21] = true, [37] = true},  -- Swift Spectral Tiger
	[63637] = {[16] = true, [21] = true, [37] = true},  -- Darnassian Nightsaber (Swift Darnassian Mistsaber)
	[65638] = {[16] = true, [21] = true, [37] = true},  -- Swift Moonsaber
	[66847] = {[14] = true, [20] = true, [38] = true},  -- Striped Dawnsaber
	
	[458] = {[14] = true, [20] = true, [38] = true},  -- Brown Horse
	[468] = {[14] = true, [20] = true, [38] = true},  -- White Stallion
	[470] = {[14] = true, [20] = true, [38] = true},  -- Black Stallion
	[471] = {[14] = true, [20] = true, [38] = true},  -- Palamino
	[472] = {[14] = true, [20] = true, [38] = true},  -- Pinto
	[5784] = {[14] = true, [20] = true, [38] = true},  -- Felsteed
	[6648] = {[14] = true, [20] = true, [38] = true},  -- Chestnut Mare
	[13819] = {[14] = true, [20] = true, [38] = true},  -- Warhorse
	[16082] = {[16] = true, [21] = true, [37] = true},  -- Palomino
	[16083] = {[16] = true, [21] = true, [37] = true},  -- White Stallion
	[17462] = {[14] = true, [20] = true, [38] = true},  -- Red Skeletal Horse
	[17463] = {[14] = true, [20] = true, [38] = true},  -- Blue Skeletal Horse
	[17464] = {[14] = true, [20] = true, [38] = true},  -- Brown Skeletal Horse
	[17465] = {[16] = true, [21] = true, [37] = true},  -- Green Skeletal Warhorse
	[17481] = {[16] = true, [21] = true, [37] = true},  -- Rivendare's Deathcharger
	[22717] = {[16] = true, [21] = true, [37] = true},  -- Black War Steed
	[22722] = {[16] = true, [21] = true, [37] = true},  -- Red Skeletal Warhorse
	[23161] = {[16] = true, [21] = true, [37] = true},  -- Dreadsteed
	[23214] = {[16] = true, [21] = true, [37] = true},  -- Charger
	[23227] = {[16] = true, [21] = true, [37] = true},  -- Swift Palomino
	[23228] = {[16] = true, [21] = true, [37] = true},  -- Swift White Steed
	[23229] = {[16] = true, [21] = true, [37] = true},  -- Swift Brown Steed
	[23246] = {[16] = true, [21] = true, [37] = true},  -- Purple Skeletal Warhorse
	[34767] = {[16] = true, [21] = true, [37] = true},  -- Summon Charger
	[34769] = {[14] = true, [20] = true, [38] = true},  -- Summon Warhorse
	[36702] = {[16] = true, [21] = true, [37] = true},  -- Fiery Warhorse
	[48025] = {[16] = true, [21] = true, [38] = true, [20] = true, [22] = true, [23] = true, [29] = true, [3] = true, [9] = true},  -- Headless Horseman's Mount
	[48778] = {[16] = true, [21] = true, [37] = true},  -- Acherus Deathcharger
	[58819] = {[16] = true, [21] = true, [37] = true},  -- Swift Brown Steed
	[63232] = {[16] = true, [21] = true, [37] = true},  -- Stormwind Steed (Swift Stormwind Steed)
	[63643] = {[16] = true, [21] = true, [37] = true},  -- Forsaken Warhorse
	[64656] = {[16] = true, [21] = true, [37] = true},  -- Blue Skeletal Warhorse
	[64977] = {[14] = true, [20] = true, [38] = true},  -- Black Skeletal Horse
	[65640] = {[16] = true, [21] = true, [37] = true},  -- Swift Gray Steed
	[65645] = {[16] = true, [21] = true, [37] = true},  -- White Skeletal Warhorse
	[66090] = {[16] = true, [21] = true, [37] = true},  -- Quel'dorei Steed
	[66846] = {[16] = true, [21] = true, [37] = true},  -- Ochre Skeletal Warhorse
	[66906] = {[16] = true, [21] = true, [37] = true},  -- Argent Charger
	[66907] = {[14] = true, [20] = true, [38] = true},  -- Argent Warhorse
	[67466] = {[16] = true, [21] = true, [37] = true},  -- Argent Warhorse
	[68057] = {[16] = true, [21] = true, [37] = true},  -- Swift Alliance Steed
	[68187] = {[16] = true, [21] = true, [37] = true},  -- Crusader's White Warhorse
	[68188] = {[16] = true, [21] = true, [37] = true},  -- Crusader's Black Warhorse
	[72286] = {[9] = true, [3] = true, [14] = true, [20] = true, [21] = true, [22] = true, [29] = true, [23] = true, [38] = true, [24] = true},  -- Invincible
	[73313] = {[16] = true, [21] = true, [37] = true},  -- Crimson Deathcharger
	[75614] = {[9] = true, [3] = true, [6] = true, [14] = true, [20] = true, [21] = true, [22] = true, [29] = true, [23] = true, [38] = true, [24] = false},  -- Celestial Steed
	
	[34406] = {[14] = true, [20] = true, [38] = true},  -- Brown Elekk
	[34407] = {[16] = true, [21] = true, [37] = true},  -- Great Elite Elekk
	[35710] = {[14] = true, [20] = true, [38] = true},  -- Gray Elekk
	[35711] = {[14] = true, [20] = true, [38] = true},  -- Purple Elekk
	[35712] = {[16] = true, [21] = true, [37] = true},  -- Great Green Elekk
	[35713] = {[16] = true, [21] = true, [37] = true},  -- Great Blue Elekk
	[35714] = {[16] = true, [21] = true, [37] = true},  -- Great Purple Elekk
	[47037] = {[16] = true, [21] = true, [37] = true},  -- Swift War Elekk
	[48027] = {[16] = true, [21] = true, [37] = true},  -- Black War Elekk
	[63639] = {[16] = true, [21] = true, [37] = true},  -- Exodar Elekk  (Great Azuremyst Elekk)
	[65637] = {[16] = true, [21] = true, [37] = true},  -- Grea Red Elekk (Blizzard typo on PTR?)

	[50281] = {[16] = true, [21] = true, [37] = true},  -- Black Warp Stalker

	[59785] = {[16] = true, [21] = true, [37] = true},  -- Black War Mammoth
	[59788] = {[16] = true, [21] = true, [37] = true},  -- Black War Mammoth
	[59791] = {[16] = true, [21] = true, [37] = true},  -- Wooly Mammoth
	[59793] = {[16] = true, [21] = true, [37] = true},  -- Wooly Mammoth
	[59797] = {[16] = true, [21] = true, [37] = true, [73] = true},  -- Ice Mammoth
	[59799] = {[16] = true, [21] = true, [37] = true, [73] = true},  -- Ice Mammoth
	[59802] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Ice Mammoth
	[59804] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Ice Mammoth
	[59810] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Black War Mammoth
	[59811] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Black War Mammoth
	[60136] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Caravan Mammoth
	[60140] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Caravan Mammoth
	[61425] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Traveler's Tundra Mammoth
	[61447] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Traveler's Tundra Mammoth
	[61465] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Black War Mammoth
	[61466] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Black War Mammoth
	[61467] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Black War Mammoth
	[61469] = {[16] = true, [21] = true, [37] = true, [2] = true},  -- Grand Ice Mammoth
	[61470] = {[16] = true, [21] = true, [37] = true, [2] = true, [73] = true},  -- Grand Ice Mammoth
	
	[48954] = {[16] = true, [21] = true, [37] = true},  -- Swift Zhevra
	[49322] = {[16] = true, [21] = true, [37] = true},  -- Swift Zhevra

	[44151] = {[11] = true, [23] = true, [39] = true, [46] = true, [9] = true},  -- Turbo-Charged Flying Machine
	[44153] = {[12] = true, [22] = true, [36] = true, [45] = true, [9] = true},  -- Flying Machine
	[55531] = {[17] = true, [21] = true, [37] = true, [2] = true},  -- Mechano-hog
	[60424] = {[17] = true, [21] = true, [37] = true, [2] = true},  -- Mekgineer's Chopper
	[63796] = {[11] = true, [24] = true, [35] = true, [9] = true},  -- Mimiron's Head
	

	[61309] = {[11] = true, [23] = true, [49] = true, [9] = true, [35] = true},  -- Magnificent Flying Carpet
	[61442] = {[11] = true, [47] = true, [9] = true, [23] = true, [35] = true},  -- Swift Mooncloth Carpet
	[61444] = {[11] = true, [47] = true, [9] = true, [23] = true, [35] = true},  -- Swift Shadoweave Carpet
	[61446] = {[11] = true, [47] = true, [9] = true, [23] = true, [35] = true},  -- Swift Spellfire Carpet
	[61451] = {[12] = true, [48] = true, [9] = true, [22] = true, [36] = true},  -- Flying Carpet
	[75596] = {[11] = true, [23] = true, [9] = true, [49] = true, [35] = true},  -- Frosty Flying Carpet
	--	[????] = {[11] = true, [47] = true, [9] = true, [23] = true, [35] = true},  -- Swift Flying Carpet   --- item 39303

	[61996] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Blue Dragonhawk
	[61997] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Red Dragonhawk
	[62048] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Black Dragonhawk Mount
	[66088] = {[11] = true, [23] = true, [35] = true, [9] = true},  -- Sunreaver Dragonhawk
	
	[74918] = {[16] = true, [21] = true, [37] = true},  -- Wooly White Rhino
	
	
--	[62087] = {[5] = true, [15] = true, [21] = true, [39] = true, [53] = true, [999] = true},  -- Aquatic Riding Ray   -- removed from the 3.1 PTR datafiles
	
-- Below are not used for detection, only used to prevent being reported as unknown mounts
	[40120] = {[9] = true, [11] = true, [23] = true},  -- GOGO_DRUID_FAST_FLIGHTFORM
	[33943] = {[9] = true, [11] = true, [22] = true},  -- GOGO_DRUID_FLIGHTFORM
	[783] = {[28] = true}, -- GOGO_DRUID_TRAVELFORM
	[2645] = {[28] = true}, -- GOGO_SHAMAN_GHOSTWOLF
	
-- Mounts for Cataclysm (keeping seperate as they may change before release)
	[69820] = {[14] = true, [20] = true, [38] = true},  -- Sunwalker Kodo
	[69826] = {[16] = true, [21] = true, [37] = true},  -- Great Sunwalker Kodo
	[73629] = {[14] = true, [20] = true, [38] = true},  -- Exarch's Elekk
	[73630] = {[16] = true, [21] = true, [37] = true},  -- Great Exarch's Elekk
	[75207] = {[8] = true, [30] = true, [17] = true, [35] = true},  -- Abyssal Seahorse (was Abyssal Manta)
	[84751] = {[16] = true, [21] = true, [37] = true},  -- Fossilized Raptor
	[87090] = {[14] = true, [20] = true, [38] = true}, -- Goblin Trike
	[87091] = {[16] = true, [21] = true, [37] = true}, -- Goblin Turbo-Trike
	[88331] = {[9] = true, [11] = true, [24] = true}, -- Volcanic Stone Drake
	[88335] = {[9] = true, [11] = true, [24] = true, [35] = true}, -- Drake of the East Wind
	
}
	
GoGo_MountsItems = {
	[1] = 33189,
	[2] = 37011,
	[3] = 33183,
	[4] = 33176,
	[5] = 33182,
	[6] = 33184,
	[7] = 44229,
	[8] = 44221,
	[9] = 37859,
	[10] = 37860,
	[11] = 37815,
}

--[[
GoGo_FlyCoOrds = {   -- x = west / east,  y = north / south
	["Dalaran"] = {
		["Underbelly"] = {
			[1] = {0.09200777113437, 0.53064680099487, 0.30007892847061, 0.88580405712128},  -- south west pipe
--			[2] = {0.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000},  -- 3.0.8 PTR the pipe did not have any location co-ordinates as well as other parts of underbelly
		},
		["Dalaran"] = {
			[1] = {0.32762300968170, 0.92964243888855, 0.44406870007515, 0.99999999999999},  -- south floating rock - south part of rock is off dalaran map and zero's out
			[2] = {0.00000000000000, 0.00000000000000, 0.00000000000000, 0.00000000000000},  -- south end of south floating rock that's considered off the dalaran map, north end of north floating rock
			[3] = {0.84375905990601, 0.53441548347473, 0.92961716651917, 0.56119620800018},  -- east floating rock near Karasus' Landing - north half
			[4] = {0.81565266847610, 0.56119620800018, 0.92961716651917, 0.62259274721146},  -- east floating rock near Karasus' Landing - middle section
			[5] = {0.82037299871445, 0.62259274721146, 0.92961716651917, 0.65996080636978},  -- east floating rock near Karasus' Landing - south of above middle section
			[6] = {0.83119285106659, 0.65996080636978, 0.92961716651917, 0.69355386495590},  -- east floating rock near Karasus' Landing - south half
			[7] = {0.24048496782780, 0.00000000000000, 0.35678505897522, 0.06878154724837},  -- north floating rock - middle section
			[8] = {0.24048496782780, 0.06878154724837, 0.32650312781334, 0.09258409589529},  -- north floating rock - south section
			[9] = {0.73049765825272, 0.58968532085419, 0.82789492607117, 0.69320708513260},  -- outer rim - south of Karasus' Landing
			[10] = {0.78565186262131, 0.69320708513260, 0.82789492607117, 0.90059036016464},  -- outer rim - south of above
			[11] = {0.19430139660835, 0.73027163743973, 0.82789492607117, 0.91422116756439},  -- outer rim - south end
			[12] = {0.07060649325275, 0.27633512020111, 0.26812949776649, 0.73027163743973},  -- outer rim - west end
			[13] = {0.12171425670385, 0.13289329409599, 0.29824274778366, 0.34425541758537},  -- outer rim - north end - east from above
			[14] = {0.29824274778366, 0.13289329409599, 0.30157667398453, 0.34425541758537},  -- outer rim - north end - east from above
			[15] = {0.30157667398453, 0.13289329409599, 0.30533048510551, 0.33688980340958},  -- outer rim - north end - east from above
			[16] = {0.30533048510551, 0.13289329409599, 0.30807453393936, 0.32788288593292},  -- outer rim - north end - east from above
			[17] = {0.30807453393936, 0.13289329409599, 0.31300327181816, 0.32129821181297},  -- outer rim - north end - east from above
			[18] = {0.31300327181816, 0.13289329409599, 0.31939730048180, 0.30955401062965},  -- outer rim - north end - east from above
			[19] = {0.31939730048180, 0.05900426954031, 0.42953002452850, 0.27856853604317},  -- outer rim - north end - east from above
			[20] = {0.42953002452850, 0.01805531047284, 0.52528887987137, 0.16944953799248},  -- outer rim - north end - east from above
			[21] = {0.52528887987137, 0.01805531047284, 0.74681603908539, 0.16944953799248},  -- outer rim - north end - east from above
			[22] = {0.67614758014679, 0.16781881451607, 0.82789492607117, 0.73049765825272},  -- outer rim - north east - south east from above to Karasus' Landing
		},
		["VioletCitadel"] = {
			[1] = {0.24813342094431, 0.42324751615524, 0.26391690969467, 0.43607267737389},  -- upper level south part
			[2] = {0.25418719649315, 0.41306078433990, 0.26763379573822, 0.42324751615524},  -- upper level north east from above
			[3] = {0.25979378819466, 0.40825596451759, 0.26960688829422, 0.41306078433990},  -- upper level north from above
			[4] = {0.26259636878967, 0.39096131920815, 0.27175131440163, 0.40825596451759},  -- upper level north from above
			[5] = {0.26015603542328, 0.37608715891838, 0.27175131440163, 0.39096131920815},  -- upper level north west from above
			[6] = {0.24976442754269, 0.36279606819153, 0.26814296841621, 0.37608715891838},  -- upper level north west from above
			[7] = {0.21763536334038, 0.34758481383324, 0.26284533739090, 0.36279606819153},  -- upper level north part
			[8] = {0.21075734496117, 0.36279606819153, 0.23006491363049, 0.38133582472801},  -- upper level south west from above
			[9] = {0.20883683860302, 0.38133582472801, 0.22105532884598, 0.41938513517380},  -- upper level south from above
		},
	},
}
]]
