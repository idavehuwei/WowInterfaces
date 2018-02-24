--[[

	AtlasQuest, a World of Warcraft addon.
	Email me at mystery8@gmail.com

	This file is part of AtlasQuest.

	AtlasQuest is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	AtlasQuest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with AtlasQuest; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

	Russian localizatiton by lorientalas. e-mail: lorientalas@gmail.com
	WotLK Quests: Russian localizatiton by EvgeshaH. e-mail: EvgeshaH@gmail.com
--]]

if ( GetLocale() == "ruRU" ) then

---------------
--- COLOURS ---
---------------

local GREY = "|cff999999";
local RED = "|cffff0000";
local REDA = "|cffcc6666";
local WHITE = "|cffFFFFFF";
local GREEN = "|cff1eff00";
local PURPLE = "|cff9F3FFF";
local BLUE = "|cff0070dd";
local ORANGE = "|cffFF8400";
local YELLOW = "|cffFFd200";   -- Ingame Yellow

---------------
--- OPTIONS ---
---------------

AQHelpText = ""..WHITE.."наберите /aq или atlasquest "..YELLOW.."[команда]"..WHITE.."\nкоманды: help; option/config; show/hide; left/right; colour; autoshow"..RED.."(только Атлас)"
--
AQOptionsCaptionTEXT = ""..YELLOW.."Настройки Атласа Заданий";
AQ_OK = "OK"

-- Autoshow
AQOptionsAutoshowTEXT = ""..WHITE.."Показывать панель Атласа Заданий вместе с "..RED.."Атласом"..WHITE..".";
AQAtlasAutoON = "Панель Атласа Заданий будет показана когда вы откроете Атлас."..GREEN.."(по умолчанию)"
AQAtlasAutoOFF = "Панель Атласа Заданий "..RED.."не будет"..WHITE.." показана когда вы откроете Атлас."

-- Right/Left
AQOptionsLEFTTEXT = ""..WHITE.."Показать панель Атласа Заданий "..RED.."слева"..WHITE..".";
AQOptionsRIGHTTEXT = ""..WHITE.."Показать панель Атласа Заданий "..RED.."справа"..WHITE..".";
AQShowRight = "Теперь показывать панель Атласа Заданий "..RED.."справа"..WHITE..".";
AQShowLeft = "Теперь показывать панель Атласа Заданий "..RED.."слева"..WHITE.." "..GREEN.."(по умолчанию)";

-- Colour Check
AQOptionsCCTEXT = ""..WHITE.."Подкрасить задания в соответствии с их уровнем."
AQCCON = "Теперь Атлас Заданий будет подкрашивать задания в соответствии с уровнем."
AQCCOFF = "Атлас Заданий не будет подкрашивать задания."

-- QuestLog Colour Check
AQQLColourChange = ""..WHITE.."Подкрашивать все задания, имеющиеся в журнале "..BLUE.."синим."

-- AutoQuery Quest Rewards
AQOptionsAutoQueryTEXT = ""..WHITE.."Автоматически запрашивать у сервера предметы которые вы не видели."

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = ""..WHITE.."Подавление спама запросов к серверу."

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = ""..WHITE.."Сравнение награды с надетыми вещами."


AQAbilities = BLUE .. "Способности:" .. WHITE;
AQSERVERASKInformation = " Пожалйста нажимайте ПКМ пока не увидите окно предмета."
AQSERVERASKAuto = " Попробуйте задержать курсор мыши над предметом на секунду."
AQSERVERASK = "Атлас Заданий запрашивает сервер о: "
AQERRORNOTSHOWN = "Этот предмет небезопасен!"
AQERRORASKSERVER = "ПКМ чтобы запросить сервер об \nэтом предмете. Вы можете быть отсоединены от сервера."
AQOptionB = "Настройки"
AQStoryB = "История"
AQNoReward = ""..BLUE.." Нет наград"
AQDiscription_OR = ""..GREY.." или "..WHITE..""
AQDiscription_AND = ""..GREY.." и "..WHITE..""
AQDiscription_REWARD = ""..BLUE.." Награда: "
AQDiscription_ATTAIN = "Доступно: "
AQDiscription_LEVEL = "Уровень: "
AQDiscription_START = "Начинается у: \n"
AQDiscription_AIM = "Цель: \n"
AQDiscription_NOTE = "Заметка: \n"
AQDiscription_PREQUEST= "Предыдущее задание: "
AQDiscription_FOLGEQUEST = "Следующее задание: "
AQFinishedTEXT = "Задание сделано: ";

------------------
--- ITEM TYPES ---
------------------

AQITEM_DAGGER = " Кинжал"
AQITEM_POLEARM = " Древковое"
AQITEM_SWORD = " Меч"
AQITEM_AXE = " Топор"
AQITEM_WAND = "Жезл"
AQITEM_STAFF = "Посох"
AQITEM_MACE = " Ударное"
AQITEM_SHIELD = "Щит"
AQITEM_GUN = "Ружье"
AQITEM_BOW = "Лук"
AQITEM_CROSSBOW = "Арбалет"
AQITEM_THROWN = "Метательное"

AQITEM_WAIST = "Пояс,"
AQITEM_SHOULDER = "Плечо,"
AQITEM_CHEST = "Грудь,"
AQITEM_LEGS = "Ноги,"
AQITEM_HANDS = "Кисти рук,"
AQITEM_FEET = "Ступни,"
AQITEM_WRIST = "Запястья,"
AQITEM_HEAD = "Голова,"
AQITEM_BACK = "Спина"
AQITEM_TABARD = "Гербовая накидка"

AQITEM_CLOTH = " Ткань"
AQITEM_LEATHER = " Кожа"
AQITEM_MAIL = " Кольчуга"
AQITEM_PLATE = " Латы"

AQITEM_OFFHAND = "Левая рука"
AQITEM_MAINHAND = "Правая рука,"
AQITEM_ONEHAND = "Одноручное,"
AQITEM_TWOHAND = "Двуручное,"

AQITEM_ITEM = "Предмет" -- Use this for those oddball rewards which aren't really anything else.
AQITEM_TRINKET = "Аксессуар"
AQITEM_RELIC = "Реликвия"
AQITEM_POTION = "Зелье"
AQITEM_OFFHAND = "Левая рука"
AQITEM_NECK = "Шея"
AQITEM_PATTERN = "Выкройка"
AQITEM_BAG = "Сумка"
AQITEM_RING = "Палец"
AQITEM_KEY = "Ключ"
AQITEM_GEM = "Самоцвет"
AQITEM_QUIVER = "Колчан"
AQITEM_AMMOPOUCH = "Подсумок"
AQITEM_ENCHANT = "Чары"
AQITEM_EMBLEM = "Эмблема"


----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------



--------------- INST36 - No Instance ---------------

-- Just to display "No Quests" when the map is set to something AtlasQuest does not support. I'll probably find a better way of doing this later.
Inst36Story = ""
Inst36Caption = "Нет доступной информации"
Inst36QAA = "Нет заданий"
Inst36QAH = "Нет заданий"



--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "Когда-то величайший золотодобывающий центр в землях людей, Мертвые Копи были заброшены когда Орда не оставила камня на камне от Штормграда во время Первой Войны. Сейчас их заняло Братство Справедливости и превратило темные тоннели и в их собственное святилище. Ходят слухи что воры призвали умных гоблинов, чтобы те помогли им построить что-то ужасное в глубине копей - но что это может быть до сих пор не ясно. По слухам путь в Мертвые Копи лежит через тихую, скромную деревушку Луноречье."
Inst1Caption = "Мертвые копи"
Inst1QAA = "7 Заданий" -- how many quests for alliance
Inst1QAH = "Нет заданий" -- for horde

--Quest 1 Alliance
Inst1Quest1 = "1. Красные шелковые банданы"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "14"
Inst1Quest1_Aim = "Принесите 10 красных шелковых бандан разведчице Риэле к башне на Сторожевом холме."
Inst1Quest1_Location = "Разведчица Риэла (Западный Край - Сторожевой холм; "..YELLOW.."56, 47"..WHITE..")"
Inst1Quest1_Note = "Вы можете получить красные шелковые банданы с шахтеров в Мертвых копях или в городе где находится подземелье. Задание становится доступным после выполнения цепочки заданий Братства Справедливости до стадии когда вам нужно убить Эдвина Ван Клифа."
Inst1Quest1_Prequest = "Нет (смотрите Заметку)"
Inst1Quest1_Folgequest = "Нет"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "Solid Shortblade"
Inst1Quest1name2 = "Scrimshaw Dagger"
Inst1Quest1name3 = "Piercing Axe"

--Quest 2 Alliance
Inst1Quest2 = "2. Сбор воспоминаний"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "Добудьте 4 карточки Союза шахтеров и верните их Дикому Чертополохху в Штормград."
Inst1Quest2_Location = "Чертополохх Дикий (Штормград - Квартал дворфов; "..YELLOW.."70.3, 40.8"..WHITE..")"
Inst1Quest2_Note = "Карточки падают с нежити снаружи подземелья около "..YELLOW.."[3]"..WHITE.." на Карте входа."
Inst1Quest2_Prequest = "Нет"
Inst1Quest2_Folgequest = "Нет"
--
Inst1Quest2name1 = "Tunneler's Boots"
Inst1Quest2name2 = "Dusty Mining Gloves"

--Quest 3 Alliance
Inst1Quest3 = "3. О, брат мой..."
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "15"
Inst1Quest3_Aim = "Принесите значок Лиги Исследователей, принадлежавший штейгеру Чертополоху в Штормград."
Inst1Quest3_Location = "Чертополохх Дикий (Штормград - Квартал дворфов; "..YELLOW.."70.3, 40.8"..WHITE..")"
Inst1Quest3_Note = "Штейгер Чертополохх находится снаружи подземелья в зоне нежити около "..YELLOW.."[3]"..WHITE.." на Карте входа."
Inst1Quest3_Prequest = "Нет"
Inst1Quest3_Folgequest = "Нет"
--
Inst1Quest3name1 = "Miner's Revenge"

--Quest 4 Alliance
Inst1Quest4 = "4. Битва под землей"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "Принесите Шони Молшунье в Штормград зубчатый спрек-механизм гномов из Мертвых копей."
Inst1Quest4_Location = "Шони Молшунье (Штормград - Квартал дворфов; "..YELLOW.."62.6, 34.1"..WHITE..")"
Inst1Quest4_Note = "Предшествующее задание можно взять у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЗубчатый спрек-механизм гномов падает с Sneed's Shredder "..YELLOW.."[3]"..WHITE.."."
Inst1Quest4_Prequest = "Разговор с Шони"
Inst1Quest4_Folgequest = "Нет"
Inst1Quest4PreQuest = "true"
--
Inst1Quest4name1 = "Polar Gauntlets"
Inst1Quest4name2 = "Sable Wand"

--Quest 5 Alliance
Inst1Quest5 = "5. Братство Справедливости"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "Убейте Эдвина Ван Клифа и принесите его голову Гриану Камнегриву."
Inst1Quest5_Location = "Гриан Камнегрив (Западный край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..")"
Inst1Quest5_Note = "Вы начинаете линейку у Гриана Камнегрива (Западный Край - Сторожевой холм; "..YELLOW.."56,47"..WHITE..").\nЭдвин Ван Клиф это последний босс в Мертвых копях. Вы найдете его на верхней палубе корабля "..YELLOW.."[6]"..WHITE.."."
Inst1Quest5_Prequest = "Братство справедливости."
Inst1Quest5_Folgequest = "Неотосланное письмо"
Inst1Quest5PreQuest = "true"
--
Inst1Quest5name1 = "Chausses of Westfall"
Inst1Quest5name2 = "Tunic of Westfall"
Inst1Quest5name3 = "Staff of Westfall"

--Quest 6 Alliance
Inst1Quest6 = "6. Испытание доблести (Паладин)"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
Inst1Quest6_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
Inst1Quest6_Note = "Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
Inst1Quest6_Page = {2, "Только паладины могут получить это задание!\n\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; "..YELLOW.."35,44"..WHITE.."). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около "..YELLOW.."71,21"..WHITE.."\n\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; "..YELLOW.."37,40"..WHITE..") и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для вас.", };
Inst1Quest6_Prequest = "Фолиант Отваги -> Испытание доблести"
Inst1Quest6_Folgequest = "Испытание доблести"
Inst1Quest6PreQuest = "true"
--
Inst1Quest6name1 = "Verigan's Fist"

--Quest 7 Alliance
Inst1Quest7 = "7. Неотосланное письмо"
Inst1Quest7_Level = "22"
Inst1Quest7_Attain = "16"
Inst1Quest7_Aim = "Доставьте письмо городскому архитектору Баросу Алекстону в Штормград."
Inst1Quest7_Location = "Неотосланное письмо (Падает с Эдвина Ван Клифа; "..YELLOW.."[6]"..WHITE..")"
Inst1Quest7_Note = "Барос Алекстон находится в Штормграде, рядом с Собором Света около "..YELLOW.."57.7, 47.9"..WHITE.."."
Inst1Quest7_Prequest = "Нет"
Inst1Quest7_Folgequest = "Базиль Тредд"
-- No Rewards for this quest



--------------- INST2 - Wailing Caverns (WC) ---------------

Inst2Story = "Не так давно друид ночных эльфов по имени Наралекс обнаружил сеть подземных пещер прямо в сердце Степей. Названные 'Пещерами стенаний', эти естественные пещеры были наполнены трещинами, которые производили долгие жалобные стоны когда пар вырывался из них. Наралекс верил, что он сможет использовать подземные источники пещер для восстановления буйства красок и изобилия Степей - но для исполнения этого потребовалоь перекачивание энергий из сказочного Изумрудного Сна. Однако однажды соединившись со Сном, видения друида превратились в кошмар.  Вскоре Пещеры стенаний начали меняться - воды наполнились грязью и некогда послушные существа внутри превратились в порочных, смертоносных хищников. Поговоривают что сам Наралекс все еще находится где-то в сердце лабиринта, попавший в капкан пределов Изумрудного Сна. Даже его бывшие ученики были испорчены ожившим кошмаром учителя - они превратились в злобных Друидов Клыка."
Inst2Caption = "Пещеры стенаний"
Inst2QAA = "5 Заданий"
Inst2QAH = "7 Заданий"

--Quest 1 Alliance
Inst2Quest1 = "1. Шкуры загадочных существ"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "13"
Inst2Quest1_Aim = "Наплак в Пещерах стенаний хочет чтобы вы принесли ему 20 оскверненных шкур."
Inst2Quest1_Location = "Наплак (Степи - Пещеры стенаний; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest1_Note = "Со всех существ внутри и перед подземельем можно подобрать шкуры.\nНаплака можно найти в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
Inst2Quest1_Prequest = "Нет"
Inst2Quest1_Folgequest = "Нет"
--
Inst2Quest1name1 = "Поножи из искаженной чешуи"
Inst2Quest1name2 = "Сума из скверной чешуи"

--Quest 2 Alliance
Inst2Quest2 = "2. Неприятности в порту"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "Оператор крана Биггльфузз из Кабестана хочет чтобы вы забрали бутылку портвейна 99-леней выдержки у Безумного Магглиша, который прячется в Пещерах стенаний"
Inst2Quest2_Location = "Оператор крана Биггльфузз (Степи - Кабестан; "..YELLOW.."63,37"..WHITE..")"
Inst2Quest2_Note = "Получить бутылку можно прямо перед тем как вы войдете в подземелье, убив Безумного Магглиша. Когда вы только вошли в пещеру идите направо и найдете его в конце прохода. Он скрывается у стены около "..YELLOW.."[2] на Карте Входа"..WHITE.."."
Inst2Quest2_Prequest = "Нет"
Inst2Quest2_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 3 Alliance
Inst2Quest3 = "3. Умный напиток"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "14"
Inst2Quest3_Aim = "Принеси 6 порций Воющей субстанции Мебоку Миззриксу в Кабестан."
Inst2Quest3_Location = "Мебок Миззрикс (Степи - Кабестан; "..YELLOW.."62,37"..WHITE..")"
Inst2Quest3_Note = "Предшествующее задание также можно взять у Мебока Миззрикса.\nИз всех врагов-эктоплазмы внутри и перед подземельем можно достать субстанцию."
Inst2Quest3_Prequest = "Рога ящеров"
Inst2Quest3_Folgequest = "Нет"
Inst2Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst2Quest4 = "4. Искоренение Скверны"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "15"
Inst2Quest4_Aim = "Эбру в Пещерах стенаний хочет чтобы вы убили 7 Загадочных опустошителей, 7 Загадочных гадюк, 7 Загадочных шаркунов и 7 Загадочных страхозубов."
Inst2Quest4_Location = "Эбру (Степи - Пещеры стенаний; "..YELLOW.."47,36"..WHITE..")"
Inst2Quest4_Note = "Эбру находится в тайной пещере над входом в Пещеры стенаний. Простейший путь увидеть его - забраться на гору позади входа и спрыгнуть на небольшой выступ слева над входом в пещеру."
Inst2Quest4_Prequest = "Нет"
Inst2Quest4_Folgequest = "Нет"
--
Inst2Quest4name1 = "Выкройка: Пояс из искаженной чешуи"
Inst2Quest4name2 = "Шипящее древко"
Inst2Quest4name3 = "Рукавицы грязнотопи"

--Quest 5 Alliance
Inst2Quest5 = "5. Светящийся осколок"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "Посетите Кабестан и поспрашивайте о светящемся осколке."
Inst2Quest5_Location = "Светящийся осколок (Падает с Мутануса Пожирателя; "..YELLOW.."[9]"..WHITE..")"
Inst2Quest5_Note = "Мутанус Пожиратель появляется только если вы убили всех 4 повелителей змей и проводили таурена-друда от входа.\nКогда вы возьмете осколок, вам нужно принести его к гоблину-пилоту около банка в Кабестане, а потом на вершину горы над Пещерами стенаний к Фалле Мудрости Ветра."
Inst2Quest5_Prequest = "Нет"
Inst2Quest5_Folgequest = "Кошмары"
--
Inst2Quest5name1 = "Talbar Mantle"
Inst2Quest5name2 = "Quagmire Galoshes"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst2Quest1_HORDE = Inst2Quest1
Inst2Quest1_HORDE_Level = Inst2Quest1_Level
Inst2Quest1_HORDE_Attain = Inst2Quest1_Attain
Inst2Quest1_HORDE_Aim = Inst2Quest1_Aim
Inst2Quest1_HORDE_Location = Inst2Quest1_Location
Inst2Quest1_HORDE_Note = Inst2Quest1_Note
Inst2Quest1_HORDE_Prequest = Inst2Quest1_Prequest
Inst2Quest1_HORDE_Folgequest = Inst2Quest1_Folgequest
--
Inst2Quest1name1_HORDE = Inst2Quest1name1
Inst2Quest1name2_HORDE = Inst2Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst2Quest2_HORDE = Inst2Quest2
Inst2Quest2_HORDE_Level = Inst2Quest2_Level
Inst2Quest2_HORDE_Attain = Inst2Quest2_Attain
Inst2Quest2_HORDE_Aim = Inst2Quest2_Aim
Inst2Quest2_HORDE_Location = Inst2Quest2_Location
Inst2Quest2_HORDE_Note = Inst2Quest2_Note
Inst2Quest2_HORDE_Prequest = Inst2Quest2_Prequest
Inst2Quest2_HORDE_Folgequest = Inst2Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde
Inst2Quest3_HORDE = "3. Змеецвет"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "Аптекарша Зама в Громовом Утесе хочет чтобы вы собрали 10 Змеецветов."
Inst2Quest3_HORDE_Location = "Аптекарша Зама (Громовой Утес - Вершина Духов; "..YELLOW.."22,20"..WHITE..")"
Inst2Quest3_HORDE_Note = "Аптекарша Зама находится в пещере под Вершиной Духов.\nСобрать Змеецвет можно внутри пещеры перед подземельем и внутри него. Игроки с навыком травничества могут видеть Змеецвет на миникарте."
Inst2Quest3_HORDE_Prequest = "Нет"
Inst2Quest3_HORDE_Folgequest = "Нет"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "Перчатки Аптекаря"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst2Quest4_HORDE = "4. Умный напиток"
Inst2Quest4_HORDE_Level = Inst2Quest3_Level
Inst2Quest4_HORDE_Attain = Inst2Quest3_Attain
Inst2Quest4_HORDE_Aim = Inst2Quest3_Aim
Inst2Quest4_HORDE_Location = Inst2Quest3_Location
Inst2Quest4_HORDE_Note = Inst2Quest3_Note
Inst2Quest4_HORDE_Prequest = Inst2Quest3_Prequest
Inst2Quest4_HORDE_Folgequest = Inst2Quest3_Folgequest
Inst2Quest4PreQuest_HORDE = Inst2Quest3PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 4 Alliance)
Inst2Quest5_HORDE = "5. Искоренение Скверны"
Inst2Quest5_HORDE_Level = Inst2Quest4_Level
Inst2Quest5_HORDE_Attain = Inst2Quest4_Attain
Inst2Quest5_HORDE_Aim = Inst2Quest4_Aim
Inst2Quest5_HORDE_Location = Inst2Quest4_Location
Inst2Quest5_HORDE_Note = Inst2Quest4_Note
Inst2Quest5_HORDE_Prequest = Inst2Quest4_Prequest
Inst2Quest5_HORDE_Folgequest = Inst2Quest4_Folgequest
--
Inst2Quest5name1_HORDE = Inst2Quest4name1
Inst2Quest5name2_HORDE = Inst2Quest4name2
Inst2Quest5name3_HORDE = Inst2Quest4name3

--Quest 6 Horde
Inst2Quest6_HORDE = "6. Повелители змей"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "Принеси Камни Кобрана, Анакондры, Питонаса и Серпентиса Наре Вилдмэйн в Громовой Утес."
Inst2Quest6_HORDE_Location = "Нара Буйногривая (Громовой Утес - Вершина старейшин; "..YELLOW.."75,31"..WHITE..")"
Inst2Quest6_HORDE_Note = "Серия заданий начинается у Хамуула Рунного Тотема. (Громовой Утес - Вершина старейшин; "..YELLOW.."78,28"..WHITE..")\nКамни падают с 4 друидов "..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."."
Inst2Quest6_HORDE_Prequest = "Оазисы Степей -> Нара Буйногривая"
Inst2Quest6_HORDE_Folgequest = "Нет"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "Посох Полумесяца"
Inst2Quest6name2_HORDE = "Клинок-крыло"

--Quest 7 Horde  (same as Quest 5 Alliance)
Inst2Quest7_HORDE = "7. Светяшийся осколок"
Inst2Quest7_HORDE_Level = Inst2Quest5_Level
Inst2Quest7_HORDE_Attain = Inst2Quest5_Attain
Inst2Quest7_HORDE_Aim = Inst2Quest5_Aim
Inst2Quest7_HORDE_Location = Inst2Quest5_Location
Inst2Quest7_HORDE_Note = Inst2Quest5_Note
Inst2Quest7_HORDE_Prequest = Inst2Quest5_Prequest
Inst2Quest7_HORDE_Folgequest = Inst2Quest5_Folgequest
--
Inst2Quest7name1_HORDE = Inst2Quest5name1
Inst2Quest7name2_HORDE = Inst2Quest5name2



--------------- INST3 - Ragefire Chasm (RFC) ---------------

Inst3Story = "Огненная пропасть представляет из себя сеть вулканических пещер которые пролегают под новой столицей орков - Оргриммаром. Недавно, прошел слух, что приверженцы демонического культа Совета Теней устроили логово в пламенных глубинах Пропасти. Этот культ, именуемый Пылающий Клинок, угрожает самой независимости Дуротара. Многие верят что Военный Вождь орков, Тралл, знает о существовании Клинка и не стал уничтожать его в надежде на то, что его члены приведут его прямо к Совету Теней. Так или иначе, всплески тёмных сил из Огненной пропасти могут унижтожить все, чего орки пытались достичь."
Inst3Caption = "Огненная пропасть"
Inst3QAA = "Нет заданий"
Inst3QAH = "5 Заданий"

--Quest 1 Horde
Inst3Quest1_HORDE = "1. Испытание силы врага"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "9"
Inst3Quest1_HORDE_Aim = "Найдите в Оргриммаре Огненную пропасть, затем убейте 8 Троггов Огненной пропасти и 8 Шаманов Огненной пропасти перед тем как вернуться к Рахауро в Громовой Утес."
Inst3Quest1_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest1_HORDE_Note = "Вы найдете троггов в самом начале подземелья."
Inst3Quest1_HORDE_Prequest = "Нет"
Inst3Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Horde
Inst3Quest2_HORDE = "2. Силы разрушения..."
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "9"
Inst3Quest2_HORDE_Aim = "Принесите книги Заклинания Тени и Заклятия Пустоты к Вариматрасу в Подгород."
Inst3Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst3Quest2_HORDE_Note = "Книги падают с Сектантов и Чернокнижников из клана Пылающего клинка"
Inst3Quest2_HORDE_Prequest = "Нет"
Inst3Quest2_HORDE_Folgequest = "Нет"
--
Inst3Quest2name1_HORDE = "Ghastly Trousers"
Inst3Quest2name2_HORDE = "Dredgemire Leggings"
Inst3Quest2name3_HORDE = "Gargoyle Leggings"

--Quest 3 Horde
Inst3Quest3_HORDE = "3. В поисках потерянного ранца"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "9"
Inst3Quest3_HORDE_Aim = "Обыщите Огненную пропасть в поисках тела Маура Зловещего Тотема и интересных вещей."
Inst3Quest3_HORDE_Location = "Рахауро (Громовой Утес - Вершина Старейшин; "..YELLOW.."70,29"..WHITE..")"
Inst3Quest3_HORDE_Note = "Вы найдете Маура Зловещего Тотема около "..YELLOW.."[1]"..WHITE..". После того как найдете рюкзак, вы должны вернуть его Рахауро в Громовой Утес"
Inst3Quest3_HORDE_Prequest = "Нет"
Inst3Quest3_HORDE_Folgequest = "Возвращение Потеряного ранца"
--
Inst3Quest3name1_HORDE = "Featherbead Bracers"
Inst3Quest3name2_HORDE = "Savannah Bracers"

--Quest 4 Horde
Inst3Quest4_HORDE = "4. Тайные враги"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "9"
Inst3Quest4_HORDE_Aim = "Убейте Баззалана и Джергоша Извергателя перед тем как вернуться к Траллу в Оргриммар."
Inst3Quest4_HORDE_Location = "Тралл (Оргриммар - Аллея Мудрости; "..YELLOW.."31,37"..WHITE..")"
Inst3Quest4_HORDE_Note = "Вы найдете Баззалана около  "..YELLOW.."[4]"..WHITE.." и Джергоша около "..YELLOW.."[3]"..WHITE..". Линейка заданий начинается у Военного вождя Тралла в Оргриммаре."
Inst3Quest4_HORDE_Prequest = "Тайные враги"
Inst3Quest4_HORDE_Folgequest = "Тайные враги"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "Kris of Orgrimmar"
Inst3Quest4name2_HORDE = "Hammer of Orgrimmar"
Inst3Quest4name3_HORDE = "Axe of Orgrimmar"
Inst3Quest4name4_HORDE = "Staff of Orgrimmar"

--Quest 5 Horde
Inst3Quest5_HORDE = "5. Убить тварь"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "9"
Inst3Quest5_HORDE_Aim = "Войдите в Огненную пропасть и убейте Тарагамана Ненасытного, а потом принесите его сердце Ниру Огненному Клинку в Оргриммар."
Inst3Quest5_HORDE_Location = "Ниру Огненный Клинок (Оргриммар - Расселина Теней; "..YELLOW.."49,50"..WHITE..")"
Inst3Quest5_HORDE_Note = "Вы найдете Тарагамана около "..YELLOW.."[2]"..WHITE.."."
Inst3Quest5_HORDE_Prequest = "Нет"
Inst3Quest5_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST4 - Uldaman (Ulda) ---------------

Inst4Story = "Ульдаман - это древний чертог Титанов, построеный глубоко в толще земли с самого сотворения мира. В недалеком прошлом археологи дворфов проникли в этот забытый город, выпустив первых нейдачных творений Титанов: троггов. Легенды гласят, что титаны создали троггов из камня. Когда они посчитали эксперимент провалившимся, Титаны изолировали троггов и попробовали снова - результатом стало создание расы дворфов. Тайны создания дворфов записаны на мифических Дисках Норганнона - массивных артефактах Титанов, находящихся в глубине древнего города. Недавно, дворфы Темного Железа начали серию набегов в Ульдаман, в надежде захватить диски для их несдержанного мастера, Рагнароса. Однако, подземный город защищало несколько стражей - гигантские големы из живого камня, что сокрушат любого несчастливого нарушителя, которого найдут. Сами Диски охраняйтся массивным, разумным Каменным хранителем по имени Архедас. Некоторые слухи даже предполагают, что каменнокожие предки дворфов, Подземники, все еще обитают в глубоко скрытых переходах города."
Inst4Caption = "Ульдаман"
Inst4QAA = "17 Заданий"
Inst4QAH = "11 Заданий"

--Quest 1 Alliance
Inst4Quest1 = "1. Предвестник надежды"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "Найдите Греза Тяжелоступа в Ульдамане."
Inst4Quest1_Location = "Геолог Ржанец (Бесплодные земли; "..YELLOW.."53,43"..WHITE..")"
Inst4Quest1_Note = "Предшествующее задание начинается с Мятой карты (Бесплодные земли; "..YELLOW.."53,33"..WHITE..").\nВы найдете Тяжелоступа Греза перед тем как вы войдете в подземелье, около "..YELLOW.."[1]"..WHITE.." на Карте входа."
Inst4Quest1_Prequest = "Предвестник надежды"
Inst4Quest1_Folgequest = "Амулет Тайн"
Inst4Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst4Quest2 = "2. Амулет Тайн"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "35"
Inst4Quest2_Aim = "Найдите амулет Тяжелоступа и верните его ему в Ульдаман."
Inst4Quest2_Location = "Тяжелоступ Грез (Ульдаман; "..YELLOW.."[1] на Карте входа"..WHITE..")."
Inst4Quest2_Note = "Амулет падает из Магрегана Чернотени около "..YELLOW.."[2] на Карте входа"..WHITE.."."
Inst4Quest2_Prequest = "Предвестник надежды"
Inst4Quest2_Folgequest = "Клятва верности"
Inst4Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst4Quest3 = "3. Утерянные таблички Воли"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "35"
Inst4Quest3_Aim = "Найдите табличку Воли и принесите ее советнику Белграму в Стальгорн."
Inst4Quest3_Location = "Советник Белгрум (Стальгорн - Зал исследователей; "..YELLOW.."77,10"..WHITE..")"
Inst4Quest3_Note = "Табличка находится около "..YELLOW.."[8]"..WHITE.."."
Inst4Quest3_Prequest = "Амулет Тайн -> Посланник Зла"
Inst4Quest3_Folgequest = "Нет"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "Медаль храбрости"

--Quest 4 Alliance
Inst4Quest4 = "4. Камни Силы"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "30"
Inst4Quest4_Aim = "Принесите 8 дентриевых камней Силы и 8 энелиевых камней Силы Ригглфаззу в Бесплодные земли."
Inst4Quest4_Location = "Ригглфазз (Бесплодные земли; "..YELLOW.."42,52"..WHITE..")"
Inst4Quest4_Note = "Камни можно найти на любом враге из клана Тенегорна перед и внутри подземелья."
Inst4Quest4_Prequest = "Нет"
Inst4Quest4_Folgequest = "Нет"
--
Inst4Quest4name1 = "Energized Stone Circle"
Inst4Quest4name2 = "Duracin Bracers"
Inst4Quest4name3 = "Everlast Boots"

--Quest 5 Alliance
Inst4Quest5 = "5. Судьба Эгмонда"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "30"
Inst4Quest5_Aim = "Принесите 4 резные каменные урны геологу Сталекруту в Лок Модан."
Inst4Quest5_Location = "Геолог Сталекрут (Лок Модан - Раскопки Сталекрута; "..YELLOW.."65,65"..WHITE..")"
Inst4Quest5_Note = "Предшествующее задание начинается у геолога Грозовой Вершины (Стальгорн - Зал исследователей; "..YELLOW.."74,12"..WHITE..").\nУрны расбросаны по пещерам перед подземельем."
Inst4Quest5_Prequest = "Вы нужны Сталекруту! -> Мурдалок"
Inst4Quest5_Folgequest = "Нет"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "Prospector Gloves"

--Quest 6 Alliance
Inst4Quest6 = "6. Лекарство от судьбы"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "30"
Inst4Quest6_Aim = "Принесите табличку Рьюн'эха Тельдарину Заблудшему."
Inst4Quest6_Location = "Тельдарин Заблудший (Бесплодные земли; "..YELLOW.."51,76"..WHITE..")"
Inst4Quest6_Note = "Табличка находится на севере пещер, в восточном конце туннеля, перед подземельем. На карте входа, это около "..YELLOW.."[3]"..WHITE.."."
Inst4Quest6_Prequest = "Нет"
Inst4Quest6_Folgequest = "В Стальгорн за книгой Йагина"
--
Inst4Quest6name1 = "Doomsayer's Robe"

--Quest 7 Alliance
Inst4Quest7 = "7. Потерянные дворфы"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "35"
Inst4Quest7_Aim = "Найдите Бейлога в Ульдамане."
Inst4Quest7_Location = "Геолог Грозовая Вершина (Стальгорн - Зал исследователей; "..YELLOW.."75,12"..WHITE..")"
Inst4Quest7_Note = "Бейлог находится около "..YELLOW.."[1]"..WHITE.."."
Inst4Quest7_Prequest = "Нет"
Inst4Quest7_Folgequest = "Секретная комната"
-- No Rewards for this quest

--Quest 8 Alliance
Inst4Quest8 = "8. Тайная Комната"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "35"
Inst4Quest8_Aim = "Прочитайте журнал Бейлога, исследуйте, потайной чертог и потом доложите об увиденном геологу Грозовой Вершине."
Inst4Quest8_Location = "Бейлог (Ульдаман; "..YELLOW.."[1]"..WHITE..")"
Inst4Quest8_Note = "Тайная комната находится около "..YELLOW.."[4]"..WHITE..". Чтобы открыть тайную комнату вам понадобится Стержень Тсола с Ревелоша "..YELLOW.."[3]"..WHITE.." и Медальон Гни'кив из сундука Баэлога "..YELLOW.."[1]"..WHITE..". Соберите из этих предметов Доисторический посох. Посох используется в Комнате Карты между "..YELLOW.."[3] и [4]"..WHITE.." для вызова Иронаи. После того как убьете её, забегите в комнату откуда она пришла, чтобы выполнить задание."
Inst4Quest8_Prequest = "Потерянные дворфы"
Inst4Quest8_Folgequest = "Нет"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "Dwarven Charge"
Inst4Quest8name2 = "Explorer's League Lodestar"

--Quest 9 Alliance
Inst4Quest9 = "9. Порванное ожерелье"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "Найдите создателя ожерелья, чтобы узнать, чего оно стоит."
Inst4Quest9_Location = "Сломанное ожерелье (Падает случайно в Ульдамане)"
Inst4Quest9_Note = "Принесите ожерелье Талвашу де Кисселю (Стальгорн - The Палаты Магии; "..YELLOW.."36,3"..WHITE..")."
Inst4Quest9_Prequest = "Нет"
Inst4Quest9_Folgequest = "Мудрость за деньги"
-- No Rewards for this quest

--Quest 10 Alliance
Inst4Quest10 = "10. Назад в Ульдаман"
Inst4Quest10_Level = "42"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "Выясните, где именно в Ульдамане находится ожерелье Талваша. Убитый паладин, о котором он упоминал, был последним владельцем этого ожерелья."
Inst4Quest10_Location = "Талваш де Киссель (Стальгорн - Палаты магии; "..YELLOW.."36,3"..WHITE..")"
Inst4Quest10_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
Inst4Quest10_Prequest = "Мудрость за деньги"
Inst4Quest10_Folgequest = "Время собирать камни"
Inst4Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst4Quest11 = "11. Время собирать камни"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "37"
Inst4Quest11_Aim = "Найдите рубин, сапфир, и топаз, которые спрятаны в разных местах Ульдамана. Когда найдете, свяжитесь с Талвашем де Кисселем, используя фиал Видения, который он предварительно дал тебе."
Inst4Quest11_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest11_Note = "Камни находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Теневого горна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют вас.\nИспользуйте Чашу прорицания Талваша, чтобы сдать задание и продожить дальше."
Inst4Quest11_Prequest = "Назад в Ульдаман"
Inst4Quest11_Folgequest = "Восстановление ожерелья"
Inst4Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst4Quest12 = "12. Восстановить ожерелье"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "37"
Inst4Quest12_Aim = "Добудьте источник энергии из самого мощного волшебного создания, которое найдете в Ульдамане и доставьте его Талвашу де Кисселю в Стальгорн."
Inst4Quest12_Location = "Гадальная чаша Талваша"
Inst4Quest12_Note = "Источник силы сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
Inst4Quest12_Prequest = "Найти камни."
Inst4Quest12_Folgequest = "Нет"
--
Inst4Quest12name1 = "Talvash's Enhancing Necklace"
Inst4Quest12FQuest = "true"

--Quest 13 Alliance
Inst4Quest13 = "13. В Ульдаман за реагентами"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "Принесите 12 грибов-малиновиков Гхаку Целителю в Телcамар."
Inst4Quest13_Location = "Гхак Целитель (Лок Модан - Телсамар; "..YELLOW.."37,49"..WHITE..")"
Inst4Quest13_Note = "Грибы есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание."
Inst4Quest13_Prequest = "За реактивами в Бесплодные земли"
Inst4Quest13_Folgequest = "За реактивами в Бесплодные земли II"
Inst4Quest13PreQuest = "true"
--
Inst4Quest13name1 = "Restorative Potion"

--Quest 14 Alliance
Inst4Quest14 = "14. Возвращенное сокровище"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "33"
Inst4Quest14_Aim = "Достаньте сокровище Крома Крепкорука из сундука в северном зале Ульдамана и принесите ему в Стальгорн"
Inst4Quest14_Location = "Кром Крепкорук (Стальгорн - Зал исследователей; "..YELLOW.."74,9"..WHITE..")"
Inst4Quest14_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля. На Карте входа, оно около "..YELLOW.."[4]"..WHITE.."."
Inst4Quest14_Prequest = "Нет"
Inst4Quest14_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 15 Alliance
Inst4Quest15 = "15. Платиновые Диски"
Inst4Quest15_Level = "47"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "Поговорите с каменным стражем и узнайте в чем заключается древнее знание. Как только вы узнаете все, что нужно, активируйте Диски Нограннона. -> Отнесите миниатюрную копию дисков Норганнона в Лигу Исследователей в Стальгорне."
Inst4Quest15_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest15_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести старшему исследователю Магелласу в Стальгорн - Зал исследователей ("..YELLOW.."69,18"..WHITE.."). Здесь есть другая линейка, которая называется Посмотрим что произойдет и начинается у историка Карника Стальгорн - Зал исследователей."
Inst4Quest15_Prequest = "Нет"
Inst4Quest15_Folgequest = "Нет"
--
Inst4Quest15name1 = "Thawpelt Sack"
Inst4Quest15name2 = "Superior Healing Potion"
Inst4Quest15name3 = "Greater Mana Potion"

--Quest 16 Alliance
Inst4Quest16 = "16. Сила Ульдамана (Маг)"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "Заберите Обсидиановый источник силы и принесите его Табете в Пылевые топи."
Inst4Quest16_Location = "Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
Inst4Quest16_Note = "Это задание доступно только для магов!\nОбсидиановый источник силы падает из Обсидианового стража около "..YELLOW.."[5]"..WHITE.."."
Inst4Quest16_Prequest = "Поединок с демоном"
Inst4Quest16_Folgequest = "Волнолов маны"
Inst4Quest16PreQuest = "true"
-- No Rewards for this quest

--Quest 17 Alliance
Inst4Quest17 = "17. Индарилиевая руда"
Inst4Quest17_Level = "42"
Inst4Quest17_Attain = "29"
Inst4Quest17_Aim = "Принесите 4 Индарилиевой руды Поззику в Тысячу Игл."
Inst4Quest17_Location = "Поззик (Тысяча Игл - Mirage Raceway; "..YELLOW.."80.1, 75.9"..WHITE..")"
Inst4Quest17_Note = "Это многоразовое задание дается после выполнения предыдущей цепочки. Оно не дает репутации или опыта, только немного монет. Индарилиевая руда может быть выкопана в Ульдамане, либо куплена у других игроков."
Inst4Quest17_Prequest = "Только вперед -> Чертежи Риззла"
Inst4Quest17_Folgequest = "Нет"
Inst4Quest17PreQuest = "true"
-- No Rewards for this quest



--Quest 1 Horde  (same as Quest 4 Alliance)
Inst4Quest1_HORDE = "1. Камни Силы"
Inst4Quest1_HORDE_Level = Inst4Quest4_Level
Inst4Quest1_HORDE_Attain = Inst4Quest4_Attain
Inst4Quest1_HORDE_Aim = Inst4Quest4_Aim
Inst4Quest1_HORDE_Location = Inst4Quest4_Location
Inst4Quest1_HORDE_Note = Inst4Quest4_Note
Inst4Quest1_HORDE_Prequest = Inst4Quest4_Prequest
Inst4Quest1_HORDE_Folgequest = Inst4Quest4_Folgequest
--
Inst4Quest1name1_HORDE = Inst4Quest4name1
Inst4Quest1name2_HORDE = Inst4Quest4name2
Inst4Quest1name3_HORDE = Inst4Quest4name3

--Quest 2 Horde  (same as Quest 6 Alliance - different followup)
Inst4Quest2_HORDE = "2. Лекарство от судьбы"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "В Подгород за книгой Йагина"
--
Inst4Quest2name1_HORDE = Inst4Quest6name1

--Quest 3 Horde
Inst4Quest3_HORDE = "3. Пропавшее ожерелье"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "Найдите на раскопках Ульдамана драгоценное ожерелье(возможно поврежденное) и принесите его Драну Дрофферсу в Оргриммар."
Inst4Quest3_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest3_HORDE_Note = "Ожерелье падает в подземелье случайно."
Inst4Quest3_HORDE_Prequest = "Нет"
Inst4Quest3_HORDE_Folgequest = "Пропавшее ожерелье, этап 2"
-- No Rewards for this quest

--Quest 4 Horde
Inst4Quest4_HORDE = "4. Пропавшее ожерелье, этап 2"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "Разыщите ключ к местонахождению самоцветов в глубинах Ульдамана."
Inst4Quest4_HORDE_Location = "Дран Дрофферс (Оргриммар - Волок; "..YELLOW.."59,36"..WHITE..")"
Inst4Quest4_HORDE_Note = "Паладин находится около "..YELLOW.."[2]"..WHITE.."."
Inst4Quest4_HORDE_Prequest = "Пропавшее ожерелье"
Inst4Quest4_HORDE_Folgequest = "Трудности перевода"
Inst4Quest4FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde
Inst4Quest5_HORDE = "5. Трудности перевода"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "37"
Inst4Quest5_HORDE_Aim = "Найди кого-нибудь кто сможет перевести журнал паладина. Ближайшее место это Каргат, в Бесплодных землях."
Inst4Quest5_HORDE_Location = "Останки паладина (Ульдаман; "..YELLOW.."[2]"..WHITE..")"
Inst4Quest5_HORDE_Note = "Переводчик Джаркал Замшелый Клык находится в Каргате (Бесплодные земли; "..YELLOW.."2,46"..WHITE..")."
Inst4Quest5_HORDE_Prequest = "Восстановление ожерелья, этап 2"
Inst4Quest5_HORDE_Folgequest = "Найти самоцветы и источник энергии"
Inst4Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst4Quest6_HORDE = "6. Найти самоцветы и источник энергии"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "Добудьте все 3 самоцвета и источник энергии для ожерелья из Ульдамана и принесите Джаркалу Замшелому Клыку в Каргат. Джаркал считеает, что источник энергии можно найти у самой сильной твари в Ульдамане."
Inst4Quest6_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,46"..WHITE..")"
Inst4Quest6_HORDE_Note = "Самоцветы находятся около "..YELLOW.."[1]"..WHITE.." в урне, "..YELLOW.."[8]"..WHITE.." из тайника клана Тенегорна, и "..YELLOW.."[9]"..WHITE.." с Гримлока. Обратите внимание, что когда вы откроете тайник, появятся несколько мобов и атакуют вас. Источник энергии сломанного ожерелья падает с Архедаса "..YELLOW.."[10]"..WHITE.."."
Inst4Quest6_HORDE_Prequest = "Трудности перевода"
Inst4Quest6_HORDE_Folgequest = "Доставка камней"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "Jarkal's Enhancing Necklace"

--Quest 7 Horde
Inst4Quest7_HORDE = "7. В Ульдаман за реактивом"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "36"
Inst4Quest7_HORDE_Aim = "Принесите 12 грибов-малиновиков Джаркалу Замшелому Клыку в Каргат."
Inst4Quest7_HORDE_Location = "Джаркал Замшелый Клык (Бесплодные земли - Каргат; "..YELLOW.."2,69"..WHITE..")"
Inst4Quest7_HORDE_Note = "Предшествующее задание вы также возьмете в Каргате.\nШляпки есть по всему подземелью. Травники могут видеть их на миникарте, если включен Поиск трав и они взяли задание. Предыдущее задание дает этот же NPC."
Inst4Quest7_HORDE_Prequest = "В Бесплодные земли за реактивом"
Inst4Quest7_HORDE_Folgequest = "В Бесплодные земли за реактивом 2"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "Restorative Potion"

--Quest 8 Horde
Inst4Quest8_HORDE = "8. Возвращенные сокровища"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "33"
Inst4Quest8_HORDE_Aim = "Принесите Патрику Гаррету в Подгород фамильное сокровище из сундука в Южном зале Ульдамана."
Inst4Quest8_HORDE_Location = "Патрик Гаррет (Подгород; "..YELLOW.."72,48"..WHITE..")"
Inst4Quest8_HORDE_Note = "Вы найдете сокровище перед тем как войдете в подземелье. Оно на севере пещер, в юговосточном конце тоннеля. На Карте входа, оно около "..YELLOW.."[5]"..WHITE.."."
Inst4Quest8_HORDE_Prequest = "Нет"
Inst4Quest8_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 9 Horde
Inst4Quest9_HORDE = "9. Платиновые диски"
Inst4Quest9_HORDE_Level = "47"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "Поговорите с каменным стражем и узнайте в чем заключается древнее знание. Как только вы узнаете все, что нужно, активируйте Диски Нограннона. -> Отнесите миниатюрную копию дисков Норганнона кому-то из мудрецов с Громового Утеса."
Inst4Quest9_HORDE_Location = "Диски Нограннона (Ульдаман; "..YELLOW.."[11]"..WHITE..")"
Inst4Quest9_HORDE_Note = "После получения задания, поговорите с каменным стражем слева от дисков.  Потом снова используйте платиновые диски, чтобы получить миниатюрную копию, которую вы должны принести ведуну Искателю Истины в Громовой Утес ("..YELLOW.."34,46"..WHITE..")"
Inst4Quest9_HORDE_Prequest = "Нет"
Inst4Quest9_HORDE_Folgequest = "Платиновые диски"
--
Inst4Quest9name1_HORDE = "Thawpelt Sack"
Inst4Quest9name2_HORDE = "Superior Healing Potion"
Inst4Quest9name3_HORDE = "Greater Mana Potion"

--Quest 10 Horde  (same as Quest 4 Alliance)
Inst4Quest10_HORDE = "10. Сила Ульдамана (Маг)"
Inst4Quest10_HORDE_Level = Inst4Quest16_Level
Inst4Quest10_HORDE_Attain = Inst4Quest16_Attain
Inst4Quest10_HORDE_Aim = Inst4Quest16_Aim
Inst4Quest10_HORDE_Location = Inst4Quest16_Location
Inst4Quest10_HORDE_Note = Inst4Quest16_Note
Inst4Quest10_HORDE_Prequest = Inst4Quest16_Prequest
Inst4Quest10_HORDE_Folgequest = Inst4Quest16_Folgequest
Inst4Quest10PreQuest_HORDE = Inst4Quest16PreQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 17 Alliance)
Inst4Quest11_HORDE = "11. Индарилиевая руда"
Inst4Quest11_HORDE_Level = Inst4Quest17_Level
Inst4Quest11_HORDE_Attain = Inst4Quest17_Attain
Inst4Quest11_HORDE_Aim = Inst4Quest17_Aim
Inst4Quest11_HORDE_Location = Inst4Quest17_Location
Inst4Quest11_HORDE_Note = Inst4Quest17_Note
Inst4Quest11_HORDE_Prequest = Inst4Quest17_Prequest
Inst4Quest11_HORDE_Folgequest = Inst4Quest17_Folgequest
Inst4Quest11PreQuest_HORDE = Inst4Quest17PreQuest
-- No Rewards for this quest



--------------- INST5 - Blackrock Depths (BRD) ---------------

Inst5Story = "Когда-то будучи столицей дворфов клана Темного Железа, этот вулканический лабиринт теперь является безраздельными владениями Огненого лорда Рагнароса. Рагнорос открыл секрет создания жизни из камня и собирается построить армию неудержимых големов, чтобы те помогли ему завоевать всю Черную гору целиком. Помешавшись на мысли победить Нефариана и его драконьих прислужников, Рагнарос пойдет на любую крайность чтобы достичь окончательной победы."
Inst5Caption = "Глубины Черной Горы"
Inst5QAA = "15 Заданий"
Inst5QAH = "19 Заданий"

--Quest 1 Alliance
Inst5Quest1 = "1. Наследие Черного Железа"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "Убейте Точеня Темностроя и добудьте великий молот, Железный Друг. Отнесите Железного Друга в святилище Тауриссана и вложите его в руки статуи Франклорна Искусника."
Inst5Quest1_Location = "Франклорн Искусник (Черная гора; "..YELLOW.."[3] на Карте входа"..WHITE..")"
Inst5Quest1_Note = "Франклорн находится в средине горы, над своей могилой, в здании около камня призыва. Вы должны быть мертвы, чтобы увидеть его! Он также дает предыдущее задание в цепочке.\nФиний Темнострой находится около "..YELLOW.."[9]"..WHITE..". Вы найдете Святилище рядом с ареной "..YELLOW.."[7]"..WHITE.."."
Inst5Quest1_Prequest = "Наследие Черного Железа"
Inst5Quest1_Folgequest = "Нет"
--
Inst5Quest1name1 = "Shadowforge Key"

--Quest 2 Alliance
Inst5Quest2 = "2. Риббли Крутипроб"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "48"
Inst5Quest2_Aim = "Принесите голову Риббли Юке Крутипроб в Пылающие степи."
Inst5Quest2_Location = "Юка Крутипроб (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst5Quest2_Note = "Вы получите предшествующее задание у Юрбы Крутипроба (Танарис - Порт Картеля; "..YELLOW.."67,23"..WHITE..").\nРиббли находится около "..YELLOW.."[15]"..WHITE.."."
Inst5Quest2_Prequest = "Юка Крутипроб"
Inst5Quest2_Folgequest = "Нет"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "Rancor Boots"
Inst5Quest2name2 = "Penance Spaulders"
Inst5Quest2name3 = "Splintsteel Armor"

--Quest 3 Alliance
Inst5Quest3 = "3. Приворотное зелье"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "Принести 4 листа крови Грома, 10 огромных серебряных слитков и наполненный сосуд Нагмары госпоже Нагмаре в Глубины Черной горы."
Inst5Quest3_Location = "Госпожа Нагмара (Глубины Черной Горы; "..YELLOW.."[15]"..WHITE..")"
Inst5Quest3_Note = "Получить огромные серебряные слитки можно с Гигантов в Азшаре. Листки крови Грома легко можно найти у травников или на Аукционе. И последнее, сосуд можно наполнить в кратере Го-Лакка (Кратер Ун'Горо; "..YELLOW.."31,50"..WHITE..").\nПосле выполнения задания, вы можете использоать черный ход вместо сражения с Фалангой."
Inst5Quest3_Prequest = "Нет"
Inst5Quest3_Folgequest = "Нет"
--
Inst5Quest3name1 = "Manacle Cuffs"
Inst5Quest3name2 = "Nagmara's Whipping Belt"

--Quest 4 Alliance
Inst5Quest4 = "4. Харли Пьянодых"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "50"
Inst5Quest4_Aim = "Найдите украденный рецепт Громопойла и верните его Рагнару Грозовару в Каранос."
Inst5Quest4_Location = "Рагнар Грозовар  (Дун Морог - Каранос; "..YELLOW.."46,52"..WHITE..")"
Inst5Quest4_Note = "Вы возьмете предшествующее задание у Енохи Грозовара (Выжженные земли - Крепость стражей Пустоты; "..YELLOW.."61,18"..WHITE..").\nВы получите рецепт с охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_Prequest = "Рагнар Грозовар"
Inst5Quest4_Folgequest = "Нет"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "Dark Dwarven Lager"
Inst5Quest4name2 = "Swiftstrike Cudgel"
Inst5Quest4name3 = "Limb Cleaver"

--Quest 5 Alliance  
Inst5Quest5 = "5. Подчинитель Пирон"
Inst5Quest5_Level = "52"
Inst5Quest5_Attain = "48"
Inst5Quest5_Aim = "Убейте подчинителя Пирона и вернитесь к Джалинде Тирлипуньке."
Inst5Quest5_Location = "Джалинда Тирлипунька (Пылающие степи - Дозор Моргана; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest5_Note = "Подчинитель Пирон - этоогненный элементаль снаружи подземелья. Он находится около "..YELLOW.."[24]"..WHITE.." на карте Глубин Черной горы и около "..YELLOW.."[1]"..WHITE.." на карте входа Черной горы."
Inst5Quest5_Prequest = "Нет"
Inst5Quest5_Folgequest = "Опалитель!"
-- No Rewards for this quest

--Quest 6 Alliance
Inst5Quest6 = "6. Опалитель!"
Inst5Quest6_Level = "56"
Inst5Quest6_Attain = "48"
Inst5Quest6_Aim = "Отыщите и уничтожьте лорда Опалителя в глубинах Черной горы!"
Inst5Quest6_Location = " Джалинда Тирлипунька (Пылающие степи - Дозор Моргана; "..YELLOW.."85,69"..WHITE..")"
Inst5Quest6_Note = "Вы возьмете предшествующее задание также у Джалинды Тирлипуньки. Вы найдете лорда Опалителя около "..YELLOW.."[10]"..WHITE.."."
Inst5Quest6_Prequest = "Подчинитель Пирон"
Inst5Quest6_Folgequest = "Нет"
Inst5Quest6FQuest = "true"
--
Inst5Quest6name1 = "Sunborne Cape"
Inst5Quest6name2 = "Nightfall Gloves"
Inst5Quest6name3 = "Crypt Demon Bracers"
Inst5Quest6name4 = "Stalwart Clutch"

--Quest 7 Alliance
Inst5Quest7 = "7. Сердце горы"
Inst5Quest7_Level = "55"
Inst5Quest7_Attain = "50"
Inst5Quest7_Aim = "Принесите сердце горы Максворту Суперблеску в Пылающие степи."
Inst5Quest7_Location = "Максворт Суперблеск (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
Inst5Quest7_Note = "Вы найдете Сердце около "..YELLOW.."[8]"..WHITE.." в сейфе. Вы возьмете ключ от сейфа у сторожа Стиллгисс. Он появляется после открытия всех маленьких сейфов."
Inst5Quest7_Prequest = "Нет"
Inst5Quest7_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 8 Alliance
Inst5Quest8 = "8. Хороший товар"
Inst5Quest8_Level = "56"
Inst5Quest8_Attain = "50"
Inst5Quest8_Aim = "Отправьтесь в глубины Черной горы и принесите 20 поясных сумок дворфов Черного Железа. По выполнению задания вернуться к Орелиусу. Предположительно поясные сумки можно отобрать у дворфов Черного Железа в глубинах Черной горы."
Inst5Quest8_Location = "Орелиус (Пылающие степи - Дозор Моргана; "..YELLOW.."84,68"..WHITE..")"
Inst5Quest8_Note = "Сумки падают со всех дворфов."
Inst5Quest8_Prequest = "Нет"
Inst5Quest8_Folgequest = "Нет"
--
Inst5Quest8name1 = "A Dingy Fanny Pack"

--Quest 9 Alliance
Inst5Quest9 = "9. Вкус пламени"
Inst5Quest9_Level = "58"
Inst5Quest9_Attain = "52"
Inst5Quest9_Aim = "Отправьтесь в глубины Черной горы и убейте Бейл'Гора. "..YELLOW.."[...]"..WHITE.." Отнесите пойманную сущность Огня Цирусу Раскаивателю."
Inst5Quest9_Location = "Цирус Раскаиватель (Пылающие степи; "..YELLOW.."94,31"..WHITE..")"
Inst5Quest9_Note = "Серия заданий начинается у Каларана Ветрореза (Тлеющее ущелье; "..YELLOW.."39,38"..WHITE..").\nБэл'Гар находится около "..YELLOW.."[11]"..WHITE.."."
Inst5Quest9_Prequest = "Неугасимое пламя -> Вкус пламени"
Inst5Quest9_Folgequest = "Нет"
Inst5Quest9PreQuest = "true"
--
Inst5Quest9name1 = "Shaleskin Cape"
Inst5Quest9name2 = "Wyrmhide Spaulders"
Inst5Quest9name3 = "Valconian Sash"

--Quest 10 Alliance
Inst5Quest10 = "10. Каран Могучий Молот"
Inst5Quest10_Level = "59"
Inst5Quest10_Attain = "50"
Inst5Quest10_Aim = "Пойдите в Глубины Черной горы и найдите Карана Могучего Молота.\nКороль упомянул, что Каран сидит там в плену – может, стоит поискать темницу."
Inst5Quest10_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest10_Note = "Предшествующее задание начинается у Королевского историка Аркессонуса (Стальгорн; "..YELLOW.."38,55"..WHITE.."). Каран Могучий Молот находится около "..YELLOW.."[2]"..WHITE.."."
Inst5Quest10_Prequest = "Дымящиеся руины Тауриссана"
Inst5Quest10_Folgequest = "Недобрые вести"
Inst5Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst5Quest11 = "11. Судьба королевства"
Inst5Quest11_Level = "59"
Inst5Quest11_Attain = "51"
Inst5Quest11_Aim = "Вернитесь в Глубины Черной горы и освободите принцессу Мойру Бронзобород от злобного императора Даграна Тауриссана."
Inst5Quest11_Location = "Король Магни Бронзобород (Стальгорн; "..YELLOW.."39,55"..WHITE..")"
Inst5Quest11_Note = "Принцесса Мойра Бронзобород находится около "..YELLOW.."[21]"..WHITE..". Во время боя она может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! После того как поговорите с ней, вы должны вернуться к Магни Бронзобороду."
Inst5Quest11_Prequest = "Недобрые вести"
Inst5Quest11_Folgequest = "Королевский сюрприз"
Inst5Quest11FQuest = "true"
--
Inst5Quest11name1 = "Magni's Will"
Inst5Quest11name2 = "Songstone of Стальгорн"

--Quest 12 Alliance
Inst5Quest12 = "12. Сродство с недрами"
Inst5Quest12_Level = "60"
Inst5Quest12_Attain = "55"
Inst5Quest12_Aim = "Отправляйтесь через портал, ведущий к Огненным Недрам в Глубинах Черной горы и добудьте фрагмент ядра. Принесите его Лотосу Хранителю Портала к Черной горе."
Inst5Quest12_Location = "Лотос Хранитель Портала (Черная гора; "..YELLOW.."[2] на карте Входа"..WHITE..")"
Inst5Quest12_Note = "После выполнения задания вы сможете использовать камень ряом с Лотосом Хранителем Портала, чтобы войти в Расплавленные недра.\nВы найдете фрагмент ядра около "..YELLOW.."[23]"..WHITE..", сосем близко от портала в Расплавленные недра."
Inst5Quest12_Prequest = "Нет"
Inst5Quest12_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 13 Alliance
Inst5Quest13 = "13. Вызов"
Inst5Quest13_Level = "60"
Inst5Quest13_Attain = "60"
Inst5Quest13_Aim = "Войти в Зал Правосудия в Глубинах Черной горы, выслушать приговор верховного судьи Мрачнокамня и вонзить знамя Вызова в центр круга. Убить Телдрена и его гладиаторов и вернуться к Антиону Хармону в Восточные Чумные земли с первой частью амулета Лорда Вальтхалака."
Inst5Quest13_Location = "Фалрин Садовник (Забытый город Запад; "..YELLOW.."[1] Библиотека"..WHITE..")"
Inst5Quest13_Note = "Последующие задания различны для каждого класса."
Inst5Quest13_Prequest = "Нет"
Inst5Quest13_Folgequest = "(Классовые задания)"
-- No Rewards for this quest

--Quest 14 Alliance
Inst5Quest14 = "14. Призрачный кубок"
Inst5Quest14_Level = "55"
Inst5Quest14_Attain = "55"
Inst5Quest14_Aim = "Поместите материалы, заказанные Мрак'нелом в Призрачный кубок."
Inst5Quest14_Location = "Мрак'нел (Глубины Черной горы; "..YELLOW.."[18]"..WHITE..")"
Inst5Quest14_Note = "Только горняки с навыком 230 и выше могут получить это задание и выучить Выплавку Темного Железа. Материалы для Кубка: 2 [Звездный рубин], 20 [Слиток золота], 10 [Слиток Истиного серебра]. Впоследствии, если у вас есть [Руда Темного Железа] вы можете принести ее в Темную Кузню около "..YELLOW.."[22]"..WHITE.." и выплавить."
Inst5Quest14_Prequest = "Нет"
Inst5Quest14_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 15 Alliance
Inst5Quest15 = "15. Худое варево Худовара"
Inst5Quest15_Level = "80"
Inst5Quest15_Attain = "75"
Inst5Quest15_Aim = "Отнесите Худое варево Худовара Ипфелькоферу Железному Бочонку в лагерь Хмельного фестиваля возле Стальгорна."
Inst5Quest15_Location = "Худое варево Худовара (падает с Корена Худовара "..YELLOW.."[15]"..WHITE..")"
Inst5Quest15_Note = "Корен Худовар доступен только во время Хмельного фестиваля. Худое варево Худовара падает только раз в год одному персонажу.\n\nИпфелькофер Железный Бочонок находится в Хмельном лагере в (Дун Морог; "..YELLOW.."47,39"..WHITE..")."
Inst5Quest15_Prequest = "Нет"
Inst5Quest15_Folgequest = "Нет"
--
Inst5Quest15name1 = "Призовой жетон Хмельного фестиваля"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst5Quest1_HORDE = Inst5Quest1
Inst5Quest1_HORDE_Level = Inst5Quest1_Level
Inst5Quest1_HORDE_Attain = Inst5Quest1_Attain
Inst5Quest1_HORDE_Aim = Inst5Quest1_Aim
Inst5Quest1_HORDE_Location = Inst5Quest1_Location
Inst5Quest1_HORDE_Note = Inst5Quest1_Note
Inst5Quest1_HORDE_Prequest = Inst5Quest1_Prequest
Inst5Quest1_HORDE_Folgequest = Inst5Quest1_Folgequest
--
Inst5Quest1name1_HORDE = Inst5Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst5Quest2_HORDE = Inst5Quest2
Inst5Quest2_HORDE_Level = Inst5Quest2_Level
Inst5Quest2_HORDE_Attain = Inst5Quest2_Attain
Inst5Quest2_HORDE_Aim = Inst5Quest2_Aim
Inst5Quest2_HORDE_Location = Inst5Quest2_Location
Inst5Quest2_HORDE_Note = Inst5Quest2_Note
Inst5Quest2_HORDE_Prequest = Inst5Quest2_Prequest
Inst5Quest2_HORDE_Folgequest = Inst5Quest2_Folgequest
Inst5Quest2PreQuest_HORDE = Inst5Quest2PreQuest
--
Inst5Quest2name1_HORDE = Inst5Quest2name1
Inst5Quest2name2_HORDE = Inst5Quest2name2
Inst5Quest2name3_HORDE = Inst5Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst5Quest3_HORDE = Inst5Quest3
Inst5Quest3_HORDE_Level = Inst5Quest3_Level
Inst5Quest3_HORDE_Attain = Inst5Quest3_Attain
Inst5Quest3_HORDE_Aim = Inst5Quest3_Aim
Inst5Quest3_HORDE_Location = Inst5Quest3_Location
Inst5Quest3_HORDE_Note = Inst5Quest3_Note
Inst5Quest3_HORDE_Prequest = Inst5Quest3_Prequest
Inst5Quest3_HORDE_Folgequest = Inst5Quest3_Folgequest
--
Inst5Quest3name1_HORDE = Inst5Quest3name1
Inst5Quest3name2_HORDE = Inst5Quest3name2

--Quest 4 Horde
Inst5Quest4_HORDE = "4. Украденный рецепт громопойла"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "Принести  рецепт светлого громопойла Вивиан Лягроб в Каргат."
Inst5Quest4_HORDE_Location = "Темный маг Вивиан Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest4_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\nВы получите рецепт у одного из охранников, которые появятся, если вы уничтожите эль "..YELLOW.."[15]"..WHITE.."."
Inst5Quest4_HORDE_Prequest = "Вивиан Лягроб"
Inst5Quest4_HORDE_Folgequest = "Нет"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "Superior Healing Potion"
Inst5Quest4name2_HORDE = "Greater Mana Potion"
Inst5Quest4name3_HORDE = "Swiftstrike Cudgel"
Inst5Quest4name4_HORDE = "Limb Cleaver"

--Quest 5 Horde  (same as Quest 7 Alliance)
Inst5Quest5_HORDE = "5. Сердце горы"
Inst5Quest5_HORDE_Level = Inst5Quest7_Level
Inst5Quest5_HORDE_Attain = Inst5Quest7_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest7_Aim
Inst5Quest5_HORDE_Location = Inst5Quest7_Location
Inst5Quest5_HORDE_Note = Inst5Quest7_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest7_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest7_Folgequest
-- No Rewards for this quest

--Quest 6 Horde
Inst5Quest6_HORDE = "6. УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 15 охранников, 10 надсмотрщиков и 5 пехотинцев из клана Ярости Горна. Вернитесь сразу по выполнении задания."
Inst5Quest6_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest6_HORDE_Note = "Вы найдете дворфов в первой части Глубин Черной горы.\nВы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..")."
Inst5Quest6_HORDE_Prequest = "Нет"
Inst5Quest6_HORDE_Folgequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"
-- No Rewards for this quest

--Quest 7 Horde
Inst5Quest7_HORDE = "7. УНИЧТОЖИТЬ НА МЕСТЕ: Высокопоставленные чины Черного Железа"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "49"
Inst5Quest7_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и уничтожьте подлых агрессоров! По приказу полководца Клинозуба уничтожьте 10 медиков, 10 солдат и 10 офицеров из клана Ярости Горна. Вернитесь сразу по выполнении задания."
Inst5Quest7_HORDE_Location = "Доска объявлений (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..")"
Inst5Quest7_HORDE_Note = "Вы найдете дворфов около Bael'Gar "..YELLOW.."[11]"..WHITE..". Вы найдете полководца Клинозуба в Каргате на вершине башни (Бесплодные земли, "..YELLOW.."5,47"..WHITE..").\n Последующее задание начинается у Лекслорта (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE.."). Вы найдете Грарка Lorkrub в Пылающих степях ("..YELLOW.."38,35"..WHITE.."). Вы должны опустить его ХП ниже 50%, чтобы начать задание сопровождения."
Inst5Quest7_HORDE_Prequest = "УНИЧТОЖИТЬ НА МЕСТЕ: Дворфы Черного Железа"
Inst5Quest7_HORDE_Folgequest = "Грарк Лоркруб -> Опасное положение (Задание сопровождения)"
Inst5Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst5Quest8_HORDE = "8. Операция: Смерть Кузне Гнева"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "54"
Inst5Quest8_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и убейте генерала Кузню Гнева. Вернитесь к полководцу Клинозубу по выполнении задания."
Inst5Quest8_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest8_HORDE_Note = "Вы найдете генерала Кузню Гнева около "..YELLOW.."[13]"..WHITE..". Он зовет подкрепление когда ХП ниже 30%!"
Inst5Quest8_HORDE_Prequest = "Опасное положение"
Inst5Quest8_HORDE_Folgequest = "Нет"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "Conqueror's Medallion"

--Quest 9 Horde
Inst5Quest9_HORDE = "9. Восстание машин"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "52"
Inst5Quest9_HORDE_Aim = "Найдите и убейте повелителя големов Аргелмаха. Принесите его голову Лотвилу. Также соберите 10 невредимых ядер стихий с беспощадных големов и созданий-завоевателей, охраняющих Аргелмаха. Информация передана посредством телепатии."
Inst5Quest9_HORDE_Location = "Лотвиль Вериатус (Бесплодные земли; "..YELLOW.."25,44"..WHITE..")"
Inst5Quest9_HORDE_Note = "Вы возьмете предшествуещее задание у  Верховной Жрицы Теодоры Мальвадании (Бесплодные земли - Каргат; "..YELLOW.."3,47"..WHITE..").\nВы найдете Аргелмаха около "..YELLOW.."[14]"..WHITE.."."
Inst5Quest9_HORDE_Prequest = "Восстание машин"
Inst5Quest9_HORDE_Folgequest = "Нет"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "Azure Moon Amice"
Inst5Quest9name2_HORDE = "Raincaster Drape"
Inst5Quest9name3_HORDE = "Basaltscale Armor"
Inst5Quest9name4_HORDE = "Lavaplate Gauntlets"

--Quest 10 Horde  (same as Quest 9 Alliance)
Inst5Quest10_HORDE = "10. Вкус Пламени"
Inst5Quest10_HORDE_Level = Inst5Quest9_Level
Inst5Quest10_HORDE_Attain = Inst5Quest9_Attain
Inst5Quest10_HORDE_Aim = Inst5Quest9_Aim
Inst5Quest10_HORDE_Location = Inst5Quest9_Location
Inst5Quest10_HORDE_Note = Inst5Quest9_Note
Inst5Quest10_HORDE_Prequest = Inst5Quest9_Prequest
Inst5Quest10_HORDE_Folgequest = Inst5Quest9_Folgequest
Inst5Quest10PreQuest_HORDE = Inst5Quest9PreQuest
--
Inst5Quest10name1_HORDE = Inst5Quest9name1
Inst5Quest10name2_HORDE = Inst5Quest9name2
Inst5Quest10name3_HORDE = Inst5Quest9name3

--Quest 11 Horde
Inst5Quest11_HORDE = "11. Дисгармония пламени"
Inst5Quest11_HORDE_Level = "52"
Inst5Quest11_HORDE_Attain = "48"
Inst5Quest11_HORDE_Aim = "Отправляйтесь в карьер у Черной горы и уничтожьте Подчинителя Пирона. По выполнению вернитесь к Громосерду."
Inst5Quest11_HORDE_Location = "Громосерд (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest11_HORDE_Note = "Подчинитель Пирон - это огненный элементаль снаружи подземелья. Он находится около "..YELLOW.."[24]"..WHITE.." на карте Глубин Черной горы и около "..YELLOW.."[1]"..WHITE.." на карте входа Черной горы."
Inst5Quest11_HORDE_Prequest = "Нет"
Inst5Quest11_HORDE_Folgequest = "Дисгармония пламени"
-- No Rewards for this quest

--Quest 12 Horde
Inst5Quest12_HORDE = "12. Дисгармония пламени"
Inst5Quest12_HORDE_Level = "56"
Inst5Quest12_HORDE_Attain = "48"
Inst5Quest12_HORDE_Aim = "Ступайте в глубины Черной горы и выследите лорда Опалителя. Убейте его и принести Громосерду любые найденные источники информации."
Inst5Quest12_HORDE_Location = "Громосерд (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..")"
Inst5Quest12_HORDE_Note = "Вы также получите предшествующее задание у Громосерда.\nВы найдете лорда Опалителя около "..YELLOW.."[10]"..WHITE.."."
Inst5Quest12_HORDE_Prequest = "Дисгармония пламени"
Inst5Quest12_HORDE_Folgequest = "Нет"
Inst5Quest12FQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "Sunborne Cape"
Inst5Quest12name2_HORDE = "Nightfall Gloves"
Inst5Quest12name3_HORDE = "Crypt Demon Bracers"
Inst5Quest12name4_HORDE = "Stalwart Clutch"

--Quest 13 Horde
Inst5Quest13_HORDE = "13. Последняя стихия"
Inst5Quest13_HORDE_Level = "54"
Inst5Quest13_HORDE_Attain = "48"
Inst5Quest13_HORDE_Aim = "Отправляйтесь в Глубины Черной горы и добудьте 10 мер сущности стихий. Стоит начать поиски с големов и их создателей. Вивиан Лаграв также бормотала что-то про элементалей."
Inst5Quest13_HORDE_Location = "Темный маг Вивиана Лягроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst5Quest13_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\n С каждого элементаля может выпасть сущность стихий"
Inst5Quest13_HORDE_Prequest = "Дисгармония пламени"
Inst5Quest13_HORDE_Folgequest = "Нет"
Inst5Quest13PreQuest_HORDE = "true"
--
Inst5Quest13name1_HORDE = "Lagrave's Seal"

--Quest 14 Horde
Inst5Quest14_HORDE = "14. Командир Гор'шак"
Inst5Quest14_HORDE_Level = "52"
Inst5Quest14_HORDE_Attain = "48"
Inst5Quest14_HORDE_Aim = "Найдите командира Гор'шака в Глубинах Черной горы.\nСудя по рисунку в записке, искать следует в темнице где-то вроде того."
Inst5Quest14_HORDE_Location = "Гамалав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst5Quest14_HORDE_Note = "Вы получите предшествующее задание у Громосерда (Бесплодные земли - Каргат; "..YELLOW.."3,48"..WHITE..").\nВы найдете командира Гор'шака около "..YELLOW.."[3]"..WHITE..". Ключ, чтобы открыть камеру, пдает с Веровного Дознавателя Герштаны "..YELLOW.."[5]"..WHITE..". Если вы поговорите с ним, начнется следующее задание и появятся враги."
Inst5Quest14_HORDE_Prequest = "Дисгармония пламени"
Inst5Quest14_HORDE_Folgequest = "Что происходит?"
Inst5Quest14PreQuest_HORDE = "true"

--Quest 15 Horde
Inst5Quest15_HORDE = "15. Спасение принцессы"
Inst5Quest15_HORDE_Level = "59"
Inst5Quest15_HORDE_Attain = "50"
Inst5Quest15_HORDE_Aim = "Убейте императора Даграна Тауриссана и освободите принцессу Мойру Бронзобород от его черного заклятия."
Inst5Quest15_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,37"..WHITE..")"
Inst5Quest15_HORDE_Note = "После того, как вы поговорите с Караном Могучим Молотом и Траллом, вы получите это задание.\nВы найдете императора Даграна Тауриссана около "..YELLOW.."[21]"..WHITE..". Во время боя принцесса может лечить Даграна. Постарайтесь по возможности сбивать ей заклинание, но торопитесь, так она не должна умереть или вы провалите задание! (Награда за Спасенная принцесса)"
Inst5Quest15_HORDE_Prequest = "Командир Гор'шак"
Inst5Quest15_HORDE_Folgequest = "Спасенная принцесса"
Inst5Quest15FQuest_HORDE = "true"
--
Inst5Quest15name1_HORDE = "Решимость Тралла"
Inst5Quest15name2_HORDE = "Око Оргриммара"

--Quest 16 Horde  (same as Quest 12 Alliance)
Inst5Quest16_HORDE = "16. Сродство с недрами"
Inst5Quest16_HORDE_Level = Inst5Quest12_Level
Inst5Quest16_HORDE_Attain = Inst5Quest12_Attain
Inst5Quest16_HORDE_Aim = Inst5Quest12_Aim
Inst5Quest16_HORDE_Location = Inst5Quest12_Location
Inst5Quest16_HORDE_Note = Inst5Quest12_Note
Inst5Quest16_HORDE_Prequest = Inst5Quest12_Prequest
Inst5Quest16_HORDE_Folgequest = Inst5Quest12_Folgequest
-- No Rewards for this quest

--Quest 17 Horde  (same as Quest 13 Alliance)
Inst5Quest17_HORDE = "17. Вызов"
Inst5Quest17_HORDE_Level = Inst5Quest13_Level
Inst5Quest17_HORDE_Attain = Inst5Quest13_Attain
Inst5Quest17_HORDE_Aim = Inst5Quest13_Aim
Inst5Quest17_HORDE_Location = Inst5Quest13_Location
Inst5Quest17_HORDE_Note = Inst5Quest13_Note
Inst5Quest17_HORDE_Prequest = Inst5Quest13_Prequest
Inst5Quest17_HORDE_Folgequest = Inst5Quest13_Folgequest
-- No Rewards for this quest

--Quest 18 Horde  (same as Quest 14 Alliance)
Inst5Quest18_HORDE = "18. Призрачный кубок"
Inst5Quest18_HORDE_Level = Inst5Quest14_Level
Inst5Quest18_HORDE_Attain = Inst5Quest14_Attain
Inst5Quest18_HORDE_Aim = Inst5Quest14_Aim
Inst5Quest18_HORDE_Location = Inst5Quest14_Location
Inst5Quest18_HORDE_Note = Inst5Quest14_Note
Inst5Quest18_HORDE_Prequest = Inst5Quest14_Prequest
Inst5Quest18_HORDE_Folgequest = Inst5Quest14_Folgequest
-- No Rewards for this quest

--Quest 19 Horde
Inst5Quest19_HORDE = "19. Худое варево Худовара"
Inst5Quest19_HORDE_Level = "80"
Inst5Quest19_HORDE_Attain = "75"
Inst5Quest19_HORDE_Aim = "Отнесите Худое варево Худовара Слухарю Мухлевару в лагерь Хмельного фестиваля возле Оргриммара."
Inst5Quest19_HORDE_Location = "Худое варево Худовара (падает с Корена Худовара "..YELLOW.."[15]"..WHITE..")"
Inst5Quest19_HORDE_Note = "Корен Худовар доступен только во время Хмельного фестиваля. Худое варево Худовара падает только раз в год одному персонажу.\n\nСлухарь Мухлевар находится в Хмельном лагере в (Дуротар; "..YELLOW.."45,17"..WHITE..")."
Inst5Quest19_HORDE_Prequest = "Нет"
Inst5Quest19_HORDE_Folgequest = "Нет"
--
Inst5Quest19name1_HORDE = "Призовой жетон Хмельного фестиваля"



--------------- INST6 - Blackwing Lair (BWL) ---------------

Inst6Story = {
  ["Page1"] = "Blackwing Lair can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.",
  ["Page2"] = "The mighty fortress carved within the fiery bowels of Черная гора was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths, which serve as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Черная гора.",
  ["Page3"] = "Nefarian has vowed to crush Ragnaros. To this end, he has recently begun efforts to bolster his forces, much as his father Deathwing had attempted to do in ages past. However, where Deathwing failed, it now seems the scheming Nefarian may be succeeding. Nefarian's mad bid for dominance has even attracted the ire of the Red Dragon Flight, which has always been the Black Flight's greatest foe. Though Nefarian's intentions are known, the methods he is using to achieve them remain a mystery. It is believed, however that Nefarian has been experimenting with the blood of all of the various Dragon Flights to produce unstoppable warriors.\n \nNefarian's sanctum, Blackwing Lair, can be found at the very height of Blackrock Spire. It is there in the dark recesses of the mountain's peak that Nefarian has begun to unfold the final stages of his plan to destroy Ragnaros once and for all and lead his army to undisputed supremacy over all the races of Azeroth.";
  ["MaxPages"] = "3",
};
Inst6Caption = "Логово Крыла Тьмы"
Inst6Caption2 = "Логово Крыла Тьмы (История Часть 1)"
Inst6Caption3 = "Логово Крыла Тьмы (История Часть 2)"

Inst6QAA = "3 Задания"
Inst6QAH = "3 Задания"

--Quest 1 Alliance
Inst6Quest1 = "1. Нефариус, пораженный порчей"
Inst6Quest1_Level = "60"
Inst6Quest1_Attain = "60"
Inst6Quest1_Aim = "Убейте Нефариана и добудьте осколок красного скипетра. Верните осколок красного скипетра Анахроносу в Пещеры Времени в Танарис. На выполнение задания у вас есть 5 часов."
Inst6Quest1_Location = "Валестраз Порочный (Логово Крыла Тьмы; "..YELLOW.."[2]"..WHITE..")"
Inst6Quest1_Note = "Только один игрок может подобрать осколок. Анахронос (Танарис - Пещеры времени; "..YELLOW.."65,49"..WHITE..")"
Inst6Quest1_Prequest = "Нет"
Inst6Quest1_Folgequest = "Нет"
--
Inst6Quest1name1 = "Onyx Embedded Leggings"
Inst6Quest1name2 = "Amulet of Shadow Shielding"

--Quest 2 Alliance
Inst6Quest2 = "2. Владыка Черной горы"
Inst6Quest2_Level = "60"
Inst6Quest2_Attain = "60"
Inst6Quest2_Aim = "Отнесите голову Нефариана Верховному лорду Болвару Фордрагону в Штормград."
Inst6Quest2_Location = "Голова Нефариана (падает с Нефариана; "..YELLOW.."[10]"..WHITE..")"
Inst6Quest2_Note = "Верховный лорд Болвар Фордрагон находится около (Штормград - Крепость Штормграда; "..YELLOW.."80.0, 38.5"..WHITE.."). Последующее задание отсылает вас к фельдмаршалу Афрасиаби (Штормград - Аллея Героев; "..YELLOW.."71.5, 80.5"..WHITE..") за наградой."
Inst6Quest2_Prequest = "Нет"
Inst6Quest2_Folgequest = "Владыка Черной горы"
--
Inst6Quest2name1 = "Master Dragonslayer's Medallion"
Inst6Quest2name2 = "Master Dragonslayer's Orb"
Inst6Quest2name3 = "Master Dragonslayer's Ring"

--Quest 3 Alliance
Inst6Quest3 = "3. Кто будет избран?"
Inst6Quest3_Level = "60"
Inst6Quest3_Attain = "60"
Inst6Quest3_Aim = "Принесите голову предводителя драконов Разящего Бича Баристольфу из Зыбучих Песков в Крепость Ценариона в Силитусе."
Inst6Quest3_Location = "Голова предводителя драконидов Разящего Бича (падает с предводителя драконидов Разящего Бича ; "..YELLOW.."[3]"..WHITE..")"
Inst6Quest3_Note = "Только один игрок может подобрать голову."
Inst6Quest3_Prequest = "Нет"
Inst6Quest3_Folgequest = "Путь правых"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst6Quest1_HORDE = Inst6Quest1
Inst6Quest1_HORDE_Level = Inst6Quest1_Level
Inst6Quest1_HORDE_Attain = Inst6Quest1_Attain
Inst6Quest1_HORDE_Aim = Inst6Quest1_Aim
Inst6Quest1_HORDE_Location = Inst6Quest1_Location
Inst6Quest1_HORDE_Note = Inst6Quest1_Note
Inst6Quest1_HORDE_Prequest = Inst6Quest1_Prequest
Inst6Quest1_HORDE_Folgequest = Inst6Quest1_Folgequest
--
Inst6Quest1name1_HORDE = Inst6Quest1name1
Inst6Quest1name2_HORDE = Inst6Quest1name2

--Quest 2 Horde
Inst6Quest2_HORDE = "2. Владыка Черной горы"
Inst6Quest2_HORDE_Level = "60"
Inst6Quest2_HORDE_Attain = "60"
Inst6Quest2_HORDE_Aim = "Отнесите голову Нефариана Траллу в Оргриммар."
Inst6Quest2_HORDE_Location = "Голова Нефариана (падает с Нефариана; "..YELLOW.."[9]"..WHITE..")"
Inst6Quest2_HORDE_Note = "Последующее задание отсылает вас к Верховному властителю Саурфангу (Оргриммар - Аллея Силы; "..YELLOW.."51,76"..WHITE..") за наградой."
Inst6Quest2_HORDE_Prequest = "Нет"
Inst6Quest2_HORDE_Folgequest = "Владыка Черной горы"
--
Inst6Quest2name1_HORDE = "Master Dragonslayer's Medallion"
Inst6Quest2name2_HORDE = "Master Dragonslayer's Orb"
Inst6Quest2name3_HORDE = "Master Dragonslayer's Ring"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst6Quest3_HORDE = Inst6Quest3
Inst6Quest3_HORDE_Level = Inst6Quest3_Level
Inst6Quest3_HORDE_Attain = Inst6Quest3_Attain
Inst6Quest3_HORDE_Aim = Inst6Quest3_Aim
Inst6Quest3_HORDE_Location = Inst6Quest3_Location
Inst6Quest3_HORDE_Note = Inst6Quest3_Note
Inst6Quest3_HORDE_Prequest = Inst6Quest3_Prequest
Inst6Quest3_HORDE_Folgequest = Inst6Quest3_Folgequest
-- No Rewards for this quest



--------------- INST7 - Blackfathom Deeps (BFD) ---------------

Inst7Story = "Расположенная вдоль побережья Зорам Ясеневого леса, Непроглядная пучина когда-то была знаменитым храмом посвященным богине Луны ночных эльфов, Элуне. Однако, великий Разлом разбил храм - опустив под волны Сокрытого моря. Он оставался нетронутым - пока, привлеченные древней силой - наги и сатиры не приплыли, чтобы раскрыт его секреты. Легенды утверждают что древнее чудовище, Аку'маи, поселилось в руинах храма. Аку'маи, любимый питомец изначальных Старых Богов, теперь охотится на его территории. Привлеченный Аку'маи, культ, известный как Молот Сумерек также пришел чтобы поживиться злым присутствием Старых Богов."
Inst7Caption = "Непроглядная пучина"
Inst7QAA = "6 Заданий"
Inst7QAH = "5 Заданий"

--Quest 1 Alliance
Inst7Quest1 = "1. Знание в пучине"
Inst7Quest1_Level = "23"
Inst7Quest1_Attain = "19"
Inst7Quest1_Aim = "Принесите манускрипт Лоргалиса Геррику Костохвату в Заброшенный грот в Стальгорне."
Inst7Quest1_Location = "Геррик Костохват (Стальгорн - Заброшеный Грот; "..YELLOW.."50,5"..WHITE..")"
Inst7Quest1_Note = "Вы найдете манускрипт около "..YELLOW.."[2]"..WHITE.." в воде."
Inst7Quest1_Prequest = "Нет"
Inst7Quest1_Folgequest = "Нет"
--
Inst7Quest1name1 = "Sustaining Ring"

--Quest 2 Alliance
Inst7Quest2 = "2. Исследование порчи"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "18"
Inst7Quest2_Aim = "Гершал Шепот Ночи в Аубердине хочет, чтобы вы принесли ему 8 оскверненных стволов мозга."
Inst7Quest2_Location = "Гершал Шепот Ночи (Темные Берега - Аубердин; "..YELLOW.."38,43"..WHITE..")"
Inst7Quest2_Note = "Предшествующее задание выполняется по желанию. Вы получите его от Аргоса Шепот Ночи (Штормград - Парк; "..YELLOW.."35.9, 67.3"..WHITE.."). \n\nСо всех наг перед и внутри Непроглядной пучины можно получить сволы мозга."
Inst7Quest2_Prequest = "Проблема за морем"
Inst7Quest2_Folgequest = "Нет"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "Beetle Clasps"
Inst7Quest2name2 = "Prelacy Cape"

--Quest 3 Alliance
Inst7Quest3 = "3. В поисках Талрида"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "18"
Inst7Quest3_Aim = "Найдите стража Талрида из ордена Серебряного Рассвета в Непроглядной пучине."
Inst7Quest3_Location = "Рассветный дозорный Шедласс (Дарнасс - Терраса ремесленников; "..YELLOW.."55,24"..WHITE..")"
Inst7Quest3_Note = "Вы найдете стража Талрида из ордена Серебряного Рассвета около "..YELLOW.."[4]"..WHITE.."."
Inst7Quest3_Prequest = "Нет"
Inst7Quest3_Folgequest = "Непроглядная мерзость"
-- No Rewards for this quest

--Quest 4 Alliance
Inst7Quest4 = "4. Злодейство в Непроглядной Пучине"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "18"
Inst7Quest4_Aim = "Принесите голову Повелителя сумрака Келриса Рассветному дозорному Селгорму в Дарнасс."
Inst7Quest4_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Рассветного дозорного Селгорма в Дарнассе - Терраса Ремесленников ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют вас."
Inst7Quest4_Prequest = "В поисках Талрида"
Inst7Quest4_Folgequest = "Нет"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "Gravestone Scepter"
Inst7Quest4name2 = "Arctic Buckler"

--Quest 5 Alliance
Inst7Quest5 = "5. Наступление сумерек"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "Принесите 10 подвесок Сумерек стражу Менадосу из ордена Серебряного рассвета в Дарнасс."
Inst7Quest5_Location = "Страж Менадос из ордена Серебряного рассвета (Дарнасс - Терраса ремесленников; "..YELLOW.."55,23"..WHITE..")"
Inst7Quest5_Note = "Из любого сумеречного моба падают подвески."
Inst7Quest5_Prequest = "Нет"
Inst7Quest5_Folgequest = "Нет"
--
Inst7Quest5name1 = "Nimbus Boots"
Inst7Quest5name2 = "Heartwood Girdle"

--Quest 6 Alliance
Inst7Quest6 = "6. Шар Соран'рука (Чернокнижник)"
Inst7Quest6_Level = "25"
Inst7Quest6_Attain = "20"
Inst7Quest6_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
Inst7Quest6_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
Inst7Quest6_Note = "Только чернокнижники могут взять это задание! Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
Inst7Quest6_Prequest = "Нет"
Inst7Quest6_Folgequest = "Нет"
--
Inst7Quest6name1 = "Orb of Soran'ruk"
Inst7Quest6name2 = "Staff of Soran'ruk"


--Quest 1 Horde
Inst7Quest1_HORDE = "1. Сущность Аку'май"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "Принесите 20 сапфиров Аку'май Дже'неу Санкри в Ясеневый лес."
Inst7Quest1_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest1_HORDE_Note = "Вы получите предшествующее задание 'Угроза из Глубин' у Цунамана (Когтистые горы - Приют у Солнечного камня; "..YELLOW.."47,64"..WHITE.."). Сапфиры можно найти в пещерах перед подземельем."
Inst7Quest1_HORDE_Prequest = "Угроза из Глубин"
Inst7Quest1_HORDE_Folgequest = "Нет"
Inst7Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst7Quest2_HORDE = "2. Верность Древним богам"
Inst7Quest2_HORDE_Level = "22"
Inst7Quest2_HORDE_Attain = "17"
Inst7Quest2_HORDE_Aim = "Принесите отсыревшую записку Дже'неу Санкри в Ясеневый лес. -> Убейте Лоргуса Джетта в Непроглядной пучине и вернитесь к Дже'неу Санкри в Ясеневый лес."
Inst7Quest2_HORDE_Location = "Отсыревшая записка (падает - см. заметки)"
Inst7Quest2_HORDE_Note = "Вы получите Отсыревшую записку с Жриц прилива из Непроглядной Пучины (5% шанс выпадения). Потом принесите ее Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE.."). Лоргус Джетт находится около "..YELLOW.."[6]"..WHITE.."."
Inst7Quest2_HORDE_Prequest = "Нет"
Inst7Quest2_HORDE_Folgequest = "Нет"
--
Inst7Quest2name1_HORDE = "Band of the Fist"
Inst7Quest2name2_HORDE = "Chestnut Mantle"

--Quest 3 Horde
Inst7Quest3_HORDE = "3. Среди руин"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "21"
Inst7Quest3_HORDE_Aim = "Принесите глубинный сердечник Дже'неу Санкри в форт Зорам'гар в Ясеневый лес."
Inst7Quest3_HORDE_Location = "Дже'неу Санкри (Ясеневый лес - Застава Зорам'гар; "..YELLOW.."11,33"..WHITE..")"
Inst7Quest3_HORDE_Note = "Вы найдете глубинный сердечник около "..YELLOW.."[7]"..WHITE.." под водой. Когда вы поднимите сердечник появится барон Акванис и атакует вас. С него падает предмет, который вы должны принести Дже'неу Санкри."
Inst7Quest3_HORDE_Prequest = "Нет"
Inst7Quest3_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Horde
Inst7Quest4_HORDE = "4. Жестокость Черных Глубин"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "18"
Inst7Quest4_HORDE_Aim = "Принесите голову Повелителя сумрака Келриса Башане Руническому Тотему в Громовой Утес."
Inst7Quest4_HORDE_Location = "Страж Талрид из ордена Серебряного Рассвета (Непроглядная пучина; "..YELLOW.."[4]"..WHITE..")"
Inst7Quest4_HORDE_Note = "Лорд Сумерек Келрис находится около "..YELLOW.."[8]"..WHITE..". Вы найдете Башана Рунического Тотема в Громовом Утесе - Вершина Старейшин ("..YELLOW.."55,24"..WHITE.."). \n\nВНИМАНИЕ! Если вы включите огни позади Лорда Келриса, появятся враги и атакуют вас."
Inst7Quest4_HORDE_Prequest = "Нет"
Inst7Quest4_HORDE_Folgequest = "Нет"
--
Inst7Quest4name1_HORDE = "Gravestone Scepter"
Inst7Quest4name2_HORDE = "Arctic Buckler"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst7Quest5_HORDE = "5. Шар Соран'рука (Чернокнижник)"
Inst7Quest5_HORDE_Level = Inst7Quest6_Level
Inst7Quest5_HORDE_Attain = Inst7Quest6_Attain
Inst7Quest5_HORDE_Aim = Inst7Quest6_Aim
Inst7Quest5_HORDE_Location = Inst7Quest6_Location
Inst7Quest5_HORDE_Note = Inst7Quest6_Note
Inst7Quest5_HORDE_Prequest = Inst7Quest6_Prequest
Inst7Quest5_HORDE_Folgequest = Inst7Quest6_Folgequest
--
Inst7Quest5name1_HORDE = Inst7Quest6name1
Inst7Quest5name2_HORDE = Inst7Quest6name2



--------------- INST8 - Lower Blackrock Spire (LBRS) ---------------

Inst8Story = "The mighty fortress carved within the fiery bowels of Черная гора was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself."
Inst8Caption = "Нижний ярус вершины Черной горы"
Inst8QAA = "14 Заданий"
Inst8QAH = "14 Заданий"

--Quest 1 Alliance
Inst8Quest1 = "1. Последние таблички"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "40"
Inst8Quest1_Aim = "Принесите пятую и шестую таблички Мошару геологу Железному Башмаку в Танарисе."
Inst8Quest1_Location = "Геолог Железный Башмак (Танарис - Порт Картеля; "..YELLOW.."66,23"..WHITE..")"
Inst8Quest1_Note = "Вы найдете таблички около "..YELLOW.."[7]"..WHITE.." и "..YELLOW.."[9]"..WHITE..".\nНаграда переводит на 'Сопротивление Йекинье'. вы найдете Йе'кинья около геолога Железного Башмака."
Inst8Quest1_Prequest = "Утраченные таблички Мошару"
Inst8Quest1_Folgequest = "Сопротивление Йекинье"
Inst8Quest1PreQuest = "true"
--
Inst8Quest1name1 = "Faded Hakkari Cloak"
Inst8Quest1name2 = "Tattered Hakkari Cape"

--Quest 2 Alliance
Inst8Quest2 = "2. Редкие звери Киблера"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "Отправьтесь на пик Черной горы и отыщите там щенков воргов легиона Кровавого Топора. Посадите маленьких тварей в клетку и отнесите Киблеру."
Inst8Quest2_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest2_Note = "Вы найдете щенков ворга около "..YELLOW.."[17]"..WHITE.."."
Inst8Quest2_Prequest = "Нет"
Inst8Quest2_Folgequest = "Нет"
--
Inst8Quest2name1 = "Worg Carrier"

--Quest 3 Alliance
Inst8Quest3 = "3. Товар на любителя"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "Отправьтесь на пик Черной горы и принесите Киблеру 15 яиц скального паука."
Inst8Quest3_Location = "Киблер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest3_Note = "Вы найдете яйца пауков около "..YELLOW.."[13]"..WHITE.."."
Inst8Quest3_Prequest = "Нет"
Inst8Quest3_Folgequest = "Нет"
--
Inst8Quest3name1 = "Smolderweb Carrier"

--Quest 4 Alliance
Inst8Quest4 = "4. Материнское молоко"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "55"
Inst8Quest4_Aim = "Найдите в самом сердце пика Черной горы мать Дымную Паутину. Сражайтесь с ней, пока она не введет вам свой яд. Скорее всего ее также придется убить. Когда яд будет в вас, вернитесь к Джону-Оборванцу, чтобы он смог добыть яд."
Inst8Quest4_Location = "Джон-Оборванец (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE..")"
Inst8Quest4_Note = "Мать Дымная Паутина находится около "..YELLOW.."[13]"..WHITE..". Яд также поражает ближаиших игроков. Если яд вылечить, вы провалите задание."
Inst8Quest4_Prequest = "Нет"
Inst8Quest4_Folgequest = "Нет"
--
Inst8Quest4name1 = "Ragged John's Neverending Cup"

--Quest 5 Alliance
Inst8Quest5 = "5. Устранение опасности"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "55"
Inst8Quest5_Aim = "Отправьтесь на пик Черной горы и уничтожьте источник опасности. Хелендис кричит вам вслед одно имя: Халикон. Именно его упоминали орки в связи с воргами."
Inst8Quest5_Location = "Хелендис Речной Мыс (Пылающие степи - Дозор Моргана; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_Note = "Вы найдете Халикон около "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_Prequest = "Нет"
Inst8Quest5_Folgequest = "Нет"
--
Inst8Quest5name1 = "Astoria Robes"
Inst8Quest5name2 = "Traphook Jerkin"
Inst8Quest5name3 = "Jadescale Breastplate"

--Quest 6 Alliance
Inst8Quest6 = "6. Аррок Смертный Вопль"
Inst8Quest6_Level = "60"
Inst8Quest6_Attain = "55"
Inst8Quest6_Aim = "Прочитать записку Вароша. Принести Варошу его амулет."
Inst8Quest6_Location = "Варош (Вершина Черной горы; "..YELLOW.."[2]"..WHITE..")"
Inst8Quest6_Note = "Чтобы получить амулет Вароша нужно вызвать и убить Аррока Смертного Вопля "..YELLOW.."[15]"..WHITE..". Для Вызова понадобится Копье и голова вождя Омокка "..YELLOW.."[5]"..WHITE..". Копье находится около "..YELLOW.."[3]"..WHITE..". Во время Вызова появляется несколько волн огров, перед тем как вас атакует Аррок Смертный Вопль. Вы можете использовать Копье в бою, чтобы наносить урон ограм."
Inst8Quest6_Prequest = "Нет"
Inst8Quest6_Folgequest = "Нет"
--
Inst8Quest6name1 = "Prismcharm"

--Quest 7 Alliance
Inst8Quest7 = "7. Вещи Блестяшки"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "Найдите вещи Блестяшки и верните их владелице. Блестяшка сказала, что она спрятала свое оборудование где-то на нижнем ярусе подземелья."
Inst8Quest7_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest7_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[13]"..WHITE..".\nМаксвелл находится около (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")."
Inst8Quest7_Prequest = "Нет"
Inst8Quest7_Folgequest = "Донесение Максвелла"
-- No Rewards for this quest

--Quest 8 Alliance
Inst8Quest8 = "8. Миссия Максвелла"
Inst8Quest8_Level = "60"
Inst8Quest8_Attain = "55"
Inst8Quest8_Aim = "Отправляйтесь на пик Черной горы и устраните воеводу Вуна, вождя Омокка и повелителя Змейталака. По выполнении задания вернитесь к маршалу Максвеллу."
Inst8Quest8_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."84,58"..WHITE..")"
Inst8Quest8_Note = "Вы найдете воеводу Вуна около "..YELLOW.."[9]"..WHITE..", вождя Омокка около "..YELLOW.."[5]"..WHITE.." и повелителя Змейталака около "..YELLOW.."[19]"..WHITE.."."
Inst8Quest8_Prequest = "Донесение Максвелла"
Inst8Quest8_Folgequest = "Нет"
Inst8Quest8FQuest = "true"
--
Inst8Quest8name1 = "Wyrmthalak's Shackles"
Inst8Quest8name2 = "Omokk's Girth Restrainer"
Inst8Quest8name3 = "Halycon's Muzzle"
Inst8Quest8name4 = "Vosh'gajin's Strand"
Inst8Quest8name5 = "Voone's Vice Grips"

--Quest 9 Alliance
Inst8Quest9 = "9. Печать Вознесения"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "Найдите самоцвет Тлеющего Терновника, самоцвет Черной Вершины и самоцвет Кровавого Топора. Верните их Ваелану вместе с заготовкой для печати Вознесения."
Inst8Quest9_Location = "Ваелан (Вершина Черной горы; "..YELLOW.."[1]"..WHITE..")"
Inst8Quest9_Note = "Вы получите самоцвет Черной вершины с вождя Омокка "..YELLOW.."[5]"..WHITE..", самоцвет Тлеющего Терновника с воеводы Вуна около "..YELLOW.."[9]"..WHITE.." самоцвет Кровавого Топора с повелителя Змейталака около "..YELLOW.."[19]"..WHITE..". Простая печать Вознесения может упасть с любого врага в Нижнем ярусе Вершины Черной горы. Если вы закончите эту цепочку заданий, то получите ключ к Верхнему ярусу Вершины Черной горы."
Inst8Quest9_Prequest = "Нет"
Inst8Quest9_Folgequest = "Печать Вознесения"
-- No Rewards for this quest

--Quest 10 Alliance
Inst8Quest10 = "10. Приказ генерала Драккисата"
Inst8Quest10_Level = "60"
Inst8Quest10_Attain = "55"
Inst8Quest10_Aim = "Отнести приказ генерала Драккисата маршалу Максвеллу в Пылающие степи."
Inst8Quest10_Location = "Приказ генерала Драккисата (падает с повелителя Змейталака; "..YELLOW.."[19]"..WHITE..")"
Inst8Quest10_Note = "Маршал Максвелл находится в Пылающие степи - Дозор Моргана; ("..YELLOW.."84,58"..WHITE..")."
Inst8Quest10_Prequest = "Нет"
Inst8Quest10_Folgequest = "Кончина генерала Драккисата ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"
-- No Rewards for this quest

--Quest 11 Alliance
Inst8Quest11 = "11. Левая часть амулета Лорда Вальтхалака"
Inst8Quest11_Level = "60"
Inst8Quest11_Attain = "58"
Inst8Quest11_Aim = "Вызвать дух Мора Серого Копыта с помощью жаровни Призыва, прикончить его и забрать недостающую часть амулета Лорда Вальтхалака. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Вальтхалака и жаровню Призыва."
Inst8Quest11_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst8Quest11_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nМор Серое Копыто вызывается около "..YELLOW.."[9]"..WHITE.."."
Inst8Quest11_Prequest = "Важная составляющая заклинания"
Inst8Quest11_Folgequest = "Я вижу остров Алькац..."
Inst8Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst8Quest12 = "12. Правая часть амулета Лорда Вальтхалака"
Inst8Quest12_Level = "60"
Inst8Quest12_Attain = "58"
Inst8Quest12_Aim = "С помощью жаровни Призыва вызвать дух Кормока и убить его. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
Inst8Quest12_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst8Quest12_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nКормока нужно вызывать около "..YELLOW.."[9]"..WHITE.."."
Inst8Quest12_Prequest = "Еще одна важная составляющая заклинания"
Inst8Quest12_Folgequest = "Последние приготовления ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"
Inst8Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst8Quest13 = "13. Змеекамень Пленяющей Духов"
Inst8Quest13_Level = "60"
Inst8Quest13_Attain = "50"
Inst8Quest13_Aim = "Отправляйтесь на Пик Черной горы, убейте Темную охотницу Вос'гаджин. Заберите у нее змеекамень и принесите Килраму."
Inst8Quest13_Location = "Килрам (Зимние ключи - Круговзор; "..YELLOW.."61,37"..WHITE..")"
Inst8Quest13_Note = "Задание для кузнецов. Темная охотница Вос'гаджин находится около "..YELLOW.."[7]"..WHITE.."."
Inst8Quest13_Prequest = "Нет"
Inst8Quest13_Folgequest = "Нет"
--
Inst8Quest13name1 = "Plans: Dawn's Edge"

--Quest 14 Alliance
Inst8Quest14 = "14. Смерть в огне"
Inst8Quest14_Level = "60"
Inst8Quest14_Attain = "56"
Inst8Quest14_Aim = "Наверняка в этом мире есть кто-то, кто знает, что делать с этими рукавицами."
Inst8Quest14_Location = "Человеческие останки (Нижний ярус Вершины Черной горы; "..YELLOW.."[9]"..WHITE..")"
Inst8Quest14_Note = "Задание для кузнецов. Удостоверьтесь, что подобрали Неопалимые латные перчатки с человеческих останков около "..YELLOW.."[11]"..WHITE..". Отнесите их Малифою Черномолоту (Зимние Ключи - Круговзор; "..YELLOW.."61,39"..WHITE.."). Награды перечислены ниже."
Inst8Quest14_Prequest = "Нет"
Inst8Quest14_Folgequest = "Огненные латные рукавицы"
--
Inst8Quest14name1 = "Plans: Fiery Plate Gauntlets"
Inst8Quest14name2 = "Fiery Plate Gauntlets"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst8Quest1_HORDE = Inst8Quest1
Inst8Quest1_HORDE_Level = Inst8Quest1_Level
Inst8Quest1_HORDE_Attain = Inst8Quest1_Attain
Inst8Quest1_HORDE_Aim = Inst8Quest1_Aim
Inst8Quest1_HORDE_Location = Inst8Quest1_Location
Inst8Quest1_HORDE_Note = Inst8Quest1_Note
Inst8Quest1_HORDE_Prequest = Inst8Quest1_Prequest
Inst8Quest1_HORDE_Folgequest = Inst8Quest1_Folgequest
Inst8Quest1PreQuest_HORDE = Inst8Quest1PreQuest
--
Inst8Quest1name1_HORDE = Inst8Quest1name1
Inst8Quest1name2_HORDE = Inst8Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst8Quest2_HORDE = Inst8Quest2
Inst8Quest2_HORDE_Level = Inst8Quest2_Level
Inst8Quest2_HORDE_Attain = Inst8Quest2_Attain
Inst8Quest2_HORDE_Aim = Inst8Quest2_Aim
Inst8Quest2_HORDE_Location = Inst8Quest2_Location
Inst8Quest2_HORDE_Note = Inst8Quest2_Note
Inst8Quest2_HORDE_Prequest = Inst8Quest2_Prequest
Inst8Quest2_HORDE_Folgequest = Inst8Quest2_Folgequest
--
Inst8Quest2name1_HORDE = Inst8Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst8Quest3_HORDE = Inst8Quest3
Inst8Quest3_HORDE_Level = Inst8Quest3_Level
Inst8Quest3_HORDE_Attain = Inst8Quest3_Attain
Inst8Quest3_HORDE_Aim = Inst8Quest3_Aim
Inst8Quest3_HORDE_Location = Inst8Quest3_Location
Inst8Quest3_HORDE_Note = Inst8Quest3_Note
Inst8Quest3_HORDE_Prequest = Inst8Quest3_Prequest
Inst8Quest3_HORDE_Folgequest = Inst8Quest3_Folgequest
--
Inst8Quest3name1_HORDE = Inst8Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst8Quest4_HORDE = Inst8Quest4
Inst8Quest4_HORDE_Level = Inst8Quest4_Level
Inst8Quest4_HORDE_Attain = Inst8Quest4_Attain
Inst8Quest4_HORDE_Aim = Inst8Quest4_Aim
Inst8Quest4_HORDE_Location = Inst8Quest4_Location
Inst8Quest4_HORDE_Note = Inst8Quest4_Note
Inst8Quest4_HORDE_Prequest = Inst8Quest4_Prequest
Inst8Quest4_HORDE_Folgequest = Inst8Quest4_Folgequest
--
Inst8Quest4name1_HORDE = Inst8Quest4name1

--Quest 5 Horde
Inst8Quest5_HORDE = "5. Праматерь стаи"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "55"
Inst8Quest5_HORDE_Aim = "Убейте Халикон, праматерь стаи воргов Кровавого Топора."
Inst8Quest5_HORDE_Location = "Галамав Стрелок (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest5_HORDE_Note = "Вы найдете Халикон около "..YELLOW.."[17]"..WHITE.."."
Inst8Quest5_HORDE_Prequest = "Нет"
Inst8Quest5_HORDE_Folgequest = "Нет"
--
Inst8Quest5name1_HORDE = "Astoria Robes"
Inst8Quest5name2_HORDE = "Traphook Jerkin"
Inst8Quest5name3_HORDE = "Jadescale Breastplate"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst8Quest6_HORDE = Inst8Quest6
Inst8Quest6_HORDE_Level = Inst8Quest6_Level
Inst8Quest6_HORDE_Attain = Inst8Quest6_Attain
Inst8Quest6_HORDE_Aim = Inst8Quest6_Aim
Inst8Quest6_HORDE_Location = Inst8Quest6_Location
Inst8Quest6_HORDE_Note = Inst8Quest6_Note
Inst8Quest6_HORDE_Prequest = Inst8Quest6_Prequest
Inst8Quest6_HORDE_Folgequest = Inst8Quest6_Folgequest
--
Inst8Quest6name1_HORDE = Inst8Quest6name1

--Quest 7 Horde
Inst8Quest7_HORDE = "7. Агент Блестяшка"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "55"
Inst8Quest7_HORDE_Aim = "Отправьтесь к пику Черной горы и выясните, что сталось с Блестяшкой."
Inst8Quest7_HORDE_Location = "Лекслорт (Бесплодные земли - Каргат; "..YELLOW.."5,47"..WHITE..")"
Inst8Quest7_HORDE_Note = "Вы найдете Блестяшку около "..YELLOW.."[8]"..WHITE.."."
Inst8Quest7_HORDE_Prequest = "Нет"
Inst8Quest7_HORDE_Folgequest = "Вещи Блестяшки"
-- No Rewards for this quest

--Quest 8 Horde
Inst8Quest8_HORDE = "8. Вещи Блестяшки"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "55"
Inst8Quest8_HORDE_Aim = "Найдите вещи Блестяшки и верните их владелице. Блестяшка сказала, что она спрятала свое оборудование где-то на нижнем ярусе подземелья."
Inst8Quest8_HORDE_Location = "Блестяшка (Вершина Черной горы; "..YELLOW.."[3]"..WHITE..")"
Inst8Quest8_HORDE_Note = "Вы найдете вещи Блестяшки по пути к Матери Дымной Паутине около "..YELLOW.."[13]"..WHITE..".\nНаграда отправляет к 'По данным разведки'."
Inst8Quest8_HORDE_Prequest = "Агент Блестяшка"
Inst8Quest8_HORDE_Folgequest = "По данным разведки"
Inst8Quest8FQuest_HORDE = "true"
--
Inst8Quest8name1_HORDE = "Freewind Gloves"
Inst8Quest8name2_HORDE = "Seapost Girdle"

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst8Quest9_HORDE = Inst8Quest9
Inst8Quest9_HORDE_Level = Inst8Quest9_Level
Inst8Quest9_HORDE_Attain = Inst8Quest9_Attain
Inst8Quest9_HORDE_Aim = Inst8Quest9_Aim
Inst8Quest9_HORDE_Location = Inst8Quest9_Location
Inst8Quest9_HORDE_Note = Inst8Quest9_Note
Inst8Quest9_HORDE_Prequest = Inst8Quest9_Prequest
Inst8Quest9_HORDE_Folgequest = Inst8Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde
Inst8Quest10_HORDE = "10. Приказ полководца"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "Убейте вождя Омокка, воеводу Вуна и повелителя Змейталака. Найденные при них важные бумаги Черной горы доставьте полководцу Клинозубу в Каргат."
Inst8Quest10_HORDE_Location = "Полководец Клинозуб (Бесплодные земли - Каргат; "..YELLOW.."65,22"..WHITE..")"
Inst8Quest10_HORDE_Note = "Подготовка к Ониксии.\nВождь Омокк находится около "..YELLOW.."[5]"..WHITE..", воевода Вун находится около "..YELLOW.."[9]"..WHITE.." и повелитель Змейталака "..YELLOW.."[19]"..WHITE..". Важные бумаги Черной горы могут остаться после одного из этих 3 боссов."
Inst8Quest10_HORDE_Prequest = "Нет"
Inst8Quest10_HORDE_Folgequest = "Мудрость Эйтригга -> За Орду! ("..YELLOW.."Верхний ярус Глубин Черной горы"..WHITE..")"
--
Inst8Quest10name1_HORDE = "Wyrmthalak's Shackles"
Inst8Quest10name2_HORDE = "Omokk's Girth Restrainer"
Inst8Quest10name3_HORDE = "Halycon's Muzzle"
Inst8Quest10name4_HORDE = "Vosh'gajin's Strand"
Inst8Quest10name5_HORDE = "Voone's Vice Grips"

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst8Quest11_HORDE = Inst8Quest11
Inst8Quest11_HORDE_Level = Inst8Quest11_Level
Inst8Quest11_HORDE_Attain = Inst8Quest11_Attain
Inst8Quest11_HORDE_Aim = Inst8Quest11_Aim
Inst8Quest11_HORDE_Location = Inst8Quest11_Location
Inst8Quest11_HORDE_Note = Inst8Quest11_Note
Inst8Quest11_HORDE_Prequest = Inst8Quest11_Prequest
Inst8Quest11_HORDE_Folgequest = Inst8Quest11_Folgequest
Inst8Quest11PreQuest_HORDE = Inst8Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst8Quest12_HORDE = Inst8Quest12
Inst8Quest12_HORDE_Level = Inst8Quest12_Level
Inst8Quest12_HORDE_Attain = Inst8Quest12_Attain
Inst8Quest12_HORDE_Aim = Inst8Quest12_Aim
Inst8Quest12_HORDE_Location = Inst8Quest12_Location
Inst8Quest12_HORDE_Note = Inst8Quest12_Note
Inst8Quest12_HORDE_Prequest = Inst8Quest12_Prequest
Inst8Quest12_HORDE_Folgequest = Inst8Quest12_Folgequest
Inst8Quest12PreQuest_HORDE = Inst8Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst8Quest13_HORDE = Inst8Quest13
Inst8Quest13_HORDE_Level = Inst8Quest13_Level
Inst8Quest13_HORDE_Attain = Inst8Quest13_Attain
Inst8Quest13_HORDE_Aim = Inst8Quest13_Aim
Inst8Quest13_HORDE_Location = Inst8Quest13_Location
Inst8Quest13_HORDE_Note = Inst8Quest13_Note
Inst8Quest13_HORDE_Prequest = Inst8Quest13_Prequest
Inst8Quest13_HORDE_Folgequest = Inst8Quest13_Folgequest
--
Inst8Quest13name1_HORDE = Inst8Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst8Quest14_HORDE = Inst8Quest14
Inst8Quest14_HORDE_Level = Inst8Quest14_Level
Inst8Quest14_HORDE_Attain = Inst8Quest14_Attain
Inst8Quest14_HORDE_Aim = Inst8Quest14_Aim
Inst8Quest14_HORDE_Location = Inst8Quest14_Location
Inst8Quest14_HORDE_Note = Inst8Quest14_Note
Inst8Quest14_HORDE_Prequest = Inst8Quest14_Prequest
Inst8Quest14_HORDE_Folgequest = Inst8Quest14_Folgequest
--
Inst8Quest14name1_HORDE = Inst8Quest14name1
Inst8Quest14name2_HORDE = Inst8Quest14name2


--------------- INST9 - Upper Blackrock Spire (UBRS) ---------------

Inst9Story = "The mighty fortress carved within the fiery bowels of Черная гора was designed by the master dwarf-mason, Franclorn Forgewright. Intended to be the symbol of Dark Iron power, the fortress was held by the sinister dwarves for centuries. However, Nefarian - the cunning son of the dragon, Deathwing - had other plans for the great keep. He and his draconic minions took control of the upper Spire and made war on the dwarves' holdings in the mountain's volcanic depths. Realizing that the dwarves were led by the mighty fire elemental, Ragnaros - Nefarian vowed to crush his enemies and claim the whole of Blackrock mountain for himself."
Inst9Caption = "Верхний ярус вершины Черной горы"
Inst9QAA = "11 Заданий"
Inst9QAH = "13 Заданий"

--Quest 1 Alliance
Inst9Quest1 = "1. Матрона-защитница"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "Добраться до Зимних Ключей и найти Халех. Отдать ей пластину чешуи Ауби."
Inst9Quest1_Location = "Ауби (Вершина Черной горы; "..YELLOW.."[7]"..WHITE..")"
Inst9Quest1_Note = "Вы найдете Ауби в комнате за Ареной около "..YELLOW.."[7]"..WHITE..".\nХалех находится в Зимних Ключах ("..YELLOW.."54,51"..WHITE.."). Используйте знак-портал в конце пещеры, чтобы добраться до нее."
Inst9Quest1_Prequest = "Нет"
Inst9Quest1_Folgequest = "Ярость Синих драконов"
-- No Rewards for this quest

--Quest 2 Alliance
Inst9Quest2 = "2. Айс Вентурон, к вашим услугам!"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "57"
Inst9Quest2_Aim = "Переговорить с Малифоем Черномолотом в Круговзоре."
Inst9Quest2_Location = "Айс Вентурон (Вершина Черной горы; "..YELLOW.."[8]"..WHITE..")"
Inst9Quest2_Note = "Айс Вентурон появляется после свежевания Зверя. Вы найдете Малифоя в (Зимние Ключи - Круговзор; "..YELLOW.."61,38"..WHITE..")."
Inst9Quest2_Prequest = "Нет"
Inst9Quest2_Folgequest = "Поножи Аркана, Шапка Алого Ученого, Кираса кровавой жажды"
-- No Rewards for this quest

--Quest 3 Alliance
Inst9Quest3 = "3. Заморозка яйца"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "57"
Inst9Quest3_Aim = "Испытайте прототип яйцехладоскопа на одном из яиц в Гнездовье."
Inst9Quest3_Location = "Тинки Кипеллер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest3_Note = "Вы найдете яйца в комнате Отца Пламени около "..YELLOW.."[2]"..WHITE.."."
Inst9Quest3_Prequest = "Сущность детеныша дракона -> Тинки Кипеллер"
Inst9Quest3_Folgequest = "Леонид Барталомей -> Рассветный гамбит ("..YELLOW.."Некроситет"..WHITE..")"
Inst9Quest3PreQuest = "true"
--
Inst9Quest3name1 = "Eggscilloscope"

--Quest 4 Alliance
Inst9Quest4 = "4. Око Углеглаза"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "55"
Inst9Quest4_Aim = "Принесите глаз Созерцателя Углей герцогу Гидраксису в Азшару."
Inst9Quest4_Location = "Герцог Гидраксис (Азшара; "..YELLOW.."79,73"..WHITE..")"
Inst9Quest4_Note = "Вы найдете Пиростраж Созерцатель Углей около "..YELLOW.."[1]"..WHITE..".\n\nПосле патча 3.0.8 нельзя взять эту цепочку заданий. Но если это задание у вас уже взято, вы сможете его закончить."
Inst9Quest4_Prequest = "Отравленная вода"
Inst9Quest4_Folgequest = "Огненные Недра"
Inst9Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst9Quest5 = "5. Кончина генерала Драккисата"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "Отправьтесь на пик Черной Скалы и устраните генерала Драккисата. По выполнении задания вернитесь к маршалу Максвеллу."
Inst9Quest5_Location = "Маршал Максвелл (Пылающие степи - Дозор Моргана; "..YELLOW.."82,68"..WHITE..")"
Inst9Quest5_Note = "Вы найдете генерала Драккисата около "..YELLOW.."[9]"..WHITE.."."
Inst9Quest5_Prequest = "Приказ генерала Драккисата ("..YELLOW.."Нижний ярус Вершины Черной горы"..WHITE..")"
Inst9Quest5_Folgequest = "Нет"
Inst9Quest5PreQuest = "true"
--
Inst9Quest5name1 = "Mark of Tyranny"
Inst9Quest5name2 = "Eye of the Beast"
Inst9Quest5name3 = "Blackhand's Breadth"

--Quest 6 Alliance
Inst9Quest6 = "6. Пряжка Роковой оснастки"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "Принесите пряжку Роковой оснастки Майре Светлое Крыло в Пылающие степи."
Inst9Quest6_Location = "Майра Светлое Крыло (Пылающие степи - Дозор Моргана; "..YELLOW.."84,69"..WHITE..")"
Inst9Quest6_Note = "Вы возьмете предшествующее задание у графа Ремингтона Риджвелла (Штормград - Крепость Штормграда; "..YELLOW.."76.9, 47.4"..WHITE..").\n\nПряжка Роковой оснастки is находится около "..YELLOW.."[3]"..WHITE.." с сундуке."
Inst9Quest6_Prequest = "Майра Светлое Крыло"
Inst9Quest6_Folgequest = "Доставить Риджвеллу"
Inst9Quest6PreQuest = "true"
--
Inst9Quest6name1 = "Swiftfoot Treads"
Inst9Quest6name2 = "Blinkstrike Armguards"

--Quest 7 Alliance
Inst9Quest7 = "7. Приказ Чернорука"
Inst9Quest7_Level = "60"
Inst9Quest7_Attain = "55"
Inst9Quest7_Aim = "В письме ясно сказано, что генерал Драккисат охраняет клеймо. Наверное, стоит проверить."
Inst9Quest7_Location = "Приказ Чернорука (падает с Интенданта из легиона Изрубленного Щита; "..YELLOW.."[7] на карте входа"..WHITE..")"
Inst9Quest7_Note = "Задание для подготовки к Логову Крыла Тьмы. Интенданта из легиона Изрубленного Щита можно найти если повернуть направо перед порталом в НВЧГ/ВВЧГ.\n\nГенерал Драккисат находится около "..YELLOW.."[9]"..WHITE..". Печать за ним."
Inst9Quest7_Prequest = "Нет"
Inst9Quest7_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 8 Alliance
Inst9Quest8 = "8. Последние приготовления"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "58"
Inst9Quest8_Aim = "Соберите 40 наручей Черной горы и разыскать склянку Великой силы. Отнесите их Бодли в Черную Скалу."
Inst9Quest8_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst9Quest8_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'. Наручи Черной горы падают с существ с 'Черной Рукой' в имени. Склянку Великой силы делают алхимики."
Inst9Quest8_Prequest = "Правая часть амулета Лорда Вальтхалака ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"
Inst9Quest8_Folgequest = "Mea Culpa, Лорд Вальтхалак"
Inst9Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst9Quest9 = "9. Mea Culpa, Лорд Вальтхалак"
Inst9Quest9_Level = "60"
Inst9Quest9_Attain = "58"
Inst9Quest9_Aim = "Вызвать Лорда Вальтхалака с помощью жаровни Призыва. Убить его и использовать амулет. Потом вернуть амулет духу Вальтхалака."
Inst9Quest9_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst9Quest9_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'. Лорд Вальтхалак призывается около "..YELLOW.."[8]"..WHITE..". Список наград в задании Возвращение к Бодли."
Inst9Quest9_Prequest = "Последние приготовления"
Inst9Quest9_Folgequest = "Возвращение к Бодли"
Inst9Quest9FQuest = "true"
--
Inst9Quest9name1 = "Brazier of Invocation"
Inst9Quest9name2 = "Brazier of Invocation: User's Manual"

--Quest 10 Alliance
Inst9Quest10 = "10. Демонова Кузня (Кузнечное дело)"
Inst9Quest10_Level = "60"
Inst9Quest10_Attain = "55"
Inst9Quest10_Aim = "Отправляйтесь на пик Черной горы и найдите Горалука Треснувшую Наковальню. Убейте его, а потом воткните в труп окровавленную пику. Когда вы извлечете его душу, пика станет запятнанной душами.\nКроме того, вам нужно найти некованую руническую кирасу.\nОтнесите пику и кирасу Лораксу в Зимних Ключах."
Inst9Quest10_Location = "Лоракс (Зимние Ключи; "..YELLOW.."64,74"..WHITE..")"
Inst9Quest10_Note = "Задание для кузнецов. Горалук Треснувшая наковальня находится около "..YELLOW.."[5]"..WHITE.."."
Inst9Quest10_Prequest = "Нет"
Inst9Quest10_Folgequest = "Нет"
--
Inst9Quest10name1 = "Plans: Demon Forged Breastplate"
Inst9Quest10name2 = "Elixir of Demonslaying"
Inst9Quest10name3 = "Demon Kissed Sack"

--Quest 11 Alliance
Inst9Quest11 = "11. Сбор яиц"
Inst9Quest11_Level = "60"
Inst9Quest11_Attain = "57"
Inst9Quest11_Aim = "Принесите 8 драконьих яиц и устройство-коллекционер Тинки Кипеллер в Пламенеющий Стяг в Пылающих степях."
Inst9Quest11_Location = "Тинки Кипеллер (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,24"..WHITE..")"
Inst9Quest11_Note = "Вы найдете яйца в комнате с Огнем отцов "..YELLOW.."[2]"..WHITE.."."
Inst9Quest11_Prequest = "Заморозка яйца"
Inst9Quest11_Folgequest = "Леонид Барталомей -> Рассветный гамбит ("..YELLOW.."Некроситет"..WHITE..")"
Inst9Quest11PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst9Quest1_HORDE = Inst9Quest1
Inst9Quest1_HORDE_Level = Inst9Quest1_Level
Inst9Quest1_HORDE_Attain = Inst9Quest1_Attain
Inst9Quest1_HORDE_Aim = Inst9Quest1_Aim
Inst9Quest1_HORDE_Location = Inst9Quest1_Location
Inst9Quest1_HORDE_Note = Inst9Quest1_Note
Inst9Quest1_HORDE_Prequest = Inst9Quest1_Prequest
Inst9Quest1_HORDE_Folgequest = Inst9Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst9Quest2_HORDE = Inst9Quest2
Inst9Quest2_HORDE_Level = Inst9Quest2_Level
Inst9Quest2_HORDE_Attain = Inst9Quest2_Attain
Inst9Quest2_HORDE_Aim = Inst9Quest2_Aim
Inst9Quest2_HORDE_Location = Inst9Quest2_Location
Inst9Quest2_HORDE_Note = Inst9Quest2_Note
Inst9Quest2_HORDE_Prequest = Inst9Quest2_Prequest
Inst9Quest2_HORDE_Folgequest = Inst9Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst9Quest3_HORDE = Inst9Quest3
Inst9Quest3_HORDE_Level = Inst9Quest3_Level
Inst9Quest3_HORDE_Attain = Inst9Quest3_Attain
Inst9Quest3_HORDE_Aim = Inst9Quest3_Aim
Inst9Quest3_HORDE_Location = Inst9Quest3_Location
Inst9Quest3_HORDE_Note = Inst9Quest3_Note
Inst9Quest3_HORDE_Prequest = Inst9Quest3_Prequest
Inst9Quest3_HORDE_Folgequest = Inst9Quest3_Folgequest
Inst9Quest3PreQuest_HORDE = Inst9Quest3PreQuest
--
Inst9Quest3name1_HORDE = Inst9Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst9Quest4_HORDE = Inst9Quest4
Inst9Quest4_HORDE_Level = Inst9Quest4_Level
Inst9Quest4_HORDE_Attain = Inst9Quest4_Attain
Inst9Quest4_HORDE_Aim = Inst9Quest4_Aim
Inst9Quest4_HORDE_Location = Inst9Quest4_Location
Inst9Quest4_HORDE_Note = Inst9Quest4_Note
Inst9Quest4_HORDE_Prequest = Inst9Quest4_Prequest
Inst9Quest4_HORDE_Folgequest = Inst9Quest4_Folgequest
Inst9Quest4PreQuest_HORDE = Inst9Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde
Inst9Quest5_HORDE = "5. Табличка Темнокамня"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "Принести табличку Темного Камня тенемагу Вивиан Лаграв в Каргат."
Inst9Quest5_HORDE_Location = "Вивиан ЛяГроб (Бесплодные земли - Каргат; "..YELLOW.."2,47"..WHITE..")"
Inst9Quest5_HORDE_Note = "Вы получите предшествующее задание у аптекаря Зинга в Подгороде - Квартал фармацевтов ("..YELLOW.."50,68"..WHITE..").\n\nThe Табличка Темнокамня находится около "..YELLOW.."[3]"..WHITE.." в сундуке."
Inst9Quest5_HORDE_Prequest = "Вивиан Лягроб и табличка Темнокамня"
Inst9Quest5_HORDE_Folgequest = "Нет"
Inst9Quest5PreQuest_HORDE = "true"
--
Inst9Quest5name1_HORDE = "Swiftfoot Treads"
Inst9Quest5name2_HORDE = "Blinkstrike Armguards"

--Quest 6 Horde
Inst9Quest6_HORDE = "6. За Орду!"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "Пойдите в Пик Черной горы и убейте вождя Ренда Чернорука. Принесите его голову в Оргриммар."
Inst9Quest6_HORDE_Location = "Тралл (Оргриммар; "..YELLOW.."31,38"..WHITE..")"
Inst9Quest6_HORDE_Note = "Задание для подготовки к Ониксии. Вы найдете вождя Ренда Черную руку около "..YELLOW.."[6]"..WHITE.."."
Inst9Quest6_HORDE_Prequest = "Приказ полководца -> Мудрость Эйтригга"
Inst9Quest6_HORDE_Folgequest = "Что принес ветер"
Inst9Quest6PreQuest_HORDE = "true"
--
Inst9Quest6name1_HORDE = "Mark of Tyranny"
Inst9Quest6name2_HORDE = "Eye of the Beast"
Inst9Quest6name3_HORDE = "Blackhand's Breadth"

--Quest 7 Horde
Inst9Quest7_HORDE = "7. Иллюзиии Ока"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "57"
Inst9Quest7_HORDE_Aim = "Отправляйтесь на пик Черной горы и добудьте 20 глаз черных драконидов. По выполнении задания вернитесь к Миранде Колдунье."
Inst9Quest7_HORDE_Location = "Миранда Колдунья (Западные Чумные земли; "..YELLOW.."50,77"..WHITE..")"
Inst9Quest7_HORDE_Note = "Глаза падают с драконидов."
Inst9Quest7_HORDE_Prequest = "Что принес ветер -> Госпожа обмана"
Inst9Quest7_HORDE_Folgequest = "Огнебор"
Inst9Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst9Quest8_HORDE = "8. Кровь могучего черного дракона"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "56"
Inst9Quest8_HORDE_Aim = "Отправляйтесь к пику Черной горы и убейте генерала Драккисата. Соберите его кровь и вернитесь к Рокаро."
Inst9Quest8_HORDE_Location = "Рокаро (Пустоши - Деревня Ночных охотников; "..YELLOW.."25,71"..WHITE..")"
Inst9Quest8_HORDE_Note = "Последняя часть на пути к Ониксии. Вы найдете генерала Драккисата около "..YELLOW.."[9]"..WHITE.."."
Inst9Quest8_HORDE_Prequest = "Огнебор -> Вознесение"
Inst9Quest8_HORDE_Folgequest = "Нет"
Inst9Quest8FQuest_HORDE = "true"
--
Inst9Quest8name1_HORDE = "Drakefire Amulet"

--Quest 9 Horde  (same as Quest 7 Alliance)
Inst9Quest9_HORDE = "7. Приказ Чернорука"
Inst9Quest9_HORDE_Level = Inst9Quest7_Level
Inst9Quest9_HORDE_Attain = Inst9Quest7_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest7_Aim
Inst9Quest9_HORDE_Location = Inst9Quest7_Location
Inst9Quest9_HORDE_Note = Inst9Quest7_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest7_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest7_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 8 Alliance)
Inst9Quest10_HORDE = "10. Последние приготовления"
Inst9Quest10_HORDE_Level = Inst9Quest8_Level
Inst9Quest10_HORDE_Attain = Inst9Quest8_Attain
Inst9Quest10_HORDE_Aim = Inst9Quest8_Aim
Inst9Quest10_HORDE_Location = Inst9Quest8_Location
Inst9Quest10_HORDE_Note = Inst9Quest8_Note
Inst9Quest10_HORDE_Prequest = Inst9Quest8_Prequest
Inst9Quest10_HORDE_Folgequest = Inst9Quest8_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 9 Alliance)
Inst9Quest11_HORDE = "11. Mea Culpa, Лорд Вальтхалак"
Inst9Quest11_HORDE_Level = Inst9Quest9_Level
Inst9Quest11_HORDE_Attain = Inst9Quest9_Attain
Inst9Quest11_HORDE_Aim = Inst9Quest9_Aim
Inst9Quest11_HORDE_Location = Inst9Quest9_Location
Inst9Quest11_HORDE_Note = Inst9Quest9_Note
Inst9Quest11_HORDE_Prequest = Inst9Quest9_Prequest
Inst9Quest11_HORDE_Folgequest = Inst9Quest9_Folgequest
--
Inst9Quest11name1_HORDE = Inst9Quest9name1
Inst9Quest11name2_HORDE = Inst9Quest9name2

--Quest 12 Horde  (same as Quest 10 Alliance)
Inst9Quest12_HORDE = "12. Демонова Кузня"
Inst9Quest12_HORDE_Level = Inst9Quest10_Level
Inst9Quest12_HORDE_Attain = Inst9Quest10_Attain
Inst9Quest12_HORDE_Aim = Inst9Quest10_Aim
Inst9Quest12_HORDE_Location = Inst9Quest10_Location
Inst9Quest12_HORDE_Note = Inst9Quest10_Note
Inst9Quest12_HORDE_Prequest = Inst9Quest10_Prequest
Inst9Quest12_HORDE_Folgequest = Inst9Quest10_Folgequest
--
Inst9Quest12name1_HORDE = Inst9Quest10name1
Inst9Quest12name2_HORDE = Inst9Quest10name2
Inst9Quest12name3_HORDE = Inst9Quest10name3

--Quest 13 Horde  (same as Quest 11 Alliance)
Inst9Quest13_HORDE = "13. Сбор яиц"
Inst9Quest13_HORDE_Level = Inst9Quest11_Level
Inst9Quest13_HORDE_Attain = Inst9Quest11_Attain
Inst9Quest13_HORDE_Aim = Inst9Quest11_Aim
Inst9Quest13_HORDE_Location = Inst9Quest11_Location
Inst9Quest13_HORDE_Note = Inst9Quest11_Note
Inst9Quest13_HORDE_Prequest = Inst9Quest11_Prequest
Inst9Quest13_HORDE_Folgequest = Inst9Quest11_Folgequest
Inst9Quest13PreQuest_HORDE = Inst9Quest11PreQuest
-- No Rewards for this quest



--------------- INST10 - Dire Maul East (DM) ---------------

Inst10Story = "Построенный двенадцать тысяч лет назад тайной сектой волшебников ночных эльфов, древний город Эльдре'Талас использовали, чтобы защитить самые ценные секреты королевы Азшары. Несмотря на то, что он был уничтожен Великим Расколом мира, большая часть изумительного города еще существует как грандиозный Ужасный Кулак. Три самобытных района руин населили всевозможные твари - в основном призрачными высокорожденными, грязными сатирами и безмозглыми ограми. Только группа самых отважных искателей приключений может войти в разрушенный город и встретиться лицом к лицу с древним злом, заключенным в его древних подвалах."
Inst10Caption = "Забытый город (Восток)"
Inst10QAA = "6 Заданий"
Inst10QAH = "6 Заданий"

--Quest 1 Alliance
Inst10Quest1 = "1. Пузиллин и старейший Аж'Тордин"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "54"
Inst10Quest1_Aim = "Отправляйтесь в Забытый Город и отыщите беса Пузиллина. Любыми доступными средствами убедите Пузиллина отдать вам книгу заклинаний Аж'Тордина.\nВозвращение к Аж'Тордину в Фераласе позволит вам восстановить книгу заклинаний."
Inst10Quest1_Location = "Аж'Тордин (Фералас - Lariss Pavillion; "..YELLOW.."76,37"..WHITE..")"
Inst10Quest1_Note = "Пузиллин находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[1]"..WHITE..". Он убегает когда вы поговорите с ним, но останавливается и сражается около "..YELLOW.."[2]"..WHITE..". С него падает Ключ Полумесяца, используемый в Забытом городе Север и Запад."
Inst10Quest1_Prequest = "Нет"
Inst10Quest1_Folgequest = "Нет"
--
Inst10Quest1name1 = "Spry Boots"
Inst10Quest1name2 = "Sprinter's Sword"

--Quest 2 Alliance
Inst10Quest2 = "2. Сеть Лефтендрис"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "54"
Inst10Quest2_Aim = "Принесите сеть Лефтендрис Латроникусу Лунному Копью в Крепость Оперенной Луны в Фераласе."
Inst10Quest2_Location = "Латроникус Лунное Копье (Фералас - Крепость Оперенной Луны; "..YELLOW.."30,46"..WHITE..")"
Inst10Quest2_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествующее задание идет от Курьера Удар Молота в Стальгорне. Он бродит по всему городу."
Inst10Quest2_Prequest = "Крепость Оперенной Луны"
Inst10Quest2_Folgequest = "Нет"
Inst10Quest2PreQuest = "true"
--
Inst10Quest2name1 = "Lorespinner"

--Quest 3 Alliance
Inst10Quest3 = "3. Осколки сквернита"
Inst10Quest3_Level = "60"
Inst10Quest3_Attain = "56"
Inst10Quest3_Aim = "Отыщите Сквернит в Забытом Городе и подберите его осколок. Есть шанс, что вам удастся его добыть, только убив Алззина Вертоградаря. Крепко заприте осколок в реликварии Чистоты, затем верните его Рабину Сатурне в Ночную Гавань в Лунной поляне."
Inst10Quest3_Location = "Рабин Сатурна (Лунная поляна - Ночная гавань; "..YELLOW.."51,44"..WHITE..")"
Inst10Quest3_Note = "Вы найдете Алззина Вертоградаря в "..YELLOW.."Восточной"..WHITE.." части Забытого города около "..YELLOW.."[5]"..WHITE..". Реликварий находится в Силитусе около "..YELLOW.."62,54"..WHITE..". Предществующее задание также идет от Рабина Сатурна."
Inst10Quest3_Prequest = "Реликварий Чистоты"
Inst10Quest3_Folgequest = "Нет"
Inst10Quest3PreQuest = "true"
--
Inst10Quest3name1 = "Milli's Shield"
Inst10Quest3name2 = "Milli's Lexicon"

--Quest 4 Alliance
Inst10Quest4 = "4. Левая часть амулета Лорда Вальтхалака"
Inst10Quest4_Level = "60"
Inst10Quest4_Attain = "58"
Inst10Quest4_Aim = "С помощью жаровни Призыва вызвать дух Изалиен и убить ее. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Лорда Вальтхалака и жаровню Призыва."
Inst10Quest4_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst10Quest4_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nИзалиен призывается около "..YELLOW.."[5]"..WHITE.."."
Inst10Quest4_Prequest = "Важная составляющая заклинания"
Inst10Quest4_Folgequest = "Я вижу остров Алькац..."
Inst10Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst10Quest5 = "5. Правая часть амулета Лорда Вальтхалака"
Inst10Quest5_Level = "60"
Inst10Quest5_Attain = "58"
Inst10Quest5_Aim = "С помощью жаровни Призыва вызвать дух Изалиен и убить ее. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
Inst10Quest5_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst10Quest5_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nИзалиен призывается около "..YELLOW.."[5]"..WHITE.."."
Inst10Quest5_Prequest = "Еще одна важная составляющая заклинания"
Inst10Quest5_Folgequest = "Последние приготовления ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"
Inst10Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst10Quest6 = "6. Тюремные кандалы (Чернокнижник)"
Inst10Quest6_Level = "60"
Inst10Quest6_Attain = "60"
Inst10Quest6_Aim = "Отправляйтесь в Забытый Город, что в Фераласе и добудьте 15 порций крови сатиров из племени Исчадий Природы, что живут в Квартале Криводревов. Вернитесь к Дайо из Гниющего шрама по выполнении поручения."
Inst10Quest6_Location = "Дайо Дряхлый (Выжженные земли - Гниющий шрам; "..YELLOW.."34,50"..WHITE..")"
Inst10Quest6_Note = "Это задание, как и другое у Дайо Дряхлого, предназначено только для чернокнижников для заклинания Ритуал Рока. Простейший путь добраться до Сатиров из племени Исчадий Природы это войти в Забытый город - Восток через 'черный ход' в Lariss Pavilion (Фералас; "..YELLOW.."77,37"..WHITE.."). You'll need the Crescent Key, however."
Inst10Quest6_Prequest = "Нет"
Inst10Quest6_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst10Quest1_HORDE = Inst10Quest1
Inst10Quest1_HORDE_Level = Inst10Quest1_Level
Inst10Quest1_HORDE_Attain = Inst10Quest1_Attain
Inst10Quest1_HORDE_Aim = Inst10Quest1_Aim
Inst10Quest1_HORDE_Location = Inst10Quest1_Location
Inst10Quest1_HORDE_Note = Inst10Quest1_Note
Inst10Quest1_HORDE_Prequest = Inst10Quest1_Prequest
Inst10Quest1_HORDE_Folgequest = Inst10Quest1_Folgequest
--
Inst10Quest1name1_HORDE = Inst10Quest1name1
Inst10Quest1name2_HORDE = Inst10Quest1name2

--Quest 2 Horde
Inst10Quest2_HORDE = "2. Сеть Лефтендрис"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "54"
Inst10Quest2_HORDE_Aim = "Принесите сеть Лефтендрис Тало Терновому Копыту в Лагере Мохаче в Фераласе."
Inst10Quest2_HORDE_Location = "Тало Терновое Копыто (Фералас - Лагерь Мохаче; "..YELLOW.."76,43"..WHITE..")"
Inst10Quest2_HORDE_Note = "Лефтендрис находится в Забытом городе "..YELLOW.."Восток"..WHITE.." около "..YELLOW.."[3]"..WHITE..". Предшествеющее задание идет от Военного глашатая Горлача в Оргриммаре. Он бродит по всему городу."
Inst10Quest2_HORDE_Prequest = "Лагерь Мохаче"
Inst10Quest2_HORDE_Folgequest = "Нет"
Inst10Quest2PreQuest_HORDE = "true"
--
Inst10Quest2name1_HORDE = "Lorespinner"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst10Quest3_HORDE = Inst10Quest3
Inst10Quest3_HORDE_Level = Inst10Quest3_Level
Inst10Quest3_HORDE_Attain = Inst10Quest3_Attain
Inst10Quest3_HORDE_Aim = Inst10Quest3_Aim
Inst10Quest3_HORDE_Location = Inst10Quest3_Location
Inst10Quest3_HORDE_Note = Inst10Quest3_Note
Inst10Quest3_HORDE_Prequest = Inst10Quest3_Prequest
Inst10Quest3_HORDE_Folgequest = Inst10Quest3_Folgequest
--
Inst10Quest3name1_HORDE = Inst10Quest3name1
Inst10Quest3name2_HORDE = Inst10Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst10Quest4_HORDE = Inst10Quest4
Inst10Quest4_HORDE_Level = Inst10Quest4_Level
Inst10Quest4_HORDE_Attain = Inst10Quest4_Attain
Inst10Quest4_HORDE_Aim = Inst10Quest4_Aim
Inst10Quest4_HORDE_Location = Inst10Quest4_Location
Inst10Quest4_HORDE_Note = Inst10Quest4_Note
Inst10Quest4_HORDE_Prequest = Inst10Quest4_Prequest
Inst10Quest4_HORDE_Folgequest = Inst10Quest4_Folgequest
Inst10Quest4PreQuest_HORDE = Inst10Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst10Quest5_HORDE = Inst10Quest5
Inst10Quest5_HORDE_Level = Inst10Quest5_Level
Inst10Quest5_HORDE_Attain = Inst10Quest5_Attain
Inst10Quest5_HORDE_Aim = Inst10Quest5_Aim
Inst10Quest5_HORDE_Location = Inst10Quest5_Location
Inst10Quest5_HORDE_Note = Inst10Quest5_Note
Inst10Quest5_HORDE_Prequest = Inst10Quest5_Prequest
Inst10Quest5_HORDE_Folgequest = Inst10Quest5_Folgequest
Inst10Quest5PreQuest_HORDE = Inst10Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst10Quest6_HORDE = Inst10Quest6
Inst10Quest6_HORDE_Level = Inst10Quest6_Level
Inst10Quest6_HORDE_Attain = Inst10Quest6_Attain
Inst10Quest6_HORDE_Aim = Inst10Quest6_Aim
Inst10Quest6_HORDE_Location = Inst10Quest6_Location
Inst10Quest6_HORDE_Note = Inst10Quest6_Note
Inst10Quest6_HORDE_Prequest = Inst10Quest6_Prequest
Inst10Quest6_HORDE_Folgequest = Inst10Quest6_Folgequest
-- No Rewards for this quest



--------------- INST11 - Dire Maul North (DM) ---------------

Inst11Story = "Построенный двенадцать тысяч лет назад тайной сектой волшебников ночных эльфов, древний город Эльдре'Талас использовали, чтобы защитить самые ценные секреты королевы Азшары. Несмотря на то, что он был уничтожен Великим Расколом мира, большая часть изумительного города еще существует как грандиозный Ужасный Кулак. Три самобытных района руин населили всевозможные твари - в основном призрачными высокорожденными, грязными сатирами и безмозглыми ограми. Только группа самых отважных искателей приключений может войти в разрушенный город и встретиться лицом к лицу с древним злом, заключенным в его древних подвалах."
Inst11Caption = "Забытый город (Север)"
Inst11QAA = "4 Задания"
Inst11QAH = "4 Задания"

--Quest 1 Alliance
Inst11Quest1 = "1. Сломанная западня"
Inst11Quest1_Level = "60"
Inst11Quest1_Attain = "56"
Inst11Quest1_Aim = "Отремонтировать западню."
Inst11Quest1_Location = "Сломанная западня (Забытый город; "..YELLOW.."Север"..WHITE..")"
Inst11Quest1_Note = "Повторяемое задание. Для ремонта западни нужно использовать [Ториевое устройство] и [Масло льда]."
Inst11Quest1_Prequest = "Нет"
Inst11Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst11Quest2 = "2. Броня огров Гордока"
Inst11Quest2_Level = "60"
Inst11Quest2_Attain = "56"
Inst11Quest2_Aim = "Принесите 4 рулона рунной ткани, 8 кусков прочной кожи, 2 мотка рунной нити и огрскую дубильную кислоту Уззлу Наперстяку. Он прикован в секторе Гордока в Забытом Городе."
Inst11Quest2_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
Inst11Quest2_Note = "Повторяемое задание. Вы найдете огрскую дубильную кислоту около "..YELLOW.."[4] (сверху)"..WHITE.."."
Inst11Quest2_Prequest = "Нет"
Inst11Quest2_Folgequest = "Нет"
--
Inst11Quest2name1 = "Gordok Ogre Suit"

--Quest 3 Alliance
Inst11Quest3 = "3. Освободите Нотта!"
Inst11Quest3_Level = "60"
Inst11Quest3_Attain = "60"
Inst11Quest3_Aim = "Найдите Ключ от оков Гордока для Уззла Наперстяка."
Inst11Quest3_Location = "Уззл Наперстяк (Забытый город; "..YELLOW.."Север, [4]"..WHITE..")"
Inst11Quest3_Note = "Повторяемое задание. Ключ может выпасть из любого охранника."
Inst11Quest3_Prequest = "Нет"
Inst11Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst11Quest4 = "4. Неоконченное дело Гордоков"
Inst11Quest4_Level = "60"
Inst11Quest4_Attain = "56"
Inst11Quest4_Aim = "Добудьте латную рукавицу Мощи Гордока и вернитесь с ней к капитану Кром-Крушителю в Грозном Молоте.\nПо словам Кром-Крушителя, в 'старых байках' говорится, что Тортелдрин - 'паскудный эльф', называющий себя принцем, - похитил эту рукавицу у одного из королей Гордоков."
Inst11Quest4_Location = "Кром-Крушитель (Забытый город; "..YELLOW.."Север, [5]"..WHITE..")"
Inst11Quest4_Note = "Принц находится в Забытом городе "..YELLOW.."Запад"..WHITE.." около "..YELLOW.."[7]"..WHITE..". Рукавица в сундуке прямо рядом с ним. Вы можете взять это задание только после Tribute run и с баффом It's Good to be King!."
Inst11Quest4_Prequest = "Нет"
Inst11Quest4_Folgequest = "Нет"
--
Inst11Quest4name1 = "Gordok's Handwraps"
Inst11Quest4name2 = "Gordok's Gloves"
Inst11Quest4name3 = "Gordok's Gauntlets"
Inst11Quest4name4 = "Gordok's Handguards"

--Quest 5 Alliance
Inst11Quest5 = "5. Лучшее пойло Гордока"
Inst11Quest5_Level = "60"
Inst11Quest5_Attain = "60"
Inst11Quest5_Aim = "Халявная выпивка."
Inst11Quest5_Location = "Топотун Криг (Забытый город; "..YELLOW.."Север, [2]"..WHITE..")"
Inst11Quest5_Note = "Для выполнения задания нужно несколько раз поговорить с NPC."
Inst11Quest5_Prequest = "Нет"
Inst11Quest5_Folgequest = "Нет"
--
Inst11Quest5name1 = "Gordok Green Grog"
Inst11Quest5name2 = "Kreeg's Stout Beatdown"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst11Quest1_HORDE = Inst11Quest1
Inst11Quest1_HORDE_Level = Inst11Quest1_Level
Inst11Quest1_HORDE_Attain = Inst11Quest1_Attain
Inst11Quest1_HORDE_Aim = Inst11Quest1_Aim
Inst11Quest1_HORDE_Location = Inst11Quest1_Location
Inst11Quest1_HORDE_Note = Inst11Quest1_Note
Inst11Quest1_HORDE_Prequest = Inst11Quest1_Prequest
Inst11Quest1_HORDE_Folgequest = Inst11Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst11Quest2_HORDE = Inst11Quest2
Inst11Quest2_HORDE_Level = Inst11Quest2_Level
Inst11Quest2_HORDE_Attain = Inst11Quest2_Attain
Inst11Quest2_HORDE_Aim = Inst11Quest2_Aim
Inst11Quest2_HORDE_Location = Inst11Quest2_Location
Inst11Quest2_HORDE_Note = Inst11Quest2_Note
Inst11Quest2_HORDE_Prequest = Inst11Quest2_Prequest
Inst11Quest2_HORDE_Folgequest = Inst11Quest2_Folgequest
--
Inst11Quest2name1_HORDE = Inst11Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst11Quest3_HORDE = Inst11Quest3
Inst11Quest3_HORDE_Level = Inst11Quest3_Level
Inst11Quest3_HORDE_Attain = Inst11Quest3_Attain
Inst11Quest3_HORDE_Aim = Inst11Quest3_Aim
Inst11Quest3_HORDE_Location = Inst11Quest3_Location
Inst11Quest3_HORDE_Note = Inst11Quest3_Note
Inst11Quest3_HORDE_Prequest = Inst11Quest3_Prequest
Inst11Quest3_HORDE_Folgequest = Inst11Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst11Quest4_HORDE = Inst11Quest4
Inst11Quest4_HORDE_Level = Inst11Quest4_Level
Inst11Quest4_HORDE_Attain = Inst11Quest4_Attain
Inst11Quest4_HORDE_Aim = Inst11Quest4_Aim
Inst11Quest4_HORDE_Location = Inst11Quest4_Location
Inst11Quest4_HORDE_Note = Inst11Quest4_Note
Inst11Quest4_HORDE_Prequest = Inst11Quest4_Prequest
Inst11Quest4_HORDE_Folgequest = Inst11Quest4_Folgequest
--
Inst11Quest4name1_HORDE = Inst11Quest4name1
Inst11Quest4name2_HORDE = Inst11Quest4name2
Inst11Quest4name3_HORDE = Inst11Quest4name3
Inst11Quest4name4_HORDE = Inst11Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst11Quest5_HORDE = Inst11Quest5
Inst11Quest5_HORDE_Level = Inst11Quest5_Level
Inst11Quest5_HORDE_Attain = Inst11Quest5_Attain
Inst11Quest5_HORDE_Aim = Inst11Quest5_Aim
Inst11Quest5_HORDE_Location = Inst11Quest5_Location
Inst11Quest5_HORDE_Note = Inst11Quest5_Note
Inst11Quest5_HORDE_Prequest = Inst11Quest5_Prequest
Inst11Quest5_HORDE_Folgequest = Inst11Quest5_Folgequest
--
Inst11Quest5name1_HORDE = Inst11Quest5name1
Inst11Quest5name2_HORDE = Inst11Quest5name2



--------------- INST12 - Dire Maul West (DM) ---------------

Inst12Story = "Построенный двенадцать тысяч лет назад тайной сектой волшебников ночных эльфов, древний город Эльдре'Талас использовали, чтобы защитить самые ценные секреты королевы Азшары. Несмотря на то, что он был уничтожен Великим Расколом мира, большая часть изумительного города еще существует как грандиозный Ужасный Кулак. Три самобытных района руин населили всевозможные твари - в основном призрачными высокорожденными, грязными сатирами и безмозглыми ограми. Только группа самых отважных искателей приключений может войти в разрушенный город и встретиться лицом к лицу с древним злом, заключенным в его древних подвалах."
Inst12Caption = "Забытый город (Запад)"
Inst12QAA = "17 Заданий"
Inst12QAH = "17 Заданий"

--Quest 1 Alliance
Inst12Quest1 = "1. Эльфийские легенды"
Inst12Quest1_Level = "60"
Inst12Quest1_Attain = "54"
Inst12Quest1_Aim = "Попытайтесь найти в Забытом Городе Кариэля Винтхалуса. Вернитесь в Крепость Оперенной Луны к школяру Рунному Шипу и сообщите ему все, что вам удалось узнать."
Inst12Quest1_Location = "Школяр Рунный Шип (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,43"..WHITE..")"
Inst12Quest1_Note = "Вы найдете Кариэля Винтхалуса в "..YELLOW.."Библиотека (Запад)"..WHITE.."."
Inst12Quest1_Prequest = "Нет"
Inst12Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst12Quest2 = "2. Древнее безумие"
Inst12Quest2_Level = "60"
Inst12Quest2_Attain = "56"
Inst12Quest2_Aim = "Перебейте стражей, которые охраняют 5 столпов, снабжающих энергией Тюрьму Бессмер'тера. После того, как столпы угаснут, силовое поле, удерживающее Бессмер'тера, рассеется.\nВойдите в Тюрьму Бессмер'тера и уничтожьте злого демона, который находится внутри. И, наконец, сразитесь с принцем Тортелдрином в Читальне."
Inst12Quest2_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1] (сверху)"..WHITE..")"
Inst12Quest2_Note = "Столпы помечены как "..BLUE.."[B]"..WHITE..". Бессмер'тер находится около "..YELLOW.."[6]"..WHITE..", Принц Тортелдрин находится около "..YELLOW.."[7]"..WHITE.."."
Inst12Quest2_Prequest = "Нет"
Inst12Quest2_Folgequest = "Сокровище Шен'дралар"
-- No Rewards for this quest

--Quest 3 Alliance
Inst12Quest3 = "3. Сокровище Шен'дралар"
Inst12Quest3_Level = "60"
Inst12Quest3_Attain = "56"
Inst12Quest3_Aim = "Вернитесь в Читальню и найдите сокровище Шен'дралар. Получите свою награду!"
Inst12Quest3_Location = "Прародительница Шен'дралар (Забытый город; "..YELLOW.."Запад, [1]"..WHITE..")"
Inst12Quest3_Note = "Вы найдете Сокровище под ступеньками "..YELLOW.."[7]"..WHITE.."."
Inst12Quest3_Prequest = "Древнее безумие"
Inst12Quest3_Folgequest = "Нет"
Inst12Quest3FQuest = "true"
--
Inst12Quest3name1 = "Sedge Boots"
Inst12Quest3name2 = "Backwood Helm"
Inst12Quest3name3 = "Bonecrusher"

--Quest 4 Alliance
Inst12Quest4 = "4. Ксоротианский конь погибели (Чернокнижник)"
Inst12Quest4_Level = "60"
Inst12Quest4_Attain = "60"
Inst12Quest4_Aim = "Прочтите инструкции Мор'зула. Призовите ксоротианского коня погибели, одолейте его и подчините его дух."
Inst12Quest4_Location = "Мор'зул Кровопуск (Пылающие степи; "..YELLOW.."12,31"..WHITE..")"
Inst12Quest4_Note = "Последнее задание в серии для получения эпического коня чернокнижника. Сначала нужно погасить все столпы, помеченные  "..BLUE.."[B]"..WHITE.." а затем убить Бессмер'тера около "..YELLOW.."[6]"..WHITE..". После этого вы сможете начать Ритуал Призыва. Удостоверьтесь что увас есть 20 Осколков Души а также Чернокнижник конкретно следящий за поддержанием Колокола, Свечи и Колеса.Стражников ужаса можно поработить. После выполнения, поговорите с Духом коня погибели."
Inst12Quest4_Prequest = "Доставка беса ("..YELLOW.."Некроситет"..WHITE..")"
Inst12Quest4_Folgequest = "Нет"
Inst12Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst12Quest5 = "5. Изумрудный сон (Друид)"
Inst12Quest5_Level = "60"
Inst12Quest5_Attain = "54"
Inst12Quest5_Aim = "Верните книгу законным владельцам."
Inst12Quest5_Location = "Изумрудный Сон (случайно падает со всех боссов в Забытом городе)"
Inst12Quest5_Note = "Награда для друидов. Отдайте книгу сказителю Явону около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest5_Prequest = "Нет"
Inst12Quest5_Folgequest = "Нет"
--
Inst12Quest5name1 = "Royal Seal of Eldre'Thalas"

--Quest 6 Alliance
Inst12Quest6 = "6. Величайшая гонка охотников (Охотник)"
Inst12Quest6_Level = "60"
Inst12Quest6_Attain = "54"
Inst12Quest6_Aim = "Верните книгу законным владельцам."
Inst12Quest6_Location = "Величайшая гонка охотников (случайно падает со всех боссов в Забытом городе)"
Inst12Quest6_Note = "Награда для Охотников. Отдайте книгу  Сказительнице Микос около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest6_Prequest = "Нет"
Inst12Quest6_Folgequest = "Нет"
--
Inst12Quest6name1 = "Royal Seal of Eldre'Thalas"

--Quest 7 Alliance
Inst12Quest7 = "7. Поваренная книга чародея (Маг)"
Inst12Quest7_Level = "60"
Inst12Quest7_Attain = "54"
Inst12Quest7_Aim = "Верните книгу законным владельцам."
Inst12Quest7_Location = "Поваренная книга чародея (случайно падает со всех боссов в Забытом городе)"
Inst12Quest7_Note = "Награда для Магов. Отдайте книгу сказителю Килдрату около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest7_Prequest = "Нет"
Inst12Quest7_Folgequest = "Нет"
--
Inst12Quest7name1 = "Royal Seal of Eldre'Thalas"

--Quest 8 Alliance
Inst12Quest8 = "8. Свет и как его раскачать (Паладин)"
Inst12Quest8_Level = "60"
Inst12Quest8_Attain = "54"
Inst12Quest8_Aim = "Верните книгу законным владельцам."
Inst12Quest8_Location = "Свет и как его раскачать (случайно падает со всех боссов в Забытом городе)"
Inst12Quest8_Note = "Награда для Паладинов. Отдайте книгу Сказительнице Микос около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest8_Prequest = "Нет"
Inst12Quest8_Folgequest = "Нет"
--
Inst12Quest8name1 = "Royal Seal of Eldre'Thalas"

--Quest 9 Alliance
Inst12Quest9 = "9. Святая Болонья: О чем не говорит Свет (Жрец)"
Inst12Quest9_Level = "60"
Inst12Quest9_Attain = "54"
Inst12Quest9_Aim = "Верните книгу законным владельцам."
Inst12Quest9_Location = "Святая Болонья: О чем не говорит Свет (случайно падает со всех боссов в Забытом городе)"
Inst12Quest9_Note = "Награда для Жрецов. Отдайте книгу сказителю Явону около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest9_Prequest = "Нет"
Inst12Quest9_Folgequest = "Нет"
--
Inst12Quest9name1 = "Royal Seal of Eldre'Thalas"

--Quest 10 Alliance
Inst12Quest10 = "10. Гарона: Исследование уловок и предательства (Разбойник)"
Inst12Quest10_Level = "60"
Inst12Quest10_Attain = "54"
Inst12Quest10_Aim = "Верните книгу законным владельцам."
Inst12Quest10_Location = "Гарона: Исследование уловок и предательства (случайно падает со всех боссов в Забытом городе)"
Inst12Quest10_Note = "Награда для Разбойников. Отдайте книгу сказителю Килдрату около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest10_Prequest = "Нет"
Inst12Quest10_Folgequest = "Нет"
--
Inst12Quest10name1 = "Royal Seal of Eldre'Thalas"

--Quest 11 Alliance
Inst12Quest11 = "11. Ледяной шок и вы (Шаман)"
Inst12Quest11_Level = "60"
Inst12Quest11_Attain = "54"
Inst12Quest11_Aim = "Верните книгу законным владельцам."
Inst12Quest11_Location = "Ледяной шок и вы (случайно падает со всех боссов в Забытом городе)"
Inst12Quest11_Note = "Задание Шамана. Отдайте книгу сказителю Явону около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest11_Prequest = "Нет"
Inst12Quest11_Folgequest = "Нет"
--
Inst12Quest11name1 = "Royal Seal of Eldre'Thalas"

--Quest 12 Alliance
Inst12Quest12 = "12. Укрощая тени (Чернокнижник)"
Inst12Quest12_Level = "60"
Inst12Quest12_Attain = "54"
Inst12Quest12_Aim = "Верните книгу законным владельцам."
Inst12Quest12_Location = "Укрощая тени (случайно падает со всех боссов в Забытом городе)"
Inst12Quest12_Note = "Задание для чернокнижников. Отдайте книгу  Сказительнице Микос около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest12_Prequest = "Нет"
Inst12Quest12_Folgequest = "Нет"
--
Inst12Quest12name1 = "Royal Seal of Eldre'Thalas"

--Quest 13 Alliance
Inst12Quest13 = "13. Кодекс Обороны (Воитель)"
Inst12Quest13_Level = "60"
Inst12Quest13_Attain = "54"
Inst12Quest13_Aim = "Верните книгу законным владельцам."
Inst12Quest13_Location = "Кодекс Обороны (случайно падает со всех боссов в Забытом городе)"
Inst12Quest13_Note = "Задание для Воителей. Отдайте книгу сказителю Килдрату около "..YELLOW.."1' Библиотека"..WHITE.."."
Inst12Quest13_Prequest = "Нет"
Inst12Quest13_Folgequest = "Нет"
--
Inst12Quest13name1 = "Royal Seal of Eldre'Thalas"

--Quest 14 Alliance
Inst12Quest14 = "14. Манускрипт Средоточия"
Inst12Quest14_Level = "60"
Inst12Quest14_Attain = "54"
Inst12Quest14_Aim = "Принесите сказителю Лидросу в Забытом Городе 'Манускрипт Средоточия', 1 безупречный черный алмаз, 4 больших сияющих осколка и 2 образца шкуры Тени, чтобы получить магический камень Сосредоточения."
Inst12Quest14_Location = "Сказитель Лидрос (Забытый город Запад; "..YELLOW.."[1'] Библиотека"..WHITE..")"
Inst12Quest14_Note = "Здесь нет предшествующего задания, но нужно выполнить задание Эльфийские легенды перед тем как начать это.\n\nМанускрипт падает случайно в Забытом городе и им можно торговать, поэтому его можно найти на Аукционе. Шкуры Тени персональны и выбиваются с некоторых боссов, Восставших созданий и Восставших костостражей в "..YELLOW.."Некроситет"..WHITE.."."
Inst12Quest14_Prequest = "Нет"
Inst12Quest14_Folgequest = "Нет"
--
Inst12Quest14name1 = "Arcanum of Focus"

--Quest 15 Alliance
Inst12Quest15 = "15. Манускрипт Защиты"
Inst12Quest15_Level = "60"
Inst12Quest15_Attain = "54"
Inst12Quest15_Aim = "Принесите сказителю Лидросу в Забытом Городе 'Манускрипт Защиты', 1 безупречный черный алмаз, 2 больших сияющих осколка и 1 потертый шовный материал поганища, чтобы получить магический камень Защиты."
Inst12Quest15_Location = "Сказитель Лидрос (Забытый город Запад; "..YELLOW.."[1'] Библиотека"..WHITE..")"
Inst12Quest15_Note = "Здесь нет предшествующего задания, но нужно выполнить задание Эльфийские легенды перед тем как начать это.\n\nМанускрипт падает случайно в Забытом городе и им можно торговать, поэтому его можно найти на Аукционе. Потертый шовный материал поганища персонален и выбивается с Рамштайна Ненасытного, Изрыгателей яда, Желчеплюев и Лоскутных ужасов в "..YELLOW.."Стратхоольм"..WHITE.."."
Inst12Quest15_Prequest = "Нет"
Inst12Quest15_Folgequest = "Нет"
--
Inst12Quest15name1 = "Arcanum of Protection"

--Quest 16 Alliance
Inst12Quest16 = "16. Манускрипт Скорости"
Inst12Quest16_Level = "60"
Inst12Quest16_Attain = "54"
Inst12Quest16_Aim = "Принесите сказителю Лидросу в Забытом Городе 'Манускрипт Скорости', 1 безупречный черный алмаз, 2 больших сияющих осколка и 2 образца крови героев, чтобы получить магический камень Стремительности."
Inst12Quest16_Location = "Сказитель Лидрос (Забытый город Запад; "..YELLOW.."[1'] Библиотека"..WHITE..")"
Inst12Quest16_Note = "Здесь нет предшествующего задания, но нужно выполнить задание Эльфийские легенды перед тем как начать это.\n\nМанускрипт падает случайно в Забытом городе и им можно торговать, поэтому его можно найти на Аукционе. Кровь героев персональна и выбивается на земле в различных местах Западного и Восточного Лихоземья."
Inst12Quest16_Prequest = "Нет"
Inst12Quest16_Folgequest = "Нет"
--
Inst12Quest16name1 = "Arcanum of Rapidity"

--Quest 17 Alliance
Inst12Quest17 = "17. Справочник Форора (Воитель, Паладин)"
Inst12Quest17_Level = "60"
Inst12Quest17_Attain = "60"
Inst12Quest17_Aim = "Верните 'Справочник Форора по убийству драконов' в Читальню."
Inst12Quest17_Location = "Справочник Форора по убийству драконов (случайно падает с боссов в "..YELLOW.."Забытый город"..WHITE..")"
Inst12Quest17_Note = "Задание для Воителей или Паладинов. Сдается сказителю Лидросу около (Забытый город Запад; "..YELLOW.."[1'] Библиотека"..WHITE.."). Выполнение позволяет Вам начать заданние на КельСеррар. После патча 3.2.2 нельзя взять эту цепочку заданий. Но если это задание у вас уже взято, вы сможете его закончить."
Inst12Quest17_Prequest = "Нет"
Inst12Quest17_Folgequest = "Ковка Кель-Серрара"
-- No Rewards for this quest


--Quest 1 Horde
Inst12Quest1_HORDE = "1. Эльфийские легенды"
Inst12Quest1_HORDE_Level = "60"
Inst12Quest1_HORDE_Attain = "54"
Inst12Quest1_HORDE_Aim = "Попытайтесь найти в Забытом Городе Кариэля Винтхалуса. Вернитесь в Лагерь Мохаче к ведуну Королуску и сообщите ему все, что вам удалось узнать."
Inst12Quest1_HORDE_Location = "Ведун Королуск (Фералас - Лагерь Мохаче; "..YELLOW.."74,43"..WHITE..")"
Inst12Quest1_HORDE_Note = "Вы найдете Кариэля Винтхалуса в "..YELLOW.."Библиотека (Запад)"..WHITE.."."
Inst12Quest1_HORDE_Prequest = "Нет"
Inst12Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst12Quest2_HORDE = Inst12Quest2
Inst12Quest2_HORDE_Level = Inst12Quest2_Level
Inst12Quest2_HORDE_Attain = Inst12Quest2_Attain
Inst12Quest2_HORDE_Aim = Inst12Quest2_Aim
Inst12Quest2_HORDE_Location = Inst12Quest2_Location
Inst12Quest2_HORDE_Note = Inst12Quest2_Note
Inst12Quest2_HORDE_Prequest = Inst12Quest2_Prequest
Inst12Quest2_HORDE_Folgequest = Inst12Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst12Quest3_HORDE = Inst12Quest3
Inst12Quest3_HORDE_Level = Inst12Quest3_Level
Inst12Quest3_HORDE_Attain = Inst12Quest3_Attain
Inst12Quest3_HORDE_Aim = Inst12Quest3_Aim
Inst12Quest3_HORDE_Location = Inst12Quest3_Location
Inst12Quest3_HORDE_Note = Inst12Quest3_Note
Inst12Quest3_HORDE_Prequest = Inst12Quest3_Prequest
Inst12Quest3_HORDE_Folgequest = Inst12Quest3_Folgequest
Inst12Quest3FQuest_HORDE = "true"
--
Inst12Quest3name1_HORDE = Inst12Quest3name1
Inst12Quest3name2_HORDE = Inst12Quest3name2
Inst12Quest3name3_HORDE = Inst12Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst12Quest4_HORDE = Inst12Quest4
Inst12Quest4_HORDE_Level = Inst12Quest4_Level
Inst12Quest4_HORDE_Attain = Inst12Quest4_Attain
Inst12Quest4_HORDE_Aim = Inst12Quest4_Aim
Inst12Quest4_HORDE_Location = Inst12Quest4_Location
Inst12Quest4_HORDE_Note = Inst12Quest4_Note
Inst12Quest4_HORDE_Prequest = Inst12Quest4_Prequest
Inst12Quest4_HORDE_Folgequest = Inst12Quest4_Folgequest
Inst12Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst12Quest5_HORDE = Inst12Quest5
Inst12Quest5_HORDE_Level = Inst12Quest5_Level
Inst12Quest5_HORDE_Attain = Inst12Quest5_Attain
Inst12Quest5_HORDE_Aim = Inst12Quest5_Aim
Inst12Quest5_HORDE_Location = Inst12Quest5_Location
Inst12Quest5_HORDE_Note = Inst12Quest5_Note
Inst12Quest5_HORDE_Prequest = Inst12Quest5_Prequest
Inst12Quest5_HORDE_Folgequest = Inst12Quest5_Folgequest
--
Inst12Quest5name1_HORDE = Inst12Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst12Quest6_HORDE = Inst12Quest6
Inst12Quest6_HORDE_Level = Inst12Quest6_Level
Inst12Quest6_HORDE_Attain = Inst12Quest6_Attain
Inst12Quest6_HORDE_Aim = Inst12Quest6_Aim
Inst12Quest6_HORDE_Location = Inst12Quest6_Location
Inst12Quest6_HORDE_Note = Inst12Quest6_Note
Inst12Quest6_HORDE_Prequest = Inst12Quest6_Prequest
Inst12Quest6_HORDE_Folgequest = Inst12Quest6_Folgequest
--
Inst12Quest6name1_HORDE = Inst12Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst12Quest7_HORDE = Inst12Quest7
Inst12Quest7_HORDE_Level = Inst12Quest7_Level
Inst12Quest7_HORDE_Attain = Inst12Quest7_Attain
Inst12Quest7_HORDE_Aim = Inst12Quest7_Aim
Inst12Quest7_HORDE_Location = Inst12Quest7_Location
Inst12Quest7_HORDE_Note = Inst12Quest7_Note
Inst12Quest7_HORDE_Prequest = Inst12Quest7_Prequest
Inst12Quest7_HORDE_Folgequest = Inst12Quest7_Folgequest
--
Inst12Quest7name1_HORDE = Inst12Quest7name1

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst12Quest8_HORDE = Inst12Quest8
Inst12Quest8_HORDE_Level = Inst12Quest8_Level
Inst12Quest8_HORDE_Attain = Inst12Quest8_Attain
Inst12Quest8_HORDE_Aim = Inst12Quest8_Aim
Inst12Quest8_HORDE_Location = Inst12Quest8_Location
Inst12Quest8_HORDE_Note = Inst12Quest8_Note
Inst12Quest8_HORDE_Prequest = Inst12Quest8_Prequest
Inst12Quest8_HORDE_Folgequest = Inst12Quest8_Folgequest
--
Inst12Quest8name1_HORDE = Inst12Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst12Quest9_HORDE = Inst12Quest9
Inst12Quest9_HORDE_Level = Inst12Quest9_Level
Inst12Quest9_HORDE_Attain = Inst12Quest9_Attain
Inst12Quest9_HORDE_Aim = Inst12Quest9_Aim
Inst12Quest9_HORDE_Location = Inst12Quest9_Location
Inst12Quest9_HORDE_Note = Inst12Quest9_Note
Inst12Quest9_HORDE_Prequest = Inst12Quest9_Prequest
Inst12Quest9_HORDE_Folgequest = Inst12Quest9_Folgequest
--
Inst12Quest9name1_HORDE = Inst12Quest9name1

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst12Quest10_HORDE = Inst12Quest10
Inst12Quest10_HORDE_Level = Inst12Quest10_Level
Inst12Quest10_HORDE_Attain = Inst12Quest10_Attain
Inst12Quest10_HORDE_Aim = Inst12Quest10_Aim
Inst12Quest10_HORDE_Location = Inst12Quest10_Location
Inst12Quest10_HORDE_Note = Inst12Quest10_Note
Inst12Quest10_HORDE_Prequest = Inst12Quest10_Prequest
Inst12Quest10_HORDE_Folgequest = Inst12Quest10_Folgequest
--
Inst12Quest10name1_HORDE = Inst12Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst12Quest11_HORDE = Inst12Quest11
Inst12Quest11_HORDE_Level = Inst12Quest11_Level
Inst12Quest11_HORDE_Attain = Inst12Quest11_Attain
Inst12Quest11_HORDE_Aim = Inst12Quest11_Aim
Inst12Quest11_HORDE_Location = Inst12Quest11_Location
Inst12Quest11_HORDE_Note = Inst12Quest11_Note
Inst12Quest11_HORDE_Prequest = Inst12Quest11_Prequest
Inst12Quest11_HORDE_Folgequest = Inst12Quest11_Folgequest
--
Inst12Quest11name1_HORDE = Inst12Quest11name1

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst12Quest12_HORDE = Inst12Quest12
Inst12Quest12_HORDE_Level = Inst12Quest12_Level
Inst12Quest12_HORDE_Attain = Inst12Quest12_Attain
Inst12Quest12_HORDE_Aim = Inst12Quest12_Aim
Inst12Quest12_HORDE_Location = Inst12Quest12_Location
Inst12Quest12_HORDE_Note = Inst12Quest12_Note
Inst12Quest12_HORDE_Prequest = Inst12Quest12_Prequest
Inst12Quest12_HORDE_Folgequest = Inst12Quest12_Folgequest
--
Inst12Quest12name1_HORDE = Inst12Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst12Quest13_HORDE = Inst12Quest13
Inst12Quest13_HORDE_Level = Inst12Quest13_Level
Inst12Quest13_HORDE_Attain = Inst12Quest13_Attain
Inst12Quest13_HORDE_Aim = Inst12Quest13_Aim
Inst12Quest13_HORDE_Location = Inst12Quest13_Location
Inst12Quest13_HORDE_Note = Inst12Quest13_Note
Inst12Quest13_HORDE_Prequest = Inst12Quest13_Prequest
Inst12Quest13_HORDE_Folgequest = Inst12Quest13_Folgequest
--
Inst12Quest13name1_HORDE = Inst12Quest13name1

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst12Quest14_HORDE = Inst12Quest14
Inst12Quest14_HORDE_Level = Inst12Quest14_Level
Inst12Quest14_HORDE_Attain = Inst12Quest14_Attain
Inst12Quest14_HORDE_Aim = Inst12Quest14_Aim
Inst12Quest14_HORDE_Location = Inst12Quest14_Location
Inst12Quest14_HORDE_Note = Inst12Quest14_Note
Inst12Quest14_HORDE_Prequest = Inst12Quest14_Prequest
Inst12Quest14_HORDE_Folgequest = Inst12Quest14_Folgequest
--
Inst12Quest14name1_HORDE = Inst12Quest14name1

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst12Quest15_HORDE = Inst12Quest15
Inst12Quest15_HORDE_Level = Inst12Quest15_Level
Inst12Quest15_HORDE_Attain = Inst12Quest15_Attain
Inst12Quest15_HORDE_Aim = Inst12Quest15_Aim
Inst12Quest15_HORDE_Location = Inst12Quest15_Location
Inst12Quest15_HORDE_Note = Inst12Quest15_Note
Inst12Quest15_HORDE_Prequest = Inst12Quest15_Prequest
Inst12Quest15_HORDE_Folgequest = Inst12Quest15_Folgequest
--
Inst12Quest15name1_HORDE = Inst12Quest15name1

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst12Quest16_HORDE = Inst12Quest16
Inst12Quest16_HORDE_Level = Inst12Quest16_Level
Inst12Quest16_HORDE_Attain = Inst12Quest16_Attain
Inst12Quest16_HORDE_Aim = Inst12Quest16_Aim
Inst12Quest16_HORDE_Location = Inst12Quest16_Location
Inst12Quest16_HORDE_Note = Inst12Quest16_Note
Inst12Quest16_HORDE_Prequest = Inst12Quest16_Prequest
Inst12Quest16_HORDE_Folgequest = Inst12Quest16_Folgequest
--
Inst12Quest16name1_HORDE = Inst12Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst12Quest17_HORDE = Inst12Quest17
Inst12Quest17_HORDE_Level = Inst12Quest17_Level
Inst12Quest17_HORDE_Attain = Inst12Quest17_Attain
Inst12Quest17_HORDE_Aim = Inst12Quest17_Aim
Inst12Quest17_HORDE_Location = Inst12Quest17_Location
Inst12Quest17_HORDE_Note = Inst12Quest17_Note
Inst12Quest17_HORDE_Prequest = Inst12Quest17_Prequest
Inst12Quest17_HORDE_Folgequest = Inst12Quest17_Folgequest
-- No Rewards for this quest



--------------- INST13 - Maraudon (Mara) ---------------

Inst13Story = "Защищаемый свирепыми мародонскими кентаврами, Мародон является одим из самых священных мест в Пустошах. Великий храм-пещера служит местом последнего упокоения Зейтара, одного из двух бессмертных сыновей полубога Кенариуса. Легенда гласит, что Зейтар и принцесса духов стихии земли, Терадрас,  зачали незаконорожденную расу кентавров. Она также рассказывает о том, что появившись на свет, варвары-кентавры восстали против своего отца и убили его. Кое-кто верит, что Терадрас, полная скорби, заточила дух Зейтара в извилистых пещерах - используя его энергию для злых целей. Подземные тоннели, населенные злобными призраками давно умерших Ханов кентавров, а также яростными духами стихии, слугами Терадрас."
Inst13Caption = "Мародон"
Inst13QAA = "8 Заданий"
Inst13QAH = "8 Заданий"

--Quest 1 Alliance
Inst13Quest1 = "1. Фрагменты осколка сумрака"
Inst13Quest1_Level = "42"
Inst13Quest1_Attain = "39"
Inst13Quest1_Aim = "Соберите в Мародоне 10 фрагментов осколков сумрака и отнесите их верховному магу Тервошу в Терамор на побережье Пылевых топей."
Inst13Quest1_Location = "Верховный маг Тервош (Пылевые топи - Остров Терамор; "..YELLOW.."66,49"..WHITE..")"
Inst13Quest1_Note = "Вы получите фрагменты осколка сумрака с 'Темнокаменных грохотунов' или 'Темнокаменных крушителей' снаружи подземелья на Фиолетовой стороне."
Inst13Quest1_Prequest = "Нет"
Inst13Quest1_Folgequest = "Нет"
--
Inst13Quest1name1 = "Zealous Shadowshard Pendant"
Inst13Quest1name2 = "Prodigious Shadowshard Pendant"

--Quest 2 Alliance
Inst13Quest2 = "2. Скверна Злоязыкого"
Inst13Quest2_Level = "47"
Inst13Quest2_Attain = "41"
Inst13Quest2_Aim = "Наполните церуленовый фиал с покрытием в оранжевом пруду Мародона.\nПолейте гнусь-лозу из полного церуленового фиала, выгнав ядовитую лозу.\nИсцелите 8 растений, убивая ядовитые лозы, и вернитесь к Талендрии из Высоты Найджела."
Inst13Quest2_Location = "Талендрия (Пустоши - Высота Найджела; "..YELLOW.."68,8"..WHITE..")"
Inst13Quest2_Note = "Вы можете наполнить фиал в любом бассейне снаружи подземелья на Оранжевой стороне. Растения находятся в фиолетовой и оранжевой зонах внутри подземелья."
Inst13Quest2_Prequest = "Нет"
Inst13Quest2_Folgequest = "Нет"
--
Inst13Quest2name1 = "Woodseed Hoop"
Inst13Quest2name2 = "Sagebrush Girdle"
Inst13Quest2name3 = "Branchclaw Gauntlets"

--Quest 3 Alliance
Inst13Quest3 = "3. Хрустальные орнаменты"
Inst13Quest3_Level = "47"
Inst13Quest3_Attain = "41"
Inst13Quest3_Aim = "Соберите 15 терадрических хрустальных орнаментов для Ивы из Пустошей."
Inst13Quest3_Location = "Ива (Пустоши; "..YELLOW.."62,39"..WHITE..")"
Inst13Quest3_Note = "С большинства существ в Мародоне падают орнаменты."
Inst13Quest3_Prequest = "Нет"
Inst13Quest3_Folgequest = "Нет"
--
Inst13Quest3name1 = "Acumen Robes"
Inst13Quest3name2 = "Sprightring Helm"
Inst13Quest3name3 = "Relentless Chain"
Inst13Quest3name4 = "Hulkstone Pauldrons"

--Quest 4 Alliance
Inst13Quest4 = "4. Инструкции кентавра-парии"
Inst13Quest4_Level = "48"
Inst13Quest4_Attain = "39"
Inst13Quest4_Aim = "Прочтите инструкции кентавра-парии, добудьте из Мародона амулет Соединения и верните его кентавру-парии из южной части Пустошей."
Inst13Quest4_Location = "Кентавр-пария (Пустоши; "..YELLOW.."45,86"..WHITE..")"
Inst13Quest4_Note = "5 Ханов (Описание для инструкций парии)"
Inst13Quest4_Page = {2, "Вы найдете кентавра-парию в южных Пустошах. Он бродит между "..YELLOW.."44,85"..WHITE.." и "..YELLOW.."50,87"..WHITE..".\nСначала, Вам нужно убить Безымянного пророка ("..YELLOW.."[A] на карте входа"..WHITE.."). Вы найдете его перед тем, как войти в подземелье, перед точкой, где придется выбрать идти к Оранжевому или Фиолетовому входу. После него нужно убить 5 ханов. Вы анйдете первого,если пойдете посредине около ("..YELLOW.."[1] на карте входа"..WHITE.."). Второй - в Фиолетовой части Мародона, но перед входом в подземелье ("..YELLOW.."[2] на карте входа"..WHITE.."). Третий находится на Оранжевой стороне перед подземельем ("..YELLOW.."[3] на карте входа"..WHITE.."). Четвертый около "..YELLOW.."[4]"..WHITE.." и пйтый около  "..YELLOW.."[1]"..WHITE..".", };
Inst13Quest4_Prequest = "Нет"
Inst13Quest4_Folgequest = "Нет"
--
Inst13Quest4name1 = "Mark of the Chosen"

--Quest 5 Alliance
Inst13Quest5 = "5. Легенды Мародона"
Inst13Quest5_Level = "49"
Inst13Quest5_Attain = "41"
Inst13Quest5_Aim = "Добудьте две части скипетра Келебраса – жезл Келебраса и бриллиант Келебраса.\nНайдите способ поговорить с Келебрасом."
Inst13Quest5_Location = "Кавиндра (Пустоши - Мародон; "..YELLOW.."[4] на карте входа"..WHITE..")"
Inst13Quest5_Note = "Вы найдете Кавиндру в начале Оранжевой части перед подземельем.\nВы получите Келебрийский жезл с Ноксиона около "..YELLOW.."[2]"..WHITE..", а Келебрийский бриллиант с Лорда Злоязыкого  "..YELLOW.."[5]"..WHITE..". Келебрас находится около "..YELLOW.."[7]"..WHITE..". Вы должны победить его, чтобы поговорить."
Inst13Quest5_Prequest = "Нет"
Inst13Quest5_Folgequest = "Скипетр Келебраса"
-- No Rewards for this quest

--Quest 6 Alliance
Inst13Quest6 = "6. Скипетр Келебраса"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "41"
Inst13Quest6_Aim = "Помогите Селебрасу Искупленному воссоздать скипетр Селебраса.\nПо завершении ритуала снова обратитесь к нему."
Inst13Quest6_Location = "Селебрас Искупленный (Мародон; "..YELLOW.."[7]"..WHITE..")"
Inst13Quest6_Note = "Келебрас создает Скипетр. Поговорите с ним, когда он закончит."
Inst13Quest6_Prequest = "Легенды Мародона"
Inst13Quest6_Folgequest = "Нет"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "Scepter of Celebras"

--Quest 7 Alliance
Inst13Quest7 = "7. Яблочко от яблоньки..."
Inst13Quest7_Level = "51"
Inst13Quest7_Attain = "45"
Inst13Quest7_Aim = "Убейте принцессу Терадрас и вернитесь к хранителю Марандису на Высоту Найджела в Пустоши."
Inst13Quest7_Location = "Хранитель Марандис (Пустоши - Высота Найджела; "..YELLOW.."63,10"..WHITE..")"
Inst13Quest7_Note = "Вы найдете принцессу Терадрас около "..YELLOW.."[11]"..WHITE.."."
Inst13Quest7_Prequest = "Нет"
Inst13Quest7_Folgequest = "Семя Жизни"
--
Inst13Quest7name1 = "Thrash Blade"
Inst13Quest7name2 = "Resurgence Rod"
Inst13Quest7name3 = "Verdant Keeper's Aim"

--Quest 8 Alliance
Inst13Quest8 = "8. Семя Жизни"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "39"
Inst13Quest8_Aim = "Найдите в Лунной поляне Ремулоса и отдайте ему Семя Жизни."
Inst13Quest8_Location = "Дух Зейтара (Мародон; "..YELLOW.."[11]"..WHITE..")"
Inst13Quest8_Note = "Дух Зейтара появляется после убийства принцессы Терадрас "..YELLOW.."[11]"..WHITE..". Вы найдете хранителя Ремулоса около (Лунная поляна - Святилище Ремулоса; "..YELLOW.."36,41"..WHITE..")."
Inst13Quest8_Prequest = "Яблочко от яблоньки..."
Inst13Quest8_Folgequest = "Нет"
Inst13Quest8FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst13Quest1_HORDE = "1. Фрагменты осколка сумрака"
Inst13Quest1_HORDE_Level = "42"
Inst13Quest1_HORDE_Attain = "39"
Inst13Quest1_HORDE_Aim = "Соберите в Мародоне 10 фрагментов осколков сумрака и отнесите их Утель'наю в Оргриммар."
Inst13Quest1_HORDE_Location = "Утель'най (Оргриммар - Аллея духов; "..YELLOW.."39,86"..WHITE..")"
Inst13Quest1_HORDE_Note = "Вы получите фрагменты осколка сумрака с 'Темнокаменных грохотунов' или 'Темнокаменных крушителей' снаружи подземелья на Фиолетовой стороне."
Inst13Quest1_HORDE_Prequest = "Нет"
Inst13Quest1_HORDE_Folgequest = "Нет"
--
Inst13Quest1name1_HORDE = "Zealous Shadowshard Pendant"
Inst13Quest1name2_HORDE = "Prodigious Shadowshard Pendant"

--Quest 2 Horde
Inst13Quest2_HORDE = "2. Скверна Злоязыкого"
Inst13Quest2_HORDE_Level = "47"
Inst13Quest2_HORDE_Attain = "41"
Inst13Quest2_HORDE_Aim = "Наполните церуленовый фиал с покрытием в оранжевом пруду Мародона.\nПолейте гнусь-лозу из полного церуленового фиала, выгнав ядовитую лозу.\nИсцелите 8 растений, убивая ядовитые лозы, и вернитесь к Варку Боевому Шраму в Деревню Ночных Охотников."
Inst13Quest2_HORDE_Location = "Варк Боевой Шрам (Пустоши - Деревня Ночных охотников; "..YELLOW.."23,70"..WHITE..")"
Inst13Quest2_HORDE_Note = "Вы можете наполнить фиал в любом бассейне снаружи подземелья на Оранжевой стороне. Растения находятся в фиолетовой и оранжевой зонах внутри подземелья."
Inst13Quest2_HORDE_Prequest = "Нет"
Inst13Quest2_HORDE_Folgequest = "Нет"
--
Inst13Quest2name1_HORDE = "Woodseed Hoop"
Inst13Quest2name2_HORDE = "Sagebrush Girdle"
Inst13Quest2name3_HORDE = "Branchclaw Gauntlets"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst13Quest3_HORDE = Inst13Quest3
Inst13Quest3_HORDE_Level = Inst13Quest3_Level
Inst13Quest3_HORDE_Attain = Inst13Quest3_Attain
Inst13Quest3_HORDE_Aim = Inst13Quest3_Aim
Inst13Quest3_HORDE_Location = Inst13Quest3_Location
Inst13Quest3_HORDE_Note = Inst13Quest3_Note
Inst13Quest3_HORDE_Prequest = Inst13Quest3_Prequest
Inst13Quest3_HORDE_Folgequest = Inst13Quest3_Folgequest
--
Inst13Quest3name1_HORDE = Inst13Quest3name1
Inst13Quest3name2_HORDE = Inst13Quest3name2
Inst13Quest3name3_HORDE = Inst13Quest3name3
Inst13Quest3name4_HORDE = Inst13Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst13Quest4_HORDE = Inst13Quest4
Inst13Quest4_HORDE_Level = Inst13Quest4_Level
Inst13Quest4_HORDE_Attain = Inst13Quest4_Attain
Inst13Quest4_HORDE_Aim = Inst13Quest4_Aim
Inst13Quest4_HORDE_Location = Inst13Quest4_Location
Inst13Quest4_HORDE_Note = Inst13Quest4_Note
Inst13Quest4_HORDE_Page = Inst13Quest4_Page
Inst13Quest4_HORDE_Prequest = Inst13Quest4_Prequest
Inst13Quest4_HORDE_Folgequest = Inst13Quest4_Folgequest
--
Inst13Quest4name1_HORDE = Inst13Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst13Quest5_HORDE = Inst13Quest5
Inst13Quest5_HORDE_Level = Inst13Quest5_Level
Inst13Quest5_HORDE_Attain = Inst13Quest5_Attain
Inst13Quest5_HORDE_Aim = Inst13Quest5_Aim
Inst13Quest5_HORDE_Location = Inst13Quest5_Location
Inst13Quest5_HORDE_Note = Inst13Quest5_Note
Inst13Quest5_HORDE_Prequest = Inst13Quest5_Prequest
Inst13Quest5_HORDE_Folgequest = Inst13Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst13Quest6_HORDE = Inst13Quest6
Inst13Quest6_HORDE_Level = Inst13Quest6_Level
Inst13Quest6_HORDE_Attain = Inst13Quest6_Attain
Inst13Quest6_HORDE_Aim = Inst13Quest6_Aim
Inst13Quest6_HORDE_Location = Inst13Quest6_Location
Inst13Quest6_HORDE_Note = Inst13Quest6_Note
Inst13Quest6_HORDE_Prequest = Inst13Quest6_Prequest
Inst13Quest6_HORDE_Folgequest = Inst13Quest6_Folgequest
Inst13Quest6FQuest_HORDE = Inst13Quest6FQuest
--
Inst13Quest6name1_HORDE = Inst13Quest6name1

--Quest 7 Horde
Inst13Quest7_HORDE = "7. Яблочко от яблоньки..."
Inst13Quest7_HORDE_Level = "51"
Inst13Quest7_HORDE_Attain = "45"
Inst13Quest7_HORDE_Aim = "Убейте принцессу Терадрас и вернитесь к Селендре неподалеку от Деревни Ночных Охотников в Пустошах."
Inst13Quest7_HORDE_Location = "Селендра (Пустоши; "..YELLOW.."27,77"..WHITE..")"
Inst13Quest7_HORDE_Note = "Вы найдете принцессу Терадрас около "..YELLOW.."[11]"..WHITE.."."
Inst13Quest7_HORDE_Prequest = "Нет"
Inst13Quest7_HORDE_Folgequest = "Семя Жизни"
--
Inst13Quest7name1_HORDE = "Thrash Blade"
Inst13Quest7name2_HORDE = "Resurgence Rod"
Inst13Quest7name3_HORDE = "Verdant Keeper's Aim"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst13Quest8_HORDE = Inst13Quest8
Inst13Quest8_HORDE_Level = Inst13Quest8_Level
Inst13Quest8_HORDE_Attain = Inst13Quest8_Attain
Inst13Quest8_HORDE_Aim = Inst13Quest8_Aim
Inst13Quest8_HORDE_Location = Inst13Quest8_Location
Inst13Quest8_HORDE_Note = Inst13Quest8_Note
Inst13Quest8_HORDE_Prequest = Inst13Quest8_Prequest
Inst13Quest8_HORDE_Folgequest = Inst13Quest8_Folgequest
Inst13Quest8FQuest_HORDE = Inst13Quest8FQuest
-- No Rewards for this quest



--------------- INST14 - Molten Core (MC) ---------------

Inst14Story = "The Molten Core lies at the very bottom of Blackrock Depths. It is the heart of Черная гора and the exact spot where, long ago in a desperate bid to turn the tide of the dwarven civil war, Emperor Thaurissan summoned the elemental Firelord, Ragnaros, into the world. Though the fire lord находится вcapable of straying far from the blazing Core, it is believed that his elemental minions command the Dark Iron dwarves, who are in the midst of creating armies out of living stone. The burning lake where Ragnaros lies sleeping acts as a rift connecting to the plane of fire, allowing the malicious elementals to pass through. Chief among Ragnaros' agents is Majordomo Executus - for this cunning elemental is the only one capable of calling the Firelord from his slumber."
Inst14Caption = "Огненные Недра"
Inst14QAA = "6 Заданий"
Inst14QAH = "6 Заданий"

--Quest 1 Alliance
Inst14Quest1 = "1. Огненные Недра"
Inst14Quest1_Level = "60"
Inst14Quest1_Attain = "58"
Inst14Quest1_Aim = "Убейте 1 Повелителя огня, 1 лавового гиганта, 1 древнюю гончую бездны и 1 лавового волноплеска и возвращайтесь к герцогу Гидраксису в Азшару."
Inst14Quest1_Location = "Герцог Гидраксис (Азшара; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest1_Note = "Это не-боссы в Расплавленных недрах.\n\nПосле патча 3.0.8 нельзя взять эту цепочку заданий. Но если это задание у вас уже взято, вы сможете его закончить."
Inst14Quest1_Prequest = "Око Углеглаза ("..YELLOW.."Верхний ярус Вершины Черной горы"..WHITE..")"
Inst14Quest1_Folgequest = "Агент Гидраксиса"
Inst14Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst14Quest2 = "2. Руки врага"
Inst14Quest2_Level = "60"
Inst14Quest2_Attain = "55"
Inst14Quest2_Aim = "Принесите руки Люцифрона, Сульфурона, Гееннаса и Шаззраха герцогу Гидраксису в Азшару."
Inst14Quest2_Location = "Герцог Гидраксис (Азшара; "..YELLOW.."79,73"..WHITE..")"
Inst14Quest2_Note = "Люцифрон находится около "..YELLOW.."[1]"..WHITE..", Сульфурон около "..YELLOW.."[8]"..WHITE..", Гееннас около "..YELLOW.."[3]"..WHITE.." и Шаззрах около "..YELLOW.."[5]"..WHITE..". Награда написана в задании 'Награда для героя'./nПосле патча 3.0.8, Вы больше не сможете начать эту цепочку заданий, но если вы уже имеете это задание, Вы сможете его завершить."
Inst14Quest2_Prequest = "Око Углеглаза -> Агент Гидраксиса"
Inst14Quest2_Folgequest = "Награда для героя"
Inst14Quest2FQuest = "true"
--
Inst14Quest2name1 = "Ocean's Breeze"
Inst14Quest2name2 = "Tidal Loop"

--Quest 3 Alliance
Inst14Quest3 = "3. Громораан Ветроносец"
Inst14Quest3_Level = "60"
Inst14Quest3_Attain = "60"
Inst14Quest3_Aim = "Чтобы освободить Громораана Ветроносца из тюрьмы, отнесите правый и левый наручник Ветроносца, 10 слитков элементия и сущность Повелителя огня верховному лорду Демитриану."
Inst14Quest3_Location = "Верховный лорд Демитриан (Силитус; "..YELLOW.."22,9"..WHITE..")"
Inst14Quest3_Note = "Часть цепочки заданий на Громовую Ярость, благословленный клинок Искателя Ветра. Начинается после обретения Левой, либо правой части Наручников Ветроносца с Гарра "..YELLOW.."[4]"..WHITE.." или барона Геддона около "..YELLOW.."[6]"..WHITE..". Затем поговорите с верховным лордом Демитрианом, чтобы начать цепочку. Сущность Повелителя огня падает с Рагнароса около "..YELLOW.."[10]"..WHITE..". После сдачи задания, появляется принц Громораан и Вам нужно убить его. Он - рейд-босс для рейда из 40 игроков."
Inst14Quest3_Prequest = "Сосуд Возрождения"
Inst14Quest3_Folgequest = "Громовая ярость"
Inst14Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst14Quest4 = "4. Заключение договора"
Inst14Quest4_Level = "60"
Inst14Quest4_Attain = "60"
Inst14Quest4_Aim = "Подпишите договор с представителем братства Тория Локтосом Недобрым Торговцем, если вам нужен чертеж сульфуронского молота."
Inst14Quest4_Location = "Локтос Недобрый торговец (Глубины Черной горы; "..YELLOW.."[15]"..WHITE..")"
Inst14Quest4_Note = "Нужно иметь при себе Сульфуронский слиток, чтобы подписать контракт с Локтосом. Они падают с Магов-лордов из клана Гордок в Огненных недрах около "..YELLOW.."[7]"..WHITE.."."
Inst14Quest4_Prequest = "Нет"
Inst14Quest4_Folgequest = "Нет"
--
Inst14Quest4name1 = "Plans: Sulfuron Hammer"

--Quest 5 Alliance
Inst14Quest5 = "5. Древний лист"
Inst14Quest5_Level = "60"
Inst14Quest5_Attain = "60"
Inst14Quest5_Aim = "Найдите хозяина древнего окаменелого древесного листа."
Inst14Quest5_Location = "Древний окаменелый древесный лист (Можно найти в тайнике повелителя огня; "..YELLOW.."[9]"..WHITE..")"
Inst14Quest5_Note = "Отдайте Вартусу Древнему в (Оскверненный лес - Железнолесье; "..YELLOW.."49,24"..WHITE..")."
Inst14Quest5_Prequest = "Нет"
Inst14Quest5_Folgequest = "Лист ходячего Древа, сшитый жилами ("..YELLOW.."Азурегос"..WHITE..")"
-- No Rewards for this quest

--Quest 6 Alliance
Inst14Quest6 = "6. Гадальные очки? Без проблем!"
Inst14Quest6_Level = "60"
Inst14Quest6_Attain = "60"
Inst14Quest6_Aim = "Найдите гадальные очки Нарайна и отнесите их Нарайну Причуденю в Танарис."
Inst14Quest6_Location = "Не вызывающий подозрений сундук (Серебряный бор - Greymane Wall; "..YELLOW.."46.2, 86.6"..WHITE..")"
Inst14Quest6_Note = "Начиная с патча 3.0.2, очки не падают с монстров в Огненных недрах. Задание сдается Нарайну Причуденю (Танарис; "..YELLOW.."65.3, 18.6"..WHITE..")."
Inst14Quest6_Prequest = "Тушеный Лис, БЛД"
Inst14Quest6_Folgequest = "Нет"
Inst14Quest6PreQuest = "true"
--
Inst14Quest6name1 = "Major Rejuvenation Potion"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst14Quest1_HORDE = Inst14Quest1
Inst14Quest1_HORDE_Level = Inst14Quest1_Level
Inst14Quest1_HORDE_Attain = Inst14Quest1_Attain
Inst14Quest1_HORDE_Aim = Inst14Quest1_Aim
Inst14Quest1_HORDE_Location = Inst14Quest1_Location
Inst14Quest1_HORDE_Note = Inst14Quest1_Note
Inst14Quest1_HORDE_Prequest = Inst14Quest1_Prequest
Inst14Quest1_HORDE_Folgequest = Inst14Quest1_Folgequest
Inst14Quest1PreQuest_HORDE = Inst14Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst14Quest2_HORDE = Inst14Quest2
Inst14Quest2_HORDE_Level = Inst14Quest2_Level
Inst14Quest2_HORDE_Attain = Inst14Quest2_Attain
Inst14Quest2_HORDE_Aim = Inst14Quest2_Aim
Inst14Quest2_HORDE_Location = Inst14Quest2_Location
Inst14Quest2_HORDE_Note = Inst14Quest2_Note
Inst14Quest2_HORDE_Prequest = Inst14Quest2_Prequest
Inst14Quest2_HORDE_Folgequest = Inst14Quest2_Folgequest
Inst14Quest2FQuest_HORDE = Inst14Quest2FQuest
--
Inst14Quest2name1_HORDE = Inst14Quest2name1
Inst14Quest2name2_HORDE = Inst14Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst14Quest3_HORDE = Inst14Quest3
Inst14Quest3_HORDE_Level = Inst14Quest3_Level
Inst14Quest3_HORDE_Attain = Inst14Quest3_Attain
Inst14Quest3_HORDE_Aim = Inst14Quest3_Aim
Inst14Quest3_HORDE_Location = Inst14Quest3_Location
Inst14Quest3_HORDE_Note = Inst14Quest3_Note
Inst14Quest3_HORDE_Prequest = Inst14Quest3_Prequest
Inst14Quest3_HORDE_Folgequest = Inst14Quest3_Folgequest
Inst14Quest3PreQuest_HORDE = Inst14Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst14Quest4_HORDE = Inst14Quest4
Inst14Quest4_HORDE_Level = Inst14Quest4_Level
Inst14Quest4_HORDE_Attain = Inst14Quest4_Attain
Inst14Quest4_HORDE_Aim = Inst14Quest4_Aim
Inst14Quest4_HORDE_Location = Inst14Quest4_Location
Inst14Quest4_HORDE_Note = Inst14Quest4_Note
Inst14Quest4_HORDE_Prequest = Inst14Quest4_Prequest
Inst14Quest4_HORDE_Folgequest = Inst14Quest4_Folgequest
--
Inst14Quest4name1_HORDE = Inst14Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst14Quest5_HORDE = Inst14Quest5
Inst14Quest5_HORDE_Level = Inst14Quest5_Level
Inst14Quest5_HORDE_Attain = Inst14Quest5_Attain
Inst14Quest5_HORDE_Aim = Inst14Quest5_Aim
Inst14Quest5_HORDE_Location = Inst14Quest5_Location
Inst14Quest5_HORDE_Note = Inst14Quest5_Note
Inst14Quest5_HORDE_Prequest = Inst14Quest5_Prequest
Inst14Quest5_HORDE_Folgequest = Inst14Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst14Quest6_HORDE = Inst14Quest6
Inst14Quest6_HORDE_Level = Inst14Quest6_Level
Inst14Quest6_HORDE_Attain = Inst14Quest6_Attain
Inst14Quest6_HORDE_Aim = Inst14Quest6_Aim
Inst14Quest6_HORDE_Location = Inst14Quest6_Location
Inst14Quest6_HORDE_Note = Inst14Quest6_Note
Inst14Quest6_HORDE_Prequest = Inst14Quest6_Prequest
Inst14Quest6_HORDE_Folgequest = Inst14Quest6_Folgequest
Inst14Quest3PreQuest_HORDE = Inst14Quest3PreQuest
--
Inst14Quest6name1_HORDE = Inst14Quest6name1



--------------- INST15 - Naxxramas (Naxx) ---------------

-- Old Naxxramas (Before Wrath of the Lich King)
-- Now using Inst84 for the new one.



--------------- INST16 - Onyxia's Lair (Ony) ---------------

Inst16Story = "Onyxia is the daughter of the mighty dragon Deathwing, and sister of the scheming Nefarion Lord of Blackrock Spire. It is said that Onyxia delights in corrupting the mortal races by meddling in their political affairs. To this end it is believed that she takes on various humanoid forms and uses her charm and power to influence delicate matters between the different races. Some believe that Onyxia has even assumed an alias once used by her father - the title of the royal House Prestor. When not meddling in mortal concerns, Onyxia resides in a fiery cave below the Dragonmurk, a dismal swamp located within Пылевые топи. There she is guarded by her kin, the remaining members of the insidious Black Dragon Flight."
Inst16Caption = "Логово Ониксии"
Inst16QAA = "3 Задания"
Inst16QAH = "3 Задания"

--Quest 1 Alliance
Inst16Quest1 = "1. Ковка Кель-Серрара"
Inst16Quest1_Level = "60"
Inst16Quest1_Attain = "60"
Inst16Quest1_Aim = "Заставьте Ониксию дохнуть своим огненным дыханием на потускневший древний клинок. После этого схватите раскаленный древний клинок. Имейте в виду, что раскаленным он останется ненадолго, так что медлить не следует!\nПоследнее, что нужно сделать – это убить драконицу и вонзить раскаленный древний клинок в ее труп.\nСделайте это – и Кель-Серрар навеки станет вашим!"
Inst16Quest1_Location = "Сказитель Лидрос (Забытый город Запад; "..YELLOW.."[1] Библиотека"..WHITE..")"
Inst16Quest1_Note = "Положите клинок перед Ониксией, когда у нее останется 10% или 15% здоровья. Она дыхнет пламенем и раскалит его. После убийства Ониксии, поднимите клинок, щелкните на труп и используюйте меч. Теперь вы готовы завершить задание. После патча 3.2.2 нельзя взять эту цепочку заданий. Но если это задание у вас уже взято, вы сможете его закончить."
Inst16Quest1_Prequest = "Справочник Форора ("..YELLOW.."Забытый город Запад"..WHITE..") -> Ковка Кель-Серрара"
Inst16Quest1_Folgequest = "Нет"
Inst16Quest1PreQuest = "true"
--
Inst16Quest1name1 = "Quel'Serrar"

--Quest 2 Alliance
Inst16Quest2 = "2. Славная победа Альянса"
Inst16Quest2_Level = "60"
Inst16Quest2_Attain = "60"
Inst16Quest2_Aim = "Отнести голову Ониксии Верховному лорду Болвару Фордрагону в Штормград."
Inst16Quest2_Location = "Голова Ониксии (падает с Ониксии; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_Note = "Верховный лорд Болвар Фордрагон находится в (Штормград - Крепость Штормграда; "..YELLOW.."80.0, 38.5"..WHITE.."). Только один игрок в рейде может поднять этот предмет и задание можно сделать только 1 раз.\n\nНаграды перечислены ниже. После патча 3.2.2, Логово Ониксии - подземелье 80 уровня и голова на данное задание больше не падает."
Inst16Quest2_Prequest = "Нет"
Inst16Quest2_Folgequest = "Праздник добрых времен"
--
Inst16Quest2name1 = "Onyxia Blood Talisman"
Inst16Quest2name2 = "Dragonslayer's Signet"
Inst16Quest2name3 = "Onyxia Tooth Pendant"

--Quest 3 Alliance
Inst16Quest3 = "3. Странное стечение обстоятельств"
Inst16Quest3_Level = "80"
Inst16Quest3_Attain = "80"
Inst16Quest3_Aim = "Отнесите голову Ониксии Зардету Черному Когтю. Он ждет вас в подвале Забитого ягненка."
Inst16Quest3_Location = "Голова Ониксии (падает с Ониксии; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest3_Note = "Зардету Черному Когтю находится (Штормград - The Slaughtered Lamb; "..YELLOW.."40.1, 85.1"..WHITE.."). Только один игрок в рейде может поднять этот предмет и задание можно сделать только 1 раз."
Inst16Quest3_Prequest = "Нет"
Inst16Quest3_Folgequest = "Нет"
Inst16Quest3name1 = "Polished Dragonslayer's Signet"
Inst16Quest3name2 = "Sparkling Onyxia Tooth Pendant"
Inst16Quest3name3 = "Purified Onyxia Blood Talisman"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst16Quest1_HORDE = Inst16Quest1
Inst16Quest1_HORDE_Attain = Inst16Quest1_Attain
Inst16Quest1_HORDE_Level = Inst16Quest1_Level
Inst16Quest1_HORDE_Aim = Inst16Quest1_Aim
Inst16Quest1_HORDE_Location = Inst16Quest1_Location
Inst16Quest1_HORDE_Note = Inst16Quest1_Note
Inst16Quest1_HORDE_Prequest = Inst16Quest1_Prequest
Inst16Quest1_HORDE_Folgequest = Inst16Quest1_Folgequest
Inst16Quest1PreQuest_HORDE = Inst16Quest1PreQuest
--
Inst16Quest1name1_HORDE = Inst16Quest1name1

--Quest 2 Horde
Inst16Quest2_HORDE = "2. Победа Орды"
Inst16Quest2_HORDE_Level = "60"
Inst16Quest2_HORDE_Attain = "60"
Inst16Quest2_HORDE_Aim = "Отнесите голову Ониксии Траллу в Оргриммар."
Inst16Quest2_HORDE_Location = "Голова Ониксии (падает с Ониксии; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest2_HORDE_Note = "Тралл находится в (Оргриммар - Аллея Мудррости; "..YELLOW.."31,37"..WHITE.."). Только один игрок в рейде может поднять этот предмет и задание можно сделать только 1 раз.\n\nНаграды перечислены ниже. После патча 3.2.2, Логово Ониксии - подземелье 80 уровня и голова на данное задание больше не падает."
Inst16Quest2_HORDE_Prequest = "Нет"
Inst16Quest2_HORDE_Folgequest = "На виду у всех"
--
Inst16Quest2name1_HORDE = "Onyxia Blood Talisman"
Inst16Quest2name2_HORDE = "Dragonslayer's Signet"
Inst16Quest2name3_HORDE = "Onyxia Tooth Pendant"

--Quest 3 Horde
Inst16Quest3_HORDE = "3. Странное стечение обстоятельств"
Inst16Quest3_HORDE_Level = "80"
Inst16Quest3_HORDE_Attain = "80"
Inst16Quest3_HORDE_Aim = "Отнесите голову Ониксии Ниру Огненный Клинок. Он ждет вас в Расселине теней."
Inst16Quest3_HORDE_Location = "Голова Ониксии (падает с Ониксии; "..YELLOW.."[3]"..WHITE..")"
Inst16Quest3_HORDE_Note = "Ниру Огненный Клинок находится (Оргриммар - Расселина теней; "..YELLOW.."49.7, 50.5"..WHITE.."). Только один игрок в рейде может поднять этот предмет и задание можно сделать только 1 раз."
Inst16Quest3_HORDE_Prequest = "Нет"
Inst16Quest3_HORDE_Folgequest = "Нет"
Inst16Quest3name1_HORDE = "Polished Dragonslayer's Signet"
Inst16Quest3name2_HORDE = "Sparkling Onyxia Tooth Pendant"
Inst16Quest3name3_HORDE = "Purified Onyxia Blood Talisman"



--------------- INST17 - Razorfen Downs (RFD) ---------------

Inst17Story = "Crafted  from the same mighty vines as Razorfen Kraul, Razorfen Downs is the traditional capital city of the quillboar race. The sprawling, thorn-ridden labyrinth houses a veritable army of loyal quillboar as well as their high priests - the Death's Head tribe. Recently, however, a looming shadow has fallen over the crude den. Agents of the undead Scourge - led by the lich, Amnennar the Coldbringer - have taken control over the quillboar race and turned the maze of thorns into a bastion of undead might. Now the quillboar fight a desperate battle to reclaim their beloved city before Amnennar spreads his control across the Степи."
Inst17Caption = "Курганы Иглошкурых"
Inst17QAA = "3 Задания"
Inst17QAH = "4 Задания"

--Quest 1 Alliance
Inst17Quest1 = "1. Воинство зла"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "28"
Inst17Quest1_Aim = "Убейте 8 боевых стражей и 8 терноплетов из племени Иглошкурых, а также 8 сектанток из племени Мертвой Головы и возвращайтесь к Мириам Лунной Певице на Курганы Иглошкурых."
Inst17Quest1_Location = "Мириам Лунная Певица (Степи; "..YELLOW.."49,94"..WHITE..")"
Inst17Quest1_Note = "Вы сможете найти мобов и дающую задание в зоне перед самым входом в подземелье."
Inst17Quest1_Prequest = "Нет"
Inst17Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst17Quest2 = "2. Уничтожить идола"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "32"
Inst17Quest2_Aim = "Сопроводите Белнистраза к идолу свинобразов на Курганах Иглошкурых. Защищайте Белнистраза, пока он будет проводить ритуал, чтобы разрушить идола."
Inst17Quest2_Location = "Белнистраз (Курганы Иглошкурых; "..YELLOW.."[2]"..WHITE..")"
Inst17Quest2_Note = "Предшествующее задание заключается просто в согласии помочь ему. Несколько мобов появятся и атакуют Белнистраза когда он попытается сломать идол. После выполнения, вы можете сдать задание у жаровни перед идолом."
Inst17Quest2_Prequest = "Плеть в холмах"
Inst17Quest2_Folgequest = "Нет"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "Dragonclaw Ring"

--Quest 3 Alliance
Inst17Quest3 = "3. Светоприношение"
Inst17Quest3_Level = "37"
Inst17Quest3_Attain = "32"
Inst17Quest3_Aim = "Убейте Амненнара Хладовея на Курганах Иглошкурых."
Inst17Quest3_Location = "Архиепископ Бенедикт (Штормград - Собор Света; "..YELLOW.."50.0, 45.4"..WHITE..")"
Inst17Quest3_Note = "Амненнар Хладовей это последний босс в Курганах Иглошкурых. Вы найдете его около "..YELLOW.."[6]"..WHITE.."."
Inst17Quest3_Prequest = "Нет"
Inst17Quest3_Folgequest = "Нет"
--
Inst17Quest3name1 = "Vanquisher's Sword"
Inst17Quest3name2 = "Amberglow Talisman"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst17Quest1_HORDE = Inst17Quest1
Inst17Quest1_HORDE_Level = Inst17Quest1_Level
Inst17Quest1_HORDE_Attain = Inst17Quest1_Attain
Inst17Quest1_HORDE_Aim = Inst17Quest1_Aim
Inst17Quest1_HORDE_Location = Inst17Quest1_Location
Inst17Quest1_HORDE_Note = Inst17Quest1_Note
Inst17Quest1_HORDE_Prequest = Inst17Quest1_Prequest
Inst17Quest1_HORDE_Folgequest = Inst17Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst17Quest2_HORDE = "2. Нечестивый союз"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "28"
Inst17Quest2_HORDE_Aim = "Принести голову посла Малкина Вариматасу в Подгород."
Inst17Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst17Quest2_HORDE_Note = "Предшествующее задание можно подобрать с последнего босса в Лабиринтах Иглошкурых. Вы найдете Малкина снаружи (Степи; "..YELLOW.."48,92"..WHITE..")."
Inst17Quest2_HORDE_Prequest = "Нечестивый союз"
Inst17Quest2_HORDE_Folgequest = "Нет"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "Skullbreaker"
Inst17Quest2name2_HORDE = "Nail Spitter"
Inst17Quest2name3_HORDE = "Zealot's Robe"

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst17Quest3_HORDE = "3. Уничтожить идола"
Inst17Quest3_HORDE_Level = Inst17Quest2_Level
Inst17Quest3_HORDE_Attain = Inst17Quest2_Attain
Inst17Quest3_HORDE_Aim = Inst17Quest2_Aim
Inst17Quest3_HORDE_Location = Inst17Quest2_Location
Inst17Quest3_HORDE_Note = Inst17Quest2_Note
Inst17Quest3_HORDE_Prequest = Inst17Quest2_Prequest
Inst17Quest3_HORDE_Folgequest = Inst17Quest2_Folgequest
Inst17Quest3PreQuest_HORDE = Inst17Quest2PreQuest
--
Inst17Quest3name1_HORDE = Inst17Quest2name1

--Quest 4 Horde
Inst17Quest4_HORDE = "4. Да сгинет Хладовей"
Inst17Quest4_HORDE_Level = "42"
Inst17Quest4_HORDE_Attain = "37"
Inst17Quest4_HORDE_Aim = "Эндрю Браунелл поручил вам убить Амненнара Хладовея и принести его череп."
Inst17Quest4_HORDE_Location = "Эндрю Браунелл (Подгород - Квартал магов; "..YELLOW.."72,32"..WHITE..")"
Inst17Quest4_HORDE_Note = "Амненнар Хладовей это последний босс в Курганах Иглошкурых. Вы найдете его около "..YELLOW.."[6]"..WHITE.."."
Inst17Quest4_HORDE_Prequest = "Нет"
Inst17Quest4_HORDE_Folgequest = "Нет"
--
Inst17Quest4name1_HORDE = "Vanquisher's Sword"
Inst17Quest4name2_HORDE = "Amberglow Talisman"



--------------- INST18 - Razorfen Kraul (RFK) ---------------

Inst18Story = "Десять тысяч лет назад - во времена Войны Древних, могущественный полубог, Агамагган, вступил в битву против Пылающего Легиона. Огромный крепкий кабан пал в битве, но его действия помогли спасти Азерот от превращения в руины. Спустя некоторое время, в том, месте куда пролилась его кровь, из-под земли выросли толстые, покрытые шипами плети. Иглогривы - верившие, что они являются смертными потомками могучего бога, пришли занять эти места и охранять как святыню. Сердце этих шипастых колоний известно как Иглошкур. Огромные пространства Лабиринтов Иглошкурых были завоеваны старой каргой, Чарлгой Бритый Бок. Под ее рукой, иглогривы-шаманы начали атаковать племена соперников, также как и поселенцев Орды. Некоторые полагают, что Чарлга даже вела переговоры с агентами Плети - приравняв неожиданно ее племя к рангу нежити по каким-то коварным причинам."
Inst18Caption = "Лабиринты Иглошкурых"
Inst18QAA = "5 Заданий"
Inst18QAH = "5 Заданий"

--Quest 1 Alliance
Inst18Quest1 = "1. Корни Синелиста"
Inst18Quest1_Level = "26"
Inst18Quest1_Attain = "20"
Inst18Quest1_Aim = "В Лабиринтах Иглошкурых выпустите шмыгуноса и воспользуйтесь стеком, чтобы он начал искать корни.\nПринесите 6 корней синелиста, стек и ящик с дырками Мебоку Миззриксу в Кабестан."
Inst18Quest1_Location = "Мебок Миззрикс (Степи - Кабестан; "..YELLOW.."62,37"..WHITE..")"
Inst18Quest1_Note = "Ящик, Стек и инструкцию можно найти рядом с Мебоком Миззриксом."
Inst18Quest1_Prequest = "Нет"
Inst18Quest1_Folgequest = "Нет"
--
Inst18Quest1name1 = "A Small Container of Gems"

--Quest 2 Alliance
Inst18Quest2 = "2. Последнее желание"
Inst18Quest2_Level = "30"
Inst18Quest2_Attain = "25"
Inst18Quest2_Aim = "Найдите подвеску Трешалы и верните ее Трешале Бурый Ручей в Дарнасс."
Inst18Quest2_Location = "Гералат Бурый Ручей (Лабиринты Иглошкурых; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest2_Note = "Подвеска падает случайно. Вы должны вернуть подвеску Трешале Бурый Ручей в Дарнасс - Терраса торговцев ("..YELLOW.."69,67"..WHITE..")."
Inst18Quest2_Prequest = "Нет"
Inst18Quest2_Folgequest = "Нет"
--
Inst18Quest2name1 = "Mourning Shawl"
Inst18Quest2name2 = "Lancer Boots"

--Quest 3 Alliance
Inst18Quest3 = "3. Импортер Вилликс"
Inst18Quest3_Level = "30"
Inst18Quest3_Attain = "22"
Inst18Quest3_Aim = "Сопроводите Вилликса из Лабиринтов Иглошкурых."
Inst18Quest3_Location = "Импортер Вилликс (Лабиринты Иглошкурых; "..YELLOW.."[8]"..WHITE..")"
Inst18Quest3_Note = "Импортера Вилликса нужно проводить к выходу из подземелья. Задание можно сдать ему после выполнения."
Inst18Quest3_Prequest = "Нет"
Inst18Quest3_Folgequest = "Нет"
--
Inst18Quest3name1 = "Monkey Ring"
Inst18Quest3name2 = "Snake Hoop"
Inst18Quest3name3 = "Tiger Band"

--Quest 4 Alliance
Inst18Quest4 = "4. Хозяйка лабиринта"
Inst18Quest4_Level = "27"
Inst18Quest4_Attain = "23"
Inst18Quest4_Aim = "Принесите медальон Чарглы Острый Бок Фалфиндеру Хранителю Путей в Таланааре."
Inst18Quest4_Location = "Хранитель дорог Фалфиндел (Фералас - Таланаар; "..YELLOW.."89,46"..WHITE..")"
Inst18Quest4_Note = "Медальон нужный для заадания падает с Чарлги Остробок  "..YELLOW.."[7]"..WHITE.."."
Inst18Quest4_Prequest = "Дневник Хмурня"
Inst18Quest4_Folgequest = "Нет"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "Falfindel's Blaster"
Inst18Quest4name2 = "Berylline Pads"
Inst18Quest4name3 = "Stonefist Girdle"
Inst18Quest4name4 = "Marbled Buckler"

--Quest 5 Alliance
Inst18Quest5 = "5. Закаленный доспех (Воитель)"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "Соберите все необходимые материалы для Фьюрена Длинноборода и отнесите их в Штормград."
Inst18Quest5_Location = "Фьюрен Длиннобород (Штормград - Квартал дворфов; "..YELLOW.."64.4, 37.3"..WHITE..")"
Inst18Quest5_Note = "Это задание могут взять только воители. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nTПоследующее задание отличается для каждой расы. Пылающая кровь для людей, Железный Коралл для дворфов и гномов и Высохшая скорлупа для ночных эльфов."
Inst18Quest5_Prequest = "Щитник"
Inst18Quest5_Folgequest = "(См. заметки)"
Inst18Quest5PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst18Quest1_HORDE = Inst18Quest1
Inst18Quest1_HORDE_Level = Inst18Quest1_Level
Inst18Quest1_HORDE_Attain = Inst18Quest1_Attain
Inst18Quest1_HORDE_Aim = Inst18Quest1_Aim
Inst18Quest1_HORDE_Location = Inst18Quest1_Location
Inst18Quest1_HORDE_Note = Inst18Quest1_Note
Inst18Quest1_HORDE_Prequest = Inst18Quest1_Prequest
Inst18Quest1_HORDE_Folgequest = Inst18Quest1_Folgequest
--
Inst18Quest1name1_HORDE = Inst18Quest1name1

--Quest 2 Horde  (same as Quest 3 Alliance)
Inst18Quest2_HORDE = "2. Импортер Вилликс"
Inst18Quest2_HORDE_Level = Inst18Quest3_Level
Inst18Quest2_HORDE_Attain = Inst18Quest3_Attain
Inst18Quest2_HORDE_Aim = Inst18Quest3_Aim
Inst18Quest2_HORDE_Location = Inst18Quest3_Location
Inst18Quest2_HORDE_Note = Inst18Quest3_Note
Inst18Quest2_HORDE_Prequest = Inst18Quest3_Prequest
Inst18Quest2_HORDE_Folgequest = Inst18Quest3_Folgequest
--
Inst18Quest2name1_HORDE = Inst18Quest3name1
Inst18Quest2name2_HORDE = Inst18Quest3name2
Inst18Quest2name3_HORDE = Inst18Quest3name3

-- Quest 3 Horde
Inst18Quest3_HORDE = "3. Груды гуано"
Inst18Quest3_HORDE_Level = "26"
Inst18Quest3_HORDE_Attain = "22"
Inst18Quest3_HORDE_Aim = "Принесите 1 кучку гуано летучей мыши Вотчины мастеру аптекарю Фаранеллу в Подгород."
Inst18Quest3_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69 "..WHITE..")"
Inst18Quest3_HORDE_Note = "Гуано падает с любой летучей мыши внутри подземелья."
Inst18Quest3_HORDE_Prequest = "Нет"
Inst18Quest3_HORDE_Folgequest = "Сердца Доблести ("..YELLOW.."[Монастырь Алого Ордена]"..WHITE..")"
-- No Rewards for this quest

--Quest 4 Horde
Inst18Quest4_HORDE = "4. Отмщение грядет!"
Inst18Quest4_HORDE_Level = "27"
Inst18Quest4_HORDE_Attain = "23"
Inst18Quest4_HORDE_Aim = "Принесите сердце Чарлги Остробок Ольду Каменному Копью в Громовой Утес."
Inst18Quest4_HORDE_Location = "Ольд Каменное Копье (Громовой Утес; "..YELLOW.."36,59"..WHITE..")"
Inst18Quest4_HORDE_Note = "Вы найдете Чарглу Остробок около "..YELLOW.."[7]"..WHITE.."."
Inst18Quest4_HORDE_Prequest = "Нет"
Inst18Quest4_HORDE_Folgequest = "Нет"
--
Inst18Quest4name1_HORDE = "Berylline Pads"
Inst18Quest4name2_HORDE = "Stonefist Girdle"
Inst18Quest4name3_HORDE = "Marbled Buckler"

--Quest 5 Horde
Inst18Quest5_HORDE = "5. Доспехи Жестокости (Воин)"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "Принесите Тун'гриму Огневзору 15 закопченных железных слитков, 10 мер толченого азурита, 10 железных слитков и сосуд флогистона."
Inst18Quest5_HORDE_Location = "Тун'грим Огневзор (Степи; "..YELLOW.."57,30"..WHITE..")"
Inst18Quest5_HORDE_Note = "Это задание могут взять только войны. Вы заберете сосуд флогистона у Ругуга около "..YELLOW.."[1]"..WHITE..".\n\nВыполнение задания позволит вам начать еще 4 новых задания у того же персонажа."
Inst18Quest5_HORDE_Prequest = "Поговорить с Тун'гримом"
Inst18Quest5_HORDE_Folgequest = "(см. заметки)"
Inst18Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST19 - SM: Library (SM Lib) ---------------

Inst19Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
Inst19Caption = "МАО - Библиотека"
Inst19QAA = "3 Задания"
Inst19QAH = "5 Заданий"

--Quest 1 Alliance
Inst19Quest1 = "1. Мифология титанов"
Inst19Quest1_Level = "38"
Inst19Quest1_Attain = "28"
Inst19Quest1_Aim = "Добудьте 'Мифологию Титанов' из монастыря и принесите ее библиотекарю Мае Белокожке в Стальгорн."
Inst19Quest1_Location = "Библиотекарь Мае Белокожка (Стальгорн - Зал исследователей; "..YELLOW.."74,12"..WHITE..")"
Inst19Quest1_Note = "Книга лежит на полу на левой стороне коридоров, ведущих к Чародею Доану ("..YELLOW.."[2]"..WHITE..")."
Inst19Quest1_Prequest = "Нет"
Inst19Quest1_Folgequest = "Нет"
--
Inst19Quest1name1 = "Explorers' League Commendation"

--Quest 2 Alliance
Inst19Quest2 = "2. Обряды силы (Маг)"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "30"
Inst19Quest2_Aim = "Принесите книгу 'Обряды силы' Табете в Пыльную трясину."
Inst19Quest2_Location = "Табета (Пылевые топи; "..YELLOW.."43,57"..WHITE..")"
Inst19Quest2_Note = "Это задание могут взять только маги. Вы найдете книгу в последнем коридоре ведущем к чародею Доану ("..YELLOW.."[2]"..WHITE..")."
Inst19Quest2_Prequest = "Волшебное слово"
Inst19Quest2_Folgequest = "Жезл мага"
Inst19Quest2PreQuest = "true"
--
Inst19Quest2name1 = "Icefury Wand"
Inst19Quest2name2 = "Nether Force Wand"
Inst19Quest2name3 = "Ragefire Wand"

--Quest 3 Alliance
Inst19Quest3 = "3. Во имя Света!"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "34"
Inst19Quest3_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси, после этого вернитесь с докладом к Ролею Благочестивому в Южнобережье."
Inst19Quest3_Location = "Ролей Благочестивый (Предгорья Хилсбрада - Южнобережье; "..YELLOW.."51,58"..WHITE..")"
Inst19Quest3_Note = "Эта линейка заданий начинается у брата Кроули в Штормграде - Собор Света ("..YELLOW.."52.3, 43.1"..WHITE..").\nВы найдете Верховного инквизитора Вайтмейн и командира Могрейна около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst19Quest3_Prequest = "Брат Антон -> Путями Алого ордена"
Inst19Quest3_Folgequest = "Нет"
Inst19Quest3PreQuest = "true"
--
Inst19Quest3name1 = "Sword of Serenity"
Inst19Quest3name2 = "Bonebiter"
Inst19Quest3name3 = "Black Menace"
Inst19Quest3name4 = "Orb of Lorica"


--Quest 1 Horde
Inst19Quest1_HORDE = "1. Сердца Доблести"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "30"
Inst19Quest1_HORDE_Aim = "Мастер аптекарь Фаранелл из Подгорода просит принести ему 20 сердец Доблести."
Inst19Quest1_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
Inst19Quest1_HORDE_Note = "Сердца Доблести можно выбить со всех людей ордена в Алом Монастыре, включая людей вне подземелья."
Inst19Quest1_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Razorfen Kraul]"..WHITE..")"
Inst19Quest1_HORDE_Folgequest = "Нет"
Inst19Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst19Quest2_HORDE = "2. Испытание знаний"
Inst19Quest2_HORDE_Level = "36"
Inst19Quest2_HORDE_Attain = "25"
Inst19Quest2_HORDE_Aim = "Найдите книгу 'Истоки угрозы нежити' и отнесите ее Парквелу Финталласу в Подгород."
Inst19Quest2_HORDE_Location = "Парквел Финталлас (Подгород - Квартал фармацевтов; "..YELLOW.."57,65"..WHITE..")"
Inst19Quest2_HORDE_Note = "Линейка начинается у Дорна Вольного Ловчего (Тысяча Игл; "..YELLOW.."53,41"..WHITE.."). Вы можете найти книгу в Библиотеке Алого Монастыря."
Inst19Quest2_HORDE_Prequest = "Испытание веры -> Испытание знаний"
Inst19Quest2_HORDE_Folgequest = "Испытание знаний"
Inst19Quest2PreQuest_HORDE = "true"
--
Inst19Quest2name1_HORDE = "Windstorm Hammer"
Inst19Quest2name2_HORDE = "Dancing Flame"

--Quest 3 Horde
Inst19Quest3_HORDE = "3. Перечень павших"
Inst19Quest3_HORDE_Level = "38"
Inst19Quest3_HORDE_Attain = "28"
Inst19Quest3_HORDE_Aim = "Добудьте перечень павших из монастыря в Тирисфальских лесах и возвращайтесь к Ведуну Искателю Истины в Громовой Утес."
Inst19Quest3_HORDE_Location = "Ведун Искатель Истины (Громовой утес; "..YELLOW.."34,47"..WHITE..")"
Inst19Quest3_HORDE_Note = "Вы найдете книгу в библиотечной секции Алого Монастыря. ВНИМАНИЕ! Нежить не может взять это задание"
Inst19Quest3_HORDE_Prequest = "Нет"
Inst19Quest3_HORDE_Folgequest = "Нет"
--
Inst19Quest3name1_HORDE = "Vile Protector"
Inst19Quest3name2_HORDE = "Forcestone Buckler"
Inst19Quest3name3_HORDE = "Omega Orb"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst19Quest4_HORDE = "4. Обряды силы (Маг)"
Inst19Quest4_HORDE_Level = Inst19Quest2_Level
Inst19Quest4_HORDE_Attain = Inst19Quest2_Attain
Inst19Quest4_HORDE_Aim = Inst19Quest2_Aim
Inst19Quest4_HORDE_Location = Inst19Quest2_Location
Inst19Quest4_HORDE_Note = Inst19Quest2_Note
Inst19Quest4_HORDE_Prequest = Inst19Quest2_Prequest
Inst19Quest4_HORDE_Folgequest = Inst19Quest2_Folgequest
Inst19Quest4PreQuest_HORDE = Inst19Quest2_PreQuest
--
Inst19Quest4name1_HORDE = Inst19Quest2name1
Inst19Quest4name2_HORDE = Inst19Quest2name2
Inst19Quest4name3_HORDE = Inst19Quest2name3

--Quest 5 Horde
Inst19Quest5_HORDE = "5. В монастырь Алого ордена"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "Убейте Верховного инквизитора Вайтмейн, командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси. Затем возвращайтесь к Вариматасу в Подгород."
Inst19Quest5_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst19Quest5_HORDE_Note = "Вы найдете Верховного инквизитора Вайтмейн и Командира Могрейна из Алого ордена около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst19Quest5_HORDE_Prequest = "Нет"
Inst19Quest5_HORDE_Folgequest = "Нет"
--
Inst19Quest5name1_HORDE = "Sword of Omen"
Inst19Quest5name2_HORDE = "Prophetic Cane"
Inst19Quest5name3_HORDE = "Dragon's Blood Necklace"



--------------- INST57 - SM: Armory (SM Arm) ---------------

Inst57Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
Inst57Caption = "МАО - Оружейная"
Inst57QAA = "1 Задание"
Inst57QAH = "2 Задания"

--Quest 1 Alliance
Inst57Quest1 = "1. Во имя Света!"
Inst57Quest1_Level = "40"
Inst57Quest1_Attain = "34"
Inst57Quest1_Aim = "Убейте Верховного инквизитора Вайтмейн, Командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси и потом доложитесь Ролею Благочестивому в Южнобережье."
Inst57Quest1_Location = "Ролей Благочестивый (Предгорья Хилсбрада - Южнобережье; "..YELLOW.."51,58"..WHITE..")"
Inst57Quest1_Note = "Эта линейка заданий начинается у брата Кроули в Штормграде - Собор Света ("..YELLOW.."52.1, 43.1"..WHITE..").\nВы найдете Верховного инквизитора Вайтмейн и командира Могрейна около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst57Quest1_Prequest = "Брат Антон -> По тропе Алых"
Inst57Quest1_Folgequest = "Нет"
Inst57Quest1PreQuest = "true"
--
Inst57Quest1name1 = "Sword of Serenity"
Inst57Quest1name2 = "Bonebiter"
Inst57Quest1name3 = "Black Menace"
Inst57Quest1name4 = "Orb of Lorica"


--Quest 1 Horde
Inst57Quest1_HORDE = "1. Сердца Доблести"
Inst57Quest1_HORDE_Level = "33"
Inst57Quest1_HORDE_Attain = "30"
Inst57Quest1_HORDE_Aim = "Мастер аптекарь Фаранелл в Подгороде просит принести ему 20 Сердец Доблести."
Inst57Quest1_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
Inst57Quest1_HORDE_Note = "Сердца Доблести можно выбить со всех мобов в Алом Монастыре, включая людей вне подземелья."
Inst57Quest1_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Лабиринты Иглошкурых]"..WHITE..")"
Inst57Quest1_HORDE_Folgequest = "Нет"
Inst57Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst57Quest2_HORDE = "2. В монастырь Алого ордена"
Inst57Quest2_HORDE_Level = "42"
Inst57Quest2_HORDE_Attain = "33"
Inst57Quest2_HORDE_Aim = "Убейте Верховного инквизитора Вайтмейн, Командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси и доложитесь Вариматасу в Подгород."
Inst57Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst57Quest2_HORDE_Note = "Вы найдете Верховного инквизитора Вайтмейн и Командира Могрейна из Алого ордена около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst57Quest2_HORDE_Prequest = "Нет"
Inst57Quest2_HORDE_Folgequest = "Нет"
--
Inst57Quest2name1_HORDE = "Sword of Omen"
Inst57Quest2name2_HORDE = "Prophetic Cane"
Inst57Quest2name3_HORDE = "Dragon's Blood Necklace"



--------------- INST58 - SM: Cathedral (SM Cath) ---------------

Inst58Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
Inst58Caption = "МАО - Собор"
Inst58QAA = "1 Задание"
Inst58QAH = "2 Задания"

--Quest 1 Alliance
Inst58Quest1 = "1. Во имя Света!"
Inst58Quest1_Level = "40"
Inst58Quest1_Attain = "34"
Inst58Quest1_Aim = "Убейте Верховного инквизитора Вайтмейн, Командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси и потом доложитесь Ролею Благочестивому в Южнобережье."
Inst58Quest1_Location = "Ролей Благочестивый (Предгорья Хилсбрада - Южнобережье; "..YELLOW.."51,58"..WHITE..")"
Inst58Quest1_Note = "Эта линейка заданий начинается у брата Кроули в Штормграде - Собор Света ("..YELLOW.."52.1, 43.1"..WHITE..").\nВы найдете Верховного инквизитора Вайтмейн и командира Могрейна около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst58Quest1_Prequest = "Брат Антон -> По тропе Алых"
Inst58Quest1_Folgequest = "Нет"
Inst58Quest1PreQuest = "true"
--
Inst58Quest1name1 = "Sword of Serenity"
Inst58Quest1name2 = "Bonebiter"
Inst58Quest1name3 = "Black Menace"
Inst58Quest1name4 = "Orb of Lorica"


--Quest 1 Horde
Inst58Quest1_HORDE = "1. Сердца Доблести"
Inst58Quest1_HORDE_Level = "33"
Inst58Quest1_HORDE_Attain = "30"
Inst58Quest1_HORDE_Aim = "Мастер аптекарь Фаранелл в Подгороде просит принести ему 20 Сердец Доблести."
Inst58Quest1_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
Inst58Quest1_HORDE_Note = "Сердца Доблести можно выбить со всех мобов в Алом Монастыре, включая людей вне подземелья."
Inst58Quest1_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Лабиринты Иглошкурых]"..WHITE..")"
Inst58Quest1_HORDE_Folgequest = "Нет"
Inst58Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst58Quest2_HORDE = "2. В монастырь Алого ордена"
Inst58Quest2_HORDE_Level = "42"
Inst58Quest2_HORDE_Attain = "33"
Inst58Quest2_HORDE_Aim = "Убейте Верховного инквизитора Вайтмейн, Командира Могрейна из Алого ордена, воителя Герода из Алого ордена и псаря Локси и доложитесь Вариматасу в Подгород."
Inst58Quest2_HORDE_Location = "Вариматас (Подгород - Королевский квартал; "..YELLOW.."56,92"..WHITE..")"
Inst58Quest2_HORDE_Note = "Вы найдете Верховного инквизитора Вайтмейн и Командира Могрейна из Алого ордена около "..YELLOW.."МАО - Собор [2]"..WHITE..", Герода около "..YELLOW.."МАО - Оружейная [1]"..WHITE.." и псаря Локси около "..YELLOW.."МАО - Библиотека [1]"..WHITE.."."
Inst58Quest2_HORDE_Prequest = "Нет"
Inst58Quest2_HORDE_Folgequest = "Нет"
--
Inst58Quest2name1_HORDE = "Sword of Omen"
Inst58Quest2name2_HORDE = "Prophetic Cane"
Inst58Quest2name3_HORDE = "Dragon's Blood Necklace"



--------------- INST59 - SM: Graveyard (SM GY) ---------------

Inst59Story = "Монастырь когда-то был гордым оплотом жречества Лордерона - центром обучения и просвящения. С появлением нежити Плети во время Третьей войны, мирный монастырь превратился в цитадель фанатичного Алого ордена. Рыцари ордена нетерпимы ко всем нечеловеческим расам, невзирая на союзы и принадлежности. Они верят что любой чужак - потенциальный носитель чумы нежити - и должны быть уничтожены. Судя по донесениям, любителям приключений, которые ходили в монастырь пришлось сражаться с командиром Алого ордена Могрейном, под рукой которого находится большой гарнизон фанатично преданных воинов. Онако настоящая хозяйка монастыря - это Верховный инквизитор Вайтмейн - грозная жрица, обладающая способностью воскрешать павших воинов для сражения во имя нее."
Inst59Caption = "МАО - Кладбище"
Inst59QAA = "1 Задание"
Inst59QAH = "3 Задания"

--Quest 1 Alliance
Inst59Quest1 = "1. Вызов всадника без головы ((ежедн.) - Сезонный)"
Inst59Quest1_Level = "80"
Inst59Quest1_Attain = "75"
Inst59Quest1_Aim = "Принесите мрачную свечу к груде рыхлой вывороченной почвы."
Inst59Quest1_Location = "Тыква-алтарь (МАО - Кладбище; "..YELLOW.."[2]"..WHITE..")"
Inst59Quest1_Note = "Почва находится в нескольких шагах от алтаря. Это задание доступно только в течение Тыквовина и может быть выполнено один раз в день одним персонажем во время события.\n\nВыполнение призывает Всадника без головы, босса 80го уровня."
Inst59Quest1_Prequest = "Нет"
Inst59Quest1_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde
Inst59Quest1_HORDE = "1. Месть Воррела"
Inst59Quest1_HORDE_Level = "33"
Inst59Quest1_HORDE_Attain = "25"
Inst59Quest1_HORDE_Aim = "Верните обручальное кольцо Воррела Сенгутца Монике Сенгутц в Мельнице Таррен."
Inst59Quest1_HORDE_Location = "Воррел Сенгутц (МАО - Кладбище; "..YELLOW.."[1]"..WHITE..")"
Inst59Quest1_HORDE_Note = "Вы найдете Воррела Сенгутца в начале Кладбищенского крыла Монастыря Алого ордена. Нэнси Вишас, с которой падает кольцо нужное для задания, можно найти в доме в Альтеракских горах ("..YELLOW.."31,32"..WHITE..")."
Inst59Quest1_HORDE_Prequest = "Нет"
Inst59Quest1_HORDE_Folgequest = "Нет"
--
Inst59Quest1name1_HORDE = "Vorrel's Boots"
Inst59Quest1name2_HORDE = "Mantle of Woe"
Inst59Quest1name3_HORDE = "Grimsteel Cape"

--Quest 2 Horde
Inst59Quest2_HORDE = "2. Сердца Доблести"
Inst59Quest2_HORDE_Level = "33"
Inst59Quest2_HORDE_Attain = "30"
Inst59Quest2_HORDE_Aim = "Мастер аптекарь Фаранелл в Подгороде просит принести ему 20 Сердец Доблести."
Inst59Quest2_HORDE_Location = "Мастер аптекарь Фаранелл (Подгород - Квартал фармацевтов; "..YELLOW.."48,69"..WHITE..")"
Inst59Quest2_HORDE_Note = "Сердца Доблести можно выбить со всех мобов в Алом Монастыре, включая людей вне подземелья."
Inst59Quest2_HORDE_Prequest = "Груды гуано ("..YELLOW.."[Лабиринты Иглошкурых]"..WHITE..")"
Inst59Quest2_HORDE_Folgequest = "Нет"
Inst59Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst59Quest3_HORDE = "3. Вызов всадника без головы ((ежедн.) - Сезонный)"
Inst59Quest3_HORDE_Level = Inst59Quest1_Level
Inst59Quest3_HORDE_Attain = Inst59Quest1_Attain
Inst59Quest3_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest3_HORDE_Location = Inst59Quest1_Location
Inst59Quest3_HORDE_Note = Inst59Quest1_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest1_Folgequest
-- No Rewards for this quest



--------------- INST20 - Scholomance (Scholo) ---------------

Inst20Story = "Некроситет разместился в серии гробниц, лежащих под развалинами крепости Каэр Дарроу. Когда-то принадлежавший знатной семье Баровых, Каэр Дарроу превратился в руины во время Второй войны. Так как колдун Кель'тузед вербовал последователей своего Культа Проклятых, он часто обещал бессмертие в обмен на служение Королю-личу. Семья Баровых поддалась харизматичному влиянию Кель'тузеда и подарила крепость и ее гробницы Плети. После этого культисты убили Баровых и превратили древние гробницы в школу некромантов, известную как Некроситет. Хотя Кель'тузеда больше нет в гробницах, преданные культисты и преподаватели все еще там. Могущественный лич, Рас Снегошепот, руководит охраной и следит за территорией во имя Плети - а смертный некромант, Темный магистр Гандлинг, выступает в роли коварного главы школы."
Inst20Caption = "Некроситет"
Inst20QAA = "11 Заданий"
Inst20QAH = "12 Заданий"

--Quest 1 Alliance
Inst20Quest1 = "1. Зачумленные детеныши дракона"
Inst20Quest1_Level = "58"
Inst20Quest1_Attain = "55"
Inst20Quest1_Aim = "Убейте 20 зачумленных детенышей дракона, затем возвращайтесь к Бетине Биггльцинк в Часовню Последней Надежды."
Inst20Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest1_Note = "Зачумленные детеныши дракона находятся по пути к Громоклину в большой комнате."
Inst20Quest1_Prequest = "Нет"
Inst20Quest1_Folgequest = "Здоровая чешуя дракона"
-- No Rewards for this quest

--Quest 2 Alliance
Inst20Quest2 = "2. Здоровая чешуя дракона"
Inst20Quest2_Level = "58"
Inst20Quest2_Attain = "55"
Inst20Quest2_Aim = "Отнесите здоровую чешую дракона Бетине Биггльцинк в Часовню Последней Надежды в Восточные Чумные земли."
Inst20Quest2_Location = "Здоровая чешуя дракона (случайно падает в Некроситете)"
Inst20Quest2_Note = "Здоровая чешуя дракона падает с зачумленных детенышей дракона (8% шанс). Вы найдете Бетину Биггльцинк в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
Inst20Quest2_Prequest = "Зачумленные детеныши дракона "
Inst20Quest2_Folgequest = "Нет"
Inst20Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst20Quest3 = "3. Доктор Теолен Крастинов – Мясник"
Inst20Quest3_Level = "60"
Inst20Quest3_Attain = "55"
Inst20Quest3_Aim = "Найдите в Некроситете доктора Теолена Крастинова. Убейте его, затем сожгите останки Евы и Люсьена Саркофф. Выполнив задание, возвращайтесь к Еве Саркофф."
Inst20Quest3_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest3_Note = "Вы найдете доктора Теолена Крастинова, останки Евы и останки Люсьена Саркофф около "..YELLOW.."[9]"..WHITE.."."
Inst20Quest3_Prequest = "Нет"
Inst20Quest3_Folgequest = "Мешок ужасов Крастинова"
-- No Rewards for this quest

--Quest 4 Alliance
Inst20Quest4 = "4. Мешок ужасов Крастинова"
Inst20Quest4_Level = "60"
Inst20Quest4_Attain = "55"
Inst20Quest4_Aim = "Найдите в Некроситете Джандис Баров и уничтожьте ее. Заберите мешок ужасов Крастинова. Отнесите мешок Еве Саркофф."
Inst20Quest4_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest4_Note = "Вы найдете Джастин Баров около "..YELLOW.."[3]"..WHITE.."."
Inst20Quest4_Prequest = "Доктор Теолен Крастинов – Мясник"
Inst20Quest4_Folgequest = "Киртонос Глашатай"
Inst20Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst20Quest5 = "5. Киртонос Глашатай"
Inst20Quest5_Level = "60"
Inst20Quest5_Attain = "55"
Inst20Quest5_Aim = "Вернитесь в Некроситет с кровью невинных. Найдите балкон и вылейте кровь в жаровню. На зов явится Киртонос. Сражайтесь как герой, не сдавайтесь! Уничтожьте Киртоноса и возвращайтесь к Еве Саркофф."
Inst20Quest5_Location = "Ева Саркофф (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest5_Note = "Жаровня находится около "..YELLOW.."[2]"..WHITE.."."
Inst20Quest5_Prequest = "Мешок ужасов Крастинова"
Inst20Quest5_Folgequest = "Рас Ледяной Шепот – человек"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "Spectral Essence"
Inst20Quest5name2 = "Penelope's Rose"
Inst20Quest5name3 = "Mirah's Song"

--Quest 6 Alliance
Inst20Quest6 = "6. Рас Снегошепот – лич"
Inst20Quest6_Level = "60"
Inst20Quest6_Attain = "57"
Inst20Quest6_Aim = "Отыщите в Некроситете Раса Снегошепота. Найдя его, воспользуйтесь Книгой Души против его посмертного облика. Если удастся превратить Раса в смертного, убейте его и заберите человеческую голову Раса Снегошепота. Отнесите голову мировому судье Мардуку."
Inst20Quest6_Location = "Мировой судья Мардук (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE..")"
Inst20Quest6_Note = "Вы сможете найти Раса Леденой Шепот около "..YELLOW.."[7]"..WHITE.."."
Inst20Quest6_Prequest = "Рас Ледяной Шепот – человек - >  Книга Души"
Inst20Quest6_Folgequest = "Нет"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "Darrowshire Strongguard"
Inst20Quest6name2 = "Warblade of Каэр Дарроу"
Inst20Quest6name3 = "Crown of Каэр Дарроу"
Inst20Quest6name4 = "Darrowspike"

--Quest 7 Alliance
Inst20Quest7 = "7. Сокровище Баровых"
Inst20Quest7_Level = "60"
Inst20Quest7_Attain = "52"
Inst20Quest7_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Велдону Барову."
Inst20Quest7_Location = "Велдон Баров (Западные Чумные земли - Лагерь Промозглого Ветра; "..YELLOW.."43,83"..WHITE..")"
Inst20Quest7_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_Prequest = "Нет"
Inst20Quest7_Folgequest = "Последний из Баровых"
--
Inst20Quest7name1 = "Barov Peasant Caller"

--Quest 8 Alliance
Inst20Quest8 = "8. Рассветный гамбит"
Inst20Quest8_Level = "60"
Inst20Quest8_Attain = "57"
Inst20Quest8_Aim = "Отнесите рассветный гамбит в Демонстрационную комнату в Некроситете. Уничтожьте Вектуса и возвращайтесь к Бетине Биггльцинк."
Inst20Quest8_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst20Quest8_Note = "Сущность детеныша дракона начинается у Тинки Кипеллера (Пылающие степи - Пламенеющий стяг; "..YELLOW.."65,23"..WHITE.."). Демонстрационная комната находится около "..YELLOW.."[6]"..WHITE.."."
Inst20Quest8_Prequest = "Сущность детеныша дракона - > Бетина Биггльцинк"
Inst20Quest8_Folgequest = "Нет"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "Windreaper"
Inst20Quest8name2 = "Dancing Sliver"

--Quest 9 Alliance
Inst20Quest9 = "9. Доставка беса (Чернокнижник)"
Inst20Quest9_Level = "60"
Inst20Quest9_Attain = "60"
Inst20Quest9_Aim = "Отнесите беса в бутылке в алхимическую лабораторию Некроситета. После создания пергамента верните бутылку Горзиеки Дикоглазу."
Inst20Quest9_Location = "Горзиеки Дикоглаз (Пылающие степи; "..YELLOW.."12,31"..WHITE..")"
Inst20Quest9_Note = "Только Чернокнижники могут взять это задание! Вы найдете алхимическую лабораторию около "..YELLOW.."[7]"..WHITE.."."
Inst20Quest9_Prequest = "Мор'зул Кровопуск - > Зоротианская звездная пыль"
Inst20Quest9_Folgequest = "Ксоротианский конь погибели ("..YELLOW.."Забытый город Запад"..WHITE..")"
Inst20Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst20Quest10 = "10. Левая часть амулета Лорда Вальтхалака"
Inst20Quest10_Level = "60"
Inst20Quest10_Attain = "58"
Inst20Quest10_Aim = "С помощью жаровни Призыва вызвать дух Кормока и убить его. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Лорда Вальтхалака и жаровню Призыва."
Inst20Quest10_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst20Quest10_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nКормок призывается около "..YELLOW.."[7]"..WHITE.."."
Inst20Quest10_Prequest = "Важная составляющая заклинания"
Inst20Quest10_Folgequest = "Я вижу остров Алькац..."
Inst20Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst20Quest11 = "11. Правая часть амулета Лорда Вальтхалака"
Inst20Quest11_Level = "60"
Inst20Quest11_Attain = "58"
Inst20Quest11_Aim = "С помощью жаровни Призыва вызвать дух Кормока и убить его. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
Inst20Quest11_Location = "Бодли (Черная гора; "..YELLOW.."[D] на входе"..WHITE..")"
Inst20Quest11_Note = "'Спектральный сканер иных измерений' нужен, чтобы увидеть Бодли. Вы можите получить его в награду за задание 'В поисках Антиона'.\n\nКормок призывается на "..YELLOW.."[7]"..WHITE.."."
Inst20Quest11_Prequest = "Еще одна важная составляющая заклинания"
Inst20Quest11_Folgequest = "Последние приготовления ("..YELLOW.."Верхняя часть Черной горы"..WHITE..")"
Inst20Quest11PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst20Quest1_HORDE = Inst20Quest1
Inst20Quest1_HORDE_Level = Inst20Quest1_Level
Inst20Quest1_HORDE_Attain = Inst20Quest1_Attain
Inst20Quest1_HORDE_Aim = Inst20Quest1_Aim
Inst20Quest1_HORDE_Location = Inst20Quest1_Location
Inst20Quest1_HORDE_Note = Inst20Quest1_Note
Inst20Quest1_HORDE_Prequest = Inst20Quest1_Prequest
Inst20Quest1_HORDE_Folgequest = Inst20Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst20Quest2_HORDE = Inst20Quest2
Inst20Quest2_HORDE_Level = Inst20Quest2_Level
Inst20Quest2_HORDE_Attain = Inst20Quest2_Attain
Inst20Quest2_HORDE_Aim = Inst20Quest2_Aim
Inst20Quest2_HORDE_Location = Inst20Quest2_Location
Inst20Quest2_HORDE_Note = Inst20Quest2_Note
Inst20Quest2_HORDE_Prequest = Inst20Quest2_Prequest
Inst20Quest2_HORDE_Folgequest = Inst20Quest2_Folgequest
Inst20Quest2FQuest_HORDE = Inst20Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst20Quest3_HORDE = Inst20Quest3
Inst20Quest3_HORDE_Level = Inst20Quest3_Level
Inst20Quest3_HORDE_Attain = Inst20Quest3_Attain
Inst20Quest3_HORDE_Aim = Inst20Quest3_Aim
Inst20Quest3_HORDE_Location = Inst20Quest3_Location
Inst20Quest3_HORDE_Note = Inst20Quest3_Note
Inst20Quest3_HORDE_Prequest = Inst20Quest3_Prequest
Inst20Quest3_HORDE_Folgequest = Inst20Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst20Quest4_HORDE = Inst20Quest4
Inst20Quest4_HORDE_Level = Inst20Quest4_Level
Inst20Quest4_HORDE_Attain = Inst20Quest4_Attain
Inst20Quest4_HORDE_Aim = Inst20Quest4_Aim
Inst20Quest4_HORDE_Location = Inst20Quest4_Location
Inst20Quest4_HORDE_Note = Inst20Quest4_Note
Inst20Quest4_HORDE_Prequest = Inst20Quest4_Prequest
Inst20Quest4_HORDE_Folgequest = Inst20Quest4_Folgequest
Inst20Quest4FQuest_HORDE = Inst20Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst20Quest5_HORDE = Inst20Quest5
Inst20Quest5_HORDE_Level = Inst20Quest5_Level
Inst20Quest5_HORDE_Attain = Inst20Quest5_Attain
Inst20Quest5_HORDE_Aim = Inst20Quest5_Aim
Inst20Quest5_HORDE_Location = Inst20Quest5_Location
Inst20Quest5_HORDE_Note = Inst20Quest5_Note
Inst20Quest5_HORDE_Prequest = Inst20Quest5_Prequest
Inst20Quest5_HORDE_Folgequest = Inst20Quest5_Folgequest
Inst20Quest5FQuest_HORDE = Inst20Quest5FQuest
--
Inst20Quest5name1_HORDE = Inst20Quest5name1
Inst20Quest5name2_HORDE = Inst20Quest5name2
Inst20Quest5name3_HORDE = Inst20Quest5name3

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst20Quest6_HORDE = Inst20Quest6
Inst20Quest6_HORDE_Level = Inst20Quest6_Level
Inst20Quest6_HORDE_Attain = Inst20Quest6_Attain
Inst20Quest6_HORDE_Aim = Inst20Quest6_Aim
Inst20Quest6_HORDE_Location = Inst20Quest6_Location
Inst20Quest6_HORDE_Note = Inst20Quest6_Note
Inst20Quest6_HORDE_Prequest = Inst20Quest6_Prequest
Inst20Quest6_HORDE_Folgequest = Inst20Quest6_Folgequest
Inst20Quest6PreQuest_HORDE = Inst20Quest6PreQuest
--
Inst20Quest6name1_HORDE = Inst20Quest6name1
Inst20Quest6name2_HORDE = Inst20Quest6name2
Inst20Quest6name3_HORDE = Inst20Quest6name3
Inst20Quest6name4_HORDE = Inst20Quest6name4

--Quest 7 Horde
Inst20Quest7_HORDE = "7. Сокровище Баровых"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Attain = "52"
Inst20Quest7_HORDE_Aim = "Отправляйтесь в Некроситет и добудьте сокровище семьи Баровых. Оно состоит из четырех документов: на Каэр Дарроу, на Брилл, на Мельницу Таррен и на Южнобережье. После выполнения задания вернитесь к Алексию Барову."
Inst20Quest7_HORDE_Location = "Алексий Баров (Тирисфальские леса - Бастион; "..YELLOW.."80,73"..WHITE..")"
Inst20Quest7_HORDE_Note = "Вы найдете Документы на Каэр Дарроу около "..YELLOW.."[12]"..WHITE..", Документы на Брилл около "..YELLOW.."[7]"..WHITE..", Документы на мельницу Таррен около "..YELLOW.."[4]"..WHITE.." и Документы на Южнобережье около "..YELLOW.."[1]"..WHITE.."."
Inst20Quest7_HORDE_Prequest = "Нет"
Inst20Quest7_HORDE_Folgequest = "Последний из Баровых"
--
Inst20Quest7name1_HORDE = "Barov Peasant Caller"

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst20Quest8_HORDE = Inst20Quest8
Inst20Quest8_HORDE_Level = Inst20Quest8_Level
Inst20Quest8_HORDE_Attain = Inst20Quest8_Attain
Inst20Quest8_HORDE_Aim = Inst20Quest8_Aim
Inst20Quest8_HORDE_Location = Inst20Quest8_Location
Inst20Quest8_HORDE_Note = Inst20Quest8_Note
Inst20Quest8_HORDE_Prequest = Inst20Quest8_Prequest
Inst20Quest8_HORDE_Folgequest = Inst20Quest8_Folgequest
Inst20Quest8PreQuest_HORDE = Inst20Quest8PreQuest
--
Inst20Quest8name1_HORDE = Inst20Quest8name1
Inst20Quest8name2_HORDE = Inst20Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst20Quest9_HORDE = Inst20Quest9
Inst20Quest9_HORDE_Level = Inst20Quest9_Level
Inst20Quest9_HORDE_Attain = Inst20Quest9_Attain
Inst20Quest9_HORDE_Aim = Inst20Quest9_Aim
Inst20Quest9_HORDE_Location = Inst20Quest9_Location
Inst20Quest9_HORDE_Note = Inst20Quest9_Note
Inst20Quest9_HORDE_Prequest = Inst20Quest9_Prequest
Inst20Quest9_HORDE_Folgequest = Inst20Quest9_Folgequest
Inst20Quest9PreQuest_HORDE = Inst20Quest9PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst20Quest10_HORDE = Inst20Quest10
Inst20Quest10_HORDE_Level = Inst20Quest10_Level
Inst20Quest10_HORDE_Attain = Inst20Quest10_Attain
Inst20Quest10_HORDE_Aim = Inst20Quest10_Aim
Inst20Quest10_HORDE_Location = Inst20Quest10_Location
Inst20Quest10_HORDE_Note = Inst20Quest10_Note
Inst20Quest10_HORDE_Prequest = Inst20Quest10_Prequest
Inst20Quest10_HORDE_Folgequest = Inst20Quest10_Folgequest
Inst20Quest10PreQuest_HORDE = Inst20Quest10PreQuest
-- No Rewards for this quest

--Quest 11 Horde
Inst20Quest11_HORDE = "11. Угроза Темного Губителя (Шаман)"
Inst20Quest11_HORDE_Level = "60"
Inst20Quest11_HORDE_Attain = "58"
Inst20Quest11_HORDE_Aim = "Используйте кристальный предсказатель в Главном склепе в Некроситете. Сразитесь с духами. Когда появится Темный Терзатель, убейте его.\n\nПринесите голову Темного Терзателя Сагорну Гривастому Страннику в Аллею Мудрости Оргриммара."
Inst20Quest11_HORDE_Location = "Сагорн Гривастый Странник (Оргриммар - Аллея мудрости; "..YELLOW.."38.6, 36.2"..WHITE..")"
Inst20Quest11_HORDE_Note = "Это задание доступно только шаманам. Предыдущие задания дает этот же NPC.\n\nРыцарь смерти Темный Терзатель призывается в "..YELLOW.."[5]"..WHITE.."."
Inst20Quest11_HORDE_Prequest = "Существенная помощь"
Inst20Quest11_HORDE_Folgequest = "Нет"
Inst20Quest11PreQuest_HORDE = "true"
--
Inst20Quest11name1_HORDE = "Skyfury Helm"

--Quest 12 Horde  (same as Quest 11 Alliance)
Inst20Quest12_HORDE = "12. Правая часть амулета Лорда Вальтхалака"
Inst20Quest12_HORDE_Level = Inst20Quest11_Level
Inst20Quest12_HORDE_Attain = Inst20Quest11_Attain
Inst20Quest12_HORDE_Aim = Inst20Quest11_Aim
Inst20Quest12_HORDE_Location = Inst20Quest11_Location
Inst20Quest12_HORDE_Note = Inst20Quest11_Note
Inst20Quest12_HORDE_Prequest = Inst20Quest11_Prequest
Inst20Quest12_HORDE_Folgequest = Inst20Quest11_Folgequest
Inst20Quest12PreQuest_HORDE = Inst20Quest11PreQuest
-- No Rewards for this quest



--------------- INST21 - Shadowfang Keep (SFK) ---------------

Inst21Story = "Во время Третьей Войны, волшебники Кирин Тора сражались против армии нежити Плети. Когда волшебники Даларана погибли в бою, они смогли возродиться после - прибавив свою былую мощь к растущей Плети. Недовольный недостатком прогресса (и вопреки советам его соратников) Архимаг выбрал Аругала для призыва внемировых сущностей, чтобы подкрепить уменьшающиеся силы Даларана. Призыв Аругала привел изголодавшихся воргенов в мир Азерота. Дикие зверолюди устроили резню не только Плети, но быстро принялись и за самих волшебников. Воргены осадили крепость дворянина, барона Сребролена. Расположенная на небольшой деревушкой Погребальных костров, крепость быстро была ввергнута во тьму и разруху. Помешавшись из-за чувства вины, Аругал усыновил воргенов как детей и уединился в заново окрещенной 'Крепости Темного Клыка'. Говорят, он все еще живет там, защищаемый своим огромным питомцем, Фенрусом - и преследуемый мстительным духом барона Сребролена."
Inst21Caption = "Крепость Темного Клыка"
Inst21QAA = "3 Задания"
Inst21QAH = "5 Задания"

--Quest 1 Alliance
Inst21Quest1 = "1. Испытание доблести (Паладин)"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "Возьмите список Джордана, добудьте немного древесины белокаменного дуба, партию очищенной руды Бэйлора, кузнечный молот Джордана и самоцвет Кора и отдайте их Джордану Стилвеллу в Стальгорне."
Inst21Quest1_Location = "Джордан Стилвелл (Дун Морог - Вход в Стальгорн; "..YELLOW.."52,36"..WHITE..")"
Inst21Quest1_Note = "Чтобы увидеть заметки щелкните на "..YELLOW.."[Информация: Испытание доблести]"..WHITE.."."
Inst21Quest1_Page = {2, "Только паладины могут получить это задание!\n\n1. Вы получите древесину белокаменного дуба у гоблинов-лесорубов в "..YELLOW.."[Мертвые копи]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n2. Для получения партии очищенной руды Бэйлора вы должны поговорить с Бэйлором Каменной Дланью (Озеро Модан - Телсамар; "..YELLOW.."35,44"..WHITE.."). Он даст вам задание 'Партия руды Бэйлора'. Вы найдете руду Джордана за деревом около "..YELLOW.."71,21"..WHITE.."\n\n3. Вы получите кузнечный молот Джордана в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." около "..YELLOW.."[3]"..WHITE..".\n\n4. Для получения самоцвета Кора Вам нужно пойти к Тандрису Ветропряду (Темные берега - Аубердин; "..YELLOW.."37,40"..WHITE..") и выполнить задание 'Поиск самоцвета Кора'. Для этого задания, вам нужно убивать Провидзев и Жриц Непроглядной пучины перед "..YELLOW.."[Непроглядная пучина]"..WHITE..". С них падает Оскверненный самоцвет Кора. Тандрис Ветропряд очистит его для вас.", };
Inst21Quest1_Prequest = "Фолиант Отваги -> Испытание доблести"
Inst21Quest1_Folgequest = "Испытание доблести"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "Verigan's Fist"

--Quest 2 Alliance
Inst21Quest2 = "2. Шар Соран'рука (Чернокнижник)"
Inst21Quest2_Level = "25"
Inst21Quest2_Attain = "20"
Inst21Quest2_Aim = "Соберите 3 фрагмента Соран'рука и 1 большой фрагмент Соран'рука и принесите их Доану Кархану в Степи."
Inst21Quest2_Location = "Доан Кархан (Степи; "..YELLOW.."49,57"..WHITE..")"
Inst21Quest2_Note = "Только чернокнижники могут взять это задание! Вы возьмете 3 фрагмента Соран'рука с Сумеречных Прислужников в "..YELLOW.."[Непроглядная пучина]"..WHITE..". Вы возьмете большой фрагмент Соран'рука в "..YELLOW.."[Крепость Темного Клыка]"..WHITE.." у Темных Душ Темного Клыка."
Inst21Quest2_Prequest = "Нет"
Inst21Quest2_Folgequest = "Нет"
--
Inst21Quest2name1 = "Orb of Soran'ruk"
Inst21Quest2name2 = "Staff of Soran'ruk"

--Quest 3 Alliance
Inst21Quest3 = "3. Не любовь витает в воздухе (а что-то иное!)"
Inst21Quest3_Level = "80"
Inst21Quest3_Attain = "75"
Inst21Quest3_Aim = "Принесите выцветшую открытку ко дню всех влюбленных инспектору Кромсу Гвоздезубу в Штормград."
Inst21Quest3_Location = "Падает с аптекаря Хаммела в Крепости Темного Клыка только раз в год одному персонажу."
Inst21Quest3_Note = "Это сезонное задание для Любовной лихорадки.\n\nИнспектор Кромс Гвоздезуб находится (Штормград - Торговый квартал; "..YELLOW.."61.7, 75.5"..WHITE..")."
Inst21Quest3_Prequest = "Нет"
Inst21Quest3_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde
Inst21Quest1_HORDE = "1. Пропавшие стражи смерти"
Inst21Quest1_HORDE_Level = "25"
Inst21Quest1_HORDE_Attain = "18"
Inst21Quest1_HORDE_Aim = "Найдите стражей смерти Адаманта и Винсента."
Inst21Quest1_HORDE_Location = "Верховный палач Хадрек (Серебряный бор - Гробница; "..YELLOW.."43,40"..WHITE..")"
Inst21Quest1_HORDE_Note = "Вы найдете стража смерти Адаманта около "..YELLOW.."[1]"..WHITE..". Страж смерти Винсент находится справа когда вы войдете во внутренний двор около "..YELLOW.."[3]"..WHITE.."."
Inst21Quest1_HORDE_Prequest = "Нет"
Inst21Quest1_HORDE_Folgequest = "Нет"
--
Inst21Quest1name1_HORDE = "Ghostly Mantle"

--Quest 2 Horde
Inst21Quest2_HORDE = "2. Книга Ура"
Inst21Quest2_HORDE_Level = "26"
Inst21Quest2_HORDE_Attain = "16"
Inst21Quest2_HORDE_Aim = "Принесите книгу Ура хранителю Бел'дугуру в Район Фармацевтов в Подгород."
Inst21Quest2_HORDE_Location = "Хранитель Бел'дугур (Подгород - Квартал фармацевтов; "..YELLOW.."53,54"..WHITE..")"
Inst21Quest2_HORDE_Note = "Вы найдете книгу около "..YELLOW.."[11]"..WHITE.." слева, когда вы войдете в комнату."
Inst21Quest2_HORDE_Prequest = "Нет"
Inst21Quest2_HORDE_Folgequest = "Нет"
--
Inst21Quest2name1_HORDE = "Grizzled Boots"
Inst21Quest2name2_HORDE = "Steel-clasped Bracers"

--Quest 3 Horde
Inst21Quest3_HORDE = "3. Смерть Аругалу!"
Inst21Quest3_HORDE_Level = "27"
Inst21Quest3_HORDE_Attain = "18"
Inst21Quest3_HORDE_Aim = "Убейте Аругала и принесите его голову Далару Ткачу Рассвета в Гробницу."
Inst21Quest3_HORDE_Location = "Далар Ткач Рассвета (Серебряный бор - Гробница; "..YELLOW.."44,39"..WHITE..")"
Inst21Quest3_HORDE_Note = "Вы найдете Архимага Аругала около "..YELLOW.."[13]"..WHITE.."."
Inst21Quest3_HORDE_Prequest = "Нет"
Inst21Quest3_HORDE_Folgequest = "Нет"
--
Inst21Quest3name1_HORDE = "Seal of Sylvanas"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst21Quest4_HORDE = "4. Шар Соран'рука (Чернокнижник)"
Inst21Quest4_HORDE_Level = Inst21Quest2_Level
Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
Inst21Quest4_HORDE_Location = Inst21Quest2_Location
Inst21Quest4_HORDE_Note = Inst21Quest2_Note
Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
--
Inst21Quest4name1_HORDE = Inst21Quest2name1
Inst21Quest4name2_HORDE = Inst21Quest2name1

--Quest 5 Horde
Inst21Quest5_HORDE = "5. Не любовь витает в воздухе (а что-то иное!)"
Inst21Quest5_HORDE_Level = "80"
Inst21Quest5_HORDE_Attain = "75"
Inst21Quest5_HORDE_Aim = "Принесите выцветшую открытку ко дню всех влюбленных детективу Крямсу Гвоздезубу в Оргриммар."
Inst21Quest5_HORDE_Location = "Падает с аптекаря Хаммела в Крепости Темного Клыка только раз в год одному персонажу."
Inst21Quest5_HORDE_Note = "Это сезонное задание для Любовной лихорадки.\n\nДетектив Крямс Гвоздезуб находится (Оргриммар - Аллея Силы; "..YELLOW.."50.8, 65.6"..WHITE..")."
Inst21Quest5_HORDE_Prequest = "Нет"
Inst21Quest5_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST22 - Stratholme (Strat) ---------------

Inst22Story = "Когда-то он был жемчужиной северного Лордерона, город Стратхольм, именно тут принц Артес пошел против своего наставника, Утера Несущего Свет, и устроил бойню сотен своих собственных подданных, зараженных ,как он верил, ужасносной чумой нежити. Стремительное падение Артеса и окончательный переход на сторону Короля-лича последовали потом. В разрушенном городе теперь обитает нежить Плети - ведомая могущественным личем, Кель'тузедом. Личный состав Алого ордена, под руководством Grand Crusader Dathrohan, также захватил часть уничтоженного города. Две стороны увязли в непрекращающейся, ожесточенной битве. Искатели приключений, достаточно отважные (или безмозглые), чтобы войти в Стратхольм, столкнуться с противодействием и тех, и других. Поговаривают, что город охраняется тремя огромными смотровыми башнями, а также сильными некромантами, баньши и мерзостями. Также есть свидетельства того, что пагубный рыцарь смерти разъезжает по дьявольской конюшне - без разбору обрушивая свой гнев на головы тех, кто вторгся во владения Плети."
Inst22Caption = "Стратхольм"
Inst22QAA = "18 Заданий"
Inst22QAH = "20 Заданий"

--Quest 1 Alliance
Inst22Quest1 = "1. Плоть не лжет"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "55"
Inst22Quest1_Aim = "Принесите 10 препаратов чумной плоти из Стратхольма Бетине Биггльцинк. Предположительно, любая тварь из Стратхольма сойдет за препарат."
Inst22Quest1_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest1_Note = "Сбольшинства существ в Стратхольме падают препараты чумной плоти, но шанс очень мал."
Inst22Quest1_Prequest = "Нет"
Inst22Quest1_Folgequest = "Вирус чумы"
-- No Rewards for this quest

--Quest 2 Alliance
Inst22Quest2 = "2. Вирус чумы"
Inst22Quest2_Level = "60"
Inst22Quest2_Attain = "55"
Inst22Quest2_Aim = "Отправляйтесь в Стратхольм и исследуйте зиккураты. Доставьте сведения о Плети Бетине Биггльцинк."
Inst22Quest2_Location = "Бетина Биггльцинк (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest2_Note = "Сведения о плети находятся в одной из 3 Башен, которые вы найдете около "..YELLOW.."[15]"..WHITE..", "..YELLOW.."[16]"..WHITE.." and "..YELLOW.."[17]"..WHITE.."."
Inst22Quest2_Prequest = "Плоть не лжет"
Inst22Quest2_Folgequest = "Нет"
Inst22Quest2FQuest = "true"
--
Inst22Quest2name1 = "Seal of the Dawn"
Inst22Quest2name2 = "Rune of the Dawn"

--Quest 3 Alliance
Inst22Quest3 = "3. Святая вода"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "55"
Inst22Quest3_Aim = "Отправляйтесь на север, в Стратхольм. Обыщите брошенные ящики с припасами и соберите 5 мер святой воды Стратхольма. Возвращайтесь к Леониду Бартоломею Чтимому, как только воды будет достаточно."
Inst22Quest3_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest3_Note = "Вы найдете святую воду в ящиках по всему Стратхольму. При открытии некоторых появятся насекомые и атакуют вас."
Inst22Quest3_Prequest = "Нет"
Inst22Quest3_Folgequest = "Нет"
--
Inst22Quest3name1 = "Superior Healing Potion"
Inst22Quest3name2 = "Greater Mana Potion"
Inst22Quest3name3 = "Crown of the Penitent"
Inst22Quest3name4 = "Band of the Penitent"

--Quest 4 Alliance
Inst22Quest4 = "4. Великий Фрас Сиаби"
Inst22Quest4_Level = "60"
Inst22Quest4_Attain = "55"
Inst22Quest4_Aim = "Найдите табачную лавку Фраса Сиаби в Стратхольме, отыщите в ней пачку лучшего табака Сиаби и принесите ее Дымку ЛаРу."
Inst22Quest4_Location = "Дымок ЛаРу (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest4_Note = "Вы найдете табачную лавку около "..YELLOW.."[1]"..WHITE..". Фрас Сиаби появится когда вы откроете коробку."
Inst22Quest4_Prequest = "Нет"
Inst22Quest4_Folgequest = "Нет"
--
Inst22Quest4name1 = "Smokey's Lighter"

--Quest 5 Alliance
Inst22Quest5 = "5. Мятущиеся души"
Inst22Quest5_Level = "60"
Inst22Quest5_Attain = "55"
Inst22Quest5_Aim = "Стреляйте в призраков и неупокоенных на улицах Стратхольма из излучателя Эгана. Когда душа вырвется из призрачной оболочки, выстрелите в нее еще раз, и она обретет свободу."
Inst22Quest5_Location = "Эган (Восточные Чумные земли; "..YELLOW.."14,33"..WHITE..")"
Inst22Quest5_Note = "Вы возьмете предшествующее задание у управляющего Алена (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."79,63"..WHITE.."). Призраки и неупокоенные бродят по улицам Стратхольма."
Inst22Quest5_Prequest = "Мятущиеся души"
Inst22Quest5_Folgequest = "Нет"
Inst22Quest5PreQuest = "true"
--
Inst22Quest5name1 = "Testament of Hope"

--Quest 6 Alliance
Inst22Quest6 = "6. О любви и семье"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "52"
Inst22Quest6_Aim = "Отправляйтесь в Статхольм в северную часть Лихоземья. Найдите в Бастионе Алого ордена картину 'О любви и семье', спрятанную за другой, изображающей две луны нашего мира."
Inst22Quest6_Location = "Художница Ренфри (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."65,75"..WHITE..")"
Inst22Quest6_Note = "Вы возьмете предшествующее задание у Тириона Фордринга (Западные Чумные земли; "..YELLOW.."7,43"..WHITE.."). Вы сможете найти картину около "..YELLOW.."[10]"..WHITE.."."
Inst22Quest6_Prequest = "Искупление - > О любви и семье"
Inst22Quest6_Folgequest = "Найти Миранду"
Inst22Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst22Quest7 = "7. Дар Менетила"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "57"
Inst22Quest7_Aim = "Отправляйтесь в Стратхольм и отыщите Дар Менетила. Положите книгу Воспоминаний на оскверненную землю."
Inst22Quest7_Location = "Леонид Барталомей Чтимый (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."80,58"..WHITE..")"
Inst22Quest7_Note = "Вы возьмете предшествующее задание у мирового судьи Мардука (Западные Чумные земли - Каэр Дарроу; "..YELLOW.."70,73"..WHITE.."). Вы найдете знак около "..YELLOW.."[19]"..WHITE..". Смотрите также: "..YELLOW.."[Рас Снегошепот – лич]"..WHITE.." в Некроситете."
Inst22Quest7_Prequest = "Рас Ледяной Шепот – человек - > Рас Ледяной Шепот – гибель"
Inst22Quest7_Folgequest = "Дар Менетила"
Inst22Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst22Quest8 = "8. Слова Аурия"
Inst22Quest8_Level = "60"
Inst22Quest8_Attain = "56"
Inst22Quest8_Aim = "Убейте барона."
Inst22Quest8_Location = "Аурий (Стратхольм; "..YELLOW.."[13]"..WHITE..")"
Inst22Quest8_Note = "Чтобы начать выполнение задания вы должны отдать Аурию [Медальон Веры]. Вы получите медальон из сундука (Сейф Малора "..YELLOW.."[7]"..WHITE..") в первой комнате крепости (до того как дороги разойдутся). После того, как вы отдадите Аурию медальон, он поможет вашей группе сражаться против Барона "..YELLOW.."[19]"..WHITE..". После убийства Барона в должны снова поговорить с Аурием, чтобы получить награду."
Inst22Quest8_Prequest = "Нет"
Inst22Quest8_Folgequest = "Нет"
--
Inst22Quest8name1 = "Will of the Martyr"
Inst22Quest8name2 = "Blood of the Martyr"

--Quest 9 Alliance
Inst22Quest9 = "9. Архивариус"
Inst22Quest9_Level = "60"
Inst22Quest9_Attain = "55"
Inst22Quest9_Aim = "Отправляйтесь в Стратхольм и отыщите архивариуса Галфорда из Алого ордена. Убейте его и сожгите архив Алых."
Inst22Quest9_Location = "Герцог Николас Зверенхофф (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest9_Note = "Вы найдете архив и архивариуса около "..YELLOW.."[10]"..WHITE.."."
Inst22Quest9_Prequest = "Нет"
Inst22Quest9_Folgequest = "Ошеломляющая истина"
-- No Rewards for this quest

--Quest 10 Alliance
Inst22Quest10 = "10. Ошеломляющая истина"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "55"
Inst22Quest10_Aim = "Отнесите голову Бальназара герцогу Николасу Зверенхоффу в Восточные Чумные земли."
Inst22Quest10_Location = "Бальназар (Стратхольм; "..YELLOW.."[11]"..WHITE..")"
Inst22Quest10_Note = "Вы найдете герцога Николаса Зверенхоффа в Восточные Чумные земли - Часовня Последней Надежды ("..YELLOW.."81,59"..WHITE..")."
Inst22Quest10_Prequest = "Архивариус"
Inst22Quest10_Folgequest = "Быстрее, выше, сильнее"
Inst22Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst22Quest11 = "11. Быстрее, выше, сильнее"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "55"
Inst22Quest11_Aim = "Отправляйтесь в Стратхольм и убейте барона Ривендера. Принесите его голову герцогу Николасу Зверенхоффу."
Inst22Quest11_Location = "Герцог Николас Зверенхофф (Восточные Чумные земли - Часовня Последней Надежды; "..YELLOW.."81,59"..WHITE..")"
Inst22Quest11_Note = "Вы можете найти барона около "..YELLOW.."[19]"..WHITE.."."
Inst22Quest11_Prequest = "Ошеломляющая истина"
Inst22Quest11_Folgequest = "Лорд Максвелл Тиросс -> Серебряный Оплот"
Inst22Quest11FQuest = "true"
--
Inst22Quest11name1 = "Argent Defender"
Inst22Quest11name2 = "Argent Crusader"
Inst22Quest11name3 = "Argent Avenger"

--Quest 12 Alliance
Inst22Quest12 = "12. Просьба мертвеца"
Inst22Quest12_Level = "60"
Inst22Quest12_Attain = "58"
Inst22Quest12_Aim = "Отправляйтесь в Стратхольм и спасите Исиду Хармон от Барона Ривендера."
Inst22Quest12_Location = "Антион Хармон (Восточные Чумные земли - Стратхольм)"
Inst22Quest12_Note = "Антион стоит снаружи портала Стратхольма. Вам нужен Спектральный сканер иных измерений, чтобы увидеть его. Вы получите его выполнив предшествующее задание. Серия заданий начинается с 'Справедливое вознаграждение'. Делиана в Стальгорне ("..YELLOW.."43,52"..WHITE..") для Альянса, Моквар в Оргриммаре ("..YELLOW.."38,37"..WHITE..") для Орды.\nЭто печально известный '45-минутный забег к барону'."
Inst22Quest12_Prequest = "В поисках Антиона"
Inst22Quest12_Folgequest = "Доказательство жизни"
Inst22Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst22Quest13 = "13. Левая часть амулета Лорда Вальтхалака"
Inst22Quest13_Level = "60"
Inst22Quest13_Attain = "58"
Inst22Quest13_Aim = "Вызвать духов Джариен и Сотоса с помощью жаровни Призыва и убить их обоих. Вернуться к Бодли в Черную гору, отдать ему левую часть амулета Лорда Вальтхалака и жаровню Призыва."
Inst22Quest13_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst22Quest13_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nДжариен и Сотос призываются около "..YELLOW.."[11]"..WHITE.."."
Inst22Quest13_Prequest = "Важная составляющая заклинания"
Inst22Quest13_Folgequest = "Я вижу остров Алькац..."
Inst22Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst22Quest14 = "14. Правая часть амулета Лорда Вальтхалака"
Inst22Quest14_Level = "60"
Inst22Quest14_Attain = "58"
Inst22Quest14_Aim = "Вызвать духов Джариен и Сотоса с помощью жаровни Призыва и убить их обоих. Вернуться к Бодли в Черную гору, отдать ему восстановленный амулет и жаровню Призыва."
Inst22Quest14_Location = "Бодли (Черная гора; "..YELLOW.."[D] на карте входа"..WHITE..")"
Inst22Quest14_Note = "Чтобы увидеть Бодли нужен Спектральный сканер иных измерений. Вы получите его в задании 'В поисках Антиона'.\n\nДжариен и Сотос призываются около "..YELLOW.."[11]"..WHITE.."."
Inst22Quest14_Prequest = "Еще одна важная составляющая заклинания"
Inst22Quest14_Folgequest = "Последние приготовления ("..YELLOW.."Верхний ярус Черной горы"..WHITE..")"
Inst22Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst22Quest15 = "15. Атиеш, большой посох Стража"
Inst22Quest15_Level = "60"
Inst22Quest15_Attain = "60"
Inst22Quest15_Aim = "Анахронос из Пещер Времени, что в Танарисе, просит вас отнести Атиеш, большой посох Стража, в Стратхольм и установить его на освященную землю. Одолейте силу, которая исторгнется из посоха, и вернитесь к Анахроносу."
Inst22Quest15_Location = "Анахронос (Танарис - Пещеры времени; "..YELLOW.."65,49"..WHITE..")"
Inst22Quest15_Note = "Атиеш призывается около "..YELLOW.."[2]"..WHITE..". Задание не может быть выполнено, если у вас есть дополнение Lich King. Только тот кто имеет квест-итем может помочь вам выполнить его"
Inst22Quest15_Prequest = "Да"
Inst22Quest15_Folgequest = "Нет"
Inst22Quest15PreQuest = "true"
--
Inst22Quest15name1 = "Атиеш, большой посох Стража"
Inst22Quest15name2 = "Атиеш, большой посох Стража"
Inst22Quest15name3 = "Атиеш, большой посох Стража"
Inst22Quest15name4 = "Атиеш, большой посох Стража"

--Quest 16 Alliance
Inst22Quest16 = "16. Скверна (Кузнец)"
Inst22Quest16_Level = "60"
Inst22Quest16_Attain = "50"
Inst22Quest16_Aim = "Найдите в Стартхольме оружейника Черной Стражи и уничтожьте его. Возьмите его Знак Черной Стражи и принесите Сирилу Плетебою."
Inst22Quest16_Location = "Сирил Плетебой (Зимние Ключи - Круговзор; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest16_Note = "Оружейник Черной Стражи призывается около "..YELLOW.."[15]"..WHITE.."."
Inst22Quest16_Prequest = "Нет"
Inst22Quest16_Folgequest = "Нет"
--
Inst22Quest16name1 = "Plans: Blazing Rapier"

--Quest 17 Alliance
Inst22Quest17 = "17. Секрет безмятежности (Кузнец)"
Inst22Quest17_Level = "60"
Inst22Quest17_Attain = "51"
Inst22Quest17_Aim = "Отправляйтесь в Стратхольм и убейте Молотобойца из Багрового легиона. Возьмите его фартук и возвращайтесь к Лилит."
Inst22Quest17_Location = "Лилит Гибкая (Зимние Ключи - Круговзор; "..YELLOW.."61,37"..WHITE..")"
Inst22Quest17_Note = "Молотобоец из Багрового легиона призывается около "..YELLOW.."[8]"..WHITE.."."
Inst22Quest17_Prequest = "Нет"
Inst22Quest17_Folgequest = "Нет"
--
Inst22Quest17name1 = "Plans: Enchanted Battlehammer"

--Quest 18 Alliance
Inst22Quest18 = "18. Баланс Света и Тени (Жрец)"
Inst22Quest18_Level = "60"
Inst22Quest18_Attain = "60"
Inst22Quest18_Aim = "Спасите жизни 50 крестьян прежде, чем 15 из них будут убиты. Поговорите с Эрис Тайнопламень по выполнению задания."
Inst22Quest18_Location = "Эрис Тайнопламень (Восточные Чумные земли; "..YELLOW.."21,18"..WHITE..")"
Inst22Quest18_Note = "Чтобы увидеть Эрис Тайнопламень и взять задание, вам нужно или Око Божественности (из Тайника повелителя огня в "..YELLOW.."[Расплавленные недра]"..WHITE..").\n\nИз нее, при объединении с Оком Божественности и Оком Тени (падает с демонов в Зимних Ключах или Выжженных землях) получается Благодарение, эпический жреческий посох."
Inst22Quest18_Prequest = "Нет"
Inst22Quest18_Folgequest = "Нет"
Inst22Quest18PreQuest = "true"
--
Inst22Quest18name1 = "Splinter of Nordrassil"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst22Quest1_HORDE = Inst22Quest1
Inst22Quest1_HORDE_Level = Inst22Quest1_Level
Inst22Quest1_HORDE_Attain = Inst22Quest1_Attain
Inst22Quest1_HORDE_Aim = Inst22Quest1_Aim
Inst22Quest1_HORDE_Location = Inst22Quest1_Location
Inst22Quest1_HORDE_Note = Inst22Quest1_Note
Inst22Quest1_HORDE_Prequest = Inst22Quest1_Prequest
Inst22Quest1_HORDE_Folgequest = Inst22Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst22Quest2_HORDE = Inst22Quest2
Inst22Quest2_HORDE_Level = Inst22Quest2_Level
Inst22Quest2_HORDE_Attain = Inst22Quest2_Attain
Inst22Quest2_HORDE_Aim = Inst22Quest2_Aim
Inst22Quest2_HORDE_Location = Inst22Quest2_Location
Inst22Quest2_HORDE_Note = Inst22Quest2_Note
Inst22Quest2_HORDE_Prequest = Inst22Quest2_Prequest
Inst22Quest2_HORDE_Folgequest = Inst22Quest2_Folgequest
Inst22Quest2FQuest_HORDE = Inst22Quest2FQuest
--
Inst22Quest2name1_HORDE = Inst22Quest2name1
Inst22Quest2name2_HORDE = Inst22Quest2name2

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst22Quest3_HORDE = Inst22Quest3
Inst22Quest3_HORDE_Level = Inst22Quest3_Level
Inst22Quest3_HORDE_Attain = Inst22Quest3_Attain
Inst22Quest3_HORDE_Aim = Inst22Quest3_Aim
Inst22Quest3_HORDE_Location = Inst22Quest3_Location
Inst22Quest3_HORDE_Note = Inst22Quest3_Note
Inst22Quest3_HORDE_Prequest = Inst22Quest3_Prequest
Inst22Quest3_HORDE_Folgequest = Inst22Quest3_Folgequest
--
Inst22Quest3name1_HORDE = Inst22Quest3name1
Inst22Quest3name2_HORDE = Inst22Quest3name2
Inst22Quest3name3_HORDE = Inst22Quest3name3
Inst22Quest3name4_HORDE = Inst22Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst22Quest4_HORDE = Inst22Quest4
Inst22Quest4_HORDE_Level = Inst22Quest4_Level
Inst22Quest4_HORDE_Attain = Inst22Quest4_Attain
Inst22Quest4_HORDE_Aim = Inst22Quest4_Aim
Inst22Quest4_HORDE_Location = Inst22Quest4_Location
Inst22Quest4_HORDE_Note = Inst22Quest4_Note
Inst22Quest4_HORDE_Prequest = Inst22Quest4_Prequest
Inst22Quest4_HORDE_Folgequest = Inst22Quest4_Folgequest
--
Inst22Quest4name1_HORDE = Inst22Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst22Quest5_HORDE = Inst22Quest5
Inst22Quest5_HORDE_Level = Inst22Quest5_Level
Inst22Quest5_HORDE_Attain = Inst22Quest5_Attain
Inst22Quest5_HORDE_Aim = Inst22Quest5_Aim
Inst22Quest5_HORDE_Location = Inst22Quest5_Location
Inst22Quest5_HORDE_Note = Inst22Quest5_Note
Inst22Quest5_HORDE_Prequest = Inst22Quest5_Prequest
Inst22Quest5_HORDE_Folgequest = Inst22Quest5_Folgequest
Inst22Quest5PreQuest_HORDE = Inst22Quest5PreQuest
--
Inst22Quest5name1_HORDE = Inst22Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst22Quest6_HORDE = Inst22Quest6
Inst22Quest6_HORDE_Level = Inst22Quest6_Level
Inst22Quest6_HORDE_Attain = Inst22Quest6_Attain
Inst22Quest6_HORDE_Aim = Inst22Quest6_Aim
Inst22Quest6_HORDE_Location = Inst22Quest6_Location
Inst22Quest6_HORDE_Note = Inst22Quest6_Note
Inst22Quest6_HORDE_Prequest = Inst22Quest6_Prequest
Inst22Quest6_HORDE_Folgequest = Inst22Quest6_Folgequest
Inst22Quest6PreQuest_HORDE = Inst22Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst22Quest7_HORDE = Inst22Quest7
Inst22Quest7_HORDE_Level = Inst22Quest7_Level
Inst22Quest7_HORDE_Attain = Inst22Quest7_Attain
Inst22Quest7_HORDE_Aim = Inst22Quest7_Aim
Inst22Quest7_HORDE_Location = Inst22Quest7_Location
Inst22Quest7_HORDE_Note = Inst22Quest7_Note
Inst22Quest7_HORDE_Prequest = Inst22Quest7_Prequest
Inst22Quest7_HORDE_Folgequest = Inst22Quest7_Folgequest
Inst22Quest7PreQuest_HORDE = Inst22Quest7PreQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst22Quest8_HORDE = Inst22Quest8
Inst22Quest8_HORDE_Level = Inst22Quest8_Level
Inst22Quest8_HORDE_Attain = Inst22Quest8_Attain
Inst22Quest8_HORDE_Aim = Inst22Quest8_Aim
Inst22Quest8_HORDE_Location = Inst22Quest8_Location
Inst22Quest8_HORDE_Note = Inst22Quest8_Note
Inst22Quest8_HORDE_Prequest = Inst22Quest8_Prequest
Inst22Quest8_HORDE_Folgequest = Inst22Quest8_Folgequest
--
Inst22Quest8name1_HORDE = Inst22Quest8name1
Inst22Quest8name2_HORDE = Inst22Quest8name2

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst22Quest9_HORDE = Inst22Quest9
Inst22Quest9_HORDE_Level = Inst22Quest9_Level
Inst22Quest9_HORDE_Attain = Inst22Quest9_Attain
Inst22Quest9_HORDE_Aim = Inst22Quest9_Aim
Inst22Quest9_HORDE_Location = Inst22Quest9_Location
Inst22Quest9_HORDE_Note = Inst22Quest9_Note
Inst22Quest9_HORDE_Prequest = Inst22Quest9_Prequest
Inst22Quest9_HORDE_Folgequest = Inst22Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst22Quest10_HORDE = Inst22Quest10
Inst22Quest10_HORDE_Level = Inst22Quest10_Level
Inst22Quest10_HORDE_Attain = Inst22Quest10_Attain
Inst22Quest10_HORDE_Aim = Inst22Quest10_Aim
Inst22Quest10_HORDE_Location = Inst22Quest10_Location
Inst22Quest10_HORDE_Note = Inst22Quest10_Note
Inst22Quest10_HORDE_Prequest = Inst22Quest10_Prequest
Inst22Quest10_HORDE_Folgequest = Inst22Quest10_Folgequest
Inst22Quest10FQuest_HORDE = Inst22Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst22Quest11_HORDE = Inst22Quest11
Inst22Quest11_HORDE_Level = Inst22Quest11_Level
Inst22Quest11_HORDE_Attain = Inst22Quest11_Attain
Inst22Quest11_HORDE_Aim = Inst22Quest11_Aim
Inst22Quest11_HORDE_Location = Inst22Quest11_Location
Inst22Quest11_HORDE_Note = Inst22Quest11_Note
Inst22Quest11_HORDE_Prequest = Inst22Quest11_Prequest
Inst22Quest11_HORDE_Folgequest = Inst22Quest11_Folgequest
Inst22Quest11FQuest_HORDE = Inst22Quest11FQuest
--
Inst22Quest11name1_HORDE = Inst22Quest11name1
Inst22Quest11name2_HORDE = Inst22Quest11name2
Inst22Quest11name3_HORDE = Inst22Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst22Quest12_HORDE = Inst22Quest12
Inst22Quest12_HORDE_Level = Inst22Quest12_Level
Inst22Quest12_HORDE_Attain = Inst22Quest12_Attain
Inst22Quest12_HORDE_Aim = Inst22Quest12_Aim
Inst22Quest12_HORDE_Location = Inst22Quest12_Location
Inst22Quest12_HORDE_Note = Inst22Quest12_Note
Inst22Quest12_HORDE_Prequest = Inst22Quest12_Prequest
Inst22Quest12_HORDE_Folgequest = Inst22Quest12_Folgequest
Inst22Quest12PreQuest_HORDE = Inst22Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst22Quest13_HORDE = Inst22Quest13
Inst22Quest13_HORDE_Level = Inst22Quest13_Level
Inst22Quest13_HORDE_Attain = Inst22Quest13_Attain
Inst22Quest13_HORDE_Aim = Inst22Quest13_Aim
Inst22Quest13_HORDE_Location = Inst22Quest13_Location
Inst22Quest13_HORDE_Note = Inst22Quest13_Note
Inst22Quest13_HORDE_Prequest = Inst22Quest13_Prequest
Inst22Quest13_HORDE_Folgequest = Inst22Quest13_Folgequest
Inst22Quest13PreQuest_HORDE = Inst22Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst22Quest14_HORDE = Inst22Quest14
Inst22Quest14_HORDE_Level = Inst22Quest14_Level
Inst22Quest14_HORDE_Attain = Inst22Quest14_Attain
Inst22Quest14_HORDE_Aim = Inst22Quest14_Aim
Inst22Quest14_HORDE_Location = Inst22Quest14_Location
Inst22Quest14_HORDE_Note = Inst22Quest14_Note
Inst22Quest14_HORDE_Prequest = Inst22Quest14_Prequest
Inst22Quest14_HORDE_Folgequest = Inst22Quest14_Folgequest
Inst22Quest14PreQuest_HORDE = Inst22Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst22Quest15_HORDE = Inst22Quest15
Inst22Quest15_HORDE_Level = Inst22Quest15_Level
Inst22Quest15_HORDE_Attain = Inst22Quest15_Attain
Inst22Quest15_HORDE_Aim = Inst22Quest15_Aim
Inst22Quest15_HORDE_Location = Inst22Quest15_Location
Inst22Quest15_HORDE_Note = Inst22Quest15_Note
Inst22Quest15_HORDE_Prequest = Inst22Quest15_Prequest
Inst22Quest15_HORDE_Folgequest = Inst22Quest15_Folgequest
Inst22Quest15PreQuest_HORDE = Inst22Quest15PreQuest
--
Inst22Quest15name1_HORDE = Inst22Quest15name1
Inst22Quest15name2_HORDE = Inst22Quest15name2
Inst22Quest15name3_HORDE = Inst22Quest15name3
Inst22Quest15name4_HORDE = Inst22Quest15name4

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst22Quest16_HORDE = Inst22Quest16
Inst22Quest16_HORDE_Level = Inst22Quest16_Level
Inst22Quest16_HORDE_Attain = Inst22Quest16_Attain
Inst22Quest16_HORDE_Aim = Inst22Quest16_Aim
Inst22Quest16_HORDE_Location = Inst22Quest16_Location
Inst22Quest16_HORDE_Note = Inst22Quest16_Note
Inst22Quest16_HORDE_Prequest = Inst22Quest16_Prequest
Inst22Quest16_HORDE_Folgequest = Inst22Quest16_Folgequest
--
Inst22Quest16name1_HORDE = Inst22Quest16name1

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst22Quest17_HORDE = Inst22Quest17
Inst22Quest17_HORDE_Level = Inst22Quest17_Level
Inst22Quest17_HORDE_Attain = Inst22Quest17_Attain
Inst22Quest17_HORDE_Aim = Inst22Quest17_Aim
Inst22Quest17_HORDE_Location = Inst22Quest17_Location
Inst22Quest17_HORDE_Note = Inst22Quest17_Note
Inst22Quest17_HORDE_Prequest = Inst22Quest17_Prequest
Inst22Quest17_HORDE_Folgequest = Inst22Quest17_Folgequest
--
Inst22Quest17name1_HORDE = Inst22Quest17name1

--Quest 18 Horde
Inst22Quest18_HORDE = "18. Рамштейн"
Inst22Quest18_HORDE_Level = "60"
Inst22Quest18_HORDE_Attain = "56"
Inst22Quest18_HORDE_Aim = "Отправляйтесь в Стратхольм и убейте Рамштайна Ненасытного. Принесите его голову Натаносу в качестве сувенира."
Inst22Quest18_HORDE_Location = "Натанос Гниль (Восточные Чумные земли; "..YELLOW.."26,74"..WHITE..")"
Inst22Quest18_HORDE_Note = "Вы возьмете предшествующее задание также у Натаноса Гнили. Вы найдете Рамштайна около "..YELLOW.."[18]"..WHITE.."."
Inst22Quest18_HORDE_Prequest = "Охота на cледопытов -> Проклятый Тенекрыл"
Inst22Quest18_HORDE_Folgequest = "Нет"
Inst22Quest18PreQuest_HORDE = "true"
--
Inst22Quest18name1_HORDE = "Royal Seal of Alexis"
Inst22Quest18name2_HORDE = "Elemental Circle"

--Quest 19 Horde  (same as Quest 18 Alliance)
Inst22Quest19_HORDE = "19. Баланс Света и Тени (Жрец)"
Inst22Quest19_HORDE_Level = Inst22Quest18_Level
Inst22Quest19_HORDE_Attain = Inst22Quest18_Attain
Inst22Quest19_HORDE_Aim = Inst22Quest18_Aim
Inst22Quest19_HORDE_Location = Inst22Quest18_Location
Inst22Quest19_HORDE_Note = Inst22Quest18_Note
Inst22Quest19_HORDE_Prequest = Inst22Quest18_Prequest
Inst22Quest19_HORDE_Folgequest = Inst22Quest18_Folgequest
Inst22Quest19PreQuest_HORDE = Inst22Quest18PreQuest
--
Inst22Quest19name1_HORDE = Inst22Quest18name1

--Quest 20 Horde
Inst22Quest20_HORDE = "20. Истинные владыки Света (Паладин)"
Inst22Quest20_HORDE_Level = "60"
Inst22Quest20_HORDE_Attain = "60"
Inst22Quest20_HORDE_Aim = "Потушите неугасимое пламя часовни Алонсия с помощью огнетушительной смеси и уничтожьте всех, кто попробует защитить часовню."
Inst22Quest20_HORDE_Location = "Лорд Соланар Кровогнев (Луносвет - Площадь Странников; "..YELLOW.."92.2, 38.7"..WHITE..")"
Inst22Quest20_HORDE_Note = "Часовни Алонсия находится "..YELLOW.."[13]"..WHITE..". Завершение этого задания даст паладину эпического верхового животного. Вы не можите начать это задание, если вы приобрели эту способность у тренера."
Inst22Quest20_HORDE_Prequest = "Призыв леди Лиадрин -> Истинные владыки Света"
Inst22Quest20_HORDE_Folgequest = "Нет"
Inst22Quest20PreQuest_HORDE = "true"
--
Inst22Quest20name1_HORDE = "Blood Knight Tabard"



--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------

Inst23Story = "В последние часы Войны зыбучих песков, объединенные силы ночных эльфов и четырех драконьих стай довели битву до самого сердца империи кираджи, в город-крепость Ан'Кираж. Еще у городских ворот, армии Калимдора встретились с концентрацией боевых трутней силитидов, намного превосходившей виденую когда-либо ранее. В конечном счете силитиды и их хозяева-кираджи так и не были побеждены, а только изолированы внутри магического барьера. Война оставила проклятый город в руинах. Тысяча лет прошла с того дня, но силы кираджи не сидели без дела. Новая ужасная армия родилась в ульях, и руины Ан'Киража снова кишат роями силитидов и кираджи. Эта угроза должна быть уничтожена, иначе весь Азерот может пасть перед ужасающей мощью новой армии кираджи."
Inst23Caption = "Руины Ан'Киража"
Inst23QAA = "2 Задания"
Inst23QAH = "2 Задания"

--Quest 1 Alliance
Inst23Quest1 = "1. Повергнутый Оссириан"
Inst23Quest1_Level = "60"
Inst23Quest1_Attain = "60"
Inst23Quest1_Aim = "Принесите голову Оссириана Неуязвимого командиру Мар'алиту в Крепость Ценариона."
Inst23Quest1_Location = "Голова Оссириана Неуязвимого (падает с Оссириана Неуязвимого; "..YELLOW.."[6]"..WHITE..")"
Inst23Quest1_Note = "Командир Мар'алит (Силитус - Крепость Ценариона; "..YELLOW.."49,34"..WHITE..")"
Inst23Quest1_Prequest = "Нет"
Inst23Quest1_Folgequest = "Нет"
--
Inst23Quest1name1 = "Charm of the Shifting Sands"
Inst23Quest1name2 = "Amulet of the Shifting Sands"
Inst23Quest1name3 = "Choker of the Shifting Sands"
Inst23Quest1name4 = "Pendant of the Shifting Sands"

--Quest 2 Alliance
Inst23Quest2 = "2. Идеальный яд"
Inst23Quest2_Level = "60"
Inst23Quest2_Attain = "60"
Inst23Quest2_Aim = "Дирк Громодрев из Крепости Ценариона попросил принести ему ядовитую железу Веноксиса и ядовитую железу Куриннакса."
Inst23Quest2_Location = "Дирк Громодрев (Силитус - Крепость Ценариона; "..YELLOW.."52,39"..WHITE..")"
Inst23Quest2_Note = "Ядовитая железа Веноксиса падает с Верховного жреца Веноксиса в "..YELLOW.."Зул'Гуруб"..WHITE..". Ядовитая железа Куриннакса падает в "..YELLOW.."Руины Ан'Киража"..WHITE.." около "..YELLOW.."[1]"..WHITE.."."
Inst23Quest2_Prequest = "Нет"
Inst23Quest2_Folgequest = "Нет"
--
Inst23Quest2name1 = "Ravenholdt Slicer"
Inst23Quest2name2 = "Shivsprocket's Shiv"
Inst23Quest2name3 = "The Thunderwood Poker"
Inst23Quest2name4 = "Doomulus Prime"
Inst23Quest2name5 = "Fahrad's Reloading Repeater"
Inst23Quest2name6 = "Simone's Cultivating Hammer"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst23Quest1_HORDE = Inst23Quest1
Inst23Quest1_HORDE_Level = Inst23Quest1_Level
Inst23Quest1_HORDE_Attain = Inst23Quest1_Attain
Inst23Quest1_HORDE_Aim = Inst23Quest1_Aim
Inst23Quest1_HORDE_Location = Inst23Quest1_Location
Inst23Quest1_HORDE_Note = Inst23Quest1_Note
Inst23Quest1_HORDE_Prequest = Inst23Quest1_Prequest
Inst23Quest1_HORDE_Folgequest = Inst23Quest1_Folgequest
--
Inst23Quest1name1_HORDE = Inst23Quest1name1
Inst23Quest1name2_HORDE = Inst23Quest1name2
Inst23Quest1name3_HORDE = Inst23Quest1name3
Inst23Quest1name4_HORDE = Inst23Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst23Quest2_HORDE = Inst23Quest2
Inst23Quest2_HORDE_Level = Inst23Quest2_Level
Inst23Quest2_HORDE_Attain = Inst23Quest2_Attain
Inst23Quest2_HORDE_Aim = Inst23Quest2_Aim
Inst23Quest2_HORDE_Location = Inst23Quest2_Location
Inst23Quest2_HORDE_Note = Inst23Quest2_Note
Inst23Quest2_HORDE_Prequest = Inst23Quest2_Prequest
Inst23Quest2_HORDE_Folgequest = Inst23Quest2_Folgequest
--
Inst23Quest2name1_HORDE = Inst23Quest2name1
Inst23Quest2name2_HORDE = Inst23Quest2name2
Inst23Quest2name3_HORDE = Inst23Quest2name3
Inst23Quest2name4_HORDE = Inst23Quest2name4
Inst23Quest2name5_HORDE = Inst23Quest2name5
Inst23Quest2name6_HORDE = Inst23Quest2name6



--------------- INST24 - The Stockade (Stocks) ---------------

Inst24Story = "Тюрьма - это хорошо защищенный тюремный комплекс, скрытый под районом каналов Штормграда. Под руководством тюремщика Телвотера, Тюрьма стала домом мелких жуликов, мятежников, убийц и пары десятков самых опасных преступников в стране. Недавно, поднятое заключенными восстание превратило Тюрьму бог знает во что - охранников выгнали, а осужденные разгуливают на свободе. Тюремщик Телвотер умудрился выбраться из зоны и теперь вербует отважных экстремалов совершить вылазку в тюрьму и убить вдохновителя восстания - опасного уголовника, Базиля Тредда."
Inst24Caption = "Тюрьма Штормграда"
Inst24QAA = "6 Заданий"
Inst24QAH = "Нет заданий"

--Quest 1 Alliance
Inst24Quest1 = "1. Что происходит?"
Inst24Quest1_Level = "25"
Inst24Quest1_Attain = "22"
Inst24Quest1_Aim = "Принесите голову Таргорра Ужасного стражнику Бертону в Приозерье."
Inst24Quest1_Location = "Стражник Бертон (Красногорье - Приозерье; "..YELLOW.."26,46"..WHITE..")"
Inst24Quest1_Note = "Вы найдете Таргорра около "..YELLOW.."[1]"..WHITE.."."
Inst24Quest1_Prequest = "Нет"
Inst24Quest1_Folgequest = "Нет"
--
Inst24Quest1name1 = "Lucine Longsword"
Inst24Quest1name2 = "Hardened Root Staff"

--Quest 2 Alliance
Inst24Quest2 = "2. Преступление и наказание"
Inst24Quest2_Level = "26"
Inst24Quest2_Attain = "22"
Inst24Quest2_Aim = "Принести советнику Миллстайпу руку Декстрена Варда."
Inst24Quest2_Location = "Миллстайп (Сумеречный лес - Темнолесье; "..YELLOW.."72,47"..WHITE..")"
Inst24Quest2_Note = "Вы найдете Декстрена около "..YELLOW.."[5]"..WHITE.."."
Inst24Quest2_Prequest = "Нет"
Inst24Quest2_Folgequest = "Нет"
--
Inst24Quest2name1 = "Ambassador's Boots"
Inst24Quest2name2 = "Темнолесье Mail Leggings"

--Quest 3 Alliance
Inst24Quest3 = "3. Подавление восстания"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "Тюремщик Телвотер просит вас убить в тюрьме 10 узников из Братства Справедливости, 8 каторжников из Братства Справедливости и 8 мятежников из Братства Справедливости."
Inst24Quest3_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."51.4, 68.8"..WHITE..")"
Inst24Quest3_Note = ""
Inst24Quest3_Prequest = "Нет"
Inst24Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst24Quest4 = "4. Цвет крови"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "22"
Inst24Quest4_Aim = "Принесите Никовии Раскол 10 красных шерстяных бандан."
Inst24Quest4_Location = "Никовия Раскол (Штормград - Старый город; "..YELLOW.."75.6, 62.9"..WHITE..")"
Inst24Quest4_Note = "Со всех бандитов внутри Тюрьмы могут упасть красные шерстяные банданы."
Inst24Quest4_Prequest = "Нет"
Inst24Quest4_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 5 Alliance
Inst24Quest5 = "5. Успокоить гневливого"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "22"
Inst24Quest5_Aim = "Принесите голову Кама Гневливого Мотли Каменщику в Дун Модр."
Inst24Quest5_Location = "Мотли Каменщик (Болотина - Дун Модр; "..YELLOW.."49,18"..WHITE..")"
Inst24Quest5_Note = "Предшествующее задание также можно взять у Мотли. Вы найдете Кама Гневливого около "..YELLOW.."[2]"..WHITE.."."
Inst24Quest5_Prequest = "Война с Черным Железом"
Inst24Quest5_Folgequest = "Нет"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "Belt of Vindication"
Inst24Quest5name2 = "Headbasher"

--Quest 6 Alliance
Inst24Quest6 = "6. Бунтовщики в тюрьме"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "Убейте Базиля Тредда и принесите его голову Телвотеру в тюрьму Штормграда."
Inst24Quest6_Location = "Тюремщик Телвотер (Штормград - Тюрьма Штормграда; "..YELLOW.."51.4, 68.8"..WHITE..")"
Inst24Quest6_Note = "Для более детальной информации о предшествующем задании смотрите "..YELLOW.."[Мертвые копи, Братство справедливости]"..WHITE..".\nВы найдете Базиля Тредда около "..YELLOW.."[4]"..WHITE.."."
Inst24Quest6_Prequest = "Братство Справедливости -> Базиль Тредд"
Inst24Quest6_Folgequest = "Таинственный посетитель"
Inst24Quest6PreQuest = "true"
-- No Rewards for this quest



--------------- INST25 - Sunken Temple (ST) ---------------

Inst25Story = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель Душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир. Великий дракон Аспект, Изера, узнала о планах Атал'аи и утопила храм в болотах. На сегодняшний день, затопленные руины храма охраняются зелеными драконами, которые следят за тем, чтобы никто не входил и не выходил оттуда. Однако, есть мнение, что несколько фанатичных Атал'аи могли выжить и сбежать от гнева Изеры - а теперь вновь посвятили себя темному служению Хаккару."
Inst25Caption = "Затонувший храм"
Inst25QAA = "17 Заданий"
Inst25QAH = "17 Заданий"

--Quest 1 Alliance
Inst25Quest1 = "1. В Храме Атал'Хаккара"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "38"
Inst25Quest1_Aim = "Соберите 10 табличек Аталаи для Брохана Бочкопуза из Штормграда."
Inst25Quest1_Location = "Брохан Бочкопуз (Штормград - Квартал дворфов; "..YELLOW.."69.5, 40.4"..WHITE..")"
Inst25Quest1_Note = "Серия предшествующих заданий начинается у того же НИП и имеет несколько этапов.\n\nВы сможете найти таблички по всему Храму, и внутри и снаружи подземелья."
Inst25Quest1_Prequest = "В поисках Храма -> Рапсодия о болоте"
Inst25Quest1_Folgequest = "Нет"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "Guardian Talisman"

--Quest 2 Alliance
Inst25Quest2 = "2. Затонувший храм"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "46"
Inst25Quest2_Aim = "Найдите Марвона Клепальщика в Танарисе."
Inst25Quest2_Location = "Ангелас Лунный Бриз (Фералас - Крепость Оперенной Луны; "..YELLOW.."31,45"..WHITE..")"
Inst25Quest2_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_Prequest = "Нет"
Inst25Quest2_Folgequest = "Круглый камень"
-- No Rewards for this quest

--Quest 3 Alliance
Inst25Quest3 = "3. Во глубине болот"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "46"
Inst25Quest3_Aim = "Найдите алтарь Хаккара в затонувшем храме на Болоте Печали."
Inst25Quest3_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest3_Note = "Алтарь находится около "..YELLOW.."[1]"..WHITE.."."
Inst25Quest3_Prequest = "Круглый камень"
Inst25Quest3_Folgequest = "Нет"
Inst25Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst25Quest4 = "4. Тайна камня"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "46"
Inst25Quest4_Aim = "Отправляйтесь в затонувший храм и узнайте, что скрывается в круге статуй."
Inst25Quest4_Location = "Марвон Клепальщик (Танарис; "..YELLOW.."52,45"..WHITE..")"
Inst25Quest4_Note = "Вы найдете статуи около "..YELLOW.."[1]"..WHITE..". Смотрите по карте порядок их активации."
Inst25Quest4_Prequest = "Круглый камень"
Inst25Quest4_Folgequest = "Нет"
Inst25Quest4FQuest = "true"
--
Inst25Quest4name1 = "Hakkari Urn"

--Quest 5 Alliance
Inst25Quest5 = "5. Туман зла"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "47"
Inst25Quest5_Aim = "Соберите 5 образцов тумана Аталаи и принесите их Майджину в Кратер Ун'Горо."
Inst25Quest5_Location = "Греган Пивоплюй (Фералас; "..YELLOW.."45,25"..WHITE..")"
Inst25Quest5_Note = "Предшествующее задание 'Майджин и Ларион' начинается у Майджина (Кратер Ун'Горо - Укрытие Маршалла; "..YELLOW.."42,9"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
Inst25Quest5_Prequest = "Майджин и Ларион -> Визит к Грегану "
Inst25Quest5_Folgequest = "Нет"
Inst25Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst25Quest6 = "6. Бог Хаккар"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "40"
Inst25Quest6_Aim = "Отнесите заполненное яйцо Хаккара Йе'кинье в Танарис."
Inst25Quest6_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
Inst25Quest6_Note = "Цепочка заданий начинается с 'Духи крикунов' у того же НИП (См. "..YELLOW.."[Зул'Фаррак]"..WHITE..").\nВы должны задействовать Яйцо около "..YELLOW.."[3]"..WHITE.." чтобы начать Событие. Когда оно начнется, появятся враги и атакуют вас. С некоторых их них падает Кровь Хаккара. С этой кровью вы можете убрать факелы вокруг круга. После этого появится Аватара Хаккара. Вы убьете ее и получите 'Сущность Хаккара' Которую используете, чтобы наполнить яйцо."
Inst25Quest6_Prequest = "Духи крикунов -> Древнее яйцо"
Inst25Quest6_Folgequest = "Нет"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "Avenguard Helm"
Inst25Quest6name2 = "Lifeforce Dirk"
Inst25Quest6name3 = "Gemburst Circlet"

--Quest 7 Alliance
Inst25Quest7 = "7. Джаммал'ан Пророк"
Inst25Quest7_Level = "53"
Inst25Quest7_Attain = "38"
Inst25Quest7_Aim = "Принесите изгнаннику Атал'ай из Внутренних земель голову Джаммал'ана."
Inst25Quest7_Location = "Изгнанник Атал'ай (Внутренние земли; "..YELLOW.."33,75"..WHITE..")"
Inst25Quest7_Note = "Вы найдете Джаммал'ана около "..YELLOW.."[4]"..WHITE.."."
Inst25Quest7_Prequest = "Нет"
Inst25Quest7_Folgequest = "Нет"
--
Inst25Quest7name1 = "Rainstrider Leggings"
Inst25Quest7name2 = "Helm of Exile"

--Quest 8 Alliance
Inst25Quest8 = "8. Сущность Эраникуса"
Inst25Quest8_Level = "55"
Inst25Quest8_Attain = "48"
Inst25Quest8_Aim = "Поместите сущность Эраникуса в купель сущности в его логове в затонувшем храме."
Inst25Quest8_Location = "Сущность Эраникуса (падает с Тени Эраникуса; "..YELLOW.."[6]"..WHITE..")"
Inst25Quest8_Note = "Вы найдете Купель сущности рядом с местом где находится Тень Эраникуса около "..YELLOW.."[6]"..WHITE.."."
Inst25Quest8_Prequest = "Нет"
Inst25Quest8_Folgequest = "Нет"
--
Inst25Quest8name1 = "Chained Essence of Eranikus"

--Quest 9 Alliance
Inst25Quest9 = "9. Тролли Пера (Чернокнижник)"
Inst25Quest9_Level = "52"
Inst25Quest9_Attain = "50"
Inst25Quest9_Aim = "Принесите 6 вудуистских перьев троллей из затонувшего храма."
Inst25Quest9_Location = "Бесенок (Оскверненный лес; "..YELLOW.."42,45"..WHITE..")"
Inst25Quest9_Note = "Задание для чернокнижников. 1 перо падает с каждого из поименованных троллей на галерее большой комнаты с дырой в центре."
Inst25Quest9_Prequest = "Просьба беса -> Бросовый материал"
Inst25Quest9_Folgequest = "Нет"
Inst25Quest9PreQuest = "true"
--
Inst25Quest9name1 = "Soul Harvester"
Inst25Quest9name2 = "Abyss Shard"
Inst25Quest9name3 = "Robes of Servitude"

--Quest 10 Alliance
Inst25Quest10 = "10. Вудуистские перья (Воитель)"
Inst25Quest10_Level = "52"
Inst25Quest10_Attain = "50"
Inst25Quest10_Aim = "Принесите вудуистские перья павшему герою Орды, забрав их у троллей в Затонувшем Храме."
Inst25Quest10_Location = "Павший герой Орды (Болото Печали; "..YELLOW.."34,66"..WHITE..")"
Inst25Quest10_Note = "Задание для воителей. 1 перо падает с каждого из поименованных троллей на галерее большой комнаты с дырой в центре."
Inst25Quest10_Prequest = "Неупокоенный дух -> Война против Приверженцев Тени"
Inst25Quest10_Folgequest = "Нет"
Inst25Quest10PreQuest = "true"
--
Inst25Quest10name1 = "Fury Visor"
Inst25Quest10name2 = "Diamond Flask"
Inst25Quest10name3 = "Razorsteel Shoulders"

--Quest 11 Alliance
Inst25Quest11 = "11. Вуду (Шаман)"
Inst25Quest11_Level = "52"
Inst25Quest11_Attain = "50"
Inst25Quest11_Aim = "Принесите вудуистские перья Бат'ре Ветростражу."
Inst25Quest11_Location = "Бат'ра Ветростраж (Альтеракские горы; "..YELLOW.."80,67"..WHITE..")"
Inst25Quest11_Note = "Задание для шаманов. 1 перо падает с каждого из поименованных троллей на галерее большой комнаты с дырой в центре."
Inst25Quest11_Prequest = "Тотем духов"
Inst25Quest11_Folgequest = "Нет"
Inst25Quest11PreQuest = "true"
--
Inst25Quest11name1 = "Azurite Fists"
Inst25Quest11name2 = "Enamored Water Spirit"
Inst25Quest11name3 = "Wildstaff"

--Quest 12 Alliance
Inst25Quest12 = "12. Лучший ингредиент (Друид)"
Inst25Quest12_Level = "52"
Inst25Quest12_Attain = "50"
Inst25Quest12_Aim = "Возьмите гнилую лозу у стража на дне затонувшего храма и вернитесь к Землепроходцу Торве."
Inst25Quest12_Location = "Землепроходец Торва (Кратер Ун'Горо; "..YELLOW.."72,76"..WHITE..")"
Inst25Quest12_Note = "Задание для друидов. Гнилая лоза падает с Атал'алариона который призывается около "..YELLOW.."[1]"..WHITE.." активацией статуй в порядке, указанном на карте."
Inst25Quest12_Prequest = "Землепроходец Торва -> Испытание яда"
Inst25Quest12_Folgequest = "Нет"
Inst25Quest12PreQuest = "true"
--
Inst25Quest12name1 = "Grizzled Pelt"
Inst25Quest12name2 = "Forest's Embrace"
Inst25Quest12name3 = "Moonshadow Stave"

--Quest 13 Alliance
Inst25Quest13 = "13. Зеленый дракон (Охотник)"
Inst25Quest13_Level = "52"
Inst25Quest13_Attain = "50"
Inst25Quest13_Aim = "Принесите зуб Морфаза Огтинку в Азшару. Огтинк обитает среди скал в северо-востоку от руин Эльдарата."
Inst25Quest13_Location = "Огтинк (Азшара; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest13_Note = "Задание для охотников. Морфаз находится около "..YELLOW.."[5]"..WHITE.."."
Inst25Quest13_Prequest = "Талисман охотника -> Охота на волномета"
Inst25Quest13_Folgequest = "Нет"
Inst25Quest13PreQuest = "true"
--
Inst25Quest13name1 = "Hunting Spear"
Inst25Quest13name2 = "Devilsaur Eye"
Inst25Quest13name3 = "Devilsaur Tooth"

--Quest 14 Alliance
Inst25Quest14 = "14. Уничтожить Морфаза (Маг)"
Inst25Quest14_Level = "52"
Inst25Quest14_Attain = "50"
Inst25Quest14_Aim = "Добудьте кристалл тайной магии из брюха Морфаза и принесите его верховному магу Ксилему."
Inst25Quest14_Location = "Верховный маг Ксилем (Азшара; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest14_Note = "Задание для магов. Морфаз находится около "..YELLOW.."[5]"..WHITE.."."
Inst25Quest14_Prequest = "Волшебная пыль -> Кораллы сирен"
Inst25Quest14_Folgequest = "Нет"
Inst25Quest14PreQuest = "true"
--
Inst25Quest14name1 = "Glacial Spike"
Inst25Quest14name2 = "Arcane Crystal Pendant"
Inst25Quest14name3 = "Fire Ruby"

--Quest 15 Alliance
Inst25Quest15 = "15. Кровь Морфаза (Жрец)"
Inst25Quest15_Level = "52"
Inst25Quest15_Attain = "50"
Inst25Quest15_Aim = "Убейте Морфаза в затонувшем Храме Атал'Хаккара и принесите его кровь Грете Замшелому Копыту в Оскверненный лес. Вход в храм сокрыт на Болоте Печали."
Inst25Quest15_Location = "Огтинк (Азшара; "..YELLOW.."42,43"..WHITE..")"
Inst25Quest15_Note = "Задание для жрецов. Морфаз находится около "..YELLOW.."[5]"..WHITE..". Грета Замшелое Копыто находится около Оскверненный лес - Изумрудное святилище ("..YELLOW.."51,82"..WHITE..")."
Inst25Quest15_Prequest = "Помощь Ценариона -> Лимфа нежити"
Inst25Quest15_Folgequest = "Нет"
Inst25Quest15PreQuest = "true"
--
Inst25Quest15name1 = "Blessed Prayer Beads"
Inst25Quest15name2 = "Woestave"
Inst25Quest15name3 = "Circle of Hope"

--Quest 16 Alliance
Inst25Quest16 = "16. Лазурный ключ (Разбойник)"
Inst25Quest16_Level = "52"
Inst25Quest16_Attain = "50"
Inst25Quest16_Aim = "Принесите лазурный ключ лорду Черному Ворону."
Inst25Quest16_Location = "Верховный маг Ксилем (Азшара; "..YELLOW.."29,40"..WHITE..")"
Inst25Quest16_Note = "Задание для разбойников. Лазурный ключ падает с Морфаза около "..YELLOW.."[5]"..WHITE..". Лорд Черный Ворон находится около Альтеракские горы - Поместье Черного Ворона ("..YELLOW.."86,79"..WHITE..")."
Inst25Quest16_Prequest = "Приглашение -> Зашифрованные фрагменты"
Inst25Quest16_Folgequest = "Нет"
Inst25Quest16PreQuest = "true"
--
Inst25Quest16name1 = "Ebon Mask"
Inst25Quest16name2 = "Whisperwalk Boots"
Inst25Quest16name3 = "Duskbat Drape"

--Quest 17 Alliance
Inst25Quest17 = "17. Создание камня силы (Паладин)"
Inst25Quest17_Level = "52"
Inst25Quest17_Attain = "50"
Inst25Quest17_Aim = "Принесите вудуистские перья Асламу Отважному Кулаку."
Inst25Quest17_Location = "Командир Ашлам Смелонрав (Западные Чумные земли - Лагерь Промозглого Ветра; "..YELLOW.."43,85"..WHITE..")"
Inst25Quest17_Note = "Задание для паладинов. 1 перо падает с каждого из поименованных троллей на галерее большой комнаты с дырой в центре."
Inst25Quest17_Prequest = "Бездействующие камни Плети"
Inst25Quest17_Folgequest = "Нет"
Inst25Quest17PreQuest = "true"
--
Inst25Quest17name1 = "Holy Mightstone"
Inst25Quest17name2 = "Lightforged Blade"
Inst25Quest17name3 = "Sanctified Orb"
Inst25Quest17name4 = "Chivalrous Signet"


--Quest 1 Horde
Inst25Quest1_HORDE = "1. Храм Атал'Хаккара"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "Соберите 20 фетишей Хаккара и принесите их Фел'зерулу в Каменор."
Inst25Quest1_HORDE_Location = "Фел'зерул (Болото Печали - Каменор; "..YELLOW.."47,54"..WHITE..")"
Inst25Quest1_HORDE_Note = "Фетиши падают со всех врагов."
Inst25Quest1_HORDE_Prequest = "Озеро Слез -> Возвращение к Фел'зерулу"
Inst25Quest1_HORDE_Folgequest = "Нет"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "Guardian Talisman"

--Quest 2 Horde
Inst25Quest2_HORDE = "2. Затонувший храм"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "46"
Inst25Quest2_HORDE_Aim = "Найдите Марвона Клепальщика в Танарисе."
Inst25Quest2_HORDE_Location = "Знахарь Узер'и (Фералас; "..YELLOW.."74,43"..WHITE..")"
Inst25Quest2_HORDE_Note = "Вы найдете Марвона Клепальщика около "..YELLOW.."52,45"..WHITE.."."
Inst25Quest2_HORDE_Prequest = "Нет"
Inst25Quest2_HORDE_Folgequest = "Круглый камень"

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst25Quest3_HORDE = Inst25Quest3
Inst25Quest3_HORDE_Level = Inst25Quest3_Level
Inst25Quest3_HORDE_Attain = Inst25Quest3_Attain
Inst25Quest3_HORDE_Aim = Inst25Quest3_Aim
Inst25Quest3_HORDE_Location = Inst25Quest3_Location
Inst25Quest3_HORDE_Note = Inst25Quest3_Note
Inst25Quest3_HORDE_Prequest = Inst25Quest3_Prequest
Inst25Quest3_HORDE_Folgequest = Inst25Quest3_Folgequest
Inst25Quest3FQuest_HORDE = Inst25Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst25Quest4_HORDE = Inst25Quest4
Inst25Quest4_HORDE_Level = Inst25Quest4_Level
Inst25Quest4_HORDE_Attain = Inst25Quest4_Attain
Inst25Quest4_HORDE_Aim = Inst25Quest4_Aim
Inst25Quest4_HORDE_Location = Inst25Quest4_Location
Inst25Quest4_HORDE_Note = Inst25Quest4_Note
Inst25Quest4_HORDE_Prequest = Inst25Quest4_Prequest
Inst25Quest4_HORDE_Folgequest = Inst25Quest4_Folgequest
Inst25Quest4FQuest_HORDE = Inst25Quest4FQuest
--
Inst25Quest4name1_HORDE = Inst25Quest4name1

--Quest 5 Horde
Inst25Quest5_HORDE = "5. Питание для шокера"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "47"
Inst25Quest5_HORDE_Aim = "Доставьте незаряженный шокер и 5 образцов тумана Аталаи Лариону в Укрытие Маршалла."
Inst25Quest5_HORDE_Location = "Лив Быстрочин (Степи; "..YELLOW.."62,38"..WHITE..")"
Inst25Quest5_HORDE_Note = "Предшествующее задание 'Ларион и Майджин' начинается у Лариона (Кратер Ун'Горо; "..YELLOW.."45,8"..WHITE.."). Вы возьмете образцы тумана с Глубинных скрытней, Мракочервей или слизнюков в Храме."
Inst25Quest5_HORDE_Prequest = "Ларион и Майджин -> Мастерская Марвона"
Inst25Quest5_HORDE_Folgequest = "Нет"
Inst25Quest5PreQuest_HORDE = "true"

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst25Quest6_HORDE = Inst25Quest6
Inst25Quest6_HORDE_Level = Inst25Quest6_Level
Inst25Quest6_HORDE_Attain = Inst25Quest6_Attain
Inst25Quest6_HORDE_Aim = Inst25Quest6_Aim
Inst25Quest6_HORDE_Location = Inst25Quest6_Location
Inst25Quest6_HORDE_Note = Inst25Quest6_Note
Inst25Quest6_HORDE_Prequest = Inst25Quest6_Prequest
Inst25Quest6_HORDE_Folgequest = Inst25Quest6_Folgequest
Inst25Quest6PreQuest_HORDE = Inst25Quest6PreQuest
--
Inst25Quest6name1_HORDE = Inst25Quest6name1
Inst25Quest6name2_HORDE = Inst25Quest6name2
Inst25Quest6name3_HORDE = Inst25Quest6name3

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst25Quest7_HORDE = Inst25Quest7
Inst25Quest7_HORDE_Level = Inst25Quest7_Level
Inst25Quest7_HORDE_Attain = Inst25Quest7_Attain
Inst25Quest7_HORDE_Aim = Inst25Quest7_Aim
Inst25Quest7_HORDE_Location = Inst25Quest7_Location
Inst25Quest7_HORDE_Note = Inst25Quest7_Note
Inst25Quest7_HORDE_Prequest = Inst25Quest7_Prequest
Inst25Quest7_HORDE_Folgequest = Inst25Quest7_Folgequest
--
Inst25Quest7name1_HORDE = Inst25Quest7name1
Inst25Quest7name2_HORDE = Inst25Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst25Quest8_HORDE = Inst25Quest8
Inst25Quest8_HORDE_Level = Inst25Quest8_Level
Inst25Quest8_HORDE_Attain = Inst25Quest8_Attain
Inst25Quest8_HORDE_Aim = Inst25Quest8_Aim
Inst25Quest8_HORDE_Location = Inst25Quest8_Location
Inst25Quest8_HORDE_Note = Inst25Quest8_Note
Inst25Quest8_HORDE_Prequest = Inst25Quest8_Prequest
Inst25Quest8_HORDE_Folgequest = Inst25Quest8_Folgequest
--
Inst25Quest8name1_HORDE = Inst25Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst25Quest9_HORDE = Inst25Quest9
Inst25Quest9_HORDE_Level = Inst25Quest9_Level
Inst25Quest9_HORDE_Attain = Inst25Quest9_Attain
Inst25Quest9_HORDE_Aim = Inst25Quest9_Aim
Inst25Quest9_HORDE_Location = Inst25Quest9_Location
Inst25Quest9_HORDE_Note = Inst25Quest9_Note
Inst25Quest9_HORDE_Prequest = Inst25Quest9_Prequest
Inst25Quest9_HORDE_Folgequest = Inst25Quest9_Folgequest
Inst25Quest9PreQuest_HORDE = Inst25Quest9PreQuest
--
Inst25Quest9name1_HORDE = Inst25Quest9name1
Inst25Quest9name2_HORDE = Inst25Quest9name2
Inst25Quest9name3_HORDE = Inst25Quest9name3

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst25Quest10_HORDE = Inst25Quest10
Inst25Quest10_HORDE_Level = Inst25Quest10_Level
Inst25Quest10_HORDE_Attain = Inst25Quest10_Attain
Inst25Quest10_HORDE_Aim = Inst25Quest10_Aim
Inst25Quest10_HORDE_Location = Inst25Quest10_Location
Inst25Quest10_HORDE_Note = Inst25Quest10_Note
Inst25Quest10_HORDE_Prequest = Inst25Quest10_Prequest
Inst25Quest10_HORDE_Folgequest = Inst25Quest10_Folgequest
Inst25Quest10PreQuest_HORDE = Inst25Quest10PreQuest
--
Inst25Quest10name1_HORDE = Inst25Quest10name1
Inst25Quest10name2_HORDE = Inst25Quest10name2
Inst25Quest10name3_HORDE = Inst25Quest10name3

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst25Quest11_HORDE = Inst25Quest11
Inst25Quest11_HORDE_Level = Inst25Quest11_Level
Inst25Quest11_HORDE_Attain = Inst25Quest11_Attain
Inst25Quest11_HORDE_Aim = Inst25Quest11_Aim
Inst25Quest11_HORDE_Location = Inst25Quest11_Location
Inst25Quest11_HORDE_Note = Inst25Quest11_Note
Inst25Quest11_HORDE_Prequest = Inst25Quest11_Prequest
Inst25Quest11_HORDE_Folgequest = Inst25Quest11_Folgequest
Inst25Quest11PreQuest_HORDE = Inst25Quest11PreQuest
--
Inst25Quest11name1_HORDE = Inst25Quest11name1
Inst25Quest11name2_HORDE = Inst25Quest11name2
Inst25Quest11name3_HORDE = Inst25Quest11name3

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst25Quest12_HORDE = Inst25Quest12
Inst25Quest12_HORDE_Level = Inst25Quest12_Level
Inst25Quest12_HORDE_Attain = Inst25Quest12_Attain
Inst25Quest12_HORDE_Aim = Inst25Quest12_Aim
Inst25Quest12_HORDE_Location = Inst25Quest12_Location
Inst25Quest12_HORDE_Note = Inst25Quest12_Note
Inst25Quest12_HORDE_Prequest = Inst25Quest12_Prequest
Inst25Quest12_HORDE_Folgequest = Inst25Quest12_Folgequest
Inst25Quest12PreQuest_HORDE = Inst25Quest12PreQuest
--
Inst25Quest12name1_HORDE = Inst25Quest12name1
Inst25Quest12name2_HORDE = Inst25Quest12name2
Inst25Quest12name3_HORDE = Inst25Quest12name3

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst25Quest13_HORDE = Inst25Quest13
Inst25Quest13_HORDE_Level = Inst25Quest13_Level
Inst25Quest13_HORDE_Attain = Inst25Quest13_Attain
Inst25Quest13_HORDE_Aim = Inst25Quest13_Aim
Inst25Quest13_HORDE_Location = Inst25Quest13_Location
Inst25Quest13_HORDE_Note = Inst25Quest13_Note
Inst25Quest13_HORDE_Prequest = Inst25Quest13_Prequest
Inst25Quest13_HORDE_Folgequest = Inst25Quest13_Folgequest
Inst25Quest13PreQuest_HORDE = Inst25Quest13PreQuest
--
Inst25Quest13name1_HORDE = Inst25Quest13name1
Inst25Quest13name2_HORDE = Inst25Quest13name2
Inst25Quest13name3_HORDE = Inst25Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst25Quest14_HORDE = Inst25Quest14
Inst25Quest14_HORDE_Level = Inst25Quest14_Level
Inst25Quest14_HORDE_Attain = Inst25Quest14_Attain
Inst25Quest14_HORDE_Aim = Inst25Quest14_Aim
Inst25Quest14_HORDE_Location = Inst25Quest14_Location
Inst25Quest14_HORDE_Note = Inst25Quest14_Note
Inst25Quest14_HORDE_Prequest = Inst25Quest14_Prequest
Inst25Quest14_HORDE_Folgequest = Inst25Quest14_Folgequest
Inst25Quest14PreQuest_HORDE = Inst25Quest14PreQuest
--
Inst25Quest14name1_HORDE = Inst25Quest14name1
Inst25Quest14name2_HORDE = Inst25Quest14name2
Inst25Quest14name3_HORDE = Inst25Quest14name3

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst25Quest15_HORDE = Inst25Quest15
Inst25Quest15_HORDE_Level = Inst25Quest15_Level
Inst25Quest15_HORDE_Attain = Inst25Quest15_Attain
Inst25Quest15_HORDE_Aim = Inst25Quest15_Aim
Inst25Quest15_HORDE_Location = Inst25Quest15_Location
Inst25Quest15_HORDE_Note = Inst25Quest15_Note
Inst25Quest15_HORDE_Prequest = Inst25Quest15_Prequest
Inst25Quest15_HORDE_Folgequest = Inst25Quest15_Folgequest
Inst25Quest15PreQuest_HORDE = Inst25Quest15PreQuest
--
Inst25Quest15name1_HORDE = Inst25Quest15name1
Inst25Quest15name2_HORDE = Inst25Quest15name2
Inst25Quest15name3_HORDE = Inst25Quest15name3

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst25Quest16_HORDE = Inst25Quest16
Inst25Quest16_HORDE_Level = Inst25Quest16_Level
Inst25Quest16_HORDE_Attain = Inst25Quest16_Attain
Inst25Quest16_HORDE_Aim = Inst25Quest16_Aim
Inst25Quest16_HORDE_Location = Inst25Quest16_Location
Inst25Quest16_HORDE_Note = Inst25Quest16_Note
Inst25Quest16_HORDE_Prequest = Inst25Quest16_Prequest
Inst25Quest16_HORDE_Folgequest = Inst25Quest16_Folgequest
Inst25Quest16PreQuest_HORDE = Inst25Quest16PreQuest
--
Inst25Quest16name1_HORDE = Inst25Quest16name1
Inst25Quest16name2_HORDE = Inst25Quest16name2
Inst25Quest16name3_HORDE = Inst25Quest16name3

--Quest 17 Horde
Inst25Quest17_HORDE = "17. Древнее зло (Паладин)"
Inst25Quest17_HORDE_Level = "52"
Inst25Quest17_HORDE_Attain = "50"
Inst25Quest17_HORDE_Aim = "Раскройте тайны Храма Атал'Хаккара, освободите Атал'алариона и добудьте гнилую лозу из его плоти. По выполнении задания вернитесь к Мелару в Бастион."
Inst25Quest17_HORDE_Location = "Леди Сильвана Ветрокрылая (Подгород - Королевский квартал; "..YELLOW.."59,94"..WHITE..")"
Inst25Quest17_HORDE_Note = "Задание для паладинов. Гнилая лоза падает с Атал'алариона который призывается около "..YELLOW.."[1]"..WHITE.." активацией статуй в порядке, указанном на карте. Мехлар находится около Тирисфальские леса - Бастион ("..YELLOW.."83,71"..WHITE..")."
Inst25Quest17_HORDE_Prequest = "В Бастион -> Мудрость королевы банши"
Inst25Quest17_HORDE_Folgequest = "Нет"
Inst25Quest17PreQuest_HORDE = "true"
--
Inst25Quest17name1_HORDE = "Scourgebane"



--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------

Inst26Story = "At the heart of Ahn'Qiraj lies an ancient temple complex. Built in the time before recorded history, it is both a monument to unspeakable gods and a massive breeding ground for the qiraji army. Since the War of the Shifting Sands ended a thousand years ago, the Twin Emperors of the qiraji empire have been trapped inside their temple, barely contained behind the magical barrier erected by the bronze dragon Анахронос and the night elves. Now that the Scepter of the Shifting Sands has been reassembled and the seal has been broken, the way into the inner sanctum of Ahn'Qiraj is open. Beyond the crawling madness of the hives, beneath the Temple of Ahn'Qiraj, legions of qiraji prepare for invasion. They must be stopped at all costs before they can unleash their voracious insectoid armies on Kalimdor once again, and a second War of the Shifting Sands breaks loose!"
Inst26Caption = "Храм Ан'Киража"
Inst26QAA = "3 Задания"
Inst26QAH = "3 Задания"

--Quest 1 Alliance
Inst26Quest1 = "1. Наследие К'Туна"
Inst26Quest1_Level = "60"
Inst26Quest1_Attain = "60"
Inst26Quest1_Aim = "Принесите Глаз К'Туна Келестрасу в Храм Ан'Кирая."
Inst26Quest1_Location = "Око К'Туна (падает с К'Туна; "..YELLOW.."[9]"..WHITE..")"
Inst26Quest1_Note = "Келестрас (Храм Ан'Киража; "..YELLOW.."2'"..WHITE..")"
Inst26Quest1_Prequest = "Нет"
Inst26Quest1_Folgequest = "Спаситель Калимдора"
-- No Rewards for this quest

--Quest 2 Alliance
Inst26Quest2 = "2. Спаситель Калимдора"
Inst26Quest2_Level = "60"
Inst26Quest2_Attain = "60"
Inst26Quest2_Aim = "Принесите глаз К'Туна Анахроносу в Пещеры Времени."
Inst26Quest2_Location = "Келестрас (Храм Ан'Киража; "..YELLOW.."2'"..WHITE..")"
Inst26Quest2_Note = "Анахронос (Танарис - Пещеры времени; "..YELLOW.."65,49"..WHITE..")"
Inst26Quest2_Prequest = "Наследие К'Туна"
Inst26Quest2_Folgequest = "Нет"
Inst26Quest2FQuest = "true"
--
Inst26Quest2name1 = "Amulet of the Fallen God"
Inst26Quest2name2 = "Cloak of the Fallen God"
Inst26Quest2name3 = "Ring of the Fallen God"

--Quest 3 Alliance
Inst26Quest3 = "3. Секреты Кираи"
Inst26Quest3_Level = "60"
Inst26Quest3_Attain = "60"
Inst26Quest3_Aim = "Принесите древний киражский артефакт драконам, которые укрылись в храме, недалеко от входа."
Inst26Quest3_Location = "Древний киражский артефакт (случайно падает в Храме Ан'Кираж)"
Inst26Quest3_Note = "Сдается Андоргос (Храм Ан'Киража; "..YELLOW.."1'"..WHITE..")."
Inst26Quest3_Prequest = "Нет"
Inst26Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst26Quest4 = "4. Поборники правого дела из числа смертных"
Inst26Quest4_Level = "60"
Inst26Quest4_Attain = "60"
Inst26Quest4_Aim = "Принесите Знаки различия киражского владыки Кандостразу в Храм Ан'Киража."
Inst26Quest4_Location = "Кандостраз (Храм Ан'Киража; "..YELLOW.."[1']"..WHITE..")"
Inst26Quest4_Note = "Это многоразовое задание, которое дает репутацию в Круге Кенария. Знаки различия киражского владыки падают со всех босов в подземелье. Кандостраз находится в комнате с первым босом."
Inst26Quest4_Prequest = "Нет"
Inst26Quest4_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst26Quest1_HORDE = Inst26Quest1
Inst26Quest1_HORDE_Level = Inst26Quest1_Level
Inst26Quest1_HORDE_Attain = Inst26Quest1_Attain
Inst26Quest1_HORDE_Aim = Inst26Quest1_Aim
Inst26Quest1_HORDE_Location = Inst26Quest1_Location
Inst26Quest1_HORDE_Note = Inst26Quest1_Note
Inst26Quest1_HORDE_Prequest = Inst26Quest1_Prequest
Inst26Quest1_HORDE_Folgequest = Inst26Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst26Quest2_HORDE = Inst26Quest2
Inst26Quest2_HORDE_Level = Inst26Quest2_Level
Inst26Quest2_HORDE_Attain = Inst26Quest2_Attain
Inst26Quest2_HORDE_Aim = Inst26Quest2_Aim
Inst26Quest2_HORDE_Location = Inst26Quest2_Location
Inst26Quest2_HORDE_Note = Inst26Quest2_Note
Inst26Quest2_HORDE_Prequest = Inst26Quest2_Prequest
Inst26Quest2_HORDE_Folgequest = Inst26Quest2_Folgequest
Inst26Quest2FQuest_HORDE = Inst26Quest2FQuest
--
Inst26Quest2name1_HORDE = Inst26Quest2name1
Inst26Quest2name2_HORDE = Inst26Quest2name2
Inst26Quest2name3_HORDE = Inst26Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst26Quest3_HORDE = Inst26Quest3
Inst26Quest3_HORDE_Level = Inst26Quest3_Level
Inst26Quest3_HORDE_Attain = Inst26Quest3_Attain
Inst26Quest3_HORDE_Aim = Inst26Quest3_Aim
Inst26Quest3_HORDE_Location = Inst26Quest3_Location
Inst26Quest3_HORDE_Note = Inst26Quest3_Note
Inst26Quest3_HORDE_Prequest = Inst26Quest3_Prequest
Inst26Quest3_HORDE_Folgequest = Inst26Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst26Quest4_HORDE = Inst26Quest4
Inst26Quest4_HORDE_Level = Inst26Quest4_Level
Inst26Quest4_HORDE_Attain = Inst26Quest4_Attain
Inst26Quest4_HORDE_Aim = Inst26Quest4_Aim
Inst26Quest4_HORDE_Location = Inst26Quest4_Location
Inst26Quest4_HORDE_Note = Inst26Quest4_Note
Inst26Quest4_HORDE_Prequest = Inst26Quest4_Prequest
Inst26Quest4_HORDE_Folgequest = Inst26Quest4_Folgequest
-- No Rewards for this quest



--------------- INST27 - Zul'Farrak (ZF) ---------------

Inst27Story = "Этот выжженый солнцем город служит домом троллям из клана Песчаной Ярости, известных своей редкостной безжалостностью и темным мистицизмом. Легенды троллей рассказывают о мощном мече называемом Кара Суль-траза, оружие, способное вселять страх и слабость жаже самым грозным врагам. Давным-давно, оружие было разбито на две части. Однако, ходят слухи, что в где-то стенах Зул'Фаррака можно найти обе половинки. Докладывают также, что банда наемников, бежавших из Прибамбасска забрела в город и попала в ловушку. Их судьба неизвестна. Но возможно самым волнующим из всего - этотихие перешептывания о древнем чудовище, спящим в священном бассейне в самом сердце города. Могучем полубоге, который нанесет неисчислимый ущерб любому авантюристу, имевшему глупость пробудить его."
Inst27Caption = "Зул'Фаррак"
Inst27QAA = "7 Заданий"
Inst27QAH = "7 Заданий"

--Quest 1 Alliance
Inst27Quest1 = "1. Троллье месиво"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "40"
Inst27Quest1_Aim = "Принесите 20 фиалов с Тролльим месивом."
Inst27Quest1_Location = "Трентон Молот Света (Танарис - Прибамбасск; "..YELLOW.."51,28"..WHITE..")"
Inst27Quest1_Note = "Месиво падет со всех троллей."
Inst27Quest1_Prequest = "Нет"
Inst27Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst27Quest2 = "2. Панцири скарабеев"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "40"
Inst27Quest2_Aim = "Принести 5 целых панцирей скарабея Тран'реку в Прибамбасск."
Inst27Quest2_Location = "Тран'рек (Танарис - Прибамбасск; "..YELLOW.."51,26"..WHITE..")"
Inst27Quest2_Note = "Предшествующее задание начинается у Кразека (Тернистая долина - Пиратская бухта; "..YELLOW.."25,77"..WHITE..").\nПанцири могут упасть с любого скарабея. Множество скарабеев находится около "..YELLOW.."[2]"..WHITE.."."
Inst27Quest2_Prequest = "Тран'рек"
Inst27Quest2_Folgequest = "Нет"
Inst27Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst27Quest3 = "3. Тиара глубин"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "Принесите Тиару Глубин Табете в Пылевые топи."
Inst27Quest3_Location = " Табета (Пылевые топи; "..YELLOW.."46,57"..WHITE..")"
Inst27Quest3_Note = "Возьмите предшествующее задание у Бинк (Стальгорн; "..YELLOW.."25,8"..WHITE..").\nТиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest3_Prequest = "Миссия Табеты"
Inst27Quest3_Folgequest = "Нет"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "Spellshifter Rod"
Inst27Quest3name2 = "Gemshale Pauldrons"

--Quest 4 Alliance
Inst27Quest4 = "4. Медальон Некрума"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "Отнесите медальон Некрума Тадиусу Мрачной Тени в Выжженные земли."
Inst27Quest4_Location = "Тадиус Мрачная Тень (Выжженные земли - Крепость Стражей Пустоты; "..YELLOW.."66,19"..WHITE..")"
Inst27Quest4_Note = "Линейка заданий начинается у укротителя грифонов Разящего Когтя (Внутренние земли - Цитадель Громового Молота; "..YELLOW.."9,44"..WHITE..").\nНекрум появляется около "..YELLOW.."[4]"..WHITE.." с последней волной боя Храмового события."
Inst27Quest4_Prequest = "Тролльи клетки -> Тадиус Мрачная Тень"
Inst27Quest4_Folgequest = "Прорицание"
Inst27Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst27Quest5 = "5. Пророчество Мошару"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "Принесите первую и вторую таблички Мошару Йе'кинье в Танарис."
Inst27Quest5_Location = "Йе'кинья (Танарис - Порт Картеля; "..YELLOW.."66,22"..WHITE..")"
Inst27Quest5_Note = "Вы возьмете предшествующее задание у того же НИП.\nТаблички падают с Теки Мученика около "..YELLOW.."[2]"..WHITE.." и гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest5_Prequest = "Духи крикунов"
Inst27Quest5_Folgequest = "Древнее яйцо"
Inst27Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst27Quest6 = "6. Изыскательский стержень"
Inst27Quest6_Level = "47"
Inst27Quest6_Attain = "40"
Inst27Quest6_Aim = "Принесите изыскательский cтержень главному инженеру Чепухастеру в Прибамбасск."
Inst27Quest6_Location = "Главный инженер Чепухастер (Танарис - Прибамбасск; "..YELLOW.."52,28"..WHITE..")"
Inst27Quest6_Note = "Вы заберете стержень у сержанта Блая. Вы найдете его около "..YELLOW.."[4]"..WHITE.." после Храмового события."
Inst27Quest6_Prequest = "Нет"
Inst27Quest6_Folgequest = "Нет"
--
Inst27Quest6name1 = "Masons Fraternity Ring"
Inst27Quest6name2 = "Engineer's Guild Headpiece"

--Quest 7 Alliance
Inst27Quest7 = "7. Газ'рилла"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "Принесите искрящую чешую Газ'риллы Виззлу Медноштифу на Мерцающую равнину."
Inst27Quest7_Location = "Виззл Медноштиф (Тысяча Игл - Миражи на виражах; "..YELLOW.."78,77"..WHITE..")"
Inst27Quest7_Note = "Вы возьмете предшествующее задание у Клацморта Гайкокрута (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE.."). Чтобы получить задание Газ'рилла, предшествующее задание выполнять необязательно.\nВы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
Inst27Quest7_Prequest = "Братья Латунный Болт"
Inst27Quest7_Folgequest = "Нет"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "Carrot on a Stick"


--Quest 1 Horde
Inst27Quest1_HORDE = "1. Паучья богиня"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "40"
Inst27Quest1_HORDE_Aim = "Прочитайте надписи на табличке Теки, узнайте имя паучьей богини, которой поклоняются тролли Сухокожих, а потом возвращайтесь к мастеру Гадрину."
Inst27Quest1_HORDE_Location = "Мастер Гадрин (Дуротар - Деревня Сен'джин; "..YELLOW.."55,74"..WHITE..")"
Inst27Quest1_HORDE_Note = "Линейка заданий начинается с Бутылки с ядом, которые стоят на столах в деревнях троллей во Внутренних землях.\nВы найдете табличку около "..YELLOW.."[2]"..WHITE.."."
Inst27Quest1_HORDE_Prequest = "Бутыли с ядом -> Разговор с мастером Гадрином"
Inst27Quest1_HORDE_Folgequest = "Призыв Шадры"
Inst27Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 1 Alliance)
Inst27Quest2_HORDE = "2. Троллье месиво"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst27Quest3_HORDE = "3. Панцири скарабеев"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 3 Alliance - no предшествующее задание)
Inst27Quest4_HORDE = "4. Тиара глубин"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "Тиара глубин падает с гидроманта Велраты около "..YELLOW.."[6]"..WHITE.."."
Inst27Quest4_HORDE_Prequest = "Нет"
Inst27Quest4_HORDE_Folgequest = Inst27Quest3_Folgequest
--
Inst27Quest4name1_HORDE = Inst27Quest3name1
Inst27Quest4name2_HORDE = Inst27Quest3name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst27Quest5_HORDE = Inst27Quest5
Inst27Quest5_HORDE_Level = Inst27Quest5_Level
Inst27Quest5_HORDE_Attain = Inst27Quest5_Attain
Inst27Quest5_HORDE_Aim = Inst27Quest5_Aim
Inst27Quest5_HORDE_Location = Inst27Quest5_Location
Inst27Quest5_HORDE_Note = Inst27Quest5_Note
Inst27Quest5_HORDE_Prequest = Inst27Quest5_Prequest
Inst27Quest5_HORDE_Folgequest = Inst27Quest5_Folgequest
Inst27Quest5PreQuest_HORDE = Inst27Quest5Prequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst27Quest6_HORDE = Inst27Quest6
Inst27Quest6_HORDE_Level = Inst27Quest6_Level
Inst27Quest6_HORDE_Attain = Inst27Quest6_Attain
Inst27Quest6_HORDE_Aim = Inst27Quest6_Aim
Inst27Quest6_HORDE_Location = Inst27Quest6_Location
Inst27Quest6_HORDE_Note = Inst27Quest6_Note
Inst27Quest6_HORDE_Prequest = Inst27Quest6_Prequest
Inst27Quest6_HORDE_Folgequest = Inst27Quest6_Folgequest
--
Inst27Quest6name1_HORDE = Inst27Quest6name1
Inst27Quest6name2_HORDE = Inst27Quest6name2

--Quest 7 Horde  (same as Quest 7 Alliance - no предшествующее задание)
Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "Вы вызовете Газ'риллу около "..YELLOW.."[6]"..WHITE.." с помощью Молота Зул'Фаррака.\nСвященный молот падает с Квиаги Хранительницы (Внутренние земли - Алтарь Зула; "..YELLOW.."49,70"..WHITE..") и должен быть завершен на алтаре в Джинта'Алоре около "..YELLOW.."59,77"..WHITE.." перед тем как его можно будет использовать в Зул'Фарраке."
Inst27Quest7_HORDE_Prequest = "Нет"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = Inst27Quest7name1



--------------- INST28 - Zul'Gurub (ZG) ---------------

Inst28Story = {
  ["Page1"] = "Свыше тысячи лет назад, могущественная империя Гурбаши была разорвана на части всеобщей гражданской войной. Влиятельная группа жрецов троллей, известная как Атал'аи, предприняла попытку призвать древнего кровавого бога по имени Хаккар Свежеватель душ. Несмотря на то, что жрецы потерпели поражение и были изгнаны навеки, великая империя троллей не смогла сохранить целостность. Изгнанные жрецы бежали далеко на север, в Болота Печали. Там они возвели великий храм в честь Хаккара - где они могли приготовиться к его прибытию в материальный мир.",
  ["Page2"] = "В тоже время, жрецы Атал'аи обнаружили, что материальную форму Хаккара можно вызвать только в пределах древней столицы империи Гурубаши, Зул'Гурубе. К несчастью, жрецы преуспели в своем стремлении призвать Хаккара - донесения подтверждают присутсвие ужасного Свежевателя душ в сердце руин Гурубаши.\n\nДля того, чтобы подавить кровавого бога, тролли страны собрались вместе и послали отряд Высших жрецов в древний город. Каждый жрец был могучим чемпионом Звериных боов - Летучей мыши, Пантеры, Тигра, Паука, и Змеи - но несмотря на все их усилия, они попали под влияние Хаккара. Теперь чемпионы и их воплощения Звериных богов вскормлены ужасающей силой Свежевателя душ. Любой авантюрист, храбрый настолько, чтобы отважиться забраться в проклятые руины, должен победить Высших жрецов, если он надется хотя бы вступить в схватку с могущественным кровавым богом.",
  ["MaxPages"] = "2",
};
Inst28Caption = "Зул'Гуруб"
Inst28QAA = "4 Задания"
Inst28QAH = "4 Задания"

--Quest 1 Alliance
Inst28Quest1 = "1. Коллекция голов"
Inst28Quest1_Level = "60"
Inst28Quest1_Attain = "58"
Inst28Quest1_Aim = "Соберите ожерелье из голов пятерых жрецов и вернитесь с ним к Экзалу на остров Йоджамба."
Inst28Quest1_Location = "Экзал (Тернистая долина - Остров Йоджамба; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest1_Note = "Удостоверьтесь, что вы обобрали всех жрецов."
Inst28Quest1_Prequest = "Нет"
Inst28Quest1_Folgequest = "Нет"
--
Inst28Quest1name1 = "Belt of Shrunken Heads"
Inst28Quest1name2 = "Belt of Shriveled Heads"
Inst28Quest1name3 = "Belt of Preserved Heads"
Inst28Quest1name4 = "Belt of Tiny Heads"

--Quest 2 Alliance
Inst28Quest2 = "2. Сердце Хаккара"
Inst28Quest2_Level = "60"
Inst28Quest2_Attain = "58"
Inst28Quest2_Aim = "Принесите сердце Хаккара Молтору на остров Йоджамба."
Inst28Quest2_Location = "Сердце Хаккара (падает с Хаккара; "..YELLOW.."[11]"..WHITE..")"
Inst28Quest2_Note = "Молтор (Тернистая долина - Остров Йоджамба; "..YELLOW.."15,15"..WHITE..")"
Inst28Quest2_Prequest = "Нет"
Inst28Quest2_Folgequest = "Нет"
--
Inst28Quest2name1 = "Zandalarian Hero Badge"
Inst28Quest2name2 = "Zandalarian Hero Charm"
Inst28Quest2name3 = "Zandalarian Hero Medallion"

--Quest 3 Alliance
Inst28Quest3 = "3. Измерительная лента Ната"
Inst28Quest3_Level = "60"
Inst28Quest3_Attain = "59"
Inst28Quest3_Aim = "Верните измерительную ленту Нату Пэглу. Найти Пэгла можно в Пылевых топях."
Inst28Quest3_Location = "Побитый ящик для рыболовной снасти (Зул'Гуруб - Северо-восток в воде у острова Хаккара)"
Inst28Quest3_Note = "Нат Пэгл находится в Пылевых топях ("..YELLOW.."59,60"..WHITE.."). Выполнение задания позволяет вам купить Наживки на грязнотинника у Ната Пэгла для призыва Газ'ранки в Зул'Гурубе."
Inst28Quest3_Prequest = "Нет"
Inst28Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst28Quest4 = "4. Идеальный яд"
Inst28Quest4_Level = "60"
Inst28Quest4_Attain = "60"
Inst28Quest4_Aim = "Дирк Громодрев из Крепости Ценариона попросил принести ему ядовитую железу Веноксиса и ядовитую железу Куриннакса."
Inst28Quest4_Location = "Дирк Громодрев (Силитус - Крепость Ценариона; "..YELLOW.."52,39"..WHITE..")"
Inst28Quest4_Note = "Ядовитая железа Веноксиса падает с Верховного жреца Веноксиса в "..YELLOW.."Зул'Гуруб"..WHITE..". Ядовитая железа Куриннакса падает в "..YELLOW.."Руины Ан'Киража"..WHITE.." около "..YELLOW.."[1]"..WHITE.."."
Inst28Quest4_Prequest = "Нет"
Inst28Quest4_Folgequest = "Нет"
--
Inst28Quest4name1 = "Ravenholdt Slicer"
Inst28Quest4name2 = "Shivsprocket's Shiv"
Inst28Quest4name3 = "The Thunderwood Poker"
Inst28Quest4name4 = "Doomulus Prime"
Inst28Quest4name5 = "Fahrad's Reloading Repeater"
Inst28Quest4name6 = "Simone's Cultivating Hammer"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst28Quest1_HORDE = Inst28Quest1
Inst28Quest1_HORDE_Level = Inst28Quest1_Level
Inst28Quest1_HORDE_Attain = Inst28Quest1_Attain
Inst28Quest1_HORDE_Aim = Inst28Quest1_Aim
Inst28Quest1_HORDE_Location = Inst28Quest1_Location
Inst28Quest1_HORDE_Note = Inst28Quest1_Note
Inst28Quest1_HORDE_Prequest = Inst28Quest1_Prequest
Inst28Quest1_HORDE_Folgequest = Inst28Quest1_Folgequest
--
Inst28Quest1name1_HORDE = Inst28Quest1name1
Inst28Quest1name2_HORDE = Inst28Quest1name2
Inst28Quest1name3_HORDE = Inst28Quest1name3
Inst28Quest1name4_HORDE = Inst28Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst28Quest2_HORDE = Inst28Quest2
Inst28Quest2_HORDE_Level = Inst28Quest2_Level
Inst28Quest2_HORDE_Attain = Inst28Quest2_Attain
Inst28Quest2_HORDE_Aim = Inst28Quest2_Aim
Inst28Quest2_HORDE_Location = Inst28Quest2_Location
Inst28Quest2_HORDE_Note = Inst28Quest2_Note
Inst28Quest2_HORDE_Prequest = Inst28Quest2_Prequest
Inst28Quest2_HORDE_Folgequest = Inst28Quest2_Folgequest
--
Inst28Quest2name1_HORDE = Inst28Quest2name1
Inst28Quest2name2_HORDE = Inst28Quest2name2
Inst28Quest2name3_HORDE = Inst28Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst28Quest3_HORDE = Inst28Quest3
Inst28Quest3_HORDE_Level = Inst28Quest3_Level
Inst28Quest3_HORDE_Attain = Inst28Quest3_Attain
Inst28Quest3_HORDE_Aim = Inst28Quest3_Aim
Inst28Quest3_HORDE_Location = Inst28Quest3_Location
Inst28Quest3_HORDE_Note = Inst28Quest3_Note
Inst28Quest3_HORDE_Prequest = Inst28Quest3_Prequest
Inst28Quest3_HORDE_Folgequest = Inst28Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst28Quest4_HORDE = Inst28Quest4
Inst28Quest4_HORDE_Level = Inst28Quest4_Level
Inst28Quest4_HORDE_Attain = Inst28Quest4_Attain
Inst28Quest4_HORDE_Aim = Inst28Quest4_Aim
Inst28Quest4_HORDE_Location = Inst28Quest4_Location
Inst28Quest4_HORDE_Note = Inst28Quest4_Note
Inst28Quest4_HORDE_Prequest = Inst28Quest4_Prequest
Inst28Quest4_HORDE_Folgequest = Inst28Quest4_Folgequest
--
Inst28Quest4name1_HORDE = Inst28Quest4name1
Inst28Quest4name2_HORDE = Inst28Quest4name2
Inst28Quest4name3_HORDE = Inst28Quest4name3
Inst28Quest4name4_HORDE = Inst28Quest4name4
Inst28Quest4name5_HORDE = Inst28Quest4name5
Inst28Quest4name6_HORDE = Inst28Quest4name6



--------------- INST29 - Gnomeregan (Gnomer) ---------------

Inst29Story = "Находящееся в Дун Мороге, технологическое чудо, известное как Гномреган было столицей гномов на протяжении поколений. В недавнем прошлом, враждебная раса мутантов-троггов захватила некоторые регионы Дун Морога - включая и великий город гномов. В отчаянных попытках уничтожить вторгшихся троггов, Главный механик Меггакрут запустил экстренный слив городских баков с радиоактивными отходами. Некоторые гномы нашли убежище от загрязняющих воздух веществ, так как они ожидали, что трогги умрут или сбегут. К сожалению, не смотря на точто трогги облучились токсичной атакой - их осада продолжилась, не утихая. Те гномы, которых не убили вредные потоки были вынуждены бежать, ища убежище в близлежащем городе дворфов Стальгорне. Там Главный механик Меггакрут начал вербовать храбрецов, чтобы помочь его народу вернуть обратно их любимую столицу. Ходят слухи что когда-то бывший доверенный советник Меггакрута, Мекжинер Термоштепсель, предал свой народ, позволив вторжению произойти. Теперь, когда его рассудок помутился, Термоштепсель остается в Гномрегане - продвигая свои темные планы и действуя как новый техно-правитель города."
Inst29Caption = "Гномреган"
Inst29QAA = "11 Заданий"
Inst29QAH = "6 Заданий"

--Quest 1 Alliance
Inst29Quest1 = "1. Промыть мозг Техботу"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "20"
Inst29Quest1_Aim = "Принесите ядро памяти Техбота мехмастеру Замыкальцу в Стальгорн."
Inst29Quest1_Location = "Мехмастер Замыкалец (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..")"
Inst29Quest1_Note = "Вы возьмете предшествующее задание у брата Сарно (Штормград - Соборная площадь; "..YELLOW.."50.9, 47.8"..WHITE..").\nВы найдете Техбота перед входом в подземелье около черного входа, "..YELLOW.."[4] на карте входа"..WHITE.."."
Inst29Quest1_Prequest = "Мехмастер Замыкалец"
Inst29Quest1_Folgequest = "Нет"
Inst29Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst29Quest2 = "2. Новая формула"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "20"
Inst29Quest2_Aim = "Соберите радиоактивный осадок, оставляемый облученными захватчиками и облученными погромщиками в пустой свинцовый фиал для образцов. Принесите полный фиал Оззи Триггервольту в Каранос."
Inst29Quest2_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest2_Note = "Вы возьмете предшествующее задание у Гноарна (Стальгорн - Город механиков; "..YELLOW.."69,50"..WHITE..").\nЧтобы собрать осадок используйте фиал на "..RED.."живых"..WHITE.." Облученный захватчиках или Облученных погромщиках."
Inst29Quest2_Prequest = "На другой день"
Inst29Quest2_Folgequest = "Сильное зеленое свечение"
Inst29Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst29Quest3 = "3. Сильное зеленое свечение"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "20"
Inst29Quest3_Aim = "Отправиться в Гномреган и принести высокорадиоактивные образцы. Внимание: отходы нестабильны и довольно быстро разрушаются.\nВернуть Оззи тяжелую освинцованную склянку для проб, когда задача будет выполнена."
Inst29Quest3_Location = "Оззи Триггервольт (Дун Морог - Каранос; "..YELLOW.."45,49"..WHITE..")"
Inst29Quest3_Note = "Чтобы собрать образцы используйте фиал на "..RED.."живых"..WHITE.." Облученных слизях или ужасах."
Inst29Quest3_Prequest = "Новая формула"
Inst29Quest3_Folgequest = "Нет"
Inst29Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst29Quest4 = "4. Сооружение автогиробуророек"
Inst29Quest4_Level = "30"
Inst29Quest4_Attain = "20"
Inst29Quest4_Aim = "Принесите Шони в Штормград 24 порции механических внутренностей роботов."
Inst29Quest4_Location = "Шони Молшунья (Штормград - Квартал дворфов; "..YELLOW.."62.6, 34.1"..WHITE..")"
Inst29Quest4_Note = "Внутренности падают со всех роботов."
Inst29Quest4_Prequest = "Нет"
Inst29Quest4_Folgequest = "Нет"
--
Inst29Quest4name1 = "Shoni's Disarming Tool"
Inst29Quest4name2 = "Shilly Mitts"

--Quest 5 Alliance
Inst29Quest5 = "5. Базовый элемент"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "24"
Inst29Quest5_Aim = "Принесите 12 базовых элементов Клацморту Гайкокруту в Стальгорн."
Inst29Quest5_Location = "Клацморт Гайкокрут (Стальгорн - Город механиков; "..YELLOW.."68,46"..WHITE..")"
Inst29Quest5_Note = "Вы возьмете предшествующее задание у Матиля (Дарнасс - Терраса Воинов; "..YELLOW.."59,45"..WHITE.."). Предшествующее задание только указывает на задание и необязательно, чтобы взять это.\nБазовые элементы собираются со всех машин, разбросанных по подземелью."
Inst29Quest5_Prequest = "Базовые элементы Клацморта"
Inst29Quest5_Folgequest = "Нет"
Inst29Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst29Quest6 = "6. Спасение данных"
Inst29Quest6_Level = "30"
Inst29Quest6_Attain = "25"
Inst29Quest6_Aim = "Принесите призматическую перфокарту главному механику Чугунотрубзу в Стальгорн."
Inst29Quest6_Location = "Главный механик Чугонотрубз (Стальгорн - Город механиков; "..YELLOW.."69,48"..WHITE..")"
Inst29Quest6_Note = "Вы получите предшествующее задание у Гаксима Ржавошиппи (Когтистые горы; "..YELLOW.."59,67"..WHITE.."). Предшествующее задание только указывает на задание и необязательно, чтобы взять это.\nПустая карта падает случайно. Вы найдете первый терминал около черного входа, перед входом в подземелье около "..YELLOW.."[3] на карте входа"..WHITE..". 3005-B находится около "..YELLOW.."[3]"..WHITE..", 3005-C около "..YELLOW.."[5]"..WHITE.." и 3005-D находится около "..YELLOW.."[6]"..WHITE.."."
Inst29Quest6_Prequest = "Поручение Чугонотрубза"
Inst29Quest6_Folgequest = "Нет"
Inst29Quest6PreQuest = "true"
--
Inst29Quest6name1 = "Repairman's Cape"
Inst29Quest6name2 = "Mechanic's Pipehammer"

--Quest 7 Alliance
Inst29Quest7 = "7. Катавасия"
Inst29Quest7_Level = "30"
Inst29Quest7_Attain = "20"
Inst29Quest7_Aim = "Отведите Керноби к Часовому ходу. Затем отправляйтесь с донесением к Скути в Пиратскую бухту."
Inst29Quest7_Location = "Керноби (Гномреган; "..YELLOW.."[3]"..WHITE..")"
Inst29Quest7_Note = "Задание сопровождения! Вы найдете Скути в Тернистая долина - Пиратская бухта ("..YELLOW.."27,77"..WHITE..")."
Inst29Quest7_Prequest = "Нет"
Inst29Quest7_Folgequest = "Нет"
--
Inst29Quest7name1 = "Fire-welded Bracers"
Inst29Quest7name2 = "Fairywing Mantle"

--Quest 8 Alliance
Inst29Quest8 = "8. Великое предательство"
Inst29Quest8_Level = "35"
Inst29Quest8_Attain = "25"
Inst29Quest8_Aim = "Отправляйтесь в Гномреган и убейте Мекжинера Термоштепселя. Вернитесь к Главному Механику Меггакруту."
Inst29Quest8_Location = "Главный Механик Меггакрут (Стальгорн - Город механиков; "..YELLOW.."68,48"..WHITE..")"
Inst29Quest8_Note = "Вы найдете Термоштепселя около "..YELLOW.."[8]"..WHITE..". Он - последний босс в Гномрегане.\nВо время боя вы должны обезвредить колонны нажатием кнопок на боковой поверхности."
Inst29Quest8_Prequest = "Нет"
Inst29Quest8_Folgequest = "Нет"
--
Inst29Quest8name1 = "Civinad Robes"
Inst29Quest8name2 = "Triprunner Dungarees"
Inst29Quest8name3 = "Dual Reinforced Leggings"

--Quest 9 Alliance
Inst29Quest9 = "9. Кольцо, покрытое грязью"
Inst29Quest9_Level = "34"
Inst29Quest9_Attain = "28"
Inst29Quest9_Aim = "Придумайте, как отчистить кольцо, покрытое грязью."
Inst29Quest9_Location = "Кольцо, покрытое грязью (случайно падает с Посланников из клана Черного Железа в Гномрегане)"
Inst29Quest9_Note = "Кольцо можно почистить с помощью Чистера 5200 в комнате очистки "..YELLOW.."[2]"..WHITE.."."
Inst29Quest9_Prequest = "Нет"
Inst29Quest9_Folgequest = "Возвращение кольца"
-- No Rewards for this quest

--Quest 10 Alliance
Inst29Quest10 = "10. Возвращение кольца"
Inst29Quest10_Level = "34"
Inst29Quest10_Attain = "28"
Inst29Quest10_Aim = "Вы можеть оставить кольцо себе, а можете попытаться найти того, чьи инициалы выгравированы на внутренней стороне кольца."
Inst29Quest10_Location = "Сверкающее золотое кольцо (получено за задание 'Кольцо, покрытое грязью')"
Inst29Quest10_Note = "Сдается  Талвашу де Кисселю (Стальгорн - Палаты Магии; "..YELLOW.."36,3"..WHITE.."). Последующее улучшение кольца на ваше усмотрение."
Inst29Quest10_Prequest = "Кольцо, покрытое грязью"
Inst29Quest10_Folgequest = "Гномское усовершенствование"
Inst29Quest10FQuest = "true"
--
Inst29Quest10name1 = "Brilliant Gold Ring"

--Quest 11 Alliance
Inst29Quest11 = "11. Чистер 5200!"
Inst29Quest11_Level = "30"
Inst29Quest11_Attain = "25"
Inst29Quest11_Aim = "Опустите покрытый грязью предмет и три серебряные монеты в Чистер 5200."
Inst29Quest11_Location = "Чистер 5200 (Гномреган - Комната очистки; "..YELLOW.."[2]"..WHITE..")"
Inst29Quest11_Note = "Вы можите повторить задание, если у вас есть 'Покрытый грязью предмет'."
Inst29Quest11_Prequest = "Нет"
Inst29Quest11_Folgequest = "Нет"
--
Inst29Quest11name1 = "Sparklematic-Wrapped Box"


--Quest 1 Horde
Inst29Quest1_HORDE = "1. Поехалиии!"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "20"
Inst29Quest1_HORDE_Aim = "Дождитесь, пока Скути настроит гоблинский импульсный повторитель."
Inst29Quest1_HORDE_Location = "Скути (Тернистая долина - Пиратская бухта; "..YELLOW.."27,77"..WHITE..")"
Inst29Quest1_HORDE_Note = "Вы получите предшествующее задание у Совика (Оргриммар - Аллея Чести; "..YELLOW.."75,25"..WHITE..").\nПосле выполнения этого задания вы сможете использовать телепортатор в Пиратской бухте."
Inst29Quest1_HORDE_Prequest = "Главный инженер Скути"
Inst29Quest1_HORDE_Folgequest = "Нет"
Inst29Quest1PreQuest_HORDE = "true"
--
Inst29Quest1name1_HORDE = "Goblin Transponder"

--Quest 2 Horde  (same as Quest 7 Alliance)
Inst29Quest2_HORDE = "2. Катавасия"
Inst29Quest2_HORDE_Level = Inst29Quest7_Level
Inst29Quest2_HORDE_Attain = Inst29Quest7_Attain
Inst29Quest2_HORDE_Aim = Inst29Quest7_Aim
Inst29Quest2_HORDE_Location = Inst29Quest7_Location
Inst29Quest2_HORDE_Note = Inst29Quest7_Note
Inst29Quest2_HORDE_Prequest = Inst29Quest7_Prequest
Inst29Quest2_HORDE_Folgequest = Inst29Quest7_Folgequest
--
Inst29Quest2name1_HORDE = Inst29Quest7name1
Inst29Quest2name2_HORDE = Inst29Quest7name2

--Quest 3 Horde
Inst29Quest3_HORDE = "3. Техновойны"
Inst29Quest3_HORDE_Level = "35"
Inst29Quest3_HORDE_Attain = "25"
Inst29Quest3_HORDE_Aim = "Добудьте в Гномрегане чертежи боевой машины и код от сейфа Термоштепселя в Гномрегане и принесите их Ноггу в Оргриммар."
Inst29Quest3_HORDE_Location = "Ногг (Оргриммар - Аллея Чести; "..YELLOW.."75,25"..WHITE..")"
Inst29Quest3_HORDE_Note = "Вы найдете Термоштепселя около "..YELLOW.."[8]"..WHITE..". Он - последний босс в Гномрегане.\nВо время боя вы должны обезвредить колонны нажатием кнопок на боковой поверхности."
Inst29Quest3_HORDE_Prequest = "Нет"
Inst29Quest3_HORDE_Folgequest = "Нет"
--
Inst29Quest3name1_HORDE = "Civinad Robes"
Inst29Quest3name2_HORDE = "Triprunner Dungarees"
Inst29Quest3name3_HORDE = "Dual Reinforced Leggings"

--Quest 4 Horde  (same as Quest 9 Alliance)
Inst29Quest4_HORDE = "4. Кольцо, покрытое грязью"
Inst29Quest4_HORDE_Level = Inst29Quest9_Level
Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
Inst29Quest4_HORDE_Location = Inst29Quest9_Location
Inst29Quest4_HORDE_Note = Inst29Quest9_Note
Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
-- No Rewards for this quest

--Quest 5 Horde
Inst29Quest5_HORDE = "5. Возвращение кольца"
Inst29Quest5_HORDE_Level = "34"
Inst29Quest5_HORDE_Attain = "28"
Inst29Quest5_HORDE_Aim = "Вы можеть оставить кольцо себе, а можете попытаться найти того, чьи инициалы выгравированы на внутренней стороне кольца."
Inst29Quest5_HORDE_Location = "Сверкающее золотое кольцо (получено за задание 'Кольцо, покрытое грязью')"
Inst29Quest5_HORDE_Note = "Сдается Ноггу (Оргриммар - The Аллея Чести; "..YELLOW.."75,25"..WHITE.."). Последующее улучшение кольца на ваше усмотрение."
Inst29Quest5_HORDE_Prequest = "Кольцо, покрытое грязью"
Inst29Quest5_HORDE_Folgequest = "Переделка кольца"
Inst29Quest5FQuest = "true"
--
Inst29Quest5name1_HORDE = "Brilliant Gold Ring"

--Quest 6 Horde
Inst29Quest6_HORDE = "6. Чистер 5200!"
Inst29Quest6_HORDE_Level = "30"
Inst29Quest6_HORDE_Attain = "25"
Inst29Quest6_HORDE_Aim = "Опустите покрытый грязью предмет и три серебряные монеты в Чистер 5200."
Inst29Quest6_HORDE_Location = "Чистер 5200 (Гномреган - Комната очистки; "..YELLOW.."[2]"..WHITE..")"
Inst29Quest6_HORDE_Note = "Вы можите повторить задание, если у вас есть 'Покрытый грязью предмет'."
Inst29Quest6_HORDE_Prequest = "Нет"
Inst29Quest6_HORDE_Folgequest = "Нет"
--
Inst29Quest6name1_HORDE = "Sparklematic-Wrapped Box"



--------------- INST37 - HFC: Ramparts (Ramp) ---------------

Inst37Story = {
  ["Page1"] = "В выжженоом мире Запределья, в самом сердце полуострова Адского пламени возвышается Цитадель Адского пламени, почти неприступный бастион, который служил опорной базой Орды во времена Первой и Второй войн. На протяжении долгих лет об этой циклопической крепости думали, что она заброшена...\n \nДо недвнего времени.\n \nНесмотря не то, чтьо большая часть Дренора была раздроблена безрассудным Нер'зулом, Цитадель Адского пламени осталась нетронутой – заселенная сейчас мародерствующими, краснокожими, яростными орками Скверны. Хотя присутствие этого нового, первобытного племени представляет собой какую-то тайну, что еще более ошеломляюще, так это количество этих орков Скверны, которое к тому же все увеличивается.\n \nВопреки тому, что Тралл и Гром Адский Крик успешно положили конец порче Орды убийством Маннороха, существуют свидетельства того, что орки-варвары Цитадели Адского пламени как-то умудрились найти новый источник порчи, чтобы подпитывать их примитивную Жажду крови.",
  ["Page2"] = "Управляет ли кто-либо этими орками - неизвестно, хотя очень хочется верить, что они не работают на Пылающий легион.\n \nВозможно самые тревожные вести это идущие из Запределья доклады об оглушительных, первобытных воплях исходящих из глубин цитадели. Многие начали предполагать, что эти загадочные вспышки как-то связаны с испорченными орками Скверны и увеличением их числа. К сожалению эти вопросы остаются без ответа.\n \nПо крайней мере сейчас.",
  ["MaxPages"] = "2",
};
Inst37Caption = "ЦАП: Бастионы"
Inst37QAA = "3 Задания"
Inst37QAH = "3 Задания"
Inst37General = {
    {
    "Начальник стражи Гарголмар",
    "У него 2 адда. Обоих можно контролить и нужно контролить или убивать перед тем, как приняться за Гарголмара. Гарголмар сам по себе наност приличный урон в ближнем бою",
    RED .. "Смертельная рана:" .. WHITE .. " Гарголмар иногда накладывает на главного танка суммирующийся дебафф, который уменьшает получаемое лечение на 10% за очко. Второй танк не нужен, потому что обычно он не суммируется больше 40%(он умирает быстрее).",
    },

    {
    "Омор Неодолимый",
    "У Омора есть сильная магическая дальняя атака, но в ближнем бою он слаб. Он использует только магию, если аггро зарабатывает кто-то не ближнего боя.",
    RED .. "Призыв гончей" .. WHITE .. ": Каждые несколько секунд Омор призывает 'Дьявольскую гончую'. Эти гончие сильны, но имеют мало ХП. Их нужно убивать/фокусироваться немедленно.",
    },

    {
    "Вазруден и Назан",
    "Вазруден спешивается когда вы убиваете 2 охранников перед платформой. Когда у Вазрудена остается около 20% ХП приземляется Назан и атакует. Назан действительно силен и труднейший бой в ЦАП: Бастионы",
    "Вазруден(): Ничего?\n" .. RED .. "Назан(Дыхание дракона)" .. WHITE .. ": Назан наносит большой огненный урон перед собой. Танк должен отвернуть дракона от группы.\n" .. RED .. "Назан(Огнеметание)" .. WHITE .. ": Назан кидает в вас огненные шары, которые наносят приличный урон(-2k) и поджигают землю(-600огонь/с). Все должны выбегать из огня!",
    },
};

--Quest 1 Alliance
Inst37Quest1 = "1. Ослабить оборону валов"
Inst37Quest1_Level = "62"
Inst37Quest1_Attain = "59"
Inst37Quest1_Aim = "Убейте начальника стражи Гарголмара, Омора Неодолимого и дракона Назана. Принесите руку Гарголмара, копыто Омора и голову Назана Пушкаренку в Оплот Чести на Полуострове Адского Пламени."
Inst37Quest1_Location = "Лейтенант Чадвик (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."57,66"..WHITE..")"
Inst37Quest1_Note = "Гарголмар находится около "..YELLOW.."[1]"..WHITE..", Омор находится около "..YELLOW.."[2]"..WHITE.." и Назан находится около "..YELLOW.."[3]"..WHITE..". Пушкаренок находится около (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."56,67"..WHITE.."). \n\nЧтобы взять это задание, Вы должны выполнить 'Дурные предзнаменования', которое начинается с 'Узнай врага в лицо!' у Командира армии Даната Троллебоя (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."57,67"..WHITE..")."
Inst37Quest1_Prequest = "Узнай врага в лицо! -> Дурные предзнаменования"
Inst37Quest1_Folgequest = "В сердце ярости ("..YELLOW.."ЦАП: Кузня Крови"..WHITE..")"
Inst37Quest1PreQuest = "true"
--
Inst37Quest1name1 = "Handguards of Precision"
Inst37Quest1name2 = "Jade Воитель Pauldrons"
Inst37Quest1name3 = "Mantle of Magical Might"
Inst37Quest1name4 = "Sure-Step Boots"

--Quest 2 Alliance
Inst37Quest2 = "2. Темные вести"
Inst37Quest2_Level = "62"
Inst37Quest2_Attain = "59"
Inst37Quest2_Aim = "Доставьте угрожающее письмо боевому командиру Данату Троллебою в Оплот Чести на Полуострове Адского Пламени."
Inst37Quest2_Location = "Угрожающее письмо (падает с Вазрудена Глашатая; "..YELLOW.."[3]"..WHITE..")"
Inst37Quest2_Note = "Командир армии Данат Троллебой находится около "..YELLOW.."57,67"..WHITE.." в Оплоте Чести."
Inst37Quest2_Prequest = "Нет"
Inst37Quest2_Folgequest = "Кровь есть жизнь ("..YELLOW.."ЦАП: Кузня Крови"..WHITE..")"
Inst37Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst37Quest3 = "3. Заказ: Ездовой хлыстик Назана (Героическое (ежедн.))"
Inst37Quest3_Level = "70"
Inst37Quest3_Attain = "70"
Inst37Quest3_Aim = "Торговец ветром Зерим просит вас добыть ездовой хлыстик Назана. Доставьте его ему в Нижний Город Шаттрата и получите награду."
Inst37Quest3_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst37Quest3_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nНазан находится около "..YELLOW.."[3]"..WHITE.."."
Inst37Quest3_Prequest = "Нет"
Inst37Quest3_Folgequest = "Нет"
--
Inst37Quest3name1 = "Знак справедливости"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPCs and pre-quest)
Inst37Quest1_HORDE = Inst37Quest1
Inst37Quest1_HORDE_Level = Inst37Quest1_Level
Inst37Quest1_HORDE_Attain = Inst37Quest1_Attain
Inst37Quest1_HORDE_Aim = "Убейте начальника стражи Гарголмара, Омора Неодолимого и дракона Назана. Принесите руку Гарголмара, копыто Омора и голову Назана Каза'ресу в Траллмар на Полуострове Адского Пламени."
Inst37Quest1_HORDE_Location = "Каменный стражник Сток'тон (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE..")"
Inst37Quest1_HORDE_Note = "Гарголмар находится около "..YELLOW.."[1]"..WHITE..", Омор находится около "..YELLOW.."[2]"..WHITE.." and Назан находится около "..YELLOW.."[3]"..WHITE..". Каза'рес находится около (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE.."). \n\nЧтобы взять это задание, вы должны выполнить 'Передовая застава: Останки Сквернобота', которое начинается с задания 'Через Темный портал' получаемого вами у Темного портала в Выжженных землях."
Inst37Quest1_HORDE_Prequest = "Через Темный портал -> Передовая застава: Останки Сквернобота"
Inst37Quest1_HORDE_Folgequest = Inst37Quest1_Folgequest
Inst37Quest1PreQuest_HORDE = Inst37Quest1PreQuest
--
Inst37Quest1name1_HORDE = Inst37Quest1name1
Inst37Quest1name2_HORDE = Inst37Quest1name2
Inst37Quest1name3_HORDE = Inst37Quest1name3
Inst37Quest1name4_HORDE = Inst37Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst37Quest2_HORDE = Inst37Quest2
Inst37Quest2_HORDE_Level = Inst37Quest2_Level
Inst37Quest2_HORDE_Attain = Inst37Quest2_Attain
Inst37Quest2_HORDE_Aim = "Доставьте угрожающее письмо Назгрелу в Траллмар на Полуострове Адского Пламени."
Inst37Quest2_HORDE_Location = Inst37Quest2_Location
Inst37Quest2_HORDE_Note = "Назгрел находится около "..YELLOW.."55,36"..WHITE.." в Траллмаре."
Inst37Quest2_HORDE_Prequest = Inst37Quest2_Prequest
Inst37Quest2_HORDE_Folgequest = Inst37Quest2_Folgequest
Inst37Quest2FQuest_HORDE = Inst37Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst37Quest3_HORDE = Inst37Quest3
Inst37Quest3_HORDE_Level = Inst37Quest3_Level
Inst37Quest3_HORDE_Attain = Inst37Quest3_Attain
Inst37Quest3_HORDE_Aim = Inst37Quest3_Aim
Inst37Quest3_HORDE_Location = Inst37Quest3_Location
Inst37Quest3_HORDE_Note = Inst37Quest3_Note
Inst37Quest3_HORDE_Prequest = Inst37Quest3_Prequest
Inst37Quest3_HORDE_Folgequest = Inst37Quest3_Folgequest
--
Inst37Quest3name1_HORDE = Inst37Quest3name1



--------------- INST38 - HFC: Blood Furnace (BF) ---------------

Inst38Story = {
  ["Page1"] = "В выжженоом мире Запределья, в самом сердце полуострова Адского пламени возвышается Цитадель Адского пламени, почти неприступный бастион, который служил опорной базой Орды во времена Первой и Второй войн. На протяжении долгих лет об этой циклопической крепости думали, что она заброшена...\n \nДо недвнего времени.\n \nНесмотря не то, чтьо большая часть Дренора была раздроблена безрассудным Нер'зулом, Цитадель Адского пламени осталась нетронутой – заселенная сейчас мародерствующими, краснокожими, яростными орками Скверны. Хотя присутствие этого нового, первобытного племени представляет собой какую-то тайну, что еще более ошеломляюще, так это количество этих орков Скверны, которое к тому же все увеличивается.\n \nВопреки тому, что Тралл и Гром Адский Крик успешно положили конец порче Орды убийством Маннороха, существуют свидетельства того, что орки-варвары Цитадели Адского пламени как-то умудрились найти новый источник порчи, чтобы подпитывать их примитивную Жажду крови.",
  ["Page2"] = "Управляет ли кто-либо этими орками - неизвестно, хотя очень хочется верить, что они не работают на Пылающий легион.\n \nВозможно самые тревожные вести это идущие из Запределья доклады об оглушительных, первобытных воплях исходящих из глубин цитадели. Многие начали предполагать, что эти загадочные вспышки как-то связаны с испорченными орками Скверны и увеличением их числа. К сожалению эти вопросы остаются без ответа.\n \nПо крайней мере сейчас.",
  ["MaxPages"] = "2",
};
Inst38Caption = "ЦАП: Кузня крови"
Inst38QAA = "3 Задания"
Inst38QAH = "3 Задания"
Inst38General = {
    {
    "Мастер",
    "Легкий бой. Он наносит действительно небольшой урон в ближнем бою. Просто танкуйте и убивайте",
    RED .. "Отброс" .. WHITE .. " Он подбрасывает всех в воздух(очистка аггросписка или уменьшение аггро).\n" .. RED .. "Контроль разума" .. WHITE .. ": Он контролирует случайного игрока и увеличивает его урон.",
    },

    {
    "Броггок",
    "Трудный бой. Бой начинается когда вы нажимаете на рычаг в средине комнаты. Перед тем как вы сразитесь с боссом вас атакуют 4 волны мобов. Между волнами вы не можете отпиться, поэтому шипайте(или кр) моба последней волны, чтобы восполнить ману для убийства босса.",
   RED .. "4 волны:" .. WHITE .. " Первая группа это четыре нормальных моба, вторая это 3 нормалных и один элитный, третья это 2 нормальных и 2 элитных, последняя - 1 нормальный и 3 элитных.\n" .. RED .. "Ядовитое дыхание:" .. WHITE .. " Он наносит урон всем игрокам перед собой.\n" .. RED .. "Ядовитая бомба:" .. WHITE .. " Он бросает бомбу в случайного игрока. Бомба наносит меньше урона, но в этом месте появляется ядовитая лужа и наносит урон(650/с) всем кто в ней стоит.",
    },

    {
    "Кели'дан Разрушитель",
    "Последний босс и не очень сложный. Бой начинается, если вы атакуете парней рядом с ним, когда они все умрут он начнет атаковать вас.",
   RED .. "Адды:" .. WHITE .. " Они колдуют Стрелу тьмы и накладывают дебафф(магия) который увеличивает получаемый урон от темной магии на 1000. Снимайте его как можно быстрее.\n" .. RED .. "Залп тьмы:" .. WHITE .. " 3 стрелы тьмы, небольшой урон без дебаффа.\n" .. RED .. "Кольцо огня:" .. WHITE .. " Каждые несколько секунд он кричит 'Подойди ближе!' и перестает атаковать. После 2-5(не точно) секунд он колдует сильное Кольцо огня(большой радиус действия). Поэтому увидев его кричащим - убегайте.",
    },
};

--Quest 1 Alliance
Inst38Quest1 = "1. Кровь есть жизнь"
Inst38Quest1_Level = "63"
Inst38Quest1_Attain = "59"
Inst38Quest1_Aim = "Принесите 10 фиалов крови орков Скверны Пушкаренку в Оплот Чести на Полуострове Адского Пламени."
Inst38Quest1_Location = "Пушкаренок (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."56,67"..WHITE..")"
Inst38Quest1_Note = "Со всех орков в Кузне крови падают фиалы крови."
Inst38Quest1_Prequest = "Темные вести ("..YELLOW.."ЦАП: Бастионы"..WHITE..")"
Inst38Quest1_Folgequest = "Нет"
Inst38Quest1PreQuest = "true"
--
Inst38Quest1name1 = "Breastplate of Retribution"
Inst38Quest1name2 = "Deadly Borer Leggings"
Inst38Quest1name3 = "Moonkin Headdress"
Inst38Quest1name4 = "Scaled Legs of Ruination"

--Quest 2 Alliance
Inst38Quest2 = "2. В сердце ярости"
Inst38Quest2_Level = "63"
Inst38Quest2_Attain = "59"
Inst38Quest2_Aim = "Детально изучите Кузню Крови и доложите об увиденном командиру армии Данату Троллебою в Оплот Чести на Полуострове Адского Пламени."
Inst38Quest2_Location = "Пушкаренок (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."56,67"..WHITE..")."
Inst38Quest2_Note = "Задание завершается в комнате последнего босса. Командир армии Данат Троллебой находится около "..YELLOW.."57,67"..WHITE.." в Оплоте Чести."
Inst38Quest2_Prequest = "Ослабить оборону валов ("..YELLOW.."ЦАП: Бастионы"..WHITE..")"
Inst38Quest2_Folgequest = "Нет"
Inst38Quest2PreQuest = "true"
--
Inst38Quest2name1 = "Crimson Pendant of Clarity"
Inst38Quest2name2 = "Holy Healing Band"
Inst38Quest2name3 = "Perfectly Balanced Cape"

--Quest 3 Alliance
Inst38Quest3 = "3. Заказ: Украшенный перьями посох Кели'дана (Героическое (ежедн.))"
Inst38Quest3_Level = "70"
Inst38Quest3_Attain = "70"
Inst38Quest3_Aim = "Торговец ветром Зерим просит вас добыть украшенный перьями посох Кели'дана. Принесите его ему в Нижний Город Шаттрата и получите награду."
Inst38Quest3_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst38Quest3_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nКели'дан Разрушитель находится около "..YELLOW.."[3]"..WHITE.."."
Inst38Quest3_Prequest = "Нет"
Inst38Quest3_Folgequest = "Нет"
--
Inst38Quest3name1 = "Знак справедливости"


--Quest 1 Horde  (same as Quest 1 Alliance - different NPC to turn in)
Inst38Quest1_HORDE = Inst38Quest1
Inst38Quest1_HORDE_Level = Inst38Quest1_Level
Inst38Quest1_HORDE_Attain = Inst38Quest1_Attain
Inst38Quest1_HORDE_Aim = "Принесите 10 фиалов крови орков Скверны центуриону Каза'ресу в Траллмар на Полуострове Адского Пламени."
Inst38Quest1_HORDE_Location = "Каза'рес (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest1_HORDE_Note = Inst38Quest1_Note
Inst38Quest1_HORDE_Prequest = Inst38Quest1_Prequest
Inst38Quest1_HORDE_Folgequest = Inst38Quest1_Folgequest
Inst38Quest1PreQuest_HORDE = Inst38Quest1PreQuest
--
Inst38Quest1name1_HORDE = Inst38Quest1name1
Inst38Quest1name2_HORDE = Inst38Quest1name2
Inst38Quest1name3_HORDE = Inst38Quest1name3
Inst38Quest1name4_HORDE = Inst38Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst38Quest2_HORDE = Inst38Quest2
Inst38Quest2_HORDE_Level = Inst38Quest2_Level
Inst38Quest2_HORDE_Attain = Inst38Quest2_Attain
Inst38Quest2_HORDE_Aim = "Детально изучите Кузню Крови и доложите об увиденном Назгрелу в Траллмар на Полуострове Адского Пламени."
Inst38Quest2_HORDE_Location = "Каза'рес (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE..")"
Inst38Quest2_HORDE_Note = "Задание завершается в комнате последнего босса. Назгрел находится около Полуостров Адского пламени - Траллмар ("..YELLOW.."55,36"..WHITE..")."
Inst38Quest2_HORDE_Prequest = Inst38Quest2_Prequest
Inst38Quest2_HORDE_Folgequest = Inst38Quest2_Folgequest
Inst38Quest2PreQuest_HORDE = Inst38Quest2PreQuest
--
Inst38Quest2name1_HORDE = Inst38Quest2name1
Inst38Quest2name2_HORDE = Inst38Quest2name2
Inst38Quest2name3_HORDE = Inst38Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst38Quest3_HORDE = Inst38Quest3
Inst38Quest3_HORDE_Level = Inst38Quest3_Level
Inst38Quest3_HORDE_Attain = Inst38Quest3_Attain
Inst38Quest3_HORDE_Aim = Inst38Quest3_Aim
Inst38Quest3_HORDE_Location = Inst38Quest3_Location
Inst38Quest3_HORDE_Note = Inst38Quest3_Note
Inst38Quest3_HORDE_Prequest = Inst38Quest3_Prequest
Inst38Quest3_HORDE_Folgequest = Inst38Quest3_Folgequest
--
Inst38Quest3name1_HORDE = Inst38Quest3name1



--------------- INST39 - HFC: Shattered Halls (SH) ---------------

Inst39Story = {
  ["Page1"] = "В выжженоом мире Запределья, в самом сердце полуострова Адского пламени возвышается Цитадель Адского пламени, почти неприступный бастион, который служил опорной базой Орды во времена Первой и Второй войн. На протяжении долгих лет об этой циклопической крепости думали, что она заброшена...\n \nДо недвнего времени.\n \nНесмотря не то, чтьо большая часть Дренора была раздроблена безрассудным Нер'зулом, Цитадель Адского пламени осталась нетронутой – заселенная сейчас мародерствующими, краснокожими, яростными орками Скверны. Хотя присутствие этого нового, первобытного племени представляет собой какую-то тайну, что еще более ошеломляюще, так это количество этих орков Скверны, которое к тому же все увеличивается.\n \nВопреки тому, что Тралл и Гром Адский Крик успешно положили конец порче Орды убийством Маннороха, существуют свидетельства того, что орки-варвары Цитадели Адского пламени как-то умудрились найти новый источник порчи, чтобы подпитывать их примитивную Жажду крови.",
  ["Page2"] = "Управляет ли кто-либо этими орками - неизвестно, хотя очень хочется верить, что они не работают на Пылающий легион.\n \nВозможно самые тревожные вести это идущие из Запределья доклады об оглушительных, первобытных воплях исходящих из глубин цитадели. Многие начали предполагать, что эти загадочные вспышки как-то связаны с испорченными орками Скверны и увеличением их числа. К сожалению эти вопросы остаются без ответа.\n \nПо крайней мере сейчас.",
  ["MaxPages"] = "2",
};
Inst39Caption = "ЦАП: Разрушенные залы"
Inst39QAA = "10 Заданий"
Inst39QAH = "9 Заданий"

--Quest 1 Alliance
Inst39Quest1 = "1. Угли Скверны"
Inst39Quest1_Level = "70"
Inst39Quest1_Attain = "67"
Inst39Quest1_Aim = "Принесите уголь Скверны волхву Забраксис из Оплота Чести."
Inst39Quest1_Location = "Волхв Забраксис (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."54,66"..WHITE..")"
Inst39Quest1_Note = "Послее убийства Главного чернокнижника Пустоклята около "..YELLOW.."[2]"..WHITE..", он выронит амулет. Используйте амулет на одной из жаровен около его трона, чтобы получить уголь Скверны."
Inst39Quest1_Prequest = "Нет"
Inst39Quest1_Folgequest = "Нет"
--
Inst39Quest1name1 = "Curate's Boots"
Inst39Quest1name2 = "Rune-Engraved Belt"
Inst39Quest1name3 = "Gloves of Preservation"
Inst39Quest1name4 = "Expedition Scout's Epaulets"
Inst39Quest1name5 = "Dauntless Handguards"

--Quest 2 Alliance
Inst39Quest2 = "2. Элита Орды Скверны"
Inst39Quest2_Level = "70"
Inst39Quest2_Attain = "66"
Inst39Quest2_Aim = "Убейте 8 легионеров клана Изувеченной Длани, 8 центурионов клана Изувеченной Длани и 4 воителей клана Изувеченной Длани по приказу боевого командира Ромуса из Оплота Чести."
Inst39Quest2_Location = "Боевой командир Ромус (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."57,63"..WHITE..")"
Inst39Quest2_Note = "Вы найдете центурионов в Зале поединков."
Inst39Quest2_Prequest = "Нет"
Inst39Quest2_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 3 Alliance
Inst39Quest3 = "3. Новый поворот событий"
Inst39Quest3_Level = "70"
Inst39Quest3_Attain = "67"
Inst39Quest3_Aim = "Принесите кулак вождя Каргата боевому командиру Данату Троллебою в Оплот Чести."
Inst39Quest3_Location = "Командир армии Данат Троллебой (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."57,67"..WHITE..")"
Inst39Quest3_Note = "Вождь Каргат Острорук находится около "..YELLOW.."[5]"..WHITE.."."
Inst39Quest3_Prequest = "Нет"
Inst39Quest3_Folgequest = "Нет"
--
Inst39Quest3name1 = "Nethekurse's Rod of Torment"
Inst39Quest3name2 = "Mantle of Vivification"
Inst39Quest3name3 = "Naliko's Revenge"
Inst39Quest3name4 = "Medallion of the Valiant Guardian"

--Quest 4 Alliance
Inst39Quest4 = "4. Узник Цитадели (Героическое)"
Inst39Quest4_Level = "70"
Inst39Quest4_Attain = "70"
Inst39Quest4_Aim = "Спасите капитана Алину в Цитадели Адского Пламени до того, как ее казнят."
Inst39Quest4_Location = "Рэнди Свистельник (Разрушенные залы; "..YELLOW.."Героическое [1]"..WHITE..")"
Inst39Quest4_Note = "Это задание выполняется в режиме героической сложности.\n\nКапитан Алина находится около "..YELLOW.."[5]"..WHITE..". Таймер отсчитывает 50 минут с начала события Лучника."
Inst39Quest4_Prequest = "Нет"
Inst39Quest4_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 5 Alliance
Inst39Quest5 = "5. Испытание Наару: милосердие (Героическое)"
Inst39Quest5_Level = "70"
Inst39Quest5_Attain = "70"
Inst39Quest5_Aim = "А'дал из Шаттрата просит добыть неиспользованный топор палача из Разрушенных залов Цитадели Адского Пламени."
Inst39Quest5_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst39Quest5_Note = "Это задание выполняется в режиме героической сложности.\n\nЭто задание нужно было выполнить, чтобы войти в Крепость Бурь: Око, но больше не необходимо."
Inst39Quest5_Prequest = "Нет"
Inst39Quest5_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 6 Alliance
Inst39Quest6 = "6. Слеза Матери-Земли"
Inst39Quest6_Level = "70"
Inst39Quest6_Attain = "70"
Inst39Quest6_Aim = "Добудьте слезу Матери-Земли у О'мрогга Завоевателя и принесите ее Давиду Вейну в приют Вейна."
Inst39Quest6_Location = "Давид Вейн (Лес Тероккар - Приют Уэйна; "..YELLOW.."78,39"..WHITE..")."
Inst39Quest6_Note = "О'мрогг Завоеватель находится около "..YELLOW.."[4]"..WHITE..".\n\nПредмет не падает на Героической сложности."
Inst39Quest6_Prequest = "Новинка из Механара ("..YELLOW.."КБ: Механар"..WHITE..") & Демонический словарь ("..YELLOW.."Аук: Темный лабиринт"..WHITE..")"
Inst39Quest6_Folgequest = "Проклятие иллидари"
Inst39Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst39Quest7 = "7. Требование Калинны (Героическое)"
Inst39Quest7_Level = "70"
Inst39Quest7_Attain = "70"
Inst39Quest7_Aim = "Калинна Латред требует отыскать и принести ей Фолиант Сумерек и Книгу Забытых Имен. Первой владеет главный чернокнижник Пустоклят, его можно найти в Разрушенных залах Цитадели Адского Пламени. Вторая принадлежит Темнопряду Ситу, который находится в Сетеккских залах в Аукиндоне."
Inst39Quest7_Location = "Калинна Латред (Пустоверть - Зона 52; "..YELLOW.."32,63"..WHITE..")"
Inst39Quest7_Note = "Это задание выполняется в режиме героической сложности.\n\nГлавный чернокнижник Пустоклят находится около "..YELLOW.."[2]"..WHITE..". Книга Забытых Имен падает в Сетеккских залах."
Inst39Quest7_Prequest = "Взаимовыручка ("..YELLOW.."Каражан"..WHITE..")"
Inst39Quest7_Folgequest = "Ночная Погибель ("..YELLOW.."Каражан"..WHITE..")"
Inst39Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst39Quest8 = "8. Заказ: печать Острорука (Героическое (ежедн.))"
Inst39Quest8_Level = "70"
Inst39Quest8_Attain = "70"
Inst39Quest8_Aim = "Торговец ветром Зерим просит вас добыть печать Острорука. Принесите ее ему в Нижний Город Шаттрата и получите награду."
Inst39Quest8_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest8_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nВождь Каргат Острорук находится около "..YELLOW.."[5]"..WHITE.."."
Inst39Quest8_Prequest = "Нет"
Inst39Quest8_Folgequest = "Нет"
--
Inst39Quest8name1 = "Знак справедливости"

--Quest 9 Alliance
Inst39Quest9 = "9. РАЗЫСКИВАЮТСЯ: Центурионы клана Изувеченной Длани (ежедн.)"
Inst39Quest9_Level = "70"
Inst39Quest9_Attain = "70"
Inst39Quest9_Aim = "Ловчий Пустоты Ма'дуун поручает вам убить 4 центурионов клана Изувеченной Длани. Вернитесь к нему в Нижний Город Шаттрата за наградой, как только перебьете их всех."
Inst39Quest9_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst39Quest9_Note = "Это ежедневное задание."
Inst39Quest9_Prequest = "Нет"
Inst39Quest9_Folgequest = "Нет"
--
Inst39Quest9name1 = "Ethereum Prison Key"

--Quest 10 Alliance
Inst39Quest10 = "10. Вход в цитадель"
Inst39Quest10_Level = "70"
Inst39Quest10_Attain = "68"
Inst39Quest10_Aim = "Принесите форму для отливки ключа боевому командиру Данату в Оплот Чести на Полуострове Ярого Пламени."
Inst39Quest10_Location = "Форма для отливки ключа  (падает с Кузнеца Горлунка в Долине Призрачной луны - Терраса Ата'мала; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest10_Note = "Кузнец, с которого падает форма для ключа, легко убивается соло и до него легко добраться с помощью летающего ездового животного.\n\nКомандир армии Данат находится около (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."57,67"..WHITE.."). Он направит вас к Великому Мастеру Болтую за следующей частью задания в (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."51,60"..WHITE..")..."
Inst39Quest10_Page = {2, "Великий Мастер Болтуй попросит 4 x [Слиток оскверненного железа], 2 x [Чародейная пыль] и 4 x [Частичка Огня].\n\nПосле доставки материалов вам нужно использовать Обожженную форму для отливки ключа, которую он вам дал, на трупе Сквернобота. Вам необязательно убивать Сквернобота самим, просто используйте форму на нем.\n\nВернитесь к Великому мастеру Болтую в (Полуостров Адского пламени - Оплот Чести; "..YELLOW.."51,60"..WHITE..") за наградой.", };
Inst39Quest10_Prequest = "Нет"
Inst39Quest10_Folgequest = "Великий Мастер Болтуй -> Жарче, чем в пекле"
--
Inst39Quest10name1 = "Shattered Halls Key"


--Quest 1 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst39Quest1_HORDE = "1. Элита Орды Скверны"
Inst39Quest1_HORDE_Level = Inst39Quest2_Level
Inst39Quest1_HORDE_Attain = Inst39Quest2_Attain
Inst39Quest1_HORDE_Aim = "Убейте 8 легионеров клана Изувеченной Длани, 8 центурионов клана Изувеченной Длани и 4 воителей из клана Изувеченной Длани по приказу темного охотника Туджина из Траллмара."
Inst39Quest1_HORDE_Location = "Темный охотник Туджин (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest1_HORDE_Note = Inst39Quest2_Note
Inst39Quest1_HORDE_Prequest = Inst39Quest2_Prequest
Inst39Quest1_HORDE_Folgequest = Inst39Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst39Quest2_HORDE = "2. Воля Вождя."
Inst39Quest2_HORDE_Level = "70"
Inst39Quest2_HORDE_Attain = "67"
Inst39Quest2_HORDE_Aim = "Принесите Кулак Вождя Каргата Назгрелу в Траллмар."
Inst39Quest2_HORDE_Location = "Назгрел (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE..")"
Inst39Quest2_HORDE_Note = "Вождь Каргат Острорук находится около "..YELLOW.."[5]"..WHITE.."."
Inst39Quest2_HORDE_Prequest = "Нет"
Inst39Quest2_HORDE_Folgequest = "Нет"
--
Inst39Quest2name1_HORDE = "Rod of Dire Shadows"
Inst39Quest2name2_HORDE = "Vicar's Cloak"
Inst39Quest2name3_HORDE = "Conquerer's Band"
Inst39Quest2name4_HORDE = "Maimfist's Choker"

--Quest 3 Horde
Inst39Quest3_HORDE = "3. Узник Цитадели (Героическое)"
Inst39Quest3_HORDE_Level = "70"
Inst39Quest3_HORDE_Attain = "70"
Inst39Quest3_HORDE_Aim = "Спасите капитана Костолома в Цитадели Адского Пламени до того, как его казнят."
Inst39Quest3_HORDE_Location = "Дризелла (Разрушенные залы; "..YELLOW.."Героическое [1]"..WHITE..")"
Inst39Quest3_HORDE_Note = "Это задание выполняется в режиме героической сложности.\n\nДризелла находится около "..YELLOW.."[5]"..WHITE..". Таймер отсчитывает 55 минут с начала события Лучника."
Inst39Quest3_HORDE_Prequest = "Нет"
Inst39Quest3_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst39Quest4_HORDE = "4. Испытание Наару: милосердие (Героическое)"
Inst39Quest4_HORDE_Level = Inst39Quest5_Level
Inst39Quest4_HORDE_Attain = Inst39Quest5_Attain
Inst39Quest4_HORDE_Aim = Inst39Quest5_Aim
Inst39Quest4_HORDE_Location = Inst39Quest5_Location
Inst39Quest4_HORDE_Note = Inst39Quest5_Note
Inst39Quest4_HORDE_Prequest = Inst39Quest5_Prequest
Inst39Quest4_HORDE_Folgequest = Inst39Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst39Quest5_HORDE = "5. Слеза Матери-Земли"
Inst39Quest5_HORDE_Level = Inst39Quest6_Level
Inst39Quest5_HORDE_Attain = Inst39Quest6_Attain
Inst39Quest5_HORDE_Aim = Inst39Quest6_Aim
Inst39Quest5_HORDE_Location = Inst39Quest6_Location
Inst39Quest5_HORDE_Note = Inst39Quest6_Note
Inst39Quest5_HORDE_Prequest = Inst39Quest6_Prequest
Inst39Quest5_HORDE_Folgequest = Inst39Quest6_Folgequest
Inst39Quest5PreQuest_HORDE = Inst39Quest6Prequest
-- No Rewards for this quest

--Quest 6 Alliance  (same as Quest 7 Alliance)
Inst39Quest6_HORDE = "6. Требование Калинны (Героическое)"
Inst39Quest6_HORDE_Level = Inst39Quest7_Level
Inst39Quest6_HORDE_Attain = Inst39Quest7_Attain
Inst39Quest6_HORDE_Aim = Inst39Quest7_Aim
Inst39Quest6_HORDE_Location = Inst39Quest7_Location
Inst39Quest6_HORDE_Note = Inst39Quest7_Note
Inst39Quest6_HORDE_Prequest = Inst39Quest7_Prequest
Inst39Quest6_HORDE_Folgequest = Inst39Quest7_Folgequest
Inst39Quest6PreQuest_HORDE = Inst39Quest7PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 8 Alliance)
Inst39Quest7_HORDE = "7. Заказ: печать Острорука (Героическое (ежедн.))"
Inst39Quest7_HORDE_Level = Inst39Quest8_Level
Inst39Quest7_HORDE_Attain = Inst39Quest8_Attain
Inst39Quest7_HORDE_Aim = Inst39Quest8_Aim
Inst39Quest7_HORDE_Location = Inst39Quest8_Location
Inst39Quest7_HORDE_Note = Inst39Quest8_Note
Inst39Quest7_HORDE_Prequest = Inst39Quest8_Prequest
Inst39Quest7_HORDE_Folgequest = Inst39Quest8_Folgequest
--
Inst39Quest7name1_HORDE = Inst39Quest8name1

--Quest 8 Horde  (same as Quest 9 Alliance)
Inst39Quest8_HORDE = "8. РАЗЫСКИВАЮТСЯ: Центурионы клана Изувеченной Длани (ежедн.)"
Inst39Quest8_HORDE_Level = Inst39Quest9_Level
Inst39Quest8_HORDE_Attain = Inst39Quest9_Attain
Inst39Quest8_HORDE_Aim = Inst39Quest9_Aim
Inst39Quest8_HORDE_Location = Inst39Quest9_Location
Inst39Quest8_HORDE_Note = Inst39Quest9_Note
Inst39Quest8_HORDE_Prequest = Inst39Quest9_Prequest
Inst39Quest8_HORDE_Folgequest = Inst39Quest9_Folgequest
--
Inst39Quest8name1_HORDE = Inst39Quest9name1

--Quest 9 Horde
Inst39Quest9_HORDE = "9. Вход в цитадель"
Inst39Quest9_HORDE_Level = "70"
Inst39Quest9_HORDE_Attain = "68"
Inst39Quest9_HORDE_Aim = "Принесите форму для отливки ключа Назгрелу в Траллмар на Полуострове Адского Пламени."
Inst39Quest9_HORDE_Location = "Форма для отливки ключа  (падает с Кузнеца Горлунка в Долине Призрачной луны - Терраса Ата'мала; "..YELLOW.."68,36"..WHITE..")"
Inst39Quest9_HORDE_Note = "Кузнец, с которого падает форма для ключа, легко убивается соло и до него легко добраться с помощью летающего ездового животного.\n\nНазгрел находится около (Полуостров Адского пламени - Траллмар; "..YELLOW.."55,36"..WHITE.."). Он направит вас к Великому мастеру Рохоку за следующей частью задания в (Полуостров Адского пламени - Траллмар; "..YELLOW.."53,38"..WHITE..")..."
Inst39Quest9_HORDE_Page = {2, "Великий мастер Рохок попросит 4 x [Слиток оскверненного железа], 2 x [Чародейная пыль] and 4 x [Частичка Огня].\n\nПосле доставки материалов вам нужно использовать Обожженную форму для отливки ключа, которую он вам дал, на трупе Сквернобота. Вам необязательно убивать Сквернобота самим, просто используйте форму на нем.\n\nВернитесь к Великому мастеру Рохоку в (Полуостров Адского пламени - Траллмар; "..YELLOW.."53,38"..WHITE..") за наградой.", };
Inst39Quest9_HORDE_Prequest = "Нет"
Inst39Quest9_HORDE_Folgequest = "Великий мастер Рохок -> Жарче, чем в пекле"
--
Inst39Quest9name1_HORDE = "Shattered Halls Key"



--------------- INST40 - HFC: Magtheridon's Lair ---------------

Inst40Story = {
  ["Page1"] = "В выжженоом мире Запределья, в самом сердце полуострова Адского пламени возвышается Цитадель Адского пламени, почти неприступный бастион, который служил опорной базой Орды во времена Первой и Второй войн. На протяжении долгих лет об этой циклопической крепости думали, что она заброшена...\n \nДо недвнего времени.\n \nНесмотря не то, чтьо большая часть Дренора была раздроблена безрассудным Нер'зулом, Цитадель Адского пламени осталась нетронутой – заселенная сейчас мародерствующими, краснокожими, яростными орками Скверны. Хотя присутствие этого нового, первобытного племени представляет собой какую-то тайну, что еще более ошеломляюще, так это количество этих орков Скверны, которое к тому же все увеличивается.\n \nВопреки тому, что Тралл и Гром Адский Крик успешно положили конец порче Орды убийством Маннороха, существуют свидетельства того, что орки-варвары Цитадели Адского пламени как-то умудрились найти новый источник порчи, чтобы подпитывать их примитивную Жажду крови.",
  ["Page2"] = "Управляет ли кто-либо этими орками - неизвестно, хотя очень хочется верить, что они не работают на Пылающий легион.\n \nВозможно самые тревожные вести это идущие из Запределья доклады об оглушительных, первобытных воплях исходящих из глубин цитадели. Многие начали предполагать, что эти загадочные вспышки как-то связаны с испорченными орками Скверны и увеличением их числа. К сожалению эти вопросы остаются без ответа.\n \nПо крайней мере сейчас.",
  ["MaxPages"] = "2",
};
Inst40Caption = "ЦАП: Логово Магтеридона"
Inst40QAA = "2 Задания"
Inst40QAH = "2 Задания"

--Quest 1 Alliance
Inst40Quest1 = "1. Испытание Наару: Магтеридон"
Inst40Quest1_Level = "70"
Inst40Quest1_Attain = "70"
Inst40Quest1_Aim = "А'дал из Шаттрата просит вас убить Магтеридона."
Inst40Quest1_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst40Quest1_Note = "Должны быть выполнены Испытание Наару милосердие, Испытание Наару сила и Испытание Наару упорство все у А'дала.\n\nЭто задание нужно было выполнить, чтобы войти в Крепость Бурь: Око, но больше не необходимо."
Inst40Quest1_Prequest = "Испытание Наару: упорство, милосердие & сила."
Inst40Quest1_Folgequest = "Нет"
Inst40Quest1PreQuest = "true"
--
Inst40Quest1name1 = "Phoenix-fire Band"

--Quest 2 Alliance
Inst40Quest2 = "2. Падение Магтеридона"
Inst40Quest2_Level = "70"
Inst40Quest2_Attain = "70"
Inst40Quest2_Aim = "Доставьте голову Магтеридона командиру армии Данату Троллебою в Оплот Чести на Полуострове Адского Пламени."
Inst40Quest2_Location = "Голова Магтеридона (падает с Магтеридона; "..YELLOW.."[1]"..WHITE..")"
Inst40Quest2_Note = "Только один игрок в рейде может выиграть голову и начать задание. Командир армии Данат Троллебой находится около "..YELLOW.."57,67"..WHITE.."."
Inst40Quest2_Prequest = "Нет"
Inst40Quest2_Folgequest = "Нет"
--
Inst40Quest2name1 = "А'дал's Signet of Defense"
Inst40Quest2name2 = "Band of Crimson Fury"
Inst40Quest2name3 = "Naaru Lightwarden's Band"
Inst40Quest2name4 = "Ring of the Recalcitrant"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst40Quest1_HORDE = Inst40Quest1
Inst40Quest1_HORDE_Level = Inst40Quest1_Level
Inst40Quest1_HORDE_Attain = Inst40Quest1_Attain
Inst40Quest1_HORDE_Aim = Inst40Quest1_Aim
Inst40Quest1_HORDE_Location = Inst40Quest1_Location
Inst40Quest1_HORDE_Note = Inst40Quest1_Note
Inst40Quest1_HORDE_Prequest = Inst40Quest1_Prequest
Inst40Quest1_HORDE_Folgequest = Inst40Quest1_Folgequest
Inst40Quest1PreQuest_HORDE = Inst40Quest1PreQuest
--
Inst40Quest1name1_HORDE = Inst40Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance - different NPC to turn in)
Inst40Quest2_HORDE = Inst40Quest2
Inst40Quest2_HORDE_Level = Inst40Quest2_Level
Inst40Quest2_HORDE_Attain = Inst40Quest2_Attain
Inst40Quest2_HORDE_Aim = "Доставьте голову Магтеридона Назгрелу в Траллмар на Полуострове Адского Пламени."
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "Только один игрок в рейде может выиграть голову и начать задание. Назгрел находится около "..YELLOW.."55,36"..WHITE.."."
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
--
Inst40Quest2name1_HORDE = Inst40Quest2name1
Inst40Quest2name2_HORDE = Inst40Quest2name2
Inst40Quest2name3_HORDE = Inst40Quest2name3
Inst40Quest2name4_HORDE = Inst40Quest2name4



--------------- INST41 - CR: The Slave Pens (SP) ---------------

Inst41Story = "Хрупкий баланс экологии Зангартопи был нарушен.\n\nНеестественный феномен исковеркал и разрушил природную флору и фауну болота.\n\nЭти беспорядки проследили до вызывающего нехорошие предчуствия Резервуара Кривого Клыка.\n\nХодят слухи, что предводителем этих таинственных сил является никто иной, как печально известная Леди Вайш.\n\nТолько вы можете раскрыть ее нечестивые планы и предотвратить их, пока не стало слишком поздно.\n\nРезервуар Кривого Клыка разделен на четыре зоны, три из которых - подземелья рассчитанные на 5 игроков (Узилище, Нижетопь, и Паровое подземелье), а еще одна - рейдовое подземелье на 25 человек - Змеиное святилище. "
Inst41Caption = "РКК: Узилище"
Inst41QAA = "4 Заданий"
Inst41QAH = "4 Заданий"

--Quest 1 Alliance
Inst41Quest1 = "1. Погибли при исполнении"
Inst41Quest1_Level = "65"
Inst41Quest1_Attain = "62"
Inst41Quest1_Aim = "Выясните, что стало с землепрядом Гневвсом, натуралистом Кусом, культиватором Зеленопалом и призывателем ветров Когтем. Затем возвращайтесь к дозорному Джанг в Резервуар Кривого Клыка в Зангартопь."
Inst41Quest1_Location = "Дозорный Джанг (Резервуар Кривого Клыка; "..YELLOW.."52,36"..WHITE..")"
Inst41Quest1_Note = "Дозорный Джанг находится в подводной пещере возле Камня встреч. Культиватор Зеленопал находится около "..YELLOW.."[3]"..WHITE..", натуралист Кус около "..YELLOW.."[6]"..WHITE..". Выполнять предшествующие задания чтобы взять это, необязательно."
Inst41Quest1_Prequest = "Схема стоков -> Провалившийся рейд"
Inst41Quest1_Folgequest = "Нет"
Inst41Quest1PreQuest = "true"
--
Inst41Quest1name1 = "Cenarion Ring of Casting"
Inst41Quest1name2 = "Goldenvine Wraps"
Inst41Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst41Quest2 = "2. Требуется: сердце Зыбуна (Героическое (ежедн.))"
Inst41Quest2_Level = "70"
Inst41Quest2_Attain = "70"
Inst41Quest2_Aim = "Добудьте сердце Зыбуна и доставьте его торговцу ветром Зариму в Нижний Город Шаттрата за вознаграждение."
Inst41Quest2_Location = "Торговец ветром Зарим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst41Quest2_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nЗыбун находится около "..YELLOW.."[7]"..WHITE.."."
Inst41Quest2_Prequest = "Нет"
Inst41Quest2_Folgequest = "Нет"
--
Inst41Quest2name1 = "Знак справедливости"

--Quest 3 Alliance
Inst41Quest3 = "3. Дубина Кардеша (Героическое)"
Inst41Quest3_Level = "70"
Inst41Quest3_Attain = "70"
Inst41Quest3_Aim = "Принесите эталоны земли и огня Скартису Еретику в Узилище (героический уровень сложности) в Резервуар Кривого Клыка."
Inst41Quest3_Location = "Скар'тис Еретик (Узилище; "..YELLOW.."Героическое [4]"..WHITE..")"
Inst41Quest3_Note = "Перстень Земли падает с Груула в "..YELLOW.."Логово Груула"..WHITE..", а Эталон огня падает с Ночной Погибели в "..YELLOW.."Каражан"..WHITE..".\n\nЭто задание нужно было выполнить, чтобы войти в Змеиное святилище, но больше не необходимо."
Inst41Quest3_Prequest = "Нет"
Inst41Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst41Quest4 = "4. Осколки Ахуна (Сезонный)"
Inst41Quest4_Level = "70"
Inst41Quest4_Attain = "65"
Inst41Quest4_Aim = "Принесите ледяные осколки Луме Матери Небес."
Inst41Quest4_Location = "Осколки Ахуна (падают из Ледяного сундука после убийства Ахуна, Повелителя Холода)"
Inst41Quest4_Note = "Лума Матерь Небес находится в (Узилище; "..YELLOW.."Около [1]"..WHITE.."). Этот предмет падает один раз в год одному персонажу."
Inst41Quest4_Prequest = "Нет"
Inst41Quest4_Folgequest = "Нет"
--
Inst41Quest4name1 = "Гербовая накидка летних небес"
Inst41Quest4name2 = "Гербовая накидка летнего пламени"
Inst41Quest4name3 = "Пылающий цвет"



--Quest 1 Horde  (same as Quest 1 Alliance)
Inst41Quest1_HORDE = Inst41Quest1
Inst41Quest1_HORDE_Level = Inst41Quest1_Level
Inst41Quest1_HORDE_Attain = Inst41Quest1_Attain
Inst41Quest1_HORDE_Aim = Inst41Quest1_Aim
Inst41Quest1_HORDE_Location = Inst41Quest1_Location
Inst41Quest1_HORDE_Note = Inst41Quest1_Note
Inst41Quest1_HORDE_Prequest = Inst41Quest1_Prequest
Inst41Quest1_HORDE_Folgequest = Inst41Quest1_Folgequest
Inst41Quest1PreQuest_HORDE = Inst41Quest1PreQuest
--
Inst41Quest1name1_HORDE = Inst41Quest1name1
Inst41Quest1name2_HORDE = Inst41Quest1name2
Inst41Quest1name3_HORDE = Inst41Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst41Quest2_HORDE = Inst41Quest2
Inst41Quest2_HORDE_Level = Inst41Quest2_Level
Inst41Quest2_HORDE_Attain = Inst41Quest2_Attain
Inst41Quest2_HORDE_Aim = Inst41Quest2_Aim
Inst41Quest2_HORDE_Location = Inst41Quest2_Location
Inst41Quest2_HORDE_Note = Inst41Quest2_Note
Inst41Quest2_HORDE_Prequest = Inst41Quest2_Prequest
Inst41Quest2_HORDE_Folgequest = Inst41Quest2_Folgequest
--
Inst41Quest2name1_HORDE = Inst41Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst41Quest3_HORDE = Inst41Quest3
Inst41Quest3_HORDE_Level = Inst41Quest3_Level
Inst41Quest3_HORDE_Attain = Inst41Quest3_Attain
Inst41Quest3_HORDE_Aim = Inst41Quest3_Aim
Inst41Quest3_HORDE_Location = Inst41Quest3_Location
Inst41Quest3_HORDE_Note = Inst41Quest3_Note
Inst41Quest3_HORDE_Prequest = Inst41Quest3_Prequest
Inst41Quest3_HORDE_Folgequest = Inst41Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst41Quest4_HORDE = Inst41Quest4
Inst41Quest4_HORDE_Level = Inst41Quest4_Level
Inst41Quest4_HORDE_Attain = Inst41Quest4_Attain
Inst41Quest4_HORDE_Aim = Inst41Quest4_Aim
Inst41Quest4_HORDE_Location = Inst41Quest4_Location
Inst41Quest4_HORDE_Note = Inst41Quest4_Note
Inst41Quest4_HORDE_Prequest = Inst41Quest4_Prequest
Inst41Quest4_HORDE_Folgequest = Inst41Quest4_Folgequest
--
Inst41Quest4name1_HORDE = Inst41Quest4name1
Inst41Quest4name2_HORDE = Inst41Quest4name2
Inst41Quest4name3_HORDE = Inst41Quest4name3



--------------- INST42 - CR: The Steamvault (SV) ---------------

Inst42Story = "Хрупкий баланс экологии Зангартопи был нарушен.\n\nНеестественный феномен исковеркал и разрушил природную флору и фауну болота.\n\nЭти беспорядки проследили до вызывающего нехорошие предчуствия Резервуара Кривого Клыка.\n\nХодят слухи, что предводителем этих таинственных сил является никто иной, как печально известная Леди Вайш.\n\nТолько вы можете раскрыть ее нечестивые планы и предотвратить их, пока не стало слишком поздно.\n\nРезервуар Кривого Клыка разделен на четыре зоны, три из которых - подземелья рассчитанные на 5 игроков (Узилище, Нижетопь, и Паровое подземелье), а еще одна - рейдовое подземелье на 25 человек - Змеиное святилище. "
Inst42Caption = "РКК: Паровое подземелье"
Inst42QAA = "7 Заданий"
Inst42QAH = "7 Заданий"

--Quest 1 Alliance
Inst42Quest1 = "1. Убежище врага"
Inst42Quest1_Level = "70"
Inst42Quest1_Attain = "67"
Inst42Quest1_Aim = "Дозорный Джанг хочет, чтобы вы нашли и убили полководца Калитреша в Резервуаре Кривого Клыка."
Inst42Quest1_Location = "Дозорный Джанг (Резервуар Кривого Клыка; "..YELLOW.."52,36"..WHITE..")"
Inst42Quest1_Note = "Дозорный Джанг находится в подводной пещере недалеко от Камня Встреч. Полководец Калитреш около "..YELLOW.."[4]"..WHITE..". Обязательно уичтожайте баки, когда Калитреш использует их."
Inst42Quest1_Prequest = "Нет"
Inst42Quest1_Folgequest = "Нет"
--
Inst42Quest1name1 = "Hydromancer's Headwrap"
Inst42Quest1name2 = "Helm of the Claw"
Inst42Quest1name3 = "Earthwarden's Coif"
Inst42Quest1name4 = "Myrmidon's Headdress"

--Quest 2 Alliance
Inst42Quest2 = "2. Приказы Леди Вайш"
Inst42Quest2_Level = "70"
Inst42Quest2_Attain = "67"
Inst42Quest2_Aim = "Отнесите приказы Леди Вайш Исиэль Песне Ветра в Ценарионский оплот в Зангартопи."
Inst42Quest2_Location = "Приказы Леди Вайш (случайно падает в Паровом подземелье)"
Inst42Quest2_Note = "Исиэль Песня Ветра находится в Зангартопь - Ценарионский оплот; ("..YELLOW.."78,62"..WHITE.."). Последующее задание позволяет вам сдавать Оружие Змеиного Зуба для репутации с Экспедицией Ценариона. Оружие Змеиного Зуба случайно падает в Паровом подземелье и Змеином святилище и его можно собирать (но не сдавать) до того как вы сделаете это задание. Оно не является персональным, поэтому им можно торговать с другими игроками."
Inst42Quest2_Prequest = "Нет"
Inst42Quest2_Folgequest = "Готовься к войне"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. Испытание Наару: сила (Героическое)"
Inst42Quest3_Level = "70"
Inst42Quest3_Attain = "70"
Inst42Quest3_Aim = "А'дал из Шаттрата просит добыть трезубец Калитреша и сущность Бормотуна."
Inst42Quest3_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest3_Note = "Это задание выполняется в режиме героической сложности. Полководец Калитреш находится около "..YELLOW.."[4]"..WHITE..". Сущность Бормотуна можно найти в Темном лабиринте.\n\nЭто задание нужно было выполнить, чтобы войти в Крепость Бурь: Око, но больше не необходимо."
Inst42Quest3_Prequest = "Нет"
Inst42Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst42Quest4 = "4. Суглинок из Нижнего Мира"
Inst42Quest4_Level = "70"
Inst42Quest4_Attain = "70"
Inst42Quest4_Aim = "Достаньте фиал с суглинком Нижнего Мира у гидроманта Теспии и принесите его Давиду Вейну в Приют Уэйна."
Inst42Quest4_Location = "Давид Вейн (Лес Тероккар - Приют Уэйна; "..YELLOW.."78,39"..WHITE..")"
Inst42Quest4_Note = "Гидромант Теспия находится около "..YELLOW.."[1]"..WHITE..".\n\nПредмет не падает на Героической сложности."
Inst42Quest4_Prequest = "Новинка из Механара ("..YELLOW.."КБ: Механар"..WHITE..") & Демонический словарь ("..YELLOW.."Аук: Темный лабиринт"..WHITE..")"
Inst42Quest4_Folgequest = "Проклятие иллидари"
Inst42Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. Второй и третий фрагменты"
Inst42Quest5_Level = "70"
Inst42Quest5_Attain = "68"
Inst42Quest5_Aim = "Добудьте второй фрагмент ключа из волшебного контейнера в Резервуаре Кривого Клыка, а третий фрагмент ключа – из волшебного контейнера в Крепости Бурь, после чего вернитесь к Кадгару в Шаттрат."
Inst42Quest5_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst42Quest5_Note = "Часть линейки для подготовки к Каражану. Волшебный контейнер находится около "..YELLOW.."[2]"..WHITE..", на дне водоема. При открытии появится элементаль, которого нужно убить, чтобыполучить фрагмент. Третий фрагмент ключа в Аркатраце."
Inst42Quest5_Prequest = "Вход в Каражан ("..YELLOW.."Аук: Темный лабиринт"..WHITE..")"
Inst42Quest5_Folgequest = "Разрешение учителя ("..YELLOW.."ПВ: Черные топи"..WHITE..")"
Inst42Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. Розыск: Мирмидоны Резервуара Кривого Клыка (ежедн.)"
Inst42Quest6_Level = "70"
Inst42Quest6_Attain = "70"
Inst42Quest6_Aim = "Ловчий Пустоты Ма'дуун требует, чтобы вы убили 14 мирмидонов Резервуара Кривого Клыка. По исполнению задания возвращайтесь к Ма'дууну в Нижний Город Шаттрата за вознаграждением."
Inst42Quest6_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest6_Note = "Это ежедневное задание."
Inst42Quest6_Prequest = "Нет"
Inst42Quest6_Folgequest = "Нет"
--
Inst42Quest6name1 = "Ethereum Prison Key"

--Quest 7 Alliance
Inst42Quest7 = "7. Требуется: трактат полководца (Героическое (ежедн.))"
Inst42Quest7_Level = "70"
Inst42Quest7_Attain = "70"
Inst42Quest7_Aim = "Добудьте трактат полководца и доставьте его торговцу ветром Зариму в Нижний Город Шаттрата за вознаграждение."
Inst42Quest7_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst42Quest7_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nПолководец Калитреш находится около "..YELLOW.."[4]"..WHITE.."."
Inst42Quest7_Prequest = "Нет"
Inst42Quest7_Folgequest = "Нет"
--
Inst42Quest7name1 = "Знак справедливости"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst42Quest1_HORDE = Inst42Quest1
Inst42Quest1_HORDE_Level = Inst42Quest1_Level
Inst42Quest1_HORDE_Attain = Inst42Quest1_Attain
Inst42Quest1_HORDE_Aim = Inst42Quest1_Aim
Inst42Quest1_HORDE_Location = Inst42Quest1_Location
Inst42Quest1_HORDE_Note = Inst42Quest1_Note
Inst42Quest1_HORDE_Prequest = Inst42Quest1_Prequest
Inst42Quest1_HORDE_Folgequest = Inst42Quest1_Folgequest
--
Inst42Quest1name1_HORDE = Inst42Quest1name1
Inst42Quest1name2_HORDE = Inst42Quest1name2
Inst42Quest1name3_HORDE = Inst42Quest1name3
Inst42Quest1name4_HORDE = Inst42Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst42Quest2_HORDE = Inst42Quest2
Inst42Quest2_HORDE_Level = Inst42Quest2_Level
Inst42Quest2_HORDE_Attain = Inst42Quest2_Attain
Inst42Quest2_HORDE_Aim = Inst42Quest2_Aim
Inst42Quest2_HORDE_Location = Inst42Quest2_Location
Inst42Quest2_HORDE_Note = Inst42Quest2_Note
Inst42Quest2_HORDE_Prequest = Inst42Quest2_Prequest
Inst42Quest2_HORDE_Folgequest = Inst42Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst42Quest3_HORDE = Inst42Quest3
Inst42Quest3_HORDE_Level = Inst42Quest3_Level
Inst42Quest3_HORDE_Attain = Inst42Quest3_Attain
Inst42Quest3_HORDE_Aim = Inst42Quest3_Aim
Inst42Quest3_HORDE_Location = Inst42Quest3_Location
Inst42Quest3_HORDE_Note = Inst42Quest3_Note
Inst42Quest3_HORDE_Prequest = Inst42Quest3_Prequest
Inst42Quest3_HORDE_Folgequest = Inst42Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst42Quest4_HORDE = Inst42Quest4
Inst42Quest4_HORDE_Level = Inst42Quest4_Level
Inst42Quest4_HORDE_Attain = Inst42Quest4_Attain
Inst42Quest4_HORDE_Aim = Inst42Quest4_Aim
Inst42Quest4_HORDE_Location = Inst42Quest4_Location
Inst42Quest4_HORDE_Note = Inst42Quest4_Note
Inst42Quest4_HORDE_Prequest = Inst42Quest4_Prequest
Inst42Quest4_HORDE_Folgequest = Inst42Quest4_Folgequest
Inst42Quest4PreQuest_HORDE = Inst42Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst42Quest5_HORDE = Inst42Quest5
Inst42Quest5_HORDE_Level = Inst42Quest5_Level
Inst42Quest5_HORDE_Attain = Inst42Quest5_Attain
Inst42Quest5_HORDE_Aim = Inst42Quest5_Aim
Inst42Quest5_HORDE_Location = Inst42Quest5_Location
Inst42Quest5_HORDE_Note = Inst42Quest5_Note
Inst42Quest5_HORDE_Prequest = Inst42Quest5_Prequest
Inst42Quest5_HORDE_Folgequest = Inst42Quest5_Folgequest
Inst42Quest5PreQuest_HORDE = Inst42Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst42Quest6_HORDE = Inst42Quest6
Inst42Quest6_HORDE_Level = Inst42Quest6_Level
Inst42Quest6_HORDE_Attain = Inst42Quest6_Attain
Inst42Quest6_HORDE_Aim = Inst42Quest6_Aim
Inst42Quest6_HORDE_Location = Inst42Quest6_Location
Inst42Quest6_HORDE_Note = Inst42Quest6_Note
Inst42Quest6_HORDE_Prequest = Inst42Quest6_Prequest
Inst42Quest6_HORDE_Folgequest = Inst42Quest6_Folgequest
--
Inst42Quest6name1_HORDE = Inst42Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst42Quest7_HORDE = Inst42Quest7
Inst42Quest7_HORDE_Level = Inst42Quest7_Level
Inst42Quest7_HORDE_Attain = Inst42Quest7_Attain
Inst42Quest7_HORDE_Aim = Inst42Quest7_Aim
Inst42Quest7_HORDE_Location = Inst42Quest7_Location
Inst42Quest7_HORDE_Note = Inst42Quest7_Note
Inst42Quest7_HORDE_Prequest = Inst42Quest7_Prequest
Inst42Quest7_HORDE_Folgequest = Inst42Quest7_Folgequest
--
Inst42Quest7name1_HORDE = Inst42Quest7name1



--------------- INST43 - CR: The Underbog (UB) ---------------

Inst43Story = "Хрупкий баланс экологии Зангартопи был нарушен.\n\nНеестественный феномен исковеркал и разрушил природную флору и фауну болота.\n\nЭти беспорядки проследили до вызывающего нехорошие предчуствия Резервуара Кривого Клыка.\n\nХодят слухи, что предводителем этих таинственных сил является никто иной, как печально известная Леди Вайш.\n\nТолько вы можете раскрыть ее нечестивые планы и предотвратить их, пока не стало слишком поздно.\n\nРезервуар Кривого Клыка разделен на четыре зоны, три из которых - подземелья рассчитанные на 5 игроков (Узилище, Нижетопь, и Паровое подземелье), а еще одна - рейдовое подземелье на 25 человек - Змеиное святилище. "
Inst43Caption = "РКК: Нижетопь"
Inst43QAA = "5 Заданий"
Inst43QAH = "5 Заданий"

--Quest 1 Alliance
Inst43Quest1 = "1. Погибли при исполнении"
Inst43Quest1_Level = "65"
Inst43Quest1_Attain = "62"
Inst43Quest1_Aim = "Выясните, что стало с землепрядом Гневвсом, натуралистом Кусом, культиватором Зеленопалом и призывателем ветров Когтем. Затем возвращайтесь к дозорному Джанг в Резервуар Кривого Клыка в Зангартопь."
Inst43Quest1_Location = "Дозорный Джанг (Резервуар Кривого Клыка; "..YELLOW.."52,36"..WHITE..")"
Inst43Quest1_Note = "Дозорный Джанг находится в подводной пещере недалеко от Камня Встреч. Землепряд Гневвс находится около "..YELLOW.."[2]"..WHITE..". Призыватель ветров Коготь - это питомец-медведь Владыки болота Мусел'ека "..YELLOW.."[4]"..WHITE..". После убийства босса, он станет дружелюбным и вы сможете с ним поговорить. Предшествующее задание необязательно чтобы взять это."
Inst43Quest1_Prequest = "Схема стоков -> Провалившийся рейд"
Inst43Quest1_Folgequest = "Нет"
Inst43Quest1PreQuest = "true"
--
Inst43Quest1name1 = "Cenarion Ring of Casting"
Inst43Quest1name2 = "Goldenvine Wraps"
Inst43Quest1name3 = "Dark Cloak of the Marsh"

--Quest 2 Alliance
Inst43Quest2 = "2. Удачный ход"
Inst43Quest2_Level = "65"
Inst43Quest2_Attain = "63"
Inst43Quest2_Aim = "Добудьте ветку подспорника и вернитесь с ней к Тшу в Спореггар в Зангартопи."
Inst43Quest2_Location = "Тшу (Зангартопь - Спореггар; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest2_Note = "Вы дожны быть нейтральны со Спореггаром, чтобы взять это задание. Ветка подспорника находится прямо за Голоднецом, около "..YELLOW.."[1]"..WHITE.."."
Inst43Quest2_Prequest = "Нет"
Inst43Quest2_Folgequest = "Нет"
--
Inst43Quest2name1 = "Everlasting Underspore Frond"

--Quest 3 Alliance
Inst43Quest3 = "3. Охота на охотницу"
Inst43Quest3_Level = "65"
Inst43Quest3_Attain = "63"
Inst43Quest3_Aim = "Принесите мозг Черной Охотницы Кнн'иксу в Спореггар в Зангартопи."
Inst43Quest3_Location = "Кнн'икс (Зангартопь - Спореггар; "..YELLOW.."19,49"..WHITE..")"
Inst43Quest3_Note = "Вы дожны быть нейтральны со Спореггаром, чтобы взять это задание. Черная Охотница расположена около "..YELLOW.."[5]"..WHITE.."."
Inst43Quest3_Prequest = "Нет"
Inst43Quest3_Folgequest = "Нет"
--
Inst43Quest3name1 = "Essence Infused Mushroom"
Inst43Quest3name2 = "Power Infused Mushroom"

--Quest 4 Alliance
Inst43Quest4 = "4. Требуется: яйцо Черной Охотницы (Героическое (ежедн.))"
Inst43Quest4_Level = "70"
Inst43Quest4_Attain = "70"
Inst43Quest4_Aim = "Добудьте яйцо Черной Охотницы и доставьте его торговцу ветром Зариму в Нижний Город Шаттрата за вознаграждение."
Inst43Quest4_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst43Quest4_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nЧерная Охотница находится около "..YELLOW.."[5]"..WHITE.."."
Inst43Quest4_Prequest = "Нет"
Inst43Quest4_Folgequest = "Нет"
--
Inst43Quest4name1 = "Знак справедливости"

--Quest 5 Alliance
Inst43Quest5 = "5. Принеси мне кустики!"
Inst43Quest5_Level = "65"
Inst43Quest5_Attain = "63"
Inst43Quest5_Aim = "Добудьте 5 растений кровавого гибискуса и отнесите их Гзхун'тту в Спореггар в Зангартопи."
Inst43Quest5_Location = "Гзхун'тт (Зангартопь - Спореггар; "..YELLOW.."19,50"..WHITE..")"
Inst43Quest5_Note = "Вы дожны быть нейтральны со Спореггаром, чтобы взять это задание. Последующее задание повторяемо и приносит 750 репутации со Спореггаром за раз. Кровавый гибискус расбросан по всей Нижетопи рядом с растениями, а также падает с болотников, включая тех, что в Паровом подземелье. Ими также можно торговать."
Inst43Quest5_Prequest = "Нет"
Inst43Quest5_Folgequest = "Еще кустиков!"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst43Quest1_HORDE = Inst43Quest1
Inst43Quest1_HORDE_Level = Inst43Quest1_Level
Inst43Quest1_HORDE_Attain = Inst43Quest1_Attain
Inst43Quest1_HORDE_Aim = Inst43Quest1_Aim
Inst43Quest1_HORDE_Location = Inst43Quest1_Location
Inst43Quest1_HORDE_Note = Inst43Quest1_Note
Inst43Quest1_HORDE_Prequest = Inst43Quest1_Prequest
Inst43Quest1_HORDE_Folgequest = Inst43Quest1_Folgequest
Inst43Quest1PreQuest_HORDE = Inst43Quest1PreQuest
--
Inst43Quest1name1_HORDE = Inst43Quest1name1
Inst43Quest1name2_HORDE = Inst43Quest1name2
Inst43Quest1name3_HORDE = Inst43Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst43Quest2_HORDE = Inst43Quest2
Inst43Quest2_HORDE_Level = Inst43Quest2_Level
Inst43Quest2_HORDE_Attain = Inst43Quest2_Attain
Inst43Quest2_HORDE_Aim = Inst43Quest2_Aim
Inst43Quest2_HORDE_Location = Inst43Quest2_Location
Inst43Quest2_HORDE_Note = Inst43Quest2_Note
Inst43Quest2_HORDE_Prequest = Inst43Quest2_Prequest
Inst43Quest2_HORDE_Folgequest = Inst43Quest2_Folgequest
--
Inst43Quest2name1_HORDE = Inst43Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst43Quest3_HORDE = Inst43Quest3
Inst43Quest3_HORDE_Level = Inst43Quest3_Level
Inst43Quest3_HORDE_Attain = Inst43Quest3_Attain
Inst43Quest3_HORDE_Aim = Inst43Quest3_Aim
Inst43Quest3_HORDE_Location = Inst43Quest3_Location
Inst43Quest3_HORDE_Note = Inst43Quest3_Note
Inst43Quest3_HORDE_Prequest = Inst43Quest3_Prequest
Inst43Quest3_HORDE_Folgequest = Inst43Quest3_Folgequest
--
Inst43Quest3name1_HORDE = Inst43Quest3name1
Inst43Quest3name2_HORDE = Inst43Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst43Quest4_HORDE = Inst43Quest4
Inst43Quest4_HORDE_Level = Inst43Quest4_Level
Inst43Quest4_HORDE_Attain = Inst43Quest4_Attain
Inst43Quest4_HORDE_Aim = Inst43Quest4_Aim
Inst43Quest4_HORDE_Location = Inst43Quest4_Location
Inst43Quest4_HORDE_Note = Inst43Quest4_Note
Inst43Quest4_HORDE_Prequest = Inst43Quest4_Prequest
Inst43Quest4_HORDE_Folgequest = Inst43Quest4_Folgequest
--
Inst43Quest4name1_HORDE = Inst43Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst43Quest5_HORDE = Inst43Quest5
Inst43Quest5_HORDE_Level = Inst43Quest5_Level
Inst43Quest5_HORDE_Attain = Inst43Quest5_Attain
Inst43Quest5_HORDE_Aim = Inst43Quest5_Aim
Inst43Quest5_HORDE_Location = Inst43Quest5_Location
Inst43Quest5_HORDE_Note = Inst43Quest5_Note
Inst43Quest5_HORDE_Prequest = Inst43Quest5_Prequest
Inst43Quest5_HORDE_Folgequest = Inst43Quest5_Folgequest
-- No Rewards for this quest



--------------- INST44 - Auchindoun: Auchenai Crypts (AC) ---------------

Inst44Story = "На протяжении тысяч лет, дренеи предавали своих мертвых земле в Аукиндоне, самом святом храме.\n\nОднако, в него проникли агенты Темного Совета,решительно настроенные на то, чтобы призвать ужасающих созданий безграничного зла.\n\nИх отвратительная волшба привела к огромному взрыву, который разнес храм на куски и превратил окружающие территории в опаленные пустоши.\n\nВзрыв также послужил причиной появления разлома в самой Пустоте, затянувшего потусторонних Эфириалов в Запределье.\n\nПогребенные дренеи теперь разгуливают по руинам неупокоенными душами.\n\nТем временем, приводящие в ужас сущности, призванные Темным Советом угрожают разбить все попытки удержать их.\n\nВы должны не дать этому злу выплеснуться в ничего не подозревающий мир.\n\nАукиндон разделен на 4 крыла, и предназначен для групп из 5 игроков уровней 64-70."
Inst44Caption = "Аук: Аукенайские гробницы"
Inst44QAA = "2 Задания"
Inst44QAH = "4 Задания"

--Quest 1 Alliance
Inst44Quest1 = "1. Все будет в порядке"
Inst44Quest1_Level = "67"
Inst44Quest1_Attain = "64"
Inst44Quest1_Aim = "Проникните в Аукенайские гробницы и уничтожьте экзарха Маладаара по просьбе Великого Отца Алдримуса, который находится снаружи Аукенайских гробниц Аукиндона."
Inst44Quest1_Location = "Великий Отец Алдримус (Лес Тероккар; "..YELLOW.."35,65"..WHITE..")"
Inst44Quest1_Note = "Экзарх Маладаар находится около "..YELLOW.."[2]"..WHITE..". Линейка предшествующих заданий Начинается у Ха'лей (Лес Тероккар - Аукиндон; "..YELLOW.."35,65"..WHITE..")."
Inst44Quest1_Prequest = "Я вижу мертвых дренеев -> Левиксус Призыватель Душ"
Inst44Quest1_Folgequest = "Нет"
Inst44Quest1PreQuest = "true"
--
Inst44Quest1name1 = "Auchenai Anchorite's Robe"
Inst44Quest1name2 = "Auchenai Monk's Tunic"
Inst44Quest1name3 = "Auchenai Tracker's Hauberk"
Inst44Quest1name4 = "The Exarch's Protector"

--Quest 2 Alliance
Inst44Quest2 = "2. Разыскивается: Самоцвет души Экзарха (Героическое (ежедн.))"
Inst44Quest2_Level = "70"
Inst44Quest2_Attain = "70"
Inst44Quest2_Aim = "Добудьте Самоцвет Души Экзарха и вернитесь к торговцу Ветром Зариму, в Нижний Город Шаттрата."
Inst44Quest2_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst44Quest2_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nЭкзарх Маладаар находится около "..YELLOW.."[2]"..WHITE.."."
Inst44Quest2_Prequest = "Нет"
Inst44Quest2_Folgequest = "Нет"
--
Inst44Quest2name1 = "Знак справедливости"


--Quest 1 Horde
Inst44Quest1_HORDE = "1. Аукиндон..."
Inst44Quest1_HORDE_Level = "68"
Inst44Quest1_HORDE_Attain = "66"
Inst44Quest1_HORDE_Aim = "Отправляйтесь в Аукенайские гробницы в Костяных пустошах леса Тероккар, убейте экзарха Маладаара и освободите дух Д'оре."
Inst44Quest1_HORDE_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst44Quest1_HORDE_Note = "Экзарх Маладаар находится около "..YELLOW.."[2]"..WHITE..". Д'оре появится после того как вы убьете экзарха Маладаара."
Inst44Quest1_HORDE_Prequest = "Разговор с Великой матерью -> Раскрытая тайна"
Inst44Quest1_HORDE_Folgequest = "Что видит душа"
Inst44Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst44Quest2_HORDE = "2. Что видит душа"
Inst44Quest2_HORDE_Level = "68"
Inst44Quest2_HORDE_Attain = "66"
Inst44Quest2_HORDE_Aim = "Найдите зеркало Души в Аукенайских гробницах и используйте его, чтобы выманить темного духа из древнего орка-предка в Награнде. Уничтожьте 15 темных духов, чтобы орочьи предки могли упокоиться с миром."
Inst44Quest2_HORDE_Location = "Д'оре (Аукенайские гробницы; "..YELLOW.."[2]"..WHITE..")."
Inst44Quest2_HORDE_Note = "Д'оре появится после того как вы убьете экзарха Маладаара. Мать Кашур находится около (Награнд; "..YELLOW.."26,61"..WHITE.."). Соберите группу из 3 или более игроков, для схватки с Духами орков-предков."
Inst44Quest2_HORDE_Prequest = "Аукиндон..."
Inst44Quest2_HORDE_Folgequest = "Возвращение к Великой Матери"
Inst44Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst44Quest3_HORDE = "3. Все будет в порядке"
Inst44Quest3_HORDE_Level = Inst44Quest1_Level
Inst44Quest3_HORDE_Attain = Inst44Quest1_Attain
Inst44Quest3_HORDE_Aim = Inst44Quest1_Aim
Inst44Quest3_HORDE_Location = Inst44Quest1_Location
Inst44Quest3_HORDE_Note = Inst44Quest1_Note
Inst44Quest3_HORDE_Prequest = Inst44Quest1_Prequest
Inst44Quest3_HORDE_Folgequest = Inst44Quest1_Folgequest
Inst44Quest3PreQuest_HORDE = Inst44Quest1PreQuest
--
Inst44Quest3name1_HORDE = Inst44Quest1name1
Inst44Quest3name2_HORDE = Inst44Quest1name2
Inst44Quest3name3_HORDE = Inst44Quest1name3
Inst44Quest3name4_HORDE = Inst44Quest1name4

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst44Quest4_HORDE = "4. Разыскивается: Самоцвет души Экзарха (Героическое (ежедн.))"
Inst44Quest4_HORDE_Level = Inst44Quest2_Level
Inst44Quest4_HORDE_Attain = Inst44Quest2_Attain
Inst44Quest4_HORDE_Aim = Inst44Quest2_Aim
Inst44Quest4_HORDE_Location = Inst44Quest2_Location
Inst44Quest4_HORDE_Note = Inst44Quest2_Note
Inst44Quest4_HORDE_Prequest = Inst44Quest2_Prequest
Inst44Quest4_HORDE_Folgequest = Inst44Quest2_Folgequest
--
Inst44Quest4name1_HORDE = Inst44Quest2name1



--------------- INST45 - Auchindoun: Mana Tombs (MT) ---------------

Inst45Story = "На протяжении тысяч лет, дренеи предавали своих мертвых земле в Аукиндоне, самом святом храме.\n\nОднако, в него проникли агенты Темного Совета,решительно настроенные на то, чтобы призвать ужасающих созданий безграничного зла.\n\nИх отвратительная волшба привела к огромному взрыву, который разнес храм на куски и превратил окружающие территории в опаленные пустоши.\n\nВзрыв также послужил причиной появления разлома в самой Пустоте, затянувшего потусторонних Эфириалов в Запределье.\n\nПогребенные дренеи теперь разгуливают по руинам неупокоенными душами.\n\nТем временем, приводящие в ужас сущности, призванные Темным Советом угрожают разбить все попытки удержать их.\n\nВы должны не дать этому злу выплеснуться в ничего не подозревающий мир.\n\nАукиндон разделен на 4 крыла, и предназначен для групп из 5 игроков уровней 64-70."
Inst45Caption = "Аук: Гробницы маны"
Inst45QAA = "5 Заданий"
Inst45QAH = "5 Заданий"

--Quest 1 Alliance
Inst45Quest1 = "1. Прежде всего – безопасность!"
Inst45Quest1_Level = "66"
Inst45Quest1_Attain = "64"
Inst45Quest1_Aim = "Убейте 10 эфириалов-осквернителей гробниц, 5 эфириалов-колдунов, 5 ловчих нексуса и 5 эфириалов-чароплетов по просьбе работника Морфалиуса."
Inst45Quest1_Location = "Работник Морфалиус (Лес Тероккар - Аукиндон; "..YELLOW.."39,58"..WHITE..")"
Inst45Quest1_Note = "Пульт управления астрального телепорта находится около "..YELLOW.."[4]"..WHITE.."."
Inst45Quest1_Prequest = "Нет"
Inst45Quest1_Folgequest = "Чужими руками жар загребать..."
-- No Rewards for this quest

--Quest 2 Alliance
Inst45Quest2 = "2. Чужими руками жар загребать..."
Inst45Quest2_Level = "66"
Inst45Quest2_Attain = "64"
Inst45Quest2_Aim = "Проводите крио-инженера Ша'хина в Гробницы Маны, чтобы он мог собрать астральную субстанцию в коллекторах Шаффара."
Inst45Quest2_Location = "Крио-инженер Ша'хин (Гробницы маны; "..YELLOW.."[4]"..WHITE..")"
Inst45Quest2_Note = "Для вызова Крио-инженер Ша'хин, нажмите на Пульт управления астрального телепорта около "..YELLOW.."[4]"..WHITE..". Он скоро появится в компании с несколькими дружественными НИП Консорциума.  Предварительно нужно зачистиить все подземелье. Не оставляйте ничего живого. Попытаться выполнить задание можно только один раз за проход подземелья."
Inst45Quest2_Prequest = "Прежде всего – безопасность!"
Inst45Quest2_Folgequest = "Нет"
Inst45Quest2FQuest = "true"
--
Inst45Quest2name1 = "Consortium Prince's Wrap"
Inst45Quest2name2 = "Cryo-mitts"
Inst45Quest2name3 = "Consortium Mantle of Phasing"
Inst45Quest2name4 = "Flesh Beast's Metal Greaves"

--Quest 3 Alliance
Inst45Quest3 = "3. Жестокая вещь – конкуренция"
Inst45Quest3_Level = "66"
Inst45Quest3_Attain = "64"
Inst45Quest3_Aim = "Убейте Принца Шаффара по просьбе принца Харамада, находящегося снаружи Гробниц Маны, и принесите ему обмотки Шаффара."
Inst45Quest3_Location = "Принц Харамад (Лес Тероккар - Аукиндон; "..YELLOW.."39,58"..WHITE..")."
Inst45Quest3_Note = "Принц Шаффар находится около "..YELLOW.."[5]"..WHITE.."."
Inst45Quest3_Prequest = "Нет"
Inst45Quest3_Folgequest = "Нет"
--
Inst45Quest3name1 = "Haramad's Leggings of the Third Coin"
Inst45Quest3name2 = "Consortium Plated Legguards"
Inst45Quest3name3 = "Haramad's Leg Wraps"
Inst45Quest3name4 = "Haramad's Linked Chain Pantaloons"

--Quest 4 Alliance
Inst45Quest4 = "4. Палаты стазиса в Гробнице маны (Героическое)"
Inst45Quest4_Level = "70"
Inst45Quest4_Attain = "70"
Inst45Quest4_Aim = "Проекция командира Амира, находящеяся в Лагере Баш'ира в Острогорье просит вас использовать ключ от Палат Стазиса Гробниц Маны, чтобы открыть палату стазиса внутри Гробниц Маны Аукиндона."
Inst45Quest4_Location = "Проекция командира Амира (Острогорье - Лагерь Баш'ира; "..YELLOW.."52,15"..WHITE..")."
Inst45Quest4_Note = "Это задание выполняется в режиме героической сложности. Есть две палаткы стазиса. Первая прямо за Пандемонием "..YELLOW.."[1]"..WHITE..". Вторая находится в комнате Принца Шаффара "..YELLOW.."[5]"..WHITE..". Вам нужен Знак Соправителей для каждой."
Inst45Quest4_Prequest = "Знак короля нексуса"
Inst45Quest4_Folgequest = "Нет"
Inst45Quest4PreQuest = "true"
--
Inst45Quest4name1 = "Знак справедливости"

--Quest 5 Alliance
Inst45Quest5 = "5. Разыскивается: Заговоренный Амулет Шаффара (Героическое (ежедн.))"
Inst45Quest5_Level = "70"
Inst45Quest5_Attain = "70"
Inst45Quest5_Aim = "Добудьте заговоренный амулет Шаффара и вернитесь к торговцу Ветром Зариму, в Нижний Город Шаттрата."
Inst45Quest5_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst45Quest5_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nПринц Шаффар находится около "..YELLOW.."[5]"..WHITE.."."
Inst45Quest5_Prequest = "Нет"
Inst45Quest5_Folgequest = "Нет"
--
Inst45Quest5name1 = "Знак справедливости"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst45Quest1_HORDE = Inst45Quest1
Inst45Quest1_HORDE_Level = Inst45Quest1_Level
Inst45Quest1_HORDE_Attain = Inst45Quest1_Attain
Inst45Quest1_HORDE_Aim = Inst45Quest1_Aim
Inst45Quest1_HORDE_Location = Inst45Quest1_Location
Inst45Quest1_HORDE_Note = Inst45Quest1_Note
Inst45Quest1_HORDE_Prequest = Inst45Quest1_Prequest
Inst45Quest1_HORDE_Folgequest = Inst45Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst45Quest2_HORDE = Inst45Quest2
Inst45Quest2_HORDE_Level = Inst45Quest2_Level
Inst45Quest2_HORDE_Attain = Inst45Quest2_Attain
Inst45Quest2_HORDE_Aim = Inst45Quest2_Aim
Inst45Quest2_HORDE_Location = Inst45Quest2_Location
Inst45Quest2_HORDE_Note = Inst45Quest2_Note
Inst45Quest2_HORDE_Prequest = Inst45Quest2_Prequest
Inst45Quest2_HORDE_Folgequest = Inst45Quest2_Folgequest
Inst45Quest2FQuest_HORDE = Inst45Quest2FQuest
--
Inst45Quest2name1_HORDE = Inst45Quest2name1
Inst45Quest2name2_HORDE = Inst45Quest2name2
Inst45Quest2name3_HORDE = Inst45Quest2name3
Inst45Quest2name4_HORDE = Inst45Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst45Quest3_HORDE = Inst45Quest3
Inst45Quest3_HORDE_Level = Inst45Quest3_Level
Inst45Quest3_HORDE_Attain = Inst45Quest3_Attain
Inst45Quest3_HORDE_Aim = Inst45Quest3_Aim
Inst45Quest3_HORDE_Location = Inst45Quest3_Location
Inst45Quest3_HORDE_Note = Inst45Quest3_Note
Inst45Quest3_HORDE_Prequest = Inst45Quest3_Prequest
Inst45Quest3_HORDE_Folgequest = Inst45Quest3_Folgequest
--
Inst45Quest3name1_HORDE = Inst45Quest3name1
Inst45Quest3name2_HORDE = Inst45Quest3name2
Inst45Quest3name3_HORDE = Inst45Quest3name3
Inst45Quest3name4_HORDE = Inst45Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst45Quest4_HORDE = Inst45Quest4
Inst45Quest4_HORDE_Level = Inst45Quest4_Level
Inst45Quest4_HORDE_Attain = Inst45Quest4_Attain
Inst45Quest4_HORDE_Aim = Inst45Quest4_Aim
Inst45Quest4_HORDE_Location = Inst45Quest4_Location
Inst45Quest4_HORDE_Note = Inst45Quest4_Note
Inst45Quest4_HORDE_Prequest = Inst45Quest4_Prequest
Inst45Quest4_HORDE_Folgequest = Inst45Quest4_Folgequest
Inst45Quest4PreQuest_HORDE = Inst45Quest4PreQuest
--
Inst45Quest4name1_HORDE = Inst45Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst45Quest5_HORDE = Inst45Quest5
Inst45Quest5_HORDE_Level = Inst45Quest5_Level
Inst45Quest5_HORDE_Attain = Inst45Quest5_Attain
Inst45Quest5_HORDE_Aim = Inst45Quest5_Aim
Inst45Quest5_HORDE_Location = Inst45Quest5_Location
Inst45Quest5_HORDE_Note = Inst45Quest5_Note
Inst45Quest5_HORDE_Prequest = Inst45Quest5_Prequest
Inst45Quest5_HORDE_Folgequest = Inst45Quest5_Folgequest
--
Inst45Quest5name1_HORDE = Inst45Quest5name1



--------------- INST46 - Auchindoun: Sethekk Halls (Seth) ---------------

Inst46Story = "На протяжении тысяч лет, дренеи предавали своих мертвых земле в Аукиндоне, самом святом храме.\n\nОднако, в него проникли агенты Темного Совета,решительно настроенные на то, чтобы призвать ужасающих созданий безграничного зла.\n\nИх отвратительная волшба привела к огромному взрыву, который разнес храм на куски и превратил окружающие территории в опаленные пустоши.\n\nВзрыв также послужил причиной появления разлома в самой Пустоте, затянувшего потусторонних Эфириалов в Запределье.\n\nПогребенные дренеи теперь разгуливают по руинам неупокоенными душами.\n\nТем временем, приводящие в ужас сущности, призванные Темным Советом угрожают разбить все попытки удержать их.\n\nВы должны не дать этому злу выплеснуться в ничего не подозревающий мир.\n\nАукиндон разделен на 4 крыла, и предназначен для групп из 5 игроков уровней 64-70."
Inst46Caption = "Аук: Сетеккские залы"
Inst46QAA = "5 Заданий"
Inst46QAH = "5 Заданий"

--Quest 1 Alliance
Inst46Quest1 = "1. Брат против брата"
Inst46Quest1_Level = "69"
Inst46Quest1_Attain = "65"
Inst46Quest1_Aim = "Проникните в Сетеккские залы и убейте Темнопряда Сита. Освободите из плена Лакку. После этого вернитесь к Исфару, который находится неподалеку от входа в Залы Сетека."
Inst46Quest1_Location = "Исфар (Лес Тероккар - Аукиндон; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest1_Note = "Темнопряд Сит находится около "..YELLOW.."[1]"..WHITE..". Лакка находится в клетке в той же комнате. При открытии клетки враги не появятся."
Inst46Quest1_Prequest = "Нет"
Inst46Quest1_Folgequest = "Нет"
--
Inst46Quest1name1 = "Torc of the Sethekk Prophet"
Inst46Quest1name2 = "Sethekk Oracle's Focus"
Inst46Quest1name3 = "Talon Lord's Collar"
Inst46Quest1name4 = "Mark of the Ravenguard"

--Quest 2 Alliance
Inst46Quest2 = "2. Наследство Терокка"
Inst46Quest2_Level = "69"
Inst46Quest2_Attain = "65"
Inst46Quest2_Aim = "Принесите Маску Терокка, Перо Терокка и Сагу о Терокке Исфару, который находится неподалеку от Сетеккских залов."
Inst46Quest2_Location = "Исфар (Лес Тероккар - Аукиндон; "..YELLOW.."44,65"..WHITE..")"
Inst46Quest2_Note = "Маска Терокка падает с темноряда Сита около "..YELLOW.."[1]"..WHITE..", Сагу о Терокке можно найти около "..YELLOW.."[2]"..WHITE.." а Перо Терокка падает с Короля воронов Айкисса около "..YELLOW.."[3]"..WHITE.."."
Inst46Quest2_Prequest = "Нет"
Inst46Quest2_Folgequest = "Нет"
--
Inst46Quest2name1 = "The Saga of Terokk"
Inst46Quest2name2 = "Terokk's Mask"
Inst46Quest2name3 = "Terokk's Quill"

--Quest 3 Alliance
Inst46Quest3 = "3. Изгнание бога-ворона (Друид - Героическое)"
Inst46Quest3_Level = "70"
Inst46Quest3_Attain = "70"
Inst46Quest3_Aim = "Убейте бога-ворона и возвращайтесь к Мортису Шелесту Крыла в Ценарионский оплот."
Inst46Quest3_Location = "Мортис Шелест Крыла (Зангартопь - Ценарионский оплот; "..YELLOW.."80,65"..WHITE..")"
Inst46Quest3_Note = "Это задание выполняется в режиме героической сложности. Это последнее задание в линейке на Быстрый воздушный облик друида. Бог-ворон Анзу призывается около "..YELLOW.."[2]"..WHITE.." с помощью материалов, требуемых давшему задание."
Inst46Quest3_Prequest = "Сущность орла -> В поисках лунного камня"
Inst46Quest3_Folgequest = "Нет"
Inst46Quest3PreQuest = "true"
--
Inst46Quest3name1 = "Idol of the Raven Goddess"

--Quest 4 Alliance
Inst46Quest4 = "4. Требование Калинны (Героическое)"
Inst46Quest4_Level = "70"
Inst46Quest4_Attain = "70"
Inst46Quest4_Aim = "Калинна Латред требует отыскать и принести ей Фолиант Сумерек и Книгу Забытых Имен. Первой владеет главный чернокнижник Пустоклят, его можно найти в Разрушенных залах Цитадели Адского Пламени. Вторая принадлежит Темнопряду Ситу, который находится в Сетеккских залах в Аукиндоне."
Inst46Quest4_Location = "Калинна Латред (Пустоверть - Зона 52; "..YELLOW.."32,63"..WHITE..")"
Inst46Quest4_Note = "Это задание выполняется в режиме героической сложности.\n\nТемнопряд Сит находится около "..YELLOW.."[1]"..WHITE..". Фолиант Сумерек падает в Разрушенных залах."
Inst46Quest4_Prequest = "Взаимовыручка ("..YELLOW.."Каражан"..WHITE..")"
Inst46Quest4_Folgequest = "Ночная Погибель ("..YELLOW.."Каражан"..WHITE..")"
Inst46Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst46Quest5 = "5. Разыскиваются: головные перья Айкисса (Героическое (ежедн.))"
Inst46Quest5_Level = "70"
Inst46Quest5_Attain = "70"
Inst46Quest5_Aim = "Добудьте перья с головы Айкисса и вернитесь к торговцу Ветром Зариму, в Нижний Город Шаттрата."
Inst46Quest5_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst46Quest5_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nКороль воронов Айкисс находится около "..YELLOW.."[3]"..WHITE.."."
Inst46Quest5_Prequest = "Нет"
Inst46Quest5_Folgequest = "Нет"
--
Inst46Quest5name1 = "Знак справедливости"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst46Quest1_HORDE = Inst46Quest1
Inst46Quest1_HORDE_Level = Inst46Quest1_Level
Inst46Quest1_HORDE_Attain = Inst46Quest1_Attain
Inst46Quest1_HORDE_Aim = Inst46Quest1_Aim
Inst46Quest1_HORDE_Location = Inst46Quest1_Location
Inst46Quest1_HORDE_Note = Inst46Quest1_Note
Inst46Quest1_HORDE_Prequest = Inst46Quest1_Prequest
Inst46Quest1_HORDE_Folgequest = Inst46Quest1_Folgequest
--
Inst46Quest1name1_HORDE = Inst46Quest1name1
Inst46Quest1name2_HORDE = Inst46Quest1name2
Inst46Quest1name3_HORDE = Inst46Quest1name3
Inst46Quest1name4_HORDE = Inst46Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst46Quest2_HORDE = Inst46Quest2
Inst46Quest2_HORDE_Level = Inst46Quest2_Level
Inst46Quest2_HORDE_Attain = Inst46Quest2_Attain
Inst46Quest2_HORDE_Aim = Inst46Quest2_Aim
Inst46Quest2_HORDE_Location = Inst46Quest2_Location
Inst46Quest2_HORDE_Note = Inst46Quest2_Note
Inst46Quest2_HORDE_Prequest = Inst46Quest2_Prequest
Inst46Quest2_HORDE_Folgequest = Inst46Quest2_Folgequest
--
Inst46Quest2name1_HORDE = Inst46Quest2name1
Inst46Quest2name2_HORDE = Inst46Quest2name2
Inst46Quest2name3_HORDE = Inst46Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst46Quest3_HORDE = Inst46Quest3
Inst46Quest3_HORDE_Level = Inst46Quest3_Level
Inst46Quest3_HORDE_Attain = Inst46Quest3_Attain
Inst46Quest3_HORDE_Aim = Inst46Quest3_Aim
Inst46Quest3_HORDE_Location = Inst46Quest3_Location
Inst46Quest3_HORDE_Note = Inst46Quest3_Note
Inst46Quest3_HORDE_Prequest = Inst46Quest3_Prequest
Inst46Quest3_HORDE_Folgequest = Inst46Quest3_Folgequest
Inst46Quest3PreQuest_HORDE = Inst46Quest3PreQuest
--
Inst46Quest3name1_HORDE = Inst46Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst46Quest4_HORDE = Inst46Quest4
Inst46Quest4_HORDE_Level = Inst46Quest4_Level
Inst46Quest4_HORDE_Attain = Inst46Quest4_Attain
Inst46Quest4_HORDE_Aim = Inst46Quest4_Aim
Inst46Quest4_HORDE_Location = Inst46Quest4_Location
Inst46Quest4_HORDE_Note = Inst46Quest4_Note
Inst46Quest4_HORDE_Prequest = Inst46Quest4_Prequest
Inst46Quest4_HORDE_Folgequest = Inst46Quest4_Folgequest
Inst46Quest4PreQuest_HORDE = Inst46Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst46Quest5_HORDE = Inst46Quest5
Inst46Quest5_HORDE_Level = Inst46Quest5_Level
Inst46Quest5_HORDE_Attain = Inst46Quest5_Attain
Inst46Quest5_HORDE_Aim = Inst46Quest5_Aim
Inst46Quest5_HORDE_Location = Inst46Quest5_Location
Inst46Quest5_HORDE_Note = Inst46Quest5_Note
Inst46Quest5_HORDE_Prequest = Inst46Quest5_Prequest
Inst46Quest5_HORDE_Folgequest = Inst46Quest5_Folgequest
--
Inst46Quest5name1_HORDE = Inst46Quest5name1



--------------- INST47 - Auchindoun: Shadow Labyrinth (SLabs) ---------------

Inst47Story = "На протяжении тысяч лет, дренеи предавали своих мертвых земле в Аукиндоне, самом святом храме.\n\nОднако, в него проникли агенты Темного Совета,решительно настроенные на то, чтобы призвать ужасающих созданий безграничного зла.\n\nИх отвратительная волшба привела к огромному взрыву, который разнес храм на куски и превратил окружающие территории в опаленные пустоши.\n\nВзрыв также послужил причиной появления разлома в самой Пустоте, затянувшего потусторонних Эфириалов в Запределье.\n\nПогребенные дренеи теперь разгуливают по руинам неупокоенными душами.\n\nТем временем, приводящие в ужас сущности, призванные Темным Советом угрожают разбить все попытки удержать их.\n\nВы должны не дать этому злу выплеснуться в ничего не подозревающий мир.\n\nАукиндон разделен на 4 крыла, и предназначен для групп из 5 игроков уровней 64-70."
Inst47Caption = "Аук: Темный лабиринт"
Inst47QAA = "11 Заданий"
Inst47QAH = "11 Заданий"

--Quest 1 Alliance
Inst47Quest1 = "1. Найти шпиона То'гуна!"
Inst47Quest1_Level = "70"
Inst47Quest1_Attain = "68"
Inst47Quest1_Aim = "Найдите шпиона То'гуна в Темном Лабиринте в Аукиндоне."
Inst47Quest1_Location = "Шпион Грик'та (Лес Тероккар - Аукиндон; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest1_Note = "То'гун находится около "..YELLOW.."[1]"..WHITE..", а также отображается на миникарте"
Inst47Quest1_Prequest = "Нет"
Inst47Quest1_Folgequest = "Инструменты души"
-- No Rewards for this quest

--Quest 2 Alliance
Inst47Quest2 = "2. Инструменты души"
Inst47Quest2_Level = "70"
Inst47Quest2_Attain = "68"
Inst47Quest2_Aim = "Украдите 5 инструментов души и доставьте их повелительнице шпионов Мелисе Высокий Венец в Шаттрат на Террасу Света."
Inst47Quest2_Location = "Шпион То'гун (Shadow Labyrinth; "..YELLOW.."[1]"..WHITE..")"
Inst47Quest2_Note = "Инструменты души это темно-фиолетовые шары, которые можно найти по всему подземелью. Повелительница шпионов Мелиса Высокий Венец находится около (Шаттрат - Терраса Света; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest2_Prequest = "Найти шпиона То'гуна!"
Inst47Quest2_Folgequest = "Нет"
Inst47Quest2FQuest = "true"
--
Inst47Quest2name1 = "Шаттрат Wraps"
Inst47Quest2name2 = "Spymistress's Wristguards"
Inst47Quest2name3 = "Auchenai Bracers"
Inst47Quest2name4 = "Sha'tari Wrought Armguards"

--Quest 3 Alliance
Inst47Quest3 = "3. Книга Имен Скверны"
Inst47Quest3_Level = "70"
Inst47Quest3_Attain = "68"
Inst47Quest3_Aim = "Проберитесь в Темный Лабиринт в Аукиндоне и добудьте у Черносерда Проповедника Книгу Имен Скверны. После этого вернитесь в Награнд к Алтруису."
Inst47Quest3_Location = "Алтруис Страдалец (Награнд; "..YELLOW.."27,43"..WHITE..")"
Inst47Quest3_Note = "Черносерд Проповедник находится около "..YELLOW.."[3]"..WHITE..". Это последняя часть цепочки заданий, которая начинается в Долине Призрачной луны около "..YELLOW.."61,28"..WHITE.." для Алдоров и "..YELLOW.."55,58"..WHITE.." для Провидцев"
Inst47Quest3_Prequest = "Ученик Иллидана"
Inst47Quest3_Folgequest = "Возвращение к Алдорам или Возвращение к Провидцам"
-- No Rewards for this quest

--Quest 4 Alliance
Inst47Quest4 = "4. В Аукиндоне неспокойно"
Inst47Quest4_Level = "70"
Inst47Quest4_Attain = "68"
Inst47Quest4_Aim = "Доложите о своем прибытии боевому командиру Мафууну, который находится неподалеку от входа в Темный Лабиринт в Аукиндоне в Лесу Тероккар."
Inst47Quest4_Location = "Повелительница шпионов Мелиса Высокий Венец (Шаттрат - Терраса Света; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest4_Note = "Боевой командир Мафуун находится около (Лес Тероккар - Аукиндон; "..YELLOW.."40,72"..WHITE.."), Прямо около входа в Темный лабиринт."
Inst47Quest4_Prequest = "Нет"
Inst47Quest4_Folgequest = "Кодекс Крови"
-- No Rewards for this quest

--Quest 5 Alliance
Inst47Quest5 = "5. Кодекс Крови"
Inst47Quest5_Level = "70"
Inst47Quest5_Attain = "68"
Inst47Quest5_Aim = "Прочитайте Кодекс Крови в Темном Лабиринте в Аукиндоне."
Inst47Quest5_Location = "Боевой командир Мафуун (Лес Тероккар - Аукиндон; "..YELLOW.."40,72"..WHITE..")"
Inst47Quest5_Note = "Кодекс Крови находится прямо перед Великим мастером Ворпилом около "..YELLOW.."[4]"..WHITE.."."
Inst47Quest5_Prequest = "В Аукиндоне неспокойно"
Inst47Quest5_Folgequest = "В самом сердце Лабиринта"
Inst47Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst47Quest6 = "6. В самом сердце Лабиринта"
Inst47Quest6_Level = "70"
Inst47Quest6_Attain = "68"
Inst47Quest6_Aim = "Уничтожьте Бормотуна и доложите о том, что произошло внутри Темного Лабиринта, повелительнице шпионов Мелисе Высокий Венец, которую можно найти на Террасе Света в Шаттрате."
Inst47Quest6_Location = "Кодекс Крови (Темный лабиринт; "..YELLOW.."[4]"..WHITE..")"
Inst47Quest6_Note = "Бормотун находится около "..YELLOW.."[5]"..WHITE..". Повелительница шпионов Мелиса Высокий Венец находится около (Шаттрат - Терраса Света; "..YELLOW.."51,45"..WHITE..")"
Inst47Quest6_Prequest = "Кодекс Крови"
Inst47Quest6_Folgequest = "Нет"
Inst47Quest6FQuest = "true"
--
Inst47Quest6name1 = "Шаттрат Jumpers"
Inst47Quest6name2 = "Spymistress's Boots"
Inst47Quest6name3 = "Auchenai Boots"
Inst47Quest6name4 = "Sha'tari Wrought Greaves"

--Quest 7 Alliance
Inst47Quest7 = "7. Испытание Наару: сила (Героическое)"
Inst47Quest7_Level = "70"
Inst47Quest7_Attain = "70"
Inst47Quest7_Aim = "А'дал из Шаттрата просит добыть трезубец Калитреша и сущность Бормотуна."
Inst47Quest7_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst47Quest7_Note = "Это задание выполняется в режиме героической сложности. Бормотун находится около "..YELLOW.."[5]"..WHITE..". А трезубец Калитреша в Паровом подземелье.\n\nЭто задание нужно было выполнить, чтобы войти в Крепость Бурь: Око, но больше не необходимо."
Inst47Quest7_Prequest = "Нет"
Inst47Quest7_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 8 Alliance
Inst47Quest8 = "8. Вход в Каражан"
Inst47Quest8_Level = "70"
Inst47Quest8_Attain = "68"
Inst47Quest8_Aim = "Пройдите в Темный Лабиринт в Аукиндоне, найдите там волшебный контейнер и возьмите из него первый фрагмент ключа, после чего вернитесь к Кадгару."
Inst47Quest8_Location = "Кадгар (Шаттрат - Терраса Света; "..YELLOW.."54,44"..WHITE..")"
Inst47Quest8_Note = "Часть линейки для подготовки к Каражану. Волшебный контейнер находится рядом с Бормотуном около "..YELLOW.."[5]"..WHITE..". При открытии появляется элементаль, которого нужно убить, чтобы получить фрагмент."
Inst47Quest8_Prequest = "Кадгар"
Inst47Quest8_Folgequest = "Второй и третий фрагменты"
Inst47Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst47Quest9 = "9. Демонический словарь"
Inst47Quest9_Level = "69"
Inst47Quest9_Attain = "67"
Inst47Quest9_Aim = "Добудьте Демонический словарь у великого мастера Ворпила и принесите его Давиду Вейну в Приют Уэйна."
Inst47Quest9_Location = "Давид Вейн (Лес Тероккар - Приют Уэйна; "..YELLOW.."78,39"..WHITE..")."
Inst47Quest9_Note = "Великий мастер Ворпил находится около "..YELLOW.."[4]"..WHITE..". Задание выполняется вместе с Новинка из Механара ("..YELLOW.."КБ: Механар"..WHITE..") и открывает два новых задания у Давида Вейна.\n\nПредмет не падает на Героической сложности."
Inst47Quest9_Prequest = "Дополнительные материалы"
Inst47Quest9_Folgequest = "Нет"
Inst47Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst47Quest10 = "10. Разыскивается: Шепот Бормотуна (Героическое (ежедн.))"
Inst47Quest10_Level = "70"
Inst47Quest10_Attain = "70"
Inst47Quest10_Aim = "Добудьте Шепот Бормотуна и вернитесь к торговцу Ветром Зариму, в Нижний Город Шаттрата."
Inst47Quest10_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest10_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nБормотун находится около "..YELLOW.."[5]"..WHITE.."."
Inst47Quest10_Prequest = "Нет"
Inst47Quest10_Folgequest = "Нет"
--
Inst47Quest10name1 = "Знак справедливости"

--Quest 11 Alliance
Inst47Quest11 = "11. Разыскиваются: Злобные инструкторы. (ежедн.)"
Inst47Quest11_Level = "70"
Inst47Quest11_Attain = "70"
Inst47Quest11_Aim = "Убейте для ловчего Пустоты Ма'дууна 3 злобных инструкторов, по выполнении вернитесь к нему в Нижний Город Шатратта, чтобы получить свою награду."
Inst47Quest11_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst47Quest11_Note = "Это ежедневное задание."
Inst47Quest11_Prequest = "Нет"
Inst47Quest11_Folgequest = "Нет"
--
Inst47Quest11name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst47Quest1_HORDE = Inst47Quest1
Inst47Quest1_HORDE_Level = Inst47Quest1_Level
Inst47Quest1_HORDE_Attain = Inst47Quest1_Attain
Inst47Quest1_HORDE_Aim = Inst47Quest1_Aim
Inst47Quest1_HORDE_Location = Inst47Quest1_Location
Inst47Quest1_HORDE_Note = Inst47Quest1_Note
Inst47Quest1_HORDE_Prequest = Inst47Quest1_Prequest
Inst47Quest1_HORDE_Folgequest = Inst47Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst47Quest2_HORDE = Inst47Quest2
Inst47Quest2_HORDE_Level = Inst47Quest2_Level
Inst47Quest2_HORDE_Attain = Inst47Quest2_Attain
Inst47Quest2_HORDE_Aim = Inst47Quest2_Aim
Inst47Quest2_HORDE_Location = Inst47Quest2_Location
Inst47Quest2_HORDE_Note = Inst47Quest2_Note
Inst47Quest2_HORDE_Prequest = Inst47Quest2_Prequest
Inst47Quest2_HORDE_Folgequest = Inst47Quest2_Folgequest
Inst47Quest2FQuest_HORDE = Inst47Quest2FQuest
--
Inst47Quest2name1_HORDE = Inst47Quest2name1
Inst47Quest2name2_HORDE = Inst47Quest2name2
Inst47Quest2name3_HORDE = Inst47Quest2name3
Inst47Quest2name4_HORDE = Inst47Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst47Quest3_HORDE = Inst47Quest3
Inst47Quest3_HORDE_Level = Inst47Quest3_Level
Inst47Quest3_HORDE_Attain = Inst47Quest3_Attain
Inst47Quest3_HORDE_Aim = Inst47Quest3_Aim
Inst47Quest3_HORDE_Location = Inst47Quest3_Location
Inst47Quest3_HORDE_Note = Inst47Quest3_Note
Inst47Quest3_HORDE_Prequest = Inst47Quest3_Prequest
Inst47Quest3_HORDE_Folgequest = Inst47Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst47Quest4_HORDE = Inst47Quest4
Inst47Quest4_HORDE_Level = Inst47Quest4_Level
Inst47Quest4_HORDE_Attain = Inst47Quest4_Attain
Inst47Quest4_HORDE_Aim = Inst47Quest4_Aim
Inst47Quest4_HORDE_Location = Inst47Quest4_Location
Inst47Quest4_HORDE_Note = Inst47Quest4_Note
Inst47Quest4_HORDE_Prequest = Inst47Quest4_Prequest
Inst47Quest4_HORDE_Folgequest = Inst47Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst47Quest5_HORDE = Inst47Quest5
Inst47Quest5_HORDE_Level = Inst47Quest5_Level
Inst47Quest5_HORDE_Attain = Inst47Quest5_Attain
Inst47Quest5_HORDE_Aim = Inst47Quest5_Aim
Inst47Quest5_HORDE_Location = Inst47Quest5_Location
Inst47Quest5_HORDE_Note = Inst47Quest5_Note
Inst47Quest5_HORDE_Prequest = Inst47Quest5_Prequest
Inst47Quest5_HORDE_Folgequest = Inst47Quest5_Folgequest
Inst47Quest5FQuest_HORDE = Inst47Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst47Quest6_HORDE = Inst47Quest6
Inst47Quest6_HORDE_Level = Inst47Quest6_Level
Inst47Quest6_HORDE_Attain = Inst47Quest6_Attain
Inst47Quest6_HORDE_Aim = Inst47Quest6_Aim
Inst47Quest6_HORDE_Location = Inst47Quest6_Location
Inst47Quest6_HORDE_Note = Inst47Quest6_Note
Inst47Quest6_HORDE_Prequest = Inst47Quest6_Prequest
Inst47Quest6_HORDE_Folgequest = Inst47Quest6_Folgequest
Inst47Quest6FQuest_HORDE = Inst47Quest6FQuest
--
Inst47Quest6name1_HORDE = Inst47Quest6name1
Inst47Quest6name2_HORDE = Inst47Quest6name2
Inst47Quest6name3_HORDE = Inst47Quest6name3
Inst47Quest6name4_HORDE = Inst47Quest6name4

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst47Quest7_HORDE = Inst47Quest7
Inst47Quest7_HORDE_Level = Inst47Quest7_Level
Inst47Quest7_HORDE_Attain = Inst47Quest7_Attain
Inst47Quest7_HORDE_Aim = Inst47Quest7_Aim
Inst47Quest7_HORDE_Location = Inst47Quest7_Location
Inst47Quest7_HORDE_Note = Inst47Quest7_Note
Inst47Quest7_HORDE_Prequest = Inst47Quest7_Prequest
Inst47Quest7_HORDE_Folgequest = Inst47Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst47Quest8_HORDE = Inst47Quest8
Inst47Quest8_HORDE_Level = Inst47Quest8_Level
Inst47Quest8_HORDE_Attain = Inst47Quest8_Attain
Inst47Quest8_HORDE_Aim = Inst47Quest8_Aim
Inst47Quest8_HORDE_Location = Inst47Quest8_Location
Inst47Quest8_HORDE_Note = Inst47Quest8_Note
Inst47Quest8_HORDE_Prequest = Inst47Quest8_Prequest
Inst47Quest8_HORDE_Folgequest = Inst47Quest8_Folgequest
Inst47Quest8PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst47Quest9_HORDE = Inst47Quest9
Inst47Quest9_HORDE_Level = Inst47Quest9_Level
Inst47Quest9_HORDE_Attain = Inst47Quest9_Attain
Inst47Quest9_HORDE_Aim = Inst47Quest9_Aim
Inst47Quest9_HORDE_Location = Inst47Quest9_Location
Inst47Quest9_HORDE_Note = Inst47Quest9_Note
Inst47Quest9_HORDE_Prequest = Inst47Quest9_Prequest
Inst47Quest9_HORDE_Folgequest = Inst47Quest9_Folgequest
Inst47Quest9PreQuest_HORDE = Inst47Quest8PreQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst47Quest10_HORDE = Inst47Quest10
Inst47Quest10_HORDE_Level = Inst47Quest10_Level
Inst47Quest10_HORDE_Attain = Inst47Quest10_Attain
Inst47Quest10_HORDE_Aim = Inst47Quest10_Aim
Inst47Quest10_HORDE_Location = Inst47Quest10_Location
Inst47Quest10_HORDE_Note = Inst47Quest10_Note
Inst47Quest10_HORDE_Prequest = Inst47Quest10_Prequest
Inst47Quest10_HORDE_Folgequest = Inst47Quest10_Folgequest
--
Inst47Quest10name1_HORDE = Inst47Quest10name1

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst47Quest11_HORDE = Inst47Quest11
Inst47Quest11_HORDE_Level = Inst47Quest11_Level
Inst47Quest11_HORDE_Attain = Inst47Quest11_Attain
Inst47Quest11_HORDE_Aim = Inst47Quest11_Aim
Inst47Quest11_HORDE_Location = Inst47Quest11_Location
Inst47Quest11_HORDE_Note = Inst47Quest11_Note
Inst47Quest11_HORDE_Prequest = Inst47Quest11_Prequest
Inst47Quest11_HORDE_Folgequest = Inst47Quest11_Folgequest
--
Inst47Quest11name1_HORDE = Inst47Quest11name1



--------------- INST48 - CR: Serpentshrine Cavern (SSC) ---------------

Inst48Story = "Хрупкий баланс экологии Зангартопи был нарушен.\n\nНеестественный феномен исковеркал и разрушил природную флору и фауну болота.\n\nЭти беспорядки проследили до вызывающего нехорошие предчуствия Резервуара Кривого Клыка.\n\nХодят слухи, что предводителем этих таинственных сил является никто иной, как печально известная Леди Вайш.\n\nТолько вы можете раскрыть ее нечестивые планы и предотвратить их, пока не стало слишком поздно.\n\nРезервуар Кривого Клыка разделен на четыре зоны, три из которых - подземелья рассчитанные на 5 игроков (Узилище, Нижетопь, и Паровое подземелье), а еще одна - рейдовое подземелье на 25 человек - Змеиное святилище. "
Inst48Caption = "РКК: Змеиное святилище"
Inst48QAA = "2 Задания"
Inst48QAH = "2 Задания"

--Quest 1 Alliance
Inst48Quest1 = "1. Сосуды Вечности"
Inst48Quest1_Level = "70"
Inst48Quest1_Attain = "70"
Inst48Quest1_Aim = "Принесите Соридорми в Пещеры Времени фиал Леди Вайш из Резервуара Кривого Клыка и фиал Кель'таса из Крепости Бурь."
Inst48Quest1_Location = "Соридорми (Танарис - Пещеры времени; "..YELLOW.."58,57"..WHITE.."). НИП бродит по зоне."
Inst48Quest1_Note = "Это задание необходимо для подготовки к Битве на вершине Хиджала. Леди Вайш находится около "..YELLOW.."[6]"..WHITE.."."
Inst48Quest1_Prequest = "Нет"
Inst48Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. Тайна под угрозой"
Inst48Quest2_Level = "70"
Inst48Quest2_Attain = "70"
Inst48Quest2_Aim = "Отправляйтесь в Клеть Стражницы в Долину Призрачной Луны и поговорите с Акамой."
Inst48Quest2_Location = "Провидец Олум (Змеиное святилище; "..YELLOW.."[4]"..WHITE..")"
Inst48Quest2_Note = "Акама находится около (Долина Призрачной луны - Клеть Стражницы; "..YELLOW.."58,48"..WHITE..").\n\nЭто задание часть линейки для подготовки к Черному Храму, которая начинается у Анахорет Кейла (Долина Призрачной луны - Алтарь Ша'тар; "..YELLOW.."62,38"..WHITE..") для Алдоров и Чародей Тэлис (Долина Призрачной луны - Святилище Звезд; "..YELLOW.."56,59"..WHITE..") для Провидцев."
Inst48Quest2_Prequest = "Таблички Баа'ри -> Обещание Акамы"
Inst48Quest2_Folgequest = "Коварство Пеплоустов ("..YELLOW.."КБ: Око"..WHITE..")"
Inst48Quest2PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst48Quest1_HORDE = Inst48Quest1
Inst48Quest1_HORDE_Level = Inst48Quest1_Level
Inst48Quest1_HORDE_Attain = Inst48Quest1_Attain
Inst48Quest1_HORDE_Aim = Inst48Quest1_Aim
Inst48Quest1_HORDE_Location = Inst48Quest1_Location
Inst48Quest1_HORDE_Note = Inst48Quest1_Note
Inst48Quest1_HORDE_Prequest = Inst48Quest1_Prequest
Inst48Quest1_HORDE_Folgequest = Inst48Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst48Quest2_HORDE = Inst48Quest2
Inst48Quest2_HORDE_Level = Inst48Quest2_Level
Inst48Quest2_HORDE_Attain = Inst48Quest2_Attain
Inst48Quest2_HORDE_Aim = Inst48Quest2_Aim
Inst48Quest2_HORDE_Location = Inst48Quest2_Location
Inst48Quest2_HORDE_Note = Inst48Quest2_Note
Inst48Quest2_HORDE_Prequest = Inst48Quest2_Prequest
Inst48Quest2_HORDE_Folgequest = Inst48Quest2_Folgequest
Inst48Quest2PreQuest_HORDE = Inst48Quest2PreQuest
-- No Rewards for this quest



--------------- INST49 - CoT: Black Morass (BM) ---------------

Inst49Story = "Медив, последний магический Хранитель Тирисфаля, был с рождения одержим злобным титаном, Саргерасом.\n\nИменно Медив был тем, кто первым связался с испорченным колдуном-орком Гул'даном, также служащему Пылающему легиону.\n\nВместе они нашли способ построить мост через провал между измерениями Азерота и Дренора, родного мира орков, поспособствовавший рарушению Азерота.\n\nВ назначенный день Медив и Гул'дан сконцентрировали массу своей магической энергии, вызвав прорыв барьера между измерениями.\n\nЭти события произошли в Черных топях, теперь известных как Выжженные земли.\n\nИгрокам нужно защитить Медива, пока он открывает портал."
Inst49Caption = "ПВ: Черные топи"
Inst49QAA = "7 Заданий"
Inst49QAH = "7 Заданий"

--Quest 1 Alliance
Inst49Quest1 = "1. Черные топи"
Inst49Quest1_Level = "70"
Inst49Quest1_Attain = "66"
Inst49Quest1_Aim = "Пройдите сквозь Пещеры Времени до Черных топей времен открытия Темного портала и поговорите с Са'атом."
Inst49Quest1_Location = "Андорму (Танарис - Пещеры времени; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest1_Note = "Предварительно обязательно нужно выполнить 'Побег из Дарнхольда'. Са'ат находится прямо за входом в подземелье."
Inst49Quest1_Prequest = "Нет"
Inst49Quest1_Folgequest = "Открытие Темного портала"
-- No Rewards for this quest

--Quest 2 Alliance
Inst49Quest2 = "2. Открытие Темного портала"
Inst49Quest2_Level = "70"
Inst49Quest2_Attain = "66"
Inst49Quest2_Aim = "Защищайте Медива, пока он не откроет Темный портал. Когда выполните задание, возвращайтесь к Са'ату."
Inst49Quest2_Location = "Са'ат (Черные топи; "..YELLOW.."Вход"..WHITE..")"
Inst49Quest2_Note = "Если вы провалитесь, все придется начинать сначала."
Inst49Quest2_Prequest = "Черные топи"
Inst49Quest2_Folgequest = "Герой драконьего племени"
Inst49Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst49Quest3 = "3. Герой драконьего племени"
Inst49Quest3_Level = "70"
Inst49Quest3_Attain = "66"
Inst49Quest3_Aim = "Возвращайтесь к маленькому Андорму в пустыню Танарис в Пещерах Времени."
Inst49Quest3_Location = "Андорму (Танарис - Пещеры времени; "..YELLOW.."58,54"..WHITE..")"
Inst49Quest3_Note = ""
Inst49Quest3_Prequest = "Открытие Темного портала"
Inst49Quest3_Folgequest = "Нет"
Inst49Quest3FQuest = "true"
--
Inst49Quest3name1 = "Band of the Guardian"
Inst49Quest3name2 = "Keeper's Ring of Piety"
Inst49Quest3name3 = "Time-bending Gem"
Inst49Quest3name4 = "Андорму's Tear"

--Quest 4 Alliance
Inst49Quest4 = "4. Разрешение учителя"
Inst49Quest4_Level = "70"
Inst49Quest4_Attain = "69"
Inst49Quest4_Aim = "Отправляйтесь в Пещеры Времени и уговорите Медива дать разрешение на использование Восстановленного ключа."
Inst49Quest4_Location = "Кадгар (Шаттрат - Терраса Света; "..YELLOW.."54,44"..WHITE..")"
Inst49Quest4_Note = "Часть линейки для подготовки к Каражану. Вы должны находиться внутри подземелья, когда Эонус умрет, затем поговорите с Медивом."
Inst49Quest4_Prequest = "Второй и третий фрагменты"
Inst49Quest4_Folgequest = "Возвращение к Кадгару"
Inst49Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. Мастер эликсиров (Алхимия)"
Inst49Quest5_Level = "70"
Inst49Quest5_Attain = "68"
Inst49Quest5_Aim = "Отправляйтесь в Черные Топи в Пещерах Времени и добудьте 10 кристаллов сути Бесконечности с повелителей и хранительниц временных разломов. Затем отнесите кристаллы, 5 хороших эликсиров защиты, 5 эликсиров власти и 5 хороших эликсиров ловкости Лорокиму в Нижний Город Шаттрата."
Inst49Quest5_Location = "Лороким (Шаттрат - Нижний город; "..YELLOW.."46,23"..WHITE..")"
Inst49Quest5_Note = "Задание для алхимиков. Лороким бродит по описанным координатам."
Inst49Quest5_Prequest = "Мастер эликсиров"
Inst49Quest5_Folgequest = "Нет"
Inst49Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst49Quest6 = "6. Заказ: песочные часы Эонуса (Героическое (ежедн.))"
Inst49Quest6_Level = "70"
Inst49Quest6_Attain = "70"
Inst49Quest6_Aim = "Торговец ветром Зерим просит вас добыть песочные часы Эонуса. Доставьте их ему в Нижний Город Шаттрата и получите награду."
Inst49Quest6_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest6_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nЭонус появляется в последней волне."
Inst49Quest6_Prequest = "Нет"
Inst49Quest6_Folgequest = "Нет"
--
Inst49Quest6name1 = "Знак справедливости"

--Quest 7 Alliance
Inst49Quest7 = "7. Розыск: Повелители временных разломов (ежедн.)"
Inst49Quest7_Level = "70"
Inst49Quest7_Attain = "70"
Inst49Quest7_Aim = "Ловчий Пустоты Ма'дуун хочет, чтобы вы убили 4 повелителей временных разломов. Вернитесь к нему в Нижний Город Шаттрата за наградой, когда они будут убиты."
Inst49Quest7_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst49Quest7_Note = "Это ежедневное задание."
Inst49Quest7_Prequest = "Нет"
Inst49Quest7_Folgequest = "Нет"
--
Inst49Quest7name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst49Quest1_HORDE = Inst49Quest1
Inst49Quest1_HORDE_Level = Inst49Quest1_Level
Inst49Quest1_HORDE_Attain = Inst49Quest1_Attain
Inst49Quest1_HORDE_Aim = Inst49Quest1_Aim
Inst49Quest1_HORDE_Location = Inst49Quest1_Location
Inst49Quest1_HORDE_Note = Inst49Quest1_Note
Inst49Quest1_HORDE_Prequest = Inst49Quest1_Prequest
Inst49Quest1_HORDE_Folgequest = Inst49Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst49Quest2_HORDE = Inst49Quest2
Inst49Quest2_HORDE_Level = Inst49Quest2_Level
Inst49Quest2_HORDE_Attain = Inst49Quest2_Attain
Inst49Quest2_HORDE_Aim = Inst49Quest2_Aim
Inst49Quest2_HORDE_Location = Inst49Quest2_Location
Inst49Quest2_HORDE_Note = Inst49Quest2_Note
Inst49Quest2_HORDE_Prequest = Inst49Quest2_Prequest
Inst49Quest2_HORDE_Folgequest = Inst49Quest2_Folgequest
Inst49Quest2FQuest_HORDE = Inst49Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst49Quest3_HORDE = Inst49Quest3
Inst49Quest3_HORDE_Level = Inst49Quest3_Level
Inst49Quest3_HORDE_Attain = Inst49Quest3_Attain
Inst49Quest3_HORDE_Aim = Inst49Quest3_Aim
Inst49Quest3_HORDE_Location = Inst49Quest3_Location
Inst49Quest3_HORDE_Note = Inst49Quest3_Note
Inst49Quest3_HORDE_Prequest = Inst49Quest3_Prequest
Inst49Quest3_HORDE_Folgequest = Inst49Quest3_Folgequest
Inst49Quest3FQuest_HORDE = Inst49Quest3FQuest
--
Inst49Quest3name1_HORDE = Inst49Quest3name1
Inst49Quest3name2_HORDE = Inst49Quest3name2
Inst49Quest3name3_HORDE = Inst49Quest3name3
Inst49Quest3name4_HORDE = Inst49Quest3name4

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst49Quest4_HORDE = Inst49Quest4
Inst49Quest4_HORDE_Level = Inst49Quest4_Level
Inst49Quest4_HORDE_Attain = Inst49Quest4_Attain
Inst49Quest4_HORDE_Aim = Inst49Quest4_Aim
Inst49Quest4_HORDE_Location = Inst49Quest4_Location
Inst49Quest4_HORDE_Note = Inst49Quest4_Note
Inst49Quest4_HORDE_Prequest = Inst49Quest4_Prequest
Inst49Quest4_HORDE_Folgequest = Inst49Quest4_Folgequest
Inst49Quest4PreQuest_HORDE = Inst49Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst49Quest5_HORDE = Inst49Quest5
Inst49Quest5_HORDE_Level = Inst49Quest5_Level
Inst49Quest5_HORDE_Attain = Inst49Quest5_Attain
Inst49Quest5_HORDE_Aim = Inst49Quest5_Aim
Inst49Quest5_HORDE_Location = Inst49Quest5_Location
Inst49Quest5_HORDE_Note = Inst49Quest5_Note
Inst49Quest5_HORDE_Prequest = Inst49Quest5_Prequest
Inst49Quest5_HORDE_Folgequest = Inst49Quest5_Folgequest
Inst49Quest5PreQuest_HORDE = Inst49Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst49Quest6_HORDE = Inst49Quest6
Inst49Quest6_HORDE_Level = Inst49Quest6_Level
Inst49Quest6_HORDE_Attain = Inst49Quest6_Attain
Inst49Quest6_HORDE_Aim = Inst49Quest6_Aim
Inst49Quest6_HORDE_Location = Inst49Quest6_Location
Inst49Quest6_HORDE_Note = Inst49Quest6_Note
Inst49Quest6_HORDE_Prequest = Inst49Quest6_Prequest
Inst49Quest6_HORDE_Folgequest = Inst49Quest6_Folgequest
--
Inst49Quest6name1_HORDE = Inst49Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst49Quest7_HORDE = Inst49Quest7
Inst49Quest7_HORDE_Level = Inst49Quest7_Level
Inst49Quest7_HORDE_Attain = Inst49Quest7_Attain
Inst49Quest7_HORDE_Aim = Inst49Quest7_Aim
Inst49Quest7_HORDE_Location = Inst49Quest7_Location
Inst49Quest7_HORDE_Note = Inst49Quest7_Note
Inst49Quest7_HORDE_Prequest = Inst49Quest7_Prequest
Inst49Quest7_HORDE_Folgequest = Inst49Quest7_Folgequest
--
Inst49Quest7name1_HORDE = Inst49Quest7name1



--------------- INST50 - CoT: Battle of Mount Hyjal ---------------

Inst50Story = "At the pinnacle of the второй битвы против Пылающего легиона расам Азерота стало ясно, что единственный способ победить - обЪединить свои силы в последнем, отчаянном рывке к победе.\n\nЭта битва произошла на вершине горы Хиджал, у подножия Нордрассила, Мирового древа.\n\nНочные эльфы, по руководством Малфуриона Ярости Бури и Тиренд Шепот Ветра, новая Орда, ведомая Траллом и Кэрном Кровавым Копытом, и остатки Альянса Лордерона, под рукой Джайны Праудмур, объединили силы против Архимонда и демонических сил Пылающего легиона в масштабной, эпической битве по защите Азерота.\n\nПобеды с трудом удалось достичь, только когда Архимонд уже достиг Мирового древа и попытался вытянуть его энергию."
Inst50Caption = "ПВ: Вершина Хиджала"
Inst50QAA = "1 Задание"
Inst50QAH = "1 Задание"

--Quest 1 Alliance
Inst50Quest1 = "1. Артефакт из прошлого"
Inst50Quest1_Level = "70"
Inst50Quest1_Attain = "70"
Inst50Quest1_Aim = "Отправляйтесь к пещере Времени в Танарисе и вступите в битву за Хиджальские горы. Сразите Лютого Хлада и принесите амулет из прошлого Акаме в долину Лунной Тени."
Inst50Quest1_Location = "Акама (Долина Призрачной луны - Клеть Стражницы; "..YELLOW.."58,48"..WHITE..")"
Inst50Quest1_Note = "Часть линейки заданий для подготовки к Черному храму. Лютый Хлад находится около "..YELLOW.."[1]"..WHITE.."."
Inst50Quest1_Prequest = "Коварство Пеплоустов ("..YELLOW.."КБ: Око"..WHITE..")"
Inst50Quest1_Folgequest = "Пленная душа"
Inst50Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst50Quest1_HORDE = Inst50Quest1
Inst50Quest1_HORDE_Level = Inst50Quest1_Level
Inst50Quest1_HORDE_Attain = Inst50Quest1_Attain
Inst50Quest1_HORDE_Aim = Inst50Quest1_Aim
Inst50Quest1_HORDE_Location = Inst50Quest1_Location
Inst50Quest1_HORDE_Note = Inst50Quest1_Note
Inst50Quest1_HORDE_Prequest = Inst50Quest1_Prequest
Inst50Quest1_HORDE_Folgequest = Inst50Quest1_Folgequest
Inst50Quest1PreQuest_HORDE = Inst50Quest1PreQuest
-- No Rewards for this quest



--------------- INST51 - CoT: Old Hillsbrad ---------------

Inst51Story = "Крепость Дарнхольд была штабом резерваций орков в в южном Лордероне, появившихся после поражения орды во Второй войне.\n\nВ это время, Тралл был 19-летним рабом у человеческого командира Эделас Блэкмур, который собирался использовать Тралла как марионеточного Вождя для управления Ордой орков и таким образом получить власть над другими людьми.\n\nОднако, Тралл знал что он предназначен для большего, и поэтому устроил свой побег из Дарнхольда, чтобы найти соратников, в конце концов обретя клан Ледяного Волка и свое место как Вождя.\n\nЭто подземелье содержит всю территорию Хиллсбрада, какой она была 10 лет назад, до того как уничтоженные Ордой Дарнхольд и мельница Таррен перешли к нежити"
Inst51Caption = "ПВ: Дарнхольд"
Inst51QAA = "6 Заданий"
Inst51QAH = "6 Заданий"

--Quest 1 Alliance
Inst51Quest1 = "1. Старый Хилсбрад"
Inst51Quest1_Level = "68"
Inst51Quest1_Attain = "66"
Inst51Quest1_Aim = "Отправьтесь по тропе времени в Старый Хилсбрад и поговорите с Эрозионом."
Inst51Quest1_Location = "Андорму (Танарис - Пещеры времени; "..YELLOW.."58,54"..WHITE..")"
Inst51Quest1_Note = "Нужно сначала выполнить подготовительное задание, начинающееся у дракона у входа в Пещеры времени."
Inst51Quest1_Prequest = "Пещеры времени"
Inst51Quest1_Folgequest = "План Тареты"
Inst51Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. План Тареты"
Inst51Quest2_Level = "68"
Inst51Quest2_Attain = "66"
Inst51Quest2_Aim = "Проберитесь в крепость Дарнхольд и заложите пять зажигательных бомб возле бочек внутри каждого из бараков на выселках. Используйте упаковку зажигательных бомб, полученных от Эрозиона. После того как подожжете бараки, разыщите Тралла в подземной темнице."
Inst51Quest2_Location = "Эрозион (Старый Хиллсбрад; "..YELLOW.."Entrance"..WHITE..")"
Inst51Quest2_Note = "Тралл находится около "..YELLOW.."[2]"..WHITE..". Отправляйтесь в Южнобережье, чтобы услышать историю Пеплоносца и увидеть некоторых людей со знаменитыми именами, таких как Кель'Тузед и Герод Забияка."
Inst51Quest2_Prequest = "Старый Хилсбрад"
Inst51Quest2_Folgequest = "Побег из Дарнхольда"
Inst51Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst51Quest3 = "3. Побег из Дарнхольда"
Inst51Quest3_Level = "68"
Inst51Quest3_Attain = "66"
Inst51Quest3_Aim = "Когда вы будете готовы идти, сообщите об этом Траллу. Помогите ему бежать из крепости Дарнхольд, освободить Тарету и исполнить свое предназначение. После этого возвращайтесь к Эрозиону в Старый Хилсбрад."
Inst51Quest3_Location = "Тралл (Дарнхольд; "..YELLOW.."[2]"..WHITE..")"
Inst51Quest3_Note = "Удостоверьтесь что все взяли задание, перед тем как кто-нибудь поговорит с Траллом, чтобы начать. Хотя, задание можно предложить другу и успешно выполнить. У вас есть 20 попыток спасения Тралла или вам придется сбросить подземелье, так как вы не сможете убить последнего босса, потому что финальный удар должен нанести Тралл."
Inst51Quest3_Prequest = "План Тареты"
Inst51Quest3_Folgequest = "Возвращение к Андорму"
Inst51Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst51Quest4 = "4. Возвращение к Андорму"
Inst51Quest4_Level = "68"
Inst51Quest4_Attain = "66"
Inst51Quest4_Aim = "Возвращайтесь к маленькому Андорму в Пещеры Времени."
Inst51Quest4_Location = "Эрозион (Старый Хиллсбрад; "..YELLOW.."Entrance"..WHITE..")"
Inst51Quest4_Note = "Андорму находится около (Танарис - Пещеры времени; "..YELLOW.."58,54"..WHITE.."). Выполнение задания позволит вам войти в Черные топи."
Inst51Quest4_Prequest = "Побег из Дарнхольда"
Inst51Quest4_Folgequest = "Нет"
Inst51Quest4FQuest = "true"
--
Inst51Quest4name1 = "Tempest's Touch"
Inst51Quest4name2 = "Южнобережье Sneakers"
Inst51Quest4name3 = "Tarren Mill Defender's Cinch"
Inst51Quest4name4 = "Warchief's Mantle"

--Quest 5 Alliance
Inst51Quest5 = "5. Розыск: Голова Охотника Вечности (Героическое (ежедн.))"
Inst51Quest5_Level = "70"
Inst51Quest5_Attain = "70"
Inst51Quest5_Aim = "Торговец ветром Зерим просит вас добыть для него голову Охотника Вечности. Доставьте ее ему в Нижний Город Шаттрата и получите награду."
Inst51Quest5_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst51Quest5_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nОхотник Вечности находится около "..YELLOW.."[5]"..WHITE.."."
Inst51Quest5_Prequest = "Нет"
Inst51Quest5_Folgequest = "Нет"
--
Inst51Quest5name1 = "Знак справедливости"

--Quest 6 Alliance
Inst51Quest6 = "6. Милая шляпка..."
Inst51Quest6_Level = "68"
Inst51Quest6_Attain = "66"
Inst51Quest6_Aim = "Сам того не желая, Дон Карлос сподвиг вас сразиться с ним молодым в Старом Хилсбраде. Принесите ему шляпу Дона Карлоса в доказательство вашей победы. Он будет ждать вас в Танарисе."
Inst51Quest6_Location = "Дон Карлос (Tanaris; "..YELLOW.."54,29"..WHITE..")"
Inst51Quest6_Note = "Дон Карлос патрулирует дорогу около "..YELLOW.."[??]"..WHITE.."."
Inst51Quest6_Prequest = "Нет"
Inst51Quest6_Folgequest = "Нет"
--
Inst51Quest6name1 = "Haliscan Brimmed Hat"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst51Quest1_HORDE = Inst51Quest1
Inst51Quest1_HORDE_Level = Inst51Quest1_Level
Inst51Quest1_HORDE_Attain = Inst51Quest1_Attain
Inst51Quest1_HORDE_Aim = Inst51Quest1_Aim
Inst51Quest1_HORDE_Location = Inst51Quest1_Location
Inst51Quest1_HORDE_Note = Inst51Quest1_Note
Inst51Quest1_HORDE_Prequest = Inst51Quest1_Prequest
Inst51Quest1_HORDE_Folgequest = Inst51Quest1_Folgequest
Inst51Quest1PreQuest_HORDE = Inst51Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst51Quest2_HORDE = Inst51Quest2
Inst51Quest2_HORDE_Level = Inst51Quest2_Level
Inst51Quest2_HORDE_Attain = Inst51Quest2_Attain
Inst51Quest2_HORDE_Aim = Inst51Quest2_Aim
Inst51Quest2_HORDE_Location = Inst51Quest2_Location
Inst51Quest2_HORDE_Note = Inst51Quest2_Note
Inst51Quest2_HORDE_Prequest = Inst51Quest2_Prequest
Inst51Quest2_HORDE_Folgequest = Inst51Quest2_Folgequest
Inst51Quest2FQuest_HORDE = Inst51Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst51Quest3_HORDE = Inst51Quest3
Inst51Quest3_HORDE_Level = Inst51Quest3_Level
Inst51Quest3_HORDE_Attain = Inst51Quest3_Attain
Inst51Quest3_HORDE_Aim = Inst51Quest3_Aim
Inst51Quest3_HORDE_Location = Inst51Quest3_Location
Inst51Quest3_HORDE_Note = Inst51Quest3_Note
Inst51Quest3_HORDE_Prequest = Inst51Quest3_Prequest
Inst51Quest3_HORDE_Folgequest = Inst51Quest3_Folgequest
Inst51Quest3FQuest_HORDE = Inst51Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst51Quest4_HORDE = Inst51Quest4
Inst51Quest4_HORDE_Level = Inst51Quest4_Level
Inst51Quest4_HORDE_Attain = Inst51Quest4_Attain
Inst51Quest4_HORDE_Aim = Inst51Quest4_Aim
Inst51Quest4_HORDE_Location = Inst51Quest4_Location
Inst51Quest4_HORDE_Note = Inst51Quest4_Note
Inst51Quest4_HORDE_Prequest = Inst51Quest4_Prequest
Inst51Quest4_HORDE_Folgequest = Inst51Quest4_Folgequest
Inst51Quest4FQuest_HORDE = Inst51Quest4FQuest
--
Inst51Quest4name1_HORDE = Inst51Quest4name1
Inst51Quest4name2_HORDE = Inst51Quest4name2
Inst51Quest4name3_HORDE = Inst51Quest4name3
Inst51Quest4name4_HORDE = Inst51Quest4name4

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst51Quest5_HORDE = Inst51Quest5
Inst51Quest5_HORDE_Level = Inst51Quest5_Level
Inst51Quest5_HORDE_Attain = Inst51Quest5_Attain
Inst51Quest5_HORDE_Aim = Inst51Quest5_Aim
Inst51Quest5_HORDE_Location = Inst51Quest5_Location
Inst51Quest5_HORDE_Note = Inst51Quest5_Note
Inst51Quest5_HORDE_Prequest = Inst51Quest5_Prequest
Inst51Quest5_HORDE_Folgequest = Inst51Quest5_Folgequest
--
Inst51Quest5name1_HORDE = Inst51Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst51Quest6_HORDE = Inst51Quest6
Inst51Quest6_HORDE_Level = Inst51Quest6_Level
Inst51Quest6_HORDE_Attain = Inst51Quest6_Attain
Inst51Quest6_HORDE_Aim = Inst51Quest6_Aim
Inst51Quest6_HORDE_Location = Inst51Quest6_Location
Inst51Quest6_HORDE_Note = Inst51Quest6_Note
Inst51Quest6_HORDE_Prequest = Inst51Quest6_Prequest
Inst51Quest6_HORDE_Folgequest = Inst51Quest6_Folgequest
--
Inst51Quest6name1_HORDE = Inst51Quest6name1



--------------- INST52 - Gruul's Lair (GL) ---------------

Inst52Story = "Gruul the Dragonkiller is, as his name implies, a famous dragon-slaying Gronn as well as the final boss of the raid dungeon Gruul's Lair in the Острогорье.\n\nHe drops the Tier 4 Leggings tokens.\n\nHe is the father of 7 Gronn, including Goc, Gorgrom the Dragon-Eater, Grulloc, Maggoc, and Durn the Hungerer.\n\nSummary of the fight: Rocks fall down. People die. "
Inst52Caption = "Логово Груула"
Inst52QAA = "1 Задание"
Inst52QAH = "1 Задание"

--Quest 1 Alliance
Inst52Quest1 = "1. Дубина Кардеша"
Inst52Quest1_Level = "70"
Inst52Quest1_Attain = "70"
Inst52Quest1_Aim = "Принесите перстень Земли и пылающий перстень Скартису Еретику в Узилища в Резервуар Кривого Клыка."
Inst52Quest1_Location = "Скартис Еретик  (Узилище; "..YELLOW.."Героическое [3]"..WHITE..")"
Inst52Quest1_Note = "Перстень Земли падает с Груула около "..YELLOW.."[2]"..WHITE.." и пылающий перстень падает с Ночной Погибели в "..YELLOW.."Каражан"..WHITE..".\n\nЭто задание нужно было выполнить, чтобы войти в Змеиное святилище, но больше не необходимо."
Inst52Quest1_Prequest = "Нет"
Inst52Quest1_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst52Quest1_HORDE = Inst52Quest1
Inst52Quest1_HORDE_Level = Inst52Quest1_Level
Inst52Quest1_HORDE_Attain = Inst52Quest1_Attain
Inst52Quest1_HORDE_Aim = Inst52Quest1_Aim
Inst52Quest1_HORDE_Location = Inst52Quest1_Location
Inst52Quest1_HORDE_Note = Inst52Quest1_Note
Inst52Quest1_HORDE_Prequest = Inst52Quest1_Prequest
Inst52Quest1_HORDE_Folgequest = Inst52Quest1_Folgequest
-- No Rewards for this quest



--------------- INST53 - Karazhan (Kara) ---------------

Inst53Story = "Обветшалая башня Каражана когда-то была домом одной из величайших сил, которую знал Азерот: волшебника Медива.\n\nС его смертью, ужасное проклятье пало на башню и окружающие земли.\n\nДухи дворян из близлежащего Темнолесья, как говорят очевидцы, гуляют по его залам, страдающие от участи страшнее смерти за свое любопытство.\n\nВ результате исследований Медива осталось множесво опасных духов, а также прзванные демонические сущности, призванные им для выполнения различных распоряжений.\n\nОднако, отважные или безмозглые все еще беспрестанно лезут в Каражан, соблазненные слухами о неописуемых тайнах и огромных сокровищах.\n\nСоберите группу из десяти доблестных героев, и наведайтесь в башню на Перевале Мертвого ветра - но осторожно, только те кто достиг 70 уровня отважатся войти."
Inst53Caption = "Каражан"
Inst53QAA = "15 Заданий"
Inst53QAH = "15 Заданий"

--Quest 1 Alliance
Inst53Quest1 = "1. Оценка ситуации"
Inst53Quest1_Level = "70"
Inst53Quest1_Attain = "68"
Inst53Quest1_Aim = "Найдите Корена в Каражане."
Inst53Quest1_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest1_Note = "Корен находится внутри Каражана, прямо за Аттуменом Охотником около "..YELLOW.."[6]"..WHITE.."."
Inst53Quest1_Prequest = "Колебания тайной магии -> Аметистовое Око"
Inst53Quest1_Folgequest = "Записи Кеанны"
Inst53Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst53Quest2 = "2. Записи Кеанны"
Inst53Quest2_Level = "70"
Inst53Quest2_Attain = "68"
Inst53Quest2_Aim = "Найдите Гостевые залы в Каражане, а в них – записи Кеанны, и доставьте их верховному магу Альтуру."
Inst53Quest2_Location = "Корен (Каражан; "..YELLOW.."[6]"..WHITE..")"
Inst53Quest2_Note = "Записи находятся во второй комнате в зале, ведущем к Благочестивой деве около "..YELLOW.."[10]"..WHITE..", на столе. Верховный маг Альтур находится около (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")."
Inst53Quest2_Prequest = "Оценка ситуации"
Inst53Quest2_Folgequest = "Присутствие демонов"
Inst53Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst53Quest3 = "3. Присутствие демонов"
Inst53Quest3_Level = "70"
Inst53Quest3_Attain = "68"
Inst53Quest3_Aim = "Верховный маг Альтур просит вас уничтожить демона на вершине башни Каражана."
Inst53Quest3_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest3_Note = "Принц Малчезар находится около "..YELLOW.."[26]"..WHITE.."."
Inst53Quest3_Prequest = "Записи Кеанны"
Inst53Quest3_Folgequest = "Новое направление"
Inst53Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst53Quest4 = "4. Новое направление"
Inst53Quest4_Level = "70"
Inst53Quest4_Attain = "68"
Inst53Quest4_Aim = "Поговорите с верховным магом Седриком на окраине Даларана."
Inst53Quest4_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest4_Note = "Верховный маг Седрик находится около (Альтеракские горы - Даларан; "..YELLOW.."15,54"..WHITE..")"
Inst53Quest4_Prequest = "Присутствие демонов"
Inst53Quest4_Folgequest = "Нет"
Inst53Quest4FQuest = "true"
--
Inst53Quest4name1 = "Violet Badge"

--Quest 5 Alliance
Inst53Quest5 = "5. Записи Медива"
Inst53Quest5_Level = "70"
Inst53Quest5_Attain = "70"
Inst53Quest5_Aim = "По поручению верховного мага Альтура на Перевале Мертвого Ветра войдите в Каражан и поговорите с Вравьеном."
Inst53Quest5_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest5_Note = "Требует уважительного отношения со стороны Аметистового Ока. Вравьен находится в Библиотеке стража позади Смотрителя около "..YELLOW.."[17]"..WHITE.."."
Inst53Quest5_Prequest = "Нет"
Inst53Quest5_Folgequest = "В хороших руках"
-- No Rewards for this quest

--Quest 6 Alliance
Inst53Quest6 = "6. В хороших руках"
Inst53Quest6_Level = "70"
Inst53Quest6_Attain = "70"
Inst53Quest6_Aim = "Поговорите с Градавом в Библиотеке стража в Каражане."
Inst53Quest6_Location = "Вравьен (Каражан; "..YELLOW.."[17]"..WHITE..")"
Inst53Quest6_Note = "Градав находится в той же комнате что и Вравьен около "..YELLOW.."[18]"..WHITE.."."
Inst53Quest6_Prequest = "Записи Медива"
Inst53Quest6_Folgequest = "Камсис"
Inst53Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst53Quest7 = "7. Камсис"
Inst53Quest7_Level = "70"
Inst53Quest7_Attain = "70"
Inst53Quest7_Aim = "Поговорите с Камсис в Библиотеке Стража в Каражане."
Inst53Quest7_Location = "Градав (Каражан; "..YELLOW.."[18]"..WHITE..")"
Inst53Quest7_Note = "Камсис находится в той же комнате что и Градав около "..YELLOW.."[19]"..WHITE.."."
Inst53Quest7_Prequest = "В хороших руках"
Inst53Quest7_Folgequest = "Тень Арана"
Inst53Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst53Quest8 = "8. Тень Арана"
Inst53Quest8_Level = "70"
Inst53Quest8_Attain = "70"
Inst53Quest8_Aim = "Достаньте дневник Медива и верните его Камсис в Библиотеку Стража в Каражане."
Inst53Quest8_Location = "Камсис (Каражан; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest8_Note = "Дневник падает с тени Арана около "..YELLOW.."[21]"..WHITE.."."
Inst53Quest8_Prequest = "Камсис"
Inst53Quest8_Folgequest = "Терраса Мастера"
Inst53Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst53Quest9 = "9. Терраса Мастера"
Inst53Quest9_Level = "70"
Inst53Quest9_Attain = "70"
Inst53Quest9_Aim = "Поднимитесь на террасу Мастера в Каражане и прочитайте дневник Медива. После этого возвращайтесь вместе с дневником к верховному магу Альтуру."
Inst53Quest9_Location = "Камсис (Каражан; "..YELLOW.."[19]"..WHITE..")"
Inst53Quest9_Note = "Верховный маг Альтур находится около (Перевал Мертвого ветра; "..YELLOW.."47,75"..WHITE.."). Никаких битв. Наслаждайтесь зрелищем."
Inst53Quest9_Prequest = "Тень Арана"
Inst53Quest9_Folgequest = "Тайны прошлого"
Inst53Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst53Quest10 = "10. Тайны прошлого"
Inst53Quest10_Level = "70"
Inst53Quest10_Attain = "70"
Inst53Quest10_Aim = "Верховный маг Альтур желает, чтобы вы нашли в горах к югу от Каражана на Перевале Мертвого Ветра фрагмент обугленной кости и доставили ему."
Inst53Quest10_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest10_Note = "Фрагмент обугленной кости расположен около "..YELLOW.."44,78"..WHITE.." на Перевале Мертвого ветра"
Inst53Quest10_Prequest = "Терраса Мастера"
Inst53Quest10_Folgequest = "Взаимовыручка"
Inst53Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst53Quest11 = "11. Взаимовыручка"
Inst53Quest11_Level = "70"
Inst53Quest11_Attain = "70"
Inst53Quest11_Aim = "Доставьте фрагмент обугленной кости Калинне Латред в Область 52 в Пустоверти."
Inst53Quest11_Location = "Верховный маг Альтур (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..")"
Inst53Quest11_Note = "Калинна Латред находится около (Пустоверть - Зона 52; "..YELLOW.."32,63"..WHITE..")."
Inst53Quest11_Prequest = "Тайны прошлого"
Inst53Quest11_Folgequest = "Требование Калинны"
Inst53Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst53Quest12 = "12. Требование Калинны"
Inst53Quest12_Level = "70"
Inst53Quest12_Attain = "70"
Inst53Quest12_Aim = "Калинна Латред требует отыскать и принести ей Фолиант Сумерек и Книгу Забытых Имен. Первой владеет главный чернокнижник Пустоклят, его можно найти в Разрушенных залах Цитадели Адского Пламени. Вторая принадлежит Темнопряду Ситу, который находится в Сетеккских залах в Аукиндоне."
Inst53Quest12_Location = "Калинна Латред (Пустоверть - Зона 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest12_Note = "Это задание требует от вас похода на героической сложности в Разрушенные залы и Сетеккские залы"
Inst53Quest12_Prequest = "Взаимовыручка"
Inst53Quest12_Folgequest = "Ночная Погибель"
Inst53Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst53Quest13 = "13. Ночная Погибель"
Inst53Quest13_Level = "70"
Inst53Quest13_Attain = "70"
Inst53Quest13_Aim = "Ступайте на террасу Мастера в Каражане и с помощью урны Калинны призовите Ночную Погибель. Извлеките из тела Ночной Погибели слабую чародейскую сущность и доставьте ее верховному магу Альтуру."
Inst53Quest13_Location = "Калинна Латред (Пустоверть - Зона 52; "..YELLOW.."32,63"..WHITE..")"
Inst53Quest13_Note = "Ночная Погибель призывается около "..YELLOW.."[15]"..WHITE..". Вернитесь к верховному магу Альтуру около (Перевал Мертвого ветра - Каражан; "..YELLOW.."47,75"..WHITE..") для завершения."
Inst53Quest13_Prequest = "Требование Калинны"
Inst53Quest13_Folgequest = "Нет"
Inst53Quest13FQuest = "true"
--
Inst53Quest13name1 = "Pulsing Amethyst"
Inst53Quest13name2 = "Soothing Amethyst"
Inst53Quest13name3 = "Infused Amethyst"

--Quest 14 Alliance
Inst53Quest14 = "14. Дубина Кардеша"
Inst53Quest14_Level = "70"
Inst53Quest14_Attain = "70"
Inst53Quest14_Aim = "Принесите перстень Земли и пылающий перстень Скартису Еретику в Узилища в Резервуар Кривого Клыка."
Inst53Quest14_Location = "Скартис Еретик  (Узилище; "..YELLOW.."Героическое [3]"..WHITE..")"
Inst53Quest14_Note = "Перстень Земли падает с Груула в "..YELLOW.."Логово Груула"..WHITE.." и пылающий перстень падает с Ночной погибели около "..YELLOW.."[15]"..WHITE..".\n\nЭто задание нужно было выполнить, чтобы войти в Змеиное святилище, но больше не необходимо."
Inst53Quest14_Prequest = "Нет"
Inst53Quest14_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 15 Alliance
Inst53Quest15 = "15. Тайная комната"
Inst53Quest15_Level = "70"
Inst53Quest15_Attain = "70"
Inst53Quest15_Aim = "Посланник Серебряного Рассвета просит вас обыскать комнату Тенриса Мутная Кровь, которая находится в квартале слуг Каражана. "
Inst53Quest15_Location = "Посланник из ордена Серебряного Рассвета (Столицы и Восточные Чумные земли - Light's Hope Chapel)"
Inst53Quest15_Note = "Это задание было доступно только во время вторжения Плети в конце октября - начале ноября 2008 года.\n\nДля прохождения квеста подберите документы, которые лежат за Принцем Тенрисом Мутная Кровь, который стоит в комнате выше Ловчего Аттумена ("..YELLOW.."[5]"..WHITE..")."
Inst53Quest15_Prequest = "Нет"
Inst53Quest15_Folgequest = "Нет"
--
Inst53Quest15name1 = "Monster Slayer's Kit"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst53Quest1_HORDE = Inst53Quest1
Inst53Quest1_HORDE_Level = Inst53Quest1_Level
Inst53Quest1_HORDE_Attain = Inst53Quest1_Attain
Inst53Quest1_HORDE_Aim = Inst53Quest1_Aim
Inst53Quest1_HORDE_Location = Inst53Quest1_Location
Inst53Quest1_HORDE_Note = Inst53Quest1_Note
Inst53Quest1_HORDE_Prequest = Inst53Quest1_Prequest
Inst53Quest1_HORDE_Folgequest = Inst53Quest1_Folgequest
Inst53Quest1PreQuest_HORDE = Inst53Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst53Quest2_HORDE = Inst53Quest2
Inst53Quest2_HORDE_Level = Inst53Quest2_Level
Inst53Quest2_HORDE_Attain = Inst53Quest2_Attain
Inst53Quest2_HORDE_Aim = Inst53Quest2_Aim
Inst53Quest2_HORDE_Location = Inst53Quest2_Location
Inst53Quest2_HORDE_Note = Inst53Quest2_Note
Inst53Quest2_HORDE_Prequest = Inst53Quest2_Prequest
Inst53Quest2_HORDE_Folgequest = Inst53Quest2_Folgequest
Inst53Quest2FQuest_HORDE = Inst53Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst53Quest3_HORDE = Inst53Quest3
Inst53Quest3_HORDE_Level = Inst53Quest3_Level
Inst53Quest3_HORDE_Attain = Inst53Quest3_Attain
Inst53Quest3_HORDE_Aim = Inst53Quest3_Aim
Inst53Quest3_HORDE_Location = Inst53Quest3_Location
Inst53Quest3_HORDE_Note = Inst53Quest3_Note
Inst53Quest3_HORDE_Prequest = Inst53Quest3_Prequest
Inst53Quest3_HORDE_Folgequest = Inst53Quest3_Folgequest
Inst53Quest3FQuest_HORDE = Inst53Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst53Quest4_HORDE = Inst53Quest4
Inst53Quest4_HORDE_Level = Inst53Quest4_Level
Inst53Quest4_HORDE_Attain = Inst53Quest4_Attain
Inst53Quest4_HORDE_Aim = Inst53Quest4_Aim
Inst53Quest4_HORDE_Location = Inst53Quest4_Location
Inst53Quest4_HORDE_Note = Inst53Quest4_Note
Inst53Quest4_HORDE_Prequest = Inst53Quest4_Prequest
Inst53Quest4_HORDE_Folgequest = Inst53Quest4_Folgequest
Inst53Quest4FQuest_HORDE = Inst53Quest4FQuest
--
Inst53Quest4name1_HORDE = Inst53Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst53Quest5_HORDE = Inst53Quest5
Inst53Quest5_HORDE_Level = Inst53Quest5_Level
Inst53Quest5_HORDE_Attain = Inst53Quest5_Attain
Inst53Quest5_HORDE_Aim = Inst53Quest5_Aim
Inst53Quest5_HORDE_Location = Inst53Quest5_Location
Inst53Quest5_HORDE_Note = Inst53Quest5_Note
Inst53Quest5_HORDE_Prequest = Inst53Quest5_Prequest
Inst53Quest5_HORDE_Folgequest = Inst53Quest5_Folgequest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst53Quest6_HORDE = Inst53Quest6
Inst53Quest6_HORDE_Level = Inst53Quest6_Level
Inst53Quest6_HORDE_Attain = Inst53Quest6_Attain
Inst53Quest6_HORDE_Aim = Inst53Quest6_Aim
Inst53Quest6_HORDE_Location = Inst53Quest6_Location
Inst53Quest6_HORDE_Note = Inst53Quest6_Note
Inst53Quest6_HORDE_Prequest = Inst53Quest6_Prequest
Inst53Quest6_HORDE_Folgequest = Inst53Quest6_Folgequest
Inst53Quest6FQuest_HORDE = Inst53Quest6FQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst53Quest7_HORDE = Inst53Quest7
Inst53Quest7_HORDE_Level = Inst53Quest7_Level
Inst53Quest7_HORDE_Attain = Inst53Quest7_Attain
Inst53Quest7_HORDE_Aim = Inst53Quest7_Aim
Inst53Quest7_HORDE_Location = Inst53Quest7_Location
Inst53Quest7_HORDE_Note = Inst53Quest7_Note
Inst53Quest7_HORDE_Prequest = Inst53Quest7_Prequest
Inst53Quest7_HORDE_Folgequest = Inst53Quest7_Folgequest
Inst53Quest7FQuest_HORDE = Inst53Quest7FQuest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst53Quest8_HORDE = Inst53Quest8
Inst53Quest8_HORDE_Level = Inst53Quest8_Level
Inst53Quest8_HORDE_Attain = Inst53Quest8_Attain
Inst53Quest8_HORDE_Aim = Inst53Quest8_Aim
Inst53Quest8_HORDE_Location = Inst53Quest8_Location
Inst53Quest8_HORDE_Note = Inst53Quest8_Note
Inst53Quest8_HORDE_Prequest = Inst53Quest8_Prequest
Inst53Quest8_HORDE_Folgequest = Inst53Quest8_Folgequest
Inst53Quest8FQuest_HORDE = Inst53Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst53Quest9_HORDE = Inst53Quest9
Inst53Quest9_HORDE_Level = Inst53Quest9_Level
Inst53Quest9_HORDE_Attain = Inst53Quest9_Attain
Inst53Quest9_HORDE_Aim = Inst53Quest9_Aim
Inst53Quest9_HORDE_Location = Inst53Quest9_Location
Inst53Quest9_HORDE_Note = Inst53Quest9_Note
Inst53Quest9_HORDE_Prequest = Inst53Quest9_Prequest
Inst53Quest9_HORDE_Folgequest = Inst53Quest9_Folgequest
Inst53Quest9FQuest_HORDE = Inst53Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst53Quest10_HORDE = Inst53Quest10
Inst53Quest10_HORDE_Level = Inst53Quest10_Level
Inst53Quest10_HORDE_Attain = Inst53Quest10_Attain
Inst53Quest10_HORDE_Aim = Inst53Quest10_Aim
Inst53Quest10_HORDE_Location = Inst53Quest10_Location
Inst53Quest10_HORDE_Note = Inst53Quest10_Note
Inst53Quest10_HORDE_Prequest = Inst53Quest10_Prequest
Inst53Quest10_HORDE_Folgequest = Inst53Quest10_Folgequest
Inst53Quest10FQuest_HORDE = Inst53Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst53Quest11_HORDE = Inst53Quest11
Inst53Quest11_HORDE_Level = Inst53Quest11_Level
Inst53Quest11_HORDE_Attain = Inst53Quest11_Attain
Inst53Quest11_HORDE_Aim = Inst53Quest11_Aim
Inst53Quest11_HORDE_Location = Inst53Quest11_Location
Inst53Quest11_HORDE_Note = Inst53Quest11_Note
Inst53Quest11_HORDE_Prequest = Inst53Quest11_Prequest
Inst53Quest11_HORDE_Folgequest = Inst53Quest11_Folgequest
Inst53Quest11FQuest_HORDE = Inst53Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst53Quest12_HORDE = Inst53Quest12
Inst53Quest12_HORDE_Level = Inst53Quest12_Level
Inst53Quest12_HORDE_Attain = Inst53Quest12_Attain
Inst53Quest12_HORDE_Aim = Inst53Quest12_Aim
Inst53Quest12_HORDE_Location = Inst53Quest12_Location
Inst53Quest12_HORDE_Note = Inst53Quest12_Note
Inst53Quest12_HORDE_Prequest = Inst53Quest12_Prequest
Inst53Quest12_HORDE_Folgequest = Inst53Quest12_Folgequest
Inst53Quest12FQuest_HORDE = Inst53Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst53Quest13_HORDE = Inst53Quest13
Inst53Quest13_HORDE_Level = Inst53Quest13_Level
Inst53Quest13_HORDE_Attain = Inst53Quest13_Attain
Inst53Quest13_HORDE_Aim = Inst53Quest13_Aim
Inst53Quest13_HORDE_Location = Inst53Quest13_Location
Inst53Quest13_HORDE_Note = Inst53Quest13_Note
Inst53Quest13_HORDE_Prequest = Inst53Quest13_Prequest
Inst53Quest13_HORDE_Folgequest = Inst53Quest13_Folgequest
Inst53Quest13FQuest_HORDE = Inst53Quest13FQuest
--
Inst53Quest13name1_HORDE = Inst53Quest13name1
Inst53Quest13name2_HORDE = Inst53Quest13name2
Inst53Quest13name3_HORDE = Inst53Quest13name3

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst53Quest14_HORDE = Inst53Quest14
Inst53Quest14_HORDE_Level = Inst53Quest14_Level
Inst53Quest14_HORDE_Attain = Inst53Quest14_Attain
Inst53Quest14_HORDE_Aim = Inst53Quest14_Aim
Inst53Quest14_HORDE_Location = Inst53Quest14_Location
Inst53Quest14_HORDE_Note = Inst53Quest14_Note
Inst53Quest14_HORDE_Prequest = Inst53Quest14_Prequest
Inst53Quest14_HORDE_Folgequest = Inst53Quest14_Folgequest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst53Quest15_HORDE = Inst53Quest15
Inst53Quest15_HORDE_Level = Inst53Quest15_Level
Inst53Quest15_HORDE_Attain = Inst53Quest15_Attain
Inst53Quest15_HORDE_Aim = Inst53Quest15_Aim
Inst53Quest15_HORDE_Location = Inst53Quest15_Location
Inst53Quest15_HORDE_Note = Inst53Quest15_Note
Inst53Quest15_HORDE_Prequest = Inst53Quest15_Prequest
Inst53Quest15_HORDE_Folgequest = Inst53Quest15_Folgequest
--
Inst53Quest15name1_HORDE = Inst53Quest15name1



--------------- INST54 - TK: Arcatraz (Arc) ---------------

Inst54Story = "Tempest Keep is a former naaru fortress in the Пустоверть in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Экзодар, now in the world of Azeroth as the Draenei capital.\n\nThe Arcatraz is the third wing of the Tempest Keep instance.\n\nThe Arcatraz is accessible either through a quest chain for the key that requires you to complete both Mechanar and Botanica, that begins with a long quest chain called (A Heap of Ethereals) from Ловчий Пустоты Кай'джи in Зона 52, or be picked by a lvl 70 Разбойник (with 350 LP).\n\nOnly one member of your group must have the key. The entrance portal is high above the other Tempest Keep instances.\n\nOne full run yields about 1750 reputation with the Sha'tar."
Inst54Caption = "КБ: Аркатрац"
Inst54QAA = "6 Заданий"
Inst54QAH = "6 Заданий"

--Quest 1 Alliance
Inst54Quest1 = "1. Вестник Рока"
Inst54Quest1_Level = "70"
Inst54Quest1_Attain = "70"
Inst54Quest1_Aim = "Отправьтесь в район Аркатрац Крепости Бурь и убейте там предвестника Скайрисса, после чего вернитесь к А'далу на Террасу Света в Шаттрат."
Inst54Quest1_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest1_Note = "Эта цепочка заданий начинается в Пустоверти у ловчего Пустоты Кай'джи находящегося в (Пустоверть - Зона 52; "..YELLOW.."32,64"..WHITE..")."
Inst54Quest1_Prequest = "Астральный налетчик Несаад -> Как проникнуть в Аркатрац"
Inst54Quest1_Folgequest = "Нет"
Inst54Quest1PreQuest = "true"
--
Inst54Quest1name1 = "Potent Sha'tari Pendant"
Inst54Quest1name2 = "А'дал's Recovery Necklace"
Inst54Quest1name3 = "Шаттрат Choker of Power"

--Quest 2 Alliance
Inst54Quest2 = "2. Провидец Адало"
Inst54Quest2_Level = "70"
Inst54Quest2_Attain = "68"
Inst54Quest2_Aim = "Найдите провидца Адало в в Аркатраце в Крепости Бурь."
Inst54Quest2_Location = "Акама (Долина Призрачной луны - Клеть Стражницы; "..YELLOW.."58,48"..WHITE..")"
Inst54Quest2_Note = "Провидец Адало находится около "..YELLOW.."[5]"..WHITE..", прямо перед комнатой с финальным боссом.\n\nЭто задание часть линейки для подготовки к Черному Храму, которая начинается у Анахорета Кейлы (Долина Призрачной луны - Алтарь Ша'тар; "..YELLOW.."62,38"..WHITE..") для Алдоров и Чародея Тэлиса (Долина Призрачной луны - Святилище Звезд; "..YELLOW.."56,59"..WHITE..")для Провидцев."
Inst54Quest2_Prequest = "Таблички Баа'ри -> Акама"
Inst54Quest2_Folgequest = "Таинственное знамение"
Inst54Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3. Испытание наару: упорство (Героическое)"
Inst54Quest3_Level = "70"
Inst54Quest3_Attain = "70"
Inst54Quest3_Aim = "А'дал из Шаттрата просит спасти Милхауса Манашторма из Аркатраца, что в Крепости Бурь."
Inst54Quest3_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest3_Note = "Это задание выполняется в режиме героической сложности. Милхаус Манашторм находится в комнате с начальником тюрьмы Мелличаром около "..YELLOW.."[6]"..WHITE..".\n\nЭто задание нужно было выполнить, чтобы войти в Крепость Бурь: Око, но больше не необходимо."
Inst54Quest3_Prequest = "Нет"
Inst54Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. Второй и третий фрагменты"
Inst54Quest4_Level = "70"
Inst54Quest4_Attain = "68"
Inst54Quest4_Aim = "Добудьте второй фрагмент ключа из волшебного контейнера в Резервуаре Кривого Клыка, а третий фрагмент ключа – из волшебного контейнера в Крепости Бурь, после чего вернитесь к Кадгару в Шаттрат."
Inst54Quest4_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst54Quest4_Note = "Часть линейки для подготовки к Каражану. Волшебный контейнер находится около "..YELLOW.."[2]"..WHITE..". При открытии появится элементаль, которого нужно убить, чтобыполучить фрагмент. Второй фрагмент ключа находится в Паровом подземелье."
Inst54Quest4_Prequest = "Вход в Каражан ("..YELLOW.."Аук: Темный лабиринт"..WHITE..")"
Inst54Quest4_Folgequest = "Разрешение учителя ("..YELLOW.."ПВ: Черные топи"..WHITE..")"
Inst54Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst54Quest5 = "5. Заказ: Свиток Скайрисса (Героическое (ежедн.))"
Inst54Quest5_Level = "70"
Inst54Quest5_Attain = "70"
Inst54Quest5_Aim = "Торговец ветром Зерим просит вас добыть свиток Скайрисса. Доставьте его ему в Нижний Город Шаттрата и получите награду."
Inst54Quest5_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest5_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nПредвестник Скайрисс находится около "..YELLOW.."[6]"..WHITE.."."
Inst54Quest5_Prequest = "Нет"
Inst54Quest5_Folgequest = "Нет"
--
Inst54Quest5name1 = "Знак справедливости"

--Quest 6 Alliance
Inst54Quest6 = "6. Разыскиваются: часовые Аркатраца (ежедн.)"
Inst54Quest6_Level = "70"
Inst54Quest6_Attain = "70"
Inst54Quest6_Aim = "Ловчий Пустоты Ма'дуун хочет, чтобы вы навсегда деактивировали 5 часовых Аркатраца. Вернитесь к нему в Нижний Город Шаттрата, когда выполните задание, чтобы забрать награду."
Inst54Quest6_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst54Quest6_Note = "Это ежедневное задание."
Inst54Quest6_Prequest = "Нет"
Inst54Quest6_Folgequest = "Нет"
--
Inst54Quest6name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst54Quest1_HORDE = Inst54Quest1
Inst54Quest1_HORDE_Level = Inst54Quest1_Level
Inst54Quest1_HORDE_Attain = Inst54Quest1_Attain
Inst54Quest1_HORDE_Aim = Inst54Quest1_Aim
Inst54Quest1_HORDE_Location = Inst54Quest1_Location
Inst54Quest1_HORDE_Note = Inst54Quest1_Note
Inst54Quest1_HORDE_Prequest = Inst54Quest1_Prequest
Inst54Quest1_HORDE_Folgequest = Inst54Quest1_Folgequest
Inst54Quest1PreQuest_HORDE = Inst54Quest1PreQuest
--
Inst54Quest1name1_HORDE = Inst54Quest1name1
Inst54Quest1name2_HORDE = Inst54Quest1name2
Inst54Quest1name3_HORDE = Inst54Quest1name3

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst54Quest2_HORDE = Inst54Quest2
Inst54Quest2_HORDE_Level = Inst54Quest2_Level
Inst54Quest2_HORDE_Attain = Inst54Quest2_Attain
Inst54Quest2_HORDE_Aim = Inst54Quest2_Aim
Inst54Quest2_HORDE_Location = Inst54Quest2_Location
Inst54Quest2_HORDE_Note = Inst54Quest2_Note
Inst54Quest2_HORDE_Prequest = Inst54Quest2_Prequest
Inst54Quest2_HORDE_Folgequest = Inst54Quest2_Folgequest
Inst54Quest2PreQuest_HORDE = Inst54Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst54Quest3_HORDE = Inst54Quest3
Inst54Quest3_HORDE_Level = Inst54Quest3_Level
Inst54Quest3_HORDE_Attain = Inst54Quest3_Attain
Inst54Quest3_HORDE_Aim = Inst54Quest3_Aim
Inst54Quest3_HORDE_Location = Inst54Quest3_Location
Inst54Quest3_HORDE_Note = Inst54Quest3_Note
Inst54Quest3_HORDE_Prequest = Inst54Quest3_Prequest
Inst54Quest3_HORDE_Folgequest = Inst54Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst54Quest4_HORDE = Inst54Quest4
Inst54Quest4_HORDE_Level = Inst54Quest4_Level
Inst54Quest4_HORDE_Attain = Inst54Quest4_Attain
Inst54Quest4_HORDE_Aim = Inst54Quest4_Aim
Inst54Quest4_HORDE_Location = Inst54Quest4_Location
Inst54Quest4_HORDE_Note = Inst54Quest4_Note
Inst54Quest4_HORDE_Prequest = Inst54Quest4_Prequest
Inst54Quest4_HORDE_Folgequest = Inst54Quest4_Folgequest
Inst54Quest4PreQuest_HORDE = Inst54Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst54Quest5_HORDE = Inst54Quest5
Inst54Quest5_HORDE_Level = Inst54Quest5_Level
Inst54Quest5_HORDE_Attain = Inst54Quest5_Attain
Inst54Quest5_HORDE_Aim = Inst54Quest5_Aim
Inst54Quest5_HORDE_Location = Inst54Quest5_Location
Inst54Quest5_HORDE_Note = Inst54Quest5_Note
Inst54Quest5_HORDE_Prequest = Inst54Quest5_Prequest
Inst54Quest5_HORDE_Folgequest = Inst54Quest5_Folgequest
--
Inst54Quest5name1_HORDE = Inst54Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst54Quest6_HORDE = Inst54Quest6
Inst54Quest6_HORDE_Level = Inst54Quest6_Level
Inst54Quest6_HORDE_Attain = Inst54Quest6_Attain
Inst54Quest6_HORDE_Aim = Inst54Quest6_Aim
Inst54Quest6_HORDE_Location = Inst54Quest6_Location
Inst54Quest6_HORDE_Note = Inst54Quest6_Note
Inst54Quest6_HORDE_Prequest = Inst54Quest6_Prequest
Inst54Quest6_HORDE_Folgequest = Inst54Quest6_Folgequest
--
Inst54Quest6name1_HORDE = Inst54Quest6name1



--------------- INST55 - TK: Botanica (Bot) ---------------

Inst55Story = "Tempest Keep is a former naaru fortress in the Пустоверть in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Экзодар, now in the world of Azeroth as the Draenei capital.\n\nThe Botanica is the second wing of the Tempest Keep instance located directly north of the main palace (The blue crystal building).\n\nThis is also the place of Kael'thas commander: Commander Sarannis."
Inst55Caption = "КБ: Ботаника"
Inst55QAA = "5 Заданий"
Inst55QAH = "5 Заданий"

--Quest 1 Alliance
Inst55Quest1 = "1. Как проникнуть в Аркатрац"
Inst55Quest1_Level = "70"
Inst55Quest1_Attain = "67"
Inst55Quest1_Aim = "Принесите А'далу верхний и нижний обломок ключа Аркатраца, чтобы он собрал из них целый ключ."
Inst55Quest1_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst55Quest1_Note = "Нижний оломок падает с Узлодревня около "..YELLOW.."[5]"..WHITE..". Верхний обломок Падает в Механаре."
Inst55Quest1_Prequest = "Астральный налетчик Несаад -> Специальный груз в город Шаттрат"
Inst55Quest1_Folgequest = "Вестник Рока ("..YELLOW.."КБ: Аркатрац"..WHITE..")"
Inst55Quest1PreQuest = "true"
--
Inst55Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst55Quest1name2 = "A'dal's Gift"
Inst55Quest1name3 = "Naaru Belt of Precision"
Inst55Quest1name4 = "Shattrath's Champion Belt"
Inst55Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst55Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst55Quest2 = "2. Захват краеугольного камня"
Inst55Quest2_Level = "70"
Inst55Quest2_Attain = "67"
Inst55Quest2_Aim = "Проникните в Ботанику Крепости Бурь и заберите Ключ-камень у командира Сараннис. Отнесите Ключ-камень верховному магу Варготу в Сиреневую башню."
Inst55Quest2_Location = "Верховный маг Варгот (Пустоверть - Деревня Кирин'Вар; "..YELLOW.."58,86"..WHITE..")"
Inst55Quest2_Note = "Командир Сараннис находится около "..YELLOW.."[1]"..WHITE..". Ключ-камень не падает на героической сложности."
Inst55Quest2_Prequest = "Найти Хранителя Ключей"
Inst55Quest2_Folgequest = "Нет"
Inst55Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst55Quest3 = "3. Мастер зелий (Алхимия)"
Inst55Quest3_Level = "70"
Inst55Quest3_Attain = "68"
Inst55Quest3_Aim = "Отправляйтесь в Ботанику в Крепости Бурь и добудьте у верховного ботаника Фрейвина 'Полевой справочник ботаника'. Принесите его Лауранне Тар'вел вместе с 5 отменными лечебными зельями, 5 отменными зельями маны и 5 хорошими зельями спокойного сна."
Inst55Quest3_Location = "Лауранна Тар'вел (Зангартопь - Ценарионский оплот; "..YELLOW.."80,64"..WHITE..")"
Inst55Quest3_Note = "Задание для алхимиков. Верховный ботаник Фрейвин находится около "..YELLOW.."[2]"..WHITE.."."
Inst55Quest3_Prequest = "Мастер зелий"
Inst55Quest3_Folgequest = "Нет"
Inst55Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst55Quest4 = "4. Заказ: Отросток Узлодревня (Героическое (ежедн.))"
Inst55Quest4_Level = "70"
Inst55Quest4_Attain = "70"
Inst55Quest4_Aim = "Торговец ветром Зерим просит вас добыть отросток Узлодревня. Доставьте его ему в Нижний Город Шаттрата и получите награду."
Inst55Quest4_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest4_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nУзлодревень находится около "..YELLOW.."[5]"..WHITE.."."
Inst55Quest4_Prequest = "Нет"
Inst55Quest4_Folgequest = "Нет"
--
Inst55Quest4name1 = "Знак справедливости"

--Quest 5 Alliance
Inst55Quest5 = "5. Разыскиваются: солнцеловы-чаротворцы (ежедн.)"
Inst55Quest5_Level = "70"
Inst55Quest5_Attain = "70"
Inst55Quest5_Aim = "Ловчий Пустоты Ма'дуун хочет, чтобы вы убили 5 солнцеловов-чаротворцев. Вернитесь к нему в Нижний Город Шаттрата, когда перебьете их, чтобы забрать награду."
Inst55Quest5_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst55Quest5_Note = "Это ежедневное задание."
Inst55Quest5_Prequest = "Нет"
Inst55Quest5_Folgequest = "Нет"
--
Inst55Quest5name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst55Quest1_HORDE = Inst55Quest1
Inst55Quest1_HORDE_Level = Inst55Quest1_Level
Inst55Quest1_HORDE_Attain = Inst55Quest1_Attain
Inst55Quest1_HORDE_Aim = Inst55Quest1_Aim
Inst55Quest1_HORDE_Location = Inst55Quest1_Location
Inst55Quest1_HORDE_Note = Inst55Quest1_Note
Inst55Quest1_HORDE_Prequest = Inst55Quest1_Prequest
Inst55Quest1_HORDE_Folgequest = Inst55Quest1_Folgequest
Inst55Quest1PreQuest_HORDE = Inst55Quest1PreQuest
--
Inst55Quest1name1_HORDE = Inst55Quest1name1
Inst55Quest1name2_HORDE = Inst55Quest1name2
Inst55Quest1name3_HORDE = Inst55Quest1name3
Inst55Quest1name4_HORDE = Inst55Quest1name4
Inst55Quest1name5_HORDE = Inst55Quest1name5
Inst55Quest1name6_HORDE = Inst55Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst55Quest2_HORDE = Inst55Quest2
Inst55Quest2_HORDE_Level = Inst55Quest2_Level
Inst55Quest2_HORDE_Attain = Inst55Quest2_Attain
Inst55Quest2_HORDE_Aim = Inst55Quest2_Aim
Inst55Quest2_HORDE_Location = Inst55Quest2_Location
Inst55Quest2_HORDE_Note = Inst55Quest2_Note
Inst55Quest2_HORDE_Prequest = Inst55Quest2_Prequest
Inst55Quest2_HORDE_Folgequest = Inst55Quest2_Folgequest
Inst55Quest2PreQuest_HORDE = Inst55Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst55Quest3_HORDE = Inst55Quest3
Inst55Quest3_HORDE_Level = Inst55Quest3_Level
Inst55Quest3_HORDE_Attain = Inst55Quest3_Attain
Inst55Quest3_HORDE_Aim = Inst55Quest3_Aim
Inst55Quest3_HORDE_Location = Inst55Quest3_Location
Inst55Quest3_HORDE_Note = Inst55Quest3_Note
Inst55Quest3_HORDE_Prequest = Inst55Quest3_Prequest
Inst55Quest3_HORDE_Folgequest = Inst55Quest3_Folgequest
Inst55Quest3PreQuest_HORDE = Inst55Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst55Quest4_HORDE = Inst55Quest4
Inst55Quest4_HORDE_Level = Inst55Quest4_Level
Inst55Quest4_HORDE_Attain = Inst55Quest4_Attain
Inst55Quest4_HORDE_Aim = Inst55Quest4_Aim
Inst55Quest4_HORDE_Location = Inst55Quest4_Location
Inst55Quest4_HORDE_Note = Inst55Quest4_Note
Inst55Quest4_HORDE_Prequest = Inst55Quest4_Prequest
Inst55Quest4_HORDE_Folgequest = Inst55Quest4_Folgequest
--
Inst55Quest4name1_HORDE = Inst55Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst55Quest5_HORDE = Inst55Quest5
Inst55Quest5_HORDE_Level = Inst55Quest5_Level
Inst55Quest5_HORDE_Attain = Inst55Quest5_Attain
Inst55Quest5_HORDE_Aim = Inst55Quest5_Aim
Inst55Quest5_HORDE_Location = Inst55Quest5_Location
Inst55Quest5_HORDE_Note = Inst55Quest5_Note
Inst55Quest5_HORDE_Prequest = Inst55Quest5_Prequest
Inst55Quest5_HORDE_Folgequest = Inst55Quest5_Folgequest
--
Inst55Quest5name1_HORDE = Inst55Quest5name1



--------------- INST56 - TK: Mechanar (Mech) ---------------

Inst56Story = "Tempest Keep is a former naaru fortress in the Пустоверть in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Экзодар, now in the world of Azeroth as the Draenei capital.\n\nThe Mechanar is the first wing of the Tempest Keep instance.\n\nThis is the purple crystal building south of the main palace.\n\nRecommended level is 70. One full run yields about 1500 reputation with the Sha'tar."
Inst56Caption = "КБ: Механар"
Inst56QAA = "4 Задания"
Inst56QAH = "4 Задания"

--Quest 1 Alliance
Inst56Quest1 = "1. Как проникнуть в Аркатрац"
Inst56Quest1_Level = "70"
Inst56Quest1_Attain = "67"
Inst56Quest1_Aim = "Принесите А'далу верхний и нижний обломок ключа Аркатраца, чтобы он собрал из них целый ключ."
Inst56Quest1_Location = "А'дал (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")"
Inst56Quest1_Note = "Верхний обломок падает с Паталеона Вычислителя около "..YELLOW.."[5]"..WHITE..". Нижний обломок падает в Ботанике."
Inst56Quest1_Prequest = "Астральный налетчик Несаад -> Специальный груз в город Шаттрат"
Inst56Quest1_Folgequest = "Вестник Рока ("..YELLOW.."КБ: Аркатрац"..WHITE..")"
Inst56Quest1PreQuest = "true"
--
Inst56Quest1name1 = "Sha'tari Anchorite's Cloak"
Inst56Quest1name2 = "A'dal's Gift"
Inst56Quest1name3 = "Naaru Belt of Precision"
Inst56Quest1name4 = "Shattrath's Champion Belt"
Inst56Quest1name5 = "Sha'tari Vindicator's Waistguard"
Inst56Quest1name6 = "Key to the Arcatraz"

--Quest 2 Alliance
Inst56Quest2 = "2. Новинка из Механара"
Inst56Quest2_Level = "69"
Inst56Quest2_Attain = "67"
Inst56Quest2_Aim = "Принесите переполненный зарядом контейнер с маной Давиду Вейну в Приют Уэйна."
Inst56Quest2_Location = "Давид Вейн (Лес Тероккар - Приют Уэйна; "..YELLOW.."78,39"..WHITE..")."
Inst56Quest2_Note = "Контейнер находится перед Механо-лордом Конденсароном около "..YELLOW.."[3]"..WHITE.." в ящике у стены.\n\nВыполнение задания наряду с Демонический словарь ("..YELLOW.."Аук: Темный лабиринт"..WHITE..") откроет 2 новых задания у Давида Вейна.\n\nЭто задание не выполняется на героической сложности."
Inst56Quest2_Prequest = "Дополнительные материалы"
Inst56Quest2_Folgequest = "Нет"
Inst56Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. Заказ: Проектор Паталеона (Героическое (ежедн.))"
Inst56Quest3_Level = "70"
Inst56Quest3_Attain = "70"
Inst56Quest3_Aim = "Торговец ветром Зерим просит вас добыть проектор Паталеона. Доставьте его ему в Нижний Город Шаттрата и получите награду."
Inst56Quest3_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest3_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nПаталеон Вычислитель находится около "..YELLOW.."[5]"..WHITE.."."
Inst56Quest3_Prequest = "Нет"
Inst56Quest3_Folgequest = "Нет"
--
Inst56Quest3name1 = "Знак справедливости"

--Quest 4 Alliance
Inst56Quest4 = "4. Разыскиваются: разрушители Бурегорна (ежедн.)"
Inst56Quest4_Level = "70"
Inst56Quest4_Attain = "70"
Inst56Quest4_Aim = "Ловчий Пустоты Ма'дуун хочет, чтобы вы уничтожили 5 разрушителей Бурегорна. Вернитесь к нему в Нижний Город Шаттрата, когда перебьете их, чтобы забрать награду."
Inst56Quest4_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst56Quest4_Note = "Это ежедневное задание."
Inst56Quest4_Prequest = "Нет"
Inst56Quest4_Folgequest = "Нет"
--
Inst56Quest4name1 = "Ethereum Prison Key"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst56Quest1_HORDE = Inst56Quest1
Inst56Quest1_HORDE_Level = Inst56Quest1_Level
Inst56Quest1_HORDE_Attain = Inst56Quest1_Attain
Inst56Quest1_HORDE_Aim = Inst56Quest1_Aim
Inst56Quest1_HORDE_Location = Inst56Quest1_Location
Inst56Quest1_HORDE_Note = Inst56Quest1_Note
Inst56Quest1_HORDE_Prequest = Inst56Quest1_Prequest
Inst56Quest1_HORDE_Folgequest = Inst56Quest1_Folgequest
Inst56Quest1PreQuest_HORDE = Inst56Quest1PreQuest
--
Inst56Quest1name1_HORDE = Inst56Quest1name1
Inst56Quest1name2_HORDE = Inst56Quest1name2
Inst56Quest1name3_HORDE = Inst56Quest1name3
Inst56Quest1name4_HORDE = Inst56Quest1name4
Inst56Quest1name5_HORDE = Inst56Quest1name5
Inst56Quest1name6_HORDE = Inst56Quest1name6

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst56Quest2_HORDE = Inst56Quest2
Inst56Quest2_HORDE_Level = Inst56Quest2_Level
Inst56Quest2_HORDE_Attain = Inst56Quest2_Attain
Inst56Quest2_HORDE_Aim = Inst56Quest2_Aim
Inst56Quest2_HORDE_Location = Inst56Quest2_Location
Inst56Quest2_HORDE_Note = Inst56Quest2_Note
Inst56Quest2_HORDE_Prequest = Inst56Quest2_Prequest
Inst56Quest2_HORDE_Folgequest = Inst56Quest2_Folgequest
Inst56Quest2PreQuest_HORDE = Inst56Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst56Quest3_HORDE = Inst56Quest3
Inst56Quest3_HORDE_Level = Inst56Quest3_Level
Inst56Quest3_HORDE_Attain = Inst56Quest3_Attain
Inst56Quest3_HORDE_Aim = Inst56Quest3_Aim
Inst56Quest3_HORDE_Location = Inst56Quest3_Location
Inst56Quest3_HORDE_Note = Inst56Quest3_Note
Inst56Quest3_HORDE_Prequest = Inst56Quest3_Prequest
Inst56Quest3_HORDE_Folgequest = Inst56Quest3_Folgequest
--
Inst56Quest3name1_HORDE = Inst56Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst56Quest4_HORDE = Inst56Quest4
Inst56Quest4_HORDE_Level = Inst56Quest4_Level
Inst56Quest4_HORDE_Attain = Inst56Quest4_Attain
Inst56Quest4_HORDE_Aim = Inst56Quest4_Aim
Inst56Quest4_HORDE_Location = Inst56Quest4_Location
Inst56Quest4_HORDE_Note = Inst56Quest4_Note
Inst56Quest4_HORDE_Prequest = Inst56Quest4_Prequest
Inst56Quest4_HORDE_Folgequest = Inst56Quest4_Folgequest
--
Inst56Quest4name1_HORDE = Inst56Quest4name1



--------------- INST61 - TK: The Eye ---------------

Inst61Story = "Tempest Keep is a former naaru fortress in the Пустоверть in Outland.\n\nThis crystaline fortress is now ruled by Kael'thas Sunstrider, the lord of the blood elves, and dominated by scores of his brethren.\n\nThe structure is divided into three wings - satellites of the gigantic structure - with the fourth wing, the Экзодар, now in the world of Azeroth as the Draenei capital.\n\nThe Mechanar is the first wing of the Tempest Keep instance.\n\nThis is the purple crystal building south of the main palace.\n\nRecommended level is 70. One full run yields about 1500 reputation with the Sha'tar."
Inst61Caption = "КБ: Око"
Inst61QAA = "3 Задания"
Inst61QAH = "3 Задания"

--Quest 1 Alliance
Inst61Quest1 = "1. Коварство Пеплоустов"
Inst61Quest1_Level = "70"
Inst61Quest1_Attain = "70"
Inst61Quest1_Aim = "Отправляйтесь в Крепость Бурь и, облачившись в клобук Пеплоустов, убейте Ал'ара. Затем возвращайтесь к Акаме в Долину Призрачной Луны."
Inst61Quest1_Location = "Акама (Долина Призрачной луны - Клеть Стражницы; "..YELLOW.."58,48"..WHITE..")"
Inst61Quest1_Note = "Это часть линейки для подготовки к Черному Храму."
Inst61Quest1_Prequest = "Тайна под угрозой ("..YELLOW.."Змеиное святилище"..WHITE..")"
Inst61Quest1_Folgequest = "Артефакт из прошлого ("..YELLOW.."Битва на вершине Хиджала"..WHITE..")"
Inst61Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. Кель'тас и зеленеющая сфера"
Inst61Quest2_Level = "70"
Inst61Quest2_Attain = "70"
Inst61Quest2_Aim = "Отнесите зеленеющую сферу А'далу в Шаттрат."
Inst61Quest2_Location = "Зеленеющая сфера (падает с Кель'таса Солнечного Скитальца около "..YELLOW.."[4]"..WHITE..")"
Inst61Quest2_Note = "А'дал находится около (Шаттрат - Терраса Света; "..YELLOW.."53,43"..WHITE..")."
Inst61Quest2_Prequest = "Нет"
Inst61Quest2_Folgequest = "Нет"
-- 
Inst61Quest2name1 = "The Sun King's Talisman"
Inst61Quest2name2 = "The Darkener's Grasp"
Inst61Quest2name3 = "Lord Sanguinar's Claim"
Inst61Quest2name4 = "Telonicus's Pendant of Mayhem"

--Quest 3 Alliance
Inst61Quest3 = "3. Сосуды Вечности"
Inst61Quest3_Level = "70"
Inst61Quest3_Attain = "70"
Inst61Quest3_Aim = "Принесите Соридорми в Пещеры Времени фиал Леди Вайш из Резервуара Кривого Клыка и фиал Кель'таса из Крепости Бурь."
Inst61Quest3_Location = "Соридорми (Танарис - Пещеры времени; "..YELLOW.."58,57"..WHITE.."). НИП бродит по пещере."
Inst61Quest3_Note = "Это задание нужно для подготовки к Битве на вершине Хиджала. Кель'тас Солнечный Скиталец находится около "..YELLOW.."[4]"..WHITE.."."
Inst61Quest3_Prequest = "Нет"
Inst61Quest3_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst61Quest1_HORDE = Inst61Quest1
Inst61Quest1_HORDE_Level = Inst61Quest1_Level
Inst61Quest1_HORDE_Attain = Inst61Quest1_Attain
Inst61Quest1_HORDE_Aim = Inst61Quest1_Aim
Inst61Quest1_HORDE_Location = Inst61Quest1_Location
Inst61Quest1_HORDE_Note = Inst61Quest1_Note
Inst61Quest1_HORDE_Prequest = Inst61Quest1_Prequest
Inst61Quest1_HORDE_Folgequest = Inst61Quest1_Folgequest
Inst61Quest1PreQuest_HORDE = Inst61Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst61Quest2_HORDE = Inst61Quest2
Inst61Quest2_HORDE_Level = Inst61Quest2_Level
Inst61Quest2_HORDE_Attain = Inst61Quest2_Attain
Inst61Quest2_HORDE_Aim = Inst61Quest2_Aim
Inst61Quest2_HORDE_Location = Inst61Quest2_Location
Inst61Quest2_HORDE_Note = Inst61Quest2_Note
Inst61Quest2_HORDE_Prequest = Inst61Quest2_Prequest
Inst61Quest2_HORDE_Folgequest = Inst61Quest2_Folgequest
--
Inst61Quest2name1_HORDE = Inst61Quest2name1
Inst61Quest2name2_HORDE = Inst61Quest2name2
Inst61Quest2name3_HORDE = Inst61Quest2name3
Inst61Quest2name4_HORDE = Inst61Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst61Quest3_HORDE = Inst61Quest3
Inst61Quest3_HORDE_Level = Inst61Quest3_Level
Inst61Quest3_HORDE_Attain = Inst61Quest3_Attain
Inst61Quest3_HORDE_Aim = Inst61Quest3_Aim
Inst61Quest3_HORDE_Location = Inst61Quest3_Location
Inst61Quest3_HORDE_Note = Inst61Quest3_Note
Inst61Quest3_HORDE_Prequest = Inst61Quest3_Prequest
Inst61Quest3_HORDE_Folgequest = Inst61Quest3_Folgequest
-- No Rewards for this quest



--------------- INST62 - Black Temple (BT) ---------------

Inst62Story = {
  ["Page1"] = "Long ago on Draenor, the Temple of Karabor was the center of draenei worship. But the devout priests who prayed there are long dead, slaughtered by marauding, demonically corrupted orcs. In the massacre's aftermath the warlocks of the Shadow Council seized the structure and bestowed upon it a new name: the Black Temple.\n\nFor years the Shadow Council bloodied the Black Temple with foul demonic rituals, but after the Second War the dark spellcasters fell to the Alliance's devastating invasion of Draenor. The shaman Ner'zhul hastily opened several dimensional portals in order to stage a retreat, and the resulting magical backlash ripped the world apart. In what had become the fractured realm of Outland, Ner'zhul's portals were a strategic advantage that appealed to the demon general Magtheridon, who quickly seized the Black Temple as his seat of power.",
  ["Page2"] = "Magtheridon commanded many of the orcs remaining in Outland and bolstered his army with Legion forces streaming in through the portals. The pit lord's might remained unchallenged until Illidan the Betrayer decided to claim the Black Temple for himself. Illidan and Magtheridon fought a desperate battle on the temple walls, but in the end the pit lord proved no match for the wielder of the Twin Blades of Azzinoth. Illidan battered Magtheridon to the point of death, but the thrill of victory was short-lived....",
  ["MaxPages"] = "2",
};
Inst62Caption = "Черный Храм"
Inst62QAA = "3 Задания"
Inst62QAH = "3 Задания"

--Quest 1 Alliance
Inst62Quest1 = "1. Найти Пеплоустов"
Inst62Quest1_Level = "70"
Inst62Quest1_Attain = "70"
Inst62Quest1_Aim = "Найдите Служителей Смерти Акамы в Черном храме."
Inst62Quest1_Location = "Ксири (Долина Призрачной луны; "..YELLOW.."65,44"..WHITE..")."
Inst62Quest1_Note = "Олумов дух находится сверху и слева сразу после входа в Черный Храм около "..YELLOW.."[1]"..WHITE..". Он телепортирует вас к провидцу Канеи после того, как вы убьете Верховного Полководца Надж'ентуса около "..YELLOW.."[2]"..WHITE.." и Супремуса около "..YELLOW.."[3]"..WHITE.."."
Inst62Quest1_Prequest = "Тайна под угрозой -> Отвлекающий маневр"
Inst62Quest1_Folgequest = "Искупление Пеплоустов"
Inst62Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. Искупление Пеплоустов"
Inst62Quest2_Level = "70"
Inst62Quest2_Attain = "70"
Inst62Quest2_Aim = "Возвратите Акаме власть над его душой, сразив Тень Акамы в Черном Храме. Затем возвращайтесь в провидцу Канеи."
Inst62Quest2_Location = "Провидец Канеи (Черный Храм; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest2_Note = "Тень Акамы находится около "..YELLOW.."[4]"..WHITE.."."
Inst62Quest2_Prequest = "Найти Служителей Смерти"
Inst62Quest2_Folgequest = "Судьба Предателя"
Inst62Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. Судьба Предателя"
Inst62Quest3_Level = "70"
Inst62Quest3_Attain = "70"
Inst62Quest3_Aim = "Провидец Канеи хочет, чтобы вы сразили Иллидана в Черном Храме."
Inst62Quest3_Location = "Провидец Канеи (Черный Храм; "..YELLOW.."[5]"..WHITE..")."
Inst62Quest3_Note = "Иллидан Ярость Бури находится около "..YELLOW.."[11]"..WHITE.."."
Inst62Quest3_Prequest = "Искупление Пеплоустов"
Inst62Quest3_Folgequest = "Нет"
Inst62Quest3FQuest = "true"
--
Inst62Quest3name1 = "Blessed Medallion of Karabor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst62Quest1_HORDE = Inst62Quest1
Inst62Quest1_HORDE_Level = Inst62Quest1_Level
Inst62Quest1_HORDE_Attain = Inst62Quest1_Attain
Inst62Quest1_HORDE_Aim = Inst62Quest1_Aim
Inst62Quest1_HORDE_Location = Inst62Quest1_Location
Inst62Quest1_HORDE_Note = Inst62Quest1_Note
Inst62Quest1_HORDE_Prequest = Inst62Quest1_Prequest
Inst62Quest1_HORDE_Folgequest = Inst62Quest1_Folgequest
Inst62Quest1PreQuest_HORDE = Inst62Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst62Quest2_HORDE = Inst62Quest2
Inst62Quest2_HORDE_Level = Inst62Quest2_Level
Inst62Quest2_HORDE_Attain = Inst62Quest2_Attain
Inst62Quest2_HORDE_Aim = Inst62Quest2_Aim
Inst62Quest2_HORDE_Location = Inst62Quest2_Location
Inst62Quest2_HORDE_Note = Inst62Quest2_Note
Inst62Quest2_HORDE_Prequest = Inst62Quest2_Prequest
Inst62Quest2_HORDE_Folgequest = Inst62Quest2_Folgequest
Inst62Quest2FQuest_HORDE = Inst62Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst62Quest3_HORDE = Inst62Quest3
Inst62Quest3_HORDE_Level = Inst62Quest3_Level
Inst62Quest3_HORDE_Attain = Inst62Quest3_Attain
Inst62Quest3_HORDE_Aim = Inst62Quest3_Aim
Inst62Quest3_HORDE_Location = Inst62Quest3_Location
Inst62Quest3_HORDE_Note = Inst62Quest3_Note
Inst62Quest3_HORDE_Prequest = Inst62Quest3_Prequest
Inst62Quest3_HORDE_Folgequest = Inst62Quest3_Folgequest
Inst62Quest3FQuest_HORDE = Inst62Quest3FQuest
--
Inst62Quest3name1_HORDE = Inst62Quest3name1



--------------- INST63 - Zul'Aman (ZA) ---------------

Inst63Story = "The stronghold of Zul'Aman has stood for millennia as the Amani trolls' seat of power and bastion of the fearless, cunning warlord Zul'jin. \n\nZul'jin has spent several years plotting behind Zul'Aman's walls. Furious at the Horde for allowing his hated enemies, the blood elves, to join its ranks, he eagerly embraced a scheme that the witch doctor Malacrass recently proposed: to seal the power of the animal gods within the bodies of the Amani's strongest warriors. \n\nNow Zul'Aman's army grows more powerful by the day, hungry to exact vengeance in the name of its fearless leader, Zul'jin."
Inst63Caption = "Зул'Аман"
Inst63QAA = "8 Заданий"
Inst63QAH = "8 Заданий"

--Quest 1 Alliance
Inst63Quest1 = "1. Все обещаешь и обещаешь."
Inst63Quest1_Level = "70"
Inst63Quest1_Attain = "70"
Inst63Quest1_Aim = "Разыщите карту Бадда Недрека на террасе верховного шамана Налоракка в Зул'Амане и верните ее хозяину."
Inst63Quest1_Location = "Бадд Недрек (Призрачные земли - Холмы Томагавков; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest1_Note = "Можно найти на првом скате около Высшего жреца Налоракка около "..YELLOW.."[1]"..WHITE..". Предшествующее задание необязательно и начинается у Грифтаха в (Шаттрат - Нижний город; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest1_Prequest = "Ой, блестяшечки!"
Inst63Quest1_Folgequest = "Белые пятна."
Inst63Quest1PreQuest = "true"
--
Inst63Quest1name1 = "Tattered Hexcloth Sack"

--Quest 2 Alliance
Inst63Quest2 = "2. Крестом на карте обозначена… твоя смерть!"
Inst63Quest2_Level = "70"
Inst63Quest2_Attain = "70"
Inst63Quest2_Aim = "Отправляйтесь в Зул'Аман и посетите чертог Халаззи, платформу Джан'алая и платформу Акил'зона. Заметьте все подробности и, по возвращении доложите о них Бадду в его лагере в Призрачных землях."
Inst63Quest2_Location = "Бадд Недрек (Призрачные земли - Холмы Томагавков; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest2_Note = "Чертог Халаззи находится около "..YELLOW.."[4]"..WHITE..", платформа Джан'алая находится около "..YELLOW.."[3]"..WHITE.." и платформа Акил'зона находится около "..YELLOW.."[2]"..WHITE..". \n\nПодтверждено, что для выполнения целей задания необязательно сражаться с боссами. Просто подойдите к ним, но не аггрите." 
Inst63Quest2_Prequest = "Все обещаешь и обещаешь."
Inst63Quest2_Folgequest = "Повелитель Проклятий? Пффф!"
Inst63Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. Повелитель Проклятий? Пффф!"
Inst63Quest3_Level = "70"
Inst63Quest3_Attain = "70"
Inst63Quest3_Aim = "Убейте в Зул'Амане повелителя проклятий Малакрасса и вернитесь к Бадду Недреку на Холмы Томагавков."
Inst63Quest3_Location = "Бадд Недрек (Призрачные земли - Холмы Томагавков; "..YELLOW.."70,67"..WHITE..")"
Inst63Quest3_Note = "Повелитель проклятий Малакрасс находится около "..YELLOW.."[6]"..WHITE.."."
Inst63Quest3_Prequest = "Крестом на карте обозначена… твоя смерть!"
Inst63Quest3_Folgequest = "Нет"
Inst63Quest3FQuest = "true"
--
Inst63Quest3name1 = "Знак справедливости"

--Quest 4 Alliance
Inst63Quest4 = "4. Клыкастые всадники"
Inst63Quest4_Level = "70"
Inst63Quest4_Attain = "70"
Inst63Quest4_Aim = "Соберите для Пригмона 10 клыков лесных троллей в Зул'Амане и принесите их ему в лагерь Бадда в Призрачных Землях."
Inst63Quest4_Location = "Пригмон (Призрачные земли - Холмы Томагавков; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest4_Note = "Клыки лесных троллей падают с мобов Амани'ши внутри Зул'Амана. Это задание будет доступно только после завершения задания Все обещаешь и обещаешь"
Inst63Quest4_Prequest = "Нет"
Inst63Quest4_Folgequest = "Троль из троллей"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. Троль из троллей"
Inst63Quest5_Level = "70"
Inst63Quest5_Attain = "70"
Inst63Quest5_Aim = "Найдите Зунгана и помогите ему выбраться из Зул'Амана."
Inst63Quest5_Location = "Пригмон (Призрачные земли - Холмы Томагавков; "..YELLOW.."71,68"..WHITE..")"
Inst63Quest5_Note = "Зунган находится в хижине около "..YELLOW.."[5]"..WHITE..". После того, как вы освободите его, он даст вам последующее задание."
Inst63Quest5_Prequest = "Клыкастые всадники"
Inst63Quest5_Folgequest = "Игра в куклы"
Inst63Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. Игра в куклы"
Inst63Quest6_Level = "70"
Inst63Quest6_Attain = "70"
Inst63Quest6_Aim = "Отнесите потрепанную куклу вуду Грифтаху в Шаттрат."
Inst63Quest6_Location = "Зунган (Зул'Аман; "..YELLOW.."[5]"..WHITE..")"
Inst63Quest6_Note = "Грифтах находится около (Шаттрат - Нижний город; "..YELLOW.."65,69"..WHITE..")."
Inst63Quest6_Prequest = "Троль из троллей"
Inst63Quest6_Folgequest = "Нет"
Inst63Quest6FQuest = "true"
--
Inst63Quest6name1 = "Charmed Amani Jewel"

--Quest 7 Alliance
Inst63Quest7 = "7. Кровь Вождя"
Inst63Quest7_Level = "70"
Inst63Quest7_Attain = "70"
Inst63Quest7_Aim = "Принесите кровь Зул'джина Бадду в его лагерь в Призрачных Землях. За пределами Зул'Амана."
Inst63Quest7_Location = "Кровь Зул'джина (падает с Зул'джина; "..YELLOW.."[7]"..WHITE..")"
Inst63Quest7_Note = "Только один игрок в рейде может подобрать этот предмет и задание можно выполнить только один раз."
Inst63Quest7_Prequest = "Нет"
Inst63Quest7_Folgequest = "Тайная Сестрица"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. Тайная Сестрица"
Inst63Quest8_Level = "70"
Inst63Quest8_Attain = "70"
Inst63Quest8_Aim = "Доберитесь до Донны Браско, чтобы получить причитающуюся вам награду. Найти Донну можно на Призрачных Землях, сразу за окраиной Зул'Амана."
Inst63Quest8_Location = "Донна Браско (Призрачные земли - Холмы Томагавков; "..YELLOW.."70,68"..WHITE..")"
Inst63Quest8_Note = ""
Inst63Quest8_Prequest = "Кровь Вождя"
Inst63Quest8_Folgequest = "Нет"
Inst63Quest8FQuest = "true"
--
Inst63Quest8name1 = "Badge of Justice"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst63Quest1_HORDE = Inst63Quest1
Inst63Quest1_HORDE_Level = Inst63Quest1_Level
Inst63Quest1_HORDE_Attain = Inst63Quest1_Attain
Inst63Quest1_HORDE_Aim = Inst63Quest1_Aim
Inst63Quest1_HORDE_Location = Inst63Quest1_Location
Inst63Quest1_HORDE_Note = Inst63Quest1_Note
Inst63Quest1_HORDE_Prequest = Inst63Quest1_Prequest
Inst63Quest1_HORDE_Folgequest = Inst63Quest1_Folgequest
Inst63Quest1PreQuest_HORDE = Inst63Quest1PreQuest
--
Inst63Quest1name1_HORDE = Inst63Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst63Quest2_HORDE = Inst63Quest2
Inst63Quest2_HORDE_Level = Inst63Quest2_Level
Inst63Quest2_HORDE_Attain = Inst63Quest2_Attain
Inst63Quest2_HORDE_Aim = Inst63Quest2_Aim
Inst63Quest2_HORDE_Location = Inst63Quest2_Location
Inst63Quest2_HORDE_Note = Inst63Quest2_Note
Inst63Quest2_HORDE_Prequest = Inst63Quest2_Prequest
Inst63Quest2_HORDE_Folgequest = Inst63Quest2_Folgequest
Inst63Quest2FQuest_HORDE = Inst63Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst63Quest3_HORDE = Inst63Quest3
Inst63Quest3_HORDE_Level = Inst63Quest3_Level
Inst63Quest3_HORDE_Attain = Inst63Quest3_Attain
Inst63Quest3_HORDE_Aim = Inst63Quest3_Aim
Inst63Quest3_HORDE_Location = Inst63Quest3_Location
Inst63Quest3_HORDE_Note = Inst63Quest3_Note
Inst63Quest3_HORDE_Prequest = Inst63Quest3_Prequest
Inst63Quest3_HORDE_Folgequest = Inst63Quest3_Folgequest
Inst63Quest3FQuest_HORDE = Inst63Quest3FQuest
--
Inst63Quest3name1_HORDE = Inst63Quest3name1

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst63Quest4_HORDE = Inst63Quest4
Inst63Quest4_HORDE_Level = Inst63Quest4_Level
Inst63Quest4_HORDE_Attain = Inst63Quest4_Attain
Inst63Quest4_HORDE_Aim = Inst63Quest4_Aim
Inst63Quest4_HORDE_Location = Inst63Quest4_Location
Inst63Quest4_HORDE_Note = Inst63Quest4_Note
Inst63Quest4_HORDE_Prequest = Inst63Quest4_Prequest
Inst63Quest4_HORDE_Folgequest = Inst63Quest4_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst63Quest5_HORDE = Inst63Quest5
Inst63Quest5_HORDE_Level = Inst63Quest5_Level
Inst63Quest5_HORDE_Attain = Inst63Quest5_Attain
Inst63Quest5_HORDE_Aim = Inst63Quest5_Aim
Inst63Quest5_HORDE_Location = Inst63Quest5_Location
Inst63Quest5_HORDE_Note = Inst63Quest5_Note
Inst63Quest5_HORDE_Prequest = Inst63Quest5_Prequest
Inst63Quest5_HORDE_Folgequest = Inst63Quest5_Folgequest
Inst63Quest5FQuest_HORDE = Inst63Quest5FQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst63Quest6_HORDE = Inst63Quest6
Inst63Quest6_HORDE_Level = Inst63Quest6_Level
Inst63Quest6_HORDE_Attain = Inst63Quest6_Attain
Inst63Quest6_HORDE_Aim = Inst63Quest6_Aim
Inst63Quest6_HORDE_Location = Inst63Quest6_Location
Inst63Quest6_HORDE_Note = Inst63Quest6_Note
Inst63Quest6_HORDE_Prequest = Inst63Quest6_Prequest
Inst63Quest6_HORDE_Folgequest = Inst63Quest6_Folgequest
Inst63Quest6FQuest_HORDE = Inst63Quest6FQuest
--
Inst63Quest6name1_HORDE = Inst63Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst63Quest7_HORDE = Inst63Quest7
Inst63Quest7_HORDE_Level = Inst63Quest7_Level
Inst63Quest7_HORDE_Attain = Inst63Quest7_Attain
Inst63Quest7_HORDE_Aim = Inst63Quest7_Aim
Inst63Quest7_HORDE_Location = Inst63Quest7_Location
Inst63Quest7_HORDE_Note = Inst63Quest7_Note
Inst63Quest7_HORDE_Prequest = Inst63Quest7_Prequest
Inst63Quest7_HORDE_Folgequest = Inst63Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst63Quest8_HORDE = Inst63Quest8
Inst63Quest8_HORDE_Level = Inst63Quest8_Level
Inst63Quest8_HORDE_Attain = Inst63Quest8_Attain
Inst63Quest8_HORDE_Aim = Inst63Quest8_Aim
Inst63Quest8_HORDE_Location = Inst63Quest8_Location
Inst63Quest8_HORDE_Note = Inst63Quest8_Note
Inst63Quest8_HORDE_Prequest = Inst63Quest8_Prequest
Inst63Quest8_HORDE_Folgequest = Inst63Quest8_Folgequest
Inst63Quest8FQuest_HORDE = Inst63Quest8FQuest
--
Inst63Quest8name1_HORDE = Inst63Quest8name1



--------------- INST67 - Magisters' Terrace (MgT) ---------------

Inst67Story = "Терраса Магистров - это подземелье для 5 игроков, расположенное на северо-восточном краю острова Кель'Данас, который появился в патче 2.4.0. Подземелье is mostly outdoors, uses the same architecture as Луносвет and has a observatory where players can gaze at stars and look at the Sunwell to make sure everything went according to plan.\n\nThe final boss is none other than Kael'thas Sunstrider, who has survived his ordeal in Tempest Keep. However, some people believe he was indeed killed, but was resurrected by a greater power, which may explain the green crystal embedded in his chest.\n\nHalfway through the instance, a usable item known as the Scrying Orb begins a short cutscene unveiling the Sunwell Plateau raid. Following this, players meet with Kalec, the half-elf avatar of the Blue Dragon Kalecgos.\n\n"..GREEN.."Взято из WoWWiki(перевел lorientalas)"
Inst67Caption = "Терраса Магистров"
Inst67QAA = "5 Заданий"
Inst67QAH = "5 Заданий"

--Quest 1 Alliance
Inst67Quest1 = "1. Разыскиваются: сестры Терзаний (ежедн.)"
Inst67Quest1_Level = "70"
Inst67Quest1_Attain = "70"
Inst67Quest1_Aim = "Ловчий Пустоты Ма'дуун хочет, чтобы вы убили 4 сестер Терзаний. Вернитесь к нему в Нижний Город Шаттрата, когда перебьете их, чтобы забрать награду."
Inst67Quest1_Location = "Ловчий Пустоты Ма'дуун (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest1_Note = "Это ежедневное задание."
Inst67Quest1_Prequest = "Нет"
Inst67Quest1_Folgequest = "Нет"
--
Inst67Quest1name1 = "Ethereum Prison Key"

--Quest 2 Alliance
Inst67Quest2 = "2. Заказ: перстень-печатка принца Кель'таса (Героическое (ежедн.))"
Inst67Quest2_Level = "70"
Inst67Quest2_Attain = "70"
Inst67Quest2_Aim = "Торговец ветром Зарим хочет, чтобы вы добыли ему перстень-печатку принца Кель'таса. Доставьте ее ему в Нижний Город Шаттрата и получите награду."
Inst67Quest2_Location = "Торговец ветром Зерим (Шаттрат - Нижний город; "..YELLOW.."74,35"..WHITE..")"
Inst67Quest2_Note = "Это ежедневное задание выполняется только в режиме героической сложности.\n\nПринц Кель'тас Солнечный Скиталец находится около "..YELLOW.."[6]"..WHITE.."."
Inst67Quest2_Prequest = "Нет"
Inst67Quest2_Folgequest = "Нет"
--
Inst67Quest2name1 = "Знак справедливости"

--Quest 3 Alliance
Inst67Quest3 = "3. Терраса Магистров"
Inst67Quest3_Level = "70"
Inst67Quest3_Attain = "70"
Inst67Quest3_Aim = "Экзарх Ларетор с подготовительного плацдарма Расколотого Солнца просит вас найти на Террасе Магистров своего разведчика – эльфа крови Тирита."
Inst67Quest3_Location = "Экзарх Ларетор (Остров Кель'Данас - Подготовительный плацдарм Расколотого Солнца; "..YELLOW.."47,31"..WHITE..")"Inst67Quest3_Note = "Тирит находится внутри подземелья около "..YELLOW.."[2]"..WHITE..". Эта линейка заданий открывает режим героической сложности.\n\nПредшествующее задание доступно или у Адуина Стража Света (Шаттрат - Возвышенность Алдоров; "..YELLOW.."35,36"..WHITE..") или у Датриса Солнцесвета (Шаттрат - Ярус Провидцев; "..YELLOW.."55,80"..WHITE..")."
Inst67Quest3_Note = "Тирит находится в подземелье около "..YELLOW.."[2]"..WHITE..". Эта цепочка заданий откроет героический режим подземелья.\n\nПредыдущее задание можно получить у Адуина Стража Света (Шаттрат - Возвышенность Алдоров; "..YELLOW.."35,36"..WHITE..") или у Датриса Солнцесвета (Шаттрат - Ярус Провидцев; "..YELLOW.."55,80"..WHITE..")."
Inst67Quest3_Prequest = "'Чрезвычайная ситуация у Солнечного Колодца' или 'Зов долга'"
Inst67Quest3_Folgequest = "Провидец Провидцев"
Inst67Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. Провидец Провидцев"
Inst67Quest4_Level = "70"
Inst67Quest4_Attain = "70"
Inst67Quest4_Aim = "Тирит просит вас использовать шар на балконе Террасы Магистров."
Inst67Quest4_Location = "Тирит (Терраса Магистров; "..YELLOW.."[2]"..WHITE..")"
Inst67Quest4_Note = "Гадательный шар находится около "..YELLOW.."[4]"..WHITE..". После 'киносценки', Появится Калесгос, чтобы начать следующее задание."
Inst67Quest4_Prequest = "Терраса Магистров"
Inst67Quest4_Folgequest = "Страшный противник"
Inst67Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. Страшный противник"
Inst67Quest5_Level = "70"
Inst67Quest5_Attain = "70"
Inst67Quest5_Aim = "Калесгос велит вам уничтожить Кель'таса на Террасе Магистров. Отрубите Келю голову и вернитесь с донесением к Ларетору на подготовительный плацдарм армии Расколотого Солнца."
Inst67Quest5_Location = "Калесгос (Терраса Магистров; "..YELLOW.."[4]"..WHITE..")"
Inst67Quest5_Note = "Принц Кель'тас Солнечный Скиталец находится около "..YELLOW.."[6]"..WHITE..". Выполнение задание также позволяет вам проходить Террасу Магистров в режиме героической сложности.\n\nЛаретор находится около (Остров Кель'Данас - Подготовительный плацдарм Расколотого Солнца; "..YELLOW.."47,31"..WHITE..")."
Inst67Quest5_Prequest = "Провидец Провидцев"
Inst67Quest5_Folgequest = "Нет"
Inst67Quest5FQuest = "true"
--
Inst67Quest5name1 = "Bright Crimson Spinel"
Inst67Quest5name2 = "Runed Crimson Spinel"
Inst67Quest5name3 = "Teardrop Crimson Spinel"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst67Quest1_HORDE = Inst67Quest1
Inst67Quest1_HORDE_Level = Inst67Quest1_Level
Inst67Quest1_HORDE_Attain = Inst67Quest1_Attain
Inst67Quest1_HORDE_Aim = Inst67Quest1_Aim
Inst67Quest1_HORDE_Location = Inst67Quest1_Location
Inst67Quest1_HORDE_Note = Inst67Quest1_Note
Inst67Quest1_HORDE_Prequest = Inst67Quest1_Prequest
Inst67Quest1_HORDE_Folgequest = Inst67Quest1_Folgequest
--
Inst67Quest1name1_HORDE = Inst67Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst67Quest2_HORDE = Inst67Quest2
Inst67Quest2_HORDE_Level = Inst67Quest2_Level
Inst67Quest2_HORDE_Attain = Inst67Quest2_Attain
Inst67Quest2_HORDE_Aim = Inst67Quest2_Aim
Inst67Quest2_HORDE_Location = Inst67Quest2_Location
Inst67Quest2_HORDE_Note = Inst67Quest2_Note
Inst67Quest2_HORDE_Prequest = Inst67Quest2_Prequest
Inst67Quest2_HORDE_Folgequest = Inst67Quest2_Folgequest
--
Inst67Quest2name1_HORDE = Inst67Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst67Quest3_HORDE = Inst67Quest3
Inst67Quest3_HORDE_Level = Inst67Quest3_Level
Inst67Quest3_HORDE_Attain = Inst67Quest3_Attain
Inst67Quest3_HORDE_Aim = Inst67Quest3_Aim
Inst67Quest3_HORDE_Location = Inst67Quest3_Location
Inst67Quest3_HORDE_Note = Inst67Quest3_Note
Inst67Quest3_HORDE_Prequest = Inst67Quest3_Prequest
Inst67Quest3_HORDE_Folgequest = Inst67Quest3_Folgequest
Inst67Quest3PreQuest_HORDE = Inst67Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst67Quest4_HORDE = Inst67Quest4
Inst67Quest4_HORDE_Level = Inst67Quest4_Level
Inst67Quest4_HORDE_Attain = Inst67Quest4_Attain
Inst67Quest4_HORDE_Aim = Inst67Quest4_Aim
Inst67Quest4_HORDE_Location = Inst67Quest4_Location
Inst67Quest4_HORDE_Note = Inst67Quest4_Note
Inst67Quest4_HORDE_Prequest = Inst67Quest4_Prequest
Inst67Quest4_HORDE_Folgequest = Inst67Quest4_Folgequest
Inst67Quest4FQuest_HORDE = Inst67Quest4FQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst67Quest5_HORDE = Inst67Quest5
Inst67Quest5_HORDE_Level = Inst67Quest5_Level
Inst67Quest5_HORDE_Attain = Inst67Quest5_Attain
Inst67Quest5_HORDE_Aim = Inst67Quest5_Aim
Inst67Quest5_HORDE_Location = Inst67Quest5_Location
Inst67Quest5_HORDE_Note = Inst67Quest5_Note
Inst67Quest5_HORDE_Prequest = Inst67Quest5_Prequest
Inst67Quest5_HORDE_Folgequest = Inst67Quest5_Folgequest
Inst67Quest5FQuest_HORDE = Inst67Quest5FQuest
--
Inst67Quest5name1_HORDE = Inst67Quest5name1
Inst67Quest5name2_HORDE = Inst67Quest5name2
Inst67Quest5name3_HORDE = Inst67Quest5name3



--------------- INST68 - Sunwell Plateau ---------------

Inst68Story = "Плато Солнечного колодца - это рейдовое подземелье, расположенное на острове Кель'Данас на север от Луносвета. Blizzard запланировал его как самое сложное рейдовое подземелье в игре до выхода Гнева Короля-лича. Плато Солнечного колодца настроено для игроков одетых в Т6 и предметы, выпадающие там, являются дополнительными вещами Т6 (ступни, пояс и наручи), также как и эпические предметы не из наборов. \n\nПодземелье содержит как открытые пространства, так и постройки, где игроки должны найти захваченного наару, который являетс изначальным источником силы города, и находится внутри финальной постройки Плато Солнечного колодца.\n\nАрхитектура Плато Солнечного колодца сравнима с архитектурой Луносвета.\n\n"..GREEN.."Взято из WoWWiki(перевел lorientalas)"
Inst68Caption = "Плато Солнечного колодца"
Inst68QAA = "1 задание"
Inst68QAH = "1 задание"

--Quest 1 Alliance
Inst68Quest1 = "1. Очищение Кель'Делара"
Inst68Quest1_Level = "80"
Inst68Quest1_Attain = "80"
Inst68Quest1_Aim = "Окуните закаленный Кель'Делар в Солнечный Колодец. Когда вы будете готовы войти на плато Солнечного Колодца, обратитесь к хранителю Солнечного Колодца."
Inst68Quest1_Location = "Халдарон Светлое Крыло (Остров Кель'Данас; "..YELLOW.."44.5, 45.5"..WHITE..")"
Inst68Quest1_Note = "Поговорите с Хранителем Солнечного колодца, чтобы попасть в подземелье. Вы попадете в специальное Плато Солнечного Колодца, в котором не будет мобов и боссов. Плато Солнечного Колодца находится "..YELLOW.."[4]"..WHITE.."."
Inst68Quest1_Prequest = "Талориен Искатель Рассвета"
Inst68Quest1_Folgequest = "Победа Серебряного союза"
Inst68Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst68Quest1_HORDE = "1. Очищение Кель'Делара"
Inst68Quest1_HORDE_Level = "80"
Inst68Quest1_HORDE_Attain = "80"
Inst68Quest1_HORDE_Aim = "Окуните закаленный Кель'Делар в Солнечный Колодец. Когда вы будете готовы войти на плато Солнечного Колодца, обратитесь к хранителю Солнечного Колодца."
Inst68Quest1_HORDE_Location = "Халдарон Светлое Крыло (Остров Кель'Данас; "..YELLOW.."44.5, 45.5"..WHITE..")"
Inst68Quest1_HORDE_Note = "Поговорите с Хранителем Солнечного колодца, чтобы попасть в подземелье. Вы попадете в специальное Плато Солнечного Колодца, в котором не будет мобов и боссов. Плато Солнечного Колодца находится "..YELLOW.."[4]"..WHITE.."."
Inst68Quest1_HORDE_Prequest = "Талориен Искатель Рассвета"
Inst68Quest1_HORDE_Folgequest = "Победа Серебряного союза"
Inst68Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest


--WoLTK Quests: Russian localizatiton by EvgeshaH.
--------------- INST69 - Caverns of Time: Stratholme Past ---------------

Inst69Story = "До слияния с Королем-личом принц боролся против Плети, пытаясь искоренить чуму, терзавшую королевство. Страх и ярость завладели разумом принца. Обнаружив признаки чумы в Стратхольме, Артас понял, что рано или поздно все жители города погибнут, а после перерождения встанут на сторону Плети. Принц видел единственный выход из ситуации: очистить город, уничтожив все его население.\n\n"..GREEN.."Цитата с wow-europe.com"
Inst69Caption = "ПВ: Очищение Стратхольма"
Inst69QAA = "2 задания"
Inst69QAH = "2 задания"

--Quest 1 Alliance
Inst69Quest1 = "1. Развеянные иллюзии"
Inst69Quest1_Level = "80"
Inst69Quest1_Attain = "78"
Inst69Quest1_Aim = "Хроми попросила вас снять маскировку с подозрительных ящиков с зерном с помощью Разбивателя Чар, после чего найти ее у входа в Стратхольм."
Inst69Quest1_Location = "Хроми (ПВ: Очищение Стратхольма; "..YELLOW.."[1]"..WHITE..")"
Inst69Quest1_Note = "Ящик с зерном можно найти около домов и по дороге к Стратхольму. После завершения, Вы должны сдать задание 'другой' Хроми "..YELLOW.."[2]"..WHITE.."."
Inst69Quest1_Prequest = "Нет"
Inst69Quest1_Folgequest = "Королевский эскорт"
-- No Rewards for this quest

--Quest 2 Alliance
Inst69Quest2 = "2. Королевский эскорт"
Inst69Quest2_Level = "80"
Inst69Quest2_Attain = "78"
Inst69Quest2_Aim = "Хроми попросила вас сопровождать Артаса во время очищения Стратхольма. Вернитесь к ней, когда Мал'Ганис будет убит."
Inst69Quest2_Location = "Хроми (ПВ: Очищение Стратхольма; "..YELLOW.."[2]"..WHITE..")"
Inst69Quest2_Note = "Мал'Ганис находится "..YELLOW.."[5]"..WHITE..". Хроми прилетит туда, после его смерти."
Inst69Quest2_Prequest = "Развеянные иллюзии"
Inst69Quest2_Folgequest = "Нет"
Inst69Quest2FQuest = "true"
--
Inst69Quest2name1 = "Gloves of the Time Guardian"
Inst69Quest2name2 = "Handwraps of Preserved History"
Inst69Quest2name3 = "Grips of Chronological Events"
Inst69Quest2name4 = "Gauntlets of The Culling"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst69Quest1_HORDE = Inst69Quest1
Inst69Quest1_HORDE_Level = Inst69Quest1_Level
Inst69Quest1_HORDE_Attain = Inst69Quest1_Attain
Inst69Quest1_HORDE_Aim = Inst69Quest1_Aim
Inst69Quest1_HORDE_Location = Inst69Quest1_Location
Inst69Quest1_HORDE_Note = Inst69Quest1_Note
Inst69Quest1_HORDE_Prequest = Inst69Quest1_Prequest
Inst69Quest1_HORDE_Folgequest = Inst69Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst69Quest2_HORDE = Inst69Quest2
Inst69Quest2_HORDE_Level = Inst69Quest2_Level
Inst69Quest2_HORDE_Attain = Inst69Quest2_Attain
Inst69Quest2_HORDE_Aim = Inst69Quest2_Aim
Inst69Quest2_HORDE_Location = Inst69Quest2_Location
Inst69Quest2_HORDE_Note = Inst69Quest2_Note
Inst69Quest2_HORDE_Prequest = Inst69Quest2_Prequest
Inst69Quest2_HORDE_Folgequest = Inst69Quest2_Folgequest
Inst69Quest2FQuest_HORDE = Inst69Quest2FQuest
--
Inst69Quest2name1_HORDE = Inst69Quest2name1
Inst69Quest2name2_HORDE = Inst69Quest2name2
Inst69Quest2name3_HORDE = Inst69Quest2name3
Inst69Quest2name4_HORDE = Inst69Quest2name4



--------------- INST70 - Utgarde Keep: Utgarde Keep ---------------

Inst70Story = "Среди скал, окружающих Бухту Кинжалов, что в Ревущем Фьорде, высится Крепость Утгард, захваченная загадочным, диким племенем врайкулов. В течение нескольких тысяч лет Крепость считалась покинутой, но теперь в ее стенах засело бесчисленное врайкульское войско, постоянно нападающее на близлежащие поселения. Врайкулы фанатично преданны своему королю Имирону и живут, похоже, только ради битвы.\n\n"..GREEN.."Цитата с wow-europe.com."
Inst70Caption = "Крепость Утгард"
Inst70QAA = "2 задания"
Inst70QAH = "3 задания"

--Quest 1 Alliance
Inst70Quest1 = "1. На Утгард!"
Inst70Quest1_Level = "71"
Inst70Quest1_Attain = "68"
Inst70Quest1_Aim = "Защитник Мордун поручил вам казнить Ингвара Грабителя, который обитает в Утгарде, и принести его голову вице-адмиралу Келлеру."
Inst70Quest1_Location = "Защитник Мордун (Ревущий фьорд - Деревня драконьего черепа; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest1_Note = "Ингвар Расхититель находится "..YELLOW.."[3]"..WHITE..".\n\nОкончание задания у Вице-адмирала Келлера (Ревущий фьорд  - Валгард; "..YELLOW.."60.4, 61.0"..WHITE..")."
Inst70Quest1_Prequest = "С новыми силами"
Inst70Quest1_Folgequest = "Нет"
--
Inst70Quest1name1 = "Executioner's Band"
Inst70Quest1name2 = "Ring of Decimation"
Inst70Quest1name3 = "Signet of Swift Judgment"

--Quest 2 Alliance
Inst70Quest2 = "2. Разоружение"
Inst70Quest2_Level = "71"
Inst70Quest2_Attain = "70"
Inst70Quest2_Aim = "Защитник Мордун поручил вам проникнуть в Крепость Утгард и украсть 5 образцов врайкульского оружия."
Inst70Quest2_Location = "Защитник Мордун (Ревущий фьорд - Wyrmskull Village; "..YELLOW.."59.3, 48.8"..WHITE..")"
Inst70Quest2_Note = "Оружие врайкулов находится в подземелье повсюду."
Inst70Quest2_Prequest = "Нет"
Inst70Quest2_Folgequest = "Нет"
--
Inst70Quest2name1 = "Amulet of the Tranquil Mind"
Inst70Quest2name2 = "Razor-Blade Pendant"
Inst70Quest2name3 = "Necklace of Fragmented Light"
Inst70Quest2name4 = "Woven Steel Necklace"


--Quest 1 Horde
Inst70Quest1_HORDE = "1. Сведение счетов"
Inst70Quest1_HORDE_Level = "71"
Inst70Quest1_HORDE_Attain = "68"
Inst70Quest1_HORDE_Aim = "Верховный палач Ансельм повелел вам отправиться в Утгард и убить принца Келесета."
Inst70Quest1_HORDE_Location = "Верховный палач Ансельм (Ревущий фьорд - Лагерь Возмездия; "..YELLOW.."78.5, 31.1"..WHITE..")"
Inst70Quest1_HORDE_Note = "Принц Келесет находится "..YELLOW.."[1]"..WHITE..".\n\nЦепочку предыдущих заданий дает этот же NPC."
Inst70Quest1_HORDE_Prequest = "Ужасы войны -> Доложите Ансельму"
Inst70Quest1_HORDE_Folgequest = "Нет"
--
Inst70Quest2name1_HORDE = "Wraps of the San'layn"
Inst70Quest2name2_HORDE = "Vendetta Bindings"
Inst70Quest2name3_HORDE = "Runecaster's Bracers"
Inst70Quest2name4_HORDE = "Vambraces of the Vengeance Bringer"

--Quest 2 Horde
Inst70Quest2_HORDE = "2. Ингвар должен умереть!"
Inst70Quest2_HORDE_Level = "71"
Inst70Quest2_HORDE_Attain = "70"
Inst70Quest2_HORDE_Aim = "Темный следопыт Марра просит вас убить Ингвара Расхитителя в Крепости Утгард и принести его голову верховному палачу Ансельму в Лагерь Возмездия."
Inst70Quest2_HORDE_Location = "Темный следопыт Марра (Крепость Утгард; "..YELLOW.."[A] Вход"..WHITE..")"
Inst70Quest2_HORDE_Note = "Темный следопыт Марра появляется на несколько секунд, после входа в подземелье.\n\nИнгвар Расхититель находится "..YELLOW.."[3]"..WHITE..".\n\nОкончание задания у Верховного палача Ансельма (Ревущий фьорд - Лагерь Возмездия; "..YELLOW.."78.5, 31.1"..WHITE..")."
Inst70Quest2_HORDE_Prequest = "Нет"
Inst70Quest2_HORDE_Folgequest = "Нет"
--
Inst70Quest2name1_HORDE = "Executioner's Band"
Inst70Quest2name2_HORDE = "Ring of Decimation"
Inst70Quest2name3_HORDE = "Signet of Swift Judgment"

--Quest 3 Horde
Inst70Quest3_HORDE = "3. Разоружение"
Inst70Quest3_HORDE_Level = "71"
Inst70Quest3_HORDE_Attain = "70"
Inst70Quest3_HORDE_Aim = "Темный следопыт Марра просит вас украсть в крепости Утгард 5 образцов врайкульского оружия и принести их верховному палачу Ансельму в Лагерь Возмездия."
Inst70Quest3_HORDE_Location = "Темный следопыт Марра (Крепость Утгард; "..YELLOW.."[A] Вход"..WHITE..")"
Inst70Quest3_HORDE_Note = "Темный следопыт Марра появляется на несколько секунд, после входа в подземелье.\n\nОружие врайкулов находится в подземелье повсюду.\n\nОкончание задания у Верховного палача Ансельма (Ревущий фьорд - Лагерь Возмездия; "..YELLOW.."78.5, 31.1"..WHITE..")."
Inst70Quest3_HORDE_Prequest = "Нет"
Inst70Quest3_HORDE_Folgequest = "Нет"
--
Inst70Quest3name1_HORDE = "Necklace of Calm Skies"
Inst70Quest3name2_HORDE = "Hundred Tooth Necklace"
Inst70Quest3name3_HORDE = "Amulet of Constrained Power"
Inst70Quest3name4_HORDE = "Tiled-Stone Pendant"



--------------- INST71 - Utgarde Keep: Utgarde Pinnacle ---------------

Inst71Story = "Среди скал, окружающих Бухту Кинжалов, что в Ревущем Фьорде, высится Крепость Утгард, захваченная загадочным, диким племенем врайкулов. В течение нескольких тысяч лет Крепость считалась покинутой, но теперь в ее стенах засело бесчисленное врайкульское войско, постоянно нападающее на близлежащие поселения. Врайкулы фанатично преданны своему королю Имирону и живут, похоже, только ради битвы.\n\n"..GREEN.."Цитата с wow-europe.com."
Inst71Caption = "Вершина Утгард"
Inst71QAA = "2 задания"
Inst71QAH = "2 задания"

--Quest 1 Alliance
Inst71Quest1 = "1. Пустой сундук"
Inst71Quest1_Level = "80"
Inst71Quest1_Attain = "78"
Inst71Quest1_Aim = "Принесите Бриггу на вершину Утгард 5 непотускневших серебряных слитков, 3 сверкающих кристалла, 2 золотых кубка и нефритовую статуэтку."
Inst71Quest1_Location = "Бригг Мелкотруб (Вершина Утгард; "..YELLOW.."[??]"..WHITE..")"
Inst71Quest1_Note = "Данные вещи разбросаны по всему подземелью. Чаще всего лежат на полу."
Inst71Quest1_Prequest = "Нет"
Inst71Quest1_Folgequest = "Нет"
--
Inst71Quest1name1 = "Bauble-Woven Gown"
Inst71Quest1name2 = "Exotic Leather Tunic"
Inst71Quest1name3 = "Silver-Plated Battlechest"
Inst71Quest1name4 = "Gilded Ringmail Hauberk"

--Quest 2 Alliance
Inst71Quest2 = "2. Отмщение"
Inst71Quest2_Level = "80"
Inst71Quest2_Attain = "78"
Inst71Quest2_Aim = "Убейте короля Имирона по просьбе Бригга из вершины Утгард."
Inst71Quest2_Location = "Бригг Мелкотруб (Вершина Утгард; "..YELLOW.."[??]"..WHITE..")"
Inst71Quest2_Note = "Король Имирон находится "..YELLOW.."[4]"..WHITE.."."
Inst71Quest2_Prequest = "Нет"
Inst71Quest2_Folgequest = "Нет"
--
Inst71Quest2name1 = "Cowl of the Vindictive Captain"
Inst71Quest2name2 = "Headguard of Retaliation"
Inst71Quest2name3 = "Helmet of Just Retribution"
Inst71Quest2name4 = "Faceguard of Punishment"
Inst71Quest2name5 = "Platehelm of Irate Revenge"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst71Quest1_HORDE = Inst71Quest1
Inst71Quest1_HORDE_Level = Inst71Quest1_Level
Inst71Quest1_HORDE_Attain = Inst71Quest1_Attain
Inst71Quest1_HORDE_Aim = Inst71Quest1_Aim
Inst71Quest1_HORDE_Location = Inst71Quest1_Location
Inst71Quest1_HORDE_Note = Inst71Quest1_Note
Inst71Quest1_HORDE_Prequest = Inst71Quest1_Prequest
Inst71Quest1_HORDE_Folgequest = Inst71Quest1_Folgequest
--
Inst71Quest1name1_HORDE = Inst71Quest1name1
Inst71Quest1name2_HORDE = Inst71Quest1name2
Inst71Quest1name3_HORDE = Inst71Quest1name3
Inst71Quest1name4_HORDE = Inst71Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst71Quest2_HORDE = Inst71Quest2
Inst71Quest2_HORDE_Level = Inst71Quest2_Level
Inst71Quest2_HORDE_Attain = Inst71Quest2_Attain
Inst71Quest2_HORDE_Aim = Inst71Quest2_Aim
Inst71Quest2_HORDE_Location = Inst71Quest2_Location
Inst71Quest2_HORDE_Note = Inst71Quest2_Note
Inst71Quest2_HORDE_Prequest = Inst71Quest2_Prequest
Inst71Quest2_HORDE_Folgequest = Inst71Quest2_Folgequest
--
Inst71Quest2name1_HORDE = Inst71Quest2name1
Inst71Quest2name2_HORDE = Inst71Quest2name2
Inst71Quest2name3_HORDE = Inst71Quest2name3
Inst71Quest2name4_HORDE = Inst71Quest2name4
Inst71Quest2name5_HORDE = Inst71Quest2name5



--------------- INST72 - The Nexus: The Nexus ---------------

Inst72Story = "Нексус - подземелье в центре Клодарры, в Борейской тундре в Нордсколе. Нексус сосоит из многих пещер и туннелей ведущим к двум подземельям на 5 человек и одному подземелью на рейд из 10 или 25 человек.\n\n"..GREEN.."Цитата с англ. WoW Head"
Inst72Caption = "Нексус: Нексус"
Inst72QAA = "4 заданий"
Inst72QAH = "4 заданий"

--Quest 1 Alliance
Inst72Quest1 = "1. Ни стыда, ни совести"
Inst72Quest1_Level = "71"
Inst72Quest1_Attain = "70"
Inst72Quest1_Aim = "Библиотекарь Серра просит вас зайти в Нексус и найти книгу с исследованиями Беринарда."
Inst72Quest1_Location = "Библиотекарь Серра (Борейская тундра - Маскировочный щит; "..YELLOW.."33.4, 34.3"..WHITE..")"
Inst72Quest1_Note = "Исследования Беринарда находятся в проходе, где стоят замерзшие мобы."..YELLOW.."[5]"..WHITE.."."
Inst72Quest1_Prequest = "Нет"
Inst72Quest1_Folgequest = "Нет"
--
Inst72Quest1name1 = "Shoulders of the Northern Lights"
Inst72Quest1name2 = "Cured Mammoth Hide Mantle"
Inst72Quest1name3 = "Tundra Tracker's Shoulderguards"
Inst72Quest1name4 = "Tundra Pauldrons"

--Quest 2 Alliance
Inst72Quest2 = "2. Оттянуть неотвратимое"
Inst72Quest2_Level = "71"
Inst72Quest2_Attain = "70"
Inst72Quest2_Aim = "Используйте восстановитель измерений вблизи разрыва в Нексусе по просьбе верховного мага Беринарда."
Inst72Quest2_Location = "Верховный маг Беринард (Борейская тундра - Маскировочный щит; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest2_Note = "Используйте Восстановитель измерений на краю платформы где стоит Аномалус "..YELLOW.."[2]"..WHITE.."."
Inst72Quest2_Prequest = "Что показывают приборы?"
Inst72Quest2_Folgequest = "Нет"
Inst72Quest2PreQuest = "true"
--
Inst72Quest2name1 = "Time-Twisted Wraps"
Inst72Quest2name2 = "Time-Stop Gloves"
Inst72Quest2name3 = "Bindings of Sabotage"
Inst72Quest2name4 = "Gauntlets of the Disturbed Giant"

--Quest 3 Alliance
Inst72Quest3 = "3. Пленница"
Inst72Quest3_Level = "71"
Inst72Quest3_Attain = "70"
Inst72Quest3_Aim = "По просьбе Релораза из Маскировочного щита войдите в Нексус и освободите Керистразу."
Inst72Quest3_Location = "Релораз (Борейская тундра - Маскировочный щит; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst72Quest3_Note = "Керистраза находится "..YELLOW.."[5]"..WHITE.."."
Inst72Quest3_Prequest = "Керистраза -> Сработавший капкан"
Inst72Quest3_Folgequest = "Нет"
Inst72Quest3PreQuest = "true"
--
Inst72Quest3name1 = "Cloak of Azure Lights"
Inst72Quest3name2 = "Mantle of Keristrasza"
Inst72Quest3name3 = "Shroud of Fluid Strikes"

--Quest 4 Alliance
Inst72Quest4 = "4. Преображение"
Inst72Quest4_Level = "71"
Inst72Quest4_Attain = "70"
Inst72Quest4_Aim = "По заданию верховного мага Беринанда из Маскировочного щита войдите в Нексус и соберите 5 магических обломков с хрустальных заступников."
Inst72Quest4_Location = "Верховный маг Беринард (Борейская тундра - Маскировочный щит; "..YELLOW.."32.9, 34.3"..WHITE..")"
Inst72Quest4_Note = "Магические обломки падают с Кристаллических заступников."
Inst72Quest4_Prequest = "Тайны Древних"
Inst72Quest4_Folgequest = "Нет"
Inst72Quest4PreQuest = "true"
--
Inst72Quest4name1 = "Sandals of Mystical Evolution"
Inst72Quest4name2 = "Treads of Torn Future"
Inst72Quest4name3 = "Spiked Treads of Mutation"
Inst72Quest4name4 = "Invigorating Sabatons"
Inst72Quest4name5 = "Boots of the Unbowed Protector"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst72Quest1_HORDE = Inst72Quest1
Inst72Quest1_HORDE_Level = Inst72Quest1_Level
Inst72Quest1_HORDE_Attain = Inst72Quest1_Attain
Inst72Quest1_HORDE_Aim = Inst72Quest1_Aim
Inst72Quest1_HORDE_Location = Inst72Quest1_Location
Inst72Quest1_HORDE_Note = Inst72Quest1_Note
Inst72Quest1_HORDE_Prequest = Inst72Quest1_Prequest
Inst72Quest1_HORDE_Folgequest = Inst72Quest1_Folgequest
--
Inst72Quest1name1_HORDE = Inst72Quest1name1
Inst72Quest1name2_HORDE = Inst72Quest1name2
Inst72Quest1name3_HORDE = Inst72Quest1name3
Inst72Quest1name4_HORDE = Inst72Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst72Quest2_HORDE = Inst72Quest2
Inst72Quest2_HORDE_Level = Inst72Quest2_Level
Inst72Quest2_HORDE_Attain = Inst72Quest2_Attain
Inst72Quest2_HORDE_Aim = Inst72Quest2_Aim
Inst72Quest2_HORDE_Location = Inst72Quest2_Location
Inst72Quest2_HORDE_Note = Inst72Quest2_Note
Inst72Quest2_HORDE_Prequest = Inst72Quest2_Prequest
Inst72Quest2_HORDE_Folgequest = Inst72Quest2_Folgequest
Inst72Quest2PreQuest_HORDE = Inst72Quest2PreQuest
--
Inst72Quest2name1_HORDE = Inst72Quest2name1
Inst72Quest2name2_HORDE = Inst72Quest2name2
Inst72Quest2name3_HORDE = Inst72Quest2name3
Inst72Quest2name4_HORDE = Inst72Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst72Quest3_HORDE = Inst72Quest3
Inst72Quest3_HORDE_Level = Inst72Quest3_Level
Inst72Quest3_HORDE_Attain = Inst72Quest3_Attain
Inst72Quest3_HORDE_Aim = Inst72Quest3_Aim
Inst72Quest3_HORDE_Location = Inst72Quest3_Location
Inst72Quest3_HORDE_Note = Inst72Quest3_Note
Inst72Quest3_HORDE_Prequest = Inst72Quest3_Prequest
Inst72Quest3_HORDE_Folgequest = Inst72Quest3_Folgequest
Inst72Quest3PreQuest_HORDE = Inst72Quest3PreQuest
--
Inst72Quest3name1_HORDE = Inst72Quest3name1
Inst72Quest3name2_HORDE = Inst72Quest3name2
Inst72Quest3name3_HORDE = Inst72Quest3name3

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst72Quest4_HORDE = Inst72Quest4
Inst72Quest4_HORDE_Level = Inst72Quest4_Level
Inst72Quest4_HORDE_Attain = Inst72Quest4_Attain
Inst72Quest4_HORDE_Aim = Inst72Quest4_Aim
Inst72Quest4_HORDE_Location = Inst72Quest4_Location
Inst72Quest4_HORDE_Note = Inst72Quest4_Note
Inst72Quest4_HORDE_Prequest = Inst72Quest4_Prequest
Inst72Quest4_HORDE_Folgequest = Inst72Quest4_Folgequest
Inst72Quest4PreQuest_HORDE = Inst72Quest4PreQuest
--
Inst72Quest4name1_HORDE = Inst72Quest4name1
Inst72Quest4name2_HORDE = Inst72Quest4name2
Inst72Quest4name3_HORDE = Inst72Quest4name3
Inst72Quest4name4_HORDE = Inst72Quest4name4
Inst72Quest4name5_HORDE = Inst72Quest4name5



--------------- INST73 - The Nexus: The Oculus ---------------

Inst73Story = "Нексус - подземелье в центре Клодарры, в Борейской тундре в Нордсколе. Нексус сосоит из многих пещер и туннелей ведущим к двум подземельям на 5 человек и одному подземелью на рейд из 10 или 25 человек.\n\n"..GREEN.."Цитата с англ. WoW Head"
Inst73Caption = "Нексус: Окулус"
Inst73QAA = "4 заданий"
Inst73QAH = "4 заданий"

--Quest 1 Alliance
Inst73Quest1 = "1. И вновь продолжается бой"
Inst73Quest1_Level = "80"
Inst73Quest1_Attain = "80"
Inst73Quest1_Aim = "Релораз просит вас войти в Окулус и спасти Белгаристраза с его командой. "
Inst73Quest1_Location = "Релораз (Борейская тундра - Маскировочный щит; "..YELLOW.."33.2, 34.4"..WHITE..")"
Inst73Quest1_Note = "Нет информации."
Inst73Quest1_Prequest = "Нет"
Inst73Quest1_Folgequest = "Единым фронтом"
--
Inst73Quest1name1 = "Ring of Temerity"
Inst73Quest1name2 = "Flourishing Band"
Inst73Quest1name3 = "Band of Motivation"
Inst73Quest1name4 = "Staunch Signet"

--Quest 2 Alliance
Inst73Quest2 = "2. Единым фронтом"
Inst73Quest2_Level = "80"
Inst73Quest2_Attain = "80"
Inst73Quest2_Aim = "Белгаристраз просит вас уничтожить 10 Центрифужных созданий, разрушить щит Вароса и одолеть самого Заоблачного Странника."
Inst73Quest2_Location = "Белгаристраз (Нексус: Окулус; "..YELLOW.."[1]"..WHITE..")"
Inst73Quest2_Note = "Белгаристраза появиться после смерти Вароса Заоблачного странника "..YELLOW.."[2]"..WHITE.."."
Inst73Quest2_Prequest = "И вновь продолжается бой"
Inst73Quest2_Folgequest = "Маг-лорд Уром"
Inst73Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst73Quest3 = "3. Маг-лорд Уром"
Inst73Quest3_Level = "80"
Inst73Quest3_Attain = "80"
Inst73Quest3_Aim = "Белгаристраз просит вас победить Мага-лорда Урома в Окулусе."
Inst73Quest3_Location = "Проекция Белгаристраза (Нексус: Окулус; "..YELLOW.."[2]"..WHITE..")"
Inst73Quest3_Note = "Белгаристраза появиться после смерти Мага-лорда Урома "..YELLOW.."[3]"..WHITE.."."
Inst73Quest3_Prequest = "Единым фронтом"
Inst73Quest3_Folgequest = "Высокие ставки"
Inst73Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst73Quest4 = "4. Высокие ставки"
Inst73Quest4_Level = "80"
Inst73Quest4_Attain = "80"
Inst73Quest4_Aim = "Белгаристраз просит вас убить Эрегоса в Окулусе, после чего оповестить о его смерти Релораза из лагеря под Маскировочным щитом в Хладарре."
Inst73Quest4_Location = "Проекция Белгаристраза (Нексус: Окулус; "..YELLOW.."[2]"..WHITE..")"
Inst73Quest4_Note = "Эрегос находится "..YELLOW.."[4]"..WHITE..". Релораз находится (Борейская тундра - Маскировочный щит; "..YELLOW.."33.2, 34.4"..WHITE..")."
Inst73Quest4_Prequest = "Маг-лорд Уром"
Inst73Quest4_Folgequest = "Нет"
Inst73Quest4FQuest = "true"
--
Inst73Quest4name1 = "Cuffs of Gratitude"
Inst73Quest4name2 = "Soaring Wristwraps"
Inst73Quest4name3 = "Bindings of Raelorasz"
Inst73Quest4name4 = "Bracers of Reverence"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst73Quest1_HORDE = Inst73Quest1
Inst73Quest1_HORDE_Level = Inst73Quest1_Level
Inst73Quest1_HORDE_Attain = Inst73Quest1_Attain
Inst73Quest1_HORDE_Aim = Inst73Quest1_Aim
Inst73Quest1_HORDE_Location = Inst73Quest1_Location
Inst73Quest1_HORDE_Note = Inst73Quest1_Note
Inst73Quest1_HORDE_Prequest = Inst73Quest1_Prequest
Inst73Quest1_HORDE_Folgequest = Inst73Quest1_Folgequest
--
Inst73Quest1name1_HORDE = Inst73Quest1name1
Inst73Quest1name2_HORDE = Inst73Quest1name2
Inst73Quest1name3_HORDE = Inst73Quest1name3
Inst73Quest1name4_HORDE = Inst73Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst73Quest2_HORDE = Inst73Quest2
Inst73Quest2_HORDE_Level = Inst73Quest2_Level
Inst73Quest2_HORDE_Attain = Inst73Quest2_Attain
Inst73Quest2_HORDE_Aim = Inst73Quest2_Aim
Inst73Quest2_HORDE_Location = Inst73Quest2_Location
Inst73Quest2_HORDE_Note = Inst73Quest2_Note
Inst73Quest2_HORDE_Prequest = Inst73Quest2_Prequest
Inst73Quest2_HORDE_Folgequest = Inst73Quest2_Folgequest
Inst73Quest2FQuest_HORDE = Inst73Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst73Quest3_HORDE = Inst73Quest3
Inst73Quest3_HORDE_Level = Inst73Quest3_Level
Inst73Quest3_HORDE_Attain = Inst73Quest3_Attain
Inst73Quest3_HORDE_Aim = Inst73Quest3_Aim
Inst73Quest3_HORDE_Location = Inst73Quest3_Location
Inst73Quest3_HORDE_Note = Inst73Quest3_Note
Inst73Quest3_HORDE_Prequest = Inst73Quest3_Prequest
Inst73Quest3_HORDE_Folgequest = Inst73Quest3_Folgequest
Inst73Quest3FQuest_HORDE = Inst73Quest3FQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst73Quest4_HORDE = Inst73Quest4
Inst73Quest4_HORDE_Level = Inst73Quest4_Level
Inst73Quest4_HORDE_Attain = Inst73Quest4_Attain
Inst73Quest4_HORDE_Aim = Inst73Quest4_Aim
Inst73Quest4_HORDE_Location = Inst73Quest4_Location
Inst73Quest4_HORDE_Note = Inst73Quest4_Note
Inst73Quest4_HORDE_Prequest = Inst73Quest4_Prequest
Inst73Quest4_HORDE_Folgequest = Inst73Quest4_Folgequest
Inst73Quest4FQuest_HORDE = Inst73Quest4FQuest
--
Inst73Quest4name1_HORDE = Inst73Quest4name1
Inst73Quest4name2_HORDE = Inst73Quest4name2
Inst73Quest4name3_HORDE = Inst73Quest4name3
Inst73Quest4name4_HORDE = Inst73Quest4name4



--------------- INST74 - The Nexus: The Eye of Eternity ---------------

Inst74Story = "Нексус - подземелье в центре Клодарры, в Борейской тундре в Нордсколе. Нексус сосоит из многих пещер и туннелей ведущим к двум подземельям на 5 человек и одному подземелью на рейд из 10 или 25 человек.\n\nОко Вечности - последнее рейдовое подземелье Нексуса, в котором игроки могут сразиться с Малигосом, драконом синего аспекта.\n\n"..GREEN.."Цитата с англ. WoW Head"
Inst74Caption = "Нексус: Око Вечности"
Inst74QAA = "3 задания"
Inst74QAH = "3 задания"

--Quest 1 Alliance
Inst74Quest1 = "1. Правосудие в Оке Вечности"
Inst74Quest1_Level = "80"
Inst74Quest1_Attain = "80"
Inst74Quest1_Aim = "Принесите Сердце Магии Красу на вершине храма Драконьего Покоя в Драконьем Погосте."
Inst74Quest1_Location = "Крас (Драконий Погост - храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest1_Note = "После убийства Малигоса вы можете взять 'Сердце Магии' рядом с 'Даром Алекстразы' "..YELLOW.."[??]"..WHITE.."."
Inst74Quest1_Prequest = "Ключ к Радужному Средоточию ("..YELLOW.."Наксрамас"..WHITE..")"
Inst74Quest1_Folgequest = "Нет"
Inst74Quest1PreQuest = "true"
--
Inst74Quest1name1 = "Chain of the Ancient Wyrm"
Inst74Quest1name2 = "Torque of the Red Dragonflight"
Inst74Quest1name3 = "Pendant of the Dragonsworn"
Inst74Quest1name4 = "Drakescale Collar"

--Quest 2 Alliance
Inst74Quest2 = "2. Героическое правосудие в Оке Вечности"
Inst74Quest2_Level = "80"
Inst74Quest2_Attain = "80"
Inst74Quest2_Aim = "Принесите Сердце Магии Красу на вершине храма Драконьего Покоя в Драконьем Погосте."
Inst74Quest2_Location = "Крас (Драконий Погост - храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst74Quest2_Note = "После убийства Малигоса вы можете взять 'Сердце Магии' в 'Даре Алекстразы' "..YELLOW.."[??]"..WHITE.."."
Inst74Quest2_Prequest = "Ключ к Радужному Средоточию (героический режим) ("..YELLOW.."Наксрамас"..WHITE..")"
Inst74Quest2_Folgequest = "Нет"
Inst74Quest2PreQuest = "true"
--
Inst74Quest2name1 = "Wyrmrest Necklace of Power"
Inst74Quest2name2 = "Life-Binder's Locket"
Inst74Quest2name3 = "Favor of the Dragon Queen"
Inst74Quest2name4 = "Nexus War Champion Beads"

--Quest 3 Alliance
Inst74Quest3 = "3. Малигос должен умереть! (Еженедельный)"
Inst74Quest3_Level = "80"
Inst74Quest3_Attain = "80"
Inst74Quest3_Aim = "Убейте Малигоса."
Inst74Quest3_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst74Quest3_Note = "Малигоса находится "..YELLOW.." [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst74Quest3_Prequest = "Нет"
Inst74Quest3_Folgequest = "Нет"
--
Inst74Quest3name1 = "Эмблема льда"
Inst74Quest3name2 = "Эмблема триумфа"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst74Quest1_HORDE = Inst74Quest1
Inst74Quest1_HORDE_Level = Inst74Quest1_Level
Inst74Quest1_HORDE_Attain = Inst74Quest1_Attain
Inst74Quest1_HORDE_Aim = Inst74Quest1_Aim
Inst74Quest1_HORDE_Location = Inst74Quest1_Location
Inst74Quest1_HORDE_Note = Inst74Quest1_Note
Inst74Quest1_HORDE_Prequest = Inst74Quest1_Prequest
Inst74Quest1_HORDE_Folgequest = Inst74Quest1_Folgequest
Inst74Quest1PreQuest_HORDE = Inst74Quest1PreQuest
--
Inst74Quest1name1_HORDE = Inst74Quest1name1
Inst74Quest1name2_HORDE = Inst74Quest1name2
Inst74Quest1name3_HORDE = Inst74Quest1name3
Inst74Quest1name4_HORDE = Inst74Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst74Quest2_HORDE = Inst74Quest2
Inst74Quest2_HORDE_Level = Inst74Quest2_Level
Inst74Quest2_HORDE_Attain = Inst74Quest2_Attain
Inst74Quest2_HORDE_Aim = Inst74Quest2_Aim
Inst74Quest2_HORDE_Location = Inst74Quest2_Location
Inst74Quest2_HORDE_Note = Inst74Quest2_Note
Inst74Quest2_HORDE_Prequest = Inst74Quest2_Prequest
Inst74Quest2_HORDE_Folgequest = Inst74Quest2_Folgequest
Inst74Quest2PreQuest_HORDE = Inst74Quest2PreQuest
--
Inst74Quest2name1_HORDE = Inst74Quest2name1
Inst74Quest2name2_HORDE = Inst74Quest2name2
Inst74Quest2name3_HORDE = Inst74Quest2name3
Inst74Quest2name4_HORDE = Inst74Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst74Quest3_HORDE = Inst74Quest3
Inst74Quest3_HORDE_Level = Inst74Quest3_Level
Inst74Quest3_HORDE_Attain = Inst74Quest3_Attain
Inst74Quest3_HORDE_Aim = Inst74Quest3_Aim
Inst74Quest3_HORDE_Location = Inst74Quest3_Location
Inst74Quest3_HORDE_Note = Inst74Quest3_Note
Inst74Quest3_HORDE_Prequest = Inst74Quest3_Prequest
Inst74Quest3_HORDE_Folgequest = Inst74Quest3_Folgequest
--
Inst74Quest3name1_HORDE = Inst74Quest3name1
Inst74Quest3name2_HORDE = Inst74Quest3name2



--------------- INST75 - Azjol-Nerub ---------------

Inst75Story = "Азжол-Неруб был могущественной империей до воцарения Короля-лича в Нордсколе, но когда разразилась война, его защитники не смогли выстоять против натиска Плети, и все нерубы были перебиты.\n\nГоды войны и запустения изменили облик империи; теперь ее обширные территории поделены на два фронта. В Верхнем королевстве нерубы, обращенные в нежить, патрулируют руины своей родины, охраняя кладки яиц, из которых со временем вылупятся новые подданные Короля-лича. В глубинах же Старого королевства, Ан'кахета, затаились Безликие.\n\nНемногое известно об этих внушающих ужас созданиях, но говорят, что они подчиняются злой силе, источник которой находится глубоко под снегами Нордскола. Уничтожение нерубов и их яиц нанесет серьезный удар Королю-личу, но для восстановления погибшей империи также необходимо победить и таинственных Безликих.\n\n"..GREEN.."Цитата с wow-europe.com"
Inst75Caption = "Азжол-Неруб"
Inst75QAA = "2 задания"
Inst75QAH = "2 задания"

--Quest 1 Alliance
Inst75Quest1 = "1. И не забудь про яйца!"
Inst75Quest1_Level = "74"
Inst75Quest1_Attain = "72"
Inst75Quest1_Aim = "Проникните в Азжол-Неруб по просьбе Киликса Разрушителя из Провала Наржуна и уничтожьте 6 нерубских яиц Плети."
Inst75Quest1_Location = "Киликс Разрушитель (Драконий Погост - Азжол-Неруб; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest1_Note = "Нерубские яйца Плети находятся в комнате с первым босом, Крик'тиром Хранителем Врат "..YELLOW.."[1]"..WHITE.."."
Inst75Quest1_Prequest = "Нет"
Inst75Quest1_Folgequest = "Нет"
--
Inst75Quest1name1 = "Expelling Gauntlets"
Inst75Quest1name2 = "Purging Handguards"
Inst75Quest1name3 = "Wraps of Quelled Bane"
Inst75Quest1name4 = "Gloves of Banished Infliction"

--Quest 2 Alliance
Inst75Quest2 = "2. Смерть королю-предателю!"
Inst75Quest2_Level = "74"
Inst75Quest2_Attain = "72"
Inst75Quest2_Aim = "Одержите победу над Ануб'араком из Азжол-Неруба и принесите Киликсу Разрушителю в Провал Наржуна разбитый панцирь Ануб'арака."
Inst75Quest2_Location = "Киликс Разрушитель (Драконий Погост - Азжол-Неруб; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst75Quest2_Note = "Ануб'арак находится "..YELLOW.."[3]"..WHITE.."."
Inst75Quest2_Prequest = "Нет"
Inst75Quest2_Folgequest = "Нет"
--
Inst75Quest2name1 = "Kilix's Silk Slippers"
Inst75Quest2name2 = "Don Soto's Boots"
Inst75Quest2name3 = "Husk Shard Sabatons"
Inst75Quest2name4 = "Greaves of the Traitor"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst75Quest1_HORDE = Inst75Quest1
Inst75Quest1_HORDE_Level = Inst75Quest1_Level
Inst75Quest1_HORDE_Attain = Inst75Quest1_Attain
Inst75Quest1_HORDE_Aim = Inst75Quest1_Aim
Inst75Quest1_HORDE_Location = Inst75Quest1_Location
Inst75Quest1_HORDE_Note = Inst75Quest1_Note
Inst75Quest1_HORDE_Prequest = Inst75Quest1_Prequest
Inst75Quest1_HORDE_Folgequest = Inst75Quest1_Folgequest
--
Inst75Quest1name1_HORDE = Inst75Quest1name1
Inst75Quest1name2_HORDE = Inst75Quest1name2
Inst75Quest1name3_HORDE = Inst75Quest1name3
Inst75Quest1name4_HORDE = Inst75Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst75Quest2_HORDE = Inst75Quest2
Inst75Quest2_HORDE_Level = Inst75Quest2_Level
Inst75Quest2_HORDE_Attain = Inst75Quest2_Attain
Inst75Quest2_HORDE_Aim = Inst75Quest2_Aim
Inst75Quest2_HORDE_Location = Inst75Quest2_Location
Inst75Quest2_HORDE_Note = Inst75Quest2_Note
Inst75Quest2_HORDE_Prequest = Inst75Quest2_Prequest
Inst75Quest2_HORDE_Folgequest = Inst75Quest2_Folgequest
--
Inst75Quest2name1_HORDE = Inst75Quest2name1
Inst75Quest2name2_HORDE = Inst75Quest2name2
Inst75Quest2name3_HORDE = Inst75Quest2name3
Inst75Quest2name4_HORDE = Inst75Quest2name4



--------------- INST76 - Ahn'kahet: The Old Kingdom ---------------

Inst76Story = "Азжол-Неруб был могущественной империей до воцарения Короля-лича в Нордсколе, но когда разразилась война, его защитники не смогли выстоять против натиска Плети, и все нерубы были перебиты.\n\nГоды войны и запустения изменили облик империи; теперь ее обширные территории поделены на два фронта. В Верхнем королевстве нерубы, обращенные в нежить, патрулируют руины своей родины, охраняя кладки яиц, из которых со временем вылупятся новые подданные Короля-лича. В глубинах же Старого королевства, Ан'кахета, затаились Безликие.\n\nНемногое известно об этих внушающих ужас созданиях, но говорят, что они подчиняются злой силе, источник которой находится глубоко под снегами Нордскола. Уничтожение нерубов и их яиц нанесет серьезный удар Королю-личу, но для восстановления погибшей империи также необходимо победить и таинственных Безликих.\n\n"..GREEN.."Цитата с wow-europe.com"
Inst76Caption = "Ан'кахет: Старое Королевство"
Inst76QAA = "3 задания"
Inst76QAH = "3 задания"

--Quest 1 Alliance
Inst76Quest1 = "1. Все хорошо в свое время (Героический ежедневный)"
Inst76Quest1_Level = "80"
Inst76Quest1_Attain = "80"
Inst76Quest1_Aim = "Заполучите труп наблюдателя Ан'кахара по поручению Киликса Разрушителя из Провала Наржуна и поместите его на ан'кахетскую жаровню в Ан'кахете."
Inst76Quest1_Location = "Киликс Разрушитель (Драконий Погост - Азжол-Неруб; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest1_Note = "Это задание выполняется в героическом режиме сложности.\n\nАн'кахетская жаровня находится рядом с Глашатаем Волажем"..YELLOW.."[6]"..WHITE..". Cмерть первого пака у входа (из которого берется труп) установит таймер на один час."
Inst76Quest1_Prequest = "Нет"
Inst76Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst76Quest2 = "2. Странные грибочки"
Inst76Quest2_Level = "76"
Inst76Quest2_Attain = "73"
Inst76Quest2_Aim = "Соберите 6 кусков диковинной плесени с диких пещерных зверей в Ан'кахете и принесите их Киликсу Разрушителю в Провал Наржуна."
Inst76Quest2_Location = "Покрытая слизью плесень (падает с Дикого пещерного зверя в Ан'кахете)"
Inst76Quest2_Note = "Дикие пещерные звери находятся "..YELLOW.."[3]"..WHITE..", в районе героического босса Аманитара. Сдавать Киликсу Разрушителю (Драконий Погост - Азжол-Неруб; "..YELLOW.."26.1, 50.0"..WHITE..")."
Inst76Quest2_Prequest = "Нет"
Inst76Quest2_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 3 Alliance
Inst76Quest3 = "3. Безликие"
Inst76Quest3_Level = "76"
Inst76Quest3_Attain = "73"
Inst76Quest3_Aim = "Убейте глашатая Волажа из Ан'кахета и троих его союзников, известных как Позабытые, по просьбе Киликса Разрушителя из Провала Наржуна."
Inst76Quest3_Location = "Киликс Разрушитель (Драконий Погост - Азжол-Неруб; "..YELLOW.."26.1, 50.0"..WHITE..")"
Inst76Quest3_Note = "Позабытые и Глашатай Волаж находятся "..YELLOW.."[5]"..WHITE.."."
Inst76Quest3_Prequest = "Нет"
Inst76Quest3_Folgequest = "Нет"
--
Inst76Quest3name1 = "Mantle of Thwarted Evil"
Inst76Quest3name2 = "Shoulderpads of Abhorrence"
Inst76Quest3name3 = "Shoulderplates of the Abolished"
Inst76Quest3name4 = "Epaulets of the Faceless Ones"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst76Quest1_HORDE = Inst76Quest1
Inst76Quest1_HORDE_Level = Inst76Quest1_Level
Inst76Quest1_HORDE_Attain = Inst76Quest1_Attain
Inst76Quest1_HORDE_Aim = Inst76Quest1_Aim
Inst76Quest1_HORDE_Location = Inst76Quest1_Location
Inst76Quest1_HORDE_Note = Inst76Quest1_Note
Inst76Quest1_HORDE_Prequest = Inst76Quest1_Prequest
Inst76Quest1_HORDE_Folgequest = Inst76Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst76Quest2_HORDE = Inst76Quest2
Inst76Quest2_HORDE_Level = Inst76Quest2_Level
Inst76Quest2_HORDE_Attain = Inst76Quest2_Attain
Inst76Quest2_HORDE_Aim = Inst76Quest2_Aim
Inst76Quest2_HORDE_Location = Inst76Quest2_Location
Inst76Quest2_HORDE_Note = Inst76Quest2_Note
Inst76Quest2_HORDE_Prequest = Inst76Quest2_Prequest
Inst76Quest2_HORDE_Folgequest = Inst76Quest2_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst76Quest3_HORDE = Inst76Quest3
Inst76Quest3_HORDE_Level = Inst76Quest3_Level
Inst76Quest3_HORDE_Attain = Inst76Quest3_Attain
Inst76Quest3_HORDE_Aim = Inst76Quest3_Aim
Inst76Quest3_HORDE_Location = Inst76Quest3_Location
Inst76Quest3_HORDE_Note = Inst76Quest3_Note
Inst76Quest3_HORDE_Prequest = Inst76Quest3_Prequest
Inst76Quest3_HORDE_Folgequest = Inst76Quest3_Folgequest
--
Inst76Quest3name1_HORDE = Inst76Quest3name1
Inst76Quest3name2_HORDE = Inst76Quest3name2
Inst76Quest3name3_HORDE = Inst76Quest3name3
Inst76Quest3name4_HORDE = Inst76Quest3name4



--------------- INST77 - Ulduar: Halls of Stone ---------------

Inst77Story = "Ульдуар - подземелье расположенное в Грозовой Гряде Нордскола и хранящее информацию о титанах и их деятельности. Непознанное подземное царство льда и камня ждет вас там. Вход в него превосходно спрятан и хорошо охраняется - только самые догадливые смогут попасть внутрь!\n\nЧертоги камня - большое подземелье на 5 человек, является первым подземельем города титанов Ульдуара.\n\n"..GREEN.."Цитата с WoWWiki"
Inst77Caption = "Ульдуар: Чертоги Камня"
Inst77QAA = "1 задания"
Inst77QAH = "1 задания"

--Quest 1 Alliance
Inst77Quest1 = "1. Чертоги Камня"
Inst77Quest1_Level = "78"
Inst77Quest1_Attain = "76"
Inst77Quest1_Aim = "Примите предложение Бранна Бронзоборода и сопровождайте его, пока он раскрывает тайны, хранящиеся в Чертогах Камня."
Inst77Quest1_Location = "Бранн Бронзобород (Ульдуар: Чертоги Камня "..YELLOW.."[3]"..WHITE..")"
Inst77Quest1_Note = "Проследуйте за Бранном Бронзобородом в комнату "..YELLOW.."[4]"..WHITE.." и защитите его от монстров пока он работает с каменными табличками. Когда монстры закончатся, Сундук Трибунала будет открыт.\n\nОн побежит к двери "..YELLOW.."[5]"..WHITE..". Вы можете не торопиться, он подождет у двери. Поговорите с ним. Когда вы убьете Сьоннира Литейщика, задание будет выполнено и его можно будет сдать Бранну Бронзобороду."
Inst77Quest1_Prequest = "Нет"
Inst77Quest1_Folgequest = "Нет"
--
Inst77Quest1name1 = "Mantle of the Intrepid Explorer"
Inst77Quest1name2 = "Shoulderpads of the Adventurer"
Inst77Quest1name3 = "Spaulders of Lost Secrets"
Inst77Quest1name4 = "Pauldrons of Reconnaissance"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst77Quest1_HORDE = Inst77Quest1
Inst77Quest1_HORDE_Level = Inst77Quest1_Level
Inst77Quest1_HORDE_Attain = Inst77Quest1_Attain
Inst77Quest1_HORDE_Aim = Inst77Quest1_Aim
Inst77Quest1_HORDE_Location = Inst77Quest1_Location
Inst77Quest1_HORDE_Note = Inst77Quest1_Note
Inst77Quest1_HORDE_Prequest = Inst77Quest1_Prequest
Inst77Quest1_HORDE_Folgequest = Inst77Quest1_Folgequest
--
Inst77Quest1name1_HORDE = Inst77Quest1name1
Inst77Quest1name2_HORDE = Inst77Quest1name2
Inst77Quest1name3_HORDE = Inst77Quest1name3
Inst77Quest1name4_HORDE = Inst77Quest1name4



--------------- INST78 - Ulduar: Halls of Lightning ---------------

Inst78Story = "Ульдуар - подземелье расположенное в Грозовой Гряде Нордскола и хранящее информацию о титанах и их деятельности. Непознанное подземное царство льда и камня ждет вас там. Вход в него превосходно спрятан и хорошо охраняется - только самые догадливые смогут попасть внутрь!\n\nЧертоги молний - второе подземелье на 5 человек, города титанов Ульдуара.\n\n"..GREEN.."Цитата с WoWWiki"
Inst78Caption = "Ульдуар: Чертоги Молний"
Inst78QAA = "2 задания"
Inst78QAH = "2 задания"

--Quest 1 Alliance
Inst78Quest1 = "1. Любой ценой!"
Inst78Quest1_Level = "80"
Inst78Quest1_Attain = "80"
Inst78Quest1_Aim = "Отправляйтесь в Чертоги Молний и убейте Локена. Потом возвращайтесь к королю Йоккуму в Дун Ниффелем и отдайте ему язык Локена."
Inst78Quest1_Location = "Король Йоккум (Грозовая Гряда - Дун Ниффелем; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest1_Note = "Локен находится "..YELLOW.."[4]"..WHITE.."."
Inst78Quest1_Prequest = "Свидетель"
Inst78Quest1_Folgequest = "Нет"
Inst78Quest1PreQuest = "true"
--
Inst78Quest1name1 = "Robes of Lightning"
Inst78Quest1name2 = "Hardened Tongue Tunic"
Inst78Quest1name3 = "Lightningbringer's Hauberk"
Inst78Quest1name4 = "Breastplate of Jagged Stone"

--Quest 2 Alliance
Inst78Quest2 = "2. Диаметральные противоположности"
Inst78Quest2_Level = "80"
Inst78Quest2_Attain = "80"
Inst78Quest2_Aim = "Отправляйтесь в Чертоги Молний и убейте Волхана по поручению короля Йоккума из Дун Ниффелема."
Inst78Quest2_Location = "Король Йоккум (Грозовая Гряда - Дун Ниффелем; "..YELLOW.."65.3, 60.1"..WHITE..")"
Inst78Quest2_Note = "Волхан находится "..YELLOW.."[2]"..WHITE.."."
Inst78Quest2_Prequest = "Нет"
Inst78Quest2_Folgequest = "Нет"
Inst78Quest2PreQuest = "true"
--
Inst78Quest2name1 = "Lightning Infused Mantle"
Inst78Quest2name2 = "Charred Leather Shoulderguards"
Inst78Quest2name3 = "Stormforged Shoulders"
Inst78Quest2name4 = "Pauldrons of Extinguished Hatred"
Inst78Quest2name5 = "Mantle of Volkhan"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst78Quest1_HORDE = Inst78Quest1
Inst78Quest1_HORDE_Level = Inst78Quest1_Level
Inst78Quest1_HORDE_Attain = Inst78Quest1_Attain
Inst78Quest1_HORDE_Aim = Inst78Quest1_Aim
Inst78Quest1_HORDE_Location = Inst78Quest1_Location
Inst78Quest1_HORDE_Note = Inst78Quest1_Note
Inst78Quest1_HORDE_Prequest = Inst78Quest1_Prequest
Inst78Quest1_HORDE_Folgequest = Inst78Quest1_Folgequest
Inst78Quest1PreQuest_HORDE = Inst78Quest1PreQuest
--
Inst78Quest1name1_HORDE = Inst78Quest1name1
Inst78Quest1name2_HORDE = Inst78Quest1name2
Inst78Quest1name3_HORDE = Inst78Quest1name3
Inst78Quest1name4_HORDE = Inst78Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst78Quest2_HORDE = Inst78Quest2
Inst78Quest2_HORDE_Level = Inst78Quest2_Level
Inst78Quest2_HORDE_Attain = Inst78Quest2_Attain
Inst78Quest2_HORDE_Aim = Inst78Quest2_Aim
Inst78Quest2_HORDE_Location = Inst78Quest2_Location
Inst78Quest2_HORDE_Note = Inst78Quest2_Note
Inst78Quest2_HORDE_Prequest = Inst78Quest2_Prequest
Inst78Quest2_HORDE_Folgequest = Inst78Quest2_Folgequest
Inst78Quest2PreQuest_HORDE = Inst78Quest2PreQuest
--
Inst78Quest2name1_HORDE = Inst78Quest2name1
Inst78Quest2name2_HORDE = Inst78Quest2name2
Inst78Quest2name3_HORDE = Inst78Quest2name3
Inst78Quest2name4_HORDE = Inst78Quest2name4
Inst78Quest2name5_HORDE = Inst78Quest2name5



--------------- INST79 - The Obsidian Sanctum ---------------

Inst79Story = {
  ["Page1"] = "Храм Драконьего Покоя стоит на древнем тракте, пересекающем мерзлые земли Драконьего Погоста с севера на юг. Здесь, в царстве хаоса, Храм остается последним пристанищем надежды. Из заветного Храма открываются двери в пять священных обителей, где обитают драконьи роды. Если верить легенде, здесь титаны наделили драконов могуществом и повелели пестовать юный мир. Сегодня лишь четыре древних драконьих рода выполняют свой долг перед Азеротом. Чертоги остаются надежным укрытием, хотя однажды они и были осквернены предательством. Предательство это наложило неизгладимый след на всю историю драконов.",
  ["Page2"] = "Более десяти тысяч лет назад предводитель черных драконов Нелтарион призвал представителей других родов в чертоги и убедил их пожертвовать частицу своих сущностей для создания могущественного артефакта – Души Дракона. Пообещав, что воспользуется им для изгнания Пылающего Легиона из Азерота, Нелтарион обманул своих товарищей: он не вложил в него ни капли собственной сущности. В решающий момент битвы с Легионом Нелтарион раскрыл свой истинный замысел и обратил Душу Дракона против доверившихся ему собратьев, которые слишком поздно осознали, что стали жертвами обмана. С тех пор похитивший силы драконов Нелтарион получил новое имя: Смертокрыл.",
  ["Page3"] = "В замыслы злодея входило обессилить и подчинить своей воле остальных драконов, а после и весь Азерот. Но лишь только Смертокрыл приблизился к исполнению своего плана, Душа Дракона – ныне известная как Душа Демона – была разрушена, а наполнявшая ее энергия вернулась к драконам. Обретя свою полную силу, разгневанные драконы сплотились против Смертокрыла, и ему пришлось затаиться. Хотя Смертокрыл и вынужден был скрываться, черные драконы продолжали подлое начинание своего вожака. Род черных драконов, ненавидимый и гонимый за злодеяния Смертокрыла, начал редеть, и тогда его предводитель стал искать средства восстановить численность сородичей. Тем временем подручные Смертокрыла начали выводить новый могущественный вид драконов.",
  ["Page4"] = "Первой успеха добилась Синестра, первая супруга Смертокрыла. В глубинах Грим Батола ей удалось создать нескольких драконов невероятной силы: это были сумеречные драконы. Однако ее эксперименты привлекли слишком пристальное внимания всего Азерота к Грим Батолу. Вскоре в ее логово вторглись, Синестра погибла, и ее черным делам пришел конец.",
  ["Page5"] = "Все это время Смертокрыл продолжал оставаться в тени. Его продолжительное отсутствие заставило многих предположить, что Синестра действовала в одиночку, но недавно обнаруженная в Драконьих чертогах кладка сумеречных яиц наводит на подозрение, что Смертокрыл принимал участие в создании злобных драконов. Могущественный страж – Сартарион – зорко приглядывает за яйцами в покоях черных драконов – Обсидиановом святилище. Если догадки о причастности Смертокрыла к выведению нового вида драконов верны, весь Азерот вскоре ожидает мрачная эпоха... Эпоха сумерек...",
["MaxPages"] = "5",
};
Inst79Caption = "Обсидиановое Святилище"
Inst79QAA = "1 задание"
Inst79QAH = "1 задание"

--Quest 1 Alliance
Inst79Quest1 = "1. Сартарион должен умереть! (Еженедельный)"
Inst79Quest1_Level = "80"
Inst79Quest1_Attain = "80"
Inst79Quest1_Aim = "Убейте Сартариона."
Inst79Quest1_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst79Quest1_Note = "Сартарион находится "..YELLOW.."[4]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst79Quest1_Prequest = "Нет"
Inst79Quest1_Folgequest = "Нет"
--
Inst79Quest1name1 = "Эмблема льда"
Inst79Quest1name2 = "Эмблема триумфа"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst79Quest1_HORDE = Inst79Quest1
Inst79Quest1_HORDE_Level = Inst79Quest1_Level
Inst79Quest1_HORDE_Attain = Inst79Quest1_Attain
Inst79Quest1_HORDE_Aim = Inst79Quest1_Aim
Inst79Quest1_HORDE_Location = Inst79Quest1_Location
Inst79Quest1_HORDE_Note = Inst79Quest1_Note
Inst79Quest1_HORDE_Prequest = Inst79Quest1_Prequest
Inst79Quest1_HORDE_Folgequest = Inst79Quest1_Folgequest
--
Inst79Quest1name1_HORDE = Inst79Quest1name1
Inst79Quest1name2_HORDE = Inst79Quest1name2



--------------- INST80 - Drak'Tharon Keep ---------------

Inst80Story = "К северу от зеленеющих лесов Седых Холмов расположена крепость Драк'Тарон, древний оплот Драккари. Некогда она служила пограничным форпостом ледяных троллей, но во время нашествия Плети Драк'Тарон захватили воины Короля-лича. Превращенный в гарнизон нежити, Драк'Тарон стал самой горькой утратой ледяных троллей. Трупы драккари, усеявшие крепость, символизируют мрачное будущее империи. Многие из павших защитников Драк'Тарона стали приспешниками Короля-лича и теперь патрулируют окрестности крепости и нападают на тех, кто отважится приблизиться к ней.\n\n"..GREEN.."Цитата с wow-europe.com"
Inst80Caption = "Крепость Драк'Тарон"
Inst80QAA = "3 задания"
Inst80QAH = "3 задания"

--Quest 1 Alliance
Inst80Quest1 = "1. Очищение Драк'Тарона"
Inst80Quest1_Level = "75"
Inst80Quest1_Attain = "73"
Inst80Quest1_Aim = "Дракуру просит вас выпить эликсир возле его жаровни в Драк'Тароне. Для использования эликсира вам понадобится пять настоев терпения."
Inst80Quest1_Location = "Проекция Дракуру"
Inst80Quest1_Note = "Жаровня Дракуру находится около Пророка Тарон'джи "..YELLOW.."[6]"..WHITE..". Настои терпения падают в Крепости Драк'Тарон."
Inst80Quest1_Prequest = "Перемирие? -> Голоса прошлого"
Inst80Quest1_Folgequest = "Нет"
Inst80Quest1PreQuest = "true"
--
Inst80Quest1name1 = "Shroud of Temptation"
Inst80Quest1name2 = "Enticing Sabatons"
Inst80Quest1name3 = "Shackles of Dark Whispers"
Inst80Quest1name4 = "Shoulders of the Seducer"

--Quest 2 Alliance
Inst80Quest2 = "2. Спасательная операция"
Inst80Quest2_Level = "74"
Inst80Quest2_Attain = "73"
Inst80Quest2_Aim = "Мак из Гранитных ключей просит вас отправиться в Драк'Тарон и узнать, все ли в порядке с Курцель."
Inst80Quest2_Location = "Мак Фирсен (Седые холмы - Гранитные ключи; "..YELLOW.."16.6, 48.1"..WHITE..")"
Inst80Quest2_Note = "Курцель находится в одной из паутин в комнате после Кровотролля "..YELLOW.."[2]"..WHITE.."."
Inst80Quest2_Prequest = "Пылающая Плеть"
Inst80Quest2_Folgequest = "Игры разума"
Inst80Quest2PreQuest = "true"
--
Inst80Quest2name1 = "Kurzel's Angst"
Inst80Quest2name2 = "Kurzel's Rage"
Inst80Quest2name3 = "Kurzel's Warband"

--Quest 3 Alliance
Inst80Quest3 = "3. Игры разума"
Inst80Quest3_Level = "74"
Inst80Quest3_Attain = "73"
Inst80Quest3_Aim = "Курцель просит вас приложить клочок ее рубахи к трупу Новоса Призывателя, после чего отнести запятнанную лимфой ткань Маку."
Inst80Quest3_Location = "Курцель (Крепость Драк'Тарон; "..YELLOW.."[2]"..WHITE..")"
Inst80Quest3_Note = "Новос Призыватель находится "..YELLOW.."[3]"..WHITE..". Мак Фирсен (Седые холмы - Гранитные ключи; "..YELLOW.."16.6, 48.1"..WHITE..")"
Inst80Quest3_Prequest = "Спасательная операция"
Inst80Quest3_Folgequest = "Нет"
Inst80Quest3FQuest = "true"
--
Inst80Quest3name1 = "Shameful Cuffs"
Inst80Quest3name2 = "Scorned Bands"
Inst80Quest3name3 = "Accused Wristguards"
Inst80Quest3name4 = "Disavowed Bracers"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst80Quest1_HORDE = Inst80Quest1
Inst80Quest1_HORDE_Level = Inst80Quest1_Level
Inst80Quest1_HORDE_Attain = Inst80Quest1_Attain
Inst80Quest1_HORDE_Aim = Inst80Quest1_Aim
Inst80Quest1_HORDE_Location = Inst80Quest1_Location
Inst80Quest1_HORDE_Note = Inst80Quest1_Note
Inst80Quest1_HORDE_Prequest = Inst80Quest1_Prequest
Inst80Quest1_HORDE_Folgequest = Inst80Quest1_Folgequest
Inst80Quest1PreQuest_HORDE = Inst80Quest1PreQuest
--
Inst80Quest1name1_HORDE = Inst80Quest1name1
Inst80Quest1name2_HORDE = Inst80Quest1name2
Inst80Quest1name3_HORDE = Inst80Quest1name3
Inst80Quest1name4_HORDE = Inst80Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst80Quest2_HORDE = Inst80Quest2
Inst80Quest2_HORDE_Level = Inst80Quest2_Level
Inst80Quest2_HORDE_Attain = Inst80Quest2_Attain
Inst80Quest2_HORDE_Aim = Inst80Quest2_Aim
Inst80Quest2_HORDE_Location = Inst80Quest2_Location
Inst80Quest2_HORDE_Note = Inst80Quest2_Note
Inst80Quest2_HORDE_Prequest = Inst80Quest2_Prequest
Inst80Quest2_HORDE_Folgequest = Inst80Quest2_Folgequest
Inst80Quest2PreQuest_HORDE = Inst80Quest2PreQuest
--
Inst80Quest2name1_HORDE = Inst80Quest2name1
Inst80Quest2name2_HORDE = Inst80Quest2name2
Inst80Quest2name3_HORDE = Inst80Quest2name3

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst80Quest3_HORDE = Inst80Quest3
Inst80Quest3_HORDE_Level = Inst80Quest3_Level
Inst80Quest3_HORDE_Attain = Inst80Quest3_Attain
Inst80Quest3_HORDE_Aim = Inst80Quest3_Aim
Inst80Quest3_HORDE_Location = Inst80Quest3_Location
Inst80Quest3_HORDE_Note = Inst80Quest3_Note
Inst80Quest3_HORDE_Prequest = Inst80Quest3_Prequest
Inst80Quest3_HORDE_Folgequest = Inst80Quest3_Folgequest
Inst80Quest3FQuest_HORDE = Inst80Quest3FQuest
--
Inst80Quest3name1_HORDE = Inst80Quest3name1
Inst80Quest3name2_HORDE = Inst80Quest3name2
Inst80Quest3name3_HORDE = Inst80Quest3name3
Inst80Quest3name4_HORDE = Inst80Quest3name4



--------------- INST81 - Gundrak ---------------

Inst81Story = "Гундрак - столица ледяных троллей. Подземелье находится в Зул'Драке и имеет три входа. Драккари управляли Зул'Драком от сюда, сражаясь с могучими силами Плети. В этом подземелье вы увидите Ледяных Троллей во всей красе, а также сразитесь с их лидером и, может быть, поймете, почему они так успешно борются с Плетью.\n\n"..GREEN.."Цитата с WoWWiki"
Inst81Caption = "Гундрак"
Inst81QAA = "3 задания"
Inst81QAH = "3 задания"

--Quest 1 Alliance
Inst81Quest1 = "1. Для наших потомков"
Inst81Quest1_Level = "78"
Inst81Quest1_Attain = "76"
Inst81Quest1_Aim = "Отправляйтесь в Гундрак и заберите оттуда 6 табличек с летописью Драккари по поручению летописца Ба'Кини из Дубра'джина. "
Inst81Quest1_Location = "Летописец Ба'Кини (Зул'Драк - Дубра'джин; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest1_Note = "Таблички лежат по всему подземелью. Их хватит даже если у всей группы будет это задание. Задание дается, даже если не сделано предыдущее."
Inst81Quest1_Prequest = "Просто проверка"
Inst81Quest1_Folgequest = "Нет"
Inst81Quest1PreQuest = "true"
--
Inst81Quest1name1 = "Lion's Head Ring"
Inst81Quest1name2 = "Ring of Foul Mojo"
Inst81Quest1name3 = "Solid Platinum Band"
Inst81Quest1name4 = "Voodoo Signet"

--Quest 2 Alliance
Inst81Quest2 = "2. Гал'дара заплатит за все"
Inst81Quest2_Level = "78"
Inst81Quest2_Attain = "76"
Inst81Quest2_Aim = "Отправляйтесь в Гундрак и убейте Гал'дара по поручению Тол'мара из Дубра'джина. "
Inst81Quest2_Location = "Тол'мар (Зул'Драк - Дубра'джин; "..YELLOW.."69.9, 22.8"..WHITE..")"
Inst81Quest2_Note = "Гал'дара находится "..YELLOW.."[5]"..WHITE.."."
Inst81Quest2_Prequest = "Незаконченное дело"
Inst81Quest2_Folgequest = "Нет"
Inst81Quest2PreQuest = "true"
--
Inst81Quest2name1 = "Sly Mojo Sash"
Inst81Quest2name2 = "Strange Voodoo Belt"
Inst81Quest2name3 = "Ranger's Belt of the Fallen Empire"
Inst81Quest2name4 = "Clasp of the Fallen Demi-God"

--Quest 3 Alliance
Inst81Quest3 = "3. Единственный в своем роде"
Inst81Quest3_Level = "78"
Inst81Quest3_Attain = "76"
Inst81Quest3_Aim = "Отправляйтесь в Гундрак, добудьте обломок колосса Драккари и отнесите его летописцу Ба'Кини в Дубра'джин."
Inst81Quest3_Location = "Летописец Ба'Кини (Зул'Драк - Дубра'джин; "..YELLOW.."70.0, 20.9"..WHITE..")"
Inst81Quest3_Note = "Падает с Элементаля Драккари."
Inst81Quest3_Prequest = "Нет"
Inst81Quest3_Folgequest = "Нет"
--
Inst81Quest3name1 = "Fur-lined Moccasins"
Inst81Quest3name2 = "Rhino Hide Kneeboots"
Inst81Quest3name3 = "Scaled Boots of Fallen Hope"
Inst81Quest3name4 = "Slippers of the Mojo Dojo"
Inst81Quest3name5 = "Trollkickers"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst81Quest1_HORDE = Inst81Quest1
Inst81Quest1_HORDE_Level = Inst81Quest1_Level
Inst81Quest1_HORDE_Attain = Inst81Quest1_Attain
Inst81Quest1_HORDE_Aim = Inst81Quest1_Aim
Inst81Quest1_HORDE_Location = Inst81Quest1_Location
Inst81Quest1_HORDE_Note = Inst81Quest1_Note
Inst81Quest1_HORDE_Prequest = Inst81Quest1_Prequest
Inst81Quest1_HORDE_Folgequest = Inst81Quest1_Folgequest
Inst81Quest1PreQuest_HORDE = Inst81Quest1PreQuest
--
Inst81Quest1name1_HORDE = Inst81Quest1name1
Inst81Quest1name2_HORDE = Inst81Quest1name2
Inst81Quest1name3_HORDE = Inst81Quest1name3
Inst81Quest1name4_HORDE = Inst81Quest1name4

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst81Quest2_HORDE = Inst81Quest2
Inst81Quest2_HORDE_Level = Inst81Quest2_Level
Inst81Quest2_HORDE_Attain = Inst81Quest2_Attain
Inst81Quest2_HORDE_Aim = Inst81Quest2_Aim
Inst81Quest2_HORDE_Location = Inst81Quest2_Location
Inst81Quest2_HORDE_Note = Inst81Quest2_Note
Inst81Quest2_HORDE_Prequest = Inst81Quest2_Prequest
Inst81Quest2_HORDE_Folgequest = Inst81Quest2_Folgequest
Inst81Quest2PreQuest_HORDE = Inst81Quest2PreQuest
--
Inst81Quest2name1_HORDE = Inst81Quest2name1
Inst81Quest2name2_HORDE = Inst81Quest2name2
Inst81Quest2name3_HORDE = Inst81Quest2name3
Inst81Quest2name4_HORDE = Inst81Quest2name4

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst81Quest3_HORDE = Inst81Quest3
Inst81Quest3_HORDE_Level = Inst81Quest3_Level
Inst81Quest3_HORDE_Attain = Inst81Quest3_Attain
Inst81Quest3_HORDE_Aim = Inst81Quest3_Aim
Inst81Quest3_HORDE_Location = Inst81Quest3_Location
Inst81Quest3_HORDE_Note = Inst81Quest3_Note
Inst81Quest3_HORDE_Prequest = Inst81Quest3_Prequest
Inst81Quest3_HORDE_Folgequest = Inst81Quest3_Folgequest
--
Inst81Quest3name1_HORDE = Inst81Quest3name1
Inst81Quest3name2_HORDE = Inst81Quest3name2
Inst81Quest3name3_HORDE = Inst81Quest3name3
Inst81Quest3name4_HORDE = Inst81Quest3name4
Inst81Quest3name5_HORDE = Inst81Quest3name5



--------------- INST82 - The Violet Hold ---------------

Inst82Story = "Малигос наслал подвластное ему племя синих драконов на Даларан. В ходе этого неожиданного и жестокого нападения захватчики проделали огромную щель в крыше Аметистовой Крепости и начали проникать через порталы внутрь тюрьмы, испытывая ее прочность и подвергая опасности всех жителей города. Ошеломленные столь отчаянным нападением, члены Кирин-Тора обратились за помощью к героям Орды и Альянса, прося их как можно быстрее положить конец вторжению.\n\n"..GREEN.."Цитата с wow-europe.com"
Inst82Caption = "Аметистовая Крепость"
Inst82QAA = "2 задания"
Inst82QAH = "2 задания"

--Quest 1 Alliance
Inst82Quest1 = "1. Главное – скрытность"
Inst82Quest1_Level = "77"
Inst82Quest1_Attain = "75"
Inst82Quest1_Aim = "Отправляйтесь в Аметистовую крепость в Даларане и поговорите с тюремщиком Альтурасом по поручению Ронина."
Inst82Quest1_Location = "Ронин (Даларан - Аметистовая цитадель; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst82Quest1_Note = "Тюремщик Альтурас находится (Даларан - Аметистовая Крепость; "..YELLOW.."60.8, 62.7"..WHITE..")"
Inst82Quest1_Prequest = "Нет"
Inst82Quest1_Folgequest = "Сдерживание"
-- No Rewards for this quest

--Quest 2 Alliance
Inst82Quest2 = "2. Сдерживание"
Inst82Quest2_Level = "77"
Inst82Quest2_Attain = "75"
Inst82Quest2_Aim = "Проникните по заданию тюремщика Альтураса в Аметистовую крепость и покончите с атакующими силами синих драконов. Вернитесь к нему с докладом, когда Синигоса будет повержена."
Inst82Quest2_Location = "Тюремщик Альтурас находится (Даларан - Аметистовая Крепость; "..YELLOW.."60.8, 62.7"..WHITE..")"
Inst82Quest2_Note = "Синигоса находится "..YELLOW.."[6]"..WHITE.."."
Inst82Quest2_Prequest = "Главное – скрытность"
Inst82Quest2_Folgequest = "Нет"
Inst82Quest2FQuest = "true"
--
Inst82Quest2name1 = "Tattooed Deerskin Leggings"
Inst82Quest2name2 = "Conferred Pantaloons"
Inst82Quest2name3 = "Labyrinthine Legguards"
Inst82Quest2name4 = "Dalaran Warden's Legplates"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst82Quest1_HORDE = Inst82Quest1
Inst82Quest1_HORDE_Level = Inst82Quest1_Level
Inst82Quest1_HORDE_Attain = Inst82Quest1_Attain
Inst82Quest1_HORDE_Aim = Inst82Quest1_Aim
Inst82Quest1_HORDE_Location = Inst82Quest1_Location
Inst82Quest1_HORDE_Note = Inst82Quest1_Note
Inst82Quest1_HORDE_Prequest = Inst82Quest1_Prequest
Inst82Quest1_HORDE_Folgequest = Inst82Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst82Quest2_HORDE = Inst82Quest2
Inst82Quest2_HORDE_Level = Inst82Quest2_Level
Inst82Quest2_HORDE_Attain = Inst82Quest2_Attain
Inst82Quest2_HORDE_Aim = Inst82Quest2_Aim
Inst82Quest2_HORDE_Location = Inst82Quest2_Location
Inst82Quest2_HORDE_Note = Inst82Quest2_Note
Inst82Quest2_HORDE_Prequest = Inst82Quest2_Prequest
Inst82Quest2_HORDE_Folgequest = Inst82Quest2_Folgequest
Inst82Quest2FQuest_HORDE = Inst82Quest2FQuest
--
Inst82Quest2name1_HORDE = Inst82Quest2name1
Inst82Quest2name2_HORDE = Inst82Quest2name2
Inst82Quest2name3_HORDE = Inst82Quest2name3
Inst82Quest2name4_HORDE = Inst82Quest2name4



--------------- INST84 - Naxxramas (Naxx) ---------------

Inst84Story = {
  ["Page1"] = "Когда-то давно войско нежити во главе с владыкой склепа Ануб'араком захватила древний нерубский зиккурат, ныне известный как Наксрамас. По воле Короля-лича цитадель превратилась в мощное орудие войны. Пока Накрсамас набирал силу, Король-лич искал того, кто сможет управлять его новым оружием, и наконец выбрал верховного мага Кирин-Тора - Кел'Тузада, легко обратившегося к порче. Темные мысли наполнили Кел'Тузада, и, поддавшись на заманчивые обещания знаний и власти, он направился в мерзлый Нордскол.",
  ["Page2"] = "В обмен на столь желаемые бессмертие и невероятную силу Кел'Тузад отрекся от своей человечности и поклялся в верности Королю-личу. Верховному магу поручили командование Наксрамасом, и прямо у него на глазах темная магия вырвала крепость Плети из-под земли и подняла ее в небо над Азеротом. Окутанный облаками, Наксрамас выполнял мрачные приказы своего повелителя, и в его залах раздавалось эхо войны. Помимо осадных орудий и боеприпасов зараженная чумой цитадель перевозила создаваемых там же поганищ и рыцарей смерти. Переродившийся в лича Кел’Тузад наблюдал за войной из ледяных залов некрополя и готовился к концу света, причиной которого станет его крепость.",
  ["Page3"] = "По приказу Короля-лича все зло, зревшее в недрах Наксрамаса, обрушилось с неба на Восточные Чумные Земли. Многие отважные герои штурмовали цитадель в надежде остановить разложение, но немногие смогли уцелеть. Но со временем мудрость, отвага и сила помогли защитникам Азерота одолеть Наксрамас. Победа была значительной, но, к сожалению, она не смогла надолго остановить Плеть. Герои, что убили Кел’Тузада и его союзников, вскоре узнали, что истинное зло не так просто уничтожить.",
  ["Page4"] = "Наксрамас вновь появился, но уже над истерзанными войной землями Драконьего Погоста. После первого падения некрополя Плеть нашла проклятые останки Кел’Тузада, и теперь бывший верховный маг вновь командует летучей крепостью. Восседая на заиндевелом троне, злобный лич руководит осадой Крепости Стражей Зимы, начавшейся после смелой атаки на врата Ледяной Короны.",
  ["MaxPages"] = "4",
};
Inst84Caption = "Наксрамас"
Inst84QAA = "6 задания"
Inst84QAH = "6 задания"

--Quest 1 Alliance
Inst84Quest1 = "1. Ключ к Радужному Средоточию"
Inst84Quest1_Level = "80"
Inst84Quest1_Attain = "80"
Inst84Quest1_Aim = "Отнесите ключ от Радужного Средоточия Алекстразе Хранительнице Жизни на вершине храма Драконьего Покоя в Драконьем Погосте."
Inst84Quest1_Location = "Ключ к Радужному Средоточию (падает с Сапфирона; "..YELLOW.."Логово Ледяного змея [1]"..WHITE..")"
Inst84Quest1_Note = "Алекстраза Хранительница Жизни (Драконий Погост - Храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE.."). Наградой за выполнение задания будет возможность посетить 'Нексус: Око Вечности' в нормальном режиме на 10 человек."
Inst84Quest1_Prequest = "Нет"
Inst84Quest1_Folgequest = "Правосудие в Оке Вечности ("..YELLOW.."Нексус: Око Вечности"..WHITE..")"
--
Inst84Quest1name1 = "Key to the Focusing Iris"

--Quest 2 Alliance
Inst84Quest2 = "2. Ключ к Радужному Средоточию (героический режим)"
Inst84Quest2_Level = "80"
Inst84Quest2_Attain = "80"
Inst84Quest2_Aim = "Отнесите ключ от Радужного Средоточия (героический режим) Алекстразе Хранительнице Жизни на вершине храма Драконьего Покоя в Драконьем Погосте."
Inst84Quest2_Location = "Ключ для доступа к героическому режиму Радужного Средоточия (падает с Сапфирона; "..YELLOW.."Логово Ледяного змея [1]"..WHITE..")"
Inst84Quest2_Note = "Алекстраза Хранительница Жизни (Драконий Погост - Храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE.."). Наградой за выполнение задания будет возможность посетить 'Нексус: Око Вечности' в героическом режиме на 25 человек."
Inst84Quest2_Prequest = "Нет"
Inst84Quest2_Folgequest = "Правосудие в Оке Вечности ("..YELLOW.."Нексус: Око Вечности"..WHITE..")"
--
Inst84Quest2name1 = "Heroic Key to the Focusing Iris"

--Quest 3 Alliance
Inst84Quest3 = "3. Ануб'Рекан должен умереть! (Еженедельный)"
Inst84Quest3_Level = "80"
Inst84Quest3_Attain = "80"
Inst84Quest3_Aim = "Убейте Ануб'Рекана."
Inst84Quest3_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest3_Note = "Ануб'Рекан находится "..YELLOW.."Паучий квартал [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst84Quest3_Prequest = "Нет"
Inst84Quest3_Folgequest = "Нет"
--
Inst84Quest3name1 = "Эмблема льда"
Inst84Quest3name2 = "Эмблема триумфа"

--Quest 4 Alliance
Inst84Quest4 = "4. Инструктор Разувий должен умереть! (Еженедельный)"
Inst84Quest4_Level = "80"
Inst84Quest4_Attain = "80"
Inst84Quest4_Aim = "Убейте Инструктора Разувия."
Inst84Quest4_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest4_Note = "Инструктор Разувий находится "..YELLOW.."Военный квартал [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst84Quest4_Prequest = "Нет"
Inst84Quest4_Folgequest = "Нет"
--
Inst84Quest4name1 = "Эмблема льда"
Inst84Quest4name2 = "Эмблема триумфа"

--Quest 5 Alliance
Inst84Quest5 = "5. Нот Чумной должен умереть! (Еженедельный)"
Inst84Quest5_Level = "80"
Inst84Quest5_Attain = "80"
Inst84Quest5_Aim = "Убейте Нота Чумного."
Inst84Quest5_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest5_Note = "Нот Чумной находится "..YELLOW.."Чумной квартал [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst84Quest5_Prequest = "Нет"
Inst84Quest5_Folgequest = "Нет"
--
Inst84Quest5name1 = "Эмблема льда"
Inst84Quest5name2 = "Эмблема триумфа"

--Quest 6 Alliance
Inst84Quest6 = "6. Лоскутик должен умереть! (Еженедельный)"
Inst84Quest6_Level = "80"
Inst84Quest6_Attain = "80"
Inst84Quest6_Aim = "Убейте Лоскутика."
Inst84Quest6_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst84Quest6_Note = "Лоскутик находится "..YELLOW.."Квартал мерзости [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst84Quest6_Prequest = "Нет"
Inst84Quest6_Folgequest = "Нет"
--
Inst84Quest6name1 = "Эмблема льда"
Inst84Quest6name2 = "Эмблема триумфа"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst84Quest1_HORDE = Inst84Quest1
Inst84Quest1_HORDE_Level = Inst84Quest1_Level
Inst84Quest1_HORDE_Attain = Inst84Quest1_Attain
Inst84Quest1_HORDE_Aim = Inst84Quest1_Aim
Inst84Quest1_HORDE_Location = Inst84Quest1_Location
Inst84Quest1_HORDE_Note = Inst84Quest1_Note
Inst84Quest1_HORDE_Prequest = Inst84Quest1_Prequest
Inst84Quest1_HORDE_Folgequest = Inst84Quest1_Folgequest
--
Inst84Quest1name1_HORDE = Inst84Quest1name1

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst84Quest2_HORDE = Inst84Quest2
Inst84Quest2_HORDE_Level = Inst84Quest2_Level
Inst84Quest2_HORDE_Attain = Inst84Quest2_Attain
Inst84Quest2_HORDE_Aim = Inst84Quest2_Aim
Inst84Quest2_HORDE_Location = Inst84Quest2_Location
Inst84Quest2_HORDE_Note = Inst84Quest2_Note
Inst84Quest2_HORDE_Prequest = Inst84Quest2_Prequest
Inst84Quest2_HORDE_Folgequest = Inst84Quest2_Folgequest
--
Inst84Quest2name1_HORDE = Inst84Quest2name1

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst84Quest3_HORDE = Inst84Quest3
Inst84Quest3_HORDE_Level = Inst84Quest3_Level
Inst84Quest3_HORDE_Attain = Inst84Quest3_Attain
Inst84Quest3_HORDE_Aim = Inst84Quest3_Aim
Inst84Quest3_HORDE_Location = Inst84Quest3_Location
Inst84Quest3_HORDE_Note = Inst84Quest3_Note
Inst84Quest3_HORDE_Prequest = Inst84Quest3_Prequest
Inst84Quest3_HORDE_Folgequest = Inst84Quest3_Folgequest
--
Inst84Quest3name1_HORDE = Inst84Quest3name1
Inst84Quest3name2_HORDE = Inst84Quest3name2

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst84Quest4_HORDE = Inst84Quest4
Inst84Quest4_HORDE_Level = Inst84Quest4_Level
Inst84Quest4_HORDE_Attain = Inst84Quest4_Attain
Inst84Quest4_HORDE_Aim = Inst84Quest4_Aim
Inst84Quest4_HORDE_Location = Inst84Quest4_Location
Inst84Quest4_HORDE_Note = Inst84Quest4_Note
Inst84Quest4_HORDE_Prequest = Inst84Quest4_Prequest
Inst84Quest4_HORDE_Folgequest = Inst84Quest4_Folgequest
--
Inst84Quest4name1_HORDE = Inst84Quest4name1
Inst84Quest4name2_HORDE = Inst84Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst84Quest5_HORDE = Inst84Quest5
Inst84Quest5_HORDE_Level = Inst84Quest5_Level
Inst84Quest5_HORDE_Attain = Inst84Quest5_Attain
Inst84Quest5_HORDE_Aim = Inst84Quest5_Aim
Inst84Quest5_HORDE_Location = Inst84Quest5_Location
Inst84Quest5_HORDE_Note = Inst84Quest5_Note
Inst84Quest5_HORDE_Prequest = Inst84Quest5_Prequest
Inst84Quest5_HORDE_Folgequest = Inst84Quest5_Folgequest
--
Inst84Quest5name1_HORDE = Inst84Quest5name1
Inst84Quest5name2_HORDE = Inst84Quest5name2

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst84Quest6_HORDE = Inst84Quest6
Inst84Quest6_HORDE_Level = Inst84Quest6_Level
Inst84Quest6_HORDE_Attain = Inst84Quest6_Attain
Inst84Quest6_HORDE_Aim = Inst84Quest6_Aim
Inst84Quest6_HORDE_Location = Inst84Quest6_Location
Inst84Quest6_HORDE_Note = Inst84Quest6_Note
Inst84Quest6_HORDE_Prequest = Inst84Quest6_Prequest
Inst84Quest6_HORDE_Folgequest = Inst84Quest6_Folgequest
--
Inst84Quest6name1_HORDE = Inst84Quest6name1
Inst84Quest6name2_HORDE = Inst84Quest6name2



--------------- INST85 - Vault of Archavon ---------------

Inst85Story = "Над промерзшим Драконьим Погостом и негостеприимной, пустынной Борейской Тундрой возвышается плато, которое жители Нордскола назвали Зимними Оковами. Веками оно оставалось непотревоженным, и ледяные ветра беспрепятственно проносились, завывая, между древними укреплениями, построенными титанами. Но недавнее появление Орды и Альянса ознаменовало конец мирного сна: вскоре звон железа и гул войны прервет эту песню одиночества..."
Inst85Caption = "Склеп Аркавона"
Inst85QAA = "Нет заданий"
Inst85QAH = "Нет заданий"



--------------- INST86 - Ulduar ---------------

Inst86Story = "Тысячелетиями ничто не тревожило покой Ульдуара, далекого от забот и войн смертных рас. Но после его открытия многие захотели выяснить изначальное предназначение этого строения. Некоторые считали его городом, возведенным во славу его создателей; другие полагали, что это сокровищница, хранящая несметные богатства – возможно, даже реликвии самих титанов. Но все гипотезы были ошибочными. За массивными вратами вы не найдете ни города, ни сокровищницы, ни разгадки древних секретов. Все, что ждет смельчаков, преступивших порог Ульдуара, – ужас, который титаны не могли и никогда не пытались уничтожить, ибо они лишь сдерживали это зло. Под Ульдуаром в глубинах Древний бог смерти томится, шепчет… ступай с осторожностью, или упокоишься в его темнице."
Inst86Caption = "Ульдуар"
Inst86QAA = "20 Заданий"
Inst86QAH = "20 Заданий"

--Quest 1 Alliance
Inst86Quest1 = "1. Диск доступа к Архиву"
Inst86Quest1_Level = "80"
Inst86Quest1_Attain = "80"
Inst86Quest1_Aim = "Отнесите диск доступа к Архиву к панели управления Архивом в Ульдуаре."
Inst86Quest1_Location = "Диск доступа к Архиву (падает с Железного Собрания; "..YELLOW.."Вестибюль Ульдуара [5]"..WHITE..")"
Inst86Quest1_Note = "Диск доступа к Архиву падает только если убить Железное Собрание в сложном режиме. Только один человек из рейда получит Диск.\n\nПосле убийства Железного Собрания откроется дверь в архив. Завершите задание у панели управления Архивом в открывшейся комнате. Геолог Дорен даст вам слудующее задание."
Inst86Quest1_Prequest = "Нет"
Inst86Quest1_Folgequest = "Священный планетарий"
-- No Rewards for this quest

--Quest 2 Alliance
Inst86Quest2 = "2. Священный планетарий"
Inst86Quest2_Level = "80"
Inst86Quest2_Attain = "80"
Inst86Quest2_Aim = "Найдите Священный планетарий по заданию геолога Дорена из Архива в Ульдуаре."
Inst86Quest2_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest2_Note = "Священный планетарий находится (Вестибюль Ульдуара; "..YELLOW.."[8]"..WHITE..").\n\nПосле завершения этого задания Геолог Дорен, даст следующие 4 задания."
Inst86Quest2_Prequest = "Диск доступа к Архиву"
Inst86Quest2_Folgequest = "4 задания на Хранителей"
Inst86Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst86Quest3 = "3. Печать Ходира"
Inst86Quest3_Level = "80"
Inst86Quest3_Attain = "80"
Inst86Quest3_Aim = "Добудьте печать Ходира по заданию геолога Дорена."
Inst86Quest3_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest3_Note = "Ходир находится "..YELLOW.."Хранители [10]"..WHITE..". Чтобы выпала печать нужно убить Ходира в сложном режиме (Достижение - "..YELLOW.."Бесценный склад"..WHITE..")."
Inst86Quest3_Prequest = "Священный планетарий"
Inst86Quest3_Folgequest = "Нет"
Inst86Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst86Quest4 = "4. Печать Торима"
Inst86Quest4_Level = "80"
Inst86Quest4_Attain = "80"
Inst86Quest4_Aim = "Добудьте печать Торима по заданию геолога Дорена."
Inst86Quest4_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest4_Note = "Торим находится "..YELLOW.."Хранители [11]"..WHITE..". Чтобы выпала печать нужно убить Торима в сложном режиме (Достижение - "..YELLOW.."Избавься от иллюзий"..WHITE..")."
Inst86Quest4_Prequest = "Священный планетарий"
Inst86Quest4_Folgequest = "Нет"
Inst86Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst86Quest5 = "5. Печать Фрейи"
Inst86Quest5_Level = "80"
Inst86Quest5_Attain = "80"
Inst86Quest5_Aim = "Добудьте печать Фрейи по заданию геолога Дорена."
Inst86Quest5_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest5_Note = "Фрейя находится "..YELLOW.."Хранители [12]"..WHITE..". Чтобы выпала печать нужно убить Фрейу в сложном режиме (Достижение - "..YELLOW.."Трижды постучи по дереву"..WHITE..")."
Inst86Quest5_Prequest = "Священный планетарий"
Inst86Quest5_Folgequest = "Нет"
Inst86Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst86Quest6 = "6. Печать Мимирона"
Inst86Quest6_Level = "80"
Inst86Quest6_Attain = "80"
Inst86Quest6_Aim = "Добудьте печать Мимирона по заданию геолога Дорена."
Inst86Quest6_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest6_Note = "Мимирон находится "..YELLOW.."Искра воображения [13]"..WHITE..". Чтобы выпала печать нужно убить Мимирона в сложном режиме (Достижение - "..YELLOW.."Пожарный"..WHITE..")."
Inst86Quest6_Prequest = "Священный планетарий"
Inst86Quest6_Folgequest = "Нет"
Inst86Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst86Quest7 = "7. Алгалон"
Inst86Quest7_Level = "80"
Inst86Quest7_Attain = "80"
Inst86Quest7_Aim = "Принесите печати Хранителей к панели управления Архивом в Ульдуаре."
Inst86Quest7_Location = "Геолог Дорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest7_Note = "Завершение этого задания даст вам возможность сразиться с Алгалоном Наблюдателем в Священном планетарии."
Inst86Quest7_Prequest = "4 задания на Хранителей"
Inst86Quest7_Folgequest = "Нет"
Inst86Quest7PreQuest = "true"
--
Inst86Quest7name1 = "Ключ к Священному планетарию"
Inst86Quest7name2 = "Sack of Ulduar Spoils"

--Quest 8 Alliance
Inst86Quest8 = "8. Все хорошо, что хорошо кончается"
Inst86Quest8_Level = "80"
Inst86Quest8_Attain = "80"
Inst86Quest8_Aim = "Доставьте Код отклика 'Альфа' Ронину в Даларан."
Inst86Quest8_Location = "Код отклика 'Альфа' (падает с Алгалона Наблюдателя; "..YELLOW.."Вестибюль Ульдуара [7]"..WHITE..")"
Inst86Quest8_Note = "Только один человек из рейда сможет получить Код отклика. Задание сдается Ронину в Даларане - Аметистовая цитадель; "..YELLOW.."30.5, 48.4"..WHITE.."."
Inst86Quest8_Prequest = "Нет"
Inst86Quest8_Folgequest = "Нет"
--
Inst86Quest8name1 = "Drape of the Skyherald"
Inst86Quest8name2 = "Sunglimmer Drape"
Inst86Quest8name3 = "Brann's Sealing Ring"
Inst86Quest8name4 = "Starshine Signet"

--Quest 9 Alliance
Inst86Quest9 = "9. Диск доступа к Архиву (героич.)"
Inst86Quest9_Level = "80"
Inst86Quest9_Attain = "80"
Inst86Quest9_Aim = "Отнесите диск доступа к Архиву к панели управления Архивом в Ульдуаре."
Inst86Quest9_Location = "Диск доступа к Архиву (падает с Железного Собрания; "..YELLOW.."Вестибюль Ульдуара [5]"..WHITE..")"
Inst86Quest9_Note = "Диск доступа к Архиву падает только если убить Железное Собрание в героическом сложном режиме. Только один человек из рейда получит Диск.\n\nAПосле убийства Железного Собрания откроется дверь в архив. Завершите задание у панели управления Архивом в открывшейся комнате. Геолог Лорен даст вам слудующее задание."
Inst86Quest9_Prequest = "Нет"
Inst86Quest9_Folgequest = "Священный планетарий (героич.)"
-- No Rewards for this quest

--Quest 10 Alliance
Inst86Quest10 = "10. Священный планетарий (героич.)"
Inst86Quest10_Level = "80"
Inst86Quest10_Attain = "80"
Inst86Quest10_Aim = "Найдите Священный планетарий по заданию геолога Лорен из Архива в Ульдуаре."
Inst86Quest10_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest10_Note = "Священный планетарий находится (Вестибюль Ульдуара; "..YELLOW.."[8]"..WHITE..").\n\nПосле завершения этого задания, Геолог Лорен, даст следующие 4 задания."
Inst86Quest10_Prequest = "Диск доступа к Архиву"
Inst86Quest10_Folgequest = "4 задания на Хранителей"
Inst86Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst86Quest11 = "11. Печать Ходира (героич.)"
Inst86Quest11_Level = "80"
Inst86Quest11_Attain = "80"
Inst86Quest11_Aim = "Добудьте печать Ходира по заданию геолога Лорен."
Inst86Quest11_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest11_Note = "Ходир находится "..YELLOW.."Хранители Ульдуара [10]"..WHITE..". Чтобы выпала печать нужно убить Ходира в героическом сложном режиме (Достижение - "..YELLOW.."Бесценный склад (героич.)"..WHITE..")."
Inst86Quest11_Prequest = "Священный планетарий (героич.)"
Inst86Quest11_Folgequest = "Нет"
Inst86Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst86Quest12 = "12. Печать Торима (героич.)"
Inst86Quest12_Level = "80"
Inst86Quest12_Attain = "80"
Inst86Quest12_Aim = "Добудьте печать Торима по заданию геолога Лорен."
Inst86Quest12_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest12_Note = "Торим находится "..YELLOW.."Хранители Ульдуара [11]"..WHITE..". Чтобы выпала печать нужно убить Торима в героическом сложном режиме (Достижение - "..YELLOW.."Избавься от иллюзий (героич.)"..WHITE..")."
Inst86Quest12_Prequest = "Священный планетарий (героич.)"
Inst86Quest12_Folgequest = "Нет"
Inst86Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst86Quest13 = "13. Печать Фрейи (героич.)"
Inst86Quest13_Level = "80"
Inst86Quest13_Attain = "80"
Inst86Quest13_Aim = "Добудьте печать Фрейи по заданию геолога Лорен."
Inst86Quest13_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest13_Note = "Фрейя находится "..YELLOW.."Хранители Ульдуара [12]"..WHITE..". Чтобы выпала печать нужно убить Фрейу в героическом сложном режиме (Достижение - "..YELLOW.."Трижды постучи по дереву (героич.)"..WHITE..")."
Inst86Quest13_Prequest = "Священный планетарий (героич.)"
Inst86Quest13_Folgequest = "Нет"
Inst86Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst86Quest14 = "14. Печать Мимирона (героич.)"
Inst86Quest14_Level = "80"
Inst86Quest14_Attain = "80"
Inst86Quest14_Aim = "Добудьте печать Мимирона по заданию геолога Лорен."
Inst86Quest14_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest14_Note = "Мимирон находится "..YELLOW.."Искра воображения [13]"..WHITE..". Чтобы выпала печать нужно убить Мимирона в героическом сложном режиме (Достижение - "..YELLOW.."Пожарный (героич.)"..WHITE..")."
Inst86Quest14_Prequest = "Священный планетарий (героич.)"
Inst86Quest14_Folgequest = "Нет"
Inst86Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst86Quest15 = "15. Алгалон (героич.)"
Inst86Quest15_Level = "80"
Inst86Quest15_Attain = "80"
Inst86Quest15_Aim = "Принесите печати Хранителей к панели управления Архивом в Ульдуаре."
Inst86Quest15_Location = "Геолог Лорен (Вестибюль Ульдуара; "..YELLOW.."[6]"..WHITE..")"
Inst86Quest15_Note = "Завершение этого задания даст вам возможность сразиться с Алгалоном Наблюдателем в Священном планетарии в героическом режиме."
Inst86Quest15_Prequest = "4 задания на Хранителей"
Inst86Quest15_Folgequest = "Нет"
Inst86Quest15PreQuest = "true"
--
Inst86Quest15name1 = "Ключ к Священному планетарию (героич.)"
Inst86Quest15name2 = "Sack of Ulduar Spoils"

--Quest 16 Alliance
Inst86Quest16 = "16. Все хорошо, что хорошо кончается (героич.)"
Inst86Quest16_Level = "80"
Inst86Quest16_Attain = "80"
Inst86Quest16_Aim = "Доставьте Код отклика 'Альфа' Ронину в Даларан."
Inst86Quest16_Location = "Код отклика 'Альфа' (падает с Алгалона Наблюдателя; "..YELLOW.."Вестибюль Ульдуара [7]"..WHITE..")"
Inst86Quest16_Note = "Только один человек из рейда сможет получить Код отклика. Задание сдается Ронину в Даларане - Аметистовая цитадель; "..YELLOW.."30.5, 48.4"..WHITE.."."
Inst86Quest16_Prequest = "Нет"
Inst86Quest16_Folgequest = "Нет"
--
Inst86Quest16name1 = "Drape of the Skyborn"
Inst86Quest16name2 = "Sunglimmer Cloak"
Inst86Quest16name3 = "Brann's Signet Ring"
Inst86Quest16name4 = "Starshine Circle"

--Quest 17 Alliance
Inst86Quest17 = "17. Огненный Левиафан должен умереть! (Еженедельный)"
Inst86Quest17_Level = "80"
Inst86Quest17_Attain = "80"
Inst86Quest17_Aim = "Убейте Огненного Левиафана."
Inst86Quest17_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest17_Note = "Огненный Левиафан находится "..YELLOW.."Осада [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst86Quest17_Prequest = "Нет"
Inst86Quest17_Folgequest = "Нет"
--
Inst86Quest17name1 = "Эмблема льда"
Inst86Quest17name2 = "Эмблема триумфа"

--Quest 18 Alliance
Inst86Quest18 = "18. Повелитель Горнов Игнис должен умереть! (Еженедельный)"
Inst86Quest18_Level = "80"
Inst86Quest18_Attain = "80"
Inst86Quest18_Aim = "Убейте Повелителя Горнов Игниса."
Inst86Quest18_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest18_Note = "Повелитель Горнов Игнис находится "..YELLOW.."Осада [2]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst86Quest18_Prequest = "Нет"
Inst86Quest18_Folgequest = "Нет"
--
Inst86Quest18name1 = "Эмблема льда"
Inst86Quest18name2 = "Эмблема триумфа"

--Quest 19 Alliance
Inst86Quest19 = "19. Острокрылая должен умереть! (Еженедельный)"
Inst86Quest19_Level = "80"
Inst86Quest19_Attain = "80"
Inst86Quest19_Aim = "Убейте Острокрылую."
Inst86Quest19_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest19_Note = "Острокрылая находится "..YELLOW.."Осада [3]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst86Quest19_Prequest = "Нет"
Inst86Quest19_Folgequest = "Нет"
--
Inst86Quest19name1 = "Эмблема льда"
Inst86Quest19name2 = "Эмблема триумфа"

--Quest 20 Alliance
Inst86Quest20 = "20. Разрушитель XT-002 должен умереть! (Еженедельный)"
Inst86Quest20_Level = "80"
Inst86Quest20_Attain = "80"
Inst86Quest20_Aim = "Убейте Разрушителя XT-002."
Inst86Quest20_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst86Quest20_Note = "Разрушитель XT-002 находится "..YELLOW.."Осада [4]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst86Quest20_Prequest = "Нет"
Inst86Quest20_Folgequest = "Нет"
--
Inst86Quest20name1 = "Эмблема льда"
Inst86Quest20name2 = "Эмблема триумфа"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst86Quest1_HORDE = Inst86Quest1
Inst86Quest1_HORDE_Level = Inst86Quest1_Level
Inst86Quest1_HORDE_Attain = Inst86Quest1_Attain
Inst86Quest1_HORDE_Aim = Inst86Quest1_Aim
Inst86Quest1_HORDE_Location = Inst86Quest1_Location
Inst86Quest1_HORDE_Note = Inst86Quest1_Note
Inst86Quest1_HORDE_Prequest = Inst86Quest1_Prequest
Inst86Quest1_HORDE_Folgequest = Inst86Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst86Quest2_HORDE = Inst86Quest2
Inst86Quest2_HORDE_Level = Inst86Quest2_Level
Inst86Quest2_HORDE_Attain = Inst86Quest2_Attain
Inst86Quest2_HORDE_Aim = Inst86Quest2_Aim
Inst86Quest2_HORDE_Location = Inst86Quest2_Location
Inst86Quest2_HORDE_Note = Inst86Quest2_Note
Inst86Quest2_HORDE_Prequest = Inst86Quest2_Prequest
Inst86Quest2_HORDE_Folgequest = Inst86Quest2_Folgequest
Inst86Quest2FQuest_HORDE = Inst86Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst86Quest3_HORDE = Inst86Quest3
Inst86Quest3_HORDE_Level = Inst86Quest3_Level
Inst86Quest3_HORDE_Attain = Inst86Quest3_Attain
Inst86Quest3_HORDE_Aim = Inst86Quest3_Aim
Inst86Quest3_HORDE_Location = Inst86Quest3_Location
Inst86Quest3_HORDE_Note = Inst86Quest3_Note
Inst86Quest3_HORDE_Prequest = Inst86Quest3_Prequest
Inst86Quest3_HORDE_Folgequest = Inst86Quest3_Folgequest
Inst86Quest3PreQuest_HORDE = Inst86Quest3PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst86Quest4_HORDE = Inst86Quest4
Inst86Quest4_HORDE_Level = Inst86Quest4_Level
Inst86Quest4_HORDE_Attain = Inst86Quest4_Attain
Inst86Quest4_HORDE_Aim = Inst86Quest4_Aim
Inst86Quest4_HORDE_Location = Inst86Quest4_Location
Inst86Quest4_HORDE_Note = Inst86Quest4_Note
Inst86Quest4_HORDE_Prequest = Inst86Quest4_Prequest
Inst86Quest4_HORDE_Folgequest = Inst86Quest4_Folgequest
Inst86Quest4PreQuest_HORDE = Inst86Quest4PreQuest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst86Quest5_HORDE = Inst86Quest5
Inst86Quest5_HORDE_Level = Inst86Quest5_Level
Inst86Quest5_HORDE_Attain = Inst86Quest5_Attain
Inst86Quest5_HORDE_Aim = Inst86Quest5_Aim
Inst86Quest5_HORDE_Location = Inst86Quest5_Location
Inst86Quest5_HORDE_Note = Inst86Quest5_Note
Inst86Quest5_HORDE_Prequest = Inst86Quest5_Prequest
Inst86Quest5_HORDE_Folgequest = Inst86Quest5_Folgequest
Inst86Quest5PreQuest_HORDE = Inst86Quest5PreQuest
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst86Quest6_HORDE = Inst86Quest6
Inst86Quest6_HORDE_Level = Inst86Quest6_Level
Inst86Quest6_HORDE_Attain = Inst86Quest6_Attain
Inst86Quest6_HORDE_Aim = Inst86Quest6_Aim
Inst86Quest6_HORDE_Location = Inst86Quest6_Location
Inst86Quest6_HORDE_Note = Inst86Quest6_Note
Inst86Quest6_HORDE_Prequest = Inst86Quest6_Prequest
Inst86Quest6_HORDE_Folgequest = Inst86Quest6_Folgequest
Inst86Quest6PreQuest_HORDE = Inst86Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst86Quest7_HORDE = Inst86Quest7
Inst86Quest7_HORDE_Level = Inst86Quest7_Level
Inst86Quest7_HORDE_Attain = Inst86Quest7_Attain
Inst86Quest7_HORDE_Aim = Inst86Quest7_Aim
Inst86Quest7_HORDE_Location = Inst86Quest7_Location
Inst86Quest7_HORDE_Note = Inst86Quest7_Note
Inst86Quest7_HORDE_Prequest = Inst86Quest7_Prequest
Inst86Quest7_HORDE_Folgequest = Inst86Quest7_Folgequest
Inst86Quest7PreQuest_HORDE = Inst86Quest7PreQuest
--
Inst86Quest7name1_HORDE = Inst86Quest7name1
Inst86Quest7name2_HORDE = Inst86Quest7name2

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst86Quest8_HORDE = Inst86Quest8
Inst86Quest8_HORDE_Level = Inst86Quest8_Level
Inst86Quest8_HORDE_Attain = Inst86Quest8_Attain
Inst86Quest8_HORDE_Aim = Inst86Quest8_Aim
Inst86Quest8_HORDE_Location = Inst86Quest8_Location
Inst86Quest8_HORDE_Note = Inst86Quest8_Note
Inst86Quest8_HORDE_Prequest = Inst86Quest8_Prequest
Inst86Quest8_HORDE_Folgequest = Inst86Quest8_Folgequest
--
Inst86Quest8name1_HORDE = Inst86Quest8name1
Inst86Quest8name2_HORDE = Inst86Quest8name2
Inst86Quest8name3_HORDE = Inst86Quest8name3
Inst86Quest8name4_HORDE = Inst86Quest8name4

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst86Quest9_HORDE = Inst86Quest9
Inst86Quest9_HORDE_Level = Inst86Quest9_Level
Inst86Quest9_HORDE_Attain = Inst86Quest9_Attain
Inst86Quest9_HORDE_Aim = Inst86Quest9_Aim
Inst86Quest9_HORDE_Location = Inst86Quest9_Location
Inst86Quest9_HORDE_Note = Inst86Quest9_Note
Inst86Quest9_HORDE_Prequest = Inst86Quest9_Prequest
Inst86Quest9_HORDE_Folgequest = Inst86Quest9_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst86Quest10_HORDE = Inst86Quest10
Inst86Quest10_HORDE_Level = Inst86Quest10_Level
Inst86Quest10_HORDE_Attain = Inst86Quest10_Attain
Inst86Quest10_HORDE_Aim = Inst86Quest10_Aim
Inst86Quest10_HORDE_Location = Inst86Quest10_Location
Inst86Quest10_HORDE_Note = Inst86Quest10_Note
Inst86Quest10_HORDE_Prequest = Inst86Quest10_Prequest
Inst86Quest10_HORDE_Folgequest = Inst86Quest10_Folgequest
Inst86Quest10FQuest_HORDE = Inst86Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst86Quest11_HORDE = Inst86Quest11
Inst86Quest11_HORDE_Level = Inst86Quest11_Level
Inst86Quest11_HORDE_Attain = Inst86Quest11_Attain
Inst86Quest11_HORDE_Aim = Inst86Quest11_Aim
Inst86Quest11_HORDE_Location = Inst86Quest11_Location
Inst86Quest11_HORDE_Note = Inst86Quest11_Note
Inst86Quest11_HORDE_Prequest = Inst86Quest11_Prequest
Inst86Quest11_HORDE_Folgequest = Inst86Quest11_Folgequest
Inst86Quest11PreQuest_HORDE = Inst86Quest11PreQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst86Quest12_HORDE = Inst86Quest12
Inst86Quest12_HORDE_Level = Inst86Quest12_Level
Inst86Quest12_HORDE_Attain = Inst86Quest12_Attain
Inst86Quest12_HORDE_Aim = Inst86Quest12_Aim
Inst86Quest12_HORDE_Location = Inst86Quest12_Location
Inst86Quest12_HORDE_Note = Inst86Quest12_Note
Inst86Quest12_HORDE_Prequest = Inst86Quest12_Prequest
Inst86Quest12_HORDE_Folgequest = Inst86Quest12_Folgequest
Inst86Quest12PreQuest_HORDE = Inst86Quest12PreQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst86Quest13_HORDE = Inst86Quest13
Inst86Quest13_HORDE_Level = Inst86Quest13_Level
Inst86Quest13_HORDE_Attain = Inst86Quest13_Attain
Inst86Quest13_HORDE_Aim = Inst86Quest13_Aim
Inst86Quest13_HORDE_Location = Inst86Quest13_Location
Inst86Quest13_HORDE_Note = Inst86Quest13_Note
Inst86Quest13_HORDE_Prequest = Inst86Quest13_Prequest
Inst86Quest13_HORDE_Folgequest = Inst86Quest13_Folgequest
Inst86Quest13PreQuest_HORDE = Inst86Quest13PreQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst86Quest14_HORDE = Inst86Quest14
Inst86Quest14_HORDE_Level = Inst86Quest14_Level
Inst86Quest14_HORDE_Attain = Inst86Quest14_Attain
Inst86Quest14_HORDE_Aim = Inst86Quest14_Aim
Inst86Quest14_HORDE_Location = Inst86Quest14_Location
Inst86Quest14_HORDE_Note = Inst86Quest14_Note
Inst86Quest14_HORDE_Prequest = Inst86Quest14_Prequest
Inst86Quest14_HORDE_Folgequest = Inst86Quest14_Folgequest
Inst86Quest14PreQuest_HORDE = Inst86Quest14PreQuest
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst86Quest15_HORDE = Inst86Quest15
Inst86Quest15_HORDE_Level = Inst86Quest15_Level
Inst86Quest15_HORDE_Attain = Inst86Quest15_Attain
Inst86Quest15_HORDE_Aim = Inst86Quest15_Aim
Inst86Quest15_HORDE_Location = Inst86Quest15_Location
Inst86Quest15_HORDE_Note = Inst86Quest15_Note
Inst86Quest15_HORDE_Prequest = Inst86Quest15_Prequest
Inst86Quest15_HORDE_Folgequest = Inst86Quest15_Folgequest
Inst86Quest15PreQuest_HORDE = Inst86Quest15PreQuest
--
Inst86Quest15name1_HORDE = Inst86Quest15name1
Inst86Quest15name2_HORDE = Inst86Quest15name2

--Quest 16 Horde  (same as Quest 16 Alliance)
Inst86Quest16_HORDE = Inst86Quest16
Inst86Quest16_HORDE_Level = Inst86Quest16_Level
Inst86Quest16_HORDE_Attain = Inst86Quest16_Attain
Inst86Quest16_HORDE_Aim = Inst86Quest16_Aim
Inst86Quest16_HORDE_Location = Inst86Quest16_Location
Inst86Quest16_HORDE_Note = Inst86Quest16_Note
Inst86Quest16_HORDE_Prequest = Inst86Quest16_Prequest
Inst86Quest16_HORDE_Folgequest = Inst86Quest16_Folgequest
--
Inst86Quest16name1_HORDE = Inst86Quest16name1
Inst86Quest16name2_HORDE = Inst86Quest16name2
Inst86Quest16name3_HORDE = Inst86Quest16name3
Inst86Quest16name4_HORDE = Inst86Quest16name4

--Quest 17 Horde  (same as Quest 17 Alliance)
Inst86Quest17_HORDE = Inst86Quest17
Inst86Quest17_HORDE_Level = Inst86Quest17_Level
Inst86Quest17_HORDE_Attain = Inst86Quest17_Attain
Inst86Quest17_HORDE_Aim = Inst86Quest17_Aim
Inst86Quest17_HORDE_Location = Inst86Quest17_Location
Inst86Quest17_HORDE_Note = Inst86Quest17_Note
Inst86Quest17_HORDE_Prequest = Inst86Quest17_Prequest
Inst86Quest17_HORDE_Folgequest = Inst86Quest17_Folgequest
--
Inst86Quest17name1_HORDE = Inst86Quest17name1
Inst86Quest17name2_HORDE = Inst86Quest17name2

--Quest 18 Horde  (same as Quest 18 Alliance)
Inst86Quest18_HORDE = Inst86Quest18
Inst86Quest18_HORDE_Level = Inst86Quest18_Level
Inst86Quest18_HORDE_Attain = Inst86Quest18_Attain
Inst86Quest18_HORDE_Aim = Inst86Quest18_Aim
Inst86Quest18_HORDE_Location = Inst86Quest18_Location
Inst86Quest18_HORDE_Note = Inst86Quest18_Note
Inst86Quest18_HORDE_Prequest = Inst86Quest18_Prequest
Inst86Quest18_HORDE_Folgequest = Inst86Quest18_Folgequest
--
Inst86Quest18name1_HORDE = Inst86Quest18name1
Inst86Quest18name2_HORDE = Inst86Quest18name2

--Quest 19 Horde  (same as Quest 19 Alliance)
Inst86Quest19_HORDE = Inst86Quest19
Inst86Quest19_HORDE_Level = Inst86Quest19_Level
Inst86Quest19_HORDE_Attain = Inst86Quest19_Attain
Inst86Quest19_HORDE_Aim = Inst86Quest19_Aim
Inst86Quest19_HORDE_Location = Inst86Quest19_Location
Inst86Quest19_HORDE_Note = Inst86Quest19_Note
Inst86Quest19_HORDE_Prequest = Inst86Quest19_Prequest
Inst86Quest19_HORDE_Folgequest = Inst86Quest19_Folgequest
--
Inst86Quest19name1_HORDE = Inst86Quest19name1
Inst86Quest19name2_HORDE = Inst86Quest19name2

--Quest 20 Horde  (same as Quest 20 Alliance)
Inst86Quest20_HORDE = Inst86Quest20
Inst86Quest20_HORDE_Level = Inst86Quest20_Level
Inst86Quest20_HORDE_Attain = Inst86Quest20_Attain
Inst86Quest20_HORDE_Aim = Inst86Quest20_Aim
Inst86Quest20_HORDE_Location = Inst86Quest20_Location
Inst86Quest20_HORDE_Note = Inst86Quest20_Note
Inst86Quest20_HORDE_Prequest = Inst86Quest20_Prequest
Inst86Quest20_HORDE_Folgequest = Inst86Quest20_Folgequest
--
Inst86Quest20name1_HORDE = Inst86Quest20name1
Inst86Quest20name2_HORDE = Inst86Quest20name2



--------------- INST87 - Trial of the Champion ---------------

Inst87Story = "Удар в самое сердце Плети неотвратим. Облака застилают небо над Азеротом, и герои собираются под изорванными знаменами, чтобы подготовиться к грядущему шторму. Говорят, что даже у самой черной тучи серебристый ореол. Это надежда, вдохновляющяя мужей и женщин Серебряного Авангарда: надежда, что сам Свет проведет их через время испытаний, надежда, что добро снова восторжествует над злом, надежда, что герой, благословленный Светом, положит конец темному царству Короля-лича.  \n\nПрозвучал клич Серебряного авангарда - призыв к оружию, зов, обращенный ко всем защитникам Азерота, встретиться у порога крепости Короля-лича и показать на турнире доблесть, какой еще не знали в Азероте. Безусловно, подобному турниру нужна арена. Место, где воины тренируются на износ. Место, где герои становятся чемпионами. Место, названное Колизеем Серебряного Авангарда."
Inst87Caption = "Испытание чемпиона"
Inst87QAA = "Нет заданий"
Inst87QAH = "Нет заданий"



--------------- INST88 - Trial of the Crusader ---------------

Inst88Story = "Удар в самое сердце Плети неотвратим. Облака застилают небо над Азеротом, и герои собираются под изорванными знаменами, чтобы подготовиться к грядущему шторму. Говорят, что даже у самой черной тучи серебристый ореол. Это надежда, вдохновляющяя мужей и женщин Серебряного Авангарда: надежда, что сам Свет проведет их через время испытаний, надежда, что добро снова восторжествует над злом, надежда, что герой, благословленный Светом, положит конец темному царству Короля-лича.  \n\nПрозвучал клич Серебряного авангарда - призыв к оружию, зов, обращенный ко всем защитникам Азерота, встретиться у порога крепости Короля-лича и показать на турнире доблесть, какой еще не знали в Азероте. Безусловно, подобному турниру нужна арена. Место, где воины тренируются на износ. Место, где герои становятся чемпионами. Место, названное Колизеем Серебряного Авангарда."
Inst88Caption = "Испытание крестоносца"
Inst88QAA = "1 задание"
Inst88QAH = "1 задание"

--Quest 1 Alliance
Inst88Quest1 = "1. Лорд Джараксус Должен умереть! (Еженедельный)"
Inst88Quest1_Level = "80"
Inst88Quest1_Attain = "80"
Inst88Quest1_Aim = "Убейте Лорда Джараксуса."
Inst88Quest1_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst88Quest1_Note = "Лорд Джараксус - второй босс ИК.\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst88Quest1_Prequest = "Нет"
Inst88Quest1_Folgequest = "Нет"
--
Inst88Quest1name1 = "Эмблема льда"
Inst88Quest1name2 = "Эмблема триумфа"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst88Quest1_HORDE = Inst88Quest1
Inst88Quest1_HORDE_Level = Inst88Quest1_Level
Inst88Quest1_HORDE_Attain = Inst88Quest1_Attain
Inst88Quest1_HORDE_Aim = Inst88Quest1_Aim
Inst88Quest1_HORDE_Location = Inst88Quest1_Location
Inst88Quest1_HORDE_Note = Inst88Quest1_Note
Inst88Quest1_HORDE_Prequest = Inst88Quest1_Prequest
Inst88Quest1_HORDE_Folgequest = Inst88Quest1_Folgequest
--
Inst88Quest1name1_HORDE = Inst88Quest1name1
Inst88Quest1name2_HORDE = Inst88Quest1name2



--------------- INST90 - Forge of Souls (FoS)  ---------------

Inst90Story = "Кузня Душ, самое первое крыло этого обширного подземелья, станет для игроков испытанием на отвагу. Смогут ли они вместе с предводительницей войск Альянса Джайной и командиром сил Орды Сильваной проникнуть в самые опасные места крепости Плети? Их задача – уничтожить чудовищные механизмы, известные как разрушители душ. Если герои не смогут найти способ одолеть могущественных противников, стоящих у них на пути, им не пройти в следующее крыло цитадели."
Inst90Caption = "Кузня душ"
Inst90QAA = "3 задания"
Inst90QAH = "3 задания"

--Quest 1 Alliance
Inst90Quest1 = "1. В ледяную цитадель"
Inst90Quest1_Level = "80"
Inst90Quest1_Attain = "80"
Inst90Quest1_Aim = "Войдите в Кузню Душ со стороны Цитадели Ледяной Короны и найдите леди Джайну Праудмур."
Inst90Quest1_Location = "Ученица Нельфи (Даларан - Около южного (альянсовского) банка)"
Inst90Quest1_Note = "Леди Джайна Праудмур находится внутри подземелья."
Inst90Quest1_Prequest = "Нет"
Inst90Quest1_Folgequest = "Тени замученных душ"
-- No Rewards for this quest

--Quest 2 Alliance
Inst90Quest2 = "2. Тени замученных душ"
Inst90Quest2_Level = "80"
Inst90Quest2_Attain = "80"
Inst90Quest2_Aim = "Чтобы обеспечить безопасный проход в Яму Сарона, убейте Броньяма и Пожирателя Душ."
Inst90Quest2_Location = "Леди Джайна Праудмур (Кузня душ; "..YELLOW.."Вход"..WHITE..")"
Inst90Quest2_Note = "Завершение этого задания откроет доступ в Яму Сарона. Завершите это задание и получите следующее до того как покинете подземелье."
Inst90Quest2_Prequest = "В ледяную цитадель"
Inst90Quest2_Folgequest = "Яма Сарона ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst90Quest2FQuest = "true"
--
Inst90Quest2name1 = "Эмблема льда"

--Quest 3 Alliance
Inst90Quest3 = "3. Закалить клинок"
Inst90Quest3_Level = "80"
Inst90Quest3_Attain = "80"
Inst90Quest3_Aim = "Закалите перекованный Кель'Делар в горниле душ."
Inst90Quest3_Location = "Каладис Сияющее Копье (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst90Quest3_Note = "Горнило душ находится "..YELLOW.."[3]"..WHITE..", около выхода из подземелья."
Inst90Quest3_Prequest = "Перековать меч ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst90Quest3_Folgequest = "Залы отражений ("..YELLOW.."Залы отражений"..WHITE..")"
Inst90Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst90Quest1_HORDE = "1. В ледяную цитадель"
Inst90Quest1_HORDE_Level = "80"
Inst90Quest1_HORDE_Attain = "80"
Inst90Quest1_HORDE_Aim = "Войдите в Кузню Душ со стороны Цитадели Ледяной Короны и найдите леди Сильвану Ветрокрылую."
Inst90Quest1_HORDE_Location = "Темный следопыт Ворель (Даларан - Около северного (ордынского) банка)"
Inst90Quest1_HORDE_Note = "Леди Сильвана Ветрокрылая находится внутри подземелья."
Inst90Quest1_HORDE_Prequest = "Нет"
Inst90Quest1_HORDE_Folgequest = "Тени замученных душ"
-- No Rewards for this quest

--Quest 2 Horde
Inst90Quest2_HORDE = "2. Тени замученных душ"
Inst90Quest2_HORDE_Level = "80"
Inst90Quest2_HORDE_Attain = "80"
Inst90Quest2_HORDE_Aim = "Чтобы обеспечить безопасный проход в Яму Сарона, убейте Броньяма и Пожирателя Душ."
Inst90Quest2_HORDE_Location = "Леди Сильвана Ветрокрылая (Кузня душ; "..YELLOW.."Вход"..WHITE..")"
Inst90Quest2_HORDE_Note = "Завершение этого задания откроет доступ в Яму Сарона. Завершите это задание и получите следующее до того как покинете подземелье."
Inst90Quest2_HORDE_Prequest = "В ледяную цитадель"
Inst90Quest2_HORDE_Folgequest = "Яма Сарона ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst90Quest2FQuest_HORDE = "true"
--
Inst90Quest2name1_HORDE = "Эмблема льда"

--Quest 3 Horde
Inst90Quest3_HORDE = "3. Закалить клинок"
Inst90Quest3_HORDE_Level = "80"
Inst90Quest3_HORDE_Attain = "80"
Inst90Quest3_HORDE_Aim = "Закалите перекованный Кель'Делар в горниле душ."
Inst90Quest3_HORDE_Location = "Миралис Блеск Солнца (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst90Quest3_HORDE_Note = "Горнило душ находится "..YELLOW.."[3]"..WHITE..", около выхода из подземелья."
Inst90Quest3_HORDE_Prequest = "Перековать меч ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst90Quest3_HORDE_Folgequest = "Залы отражений ("..YELLOW.."Залы отражений"..WHITE..")"
Inst90Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST91 - Pit of Saron (PoS)  ---------------

Inst91Story = "Только те герои, что смогли прервать нечестивую работу механизмов в Кузне Душ, смогут проникнуть дальше во владения Короля-лича – в Яму Сарона. Оказавшиеся здесь игроки немедленно столкнутся с хозяином этого логова, Повелителем Плети Тиранием. Но победить его будет не так-то просто. Прежде чем бросить вызов властелину, искатели приключений получат указание от командиров освободить пленных союзников, которых Плеть удерживает в этом подземелье. До тех пор Тираний не будет обращать на захватчиков внимания, предоставив сражаться своим слугам – работникам шахт. Но возможно, это сражение подскажет героям, где находятся личные покои Короля-лича: вдалеке от Ледяного Трона, в глубине Залов Отражений."
Inst91Caption = "Яма Сарона"
Inst91QAA = "4 задания"
Inst91QAH = "4 задания"

--Quest 1 Alliance
Inst91Quest1 = "1. Яма Сарона"
Inst91Quest1_Level = "80"
Inst91Quest1_Attain = "80"
Inst91Quest1_Aim = "Встретьтесь с Леди Джайной Праудмур на входе в Яму Сарона."
Inst91Quest1_Location = "Леди Джайна Праудмур (Кузня душ; "..YELLOW.."[3]"..WHITE..")"
Inst91Quest1_Note = "Леди Джайна Праудмур находится внутри подземелья."
Inst91Quest1_Prequest = "Тени замученных душ ("..YELLOW.."Кузня душ"..WHITE..")"
Inst91Quest1_Folgequest = "Путь в Цитадель"
Inst91Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst91Quest2 = "2. Путь в Цитадель"
Inst91Quest2_Level = "80"
Inst91Quest2_Attain = "80"
Inst91Quest2_Aim = "Освободите 15 порабощенных солдат Альянса и убейте начальника кузни Гархлада."
Inst91Quest2_Location = "Леди Джайна Праудмур (Яма Сарона; "..YELLOW.."1"..WHITE..")"
Inst91Quest2_Note = "Рабы встречаются по всей яме. Задание сдается Мартину Викту, который находится "..YELLOW.."[2]"..WHITE.." после победы над начальником кузни Гархладом."
Inst91Quest2_Prequest = "Яма Сарона"
Inst91Quest2_Folgequest = "Зачистка Ямы"
Inst91Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst91Quest3 = "3. Зачистка Ямы"
Inst91Quest3_Level = "80"
Inst91Quest3_Attain = "80"
Inst91Quest3_Aim = "Убейте Повелителя Плети Тирания."
Inst91Quest3_Location = "Мартин Викт (Яма Сарона; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_Note = "Повелитель Плети Тираний находится в конце подземелья. Завершение этого задания откроет доступ в Залы отражений. Завершите это задание и получите следующее до того как покинете подземелье."
Inst91Quest3_Prequest = "Путь в Цитадель"
Inst91Quest3_Folgequest = "Ледяная Скорбь ("..YELLOW.."Залы отражений"..WHITE..")"
Inst91Quest3FQuest = "true"
--
Inst91Quest3name1 = "Эмблема льда"

--Quest 4 Alliance
Inst91Quest4 = "4. Перековать меч"
Inst91Quest4_Level = "80"
Inst91Quest4_Attain = "80"
Inst91Quest4_Aim = "Возьмите 5 слитков зараженного саронита и молот начальника кузни, чтобы соединить фрагменты Кель'Делара и создать перекованный Кель'Делар."
Inst91Quest4_Location = "Каладис Сияющее Копье (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst91Quest4_Note = "Слитки зараженного саронита лежат в яме повсеместно. Используйте молот начальника кузни, который падает с начальника кузни Гархлада, на кузню около него."
Inst91Quest4_Prequest = "Возвращение к Каладису Сияющему Копью"
Inst91Quest4_Folgequest = "Закалить клинок ("..YELLOW.."Кузня душ"..WHITE..")"
Inst91Quest4PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst91Quest1_HORDE = "1. Яма Сарона"
Inst91Quest1_HORDE_Level = "80"
Inst91Quest1_HORDE_Attain = "80"
Inst91Quest1_HORDE_Aim = "Встретьтесь с леди Сильваной Ветрокрылой на входе в Яму Сарона."
Inst91Quest1_HORDE_Location = "Леди Сильвана Ветрокрылая (Кузня душ; "..YELLOW.."[3]"..WHITE..")"
Inst91Quest1_HORDE_Note = "Леди Сильвана Ветрокрылая находится внутри подземелья."
Inst91Quest1_HORDE_Prequest = "Тени замученных душ ("..YELLOW.."Кузня душ"..WHITE..")"
Inst91Quest1_HORDE_Folgequest = "Путь в Цитадель"
Inst91Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst91Quest2_HORDE = "2. Путь в Цитадель"
Inst91Quest2_HORDE_Level = "80"
Inst91Quest2_HORDE_Attain = "80"
Inst91Quest2_HORDE_Aim = "Освободите 15 порабощенных солдат Орды и убейте начальника кузни Гархлада."
Inst91Quest2_HORDE_Location = "Леди Сильвана Ветрокрылая (Яма Сарона; "..YELLOW.."1"..WHITE..")"
Inst91Quest2_HORDE_Note = "Рабы встречаются по всей яме. Задание сдается Горкуну Железный Череп, который находится"..YELLOW.."[2]"..WHITE.." после победы над начальником кузни Гархладом."
Inst91Quest2_HORDE_Prequest = "Яма Сарона"
Inst91Quest2_HORDE_Folgequest = "Зачистка Ямы"
Inst91Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde
Inst91Quest3_HORDE = "3. Зачистка Ямы"
Inst91Quest3_HORDE_Level = "80"
Inst91Quest3_HORDE_Attain = "80"
Inst91Quest3_HORDE_Aim = "Убейте Повелителя Плети Тирания."
Inst91Quest3_HORDE_Location = "Горкун Железный Череп (Яма Сарона; "..YELLOW.."[1]"..WHITE..")"
Inst91Quest3_HORDE_Note = "Повелитель Плети Тираний находится в конце подземелья. Завершение этого задания откроет доступ в Залы отражений. Завершите это задание и получите следующее до того как покинете подземелье."
Inst91Quest3_HORDE_Prequest = "Путь в Цитадель"
Inst91Quest3_HORDE_Folgequest = "Ледяная Скорбь ("..YELLOW.."Залы отражений"..WHITE..")"
Inst91Quest3FQuest_HORDE = "true"
--
Inst91Quest3name1_HORDE = "Эмблема льда"

--Quest 4 Horde
Inst91Quest4_HORDE = "4. Перековать меч"
Inst91Quest4_HORDE_Level = "80"
Inst91Quest4_HORDE_Attain = "80"
Inst91Quest4_HORDE_Aim = "Возьмите 5 слитков зараженного саронита и молот начальника кузни, чтобы соединить фрагменты Кель'Делара и создать перекованный Кель'Делар."
Inst91Quest4_HORDE_Location = "Миралис Блеск Солнца (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst91Quest4_HORDE_Note = "Слитки зараженного саронита лежат в яме повсеместно. Используйте молот начальника кузни, который падает с начальника кузни Гархлада, на кузню около него."
Inst91Quest4_HORDE_Prequest = "Возвращение к Миралию Блеску Солнца"
Inst91Quest4_HORDE_Folgequest = "Закалить клинок ("..YELLOW.."Кузня душ"..WHITE..")"
Inst91Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST92 - Halls of Reflection (HoR)  ---------------

Inst92Story = "Возглавляемые Джайной и Сильваной, отважные герои окажутся в ледяных залах, где обнаружат Ледяную Скорбь – легендарное оружие и воплощение скверны, которую несет сам Король-лич. Это значит, что личные палаты Артаса где-то недалеко. Что же ожидает отважных героев – слава или смерть?"
Inst92Caption = "Залы отражений"
Inst92QAA = "3 задания"
Inst92QAH = "3 задания"

--Quest 1 Alliance
Inst92Quest1 = "1. Ледяная Скорбь"
Inst92Quest1_Level = "80"
Inst92Quest1_Attain = "80"
Inst92Quest1_Aim = "Встретьтесь с леди Джайной Праудмур у входа в Залы Отражений."
Inst92Quest1_Location = "Леди Джайна Праудмур (Яма Сарона; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_Note = "Вы получите это задание от Леди Джайны Праудмур после прохождения Ямы Сарона и сможете его завершить в начале Залов отражений. Убедитесь, что все члены группы сдали это задание до запуска ивента. Следующее задание будет доступно после завершения ивента."
Inst92Quest1_Prequest = "Зачистка Ямы ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst92Quest1_Folgequest = "Гнев Короля-лича"
Inst92Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst92Quest2 = "2. Гнев Короля-лича"
Inst92Quest2_Level = "80"
Inst92Quest2_Attain = "80"
Inst92Quest2_Aim = "Найдите леди Джайну Праудмур и выберитесь из Залов Отражений."
Inst92Quest2_Location = "Залы отражений"
Inst92Quest2_Note = "Леди Джайна Праудмур будет в следующей комнате. Вы сможете завершить задание после того как спасетесь от Короля Лича."
Inst92Quest2_Prequest = "Ледяная Скорбь"
Inst92Quest2_Folgequest = "Нет"
Inst92Quest2FQuest = "true"
--
Inst92Quest2name1 = "Эмблема льда"

--Quest 3 Alliance
Inst92Quest3 = "3. Залы отражений"
Inst92Quest3_Level = "80"
Inst92Quest3_Attain = "80"
Inst92Quest3_Aim = "Отнесите Кель'Делар в Покои Клинка, что в Залах Отражений."
Inst92Quest3_Location = "Каладис Сияющее Копье (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.2, 31.3"..WHITE..")"
Inst92Quest3_Note = "Вы сможете завершить это задание зайдя в подземелье. На подходе к Фростморну Кель'Далар вырвется из рук и атакует Вас. Убейте меч и подберите Укрощенный Кель'Делар."
Inst92Quest3_Prequest = "Закалить клинок ("..YELLOW.."Кузня душ"..WHITE..")"
Inst92Quest3_Folgequest = "Путешествие к Солнечному Колодцу"
Inst92Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst92Quest1_HORDE = "1. Ледяная Скорбь"
Inst92Quest1_HORDE_Level = "80"
Inst92Quest1_HORDE_Attain = "80"
Inst92Quest1_HORDE_Aim = "Встретьтесь с леди Сильваной Ветрокрылой на входе в Залы Отражений."
Inst92Quest1_HORDE_Location = "Леди Сильвана Ветрокрылая (Яма Сарона; "..YELLOW.."[3]"..WHITE..")"
Inst92Quest1_HORDE_Note = "Вы получите это задание от Леди Сильваны Ветрокрылой после прохождения Ямы Сарона и сможете его завершить в начале Залов отражений. Убедитесь, что все члены группы сдали это задание до запуска ивента. Следующее задание будет доступно после завершения ивента."
Inst92Quest1_HORDE_Prequest = "Зачистка Ямы ("..YELLOW.."Яма Сарона"..WHITE..")"
Inst92Quest1_HORDE_Folgequest = "Гнев Короля-лича"
Inst92Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst92Quest2_HORDE = "2. Гнев Короля-лича"
Inst92Quest2_HORDE_Level = "80"
Inst92Quest2_HORDE_Attain = "80"
Inst92Quest2_HORDE_Aim = "Найдите леди Сильвану Ветрокрылую и выберитесь из Залов Отражений."
Inst92Quest2_HORDE_Location = "Залы отражений"
Inst92Quest2_HORDE_Note = "Леди Сильвана Ветрокрылая будет в следующей комнате. Вы сможете завершить задание после того как спасетесь от Короля Лича."
Inst92Quest2_HORDE_Prequest = "Ледяная Скорбь"
Inst92Quest2_HORDE_Folgequest = "Нет"
Inst92Quest2FQuest_HORDE = "true"
--
Inst92Quest2name1_HORDE = "Эмблема льда"

--Quest 3 Horde
Inst92Quest3_HORDE = "3. Залы отражений"
Inst92Quest3_HORDE_Level = "80"
Inst92Quest3_HORDE_Attain = "80"
Inst92Quest3_HORDE_Aim = "Отнесите Кель'Делар в Покои Клинка, что в Залах Отражений."
Inst92Quest3_HORDE_Location = "Миралис Блеск Солнца (Ледяная корона - Покой Кель'Делара; "..YELLOW.."74.5, 31.1"..WHITE..")"
Inst92Quest3_HORDE_Note = "Вы сможете завершить это задание зайдя в подземелье. На подходе к Фростморну Кель'Далар вырвется из рук и атакует Вас. Убейте меч и подберите Укрощенный Кель'Делар."
Inst92Quest3_HORDE_Prequest = "Закалить клинок ("..YELLOW.."Кузня душ"..WHITE..")"
Inst92Quest3_HORDE_Folgequest = "Путешествие к Солнечному Колодцу"
Inst92Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST93 - Icecrown Citadel (ICC)  ---------------

Inst93Story = "Пробившись в цитадель, герои столкнутся с армией нежити, готовой дать отпор незваным гостям. Командует силами обороны костяное чудовище, лорд Ребрад. Следующим противником выступает верховная надзирательница Культа Проклятых, леди Смертный Шепот. Она укрепляет веру своих последователей обещаниями вечной жизни после смерти.\n\nВзаимная ненависть продолжающих свое восхождение героев Орды и Альянса достигнет апогея во время битвы за Черепной вал. Игрокам предстоит взойти на борт управляемого Саурфангом «Молота Оргрима» или присоединиться к команде «Усмирителя небес» под командованием Мурадина Бронзоборода и принять участие в уникальном противостоянии. Герои каждой из сторон будут делать все, чтобы защитить свой боевой корабль и уничтожить вражеский, доказав, что именно они достойны выступить против Короля-лича."
Inst93Caption = "Цитадель Ледяной Короны"
Inst93QAA = "15 заданий"
Inst93QAH = "15 заданий"

--Quest 1 Alliance
Inst93Quest1 = "1. Лорд Ребрад должен умереть! (Еженедельный)"
Inst93Quest1_Level = "80"
Inst93Quest1_Attain = "80"
Inst93Quest1_Aim = "Убейте Лорд Ребрада."
Inst93Quest1_Location = "Верховный маг Лан'далок (Даларан - Аметистовая Крепость; "..YELLOW.."57.6, 66.9"..WHITE..")"
Inst93Quest1_Note = "Лорд Ребрад находится "..YELLOW.." [1]"..WHITE..".\n\nЕженедельные рейдовые задания выполняются раз в неделю и могут быть выполнены в подземельях на 10 или 25 человек."
Inst93Quest1_Prequest = "Нет"
Inst93Quest1_Folgequest = "Нет"
--
Inst93Quest1name1 = "Эмблема льда"
Inst93Quest1name2 = "Эмблема триумфа"

--Quest 2 Alliance
Inst93Quest2 = "2. Перевербовка (Случайное еженедельное)"
Inst93Quest2_Level = "80"
Inst93Quest2_Attain = "80"
Inst93Quest2_Aim = "Убейте Леди Смертный Шепот, сохранив жизнь Дарнавану."
Inst93Quest2_Location = "Разведчик Минчар (Цитадель Ледяной Короны; "..YELLOW.."Около [1]"..WHITE..")"
Inst93Quest2_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, разведчик Минчар появится после победы над Лордом Ребрадом.\n\nКак только вы начнете бой с Леди Смертный Шепот, появится Дарнаван. Он должен жить на протяжении всей битвы с Леди для выполнения задания."
Inst93Quest2_Prequest = "Нет"
Inst93Quest2_Folgequest = "Нет"
--
Inst93Quest2name1 = "Мешок ледяных сокровищ"

--Quest 3 Alliance
Inst93Quest3 = "3. Оборона Черепного вала (Случайное еженедельное)"
Inst93Quest3_Level = "80"
Inst93Quest3_Attain = "80"
Inst93Quest3_Aim = "Убейте гниющего ледяного великана."
Inst93Quest3_Location = "Лейтенант с 'Усмирителя небес' (Цитадель Ледяной Короны; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, Лейтенант с 'Усмирителя небес' появится после убийства первого треш-пака после Леди Смертный Шепот.\n\nГниющий ледяной великан патрулирует одну из сторон Черепного вала от "..GREEN.."[3]"..WHITE.." до "..GREEN.."[4]"..WHITE.."."
Inst93Quest3_Prequest = "Нет"
Inst93Quest3_Folgequest = "Нет"
--
Inst93Quest3name1 = "Мешок ледяных сокровищ"

--Quest 4 Alliance
Inst93Quest4 = "4. Болезненная задача (Случайное еженедельное)"
Inst93Quest4_Level = "80"
Inst93Quest4_Attain = "80"
Inst93Quest4_Aim = "Если вы заразитесь оранжевой и зеленой порчей, вернитесь к алхимику Адрианне."
Inst93Quest4_Location = "Алхимик Адрианна (Цитадель Ледяной Короны; "..GREEN.."[4']"..WHITE..")"
Inst93Quest4_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, Алхимик Адрианна появится после того как вы убьете Саурфанга Смертоносного.\n\nДля выполнения задания один из участников рейда должен собрать на себя порчу с Тухлопуза и Гниломорда и вернуться к Алхимику Адрианне в течении 30 минут после получения первого эффекта."
Inst93Quest4_Page = {2, "После этого все члены рейда, имеющие задание получат сообщение о его выполнении.\n\nПорча пропадает, если игрок умрет, выйдет из сети, а также если использует Божественное вмешательство или Божественный щит и некоторые другие способности. Охотники, которые выживут с помощью способности Притвориться мертвым не потеряют порчу.", };
Inst93Quest4_Prequest = "Нет"
Inst93Quest4_Folgequest = "Нет"
--
Inst93Quest4name1 = "Мешок ледяных сокровищ"

--Quest 5 Alliance
Inst93Quest5 = "5. Каждая капля крови... (Случайное еженедельное)"
Inst93Quest5_Level = "80"
Inst93Quest5_Attain = "80"
Inst93Quest5_Aim = "Спасите разведчика Минчара прежде, чем его казнят."
Inst93Quest5_Location = "Алрин Проворный (Цитадель Ледяной Короны; Вход в Багровый зал)"
Inst93Quest5_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, Алрин Проворный появится как только вы подойдете к Багровому залу.\n\nКак только вы зайдете в Багровый зал появится 30-ти минутный таймер. Вы должны убить весь треш, сразится с Советом Кровавых принцев и победить Кровавую королеву Лана'тель до того как таймер истечет, для выполнения задания."
Inst93Quest5_Prequest = "Нет"
Inst93Quest5_Folgequest = "Нет"
--
Inst93Quest5name1 = "Мешок ледяных сокровищ"

--Quest 6 Alliance
Inst93Quest6 = "6. Отдых для измученной души (Случайное еженедельное)"
Inst93Quest6_Level = "80"
Inst93Quest6_Attain = "80"
Inst93Quest6_Aim = "Воспользуйтесь кристаллами жизни, чтобы сохранить душу Синдрагосы."
Inst93Quest6_Location = "Валитрия Сноходица (Цитадель Ледяной Короны; "..YELLOW.."[11]"..WHITE..")"
Inst93Quest6_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, Валитрия Сноходица даст вам это задание, после того как ваш рейд её вылечит."
Inst93Quest6_Page = {2, "Для выполнения задания, члены рейда должны использовать Пульсирующий кристалл жизни для создания отрицательного эффекта (30 в рейде на 10 человек, 75 в рейде на 25 человек) на Синдрагосе, когда у нее останется менее 20% здоровья. Если Синдрагоса получит ауру Сохранения души, до того как умрет, задание будет считаться выполненым.", };
Inst93Quest6_Prequest = "Нет"
Inst93Quest6_Folgequest = "Нет"
--
Inst93Quest6name1 = "Мешок ледяных сокровищ"

--Quest 7 Alliance
Inst93Quest7 = "7. Святость и скверна"
Inst93Quest7_Level = "80"
Inst93Quest7_Attain = "80"
Inst93Quest7_Aim = "Поместите Отмщение Света, 25 кусков древнейшего саронита, разъедающую кровь Гниломорда и разъедающую кровь Тухлопуза в кузню рун Верховного лорда Могрейна в Цитадели Ледяной Короны."
Inst93Quest7_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest7_Note = " Эта цепочка заданий доступна только войнам, паладинам и рыцарям смерти. Кузня рун Верховного лорда Могрейна находится на входе в Цитадель Ледяной Короны.\n Разъедающая кровь Гниломорда и Разъедающая кровь Тухлопуза падает только в подземелье на 25 человек и может быть подобрана только одним членом рейда."
Inst93Quest7_Prequest = "Нет"
Inst93Quest7_Folgequest = "Грань Тьмы"
-- No Rewards for this quest

--Quest 8 Alliance
Inst93Quest8 = "8. Грань Тьмы"
Inst93Quest8_Level = "80"
Inst93Quest8_Attain = "80"
Inst93Quest8_Aim = "Подождите, пока Могрейн выкует ваше оружие."
Inst93Quest8_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest8_Note = "Подождите, пока Могрейн сделает ваше оружие, и заберите его, когда он закончит."
Inst93Quest8_Prequest = "Святость и скверна"
Inst93Quest8_Folgequest = "Пиршество душ"
Inst93Quest8FQuest = "true"
--
Inst93Quest8name1 = "Грань Тьмы"

--Quest 9 Alliance
Inst93Quest9 = "9. Пиршество душ"
Inst93Quest9_Level = "80"
Inst93Quest9_Attain = "80"
Inst93Quest9_Aim = "Верховный лорд Могрейн поручил вам убить 1000 слуг Короля-лича в Цитадели Ледяной Короны с помощью Грани Тьмы. Души будут засчитаны в рейде на 10 или 25 игроков."
Inst93Quest9_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest9_Note = "Вы должны сделать множество убийств. Только убийства треша или боссов ЦЛК помогут вам набрать 1000."
Inst93Quest9_Prequest = "Грань Тьмы"
Inst93Quest9_Folgequest = "Сила нечестивости"
Inst93Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst93Quest10 = "10. Сила нечестивости"
Inst93Quest10_Level = "80"
Inst93Quest10_Attain = "80"
Inst93Quest10_Aim = "Верховный лорд Дарион Могрейн приказал вам наполнить Грань Тьмы силой нечестивости и убить профессора Мерзоцида."
Inst93Quest10_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest10_Note = "Это задание можно выполнить только в рейде для 25 игроков в Цитадели Ледяной Короны.\n\nДля наполнения Грани Тьмы вы должны во время боя с профессором Мерзоцидом взять под свой контроль Абоминацию (Мутировавшее Поганище?) и использовать специальную способность - Защита теней."
Inst93Quest10_Prequest = "Пиршество душ"
Inst93Quest10_Folgequest = "Сила крови"
Inst93Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst93Quest11 = "11. Сила крови"
Inst93Quest11_Level = "80"
Inst93Quest11_Attain = "80"
Inst93Quest11_Aim = "Верховный лорд Дарион Могрейн приказал вам наполнить Грань Тьмы силой крови и убить королеву Лана'тель."
Inst93Quest11_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest11_Note = "Это задание можно выполнить только в рейде для 25 игроков в Цитадели Ледяной Короны.\n\nДля выполнения задания, вы должны под воздействие Кровавого зеркала. Вы не должны быть укушены первым, вас обязательно должен укусить самый первый вампир, т.е. вы должны быть вторым вампиром. После этого вы должны лично укусить еще 3х членов рейда для выполнения задания."
Inst93Quest11_Prequest = "Сила нечестивости"
Inst93Quest11_Folgequest = "Сила льда"
Inst93Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst93Quest12 = "12. Сила льда"
Inst93Quest12_Level = "80"
Inst93Quest12_Attain = "80"
Inst93Quest12_Aim = "Верховный лорд Дарион Могрейн приказал вам четыре раза попасть под действие ледяного дыхания Синдрагосы, держа при себе Грань Тьмы, после чего убить дракона."
Inst93Quest12_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest12_Note = "Это задание можно выполнить только в рейде для 25 игроков в Цитадели Ледяной Короны.\n\nВы должны получить 4 стака Поглощения морозного дыхания от 4х попаданий в Ледяное дыхание Синдрагосы, после этого у вас будет 6 минут чтобы убить босса и выполнить задание."
Inst93Quest12_Prequest = "Сила крови"
Inst93Quest12_Folgequest = "Расколотый трон"
Inst93Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst93Quest13 = "13. Расколотый трон"
Inst93Quest13_Level = "80"
Inst93Quest13_Attain = "80"
Inst93Quest13_Aim = "Верховный лорд Могрейн поручил вам собрать 50 осколков Льда Тьмы."
Inst93Quest13_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest13_Note = "Осколки Льда Тьмы можно получить только в рейде 25 игроков.\n\nОсколки Льда Тьмы падают со всех боссов с небольшим шансом."
Inst93Quest13_Prequest = "Сила льда"
Inst93Quest13_Folgequest = "Темная Скорбь..."
Inst93Quest13FQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst93Quest14 = "14. Темная Скорбь..."
Inst93Quest14_Level = "80"
Inst93Quest14_Attain = "80"
Inst93Quest14_Aim = "Верховный лорд Могрейн просит вас принести ему Грань Тьмы."
Inst93Quest14_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest14_Note = "Это задание обновит вашу Грань Тьмы до Темной Скорби."
Inst93Quest14_Prequest = "Расколотый трон"
Inst93Quest14_Folgequest = "Последняя битва Короля-лича"
Inst93Quest14FQuest = "true"
--
Inst93Quest14name1 = "Темная Скорбь"

--Quest 15 Alliance
Inst93Quest15 = "15. Последняя битва Короля-лича"
Inst93Quest15_Level = "80"
Inst93Quest15_Attain = "80"
Inst93Quest15_Aim = "Верховный лорд Дарион Могрейн приказал вам убить Короля-лича."
Inst93Quest15_Location = "Верховный лорд Дарион Могрейн (Цитадель Ледяной Короны; "..GREEN.."[1']"..WHITE..")"
Inst93Quest15_Note = "Чтобы выполнить это задание, вам придется убить Короля Лича в рейде на 25 игроков."
Inst93Quest15_Prequest = "Темная Скорбь..."
Inst93Quest15_Folgequest = "Нет"
Inst93Quest15FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst93Quest1_HORDE = Inst93Quest1
Inst93Quest1_HORDE_Level = Inst93Quest1_Level
Inst93Quest1_HORDE_Attain = Inst93Quest1_Attain
Inst93Quest1_HORDE_Aim = Inst93Quest1_Aim
Inst93Quest1_HORDE_Location = Inst93Quest1_Location
Inst93Quest1_HORDE_Note = Inst93Quest1_Note
Inst93Quest1_HORDE_Prequest = Inst93Quest1_Prequest
Inst93Quest1_HORDE_Folgequest = Inst93Quest1_Folgequest
--
Inst93Quest1name1_HORDE = Inst93Quest1name1
Inst93Quest1name2_HORDE = Inst93Quest1name2

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst93Quest2_HORDE = Inst93Quest2
Inst93Quest2_HORDE_Level = Inst93Quest2_Level
Inst93Quest2_HORDE_Attain = Inst93Quest2_Attain
Inst93Quest2_HORDE_Aim = Inst93Quest2_Aim
Inst93Quest2_HORDE_Location = Inst93Quest2_Location
Inst93Quest2_HORDE_Note = Inst93Quest2_Note
Inst93Quest2_HORDE_Prequest = Inst93Quest2_Prequest
Inst93Quest2_HORDE_Folgequest = Inst93Quest2_Folgequest
--
Inst93Quest2name1_HORDE = Inst93Quest2name1

--Quest 3 Horde
Inst93Quest3_HORDE = "3. Оборона Черепного вала (Случайное еженедельное)"
Inst93Quest3_HORDE_Level = "80"
Inst93Quest3_HORDE_Attain = "80"
Inst93Quest3_HORDE_Aim = "Убейте гниющего ледяного великана."
Inst93Quest3_HORDE_Location = "Кор'кронский лейтенант (Цитадель Ледяной Короны; "..GREEN.."[3']"..WHITE..")"
Inst93Quest3_HORDE_Note = "Это одно из пяти случайных заданий доступных в Цитадели Ледяной Короны. Если это задание доступно для id вашего рейда, Кор'кронский лейтенант появится после убийства первого треш-пака после Леди Смертный Шепот.\n\nГниющий ледяной великан патрулирует одну из сторон Черепного вала от "..GREEN.."[3]"..WHITE.." до "..GREEN.."[4]"..WHITE.."."
Inst93Quest3_HORDE_Prequest = "Нет"
Inst93Quest3_HORDE_Folgequest = "Нет"
--
Inst93Quest3name1_HORDE = "Мешок ледяных сокровищ"

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst93Quest4_HORDE = Inst93Quest4
Inst93Quest4_HORDE_Level = Inst93Quest4_Level
Inst93Quest4_HORDE_Attain = Inst93Quest4_Attain
Inst93Quest4_HORDE_Aim = Inst93Quest4_Aim
Inst93Quest4_HORDE_Location = Inst93Quest4_Location
Inst93Quest4_HORDE_Note = Inst93Quest4_Note
Inst93Quest4_HORDE_Page = Inst93Quest4_Page
Inst93Quest4_HORDE_Prequest = Inst93Quest4_Prequest
Inst93Quest4_HORDE_Folgequest = Inst93Quest4_Folgequest
--
Inst93Quest4name1_HORDE = Inst93Quest4name1

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst93Quest5_HORDE = Inst93Quest5
Inst93Quest5_HORDE_Level = Inst93Quest5_Level
Inst93Quest5_HORDE_Attain = Inst93Quest5_Attain
Inst93Quest5_HORDE_Aim = Inst93Quest5_Aim
Inst93Quest5_HORDE_Location = Inst93Quest5_Location
Inst93Quest5_HORDE_Note = Inst93Quest5_Note
Inst93Quest5_HORDE_Prequest = Inst93Quest5_Prequest
Inst93Quest5_HORDE_Folgequest = Inst93Quest5_Folgequest
--
Inst93Quest5name1_HORDE = Inst93Quest5name1

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst93Quest6_HORDE = Inst93Quest6
Inst93Quest6_HORDE_Level = Inst93Quest6_Level
Inst93Quest6_HORDE_Attain = Inst93Quest6_Attain
Inst93Quest6_HORDE_Aim = Inst93Quest6_Aim
Inst93Quest6_HORDE_Location = Inst93Quest6_Location
Inst93Quest6_HORDE_Note = Inst93Quest6_Note
Inst93Quest6_HORDE_Page = Inst93Quest6_Page
Inst93Quest6_HORDE_Prequest = Inst93Quest6_Prequest
Inst93Quest6_HORDE_Folgequest = Inst93Quest6_Folgequest
--
Inst93Quest6name1_HORDE = Inst93Quest6name1

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst93Quest7_HORDE = Inst93Quest7
Inst93Quest7_HORDE_Level = Inst93Quest7_Level
Inst93Quest7_HORDE_Attain = Inst93Quest7_Attain
Inst93Quest7_HORDE_Aim = Inst93Quest7_Aim
Inst93Quest7_HORDE_Location = Inst93Quest7_Location
Inst93Quest7_HORDE_Note = Inst93Quest7_Note
Inst93Quest7_HORDE_Prequest = Inst93Quest7_Prequest
Inst93Quest7_HORDE_Folgequest = Inst93Quest7_Folgequest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst93Quest8_HORDE = Inst93Quest8
Inst93Quest8_HORDE_Level = Inst93Quest8_Level
Inst93Quest8_HORDE_Attain = Inst93Quest8_Attain
Inst93Quest8_HORDE_Aim = Inst93Quest8_Aim
Inst93Quest8_HORDE_Location = Inst93Quest8_Location
Inst93Quest8_HORDE_Note = Inst93Quest8_Note
Inst93Quest8_HORDE_Prequest = Inst93Quest8_Prequest
Inst93Quest8_HORDE_Folgequest = Inst93Quest8_Folgequest
Inst93Quest8FQuest_HORDE = Inst93Quest8FQuest
--
Inst93Quest8name1_HORDE = Inst93Quest8name1

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst93Quest9_HORDE = Inst93Quest9
Inst93Quest9_HORDE_Level = Inst93Quest9_Level
Inst93Quest9_HORDE_Attain = Inst93Quest9_Attain
Inst93Quest9_HORDE_Aim = Inst93Quest9_Aim
Inst93Quest9_HORDE_Location = Inst93Quest9_Location
Inst93Quest9_HORDE_Note = Inst93Quest9_Note
Inst93Quest9_HORDE_Prequest = Inst93Quest9_Prequest
Inst93Quest9_HORDE_Folgequest = Inst93Quest9_Folgequest
Inst93Quest9FQuest_HORDE = Inst93Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst93Quest10_HORDE = Inst93Quest10
Inst93Quest10_HORDE_Level = Inst93Quest10_Level
Inst93Quest10_HORDE_Attain = Inst93Quest10_Attain
Inst93Quest10_HORDE_Aim = Inst93Quest10_Aim
Inst93Quest10_HORDE_Location = Inst93Quest10_Location
Inst93Quest10_HORDE_Note = Inst93Quest10_Note
Inst93Quest10_HORDE_Prequest = Inst93Quest10_Prequest
Inst93Quest10_HORDE_Folgequest = Inst93Quest10_Folgequest
Inst93Quest10FQuest_HORDE = Inst93Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst93Quest11_HORDE = Inst93Quest11
Inst93Quest11_HORDE_Level = Inst93Quest11_Level
Inst93Quest11_HORDE_Attain = Inst93Quest11_Attain
Inst93Quest11_HORDE_Aim = Inst93Quest11_Aim
Inst93Quest11_HORDE_Location = Inst93Quest11_Location
Inst93Quest11_HORDE_Note = Inst93Quest11_Note
Inst93Quest11_HORDE_Prequest = Inst93Quest11_Prequest
Inst93Quest11_HORDE_Folgequest = Inst93Quest11_Folgequest
Inst93Quest11FQuest_HORDE = Inst93Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst93Quest12_HORDE = Inst93Quest12
Inst93Quest12_HORDE_Level = Inst93Quest12_Level
Inst93Quest12_HORDE_Attain = Inst93Quest12_Attain
Inst93Quest12_HORDE_Aim = Inst93Quest12_Aim
Inst93Quest12_HORDE_Location = Inst93Quest12_Location
Inst93Quest12_HORDE_Note = Inst93Quest12_Note
Inst93Quest12_HORDE_Prequest = Inst93Quest12_Prequest
Inst93Quest12_HORDE_Folgequest = Inst93Quest12_Folgequest
Inst93Quest12FQuest_HORDE = Inst93Quest12FQuest
-- No Rewards for this quest

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst93Quest13_HORDE = Inst93Quest13
Inst93Quest13_HORDE_Level = Inst93Quest13_Level
Inst93Quest13_HORDE_Attain = Inst93Quest13_Attain
Inst93Quest13_HORDE_Aim = Inst93Quest13_Aim
Inst93Quest13_HORDE_Location = Inst93Quest13_Location
Inst93Quest13_HORDE_Note = Inst93Quest13_Note
Inst93Quest13_HORDE_Prequest = Inst93Quest13_Prequest
Inst93Quest13_HORDE_Folgequest = Inst93Quest13_Folgequest
Inst93Quest13FQuest_HORDE = Inst93Quest13FQuest
-- No Rewards for this quest

--Quest 14 Horde  (same as Quest 14 Alliance)
Inst93Quest14_HORDE = Inst93Quest14
Inst93Quest14_HORDE_Level = Inst93Quest14_Level
Inst93Quest14_HORDE_Attain = Inst93Quest14_Attain
Inst93Quest14_HORDE_Aim = Inst93Quest14_Aim
Inst93Quest14_HORDE_Location = Inst93Quest14_Location
Inst93Quest14_HORDE_Note = Inst93Quest14_Note
Inst93Quest14_HORDE_Prequest = Inst93Quest14_Prequest
Inst93Quest14_HORDE_Folgequest = Inst93Quest14_Folgequest
Inst93Quest14FQuest_HORDE = Inst93Quest14FQuest
--
Inst93Quest14name1_HORDE = Inst93Quest14name1
-- No Rewards for this quest

--Quest 15 Horde  (same as Quest 15 Alliance)
Inst93Quest15_HORDE = Inst93Quest15
Inst93Quest15_HORDE_Level = Inst93Quest15_Level
Inst93Quest15_HORDE_Attain = Inst93Quest15_Attain
Inst93Quest15_HORDE_Aim = Inst93Quest15_Aim
Inst93Quest15_HORDE_Location = Inst93Quest15_Location
Inst93Quest15_HORDE_Note = Inst93Quest15_Note
Inst93Quest15_HORDE_Prequest = Inst93Quest15_Prequest
Inst93Quest15_HORDE_Folgequest = Inst93Quest15_Folgequest
Inst93Quest15FQuest_HORDE = Inst93Quest15FQuest
-- No Rewards for this quest



--------------- INST94 - Ruby Sanctum (RS)  ---------------

Inst94Story = "Могущественное воинство черных драконов, во главе которого стоит зловещий сумеречный дракон Халион, нанесло удар по Рубиновому святилищу у подножия Храма Драконьего Покоя. Разрушив святилище, драконы решили расправиться со всеми, кто может помешать их господину вернуться в Азерот и разрушить Драконий союз – священную нить, которая соединяет все драконьи роды.\n\nПредстоящая битва нанесет красным драконам сокрушительный удар, но вы можете остановить это невиданное доселе наступление и защитить Рубиновое святилище. Сначала вам предстоит одержать верх над слугами Халиона: Савианой Огненной Пропастью, Балтаром Рожденным в Битве и Генералом Заритрианом. Лишь после этого дорога к Халиону Сумеречному Разрушителю, новоявленному палачу всего живого, будет свободна."
Inst94Caption = "Рубиновое святилище"
Inst94QAA = "3 задания"
Inst94QAH = "3 задания"

--Quest 1 Alliance
Inst94Quest1 = "1. Беда в храме Драконьего Покоя"
Inst94Quest1_Level = "80"
Inst94Quest1_Attain = "80"
Inst94Quest1_Aim = "Поговорите с Красом в храме Драконьего Покоя, что в Драконьем погосте."
Inst94Quest1_Location = "Ронин (Даларан - Аметистовая цитадель; "..YELLOW.."30.5, 48.4"..WHITE..")"
Inst94Quest1_Note = "Крас находится (Драконий Погост - храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE..")."
Inst94Quest1_Prequest = "Нет"
Inst94Quest1_Folgequest = "Нападение на святилище"
-- No Rewards for this quest

--Quest 2 Alliance
Inst94Quest2 = "2. Нападение на святилище"
Inst94Quest2_Level = "80"
Inst94Quest2_Attain = "80"
Inst94Quest2_Aim = "Осмотрите Рубиновое святилище под храмом Драконьего Покоя."
Inst94Quest2_Location = "Крас (Драконий Погост - храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE..")"
Inst94Quest2_Note = "Хранительница святилища Зерестраза находится внутри Рубинового святилища и появится после того, как вы убьете Балтара, Рождённого в Битве около "..YELLOW.."[4]"..WHITE.."."
Inst94Quest2_Prequest = "Беда в храме Драконьего Покоя (необязательно)"
Inst94Quest2_Folgequest = "Сумеречный разрушитель"
Inst94Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst94Quest3 = "3. Сумеречный разрушитель"
Inst94Quest3_Level = "80"
Inst94Quest3_Attain = "80"
Inst94Quest3_Aim = "Победите Халиона и отразите нападение на Рубиновое святилище."
Inst94Quest3_Location = "Хранительница святилища Зерестраза (Рубиновое святилище; "..YELLOW.."[4]"..WHITE..")"
Inst94Quest3_Note = "Халион - главный босс Рубинового святилища, находится "..YELLOW.."[1]"..WHITE..". Задание сдается Красу (Драконий Погост - храм Драконьего Покоя; "..YELLOW.."59.8, 54.6"..WHITE..")."
Inst94Quest3_Prequest = "Нападение на святилище"
Inst94Quest3_Folgequest = "Нет"
Inst94Quest3FQuest = "true"
--
Inst94Quest3name1 = "Эмблема льда"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst94Quest1_HORDE = Inst94Quest1
Inst94Quest1_HORDE_Level = Inst94Quest1_Level
Inst94Quest1_HORDE_Attain = Inst94Quest1_Attain
Inst94Quest1_HORDE_Aim = Inst94Quest1_Aim
Inst94Quest1_HORDE_Location = Inst94Quest1_Location
Inst94Quest1_HORDE_Note = Inst94Quest1_Note
Inst94Quest1_HORDE_Prequest = Inst94Quest1_Prequest
Inst94Quest1_HORDE_Folgequest = Inst94Quest1_Folgequest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst94Quest2_HORDE = Inst94Quest2
Inst94Quest2_HORDE_Level = Inst94Quest2_Level
Inst94Quest2_HORDE_Attain = Inst94Quest2_Attain
Inst94Quest2_HORDE_Aim = Inst94Quest2_Aim
Inst94Quest2_HORDE_Location = Inst94Quest2_Location
Inst94Quest2_HORDE_Note = Inst94Quest2_Note
Inst94Quest2_HORDE_Prequest = Inst94Quest2_Prequest
Inst94Quest2_HORDE_Folgequest = Inst94Quest2_Folgequest
Inst94Quest2FQuest_HORDE = Inst94Quest2FQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst94Quest3_HORDE = Inst94Quest3
Inst94Quest3_HORDE_Level = Inst94Quest3_Level
Inst94Quest3_HORDE_Attain = Inst94Quest3_Attain
Inst94Quest3_HORDE_Aim = Inst94Quest3_Aim
Inst94Quest3_HORDE_Location = Inst94Quest3_Location
Inst94Quest3_HORDE_Note = Inst94Quest3_Note
Inst94Quest3_HORDE_Prequest = Inst94Quest3_Prequest
Inst94Quest3_HORDE_Folgequest = Inst94Quest3_Folgequest
Inst94Quest3FQuest_HORDE = Inst94Quest3FQuest
--
Inst94Quest3name1_HORDE = Inst94Quest3name1



---------------------------------------------------
---------------- BATTLEGROUNDS --------------------
---------------------------------------------------



--------------- INST33 - Alterac Valley (AV) ---------------

Inst33Story = "Long ago, before the First War, the warlock Gul'dan exiled a clan of orcs called the Frostwolves to a hidden valley deep in the heart of the Альтеракские горы. It is here in the valley's southern reaches that the Frostwolves eked out a living until the coming of Тралл.\nAfter Тралл's triumphant uniting of the clans, the Frostwolves, now led by the Orc Шаман Drek'Thar, chose to remain in the valley they had for so long called their home. In recent times, however, the relative peace of the Frostwolves has been challenged by the arrival of the Dwarven Stormpike Expedition.\nThe Stormpikes have set up residence in the valley to search for natural resources and ancient relics. Despite their intentions, the Dwarven presence has sparked heated conflict with the Frostwolf Orcs to the south, who have vowed to drive the interlopers from their lands. "
Inst33Caption = "Альтеракская долина"
Inst33QAA = "18 Заданий"
Inst33QAH = "18 Заданий"

--Quest 1 Alliance
Inst33Quest1 = "1. К оружию! Альтеракская долина (ежедн.)"
Inst33Quest1_Level = "51"
Inst33Quest1_Attain = "51"
Inst33Quest1_Aim = "Победите на поле боя Альтеракской долины и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst33Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,34"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."70,91"..WHITE.."\n   Дарнасс: Терраса Воинов - "..YELLOW.."59,36"..WHITE.."\n   Экзодар: Чертог Света - "..YELLOW.."25,55"
Inst33Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst33Quest1_Prequest = "Нет"
Inst33Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst33Quest2 = "2. Королевское право"
Inst33Quest2_Level = "60"
Inst33Quest2_Attain = "51"
Inst33Quest2_Aim = "Отправляйтесь в Альтеракскую долину, к предгорьям Хилсбрада. Найдите лейтенанта Мурпа рядом со входом в туннель и поговорите с ним."
Inst33Quest2_Location = "Лейтенант Ротимер (Стальгорн - Зал общин; "..YELLOW.."30,62"..WHITE..")"
Inst33Quest2_Note = "Лейтенант Мурп находится около (Альтеракские горы; "..YELLOW.."39,81"..WHITE..")."
Inst33Quest2_Prequest = "Нет"
Inst33Quest2_Folgequest = "Испытательные земли"
-- No Rewards for this quest

--Quest 3 Alliance
Inst33Quest3 = "3. Испытательные земли"
Inst33Quest3_Level = "60"
Inst33Quest3_Attain = "51"
Inst33Quest3_Aim = "Отправляйтесь в пещеру Ледяного Крыла, которая расположена в Альтеракской долине, на юго-западе от Дун Болдара, и добудьте знамя Грозовой Вершины. Отдайте знамя лейтенанту Мурпу в Альтеракских горах."
Inst33Quest3_Location = "Лейтенант Мурп (Альтеракские горы; "..YELLOW.."39,81"..WHITE..")"
Inst33Quest3_Note = "Знамя Грозовой Вершины находится в Пещере ледяного крыла "..YELLOW.."[11]"..WHITE.." в Альтеракская долина - Север. Говорите с этим персонажем каждый раз, когда получаете новый уровень репутации, а также для обновления Знака различия.\n\nПредшествующее задание не обязательно для выполнения этого."
Inst33Quest3_Prequest = "Королевское право"
Inst33Quest3_Folgequest = "Нет"
Inst33Quest3FQuest = "true"
--
Inst33Quest3name1 = "Stormpike Insignia Rank 1"
Inst33Quest3name2 = "The Frostwolf Artichoke"

--Quest 4 Alliance
Inst33Quest4 = "4. Битва за Альтерак"
Inst33Quest4_Level = "60"
Inst33Quest4_Attain = "51"
Inst33Quest4_Aim = "Отправляйтесь в Альтеракскую долину, сразитесь с генералом Орды Дрек'Таром и возвращайтесь к геологу Камнетерке в Альтеракские горы."
Inst33Quest4_Location = "Геолог Камнетерка (Альтеракские горы; "..YELLOW.."41,80"..WHITE..") и\n(Альтеракская долина - Север; "..YELLOW.."[B]"..WHITE..")"
Inst33Quest4_Note = "Дрек'Тар находится около (Альтеракская долина - Юг; "..YELLOW.."[B]"..WHITE.."). Недостаточно его убить для выполнения квеста. Вы также должны выиграть поле боя.\nПосле выполнения этого задания поговорите снова с Геологом."
Inst33Quest4_Prequest = "Нет"
Inst33Quest4_Folgequest = "Герой Грозовой Вершины"
--
Inst33Quest4name1 = "Bloodseeker"
Inst33Quest4name2 = "Ice Barbed Spear"
Inst33Quest4name3 = "Wand of Biting Cold"
Inst33Quest4name4 = "Cold Forged Hammer"

--Quest 5 Alliance
Inst33Quest5 = "5. Интендант"
Inst33Quest5_Level = "60"
Inst33Quest5_Attain = "51"
Inst33Quest5_Aim = "Поговорите с интендантом клана Грозовой Вершины."
Inst33Quest5_Location = "Горный пехотинец Гулкий Крик (Альтеракская долина - Север; "..YELLOW.."Рядом с [3] до моста"..WHITE..")"
Inst33Quest5_Note = "Интендант клана Грозовой Вершины находится около (Альтеракская долина - Север; "..YELLOW.."[7]"..WHITE.."), также он дает и другие задания."
Inst33Quest5_Prequest = "Нет"
Inst33Quest5_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 6 Alliance
Inst33Quest6 = "6. Припасы Ледяного Зуба"
Inst33Quest6_Level = "60"
Inst33Quest6_Attain = "51"
Inst33Quest6_Aim = "Принесите 10 ящиков с припасами Ледяного Зуба интенданту Альянса в Дун Болдар."
Inst33Quest6_Location = "Интендант клана Грозовой Вершины (Альтеракская долина - Север; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest6_Note = "Ящики с припасами находятся в Руднике ледяного зуба (Альтеракская долина - Юг; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_Prequest = "Нет"
Inst33Quest6_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 7 Alliance
Inst33Quest7 = "7. Припасы Железного рудника"
Inst33Quest7_Level = "60"
Inst33Quest7_Attain = "51"
Inst33Quest7_Aim = "Принесите 10 припасов Железного рудника интенданту Альянса в Дун Болдар. "
Inst33Quest7_Location = "Интендант клана Грозовой Вершины (Альтеракская долина - Север; "..YELLOW.."[7]"..WHITE..")"
Inst33Quest7_Note = "Ящики с припасами находятся в Железном руднике (Альтеракская долина - Север; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_Prequest = "Нет"
Inst33Quest7_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 8 Alliance
Inst33Quest8 = "8. Обломки брони"
Inst33Quest8_Level = "60"
Inst33Quest8_Attain = "51"
Inst33Quest8_Aim = "Принесите 20 обломков брони Мурготу Подземной Кузне в Дун Болдар."
Inst33Quest8_Location = "Мургот Подземная Кузня (Альтеракская долина - Север; "..YELLOW.."[4]"..WHITE..")"
Inst33Quest8_Note = "Обломки падают с убитых ордынцев и их стражников. Этот квест повторяемый."
Inst33Quest8_Prequest = "Нет"
Inst33Quest8_Folgequest = "Больше обломков брони"
-- No Rewards for this quest

--Quest 9 Alliance
Inst33Quest9 = "9. Захват рудника"
Inst33Quest9_Level = "60"
Inst33Quest9_Attain = "51"
Inst33Quest9_Aim = "Захватите рудник, который не принадлежит Грозовой Вершине, и возвращайтесь к сержанту Даргену Грозовой Вершине в Альтеракские горы."
Inst33Quest9_Location = "Сержант Дарген Грозовая Вершина (Альтеракские горы; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest9_Note = "Для выполнения задания, вы должны убить Морлоха в Железном руднике (Альтеракская долина - Север; "..YELLOW.."[1]"..WHITE..") или Надсмотрщика Хныкса в Руднике ледяного зуба (Альтеракская долина - Юг; "..YELLOW.."[6]"..WHITE.."), когда шахта находиться под контролем орды."
Inst33Quest9_Prequest = "Нет"
Inst33Quest9_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 10 Alliance
Inst33Quest10 = "10. Башни и бункеры"
Inst33Quest10_Level = "60"
Inst33Quest10_Attain = "51"
Inst33Quest10_Aim = "Уничтожьте вымпел на вражеской башне или бункере и возвращайтесь к сержанту Даргену Грозовой Вершине в Альтеракские горы."
Inst33Quest10_Location = "Сержант Дарген Грозовая Вершина (Альтеракские горы; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest10_Note = "Совсем необязательно захватывать башню, т.к в случае победы на поле боя задание будет считаться выполненым."
Inst33Quest10_Prequest = "Нет"
Inst33Quest10_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 11 Alliance
Inst33Quest11 = "11. Кладбища Альтеракской долины"
Inst33Quest11_Level = "60"
Inst33Quest11_Attain = "51"
Inst33Quest11_Aim = "Захватите кладбище, затем возвращайтесь к сержанту Даргену Грозовой Вершине в Альтеракские горы."
Inst33Quest11_Location = "Сержант Дарген Грозовая Вершина (Альтеракские горы; "..YELLOW.."37,77"..WHITE..")"
Inst33Quest11_Note = "Совсем необязательно захватывать кладбище самому, достаточно во время захвата сражаться рядом. Также в случае победы на поле боя задание будет считаться выполненым."
Inst33Quest11_Prequest = "Нет"
Inst33Quest11_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 12 Alliance
Inst33Quest12 = "12. Пустые стойла"
Inst33Quest12_Level = "60"
Inst33Quest12_Attain = "51"
Inst33Quest12_Aim = "Найдите в Альтеракской долине альтеракского барана. Чтобы приручить барана, используйте учебный ошейник Грозовой Вершины. Для этого надо подойти в барану поближе. Пойманный баран проследует за вами к смотрителю стойл. Поговорите со смотрителем стойл, чтобы получить вознаграждение за пойманных баранов."
Inst33Quest12_Location = "Смотритель стойл из клана Грозовой Вершины (Альтеракская долина - Север; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest12_Note = "За пределами базы гуляет множество баранов. Процесс приручения такой же как у охотников. Задание повторяемое и его можно выполнить только 25 раз за все поле боя всеми игроками. После приручения 25 баранов прибудет кавалерия и поможет в битве."
Inst33Quest12_Prequest = "Нет"
Inst33Quest12_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 13 Alliance
Inst33Quest13 = "13. Упряжь ездовых баранов"
Inst33Quest13_Level = "60"
Inst33Quest13_Attain = "51"
Inst33Quest13_Aim = "You must strike at our enemy's base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go! \n\n<Перевода описания на данный момент нет>"
Inst33Quest13_Location = "Командир наездников на баранах клана Грозовой Вершины (Альтеракская долина - Север; "..YELLOW.."[6]"..WHITE..")"
Inst33Quest13_Note = "Шкуры можно найти в южной части Альтеракской долины."
Inst33Quest13_Prequest = "Нет"
Inst33Quest13_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 14 Alliance
Inst33Quest14 = "14. Гроздь кристаллов"
Inst33Quest14_Level = "60"
Inst33Quest14_Attain = "51"
Inst33Quest14_Aim = "There are times which you may be entrenched in battle for days or weeks on end. During those longer periods of activity you may end up collecting large clusters of the Frostwolf's storm crystals.\n\nThe Circle accepts such offerings. \n\n<Перевода описания на данный момент нет>"
Inst33Quest14_Location = "Верховный друид Дикая Лань (Альтеракская долина - Север; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest14_Note = "После сбора ~200 кристаллов, Верховный друид Дикая Лань will begin walking towards (Альтеракская долина - Север; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
Inst33Quest14_Prequest = "Нет"
Inst33Quest14_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 15 Alliance
Inst33Quest15 = "15. Ивус Лесной Властелин"
Inst33Quest15_Level = "60"
Inst33Quest15_Attain = "51"
Inst33Quest15_Aim = "The Frostwolf Clan is protected by a taint of elemental energy. Their shaman meddle in powers that will surely destroy us all if left unchecked.\n\nThe Frostwolf soldiers carry elemental charms called storm crystals. We can use the charms to conjure Ivus. Venture forth and claim the crystals. \n\n<Перевода описания на данный момент нет>"
Inst33Quest15_Location = "Верховный друид Дикая Лань (Альтеракская долина - Север; "..YELLOW.."[2]"..WHITE..")"
Inst33Quest15_Note = "После сбора ~200 кристаллов, Верховный друид Дикая Лань will begin walking towards (Альтеракская долина - Север; "..YELLOW.."[19]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Ivus the Forest Lord will be summoned to help the battle."
Inst33Quest15_Prequest = "Нет"
Inst33Quest15_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 16 Alliance
Inst33Quest16 = "16. Небо зовет – флот Слидора"
Inst33Quest16_Level = "60"
Inst33Quest16_Attain = "51"
Inst33Quest16_Aim = "My gryphons are poised to strike at the front lines but cannot make the attack until the lines are thinned out.\n\nThe Frostwolf warriors charged with holding the front lines wear medals of service proudly upon their chests. Rip those medals off their rotten corpses and bring them back here.\n\nOnce the front line is sufficiently thinned out, I will make the call to air! Death from above! \n\n<Перевода описания на данный момент нет>"
Inst33Quest16_Location = "Командир звена Макарч (Альтеракская долина - Север; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest16_Note = "Убейте ордынского NPC, чтобы получить Жетон солдата Северного Волка."
Inst33Quest16_Prequest = "Нет"
Inst33Quest16_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 17 Alliance
Inst33Quest17 = "17. Небо зовет – флот Змейера"
Inst33Quest17_Level = "60"
Inst33Quest17_Attain = "51"
Inst33Quest17_Aim = "The elite Frostwolf units that guard the lines must be dealt with, soldier! I'm tasking you with thinning out that herd of savages. Return to me with medals from their lieutenants and legionnaires. When I feel that enough of the riff-raff has been dealt with, I'll deploy the air strike. \n\n<Перевода описания на данный момент нет>"
Inst33Quest17_Location = "Командир звена Сквороц (Альтеракская долина - Север; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest17_Note = "Убейте ордынского NPC, чтобы получить Жетон лейтенанта Северного Волка."
Inst33Quest17_Prequest = "Нет"
Inst33Quest17_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 18 Alliance
Inst33Quest18 = "18. Небо зовет – флот Ромеона"
Inst33Quest18_Level = "60"
Inst33Quest18_Attain = "51"
Inst33Quest18_Aim = "Return to the battlefield and strike at the heart of the Frostwolf's command. Take down their commanders and guardians. Return to me with as many of their medals as you can stuff in your pack! I promise you, when my gryphons see the bounty and smell the blood of our enemies, they will fly again! Go now! \n\n<Перевода описания на данный момент нет>"
Inst33Quest18_Location = "Командир звена Ромеон (Альтеракская долина - Север; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest18_Note = "Убейте ордынского NPC, чтобы получить Жетон командира Северного Волка. После того как будут собраны 50 жетонов, Командир звена Ромеон отправит грифона на ордынскую базу или даст вам маяк на Кладбище Снегопада. Если маяк будет защищаться достаточно долго, то грифон прилетит, чтобы помочь защитить его"
Inst33Quest18_Prequest = "Нет"
Inst33Quest18_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde
Inst33Quest1_HORDE = "1. К оружию! Альтеракская долина (ежедн.)"
Inst33Quest1_HORDE_Level = "51"
Inst33Quest1_HORDE_Attain = "51"
Inst33Quest1_HORDE_Aim = "Победите на поле боя Альтеракской долины и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат "
Inst33Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,57"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."80,30"..WHITE.."\n   Громовой утес: Вершина Охотников - "..YELLOW.."56,77"..WHITE.."\n   Подгород: Королевский квартал - "..YELLOW.."61,88"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97,38"
Inst33Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst33Quest1_HORDE_Prequest = "Нет"
Inst33Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Horde
Inst33Quest2_HORDE = "2. Защита клана Северного Волка"
Inst33Quest2_HORDE_Level = "60"
Inst33Quest2_HORDE_Attain = "51"
Inst33Quest2_HORDE_Aim = "Отправляйтесь в Альтеракскую долину, расположенную в Альтеракских горах. Найдите воеводу Лаггронда у входа в тоннель и поговорите с ним, чтобы начать свою военную карьеру в клане Северного Волка. Альтеракская долина находится к северу от деревни Мельница Таррен у подножия Альтеракских гор."
Inst33Quest2_HORDE_Location = "Посол клана Северного Волка Рокстром (Оргриммар - Аллея Силы "..YELLOW.."50,71"..WHITE..")"
Inst33Quest2_HORDE_Note = "Воевода Лаггронд находится около (Альтеракские горы; "..YELLOW.."62,59"..WHITE..")."
Inst33Quest2_HORDE_Prequest = "Нет"
Inst33Quest2_HORDE_Folgequest = "Испытательные земли"
-- No Rewards for this quest

--Quest 3 Horde
Inst33Quest3_HORDE = "3. Испытательные земли"
Inst33Quest3_HORDE_Level = "60"
Inst33Quest3_HORDE_Attain = "51"
Inst33Quest3_HORDE_Aim = "Отправляйтесь в пещеру Дикой Лапы, расположенную на юго-востоке от основной базы в Альтеракской долине, и добудьте знамя Северного Волка. Отнесите знамя Северного Волка воеводе Лаггронду."
Inst33Quest3_HORDE_Location = "Воевода Лаггронд (Альтеракские горы; "..YELLOW.."62,59"..WHITE..")"
Inst33Quest3_HORDE_Note = "Знамя Северного Волка находится в пещере Дикой Лапы (Альтеракская долина - Юг; "..YELLOW.."[15]"..WHITE.."). Говорите с этим персонажем каждый раз, когда получаете новый уровень репутации, а также для обновления Знака различия.\n\nПредшествующее задание не обязательно для выполнения этого."
Inst33Quest3_HORDE_Prequest = "Защита клана Северного Волка"
Inst33Quest3_HORDE_Folgequest = "Нет"
Inst33Quest3FQuest_HORDE = "true"
--
Inst33Quest3name1_HORDE = "Frostwolf Insignia Rank 1"
Inst33Quest3name2_HORDE = "Peeling the Onion"

--Quest 4 Horde
Inst33Quest4_HORDE = "4. Битва за Альтерак"
Inst33Quest4_HORDE_Level = "60"
Inst33Quest4_HORDE_Attain = "51"
Inst33Quest4_HORDE_Aim = "Отправляйтесь в Альтеракскую долину и убейте генерала дворфов, Вандара Грозовую Вершину. После этого возвращайтесь к Вогге Смертобою в Альтеракские горы."
Inst33Quest4_HORDE_Location = "Вогга Смертобой (Альтеракские горы; "..YELLOW.."64,60"..WHITE..")"
Inst33Quest4_HORDE_Note = "Вогга Смертобой находится около (Альтеракская долина - Север; "..YELLOW.."[B]"..WHITE.."). Недостаточно его убить для выполнения квеста. Вы также должны выиграть поле боя.\nПосле выполнения этого задания поговорите снова с Воггой."
Inst33Quest4_HORDE_Prequest = "Нет"
Inst33Quest4_HORDE_Folgequest = "Герой Северного Волка"
--
Inst33Quest4name1_HORDE = "Bloodseeker"
Inst33Quest4name2_HORDE = "Ice Barbed Spear"
Inst33Quest4name3_HORDE = "Wand of Biting Cold"
Inst33Quest4name4_HORDE = "Cold Forged Hammer"

--Quest 5 Horde
Inst33Quest5_HORDE = "5. Разговор с интендантом"
Inst33Quest5_HORDE_Level = "60"
Inst33Quest5_HORDE_Attain = "51"
Inst33Quest5_HORDE_Aim = "Поговорите с интендантом клана Северного Волка."
Inst33Quest5_HORDE_Location = "Джотек (Альтеракская долина - Юг; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest5_HORDE_Note = "Интендант клана Северного Волка находится около "..YELLOW.."[10]"..WHITE.." и дает новые задания."
Inst33Quest5_HORDE_Prequest = "Нет"
Inst33Quest5_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 6 Horde
Inst33Quest6_HORDE = "6. Припасы Ледяного Зуба"
Inst33Quest6_HORDE_Level = "60"
Inst33Quest6_HORDE_Attain = "51"
Inst33Quest6_HORDE_Aim = "Доставьте 10 припасов Ледяного Зуба интенданту Орды в крепость Северного Волка."
Inst33Quest6_HORDE_Location = "Интендант клана Северного Волка (Альтеракская долина - Юг; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest6_HORDE_Note = "Ящики с припасами находятся в Руднике ледяного зуба (Альтеракская долина - Юг; "..YELLOW.."[6]"..WHITE..")."
Inst33Quest6_HORDE_Prequest = "Нет"
Inst33Quest6_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 7 Horde
Inst33Quest7_HORDE = "7. Припасы Железного рудника"
Inst33Quest7_HORDE_Level = "60"
Inst33Quest7_HORDE_Attain = "51"
Inst33Quest7_HORDE_Aim = "Доставьте 10 ящиков припасов Железного рудника интенданту Орды в крепость Северного Волка."
Inst33Quest7_HORDE_Location = "Интендант клана Северного Волка (Альтеракская долина - Юг; "..YELLOW.."[10]"..WHITE..")"
Inst33Quest7_HORDE_Note = "Ящики с припасами находятся в Железном руднике (Альтеракская долина - Север; "..YELLOW.."[1]"..WHITE..")."
Inst33Quest7_HORDE_Prequest = "Нет"
Inst33Quest7_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 8 Horde
Inst33Quest8_HORDE = "8. Вражеский трофей"
Inst33Quest8_HORDE_Level = "60"
Inst33Quest8_HORDE_Attain = "51"
Inst33Quest8_HORDE_Aim = "Принесите 20 обломков брони кузнецу Регзару в деревню Северного Волка."
Inst33Quest8_HORDE_Location = "Кузнец Регзар (Альтеракская долина - Юг; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest8_HORDE_Note = "Обломки падают с убитых ордынцев и их стражников. Этот квест повторяемый."
Inst33Quest8_HORDE_Prequest = "Нет"
Inst33Quest8_HORDE_Folgequest = "More Booty!"
-- No Rewards for this quest

--Quest 9 Horde
Inst33Quest9_HORDE = "9. Захват рудника"
Inst33Quest9_HORDE_Level = "60"
Inst33Quest9_HORDE_Attain = "51"
Inst33Quest9_HORDE_Aim = "Захватите рудник и возвращайтесь к капралу Тике Кровавому Рыку в Альтеракские горы. "
Inst33Quest9_HORDE_Location = " Капрал Тика Кровавый Рык (Альтеракские горы; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest9_HORDE_Note = "Для выполнения задания, вы должны убить Морлоха в Железном руднике (Альтеракская долина - Север; "..YELLOW.."[1]"..WHITE..") или Надсмотрщика Хныкса в Руднике ледяного зуба (Альтеракская долина - Юг; "..YELLOW.."[6]"..WHITE.."), когда шахта находиться под контролем альянса."
Inst33Quest9_HORDE_Prequest = "Нет"
Inst33Quest9_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 10 Horde
Inst33Quest10_HORDE = "10. Башни и бункеры"
Inst33Quest10_HORDE_Level = "60"
Inst33Quest10_HORDE_Attain = "51"
Inst33Quest10_HORDE_Aim = "Захватите башню врага и возвращайтесь к капралу Тике Кровавому Рыку в Альтеракские горы. "
Inst33Quest10_HORDE_Location = "Капрал Тика Кровавый Рык (Альтеракские горы; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest10_HORDE_Note = "Совсем необязательно захватывать башню, т.к в случае победы на поле боя задание будет считаться выполненым."
Inst33Quest10_HORDE_Prequest = "Нет"
Inst33Quest10_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 11 Horde
Inst33Quest11_HORDE = "11. Кладбища долины Альтерака"
Inst33Quest11_HORDE_Level = "60"
Inst33Quest11_HORDE_Attain = "51"
Inst33Quest11_HORDE_Aim = "Захватите кладбище, затем возвращайтесь к капралу Тике Кровавому Рыку в Альтеракские горы. "
Inst33Quest11_HORDE_Location = "Капрал Тика Кровавый Рык (Альтеракские горы; "..YELLOW.."66,55"..WHITE..")"
Inst33Quest11_HORDE_Note = "Совсем необязательно захватывать кладбище самому, достаточно во время захвата сражаться рядом. Также в случае победы на поле боя задание будет считаться выполненым."
Inst33Quest11_HORDE_Prequest = "Нет"
Inst33Quest11_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 12 Horde
Inst33Quest12_HORDE = "12. Пустые стойла"
Inst33Quest12_HORDE_Level = "60"
Inst33Quest12_HORDE_Attain = "51"
Inst33Quest12_HORDE_Aim = "Найдите северного волка в Альтеракской долине. Подойдите к нему на достаточное расстояние, чтобы его 'приручить', и используйте намордник Северного Волка. После приручения северный волк проследует за вами к смотрителю стойл из клана Северного Волка. Поговорите со смотрителем, чтобы получить награду за пойманных волков."
Inst33Quest12_HORDE_Location = "Смотритель стойл из клана Северного Волка (Альтеракская долина - Юг; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest12_HORDE_Note = "За пределами базы гуляет множество северных волков. Процесс приручения такой же как у охотников. Задание повторяемое и его можно выполнить только 25 раз за все поле боя всеми игроками. После приручения 25 северных волков прибудет кавалерия и поможет в битве."
Inst33Quest12_HORDE_Prequest = "Нет"
Inst33Quest12_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 13 Horde
Inst33Quest13_HORDE = "13. Упряжь из бараньей кожи"
Inst33Quest13_HORDE_Level = "60"
Inst33Quest13_HORDE_Attain = "51"
Inst33Quest13_HORDE_Aim = "You must strike at the indigenous rams of the region. The very same rams that the Stormpike cavalry uses as mounts!\n\nSlay them and return to me with their hides. Once we have gathered enough hides, we will fashion harnesses for the riders. The Frostwolf Wolf Riders will ride once more! <Перевода описания на данный момент нет>"
Inst33Quest13_HORDE_Location = "Командир всадников на волках клана Северного Волка (Альтеракская долина - Юг; "..YELLOW.."[9]"..WHITE..")"
Inst33Quest13_HORDE_Note = "Баранов можно найти в северной части Альтеракской долины."
Inst33Quest13_HORDE_Prequest = "Нет"
Inst33Quest13_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 14 Horde
Inst33Quest14_HORDE = "14. Галлон крови"
Inst33Quest14_HORDE_Level = "60"
Inst33Quest14_HORDE_Attain = "51"
Inst33Quest14_HORDE_Aim = "You have the option of offering larger quantities of the blood taken from our enemies. I will be glad to accept gallon sized offerings. <Перевода описания на данный момент нет>"
Inst33Quest14_HORDE_Location = "Шаманка стихий Турлога (Альтеракская долина - Юг; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest14_HORDE_Note = "После сбора ~150 Крови, Шаманка стихий Турлога will begin walking towards (Альтеракская долина - Юг; "..YELLOW.."[1]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
Inst33Quest14_HORDE_Prequest = "Нет"
Inst33Quest14_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 15 Horde
Inst33Quest15_HORDE = "15. Локолар Владыка Льда"
Inst33Quest15_HORDE_Level = "60"
Inst33Quest15_HORDE_Attain = "51"
Inst33Quest15_HORDE_Aim = "You must strike down our enemies and bring to me their blood. Once enough blood has been gathered, the ritual of summoning may begin.\n\nVictory will be assured when the elemental lord is loosed upon the Stormpike army. <Перевода описания на данный момент нет>"
Inst33Quest15_HORDE_Location = "Шаманка стихий Турлога (Альтеракская долина - Юг; "..YELLOW.."[8]"..WHITE..")"
Inst33Quest15_HORDE_Note = "После сбора ~150 Крови, Шаманка стихий Турлога will begin walking towards (Альтеракская долина - Юг; "..YELLOW.."[1]"..WHITE.."). Once there, she will begin a summoning ritual which will require 10 people to assist. If successful, Lokholar the Ice Lord will be summoned to kill Alliance players."
Inst33Quest15_HORDE_Prequest = "Нет"
Inst33Quest15_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 16 Horde
Inst33Quest16_HORDE = "16. Небо зовет – флот Смуггла"
Inst33Quest16_HORDE_Level = "60"
Inst33Quest16_HORDE_Attain = "51"
Inst33Quest16_HORDE_Aim = "My riders are set to make a strike on the central battlefield; but first, I must wet their appetites - preparing them for the assault.\n\nI need enough Stormpike Soldier Flesh to feed a fleet! Hundreds of pounds! Surely you can handle that, yes? Get going! <Перевода описания на данный момент нет>"
Inst33Quest16_HORDE_Location = "Командир звена Смуггл (Альтеракская долина - Юг; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest16_HORDE_Note = "Kill Alliance NPCs for the Stormpike Lieutenant's Flesh. Reportedly 90 flesh are needed to make the Wing Commander do whatever she does."
Inst33Quest16_HORDE_Prequest = "Нет"
Inst33Quest16_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 17 Horde
Inst33Quest17_HORDE = "17. Небо зовет – флот Мааши"
Inst33Quest17_HORDE_Level = "60"
Inst33Quest17_HORDE_Attain = "51"
Inst33Quest17_HORDE_Aim = "My War Riders must taste in the flesh of their targets. This will ensure a surgical strike against our enemies!\n\nMy fleet is the second most powerful in our air command. Thusly, they will strike at the more powerful of our adversaries. For this, then, they need the flesh of the Stormpike Lieutenants. <Перевода описания на данный момент нет>"
Inst33Quest17_HORDE_Location = "Командир звена Мааша (Альтеракская долина - Юг; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest17_HORDE_Note = "Kill Alliance NPCs for the Stormpike Lieutenant's Flesh."
Inst33Quest17_HORDE_Prequest = "Нет"
Inst33Quest17_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 18 Horde
Inst33Quest18_HORDE = "18. Небо зовет – флот Маэстра"
Inst33Quest18_HORDE_Level = "60"
Inst33Quest18_HORDE_Attain = "51"
Inst33Quest18_HORDE_Aim = "First, my war riders need targets to gun for - high priority targets. I'm going to need to feed them the flesh of Stormpike Commanders. Unfortunately, those little buggers are entrenched deep behind enemy lines! You've definitely got your work cut out for you. <Перевода описания на данный момент нет>"
Inst33Quest18_HORDE_Location = "Командир звена Маэстр (Альтеракская долина - Юг; "..YELLOW.."[13]"..WHITE..")"
Inst33Quest18_HORDE_Note = "Kill Alliance NPCs for the Stormpike Commander's Flesh."
Inst33Quest18_HORDE_Prequest = "Нет"
Inst33Quest18_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST34 - Arathi Basin (AB) ---------------

Inst34Story = "Низина Арати, расположенная в Нагорье Арати, это быстрое и захватывающее Поле сражений. Низина богата ресурсами и ею жаждут обладать и Орда, и Альянс. Отрекшиеся осквернители и Лига Аратора прибыли в низину Арати, чтобы побороться за природные ресурсы и заявить на них права от лица представляемых ими сторон."
Inst34Caption = "Низина Арати"
Inst34QAA = "4 Задания"
Inst34QAH = "4 Задания"

--Quest 1 Alliance
Inst34Quest1 = "1. К оружию! Низина Арати (ежедн.)"
Inst34Quest1_Level = "20"
Inst34Quest1_Attain = "20"
Inst34Quest1_Aim = "Победите на поле боя Низины Арати и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst34Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,34"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."70,91"..WHITE.."\n   Дарнасс: Терраса Воинов - "..YELLOW.."59,36"..WHITE.."\n   Экзодар: Чертог Света - "..YELLOW.."25,55"
Inst34Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst34Quest1_Prequest = "Нет"
Inst34Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Alliance
Inst34Quest2 = "2. Битва за Низину Арати"
Inst34Quest2_Level = "25"
Inst34Quest2_Attain = "25"
Inst34Quest2_Aim = "Нападите на рудник, лесопилку, кузницу и ферму и возвращайтесь к фельдмаршалу Освету в Опорный пункт."
Inst34Quest2_Location = "Фельдмаршал Освет (Нагорье Арати - Опорный пункт; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest2_Note = "Места для нападения помечены на карте от 2 до 5."
Inst34Quest2_Prequest = "Нет"
Inst34Quest2_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 3 Alliance
Inst34Quest3 = "3. Контроль над четырьмя базами"
Inst34Quest3_Level = "60"
Inst34Quest3_Attain = "60"
Inst34Quest3_Aim = "Отправляйтесь в Низину Арати, захватите и удержите контроль над четырьмя базами одновременно, затем возвращайтесь к фельдмаршалу Освету в Опорный пункт."
Inst34Quest3_Location = "Фельдмаршал Освет (Нагорье Арати - Опорный пункт; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest3_Note = "Вы должны быть Дружелюбны с Лигой Аратора, чтобы взять задание."
Inst34Quest3_Prequest = "Нет"
Inst34Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst34Quest4 = "4. Контроль над пятью базами"
Inst34Quest4_Level = "60"
Inst34Quest4_Attain = "60"
Inst34Quest4_Aim = "Возьмите под контроль одновременно все 5 баз в Низине Арати, а затем возвращайтесь к фельдмаршалу Освету в Опорный пункт."
Inst34Quest4_Location = "Фельдмаршал Освет (Нагорье Арати - Опорный пункт; "..YELLOW.."46,45"..WHITE..")"
Inst34Quest4_Note = "Вас должны Превозносить в Лиге Аратора, чтобы вы могли взять это задание"
Inst34Quest4_Prequest = "Нет"
Inst34Quest4_Folgequest = "Нет"
--
Inst34Quest4name1 = "Arathor Battle Tabard"


--Quest 1 Horde
Inst34Quest1_HORDE = "1. К оружию! Низина Арати (ежедн.)"
Inst34Quest1_HORDE_Level = "20"
Inst34Quest1_HORDE_Attain = "20"
Inst34Quest1_HORDE_Aim = "Победите в игре на поле боя Низины Арати и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst34Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,57"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."80,30"..WHITE.."\n   Громовой утес: Вершина Охотников - "..YELLOW.."56,77"..WHITE.."\n   Подгород: Королевский квартал - "..YELLOW.."61,88"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97,38"
Inst34Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst34Quest1_HORDE_Prequest = "Нет"
Inst34Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 2 Horde
Inst34Quest2_HORDE = "2. Битва за Низину Арати"
Inst34Quest2_HORDE_Level = "25"
Inst34Quest2_HORDE_Attain = "25"
Inst34Quest2_HORDE_Aim = "Нападите на рудник, лесопилку, кузницу и стойла в Низине Арати и возвращайтесь к повелительнице смерти Двайр в Павший Молот."
Inst34Quest2_HORDE_Location = "Повелительница смерти Двайр (Нагорье Арати - Павший молот; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest2_HORDE_Note = "Места для нападения помечены на карте от 1 до 4."
Inst34Quest2_HORDE_Prequest = "Нет"
Inst34Quest2_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 3 Horde
Inst34Quest3_HORDE = "3. Захват четырех баз"
Inst34Quest3_HORDE_Level = "60"
Inst34Quest3_HORDE_Attain = "60"
Inst34Quest3_HORDE_Aim = "Удерживайте одновременно четыре базы в Низине Арати, а затем возвращайтесь к повелительнице смерти Двайр в Павший Молот."
Inst34Quest3_HORDE_Location = "Повелительница смерти Двайр (Нагорье Арати - Павший молот; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest3_HORDE_Note = "Вы должны быть Дружелюбны с Осквернителями, чтобы взять это задание."
Inst34Quest3_HORDE_Prequest = "Нет"
Inst34Quest3_HORDE_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Horde
Inst34Quest4_HORDE = "4. Занять пять баз"
Inst34Quest4_HORDE_Level = "60"
Inst34Quest4_HORDE_Attain = "60"
Inst34Quest4_HORDE_Aim = "Захватите и удерживайте все пять баз в Низине Арати, затем возвращайтесь к повелительнице смерти Двайр в Павший Молот."
Inst34Quest4_HORDE_Location = "Повелительница смерти Двайр (Нагорье Арати - Павший молот; "..YELLOW.."74,35"..WHITE..")"
Inst34Quest4_HORDE_Note = "Вас должны Превозносить Осквернители, чтобы вы могли взять это задание."
Inst34Quest4_HORDE_Prequest = "Нет"
Inst34Quest4_HORDE_Folgequest = "Нет"
--
Inst34Quest4name1_HORDE = "Battle Tabard of the Defilers"



--------------- INST35 - Warsong Gulch (WSG) ---------------

Inst35Story = "Ущелье Песни Войны располагается в южной области Ясеневого Леса, на границе со Степями – около местности, где Гром Адский Крик и его Орки вырубали огромные просеки в лесах во время событий Третьей войны. Некоторые Орки так и остались в тех местах, продолжая вырубать леса, чтобы снабжать древесиной растущую Орду.\nНочные эльфы, которые начали массированную военную компанию, чтобы вернуть себе Ясеневый Лес, теперь сосредоточили свое внимание на избавлении своих земель от оставшихся орков раз и навсегда. Серебряные Стражи, откликнулись на зов и поклялись, что они не успокоятся, пока все Орки до единого не будут побеждены и выкинуты из Ущелья Песни Войны."
Inst35Caption = "Ущелье Песни Войны"
Inst35QAA = "1 Задание"
Inst35QAH = "1 Задание"

--Quest 1 Alliance
Inst35Quest1 = "1. К оружию! Ущелье Песни Войны (ежедн.)"
Inst35Quest1_Level = "10"
Inst35Quest1_Attain = "10"
Inst35Quest1_Aim = "Победите в игре на поле боя Ущелья Песни Войны Альтерака и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst35Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,34"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."70,91"..WHITE.."\n   Дарнасс: Терраса Воинов - "..YELLOW.."59,36"..WHITE.."\n   Экзодар: Чертог Света - "..YELLOW.."25,55"
Inst35Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst35Quest1_Prequest = "Нет"
Inst35Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 1 Horde
Inst35Quest1_HORDE = "1. К оружию! Ущелье Песни Войны (ежедн.)"
Inst35Quest1_HORDE_Level = "10"
Inst35Quest1_HORDE_Attain = "10"
Inst35Quest1_HORDE_Aim = "Победите в игре на поле боя Ущелья Песни Войны и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst35Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,57"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."80,30"..WHITE.."\n   Громовой утес: Вершина Охотников - "..YELLOW.."56,77"..WHITE.."\n   Подгород: Королевский квартал - "..YELLOW.."61,88"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97,38"
Inst35Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst35Quest1_HORDE_Prequest = "Нет"
Inst35Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST60 - Eye of the Storm ---------------

Inst60Story = "Высоко над разрушенным ландшафтом Пустоверти парит остров, известный как Око Бури. За это поле сражения борются эльфы крови из-за богатых залежей энергии - и дренеи, заявляющие свои права на таинственный корабль - Крупость Бурь."
Inst60Caption = "Око бури"
Inst60QAA = "1 Задание"
Inst60QAH = "1 Задание"

--Quest 1 Alliance
Inst60Quest1 = "1. К оружию! Око Бури (ежедн.)"
Inst60Quest1_Level = "61"
Inst60Quest1_Attain = "61"
Inst60Quest1_Aim = "Победите в игре на поле боя Ока Бури и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst60Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,34"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."70,91"..WHITE.."\n   Дарнасс: Терраса Воинов - "..YELLOW.."59,36"..WHITE.."\n   Экзодар: Чертог Света - "..YELLOW.."25,55"
Inst60Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst60Quest1_Prequest = "Нет"
Inst60Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. К оружию! Око Бури. (ежедн.)"
Inst60Quest1_HORDE_Level = "61"
Inst60Quest1_HORDE_Attain = "61"
Inst60Quest1_HORDE_Aim = "Победите в игре на поле боя Ока Бури и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst60Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Шаттрат: Нижний город - "..YELLOW.."67,57"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."80,30"..WHITE.."\n   Громовой утес: Вершина Охотников - "..YELLOW.."56,77"..WHITE.."\n   Подгород: Королевский квартал - "..YELLOW.."61,88"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97,38"
Inst60Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Приносимый доход в виде опыта и золота зависит от вашего уровня."
Inst60Quest1_HORDE_Prequest = "Нет"
Inst60Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST83 - Strand of the Ancients (SotA)  ---------------

Inst83Story = "На Береге Древних Орда и Альянс сражаются друг с другом за реликвию, которая хранится в крепости на острове. У каждой команды есть определенное время, чтобы захватить реликвию. За каждую из сторон могут играть одновременно до 15 персонажей. По очереди они высаживаются на берегу и с помощью осадных машин и взрывчатки пытаются, разрушив несколько ворот, прорвать оборону неприятеля и захватить реликвию. Сторона, которой это удается сделать быстрее, считается победителем. "
Inst83Caption = "Берег Древних"
Inst83QAA = "1 задание"
Inst83QAH = "1 задание"

--Quest 1 Alliance
Inst83Quest1 = "1. К оружию! Берег Древних (ежедн.)"
Inst83Quest1_Level = "71"
Inst83Quest1_Attain = "71"
Inst83Quest1_Aim = "Выиграйте битву на поле боя Берега Древних и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst83Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Даларан: Серебряный Анклав - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Шаттрат: Нижний Город - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Дарнасс: Терраса Войнов - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Экзодар: Чертог Свет - "..YELLOW.."24.6, 55.4"
Inst83Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Он дает разное количество опыта и золота в зависимости от уровня."
Inst83Quest1_Prequest = "Нет"
Inst83Quest1_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 1 Horde
Inst83Quest1_HORDE = "1. К оружию! Берег Древних (ежедн.)"
Inst83Quest1_HORDE_Level = "71"
Inst83Quest1_HORDE_Attain = "71"
Inst83Quest1_HORDE_Aim = "Выиграйте битву на поле боя Берега Древних и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst83Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Даларан: Святилище Похитителя Солнца - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Шаттрат: Нижний Город - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Громовой Утес: Вершина Охотников - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Подгород: Королевский Квартал - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97.0, 38.3"
Inst83Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Он дает разное количество опыта и золота в зависимости от уровня."
Inst83Quest1_HORDE_Prequest = "Нет"
Inst83Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest



--------------- INST89 - Isle of Conquest (IoC)  ---------------

Inst89Story = "Остров вдали от берегов Нордскола. Ничем не примечательная скала. И все же, это не обыкновенный остров, как кажется на первый взгляд. О крутой берег с грохотом разбиваются волны: этот звук вторит яростному звону мечей тех, кто сражается на залитом кровью острове, затерянном на краю вечности. \n\nДобро пожаловать на остров Завоеваний."
Inst89Caption = "Остров Завоеваний"
Inst89QAA = "1 задание"
Inst89QAH = "1 задание"

--Quest 1 Alliance
Inst89Quest1 = "1. К оружию! Остров Завоеваний (ежедн.)"
Inst89Quest1_Level = "80"
Inst89Quest1_Attain = "80"
Inst89Quest1_Aim = "Выиграйте битву на поле боя Остров Завоеваний и вернитесь к бригадному генералу сил Альянса в любую из столиц Альянса, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst89Quest1_Location = "Бригадный генерал Альянса:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Даларан: Серебряный Анклав - "..YELLOW.."29.8, 75.8"..WHITE.."\n   Шаттрат: Нижний Город - "..YELLOW.."66.6, 34.6"..WHITE.."\n   Штормград: Крепость Штормграда - "..YELLOW.."83.8, 35.4"..WHITE.."\n   Стальгорн: Палаты Войны - "..YELLOW.."69.9, 89.6"..WHITE.."\n   Дарнасс: Терраса Войнов - "..YELLOW.."57.6, 34.1"..WHITE.."\n   Экзодар: Чертог Свет - "..YELLOW.."24.6, 55.4"
Inst89Quest1_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Он дает разное количество опыта и золота в зависимости от уровня."
Inst89Quest1_Prequest = "Нет"
Inst89Quest1_Folgequest = "Нет"
-- No Rewards for this quest


--Quest 1 Horde
Inst89Quest1_HORDE = "1. К оружию! Остров Завоеваний (ежедн.)"
Inst89Quest1_HORDE_Level = "80"
Inst89Quest1_HORDE_Attain = "80"
Inst89Quest1_HORDE_Aim = "Выиграйте битву на поле боя Острова Завоеваний и вернитесь к ордынскому вестнику войны в любую из столиц Орды, Озеро Ледяных Оков, Даларан или в Шаттрат."
Inst89Quest1_HORDE_Location = "Ордынский вестник войны:\n   Озеро ледяных оков: Крепость Ледяных Оков - "..YELLOW.."50.0, 14.0"..WHITE.." (бродит)\n   Даларан: Святилище Похитителя Солнца - "..YELLOW.."58.0, 21.1"..WHITE.."\n   Шаттрат: Нижний Город - "..YELLOW.."67.0, 56.7"..WHITE.."\n   Оргриммар: Аллея Чести - "..YELLOW.."79.8, 30.3"..WHITE.."\n   Громовой Утес: Вершина Охотников - "..YELLOW.."55.8, 76.6"..WHITE.."\n   Подгород: Королевский Квартал - "..YELLOW.."60.7, 87.8"..WHITE.."\n   Луносвет: Площадь Странников - "..YELLOW.."97.0, 38.3"
Inst89Quest1_HORDE_Note = "Это задание можно выполнять один раз в день, когда оно доступно. Он дает разное количество опыта и золота в зависимости от уровня."
Inst89Quest1_HORDE_Prequest = "Нет"
Inst89Quest1_HORDE_Folgequest = "Нет"
-- No Rewards for this quest




---------------------------------------------------
---------------- OUTDOOR RAIDS --------------------
---------------------------------------------------



--------------- INST30 - Dragons of Nightmare ---------------

Inst30Story = {
  ["Page1"] = "There is a disturbance at the Great Trees. A new threat menaces these secluded areas found in Ashenvale, Сумеречный лес, Фералас, and Hinterlands. Four great guardians of the Green Dragonflight have arrived from the Dream, but these once-proud protectors now seek only destruction and death. Take arms with your fellows and march to these hidden groves -- only you can defend Azeroth from the corruption they bring.",
  ["Page2"] = "Ysera, the great Dreaming dragon Aspect rules over the enigmatic green dragonflight. Her domain is the fantastic, mystical realm of the Emerald Dream - and it is said that from there she guides the evolutionary path of the world itself. She is the protector of nature and imagination, and it is the charge of her flight to guard all of the Great Trees across the world, which only druids use to enter the Dream itself. In recent times, Ysera's most trusted lieutenants have been warped by a dark new power within the Emerald Dream. Now these wayward sentinels have passed through the Great Trees into Azeroth, intending to spread madness and terror throughout the mortal kingdoms. Even the mightiest of adventurers would be well advised to give the dragons a wide berth, or suffer the consequences of their misguided wrath.",
  ["Page3"] = "Lethon's exposure to the aberration within the Emerald Dream not only darkened the hue of the mighty dragon's scales, but also empowered him with the ability to extract malevolent shades from his enemies. Once joined with their master, the shades imbue the dragon with healing energies. It should come as no surprise, then, that Lethon is considered to be among the most formidable of Ysera's wayward lieutenants",
  ["Page4"] = "A  mysterious dark power within the Emerald Dream has transformed the once-majestic Emeriss into a rotting, diseased monstrosity. Reports from the few who have survived encounters with the dragon have told horrifying tales of putrid mushrooms erupting from the corpses of their dead companions. Emeriss is truly the most gruesome and appalling of Ysera's estranged green dragons.",
  ["Page5"] = "Taerar was perhaps the most affected of Ysera's rogue lieutenants. Hнаходится вteraction with the dark force within the Emerald Dream shattered Taerar's sanity as well as his corporeal form. The dragon now exists as a specter with the ability to split into multiple entities, each of which possesses destructive magical powers. Taerar is a cunning and relentless foe who находится вtent on turning the madness of his existence into reality for the inhabitants of Azeroth.",
  ["Page6"] = "Once one of Ysera's most trusted lieutenants, Ysondre has now gone rogue, sewing terror and chaos across the land of Azeroth. Her formerly beneficent healing powers have given way to dark magics, enabling her to cast smoldering lightning waves and summon the aid of fiendish druids. Ysondre and her kin also possess the ability to induce sleep, sending her unfortunate mortal foes to the realm of their most terrifying nightmares.",
  ["MaxPages"] = "6",
};
Inst30Caption = "Драконы Кошмара"
Inst30Caption2 = "Изера и ее выводок"
Inst30Caption3 = "Летон"
Inst30Caption4 = "Эмерисс"
Inst30Caption5 = "Таэрар"
Inst30Caption6 = "Исондра"
Inst30QAA = "1 Задание"
Inst30QAH = "1 Задание"

--Quest 1 Alliance
Inst30Quest1 = "1. Под покровом кошмара"
Inst30Quest1_Level = "60"
Inst30Quest1_Attain = "60"
Inst30Quest1_Aim = "Найдите того, кто сможет осознать значение поглощенного кошмарами предмета.\n\nМожет быть, вам сможет помочь могущественный друид."
Inst30Quest1_Location = "Поглощенный кошмарами предмет (падает с Эмерисса, Таэрара, Летона или Исондры)"
Inst30Quest1_Note = "Задание сдается хранителю Ремулосу в (Лунная поляна - Святилище Ремулоса; "..YELLOW.."36,41"..WHITE.."). Награды перечислены в следующем задании."
Inst30Quest1_Prequest = "Нет"
Inst30Quest1_Folgequest = "Пробуждение легенд"
--
Inst30Quest1name1 = "Malfurion's Signet Ring"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst30Quest1_HORDE = Inst30Quest1
Inst30Quest1_HORDE_Level = Inst30Quest1_Level
Inst30Quest1_HORDE_Attain = Inst30Quest1_Attain
Inst30Quest1_HORDE_Aim = Inst30Quest1_Aim
Inst30Quest1_HORDE_Location = Inst30Quest1_Location
Inst30Quest1_HORDE_Note = Inst30Quest1_Note
Inst30Quest1_HORDE_Prequest = Inst30Quest1_Prequest
Inst30Quest1_HORDE_Folgequest = Inst30Quest1_Folgequest
--
Inst30Quest1name1_HORDE = Inst30Quest1name1



--------------- INST31 - Azuregos ---------------

Inst31Story = "Before the Great Sundering, the night elf city of Eldarath flourished in the land that is now known as Азшара. It is believed that many ancient and powerful Highborne artifacts may be found among the ruins of the once-mighty stronghold. For countless generations, the Blue Dragon Flight has safeguarded powerful artifacts and magical lore, ensuring that they do not fall into mortal hands. The presence of Azuregos, the blue dragon, seems to suggest that items of extreme significance, perhaps the fabled Vials of Eternity themselves, may be found in the wilderness of Азшара. Whatever Azuregos seeks, one thing is certain: he will fight to the death to defend Азшара's magical treasures."
Inst31Caption = "Азурегос"
Inst31QAA = "1 Задание"
Inst31QAH = "1 Задание"

--Quest 1 Alliance
Inst31Quest1 = "1. Лист ходячего Древа, сшитый жилами (Охотник)"
Inst31Quest1_Level = "60"
Inst31Quest1_Attain = "60"
Inst31Quest1_Aim = "Хастат Древний просит вас принести ему жилу взрослого синего дракона. По выполнении задания возвращайтесь к Хастату в Оскверненный лес."
Inst31Quest1_Location = "Хастат Древний (Оскверненный лес - Железнолесье; "..YELLOW.."48,24"..WHITE..")"
Inst31Quest1_Note = "Убейте Азурегоса и заберите Жила взрослого синего дракона. Он бродит около середины южного полуострова Азшара около "..YELLOW.."[1]"..WHITE.."."
Inst31Quest1_Prequest = "Древний лист ("..YELLOW.."Molten Core"..WHITE..")"
Inst31Quest1_Folgequest = "Нет"
Inst31Quest1PreQuest = "true"
--
Inst31Quest1name1 = "Ancient Sinew Wrapped Lamina"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst31Quest1_HORDE = Inst31Quest1
Inst31Quest1_HORDE_Level = Inst31Quest1_Level
Inst31Quest1_HORDE_Attain = Inst31Quest1_Attain
Inst31Quest1_HORDE_Aim = Inst31Quest1_Aim
Inst31Quest1_HORDE_Location = Inst31Quest1_Location
Inst31Quest1_HORDE_Note = Inst31Quest1_Note
Inst31Quest1_HORDE_Prequest = Inst31Quest1_Prequest
Inst31Quest1_HORDE_Folgequest = Inst31Quest1_Folgequest
Inst31Quest1PreQuest_HORDE = Inst31Quest1PreQuest
--
Inst31Quest1name1_HORDE = Inst31Quest1name1



--------------- INST64 - Doom Lord Kazzak ---------------

Inst64Story = {
  ["Page1"] = "When the Burning Legion began its second invasion of Azeroth, Lord Kazzak served as one of the unholy army's greatest generals. At that time the Legion possessed a powerful weapon called the Glaive of the Aspects. Forged by demons during the War of the Ancients, the glaive was imbued with the forces of earth, time, dream, magic, and life: powers taken from the mighty dragons. Even so, Archimonde and his champions were defeated during the Battle of Mount Hyjal, and the glaive was shattered. Knowing the Third War had been decided, Kazzak was forced to withdraw. In the war's aftermath, the shards of the glaive were hidden away for safekeeping.",
  ["Page2"] = "Recently Kazzak and his minions reactivated the Dark Portal, and Kazzak went through the portal to take command of the Legion's forces in Outland. In his absence, he entrusted his most powerful lieutenant, Highlord Kruul, with retrieving the Aspect Shards. In time Kruul succeeded, and the mighty glaive was reforged.\n\nWith the Glaive of the Aspects and the raging desire to scour all life from the universe, the Legion may prove unstoppable.",
  ["MaxPages"] = "2",
};
Inst64Caption = "Владыка судеб Каззак"
Inst64QAA = "Нет заданий"
Inst64QAH = "Нет заданий"



--------------- INST65 - Doomwalker ---------------

Inst65Story = {
  ["Page1"] = "The cunning mo'arg engineers of the Burning Legion pushed their gan'arg workers for weeks in the construction of the first fel reaver, a massive construct that could easily raze fortified towers or tear the wings off an airborne gryphon. Though pleased by the success of their construct, the engineers quickly realized that they could improve upon the design. While the forge camps began to mass-produce these fel reavers to smash the mortal forces of Outland, all the manpower of the mighty Legion Hold in Shadowmoon Valley was dedicated to the creation of a superior machine.",
  ["Page2"] = "Now unleashed, Doomwalker rages throughout Shadowmoon Valley, annihilating everything in its path. Infused with the captured souls of martyred draenei, the Doomwalker is empowered with unparalleled fury and might. With the fortified strength of its gargantuan body and the unbridled power of countless tortured souls, this newest fel reaver is among the most powerful weapons of the Burning Legion.",
  ["MaxPages"] = "2",
};
Inst65Caption = "Судьболом"
Inst65QAA = "Нет заданий"
Inst65QAH = "Нет заданий"



--------------- INST66 - Skettis ---------------

Inst66Story = "Скеттис - это скрытая столица Араккоа, и одна из самых больших тайн Леса Тероккар. Он расположен в долине Черного ветра на юго-востоке Леса Тероккар, достичь его можно только с помощью летающего ездового животного или друидам, выучившим Облик птицы. Он основан черырьмя гнездовьями: гнездовьем Ала'рак, гнездовьем Харр'ик, нижним гнездовьем Шил'ак, и верхним гнездовьем Шил'ак. В его центре находится Упокоение Терокка, место, где владыка араккоа Терокк может быть призван обратно в мир.\n\n"..GREEN.."Взято из WoWWiki(перевел lorientalas)"
Inst66Caption = "Скеттис"
Inst66QAA = "13 Заданий"
Inst66QAH = "13 Заданий"

--Quest 1 Alliance
Inst66Quest1 = "1. В Скеттис!"
Inst66Quest1_Level = "70"
Inst66Quest1_Attain = "70"
Inst66Quest1_Aim = "Отнесите упаковку взрывчатки сержанту Дорину в лагерь Черного Ветра рядом со Скеттисом."
Inst66Quest1_Location = "Юула (Шаттрат; "..YELLOW.."65,42"..WHITE..")"
Inst66Quest1_Note = "Предыдущее задание дается этим же NPC. Лагерь Черного Ветра находится около "..YELLOW.."[1]"..WHITE.."."
Inst66Quest1_Prequest = "Атака с воздуха"
Inst66Quest1_Folgequest = "Огонь над Скеттисом"
Inst66Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst66Quest2 = "2. Огонь над Скеттисом (ежедн.)"
Inst66Quest2_Level = "70"
Inst66Quest2_Attain = "70"
Inst66Quest2_Aim = "Найдите яйца чудовищных калири на верхушках домов Скеттиса и сбросьте на них взрывчатку Стражи Небес, после чего вернитесь к небесному сержанту Дорину."
Inst66Quest2_Location = "Небесный сержант Дорин (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."65,66"..WHITE..")"
Inst66Quest2_Note = "Это ежедневное задание. Яйца можно расстреливать сидя на маунте. Следите за Чудовищными калири летающими рядом, т.к. они могут вас заметить и сбить с маунта. Это задание можно выполнять в группе."
Inst66Quest2_Prequest = "В Скеттис!"
Inst66Quest2_Folgequest = "Нет"
Inst66Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst66Quest3 = "3. Побег из Скеттиса (ежедн.)"
Inst66Quest3_Level = "70"
Inst66Quest3_Attain = "70"
Inst66Quest3_Aim = "Проводите плененного Стража Небес в безопасное место, а затем доложите небесному сержанту Дорину."
Inst66Quest3_Location = "Плененный Страж Небес (Лес Тероккар - Скеттис; "..YELLOW.."[4]"..WHITE..")"
Inst66Quest3_Note = "Это ежедневное задание и его можно получить только после выполнения задания 'В Скеттис!'.\nПлененный Страж Небес случайным образом появляется в одной из трех локаций "..YELLOW.."[4]"..WHITE..". Это задание можно выполнять в группе."
Inst66Quest3_Prequest = "Нет"
Inst66Quest3_Folgequest = "Нет"
-- No Rewards for this quest

--Quest 4 Alliance
Inst66Quest4 = "4. Пропитание для скатов Пустоты"
Inst66Quest4_Level = "70"
Inst66Quest4_Attain = "70"
Inst66Quest4_Aim = "Возьмите клетку для скатов Пустоты в лес к югу от лагеря Черного Ветра и убейте прыгуан-ловцов Долины Черного Ветра около голодного ската Пустоты. После этого вернитесь к укротителю Диисаку из Стражи Небес."
Inst66Quest4_Location = "Укротитель Диисак из Стражи Небес (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."63,66"..WHITE..")"
Inst66Quest4_Note = "Прыгуаны-ловцы долины Черного Ветра (Вы должны убивать именно Прыгуан-ловцов, а не обычных Прыгуан) находятся на юге Скеттиса. Голодный скат Пустоты выпускается рядом с Прыгуаной-ловцом, когда ее убьете. Недвигайтесь, пока вам не засчитают кормление (2-3 секунды)."
Inst66Quest4_Prequest = "Нет"
Inst66Quest4_Folgequest = "Нет"
--
Inst66Quest4name1 = "Elixir of Major Agility"
Inst66Quest4name2 = "Adept's Elixir"

--Quest 5 Alliance
Inst66Quest5 = "5. Мир Теней"
Inst66Quest5_Level = "70"
Inst66Quest5_Attain = "70"
Inst66Quest5_Aim = "Проберитесь в Скеттис и добудьте 6 горстей теневой пыли с местных араккоа, после чего отнесите пыль Северину."
Inst66Quest5_Location = "Северин (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest5_Note = "Это повторяемое задание. С любого Арракоа может упасть Теневая пыль"
Inst66Quest5_Prequest = "Нет"
Inst66Quest5_Folgequest = "Нет"
--
Inst66Quest5name1 = "Elixir of Shadows"

--Quest 6 Alliance
Inst66Quest6 = "6. Тайны жрецов когтя"
Inst66Quest6_Level = "70"
Inst66Quest6_Attain = "70"
Inst66Quest6_Aim = "Возьмите у Северина эликсир Силы Теней и с его помощью найдите и убейте жрецов когтя: Ишаала, Скиззика и Зеллека в Скеттисе. После этого вернитесь к командиру Адарису."
Inst66Quest6_Location = "Небесный командир Адарис (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest6_Note = "Вы должны сначала выполнить задание 'Мир Теней', чтобы получить 'Эликсир Теней', для выполнения этого задания.\n\nTalonpriest Ishaal находится около "..YELLOW.."[5]"..WHITE..", Talonpriest Skizzik находится около "..YELLOW.."[6]"..WHITE.." and Talonpriest Zellek находится около "..YELLOW.."[7]"..WHITE.."."
Inst66Quest6_Prequest = "Мир Теней"
Inst66Quest6_Folgequest = "Нет"
Inst66Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst66Quest7 = "7. Альманах Ишаала"
Inst66Quest7_Level = "70"
Inst66Quest7_Attain = "70"
Inst66Quest7_Aim = "Принесите альманах Ишаала небесному командиру Адарису к северу от Скеттиса."
Inst66Quest7_Location = "Альманах Ишаала (падает с Жреца Когтя Ишааля; "..YELLOW.."[5]"..WHITE..")"
Inst66Quest7_Note = "Небесный командир Адарис находится в Лесу Тероккар - лагерь Черного Ветра ("..YELLOW.."64,66"..WHITE..")."
Inst66Quest7_Prequest = "Нет"
Inst66Quest7_Folgequest = "Союзник в Нижнем Городе"
-- No Rewards for this quest

--Quest 8 Alliance
Inst66Quest8 = "8. Союзник в Нижнем Городе"
Inst66Quest8_Level = "70"
Inst66Quest8_Attain = "70"
Inst66Quest8_Aim = "Принесите альманах Ишаала Рилаку Освобожденному в Нижний Город Шаттрата."
Inst66Quest8_Location = "Небесный командир Адарис (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest8_Note = "Рилак Освобожденный находится в Шаттрате - Нижнем городе ("..YELLOW.."52,20"..WHITE..")."
Inst66Quest8_Prequest = "Альманах Ишаала"
Inst66Quest8_Folgequest = "Оставшееся время"
Inst66Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst66Quest9 = "9. Оставшееся время"
Inst66Quest9_Level = "70"
Inst66Quest9_Attain = "70"
Inst66Quest9_Aim = "Расскажите небесному капитану Адарису о возвращении Терокка. "
Inst66Quest9_Location = "Рилак Освобожденный (Шаттрат - Нижний город; "..YELLOW.."52,20"..WHITE..")"
Inst66Quest9_Note = "Небесный командир Адарис находится в Лесу Тероккар - лагерь Черного Ветра ("..YELLOW.."64,66"..WHITE.."). Хаззик, стоящий рядом, дает следующее задание цепочки."
Inst66Quest9_Prequest = "Союзник в Нижнем Городе"
Inst66Quest9_Folgequest = "Просьба Хаззика"
Inst66Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst66Quest10 = "10. Просьба Хаззика"
Inst66Quest10_Level = "70"
Inst66Quest10_Attain = "70"
Inst66Quest10_Aim = "Заберите сверток Хаззика из его дома в восточном Скеттисе и верните сверток хозяину."
Inst66Quest10_Location = "Хаззик (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest10_Note = "Сверток Хаззика находится в ящике "..YELLOW.."[8]"..WHITE.."."
Inst66Quest10_Prequest = "Оставшееся время"
Inst66Quest10_Folgequest = "Потрепанная маскировка"
Inst66Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst66Quest11 = "11. Потрепанная маскировка"
Inst66Quest11_Level = "70"
Inst66Quest11_Attain = "70"
Inst66Quest11_Aim = "Оденьтесь в потрепанный маскировочный костюм араккоа, возьмите книгу 'Кровная вражда' у Сахаака и вернитесь к Хаззику."
Inst66Quest11_Location = "Хаззик (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest11_Note = "Сахаак находится в "..YELLOW.."[3]"..WHITE..". Если какой-нибудь Араккоа, кроме Сахаака заметит вас, они нападут."
Inst66Quest11_Prequest = "Просьба Хаззика"
Inst66Quest11_Folgequest = "Вражья кровь"
Inst66Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst66Quest12 = "12. Вражья кровь"
Inst66Quest12_Level = "70"
Inst66Quest12_Attain = "70"
Inst66Quest12_Aim = "Найдите груды черепов в середине кругов призыва Скеттиса. С помощью 10 свитков затерянных во времени призовите каждого потомка Скеттиса, уничтожьте их и отнесите трофеи Хаззику в лагерь Черного Ветра."
Inst66Quest12_Location = "Хаззик (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest12_Note = "Груды черепов находятся около "..GREEN.."[1']"..WHITE..". Только один трофей на группу выпадает с убитого потомка. Поэтому каждый в группе кто нуждается в трофее должен иметь 10 Свитков затерянных во времени. Выпадающий предмет - зеленый, поэтому среди членов группы будет розыгрыш. Данное задание можно выполнять неоднократно."
Inst66Quest12_Prequest = "Потрепанная маскировка"
Inst66Quest12_Folgequest = "Нет"
Inst66Quest12FQuest = "true"
--
Inst66Quest12name1 = "Time-Lost Offering"

--Quest 13 Alliance
Inst66Quest13 = "13. Падение Терокка"
Inst66Quest13_Level = "70"
Inst66Quest13_Attain = "70"
Inst66Quest13_Aim = "Возьмите приготовленное Хаззиком Подношение Затерянного во Времени и отнесите его к груде черепов в центре Скеттиса. С помощью подношения призовите Терокка и сразитесь с ним, после чего вернитесь к небесному командиру Адарису."
Inst66Quest13_Location = "Небесный командир Адарис (Лес Тероккар - лагерь Черного Ветра; "..YELLOW.."64,66"..WHITE..")"
Inst66Quest13_Note = "Терокк призывается в "..YELLOW.."[2]"..WHITE..". Комментарий fissi0nx с англ. Wowhead'а:\nНа 20% Терокк становится иммунен ко всем атакам, и вы увидите синюю вспышку, в том месте, где упадет бомба. Приведите Терокка в пламя, чтобы снять иммун. Он впадет в ярость, но его можно будет убить."
Inst66Quest13_Prequest = "Вражья кровь"
Inst66Quest13_Folgequest = "Нет"
Inst66Quest13PreQuest = "true"
--
Inst66Quest13name1 = "Jeweled Rod"
Inst66Quest13name2 = "Scout's Throwing Knives"
Inst66Quest13name3 = "Severin's Cane"
Inst66Quest13name4 = "Windcharger's Lance"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst66Quest1_HORDE = Inst66Quest1
Inst66Quest1_HORDE_Level = Inst66Quest1_Level
Inst66Quest1_HORDE_Attain = Inst66Quest1_Attain
Inst66Quest1_HORDE_Aim = Inst66Quest1_Aim
Inst66Quest1_HORDE_Location = Inst66Quest1_Location
Inst66Quest1_HORDE_Note = Inst66Quest1_Note
Inst66Quest1_HORDE_Prequest = Inst66Quest1_Prequest
Inst66Quest1_HORDE_Folgequest = Inst66Quest1_Folgequest
Inst66Quest1PreQuest_HORDE = Inst66Quest1PreQuest
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 2 Alliance)
Inst66Quest2_HORDE = Inst66Quest2
Inst66Quest2_HORDE_Level = Inst66Quest2_Level
Inst66Quest2_HORDE_Attain = Inst66Quest2_Attain
Inst66Quest2_HORDE_Aim = Inst66Quest2_Aim
Inst66Quest2_HORDE_Location = Inst66Quest2_Location
Inst66Quest2_HORDE_Note = Inst66Quest2_Note
Inst66Quest2_HORDE_Prequest = Inst66Quest2_Prequest
Inst66Quest2_HORDE_Folgequest = Inst66Quest2_Folgequest
Inst66Quest2PreQuest_HORDE = Inst66Quest2PreQuest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 3 Alliance)
Inst66Quest3_HORDE = Inst66Quest3
Inst66Quest3_HORDE_Level = Inst66Quest3_Level
Inst66Quest3_HORDE_Attain = Inst66Quest3_Attain
Inst66Quest3_HORDE_Aim = Inst66Quest3_Aim
Inst66Quest3_HORDE_Location = Inst66Quest3_Location
Inst66Quest3_HORDE_Note = Inst66Quest3_Note
Inst66Quest3_HORDE_Prequest = Inst66Quest3_Prequest
Inst66Quest3_HORDE_Folgequest = Inst66Quest3_Folgequest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 4 Alliance)
Inst66Quest4_HORDE = Inst66Quest4
Inst66Quest4_HORDE_Level = Inst66Quest4_Level
Inst66Quest4_HORDE_Attain = Inst66Quest4_Attain
Inst66Quest4_HORDE_Aim = Inst66Quest4_Aim
Inst66Quest4_HORDE_Location = Inst66Quest4_Location
Inst66Quest4_HORDE_Note = Inst66Quest4_Note
Inst66Quest4_HORDE_Prequest = Inst66Quest4_Prequest
Inst66Quest4_HORDE_Folgequest = Inst66Quest4_Folgequest
--
Inst66Quest4name1_HORDE = Inst66Quest4name1
Inst66Quest4name2_HORDE = Inst66Quest4name2

--Quest 5 Horde  (same as Quest 5 Alliance)
Inst66Quest5_HORDE = Inst66Quest5
Inst66Quest5_HORDE_Level = Inst66Quest5_Level
Inst66Quest5_HORDE_Attain = Inst66Quest5_Attain
Inst66Quest5_HORDE_Aim = Inst66Quest5_Aim
Inst66Quest5_HORDE_Location = Inst66Quest5_Location
Inst66Quest5_HORDE_Note = Inst66Quest5_Note
Inst66Quest5_HORDE_Prequest = Inst66Quest5_Prequest
Inst66Quest5_HORDE_Folgequest = Inst66Quest5_Folgequest
--
Inst66Quest5name1_HORDE = Inst66Quest5name1
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 6 Alliance)
Inst66Quest6_HORDE = Inst66Quest6
Inst66Quest6_HORDE_Level = Inst66Quest6_Level
Inst66Quest6_HORDE_Attain = Inst66Quest6_Attain
Inst66Quest6_HORDE_Aim = Inst66Quest6_Aim
Inst66Quest6_HORDE_Location = Inst66Quest6_Location
Inst66Quest6_HORDE_Note = Inst66Quest6_Note
Inst66Quest6_HORDE_Prequest = Inst66Quest6_Prequest
Inst66Quest6_HORDE_Folgequest = Inst66Quest6_Folgequest
Inst66Quest6PreQuest_HORDE = Inst66Quest6PreQuest
-- No Rewards for this quest

--Quest 7 Horde  (same as Quest 7 Alliance)
Inst66Quest7_HORDE = Inst66Quest7
Inst66Quest7_HORDE_Level = Inst66Quest7_Level
Inst66Quest7_HORDE_Attain = Inst66Quest7_Attain
Inst66Quest7_HORDE_Aim = Inst66Quest7_Aim
Inst66Quest7_HORDE_Location = Inst66Quest7_Location
Inst66Quest7_HORDE_Note = Inst66Quest7_Note
Inst66Quest7_HORDE_Prequest = Inst66Quest7_Prequest
Inst66Quest7_HORDE_Folgequest = Inst66Quest7_Folgequest
-- No Rewards for this quest

--Quest 8 Horde  (same as Quest 8 Alliance)
Inst66Quest8_HORDE = Inst66Quest8
Inst66Quest8_HORDE_Level = Inst66Quest8_Level
Inst66Quest8_HORDE_Attain = Inst66Quest8_Attain
Inst66Quest8_HORDE_Aim = Inst66Quest8_Aim
Inst66Quest8_HORDE_Location = Inst66Quest8_Location
Inst66Quest8_HORDE_Note = Inst66Quest8_Note
Inst66Quest8_HORDE_Prequest = Inst66Quest8_Prequest
Inst66Quest8_HORDE_Folgequest = Inst66Quest8_Folgequest
Inst66Quest8FQuest_HORDE = Inst66Quest8FQuest
-- No Rewards for this quest

--Quest 9 Horde  (same as Quest 9 Alliance)
Inst66Quest9_HORDE = Inst66Quest9
Inst66Quest9_HORDE_Level = Inst66Quest9_Level
Inst66Quest9_HORDE_Attain = Inst66Quest9_Attain
Inst66Quest9_HORDE_Aim = Inst66Quest9_Aim
Inst66Quest9_HORDE_Location = Inst66Quest9_Location
Inst66Quest9_HORDE_Note = Inst66Quest9_Note
Inst66Quest9_HORDE_Prequest = Inst66Quest9_Prequest
Inst66Quest9_HORDE_Folgequest = Inst66Quest9_Folgequest
Inst66Quest9FQuest_HORDE = Inst66Quest9FQuest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 10 Alliance)
Inst66Quest10_HORDE = Inst66Quest10
Inst66Quest10_HORDE_Level = Inst66Quest10_Level
Inst66Quest10_HORDE_Attain = Inst66Quest10_Attain
Inst66Quest10_HORDE_Aim = Inst66Quest10_Aim
Inst66Quest10_HORDE_Location = Inst66Quest10_Location
Inst66Quest10_HORDE_Note = Inst66Quest10_Note
Inst66Quest10_HORDE_Prequest = Inst66Quest10_Prequest
Inst66Quest10_HORDE_Folgequest = Inst66Quest10_Folgequest
Inst66Quest10FQuest_HORDE = Inst66Quest10FQuest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 11 Alliance)
Inst66Quest11_HORDE = Inst66Quest11
Inst66Quest11_HORDE_Level = Inst66Quest11_Level
Inst66Quest11_HORDE_Attain = Inst66Quest11_Attain
Inst66Quest11_HORDE_Aim = Inst66Quest11_Aim
Inst66Quest11_HORDE_Location = Inst66Quest11_Location
Inst66Quest11_HORDE_Note = Inst66Quest11_Note
Inst66Quest11_HORDE_Prequest = Inst66Quest11_Prequest
Inst66Quest11_HORDE_Folgequest = Inst66Quest11_Folgequest
Inst66Quest11FQuest_HORDE = Inst66Quest11FQuest
-- No Rewards for this quest

--Quest 12 Horde  (same as Quest 12 Alliance)
Inst66Quest12_HORDE = Inst66Quest12
Inst66Quest12_HORDE_Level = Inst66Quest12_Level
Inst66Quest12_HORDE_Attain = Inst66Quest12_Attain
Inst66Quest12_HORDE_Aim = Inst66Quest12_Aim
Inst66Quest12_HORDE_Location = Inst66Quest12_Location
Inst66Quest12_HORDE_Note = Inst66Quest12_Note
Inst66Quest12_HORDE_Prequest = Inst66Quest12_Prequest
Inst66Quest12_HORDE_Folgequest = Inst66Quest12_Folgequest
Inst66Quest12FQuest_HORDE = Inst66Quest12FQuest
--
Inst66Quest12name1_HORDE = Inst66Quest12name1

--Quest 13 Horde  (same as Quest 13 Alliance)
Inst66Quest13_HORDE = Inst66Quest13
Inst66Quest13_HORDE_Level = Inst66Quest13_Level
Inst66Quest13_HORDE_Attain = Inst66Quest13_Attain
Inst66Quest13_HORDE_Aim = Inst66Quest13_Aim
Inst66Quest13_HORDE_Location = Inst66Quest13_Location
Inst66Quest13_HORDE_Note = Inst66Quest13_Note
Inst66Quest13_HORDE_Prequest = Inst66Quest13_Prequest
Inst66Quest13_HORDE_Folgequest = Inst66Quest13_Folgequest
Inst66Quest13PreQuest_HORDE = Inst66Quest13PreQuest
Inst66Quest13FQuest_HORDE = Inst66Quest13FQuest
--
Inst66Quest13name1_HORDE = Inst66Quest13name1
Inst66Quest13name2_HORDE = Inst66Quest13name2
Inst66Quest13name3_HORDE = Inst66Quest13name3
Inst66Quest13name4_HORDE = Inst66Quest13name4




---------------------------
--- AQ Instance Numbers ---
---------------------------

-- 1  = Deadmines (VC)
-- 2  = Wailing Caverns (WC)
-- 3  = Ragefire Chasm (RFC)
-- 4  = Uldaman (ULD)
-- 5  = Blackrock Depths (BRD)
-- 6  = Blackwing Lair (BWL)
-- 7  = Blackfathom Deeps (BFD)
-- 8  = Lower Blackrock Spire (LBRS)
-- 9  = Upper Blackrock Spire (UBRS)
-- 10 = Dire Maul East (DM)
-- 11 = Dire Maul North (DM)
-- 12 = Dire Maul West (DM)
-- 13 = Maraudon (Mara)
-- 14 = Molten Core (MC)
-- 15 = Old Naxxramas (removed)
-- 16 = Onyxia's Lair (Ony)
-- 17 = Razorfen Downs (RFD)
-- 18 = Razorfen Kraul (RFK)
-- 19 = SM: Library (SM Lib)
-- 20 = Scholomance (Scholo)
-- 21 = Shadowfang Keep (SFK)
-- 22 = Stratholme (Strat)
-- 23 = The Ruins of Ahn'Qiraj (AQ20)
-- 24 = The Stockade (Stocks)
-- 25 = Sunken Temple (ST)
-- 26 = The Temple of Ahn'Qiraj (AQ40)
-- 27 = Zul'Farrak (ZF)
-- 28 = Zul'Gurub (ZG)
-- 29 = Gnomeregan (Gnomer)
-- 30 = Four Dragons
-- 31 = Azuregos
-- 32 = Highlord Kruul (removed)
-- 33 = Alterac Valley (AV)
-- 34 = Arathi Basin (AB)
-- 35 = Warsong Gulch (WSG)
-- 36 =  default "rest"
-- 37 = HFC: Ramparts (Ramp)
-- 38 = HFC: Blood Furnace (BF)
-- 39 = HFC: Shattered Halls (SH)
-- 40 = HFC: Magtheridon's Lair
-- 41 = CR: The Slave Pens (SP)
-- 42 = CR: The Steamvault (SV)
-- 43 = CR: The Underbog (UB)
-- 44 = Auchindoun: Auchenai Crypts (AC)
-- 45 = Auchindoun: Mana Tombs (MT)
-- 46 = Auchindoun: Sethekk Halls (Seth)
-- 47 = Auchindoun: Shadow Labyrinth (SLabs)
-- 48 = CR: Serpentshrine Cavern (SSC)
-- 49 = CoT: Black Morass (BM)
-- 50 = CoT: Battle of Mount Hyjal
-- 51 = CoT: Old Hillsbrad
-- 52 = Gruul's Lair (GL)
-- 53 = Karazhan (Kara)
-- 54 = TK: Arcatraz (Arc)
-- 55 = TK: Botanica (Bot)
-- 56 = TK: Mechanar (Mech)
-- 57 = SM: Armory (SM Arm)
-- 58 = SM: Cathedral (SM Cath)
-- 59 = SM: Graveyard (SM GY)
-- 60 = Eye of the Storm
-- 61 = TK: The Eye
-- 62 = Black Temple (BT)
-- 63 = Zul'Aman (ZA)
-- 64 = Doom Lord Kazzak
-- 65 = Doomwalker
-- 66 = Skettis
-- 67 = Magisters' Terrace
-- 68 = Sunwell Plateau
-- 69 = Caverns of Time: Stratholme Past
-- 70 = Utgarde Keep: Utgarde Keep
-- 71 = Utgarde Keep: Utgarde Pinnacle
-- 72 = The Nexus: The Nexus
-- 73 = The Nexus: The Oculus
-- 74 = The Nexus: The Eye of Eternity
-- 75 = Azjol-Nerub: The Upper Kingdom
-- 76 = Azjol-Nerub: Ahn'kahet: The Old Kingdom
-- 77 = Ulduar: Halls of Stone
-- 78 = Ulduar: Halls of Lightning
-- 79 = The Obsidian Sanctum
-- 80 = Drak'Tharon Keep
-- 81 = Zul'Drak: Gundrak
-- 82 = The Violet Hold
-- 83 = Strand of the Ancients (SotA)
-- 84 = Naxxramas (Naxx)
-- 85 = Vault of Archavon (VoA)
-- 86 = Ulduar
-- 87 = Trial of the Champion (ToC)
-- 88 = Trial of the Crusader (ToC)
-- 89 = Isle of Conquest (IoC)
-- 90 = Forge of Souls (FoS)
-- 91 = Pit of Saron (PoS)
-- 92 = Halls of Reflection (HoR)
-- 93 = Icecrown Citadel (ICC)
-- 94 = Ruby Sanctum (RS)
end
