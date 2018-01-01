--[[
	Project.: BlizzFacade
	File....: Modules/ActionBars.lua
	Version.: 15
	Author..: StormFX
]]

-- [ Dependencies ] --

local LBF = LibStub("LibButtonFacade")
local BF = LibStub("AceAddon-3.0"):GetAddon("BlizzFacade")
local L = LibStub("AceLocale-3.0"):GetLocale("BlizzFacade")

-- [ Set Up ] --

local mod = BF:NewModule("ActionBars")
local _G, pairs, format = _G, pairs, string.format
local groups = {"MainBar", "StanceBar", "PetBar", "MultiBars", "PossessBar", "VehicleBar"}

-- [ Options ] --

local options = {
	type = "group",
	name = L["Action Bars"],
	args = {
		info = {
			type = "description",
			name = L["Allows the default action bars to be skinned by ButtonFacade."].."\n",
			order = 1,
		},
		enable = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable skinning of the action bars."],
			get = function() return mod:IsEnabled() end,
			set = function(info, s) BF:ToggleModule("ActionBars", s) end,
			order = 2,
		},
		spacer = {
			type = "description",
			name = " ",
			order = 3,
		},
		bars = {
			type = "group",
			name = L["Bar Options"],
			order = 4,
			get = GetBorder,
			set = SetBorder,
			inline = true,
			disabled = function() return not mod:IsEnabled() end,
			args = {
				mainbar = {
					type = "toggle",
					name = L["Main Bar"],
					desc = format(L["Skin the buttons of the %s."], L["Main Bar"]),
					get = function() return BF.db.profile.Bars.MainBar end,
					set = function(info, s)
						BF.db.profile.Bars.MainBar = s
						mod:UpdateMainBar()
					end,
					order = 1,
				},
				stancebar = {
					type = "toggle",
					name = L["Stance Bar"],
					desc = format(L["Skin the buttons of the %s."], L["Stance Bar"]),
					get = function() return BF.db.profile.Bars.StanceBar end,
					set = function(info, s)
						BF.db.profile.Bars.StanceBar = s
						mod:UpdateStanceBar()
					end,
					order = 2,
				},
				petbar = {
					type = "toggle",
					name = L["Pet Bar"],
					desc = format(L["Skin the buttons of the %s."], L["Pet Bar"]),
					get = function() return BF.db.profile.Bars.PetBar end,
					set = function(info, s)
						BF.db.profile.Bars.PetBar = s
						mod:UpdatePetBar()
					end,
					order = 3,
				},
				multibars = {
					type = "toggle",
					name = L["Multi-Bars"],
					desc = format(L["Skin the buttons of the %s."], L["Multi-Bars"]),
					get = function() return BF.db.profile.Bars.MultiBars end,
					set = function(info, s)
						BF.db.profile.Bars.MultiBars = s
						mod:UpdateMultiBars()
					end,
					order = 4,
				},
				possessbar = {
					type = "toggle",
					name = L["Possess Bar"],
					desc = format(L["Skin the buttons of the %s."], L["Possess Bar"]),
					get = function() return BF.db.profile.Bars.PossessBar end,
					set = function(info, s)
						BF.db.profile.Bars.PossessBar = s
						mod:UpdatePossessBar()
					end,
					order = 5,
				},
				vehiclebar = {
					type = "toggle",
					name = L["Vehicle Bar"],
					desc = format(L["Skin the buttons of the %s."], L["Vehicle Bar"]),
					get = function() return BF.db.profile.Bars.VehicleBar end,
					set = function(info, s)
						BF.db.profile.Bars.VehicleBar = s
						mod:UpdateVehicleBar()
					end,
					order = 6,
				},
			},
		},
	},
}

-- [ Core Methods ] --

-- Initialize the module.
function mod:OnInitialize()
	self:RegisterModuleOptions("ActionBars", options)
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
	for _, group in pairs(groups) do
		LBF:Group("BlizzFacade", group):Delete()
	end
end

-- [ Skinning Functions ] --

