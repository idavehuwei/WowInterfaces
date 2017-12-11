------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "开启DKP功能";	
	DWDKP_OPEN_OPTION = "开启面板";	
elseif (GetLocale() == "zhTW") then
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "開啟DKP功能";	
	DWDKP_OPEN_OPTION = "開啟面板";	
else
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "开启DKP功能";	
	DWDKP_OPEN_OPTION = "开启面板";	
end

if (dwIsConfigurableAddOn("DWDKP")) then
	dwRegisterMod(
		"DWDKP",
		DWDKP_TITLE,
		"DWDKP",
		"",
		"Interface\\ICONS\\Spell_unused2",
		nil,
		"RAID"
	);
	dwRegisterCheckButton(
		"DWDKP",
		DWDKP_ENABLE,
		DUOWAN_RELOAD_DESC,
		"DWDKPEnable",
		0,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("DWDKP")) then
					dwLoadAddOn("DWDKP");					
				end				
			else
				if (dwIsAddOnLoaded("DWDKP")) then	
					dwRequestReloadUI(nil);
				end			
			end
		end
	);
	dwRegisterButton(
		"DWDKP",
		DWDKP_OPEN_OPTION, 
		function()			
			if (dwIsAddOnLoaded("DWDKP")) then
				HideUIPanel(DuowanConfigFrame);
				ShowUIPanel(CT_RaidTrackerFrame);
				MerDKPFrame:Show();
			end
		end, 
		1
	);	
end