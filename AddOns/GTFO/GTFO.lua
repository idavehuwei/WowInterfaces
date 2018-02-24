--------------------------------------------------------------------------
-- GTFO.lua
--------------------------------------------------------------------------
--[[
GTFO
Author: Zensunim of Malygos

Usage: /GTFO or go to Interface->Add-ons

Note: Place your own custom spells and setups in GTFO_Custom.lua

Special thanks:
		Smacker (Power Auras)
		Freydis88 (German Translations)
		pcki11 and D_Angel (Russian Translations)
		Wowuicn (Simplified and Traditional Chinese Translations)
		Blubibulga (French Translations)


Change Log:
	v0.1
		- Beta Release
		- Added menu options
	v0.2
		- Put spells in its own area
	v0.3
		- Updated for Wrath spells
	v0.3.1
		- Updated for Naxx spells
	v0.3.2
		- More spells
	v0.3.3
		- More spells
	v1.0
		- Public Release
		- More spells
		- High/Low options
	v1.0.1
		- Added spells, replaced names with spell IDs
	v1.1
		- Bug fixes
		- Added "test" buttons to the menu option
		- Added spells, replaced names with spell IDs
		- Sound spam prevention
		- Alerts on "afflicted by" event
	v1.1.1
		- Spell fixes, new spells, replaced names with spell IDs
		- Added the ability to alert only on DoT application
		- Fixed "afflicted by" alerts to support stacking debuffs
	v1.1.2
		- Added spells
	v1.1.3
		- Added spells
	v1.1.4
		- Added spells
	v1.2
		- Patch 3.3 Compatible
		- Added version checking and update notification
		- Added spells
	v1.2.1
		- Added spells
	v1.2.2
		- Added spells
		- Casting Hellfire no longer triggers alerts
	v1.2.3
		- Added spells
	v1.2.4
		- Added spells
	v1.2.5
		- Added spells
		- Fixed bug in version updates
	v1.2.6
		- Added spells
	v2.0
		- Added "Fail" mode/sound
		- Added spells
	v2.0.1
		- Added spells
	v2.0.2
		- Added spells
	v2.0.3
		- Added spells
	v2.0.4
		- Added spells
	v2.0.5
		- Added/fixed spells
	v2.1
		- Added Power Auras Integration
	v2.2
		- Added volume control
		- Added "/gtfo options" command
		- Added melee hit/miss detection
	v2.2.1
		- Added spells
	v2.2.2
		- Fixed spells
	v2.2.3
		- Reduced memory footprint
		- Added spells
		- Improved help documentation
	v2.3
		- Added tank vs. non-tank alert support (alerts coming soon!)
		- Added Cataclysm beta spells (requires test mode)
		- Added test mode for untested alerts
		- Fixed a crash with users running a very old version of Power Auras Classic
	v2.4
		- Added Cataclysm compatibility
		- WAV sound effects converted to MP3s for Cataclysm support
		- Added Cataclysm beta spells
		- Removed test mode status of tested Cataclysm beta spells
	v2.5
		- Added localization support
		- Split spell files into multiple sections
		- Added spells
		- Removed test mode status of tested Cataclysm beta spells
	v2.5.1
		- Added Cataclysm spells from Blackrock Depths, Vortex Pinnacle, Grim Batol, Twilight Highlands
		- Added Classic spells from Molten Core
		- Added Wrath spells from Icecrown Citadel, Obsidian Sanctum, Ruby Sanctum
	v2.5.2
		- Added Cataclysm spells for Halls of Origination
		- Added Cataclysm spells for Lost City of the Tol'vir
		- Added Cataclysm spells for Blackrock Depths (Heroic)
		- Added Cataclysm spells for Throne of the Tides (Heroic)
		- Added Cataclysm spells for Vortex Pinnacle (Heroic)
		- Added Cataclysm spells for Grim Batol (Heroic)
	v2.5.3
		- Added Cataclysm spells for Halls of Origination
		- Added Cataclysm spells for Grim Batol
		- Added Cataclysm spells for Deadmines (Heroic)
		- Added Cataclysm spells for Shadowfang Keep (Heroic)
		- Added Wrath spells for Halls of Reflection
		- Added Wrath spells for Icecrown Citadel
	v2.6
		- WAV sound effects converted to OGGs for Cataclysm support and better sound quality
		- Updated for 4.0 compatibility
	v2.7
		- Changed Death Knight tank detection to look for Blood Presence instead of Frost
		- Fixed Paladin tank detection to look for tanking shields only
	v2.8
		- Fixed "You're not in a raid" spam in battlegrounds
	v2.8.1
		- Added German localization - Thanks Freydis88
		- Added Russian localization - Thanks pcki11
	v2.8.2
		- Added new player 4.x spells
	v2.9
		- Removed "3.x vs. 4.x" support code
		- Optimized sound code
		- Added Wrath spells for Icecrown Citadel
		- Fixed Wrath spells for Icecrown Citadel
	v2.9.1
		- Added Wrath spells for Icecrown Citadel
		- Added Burning Crusade spells for Hellfire Ramparts
		- Added Burning Crusade spells for Blood Furnace
		- Added Classic spells for Molten Core
		- Added Generic spells (Rain of Fire)
	v3.0
		- General code optimizations
		- Added Simplified Chinese localization - Thanks Wowuicn
		- Added Traditional Chinese localization - Thanks Wowuicn
		- Enabled optimized sound code added in 2.9 (oops!)
		- Added 5th volume level
		- Added the ability to hear sounds when game sounds are normally muted
		- Added support for "always alert" spells to ignore absorb/immune/missed
		- Added support for vehicle spell alerts (Malygos, Flame Leviathan)
		- Fixed all "English only" alerts to support all clients
		- Added Burning Crusade spells (Untested)
		- Added Wrath spells for Ulduar
		- Added Wrath spells for Icecrown Citadel
		- Added Wrath spells for Eye of Eternity
	v3.0.1
		- Added Burning Crusade spells for Karazhan
		- Added Burning Crusade spells for Slave Pens
		- Added Burning Crusade spells for the Underbog
		- Added Burning Crusade spells for the Steamvaults
		- Added Burning Crusade spells for Sethekk Halls
		- Added Burning Crusade spells for Shadow Labyrinth
		- Added Burning Crusade spells for Old Hillsbrad Foothills
		- Added Burning Crusade spells for Black Morass
		- Added Burning Crusade spells for Hyjal Summit
		- Added Burning Crusade spells for Black Temple
		- Added Burning Crusade spells for Auchenai Crypts
		- Updated Cataclysm spells for Deadmines (Heroic)
	v3.0.2
		- Added Cataclysm spells for Baradin Hold
		- Added Cataclysm spells for the Bastion of Twilight
		- Added Classic spells
		- Added comments to the LUA code
	v3.1
		- Added "friendly fire" alert and sound
		- Added experimental/beta mode option in config
		- Added trivial alert mode option in config
		- Added "minimum stacks" variable to alerts
		- Added "level" variable to determine trivial alerts
		- Added friendly pop-up message for first-time users and version upgraders
		- Updated Wrath spells for Icecrown Citadel
		- Added Wrath spells for Nexus
		- Added Wrath spells for Azjol-Nerub
		- Added Wrath spells for Ulduar
		- Updated Cataclysm spells for Bastion of Twilight
		- Added Cataclysm spells for Blackwing Descent
		- Added Cataclysm spells for Throne of the Four Winds
		- Added Cataclysm spells for Shadowfang Keep (Heroic)
		- Updated German localization - Thanks Freydis88
	v3.2
		- Added French localization - Thanks Blubibulga
		- Fixed Mob GUID function
		- Added "specific mob" variable to alerts
		- Added Burning Crusade spells for Sethekk Halls
		- Added Burning Crusade spells for Shattered Halls
		- Added Burning Crusade spells for Black Temple
		- Added Burning Crusade spells for Serpentshrine Cavern
		- Added Burning Crusade spells for Arcatraz
		- Added Burning Crusade spells for Mechanar
		- Added Burning Crusade spells for Shadow Labyrinth
		- Added Burning Crusade spells for Botanica
		- Added Classic spells for Molten Core
		- Added Wrath spells for Onyxia's Lair
	v3.2.1
		- Removed GTFO_Custom.lua reference
		- Added and updated Wrath spells for Icecrown Citadel
		- Added generic spells
		- Added Classic spells for Blackrock Spire
		- Added Classic spells for Deadmines
		- Added Classic spells for Stockades
		- Added Classic spells for Scholomance
		- Added Classic spells for Stratholme
		- Added Classic spells for Shadowfang Keep
		- Added Burning Crusade spells for Magtheridon's Lair
		- Added Burning Crusade spells for Gruul's Lair
		- Added Wrath spells for Naxxramas
		- Added Wrath spells for Nexus
	v3.2.2
		- Activated Chinese and French translations (oops!)
		- Fixed a bug with missing translations
	v3.2.3
		- Fixed a bug with tanking shield detection during load
		- Added Classic spells for Gnomeregan
		- Added Classic spells for Scarlet Monastery
		- Added Classic spells for Maraudon
	v3.2.4
		- Added Classic spells for Scarlet Monastery
		- Added Classic spells for Maraudon
		- Added Classic spells for Molten Core
		- Added Burning Crusade for Karazhan
	v3.2.5
		- Updated Cataclysm spells for Blackrock Caverns
		- Added Cataclysm spells for Vashj'ir
		- Added Cataclysm spells for Uldum
		- Added Cataclysm spells for Vortex Pinnacle
		- Added Cataclysm spells for Throne of the Tides
		- Added Wrath spells for Nexus
		- Added Wrath spells for Utgarde Pinnacle
		- Added Wrath spells for Obsidian Sanctum
		- Added Classic spells for Blackrock Spire
		- Added Classic spells for Sunken Temple
	v3.2.6
		- Added Cataclysm spells for Twilight Highlands
		- Added Cataclysm spells for Uldum
		- Added Cataclysm spells for Lost City of the Tol'vir
		- Added Cataclysm spells for Vortex Pinnacle
		- Added Cataclysm spells for Deepholm
		- Added Cataclysm spells for Tol Barad
		- Added Cataclysm spells for Hyjal
	v3.2.7
		- Added Cataclysm spells for Halls of Origination (Heroic)
		- Added Cataclysm spells for Blackrock Caverns
		- Added Cataclysm spells for Hyjal
		- Added Cataclysm spells for Stonecore (Heroic)
		- Added Cataclysm spells for Grim Batol (Heroic)
	v3.3
		- Added Cataclysm spells for Halls of Origination (Heroic)
		- Added Cataclysm spells for Deadmines (Heroic)
		- Added Cataclysm spells for Stonecore (Heroic)
		- Added Cataclysm spells for Throne of the Tides (Heroic)
		- Updated Cataclysm spells for Blackwing Descent
		- Updated Cataclysm spells for Throne of the Four Winds
		- Updated Cataclysm spells for Bastion of Twilight
		- Updated Cataclysm spells for Baradin Hold
		- Updated Traditional Chinese localization - Thanks Wowuicn
		- Updated Traditional Russian localization - Thanks D_Angel
	v3.3.1
		- Added Cataclysm spells for Blackwing Descent
		- Updated Cataclysm spells for Shadowfang Keep (Heroic)
		- Added Cataclysm spells for Vortex Pinnacle
	v3.3.2
		- Added Cataclysm spells for Blackwing Descent
		- Added Cataclysm spells for Bastion of Twilight
	v3.4
		- Added support to detect "energize" events
		- Added Cataclysm spells for Blackwing Descent
		- Added Cataclysm spells for Grim Batol
		- Updated Cataclysm spells for Throne of the Tides
	v3.4.1
		- Fixed Cataclysm spells for Bastion of Twilight
	v3.4.2
		- Updated French localization - Thanks Blubibulga
		- Removed Cataclysm spells for Bastion of Twilight


]]--

