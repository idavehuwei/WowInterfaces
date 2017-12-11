------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	ARENA_MOD_TITLE = "竞技大师";
	ARENA_MOD_GLADIUS_ENABLE = "开启竞技场助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (Gladius)" .. DUOWAN_COLOR["END"];
	ARENA_MOD_GLADIUS_OPTION ="打开配置";	
elseif (GetLocale() == "zhTW") then
	ARENA_MOD_TITLE = "競技大師";
	ARENA_MOD_GLADIUS_ENABLE = "開啟競技場助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (Gladius)" .. DUOWAN_COLOR["END"];
	ARENA_MOD_GLADIUS_OPTION ="打開配置";	
else
	ARENA_MOD_TITLE = "竞技大师";
	ARENA_MOD_GLADIUS_ENABLE = "开启竞技场助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (Gladius)" .. DUOWAN_COLOR["END"];
	ARENA_MOD_GLADIUS_OPTION ="打开配置";	
end

if (dwIsConfigurableAddOn("Gladius")) then
	dwRegisterMod(
		"ArenaMod",
		ARENA_MOD_TITLE,
		"ArenaMod",
		"",
		"Interface\\ICONS\\Ability_Hunter_Displacement",
		nil
	);

	dwRegisterCheckButton(
		"ArenaMod",
		ARENA_MOD_GLADIUS_ENABLE,
		nil,
		"GladiusEnable",
		1,
		function (arg)
			if(arg==1)then
				if(not dwIsAddOnLoaded("Gladius"))then
					dwLoadAddOn("Gladius");
				end
				Gladius:Toggle(true);
			else
				if(dwIsAddOnLoaded("Gladius"))then
					Gladius:Toggle(false);
				end
			end
		end
	);
		
	dwRegisterButton(
		"ArenaMod",
		ARENA_MOD_GLADIUS_OPTION, 
		function()
			if (dwIsAddOnLoaded("Gladius")) then				
				Gladius:ShowOptions();
			end
		end, 
		1
	);
end
