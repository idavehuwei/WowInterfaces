--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * _NPCScan.Overlay.lua - Adds mob patrol paths to your map.                  *
  ****************************************************************************]]


local _NPCScan = _NPCScan;
local me = {};
_NPCScan.Overlay = me;

local ADDON_NAME = "_NPCScan.Overlay";
me.Version = GetAddOnMetadata( ADDON_NAME, "Version" ):match( "^([%d.]+)" );

me.Options = {
	Version = me.Version;
	Modules = {};
	ModulesAlpha = {};
};

me.OptionsDefault = {
	Version = me.Version;
	Modules = {};
	ModulesAlpha = {};
};


me.Modules = {};
me.ModuleInitializers = {}; -- [ ParentAddOn ] = Module;

me.NPCMaps = {}; -- [ NpcID ] = MapName;
me.NPCsEnabled = {};
me.NPCsFoundX = {};
me.NPCsFoundY = {};
me.NPCsFoundIgnored = {
	[ 32487 ] = true; -- Putridus the Ancient
};

me.Colors = {
	RAID_CLASS_COLORS.SHAMAN,
	RAID_CLASS_COLORS.DEATHKNIGHT,
	GREEN_FONT_COLOR,
	RAID_CLASS_COLORS.DRUID,
	RAID_CLASS_COLORS.PALADIN,
};

me.DetectionRadius = 100; -- yards

local TexturesUnused = CreateFrame( "Frame" );

local MESSAGE_ADD = "NpcOverlay_Add";
local MESSAGE_REMOVE = "NpcOverlay_Remove";
local MESSAGE_FOUND = "NpcOverlay_Found";




--[[****************************************************************************
  * Function: _NPCScan.Overlay.SafeCall                                        *
  * Description: Catches errors and throws them without ending execution.      *
  ****************************************************************************]]
local SafeCall;
do
	local pcall = pcall;
	function SafeCall ( Function, ... )
		local Success, ErrorMessage = pcall( Function, ... );
		if ( not Success ) then
			geterrorhandler()( ErrorMessage );
		end
	end
	me.SafeCall = SafeCall;
end


--[[****************************************************************************
  * Function: _NPCScan.Overlay:TextureCreate                                   *
  * Description: Prepares an unused texture on the given frame.                *
  ****************************************************************************]]
function me:TextureCreate ( Layer, R, G, B, A )
	local Texture = #TexturesUnused > 0 and TexturesUnused[ #TexturesUnused ];
	if ( Texture ) then
		TexturesUnused[ #TexturesUnused ] = nil;
		Texture:SetParent( self );
		Texture:SetDrawLayer( Layer );
		Texture:ClearAllPoints();
		Texture:Show();
	else
		Texture = self:CreateTexture( nil, Layer );
	end
	Texture:SetVertexColor( R, G, B, A or 1 );
	Texture:SetBlendMode( "BLEND" );

	self[ #self + 1 ] = Texture;
	return Texture;
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:TextureAdd                                      *
  * Description: Draw a triangle texture with vertices at relative coords.     *
  ****************************************************************************]]
