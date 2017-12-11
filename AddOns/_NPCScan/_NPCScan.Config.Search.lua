--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.Config.Search.lua - Adds a configuration pane to add/remove NPCs  *
  *   and achievements to search for.                                          *
  ****************************************************************************]]


local _NPCScan = _NPCScan;
local L = _NPCScanLocalization;
local me = CreateFrame( "Frame" );
_NPCScan.Config.Search = me;

me.TableContainer = CreateFrame( "Frame", nil, me );

me.Tabs = {};
me.TabSelected = nil;
me.UpdateRequested = nil;

me.InactiveAlpha = 0.5;

local SortedNames = {}; -- Used to sort text tables




--[[****************************************************************************
  * Function: _NPCScan.Config.Search.FindTamableOnClick                        *
  ****************************************************************************]]
function me.FindTamableOnClick ( Enable )
	if ( _NPCScan.SetFindTamable( Enable == "1" ) ) then
		_NPCScan.CacheListPrint( true );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search.AchievementAddFoundOnClick                *
  ****************************************************************************]]
function me.AchievementAddFoundOnClick ( Enable )
	if ( _NPCScan.SetAchievementsAddFound( Enable == "1" ) ) then
		_NPCScan.CacheListPrint( true );
	end
end




--[[****************************************************************************
  * Function: _NPCScan.Config.Search.TabSelect                                 *
  * Description: Selects the given tab.                                        *
  ****************************************************************************]]
function me.TabSelect ( NewTab )
	local OldTab = me.TabSelected;
	if ( NewTab ~= OldTab ) then
		if ( OldTab ) then
			if ( OldTab.Deactivate ) then
				OldTab:Deactivate();
			end
			PanelTemplates_DeselectTab( OldTab );
		end

		for _, Row in ipairs( me.Table.Rows ) do
			Row:SetAlpha( 1.0 );
		end
		me.Table:Clear();

		me.TabSelected = NewTab;
		PanelTemplates_SelectTab( NewTab );
		if ( NewTab.Activate ) then
			NewTab:Activate();
		end
		NewTab:Update();
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:TabOnClick                                *
  ****************************************************************************]]
function me:TabOnClick ()
	PlaySound( "igCharacterInfoTab" );
	me.TabSelect( self );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:TabOnEnter                                *
  ****************************************************************************]]
function me:TabOnEnter ()
	GameTooltip:SetOwner( self, "ANCHOR_TOPLEFT", 0, -8 );
	if ( self.AchievementID ) then
		local _, Name, _, _, _, _, _, Description = GetAchievementInfo( self.AchievementID );
		GameTooltip:SetText( Name );
		local Color = HIGHLIGHT_FONT_COLOR;
		GameTooltip:AddLine( Description, Color.r, Color.g, Color.b, true );

		if ( not _NPCScan.OptionsCharacter.Achievements[ self.AchievementID ] ) then
			Color = RED_FONT_COLOR;
			GameTooltip:AddLine( L.SEARCH_ACHIEVEMENT_DISABLED, Color.r, Color.g, Color.b );
		end
	else
		GameTooltip:SetText( L.SEARCH_NPCS_DESC, nil, nil, nil, nil, true );
	end
	GameTooltip:Show();
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:TabCheckOnClick                           *
  ****************************************************************************]]
function me:TabCheckOnClick ()
	local Enable = self:GetChecked();
	PlaySound( Enable and "igMainMenuOptionCheckBoxOn" or "igMainMenuOptionCheckBoxOff" );
	if ( me.AchievementSetEnabled( self:GetParent().AchievementID, Enable ) ) then
		_NPCScan.CacheListPrint( true );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:TabCheckOnEnter                           *
  ****************************************************************************]]
function me:TabCheckOnEnter ()
	me.TabOnEnter( self:GetParent() );
end




--[[****************************************************************************
  * Function: _NPCScan.Config.Search.NPCSetEditBoxText                         *
  * Description: Sets the edit boxes' text.                                    *
  ****************************************************************************]]
