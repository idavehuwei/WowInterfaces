--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * _NPCScan.lua - Scans NPCs near you for specific rare NPC IDs.              *
  ****************************************************************************]]


local L = _NPCScanLocalization;
local me = CreateFrame( "Frame", "_NPCScan" );
me.Version = GetAddOnMetadata( "_NPCScan", "Version" ):match( "^([%d.]+)" );

me.Options = {
	Version = me.Version;
};
me.OptionsCharacter = {
	Version = me.Version;
	NPCs = {};
	Achievements = {};
};

me.OptionsDefault = {
	Version = me.Version;
	CacheWarnings = true;
	FindTamable = true;
	AchievementsAddFound = nil;
	AlertSoundUnmute = nil;
	AlertSound = nil; -- Default sound
};
me.OptionsCharacterDefault = {
	Version = me.Version;
	NPCs = { -- Keys must be lowercase and trimmed, but don't have to match the NPC name
		[ L.NPCS[ "Gondria" ]:trim():lower() ] = 33776;
		[ L.NPCS[ "Skoll" ]:trim():lower() ] = 35189;
		[ L.NPCS[ "Time-Lost Proto Drake" ]:trim():lower() ] = 32491;

		[ L.NPCS[ "Dart" ]:trim():lower() ] = 14232;
		[ L.NPCS[ "Takk the Leaper" ]:trim():lower() ] = 5842;
		[ L.NPCS[ "Ravasaur Matriarch" ]:trim():lower() ] = 6581;
		[ L.NPCS[ "Razormaw Matriarch" ]:trim():lower() ] = 1140;
	};
	Achievements = {}; -- Filled with all entries in me.Achievements
};


me.ScanIDs = {}; -- [ NPC ID ] = Number of concurrent scans for this ID
me.Achievements = { -- Criteria data for each achievement
	[ 1312 ] = {}; -- Bloody Rare (Outlands)
	[ 2257 ] = {}; -- Frostbitten (Northrend)
};
me.CriteriaUpdateRequested = nil;

me.IDMax = 0xFFFFFF; -- Largest ID that will fit in a GUID's 24-bit NPC ID field
me.UpdateRate = 0.1;




--[[****************************************************************************
  * Function: _NPCScan.Message                                                 *
  * Description: Prints a message in the default chat window.                  *
  ****************************************************************************]]
function me.Message ( Message, Color )
	if ( not Color ) then
		Color = NORMAL_FONT_COLOR;
	end
	DEFAULT_CHAT_FRAME:AddMessage( L.MESSAGE_FORMAT:format( Message ), Color.r, Color.g, Color.b );
end


--[[****************************************************************************
  * Function: _NPCScan.CacheListAdd                                            *
  ****************************************************************************]]
do
	local CacheList = {};
	function me.CacheListAdd ( FoundName )
		CacheList[ #CacheList + 1 ] = FoundName;
	end
--[[****************************************************************************
  * Function: _NPCScan.CacheListPrint                                          *
  ****************************************************************************]]
	local FirstPrint = true;
	function me.CacheListPrint ( ForcePrint )
		if ( #CacheList > 0 ) then
			if ( ForcePrint or me.Options.CacheWarnings ) then
				for Index, Name in ipairs( CacheList ) do
					CacheList[ Index ] = L.CACHED_NAME_FORMAT:format( Name );
				end
				sort( CacheList );
				me.Message( L[ FirstPrint and "CACHED_LONG_FORMAT" or "CACHED_FORMAT" ]:format( table.concat( CacheList, L.CACHED_SEPARATOR ) ),
					ForcePrint and RED_FONT_COLOR );
				FirstPrint = false;
			end
			wipe( CacheList );
		end
	end
end


--[[****************************************************************************
  * Function: _NPCScan.TestID                                                  *
  * Description: Checks for a given NPC ID.                                    *
  ****************************************************************************]]
do
	local Tooltip = CreateFrame( "GameTooltip", "_NPCScanTooltip", me );
	-- Add template text lines
	local Text = Tooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" );
	Tooltip:AddFontStrings( Text, Tooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );
	function me.TestID ( ID )
		Tooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
		Tooltip:SetHyperlink( ( "unit:0xF530%06X000000" ):format( ID ) );
		if ( Tooltip:IsShown() ) then
			return Text:GetText();
		end
	end
end


--[[****************************************************************************
  * Function: _NPCScan.ScanAdd                                                 *
  * Description: Begins searching for an NPC ID.                               *
  ****************************************************************************]]
function me.ScanAdd ( ID )
	if ( me.Options.FindTamable or not me.TamableIDs[ ID ] ) then
		local FoundName = me.TestID( ID );
		if ( FoundName ) then -- Already seen
			me.CacheListAdd( FoundName );
		else -- Increment
			if ( me.ScanIDs[ ID ] ) then
				me.ScanIDs[ ID ] = me.ScanIDs[ ID ] + 1;
			else
				me.ScanIDs[ ID ] = 1;
				me.Overlays.Add( ID );
			end
			return true;
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.ScanRemove                                              *
  * Description: Stops searching for an NPC ID.                                *
  ****************************************************************************]]
