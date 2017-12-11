AtrPane = {};
AtrPane.__index = AtrPane;

ATR_SHOW_CURRENT	= 1;
ATR_SHOW_HISTORY	= 2;
ATR_SHOW_HINTS		= 3;

function AtrPane.create ()

	local pane = {};
	setmetatable (pane,AtrPane);

	pane.itemName		= "";
	pane.itemLink		= nil;
	pane.stackSize		= 0;
	pane.UINeedsUpdate	= false;
	pane.showWhich		= ATR_SHOW_CURRENT;
	
	pane.activeScan		= Atr_FindScan();
	pane.sortedHist		= nil;
	
	pane.currIndex		= nil;
	pane.histIndex		= nil;
	pane.hintsIndex		= nil;
	
	pane.rescanThreshold = 0;
	
	pane.hlistScrollOffset	= 0;
	
	return pane;
end


-----------------------------------------

function AtrPane:SetItem (auctionItemName, auctionLink, stackSize, threshold)
	
	self.itemName			= auctionItemName;
	self.itemLink  			= auctionLink;
	self.stackSize  		= stackSize;
	self.rescanThreshold	= threshold;

	self.currIndex		= nil;
	self.histIndex		= nil;
	self.hintsIndex		= nil;
	
	self.UINeedsUpdate = true;

	Atr_SetActionNormal();
	
	Atr_ClearAll();
	
	if (self.itemName == "" or auctionLink == nil) then
		self.activeScan = Atr_FindScan (nil);
		Atr_ClearList();	-- it's fast, might as well just do it now for cleaner UE
	end

	if (self.itemName ~= "" and self:ShowCurrent()) then
		self:Rescan();
	end

end

-----------------------------------------

function AtrPane:Rescan()

	self.activeScan = Atr_FindScan (self.itemName, self.itemLink);

	if (self.activeScan.whenScanned < time() - self.rescanThreshold) then
		self.UINeedsUpdate = false;		-- will be set when scan finishes
		self.activeScan:Start();
	else
		Atr_OnNewScanComplete();
	end

end

-----------------------------------------

function AtrPane:IsScanEmpty ()
	
	return (self.activeScan == nil or self.activeScan.itemName == nil or self.activeScan.itemName == "" or self.activeScan.itemName == "nil");
	
end

-----------------------------------------

function AtrPane:ShowCurrent ()
	
	return self.showWhich == ATR_SHOW_CURRENT;
	
end

-----------------------------------------

function AtrPane:ShowHistory ()
	
	return self.showWhich == ATR_SHOW_HISTORY;
	
end

-----------------------------------------

function AtrPane:ShowHints ()
	
	return self.showWhich == ATR_SHOW_HINTS;
	
end

-----------------------------------------

function AtrPane:SetToShowCurrent ()
	
	self.showWhich = ATR_SHOW_CURRENT;
	
end

-----------------------------------------

function AtrPane:SetToShowHistory ()
	
	self.showWhich = ATR_SHOW_HISTORY;
	
end

-----------------------------------------

function AtrPane:SetToShowHints ()
	
	self.showWhich = ATR_SHOW_HINTS;
	
end


