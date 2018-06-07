------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	TITANPANEL_TITLE	= "泰坦信息条";
	TITANPANEL_ENABLE = "开启泰坦信息条";
	TITANPANEL_OPTION = "更多配置";
	TITANPANEL_NAME	= "Titan 面板";
elseif (GetLocale() == "zhTW") then
	TITANPANEL_TITLE	= "泰坦信息條";
	TITANPANEL_ENABLE = "開啟泰坦資訊條";
	TITANPANEL_OPTION = "更多配置";
	TITANPANEL_NAME	= "泰坦面版";
else
	TITANPANEL_TITLE	= "泰坦信息条";
	TITANPANEL_ENABLE = "开启泰坦信息条";
	TITANPANEL_OPTION = "更多配置";
	TITANPANEL_NAME	= "Titan Panel";
end


if (dwIsConfigurableAddOn("Titan")) then
	dwRegisterMod(
		"TITANPANEL",
		TITANPANEL_TITLE,
		"Titan Panel",
		"",
		"Interface\\ICONS\\INV_Misc_Ticket_Tarot_Maelstrom_01",		
		nil
	);
	
	dwRegisterCheckButton(
		"TITANPANEL",
		TITANPANEL_ENABLE,
		DUOWAN_RELOAD_DESC,
		"enable",
		1,
		function (arg)		
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Titan")) then
					dwLoadAddOn("Titan");
				end
			else
				if (dwIsAddOnLoaded("Titan")) then
					dwRequestReloadUI();
				end				
			end
		end
	);

	dwRegisterButton(
		"TITANPANEL",
		TITANPANEL_OPTION, 
		function()
			if (dwIsAddOnLoaded("Titan")) then
				TitanOpenOption();
			end
		end, 
		1
	);
end