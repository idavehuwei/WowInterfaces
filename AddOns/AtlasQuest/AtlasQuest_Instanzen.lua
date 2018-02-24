--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


-----------------------------------------------------------------------------
-- This functions returns AQINSTANZ with a number
-- that tells which instance is shown atm for Atlas or AlphaMap
-----------------------------------------------------------------------------
function AtlasQuest_Instanzenchecken()
	AQATLASMAP = AtlasMap:GetTexture()


	-- Original Instances

	if (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadmines") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheDeadminesEnt") then
		AQINSTANZ = 1;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCaverns") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\WailingCavernsEnt") then
		AQINSTANZ = 2;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RagefireChasm") then
		AQINSTANZ = 3;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Uldaman") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UldamanEnt") then
		AQINSTANZ = 4;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockDepths") then
		AQINSTANZ = 5;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackwingLair") then
		AQINSTANZ = 6;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeeps") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackfathomDeepsEnt") then
		AQINSTANZ = 7;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireLower") then
		AQINSTANZ = 8;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackrockSpireUpper") then
		AQINSTANZ = 9;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulEast") then
		AQINSTANZ = 10;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulNorth") then
		AQINSTANZ = 11;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DireMaulWest") then
		AQINSTANZ = 12;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Maraudon") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MaraudonEnt") then
		AQINSTANZ = 13;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MoltenCore") then
		AQINSTANZ = 14;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\OnyxiasLair") then
		AQINSTANZ = 16;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenDowns") then
		AQINSTANZ = 17;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RazorfenKraul") then
		AQINSTANZ = 18;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMLibrary") then
		AQINSTANZ = 19;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Scholomance") then
		AQINSTANZ = 20;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ShadowfangKeep") then
		AQINSTANZ = 21;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Stratholme") then
		AQINSTANZ = 22;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheRuinsofAhnQiraj") then
		AQINSTANZ = 23;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheStockade") then
		AQINSTANZ = 24;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTemple") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheSunkenTempleEnt") then
		AQINSTANZ = 25;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheTempleofAhnQiraj") then
		AQINSTANZ = 26;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulFarrak") then
		AQINSTANZ = 27;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulGurub") then
		AQINSTANZ = 28;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Gnomeregan") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\GnomereganEnt") then
		AQINSTANZ = 29;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMArmory") then
		AQINSTANZ = 57;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMCathedral") then
		AQINSTANZ = 58;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SMGraveyard") then
		AQINSTANZ = 59;


	-- Burning Crusade Instances

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\HCHellfireRamparts") then
		AQINSTANZ = 37;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\HCBloodFurnace") then
		AQINSTANZ = 38;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\HCTheShatteredHalls") then
		AQINSTANZ = 39;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\HCMagtheridonsLair") then
		AQINSTANZ = 40;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CFRTheSlavePens") then
		AQINSTANZ = 41;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CFRTheSteamvault") then
		AQINSTANZ = 42;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CFRTheUnderbog") then
		AQINSTANZ = 43;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AuchAuchenaiCrypts") then
		AQINSTANZ = 44;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AuchManaTombs") then
		AQINSTANZ = 45;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AuchSethekkHalls") then
		AQINSTANZ = 46;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AuchShadowLabyrinth") then
		AQINSTANZ = 47;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CFRSerpentshrineCavern") then
		AQINSTANZ = 48;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CoTBlackMorass") then
		AQINSTANZ = 49;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CoTHyjal") then
		AQINSTANZ = 50;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CoTOldHillsbrad") then
		AQINSTANZ = 51;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\GruulsLair") then
		AQINSTANZ = 52;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\KarazhanStart") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\KarazhanEnd") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\KarazhanEnt") then
		AQINSTANZ = 53;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TempestKeepArcatraz") then
		AQINSTANZ = 54;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TempestKeepBotanica") then
		AQINSTANZ = 55;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TempestKeepMechanar") then
		AQINSTANZ = 56;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TempestKeepTheEye") then
		AQINSTANZ = 61;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackTempleStart") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackTempleBasement") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\BlackTempleTop") then
		AQINSTANZ = 62;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ZulAman") then
		AQINSTANZ = 63;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\MagistersTerrace") then
		AQINSTANZ = 67;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\SunwellPlateau") then
		AQINSTANZ = 68;


	-- Wrath of the Lich King Instances

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\CoTOldStratholme") then
		AQINSTANZ = 69;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UtgardeKeep") then
		AQINSTANZ = 70;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UtgardePinnacle") then
		AQINSTANZ = 71;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheNexus") then
		AQINSTANZ = 72;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheOculus") then
		AQINSTANZ = 73;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheEyeOfEternity") then
		AQINSTANZ = 74;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AzjolNerub") then
		AQINSTANZ = 75;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\AhnKahet") then
		AQINSTANZ = 76;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarHallsofStone") then
		AQINSTANZ = 77;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarHallsofLightning") then
		AQINSTANZ = 78;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\ObsidianSanctum") then
		AQINSTANZ = 79;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\DrakTharonKeep") then
		AQINSTANZ = 80;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Gundrak") then
		AQINSTANZ = 81;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\VioletHold") then
		AQINSTANZ = 82;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\Naxxramas") then
		AQINSTANZ = 84;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\VaultOfArchavon") then
		AQINSTANZ = 85;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarA") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarB") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarC") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarD") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\UlduarE") then
		AQINSTANZ = 86;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TrialOfTheChampion") then
		AQINSTANZ = 87;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TrialOfTheCrusader") then
		AQINSTANZ = 88;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\FHTheForgeOfSouls") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\TheForgeOfSouls") then
		AQINSTANZ = 90;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\FHPitOfSaron") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\PitOfSaron") then
		AQINSTANZ = 91;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\FHHallsOfReflection") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\HallsOfReflection") then
		AQINSTANZ = 92;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\IcecrownCitadelA") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\IcecrownCitadelB") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\IcecrownCitadelC") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\IcecrownStart") or (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\IcecrownEnd") then
		AQINSTANZ = 93;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas\\Images\\Maps\\RubySanctum") then
		AQINSTANZ = 94;



	-- Battlegrounds

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\AlteracValleyNorth") then
		AQINSTANZ = 33;

	elseif (AQATLASMAP ==  "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\AlteracValleySouth") then
		AQINSTANZ = 33;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\ArathiBasin") then
		AQINSTANZ = 34;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\WarsongGulch") then
		AQINSTANZ = 35;

	elseif (AQATLASMAP ==  "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\EyeOfTheStorm") then
		AQINSTANZ = 60;

	elseif (AQATLASMAP ==  "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\StrandOfTheAncients") then
		AQINSTANZ = 83;

	elseif (AQATLASMAP ==  "Interface\\AddOns\\Atlas_Battlegrounds\\Images\\IsleOfConquest") then
		AQINSTANZ = 89;


	-- Outdoor Raids

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_OutdoorRaids\\Images\\FourDragons")  then
		AQINSTANZ = 30;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_OutdoorRaids\\Images\\Azuregos")  then
		AQINSTANZ = 31;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_OutdoorRaids\\Images\\DoomLordKazzak")  then
		AQINSTANZ = 64;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_OutdoorRaids\\Images\\Doomwalker")  then
		AQINSTANZ = 65;

	elseif (AQATLASMAP == "Interface\\AddOns\\Atlas_OutdoorRaids\\Images\\Skettis")  then
		AQINSTANZ = 66;


	-- Default

	else 
		AQINSTANZ = 36;
	end
end


-----------------------------------------------------------------------------
-- Alpha Map Support 
-----------------------------------------------------------------------------

function AtlasQuest_InstanzencheckAM()
	AQALPHAMAP = AlphaMapAlphaMapTexture:GetTexture();


	-- Original Instances

	if (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheDeadmines") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\TheDeadminesExt") then
		AQINSTANZ = 1;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\WailingCaverns") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\WailingCavernsExt") then
		AQINSTANZ = 2;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RagefireChasm") then
		AQINSTANZ = 3;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uldaman") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\UldamanExt") then
		AQINSTANZ = 4;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackrockDepths") then
		AQINSTANZ = 5;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackwingLair") then
		AQINSTANZ = 6;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackfathomDeeps") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\BlackfathomDeepsExt") then
		AQINSTANZ = 7;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\LBRS") then
		AQINSTANZ = 8;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UBRS") then
		AQINSTANZ = 9;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMEast") then
		AQINSTANZ = 10;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMNorth") then
		AQINSTANZ = 11;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DMWest") then
		AQINSTANZ = 12;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Maraudon") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\MaraudonExt") then
		AQINSTANZ = 13;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MoltenCore") then
		AQINSTANZ = 14;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Naxxramas") then
		AQINSTANZ = 15;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\OnyxiasLair") then
		AQINSTANZ = 16;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenDowns") then
		AQINSTANZ = 17;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RazorfenKraul") then
		AQINSTANZ = 18;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ScarletMonastery") then
		AQINSTANZ = 19;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Scholomance") then
		AQINSTANZ = 20;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ShadowfangKeep") then
		AQINSTANZ = 21;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Stratholme") then
		AQINSTANZ = 22;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RuinsofAhnQiraj") then
		AQINSTANZ = 23;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheStockade") then
		AQINSTANZ = 24;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheSunkenTemple") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\SunkenTempleExt") then
		AQINSTANZ = 25;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TempleofAhnQiraj") then
		AQINSTANZ = 26;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulFarrak") then
		AQINSTANZ = 27;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulGurub") then
		AQINSTANZ = 28;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Gnomeregan") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\GnomereganExt") then
		AQINSTANZ = 29;


	-- Burning Crusade Instances

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\HCRampart") then
		AQINSTANZ = 37;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\HCBloodFurnace") then
		AQINSTANZ = 38;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\HCShatteredHalls") then
		AQINSTANZ = 39;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MagtheridonsLair") then
		AQINSTANZ = 40;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheSlavePens") then
		AQINSTANZ = 41;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheSteamvault") then
		AQINSTANZ = 42;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheUnderbog") then
		AQINSTANZ = 43;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\AuchenaiCrypts") then
		AQINSTANZ = 44;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ManaTombs") then
		AQINSTANZ = 45;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\SethekkHalls") then
		AQINSTANZ = 46;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ShadowLabyrinth") then
		AQINSTANZ = 47;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Serpentshrine") then
		AQINSTANZ = 48;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackMorass") then
		AQINSTANZ = 49;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MountHyjal") then
		AQINSTANZ = 50;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\OldHilsbrad") then
		AQINSTANZ = 51;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\GruulsLair") then
		AQINSTANZ = 52;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Karazahn") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Exteriors\\Maps\\KarazhanExt") then
		AQINSTANZ = 53;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Arcatraz") then
		AQINSTANZ = 54;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Botanica") then
		AQINSTANZ = 55;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Mechanar") then
		AQINSTANZ = 56;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheEye") then
		AQINSTANZ = 61;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\BlackTemple") then
		AQINSTANZ = 62;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ZulAman") then
		AQINSTANZ = 63;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\MagistersTerrace") then
		AQINSTANZ = 67;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\SunwellPlateau") then
		AQINSTANZ = 68;


	-- Wrath of the Lich King Instances

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\OldStrat") then
		AQINSTANZ = 69;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UtgardeKeep") then
		AQINSTANZ = 70;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UtgardeKeep1") then
		AQINSTANZ = 70;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\UtgardePinnacle") then
		AQINSTANZ = 71;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Nexus") then
		AQINSTANZ = 72;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Oculus") then
		AQINSTANZ = 73;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TheEyeOfEternity") then
		AQINSTANZ = 74;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\AzjolNerub") then
		AQINSTANZ = 75;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\AzjolNerubLower") then
		AQINSTANZ = 75;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\AhnkahetTOK") then
		AQINSTANZ = 76;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\StoneHalls") then
		AQINSTANZ = 77;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\HoL") then
		AQINSTANZ = 78;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\CoAB") then
		AQINSTANZ = 79;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DrakTharonLower") then
		AQINSTANZ = 80;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\DrakTharonUpper") then
		AQINSTANZ = 80;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\GunDrak") then
		AQINSTANZ = 81;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\VH") then
		AQINSTANZ = 82;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Naxxramas") then
		AQINSTANZ = 84;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Archavon") then
		AQINSTANZ = 85;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uld1Siege") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uld2Ante") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uld3Keepers") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uld4Spark") or (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\Uld5Descent") then
		AQINSTANZ = 86;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TrialOfTheChampion") then
		AQINSTANZ = 87;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\TrialOfTheCrusader") then
		AQINSTANZ = 88;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\ForgeOfSouls") then
		AQINSTANZ = 90;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\PitOfSaron") then
		AQINSTANZ = 91;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\HallsOfReflection") then
		AQINSTANZ = 92;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\IcecrownCitadel") then
		AQINSTANZ = 93;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Instances\\Maps\\RubySanctum") then
		AQINSTANZ = 94;


	-- Battlegrounds

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\AlteracValley") then
		AQINSTANZ = 33;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\ArathiBasin") then
		AQINSTANZ = 34;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\WarsongGulch") then
		AQINSTANZ = 35;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\NetherstormBG") then
		AQINSTANZ = 60;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\SotA") then
		AQINSTANZ = 83;

	elseif (AQALPHAMAP == "Interface\\AddOns\\AlphaMap_Battlegrounds\\Maps\\IsleOfConquest") then
		AQINSTANZ = 89;


	-- Default

	else
		AQINSTANZ = 36;
	end

-----------------------------------------------------------------------------
-- function to work with outdoor boss @ alphamap
-----------------------------------------------------------------------------

	if (AlphaMapAlphaMapFrame:IsVisible()) then
		if (GamAlphaMapMap ~= nil) then -- check to prevent errors (post  ui.worldofwar dunno why error ocour)
			if (GamAlphaMapMap.type == AM_TYP_WORLDBOSSES) then
				if (GamAlphaMapMap.filename == "AM_DoomKazzak_Map") then
					AQINSTANZ = 64;
				elseif (GamAlphaMapMap.filename == "AM_Doomwalker_Map") then
					AQINSTANZ = 65;
				elseif (GamAlphaMapMap.filename == "AM_Kazzak_Map") then
					AQINSTANZ = 32;
				elseif (GamAlphaMapMap.filename == "AM_Azuregos_Map") then
					AQINSTANZ = 31;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Duskwood_Map") then
					AQINSTANZ = 30;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Hinterlands_Map") then
					AQINSTANZ = 30;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Feralas_Map") then
					AQINSTANZ = 30;
				elseif (GamAlphaMapMap.filename == "AM_Dragon_Ashenvale_Map") then
					AQINSTANZ = 30;
				else
					AQINSTANZ = 36;
				end
			end
		end
	end

end


---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Old Naxxramas (removed)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = Scholomance (Scholo)
-- 21 = Shadowfang Keep (SFK)
-- 22 = Stratholme (Strat)
-- 23 = The Ruins of Ahn'Qiraj (AQ20)
-- 24 = The Stockade (Stocks)
-- 25 = Sunken Temple (ST)
-- 26 = The Temple of Ahn'Qiraj (AQ40)
-- 27 = Zul'Farrak (ZF)
-- 28 = Zul'Gurub (ZG)
-- 29 = Gnomeregan (Gnomer)
-- 30 = Four Dragons
-- 31 = Azuregos
-- 32 = Highlord Kruul (removed)
-- 33 = Alterac Valley (AV)
-- 34 = Arathi Basin (AB)
-- 35 = Warsong Gulch (WSG)
-- 36 =  default "rest"
-- 37 = HFC: Ramparts (Ramp)
-- 38 = HFC: Blood Furnace (BF)
-- 39 = HFC: Shattered Halls (SH)
-- 40 = HFC: Magtheridon's Lair
-- 41 = CR: The Slave Pens (SP)
-- 42 = CR: The Steamvault (SV)
-- 43 = CR: The Underbog (UB)
-- 44 = Auchindoun: Auchenai Crypts (AC)
-- 45 = Auchindoun: Mana Tombs (MT)
-- 46 = Auchindoun: Sethekk Halls (Seth)
-- 47 = Auchindoun: Shadow Labyrinth (SLabs)
-- 48 = CR: Serpentshrine Cavern (SSC)
-- 49 = CoT: Black Morass (BM)
-- 50 = CoT: Battle of Mount Hyjal
-- 51 = CoT: Old Hillsbrad
-- 52 = Gruul's Lair (GL)
-- 53 = Karazhan (Kara)
-- 54 = TK: Arcatraz (Arc)
-- 55 = TK: Botanica (Bot)
-- 56 = TK: Mechanar (Mech)
-- 57 = SM: Armory (SM Arm)
-- 58 = SM: Cathedral (SM Cath)
-- 59 = SM: Graveyard (SM GY)
-- 60 = Eye of the Storm
-- 61 = TK: The Eye
-- 62 = Black Temple (BT)
-- 63 = Zul'Aman (ZA)
-- 64 = Doom Lord Kazzak
-- 65 = Doomwalker
-- 66 = Skettis
-- 67 = Magisters' Terrace
-- 68 = Sunwell Plateau
-- 69 = Caverns of Time: Stratholme Past
-- 70 = Utgarde Keep: Utgarde Keep
-- 71 = Utgarde Keep: Utgarde Pinnacle
-- 72 = The Nexus: The Nexus
-- 73 = The Nexus: The Oculus
-- 74 = The Nexus: The Eye of Eternity
-- 75 = Azjol-Nerub: The Upper Kingdom
-- 76 = Azjol-Nerub: Ahn'kahet: The Old Kingdom
-- 77 = Ulduar: Halls of Stone
-- 78 = Ulduar: Halls of Lightning
-- 79 = The Obsidian Sanctum
-- 80 = Drak'Tharon Keep
-- 81 = Zul'Drak: Gundrak
-- 82 = The Violet Hold
-- 83 = Strand of the Ancients (SotA)
-- 84 = Naxxramas (Naxx)
-- 85 = Vault of Archavon (VoA)
-- 86 = Ulduar
-- 87 = Trial of the Champion (ToC)
-- 88 = Trial of the Crusader (ToC)
-- 89 = Isle of Conquest (IoC)
-- 90 = Forge of Souls (FoS)
-- 91 = Pit of Saron (PoS)
-- 92 = Halls of Reflection (HoR)
-- 93 = Icecrown Citadel (ICC)
-- 94 = Ruby Sanctum (RS)


