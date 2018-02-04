if (GetLocale() == "zhCN") then
    MOD_MAP_TOOLKIT = { "地图工具", "ditugongju" };

    MOD_MAP_TOOLKIT_ENABLE_INSTANCE_MAPS = "开启副本地图";

    INSTANCE_MAPS_DISABLE_DELAY_TEXT = "|cff00c0c0<副本地图>|r 你已经关闭副本地图模块，该设置将在下次插件载入时生效。";
elseif (GetLocale() == "zhTW") then
    MOD_MAP_TOOLKIT = { "地圖工具", "ditugongju" };

    MOD_MAP_TOOLKIT_ENABLE_INSTANCE_MAPS = "開啟副本地圖";

    INSTANCE_MAPS_DISABLE_DELAY_TEXT = "|cff00c0c0<副本地圖>|r 你已經關閉副本地圖模組，該設置將在下次外掛程式載入時生效。";
else
    MOD_MAP_TOOLKIT = "Map Toolkit";

    MOD_MAP_TOOLKIT_ENABLE_INSTANCE_MAPS = "Enable Instance Maps";

    INSTANCE_MAPS_DISABLE_DELAY_TEXT = "|cff00c0c0<Instance Maps>|r Instance Maps has been disabled. This setting will be available next time.";
end

if (IsConfigurableAddOn("InstanceMaps")) then
    ModManagement_RegisterMod("MapToolkit",
        "Interface\\Icons\\INV_Misc_Toy_06",
        MOD_MAP_TOOLKIT);

    ModManagement_RegisterCheckBox("MapToolkit",
        MOD_MAP_TOOLKIT_ENABLE_INSTANCE_MAPS,
        nil,
        "EnableInstanceMaps",
        1,
        function(arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("InstanceMaps")) then
                    BigFoot_LoadAddOn("InstanceMaps");
                end
            else
                if (BigFoot_IsAddOnLoadedFromBigFoot("InstanceMaps")) then
                    BigFoot_RequestReloadUI(function() BigFoot_Print(INSTANCE_MAPS_DISABLE_DELAY_TEXT); end);
                end
            end
        end);
end
