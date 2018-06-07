
if (GetLocale() == "zhCN") then
	MYINVENTORY_TITLE = "背包整合";
	MYINVENTORY_DESC = "开启背包整合";
	MYINVENTORY_OPTION_DESC = "开启配置";
	MYBANK_DESC = "开启银行整合";
	MYBANK_OPTION_DESC = "开启配置";	
	JPACK_DESC = "开启背包整理"
	JPACK_ORDER_DESC = "正序整理"
	MYBANK_ENABLE = "整合银行背包";
	MYBANK_ENABLE_TOOLTIP= "用一个物品框体整合银行中的所有栏位";
	
	MYINVENTORY_ENABLE_BACKPACK = "整合角色背包"
	MYINVENTORY_ENABLE_BACKPACK_TOOLTIP= "用一个物品框体整合角色背包中的所有栏位";
	
	MYBANK_CONFIG = "设置参数";
elseif (GetLocale() == "zhTW") then
	MYINVENTORY_TITLE = "背包整合";
	MYINVENTORY_DESC = "開啟背包整合";
	MYINVENTORY_OPTION_DESC = "開啟配置";
	MYBANK_DESC = "開啟銀行整合";
	MYBANK_OPTION_DESC = "開啟配置";
	JPACK_DESC = "開啟背包整理"
	JPACK_ORDER_DESC = "正序整理"
	MYBANK_ENABLE = "整合銀行背包";
	MYBANK_ENABLE_TOOLTIP= "用一個物品框體整合銀行中的所有欄位";
	
	MYINVENTORY_ENABLE_BACKPACK = "整合角色背包"
	MYINVENTORY_ENABLE_BACKPACK_TOOLTIP= "用一個物品框體整合角色背包中的所有欄位"
	
	MYBANK_CONFIG = "設置參數";
else
	MYINVENTORY_TITLE = "My Inventory";
	MYINVENTORY_DESC = "enable my inventory";
	MYINVENTORY_OPTION_DESC = "option...";
	MYBANK_DESC = "enable my bank";
	MYBANK_OPTION_DESC = "option...";	
	JPACK_DESC = "enable jpack"
	JPACK_ORDER_DESC = "asc"
	MYBANK_ENABLE = "整合银行背包";
	MYBANK_ENABLE_TOOLTIP= "用一个物品框体整合银行中的所有栏位";
	
	MYINVENTORY_ENABLE_BACKPACK = "整合角色背包"
	MYINVENTORY_ENABLE_BACKPACK_TOOLTIP= "用一个物品框体整合角色背包中的所有栏位";
	
	MYBANK_CONFIG = "设置参数";
end


if (dwIsConfigurableAddOn("MyInventory") or dwIsConfigurableAddOn("JPack") or dwIsConfigurableAddOn("Combuctor")) then
	dwRegisterMod(
		"MyInventory",
		MYINVENTORY_TITLE,
		"MyInventory",
		"",
		"Interface\\ICONS\\INV_Misc_Bag_08",		
		nil
	);
end

if (dwIsConfigurableAddOn("Combuctor")) then
	function Combuctor_ToggleBag(switch)
		local value = dwRawGetCVar("MyInventory", "EnableBank", 1);
		if (switch) then
			Combuctor:HookBagEvents(value, 1);			
		else
			Combuctor:HookBagEvents(value, 0);
		end
	end

	function Combuctor_ToggleBank(switch)
		local value = dwRawGetCVar("MyInventory", "EnableBackPack", 1);
		if (switch) then
			Combuctor:HookBagEvents(1, value);
		else
			Combuctor:HookBagEvents(0, value);
		end
	end

	dwRegisterCheckButton(
		"MyInventory",
		MYBANK_ENABLE,
		MYBANK_ENABLE_TOOLTIP,
		"EnableBank",
		1,
		function (arg)	          
			if (arg == 1) then				
				Combuctor_ToggleBank(true);
			else
				Combuctor_ToggleBank(false);	
			end
		end
	);	
	
	dwRegisterCheckButton(
		"MyInventory",
		MYINVENTORY_ENABLE_BACKPACK,
		MYINVENTORY_ENABLE_BACKPACK_TOOLTIP,
		"EnableBackPack",
		1,
		function (arg)	          
			if (arg == 1) then				
				Combuctor_ToggleBag(true);
			else
				Combuctor_ToggleBag(false);
			end
		end
	);	

	dwRegisterButton(
		"MyInventory",
		MYBANK_CONFIG,
		function()
			if dwIsAddOnLoaded("Combuctor")  then
				Combuctor:ShowOptions()
				PlaySound("igMainMenuOption");
			end
		end,
		nil
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
