-------------------------------------------------------------------------------
-- Fence_Scan ver 1.0
-- 日期: 2010-6-3
-- 作者: dugu@bigfoot
-- 描述: 扫描分析拍卖行数据并添加提示信息
-- 版权所有 (c) duowan.com
-------------------------------------------------------------------------------
if Fence:HasModule('Scan') then return end
FENCE_SCAN_ITEMINFO = {};	 -- 存储拍卖行物品信息
FENCE_SCAN_LAST_TIME = false;
local mod = Fence:NewModule("Scan");
local L = LibStub("AceLocale-3.0"):GetLocale("Fence_Scan");
mod._DEBUG = false;
mod.DelayCallStack = {};
mod.enable = false;
mod.ScaningInfo = {bidCount = 0, ItemCount = 0};
mod.bidCheck = 100000;

StaticPopupDialogs["BID_AUCTION"] = { 
	text = L["Confirmation"], 
	button1 = ACCEPT, 
	button2 = CANCEL, 
	OnAccept = function(self) 
		PlaceAuctionBid("list", GetSelectedAuctionItem("list"), 
		MoneyInputFrame_GetCopper(BrowseBidPrice));
		--MoneyInputFrame_GetCopper(BrowseBidPrice); 
	end, 
	OnShow = function(self) 
		MoneyFrame_Update(self:GetName().."MoneyFrame", MoneyInputFrame_GetCopper(BrowseBidPrice)); 
	end, 
	hasMoneyFrame = 1, 
	showAlert = 1, 
	timeout = 0, 
	exclusive = 1, 
	hideOnEscape = 1 
};

StaticPopupDialogs["CLEAR_AUCTION_INFOMATION"] = {
	text = L["All information about auction items will be cleared, Are you sure?"],
	button1 = ACCEPT,
	button2 = CANCEL, 
	OnAccept = function(self) 
		FENCE_SCAN_ITEMINFO = {};
		mod.ItemInfo = {};
		mod:print(L["Fence: Clear auction data sucess"]);
	end, 
	showAlert = 1,
	timeout = 0, 
	exclusive = 1,
	hideOnEscape = 1 
};
function mod:OnInitialize()
	local frame = CreateFrame("Frame");
	frame:SetScript("OnUpdate", function(frame, elapsed)
		for name,  v in pairs(self.DelayCallStack) do
			v._T = v._T + elapsed;
			if (type(v[1]) == "function" and v._T > v[2]) then				
				v[1](unpack(v[3]));
				self.DelayCallStack[name] = nil;
			end
		end
	end);
	
	self.ItemInfo = FENCE_SCAN_ITEMINFO;
	self:RegisterEvent("ADDON_LOADED");
	GameTooltip:HookScript("OnTooltipSetItem", function(frame, ...) self:AddTooltipInfo(frame, ...) end);
	ItemRefTooltip:HookScript("OnTooltipSetItem", function(frame, ...) self:AddTooltipInfo(frame, ...) end);	
end

function mod:OnEnable()
	
	if (_G["Fence_ScanButton"] and not _G["Fence_ScanButton"]:IsShown() and _G["Fence_ScanButton"].customHide) then
		_G["Fence_ScanButton"]:Show();
	end
	if (_G["Fence_ScanButton"] and not _G["Fence_ScanButton"]:IsShown() and _G["Fence_CenterButton"].customHide) then
		_G["Fence_ScanButton"]:Hide();
		_G["Fence_ScanButton"].customHide = true;
	end	
end

function mod:OnDisable()	
	if (_G["Fence_CenterButton"] and _G["Fence_CenterButton"]:IsShown()) then
		_G["Fence_CenterButton"]:Hide();
		_G["Fence_CenterButton"].customHide = true;
	end
	if (_G["Fence_ScanButton"] and _G["Fence_ScanButton"]:IsShown()) then
		_G["Fence_ScanButton"]:Hide();
		_G["Fence_ScanButton"].customHide = true;
	end	
end

function mod:print(msg, ...)
	print(format(msg, ...));
end

function mod:debug(msg, ...)
	if (self._DEBUG) then
		self:print(msg, ...);
	end
end

function mod:ADDON_LOADED(addon)	
	if (addon == "Blizzard_AuctionUI") then
		if (not _G["Fence_CenterButton"]) then
			self:CreateFrames();
		end
		AuctionFrame:HookScript("OnShow", function(frame) mod:AuctionFrame_OnShow(frame) end);
		hooksecurefunc("QueryAuctionItems", function()
			if (_G["Fence_CenterButton"] and _G["Fence_CenterButton"]:IsShown()) then
				 _G["Fence_CenterButton"]:Hide();			
			end
		end);
		hooksecurefunc("CloseAuctionHouse", function(...) mod:QueryAuction(true) end);
		self:UnregisterEvent("ADDON_LOADED");
	end