GTFO = {
	DefaultSettings = {
		Active = true;
		Sounds = { true, true, true, true };
		ScanMode = nil;
		DebugMode = nil; -- Turn on debug alerts
		TestMode = nil; -- Activate alerts for events marked as "test only"
		UnmuteMode = nil;
		TrivialMode = nil;
		Volume = 3; -- Volume setting, 3 = default
	};
	Version = "3.4.2"; -- Version number (text format)
	VersionNumber = 30402; -- Numeric version number for checking out-of-date clients
	DataCode = "4"; -- Saved Variable versioning, change this value to force a reset to default
	CanTank = nil; -- The active character is capable of tanking
	TankMode = nil; -- The active character is a tank
	SpellName = { }; -- List of spells (legacy placeholder, not supported)
	SpellID = { }; -- List of spell IDs
	MobID = { }; -- List of mob IDs for melee attack detection
	UpdateFound = nil; -- Upgrade available?
	IgnoreTimeAmount = .2; -- Number of seconds between alert sounds
	IgnoreTime = nil;
	IgnoreUpdateTimeAmount = 5; -- Number of seconds between sending out version updates
	IgnoreUpdateTime = nil;
	IgnoreUpdateRequestTimeAmount = 90; -- Number of seconds between sending out version update requests
	IgnoreUpdateRequestTime = nil;
	MuteTime = nil;
	Users = { };
	Sounds = { }; -- Sound Files
	SoundSettings = { }; -- CVARs for temporary muting
	SoundTimes = { .3, .1, .2, .25 }; -- Length of sound files in seconds (for auto-unmute)
	PartyMembers = 0;
	RaidMembers = 0;
	PowerAuras = nil;
	ShowAlert = nil;
	Settings = { };
	UIRendered = nil;
};

