--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-deDE.lua - Localized string constants (de-DE).              *
  ****************************************************************************]]


if ( GetLocale() == "deDE" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Time-Lost Proto Drake" ] = "Zeitverlorener Protodrache";

		[ "Dart" ] = "Pfeil";
		[ "Takk the Leaper" ] = "Takk der Springer";
		[ "Ravasaur Matriarch" ] = "Ravasaurusmatriarchin";
		[ "Razormaw Matriarch" ] = "Scharfzahnmatriarchin";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
