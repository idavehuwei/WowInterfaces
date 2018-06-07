------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	LOOT_TITLE = "自动拾取";
	LOOT_OPT = "鼠标位置打开拾取窗口"
	LOOT_OPTION1 = "开启自动拾取" ;
elseif (GetLocale() == "zhTW") then
	LOOT_TITLE = "自動拾取";
	LOOT_OPT = "滑鼠位置打開拾取窗口"
	LOOT_OPTION1 = "開啟自動拾取" ;
else
	LOOT_TITLE = "自动拾取";
	LOOT_OPT = "鼠标位置打开拾取窗口"
	LOOT_OPTION1 = "开启自动拾取" ;
end
if dwIsConfigurableAddOn("Duowan") then

	
	dwRegisterMod(
		"LOOTHist",
		LOOT_TITLE,
		"LOOT_TITLE",
		"",
		"Interface\\ICONS\\Spell_Arcane_ManaTap",
		nil
	);

	dwRegisterCheckButton(
		"LOOTHist",
		LOOT_OPT,
		nil,
		"LOOT_OPT",
		1,
		function (arg)	
			if(arg==1)then
				SetCVar("lootUnderMouse","1");
			else
				SetCVar("lootUnderMouse","0");
			end
		end
	);
	dwRegisterCheckButton(
		"LOOTHist",
		LOOT_OPTION1,
		nil,
		"LOOT_OPTION1",
		1,
		function (arg)	
			if(arg==1)then
				SetCVar("autoLootDefault","1");
			else
				SetCVar("autoLootDefault","0");
			end
		end
	);
end