function me.NPCSetEditBoxText ( Name, ID )
	me.EditBoxName:SetText( Name or "" );
	me.EditBoxID:SetText( ID or "" );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search.NPCValidateButtons                        *
  * Description: Validates ability to use add and remove buttons.              *
  ****************************************************************************]]
function me.NPCValidateButtons ()
	local Name = me.EditBoxName:GetText():trim():lower();
	local ID = me.EditBoxID:GetText() ~= "" and me.EditBoxID:GetNumber() or nil;
	Name = Name ~= "" and Name or nil;

	local CanRemove = _NPCScan.OptionsCharacter.NPCs[ Name ];
	local CanAdd = Name and ID and ID ~= CanRemove and ID >= 1 and ID <= _NPCScan.IDMax;

	if ( me.Table ) then
		me.Table:SetSelectionByKey( CanRemove and Name or nil );
	end
	me.AddButton[ CanAdd and "Enable" or "Disable" ]( me.AddButton );
	me.RemoveButton[ CanRemove and "Enable" or "Disable" ]( me.RemoveButton );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search.NPCAdd                                    *
  * Description: Adds a Custom NPC list element.                               *
  ****************************************************************************]]
function me.NPCAdd ()
	local Name = me.EditBoxName:GetText();
	local ID = me.EditBoxID:GetNumber();
	if ( _NPCScan.TamableIDs[ ID ] ) then
		_NPCScan.Message( L.SEARCH_ADD_TAMABLE_FORMAT:format( Name ) );
	end
	_NPCScan.NPCRemove( Name );
	if ( _NPCScan.NPCAdd( Name, ID ) ) then
		_NPCScan.CacheListPrint( true );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search.NPCRemove                                 *
  * Description: Removes a Custom NPC list element.                            *
  ****************************************************************************]]
function me.NPCRemove ()
	_NPCScan.NPCRemove( me.EditBoxName:GetText() );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:NPCOnSelect                               *
  * Description: Updates the edit boxes when a table row is selected.          *
  ****************************************************************************]]
function me:NPCOnSelect ( Name )
	if ( Name ~= nil ) then
		me.NPCSetEditBoxText( Name, _NPCScan.OptionsCharacter.NPCs[ Name ] );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:NPCUpdate                                 *
  ****************************************************************************]]
function me:NPCUpdate ()
	me.NPCSetEditBoxText();

	for Name in pairs( _NPCScan.OptionsCharacter.NPCs ) do
		SortedNames[ #SortedNames + 1 ] = Name;
	end
	sort( SortedNames );

	for _, Name in ipairs( SortedNames ) do
		local ID = _NPCScan.OptionsCharacter.NPCs[ Name ];
		local Cached = _NPCScan.TestID( ID );
		me.Table:AddRow( Name,
			L[ Cached and "SEARCH_CACHED_YES" or "SEARCH_CACHED_NO" ], Name, ID );
		if ( Cached or ( _NPCScan.TamableIDs[ ID ] and not _NPCScan.Options.FindTamable ) ) then
			me.Table.Rows[ #me.Table.Rows ]:SetAlpha( me.InactiveAlpha );
		end
	end
	wipe( SortedNames );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:NPCActivate                               *
  ****************************************************************************]]
function me:NPCActivate ()
	me.Table:SetHeader( L.SEARCH_CACHED, L.SEARCH_NAME, L.SEARCH_ID );
	me.NPCControls:Show();
	me.TableContainer:SetPoint( "BOTTOM", me.NPCControls, "TOP", 0, 4 );
	me.Table.OnSelect = me.NPCOnSelect;
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:NPCDeactivate                             *
  ****************************************************************************]]
function me:NPCDeactivate ()
	me.NPCControls:Hide();
	me.TableContainer:SetPoint( "BOTTOM", me.NPCControls );
	me.Table.OnSelect = nil;
end




--[[****************************************************************************
  * Function: _NPCScan.Config.Search.AchievementSetEnabled                     *
  * Description: Enables/disables the achievement related to a tab.            *
  ****************************************************************************]]