do
	local ApplyTransform;
	local Texture;
	do
		local Det, AF, BF, CD, CE;
		local ULx, ULy, LLx, LLy, URx, URy, LRx, LRy;
		function ApplyTransform( A, B, C, D, E, F )
			Det = A * E - B * D;
			AF, BF, CD, CE = A * F, B * F, C * D, C * E;

			ULx, ULy = ( BF - CE ) / Det, ( CD - AF ) / Det;
			LLx, LLy = ( BF - CE - B ) / Det, ( CD - AF + A ) / Det;
			URx, URy = ( BF - CE + E ) / Det, ( CD - AF - D ) / Det;
			LRx, LRy = ( BF - CE + E - B ) / Det, ( CD - AF - D + A ) / Det;

			-- Bounds to prevent "TexCoord out of range" errors
			if ( ULx < -1e4 ) then ULx = -1e4; elseif ( ULx > 1e4 ) then ULx = 1e4; end
			if ( ULy < -1e4 ) then ULy = -1e4; elseif ( ULy > 1e4 ) then ULy = 1e4; end
			if ( LLx < -1e4 ) then LLx = -1e4; elseif ( LLx > 1e4 ) then LLx = 1e4; end
			if ( LLy < -1e4 ) then LLy = -1e4; elseif ( LLy > 1e4 ) then LLy = 1e4; end
			if ( URx < -1e4 ) then URx = -1e4; elseif ( URx > 1e4 ) then URx = 1e4; end
			if ( URy < -1e4 ) then URy = -1e4; elseif ( URy > 1e4 ) then URy = 1e4; end
			if ( LRx < -1e4 ) then LRx = -1e4; elseif ( LRx > 1e4 ) then LRx = 1e4; end
			if ( LRy < -1e4 ) then LRy = -1e4; elseif ( LRy > 1e4 ) then LRy = 1e4; end

			Texture:SetTexCoord( ULx, ULy, LLx, LLy, URx, URy, LRx, LRy );
		end
	end
	local MinX, MinY, WindowX, WindowY;
	local ABx, ABy, BCx, BCy;
	local ScaleX, ScaleY, ShearFactor, Sin, Cos;
	local Parent, Width, Height;
	local SinScaleX, SinScaleY, CosScaleX, CosScaleY;
	local BorderScale, BorderOffset = 512 / 510, -1 / 512; -- Removes one-pixel transparent border
	function me:TextureAdd ( Layer, R, G, B, Ax, Ay, Bx, By, Cx, Cy )
		ABx, ABy, BCx, BCy = Ax - Bx, Ay - By, Bx - Cx, By - Cy;
		ScaleX = ( BCx * BCx + BCy * BCy ) ^ 0.5;
		if ( ScaleX == 0 ) then
			return;
		end
		ScaleY = ( ABx * BCy - BCx * ABy ) / ScaleX;
		if ( ScaleY == 0 ) then
			return;
		end
		ShearFactor = -( ABx * BCx + ABy * BCy ) / ( ScaleX * ScaleX );
		Sin, Cos = BCy / ScaleX, -BCx / ScaleX;


		-- Get a texture
		Texture = me.TextureCreate( self, Layer, R, G, B );
		Texture:SetTexture( [[Interface\AddOns\_NPCScan.Overlay\Skin\Triangle]] );


		-- Note: The texture region is made as small as possible to improve framerates.
		MinX, MinY = min( Ax, Bx, Cx ), min( Ay, By, Cy );
		WindowX, WindowY = max( Ax, Bx, Cx ) - MinX, max( Ay, By, Cy ) - MinY;

		Width, Height = self:GetWidth(), self:GetHeight();
		Texture:SetPoint( "TOPLEFT", MinX * Width, -MinY * Height );
		Texture:SetWidth( WindowX * Width );
		Texture:SetHeight( WindowY * Height );


		--[[ Transform parallelogram so its corners lie on the tri's points:
		local Matrix = Identity;
		-- Remove transparent border
		Matrix = Matrix:Scale( BorderScale, BorderScale );
		Matrix = Matrix:Translate( BorderOffset, BorderOffset );

		Matrix = Matrix:Shear( ShearFactor ); -- Shear the image so its bottom left corner aligns with point A
		Matrix = Matrix:Scale( ScaleX, ScaleY ); -- Scale X by the length of line BC, and Y by the length of the perpendicular line from BC to point A
		Matrix = Matrix:Rotate( Sin, Cos ); -- Align the top of the triangle with line BC.
		
		Matrix = Matrix:Translate( Bx - MinX, By - MinY ); -- Move origin to overlap point B
		Matrix = Matrix:Scale( 1 / WindowX, 1 / WindowY ); -- Adjust for change in texture size

		ApplyTransform( unpack( Matrix, 1, 6 ) );
		]]

		-- Common operations
		WindowX, WindowY = BorderScale / WindowX, BorderScale / WindowY;
		SinScaleX, SinScaleY = -Sin * ScaleX, Sin * ScaleY;
		CosScaleX, CosScaleY =  Cos * ScaleX, Cos * ScaleY;

		ApplyTransform(
			WindowX * CosScaleX,
			WindowX * ( SinScaleY + CosScaleX * ShearFactor ),
			WindowX * ( ( SinScaleY + CosScaleX * ( 1 + ShearFactor ) ) * BorderOffset + Bx - MinX ) / BorderScale,
			WindowY * SinScaleX,
			WindowY * ( CosScaleY + SinScaleX * ShearFactor ),
			WindowY * ( ( CosScaleY + SinScaleX * ( 1 + ShearFactor ) ) * BorderOffset + By - MinY ) / BorderScale );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:TextureRemoveAll                                *
  * Description: Removes all triangle textures from a frame.                   *
  ****************************************************************************]]
