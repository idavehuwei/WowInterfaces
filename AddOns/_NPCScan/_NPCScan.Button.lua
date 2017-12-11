--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.Button.lua - Displays a button to target found NPCs.              *
  ****************************************************************************]]


local _NPCScan = _NPCScan;
local L = _NPCScanLocalization;
local LSM = LibStub( "LibSharedMedia-3.0" );
local me = CreateFrame( "Button", "_NPCScanButton", nil, "SecureActionButtonTemplate,SecureHandlerShowHideTemplate" );
_NPCScan.Button = me;

local Model = CreateFrame( "PlayerModel", nil, me );
me.Model = Model;

local Flash = CreateFrame( "Frame" );
me.Flash = Flash;
Flash.LoopCountMax = 3;

me.PendingName = nil;
me.PendingID = nil;

me.RotationRate = math.pi / 4;

-- Key is lowercase, value = "[Scale]|[X]|[Y]|[Z]", where any parameter can be left empty
me.ModelCameras = {
	[ "creature\\protodragon\\protodragon.m2" ] = "1.5|||10"; -- Time-lost Proto Drake

	[ "creature\\parrot\\parrot.m2" ] = "2"; -- Aotona
	[ "creature\\clockworkgnome\\clockworkgnome.m2" ] = "1.5"; -- Dirkee, Fumblub Gearwind
	[ "creature\\northrendstonegiant\\northrendstonegiant.m2" ] = "1.5"; -- Grocklar
	[ "creature\\valkierdark\\valkierdark.m2" ] = "1.7"; -- Hildana Deathstealer
	[ "creature\\northrendworgen\\northrendworgen.m2" ] = "2"; -- Perobas the Bloodthirster
	[ "creature\\northrendfleshgiant\\northrendfleshgiant.m2" ] = "1.5||2"; -- Putridus the Ancient
	[ "creature\\fleshbeast\\fleshbeast.m2" ] = "1.4"; -- Seething Hate
	[ "creature\\vrykulfemale\\vrykulfemalehunter.m2" ] = "2"; -- Syreian the Bonecarver, Vigdis the War Maiden
	[ "creature\\mammoth\\mammoth.m2" ] = ".6|.8|2.5"; -- Tukemuth
	[ "creature\\bonespider\\bonespider.m2" ] = "2||-1.5"; -- Terror Spinner
	[ "creature\\zuldrakgolem\\zuldrakgolem.m2" ] = ".65||1.4"; -- Zul'drak Sentinel
	[ "creature\\dragon\\northrenddragon.m2" ] = ".5||15|-3"; -- Vyragosa
};




--[[****************************************************************************
  * Function: _NPCScan.Button.SetNPC                                           *
  * Description: Sets the button to a given NPC and shows it.                  *
  ****************************************************************************]]
function me.SetNPC ( Name, ID )
	if ( tonumber( ID ) ) then
		_NPCScan.Overlays.Add( ID );
	end

	me.PlaySound( _NPCScan.Options.AlertSound );
	if ( GetCVarBool( "screenEdgeFlash" ) ) then
		Flash:Show();
		Flash.Fade:Pause(); -- Forces OnPlay to fire again if it was already playing
		Flash.Fade:Play();
	end

	if ( InCombatLockdown() ) then
		if ( tonumber( me.PendingID ) ) then -- Remove old pending NPC
			_NPCScan.Overlays.Remove( me.PendingID );
		end
		me.PendingName = Name;
		me.PendingID = ID;
	else
		me.Update( Name, ID );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Button.PlaySound                                        *
  ****************************************************************************]]
