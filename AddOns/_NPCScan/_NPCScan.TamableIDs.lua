--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.TamableIDs.lua - IDs of all tamable rare mobs.                    *
  ****************************************************************************]]


-- Extracted from WowHead filter results:
-- http://www.wowhead.com/?npcs&filter=cl=4:2;fa=24:4:26:5:7:2:38:45:8:6:39:30:9:25:37:34:11:31:43:20:35:41:3:46:33:12:21:32:44:27:1:42
_NPCScan.TamableIDs = {
	[ 32481 ] = "SholazarBasin"; -- Aotona
	[ 14222 ] = "Alterac"; -- Araga
	[ 5349 ] = "Feralas"; -- Arash-ethis
	[ 5834 ] = "Barrens"; -- Azzere the Skyblade
	[ 2753 ] = "Badlands"; -- Barnabus
	[ 14280 ] = "Hilsbrad"; -- Big Samras
	[ 1130 ] = "DunMorogh"; -- Bjarn
	[ 4425 ] = true; -- Blind Hunter
	[ 2850 ] = "Badlands"; -- Broken Tooth
	[ 616 ] = "Redridge"; -- Chatter
	[ 8301 ] = "BlastedLands"; -- Clack the Reaver
	[ 6582 ] = "UngoroCrater"; -- Clutchmother Zavas
	[ 14223 ] = "Alterac"; -- Cranky Benj
	[ 14279 ] = "Hilsbrad"; -- Creepthess
	[ 18241 ] = "Desolace"; -- Crusty
	[ 4380 ] = "Dustwallow"; -- Darkmist Widow
	[ 14232 ] = "Dustwallow"; -- Dart
	[ 5823 ] = "Durotar"; -- Death Flayer
	[ 14339 ] = "Felwood"; -- Death Howl
	[ 10077 ] = "BurningSteppes"; -- Deathmaw
	[ 5865 ] = "Barrens"; -- Dishu
	[ 14430 ] = "Teldrassil"; -- Duskstalker
	[ 14228 ] = "Desolace"; -- Giggler
	[ 33776 ] = "ZulDrak"; -- Gondria
	[ 12431 ] = "Silverpine"; -- Gorefang
	[ 17144 ] = "Nagrand"; -- Goretooth
	[ 8207 ] = "Tanaris"; -- Greater Firebird
	[ 14472 ] = "Silithus"; -- Gretheer
	[ 14477 ] = "Silithus"; -- Grubthor
	[ 8303 ] = "BlastedLands"; -- Grunter
	[ 8205 ] = "Tanaris"; -- Haarka the Ravenous
	[ 14234 ] = "Dustwallow"; -- Hayoc
	[ 5828 ] = "Barrens"; -- Humar the Pridelord
	[ 8213 ] = "Hinterlands"; -- Ironback
	[ 32485 ] = "SholazarBasin"; -- King Krush
	[ 6584 ] = "UngoroCrater"; -- King Mosh
	[ 14476 ] = "Silithus"; -- Krellack
	[ 12433 ] = "Silverpine"; -- Krethis Shadowspinner
	[ 14491 ] = "Stranglethorn"; -- Kurmokk
	[ 14473 ] = "Silithus"; -- Lapress
	[ 2476 ] = "LochModan"; -- Large Loch Crocolisk
	[ 1112 ] = "Wetlands"; -- Leech Widow
	[ 32517 ] = "SholazarBasin"; -- Loque'nahak
	[ 14268 ] = "LochModan"; -- Lord Condar
	[ 521 ] = "Duskwood"; -- Lupos
	[ 3068 ] = "Mulgore"; -- Mazzranache
	[ 10644 ] = "Ashenvale"; -- Mist Howler
	[ 14344 ] = "Felwood"; -- Mongress
	[ 471 ] = "Elwynn"; -- Mother Fang
	[ 8208 ] = "Tanaris"; -- Murderous Blisterpaw
	[ 574 ] = "Duskwood"; -- Naraxis
	[ 20932 ] = "Netherstorm"; -- Nuramoc
	[ 8211 ] = "Hinterlands"; -- Old Cliff Jumper
	[ 5352 ] = "Feralas"; -- Old Grizzlegut
	[ 12432 ] = "Silverpine"; -- Old Vicejaw
	[ 14343 ] = "Felwood"; -- Olm the Wise
	[ 14237 ] = "Dustwallow"; -- Oozeworm
	[ 10200 ] = "Winterspring"; -- Rak'shiri
	[ 8300 ] = "BlastedLands"; -- Ravage
	[ 6581 ] = "UngoroCrater"; -- Ravasaur Matriarch
	[ 1140 ] = "Wetlands"; -- Razormaw Matriarch
	[ 8277 ] = "SearingGorge"; -- Rekk'tilac
	[ 10357 ] = "Tirisfal"; -- Ressan the Needler
	[ 14233 ] = "Dustwallow"; -- Ripscale
	[ 3581 ] = "Stormwind"; -- Sewer Beast
	[ 2175 ] = "Darkshore"; -- Shadowclaw
	[ 14266 ] = "LochModan"; -- Shanda the Spinner
	[ 4132 ] = "ThousandNeedles"; -- Silithid Ravager
	[ 35189 ] = "TheStormPeaks"; -- Skoll
	[ 5356 ] = "Feralas"; -- Snarler
	[ 5829 ] = "Barrens"; -- Snort the Heckler
	[ 8204 ] = "Tanaris"; -- Soriid the Devourer
	[ 8299 ] = "BlastedLands"; -- Spiteflayer
	[ 10359 ] = "Tirisfal"; -- Sri'skulk
	[ 2172 ] = "Darkshore"; -- Strider Clutchmother
	[ 5842 ] = "Barrens"; -- Takk the Leaper
	[ 32475 ] = "ZulDrak"; -- Terror Spinner
	[ 8660 ] = "Aszhara"; -- The Evalcharr
	[ 5807 ] = "Mulgore"; -- The Rake
	[ 11497 ] = "Feralas"; -- The Razza
	[ 1132 ] = "DunMorogh"; -- Timber
	[ 6585 ] = "UngoroCrater"; -- Uhk'loc
	[ 12037 ] = "Ashenvale"; -- Ursol'lok
	[ 5937 ] = "ThousandNeedles"; -- Vile Sting
	[ 462 ] = "Westfall"; -- Vultros
	[ 2931 ] = "Badlands"; -- Zaricotl
};


-- Replace map names with localized zone names
local ZoneNames = {};
local function HandleZones ( ContinentIndex, ... )
	for ZoneIndex = 1, select( "#", ... ) do
		SetMapZoom( ContinentIndex, ZoneIndex );
		ZoneNames[ GetMapInfo() ] = select( ZoneIndex, ... );
	end
end
for ContinentIndex = 1, select( "#", GetMapContinents() ) do
	HandleZones( ContinentIndex, GetMapZones( ContinentIndex ) );
end
for ID, Map in pairs( _NPCScan.TamableIDs ) do
	if ( type( Map ) == "string" ) then
		if ( not ZoneNames[ Map ] ) then
			error( "Unrecognized map name "..Map.."." );
		end
		_NPCScan.TamableIDs[ ID ] = ZoneNames[ Map ];
	end
end