function me.ScanRemove ( ID )
	if ( me.Options.FindTamable or not me.TamableIDs[ ID ] ) then
		local Count = me.ScanIDs[ ID ];
		if ( Count ) then -- Decrement
			if ( Count > 1 ) then
				me.ScanIDs[ ID ] = Count - 1;
			else
				me.ScanIDs[ ID ] = nil;
				me.Overlays.Remove( ID );
			end
			return true;
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.ScanRemoveAll                                           *
  * Description: Stops all concurrent scans for a common NPC ID.               *
  ****************************************************************************]]
function me.ScanRemoveAll ( ID )
	if ( me.ScanIDs[ ID ] ) then
		me.ScanIDs[ ID ] = nil;
		me.Overlays.Remove( ID );
	end
end


--[[****************************************************************************
  * Function: _NPCScan.NPCAdd                                                  *
  * Description: Adds an NPC name and ID to settings and begins searching.     *
  ****************************************************************************]]
function me.NPCAdd ( Name, ID )
	Name = Name:trim():lower();

	if ( not me.OptionsCharacter.NPCs[ Name ] ) then
		ID = tonumber( ID );
		me.OptionsCharacter.NPCs[ Name ] = ID;
		me.Config.Search.UpdateTab( "NPC" );
		me.ScanAdd( ID );

		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.NPCRemove                                               *
  * Description: Removes an NPC from settings by name and stops searching.     *
  ****************************************************************************]]
function me.NPCRemove ( Name )
	Name = Name:trim():lower();
	local ID = me.OptionsCharacter.NPCs[ Name ];

	if ( ID ) then
		me.OptionsCharacter.NPCs[ Name ] = nil;
		me.Config.Search.UpdateTab( "NPC" );
		me.ScanRemove( ID );

		return true;
	end
end


--[[****************************************************************************
  * Function: _NPCScan.AchievementAdd                                          *
  * Description: Adds a kill-related achievement to track.                     *
  ****************************************************************************]]
function me.AchievementAdd ( AchievementID )
	local Achievement = me.Achievements[ AchievementID ];
	if ( Achievement and not me.OptionsCharacter.Achievements[ AchievementID ] ) then
		if ( not next( me.OptionsCharacter.Achievements ) ) then -- First
			me:RegisterEvent( "ACHIEVEMENT_EARNED" );
			me:RegisterEvent( "CRITERIA_UPDATE" );
		end
		me.OptionsCharacter.Achievements[ AchievementID ] = true;

		for CriteriaID, NPCID in pairs( Achievement.Criteria ) do
			local _, CriteriaType, Completed = GetAchievementCriteriaInfo( CriteriaID );
			if ( ( not Completed or me.Options.AchievementsAddFound ) and me.ScanAdd( NPCID ) ) then
				Achievement.Active[ CriteriaID ] = true;
			end
		end
		me.Config.Search.AchievementSetEnabled( AchievementID, true );
		me.Config.Search.UpdateTab( AchievementID );

		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.AchievementRemove                                       *
  * Description: Removes an achievement from settings and stops tracking it.   *
  ****************************************************************************]]
function me.AchievementRemove ( AchievementID )
	local Achievement = me.Achievements[ AchievementID ];
	if ( Achievement and me.OptionsCharacter.Achievements[ AchievementID ] ) then
		me.OptionsCharacter.Achievements[ AchievementID ] = nil;
		if ( not next( me.OptionsCharacter.Achievements ) ) then -- Last
			me:UnregisterEvent( "ACHIEVEMENT_EARNED" );
			me:UnregisterEvent( "CRITERIA_UPDATE" );
		end

		for CriteriaID in pairs( Achievement.Active ) do
			me.ScanRemove( Achievement.Criteria[ CriteriaID ] );
		end
		wipe( Achievement.Active );
		me.Config.Search.AchievementSetEnabled( AchievementID, false );
		me.Config.Search.UpdateTab( AchievementID );
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.CriteriaUpdate                                          *
  * Description: Scans all active criteria and removes any completed NPCs.     *
  ****************************************************************************]]
