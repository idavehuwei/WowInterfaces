local L = AceLibrary("AceLocale-2.2"):new("GridStatusHots")

L:RegisterTranslations("enUS", function()
	return {
		["My HoTs"] = true,
		["Renew"] = true,
		["Rejuvenation"] = true,
		["Regrowth"] = true,
		["Lifebloom"] = true,
		["Wild Growth"] = true,
		["Sheath of Light"] = true,
		["Glyph of Flash of Light"] = true,
		["Riptide"] = true,
		["Earthliving"] = true,
		["Buff: Hot Count"] = true,
		["Buff: My Renew"] = true,
		["Buff: My Rejuvenation"] = true,
		["Buff: My Regrowth"] = true,
		["Buff: My Lifebloom"] = true,
		["Buff: Lifebloom Stack Colored"] = true,
		["Buff: My Wild Growth"] = true,
		["Buff: My Sheath of Light"] = true,
		["Buff: My Glyph of Flash of Light"] = true,
		["Buff: My Riptide"] = true,
		["Buff: My Earthliving"] = true,
		["Prayer of Mending"] = true,
		["Beacon of Light"] = true,
		["Grace Stack"] = true,
		["Grace Duration + Stack"] = true,
		["Color when player has two counters of mending."] = true,
		["Color when player has three counters of mending."] = true,
		["Color when player has four counters of mending."] = true,
		["Color when player has five counters of mending."] = true,
		["Color when player has six counters of mending."] = true,
		["Color when player has two counters of grace."] = true,
		["Color when player has three counters of grace."] = true,
		["Threshold to activate color 2"] = true,
		["Threshold to activate color 3"] = true,
		["Color 2"] = true,
		["Color 3"] = true,
		["Color 4"] = true,
		["Color 5"] = true,
		["Color 6"] = true,
		["Refresh frequency"] = true,
		["Seconds between status refreshes"] = true,
		["Count Lifebloom as 1 HoT per stack"] = true,
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= true,
		["Show HoT-Counter"] = true,
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= true,
	}
end)

L:RegisterTranslations("deDE", function()
	return {
		["My HoTs"] = "Meine HoTs",
		["Renew"] = "Erneuerung",
		["Rejuvenation"] = "Verjüngung",
		["Regrowth"] = "Nachwachsen",
		["Lifebloom"] = "Blühendes Leben",
		["Wild Growth"] = "Wildwuchs",
		["Sheath of Light"] = "Von Licht ummantelt",
		["Glyph of Flash of Light"] = "Glyphe 'Lichtblitz'",
		["Riptide"] = "Springflut",
		["Earthliving"] = "Lebensgeister",
		["Buff: Hot Count"] = "Buff: Anzahl HoTs",
		["Buff: My Renew"] = "Buff: Meine Erneuerung",
		["Buff: My Rejuvenation"] = "Buff: Meine Verjüngung",
		["Buff: My Regrowth"] = "Buff: Mein Nachwachsen",
		["Buff: My Lifebloom"] = "Buff: Mein Blühendes Leben",
		["Buff: Lifebloom Stack Colored"] = "Buff: Blühendes Leben - Farbe abhängig von Anzahl Stapel",
		["Buff: My Wild Growth"] = "Buff: Mein Wildwuchs",
		["Buff: My Sheath of Light"] = "Buff: Mein Von Licht ummantelt",
		["Buff: My Glyph of Flash of Light"] = "Buff: Meine Glyphe 'Lichtblitz'",
		["Buff: My Riptide"] = "Buff: Meine Springflut",
		["Buff: My Earthliving"] = "Buff: Meine Lebensgeister",
		["Prayer of Mending"] = "Gebet der Besserung",
		["Beacon of Light"] = "Flamme des Glaubens",
		["Grace Stack"] = "Barmherzigkeit Stapel",
		["Grace Duration + Stack"] = "Barmherzigkeit Dauer + Stapel",
		["Color when player has two counters of mending."] = "Farbe bei zwei verbleibenden Aufladungen",
		["Color when player has three counters of mending."] = "Farbe bei drei verbleibenden Aufladungen",
		["Color when player has four counters of mending."] = "Farbe bei vier verbleibenden Aufladungen",
		["Color when player has five counters of mending."] = "Farbe bei fünf verbleibenden Aufladungen",
		["Color when player has six counters of mending."] = "Farbe bei sechs verbleibenden Aufladungen",
		["Color when player has two counters of grace."] = "Farbe, wenn der Spieler zwei Mal Barmherzigkeit hat.",
		["Color when player has three counters of grace."] = "Farbe, wenn der Spieler drei Mal Barmherzigkeit hat.",
		["Threshold to activate color 2"] = "Schwelle zum Aktivieren von Farbe 2",
		["Threshold to activate color 3"] = "Schwelle zum Aktivieren von Farbe 3",
		["Color 2"] = "Farbe 2",
		["Color 3"] = "Farbe 3",
		["Color 4"] = "Farbe 4",
		["Color 5"] = "Farbe 5",
		["Color 6"] = "Farbe 6",
		["Refresh frequency"] = "Frequenz der Statusupdates",
		["Seconds between status refreshes"] = "Sekunden zwischen den Statusupdate",
		["Count Lifebloom as 1 HoT per stack"] = "Zähle Blühendes Leben als 1 HoT pro Aufladung",
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= "Auswählen, falls jede Aufladung von Blühendes Leben als ein HoT zählen soll",
		["Show HoT-Counter"] = "Zeige HoT-Zähler",
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= "Auswählen, falls die Gesamtzahl HoTs hinter dem Countdown angezeigt werden soll (z.B. 13-5)",
	}
end)

