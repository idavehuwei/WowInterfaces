------------------------------------
-- dugu 2009-6-9
if (GetLocale() == "zhCN") then
	AUCTION_MOD_TITLE = "拍卖助手";
	AUCTION_MOD_ENABLE = "开启拍卖助手"
	AUCTION_MOD_ENABLE_DESC = "扫描并分析拍卖行物品价格"
	AUCTION_MOD_CLEAR_DATA = "清空数据";
	AUCTION_MOD_OPTION = "更多设置";
	ITEMS_FENCE_AUTION_INFO = "显示物品拍卖行信息";
elseif (GetLocale() == "zhTW") then
	AUCTION_MOD_TITLE = "拍賣助手";
	AUCTION_MOD_ENABLE = "開啟拍賣助手"
	AUCTION_MOD_ENABLE_DESC = "掃描並分析拍賣行物品價格"
	AUCTION_MOD_CLEAR_DATA = "清空數據";
	AUCTION_MOD_OPTION = "更多設置";
	ITEMS_FENCE_AUTION_INFO = "顯示物品拍賣行諮詢";
else
	AUCTION_MOD_TITLE = "拍卖助手";
	AUCTION_MOD_ENABLE = "开启拍卖助手"
	AUCTION_MOD_ENABLE_DESC = "扫描并分析拍卖行物品价格"
	AUCTION_MOD_CLEAR_DATA = "清空数据";
	AUCTION_MOD_OPTION = "更多设置";
	ITEMS_FENCE_AUTION_INFO = "显示物品拍卖行信息";
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
				if (not dwIsAddOnLoaded("Fence")) then
					dwLoadAddOn("Fence");
				end
				Fence_Toggle(true);
			else
				if (dwIsAddOnLoaded("Fence")) then
					--Fence_Toggle(false);
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	dwRegisterCheckButton(
		"AuctionMod",
		ITEMS_FENCE_AUTION_INFO,
		nil,
		"AuctionInfo",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Fence")) then
					Fence_ShowTooltipInfo(true);
				end
			else
				if (dwIsAddOnLoaded("Fence")) then
					Fence_ShowTooltipInfo(false);
				end	
			end
		end,
		1
	);
	dwRegisterButton(
		"AuctionMod",
		AUCTION_MOD_OPTION, 
		function()
			if (dwIsAddOnLoaded("Fence")) then				
				InterfaceOptionsFrame_OpenToCategory(AuctionLite.optionFrames.main);
			end
		end, 
		1
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