--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * _NPCScan.Overlay.Carbonite.lua - Modifies the WorldMap and Minimap modules *
  *   to work with Carbonite.                                                  *
  ****************************************************************************]]


if ( IsAddOnLoaded( "Cartographer3" ) or not IsAddOnLoaded( "Carbonite" ) ) then
	return;
end

local Overlay = _NPCScan.Overlay;
local CarboniteMap = NxMap1.NxM1;
local WorldMap = Overlay.WorldMap;
local me = CreateFrame( "Frame", nil, CarboniteMap.Frm );
Overlay.Carbonite = me;

me.KeyHidden = false;
local Key = WorldMap.Key;




--[[****************************************************************************
  * Function: _NPCScan.Overlay.Carbonite:OnUpdate                              *
  * Description: Repositions the module as the Carbonite map moves.            *
  ****************************************************************************]]
function me:OnUpdate ()
	CarboniteMap:CZF( CarboniteMap.Con, CarboniteMap.Zon, WorldMap, 1 );

	-- Fade the key frame out on mouseover with the rest of the map's buttons
	Key:SetAlpha( NxMap1.NxW.BaF );
end




--[[****************************************************************************
  * Function: _NPCScan.Overlay.Carbonite:WorldMapFrameOnShow                   *
  * Description: Set up the module to paint to the WorldMapFrame.              *
  ****************************************************************************]]
function me:WorldMapFrameOnShow ()
	me:SetScript( "OnUpdate", nil );

	WorldMap:SetScale( 1 );
	WorldMap:SetParent( WorldMapDetailFrame );
	WorldMap:SetAllPoints();

	Key:SetParent( WorldMapDetailFrame );
	Key:SetPoint( ( Key:GetPoint() ) );
	Key:SetAlpha( 1 );

	WorldMap.Key = Key; -- Temporarily allow updates to the key
	WorldMap:Update();
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.Carbonite:WorldMapFrameOnHide                   *
  * Description: Set up the module to paint to Carbonite's map.                *
  ****************************************************************************]]
function me:WorldMapFrameOnHide ()
	me:SetScript( "OnUpdate", me.OnUpdate );

	WorldMap:SetParent( CarboniteMap.TeF ); -- ScrollChild
	WorldMap:SetAllPoints();

	Key:SetParent( CarboniteMap.TeF );
	Key:SetPoint( Key:GetPoint(), CarboniteMap.Frm );

	if ( me.KeyHidden ) then -- Re-disable key
		me.SetSizeNormal();
	end
end


--[[****************************************************************************
  * Function: _NPCScan.Overlay.Carbonite.SetSizeMax                            *
  * Description: Shows the key when Carbonite is in "Max size" mode.           *
  ****************************************************************************]]
function me.SetSizeMax ()
	me.KeyHidden = false;
	if ( not WorldMapFrame:IsVisible() ) then
		WorldMap.Key = Key;
		WorldMap:Update(); -- Show if necessary
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.Carbonite.SetSizeNormal                         *
  * Description: Hides the key when Carbonite is in normal size mode.          *
  ****************************************************************************]]
function me.SetSizeNormal ()
	me.KeyHidden = true;
	if ( not WorldMapFrame:IsVisible() ) then
		WorldMap.Key = nil; -- Prevents updates from re-showing it
		Key:Hide();
	end
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	if ( NxData.NXGOpts.MapMMOwn ) then -- Minimap docked into WorldMap
		Overlay.ModuleUnregister( "Minimap" );
	end


	WorldMap:SetWidth( WorldMapDetailFrame:GetWidth() );
	WorldMap:SetHeight( WorldMapDetailFrame:GetHeight() );

	-- Hooks to swap between Carbonite's normal and max sizes
	hooksecurefunc( Nx.Map, "MaS1", me.SetSizeMax );
	hooksecurefunc( Nx.Map, "ReS1", me.SetSizeNormal );
	me[ Nx.Map:GeM( 1 ).Win1:ISM() and "SetSizeMax" or "SetSizeNormal" ]();

	-- Hooks to swap between Carbonite's map mode and the default UI map mode
	WorldMapFrame:HookScript( "OnShow", me.WorldMapFrameOnShow );
	WorldMapFrame:HookScript( "OnHide", me.WorldMapFrameOnHide );
	me[ WorldMapFrame:IsVisible() and "WorldMapFrameOnShow" or "WorldMapFrameOnHide" ]( WorldMapFrame );
end
