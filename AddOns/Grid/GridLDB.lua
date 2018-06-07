--[[--------------------------------------------------------------------
	GridLDB.lua
	Creates a DataBroker launcher for Grid.
----------------------------------------------------------------------]]

local L = AceLibrary("AceLocale-2.2"):new("Grid")

local DataBroker = LibStub("LibDataBroker-1.1", true)
if not DataBroker then return end

local Dewdrop = AceLibrary:HasInstance("Dewdrop-2.0") and AceLibrary("Dewdrop-2.0")
if not Dewdrop then return end

local Waterfall = AceLibrary:HasInstance("Waterfall-1.0") and AceLibrary("Waterfall-1.0")

local GridBroker = DataBroker:NewDataObject("Grid", {
	type = "launcher",
	label = GetAddOnInfo("Grid", "Title"),
	icon = "Interface\\AddOns\\Grid\\icon",
})

function GridBroker:OnClick(button)
	--if button == "RightButton" then
		--Dewdrop:Open(self, "children", function() Dewdrop:FeedAceOptionsTable(Grid.options) end)
	if Waterfall then
		if Waterfall:IsOpen(L["Grid"]) then
			Waterfall:Close(L["Grid"])
		else
			Waterfall:Open(L["Grid"])
		end
	end
end

function GridBroker:OnTooltipShow()
	self:AddLine(L["Grid"])
	if Waterfall then
		self:AddLine(L["Click to open the options in a GUI window."], 0.2, 1, 0.2, 1)
	end
	self:AddLine(L["Right-Click to open the options in a drop-down menu."], 0.2, 1, 0.2, 1)
end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function()
	local LDBIcon = LibStub("LibDBIcon-1.0", true)
	if LDBIcon then
		LDBIcon:Register("Grid", GridBroker, Grid.db.profile.minimap)

		Grid.options.args["minimap"] = {
			order = -3,
			name = L["Hide minimap icon"],
			desc = L["Hide minimap icon"],
			type = "toggle",
			get = function()
				return Grid.db.profile.minimap.hide
			end,
			set = function()
				if Grid.db.profile.minimap.hide then
					LDBIcon:Show(L["Grid"])
					Grid.db.profile.minimap.hide = nil
				else
					LDBIcon:Hide(L["Grid"])
					Grid.db.profile.minimap.hide = true
				end
			end
		}

		hooksecurefunc(Grid, "OnProfileEnable", function()
			LDBIcon[Grid.db.profile.minimap.hide and "Hide" or "Show"](LDBIcon, "Grid")
		end)
	end
	f:UnregisterAllEvents()
	f:SetScript("OnEvent", nil)
end)
f:RegisterEvent("PLAYER_LOGIN")