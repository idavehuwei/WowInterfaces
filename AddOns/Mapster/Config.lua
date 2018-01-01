--[[
Copyright (c) 2009, Hendrik "Nevcairiel" Leppkes < h.leppkes@gmail.com >
All rights reserved.
]]

--[[ $Id: Config.lua 2139 2009-05-04 06:36:55Z 月色狼影 $ ]]
local Mapster = LibStub("AceAddon-3.0"):GetAddon("Mapster")
local L = LibStub("AceLocale-3.0"):GetLocale("Mapster")

local optGetter, optSetter
do
	function optGetter(info)
		local key = info[#info] 
		return Mapster.db.profile[key]
	end
	
	function optSetter(info, value)
		local key = info[#info]
		Mapster.db.profile[key] = value
		Mapster:Refresh()
	end
end

local options, moduleOptions = nil, {}
local function getOptions()
	if not options then
		options = {
			type = "group",
			name = "Mapster",
			args = {
				general = {
					order = 1,
					type = "group",
					name = L["General Settings"],
					get = optGetter,
					set = optSetter,
					args = {
						intro = {
							order = 1,
							type = "description",
							name = L["Mapster allows you to control various aspects of your World Map. You can change the style of the map, control the plugins that extend the map with new functionality, and configure different profiles for every of your characters."],
						},
						alphadesc = {
							order = 2,
							type = "description",
							name = L["You can change the transparency of the world map to allow you to continue seeing the world environment while your map is open for navigation."],
						},
						alpha = {
							order = 3,
							name = L["Alpha"],
							type = "range",
							min = 0.1, max = 1, step = 0.01,
							isPercent = true,
						},
						scaledesc = {
							order = 4,
							type = "description",
							name = L["Change the scale of the world map if you do not want the whole screen filled while the map is open."],
						},
						scale = {
							order = 5,
							name = L["Scale"],
							type = "range",
							min = 0.1, max = 1, step = 0.01,
							isPercent = true,
						},
						nl = {
							order = 10,
							type = "description",
							name = "",
						},
						arrowScale = {
							order = 11,
							name = L["PlayerArrow Scale"],
							desc = L["Adjust the size of the Player Arrow on the Map for better visibility."],
							type = "range",
							min = 0.5, max = 2, step = 0.01,
							isPercent = true,
						},
						nl2 = {
							order = 20,
							type = "description",
							name = "",
						},
						--terry@bf comment out the hide map button option
--[[						hideMapButton = {
							order = 21,
							type = "toggle",
							name = L["Hide Map Button"],
						},]]
					},
				},
			},
		}
		for k,v in pairs(moduleOptions) do
			options.args[k] = (type(v) == "function") and v() or v
		end
	end
	
	return options
end

local function optFunc() 
	-- open the profiles tab before, so the menu expands
	LibStub("AceConfigDialog-3.0"):Open("Mapster");
--	InterfaceOptionsFrame_OpenToCategory(Mapster.optionsFrames.Profiles)
--	InterfaceOptionsFrame_OpenToCategory(Mapster.optionsFrames.Mapster)
end
function Mapster:SetupOptions()
	InterfaceOptionsFrame:SetFrameStrata("DIALOG") 
	
	self.optionsFrames = {}
	
	-- setup options table
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("Mapster", getOptions)
	--self.optionsFrames.Mapster = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Mapster", nil, nil, "general")
	
	self:RegisterModuleOptions("Profiles", LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db), "Profiles")

	
end

function Mapster:RegisterModuleOptions(name, optionTbl, displayName)
	moduleOptions[name] = optionTbl
	--self.optionsFrames[name] = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Mapster", displayName, "Mapster", name)
end
function Mapster:SetupMapButton()
	-- create button on the worldmap to toggle the options
	self.optionsButton = CreateFrame("Button", "MapsterOptionsButton", WorldMapFrame, "UIPanelButtonTemplate")
	self.optionsButton:SetWidth(110)
	self.optionsButton:SetHeight(27)
	self.optionsButton:SetText(L["Mapster"])
	self.optionsButton:ClearAllPoints()
	self.optionsButton:SetPoint("TOPRIGHT", "WorldMapPositioningGuide", "TOPRIGHT", -150, -35)
--terry@bf we do not need this option to show or hide ,do we?	
--	if self.db.profile.hideMapButton or (QuestHelperWorldMapButton and QuestHelperWorldMapButton:IsShown()) then
--		self.optionsButton:Hide()
--	else
	self.optionsButton:Show()
--	end
	
	self.optionsButton:SetScript("OnClick", optFunc)
end
