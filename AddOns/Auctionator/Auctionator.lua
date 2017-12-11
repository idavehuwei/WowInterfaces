
local AuctionatorVersion = "???";		-- set from toc upon loading
local AuctionatorAuthor  = "Zirco";

local AuctionatorLoaded = false;
local AuctionatorInited = false;

-----------------------------------------

local recommendElements			= {};
local auctionsTabElements		= {};
local auctionsTabLeftElements	= {};

AUCTIONATOR_ENABLE_ALT		= 1;
AUCTIONATOR_OPEN_ALL_BAGS	= 1;
AUCTIONATOR_SHOW_TIPS		= 1;
AUCTIONATOR_DEF_DURATION	= "L";		-- none
AUCTIONATOR_V_TIPS			= 1;
AUCTIONATOR_A_TIPS			= 1;
AUCTIONATOR_D_TIPS			= 1;
AUCTIONATOR_SHIFT_TIPS		= 1;
AUCTIONATOR_DE_DETAILS_TIPS	= 4;		-- off by default
AUCTIONATOR_DEFTAB			= 1;

AUCTIONATOR_OPEN_FIRST		= 0;
AUCTIONATOR_OPEN_BUY		= 0;

local SELL_TAB		= 1;
local MORE_TAB		= 2;
local BUY_TAB 		= 3;

local MODE_LIST_ACTIVE	= 1;
local MODE_LIST_ALL		= 2;

-- saved variables - amounts to undercut

local auctionator_savedvars_defaults =
	{
	["_5000000"]			= 10000;	-- amount to undercut buyouts over 500 gold
	["_1000000"]			= 2500;
	["_200000"]				= 1000;
	["_50000"]				= 500;
	["_10000"]				= 200;
	["_2000"]				= 100;
	["_500"]				= 5;
	["STARTING_DISCOUNT"]	= 5;	-- PERCENT
	};


-----------------------------------------

local auctionator_orig_AuctionFrameTab_OnClick;
local auctionator_orig_ContainerFrameItemButton_OnClick;
local auctionator_orig_AuctionFrameAuctions_Update;
local auctionator_orig_CanShowRightUIPanel;
local auctionator_orig_ChatEdit_InsertLink;
local auctionator_orig_ChatFrame_OnEvent;

local gForceMsgAreaUpdate = true;


local SETTLED				= 1;
local AUCTION_POST_PENDING	= 2;
local STACK_MERGE_PENDING	= 3;
local STACK_SPLIT_PENDING	= 4;


local gAutoSelling = false;
local gAutoSellState = SETTLED;

local gBS_ItemName;
local gBS_ItemLink;
local gBS_ItemFamily;
local gBS_GoodStackSize;
local gBS_FullStackSize;
local gBS_Buyout_StackPrice;
local gBS_Buyout_ItemPrice;
local gBS_Start_ItemPrice;
local gBS_Hours;
local gBS_targetBS;
local gBS_targetCount;
local gBS_AuctionNum;
local gBS_NumAuctionsToCreate;
local gBS_TotalItems;
local gBS_FullStackSize;

local gOpenAllBags  			= AUCTIONATOR_OPEN_ALL_BAGS;
local gTimeZero;
local gTimeTightZero;

local gAutoBatch_bagID;
local gAutoBatch_slotID;

local cslots = {};
local gEmptyBScached = nil;


local gJustPosted_ItemName = nil;		-- set to the last item posted, even after the posting so that message and icon can be displayed
local gJustPosted_BuyoutPrice;
local gJustPosted_StackSize;
local gJustPosted_ItemLink;

local auctionator_pending_message = nil;

local kFirstBag, kLastBag = 0, 4;

local Atr_Confirm_Proc_Yes = nil;

local gStartingTime			= time();
local gHentryTryAgain		= nil;
local gCondensedThisSession = {};

local ITEM_HIST_NUM_LINES = 20;

local gActiveAuctions = {};

local gHlistNeedsUpdate = false;

local gSellPane;
local gMorePane;
local gActivePane;
local gShopPane;

local gCurrentPane;

local gHistoryItemList = {};

local ATR_NOTHING		= 0;
local ATR_BUYING		= 1;
local ATR_JUST_BOUGHT	= 2;
local ATR_NORMAL_SCAN	= 3;

local gActionState = ATR_NOTHING;

local ATR_CACT_NULL			= 0;
local ATR_CACT_READY		= 1;
local ATR_CACT_PROCESSING	= 2;

local gAtr_CheckingActive_State = ATR_CACT_NULL

local gItemPostingInProgress = false;
local gQuietWho = 0;

gAtr_ptime = nil;		-- a more precise timer but may not be updated very frequently

gAtr_ScanDB = nil;

-----------------------------------------

local BS_GetCount, BS_InCslots, BS_GetEmptySlot, BS_PostAuction, BS_FindGoodStack, BS_MergeSmallStacks, BS_SplitLargeStack;

local roundPriceDown, ToTightTime, FromTightTime, monthDay;

-----------------------------------------


function Atr_EventHandler()

--	ZC_pinkmsg (event);

	if (event == "VARIABLES_LOADED")			then	Atr_OnLoad(); 					end;
	if (event == "ADDON_LOADED")				then	Atr_OnAddonLoaded(); 			end;
	if (event == "AUCTION_ITEM_LIST_UPDATE")	then	Atr_OnAuctionUpdate(); 			end;
	if (event == "AUCTION_OWNED_LIST_UPDATE")	then	Atr_OnAuctionOwnedUpdate(); 	end;
	if (event == "AUCTION_HOUSE_SHOW")			then	Atr_OnAuctionHouseShow(); 		end;
	if (event == "AUCTION_HOUSE_CLOSED")		then	Atr_OnAuctionHouseClosed(); 	end;
	if (event == "NEW_AUCTION_UPDATE")			then	Atr_OnNewAuctionUpdate(); 		end;
	if (event == "CHAT_MSG_ADDON")				then	Atr_OnChatMsgAddon(); 			end;
	if (event == "WHO_LIST_UPDATE")				then	Atr_OnWhoListUpdate(); 			end;

end

-----------------------------------------

function Atr_SetupHookFunctionsEarly ()

	auctionator_orig_FriendsFrame_OnEvent = FriendsFrame_OnEvent;
	FriendsFrame_OnEvent = auctionator_FriendsFrame_OnEvent;

end

-----------------------------------------

function Atr_SetupHookFunctions ()

	auctionator_orig_AuctionFrameTab_OnClick = AuctionFrameTab_OnClick;
	AuctionFrameTab_OnClick = Atr_AuctionFrameTab_OnClick;

	auctionator_orig_ContainerFrameItemButton_OnModifiedClick = ContainerFrameItemButton_OnModifiedClick;
	ContainerFrameItemButton_OnModifiedClick = Atr_ContainerFrameItemButton_OnModifiedClick;

	auctionator_orig_AuctionFrameAuctions_Update = AuctionFrameAuctions_Update;
	AuctionFrameAuctions_Update = Atr_AuctionFrameAuctions_Update;

	auctionator_orig_CanShowRightUIPanel = CanShowRightUIPanel;
	CanShowRightUIPanel = auctionator_CanShowRightUIPanel;

	auctionator_orig_ChatEdit_InsertLink = ChatEdit_InsertLink;
	ChatEdit_InsertLink = auctionator_ChatEdit_InsertLink;

	auctionator_orig_ChatFrame_OnEvent = ChatFrame_OnEvent;
	ChatFrame_OnEvent = auctionator_ChatFrame_OnEvent;

--	auctionator_orig_AuctionFrameBrowse_Update = AuctionFrameBrowse_Update;
--	AuctionFrameBrowse_Update = auctionator_AuctionFrameBrowse_Update;


end

-----------------------------------------

local checkVerString		= AuctionatorVersion;
local versionReminderCalled	= false;	-- make sure we don't bug user more than once

-----------------------------------------

local function CheckVersion (verString)
	if (verString > checkVerString) then
		checkVerString = verString;
		return true;
	end

	return false;
end

-----------------------------------------

function Atr_VersionReminder ()
	if (not versionReminderCalled) then
		versionReminderCalled = true;

		ZC_yellowmsg (ZT("There is a more recent version of Auctionator: VERSION").." "..checkVerString);
		ZC_yellowmsg (ZT("For information on the latest version browse to").." http://auctionator-addon.com");
	end
end


-----------------------------------------

function Atr_OnChatMsgAddon ()

	local	prefix			= arg1;
	local	msg				= arg2;
	local	distribution	= arg3;
	local	sender			= arg4;

--	local s = string.format ("CHAT_MSG_ADDON:  %-10s %-11s %-15s %s", prefix, distribution, sender, msg);
--	ZC_chatmsg (s);

	if (arg1 == "ATR") then

		if (ZC_StringStartsWith (msg, "VREQ_")) then
			SendAddonMessage ("ATR", "V_"..AuctionatorVersion, "WHISPER", sender);
		end

		if (ZC_StringStartsWith (msg, "V_")) then
			local herVerString = string.sub (msg, 3);
			local lessthan = CheckVersion (herVerString);
			if (lessthan) then
				ZC_AddDeferredCall (3, "Atr_VersionReminder", nil, nil, "VR");
			end
		end
	end

	if (Atr_OnChatMsgAddon_Dev) then
		Atr_OnChatMsgAddon_Dev (prefix, msg, distribution, sender);
	end

end

-----------------------------------------

local gSendZoneMsgs = false;

-----------------------------------------

function Atr_OnWhoListUpdate()

	if (gSendZoneMsgs) then
		gSendZoneMsgs = false;

		local numWhos, totalCount = GetNumWhoResults();
		local i;

		if (Atr_IsDev) then
			ZC_pinkmsg ("    "..numWhos.." out of "..totalCount.." users found");
		end

		for i = 1,numWhos do
			local name, guildname, level = GetWhoInfo(i);
			SendAddonMessage ("ATR", "VREQ_"..AuctionatorVersion, "WHISPER", name);
			if (Atr_Guildinfo) then
				Atr_Guildinfo[name] = guildname;
			end
			if (Atr_Levelinfo) then
				Atr_Levelinfo[name] = level;
			end

		end
	end
end

-----------------------------------------

function Atr_PollWho(s)

	gSendZoneMsgs = true;
	gQuietWho = time();

	SetWhoToUI(1);

	if (Atr_IsDev) then
		ZC_redmsg (s);
	end

	SendWho (s);
end


-----------------------------------------

local function Atr_SlashCmdFunction(msg)

	local cmd, param1, param2 = ZC_words (msg);

	cmd    = cmd    and cmd:lower()    or nil;
	param1 = param1 and param1:lower() or nil;
	param2 = param2 and param2:lower() or nil;

	if (cmd == "mem") then

		UpdateAddOnMemoryUsage();

		for i = 1, GetNumAddOns() do
			local mem  = GetAddOnMemoryUsage(i);
			local name = GetAddOnInfo(i);
			if (mem > 0) then
				local s = string.format ("%6i KB   %s", math.floor(mem), name);
				ZC_yellowmsg (s);
			end
		end

	elseif (cmd == "locale") then
		Atr_PickLocalizationTable (param1);

	elseif (cmd == "clear" and param1 == "fullscandb") then

		gAtr_ScanDB = nil;
		AUCTIONATOR_PRICE_DATABASE = nil;

		Atr_InitScanDB();

		ZC_chatmsg (ZT("auctionator: full scan database cleared"));
		collectgarbage  ("collect");

	elseif (Atr_HandleDevCommands and Atr_HandleDevCommands (cmd, param1, param2)) then
		-- do nothing
	else
		ZC_chatmsg (ZT("auctionator: unrecognized command"));
	end

end


-----------------------------------------

function Atr_InitScanDB()

	local realm_Faction = GetRealmName().."_"..UnitFactionGroup ("player");

	if (AUCTIONATOR_PRICE_DATABASE and AUCTIONATOR_PRICE_DATABASE["__dbversion"] == nil) then	-- see if we need to migrate

		local temp = ZC_CopyDeep (AUCTIONATOR_PRICE_DATABASE);

		AUCTIONATOR_PRICE_DATABASE = {};
		AUCTIONATOR_PRICE_DATABASE["__dbversion"] = 2;

		AUCTIONATOR_PRICE_DATABASE[realm_Faction] = ZC_CopyDeep (temp);

		temp = {};
	end

	if (AUCTIONATOR_PRICE_DATABASE == nil) then
		AUCTIONATOR_PRICE_DATABASE = {};
		AUCTIONATOR_PRICE_DATABASE["__dbversion"] = 2;
	end

	if (AUCTIONATOR_PRICE_DATABASE[realm_Faction] == nil) then
		AUCTIONATOR_PRICE_DATABASE[realm_Faction] = {};
	end

	gAtr_ScanDB = AUCTIONATOR_PRICE_DATABASE[realm_Faction];

end

-----------------------------------------

function Atr_OnLoad()

	AuctionatorVersion = GetAddOnMetadata("Auctionator", "Version");

	gTimeZero		= time({year=2000, month=1, day=1, hour=0});
	gTimeTightZero	= time({year=2008, month=8, day=1, hour=0});

	AuctionatorLoaded = true;

	SlashCmdList["Auctionator"] = Atr_SlashCmdFunction;

	SLASH_Auctionator1 = "/auctionator";
	SLASH_Auctionator2 = "/atr";

	Atr_InitScanDB ();

	if (AUCTIONATOR_PRICING_HISTORY == nil) then
		AUCTIONATOR_PRICING_HISTORY = {};
	end

	if (AUCTIONATOR_TOONS == nil) then
		AUCTIONATOR_TOONS = {};
	end

	local playerName = UnitName("player");

	if (not AUCTIONATOR_TOONS[playerName]) then
		AUCTIONATOR_TOONS[playerName] = {};
		AUCTIONATOR_TOONS[playerName].firstSeen		= time();
		AUCTIONATOR_TOONS[playerName].firstVersion	= AuctionatorVersion;
	end

	AUCTIONATOR_TOONS[playerName].guid = UnitGUID ("player");


	if (AUCTIONATOR_SHOW_TIPS == 0) then		-- migrate old option to new ones
		AUCTIONATOR_V_TIPS = 0;
		AUCTIONATOR_A_TIPS = 0;
		AUCTIONATOR_D_TIPS = 0;

		AUCTIONATOR_SHOW_TIPS = 2;
	end

	if (AUCTIONATOR_OPEN_FIRST < 2) then	-- set to 2 to indicate it's been migrated
		if		(AUCTIONATOR_OPEN_FIRST == 1)	then AUCTIONATOR_DEFTAB = 1;
		elseif	(AUCTIONATOR_OPEN_BUY == 1)		then AUCTIONATOR_DEFTAB = 2;
		else										 AUCTIONATOR_DEFTAB = 0; end;

		AUCTIONATOR_OPEN_FIRST = 2;
	end


	Atr_SetupHookFunctionsEarly();

	------------------

	CreateFrame( "GameTooltip", "MyScanningTooltip" ); -- Tooltip name cannot be nil
	MyScanningTooltip:SetOwner( WorldFrame, "ANCHOR_NONE" );
	-- Allow tooltip SetX() methods to dynamically add new lines based on these
	MyScanningTooltip:AddFontStrings(
	MyScanningTooltip:CreateFontString( "$parentTextLeft1", nil, "GameTooltipText" ),
	MyScanningTooltip:CreateFontString( "$parentTextRight1", nil, "GameTooltipText" ) );

	------------------

	Atr_InitDETable();

	if ( IsAddOnLoaded("Blizzard_AuctionUI") ) then		-- need this for AH_QuickSearch since that mod forces Blizzard_AuctionUI to load at a startup
		Atr_Init();
	end

end

-----------------------------------------

local gPrevTime = 0;

function Atr_OnAddonLoaded()

	local addonName = arg1;

	if (ZC_StringSame (addonName, "blizzard_auctionui")) then
		Atr_Init();
	end

	if (ZC_StringSame (addonName, "lilsparkysWorkshop")) then

		local LSW_version = GetAddOnMetadata("lilsparkysWorkshop", "Version");

		if (LSW_version and (LSW_version == "0.72" or LSW_version == "0.90" or LSW_version == "0.91")) then

			if (LSW_itemPrice) then
				ZC_chatmsg ("** |cff00ffff"..ZT("Auctionator provided an auction module to LilSparky's Workshop."), 0, 1, 0);
				ZC_chatmsg ("** |cff00ffff"..ZT("Ignore any ERROR message to the contrary below."), 0, 1, 0);
				LSW_itemPrice = Atr_LSW_itemPriceGetAuctionBuyout;
			end
		end
	end

	Atr_Check_For_Conflicts (addonName);

	local now = time();

