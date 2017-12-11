--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhTW.lua - Localized string constants (zh-TW).              *
  ****************************************************************************]]


if ( GetLocale() == "zhTW" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Gondria" ] = "剛卓亞";
		[ "Time-Lost Proto Drake" ] = "時光流逝元龍";

		[ "Dart" ] = "達爾特";
		[ "Takk the Leaper" ] = "『跳躍者』塔克";
		[ "Ravasaur Matriarch" ] = "暴掠龍族母";
		[ "Razormaw Matriarch" ] = "刺喉龍族母";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
