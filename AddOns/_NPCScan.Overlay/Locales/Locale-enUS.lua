--[[****************************************************************************
  * _NPCScan.Overlay by Saiket  简体中文翻译：x00s                             *
  * Locales/Locale-zhCN.lua - Localized string constants (zh-CN).              *
  ****************************************************************************]]


do
	_NPCScanLocalization.OVERLAY = setmetatable( {
		CONFIG_TITLE = "路径图";
		CONFIG_ENABLE = ENABLE;
		CONFIG_ALPHA = "透明度";
		CONFIG_DESC = "控制何处地图可以显示刷新路径，大部分地图自定义插件都受世界地图选项的控制。";
		CONFIG_ZONE = "地区:";
		CONFIG_IMAGE_FORMAT = "|T%s:%d:%d|t"; -- Path, Height, Width
		CONFIG_LEVEL_TYPE_FORMAT = UNIT_TYPE_LEVEL_TEMPLATE; -- Level, Type

		MODULE_BATTLEFIELDMINIMAP = "现实迷你战场地图";
		MODULE_WORLDMAP = "主要世界地图";
		MODULE_WORLDMAP_KEY = "_|cffCCCC88NPCScan|r.Overlay";
		MODULE_WORLDMAP_KEY_FORMAT = "\226\128\162 %s";
		MODULE_MINIMAP = "小地图";
		MODULE_RANGERING_FORMAT = "显示半径约%d码的探测环";
		MODULE_RANGERING_DESC = "提示： 在有稀有怪的地图才会显示出探测环(例如在主城或冬拥湖就不会显示).";
		MODULE_ALPHAMAP = "使用地图测试插件";
	}, getmetatable( _NPCScanLocalization ) );
end