function me:TextureRemoveAll ()
	for Index = #self, 1, -1 do
		local Texture = self[ Index ];
		self[ Index ] = nil;
		Texture:Hide();
		Texture:SetParent( TexturesUnused );
		TexturesUnused[ #TexturesUnused + 1 ] = Texture;
	end
end


--[[****************************************************************************
  * Function: _NPCScan.Overlay:DrawPath                                        *
  * Description: Draws the given NPC's path onto a frame.                      *
  ****************************************************************************]]
do
	local Max = 2 ^ 16 - 1;
	local Ax1, Ax2, Ay1, Ay2, Bx1, Bx2, By1, By2, Cx1, Cx2, Cy1, Cy2;
	function me:DrawPath ( PathData, Layer, R, G, B )
		for Index = 1, #PathData, 12 do
			Ax1, Ax2, Ay1, Ay2, Bx1, Bx2, By1, By2, Cx1, Cx2, Cy1, Cy2 = PathData:byte( Index, Index + 11 );
			me.TextureAdd( self, Layer, R, G, B,
				( Ax1 * 256 + Ax2 ) / Max, ( Ay1 * 256 + Ay2 ) / Max,
				( Bx1 * 256 + Bx2 ) / Max, ( By1 * 256 + By2 ) / Max,
				( Cx1 * 256 + Cx2 ) / Max, ( Cy1 * 256 + Cy2 ) / Max );
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:DrawFound                                       *
  * Description: Adds a found NPC's range circle onto a frame.                 *
  ****************************************************************************]]
do
	local RingWidth = 1.14; -- Ratio of texture width to ring width
	local GlowWidth = 1.25;
	local Width, Height, Size;
	local Texture;
	function me:DrawFound ( X, Y, RadiusX, Layer, R, G, B )
		Width, Height = self:GetWidth(), self:GetHeight();

		X, Y = X * Width, -Y * Height;
		Size = RadiusX * 2 * Width;

		Texture = me.TextureCreate( self, Layer, R, G, B );
		Texture:SetTexture( [[Interface\Minimap\Ping\ping2]] );
		Texture:SetTexCoord( 0, 1, 0, 1 );
		Texture:SetBlendMode( "ADD" );
		Texture:SetPoint( "CENTER", self, "TOPLEFT", X, Y );
		Texture:SetWidth( Size * RingWidth );
		Texture:SetHeight( Size * RingWidth );

		Texture = me.TextureCreate( self, Layer, R, G, B, 0.5 );
		Texture:SetTexture( [[Textures\SunCenter]] );
		Texture:SetTexCoord( 0, 1, 0, 1 );
		Texture:SetBlendMode( "ADD" );
		Texture:SetPoint( "CENTER", self, "TOPLEFT", X, Y );
		Texture:SetWidth( Size * GlowWidth );
		Texture:SetHeight( Size * GlowWidth );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:ApplyZone                                       *
  * Description: Passes the NpcID, color, PathData, ZoneWidth, and ZoneHeight  *
  *   of all NPCs in a zone to a callback function.                            *
  ****************************************************************************]]