--	ZC_redmsg (addonName.."   time: "..now - gStartingTime);

	gPrevTime = now;

end

-----------------------------------------

function Atr_LSW_itemPriceGetAuctionBuyout(link)

    sellPrice = Atr_GetAuctionBuyout(link)
    if sellPrice then
        return sellPrice, false
    else
        return 0, true
    end
 end

-----------------------------------------

function Atr_Init()

	if (AuctionatorInited) then
		return;
	end

--	ZC_chatmsg("Auctionator Initialized");

	AuctionatorInited = true;

	if (AUCTIONATOR_SAVEDVARS == nil) then
		Atr_ResetSavedVars();
	end


	if (AUCTIONATOR_SHOPPING_LISTS == nil) then
		AUCTIONATOR_SHOPPING_LISTS = {};
		Atr_SList.create (ZT("Recent Searches"), true);

		if (ZC_IsEnglishLocale()) then
			local slist = Atr_SList.create ("Sample Shopping List #1");
			slist:AddItem ("Greater Cosmic Essence");
			slist:AddItem ("Infinite Dust");
			slist:AddItem ("Dream Shard");
			slist:AddItem ("Abyss Crystal");
		end
	else
		Atr_ShoppingListsInit();
	end

	gShopPane	= Atr_AddSellTab (ZT("Buy"),			BUY_TAB);
	gSellPane	= Atr_AddSellTab (ZT("Sell"),			SELL_TAB);
	gMorePane	= Atr_AddSellTab (ZT("More").."...",	MORE_TAB);

	Atr_AddSellPanel ();

	Atr_SetupHookFunctions ();

	auctionsTabElements[1]  = AuctionsScrollFrame;
	auctionsTabElements[2]  = AuctionsButton1;
	auctionsTabElements[3]  = AuctionsButton2;
	auctionsTabElements[4]  = AuctionsButton3;
	auctionsTabElements[5]  = AuctionsButton4;
	auctionsTabElements[6]  = AuctionsButton5;
	auctionsTabElements[7]  = AuctionsButton6;
	auctionsTabElements[8]  = AuctionsButton7;
	auctionsTabElements[9]  = AuctionsButton8;
	auctionsTabElements[10] = AuctionsButton9;
	auctionsTabElements[11] = AuctionsQualitySort;
	auctionsTabElements[12] = AuctionsDurationSort;
	auctionsTabElements[13] = AuctionsHighBidderSort;
	auctionsTabElements[14] = AuctionsBidSort;
	auctionsTabElements[15] = AuctionsCancelAuctionButton;
	auctionsTabElements[16] = AuctionsTitle;
	auctionsTabElements[17] = AuctionsCreateAuctionButton;

	auctionsTabLeftElements[1] = StartPrice;
	auctionsTabLeftElements[2] = AuctionsShortAuctionButton;
	auctionsTabLeftElements[3] = AuctionsMediumAuctionButton;
	auctionsTabLeftElements[4] = AuctionsLongAuctionButton;
	auctionsTabLeftElements[5] = BuyoutPrice;
	auctionsTabLeftElements[6] = AuctionsItemButton;
	auctionsTabLeftElements[7] = AuctionsDepositMoneyFrame;

	if (WOWEcon_AH_AuctionPriceHistory_Enable) then
		auctionsTabLeftElements[8] = WOWEcon_AH_AuctionPriceHistory_Enable;
		auctionsTabLeftElements[9] = WOWEcon_AH_AuctionPriceHistory_Enable_Label;
	end

	recommendElements[1] = getglobal ("Atr_Recommend_Text");
	recommendElements[2] = getglobal ("Atr_RecommendPerItem_Text");
	recommendElements[3] = getglobal ("Atr_RecommendPerItem_Price");
	recommendElements[4] = getglobal ("Atr_RecommendPerStack_Text");
	recommendElements[5] = getglobal ("Atr_RecommendPerStack_Price");
	recommendElements[6] = getglobal ("Atr_Recommend_Basis_Text");
	recommendElements[7] = getglobal ("Atr_RecommendItem_Tex");

	-- create the lines that appear in the item history scroll pane

	local line, n;

	for n = 1, ITEM_HIST_NUM_LINES do
		local y = -5 - ((n-1)*16);
		line = CreateFrame("BUTTON", "AuctionatorHEntry"..n, Atr_Hlist, "Atr_HEntryTemplate");
		line:SetPoint("TOPLEFT", 0, y);
	end

	------------------------

	Atr_LocalizeFrames();

end


-----------------------------------------

function Atr_GetSellItemInfo ()

	local auctionItemName, auctionTexture, auctionCount = GetAuctionSellItemInfo();

	if (auctionItemName == nil) then
		auctionItemName = "";
		auctionCount	= 0;
	end

	local auctionItemLink = nil;

	-- only way to get sell itemlink that I can figure

	if (auctionItemName ~= "") then
		MyScanningTooltip:SetAuctionSellItem();
		local name;
		name, auctionItemLink = MyScanningTooltip:GetItem();

		if (auctionItemLink == nil) then
			return "",0,nil;
		end

	end

	return auctionItemName, auctionCount, auctionItemLink;

end


-----------------------------------------

function Atr_ResetSavedVars ()
	AUCTIONATOR_SAVEDVARS = ZC_CopyDeep (auctionator_savedvars_defaults);
end


--------------------------------------------------------------------------------
-- don't reference these directly; use the function below instead

local _AUCTIONATOR_SELL_TAB_INDEX = 0;
local _AUCTIONATOR_MORE_TAB_INDEX = 0;
local _AUCTIONATOR_BUY_TAB_INDEX = 0;

--------------------------------------------------------------------------------

function Atr_FindTabIndex (whichTab)

	if (_AUCTIONATOR_SELL_TAB_INDEX == 0) then

		local i = 4;
		while (true)  do
			local tab = getglobal('AuctionFrameTab'..i);
			if (tab == nil) then
				break;
			end

			if (tab.auctionatorTab) then
				if (tab.auctionatorTab == SELL_TAB)		then _AUCTIONATOR_SELL_TAB_INDEX = i; end;
				if (tab.auctionatorTab == MORE_TAB)		then _AUCTIONATOR_MORE_TAB_INDEX = i; end;
				if (tab.auctionatorTab == BUY_TAB)		then _AUCTIONATOR_BUY_TAB_INDEX = i; end;
			end

			i = i + 1;
		end
	end

	if (whichTab == SELL_TAB)	then return _AUCTIONATOR_SELL_TAB_INDEX ; end;
	if (whichTab == MORE_TAB)	then return _AUCTIONATOR_MORE_TAB_INDEX; end;
	if (whichTab == BUY_TAB)	then return _AUCTIONATOR_BUY_TAB_INDEX; end;

	return 0;
end


-----------------------------------------


function Atr_AuctionFrameTab_OnClick (self, index, down)

	if ( index == nil or type(index) == "string") then
		index = self:GetID();
	end

	getglobal("Atr_Sell_Panel"):Hide();

	gActionState = ATR_NOTHING;			-- just in case
	gItemPostingInProgress = false;		-- just in case

	if (index == 3) then
		Atr_ShowElems (auctionsTabElements);
		Atr_ShowElems (auctionsTabLeftElements);
	end

	auctionator_orig_AuctionFrameTab_OnClick (self, index, down);

	if (not Atr_IsAuctionatorTab(index)) then
		gForceMsgAreaUpdate = true;
		Atr_HideAllDialogs();
		AuctionFrameMoneyFrame:Show();
		gAutoSelling = false;

		if (AP_Bid_MoneyFrame) then		-- for the addon 'Auction Profit'
			if (AP_ShowBid)	then	AP_ShowHide_Bid_Button(1);	end;
			if (AP_ShowBO)	then	AP_ShowHide_BO_Button(1);	end;
		end


	elseif (Atr_IsAuctionatorTab(index)) then

		AuctionFrameAuctions:Hide();
		AuctionFrameBrowse:Hide();
		AuctionFrameBid:Hide();
		PlaySound("igCharacterInfoTab");

		PanelTemplates_SetTab(AuctionFrame, index);

		AuctionFrameTopLeft:SetTexture	("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-TopLeft");
		AuctionFrameTop:SetTexture		("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-Top");
		AuctionFrameTopRight:SetTexture	("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-TopRight");
		AuctionFrameBotLeft:SetTexture	("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-BotLeft");
		AuctionFrameBot:SetTexture		("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-Bot");
		AuctionFrameBotRight:SetTexture	("Interface\\AuctionFrame\\UI-AuctionFrame-Auction-BotRight");

		if (index == Atr_FindTabIndex(SELL_TAB))	then gCurrentPane = gSellPane; end;
		if (index == Atr_FindTabIndex(BUY_TAB))		then gCurrentPane = gShopPane; end;
		if (index == Atr_FindTabIndex(MORE_TAB))	then gCurrentPane = gMorePane; end;

		if (index == Atr_FindTabIndex(SELL_TAB))	then AuctionatorTitle:SetText (ZT("Auctionator - Sell")); end;
		if (index == Atr_FindTabIndex(BUY_TAB))		then AuctionatorTitle:SetText (ZT("Auctionator - Buy")); end;
		if (index == Atr_FindTabIndex(MORE_TAB))	then AuctionatorTitle:SetText (ZT("Auctionator - More...")); end;




		Atr_ClearHlist();
		Atr_CreateAuctionButton:Hide();
		Atr_BatchButton:Hide();
		Atr_Hlist:Hide();
		Atr_Hlist_ScrollFrame:Hide();
		Atr_Search_Box:Hide();
		Atr_Search_Button:Hide();
		Atr_AddToSListButton:Hide();
		Atr_RemFromSListButton:Hide();
		Atr_NewSListButton:Hide();
		Atr_DelSListButton:Hide();
		Atr_DropDown1:Hide();
		Atr_DropDownSL:Hide();
		Atr_CheckActiveButton:Hide();

		AuctionFrameMoneyFrame:Hide();

		if (index == Atr_FindTabIndex(SELL_TAB)) then
			AuctionFrameAuctions:Show();
			Atr_HideElems (auctionsTabElements);
			Atr_ShowElems (auctionsTabLeftElements);
			Atr_BatchButton:Show();
			Atr_CreateAuctionButton:Show();
		else
			Atr_Hlist:Show();
			Atr_Hlist_ScrollFrame:Show();
			if (gJustPosted_ItemName) then
				gJustPosted_ItemName = nil;
				gSellPane:SetItem ("");
			end
		end


		if (index == Atr_FindTabIndex(MORE_TAB)) then
			FauxScrollFrame_SetOffset (Atr_Hlist_ScrollFrame, gCurrentPane.hlistScrollOffset);
			Atr_DisplayHlist();
			Atr_DropDown1:Show();

			if (UIDropDownMenu_GetSelectedValue(Atr_DropDown1) == MODE_LIST_ACTIVE) then
				Atr_CheckActiveButton:SetText(ZT("Check for Undercuts"))
				Atr_CheckActiveButton:Show();
			end
		end


		if (index == Atr_FindTabIndex(BUY_TAB)) then
			Atr_Search_Box:Show();
			Atr_Search_Button:Show();
			AuctionFrameMoneyFrame:Show();
			Atr_BuildGlobalHistoryList(true);
			Atr_AddToSListButton:Show();
			Atr_RemFromSListButton:Show();
			Atr_NewSListButton:Show();
			Atr_DelSListButton:Show();
			Atr_DropDownSL:Show();
			Atr_Hlist:SetHeight (252);
			Atr_Hlist_ScrollFrame:SetHeight (252);
		else
			Atr_Hlist:SetHeight (335);
			Atr_Hlist_ScrollFrame:SetHeight (335);
		end

		if (index == Atr_FindTabIndex(BUY_TAB) or index == Atr_FindTabIndex(SELL_TAB)) then
			Atr_Buy1_Button:Show();
			Atr_Buy1_Button:Disable();
		end

		Atr_HideElems (recommendElements);

		getglobal("Atr_Sell_Panel"):Show();

		gCurrentPane.UINeedsUpdate = true;

		if (gOpenAllBags == 1) then
			OpenAllBags(true);
			gOpenAllBags = 0;
		end

	end

end

-----------------------------------------

function Atr_SelectPane (whichTab)

	local index = Atr_FindTabIndex(whichTab);
	local tab   = getglobal('AuctionFrameTab'..index);

	Atr_AuctionFrameTab_OnClick (tab, index);

end

-----------------------------------------

function Atr_IsModeCreateAuction ()
	return (Atr_IsTabSelected(SELL_TAB));
end


-----------------------------------------

function Atr_IsModeBuy ()
	return (Atr_IsTabSelected(BUY_TAB));
end

-----------------------------------------

function Atr_IsModeActiveAuctions ()
	return (Atr_IsTabSelected(MORE_TAB) and UIDropDownMenu_GetSelectedValue(Atr_DropDown1) == MODE_LIST_ACTIVE);
end


-----------------------------------------

function Atr_OnDropItem()

	if (GetCursorInfo() == "item") then

		if (Atr_IsTabSelected(MORE_TAB)) then
			Atr_SelectPane (SELL_TAB);		-- then fall through
		end

		if (Atr_IsTabSelected(SELL_TAB)) then
			ClickAuctionSellItemButton();
			ClearCursor();
			AuctionsFrameAuctions_ValidateAuction();
		end

		if (Atr_IsTabSelected(BUY_TAB)) then
			local iType, iID, iLink = GetCursorInfo();
			local iName = GetItemInfo (iLink);
			Atr_Search_Box:SetText (iName);
			Atr_Search_Onclick ();
			ClearCursor();
			AuctionsFrameAuctions_ValidateAuction();
			Atr_Hilite1:Hide();
		end
	end

end

-----------------------------------------

function Atr_ContainerFrameItemButton_OnModifiedClick (self, button)

	if (AUCTIONATOR_ENABLE_ALT ~= 0 and	AuctionFrame:IsShown() and IsAltKeyDown()) then

		local bagID  = this:GetParent():GetID();
		local slotID = this:GetID();

		if (not Atr_IsTabSelected(SELL_TAB)) then
			Atr_SelectPane (SELL_TAB);
		end

		if (IsControlKeyDown()) then
			Atr_ClearAll();
			Atr_AutoSplitAndPost (bagID, slotID);
			return;
		end

		PickupContainerItem(bagID, slotID);

		local infoType = GetCursorInfo()

		if (infoType == "item") then
			Atr_ClearAll();
			ClickAuctionSellItemButton();
			ClearCursor();
		end

		return;
	end

	return auctionator_orig_ContainerFrameItemButton_OnModifiedClick (self, button);

end

-----------------------------------------

function Atr_AutoSplitAndPost (bagID, slotID)

	local b1, s1 = Atr_FindOrCreateSingleton (bagID, slotID);

	gAutoBatch_bagID  = b1;
	gAutoBatch_slotID = s1;

	if (gAutoBatch_bagID == nil) then
		Atr_Error_Text:SetText (ZT("To split off a single item you must\n\nhave at least one empty slot in your bags."));
		Atr_Error_Frame.withMask = 1;
		Atr_Error_Frame:Show ();
	end

end

---------------------------------------------------------

function Atr_Idle_CheckForAutoSplit ()

	if (gAutoBatch_bagID) then
		local itemLink = GetContainerItemLink(gAutoBatch_bagID, gAutoBatch_slotID);		-- check to see if singleton has "arrived"
		if (itemLink) then
			PickupContainerItem(gAutoBatch_bagID, gAutoBatch_slotID);

			ClickAuctionSellItemButton();
			ClearCursor();

			gAutoBatch_bagID  = nil;
		end
	end
end

-----------------------------------------

function Atr_FindOrCreateSingleton (bagID, slotID)

	local searchLink = GetContainerItemLink(bagID, slotID);
	local searchName = GetItemInfo(searchLink);

	local b, s, bx, sx;

	-- first look for a singleton

	for b = kFirstBag, kLastBag do
		local numslots = GetContainerNumSlots (b);
		for s = 1,numslots do
			local itemLink = GetContainerItemLink(b, s);
			if (itemLink == nil) then
				bx = b;
				sx = s;
			else
				local itemName = GetItemInfo(itemLink);
				if (itemName == searchName) then
					local texture, itemCount = GetContainerItemInfo(b, s);
					if (itemCount == 1) then
						return b, s;
					end
				end
			end
		end
	end

	-- split off a singleton if there's an empty slot

	if (bx) then
		SplitContainerItem  (bagID, slotID, 1);
		PickupContainerItem (bx, sx);
		return bx, sx;
	end

	-- oh well

	return nil, nil;
