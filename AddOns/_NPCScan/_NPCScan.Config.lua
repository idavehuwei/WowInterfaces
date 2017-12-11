--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.Config.lua - Adds an options pane to the Interface Options menu.  *
  ****************************************************************************]]


local _NPCScan = _NPCScan;
local L = _NPCScanLocalization;
local LSM = LibStub( "LibSharedMedia-3.0" );
local me = CreateFrame( "Frame" );
_NPCScan.Config = me;

me.CacheWarnings = CreateFrame( "CheckButton", "_NPCScanConfigCacheWarningsCheckbox", me, "InterfaceOptionsCheckButtonTemplate" );

local AlertOptions = CreateFrame( "Frame", "_NPCScanConfigAlert", me, "OptionsBoxTemplate" );
me.Test = CreateFrame( "Button", "_NPCScanTest", AlertOptions, "GameMenuButtonTemplate" );
me.AlertSoundUnmute = CreateFrame( "CheckButton", "_NPCScanConfigUnmuteCheckbox", AlertOptions, "InterfaceOptionsCheckButtonTemplate" );
me.AlertSound = CreateFrame( "Frame", "_NPCScanConfigSoundDropdown", AlertOptions, "UIDropDownMenuTemplate" );




--[[****************************************************************************
  * Function: _NPCScan.Config:ControlOnEnter                                   *
  ****************************************************************************]]
function me:ControlOnEnter ()
	GameTooltip:SetOwner( self, "ANCHOR_TOPRIGHT" );
	GameTooltip:SetText( self.tooltipText, nil, nil, nil, nil, 1 );
end
--[[****************************************************************************
  * Function: _NPCScan.Config:ControlOnLeave                                   *
  ****************************************************************************]]
function me:ControlOnLeave ()
	GameTooltip:Hide();
end


--[[****************************************************************************
  * Function: _NPCScan.Config.CacheWarnings.setFunc                            *
  ****************************************************************************]]
function me.CacheWarnings.setFunc ( Enable )
	_NPCScan.SetCacheWarnings( Enable == "1" );
end

--[[****************************************************************************
  * Function: _NPCScan.Config.Test:OnClick                                     *
  * Description: Plays a fake found alert and shows the target button.         *
  ****************************************************************************]]
function me.Test:OnClick ()
	local Name = L.CONFIG_TEST_NAME;
	_NPCScan.Message( L.FOUND_FORMAT:format( Name ), GREEN_FONT_COLOR );
	_NPCScan.Message( L.CONFIG_TEST_HELP_FORMAT:format( GetModifiedClick( "_NPCSCAN_BUTTONDRAG" ) ) );

	_NPCScan.Button.SetNPC( Name, "player" );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.AlertSoundUnmute.setFunc                         *
  ****************************************************************************]]
function me.AlertSoundUnmute.setFunc ( Enable )
	_NPCScan.SetAlertSoundUnmute( Enable == "1" );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.AlertSound:OnSelect                              *
  ****************************************************************************]]
function me.AlertSound:OnSelect ( NewValue )
	_NPCScan.Button.PlaySound( NewValue );
	_NPCScan.SetAlertSound( NewValue );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.AlertSound:initialize                            *
  ****************************************************************************]]
function me.AlertSound:initialize ()
	local Value = _NPCScan.Options.AlertSound;

	local Info = UIDropDownMenu_CreateInfo();
	Info.func = self.OnSelect;
	Info.text = L.CONFIG_ALERT_SOUND_DEFAULT;
	Info.checked = Value == nil;
	UIDropDownMenu_AddButton( Info );

	for _, Key in ipairs( LSM:List( LSM.MediaType.SOUND ) ) do
		Info.text = Key;
		Info.arg1 = Key;
		Info.checked = Value == Key;
		UIDropDownMenu_AddButton( Info );
	end
end


--[[****************************************************************************
  * Function: _NPCScan.Config:default                                          *
  ****************************************************************************]]
function me:default ()
	_NPCScan.Synchronize(); -- Resets all
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	me.name = L.CONFIG_TITLE;
	me:Hide();

	-- Pane title
	me.Title = me:CreateFontString( nil, "ARTWORK", "GameFontNormalLarge" );
	me.Title:SetPoint( "TOPLEFT", 16, -16 );
	me.Title:SetText( L.CONFIG_TITLE );
	local SubText = me:CreateFontString( nil, "ARTWORK", "GameFontHighlightSmall" );
	me.SubText = SubText;
	SubText:SetPoint( "TOPLEFT", me.Title, "BOTTOMLEFT", 0, -8 );
	SubText:SetPoint( "RIGHT", -32, 0 );
	SubText:SetHeight( 32 );
	SubText:SetJustifyH( "LEFT" );
	SubText:SetJustifyV( "TOP" );
	SubText:SetText( L.CONFIG_DESC );


	-- Miscellaneous checkboxes
	me.CacheWarnings:SetPoint( "TOPLEFT", SubText, "BOTTOMLEFT", -2, -8 );
	_G[ me.CacheWarnings:GetName().."Text" ]:SetText( L.CONFIG_CACHEWARNINGS );
	me.CacheWarnings.tooltipText = L.CONFIG_CACHEWARNINGS_DESC;


	-- Alert options section
	AlertOptions:SetPoint( "TOPLEFT", me.CacheWarnings, "BOTTOMLEFT", 0, -16 );
	AlertOptions:SetPoint( "BOTTOMRIGHT", -14, 16 );
	_G[ AlertOptions:GetName().."Title" ]:SetText( L.CONFIG_ALERT );

	-- Test button
	me.Test:SetPoint( "TOPLEFT", 16, -16 );
	me.Test:SetScript( "OnClick", me.Test.OnClick );
	me.Test:SetScript( "OnEnter", me.ControlOnEnter );
	me.Test:SetScript( "OnLeave", me.ControlOnLeave );
	me.Test:SetText( L.CONFIG_TEST );
	me.Test.tooltipText = L.CONFIG_TEST_DESC;

	me.AlertSoundUnmute:SetPoint( "TOPLEFT", me.Test, "BOTTOMLEFT", -2, -16 );
	_G[ me.AlertSoundUnmute:GetName().."Text" ]:SetText( L.CONFIG_ALERT_UNMUTE );
	me.AlertSoundUnmute.tooltipText = L.CONFIG_ALERT_UNMUTE_DESC;

	me.AlertSound:SetPoint( "TOPLEFT", me.AlertSoundUnmute, "BOTTOMLEFT", -12, -18 );
	me.AlertSound:SetPoint( "RIGHT", -12, 0 );
	me.AlertSound:EnableMouse( true );
	me.AlertSound:SetScript( "OnEnter", me.ControlOnEnter );
	me.AlertSound:SetScript( "OnLeave", me.ControlOnLeave );
	UIDropDownMenu_JustifyText( me.AlertSound, "LEFT" );
	_G[ me.AlertSound:GetName().."Middle" ]:SetPoint( "RIGHT", -16, 0 );
	local Label = me.AlertSound:CreateFontString( nil, "ARTWORK", "GameFontNormalSmall" );
	Label:SetPoint( "BOTTOMLEFT", me.AlertSound, "TOPLEFT", 16, 3 );
	Label:SetText( L.CONFIG_ALERT_SOUND );
	me.AlertSound.tooltipText = L.CONFIG_ALERT_SOUND_DESC;
	UIDropDownMenu_SetText( me.AlertSound, L.CONFIG_ALERT_SOUND_DEFAULT );


	InterfaceOptions_AddCategory( me );
end
