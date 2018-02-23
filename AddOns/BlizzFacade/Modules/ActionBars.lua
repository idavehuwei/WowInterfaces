--[[
	Project.: BlizzFacade
	File....: Modules/ActionBars.lua
	Version.: 37
	Author..: StormFX
]]

-- [ Private Table ] --

local AddOn, ns = ...

-- [ Set Up ] --

local assert = assert
local LibStub = assert(LibStub, "BlizzFacade requires LibStub.")
local LBF = LibStub("LibButtonFacade")
local BLF = LibStub("AceAddon-3.0"):GetAddon(AddOn)
local mod = BLF:NewModule("ActionBars")

-- [ Locals ] --

local L = ns.L
local format, pairs, wipe = string.format, pairs, wipe
local Groups = {}

-- [ Options ] --

local Options

do
	local function GetState(info)
		return BLF.db.profile.Bars[info[#info]]
	end
	local function SetState(info, value)
		BLF.db.profile.Bars[info[#info]] = value
		local f = mod["Update"..info[#info]]
		f()
	end
	Options = {
		type = "group",
		name = L["Action Bars"],
		args = {
			Info = {
				type = "description",
				name = L["Allows the default action bars to be skinned by ButtonFacade."].."\n",
				order = 1,
			},
			Enable = {
				type = "toggle",
				name = L["Enable"],
				desc = L["Enable skinning of the action bars."],
				get = function() return mod:IsEnabled() end,
				set = function(info, s) BLF:ToggleModule("ActionBars", s) end,
				order = 2,
			},
			Spacer = {
				type = "description",
				name = " ",
				order = 3,
			},
			Bars = {
				type = "group",
				name = L["Bar Options"],
				order = 4,
				get = GetState,
				set = SetState,
				inline = true,
				disabled = function() return not mod:IsEnabled() end,
				args = {
					MainBar = {
						type = "toggle",
						name = L["Main Bar"],
						desc = format(L["Skin the buttons of the %s."], L["Main Bar"]),
						order = 1,
					},
					StanceBar = {
						type = "toggle",
						name = L["Stance Bar"],
						desc = format(L["Skin the buttons of the %s."], L["Stance Bar"]),
						order = 2,
					},
					PetBar = {
						type = "toggle",
						name = L["Pet Bar"],
						desc = format(L["Skin the buttons of the %s."], L["Pet Bar"]),
						order = 3,
					},
					MultiBars = {
						type = "toggle",
						name = L["Multi-Bars"],
						desc = format(L["Skin the buttons of the %s."], L["Multi-Bars"]),
						order = 4,
					},
					PossessBar = {
						type = "toggle",
						name = L["Possess Bar"],
						desc = format(L["Skin the buttons of the %s."], L["Possess Bar"]),
						order = 5,
					},
					VehicleBar = {
						type = "toggle",
						name = L["Vehicle Bar"],
						desc = format(L["Skin the buttons of the %s."], L["Vehicle Bar"]),
						order = 6,
					},
				},
			},
		},
	}
end

-- [ Core Methods ] --

-- Initialize the module.
function mod:OnInitialize()
	self:RegisterModuleOptions("ActionBars", Options)
end

-- Enable function.
function mod:OnEnable()
	self:UpdateMainBar()
	self:UpdateStanceBar()
	self:UpdatePetBar()
	self:UpdateMultiBars()
	self:UpdatePossessBar()
	self:UpdateVehicleBar()
end

-- Disable function.
function mod:OnDisable()
	for Group in pairs(Groups) do
		LBF:Group(AddOn, Group):Delete()
	end
	wipe(Groups)
end

-- [ Skinning Functions ] --

do
	local Bar = "MainBar"
	-- Updates the main menu bar.
	function mod:UpdateMainBar()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars[Bar] then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			-- Main Bar
			for i=1, NUM_ACTIONBAR_BUTTONS do
				local button = _G[format("ActionButton%d", i)]
				if button then
					Group:AddButton(button)
					button:SetFrameStrata("HIGH")
				end
			end
			-- Bonus Action Bar
			local level = _G["ActionButton1"]:GetFrameLevel()
			BonusActionBarFrame:SetFrameLevel(level + 1)
			for i=1, NUM_BONUS_ACTION_SLOTS do
				local button = _G[format("BonusActionButton%d", i)]
				if button then
					Group:AddButton(button)
					button:SetFrameStrata("DIALOG")
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end

do
	local Bar = "StanceBar"
	-- Skins/unskins the stance bar.
	function mod:UpdateStanceBar()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars.StanceBar then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			for i=1, NUM_SHAPESHIFT_SLOTS do
				local button = _G[format("ShapeshiftButton%d", i)]
				if button then
					Group:AddButton(button)
					button:SetFrameStrata("HIGH")
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end

do
	local Bar = "PetBar"
	-- Skins/unskins the pet bar.
	function mod:UpdatePetBar()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars.PetBar then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			for i=1, NUM_PET_ACTION_SLOTS do
				local button = _G[format("PetActionButton%d", i)]
				if button then
					Group:AddButton(button)
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end

do
	local Bar = "MultiBars"
	local Buttons = {"MultiBarLeftButton%d", "MultiBarRightButton%d", "MultiBarBottomLeftButton%d", "MultiBarBottomRightButton%d"}
	-- Skins/unskins the multi-action bars.
	function mod:UpdateMultiBars()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars.MultiBars then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			for _, name in pairs(Buttons) do
				for i=1, NUM_MULTIBAR_BUTTONS do
					local button = _G[format(name, i)]
					if button then
						Group:AddButton(button)
					end
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end

do
	local Bar = "PossessBar"
	-- Skins/unskins the possess bar.
	function mod:UpdatePossessBar()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars.PossessBar then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			for i=1, NUM_POSSESS_SLOTS do
				local button = _G[format("PossessButton%d", i)]
				if button then
					Group:AddButton(button)
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end

do
	local Bar = "VehicleBar"
	-- Skins/unskins the vehicle bar.
	function mod:UpdateVehicleBar()
		local Group = LBF:Group(AddOn, Bar)
		if BLF.db.profile.Bars.VehicleBar then
			Group:Skin(BLF.db.profile.Skins[Bar].SkinID, BLF.db.profile.Skins[Bar].Gloss, BLF.db.profile.Skins[Bar].Backdrop, BLF.db.profile.Skins[Bar].Colors)
			for i=1, VEHICLE_MAX_ACTIONBUTTONS do
				local name = format("VehicleMenuBarActionButton%d", i)
				local button = _G[name]
				if button then
					local hotkey = _G[name.."HotKey"]
					local btnkey = _G["ActionButton1HotKey"]
					-- Dirty hack to fix the empty SetPoint method.
					if hotkey.SetPoint ~= btnkey.SetPoint then
						hotkey.SetPoint = btnkey.SetPoint
					end
					Group:AddButton(button)
				end
			end
			Groups[Bar] = true
		else
			Group:Delete()
			Groups[Bar] = nil
		end
	end
end
