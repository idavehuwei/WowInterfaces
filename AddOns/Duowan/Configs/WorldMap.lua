------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	CARTOGRAPHER_TITLE = "增强地图";
	CARTOGRAPHER_ENABLE = "开启地图增强" .. DUOWAN_COLOR["STEELBLUE"] .. " (Cartographer)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_FOGLIGHT = "开启显示地图尚未探索地区";
	CARTOGRAPHER_GUILDPOSITIONS = "开启可在地图上看到工会成员";
	CARTOGRAPHER_GUILDPOSITIONS_TIP = "此模块允许你看到公会其他成员的位置, 同时也可以让他们看见你";	
	CARTOGRAPHER_ZONEINFO = "开启地图区域信息";
	CARTOGRAPHER_ZONEINFO_TIP = "显示鼠标所指的地图区域信息"
	CARTOGRAPHER_NOTES = "开启地图注释功能";
	CARTOGRAPHER_NOTES_TIP = "让你可以在地图上做注释Ctrl+鼠标右键添加注释";
	CARTOGRAPHER_BATTLEGROUNDS = "开启战场地图模块";
	CARTOGRAPHER_POI = "开启信息点显示";
	CARTOGRAPHER_GROUPCOLORS = "开启队友着色";
	CARTOGRAPHER_LOOKNFEEL = "开启外观设置";
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
elseif (GetLocale() == "zhTW") then
	CARTOGRAPHER_TITLE = "增強地圖";
	CARTOGRAPHER_ENABLE = "開啟地圖增強" .. DUOWAN_COLOR["STEELBLUE"] .. " (Cartographer)" .. DUOWAN_COLOR["END"];
	CARTOGRAPHER_FOGLIGHT = "開啟顯示地圖尚未探索地區";
	CARTOGRAPHER_GUILDPOSITIONS = "開啟可在地圖上看到工會成員";
	CARTOGRAPHER_GUILDPOSITIONS_TIP = "此模組允許你看到公會其他成員的位置, 同時也可以讓他們看見你";	
	CARTOGRAPHER_ZONEINFO = "開啟地圖區域資訊";
	CARTOGRAPHER_ZONEINFO_TIP = "顯示滑鼠所指的地圖區域資訊"
	CARTOGRAPHER_NOTES = "開啟地圖注釋功能";
	CARTOGRAPHER_NOTES_TIP = "讓你可以在地圖上做注釋Ctrl+滑鼠右鍵添加注釋";
	CARTOGRAPHER_BATTLEGROUNDS = "開啟戰場地圖模組";
	CARTOGRAPHER_POI = "開啟資訊點顯示";
	CARTOGRAPHER_GROUPCOLORS = "開啟隊友著色";
	CARTOGRAPHER_LOOKNFEEL = "開啟外觀設置";
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "開啟副本地圖和BOSS掉落查詢";
else
	CARTOGRAPHER_TITLE = "增强地图";
	CARTOGRAPHER_ENABLE = "开启地图增强";
	CARTOGRAPHER_FOGLIGHT = "开启显示地图尚未探索地区";
	CARTOGRAPHER_GUILDPOSITIONS = "开启可在地图上看到工会成员";
	CARTOGRAPHER_GUILDPOSITIONS_TIP = "此模块允许你看到公会其他成员的位置, 同时也可以让他们看见你";	
	CARTOGRAPHER_ZONEINFO = "开启地图区域信息";
	CARTOGRAPHER_ZONEINFO_TIP = "显示鼠标所指的地图区域信息"
	CARTOGRAPHER_NOTES = "开启地图注释功能";
	CARTOGRAPHER_NOTES_TIP = "让你可以在地图上做注释Ctrl+鼠标右键添加注释";
	CARTOGRAPHER_BATTLEGROUNDS = "开启战场地图模块";
	CARTOGRAPHER_POI = "开启信息点显示";
	CARTOGRAPHER_GROUPCOLORS = "开启队友着色";
	CARTOGRAPHER_LOOKNFEEL = "开启外观设置";
	CARTOGRAPHER_INSTANCEMAPS_ENABLE = "开启副本地图和BOSS掉落查询";
end

--WORLDMAPInfoUI
if dwIsConfigurableAddOn("Cartographer") or dwIsConfigurableAddOn("InstanceMaps") then	
	dwRegisterMod(
		"WorldMapMod",
		CARTOGRAPHER_TITLE,
		"WORLDMAP",
		"",
		"Interface\\ICONS\\Spell_Frost_WindWalkOn",
		nil
	);
end 

