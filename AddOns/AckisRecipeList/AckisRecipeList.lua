--[[

************************************************************************

AckisRecipeList.lua

File date: 2009-07-30T09:45:03Z
File revision: 2264
Project revision: 2271
Project version: r2271

Author: Ackis, Zhinjio, Jim-Bim, Torhal, Pompy

************************************************************************

Please see http://www.wowace.com/projects/arl/for more information.

License:
	Please see LICENSE.txt

This source code is released under All Rights Reserved.

************************************************************************

--]]

--- **AckisRecipeList** provides an interface for scanning professions for missing recipes.
-- There are a set of functions which allow you make use of the ARL database outside of ARL.\\
-- ARL supports all professions currently in World of Warcraft 3.1.
-- @class file
-- @name AckisRecipeList.lua
-- @release 1.0 RC9

local LibStub = LibStub

local MODNAME	= "Ackis Recipe List"

AckisRecipeList = LibStub("AceAddon-3.0"):NewAddon(MODNAME, "AceConsole-3.0", "AceEvent-3.0")

--@alpha@
ARL = AckisRecipeList
--@end-alpha@

local addon = LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L	= LibStub("AceLocale-3.0"):GetLocale(MODNAME)

-------------------------------------------------------------------------------
-- Check to see if we have mandatory libraries loaded. If not, notify the user
-- which are missing and return.
-------------------------------------------------------------------------------
local MissingLibraries
do
	local REQUIRED_LIBS = {
		"AceLocale-3.0",
		"LibBabble-Boss-3.0",
		"LibBabble-Class-3.0",
		"LibBabble-Faction-3.0",
		"LibBabble-Zone-3.0",
	}
	function MissingLibraries()
		local missing = false

		for idx, lib in ipairs(REQUIRED_LIBS) do
			if not LibStub:GetLibrary(lib, true) then
				missing = true
				addon:Print(format(L["MISSING_LIBRARY"], lib))
			end
		end
		return missing
	end
end -- do

if MissingLibraries() then
	--[===[@debug@
	addon:Print("You are using an SVN version of ARL.  As per WowAce/Curseforge standards, SVN externals are not set up.  You will have to install Ace3, Babble-Faction-3.0, Babble-Zone-3.0, Babble-Boss-3.0, LibBabble-Class-3.0, LibAboutPanel, LibSharedMedia-3.0, LibBetterBlizzoptions and Astrolabe in order for the addon to function correctly.")
	--@end-debug@]===]
	AckisRecipeList = nil
	return
end

local BFAC = LibStub("LibBabble-Faction-3.0"):GetLookupTable()

-- Global Frame Variables
addon.optionsFrame = {}
addon.ScanButton = nil
addon.Frame = nil
addon.ARLCopyFrame = nil
_G["arlTooltip"] = nil
_G["arlSpellTooltip"] = nil

-- Make global API calls local to speed things up
local GetNumTradeSkills = GetNumTradeSkills
local GetSpellInfo = GetSpellInfo
local GetTradeSkillLine = GetTradeSkillLine

local tostring = tostring
local tonumber = tonumber

local pairs = pairs
local select = select

local table = table
local twipe = table.wipe
local tremove = table.remove
local tconcat = table.concat
local tinsert = table.insert

local string = string
local format = string.format
local sfind = string.find
local smatch = string.match
local strlower = string.lower

-------------------------------------------------------------------------------
-- Initialization functions
-------------------------------------------------------------------------------

---Function run when the addon is initialized.  Registers the slash commands, options, and database
function addon:OnInitialize()

	-- Set default options, which are to include everything in the scan
	local defaults = {
		global = {
			-- Saving alts tradeskills (needs to be global so all profiles can access it)
			tradeskill = {},
		},
		profile = {
			-- Frame options
			frameopts = {
				offsetx = 0,
				offsety = 0,
				anchorTo = "",
				anchorFrom = "",
				uiscale = 1,
				tooltipscale = .9,
				fontsize = 11,
			},

			-- Sorting Options
			sorting = "SkillAsc",

			-- Display Options
			includefiltered = false,
			includeexcluded = false,
			closeguionskillclose = false,
			ignoreexclusionlist = false,
			scanbuttonlocation = "TR",
			spelltooltiplocation = "Right",
			acquiretooltiplocation = "Mouse",
			hidepopup = false,
			minimap = true,
			worldmap = true,
			autoscanmap = false,
			scantrainers = false,
			scanvendors = false,
			autoloaddb = false,

			-- Recipe Exclusion
			exclusionlist = {},

			-- Filter Options
			filters = {
				-- General Filters
				general = {
					faction = true,
					specialty = false,
					skill = true,
					known = false,
					unknown = true,
				},
				-- Obtain Options
				obtain = {
					trainer = true,
					vendor = true,
					instance = true,
					raid = true,
					seasonal = true,
					quest = true,
					pvp = true,
					discovery = true,
					worlddrop = true,
					mobdrop = true,
					originalwow = true,
					bc = true,
					wrath = true,
				},
				-- Item Filters (Armor/Weapon)
				item = {
					armor = {
						cloth = true,
						leather = true,
						mail = true,
						plate = true,
						trinket = true,
						cloak = true,
						ring = true,
						necklace = true,
						shield = true,
					},
					weapon = {
						onehand = true,
						twohand = true,
						axe = true,
						sword = true,
						mace = true,
						polearm = true,
						dagger = true,
						fist = true,
						staff = true,
						wand = true,
						thrown = true,
						bow = true,
						crossbow = true,
						ammo = true,
						gun = true,
					},
				},
				binding = {
					itemboe = true,
					itembop = true,
					recipebop = true,
					recipeboe = true,
				},
				player = {
					melee = true,
					tank = true,
					healer = true,
					caster = true,
				},
				-- Reputation Options
				rep = {
					aldor = true,
					scryer = true,
					argentdawn = true,
					ashtonguedeathsworn = true,
					cenarioncircle = true,
					cenarionexpedition = true,
					consortium = true,
					hellfire = true,
					keepersoftime = true,
					nagrand = true,
					lowercity = true,
					scaleofthesands = true,
					shatar = true,
					shatteredsun = true,
					sporeggar = true,
					thoriumbrotherhood = true,
					timbermaw = true,
					violeteye = true,
					zandalar = true,
					argentcrusade = true,
					frenzyheart = true,
					ebonblade = true,
					kirintor = true,
					sonsofhodir = true,
					kaluak = true,
					oracles = true,
					wyrmrest = true,
					wrathcommon1 = true,
					wrathcommon2 = true,
					wrathcommon3 = true,
					wrathcommon4 = true,
					wrathcommon5 = true,
				},
				-- Classes
				classes = {
					deathknight = true,
					druid = true,
					hunter = true,
					mage = true,
					paladin = true,
					priest = true,
					rogue = true,
					shaman = true,
					warlock = true,
					warrior = true,
				},
			}
		}
	}

	addon.db = LibStub("AceDB-3.0"):New("ARLDB2",defaults)

	if (not addon.db) then
		self:Print("Error: Database not loaded correctly.  Please exit out of WoW and delete the ARL database file (AckisRecipeList.lua) found in: \\World of Warcraft\\WTF\\Account\\<Account Name>>\\SavedVariables\\")
		return
	end

	self:SetupOptions()

	-- Register slash commands
	self:RegisterChatCommand("arl", "ChatCommand")
	self:RegisterChatCommand("ackisrecipelist", "ChatCommand")

end

---Function run when the addon is enabled.  Registers events and pre-loads certain variables.
function addon:OnEnable()

	self:RegisterEvent("TRADE_SKILL_SHOW")	-- Make addon respond to the tradeskill windows being shown
	self:RegisterEvent("TRADE_SKILL_CLOSE")	-- Addon responds to tradeskill windows being closed.

	if (addon.db.profile.scantrainers) then
		self:RegisterEvent("TRAINER_SHOW")
	end

	if (addon.db.profile.scanvendors) then
		self:RegisterEvent("MERCHANT_SHOW")
	end

	-- Add an option so that ARL will work with Manufac
	if (Manufac) then
		Manufac.options.args.ARLScan = {
			type = 'execute',
			name = L["Scan"],
			desc = L["SCAN_RECIPES_DESC"],
			func = function() addon:AckisRecipeList_Command(false) end,
			order = 550,
		}
	end

--[[
	-- If we're using Skillet, use Skillet's API to work with getting tradeskills
	if (Skillet) and (Skillet.GetNumTradeSkills) and
	(Skillet.GetTradeSkillLine) and (Skillet.GetTradeSkillInfo) and
	(Skillet.GetTradeSkillRecipeLink) and (Skillet.ExpandTradeSkillSubClass) then
		self:Print("Enabling Skillet advanced features.")
		GetNumTradeSkills = function(...) return Skillet:GetNumTradeSkills(...) end
		GetTradeSkillLine = function(...) return Skillet:GetTradeSkillLine(...) end
		GetTradeSkillInfo = function(...) return Skillet:GetTradeSkillInfo(...) end
		GetTradeSkillRecipeLink = function(...) return Skillet:GetTradeSkillRecipeLink(...) end
		ExpandTradeSkillSubClass = function(...) return Skillet:ExpandTradeSkillSubClass(...) end
	end
]]--
	-- Populate the reputation level
	self:GetFactionLevels()

	--Create the button now for later use
	self:CreateScanButton()

end

