--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.Overlays.lua - Integration with NPC map overlay mods.             *
  ****************************************************************************]]


local L = _NPCScanLocalization;
local _NPCScan = _NPCScan;
local me = {};
_NPCScan.Overlays = me;

me.Debug = false; -- Set to true so incompatible hooks will throw real errors

local MESSAGE_ADD = "NpcOverlay_Add";
local MESSAGE_REMOVE = "NpcOverlay_Remove";
local MESSAGE_FOUND = "NpcOverlay_Found";




--[[****************************************************************************
  * Function: _NPCScan.Overlays.Add                                            *
  * Description: Enables overlay maps for a given NPC ID.                      *
  ****************************************************************************]]
function me.Add ( ID )
	me:SendMessage( MESSAGE_ADD, ID );
end
--[[****************************************************************************
  * Function: _NPCScan.Overlays.Remove                                         *
  * Description: Disables overlay maps for a given NPC ID.                     *
  ****************************************************************************]]
function me.Remove ( ID )
	me:SendMessage( MESSAGE_REMOVE, ID );
end
--[[****************************************************************************
  * Function: _NPCScan.Overlays.Found                                          *
  * Description: Lets overlay mods know the NPC ID was found.                  *
  ****************************************************************************]]
function me.Found ( ID )
	me:SendMessage( MESSAGE_FOUND, ID );
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	LibStub( "AceEvent-3.0" ):Embed( me );

	-- Add message support for RareSpawnOverlay
	if ( select( 6, GetAddOnInfo( "RareSpawnOverlay" ) ) ~= "MISSING" ) then
		local function SafeCall ( Func, ... )
			if ( me.Debug ) then
				Func( ... );
			elseif ( not pcall( Func, ... ) ) then -- Error
				me:UnregisterAllMessages();
				_NPCScan.Message( L.OVERLAY_INCOMPATIBLE:format( "RareSpawnOverlay",
					tostring( GetAddOnMetadata( "RareSpawnOverlay", "Version" ) ),
					_NPCScan.Version ), RED_FONT_COLOR );
			end
		end
		local function LoadRSO ()
			local RSO = RareSpawnOverlay.API;
			local Show = assert( RSO.ShowNPC );
			local Hide = assert( RSO.HideNPC );

			-- Remove all achievement overlays
			for _, Achievement in pairs( _NPCScan.Achievements ) do
				for _, NPCID in pairs( Achievement.Criteria ) do
					Hide( RSO, NPCID );
				end
			end

			me:RegisterMessage( MESSAGE_ADD, function ( _, ID )
				SafeCall( Show, RSO, ID );
			end );
			me:RegisterMessage( MESSAGE_REMOVE, function ( _, ID )
				SafeCall( Hide, RSO, ID );
			end );
		end
		if ( IsAddOnLoaded( "RareSpawnOverlay" ) ) then
			SafeCall( LoadRSO );
		else
			me:RegisterEvent( "ADDON_LOADED", function ( Event, AddOn )
				if ( AddOn:lower() == "rarespawnoverlay" ) then
					me:UnregisterEvent( Event );
					SafeCall( LoadRSO );
				end
			end );
		end
	end
end
