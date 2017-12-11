------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	ITEMS_TITLE = "物品咨询";
	ITEMS_MENDELEEV = "开启物品详细信息助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "显示物品等级";
	ITEMS_MENDELEEV_TRADESKILL = "显示商业用途";
	ITEMS_MENDELEEV_ITEMCOUNT = "显示拥有的物品数量";
	ITEMS_MENDELEEV_ITEMSTACK = "显示物品堆叠数量";
	ITEMS_MENDELEEV_ITEMTREE = "显示「使用在」树状结构";
	ITEMS_FENCE_AUTION_INFO = "显示物品拍卖行信息";
elseif (GetLocale() == "zhTW") then
	ITEMS_TITLE = "物品諮詢";
	ITEMS_MENDELEEV = "開啟物品詳細資訊助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "顯示物品等級";
	ITEMS_MENDELEEV_TRADESKILL = "顯示商業用途";
	ITEMS_MENDELEEV_ITEMCOUNT = "顯示擁有的物品數量";
	ITEMS_MENDELEEV_ITEMSTACK = "顯示物品堆疊數量";
	ITEMS_MENDELEEV_ITEMTREE = "顯示「使用在」樹狀結構";
	ITEMS_FENCE_AUTION_INFO = "顯示物品拍賣行諮詢";
else
	ITEMS_TITLE = "物品咨询";
	ITEMS_MENDELEEV = "开启物品详细信息助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "显示物品等级";
	ITEMS_MENDELEEV_TRADESKILL = "显示商业用途";
	ITEMS_MENDELEEV_ITEMCOUNT = "显示拥有的物品数量";
	ITEMS_MENDELEEV_ITEMSTACK = "显示物品堆叠数量";
	ITEMS_MENDELEEV_ITEMTREE = "显示「使用在」树状结构";
	ITEMS_FENCE_AUTION_INFO = "显示物品拍卖行信息";
end

if (dwIsConfigurableAddOn("Mendeleev")) then
	dwRegisterMod(
		"ITEMSHISTRY",
		ITEMS_TITLE,
		"ITEMS",
		"",
		"Interface\\ICONS\\INV_Relics_LibramofGrace",
		nil
	);
end

if (dwIsConfigurableAddOn("Mendeleev")) then
	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV,
		nil,
		"EnableMendeleev",
		1,
		function (arg)		
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Mendeleev")) then
					dwLoadAddOn("Mendeleev");
				end
				Mendeleev_Toggle(true);
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_Toggle(false);
				end	
			end
		end
	);

	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_ITEMLEVEL,
		nil,
		"itemLevel",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowItemLevel(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowItemLevel(false);
				end	
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_TRADESKILL,
		nil,
		"Tradeskill",
		0,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowTradeskill(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowTradeskill(false);
				end	
			end
		end,
		1
	);
	
	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_ITEMCOUNT,
		nil,
		"itemCount",
		0,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowItemCount(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowItemCount(false);
				end	
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_ITEMSTACK,
		nil,
		"StackSize",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowStackSize(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowStackSize(false);
				end	
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_ITEMTREE,
		nil,
		"UsedInTree",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowUsedInTree(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowUsedInTree(false);
				end	
			end
		end,
		1
	);
	if (dwIsConfigurableAddOn("Fence")) then
		dwRegisterCheckButton(
			"ITEMSHISTRY",
			ITEMS_FENCE_AUTION_INFO,
			nil,
			"AuctionInfo",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Fence")) then
						dwLoadAddOn("fence");						
					end
					Fence_ShowTooltipInfo(true);
				else
					if (dwIsAddOnLoaded("Fence")) then
						Fence_ShowTooltipInfo(false);
					end	
				end
			end,
			1
		);
	end
end