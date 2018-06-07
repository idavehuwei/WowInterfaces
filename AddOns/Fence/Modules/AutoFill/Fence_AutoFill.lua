if Fence:HasModule('AutoFill') then return end

local L = AceLibrary("AceLocale-2.2"):new("Fence_AutoFill")
local l = AceLibrary("AceLocale-2.2"):new("Fence")

local mod = Fence:NewModule("AutoFill")
Fence:RegisterDefaults('AutoFill', 'profile', {
	Prices = {},
	LastDuration = 2,
	Duration = 2,
	Markup = 1.5,
	AutoBuy = true,
	Last = true,
})

mod.db = Fence:AcquireDBNamespace("AutoFill")
--[[
local II_SEARCH_CHECKED;
local II_MAX_SAVE_R = 30;
local function SaveSearchName_ListSelect(self, name)	
	if(name and type(name) == "string") then		
		BrowseName:SetText(name);		
		BrowseName:HighlightText(0,-1);
	end
end

local function II_SearchReMoveName()
	if (II_SEARCH_CHECKED) then	
		print(format(L["|cff00ff00[%s]|r has been removed from query list."], ItemInfo_Config.rname[II_SEARCH_CHECKED]));
		tremove(mod.db.profile.BlackBook, II_SEARCH_CHECKED);	
		BrowseName:SetText("");	
	end
end

local function II_SearchAddName(self, name)
	tinsert(mod.db.profile.BlackBook, name);	
	print(format(L["|cff00ff00[%s]|r has been removed from query list."], name));
end

local function II_SearchGetName(name)
	if (not name) then
		return nil;
	end
	for key ,value in ipairs(mod.db.profile.BlackBook) do
		if (value == name) then
			return key;			
		end
	end
	return nil;
end

function SaveSearchName_DropDown_Initialize()
	local info = {value = 0, notCheckable = 1};
	local name = BrowseName:GetText();
	local full = nil;
	if (name and name ~= "") then
		II_SEARCH_CHECKED = II_SearchGetName(name);
		if (II_SEARCH_CHECKED) then		
			info.func = II_SearchReMoveName;
			info.text = format(L["|cffff0000Remove|r %s"], name);
		elseif (#(mod.db.profile.BlackBook) < II_MAX_SAVE_R ) then			
			info.func = II_SearchAddName;
			info.arg1 = name;
			info.text = format(L["|cff00ff00Add|r %s"], name);
		else
			full = 1;
		end

		if (not full) then			
			UIDropDownMenu_AddButton(info); 
		end
	end

	for key, name in ipairs(mod.db.profile.BlackBook) do
		info = {text=name, arg1 =name, value=key, func = SaveSearchName_ListSelect};	
		if (key == II_SEARCH_CHECKED) then
			info.checked = 1;
		end
		UIDropDownMenu_AddButton(info);
	end	
end

function Fence_CreateBlackBookButton()
	-- 创建保存名字的DropDown
	local dropdown = CreateFrame("Frame", "SaveSearchName_DropDown", BrowseName, "UIDropDownMenuTemplate"); 
	local ddbutton = dwGetglobal(dropdown:GetName() .. "Button");
	dropdown:SetID(1);
	dropdown:SetPoint("LEFT", BrowseName, "LEFT", 13, -3);	
	dropdown:SetScript("OnShow", function (self)
		UIDropDownMenu_Initialize(self, SaveSearchName_DropDown_Initialize, "MENU");
		dwGetglobal(dropdown:GetName().."ButtonNormalTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up");		
		dwGetglobal(dropdown:GetName().."ButtonDisabledTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled");			
		dwGetglobal(dropdown:GetName().."ButtonPushedTexture"):SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down");			
		dwGetglobal(dropdown:GetName().."ButtonHighlightTexture"):SetTexture("Interface\\Buttons\\UI-Common-MouseHilight");		
		UIDropDownMenu_SetSelectedValue(BrowseDropDown,-1);
	end);
	ddbutton:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(ddbutton, "ANCHOR_RIGHT");
		--GameTooltip:AddLine(L["Click to select item to query"]);
		GameTooltip:Show();
	end);
	ddbutton:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
	end);
end
]]
function mod:OnInitialize()
	self:SetDebugging(false)

	Fence.options.args.autofill = {
		type = 'group',
		name = L["Auto-Fill"], aliases = "af",
		desc = L["Auto-Fill - automatically inserts known auction prices"],
		args = {
			toggle = {
				type = 'toggle',
				name = L["Auto-Fill"],
				desc = string.format(l["Toggles %s function."], L["Auto-Fill"]),
				get = function() return Fence:IsModuleActive("AutoFill") end,
				set = function(v) Fence:ToggleModuleActive("AutoFill", v) end
			},
			duration = {
				type = 'text',
				name = L["Duration"], aliases = "dur",
				desc = L["Sets default auction runtime."],
				usage = L["Type in 12, 24 or 48"],
				message = L["%s now set to %s hours."],
				get	= function() return self.db.profile.Duration end,
				set =	function(v) self.db.profile.Duration = v end,
				validate = {"12", "24", "48"}
			},
			last = {
				type = 'toggle',
				name = L["Auction Runtime"],
				desc = L["Remembers last used auction runtime."],
				get	= function() return self.db.profile.Last end,
				set =	function(v) self.db.profile.Last = v end
			},
			autosearch = {
				type = 'toggle', aliases = "as",
				name = L["Auto-Search"],
				desc = L["Performs auto-search on items you want to sell."],
				get	= function() return self.db.profile.AutoSearch end,
				set =	function(v) self.db.profile.AutoSearch = v end
			},
			autobuyout = {
				type = 'group',
				name = L["Auto-Buyout"], aliases = "ab",
				desc = L["Auto-fills buyout * customized markup if no price informations are available."],
				args = {
					toggle = {
						type = 'toggle',
						name = L["Auto-Buyout"],
						desc = string.format(l["Toggles %s function."], L["Auto-Buyout"]),
						get	= function() return self.db.profile.AutoBuy end,
						set =	function(v) self.db.profile.AutoBuy = v end
					},
					markup = {
						type = 'range', aliases = "mu",
						name = L["Markup"],
						desc = L["Sets markup for auto-buy function."],
						get	= function() return self.db.profile.Markup end,
						set =	function(v) self.db.profile.Markup = v end,
						min = 1,
						max = 100
					}
				}
			}
		}
	}