if (dwIsConfigurableAddOn("Cartographer")) then
	dwRegisterCheckButton(
		"WorldMapMod",
		CARTOGRAPHER_ENABLE,
		DUOWAN_RELOAD_DESC,
		"CartographerEnable",
		1,
		function (arg)	
			if (arg == 1) then
				if (not dwIsAddOnLoaded("Cartographer")) then
					dwLoadAddOn("Cartographer");
				end
			
			else
				if (dwIsAddOnLoaded("Cartographer")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);

	if (dwIsConfigurableAddOn("Cartographer_Foglight")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_FOGLIGHT,
			nil,
			"CartographerGoglight",
			1,
			function (arg)	
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_Foglight")) then
						dwLoadAddOn("Cartographer_Foglight");
					end
					Cartographer:ToggleModuleActive(Cartographer_Foglight, true);
				else
					if (dwIsAddOnLoaded("Cartographer_Foglight")) then
						Cartographer:ToggleModuleActive(Cartographer_Foglight, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_GuildPositions")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_GUILDPOSITIONS,
			CARTOGRAPHER_GUILDPOSITIONS_TIP,
			"CartographerGuildPositions",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_GuildPositions")) then
						dwLoadAddOn("Cartographer_GuildPositions");
					end
					Cartographer:ToggleModuleActive(Cartographer_GuildPositions, true);
				else
					if (dwIsAddOnLoaded("Cartographer_GuildPositions")) then
						Cartographer:ToggleModuleActive(Cartographer_GuildPositions, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_ZoneInfo")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_ZONEINFO,
			CARTOGRAPHER_ZONEINFO_TIP,
			"CartographerZoneInfo",
			1,
			function (arg)		
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_ZoneInfo")) then
						dwLoadAddOn("Cartographer_ZoneInfo");
					end
					Cartographer:ToggleModuleActive(Cartographer_ZoneInfo, true);
				else
					if (dwIsAddOnLoaded("Cartographer_ZoneInfo")) then
						Cartographer:ToggleModuleActive(Cartographer_ZoneInfo, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_Notes")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_NOTES,
			CARTOGRAPHER_NOTES_TIP,
			"CartographerNotes",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_Notes")) then
						dwLoadAddOn("Cartographer_Notes");
					end
					Cartographer:ToggleModuleActive(Cartographer_Notes, true);
				else
					if (dwIsAddOnLoaded("Cartographer_Notes")) then
						Cartographer:ToggleModuleActive(Cartographer_Notes, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_Battlegrounds")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_BATTLEGROUNDS,
			nil,
			"CartographerBattlegrounds",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_Battlegrounds")) then
						dwLoadAddOn("Cartographer_Battlegrounds");
					end
					Cartographer:ToggleModuleActive(Cartographer_Battlegrounds, true);
				else
					if (dwIsAddOnLoaded("Cartographer_Battlegrounds")) then
						Cartographer:ToggleModuleActive(Cartographer_Battlegrounds, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_GroupColors")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_GROUPCOLORS,
			nil,
			"CartographerGroupColors",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_GroupColors")) then
						dwLoadAddOn("Cartographer_GroupColors");
					end
					Cartographer:ToggleModuleActive(Cartographer_GroupColors, true);
				else
					if (dwIsAddOnLoaded("Cartographer_GroupColors")) then
						Cartographer:ToggleModuleActive(Cartographer_GroupColors, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_POI")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_POI,
			nil,
			"CartographerPOI",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_POI")) then
						dwLoadAddOn("Cartographer_POI");
					end
					Cartographer:ToggleModuleActive(Cartographer_POI, true);
				else
					if (dwIsAddOnLoaded("Cartographer_POI")) then
						Cartographer:ToggleModuleActive(Cartographer_POI, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_GroupColors")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_GROUPCOLORS ,
			nil,
			"CartographerGroupColors",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_GroupColors")) then
						dwLoadAddOn("Cartographer_GroupColors");
					end
					Cartographer:ToggleModuleActive(Cartographer_GroupColors, true);
				else
					if (dwIsAddOnLoaded("Cartographer_GroupColors")) then
						Cartographer:ToggleModuleActive(Cartographer_GroupColors, false);
						--dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end

	if (dwIsConfigurableAddOn("Cartographer_LookNFeel")) then
		dwRegisterCheckButton(
			"WorldMapMod",
			CARTOGRAPHER_LOOKNFEEL ,
			DUOWAN_RELOAD_DESC,
			"CartographerLookNFeel",
			1,
			function (arg)
				if (arg == 1) then
					if (not dwIsAddOnLoaded("Cartographer_LookNFeel")) then
						dwLoadAddOn("Cartographer_LookNFeel");
					end
					Cartographer:ToggleModuleActive(Cartographer_LookNFeel, true);
				else
					if (dwIsAddOnLoaded("Cartographer_LookNFeel")) then
						Cartographer:ToggleModuleActive(Cartographer_LookNFeel, false);
						dwRequestReloadUI(nil);
					end
				end
			end,
			1
		);
	end
	
end


if (dwIsConfigurableAddOn("InstanceMaps")) then
	dwRegisterCheckButton(
		"WorldMapMod",
		CARTOGRAPHER_INSTANCEMAPS_ENABLE,
		"",
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