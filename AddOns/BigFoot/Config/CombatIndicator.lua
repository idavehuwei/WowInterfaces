if (GetLocale() == "zhCN") then	
	MOD_COMBAT_INDICATOR_TITLE = {"战斗指示", "zhandouzhishi"};
	COMBAT_INDICATOR_ENABLE_TEXT = "开启战斗指示器";
	COMBAT_INDICATOR_ENABLE_MOB_SPELL = "显示怪物魔法信息";
	COMBAT_INDICATOR_SHOW_COMBAT_LEAVE = "进入和离开战斗时进行提示";
	COMBAT_INDICATOR_SHOW_COMBO_POINT = "显示盗贼连击点数";

	COMBAT_INDICATOR_ENABLE_DCT = "使用DCT (更多功能)";
	COMBAT_INDICATOR_DCT_SETTINGS = "功能设置...";
elseif (GetLocale() == "zhTW") then
	MOD_COMBAT_INDICATOR_TITLE = {"戰鬥指示器", "zhandouzhishi"};
	COMBAT_INDICATOR_ENABLE_TEXT = "開啟戰鬥指示器";	
	COMBAT_INDICATOR_ENABLE_MOB_SPELL = "顯示怪物魔法訊息";
	COMBAT_INDICATOR_SHOW_COMBAT_LEAVE = "離開戰鬥狀態時進行提示";
	COMBAT_INDICATOR_SHOW_COMBO_POINT = "顯示盜賊連擊點數";

	COMBAT_INDICATOR_ENABLE_DCT = "使用SCT (更多功能)";
	COMBAT_INDICATOR_DCT_SETTINGS = "功能設置...";
else
	MOD_COMBAT_INDICATOR_TITLE = "Combat Indicator";
	COMBAT_INDICATOR_ENABLE_TEXT = "Enable Combat Indicator";

	COMBAT_INDICATOR_ENABLE_MOB_SPELL = "Show mob's spell";
	COMBAT_INDICATOR_SHOW_COMBAT_LEAVE = "Notify me if leaving combat";
	COMBAT_INDICATOR_SHOW_COMBO_POINT = "Show combo points";
	
	COMBAT_INDICATOR_ENABLE_DCT = "USE DCT (...)";
	COMBAT_INDICATOR_DCT_SETTINGS = "Options...";
end

if (IsConfigurableAddOn("CombatIndicator") or IsConfigurableAddOn("dct")) then
	ModManagement_RegisterMod(
		"CombatIndicator",
		"Interface\\Icons\\Ability_Warrior_PunishingBlow",
		MOD_COMBAT_INDICATOR_TITLE,
		"",
		nil,
		nil
	);
end

if (IsConfigurableAddOn("CombatIndicator")) then
	ModManagement_RegisterCheckBox(
		"CombatIndicator",
		COMBAT_INDICATOR_ENABLE_TEXT,
		nil,
		"EnableCombatIndicator",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("CombatIndicator")) then
					BigFoot_LoadAddOn("CombatIndicator");
				end

				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicator_Enable(true);					

					if (BigFoot_GetModVariable("CombatIndicator", "EnableCombatIndicator") ~= 0) then
						BigFoot_SetModVariable("CombatIndicator", "EnableDCT", 0);
						if(DCT_Toggle)then
							DCT_Toggle(false);
						end
					end

					ModManagement_Refresh();								
				end
			else
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicator_Enable(false);
				end
			end
		end
	);

	ModManagement_RegisterCheckBox(
		"CombatIndicator",
		COMBAT_INDICATOR_ENABLE_MOB_SPELL,
		nil,
		"EnableShowSpell",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorShowSpell_Enable(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorShowSpell_Enable(false);
				end
			end
		end
		,
		1
	);

	ModManagement_RegisterCheckBox(
		"CombatIndicator",
		COMBAT_INDICATOR_SHOW_COMBAT_LEAVE,
		nil,
		"EnableCombatLeave",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorLeaveCombat_Enable(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorLeaveCombat_Enable(false);
				end
			end
		end
		,
		1
	);

	ModManagement_RegisterCheckBox(
		"CombatIndicator",
		COMBAT_INDICATOR_SHOW_COMBO_POINT,
		nil,
		"EnableComboPoint",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorShowCombo_Enable(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("CombatIndicator")) then
					CombatIndicatorShowCombo_Enable(false);
				end
			end
		end
		,
		1
	);
end

if (IsConfigurableAddOn("dct") and (GetLocale() == "zhCN" or GetLocale() == "zhTW")) then
	ModManagement_RegisterCheckBox(
		"CombatIndicator",
		COMBAT_INDICATOR_ENABLE_DCT,
		nil,
		"EnableDCT",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("dct")) then
					BigFoot_LoadAddOn("dct");
				end

				if (BigFoot_IsAddOnLoaded("dct")) then
					if(DCT_Toggle)then
						DCT_Toggle(true);

					end
					if (BigFoot_GetModVariable("CombatIndicator", "EnableCombatIndicator") ~= 0) then
						BigFoot_SetModVariable("CombatIndicator", "EnableCombatIndicator", 0);
						CombatIndicator_Enable(false);
					end

					ModManagement_Refresh();
				end
			else
				if (BigFoot_IsAddOnLoaded("dct")) then
					if(DCT_Toggle)then
						DCT_Toggle(false);

					end
				end
			end
		end
	);

	ModManagement_RegisterButton(
		"CombatIndicator",
		COMBAT_INDICATOR_DCT_SETTINGS,
		function()
			if (BigFoot_IsAddOnLoaded("dct") and BigFoot_HasAddon("dct_options")) then
				DCT_showMenu();
				PlaySound("igMainMenuOption");
				HideUIPanel(ModManagementFrame);
			end
		end,
		nil,
		1
	);
end
