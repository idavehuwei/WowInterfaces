------------------------------------
-- dugu 2009-12-21
local DC = DUOWAN_COLOR;
if (GetLocale() == "zhCN") then
	GATHERMATE_TITLE = "采集助手";
	GATHERMATE_ENABLE = "开启采集助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (GatherMate)" .. DUOWAN_COLOR["END"];		
	GATHERMATE_MINIMAP_ENABLE = "在小地图上显示资源点";
	GATHERMATE_TREASURE_ENABLE = "显示宝箱资源点";
	GATHERMATE_SHUANGCAI_ENABLE = "自动切换矿物和草药的追踪";
	
elseif (GetLocale() == "zhTW") then
	GATHERMATE_TITLE = "採集助手";
	GATHERMATE_ENABLE = "開啟採集助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (GatherMate)" .. DUOWAN_COLOR["END"];		
	GATHERMATE_MINIMAP_ENABLE = "在小地圖上顯示資源點";
	GATHERMATE_TREASURE_ENABLE = "顯示寶箱資源點";
	GATHERMATE_SHUANGCAI_ENABLE = "自動切換礦物和草藥的追蹤";
else
	GATHERMATE_TITLE = "采集助手";
	GATHERMATE_ENABLE = "开启采集助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (GatherMate)" .. DUOWAN_COLOR["END"];		
	GATHERMATE_MINIMAP_ENABLE = "在小地图上显示资源点";
	GATHERMATE_TREASURE_ENABLE = "显示宝箱资源点";
	GATHERMATE_SHUANGCAI_ENABLE = "自动切换矿物和草药的追踪";
end

if (dwIsConfigurableAddOn("GatherMate") or dwIsConfigurableAddOn("Love")) then	
	dwRegisterMod(
		"GatherMateModule",
		GATHERMATE_TITLE,
		"GatherMate",
		"",
		"Interface\\ICONS\\INV_Misc_Herb_Dreamingglory",		
		nil
	);
end

if (dwIsConfigurableAddOn("GatherMate") ) then
	dwRegisterCheckButton(
		"GatherMateModule",
		GATHERMATE_ENABLE,
		nil,
		"GatherMateEnable",
		0,
		function (arg)			
			if (arg == 1) then
				dwLoadAddOn("GatherMate");
				GatherMate_Toggle(true);
			else
				if (dwIsAddOnLoaded("GatherMate")) then
					GatherMate_Toggle(nil);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"GatherMateModule",
		GATHERMATE_MINIMAP_ENABLE,
		"",
		"showMinimap",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("GatherMate")) then
					GatherMate_MinimapToggle(true);
				end
			else
				if (dwIsAddOnLoaded("GatherMate")) then
					GatherMate_MinimapToggle(false)
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"GatherMateModule",
		GATHERMATE_TREASURE_ENABLE,
		"",
		"showTreasure",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("GatherMate")) then
					GatherMate_TreasureToggle(true);
				end
			else
				if (dwIsAddOnLoaded("GatherMate")) then
					GatherMate_TreasureToggle(false)
				end
			end
		end,
		1
	);
end

if (dwIsConfigurableAddOn("Love") ) then
	dwRegisterCheckButton(
		"GatherMateModule",
		GATHERMATE_SHUANGCAI_ENABLE,
		nil,
		"EnableShuangCai",
		0,
		function (arg)
			if arg==1 then
				if (not dwIsAddOnLoaded("Love")) then
					dwLoadAddOn("Love");					
				end
				Love_ShuangCai_Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					Love_ShuangCai_Toggle(false);
				end
			end
		end
	);
end