------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	TRINKET_TITLE = "饰品管理";	
	TRINKET_ENABLE = "开启饰品管理";
	TRINKET_AUTOWHIP_ENABLE = "开启马鞭自动切换";
	TRINKET_AUTOWHIP_OUTBG = "在战场中禁止切换";
	TRINKET_SIMPLE_TOOLTIP_ENABLE = "使用简略鼠标提示信息";
	TRINKET_SET_MENUKEY = "菜单组合键: ";
	TRINKET_MENUKEY_SETS = {NONE, ALT_KEY, CTRL_KEY, SHIFT_KEY};
	TRINKET_LOCK_POSITION = "锁定框体位置";
	TRINKET_OPEN_BINDING = "按键绑定";
elseif (GetLocale() == "zhTW") then
	TRINKET_TITLE = "飾品管理";	
	TRINKET_ENABLE = "開啟飾品管理";
	TRINKET_AUTOWHIP_ENABLE = "開啟馬鞭自動切換";
	TRINKET_AUTOWHIP_OUTBG = "在戰場中禁止切換";
	TRINKET_SIMPLE_TOOLTIP_ENABLE = "使用簡略滑鼠提示資訊";
	TRINKET_SET_MENUKEY = "菜單組合鍵: ";
	TRINKET_MENUKEY_SETS = {NONE, ALT_KEY, CTRL_KEY, SHIFT_KEY};
	TRINKET_LOCK_POSITION = "鎖定框體位置";
	TRINKET_OPEN_BINDING = "按鍵綁定";
else
	TRINKET_TITLE = "饰品管理";	
	TRINKET_ENABLE = "开启饰品管理";
	TRINKET_AUTOWHIP_ENABLE = "开启马鞭自动切换";
	TRINKET_AUTOWHIP_OUTBG = "在战场中禁止切换";
	TRINKET_SIMPLE_TOOLTIP_ENABLE = "使用简略鼠标提示信息";
	TRINKET_SET_MENUKEY = "菜单组合键: ";
	TRINKET_MENUKEY_SETS = {NONE, ALT_KEY, CTRL_KEY, SHIFT_KEY};
	TRINKET_LOCK_POSITION = "锁定框体位置";
	TRINKET_OPEN_BINDING = "按键绑定";
end

if (dwIsConfigurableAddOn("EasyTrinket")) then
	dwRegisterMod(
		"TRINKETHISTRY",
		TRINKET_TITLE,
		"TRINKET",
		"",
		"Interface\\ICONS\\INV_Jewelry_Necklace_15",
		nil
	);
	dwRegisterCheckButton(
		"TRINKETHISTRY",
		TRINKET_ENABLE,
		nil,
		"TRINKET_OPTION1",
		1,
		function (arg)	
			if (arg == 1) then
				if (not dwIsAddOnLoaded("EasyTrinket")) then
					dwLoadAddOn("EasyTrinket");
				end
				EasyTrinket_Toggle(true);
			else
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_Toggle(false);				
				end
			end
		end
	);

	dwRegisterCheckButton(
		"TRINKETHISTRY",
		TRINKET_AUTOWHIP_ENABLE,
		nil,
		"AutoWhip",
		1,
		function (arg)	
			if (arg == 1) then
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_AutoWhip_Toggle(true);
				end				
			else
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_AutoWhip_Toggle(false);	
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"TRINKETHISTRY",
		TRINKET_AUTOWHIP_OUTBG,
		nil,
		"outBG",
		1,
		function (arg)	
			if (arg == 1) then
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_AutoWhip_OutBG(true);
				end				
			else
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_AutoWhip_OutBG(false);	
				end
			end
		end,
		2
	);

	dwRegisterCheckButton(
		"TRINKETHISTRY",
		TRINKET_LOCK_POSITION,
		nil,
		"LockPosition",
		0,
		function (arg)	
			if (arg == 1) then
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_LockPosition_Toggle(true);
				end				
			else
				if (dwIsAddOnLoaded("EasyTrinket")) then
					EasyTrinket_LockPosition_Toggle(false);	
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"TRINKETHISTRY",
		TRINKET_SET_MENUKEY,
		nil, 
		"menuKey", 
		TRINKET_MENUKEY_SETS, 
		TRINKET_MENUKEY_SETS[1], 
		function(arg)			
			EasyTrinket_SetMenuKey(arg);
		end,
		1
	);

	dwRegisterButton(
		"TRINKETHISTRY",
		TRINKET_OPEN_BINDING, 
		function()			
			if (dwIsAddOnLoaded("EasyTrinket")) then
				HideUIPanel(DuowanConfigFrame);
				EasyTrinket_OpenBinding();
			end
		end, 
		1
	);
end