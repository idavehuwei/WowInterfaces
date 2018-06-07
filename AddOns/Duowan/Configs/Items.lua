------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	ITEMS_TITLE = "物品咨询";
	ITEMS_MENDELEEV = "开启物品详细信息助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "显示物品等级";
	ITEMS_MENDELEEV_TRADESKILL = "显示物品的用途和来源";
	ITEMS_MENDELEEV_ITEMCOUNT = "显示拥有的物品数量";
	ITEMS_MENDELEEV_ITEMSTACK = "显示物品堆叠数量";
	ITEMS_MENDELEEV_QULITYTEXT = "显示物品质量(色盲模式)";
	ITEMS_MENDELEEV_ITEMTREE = "显示「使用在」树状结构";	
	ITEMS_MENDELEEV_GEMINFO = "显示镶嵌宝石信息";
	ITEMS_MENDELEEV_WARNING = "关闭该功能可有效降低内存占用";
elseif (GetLocale() == "zhTW") then
	ITEMS_TITLE = "物品諮詢";
	ITEMS_MENDELEEV = "開啟物品詳細資訊助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "顯示物品等級";
	ITEMS_MENDELEEV_TRADESKILL = "顯示物品的用途和來源";
	ITEMS_MENDELEEV_ITEMCOUNT = "顯示擁有的物品數量";
	ITEMS_MENDELEEV_ITEMSTACK = "顯示物品堆疊數量";
	ITEMS_MENDELEEV_QULITYTEXT = "顯示物品品質(色盲模式)";
	ITEMS_MENDELEEV_ITEMTREE = "顯示「使用在」樹狀結構";
	ITEMS_MENDELEEV_GEMINFO = "顯示鑲嵌寶石資訊";
	ITEMS_MENDELEEV_WARNING = "關閉該功能可有效降低記憶體佔用";
else
	ITEMS_TITLE = "物品咨询";
	ITEMS_MENDELEEV = "开启物品详细信息助手";
	ITEMS_MENDELEEV_ITEMLEVEL = "显示物品等级";
	ITEMS_MENDELEEV_TRADESKILL = "显示物品的用途和来源";
	ITEMS_MENDELEEV_ITEMCOUNT = "显示拥有的物品数量";
	ITEMS_MENDELEEV_ITEMSTACK = "显示物品堆叠数量";
	ITEMS_MENDELEEV_QULITYTEXT = "显示物品质量(色盲模式)";
	ITEMS_MENDELEEV_ITEMTREE = "显示「使用在」树状结构";
	ITEMS_MENDELEEV_GEMINFO = "显示镶嵌宝石信息";
	ITEMS_MENDELEEV_WARNING = "关闭该功能可有效降低内存占用";
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

	if (dwIsConfigurableAddOn("TradeskillInfo")) then
		dwRegisterCheckButton(
			"ITEMSHISTRY",
			ITEMS_MENDELEEV_TRADESKILL,
			nil,
			"Tradeskill",
			0,
			function (arg)		
				if (arg == 1) then
					if (dwIsAddOnLoaded("TradeskillInfo")) then
						dwLoadAddOn("TradeskillInfo");
					end
					TradeskillInfo:ToggleMerchantUse(true);
				else
					if (dwIsAddOnLoaded("TradeskillInfo")) then
						TradeskillInfo:ToggleMerchantUse(false);						
					end	
				end
			end,
			1
		);
	end

	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_GEMINFO,
		nil,
		"GemInfo",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowGemInfo(true);
				end
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowGemInfo(false);
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
		ITEMS_MENDELEEV_QULITYTEXT,
		nil,
		"QulityText",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowQulityText(true);
				end				
			else
				if (dwIsAddOnLoaded("Mendeleev")) then
					Mendeleev_ShowQulityText(false);
				end	
			end
		end,
		1
	);	
	dwRegisterCheckButton(
		"ITEMSHISTRY",
		ITEMS_MENDELEEV_ITEMTREE,
		ITEMS_MENDELEEV_WARNING,
		"ShowUsedInTree",
		0,
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
end