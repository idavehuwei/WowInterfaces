
if (GetLocale() == "zhCN") then
	MYINVENTORY_TITLE = "背包整合";
	MYINVENTORY_DESC = "开启背包整合";
	MYINVENTORY_OPTION_DESC = "开启配置";
	MYBANK_DESC = "开启银行整合";
	MYBANK_OPTION_DESC = "开启配置";	
	JPACK_DESC = "开启背包整理"
	JPACK_ORDER_DESC = "正序整理"
elseif (GetLocale() == "zhTW") then
	MYINVENTORY_TITLE = "背包整合";
	MYINVENTORY_DESC = "開啟背包整合";
	MYINVENTORY_OPTION_DESC = "開啟配置";
	MYBANK_DESC = "開啟銀行整合";
	MYBANK_OPTION_DESC = "開啟配置";
	JPACK_DESC = "開啟背包整理"
	JPACK_ORDER_DESC = "正序整理"
else
	MYINVENTORY_TITLE = "My Inventory";
	MYINVENTORY_DESC = "enable my inventory";
	MYINVENTORY_OPTION_DESC = "option...";
	MYBANK_DESC = "enable my bank";
	MYBANK_OPTION_DESC = "option...";	
	JPACK_DESC = "enable jpack"
	JPACK_ORDER_DESC = "asc"
end


if (dwIsConfigurableAddOn("MyInventory") or dwIsConfigurableAddOn("JPack") ) then
	dwRegisterMod(
		"MyInventory",
		MYINVENTORY_TITLE,
		"MyInventory",
		"",
		"Interface\\ICONS\\INV_Misc_Bag_08",		
		nil
	);
end

if (dwIsConfigurableAddOn("MyInventory")) then
	dwRegisterCheckButton(
		"MyInventory",
		MYINVENTORY_DESC,
		nil,
		"EnableMyInventory",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not dwIsAddOnLoaded("MyInventory")) then
					dwLoadAddOn("MyInventory");					
				end	
				MyInvenroty_Toggle(true);
			else
				if (dwIsAddOnLoaded("MyInventory")) then
					MyInvenroty_Toggle(false);
				end
			end
		end
	);
	dwRegisterButton (
		"MyInventory",
		MYINVENTORY_OPTION_DESC,
		function ()
			ShowUIPanel(MyInventoryOptionsFrame);	
		end,
		1
	);
	dwRegisterCheckButton(
		"MyInventory",
		MYBANK_DESC,
		nil,
		"EnableMyBank",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not dwIsAddOnLoaded("MyInventory")) then
					dwLoadAddOn("MyInventory");					
				end				
				MyBank_Toggle(true);
			else
				if (dwIsAddOnLoaded("MyInventory")) then
					MyBank_Toggle(false);
				end
			end
		end
	);
	dwRegisterButton (
		"MyInventory",
		MYBANK_OPTION_DESC ,
		function()
			if (dwIsAddOnLoaded("MyInventory")) then
				ShowUIPanel(MyBankConfigFrame);
			end
		end,
		1
	);	
end

if (dwIsConfigurableAddOn("JPack")) then
	dwRegisterCheckButton(
		"MyInventory",
		JPACK_DESC,
		nil,
		"EnableJPack",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not dwIsAddOnLoaded("JPack")) then
					dwLoadAddOn("JPack");
					
				end	
				JPack_Toggle(true);
			else
				if (dwIsAddOnLoaded("JPack")) then
					JPack_Toggle(false);
				end
			end
		end
	);
	--[[
	dwRegisterCheckButton(
		"MyInventory",
		JPACK_ORDER_DESC,
		nil,
		"ASCOrder",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("JPack")) then
					JPack_Order("asc");	
				end
			else	
				if (dwIsAddOnLoaded("JPack")) then
					JPack_Order("desc");
				end
			end
		end,
		1
	);
	--]]
end