---Run when the addon is disabled. Ace3 takes care of unregistering events, etc.
function addon:OnDisable()

	-- If we disable the addon when the GUI is up, hide it.
	if (addon.Frame) then
		addon.Frame:Hide()
	end

	-- Remove the option from Manufac
	if Manufac then
		Manufac.options.args.ARLScan = nil
	end

end

-------------------------------------------------------------------------------
-- Event handling functions
-------------------------------------------------------------------------------

---Event used for datamining when a trainer is shown.
function addon:TRAINER_SHOW()

	self:ScanSkillLevelData(true)
	self:ScanTrainerData(true)

end

function addon:MERCHANT_SHOW()

	addon:ScanVendor()

end

do

	local GetTradeSkillListLink = GetTradeSkillListLink
	local UnitName = UnitName
	local GetRealmName = GetRealmName
	local IsTradeSkillLinked = IsTradeSkillLinked

	function addon:TRADE_SKILL_SHOW()
		local ownskill = IsTradeSkillLinked()

		-- If this is our own skill, save it, if not don't save it
		if (not ownskill) then
			-- Create an entry in the db to track alt trade skills
			local pname = UnitName("player")
			local prealm = GetRealmName()
			local tradelink = GetTradeSkillListLink()
			local tradename = GetTradeSkillLine()

			if (tradelink) then
				-- Actual alt information saved here. -Torhal
				if (not addon.db.global.tradeskill) then
					addon.db.global.tradeskill = {}
				end
				if (not addon.db.global.tradeskill[prealm]) then
					addon.db.global.tradeskill[prealm] = {}
				end
				if (not addon.db.global.tradeskill[prealm][pname]) then
					addon.db.global.tradeskill[prealm][pname] = {}
				end
				addon.db.global.tradeskill[prealm][pname][tradename] = tradelink
			end
		end
		addon:OpenTradeWindow()

		if (addon.ScanButton and not Skillet) then
			self:ShowScanButton()
		end

	end

end

function addon:TRADE_SKILL_CLOSE()

	addon:CloseTradeWindow()

	if (addon.db.profile.closeguionskillclose and addon.Frame) then
		self:CloseWindow()
	end

	if (addon.ScanButton and not Skillet) then
		addon.ScanButton:Hide()
	end

end

-------------------------------------------------------------------------------
-- Player Data Acquisition Functions
-------------------------------------------------------------------------------

do

	local GetNumFactions = GetNumFactions
	local GetFactionInfo = GetFactionInfo
	local CollapseFactionHeader = CollapseFactionHeader
	local ExpandFactionHeader = ExpandFactionHeader
	local rep_list = {}

	---Scans all reputations to get reputation levels to determine if the player can learn a reputation recipe
	function addon:GetFactionLevels(RepTable)

		-- Bug here when I reload UI
		if (not RepTable) then
			return
		end
		twipe(rep_list)

		-- Number of factions before we expand
		local numfactions = GetNumFactions()

		-- Lets expand all the headers
		for i = numfactions, 1, -1 do
			local name, _, _, _, _, _, _, _, _, isCollapsed = GetFactionInfo(i)

			if (isCollapsed) then
				ExpandFactionHeader(i)
				rep_list[name] = true
			end
		end

		-- Number of factions with everything expanded
		numfactions = GetNumFactions()

		-- Get the rep levels
		for i = 1, numfactions, 1 do
			local name, _, replevel = GetFactionInfo(i)

			-- If the rep is greater than neutral
			if (replevel > 4) then
				-- We use levels of 0, 1, 2, 3, 4 internally for reputation levels, make it correspond here
				RepTable[name] = replevel - 4
			end
		end

		-- Collapse the headers again
		for i = numfactions, 1, -1 do
			local name = GetFactionInfo(i)

			if (rep_list[name]) then
				CollapseFactionHeader(i)
			end
		end

	end

end	-- do block

-------------------------------------------------------------------------------
-- Tradeskill functions
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Recipe DB Structures are defined in Documentation.lua
-------------------------------------------------------------------------------

