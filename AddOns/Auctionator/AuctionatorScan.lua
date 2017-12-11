
KM_NULL_STATE	= 0;
KM_PREQUERY		= 1;
KM_INQUERY		= 2;
KM_POSTQUERY	= 3;
KM_ANALYZING	= 4;
KM_SETTINGSORT	= 5;

local AUCTION_CLASS_WEAPON = 1;
local AUCTION_CLASS_ARMOR  = 2;

local gAllScans = {};

local BIGNUM = 999999999999;

-----------------------------------------

AtrScan = {};
AtrScan.__index = AtrScan;


-----------------------------------------

function Atr_FindScan (itemName, itemLink)

	if (itemName == nil or itemName == "") then
		itemName = "nil";
	end

	local itemNameLC = string.lower (itemName);

	if (gAllScans[itemNameLC] == nil) then

		local scn = {};
		setmetatable (scn, AtrScan);

		scn:Init ();

		scn.itemName			= itemName;
		scn.itemLink			= itemLink;
		scn.itemSoftName		= nil;
		scn.itemClass			= 0;
		scn.itemSubclass		= 0;


		-- get the class and subclass for faster AH queries and see if this is an item in a "family"

		if (itemLink) then
			local a, b, c, d, e, sType, sSubType = GetItemInfo(itemLink);

			scn.itemClass		= Atr_ItemType2AuctionClass (sType);
			scn.itemSubclass	= Atr_SubType2AuctionSubclass (scn.itemClass, sSubType);

			if (scn.itemClass == AUCTION_CLASS_WEAPON or scn.itemClass == AUCTION_CLASS_ARMOR) then
				local z = string.find (string.lower(scn.itemName), " of ", 1, true);
				if (z ~= nil) then
					scn.itemSoftName = string.sub (scn.itemName, 1, z-1);
					if (not ZC_StringContains (scn.itemSoftName, " ")) then
						scn.itemSoftName = nil;
					end
				end
			end
		end

--		ZC_chatmsg ("Adding "..itemNameLC.." to cache", .4, .4, 1);
		
		gAllScans[itemNameLC] = scn;
	end
	
	return gAllScans[itemNameLC];
end

-----------------------------------------

function Atr_ClearScanCache ()

--	ZC_redmsg ("Clearing Scan Cache");

	for a,v in pairs (gAllScans) do
		if (a ~= "nil") then
			gAllScans[a] = nil;
		end
	end

end

-----------------------------------------

function AtrScan:Init ()
	self.processing_state	= KM_NULL_STATE
	self.current_page		= -1
	self.scanData			= {};
	self.sortedData			= {};
	self.whenScanned		= 0;
	self.whenSorted			= 0;
	self.lowprices			= {BIGNUM, BIGNUM, BIGNUM};
end

-----------------------------------------

function AtrScan:Start ()

	if (self.itemName == "nil") then
		return;
	end
	
	self.processing_state = KM_SETTINGSORT;
	
	SortAuctionClearSort ("list");

	BrowseName:SetText (self.itemName);		-- not necessary but nice when user switches to Browse tab
	
--ZC_redmsg ("Starting");
--	SortAuctionItems("list", "name");

--	if (IsAuctionSortReversed("list", "name")) then
--		SortAuctionItems("list", "name");
--	end

	self:Init ();

	self.current_page		= 0;
	self.processing_state	= KM_PREQUERY;

	self:Continue();
	
end

-----------------------------------------

function AtrScan:AnalyzeResultsPage()

	self.processing_state = KM_ANALYZING;

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

--	ZC_chatmsg("auctions:"..numBatchAuctions.." out of  "..totalAuctions)

	if (totalAuctions >= 50) then
		Atr_SetMessage (string.format (ZT("Scanning auctions: page %d"), self.current_page));
	end

--ZC_redmsg ("Analyzing "..numBatchAuctions);
	local numNilOwners = 0;

	if (numBatchAuctions > 0) then

		local x;

		for x = 1, numBatchAuctions do

			local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, owner = GetAuctionItemInfo("list", x);

			if (owner == nil) then
				numNilOwners = numNilOwners + 1;
			end
			
			local exactMatch = ZC_StringSame (name, self.itemName);

