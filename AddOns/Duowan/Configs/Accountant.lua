------------------------------------
-- dugu 2009-12-19
local ACCOUNTANT_CLASSIC_TITLE, ACCOUNTANT_CLASSIC_DESC, ACCOUNTANT_CLASSIC_OPTION;

if (GetLocale() == "zhCN") then
	ACCOUNTANT_CLASSIC_TITLE = "收支统计";
	ACCOUNTANT_CLASSIC_DESC = "开启收支统计";
	ACCOUNTANT_CLASSIC_OPTION = "查看统计";	
elseif (GetLocale() == "zhTW") then
	ACCOUNTANT_CLASSIC_TITLE = "收支统计";
	ACCOUNTANT_CLASSIC_DESC = "开启收支统计";
	ACCOUNTANT_CLASSIC_OPTION = "查看统计";	
else
	ACCOUNTANT_CLASSIC_TITLE = "收支统计";
	ACCOUNTANT_CLASSIC_DESC = "开启收支统计";
	ACCOUNTANT_CLASSIC_OPTION = "查看统计";
end

if (dwIsConfigurableAddOn("Accountant_Classic")) then
	dwRegisterMod(
		"Accountant_Classic",
		ACCOUNTANT_CLASSIC_TITLE ,
		"Accountant",
		"",
		"Interface\\ICONS\\INV_Misc_Coin_01",		
		nil
	);

	dwRegisterCheckButton(
		"Accountant_Classic",
		ACCOUNTANT_CLASSIC_DESC,
		nil,
		"EnableAccountant",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Accountant_Classic")) then
					dwLoadAddOn("Accountant_Classic");
				end				
			else
				if (dwIsAddOnLoaded("Accountant_Classic")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	
	dwRegisterButton(
		"Accountant_Classic",
		ACCOUNTANT_CLASSIC_OPTION, 
		function()
			if (dwIsAddOnLoaded("Accountant_Classic")) then
				HideUIPanel(DuowanConfigFrame);
				AccountantButton_OnClick();
			end
		end, 
		1
	);	
end