do
	local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo;
	local select = select;
	local pairs = pairs;
	function me.CriteriaUpdate ()
		if ( not me.Options.AchievementsAddFound ) then
			for AchievementID in pairs( me.OptionsCharacter.Achievements ) do
				local Achievement = me.Achievements[ AchievementID ];
				local Updated = false;
				for CriteriaID in pairs( Achievement.Active ) do
					if ( select( 3, GetAchievementCriteriaInfo( CriteriaID ) ) ) then -- Completed
						Achievement.Active[ CriteriaID ] = nil;
						me.ScanRemove( Achievement.Criteria[ CriteriaID ] );
						Updated = true;
					end
				end
				if ( Updated ) then
					me.Config.Search.UpdateTab( AchievementID );
				end
			end
		end
	end
end


--[[****************************************************************************
  * Function: _NPCScan.SetCacheWarnings                                        *
  * Description: Enables printing cache lists on login.                        *
  ****************************************************************************]]
function me.SetCacheWarnings ( Enable )
	if ( not Enable ~= not me.Options.CacheWarnings ) then
		me.Options.CacheWarnings = Enable or nil;

		me.Config.CacheWarnings:SetChecked( Enable );
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.SetFindTamable                                          *
  * Description: Enables tracking of tamable NPCs.                             *
  ****************************************************************************]]
do
	local NPCsTemp = {};
	local AchievementsTemp = {};
	function me.SetFindTamable ( Enable )
		if ( not Enable ~= not me.Options.FindTamable ) then
			-- Remove all pet scans
			for Name, ID in pairs( me.OptionsCharacter.NPCs ) do
				if ( me.TamableIDs[ ID ] ) then
					NPCsTemp[ Name ] = ID;
					me.NPCRemove( Name );
				end
			end
			for AchievementID in pairs( me.OptionsCharacter.Achievements ) do
				AchievementsTemp[ AchievementID ] = true;
				me.AchievementRemove( AchievementID );
			end

			me.Options.FindTamable = Enable or nil;
			me.Config.Search.FindTamableCheckbox:SetChecked( Enable );

			-- Re-add the scans
			for Name, ID in pairs( NPCsTemp ) do
				NPCsTemp[ Name ] = nil;
				me.NPCAdd( Name, ID );
			end
			for AchievementID in pairs( AchievementsTemp ) do
				AchievementsTemp[ AchievementID ] = nil;
				me.AchievementAdd( AchievementID );
			end

			return true;
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.SetAchievementsAddFound                                 *
  * Description: Enables tracking of unneeded achievement NPCs.                *
  ****************************************************************************]]
function me.SetAchievementsAddFound ( Enable )
	if ( not Enable ~= not me.Options.AchievementsAddFound ) then
		me.Options.AchievementsAddFound = Enable or nil;
		me.Config.Search.AddFoundCheckbox:SetChecked( Enable );

		for AchievementID in pairs( me.OptionsCharacter.Achievements ) do
			me.AchievementRemove( AchievementID );
			me.AchievementAdd( AchievementID );
		end
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.SetAlertSoundUnmute                                     *
  * Description: Enables unmuting sound to play found alerts.                  *
  ****************************************************************************]]
function me.SetAlertSoundUnmute ( Enable )
	if ( not Enable ~= not me.Options.AlertSoundUnmute ) then
		me.Options.AlertSoundUnmute = Enable or nil;

		me.Config.AlertSoundUnmute:SetChecked( Enable );
		return true;
	end
end
--[[****************************************************************************
  * Function: _NPCScan.SetAlertSound                                           *
  * Description: Sets the sound to play when NPCs are found.                   *
  ****************************************************************************]]
function me.SetAlertSound ( AlertSound )
	if ( AlertSound ~= me.Options.AlertSound ) then
		me.Options.AlertSound = AlertSound;

		UIDropDownMenu_SetText( me.Config.AlertSound, AlertSound == nil and L.CONFIG_ALERT_SOUND_DEFAULT or AlertSound );
		return true;
	end
end


--[[****************************************************************************
  * Function: _NPCScan.Synchronize                                             *
  * Description: Resets the scanning list and reloads it from saved settings.  *
  ****************************************************************************]]