--			if (#self.scanData > 0 and exactMatch == false and self.itemSoftName == nil) then
--				earlyAbort = true;
--				ZC_yellowmsg ("aborting");
--				break;
--			end
			
			if (exactMatch or ZC_StringStartsWith (name, self.itemSoftName)) then
				self:AddScanItem (name, count, buyoutPrice, owner);
			
				if (self.itemLink == nil) then
					self.itemLink = GetAuctionItemLink("list", x);
				end
			end
			
			if (exactMatch) then
				self.itemName = name;		-- just cleans up any case differences
			end
			
		end
	end

--ZC_pinkmsg ("page: "..self.current_page.."    numNilOwners: "..numNilOwners);

	local done = (numBatchAuctions < 50);

	if (not done) then
		self.processing_state = KM_PREQUERY;
	end
	
	return done;
end

-----------------------------------------

function AtrScan:Get_Suffix (name)

	if (self.itemSoftName) then
		return string.sub (name, strlen (self.itemSoftName) + 2);
	end

	return "";
end

-----------------------------------------

function AtrScan:AddScanItem (name, stackSize, buyoutPrice, owner, numAuctions)

	local sd = {};
	local i;

	if (numAuctions == nil) then
		numAuctions = 1;
	end

	for i = 1, numAuctions do
		sd["stackSize"]		= stackSize;
		sd["buyoutPrice"]	= buyoutPrice;
		sd["owner"]			= owner;
		sd["pagenum"]		= self.current_page - 1;
		sd["suffix"]		= self:Get_Suffix(name);

		tinsert (self.scanData, sd);
		
		local itemPrice = math.floor (buyoutPrice / stackSize);

		Atr_AddToLowPrices (self.lowprices, itemPrice);
	end

end


-----------------------------------------

function AtrScan:AddSDXToScan (price, owner, volume)	-- helper function for AddExternalDataToScan

	local sd = {};

	if (price and price > 0) then
		sd["stackSize"]		= 1;
		sd["buyoutPrice"]	= price;
		sd["owner"]			= owner;
		sd["pagenum"]		= -1;
		sd["suffix"]		= "";

		if (volume) then
			sd["volume"] = volume;
		end

		tinsert (self.scanData, sd);
	end
	
end

-----------------------------------------

function AtrScan:AddExternalDataToScan ()

	if (self.itemLink == nil) then
		return;
	end

	-- Wowecon

	if (Wowecon and Wowecon.API) then
	
		local priceG, volG = Wowecon.API.GetAuctionPrice_ByLink (self.itemLink, Wowecon.API.GLOBAL_PRICE)
		local priceS, volS = Wowecon.API.GetAuctionPrice_ByLink (self.itemLink, Wowecon.API.SERVER_PRICE)

		self:AddSDXToScan (priceG, "__wowEconG", volG);
		self:AddSDXToScan (priceS, "__wowEconS", volS);
		
	end
	
	-- GoingPrice Wowhead
	
	local id = ZC_ItemIDfromLink (self.itemLink);
	
	id = tonumber(id);

	if (GoingPrice_Wowhead_Data and GoingPrice_Wowhead_Data[id] and GoingPrice_Wowhead_SV._index) then
		local index = GoingPrice_Wowhead_SV._index["Buyout price"];

		if (index ~= nil) then
			local price = GoingPrice_Wowhead_Data[id][index];
		
			self:AddSDXToScan (price, "__wowHead");
		end
	end

	-- GoingPrice Allakhazam
	
	if (GoingPrice_Allakhazam_Data and GoingPrice_Allakhazam_Data[id] and GoingPrice_Allakhazam_SV._index) then
		local index = GoingPrice_Allakhazam_SV._index["Median"];

		if (index ~= nil) then
			local price = GoingPrice_Allakhazam_Data[id][index];
		
			self:AddSDXToScan (price, "__allakhazam");
		end
	end

	-- most recent historical price
	
	local price = Atr_Process_Historydata();
	if (price ~= nil) then
		self:AddSDXToScan (price, "__atrLast");
	end

end

-----------------------------------------

function AtrScan:SubtractScanItem (name, stackSize, buyoutPrice)

	local sd;
	local i;

	for i,sd in ipairs (self.scanData) do
		
		if (sd.stackSize == stackSize and sd.buyoutPrice == buyoutPrice and ZC_StringSame (sd.suffix, self:Get_Suffix(name))) then
			
			tremove (self.scanData, i);
			return;
		end
	end

end

-----------------------------------------

function AtrScan:Continue()

	if (CanSendAuctionQuery()) then

		self.processing_state = KM_IN_QUERY;

		local queryString = self.itemName;

		if (self.itemSoftName) then
			queryString = self.itemSoftName;
		end

		queryString = ZC_UTF8_Truncate (queryString,63);	-- attempting to reduce number of disconnects

	--ZC_redmsg ("AtrScan:Continue   "..queryString.."  page:"..self.current_page);
		
		self.prequeryPageSig = Atr_CreatePageSig();
		
		QueryAuctionItems (queryString, "", "", nil, self.itemClass, self.itemSubclass, self.current_page, nil, nil);

		self.query_sent_when	= gAtr_ptime;
		self.processing_state	= KM_POSTQUERY;
		self.current_page		= self.current_page + 1;
	end

end

-----------------------------------------

function AtrScan:Finish()

	self.whenScanned		= time();
	self.processing_state	= KM_NULL_STATE;
	self.current_page		= -1;
	self.query_sent_when	= nil;
	
	self:CondenseAndSort ();

	-- update the fullscan DB
	
	local newprice = Atr_CalcNewDBprice (self.itemName, self.lowprices);
	
	if (newprice > 0) then
		gAtr_ScanDB[self.itemName] = newprice;
	end

	Atr_ClearBrowseListings();
	
end

-----------------------------------------

function Atr_ClearBrowseListings()
	
	local start = time();

	while (time() - start < 5) do
	
		if (CanSendAuctionQuery()) then
			QueryAuctionItems("xyzzy", 43, 43, 0, 7, 0);
			break;
		end
	end

end

-----------------------------------------

function Atr_SortAuctionData (x, y)

	return x.itemPrice < y.itemPrice;

end

-----------------------------------------

function AtrScan:CondenseAndSort ()

	----- Condense the scan data into a table that has only a single entry per stacksize/price combo

	self.sortedData	= {};
	self.whenSorted	= time();

	local i,sd;
	local conddata = {};

	for i,sd in ipairs (self.scanData) do

		local ownerCode = "x";
		local dataType  = "n";		-- normal
		
		if (sd.owner == UnitName("player")) then
			ownerCode = "y";
--		elseif (Atr_IsMyToon (sd.owner)) then
--			ownerCode = sd.owner;
		elseif (sd.owner == "__wowEconG") then
			dataType = "eg";
		elseif (sd.owner == "__wowEconS") then
			dataType = "es";
		elseif (sd.owner == "__wowHead") then
			dataType = "h";
		elseif (sd.owner == "__allakhazam") then
			dataType = "k";
		elseif (sd.owner == "__atrLast") then
			dataType = "a";
		end

		local key = "_"..sd.stackSize.."_"..sd.buyoutPrice.."_"..ownerCode..dataType.."_"..sd.suffix;

		if (conddata[key] and gSoftMatchItemName == nil) then
			conddata[key].count = conddata[key].count + 1;
		else
			local data = {};

			data.stackSize 		= sd.stackSize;
			data.buyoutPrice	= sd.buyoutPrice;
			data.itemPrice		= sd.buyoutPrice / sd.stackSize;
			data.suffix			= sd.suffix;
			data.pagenum		= sd.pagenum;
			data.count			= 1;
			data.type			= dataType;
			data.yours			= (ownerCode == "y");
			
			if (ownerCode ~= "x" and ownerCode ~= "y") then
				data.altname = ownerCode;
			end
			
			if (sd.volume) then
				data.volume = sd.volume;
			end
			
			conddata[key] = data;
		end

	end

	----- create a table of these entries

	local n = 1;

	local i, v;

	for i,v in pairs (conddata) do
		self.sortedData[n] = v;
		n = n + 1;
	end

	-- sort the table by itemPrice

	table.sort (self.sortedData, Atr_SortAuctionData);

	-- analyze and store some info about the data

	self:AnalyzeSortData ();


end

-----------------------------------------

function AtrScan:AnalyzeSortData ()

	self.absoluteBest			= nil;
	self.bestPrices				= {};		-- a table with one entry per stacksize that is the cheapest auction for that particular stacksize
	self.numMatches				= 0;
	self.numMatchesWithBuyout	= 0;
	self.hasStack				= false;
	self.yourBestPrice			= nil;

	local j, sd;

	----- find the best price per stacksize and overall -----

	for j,sd in ipairs(self.sortedData) do

		if (sd.type == "n") then

			if (self.itemSoftName == nil or self.itemName == self.itemSoftName.." "..sd.suffix) then

				self.numMatches = self.numMatches + 1;

				if (sd.itemPrice > 0) then

					self.numMatchesWithBuyout = self.numMatchesWithBuyout + 1;

					if (self.bestPrices[sd.stackSize] == nil or self.bestPrices[sd.stackSize].itemPrice >= sd.itemPrice) then
						self.bestPrices[sd.stackSize] = sd;
					end

					if (self.absoluteBest == nil or self.absoluteBest.itemPrice > sd.itemPrice) then
						self.absoluteBest = sd;
					end
					
					if (sd.yours) then
						if (self.yourBestPrice == nil or self.yourBestPrice > sd.itemPrice) then
							self.yourBestPrice = sd.itemPrice;
						end
					end
				end

				if (sd.stackSize > 1) then
					self.hasStack = true;
				end
			end
		end
	end
end

-----------------------------------------

function AtrScan:FindInSortedData (stackSize, buyoutPrice)
	local j = 1;
	for j = 1,#self.sortedData do
		sd = self.sortedData[j];
		if (sd.stackSize == stackSize and sd.buyoutPrice == buyoutPrice and sd.yours) then
			return j;
		end
	end
	
	return 0;
end


-----------------------------------------

function AtrScan:FindMatchByStackSize (stackSize)

	local index = nil;

	local basedata = self.absoluteBest;

	if (self.bestPrices[stackSize]) then
		basedata = self.bestPrices[stackSize];
	end

	local numrows = #self.sortedData;

	local n;

	for n = 1,numrows do

		local data = self.sortedData[n];

		if (basedata and data.itemPrice == basedata.itemPrice and data.stackSize == basedata.stackSize and data.suffix == basedata.suffix and data.yours == basedata.yours) then
			index = n;
			break;
		end
	end

	return index;
	
end

-----------------------------------------

function AtrScan:FindMatchByYours ()

	local index = nil;

	local j;
	for j = 1,#self.sortedData do
		sd = self.sortedData[j];
		if (sd.yours) then
			index = j;
			break;
		end
	end

	return index;

end

-----------------------------------------

function AtrScan:FindCheapest ()

	local index = nil;

	local j;
	for j = 1,#self.sortedData do
		sd = self.sortedData[j];
		if (sd.itemPrice > 0) then
			index = j;
			break;
		end
	end

	return index;

end



-----------------------------------------

ATR_FS_NULL			= 0;
ATR_FS_STARTED		= 1;
ATR_FS_ANALYZING	= 2;
ATR_FS_CLEANING_UP	= 3;

gAtr_FullScanState = ATR_FS_NULL;


-----------------------------------------

function Atr_GetDBsize()

	local n = 0;
	local a,v;

	for a,v in pairs (gAtr_ScanDB) do
		n = n + 1;
	end
	
	return n;
end

-----------------------------------------

function Atr_FullScanStart()

	local canQuery,canQueryAll = CanSendAuctionQuery();
	
	if (canQueryAll) then
	
		Atr_FullScanStatus:SetText (ZT("Scanning").."...");
		Atr_FullScanStartButton:Disable();
		Atr_FullScanDone:Disable();
	
		gAtr_FullScanState = ATR_FS_STARTED;

		SortAuctionClearSort ("list");

		QueryAuctionItems ("", nil, nil, 0, 0, 0, 0, 0, 0, true);
	end

end

-----------------------------------------

function Atr_CalcNewDBprice (name, prices)
		
	if (gAtr_ScanDB[name]) then
		prices[3] = gAtr_ScanDB[name];
	end
	
	table.sort (prices);

	if (prices[2] ~= BIGNUM and prices[1] < (prices[2] * .4)) then
		prices[1] = BIGNUM;
	end
	
	local total = 0;
	local n = 0;
	local k;
	
	for k = 1,3 do
--		ZC_yellowmsg (prices[k]);
		if (prices[k] ~= BIGNUM) then
			total = total + prices[k];
			n = n + 1;
		end
	end

	if (n == 0) then return 0; end;
	
	return math.floor (total / n);
end

-----------------------------------------

function Atr_AddToLowPrices (lowprices, itemPrice)
	
	if (itemPrice > 0) then
		if (itemPrice < lowprices[1]) then
			if (lowprices[1] < lowprices[2]) then
				lowprices[2] = lowprices[1];
			end
			lowprices[1] = itemPrice;
			return true;
		elseif (itemPrice < lowprices[2]) then
			lowprices[2] = itemPrice;
			return true;
		end
	end

	return false;
end




-----------------------------------------

function Atr_FullScanAnalyze()

	gAtr_FullScanState = ATR_FS_ANALYZING;

	Atr_FullScanStatus:SetText (ZT("Processing"));
	

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

--	ZC_chatmsg("FULL SCAN:"..numBatchAuctions.." out of  "..totalAuctions)

	local lowprices = {};
	local x;
	
	if (numBatchAuctions > 0) then

		for x = 1, numBatchAuctions do

			local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice = GetAuctionItemInfo("list", x);

			if (name ~= nil and buyoutPrice ~= nil) then
			
				local itemPrice = math.floor (buyoutPrice / count);
			
				if (itemPrice > 0) then
					if (not lowprices[name]) then
						lowprices[name] = {BIGNUM,BIGNUM,BIGNUM};		-- one extra for later
					end
					
					Atr_AddToLowPrices (lowprices[name], itemPrice);
				end
			end
		end
	end

	for name,prices in pairs (lowprices) do
		
		local newprice = Atr_CalcNewDBprice (name, prices);
		
		if (newprice > 0) then
			gAtr_ScanDB[name] = newprice;
		end
	end


	if (Atr_PrintBargains and Atr_CheckForBargain and numBatchAuctions > 0) then

		for x = 1, numBatchAuctions do
			Atr_CheckForBargain (x);
		end
		
		Atr_PrintBargains();
	end
	
	gAtr_FullScanState = ATR_FS_CLEANING_UP;

	Atr_FullScanStatus:SetText (ZT("Cleaning up"));

	Atr_FullScanStartButton:Enable();
	Atr_FullScanDone:Enable();
	Atr_FullScanStatus:SetText ("");
	
	AUCTIONATOR_LAST_SCAN_TIME = time();
	
	Atr_UpdateFullScanFrame ();

	Atr_ClearBrowseListings();
	
	lowprices = {};
	collectgarbage ("collect");
end

-----------------------------------------

local ggg = 0;

function auctionator_AuctionFrameBrowse_Update ()

	ggg = ggg + 1;
	ZC_printstack (ggg.." ");

	return auctionator_orig_AuctionFrameBrowse_Update ();

end

-----------------------------------------

function Atr_ShowFullScanFrame()

	Atr_FullScanFrame:Show();
	Atr_FullScanFrame:SetBackdropColor(0,0,0,100);
	
	Atr_UpdateFullScanFrame();
	Atr_FullScanStatus:SetText ("");

	local expText = "<html><body>"
					.."<p>"
					..ZT("Scanning is entirely optional.")
					.."<br/><br/>"
					..ZT("SCAN_EXPLANATION")
					.."</p>"
					.."</body></html>"
					;



	Atr_FullScanHTML:SetText (expText);
	Atr_FullScanHTML:SetSpacing (3);
end

-----------------------------------------

function Atr_UpdateFullScanFrame()

	Atr_FullScanDBsize:SetText (Atr_GetDBsize());
	
	if (AUCTIONATOR_LAST_SCAN_TIME) then
		Atr_FullScanDBwhen:SetText (date ("%A, %B %d at %I:%M %p", AUCTIONATOR_LAST_SCAN_TIME));
	else
		Atr_FullScanDBwhen:SetText (ZT("Never"));
	end

	local canQuery,canQueryAll = CanSendAuctionQuery();

	if (canQueryAll) then
		Atr_FullScanStatus:SetText ("");
		Atr_FullScanStartButton:Enable();
		Atr_FullScanNext:SetText(ZT("Now"));
	else	
		Atr_FullScanStartButton:Disable();

		if (AUCTIONATOR_LAST_SCAN_TIME) then
			local when = 15*60 - (time() - AUCTIONATOR_LAST_SCAN_TIME);
		
			when = math.floor (when/60);
		
			if (when == 0) then
				Atr_FullScanNext:SetText (ZT("in less than a minute"));
			elseif (when == 1) then
				Atr_FullScanNext:SetText (ZT("in about one minute"));
			elseif (when > 0) then
				Atr_FullScanNext:SetText (string.format (ZT("in about %d minutes"), when));
			else
				Atr_FullScanNext:SetText (ZT("unknown"));
			end
		else
			Atr_FullScanNext:SetText (ZT("unknown"));
		end
	end
end

-----------------------------------------

function Atr_FullScanFrameIdle()

	if (gAtr_FullScanState == ATR_FS_CLEANING_UP) then
	
		Atr_FullScanStatus:SetText ("Cleaning up");
		
		if (GetNumAuctionItems("list") < 100) then
		
			Atr_FullScanStatus:SetText (ZT("Scan complete"));
			PlaySound("AuctionWindowClose");
			
			gAtr_FullScanState = ATR_FS_NULL;
		end
	
	end
	
	if (gAtr_FullScanState == ATR_FS_STARTED) then

		local btext = Atr_FullScanStatus:GetText ();
		
		if (btext) then
			if (string.len (btext) > 25) then
				Atr_FullScanStatus:SetText (ZT("Scanning")..".");
			else
				Atr_FullScanStatus:SetText (btext..".");
			end
		end
	end
	
end