GTFOData = {
	["Sounds"] = {
		true, -- [1]
		true, -- [2]
		true, -- [3]
		true, -- [4]
	},
	["DataCode"] = "4",
	["Active"] = 1,
	["Volume"] = 1,
};

StaticPopupDialogs["GTFO_POPUP_MESSAGE"] = {
	text = GTFOLocal.LoadingPopup_Message,
	button1 = YES,
	button2 = NO,
	OnAccept = function()
		GTFO_Command_Options()
	end,
	OnCancel = function()
		GTFO_ChatPrint(string.format(GTFOLocal.ClosePopup_Message," |cFFFFFFFF/gtfo options|r"))
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
};

function GTFO_ChatPrint(str)
	DEFAULT_CHAT_FRAME:AddMessage("[GTFO] "..str, 0.25, 1.0, 0.25);
end

function GTFO_ErrorPrint(str)
	DEFAULT_CHAT_FRAME:AddMessage("[GTFO] "..str, 1.0, 0.5, 0.5);
end

function GTFO_DebugPrint(str)
	if (GTFO.Settings.DebugMode) then
		DEFAULT_CHAT_FRAME:AddMessage("[GTFO] "..str, 0.75, 1.0, 0.25);
	end
end

function GTFO_ScanPrint(str)
	if (GTFO.Settings.ScanMode) then
		DEFAULT_CHAT_FRAME:AddMessage("[GTFO] "..str, 0.5, 0.5, 0.85);
	end
end

function GTFO_GetMobId(GUID)
    if not GUID then return end
    return tonumber(GUID:sub(6, 10), 16)
end

