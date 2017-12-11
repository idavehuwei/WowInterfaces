--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-esES.lua - Localized string constants (es-ES/es-MX).        *
  ****************************************************************************]]


if ( GetLocale() == "esES" or GetLocale() == "esMX" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Time-Lost Proto Drake" ] = "Protodraco Tiempo Perdido";

		[ "Dart" ] = "Dardo";
		[ "Takk the Leaper" ] = "Takk el Saltarín";
		[ "Ravasaur Matriarch" ] = "Matriarca ravasaurio";
		[ "Razormaw Matriarch" ] = "Matriarca Tajobuche";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