function me:ApplyZone ( Map, Callback )
	local MapData = me.PathData[ Map ];
	if ( MapData ) then
		local ColorIndex = 0;

		for NpcID, PathData in pairs( MapData ) do
			ColorIndex = ColorIndex + 1;
			if ( me.NPCsEnabled[ NpcID ] ) then
				local Color = me.Colors[ ( ColorIndex - 1 ) % #me.Colors + 1 ];
				Callback( self, PathData, me.NPCsFoundX[ NpcID ], me.NPCsFoundY[ NpcID ], Color.r, Color.g, Color.b, NpcID );
			end
		end
	end
end




--[[****************************************************************************
  * Function: _NPCScan.Overlay.ModuleRegister                                  *
  * Description: Registers a canvas module to paint polygons on.               *
  ****************************************************************************]]
function me.ModuleRegister ( Name, Module, ParentAddon )
	me.Modules[ Name ] = Module;
	local Config = me.Config.ModuleRegister( Name, Module.Label );

	if ( ParentAddon ) then
		local Reason = select( 6, GetAddOnInfo( ParentAddon ) );
		if ( Reason and not ( Reason == "DISABLED" and IsAddOnLoadOnDemand( ParentAddon ) ) ) then
			me.ModuleUnregister( Name );
		elseif ( IsAddOnLoaded( ParentAddon ) ) then
			if ( Module.OnLoad ) then
				SafeCall( Module.OnLoad, Module );
				Module.OnLoad = nil;
			end
		else
			me.ModuleInitializers[ ParentAddon:upper() ] = Module;
		end
	end
	return Config;
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.ModuleUnregister                                *
  * Description: Disables the module for the session and disables its          *
  *   configuration controls.                                                  *
  ****************************************************************************]]
function me.ModuleUnregister ( Name )
	local Config = me.Config.Modules[ Name ];
	if ( Config.Enabled:IsEnabled() == 1 ) then
		Config.Enabled:SetEnabled( false );
		for _, Control in ipairs( Config ) do
			Control:SetEnabled( false );
		end

		local Module = me.Modules[ Name ];
		if ( me.Options.Modules[ Name ] ) then
			if ( Module.Disable ) then
				SafeCall( Module.Disable, Module );
			end
		end

		Module.Update = nil;
		Module.Enable = nil;
		Module.Disable = nil;
		Module.OnLoad = nil;
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.ModuleEnable                                    *
  ****************************************************************************]]
function me.ModuleEnable ( Name )
	if ( not me.Options.Modules[ Name ] ) then
		me.Options.Modules[ Name ] = true;

		local Config = me.Config.Modules[ Name ];
		Config.Enabled:SetChecked( true );
		if ( Config.Enabled:IsEnabled() == 1 ) then -- Still registered
			local Module = me.Modules[ Name ];
			for _, Control in ipairs( Config ) do
				Control:SetEnabled( true );
			end
			if ( Module.Enable ) then
				SafeCall( Module.Enable, Module );
			end
			if ( Module.Update ) then
				SafeCall( Module.Update, Module );
			end
		end
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.ModuleDisable                                   *
  ****************************************************************************]]
function me.ModuleDisable ( Name )
	local Enabled = me.Options.Modules[ Name ];
	if ( Enabled ~= false ) then -- True or nil, which defaults to enabled
		me.Options.Modules[ Name ] = false;

		local Config = me.Config.Modules[ Name ];
		for _, Control in ipairs( Config ) do
			Control:SetEnabled( false );
		end

		if ( Enabled ~= nil ) then -- Was previously enabled
			Config.Enabled:SetChecked( false );
			local Module = me.Modules[ Name ];
			if ( Config.Enabled:IsEnabled() == 1 and Module.Disable ) then -- Still registered
				SafeCall( Module.Disable, Module );
			end
		end
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.ModuleSetAlpha                                  *
  ****************************************************************************]]
function me.ModuleSetAlpha ( Name, Alpha )
	if ( Alpha ~= me.Options.ModulesAlpha[ Name ] ) then
		me.Options.ModulesAlpha[ Name ] = Alpha;

		me.Config.Modules[ Name ].Alpha:SetValue( Alpha );
		me.Modules[ Name ]:SetAlpha( Alpha );
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:ADDON_LOADED                                    *
  ****************************************************************************]]
function me:ADDON_LOADED ( _, Addon )
	Addon = Addon:upper(); -- For case insensitive file systems (Windows')
	local Module = me.ModuleInitializers[ Addon ];
	if ( Module ) then
		me.ModuleInitializers[ Addon ] = nil;
		if ( Module.OnLoad ) then
			SafeCall( Module.OnLoad, Module );
			Module.OnLoad = nil;
		end
	end
end




--[[****************************************************************************
  * Function: _NPCScan.Overlay.NPCAdd                                          *
  ****************************************************************************]]
function me.NPCAdd ( NpcID )
	local Map = me.NPCMaps[ NpcID ];
	if ( Map and not me.NPCsEnabled[ NpcID ] ) then
		me.NPCsEnabled[ NpcID ] = true;

		for Name in pairs( me.Options.Modules ) do
			local Module = me.Modules[ Name ];
			if ( Module.Update ) then
				SafeCall( Module.Update, Module, Map );
			end
		end
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.NPCRemove                                       *
  ****************************************************************************]]
