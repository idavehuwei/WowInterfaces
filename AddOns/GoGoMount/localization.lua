
---------
--function GoGo_Localize()
---------

-- Constants
	GoGo_Variables.Localize.ColdWeatherFlying = 54197
	GoGo_Variables.Localize.FastFlightForm = 40120
	GoGo_Variables.Localize.FlightForm = 33943
	GoGo_Variables.Localize.AquaForm = 1066
	GoGo_Variables.Localize.TravelForm = 783
	GoGo_Variables.Localize.CatForm = 768
	GoGo_Variables.Localize.GhostWolf = 2645
	GoGo_Variables.Localize.CrusaderAura = 32223
	GoGo_Variables.Localize.AspectCheetah = 5118
--	GoGo_Variables.Localize.AspectPack = 13159

-- Default to english, localized below if translation is available (see http://wow.curseforge.com/projects/gogomount/localization/)
	GoGo_Variables.Localize.Zone.TwistingNether = "Twisting Nether"
	GoGo_Variables.Localize.Zone.TheFrozenSea = "The Frozen Sea"
	GoGo_Variables.Localize.Zone.AQ40 = "Ahn'Qiraj"
	GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
	GOGO_SZONE_THEUNDERBELLY = "The Underbelly"
	GOGO_SZONE_KRASUSLANDING = "Krasus' Landing"
	GOGO_SZONE_THEVIOLETCITADEL = "The Violet Citadel"
	GoGo_Variables.Localize.Zone.Wintergrasp = "Wintergrasp"
	GoGo_Variables.Localize.Zone.SholazarBasin = "Sholazar Basin"
	GoGo_Variables.Localize.Zone.TheStormPeaks = "The Storm Peaks"
	GOGO_ZONE_ICECROWN = "Icecrown"
	GOGO_ZONE_THEOCULUS = "The Oculus"
	GOGO_SKILL_ENGINEERING = "Engineering"
	GOGO_SKILL_TAILORING = "Tailoring"
	GOGO_SKILL_RIDING = "Riding"
	GOGO_STRING_ENABLEAUTODISMOUNT = "Enable automatic dismount"
	GOGO_STRING_DRUIDSINGLECLICK = "Single click to shift from form to travel forms"
	GoGo_Variables.Localize.String.DruidFlightPreference = "Always use flight forms instead of when moving only"
	GOGO_STRING_SAMEEPICFLYSPEED = "Consider 310% and 280% mounts the same speed"
	GOGO_STRING_DISABLEUPDATENOTICES = "Disable update notices"
	GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Disable unknown mount notices"
	GOGO_STRING_UNKNOWNMOUNTFOUND = "An unknown mount has been found in you list of mounts.  Please report this so that it can be added to future versions of GoGoMount."
	GOGO_STRING_NEWVERSIONFOUND = "GoGoMount update is available and is being used by "
	GOGO_STRING_FAVORITES = "Favorites"
	GOGO_STRING_CURRENTZONEFAVORITES = "Current Zone Favorites"
	GOGO_STRING_GLOBALFAVORITES = "Global Favorites"
	GOGO_STRING_GLOBALPREFERENCES = "Global Preferences"
	GOGO_TALENT_FERALSWIFTNESS = "Feral Swiftness"
	GOGO_TALENT_IMPROVEDGHOSTWOLF = "Improved Ghost Wolf"

	if GetLocale() == "frFR" then

		GoGo_Variables.Localize.Zone.TwistingNether = "Le Néant distordu"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "La mer Gelée"
		GoGo_Variables.Localize.Zone.AQ40 = "Temple d'Ahn'Qiraj"
		GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
		GOGO_SZONE_THEUNDERBELLY = "Les Entrailles"
		GOGO_SZONE_KRASUSLANDING = "Aire de Krasus"
		GOGO_SZONE_THEVIOLETCITADEL = "Citadelle Pourpre"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Joug-d'hiver"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Bassin de Sholazar"
		GOGO_ZONE_ICECROWN = "La Couronne de glace"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "Les pics Foudroyés"
		GOGO_ZONE_THEOCULUS = "L'Oculus"

		GOGO_SKILL_ENGINEERING = "Ingénierie"
		GOGO_SKILL_TAILORING = "Couture"
		GOGO_SKILL_RIDING = "Monte"

		GOGO_STRING_ENABLEAUTODISMOUNT = "Activer la descente de monture automatique"
		GOGO_STRING_DRUIDSINGLECLICK = "Clic pour passer à la monture suivante"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "Une monture inconnue a été trouvée dans votre liste. Veuillez la communiquer afin qu'elle soit ajoutée à une future version de GoGoMount."
		GOGO_STRING_NEWVERSIONFOUND = "Une mise à jour de GoGoMount est disponible et est utilisée par "
		GOGO_STRING_SAMEEPICFLYSPEED = "Considérer que les montures 280% et 310% ont la même vitesse"
		GOGO_STRING_DISABLEUPDATENOTICES = "Désactiver les annonces de mise à jour"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Désactiver les annonces de monture inconnue"
		GOGO_STRING_FAVORITES = "Favoris"
		GOGO_STRING_GLOBALPREFERENCES = "Préférences globales"
		GOGO_STRING_CURRENTZONEFAVORITES = "Favoris de la zone actuelle"
		GOGO_STRING_GLOBALFAVORITES = "Favoris globaux"
	
		GOGO_TALENT_FERALSWIFTNESS = "Célérité farouche"
	
		BINDING_NAME_GOGOBINDING = "Monter/descendre de la monture"
		BINDING_NAME_GOGOBINDING2 = "Monter/descendre de la monture non volante"
		BINDING_NAME_GOGOBINDING3 = "Monter/descendre de la monture à passager"

	elseif GetLocale() == "deDE" then

		GoGo_Variables.Localize.Zone.TwistingNether = "Wirbelnder Nether"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "Die gefrorene See"
		GoGo_Variables.Localize.Zone.AQ40 = "Tempel von Ahn'Qiraj"
		GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
		GOGO_SZONE_THEUNDERBELLY = "Die Schattenseite"
		GOGO_SZONE_KRASUSLANDING = "Krasus' Landeplatz"
		GOGO_SZONE_THEVIOLETCITADEL = "Die Violette Zitadelle"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Tausendwintersee"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Sholazarbecken"
		GOGO_ZONE_ICECROWN = "Eiskrone"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "Der Sturmgipfel"
		GOGO_ZONE_THEOCULUS = "Das Oculus"
	
		GOGO_SKILL_ENGINEERING = "Ingenieurskunst"
		GOGO_SKILL_TAILORING = "Schneiderei"
		GOGO_SKILL_RIDING = "Reiten"
	
		GOGO_STRING_ENABLEAUTODISMOUNT = "Automatisches Absitzen erlauben"
		GOGO_STRING_NEWVERSIONFOUND = "Eine aktualisierte Version von GoGoMount ist verfügbar und wird verwendet von "
		GOGO_STRING_SAMEEPICFLYSPEED = "310% und 280% Geschwindigkeitsbonus gleichsetzen"
		GOGO_STRING_DISABLEUPDATENOTICES = "Updatenachrichten deaktivieren"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Ankündigungen über unbekannte Mounts deaktivieren"
		GOGO_STRING_DRUIDSINGLECLICK = "Einfacher Klick für den Wechsel in Reisegestalten"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "Ein unbekanntes Reittier wurde in deiner Liste entdeckt. Bitte melde es, damit es in zukünftige Versionen von GoGoMount integriert werden kann."
		GOGO_STRING_FAVORITES = "Favoriten"
		GOGO_STRING_GLOBALPREFERENCES = "Globale Präferenzen"
		GOGO_STRING_GLOBALFAVORITES = "Globale Favoriten"
		GOGO_STRING_CURRENTZONEFAVORITES = "Favoriten der aktuellen Zone"
		GOGO_STRING_NEWVERSIONFOUND = "Eine aktualisierte Version von GoGoMount ist verfügbar und wird verwendet von "
		
		GOGO_TALENT_FERALSWIFTNESS = "Schnelligkeit der Wildnis"
	
		BINDING_NAME_GOGOBINDING = "Aufsitzen/Absitzen"
		BINDING_NAME_GOGOBINDING2 = "Aufsitzen/Absitzen (nichtfliegend)"
		BINDING_NAME_GOGOBINDING3 = "Aufsitzen/Absitzen bei Fahrgast-Mounts"

	elseif GetLocale() == "esES" then

		GoGo_Variables.Localize.Zone.TwistingNether = "El Vacío Abisal"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "El Mar Gélido"
		GoGo_Variables.Localize.Zone.AQ40 = "Templo de Ahn'Qiraj"
		GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
		GOGO_SZONE_THEUNDERBELLY = "Los Bajos Fondos"
		GOGO_SZONE_KRASUSLANDING = "Alto de Krasus"
		GOGO_SZONE_THEVIOLETCITADEL = "La Ciudadela Violeta"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Conquista del Invierno"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Cuenca de Sholazar"
		GOGO_ZONE_ICECROWN = "Corona de Hielo"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "Las Cumbres Tormentosas"
		GOGO_ZONE_THEOCULUS = "El Oculus"

		GOGO_SKILL_ENGINEERING = "Ingeniería"
		GOGO_SKILL_TAILORING = "Sastrería"
		GOGO_SKILL_RIDING = "Equitación"

		GOGO_STRING_ENABLEAUTODISMOUNT = "Activar desmonte automático"
		GOGO_STRING_DRUIDSINGLECLICK = "Un click en mayúsculas (shift) para las formas de viaje"
		GOGO_STRING_SAMEEPICFLYSPEED = "Considerar 310% y 280% como la misma velocidad"
		GOGO_STRING_DISABLEUPDATENOTICES = "Desactivar notificaciones de actualizaciones"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Desactivar notificaciones de monturas desconocidas"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "Una montura desconocida ha sido encontrada en la lista de tus monturas. Por favor, reporte esto para que pueda ser añadido en futuras versiones de GoGoMount."
		GOGO_STRING_NEWVERSIONFOUND = "Una nueva actualización de GoGoMount está disponible y es usada por "
		GOGO_STRING_FAVORITES = "Favoritos"
		GOGO_STRING_CURRENTZONEFAVORITES = "Favoritos de Zona Actual"
		GOGO_STRING_GLOBALFAVORITES = "Favoritos Globales"
		GOGO_STRING_GLOBALPREFERENCES = "Preferencias Globales"
	
		GOGO_TALENT_FERALSWIFTNESS = "Presteza feral"
	
		BINDING_NAME_GOGOBINDING = "Montar/Desmontar"
		BINDING_NAME_GOGOBINDING2 = "Montar/Desmontar (no voladora)"
		BINDING_NAME_GOGOBINDING3 = "Montar/Desmontar Monturas de Pasajeros"
	
	elseif GetLocale() == "esMX" then
	
		GoGo_Variables.Localize.Zone.TwistingNether = "El Vacío Abisal"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "El Mar Gélido"
		GoGo_Variables.Localize.Zone.AQ40 = "Templo de Ahn'Qiraj"
		GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
		GOGO_SZONE_THEUNDERBELLY = "Los Bajos Fondos"
		GOGO_SZONE_KRASUSLANDING = "Alto de Kraus"
		GOGO_SZONE_THEVIOLETCITADEL = "La Ciudadela Violeta"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Conquista del Invierno"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Cuenca de Sholazar"
		GOGO_ZONE_ICECROWN = "Corona de Hielo"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "Las Cumbres Tormentosas"
		GOGO_ZONE_THEOCULUS = "El Oculus"
	
		GOGO_SKILL_ENGINEERING = "Ingeniería"
		GOGO_SKILL_TAILORING = "Sastrería"
		GOGO_SKILL_RIDING = "Equitación"
	
		GOGO_STRING_ENABLEAUTODISMOUNT = "Activar desmonte automático"
		GOGO_STRING_DRUIDSINGLECLICK = "Un click en mayúsculas (shift) para las formas de viaje"
		GOGO_STRING_SAMEEPICFLYSPEED = "Considerar 310% y 280% como la misma velocidad"
		GOGO_STRING_DISABLEUPDATENOTICES = "Desactivar notificaciones de actualizaciones"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Desactivar notificaciones de monturas desconocidas"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "Una montura desconocida ha sido encontrada en la lista de tus monturas. Por favor, reporte esto para que pueda ser añadido en futuras versiones de GoGoMount."
		GOGO_STRING_NEWVERSIONFOUND = "Una nueva actualización de GoGoMount está disponible y es usada por "
		GOGO_STRING_FAVORITES = "Favoritos"
		GOGO_STRING_CURRENTZONEFAVORITES = "Favoritos de Zona Actual"
		GOGO_STRING_GLOBALFAVORITES = "Favoritos Globales"
		GOGO_STRING_GLOBALPREFERENCES = "Preferencias Globales"
	
		GOGO_TALENT_FERALSWIFTNESS = "Presteza feral"
	
		BINDING_NAME_GOGOBINDING = "Montar/Desmontar"
		BINDING_NAME_GOGOBINDING2 = "Montar/Desmontar (no voladora)"
		BINDING_NAME_GOGOBINDING3 = "Montar/Desmontar Monturas de Pasajeros"
	
	elseif GetLocale() == "koKR" then
	
		GoGo_Variables.Localize.Zone.TwistingNether = "뒤틀린 황천"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "얼어붙은 바다"
		GoGo_Variables.Localize.Zone.AQ40 = "안퀴라즈 사원"
		GoGo_Variables.Localize.Zone.Dalaran = "달라란"
		GOGO_SZONE_THEUNDERBELLY = "마법의 뒤안길"
		GOGO_SZONE_KRASUSLANDING = "크라서스 착륙장"
		GOGO_SZONE_THEVIOLETCITADEL = "보랏빛 성채"
		GoGo_Variables.Localize.Zone.Wintergrasp = "겨울손아귀 호수"
		GoGo_Variables.Localize.String.DruidFlightPreference = "항상 움직일때 비행 형태의 변신 사용"
		
		BINDING_NAME_GOGOBINDING = "타기/내리기"
		BINDING_NAME_GOGOBINDING2 = "타기/내리기 (나는 탈것 제외)"
		BINDING_NAME_GOGOBINDING3 = "2인승 탈것 타기/내리기"

		GOGO_STRING_GLOBALFAVORITES = "일반적인 즐겨찾기"
		GOGO_STRING_CURRENTZONEFAVORITES = "현재 지역 즐겨찾기"
		GOGO_STRING_GLOBALPREFERENCES = "일반 설정"
		GOGO_STRING_FAVORITES = "즐겨찾기"
		GOGO_STRING_USESHAPESHIFTFORMS = "변신 폼 사용"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "알 수 없는 탈것 안내 사용 중지"
		GOGO_STRING_DISABLEUPDATENOTICES = "업데이트 안내 사용 중지"
		GOGO_STRING_SAMEEPICFLYSPEED = "310%와 280%의 같은 속도의 탈것 고려"
		GOGO_STRING_NEWVERSIONFOUND = "GoGoMount 업데이트가 가능하고 사용됩니다. "
		GOGO_STRING_UNKNOWNMOUNTFOUND = "알 수 없는 탈것이 당신의 목록에서 발견되었습니다. 이것을 GoGoMount의 다음 버전에 추가될 수 있도록 알리십시오."
		GOGO_STRING_DRUIDSINGLECLICK = "변신 상태에서 다른 변신 형태로 한번의 클릭으로 변경"
		GOGO_STRING_ENABLEAUTODISMOUNT = "자동 탈것 내리기 사용"
		GOGO_TALENT_FERALSWIFTNESS = "야생의 기민함"
		GOGO_ZONE_THEOCULUS = "마력의 눈"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "폭풍우 봉우리"
		GoGo_Variables.Localize.Zone.SholazarBasin = "숄라자르 분지"
		GOGO_ZONE_ICECROWN = "얼음왕관"
		
		GOGO_SKILL_ENGINEERING = "기계공학"
		GOGO_SKILL_TAILORING = "재봉술"
		GOGO_SKILL_RIDING = "탈것 타기"
	
	elseif GetLocale() == "zhCN" then
	
		BINDING_NAME_GOGOBINDING = "召唤坐骑/解散坐骑"
		BINDING_NAME_GOGOBINDING2 = "召唤/解散坐骑 (非飞行坐骑)"
		BINDING_NAME_GOGOBINDING3 = "召唤/解散多人坐骑"
	
		GoGo_Variables.Localize.Zone.TwistingNether = "扭曲虚空"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "冰冻之海"
		GoGo_Variables.Localize.Zone.AQ40 = "安其拉神殿"  -- may need "temple" removed
		GoGo_Variables.Localize.Zone.Dalaran = "达拉然"
		GOGO_SZONE_THEUNDERBELLY = "达拉然下水道"
		GOGO_SZONE_KRASUSLANDING = "克拉苏斯平台"
		GOGO_SZONE_THEVIOLETCITADEL = "紫罗兰城堡"
		GoGo_Variables.Localize.Zone.Wintergrasp = "冬拥湖"
		GoGo_Variables.Localize.Zone.SholazarBasin = "索拉查盆地"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "风暴峭壁"
		GOGO_ZONE_ICECROWN = "冰冠冰川"
	
		GOGO_STRING_ENABLEAUTODISMOUNT = "开启自动解散坐骑"
		GOGO_STRING_DRUIDSINGLECLICK = "一键切换至旅行形态"
		GOGO_STRING_SAMEEPICFLYSPEED = "310%与280%的坐骑视作同一速度"
		GOGO_STRING_DISABLEUPDATENOTICES = "关闭更新提示"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "关闭未知坐骑提示"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "在您的坐骑列表中发现一个未知的坐骑.请报告以便在未来版本中加入"
		GOGO_STRING_NEWVERSIONFOUND = "GoGoMount 有新版本可更新 "
		GOGO_STRING_FAVORITES = "收藏"
		GOGO_STRING_CURRENTZONEFAVORITES = "当前地域收藏"
		GOGO_STRING_GLOBALFAVORITES = "全局收藏"
		GOGO_STRING_GLOBALPREFERENCES = "全局优先"
		
		GOGO_SKILL_ENGINEERING = "工程学"
		GOGO_SKILL_TAILORING = "裁缝"
		GOGO_SKILL_RIDING = "骑术"
	
	elseif GetLocale() == "zhTW" then
	
		GoGo_Variables.Localize.Zone.TwistingNether = "扭曲虛空"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "冰凍之海"
		GoGo_Variables.Localize.Zone.AQ40 = "安其拉"
		GoGo_Variables.Localize.Zone.Dalaran = "達拉然"
		GOGO_SZONE_THEUNDERBELLY = "城底區"
		GOGO_SZONE_KRASUSLANDING = "卡薩斯平臺"
		GOGO_SZONE_THEVIOLETCITADEL = "紫羅蘭城塞"
		GoGo_Variables.Localize.Zone.Wintergrasp = "冬握湖"
		GoGo_Variables.Localize.Zone.SholazarBasin = "休拉薩盆地"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "風暴群山"
		GOGO_ZONE_ICECROWN = "寒冰皇冠"
	
		GOGO_SKILL_ENGINEERING = "工程學"
		GOGO_SKILL_TAILORING = "裁縫"
		GOGO_SKILL_RIDING = "騎術"
	
		GOGO_STRING_ENABLEAUTODISMOUNT = "啟用自動解除坐騎"
		GOGO_STRING_DRUIDSINGLECLICK = "單擊後從變身形態轉換為旅行形態"
		GOGO_STRING_SAMEEPICFLYSPEED = "將310%，300%以及280%視為相同速度的坐騎"
		GOGO_STRING_DISABLEUPDATENOTICES = "停用更新通知"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "停用未知的坐騎通知"
		GOGO_STRING_UNKNOWNMOUNTFOUND = "在你的坐騎清單中找到未知的坐騎。請回報它，以便加入到GoGoMount的新版本中。"
		GOGO_STRING_NEWVERSIONFOUND = "可從GoGoMount的更新獲得並可開始使用"
		GOGO_STRING_FAVORITES = "偏好"
		GOGO_STRING_CURRENTZONEFAVORITES = "當前地區的偏好"
		GOGO_STRING_GLOBALFAVORITES = "總體偏好"
		GOGO_STRING_GLOBALPREFERENCES = "總體優先"
	
		BINDING_NAME_GOGOBINDING = "坐騎/解除坐騎"
		BINDING_NAME_GOGOBINDING2 = "坐騎/解除坐騎(無飛行)"
		BINDING_NAME_GOGOBINDING3 = "坐騎/解除有乘客的坐騎"
	
	elseif GetLocale() == "enGB" then
	
		GoGo_Variables.Localize.Zone.TwistingNether = "Twisting Nether"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "The Frozen Sea"
		GoGo_Variables.Localize.Zone.AQ40 = "Ahn'Qiraj"
		GoGo_Variables.Localize.Zone.Dalaran = "Dalaran"
		GOGO_SZONE_THEUNDERBELLY = "The Underbelly"
		GOGO_SZONE_KRASUSLANDING = "Krasus' Landing"
		GOGO_SZONE_THEVIOLETCITADEL = "The Violet Citadel"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Wintergrasp"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Sholazar Basin"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "The Storm Peaks"
		GOGO_ZONE_ICECROWN = "Icecrown"
		GOGO_ZONE_THEOCULUS = "The Oculus"

		GOGO_SKILL_ENGINEERING = "Engineering"
		GOGO_SKILL_TAILORING = "Tailoring"
		GOGO_SKILL_RIDING = "Riding"

	elseif GetLocale() == "ruRU" then

		GoGo_Variables.Localize.Zone.TwistingNether = "Круговерть Пустоты"
		GoGo_Variables.Localize.Zone.TheFrozenSea = "Ледяное море"
		GoGo_Variables.Localize.Zone.AQ40 = "Ан'Кираж" -- or is it  "Храм Ан'Кираж"  ?
		GoGo_Variables.Localize.Zone.Dalaran = "Даларан"
		GOGO_SZONE_THEUNDERBELLY = "Клоака"
		GOGO_SZONE_KRASUSLANDING = "Площадка Краса"
		GOGO_SZONE_THEVIOLETCITADEL = "Аметистовая крепость"
		GoGo_Variables.Localize.Zone.Wintergrasp = "Озеро Ледяных Оков"
		GoGo_Variables.Localize.Zone.SholazarBasin = "Низина Шолазар"
		GOGO_ZONE_ICECROWN = "Ледяная Корона"
		GoGo_Variables.Localize.Zone.TheStormPeaks = "Грозовая Гряда"
		GOGO_ZONE_THEOCULUS = "Окулус"

		GOGO_SKILL_ENGINEERING = "Инженерное дело"
		GOGO_SKILL_TAILORING = "Портняжное дело"
		GOGO_SKILL_RIDING = "Верховая езда"

		GOGO_STRING_UNKNOWNMOUNTFOUND = "Неизвестное средство передвижения было обнаружено в списке ваших средств передвижения. Пожалуйста, сообщите о нём, и, возможно, оно будет добавлено в следующие версии GoGoMount."
		GOGO_STRING_NEWVERSIONFOUND = "Обновление для GoGoMount доступно и уже используется "
		GOGO_STRING_SAMEEPICFLYSPEED = "Считать 310% и 280% одинаковой скоростью"
		GOGO_STRING_DISABLEUPDATENOTICES = "Отключить уведомления об обновлении"
		GOGO_STRING_DISABLEUNKNOWNMOUNTNOTICES = "Отключить уведомления о неизвестных средствах передвижения"
		GOGO_STRING_GLOBALPREFERENCES = "Глобальные предпочтения"
		GOGO_STRING_ENABLEAUTODISMOUNT = "Включить автоматическое спешивание"

		GOGO_TALENT_FERALSWIFTNESS = "Звериная скорость"

	end --if

--end --function