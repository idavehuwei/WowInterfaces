--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * _NPCScan.Overlay.ZoneData.lua - Zone size data and localized zone names.   *
  ****************************************************************************]]


local Overlay = _NPCScan.Overlay;
Overlay.ZoneMaps = {}; -- [ LocalizedZoneName ] = MapFile;

local Indexes = {};
local Widths = {};
local Heights = {};
local Names = {};




--[[****************************************************************************
  * Function: _NPCScan.Overlay.GetZoneSize                                     *
  * Description: Gets the width and height of a zone in yards.                 *
  ****************************************************************************]]
function Overlay.GetZoneSize ( Map )
	Map = Indexes[ Map ];
	return Widths[ Map ], Heights[ Map ];
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.GetZoneName                                     *
  * Description: Gets a localized zone name for a map.                         *
  ****************************************************************************]]
function Overlay.GetZoneName ( Map )
	return Names[ Indexes[ Map ] ];
end

local function Add ( Map, Width, Height )
	if ( Overlay.PathData[ Map ] ) then
		local Index = #Widths + 1;
		Indexes[ Map ] = Index;
		Widths[ Index ] = Width;
		Heights[ Index ] = Height;
	else
		geterrorhandler()( "Zone data unused for "..Map.."." );
	end
end

-- Zone dimensions generated by <_NPCScan.Tools/Tools/GetMapDimensions.lua>
-- Eastern Kingdoms
Add( 40, 4135.416687, 2756.250000 ); -- Wetlands

-- Kalimdor
Add( 141, 5250.000061, 3499.999756 ); -- Dustwallow Marsh
Add( 11, 10133.333008, 6756.249878 ); -- The Barrens
Add( 201, 3699.999817, 2466.666504 ); -- Un'Goro Crater

-- Outland
Add( 475, 5424.999756, 3616.666382 ); -- Blade's Edge Mountains
Add( 465, 5164.583008, 3443.749878 ); -- Hellfire Peninsula
Add( 477, 5525.000000, 3683.333168 ); -- Nagrand
Add( 479, 5574.999672, 3716.666748 ); -- Netherstorm
Add( 473, 5500.000000, 3666.666382 ); -- Shadowmoon Valley
Add( 478, 5399.999756, 3600.000061 ); -- Terokkar Forest
Add( 467, 5027.083496, 3352.083252 ); -- Zangarmarsh

-- Northrend
Add( 486, 5764.583008, 3843.749878 ); -- Borean Tundra
Add( 488, 5608.333130, 3739.583374 ); -- Dragonblight
Add( 490, 5249.999878, 3499.999878 ); -- Grizzly Hills
Add( 491, 6045.832886, 4031.249817 ); -- Howling Fjord
Add( 492, 6270.833313, 4181.250000 ); -- Icecrown
Add( 493, 4356.250000, 2904.166504 ); -- Sholazar Basin
Add( 495, 7112.499634, 4741.666016 ); -- The Storm Peaks
Add( 496, 4993.750000, 3329.166504 ); -- Zul'Drak


-- Build a lookup table for localized zone names to map files
-- Note: Doesn't support dungeon maps, as their localized names are unavailable in-game
for Map in pairs( Overlay.PathData ) do
	if ( not Indexes[ Map ] ) then
		geterrorhandler()( "Zone data missing for paths in "..Map.."." );
	end
end

local function HandleZones ( ContinentIndex, ... )
	for ZoneIndex = 1, select( "#", ... ) do
		SetMapZoom( ContinentIndex, ZoneIndex );

		local Map = GetCurrentMapAreaID() - 1;
		if ( Indexes[ Map ] ) then
			local Name = select( ZoneIndex, ... );
			Names[ Indexes[ Map ] ] = Name;
			Overlay.ZoneMaps[ Name ] = Map;
		end
	end
end

for ContinentIndex = 1, select( "#", GetMapContinents() ) do
	HandleZones( ContinentIndex, GetMapZones( ContinentIndex ) );
end