L:RegisterTranslations("koKR", function()
	return {
		["My HoTs"] = "나의 지속치유",
		["Renew"] = "소생",
		["Rejuvenation"] = "회복",
		["Regrowth"] = "재생",
		["Lifebloom"] = "피어나는 생명",
		["Wild Growth"] = "급속 성장",
		["Sheath of Light"] = "수호의 빛",
		["Glyph of Flash of Light"] = "빛의 섬광의 문양",
		["Riptide"] = "성난 해일",
		["Earthliving"] = "대지의 생명",
		["Buff: Hot Count"] = "버프: 지속 치유 갯수",
		["Buff: My Renew"] = "버프 : 나의 소생",
		["Buff: My Rejuvenation"] = "버프 : 나의 회복",
		["Buff: My Regrowth"] = "버프 : 나의 재생",
		["Buff: My Lifebloom"] = "버프: 나의 피어나는 생명",
		["Buff: Lifebloom Stack Colored"] = "버프: 피어나는 생명 중첩 색상",
		["Buff: My Wild Growth"] = "버프: 나의 급속 성장",
		["Buff: My Sheath of Light"] = "버프: 나의 수호의 빛",
		["Buff: My Glyph of Flash of Light"] = "버프: 나의 빛의 섬광의 문양",
		["Buff: My Riptide"] = "버프: 나의 성난 해일",
		["Buff: My Earthliving"] = "버프: 나의 대지의 생명",
		["Prayer of Mending"] = "회복의 기원",
		["Beacon of Light"] = "빛의 봉화",
		["Grace Stack"] = "은총 중첩",
		["Grace Duration + Stack"] = "은총 지속시간 + 중첩",
		["Color when player has two counters of mending."] = "플레이어 회기 2중첩시 색상",
		["Color when player has three counters of mending."] = "플레이어 회기 3중첩시 색상",
		["Color when player has four counters of mending."] = "플레이어 회기 4중첩시 색상",
		["Color when player has five counters of mending."] = "플레이어 회기 5중첩시 색상",
		["Color when player has six counters of mending."] = "플레이어 회기 6중첩시 색상",
		["Color when player has two counters of grace."] = "플레이어 은총 2중첩시 색상",
		["Color when player has three counters of grace."] = "플레이어 은총 3중첩시 색상",
		["Threshold to activate color 2"] = "색상 2을 사용할 수치",
		["Threshold to activate color 3"] = "색상 3을 사용할 수치",
		["Color 2"] = "색상 2",
		["Color 3"] = "색상 3",
		["Color 4"] = "색상 4",
		["Color 5"] = "색상 5",
		["Color 6"] = "색상 6",
		["Refresh frequency"] = "지속 빈도",
		["Seconds between status refreshes"] = "상태 업데이트 지속시간(초) 설정",
		["Count Lifebloom as 1 HoT per stack"] = "피생 지속치유 중첩당 1개로 표시",
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= "당신이 피어나는 생명의 각 중첩 지속치유를 1개로 보여주길 원한다면 체크합니다.",
		["Show HoT-Counter"] = "HoT-갯수 표시",
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= "당신의 지속치유 갯수를 전부 보여주길 원한다면 체크합니다. (예. 13-5)",
	}
end)

