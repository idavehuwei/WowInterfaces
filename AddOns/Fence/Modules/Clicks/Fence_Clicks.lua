if Fence:HasModule('Clicks') then return end

local L = AceLibrary("AceLocale-2.2"):new("Fence_Clicks")
local l = AceLibrary("AceLocale-2.2"):new("Fence")

local mod = Fence:NewModule("Clicks")
Fence:RegisterDefaults('Clicks', 'profile', {
	['*'] = true
})

mod.db = Fence:AcquireDBNamespace("Clicks")

function mod:OnInitialize()
	Fence.options.args.clicks = {
		type = 'group',
		name = L["Clicks"],
		desc = L["Toggle click options for all available modules."],
		args = {
			toggle = {
				type = 'toggle',
				name = L["Clicks"],
				desc = string.format(l["Toggles %s function."], L["Clicks"]),
				get = function() return Fence:IsModuleActive("Clicks") end,
				set = function(v) Fence:ToggleModuleActive("Clicks", v) end
			},
			fill = {
				hidden = function() return not self:ModCheck('AutoFill') end,
				type = 'toggle',
				name = L["Fill"],
				desc = string.format(l["Toggles %s function."], L["Fill"]),
				get = function() return self.db.profile.Fill end,
				set = function(v) self.db.profile.Fill = v end
			},
			search = {
				hidden = function() return not self:ModCheck('Search') end,
				type = 'toggle',
				name = L["Search"],
				desc = string.format(l["Toggles %s function."], L["Search"]),
				get = function() return self.db.profile.Search end,
				set = function(v) self.db.profile.Search = v end
			},
			split = {
				type = 'toggle',
				name = L["Split"],
				desc = string.format(l["Toggles %s function."], L["Split"]),
				get = function() return self.db.profile.Split end,
				set = function(v) self.db.profile.Split = v end
			},
			trade = {
				type = 'toggle',
				name = L["Trade"],
				desc = string.format(l["Toggles %s function."], L["Trade"]),
				get = function() return self.db.profile.Trade end,
				set = function(v) self.db.profile.Trade = v end
			},
		}
	}
end

function Fence_ContainerItemPreClick(self, button) 
	 if(button=="RightButton" and not IsModifierKeyDown()) then
		local bag, item = self:GetParent():GetID(), self:GetID();
		--[[
		if not CursorHasItem() and GetContainerItemLink(bag, item) then	
			local itemLink = GetContainerItemLink(bag, item);
			local itemName = GetItemInfo(itemLink);
			if (BrowseName and BrowseName:IsVisible()) then		
				BrowseName:SetText(itemName);
				Fence:GetModule('Search'):Search(GetContainerItemLink(bag, item));	
				return;
			elseif (AuctionFrameBuy and AuctionFrameBuy:IsVisible()) then
				BuyName:SetText(itemName);
				AuctionLite:AuctionFrameBuy_Search(itemName);
				return;
			end			
		end
		]]
		local texture, itemCount, locked, quality, readable = GetContainerItemInfo(bag, item);
		if (AuctionFrame and AuctionFrame:IsVisible() and texture and not locked) then			
			if(AuctionsItemButton and AuctionsItemButton:IsVisible()) then
				AuctionFrameTab_OnClick(AuctionFrameTab3);
			else
				AuctionFrameTab_OnClick(AuctionFrameTab5);
			end
			if ((AuctionsItemButton and AuctionsItemButton:IsVisible()) or (SellItemButton and SellItemButton:IsVisible())) then
				PickupContainerItem(bag, item);
				ClickAuctionSellItemButton();
				AuctionsFrameAuctions_ValidateAuction();	
			end			
		end
	 end
end

function mod:OnEnable()
	local f,myi;
	myi=1;
	for i = 1, NUM_CONTAINER_FRAMES do 
		for j = 1, MAX_CONTAINER_ITEMS do 			
			f = dwGetglobal("ContainerFrame"..i.."Item"..j); 
			if(f) then 
				f:SetScript("PreClick", Fence_ContainerItemPreClick);
			end
		end
	end 

	self:SecureHook("ContainerFrameItemButton_OnEnter")
	self:SecureHook("ContainerFrameItemButton_OnModifiedClick")
end

function mod:OnDisable()

	if self:IsHooked("ContainerFrameItemButton_OnEnter") then
		self:Unhook("ContainerFrameItemButton_OnEnter")
	end

	if self:IsHooked("ContainerFrameItemButton_OnModifiedClick") then
		self:Unhook("ContainerFrameItemButton_OnModifiedClick")
	end
end

function mod:ModCheck(mod)
	if Fence:HasModule(mod) and Fence:IsModuleActive(mod) then
		return true
	end
end
--[[
/script print(BrowseNameSort:IsVisible());	第1页
/script print(BidQualitySort:IsVisible());	第2页
/script print(AuctionsQualitySort:IsVisible());	第3页
/script print(AuctionFrame:IsVisible());	拍卖行是否打开
--]]
function mod:ContainerFrameItemButton_OnEnter(self)	
	if ((BrowseNameSort and BrowseNameSort:IsVisible()) or (AuctionFrameBuy and AuctionFrameBuy:IsVisible()))  then
		GameTooltip:AddLine(" ", 0.0, 0.6, 0.8);
		GameTooltip:AddLine(L["QuickSearch"], 0.0, 0.6, 0.8);
		GameTooltip:Show();
	elseif (AuctionsQualitySort and AuctionsQualitySort:IsVisible() or (AuctionFrameSell and AuctionFrameSell:IsVisible())) then
		GameTooltip:AddLine(" ", 0.0, 0.6, 0.8);
		GameTooltip:AddLine(L["QuickLeft"], 0.0, 0.6, 0.8);
		GameTooltip:Show();
	end	
end

function mod:ContainerFrameItemButton_OnModifiedClick(this, ...)
	local button = ...
	local bag, item = this:GetParent():GetID(), this:GetID()

	if not CursorHasItem() and GetContainerItemLink(bag, item) then
		if AuctionFrame and AuctionFrame:IsVisible() then			
			if button == "LeftButton" and IsShiftKeyDown() and self:ModCheck('Search') and self.db.profile.Search then 
				if (rowseNameSort and BrowseNameSort:IsVisible()) then
					Fence:GetModule('Search'):Search(GetContainerItemLink(bag, item));					
				elseif (AuctionFrameBuy and AuctionFrameBuy:IsVisible()) then
					local itemLink = GetContainerItemLink(bag, item);
					local itemName = GetItemInfo(itemLink);
					AuctionLite:AuctionFrameBuy_Search(itemName);
				end				
			end
		elseif button == "RightButton" then 
			if IsAltKeyDown() and self.db.profile.Split then
				self:Splitter(bag, item, 1)
			end
			if IsControlKeyDown() and self.db.profile.Split then
				self:Splitter(bag, item)
			end
		end
		
	end	
end

function mod:Splitter(bag, item, amount)
	if not amount then 
		local _, count =  GetContainerItemInfo(bag, item)
		amount = floor(count / 2)
	end
	SplitContainerItem(bag, item, amount)
	for Bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(Bag) do
			if not GetContainerItemLink(Bag, slot) then
				PickupContainerItem(Bag, slot)
				return
			end
		end
	end
end
