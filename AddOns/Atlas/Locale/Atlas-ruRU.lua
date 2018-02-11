--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 - 2009 Dan Gilbert
	Email me at loglow@gmail.com

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]


-- Atlas Data Alpha (Russian)
-- Compiled by Eugene Filatov, bigoblin, StingerSoft
-- Last Update: 14.11.2008

if ( GetLocale() == "ruRU" ) then



AtlasSortIgnore = {"(.+)"};

ATLAS_TITLE = "Атлас";
ATLAS_SUBTITLE = "Обозреватель карт подземелий";
ATLAS_DESC = "Атлас это обозреватель карт подземелий.";

BINDING_HEADER_ATLAS_TITLE = "Сопоставления кнопок";
BINDING_NAME_ATLAS_TOGGLE = "Атлас";
BINDING_NAME_ATLAS_OPTIONS = "Настройки Атласа";
BINDING_NAME_ATLAS_AUTOSEL = "Авто-выбор поздемелья";

ATLAS_SLASH = "/atlas";
ATLAS_SLASH_OPTIONS = "options";

ATLAS_STRING_LOCATION = "Расположение";
ATLAS_STRING_LEVELRANGE = "Диапазон уровней";
ATLAS_STRING_PLAYERLIMIT = "Лимит игроков";
ATLAS_STRING_SELECT_CAT = "Выбор категории";
ATLAS_STRING_SELECT_MAP = "Выбор карты";
ATLAS_STRING_SEARCH = "Поиск";
ATLAS_STRING_CLEAR = "Сбросить";
ATLAS_STRING_MINLEVEL = "Минимальный уровень";

ATLAS_OPTIONS_BUTTON = "Настройки";
ATLAS_OPTIONS_SHOWBUT = "Показывать кнопку у мини-карты";
ATLAS_OPTIONS_AUTOSEL = "Автоматический выбор поздемелья";
ATLAS_OPTIONS_BUTPOS = "Расположение кнопки";
ATLAS_OPTIONS_TRANS = "Прозрачность";
ATLAS_OPTIONS_REPMAP = "Замена карты мира";
ATLAS_OPTIONS_RCLICK = "[Правая клавиша мыши] для показа карты мира";
ATLAS_OPTIONS_SHOWMAPNAME = "Отображать имя карты";
ATLAS_OPTIONS_RESETPOS = "Сбросить позиции";
ATLAS_OPTIONS_ACRONYMS = "Отображать короткие названия";
ATLAS_OPTIONS_SCALE = "Размер";
ATLAS_OPTIONS_BUTRAD = "Радиус расположения кнопки";
ATLAS_OPTIONS_CLAMPED = "Не заходить за размеры экрана";
ATLAS_OPTIONS_CTRL = "Удерживайте клавишу [Control] для сравнений";
ATLAS_OPTIONS_COORDS = "Показывать координаты на карте мира";

ATLAS_BUTTON_TOOLTIP_TITLE = "Атлас";
ATLAS_BUTTON_TOOLTIP_HINT = "[Левая клавиша мыши] открывает Атлас.\n[Средняя клавиша мыши], открывает настройки Атласа.\n[Правая клавиша мыши] + [перемещение] изменяет позицию кнопки Атласа.";
ATLAS_LDB_HINT = "[Левая клавиша мыши] открывает Атлас.\n[Правая клавиша мыши] открывает настройки Атласа.";

ATLAS_OPTIONS_CATDD = "Сортировать подземелья по:";
ATLAS_DDL_CONTINENT = "Контитенту";
ATLAS_DDL_CONTINENT_EASTERN = "Подземелья Восточных королевств";
ATLAS_DDL_CONTINENT_KALIMDOR = "Подземелья Калимдора";
ATLAS_DDL_CONTINENT_OUTLAND = "Подземелья Запределья";
ATLAS_DDL_CONTINENT_NORTHREND = "Подземелья Нордскола";
ATLAS_DDL_LEVEL = "Уровня";
ATLAS_DDL_LEVEL_UNDER45 = "Подземелья уровня ниже 45";
ATLAS_DDL_LEVEL_45TO60 = "Подземелья уровня 45-60";
ATLAS_DDL_LEVEL_60TO70 = "Подземелья уровня 60-70";
ATLAS_DDL_LEVEL_70TO80 = "Подземелья уровня 70-80";
ATLAS_DDL_LEVEL_80PLUS = "Подземелья уровня 80+";
ATLAS_DDL_PARTYSIZE = "Размеру группы";
ATLAS_DDL_PARTYSIZE_5_AC = "Подземелья на 5 игроков A-C";
ATLAS_DDL_PARTYSIZE_5_DZ = "Подземелья на 5 игроков D-Z";
ATLAS_DDL_PARTYSIZE_10 = "Подземелья на 10 игроков";
ATLAS_DDL_PARTYSIZE_20TO40 = "Подземелья на 20-40 игроков";
ATLAS_DDL_EXPANSION = "Дополнению";
ATLAS_DDL_EXPANSION_OLD_AO = "Подземелья Старого Мира A-O";
ATLAS_DDL_EXPANSION_OLD_PZ = "Подземелья Старого Мира P-Z";
ATLAS_DDL_EXPANSION_BC = "Подземелья Пылающего Крестового Похода";
ATLAS_DDL_EXPANSION_WOTLK = "Подземелья Wrath of the Lich King";
ATLAS_DDL_TYPE = "Типу";
ATLAS_DDL_TYPE_INSTANCE_AC = "Подземелья A-C";
ATLAS_DDL_TYPE_INSTANCE_DR = "Подземелья D-R";
ATLAS_DDL_TYPE_INSTANCE_SZ = "Подземелья S-Z";
ATLAS_DDL_TYPE_ENTRANCE = "Входы";

ATLAS_INSTANCE_BUTTON = "Подземелье";
ATLAS_ENTRANCE_BUTTON = "Вход";
ATLAS_SEARCH_UNAVAIL = "Поиск недоступен";
ATLAS_WORLDMAP_PLAYER = "Игрок";
ATLAS_WORLDMAP_CURSOR = "Курсор";

ATLAS_DEP_MSG1 = "Атлас обнаружил устаревший(е) модуль(и).";
ATLAS_DEP_MSG2 = "Они будут отключены для данного персонажа.";
ATLAS_DEP_MSG3 = "Удалите их из вашей папки аддонов.";
ATLAS_DEP_OK = "Ok";

AtlasZoneSubstitutions = {
	["The Temple of Atal'Hakkar"] = "Затонувший храм";
	["Ahn'Qiraj"] = "Храм Ан'Киража";
	["Karazhan"] = "Каражан [A] (Старт)";
	["Black Temple"] = "Черный храм [A] (Старт)";
}; 