end

-----------------------------------------

function BeginAutoSell ()

	local maxStacks = math.floor (gBS_TotalItems / gBS_GoodStackSize);

	if (Atr_Batch_NumAuctions:GetNumber() > maxStacks) then
		local s = string.format (ZT("You can create at most %d auctions"), maxStacks);
		Atr_Error_Text:SetText (s);
		Atr_Error_Frame:Show ();
		return;
	end

	if (Atr_Batch_Stacksize:GetNumber() > gBS_FullStackSize) then
		local s = string.format (ZT("You can stack at most %d of these items"), gBS_FullStackSize);
		Atr_Error_Text:SetText (s);
		Atr_Error_Frame:Show ();
		return;
	end

	gAutoSelling = true;	-- must come before potential ClickAuctionSellItemButton

	local _, _, auctionCount = GetAuctionSellItemInfo();

	if (gBS_GoodStackSize ~= auctionCount) then		-- she changed the stacksize
		ClearCursor();
		ClickAuctionSellItemButton();
		ClearCursor();

		Atr_SetPreferredStackSize (gBS_ItemLink, gBS_GoodStackSize);
	end

--	ZC_chatmsg ("BeginAutoSell");

	gBS_NumAuctionsToCreate	= Atr_Batch_NumAuctions:GetNumber();

	Atr_Batch_Frame:Hide();

	gJustPosted_ItemName	= gBS_ItemName;
	gJustPosted_BuyoutPrice	= gBS_Buyout_StackPrice;
	gJustPosted_StackSize	= gBS_GoodStackSize;
	gJustPosted_ItemLink	= gBS_ItemLink;

	local bagID, slotID, numslots;

	-- build a table of all the slots that contain the item

	cslots			= {};
	gEmptyBScached	= nil;

	for bagID = kFirstBag, kLastBag do
		numslots = GetContainerNumSlots (bagID);
		for slotID = 1,numslots do
			local itemLink = GetContainerItemLink(bagID, slotID);
			if (itemLink) then
				local itemName = GetItemInfo(itemLink);
				if (itemName == gBS_ItemName) then
					local bs = {};
					bs.bagID  = bagID;
					bs.slotID = slotID;
					tinsert (cslots, bs);
				end
			end
		end
	end

	-- get it going (see the idle loop)

	gAutoSellState 			= SETTLED
	gBS_AuctionNum	= 1;
end




-----------------------------------------

function Atr_AuctionFrameAuctions_Update()

	auctionator_orig_AuctionFrameAuctions_Update();

	if (Atr_IsTabSelected()  and	AuctionFrame:IsShown()) then
		Atr_HideElems (auctionsTabElements);
	end


end

-----------------------------------------
-- Intercept the Create Auction click so
-- that we can note the auction values
-----------------------------------------

function Atr_CreateAuctionButton_OnClick(...)

	if (Atr_IsTabSelected(SELL_TAB) and AuctionFrame:IsShown()) then

		if (MoneyInputFrame_GetCopper(BuyoutPrice) == 0) then
			Atr_Confirm_Text:SetText (ZT("Are you sure you want to create\nan auction with no buyout price?"));
			Atr_Confirm_Frame:Show ();
			Atr_Confirm_Proc_Yes = Atr_CreateAuction_Click;
		else
			Atr_CreateAuction_Click()
		end

	else
		AuctionsCreateAuctionButton_OnClick(...);
	end


end

-----------------------------------------

function Atr_CreateAuction_Click()

	gJustPosted_BuyoutPrice	= MoneyInputFrame_GetCopper(BuyoutPrice);
	gJustPosted_ItemName	= gCurrentPane.itemName;
	gJustPosted_StackSize	= gCurrentPane.stackSize;
	gJustPosted_ItemLink	= gCurrentPane.itemLink;

	gItemPostingInProgress = true;

	gCurrentPane:SetToShowCurrent();

	AuctionsCreateAuctionButton_OnClick();
end


-----------------------------------------

function Atr_SetPreferredStackSize (itemLink, stackSize)

	local name = GetItemInfo (itemLink);

	if (name and ZC_StringStartsWith (name, ZT("glyph of"))) then
		return;
	end

	if (AUCTIONATOR_PREF_STACK == nil) then
		AUCTIONATOR_PREF_STACK = {};
	end

	local itemID = ZC_ItemIDfromLink (itemLink);

	AUCTIONATOR_PREF_STACK[itemID] = stackSize;
end

-----------------------------------------

function Atr_GetPreferredStackSize (itemLink)

	local name = GetItemInfo (itemLink);

	if (name and ZC_StringStartsWith (name, ZT("glyph of"))) then
		return 1;
	end

	if (AUCTIONATOR_PREF_STACK) then
		local itemID = ZC_ItemIDfromLink (itemLink);
		if (AUCTIONATOR_PREF_STACK[itemID]) then
			return AUCTIONATOR_PREF_STACK[itemID];
		end
	end

	return nil;
end

-----------------------------------------

function Atr_LogMsg (itemlink, itemcount, price)

	local logmsg = string.format (ZT("Auction created for %s"), itemlink);
	if (itemcount > 1) then
		logmsg = logmsg.."x"..itemcount;
	end

	logmsg = logmsg.."   "..ZC_priceToString(price);

	ZC_chatmsg (logmsg, .9, .9, .2);

end

-----------------------------------------

function Atr_OnAuctionOwnedUpdate ()

	gItemPostingInProgress = false;

	if (Atr_IsModeActiveAuctions()) then
		gHlistNeedsUpdate = true;
	end

	if (not Atr_IsTabSelected()) then
		Atr_ClearScanCache();		-- if not our tab, we have no idea what happened so must flush all caches
		return;
	end;

	gActiveAuctions = {};		-- always flush this cache

	if (gAutoSelling) then
		if (gAutoSellState == AUCTION_POST_PENDING) then
			gAutoSellState = SETTLED;
			gBS_AuctionNum = gBS_AuctionNum + 1;
		end
	end

	if (gAutoSelling) then

		local s = string.format (ZT("Auction #%d created for %s"), gBS_AuctionNum-1, gBS_ItemName);
		Atr_Recommend_Text:SetText (s);
		MoneyFrame_Update ("Atr_RecommendPerStack_Price", gBS_Buyout_StackPrice);
		Atr_SetTextureButton ("Atr_RecommendItem_Tex", gBS_GoodStackSize, gBS_ItemLink);

		Atr_LogMsg (gBS_ItemLink, gBS_GoodStackSize, gBS_Buyout_StackPrice);
		if (gBS_AuctionNum-1 == gBS_NumAuctionsToCreate) then
			Atr_AddHistoricalPrice (gBS_ItemName, gBS_Buyout_StackPrice / gBS_GoodStackSize, gBS_GoodStackSize, gBS_ItemLink);

			Atr_AddToScan (gBS_ItemName, gBS_GoodStackSize, gBS_Buyout_StackPrice, gBS_NumAuctionsToCreate);

			gJustPosted_ItemName = gBS_ItemName;

			gAutoSelling = false;
			Atr_OnNewAuctionUpdate ();  -- been surpressing this during autoselling - need to call now
		else
			Atr_RedisplayAuctions();
		end

	elseif (gJustPosted_ItemName) then

		Atr_LogMsg (gJustPosted_ItemLink, gJustPosted_StackSize, gJustPosted_BuyoutPrice);

		Atr_AddHistoricalPrice (gJustPosted_ItemName, gJustPosted_BuyoutPrice / gJustPosted_StackSize, gJustPosted_StackSize, gJustPosted_ItemLink);

		Atr_AddToScan (gJustPosted_ItemName, gJustPosted_StackSize, gJustPosted_BuyoutPrice, 1);
	end


end

-----------------------------------------

function Atr_ResetDuration()

	if (AUCTIONATOR_DEF_DURATION == "S") then AuctionsRadioButton_OnClick(nil, nil, nil, 1); end;
	if (AUCTIONATOR_DEF_DURATION == "M") then AuctionsRadioButton_OnClick(nil, nil, nil, 2); end;
	if (AUCTIONATOR_DEF_DURATION == "L") then AuctionsRadioButton_OnClick(nil, nil, nil, 3); end;

end

-----------------------------------------

function Atr_AddToScan (itemName, stackSize, buyoutPrice, numAuctions)

	local scan = Atr_FindScan (itemName);

	scan:AddScanItem (itemName, stackSize, buyoutPrice, UnitName("player"), numAuctions);

	scan:CondenseAndSort ();

	gCurrentPane.UINeedsUpdate = true;
end

-----------------------------------------

function AuctionatorSubtractFromScan (itemName, stackSize, buyoutPrice, howMany)

	if (howMany == nil) then
		howMany = 1;
	end

	local scan = Atr_FindScan (itemName);

	local x;
	for x = 1, howMany do
		scan:SubtractScanItem (itemName, stackSize, buyoutPrice);
	end

	scan:CondenseAndSort ();

	gCurrentPane.UINeedsUpdate = true;
end


-----------------------------------------

function auctionator_ChatEdit_InsertLink(text)

	if (AuctionFrame:IsShown() and IsShiftKeyDown() and Atr_IsTabSelected(BUY_TAB)) then
		local item;
		if ( strfind(text, "item:", 1, true) ) then
			item = GetItemInfo(text);
		end
		if ( item ) then
			Atr_Search_Box:SetText (item);
			Atr_Search_Onclick ();
			return true;
		end
	end

	return auctionator_orig_ChatEdit_InsertLink(text);

end

-----------------------------------------

function auctionator_ChatFrame_OnEvent(self, event, ...)

	if (event == "CHAT_MSG_SYSTEM") then
		if (arg1 == ERR_AUCTION_STARTED) then		-- absorb the Auction Created message
			return;
		end
	end

	return auctionator_orig_ChatFrame_OnEvent (self, event, ...);

end

-----------------------------------------

function auctionator_FriendsFrame_OnEvent(self, event, ...)

	if (event == "WHO_LIST_UPDATE" and gQuietWho > 0 and time() - gQuietWho < 5) then
		return;
	end

	gQuietWho = 0;

	return auctionator_orig_FriendsFrame_OnEvent (self, event, ...);

end




-----------------------------------------

function auctionator_CanShowRightUIPanel(frame)

	if (ZC_StringSame (frame:GetName(), "TradeSkillFrame")) then
		return 1;
	end;

	return auctionator_orig_CanShowRightUIPanel(frame);

end

-----------------------------------------

function Atr_AddSellPanel ()

	local frame = CreateFrame("FRAME", "Atr_Sell_Panel", AuctionFrame, "Atr_Sell_Template");
	frame:Hide();

	UIDropDownMenu_SetWidth (Atr_DropDownSL, 150, 5);
	UIDropDownMenu_JustifyText (Atr_DropDownSL, "CENTER");
end

-----------------------------------------

function Atr_AddSellTab (tabtext, whichTab)

	local n = AuctionFrame.numTabs+1;

	local framename = "AuctionFrameTab"..n;

	local frame = CreateFrame("Button", framename, AuctionFrame, "AuctionTabTemplate");

	frame:SetID(n);
	frame:SetText(tabtext);

	--frame:SetNormalFontObject(getglobal("AtrFontOrange"));

	frame.auctionatorTab = whichTab;

	frame:SetPoint("LEFT", getglobal("AuctionFrameTab"..n-1), "RIGHT", -8, 0);

	PanelTemplates_SetNumTabs (AuctionFrame, n);
	PanelTemplates_EnableTab  (AuctionFrame, n);

	return AtrPane.create (whichTab);
end

-----------------------------------------

function Atr_HideElems (tt)

	if (not tt) then
		return;
	end

	for i,x in ipairs(tt) do
		x:Hide();
	end
end

-----------------------------------------

function Atr_ShowElems (tt)

	for i,x in ipairs(tt) do
		x:Show();
	end
end


-----------------------------------------

function Atr_CreatePageSig ()

	local sig = "<empty>";

	local numBatchAuctions, totalAuctions = GetNumAuctionItems("list");

	if (numBatchAuctions > 0) then
		local name, texture, count, quality, canUse, level, minBid, minIncrement, buyoutPrice, bidAmount = GetAuctionItemInfo("list", 1);

		sig = numBatchAuctions.."_"..totalAuctions.."_"..name.."_"..minBid.."_"..buyoutPrice.."_"..bidAmount;
	end

	return sig;
end

-----------------------------------------

function Atr_OnAuctionUpdate ()

	if (gAtr_FullScanState == ATR_FS_STARTED) then
		Atr_FullScanAnalyze();
		return;
	end

	if (not Atr_IsTabSelected()) then
		Atr_ClearScanCache();		-- if not our tab, we have no idea what happened so must flush all caches
		return;
	end;

	if (gActionState == ATR_BUYING) then
		gActionState = ATR_NOTHING;
		Atr_Continue_Buying ();
		return;
	elseif (gActionState == ATR_JUST_BOUGHT) then
		gActionState = ATR_NOTHING;
		Atr_AdjustScanForBoughtItem();
		return;
	end

	-- we can get all sorts of extraneous AUCTION_ITEM_LIST_UPDATE events between when the QueryAuctionItems call goes out and the
	-- page reflects the data for that call.  So the page signature is used to test whether the page has actually changed since the
	-- query went out, so that we know this is the page we really want to analyze

	if (gCurrentPane.activeScan.processing_state == KM_POSTQUERY) then

--[[
		local oldsig = gCurrentPane.activeScan.prequeryPageSig;
		local newsig = Atr_CreatePageSig();

		local pageHasChanged	 = (oldsig ~= newsig);
		local elapsedTime		 = gAtr_ptime - gCurrentPane.activeScan.query_sent_when;
		local containsSearchText = ZC_StringContains (newsig, gCurrentPane.activeScan.itemName);

		if (not containsSearchText and gCurrentPane.activeScan.itemNameSoft) then
			containsSearchText = ZC_StringContains (newsig, gCurrentPane.activeScan.itemNameSoft);
		end

		local ets = string.format ("%4.2f", elapsedTime);
		ZC_chatmsg(ets.."  state: "..gCurrentPane.activeScan.processing_state.."  "..ZC_BoolToString(pageHasChanged).."  "..gCurrentPane.activeScan.itemName.." |cffffaaaa"..oldsig.."|r "..newsig)
]]--

--		if ((pageHasChanged and containsSearchText) or elapsedTime > 1.5) then

			local done = gCurrentPane.activeScan:AnalyzeResultsPage();

			if (done) then
				gCurrentPane.activeScan:Finish();
				Atr_OnNewScanComplete ();
			end
--		end
	end

end

-----------------------------------------

