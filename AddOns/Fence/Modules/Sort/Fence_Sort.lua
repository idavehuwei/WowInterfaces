-- Credits: phyber
if Fence:HasModule('Sort') then return end

local mod = Fence:NewModule("Sort")

local _G = _G
local L = AceLibrary("AceLocale-2.2"):new("Fence_Sort")
local l = AceLibrary("AceLocale-2.2"):new("Fence")

--~ Fence:RegisterDefaults('Sort', 'profile', {
--~ })

mod.db = Fence:AcquireDBNamespace("Sort")

function mod:OnInitialize()
	-- options table
	Fence.options.args.sort = {
		type = 'group',
		name = L["Sort"],
		desc = L["Adds the ability to sort by item name."],
		args = {
			toggle = {
				type = 'toggle',
				name = L["Sort"],
				desc = string.format(l["Toggles %s function."], L["Sort"]),
				get = function() return Fence:IsModuleActive("Sort") end,
				set = function(v) Fence:ToggleModuleActive("Sort", v) end
			}
		}
	}
end

function mod:OnEnable()
	self:RegisterEvent("AH_LOADED")
end

function mod:OnDisable()
	if self:IsHooked(BrowseCurrentBidSort, "SetWidth") then
		self:Unhook(BrowseCurrentBidSort, "SetWidth")
	end
end


function mod:AH_LOADED()
	self:UnregisterEvent("AH_LOADED")
	self:SecureHook(BrowseCurrentBidSort, "SetWidth", "NewSetWidth")
	-- We need this to prevent some weird shrinkage later on.
	self.BQSWidth = BrowseQualitySort:GetWidth()
	-- Add new sort tables for "buyout" and "name" sorts.
	AuctionSort["list_buyout"] = {
		{ column = "duration",	reverse = false },
		{ column = "quantity",	reverse = false },
		{ column = "name",	reverse = false },
		{ column = "level",	reverse = true },
		{ column = "quality",	reverse = false },
		{ column = "bid",	reverse = false },
		{ column = "buyout",	reverse = false },
	}
	AuctionSort["list_name"] = {
		{ column = "duration",	reverse = false },
		{ column = "quantity",	reverse = false },
		{ column = "level",	reverse = true },
		{ column = "bid",	reverse = false },
		{ column = "buyout",	reverse = false },
		{ column = "quality",	reverse = false },
		{ column = "name",	reverse = false },
	}

	-- Make the buttons.
	local BrowseBuyoutSort = CreateFrame("Button", "BrowseBuyoutSort", AuctionFrameBrowse, "AuctionSortButtonTemplate")
	BrowseBuyoutSort:SetWidth(95)
	BrowseBuyoutSort:SetHeight(19)
	BrowseBuyoutSort:SetText(BUYOUT_PRICE)
	BrowseBuyoutSort:SetScript("OnClick", function()
		AuctionFrame_OnClickSortColumn("list", "buyout")
		self:UpdateArrow(BrowseBuyoutSort, "list", "buyout")
	end)

	local BrowseNameSort = CreateFrame("Button", "BrowseNameSort", AuctionFrameBrowse, "AuctionSortButtonTemplate")
	BrowseNameSort:SetWidth(95)
	BrowseNameSort:SetHeight(19)
	BrowseNameSort:SetText(NAME)
	BrowseNameSort:SetScript("OnClick", function()
		AuctionFrame_OnClickSortColumn("list", "name")
		self:UpdateArrow(BrowseNameSort, "list", "name")
	end)

		BrowseBuyoutSort:ClearAllPoints()
	BrowseBuyoutSort:SetPoint("LEFT", "BrowseCurrentBidSort", "RIGHT", -2, 0)
	BrowseBuyoutSort:Show()

	BrowseNameSort:ClearAllPoints()
	BrowseNameSort:SetPoint("TOPLEFT", "AuctionFrameBrowse", "TOPLEFT", 186, -82)
	BrowseNameSort:Show()

	BrowseQualitySort:ClearAllPoints()
	BrowseQualitySort:SetPoint("LEFT", "BrowseNameSort", "RIGHT", -2, 0)
	BrowseQualitySort:SetWidth(self.BQSWidth)
	BrowseQualitySort:SetWidth(BrowseQualitySort:GetWidth() - BrowseNameSort:GetWidth())
	BrowseQualitySort:Show()

	self:NewSetWidth(nil, 207)
end

function mod:NewSetWidth(obj, width)
	if width >= 180 then
		width = width - BrowseBuyoutSort:GetWidth() + 2
	end

	-- Unhook before we set the new width, we don't want to create a pime taradox.
	if self:IsHooked(BrowseCurrentBidSort, "SetWidth") then
		self:Unhook(BrowseCurrentBidSort, "SetWidth")
	end

	-- Set the new width
	BrowseCurrentBidSort:SetWidth(width)

	-- Hook it again
	if not self:IsHooked(BrowseCurrentBidSort, "SetWidth") then
		self:SecureHook(BrowseCurrentBidSort, "SetWidth", "NewSetWidth")
	end
end

function mod:UpdateArrow(button, type, sort)
	if not IsAuctionSortReversed(type, sort) then
		_G[button:GetName().."Arrow"]:SetTexCoord(0, 0.5625, 1.0, 0)
	else
		_G[button:GetName().."Arrow"]:SetTexCoord(0, 0.5625, 0, 1.0)
	end
end
