--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhCN.lua - Localized string constants (zh-CN).              *
  ****************************************************************************]]


if ( GetLocale() == "zhCN" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		--[ "Gondria" ] = "";
		--[ "Time-Lost Proto Drake" ] = "";

		[ "Dart" ] = "达尔特";
		[ "Takk the Leaper" ] = "“跳跃者”塔克";
		[ "Ravasaur Matriarch" ] = "暴掠龙女王";
		[ "Razormaw Matriarch" ] = "刺喉雌龙";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
