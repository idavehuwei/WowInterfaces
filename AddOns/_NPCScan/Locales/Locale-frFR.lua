--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-frFR.lua - Localized string constants (fr-FR).              *
  ****************************************************************************]]


if ( GetLocale() == "frFR" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Time-Lost Proto Drake" ] = "Proto-drake perdu dans le temps";

		[ "Dart" ] = "Flèche";
		[ "Takk the Leaper" ] = "Takk le Bondisseur";
		[ "Ravasaur Matriarch" ] = "Matriarche ravasaure";
		[ "Razormaw Matriarch" ] = "Matriarche tranchegueules";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
