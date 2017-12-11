------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	EQUIPCOMPARE_TITLE = "装备对比";
	EQUIPCOMPARE_ENABLE = "不按住Shift键即可进行装备比较";	
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可进行装备比较";
elseif (GetLocale() == "zhTW") then
	EQUIPCOMPARE_TITLE = "裝備對比";
	EQUIPCOMPARE_ENABLE = "不按住Shift鍵即可進行裝備比較";	
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可進行裝備比較";
else
	EQUIPCOMPARE_TITLE = "装备对比";
	EQUIPCOMPARE_ENABLE = "不按住Shift键即可进行装备比较";	
	EQUIPCOMPARE_ENABLE_TIP = "不需要按住Shift即可进行装备比较";
end


if (dwIsConfigurableAddOn("TinyTip")) then	
	dwRegisterMod(
		"EquipCompare",
		EQUIPCOMPARE_TITLE,
		"EquipmentCompare",
		"",
		"Interface\\ICONS\\INV_Misc_EngGizmos_04",
		nil
	);

	dwRegisterCheckButton(
		"EquipCompare",
		EQUIPCOMPARE_ENABLE,
		EQUIPCOMPARE_ENABLE_TIP,
		"EquipComareEnable",
		1,
		function (arg)		
			if arg==1 then
				if (not IsAddOnLoaded("TinyTip")) then
					LoadAddOn("TinyTip");					
				end
				TTVar.NoShiftCompare = true;
			else
				if (IsAddOnLoaded("TinyTip")) then	
					TTVar.NoShiftCompare = false;
				end				
			end
		end
	);		
end