AtlasLocale = {

--************************************************
-- Zone Names, Acronyms, and Common Strings
--************************************************

	--Common strings
	["Adult"] = "Взрослый";
	["AKA"] = "AKA";
	["Alliance"] = "Альянс";
	["Arcane Container"] = "Волшебный контейнер";
	["Argent Dawn"] = "Серебряный Рассвет";
	["Argent Crusade"] = "Серебряный Авангард";
	["Arms Warrior"] = "Воин-Оружия";
	["Attunement Required"] = "Необходима подготавка";
	["Back"] = "Назад";
	["Basement"] = "Подвал";
	["Bat"] = "Летучая мышь";
	["Blacksmithing Plans"] = "Чертежи кузнечного дела";
	["Boss"] = "Босс";
	["Brazier of Invocation"] = "Жаровня Вызова";
	["Brewfest"] = "Праздника пива";
	["Chase Begins"] = "Начало охоты";
	["Chase Ends"] = "Конец охоты";
	["Child"] = "Ребенок";
	["Connection"] = "Связан";
	["DS2"] = "DS2";
	["East"] = "Восток";
	["Elevator"] = "Лифт";
	["End"] = "Конец";
	["Engineer"] = "Инженер";
	["Entrance"] = "Вход";
	["Event"] = "Событие";
	["Exalted"] = "Превознесение";
	["Exit"] = "Выход";
	["Fourth Stop"] = "Четвертая остановка";
	["Front"] = "Передний";
	["Ghost"] = "Призрак";
	["Hallow's End"] = "Тыква";
	["Heroic"] = "Героический";
	["Holy Paladin"] = "Паладин-Света";
	["Holy Priest"] = "Жрец-Света";
	["Horde"] = "Орда";
	["Hunter"] = "Охотник";
	["Imp"] = "Бесс";
	["Inside"] = "Внутри";
	["Key"] = "Ключ";
	["Lower"] = "Нижний";
	["Lunar"] = "Лунный";
	["Mage"] = "Маг";
	["Meeting Stone"] = "Камень встреч";
	["Monk"] = "Монах";
	["Moonwell"] = "Лунный колодец";
	["North"] = "Север";
	["Optional"] = "Необяз.";
	["Orange"] = "Оранжевый";
	["Outside"] = "Снаружи";
	["Paladin"] = "Паладин";
	["Panther"] = "Пантера";
	["Portal"] = "Портал";
	["Priest"] = "Жрец";
	["Protection Warrior"] = "Воин-Защиты";
	["Purple"] = "Пурпурный";
	["Random"] = "Случайный";
	["Raptor"] = "Ящер";
	["Rare"] = "Редкий";
	["Reputation"] = "Репа";
	["Repair"] = "Починка";
	["Retribution Paladin"] = "Паладин-Возмездия";
	["Rewards"] = "Награды";
	["Rogue"] = "Разбойник";
	["Second Stop"] = "Вторая остановка";
	["Shadow Priest"] = "Жрец-Темной магии";
	["Shaman"] = "Шаман";
	["Side"] = "Сторона";
	["Snake"] = "Змея";
	["Spawn Point"] = "Точка рождения";
	["Spider"] = "Паук";
	["Start"] = "Начало";
	["Summon"] = "Вызов";
	["Teleporter"] = "Телепорт";
	["Third Stop"] = "Третья остановка";
	["Tiger"] = "Тигр";
	["Top"] = "Верхний";
	["Undead"] = "Нежить";
	["Underwater"] = "Подводный";
	["Unknown"] = "Неизвестный";
	["Upper"] = "Верхний";
	["Varies"] = "Изменяется";
	["Wanders"] = "Странник";
	["Warlock"] = "Чернокнижник";
	["Warrior"] = "Воин";
	["Wave 6"] = "6-ая волна";
	["Wave 10"] = "10-ая волна";
	["Wave 12"] = "12-ая волна";
	["Wave 18"] = "18-ая волна";
	["West"] = "Запад";
	
	--Instance names and acronyms
	["Ahn'kahet: The Old Kingdom"] = "Ан'кахет: Старое Королевство";
	["Ahn'Qiraj"] = "Ан'Кираж"; ["AQ"] = "АКУ";
	["Armory"] = "Оружейная";
	["Auchenai Crypts"] = "Аукенайские гробницы"; ["AC"] = "АГ";
	["Auchindoun"] = "Аукиндон"; ["Auch"] = "Аук";
	["Azjol-Nerub"] = "Азжол-Неруб"; ["AN"] = "АН";
	["Black Temple"] = "Черный Храм"; ["BT"] = "ЧХ";
	["Blackfathom Deeps"] = "Непроглядная Пучина"; ["BFD"] = "НП";
	["Blackrock Depths"] = "Глубины Черной горы"; ["BRD"] = "ГЧГ";
	["Blackrock Spire"] = "Вершина Черной горы"; ["LBRS"] = "НЧГ"; ["UBRS"] = "ВЧГ";
	["Blackwing Lair"] = "Логово Крыла Тьмы"; ["BWL"] = "ЛКТ";
	["Cathedral"] = "Собор"; ["Cath"] = "Соб";
	["Caverns of Time"] = "Пещеры Времени"; ["CoT"] = "ПВ";
	["Chamber of Aspects"] = "Комната духов";
	["Coilfang Reservoir"] = "Резервуар Кривого Клыка"; ["CR"] = "РКК";
	["Dire Maul"] = "Забытый Город"; ["DM"] = "ЗГ";
	["Drak'Tharon Keep"] = "Крепость Драк'Тарон";
	["Gnomeregan"] = "Гномреган"; ["Gnome"] = "Гном";
	["Graveyard"] = "Кладбище"; ["GY"] = "Кл";
	["Gruul's Lair"] = "Логово Груула"; ["GL"] = "Груль";
	["Gundrak"] = "Гундрак";
	["Halls of Stone"] = "Чертоги Камня";
	["Halls of Lightning"] = "Чертоги Молний";
	["Hellfire Citadel"] = "Цитадель Адского Пламени"; ["HFC"] = "ЦАП";
	["Hellfire Ramparts"] = "Бастионы Адского Пламени"; ["Ramp"] = "Баст";
	["Hyjal Summit"] = "Вершина Хиджала"; ["CoT3"] = "ПВ3";
	["Karazhan"] = "Каражан"; ["Kara"] = "Кара";
	["Library"] = "Библиотека"; ["Lib"] = "Биб";
	["Magisters' Terrace"] = "Терраса Магистров"; ["MT"] = "ТМ";
	["Magtheridon's Lair"] = "Логово Магтеридона"; ["Mag"] = "Магги";
	["Mana-Tombs"] = "Гробницы Маны"; ["MT"] = "ГМ";
	["Maraudon"] = "Мародон"; ["Mara"] = "Маро";
	["Molten Core"] = "Огненные Недра"; ["MC"] = "ОН";
	["Naxxramas"] = "Наксрамас"; ["Nax"] = "Накс";
	["Old Hillsbrad Foothills"] = "Старые предгорья Хилсбрада"; ["CoT1"] = "ПВ1";
	["Onyxia's Lair"] = "Логово Ониксии"; ["Ony"] = "Они";
	["Ragefire Chasm"] = "Огненная пропасть"; ["RFC"] = "ОгП";
	["Razorfen Downs"] = "Курганы Иглошкурых"; ["RFD"] = "Курганы";
	["Razorfen Kraul"] = "Лабиринты Иглошкурых"; ["RFK"] = "ЛабИ";
	["Ruins of Ahn'Qiraj"] = "Руины Ан'Киража"; ["AQ20"] = "АКУ20";
	["Scarlet Monastery"] = "Монастырь Алого ордена"; ["SM"] = "Мон";
	["Scholomance"] = "Некроситет"; ["Scholo"] = "Некро";
	["Serpentshrine Cavern"] = "Змеиное святилище"; ["SC"] = "ЗС";
	["Sethekk Halls"] = "Сетеккские залы"; ["Seth"] = "Сетекк";
	["Shadow Labyrinth"] = "Темный Лабиринт"; ["SL"] = "ТЛ";
	["Shadowfang Keep"] = "Крепость Темного Клыка"; ["SFK"] = "КТК";
	["Stratholme"] = "Стратхольм"; ["Strat"] = "Страт";
	["Stratholme Past"] = "Очищение Стратхольма";
	["Sunken Temple"] = "Затонувший храм"; ["ST"] = "ЗХ";
	["Sunwell Plateau"] = "Солнечный Колодец"; ["SP"] = "СК";
	["Tempest Keep"] = "Крепость Бурь"; ["TK"] = "КБ";
	["Temple of Ahn'Qiraj"] = "Храм Ан'Киража"; ["AQ40"] = "АКУ40";
	["The Arcatraz"] = "Аркатрац"; ["Arca"] = "Арка";
	["The Black Morass"] = "Черные топи"; ["CoT2"] = "ПВ2";
	["The Blood Furnace"] = "Кузня Крови"; ["BF"] = "КК";
	["The Botanica"] = "Ботаника"; ["Bota"] = "Бота";
	["The Deadmines"] = "Мертвые копи"; ["VC"] = "МК";
	["The Eye"] = "Око"; ["Eye"] = "Око";
	["The Eye of Eternity"] = "Око Вечности";
	["The Mechanar"] = "Механар"; ["Mech"] = "Мех";
	["The Nexus"] = "Нексус";
	["The Obsidian Sanctum"] = "Обсидиановое святилище";
	["The Oculus"] = "Окулус";
	["The Shattered Halls"] = "Разрушенные залы"; ["SH"] = "РЗ";
	["The Slave Pens"] = "Узилище"; ["SP"] = "Узи";
	["The Steamvault"] = "Паровое Подземелье"; ["SV"] = "ПП";
	["The Stockade"] = "Тюрьма"; ["Stocks"] = "Тюрьма";
	["The Underbog"] = "Нижетопь"; ["UB"] = "НТ";
	["The Violet Hold"] = "Аметистовая крепость";
	["Uldaman"] = "Ульдаман"; ["Ulda"] = "Ульд";
	["Ulduar"] = "Ульдуар";
	["Utgarde Keep"] = "Крепость Утгард";
	["Utgarde Pinnacle"] = "Вершина Утгард";
	["Vault of Archavon"] = "Склеп Аркавона";
	["Wailing Caverns"] = "Пещеры Стенаний"; ["WC"] = "ПС";
	["Zul'Aman"] = "Зул'Аман"; ["ZA"] = "ЗА";
	["Zul'Farrak"] = "Зул'Фаррак"; ["ZF"] = "ЗФ";
	["Zul'Gurub"] = "Зул'Гуруб"; ["ZG"] = "ЗГ";
	
	--WotLK Acronyms
	["AN, Nerub"] = "АЖ, Неруб";
	["Strat, CoT-Strat"] = "Страт, ПВ-Страт";
	["DTK"] = "КДТ";
	["Gun"] = "Гун";
	["HoS"] = "ЧК";
	["HoL"] = "ЧМ";
	["OS"] = "ОС"; -- Обсидиановое святилище
	["UK, Keep"] = "УК, Крепость"; -- Крепость Утгард
	["UP, Pinn"] = "УВ, Вершина"; -- Вершина Утгард
	["Nex, Nexus"] = "Некс, Нексус"; 
	["AK, Kahet"] = "АК, Кахет"; -- Ан'кахет
	["VH"] = "АМК"; -- Аметистовая крепость
	["Ocu"] = "Оку"; -- Окулус
	["VoA"] = "Склеп"; -- Склеп Аркавона
	["TEoE"] = "ОВ"; -- Око Вечности
	["Uldu"] = "Ульда"; -- Ульдуар
	
	--Continents
	["Eastern Kingdoms"] = "Восточные королевства";
	["Kalimdor"] = "Калимдор";
	["Outland"] = "Запределье";
	["Northrend"] = "Нордскол";
	
	--Outdoor zones, Locations
	["Ashenvale"] = "Ясеневый лес";
	["Badlands"] = "Бесплодные земли";
	["Blackrock Mountain"] = "Черная гора"; ["BRM"] = "ЧГ";
	["Blade's Edge Mountains"] = "Острогорье";
	["Borean Tundra"] = "Борейская тундра";
	["Burning Steppes"] = "Пылающие степи";
	["Dalaran"] = "Даларан";
	["Deadwind Pass"] = "Перевал Мертвого Ветра";
	["Desolace"] = "Пустоши";
	["Dragonblight"] = "Драконий Погост";
	["Dun Morogh"] = "Дун Морог";
	["Dustwallow Marsh"] = "Пылевые топи";
	["Eastern Plaguelands"] = "Восточное Лихоземье";
	["Feralas"] = "Фералас";
	["Ghostlands"] = "Призрачные земли";
	["Grizzly Hills"] = "Седые холмы";
	["Hellfire Peninsula"] = "Полуостров Адского Пламени";
	["Howling Fjord"] = "Ревущий фьорд";
	["Isle of Quel'Danas"] = "Остров Кель'Данас";
	["Netherstorm"] = "Пустоверть";
	["Orgrimmar"] = "Оргриммар";
	["Searing Gorge"] = "Тлеющее ущелье";
	["Shadowmoon Valley"] = "Долина Призрачной Луны";
	["Silithus"] = "Силитус";
	["Silverpine Forest"] = "Серебряный бор";
	["Stormwind City"] = "Штормград";
	["Stranglethorn Vale"] = "Тернистая долина";
	["Swamp of Sorrows"] = "Болото Печали";
	["Tanaris"] = "Танарис";
	["Terokkar Forest"] = "Лес Тероккар";
	["The Barrens"] = "Степи";
	["The Storm Peaks"] = "Грозовая Гряда";
	["Tirisfal Glades"] = "Тирисфальские леса";
	["Western Plaguelands"] = "Западное Лихоземье";
	["Westfall"] = "Западный Край";
	["Wintergrasp"] = "Озеро Ледяных Оков";
	["Zangarmarsh"] = "Зангартопь";
	["Zul'Drak"] = "Зул'Драк";

--************************************************
-- Kalimdor Instance Data
--************************************************

	--Ragefire Chasm
	["Maur Grimtotem"] = "Маур Зловещий Тотем";
	["Oggleflint <Ragefire Chieftain>"] = "Огглфлинт <Вождь племени Бушующего Пламени>";
	["Taragaman the Hungerer"] = "Тарагаман Ненасытный";
	["Jergosh the Invoker"] = "Жергош Призыватель Духов";
	["Zelemar the Wrathful"] = "Зелемар Гневный";
	["Bazzalan"] = "Баззалан";
	
	--Wailing Caverns
	["Disciple of Naralex"] = "Послушник Наралекса";
	["Lord Cobrahn <Fanglord>"] = "Лорд Кобран <Владыка змей>";
	["Lady Anacondra <Fanglord>"] = "Повелительница Анакондра <Владыка змей>";
	["Kresh"] = "Криг";
	["Lord Pythas <Fanglord>"] = "Лорд Питонас <Владыка змей>";
	["Skum"] = "Шкам";
	["Lord Serpentis <Fanglord>"] = "Лорд Серпентис <Владыка змей>";
	["Verdan the Everliving"] = "Вердан Бессмертный";
	["Mutanus the Devourer"] = "Мутанус Пожиратель";
	["Naralex"] = "Наралекс";
	["Deviate Faerie Dragon"] = "Загадочный волшебный дракон";
	
	--Blackfathom Deeps 
	["Ghamoo-ra"] = "Гхаму-ра";
	["Lorgalis Manuscript"] = "Манускрипт Лоргалиса";
	["Lady Sarevess"] = "Леди Саревесс";
	["Argent Guard Thaelrid <The Argent Dawn>"] = "Страж Талрид <Серебряный Рассвет >";
	["Gelihast"] = "Гелихаст";
	["Shrine of Gelihast"] = "Святыня Гелихастa";
	["Lorgus Jett"] = "Лоргус Джетт";
	["Fathom Stone"] = "Глубинный Камень";
	["Baron Aquanis"] = "Барон Акванис";
	["Twilight Lord Kelris"] = "Повелитель сумрака Келрис";
	["Old Serra'kis"] = "Старина Серракис";
	["Aku'mai"] = "Аку'май";
	["Morridune"] = "Морридан";
	["Altar of the Deeps"] = "Алтарь пучины";
	
	--Razorfen Kraul
	["Roogug"] = "Ругуг";
	["Aggem Thorncurse <Death's Head Prophet>"] = "Аггем Терновое Проклятие <Пророк племени Мертовой Головы >";
	["Death Speaker Jargba <Death's Head Captain>"] = "Вестник смерти Джаргба <Капитан племени Мертвой Головы>";
	["Overlord Ramtusk"] = "Властитель Таранный Клык";
	["Razorfen Spearhide"] = "Копьешкур из племени Иглошкурых";
	["Agathelos the Raging"] = "Агателос Свирепый";
	["Blind Hunter"] = "Слепой охотник";
	["Charlga Razorflank <The Crone>"] = "Чарлга Остробок <Ведьма>";
	["Willix the Importer"] = "Импортер Вилликс";
	["Heralath Fallowbrook"] = "Гералат Бурый Ручей";
	["Earthcaller Halmgar"] = "Заклинательница земли Халмгар";

	--Razorfen Downs
	["Tuten'kash"] = "Тутен'каш";
	["Henry Stern"] = "Генри Штерн";
	["Belnistrasz"] = "Белнистраз";
	["Sah'rhee"] = "Сах-ри";
	["Mordresh Fire Eye"] = "Мордреш Огненный Глаз";
	["Glutton"] = "Обжора";
	["Ragglesnout"] = "Круглорыл";
	["Amnennar the Coldbringer"] = "Амненнар Хладовей";
	["Plaguemaw the Rotting"] = "Чумобрюх Гнилой";
	
	--Zul'Farrak
	["Mallet of Zul'Farrak"] = "Создание молота Зул'Фаррака";
	["Antu'sul <Overseer of Sul>"] = "Анту'сул <Надсмотрщик Сула>";
	["Theka the Martyr"] = "Тека Мученик";
	["Witch Doctor Zum'rah"] = "Знахарь Зум'рах";
	["Zul'Farrak Dead Hero"] = "Мертвый герой Зул'Фаррака";
	["Nekrum Gutchewer"] = "Некрум Кишкожуй";
	["Shadowpriest Sezz'ziz"] = "Темный жрец Шезз'зиз";
	["Dustwraith"] = "Пыльный призрак";
	["Sergeant Bly"] = "Сержант Блай";
	["Weegli Blastfuse"] = "Вигиль Фитиль";
	["Murta Grimgut"] = "Мурта Мрачнобрюх";
	["Raven"] = "Ворон";
	["Oro Eyegouge"] = "Оро Вырвиглаз";
	["Sandfury Executioner"] = "Палач из клана Песчаной Бури";
	["Hydromancer Velratha"] = "Гидромант Велрата";
	["Gahz'rilla"] = "Газ'рилла";
	["Elder Wildmane"] = "Старейшина Дикая Грива ";
	["Chief Ukorz Sandscalp"] = "Вождь Укорз Песчаная Плешь";
	["Ruuzlu"] = "Руузлу";
	["Zerillis"] = "Зериллис";
	["Sandarr Dunereaver"] = "Сандарр Разоритель Барханов";
	
	--Maraudon	
	["Scepter of Celebras"] = "Скипетр Келебраса ";
	["Veng <The Fifth Khan>"] = "Венг <Пятый хан>";
	["Noxxion"] = "Ноксион";
	["Razorlash"] = "Бритвохлест";
	["Maraudos <The Fourth Khan>"] = "Мародос <Четвертый хан>";
	["Lord Vyletongue"] = "Лорд Злоязыкий";
	["Meshlok the Harvester"] = "Мешлок Жнец";
	["Celebras the Cursed"] = "Селебрас Проклятый";
	["Landslide"] = "Сель";
	["Tinkerer Gizlock"] = "Ремонтник Гизлок";
	["Rotgrip"] = "Гнилопасть";
	["Princess Theradras"] = "Принцесса Терадрас";
	["Elder Splitrock"] = "Старейшина Камнепад ";
	
	--Dire Maul (East)
	["Pusillin"] = "Пузиллин";
	["Zevrim Thornhoof"] = "Зеврим Терновое Копыто";
	["Hydrospawn"] = "Гидротварь";
	["Lethtendris"] = "Лефтендрис";
	["Pimgib"] = "Пимгиб";
	["Old Ironbark"] = "Старик Железной Коры";
	["Alzzin the Wildshaper"] = "Алззин Перевертень";
	["Isalien"] = "Изалиен";
	
	--Dire Maul (North)
	["Crescent Key"] = "Серповидный ключ";--omitted from Dire Maul (West)
	--"Library" omitted from here and DM West because of SM: "Library" duplicate
	["Guard Mol'dar"] = "Стражник Мол'дар";
	["Stomper Kreeg <The Drunk>"] = "Топотун Криг";
	["Guard Fengus"] = "Стражник Фенгус";
	["Knot Thimblejack"] = "Уззл Наперстяк";
	["Guard Slip'kik"] = "Стражник Слип'кик";
	["Captain Kromcrush"] = "Капитан Давигром";
	["King Gordok"] = "Король Гордок";
	["Cho'Rush the Observer"] = "Чо'Раш Наблюдатель";

	--Dire Maul (West)
	["J'eevee's Jar"] = "Флакон Д'жииви";
	["Pylons"] = "Опоры";
	["Shen'dralar Ancient"] = "Прародительница Шен'дралар";
	["Tendris Warpwood"] = "Тендрис Криводрев";
	["Ancient Equine Spirit"] = "Дух древнего коня";
	["Illyanna Ravenoak"] = "Иллиана Воронья Ольха";
	["Ferra"] = "Ферра";
	["Magister Kalendris"] = "Магистр Календрисs";
	["Tsu'zee"] = "Цу'зи";
	["Immol'thar"] = "Бессмер'тер";
	["Lord Hel'nurath"] = "Лорд Хел'нурат";
	["Prince Tortheldrin"] = "Принц Тортелдрин";
	["Falrin Treeshaper"] = "Фалрин Садовник";
	["Lorekeeper Lydros"] = "Сказитель Лидрос";
	["Lorekeeper Javon"] = " Сказитель Явон";
	["Lorekeeper Kildrath"] = "Сказитель Килдрат";
	["Lorekeeper Mykos"] = "Сказительница Микос";
	["Shen'dralar Provisioner"] = "Шен'драларский поставщик";
	["Skeletal Remains of Kariel Winthalus"] = "Скелет Кариэля Винтхалуса";
	
	--Onyxia's Lair
	["Drakefire Amulet"] = "Амулет Пламени дракона";
	["Onyxian Warders"] = "Хранитель Ониксии";
	["Whelp Eggs"] = "Яйца Щенка";
	["Onyxia"] = "Ониксия";

	--Temple of Ahn'Qiraj
	["Brood of Nozdormu"] = "Род Ноздорму";
	["The Prophet Skeram"] = "Пророк Скерам";
	["The Bug Family"] = "Ошибка семьи";
	["Vem"] = "Вем";
	["Lord Kri"] = "Лорд Кри";
	["Princess Yauj"] = "Принцесса Яудж";
	["Battleguard Sartura"] = "Боевой страж Сартура";
	["Fankriss the Unyielding"] = "Фанкрисс Непреклонный";
	["Viscidus"] = "Нечистотa";
	["Princess Huhuran"] = "Принцесса Хухуран";
	["Twin Emperors"] = "Близнецы Императоры";
	["Emperor Vek'lor"] = "Император Век'лор";
	["Emperor Vek'nilash"] = "Император Век'нилаш";
	["Ouro"] = "Оуро";
	["Eye of C'Thun"] = "Око К-Туна";
	["C'Thun"] = "К-Тун";
	["Andorgos <Brood of Malygos>"] = "Андоргос <Род Малигоса>";
	["Vethsera <Brood of Ysera>"] = "Ветсера <Род Изеры >";
	["Kandrostrasz <Brood of Alexstrasza>"] = "Кандострас <Племя Алекстразы>";
	["Arygos"] = "Аригос";
	["Caelestrasz"] = "Келестраз";
	["Merithra of the Dream"] = "Меритра из Сна";
	
	--Ruins of Ahn'Qiraj
	["Cenarion Circle"] = "Служители Ценариона";
	["Kurinnaxx"] = "Куриннакса";
	["Lieutenant General Andorov"] = "Генерал-лейтенант Андоров";
	["Four Kaldorei Elites"] = "4 Кальдорайских гвардейцев";
	["General Rajaxx"] = "Генерал Раджакс";
	["Captain Qeez"] = "Капитан Квиз";
	["Captain Tuubid"] = "Капитан Туубид";
	["Captain Drenn"] = "Капитан Дренн";
	["Captain Xurrem"] = "Капитан Ксуррем";
	["Major Yeggeth"] = "Майор Йеггет";
	["Major Pakkon"] = "Майор Паккон";
	["Colonel Zerran"] = "Полковник Зерран";
	["Moam"] = "Моам";
	["Buru the Gorger"] = "Буру Ненасытный";
	["Ayamiss the Hunter"] = "Аямисса Охотница";
	["Ossirian the Unscarred"] = "Оссириан Неуязвимый";
	["Safe Room"] = "Безопасная Комната";

	--CoT: The Black Morass
	["Opening of the Dark Portal"] = "Открытие Темных врат";
	["Keepers of Time"] = "Хранители Времени";--omitted from Old Hillsbrad Foothills
	["Key of Time"] = "Ключ Времени";--omitted from Old Hillsbrad Foothills
	["Sa'at <Keepers of Time>"] = "Са'ат <Хранители Времени>";
	["Chrono Lord Deja"] = "Повелитель времени Дежа";
	["Temporus"] = "Темпорус";
	["Aeonus"] = "Эонус";
	["The Dark Portal"] = "Темный портал";
	["Medivh"] = "Медив";

	--CoT: Hyjal Summit
	["Battle for Mount Hyjal"] = "Битва за Гору Хиджала";
	["The Scale of the Sands"] = "Песчаная Чешуя";
	["Alliance Base"] = "База Альянса";
	["Lady Jaina Proudmoore"] = "Леди Джайна Праудмур";
	["Horde Encampment"] = "Стоянка орды";
	["Thrall <Warchief>"] = "Тралл <Вождь>";
	["Night Elf Village"] = "Деревня Ночных эльфов";
	["Tyrande Whisperwind <High Priestess of Elune>"] = "Тиранда Шелест Ветра <Верховная жрица Элуны>";
	["Rage Winterchill"] = "Лютый Хлад";
	["Anetheron"] = "Анетерон";
	["Kaz'rogal"] = "Каз'рогал";
	["Azgalor"] = "Азгалор";
	["Archimonde"] = "Архимонд";
	["Indormi <Keeper of Ancient Gem Lore>"] = "Индорми <Хранитель знаний о древних самоцветах>";
	["Tydormu <Keeper of Lost Artifacts>"] = "Тайдорму <Хранитель утраченных артефактов>";

	--CoT: Old Hillsbrad Foothills
	["Escape from Durnholde Keep"] = "Побег из Крепости Дарнхольда";
	["Erozion"] = "Эрозион";
	["Brazen"] = "Бронзень";
	["Landing Spot"] = "Место высадки";
	["Southshore"] = "Южнобережье";
	["Tarren Mill"] = "Mельницa Таррен";
	["Lieutenant Drake"] = "Лейтенант Дрейк";
	["Thrall"] = "Раб";
	["Captain Skarloc"] = "Капитан Скарлок";
	["Epoch Hunter"] = "Охотник Вечности";
	["Taretha"] = "Тарета";
	["Jonathan Revah"] = "Джонатан Рева";
	["Jerry Carter"] = "Джерри Картер";
	["Traveling"] = "Странствующий";
	["Thomas Yance <Travelling Salesman>"] = "Томас Янс <Странствующий торговец>";
	["Aged Dalaran Wizard"] = "Даларанский старый волшебник";
	["Kel'Thuzad <The Kirin Tor>"] = "Кел'Тузад <Кирин Тор>";
	["Helcular"] = "Гелькулар";
	["Farmer Kent"] = "Фермер Кент";
	["Sally Whitemane"] = "Сэлли Белогрив";
	["Renault Mograine"] = "Рено Могрейн";
	["Little Jimmy Vishas"] = "Малыш Джимми Вишас";
	["Herod the Bully"] = "Герод Забияка";
	["Nat Pagle"] = "Нат Пэгл";
	["Hal McAllister"] = "Хал Макаллистер";
	["Zixil <Aspiring Merchant>"] = "Зиксель <Знаменитый купец>";
	["Overwatch Mark 0 <Protector>"] = "Суперсторож, модель 0 <Заступник>";
	["Southshore Inn"] = "Дома южнобережья";
	["Captain Edward Hanes"] = "Капитан Эдвард Хейнс";
	["Captain Sanders"] = "Капитан Сандерс";
	["Commander Mograine"] = "Командир Могрейн";
	["Isillien"] = "Изиллиен";
	["Abbendis"] = "Аббендис";
	["Fairbanks"] = "Фэйрбанкс";
	["Tirion Fordring"] = "Тирион Фордринг";
	["Arcanist Doan"] = "Чародей Доан";
	["Taelan"] = "Таэлан";
	["Barkeep Kelly <Bartender>"] = "Кабатчик Келли <Бармен>";
	["Frances Lin <Barmaid>"] = "Франс Лин <Официантка>";
	["Chef Jessen <Speciality Meat & Slop>"] = "Шеф-повар Джессен <Деликатесное мясо и похлебки>";
	["Stalvan Mistmantle"] = "Сталван Мистмантл";
	["Phin Odelic <The Kirin Tor>"] = "Фин Оделик <Кирин Тор>";
	["Southshore Town Hall"] = "Ратуша южнобережья";
	["Magistrate Henry Maleb"] = "Мировой судья Генри Малеб";
	["Raleigh the True"] = "Роли Истинный";
	["Nathanos Marris"] = "Натанос Маррис";
	["Bilger the Straight-laced"] = "Бочкопуз Крепкосбитый";
	["Innkeeper Monica"] = "Хозяйка таверны Моника";
	["Julie Honeywell"] = "Джули Медовушка";
	["Jay Lemieux"] = "Джей Лемье";
	["Young Blanchy"] = "Молодая Савраска";
	["Don Carlos"] = "Дон Карлос";
	["Guerrero"] = "Герреро";
	
--****************************
-- Eastern Kingdoms Instances
--****************************
	
	--Blackrock Depths
	["Shadowforge Key"] = "Ключ Кузни Теней";
	["Prison Cell Key"] = "Ключ от тюремной камеры";
	["Jail Break!"] = "Побег!";
	["Banner of Provocation"] = "Знамя Вызова";
	["Lord Roccor"] = "Лорд Роккор";
	["Kharan Mighthammer"] = "Каран Могучий Молот";
	["Commander Gor'shak <Kargath Expeditionary Force>"] = "Командир Гор'шак <Каргатский экспедиционный корпус>";
	["Marshal Windsor"] = "Маршал Винздор";
	["High Interrogator Gerstahn <Twilight's Hammer Interrogator>"] = "Верховный дознаватель Герштан <Дознаватель культа Сумеречного Молота>";
	["Ring of Law"] = "Круг закона";
	["Anub'shiah"] = "Ануб'шиа";
	["Eviscerator"] = "Потрошитель";
	["Gorosh the Dervish"] = "Горош Дервиш";
	["Grizzle"] = "Гриззл";
	["Hedrum the Creeper"] = "Хедрум Ползун";
	["Ok'thor the Breaker"] = "Ок'тор Разрушитель";
	["Theldren"] = "Телдрен";
	["Lefty"] = "Левша";
	["Malgen Longspear"] = "Мальген Длинное Копье";
	["Gnashjaw <Malgen Longspear's Pet>"] = "Зубощелка <Питомец Мальгена>";
	["Rotfang"] = "Гнилоклык";
	["Va'jashni"] = "Ва'джашни";
	["Houndmaster Grebmar"] = "Псарь Гребмар";
	["Elder Morndeep"] = "Старейшина Рассветень";
	["High Justice Grimstone"] = "Верховный судья Мрачнокамень";
	["Monument of Franclorn Forgewright"] = "Монумент Франклорну Искуснику";
	["Pyromancer Loregrain"] = "Пироман Зерно Мудрости";
	["The Vault"] = "Подземелье";
	["Warder Stilgiss"] = "Тюремщик Стилгисс";
	["Verek"] = "Верек";
	["Watchman Doomgrip"] = "Сторож Хватка Смерти";
	["Fineous Darkvire <Chief Architect>"] = "Точень Темнострой <Главный архитектор>";
	["The Black Anvil"] = "Черная наковальня";
	["Lord Incendius"] = "Лорд Опалитель";
	["Bael'Gar"] = "Бейл'Гор";
	["Shadowforge Lock"] = "Замок Кузни Теней";
	["General Angerforge"] = "Генерал Кузня Гнева";
	["Golem Lord Argelmach"] = "Повелитель големов Аргелмах";
	["Field Repair Bot 74A"] = "Ремонтный полевой робот 74A";
	["The Grim Guzzler"] = "Угрюмые обжоры";
	["Hurley Blackbreath"] = "Харли Пьянодых";
	["Lokhtos Darkbargainer <The Thorium Brotherhood>"] = "Локтос Зловещий Торговец <Братство Тория>";
	["Mistress Nagmara"] = "Госпожа Нагмара";
	["Phalanx"] = "Фаланкс";
	["Plugger Spazzring"] = "Штоппор Наливалс";
	["Private Rocknot"] = "Рядовой Камнеузл";
	["Ribbly Screwspigot"] = "Риббли Крутипроб";
	["Coren Direbrew"] = "Корен Худовар";
	["Griz Gutshank <Arena Vendor>"] = "Гриз Потрошмяк <Продавец экипировки арены>";
	["Ambassador Flamelash"] = "Посол Огнехлыст";
	["Panzor the Invincible"] = "Панцер Непобедимый";
	["Summoner's Tomb"] = "Гробница Призывателей";
	["The Lyceum"] = "Лекторий";
	["Magmus"] = "Магмус";
	["Emperor Dagran Thaurissan"] = "Император Дагран Тауриссан";
	["Princess Moira Bronzebeard <Princess of Ironforge>"] = "Принцесса Мойра Бронзобород <Принцесса Стальгорна>";
	["High Priestess of Thaurissan"] = "Верховная жрица Тауриссана";
	["The Black Forge"] = "Черная Кузня";
	["Core Fragment"] = "Осколок из Огненных Недр";
	["Overmaster Pyron"] = "Подчинитель Пирон";

	--Blackrock Spire (Lower)
	["Vaelan"] = "Ваелан";
	["Warosh <The Cursed>"] = "Варош <Проклятый >";
	["Elder Stonefort"] = "Старейшина Камнеград";
	["Roughshod Pike"] = "Наконечник Грубой силы ";
	["Spirestone Butcher"] = "Мясник из клана Черной Вершины";
	["Highlord Omokk"] = "Вождь Омокк";
	["Spirestone Battle Lord"] = "Полководец из клана Черной Вершины";
	["Spirestone Lord Magus"] = "Лорд-волхв из клана Черной Вершины";
	["Shadow Hunter Vosh'gajin"] = "Темная охотница Вос'гаджин";
	["Fifth Mosh'aru Tablet"] = "Пятая табличка Мошару";
	["Bijou"] = "Блестяшка";
	["War Master Voone"] = "Воевода Вун";
	["Mor Grayhoof"] = "Мор Серое Копыто";
	["Sixth Mosh'aru Tablet"] = "Шестая табличка Мошару";
	["Bijou's Belongings"] = "Вещи Блестяшки";
	["Human Remains"] = "Человеческие останки";
	["Unfired Plate Gauntlets"] = "Неопалимые латные рукавицы";
	["Bannok Grimaxe <Firebrand Legion Champion>"] = "Баннок Люторез <Герой легиона Огненного Клейма>";
	["Mother Smolderweb"] = "Мать Дымная Паутина";
	["Crystal Fang"] = "Хрустальный Клык";
	["Urok's Tribute Pile"] = "Груда приношений Арроку";
	["Urok Doomhowl"] = "Аррок Смертный Вопль";
	["Quartermaster Zigris <Bloodaxe Legion>"] = "Интендант Зигрис <Легион Кровавого Топора>";
	["Halycon"] = "Халикон";
	["Gizrul the Slavener"] = "Гизрул Поработитель";
	["Ghok Bashguud <Bloodaxe Champion>"] = "Гок Крепкобив <Герой легиона Кровавого>";
	["Overlord Wyrmthalak"] = "Властитель Змейталак";
	["Burning Felguard"] = "Пылающий страж Скверны";

	--Blackrock Spire (Upper)
	["Seal of Ascension"] = "Печать Вознесения";
	["Pyroguard Emberseer"] = "Пиростраж Созерцатель Углей";
	["Solakar Flamewreath"] = "Солакарский огнечервь";
	["Father Flame"] = "Огонь отцов";
	["Darkstone Tablet"] = "Табличка Темного Камня";
	["Doomrigger's Coffer"] = "Металлический ящик Рокового Зажима";
	["Jed Runewatcher <Blackhand Legion>"] = "Джед Руновед <Легион Чернорука>";
	["Goraluk Anvilcrack <Blackhand Legion Armorsmith>"] = "Горалук Треснувшая Наковальня <Бронник легиона Чернорука>";
	["Warchief Rend Blackhand"] = "Вождь Ренд Чернорук";
	["Gyth <Rend Blackhand's Mount>"] = "Гит <Верховое животное Ренда Чернорука>";
	["Awbee"] = "Ауби";
	["The Beast"] = "Зверь";
	["Lord Valthalak"] = "Лорд Вальтхалак";
	["Finkle Einhorn"] = "Айс Вентурон";
	["General Drakkisath"] = "Генерал Драккисат";
	["Drakkisath's Brand"] = "Клеймо Драккисата";
	
	--Blackwing Lair
	["Razorgore the Untamed"] = "Бритвосмерт Неукротимый";
	["Vaelastrasz the Corrupt"] = "Валестраз Порочный";
	["Broodlord Lashlayer"] = "Предводитель драконов Разящий Бич";
	["Firemaw"] = "Огнечрев";
	["Draconic for Dummies (Chapter VII)"] = "Драконий язык для чайников (т. VII)";
	["Master Elemental Shaper Krixix"] = "Ваятель стихий Криксикс";
	["Ebonroc"] = "Черноскал";
	["Flamegor"] = "Пламегор";
	["Chromaggus"] = "Хроммагус";
	["Nefarian"] = "Нефариан";
	
	--Gnomeregan
	["Workshop Key"] = "Ключ от мастерской";
	["Blastmaster Emi Shortfuse"] = "Взрывник Ими Фитилюшка";
	["Grubbis"] = "Грязнюк";
	["Chomper"] = "Чавккер";
	["Clean Room"] = "Чистая Комната";
	["Tink Sprocketwhistle <Engineering Supplies>"] = "Звяк Пружиносвист <Инженерные материалы>";
	["The Sparklematic 5200"] = "Чистер 5200!";
	["Mail Box"] = "Почтовый яшик";
	["Kernobee"] = "Керноби";
	["Alarm-a-bomb 2600"] = "Тревого-бомба 2600";
	["Matrix Punchograph 3005-B"] = "Матричный перфограф 3005-B";
	["Viscous Fallout"] = "Липкая муть";
	["Electrocutioner 6000"] = "Электрошокер 6000";
	["Matrix Punchograph 3005-C"] = "Матричный перфограф 3005-C";
	["Crowd Pummeler 9-60"] = "Толпогон 9-60";
	["Matrix Punchograph 3005-D"] = "Матричный перфограф 3005-D";
	["Dark Iron Ambassador"] = "Посол из клана Черного Железа";
	["Mekgineer Thermaplugg"] = "Мекжинер Термоштепсель";
	
	--Molten Core
	["Hydraxian Waterlords"] = "Гидраксианские Повелители Вод";
	["Aqual Quintessence"] = "Квинтэссенция воды";
	["Eternal Quintessence"] = "Вечная квинтэссенция";
	["Lucifron"] = "Люцифрон";
	["Magmadar"] = "Магмадар";
	["Gehennas"] = "Гееннас";
	["Garr"] = "Гарр";
	["Shazzrah"] = "Шаззрах";
	["Baron Geddon"] = "Барон Геддон";
	["Golemagg the Incinerator"] = "Маг-лорд из клана Гордок";
	["Sulfuron Harbinger"] = "Предвестник Сульфурон";
	["Majordomo Executus"] = "Мажордом Экзекутус";
	["Ragnaros"] = "Рагнаросс";

	--SM: Library
	["Houndmaster Loksey"] = "Псарь Локси";
	["Arcanist Doan"] = "Чародей Доан";

	--SM: Armory
	["The Scarlet Key"] = "Алый ключ";--omitted from SM: Cathedral
	["Herod <The Scarlet Champion>"] = "Ирод <Герой Алого ордена>";

	--SM: Cathedral
	["High Inquisitor Fairbanks"] = "Верховный инквизитор Фэйрбанкс";
	["Scarlet Commander Mograine"] = "Командир Могрейн из Алого ордена";
	["High Inquisitor Whitemane"] = "Верховный инквизитор Вайтмейн";

	--SM: Graveyard
	["Interrogator Vishas"] = "Дознаватель Жестокос";
	["Vorrel Sengutz"] = "Воррел Сенгутц";
	["Pumpkin Shrine"] = "Святящаяся тыква";
	["Headless Horseman"] = "Всадник без головы";
	["Bloodmage Thalnos"] = "Волшебник Крови Талнос";
	["Ironspine"] = "Железноспин";
	["Azshir the Sleepless"] = "Азшир Неспящий";
	["Fallen Champion"] = "Павший воитель";
	
	--Scholomance
	["Skeleton Key"] = "Отмычка";
	["Viewing Room Key"] = "Ключ от смотровой";
	["Viewing Room"] = "Смотровая";
	["Blood of Innocents"] = "Кровь невинных";
	["Divination Scryer"] = "Гадательный кристалл";
	["Blood Steward of Kirtonos"] = "Кровавая прислужница Киртоноса";
	["The Deed to Southshore"] = "Документы на Южнобережье";
	["Kirtonos the Herald"] = "Киртонос Глашатай";
	["Jandice Barov"] = "Джандис Баров";
	["The Deed to Tarren Mill"] = "Документы на Мельницу Таррен";
	["Rattlegore"] = "Громоклин";
	["Death Knight Darkreaver"] = "Рыцарь смерти Темный Терзатель";
	["Marduk Blackpool"] = "Мардук Блэкпул";
	["Vectus"] = "Вектус";
	["Ras Frostwhisper"] = "Рас Снегошепот";
	["The Deed to Brill"] = "Документы на Брилл";
	["Kormok"] = "Кормок";
	["Instructor Malicia"] = "Инструктор Коварница";
	["Doctor Theolen Krastinov <The Butcher>"] = "Доктор Теолен Крастинов <Мясник>";
	["Lorekeeper Polkelt"] = "Сказитель Полкелт";
	["The Ravenian"] = "Равениан";
	["Lord Alexei Barov"] = "Лорд Алексей Баров";
	["The Deed to Caer Darrow"] = "Документы на Каэр Дарроу";
	["Lady Illucia Barov"] = "Леди Иллюсия Баров";
	["Darkmaster Gandling"] = "Темный магистр Гандлинг";
	["Torch Lever"] = "Рукоятка факела";
	["Secret Chest"] = "Секретный сундук";
	["Alchemy Lab"] = "Лаборатория Алхимии";
	
	--Shadowfang Keep
	["Deathsworn Captain"] = "Капитан служителей Смерти";
	["Rethilgore <The Cell Keeper>"] = "Ретилгор <Страж подвала>";
	["Sorcerer Ashcrombe"] = "Колдун Ашкромб";
	["Deathstalker Adamant"] = "Страж смерти Адамант";
	["Landen Stilwell"] = "Ланден Стилвелл";
	["Deathstalker Vincent"] = "Страж смерти Эрланд Винсент";
	["Fel Steed"] = "Конь скверны";
	["Jordan's Hammer"] = "Молот Джордана";
	["Crate of Ingots"] = "Ящик со слитками";
	["Razorclaw the Butcher"] = "Остроклык Мясник";
	["Baron Silverlaine"] = "Барон Сребролен";
	["Commander Springvale"] = "Командир Ручьедол";
	["Odo the Blindwatcher"] = "Одо Слепой Страж";
	["Fenrus the Devourer"] = "Фенрус Пожиратель";
	["Arugal's Voidwalker"] = "Демон Бездны Аругала";
	["The Book of Ur"] = "Книга Ура";
	["Wolf Master Nandos"] = "Командир воргенов Нандос";
	["Archmage Arugal"] = "Верховный маг Аругал";

	--Stratholme
	["The Scarlet Key"] = "Алый ключ";
	["Key to the City"] = "Ключ от города";
	["Various Postbox Keys"] = "Различные Ключи Почтового ящика";
	["Living Side"] = "Живая сторона";
	["Undead Side"] = "Мертвая сторона";
	["Skul"] = "Череп";
	["Stratholme Courier"] = "Стратхольмский курьер";
	["Fras Siabi"] = "Фрас Сиаби";
	["Atiesh <Hand of Sargeras>"] = "Атиеш <Длань Аргуса>";
	["Hearthsinger Forresten"] = "Певчий Форрестен";
	["The Unforgiven"] = "Непрощенный";
	["Elder Farwhisper"] = "Старейшина Тихий Шепот";
	["Timmy the Cruel"] = "Тайлер";
	["Malor the Zealous"] = "Малор Ревностный";
	["Malor's Strongbox"] = "Сейф Малора";
	["Crimson Hammersmith"] = "Молотобоец из Багрового Легиона";
	["Cannon Master Willey"] = "Мастер-канонир Вилли";
	["Archivist Galford"] = "Архивариус Галфорд";
	["Grand Crusader Dathrohan"] = "Верховный рыцарь Датрохан";
	["Balnazzar"] = "Балназзар";
	["Sothos"] = "Сотос";
	["Jarien"] = "Джариен";
	["Magistrate Barthilas"] = "Мировой судья Бартилас";
	["Aurius"] = "Аурий";
	["Stonespine"] = "Каменный Гребень";
	["Baroness Anastari"] = "Баронесса Анастари";
	["Black Guard Swordsmith"] = "Оружейник Черной Стражи";
	["Nerub'enkan"] = "Неруб'энкан";
	["Maleki the Pallid"] = "Малекай Бледный";
	["Ramstein the Gorger"] = "Рамштайн Ненасытный";
	["Baron Rivendare"] = "Барон Ривендер";
	["Ysida Harmon"] = "Исида Хармон";
	["Crusaders' Square Postbox"] = "Ключ от почтового ящика на Площади рыцарей";
	["Market Row Postbox"] = "Ключ от почтового ящика в торговом ряду";
	["Festival Lane Postbox"] = "Ключ от почтового ящика на Праздничной улице";
	["Elders' Square Postbox"] = "Ключ от почтового ящика на Площади старейшины";
	["King's Square Postbox"] = "Ключ от почтового ящика на Королевской площали";
	["Fras Siabi's Postbox"] = "Ключ от почтового ящика Фраса Сиаби";
	["3rd Box Opened"] = "Открытие третего ящика";
	["Postmaster Malown"] = "Почтальон Мэлоун";

	--The Deadmines
	["Rhahk'Zor <The Foreman>"] = "Рак'Зор <Штейгер>";
	["Miner Johnson"] = "Шахтер Джонсон";
	["Sneed <Lumbermaster>"] = "Снид <Начальник лесозаготовки>";
	["Sneed's Shredder <Lumbermaster>"] = "Крошшер Снида <Начальник лесозаготовки>";
	["Gilnid <The Smelter>"] = "Гилнид <Литейщик>";
	["Defias Gunpowder"] = "Порох братства Справедливости";
	["Captain Greenskin"] = "Капитан Зеленямс";
	["Edwin VanCleef <Defias Kingpin>"] = "Эдвин ван Клиф <Главарь Братства Справедливости>";
	["Mr. Smite <The Ship's First Mate>"] = "Мистер Каюк <Первый помощник капитана>";
	["Cookie <The Ship's Cook>"] = "Пирожок <Корабельный кок>";
	
	--The Stockade
	["Targorr the Dread"] = "Таргорр Ужасный";
	["Kam Deepfury"] = "Кам Гневливый";
	["Hamhock"] = "Хрупконог";
	["Bazil Thredd"] = "Базиль Тредд";
	["Dextren Ward"] = "Декстрен Вард";
	["Bruegal Ironknuckle"] = "Бругал Железный Кулак";

	--The Sunken Temple
	["The Temple of Atal'Hakkar"] = "Храм Аталхаккара";
	["Yeh'kinya's Scroll"] = "Свиток Йе'кинья";
	["Atal'ai Defenders"] = "Защитники Атал'ая";
	["Gasher"] = "Ранокол";
	["Loro"] = "Лоро";
	["Hukku"] = "Хукку";
	["Zolo"] = "Золо";
	["Mijan"] = "Миджан";
	["Zul'Lor"] = "Зул'Лор";
	["Altar of Hakkar"] = "Алтарь Хаккара";
	["Atal'alarion <Guardian of the Idol>"] = "Атал'аларион <Страж идола>";
	["Dreamscythe"] = "Жнец Снов";
	["Weaver"] = "Ткачик";
	["Avatar of Hakkar"] = "Аватара Хаккара";
	["Jammal'an the Prophet"] = "Джаммал'ан Пророк";
	["Ogom the Wretched"] = "Огом Презренный";
	["Morphaz"] = "Морфаз";
	["Hazzas"] = "Хаззас";
	["Shade of Eranikus"] = "Тень Эраникуса";
	["Essence Font"] = "Купель сущности";
	["Spawn of Hakkar"] = "Порождение Хаккара";
	["Elder Starsong"] = "Старейшина Звездная Песня";
	["Statue Activation Order"] = "Порядок активаций статуэток";
	
	--Uldaman
	["Staff of Prehistoria"] = "Посох Древнейшей Истории";
	["Baelog"] = "Бейло";
	["Eric \"The Swift\""] = "Эрик \"Быстрый\"";
	["Olaf"] = "Олаф";
	["Baelog's Chest"] = "Сундук Бейлога";
	["Conspicuous Urn"] = "Подозрительная урна";
	["Remains of a Paladin"] = "Останки паладина";
	["Revelosh"] = "Ревелош";
	["Ironaya"] = "Иронайа";
	["Obsidian Sentinel"] = "Обсидиановый часовой";
	["Annora <Enchanting Trainer>"] = "Аннора <Учитель наложения чар>";
	["Ancient Stone Keeper"] = "Древний Хранитель Камня";
	["Galgann Firehammer"] = "Галганн Огнемолот";
	["Tablet of Will"] = "Табличка Воли";
	["Shadowforge Cache"] = "Тайник Кузни Теней";
	["Grimlok <Stonevault Chieftain>"] = "Гримлок <Вождь племени Каменного Свода>";
	["Archaedas <Ancient Stone Watcher>"] = "Аркедас <Древний Каменный Страж>";
	["The Discs of Norgannon"] = "Диски Норганнона";
	["Ancient Treasure"] = "Древнее сокровище";
	
	--Zul'Gurub
	["Zandalar Tribe"] = "Племя Зандалар";
	["Mudskunk Lure"] = "Наживка на грязнотинника";
	["Gurubashi Mojo Madness"] = "Амулет безумия Гурубаши";
	["High Priestess Jeklik"] = "Верховная жрица Джеклик";
	["High Priest Venoxis"] = "Верховный жрец Веноксис";
	["Zanza the Restless"] = "Занза Неупокоенный";
	["High Priestess Mar'li"] = "Верховная жрица Мар'ли";
	["Bloodlord Mandokir"] = "Мандокир Повелитель Крови";
	["Ohgan"] = "Охган";
	["Edge of Madness"] = "Край Безумия";
	["Gri'lek"] = "Гри'лек";
	["Hazza'rah"] = "Хазза'рах";
	["Renataki"] = "Ренатаки";
	["Wushoolay"] = "Вушулай";
	["Gahz'ranka"] = "Газ'ранка";
	["High Priest Thekal"] = "Верховный жрец Текал";
	["Zealot Zath"] = "Ревнитель Зат";
	["Zealot Lor'Khan"] = "Ревнитель Лор'Кхан";
	["High Priestess Arlokk"] = "Верховная жрица Арлокк";
	["Jin'do the Hexxer"] = "Джин'до Проклинатель";
	["Hakkar"] = "Хаккар";
	["Muddy Churning Waters"] = "Грязные Воды Взбалтывания";
	
	--Karazhan Start
	["The Violet Eye"] = "Аметистовое Око";--omitted from Karazhan End
	["The Master's Key"] = "Хозяйский ключ";--omitted from Karazhan End
	["Blackened Urn"] = "Вороненая урна";
	["Staircase to the Ballroom"] = "Лестница в танцевальный зал";
	["Stairs to Upper Stable"] = "Летсница в верхнюю конюшню";
	["Ramp to the Guest Chambers"] = "Рампа в гостевую комнату";
	["Stairs to Opera House Orchestra Level"] = "Лесница в оперный театр (уровень оркестра)";
	["Ramp from Mezzanine to Balcony"] = "Рампа в из под сцены на балкон";
	["Connection to Master's Terrace"] = "Связь с Террасой Мастера";
	["Path to the Broken Stairs"] = "Дорога к разбитым ступенькам";--omitted from Karazhan End
	["Hastings <The Caretaker>"] = "Гастингс <Управляющий>";
	["Servant Quarters"] = "Жильё прислуги";
	["Hyakiss the Lurker"] = "Хиакисс Тенетник";
	["Rokad the Ravager"] = "Рокад Опустошитель";
	["Shadikith the Glider"] = "Шадикит Скользящий";
	["Berthold <The Doorman>"] = "Бертольд <Привратник>";
	["Calliard <The Nightman>"] = "Кальярд <Ночной страж>";
	["Attumen the Huntsman"] = "Аттумен Охотник";
	["Midnight"] = "Полночь";
	["Koren <The Blacksmith>"] = "Корен <Кузнец>";
	["Moroes <Tower Steward>"] = "Мороуз <Дворецкий>";
	["Baroness Dorothea Millstipe"] = "Баронесса Дороти Милстип";
	["Lady Catriona Von'Indi"] = "Леди Катриона Фон'Инди";
	["Lady Keira Berrybuck"] = "Леди Кейра Ягодная Корзина";
	["Baron Rafe Dreuger"] = "Барон Раф Дреугер";
	["Lord Robin Daris"] = "Лорд Робин Дэрис";
	["Lord Crispin Ference"] = "Лорд Криспин Ференс";
	["Bennett <The Sergeant at Arms>"] = "Беннет <Начальник охраны>";
	["Ebonlocke <The Noble>"] = "Чернодрев <Аристократ>";
	["Keanna's Log"] = "Записи Кеанны";
	["Maiden of Virtue"] = "Благочестивая дева";
	["Sebastian <The Organist>"] = "Себастиан <Органист>";
	["Barnes <The Stage Manager>"] = "Барнс <Конферансье>";
	["The Opera Event"] = "Опера";
	["Red Riding Hood"] = "Красная Шапочка";
	["The Big Bad Wolf"] = "Злой и страшный серый волк";
	["Wizard of Oz"] = "Волшебник страны Oз";
	["Dorothee"] = "Дороти";
	["Tito"] = "Тито";
	["Strawman"] = "Балбес";
	["Tinhead"] = "Медноголовый";
	["Roar"] = "Хохотун";
	["The Crone"] = "Ведьма";
	["Romulo and Julianne"] = "Ромуло и Джулианна";
	["Romulo"] = "Ромуло";
	["Julianne"] = "Джулианна";
	["The Master's Terrace"] = "Терраса Мастера";
	["Nightbane"] = "Ночная Погибель";
	
	--Karazhan End
	["Broken Stairs"] = "Сломаная лесница";
	["Ramp to Guardian's Library"] = "Рампа к библиотеку стражи";
	["Suspicious Bookshelf"] = "Подозрительные книжные полки";
	["Ramp up to the Celestial Watch"] = "Подъём к небесному надзору";
	["Ramp down to the Gamesman's Hall"] = "Спуск в игровой зал";
	["Chess Event"] = "Шахматы";
	["Ramp to Medivh's Chamber"] = "Рампа в комнату Медива";
	["Spiral Stairs to Netherspace"] = "Спиральные лестницы к Пустомари";
	["The Curator"] = "Смотритель";
	["Wravien <The Mage>"] = "Вравьен <Маг>";
	["Gradav <The Warlock>"] = "Градав <Чернокнижник>";
	["Kamsis <The Conjurer>"] = "Камсис <Кудесник>";
	["Terestian Illhoof"] = "Терестиан Больное Копыто";
	["Kil'rek"] = "Кил'рек";
	["Shade of Aran"] = "Тень Арана";
	["Netherspite"] = "Пустогнев";
	["Ythyar"] = "Айтар";
	["Echo of Medivh"] = "Эхо Медива";
	["Dust Covered Chest"] = "Пыльный сундук";
	["Prince Malchezaar"] = "Принц Малчезар";
	
	--Zul'Aman
	["Harrison Jones"] = "Харрисон Джонс";
	["Nalorakk <Bear Avatar>"] = "Налоракк <Аватара медведя>";
	["Tanzar"] = "Танзар";
	["The Map of Zul'Aman"] = "Карта Зул'Амана";
	["Akil'Zon <Eagle Avatar>"] = "Акил'зон <Аватара орла>";
	["Harkor"] = "Харкор";
	["Jan'Alai <Dragonhawk Avatar>"] = "Джан'алай <Аватара дракондора>";
	["Kraz"] = "Краз";
	["Halazzi <Lynx Avatar>"] = "Халаззи <Аватара рыси>";
	["Ashli"] = "Эшли";
	["Zungam"] = "Зангам";
	["Hex Lord Malacrass"] = "Повелитель проклятий Малакрасс";
	["Thurg"] = "Тург";
	["Gazakroth"] = "Газакрот";
	["Lord Raadan"] = "Лорд Раадан";
	["Darkheart"] = "Черносерд";
	["Alyson Antille"] = "Алисон Антиль";
	["Slither"] = "Скользь";
	["Fenstalker"] = "Болотный ловец";
	["Koragg"] = "Корагг";
	["Zul'jin"] = "Зул'джин";
	["Forest Frogs"] = "Лесная лягушка";
	["Kyren <Reagents>"] = "Кирен <Реагенты>";
	["Gunter <Food Vendor>"] = "Гюнтер <Продавец еды>";
	["Adarrah"] = "Адарра";
	["Brennan"] = "Бреннан";
	["Darwen"] = "Стрел";
	["Deez"] = "Диз";
	["Galathryn"] = "Калатрин";
	["Mitzi"] = "Митци";
	["Mannuth"] = "Маннут";
	
	--Magisters Terrace
	["Shattered Sun Offensive"] = "Армия Расколотого Солнца";
	["Selin Fireheart"] = "Селин Огненное Сердце";
	["Fel Crystals"] = "Кристалл Скверны";
	["Tyrith"] = "Тирит";
	["Vexallus"] = "Вексалиус";
	["Scrying Orb"] = "Гадательный шар Соланиана";
	["Kalecgos"] = "Калесгос";--omitted from SP
	["Priestess Delrissa"] = "Жрица Делрисса";
	["Apoko"] = "Апоко";
	["Eramas Brightblaze"] = "Эрамас Сияющее Пламя";
	["Ellrys Duskhallow"] = "Эллриса Почитательница Тени";
	["Fizzle"] = "Пшикс";
	["Garaxxas"] = "Гараксас";
	["Sliver <Garaxxas' Pet>"] = "Лыббс <Питомец Гараксаса>";
	["Kagani Nightstrike"] = "Кагани Ночной Удар";
	["Warlord Salaris"] = "Полководец Саларис";
	["Yazzai"] = "Яззай";
	["Zelfan"] = "Зелфан";
	["Kael'thas Sunstrider <Lord of the Blood Elves>"] = "Кель'тас Солнечный Скиталец <Правитель эльфов крови>";--omitted from TK: The Eye

	--Sunwell Plateau
	["Sathrovarr the Corruptor"] = "Сатроварр Осквернитель";
	["Madrigosa"] = "Мадригоса";
	["Brutallus"] = "Бруталл";
	["Felmyst"] = "Пророк Скверны";
	["Eredar Twins"] = "Эредарские близнецы";
	["Grand Warlock Alythess"] = "Главная чернокнижница Алитесса";
	["Lady Sacrolash"] = "Леди Сакролаш";
	["M'uru"] = "М'ару";
	["Entropius"] = "Энтропий";
	["Kil'jaeden <The Deceiver>"] = "Кил'джеден <Искуситель>";
	
--*******************
-- Outland Instances
--*******************
	
	--HFC: The Blood Furnace
	["Thrallmar"] = "Траллмар";--omitted from other HFC
	["Honor Hold"] = "Оплот Чести";--omitted from other HFC
	["Flamewrought Key"] = "Ключ, выкованный в пламени";--omitted from other HFC
	["The Maker"] = "Мастер";
	["Broggok"] = "Броггок";
	["Keli'dan the Breaker"] = "Кели'дан Разрушитель";

	--HFC: The Shattered Halls
	["Shattered Halls Key"] = "Ключ Разрушенных залов";
	["Randy Whizzlesprocket"] = "Рэнди Свистельник";
	["Drisella"] = "Дризелла";
	["Grand Warlock Nethekurse"] = "Главный чернокнижник Пустоклят";
	["Blood Guard Porung"] = "Кровавый страж Порунг";
	["Warbringer O'mrogg"] = "О'мрогг Завоеватель";
	["Warchief Kargath Bladefist"] = "Вождь Каргат Острорук";
	["Shattered Hand Executioner"] = "Палач из клана Извученной Длани";
	["Private Jacint"] = "Рядовой Джасинт";
	["Rifleman Brownbeard"] = "Ружейник Буробород";
	["Captain Alina"] = "Капитан Алина";
	["Scout Orgarr"] = "Разведчик Оргарр";
	["Korag Proudmane"] = "Кораг Гордая Грива";
	["Captain Boneshatter"] = "Капитан Костолом";

	--HFC: Hellfire Ramparts
	["Watchkeeper Gargolmar"] = "Начальник стражи Гарголмар";
	["Omor the Unscarred"] = "Омор Неодолимый";
	["Vazruden"] = "Вазруден";
	["Nazan <Vazruden's Mount>"] = "Назан <Ездовое животное Вазрудена>";
	["Reinforced Fel Iron Chest"] = "Укрепленный сундук из оскверненного железа";

	--HFC: Magtheridon's Lair
	["Magtheridon"] = "Магтеридон";

	--CR: The Slave Pens
	["Cenarion Expedition"] = "Экспедиция Ценариона";--omitted from other CR
	["Reservoir Key"] = "Ключ Сокровищницы";--omitted from other CR
	["Mennu the Betrayer"] = "Менну Предатель";
	["Weeder Greenthumb"] = "Культиватор Зеленопал";
	["Skar'this the Heretic"] = "Скартис Еретик";
	["Rokmar the Crackler"] = "Рокмар Трескун";
	["Naturalist Bite"] = "Натуралист Кус";
	["Quagmirran"] = "Квагмирран";
	["Ahune <The Frost Lord>"] = "Ахун <Повелитель Холода>";

	--CR: The Underbog
	["Hungarfen"] = "Голоднец";
	["The Underspore"] = "Подспорник";
	["Ghaz'an"] = "Газ'ан";
	["Earthbinder Rayge"] = "Землепряд Гневвс";
	["Swamplord Musel'ek"] = "Владыка болота Мусел'ек";
	["Claw <Swamplord Musel'ek's Pet>"] = "Когти <Питомец владыка болота Мусел'ека>";
	["The Black Stalker"] = "Черная Охотница";

	--CR: The Steamvault
	["Hydromancer Thespia"] = "Гидромант Теспия";
	["Main Chambers Access Panel"] = "Главная камера сгорания - Панель доступа";
	["Second Fragment Guardian"] = "Страж второго фрагмента";
	["Mekgineer Steamrigger"] = "Мекжинер Паропуск";
	["Warlord Kalithresh"] = "Полководец Калитреш";

	--CR: Serpentshrine Cavern
	["Hydross the Unstable <Duke of Currents>"] = "Гидросс Нестабильный <Князь течений>";
	["The Lurker Below"] = "Скрытень из глубин";
	["Leotheras the Blind"] = "Леотерас Слепец";
	["Fathom-Lord Karathress"] = "Повелитель глубин Каратресс";
	["Seer Olum"] = "Провидец Олум";
	["Morogrim Tidewalker"] = "Морогрим Волноступ";
	["Lady Vashj <Coilfang Matron>"] = "Леди Вайш <Правительница резервуара Кривого Клыка>";

	--Auch: Mana-Tombs
	["The Consortium"] = "Консорциум";
	["Auchenai Key"] = "Аукенайский ключ";--omitted from other Auch
	["The Eye of Haramad"] = "Око Харамада";
	["Pandemonius"] = "Пандемоний";
	["Shadow Lord Xiraxis"] = "Владыка теней Зираксис";
	["Ambassador Pax'ivi"] = "Посол Пакс'иви";
	["Tavarok"] = "Таварок";
	["Cryo-Engineer Sha'heen"] = "Крио-инженер Ша'хин";
	["Ethereal Transporter Control Panel"] = "Пульт управления астрального телепорта";
	["Nexus-Prince Shaffar"] = "Принц Шаффар";
	["Yor <Void Hound of Shaffar>"] = "Йор <Исчадие Бездны Шаффара>";

	--Auch: Auchenai Crypts
	["Lower City"] = "Нижний Город";--omitted from other Auch
	["Shirrak the Dead Watcher"] = "Ширрак Страж Мерт";
	["Exarch Maladaar"] = "Экзарх Маладаар";
	["Avatar of the Martyred"] = "Аватара Мученика";
	["D'ore"] = "Д'оре";

	--Auch: Sethekk Halls
	["Essence-Infused Moonstone"] = "Лунный камень Сущности";
	["Darkweaver Syth"] = "Темнопряд Сит";
	["Lakka"] = "Лакка";
	["The Saga of Terokk"] = "Сага о Терокке";
	["Anzu"] = "Анзу";
	["Talon King Ikiss"] = "Король воронов Айкисс";

	--Auch: Shadow Labyrinth
	["Shadow Labyrinth Key"] = "Ключ Темного Лабиринта";
	["Spy To'gun"] = "Шпион То'гун";
	["Ambassador Hellmaw"] = "Посол Гиблочрев";
	["Blackheart the Inciter"] = "Черносерд Проповедник";
	["Grandmaster Vorpil"] = "Великий мастер Ворпил";
	["The Codex of Blood"] = "Кодекс Крови";
	["Murmur"] = "Бормотун";
	["First Fragment Guardian"] = "Страж первого фрагмента";

	--TK: The Botanica
	["The Sha'tar"] = "Ша'тар";--omitted from other TK
	["Warpforged Key"] = "Деформированный ключ";--omitted from other TK
	["Commander Sarannis"] = "Командир Сараннис";
	["High Botanist Freywinn"] = "Верховный ботаник Фрейвин";
	["Thorngrin the Tender"] = "Скалезуб Скорбный";
	["Laj"] = "Ладж";
	["Warp Splinter"] = "Узлодревень";

	--TK: The Arcatraz
	["Key to the Arcatraz"] = "Ключ от Аркатраца";
	["Zereketh the Unbound"] = "Зерекет Бездонный";
	["Third Fragment Guardian"] = "Страж третьего фрагмента";
	["Dalliah the Doomsayer"] = "Даллия Глашатай Судьбы";
	["Wrath-Scryer Soccothrates"] = "Провидец Гнева Соккорат";
	["Udalo"] = "Адало";
	["Harbinger Skyriss"] = "Предвестник Скайрисс";
	["Warden Mellichar"] = "Начальник тюрьмы Мелличар";
	["Millhouse Manastorm"] = "Милхаус Манашторм";

	--TK: The Mechanar
	["Gatewatcher Gyro-Kill"] = "Страж ворот Точеный Нож";
	["Gatewatcher Iron-Hand"] = "Страж ворот Стальная Клешня";
	["Cache of the Legion"] = "Тайник Легиона";
	["Mechano-Lord Capacitus"] = "Механо-лорд Конденсарон";
	["Overcharged Manacell"] = "Переполненный зарядом контейнер с маной";
	["Nethermancer Sepethrea"] = "Пустомант Сепетрея";
	["Pathaleon the Calculator"] = "Паталеон Вычислитель";

	--TK: The Eye
	["The Tempest Key"] = "Ключ Урагана";
	["Al'ar <Phoenix God>"] = "Ал'ар <Феникс-бог>";
	["Void Reaver"] = "Страж Бездны";
	["High Astromancer Solarian"] = "Верховный звездочет Солариан";
	["Thaladred the Darkener <Advisor to Kael'thas>"] = "Таладред Светокрад <Советник Кель'таса>";
	["Master Engineer Telonicus <Advisor to Kael'thas>"] = "Старший инженер Телоникус <Советник Кель'таса>";
	["Grand Astromancer Capernian <Advisor to Kael'thas>"] = " Великий Звездочет Каперниан <Советник Кель'таса>";
	["Lord Sanguinar <The Blood Hammer>"] = " Лорд Сангвинар <Молот Крови>";

	--Gruul's Lair
	["High King Maulgar <Lord of the Ogres>"] = "Король Молгар <Повелитель огров>";
	["Kiggler the Crazed"] = "Кигглер Безумный";
	["Blindeye the Seer"] = "Слепоглаз Ясновидец";
	["Olm the Summoner"] = "Олм Призыватель";
	["Krosh Firehand"] = "Крош Огненная Рука";
	["Gruul the Dragonkiller"] = "Груул Драконобой";

	--Black Temple (Start)
	["Ashtongue Deathsworn"] = "Пеплоусты-служители";--omitted from other BT
	["Medallion of Karabor"] = "Медальон Карабора";--omitted from other BT
	["Towards Reliquary of Souls"] = "К Гробнице Душ";
	["Towards Teron Gorefiend"] = "К Терону Кровожадному";
	["Towards Illidan Stormrage"] = "К Иллидану Ярости Бури";
	["Spirit of Olum"] = "Олумов дух";
	["High Warlord Naj'entus"] = "Верховный Полководец Надж'ентус";
	["Supremus"] = "Супремус";
	["Shade of Akama"] = "Тень Акамы";
	["Spirit of Udalo"] = "Дух Адало";
	["Aluyen <Reagents>"] = "Алуйен <Реагенты>";
	["Okuno <Ashtongue Deathsworn Quartermaster>"] = "Окуно <Начальник снабжения Пеплоустов>";
	["Seer Kanai"] = "Провидец Канеи";

	--Black Temple (Basement)
	["Gurtogg Bloodboil"] = "Гуртогг Кипящая Кровь";
	["Reliquary of Souls"] = "Гробница Душ";
	["Essence of Suffering"] = "Воплощение страдания";
	["Essence of Desire"] = "Воплощение желания";
	["Essence of Anger"] = "Воплощение гнева";
	["Teron Gorefiend"] = "Терон Кровожад";

	--Black Temple (Top)
	["Mother Shahraz"] = "Матушка Шахраз";
	["The Illidari Council"] = "Совет Иллидари";
	["Lady Malande"] = "Леди Маланда";
	["Gathios the Shatterer"] = "Гатиос Изувер";
	["High Nethermancer Zerevor"] = "Верховный пустомант Зеревор";
	["Veras Darkshadow"] = "Верас Глубокий Мрак";
	["Illidan Stormrage <The Betrayer>"] = "Иллидан Ярость Бури <Отступник>";

--************************************************
-- Instance Entrance Maps
--************************************************

	--Auchindoun (Entrance)
	["Ha'Lei"] = "Ха'лей";
	["Greatfather Aldrimus"] = "Великий Отец Алдримус";
	["Clarissa"] = "Кларисса";
	["Ramdor the Mad"] = "Рамдор Безумный";
	["Horvon the Armorer <Armorsmith>"] = "Хорвон Бронник <Бронник>";
	["Nexus-Prince Haramad"] = "Принц Харамад";
	["Artificer Morphalius"] = "Работник Морфалиус";
	["Mamdy the \"Ologist\""] = "Мамди по кличке \"Олог\"";
	["\"Slim\" <Shady Dealer>"] = "Тип <Сомнительный делец>";
	["\"Captain\" Kaftiz"] = "Капитан Кафтиц";
	["Isfar"] = "Исфар";
	["Field Commander Mahfuun"] = "Боевой командир Мафуун";
	["Spy Grik'tha"] = "Шпион Грик'та";
	["Provisioner Tsaalt"] = "Поставщик Тсаальт";
	["Dealer Tariq <Shady Dealer>"] = "Делец Тариг <Сомнительный делец>";

	--Blackfathom Deeps (Entrance) 
	--Nothing to translate!

	--Blackrock Mountain (Entrance)
	["Bodley"] = "Бодли";
	["Overmaster Pyron"] = "Подчинитель Пирон";
	["Lothos Riftwaker"] = "Лотос Хранитель Портала";
	["Franclorn Forgewright"] = "Франклорн Искусник";
	["Orb of Command"] = "Сфера Приказа";
	["Scarshield Quartermaster <Scarshield Legion>"] = "Интендант из легиона Изрубленного Щита <Легион Изрубленного Щита>";

	--Coilfang Reservoir (Entrance)
	["Watcher Jhang"] = "Дозорный Джанг";
	["Mortog Steamhead"] = "Мортог Горячая Голова";

	--Gnomeregan (Entrance)
	["Transpolyporter"] = "Телепортатор";
	["Sprok <Away Team>"] = "Вилконож <Заблудившаяся команда>";
	["Matrix Punchograph 3005-A"] = "Матричный перфограф 3005-A";
	["Namdo Bizzfizzle <Engineering Supplies>"] = "Намдо Вклвыкл <Инженерные материалы>";
	["Techbot"] = "Техбот";

	--Maraudon (Entrance)
	["The Nameless Prophet"] = "Безымянный пророк";
	["Kolk <The First Kahn>"] = "Колк <Первый хан>";
	["Gelk <The Second Kahn>"] = "Гелк <Второй хан>";
	["Magra <The Third Kahn>"] = "Магра <Третий хан>";
	["Cavindra"] = "Кавиндра";

	--The Deadmines (Entrance)
	["Marisa du'Paige"] = "Мариса дю Пэж";
	["Brainwashed Noble"] = "Зомбированный дворянин";
	["Foreman Thistlenettle"] = "Штейгер Чертополох";

	--Sunken Temple (Entrance)
	["Jade"] = "Нефрит";
	["Kazkaz the Unholy"] = "Казказ Нечистый";
	["Zekkis"] = "Зеккис";
	["Veyzhak the Cannibal"] = "Вейжак Каннибал";

	--Uldaman (Entrance)
	["Hammertoe Grez"] = "Тяжелоступ Грез";
	["Magregan Deepshadow"] = "Магреган Чернотень";
	["Tablet of Ryun'Eh"] = "Табличка Рьюн'эха";
	["Krom Stoutarm's Chest"] = "Сундук Крома Крепкорука";
	["Garrett Family Chest"] = "Сундук семейства Гарретт";
	["Digmaster Shovelphlange"] = "Мастер Лопаторук";

	--Wailing Caverns (Entrance)
	["Mad Magglish"] = "Безумный Магглиш";
	["Trigore the Lasher"] = "Тригор Хлестун";
	["Boahn <Druid of the Fang>"] = "Боан <Друид Клыка>";
	["Above the Entrance:"] = "Выше Входа:";
	["Ebru <Disciple of Naralex>"] = "Эбру <Послушник Наралекса>";
	["Nalpak <Disciple of Naralex>"] = "Налпак <Послушник Наралекса>";
	["Kalldan Felmoon <Specialist Leatherworking Supplies>"] = "Калидан Лунный Серп <Специализированные товары для кожевников>";
	["Waldor <Leatherworking Trainer>"] = "Валдор <Учитель кожевничества>";

	--Dire Maul (Entrance)
	["Dire Pool"] = "Забытый остров";
	["Dire Maul Arena"] = "Арена забытого города";
	["Mushgog"] = "Мушгог";
	["Skarr the Unbreakable"] = "Скарр Непреклонный";
	["The Razza"] = "Разза";
	["Elder Mistwalker"] = "Старейшина Странник Туманов ";

	--Caverns of Time (Entrance)
	["Steward of Time <Keepers of Time>"] = "Распорядитель времени <Хранители Времени>";
	["Alexston Chrome <Tavern of Time>"] = "Алекстон Хром <Таверна Времени>";
	["Yarley <Armorer>"] = "Ярли <Бронник>";
	["Bortega <Reagents & Poison Supplies>"] = "Бортега <Реагенты и яды>";
	["Galgrom <Provisioner>"] = "Гальгром <Поставщик>";
	["Alurmi <Keepers of Time Quartermaster>"] = "Алурми <Начальник снабжения Хранителей Времени>";
	["Zaladormu"] = "Заладорму";
	["Soridormi <The Scale of Sands>"] = "Соридорми <Песчаная Чешуя>";
	["Arazmodu <The Scale of Sands>"] = "Аразмоду <Песчаная Чешуя>";
	["Andormu <Keepers of Time>"] = "Андорму <Хранители Времени>";
	["Nozari <Keepers of Time>"] = "Нозари <Хранители Времени>";

	--Karazhan (Entrance)
	["Archmage Leryda"] = "Верховный маг Лерида";
	["Apprentice Darius"] = "Ученик Дариус";
	["Archmage Alturus"] = "Верховный маг Альтур";
	["Stairs to Underground Pond"] = "Лестница к Подземному пруду";
	["Stairs to Underground Well"] = "Лестница к Подземному колодцу";
	["Charred Bone Fragment"] = "Фрагмент обугленной кости";

	--Scarlet Monastery (Entrance)
	--Nothing to translate!

--*****************
-- WotLK Instances
--*****************

--I'm switching from continent grouping to expansion grouping.

	--Azjol-Nerub: Ahn'kahet: The Old Kingdom
	["Elder Nadox"] = "Старейшина Надокс";
	["Prince Taldaram"] = "Принц Талдарам";
	["Jedoga Shadowseeker"] = "Джедога Искательница Теней";
	["Herald Volazj"] = "Глашатай Волаж";
	["Amanitar"] = "Аманитар";
	["Ahn'kahet Brazier"] = "Ан'кахетская жаровня ";

	--Azjol-Nerub: Azjol-Nerub
	["Krik'thir the Gatewatcher"] = "Крик'Тир Хранитель Врат";
	["Watcher Gashra"] = "Дозорный Гашра";
	["Watcher Narjil"] = "Дозорный Нарджил";
	["Watcher Silthik"] = "Дозорный Силтик";
	["Hadronox"] = "Хадронокс";
	["Anub'arak"] = "Ануб'арак";
	
	--Caverns of Time: The Culling of Stratholme
	["The Culling of Stratholme"] = "Очищение Стратхольма";
	["Meathook"] = "Мясной Крюк";
	["Salramm the Fleshcrafter"] = "Салрамм Плоторез";
	["Chrono-Lord Epoch"] = "Хронолорд Эпох";
	["Mal'Ganis"] = "Мал'Ганис";
	["Chromie"] = "Хроми";
	["Infinite Corruptor"] = "Осквернитель из рода Бесконечности";
	["Guardian of Time"] = "Хранитель Времени";
	["Scourge Invasion Points"] = "Точки вторжения Плети";

	--Drak'Tharon Keep
	["Trollgore"] = "Кровотролль";
	["Novos the Summoner"] = "Новос Призыватель";
	["King Dred"] = "Король Дред";
	["The Prophet Tharon'ja"] = "Пророк Тарон'джа";
	["Kurzel"] = "Курцель";
	["Drakuru's Brazier"] = "Жаровня Дракуру";
	
	--Gundrak
	["Slad'ran <High Prophet of Sseratus>"] = "Слад'ран <Верховный пророк Шшератуса>";
	["Drakkari Colossus"] = "Колосс Драккари";
	["Moorabi <High Prophet of Mam'toth>"] = "Мураби <Верховный пророк Мам'тота>";
	["Gal'darah <High Prophet of Akali>"] = "Гал'дара <Верховный пророк Акали>";
	["Eck the Ferocious"] = "Эк Свирепый";

	--Naxxramas
	["Mr. Bigglesworth"] = "Мистер Бигглсуорт";
	["Construct Quarter"] = "Квартал Мерзости";
	["Patchwerk"] = "Лоскутик";
	["Grobbulus"] = "Гроббулус";
	["Gluth"] = "Глут";
	["Thaddius"] = "Таддиус";
	["Arachnid Quarter"] = "Паучий квартал";
	["Anub'Rekhan"] = "Ануб'Рекан";
	["Grand Widow Faerlina"] = "Великая вдова Фарлина";
	["Maexxna"] = "Мексна";
	["Military Quarter"] = "Военный квартал";
	["Instructor Razuvious"] = "Инструктор Разувиус";
	["Gothik the Harvester"] = "Готик Жнец";
	["The Four Horsemen"] = "Четыри Всадника";
	["Thane Korth'azz"] = "Тан Кортазз";
	["Lady Blaumeux"] = "Леди Бломе";
	--Baron Rivendare omitted, listed under Stratholme
	["Sir Zeliek"] = "Сэр Зелиек";
	["Four Horsemen Chest"] = "Сундук Четырех Всадников";
	["Plague Quarter"] = "Чумной квартал";
	["Noth the Plaguebringer"] = "Нот Чумной";
	["Heigan the Unclean"] = "Хейган Нечестивый";
	["Loatheb"] = "Лотхиб";
	["Frostwyrm Lair"] = "Логово Ледяного Змея";
	["Sapphiron"] = "Сапфирон";
	["Kel'Thuzad"] = "Кел'Тузад";

	--The Nexus: The Nexus	
	["Anomalus"] = "Аномалус";
	["Ormorok the Tree-Shaper"] = "Орморок Воспитатель Дерев";
	["Grand Magus Telestra"] = "Великая ведунья Телестра";
	["Keristrasza"] = "Керистраза";
	["Commander Stoutbeard"] = "Командир Пивобород";
	["Berinand's Research"] = "Исследования Беринарда";
	["Commander Kolurg"] = "Командир Колург";

	--The Nexus: The Eye of Eternity
	["Malygos"] = "Малигос";
	["Key to the Focusing Iris"] = "Ключ к Радужному Средоточию";

	--The Nexus: The Oculus
	["Drakos the Interrogator"] = "Дракос Дознаватель";
	["Mage-Lord Urom"] = "Маг-лорд Уром";
	["Ley-Guardian Eregos"] = "Варос Заоблачный Странник";
	["Varos Cloudstrider <Azure-Lord of the Blue Dragonflight>"] = "Варос Заоблачный Странник <Лазурный повелитель рода синих драконов>";
	["Centrifuge Construct"] = "Центрифужное создание";
	["Cache of Eregos"] = "Тайник Эрегоса";

	--The Obsidian Sanctum
	["Black Dragonflight Chamber"] = "Комната черных драконов";
	["Sartharion <The Onyx Guardian>"] = "Сартарион <Ониксовый страж>";
	["Tenebron"] = "Тенеброн";
	["Shadron"] = "Шадрон";
	["Vesperon"] = "Весперон";

	--The Violet Hold
	["Erekem"] = "Эрекем";
	["Zuramat the Obliterator"] = "Зурамат Уничтожитель";
	["Xevozz"] = "Ксевозз";
	["Ichoron"] = "Гнойрон";
	["Moragg"] = "Морагг";
	["Lavanthor"] = "Лавантор";
	["Cyanigosa"] = "Синигоса";
	["The Violet Hold Key"] = "Ключ Аметистовой крепости";

	--Ulduar: Halls of Lightning
	["General Bjarngrim"] = "Генерал Бьярнгрин";
	["Volkhan"] = "Волхан";
	["Ionar"] = "Ионар";
	["Loken"] = "Локен";

	--Ulduar: Halls of Stone	
	["Tribunal Chest"] = "Сундук Трибунала";
	["Krystallus"] = "Кристаллус";
	["Brann Bronzebeard"] = "Бранн Бронзобород";
	["Sjonnir the Ironshaper"] = "Сьоннир Литейщик";
	["Maiden of Grief"] = "Дева Скорби";
	
	-- Ulduar General
	["Celestial Planetarium Key"] = "Ключ к Священному планетарию";
	["The Siege"] = "Осада";
	["The Antechamber"] = "Вестибюль"; --B
	["The Keepers"] = "Хранители"; --C
	["Spark of Imagination"] = "Искра Воображения"; --D
	["Descent into Madness"] = "Провал Безумия"; --E
	
	-- Ulduar A
	["Flame Leviathan"] = "Огненный Левиафан";
	["Ignis the Furnace Master"] = "Повелитель Горнов Игнис";
	["Razorscale"] = "Острокрылая";
	["XT-002 Deconstructor"] = "Разрушитель XT-002";
	["Expedition Base Camp"] = "Главный лагерь экспедиции";
	["Formation Grounds"] = "Плац";
	["The Colossal Forge"] = "Гигантская кузня";
	["The Scrapyard"] = "Мусорная свалка";
	["Tower of Life"] = "Башня Жизни";
	["Tower of Flame"] = "Башня Пламени";
	["Tower of Frost"] = "Башня Холода";
	["Tower of Storms"] = "Башня Гроз";
	
	-- Ulduar B
	["Assembly of Iron"] = "Железное собрание";
	["Steelbreaker"] = "Сталелом";
	["Runemaster Molgeim"] = "Мастер рун Молгейм";
	["Stormcaller Brundir"] = "Буревестник Брундир";
	["Kologarn"] = "Кологарн";
	["Algalon the Observer"] = "Алгалон Наблюдатель";
	["Antechamber of Ulduar"] = "Вестибюль Ульдуара";
	
	-- Ulduar C
	["Auriaya"] = "Ауриайя";
	["Freya"] = "Фрейя";
	["Thorim"] = "Торим";
	["Hodir"] = "Ходир";
	["The Shattered Walkway"] = "Обвалившеяся галерия";
	["The Conservatory of Life"] = "Оранжерея Жизни";
	
	-- Ulduar D
	["Mimiron"] = "Мимирон";
	
	-- Ulduar E
	["General Vezax"] = "Генерал Везакс";
	["Yogg-Saron"] = "Йогг-Сарон";
	["Prison of Yogg-Saron"] = "Темница Йогг-Сарона";

	--Utgarde Keep: Utgarde Keep
	["Prince Keleseth <The San'layn>"] = "Принц Келесет <Сан'лейн>";
	["Dalronn the Controller"] = "Далронн Контролирующий";
	["Ingvar the Plunderer"] = "Ингвар Расхититель";

	--Utgarde Keep: Utgarde Pinnacle
	["Brigg Smallshanks"] = "Бригг Мелкотруб";
	["Svala Sorrowgrave"] = "Свала Вечноскорбящая"; 
	["Gortok Palehoof"] = "Горток Бледное Копыто";
	["Skadi the Ruthless"] = "Скади Безжалостный";
	["King Ymiron"] = "Король Имирон";
	["Skarvald the Constructor"] = "Скальвард Строитель";

	--Vault of Archavon
	["Archavon the Stone Watcher"] = "Аркавон Каменный Страж";
	["Emalon the Storm Watcher"] = "Эмалон Созерцатель Бури";
	
};
end 