function me.PlaySound ( AlertSound )
	local SoundEnableChanged, SoundInBGChanged;
	if ( _NPCScan.Options.AlertSoundUnmute ) then
		if ( not GetCVarBool( "Sound_EnableAllSound" ) ) then
			SoundEnableChanged = true;
			SetCVar( "Sound_EnableAllSound", 1 );
		end
		if ( not GetCVarBool( "Sound_EnableSoundWhenGameIsInBG" ) ) then
			SoundInBGChanged = true;
			SetCVar( "Sound_EnableSoundWhenGameIsInBG", 1 );
		end
	end
	if ( AlertSound == nil ) then -- Default
		PlaySoundFile( [[sound\event sounds\event_wardrum_ogre.wav]] );
		PlaySoundFile( [[sound\events\scourge_horn.wav]] );
	else
		PlaySoundFile( LSM:Fetch( LSM.MediaType.SOUND, AlertSound ) );
	end
	if ( SoundEnableChanged ) then
		SetCVar( "Sound_EnableAllSound", 0 );
	end
	if ( SoundInBGChanged ) then
		SetCVar( "Sound_EnableSoundWhenGameIsInBG", 0 );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Button.Model.Reset                                      *
  * Description: Clears the model and readies it for a SetCreature call.       *
  ****************************************************************************]]
function Model.Reset ()
	Model:ClearModel();
	Model:SetModelScale( 1 );
	Model:SetPosition( 0, 0, 0 );
	Model:SetFacing( 0 );
end
--[[****************************************************************************
  * Function: _NPCScan.Button.Update                                           *
  * Description: Updates the button based on its Name and ID fields.           *
  ****************************************************************************]]
function me.Update ( Name, ID )
	if ( tonumber( me.ID ) ) then -- Remove last overlay
		_NPCScan.Overlays.Remove( me.ID );
	end
	me.ID = ID;

	me:Show(); -- Note: Must be visible before model scale calls will work
	me:SetText( Name );
	Model.Reset();
	if ( type( ID ) == "string" ) then -- ID is UnitID
		Model:SetUnit( ID );
		Model:SetModelScale( 0.75 );
		Name = ID;
	else -- ID is NPC ID
		Model:SetCreature( ID );
		if ( type( Model:GetModel() ) == "string" ) then
			local Scale, X, Y, Z = ( "|" ):split( me.ModelCameras[ Model:GetModel():lower() ] or "" );
			Model:SetModelScale( 0.5 * ( tonumber( Scale ) or 1 ) );
			Model:SetPosition( tonumber( Z ) or 0, tonumber( X ) or 0, tonumber( Y ) or 0 );
		end
	end
	me:SetAttribute( "macrotext", "/cleartarget\n/targetexact "..Name );

	me:StopAnimating();
	me.Glow:Play();
	me.Shine:Play();
end


--[[****************************************************************************
  * Function: _NPCScan.Button.EnableDrag                                       *
  * Description: Enables or disables dragging the button.                      *
  ****************************************************************************]]
function me.EnableDrag ( Enable )
	local Drag = me.Drag;
	Drag:ClearAllPoints();
	if ( Enable ) then
		Drag:SetAllPoints();
	else -- Position offscreen
		Drag:SetPoint( "TOP", UIParent, 0, math.huge );
	end
end


--[[****************************************************************************
  * Function: _NPCScan.Button:OnHide                                           *
  ****************************************************************************]]
function me:OnHide ()
	if ( tonumber( me.ID ) ) then -- Remove current overlay
		_NPCScan.Overlays.Remove( me.ID );
	end
	me.ID = nil;
end
--[[****************************************************************************
  * Function: _NPCScan.Button:OnEnter                                          *
  ****************************************************************************]]
function me:OnEnter ()
	me:SetBackdropBorderColor( 1, 1, 0.15 ); -- Yellow
end
--[[****************************************************************************
  * Function: _NPCScan.Button:OnLeave                                          *
  ****************************************************************************]]
function me:OnLeave ()
	me:SetBackdropBorderColor( 0.7, 0.15, 0.05 ); -- Brown
end

--[[****************************************************************************
  * Function: _NPCScan.Button:PLAYER_REGEN_ENABLED                             *
  ****************************************************************************]]
function me:PLAYER_REGEN_ENABLED ()
	-- Update button after leaving combat
	if ( me.PendingName and me.PendingID ) then
		me.Update( me.PendingName, me.PendingID );
		me.PendingName = nil;
		me.PendingID = nil;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Button:MODIFIER_STATE_CHANGED                           *
  ****************************************************************************]]