end

function mod:AuctionFrame_OnShow(frame)
	if (self.enable) then
		self:CreateFrames();
		local button = _G["Fence_CenterButton"];
		local weekday, month, day, year = CalendarGetDate();
		local curTime = tonumber(format("%04d%02d%02d", year, month, day));
		-- 一周未掃描會顯示掃描按鍵
		if (FENCE_SCAN_ITEMINFO == {} or (self._DEBUG or type(FENCE_SCAN_LAST_TIME) ~= "number" or curTime - FENCE_SCAN_LAST_TIME > 1)) then
			button:Show();
			FENCE_SCAN_LAST_TIME = curTime;
		else
			_G["Fence_ScanButton"]:Show();
		end
	end	
end

function mod:CreateFrames()
	-- 扫描按键
	if (not _G["Fence_ScanButton"]) then	
		local button = CreateFrame("Button", "Fence_ScanButton", AuctionFrameBrowse, "UIPanelButtonTemplate");
		button.timer = 0;
		button:SetWidth(80); button:SetHeight(22);
		button:ClearAllPoints();
		button:SetPoint("BOTTOM", AuctionFrameBrowse, "BOTTOM", -156, 14);
		button:SetText(L["Scan"]);
		button:SetScript("OnClick", function(self)
			mod:ScanAution();
		end);
		button:SetScript("OnUpdate", function(self, elapsed)
			self.timer = self.timer + elapsed;
			if (self.timer > 0.2) then
				self.timer = 0;
				if (CanSendAuctionQuery() and not mod.isScaning) then
					self:Enable();
				else
					self:Disable();
				end
			end
		end);
		button:Hide();
		-- 创建中心扫描按键
		local CenterButton = CreateFrame("Button", "Fence_CenterButton", AuctionFrameBrowse, "UIPanelButtonTemplate2");
		CenterButton:SetWidth(128);
		CenterButton:SetHeight(42);
		CenterButton:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 425, -225);
		CenterButton.frame = CreateFrame("Frame", nil, CenterButton);
		CenterButton.frame:SetAllPoints(CenterButton);
		CenterButton.frame.text = CenterButton.frame:CreateFontString(nil, "OVERLAY");
		CenterButton.frame.text:SetFont(STANDARD_TEXT_FONT, 24,"OUTLINE");
		CenterButton.frame.text:SetJustifyH("CENTER");
		CenterButton.frame.text:SetJustifyV("MIDDLE");
		CenterButton.frame.text:SetPoint("TOPLEFT", CenterButton, "TOPLEFT", 0, 0);
		CenterButton.frame.text:SetPoint("BOTTOMRIGHT", CenterButton, "BOTTOMRIGHT", 0, 0);	-- 26
		CenterButton.frame.text:SetText(L["Scan"]);
		CenterButton.frame.text:SetTextColor(0.82, 0.82, 0.82);
		
		CenterButton:SetScript("OnClick", function(self)
			mod:ScanAution();
			self:Hide();
		end);
		CenterButton:Hide();
		CenterButton:SetScript("OnHide", function()
			button:Show();
		end);

		-- 拍卖确认对话框
		local bidButton = CreateFrame("Button", "FenceBidButton", AuctionFrameBrowse, "UIPanelButtonTemplate"); 
		bidButton:SetWidth(80); 
		bidButton:SetHeight(22); 
		bidButton:SetText(BID); 
		bidButton:SetPoint("CENTER", BrowseBidButton ,"CENTER", 0, 0); 
		bidButton:SetScript("OnClick", function()
			if (MoneyInputFrame_GetCopper(BrowseBidPrice) > self.bidCheck) then 
				StaticPopup_Show("BID_AUCTION"); 
			else
				PlaceAuctionBid("list", GetSelectedAuctionItem("list"), MoneyInputFrame_GetCopper(BrowseBidPrice)); 
			end
		end); 
		
		_G["BrowseBidButton"]:Hide(); 

		-- 进度提示框架
		self.frame = CreateFrame("Frame", "Fence_ScanProgressFrame", AuctionFrameBrowse);
		self.frame:SetWidth(256); self.frame:SetHeight(128);
		self.frame:SetPoint("TOPLEFT", AuctionFrame, "TOPLEFT", 354, -188);
		
		self.frame.icon = self.frame:CreateTexture(nil, "ARTWORK");
		self.frame.icon:SetWidth(32);
		self.frame.icon:SetHeight(32);
		self.frame.icon:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 75, -15);

		self.frame.text = self.frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
		self.frame.text:SetPoint("LEFT", self.frame.icon, "RIGHT", 10, 0);
		self.frame.text:SetJustifyH("LEFT");

		self.frame.bar = CreateFrame("StatusBar", nil, self.frame);
		self.frame.bar:SetWidth(256);
		self.frame.bar:SetHeight(14);
		self.frame.bar:SetPoint("TOPLEFT", self.frame, "TOPLEFT", 0, -63);
		self.frame.bar:SetStatusBarTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-Bar");
		self.frame.bar:SetStatusBarColor(0, 0.64, 1.0);
		self.frame.bar.border = self.frame.bar:CreateTexture(nil, "OVERLAY");
		self.frame.bar.border:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-Skills-BarBorderHighlight");
		self.frame.bar.border:SetWidth(264);
		self.frame.bar.border:SetHeight(32);
		self.frame.bar.border:SetPoint("TOPLEFT", self.frame.bar, "TOPLEFT", -4, 8);
		self.frame.bar.page = self.frame.bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
		self.frame.bar.page:SetPoint("CENTER", self.frame.bar, "CENTER", 0, 0);
		self.frame.bar.page:SetJustifyH("CENTER");
		self.frame:Hide();
	end
