--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-koKR.lua - Localized string constants (ko-KR).              *
  ****************************************************************************]]


if ( GetLocale() == "koKR" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Gondria" ] = "곤드리아";
		--[ "Time-Lost Proto Drake" ] = "";

		--[ "Dart" ] = "";
		[ "Takk the Leaper" ] = "껑충발 타크";
		[ "Ravasaur Matriarch" ] = "우두머리 라바사우루스";
		--[ "Razormaw Matriarch" ] = "";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
