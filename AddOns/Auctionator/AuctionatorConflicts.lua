
local Atr_orig_RecipeKnown_EventScan;
local Atr_orig_LootLink_OnEvent;
local Atr_orig_WOWEcon_Scan_AH;

-----------------------------------------


local function Atr_RecipeKnown_EventScan (rkSelf, rkEvent, rkArg1)

	if (event == "AUCTION_ITEM_LIST_UPDATE") then

		if (Atr_IsTabSelected()) then
			return;
		end
	
		local numBatchAuctions = GetNumAuctionItems("list");
		if (numBatchAuctions > 50) then		-- full scan
			return;
		end
	end

	Atr_orig_RecipeKnown_EventScan (rkSelf, rkEvent, rkArg1);
end

-----------------------------------------

local function Atr_LootLink_OnEvent ()

	if (event == "AUCTION_ITEM_LIST_UPDATE") then

		if (Atr_IsTabSelected()) then
			return;
		end
	
		local numBatchAuctions = GetNumAuctionItems("list");
		if (numBatchAuctions > 50) then		-- full scan
			return;
		end
	end

	Atr_orig_LootLink_OnEvent ();
end

-----------------------------------------

local function Atr_WOWEcon_Scan_AH ()

	if (Atr_IsTabSelected()) then
		return;
	end

	local numBatchAuctions = GetNumAuctionItems("list");
	if (numBatchAuctions > 50) then		-- full scan
		return;
	end

	Atr_orig_WOWEcon_Scan_AH ();
end


-----------------------------------------

function Atr_Check_For_Conflicts (addonName)

	if (ZC_StringSame (addonName, "recipeknown") and RecipeKnown_EventScan) then
		Atr_orig_RecipeKnown_EventScan = RecipeKnown_EventScan;
		RecipeKnown_EventScan = Atr_RecipeKnown_EventScan
		ZC_yellowmsg ("Auctionator is patching RecipeKnown to prevent a known conflict.");
	end

	if (ZC_StringContains (addonName, "lootlink") and LootLink_OnEvent) then
		Atr_orig_LootLink_OnEvent = LootLink_OnEvent;
		LootLink_OnEvent = Atr_LootLink_OnEvent
		ZC_yellowmsg ("Auctionator is patching LootLink to prevent a known conflict.");
	end

	if (ZC_StringContains (addonName, "wowecon") and WOWEcon_Scan_AH) then
		Atr_orig_WOWEcon_Scan_AH = WOWEcon_Scan_AH;
		WOWEcon_Scan_AH = Atr_WOWEcon_Scan_AH
		ZC_yellowmsg ("Auctionator is patching WowEcon to prevent a known conflict.");
	end

end
