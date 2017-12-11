------------------------------------
-- dugu@bigfoot 2009-6-9
if (GetLocale() == "zhCN") then
	AUCTION_MOD_TITLE = "拍卖助手";
	AUCTION_MOD_ENABLE = "开启拍卖助手"
	AUCTION_MOD_ENABLE_DESC = "扫描并分析拍卖行物品价格"
	AUCTION_MOD_CLEAR_DATA = "清空数据";
elseif (GetLocale() == "zhTW") then
	AUCTION_MOD_TITLE = "拍賣助手";
	AUCTION_MOD_ENABLE = "開啟拍賣助手"
	AUCTION_MOD_ENABLE_DESC = "掃描並分析拍賣行物品價格"
	AUCTION_MOD_CLEAR_DATA = "清空數據";
else
	AUCTION_MOD_TITLE = "拍卖助手";
	AUCTION_MOD_ENABLE = "开启拍卖助手"
	AUCTION_MOD_ENABLE_DESC = "扫描并分析拍卖行物品价格"
	AUCTION_MOD_CLEAR_DATA = "清空数据";
end

if (dwIsConfigurableAddOn("Fence")) then
	dwRegisterMod(
		"AuctionMod",
		AUCTION_MOD_TITLE,
		"Fence",
		"",
		"Interface\\ICONS\\Spell_Holy_HopeAndGrace",
		nil
	);
	dwRegisterCheckButton(
		"AuctionMod",
		AUCTION_MOD_ENABLE,
		AUCTION_MOD_ENABLE_DESC,
		"EnableAuctionMod",
		1,
		function (arg)	
			if (arg == 1) then
				dwLoadAddOn("Fence");

				Fence_Toggle(true);
			else
				if (dwIsAddOnLoaded("Fence")) then
					Fence_Toggle(false);				
				end
			end
		end
	);

	dwRegisterButton(
		"AuctionMod",
		AUCTION_MOD_CLEAR_DATA, 
		function()
			if (dwIsAddOnLoaded("Fence")) then				
				Fence_ClearData();
			end
		end, 
		1
	);
end