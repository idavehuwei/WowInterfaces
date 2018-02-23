--[[
	Project.: BlizzFacade
	File....: Core.lua
	Version.: 37
	Author..: StormFX
]]

-- [ Private Table ] --

local AddOn, ns = ...

-- [ Locals ] --

local L = ns.L
local assert = assert

-- [ Set Up ] --

local LibStub = assert(LibStub, "BlizzFacade requires LibStub.")
local LBF = LibStub("LibButtonFacade")
local BLF = LibStub("AceAddon-3.0"):NewAddon(AddOn, "AceConsole-3.0")

-- [ Options ] --

BLF.options = {
	type = "group",
	name = AddOn,
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
function BLF:OnInitialize()
	-- Set up the profile defaults.
	local defaults = {
		profile = {
			SkinID = "Blizzard",
			Gloss = false,
			Backdrop = false,
			Colors = {},
			Modules = {
				["*"] = true,
			},
			Bars = {
				["*"] = true,
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
	self.db = LibStub("AceDB-3.0"):New("BlizzFacadeDB", defaults, true)
	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
	self.options.args.profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	self.options.args.profiles.order = 10
	for name, module in self:IterateModules() do 
		module:SetEnabledState(self.db.profile.Modules[name])
	end
end

-- Enable function.
function BLF:OnEnable()
	LBF:RegisterSkinCallback(AddOn, self.SkinCallback, self)
	LBF:Group(AddOn):Skin(self.db.profile.SkinID, self.db.profile.Gloss, self.db.profile.Backdrop, self.db.profile.Colors)
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(AddOn, self.options)
	self.OptionsPanel = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOn, AddOn, nil, "general")
	self.OptionsPanel.Profiles = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(AddOn, L["Profiles"], AddOn, "profiles")
	self:RegisterChatCommand("blf", function() self:OpenOptions() end)
end

-- Opens the options window.
function BLF:OpenOptions()
	InterfaceOptionsFrame_OpenToCategory(self.OptionsPanel.Profiles)
	InterfaceOptionsFrame_OpenToCategory(self.OptionsPanel)
end

-- Reloads settings on profile activity.
function BLF:Refresh()
	LBF:Group(AddOn):Skin(self.db.profile.SkinID, self.db.profile.Gloss, self.db.profile.Backdrop, self.db.profile.Colors)
	for name, module in self:IterateModules() do 
		if self.db.profile.Modules[name] then
			module:Disable()
			module:Enable()
		else
			module:Disable()
		end
	end
end

-- [ Skin Call Back ] --

-- Callback function to store skin settings.
function BLF:SkinCallback(SkinID, Gloss, Backdrop, Group, Button, Colors)
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
end

-- [ Modules ] --

-- Toggles a module.
function BLF:ToggleModule(name, enabled)
	self.db.profile.Modules[name] = enabled or false
	if enabled then
		BLF:EnableModule(name)
	else
		BLF:DisableModule(name)
	end
end

BLF:SetDefaultModulePrototype({
	RegisterModuleOptions = function(self, name, options)
		BLF.options.args.general.args[name] = options
	end,
})