function Atr_OnNewScanComplete ()

	gCurrentPane.sortedHist = nil;

	if (Atr_IsModeCreateAuction()) then

		gCurrentPane:SetToShowCurrent();

		if (#gCurrentPane.activeScan.scanData == 0) then
			local hints = Atr_BuildHints (gCurrentPane.itemLink, gCurrentPane.itemName);
			if (#hints > 0) then
				gCurrentPane:SetToShowHints();
			end
		end

		if (gCurrentPane:ShowCurrent()) then
			Atr_FindBestCurrentAuction ();
		end
	else
		if (Atr_IsModeActiveAuctions()) then
			Atr_DisplayHlist();
		end

		Atr_FindBestCurrentAuction ();
	end

	if (Atr_IsModeBuy()) then
		Atr_Shop_OnFinishScan ();
	end

	if (gAtr_CheckingActive_State == ATR_CACT_PROCESSING) then
		ZC_AddDeferredCall (0.1, "Atr_CheckingActive_Next");		-- need to defer so UI can update
	end

	gCurrentPane.UINeedsUpdate = true;

end

-----------------------------------------

function Atr_ClearTop ()
	Atr_HideElems (recommendElements);

	AuctionatorMessageFrame:Hide();
	AuctionatorMessage2Frame:Hide();
end

-----------------------------------------

function Atr_ClearList ()

	Atr_Col1_Heading:Hide();
	Atr_Col3_Heading:Hide();
	Atr_Col4_Heading:Hide();

	local line;							-- 1 through 12 of our window to scroll

	FauxScrollFrame_Update (AuctionatorScrollFrame, 0, 12, 16);

	for line = 1,12 do
		local lineEntry = getglobal ("AuctionatorEntry"..line);
		lineEntry:Hide();
	end

end

-----------------------------------------

function Atr_ClearAll ()
	Atr_ClearTop();
	Atr_ClearList();
end

-----------------------------------------

function Atr_SetMessage (msg)
	Atr_HideElems (recommendElements);

	if (gCurrentPane.itemLink) then

		Atr_ShowItemNameAndTexture (gCurrentPane.itemName);

		AuctionatorMessage2Frame:SetText (msg);
		AuctionatorMessage2Frame:Show();

	else
		AuctionatorMessageFrame:SetText (msg);
		AuctionatorMessageFrame:Show();
		AuctionatorMessage2Frame:Hide();
	end
end

-----------------------------------------

function Atr_ShowItemNameAndTexture(itemName)

	AuctionatorMessageFrame:Hide();
	AuctionatorMessage2Frame:Hide();

	Atr_Recommend_Text:Show ();
	Atr_Recommend_Text:SetText (itemName);
	Atr_RecommendItem_Tex:Show();

	Atr_SetTextureButton ("Atr_RecommendItem_Tex", 1);
end



-----------------------------------------

function Atr_SortHistoryData (x, y)

	return x.when > y.when;

end

-----------------------------------------

function BuildHtag (type, y, m, d)

	local t = time({year=y, month=m, day=d, hour=0});

	return tostring (ToTightTime(t))..":"..type;
end

-----------------------------------------

function ParseHtag (tag)
	local when, type = strsplit(":", tag);

	if (type == nil) then
		type = "hx";
	end

	when = FromTightTime (tonumber (when));

	return when, type;
end

-----------------------------------------

function ParseHist (tag, hist)

	local when, type = ParseHtag(tag);

	local price, count	= strsplit(":", hist);

	price = tonumber (price);

	local stacksize, numauctions;

	if (type == "hx") then
		stacksize	= tonumber (count);
		numauctions	= 1;
	else
		stacksize = 0;
		numauctions	= tonumber (count);
	end

	return when, type, price, stacksize, numauctions;

end

-----------------------------------------

function CalcAbsTimes (when, whent)

	local absYear	= whent.year - 2000;
	local absMonth	= (absYear * 12) + whent.month;
	local absDay	= floor ((when - gTimeZero) / (60*60*24));

	return absYear, absMonth, absDay;

end

-----------------------------------------

function Atr_Condense_History (itemname)

	if (AUCTIONATOR_PRICING_HISTORY[itemname] == nil) then
		return;
	end

	local tempHistory = {};

	local now			= time();
	local nowt			= date("*t", now);

	local absNowYear, absNowMonth, absNowDay = CalcAbsTimes (now, nowt);

	local n = 1;
	local tag, hist, newtag, stacksize, numauctions;
	for tag, hist in pairs (AUCTIONATOR_PRICING_HISTORY[itemname]) do
		if (tag ~= "is") then

			local when, type, price, stacksize, numauctions = ParseHist (tag, hist);

			local whnt = date("*t", when);

			local absYear, absMonth, absDay	= CalcAbsTimes (when, whnt);

			if (absNowYear - absYear >= 3) then
				newtag = BuildHtag ("hy", whnt.year, 1, 1);
			elseif (absNowMonth - absMonth >= 2) then
				newtag = BuildHtag ("hm", whnt.year, whnt.month, 1);
			elseif (absNowDay - absDay >= 2) then
				newtag = BuildHtag ("hd", whnt.year, whnt.month, whnt.day);
			else
				newtag = tag;
			end

			tempHistory[n] = {};
			tempHistory[n].price		= price;
			tempHistory[n].numauctions	= numauctions;
			tempHistory[n].stacksize	= stacksize;
			tempHistory[n].when			= when;
			tempHistory[n].newtag		= newtag;
			n = n + 1;
		end
	end

	-- clear all the existing history

	local is = AUCTIONATOR_PRICING_HISTORY[itemname]["is"];

	AUCTIONATOR_PRICING_HISTORY[itemname] = {};
	AUCTIONATOR_PRICING_HISTORY[itemname]["is"] = is;

	-- repopulate the history

	local x;

	for x = 1,#tempHistory do

		local thist		= tempHistory[x];
		local newtag	= thist.newtag;

		if (AUCTIONATOR_PRICING_HISTORY[itemname][newtag] == nil) then

			local when, type = ParseHtag (newtag);

			local count = thist.numauctions;
			if (type == "hx") then
				count = thist.stacksize;
			end

			AUCTIONATOR_PRICING_HISTORY[itemname][newtag] = tostring(thist.price)..":"..tostring(count);

		else

			local hist = AUCTIONATOR_PRICING_HISTORY[itemname][newtag];

			local when, type, price, stacksize, numauctions = ParseHist (newtag, hist);

			local newNumAuctions = numauctions + thist.numauctions;
			local newPrice		 = ((price * numauctions) + (thist.price * thist.numauctions)) / newNumAuctions;

			AUCTIONATOR_PRICING_HISTORY[itemname][newtag] = tostring(newPrice)..":"..tostring(newNumAuctions);
		end
	end

end

-----------------------------------------

function Atr_Process_Historydata ()

	-- Condense the data if needed - only once per session for each item

	if (gCondensedThisSession[gCurrentPane.itemName] == nil) then

		gCondensedThisSession[gCurrentPane.itemName] = true;

		Atr_Condense_History(gCurrentPane.itemName);
	end

	-- build the sorted history list

	gCurrentPane.sortedHist = {};

	if (AUCTIONATOR_PRICING_HISTORY[gCurrentPane.itemName]) then
		local n = 1;
		local tag, hist;
		for tag, hist in pairs (AUCTIONATOR_PRICING_HISTORY[gCurrentPane.itemName]) do
			if (tag ~= "is") then
				local when, type, price, stacksize, numauctions = ParseHist (tag, hist);

				if (stacksize == 0) then
					stacksize = numauctions;
				end

				gCurrentPane.sortedHist[n]				= {};
				gCurrentPane.sortedHist[n].itemPrice	= price;
				gCurrentPane.sortedHist[n].buyoutPrice	= price * stacksize;
				gCurrentPane.sortedHist[n].stackSize	= stacksize;
				gCurrentPane.sortedHist[n].when			= when;
				gCurrentPane.sortedHist[n].yours		= true;
				gCurrentPane.sortedHist[n].type			= type;

				n = n + 1;
			end
		end
	end

	table.sort (gCurrentPane.sortedHist, Atr_SortHistoryData);

	if (#gCurrentPane.sortedHist > 0) then
		return gCurrentPane.sortedHist[1].itemPrice;
	end

end

-----------------------------------------

function Atr_GetMostRecentSale (itemName)

	local recentPrice;
	local recentWhen = 0;

	if (AUCTIONATOR_PRICING_HISTORY and AUCTIONATOR_PRICING_HISTORY[itemName]) then
		local n = 1;
		local tag, hist;
		for tag, hist in pairs (AUCTIONATOR_PRICING_HISTORY[itemName]) do
			if (tag ~= "is") then
				local when, type, price = ParseHist (tag, hist);

				if (when > recentWhen) then
					recentPrice = price;
					recentWhen  = when;
				end
			end
		end
	end

	return recentPrice;

end

-----------------------------------------

function Atr_ShowingCurrentAuctions ()
	if (gCurrentPane) then
		return gCurrentPane:ShowCurrent();
	end

	return true;
end

-----------------------------------------

function Atr_ShowingHistory ()
	if (gCurrentPane) then
		return gCurrentPane:ShowHistory();
	end

	return false;
end

-----------------------------------------

function Atr_ShowingHints ()
	if (gCurrentPane) then
		return gCurrentPane:ShowHints();
	end

	return false;
end


-----------------------------------------

local function Atr_CalcStackPrice (stackSize, baseBuyoutPrice, baseStackSize)  -- eliminates rounding error

	if (stackSize == baseStackSize) then
		return baseBuyoutPrice;
	end

	return math.floor (baseBuyoutPrice * (stackSize / baseStackSize));
end

-----------------------------------------

function Atr_UpdateRecommendation ()

	if (gCurrentPane == gSellPane and gJustPosted_ItemLink and GetAuctionSellItemInfo() == nil) then
		return;
	end

	local basedata;

	if (Atr_ShowingCurrentAuctions()) then

		if (gCurrentPane.activeScan.processing_state ~= KM_NULL_STATE) then
			return;
		end

		if (#gCurrentPane.activeScan.sortedData == 0) then
			Atr_SetMessage (ZT("No current auctions found"));
			return;
		end

		if (not gCurrentPane.currIndex) then
			if (gCurrentPane.activeScan.numMatches == 0) then
				Atr_SetMessage (ZT("No current auctions found\n\n(related auctions shown)"));
			elseif (gCurrentPane.activeScan.numMatchesWithBuyout == 0) then
				Atr_SetMessage (ZT("No current auctions with buyouts found"));
			else
				Atr_SetMessage ("");
			end
			return;
		end

		basedata = gCurrentPane.activeScan.sortedData[gCurrentPane.currIndex];

	elseif (Atr_ShowingHistory()) then

		basedata = ZC_GetArrayElemOrFirst (gCurrentPane.sortedHist, gCurrentPane.histIndex);

		if (basedata == nil) then
			Atr_SetMessage (ZT("Auctionator has yet to record any auctions for this item"));
			return;
		end

	else	-- hints

		local data = ZC_GetArrayElemOrFirst (gCurrentPane.hints, gCurrentPane.hintsIndex);

		if (data) then
			basedata = {};
			basedata.itemPrice		= data.price;
			basedata.buyoutPrice	= data.price;
			basedata.stackSize		= 1;
			basedata.sourceText		= data.text;
			basedata.yours			= true;		-- so no discounting
		end
	end

	if (not Atr_IsModeCreateAuction()) then

		Atr_HideElems (recommendElements);
		Atr_ShowItemNameAndTexture (gCurrentPane.itemName);
		return;
	end

	if (gCurrentPane.stackSize == 0) then
		return;
	end

	local new_Item_BuyoutPrice;

	if (gItemPostingInProgress and gCurrentPane.itemLink == gJustPosted_ItemLink) then	-- handle the unusual case where server is still in the process of creating the last auction

--		newStackBuyoutPrice = Atr_CalcStackPrice (gCurrentPane.stackSize, gJustPosted_BuyoutPrice, gJustPosted_StackSize);
		new_Item_BuyoutPrice = gJustPosted_BuyoutPrice / gJustPosted_StackSize;

	elseif (basedata) then			-- the normal case

--		newStackBuyoutPrice = Atr_CalcStackPrice (gCurrentPane.stackSize, basedata.buyoutPrice, basedata.stackSize)
		new_Item_BuyoutPrice = basedata.itemPrice;

		if (not basedata.yours and not basedata.altname) then
			new_Item_BuyoutPrice = Atr_CalcUndercutPrice (new_Item_BuyoutPrice);
		end
	end

	if (new_Item_BuyoutPrice == nil) then
		return;
	end

	local new_Item_StartPrice = Atr_CalcStartPrice (new_Item_BuyoutPrice);

	Atr_ShowElems (recommendElements);
	AuctionatorMessageFrame:Hide();
	AuctionatorMessage2Frame:Hide();

	Atr_Recommend_Text:SetText ("Recommended Buyout Price");
	Atr_RecommendPerStack_Text:SetText (string.format (ZT("for your stack of %d"), gCurrentPane.stackSize));

	Atr_SetTextureButton ("Atr_RecommendItem_Tex", gCurrentPane.stackSize);


	MoneyFrame_Update ("Atr_RecommendPerItem_Price",  ZC_round(new_Item_BuyoutPrice));
	MoneyFrame_Update ("Atr_RecommendPerStack_Price", ZC_round(new_Item_BuyoutPrice * gCurrentPane.stackSize));

	MoneyInputFrame_SetCopper (BuyoutPrice, new_Item_BuyoutPrice * gCurrentPane.stackSize);
	MoneyInputFrame_SetCopper (StartPrice,  new_Item_StartPrice * gCurrentPane.stackSize);

	local cheapestStack = gCurrentPane.activeScan.bestPrices[gCurrentPane.stackSize];

	Atr_Recommend_Basis_Text:SetTextColor (1,1,1);

	if (Atr_ShowingHints()) then
		Atr_Recommend_Basis_Text:SetTextColor (.8,.8,1);
		Atr_Recommend_Basis_Text:SetText ("("..ZT("based on").." "..basedata.sourceText..")");
	elseif (gCurrentPane.activeScan.absoluteBest and basedata.stackSize == gCurrentPane.activeScan.absoluteBest.stackSize and basedata.buyoutPrice == gCurrentPane.activeScan.absoluteBest.buyoutPrice) then
		Atr_Recommend_Basis_Text:SetText ("("..ZT("based on cheapest current auction")..")");
	elseif (cheapestStack and basedata.stackSize == cheapestStack.stackSize and basedata.buyoutPrice == cheapestStack.buyoutPrice) then
		Atr_Recommend_Basis_Text:SetText ("("..ZT("based on cheapest stack of the same size")..")");
	else
		Atr_Recommend_Basis_Text:SetText ("("..ZT("based on selected auction")..")");
	end

end

-----------------------------------------

function Atr_Find_More (pItemName, pItemCount)

	if (pItemName == nil) then
		return false;
	end

	local bagID, slotID, numslots;
	local foundSoFar = 0;

	for bagID = kFirstBag, kLastBag do
		numslots = GetContainerNumSlots (bagID);
		for slotID = 1,numslots do
			local itemLink = GetContainerItemLink(bagID, slotID);
			if (itemLink) then
				local itemName = GetItemInfo(itemLink);

				if (itemName == pItemName) then
					local _, itemCount = GetContainerItemInfo(bagID, slotID);
					foundSoFar = foundSoFar + itemCount;
--					if (foundSoFar >= pItemCount * 2) then
					if (foundSoFar >= 2) then
						return true;
					end
				end
			end
		end
	end

	return false;

end

-----------------------------------------

function Atr_SetTextureButton(elementName, count, itemlink)

	if (not itemlink) then
		itemlink = gCurrentPane.itemLink;
		if (itemlink == nil) then
			itemlink = gCurrentPane.activeScan.itemLink;
		end
	end

	texture = GetItemIcon (itemlink);

	local textureElement = getglobal (elementName);
	local countElement   = getglobal (elementName.."Count");

	if (texture) then
		textureElement:SetNormalTexture (texture);
		if (count > 1) then
			countElement:SetText (count);
			countElement:Show();
		else
			countElement:Hide();
		end
	else
		textureElement:Hide();
	end

end

-----------------------------------------

function Atr_ShowRecTooltip ()

	local link = gCurrentPane.itemLink;
	local num  = gCurrentPane.stackSize;

	if (not link) then
		link = gCurrentPane.activeScan.itemLink;
	end
	if (not link) then
		link = gJustPosted_ItemLink;
		num  = gJustPosted_StackSize;
	end

	if (link) then
		if (num < 1) then num = 1; end;

		GameTooltip:SetOwner(Atr_RecommendItem_Tex, "ANCHOR_RIGHT");
		GameTooltip:SetHyperlink (link, num);
		gCurrentPane.tooltipvisible = true;
	end

end

-----------------------------------------

function Atr_HideRecTooltip ()

	gCurrentPane.tooltipvisible = nil;
	GameTooltip:Hide();

end

-----------------------------------------

local gFirstAHopening = true;

-----------------------------------------

function Atr_OnAuctionHouseShow()

	gOpenAllBags = AUCTIONATOR_OPEN_ALL_BAGS;

	if (AUCTIONATOR_DEFTAB == 1) then		Atr_SelectPane (SELL_TAB);	end
	if (AUCTIONATOR_DEFTAB == 2) then		Atr_SelectPane (BUY_TAB);	end
	if (AUCTIONATOR_DEFTAB == 3) then		Atr_SelectPane (MORE_TAB);	end

	Atr_ResetDuration();

	if (gJustPosted_ItemName) then
		gJustPosted_ItemName = nil;
		gSellPane:SetItem ("", nil);
	end


	if (gFirstAHopening) then
		gFirstAHopening = false;

		if (UnitFactionGroup ("player") == "Alliance") then
			Atr_PollWho ('z-"Ironforge" 1-70');
		else
			Atr_PollWho ('z-"Orgrimmar" 1-70');
		end
	end


end

-----------------------------------------

function Atr_OnAuctionHouseClosed()

	Atr_HideAllDialogs();
	gAutoSelling = false;

	Atr_ClearScanCache();

	gSellPane:SetItem ("");
	gShopPane:SetItem ("");
	gMorePane:SetItem ("");

end

-----------------------------------------

function Atr_HideAllDialogs()

	AuctionatorOptionsFrame:Hide();
	AuctionatorDescriptionFrame:Hide();
	AuctionatorUndercuttingConfig:Hide();
	AuctionatorBasicOptionsFrame:Hide();
	Atr_Batch_Frame:Hide();
	Atr_Error_Frame:Hide();
	Atr_Mask:Hide();

end



-----------------------------------------

function Atr_BasicOptionsUpdate(self, elapsed)

	self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed;

	if (self.TimeSinceLastUpdate > 0.25) then

		self.TimeSinceLastUpdate = 0;

		if (AuctionatorOption_Def_Duration_CB:GetChecked()) then
			AuctionatorOption_Durations:Show();
		else
			AuctionatorOption_Durations:Hide();
		end

	end
end

-----------------------------------------

local wasInRaid = false;
local wasInBG   = false;

-----------------------------------------

function Atr_CheckRaidForMessaging(self, elapsed)

	local nowInBG = (select(2, IsInInstance()) == "pvp");

	if (nowInBG and not wasInBG) then
		SendAddonMessage ("ATR", "V_"..AuctionatorVersion, "BATTLEGROUND");
	end

	wasInBG = nowInBG;

	if (not nowInBG) then
		local nowInRaid = (GetNumRaidMembers() > 0 or GetNumPartyMembers() > 0);

		if (nowInRaid and not wasInRaid) then

			if (GetNumRaidMembers() > 0) then
				SendAddonMessage ("ATR", "V_"..AuctionatorVersion, "RAID");
			else
				SendAddonMessage ("ATR", "V_"..AuctionatorVersion, "PARTY");
			end
		end

		wasInRaid = nowInRaid;
	end
end

-----------------------------------------

function Atr_OnUpdate(self, elapsed)

	-- update the global "precision" timer

	gAtr_ptime = gAtr_ptime and gAtr_ptime + elapsed or 0;

	-- check whether we should send out messages to raid/party/bg

	if (ZC_periodic (self, "crfm_lastUpdate", 5, elapsed)) then
		Atr_CheckRaidForMessaging (self, elapsed);
	end

	-- check deferred call queue

	if (ZC_periodic (self, "dcq_lastUpdate", 0.05, elapsed)) then
		ZC_CheckDeferredCall();
	end

	-- make sure all dusts and essences are in the local cache

	if (gAtr_dustCacheIndex > 0 and ZC_periodic (self, "dust_lastUpdate", 0.1, elapsed)) then
		Atr_GetNextDustIntoCache();
	end

	-- the core Idle routine

	if (ZC_periodic (self, "idle_lastUpdate", 0.2, elapsed)) then
		Atr_Idle (self, elapsed);
	end
end


-----------------------------------------
local guildMsgSent = false;
-----------------------------------------

function Atr_Idle(self, elapsed)


	if (gCurrentPane and gCurrentPane.tooltipvisible) then
		Atr_ShowRecTooltip();
	end


	if (gAtr_FullScanState ~= ATR_FS_NULL) then
		Atr_FullScanFrameIdle();
	end

	if (not guildMsgSent) then
		SendAddonMessage ("ATR", "VREQ_"..AuctionatorVersion, "GUILD");
		guildMsgSent = true;
	end

	if (not Atr_IsTabSelected() or AuctionatorMessageFrame == nil) then
		return;
	end

	if (gHentryTryAgain) then
		Atr_HEntryOnClick();
		return;
	end

	if (gCurrentPane.activeScan.processing_state == KM_PREQUERY) then		------- check whether to send a new auction query to get the next page -------
		gCurrentPane.activeScan:Continue();
	end

	if (gAutoSelling) then
		Atr_Idle_AutoSelling (self);
	end

	Atr_UpdateUI ();

	if (gAtr_CheckingActive_State == ATR_CACT_READY) then
		Atr_CheckingActiveIdle();
	end

	if (gHideAPFrameCheck == nil) then	-- for the addon 'Auction Profit' (flags for efficiency so we only check one time)
		gHideAPFrameCheck = true;
		if (AP_Bid_MoneyFrame) then
			AP_Bid_MoneyFrame:Hide();
			AP_Buy_MoneyFrame:Hide();
		end
	end

	if (Atr_IsTabSelected(SELL_TAB)) then
		Atr_Idle_CheckForAutoSplit ();
	end
end

-----------------------------------------

local gPrevSellItemLink;

-----------------------------------------

function Atr_OnNewAuctionUpdate()

	if (gAutoSelling) then
		return;
	end

	local auctionItemName, auctionCount, auctionLink = Atr_GetSellItemInfo();

	if (gPrevSellItemLink ~= auctionLink) then

		gPrevSellItemLink = auctionLink;

		if (auctionLink) then
			gJustPosted_ItemName = nil;
			Atr_ClearList();		-- better UE
			gSellPane:SetToShowCurrent();
			Atr_Batch_Frame:Hide();
		end

		MoneyInputFrame_SetCopper (BuyoutPrice, 0);
		MoneyInputFrame_SetCopper (StartPrice,  0);
		Atr_ResetDuration();

		if (gJustPosted_ItemName == nil) then
			gSellPane:SetItem (auctionItemName, auctionLink, auctionCount, 20);
		end

	elseif (gSellPane.stackSize ~= auctionCount) then

		gSellPane.stackSize = auctionCount;
		Atr_FindBestCurrentAuction();
		Atr_ResetDuration();
	end

	gSellPane.UINeedsUpdate = true;

--	ZC_printmem ();

end

---------------------------------------------------------

function Atr_UpdateUI ()

	if (gCurrentPane.UINeedsUpdate) then

		-- need to clean up so don't need stuff like this
		if (gCurrentPane:ShowCurrent() and Atr_IsTabSelected(BUY_TAB) and gCurrentPane:IsScanEmpty() and gCurrentPane.itemName ~= nil) then
			gCurrentPane:SetItem (gCurrentPane.itemName, gCurrentPane.itemLink, 0, 60);
		end

		gCurrentPane.UINeedsUpdate = false;

		if (gCurrentPane:ShowCurrent()) then
			PanelTemplates_SetTab(Atr_ListTabs, 1);
			Atr_ShowCurrentAuctions();
		elseif (gCurrentPane:ShowHistory()) then
			PanelTemplates_SetTab(Atr_ListTabs, 2);
			Atr_ShowHistory();
		else
			PanelTemplates_SetTab(Atr_ListTabs, 3);
			Atr_ShowHints();
		end

		if (gCurrentPane.itemName and gCurrentPane.itemName ~= "") then
			Atr_ListTabs:Show();
		else
			Atr_ListTabs:Hide();
		end

		if (Atr_IsTabSelected(SELL_TAB)) then
			if (gCurrentPane.activeScan.processing_state ~= KM_NULL_STATE) then
				Atr_CreateAuctionButton:Disable();
				Atr_BatchButton:Disable();
				Atr_FullScanButton:Disable();
				Auctionator1Button:Disable();
				MoneyInputFrame_SetCopper (StartPrice,  0);
				return;
			else
				Atr_FullScanButton:Enable();
				Auctionator1Button:Enable();
			end
		end

		if (Atr_IsTabSelected(SELL_TAB) and gJustPosted_ItemName ~= nil) then

			Atr_Recommend_Text:SetText (string.format (ZT("Auction created for %s"), gJustPosted_ItemName));
			MoneyFrame_Update ("Atr_RecommendPerStack_Price", gJustPosted_BuyoutPrice);
			Atr_SetTextureButton ("Atr_RecommendItem_Tex", gJustPosted_StackSize, gJustPosted_ItemLink);

			gCurrentPane.currIndex = gCurrentPane.activeScan:FindInSortedData (gJustPosted_StackSize, gJustPosted_BuyoutPrice);

			if (gCurrentPane:ShowCurrent()) then
				Atr_HighlightEntry (gCurrentPane.currIndex);		-- highlight the newly created auction(s)
			else
				Atr_HighlightEntry (gCurrentPane.histIndex);
			end

		elseif (gCurrentPane.itemName == "") then
			if (Atr_IsModeCreateAuction()) then
				Atr_SetMessage (ZT("Drag an item you want to sell to this area."));
			elseif (Atr_IsModeBuy()) then
				Atr_SetMessage (ZT("Select an item from the list on the left\n or type the name of an item to start a scan.\n\nItem names must match exactly."));
			else
				Atr_SetMessage ("");
			end
		else
			Atr_UpdateRecommendation ();
		end

		if (Atr_IsTabSelected(BUY_TAB)) then
			Atr_Shop_UpdateUI();
		end
	end

	-- update the hlist if needed

	if (gHlistNeedsUpdate and Atr_IsModeActiveAuctions()) then
		gHlistNeedsUpdate = false;
		Atr_DisplayHlist();
	end

	-- stuff we should do everytime (not just when needsUpdate is true)

	if (Atr_IsTabSelected(SELL_TAB)) then

		local start		= MoneyInputFrame_GetCopper(StartPrice);
		local buyout	= MoneyInputFrame_GetCopper(BuyoutPrice);

		local pricesOK	= (start > 0 and (start <= buyout or buyout == 0) and GetAuctionSellItemInfo());
		local multiples	= Atr_Find_More (gCurrentPane.itemName, gCurrentPane.stackSize);

		ZC_EnableDisable (Atr_CreateAuctionButton,	pricesOK);
		ZC_EnableDisable (Atr_BatchButton,			pricesOK and multiples);

	end
end

-----------------------------------------

function Atr_SetActionNormal()

	gActionState = ATR_NORMAL_SCAN;

end

-----------------------------------------

function BS_GetCount(bs)

	local texture, count = GetContainerItemInfo (bs.bagID, bs.slotID);
	if (texture ~= nil) then
		return count;
	end

	return 0;

end

-----------------------------------------

function BS_InCslots(xbs)

	local i, bs;

	for i,bs in pairs(cslots) do
		if (xbs.bagID == bs.bagID and xbs.slotID == bs.slotID) then
			return true;
		end
	end

	return false;

end

-----------------------------------------

function BS_GetEmptySlot()


	if (gEmptyBScached == nil or BS_GetCount (gEmptyBScached) ~= 0) then

		gEmptyBScached = nil;

		for bagID = kFirstBag, kLastBag do

			local freeSlots, itemFamily = GetContainerNumFreeSlots (bagID)

			if (freeSlots > 0 and (itemFamily == 0 or bit.band (itemFamily, gBS_ItemFamily) ~= 0)) then

				numslots = GetContainerNumSlots (bagID);
				for slotID = 1,numslots do
					local itemLink = GetContainerItemLink(bagID, slotID);
					if (itemLink == nil) then
						gEmptyBScached = {};
						gEmptyBScached.bagID  = bagID;
						gEmptyBScached.slotID = slotID;

						-- add to cslots if not already there

						if (not BS_InCslots (gEmptyBScached)) then
							-- ZC_chatmsg ("Inserting "..bagID.."/"..slotID);
							tinsert (cslots, gEmptyBScached);
						end

						return gEmptyBScached;
					end
				end
			end
		end
	end

	return gEmptyBScached;
end



-----------------------------------------

function BS_PostAuction(bs)

	PickupContainerItem (bs.bagID, bs.slotID);

	local infoType = GetCursorInfo()

	if (infoType == "item") then
		ClickAuctionSellItemButton();
		ClearCursor();
	end

	local orig_BuyoutPrice	= MoneyInputFrame_GetCopper(BuyoutPrice);
	local startingPrice		= MoneyInputFrame_GetCopper(StartPrice);

	if (orig_BuyoutPrice ~= gBS_Buyout_StackPrice) then

		startingPrice = math.floor (gBS_Start_ItemPrice * gBS_GoodStackSize);

		MoneyInputFrame_SetCopper (StartPrice,  startingPrice);
		MoneyInputFrame_SetCopper (BuyoutPrice, gBS_Buyout_StackPrice);

	end

	StartAuction (startingPrice, gBS_Buyout_StackPrice, gBS_Hours * 60);

end

-----------------------------------------

function BS_FindGoodStack()

	local dstr = "";
	local i;

	for i, bs in pairs (cslots) do

		dstr = dstr..BS_GetCount (bs).." ";

		if (BS_GetCount (bs) == gBS_GoodStackSize) then
--			ZC_chatmsg ("FindGood: "..dstr);
			return bs
		end

	end

--	ZC_chatmsg ("FindGoodx: "..dstr);

	return nil;

end

-----------------------------------------

function BS_MergeSmallStacks()			-- find the 2 smallest stacks and merge them together if possible

	if (#cslots < 2) then
		return false;
	end

	local i, bs;

	local zbs	= nil;		-- smallest
	local ybs	= nil;		-- second smallest

	local zcount = 10000;
	local ycount = 10000;

	for i, bs in pairs (cslots) do
		local count = BS_GetCount (bs);

		if (count > 0) then
			if (count < zcount) then
				ybs = zbs;	ycount = zcount;
				zbs = bs;	zcount = count;
			elseif (count < ycount) then
				ybs = bs;	ycount = count;
			end
		end
	end

	if (zcount == 10000 or ycount == 10000) then
		return false;
	end

	-- try to make a "good" stack

	if (zcount < gBS_GoodStackSize and ycount + zcount >= gBS_GoodStackSize) then
		SplitContainerItem  (ybs.bagID, ybs.slotID, gBS_GoodStackSize - zcount);
		PickupContainerItem (zbs.bagID, zbs.slotID);

		gBS_targetBS		= zbs;
		gBS_targetCount	= gBS_GoodStackSize;

		return true;

	end

	-- merge them best as possible

	local numToMove = zcount;
	if (zcount + ycount > gBS_FullStackSize) then
		numToMove = gBS_FullStackSize - ycount;
	end

	if (numToMove > 0) then
		SplitContainerItem  (zbs.bagID, zbs.slotID, numToMove);
		PickupContainerItem (ybs.bagID, ybs.slotID);

		gBS_targetBS		= ybs;
		gBS_targetCount	= ycount + numToMove;

		return true;
	end

	return false;

end


-----------------------------------------

function BS_SplitLargeStack()

	local i, bs;

	local emptyBS = BS_GetEmptySlot ();

	for i, bs in pairs (cslots) do
		local count = BS_GetCount (bs);

		if (count > gBS_GoodStackSize) then
			if (emptyBS) then
				SplitContainerItem  (bs.bagID, bs.slotID, gBS_GoodStackSize);
				PickupContainerItem (emptyBS.bagID, emptyBS.slotID);

				gBS_targetBS		= emptyBS;
				gBS_targetCount		= gBS_GoodStackSize;
				return true;
			end
		end

	end

	return false;

end

-----------------------------------------

StaticPopupDialogs["AUCTIONATOR_AUTOSELL_FAIL"] = {
	text = "",
	button1 = OKAY,
	timeout = 0,
	showAlert = 1,
	exclusive = 1,
	hideOnEscape = 1
};

-----------------------------------------

function Atr_Idle_AutoSelling()

	if (CursorHasItem()) then
		return;
	end

	if (gAutoSellState == AUCTION_POST_PENDING) then
		return;
	end

	if (gAutoSellState == STACK_MERGE_PENDING or gAutoSellState == STACK_SPLIT_PENDING) then

		if (BS_GetCount (gBS_targetBS) == gBS_targetCount) then
			ClearCursor();
			gAutoSellState = SETTLED;
		else
			return;
		end
	end

	if (gAutoSellState ~= SETTLED) then
		return
	end

	-- let's see if we're done


	if (gBS_AuctionNum > gBS_NumAuctionsToCreate) then
		return;
	end


	-- if there's a stack that's ready to sell, sell it

	local goodBS = BS_FindGoodStack();

	if (goodBS) then
		BS_PostAuction (goodBS);
		gAutoSellState = AUCTION_POST_PENDING;
		return;
	end

	-- see if we can split a larger stack to get a sellable stack

	local success = BS_SplitLargeStack();
	if (success) then
		gAutoSellState = STACK_SPLIT_PENDING;
		return;
	end

	-- see if we can merge two smaller stacks

	local success = BS_MergeSmallStacks();
	if (success) then
		gAutoSellState = STACK_MERGE_PENDING;
		return;
	end

	-- nothing left to do - we're done

	gAutoSelling = false;

	gJustPosted_ItemName	= nil;
	gJustPosted_BuyoutPrice	= 0;
	gJustPosted_StackSize	= 0;
	gJustPosted_ItemLink	= nil;

	Atr_OnNewAuctionUpdate ();

	StaticPopupDialogs["AUCTIONATOR_AUTOSELL_FAIL"].text = ZT("Create Multiple Auctions failed.\nYou need at least one empty slot in your bags.");
	StaticPopup_Show ("AUCTIONATOR_AUTOSELL_FAIL");

end


-----------------------------------------

function Atr_GetActiveAuction (n)

	if (#gActiveAuctions == 0) then

		local foundnames = {};

		local k = 1;
		local i = 1;
		while (true) do
			local name, texture, count = GetAuctionItemInfo ("owner", i);
			if (name == nil) then
				break;
			end

			if (count > 0) then		-- count is 0 for sold items
				if (foundnames[name] == nil) then
					gActiveAuctions[k] = name;
					k = k + 1;
				end

				foundnames[name] = 1;
			end

			i = i + 1;
		end
	end


	if (#gActiveAuctions == 0) then
		return nil;
	end

	return gActiveAuctions[n];


end

-----------------------------------------

function Atr_DisplayHlist ()

	if (Atr_IsTabSelected (BUY_TAB)) then		-- done this way because OnScrollFrame always calls Atr_DisplayHlist
		Atr_DisplaySlist();
		return;
	end

	local doFull = (UIDropDownMenu_GetSelectedValue(Atr_DropDown1) == MODE_LIST_ALL);

	Atr_BuildGlobalHistoryList (doFull);

	local numrows = #gHistoryItemList;

	local line;							-- 1 through NN of our window to scroll
	local dataOffset;					-- an index into our data calculated from the scroll offset

	FauxScrollFrame_Update (Atr_Hlist_ScrollFrame, numrows, ITEM_HIST_NUM_LINES, 16);

	for line = 1,ITEM_HIST_NUM_LINES do

		gCurrentPane.hlistScrollOffset = FauxScrollFrame_GetOffset (Atr_Hlist_ScrollFrame);

		dataOffset = line + gCurrentPane.hlistScrollOffset;

		local lineEntry = getglobal ("AuctionatorHEntry"..line);

		lineEntry:SetID(dataOffset);

		if (dataOffset <= numrows and gHistoryItemList[dataOffset]) then

			local lineEntry_text = getglobal("AuctionatorHEntry"..line.."_EntryText");

			local iName = gHistoryItemList[dataOffset];

			local icon = "";

			if (not doFull) then
				icon = "|TInterface\\BUTTONS\\\UI-PassiveHighlight:18:18:0:0|t "

				local _, iLink = GetItemInfo (iName);
				local scan = Atr_FindScan (iName, iLink);
				if (scan and scan.whenScanned ~= 0) then

					if (scan.yourBestPrice and scan.absoluteBest and scan.yourBestPrice <= scan.absoluteBest.itemPrice) then
						icon = "|TInterface\\RAIDFRAME\\\ReadyCheck-Ready:18:18:0:0|t "
					else
						icon = "|TInterface\\RAIDFRAME\\\ReadyCheck-NotReady:18:18:0:0|t "
					end
				end
			end

			lineEntry_text:SetText	(icon..Atr_AbbrevItemName (iName));


			if (iName == gCurrentPane.itemName) then
				lineEntry:SetButtonState ("PUSHED", true);
			else
				lineEntry:SetButtonState ("NORMAL", false);
			end

			lineEntry:Show();
		else
			lineEntry:Hide();
		end
	end

end

-----------------------------------------

function Atr_ClearHlist ()
	local line;
	for line = 1,ITEM_HIST_NUM_LINES do
		local lineEntry = getglobal ("AuctionatorHEntry"..line);
		lineEntry:Hide();

		local lineEntry_text = getglobal("AuctionatorHEntry"..line.."_EntryText");
		lineEntry_text:SetText		("");
		lineEntry_text:SetTextColor	(.7,.7,.7);
	end

end

-----------------------------------------

function Atr_HEntryOnClick()

	if (gCurrentPane == gShopPane) then
		Atr_SEntryOnClick();
		return;
	end

	local line = this;

	if (gHentryTryAgain) then
		line = gHentryTryAgain;
		gHentryTryAgain = nil;
	end

	local _, itemLink;
	local entryIndex = line:GetID();
	local itemName	 = gHistoryItemList[entryIndex];

	if (AUCTIONATOR_PRICING_HISTORY[itemName]) then
		local itemId, suffixId, uniqueId = strsplit(":", AUCTIONATOR_PRICING_HISTORY[itemName]["is"])

		local itemId	= tonumber(itemId);

		if (suffixId == nil) then	suffixId = 0;
		else		 				suffixId = tonumber(suffixId);
		end

		if (uniqueId == nil) then	uniqueId = 0;
		else		 				uniqueId = tonumber(suffixId);
		end

		local itemString = "item:"..itemId..":0:0:0:0:0:"..suffixId..":"..uniqueId;

		_, itemLink = GetItemInfo(itemString);

		if (itemLink == nil) then		-- pull it into the cache and go back to the idle loop to wait for it to appear
			MyScanningTooltip:SetHyperlink(itemString);
			gHentryTryAgain = line;
			if (Atr_IsDev) then
				ZC_redmsg ("pulling "..itemName.." into the local cache");
			end
			return;
		end
	end

	gCurrentPane.UINeedsUpdate = true;

	Atr_ClearAll();

	gCurrentPane:SetItem (itemName, itemLink, 0, 60);

	Atr_Process_Historydata ();
	Atr_FindBestHistoricalAuction ();

	Atr_DisplayHlist();	 -- for the highlight

	PlaySound ("igMainMenuOptionCheckBoxOn");
end

-----------------------------------------

function Atr_ShowWhichRB (id)

	if (gCurrentPane.activeScan.processing_state ~= KM_NULL_STATE) then		-- if we're scanning auctions don't respond
		return;
	end

	PlaySound("igMainMenuOptionCheckBoxOn");

	if (id == 1) then
		gCurrentPane:SetToShowCurrent();
	elseif (id == 2) then
		gCurrentPane:SetToShowHistory();
	else
		gCurrentPane:SetToShowHints();
	end

	gCurrentPane.UINeedsUpdate = true;

end


-----------------------------------------

function Atr_RedisplayAuctions ()
	if (Atr_ShowingCurrentAuctions()) then
		Atr_ShowCurrentAuctions();
	elseif Atr_ShowingHistory() then
		Atr_ShowHistory();
	else
		Atr_ShowHints();
	end
end

-----------------------------------------

function Atr_BuildHistItemText(data)

	local stacktext = "";
--	if (data.stackSize > 1) then
--		stacktext = " (stack of "..data.stackSize..")";
--	end

	local now		= time();
	local nowtime	= date ("*t");

	local when		= data.when;
	local whentime	= date ("*t", when);

	local numauctions = data.stackSize;

	local datestr = "";

	if (data.type == "hy") then
		return ZT("average of your auctions for").." "..whentime.year;
	elseif (data.type == "hm") then
		if (nowtime.year == whentime.year) then
			return ZT("average of your auctions for").." "..date("%B", when);
		else
			return ZT("average of your auctions for").." "..date("%B %Y", when);
		end
	elseif (data.type == "hd") then
		return ZT("average of your auctions for").." "..monthDay(whentime);
	else
		return ZT("your auction on").." "..monthDay(whentime)..date(" at %I:%M %p", when);
	end
end

-----------------------------------------

function monthDay (when)

	local t = time(when);

	local s = date("%b ", t);

	return s..when.day;

end


-----------------------------------------

function Atr_ShowCurrentAuctions()


	Atr_Col1_Heading:Hide();
	Atr_Col3_Heading:Hide();
	Atr_Col4_Heading:Hide();

	local numrows = #gCurrentPane.activeScan.sortedData;

	if (numrows > 0) then
		Atr_Col1_Heading:Show();
		Atr_Col3_Heading:Show();
		Atr_Col4_Heading:Show();
	end

	Atr_Col3_Heading:SetText (ZT("Current Auctions"));

	if (gCurrentPane.activeScan.hasStack) then
		Atr_Col4_Heading:SetText (ZT("Total Price"));
	else
		Atr_Col4_Heading:SetText ("");
	end

	local line		 = 0;															-- 1 through 12 of our window to scroll
	local dataOffset = FauxScrollFrame_GetOffset (AuctionatorScrollFrame);			-- an index into our data calculated from the scroll offset

	FauxScrollFrame_Update (AuctionatorScrollFrame, numrows, 12, 16);

	while (line < 12) do

		dataOffset	= dataOffset + 1;
		line		= line + 1;

		local lineEntry = getglobal ("AuctionatorEntry"..line);

		lineEntry:SetID(dataOffset);

		if (dataOffset > numrows or not gCurrentPane.activeScan.sortedData[dataOffset]) then

			lineEntry:Hide();

		else
			local data = gCurrentPane.activeScan.sortedData[dataOffset];

			local lineEntry_item_tag = "AuctionatorEntry"..line.."_PerItem_Price";

			local lineEntry_item		= getglobal(lineEntry_item_tag);
			local lineEntry_itemtext	= getglobal("AuctionatorEntry"..line.."_PerItem_Text");
			local lineEntry_text		= getglobal("AuctionatorEntry"..line.."_EntryText");
			local lineEntry_stack		= getglobal("AuctionatorEntry"..line.."_StackPrice");

			lineEntry_itemtext:SetText	("");
			lineEntry_text:SetText	("");
			lineEntry_stack:SetText	("");

			Atr_SetMFcolor (lineEntry_item_tag);

			local entrytext = "";

			if (data.type == "n") then

				lineEntry:Show();

				if (gCurrentPane.activeScan.itemSoftName) then

					entrytext = gCurrentPane.activeScan.itemSoftName.." "..data.suffix;

					if ( entrytext == gCurrentPane.activeScan.itemName ) then	lineEntry_text:SetTextColor (1.0, 1.0, 1.0);
					else														lineEntry_text:SetTextColor (0.5, 0.5, 0.5);
					end
				else
					entrytext = string.format ("%i %s of %i", data.count, ZC_pluralizeIf ("stack", data.count), data.stackSize);

					if ( data.stackSize == gCurrentPane.stackSize or gCurrentPane.stackSize == 0) then	lineEntry_text:SetTextColor (1.0, 1.0, 1.0);
					else																				lineEntry_text:SetTextColor (0.6, 0.6, 0.6);
					end;
				end

				if (data.yours) then
					 entrytext = entrytext.." ("..ZT("yours")..")";
				elseif (data.altname) then
					 entrytext = entrytext.." ("..data.altname..")";
				end


				lineEntry_text:SetText (entrytext);

				if (data.buyoutPrice == 0) then
					lineEntry_item:Hide();
					lineEntry_itemtext:Show();
					lineEntry_itemtext:SetText (ZT("no buyout price"));
				else
					lineEntry_item:Show();
					lineEntry_itemtext:Hide();
					MoneyFrame_Update (lineEntry_item_tag, ZC_round(data.buyoutPrice/data.stackSize) );

					if (gCurrentPane.activeScan.itemSoftName == nil and data.stackSize > 1) then
						lineEntry_stack:SetText (ZC_priceToString(data.buyoutPrice));
						lineEntry_stack:SetTextColor (0.6, 0.6, 0.6);
					end
				end

			else
				ZC_redmsg ("Unknown datatype:");
				ZC_redmsg (data.type);
			end
		end
	end

	Atr_HighlightEntry (gCurrentPane.currIndex);		-- need this for when called from onVerticalScroll
end

-----------------------------------------

function Atr_ShowHistory ()

	if (gCurrentPane.sortedHist == nil) then
		Atr_Process_Historydata ();
		Atr_FindBestHistoricalAuction ();
	end

	Atr_Col1_Heading:Hide();
	Atr_Col3_Heading:Hide();
	Atr_Col4_Heading:Hide();

	Atr_Col3_Heading:SetText (ZT("History"));

	local numrows = #gCurrentPane.sortedHist;

--ZC_chatmsg ("gCurrentPane.sortedHist: "..numrows,1,0,0);

	if (numrows > 0) then
		Atr_Col1_Heading:Show();
		Atr_Col3_Heading:Show();
	end

	local line;							-- 1 through 12 of our window to scroll
	local dataOffset;					-- an index into our data calculated from the scroll offset

	FauxScrollFrame_Update (AuctionatorScrollFrame, numrows, 12, 16);

	for line = 1,12 do

		dataOffset = line + FauxScrollFrame_GetOffset (AuctionatorScrollFrame);

		local lineEntry = getglobal ("AuctionatorEntry"..line);

		lineEntry:SetID(dataOffset);

		if (dataOffset <= numrows and gCurrentPane.sortedHist[dataOffset]) then

			local data = gCurrentPane.sortedHist[dataOffset];

			local lineEntry_item_tag = "AuctionatorEntry"..line.."_PerItem_Price";

			local lineEntry_item		= getglobal(lineEntry_item_tag);
			local lineEntry_itemtext	= getglobal("AuctionatorEntry"..line.."_PerItem_Text");
			local lineEntry_text		= getglobal("AuctionatorEntry"..line.."_EntryText");
			local lineEntry_stack		= getglobal("AuctionatorEntry"..line.."_StackPrice");

			lineEntry_item:Show();
			lineEntry_itemtext:Hide();
			lineEntry_stack:SetText	("");

			Atr_SetMFcolor (lineEntry_item_tag);

			MoneyFrame_Update (lineEntry_item_tag, ZC_round(data.itemPrice) );

			lineEntry_text:SetText (Atr_BuildHistItemText (data));
			lineEntry_text:SetTextColor (0.8, 0.8, 1.0);

			lineEntry:Show();
		else
			lineEntry:Hide();
		end
	end

	if (Atr_IsTabSelected (SELL_TAB)) then
		Atr_HighlightEntry (gCurrentPane.histIndex);		-- need this for when called from onVerticalScroll
	else
		Atr_HighlightEntry (-1);
	end
end


-----------------------------------------

function Atr_FindBestCurrentAuction()

	if (Atr_IsModeCreateAuction()) then
--		gCurrentPane.currIndex = gCurrentPane.activeScan:FindMatchByStackSize (gCurrentPane.stackSize);
		gCurrentPane.currIndex = gCurrentPane.activeScan:FindCheapest ();
	elseif (Atr_IsModeBuy()) then
		gCurrentPane.currIndex = gCurrentPane.activeScan:FindCheapest ();
	else
		gCurrentPane.currIndex = gCurrentPane.activeScan:FindMatchByYours ();
	end

end

-----------------------------------------

function Atr_FindBestHistoricalAuction()

	gCurrentPane.histIndex = nil;

	if (gCurrentPane.sortedHist and #gCurrentPane.sortedHist > 0) then
		gCurrentPane.histIndex = 1;
	end
end

-----------------------------------------

function Atr_HighlightEntry(entryIndex)

	local line;				-- 1 through 12 of our window to scroll

	for line = 1,12 do

		local lineEntry = getglobal ("AuctionatorEntry"..line);

		if (lineEntry:GetID() == entryIndex) then
			lineEntry:SetButtonState ("PUSHED", true);
		else
			lineEntry:SetButtonState ("NORMAL", false);
		end
	end

	local doEnableCancel = false;
	local doEnableBuy = false;
	local data;

	if (Atr_ShowingCurrentAuctions() and entryIndex ~= nil and entryIndex > 0 and entryIndex <= #gCurrentPane.activeScan.sortedData) then
		data = gCurrentPane.activeScan.sortedData[entryIndex];
		if (data.yours) then
			doEnableCancel = true;
		end

		if (not data.yours and not data.altname and data.buyoutPrice > 0) then
			doEnableBuy = true;
		end
	end

	Atr_Buy1_Button:Disable();
	Atr_BatchCancelButton:Disable();

	if (doEnableCancel) then
		Atr_BatchCancelButton:Enable();

		if (data.count == 1) then
			Atr_BatchCancelButton:SetText (CANCEL_AUCTION);
		else
			Atr_BatchCancelButton:SetText (ZT("Cancel Auctions"));
		end
	end

	if (doEnableBuy) then
		Atr_Buy1_Button:Enable();
	end

end

-----------------------------------------

function Atr_EntryOnClick()

	if (Atr_Batch_Frame:IsShown()) then
		return;
	end

	local entryIndex = this:GetID();

	if (Atr_ShowingCurrentAuctions()) then
		gCurrentPane.currIndex = entryIndex;
	elseif (Atr_ShowingHistory()) then
		gCurrentPane.histIndex = entryIndex;
	else
		gCurrentPane.hintsIndex = entryIndex;
	end

	Atr_HighlightEntry (entryIndex);
	Atr_UpdateRecommendation();


	PlaySound ("igMainMenuOptionCheckBoxOn");
end

-----------------------------------------

function AuctionatorMoneyFrame_OnLoad()

	this.small = 1;
	MoneyFrame_SetType(this, "AUCTION");
end


-----------------------------------------

local function Atr_GetNumItemInBags (theItemName)

	local numItems = 0;
	local bagID, slotID, numslots;

	for bagID = kFirstBag, kLastBag do
		numslots = GetContainerNumSlots (bagID);
		for slotID = 1,numslots do
			local itemLink = GetContainerItemLink(bagID, slotID);
			if (itemLink) then
				local itemName				= GetItemInfo(itemLink);
				local texture, itemCount	= GetContainerItemInfo(bagID, slotID);

				if (itemName == theItemName) then
					numItems = numItems + itemCount;
				end
			end
		end
	end

	return numItems;

end
-----------------------------------------

function Atr_ShowBatchFrame()

	gBS_ItemName			= gCurrentPane.itemName;
	gBS_ItemLink			= gCurrentPane.itemLink;
	gBS_ItemFamily			= GetItemFamily (gBS_ItemLink);
	gBS_Hours				= AuctionFrameAuctions.duration / 60;
	gBS_FullStackSize		= select (8, GetItemInfo (gBS_ItemLink));
	gBS_TotalItems			= Atr_GetNumItemInBags (gBS_ItemName);

	local buyoutPrice = MoneyInputFrame_GetCopper(BuyoutPrice);
	local startPrice  = MoneyInputFrame_GetCopper(StartPrice);

	gBS_Buyout_ItemPrice		= buyoutPrice / gCurrentPane.stackSize;
	gBS_Start_ItemPrice			= startPrice / gCurrentPane.stackSize;

	local preferredStackSize = Atr_GetPreferredStackSize (gBS_ItemLink);

	if (preferredStackSize and preferredStackSize <= gBS_TotalItems) then
		gBS_GoodStackSize	= preferredStackSize;
		gBS_Buyout_StackPrice	= math.floor (gBS_Buyout_ItemPrice * preferredStackSize);
	else
		gBS_GoodStackSize	= gCurrentPane.stackSize;
		gBS_Buyout_StackPrice	= buyoutPrice;
	end

	local numStacks = math.floor (gBS_TotalItems / gBS_GoodStackSize);

	Atr_Batch_NumAuctions:SetText (numStacks);
	Atr_Batch_Stacksize:SetText (gBS_GoodStackSize);

	Atr_Batch_MaxStacksize_Text:SetText (ZT("max")..": "..gBS_FullStackSize);

	Atr_Batch_Frame:Show();
end


-----------------------------------------

function Atr_Batch_Update()

	local newStackSize = Atr_Batch_Stacksize:GetNumber();

	if (newStackSize > 0 and newStackSize ~= gBS_GoodStackSize) then
		gBS_GoodStackSize = newStackSize;
		gBS_Buyout_StackPrice = math.floor (gBS_Buyout_ItemPrice * gBS_GoodStackSize);
	end

	if (Atr_Batch_NumAuctions:GetNumber() == 1) then
		Atr_Batch_Stacksize_Text:SetText (ZT("stack of"));
	else
		Atr_Batch_Stacksize_Text:SetText (ZT("stacks of"));
	end

	local maxAuctions = math.floor (gBS_TotalItems / gBS_GoodStackSize);

	Atr_SetTextureButton ("Atr_Batch_Texture", gBS_GoodStackSize);

	MoneyFrame_Update ("Atr_Batch_StackPrice",  gBS_Buyout_StackPrice);
	MoneyFrame_Update ("Atr_Batch_ItemPrice", math.floor (gBS_Buyout_ItemPrice + 0.5));

	Atr_Batch_StackPrice_Text:SetText (string.format (ZT("for each stack of %d"), gBS_GoodStackSize));
	Atr_Batch_Itemname:SetText (gBS_ItemName.." x "..gBS_GoodStackSize);

	Atr_Batch_MaxAuctions_Text:SetText (ZT("max")..": "..maxAuctions);
end

-----------------------------------------

function Atr_BatchCancel()

--	ZC_chatmsg2 ("gCurrentPane.currIndex: ", gCurrentPane.currIndex);
--	ZC_chatmsg2 ("gCurrentPane.histIndex: ", gCurrentPane.histIndex);

	if (not Atr_ShowingCurrentAuctions()) then
		return;
	end

	local data = gCurrentPane.activeScan.sortedData[gCurrentPane.currIndex];

	if (not data.yours) then
		return;
	end

	local i = 1;

	while (true) do
		local name, texture, count, quality, canUse, level,
		minBid, minIncrement, buyoutPrice, bidAmount,
		highBidder, owner = GetAuctionItemInfo ("owner", i);

		if (name == nil) then
			break;
		end

		if (name == gCurrentPane.activeScan.itemName and buyoutPrice == data.buyoutPrice and count == data.stackSize) then
			CancelAuction (i);
			AuctionatorSubtractFromScan (name, count, buyoutPrice);
			gJustPosted_ItemName = nil;
		end

		i = i + 1;
	end

end

-----------------------------------------

function Atr_DropDown1_OnLoad (self)
	UIDropDownMenu_Initialize(self, Atr_DropDown1_Initialize);
	UIDropDownMenu_SetSelectedValue(Atr_DropDown1, MODE_LIST_ACTIVE);
	Atr_DropDown1:Show();
end

-----------------------------------------

function Atr_DropDown1_Initialize()
	local info = UIDropDownMenu_CreateInfo();

	info.text = ZT("Active Items");
	info.value = MODE_LIST_ACTIVE;
	info.func = Atr_DropDown1_OnClick;
	info.owner = this:GetParent();
	info.checked = nil;
	UIDropDownMenu_AddButton(info);

	info.text = ZT("All Items");
	info.value = MODE_LIST_ALL;
	info.func = Atr_DropDown1_OnClick;
	info.owner = this:GetParent();
	info.checked = nil;
	UIDropDownMenu_AddButton(info);

end

-----------------------------------------

function Atr_DropDown1_OnClick(self)

	UIDropDownMenu_SetSelectedValue(self.owner, self.value);

	local mode = self.value;

	if (mode == MODE_LIST_ALL) then
		Atr_DisplayHlist();
	end

	if (mode == MODE_LIST_ACTIVE) then
		Atr_DisplayHlist();
	end

end


-----------------------------------------

function Atr_ShowOptionsFrame()

	AuctionatorOptionsFrame:Show();
	AuctionatorOptionsFrame:SetBackdropColor(0,0,0,100);

	local expText = "<html><body>"
					.."<p>"..ZT("The latest information on Auctionator can be found at").." auctionator-addon.com.".."</p>"
					.."<p><br/>"
					.."|cffaaaaaa"..ZT("German translation courtesy of ").." Ckoatic.".."<br/>"
					.."|cffaaaaaa"..ZT("Russion translation courtesy of ").." StingerSoft.".."<br/>"
					.."|cffaaaaaa"..ZT("Swedish translation courtesy of ").." HellManiac.".."<br/>"
					.."</p>"
					.."</body></html>"
					;

	AuctionatorDescriptionHTML:SetText (expText);
	AuctionatorDescriptionHTML:SetSpacing (3);

	AuctionatorVersionText:SetText (ZT("Version")..": "..AuctionatorVersion);

end


-----------------------------------------

function Atr_SetDurationOptionRB(name)

	Atr_RB_S:SetChecked (ZC_StringEndsWith (name, "S"));
	Atr_RB_M:SetChecked (ZC_StringEndsWith (name, "M"));
	Atr_RB_L:SetChecked (ZC_StringEndsWith (name, "L"));

end

-----------------------------------------

function AuctionatorBasicOptionsSave()

	AUCTIONATOR_ENABLE_ALT		= ZC_BoolToNum(AuctionatorOption_Enable_Alt_CB:GetChecked ());
--	AUCTIONATOR_OPEN_FIRST		= ZC_BoolToNum(AuctionatorOption_Open_SELL_CB:GetChecked ());
--	AUCTIONATOR_OPEN_BUY		= ZC_BoolToNum(AuctionatorOption_Open_BUY_CB:GetChecked ());
	AUCTIONATOR_OPEN_ALL_BAGS	= ZC_BoolToNum(AuctionatorOption_Open_All_Bags_CB:GetChecked ());

	AUCTIONATOR_DEFTAB			= UIDropDownMenu_GetSelectedValue(AuctionatorOption_Deftab);

	AUCTIONATOR_DEF_DURATION = "N";

	if (AuctionatorOption_Def_Duration_CB:GetChecked()) then
		if (Atr_RB_S:GetChecked())	then	AUCTIONATOR_DEF_DURATION = "S"; end;
		if (Atr_RB_M:GetChecked())	then	AUCTIONATOR_DEF_DURATION = "M"; end;
		if (Atr_RB_L:GetChecked())	then	AUCTIONATOR_DEF_DURATION = "L"; end;
	end
end

-----------------------------------------

function Atr_ShowBasicOptionsFrame()

	AuctionatorConfigFrameTitle:SetText (string.format (ZT("Auctionator Options for %s"), UnitName("player")));

	AuctionatorOption_Enable_Alt_CB:SetChecked		(ZC_NumToBool(AUCTIONATOR_ENABLE_ALT));
--	AuctionatorOption_Open_SELL_CB:SetChecked		(ZC_NumToBool(AUCTIONATOR_OPEN_FIRST));
--	AuctionatorOption_Open_BUY_CB:SetChecked		(ZC_NumToBool(AUCTIONATOR_OPEN_BUY));
	AuctionatorOption_Open_All_Bags_CB:SetChecked	(ZC_NumToBool(AUCTIONATOR_OPEN_ALL_BAGS));

	UIDropDownMenu_Initialize		(AuctionatorOption_Deftab, AuctionatorOption_Deftab_Initialize);
	UIDropDownMenu_SetSelectedValue	(AuctionatorOption_Deftab, AUCTIONATOR_DEFTAB);
--	UIDropDownMenu_SetWidth 		(AuctionatorOption_Deftab, 50, 5);

	AuctionatorOption_Def_Duration_CB:SetChecked (AUCTIONATOR_DEF_DURATION == "S" or AUCTIONATOR_DEF_DURATION == "M" or AUCTIONATOR_DEF_DURATION == "L");

	Atr_SetDurationOptionRB (AUCTIONATOR_DEF_DURATION);

	Atr_ShowSubOptionsFrame (AuctionatorBasicOptionsFrame);

end

-----------------------------------------

function Atr_AdvOptionsShow()

	Atr_ShowSubOptionsFrame (Atr_AdvOptionsFrame);

end

-----------------------------------------

function Atr_ShowSubOptionsFrame (subOptionsFrame)

	if (InterfaceOptionsFrame:IsShown()) then
		subOptionsFrame:SetPoint ("CENTER", "InterfaceOptionsFrame", "CENTER", 0, 50);
		Atr_Mask_StdOptions:Show();
	else
		subOptionsFrame:SetPoint ("CENTER", "AuctionFrame", "CENTER", 50, 10);
	end

	subOptionsFrame:Show();
end

-----------------------------------------

function Atr_ShowTooltipsOptionsFrame ()

	ATR_tipsVendorOpt_CB:SetChecked		(ZC_NumToBool(AUCTIONATOR_V_TIPS));
	ATR_tipsAuctionOpt_CB:SetChecked	(ZC_NumToBool(AUCTIONATOR_A_TIPS));
	ATR_tipsDisenchantOpt_CB:SetChecked	(ZC_NumToBool(AUCTIONATOR_D_TIPS));

	UIDropDownMenu_Initialize(Atr_tipsShiftDD, Atr_tipsShiftDD_Initialize);
	UIDropDownMenu_SetSelectedValue(Atr_tipsShiftDD, AUCTIONATOR_SHIFT_TIPS);

	UIDropDownMenu_Initialize(Atr_deDetailsDD, Atr_deDetailsDD_Initialize);
	UIDropDownMenu_SetSelectedValue(Atr_deDetailsDD, AUCTIONATOR_DE_DETAILS_TIPS);

	Atr_ShowSubOptionsFrame (AuctionatorTooltipsOptionsFrame);
end

-----------------------------------------

function AuctionatorTooltipsOptionsSave()

	AUCTIONATOR_V_TIPS		= ZC_BoolToNum(ATR_tipsVendorOpt_CB:GetChecked ());
	AUCTIONATOR_A_TIPS		= ZC_BoolToNum(ATR_tipsAuctionOpt_CB:GetChecked ());
	AUCTIONATOR_D_TIPS		= ZC_BoolToNum(ATR_tipsDisenchantOpt_CB:GetChecked ());

	AUCTIONATOR_SHIFT_TIPS		= UIDropDownMenu_GetSelectedValue(Atr_tipsShiftDD);
	AUCTIONATOR_DE_DETAILS_TIPS	= UIDropDownMenu_GetSelectedValue(Atr_deDetailsDD);

end

-----------------------------------------

function Atr_AddMenuPick (info, text, value, func)

	info.text			= text;
	info.value			= value;
	info.func			= func;
	info.checked		= nil;
	info.owner			= this:GetParent();
	UIDropDownMenu_AddButton(info);

end

-----------------------------------------

function AuctionatorOption_Deftab_Initialize()

	local info = UIDropDownMenu_CreateInfo();

	Atr_AddMenuPick (info, ZT("None"),	0, AuctionatorOption_Deftab_OnClick);
	Atr_AddMenuPick (info, ZT("Sell"),	1, AuctionatorOption_Deftab_OnClick);
	Atr_AddMenuPick (info, ZT("Buy"),	2, AuctionatorOption_Deftab_OnClick);
	Atr_AddMenuPick (info, ZT("More"),	3, AuctionatorOption_Deftab_OnClick);

end

-----------------------------------------

function AuctionatorOption_Deftab_OnClick(self)
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
end

-----------------------------------------

function Atr_tipsShiftDD_Initialize()

	local info = UIDropDownMenu_CreateInfo();

	Atr_AddMenuPick (info, ZT("stack prices"),		1, Atr_tipsShiftDD_OnClick);
	Atr_AddMenuPick (info, ZT("per item prices"),	2, Atr_tipsShiftDD_OnClick);

end

-----------------------------------------

function Atr_tipsShiftDD_OnClick(self)
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
end

-----------------------------------------

function Atr_deDetailsDD_Initialize()

	local info = UIDropDownMenu_CreateInfo();

	Atr_AddMenuPick (info, ZT("when SHIFT is held down"),	1, Atr_deDetailsDD_OnClick);
	Atr_AddMenuPick (info, ZT("when CONTROL is held down"),	2, Atr_deDetailsDD_OnClick);
	Atr_AddMenuPick (info, ZT("when ALT is held down"),		3, Atr_deDetailsDD_OnClick);
	Atr_AddMenuPick (info, ZT("never"),						4, Atr_deDetailsDD_OnClick);
	Atr_AddMenuPick (info, ZT("always"),					5, Atr_deDetailsDD_OnClick);

end

-----------------------------------------

function Atr_deDetailsDD_OnClick(self)
	UIDropDownMenu_SetSelectedValue(self.owner, self.value);
end

-----------------------------------------

function Atr_Option_OnClick (self)

	if (ZC_StringContains (self:GetName(), "Open_BUY") and self:GetChecked()) then
		AuctionatorOption_Open_SELL_CB:SetChecked (false);
	end

	if (ZC_StringContains (self:GetName(), "Open_SELL") and self:GetChecked()) then
		AuctionatorOption_Open_BUY_CB:SetChecked (false);
	end

end

-----------------------------------------

function Atr_UCConfigLine_Setup(thresh, lineText)

	getglobal("UC_"..thresh.."_RangeText"):SetText (lineText);

	MoneyInputFrame_SetCopper (getglobal("UC_"..thresh.."_MoneyInput"), AUCTIONATOR_SAVEDVARS["_"..thresh]);

end

-----------------------------------------

function Atr_ShowUCConfigFrame()

	Atr_UCConfigLine_Setup (5000000,	string.format (ZT("over %d gold"), 500));
	Atr_UCConfigLine_Setup (1000000,	string.format (ZT("over %d gold"), 100));
	Atr_UCConfigLine_Setup (200000,		string.format (ZT("over %d gold"), 20));
	Atr_UCConfigLine_Setup (50000,		string.format (ZT("over %d gold"), 5));
	Atr_UCConfigLine_Setup (10000,		ZT("over 1 gold"));
	Atr_UCConfigLine_Setup (2000,		string.format (ZT("over %d silver"), 20));
	Atr_UCConfigLine_Setup (500,		string.format (ZT("over %d silver"), 5));

	Atr_Starting_Discount:SetText (AUCTIONATOR_SAVEDVARS.STARTING_DISCOUNT);

	Atr_ShowSubOptionsFrame (AuctionatorUndercuttingConfig);


end


-----------------------------------------

function Atr_UCConfigLine_Save(thresh)

	AUCTIONATOR_SAVEDVARS["_"..thresh]	= MoneyInputFrame_GetCopper(getglobal("UC_"..thresh.."_MoneyInput"));

end

-----------------------------------------

function AuctionatorUCConfigSave()

	Atr_UCConfigLine_Save (5000000);
	Atr_UCConfigLine_Save (1000000);
	Atr_UCConfigLine_Save (200000);
	Atr_UCConfigLine_Save (50000);
	Atr_UCConfigLine_Save (10000);
	Atr_UCConfigLine_Save (2000);
	Atr_UCConfigLine_Save (500);

	AUCTIONATOR_SAVEDVARS.STARTING_DISCOUNT = Atr_Starting_Discount:GetNumber ();

end


-----------------------------------------

function Atr_ShowOptionTooltip (elem)

	local name = elem:GetName();
	local text;

	if (ZC_StringContains (name, "Enable_Alt")) then
		text = ZT("If this option is checked, holding the Alt key down while clicking an item in your bags will switch to the Auctionator panel, place the item in the Auction Item area, and start the scan.");
	end

	if (ZC_StringContains (name, "Deftab")) then
		text = ZT("Select the Auctionator panel to be displayed first whenever you open the Auction House window.");
	end

	if (ZC_StringContains (name, "Open_BUY")) then
		text = ZT("If this option is checked, the Auctionator BUY panel will display first whenever you open the Auction House window.");
	end

	if (ZC_StringContains (name, "Open_All_Bags")) then
		text = ZT("If this option is checked, ALL your bags will be opened when you first open the Auctionator panel.");
	end

	if (ZC_StringContains (name, "Def_Duration")) then
		text = ZT("If this option is checked, every time you initiate a new auction the auction duration will be reset to the default duration you've selected.");
	end




	if (text) then
		local titleFrame = getglobal (name.."_CB_Text") or getglobal (name.."_Text");

		local titleText = titleFrame and titleFrame:GetText() or "???";

		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
		GameTooltip:SetText(titleText, 0.9, 1.0, 1.0);
		GameTooltip:AddLine(text, 0.5, 0.5, 1.0, 1);
		GameTooltip:Show();
	end

end



-----------------------------------------

function Atr_IsTabSelected(whichTab)

	if (not AuctionFrame or not AuctionFrame:IsShown()) then
		return false;
	end

	if (not whichTab) then
		return (Atr_IsTabSelected(SELL_TAB) or Atr_IsTabSelected(MORE_TAB) or Atr_IsTabSelected(BUY_TAB));
	end

	return (PanelTemplates_GetSelectedTab (AuctionFrame) == Atr_FindTabIndex(whichTab));
end

-----------------------------------------

function Atr_IsAuctionatorTab (tabIndex)

	if (tabIndex == Atr_FindTabIndex(SELL_TAB) or tabIndex == Atr_FindTabIndex(MORE_TAB) or tabIndex == Atr_FindTabIndex(BUY_TAB) ) then

		return true;

	end

	return false;
end

-----------------------------------------

function Atr_Confirm_Yes()

	if (Atr_Confirm_Proc_Yes) then
		Atr_Confirm_Proc_Yes();
		Atr_Confirm_Proc_Yes = nil;
	end

	Atr_Confirm_Frame:Hide();

end


-----------------------------------------

function Atr_Confirm_No()

	Atr_Confirm_Frame:Hide();

end


-----------------------------------------

function Atr_AddHistoricalPrice (itemName, price, stacksize, itemLink, testwhen)

	if (not AUCTIONATOR_PRICING_HISTORY[itemName] ) then
		AUCTIONATOR_PRICING_HISTORY[itemName] = {};
	end

	local itemId, suffixId, uniqueId = ZC_ItemIDfromLink (itemLink);

	local is = itemId;

	if (suffixId ~= 0) then
		is = is..":"..suffixId;
		if (tonumber(suffixId) < 0) then
			is = is..":"..uniqueId;
		end
	end

	AUCTIONATOR_PRICING_HISTORY[itemName]["is"]  = is;

	local hist = tostring (ZC_round (price))..":"..stacksize;

	local roundtime = floor (time() / 60) * 60;		-- so multiple auctions close together don't generate too many entries

	local tag = tostring(ToTightTime(roundtime));

	if (testwhen) then
		tag = tostring(ToTightTime(testwhen));
	end

	AUCTIONATOR_PRICING_HISTORY[itemName][tag] = hist;

	gCurrentPane.sortedHist = nil;

end

-----------------------------------------

function Atr_HasHistoricalData (itemName)

	if (AUCTIONATOR_PRICING_HISTORY[itemName] ) then
		return true;
	end

	return false;
end


-----------------------------------------

function Atr_BuildGlobalHistoryList(full)

	gHistoryItemList	= {};

	local n = 1;

	if (full) then
		for name,hist in pairs (AUCTIONATOR_PRICING_HISTORY) do
			gHistoryItemList[n] = name;
			n = n + 1;
		end
	else
		local name = "";
		while (name) do
			name = Atr_GetActiveAuction(n);
			if (name) then
				gHistoryItemList[n] = name;
				n = n + 1;
			end
		end
	end

	table.sort (gHistoryItemList);

end

-----------------------------------------

local gAtr_Buy_BuyoutPrice;
local gAtr_Buy_ItemName;
local gAtr_Buy_StackSize;
local gAtr_Buy_NumBought;
local gAtr_Buy_MaxCanBuy;

-----------------------------------------

function Atr_Buy1_Onclick ()

	if (not Atr_ShowingCurrentAuctions()) then
		return;
	end

	gAtr_Buy_ItemName = nil;
	gAtr_Buy_NumBought = nil;

	local scan = gCurrentPane.activeScan;

	local data = scan.sortedData[gCurrentPane.currIndex];

	local numBids = Atr_Buy_Stack (gCurrentPane.activeScan.itemName, data.buyoutPrice, data.stackSize, false);

	if (numBids == 0) then
		gActionState = ATR_BUYING;

		local queryString = scan.itemName;

		if (scan.itemSoftName) then
			queryString = scan.itemSoftName;
		end

		queryString = ZC_UTF8_Truncate (queryString,63);	-- attempting to reduce number of disconnects

		QueryAuctionItems (queryString, "", "", nil, scan.itemClass, scan.itemSubclass, data.pagenum, nil, nil);
	end

end

-----------------------------------------

function Atr_Continue_Buying ()

	gActionState = ATR_NOTHING;

	local data = gCurrentPane.activeScan.sortedData[gCurrentPane.currIndex];

	Atr_Buy_Stack (gCurrentPane.itemName, data.buyoutPrice, data.stackSize, false);

end

-----------------------------------------

function Atr_Really_Buy ()

	local numToBuy = Atr_Buy_Confirm_Numstacks:GetNumber();

	if (numToBuy > gAtr_Buy_MaxCanBuy) then
		Atr_Error_Text:SetText (string.format (ZT("You can buy at most %d auctions"), gAtr_Buy_MaxCanBuy));
		Atr_Error_Frame:Show ();
		return;
	end

	local i = 1;

	gAtr_Buy_NumBought = 0;

	while (numToBuy > gAtr_Buy_NumBought) do
		local name, texture, count, quality, canUse, level,
		minBid, minIncrement, buyoutPrice, bidAmount,
		highBidder, owner = GetAuctionItemInfo ("list", i);

		if (name == nil) then
			break;
		end

		if (ZC_StringSame (name, gAtr_Buy_ItemName) and buyoutPrice == gAtr_Buy_BuyoutPrice and count == gAtr_Buy_StackSize) then

			PlaceAuctionBid("list", i, gAtr_Buy_BuyoutPrice);
			gAtr_Buy_NumBought = gAtr_Buy_NumBought + 1;
		end

		i = i + 1;
	end

	gActionState = ATR_JUST_BOUGHT;

	Atr_Error_Frame:Hide();
	Atr_Buy_Confirm_Frame:Hide();

end

-----------------------------------------

function Atr_Buy_Stack (targetItemName, targetBuyoutPrice, targetStackSize, buyAll)

	local numMatches = 0;
	local i		  	 = 1;

	while (true) do
		local name, texture, count, quality, canUse, level,
		minBid, minIncrement, buyoutPrice, bidAmount,
		highBidder, owner = GetAuctionItemInfo ("list", i);

		if (name == nil) then
			break;
		end

		if (ZC_StringSame (name, targetItemName) and buyoutPrice == targetBuyoutPrice and count == targetStackSize) then

			numMatches = numMatches + 1;
		end

		i = i + 1;
	end

	if (numMatches > 0) then

		gAtr_Buy_BuyoutPrice	= targetBuyoutPrice;
		gAtr_Buy_ItemName		= targetItemName;
		gAtr_Buy_StackSize		= targetStackSize;
		gAtr_Buy_MaxCanBuy		= numMatches;

		Atr_Buy_Confirm_ItemName:SetText (targetItemName.." x"..targetStackSize);
		Atr_Buy_Confirm_Numstacks:SetNumber (1);
		Atr_Buy_Confirm_Max_Text:SetText (ZT("max")..": "..numMatches);
		Atr_Buy_Confirm_Frame:Show();
	end

	return numMatches;
end

-----------------------------------------

function Atr_Buy_Confirm_Update ()

	local num = Atr_Buy_Confirm_Numstacks:GetNumber();

	if (num == 1) then
		Atr_Buy_Confirm_Text2:SetText (ZT("stack for"));
	else
		Atr_Buy_Confirm_Text2:SetText (ZT("stacks for"));
	end

	MoneyFrame_Update ("Atr_Buy_Confirm_TotalPrice",  gAtr_Buy_BuyoutPrice * num);

end

-----------------------------------------

function Atr_AdjustScanForBoughtItem()

	gActionState = ATR_NOTHING;
	AuctionatorSubtractFromScan (gAtr_Buy_ItemName, gAtr_Buy_StackSize, gAtr_Buy_BuyoutPrice, gAtr_Buy_NumBought);

end



-----------------------------------------

function Atr_CheckActiveList()

	gAtr_CheckingActive_State = ATR_CACT_READY;

	gAtr_CheckingActive_Index = 1;

	gCurrentPane:SetToShowCurrent();

	Atr_CheckActiveButton:Disable();

end

-----------------------------------------

function Atr_CheckingActive_Next ()
	gAtr_CheckingActive_State = ATR_CACT_READY;
	gAtr_CheckingActive_Index = gAtr_CheckingActive_Index + 1;
end

-----------------------------------------

function Atr_CheckingActiveIdle()

	if (gAtr_CheckingActive_State == ATR_CACT_READY) then

		if (gAtr_CheckingActive_Index > #gHistoryItemList) then
			gAtr_CheckingActive_State = ATR_CACT_NULL;		-- done
			Atr_CheckActiveButton:Enable();
		else
			gAtr_CheckingActive_State = ATR_CACT_PROCESSING;

			local itemName = gHistoryItemList[gAtr_CheckingActive_Index]

			local _, itemLink = GetItemInfo (itemName);
			gCurrentPane:SetItem (itemName, itemLink, 0, 30);

			Atr_Hilight_Hentry (itemName);

		end
	end
end


-----------------------------------------

function Atr_Hilight_Hentry(itemName)

	for line = 1,ITEM_HIST_NUM_LINES do

		dataOffset = line + FauxScrollFrame_GetOffset (Atr_Hlist_ScrollFrame);

		local lineEntry = getglobal ("AuctionatorHEntry"..line);

		if (dataOffset <= #gHistoryItemList and gHistoryItemList[dataOffset]) then

			if (gHistoryItemList[dataOffset] == itemName) then
				lineEntry:SetButtonState ("PUSHED", true);
			else
				lineEntry:SetButtonState ("NORMAL", false);
			end
		end
	end
end

-----------------------------------------

function Atr_Item_Autocomplete(self)

	local text = self:GetText();
	local textlen = strlen(text);
	local name;

	-- first search shopping lists

	local numLists = #AUCTIONATOR_SHOPPING_LISTS;
	local n;

	for n = 1,numLists do
		local slist = AUCTIONATOR_SHOPPING_LISTS[n];

		local numItems = #slist.items;

		if ( numItems > 0 ) then
			for i=1, numItems do
				name = slist.items[i];
				if ( name and text and (strfind(strupper(name), strupper(text), 1, 1) == 1) ) then
					self:SetText(name);
					if ( self:IsInIMECompositionMode() ) then
						self:HighlightText(textlen - strlen(arg1), -1);
					else
						self:HighlightText(textlen, -1);
					end
					return;
				end
			end
		end
	end


	-- next search history list

	numItems = #gHistoryItemList;

	if ( numItems > 0 ) then
		for i=1, numItems do
			name = gHistoryItemList[i];
			if ( name and text and (strfind(strupper(name), strupper(text), 1, 1) == 1) ) then
				self:SetText(name);
				if ( self:IsInIMECompositionMode() ) then
					self:HighlightText(textlen - strlen(arg1), -1);
				else
					self:HighlightText(textlen, -1);
				end
				return;
			end
		end
	end
end

-----------------------------------------

function Atr_GetCurrentPane ()			-- so other modules can use gCurrentPane
	return gCurrentPane;
end

-----------------------------------------

function Atr_SetUINeedsUpdate ()			-- so other modules can easily set
	gCurrentPane.UINeedsUpdate = true;
end


-----------------------------------------

function Atr_CalcUndercutPrice (price)

	if	(price > 5000000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._5000000);	end;
	if	(price > 1000000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._1000000);	end;
	if	(price >  200000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._200000);	end;
	if	(price >   50000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._50000);	end;
	if	(price >   10000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._10000);	end;
	if	(price >    2000)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._2000);	end;
	if	(price >     500)	then return roundPriceDown (price, AUCTIONATOR_SAVEDVARS._500);		end;
	if	(price >       0)	then return math.floor (price - 1);	end;

	return 0;
end

-----------------------------------------

function Atr_CalcStartPrice (buyoutPrice)

	local discount = 1.00 - (AUCTIONATOR_SAVEDVARS.STARTING_DISCOUNT / 100);

	local newStartPrice = Atr_CalcUndercutPrice(math.floor(buyoutPrice * discount));

	if (AUCTIONATOR_SAVEDVARS.STARTING_DISCOUNT == 0) then		-- zero means zero
		newStartPrice = buyoutPrice;
	end

	return newStartPrice;

end

-----------------------------------------

function Atr_AbbrevItemName (itemName)

	return string.gsub (itemName, "Scroll of Enchant", "SoE");

end

-----------------------------------------

function Atr_IsMyToon (name)

	if (name and (AUCTIONATOR_TOONS[name] or AUCTIONATOR_TOONS[string.lower(name)])) then
		return true;
	end

	return false;
end


-----------------------------------------
-- roundPriceDown - rounds a price down to the next lowest multiple of a.
--				  - if the result is not at least a/2 lower, rounds down by a/2.
--
--	examples:  	(128790, 500)  ->  128500
--				(128700, 500)  ->  128000
--				(128400, 500)  ->  128000
-----------------------------------------

function roundPriceDown (price, a)

	local newprice = math.floor((price-1) / a) * a;

	if ((price - newprice) < a/2) then
		newprice = newprice - (a/2);
	end

	if (newprice == price) then
		newprice = newprice - 1;
	end

	return newprice;

end

-----------------------------------------

function ToTightTime(t)

	return floor((t - gTimeTightZero)/60);

end

-----------------------------------------

function FromTightTime(tt)

	return (tt*60) + gTimeTightZero;

end