function me.Synchronize ( Options, OptionsCharacter )
	-- Load defaults if settings omitted
	if ( not Options ) then
		Options = me.OptionsDefault;
	end
	if ( not OptionsCharacter ) then
		OptionsCharacter = me.OptionsCharacterDefault;
		-- Add all uncompleted achievements
		wipe( OptionsCharacter.Achievements );
		for AchievementID in pairs( me.Achievements ) do
			if ( Options.AchievementsAddFound or not select( 4, GetAchievementInfo( AchievementID ) ) ) then -- Not completed
				OptionsCharacter.Achievements[ AchievementID ] = true;
			end
		end
	end

	-- Clear all scans
	for AchievementID in pairs( me.OptionsCharacter.Achievements ) do
		me.AchievementRemove( AchievementID );
	end
	for Name in pairs( me.OptionsCharacter.NPCs ) do
		me.NPCRemove( Name );
	end
	for ID in pairs( me.ScanIDs ) do
		me.ScanRemoveAll( ID );
	end

	me.SetCacheWarnings( Options.CacheWarnings );
	me.SetFindTamable( Options.FindTamable );
	me.SetAchievementsAddFound( Options.AchievementsAddFound );
	me.SetAlertSoundUnmute( Options.AlertSoundUnmute );
	me.SetAlertSound( Options.AlertSound );

	for Name, ID in pairs( OptionsCharacter.NPCs ) do
		me.NPCAdd( Name, ID );
	end
	for AchievementID in pairs( me.Achievements ) do
		if ( OptionsCharacter.Achievements[ AchievementID ] ) then
			me.AchievementAdd( AchievementID );
		end
	end
	me.CacheListPrint();
end


--[[****************************************************************************
  * Function: _NPCScan:OnUpdate                                                *
  * Description: Scans all NPCs and alerts if any are found.                   *
  ****************************************************************************]]
do
	local pairs = pairs;
	local Name;
	local LastUpdate = 0;
	function me:OnUpdate ( Elapsed )
		if ( me.CriteriaUpdateRequested ) then -- CRITERIA_UPDATE bucket
			me.CriteriaUpdateRequested = nil;
			me.CriteriaUpdate();
		end

		LastUpdate = LastUpdate + Elapsed;
		if ( LastUpdate >= me.UpdateRate ) then
			LastUpdate = 0;

			for ID in pairs( me.ScanIDs ) do
				Name = me.TestID( ID );
				if ( Name ) then
					me.Overlays.Found( ID );
					me.ScanRemoveAll( ID );
					me.Config.Search.UpdateTab();

					local TamableLocation, InvalidMessage = me.TamableIDs[ ID ];
					if ( TamableLocation == true ) then -- Tamable, but expected zone is unknown (instance mob, etc.)
						if ( IsResting() ) then -- Most likely a hunter pet in town
							InvalidMessage = L.FOUND_TAMABLE_RESTING_FORMAT:format( Name );
						end
					elseif ( TamableLocation ) then -- Is a string; Expected zone of the mob is known
						local CurrentLocation = GetRealZoneText();
						if ( TamableLocation ~= CurrentLocation ) then -- Definitely a pet; Found in wrong zone
							InvalidMessage = L.FOUND_TAMABLE_WRONGZONE_FORMAT:format( Name, CurrentLocation, TamableLocation );
						end
					end

					me.Message( InvalidMessage or L[ TamableLocation and "FOUND_TAMABLE_FORMAT" or "FOUND_FORMAT" ]:format( Name ), GREEN_FONT_COLOR );
					if ( not InvalidMessage ) then
						me.Button.SetNPC( Name, ID );
					end
				end
			end
		end
	end
end
--[[****************************************************************************
  * Function: _NPCScan.OnLoad                                                  *
  * Description: Loads defaults, validates settings, and starts scan.          *
  ****************************************************************************]]
