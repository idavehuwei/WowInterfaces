------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	DUOWAN_ACTION_TITLE = "技能冷却";
	DUOWAN_ACTION_REDOUT = "超出技能范围图标显示为红色";	
	TCC_ACTION_ENABLE = "显示动作条上的技能冷却计时";
	TCC_SHINE_OPTION_DESC = "闪光类型:";
	TCC_SHINE_OPTIONS = {"图标", "小闪光", "雷达", "大闪光"};
	TCC_CENTER_ICON = "显示中心冷却图标提示";
	TCC_CENTER_ICON_TEXT = "显示名称";
	TCC_CENTER_IOCN_POS = "调整位置";
	TCC_BARS_EANBLE = "显示冷却计时条";
	TCC_BARS_UNLOCK = "解锁计时条";
	TCC_COOL_LINE_ENABLE = "显示线性冷却计时条";
	TCC_COOL_LINE_LOCK = "锁定线性冷却位置";
elseif (GetLocale() == "zhTW") then
	DUOWAN_ACTION_TITLE = "技能冷卻";
	DUOWAN_ACTION_REDOUT = "超出技能範圍圖示顯示為紅色";	
	TCC_ACTION_ENABLE = "顯示動作條上的技能冷卻計時";
	TCC_SHINE_OPTION_DESC = "閃光類型:";
	TCC_SHINE_OPTIONS = {"圖示", "小閃光", "雷達", "大閃光"};
	TCC_CENTER_ICON = "顯示中心冷卻圖示提示";
	TCC_CENTER_ICON_TEXT = "顯示名稱";
	TCC_CENTER_IOCN_POS = "調整位置";
	TCC_BARS_EANBLE = "顯示冷卻計時條";
	TCC_BARS_UNLOCK = "解鎖計時條";
	TCC_COOL_LINE_ENABLE = "顯示線性冷卻計時條";
	TCC_COOL_LINE_LOCK = "鎖定線性冷卻位置";
else
	DUOWAN_ACTION_TITLE = "技能冷却";
	DUOWAN_ACTION_REDOUT = "超出技能范围图标显示为红色";	
	TCC_ACTION_ENABLE = "显示动作条上的技能冷却计时";
	TCC_SHINE_OPTION_DESC = "闪光类型:";
	TCC_SHINE_OPTIONS = {"图标", "小闪光", "雷达", "大闪光"};
	TCC_CENTER_ICON = "显示中心冷却图标提示";	
	TCC_CENTER_ICON_TEXT = "显示名称";
	TCC_CENTER_IOCN_POS = "调整位置";
	TCC_BARS_EANBLE = "显示冷却计时条";
	TCC_BARS_UNLOCK = "解锁计时条";
	TCC_COOL_LINE_ENABLE = "显示线性冷却计时条";
	TCC_COOL_LINE_LOCK = "锁定线性冷却位置";
end

if (dwIsConfigurableAddOn("tdCooldown2")) then
	dwRegisterMod(
		"Action Button",
		DUOWAN_ACTION_TITLE,
		"ActionButton",
		"",
		"Interface\\Icons\\INV_Qiraj_JewelGlyphed",		
		nil
	);
end

if (dwIsConfigurableAddOn("tdCooldown2")) then
	dwRegisterCheckButton(
		"Action Button",
		DUOWAN_ACTION_REDOUT,
		"",
		"RedOut",
		1,
		function (arg)			
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");		
				
				tdCooldown2:SetCurVal("redout", nil, true);
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					tdCooldown2:SetCurVal("redout", nil, false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"Action Button",
		TCC_ACTION_ENABLE,
		"",
		"EnableTCCCD",
		1,
		function (arg)		
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");

				tdCooldown2:SetCurVal("ACTION", "config", true);
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					tdCooldown2:SetCurVal("ACTION", "config", false);
				end
			end
		end
	);

	dwRegisterSpinBox(
		"Action Button",
		TCC_SHINE_OPTION_DESC,
		nil, 
		"AnchorPoint", 
		TCC_SHINE_OPTIONS, 
		TCC_SHINE_OPTIONS[1], 
		function(arg)			
			tdCooldown2:SetShineType(arg);
		end,
		1
	);
	
	dwRegisterCheckButton(
		"Action Button",
		TCC_COOL_LINE_ENABLE,
		"",
		"EnableCoolLine",
		1,
		function (arg)		
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");
				
				CoolLine_Toggle(true);
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					CoolLine_Toggle(false);
				end
			end
		end		
	);

	dwRegisterCheckButton(
		"Action Button",
		TCC_COOL_LINE_LOCK,
		"",
		"LockCoolLine",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("tdCooldown2")) then
					CoolLine_ToggleLock(true);
				end
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					CoolLine_ToggleLock(false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"Action Button",
		TCC_CENTER_ICON,
		"",
		"CenterIcon",
		0,
		function (arg)		
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");
				--tdCooldown2:SetCurVal("bar", "config", true);
				tdCooldown2:SetCurVal("center", "config", true);				
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then		
					tdCooldown2:SetCurVal("center", "config", false);
				end
			end
		end		
	);

	dwRegisterCheckButton(
		"Action Button",
		TCC_CENTER_ICON_TEXT,
		"",
		"CenterIconName",
		1,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("tdCooldown2")) then					
					tdCooldown2:SetCurVal("center", "text", true);
				end
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					tdCooldown2:SetCurVal("center", "text", false);
				end
			end
		end,
		1
	);
	dwRegisterButton(
		"Action Button",
		TCC_CENTER_IOCN_POS, 
		function()			
			if (dwIsAddOnLoaded("tdCooldown2")) then
				tdCooldown2:ShowCenterPos();
			end
		end, 
		1
	);
	
	--[[
	dwRegisterCheckButton(
		"Action Button",
		TCC_BARS_EANBLE,
		"",
		"EnableTCCBar",
		0,
		function (arg)		
			if (arg == 1) then
				dwLoadAddOn("tdCooldown2");

				tdCooldown2:ToggleBar(true);
			else
				if (dwIsAddOnLoaded("tdCooldown2")) then
					tdCooldown2:ToggleBar(false);
				end
			end
		end
	);

	dwRegisterButton(
		"Action Button",
		TCC_BARS_UNLOCK, 
		function()			
			if (dwIsAddOnLoaded("tdCooldown2")) then
				tdCooldown2:SetCurVal("bar", "locked", false);
				tdCooldown2:UpdateBars();
			end
		end, 
		1
	);
	]]
end