end

function mod:UpdateProgress()	
	if (self.frame and self.totalPage and self.curPage and self.curPage <= self.totalPage) then
		if (not self.frame:IsShown()) then
			self.frame:Show();
		end
		self.frame.bar:SetMinMaxValues(1, self.totalPage);
		self.frame.bar:SetValue(self.curPage);
		self.frame.bar.page:SetFormattedText("%d / %d".. L["page"], self.curPage, self.totalPage);
	end
end

function mod:UpdateScaningItem(texture, link)
	if (self.frame) then
		self.frame.icon:SetTexture(texture);
		self.frame.text:SetText(link);
	end
end

function mod:GetItemID(link)	
	assert(type(link) == "string", "GetItemID function need a itemLink arg1");

	local id = strmatch(link, "|Hitem:(%d+)");
	return id;
end

function mod:GetItemInfo(itemID)
	if (self.ItemInfo[itemID]) then
		return self.ItemInfo[itemID][1], self.ItemInfo[itemID][2], self.ItemInfo[itemID][3], self.ItemInfo[itemID][4], self.ItemInfo[itemID][5], self.ItemInfo[itemID][6];
	end
	return nil;
end

function mod:ScanAution()
	self:debug("ScanAution")
	local canQuery, CanQueryAll = CanSendAuctionQuery();
	self.curPage = 0;
	if (canQuery and not self.isScaning) then
		for i=1, NUM_BROWSE_TO_DISPLAY do
			_G["BrowseButton" .. i]:Hide();
		end
		QueryAuctionItems(nil, nil, nil, nil, nil, nil, self.curPage, nil, nil);
		self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
		AuctionFrameBrowse:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE");
		self.isScaning = true;

		table.wipe(self.ScaningInfo);
	end
end

function mod:QueryAuction(close)
	local canQuery, CanQueryAll = CanSendAuctionQuery();
	if (AuctionFrame:IsShown() and not close) then
		if (canQuery) then
			self.curPage = self.curPage + 1;
			self.isScaning = true;
			self:debug("QueryAuction %d / %d", self.curPage, self.totalPage);
			self:UpdateProgress();
			self:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
			QueryAuctionItems(nil, nil, nil, nil, nil, nil, self.curPage, nil, nil);			
		else
			self:debug("DelayCall QueryAuction");
			self:DelayCall("QueryAuction", 1, self);		
		end
		return true;
	else
		self.isScaning = false;
		self:debug("AuctionFrame Close");
		self.frame:Hide();
		self:ClearDelayCall("QueryAuction");
		if (self:IsEventRegistered("AUCTION_ITEM_LIST_UPDATE")) then
			self:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE");
		end
		AuctionFrameBrowse:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
		return false;
	end
end