function me:MODIFIER_STATE_CHANGED ( _, Modifier, State )
	Modifier = Modifier:sub( 2 );
	if ( GetModifiedClick( "_NPCSCAN_BUTTONDRAG" ):find( Modifier, 1, true ) ) then
		me.EnableDrag( State == 1 );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Button:OnEvent                                          *
  * Description: Global event handler.                                         *
  ****************************************************************************]]
me.OnEvent = _NPCScan.OnEvent;


--[[****************************************************************************
  * Function: _NPCScan.Button.Flash:OnLoop                                     *
  * Description: Stops the animation after a number of loops.                  *
  ****************************************************************************]]
function Flash:OnLoop ( Direction )
	if ( Direction == "FORWARD" ) then
		self.LoopCount = self.LoopCount + 1;
		if ( self.LoopCount >= Flash.LoopCountMax ) then
			self:Stop();
			Flash:Hide();
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Button.Flash:OnPlay                                     *
  * Description: Resets the loop count when resumed/restarted.                 *
  ****************************************************************************]]
function Flash:OnPlay ()
	self.LoopCount = 0;
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	me:SetWidth( 150 );
	me:SetHeight( 42 );
	me:SetPoint( "BOTTOM", UIParent, 0, 128 );
	me:SetMovable( true );
	me:SetUserPlaced( true );
	me:SetClampedToScreen( true );
	me:SetFrameStrata( "FULLSCREEN_DIALOG" );
	me:SetNormalTexture( "Interface\\AchievementFrame\\UI-Achievement-Parchment-Horizontal" );
	local Background = me:GetNormalTexture();
	Background:SetDrawLayer( "BACKGROUND" );
	Background:ClearAllPoints();
	Background:SetPoint( "BOTTOMLEFT", 3, 3 );
	Background:SetPoint( "TOPRIGHT", -3, -3 );
	Background:SetTexCoord( 0, 1, 0, 0.25 );

	me:SetAttribute( "_onshow", "self:Enable();" );
	me:SetAttribute( "_onhide", "self:Disable();" );
	me:Hide();

	local TitleBackground = me:CreateTexture( nil, "BORDER" );
	TitleBackground:SetTexture( "Interface\\AchievementFrame\\UI-Achievement-Title" );
	TitleBackground:SetPoint( "TOPRIGHT", -5, -5 );
	TitleBackground:SetPoint( "LEFT", 5, 0 );
	TitleBackground:SetHeight( 18 );
	TitleBackground:SetTexCoord( 0, 0.9765625, 0, 0.3125 );
	TitleBackground:SetAlpha( 0.8 );

	local Title = me:CreateFontString( nil, "OVERLAY", "GameFontHighlightMedium" );
	me.Title = Title;
	Title:SetPoint( "TOPLEFT", TitleBackground );
	Title:SetPoint( "RIGHT", TitleBackground );
	me:SetFontString( Title );

	local SubTitle = me:CreateFontString( nil, "OVERLAY", "GameFontBlackTiny" );
	SubTitle:SetPoint( "TOPLEFT", Title, "BOTTOMLEFT", 0, -4 );
	SubTitle:SetPoint( "RIGHT", Title );
	SubTitle:SetText( L.BUTTON_FOUND );

	-- Border
	me:SetBackdrop( {
		tile = true; edgeSize = 16;
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border";
	} );
	me:OnLeave(); -- Set non-highlighted colors

	-- Drag frame
	me.Drag = me:CreateTitleRegion();
	me.EnableDrag( false );

	-- Close button
	local Close = CreateFrame( "Button", nil, me, "UIPanelCloseButton" );
	me.Close = Close;
	Close:SetPoint( "TOPRIGHT" );
	Close:SetWidth( 32 );
	Close:SetHeight( 32 );
	Close:SetScale( 0.8 );
	Close:SetHitRectInsets( 8, 8, 8, 8 );

	-- Model view
	Model:SetPoint( "BOTTOMLEFT", me, "TOPLEFT", 0, -4 );
	Model:SetPoint( "RIGHT" );
	Model:SetHeight( me:GetWidth() * 0.6 );
	me:SetClampRectInsets( 0, 0, Model:GetTop() - me:GetTop(), 0 ); -- Allow room for model
	Model:SetScript( "OnUpdate", function ( self, Elapsed )
		self:SetFacing( self:GetFacing() + Elapsed * me.RotationRate );
	end );


	-- Glow animation
	local Texture = Model:CreateTexture( nil, "OVERLAY" );
	Texture:SetPoint( "CENTER", me );
	Texture:SetWidth( 400 / 300 * me:GetWidth() );
	Texture:SetHeight( 171 / 70 * me:GetHeight() );
	Texture:SetTexture( "Interface\\AchievementFrame\\UI-Achievement-Alert-Glow" );
	Texture:SetBlendMode( "ADD" );
	Texture:SetTexCoord( 0, 0.78125, 0, 0.66796875 );
	Texture:SetAlpha( 0 );
	me.Glow = Texture:CreateAnimationGroup();
	local FadeIn = me.Glow:CreateAnimation( "Alpha" );
	FadeIn:SetChange( 1.0 );
	FadeIn:SetDuration( 0.2 );
	local FadeOut = me.Glow:CreateAnimation( "Alpha" );
	FadeOut:SetOrder( 2 );
	FadeOut:SetChange( -1.0 );
	FadeOut:SetDuration( 0.5 );

	-- Shine animation (reflection swipe)
	local Texture = me:CreateTexture( nil, "ARTWORK" );
	Texture:SetPoint( "TOPLEFT", me, 0, 8 );
	Texture:SetWidth( 67 / 300 * me:GetWidth() );
	Texture:SetHeight( 1.28 * me:GetHeight() );
	Texture:SetTexture( "Interface\\AchievementFrame\\UI-Achievement-Alert-Glow" );
	Texture:SetBlendMode( "ADD" );
	Texture:SetTexCoord( 0.78125, 0.912109375, 0, 0.28125 );
	Texture:SetAlpha( 0 );
	me.Shine = Texture:CreateAnimationGroup();
	local Show = me.Shine:CreateAnimation( "Alpha" );
	Show:SetStartDelay( 0.3 );
	Show:SetChange( 1.0 );
	Show:SetDuration( 1e-5 ); -- Note: 0 is invalid
	local Slide = me.Shine:CreateAnimation( "Translation" );
	Slide:SetOrder( 2 );
	Slide:SetOffset( me:GetWidth() - Texture:GetWidth() + 8, 0 );
	Slide:SetDuration( 0.4 );
	local FadeOut = me.Shine:CreateAnimation( "Alpha" );
	FadeOut:SetOrder( 2 );
	FadeOut:SetStartDelay( 0.2 );
	FadeOut:SetChange( -1.0 );
	FadeOut:SetDuration( 0.2 );


	-- Full screen flash
	Flash:Hide();
	Flash:SetAllPoints();
	Flash:SetAlpha( 0 );
	Flash:SetFrameStrata( "FULLSCREEN_DIALOG" );

	local Texture = Flash:CreateTexture();
	Texture:SetBlendMode( "ADD" );
	Texture:SetAllPoints();
	Texture:SetTexture( [[Interface\FullScreenTextures\LowHealth]] );

	Flash.Fade = Flash:CreateAnimationGroup();
	Flash.Fade:SetLooping( "BOUNCE" );
	Flash.Fade:SetScript( "OnLoop", Flash.OnLoop );
	Flash.Fade:SetScript( "OnPlay", Flash.OnPlay );

	local FadeIn = Flash.Fade:CreateAnimation( "Alpha" );
	FadeIn:SetChange( 1.0 );
	FadeIn:SetDuration( 0.5 );
	FadeIn:SetEndDelay( 0.25 );


	me:SetAttribute( "type", "macro" );

	me:SetScript( "OnEnter", me.OnEnter );
	me:SetScript( "OnLeave", me.OnLeave );
	me:SetScript( "OnEvent", me.OnEvent );
	me:HookScript( "OnHide", me.OnHide );
	me:RegisterEvent( "PLAYER_REGEN_ENABLED" );
	me:RegisterEvent( "MODIFIER_STATE_CHANGED" );
end
