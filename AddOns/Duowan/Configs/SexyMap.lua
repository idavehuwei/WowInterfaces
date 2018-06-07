------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";
	CARTOGRAPHER_ENABLE = "开启地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
	NPCSCAN_ENABLE_TITLE = "开启稀有精英探测";
	NPCSCAN_ENABLE_DESC = "在地图上描绘稀有精英可能出现的位置";
	NPCSCAN_MINIMAP_ENABLE_TITLE = "显示小地图稀有精英路径";
	NPCSCAN_OPTION = "更多选项";
elseif (GetLocale() == "zhTW") then
	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强"  .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";	
	CARTOGRAPHER_ENABLE = "開啟地圖增強" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "開啟副本地圖和BOSS掉落查詢";
	NPCSCAN_ENABLE_TITLE = "開啟稀有精英探測";
	NPCSCAN_ENABLE_DESC = "在地圖上描繪稀有精英可能出現的位置";
	NPCSCAN_MINIMAP_ENABLE_TITLE = "顯示小地圖稀有精英路徑";
	NPCSCAN_OPTION = "更多選項";
else
	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";
	CARTOGRAPHER_ENABLE = "开启地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
	NPCSCAN_ENABLE_TITLE = "开启稀有精英探测";
	NPCSCAN_ENABLE_DESC = "在地图上描绘稀有精英可能出现的位置";
	NPCSCAN_MINIMAP_ENABLE_TITLE = "显示小地图稀有精英路径";
	NPCSCAN_OPTION = "更多选项";
end

if (dwIsConfigurableAddOn("SexyMap") or dwIsConfigurableAddOn("Mapster") or dwIsConfigurableAddOn("InstanceMaps") or dwIsConfigurableAddOn("_NPCScan"))then	
	dwRegisterMod(
		"MiniMapMod",
		SEXYMAP_TITLE,
		"SEXYMAP",
		"",
		"Interface\\ICONS\\Spell_Arcane_TeleportExodar",
		nil
	);
end

if (dwIsConfigurableAddOn("SexyMap")) then
	dwRegisterCheckButton(
		"MiniMapMod",
		SEXYMAP_OPTION1,
		DUOWAN_RELOAD_DESC,
		"SEXYMAP_OPTION1",
		1,
		function (arg)	
			if(arg==1)then
				if (not dwIsAddOnLoaded("SexyMap")) then
					dwLoadAddOn("SexyMap");
				end				
			else
				if (dwIsAddOnLoaded("SexyMap")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	dwRegisterButton(
		"MiniMapMod",
		SEXYMAP_OPT, 
		function()
			if (dwIsAddOnLoaded("SexyMap")) then
				--HideUIPanel(DuowanConfigFrame);
				SexyMapOpenConfig();
			end
		end, 
		1
	);	
end

if (dwIsConfigurableAddOn("Mapster")) then
	dwRegisterCheckButton(
		"MiniMapMod",
		CARTOGRAPHER_ENABLE,
		DUOWAN_RELOAD_DESC,
		"MapsterEnable",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Mapster")) then
					dwLoadAddOn("Mapster");
				end
			
			else
				if (dwIsAddOnLoaded("Mapster")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
end

if (dwIsConfigurableAddOn("InstanceMaps")) then
	dwRegisterCheckButton(
		"MiniMapMod",
		CARTOGRAPHER_INSTANCEMAPS_ENABLE,
		DUOWAN_RELOAD_DESC,
		"InstanceMap",
		1,
		function (arg)		
			if (arg == 1) then
				if (not dwIsAddOnLoaded("InstanceMaps")) then
					dwLoadAddOn("InstanceMaps");
				end
				if (not dwIsAddOnLoaded("YssBossLoot")) then
					dwLoadAddOn("YssBossLoot");
				end
			else
				if (dwIsAddOnLoaded("InstanceMaps")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
end

if (dwIsConfigurableAddOn("_NPCScan")) then
	dwRegisterCheckButton(
		"MiniMapMod",
		NPCSCAN_ENABLE_TITLE,
		NPCSCAN_ENABLE_DESC,
		"NPCScanEnable",
		1,
		function (arg)		
			if (arg == 1) then
				if (not dwIsAddOnLoaded("_NPCScan")) then
					dwLoadAddOn("_NPCScan");
				end
				
				_NPCScan:Toggle(true);				
			else
				if (dwIsAddOnLoaded("_NPCScan")) then
					_NPCScan:Toggle(false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"MiniMapMod",
		NPCSCAN_MINIMAP_ENABLE_TITLE,
		nil,
		"NPCScanMinimap",
		0,
		function (arg)		
			if (arg == 1) then
				if (dwIsAddOnLoaded("_NPCScan")) then
					_NPCScan:Minimap_Toggle(true);
				end						
			else
				if (dwIsAddOnLoaded("_NPCScan")) then
					_NPCScan:Minimap_Toggle(false);
				end
			end
		end,
		1
	);

	dwRegisterButton(
		"MiniMapMod",
		NPCSCAN_OPTION, 
		function()
			if (dwIsAddOnLoaded("_NPCScan")) then
				_NPCScan:OpenConfig();
			end
		end, 
		1
	);
end