L:RegisterTranslations("esES", function()
	return {
		["My HoTs"] = "My HoTs", --need translation
		["Renew"] = "Renovar",
		["Rejuvenation"] = "Rejuvenecimiento",
		["Regrowth"] = "Recrecimiento",
		["Lifebloom"] = "Flor de vida",
		["Wild Growth"] = "Wild Growth", --need translation
		["Sheath of Light"] = "Sheath of Light", --need translation
		["Glyph of Flash of Light"] = "Glyph of Flash of Light", --need translation
		["Riptide"] = "Riptide", --need translation
		["Buff: HoT Count"] = "Buff: HoT Count", --need translation
		["Buff: My Renew"] = "Buff: My Renovar", --need check
		["Buff: My Rejuvenation"] = "Buff: My Rejuvenecimiento", --need check
		["Buff: My Regrowth"] = "Buff: My Recrecimiento", --need check
		["Buff: My Lifebloom"] = "Buff: My Flor de vida", --need check
		["Buff: Lifebloom Stack Colored"] = "Buff: Lifebloom Stack Colored", --need translation
		["Buff: My Wild Growth"] = "Buff: My Wild Growth", --need translation
		["Buff: My Sheath of Light"] = "Buff: My Sheath of Light", --need translation
		["Buff: My Glyph of Flash of Light"] = "Buff: My Glyph of Flash of Light", --need translation
		["Buff: My Riptide"] = "Buff: My Riptide", --need translation
		["Threshold to activate color 2"] = "Threshold to activate color 2", --need translation
		["Threshold to activate color 3"] = "Threshold to activate color 3", --need translation
		["Color 2"] = "Color 2", --need translation
		["Color 3"] = "Color 3", --need translation
	}
end)

L:RegisterTranslations("esMX", function()
	return {
		["My HoTs"] = "My HoTs", --need translation
		["Renew"] = "Renovar",
		["Rejuvenation"] = "Rejuvenecimiento",
		["Regrowth"] = "Recrecimiento",
		["Lifebloom"] = "Flor de vida",
		["Wild Growth"] = "Wild Growth", --need translation
		["Sheath of Light"] = "Sheath of Light", --need translation
		["Glyph of Flash of Light"] = "Glyph of Flash of Light", --need translation
		["Riptide"] = "Riptide", --need translation
		["Buff: HoT Count"] = "Buff: HoT Count", --need translation
		["Buff: My Renew"] = "Buff: My Renovar", --need check
		["Buff: My Rejuvenation"] = "Buff: My Rejuvenecimiento", --need check
		["Buff: My Regrowth"] = "Buff: My Recrecimiento", --need check
		["Buff: My Lifebloom"] = "Buff: My Flor de vida", --need check
		["Buff: Lifebloom Stack Colored"] = "Buff: Lifebloom Stack Colored", --need translation
		["Buff: My Wild Growth"] = "Buff: My Wild Growth", --need translation
		["Buff: My Sheath of Light"] = "Buff: My Sheath of Light", --need translation
		["Buff: My Glyph of Flash of Light"] = "Buff: My Glyph of Flash of Light", --need translation
		["Buff: My Riptide"] = "Buff: My Riptide", --need translation
		["Threshold to activate color 2"] = "Threshold to activate color 2", --need translation
		["Threshold to activate color 3"] = "Threshold to activate color 3", --need translation
		["Color 2"] = "Color 2", --need translation
		["Color 3"] = "Color 3", --need translation
	}
end)

