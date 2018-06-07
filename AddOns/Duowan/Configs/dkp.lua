------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "开启多玩DKP功能";
	DWDKP_MIDKP_ENABLE = "开启大脚DKP模块";
	DWDKP_OPEN_OPTION = "开启面板";	
elseif (GetLocale() == "zhTW") then
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "開啟多玩DKP功能";
	DWDKP_MIDKP_ENABLE = "開啟大脚DKP模块";
	DWDKP_OPEN_OPTION = "開啟面板";	
else
	DWDKP_TITLE = "多玩DKP";
	DWDKP_ENABLE = "开启多玩DKP功能";
	DWDKP_MIDKP_ENABLE = "开启大脚DKP模块";
	DWDKP_OPEN_OPTION = "开启面板";	
end

if (dwIsConfigurableAddOn("DWDKP") or dwIsBigFootAddOn("MiDKP")) then
	dwRegisterMod(
		"DWDKP",
		DWDKP_TITLE,
		"DWDKP",
		"",
		"Interface\\ICONS\\Spell_unused2",
		nil,
		"RAID"
	);
end

if (dwIsConfigurableAddOn("DWDKP")) then
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

if (dwIsBigFootAddOn("MiDKP")) then
	dwRegisterCheckButton(
		"DWDKP",
		DWDKP_MIDKP_ENABLE,
		nil,
		"MiDKPEnable",
		1,
		function (arg)			
			if (arg == 1) then
				MiDKP.S:DoHook();
				MiDKP.UI.Frame:OnAddOnLoaded();
			else
				MiDKP.S:DoUnhook();	
			end
		end
	);
end