function me.AchievementSetEnabled ( AchievementID, Enable )
	local Tab = me.Tabs[ AchievementID ];
	Tab.Checkbox:SetChecked( Enable );
	local Texture = Tab.Checkbox:GetCheckedTexture();
	Texture:Show();

	-- Update tooltip if shown
	if ( GameTooltip:GetOwner() == Tab ) then
		me.TabOnEnter( Tab );
	end

	if ( me.TabSelected == Tab ) then
		me.Table.Header:SetAlpha( Enable and 1.0 or me.InactiveAlpha );
	end
	if ( Enable ) then
		Texture:SetTexture( [[Interface\Buttons\UI-CheckBox-Check]] );
		return _NPCScan.AchievementAdd( AchievementID ); -- Return true if cache might have changed
	else
		Texture:SetTexture( [[Interface\RAIDFRAME\ReadyCheck-NotReady]] );
		_NPCScan.AchievementRemove( AchievementID );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:AchievementUpdate                         *
  ****************************************************************************]]
do
	local CriteriaNames = {};
	local CriteriaCompleted = {};
	local function SortFunc ( Criteria1, Criteria2 )
		return CriteriaNames[ Criteria1 ] < CriteriaNames[ Criteria2 ];
	end
	function me:AchievementUpdate ()
		local Achievement = _NPCScan.Achievements[ self.AchievementID ];
		for CriteriaID, NPCID in pairs( Achievement.Criteria ) do
			CriteriaNames[ CriteriaID ], _, CriteriaCompleted[ CriteriaID ] = GetAchievementCriteriaInfo( CriteriaID );
			SortedNames[ #SortedNames + 1 ] = CriteriaID;
		end
		sort( SortedNames, SortFunc );

		for _, CriteriaID in ipairs( SortedNames ) do
			local Cached = _NPCScan.TestID( Achievement.Criteria[ CriteriaID ] );
			me.Table:AddRow( nil, L[ Cached and "SEARCH_CACHED_YES" or "SEARCH_CACHED_NO" ],
				CriteriaNames[ CriteriaID ], Achievement.Criteria[ CriteriaID ],
				L[ CriteriaCompleted[ CriteriaID ] and "SEARCH_COMPLETED_YES" or "SEARCH_COMPLETED_NO" ] );
			if ( Cached or not Achievement.Active[ CriteriaID ] ) then
				me.Table.Rows[ #me.Table.Rows ]:SetAlpha( me.InactiveAlpha );
			end
		end
		wipe( CriteriaNames );
		wipe( CriteriaCompleted );
		wipe( SortedNames );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:AchievementActivate                       *
  ****************************************************************************]]
function me:AchievementActivate ()
	me.Table:SetHeader( L.SEARCH_CACHED, L.SEARCH_NAME, L.SEARCH_ID, L.SEARCH_COMPLETED );
	me.Table.Header:SetAlpha( _NPCScan.OptionsCharacter.Achievements[ self.AchievementID ] and 1.0 or me.InactiveAlpha );
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:AchievementDeactivate                     *
  ****************************************************************************]]
function me:AchievementDeactivate ()
	me.Table.Header:SetAlpha( 1.0 );
end




--[[****************************************************************************
  * Function: _NPCScan.Config.Search.UpdateTab                                 *
  * Description: Updates the table for a given tab if it is displayed.         *
  ****************************************************************************]]
function me.UpdateTab ( ID )
	if ( not ID or me.Tabs[ ID ] == me.TabSelected ) then
		me.UpdateRequested = true; -- Update executed in next OnUpdate
	end;
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:OnUpdate                                  *
  ****************************************************************************]]
function me:OnUpdate ()
	if ( me.UpdateRequested ) then
		me.UpdateRequested = nil;

		for _, Row in ipairs( me.Table.Rows ) do
			Row:SetAlpha( 1.0 );
		end
		me.Table:Clear();
		me.TabSelected:Update();
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:OnShow                                    *
  ****************************************************************************]]
function me:OnShow ()
	if ( not me.Table ) then
		me.Table = LibStub( "LibTextTable-1.0" ).New( nil, me.TableContainer );
		me.Table:SetAllPoints();
	end

	if ( me.TabSelected ) then
		me.UpdateTab();
	else
		me.TabSelect( me.Tabs[ "NPC" ] );
	end