function me.NPCRemove ( NpcID )
	if ( me.NPCsEnabled[ NpcID ] ) then
		me.NPCsEnabled[ NpcID ] = nil;

		local Map = me.NPCMaps[ NpcID ];
		for Name in pairs( me.Options.Modules ) do
			local Module = me.Modules[ Name ];
			if ( Module.Update ) then
				SafeCall( Module.Update, Module, Map );
			end
		end
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay.NPCFound                                        *
  ****************************************************************************]]
function me.NPCFound ( NpcID )
	local Map = me.NPCMaps[ NpcID ];
	if ( Map and not me.NPCsFoundIgnored[ NpcID ] ) then
		SetMapToCurrentZone();

		if ( Map == GetMapInfo() ) then
			local X, Y = GetPlayerMapPosition( "player" );
			if ( X ~= 0 and Y ~= 0 ) then
				me.NPCsFoundX[ NpcID ], me.NPCsFoundY[ NpcID ] = X, Y;

				for Name in pairs( me.Options.Modules ) do
					local Module = me.Modules[ Name ];
					if ( Module.Update ) then
						SafeCall( Module.Update, Module, Map );
					end
				end

				return true;
			end
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay[ MESSAGE_ADD ]                                  *
  ****************************************************************************]]
me[ MESSAGE_ADD ] = function ( _, _, NpcID )
	me.NPCAdd( NpcID );
end;
--[[****************************************************************************
  * Function: _NPCScan.Overlay[ MESSAGE_REMOVE ]                               *
  ****************************************************************************]]
me[ MESSAGE_REMOVE ] = function ( _, _, NpcID )
	me.NPCRemove( NpcID );
end;
--[[****************************************************************************
  * Function: _NPCScan.Overlay[ MESSAGE_FOUND ]                                *
  ****************************************************************************]]
me[ MESSAGE_FOUND ] = function ( _, _, NpcID )
	me.NPCFound( NpcID );
end;




--[[****************************************************************************
  * Function: _NPCScan.Overlay.Synchronize                                     *
  * Description: Reloads enabled modules from saved settings.                  *
  ****************************************************************************]]
function me.Synchronize ( Options )
	-- Load defaults if settings omitted
	if ( not Options ) then
		Options = me.OptionsDefault;
	end

	for Name, Module in pairs( me.Modules ) do
		if ( Options.Modules[ Name ] ~= false ) then -- New modules (nil) default to enabled
			me.ModuleEnable( Name );
		else
			me.ModuleDisable( Name );
		end
		me.ModuleSetAlpha( Name, Options.ModulesAlpha[ Name ] or Module.AlphaDefault );
		if ( Module.Synchronize ) then
			SafeCall( Module.Synchronize, Module, Options );
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:PLAYER_ENTERING_WORLD                           *
  ****************************************************************************]]
function me:PLAYER_ENTERING_WORLD ( Event )
	me[ Event ] = nil;
	me:UnregisterEvent( Event );

	local Options = _NPCScanOverlayOptions;
	_NPCScanOverlayOptions = me.Options;

	me.Synchronize( Options ); -- Loads defaults if nil
end
--[[****************************************************************************
  * Function: _NPCScan.Overlay:OnLoad                                          *
  ****************************************************************************]]
function me:OnLoad ()
	-- Build a reverse lookup of NPC IDs to zones
	for Map, MapData in pairs( me.PathData ) do
		for NpcID in pairs( MapData ) do
			me.NPCMaps[ NpcID ] = Map;
		end
	end

	me:RegisterMessage( MESSAGE_ADD );
	me:RegisterMessage( MESSAGE_REMOVE );
	me:RegisterMessage( MESSAGE_FOUND );
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	LibStub( "AceEvent-3.0" ):Embed( me );
	me:RegisterEvent( "ADDON_LOADED" );
	me:RegisterEvent( "PLAYER_ENTERING_WORLD" );

	me.ModuleInitializers[ ADDON_NAME:upper() ] = me;
end
