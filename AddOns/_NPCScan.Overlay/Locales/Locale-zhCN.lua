--[[****************************************************************************
  * _NPCScan.Overlay by Saiket                                                 *
  * Locales/Locale-zhCN.lua - Localized string constants (zh-CN).              *
  ****************************************************************************]]


if ( GetLocale() ~= "zhCN" ) then
    return;
end


-- See http://wow.curseforge.com/addons/npcscan-overlay/localization/zhCN/
_NPCScanOverlayLocalization = setmetatable( {
    NPCS = setmetatable( {
        [ 1140 ] = "刺喉雌龙",
        [ 5842 ] = "『跳跃者』塔克",
        [ 6581 ] = "暴掠龙女王",
        [ 14232 ] = "达尔特",
        [ 18684 ] = "独行者布罗加斯",
        [ 32491 ] = "迷失的始祖幼龙",
        [ 32517 ] = "洛卡纳哈",
        [ 33776 ] = "古德利亚",
        [ 35189 ] = "逐日",
        [ 38453 ] = "阿克图瑞斯",
        [ 50138 ] = "卡洛玛",
        [ 54319 ] = "玛格瑞亚",
    }, { __index = _NPCScanOverlayLocalization.NPCS; } );

    CONFIG_ALPHA = "透明度",
    CONFIG_DESC = "控制何处地图可以显示刷新路径，大部分地图自定义插件都受世界地图选项的控制。",
    CONFIG_SHOWALL = "永远显示所有路径",
    CONFIG_SHOWALL_DESC = "通常地图上不会显示未追踪怪物的路径图。开启这个选项将永远显示所有已知路径图。",
    CONFIG_TITLE = "路径图",
    CONFIG_TITLE_STANDALONE = "_|cffCCCC88NPCScan|r.Overlay",
    CONFIG_ZONE = "地区:",
    MODULE_ALPHAMAP3 = "AlphaMap3 插件",
    MODULE_BATTLEFIELDMINIMAP = "显示战场小地图",
    MODULE_MINIMAP = "小地图",
    MODULE_RANGERING_DESC = "提示： 在稀有怪存在的地图才显示探测环(例如在达拉然或冬拥湖就不会显示).",
    MODULE_RANGERING_FORMAT = "显示半径约%d码的探测环",
    MODULE_WORLDMAP = "主要世界地图",
    MODULE_WORLDMAP_KEY = "_|cffCCCC88NPCScan|r.Overlay",
    MODULE_WORLDMAP_KEY_FORMAT = "• %s",
    MODULE_WORLDMAP_TOGGLE = "_|cffCCCC88NPCScan|r.Overlay",
    MODULE_WORLDMAP_TOGGLE_DESC = "如果开启，显示_|cffCCCC88NPCScan|r.Overlay已知怪物路径的路径图。",
}, { __index = _NPCScanOverlayLocalization; } );