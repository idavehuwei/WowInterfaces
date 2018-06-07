------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	RANDDISPLAY_TITLE = "距离显示";
	RANDDISPLAY_ENABLED = "开启距离指示器";
	RANDDISPLAY_ENABLE1 = "锁定位置";
	RANDDISPLAY_ENABLE2 = "更多设置";
	RANDDISPLAY_OPTION1 = "启用目标距离";	
	RANDDISPLAY_OPTION2 = "启用焦点距离";
	RANDDISPLAY_OPTION3 = "启用宠物距离";

elseif (GetLocale() == "zhTW") then
	RANDDISPLAY_TITLE = "距離顯示";
	RANDDISPLAY_ENABLED = "開啟距離指示器";
	RANDDISPLAY_ENABLE1 = "鎖定位置";
	RANDDISPLAY_ENABLE2 = "更多設置";
	RANDDISPLAY_OPTION1 = "啟用目標距離";	
	RANDDISPLAY_OPTION2 = "啟用焦點距離";
	RANDDISPLAY_OPTION3 = "啟用寵物距離";
else
	RANDDISPLAY_TITLE = "距离显示";
	RANDDISPLAY_ENABLED = "开启距离指示器";
	RANDDISPLAY_ENABLE1 = "锁定位置";
	RANDDISPLAY_ENABLE2 = "更多设置";
	RANDDISPLAY_OPTION1 = "启用目标距离";	
	RANDDISPLAY_OPTION2 = "启用焦点距离";
	RANDDISPLAY_OPTION3 = "启用宠物距离";

end
if (dwIsConfigurableAddOn("RangeDisplay")) then	
	dwRegisterMod(
		"RangeDisplayHistry",
		RANDDISPLAY_TITLE,
		"RangeDisplay",
		"",
		"Interface\\ICONS\\INV_Gizmo_NewGoggles",
		nil
	);
	dwRegisterCheckButton(
		"RangeDisplayHistry",
		RANDDISPLAY_ENABLED,
		nil,
		"RANDDISPLAY_ENABLED",
		1,
		function (arg)
			if(arg==1)then				
				if (not dwIsAddOnLoaded("RangeDisplay")) then
					dwLoadAddOn("RangeDisplay");					
				end
				SetRangeDisplayUnits("TARGET",true);
			else
				if (dwIsAddOnLoaded("RangeDisplay")) then
					SetRangeDisplayUnits("TARGET",false);
				end				
			end
		end
	);

	dwRegisterCheckButton(
		"RangeDisplayHistry",
		RANDDISPLAY_ENABLE1,
		"",
		"LockPosition",
		1,
		function (arg)		
			if arg==1 then
				if (dwIsAddOnLoaded("RangeDisplay")) then
					RangeDisplayLocked(true);	
				end
			else
				if (dwIsAddOnLoaded("RangeDisplay")) then					
					RangeDisplayLocked(false);
				end
			end
		end,
		1
	);	
end