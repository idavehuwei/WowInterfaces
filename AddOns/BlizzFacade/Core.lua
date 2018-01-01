--[[
	Project.: BlizzFacade
	File....: Core.lua
	Version.: 15
	Author..: StormFX
]]

-- [ Set Up ] --

if not ButtonFacade then return end
local BF = LibStub("AceAddon-3.0"):NewAddon("BlizzFacade", "AceConsole-3.0")

-- [ Libraries ] --

local LBF = LibStub("LibButtonFacade")
local L = LibStub("AceLocale-3.0"):GetLocale("BlizzFacade")

-- [ Options ] --

BF.options = {
	type = "group",
	name = "BlizzFacade",
	args = {
		general = {
			type = "group",
			name = L["Options"],
			childGroups = "tab",
			args = {
				desc = {
					type = "description",
					name = L["BLF_Desc"].."\n",
					order = 1,
				},
			},
		},
	},
}

-- [ Core Methods ] --

-- Initialize the add-on.
function BF:OnInitialize()
	-- Set up the profile defaults.
	local defaults = {
		profile = {
			SkinID = "Caith",
			Gloss = false,
			Backdrop = false,
			Colors = {},
			Modules = {
				["*"] = true,
			},
			Bars = {
				["*"] = true,
			},
			Borders = {
				None = {0.8, 0, 0, 1},
				Magic = {0.2, 0.6, 1, 1},
				Curse = {0.6, 0, 1, 1},
				Poison = {0, 0.6, 0, 1},
				Disease = {0.6, 0.4, 0, 1},
				Enchant = {0.2, 0, 0.4, 1},
			},
			Skins = {
				["*"] = {
					SkinID = "Caith",
					Gloss = false,
					Backdrop = false,
					Colors = {},
				},
			},
		},
	}

	-- Set up the DB.
	self.db = LibStub("AceDB-3.0"):New("BlizzFacadeDB", defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")

	-- Profiles
	self.options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	self.options.args.profiles.order = 10

	-- Load enabled modules.
	for name, module in self:IterateModules() do
		module:SetEnabledState(self.db.profile.Modules[name])
	end
end

-- Enable function.
function BF:OnEnable()
	-- Set up skins.
	LBF:RegisterSkinCallback(self.name, self.SkinCallback, self)
	-- Note: Skin the addon first to ensure it displays correctly in ButtonFacade's GUI. Each module will reskin itself as needed.
	LBF:Group(self.name):Skin(self.db.profile.SkinID, self.db.profile.Gloss, self.db.profile.Backdrop, self.db.profile.Colors)

	-- Set up options.
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(self.name, self.options)
	self.OptionsPanel = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.name, self.name, nil, "general")
	self.OptionsPanel.Profiles = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.name, L["Profiles"], self.name, "profiles")

	-- Register chat command.
	self:RegisterChatCommand("blf", function() self:OpenOptions() end)
end

-- Opens the options window.
function BF:OpenOptions()
	InterfaceOptionsFrame_OpenToCategory(self.OptionsPanel.Profiles)
	InterfaceOptionsFrame_OpenToCategory(self.OptionsPanel)
end

-- Reloads settings on profile activity.
function BF:Refresh()
	LBF:Group(self.name):Skin(self.db.profile.SkinID, self.db.profile.Gloss, self.db.profile.Backdrop, self.db.profile.Colors)
	for name, module in self:IterateModules() do
		if self.db.profile.Modules[name] then
			module:Disable()
			module:Enable()
		else
			module:Disable()
		end
	end
end

-- [ Skin Functions ] --

-- Callback function to store skin settings.
function BF:SkinCallback(SkinID, Gloss, Backdrop, Group, Button, Colors)
	if not Group then
		self.db.profile.SkinID = SkinID
		self.db.profile.Gloss = Gloss
		self.db.profile.Backdrop = Backdrop
		self.db.profile.Colors = Colors
	else
		self.db.profile.Skins[Group].SkinID = SkinID
		self.db.profile.Skins[Group].Gloss = Gloss
		self.db.profile.Skins[Group].Backdrop = Backdrop
		self.db.profile.Skins[Group].Colors = Colors
	end
	-- Have the modules update themselves on skin changes if necessary.
	for _, module in self:IterateModules() do
		if type(module.SkinCallback) == "function" then
			module:SkinCallback()
		end
	end
end

-- [ Modules ] --

-- Toggles a module.
function BF:ToggleModule(name, enabled)
	self.db.profile.Modules[name] = enabled or false
	if enabled then
		BF:EnableModule(name)
	else
		BF:DisableModule(name)
	end
end

BF:SetDefaultModulePrototype({
	RegisterModuleOptions = function(self, name, options)
		BF.options.args.general.args[name] = options
	end,
})