function GTFO_OnEvent(self, event, ...)
	if (event == "VARIABLES_LOADED") then
		if (GTFOData.DataCode ~= GTFO.DataCode) then
			GTFO_SetDefaults();
			GTFO_ChatPrint(string.format(GTFOLocal.Loading_NewDatabase, GTFO.Version));
			GTFO_DisplayConfigPopupMessage();
		end
		GTFO.Settings = {
			Active = GTFOData.Active;
			Sounds = { GTFOData.Sounds[1], GTFOData.Sounds[2], GTFOData.Sounds[3], GTFOData.Sounds[4] };
			ScanMode = GTFOData.ScanMode;
			DebugMode = GTFOData.DebugMode;
			TestMode = GTFOData.TestMode;
			UnmuteMode = GTFOData.UnmuteMode;
			TrivialMode = GTFOData.TrivialMode;
			Volume = GTFOData.Volume;
		};

		GTFO_RenderOptions();
		GTFO_SaveSettings();

		if (IsAddOnLoaded("PowerAuras")) then
			if (PowaAuras and PowaAuras.AurasByType) then
				if (PowaAuras.AurasByType.GTFOHigh) then
					GTFO.PowerAuras = true;
				else
					GTFO_ChatPrint(GTFOLocal.Loading_PowerAurasOutOfDate);
				end
			else
				GTFO_ChatPrint(GTFOLocal.Loading_PowerAurasOutOfDate);
			end
		end
		if (GTFO.Settings.Active and GTFO.PowerAuras) then
			GTFO_ChatPrint(string.format(GTFOLocal.Loading_LoadedWithPowerAuras, GTFO.Version));
		elseif (GTFO.Settings.Active) then
			GTFO_ChatPrint(string.format(GTFOLocal.Loading_Loaded, GTFO.Version));
		else
			GTFO_ChatPrint(string.format(GTFOLocal.Loading_LoadedSuspended, GTFO.Version));
		end
		GTFO.Users[UnitName("player")] = GTFO.VersionNumber;
		GTFO_GetSounds();
		GTFO_CanTankCheck();
		GTFO.TankMode = GTFO_CheckTankMode()
		GTFO_SendUpdateRequest();
		return;
	end
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		local timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, misc1, misc2, misc3, misc4, misc5, misc6, misc7 = ...;

		local SpellType = tostring(eventType);
		local vehicle = nil;
		if (destGUID ~= UnitGUID("player")) then
			if (destGUID == UnitGUID("vehicle")) then
				-- Player's vehicle is targetted, not the player
				vehicle = true;
			else
				return;
			end
		end
		if (SpellType == "ENVIRONMENTAL_DAMAGE") then
			-- Environmental detection
			GTFO_ScanPrint(SpellType.." - "..tostring(misc1));
			if (misc1 ~= "FALLING") then
				GTFO_PlaySound(2);
				return;
			end
		elseif (SpellType=="SPELL_PERIODIC_DAMAGE" or SpellType=="SPELL_DAMAGE" or SpellType=="SPELL_MISSED" or SpellType=="SPELL_PERIODIC_MISSED" or SpellType=="SPELL_ENERGIZE" or ((SpellType=="SPELL_AURA_APPLIED" or SpellType=="SPELL_AURA_APPLIED_DOSE") and misc4=="DEBUFF")) then
			-- Spell detection
			local SpellID = tonumber(misc1);
			local SpellName = tostring(misc2);
			local SpellSourceGUID = tostring(sourceGUID);

			-- Special exception for Onyxia Breath's and her stupid 92 different spell IDs
			if ((SpellID > 17086 and SpellID <= 17097) or (SpellID >= 18351 and SpellID <= 18361) or (SpellID >= 18564 and SpellID <= 18607) or SpellID == 18609 or (SpellID >= 18611 and SpellID <= 18628)) then
				SpellID = 17086;
			end

			SpellID = tostring(SpellID);

			if (vehicle) then
				GTFO_ScanPrint("V: "..SpellType.." - "..SpellID.." - "..SpellName.." - "..tostring(sourceName).." ("..GTFO_GetMobId(sourceGUID)..") >"..tostring(destName));
			elseif (SpellType~="SPELL_ENERGIZE" or (SpellType=="SPELL_ENERGIZE" and sourceGUID ~= UnitGUID("player"))) then
				GTFO_ScanPrint(SpellType.." - "..SpellID.." - "..SpellName.." - "..tostring(sourceName).." ("..GTFO_GetMobId(sourceGUID)..") >"..tostring(destName));
			end
			if (GTFO.SpellID[SpellID]) then
				if (vehicle and not GTFO.SpellID[SpellID].vehicle) then
					-- Vehicle damage and vehicle mode is not set
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Vehicle not enabled");
					return;
				end
				if (GTFO.SpellID[SpellID].test and not GTFO.Settings.TestMode) then
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Test mode off");
					-- Test mode is off, ignore
					return;
				end
				if (GTFO.SpellID[SpellID].trivialLevel and not GTFO.Settings.TrivialMode and GTFO.SpellID[SpellID].trivialLevel <= UnitLevel("player")) then
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Trivial spell");
					-- Trivial mode is off, ignore trivial spell
					return;
				end
				if (GTFO.SpellID[SpellID].specificMobs and not tContains(GTFO.SpellID[SpellID].specificMobs, GTFO_GetMobId(sourceGUID))) then
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Mob isn't on the list");
					-- Mob isn't on the list, ignore spell
					return;
				end
				if ((SpellType == "SPELL_MISSED" or SpellType == "SPELL_PERIODIC_MISSED") and not GTFO.SpellID[SpellID].alwaysAlert) then
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Spell missed & always alert off");
					-- Always Alert is off, ignore missed spell
					return;
				end
				if (GTFO.SpellID[SpellID].applicationOnly) then
					if (GTFO.SpellID[SpellID].minimumStacks) then
						if (SpellType ~= "SPELL_AURA_APPLIED_DOSE" or not misc5) then
							GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Application only w/ minimum stacks & not a dosage event");
							-- Not a dose application event
							return;
						elseif (tonumber(misc5) <= tonumber(GTFO.SpellID[SpellID].minimumStacks)) then
							GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Application only w/ minimum stacks & not enough stacks");
							-- Not a dose application event or not enough stacks
							return;
						end
					elseif (not (SpellType == "SPELL_AURA_APPLIED" or SpellType == "SPELL_AURA_APPLIED_DOSE")) then
						GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Application only & non-application event");
						-- Application Only is set and this was a non-application event
						return;
					end
				end
				if (SpellSourceGUID == UnitGUID("player") and GTFO.SpellID[SpellID].ignoreSelfInflicted) then
					GTFO_DebugPrint("Won't alert "..SpellName.." ("..SpellID..") - Ignore self inflicted");
					-- Self-inflicted wound and "Ignore Self Inflicated" is set
					return;
				end
				if (GTFO.SpellID[SpellID].tankSound and GTFO.TankMode) then
					GTFO_PlaySound(GTFO.SpellID[SpellID].tankSound);
				else
					GTFO_PlaySound(GTFO.SpellID[SpellID].sound);
				end
				return;
			end
		elseif (SpellType=="SWING_DAMAGE" or SpellType=="SWING_MISSED") then
			-- Melee hit detection
			local SourceMobID = tostring(GTFO_GetMobId(sourceGUID));
			if (GTFO.MobID[SourceMobID]) then
				if (GTFO.MobID[SourceMobID].test and not GTFO.Settings.TestMode) then
					return;
				end
				if (GTFO.MobID[SourceMobID].trivialLevel and not GTFO.Settings.TrivialMode and GTFO.MobID[SourceMobID].trivialLevel <= UnitLevel("player")) then
					-- Trivial mode is off, ignore trivial mob
					return;
				end
				if (SpellType=="SWING_DAMAGE") then
					local damage = misc1 ~= "ABSORB" and misc1 or 0
					if (damage > 0 or not GTFO.MobID[SourceMobID].damageOnly) then
						if (GTFO.MobID[SourceMobID].tankSound and GTFO.TankMode) then
							GTFO_PlaySound(GTFO.MobID[SourceMobID].tankSound);
						else
							GTFO_PlaySound(GTFO.MobID[SourceMobID].sound);
						end
						--GTFO_DebugPrint(GTFO.MobID[SourceMobID].desc);
						return;
					end
				elseif (not GTFO.MobID[SourceMobID].damageOnly and SpellType=="SWING_MISSED") then
					if (GTFO.MobID[SourceMobID].tankSound and GTFO.TankMode) then
						GTFO_PlaySound(GTFO.MobID[SourceMobID].tankSound);
					else
						GTFO_PlaySound(GTFO.MobID[SourceMobID].sound);
					end
					--GTFO_DebugPrint(GTFO.MobID[SourceMobID].desc);
					return;
				end
			end
		end
		return;
	end
	if (event == "CHAT_MSG_ADDON") then
		local msgPrefix, msgMessage, msgType, msgSender = ...;
		if (msgPrefix == "GTFO_v") then
			if (not GTFO.Users[msgSender]) then
				GTFO_SendUpdate(msgType);
			end
			GTFO.Users[msgSender] = msgMessage;
			if ((tonumber(msgMessage) > GTFO.VersionNumber) and not GTFO.UpdateFound) then
				GTFO.UpdateFound = GTFO_ParseVersionNumber(msgMessage);
				GTFO_ChatPrint(string.format(GTFOLocal.Loading_OutOfDate, GTFO.UpdateFound));
			end
			return;
		end
		if (msgPrefix == "GTFO_u") then
			GTFO_DebugPrint(msgSender.." requested update to "..msgType);
			GTFO_SendUpdate(msgType);
			return;
		end
		return;
	end
	if (event == "PARTY_MEMBERS_CHANGED") then
		local PartyMembers = GetNumPartyMembers();
		if (PartyMembers > GTFO.PartyMembers and GTFO.RaidMembers == 0) then
			if (UnitInBattleground("player")) then
				GTFO_SendUpdate("BATTLEGROUND");
			else
				GTFO_SendUpdate("PARTY");
			end
		end
		GTFO.PartyMembers = PartyMembers;
		return;
	end
	if (event == "RAID_ROSTER_UPDATE") then
		local RaidMembers = GetNumRaidMembers();
		if (RaidMembers > GTFO.RaidMembers) then
			if (UnitInBattleground("player")) then
				GTFO_SendUpdate("BATTLEGROUND");
			else
				GTFO_SendUpdate("RAID");
			end
		end
		GTFO.RaidMembers = RaidMembers;
		return;
	end
	if (event == "UNIT_INVENTORY_CHANGED") then
		local msgUnit = ...;
		if (UnitIsUnit(msgUnit, "PLAYER")) then
			GTFO.TankMode = GTFO_CheckTankMode();
		end
	end
	if (event == "UPDATE_SHAPESHIFT_FORM") then
		GTFO.TankMode = GTFO_CheckTankMode();
	end
end

function GTFO_Command(arg1)
	local Command = string.upper(arg1);
	local DescriptionOffset = string.find(arg1,"%s",1);
	local Description = nil;

	if (DescriptionOffset) then
		Command = string.upper(string.sub(arg1, 1, DescriptionOffset - 1));
		Description = tostring(string.sub(arg1, DescriptionOffset + 1));
	end

	GTFO_DebugPrint("Command executed: "..Command);

	if (Command == "OPTION" or Command == "OPTIONS") then
		GTFO_Command_Options();
	elseif (Command == "STANDBY") then
		GTFO_Command_Standby();
	elseif (Command == "DEBUG") then
		GTFO_Command_Debug();
	elseif (Command == "SCAN" or Command == "SCANNER") then
		GTFO_Command_Scan();
	elseif (Command == "TESTMODE") then
		GTFO_Command_TestMode();
	elseif (Command == "VERSION") then
		GTFO_Command_Version();
	elseif (Command == "TEST") then
		GTFO_PlaySound(1);
		if (GTFO.Settings.Sounds[1]) then
			GTFO_ChatPrint(GTFOLocal.TestSound_High);
		else
			GTFO_ChatPrint(GTFOLocal.TestSound_HighMuted);
		end
	elseif (Command == "TEST2") then
		GTFO_PlaySound(2);
		if (GTFO.Settings.Sounds[2]) then
			GTFO_ChatPrint(GTFOLocal.TestSound_Low);
		else
			GTFO_ChatPrint(GTFOLocal.TestSound_LowMuted);
		end
	elseif (Command == "TEST3") then
		GTFO_PlaySound(3);
		if (GTFO.Settings.Sounds[3]) then
			GTFO_ChatPrint(GTFOLocal.TestSound_Fail);
		else
			GTFO_ChatPrint(GTFOLocal.TestSound_FailMuted);
		end
	elseif (Command == "TEST4") then
		GTFO_PlaySound(4);
		if (GTFO.Settings.Sounds[4]) then
			GTFO_ChatPrint(GTFOLocal.TestSound_FriendlyFire);
		else
			GTFO_ChatPrint(GTFOLocal.TestSound_FriendlyFireMuted);
		end
	elseif (Command == "HELP" or Command == "") then
		GTFO_Command_Help();
	else
		GTFO_Command_Help();
	end
