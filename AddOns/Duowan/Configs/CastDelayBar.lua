------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	CASTDELAYBAR_TITLE = "施法延迟条";
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法是否完成";
elseif (GetLocale() == "zhTW") then
	CASTDELAYBAR_TITLE = "施法延遲條";
	CASTDELAYBAR_ENABLE = "顯示施法延遲條";
	CASTDELAYBAR_ENABLE_TIP = "施法延遲條可以有效的輔助判斷施法是否完成";
else
	CASTDELAYBAR_TITLE = "施法延迟条";
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法完成";
end


if (dwIsConfigurableAddOn("CastDelayBar")) then	
	dwRegisterMod(
		"CastDelayBar",
		CASTDELAYBAR_TITLE,
		"CastDelayBar",
		"",
		"Interface\\ICONS\\Ability_Hunter_Pathfinding",
		nil
	);

	dwRegisterCheckButton(
		"CastDelayBar",
		CASTDELAYBAR_ENABLE,
		CASTDELAYBAR_ENABLE_TIP,
		"CastDelayBarEnable",
		1,
		function (arg)		
			if arg==1 then
				if (not IsAddOnLoaded("CastDelayBar")) then
					LoadAddOn("CastDelayBar");
				end
				CastDelayBar:Toggle(true);
			else
				if (IsAddOnLoaded("CastDelayBar")) then	
					CastDelayBar:Toggle(false);
				end
			end
		end
	);	
end