function me.OnLoad ()
	me.OnLoad = nil;

	local Options = _NPCScanOptions;
	local OptionsCharacter = _NPCScanOptionsCharacter;
	_NPCScanOptions = me.Options;
	_NPCScanOptionsCharacter = me.OptionsCharacter;

	-- Update settings incrementally
	if ( Options ) then
		if ( Options.Version == "3.0.9.2" ) then -- 3.1.0.1: Added options for finding already found and tamable mobs
			Options.CacheWarnings = true;
			Options.Version = "3.1.0.1";
		end
		Options.Version = me.Version;
	end
	-- Character settings
	if ( OptionsCharacter ) then
		if ( OptionsCharacter.Version == "3.0.9.2" ) then -- 3.1.0.1: Remove NPCs that are duplicated by achievements
			local NPCs = OptionsCharacter.IDs;
			OptionsCharacter.IDs = nil;
			OptionsCharacter.NPCs = NPCs;
			OptionsCharacter.Achievements = {};
			local AchievementNPCs = {};
			for AchievementID, Achievement in pairs( me.Achievements ) do
				for _, ID in pairs( Achievement.Criteria ) do
					AchievementNPCs[ ID ] = AchievementID;
				end
			end
			for Name, ID in pairs( NPCs ) do
				if ( AchievementNPCs[ ID ] ) then
					NPCs[ Name ] = nil;
					OptionsCharacter.Achievements[ AchievementNPCs[ ID ] ] = true;
				end
			end
			OptionsCharacter.Version = "3.1.0.1";
		end
		if ( OptionsCharacter.Version == "3.1.0.1" ) then -- 3.2.0.1: Added default scans for rare raptors in 3.2
			OptionsCharacter.NPCs[ L.NPCS[ "Dart" ]:trim():lower() ] = 14232;
			OptionsCharacter.NPCs[ L.NPCS[ "Takk the Leaper" ]:trim():lower() ] = 5842;
			OptionsCharacter.NPCs[ L.NPCS[ "Ravasaur Matriarch" ]:trim():lower() ] = 6581;
			OptionsCharacter.NPCs[ L.NPCS[ "Razormaw Matriarch" ]:trim():lower() ] = 1140;
			OptionsCharacter.Version = "3.2.0.2"; -- No change from 3.2.0.1
		end
		if ( OptionsCharacter.Version == "3.2.0.2" ) then -- 3.2.0.2: Added default scans for Skoll
			OptionsCharacter.NPCs[ L.NPCS[ "Skoll" ]:trim():lower() ] = 35189;
			OptionsCharacter.Version = "3.2.0.3";
		end
		OptionsCharacter.Version = me.Version;
	end

	me.Synchronize( Options, OptionsCharacter ); -- Loads defaults if either are nil
end
--[[****************************************************************************
  * Function: _NPCScan:PLAYER_ENTERING_WORLD                                   *
  ****************************************************************************]]
function me:PLAYER_ENTERING_WORLD ()
	if ( me.OnLoad ) then -- Only run once
		me.OnLoad();
	end

	-- Do not scan while in instances
	local InInstance, InstanceType = IsInInstance();
	if ( not InInstance or InstanceType == "party" ) then
		self:Show();
	else
		self:Hide();
	end
end
--[[****************************************************************************
  * Function: _NPCScan:ZONE_CHANGED_NEW_AREA                                   *
  * Description: Sets the OnUpdate handler only after zone info is known.      *
  ****************************************************************************]]
function me:ZONE_CHANGED_NEW_AREA ( Event )
	self:UnregisterEvent( Event );
	self[ Event ] = nil;

	self:SetScript( "OnUpdate", me.OnUpdate );
end
--[[****************************************************************************
  * Function: _NPCScan:ACHIEVEMENT_EARNED                                      *
  ****************************************************************************]]
function me:ACHIEVEMENT_EARNED ( _, AchievementID )
	if ( not me.Options.AchievementsAddFound ) then
		me.AchievementRemove( AchievementID );
	end
end
--[[****************************************************************************
  * Function: _NPCScan:CRITERIA_UPDATE                                         *
  ****************************************************************************]]
function me:CRITERIA_UPDATE ()
	me.CriteriaUpdateRequested = true;
end
--[[****************************************************************************
  * Function: _NPCScan:OnEvent                                                 *
  ****************************************************************************]]
do
	local type = type;
	function me:OnEvent ( Event, ... )
		if ( type( self[ Event ] ) == "function" ) then
			self[ Event ]( self, Event, ... );
		end
	end
end




--------------------------------------------------------------------------------
-- Function Hooks / Execution
-----------------------------

do
	me:SetScript( "OnEvent", me.OnEvent );
	me:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	-- Set OnUpdate script after zone info loads
	if ( GetRealZoneText() == "" ) then -- Zone information unknown (initial login)
		me:RegisterEvent( "ZONE_CHANGED_NEW_AREA" );
	else -- Zone information is known
		me:ZONE_CHANGED_NEW_AREA( "ZONE_CHANGED_NEW_AREA" );
	end


	-- Save achievement criteria data
	for AchievementID, Achievement in pairs( me.Achievements ) do
		Achievement.Criteria = {};
		Achievement.Active = {};
		for Criteria = 1, GetAchievementNumCriteria( AchievementID ) do
			local _, CriteriaType, _, _, _, _, _, AssetID, _, CriteriaID = GetAchievementCriteriaInfo( AchievementID, Criteria );
			if ( CriteriaType == 0 ) then -- Mob kill type
				Achievement.Criteria[ CriteriaID ] = AssetID;
			end
		end
	end
end