end

function GTFO_Command_Debug()
	if (GTFO.Settings.DebugMode) then
		GTFO.Settings.DebugMode = nil;
		GTFO_ChatPrint("Debug mode off.");
	else
		GTFO.Settings.DebugMode = true;
		GTFO_ChatPrint("Debug mode on.");
	end
	GTFO_SaveSettings();
end

function GTFO_Command_Scan()
	if (GTFO.Settings.ScanMode) then
		GTFO.Settings.ScanMode = nil;
		GTFO_ChatPrint("Scan mode off.");
	else
		GTFO.Settings.ScanMode = true;
		GTFO_ChatPrint("Scan mode on.");
	end
	GTFO_SaveSettings();
end

function GTFO_Command_TestMode()
	if (GTFO.Settings.TestMode) then
		GTFO.Settings.TestMode = nil;
		GTFO_ChatPrint("Test mode off.");
	else
		GTFO.Settings.TestMode = true;
		GTFO_ChatPrint("Test mode on.");
	end
	GTFO_SaveSettings();
end

function GTFO_Command_Standby()
	if (GTFO.Settings.Active) then
		GTFO.Settings.Active = nil;
		GTFO_ChatPrint(GTFOLocal.Active_Off);
	else
		GTFO.Settings.Active = true;
		GTFO_ChatPrint(GTFOLocal.Active_On);
	end
	GTFO_SaveSettings();
	GTFO_ActivateMod();
end

function GTFO_OnLoad()
	GTFOFrame:RegisterEvent("VARIABLES_LOADED");
	GTFOFrame:RegisterEvent("PARTY_MEMBERS_CHANGED");
	GTFOFrame:RegisterEvent("RAID_ROSTER_UPDATE");
	GTFOFrame:RegisterEvent("CHAT_MSG_ADDON");
	SlashCmdList["GTFO"] = GTFO_Command;
	SLASH_GTFO1 = "/GTFO";
end

function GTFO_PlaySound(iSound, bOverride)
	if (iSound == 0) then
		return;
	end

	local currentTime = GetTime();
	if (GTFO.IgnoreTime) then
		if (currentTime < GTFO.IgnoreTime) then
			return;
		end
	end
	GTFO.IgnoreTime = currentTime + GTFO.IgnoreTimeAmount;

	if (bOverride or GTFO.Settings.Sounds[iSound]) then
		if (bOverride and getglobal("GTFO_UnmuteButton"):GetChecked()) then
			GTFO_UnmuteSound(GTFO.SoundTimes[iSound]);
		elseif (GTFO.Settings.UnmuteMode and GTFO.SoundTimes[iSound] and not bOverride) then
			GTFO_UnmuteSound(GTFO.SoundTimes[iSound]);
		end
		PlaySoundFile(GTFO.Sounds[iSound]);
		if (GTFO.Settings.Volume >= 4) then
			PlaySoundFile(GTFO.Sounds[iSound]);
		end
		if (GTFO.Settings.Volume >= 5) then
			PlaySoundFile(GTFO.Sounds[iSound]);
		end
	end
	if (GTFO.PowerAuras) then
		GTFO_DebugPrint("Display Power Aura #"..tostring(iSound));
		GTFO_DisplayAura(iSound);
	end
end

