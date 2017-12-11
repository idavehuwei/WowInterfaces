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




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
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

	-- Zone dimensions copied from Astrolabe (http://www.gathereraddon.com). Astrolabe is licensed LGPL.
	-- Kalimdor
	Add( "Barrens", 10133.44231353798, 6756.201888541853 );
	Add( "Dustwallow", 5250.057340719384, 3499.975024621409 );
	Add( "UngoroCrater", 3700.039952384531, 2466.648940830691 );

	-- Eastern Kingdoms
	Add( "Wetlands", 4135.416085415621, 2756.260945423485 );

	-- Outland
	Add( "BladesEdgeMountains", 5424.971374542539, 3616.553525584605 );
	Add( "Hellfire", 5164.556244744065, 3443.64230460125 );
	Add( "Nagrand", 5524.971116484553, 3683.218433421437 );
	Add( "Netherstorm", 5574.970542741407, 3716.550667470386 );
	Add( "ShadowmoonValley", 5499.971055470069, 3666.551832578994 );
	Add( "TerokkarForest", 5399.971897226099, 3599.887549731843 );
	Add( "Zangarmarsh", 5027.057239215307, 3351.978661481413 );

	-- Northrend
	Add( "BoreanTundra", 5764.582303295793, 3843.764953143499 );
	Add( "Dragonblight", 5608.332396545997, 3739.598062842169 );
	Add( "GrizzlyHills", 5249.998732532693, 3500.013689934217 );
	Add( "HowlingFjord", 6045.831836878359, 4031.265457002443 );
	Add( "IcecrownGlacier", 6270.832975322177, 4181.266519840844 );
	Add( "SholazarBasin", 4356.249510482578, 2904.178067737769 );
	Add( "TheStormPeaks", 7112.498187401986, 4741.684740041381 );
	Add( "ZulDrak", 4993.749118857795, 3329.179762967791 );


	-- Build a lookup table for localized zone names to map files
	for Map in pairs( Overlay.PathData ) do
		if ( not Indexes[ Map ] ) then
			geterrorhandler()( "Zone data missing for paths in "..Map.."." );
		end
	end
	local function HandleZones ( ContinentIndex, ... )
		for ZoneIndex = 1, select( "#", ... ) do
			SetMapZoom( ContinentIndex, ZoneIndex );

			local Map = GetMapInfo();
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
end
