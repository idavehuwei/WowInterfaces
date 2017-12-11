------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	EQUIPSWITCHER_TITLE = "快速换装";
	EQUIPSWITCHER_ENABLE = "启用一键换装";	
	EQUIPSWITCHER_ENABLE2 = "头像上显示快速换装条";
	EQUIPSWITCHER_RAID = "团队中自动隐藏";
	EQUIPSWITCHER_YPOS = "纵向位置";
elseif (GetLocale() == "zhTW") then
	EQUIPSWITCHER_TITLE = "快速換裝";
	EQUIPSWITCHER_ENABLE = "啟用一鍵換裝";	
	EQUIPSWITCHER_ENABLE2 = "頭像上顯示快速換裝條";
	EQUIPSWITCHER_XPOS = "橫向位置";
	EQUIPSWITCHER_YPOS = "縱向位置";

else
	EQUIPSWITCHER_TITLE = "快速换装";
	EQUIPSWITCHER_ENABLE = "启用一键换装";	
	EQUIPSWITCHER_ENABLE2 = "头像上显示快速换装条";
	EQUIPSWITCHER_XPOS = "横向位置";
	EQUIPSWITCHER_YPOS = "纵向位置";
end


if (dwIsConfigurableAddOn("EquipSwitcher")) then	
	dwRegisterMod(
		"EquipSwitcher",
		EQUIPSWITCHER_TITLE,
		"EquipmentCompare",
		"",
		"Interface\\ICONS\\INV_Chest_Mail_04",
		nil
	);

	dwRegisterCheckButton(
		"EquipSwitcher",
		EQUIPSWITCHER_ENABLE,
		nil,
		"EQUIPSWITCHER_ENABLE",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("EquipSwitcher")) then
					dwLoadAddOn("EquipSwitcher");					
				end
				EquipSwitcherEnable(true);
			else
				if (dwIsAddOnLoaded("EquipSwitcher")) then	
					
				end			
				EquipSwitcherEnable(false);
			end
		end
	);
	dwRegisterCheckButton(
		"EquipSwitcher",
		EQUIPSWITCHER_ENABLE2,
		nil,
		"EQUIPSWITCHER_ENABLE2",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("EquipSwitcher")) then
					dwLoadAddOn("EquipSwitcher");					
				end
				EquipSwitcherEnableBar(true);
			else
				if (dwIsAddOnLoaded("EquipSwitcher")) then	
					
				end			
				EquipSwitcherEnableBar(false);
			end
		end,
		1
	);	
	dwRegisterCheckButton(
		"EquipSwitcher",
		EQUIPSWITCHER_RAID,
		nil,
		"EQUIPSWITCHER_RAID",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("EquipSwitcher")) then
					dwLoadAddOn("EquipSwitcher");					
				end
				EquipSwitcher_SetHideRaid(true);
			else
				if (dwIsAddOnLoaded("EquipSwitcher")) then	
					
				end			
				EquipSwitcher_SetHideRaid(false);
			end
		end,
		1
	);
end