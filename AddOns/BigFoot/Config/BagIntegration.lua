
if (GetLocale() == "zhCN") then
	MOD_BAG_INTEGRATION_TITLE = {"背包整合", "beibaozhenghe"};

	MYINVENTORY_ENABLE = "整合玩家背包";
	MYINVENTORY_ENABLE_VIEW_OTHER = "允许查看其它角色的物品";
	MYINVENTORY_CONFIG = "设置参数";
	MYBANK_ENABLE = "整合银行背包";
	MYBANK_CONFIG = "设置参数";
	MYBANK_OPEN_TEXT = "打开银行背包";
	PUI_ENABLE_TEXT = "背包整理";
	PUI_REVERSE_TEXT = "反序整理";
	PUI_ENABLE_TOOLTIP = "将你背包里的物品按种类整理好。";
	PUI_REVERSE_TOOLTIP = "按照相反的顺序整理背包里的物品。";
elseif (GetLocale()=="zhTW") then
	MOD_BAG_INTEGRATION_TITLE = {"背包整合", "beibaozhenghe"};

	MYINVENTORY_ENABLE = "整合玩家背包";
	MYINVENTORY_ENABLE_VIEW_OTHER = "允許查看其他角色的物品";
	MYINVENTORY_CONFIG = "設置參數";
	MYBANK_ENABLE = "整合銀行背包";
	MYBANK_CONFIG = "設置參數";
	MYBANK_OPEN_TEXT = "打開銀行背包";
	PUI_ENABLE_TEXT = "背包整理";
	PUI_REVERSE_TEXT = "反序整理";
	PUI_ENABLE_TOOLTIP = "將你背包裏的物品按種類整理好。";
	PUI_REVERSE_TOOLTIP = "按照相反的順序整理背包裏的物品。";
else
	MOD_BAG_INTEGRATION_TITLE = "Bag Integratation";

	MYINVENTORY_ENABLE = "Enable MyInventory";
	MYINVENTORY_ENABLE_VIEW_OTHER = "Enable View Other Character";
	MYINVENTORY_CONFIG = "Settings";
	MYBANK_ENABLE = "Enable MyBank";
	MYBANK_CONFIG = "Settings";
	MYBANK_OPEN_TEXT = "View MyBank";
	PUI_ENABLE_TEXT = "Enable Tidy Inventory";
	PUI_REVERSE_TEXT = "Reverse";
	PUI_ENABLE_TOOLTIP = "Pack up items in your bags/bank automatically.";
	PUI_REVERSE_TOOLTIP = "Pack up items with reverse order.";
end

if (IsConfigurableAddOn("MyInventory") or IsConfigurableAddOn("MyBank") or IsConfigurableAddOn("PackUpInventory")) then
	ModManagement_RegisterMod(
		"BagIntegration",
		"Interface\\Icons\\INV_Misc_Bag_13",
		MOD_BAG_INTEGRATION_TITLE,
		"",
		nil
	);
end

if (IsConfigurableAddOn("MyInventory")) then
	ModManagement_RegisterCheckBox(
		"BagIntegration",
		MYINVENTORY_ENABLE,
		nil,
		"EnableMyInventory",
		1,
		function (arg)
			if ( arg == 1 ) then
				if (not BigFoot_IsAddOnLoaded("MyInventory")) then
					BigFoot_LoadAddOn("MyInventory");
				end

				if (BigFoot_IsAddOnLoaded("MyInventory")) then
					MyInventory_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("MyInventory")) then
					MyInventory_Toggle(false);
				end
			end
		end
	);

	ModManagement_RegisterCheckBox(
		"BagIntegration",
		MYINVENTORY_ENABLE_VIEW_OTHER,
		nil,
		"EnableMyInventoryViewOther",
		0,
		function (arg)
			if (BigFoot_IsAddOnLoaded("MyInventory")) then
				if (arg == 1) then
					MyInventory_ToggleViewOther(true);
				else
					MyInventory_ToggleViewOther(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterButton(
		"BagIntegration",
		MYINVENTORY_CONFIG,
		function ()
			if (BigFoot_IsAddOnLoaded("MyInventory")) then
				ShowUIPanel(MyInventoryOptionsFrame);
			end
		end,
		nil,
		1
	);
end

if (IsConfigurableAddOn("MyBank")) then
	ModManagement_RegisterCheckBox(
		"BagIntegration",
		MYBANK_ENABLE,
		nil,
		"EnableMyBank",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("MyBank")) then
					BigFoot_LoadAddOn("MyBank");
				end

				if (BigFoot_IsAddOnLoaded("MyBank")) then
					MyBank_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("MyBank")) then
					MyBank_Toggle(false);
				end
			end
		end
	);

    ModManagement_RegisterButton(
		"BagIntegration",
		MYBANK_CONFIG,
		function ()
			if (BigFoot_IsAddOnLoaded("MyBank")) then
				ShowUIPanel(MyBankConfigFrame);
			end
		end,
		nil,
		1
	);

	 ModManagement_RegisterButton(
		"BagIntegration",
		 MYBANK_OPEN_TEXT,
		 function ()		
			if (BigFoot_IsAddOnLoaded("MyBank")) then
				ToggleMyBankFrame();
				HideUIPanel(ModManagementFrame);
			end
		end,
		nil,
		1
	);
end

if (IsConfigurableAddOn("PackUpInventory")) then
	ModManagement_RegisterCheckBox(
		"BagIntegration",
		PUI_ENABLE_TEXT,
		PUI_ENABLE_TOOLTIP,
		"Enable_PUI",
		1,
		function (arg)	          
			if (arg == 1) then				
				if (not BigFoot_IsAddOnLoaded("PackUpInventory")) then
					BigFoot_LoadAddOn("PackUpInventory");
				end
				if (BigFoot_IsAddOnLoaded("PackUpInventory")) then
					PUI_Toggle(true);
				end							
			else
				if (BigFoot_IsAddOnLoaded("PackUpInventory")) then
					PUI_Toggle(false);
				end
			end
		end
	);		

	ModManagement_RegisterCheckBox(
		"BagIntegration",
		PUI_REVERSE_TEXT,
		nil,
		"ReverseMode",
		0,
		function (arg)	          
			if (arg == 1) then				
				if (BigFoot_IsAddOnLoaded("PackUpInventory")) then
					PUI_SetOrder("desc");
				end
			else
				if (BigFoot_IsAddOnLoaded("PackUpInventory")) then
					PUI_SetOrder("asc");
				end
			end
		end,
		1
	);		
end