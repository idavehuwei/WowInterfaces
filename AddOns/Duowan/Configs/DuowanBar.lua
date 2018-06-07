------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	DUOWANBAR_TITLE = "多玩动作条";
	DUOWANBAR_ENABLE = "开启多玩动作条";
	DUOWANBAR_ENABLE_TIP = "多玩动作条不同于别的动作条\n不会与系统动作条产生键位冲突";
	DUOWANBAR_ALWAYSSHOW = "隐藏空按键";
	DUOWANBAR_HIDE_TAB = "隐藏标题头";
	DUOWAN_BUTTON_FACADE_ENABLE = "开启动作条皮肤美化";
	DUOWAN_BUTTON_FACADE_GLOSS_ENABLE = "开启高亮效果";
	DUOWAN_BUTTON_FACADE_SKINS = {"可爱圆", "典雅方", "高雅黑", "炫酷铜", "清新方", "凯蒂猫"};
	DUOWAN_BUTTON_FACADE_APPLYSKIN = "选择皮肤";
elseif (GetLocale() == "zhTW") then
	DUOWANBAR_TITLE = "多玩動作條";
	DUOWANBAR_ENABLE = "開啟多玩動作條";
	DUOWANBAR_ENABLE_TIP = "多玩動作條不同於別的動作條\n不會與系統動作條產生鍵位衝突";
	DUOWANBAR_ALWAYSSHOW = "隱藏空按鍵";
	DUOWANBAR_HIDE_TAB = "隱藏標題頭";
	DUOWAN_BUTTON_FACADE_ENABLE = "開啟動作條皮膚美化";
	DUOWAN_BUTTON_FACADE_GLOSS_ENABLE = "開啟高亮效果";
	DUOWAN_BUTTON_FACADE_SKINS = {"可愛圓", "典雅方", "高雅黑", "炫酷銅", "清新方", "凱蒂貓"};
	DUOWAN_BUTTON_FACADE_APPLYSKIN = "選擇皮膚";
else
	DUOWANBAR_TITLE = "多玩动作条";
	DUOWANBAR_ENABLE = "开启多玩动作条";
	DUOWANBAR_ENABLE_TIP = "多玩动作条不同于别的动作条\n不会与系统动作条产生键位冲突";
	DUOWANBAR_ALWAYSSHOW = "隐藏空按键";
	DUOWANBAR_HIDE_TAB = "隐藏标题头";
	DUOWAN_BUTTON_FACADE_ENABLE = "开启动作条皮肤美化";
	DUOWAN_BUTTON_FACADE_GLOSS_ENABLE = "开启高亮效果";
	DUOWAN_BUTTON_FACADE_SKINS = {"可爱圆", "典雅方", "高雅黑", "炫酷铜", "清新方", "凯蒂猫"};
	DUOWAN_BUTTON_FACADE_APPLYSKIN = "选择皮肤";
end

if (dwIsConfigurableAddOn("DuowanBar") or dwIsConfigurableAddOn("Love")) then	
	dwRegisterMod(
		"DuowanBar",
		DUOWANBAR_TITLE,
		"DuowanBar",
		"",
		"Interface\\ICONS\\Ability_Druid_EmpoweredRejuvination",
		nil
	);
end

if (dwIsConfigurableAddOn("DuowanBar")) then
	dwRegisterCheckButton(
		"DuowanBar",
		DUOWANBAR_ENABLE,
		DUOWANBAR_ENABLE_TIP,
		"DuowanBarEnable",
		0,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("DuowanBar")) then
					dwLoadAddOn("DuowanBar");					
				end
				DuowanBar_Toggle(true);
			else
				if (dwIsAddOnLoaded("DuowanBar")) then	
					DuowanBar_Toggle(false);
				end				
			end
		end
	);
	
	dwRegisterCheckButton(
		"DuowanBar",
		DUOWANBAR_HIDE_TAB,
		nil,
		"DuowanBarHideTab",
		0,
		function (arg)
			if arg==1 then
				if (dwIsAddOnLoaded("DuowanBar")) then	
					DuowanBarTab_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("DuowanBar")) then	
					DuowanBarTab_Toggle(false);
				end				
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"DuowanBar",
		DUOWANBAR_ALWAYSSHOW,
		nil,
		"DuowanBarAlwaysShow",
		0,
		function (arg)
			if arg==1 then
				if (dwIsAddOnLoaded("DuowanBar")) then	
					DuowanBarAlwaysShow(false);
				end
			else
				if (dwIsAddOnLoaded("DuowanBar")) then	
					DuowanBarAlwaysShow(true);
				end				
			end
		end,
		1
	);	
end

if (dwIsConfigurableAddOn("Love")) then
	dwRegisterCheckButton(
		"DuowanBar",
		DUOWAN_BUTTON_FACADE_ENABLE,
		nil,
		"DuowanBarSkin",
		0,
		function (arg)		
			if arg==1 then
				if (dwIsAddOnLoaded("Love")) then	
					dwButtonFacade_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("Love")) then	
					dwButtonFacade_Toggle(false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"DuowanBar",
		DUOWAN_BUTTON_FACADE_GLOSS_ENABLE,
		nil,
		"Gloss",
		1,
		function (arg)		
			if arg==1 then
				if (dwIsAddOnLoaded("Love")) then	
					dwButtonFacadeToggleGloss(true);
				end
			else
				if (dwIsAddOnLoaded("Love")) then	
					dwButtonFacadeToggleGloss(false);
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"DuowanBar",
		DUOWAN_BUTTON_FACADE_APPLYSKIN,
		nil, 
		"curSkin", 
		DUOWAN_BUTTON_FACADE_SKINS, 
		DUOWAN_BUTTON_FACADE_SKINS[1], 
		function(arg)			
			dwButtonFacadeSetSkin(arg);
		end,
		1
	);
end