function mod:AUCTION_ITEM_LIST_UPDATE()
	local batch, total = GetNumAuctionItems("list");
	local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner, saleStatus;
	local itemLink, itemID;
	self.totalPage = floor(total / NUM_AUCTION_ITEMS_PER_PAGE + 0.5);	
	-- 刷新进度条范围
	self:UpdateProgress();
	-- 扫描
	self:UnregisterEvent("AUCTION_ITEM_LIST_UPDATE");
	self:ClearDelayCall("QueryAuction");
	for i=1, NUM_AUCTION_ITEMS_PER_PAGE do
		name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner, saleStatus = GetAuctionItemInfo("list", i);
		itemLink = GetAuctionItemLink("list", i);
		if (name and itemLink and (self.curPage*NUM_AUCTION_ITEMS_PER_PAGE <= total)) then
			itemID = self:GetItemID(itemLink);
			if (itemID) then
				if (not self.ScaningInfo[itemID]) then
					self.ScaningInfo[itemID] = 1;
					self.ScaningInfo.ItemCount = self.ScaningInfo.ItemCount and self.ScaningInfo.ItemCount + 1 or 1;
				end				
				self.ScaningInfo.bidCount = self.ScaningInfo.bidCount and self.ScaningInfo.bidCount + 1 or 1;
				self:UpdateScaningItem(texture, itemLink);

				if (type(self.ItemInfo) ~= "table") then
					self.ItemInfo = {};
				end
				self.ItemInfo[itemID] = self.ItemInfo[itemID] or {0, 0, 0, 0, 0, 0};
				self.ItemInfo[itemID][1] = self.ItemInfo[itemID][1] + minBid;
				self.ItemInfo[itemID][2] = self.ItemInfo[itemID][2] + count;
				if (bidAmount > 0) then
					self.ItemInfo[itemID][3] = self.ItemInfo[itemID][3] + bidAmount;
					self.ItemInfo[itemID][4] = self.ItemInfo[itemID][4] + count;
				end
				if (buyoutPrice > 0) then
					self.ItemInfo[itemID][5] = self.ItemInfo[itemID][5] + buyoutPrice;
					self.ItemInfo[itemID][6] = self.ItemInfo[itemID][6] + count;
				end
			end
		end
	end
	
	if (self.curPage < self.totalPage) then		
		if (not self:QueryAuction()) then return end
	else
		self.isScaning = false;
		self.frame:Hide();
		AuctionFrameBrowse:RegisterEvent("AUCTION_ITEM_LIST_UPDATE");
		self:print(L["Scaning finished, total %d items, %d records."], self.ScaningInfo.ItemCount, self.ScaningInfo.bidCount);
	end
end

do
	local tmp = {[1] = nil, [2] = 0, [3] = nil, _T = 0};
	function mod:DelayCall(name, time, ...)	
		if (not self.DelayCallStack[name]) then
			tmp[1] = self[name];
			tmp[2] = time;
			tmp[3] = {...};
			tmp["_T"] = 0;
			self.DelayCallStack[name] = tmp;
		end	
	end
end

function mod:ClearDelayCall(name)
	self.DelayCallStack[name] = nil;
end

function mod:SetItemMoney(frame, money, msg, ...)
	local moneyString = GetMoneyString(money);
	frame:AddDoubleLine("|cFF7B68EE" .. format(msg, ...) .. "|r", moneyString);
end

function mod:AddTooltipInfo(tooltip, ...)
	if (not self.enable) then return end

	itemLink = select(2, tooltip:GetItem())
	if not itemLink then return end
	tmp = _G[tooltip:GetName() .. "TextLeft1"]
	if strfind(tmp:GetText(), "|T") then return end 
	
	local itemID = self:GetItemID(itemLink);
	
	local price, count, bidPrice, bidCount, buyoutPrice, buyoutCount = self:GetItemInfo(itemID);
	
	-- 顯示拍賣價格
	if (price and price > 0 and count and count > 0) then
		local unitPrice = math.floor(price / count + 0.5);
		self:SetItemMoney(tooltip, unitPrice, L["Start bid: "]);
		
		local stack = select(8, GetItemInfo(itemID));
		if (stack > 1) then
			local stackPrice = unitPrice * stack;
			self:SetItemMoney(tooltip, stackPrice, L["Start group bid(%d): "], stack);
		end
	end

	if (bidPrice and bidPrice > 0 and bidCount and bidCount > 0) then
		local unitBid = math.floor(bidPrice / bidCount + 0.5);
		local per = math.floor(bidCount / count + 0.5) * 100;
		self:SetItemMoney(tooltip, unitBid, L["Group bid(%d%%): "], per);
	end

	if (buyoutPrice and buyoutPrice > 0 and buyoutCount and buyoutCount > 0) then
		local unitBuyOut = math.floor(buyoutPrice / buyoutCount + 0.5);
		local per = math.floor(buyoutCount / count + 0.5) * 100;
		self:SetItemMoney(tooltip, unitBuyOut, L["Bid out(%d%%): "], per);
	end
	tooltip:Show();
end

function Fence_Toggle(switch)
	if (switch) then
		mod:OnEnable();
	else
		mod:OnDisable();
	end
end

function Fence_ClearData()
	StaticPopup_Show("CLEAR_AUCTION_INFOMATION");
end

function Fence_ShowTooltipInfo(switch)
	if (switch) then
		mod.enable = true;
	else
		mod.enable = false;
	end
end