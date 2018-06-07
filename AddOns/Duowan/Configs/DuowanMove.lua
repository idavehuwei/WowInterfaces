------------------------------------
-- dugu 2009-12-22
if (GetLocale() == "zhCN") then
	DUOWANMOVE_TITLE = "多玩界面";
	DUOWANMOVE_BLIZZMOVE_ENABLE = "允许拖动系统窗口(如: 任务日志)";
	DUOWANMOVE_BLIZZMOVE_ENABLE_TIP = "开启多玩移动后系统窗口将可以拖动";
	DUOWANMOVE_ENABLE = "开启多玩界面移动(变形..出发..)";
	DUOWANMOVE_ENABLE_TIP = "使所有的界面元素都能方便的移动、缩放、变形";
	DUOWANMOVE_OPTION_BEGIN = "开始变形";
	DUOWANMOVE_HIDENONE = "跟随系统隐藏空按钮";
elseif (GetLocale() == "zhTW") then
	DUOWANMOVE_TITLE = "多玩介面";
	DUOWANMOVE_BLIZZMOVE_ENABLE = "允許拖動系統視窗(如: 任務日誌)";
	DUOWANMOVE_BLIZZMOVE_ENABLE_TIP = "開啟多玩移動後系統視窗將可以拖動";
	DUOWANMOVE_ENABLE = "開啟多玩介面移動(變形..出發..)";
	DUOWANMOVE_ENABLE_TIP = "使所有的介面元素都能方便的移動、縮放、變形";
	DUOWANMOVE_OPTION_BEGIN = "開始變形";
	DUOWANMOVE_HIDENONE = "跟隨系統隱藏空按鈕";
else
	DUOWANMOVE_TITLE = "多玩界面";
	DUOWANMOVE_BLIZZMOVE_ENABLE = "允许拖动系统窗口(如: 任务日志)";
	DUOWANMOVE_BLIZZMOVE_ENABLE_TIP = "开启多玩移动后系统窗口将可以拖动";
	DUOWANMOVE_ENABLE = "开启多玩界面移动(变形..出发..)";
	DUOWANMOVE_ENABLE_TIP = "使所有的界面元素都能方便的移动、缩放、变形";
	DUOWANMOVE_OPTION_BEGIN = "开始变形";
	DUOWANMOVE_HIDENONE = "跟随系统隐藏空按钮";
end

if (dwIsConfigurableAddOn("BlizzMove") or dwIsConfigurableAddOn("DuowanMove")) then	
	dwRegisterMod(
		"DuowanMoveMod",
		DUOWANMOVE_TITLE,
		"DuowanMove",
		"",
		"Interface\\ICONS\\Ability_Warrior_VictoryRush",
		nil
	);

	dwRegisterCheckButton(
		"DuowanMoveMod",
		DUOWANMOVE_BLIZZMOVE_ENABLE,
		DUOWANMOVE_BLIZZMOVE_ENABLE_TIP,
		"BlizzMoveEnable",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("BlizzMove")) then
					dwLoadAddOn("BlizzMove");					
				end
				BlizzMove_Toggle(true);
			else
				if (dwIsAddOnLoaded("BlizzMove")) then	
					BlizzMove_Toggle(false);
				end				
			end
		end
	);	
	dwRegisterCheckButton(
		"DuowanMoveMod",
		DUOWANMOVE_ENABLE,
		DUOWANMOVE_ENABLE_TIP,
		"DuowanMoveEnable",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("DuowanMove")) then
					dwLoadAddOn("DuowanMove");					
				end
				DuowanMove_Toggle(true);
			else
				if (dwIsAddOnLoaded("DuowanMove")) then	
					DuowanMove_Toggle(false);
				end				
			end
		end
	);	
	dwRegisterCheckButton(
		"DuowanMoveMod",
		DUOWANMOVE_HIDENONE,
		nil,
		"HideNone",
		1,
		function (arg)
			if arg==1 then
				if (dwIsAddOnLoaded("DuowanMove")) then
					DuowanMove_HideNone(true);
				end
			else
				if (dwIsAddOnLoaded("DuowanMove")) then	
					DuowanMove_HideNone(false);
				end				
			end
		end,
		1
	);	
	dwRegisterButton(
		"DuowanMoveMod",
		DUOWANMOVE_OPTION_BEGIN, 
		function()			
			if (dwIsAddOnLoaded("DuowanMove")) then
				HideUIPanel(DuowanConfigFrame);
				DuowanMove_OpenConfig();
			end
		end, 
		1
	);
end