L:RegisterTranslations("frFR", function()
	return {
		["My HoTs"] = "My HoTs", --need translation
		["Renew"] = "Rénovation",
		["Rejuvenation"] = "Récupération",
		["Regrowth"] = "Rétablissement",
		["Lifebloom"] = "Fleur de vie",
		["Wild Growth"] = "Wild Growth", --need translation
		["Sheath of Light"] = "Sheath of Light", --need translation
		["Glyph of Flash of Light"] = "Glyph of Flash of Light", --need translation
		["Riptide"] = "Riptide", --need translation
		["Buff: Hot Count"] = "Buff: HoT Count", --need translation
		["Buff: My Renew"] = "Buff: My Rénovation", --need check
		["Buff: My Rejuvenation"] = "Buff: My Récupération", --need check
		["Buff: My Regrowth"] = "Buff: My Rétablissement", --need check
		["Buff: My Lifebloom"] = "Buff: My Fleur de vie", --need check
		["Buff: Lifebloom Stack Colored"] = "Buff: Lifebloom Stack Colored", --need translation
		["Buff: My Wild Growth"] = "Buff: My Wild Growth", --need translation
		["Buff: My Sheath of Light"] = "Buff: My Sheath of Light", --need translation
		["Buff: My Glyph of Flash of Light"] = "Buff: My Glyph of Flash of Light", --need translation
		["Buff: My Riptide"] = "Buff: My Riptide", --need translation
		["Threshold to activate color 2"] = "Threshold to activate color 2", --need translation
		["Threshold to activate color 3"] = "Threshold to activate color 3", --need translation
		["Color 2"] = "Color 2", --need translation
		["Color 3"] = "Color 3", --need translation
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		["My HoTs"] = "我的 HoTs",
		["Renew"] = "恢复",
		["Rejuvenation"] = "回春术",
		["Regrowth"] = "愈合",
		["Lifebloom"] = "生命绽放",
		["Wild Growth"] = "野性成长",
		["Sheath of Light"] = "圣光出鞘",
		["Glyph of Flash of Light"] = "圣光闪现雕文",
		["Riptide"] = "激流",
		["Earthliving"] = "大地生命",
		["Buff: Hot Count"] = "增益：Hot 统计",
		["Buff: My Renew"] = "增益：我的恢复",
		["Buff: My Rejuvenation"] = "增益：我的回春",
		["Buff: My Regrowth"] = "增益：我的愈合",
		["Buff: My Lifebloom"] = "增益：我的生命绽放",
		["Buff: Lifebloom Stack Colored"] = "增益：生命绽放叠加染色",
		["Buff: My Wild Growth"] = "增益：我的野性成长",
		["Buff: My Sheath of Light"] = "增益：我的圣光出鞘",
		["Buff: My Glyph of Flash of Light"] = "增益：我的圣光闪现雕文",
		["Buff: My Riptide"] = "增益：我的激流",
		["Buff: My Earthliving"] = "增益：我的大地生命",
		["Prayer of Mending"] = "被治疗的玩家",
		["Beacon of Light"] = "圣光道标",
		["Grace Stack"] = "恩赐叠加",
		["Grace Duration + Stack"] = "恩赐持续及叠加",
		["Color when player has two counters of mending."] = "当玩家拥有两层治疗效果的时候染色",
		["Color when player has three counters of mending."] = "当玩家拥有三层治疗效果的时候染色",
		["Color when player has four counters of mending."] = "当玩家拥有四层治疗效果的时候染色",
		["Color when player has five counters of mending."] = "当玩家拥有五层治疗效果的时候染色",
		["Color when player has six counters of mending."] = "当玩家拥有六层治疗效果的时候染色",
		["Color when player has two counters of grace."] = "当玩家拥有两层恩赐的时候染色",
		["Color when player has three counters of grace."] = "当玩家拥有三层恩赐的时候染色",
		["Threshold to activate color 2"] = "启动颜色2临界值",
		["Threshold to activate color 3"] = "启动颜色3临界值",
		["Color 2"] = "颜色2",
		["Color 3"] = "颜色3",
		["Color 4"] = "颜色4",
		["Color 5"] = "颜色5",
		["Color 6"] = "颜色6",
		["Refresh frequency"] = "刷新频率",
		["Seconds between status refreshes"] = "两次状态刷新间的时间",
		["Count Lifebloom as 1 HoT per stack"] = "每层生命绽放统计为1Hot",
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= "勾选后,每层生命绽放将作为1个Hot来统计",
		["Show HoT-Counter"] = "显示Hot计数器",
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= "勾选后,在你的Hot冷却计数后可以看到总的Hot数量",
	}
end)