end
--[[****************************************************************************
  * Function: _NPCScan.Config.Search:default                                   *
  ****************************************************************************]]
function me:default ()
	_NPCScan.Synchronize( _NPCScan.Options ); -- Resets only character settings
end


--[[****************************************************************************
  * Function: _NPCScan.Config.Search.SlashCommand                              *
  * Description: Slash command chat handler to open the options pane.  Also    *
  *   supports subcommands for adding and removing NPCs.                       *
  ****************************************************************************]]
function me.SlashCommand ( Input )
	local Command, Arguments = Input:match( "^(%S+)%s*(.-)%s*$" );
	if ( Command ) then
		Command = Command:upper();
		if ( Command == L.CMD_ADD ) then
			local ID, Name = Arguments:match( "^(%d+)%s+(.+)$" );
			if ( ID ) then
				_NPCScan.NPCRemove( Name );
				if ( _NPCScan.NPCAdd( Name, ID ) ) then
					_NPCScan.CacheListPrint( true );
				end
				return;
			end
		elseif ( Command == L.CMD_REMOVE ) then
			if ( not _NPCScan.NPCRemove( Arguments ) ) then
				_NPCScan.Message( L.CMD_REMOVENOTFOUND_FORMAT:format( Arguments ), RED_FONT_COLOR );
			end
			return;
		end
		-- Invalid subcommand
		_NPCScan.Message( L.CMD_HELP );

	else -- No subcommand
		InterfaceOptionsFrame_OpenToCategory( me );
	end
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	me.name = L.SEARCH_TITLE;
	me.parent = L.CONFIG_TITLE;
	me:Hide();
	me:SetScript( "OnShow", me.OnShow );
	me:SetScript( "OnUpdate", me.OnUpdate );

	-- Pane title
	me.Title = me:CreateFontString( nil, "ARTWORK", "GameFontNormalLarge" );
	me.Title:SetPoint( "TOPLEFT", 16, -16 );
	me.Title:SetText( L.SEARCH_TITLE );
	local SubText = me:CreateFontString( nil, "ARTWORK", "GameFontHighlightSmall" );
	me.SubText = SubText;
	SubText:SetPoint( "TOPLEFT", me.Title, "BOTTOMLEFT", 0, -8 );
	SubText:SetPoint( "RIGHT", -32, 0 );
	SubText:SetHeight( 32 );
	SubText:SetJustifyH( "LEFT" );
	SubText:SetJustifyV( "TOP" );
	SubText:SetText( L.SEARCH_DESC );


	-- Settings checkboxes
	local FindTamableCheckbox = CreateFrame( "CheckButton", "_NPCScanSearchFindTamableCheckbox", me, "InterfaceOptionsCheckButtonTemplate" );
	me.FindTamableCheckbox = FindTamableCheckbox;
	FindTamableCheckbox:SetPoint( "TOPLEFT", SubText, "BOTTOMLEFT", -2, -8 );
	FindTamableCheckbox.setFunc = me.FindTamableOnClick;
	FindTamableCheckbox.tooltipText = L.SEARCH_FINDTAMABLE_DESC;
	FindTamableCheckbox.tooltipRequirement = L.SEARCH_FINDTAMABLE_WARNING;
	local Label = _G[ FindTamableCheckbox:GetName().."Text" ];
	Label:SetText( L.SEARCH_FINDTAMABLE );
	FindTamableCheckbox:SetHitRectInsets( 4, 4 - Label:GetStringWidth(), 4, 4 );

	local AddFoundCheckbox = CreateFrame( "CheckButton", "_NPCScanSearchAchievementAddFoundCheckbox", me, "InterfaceOptionsCheckButtonTemplate" );
	me.AddFoundCheckbox = AddFoundCheckbox;
	AddFoundCheckbox:SetPoint( "TOPLEFT", FindTamableCheckbox, "BOTTOMLEFT", 0, 4 );
	AddFoundCheckbox.setFunc = me.AchievementAddFoundOnClick;
	AddFoundCheckbox.tooltipText = L.SEARCH_ACHIEVEMENTADDFOUND_DESC;
	local Label = _G[ AddFoundCheckbox:GetName().."Text" ];
	Label:SetText( L.SEARCH_ACHIEVEMENTADDFOUND );
	AddFoundCheckbox:SetHitRectInsets( 4, 4 - Label:GetStringWidth(), 4, 4 );


	-- Controls for NPCs table
	local NPCControls = CreateFrame( "Frame", nil, me );
	me.NPCControls = NPCControls;
	NPCControls:Hide();

	-- Create add and remove buttons
	local RemoveButton = CreateFrame( "Button", nil, NPCControls, "GameMenuButtonTemplate" );
	me.RemoveButton = RemoveButton;
	RemoveButton:SetWidth( 16 );
	RemoveButton:SetHeight( 20 );
	RemoveButton:SetPoint( "BOTTOMRIGHT", me, -16, 16 );
	RemoveButton:SetText( L.SEARCH_REMOVE );
	RemoveButton:SetScript( "OnClick", me.NPCRemove );
	local AddButton = CreateFrame( "Button", nil, NPCControls, "GameMenuButtonTemplate" );
	me.AddButton = AddButton;
	AddButton:SetWidth( 16 );
	AddButton:SetHeight( 20 );
	AddButton:SetPoint( "BOTTOMRIGHT", RemoveButton, "TOPRIGHT", 0, 4 );
	AddButton:SetText( L.SEARCH_ADD );
	AddButton:SetScript( "OnClick", me.NPCAdd );

	-- Create edit boxes
	local LabelID = NPCControls:CreateFontString( nil, "ARTWORK", "GameFontHighlight" );
	me.LabelID = LabelID;
	LabelID:SetPoint( "BOTTOMLEFT", me, 16, 16 );
	LabelID:SetPoint( "TOP", RemoveButton );
	LabelID:SetText( L.SEARCH_ID );
	local LabelName = NPCControls:CreateFontString( nil, "ARTWORK", "GameFontHighlight" );
	me.LabelName = LabelName;
	LabelName:SetPoint( "BOTTOMLEFT", LabelID, "TOPLEFT", 0, 4 );
	LabelName:SetPoint( "TOP", AddButton );
	LabelName:SetText( L.SEARCH_NAME );

	local EditBoxName = CreateFrame( "EditBox", "_NPCScanSearchName", NPCControls, "InputBoxTemplate" );
	me.EditBoxName = EditBoxName;
	local EditBoxID = CreateFrame( "EditBox", "_NPCScanSearchID", NPCControls, "InputBoxTemplate" );
	me.EditBoxID = EditBoxID;

	EditBoxID:SetPoint( "TOP", LabelID );
	EditBoxID:SetPoint( "BOTTOMRIGHT", RemoveButton, "BOTTOMLEFT", -4, 0 );
	EditBoxID:SetAutoFocus( false );
	EditBoxID:SetNumeric( true );
	EditBoxID:SetMaxLetters( floor( log10( _NPCScan.IDMax ) ) + 1 );
	EditBoxID:SetScript( "OnTabPressed", function () EditBoxName:SetFocus(); end );
	EditBoxID:SetScript( "OnEnterPressed", function () AddButton:Click(); end );
	EditBoxID:SetScript( "OnTextChanged", me.NPCValidateButtons );
	EditBoxID:SetScript( "OnEnter", _NPCScan.Config.ControlOnEnter );
	EditBoxID:SetScript( "OnLeave", _NPCScan.Config.ControlOnLeave );
	EditBoxID.tooltipText = L.SEARCH_ID_DESC;

	EditBoxName:SetPoint( "TOP", LabelName );
	EditBoxName:SetPoint( "LEFT", EditBoxID );
	EditBoxName:SetPoint( "BOTTOMRIGHT", EditBoxID, "TOPRIGHT" );
	EditBoxName:SetAutoFocus( false );
	EditBoxName:SetScript( "OnTabPressed", function () EditBoxID:SetFocus(); end );
	EditBoxName:SetScript( "OnEnterPressed", function () AddButton:Click(); end );
	EditBoxName:SetScript( "OnTextChanged", me.NPCValidateButtons );
	EditBoxName:SetScript( "OnEnter", _NPCScan.Config.ControlOnEnter );
	EditBoxName:SetScript( "OnLeave", _NPCScan.Config.ControlOnLeave );
	EditBoxName.tooltipText = L.SEARCH_NAME_DESC;

	EditBoxID:SetPoint( "LEFT",
		LabelName:GetStringWidth() > LabelID:GetStringWidth() and LabelName or LabelID,
		"RIGHT", 8, 0 );

	NPCControls:SetPoint( "BOTTOMRIGHT", RemoveButton );
	NPCControls:SetPoint( "LEFT", LabelID );
	NPCControls:SetPoint( "TOP", AddButton );


	-- Place table
	me.TableContainer:SetPoint( "TOP", AddFoundCheckbox, "BOTTOM", 0, -28 );
	me.TableContainer:SetPoint( "LEFT", SubText, -2, 0 );
	me.TableContainer:SetPoint( "RIGHT", -16, 0 );
	me.TableContainer:SetPoint( "BOTTOM", NPCControls );
	me.TableContainer:SetBackdrop( { bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background"; } );

	-- Add all tabs
	local LastTab;
	local TabCount = 0;
	local function AddTab ( ID, Update, Activate, Deactivate )
		TabCount = TabCount + 1;
		local Tab = CreateFrame( "Button", "_NPCScanSearchTab"..TabCount, me.TableContainer, "TabButtonTemplate" );
		me.Tabs[ ID ] = Tab;

		Tab:SetHitRectInsets( 6, 6, 6, 0 );
		Tab:SetScript( "OnClick", me.TabOnClick );
		Tab:SetScript( "OnEnter", me.TabOnEnter );
		Tab:SetScript( "OnLeave", _NPCScan.Config.ControlOnLeave );

		if ( type( ID ) == "number" ) then -- AchievementID
			local Size = select( 2, Tab:GetFontString():GetFont() ) + 4;
			Tab:SetText( "|T:"..Size.."|t"..select( 2, GetAchievementInfo( ID ) ) );
			Tab.AchievementID = ID;
			local Checkbox = CreateFrame( "CheckButton", nil, Tab, "UICheckButtonTemplate" );
			Tab.Checkbox = Checkbox;
			Checkbox:SetWidth( Size + 2 );
			Checkbox:SetHeight( Size + 2 );
			Checkbox:SetPoint( "LEFT", _G[ Tab:GetName().."Text" ], -4, 0 );
			Checkbox:SetHitRectInsets( 4, 4, 4, 4 );
			Checkbox:SetScript( "OnClick", me.TabCheckOnClick );
			Checkbox:SetScript( "OnEnter", me.TabCheckOnEnter );
			Checkbox:SetScript( "OnLeave", _NPCScan.Config.ControlOnLeave );
			me.AchievementSetEnabled( ID, false ); -- Initialize the custom "unchecked" texture
		else
			Tab:SetText( L.SEARCH_NPCS );
		end
		PanelTemplates_TabResize( Tab, -8 );

		Tab.Update = Update;
		Tab.Activate = Activate;
		Tab.Deactivate = Deactivate;

		PanelTemplates_DeselectTab( Tab );
		if ( LastTab ) then
			Tab:SetPoint( "LEFT", LastTab, "RIGHT", -4, 0 );
		else
			Tab:SetPoint( "BOTTOMLEFT", me.TableContainer, "TOPLEFT" );
		end
		LastTab = Tab;
	end
	AddTab( "NPC", me.NPCUpdate, me.NPCActivate, me.NPCDeactivate );
	for AchievementID in pairs( _NPCScan.Achievements ) do
		AddTab( AchievementID, me.AchievementUpdate, me.AchievementActivate, me.AchievementDeactivate );
	end


	InterfaceOptions_AddCategory( me );
	SlashCmdList[ "_NPCSCAN" ] = me.SlashCommand;
end
