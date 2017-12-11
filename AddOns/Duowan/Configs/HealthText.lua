------------------------------------
-- dugu@bigfoot 2010-6-1

if (GetLocale() == "zhCN") then
	HEALTH_MOD_TITLE = "简易状态";
	HEALTH_MOD_ENABLE_TEXT = "屏幕中心显示玩家和目标的状态";	
elseif (GetLocale() == "zhTW") then
	HEALTH_MOD_TITLE = "簡易狀態";
	HEALTH_MOD_ENABLE_TEXT = "螢幕中心顯示玩家和目標的狀態";	
else
	HEALTH_MOD_TITLE = "简易状态";
	HEALTH_MOD_ENABLE_TEXT = "屏幕中心显示玩家和目标的状态";	
end

if (dwIsConfigurableAddOn("BlinkHealthText")) then
	dwRegisterMod(
		"HEALTHTEXT",
		HEALTH_MOD_TITLE,
		"BlinkHealthText",
		"",
		"Interface\\ICONS\\Spell_Nature_GiftoftheWild",
		nil
	);
	dwRegisterCheckButton(
		"HEALTHTEXT",
		HEALTH_MOD_ENABLE_TEXT,
		nil,
		"EnableHealthText",
		0,
		function (arg)	
			if (arg == 1) then
				if (not dwIsAddOnLoaded("BlinkHealthText")) then
					dwLoadAddOn("BlinkHealthText");
				end
				BHT_Toggle(true);
			else
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BHT_Toggle(false);
				end
			end
		end
	);
end