L:RegisterTranslations("zhTW", function()
	return {
		["My HoTs"] = "我的 HoTs",
		["Renew"] = "恢復",
		["Rejuvenation"] = "回春術",
		["Regrowth"] = "癒合",
		["Lifebloom"] = "生命之花",
		["Wild Growth"] = "野性成長",
		["Sheath of Light"] = "聖光之鞘",
		["Glyph of Flash of Light"] = "聖光閃現雕紋",
		["Riptide"] = "激流",
		["Earthliving"] = "大地生命",
		["Buff: Hot Count"] = "增益：HoT 數量",
		["Buff: My Renew"] = "增益：我的恢復",
		["Buff: My Rejuvenation"] = "增益：我的回春術",
		["Buff: My Regrowth"] = "增益：我的癒合",
		["Buff: My Lifebloom"] = "增益：我的生命之花",
		["Buff: Lifebloom Stack Colored"] = "增益：生命之花疊加染色",
		["Buff: My Wild Growth"] = "增益：我的野性成長",
		["Buff: My Sheath of Light"] = "增益：我的聖光之鞘",
		["Buff: My Glyph of Flash of Light"] = "增益：我的聖光閃現雕紋",
		["Buff: My Riptide"] = "增益：我的激流",
		["Buff: My Earthliving"] = "增益：我的大地生命",
		["Prayer of Mending"] = "被治療的玩家",
		["Beacon of Light"] = "聖光信標",
		["Grace Stack"] = "恩典疊加",
		["Grace Duration + Stack"] = "恩典持續及疊加",
		["Color when player has two counters of mending."] = "當玩家擁有兩層治療效果的時候染色",
		["Color when player has three counters of mending."] = "當玩家擁有三層治療效果的時候染色",
		["Color when player has four counters of mending."] = "當玩家擁有四層治療效果的時候染色",
		["Color when player has five counters of mending."] = "當玩家擁有五層治療效果的時候染色",
		["Color when player has six counters of mending."] = "當玩家擁有六層治療效果的時候染色",
		["Color when player has two counters of grace."] = "當玩家擁有兩層恩典的時候染色",
		["Color when player has three counters of grace."] = "當玩家擁有三層恩典的時候染色",
		["Threshold to activate color 2"] = "啟動顏色2階段值",
		["Threshold to activate color 3"] = "啟動顏色3階段值",
		["Color 2"] = "顏色2",
		["Color 3"] = "顏色3",
		["Color 4"] = "顏色4",
		["Color 5"] = "顏色5",
		["Color 6"] = "顏色6",
		["Refresh frequency"] = "刷新頻率",
		["Seconds between status refreshes"] = "兩次狀態刷新間的時間",
		["Count Lifebloom as 1 HoT per stack"] = "每層生命綻放統計為1Hot",
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= "勾選後,每層生命綻放將作為1個Hot來統計",
		["Show HoT-Counter"] = "顯示Hot計數器",
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= "勾選後,在你的Hot冷卻計數後可以看到總的Hot數量",
	}
end)

