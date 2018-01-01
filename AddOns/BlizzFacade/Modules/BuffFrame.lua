--[[
	Project.: BlizzFacade
	File....: Modules/BuffFrame.lua
	Version.: 15
	Author..: StormFX
]]

-- [ Dependencies ] --

local LBF = LibStub("LibButtonFacade")
local BF = LibStub("AceAddon-3.0"):GetAddon("BlizzFacade")
local L = LibStub("AceLocale-3.0"):GetLocale("BlizzFacade")

-- [ Set Up ] --

local mod = BF:NewModule("BuffFrame", "AceHook-3.0")
local _G, pairs, format = _G, pairs, string.format
local options, borders = nil, {}

-- [  Local Functions ] --

-- Updates the border for the specified debuff button.
local function UpdateBorder(button, class)
	if button and _G[button] then
		local border = button.."Border"
		_G[border]:SetVertexColor(unpack(BF.db.profile.Borders[class]))
	end
end

-- Updates the borders of all active debuff buttons.
local function UpdateBorders()
	for button, class in pairs(borders) do
		UpdateBorder(button, class)
	end
end

-- [ Options ] --

do
	local function GetBorder(info)
		return unpack(BF.db.profile.Borders[info[#info]])
	end
	local function SetBorder(info, r, g, b, a)
		BF.db.profile.Borders[info[#info]] = {r, g, b, a}
		UpdateBorders()
	end
	local function ResetBorders()
		BF.db.profile.Borders = {
			None = {0.8, 0, 0, 1},
			Magic = {0.2, 0.6, 1, 1},
			Curse = {0.6, 0, 1, 1},
			Poison = {0, 0.6, 0, 1},
			Disease = {0.6, 0.4, 0, 1},
			Enchant = {0.2, 0, 0.4, 1},
		}
		UpdateBorders()
	end
	options = {
		type = "group",
		name = L["Buff Frame"],
		args = {
			info = {
				type = "description",
				name = L["Allows the default buff frame to be skinned by ButtonFacade."].."\n",
				order = 1,
			},
			enable = {
				type = "toggle",
				name = L["Enable"],
				desc = L["Enable skinning of the buff frame."],
				get = function() return mod:IsEnabled() end,
				set = function(info, s)	BF:ToggleModule("BuffFrame", s) end,
				order = 2,
			},
			spacer = {
				type = "description",
				name = " ",
				order = 3,
			},
			colors = {
				type = "group",
				name = L["Border Colors"],
				order = 4,
				get = GetBorder,
				set = SetBorder,
				inline = true,
				disabled = function() return not mod:IsEnabled() end,
				args = {
					None = {
						type = "color",
						name = L["None"],
						desc = L["Change the border color of debuffs with no type."],
						hasAlpha = true,
						order = 1,
					},
					Magic = {
						type = "color",
						name = L["Magic"],
						desc = format(L["Change the border color of %s debuffs."], L["Magic"]),
						hasAlpha = true,
						order = 2,
					},
					Curse = {
						type = "color",
						name = L["Curse"],
						desc = format(L["Change the border color of %s debuffs."], L["Curse"]),
						hasAlpha = true,
						order = 3,
					},
					Poison = {
						type = "color",
						name = L["Poison"],
						desc = format(L["Change the border color of %s debuffs."], L["Poison"]),
						hasAlpha = true,
						order = 4,
					},
					Disease = {
						type = "color",
						name = L["Disease"],
						desc = format(L["Change the border color of %s debuffs."], L["Disease"]),
						hasAlpha = true,
						order = 5,
					},
					Enchant = {
						type = "color",
						name = L["Enchant"],
						desc = L["Change the border color of temporary enchants."],
						hasAlpha = true,
						order = 6,
					},
				},
			},
			reset = {
				type = "execute",
				name = L["Reset Colors"],
				desc = L["Reset all colors."],
				func = ResetBorders,
				disabled = function() return not mod:IsEnabled() end,
				order = 5,
			},
		},
	}
end

-- [ Core Methods ] --

-- Initialize the module.
function mod:OnInitialize()
	self:RegisterModuleOptions("BuffFrame", options)
end

-- Enable function.
function mod:OnEnable()
	-- Set up skins.
	local Group = "BuffFrame"
	LBF:Group("BlizzFacade", Group):Skin(BF.db.profile.Skins[Group].SkinID, BF.db.profile.Skins[Group].Gloss, BF.db.profile.Skins[Group].Backdrop, BF.db.profile.Skins[Group].Colors)

	-- Hook the buff frame.
	self:SecureHook("BuffFrame_Update")
	self:BuffFrame_Update()
end

-- Disable function.
function mod:OnDisable()
	LBF:Group("BlizzFacade", "BuffFrame"):Delete()
	wipe(borders)
end

-- [ Skinning Functions ] --

-- Post-hook that updates the list of buff/debuff buttons to be skinned.
function mod:BuffFrame_Update()
	local Group = LBF:Group("BlizzFacade", "BuffFrame")
	-- Buffs
	for i=1, BUFF_ACTUAL_DISPLAY do
		local button = format("BuffButton%d", i)
		if _G[button] then
			Group:AddButton(_G[button])
		end
	end
	-- Debuffs
	for i=1, DEBUFF_ACTUAL_DISPLAY do
		local button = format("DebuffButton%d", i)
		if _G[button] then
			local _, _, _, _, class = UnitDebuff("player", i)
			class = class or "None"
			borders[button] = class
			Group:AddButton(_G[button])
			UpdateBorder(button, class)
		end
	end
	-- Temp Enchants
	for i=1, 2 do
		local class = "Enchant"
		local button = format("TempEnchant%d", i)
		if _G[button] then
			borders[button] = class
			Group:AddButton(_G[button])
			UpdateBorder(button, class)
		end
	end
end

-- Callback function to update the borders on a skin change.
function mod:SkinCallback()
	UpdateBorders()
end
