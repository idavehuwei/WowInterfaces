--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-ruRU.lua - Localized string constants (ru-RU).              *
  ****************************************************************************]]


if ( GetLocale() == "ruRU" ) then
	_NPCScanLocalization.NPCS = setmetatable( {
		[ "Gondria" ] = "Гондрия";
		[ "Time-Lost Proto Drake" ] = "Затерянный во времени протодракон";

		[ "Dart" ] = "Дарт";
		[ "Takk the Leaper" ] = "Такк Прыгун";
		[ "Ravasaur Matriarch" ] = "Равазавр-матриарх";
		[ "Razormaw Matriarch" ] = "Острозуб-матриарх";
	}, { __index = _NPCScanLocalization.NPCS; } );
end