-- Skins/unskins the main menu bar.
function mod:UpdateMainBar()
	local Group = LBF:Group("BlizzFacade", "MainBar")
	if BF.db.profile.Bars.MainBar then
		Group:Skin(BF.db.profile.Skins["MainBar"].SkinID, BF.db.profile.Skins["MainBar"].Gloss, BF.db.profile.Skins["MainBar"].Backdrop, BF.db.profile.Skins["MainBar"].Colors)
		-- Main Bar
		for i=1, NUM_ACTIONBAR_BUTTONS do
			local button = format("ActionButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
				_G[button]:SetFrameStrata("HIGH")
			end
		end
		-- Bonus Action Bar
		local level = _G["ActionButton1"]:GetFrameLevel()
		BonusActionBarFrame:SetFrameLevel(level + 1)
		for i=1, NUM_BONUS_ACTION_SLOTS do
			local button = format("BonusActionButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
				_G[button]:SetFrameStrata("DIALOG")
			end
		end
	else
		Group:Delete()
	end
end

-- Skins/unskins the stance bar.
function mod:UpdateStanceBar()
	local Group = LBF:Group("BlizzFacade", "StanceBar")
	if BF.db.profile.Bars.StanceBar then
		Group:Skin(BF.db.profile.Skins["StanceBar"].SkinID, BF.db.profile.Skins["StanceBar"].Gloss, BF.db.profile.Skins["StanceBar"].Backdrop, BF.db.profile.Skins["StanceBar"].Colors)
		for i=1, NUM_SHAPESHIFT_SLOTS do
			local button = format("ShapeshiftButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
				_G[button]:SetFrameStrata("HIGH")
			end
		end
	else
		Group:Delete()
	end
end

-- Skins/unskins the pet bar.
function mod:UpdatePetBar()
	local Group = LBF:Group("BlizzFacade", "PetBar")
	if BF.db.profile.Bars.PetBar then
		Group:Skin(BF.db.profile.Skins["PetBar"].SkinID, BF.db.profile.Skins["PetBar"].Gloss, BF.db.profile.Skins["PetBar"].Backdrop, BF.db.profile.Skins["PetBar"].Colors)
		for i=1, NUM_PET_ACTION_SLOTS do
			local button = format("PetActionButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
				--_G[button]:SetFrameStrata("HIGH")
			end
		end
	else
		Group:Delete()
	end
end

-- Skins/unskins the multi-action bars.
function mod:UpdateMultiBars()
	local Group = LBF:Group("BlizzFacade", "MultiBars")
	if BF.db.profile.Bars.MultiBars then
		Group:Skin(BF.db.profile.Skins["MultiBars"].SkinID, BF.db.profile.Skins["MultiBars"].Gloss, BF.db.profile.Skins["MultiBars"].Backdrop, BF.db.profile.Skins["MultiBars"].Colors)
		local buttons = {"MultiBarLeftButton%d", "MultiBarRightButton%d", "MultiBarBottomLeftButton%d", "MultiBarBottomRightButton%d"}
		for _, name in pairs(buttons) do
			for i=1, NUM_MULTIBAR_BUTTONS do
				local button = format(name, i)
				if _G[button] then
					Group:AddButton(_G[button])
				end
			end
		end
	else
		Group:Delete()
	end
end

-- Skins/unskins the possess bar.
function mod:UpdatePossessBar()
	local Group = LBF:Group("BlizzFacade", "PossessBar")
	if BF.db.profile.Bars.PossessBar then
		Group:Skin(BF.db.profile.Skins["PossessBar"].SkinID, BF.db.profile.Skins["PossessBar"].Gloss, BF.db.profile.Skins["PossessBar"].Backdrop, BF.db.profile.Skins["PossessBar"].Colors)
		for i=1, NUM_POSSESS_SLOTS do
			local button = format("PossessButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
				_G[button]:SetFrameStrata("HIGH")
			end
		end
	else
		Group:Delete()
	end
end

-- Skins/unskins the vehicle bar.
function mod:UpdateVehicleBar()
	local Group = LBF:Group("BlizzFacade", "VehicleBar")
	if BF.db.profile.Bars.VehicleBar then
		Group:Skin(BF.db.profile.Skins["VehicleBar"].SkinID, BF.db.profile.Skins["VehicleBar"].Gloss, BF.db.profile.Skins["VehicleBar"].Backdrop, BF.db.profile.Skins["VehicleBar"].Colors)
		for i=1, VEHICLE_MAX_ACTIONBUTTONS do
			local button = format("VehicleMenuBarActionButton%d", i)
			if _G[button] then
				Group:AddButton(_G[button])
			end
		end
	else
		Group:Delete()
	end
end