L:RegisterTranslations("ruRU", function()
	return {
		["My HoTs"] = "Мои ИзВ",
		["Renew"] = "Обновление",
		["Rejuvenation"] = "Омоложение",
		["Regrowth"] = "Восстановление",
		["Lifebloom"] = "Жизнецвет",
		["Wild Growth"] = "Буйный рост",
		["Sheath of Light"] = "Покров Света",
		["Glyph of Flash of Light"] = "Символ вспышки Света",
		["Riptide"] = "Быстрина",
		["Earthliving"] = "Жизнь Земли",
		["Buff: Hot Count"] = "Бафф: Счётчик ИзВ",
		["Buff: My Renew"] = "Бафф: Моё Обновление",
		["Buff: My Rejuvenation"] = "Бафф: Моё Омоложение",
		["Buff: My Regrowth"] = "Бафф: Моё Восстановление",
		["Buff: My Lifebloom"] = "Бафф: Мой Жизнецвет",
		["Buff: Lifebloom Stack Colored"] = "Бафф: Окраска пачки Жизнецвета",
		["Buff: My Wild Growth"] = "Бафф: Мой Буйный рост",
		["Buff: My Sheath of Light"] = "Бафф: Мой Покров Света",
		["Buff: My Glyph of Flash of Light"] = "Бафф: Мой Символ вспышки Света",
		["Buff: My Riptide"] = "Бафф: Моя Быстрина",
		["Buff: My Earthliving"] = "Бафф: Моя Жизнь Земли",
		["Prayer of Mending"] = "Молитва восстановления",
		["Beacon of Light"] = "Частица света",
		["Grace Stack"] = "Суммировка Милости",
		["Grace Duration + Stack"] = "Длительность Милости + сумма",
		["Color when player has two counters of mending."] = "Окраска когда игрок имеет 2 исправления",
		["Color when player has three counters of mending."] = "Окраска когда игрок имеет 3 исправления",
		["Color when player has four counters of mending."] = "Окраска когда игрок имеет 4 исправления",
		["Color when player has five counters of mending."] = "Окраска когда игрок имеет 5 исправления",
		["Color when player has six counters of mending."] = "Окраска когда игрок имеет 6 исправления",
		["Color when player has two counters of grace."] = "Окраска когда игрок имеет 2 Милости",
		["Color when player has three counters of grace."] = "Окраска когда игрок имеет 4 Милости",
		["Threshold to activate color 2"] = "Порог для цвета №2",
		["Threshold to activate color 3"] = "Пород для цвета №3",
		["Color 2"] = "Цвет №2",
		["Color 3"] = "Цвет №3",
		["Color 4"] = "Цвет №4",
		["Color 5"] = "Цвет №5",
		["Color 6"] = "Цвет №6",
		["Refresh frequency"] = "Частота обновления",
		["Seconds between status refreshes"] = "Секунд между обновлением статуса",
		["Count Lifebloom as 1 HoT per stack"] = "Считать Жизнецвет как 1 ИзВ",
		["Check, if you want each stack of Lifebloom to count as 1 HoT"]= "Отметьте, если вы хотите чтобы каждая пачка Жизнецвета считалась бы как 1 ИзВ.",
		["Show HoT-Counter"] = "Счётчик ИзВ",
		["Check, if you want to see the total of HoTs behind the countdown of your HoT(i.e. 13-5)"]= "Отметьте, если вы хотите видеть общее количество ваших ИзВ (прмр: 13-5)",
	}
end)
