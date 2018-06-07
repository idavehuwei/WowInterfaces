------------------------------------
-- dugu 2009-12-19

if (GetLocale() == "zhCN") then
	MERCHANTASSIST_TITLE = "售卖修理";
	AUTOREPAIR_TEXT = "自动修理装备";
	AUTOREPAIR_ONLY_INV = "只修理身上装备";
	AUTOREPAIR_ONLY_INV_TIP = "反选此项将连同背包里的破损装备一起修理";
	AUTOREPAIR_USE_GUIDBANK = "优先使用工会银行(如具有权限)";
	AUTOSELL_TEXT = "自动贩卖垃圾";
	AUTOSELL_IGNOR_TEXT = "不出售暗月马戏团物品";
	AUTOBUY_TOGGLE_TEXT = "自动购买施法材料";
	AUTOBUY_OPTION_TEXT = "详细设置";
elseif (GetLocale() == "zhTW") then
	MERCHANTASSIST_TITLE = "售賣修理";
	AUTOREPAIR_TEXT = "自動修理裝備";
	AUTOREPAIR_ONLY_INV = "只修理身上裝備";
	AUTOREPAIR_ONLY_INV_TIP = "反選此項將連同背包裏的破損裝備一起修理";
	AUTOREPAIR_USE_GUIDBANK = "優先使用工會銀行(如具有許可權)";
	AUTOSELL_TEXT = "自動販賣垃圾";
	AUTOSELL_IGNOR_TEXT = "不出售暗月馬戲團物品";
	AUTOBUY_TOGGLE_TEXT = "自動購買施法材料";
	AUTOBUY_OPTION_TEXT = "詳細設置";
else
	MERCHANTASSIST_TITLE = "售卖修理";
	AUTOREPAIR_TEXT = "自动修理装备";
	AUTOREPAIR_ONLY_INV = "只修理身上装备";
	AUTOREPAIR_ONLY_INV_TIP = "反选此项将连同背包里的破损装备一起修理";
	AUTOREPAIR_USE_GUIDBANK = "优先使用工会银行(如具有权限)";
	AUTOSELL_TEXT = "自动贩卖垃圾";
	AUTOSELL_IGNOR_TEXT = "不出售暗月马戏团物品";
	AUTOBUY_TOGGLE_TEXT = "自动购买施法材料";
	AUTOBUY_OPTION_TEXT = "详细设置";
end

if (dwIsConfigurableAddOn("MerchantAssist")) then
	dwRegisterMod(
		"MerchantAssist",
		MERCHANTASSIST_TITLE ,
		"Merchant Assist",
		"",
		"Interface\\ICONS\\INV_Misc_Coin_02",		
		nil
	);

	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOREPAIR_TEXT,
		nil,
		"EnableAutoRepair",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("MerchantAssist")) then
					dwLoadAddOn("MerchantAssist");
				end
				AutoRepair_Toggle(true);
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoRepair_Toggle(false);
				end
			end
		end
	);
	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOREPAIR_ONLY_INV,
		AUTOREPAIR_ONLY_INV_TIP,
		"OnlyInventory",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoRepair_RepairInvOnly(true);
				end
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoRepair_RepairInvOnly(false);		
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOREPAIR_USE_GUIDBANK,
		nil,
		"GuidBankFirst",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoRepair_UseGuidBank(true);
				end
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoRepair_UseGuidBank(false);		
				end
			end
		end,
		1
	);
	
	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOSELL_TEXT,
		nil,
		"EnableAutoSell",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("MerchantAssist")) then
					dwLoadAddOn("MerchantAssist");
				end
				AutoSell_Toggle(true);
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoSell_Toggle(false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOSELL_IGNOR_TEXT,
		nil,
		"AutoSellIgnor",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoSell_ToggleIgnor(true);
				end				
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoSell_ToggleIgnor(false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"MerchantAssist",
		AUTOBUY_TOGGLE_TEXT,
		nil,
		"EnableAutoBuy",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoBuy_Toggle(true);
				end				
			else
				if (dwIsAddOnLoaded("MerchantAssist")) then
					AutoBuy_Toggle(false);
				end
			end
		end
	);

	dwRegisterButton(
		"MerchantAssist",
		AUTOBUY_OPTION_TEXT, 
		function()
			if (dwIsAddOnLoaded("MerchantAssist")) then
				MerchantAssistFrame:Show();
				MerchantAssistFrameTab_OnClick(nil, nil, 2);
			end
		end, 
		1
	);
	
end