end

function mod:OnEnable()
	if IsAddOnLoaded("Blizzard_AuctionUI") and AuctionFrame:IsVisible() then
		self:AH_LOADED()
	end
	self:RegisterEvent("AH_LOADED")
end

function mod:AH_LOADED()	
 	if self:IsEventRegistered("AH_LOADED") then
		self:UnregisterEvent("AH_LOADED")
	end
	self:Hook("StartAuction", true)	
	self:SecureHookScript(AuctionsStackSizeEntry, "OnTextChanged");
	self:RegisterEvent("NEW_AUCTION_UPDATE")
	self:RegisterEvent("AUCTION_OWNED_LIST_UPDATE")
	self:RegisterEvent("AUCTION_HOUSE_CLOSED", "AH_CLOSED")
end

function mod:AH_CLOSED()
	self:UnregisterEvent("AUCTION_HOUSE_CLOSED")
	if self:IsHooked("StartAuction") then
		self:Unhook("StartAuction")
	end
  
	if (self:IsHooked(AuctionsStackSizeEntry, "OnTextChanged")) then
		self:Unhook(AuctionsStackSizeEntry, "OnTextChanged");
	end
	self:UnregisterEvent("NEW_AUCTION_UPDATE")
	self:UnregisterEvent("AUCTION_OWNED_LIST_UPDATE")
	self:RegisterEvent("AH_LOADED")
end

function mod:OnTextChanged()
	self:NEW_AUCTION_UPDATE();
end

function mod:AUCTION_OWNED_LIST_UPDATE() -- check & update auction runtime
	local dur
	if self.db.profile.Last then
		dur = self.db.profile.LastDuration or (self.db.profile.Duration);
	else 
		dur = tonumber(self.db.profile.Duration) or 2;
	end

	AuctionFrameAuctions.duration = 2;	
	UIDropDownMenu_SetSelectedValue(DurationDropDown, AuctionFrameAuctions.duration);
	UpdateDeposit();
	return
end