-- Create Addon Menu options and interface
function GTFO_RenderOptions()
	GTFO.UIRendered = true;

	local ConfigurationPanel = CreateFrame("FRAME","GTFO_MainFrame");
	ConfigurationPanel.name = "GTFO";
	InterfaceOptions_AddCategory(ConfigurationPanel);

	local VolumeText = ConfigurationPanel:CreateFontString("GTFO_VolumeText","ARTWORK","GameFontNormal");
	VolumeText:SetPoint("TOPLEFT", 170, -195);
	VolumeText:SetText("");

	local IntroMessageHeader = ConfigurationPanel:CreateFontString(nil, "ARTWORK","GameFontNormalLarge");
	IntroMessageHeader:SetPoint("TOPLEFT", 10, -10);
	IntroMessageHeader:SetText("GTFO "..GTFO.Version);

	local EnabledButton = CreateFrame("CheckButton", "GTFO_EnabledButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	EnabledButton:SetPoint("TOPLEFT", 10, -35)
	EnabledButton.tooltip = GTFOLocal.UI_EnabledDescription;
	getglobal(EnabledButton:GetName().."Text"):SetText(GTFOLocal.UI_Enabled);

	local HighSoundButton = CreateFrame("CheckButton", "GTFO_HighSoundButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	HighSoundButton:SetPoint("TOPLEFT", 10, -65)
	HighSoundButton.tooltip = GTFOLocal.UI_HighDamageDescription;
	getglobal(HighSoundButton:GetName().."Text"):SetText(GTFOLocal.UI_HighDamage);

	local LowSoundButton = CreateFrame("CheckButton", "GTFO_LowSoundButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	LowSoundButton:SetPoint("TOPLEFT", 10, -95)
	LowSoundButton.tooltip = GTFOLocal.UI_LowDamageDescription;
	getglobal(LowSoundButton:GetName().."Text"):SetText(GTFOLocal.UI_LowDamage);

	local FailSoundButton = CreateFrame("CheckButton", "GTFO_FailSoundButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	FailSoundButton:SetPoint("TOPLEFT", 10, -125)
	FailSoundButton.tooltip = GTFOLocal.UI_FailDescription;
	getglobal(FailSoundButton:GetName().."Text"):SetText(GTFOLocal.UI_Fail);

	local FriendlyFireSoundButton = CreateFrame("CheckButton", "GTFO_FriendlyFireSoundButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	FriendlyFireSoundButton:SetPoint("TOPLEFT", 10, -155)
	FriendlyFireSoundButton.tooltip = GTFOLocal.UI_FriendlyFireDescription;
	getglobal(FriendlyFireSoundButton:GetName().."Text"):SetText(GTFOLocal.UI_FriendlyFire);

	local HighTestButton = CreateFrame("Button", "GTFO_HighTestButton", ConfigurationPanel, "OptionsButtonTemplate");
	HighTestButton:SetPoint("TOPLEFT", 300, -65);
	HighTestButton.tooltip = GTFOLocal.UI_TestDescription;
	HighTestButton:SetScript("OnClick",GTFO_Option_HighTest);
	getglobal(HighTestButton:GetName().."Text"):SetText(GTFOLocal.UI_Test);

	local LowTestButton = CreateFrame("Button", "GTFO_LowTestButton", ConfigurationPanel, "OptionsButtonTemplate");
	LowTestButton:SetPoint("TOPLEFT", 300, -95);
	LowTestButton.tooltip = GTFOLocal.UI_TestDescription;
	LowTestButton:SetScript("OnClick",GTFO_Option_LowTest);
	getglobal(LowTestButton:GetName().."Text"):SetText(GTFOLocal.UI_Test);

	local FailTestButton = CreateFrame("Button", "GTFO_FailTestButton", ConfigurationPanel, "OptionsButtonTemplate");
	FailTestButton:SetPoint("TOPLEFT", 300, -125);
	FailTestButton.tooltip = GTFOLocal.UI_TestDescription;
	FailTestButton:SetScript("OnClick",GTFO_Option_FailTest);
	getglobal(FailTestButton:GetName().."Text"):SetText(GTFOLocal.UI_Test);

	local FriendlyFireTestButton = CreateFrame("Button", "GTFO_FriendlyFireTestButton", ConfigurationPanel, "OptionsButtonTemplate");
	FriendlyFireTestButton:SetPoint("TOPLEFT", 300, -155);
	FriendlyFireTestButton.tooltip = GTFOLocal.UI_TestDescription;
	FriendlyFireTestButton:SetScript("OnClick",GTFO_Option_FriendlyFireTest);
	getglobal(FriendlyFireTestButton:GetName().."Text"):SetText(GTFOLocal.UI_Test);

	local VolumeSlider = CreateFrame("Slider", "GTFO_VolumeSlider", ConfigurationPanel, "OptionsSliderTemplate");
	VolumeSlider:SetPoint("TOPLEFT", 12, -195);
	VolumeSlider.tooltip = GTFOLocal.UI_VolumeDescription;
	VolumeSlider:SetScript("OnValueChanged",GTFO_Option_SetVolume);
	getglobal(GTFO_VolumeSlider:GetName().."Text"):SetText(GTFOLocal.UI_Volume);
	getglobal(GTFO_VolumeSlider:GetName().."High"):SetText(GTFOLocal.UI_VolumeMax);
	getglobal(GTFO_VolumeSlider:GetName().."Low"):SetText(GTFOLocal.UI_VolumeMin);
	VolumeSlider:SetMinMaxValues(1,5);
	VolumeSlider:SetValueStep(1);
	VolumeSlider:SetValue(GTFO.Settings.Volume);

	GTFO_Option_SetVolumeText(GTFO.Settings.Volume);

	local UnmuteButton = CreateFrame("CheckButton", "GTFO_UnmuteButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	UnmuteButton:SetPoint("TOPLEFT", 10, -240)
	UnmuteButton.tooltip = GTFOLocal.UI_UnmuteDescription.."\n\n("..GTFOLocal.UI_UnmuteDescription2..")";
	getglobal(UnmuteButton:GetName().."Text"):SetText(GTFOLocal.UI_Unmute);

	local TrivialButton = CreateFrame("CheckButton", "GTFO_TrivialButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	TrivialButton:SetPoint("TOPLEFT", 10, -270)
	TrivialButton.tooltip = GTFOLocal.UI_TrivialDescription;
	getglobal(TrivialButton:GetName().."Text"):SetText(GTFOLocal.UI_Trivial);

	local TestModeButton = CreateFrame("CheckButton", "GTFO_TestModeButton", ConfigurationPanel, "ChatConfigCheckButtonTemplate");
	TestModeButton:SetPoint("TOPLEFT", 10, -300)
	TestModeButton.tooltip = GTFOLocal.UI_TestModeDescription.."\n\n"..string.format(GTFOLocal.UI_TestModeDescription2,"zensunim","gmail","com");
	getglobal(TestModeButton:GetName().."Text"):SetText(GTFOLocal.UI_TestMode);

	ConfigurationPanel.okay =
		function (self)
			GTFO.Settings.Active = EnabledButton:GetChecked();
			GTFO.Settings.Sounds[1] = HighSoundButton:GetChecked();
			GTFO.Settings.Sounds[2] = LowSoundButton:GetChecked();
			GTFO.Settings.Sounds[3] = FailSoundButton:GetChecked();
			GTFO.Settings.Sounds[4] = FriendlyFireSoundButton:GetChecked();
			GTFO.Settings.Volume = VolumeSlider:GetValue();
			GTFO.Settings.TestMode = TestModeButton:GetChecked();
			GTFO.Settings.UnmuteMode = UnmuteButton:GetChecked();
			GTFO.Settings.TrivialMode = TrivialButton:GetChecked();
			GTFO_SaveSettings();
		end
	ConfigurationPanel.cancel =
		function (self)
			VolumeSlider:SetValue(GTFO.Settings.Volume);
			GTFO_SaveSettings();
		end
	ConfigurationPanel.default =
		function (self)
			GTFO_SetDefaults();
		end
end

function GTFO_ActivateMod()
	if (GTFO.Settings.Active) then
		GTFOFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	else
		GTFOFrame:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	end
end

function GTFO_OnUpdate()
	local currentTime = GetTime();
	if (GTFO.MuteTime) then
		if (currentTime > GTFO.MuteTime) then
			GTFO_MuteSound();
		end
	else
		GTFOFrame:SetScript("OnUpdate", nil);
	end
end

function GTFO_UnmuteSound(delayTime)
	local muteTime = GetTime() + delayTime;
	if (not GTFO.MuteTime) then
		GTFO.SoundSettings.EnableAllSound = GetCVarBool("Sound_EnableAllSound");
		GTFO.SoundSettings.EnableSFX = GetCVarBool("Sound_EnableSFX");
		SetCVar("Sound_EnableAllSound", 1);
		SetCVar("Sound_EnableSFX", 1);
		GTFOFrame:SetScript("OnUpdate", GTFO_OnUpdate);
		GTFO_DebugPrint("Temporarily unmuting volume for "..delayTime.. " seconds.");
	else
		GTFO_DebugPrint("Adding time to keep volume unmuted for "..delayTime.. " seconds.");
	end
	if (not GTFO.MuteTime or muteTime > GTFO.MuteTime) then
		GTFO.MuteTime = muteTime;
	end
end

function GTFO_MuteSound()
	GTFO.MuteTime = nil;
	GTFOFrame:SetScript("OnUpdate", nil);
	SetCVar("Sound_EnableAllSound", GTFO.SoundSettings.EnableAllSound);
	SetCVar("Sound_EnableSFX", GTFO.SoundSettings.EnableSFX);
	GTFO_DebugPrint("Muting sound again.");
end

function GTFO_Command_Help()
	DEFAULT_CHAT_FRAME:AddMessage("[GTFO] "..string.format(GTFOLocal.Help_Intro, GTFO.Version), 0.25, 1.0, 0.25);
	if not (GTFO.Settings.Active) then
		DEFAULT_CHAT_FRAME:AddMessage(GTFOLocal.Help_Suspended, 1.0, 0.1, 0.1);
	end
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo options|r -- "..GTFOLocal.Help_Options, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo standby|r -- "..GTFOLocal.Help_Suspend, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo version|r -- "..GTFOLocal.Help_Version, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo test|r -- "..GTFOLocal.Help_TestHigh, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo test2|r -- "..GTFOLocal.Help_TestLow, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo test3|r -- "..GTFOLocal.Help_TestFail, 0.25, 1.0, 0.75);
	DEFAULT_CHAT_FRAME:AddMessage("|cFFEEEE00/gtfo test4|r -- "..GTFOLocal.Help_TestFriendlyFire, 0.25, 1.0, 0.75);
end

function GTFO_Option_HighTest()
	GTFO_PlaySound(1, true);
end

function GTFO_Option_LowTest()
	GTFO_PlaySound(2, true);
end

function GTFO_Option_FailTest()
	GTFO_PlaySound(3, true);
end

function GTFO_Option_FriendlyFireTest()
	GTFO_PlaySound(4, true);
end

-- Get a list of all the people in your group/raid using GTFO and their version numbers
function GTFO_Command_Version()
	GTFO_SendUpdateRequest();
	local raidmembers = GetNumRaidMembers();
	local partymembers = GetNumPartyMembers();
	local users = 0;

	if (raidmembers > 0 or partymembers > 0) then
		if (raidmembers > 0) then
			for i = 1, raidmembers, 1 do
				local name = UnitName("raid"..i);
				if (GTFO.Users[name]) then
					GTFO_ChatPrint(name..": "..GTFO_ParseVersionColor(GTFO.Users[name]));
					users = users + 1;
				else
					GTFO_ChatPrint(name..": |cFF999999"..GTFOLocal.Group_None.."|r");
				end
			end
			GTFO_ChatPrint(string.format(GTFOLocal.Group_RaidMembers, users, raidmembers));
		elseif (partymembers > 0) then
			GTFO_ChatPrint(UnitName("player")..": "..GTFO_ParseVersionColor(GTFO.VersionNumber));
			users = 1;
			for i = 1, partymembers, 1 do
				local name = UnitName("party"..i);
				if (GTFO.Users[name]) then
					GTFO_ChatPrint(name..": "..GTFO_ParseVersionColor(GTFO.Users[name]));
					users = users + 1;
				else
					GTFO_ChatPrint(name..": |cFF999999"..GTFOLocal.Group_None.."|r");
				end
			end
			GTFO_ChatPrint(string.format(GTFOLocal.Group_PartyMembers, users, (partymembers + 1)));
		end
	else
		GTFO_ErrorPrint(GTFOLocal.Group_NotInGroup);
	end
end

function GTFO_ParseVersionColor(iVersionNumber)
	local Color = "";
	if (GTFO.VersionNumber < iVersionNumber * 1) then
		Color = "|cFFFFFF00"
	elseif (GTFO.VersionNumber == iVersionNumber * 1) then
		Color = "|cFFFFFFFF"
	else
		Color = "|cFFAAAAAA"
	end
	return Color..GTFO_ParseVersionNumber(iVersionNumber).."|r"
end

function GTFO_ParseVersionNumber(iVersionNumber)
	local sVersion = "";
	local iMajor = math.floor(iVersionNumber * 0.0001);
	local iMinor = math.floor((iVersionNumber - (iMajor * 10000)) * 0.01)
	local iMinor2 = iVersionNumber - (iMajor * 10000) - (iMinor * 100)
	if (iMinor2 > 0) then
		sVersion = iMajor.."."..iMinor.."."..iMinor2
	else
		sVersion = iMajor.."."..iMinor
	end
	return sVersion;
end

function GTFO_SendUpdate(sMethod)
	if not (sMethod == "PARTY" or sMethod == "RAID" or sMethod == "BATTLEGROUND") then
		return;
	end
	local currentTime = GetTime();
	if (GTFO.IgnoreUpdateTime) then
		if (currentTime < GTFO.IgnoreUpdateTime) then
			return;
		end
	end
	GTFO.IgnoreUpdateTime = currentTime + GTFO.IgnoreUpdateTimeAmount;

	SendAddonMessage("GTFO_v",GTFO.VersionNumber,sMethod)
end

function GTFO_SendUpdateRequest()
	local currentTime = GetTime();
	if (GTFO.IgnoreUpdateRequestTime) then
		if (currentTime < GTFO.IgnoreUpdateRequestTime) then
			return;
		end
	end
	GTFO.IgnoreUpdateRequestTime = currentTime + GTFO.IgnoreUpdateRequestTimeAmount;

	local raidmembers = GetNumRaidMembers();
	local partymembers = GetNumPartyMembers();

	if (UnitInBattleground("player")) then
		SendAddonMessage("GTFO_u","U","BATTLEGROUND");
	elseif (raidmembers > 0) then
		SendAddonMessage("GTFO_u","U","RAID");
	elseif (partymembers > 0) then
		SendAddonMessage("GTFO_u","U","PARTY");
	end
end

function GTFO_Command_Options()
	InterfaceOptionsFrame_OpenToCategory("GTFO")
end

function GTFO_Option_SetVolume()
	if (not GTFO.UIRendered) then
		return;
	end
	GTFO.Settings.Volume = getglobal("GTFO_VolumeSlider"):GetValue() * 1;
	GTFO_GetSounds();
	GTFO_Option_SetVolumeText(GTFO.Settings.Volume)
end

function GTFO_Option_SetVolumeText(iVolume)
	if (iVolume == 1) then
		getglobal("GTFO_VolumeText"):SetText(GTFOLocal.UI_VolumeQuiet);
	elseif (iVolume == 2) then
		getglobal("GTFO_VolumeText"):SetText(GTFOLocal.UI_VolumeSoft);
	elseif (iVolume == 4) then
		getglobal("GTFO_VolumeText"):SetText(GTFOLocal.UI_VolumeLoud);
	elseif (iVolume == 5) then
		getglobal("GTFO_VolumeText"):SetText(GTFOLocal.UI_VolumeLouder);
	elseif (iVolume > 5) then
		getglobal("GTFO_VolumeText"):SetText(iVolume);
	else
		getglobal("GTFO_VolumeText"):SetText(GTFOLocal.UI_VolumeNormal);
	end
end

-- Detect if the player is tanking or not
function GTFO_CheckTankMode()
	if (GTFO.CanTank) then
		local x, class = UnitClass("player");
		if (class == "PALADIN") then
			-- While it's more obvious to check for Righteous Fury, that ended up being more CPU intensive than desired
			-- Checking for the shield is good enough.
			if (GetInventoryItemID("PLAYER",17)) then
				local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(GetInventoryItemID("PLAYER",17));
				local itemStats = {};
				if (not itemLink) then
					GTFO_DebugPrint("Item found, but unable to scan it - Tank mode off for now");
					return nil;
				end
				
				--itemStats = GetItemStats(itemLink, itemStats);
				--for statType, statValue in pairs(itemStats) do
				--	if (statType == "ITEM_MOD_INTELLECT_SHORT" or statType == "ITEM_MOD_SPIRIT_SHORT") then
				--		GTFO_DebugPrint("Healing Shield found - Tank mode off");
				--		return nil;
				--	end
				--end
				--GTFO_DebugPrint("Tanking Shield found - tank mode activated");
				
				local current = {};
				local isInspect = false;
				local group = GetActiveTalentGroup(isInspect);
				local maxTree, _ = 1;
				for i = 1, GetNumTalentTabs() do
					_, _, current[i] = GetTalentTabInfo(i,isInspect,nil,group);
					if (current[i] > current[maxTree]) then
						maxTree = i;
					end
				end
				
				if(maxTree ~= 2) then
					return nil;
				end
				
				return true;
			end
		else
			local stance = GetShapeshiftForm();
			if (class == "DRUID") then
				if (stance == 1) then
					GTFO_DebugPrint("Bear Form found - tank mode activated");
					return true;
				end
			elseif (class == "DEATHKNIGHT") then
				if (stance == 1) then
					GTFO_DebugPrint("Blood Presense found - tank mode activated");
					return true;
				end
			elseif (class == "WARRIOR") then
				if (stance == 2) then
					GTFO_DebugPrint("Defensive stance found - tank mode activated");
					return true;
				end
			else
				GTFO_DebugPrint("Failed Tank Mode - This code shouldn't have ran");
				GTFO.CanTank = nil;
			end
		end
	end
	GTFO_DebugPrint("Tank mode off");
	return nil;
end

function GTFO_CanTankCheck()
	local x, class = UnitClass("player");
	if (class == "PALADIN" or class == "DRUID" or class == "DEATHKNIGHT" or class == "WARRIOR") then
		GTFO_DebugPrint("Possible tank detected");
		GTFO.CanTank = true;
		if (class == "PALADIN") then
			GTFOFrame:RegisterEvent("UNIT_INVENTORY_CHANGED");
		else
			GTFOFrame:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
		end
	else
		GTFO_DebugPrint("This class isn't a tank");
		GTFO.CanTank = nil;
	end
end

-- Cache sound file locations
function GTFO_GetSounds()
	if (GTFO.Settings.Volume == 2) then
		GTFO.Sounds = {
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzzer_soft.mp3",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbeep_soft.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmdouble_soft.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzz_soft.ogg",
		};
	elseif (GTFO.Settings.Volume == 1) then
		GTFO.Sounds = {
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzzer_quiet.mp3",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbeep_quiet.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmdouble_quiet.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzz_quiet.ogg",
		};
	else
		GTFO.Sounds = {
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzzer.mp3",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbeep.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmdouble.ogg",
			"Interface\\AddOns\\GTFO\\Sounds\\alarmbuzz.ogg",
		};
	end
end

-- Save settings to persistant storage, refresh UI options
function GTFO_SaveSettings()
	GTFO_DebugPrint("Saving settings");
	GTFO_Option_SetVolume();

	GTFOData.DataCode = GTFO.DataCode;
	GTFOData.Active = GTFO.Settings.Active;
	GTFOData.Sounds = { };
	GTFOData.Sounds[1] = GTFO.Settings.Sounds[1];
	GTFOData.Sounds[2] = GTFO.Settings.Sounds[2];
	GTFOData.Sounds[3] = GTFO.Settings.Sounds[3];
	GTFOData.Sounds[4] = GTFO.Settings.Sounds[4];
	GTFOData.Volume = GTFO.Settings.Volume;
	GTFOData.ScanMode = GTFO.Settings.ScanMode;
	GTFOData.DebugMode = GTFO.Settings.DebugMode;
	GTFOData.TestMode = GTFO.Settings.TestMode;
	GTFOData.UnmuteMode = GTFO.Settings.UnmuteMode;
	GTFOData.TrivialMode = GTFO.Settings.TrivialMode;

	if (GTFO.UIRendered) then
		getglobal("GTFO_EnabledButton"):SetChecked(GTFO.Settings.Active);
		getglobal("GTFO_HighSoundButton"):SetChecked(GTFO.Settings.Sounds[1]);
		getglobal("GTFO_LowSoundButton"):SetChecked(GTFO.Settings.Sounds[2]);
		getglobal("GTFO_FailSoundButton"):SetChecked(GTFO.Settings.Sounds[3]);
		getglobal("GTFO_FriendlyFireSoundButton"):SetChecked(GTFO.Settings.Sounds[4]);
		getglobal("GTFO_TestModeButton"):SetChecked(GTFO.Settings.TestMode);
		getglobal("GTFO_UnmuteButton"):SetChecked(GTFO.Settings.UnmuteMode);
		getglobal("GTFO_TrivialButton"):SetChecked(GTFO.Settings.TrivialMode);
	end

	GTFO_ActivateMod();
end

-- Reset all settings to default
function GTFO_SetDefaults()
	GTFO.Settings.Active = GTFO.DefaultSettings.Active;
	GTFO.Settings.Sounds = { };
	GTFO.Settings.Sounds[1] = GTFO.DefaultSettings.Sounds[1];
	GTFO.Settings.Sounds[2] = GTFO.DefaultSettings.Sounds[2];
	GTFO.Settings.Sounds[3] = GTFO.DefaultSettings.Sounds[3];
	GTFO.Settings.Sounds[4] = GTFO.DefaultSettings.Sounds[4];
	GTFO.Settings.Volume = GTFO.DefaultSettings.Volume;
	GTFO.Settings.ScanMode = GTFO.DefaultSettings.ScanMode;
	GTFO.Settings.DebugMode = GTFO.DefaultSettings.DebugMode;
	GTFO.Settings.TestMode = GTFO.DefaultSettings.TestMode;
	GTFO.Settings.UnmuteMode = GTFO.DefaultSettings.UnmuteMode;
	GTFO.Settings.TrivialMode = GTFO.DefaultSettings.TrivialMode;
	if (GTFO.UIRendered) then
		getglobal("GTFO_VolumeSlider"):SetValue(GTFO.DefaultSettings.Volume);
	end
	GTFO_SaveSettings();
end

-- Show pop-up alert
function GTFO_DisplayConfigPopupMessage()
	StaticPopup_Show("GTFO_POPUP_MESSAGE");
end
