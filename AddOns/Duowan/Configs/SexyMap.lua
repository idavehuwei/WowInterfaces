------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then

	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";
	CARTOGRAPHER_ENABLE = "开启地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
elseif (GetLocale() == "zhTW") then
	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强"  .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";	
	CARTOGRAPHER_ENABLE = "開啟地圖增強" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "開啟副本地圖和BOSS掉落查詢";
else
	SEXYMAP_TITLE = "地图增强";
	SEXYMAP_OPT = "打开配置"
	SEXYMAP_OPTION1 = "开启小地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (SexyMap)" .. DUOWAN_COLOR["END"];
	SEXYMAP_BUTTON1 = "开启助手界面";
	CARTOGRAPHER_ENABLE = "开启地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (Mapster)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
end

if (dwIsConfigurableAddOn("SexyMap") or dwIsConfigurableAddOn("Mapster") or dwIsConfigurableAddOn("InstanceMaps"))then	
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
			else
				if (dwIsAddOnLoaded("InstanceMaps")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
end