function mod:NEW_AUCTION_UPDATE() -- read data when auction is being updated
	self:ScheduleEvent(function()
		local name = GetAuctionSellItemInfo();
		
		if not name then
			self:Debug("NEW_AUCTION_UPDATE(): No name found.")
			return 
		end
		
		local startPrice = MoneyInputFrame_GetCopper(StartPrice)		
		
		local link = select(2, GetItemInfo(name));
		local data = tostring(self:CreateData(link));
		
		self:Debug("NEW_AUCTION_UPDATE(): Data = ", data)
		
		local db = self.db.profile.Prices[data]
		self:Debug("db = ", db)
		if not db then
			local scan = Fence:GetModule('Scan');
			if (scan) then
				local price, pCount, bidPrice, bidCount, buyoutPrice, buyoutCount = scan:GetItemInfo(data);
				if (pCount and pCount > 0 and buyoutCount and buyoutCount > 0) then
					local unitPrice, unitBuyOut = price / pCount, buyoutPrice / buyoutCount;
					if (AuctionFrameAuctions.priceType == 2) then
						local count = AuctionsStackSizeEntry:GetNumber() or select(2, GetAuctionSellItemInfo());
						MoneyInputFrame_SetCopper(StartPrice, unitPrice * count);
						MoneyInputFrame_SetCopper(BuyoutPrice, unitBuyOut * count);
					else
						MoneyInputFrame_SetCopper(StartPrice, unitPrice);
						MoneyInputFrame_SetCopper(BuyoutPrice, unitBuyOut);
					end
					return;
				end
			end
			if self.db.profile.AutoBuy then 
				MoneyInputFrame_SetCopper(BuyoutPrice, max(100, floor(startPrice * self.db.profile.Markup))) 
				return
			end
			return;
		else
			local s,b = strsplit(":", db)
			self:Debug("NEW_AUCTION_UPDATE(): StartPrice = ",s,"|BuyoutPrice = ",b)	
			if (AuctionFrameAuctions.priceType == 2) then
				local count = AuctionsStackSizeEntry:GetNumber() or select(2, GetAuctionSellItemInfo());
				MoneyInputFrame_SetCopper(StartPrice, s * count);
				MoneyInputFrame_SetCopper(BuyoutPrice, b * count);
			else
				MoneyInputFrame_SetCopper(StartPrice, s);
				MoneyInputFrame_SetCopper(BuyoutPrice, b);
			end
			
			return
		end
	end, 0.1)
end

function mod:StartAuction(start, buyout, duration, stackSize, numStacks) -- start auction & save data	
	local name = GetAuctionSellItemInfo();
	if (name) then
		local link = select(2, GetItemInfo(name));
		local data = tostring(self:CreateData(link));
		self:Debug("StartAuction(): Data = ", data);
				
		self.db.profile.Prices[data] = floor(tonumber(start/stackSize))..":"..floor(tonumber(buyout/stackSize))
		
		if self.db.profile.Last then
			self.db.profile.LastDuration = duration;
		end
	end	
	
	self.hooks["StartAuction"](start, buyout, duration, stackSize, numStacks)  
end

function mod:LinkSplit(iLink) -- split link to itemID & suffixID
	self:Debug("LinkSplit: ",iLink)	

	local _,_,itemID = string.find(iLink, "item:(%d+):")

	self.itemID = itemID;
	return self.itemID or 0;
end

function mod:CreateData(iLink)
	return self:LinkSplit(iLink);
end

 --[[
function mod:ClickAuction(bag, item, shiftclick) -- Alt-Click from Clicks module
	self:Debug("ClickAuction(): bag, item = ", bag, item)
	PickupContainerItem(bag, item)
	local iLink = GetContainerItemLink(bag, item)
	ClickAuctionSellItemButton()
	if shiftclick then 
		StartAuction(MoneyInputFrame_GetCopper(StartPrice), MoneyInputFrame_GetCopper(BuyoutPrice), AuctionFrameAuctions.duration)
		if not AuctionFrameAuctions:IsVisible() then
			AuctionFrameTab3:Click()
		end
		return
	end
	if not self.db.profile.AutoSearch then 
		if not AuctionFrameAuctions:IsVisible() then
			AuctionFrameTab3:Click()
		end
	elseif self.db.profile.AutoSearch and Fence:HasModule('Search') and Fence:IsModuleActive('Search') then
		Fence:GetModule('Search'):Search(iLink)
	end
end
]]