--- Adds a tradeskill recipe into the specified recipe database.
-- @name AckisRecipeList:addTradeSkill
-- @usage AckisRecipeList:addTradeSkill(RecipeDB,2329,1,2454,1,2259,0,1,55,75,95)
-- @param RecipeDB The database (array) which you wish to add data too.
-- @param SpellID The [[http://www.wowwiki.com/SpellLink | Spell ID]] of the recipe being added to the database.
-- @param SkillLevel The skill level at which the recipe may be learned.
-- @param ItemID The [[http://www.wowwiki.com/ItemLink | Item ID]] that is created by the recipe, or nil
-- @param Rarity The rarity of the recipe.
-- @param Profession The profession ID that uses the recipe.  See [[database-documentation]] for a listing of profession IDs.
-- @param Specialty The specialty that uses the recipe (ie: goblin engineering) or nil or blank
-- @param Game Game version recipe was found in, for example, Original, BC, or Wrath.
-- @param Orange Level at which recipe is considered orange.
-- @param Yellow Level at which recipe is considered yellow.
-- @param Green Level at which recipe is considered green.
-- @param Grey Level at which recipe is considered grey.
-- @return None, array is passed as a reference.
function addon:addTradeSkill(RecipeDB, SpellID, SkillLevel, ItemID, Rarity, Profession, Specialty, Game, Orange, Yellow, Green, Grey)

	local spellLink = GetSpellLink(SpellID)	-- Get the recipe link from the spell ID
	local profession_id = GetSpellInfo(Profession)
	local recipe_name = GetSpellInfo(SpellID)

	--@alpha@
	if RecipeDB[SpellID] then
		self:Print("Duplicate recipe: "..profession_id.." "..tostring(SpellID).." "..recipe_name)
		return
	end
	--@end-alpha@

	-------------------------------------------------------------------------------
	-- Create a table inside the RecipeListing table which stores all information
	-- about a recipe
	-------------------------------------------------------------------------------

	RecipeDB[SpellID] = {
		["Level"] = SkillLevel,
		["ItemID"] = ItemID,
		["Rarity"] = Rarity,
		["Profession"] = profession_id,
		["Locations"] = nil,
		["RecipeLink"] = spellLink,
		["Name"] = recipe_name,
		["Display"] = true,				-- Set to be displayed until the filtering occurs
		["Search"] = true,				-- Set to be showing in the search results
		["Flags"] = {},					-- Create the flag space in the RecipeDB
		["Acquire"] = {},				-- Create the Acquire space in the RecipeDB
		["Specialty"] = Specialty,			-- Assumption: there will only be 1 speciality for a trade skill
		["Orange"] = Orange or SkillLevel,		-- If we don't have an orange value in the db, just assume the skill level
		["Yellow"] = Yellow or SkillLevel + 10,		-- If we don't have a yellow value in the db, just assume the skill level
		["Green"] = Green or SkillLevel + 15,		-- If we don't have a green value in the db, just assume the skill level
		["Grey"] = Grey or SkillLevel + 20,		-- If we don't have a grey value in the db, just assume the skill level
	}
	local recipeentry = RecipeDB[SpellID]

	if not recipeentry["Name"] then
		self:Print(format(L["SpellIDCache"], SpellID))
	end

	-- Set all the flags to be false, will also set the padding spaces to false as well.
	for i = 1, 127, 1 do
		recipeentry["Flags"][i] = false
	end

	-- Get the expansion that the recipe was added
	if (Game) then
		recipeentry["Game"] = Game
		-- We don't have a game flag set, so we'll just make an assumption based on skill levels
		-- Eventually once all these are added we won't need this code
	elseif (SkillLevel <= 300) then
		recipeentry["Game"] = 0
	elseif (SkillLevel <= 375) then
		recipeentry["Game"] = 1
	elseif (SkillLevel <= 450) then
		recipeentry["Game"] = 2
	end

	--@alpha@
	if (not Game) then
		self:Print("No expansion information: "..profession_id.." "..tostring(SpellID).." "..recipe_name)
	elseif (Game > 2) then
		self:Print("Expansion information too high: "..profession_id.." "..tostring(SpellID).." "..recipe_name)
	end

	if (not Orange) then
		--self:Print("No skill level information: "..profession_id.." "..tostring(SpellID).." "..recipe_name)
	end
	--@end-alpha@

end

--- Adds filtering flags to a specific tradeskill.
-- @name AckisRecipeList:addTradeFlags
-- @usage AckisRecipeList:addTradeFlags(RecipeDB,2329,1,2,3,21,22,23,24,25,26,27,28,29,30,36,41,51,52)
-- @param RecipeDB The database (array) which you wish to add flags too.
-- @param SpellID The [[http://www.wowwiki.com/SpellLink | Spell ID]] of the recipe which flags are being added to.
-- @param ... A listing of filtering flags.  See [[database-documentation]] for a listing of filtering flags.
-- @return None, array is passed as a reference.
function addon:addTradeFlags(RecipeDB, SpellID, ...)

	-- flags are defined in Documentation.lua

	local numvars = select('#',...)
	local flags = RecipeDB[SpellID]["Flags"]

	-- Find out how many flags we're adding
	for i=1,numvars,1 do
		-- Get the value of the current flag
		local flag = select(i, ...)
		flags[flag] = true
	end
	

end

--- Adds acquire methods to a specific tradeskill.
-- @name AckisRecipeList:addTradeAcquire
-- @usage AckisRecipeList:addTradeAcquire:(RecipeDB,2329,8,8)
-- @param RecipeDB The database (array) which you wish to add acquire methods too.
-- @param SpellID The [[http://www.wowwiki.com/SpellLink | Spell ID]] of the recipe which acquire methods are being added to.
-- @param ... A listing of acquire methods.  See [[database-documentation]] for a listing of acquire methods and how they behave.
-- @return None, array is passed as a reference.
do
	--@alpha@
	-- Internal DB to check to see if we're adding duplicate ID's as an acquire method
	local AcquireIDList = {}
	--@end-alpha@

	function addon:addTradeAcquire(RecipeDB, SpellID, ...)

		local numvars = select('#', ...)	-- Find out how many flags we're adding
		local index = 1				-- Index for the number of Acquire entries we have
		local i = 1				-- Index for which variables we're parsing through
		local acquire = RecipeDB[SpellID]["Acquire"]

		--@alpha@
		wipe(AcquireIDList)
		--@end-alpha@

		while (i < numvars) do

			-- Create the space for the current Acquire method
			if not acquire[index] then
				acquire[index] = {}
			end

			-- Get the Type and ID of the values
			local AcquireType, AcquireID = select(i, ...)

			acquire[index]["Type"] = AcquireType
			acquire[index]["ID"] = AcquireID

			--@alpha@
			local AcquireIDNumber = AcquireID
			--@end-alpha@

			i = i + 2

			if (AcquireType == 6) then
				local RepLevel, RepVendor = select(i, ...)

				acquire[index]["RepLevel"] = RepLevel
				acquire[index]["RepVendor"] = RepVendor
				i = i + 2

				--@alpha@
				AcquireIDNumber = RepVendor
				--@end-alpha@

			end

			index = index + 1

			--@alpha@
			-- We haven't seen this Acquire ID before (trainer ID, etc)
			if (not AcquireIDList[AcquireIDNumber]) then
				AcquireIDList[AcquireIDNumber] = true
			else
				self:Print("Duplicate entry: " .. SpellID .. " AcquireID: " .. AcquireIDNumber)
			end
			--@end-alpha@

		end

		-- Populate the location field with all the data
		RecipeDB[SpellID]["Locations"] = self:GetRecipeLocations(SpellID)
	end
end	-- do block

--- Adds an item to a specific database listing (ie: vendor, mob, etc)
-- @name AckisRecipeList:addLookupList
-- @usage AckisRecipeList:addLookupList:(VendorDB,NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)
-- @param DB Database which the entry will be stored.
-- @param ID Unique identified for the entry.
-- @param Name Name of the entry.
-- @param Loc Location of the entry in the world.
-- @param Coordx X coordinate of where the entry is found.
-- @param Coordy Y coordinate of where the entry is found.
-- @param Faction Faction identifier for the entry.
-- @return None, array is passed as a reference.
function addon:addLookupList(DB, ID, Name, Loc, Coordx, Coordy, Faction)

	--[[
		For individual database structures, see Documentation.lua
	]]--

	--@alpha@
	if DB[ID] then
		self:Print("Duplicate lookup: "..tostring(ID).." "..Name)
		return
	end
	--@end-alpha@

	DB[ID] = {
		["Name"] = Name
	}
	if (Loc) then
		DB[ID]["Location"] = Loc
	else
		--@alpha@
		self:Print("Spell ID: " .. ID .. " (" .. DB[ID]["Name"] .. ") has an unknown location.")
		--@end-alpha@
		DB[ID]["Location"] = L["Unknown Zone"]
	end

	if (Coordx) and (Coordy) then
		DB[ID]["Coordx"] = Coordx
		DB[ID]["Coordy"] = Coordy
	end

	if (Faction) then
		if (Faction == 0) then
			DB[ID]["Faction"] = BFAC["Neutral"]
		elseif (Faction == 1) then
			DB[ID]["Faction"] = BFAC["Alliance"]
		elseif (Faction == 2) then
			DB[ID]["Faction"] = BFAC["Horde"]
		end
	end

end

-------------------------------------------------------------------------------
-- Recipe Scanning Functions
-------------------------------------------------------------------------------

---Obtains a spell ID from a spell link.
-- This source code is release under Public Domain
local function GetIDFromLink(SpellLink)

	--return smatch(SpellLink, "|H%w+:(%d+)")
	-- Faster matching per Neffi
	return smatch(SpellLink, "^|c%x%x%x%x%x%x%x%x|H%w+:(%d+)")

end

do

	local GetTradeSkillInfo = GetTradeSkillInfo
	local GetTradeSkillRecipeLink = GetTradeSkillRecipeLink
	local ExpandTradeSkillSubClass = ExpandTradeSkillSubClass

	---Scans the recipe listing and marks known recipes as true in the database
	function addon:ScanForKnownRecipes(RecipeDB, playerData)

		-- Clear the "Have Materials" check box
		if (not Skillet) and TradeSkillFrameAvailableFilterCheckButton:GetChecked() then
			TradeSkillFrameAvailableFilterCheckButton:SetChecked(false)
			TradeSkillOnlyShowMakeable(false)
		end

		-- Clear the inventory slot filter
		UIDropDownMenu_Initialize(TradeSkillInvSlotDropDown, TradeSkillInvSlotDropDown_Initialize)
		UIDropDownMenu_SetSelectedID(TradeSkillInvSlotDropDown, 1)
		SetTradeSkillInvSlotFilter(0, 1, 1)

		-- Clear the sub-classes filters
		UIDropDownMenu_Initialize(TradeSkillSubClassDropDown, TradeSkillSubClassDropDown_Initialize)
		UIDropDownMenu_SetSelectedID(TradeSkillSubClassDropDown, 1)
		SetTradeSkillSubClassFilter(0, 1, 1)

		-- Expand all headers so we can see all the recipes there are
		for i = GetNumTradeSkills(), 1, -1 do
			local _, tradeType = GetTradeSkillInfo(i)
			if tradeType == "header" then
				ExpandTradeSkillSubClass(i)
			end
		end

		local foundRecipes = 0

		-- Scan through all recipes
		for i = 1, GetNumTradeSkills() do
			local tradeName, tradeType = GetTradeSkillInfo(i)

			-- Ignore all trade skill headers
			if (tradeType ~= "header") then
				-- Get the trade skill link for the specified recipe
				local SpellLink = GetTradeSkillRecipeLink(i)

				local SpellString = GetIDFromLink(SpellLink)

				-- Get the SpellID from the spell link or enchant link (to account for Skillet)
				local SpellID = tonumber(SpellString)

				-- Spell ID is in RecipeDB so lets flag it as known
				if (RecipeDB[SpellID]) then
					-- Update array that recipe was found
					RecipeDB[SpellID]["Known"] = true
					foundRecipes = foundRecipes + 1
				-- We didn't find it in our database, lets notify people that we don't have it
				else
					self:Print(self:Red(tradeName .. " " .. SpellString) .. self:White(L["MissingFromDB"]))	
				end
			end

		end

		playerData.foundRecipes = foundRecipes

	end

end

do

	local reptable = nil

	local function CreateRepTable()

		local repdb = addon.db.profile.filters.rep

		reptable = {
			[96] = repdb.argentdawn,
			[97] = repdb.cenarioncircle,
			[98] = repdb.thoriumbrotherhood,
			[99] = repdb.timbermaw,
			[100] = repdb.zandalar,
			[101] = repdb.aldor,
			[102] = repdb.ashtonguedeathsworn,
			[103] = repdb.cenarionexpedition,
			[104] = repdb.hellfire,
			[105] = repdb.consortium,
			[106] = repdb.keepersoftime,
			[107] = repdb.lowercity,
			[108] = repdb.nagrand,
			[109] = repdb.scaleofthesands,
			[110] = repdb.scryer,
			[111] = repdb.shatar,
			[112] = repdb.shatteredsun,
			[113] = repdb.sporeggar,
			[114] = repdb.violeteye,
			[115] = repdb.argentcrusade,
			[116] = repdb.frenzyheart,
			[117] = repdb.ebonblade,
			[118] = repdb.kirintor,
			[119] = repdb.sonsofhodir,
			[120] = repdb.kaluak,
			[121] = repdb.oracles,
			[122] = repdb.wyrmrest,
			[123] = repdb.wrathcommon1,
			[124] = repdb.wrathcommon2,
			[125] = repdb.wrathcommon3,
			[126] = repdb.wrathcommon4,
			[127] = repdb.wrathcommon5,
		}

	end

	function addon:ClearRepTable()

		reptable = nil

	end

	local function CheckReputationDisplay(flags)

		if (not reptable) then
			CreateRepTable()
		end

		local display = true

		for i in pairs(reptable) do
			if (flags[i]) then
				if (reptable[i]) then
					display = true
				else
					display = false
				end
			end
		end

		return display

	end

	---Scans a specific recipe to determine if it is to be displayed or not.
	function addon:CheckDisplayRecipe(Recipe, AllSpecialtiesTable, playerProfessionLevel, playerProfession, playerSpecialty, playerFaction, playerClass)

		-- For flag info see comments at start of file in comments
		local filterdb = addon.db.profile.filters
		local flags = Recipe["Flags"]

		-- See Documentation file for logic explanation
		-- Stage 1
		-- Loop through exclusive flags (hard filters)
		-- If one of these does not pass we do not display the recipe
		-- So to be more efficient we'll just leave this function if there's a false

		local generaldb = filterdb.general
		local obtaindb = filterdb.obtain

		-- Is this recipe in my currently selected profession?
		if (Recipe["Profession"] ~= playerProfession) then
			return false
		end

		-- Display both horde and alliance factions?
		if (generaldb.faction == false) then
			-- We want to filter out all the Horde only recipes
			if (playerFaction == BFAC["Alliance"]) then
				-- Filter out Horde only
				if (flags[1] == false) and (flags[2] == true) then
					return false
				end
			-- We want to filter out all the Alliance only recipes
			else
				-- Filter out Alliance only
				if (flags[2] == false) and (flags[1] == true) then
					return false
				end
			end
		end

		-- Display all skill levels?
		if (generaldb.skill == false) and (Recipe["Level"] > playerProfessionLevel) then
			return false
		end

		-- Display all specialities?
		if (generaldb.specialty == false) then
			if (Recipe["Specialty"]) and (Recipe["Specialty"] ~= playerSpecialty) then
				return false
			end
		end

		-- Filter out "era" recipes

		if ((obtaindb.originalwow == false) and (Recipe["Game"] == 0)) then
			return false
		end
		if ((obtaindb.bc == false) and (Recipe["Game"] == 1)) then
			return false
		end
		if ((obtaindb.wrath == false) and (Recipe["Game"] == 2)) then
			return false
		end

		local bindingdb = filterdb.binding

		-- Include BoE Items in the scan? (if I want to see BoE items, only filter those that are not BoE)
		if (bindingdb.itemboe == false) and (flags[36] == true) then
			return false
		end

		-- Include BoP Items in the scan? (if I want to see BoP items, only filter those that are not BoP)
		if (bindingdb.itembop == false) and (flags[37] == true) then
			return false
		end

		-- Include BoA Items in the scan? (if I want to see BoA items, only filter those that are not BoA)
		if (bindingdb.itemboa == false) and (flags[38] == true) then
			return false
		end

		-- Include BoE Recipes in the scan? (if I want to see BoE recipes, only filter those that are not BoE)
		if (bindingdb.recipeboe == false) and (flags[40] == true) then
			return false
		end

		-- Include BoP Recipes in the scan? (if I want to see BoP recipes, only filter those that are not BoP)
		if (bindingdb.recipebop == false) and (flags[41] == true) then
			return false
		end

		-- Include BoA Recipes in the scan? (if I want to see BoA recipes, only filter those that are not BoA)
		if (bindingdb.recipeboa == false) and (flags[42] == true) then
			return false
		end

		local playerdb = filterdb.player

		-- Include melee type recipes?
		if (playerdb.melee == false) and (flags[51] == true) then
			return false
		end

		-- Include tanking type recipes?
		if (playerdb.tank == false) and (flags[52] == true) then
			return false
		end

		-- Include healing type recipes?
		if (playerdb.healer == false) and (flags[53] == true) then
			return false
		end

		-- Include caster type recipes?
		if (playerdb.caster == false) and (flags[54] == true) then
			return false
		end

		local armordb = filterdb.item.armor

		if (armordb.cloth == false) and (flags[56] == true) then
			return false
		end
		if (armordb.leather == false) and (flags[57] == true) then
			return false
		end
		if (armordb.mail == false) and (flags[58] == true) then
			return false
		end
		if (armordb.plate == false) and (flags[59] == true) then
			return false
		end
		if (armordb.trinket == false) and (flags[61] == true) then
			return false
		end
		if (armordb.cloak == false) and (flags[60] == true) then
			return false
		end
		if (armordb.ring == false) and (flags[62] == true) then
			return false
		end
		if (armordb.necklace == false) and (flags[63] == true) then
			return false
		end
		if (armordb.shield == false) and (flags[64] == true) then
			return false
		end

		local weapondb = filterdb.item.weapon
		if (weapondb.onehand == false) and (flags[66] == true) then
			return false
		end
		if (weapondb.twohand == false) and (flags[67] == true) then
			return false
		end
		if (weapondb.axe == false) and (flags[68] == true) then
			return false
		end
		if (weapondb.sword == false) and (flags[69] == true) then
			return false
		end
		if (weapondb.mace == false) and (flags[70] == true) then
			return false
		end
		if (weapondb.polearm == false) and (flags[71] == true) then
			return false
		end
		if (weapondb.dagger == false) and (flags[72] == true) then
			return false
		end
		if (weapondb.fist == false) and (flags[79] == true) then
			return false
		end
		if (weapondb.gun == false) and (flags[80] == true) then
			return false
		end
		if (weapondb.staff == false) and (flags[73] == true) then
			return false
		end
		if (weapondb.wand == false) and (flags[74] == true) then
			return false
		end
		if (weapondb.thrown == false) and (flags[75] == true) then
			return false
		end
		if (weapondb.bow == false) and (flags[76] == true) then
			return false
		end
		if (weapondb.crossbow == false) and (flags[77] == true) then
			return false
		end
		if (weapondb.ammo == false) and (flags[78] == true) then
			return false
		end

		if (not CheckReputationDisplay(flags)) then
			return false
		end

		local classesdb = filterdb.classes

			if (classesdb.deathknight == false) and (flags[21] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.druid == false) and (flags[22] == true) then
				if (classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.hunter == false) and (flags[23] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.mage == false) and (flags[24] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.paladin == false) and (flags[25] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.priest == false) and (flags[26] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.shaman == false) and (flags[27] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.rogue == false) and (flags[28] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.warlock == false) and (flags[29] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) or
				(classesdb.warrior == true) and (flags[30] == true) then
					--do nothing
				else
					return false
				end
			end

			if (classesdb.warrior == false) and (flags[30] == true) then
				if (classesdb.druid == true) and (flags[22] == true) or
				(classesdb.hunter == true) and (flags[23] == true) or
				(classesdb.mage == true) and (flags[24] == true) or
				(classesdb.paladin == true) and (flags[25] == true) or
				(classesdb.priest == true) and (flags[26] == true) or
				(classesdb.shaman == true) and (flags[27] == true) or
				(classesdb.rogue == true) and (flags[28] == true) or
				(classesdb.warlock == true) and (flags[29] == true) or
				(classesdb.deathknight == true) and (flags[21] == true) then
					--do nothing
				else
					return false
				end
			end

		-- Stage 2
		-- loop through nonexclusive (soft filters) flags until one is true
		-- If one of these is true (ie: we want to see trainers and there is a trainer flag) we display the recipe

		-- Display trainer recipes
		if (obtaindb.trainer == true) and (flags[3] == true) then
			return true
		end

		-- Display vendor recipes
		if (obtaindb.vendor == true) and (flags[4] == true) then
			return true
		end

		-- Display instance recipes
		if (obtaindb.instance == true) and (flags[5] == true) then
			return true
		end

		-- Display raid recipes
		if (obtaindb.raid == true) and (flags[6] == true) then
			return true
		end

		-- Display seasonal recipes
		if (obtaindb.seasonal == true) and (flags[7] == true) then
			return true
		end

		-- Display quest recipes
		if (obtaindb.quest == true) and (flags[8] == true) then
			return true
		end

		-- Display PVP recipes
		if (obtaindb.pvp == true) and (flags[9] == true) then
			return true
		end

		-- Display world drop recipes
		if (obtaindb.worlddrop == true) and (flags[10] == true) then
			return true
		end

		-- Display mob drop recipes
		if (obtaindb.mobdrop == true) and (flags[11] == true) then
			return true
		end

		-- Display discovery recipes
		if (obtaindb.discovery == true) and (flags[12] == true) then
			return true
		end

		-- If we get here it means that no flags matched our values
		return false

	end

end

---Creates an array of which factions we want to include in our display and which ones to ignore
local function PopulateRepFilters(RepTable)

	local repfilters = addon.db.profile.filters.rep

	RepTable[BFAC["The Scryers"]] = repfilters.scryer
	RepTable[BFAC["The Aldor"]] = repfilters.aldor
	RepTable[BFAC["Argent Dawn"]] = repfilters.argentdawn
	RepTable[BFAC["Ashtongue Deathsworn"]] = repfilters.ashtonguedeathsworn
	RepTable[BFAC["Cenarion Circle"]] = repfilters.cenarioncircle
	RepTable[BFAC["Cenarion Expedition"]] = repfilters.cenarionexpedition
	RepTable[BFAC["The Consortium"]] = repfilters.consortium
	RepTable[BFAC["Honor Hold"]] = repfilters.hellfire
	RepTable[BFAC["Thrallmar"]] = repfilters.hellfire
	RepTable[BFAC["Keepers of Time"]] = repfilters.keepersoftime
	RepTable[BFAC["Kurenai"]] = repfilters.nagrand
	RepTable[BFAC["The Mag'har"]] = repfilters.nagrand
	RepTable[BFAC["Lower City"]] = repfilters.lowercity
	RepTable[BFAC["The Scale of the Sands"]] = repfilters.scaleofthesands
	RepTable[BFAC["The Sha'tar"]] = repfilters.shatar
	RepTable[BFAC["Shattered Sun Offensive"]] = repfilters.shatteredsun
	RepTable[BFAC["Sporeggar"]] = repfilters.sporeggar
	RepTable[BFAC["Thorium Brotherhood"]] = repfilters.thoriumbrotherhood
	RepTable[BFAC["Timbermaw Hold"]] = repfilters.timbermaw
	RepTable[BFAC["The Violet Eye"]] = repfilters.violeteye
	RepTable[BFAC["Zandalar Tribe"]] = repfilters.zandalar
	RepTable[BFAC["Argent Crusade"]] = repfilters.argentcrusade
	RepTable[BFAC["Frenzyheart Tribe"]] = repfilters.frenzyheart
	RepTable[BFAC["Knights of the Ebon Blade"]] = repfilters.ebonblade
	RepTable[BFAC["Kirin Tor"]] = repfilters.kirintor
	RepTable[BFAC["The Sons of Hodir"]] = repfilters.sonsofhodir
	RepTable[BFAC["The Kalu'ak"]] = repfilters.kaluak
	RepTable[BFAC["The Oracles"]] = repfilters.oracles
	RepTable[BFAC["The Wyrmrest Accord"]] = repfilters.wyrmrest
	RepTable[BFAC["Alliance Vanguard"]] = repfilters.wrathcommon1
	RepTable[BFAC["Horde Expedition"]] = repfilters.wrathcommon1
	RepTable[BFAC["The Silver Covenant"]] = repfilters.wrathcommon2
	RepTable[BFAC["The Sunreavers"]] = repfilters.wrathcommon2
	RepTable[BFAC["Valiance Expedition"]] = repfilters.wrathcommon3
	RepTable[BFAC["Warsong Offensive"]] = repfilters.wrathcommon3
	RepTable[BFAC["The Taunka"]] = repfilters.wrathcommon4
	RepTable[BFAC["The Frostborn"]] = repfilters.wrathcommon4
	RepTable[BFAC["Explorers' League"]] = repfilters.wrathcommon5
	RepTable[BFAC["The Hand of Vengeance"]] = repfilters.wrathcommon5

end

---Scans the recipe listing and updates the filters according to user preferences
function addon:UpdateFilters(RecipeDB, AllSpecialtiesTable, playerData)

	local playerProfessionLevel = playerData.playerProfessionLevel
	local playerProfession = playerData.playerProfession
	local playerSpecialty = playerData.playerSpecialty
	local playerFaction = playerData.playerFaction
	local playerClass = playerData.playerClass

	playerData.filteredRecipes = 0
	playerData.otherRecipes = 0

	playerData.recipes_total = 0
	playerData.recipes_known = 0
	playerData.recipes_total_filtered = 0
	playerData.recipes_known_filtered = 0

	local displayflag = false

	-- Parse through all the entries in the Recipe array
	for RecipeID, Recipe in pairs(RecipeDB) do

		-- only interested in the current profession
		if (Recipe["Profession"] == playerProfession) then

			-- Determine if we are to display this recipe or not
			displayflag = self:CheckDisplayRecipe(Recipe, AllSpecialtiesTable, playerProfessionLevel, playerProfession, playerSpecialty, playerFaction, playerClass)

			playerData.recipes_total = playerData.recipes_total + 1
			playerData.recipes_known = playerData.recipes_known + (Recipe["Known"] == true and 1 or 0)

			if (displayflag == true) then
				playerData.recipes_total_filtered = playerData.recipes_total_filtered + 1
				playerData.recipes_known_filtered = playerData.recipes_known_filtered + (Recipe["Known"] == true and 1 or 0)

				-- Include known
				if (addon.db.profile.filters.general.known == false) and (Recipe["Known"] == true) then
					displayflag = false
				end
				-- Include unknown
				if (addon.db.profile.filters.general.unknown == false) and (Recipe["Known"] == false) then
					displayflag = false
				end
			end
		else
				displayflag = false
		end

		-- Set the display flag
		RecipeDB[RecipeID]["Display"] = displayflag

	end

	self:ClearRepTable()

end

-------------------------------------------------------------------------------
-- ARL Logic Functions
-------------------------------------------------------------------------------

local InitializeRecipes
do
	local profession_table = {}	-- Table of all possible professions with init functions

	---Determines which profession we are dealing with and loads up the recipe information for it.
	function InitializeRecipes(RecipeDB, playerProfession)
		twipe(profession_table)

		profession_table[GetSpellInfo(51304)] = addon.InitAlchemy
		profession_table[GetSpellInfo(51300)] = addon.InitBlacksmithing
		profession_table[GetSpellInfo(51296)] = addon.InitCooking
		profession_table[GetSpellInfo(51313)] = addon.InitEnchanting
		profession_table[GetSpellInfo(51306)] = addon.InitEngineering
		profession_table[GetSpellInfo(45542)] = addon.InitFirstAid
		profession_table[GetSpellInfo(51302)] = addon.InitLeatherworking
		profession_table[GetSpellInfo(32606)] = addon.InitSmelting
		profession_table[GetSpellInfo(51309)] = addon.InitTailoring
		profession_table[GetSpellInfo(51311)] = addon.InitJewelcrafting
		profession_table[GetSpellInfo(45363)] = addon.InitInscription
		profession_table[GetSpellInfo(53428)] = addon.InitRuneforging

		-- Check for player profession to fix some bugs with addons that interface with ARL
		-- This source code is release under Public Domain
		-- Thanks to sylvanaar/xinhuan for the code snippet
		if (playerProfession) then
			local a = profession_table[playerProfession]

			if a then
				return a(addon, RecipeDB)
			else
				addon:Print(L["UnknownTradeSkill"]:format(playerProfession))
			end
		end
	end
end	-- do

---Determines what to do when the slash command is called.
function addon:ChatCommand(input)

	-- Open About panel if there's no parameters or if we do /arl about
	if (not input) or (input and input:trim() == "") or (input == strlower(L["Sorting"])) or (input == strlower(L["Sort"]))  or (input == strlower(L["Display"])) then
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
	elseif (input == strlower(L["About"])) then
		if (self.optionsFrame["About"]) then
			InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["About"])
		else
			InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
		end
	elseif (input == strlower(L["Profile"])) then
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Profiles"])
	elseif (input == strlower(L["Filter"])) then
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Filters"])
	elseif (input == strlower(L["Documentation"])) then
		InterfaceOptionsFrame_OpenToCategory(self.optionsFrame["Documentation"])
	elseif (input == strlower(L["Scan"])) then
		self:AckisRecipeList_Command(false)
	elseif (input == strlower("scandata")) then
		self:ScanSkillLevelData()
	elseif (input == strlower("scanprof")) then
		self:ScanProfession("all")
	else
		-- What happens when we get here?
		LibStub("AceConfigCmd-3.0"):HandleCommand("arl", "Ackis Recipe List", input)
	end

end

---Resets the known flag to false for all the recipes in the database.
local function ResetKnown(RecipeDB)
	for SpellID in pairs(RecipeDB) do
		RecipeDB[SpellID]["Known"] = false
	end
end

do

	local UnitClass = UnitClass
	local UnitFactionGroup = UnitFactionGroup
	local tsort = table.sort

	local RecipeList = nil

	local CustomList = nil
	local MobList = nil
	local QuestList = nil
	local ReputationList = nil
	local TrainerList = nil
	local SeasonalList = nil
	local VendorList = nil
	local RepFilters = nil
	local AllSpecialtiesTable = nil
	local SpecialtyTable = nil


	-- Tables for getting the locations
	local location_list = {}
	local location_checklist = {}

	---Determines all the locations a given recipe can be obtained
	function addon:GetRecipeLocations(SpellID)
		if not RecipeList or not RecipeList[SpellID] then
			return ""
		end
		wipe(location_list)
		wipe(location_checklist)

		local recipe_acquire = RecipeList[SpellID]["Acquire"]

		for i in pairs(recipe_acquire) do

			-- Trainer
			if (recipe_acquire[i]["Type"] == 1) then
				if (TrainerList) then
					if (not TrainerList[recipe_acquire[i]["ID"]]) then
						--@alpha@
						self:Print("Missing trainer in database: " .. recipe_acquire[i]["ID"])
						--@end-alpha@
						return
					end
					local location = TrainerList[recipe_acquire[i]["ID"]]["Location"]
					if (not location_checklist[location]) then
						-- Add the location to the list
						tinsert(location_list, location)
						location_checklist[location] = true
					end
				end
				-- Vendor
			elseif (recipe_acquire[i]["Type"] == 2) then
				if (VendorList) then
					if (not VendorList[recipe_acquire[i]["ID"]]) then
						--@alpha@
						self:Print("Missing vendor in database: " .. recipe_acquire[i]["ID"])
						--@end-alpha@
						return
					end

					local location = VendorList[recipe_acquire[i]["ID"]]["Location"]
					if (not location_checklist[location]) then
						-- Add the location to the list
						tinsert(location_list, location)
						location_checklist[location] = true
					end
				end
				-- Mob Drop
			elseif (recipe_acquire[i]["Type"] == 3) then
				if (MobList) then
					if (not MobList[recipe_acquire[i]["ID"]]) then
						--@alpha@
						self:Print("Missing mob in database: " .. recipe_acquire[i]["ID"])
						--@end-alpha@
						return
					end
					local location = MobList[recipe_acquire[i]["ID"]]["Location"]
					if (not location_checklist[location]) then
						-- Add the location to the list
						tinsert(location_list, location)
						location_checklist[location] = true
					end
				end
				-- Quest
			elseif (recipe_acquire[i]["Type"] == 4) then
				if (QuestList) then
					if (not QuestList[recipe_acquire[i]["ID"]]) then
						--@alpha@
						self:Print("Missing quest in database: " .. recipe_acquire[i]["ID"])
						--@end-alpha@
						return
					end
					local location = QuestList[recipe_acquire[i]["ID"]]["Location"]
					if (not location_checklist[location]) then
						-- Add the location to the list
						tinsert(location_list, location)
						location_checklist[location] = true
					end
				end
				-- World Drop
			elseif (recipe_acquire[i]["Type"] == 7) then
				local location = L["World Drop"]
				if (not location_checklist[location]) then
					-- Add the location to the list
					tinsert(location_list, location)
					location_checklist[location] = true
				end
			end
		end

		-- Sort the list by the name
		tsort(location_list, function(a, b) return a < b end)

		-- Return the list as a string
		if (#location_list == 0)then
			return ""
		else
			return tconcat(location_list, ",")
		end
	end

	---Toggles the flag that a trade window is opened
	local TRADE_WINDOW_OPENED = false

	function addon:OpenTradeWindow()
		TRADE_WINDOW_OPENED = true
	end

	---Toggles the flag that a trade window is opened
	function addon:CloseTradeWindow()
		TRADE_WINDOW_OPENED = false
	end

	-------------------------------------------------------------------------------
	-- Upvalued globals
	-------------------------------------------------------------------------------
	local GetSpellName = GetSpellName
	local BOOKTYPE_SPELL = BOOKTYPE_SPELL

	---Scans first 25 spellbook slots to identify all applicable professions
	local function GetKnownProfessions(ProfTable)
		-- Reset the table, they may have unlearnt a profession
		for i in pairs(ProfTable) do
			ProfTable[i] = false
		end

		-- Scan through the spell book getting the spell names
		for index=1,25,1 do

			local spellName = GetSpellName(index, BOOKTYPE_SPELL)

			if (not spellName) or (index == 25) then
				-- Nothing found
				break
			end
			if (ProfTable[spellName] == false or spellName == GetSpellInfo(2656)) then
				if spellName == GetSpellInfo(2656) then
					ProfTable[GetSpellInfo(32606)] = true
				else
					ProfTable[spellName] = true
				end
			end
		end

	end

	-- Scans first 25 spellbook slots to identify which trade skill Specialty we have
	local function GetTradeSpecialty(SpecialtyTable, playerData)
		--Scan the first 25 entries
		for index = 1, 25, 1 do
			local spellName = GetSpellName(index, BOOKTYPE_SPELL)

			-- Nothing found, return nothing
			if (not spellName) or (index == 25) then
				return ""
			-- We have a match, return that spell name
			elseif (SpecialtyTable[playerData.playerProfession]) and (SpecialtyTable[playerData.playerProfession][spellName]) then
				local ID = smatch(GetSpellLink(spellName), "^|c%x%x%x%x%x%x%x%x|Hspell:(%d+)")
				return ID
			end
		end
	end

	--- Data which is stored regarding a players statistics (luadoc copied from Collectinator, needs updating)
	-- @class table
	-- @name playerData
	-- @field known_filtered Total number of items known filtered during the scan.
	-- @field playerFaction Players faction
	-- @field playerClass Players class
	-- @field ["Reputation"] Listing of players reputation levels
	local playerData = {}

	-- All Alchemy Specialties
	local AlchemySpec = {
		[GetSpellInfo(28674)] = true,
		[GetSpellInfo(28678)] = true,
		[GetSpellInfo(28676)] = true,
	}

	-- All Blacksmithing Specialties
	local BlacksmithSpec = {
		[GetSpellInfo(9788)] = true, -- Armorsmith
		[GetSpellInfo(17041)] = true, -- Master Axesmith
		[GetSpellInfo(17040)] = true, -- Master Hammersmith
		[GetSpellInfo(17039)] = true, -- Master Swordsmith
		[GetSpellInfo(9787)] = true, -- Weaponsmith
	}

	-- All Engineering Specialties
	local EngineeringSpec = {
		[GetSpellInfo(20219)] = true, -- Gnomish
		[GetSpellInfo(20222)] = true, -- Goblin
	}

	-- All Leatherworking Specialties
	local LeatherworkSpec = {
		[GetSpellInfo(10657)] = true, -- Dragonscale
		[GetSpellInfo(10659)] = true, -- Elemental
		[GetSpellInfo(10661)] = true, -- Tribal
	}

	-- All Tailoring Specialties
	local TailorSpec = {
		[GetSpellInfo(26797)] = true, -- Spellfire
		[GetSpellInfo(26801)] = true, -- Shadoweave
		[GetSpellInfo(26798)] = true, -- Primal Mooncloth
	}

	---Initializes and adds data relavent to the player character
	local function InitPlayerData()
		local _, cls = UnitClass("player")

		playerData.playerFaction = UnitFactionGroup("player")
		playerData.playerClass = cls
		playerData["Reputation"] = {}

		addon:GetFactionLevels(playerData["Reputation"])

		playerData["Professions"] = {
			[GetSpellInfo(51304)] = false, -- Alchemy
			[GetSpellInfo(51300)] = false, -- Blacksmithing
			[GetSpellInfo(51296)] = false, -- Cooking
			[GetSpellInfo(51313)] = false, -- Enchanting
			[GetSpellInfo(51306)] = false, -- Engineering
			[GetSpellInfo(45542)] = false, -- First Aid
			[GetSpellInfo(51302)] = false, -- Leatherworking
			[GetSpellInfo(32606)] = false, -- Mining
			[GetSpellInfo(51309)] = false, -- Tailoring
			[GetSpellInfo(51311)] = false, -- Jewelcrafting
			[GetSpellInfo(45363)] = false, -- Inscription
			[GetSpellInfo(53428)] = false, -- Runeforging
		}
		GetKnownProfessions(playerData["Professions"])

		-- List of classes which have Specialties
		SpecialtyTable = {
			[GetSpellInfo(51304)] = AlchemySpec,
			[GetSpellInfo(51300)] = BlacksmithSpec,
			[GetSpellInfo(51306)] = EngineeringSpec,
			[GetSpellInfo(51302)] = LeatherworkSpec,
			[GetSpellInfo(51309)] = TailorSpec,
		}

		-- List containing all possible Specialties
		AllSpecialtiesTable = {}

		-- Populate the Specialty table with all Specialties, not adding alchemy because no recipes have alchemy filters
		for i in pairs(BlacksmithSpec) do AllSpecialtiesTable[i] = true end
		for i in pairs(EngineeringSpec) do AllSpecialtiesTable[i] = true end
		for i in pairs(LeatherworkSpec) do AllSpecialtiesTable[i] = true end
		for i in pairs(TailorSpec) do AllSpecialtiesTable[i] = true end
	end

	---Updates the reputation table.  This only happens more seldom so I'm not worried about efficiency
	function addon:SetRepDB()

		if (playerData and playerData["Reputation"]) then
			self:GetFactionLevels(playerData["Reputation"])
		end

	end

	---Initializes all the recipe databases to their initial
	local function InitDatabases()

		-- Initializes the custom list
		if (CustomList == nil) then
			CustomList = {}
			addon:InitCustom(CustomList)
		end

		-- Initializes the mob list
		if (MobList == nil) then
			MobList = {}
			addon:InitMob(MobList)
		end

		-- Initializes the quest list
		if (QuestList == nil) then
			QuestList = {}
			addon:InitQuest(QuestList)
		end

		-- Initializes the reputation list
		if (ReputationList == nil) then
			ReputationList = {}
			addon:InitReputation(ReputationList)
		end

		-- Initializes the trainer list
		if (TrainerList == nil) then
			TrainerList = {}
			addon:InitTrainer(TrainerList)
		end

		-- Initializes the season list
		if (SeasonalList == nil) then
			SeasonalList = {}
			addon:InitSeasons(SeasonalList)
		end

		-- Initializes the vendor list
		if (VendorList == nil) then
			VendorList = {}
			addon:InitVendor(VendorList)
		end

		-- Initializes the reputation filters
		-- Don't assign values no because we do a scan later on
		if (RepFilters == nil) then
			RepFilters = {}
		end

		-- Initializes the recipe list
		if (RecipeList == nil) then
			RecipeList = {}
		end

	end

	--- Causes a scan of the tradeskill to be conducted. Function called when the scan button is clicked.   Parses recipes and displays output
	-- @name AckisRecipeList:AckisRecipeList_Command
	-- @usage AckisRecipeList:AckisRecipeList_Command(true)
	-- @param textdump Boolean indicating if we want the output to be a text dump, or if we want to use the ARL GUI.
	-- @return A frame with either the text dump, or the ARL frame.
	function addon:AckisRecipeList_Command(textdump)

		-- If we don't have a trade skill window open, lets return out of here
		if (not TRADE_WINDOW_OPENED) then
			self:Print(L["OpenTradeSkillWindow"])
			return
		-- Trade type skills
		else
			-- First time a scan has been run, we need to get the player specific data, specifically faction information, profession information and other pertinent data.
			if not playerData.playerClass then
				InitPlayerData()
			end
			-- Lets create all the databases needed if this is the first time everything has been run.
			if (RecipeList == nil) then
				InitDatabases()
			end
			-- Get the name of the current trade skill opened, along with the current level of the skill.
			playerData.playerProfession, playerData.playerProfessionLevel = GetTradeSkillLine()
			-- Get the current profession Specialty
			playerData.playerSpecialty = GetTradeSpecialty(SpecialtyTable, playerData)
			-- Add the recipes to the database
			playerData.totalRecipes = InitializeRecipes(RecipeList, playerData.playerProfession)
			-- Reset all the known flags
			ResetKnown(RecipeList)
			-- Scan all recipes and mark the ones which ones we know
			self:ScanForKnownRecipes(RecipeList, playerData)
			-- Update the table containing which reps to display
			PopulateRepFilters(RepFilters)
			-- Add filtering flags to the recipes
			self:UpdateFilters(RecipeList, AllSpecialtiesTable, playerData)
			-- Mark excluded recipes
			playerData.excluded_recipes_known, playerData.excluded_recipes_unknown = self:GetExclusions(RecipeList, playerData.playerProfession)
		end

		if (textdump == true) then
			self:DisplayTextDump(RecipeList, playerData.playerProfession)
		else
			self:DisplayFrame(playerData, AllSpecialtiesTable,
					  TrainerList, VendorList, QuestList, ReputationList,
					  SeasonalList, MobList, CustomList)
		end
	end

	--- API for external addons to initialize the recipe database with a specific profession
	-- @name AckisRecipeList:AddRecipeData
	-- @usage AckisRecipeList:AddRecipeData(GetSpellInfo(51304))
	-- @param profession Spell ID of the profession which you want to populate the database with.
	-- @return Boolean indicating if the operation was successful.  The recipe database will be populated with appropriate data.
	function addon:AddRecipeData(profession)

		if (RecipeList) then
			InitializeRecipes(RecipeList, profession)
			return true
		else
			return false
		end

	end

	--- API for external addons to initialize the recipe database
	-- @name AckisRecipeList:InitRecipeData
	-- @usage AckisRecipeList:InitRecipeData()
	-- @return Boolean indicating if the operation was successful.  The recipe database will be populated with appropriate data.
	-- @return Arrays containing the RecipeList, MobList, TrainerList, VendorList, QuestList, ReputationList, SeasonalList.
	function addon:InitRecipeData()

		if (RecipeList) then
			return false, RecipeList, MobList, TrainerList, VendorList, QuestList, ReputationList, SeasonalList
		else
			InitDatabases()
			return true, RecipeList, MobList, TrainerList, VendorList, QuestList, ReputationList, SeasonalList
		end

	end

	--- API for external addons to get recipe information from ARL
	-- @name AckisRecipeList:GetRecipeData
	-- @param spellID The spell ID of the recipe you want information about.
	-- @return Table containing all spell ID information or nil if it's not found.
	function addon:GetRecipeData(spellID)

		if (RecipeList) then
			if (RecipeList[spellID]) then
				return RecipeList[spellID]
			else
				return nil
			end
		else
			return nil
		end

	end

	--- API for external addons to get recipe database from ARL
	-- @name AckisRecipeList:GetRecipeTable
	-- @return Table containing all recipe information or nil if it's not found.
	function addon:GetRecipeTable()

		if (RecipeList) then
			return RecipeList
		else
			return nil
		end

	end

end

-------------------------------------------------------------------------------
-- Recipe Exclusion Functions
-------------------------------------------------------------------------------

---Marks all exclusions in the recipe database to not be displayed
function addon:GetExclusions(RecipeDB, prof)

	local exclusionlist = addon.db.profile.exclusionlist
	local countknown = 0
	local countunknown = 0

	local ignored = not addon.db.profile.ignoreexclusionlist

	for i in pairs(exclusionlist) do

		-- We may have a recipe in the exclusion list that has not been scanned yet
		-- check if the entry exists in RecipeDB first
		if (RecipeDB[i]) then
			if (ignored) then
				RecipeDB[i]["Display"] = false
			end

			local tmpprof = GetSpellInfo(RecipeDB[i]["Profession"])
			if (RecipeDB[i]["Known"] == false and tmpprof == prof) then
				countknown = countknown + 1
			elseif (tmpprof == prof) then
				countunknown = countunknown + 1
			end

		end

	end
	return countknown, countunknown
end

---Removes or adds a recipe to the exclusion list.
function addon:ToggleExcludeRecipe(SpellID)

	local exclusionlist = addon.db.profile.exclusionlist

	-- Remove the Spell from the exclusion list
	if (exclusionlist[SpellID]) then

		exclusionlist[SpellID] = nil

	else

		exclusionlist[SpellID] = true

	end

end

---Prints all the ID's in the exclusion list out into chat.
function addon:ViewExclusionList()

	local exclusionlist = addon.db.profile.exclusionlist

	-- Parse all items in the exclusion list
	for i in pairs(exclusionlist) do
		self:Print(i .. ": " .. GetSpellInfo(i))
	end

end

function addon:ClearExclusionList()

	local exclusionlist = addon.db.profile.exclusionlist

	-- Nuke our exclusion table
	exclusionlist = twipe(exclusionlist)

end

-------------------------------------------------------------------------------
-- Searching Functions
-------------------------------------------------------------------------------

---Scans through the recipe database and toggles the flag on if the item is in the search criteria
function addon:SearchRecipeDB(RecipeDB, searchstring)

	if not searchstring then return end

	searchstring = strlower(searchstring)

	-- Go through the entire database
	for SpellID in pairs(RecipeDB) do

		-- Get the Spell object
		local recipe = RecipeDB[SpellID]

		-- Set the search as false automatically
		recipe["Search"] = false

		-- Allow us to search by spell ID
		if sfind(strlower(SpellID),searchstring) or

			-- Allow us to search by item ID
			(recipe["ItemID"] and sfind(strlower(recipe["ItemID"]),searchstring)) or

			-- Allow us to search by name
			(recipe["Name"] and sfind(strlower(recipe["Name"]),searchstring)) or

			-- Allow us to search by locations
			(recipe["Locations"] and sfind(recipe["Locations"],searchstring)) or

			-- Allow us to search by specialty
			(recipe["Specialty"] and sfind(recipe["Specialty"],searchstring)) or
				
			-- Allow us to search by skill level
			(recipe["Level"] and sfind(recipe["Level"],searchstring)) or

			-- Allow us to search by Rarity
			(recipe["Rarity"] and sfind(recipe["Rarity"],searchstring)) then

			recipe["Search"] = true
		end
	end
end

---Goes through the recipe database and resets all the search flags
function addon:ResetSearch(RecipeDB)

	for SpellID in pairs(RecipeDB) do
		RecipeDB[SpellID]["Search"] = true
	end

end

-------------------------------------------------------------------------------
-- Text dumping functions
-------------------------------------------------------------------------------

---Scans through the recipe database providing a string of comma separated values for all recipe information
function addon:GetTextDump(RecipeDB, profession)

	local texttable = {}

	-- Add a header to the text table
	tinsert(texttable,format("Ackis Recipe List Text Dump for %s",profession))
	tinsert(texttable,"Text output of all recipes and acquire information.  Output is in the form of comma separated values.\n")
	tinsert(texttable,"Spell ID, Recipe Name, Skill Level, ARL Filter Flags, Acquire Methods, Known\n")

	for SpellID in pairs(RecipeDB) do

		local recipeprof = GetSpellInfo(RecipeDB[SpellID]["Profession"])

		if (recipeprof == profession) then

			-- Add Spell ID, Name and Skill Level to the list
			tinsert(texttable,SpellID)
			tinsert(texttable,",")
			tinsert(texttable,RecipeDB[SpellID]["Name"])
			tinsert(texttable,",")
			tinsert(texttable,RecipeDB[SpellID]["Level"])
			tinsert(texttable,",[")

			-- Add in all the filter flags
			local flags = RecipeDB[SpellID]["Flags"]

			-- Find out which flags are marked as "true"
			for i=1,127,1 do
				if (flags[i] == true) then
					tinsert(texttable,i)
					tinsert(texttable,",")
				end
			end

			tinsert(texttable,"],[")

			-- Find out which unique acquire methods we have
			local acquire = RecipeDB[SpellID]["Acquire"]
			local acquirelist = {}

			for i in pairs(acquire) do
				if (acquire[i]["Type"] == 1) then
					acquirelist["Trainer"] = true
				elseif (acquire[i]["Type"] == 2) then
					acquirelist["Vendor"] = true
				elseif (acquire[i]["Type"] == 3) then
					acquirelist["Mob Drop"] = true
				elseif (acquire[i]["Type"] == 4) then
					acquirelist["Quest"] = true
				elseif (acquire[i]["Type"] == 5) then
					acquirelist["Seasonal"] = true
				elseif (acquire[i]["Type"] == 6) then
					acquirelist["Reputation"] = true
				elseif (acquire[i]["Type"] == 7) then
					acquirelist["World Drop"] = true
				elseif (acquire[i]["Type"] == 8) then
					acquirelist["Custom"] = true
				end
			end

			-- Add all the acquire methods in
			for i in pairs(acquirelist) do
				tinsert(texttable,i)
				tinsert(texttable,",")
			end

			if (RecipeDB[SpellID]["Known"]) then
				tinsert(texttable,"],true\n")
			else
				tinsert(texttable,"],false\n")
			end

		end
	end

	return tconcat(texttable,"")

end

do

	local GetItemInfo = GetItemInfo

	---Dumps all the info about a recipe out to chat
	function addon:DumpRecipe(SpellID)

		local recipelist = addon:GetRecipeTable()

		if not recipelist then return end

		if not recipelist[SpellID] then
			self:Print("Spell ID not in recipe database.")
			return
		end

		local x = recipelist[SpellID]
		self:Print(x["Name"] .. "(" .. x["Level"] .. ") -- " .. SpellID)
		self:Print("Rarity: " .. x["Rarity"])

		if (x["Specialty"]) then
			self:Print("Profession: " .. x["Profession"] .. "(" .. x["Specialty"] .. ")")
		else
			self:Print("Profession: " .. x["Profession"])
		end
		if (x["ItemID"]) then
			local _,linky = GetItemInfo(x["ItemID"])
			self:Print("Creates: " .. linky .. "(" .. x["ItemID"] .. ")")
		end
		if (x["Locations"]) then
			self:Print("Located: " .. x["Locations"])
		end

		local flags = x["Flags"]
		local flagstr = ""

		if (flags[1] == true) then
			flagstr = flagstr .. "Ally,"
		end
		if (flags[2] == true) then
			flagstr = flagstr .. "Horde,"
		end
		if (flags[3] == true) then
			flagstr = flagstr .. "Trn,"
		end
		if (flags[4] == true) then
			flagstr = flagstr .. "Ven,"
		end
		if (flags[5] == true) then
			flagstr = flagstr .. "Instance,"
		end
		if (flags[6] == true) then
			flagstr = flagstr .. "Raid,"
		end
		if (flags[7] == true) then
			flagstr = flagstr .. "Seasonal,"
		end
		if (flags[8] == true) then
			flagstr = flagstr .. "Quest,"
		end
		if (flags[9] == true) then
			flagstr = flagstr .. "PVP,"
		end
		if (flags[10] == true) then
			flagstr = flagstr .. "World,"
		end
		if (flags[11] == true) then
			flagstr = flagstr .. "Mob,"
		end
		if (flags[12] == true) then
			flagstr = flagstr .. "Disc,"
		end
		if (flags[13] == true) then
			flagstr = flagstr .. "13,"
		end
		if (flags[14] == true) then
			flagstr = flagstr .. "14,"
		end
		if (flags[15] == true) then
			flagstr = flagstr .. "15,"
		end
		if (flags[16] == true) then
			flagstr = flagstr .. "16,"
		end
		if (flags[17] == true) then
			flagstr = flagstr .. "17,"
		end
		if (flags[18] == true) then
			flagstr = flagstr .. "18,"
		end
		if (flags[19] == true) then
			flagstr = flagstr .. "19,"
		end
		if (flags[20] == true) then
			flagstr = flagstr .. "20,"
		end
		if (flags[21] == true) then
			flagstr = flagstr .. "DK,"
		end
		if (flags[22] == true) then
			flagstr = flagstr .. "Druid,"
		end
		if (flags[23] == true) then
			flagstr = flagstr .. "Huntard,"
		end
		if (flags[24] == true) then
			flagstr = flagstr .. "Mage,"
		end
		if (flags[25] == true) then
			flagstr = flagstr .. "Pally,"
		end
		if (flags[26] == true) then
			flagstr = flagstr .. "Priest,"
		end
		if (flags[27] == true) then
			flagstr = flagstr .. "Sham,"
		end
		if (flags[28] == true) then
			flagstr = flagstr .. "Rogue,"
		end
		if (flags[29] == true) then
			flagstr = flagstr .. "Lock,"
		end
		if (flags[30] == true) then
			flagstr = flagstr .. "War,"
		end
		if (flags[31] == true) then
			flagstr = flagstr .. "31,"
		end
		if (flags[36] == true) then
			flagstr = flagstr .. "IBoE,"
		end
		if (flags[37] == true) then
			flagstr = flagstr .. "IBoP,"
		end
		if (flags[38] == true) then
			flagstr = flagstr .. "IBoA,"
		end
		if (flags[39] == true) then
			flagstr = flagstr .. "39,"
		end
		if (flags[40] == true) then
			flagstr = flagstr .. "RBoE,"
		end
		if (flags[41] == true) then
			flagstr = flagstr .. "RBoP,"
		end
		if (flags[42] == true) then
			flagstr = flagstr .. "RBoA,"
		end
		if (flags[51] == true) then
			flagstr = flagstr .. "Melee,"
		end
		if (flags[52] == true) then
			flagstr = flagstr .. "Tank,"
		end
		if (flags[53] == true) then
			flagstr = flagstr .. "Heal,"
		end
		if (flags[54] == true) then
			flagstr = flagstr .. "Caster,"
		end
		if (flags[56] == true) then
			flagstr = flagstr .. "Cloth,"
		end
		if (flags[57] == true) then
			flagstr = flagstr .. "Leather,"
		end
		if (flags[58] == true) then
			flagstr = flagstr .. "Mail,"
		end
		if (flags[59] == true) then
			flagstr = flagstr .. "Plate,"
		end
		if (flags[60] == true) then
			flagstr = flagstr .. "Cloak,"
		end
		if (flags[61] == true) then
			flagstr = flagstr .. "Trinket,"
		end
		if (flags[62] == true) then
			flagstr = flagstr .. "Ring,"
		end
		if (flags[63] == true) then
			flagstr = flagstr .. "Neck,"
		end
		if (flags[64] == true) then
			flagstr = flagstr .. "Shield,"
		end
		if (flags[66] == true) then
			flagstr = flagstr .. "1H,"
		end
		if (flags[67] == true) then
			flagstr = flagstr .. "2H,"
		end
		if (flags[68] == true) then
			flagstr = flagstr .. "Axe,"
		end
		if (flags[69] == true) then
			flagstr = flagstr .. "Sword,"
		end
		if (flags[70] == true) then
			flagstr = flagstr .. "Mace,"
		end
		if (flags[71] == true) then
			flagstr = flagstr .. "Polearm,"
		end
		if (flags[72] == true) then
			flagstr = flagstr .. "Dagger,"
		end
		if (flags[73] == true) then
			flagstr = flagstr .. "Staff,"
		end
		if (flags[74] == true) then
			flagstr = flagstr .. "Wand,"
		end
		if (flags[75] == true) then
			flagstr = flagstr .. "Thrown,"
		end
		if (flags[76] == true) then
			flagstr = flagstr .. "Bow,"
		end
		if (flags[77] == true) then
			flagstr = flagstr .. "xBow,"
		end
		if (flags[78] == true) then
			flagstr = flagstr .. "Ammo,"
		end
		if (flags[79] == true) then
			flagstr = flagstr .. "Fist,"
		end

		self:Print("Flags: " .. flagstr)
		flagstr = ""

		if (flags[96] == true) then
			flagstr = flagstr .. "AD,"
		end
		if (flags[97] == true) then
			flagstr = flagstr .. "CC,"
		end
		if (flags[98] == true) then
			flagstr = flagstr .. "TB,"
		end
		if (flags[99] == true) then
			flagstr = flagstr .. "TH,"
		end
		if (flags[100] == true) then
			flagstr = flagstr .. "ZH,"
		end
		if (flags[101] == true) then
			flagstr = flagstr .. "Aldor,"
		end
		if (flags[102] == true) then
			flagstr = flagstr .. "Ashtongue,"
		end
		if (flags[103] == true) then
			flagstr = flagstr .. "CE,"
		end
		if (flags[104] == true) then
			flagstr = flagstr .. "Thrall/HH,"
		end
		if (flags[105] == true) then
			flagstr = flagstr .. "Consort,"
		end
		if (flags[106] == true) then
			flagstr = flagstr .. "KoT,"
		end
		if (flags[107] == true) then
			flagstr = flagstr .. "LC,"
		end
		if (flags[108] == true) then
			flagstr = flagstr .. "Mag/Kur,"
		end
		if (flags[109] == true) then
			flagstr = flagstr .. "SoS,"
		end
		if (flags[110] == true) then
			flagstr = flagstr .. "Scryer,"
		end
		if (flags[111] == true) then
			flagstr = flagstr .. "Sha'tar,"
		end
		if (flags[112] == true) then
			flagstr = flagstr .. "Shattered Sun,"
		end
		if (flags[113] == true) then
			flagstr = flagstr .. "Spore,"
		end
		if (flags[114] == true) then
			flagstr = flagstr .. "VE,"
		end
		if (flags[115] == true) then
			flagstr = flagstr .. "AC,"
		end
		if (flags[116] == true) then
			flagstr = flagstr .. "Frenzy,"
		end
		if (flags[117] == true) then
			flagstr = flagstr .. "Ebon,"
		end
		if (flags[118] == true) then
			flagstr = flagstr .. "Kirin,"
		end
		if (flags[119] == true) then
			flagstr = flagstr .. "Hodir,"
		end
		if (flags[120] == true) then
			flagstr = flagstr .. "Kalu'ak,"
		end
		if (flags[121] == true) then
			flagstr = flagstr .. "Oracles,"
		end
		if (flags[122] == true) then
			flagstr = flagstr .. "Wyrm,"
		end
		if (flags[123] == true) then
			flagstr = flagstr .. "Wrath Common Factions (The Silver Covenant/The Sunreavers),"
		end
		if (flags[124] == true) then
			flagstr = flagstr .. "Wrath Common Factions (Explorers' League/The Hand of Vengeance),"
		end
		if (flags[125] == true) then
			flagstr = flagstr .. "Wrath Common Factions(Explorer's League/Valiance Expedition),"
		end
		if (flags[126] == true) then
			flagstr = flagstr .. "Wrath Common Factions (The Frostborn/The Taunka),"
		end
		if (flags[127] == true) then
			flagstr = flagstr .. "Wrath Common Factions (Alliance Vanguard/Horde Expedition),"
		end
		self:Print("Reps: " .. flagstr)
	end

end

---Clears all saved tradeskills
function addon:ClearSavedSkills()
	twipe(addon.db.global.tradeskill)

	if addon.db.profile.tradeskill then
		addon.db.profile.tradeskill = nil
	end

end
