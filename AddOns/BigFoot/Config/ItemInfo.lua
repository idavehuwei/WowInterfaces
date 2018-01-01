local __L = BLocal("ItemInfo");

if (GetLocale() == "zhCN") then
	__L["Item Info"]					= {"物品信息", "wupinxinxi"};
	__L["Enable Auction Helper"]	= "启用拍卖助手";
	__L["Enable Item Info"]			= "启用物品信息";
	__L["Show Sell Value"]			= "显示物品出售价格";
	__L["Show Total Value"]			= "显示物品总价";
	__L["Show Auction Info"]		= "显示物品的拍卖行信息";
	__L["Show Additional Info"]	= "显示物品等级|堆叠|用途";
	__L["Show Gem Info"]			= "显示宝石信息";
	__L["Show Item Qulity"]			= "显示物品质量";
	__L["Clear Dada"]					= "清除拍卖信息";
elseif (GetLocale() == "zhTW") then
	__L["Item Info"]					= {"物品信息", "wupinxinxi"};
	__L["Enable Auction Helper"]	= "啟用拍賣助手";
	__L["Enable Item Info"]			= "啟用物品信息";
	__L["Show Sell Value"]			= "顯示物品出售價格";
	__L["Show Total Value"]			= "顯示物品總價格";
	__L["Show Auction Info"]		= "顯示物品的拍賣行資訊";
	__L["Show Additional Info"]	= "顯示物品等級|堆疊|用途";
	__L["Show Gem Info"]			= "顯示寶石信息";
	__L["Show Item Qulity"]			= "顯示物品質量";
	__L["Clear Dada"]					= "清除拍賣資訊";
end

if (IsConfigurableAddOn("ItemInfo")) then
	ModManagement_RegisterMod(
		"Item Info",
		"Interface\\ICONS\\INV_Relics_LibramofGrace.blp",
		__L["Item Info"],
		"",
		nil,
		nil
	);

	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Enable Item Info"],
		nil,
		"EnableItemInfo",
		1,
		function (__arg)
			if (__arg == 1) then
				if (not BigFoot_IsAddOnLoaded("ItemInfo")) then
					BigFoot_LoadAddOn("ItemInfo");
				end

				if (BigFoot_IsAddOnLoaded("ItemInfo")) then
					ItemInfo_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ItemInfo")) then
					ItemInfo_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Sell Value"],
		nil,
		"EnableSellValue",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['SellValue'] = 1;
				else
					II_Config['SellValue'] = nil;
				end
			end
		end,
		1
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Total Value"],
		nil,
		"EnableTotalValue",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['TotalValue'] = 1;
				else
					II_Config['TotalValue'] = nil;
				end
			end
		end,
		1
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Auction Info"],
		nil,
		"EnableAuctionInfo",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['AuctionInfo'] = 1;
				else
					II_Config['AuctionInfo'] = nil;
				end
			end
		end,
		1
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Additional Info"],
		nil,
		"EnableAdditionalInfo",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['ItemLevel'] = 1;
					II_Config['StackCount'] = 1;
					II_Config['UseInfo'] = 1;
				else
					II_Config['ItemLevel'] = nil;
					II_Config['StackCount'] = nil;
					II_Config['UseInfo'] = nil;
				end
			end
		end,
		1
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Gem Info"],
		nil,
		"EnableGemInfo",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['GemInfo'] = 1;
				else
					II_Config['GemInfo'] = nil;
				end
			end
		end,
		1
	);
	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Show Item Qulity"],
		nil,
		"EnableQulity",
		1,
		function (__arg)
			if (BigFoot_IsAddOnLoaded("ItemInfo")) then
				if (__arg == 1) then
					II_Config['ItemQulity'] = 1;
				else
					II_Config['ItemQulity'] = nil;
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"Item Info",
		__L["Enable Auction Helper"],
		nil,
		"EnableAuctionHelper",
		0,
		function (__arg)
			if (__arg == 1) then
				if (not BigFoot_IsAddOnLoaded("ItemInfo")) then
					BigFoot_LoadAddOn("ItemInfo");
				end

				if (BigFoot_IsAddOnLoaded("ItemInfo")) then
					ItemInfo_AuctionToggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ItemInfo")) then
					ItemInfo_AuctionToggle(false);
				end
			end
		end
	);
	ModManagement_RegisterButton(
		"Item Info",
		__L["Clear Dada"],
		function ()
			ItemInfo_ClearAcutionInfomation();
		end,
		nil,
		1
	);
end
