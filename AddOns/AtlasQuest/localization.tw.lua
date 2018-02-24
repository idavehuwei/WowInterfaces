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

--]]


--[[

	Traditional Chinese Translated by Jill
	「世界之樹※Ammon Ra Thebes※Tefnut」繁體中文化
	Last Updated: 2010-07-05
	最後更新﹕二○一○年七月五日
	新增　巫妖王之怒 - 晶紅聖所　故事＆任務

--]]


if ( GetLocale() == "zhTW" ) then
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

AQHelpText = ""..WHITE.."指令格式為： /aq or atlasquest "..YELLOW.."[指令參數]"..WHITE.."\n指令參數有：help; option/config; show/hide; left/right; colour; autoshow"..RED.."（僅 Atlas）"
--
AQOptionsCaptionTEXT = "AtlasQuest 選項";
AQ_OK = "確定"

-- Autoshow
AQOptionsAutoshowTEXT = ""..WHITE.."伴隨 "..RED.."Atlas"..WHITE.." 打開 AtlasQuest 面板。";
AQAtlasAutoON = "當你打開 Atlas 時，AtlasQuest 面板現在會自動顯示"..GREEN.."（預設）"
AQAtlasAutoOFF = "當你打開 Atlas 時，AtlasQuest 面板"..RED.."不會"..WHITE.."自動顯示"

-- Right/Left
AQOptionsLEFTTEXT = ""..WHITE.."在"..RED.."左側"..WHITE.."顯示 AtlasQuest 面板。";
AQOptionsRIGHTTEXT = ""..WHITE.."在"..RED.."右側"..WHITE.."顯示 AtlasQuest 面板。";
AQShowRight = "在"..RED.."右側"..WHITE.."顯示 AtlasQuest 面板";
AQShowLeft = "在"..RED.."左側"..WHITE.."顯示 AtlasQuest 面板"..GREEN.."（預設）";

-- Colour Check
AQOptionsCCTEXT = ""..WHITE.."根據任務等級顯示任務顏色。"
AQCCON = "AtlasQuest 現在根據任務等級顯示任務顏色。"
AQCCOFF = "AtlasQuest 現在不根據任務等級顯示任務顏色。"

-- QuestLog Colour Check
AQQLColourChange = ""..WHITE.."將任務日誌中的任務顯示為"..BLUE.."藍色。"

-- AutoQuery Quest Rewards
AQOptionsAutoQueryTEXT = ""..WHITE.."在伺服器中自動搜索任務獎勵中你未見過的物品。"

-- Suppress Server Query text
AQOptionsNoQuerySpamTEXT = ""..WHITE.."停用伺服器自動搜索功能。"

-- Use Comparison Tooltips
AQOptionsCompareTooltipTEXT = ""..WHITE.."使用任務獎勵裝備比較。"


AQAbilities = BLUE .. "功能：" .. WHITE;
AQSERVERASKInformation = " 按右鍵察看物品視窗。"
AQSERVERASKAuto = "當滑鼠移至物品上時，自動在伺服器上搜尋。"
AQSERVERASK = "在伺服器上搜尋："
AQERRORNOTSHOWN = "此物品不安全！"
AQERRORASKSERVER = "要按右鍵在伺服器上查詢嗎？你可能會斷線。"
AQOptionB = "選項"
AQStoryB = "故事"
AQNoReward = ""..BLUE.." 沒有獎勵"
AQDiscription_OR = ""..GREY.." 或 "..WHITE..""
AQDiscription_AND = ""..GREY.." 和 "..WHITE..""
AQDiscription_REWARD = ""..BLUE.." 任務獎勵："
AQDiscription_ATTAIN = "可接受任務等級："
AQDiscription_LEVEL = "需要等級："
AQDiscription_START = "開始地點：\n"
AQDiscription_AIM = "任務目標：\n"
AQDiscription_NOTE = "任務註解：\n"
AQDiscription_PREQUEST= "前置任務："
AQDiscription_FOLGEQUEST = "後續任務："
AQFinishedTEXT = "是否完成：";


------------------
--- ITEM TYPES ---
------------------

AQITEM_DAGGER = "匕首"
AQITEM_POLEARM = "長柄武器"
AQITEM_SWORD = "劍"
AQITEM_AXE = "斧"
AQITEM_WAND = "魔杖"
AQITEM_STAFF = "法杖"
AQITEM_MACE = "錘"
AQITEM_SHIELD = "盾"
AQITEM_GUN = "槍"
AQITEM_BOW = "弓"
AQITEM_CROSSBOW = "弩"
AQITEM_THROWN = "投擲武器"

AQITEM_WAIST = "腰帶"
AQITEM_SHOULDER = "肩"
AQITEM_CHEST = "胸"
AQITEM_LEGS = "腿"
AQITEM_HANDS = "手"
AQITEM_FEET = "腳"
AQITEM_WRIST = "護腕"
AQITEM_HEAD = "頭盔"
AQITEM_BACK = "背部"
AQITEM_TABARD = "襯衣"

AQITEM_CLOTH = "布甲"
AQITEM_LEATHER = "皮甲"
AQITEM_MAIL = "鎖甲"
AQITEM_PLATE = "鎧甲"

AQITEM_OFFHAND = "副手"
AQITEM_MAINHAND = "主手"
AQITEM_ONEHAND = "單手"
AQITEM_TWOHAND = "雙手"

AQITEM_ITEM = "物品"
AQITEM_TRINKET = "飾品"
AQITEM_RELIC = "聖物"
AQITEM_POTION = "藥水"
AQITEM_OFFHAND = "副手物品"
AQITEM_NECK = "項鍊"
AQITEM_PATTERN = "圖樣"
AQITEM_BAG = "背包"
AQITEM_RING = "戒指"
AQITEM_KEY = "鑰匙"
AQITEM_GEM = "寶石"
AQITEM_QUIVER = "箭袋"
AQITEM_AMMOPOUCH = "彈藥包"
AQITEM_ENCHANT = "附魔物品"
AQITEM_EMBLEM = "紋章"



----------------------------------------------
---------------- DUNGEONS --------------------
----------------------------------------------

--------------- INST36 - No Instance ---------------

-- 在AQ不支援的地圖比如飛行路線圖時顯示的訊息.
Inst36Story = ""
Inst36Caption = "無可用的訊息"
Inst36QAA = "無任務"
Inst36QAH = "無任務"

--------------- INST1 - Deadmines (VC) ---------------

Inst1Story = "死亡礦坑曾經是人類最主要的產金地之一，但是死亡礦坑在部落第一次大戰期間席捲暴風城時就已荒廢了；現在迪菲亞兄弟會的人佔據了那裡，並將些這些黑暗中的通道轉為他們的避難所。據說那些盜賊已經勸說了聰明的哥布林，幫助他們在礦坑深處建造一些可怕的東西——但是沒有人知道這是真的還是假的。有傳言指出死亡礦坑的入口就在荒廢的月溪鎮中。"
Inst1Caption = "死亡礦坑"
Inst1QAA = "7 個任務" -- how many quests for alliance
Inst1QAH = "無任務" -- for horde

--Quest 1 Alliance
Inst1Quest1 = "1. 紅色絲質頭巾"
Inst1Quest1_Level = "17"
Inst1Quest1_Attain = "14"
Inst1Quest1_Aim = "給哨兵嶺哨塔的斥候瑞爾帶回10條紅色絲質頭巾。"
Inst1Quest1_Location = "斥候瑞爾<人民軍>（西部荒野 - 哨兵嶺; "..YELLOW.."56,47"..WHITE.."）"
Inst1Quest1_Note = "你可以在副本內外的礦工身上找到紅色絲質頭巾。當你完成護送迪菲亞叛徒任務後才能接到這個任務。"
Inst1Quest1_Prequest = "迪菲亞兄弟會系列任務"
Inst1Quest1_Folgequest = "無"
Inst1Quest1PreQuest = "true"
--
Inst1Quest1name1 = "結實的短刃"
Inst1Quest1name2 = "貝雕匕首"
Inst1Quest1name3 = "破甲之斧"

--Quest 2 Alliance
Inst1Quest2 = "2. 收集記憶"
Inst1Quest2_Level = "18"
Inst1Quest2_Attain = "14"
Inst1Quest2_Aim = "找回4張礦業工會會員卡並送回給暴風城的維爾德．薊草。"
Inst1Quest2_Location = "維爾德．薊草（暴風城 - 矮人區; "..YELLOW.."70,40"..WHITE.."）"
Inst1Quest2_Note = "就在你剛要進入副本之前的亡靈"..YELLOW.."副本入口地圖[3]"..WHITE.."掉落礦工工會會員卡。"
Inst1Quest2_Prequest = "無"
Inst1Quest2_Folgequest = "無"
--
Inst1Quest2name1 = "掘地工的靴子"
Inst1Quest2name2 = "陳舊的礦工手套"

--Quest 3 Alliance
Inst1Quest3 = "3. 我的兄弟……"
Inst1Quest3_Level = "20"
Inst1Quest3_Attain = "15"
Inst1Quest3_Aim = "將工頭希斯耐特的探險者協會徽章帶回去給暴風城的維爾德．薊草。"
Inst1Quest3_Location = "維爾德．薊草（暴風城 - 矮人區; "..YELLOW.."70,40"..WHITE.."）"
Inst1Quest3_Note = "就在你剛要進入副本之前的工頭希斯奈特"..YELLOW.."副本入口地圖[3]"..WHITE.."掉落探險者協會徽章。"
Inst1Quest3_Prequest = "無"
Inst1Quest3_Folgequest = "無"
--
Inst1Quest3name1 = "礦工的報復"

--Quest 4 Alliance
Inst1Quest4 = "4. 地底突襲"
Inst1Quest4_Level = "20"
Inst1Quest4_Attain = "15"
Inst1Quest4_Aim = "從死亡礦坑中帶回小型高能發動機，將其帶給暴風城矮人區中的沉默的舒尼。"
Inst1Quest4_Location = "沉默的舒尼（暴風城 - 矮人區; "..YELLOW.."62,34"..WHITE.."）"
Inst1Quest4_Note = "你可以直接從舒尼那邊接到此任務，也可以從諾恩那裡接到此任務的前置任務（鐵爐堡 - 地精區; "..YELLOW.."69,50"..WHITE.."）。\n斯尼德的伐木機掉落小型高能發動機，位置在"..YELLOW.."[3]"..WHITE.."。"
Inst1Quest4_Prequest = "沉默的舒尼"
Inst1Quest4_Folgequest = "無"
Inst1Quest4PreQuest = "true"
--
Inst1Quest4name1 = "極地護手"
Inst1Quest4name2 = "紫貂魔杖"

--Quest 5 Alliance
Inst1Quest5 = "5. 迪菲亞兄弟會 (系列任務)"
Inst1Quest5_Level = "22"
Inst1Quest5_Attain = "14"
Inst1Quest5_Aim = "殺死艾德溫．范克里夫，把他的頭交給格萊恩．斯托曼。"
Inst1Quest5_Location = "格萊恩．斯托曼（西部荒野 - 哨兵嶺 "..YELLOW.."56,47 "..WHITE.."）"
Inst1Quest5_Note = "此系列任務開始於格萊恩．斯托曼（西部荒野 - 哨兵嶺; "..YELLOW.."56,47"..WHITE.."）。\n艾德溫．范克里夫是死亡礦坑的最後一個王。你可以在他的船的最上層找到他，位置在"..YELLOW.."[6]"..WHITE.."。"
Inst1Quest5_Prequest = "迪菲亞兄弟會"
Inst1Quest5_Folgequest = "無"
Inst1Quest5PreQuest = "true"
--
Inst1Quest5name1 = "西部荒野重腿甲"
Inst1Quest5name2 = "西部荒野外套"
Inst1Quest5name3 = "西部荒野法杖"

--Quest 6 Alliance
Inst1Quest6 = "6. 正義試煉 (聖騎士任務)"
Inst1Quest6_Level = "22"
Inst1Quest6_Attain = "20"
Inst1Quest6_Aim = "按照喬丹的武器材料單上的說明去尋找一些白石橡木、精煉礦石、喬丹的鐵錘和一塊科爾寶石，然後回到鐵爐堡去見喬丹．斯迪威爾。"
Inst1Quest6_Location = "喬丹．斯迪威爾（丹莫洛 - 鐵爐堡 "..YELLOW.."52,36 "..WHITE.."）"
Inst1Quest6_Note = "點擊"..YELLOW.."《喬丹的武器材料單》"..WHITE.."查看喬丹的武器材料單。"
Inst1Quest6_Page = {2, "只有聖騎士們才能接到這個任務！\n\n1. 你可以從"..YELLOW.."[死亡礦坑]"..WHITE.."哥布林木匠"..YELLOW.."[3]"..WHITE.."那兒得到白石橡木。\n\n2. 要得到精煉礦石，你必須先與白洛爾．石手交談（洛克莫丹 - 塞爾薩瑪; "..YELLOW.."35,44"..WHITE.."）。他會給你《白洛爾的礦石》任務。 你在一棵樹後面找到喬丹的礦石"..YELLOW.."71,21"..WHITE.."。\n\n3. 你可以在"..YELLOW.."[影牙城堡]"..WHITE.."緊靠"..YELLOW.."[3]"..WHITE.."的地方找到喬丹的鐵錘（安全地點）。\n\n4. 要得到科爾寶石，你必須去找桑迪斯．織風（黑海岸 - 奧伯丁; "..YELLOW.."37,40"..WHITE.."）並且做完《尋找科爾寶石》任務。為了完成這個任務，你必須殺掉"..YELLOW.."[黑暗深淵]"..WHITE.."前的黑暗深淵智者或者黑暗深淵海潮祭司。他們會掉落被污染的科爾寶石。桑迪斯．織風會為你淨化它的。", };
Inst1Quest6_Prequest = "勇氣之書→正義試煉"
Inst1Quest6_Folgequest = "正義試煉"
Inst1Quest6PreQuest = "true"
--
Inst1Quest6name1 = "維里甘之拳 "

--Quest 7 Alliance
Inst1Quest7 = "7. 未寄出的信"
Inst1Quest7_Level = "22"
Inst1Quest7_Attain = "16"
Inst1Quest7_Aim = "搜查艾德溫．范克里夫的屍體時，你從一堆雜亂的物品中找到了一封還未來得及發出的信。地址一欄上寫著巴隆斯．艾力克斯頓，暴風城石工協會，城市大廳，教堂廣場。"
Inst1Quest7_Location = "未寄出的信（范克里夫掉落 - 死亡礦坑; "..YELLOW.."[6]"..WHITE.."）"
Inst1Quest7_Note = "巴隆斯．艾力克斯頓在暴風城光明大教堂旁邊"..YELLOW.."57,47"..WHITE.."。"
Inst1Quest7_Prequest = "無"
Inst1Quest7_Folgequest = "巴基爾．斯瑞德"
-- No Rewards for this quest



--------------- INST2 - Wailing Caverns (WC) ---------------

Inst2Story = "最近一個名叫納拉雷克斯的夜精靈德魯伊在貧瘠之地的地下發現了一個錯綜複雜的洞穴通道。這個被稱作「哀嚎洞穴」的地方有很多的蒸汽縫隙，而蒸氣噴出時發出的聲音就猶如哀嚎一般，所以因此而得名。納拉雷克斯想利用洞穴中的溫泉來恢復貧瘠之地的生態，讓這裡重新獲得生機——但是這樣做需要吸收傳說中的翡翠夢境的能量。當這一切和翡翠夢境相連接後，德魯伊的眼前就變成了一場噩夢；不久之後，哀嚎洞穴開始變化——洞中的水開始腐化：曾經溫順的生物開始變成狂暴而致命的捕食者。據說納拉雷克斯自己目前還居住在這個迷宮的最深處，被翡翠夢境的邊緣所困擾著。即使他以前的隨從也被他們的主人所經歷的噩夢所腐化——他們都變成了邪惡的尖牙德魯伊。"
Inst2Caption = "哀嚎洞穴"
Inst2QAA = "5 個任務"
Inst2QAH = "7 個任務"

--Quest 1 Alliance
Inst2Quest1 = "1. 變異皮革"
Inst2Quest1_Level = "17"
Inst2Quest1_Attain = "13"
Inst2Quest1_Aim = "哀嚎洞穴的納爾派克想要20張變異皮革。"
Inst2Quest1_Location = "納爾派克<納拉雷克斯的信徒>（貧瘠之地 - 哀嚎洞穴; "..YELLOW.."47,36 "..WHITE.."）"
Inst2Quest1_Note = "副本入口前或裡面的變異怪都可能掉落變異皮革。納爾派克在副本入口上方的山頂洞穴裡，不要從入口進入，要從外面繞道山上。"
Inst2Quest1_Prequest = "無"
Inst2Quest1_Folgequest = "無"
--
Inst2Quest1name1 = "光滑的蛇鱗護腿"
Inst2Quest1name2 = "變異皮包"

--Quest 2 Alliance
Inst2Quest2 = "2. 港口的麻煩"
Inst2Quest2_Level = "18"
Inst2Quest2_Attain = "14"
Inst2Quest2_Aim = "棘齒城的起重機操作員比戈弗茲讓你從瘋狂的馬格利什那兒取回一瓶99年波爾多陳釀，瘋狂的馬格利什就藏在哀嚎洞穴裡。"
Inst2Quest2_Location = "起重機操作員比戈弗茲（貧瘠之地 - 棘齒城; "..YELLOW.."63,37 "..WHITE.."）"
Inst2Quest2_Note = "你進入副本殺死瘋狂的馬格利什，拿到酒瓶。當你進入洞穴後向右轉，他就在一個凹進去的洞裡"..YELLOW.."副本入口地圖[2]"..WHITE.."。動作要快，他很小而且會隱形（潛行）。重生時間超過30分鐘，所以最好組滿隊殺（18級精英）。"
Inst2Quest2_Prequest = "無"
Inst2Quest2_Folgequest = "無"
-- No Rewards for this quest

--Quest 3 Alliance
Inst2Quest3 = "3. 智慧飲料"
Inst2Quest3_Level = "18"
Inst2Quest3_Attain = "14"
Inst2Quest3_Aim = "收集6份哀嚎香精，把它們交給棘齒城的麥伯克．米希瑞克斯。"
Inst2Quest3_Location = "麥伯克．米希瑞克斯（貧瘠之地 - 棘齒城; "..YELLOW.."62,37 "..WHITE.."）"
Inst2Quest3_Note = "此任務的前置任務也是在麥伯克．米希瑞克斯這邊接到的。\n哀嚎香精可以在哀嚎洞穴裡的軟泥怪身上找到。"
Inst2Quest3_Prequest = "迅猛龍角"
Inst2Quest3_Folgequest = "無"
Inst2Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst2Quest4 = "4. 根絕變異者"
Inst2Quest4_Level = "21"
Inst2Quest4_Attain = "15"
Inst2Quest4_Aim = "哀嚎洞穴的厄布魯要求你殺掉7隻變異破壞者、7隻劇毒飛蛇、7隻變異蹣跚者和7隻變異尖牙風蛇。"
Inst2Quest4_Location = "厄布魯（貧瘠之地 - 哀嚎洞穴; "..YELLOW.."47,36 "..WHITE.."）"
Inst2Quest4_Note = "厄布魯在入口上方山頂的洞穴裡。"
Inst2Quest4_Prequest = "無"
Inst2Quest4_Folgequest = "無"
--
Inst2Quest4name1 = "圖樣：蛇鱗腰帶"
Inst2Quest4name2 = "燒灼之棒"
Inst2Quest4name3 = "達格米爾護手"

--Quest 5 Alliance
Inst2Quest5 = "5. 發光的裂片"
Inst2Quest5_Level = "25"
Inst2Quest5_Attain = "21"
Inst2Quest5_Aim = "前往棘齒城尋找一個人，他能告訴你更多關於發光碎片的事。\n然後，將碎片送往被指示的地方。"
Inst2Quest5_Location = "發光的碎片（吞噬者穆坦努斯掉落 - 哀嚎洞穴; "..YELLOW.."[9]"..WHITE.."）"
Inst2Quest5_Note = "只有當你完成了殺死了4個德魯伊，並完成護送德魯伊任務後，吞噬者穆坦努斯才會出現。\n當你取得了碎片，你必須帶著它返回棘齒城（找銀行旁邊的<工匠協會>斯布特瓦夫。注意：他頭上是沒有問號的，要自己去點他。），然後他會指引你返回哀嚎洞穴外面的山頂找到菲拉．古風。"
Inst2Quest5_Prequest = "無"
Inst2Quest5_Folgequest = "在噩夢中"
--
Inst2Quest5name1 = "塔巴爾護肩"
Inst2Quest5name2 = "泥潭沼澤高統靴"


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
Inst2Quest3_HORDE = "3. 毒蛇花"
Inst2Quest3_HORDE_Level = "18"
Inst2Quest3_HORDE_Attain = "14"
Inst2Quest3_HORDE_Aim = "為雷霆崖的藥劑師札瑪收集10朵毒蛇花。"
Inst2Quest3_HORDE_Location = "藥劑師札瑪（雷霆崖 -靈魂高地; "..YELLOW.."22,20 "..WHITE.."）"
Inst2Quest3_HORDE_Note = "你可以在藥劑師赫布瑞姆處領取前置任務（貧瘠之地 - 十字路口; "..YELLOW.."51,30"..WHITE.."）。\n你可以在山洞裡、副本前或副本內採到毒蛇花。學習草藥學的玩家打開尋找草藥技能就可以在自己的小地圖上看到毒蛇花的位置。"
Inst2Quest3_HORDE_Prequest = "菌類孢子→藥劑師札瑪"
Inst2Quest3_HORDE_Folgequest = "無"
Inst2Quest3PreQuest_HORDE = "true"
--
Inst2Quest3name1_HORDE = "藥劑師手套"

--Quest 4 Horde  (same as Quest 3 Alliance)
Inst2Quest4_HORDE = "4. 智慧飲料"
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
Inst2Quest5_HORDE = "5. 根絕變異者"
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
Inst2Quest6_HORDE = "6. 尖牙德魯伊 (系列任務)"
Inst2Quest6_HORDE_Level = "22"
Inst2Quest6_HORDE_Attain = "18"
Inst2Quest6_HORDE_Aim = "將考布萊恩寶石、安娜科德拉寶石、皮薩斯寶石和瑟芬迪斯寶石交給雷霆崖的納拉．蠻鬃。"
Inst2Quest6_HORDE_Location = "納拉．蠻鬃（雷霆崖 - 長者高地; "..YELLOW.."75,31 "..WHITE.."）"
Inst2Quest6_HORDE_Note = "系列任務始於大德魯伊哈繆爾．符文圖騰（雷霆崖 - 長者高地; "..YELLOW.."78,28"..WHITE.."）\n掉落寶石的4個德魯伊位於"..YELLOW.."[2]"..WHITE..", "..YELLOW.."[3]"..WHITE..", "..YELLOW.."[5]"..WHITE..", "..YELLOW.."[7]"..WHITE.."。"
Inst2Quest6_HORDE_Prequest = "哈繆爾．符文圖騰→納拉．蠻鬃→尖牙德魯伊"
Inst2Quest6_HORDE_Folgequest = "無"
Inst2Quest6PreQuest_HORDE = "true"
--
Inst2Quest6name1_HORDE = "新月法杖"
Inst2Quest6name2_HORDE = "翼刃"

--Quest 7 Horde  (same as Quest 5 Alliance)
Inst2Quest7_HORDE = "7. 發光的裂片"
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

Inst3Story = "怒焰裂谷是一個錯綜複雜的火山洞穴，它位於獸人的新都城奧格瑪中。最近，有傳言說一批崇拜惡魔陰影議會的信徒佔據了怒焰裂谷。這個被稱為火刃的組織，對杜洛塔的安全產生了極大的威脅。許多人認為獸人的酋長索爾已經意識到了火刃的存在，但不打算摧毀他們，因為索爾認為可以利用火刃的成員潛伏進陰影議會之中，並將其一網打盡。不論如何，從怒焰裂谷散發出來的黑暗力量，可能毀了獸人的一切。"
Inst3Caption = "怒焰裂谷"
Inst3QAA = "無任務"
Inst3QAH = "5 個任務"

--Quest 1 Horde
Inst3Quest1_HORDE = "1. 試探敵人"
Inst3Quest1_HORDE_Level = "15"
Inst3Quest1_HORDE_Attain = "9"
Inst3Quest1_HORDE_Aim = "在奧格瑪找到怒焰裂谷，殺掉8個怒焰穴居人和8個怒焰薩滿，然後向雷霆崖的拉哈羅覆命。"
Inst3Quest1_HORDE_Location = "拉哈羅（雷霆崖 - 長者高地; "..YELLOW.."70,29 "..WHITE.."）"
Inst3Quest1_HORDE_Note = "你一開始就能找到穴居人。"
Inst3Quest1_HORDE_Prequest = "無"
Inst3Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Horde
Inst3Quest2_HORDE = "2. 毀滅之力…"
Inst3Quest2_HORDE_Level = "16"
Inst3Quest2_HORDE_Attain = "9"
Inst3Quest2_HORDE_Aim = "將《暗影法術研究》和《扭曲虛空的魔法》這兩本書交給幽暗城的瓦里瑪薩斯。"
Inst3Quest2_HORDE_Location = "瓦里瑪薩斯（幽暗城 - 皇家區; "..YELLOW.."56,92 "..WHITE.."）"
Inst3Quest2_HORDE_Note = "燃刃信徒和燃刃術士掉落這兩本書。"
Inst3Quest2_HORDE_Prequest = "無"
Inst3Quest2_HORDE_Folgequest = "無"
--
Inst3Quest2name1_HORDE = "蒼白長褲"
Inst3Quest2name2_HORDE = "泥濘護腿"
Inst3Quest2name3_HORDE = "石像鬼護腿"

--Quest 3 Horde
Inst3Quest3_HORDE = "3. 尋找背袋"
Inst3Quest3_HORDE_Level = "16"
Inst3Quest3_HORDE_Attain = "9"
Inst3Quest3_HORDE_Aim = "在怒焰裂谷搜尋瑪爾．恐怖圖騰的屍體以及他留下的東西。"
Inst3Quest3_HORDE_Location = "拉哈羅（雷霆崖 - 長者高地; "..YELLOW.."70,29 "..WHITE.."）"
Inst3Quest3_HORDE_Note = "你會在"..YELLOW.."[1]"..WHITE.."發現瑪爾．恐怖圖騰的屍體。得到背包後你需要把它交回給雷霆崖的拉哈羅。"
Inst3Quest3_HORDE_Prequest = "無"
Inst3Quest3_HORDE_Folgequest = "歸還背袋"
--
Inst3Quest3name1_HORDE = "羽珠護腕"
Inst3Quest3name2_HORDE = "草原獅護腕"

--Quest 4 Horde
Inst3Quest4_HORDE = "4. 隱藏的敵人"
Inst3Quest4_HORDE_Level = "16"
Inst3Quest4_HORDE_Attain = "9"
Inst3Quest4_HORDE_Aim = "殺死巴札蘭和祈求者耶戈什，然後回到奧格瑪的索爾那裡。"
Inst3Quest4_HORDE_Location = "索爾（奧格瑪 - 智慧谷; "..YELLOW.."31,37 "..WHITE.."）"
Inst3Quest4_HORDE_Note = "你會在"..YELLOW.."[4]"..WHITE.."發現巴札蘭，在"..YELLOW.."[3]"..WHITE.."發現祈求者耶戈什。"
Inst3Quest4_HORDE_Prequest = "隱藏的敵人"
Inst3Quest4_HORDE_Folgequest = "隱藏的敵人"
Inst3Quest4PreQuest_HORDE = "true"
--
Inst3Quest4name1_HORDE = "奧格瑪之劍"
Inst3Quest4name2_HORDE = "奧格瑪之錘"
Inst3Quest4name3_HORDE = "奧格瑪之斧"
Inst3Quest4name4_HORDE = "奧格瑪法杖"

--Quest 5 Horde
Inst3Quest5_HORDE = "5. 『飢餓者』塔拉加曼"
Inst3Quest5_HORDE_Level = "16"
Inst3Quest5_HORDE_Attain = "9"
Inst3Quest5_HORDE_Aim = "進入怒焰裂谷，殺死饑餓者塔拉加曼，然後把他的心臟交給奧格瑪的尼爾魯．火刃。"
Inst3Quest5_HORDE_Location = "尼爾魯．火刃（奧格瑪 - 暗影裂口; "..YELLOW.."49,50 "..WHITE.."）"
Inst3Quest5_HORDE_Note = "你會在"..YELLOW.."[2]"..WHITE.."找到塔拉加曼。"
Inst3Quest5_HORDE_Prequest = "無"
Inst3Quest5_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST4 - Uldaman (Ulda) ---------------

Inst4Story = "奧達曼是古代泰坦創世之時所留下深埋於地下的城市。矮人探險隊最近挖掘到這個被遺忘的城市，並將泰坦第一個失敗的創造物：石顎怪喚醒了。傳說泰坦從石頭中創造了石顎怪，當他們判定這次試驗失敗的時候，泰坦把石顎怪封鎖了起來，並進行了第二次的嘗試——最終創造了矮人這個種族。矮人創造的秘密被記錄在精密的白金圓盤中——那是位於古代城市最底部的大型泰坦遺跡。最近，黑鐵矮人在奧達曼進行了一系列的侵入活動，希望為他們的火焰領主拉格納羅斯獲得圓盤。然而，在這個地下城市中，有一些巨大的石頭守衛會攻擊入侵者；而白金圓盤是由一名巨大的石頭守衛阿札達斯所護衛。另有傳言指出，與矮人有類似石頭皮膚的祖先——土靈，還居住在城市的隱蔽之處。"
Inst4Caption = "奧達曼"
Inst4QAA = "17 個任務"
Inst4QAH = "11 個任務"

--Quest 1 Alliance
Inst4Quest1 = "1. 一線希望"
Inst4Quest1_Level = "35"
Inst4Quest1_Attain = "35"
Inst4Quest1_Aim = "在奧達曼找到鐵趾格雷茲。"
Inst4Quest1_Location = "勘察員雷杜爾（荒蕪之地; "..YELLOW.."53,43 "..WHITE.."）"
Inst4Quest1_Note = "前置任務始於《弄皺的地圖》（荒蕪之地; "..YELLOW.."53,33"..WHITE.."）。\n你可以在進入"..YELLOW.."副本入口地圖[1]"..WHITE.."找到鐵趾格雷茲。"
Inst4Quest1_Prequest = "一線希望"
Inst4Quest1_Folgequest = "鐵趾的護符"
Inst4Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst4Quest2 = "2. 鐵趾的護符"
Inst4Quest2_Level = "40"
Inst4Quest2_Attain = "35"
Inst4Quest2_Aim = "找到鐵趾的護符，把它交給奧達曼的鐵趾。"
Inst4Quest2_Location = "鐵趾格雷茲（奧達曼; "..YELLOW.."副本入口地圖[1]"..WHITE.."）。"
Inst4Quest2_Note = "馬格雷甘．深影掉落鐵趾的護符"..YELLOW.."副本入口地圖[2]"..WHITE.."。"
Inst4Quest2_Prequest = "一線希望"
Inst4Quest2_Folgequest = "鐵趾的遺願"
Inst4Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst4Quest3 = "3. 意志石板"
Inst4Quest3_Level = "45"
Inst4Quest3_Attain = "35"
Inst4Quest3_Aim = "找到意志石板，把它們交給鐵爐堡的顧問貝爾格拉姆。"
Inst4Quest3_Location = "顧問貝爾格拉姆（鐵爐堡 - 探險者大廳; "..YELLOW.."77,10 "..WHITE.."）"
Inst4Quest3_Note = "石板位置在"..YELLOW.."[8]"..WHITE.."。"
Inst4Quest3_Prequest = "鐵趾的遺願→邪惡的使者"
Inst4Quest3_Folgequest = "無"
Inst4Quest3FQuest = "true"
--
Inst4Quest3name1 = "驍勇勳章"

--Quest 4 Alliance
Inst4Quest4 = "4. 能量石"
Inst4Quest4_Level = "36"
Inst4Quest4_Attain = "30"
Inst4Quest4_Aim = "給荒蕪之地的裡格弗茲帶去8塊德提亞姆能量石和8塊安納洛姆能量石。"
Inst4Quest4_Location = "裡格弗茲（荒蕪之地; "..YELLOW.."42,52 "..WHITE.."）"
Inst4Quest4_Note = "能量石可以在副本內外的暗爐敵人身上找到。"
Inst4Quest4_Prequest = "無"
Inst4Quest4_Folgequest = "無"
--
Inst4Quest4name1 = "能量石環"
Inst4Quest4name2 = "杜拉辛護腕"
Inst4Quest4name3 = "持久長靴"

--Quest 5 Alliance
Inst4Quest5 = "5. 埃格蒙德的命運"
Inst4Quest5_Level = "38"
Inst4Quest5_Attain = "30"
Inst4Quest5_Aim = "收集4個雕紋石罐，把它們交給洛克莫丹的勘察員基恩薩．鐵環。"
Inst4Quest5_Location = "勘察員基恩薩．鐵環（洛克莫丹 - 鐵環挖掘場; "..YELLOW.."65,65 "..WHITE.."）"
Inst4Quest5_Note = "前置任務始於勘察員塔伯斯．雷矛（鐵爐堡 - 探險者大廳; "..YELLOW.."74,12"..WHITE.."）。\n雕紋石罐散佈於副本前的山洞裡。"
Inst4Quest5_Prequest = "鐵環挖掘場需要你！→莫達洛克"
Inst4Quest5_Folgequest = "無"
Inst4Quest5PreQuest = "true"
--
Inst4Quest5name1 = "勘察員手套"

--Quest 6 Alliance
Inst4Quest6 = "6. 化解災難"
Inst4Quest6_Level = "40"
Inst4Quest6_Attain = "30"
Inst4Quest6_Aim = "把雷烏納石板帶給迷失者塞爾杜林。"
Inst4Quest6_Location = "迷失者塞爾杜林（荒蕪之地; "..YELLOW.."51,76 "..WHITE.."）"
Inst4Quest6_Note = "石板在進入副本前的洞穴北部，通道的東部盡頭"..YELLOW.."副本入口地圖[3]"..WHITE.."。"
Inst4Quest6_Prequest = "無"
Inst4Quest6_Folgequest = "遠赴鐵爐堡"
--
Inst4Quest6name1 = "末日預言者長袍"

--Quest 7 Alliance
Inst4Quest7 = "7. 失蹤的矮人"
Inst4Quest7_Level = "40"
Inst4Quest7_Attain = "35"
Inst4Quest7_Aim = "在奧達曼找到巴爾洛戈。"
Inst4Quest7_Location = "勘察員塔伯斯．雷矛（鐵爐堡 - 探險者大廳; "..YELLOW.."75,12 "..WHITE.."）"
Inst4Quest7_Note = "巴爾洛戈在"..YELLOW.."[1]"..WHITE.."。"
Inst4Quest7_Prequest = "無"
Inst4Quest7_Folgequest = "密室"
-- No Rewards for this quest

--Quest 8 Alliance
Inst4Quest8 = "8. 密室"
Inst4Quest8_Level = "40"
Inst4Quest8_Attain = "35"
Inst4Quest8_Aim = "閱讀巴爾洛戈的日記，探索密室，然後向鐵爐堡的勘察員塔伯斯．雷矛回報。"
Inst4Quest8_Location = "巴爾洛戈（奧達曼;"..YELLOW.."[1]"..WHITE.."）"
Inst4Quest8_Note = "密室在"..YELLOW.."[4]"..WHITE.."。要打開密室，你需要由魯維羅什"..YELLOW.."[3]"..WHITE.."掉落的索爾之杖，以及從巴爾洛戈的箱子"..YELLOW.."[1]"..WHITE.."裡面拾取的尼基夫勳章。將這兩樣物品所結合而成的史前法杖插在"..YELLOW.."[3]"..WHITE.."和"..YELLOW.."[4]"..WHITE.."中間的房屋模型上就可以召喚艾隆納亞。殺掉艾隆納亞之後，進入打開的房間裡面便可以完成任務。"
Inst4Quest8_Prequest = "失蹤的矮人"
Inst4Quest8_Folgequest = "無"
Inst4Quest8FQuest = "true"
--
Inst4Quest8name1 = "矮人衝鋒斧"
Inst4Quest8name2 = "探險者協會星燈"

--Quest 9 Alliance
Inst4Quest9 = "9. 破碎的項鍊"
Inst4Quest9_Level = "41"
Inst4Quest9_Attain = "37"
Inst4Quest9_Aim = "找到破碎的項鍊的來源，從而瞭解其潛在的價值。"
Inst4Quest9_Location = "破碎的項鍊（小怪隨機掉落 - 奧達曼）"
Inst4Quest9_Note = "把項鍊帶給鐵爐堡的塔瓦斯德．基瑟爾（鐵爐堡 - 秘法區; "..YELLOW.."36,3"..WHITE.."）。"
Inst4Quest9_Prequest = "無"
Inst4Quest9_Folgequest = "昂貴的知識"
-- No Rewards for this quest

--Quest 10 Alliance
Inst4Quest10 = "10. 回到奧達曼"
Inst4Quest10_Level = "42"
Inst4Quest10_Attain = "37"
Inst4Quest10_Aim = "去奧達曼尋找塔瓦斯的魔法項鍊，被殺的聖騎士是最後一個拿著它的人。"
Inst4Quest10_Location = "塔瓦斯德．基瑟爾（鐵爐堡 - 秘法區; "..YELLOW.."36,3 "..WHITE.."）"
Inst4Quest10_Note = "聖騎士的遺體在"..YELLOW.."[2]"..WHITE.."。"
Inst4Quest10_Prequest = "昂貴的知識"
Inst4Quest10_Folgequest = "尋找寶石"
-- No Rewards for this quest

--Quest 11 Alliance
Inst4Quest11 = "11. 尋找寶石"
Inst4Quest11_Level = "43"
Inst4Quest11_Attain = "37"
Inst4Quest11_Aim = "在奧達曼尋找紅寶石、藍寶石和黃寶石的下落。找到它們之後，通過塔瓦斯德給你的占卜之瓶和他進行聯繫。"
Inst4Quest11_Location = "聖騎士的遺體（奧達曼; "..YELLOW.."[2]"..WHITE.."）"
Inst4Quest11_Note = "紅寶石"..YELLOW.."[8]"..WHITE.."的一個箱子裡，黃寶石在"..YELLOW.."[1]"..WHITE.."顯眼的石罐裡，而藍寶石則由一個名叫格瑞姆洛克"..YELLOW.."[9]"..WHITE.."的石顎怪持有。"
Inst4Quest11_Prequest = "回到奧達曼"
Inst4Quest11_Folgequest = "修復項鍊"
Inst4Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst4Quest12 = "12. 修復項鍊"
Inst4Quest12_Level = "44"
Inst4Quest12_Attain = "37"
Inst4Quest12_Aim = "從奧達曼最強大的石人身上獲得能量源，然後將其交給鐵爐堡的塔瓦斯德。"
Inst4Quest12_Location = "塔瓦斯德的占卜之碗"
Inst4Quest12_Note = "破碎項鍊的能量源自阿札達斯掉落"..YELLOW.."[10]"..WHITE.."。"
Inst4Quest12_Prequest = "尋找寶石"
Inst4Quest12_Folgequest = "無"
--
Inst4Quest12name1 = "塔瓦斯德的魔法項鍊"
Inst4Quest12FQuest = "true"

--Quest 13 Alliance
Inst4Quest13 = "13. 奧達曼的蘑菇"
Inst4Quest13_Level = "42"
Inst4Quest13_Attain = "38"
Inst4Quest13_Aim = "收集12顆紫色蘑菇，把它們交給塞爾薩瑪的加克。"
Inst4Quest13_Location = "加克（洛克莫丹 - 塞爾薩瑪; "..YELLOW.."37,49 "..WHITE.."）"
Inst4Quest13_Note = "蘑菇散佈於副本內外各處。前置任務由同一個NPC處得到。"
Inst4Quest13_Prequest = "荒蕪之地的材料"
Inst4Quest13_Folgequest = "無"
Inst4Quest13PreQuest = "true"
--
Inst4Quest13name1 = "滋補藥水"

--Quest 14 Alliance
Inst4Quest14 = "14. 尋回寶物"
Inst4Quest14_Level = "43"
Inst4Quest14_Attain = "33"
Inst4Quest14_Aim = "到奧達曼的北部大廳去找到克羅姆．粗臂的箱子，從裡面拿出他的寶貴財產，然後回到鐵爐堡把東西交給他。"
Inst4Quest14_Location = "克羅姆．粗臂（鐵爐堡 - 探險者大廳; "..YELLOW.."74,9 "..WHITE.."）"
Inst4Quest14_Note = "你在進入副本前就找到克羅姆．粗臂的財產。它就在洞穴的北部，第一個通道的東南角盡頭"..YELLOW.."副本入口地圖[4]"..WHITE.."。"
Inst4Quest14_Prequest = "無"
Inst4Quest14_Folgequest = "無"
-- No Rewards for this quest

--Quest 15 Alliance
Inst4Quest15 = "15. 白金圓盤"
Inst4Quest15_Level = "47"
Inst4Quest15_Attain = "40"
Inst4Quest15_Aim = "和石頭守護者交談，從他那裡瞭解更多古代的知識。一旦你瞭解到了所有的內容之後就啟動諾甘農圓盤。→ 把迷你白金圓盤帶到鐵爐堡的探險者協會去。"
Inst4Quest15_Location = "諾甘農圓盤（奧達曼; "..YELLOW.."[11]"..WHITE.."）"
Inst4Quest15_Note = "接到任務後，和石頭守護者交談左邊的盤子。然後再次使用白金圓盤，取得迷你白金圓盤，並把迷你白金圓盤帶給鐵爐堡的資深探險家麥格拉斯（鐵爐堡 - 探險者大廳; "..YELLOW.."69,18"..WHITE.."）。"
Inst4Quest15_Prequest = "無"
Inst4Quest15_Folgequest = "無"
--
Inst4Quest15name1 = "軟皮袋"
Inst4Quest15name2 = "超強治療藥水"
Inst4Quest15name3 = "強效法力藥水 "

--Quest 16 Alliance
Inst4Quest16 = "16. 奧達曼的能量源 (法師任務)"
Inst4Quest16_Level = "40"
Inst4Quest16_Attain = "35"
Inst4Quest16_Aim = "找到一個黑曜石能量源，將其交給塵泥沼澤的塔貝薩。"
Inst4Quest16_Location = "塔貝薩（塵泥沼澤 - 塔貝薩的農場; "..YELLOW.."46,57 "..WHITE.."）"
Inst4Quest16_Note = "這個任務只有法師能接！\n為了得到能量源，你必須到奧達曼去打敗那裡的黑曜石守衛。他體型巨大而且很難對付，但是你可以從他身上得到我們所需要的能量源！黑曜石哨兵"..YELLOW.."[5]"..WHITE.."掉落黑曜石能量源。"
Inst4Quest16_Prequest = "驅除魔鬼"
Inst4Quest16_Folgequest = "法力怒靈"
Inst4Quest16PreQuest = "true"
-- No Rewards for this quest

--Quest 17 Alliance
Inst4Quest17 = "17. 精鐵礦石"
Inst4Quest17_Level = "42"
Inst4Quest17_Attain = "29"
Inst4Quest17_Aim = "將四個精鐵礦石帶給千針石林的普茲克。"
Inst4Quest17_Location = "普茲克（千針石林 - 閃光平原; "..YELLOW.."80 75"..WHITE.."）"
Inst4Quest17_Note = "在完成前置任務後，你便可以進行這個可重複性任務。此任務不會給予你任何聲望以及經驗值，只會給予少量的金錢。精鐵礦石可以在奧達曼裡的精鐵礦脈中挖到，或是從其他玩家手中交易而來。"
Inst4Quest17_Prequest = "跟上節奏→瑞茲爾的圖表"
Inst4Quest17_Folgequest = "無"
Inst4Quest17PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde  (same as Quest 4 Alliance)
Inst4Quest1_HORDE = "1. 能量石"
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
Inst4Quest2_HORDE = "2. 化解災難"
Inst4Quest2_HORDE_Level = Inst4Quest6_Level
Inst4Quest2_HORDE_Attain = Inst4Quest6_Attain
Inst4Quest2_HORDE_Aim = Inst4Quest6_Aim
Inst4Quest2_HORDE_Location = Inst4Quest6_Location
Inst4Quest2_HORDE_Note = Inst4Quest6_Note
Inst4Quest2_HORDE_Prequest = Inst4Quest6_Prequest
Inst4Quest2_HORDE_Folgequest = "遠赴幽暗城"
--
Inst4Quest2name1_HORDE = Inst4Quest6name1

--Quest 3 Horde
Inst4Quest3_HORDE = "3. 搜尋項鍊"
Inst4Quest3_HORDE_Level = "41"
Inst4Quest3_HORDE_Attain = "37"
Inst4Quest3_HORDE_Aim = "在奧達曼挖掘場中尋找一條珍貴的項鍊，然後將其交給奧格瑪的德蘭．杜佛斯。項鍊有可能已經損壞。"
Inst4Quest3_HORDE_Location = "德蘭．杜佛斯（奧格瑪 - 暗巷區; "..YELLOW.."59,36 "..WHITE.."）"
Inst4Quest3_HORDE_Note = "破碎的項鍊（小怪隨機掉落 - 奧達曼）"
Inst4Quest3_HORDE_Prequest = "無"
Inst4Quest3_HORDE_Folgequest = "搜尋項鍊，再來一次"
-- No Rewards for this quest

--Quest 4 Horde
Inst4Quest4_HORDE = "4. 搜尋項鍊，再來一次"
Inst4Quest4_HORDE_Level = "41"
Inst4Quest4_HORDE_Attain = "37"
Inst4Quest4_HORDE_Aim = "在奧達曼裡找尋寶石的線索。"
Inst4Quest4_HORDE_Location = "德蘭．杜佛斯（奧格瑪 - 暗巷區; "..YELLOW.."59,36 "..WHITE.."）"
Inst4Quest4_HORDE_Note = "聖騎士的遺體在"..YELLOW.."[2]"..WHITE.."。"
Inst4Quest4_HORDE_Prequest = "搜尋項鍊"
Inst4Quest4_HORDE_Folgequest = "翻譯日記"
Inst4Quest4FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 5 Horde
Inst4Quest5_HORDE = "5. 翻譯日記"
Inst4Quest5_HORDE_Level = "42"
Inst4Quest5_HORDE_Attain = "37"
Inst4Quest5_HORDE_Aim = "在荒蕪之地的卡加斯崗哨裡尋找一個可以幫你翻譯聖騎士日記的人。"
Inst4Quest5_HORDE_Location = "聖騎士的遺體（奧達曼; "..YELLOW.."[2]"..WHITE.."）"
Inst4Quest5_HORDE_Note = "翻譯聖騎士日記的人加卡爾（荒蕪之地 - 卡加斯; "..YELLOW.."2,46"..WHITE.."）→將項鍊借給加卡爾作為交換，他將幫你翻譯日記。"
Inst4Quest5_HORDE_Prequest = "搜尋項鍊，再來一次"
Inst4Quest5_HORDE_Folgequest = "尋找寶貝"
Inst4Quest5FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde
Inst4Quest6_HORDE = "6. 尋找寶貝"
Inst4Quest6_HORDE_Level = "44"
Inst4Quest6_HORDE_Attain = "37"
Inst4Quest6_HORDE_Aim = "從奧達曼找回項鍊上的所有三塊寶石和能量源，然後把它們交給卡加斯的加卡爾。\n紅寶石被藏在暗爐矮人層層設防的地區。\n黃寶石藏在石顎怪活動地區的一個甕中。\n藍寶石在格瑞姆洛克手中，他是石顎怪的領袖。\n能量源可能在奧達曼的某個最強生物的手中。"
Inst4Quest6_HORDE_Location = "加卡爾（荒蕪之地 - 卡加斯; "..YELLOW.."2,46 "..WHITE.."）"
Inst4Quest6_HORDE_Note = "紅寶石"..YELLOW.."[8]"..WHITE.."的一個箱子裡，黃寶石在"..YELLOW.."[1]"..WHITE.."顯眼的石罐裡，而藍寶石則由一個名叫格瑞姆洛克"..YELLOW.."[9]"..WHITE.."的石顎怪持有。破碎項鍊的能量源從阿札達斯身上掉落"..YELLOW.."[10]"..WHITE.."。"
Inst4Quest6_HORDE_Prequest = "翻譯日記"
Inst4Quest6_HORDE_Folgequest = "運送寶石"
Inst4Quest6FQuest_HORDE = "true"
--
Inst4Quest6name1_HORDE = "加卡爾的強化項鍊"

--Quest 7 Horde
Inst4Quest7_HORDE = "7. 奧達曼的蘑菇"
Inst4Quest7_HORDE_Level = "42"
Inst4Quest7_HORDE_Attain = "36"
Inst4Quest7_HORDE_Aim = "收集12顆紫色蘑菇，把它們交給卡加斯的加卡爾。"
Inst4Quest7_HORDE_Location = "加卡爾（荒蕪之地 - 卡加斯; "..YELLOW.."2,69 "..WHITE.."）"
Inst4Quest7_HORDE_Note = "前置任務也是在加卡爾這兒領取。\n蘑菇散佈於副本內外內各處。"
Inst4Quest7_HORDE_Prequest = "荒蕪之地的試劑"
Inst4Quest7_HORDE_Folgequest = "荒蕪之地的試劑 II"
Inst4Quest7PreQuest_HORDE = "true"
--
Inst4Quest7name1_HORDE = "滋補藥劑"

--Quest 8 Horde
Inst4Quest8_HORDE = "8. 尋回寶物"
Inst4Quest8_HORDE_Level = "43"
Inst4Quest8_HORDE_Attain = "33"
Inst4Quest8_HORDE_Aim = "從奧達曼南部大廳的箱子中找到加勒特的家族寶藏，然後把它交給幽暗城的派翠克．加瑞特。"
Inst4Quest8_HORDE_Location = "派翠克．加瑞特（幽暗城; "..YELLOW.."72,48 "..WHITE.."）"
Inst4Quest8_HORDE_Note = "你在進入副本之前就會找到加勒特的家族寶藏。它就在南部通道的盡頭"..YELLOW.."副本入口地圖[5]"..WHITE.."。"
Inst4Quest8_HORDE_Prequest = "無"
Inst4Quest8_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 9 Horde
Inst4Quest9_HORDE = "9. 白金圓盤"
Inst4Quest9_HORDE_Level = "47"
Inst4Quest9_HORDE_Attain = "40"
Inst4Quest9_HORDE_Aim = "和石頭守護者交談，從他那裡瞭解更多古代的知識。一旦你瞭解到了所有的內容之後就啟動諾甘農圓盤。→把迷你白金圓盤帶到雷霆崖的賢者圖希克那裡。"
Inst4Quest9_HORDE_Location = "諾甘農圓盤（奧達曼; "..YELLOW.."[11]"..WHITE.."）"
Inst4Quest9_HORDE_Note = "接到任務後，和石頭守護著交談盤子的左邊。然後再次使用白金圓盤，取得迷你白金圓盤，並把迷你白金圓盤帶去雷霆崖找賢者圖希克（"..YELLOW.."34,46"..WHITE.."）。"
Inst4Quest9_HORDE_Prequest = "無"
Inst4Quest9_HORDE_Folgequest = "無"
--
Inst4Quest9name1_HORDE = "軟皮袋"
Inst4Quest9name2_HORDE = "超強治療藥水"
Inst4Quest9name3_HORDE = "強效法力藥水"

--Quest 10 Horde  (same as Quest 4 Alliance)
Inst4Quest10_HORDE = "10. 奧達曼的能量源 (法師任務)"
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
Inst4Quest11_HORDE = "11. 精鐵礦石"
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

Inst5Story = "黑石深淵曾經是黑鐵矮人偉大的都城，但現在這個火山的迷宮已成為拉格納羅斯這個火焰領主的王座所在地。傳說拉格納羅斯發現可以使用石頭和設計圖來創造一支無敵石頭人軍隊，以幫助他征服黑石山。為了要打敗奈法利安和他的邪惡軍團們，拉格納羅斯將會不惜一切代價來達到最後的勝利。"
Inst5Caption = "黑石深淵"
Inst5QAA = "16 個任務"
Inst5QAH = "20 個任務"

--Quest 1 Alliance
Inst5Quest1 = "1. 黑鐵的遺產"
Inst5Quest1_Level = "52"
Inst5Quest1_Attain = "48"
Inst5Quest1_Aim = "殺掉弗諾斯．達克維爾並拿回戰錘鐵膽。把鐵膽之錘拿到索瑞森神殿去，將其放在弗蘭克羅恩．鑄鐵的雕像上 。"
Inst5Quest1_Location = "弗蘭克羅恩．鑄鐵（黑石山; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst5Quest1_Note = "弗蘭克羅恩．鑄鐵位於黑石山一座懸空的島上的中心，在靠近地城外的集合石附近。你必須死亡後在幽靈狀態下才能見到他！除了現在這個任務，他也會給你前置任務「黑鐵的遺產」，你必須聽完他的故事才能接受這個任務。\n弗諾斯．達克維爾在"..YELLOW.."[9]"..WHITE.."。你會在"..YELLOW.."[7]"..WHITE.."找到神殿。"
Inst5Quest1_Prequest = "黑鐵的遺產"
Inst5Quest1_Folgequest = "無"
--
Inst5Quest1name1 = "影爐鑰匙"

--Quest 2 Alliance
Inst5Quest2 = "2. 雷布里·斯庫比格特"
Inst5Quest2_Level = "53"
Inst5Quest2_Attain = "48"
Inst5Quest2_Aim = "把雷布理的頭顱交給燃燒平原的尤卡．斯庫比格特。"
Inst5Quest2_Location = "尤卡．斯庫比格特（燃燒平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst5Quest2_Note = "可以直接接到任務，也可以從尤爾巴．斯庫比格特（塔納利斯 - 熱砂港; "..YELLOW.."67,23"..WHITE.."）那兒接到前置任務。\n雷布理在"..YELLOW.."[15]"..WHITE.."。"
Inst5Quest2_Prequest = "尤卡．斯庫比格特"
Inst5Quest2_Folgequest = "無"
Inst5Quest2PreQuest = "true"
--
Inst5Quest2name1 = "怨恨長靴"
Inst5Quest2name2 = "懺悔肩甲"
Inst5Quest2name3 = "鋼條護甲"

--Quest 3 Alliance
Inst5Quest3 = "3. 愛情藥水"
Inst5Quest3_Level = "54"
Inst5Quest3_Attain = "50"
Inst5Quest3_Aim = "將4份[格羅姆之血]、10塊巨型銀礦和裝滿水的娜瑪拉之瓶交給黑石深淵的娜瑪拉小姐。"
Inst5Quest3_Location = "娜瑪拉小姐（黑石深淵 - 黑鐵酒吧; "..YELLOW.."[15]"..WHITE.."）"
Inst5Quest3_Note = "巨型銀礦可以從艾薩拉的巨人們那裡得到。[格羅姆之血]可以請學習了草藥學的玩家幫助尋找。 你可以在（安戈洛環形山 - 葛拉卡溫泉; "..YELLOW.."31,50"..WHITE.."）為瓶子裝滿水。\n完成任務後，你可以使用後門而不必殺死法拉克斯。"
Inst5Quest3_Prequest = "無"
Inst5Quest3_Folgequest = "無"
--
Inst5Quest3name1 = "鐐銬腕輪"
Inst5Quest3name2 = "娜瑪拉的腰帶"

--Quest 4 Alliance
Inst5Quest4 = "4. 霍爾雷·黑鬚"
Inst5Quest4_Level = "55"
Inst5Quest4_Attain = "50"
Inst5Quest4_Aim = "把遺失的雷酒秘方帶給卡拉諾斯的拉格納．雷酒。"
Inst5Quest4_Location = "拉格納．雷酒（丹莫洛 - 卡拉諾斯; "..YELLOW.."46,52"..WHITE.."）"
Inst5Quest4_Note = "前置任務從恩諾哈爾．雷酒（詛咒之地 - 守望堡; "..YELLOW.."61,18"..WHITE.."）處獲得。\n如果你在"..YELLOW.."[15]"..WHITE.."區摧毀裝有雷霆啤酒的桶子，守衛就會出現。秘方就在這其中一個守衛身上。"
Inst5Quest4_Prequest = "拉格納．雷酒"
Inst5Quest4_Folgequest = "無"
Inst5Quest4PreQuest = "true"
--
Inst5Quest4name1 = "矮人黑啤酒"
Inst5Quest4name2 = "迅擊鬥槌"
Inst5Quest4name3 = "截肢斬斧"

--Quest 5 Alliance 
Inst5Quest5 = "5. 征服者派隆"
Inst5Quest5_Level = "52"
Inst5Quest5_Attain = "48"
Inst5Quest5_Aim = "殺掉征服者派隆，然後向加琳達覆命。"
Inst5Quest5_Location = "加琳達（燃燒平原 - 摩根的崗哨; "..YELLOW.."85,69"..WHITE.."）"
Inst5Quest5_Note = "征服者派隆是副本門口外面的一個火元素精英。在黑石深淵"..YELLOW.."副本入口地圖[1]"..WHITE.."。"
Inst5Quest5_Prequest = "無"
Inst5Quest5_Folgequest = "伊森迪奧斯"
-- No Rewards for this quest

--Quest 6 Alliance
Inst5Quest6 = "6. 伊森迪奧斯!"
Inst5Quest6_Level = "56"
Inst5Quest6_Attain = "48"
Inst5Quest6_Aim = "在黑石深淵裡找到伊森迪奧斯，然後把他幹掉！"
Inst5Quest6_Location = "加琳達（燃燒平原 - 摩根的崗哨; "..YELLOW.."85,69"..WHITE.."）"
Inst5Quest6_Note = "前置任務也從此NPC加琳達處獲得。伊森迪奧斯在"..YELLOW.."[10]"..WHITE.."。"
Inst5Quest6_Prequest = "征服者派隆"
Inst5Quest6_Folgequest = "無"
Inst5Quest6FQuest = "true"
--
Inst5Quest6name1 = "陽焰斗篷"
Inst5Quest6name2 = "夜暮手套"
Inst5Quest6name3 = "地穴惡魔護腕"
Inst5Quest6name4 = "堅實之握"

--Quest 7 Alliance
Inst5Quest7 = "7. 山脈之心"
Inst5Quest7_Level = "55"
Inst5Quest7_Attain = "50"
Inst5Quest7_Aim = "把山脈之心交給燃燒平原的麥克斯沃特．尤博格林。"
Inst5Quest7_Location = "麥克斯沃特．尤博格林（燃燒平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）"
Inst5Quest7_Note = "你可以從"..YELLOW.."[8]"..WHITE.."的寶箱裡找到山脈之心。在此之前你必須打開黑色寶庫中所有的小寶箱，當最後一個小寶箱被開啟之後王便會出現，擊敗他才能拿到鑰匙。"
Inst5Quest7_Prequest = "無"
Inst5Quest7_Folgequest = "無"
-- No Rewards for this quest

--Quest 8 Alliance
Inst5Quest8 = "8. 好東西"
Inst5Quest8_Level = "56"
Inst5Quest8_Attain = "50"
Inst5Quest8_Aim = "到黑石深淵去找到20個黑鐵挎包。當你完成任務之後，回到奧拉留斯那裡覆命。你認為黑石深淵裡的黑鐵矮人應該會有這些黑鐵挎包。"
Inst5Quest8_Location = "奧拉留斯（燃燒平原 - 摩根的崗哨; "..YELLOW.."84,68"..WHITE.."）"
Inst5Quest8_Note = "所有矮人都可能掉落挎包。"
Inst5Quest8_Prequest = "無"
Inst5Quest8_Folgequest = "無"
--
Inst5Quest8name1 = "骯髒的背包"

--Quest 9 Alliance
Inst5Quest9 = "9. 烈焰精華 (燃燒平原系列任務)"
Inst5Quest9_Level = "58"
Inst5Quest9_Attain = "52"
Inst5Quest9_Aim = "到黑石深淵去殺掉貝爾加。\n你只知道這個巨型怪物住在黑石深淵的最深處。記住你要使用特殊的黑龍皮從貝爾加的屍體上採集烈焰精華。\n將你採集到的烈焰精華交給塞勒斯．薩雷芬圖斯。"
Inst5Quest9_Location = "塞勒斯．薩雷芬圖斯（燃燒平原; "..YELLOW.."94,31"..WHITE.."）"
Inst5Quest9_Note = "此系列任務始於卡拉然．溫佈雷（灼熱峽谷; "..YELLOW.."39,38"..WHITE.."）。\n貝爾加在"..YELLOW.."[11]"..WHITE.."。"
Inst5Quest9_Prequest = "無瑕之焰→烈焰精華"
Inst5Quest9_Folgequest = "無"
Inst5Quest9PreQuest = "true"
--
Inst5Quest9name1 = "岩膚斗篷"
Inst5Quest9name2 = "龍革肩甲"
Inst5Quest9name3 = "火山束帶"

--Quest 10 Alliance
Inst5Quest10 = "10. 卡蘭·巨錘"
Inst5Quest10_Level = "59"
Inst5Quest10_Attain = "50"
Inst5Quest10_Aim = "去黑石深淵找到卡蘭．巨錘。\n國王提到卡蘭在那裡負責看守囚犯——也許你應該在監獄附近尋找他。"
Inst5Quest10_Location = "國王麥格尼．銅鬚（丹莫洛 - 鐵爐堡; "..YELLOW.."39,55"..WHITE.."）"
Inst5Quest10_Note = "前置任務始於皇家歷史學家阿克瑟努斯（丹莫洛 - 鐵爐堡; "..YELLOW.."38,55"..WHITE.."）。卡蘭．巨錘在"..YELLOW.."[2]"..WHITE.."。"
Inst5Quest10_Prequest =  "索瑞森廢墟"
Inst5Quest10_Folgequest = "卡蘭的故事→糟糕的消息→王國的命運→語出驚人的公主"
Inst5Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst5Quest11 = "11. 王國的命運"
Inst5Quest11_Level = "59"
Inst5Quest11_Attain = "51"
Inst5Quest11_Aim = "回到黑石深淵，從達格蘭．索瑞森大帝的魔掌中救出鐵爐堡公主茉艾拉．銅鬚。"
Inst5Quest11_Location = "國王麥格尼．銅鬚（丹莫洛 - 鐵爐堡; "..YELLOW.."39,55"..WHITE.."）"
Inst5Quest11_Note = "公主茉艾拉．銅鬚在"..YELLOW.."[21]"..WHITE.."。戰鬥中她可能會治療達格蘭。試著盡可能打斷她。但是一定不能讓她死掉，否則你的任務將會失敗！與她交談過後，你還要回到麥格尼．銅鬚那兒去。"
Inst5Quest11_Prequest = "糟糕的消息"
Inst5Quest11_Folgequest = "語出驚人的公主"
Inst5Quest11FQuest = "true"
--
Inst5Quest11name1 = "麥格尼的意志"
Inst5Quest11name2 = "鐵爐堡歌唱石"

--Quest 12 Alliance
Inst5Quest12 = "12. 熔火之心的傳送門"
Inst5Quest12_Level = "60"
Inst5Quest12_Attain = "55"
Inst5Quest12_Aim = "進入黑石深淵，在通往熔火之心的傳送門附近找到一塊熔火碎片，然後回到黑石山脈的洛索斯．天痕那裡。"
Inst5Quest12_Location = "洛索斯．天痕（黑石山; "..YELLOW.."副本入口地圖[2]"..WHITE.."）"
Inst5Quest12_Note = "完成這個任務之後，你可以與洛索斯．天痕交談以進入熔火之心。\n熔火碎片在"..YELLOW.."[23]"..WHITE.."。"
Inst5Quest12_Prequest = "無"
Inst5Quest12_Folgequest = "無"
-- No Rewards for this quest

--Quest 13 Alliance
Inst5Quest13 = "13. 挑戰 (T0.5升級任務)"
Inst5Quest13_Level = "60"
Inst5Quest13_Attain = "60"
Inst5Quest13_Aim = "前往黑石深淵競技場並在你被裁決者格里斯通宣判時將挑釁旗幟放在它的中央。殺死瑟爾倫和他的戰士們，再帶著第一塊瓦薩拉克護符回到東瘟疫之地的安希恩．哈莫那裡。"
Inst5Quest13_Location = "法爾林．樹影（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）"
Inst5Quest13_Note = "對於不同的職業後續任務是不同的。"
Inst5Quest13_Prequest = "無"
Inst5Quest13_Folgequest = "各個職業的職業任務（T0.5升級任務）"
-- No Rewards for this quest

--Quest 14 Alliance
Inst5Quest14 = "14. 鬼靈之杯 (採礦任務)"
Inst5Quest14_Level = "55"
Inst5Quest14_Attain = "55"
Inst5Quest14_Aim = "鬼靈之杯的塞娜尼．雷心要你找到他想要的材料。"
Inst5Quest14_Location = "塞娜尼．雷心（黑石深淵; "..YELLOW.."[18]"..WHITE.."）"
Inst5Quest14_Note = "只有採礦技能大於230才能接到此任務，這個任務會使你學會如何熔煉黑鐵礦石。材料如下：2個[紅寶石]，20個[金錠]，10個[真銀錠]。完成之後，如果你有[黑鐵礦石]，你可以在黑熔爐"..YELLOW.."[22]"..WHITE.."熔煉黑鐵。"
Inst5Quest14_Prequest = "無"
Inst5Quest14_Folgequest = "無"
-- No Rewards for this quest

--Quest 15 Alliance
Inst5Quest15 = "15. 挽救啤酒節! (季節性 啤酒節)"
Inst5Quest15_Level = "80"
Inst5Quest15_Attain = "75"
Inst5Quest15_Aim = "與啤酒節間諜交談。他就在黑石深淵的黑鐵酒吧裡。"
Inst5Quest15_Location = "達娜．蜜酒（丹莫洛 - 卡拉諾斯; "..YELLOW.."46,53"..WHITE.."）"
Inst5Quest15_Note = "這個任務只有在啤酒節期間才會出現。啤酒節間諜在"..YELLOW.."[15]"..WHITE.."。"
Inst5Quest15_Prequest = "無"
Inst5Quest15_Folgequest = "羞辱寇仁．恐酒"
-- No Rewards for this quest

--Quest 16 Alliance
Inst5Quest16 = "16. 羞辱寇仁·恐酒 (季節性 啤酒節每日任務)"
Inst5Quest16_Level = "80"
Inst5Quest16_Attain = "75"
Inst5Quest16_Aim = "與寇仁．恐酒交談。"
Inst5Quest16_Location = "啤酒節間諜（黑石深淵 - 黑鐵酒吧; "..YELLOW.."[15]"..WHITE.."）"
Inst5Quest16_Note = "完成這個任務將會使得寇仁．恐酒攻擊你。在啤酒節期間，每人每天都可以完成這個任務。\n前置任務只需完成一次，之後你便可以在黑鐵酒吧進行這個任務。"
Inst5Quest16_Prequest = "挽救啤酒節！"
Inst5Quest16_Folgequest = "無"
Inst5Quest16FQuest = "true"
-- No Rewards for this quest


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
Inst5Quest4_HORDE = "4. 遺失的雷酒秘方"
Inst5Quest4_HORDE_Level = "55"
Inst5Quest4_HORDE_Attain = "50"
Inst5Quest4_HORDE_Aim = "把遺失的雷酒秘方交給卡加斯的薇薇安．拉格雷。"
Inst5Quest4_HORDE_Location = "暗法師薇薇安．拉格雷<卡加斯遠征軍>（荒蕪之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst5Quest4_HORDE_Note = "前置任務由藥劑師金格<皇家藥劑師學會>（幽暗城 - 煉金房; "..YELLOW.."50,68"..WHITE.."）給予。\n秘方在某個守衛身上，只要你破壞放在"..YELLOW.."[15]"..WHITE.."的酒桶，這些守衛就會出現。"
Inst5Quest4_HORDE_Prequest = "薇薇安．拉格雷"
Inst5Quest4_HORDE_Folgequest = "無"
Inst5Quest4PreQuest_HORDE = "true"
--
Inst5Quest4name1_HORDE = "超強治療藥水"
Inst5Quest4name2_HORDE = "強效法力藥水"
Inst5Quest4name3_HORDE = "迅捷木槌"
Inst5Quest4name4_HORDE = "叉刃巨斧"

--Quest 5 Horde  (same as Quest 7 Alliance)
Inst5Quest5_HORDE = "5. 山脈之心"
Inst5Quest5_HORDE_Level = Inst5Quest7_Level
Inst5Quest5_HORDE_Attain = Inst5Quest7_Attain
Inst5Quest5_HORDE_Aim = Inst5Quest7_Aim
Inst5Quest5_HORDE_Location = Inst5Quest7_Location
Inst5Quest5_HORDE_Note = Inst5Quest7_Note
Inst5Quest5_HORDE_Prequest = Inst5Quest7_Prequest
Inst5Quest5_HORDE_Folgequest = Inst5Quest7_Folgequest
-- No Rewards for this quest

--Quest 6 Horde
Inst5Quest6_HORDE = "6. 格殺勿論:黑鐵矮人 (卡加斯系列任務)"
Inst5Quest6_HORDE_Level = "52"
Inst5Quest6_HORDE_Attain = "48"
Inst5Quest6_HORDE_Aim = "到黑石深淵去消滅那些邪惡的侵略者！軍官高圖斯要你去殺死15個鐵怒衛士、10個鐵怒獄卒和5個鐵怒步兵。完成任務之後回去向他覆命。"
Inst5Quest6_HORDE_Location = "通緝（荒蕪之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）"
Inst5Quest6_HORDE_Note = "矮人可在黑石深淵第一部分找到。\n卡加斯的軍官高圖斯在瞭望塔頂（荒蕪之地; "..YELLOW.."5,47"..WHITE.."）。"
Inst5Quest6_HORDE_Prequest = "無"
Inst5Quest6_HORDE_Folgequest = "格殺勿論：高階黑鐵軍官"
-- No Rewards for this quest

--Quest 7 Horde
Inst5Quest7_HORDE = "7. 格殺勿論:高階黑鐵軍官 (卡加斯系列任務)"
Inst5Quest7_HORDE_Level = "54"
Inst5Quest7_HORDE_Attain = "49"
Inst5Quest7_HORDE_Aim = "到黑石深淵去消滅那些邪惡的侵略者！軍官高圖斯要你殺死10個鐵怒醫師、10個鐵怒士兵和10個鐵怒軍官。完成任務之後回去向他覆命。"
Inst5Quest7_HORDE_Location = "通緝（荒蕪之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）"
Inst5Quest7_HORDE_Note = "矮人可以在"..YELLOW.."[11]"..WHITE.."貝爾加附近被找到。卡加斯的軍官高圖斯在瞭望塔頂（荒蕪之地; "..YELLOW.."5,47"..WHITE.."）。\n任務開始於雷克斯洛特（荒蕪之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）。格拉克．洛克魯布位置在燃燒平原（"..YELLOW.."38,35"..WHITE.."）。要綁定他並開始護送任務（精英），他的生命需要減少到低於50%。"
Inst5Quest7_HORDE_Prequest = "格殺勿論：黑鐵矮人"
Inst5Quest7_HORDE_Folgequest = "格拉克．洛克魯布→押送囚徒（護送任務）→行動：殺死安格弗將軍"
Inst5Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 8 Horde
Inst5Quest8_HORDE = "8. 行動:殺死安格弗將軍 (卡加斯系列任務)"
Inst5Quest8_HORDE_Level = "58"
Inst5Quest8_HORDE_Attain = "54"
Inst5Quest8_HORDE_Aim = "到黑石深淵去殺掉安格弗將軍！當任務完成之後向軍官高圖斯覆命。"
Inst5Quest8_HORDE_Location = "軍官高圖斯（荒蕪之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst5Quest8_HORDE_Note = "安格弗將軍位置在"..YELLOW.."[13]"..WHITE.."。注意：當他生命低於30%時，他會召喚幫手！有精英與非精英兩種怪。"
Inst5Quest8_HORDE_Prequest = "押送囚徒"
Inst5Quest8_HORDE_Folgequest = "無"
Inst5Quest8FQuest_HORDE = "true"
--
Inst5Quest8name1_HORDE = "征服者勳章"

--Quest 9 Horde
Inst5Quest9_HORDE = "9. 機器的崛起"
Inst5Quest9_HORDE_Level = "58"
Inst5Quest9_HORDE_Attain = "52"
Inst5Quest9_HORDE_Aim = "找到並殺掉傀儡統帥阿格曼奇，將他的頭交給魯特維爾。你還需要從守衛著阿格曼奇的狂怒傀儡和戰鬥傀儡身上收集10塊完整的元素核心。"
Inst5Quest9_HORDE_Location = "魯特維爾．沃拉圖斯（荒蕪之地; "..YELLOW.."25,44"..WHITE.."）"
Inst5Quest9_HORDE_Note = "前置任務來自聖者塞朵拉．穆瓦丹尼（荒蕪之地 - 卡加斯; "..YELLOW.."3,47"..WHITE.."）。\n你可以在"..YELLOW.."[14]"..WHITE.."發現阿格曼奇。"
Inst5Quest9_HORDE_Prequest = "機器的崛起"
Inst5Quest9_HORDE_Folgequest = "無"
Inst5Quest9PreQuest_HORDE = "true"
--
Inst5Quest9name1_HORDE = "藍月襯肩"
Inst5Quest9name2_HORDE = "雨法師披氅"
Inst5Quest9name3_HORDE = "黑陶鱗片護甲"
Inst5Quest9name4_HORDE = "熔岩護手"

--Quest 10 Horde  (same as Quest 9 Alliance)
Inst5Quest10_HORDE = "10. 烈焰精華 (燃燒平原系列任務)"
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
Inst5Quest11_HORDE = "11. 不和諧的烈焰"
Inst5Quest11_HORDE_Level = "52"
Inst5Quest11_HORDE_Attain = "48"
Inst5Quest11_HORDE_Aim = "到黑石山脈的採石場去幹掉征服者派隆，然後向桑德哈特回報。"
Inst5Quest11_HORDE_Location = "桑德哈特（荒蕪之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）"
Inst5Quest11_HORDE_Note = "征服者派隆是副本門口外面的一個火元素精英。在黑石深淵"..YELLOW.."副本入口地圖[1]"..WHITE.."。"
Inst5Quest11_HORDE_Prequest = "無"
Inst5Quest11_HORDE_Folgequest = "不和諧的火焰"
-- No Rewards for this quest

--Quest 12 Horde
Inst5Quest12_HORDE = "12. 不和諧的火焰"
Inst5Quest12_HORDE_Level = "56"
Inst5Quest12_HORDE_Attain = "48"
Inst5Quest12_HORDE_Aim = "進入黑石深淵並找到伊森迪奧斯。殺掉它，然後把你找到的信息匯報給桑德哈特。"
Inst5Quest12_HORDE_Location = "桑德哈特（荒蕪之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）"
Inst5Quest12_HORDE_Note = "前置任務也從桑德哈特這裡領取。伊森迪奧斯在"..YELLOW.."[10]"..WHITE.."。"
Inst5Quest12_HORDE_Prequest = "不和諧的烈焰"
Inst5Quest12_HORDE_Folgequest = "無"
Inst5Quest12FQuest_HORDE = "true"
--
Inst5Quest12name1_HORDE = "陽焰斗篷"
Inst5Quest12name2_HORDE = "夜暮手套"
Inst5Quest12name3_HORDE = "地穴惡魔護腕"
Inst5Quest12name4_HORDE = "堅定手套"

--Quest 13 Horde
Inst5Quest13_HORDE = "13. 最後的元素"
Inst5Quest13_HORDE_Level = "54"
Inst5Quest13_HORDE_Attain = "48"
Inst5Quest13_HORDE_Aim = "到黑石深淵去取得10份元素精華，你應該在那些作戰傀儡和傀儡製造者身上找找。另外，薇薇安．拉格雷也提到了一些有關元素生物的話題……"
Inst5Quest13_HORDE_Location = "暗法師薇薇安．拉格雷<卡加斯遠征軍>（荒蕪之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst5Quest13_HORDE_Note = "前置任務來自桑德哈特（荒蕪之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）。\n每個元素生物都可能會掉落精華。"
Inst5Quest13_HORDE_Prequest = "不和諧的烈焰"
Inst5Quest13_HORDE_Folgequest = "無"
Inst5Quest13PreQuest_HORDE = "true"
--
Inst5Quest13name1_HORDE = "拉格雷的徽印"

--Quest 14 Horde
Inst5Quest14_HORDE = "14. 指揮官哥沙克"
Inst5Quest14_HORDE_Level = "52"
Inst5Quest14_HORDE_Attain = "48"
Inst5Quest14_HORDE_Aim = "在黑石深淵裡找到指揮官哥沙克。\n在那幅草圖上畫著的是一個鐵欄後面的獸人，也許你應該到某個類似監獄的地方去找找看。"
Inst5Quest14_HORDE_Location = "神射手賈拉瑪弗（荒蕪之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst5Quest14_HORDE_Note = "前置任務來自桑德哈特（荒蕪之地 - 卡加斯; "..YELLOW.."3,48"..WHITE.."）。\n你能在"..YELLOW.."[3]"..WHITE.."找到指揮官哥沙克。位於"..YELLOW.."[5]"..WHITE.."的審訊官格斯塔恩會掉落監獄牢房鑰匙。如果你跟他交談並開始下一個任務，敵人便會出現。"
Inst5Quest14_HORDE_Prequest = "不和諧的烈焰"
Inst5Quest14_HORDE_Folgequest = "出了什麼事？"
Inst5Quest14PreQuest_HORDE = "true"

--Quest 15 Horde
Inst5Quest15_HORDE = "15. 拯救公主"
Inst5Quest15_HORDE_Level = "59"
Inst5Quest15_HORDE_Attain = "50"
Inst5Quest15_HORDE_Aim = "殺掉達格蘭．索瑞森大帝，然後將鐵爐堡公主茉艾拉．銅鬚從他的邪惡詛咒中拯救出來。"
Inst5Quest15_HORDE_Location = "索爾（奧格瑪 - 智慧谷; "..YELLOW.."31,37"..WHITE.."）"
Inst5Quest15_HORDE_Note = "與卡蘭．巨錘和索爾交談後，你將得到這個任務。\n達格蘭．索瑞森大帝在"..YELLOW.."[21]"..WHITE.."。雖然公主會治療達格蘭，但是如果想完成任務，就一定不要殺死公主。切記，切記！！！嘗試打斷公主的治療施法。"
Inst5Quest15_HORDE_Prequest = "指揮官哥沙克"
Inst5Quest15_HORDE_Folgequest = "拯救公主？"
Inst5Quest15FQuest_HORDE = "true"
--
Inst5Quest15name1_HORDE = "索爾的決心"
Inst5Quest15name2_HORDE = "奧格瑪之眼"

--Quest 16 Horde  (same as Quest 12 Alliance)
Inst5Quest16_HORDE = "16. 熔火之心的傳送門"
Inst5Quest16_HORDE_Level = Inst5Quest12_Level
Inst5Quest16_HORDE_Attain = Inst5Quest12_Attain
Inst5Quest16_HORDE_Aim = Inst5Quest12_Aim
Inst5Quest16_HORDE_Location = Inst5Quest12_Location
Inst5Quest16_HORDE_Note = Inst5Quest12_Note
Inst5Quest16_HORDE_Prequest = Inst5Quest12_Prequest
Inst5Quest16_HORDE_Folgequest = Inst5Quest12_Folgequest
-- No Rewards for this quest

--Quest 17 Horde  (same as Quest 13 Alliance)
Inst5Quest17_HORDE = "17. 挑戰 (T0.5升級任務)"
Inst5Quest17_HORDE_Level = Inst5Quest13_Level
Inst5Quest17_HORDE_Attain = Inst5Quest13_Attain
Inst5Quest17_HORDE_Aim = Inst5Quest13_Aim
Inst5Quest17_HORDE_Location = Inst5Quest13_Location
Inst5Quest17_HORDE_Note = Inst5Quest13_Note
Inst5Quest17_HORDE_Prequest = Inst5Quest13_Prequest
Inst5Quest17_HORDE_Folgequest = Inst5Quest13_Folgequest
-- No Rewards for this quest

--Quest 18 Horde  (same as Quest 14 Alliance)
Inst5Quest18_HORDE = "18. 鬼靈之杯 (採礦任務)"
Inst5Quest18_HORDE_Level = Inst5Quest14_Level
Inst5Quest18_HORDE_Attain = Inst5Quest14_Attain
Inst5Quest18_HORDE_Aim = Inst5Quest14_Aim
Inst5Quest18_HORDE_Location = Inst5Quest14_Location
Inst5Quest18_HORDE_Note = Inst5Quest14_Note
Inst5Quest18_HORDE_Prequest = Inst5Quest14_Prequest
Inst5Quest18_HORDE_Folgequest = Inst5Quest14_Folgequest
-- No Rewards for this quest

--Quest 19 Horde  (same as Quest15 Alliance)
Inst5Quest19_HORDE = "19. 挽救啤酒節! (季節性 啤酒節)"
Inst5Quest19_HORDE_Level = Inst5Quest15_Level
Inst5Quest19_HORDE_Attain = Inst5Quest15_Attain
Inst5Quest19_HORDE_Aim = Inst5Quest15_Aim
Inst5Quest19_HORDE_Location = Inst5Quest15_Location
Inst5Quest19_HORDE_Note = Inst5Quest15_Note
Inst5Quest19_HORDE_Prequest = Inst5Quest15_Prequest
Inst5Quest19_HORDE_Folgequest = Inst5Quest15_Folgequest
-- No Rewards for this quest

--Quest 20 Horde  (same as Quest 16 Alliance)
Inst5Quest20_HORDE = "20. 羞辱寇仁·恐酒 (季節性 啤酒節每日任務)"
Inst5Quest20_HORDE_Level = Inst5Quest16_Level
Inst5Quest20_HORDE_Attain = Inst5Quest16_Attain
Inst5Quest20_HORDE_Aim = Inst5Quest16_Aim
Inst5Quest20_HORDE_Location = Inst5Quest16_Location
Inst5Quest20_HORDE_Note = Inst5Quest16_Note
Inst5Quest20_HORDE_Prequest = Inst5Quest16_Prequest
Inst5Quest20_HORDE_Folgequest = Inst5Quest16_Folgequest
Inst5Quest20FQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST6 - Blackwing Lair (BWL) ---------------

Inst6Story = {
  ["Page1"] = "黑翼之巢就在黑石塔的最頂端。它就在山頂隱蔽的暗處，奈法利安就在那裡展開了他計畫的最後一個階段，他要永遠的毀滅拉格納羅斯，領導他的軍團超越艾澤拉斯所有的種族，達到無人能及、至高無上的地位。",
  ["Page2"] = "矮人石匠大師弗蘭克羅恩鑄鐵設計了這座雕刻在黑石山燃燒內部的巨大要塞。因為意圖讓它成為黑鐵力量的象徵，所以幾個世紀以來都是邪惡的矮人佔據著要塞。不過，奈法利安–死亡之翼的狡詐之子–對這偉大要塞還有其他的計畫。他和他的龍族爪牙掌控塔的上層，並在矮人地盤的火山深處向他們邀戰，那裡是火焰之王拉格納羅斯預留的權力之位。拉格納羅斯發現了用石頭創造生命的祕密，接著開始計畫組成一支銳不可擋的傀儡軍隊，來協助自己征服整座黑石山。",
  ["Page3"] = "奈法利安誓死粉碎拉格納羅斯。為此，他最近開始著手壯大他的軍隊，就和當年他父親死亡之翼的嘗試一模一樣。不過，死亡之翼的失敗，現在看來狡猾的奈法利安似乎將會成功。奈法利安為了掌權的瘋狂行為，甚至引來了紅龍軍團的忿怒–他們是黑龍軍團的世仇。雖然奈法利安的意圖被發現了，但是他達到目的的手段仍是一團謎。不過，謠傳奈法利安使用各種龍族的血液進行實驗，為的就是要組成一支強大的軍隊。\n\n奈法利安的聖所–黑翼之巢，就在黑石塔頂端的隱祕暗處。在這裡，奈法利安已開始進行破壞拉格納羅斯的最後階段，準備永遠地消滅拉格納羅斯，他還率領軍隊想征服所有艾澤拉斯的種族，將自己提升到至高無上的領導地位。",
  ["MaxPages"] = "3",
};
Inst6Caption = "黑翼之巢"
Inst6Caption2 = "黑翼之巢（故事背景第二部分）"
Inst6Caption3 = "黑翼之巢（故事背景第三部分）"

Inst6QAA = "3 個任務"
Inst6QAH = "3 個任務"

--Quest 1 Alliance
Inst6Quest1 = "1. 奈法利斯的腐敗"
Inst6Quest1_Level = "60"
Inst6Quest1_Attain = "60"
Inst6Quest1_Aim = "殺死奈法利安，並拿到紅色權杖碎片。把碎片交給塔納利斯時光之穴入口處的安納克羅斯。你必須在5小時之內完成這個任務。"
Inst6Quest1_Location = "墮落的瓦拉斯塔茲（黑翼之巢; "..YELLOW.."[2]"..WHITE.."）"
Inst6Quest1_Note = "只有一人能拾取碎片。安納克羅斯（塔納利斯 - 時光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst6Quest1_Prequest = "無"
Inst6Quest1_Folgequest = "無"
--
Inst6Quest1name1 = "黑瑪瑙鑲飾護腿"
Inst6Quest1name2 = "暗影遮罩護符"

--Quest 2 Alliance
Inst6Quest2 = "2. 黑石之王"
Inst6Quest2_Level = "60"
Inst6Quest2_Attain = "60"
Inst6Quest2_Aim = "將奈法利安的頭顱交給暴風城的瓦里安．烏瑞恩國王。 "
Inst6Quest2_Location = "奈法利安的頭顱（奈法利安掉落 - 黑翼之巢; "..YELLOW.."[10]"..WHITE.."）"
Inst6Quest2_Note = "瓦里安．烏瑞恩國王（暴風城 - 暴風要塞; "..YELLOW.."80,38"..WHITE.."）。之後會請你去找戰場元帥艾法希比（暴風城 - 英雄谷; "..YELLOW.."71,80"..WHITE.."）領取獎勵。"
Inst6Quest2_Prequest = "無"
Inst6Quest2_Folgequest = "黑石之王"
--
Inst6Quest2name1 = "屠龍大師勳章"
Inst6Quest2name2 = "屠龍大師寶珠"
Inst6Quest2name3 = "屠龍大師之戒"

--Quest 3 Alliance
Inst6Quest3 = "3. 唯一的領袖"
Inst6Quest3_Level = "60"
Inst6Quest3_Attain = "60"
Inst6Quest3_Aim = "帶著龍領主勒西雷爾的頭顱回到希利蘇斯，到塞納里奧城堡的流沙之地找巴里斯托爾斯。 "
Inst6Quest3_Location = "龍領主勒西雷爾的頭顱（勒西雷爾掉落 - 黑翼之巢; "..YELLOW.."[3]"..WHITE.."）"
Inst6Quest3_Note = "只有一人能拾取頭顱。"
Inst6Quest3_Prequest = "無"
Inst6Quest3_Folgequest = "正義之路"
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
Inst6Quest2_HORDE = "2. 黑石之王"
Inst6Quest2_HORDE_Level = "60"
Inst6Quest2_HORDE_Attain = "60"
Inst6Quest2_HORDE_Aim = "將奈法利安的頭顱交給奧格瑪的索爾。"
Inst6Quest2_HORDE_Location = "奈法利安的頭顱（奈法利安掉落 - 黑翼之巢; "..YELLOW.."[9]"..WHITE.."）"
Inst6Quest2_HORDE_Note = "索爾（奧格瑪 - 智慧谷; "..YELLOW.."31,37"..WHITE.."），之後會請你去找薩魯法爾霸王（奧格瑞瑪 - 力量谷; "..YELLOW.."51,76"..WHITE.."）領取獎勵。"
Inst6Quest2_HORDE_Prequest = "無"
Inst6Quest2_HORDE_Folgequest = "黑石之王"
--
Inst6Quest2name1_HORDE = "屠龍大師勳章"
Inst6Quest2name2_HORDE = "屠龍大師寶珠"
Inst6Quest2name3_HORDE = "屠龍大師之戒"

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

Inst7Story = "位於梣谷佐拉姆海岸的黑暗深淵，曾經是為供奉夜精靈月神伊露恩所建造的。然而在遠古的大爆炸中，神廟受到極大的衝擊然後沉入海中。它一直保持著原狀——直到其蘊含的古老力量吸引了納迦和薩特。傳說，古代怪獸阿庫麥爾就居住在神廟遺跡中。作為古代之神最喜歡的寵物之一，阿庫麥爾一直生活在這個地區進行捕食；在阿庫麥爾的吸引下，一群被稱作暮光之錘的教徒也聚集在這裡從事邪惡的勾當。"
Inst7Caption = "黑暗深淵"
Inst7QAA = "6 個任務"
Inst7QAH = "5 個任務"

--Quest 1 Alliance
Inst7Quest1 = "1. 深淵中的知識"
Inst7Quest1_Level = "23"
Inst7Quest1_Attain = "19"
Inst7Quest1_Aim = "把洛迦裡斯手稿帶給鐵爐堡的葛利．硬骨。"
Inst7Quest1_Location = "葛利．硬骨（鐵爐堡 - 荒棄的洞穴; "..YELLOW.."50,5"..WHITE.."）"
Inst7Quest1_Note = "你可以在靠近"..YELLOW.."[2]"..WHITE.."的水中找到手稿。"
Inst7Quest1_Prequest = "無"
Inst7Quest1_Folgequest = "無"
--
Inst7Quest1name1 = "鼓勵之戒"

--Quest 2 Alliance
Inst7Quest2 = "2. 研究墮落"
Inst7Quest2_Level = "24"
Inst7Quest2_Attain = "18"
Inst7Quest2_Aim = "奧伯丁的戈沙拉．夜語需要8塊墮落者的腦幹。"
Inst7Quest2_Location = "戈沙拉．夜語（黑海岸 - 奧伯丁; "..YELLOW.."38,43"..WHITE.."）"
Inst7Quest2_Note = "非必要的前置任務可以從阿古斯．夜語（暴風城 - 花園; "..YELLOW.."35,67"..WHITE.."）處得到。 黑暗深淵副本裡面和門前的所有納迦都可能掉落腦幹。"
Inst7Quest2_Prequest = "遙遠的旅途"
Inst7Quest2_Folgequest = "無"
Inst7Quest2PreQuest = "true"
--
Inst7Quest2name1 = "蟲殼護腕"
Inst7Quest2name2 = "教士斗篷"

--Quest 3 Alliance
Inst7Quest3 = "3. 尋找塞爾瑞德"
Inst7Quest3_Level = "24"
Inst7Quest3_Attain = "18"
Inst7Quest3_Aim = "到黑色深淵去找到銀色黎明守衛塞爾瑞德。"
Inst7Quest3_Location = "哨兵山德拉斯<銀色黎明>（達納蘇斯 - 工匠區; "..YELLOW.."55,24"..WHITE.."）"
Inst7Quest3_Note = "你可以在"..YELLOW.."[4]"..WHITE.."找到銀月守衛塞爾瑞德。"
Inst7Quest3_Prequest = "無"
Inst7Quest3_Folgequest = "黑暗深淵中的惡魔"
-- No Rewards for this quest

--Quest 4 Alliance
Inst7Quest4 = "4. 黑暗深淵中的惡魔"
Inst7Quest4_Level = "27"
Inst7Quest4_Attain = "18"
Inst7Quest4_Aim = "把夢遊者克爾里斯的頭顱交給達納蘇斯的哨兵塞爾高姆。"
Inst7Quest4_Location = "銀色黎明守衛塞爾瑞德（黑暗深淵; "..YELLOW.."[4]"..WHITE.."）"
Inst7Quest4_Note = "克爾里斯在"..YELLOW.."[8]"..WHITE.."。哨兵塞爾高姆（達納蘇斯 - 工匠區; "..YELLOW.."55,24"..WHITE.."）。注意！如果你點燃了克爾里斯旁邊的火焰，敵人會出現並攻擊你。"
Inst7Quest4_Prequest = "尋找塞爾瑞德"
Inst7Quest4_Folgequest = "無"
Inst7Quest4FQuest = "true"
--
Inst7Quest4name1 = "墓碑節杖"
Inst7Quest4name2 = "極光圓盾"

--Quest 5 Alliance
Inst7Quest5 = "5. 暮光之錘的末日"
Inst7Quest5_Level = "25"
Inst7Quest5_Attain = "20"
Inst7Quest5_Aim = "收集10個暮光墜飾，把它們交給達納蘇斯的銀月守衛瑪納杜斯。"
Inst7Quest5_Location = "銀月守衛瑪納杜斯（達納蘇斯 - 工匠區; "..YELLOW.."55,23"..WHITE.."）"
Inst7Quest5_Note = "每個暮光敵人都會掉落墜飾。"
Inst7Quest5_Prequest = "無"
Inst7Quest5_Folgequest = "無"
--
Inst7Quest5name1 = "雲光長靴"
Inst7Quest5name2 = "赤木束帶"

--Quest 6 Alliance
Inst7Quest6 = "6. 索蘭魯克寶珠 (術士職業任務)"
Inst7Quest6_Level = "25"
Inst7Quest6_Attain = "20"
Inst7Quest6_Aim = "找到3塊索蘭魯克寶珠的碎片和1塊索蘭魯克寶珠的大碎片，把它們交給貧瘠之地的杜安．卡漢。"
Inst7Quest6_Location = "杜安．卡漢（貧瘠之地; "..YELLOW.."49,57"..WHITE.."）"
Inst7Quest6_Note = "只有術士才能接到這個任務！3塊索蘭魯克寶珠的碎片，你可以從"..YELLOW.."[黑暗深淵]"..WHITE.."的暮光侍僧那裡得到。那塊索蘭魯克寶珠的大碎片，你要去"..YELLOW.."[影牙城堡]"..WHITE.."找影牙狼人。"
Inst7Quest6_Prequest = "無"
Inst7Quest6_Folgequest = "無"
--
Inst7Quest6name1 = "索蘭魯克寶珠"
Inst7Quest6name2 = "索拉魯克法杖"


--Quest 1 Horde
Inst7Quest1_HORDE = "1. 阿庫麥爾水晶"
Inst7Quest1_HORDE_Level = "22"
Inst7Quest1_HORDE_Attain = "17"
Inst7Quest1_HORDE_Aim = "收集20顆阿庫麥爾藍寶石，把它們交給梣谷的耶努薩克雷。"
Inst7Quest1_HORDE_Location = "耶努薩克雷（梣谷 - 佐拉姆前哨站; "..YELLOW.."11,33"..WHITE.."）"
Inst7Quest1_HORDE_Note = "前置任務《幫助耶努薩克雷》可以在蘇納曼（石爪山脈 - 烈日石居; "..YELLOW.."47,64"..WHITE.."）接到。藍寶石多生長在通往黑暗深淵入口的那條通道的洞穴牆壁上。"
Inst7Quest1_HORDE_Prequest = "幫助耶努薩克雷"
Inst7Quest1_HORDE_Folgequest = "無"
Inst7Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst7Quest2_HORDE = "2. 上古諸神的僕從"
Inst7Quest2_HORDE_Level = "22"
Inst7Quest2_HORDE_Attain = "17"
Inst7Quest2_HORDE_Aim = "把潮濕的便箋交給梣谷的耶努薩克雷。殺掉黑暗深淵裡的洛古斯．傑特，然後向梣谷的耶努薩克雷覆命。"
Inst7Quest2_HORDE_Location = "潮濕的便箋（小怪隨機掉落 - 黑暗深淵）"
Inst7Quest2_HORDE_Note = "潮濕的便箋可從黑暗深淵的海潮祭司處得到（5%掉落機率）。然後去耶努薩克雷（梣谷 - 佐拉姆前哨站; "..YELLOW.."11,33"..WHITE.."）。洛古斯．傑特在"..YELLOW.."[6]"..WHITE.."。"
Inst7Quest2_HORDE_Prequest = "無"
Inst7Quest2_HORDE_Folgequest = "無"
--
Inst7Quest2name1_HORDE = "巨拳指環"
Inst7Quest2name2_HORDE = "栗殼披肩"

--Quest 3 Horde
Inst7Quest3_HORDE = "3. 廢墟之間"
Inst7Quest3_HORDE_Level = "27"
Inst7Quest3_HORDE_Attain = "21"
Inst7Quest3_HORDE_Aim = "把深淵之石交給梣谷佐拉姆前哨站裡的耶努薩克雷。"
Inst7Quest3_HORDE_Location = "耶努薩克雷（梣谷 - 佐拉姆前哨站; "..YELLOW.."11,33"..WHITE.."）"
Inst7Quest3_HORDE_Note = "深淵之石在"..YELLOW.."[7]"..WHITE.."區水域裡。當你得到深淵之核後，阿奎尼斯男爵會出現並攻擊你。他會掉落一件觸發性的任務物品，你要把它帶給耶努薩克雷。"
Inst7Quest3_HORDE_Prequest = "無"
Inst7Quest3_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Horde
Inst7Quest4_HORDE = "4. 黑暗深淵中的惡魔"
Inst7Quest4_HORDE_Level = "27"
Inst7Quest4_HORDE_Attain = "18"
Inst7Quest4_HORDE_Aim = "把夢遊者克爾里斯的頭顱帶回雷霆崖交給巴珊娜．符文圖騰 。"
Inst7Quest4_HORDE_Location = "銀月守衛塞爾瑞德（黑暗深淵; "..YELLOW.."[4]"..WHITE.."）"
Inst7Quest4_HORDE_Note = "克爾里斯在"..YELLOW.."[8]"..WHITE.."。巴珊娜．符文圖騰在（雷霆崖 - 長者高地 "..YELLOW.."70,33"..WHITE.."）。注意！如果你點燃了克爾里斯身旁的火焰，會出現敵人攻擊你。"
Inst7Quest4_HORDE_Prequest = "無"
Inst7Quest4_HORDE_Folgequest = "無"
--
Inst7Quest4name1_HORDE = "墓碑節杖"
Inst7Quest4name2_HORDE = "極光圓盾"

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst7Quest5_HORDE = "5. 索蘭魯克寶珠 (術士職業任務)"
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

Inst8Story = "黑石山深處的這個巨大堡壘是由矮人建築大師弗蘭克羅恩．鑄鐵所設計的。這個堡壘是矮人力量的像徵，並被邪惡的黑鐵矮人佔據了數個世紀。然而，奈法利安——死亡之翼狡猾的兒子——對這個巨大的堡壘別有意圖。他和他的邪惡軍團佔據了上層黑石塔，並向佔據著黑石深淵的黑鐵矮人宣戰。奈法利安知道矮人是由強大的火元素領主拉格納羅斯所領導，所以他立志要摧毀他的敵人，並將黑石山全部占為己有。"
Inst8Caption = "黑石塔下層"
Inst8QAA = "14 個任務"
Inst8QAH = "14 個任務"

--Quest 1 Alliance
Inst8Quest1 = "1. 最後的石板"
Inst8Quest1_Level = "58"
Inst8Quest1_Attain = "40"
Inst8Quest1_Aim = "將第五塊和第六塊摩沙魯石板交給塔納利斯的勘查員詹斯．鐵靴。"
Inst8Quest1_Location = "勘查員詹斯．鐵靴（塔納利斯 - 熱砂港; "..YELLOW.."66,23"..WHITE.."）"
Inst8Quest1_Note = "你可以在"..YELLOW.."[7]"..WHITE.."和"..YELLOW.."[9]"..WHITE.."附近找到石板。\n任務獎勵來自《面對葉基亞》。你可以在勘查員詹斯．鐵靴旁邊找到葉基亞。"
Inst8Quest1_Prequest = "失落的摩沙魯石板"
Inst8Quest1_Folgequest = "面對葉基亞"
Inst8Quest1PreQuest = "true"
--
Inst8Quest1name1 = "褪色的哈卡萊披風"
Inst8Quest1name2 = "破碎的哈卡萊斗篷"

--Quest 2 Alliance
Inst8Quest2 = "2. 基布雷爾的特殊寵物"
Inst8Quest2_Level = "59"
Inst8Quest2_Attain = "55"
Inst8Quest2_Aim = "到黑石塔去找到小血斧座狼。使用籠子來捕捉這些兇猛的小野獸，然後把籠中的小座狼交給基佈雷爾。"
Inst8Quest2_Location = "基佈雷爾（燃燒平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest2_Note = "你可以在哈雷肯的旁邊"..YELLOW.."[17]"..WHITE.."找到小血斧座狼。"
Inst8Quest2_Prequest = "無"
Inst8Quest2_Folgequest = "無"
--
Inst8Quest2name1 = "座狼籠"

--Quest 3 Alliance
Inst8Quest3 = "3. 蜘蛛卵"
Inst8Quest3_Level = "59"
Inst8Quest3_Attain = "55"
Inst8Quest3_Aim = "到黑石塔去為基佈雷爾收集15枚尖塔蜘蛛卵。\n聽說那些蜘蛛周圍有許多這樣的卵。"
Inst8Quest3_Location = "基佈雷爾（燃燒平原 - 烈焰峰; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest3_Note = "你可以在"..YELLOW.."[13]"..WHITE.."附近找到蜘蛛卵。"
Inst8Quest3_Prequest = "無"
Inst8Quest3_Folgequest = "無"
--
Inst8Quest3name1 = "煙網蜘蛛籠"

--Quest 4 Alliance
Inst8Quest4 = "4. 蛛后的乳汁"
Inst8Quest4_Level = "60"
Inst8Quest4_Attain = "55"
Inst8Quest4_Aim = "你可以在黑石塔的中心地帶找到煙網蛛后。與她戰鬥，讓她在你體內注入毒汁。如果你有能力的話，就殺死她吧。當你中毒之後，回到狼狽不堪的約翰那兒，他會從你的身體裡抽取這些『蛛后的乳汁』。 "
Inst8Quest4_Location = "狼狽不堪的約翰（燃燒平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）"
Inst8Quest4_Note = "煙網蛛后就在"..YELLOW.."[13]"..WHITE.."。如果中毒後使用不成熟的毒囊解除，那麼任務就會無法完成。"
Inst8Quest4_Prequest = "無"
Inst8Quest4_Folgequest = "無"
--
Inst8Quest4name1 = "約翰的無盡之杯"

--Quest 5 Alliance
Inst8Quest5 = "5. 座狼之源"
Inst8Quest5_Level = "59"
Inst8Quest5_Attain = "55"
Inst8Quest5_Aim = "到黑石塔去摧毀那裡的座狼源頭。當你離開的時候，赫林迪斯喊出了一個名字：哈雷肯。這個詞就是獸人語中『座狼』的意思。"
Inst8Quest5_Location = "赫林迪斯．河角（燃燒平原 - 摩根的崗哨; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest5_Note = "哈雷肯在"..YELLOW.."[17]"..WHITE.."。"
Inst8Quest5_Prequest = "無"
Inst8Quest5_Folgequest = "無"
--
Inst8Quest5name1 = "阿斯托里長袍"
Inst8Quest5name2 = "吊鉤上衣"
Inst8Quest5name3 = "碧鱗胸甲"

--Quest 6 Alliance
Inst8Quest6 = "6. 烏洛克"
Inst8Quest6_Level = "60"
Inst8Quest6_Attain = "55"
Inst8Quest6_Aim = "閱讀瓦羅什的卷軸。將瓦羅什的魔精交給他。"
Inst8Quest6_Location = "瓦羅什（黑石塔下層; "..YELLOW.."[2]"..WHITE.."）"
Inst8Quest6_Note = "要得到瓦羅什的魔精，你必須要召喚並殺死烏洛克"..YELLOW.."[15]"..WHITE.."。在召喚烏洛克的過程中，你需要一根尖銳長矛"..YELLOW.."[3]"..WHITE.."和歐莫克大王的頭顱"..YELLOW.."[5]"..WHITE.."。在召喚烏洛克的過程中會有幾波巨魔出來攻擊你。注意：你可以在戰鬥中使用尖銳長矛攻擊巨魔。"
Inst8Quest6_Prequest = "無"
Inst8Quest6_Folgequest = "無"
--
Inst8Quest6name1 = "稜石符咒"

--Quest 7 Alliance
Inst8Quest7 = "7. 比修的裝置"
Inst8Quest7_Level = "59"
Inst8Quest7_Attain = "55"
Inst8Quest7_Aim = "找到比修的裝置並且交還給她。祝你好運！"
Inst8Quest7_Location = "比修（黑石塔下層; "..YELLOW.."[8]"..WHITE.."）"
Inst8Quest7_Note = "你可以在前往煙網蛛后的路上找到比修的裝置"..YELLOW.."[10]"..WHITE.."。\n麥克斯韋爾元帥（燃燒平原 - 摩根的崗哨; "..YELLOW.."84,58"..WHITE.."）。"
Inst8Quest7_Prequest = "無"
Inst8Quest7_Folgequest = "給麥克斯韋爾的消息"
-- No Rewards for this quest

--Quest 8 Alliance
Inst8Quest8 = "8. 麥克斯韋爾的任務"
Inst8Quest8_Level = "60"
Inst8Quest8_Attain = "55"
Inst8Quest8_Aim = "到黑石塔去消滅指揮官沃恩、歐莫克大王和維姆薩拉克。完成任務之後回到麥克斯韋爾元帥處覆命。"
Inst8Quest8_Location = "麥克斯韋爾（燃燒平原 - 摩根的崗哨; "..YELLOW.."84,58"..WHITE.."）"
Inst8Quest8_Note = "指揮官沃恩在"..YELLOW.."[9]"..WHITE.."，歐莫克大王在"..YELLOW.."[5]"..WHITE.."，維姆薩拉克在"..YELLOW.."[19]"..WHITE.."。"
Inst8Quest8_Prequest = "給麥克斯韋爾的消息"
Inst8Quest8_Folgequest = "無"
Inst8Quest8FQuest = "true"
--
Inst8Quest8name1 = "維姆薩拉克的鐐銬"
Inst8Quest8name2 = "歐莫克的瘦身腰帶"
Inst8Quest8name3 = "哈雷肯的籠口"
Inst8Quest8name4 = "沃許加斯的繩索"
Inst8Quest8name5 = "沃恩的邪惡之握"

--Quest 9 Alliance
Inst8Quest9 = "9. 晉升徽印"
Inst8Quest9_Level = "60"
Inst8Quest9_Attain = "57"
Inst8Quest9_Aim = "找到三塊命令寶石：燃棘寶鑽、尖石寶鑽和血斧寶鑽。把它們和原始晉升印章一起交給維埃蘭。\n可能攜帶者三塊寶石的將軍是：燃棘氏族的指揮官沃恩、尖石氏族的歐莫克大王，以及血斧氏族的維姆薩拉克。"
Inst8Quest9_Location = "維埃蘭（黑石塔下層; "..YELLOW.."[1]"..WHITE.."）"
Inst8Quest9_Note = "歐莫克大王在"..YELLOW.."[5]"..WHITE.."，指揮官沃恩在"..YELLOW.."[9]"..WHITE.."，維姆薩拉克在"..YELLOW.."[19]"..WHITE.."。原始晉升印章由黑石塔地城內外的小怪隨機掉落。\n如果你完成這一系列任務就能得到用以打開黑石塔上層門的戒指。"
Inst8Quest9_Prequest = "無"
Inst8Quest9_Folgequest = "晉升印章"
-- No Rewards for this quest

--Quest 10 Alliance
Inst8Quest10 = "10. 達基薩斯將軍的命令"
Inst8Quest10_Level = "60"
Inst8Quest10_Attain = "55"
Inst8Quest10_Aim = "把達基薩斯將軍的命令交給燃燒平原的麥克斯韋爾元帥。"
Inst8Quest10_Location = "達基薩斯將軍的命令（維姆薩拉克掉落 - 黑石塔下層; "..YELLOW.."[19]"..WHITE.."）"
Inst8Quest10_Note = "麥克斯韋爾元帥（燃燒平原 - 摩根的崗哨; "..YELLOW.."84,58"..WHITE.."）"
Inst8Quest10_Prequest = "無"
Inst8Quest10_Folgequest = "達基薩斯將軍之死（"..YELLOW.."黑石塔上層"..WHITE.."）"
-- No Rewards for this quest

--Quest 11 Alliance
Inst8Quest11 = "11. 瓦薩拉克領主護符的左半塊"
Inst8Quest11_Level = "60"
Inst8Quest11_Attain = "58"
Inst8Quest11_Aim = "使用召喚火盆召喚出莫爾．灰蹄的靈魂，然後殺掉他。完成之後，將召喚火盆與瓦薩拉克領主護符的左半塊還給黑石山的布德利。"
Inst8Quest11_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst8Quest11_Note = "你需要超維度幽靈顯形器才能看到布德利，你可以從《尋找安泰恩》任務得到它。\n\n莫爾．灰蹄在"..YELLOW.."[9]"..WHITE.."召喚。"
Inst8Quest11_Prequest = "重要的材料"
Inst8Quest11_Folgequest = "奧卡茲島在你前方……"
Inst8Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst8Quest12 = "12. 瓦薩拉克領主護符的右半塊"
Inst8Quest12_Level = "60"
Inst8Quest12_Attain = "58"
Inst8Quest12_Aim = "使用召喚火盆召喚莫爾．灰蹄的靈魂並殺了他。帶著重新組合的瓦薩拉克領主的護符和召喚火盆回到黑石山的布德利那裡。"
Inst8Quest12_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst8Quest12_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n莫爾．灰蹄在"..YELLOW.."[9]"..WHITE.."召喚。"
Inst8Quest12_Prequest = "更多重要的材料"
Inst8Quest12_Folgequest = "最後的準備（"..YELLOW.."黑石塔上層"..WHITE.."）"
Inst8Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst8Quest13 = "13. 沃許加斯的菊石 (鍛造 - 鑄劍大師任務)"
Inst8Quest13_Level = "60"
Inst8Quest13_Attain = "50"
Inst8Quest13_Aim = "到黑石塔去殺死暗影獵手沃許加斯，將沃許加斯的菊石交給基爾拉姆。"
Inst8Quest13_Location = "基爾拉姆（冬泉谷 - 永望鎮; "..YELLOW.."61,37"..WHITE.."）"
Inst8Quest13_Note = "暗影獵手沃許加斯在"..YELLOW.."[7]"..WHITE.."。"
Inst8Quest13_Prequest = "無"
Inst8Quest13_Folgequest = "無"
--
Inst8Quest13name1 = "設計圖：黎明之刃"

--Quest 14 Alliance
Inst8Quest14 = "14. 火熱的死亡"
Inst8Quest14_Level = "60"
Inst8Quest14_Attain = "56"
Inst8Quest14_Aim = "世界上一定有人知道關於這副手套的事情，祝你好運！"
Inst8Quest14_Location = "人類的殘骸（黑石塔下層; "..YELLOW.."[11]"..WHITE.."）"
Inst8Quest14_Note = "鍛造任務。確保從人類殘骸"..YELLOW.."[11]"..WHITE.."附近拿到這個鎧甲手套，交給瑪雷弗斯．暗錘（冬泉谷 - 永望鎮; "..YELLOW.."61,39"..WHITE.."）。 "
Inst8Quest14_Prequest = "無"
Inst8Quest14_Folgequest = "熾熱鎧甲護手"
--
Inst8Quest14name1 = "設計圖：熾熱鎧甲護手 "
Inst8Quest14name2 = "熾熱鎧甲護手"


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
Inst8Quest5_HORDE = "5. 座狼的首領"
Inst8Quest5_HORDE_Level = "59"
Inst8Quest5_HORDE_Attain = "55"
Inst8Quest5_HORDE_Aim = "殺死血斧座狼的領袖，哈雷肯。"
Inst8Quest5_HORDE_Location = "神射手賈拉瑪弗（荒蕪之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest5_HORDE_Note = "哈雷肯在"..YELLOW.."[17]"..WHITE.."。"
Inst8Quest5_HORDE_Prequest = "無"
Inst8Quest5_HORDE_Folgequest = "無"
--
Inst8Quest5name1_HORDE = "阿斯托里長袍"
Inst8Quest5name2_HORDE = "吊鉤上衣"
Inst8Quest5name3_HORDE = "碧鱗胸甲"

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
Inst8Quest7_HORDE = "7. 狡猾的比修"
Inst8Quest7_HORDE_Level = "59"
Inst8Quest7_HORDE_Attain = "55"
Inst8Quest7_HORDE_Aim = "到黑石塔去查明比修的下落。"
Inst8Quest7_HORDE_Location = "雷克斯洛特（荒蕪之地 - 卡加斯; "..YELLOW.."5,47"..WHITE.."）"
Inst8Quest7_HORDE_Note = "比修在"..YELLOW.."[8]"..WHITE.."。"
Inst8Quest7_HORDE_Prequest = "無"
Inst8Quest7_HORDE_Folgequest = "比修的裝置"
-- No Rewards for this quest

--Quest 8 Horde
Inst8Quest8_HORDE = "8. 比修的裝置"
Inst8Quest8_HORDE_Level = "59"
Inst8Quest8_HORDE_Attain = "55"
Inst8Quest8_HORDE_Aim = "找到比修的裝置並把它們還給她。你記得她說過她把裝置藏在城市的最底層。"
Inst8Quest8_HORDE_Location = "比修（黑石塔下層; "..YELLOW.."[8]"..WHITE.."）"
Inst8Quest8_HORDE_Note = "你可以在在通往煙網蛛后的路上找到比修的裝置"..YELLOW.."[10]"..WHITE.."。"
Inst8Quest8_HORDE_Prequest = "狡猾的比修"
Inst8Quest8_HORDE_Folgequest = "比修的偵查報告"
Inst8Quest8FQuest_HORDE = "true"
--
Inst8Quest8name1_HORDE = "亂風手套"
Inst8Quest8name2_HORDE = "海港束帶"

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
Inst8Quest10_HORDE = "10. 高圖斯的命令"
Inst8Quest10_HORDE_Level = "60"
Inst8Quest10_HORDE_Attain = "55"
Inst8Quest10_HORDE_Aim = "殺死歐莫克大王、指揮官沃恩和維姆薩拉克。找到重要的黑石文件，然後向卡加斯的軍官高圖斯匯報。"
Inst8Quest10_HORDE_Location = "軍官高圖斯（荒蕪之地 - 卡加斯; "..YELLOW.."65,22"..WHITE.."）"
Inst8Quest10_HORDE_Note = "奧妮克希亞的巢穴鑰匙前置任務。指揮官沃恩在"..YELLOW.."[9]"..WHITE.."，歐莫克大王在 "..YELLOW.."[5]"..WHITE.."，維姆薩拉克在 "..YELLOW.."[19]"..WHITE.."。重要的黑石文件在3個王的其中一個附近。"
Inst8Quest10_HORDE_Prequest = "無"
Inst8Quest10_HORDE_Folgequest = "伊崔格的智慧→為部落而戰（"..YELLOW.."黑石塔上層"..WHITE.."）"
--
Inst8Quest10name1_HORDE = "維姆薩拉克的鐐銬"
Inst8Quest10name2_HORDE = "歐莫克的瘦身腰帶"
Inst8Quest10name3_HORDE = "哈雷肯的籠口"
Inst8Quest10name4_HORDE = "沃許加斯的繩索"
Inst8Quest10name5_HORDE = "沃恩的邪惡之握"

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

Inst9Story = "黑石山深處的這個巨大堡壘是由矮人建築大師弗蘭克羅恩．鑄鐵所設計的。這個堡壘是矮人力量的像徵，並被邪惡的黑鐵矮人佔據了數個世紀。然而，奈法利安——死亡之翼狡猾的兒子——對這個巨大的堡壘別有意圖。他和他的邪惡軍團佔據了上層黑石塔，並向佔據著黑石深淵的黑鐵矮人宣戰。奈法利安知道矮人是由強大的火元素領主拉格納羅斯所領導，所以他立志要摧毀他的敵人，並將黑石山全部占為己有。"
Inst9Caption = "黑石塔上層"
Inst9QAA = "11 個任務"
Inst9QAH = "13 個任務"

--Quest 1 Alliance
Inst9Quest1 = "1. 監護者"
Inst9Quest1_Level = "60"
Inst9Quest1_Attain = "57"
Inst9Quest1_Aim = "到冬泉谷去找到哈爾琳，把奧比的鱗片交給她。"
Inst9Quest1_Location = "奧比（黑石塔上層; "..YELLOW.."[7]"..WHITE.."）"
Inst9Quest1_Note = "你可以在競技場旁邊的房間找到奧比"..YELLOW.."[7]"..WHITE.."，牠躺在一個突出部份上。\n哈爾琳就在冬泉谷（"..YELLOW.."54,51"..WHITE.."）。站在洞穴深處的藍色傳送符文上就能傳送到她身邊。"
Inst9Quest1_Prequest = "無"
Inst9Quest1_Folgequest = "藍龍之怒"
-- No Rewards for this quest

--Quest 2 Alliance
Inst9Quest2 = "2. 芬克·恩霍爾，為您效勞!"
Inst9Quest2_Level = "60"
Inst9Quest2_Attain = "57"
Inst9Quest2_Aim = "與永望鎮的瑪雷弗斯．暗錘談話。"
Inst9Quest2_Location = "芬克．恩霍爾（黑石塔上層; "..YELLOW.."[8]"..WHITE.."）"
Inst9Quest2_Note = "殺死比斯巨獸後，芬克．恩霍爾會在撥完比斯巨獸的皮後出現。瑪雷弗斯．暗錘在（冬泉谷 - 永望鎮; "..YELLOW.."61,38"..WHITE.."）。"
Inst9Quest2_Prequest = "無"
Inst9Quest2_Folgequest = "阿卡納護腿、血色學者之帽、嗜血胸甲"
-- No Rewards for this quest

--Quest 3 Alliance
Inst9Quest3 = "3. 冷凍龍蛋 (燃燒平原系列任務)"
Inst9Quest3_Level = "60"
Inst9Quest3_Attain = "57"
Inst9Quest3_Aim = "在孵化間對著某顆龍蛋使用龍蛋冷凍器初號機。"
Inst9Quest3_Location = "丁奇．斯迪波爾（燃燒平原 - 烈焰峰; "..YELLOW.."65,24"..WHITE.."）"
Inst9Quest3_Note = "你可以在烈焰之父"..YELLOW.."[2]"..WHITE.."的房間找到龍蛋。"
Inst9Quest3_Prequest = "雛龍精華→丁奇．斯迪波爾"
Inst9Quest3_Folgequest = "收集龍蛋"
Inst9Quest3PreQuest = "true"
--
Inst9Quest3name1 = "龍蛋冷凍器"

--Quest 4 Alliance
Inst9Quest4 = "4. 艾博希爾之眼"
Inst9Quest4_Level = "60"
Inst9Quest4_Attain = "55"
Inst9Quest4_Aim = "將艾博希爾之眼交給艾薩拉的海達克西斯公爵。"
Inst9Quest4_Location = "海達克西斯公爵（艾薩拉; "..YELLOW.."79,73"..WHITE.."）"
Inst9Quest4_Note = "你可以在"..YELLOW.."[1]"..WHITE.."找到烈焰衛士艾博希爾。在3.0.8版本之後你將不再需要進行這條任務線了，如果你已經擁有這個任務了，你仍然可以完成它。"
Inst9Quest4_Prequest = "被囚禁的水元素→雷暴和磐石"
Inst9Quest4_Folgequest = "熔火之心"
Inst9Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst9Quest5 = "5. 達基薩斯將軍之死"
Inst9Quest5_Level = "60"
Inst9Quest5_Attain = "55"
Inst9Quest5_Aim = "到黑石塔去殺掉達基薩斯將軍，完成任務之後就回到麥克斯韋爾元帥那裡覆命。"
Inst9Quest5_Location = "麥克斯韋爾元帥（燃燒平原 - 摩根的崗哨; "..YELLOW.."82,68"..WHITE.."）"
Inst9Quest5_Note = "達基薩斯將軍在"..YELLOW.."[9]"..WHITE.."。"
Inst9Quest5_Prequest = "達基薩斯將軍的命令（"..YELLOW.."黑石塔下層"..WHITE.."）"
Inst9Quest5_Folgequest = "無"
Inst9Quest5PreQuest = "true"
--
Inst9Quest5name1 = "暴君印記"
Inst9Quest5name2 = "比斯巨獸之眼"
Inst9Quest5name3 = "黑手飾物"

--Quest6 Alliance
Inst9Quest6 = "6. 末日扣環"
Inst9Quest6_Level = "60"
Inst9Quest6_Attain = "57"
Inst9Quest6_Aim = "將末日扣環交給燃燒平原的瑪亞拉．布萊特文。"
Inst9Quest6_Location = "瑪亞拉．布萊特文（燃燒平原 - 摩根的崗哨; "..YELLOW.."84,69"..WHITE.."）"
Inst9Quest6_Note = "前置任務是在雷明頓．瑞治維爾伯爵（暴風城 - 暴風要塞; "..YELLOW.."74,30"..WHITE.."）處取得。\n你可以在烈焰之父的房間"..YELLOW.."[2]"..WHITE.."找到裝有末日扣環的箱子。"
Inst9Quest6_Prequest = "瑪亞拉．布萊特文"
Inst9Quest6_Folgequest = "瑞治維爾的箱子"
Inst9Quest6PreQuest = "true"
--
Inst9Quest6name1 = "迅捷皮靴"
Inst9Quest6name2 = "閃現打擊護臂"

--Quest7 Alliance
Inst9Quest7 = "7. 黑手的命令"
Inst9Quest7_Level = "60"
Inst9Quest7_Attain = "55"
Inst9Quest7_Aim = "真是個愚蠢的獸人。看來你需要找到那枚烙印並獲得達基薩斯徽記才可以使用命令寶珠。\n你從信中獲知，達基薩斯將軍守衛著烙印。也許你應該就此進行更深入的調查。"
Inst9Quest7_Location = "黑手的命令（裂盾軍需官掉落 - 黑石塔; "..YELLOW.."副本入口地圖[7]"..WHITE.."）"
Inst9Quest7_Note = "黑翼之巢的進門任務。你可以在黑石塔副本的門口右側通道附近找到裂盾軍需官。烙印就在黑石塔上層的達基薩斯將軍"..YELLOW.."[9]"..WHITE.."身後。 "
Inst9Quest7_Prequest = "無"
Inst9Quest7_Folgequest = "無"
-- No Rewards for this quest

--Quest 8 Alliance
Inst9Quest8 = "8. 最後的準備 (T0.5升級任務)"
Inst9Quest8_Level = "60"
Inst9Quest8_Attain = "58"
Inst9Quest8_Aim = "從黑石塔的獸人那兒收集40副黑石護腕，把它們和一瓶超級能量精煉藥劑一起交給黑石山的布德利。"
Inst9Quest8_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst9Quest8_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。黑石護腕由黑石塔地城內外以及黑石塔上下的獸人隨機掉落，尤其名稱中帶有「黑手」的怪物有較高的機率掉落。超級能量精煉藥劑是煉金製造。"
Inst9Quest8_Prequest = "瓦薩拉克護符的右半塊（"..YELLOW.."黑石塔下層"..WHITE.."）"
Inst9Quest8_Folgequest = "認錯，瓦薩拉克領主"
Inst9Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst9Quest9 = "9. 認錯，瓦薩拉克領主"
Inst9Quest9_Level = "60"
Inst9Quest9_Attain = "58"
Inst9Quest9_Aim = "在比斯巨獸的房間裡使用召喚火盆，召喚瓦薩拉克領主。殺死他，對屍體使用瓦薩拉克的飾品。然後將瓦薩拉克領主護符還給瓦薩拉克領主之靈。"
Inst9Quest9_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst9Quest9_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。在"..YELLOW.."[8]"..WHITE.."召喚瓦薩拉克領主。"
Inst9Quest9_Prequest = "最後的準備"
Inst9Quest9_Folgequest = "回到布德利那裡"
Inst9Quest9FQuest = "true"
--
Inst9Quest9name1 = "祈願火盆"
Inst9Quest9name2 = "祈願火盆：使用手冊"

--Quest 10 Alliance
Inst9Quest10 = "10. 惡魔熔爐 (鍛造 - 鑄甲大師任務)"
Inst9Quest10_Level = "60"
Inst9Quest10_Attain = "55"
Inst9Quest10_Aim = "到黑石塔去找到古拉魯克。殺死他，然後用血污長矛刺入他的屍體。當他的靈魂被吸乾後，這支矛就會成為穿魂長矛。你還必須找到未鑄造的符文覆飾胸甲。將穿魂長矛和未鑄造的符文覆飾胸甲都交給冬泉谷的羅拉克斯。"
Inst9Quest10_Location = "羅拉克斯（冬泉谷; "..YELLOW.."64,74"..WHITE.."）"
Inst9Quest10_Note = "鍛造任務。古拉魯克在"..YELLOW.."[5]"..WHITE.."。"
Inst9Quest10_Prequest = "無"
Inst9Quest10_Folgequest = "無"
--
Inst9Quest10name1 = "設計圖：魔鑄胸甲"
Inst9Quest10name2 = "屠魔藥劑"
Inst9Quest10name3 = "魔吻背包"

--Quest 11 Alliance
Inst9Quest11 = "11. 收集龍蛋"
Inst9Quest11_Level = "60"
Inst9Quest11_Attain = "57"
Inst9Quest11_Aim = "將電動採集模組和8顆收集到的龍蛋交給燃燒平原烈焰峰的丁奇．斯迪波爾。"
Inst9Quest11_Location = "丁奇．斯迪波爾（燃燒平原 - 烈焰峰; "..YELLOW.."65,24"..WHITE.."）"
Inst9Quest11_Note = "你可以在烈焰之父的房間"..YELLOW.."[2]"..WHITE.."處找到許多龍蛋。"
Inst9Quest11_Prequest = "冷凍龍蛋"
Inst9Quest11_Folgequest = "萊尼德．巴薩羅梅→貝蒂娜．比格辛克→黎明先鋒（"..YELLOW.."通靈學院"..WHITE.."）"
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
Inst9Quest5_HORDE = "5. 黑暗石板"
Inst9Quest5_HORDE_Level = "60"
Inst9Quest5_HORDE_Attain = "57"
Inst9Quest5_HORDE_Aim = "將黑暗石板交給卡加斯的暗法師薇薇安．拉格雷。"
Inst9Quest5_HORDE_Location = "暗法師薇薇安．拉格雷（荒蕪之地 - 卡加斯; "..YELLOW.."2,47"..WHITE.."）"
Inst9Quest5_HORDE_Note = "前置任務是在藥劑師金格（幽暗城 - 煉金房; "..YELLOW.."50,68"..WHITE.."）處接的。\n黑暗石板就在烈焰之父的房間（"..YELLOW.."[2]"..WHITE.."）。"
Inst9Quest5_HORDE_Prequest = "薇薇安．拉格雷和黑暗石板"
Inst9Quest5_HORDE_Folgequest = "無"
Inst9Quest5PreQuest_HORDE = "true"
--
Inst9Quest5name1_HORDE = "迅捷皮靴"
Inst9Quest5name2_HORDE = "閃現打擊護臂"

--Quest6 Horde
Inst9Quest6_HORDE = "6. 為部落而戰!"
Inst9Quest6_HORDE_Level = "60"
Inst9Quest6_HORDE_Attain = "55"
Inst9Quest6_HORDE_Aim = "去黑石塔殺死大酋長雷德．黑手，帶著他的頭顱返回奧格瑪。"
Inst9Quest6_HORDE_Location = "索爾（奧格瑪 - 智慧谷; "..YELLOW.."31,38"..WHITE.."）"
Inst9Quest6_HORDE_Note = "奧妮克希亞的巢穴鑰匙系列任務。\n大酋長雷德．黑手在"..YELLOW.."[6]"..WHITE.."。"
Inst9Quest6_HORDE_Prequest = "高圖斯的命令→伊崔格的智慧"
Inst9Quest6_HORDE_Folgequest = "部落的勇士"
Inst9Quest6PreQuest_HORDE = "true"
--
Inst9Quest6name1_HORDE = "暴君印記"
Inst9Quest6name2_HORDE = "比斯巨獸之眼"
Inst9Quest6name3_HORDE = "黑手飾物"

--Quest7 Horde
Inst9Quest7_HORDE = "7. 黑龍幻影"
Inst9Quest7_HORDE_Level = "60"
Inst9Quest7_HORDE_Attain = "55"
Inst9Quest7_HORDE_Aim = "到黑石塔去收集20顆黑色龍人的眼球，完成任務之後回到巫女米蘭達那裡。"
Inst9Quest7_HORDE_Location = "巫女米蘭達（西瘟疫之地; "..YELLOW.."50,77"..WHITE.."）"
Inst9Quest7_HORDE_Note = "黑龍都會掉落黑色龍人眼球。"
Inst9Quest7_HORDE_Prequest = "部落的勇士→雷克薩的證明"
Inst9Quest7_HORDE_Folgequest = "艾博斯塔夫"
Inst9Quest7FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest8 Horde
Inst9Quest8_HORDE = "8. 黑龍勇士之血"
Inst9Quest8_HORDE_Level = "60"
Inst9Quest8_HORDE_Attain = "55"
Inst9Quest8_HORDE_Aim = "到黑石塔去殺掉達基薩斯將軍，把它的血交給羅卡洛。"
Inst9Quest8_HORDE_Location = "羅卡洛（淒涼之地 - 葬影村; "..YELLOW.."25,71"..WHITE.."）"
Inst9Quest8_HORDE_Note = "部落奧妮克希亞的巢穴鑰匙系列任務的最後一步。達基薩斯將軍在"..YELLOW.."[9]"..WHITE.."。"
Inst9Quest8_HORDE_Prequest = "龍骨試煉，埃克托茲→晉升……"
Inst9Quest8_HORDE_Folgequest = "無"
Inst9Quest8FQuest_HORDE = "true"
--
Inst9Quest8name1_HORDE = "龍火護符"

--Quest 9 Horde  (same as Quest 7 Alliance)
Inst9Quest9_HORDE = "9. 黑手的命令"
Inst9Quest9_HORDE_Level = Inst9Quest7_Level
Inst9Quest9_HORDE_Attain = Inst9Quest7_Attain
Inst9Quest9_HORDE_Aim = Inst9Quest7_Aim
Inst9Quest9_HORDE_Location = Inst9Quest7_Location
Inst9Quest9_HORDE_Note = Inst9Quest7_Note
Inst9Quest9_HORDE_Prequest = Inst9Quest7_Prequest
Inst9Quest9_HORDE_Folgequest = Inst9Quest7_Folgequest
-- No Rewards for this quest

--Quest 10 Horde  (same as Quest 8 Alliance)
Inst9Quest10_HORDE = "10. 最後的準備"
Inst9Quest10_HORDE_Level = Inst9Quest8_Level
Inst9Quest10_HORDE_Attain = Inst9Quest8_Attain
Inst9Quest10_HORDE_Aim = Inst9Quest8_Aim
Inst9Quest10_HORDE_Location = Inst9Quest8_Location
Inst9Quest10_HORDE_Note = Inst9Quest8_Note
Inst9Quest10_HORDE_Prequest = Inst9Quest8_Prequest
Inst9Quest10_HORDE_Folgequest = Inst9Quest8_Folgequest
-- No Rewards for this quest

--Quest 11 Horde  (same as Quest 9 Alliance)
Inst9Quest11_HORDE = "11. 認錯，瓦薩拉克領主"
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
Inst9Quest12_HORDE = "12. 惡魔熔爐 (鍛造 - 鑄甲大師任務)"
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

--Quest 13 Horde  (same as Quest 10 Alliance)
Inst9Quest13_HORDE = "13. 收集龍蛋"
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

Inst10Story = "埃德薩拉斯古城是在一萬二千年前由當時一批夜精靈法師所秘密建造的，它被用於保護艾薩拉女王最寶貴的法術秘密。雖然受到了世界大震動的影響，這座偉大的城市仍宏偉地屹立在那裡，現在被稱為厄運之槌。這座遺跡城市分為三個部分，分別被不同的生物所佔據——包括幽靈般的高等精靈、邪惡的薩特和魯莽的巨魔部族。只有最勇敢的冒險隊伍才敢進入這個破碎的城市，並面對遠古地窖中的邪惡力量。"
Inst10Caption = "厄運之槌（東）"
Inst10QAA = "6 個任務"
Inst10QAH = "6 個任務"

--Quest 1 Alliance
Inst10Quest1 = "1. 普希林和埃斯托爾迪"
Inst10Quest1_Level = "58"
Inst10Quest1_Attain = "54"
Inst10Quest1_Aim = "到厄運之槌去找到小鬼普希林。你可以使用任何手段從小鬼那裡得到埃斯托爾迪的咒術之書。\n找到咒術之書後，回到拉瑞斯小亭的埃斯托爾迪那裡。"
Inst10Quest1_Location = "埃斯托爾迪（菲拉斯 - 拉瑞斯小亭; "..YELLOW.."76,37"..WHITE.."）"
Inst10Quest1_Note = "普希林在厄運之槌"..YELLOW.."東"..WHITE.."的"..YELLOW.."[1]"..WHITE.."。你一和它說話它就跑，但是最後會停下並可以被攻擊在"..YELLOW.."[2]"..WHITE.."。它還會掉落月牙鑰匙，也就是厄運之槌北和西的鑰匙。"
Inst10Quest1_Prequest = "無"
Inst10Quest1_Folgequest = "無"
--
Inst10Quest1name1 = "活躍之靴"
Inst10Quest1name2 = "奔行者之劍"

--Quest 2 Alliance
Inst10Quest2 = "2. 蕾瑟塔蒂絲的網"
Inst10Quest2_Level = "57"
Inst10Quest2_Attain = "54"
Inst10Quest2_Aim = "把蕾瑟塔蒂絲的網交給菲拉斯羽月要塞的拉托尼庫斯．月矛。"
Inst10Quest2_Location = "拉托尼庫斯．月矛（菲拉斯 - 羽月要塞; "..YELLOW.."30,46"..WHITE.."）"
Inst10Quest2_Note = "蕾瑟塔蒂絲在厄運之槌"..YELLOW.."東"..WHITE.."的"..YELLOW.."[3]"..WHITE.."。前置任務可以從鐵爐堡的信使考雷．落錘處接到。"
Inst10Quest2_Prequest = "羽月要塞"
Inst10Quest2_Folgequest = "無"
Inst10Quest2PreQuest = "true"
--
Inst10Quest2name1 = "學識匕首"

--Quest 3 Alliance
Inst10Quest3 = "3. 魔藤碎片"
Inst10Quest3_Level = "60"
Inst10Quest3_Attain = "56"
Inst10Quest3_Aim = "在厄運之槌中找到魔藤，然後從它上面採集一塊碎片。只有幹掉了奧茲恩之後，你才能進行採集工作。使用淨化之匣安全地封印碎片，然後將其交給月光林地永夜港的拉比恩．薩圖納。"
Inst10Quest3_Location = "拉比恩．薩圖納（月光林地 - 永夜港; "..YELLOW.."51,44"..WHITE.."）"
Inst10Quest3_Note = "奧茲恩在厄運之槌"..YELLOW.."東"..WHITE.."的"..YELLOW.."[5]"..WHITE.."。淨化之匣在希利蘇斯"..YELLOW.."62,54"..WHITE.."。前置任務同樣來自拉比恩．薩圖納。"
Inst10Quest3_Prequest = "淨化之匣"
Inst10Quest3_Folgequest = "無"
Inst10Quest3PreQuest = "true"
--
Inst10Quest3name1 = "米利的盾牌"
Inst10Quest3name2 = "米利的詞典"

--Quest 4 Alliance
Inst10Quest4 = "4. 瓦薩拉克領主護符的左半塊"
Inst10Quest4_Level = "60"
Inst10Quest4_Attain = "58"
Inst10Quest4_Aim = "使用召喚火盆召喚依薩利恩的靈魂並殺了她。完成之後，帶著瓦薩拉克領主護符的左半塊和召喚火盆回到黑石山的布德利那裡。"
Inst10Quest4_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst10Quest4_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n依薩利恩在"..YELLOW.."[5]"..WHITE.."召喚。"
Inst10Quest4_Prequest = "重要的材料"
Inst10Quest4_Folgequest = "奧卡茲島在你前方……"
Inst10Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst10Quest5 = "5. 瓦薩拉克領主護符的右半塊"
Inst10Quest5_Level = "60"
Inst10Quest5_Attain = "58"
Inst10Quest5_Aim = "使用召喚火盆召喚依薩利恩的靈魂並殺了她。完成之後，帶著重新組合的瓦薩拉克領主護符和召喚火盆回到黑石山的布德利那裡。"
Inst10Quest5_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D]"..WHITE.."）"
Inst10Quest5_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n依薩利恩在"..YELLOW.."[5]"..WHITE.."召喚。"
Inst10Quest5_Prequest = "更多重要的材料"
Inst10Quest5_Folgequest = "最後的準備（"..YELLOW.."黑石塔上層"..WHITE.."）"
Inst10Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst10Quest6 = "6. 監牢之鏈 (術士職業任務)"
Inst10Quest6_Level = "60"
Inst10Quest6_Attain = "60"
Inst10Quest6_Aim = "到菲拉斯的厄運之槌去，從扭木廣場的荒野薩特身上找到15份薩特之血，然後把它們交給腐爛之痕的戴奧。"
Inst10Quest6_Location = "衰老的戴奧（詛咒之地 - 腐爛之痕; "..YELLOW.."34,50"..WHITE.."）"
Inst10Quest6_Note = "術士召喚末日守衛任務，你可以從衰老的戴奧那裡接到相關的其他任務。最容易找到荒野薩特是從厄運之槌東的「後門」進入（菲拉斯 - 拉瑞斯小亭; "..YELLOW.."77,37"..WHITE.."）。 你需要有月牙鑰匙才能開門。"
Inst10Quest6_Prequest = "無"
Inst10Quest6_Folgequest = "無"
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
Inst10Quest2_HORDE = "2. 蕾瑟塔蒂絲的網"
Inst10Quest2_HORDE_Level = "57"
Inst10Quest2_HORDE_Attain = "54"
Inst10Quest2_HORDE_Aim = "把蕾瑟塔蒂絲的網交給菲拉斯莫沙徹營地的塔羅．刺蹄。"
Inst10Quest2_HORDE_Location = "塔羅．刺蹄（菲拉斯 - 莫沙徹營地; "..YELLOW.."76,43"..WHITE.."）"
Inst10Quest2_HORDE_Note = "蕾瑟塔蒂絲在厄運之槌"..YELLOW.."東"..WHITE.."的"..YELLOW.."[3]"..WHITE.."。前置任務可以從奧格瑪的公告員高拉克處接到。"
Inst10Quest2_HORDE_Prequest = "莫沙徹營地"
Inst10Quest2_HORDE_Folgequest = "無"
Inst10Quest2PreQuest_HORDE = "true"
--
Inst10Quest2name1_HORDE = "學識匕首"

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

Inst11Story = "埃德薩拉斯古城是在一萬二千年前由當時一批夜精靈法師所秘密建造的，它被用於保護艾薩拉女王最寶貴的法術秘密。雖然受到了世界大震動的影響，這座偉大的城市仍宏偉地屹立在那裡，現在被稱為厄運之槌。這座遺跡城市分為三個部分，分別被不同的生物所佔據——包括幽靈般的高等精靈、邪惡的薩特和魯莽的巨魔部族。只有最勇敢的冒險隊伍才敢進入這個破碎的城市，並面對遠古地窖中的邪惡力量。"
Inst11Caption = "厄運之槌（北）"
Inst11QAA = "5 個任務"
Inst11QAH = "5 個任務"

--Quest 1 Alliance
Inst11Quest1 = "1. 破碎的陷阱"
Inst11Quest1_Level = "60"
Inst11Quest1_Attain = "56"
Inst11Quest1_Aim = "修復這個陷阱。"
Inst11Quest1_Location = "破碎的陷阱（厄運之槌; "..YELLOW.."北，[4]"..WHITE.."）"
Inst11Quest1_Note = "可重複任務。為了修好陷阱你必須有[瑟銀零件]和一瓶[冰霜之油]。"
Inst11Quest1_Prequest = "無"
Inst11Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst11Quest2 = "2. 戈多克巨魔裝"
Inst11Quest2_Level = "60"
Inst11Quest2_Attain = "56"
Inst11Quest2_Aim = "把4份[符文布卷]、8塊[硬甲皮]、2根[符文線]和一份巨魔鞣酸交給諾特．希姆加克。他現在被拴在厄運之槌的戈多克巨魔那邊。"
Inst11Quest2_Location = "諾特．希姆加克（厄運之槌; "..YELLOW.."北，[4]"..WHITE.."）"
Inst11Quest2_Note = "可重複任務。巨魔鞣酸可以從"..YELLOW.."[4]上層"..WHITE.."附近得到。"
Inst11Quest2_Prequest = "無"
Inst11Quest2_Folgequest = "無"
--
Inst11Quest2name1 = "戈多克巨魔裝"

--Quest 3 Alliance
Inst11Quest3 = "3. 逃出生天！"
Inst11Quest3_Level = "60"
Inst11Quest3_Attain = "60"
Inst11Quest3_Aim = "幫諾特找到戈多克鐐銬鑰匙。"
Inst11Quest3_Location = "諾特．希姆加克（厄運之槌; "..YELLOW.."北，[4]"..WHITE.."）"
Inst11Quest3_Note = "可重複任務。副本裡的任何一個巨魔都可能掉落鐐銬鑰匙。"
Inst11Quest3_Prequest = "無"
Inst11Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst11Quest4 = "4. 戈多克巨魔的事務"
Inst11Quest4_Level = "60"
Inst11Quest4_Attain = "56"
Inst11Quest4_Aim = "找到戈多克力量護手，並將它交給厄運之槌的克羅卡斯。"
Inst11Quest4_Location = "克羅卡斯（厄運之槌; "..YELLOW.."北，[5]"..WHITE.."）"
Inst11Quest4_Note = "托塞德林王子在厄運之槌"..YELLOW.."西"..WHITE.."的"..YELLOW.."[7]"..WHITE.."。力量護手在王子附近的一個箱子裡，交任務時你也必須確保你有「我是國王」這個狀態。"
Inst11Quest4_Prequest = "無"
Inst11Quest4_Folgequest = "無"
--
Inst11Quest4name1 = "戈多克裹手"
Inst11Quest4name2 = "戈多克手套"
Inst11Quest4name3 = "戈多克護手"
Inst11Quest4name4 = "戈多克手甲"

--Quest 5 Alliance
Inst11Quest5 = "5. 戈多克好酒"
Inst11Quest5_Level = "60"
Inst11Quest5_Attain = "60"
Inst11Quest5_Aim = "你是頭兒，可以喝我的酒！讓你精神煥發！都是好酒，頭兒……你嘗嘗，告訴克雷格！"
Inst11Quest5_Location = "踐踏者克雷格（厄運之槌; "..YELLOW.."北，[2]"..WHITE.."）"
Inst11Quest5_Note = "只要和克雷格交談便可同時接受與完成任務，你也必須確保你有「我是國王」這個狀態。"
Inst11Quest5_Prequest = "無"
Inst11Quest5_Folgequest = "無"
--
Inst11Quest5name1 = "戈多克綠酒"
Inst11Quest5name2 = "克雷格的烈酒"


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

Inst12Story = "埃德薩拉斯古城是在一萬二千年前由當時一批夜精靈法師所秘密建造的，它被用於保護艾薩拉女王最寶貴的法術秘密。雖然受到了世界大震動的影響，這座偉大的城市仍宏偉地屹立在那裡，現在被稱為厄運之槌。這座遺跡城市分為三個部分，分別被不同的生物所佔據——包括幽靈般的高等精靈、邪惡的薩特和魯莽的巨魔部族。只有最勇敢的冒險隊伍才敢進入這個破碎的城市，並面對遠古地窖中的邪惡力量。"
Inst12Caption = "厄運之槌（西）"
Inst12QAA = "17 個任務"
Inst12QAH = "17 個任務"

--Quest 1 Alliance
Inst12Quest1 = "1. 精靈的傳說"
Inst12Quest1_Level = "60"
Inst12Quest1_Attain = "54"
Inst12Quest1_Aim = "到厄運之槌去尋找卡里爾．溫薩魯斯。向羽月要塞的學者盧索恩．紋角報告你所找到的資訊。"
Inst12Quest1_Location = "學者盧索恩．紋角（菲拉斯 - 羽月要塞; "..YELLOW.."31,43"..WHITE.."）"
Inst12Quest1_Note = "卡里爾．溫薩魯斯在（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest1_Prequest = "無"
Inst12Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst12Quest2 = "2. 伊莫塔爾的瘋狂"
Inst12Quest2_Level = "60"
Inst12Quest2_Attain = "56"
Inst12Quest2_Aim = "你必須幹掉5座水晶塔周圍的秘法守衛，那5座水晶塔維持著關押伊莫塔爾的監獄。一旦水晶塔的能量被削弱，伊莫塔爾周圍的能量力場就會消散。\n進入伊莫塔爾的監獄，幹掉站在中間的那個惡魔。最後，在圖書館挑戰托塞德林王子。當任務完成之後，到庭院中去找辛德拉古靈。"
Inst12Quest2_Location = "辛德拉古靈（厄運之槌; "..YELLOW.."西，（上層）[1]"..WHITE.."）"
Inst12Quest2_Note = "水晶塔被標記為"..BLUE.."[B]"..WHITE.."。伊莫塔爾在"..YELLOW.."[6]"..WHITE.."，托塞德林王子在"..YELLOW.."[7]"..WHITE.."。"
Inst12Quest2_Prequest = "無"
Inst12Quest2_Folgequest = "辛德拉的寶藏"
-- No Rewards for this quest

--Quest 3 Alliance
Inst12Quest3 = "3. 辛德拉的寶藏"
Inst12Quest3_Level = "60"
Inst12Quest3_Attain = "56"
Inst12Quest3_Aim = "返回圖書館去找到辛德拉的寶藏。拿取你的獎勵吧！"
Inst12Quest3_Location = "辛德拉古靈（厄運之槌; "..YELLOW.."西，（上層）[1]"..WHITE.."）"
Inst12Quest3_Note = "你可以在圖書館的梯子下面找到寶藏"..YELLOW.."[7]"..WHITE.."。"
Inst12Quest3_Prequest = "伊莫塔爾的瘋狂"
Inst12Quest3_Folgequest = "無"
Inst12Quest3FQuest = "true"
--
Inst12Quest3name1 = "莎草長靴"
Inst12Quest3name2 = "密林頭盔"
Inst12Quest3name3 = "裂骨者"

--Quest 4 Alliance
Inst12Quest4 = "4. 克索諾斯恐懼戰馬 (術士60級戰馬任務)"
Inst12Quest4_Level = "60"
Inst12Quest4_Attain = "60"
Inst12Quest4_Aim = "閱讀莫蘇爾的指南，並召喚出一匹克索諾斯恐懼戰馬，擊敗它，然後控制它的靈魂。"
Inst12Quest4_Location = "莫蘇爾（燃燒平原 - 風暴祭壇; "..YELLOW.."12,31"..WHITE.."）"
Inst12Quest4_Note = "術士的史詩戰馬任務的最後一步。首先你必須關閉位於厄運之槌西的5座水晶塔"..BLUE.."[B]"..WHITE.."並且殺掉伊莫塔爾"..YELLOW.."[6]"..WHITE.."。然後你可以進行戰馬之魂的召喚儀式。準備20個以上的靈魂碎片是必須的，因為你必須消耗碎片才能維持儀式中的法陣。殺死恐懼戰馬後，和馬的靈魂對話即可完成任務。"
Inst12Quest4_Prequest = "末日蠟燭（"..YELLOW.."通靈學院"..WHITE.."）"
Inst12Quest4_Folgequest = "無"
Inst12Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst12Quest5 = "5. 翡翠夢境…… (德魯伊飾品任務)"
Inst12Quest5_Level = "60"
Inst12Quest5_Attain = "54"
Inst12Quest5_Aim = "將這本典籍交給它的主人。"
Inst12Quest5_Location = "翡翠夢境（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest5_Note = "獎勵德魯伊的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest5_Prequest = "無"
Inst12Quest5_Folgequest = "無"
--
Inst12Quest5name1 = "埃德薩拉斯皇家徽印"

--Quest 6 Alliance
Inst12Quest6 = "6. 最偉大的獵手 (獵人飾品任務)"
Inst12Quest6_Level = "60"
Inst12Quest6_Attain = "54"
Inst12Quest6_Aim = "將這本典籍交給它的主人。"
Inst12Quest6_Location = "最偉大的獵手（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest6_Note = "獎勵獵人的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest6_Prequest = "無"
Inst12Quest6_Folgequest = "無"
--
Inst12Quest6name1 = "埃德薩拉斯皇家徽印"

--Quest 7 Alliance
Inst12Quest7 = "7. 秘法師的食譜 (法師飾品任務)"
Inst12Quest7_Level = "60"
Inst12Quest7_Attain = "54"
Inst12Quest7_Aim = "將這本典籍交給它的主人。"
Inst12Quest7_Location = "秘法師的食譜（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest7_Note = "獎勵法師的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest7_Prequest = "無"
Inst12Quest7_Folgequest = "無"
--
Inst12Quest7name1 = "埃德薩拉斯皇家徽印"

--Quest 8 Alliance
Inst12Quest8 = "8. 聖光之力 (聖騎士飾品任務)"
Inst12Quest8_Level = "60"
Inst12Quest8_Attain = "54"
Inst12Quest8_Aim = "將這本典籍交給它的主人。"
Inst12Quest8_Location = "聖光之力（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest8_Note = "獎勵聖騎士的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest8_Prequest = "無"
Inst12Quest8_Folgequest = "無"
--
Inst12Quest8name1 = "埃德薩拉斯皇家徽印"

--Quest 9 Alliance
Inst12Quest9 = "9. 光明不會告訴你的事情 (牧師飾品任務)"
Inst12Quest9_Level = "60"
Inst12Quest9_Attain = "54"
Inst12Quest9_Aim = "將這本典籍交給它的主人。"
Inst12Quest9_Location = "光明不會告訴你的事情（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest9_Note = "獎勵牧師的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest9_Prequest = "無"
Inst12Quest9_Folgequest = "無"
--
Inst12Quest9name1 = "埃德薩拉斯皇家徽印"

--Quest 10 Alliance
Inst12Quest10 = "10. 迦羅娜:潛行與詭計研究 (盜賊飾品任務)"
Inst12Quest10_Level = "60"
Inst12Quest10_Attain = "54"
Inst12Quest10_Aim = "將這本典籍交給它的主人。"
Inst12Quest10_Location = "迦羅娜：潛行與詭計研究（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest10_Note = "獎勵盜賊的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest10_Prequest = "無"
Inst12Quest10_Folgequest = "無"
--
Inst12Quest10name1 = "埃德薩拉斯皇家徽印"

--Quest 11 Alliance
Inst12Quest11 = "11. 你與冰霜震擊 (薩滿飾品任務)"
Inst12Quest11_Level = "60"
Inst12Quest11_Attain = "54"
Inst12Quest11_Aim = "將這本典籍交給它的主人。"
Inst12Quest11_Location = "你與冰霜震擊（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest11_Note = "獎勵薩滿的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest11_Prequest = "無"
Inst12Quest11_Folgequest = "無"
--
Inst12Quest11name1 = "埃德薩拉斯皇家徽印"

--Quest 12 Alliance
Inst12Quest12 = "12. 束縛之影 (術士飾品任務)"
Inst12Quest12_Level = "60"
Inst12Quest12_Attain = "54"
Inst12Quest12_Aim = "將這本典籍交給它的主人。"
Inst12Quest12_Location = "束縛之影（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest12_Note = "獎勵術士的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest12_Prequest = "無"
Inst12Quest12_Folgequest = "無"
--
Inst12Quest12name1 = "埃德薩拉斯皇家徽印"

--Quest 13 Alliance
Inst12Quest13 = "13. 防禦寶典 (戰士飾品任務)"
Inst12Quest13_Level = "60"
Inst12Quest13_Attain = "54"
Inst12Quest13_Aim = "將這本典籍交給它的主人。"
Inst12Quest13_Location = "防禦寶典（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest13_Note = "獎勵戰士的職業飾品。把書交給博學者基爾達斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest13_Prequest = "無"
Inst12Quest13_Folgequest = "無"
--
Inst12Quest13name1 = "埃德薩拉斯皇家徽印"

--Quest 14 Alliance
Inst12Quest14 = "14. 專注聖典"
Inst12Quest14_Level = "60"
Inst12Quest14_Attain = "54"
Inst12Quest14_Aim = "將[專注聖典]、1塊[原始黑鑽石]、4份[大塊魔光碎片]和2張[暗影之皮]交給厄運之槌的博學者萊德羅斯，以換取一份[專注秘藥]。"
Inst12Quest14_Location = "博學者萊德羅斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）"
Inst12Quest14_Note = "沒有前置任務，但是《精靈的傳說》任務必須完成後才能接到這個任務。\n\n專注聖典在厄運之槌隨機掉落，可以交易，應該可以在拍賣場找到它。暗影之皮是靈魂綁定的，從"..YELLOW.."通靈學院"..WHITE.."的血骨傀儡和復活的構造體及復活的骸骨守衛身上隨機掉落。"
Inst12Quest14_Prequest = "無"
Inst12Quest14_Folgequest = "無"
--
Inst12Quest14name1 = "專注秘藥"

--Quest 15 Alliance
Inst12Quest15 = "15. 防護聖典"
Inst12Quest15_Level = "60"
Inst12Quest15_Attain = "54"
Inst12Quest15_Aim = "將[防護聖典]、1塊[原始黑鑽石]、2份[大塊魔光碎片]和1份[磨損的憎惡縫合線]交給厄運之槌的博學者萊德羅斯，以換取一份[防護秘藥]。"
Inst12Quest15_Location = "博學者萊德羅斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）"
Inst12Quest15_Note = "沒有前置任務，但是《精靈的傳說》任務必須完成後才能接到這個任務。\n\n防護聖典在厄運之槌隨機掉落，可以交易，應該可以在拍賣場找到它。磨損的憎惡縫合線是靈魂綁定的，從"..YELLOW.."斯坦索姆"..WHITE.."的『暴食者』拉姆斯登、潑毒者、噴膽者和縫補憎惡身上隨機掉落。"
Inst12Quest15_Prequest = "無"
Inst12Quest15_Folgequest = "無"
--
Inst12Quest15name1 = "防護秘藥"

--Quest 16 Alliance
Inst12Quest16 = "16. 疾速聖典"
Inst12Quest16_Level = "60"
Inst12Quest16_Attain = "54"
Inst12Quest16_Aim = "將[疾速聖典]、1塊[原始黑鑽石]、2份[大塊魔光碎片]和2份[英雄之血]交給厄運之槌的博學者萊德羅斯，以換取一份疾速秘藥。"
Inst12Quest16_Location = "博學者萊德羅斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）"
Inst12Quest16_Note = "沒有前置任務，但是《精靈的傳說》任務必須完成後才能接到這個任務。\n\n疾速聖典在厄運之槌隨機掉落，可以交易，應該可以在拍賣場找到它。英雄之血是靈魂綁定的，可以隨機在西瘟疫之地與東瘟疫之地的地上找到。"
Inst12Quest16_Prequest = "無"
Inst12Quest16_Folgequest = "無"
--
Inst12Quest16name1 = "疾速秘藥"

--Quest 17 Alliance
Inst12Quest17 = "17. 弗洛爾的屠龍技術綱要 (戰士，聖騎士)"
Inst12Quest17_Level = "60"
Inst12Quest17_Attain = "60"
Inst12Quest17_Aim = "將《弗洛爾的屠龍技術綱要》還回圖書館。"
Inst12Quest17_Location = "弗洛爾的屠龍技術綱要（厄運之槌的所有幾個副本的王都可能掉落，拾取散落在副本地上的書本也有可能獲得）"
Inst12Quest17_Note = "著名防禦聖劍《奎爾塞拉》任務，只有戰士和聖騎士才能接此任務。把書交給博學者萊德羅斯（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。完成後開始奎爾塞拉任務。\n\n因為3.2.2的更新，你將再也不能進行這個任務線，除非你已經開始了這個任務線。"
Inst12Quest17_Prequest = "無"
Inst12Quest17_Folgequest = "鍛造奎爾塞拉"
-- No Rewards for this quest


--Quest 1 Horde
Inst12Quest1_HORDE = "1. 精靈的傳說"
Inst12Quest1_HORDE_Level = "60"
Inst12Quest1_HORDE_Attain = "54"
Inst12Quest1_HORDE_Aim = "到厄運之槌去尋找卡里爾．溫薩魯斯。向莫沙徹營地的先知科魯拉克報告你所找到的資訊。"
Inst12Quest1_HORDE_Location = "先知科魯拉克（菲拉斯 - 莫沙徹營地; "..YELLOW.."74,43"..WHITE.."）"
Inst12Quest1_HORDE_Note = "卡里爾．溫薩魯斯在（厄運之槌; "..YELLOW.."西，"..GREEN.."圖書館[1']"..WHITE.."）。"
Inst12Quest1_HORDE_Prequest = "無"
Inst12Quest1_HORDE_Folgequest = "無"
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

Inst13Story = "瑪拉頓被狂暴的瑪拉頓半人馬所保護，那裡是淒涼之地最神聖的地方之一。瑪拉頓是札爾塔的偉大神廟，而札爾塔則是半神塞納留斯不朽的兒子之一。傳說說札爾塔和瑟萊德絲大地元素公主的私生子，就是後來的半人馬種族祖先。據說半人馬這個野蠻的種族出生之後就將矛頭轉向他們的父親並將其殺死；有些人則相信瑟萊德絲公主在悲傷中將札爾塔的靈魂禁錮了起來，並將其藏在洞中——利用它的能量來達到一些不可告人的目的。在瑪拉頓錯綜複雜的地下通道中，到處都是邪惡的半人馬可汗之靈和瑟萊德絲的元素爪牙。"
Inst13Caption = "瑪拉頓"
Inst13QAA = "8 個任務"
Inst13QAH = "8 個任務"

--Quest 1 Alliance
Inst13Quest1 = "1. 裂影碎片"
Inst13Quest1_Level = "42"
Inst13Quest1_Attain = "39"
Inst13Quest1_Aim = "從瑪拉頓收集10塊暗影殘片，然後把它們交給塵泥沼澤塞拉摩島上的大法師特沃什。"
Inst13Quest1_Location = "大法師特沃什（塵泥沼澤 - 塞拉摩島; "..YELLOW.."66,49"..WHITE.."）"
Inst13Quest1_Note = "暗影殘片可以從「暗影碎片巡遊者」或者「暗影碎片擊碎者」身上找到。這些怪都在紫色入口出沒。"
Inst13Quest1_Prequest = "無"
Inst13Quest1_Folgequest = "無"
--
Inst13Quest1name1 = "狂熱裂影墜飾"
Inst13Quest1name2 = "巨型裂影墜飾"

--Quest 2 Alliance
Inst13Quest2 = "2. 維利塔恩的污染"
Inst13Quest2_Level = "47"
Inst13Quest2_Attain = "41"
Inst13Quest2_Aim = "在瑪拉頓裡用天藍水瓶在橙色水晶池中裝滿水。\n在維利斯塔姆藤蔓上使用裝滿水的天藍水瓶，使墮落的諾克賽恩幼體出現。\n治療8株植物並殺死那些諾克賽恩幼體，然後向尼耶爾前哨站的塔琳德莉亞覆命。"
Inst13Quest2_Location = "塔琳德莉亞（淒涼之地 - 尼耶爾前哨站; "..YELLOW.."68,8"..WHITE.."）"
Inst13Quest2_Note = "你可以在瑪拉頓裡任何一個橙色的水池裝水。藤蔓生長在橙色區域。"
Inst13Quest2_Prequest = "無"
Inst13Quest2_Folgequest = "無"
--
Inst13Quest2name1 = "樹種之環"
Inst13Quest2name2 = "山艾束腰"
Inst13Quest2name3 = "枝爪護手"

--Quest 3 Alliance
Inst13Quest3 = "3. 扭曲的邪惡"
Inst13Quest3_Level = "47"
Inst13Quest3_Attain = "41"
Inst13Quest3_Aim = "為淒涼之地的維洛收集25個瑟萊德絲水晶雕像。"
Inst13Quest3_Location = "維洛（淒涼之地 - 考米克小屋; "..YELLOW.."62,39"..WHITE.."）"
Inst13Quest3_Note = "瑪拉頓裡大多數的敵人都會掉落雕像。（高掉率）"
Inst13Quest3_Prequest = "無"
Inst13Quest3_Folgequest = "無"
--
Inst13Quest3name1 = "聰穎長袍"
Inst13Quest3name2 = "輕環頭盔"
Inst13Quest3name3 = "無情鏈甲"
Inst13Quest3name4 = "巨石肩鎧"

--Quest 4 Alliance
Inst13Quest4 = "4. 賤民的指引"
Inst13Quest4_Level = "48"
Inst13Quest4_Attain = "39"
Inst13Quest4_Aim = "閱讀賤民的指引，然後從瑪拉頓得到聯合墜飾，將其交給淒涼之地南部的半人馬賤民。"
Inst13Quest4_Location = "半人馬賤民（淒涼之地; "..YELLOW.."45,86"..WHITE.."）"
Inst13Quest4_Note = "5個可汗（詳閱《賤民的指引》的描述）"
Inst13Quest4_Page = {2, "你會在淒涼之地的南部找到半人馬賤民。他在 "..YELLOW.."44,85"..WHITE.." 和  "..YELLOW.."50,87"..WHITE.."  之間來回走動。\n首先，你必須在進入副本之前找到並殺死無名預言者拿取靈魂墜飾，（"..YELLOW.."副本入口地圖[A]"..WHITE.."）。你可以在進入副本之前找到它，就在你選擇進紫色入口還是橙色入口那裡。取得靈魂墜飾後，你還要使用靈魂墜飾分別激怒5個可汗並殺死他們。如果你選擇中間的路（既不是紫色入口也不是橙色入口），你會找到第一可汗（"..YELLOW.."副本入口地圖[1]"..WHITE.."）。第二可汗在瑪拉頓進入副本之前的紫色部分裡（"..YELLOW.."副本入口地圖[2]"..WHITE.."）。第三可汗在進入副本之前的橙色部分裡，往副本更遠的路上（"..YELLOW.."副本入口地圖[3]"..WHITE.."）。第四可汗在"..YELLOW.."[4]"..WHITE.."附近。第五可汗在"..YELLOW.."[1]"..WHITE.."附近。", };
Inst13Quest4_Prequest = "無"
Inst13Quest4_Folgequest = "無"
--
Inst13Quest4name1 = "天選印記"

--Quest 5 Alliance
Inst13Quest5 = "5. 瑪拉頓的傳說"
Inst13Quest5_Level = "49"
Inst13Quest5_Attain = "41"
Inst13Quest5_Aim = "找回塞雷布拉斯權杖的兩個部分：塞雷布拉斯魔棒和塞雷布拉斯鑽石。\n然後設法和塞雷布拉斯對話。"
Inst13Quest5_Location = "凱雯德拉（淒涼之地 - 瑪拉頓; "..YELLOW.."副本入口地圖[4]"..WHITE.."）"
Inst13Quest5_Note = "凱雯德拉就在進入副本之前的橙色部分的開始處。\n你可以從諾克塞恩"..YELLOW.."[2]"..WHITE.."那裡得到塞雷布拉斯魔棒，從維利塔恩"..YELLOW.."[5]"..WHITE.."那裡得到塞雷布拉斯鑽石。塞雷布拉斯在"..YELLOW.."[7]"..WHITE.."。你需要打敗他才能和他說話。"
Inst13Quest5_Prequest = "無"
Inst13Quest5_Folgequest = "塞雷布拉斯權杖"
-- No Rewards for this quest

--Quest 6 Alliance
Inst13Quest6 = "6. 塞雷布拉斯權杖"
Inst13Quest6_Level = "49"
Inst13Quest6_Attain = "41"
Inst13Quest6_Aim = "幫助贖罪的塞雷布拉斯製作塞雷布拉斯權杖。\n當儀式完成之後再和他談談。"
Inst13Quest6_Location = "贖罪的塞雷布拉斯（瑪拉頓 "..YELLOW.."[7]"..WHITE.."）"
Inst13Quest6_Note = "塞雷布拉斯製造節杖。當儀式完成之後，和他對話。"
Inst13Quest6_Prequest = "瑪拉頓的傳說"
Inst13Quest6_Folgequest = "無"
Inst13Quest6FQuest = "true"
--
Inst13Quest6name1 = "塞雷布拉斯權杖"

--Quest 7 Alliance
Inst13Quest7 = "7. 大地的污染"
Inst13Quest7_Level = "51"
Inst13Quest7_Attain = "45"
Inst13Quest7_Aim = "殺死瑟萊德絲公主，然後回到淒涼之地尼耶爾前哨站的守護者瑪蘭迪斯那裡覆命。"
Inst13Quest7_Location = "守護者瑪蘭迪斯（淒涼之地 - 尼耶爾前哨站; "..YELLOW.."63,10"..WHITE.."）"
Inst13Quest7_Note = "瑟萊德絲公主在"..YELLOW.."[11]"..WHITE.."。"
Inst13Quest7_Prequest = "無"
Inst13Quest7_Folgequest = "生命之種"
--
Inst13Quest7name1 = "痛擊之刃"
Inst13Quest7name2 = "甦醒之杖"
Inst13Quest7name3 = "綠色守護者之弓"

--Quest 8 Alliance
Inst13Quest8 = "8. 生命之種"
Inst13Quest8_Level = "51"
Inst13Quest8_Attain = "39"
Inst13Quest8_Aim = "到月光林地去找到雷姆洛斯，將生命之種交給他。"
Inst13Quest8_Location = "札爾塔的靈魂（瑪拉頓 "..YELLOW.."[11]"..WHITE.."）"
Inst13Quest8_Note = "殺死公主後，札爾塔的靈魂就會出現（"..YELLOW.."[11]"..WHITE.."）。\n守護者雷姆洛斯在（月光林地 - 雷姆洛斯神殿; "..YELLOW.."36,41"..WHITE.."）。"
Inst13Quest8_Prequest = "大地的污染"
Inst13Quest8_Folgequest = "無"
Inst13Quest8FQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst13Quest1_HORDE = "1. 裂影碎片"
Inst13Quest1_HORDE_Level = "42"
Inst13Quest1_HORDE_Attain = "39"
Inst13Quest1_HORDE_Aim = "從瑪拉頓收集10塊暗影殘片，然後把它們交給奧格瑪的尤塞爾奈。"
Inst13Quest1_HORDE_Location = "尤塞爾奈（奧格瑪 - 精神谷; "..YELLOW.."39,86"..WHITE.."）"
Inst13Quest1_HORDE_Note = "暗影殘片可以從「暗影碎片巡遊者」或者「暗影碎片擊碎者」身上找到。這些怪都在紫色入口出沒。"
Inst13Quest1_HORDE_Prequest = "無"
Inst13Quest1_HORDE_Folgequest = "無"
--
Inst13Quest1name1_HORDE = "狂熱暗影殘片墜飾"
Inst13Quest1name2_HORDE = "巨型暗影碎片墜飾"

--Quest 2 Horde
Inst13Quest2_HORDE = "2. 維利塔恩的污染"
Inst13Quest2_HORDE_Level = "47"
Inst13Quest2_HORDE_Attain = "41"
Inst13Quest2_HORDE_Aim = "在瑪拉頓裡用天藍水瓶在橙色水晶池中裝滿水。\n在維利斯塔姆藤蔓上使用裝滿水的天藍水瓶，使墮落的諾克賽恩幼體出現。\n治療8株植物並殺死那些諾克賽恩幼體，然後向葬影村的瓦克．戰痕覆命。"
Inst13Quest2_HORDE_Location = "瓦克．戰痕（淒涼之地 - 葬影村; "..YELLOW.."23,70"..WHITE.."）"
Inst13Quest2_HORDE_Note = "你可以在瑪拉頓裡任何一個橙色的水池裝水。藤蔓生長在橙色區域。"
Inst13Quest2_HORDE_Prequest = "無"
Inst13Quest2_HORDE_Folgequest = "無"
--
Inst13Quest2name1_HORDE = "樹種之環"
Inst13Quest2name2_HORDE = "山艾束腰 "
Inst13Quest2name3_HORDE = "枝爪護手"

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
Inst13Quest7_HORDE = "7. 大地的污染"
Inst13Quest7_HORDE_Level = "51"
Inst13Quest7_HORDE_Attain = "45"
Inst13Quest7_HORDE_Aim = "殺死瑟萊德絲公主，然後回到淒涼之地葬影村附近的瑟琳德拉那裡覆命。"
Inst13Quest7_HORDE_Location = "瑟琳德拉（淒涼之地 - 葬影村; "..YELLOW.."27,77"..WHITE.."）"
Inst13Quest7_HORDE_Note = "瑟萊德絲公主在"..YELLOW.."[11]"..WHITE.."。"
Inst13Quest7_HORDE_Prequest = "無"
Inst13Quest7_HORDE_Folgequest = "生命之種"
--
Inst13Quest7name1_HORDE = "痛擊之刃"
Inst13Quest7name2_HORDE = "甦醒之杖"
Inst13Quest7name3_HORDE = "綠色守護者之弓"

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

Inst14Story = "熔火之心就在黑石深淵的底層。這是黑石山的中心，也是很久以前扭轉矮人內戰情勢的地方，索瑞森大帝將元素火焰之王，拉格納羅斯召喚到世界來。盡管火焰之王無法遠離熔火之心，但人們相信他的元素爪牙控制著黑鐵矮人在遺跡之外組建軍隊。拉格納羅斯休眠的燃燒之湖有一道裂縫連接火平面，讓邪惡的元素可以通過。拉格納羅斯的首要代理人是管理者埃克索圖斯–因為這是唯一能喚醒火焰之王的狡猾元素。"
Inst14Caption = "熔火之心"
Inst14QAA = "6 個任務"
Inst14QAH = "6 個任務"

--Quest 1 Alliance
Inst14Quest1 = "1. 熔火之心"
Inst14Quest1_Level = "60"
Inst14Quest1_Attain = "58"
Inst14Quest1_Aim = "殺死一個火焰之王、一個熔岩巨人、一個上古熔火惡犬和一個熔岩奔騰者，然後回到艾薩拉的海達克西斯公爵那裡。"
Inst14Quest1_Location = "海達克西斯公爵（艾薩拉; "..YELLOW.."79,73"..WHITE.."）"
Inst14Quest1_Note = "任務怪在團隊行進中即可完成擊殺。在3.0.8版本之後你將不再需要進行這條任務線了，如果你已經擁有這個任務了，你仍然可以完成它。"
Inst14Quest1_Prequest = "艾博希爾之眼（"..YELLOW.."黑石塔上層"..WHITE.."）"
Inst14Quest1_Folgequest = "海達克西斯的使者"
Inst14Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst14Quest2 = "2. 敵人之手"
Inst14Quest2_Level = "60"
Inst14Quest2_Attain = "55"
Inst14Quest2_Aim = "將魯西弗隆之手、薩弗隆之手、基赫納斯之手和沙斯拉爾之手交給艾薩拉的海達克西斯公爵。"
Inst14Quest2_Location = "海達克西斯公爵（艾薩拉; "..YELLOW.."79,73"..WHITE.."）"
Inst14Quest2_Note = "魯西弗隆在"..YELLOW.."[1]"..WHITE.."，基赫納斯在"..YELLOW.."[3]"..WHITE.."，沙斯拉爾在"..YELLOW.."[5]"..WHITE.."，薩弗隆先驅者在"..YELLOW.."[8]"..WHITE.."。\n獎勵由後續任務「英雄的獎賞」領取。在3.0.8版本之後你將不再需要進行這條任務線了，如果你已經擁有這個任務了，你仍然可以完成它。"
Inst14Quest2_Prequest = "艾博希爾之眼→熔火之心→海達克西斯的使者"
Inst14Quest2_Folgequest = "無"
Inst14Quest2FQuest = "true"
--
Inst14Quest2name1 = "海洋之風"
Inst14Quest2name2 = "潮汐戒環"

--Quest 3 Alliance
Inst14Quest3 = "3. 逐風者桑德蘭"
Inst14Quest3_Level = "60"
Inst14Quest3_Attain = "60"
Inst14Quest3_Aim = "如果你想要把逐風者桑德蘭從監牢裡釋放出來，你就必須找到左右兩塊[逐風者禁錮之顱]，10塊[源質錠]，以及[炎魔的精華]，把它們交給位於希利蘇斯的大領主德米提恩。"
Inst14Quest3_Location = "大領主德米提恩（希利蘇斯 - 水晶谷; "..YELLOW.."22,9"..WHITE.."）"
Inst14Quest3_Note = "雷霆之怒，逐風者的祝福之刃任務線的一部分，當你從加爾"..YELLOW.."[4]"..WHITE.."或迦頓男爵"..YELLOW.."[6]"..WHITE.."處拿到[逐風者禁錮之顱]的左半或右半後，與大領主德米提恩對話以開始這個任務線。[炎魔的精華]掉落自拉格納羅斯"..YELLOW.."[10]"..WHITE.."。完成這個部分並回報任務之後，桑德蘭王子會被召喚出來，你必須殺了他。他是屬於40人團隊的首領。"
Inst14Quest3_Prequest = "複生之瓶"
Inst14Quest3_Folgequest = "覺醒吧，雷霆之怒！"
Inst14Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst14Quest4 = "4. 一份必須遵守的契約"
Inst14Quest4_Level = "60"
Inst14Quest4_Attain = "60"
Inst14Quest4_Aim = "如果你願意接受薩弗隆的設計圖，請將瑟銀兄弟會契約交給羅克圖斯．暗契。"
Inst14Quest4_Location = "羅克圖斯．暗契（黑石深淵 - 黑鐵酒吧; "..YELLOW.."[15]"..WHITE.."）"
Inst14Quest4_Note = "你需要一個[薩弗隆鐵錠]來與羅克圖斯．暗契換取一份瑟銀兄弟會契約。[薩弗隆鐵錠]掉落自焚化者古雷曼格"..YELLOW.."[7]"..WHITE.."。"
Inst14Quest4_Prequest = "無"
Inst14Quest4_Folgequest = "無"
--
Inst14Quest4name1 = "設計圖：薩弗隆之錘"

--Quest 5 Alliance
Inst14Quest5 = "5. 遠古石葉"
Inst14Quest5_Level = "60"
Inst14Quest5_Attain = "60"
Inst14Quest5_Aim = "找到遠古石葉的主人。"
Inst14Quest5_Location = "在（火焰之王的寶箱; "..YELLOW.."[9]"..WHITE.."）之中，可能有遠古石葉。"
Inst14Quest5_Note = "把遠古石葉交還給古樹瓦特魯斯（費伍德森林 - 鐵木森林; "..YELLOW.."49,24"..WHITE.."）。"
Inst14Quest5_Prequest = "無"
Inst14Quest5_Folgequest = "龍筋箭袋（"..YELLOW.."艾索雷葛斯"..WHITE.."）"
-- No Rewards for this quest

--Quest 6 Alliance
Inst14Quest6 = "6. 水晶球護目鏡?沒問題!"
Inst14Quest6_Level = "60"
Inst14Quest6_Attain = "60"
Inst14Quest6_Aim = "去熔火之心探險並找回那些護目鏡！當你取回護目鏡後再回到塔納利斯的納里安．柔想那裡。"
Inst14Quest6_Location = "不起眼的木箱（銀松森林 - 格雷邁恩之牆; "..YELLOW.."46.2, 86.6"..WHITE.."）"
Inst14Quest6_Note = "此任務為開啟安其拉之門事件任務線，必須先將「諾茲多姆的子嗣」聲望提升到中立後，再到時光洞穴找安納克羅斯接受後續任務。解完他所給予的任務後，到艾薩拉將藍龍艾索雷葛斯支線任務完成，這樣就可以在格雷邁恩之牆接到這個任務了。在遊戲3.0.2版本中，護目鏡修改為由熔火之心的任何怪物掉落。任務交還給納里安．柔想（塔納利斯; "..YELLOW.."65.3, 18.6"..WHITE.."），前置任務亦由納里安．柔想給予。"
Inst14Quest6_Prequest = "斯圖沃爾，曾經最好的朋友"
Inst14Quest6_Folgequest = "無"
Inst14Quest6PreQuest = "true"
--
Inst14Quest6name1 = "極效活力藥水"


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
Inst14Quest6PreQuest_HORDE = Inst14Quest6PreQuest
--
Inst14Quest6name1_HORDE = Inst14Quest6name1



--------------- INST15 - Old Naxxramas ---------------

-- Old Naxxramas (Before Wrath of the Lich King)
-- Now using Inst84 for the new one.



--------------- INST16 - Onyxia's Lair (Ony) ---------------

Inst16Story = "奧妮克希亞是強大之龍死亡之翼的女兒，也是黑石塔擅陰謀的黑龍之王奈法利安的妹妹。據說奧妮克希亞喜歡藉由干涉人類種族的政治來腐化他們。為達此目的她會變成各種人型生物形態，使用魔法和力量干預不同種族間的所有事情。有些人更認為奧妮克希亞使用父親曾用過的化名 - 皇室普瑞斯托。若不插手凡人事務的時候，奧妮克希亞就在黑龍谷下的一處火焰洞穴居住，那是塵泥沼澤裡的一個陰暗沼澤。陰險的黑龍軍團剩餘成員在此守護著她。"
Inst16Caption = "奧妮克希亞的巢穴"
Inst16QAA = "3 個任務"
Inst16QAH = "3 個任務"

--Quest 1 Alliance
Inst16Quest1 = "1. 鑄造奎爾塞拉"
Inst16Quest1_Level = "60"
Inst16Quest1_Attain = "60"
Inst16Quest1_Aim = "你必須設法讓奧妮克希亞對這把未淬火的上古之刃噴射火焰。完成之後，撿起加熱過的上古之刃。你要注意的是，加熱過的上古之刃不會一直保持被加熱的狀態，時間非常緊迫。"
Inst16Quest1_Location = "博學者萊德羅斯（厄運之槌; "..YELLOW.."北，"..GREEN.."圖書館[1']"..WHITE..")"
Inst16Quest1_Note = "當奧妮克西亞的血量達到10%至15%的時候，將未淬火的上古之刃插在她的前面，她的火焰氣息會為這把劍淬火，當奧妮克西亞死掉之後，將加熱過的上古之刃插入她的屍體中，這樣就可以完成它最後的鑄造儀式。\n\n因為3.2.2的更新，你將再也不能進行這個任務線，除非你已經開始了這個任務線。"
Inst16Quest1_Prequest = "弗洛爾的屠龍技術綱要（厄運之槌; "..YELLOW..""..WHITE.."）→鑄造奎爾塞拉"
Inst16Quest1_Folgequest = "無"
Inst16Quest1PreQuest = "true"
--
Inst16Quest1name1 = "奎爾塞拉"

--Quest 2 Alliance
Inst16Quest2 = "2. 聯盟的勝利"
Inst16Quest2_Level = "60"
Inst16Quest2_Attain = "60"
Inst16Quest2_Aim = "將奧妮克希亞的頭顱交給暴風城的瓦里安．烏瑞恩國王。"
Inst16Quest2_Location = "奧妮克希亞的頭顱（奧妮克希亞掉落 - 奧妮克希亞的巢穴; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest2_Note = "瓦里安．烏瑞恩國王在（暴風城 - 暴風要塞; "..YELLOW.."80,38"..WHITE.."）。\n團隊裡面只有一個人可以拾取這樣物品，而且此任務只能完成一次。\n\n任務獎勵於後續任務領取。\n\n在3.2.2版本之後，奧妮克希亞的巢穴將變成一個80級團隊地城，而觸發任務[聯盟的勝利]所需的[奧妮克希亞的頭顱]將不再掉落。"
Inst16Quest2_Prequest = "無"
Inst16Quest2_Folgequest = "英雄慶典"
--
Inst16Quest2name1 = "奧妮克希亞龍血護符"
Inst16Quest2name2 = "屠龍者的徽記"
Inst16Quest2name3 = "奧妮克希亞龍牙墜飾"

--Quest 3 Alliance
Inst16Quest3 = "3. 難以置信的挑戰"
Inst16Quest3_Level = "80"
Inst16Quest3_Attain = "80"
Inst16Quest3_Aim = "將奧妮克希亞的頭顱交給已宰的羔羊地下室裡的『黑爪』加爾德斯。"
Inst16Quest3_Location = "奧妮克希亞的頭顱（奧妮克希亞掉落 - 奧妮克希亞的巢穴; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest3_Note = "『黑爪』加爾德斯在（暴風城 - 已宰的羔羊; "..YELLOW.."40.1, 85.1"..WHITE.."）。\n團隊裡面只有一個人可以拾取這樣物品，而且此任務只能完成一次。"
Inst16Quest3_Prequest = "無"
Inst16Quest3_Folgequest = "無"
--
Inst16Quest3name1 = "拋光屠龍者的徽記"
Inst16Quest3name2 = "閃亮奧妮克希亞龍牙墜飾"
Inst16Quest3name3 = "純淨奧妮克希亞龍血咒符"


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
Inst16Quest2_HORDE = "2. 部落的勝利"
Inst16Quest2_HORDE_Level = "60"
Inst16Quest2_HORDE_Attain = "60"
Inst16Quest2_HORDE_Aim = "將奧妮克希亞的頭顱交給奧格瑪的索爾。 "
Inst16Quest2_HORDE_Location = "奧妮克希亞的頭顱（奧妮克希亞掉落 - 奧妮克希亞的巢穴; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest2_HORDE_Note = "索爾在（奧格瑪 - 智慧谷; "..YELLOW.."31,37"..WHITE.."）。\n團隊裡面只有一個人可以拾取這樣物品，而且此任務只能完成一次。\n\n任務獎勵於後續任務領取。\n\n在3.2.2版本之後，奧妮克希亞的巢穴將變成一個80級團隊地城，而觸發任務[部落的勝利]所需的[奧妮克希亞的頭顱]將不再掉落。"
Inst16Quest2_HORDE_Prequest = "無"
Inst16Quest2_HORDE_Folgequest = "萬眾景仰"
--
Inst16Quest2name1_HORDE = "奧妮克希亞龍血護符"
Inst16Quest2name2_HORDE = "屠龍者的徽記"
Inst16Quest2name3_HORDE = "奧妮克希亞龍牙墜飾"

--Quest 3 Horde
Inst16Quest3_HORDE = "3. 難以置信的挑戰"
Inst16Quest3_HORDE_Level = "80"
Inst16Quest3_HORDE_Attain = "80"
Inst16Quest3_HORDE_Aim = "將奧妮克希亞的頭顱交給暗影裂口的尼爾魯．火刃。"
Inst16Quest3_HORDE_Location = "奧妮克希亞的頭顱（奧妮克希亞掉落 - 奧妮克希亞的巢穴; "..YELLOW.."[3]"..WHITE.."）"
Inst16Quest3_HORDE_Note = "尼爾魯．火刃在（奧格瑪 - 暗影裂口; "..YELLOW.."49.7, 50.5"..WHITE.."）。\n團隊裡面只有一個人可以拾取這樣物品，而且此任務只能完成一次。"
Inst16Quest3_HORDE_Prequest = "無"
Inst16Quest3_HORDE_Folgequest = "無"
--
Inst16Quest3name1_HORDE = "拋光屠龍者的徽記"
Inst16Quest3name2_HORDE = "閃亮奧妮克希亞龍牙墜飾"
Inst16Quest3name3_HORDE = "純淨奧妮克希亞龍血咒符"



--------------- INST17 - Razorfen Downs (RFD) ---------------

Inst17Story = "剃刀高地和剃刀沼澤一樣由巨大的藤蔓組成，剃刀高地是野豬人的傳統都城。在那錯綜複雜的荊棘迷宮中，居住著大群忠誠的野豬人軍隊以及他們的高等牧師群——亡首部族。然而最近，一股陰影力量籠罩了這個原始的洞穴。天譴軍團的人在巫妖寒冰之王亞門納爾的帶領下控制了野豬部族，並將荊棘迷宮變成了天譴軍團的堡壘。現在野豬人正奮力戰鬥來重新奪回他們的城市，並阻止亞門納爾繼續控制貧瘠之地。"
Inst17Caption = "剃刀高地"
Inst17QAA = "3 個任務"
Inst17QAH = "4 個任務"

--Quest 1 Alliance
Inst17Quest1 = "1. 邪惡之地"
Inst17Quest1_Level = "35"
Inst17Quest1_Attain = "28"
Inst17Quest1_Aim = "殺掉8個剃刀沼澤護衛者、8個剃刀沼澤織棘者和8個亡首教徒，然後向剃刀高地入口處的麥雷姆．月歌覆命。"
Inst17Quest1_Location = "麥雷姆．月歌（貧瘠之地 - 剃刀高地; "..YELLOW.."49,94 "..WHITE.."）"
Inst17Quest1_Note = "剃刀沼澤護衛者、剃刀沼澤織棘者和亡首教徒都是在進入副本之前外面出現的怪物。"
Inst17Quest1_Prequest = "無"
Inst17Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst17Quest2 = "2. 封印神像"
Inst17Quest2_Level = "37"
Inst17Quest2_Attain = "32"
Inst17Quest2_Aim = "保護貝尼斯特拉茲來到剃刀高地的野豬人神像處。\n當他在進行儀式封印神像時保護他。"
Inst17Quest2_Location = "貝尼斯特拉茲（剃刀高地; "..YELLOW.."[2] "..WHITE.."）"
Inst17Quest2_Note = "你必須同意幫助奔尼斯特拉茲封印神像，封印過程中會有好幾波怪物衝出來攻擊他，必須保證他的安全。完成後在神像面前獲得獎勵。"
Inst17Quest2_Prequest = "剃刀高地的天譴軍團"
Inst17Quest2_Folgequest = "無"
Inst17Quest2PreQuest = "true"
--
Inst17Quest2name1 = "龍爪戒指"

--Quest 3 Alliance
Inst17Quest3 = "3. 與聖光同在"
Inst17Quest3_Level = "37"
Inst17Quest3_Attain = "32"
Inst17Quest3_Aim = "大主教本尼迪塔斯要你去殺死剃刀高地的寒冰之王亞門納爾。"
Inst17Quest3_Location = "大主教本尼迪塔斯（暴風城 - 光明大教堂; "..YELLOW.."39,27 "..WHITE.."）"
Inst17Quest3_Note = "寒冰之王亞門納爾是剃刀高地的最後一個王。你可以在"..YELLOW.."[6]"..WHITE.."找到他。"
Inst17Quest3_Prequest = "無"
Inst17Quest3_Folgequest = "無"
--
Inst17Quest3name1 = "征服者之劍"
Inst17Quest3name2 = "琥珀之光"


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
Inst17Quest2_HORDE = "2. 邪惡的盟友"
Inst17Quest2_HORDE_Level = "36"
Inst17Quest2_HORDE_Attain = "28"
Inst17Quest2_HORDE_Aim = "把瑪克林大使的頭顱帶給幽暗城的瓦里瑪薩斯。"
Inst17Quest2_HORDE_Location = "瓦里瑪薩斯（幽暗城 - 皇家區; "..YELLOW.."56,92 "..WHITE.."）"
Inst17Quest2_HORDE_Note = "剃刀沼澤最後的王給的後續任務。\n瑪克林大使位置在進入副本前外面的空地上（貧瘠之地 - 剃刀高地; "..YELLOW.."48,92"..WHITE.."）。"
Inst17Quest2_HORDE_Prequest = "邪惡的盟友"
Inst17Quest2_HORDE_Folgequest = "無"
Inst17Quest2PreQuest_HORDE = "true"
--
Inst17Quest2name1_HORDE = "破顱者"
Inst17Quest2name2_HORDE = "釘槍"
Inst17Quest2name3_HORDE = "狂熱長袍"

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst17Quest3_HORDE = "3. 封印神像"
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
Inst17Quest4_HORDE = "4. 寒冰之王"
Inst17Quest4_HORDE_Level = "42"
Inst17Quest4_HORDE_Attain = "37"
Inst17Quest4_HORDE_Aim = "安德魯．布隆奈爾要你殺了寒冰之王亞門納爾並將其頭骨帶回來。"
Inst17Quest4_HORDE_Location = "安德魯．布隆奈爾（幽暗城 - 魔法區; "..YELLOW.."72,32 "..WHITE.."）"
Inst17Quest4_HORDE_Note = "寒冰之王亞門納爾是剃刀高地最後一個王。位於"..YELLOW.."[6]"..WHITE.."。"
Inst17Quest4_HORDE_Prequest = "無"
Inst17Quest4_HORDE_Folgequest = "無"
--
Inst17Quest4name1_HORDE = "征服者之劍"
Inst17Quest4name2_HORDE = "琥珀之光"



--------------- INST18 - Razorfen Kraul (RFK) ---------------

Inst18Story = "在一萬年前的古代戰爭中，萬能的半神阿迦瑪甘和燃燒軍團進行了激戰。雖然這頭龐大無匹的豬在戰鬥中倒下了，但是祂的努力最終拯救了艾澤拉斯大陸免遭塗炭。經過久遠的年代之後，在祂血液流淌的地方長出了巨大的荊棘藤蔓，而那些被認為是半神後代的野豬人占領了這些地區並將其奉為聖地。這些荊棘地的中心被稱為剃刀嶺。而巨大的剃刀沼澤則被一個老太婆卡爾加．刺肋所佔據。在她的統治之下，信奉薩滿教的野豬人和別的部族以及整個部落勢力為敵。有些人甚至猜測卡爾加還和天譴軍團有來往——她想要聯合天譴軍團來達到一些不可告人的險惡目的。"
Inst18Caption = "剃刀沼澤"
Inst18QAA = "5 個任務"
Inst18QAH = "5 個任務"

--Quest 1 Alliance
Inst18Quest1 = "1. 藍葉薯"
Inst18Quest1_Level = "26"
Inst18Quest1_Attain = "20"
Inst18Quest1_Aim = "找到一個開孔的箱子。\n找到一根地鼠指揮棒。\n找到並閱讀《地鼠指揮手冊》。\n在剃刀沼澤里用開孔的箱子召喚一隻地鼠，然後用指揮棒驅使牠去搜尋藍葉薯。\n任務完成後把地鼠指揮棒、開孔的箱子和10塊藍葉薯交給棘齒城的麥伯克．米希瑞克斯。"
Inst18Quest1_Location = "麥伯克．米希瑞克斯（貧瘠之地 - 棘齒城; "..YELLOW.."62,37"..WHITE.."）"
Inst18Quest1_Note = "開孔的箱子，地鼠指揮棒和《地鼠指揮手冊》都在麥伯克．米希瑞克斯旁邊。"
Inst18Quest1_Prequest = "無"
Inst18Quest1_Folgequest = "無"
--
Inst18Quest1name1 = "一小袋寶石"

--Quest 2 Alliance
Inst18Quest2 = "2. 臨終遺言"
Inst18Quest2_Level = "30"
Inst18Quest2_Attain = "25"
Inst18Quest2_Aim = "將塔莎拉的墜飾帶給達納蘇斯的塔莎拉．靜水。"
Inst18Quest2_Location = "赫爾拉斯．靜水（剃刀沼澤; "..YELLOW.." [8]"..WHITE.."）"
Inst18Quest2_Note = "墜飾由地城中的小怪隨機掉落。你必須把墜飾帶給達納蘇斯的塔莎拉．靜水（達納蘇斯 - 貿易區; "..YELLOW.."69,67"..WHITE.."）。"
Inst18Quest2_Prequest = "無"
Inst18Quest2_Folgequest = "無"
--
Inst18Quest2name1 = "悲傷披巾"
Inst18Quest2name2 = "槍騎兵長靴"

--Quest 3 Alliance
Inst18Quest3 = "3. 進口商威利克斯"
Inst18Quest3_Level = "30"
Inst18Quest3_Attain = "22"
Inst18Quest3_Aim = "護送進口商威利克斯逃出剃刀沼澤。"
Inst18Quest3_Location = "進口商威利克斯（剃刀沼澤; "..YELLOW.." [8]"..WHITE.."）"
Inst18Quest3_Note = "你必須把威利克斯護送到入口處。完成後向他領取獎勵。"
Inst18Quest3_Prequest = "無"
Inst18Quest3_Folgequest = "無"
--
Inst18Quest3name1 = "猴子戒指"
Inst18Quest3name2 = "蛇環"
Inst18Quest3name3 = "猛虎指環"

--Quest 4 Alliance
Inst18Quest4 = "4. 剃刀沼澤的乾癟老太婆"
Inst18Quest4_Level = "27"
Inst18Quest4_Attain = "23"
Inst18Quest4_Aim = "把卡爾加．刺肋的徽章交給薩蘭納爾的法芬德爾。"
Inst18Quest4_Location = "法芬德爾（菲拉斯 - 薩蘭納爾; "..YELLOW.."89,46"..WHITE.."）"
Inst18Quest4_Note = "卡爾加．刺肋"..YELLOW.."[7]"..WHITE.."掉落徽章。"
Inst18Quest4_Prequest = "亨里格的日記"
Inst18Quest4_Folgequest = "無"
Inst18Quest4PreQuest = "true"
--
Inst18Quest4name1 = "法芬德爾的獵槍"
Inst18Quest4name2 = "綠寶石肩墊"
Inst18Quest4name3 = "岩拳束腰"
Inst18Quest4name4 = "石飾圓盾"

--Quest 5 Alliance
Inst18Quest5 = "5. 淬火鎖甲 (戰士職業任務)"
Inst18Quest5_Level = "28"
Inst18Quest5_Attain = "20"
Inst18Quest5_Aim = "收集必需的材料，將它們交給暴風城的弗倫．長鬚。"
Inst18Quest5_Location = "弗倫．長鬚（暴風城 - 矮人區; "..YELLOW.."64,37"..WHITE.."）"
Inst18Quest5_Note = "只有戰士才能接到這個任務！\n你可以從魯古格"..YELLOW.."[1]"..WHITE.."得到[燃素]。\n\n濕地的蜘蛛掉落[燒焦的蜘蛛牙]，石爪山脈的小奇美拉與奇美拉幼獸掉落[燒焦的奇美拉角]、奇美拉族母掉落[光滑的奇美拉角]。"
Inst18Quest5_Prequest = "鑄盾師"
Inst18Quest5_Folgequest = "無"
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
Inst18Quest2_HORDE = "2. 進口商威利克斯"
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
Inst18Quest3_HORDE = "3. 蝙蝠的糞便"
Inst18Quest3_HORDE_Level = "26"
Inst18Quest3_HORDE_Attain = "22"
Inst18Quest3_HORDE_Aim = "幫幽暗城的大藥劑師法拉尼爾帶回一堆沼澤蝙蝠的糞便。"
Inst18Quest3_HORDE_Location = "法拉尼爾（幽暗城 - 煉金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst18Quest3_HORDE_Note = "任何蝙蝠都會掉落沼澤蝙蝠的糞便。"
Inst18Quest3_HORDE_Prequest = "無"
Inst18Quest3_HORDE_Folgequest = "狂熱之心（"..YELLOW.."[剃刀高地]"..WHITE.."）"
-- No Rewards for this quest

--Quest 4 Horde
Inst18Quest4_HORDE = "4. 奧爾德的報復"
Inst18Quest4_HORDE_Level = "27"
Inst18Quest4_HORDE_Attain = "23"
Inst18Quest4_HORDE_Aim = "把卡爾加．刺肋的心臟交給雷霆崖的奧爾德．石塔。"
Inst18Quest4_HORDE_Location = "奧爾德．石塔（雷霆崖; "..YELLOW.."36,59 "..WHITE.."）"
Inst18Quest4_HORDE_Note = "卡爾加．刺肋在"..YELLOW.."[7]"..WHITE.."。"
Inst18Quest4_HORDE_Prequest = "無"
Inst18Quest4_HORDE_Folgequest = "無"
--
Inst18Quest4name1_HORDE = "綠寶石護肩"
Inst18Quest4name2_HORDE = "石拳束帶"
Inst18Quest4name3_HORDE = "石飾圓盾"

--Quest 5 Horde
Inst18Quest5_HORDE = "5. 野蠻護甲 (戰士職業任務)"
Inst18Quest5_HORDE_Level = "30"
Inst18Quest5_HORDE_Attain = "20"
Inst18Quest5_HORDE_Aim = "為索恩格瑞姆收集15根[煙霧鐵錠]、10份[藍銅粉]、10塊[鐵錠]和1瓶[燃素]。"
Inst18Quest5_HORDE_Location = "索恩格瑞姆．火眼（貧瘠之地; "..YELLOW.."57,30 "..WHITE.."）"
Inst18Quest5_HORDE_Note = "只有戰士才能接到這個任務！\n你可以從魯古格"..YELLOW.."[1]"..WHITE.."得到燃素。\n\n完成這個任務後他會給你一個新的任務。"
Inst18Quest5_HORDE_Prequest = "和索恩格瑞姆交談"
Inst18Quest5_HORDE_Folgequest = "（請見註釋）"
Inst18Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST19 - SM: Library (SM Lib) ---------------

Inst19Story = "血色修道院曾經是羅德隆王國牧師的榮耀之地——那裡是學習聖光只是和膜拜的中心。隨著在第三次大戰中天譴軍團的崛起，寧靜的修道院成為了瘋狂的血色十字軍的要塞。十字軍對於所有非人類都有著偏激的態度，無論他們是自己的盟友還是對手。他們相信所有任何外來者都帶著亡靈的瘟疫——他們必須被摧毀。有報告說所有進入修道院的冒險者都要面對血色十字軍指揮官莫格萊尼——他控制了一群狂熱的十字軍戰士。然而，修道院的真正主人是大檢察官懷特邁恩——一個瘋狂的牧師，她具有復活死去的戰士來為其效勞的能力。"
Inst19Caption = "血色修道院（圖書館）"
Inst19QAA = "3 個任務"
Inst19QAH = "5 個任務"

--Quest 1 Alliance
Inst19Quest1 = "1. 泰坦神話"
Inst19Quest1_Level = "38"
Inst19Quest1_Attain = "28"
Inst19Quest1_Aim = "從修道院拿回《泰坦神話》，把它交給鐵爐堡的圖書館員麥伊．蒼塵。"
Inst19Quest1_Location = "圖書館員麥伊．蒼塵（鐵爐堡 - 探險者大廳; "..YELLOW.."74,12 "..WHITE.."）"
Inst19Quest1_Note = "你可以在血色修道院的圖書館秘法師杜安之前左側一個走廊的地板上（"..YELLOW.."[2]"..WHITE.."）找到這本書。"
Inst19Quest1_Prequest = "無"
Inst19Quest1_Folgequest = "無"
--
Inst19Quest1name1 = "探險者協會的獎狀"

--Quest 2 Alliance
Inst19Quest2 = "2. 能量儀式 (法師職業任務)"
Inst19Quest2_Level = "40"
Inst19Quest2_Attain = "30"
Inst19Quest2_Aim = "將《能量儀祭》交給塵泥沼澤的塔貝薩。"
Inst19Quest2_Location = "塔貝薩（塵泥沼澤 - 塔貝薩的農場; "..YELLOW.."43,57"..WHITE.."）"
Inst19Quest2_Note = "只有法師玩家能夠接到這個任務！\n你可以在血色修道院的圖書館秘法師杜安之前一個書架上（"..YELLOW.."[2]"..WHITE.."）找到這本書。任務獎勵由後續任務「法師的魔杖」提供。"
Inst19Quest2_Prequest = "沼澤之旅→解封咒語"
Inst19Quest2_Folgequest = "法師的魔杖"
Inst19Quest2PreQuest = "true"
--
Inst19Quest2name1 = "冰怒魔杖"
Inst19Quest2name2 = "虛空靈力魔杖"
Inst19Quest2name3 = "怒火魔杖"

--Quest 3 Alliance
Inst19Quest3 = "3. 以聖光之名"
Inst19Quest3_Level = "40"
Inst19Quest3_Attain = "34"
Inst19Quest3_Aim = "殺死大檢察官懷特邁恩，血色十字軍指揮官莫格萊尼，十字軍的勇士赫洛德和馴犬者洛克希並向南海鎮的萊雷恩覆命。"
Inst19Quest3_Location =  "虔誠的萊雷恩（希爾斯布萊德丘陵 - 南海鎮; "..YELLOW.."51,58 "..WHITE.."）"
Inst19Quest3_Note ="此系列任務始於克羅雷修士（暴風城 - 光明大教堂; "..YELLOW.."52,43"..WHITE.."）。\n大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst19Quest3_Prequest = "安東修士→血色之路（任務領取地點在淒涼之地前哨站，任務要殺的骷髏兵在地圖底部中間偏右的一個山谷裡面）"
Inst19Quest3_Folgequest = "無"
Inst19Quest3PreQuest = "true"
--
Inst19Quest3name1 = "平靜之劍"
Inst19Quest3name2 = "咬骨之斧"
Inst19Quest3name3 = "黑暗威脅"
Inst19Quest3name4 = "洛瑞卡寶珠"


--Quest 1 Horde
Inst19Quest1_HORDE = "1. 狂熱之心"
Inst19Quest1_HORDE_Level = "33"
Inst19Quest1_HORDE_Attain = "30"
Inst19Quest1_HORDE_Aim = "幽暗城的大藥劑師法拉尼爾需要20顆狂熱之心。"
Inst19Quest1_HORDE_Location = "大藥劑師法拉尼爾（幽暗城 - 煉金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst19Quest1_HORDE_Note = "血色修道院中的所有怪物均會掉落狂熱之心，包括了地城入口外的非精英怪物。"
Inst19Quest1_HORDE_Prequest = "蝙蝠的糞便（"..YELLOW.."[剃刀沼澤]"..WHITE.."）"
Inst19Quest1_HORDE_Folgequest = "無"
Inst19Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst19Quest2_HORDE = "2. 知識試煉 (系列任務)"
Inst19Quest2_HORDE_Level = "36"
Inst19Quest2_HORDE_Attain = "25"
Inst19Quest2_HORDE_Aim = "找到《不死生物的起源》，把它交給幽暗城的帕科瓦．芬塔拉斯。"
Inst19Quest2_HORDE_Location = "帕科瓦．芬塔拉斯（幽暗城 - 煉金房; "..YELLOW.."57,65 "..WHITE.."）"
Inst19Quest2_HORDE_Note = "此系列任務始於多恩．平原行者（千針石林; "..YELLOW.."53,41"..WHITE.."）。\n書在血色修道院圖書館裡，任務獎勵由後續任務「最後的旅程」提供。"
Inst19Quest2_HORDE_Prequest = "信仰試煉→耐力試煉→力量試煉"
Inst19Quest2_HORDE_Folgequest = "知識試煉"
Inst19Quest2PreQuest_HORDE = "true"
--
Inst19Quest2name1_HORDE = "風雷之錘"
Inst19Quest2name2_HORDE = "跳動之火"

--Quest 3 Horde
Inst19Quest3_HORDE = "3. 墮落者綱要"
Inst19Quest3_HORDE_Level = "38"
Inst19Quest3_HORDE_Attain = "28"
Inst19Quest3_HORDE_Aim = "從提瑞斯法林地血色修道院裡找到《墮落者綱要》，把它交給雷霆崖的賢者圖希克。"
Inst19Quest3_HORDE_Location = "賢者圖希克（雷霆崖 - 靈魂高地; "..YELLOW.."34,47"..WHITE.."）"
Inst19Quest3_HORDE_Note = "你可以在血色圖書館裡找到這這本書。不過不死族因為劇情不能獲得這個任務。"
Inst19Quest3_HORDE_Prequest = "無"
Inst19Quest3_HORDE_Folgequest = "無"
--
Inst19Quest3name1_HORDE = "邪惡保衛者"
Inst19Quest3name2_HORDE = "力石圓盾"
Inst19Quest3name3_HORDE = "終結寶珠"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst19Quest4_HORDE = "4. 能量儀式 (法師職業任務)"
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
Inst19Quest5_HORDE = "5. 深入血色修道院"
Inst19Quest5_HORDE_Level = "42"
Inst19Quest5_HORDE_Attain = "33"
Inst19Quest5_HORDE_Aim = "殺掉大檢察官懷特邁恩、血色十字軍指揮官莫格萊尼、血色十字軍勇士赫洛德和馴犬者洛克希，然後向幽暗城的瓦里瑪薩斯回報。"
Inst19Quest5_HORDE_Location = "瓦里瑪薩斯（幽暗城 - 皇家區; "..YELLOW.."56,92 "..WHITE.."）"
Inst19Quest5_HORDE_Note = "大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst19Quest5_HORDE_Prequest = "無"
Inst19Quest5_HORDE_Folgequest = "無"
--
Inst19Quest5name1_HORDE = "預兆之劍"
Inst19Quest5name2_HORDE = "預言藤杖"
Inst19Quest5name3_HORDE = "龍血項鍊"



--------------- INST57 - SM: Armory (SM Arm) ---------------

Inst57Story = "血色修道院曾經是羅德隆王國牧師的榮耀之地——那裡是學習聖光只是和膜拜的中心。隨著在第三次大戰中天譴軍團的崛起，寧靜的修道院成為了瘋狂的血色十字軍的要塞。十字軍對於所有非人類都有著偏激的態度，無論他們是自己的盟友還是對手。他們相信所有任何外來者都帶著亡靈的瘟疫——他們必須被摧毀。有報告說所有進入修道院的冒險者都要面對血色十字軍指揮官莫格萊尼——他控制了一群狂熱的十字軍戰士。然而，修道院的真正主人是大檢察官懷特邁恩——一個瘋狂的牧師，她具有復活死去的戰士來為其效勞的能力。"
Inst57Caption = "血色修道院：軍械庫"
Inst57QAA = "1 個任務"
Inst57QAH = "2 個任務"

--Quest 1 Alliance
Inst57Quest1 = "1. 以聖光之名"
Inst57Quest1_Level = "40"
Inst57Quest1_Attain = "34"
Inst57Quest1_Aim = "殺死大檢察官懷特邁恩，血色十字軍指揮官莫格萊尼，十字軍的勇士赫洛德和馴犬者洛克希並向南海鎮的萊雷恩覆命。"
Inst57Quest1_Location = "虔誠的萊雷恩（希爾斯布萊德丘陵 - 南海鎮; "..YELLOW.."51,58 "..WHITE.."）"
Inst57Quest1_Note = "此系列任務始於克羅雷修士（暴風城 - 光明大教堂; "..YELLOW.."52,43"..WHITE.."）。\n大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst57Quest1_Prequest ="安東修士→血色之路（任務領取地點在淒涼之地前哨站，任務要殺的骷髏兵在地圖底部中間偏右的一個山谷裡面）"
Inst57Quest1_Folgequest = "無"
Inst57Quest1PreQuest = "true"
--
Inst57Quest1name1 = "平靜之劍"
Inst57Quest1name2 = "咬骨之斧"
Inst57Quest1name3 = "黑暗威脅"
Inst57Quest1name4 = "洛瑞卡寶珠"


--Quest 1 Horde
Inst57Quest1_HORDE = "1. 狂熱之心"
Inst57Quest1_HORDE_Level = "33"
Inst57Quest1_HORDE_Attain = "30"
Inst57Quest1_HORDE_Aim = "幽暗城的大藥劑師法拉尼爾需要20顆狂熱之心。"
Inst57Quest1_HORDE_Location = "大藥劑師法拉尼爾（幽暗城 - 煉金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst57Quest1_HORDE_Note = "血色修道院中的所有怪物均會掉落狂熱之心，包括了地城入口外的非精英怪物。"
Inst57Quest1_HORDE_Prequest = "蝙蝠的糞便（"..YELLOW.."[剃刀沼澤]"..WHITE.."）"
Inst57Quest1_HORDE_Folgequest = "無"
Inst57Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst57Quest2_HORDE = "2. 深入血色修道院"
Inst57Quest2_HORDE_Level = "42"
Inst57Quest2_HORDE_Attain = "33"
Inst57Quest2_HORDE_Aim = "殺掉大檢察官懷特邁恩、血色十字軍指揮官莫格萊尼、血色十字軍勇士赫洛德和馴犬者洛克希，然後向幽暗城的瓦里瑪薩斯回報。"
Inst57Quest2_HORDE_Location = "瓦里瑪薩斯（幽暗城 - 皇家區; "..YELLOW.."56,92 "..WHITE.."）"
Inst57Quest2_HORDE_Note = "大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst57Quest2_HORDE_Prequest = "無"
Inst57Quest2_HORDE_Folgequest = "無"
--
Inst57Quest2name1_HORDE = "預兆之劍"
Inst57Quest2name2_HORDE = "預言藤杖"
Inst57Quest2name3_HORDE = "龍血項鍊"



--------------- INST58 - SM: Cathedral (SM Cath) ---------------

Inst58Story = "血色修道院曾經是羅德隆王國牧師的榮耀之地——那裡是學習聖光只是和膜拜的中心。隨著在第三次大戰中天譴軍團的崛起，寧靜的修道院成為了瘋狂的血色十字軍的要塞。十字軍對於所有非人類都有著偏激的態度，無論他們是自己的盟友還是對手。他們相信所有任何外來者都帶著亡靈的瘟疫——他們必須被摧毀。有報告說所有進入修道院的冒險者都要面對血色十字軍指揮官莫格萊尼——他控制了一群狂熱的十字軍戰士。然而，修道院的真正主人是大檢察官懷特邁恩——一個瘋狂的牧師，她具有復活死去的戰士來為其效勞的能力。"
Inst58Caption = "血色修道院：大教堂"
Inst58QAA = "1 個任務"
Inst58QAH = "2 個任務"

--Quest 1 Alliance
Inst58Quest1 = "1. 以聖光之名"
Inst58Quest1_Level = "40"
Inst58Quest1_Attain = "34"
Inst58Quest1_Aim = "殺死大檢察官懷特邁恩，血色十字軍指揮官莫格萊尼，十字軍的勇士赫洛德和馴犬者洛克希並向南海鎮的萊雷恩覆命。"
Inst58Quest1_Location = "虔誠的萊雷恩（希爾斯布萊德丘陵 - 南海鎮; "..YELLOW.."51,58 "..WHITE.."）"
Inst58Quest1_Note = "此系列任務始於克羅雷修士（暴風城 - 光明大教堂; "..YELLOW.."52,43"..WHITE.."）。\n大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst58Quest1_Prequest = "安東修士→血色之路（任務領取地點在淒涼之地前哨站，任務要殺的骷髏兵在地圖底部中間偏右的一個山谷裡面）"
Inst58Quest1_Folgequest = "無"
Inst58Quest1PreQuest = "true"
--
Inst58Quest1name1 = "平靜之劍"
Inst58Quest1name2 = "咬骨手斧"
Inst58Quest1name3 = "黑暗威脅"
Inst58Quest1name4 = "洛瑞卡寶珠"


--Quest 1 Horde
Inst58Quest1_HORDE = "1. 狂熱之心"
Inst58Quest1_HORDE_Level = "33"
Inst58Quest1_HORDE_Attain = "30"
Inst58Quest1_HORDE_Aim = "幽暗城的大藥劑師法拉尼爾需要20顆狂熱之心。"
Inst58Quest1_HORDE_Location = "大藥劑師法拉尼爾（幽暗城 - 煉金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst58Quest1_HORDE_Note = "血色修道院中的所有怪物均會掉落狂熱之心，包括了地城入口外的非精英怪物。"
Inst58Quest1_HORDE_Prequest = "蝙蝠的糞便（"..YELLOW.."[剃刀沼澤]"..WHITE.."）"
Inst58Quest1_HORDE_Folgequest = "無"
Inst58Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst58Quest2_HORDE = "2. 深入血色修道院"
Inst58Quest2_HORDE_Level = "42"
Inst58Quest2_HORDE_Attain = "33"
Inst58Quest2_HORDE_Aim = "殺掉大檢察官懷特邁恩、血色十字軍指揮官莫格萊尼、血色十字軍勇士赫洛德和馴犬者洛克希，然後向幽暗城的瓦里瑪薩斯回報。"
Inst58Quest2_HORDE_Location = "瓦里瑪薩斯（幽暗城 - 皇家區; "..YELLOW.."56,92 "..WHITE.."）"
Inst58Quest2_HORDE_Note = "大檢察官懷特邁恩和血色十字軍指揮官莫格萊尼在血色修道院"..YELLOW.."大教堂[2]"..WHITE.."，赫洛德在血色修道院"..YELLOW.."軍械庫[1]"..WHITE.."，馴犬者洛克希在血色修道院"..YELLOW.."圖書館[1]"..WHITE.."。"
Inst58Quest2_HORDE_Prequest = "無"
Inst58Quest2_HORDE_Folgequest = "無"
--
Inst58Quest2name1_HORDE = "預兆之劍"
Inst58Quest2name2_HORDE = "預言藤杖"
Inst58Quest2name3_HORDE = "龍血項鍊"



--------------- INST59 - SM: Graveyard (SM GY) ---------------

Inst59Story = "血色修道院曾經是羅德隆王國牧師的榮耀之地——那裡是學習聖光只是和膜拜的中心。隨著在第三次大戰中天譴軍團的崛起，寧靜的修道院成為了瘋狂的血色十字軍的要塞。十字軍對於所有非人類都有著偏激的態度，無論他們是自己的盟友還是對手。他們相信所有任何外來者都帶著亡靈的瘟疫——他們必須被摧毀。有報告說所有進入修道院的冒險者都要面對血色十字軍指揮官莫格萊尼——他控制了一群狂熱的十字軍戰士。然而，修道院的真正主人是大檢察官懷特邁恩——一個瘋狂的牧師，她具有復活死去的戰士來為其效勞的能力。"
Inst59Caption = "血色修道院：墓地"
Inst59QAA = "1 個任務"
Inst59QAH = "3 個任務"

--Quest 1 Alliance
Inst59Quest1 = "1. 召喚無頭騎士 (季節性每日 萬聖節)"
Inst59Quest1_Level = "70"
Inst59Quest1_Attain = "65"
Inst59Quest1_Aim = "將一根悲傷蠟燭插入翻過的泥土。"
Inst59Quest1_Location = "無頭騎士南瓜（血色修道院 - 墓地; "..YELLOW.."[2]"..WHITE.."）"
Inst59Quest1_Note = "無頭騎士南瓜旁邊就是翻過的泥土。這是一個只有在萬聖節期間的季節性每日任務。\n\n召喚出來的無頭騎士是70級別的王。"
Inst59Quest1_Prequest = "無"
Inst59Quest1_Folgequest = "無"
-- No Rewards for this quest


--Quest 1 Horde
Inst59Quest1_HORDE = "1. 沃瑞爾的復仇"
Inst59Quest1_HORDE_Level = "33"
Inst59Quest1_HORDE_Attain = "25"
Inst59Quest1_HORDE_Aim = "把沃瑞爾．森加斯的結婚戒指還給塔倫米爾的莫尼卡．森古特斯。"
Inst59Quest1_HORDE_Location =  "沃瑞爾．森加斯（血色修道院 - 墓地; "..YELLOW.."[1]"..WHITE.."）"
Inst59Quest1_HORDE_Note = "沃瑞爾．森加斯位於血色修道院墓地前部。南茜在（奧特蘭克山脈; "..YELLOW.."31,32"..WHITE.."）。她有任務需要的戒指。"
Inst59Quest1_HORDE_Prequest = "無"
Inst59Quest1_HORDE_Folgequest = "無"
--
Inst59Quest1name1_HORDE = "沃瑞爾的靴子"
Inst59Quest1name2_HORDE = "悲哀襯肩"
Inst59Quest1name3_HORDE = "十字軍斗篷"

--Quest 2 Horde
Inst59Quest2_HORDE = "2. 狂熱之心"
Inst59Quest2_HORDE_Level = "33"
Inst59Quest2_HORDE_Attain = "30"
Inst59Quest2_HORDE_Aim = "幽暗城的大藥劑師法拉尼爾需要20顆狂熱之心。"
Inst59Quest2_HORDE_Location = "大藥劑師法拉尼爾（幽暗城 - 煉金房; "..YELLOW.."48,69 "..WHITE.."）"
Inst59Quest2_HORDE_Note =  "血色修道院中的所有怪物均會掉落狂熱之心，包括了地城入口外的非精英怪物。"
Inst59Quest2_HORDE_Prequest = "蝙蝠的糞便（"..YELLOW.."[剃刀沼澤]"..WHITE.."）"
Inst59Quest2_HORDE_Folgequest = "無"
Inst59Quest2PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst59Quest3_HORDE = "3. 召喚無頭騎士 (季節性每日 萬聖節)"
Inst59Quest3_HORDE_Level = Inst59Quest1_Level
Inst59Quest3_HORDE_Attain = Inst59Quest1_Attain
Inst59Quest3_HORDE_Aim = Inst59Quest1_Aim
Inst59Quest3_HORDE_Location = Inst59Quest1_Location
Inst59Quest3_HORDE_Note = Inst59Quest1_Note
Inst59Quest3_HORDE_Prequest = Inst59Quest1_Prequest
Inst59Quest3_HORDE_Folgequest = Inst59Quest1_Folgequest
-- No Rewards for this quest



--------------- INST20 - Scholomance (Scholo) ---------------

Inst20Story = "通靈學院位於凱爾達隆廢棄的城堡中的地下室裡。那裡曾經是高貴的巴羅夫家族的，但是在第二次大戰中，凱爾達隆變成了一塊廢墟。法師克爾蘇加德經常向他的詛咒神教信徒承諾，可以用對巫妖王的效忠來換取永恆的生命。巴羅夫家族受到克爾蘇加德的魅惑，變將城堡和其地下室獻給了天譴軍團。那些信徒後來將巴羅夫家族的人殺死並把地下室變成了通靈學院。雖然克爾蘇加德不再住在這個地下室中，但是狂熱的信徒和講師都還留在那裡。強大的巫妖——萊斯．霜語以天譴軍團的名義控制了通靈學院；而身為凡人的巫師黑暗院長加丁則是這個學校邪惡的校長。"
Inst20Caption = "通靈學院"
Inst20QAA = "11 個任務"
Inst20QAH = "12 個任務"

--Quest 1 Alliance
Inst20Quest1 = "1. 瘟疫之龍"
Inst20Quest1_Level = "58"
Inst20Quest1_Attain = "55"
Inst20Quest1_Aim = "殺掉20隻瘟疫幼龍，然後向聖光之願禮拜堂的貝蒂娜．比格辛克覆命。"
Inst20Quest1_Location = "貝蒂娜．比格辛克（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,53"..WHITE.."）"
Inst20Quest1_Note = "瘟疫幼龍在屍骨儲藏所"..YELLOW.."[5]"..WHITE.."，去往血骨傀儡的大房間。"
Inst20Quest1_Prequest = "無"
Inst20Quest1_Folgequest = "健康的龍鱗"
-- No Rewards for this quest

--Quest 2 Alliance
Inst20Quest2 = "2. 健康的龍鱗"
Inst20Quest2_Level = "58"
Inst20Quest2_Attain = "55"
Inst20Quest2_Aim = "把健康的龍鱗交給東瘟疫之地聖光之願禮拜堂中的貝蒂娜．比格辛克。"
Inst20Quest2_Location = "健康的龍鱗（瘟疫幼龍掉落 - 通靈學院）"
Inst20Quest2_Note = "瘟疫幼龍掉落健康的龍鱗（8%掉落機率）。貝蒂娜．比格辛克在（東瘟疫之地 - 聖光之願禮拜堂;"..YELLOW.."75,53"..WHITE.."）。"
Inst20Quest2_Prequest = "瘟疫之龍"
Inst20Quest2_Folgequest = "無"
Inst20Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst20Quest3 = "3. 『屠夫』瑟爾林·卡斯迪諾夫教授"
Inst20Quest3_Level = "60"
Inst20Quest3_Attain = "55"
Inst20Quest3_Aim = "在通靈學院中找到瑟爾林．卡斯迪諾夫教授。殺死他，並燒毀艾瓦．薩克霍夫和盧森．薩克霍夫的遺體。任務完成後就回到艾瓦．薩克霍夫那兒。"
Inst20Quest3_Location = "艾瓦．薩克霍夫（西瘟疫之地 - 凱爾達隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest3_Note = "你可以在"..YELLOW.."[9]"..WHITE.."找到瑟爾林．卡斯迪諾夫教授。"
Inst20Quest3_Prequest = "無"
Inst20Quest3_Folgequest = "卡斯迪諾夫的恐懼之袋"
-- No Rewards for this quest

--Quest 4 Alliance
Inst20Quest4 = "4. 卡斯迪諾夫的恐懼之袋"
Inst20Quest4_Level = "60"
Inst20Quest4_Attain = "55"
Inst20Quest4_Aim = "在通靈學院找到詹迪斯．巴羅夫並打敗她。從她的屍體上找到卡斯迪諾夫的恐懼之袋，然後將其交給艾瓦．薩克霍夫。"
Inst20Quest4_Location = "艾瓦．薩克霍夫（西瘟疫之地 - 凱爾達隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest4_Note = "你可以在"..YELLOW.."[3]"..WHITE.."詹迪斯．巴羅夫。"
Inst20Quest4_Prequest = "瑟爾林．卡斯迪諾夫教授"
Inst20Quest4_Folgequest = "傳令官基爾圖諾斯"
Inst20Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst20Quest5 = "5. 傳令官基爾圖諾斯"
Inst20Quest5_Level = "60"
Inst20Quest5_Attain = "55"
Inst20Quest5_Aim = "帶著無辜者之血回到通靈學院，將它放在門廊的火盆下面，基爾圖諾斯會前來吞噬你的靈魂。勇敢地戰鬥吧，不要退縮！殺死基爾圖諾斯，然後回到艾瓦．薩克霍夫那兒。"
Inst20Quest5_Location = "艾瓦．薩克霍夫（西瘟疫之地 - 凱爾達隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest5_Note = "門廊就在"..YELLOW.."[2]"..WHITE.."。"
Inst20Quest5_Prequest = "卡斯迪諾夫的恐懼之袋"
Inst20Quest5_Folgequest = "萊斯．霜語"
Inst20Quest5FQuest = "true"
--
Inst20Quest5name1 = "鬼靈精華"
Inst20Quest5name2 = "波尼的玫瑰"
Inst20Quest5name3 = "米拉之歌"

--Quest 6 Alliance
Inst20Quest6 = "6. 巫妖萊斯·霜語"
Inst20Quest6_Level = "60"
Inst20Quest6_Attain = "57"
Inst20Quest6_Aim = "在通靈學院裡找到萊斯．霜語。當你找到他之後，使用禁錮靈魂的遺物破除其亡靈的外殼。如果你成功地破除了他的不死之身，就殺掉他並拿到萊斯．霜語的頭顱。把那個頭顱交給馬杜克鎮長。"
Inst20Quest6_Location = "馬杜克鎮長（西瘟疫之地 - 凱爾達隆; "..YELLOW.."70,73"..WHITE.."）"
Inst20Quest6_Note = "你可以在"..YELLOW.."[7]"..WHITE.."找到萊斯．霜語。"
Inst20Quest6_Prequest = "萊斯．霜語→禁錮靈魂的遺物"
Inst20Quest6_Folgequest = "無"
Inst20Quest6PreQuest = "true"
--
Inst20Quest6name1 = "達隆郡之盾"
Inst20Quest6name2 = "凱爾達隆戰刃"
Inst20Quest6name3 = "凱爾達隆之冠"
Inst20Quest6name4 = "達隆郡之刺"

--Quest 7 Alliance
Inst20Quest7 = "7. 巴羅夫家族的寶藏"
Inst20Quest7_Level = "60"
Inst20Quest7_Attain = "52"
Inst20Quest7_Aim = "到通靈學院中取得巴羅夫家族的寶藏。這份寶藏包括四份地契：凱爾達隆地契、布瑞爾地契、塔倫米爾地契還有南海鎮地契。完成任務之後就回到維爾頓．巴羅夫那兒去。"
Inst20Quest7_Location = "維爾頓．巴羅夫（西瘟疫之地 - 寒風營地; "..YELLOW.."43,83"..WHITE.."）"
Inst20Quest7_Note = "你可以在"..YELLOW.."[12]"..WHITE.."找到凱爾達隆地契，在"..YELLOW.."[7]"..WHITE.."找到布瑞爾地契，在"..YELLOW.."[4]"..WHITE.."找到塔倫米爾地契，在"..YELLOW.."[1]"..WHITE.."找到南海鎮地契。任務獎勵由後續任務「巴羅夫的繼承人」提供。"
Inst20Quest7_Prequest = "無"
Inst20Quest7_Folgequest = "巴羅夫的繼承人\n（去亡靈壁壘——部落的領地暗殺阿萊克斯．巴羅夫。把他的腦袋交給維爾頓．巴羅夫。）"
--
Inst20Quest7name1 = "巴羅夫管家鈴"

--Quest 8 Alliance
Inst20Quest8 = "8. 黎明先鋒"
Inst20Quest8_Level = "60"
Inst20Quest8_Attain = "57"
Inst20Quest8_Aim = "將黎明先鋒放在通靈學院的觀察室裡。打敗維克圖斯，然後回到貝蒂娜．比格辛克那裡去。"
Inst20Quest8_Location = "貝蒂娜．比格辛克（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,53"..WHITE.."）"
Inst20Quest8_Note = "雛龍精華開始於丁奇．斯迪波爾（燃燒平原 - 烈焰峰; "..YELLOW.."65,23"..WHITE.."）。觀察室在"..YELLOW.."[6]"..WHITE.."。"
Inst20Quest8_Prequest = "雛龍精華→萊尼德．巴薩羅梅→貝蒂娜．比格辛克"
Inst20Quest8_Folgequest = "無"
Inst20Quest8PreQuest = "true"
--
Inst20Quest8name1 = "斷風者"
Inst20Quest8name2 = "舞動薄杖"

--Quest 9 Alliance
Inst20Quest9 = "9. 運送小鬼 (術士職業任務)"
Inst20Quest9_Level = "60"
Inst20Quest9_Attain = "60"
Inst20Quest9_Aim = "把瓶中的小鬼帶到通靈學院的煉金實驗室中。在小鬼製造出羊皮紙之後，把瓶子還給戈瑟奇．邪眼。"
Inst20Quest9_Location = "戈瑟奇．邪眼（燃燒平原 - 風暴祭壇; "..YELLOW.."12,31"..WHITE.."）"
Inst20Quest9_Note = "只有術士才能得到這個任務！你可以在"..YELLOW.."[7]"..WHITE.."找到煉金實驗室。"
Inst20Quest9_Prequest = "莫蘇爾．召血者→克索諾斯星塵"
Inst20Quest9_Folgequest = "克索諾斯恐懼戰馬"
Inst20Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst20Quest10 = "10. 瓦薩拉克領主護符的左半塊"
Inst20Quest10_Level = "60"
Inst20Quest10_Attain = "58"
Inst20Quest10_Aim = "使用召喚火盆召喚出庫爾莫克的靈魂，然後殺掉他。完成之後，將召喚火盆與瓦薩拉克領主護符的左半塊還給黑石山的布德利。"
Inst20Quest10_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D] "..WHITE.."）"
Inst20Quest10_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n在"..YELLOW.."[7]"..WHITE.."召喚庫爾莫克。"
Inst20Quest10_Prequest = "重要的材料"
Inst20Quest10_Folgequest = " 有，奧卡茲島在你前方……"
Inst20Quest10PreQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst20Quest11 = "11. 瓦薩拉克領主護符的右半塊"
Inst20Quest11_Level = "60"
Inst20Quest11_Attain = "58"
Inst20Quest11_Aim = "使用召喚火盆召喚科爾莫克的靈魂並殺了他。帶著重新組合的瓦薩拉克領主護符和召喚火盆回到黑石山的布德利那裡。"
Inst20Quest11_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖[D] "..WHITE.."）"
Inst20Quest11_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n在"..YELLOW.."[7]"..WHITE.."召喚科爾莫克。"
Inst20Quest11_Prequest = "更多重要的材料"
Inst20Quest11_Folgequest = "最後的準備（"..YELLOW.."黑石塔上層"..WHITE.."）"
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
Inst20Quest7_HORDE = "7. 巴羅夫家族的寶藏"
Inst20Quest7_HORDE_Level = "60"
Inst20Quest7_HORDE_Attain = "52"
Inst20Quest7_HORDE_Aim = "到通靈學院中取得巴羅夫家族的寶藏。這份寶藏包括四份地契：凱爾達隆地契、布瑞爾地契、塔倫米爾地契還有南海鎮地契。當你拿到這四份地契之後就回到阿萊克斯．巴羅夫那兒去。"
Inst20Quest7_HORDE_Location = "阿萊克斯．巴羅夫（西瘟疫之地 - 亡靈壁壘; "..YELLOW.."28,57"..WHITE.."）"
Inst20Quest7_HORDE_Note = "你可以在"..YELLOW.."[12]"..WHITE.."找到凱爾達隆地契，在"..YELLOW.."[7]"..WHITE.."找到布瑞爾地契，在"..YELLOW.."[4]"..WHITE.."找到塔倫米爾地契，在"..YELLOW.."[1]"..WHITE.."找到南海鎮地契。任務獎勵由後續任務「巴羅夫的繼承人」提供。"
Inst20Quest7_HORDE_Prequest = "無"
Inst20Quest7_HORDE_Folgequest = "巴羅夫的繼承人\n（到寒風營地——聯盟的領地去暗殺維爾頓．巴羅夫。把他的腦袋交給阿萊克斯．巴羅夫。）"
--
Inst20Quest7name1_HORDE = "巴羅夫管家鈴"

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
Inst20Quest11_HORDE = "11. 達克雷爾的威脅 (薩滿職業任務)"
Inst20Quest11_HORDE_Level = "60"
Inst20Quest11_HORDE_Attain = "58"
Inst20Quest11_HORDE_Aim = "在通靈學院地下室的屍骨儲藏所的中心使用預言水晶球。然後你必須與被召喚出來的幽靈作戰。擊敗這些幽靈之後，死亡騎士達克雷爾才會出現，你的任務就是擊敗他。\n\n把死亡騎士達克雷爾的頭顱交給奧格瑪智慧谷的薩格尼。"
Inst20Quest11_HORDE_Location = "薩格尼（奧格瑪 - 智慧谷; "..YELLOW.."38.6, 36.2"..WHITE.."）"
Inst20Quest11_HORDE_Note = "只有薩滿才能接到這個任務。前置任務由同一個NPC處得到。\n\n死亡騎士達克雷爾在"..YELLOW.."[5]"..WHITE.."的地方召喚。"
Inst20Quest11_HORDE_Prequest = "蒐集材料"
Inst20Quest11_HORDE_Folgequest = "None"
Inst20Quest11PreQuest_HORDE = "true"
--
Inst20Quest11name1_HORDE = "天怒頭盔"

--Quest 12 Horde  (same as Quest 11 Alliance)
Inst20Quest12_HORDE = "12. 瓦薩拉克領主護符的右半塊"
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

Inst21Story = "在第三次大戰中，肯瑞托的法師和天譴軍團進行了殊死的戰鬥。當達拉然的法師們死於戰場之後，他們的意志轉移到了復甦的天譴軍團身上，然後重生了。由於對緩慢的進展感到失望，並且對手下的建議完全不予理會的大法師阿魯高，選擇了召喚異次元空間的生物來壯大達拉然日漸消失的力量。阿魯高的召喚將貪婪的狼人帶到了艾澤拉斯大陸。這些狂暴的狼型生物不僅屠殺了天譴軍團的士兵，同時也迅速地將目標轉向那些法師。那些狼人開始圍攻席瓦萊恩男爵的城堡。這座位於焚木村的城堡不久之後變成了黑暗勢力的聚集地並從此荒廢。因為對於自己罪過的愧疚而變得瘋狂的阿魯高，將那些狼人當作自己的孩子並隱居在“影牙城堡”中。據說他現在還住在那裡，被他巨大的寵物芬魯斯所保護著，另外，在城堡中還徘徊著瓦萊恩男爵和其手下的復仇幽靈。"
Inst21Caption = "影牙城堡"
Inst21QAA = "5 個任務"
Inst21QAH = "7 個任務"

--Quest 1 Alliance
Inst21Quest1 = "1. 正義試煉 (聖騎士職業任務)"
Inst21Quest1_Level = "22"
Inst21Quest1_Attain = "20"
Inst21Quest1_Aim = "按照喬丹的武器材料單上的說明去尋找一些白石橡木、精煉礦石、喬丹的鐵錘和一塊科爾寶石，然後回到鐵爐堡去見喬丹．斯迪威爾。"
Inst21Quest1_Location = "喬丹．斯迪威爾（丹莫洛 - 鐵爐堡 "..YELLOW.."52,36 "..WHITE.."）"
Inst21Quest1_Note = "點擊"..YELLOW.."《喬丹的武器材料單》"..WHITE.."查看喬丹的武器材料。"
Inst21Quest1_Page = {2, "只有聖騎士們才能接到這個任務！\n\n1. 你可以從"..YELLOW.."[死亡礦坑]"..WHITE.."哥布林木匠"..YELLOW.."[3]"..WHITE.."那兒得到白石橡木。\n\n2. 要得到精煉礦石，你必須先與白洛爾．石手交談（洛克莫丹 - 塞爾薩瑪; "..YELLOW.."35,44"..WHITE.."）。他會給你《白洛爾的礦石》任務。 你在一棵樹後面找到喬丹的礦石"..YELLOW.."71,21"..WHITE.."。\n\n3. 你可以在"..YELLOW.."[影牙城堡]"..WHITE.."緊靠"..YELLOW.."[5]"..WHITE.."的地方找到喬丹的鐵錘（安全地點）。\n\n4. 要得到科爾寶石，你必須去找桑迪斯．織風（黑海岸 - 奧伯丁; "..YELLOW.."37,40"..WHITE.."）並且做完《尋找科爾寶石》任務。為了完成這個任務，你必須殺掉"..YELLOW.."[黑暗深淵]"..WHITE.."前的黑暗深淵智者或者黑暗深淵海潮祭司。他們會掉落被污染的科爾寶石。桑迪斯．織風會為你淨化它的。", };
Inst21Quest1_Prequest = "勇氣之書→正義試煉"
Inst21Quest1_Folgequest = "正義試煉"
Inst21Quest1PreQuest = "true"
--
Inst21Quest1name1 = "維里甘之拳"

--Quest 2 Alliance
Inst21Quest2 = "2. 索蘭魯克寶珠 (術士職業任務)"
Inst21Quest2_Level = "25"
Inst21Quest2_Attain = "20"
Inst21Quest2_Aim = "找到3塊索蘭魯克寶珠的碎片和1塊索蘭魯克寶珠的大碎片，把它們交給貧瘠之地的杜安．卡漢。"
Inst21Quest2_Location = "杜安．卡漢（貧瘠之地; "..YELLOW.."49,57"..WHITE.."）"
Inst21Quest2_Note = "只有術士才能接到這個任務！3塊索蘭魯克寶珠的碎片，你可以從"..YELLOW.."[黑暗深淵]"..WHITE.."的暮光侍僧那裡得到。那塊索蘭魯克寶珠的大碎片，你要去"..YELLOW.."[影牙城堡]"..WHITE.."找影牙狼人。"
Inst21Quest2_Prequest = "無"
Inst21Quest2_Folgequest = "無"
--
Inst21Quest2name1 = "索蘭魯克寶珠"
Inst21Quest2name2 = "索拉魯克法杖"

--Quest 3 Alliance
Inst21Quest3 = "3. 裡應外合"
Inst21Quest3_Level = "80"
Inst21Quest3_Attain = "75"
Inst21Quest3_Aim = "到影牙城堡找調查員菲贊．銅釘回報。"
Inst21Quest3_Location = "巡官史尼卜．凸栓（暴風城 - 貿易區; "..YELLOW.."61.7, 75.5"..WHITE.."）"
Inst21Quest3_Note = "這個任務是季節任務[真愛在身邊]的系列任務。\n\n你可以在通往庭院的大門前"..YELLOW.."[2]"..WHITE.."找到調查員菲贊．銅釘。"
Inst21Quest3_Prequest = "善意的溝通…"
Inst21Quest3_Folgequest = "服務到家"
Inst21Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst21Quest4 = "4. 服務到家 (每日任務)"
Inst21Quest4_Level = "80"
Inst21Quest4_Attain = "75"
Inst21Quest4_Aim = "把法院傳票交給影牙城堡的藥劑師胡默爾。"
Inst21Quest4_Location = "調查員菲贊．銅釘（影牙城堡; "..YELLOW.."[2]"..WHITE.."）"
Inst21Quest4_Note = "這個任務是季節任務[真愛在身邊]的系列任務。\n\n你不需要完成前置任務也可接到此任務。\n\n藥劑師胡默爾在庭院中的"..YELLOW.."[3]"..WHITE.."。回報任務之後便會觸發戰鬥事件，所以請確認每個隊伍在每次只有一個成員進行任務回報。"
Inst21Quest4_Prequest = "裡應外合（非必要）"
Inst21Quest4_Folgequest = "微妙的氣氛（肯定不是愛）"
Inst21Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst21Quest5 = "5. 微妙的氣氛(肯定不是愛)"
Inst21Quest5_Level = "80"
Inst21Quest5_Attain = "75"
Inst21Quest5_Aim = "把褪色的可愛邀請卡拿給暴風城的巡官史尼卜．凸栓。"
Inst21Quest5_Location = "影牙城堡中的藥劑師胡默爾將會掉落褪色的可愛邀請卡。"
Inst21Quest5_Note = "這個任務是季節任務[真愛在身邊]的系列任務。\n\n巡官史尼卜．凸栓在（暴風城 - 貿易區; "..YELLOW.."61.7, 75.5"..WHITE.."）。"
Inst21Quest5_Prequest = "無"
Inst21Quest5_Folgequest = "無"
-- No Rewards for this quest


--Quest 1 Horde
Inst21Quest1_HORDE = "1. 影牙城堡裡的亡靈哨兵"
Inst21Quest1_HORDE_Level = "25"
Inst21Quest1_HORDE_Attain = "18"
Inst21Quest1_HORDE_Aim = "找到亡靈哨兵阿達曼特和亡靈哨兵文森特。"
Inst21Quest1_HORDE_Location = "高級執行官哈德瑞克（銀松森林 - 瑟伯切爾; "..YELLOW.."43,40"..WHITE.."）"
Inst21Quest1_HORDE_Note = "阿達曼特在"..YELLOW.."[1]"..WHITE.."，文森特在一進庭院的右側"..YELLOW.."[3]"..WHITE.."。"
Inst21Quest1_HORDE_Prequest = "無"
Inst21Quest1_HORDE_Folgequest = "無"
--
Inst21Quest1name1_HORDE = "鬼魅襯肩"

--Quest 2 Horde
Inst21Quest2_HORDE = "2. 烏爾之書"
Inst21Quest2_HORDE_Level = "26"
Inst21Quest2_HORDE_Attain = "16"
Inst21Quest2_HORDE_Aim = "把烏爾之書帶給幽暗城煉金區裡的看守者貝爾杜加。"
Inst21Quest2_HORDE_Location = "看守者貝爾杜加（幽暗城 - 煉金房; "..YELLOW.."53,54"..WHITE.."）"
Inst21Quest2_HORDE_Note = "你可以找到書在進門的左邊"..YELLOW.."[11]"..WHITE.."。"
Inst21Quest2_HORDE_Prequest = "無"
Inst21Quest2_HORDE_Folgequest = "無"
--
Inst21Quest2name1_HORDE = "灰色長靴"
Inst21Quest2name2_HORDE = "鋼釘護腕"

--Quest 3 Horde
Inst21Quest3_HORDE = "3. 除掉阿魯高"
Inst21Quest3_HORDE_Level = "27"
Inst21Quest3_HORDE_Attain = "18"
Inst21Quest3_HORDE_Aim = "殺死阿魯高，把他的頭帶給瑟伯切爾的達拉爾．道恩維沃爾。"
Inst21Quest3_HORDE_Location = "達拉爾．道恩維沃爾（銀松森林 - 瑟伯切爾; "..YELLOW.."44,39"..WHITE.."）"
Inst21Quest3_HORDE_Note = "你可以在"..YELLOW.."[13]"..WHITE.."找到阿魯高。"
Inst21Quest3_HORDE_Prequest = "無"
Inst21Quest3_HORDE_Folgequest = "無"
--
Inst21Quest3name1_HORDE = "希瓦娜斯的徽印"

--Quest 4 Horde  (same as Quest 2 Alliance)
Inst21Quest4_HORDE = "4. 索蘭魯克寶珠 (術士職業任務)"
Inst21Quest4_HORDE_Level = Inst21Quest2_Level
Inst21Quest4_HORDE_Attain = Inst21Quest2_Attain
Inst21Quest4_HORDE_Aim = Inst21Quest2_Aim
Inst21Quest4_HORDE_Location = Inst21Quest2_Location
Inst21Quest4_HORDE_Note = Inst21Quest2_Note
Inst21Quest4_HORDE_Prequest = Inst21Quest2_Prequest
Inst21Quest4_HORDE_Folgequest = Inst21Quest2_Folgequest
--
Inst21Quest4name1_HORDE = Inst21Quest2name1
Inst21Quest4name2_HORDE = Inst21Quest2name2

--Quest 5 Horde
Inst21Quest5_HORDE = "5. 裡應外合"
Inst21Quest5_HORDE_Level = "80"
Inst21Quest5_HORDE_Attain = "75"
Inst21Quest5_HORDE_Aim = "到影牙城堡找調查員菲贊．銅釘回報。"
Inst21Quest5_HORDE_Location = "警探史內卜．凸栓（奧格瑪 - 力量谷; "..YELLOW.."50.8, 65.6"..WHITE.."）"
Inst21Quest5_HORDE_Note = "這個任務是季節任務[真愛在身邊]的系列任務。\n\n你可以在通往庭院的大門前"..YELLOW.."[2]"..WHITE.."找到調查員菲贊．銅釘。"
Inst21Quest5_HORDE_Prequest = "善意的溝通…"
Inst21Quest5_HORDE_Folgequest = "服務到家"
Inst21Quest5PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 6 Horde  (same as Quest 4 Alliance)
Inst21Quest6_HORDE = "6. 服務到家 (每日任務)"
Inst21Quest6_HORDE_Level = Inst21Quest4_Level
Inst21Quest6_HORDE_Attain = Inst21Quest4_Attain
Inst21Quest6_HORDE_Aim = Inst21Quest4_Aim
Inst21Quest6_HORDE_Location = Inst21Quest4_Location
Inst21Quest6_HORDE_Note = Inst21Quest4_Note
Inst21Quest6_HORDE_Prequest = Inst21Quest4_Prequest
Inst21Quest6_HORDE_Folgequest = Inst21Quest4_Folgequest
Inst21Quest6FQuest_HORDE = Inst21Quest4FQuest
-- No Rewards for this quest

--Quest 7 Horde
Inst21Quest7_HORDE = "7. 微妙的氣氛(肯定不是愛)"
Inst21Quest7_HORDE_Level = "80"
Inst21Quest7_HORDE_Attain = "75"
Inst21Quest7_HORDE_Aim = "把褪色的可愛邀請卡拿給奧格瑪的警探史內卜．凸栓。"
Inst21Quest7_HORDE_Location = "影牙城堡中的藥劑師胡默爾將會掉落褪色的可愛邀請卡。"
Inst21Quest7_HORDE_Note = "這個任務是季節任務[真愛在身邊]的系列任務。\n\n警探史內卜．凸栓在（奧格瑪 - 力量谷; "..YELLOW.."50.8, 65.6"..WHITE.."）"
Inst21Quest7_HORDE_Prequest = "無"
Inst21Quest7_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST22 - Stratholme (Strat) ---------------

Inst22Story = "斯坦索姆曾經是羅德隆北部一顆最璀璨耀眼的明珠，但就是在這座城市中，阿薩斯王子背叛了他的良師益友烏瑟，並屠殺了數百個被認為感染了可怕瘟疫的臣民。阿薩斯不久之後就向巫妖王臣服，而這個破碎的城市也被巫妖克爾蘇加德領導的天譴軍團所占據。而一直由大十字軍戰士達索漢所領導的血色十字軍分遣隊也占據了這個城市的一部分。這兩方力量一直在城市中進行著激烈的戰鬥。而那些勇敢（亦或是愚蠢的）的冒險者在進入斯坦索姆之後，將不得不面對兩方的威脅力量。據說整座城市由三座大型的通靈塔以及無數強大的亡靈巫師，女妖和巨大的憎惡守衛所佔據。還有消息指出，邪惡的死亡騎士乘坐著一匹可怕的骷髏戰馬——他會將怒火傾瀉在任何膽敢進入天譴軍團領域的人。"
Inst22Caption = "斯坦索姆"
Inst22QAA = "18 個任務"
Inst22QAH = "20 個任務"

--Quest 1 Alliance
Inst22Quest1 = "1. 血肉不會撒謊"
Inst22Quest1_Level = "60"
Inst22Quest1_Attain = "55"
Inst22Quest1_Aim = "從斯坦索姆找回20個瘟疫肉塊，並把它們交給貝蒂娜．比格辛克。你覺得斯坦索姆中的生物都不大可能長著肉……"
Inst22Quest1_Location = "貝蒂娜．比格辛克（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,53"..WHITE.."）"
Inst22Quest1_Note = "斯坦索姆裡多數敵人都會掉落瘟疫肉塊，但是掉落率不算高。"
Inst22Quest1_Prequest = "無"
Inst22Quest1_Folgequest = "活躍的探子"
-- No Rewards for this quest

--Quest 2 Alliance
Inst22Quest2 = "2. 活躍的探子"
Inst22Quest2_Level = "60"
Inst22Quest2_Attain = "55"
Inst22Quest2_Aim = "到斯坦索姆去探索那裡的通靈塔。找到新的天譴軍團檔案，把它交給貝蒂娜．比格辛克。"
Inst22Quest2_Location = "貝蒂娜．比格辛克（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,53"..WHITE.."）"
Inst22Quest2_Note = "天譴軍團檔案會隨機出現在三個塔中的一個裡，這三個塔分別在"..YELLOW.."[15]"..WHITE.."，"..YELLOW.."[16]"..WHITE.."和"..YELLOW.."[17]"..WHITE.."。"
Inst22Quest2_Prequest = "血肉不會撒謊"
Inst22Quest2_Folgequest = "無"
Inst22Quest2FQuest = "true"
--
Inst22Quest2name1 = "黎明聖印"
Inst22Quest2name2 = "黎明符文"

--Quest 3 Alliance
Inst22Quest3 = "3. 神聖之屋"
Inst22Quest3_Level = "60"
Inst22Quest3_Attain = "55"
Inst22Quest3_Aim = "到北方的斯坦索姆去，尋找散落在城市中的補給箱，並收集5瓶斯坦索姆聖水。當你找到足夠的聖水之後就回去向萊尼德．巴薩羅梅覆命。"
Inst22Quest3_Location = "萊尼德．巴薩羅梅（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,52"..WHITE.."）"
Inst22Quest3_Note = "散落在斯坦索姆各處的補給箱裡或許可以找到聖水。但是也有可能打開箱子就有蟲子或老鼠出現並攻擊你。"
Inst22Quest3_Prequest = "無"
Inst22Quest3_Folgequest = "無"
--
Inst22Quest3name1 = "超強治療藥水"
Inst22Quest3name2 = "強效法力藥水"
Inst22Quest3name3 = "懺悔之冠"
Inst22Quest3name4 = "懺悔者指環"

--Quest 4 Alliance
Inst22Quest4 = "4. 弗拉斯·希亞比"
Inst22Quest4_Level = "60"
Inst22Quest4_Attain = "55"
Inst22Quest4_Aim = "找到弗拉斯．希亞比在斯坦索姆的煙草店，並從中找回一盒希亞比的煙草，把它交給煙鬼拉魯恩。"
Inst22Quest4_Location = "煙鬼拉魯恩（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."74,52"..WHITE.."）"
Inst22Quest4_Note = "煙草店在"..YELLOW.."[1]"..WHITE.."附近。當你打開盒子，弗拉斯．希亞比會突然出現並攻擊你。"
Inst22Quest4_Prequest = "無"
Inst22Quest4_Folgequest = "無"
--
Inst22Quest4name1 = "煙鬼的打火器"

--Quest 5 Alliance
Inst22Quest5 = "5. 永不安息的靈魂"
Inst22Quest5_Level = "60"
Inst22Quest5_Attain = "55"
Inst22Quest5_Aim = "對斯坦索姆裡已成為鬼魂的居民們使用伊根的衝擊器。當永不安息的靈魂從他們的鬼魂外殼解放出來後，再次使用衝擊器，他們就會徹底自由了！\n釋放15個永不安息的靈魂，然後回到伊根那裡。"
Inst22Quest5_Location = "伊根（東瘟疫之地 - 恐懼谷; "..YELLOW.."11,28"..WHITE.."）"
Inst22Quest5_Note = "前置任務從護理者奧林處獲得（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."74,58"..WHITE.."）\n鬼魂居民在斯坦索姆裡面到處走動。"
Inst22Quest5_Prequest = "永不安息的靈魂"
Inst22Quest5_Folgequest = "無"
Inst22Quest5PreQuest = "true"
--
Inst22Quest5name1 = "希望的證明"

--Quest 6 Alliance
Inst22Quest6 = "6. 愛與家庭 (系列任務)"
Inst22Quest6_Level = "60"
Inst22Quest6_Attain = "52"
Inst22Quest6_Aim = "到瘟疫之地北部的斯坦索姆去。你可以在血色十字軍堡壘中找到「愛與家庭」這幅畫，它被隱藏在另一幅描繪兩個月亮的畫之後。\n把這幅畫還給提里奧．弗丁。"
Inst22Quest6_Location = "畫家瑞弗蕾（西瘟疫之地 - 凱爾達隆; "..YELLOW.."65,75"..WHITE.."）"
Inst22Quest6_Note = "前置任務從提里奧．弗丁處獲得（東瘟疫之地; "..YELLOW.."7,43"..WHITE.."）。\n畫在"..YELLOW.."[10]"..WHITE.."。"
Inst22Quest6_Prequest = "救贖→遺忘的記憶→失落的榮耀→愛與家庭"
Inst22Quest6_Folgequest = "尋找米蘭達"
Inst22Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst22Quest7 = "7. 米奈希爾的禮物 (系列任務)"
Inst22Quest7_Level = "60"
Inst22Quest7_Attain = "57"
Inst22Quest7_Aim = "到斯坦索姆城裡去找到米奈希爾的禮物，把巫妖生前的遺物放在那塊邪惡的土地上。"
Inst22Quest7_Location = "萊尼德．巴薩羅梅（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."75,52"..WHITE.."）"
Inst22Quest7_Note = "前置任務從馬杜克鎮長（西瘟疫之地 - 凱爾達隆; "..YELLOW.."70,73"..WHITE.."）處獲得。\n你可以在"..YELLOW.."[19]"..WHITE.."附近找到標誌。也可以參見：通靈學院裡的"..YELLOW.."《巫妖萊斯．霜語》"..WHITE.."。"
Inst22Quest7_Prequest = "萊斯．霜語→亡靈萊斯．霜語"
Inst22Quest7_Folgequest = "米奈希爾的禮物"
Inst22Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst22Quest8 = "8. 奧里爾斯的清算"
Inst22Quest8_Level = "60"
Inst22Quest8_Attain = "56"
Inst22Quest8_Aim = "殺掉瑞文戴爾男爵。"
Inst22Quest8_Location = "奧里克斯（斯坦索姆; "..YELLOW.."[13]"..WHITE.."）"
Inst22Quest8_Note = "要開始這個任務你需要給奧里克斯 [信仰獎章]。你可以從血色區房間裡的瑪洛爾的保險箱"..YELLOW.."[7]"..WHITE.."拿到這個獎章。這個獎章並非綁定物品，你可以從其他玩家處拿取，或是自不同的副本記錄中拾取。將獎章給了奧里克斯之後，他會在對抗男爵"..YELLOW.."[19]"..WHITE.."的戰鬥中支援你的隊伍。殺死男爵後奧里克斯會出現在你的身旁，和奧里克斯談話取得任務獎勵。"
Inst22Quest8_Prequest = "無"
Inst22Quest8_Folgequest = "無"
--
Inst22Quest8name1 = "殉難者的意志"
Inst22Quest8name2 = "殉難者之血"

--Quest 9 Alliance
Inst22Quest9 = "9. 文獻管理員"
Inst22Quest9_Level = "60"
Inst22Quest9_Attain = "55"
Inst22Quest9_Aim = "在斯坦索姆城中找到血色十字軍的文獻管理員加爾福特，殺掉他，然後燒毀血色十字軍文獻。"
Inst22Quest9_Location = "尼古拉斯．瑟倫霍夫公爵（東瘟疫之地 - 聖光之願禮拜堂"..YELLOW.."76,52"..WHITE.."）"
Inst22Quest9_Note = "文獻和文獻管理員在"..YELLOW.."[10]"..WHITE.."。"
Inst22Quest9_Prequest = "無"
Inst22Quest9_Folgequest = "可怕的真相"
-- No Rewards for this quest

--Quest 10 Alliance
Inst22Quest10 = "10. 可怕的真相"
Inst22Quest10_Level = "60"
Inst22Quest10_Attain = "55"
Inst22Quest10_Aim = "將巴納札爾的頭顱交給東瘟疫之地的尼古拉斯．瑟倫霍夫公爵。"
Inst22Quest10_Location = "巴納札爾（斯坦索姆; "..YELLOW.."[11]"..WHITE.."）"
Inst22Quest10_Note = "尼古拉斯．瑟倫霍夫公爵在（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."76,52"..WHITE.."）。"
Inst22Quest10_Prequest = "文獻管理員"
Inst22Quest10_Folgequest = "超越"
Inst22Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst22Quest11 = "11. 超越"
Inst22Quest11_Level = "60"
Inst22Quest11_Attain = "55"
Inst22Quest11_Aim = "到斯坦索姆去殺掉瑞文戴爾男爵，把他的頭顱交給尼古拉斯．瑟倫霍夫公爵。"
Inst22Quest11_Location = "尼古拉斯．瑟倫霍夫公爵（東瘟疫之地 - 聖光之願禮拜堂; "..YELLOW.."76,52"..WHITE.."）"
Inst22Quest11_Note = "瑞文戴爾男爵在"..YELLOW.."[19]"..WHITE.."。任務獎勵由後續任務「銀色黎明寶箱」提供。"
Inst22Quest11_Prequest = "可怕的真相"
Inst22Quest11_Folgequest = "麥斯威爾．泰羅索斯領主→銀色黎明寶箱"
Inst22Quest11FQuest = "true"
--
Inst22Quest11name1 = "黎明防衛者"
Inst22Quest11name2 = "銀色十字軍"
Inst22Quest11name3 = "銀色復仇者"

--Quest 12 Alliance
Inst22Quest12 = "12. 逝者的請求"
Inst22Quest12_Level = "60"
Inst22Quest12_Attain = "58"
Inst22Quest12_Aim = "進入斯坦索姆，從瑞文戴爾男爵手中救出亞希達．哈莫。"
Inst22Quest12_Location = "安希恩．哈莫（東瘟疫之地 - 斯坦索姆）"
Inst22Quest12_Note = "安希恩．哈莫就站在斯坦索姆副本門口。你需要超維度幽靈顯形器才能看到安希恩．哈莫。聯盟這個任務的前置任務接自德莉亞娜（鐵爐堡 "..YELLOW.."43,52"..WHITE.."），部落的接自莫克瓦爾（奧格瑪 "..YELLOW.."38,37"..WHITE.."）。\n這個同時也是著名的45分鐘殺瑞文戴爾男爵任務。"
Inst22Quest12_Prequest = "尋找安泰恩"
Inst22Quest12_Folgequest = "生命的證據"
Inst22Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst22Quest13 = "13. 瓦薩拉克領主護符的左半塊"
Inst22Quest13_Level = "60"
Inst22Quest13_Attain = "60"
Inst22Quest13_Aim = "使用召喚火盆召喚出賈林和索索斯的靈魂，然後殺掉他們。完成之後，將召喚火盆與瓦薩拉克領主護符的左半塊還給黑石山的布德利。"
Inst22Quest13_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖中的[D]"..WHITE.."）"
Inst22Quest13_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n在"..YELLOW.."[11]"..WHITE.."召喚賈林和索索斯。"
Inst22Quest13_Prequest = "重要的材料"
Inst22Quest13_Folgequest = "奧卡茲島在你前方…… "
Inst22Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst22Quest14 = "14. 瓦薩拉克領主護符的右半塊"
Inst22Quest14_Level = "60"
Inst22Quest14_Attain = "60"
Inst22Quest14_Aim = "使用召喚火盆召喚出賈林和索索斯的靈魂，然後殺掉他們。完成之後，帶著重新組合的瓦薩拉克領主護符和召喚火盆回到黑石山的布德利那裡。"
Inst22Quest14_Location = "布德利（黑石山; "..YELLOW.."副本入口地圖中的[D]"..WHITE.."）"
Inst22Quest14_Note = "你需要超維度幽靈顯形器才能看到布德利。你可以從《尋找安泰恩》任務得到它。\n\n在"..YELLOW.."[11]"..WHITE.."召喚賈林和索索斯。"
Inst22Quest14_Prequest = "更多重要的材料"
Inst22Quest14_Folgequest = "最後的準備（"..YELLOW.."[黑石塔上層]"..WHITE.."）"
Inst22Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst22Quest15 = "15. 阿泰絲，守護者之杖"
Inst22Quest15_Level = "60"
Inst22Quest15_Attain = "60"
Inst22Quest15_Aim = "塔納利斯時光之穴的安納克羅斯要你帶著阿泰絲，守護者之杖前往斯坦索姆，在聖化之地上使用它。擊敗從法杖內被驅除的生物，然後回到安納克羅斯那裡去。 "
Inst22Quest15_Location = "安納克羅斯（塔納利斯 - 時光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst22Quest15_Note = "召喚位置在"..YELLOW.."[2]"..WHITE.."。隨著資料片–巫妖王之怒的開放，玩家們將無法再接受這個任務；而在巫妖王之怒開放前已經進行至最後一步，並且擁有召喚物品可以召喚阿泰絲的玩家則不在此限。"
Inst22Quest15_Prequest = "有"
Inst22Quest15_Folgequest = "無"
Inst22Quest15PreQuest = "true"
--
Inst22Quest15name1 = "阿泰絲，守護者之杖"
Inst22Quest15name2 = "阿泰絲，守護者之杖"
Inst22Quest15name3 = "阿泰絲，守護者之杖"
Inst22Quest15name4 = "阿泰絲，守護者之杖"

--Quest 16 Alliance
Inst22Quest16 = "16. 腐蝕 (鑄劍大師任務)"
Inst22Quest16_Level = "60"
Inst22Quest16_Attain = "50"
Inst22Quest16_Aim = "在斯坦索姆找到黑衣守衛鑄劍師，然後殺死他。將黑色衛士徽記交給亡靈殺手瑟里爾。"
Inst22Quest16_Location = "亡靈殺手瑟里爾（冬泉谷 - 永望鎮; "..YELLOW.."61,37"..WHITE.."）"
Inst22Quest16_Note = "在"..YELLOW.."[15]"..WHITE.."開啟地板上的鍛造圖以召喚黑衣守衛鑄劍師。"
Inst22Quest16_Prequest = "無"
Inst22Quest16_Folgequest = "無"
--
Inst22Quest16name1 = "設計圖：閃耀輕劍 "

--Quest 17 Alliance
Inst22Quest17 = "17. 甜美的平靜 (鑄錘大師任務)"
Inst22Quest17_Level = "60"
Inst22Quest17_Attain = "51"
Inst22Quest17_Aim = "到斯坦索姆去殺死紅衣鑄錘師。將紅衣鑄錘師的圍裙交給莉莉絲。"
Inst22Quest17_Location = "輕盈的莉莉絲（冬泉谷 - 永望鎮; "..YELLOW.."61,37"..WHITE.."）"
Inst22Quest17_Note = "在"..YELLOW.."[8]"..WHITE.."開啟地板上的鍛造圖以召喚紅衣鑄錘師。"
Inst22Quest17_Prequest = "無"
Inst22Quest17_Folgequest = "無"
--
Inst22Quest17name1 = "設計圖：魔法戰錘"

--Quest 18 Alliance
Inst22Quest18 = "18. 光與影的平衡 (牧師史詩任務)"
Inst22Quest18_Level = "60"
Inst22Quest18_Attain = "60"
Inst22Quest18_Aim = "牧師，你將要經歷一嚴格的試煉，它將檢驗你學過的所有技能。在總計有15個農夫被殺死之前拯救50個農夫逃離死亡的魔掌。完成任務之後與艾瑞斯．哈文法談談。\n你可以通過瀏覽死亡佈告來瞭解自己拯救了多少農夫。"
Inst22Quest18_Location = "艾瑞斯．哈文法（東瘟疫之地 - 斯坦索姆; "..YELLOW.."17,14"..WHITE.."）"
Inst22Quest18_Note = "如果要看到艾瑞斯．哈文法和接到任務，你需要神聖之眼（火焰之王的寶箱開出，在"..YELLOW.."[熔火之心]"..WHITE.."）。\n\n完成任務後，將神聖之眼、暗影之眼（冬泉谷南邊和詛咒之地南邊的惡魔類怪物都有機會掉落）和諾達希爾碎片組合，將得到牧師史詩法杖——祈福。"
Inst22Quest18_Prequest = "警示"
Inst22Quest18_Folgequest = "無"
Inst22Quest18PreQuest = "true"
--
Inst22Quest18name1 = "諾達希爾碎片"


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
Inst22Quest18_HORDE = "18. 拉姆斯登"
Inst22Quest18_HORDE_Level = "60"
Inst22Quest18_HORDE_Attain = "56"
Inst22Quest18_HORDE_Aim = "到斯坦索姆去，殺掉吞嚥者拉姆斯登。把他的頭顱交給納薩諾斯。"
Inst22Quest18_HORDE_Location = "納薩諾斯．凋零者（東瘟疫之地 - 瑪瑞斯農場; "..YELLOW.."22,68"..WHITE.."）"
Inst22Quest18_HORDE_Note = "前置任務也是從他這裡接。拉姆斯登在"..YELLOW.."[18]"..WHITE.."。"
Inst22Quest18_HORDE_Prequest = "遊俠之王的命令→討厭的蝙蝠→暗翼蝠"
Inst22Quest18_HORDE_Folgequest = "無"
Inst22Quest18PreQuest_HORDE = "true"
--
Inst22Quest18name1_HORDE = "阿萊希斯皇家徽印"
Inst22Quest18name2_HORDE = "元素之環"

--Quest 19 Horde  (same as Quest 18 Alliance)
Inst22Quest19_HORDE = "19. 光與影的平衡 (牧師史詩任務)"
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
Inst22Quest20_HORDE = "20. 聖光真正的主人 (聖騎士戰馬任務)"
Inst22Quest20_HORDE_Level = "60"
Inst22Quest20_HORDE_Attain = "60"
Inst22Quest20_HORDE_Aim = "在阿隆索斯教堂的永恆火焰旁使用混合物撲滅劑來移除聖光的防護。準備和任何要保衛教堂的人作戰。"
Inst22Quest20_HORDE_Location = "索拉納爾．血怒領主（銀月城 - 旅行者廣場; "..YELLOW.."92.2, 38.7"..WHITE.."）"
Inst22Quest20_HORDE_Note = "阿隆索斯教堂在"..YELLOW.."[13]"..WHITE.."，完成此任務之後將會給予聖騎士專屬的史詩戰馬。如果你已經在61級的時候自訓練師處習得召喚史詩戰馬，那麼你將無法進行這個任務。"
Inst22Quest20_HORDE_Prequest = "索拉納爾領主的召喚→大師之路→承諾的手勢→展現忠誠→聖光真正的主人"
Inst22Quest20_HORDE_Folgequest = "無"
Inst22Quest20PreQuest_HORDE = "true"
--
Inst22Quest20name1_HORDE = "血騎士外袍"



--------------- INST23 - The Ruins of Ahn'Qiraj (AQ20) ---------------

Inst23Story = "在流沙之戰最後幾個小時裡，四龍與夜精靈的聯軍將戰場逼至其拉帝國的最中心，希利蘇斯的異種蟲群退敗至最終堡壘「安其拉城」。但在安其拉之門內，等待著的卻是更大規模的其拉異種蟲，數量是卡林多聯軍所無法想像的。經過漫長的戰役，卡林多聯軍仍然無法擊敗其拉帝王以及他的異種蟲群，只能以一個強大的魔法結界將它們困禁在內，而安其拉城也因為戰火而成了一個被詛咒的廢墟。經過了數千年，其拉的侵略心卻沒有因為結界而消退。新一代的異種蟲從巢穴中慢慢的破繭而出，安其拉廢墟又再度充滿其拉異種蟲。這股威脅一定要被消滅，否則艾澤拉斯將可能會被這股恐怖的新世代其拉勢力給毀滅。"
Inst23Caption = "安其拉廢墟"
Inst23QAA = "2 個任務"
Inst23QAH = "2 個任務"

--Quest 1 Alliance
Inst23Quest1 = "1. 奧斯里安的隕落"
Inst23Quest1_Level = "60"
Inst23Quest1_Attain = "60"
Inst23Quest1_Aim = "將無疤者奧斯里安的頭顱帶到希利蘇斯給塞納里奧城堡的指揮官瑪爾利斯。"
Inst23Quest1_Location = "無疤者奧斯里安的頭顱（無疤者奧斯里安掉落 - 安其拉廢墟; "..YELLOW.."[6]"..WHITE.."）"
Inst23Quest1_Note = "指揮官瑪爾利斯（希利蘇斯 - 塞納里奧城堡; "..YELLOW.."49,34"..WHITE.."）"
Inst23Quest1_Prequest = "無"
Inst23Quest1_Folgequest = "無"
--
Inst23Quest1name1 = "流沙符咒"
Inst23Quest1name2 = "流沙咒符"
Inst23Quest1name3 = "流沙頸飾"
Inst23Quest1name4 = "流沙墜飾"

--Quest 2 Alliance
Inst23Quest2 = "2. 完美的毒藥"
Inst23Quest2_Level = "60"
Inst23Quest2_Attain = "60"
Inst23Quest2_Aim = "塞納里奧城堡的德爾克．雷木要你去幫他取回溫諾希斯的毒囊和庫林納克斯的毒囊"
Inst23Quest2_Location = "德爾克．雷木（希利蘇斯 - 塞納里奧城堡; "..YELLOW.."52,39"..WHITE.."）"
Inst23Quest2_Note = "高階祭司溫諾希斯"..YELLOW.."祖爾格拉布[2]"..WHITE.."掉落溫諾希斯的毒囊。庫林納克斯"..YELLOW.."安其拉廢墟[1]"..WHITE.."掉落庫林納克斯的毒囊。"
Inst23Quest2_Prequest = "無"
Inst23Quest2_Folgequest = "無"
--
Inst23Quest2name1 = "拉文霍德分割者"
Inst23Quest2name2 = "施夫帕奇的剃刃"
Inst23Quest2name3 = "雷木火鉗"
Inst23Quest2name4 = "達姆魯斯的精華"
Inst23Quest2name5 = "法拉德的裝填器"
Inst23Quest2name6 = "西蒙妮的耕作之錘"


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

Inst24Story = "暴風城監獄是位於暴風城運河區戒備森嚴的牢房。那裡由典獄官塞爾沃特看守著，監獄是那些大惡棍、政治犯、殺人犯和許多最危險的罪犯的收容處。最近，由囚犯發起的異常暴動導致了監獄的混亂——所有的守衛都被趕了出來，裡面的罪犯可以自由的活動。典獄官塞爾沃特試圖控制局面，並召集勇敢的冒險者進入監獄殺死暴動的主腦——那個狡猾的巴吉爾．特雷德。"
Inst24Caption = "監獄"
Inst24QAA = "6 個任務"
Inst24QAH = "無任務"

--Quest 1 Alliance
Inst24Quest1 = "1. 伸張正義"
Inst24Quest1_Level = "25"
Inst24Quest1_Attain = "22"
Inst24Quest1_Aim = "把塔高爾的頭顱帶給湖畔鎮的衛兵伯爾頓。"
Inst24Quest1_Location = "衛兵伯爾頓（赤脊山 - 湖畔鎮; "..YELLOW.."26,46 "..WHITE.."）"
Inst24Quest1_Note = "你可以在"..YELLOW.."[1]"..WHITE.."找到塔高爾。"
Inst24Quest1_Prequest = "無"
Inst24Quest1_Folgequest = "無"
--
Inst24Quest1name1 = "磷鋁長劍"
Inst24Quest1name2 = "硬根法杖"

--Quest 2 Alliance
Inst24Quest2 = "2. 罪與罰"
Inst24Quest2_Level = "26"
Inst24Quest2_Attain = "22"
Inst24Quest2_Aim = "夜色鎮的米爾斯迪普議員要你殺死迪克斯特．瓦德，並把他的手帶回來作為證明。"
Inst24Quest2_Location = "米爾斯迪普議員（暮色森林 - 夜色鎮; "..YELLOW.."72,47 "..WHITE.."）"
Inst24Quest2_Note = "你可以在"..YELLOW.."[5]"..WHITE.."找到迪克斯特．瓦德。"
Inst24Quest2_Prequest = "無"
Inst24Quest2_Folgequest = "無"
--
Inst24Quest2name1 = "大使的靴子"
Inst24Quest2name2 = "夜色郡鎖甲護腿"

--Quest 3 Alliance
Inst24Quest3 = "3. 鎮壓暴動"
Inst24Quest3_Level = "26"
Inst24Quest3_Attain = "22"
Inst24Quest3_Aim = "暴風城的典獄官塞爾沃特要求你殺死監獄中的10名迪菲亞囚徒、8名迪菲亞罪犯和8名迪菲亞叛軍。"
Inst24Quest3_Location = "典獄官塞爾沃特（暴風城 - 監獄; "..YELLOW.."51,68 "..WHITE.."）"
Inst24Quest3_Note = "副本外的典獄官會給你這個任務。"
Inst24Quest3_Prequest = "無"
Inst24Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst24Quest4 = "4. 鮮血的顏色"
Inst24Quest4_Level = "26"
Inst24Quest4_Attain = "22"
Inst24Quest4_Aim = "暴風城的尼科瓦．拉斯克要你取得10條紅色毛紡面罩。"
Inst24Quest4_Location = "尼科瓦．拉斯克（暴風城 - 舊城區; "..YELLOW.."75,62 "..WHITE.."）"
Inst24Quest4_Note = "副本裡每個敵人都可能掉落面罩。"
Inst24Quest4_Prequest = "無"
Inst24Quest4_Folgequest = "無"
-- No Rewards for this quest

--Quest 5 Alliance
Inst24Quest5 = "5. 積怒已久"
Inst24Quest5_Level = "27"
Inst24Quest5_Attain = "25"
Inst24Quest5_Aim = "丹莫德的莫特雷．加瑪森要求你把卡姆．深怒的頭顱交給他。"
Inst24Quest5_Location = "莫特雷．加瑪森（濕地 - 丹莫德; "..YELLOW.."49,18 "..WHITE.."）"
Inst24Quest5_Note = "前置任務也從莫特雷．加瑪森處得到。你可以在"..YELLOW.."[2]"..WHITE.."找到卡姆．深怒。"
Inst24Quest5_Prequest = "黑鐵戰爭"
Inst24Quest5_Folgequest = "無"
Inst24Quest5PreQuest = "true"
--
Inst24Quest5name1 = "辯護腰帶 "
Inst24Quest5name2 = "碎頭者"

--Quest 6 Alliance
Inst24Quest6 = "6. 監獄暴動 (系列任務)"
Inst24Quest6_Level = "29"
Inst24Quest6_Attain = "16"
Inst24Quest6_Aim = "殺死巴基爾．斯瑞德，把他的頭帶給監獄的典獄官塞爾沃特。"
Inst24Quest6_Location = "典獄官塞爾沃特（暴風城 - 監獄; "..YELLOW.."51,68 "..WHITE.."）"
Inst24Quest6_Note = "前置任務詳情請參見"..YELLOW.."《死亡礦坑─迪菲亞兄弟會》"..WHITE..".。\n巴基爾．斯瑞德在"..YELLOW.."[4]"..WHITE.."。"
Inst24Quest6_Prequest = "未寄出的信→巴吉爾．特雷德"
Inst24Quest6_Folgequest = "好奇的訪客"
Inst24Quest6PreQuest = "true"
-- No Rewards for this quest



--------------- INST25 - Sunken Temple (ST) ---------------

Inst25Story = "在一千年前，強大的古拉巴什王國被一次大型內部戰爭所毀滅。一部份被稱為阿塔萊的食人妖牧師試圖將名為靈魂掠奪者哈卡的古代血神帶回這個世界。雖然這些牧師最後被擊敗並遭到流放，但這個偉大的王國仍然變得四分五裂。被流放的牧師逃到了北方，來到了悲傷沼澤。他們為哈卡建立了一座偉大的神廟——在那裡他們期望能夠把哈卡重新帶回世間。當偉大的守護神龍伊瑟拉知道了阿塔萊的計劃，便將神廟摧毀並沉入沼澤之中。直到今天，神廟沉沒的遺跡被綠龍所守衛並阻止任何人進出。然而，人們相信有些阿塔萊食人妖從伊瑟拉的怒火中幸存下來，並再此將自己奉獻與於活哈卡的事業中。"
Inst25Caption = "沉沒的神廟"
Inst25QAA = "17 個任務"
Inst25QAH = "17 個任務"

--Quest 1 Alliance
Inst25Quest1 = "1. 進入阿塔哈卡神廟"
Inst25Quest1_Level = "50"
Inst25Quest1_Attain = "38"
Inst25Quest1_Aim = "為暴風城的布羅哈恩．鐵桶收集10塊阿塔萊石板。"
Inst25Quest1_Location = "布羅哈恩．鐵桶（暴風城 - 矮人區; "..YELLOW.."69,40"..WHITE.."）"
Inst25Quest1_Note = "前置任務在此領取。\n\n石板你在神廟內外到處都能見到。"
Inst25Quest1_Prequest = "調查神廟→前往辛特蘭→獅鷲獸管理員沙拉克．鷹斧→拉普索迪．鐵鏟→拉普索迪的卡林多雞尾酒→拉普索迪的故事"
Inst25Quest1_Folgequest = "無"
Inst25Quest1PreQuest = "true"
--
Inst25Quest1name1 = "守護之符"

--Quest 2 Alliance
Inst25Quest2 = "2. 沉沒的神廟"
Inst25Quest2_Level = "51"
Inst25Quest2_Attain = "46"
Inst25Quest2_Aim = "到塔納利斯找到瑪爾馮．瑞文斯克。"
Inst25Quest2_Location = "安吉拉斯．月風（菲拉斯 - 羽月要塞; "..YELLOW.."31,45"..WHITE.."）"
Inst25Quest2_Note = "你可以在"..YELLOW.."52,45"..WHITE.."處找到瑪爾馮．瑞文斯克。"
Inst25Quest2_Prequest = "無"
Inst25Quest2_Folgequest = "石環"
-- No Rewards for this quest

--Quest 3 Alliance
Inst25Quest3 = "3. 深入神廟"
Inst25Quest3_Level = "51"
Inst25Quest3_Attain = "46"
Inst25Quest3_Aim = "在悲傷沼澤沉沒的神廟中找到哈卡祭壇。"
Inst25Quest3_Location = "瑪爾馮．瑞文斯克（塔納利斯 - 破碎石柱; "..YELLOW.."52,45"..WHITE.."）"
Inst25Quest3_Note = "祭壇就在圖中"..YELLOW.."[1]"..WHITE.."的位置。"
Inst25Quest3_Prequest = "石環"
Inst25Quest3_Folgequest = "無"
Inst25Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst25Quest4 = "4. 雕像群的秘密"
Inst25Quest4_Level = "51"
Inst25Quest4_Attain = "46"
Inst25Quest4_Aim = "到沉沒的神廟去，揭開雕像群中隱藏的秘密。"
Inst25Quest4_Location = "瑪爾馮．瑞文斯克（塔納利斯 - 破碎石柱; "..YELLOW.."52,45"..WHITE.."）"
Inst25Quest4_Note = "雕像群就在圖中"..YELLOW.."[1]"..WHITE.."的周圍，按照地圖指示"..YELLOW.."[1']"..WHITE.."至"..YELLOW.."[6']"..WHITE.."的順序打開他們。"
Inst25Quest4_Prequest = "深入神廟"
Inst25Quest4_Folgequest = "無"
Inst25Quest4FQuest = "true"
--
Inst25Quest4name1 = "哈卡萊骨灰"

--Quest 5 Alliance
Inst25Quest5 = "5. 邪惡之霧"
Inst25Quest5_Level = "52"
Inst25Quest5_Attain = "47"
Inst25Quest5_Aim = "收集5份阿塔萊之霧的樣本，然後向安戈洛環形山的莫爾金覆命。"
Inst25Quest5_Location = "格雷甘．山酒（菲拉斯 - 雙塔山; "..YELLOW.."45,25"..WHITE.."）"
Inst25Quest5_Note = "前置任務《莫爾金和拉瑞安》開始於莫爾金（安戈洛環形山 - 馬紹爾營地; "..YELLOW.."42,9"..WHITE.."）。你可以從阿塔哈卡神廟裡的神廟深淵潛伏者、黑暗蟲或者融合軟泥怪那裡得到阿塔萊之霧。"
Inst25Quest5_Prequest = "莫爾金和拉瑞安→造訪格雷甘"
Inst25Quest5_Folgequest = "無"
Inst25Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst25Quest6 = "6. 神靈哈卡 (系列任務)"
Inst25Quest6_Level = "53"
Inst25Quest6_Attain = "40"
Inst25Quest6_Aim = "將裝滿的哈卡之卵交給塔納利斯的葉基亞。"
Inst25Quest6_Location = "葉基亞（塔納利斯 - 熱砂港; "..YELLOW.."66,22"..WHITE.."）"
Inst25Quest6_Note = "此系列任務始於《尖嘯者的靈魂》（同樣在此領取，詳見"..YELLOW.."[祖爾法拉克]"..WHITE.."）。\n你必須在"..YELLOW.."[3]"..WHITE.."使用哈卡之卵觸發事件。一旦事件開始，敵人會像潮水般湧出來攻擊你。其中的哈卡萊護血者會掉落哈卡萊之血。用這些血液熄滅包含哈卡靈魂能量的不滅火焰。當你熄滅所有的火焰時，哈卡的化身就可以進入我們的世界了。"
Inst25Quest6_Prequest = "尖嘯者的靈魂→遠古之卵"
Inst25Quest6_Folgequest = "無"
Inst25Quest6PreQuest = "true"
--
Inst25Quest6name1 = "灰岩頭盔"
Inst25Quest6name2 = "生命之力短劍"
Inst25Quest6name3 = "珠光頭環"

--Quest 7 Alliance
Inst25Quest7 = "7. 『預言者』迦瑪蘭"
Inst25Quest7_Level = "53"
Inst25Quest7_Attain = "38"
Inst25Quest7_Aim = "辛特蘭的阿塔萊流放者要你給他帶回迦瑪蘭的頭。"
Inst25Quest7_Location = "阿塔萊流放者（辛特蘭 - 沙德拉洛; "..YELLOW.."33,75"..WHITE.."）"
Inst25Quest7_Note = "你可以在"..YELLOW.."[4]"..WHITE.."找到迦瑪蘭。"
Inst25Quest7_Prequest = "無"
Inst25Quest7_Folgequest = "無"
--
Inst25Quest7name1 = "雨行護腿"
Inst25Quest7name2 = "流放者頭盔"

--Quest 8 Alliance
Inst25Quest8 = "8. 伊蘭尼庫斯精華"
Inst25Quest8_Level = "55"
Inst25Quest8_Attain = "48"
Inst25Quest8_Aim = "把伊蘭尼庫斯精華放在精華之泉裡，精華之泉就在沉沒的神廟中，伊蘭尼庫斯的巢穴裡。"
Inst25Quest8_Location = "伊蘭尼庫斯精華（伊蘭尼庫斯的陰影掉落 - 沉沒的神廟; "..YELLOW.."[6]"..WHITE.."）"
Inst25Quest8_Note = "伊蘭尼庫斯精華要打敗伊蘭尼庫斯的陰影之後才會掉落。你可以在"..YELLOW.."[6]"..WHITE.."找到他，精華之泉就在他身後。"
Inst25Quest8_Prequest = "無"
Inst25Quest8_Folgequest = "無"
--
Inst25Quest8name1 = "被禁錮的伊蘭尼庫斯精華"

--Quest 9 Alliance
Inst25Quest9 = "9. 巨魔的羽毛 (術士職業任務)"
Inst25Quest9_Level = "52"
Inst25Quest9_Attain = "50"
Inst25Quest9_Aim = "到沉沒的神廟去，從食人妖們身上獲得6支巫毒羽毛。"
Inst25Quest9_Location = "伊普斯（費伍德森林 - 血毒瀑布; "..YELLOW.."42,45"..WHITE.."）"
Inst25Quest9_Note = "術士職業任務。6個哈卡萊防禦者"..YELLOW.."[C]"..WHITE.."每隻各掉一個羽毛。"
Inst25Quest9_Prequest = "小鬼的要求→奇怪的材料"
Inst25Quest9_Folgequest = "無"
Inst25Quest9PreQuest = "true"
--
Inst25Quest9name1 = "靈魂收割者"
Inst25Quest9name2 = "深淵碎片"
Inst25Quest9name3 = "束縛長袍"

--Quest 10 Alliance
Inst25Quest10 = "10. 巫毒羽毛 (戰士職業任務)"
Inst25Quest10_Level = "52"
Inst25Quest10_Attain = "50"
Inst25Quest10_Aim = "將你從沉沒的神廟的食人妖身上得到的巫毒羽毛交給部落英雄的靈魂。"
Inst25Quest10_Location = "部落英雄的靈魂（塵泥沼澤; "..YELLOW.."34,66"..WHITE.."）"
Inst25Quest10_Note = "戰士職業任務。6個哈卡萊防禦者"..YELLOW.."[C]"..WHITE.."每隻各掉一個羽毛。"
Inst25Quest10_Prequest = "困擾的靈魂→影誓者之戰"
Inst25Quest10_Folgequest = "無"
Inst25Quest10PreQuest = "true"
--
Inst25Quest10name1 = "怒火面甲"
Inst25Quest10name2 = "鑽石水瓶"
Inst25Quest10name3 = "刺鋼護肩"

--Quest 11 Alliance
Inst25Quest11 = "11. 巫毒之術 (薩滿職業任務)"
Inst25Quest11_Level = "52"
Inst25Quest11_Attain = "50"
Inst25Quest11_Aim = "將巫毒羽毛交給捕風者巴斯拉。"
Inst25Quest11_Location = "捕風者巴斯拉（奧特蘭克山脈 - 冰風崗哨; "..YELLOW.."80,67"..WHITE.."）"
Inst25Quest11_Note = "薩滿職業任務。6個哈卡萊防禦者"..YELLOW.."[C]"..WHITE.."每隻各掉一個羽毛。"
Inst25Quest11_Prequest = "元素專精→靈魂圖騰"
Inst25Quest11_Folgequest = "無"
Inst25Quest11PreQuest = "true"
--
Inst25Quest11name1 = "藍銅之拳"
Inst25Quest11name2 = "被迷惑的水之靈"
Inst25Quest11name3 = "荒野之杖"

--Quest 12 Alliance
Inst25Quest12 = "12. 更好的材料 (德魯伊職業任務)"
Inst25Quest12_Level = "52"
Inst25Quest12_Attain = "50"
Inst25Quest12_Aim = "從沉沒的神廟底部的守衛身上得到一些腐爛藤蔓，把它們交給托爾瓦．尋路者。"
Inst25Quest12_Location = "托爾瓦．尋路者（安戈洛環形山; "..YELLOW.."72,76"..WHITE.."）"
Inst25Quest12_Note = "德魯伊職業任務。腐爛藤蔓掉落自召喚出來的阿塔拉利恩"..YELLOW.."[1]"..WHITE.."，必須正確的按照地圖所標示的順序破解雕像群的秘密。"
Inst25Quest12_Prequest = "托爾瓦．尋路者→毒性測試"
Inst25Quest12_Folgequest = "無"
Inst25Quest12PreQuest = "true"
--
Inst25Quest12name1 = "灰色毛皮"
Inst25Quest12name2 = "森林的擁抱"
Inst25Quest12name3 = "月影手杖"

--Quest 13 Alliance
Inst25Quest13 = "13. 神廟中的綠龍 (獵人職業任務)"
Inst25Quest13_Level = "52"
Inst25Quest13_Attain = "50"
Inst25Quest13_Aim = "將摩弗拉斯的牙齒交給艾薩拉的奧汀克。他住在埃達拉斯廢墟東北部懸崖的頂端。"
Inst25Quest13_Location = "奧汀克（艾薩拉 - 埃達拉斯廢墟; "..YELLOW.."42,43"..WHITE.."）"
Inst25Quest13_Note = "獵人職業任務。摩弗拉斯在"..YELLOW.."[5]"..WHITE.."。"
Inst25Quest13_Prequest = "獵人的護符→碎浪多頭怪"
Inst25Quest13_Folgequest = "無"
Inst25Quest13PreQuest = "true"
--
Inst25Quest13name1 = "狩獵長矛"
Inst25Quest13name2 = "魔暴龍眼"
Inst25Quest13name3 = "魔暴龍牙"

--Quest 14 Alliance
Inst25Quest14 = "14. 消滅摩弗拉斯 (法師職業任務)"
Inst25Quest14_Level = "52"
Inst25Quest14_Attain = "50"
Inst25Quest14_Aim = "從摩弗拉斯身上取回秘法裂片，然後返回大法師克希雷姆那兒。"
Inst25Quest14_Location = "大法師克希雷姆（艾薩拉; "..YELLOW.."29,40"..WHITE.."）"
Inst25Quest14_Note = "法師職業任務。摩弗拉斯在"..YELLOW.."[5]"..WHITE.."。"
Inst25Quest14_Prequest = "法師的會見→納迦的珊瑚"
Inst25Quest14_Folgequest = "無"
Inst25Quest14PreQuest = "true"
--
Inst25Quest14name1 = "冰川之矛"
Inst25Quest14name2 = "秘法水晶墜飾"
Inst25Quest14name3 = "火焰寶石"

--Quest 15 Alliance
Inst25Quest15 = "15. 摩弗拉斯之血 (牧師職業任務)"
Inst25Quest15_Level = "52"
Inst25Quest15_Attain = "50"
Inst25Quest15_Aim = "前往沉沒的阿塔哈卡神廟，殺死綠龍摩弗拉斯，將他的血液交給費伍德森林中的格雷塔．苔蹄。沉沒的神廟的入口就在悲傷沼澤中。"
Inst25Quest15_Location = "奧汀克（艾薩拉 - 埃達拉斯廢墟; "..YELLOW.."42,43"..WHITE.."）"
Inst25Quest15_Note = "牧師職業任務。摩弗拉斯在"..YELLOW.."[5]"..WHITE.."。格雷塔．苔蹄在（費伍德森林 - 翡翠聖地; "..YELLOW.."51,82"..WHITE.."）。"
Inst25Quest15_Prequest = "塞納里奧議會的求助→亡靈的腐液"
Inst25Quest15_Folgequest = "無"
Inst25Quest15PreQuest = "true"
--
Inst25Quest15name1 = "受祝福的祈禱珠串"
Inst25Quest15name2 = "悲哀之杖"
Inst25Quest15name3 = "希望之環"

--Quest 16 Alliance
Inst25Quest16 = "16. 蒼藍鑰匙 (盜賊職業任務)"
Inst25Quest16_Level = "52"
Inst25Quest16_Attain = "50"
Inst25Quest16_Aim = "將碧藍鑰匙交給喬拉齊．拉文霍德公爵。"
Inst25Quest16_Location = " 大法師克希雷姆（艾薩拉; "..YELLOW.."29,40"..WHITE.."）"
Inst25Quest16_Note = "盜賊職業任務。摩弗拉斯"..YELLOW.."[5]"..WHITE.."掉落鑰匙。喬拉齊．拉文霍德公爵在（奧特蘭克山谷 - 拉文霍德莊園; "..YELLOW.."86,79"..WHITE.."）。"
Inst25Quest16_Prequest = "簡單的要求→密文碎片"
Inst25Quest16_Folgequest = "無"
Inst25Quest16PreQuest = "true"
--
Inst25Quest16name1 = "黑檀面具"
Inst25Quest16name2 = "耳語長靴"
Inst25Quest16name3 = "暗色蝠披氅"

--Quest 17 Alliance
Inst25Quest17 = "17. 鑄造力量之石 (聖騎士職業任務)"
Inst25Quest17_Level = "52"
Inst25Quest17_Attain = "50"
Inst25Quest17_Aim = "將巫毒羽毛帶給阿胥拉姆．瓦羅菲斯特。"
Inst25Quest17_Location = "指揮官阿胥拉姆．瓦羅菲斯特（西瘟疫之地 - 寒風營地; "..YELLOW.."43,85"..WHITE.."）"
Inst25Quest17_Note = "聖騎士職業任務。6個哈卡萊防禦者"..YELLOW.."[C]"..WHITE.."每隻各掉一個羽毛。"
Inst25Quest17_Prequest = "冰風營地→惰性天譴石"
Inst25Quest17_Folgequest = "無"
Inst25Quest17PreQuest = "true"
--
Inst25Quest17name1 = "神聖力量之石"
Inst25Quest17name2 = "光鑄利刃"
Inst25Quest17name3 = "神聖寶珠"
Inst25Quest17name4 = "禮節徽記"


--Quest 1 Horde
Inst25Quest1_HORDE = "1. 阿塔哈卡神廟"
Inst25Quest1_HORDE_Level = "50"
Inst25Quest1_HORDE_Attain = "38"
Inst25Quest1_HORDE_Aim = "收集20個哈卡神像，把它們帶給斯通納德的費澤魯爾。"
Inst25Quest1_HORDE_Location = "費澤魯爾（悲傷沼澤 - 斯通納德; "..YELLOW.."47,54"..WHITE.."）"
Inst25Quest1_HORDE_Note = "神廟裡的所有敵人都會掉落哈卡神像。"
Inst25Quest1_HORDE_Prequest = "惡魔之犬→救贖→遺忘的記憶→失落的榮耀→悔恨的戰士→淚水之池→阿塔萊流放者→向費澤魯爾覆命"
Inst25Quest1_HORDE_Folgequest = "無"
Inst25Quest1PreQuest_HORDE = "true"
--
Inst25Quest1name1_HORDE = "守護之符"

--Quest 2 Horde
Inst25Quest2_HORDE = "2. 沉沒的神廟"
Inst25Quest2_HORDE_Level = "51"
Inst25Quest2_HORDE_Attain = "46"
Inst25Quest2_HORDE_Aim = "到塔納利斯找到瑪爾馮．瑞文斯克。"
Inst25Quest2_HORDE_Location = "巫醫尤克里（菲拉斯 - 莫沙徹營地; "..YELLOW.."74,43"..WHITE.."）"
Inst25Quest2_HORDE_Note = "瑪爾馮．瑞文斯克的位置在"..YELLOW.."52,45"..WHITE.."。"
Inst25Quest2_HORDE_Prequest = "無"
Inst25Quest2_HORDE_Folgequest = "石環"

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
Inst25Quest5_HORDE = "5. 除草器的燃料"
Inst25Quest5_HORDE_Level = "52"
Inst25Quest5_HORDE_Attain = "47"
Inst25Quest5_HORDE_Aim = "收集5份阿塔萊之霧的樣本，然後將它們送到馬紹爾營地的拉瑞安那裡。"
Inst25Quest5_HORDE_Location = "莉芙．雷茲菲克斯（貧瘠之地 - 棘齒城; "..YELLOW.."62,38"..WHITE.."）"
Inst25Quest5_HORDE_Note = "前置任務《拉瑞安和莫爾金》開始於拉瑞安（安戈洛環形山 - 馬紹爾營地; "..YELLOW.."45,8"..WHITE.."）。沉沒的神廟裡的神廟深淵潛伏者、黑暗蟲和軟泥怪身上都有阿塔萊之霧。"
Inst25Quest5_HORDE_Prequest = "拉瑞安和莫爾金→瑪爾馮的車間"
Inst25Quest5_HORDE_Folgequest = "無"
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
Inst25Quest17_HORDE = "17. 古老的禍害 (聖騎士職業任務)"
Inst25Quest17_HORDE_Level = "52"
Inst25Quest17_HORDE_Attain = "50"
Inst25Quest17_HORDE_Aim = "揭開阿塔哈卡神廟的秘密，釋放阿塔拉利恩並擊敗他，從他的屍體上取走腐爛藤蔓。完成任務之後向亡靈壁壘的麥拉．黎明之刃覆命。"
Inst25Quest17_HORDE_Location = "希瓦娜斯．風行者（幽暗城 - 皇家區; "..YELLOW.."59,94"..WHITE.."）"
Inst25Quest17_HORDE_Note = "聖騎士職業任務。腐爛藤蔓掉落自召喚出來的阿塔拉利恩"..YELLOW.."[1]"..WHITE.."，必須正確的按照地圖所標示的順序破解雕像群的秘密。麥拉．黎明之刃在（提瑞斯法林地 - 亡靈壁壘; "..YELLOW.."83,71"..WHITE.."）。"
Inst25Quest17_HORDE_Prequest = "前往亡靈壁壘→復仇的証明→女妖之王的智慧"
Inst25Quest17_HORDE_Folgequest = "無"
Inst25Quest17PreQuest_HORDE = "true"
--
Inst25Quest17name1_HORDE = "天譴剋星"



--------------- INST26 - The Temple of Ahn'Qiraj (AQ40) ---------------

Inst26Story = "安其拉中心聳立著一座古老神廟綜合體。它在史前時代就被建造，用以紀念偉大的古神與供應其拉異種蟲繁衍茁壯。自數千年前的流沙之戰結束後，其拉帝國的雙子帝王就被青銅龍安納克羅斯和夜精靈們以強大的魔法結界困在神廟裡。隨著時間流逝，流沙權杖已被重組，魔法結界上的封印也逐漸消失，通往安其拉神廟深處的道路也再度敞開。那些被困在神廟底下蠢蠢欲動的其拉異種軍團開始準備入侵。為了避免第二次流沙之戰再度爆發、貪婪的蟲群再次於卡林多大陸傾巢而出，無論如何一定要阻止它們！"
Inst26Caption = "安其拉神廟"
Inst26QAA = "4 個任務"
Inst26QAH = "4 個任務"

--Quest 1 Alliance
Inst26Quest1 = "1. 克蘇恩的遺產"
Inst26Quest1_Level = "60"
Inst26Quest1_Attain = "60"
Inst26Quest1_Aim = "將克蘇恩之眼交給安其拉神廟的凱雷斯特拉茲。"
Inst26Quest1_Location = "克蘇恩之眼（克蘇恩掉落 - 安其拉神廟; "..YELLOW.."[9]"..WHITE.."）"
Inst26Quest1_Note = "凱雷斯特拉茲（安其拉神廟; "..YELLOW.."[2']"..WHITE.."）"
Inst26Quest1_Prequest = "無"
Inst26Quest1_Folgequest = "卡林多的救星"
-- No Rewards for this quest

--Quest 2 Alliance
Inst26Quest2 = "2. 卡林多的救星"
Inst26Quest2_Level = "60"
Inst26Quest2_Attain = "60"
Inst26Quest2_Aim = "把克蘇恩之眼交給時光之穴的阿納克洛斯。"
Inst26Quest2_Location = "克蘇恩之眼（克蘇恩掉落 - 安其拉神廟; "..YELLOW.."[9]"..WHITE.."）"
Inst26Quest2_Note = "阿納克洛斯（塔納利斯 - 時光之穴; "..YELLOW.."65,49"..WHITE.."）"
Inst26Quest2_Prequest = "克蘇恩的遺產"
Inst26Quest2_Folgequest = "無"
Inst26Quest2FQuest = "true"
--
Inst26Quest2name1 = "墮落之神咒符"
Inst26Quest2name2 = "墮落之神披風"
Inst26Quest2name3 = "墮落之神之戒"

--Quest 3 Alliance
Inst26Quest3 = "3. 其拉軍的秘密"
Inst26Quest3_Level = "60"
Inst26Quest3_Attain = "60"
Inst26Quest3_Aim = "將這個上古其拉神器帶給藏在神廟入口附近的巨龍。"
Inst26Quest3_Location = "上古其拉神器（小怪隨機掉落 - 安其拉神廟）"
Inst26Quest3_Note = "安多葛斯（安其拉神廟; "..YELLOW.."[1']"..WHITE.."）。"
Inst26Quest3_Prequest = "你可以在一王身後的房間中找到安多葛斯"
Inst26Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst26Quest4 = "4. 人類勝利者"
Inst26Quest4_Level = "60"
Inst26Quest4_Attain = "60"
Inst26Quest4_Aim = "將一個其拉領主徽記交給安其拉神廟中的坎多斯塔茲。"
Inst26Quest4_Location = "坎多斯塔茲（安其拉神廟; "..YELLOW.."[1']"..WHITE.."）"
Inst26Quest4_Note = "這個可重複性任務主要用於繳交以換取聲望用，其拉領主徽記掉落自地城中的所有首領身上，你可以在一王身後的房間中找到坎多斯塔茲。"
Inst26Quest4_Prequest = "無"
Inst26Quest4_Folgequest = "無"
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

Inst27Story = "日光曝曬下的這座城市是沙怒食人妖的家園，他們一直以來都以其無情和黑暗魔法而聞名。食人妖傳說中有一把強大的劍，名叫鞭笞者蘇薩斯，能夠讓最弱小的人擊敗最強大的敵人。很久以前，這把武器被分成了兩半。然而，有傳言說這兩半可以在祖爾法拉克裡找到。據說還有一批加基森派來的雇佣兵進入了城市並被困住，他們的命運還不得而知。但也許最讓人感到不安的，是一頭正沉睡在城市中心一個神聖的水池中的遠古生物——祂是一個半神，祂會摧毀任何膽敢喚醒祂的人。"
Inst27Caption = "祖爾法拉克"
Inst27QAA = "7 個任務"
Inst27QAH = "7 個任務"

--Quest 1 Alliance
Inst27Quest1 = "1. 食人妖調和劑"
Inst27Quest1_Level = "45"
Inst27Quest1_Attain = "40"
Inst27Quest1_Aim = "收集20瓶食人妖調和劑，把它們交給加基森的特倫頓．輕錘。"
Inst27Quest1_Location = "特倫頓．輕錘（塔納利斯 - 加基森; "..YELLOW.."51,28 "..WHITE.."）"
Inst27Quest1_Note = "每個食人妖都有可能掉落調和劑。"
Inst27Quest1_Prequest = "無"
Inst27Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst27Quest2 = "2. 聖甲蟲的殼"
Inst27Quest2_Level = "45"
Inst27Quest2_Attain = "40"
Inst27Quest2_Aim = "給加基森的特蘭雷克帶去5個完整的聖甲蟲殼。"
Inst27Quest2_Location = "特蘭雷克（塔納利斯 - 加基森; "..YELLOW.."51,26 "..WHITE.."）"
Inst27Quest2_Note = "前置任務始於克拉茲克（荊棘谷 - 藏寶海灣; "..YELLOW.."25,77"..WHITE.."）。\n每個聖甲蟲都可能掉落殼。大量聖甲蟲集中在"..YELLOW.."[2]"..WHITE.."。"
Inst27Quest2_Prequest = "特蘭雷克"
Inst27Quest2_Folgequest = "無"
Inst27Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst27Quest3 = "3. 深淵冠冕"
Inst27Quest3_Level = "46"
Inst27Quest3_Attain = "40"
Inst27Quest3_Aim = "將深淵冠冕交給塵泥沼澤的塔貝薩。"
Inst27Quest3_Location = "塔貝薩（塵泥沼澤 - 塔貝薩的農場; "..YELLOW.."46,57 "..WHITE.."）"
Inst27Quest3_Note = "前置任務從彬克（鐵爐堡 - 秘法區; "..YELLOW.."25,8"..WHITE.."）處獲得。\n水占師維蕾薩掉落深淵冠冕。你可以在"..YELLOW.."[6]"..WHITE.."找到她。"
Inst27Quest3_Prequest = "塔貝薩的任務"
Inst27Quest3_Folgequest = "無"
Inst27Quest3PreQuest = "true"
--
Inst27Quest3name1 = "幻法之杖"
Inst27Quest3name2 = "晶岩肩鎧"

--Quest 4 Alliance
Inst27Quest4 = "4. 耐克魯姆的勳章 (系列任務)"
Inst27Quest4_Level = "47"
Inst27Quest4_Attain = "40"
Inst27Quest4_Aim = "將耐克魯姆的徽章交給詛咒之地的薩迪斯．格希德。"
Inst27Quest4_Location = "薩迪斯．格希德（詛咒之地 - 守望堡; "..YELLOW.."66,19 "..WHITE.."）"
Inst27Quest4_Note = "此系列任務始於獅鷲獸管理員沙拉克．鷹斧（辛特蘭 - 蠻錘城堡; "..YELLOW.."9,44"..WHITE.."）。\n你可以在"..YELLOW.."[4]"..WHITE.."找到耐克魯姆（神廟百人斬事件時出現）。"
Inst27Quest4_Prequest = "枯木食人妖的牢籠→薩迪斯．格希德"
Inst27Quest4_Folgequest = "占卜"
Inst27Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst27Quest5 = "5. 摩沙魯的預言 (系列任務)"
Inst27Quest5_Level = "47"
Inst27Quest5_Attain = "40"
Inst27Quest5_Aim = "將第一塊和第二塊摩沙魯石板交給塔納利斯的葉基亞。"
Inst27Quest5_Location = "葉基亞（塔納利斯 - 熱砂港; "..YELLOW.."66,22 "..WHITE.."）"
Inst27Quest5_Note = "前置任務也是在此獲得。\n\n兩塊石板分別由殉教者塞卡"..YELLOW.."[2]"..WHITE.."和水占師維蕾薩"..YELLOW.."[6]"..WHITE.."掉落。"
Inst27Quest5_Prequest = "尖嘯者的靈魂"
Inst27Quest5_Folgequest = "遠古之卵"
Inst27Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst27Quest6 = "6. 探水棒"
Inst27Quest6_Level = "47"
Inst27Quest6_Attain = "40"
Inst27Quest6_Aim = "把探水棒交給加基森的首席工程師沙克斯．比格維茲。"
Inst27Quest6_Location = "首席工程師比格維茲（塔納利斯 - 加基森; "..YELLOW.."52,28 "..WHITE.."）"
Inst27Quest6_Note = "你可以從布萊中士那裡得到探水棒。你可以在"..YELLOW.."[5]"..WHITE.."找到他。但要在神廟百人斬事件後打敗布萊中士，才能得到探水棒。"
Inst27Quest6_Prequest = "無"
Inst27Quest6_Folgequest = "無"
--
Inst27Quest6name1 = "石工兄弟會之戒"
Inst27Quest6name2 = "工程學協會頭盔"

--Quest 7 Alliance
Inst27Quest7 = "7. 加茲瑞拉"
Inst27Quest7_Level = "50"
Inst27Quest7_Attain = "40"
Inst27Quest7_Aim = "把加茲瑞拉的鱗片交給閃光平原的維茲爾．銅栓。"
Inst27Quest7_Location = "維茲爾．銅栓（千針石林 - 閃光平原; "..YELLOW.."78,77 "..WHITE.."）"
Inst27Quest7_Note = "前置任務從科羅莫特．鋼尺（鐵爐堡 - 地精區; "..YELLOW.."68,46"..WHITE.."）處得到。但這不是一個必要的任務。\n你可以在"..YELLOW.."[6]"..WHITE.."敲響鑼鼓鑼召喚加茲瑞拉。\n現在你不再需要祖爾法拉克之槌便可以敲鑼。"
Inst27Quest7_Prequest = "銅栓兄弟"
Inst27Quest7_Folgequest = "無"
Inst27Quest7PreQuest = "true"
--
Inst27Quest7name1 = "棍子上的胡蘿蔔"


--Quest 1 Horde
Inst27Quest1_HORDE = "1. 蜘蛛之神 (系列任務)"
Inst27Quest1_HORDE_Level = "45"
Inst27Quest1_HORDE_Attain = "40"
Inst27Quest1_HORDE_Aim = "閱讀塞卡石板，瞭解枯木食人妖的蜘蛛之神的名字，然後回到加德林大師那裡。"
Inst27Quest1_HORDE_Location = "加德林大師（杜隆塔爾 - 森金村; "..YELLOW.."55,74 "..WHITE.."）"
Inst27Quest1_HORDE_Note = "此任務始於辛特蘭食人妖村莊"..YELLOW.."沙德拉洛"..WHITE.."地上的毒液瓶任務。\n你會在"..YELLOW.."[2]"..WHITE.."發現石板。"
Inst27Quest1_HORDE_Prequest = "毒液瓶→完好無損的毒囊→請教加德林大師"
Inst27Quest1_HORDE_Folgequest = "召喚沙德拉"
Inst27Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde  (same as Quest 1 Alliance)
Inst27Quest2_HORDE = "2. 食人妖調和劑"
Inst27Quest2_HORDE_Level = Inst27Quest1_Level
Inst27Quest2_HORDE_Attain = Inst27Quest1_Attain
Inst27Quest2_HORDE_Aim = Inst27Quest1_Aim
Inst27Quest2_HORDE_Location = Inst27Quest1_Location
Inst27Quest2_HORDE_Note = Inst27Quest1_Note
Inst27Quest2_HORDE_Prequest = Inst27Quest1_Prequest
Inst27Quest2_HORDE_Folgequest = Inst27Quest1_Folgequest
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 2 Alliance)
Inst27Quest3_HORDE = "3. 聖甲蟲的殼"
Inst27Quest3_HORDE_Level = Inst27Quest2_Level
Inst27Quest3_HORDE_Attain = Inst27Quest2_Attain
Inst27Quest3_HORDE_Aim = Inst27Quest2_Aim
Inst27Quest3_HORDE_Location = Inst27Quest2_Location
Inst27Quest3_HORDE_Note = Inst27Quest2_Note
Inst27Quest3_HORDE_Prequest = Inst27Quest2_Prequest
Inst27Quest3_HORDE_Folgequest = Inst27Quest2_Folgequest
Inst27Quest3PreQuest_HORDE = Inst27Quest2PreQuest
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 3 Alliance - no prequest)
Inst27Quest4_HORDE = "4. 深淵冠冕"
Inst27Quest4_HORDE_Level = Inst27Quest3_Level
Inst27Quest4_HORDE_Attain = Inst27Quest3_Attain
Inst27Quest4_HORDE_Aim = Inst27Quest3_Aim
Inst27Quest4_HORDE_Location = Inst27Quest3_Location
Inst27Quest4_HORDE_Note = "水占師維蕾薩掉落深淵冠冕。你可以在"..YELLOW.."[6]"..WHITE.."找到她。"
Inst27Quest4_HORDE_Prequest = "無"
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

--Quest 7 Horde  (same as Quest 7 Alliance - no prequest)
Inst27Quest7_HORDE = Inst27Quest7
Inst27Quest7_HORDE_Level = Inst27Quest7_Level
Inst27Quest7_HORDE_Attain = Inst27Quest7_Attain
Inst27Quest7_HORDE_Aim = Inst27Quest7_Aim
Inst27Quest7_HORDE_Location = Inst27Quest7_Location
Inst27Quest7_HORDE_Note = "你可以在"..YELLOW.."[6]"..WHITE.."敲響鑼鼓鑼召喚加茲瑞拉。\n現在你不再需要祖爾法拉克之槌便可以敲鑼。"
Inst27Quest7_HORDE_Prequest = "無"
Inst27Quest7_HORDE_Folgequest = Inst27Quest7_Folgequest
--
Inst27Quest7name1_HORDE = Inst27Quest7name1



--------------- INST28 - Zul'Gurub (ZG) ---------------

Inst28Story = {
  ["Page1"] = "早在幾千年前，強大的古拉巴什帝國陷入了一場規模浩大的內戰而四分五裂，一群極具影響力的阿塔萊食人妖祭司信奉著一個名古老又恐怖的血神–奪靈者．哈卡。這些阿塔萊祭司雖然最終被擊敗並被處以永久的流放，但偉大的食人妖帝國就這樣崩塌了。被流放的祭司們逃到了北方的悲傷沼澤。在這裡，他們為哈卡神建造了一座大神廟——阿塔哈卡神廟，並繼續在那裡為他們的主人重返真實世界而作準備……",
  ["Page2"] = "終於，阿塔萊祭司發現，哈卡的肉體形態只有在古老的古拉巴什帝國的首都祖爾格拉布才能召喚成功。不幸的是，這些祭司們最近真的成功召喚出哈卡–傳聞証實可怕的奪靈者真的出現在古拉巴什廢墟的中心。\n\n為了鎮壓血神，所有的食人妖都聯合起來，派出了一支由高階牧師組成的小隊深入這座古老的城市。隊中的每個牧師都是一位遠古之神的強大戰士，他們分別代表著蝙蝠、豹、老虎、蜘蛛和蛇的力量，但是儘管如此，強大的哈卡仍然輕易地擊敗了他們。現在這些勇士和他們的遠古之神全都臣服於奪靈者的力量。如果有任何冒險者想進入廢墟禁地挑戰強大的血神哈卡，他們就必須先擊敗這些高階牧師。",
  ["MaxPages"] = "2",
};
Inst28Caption = "祖爾格拉布"
Inst28QAA = "4 個任務"
Inst28QAH = "4 個任務"

--Quest 1 Alliance
Inst28Quest1 = "1. 收集頭顱"
Inst28Quest1_Level = "60"
Inst28Quest1_Attain = "58"
Inst28Quest1_Aim = "使用神聖之索串上5顆高階祭司的頭顱，然後把這串食人妖頭顱交給尤亞姆巴島上的伊克薩爾。"
Inst28Quest1_Location = "伊克薩爾（荊棘谷 - 尤亞姆巴島; "..YELLOW.."15,15"..WHITE.."）"
Inst28Quest1_Note = "請你確認每次都搜索了高階祭司的屍體。"
Inst28Quest1_Prequest = "無"
Inst28Quest1_Folgequest = "無"
--
Inst28Quest1name1 = "皺縮頭顱腰帶"
Inst28Quest1name2 = "乾枯頭顱腰帶"
Inst28Quest1name3 = "防腐頭顱腰帶"
Inst28Quest1name4 = "細小頭顱腰帶"

--Quest 2 Alliance
Inst28Quest2 = "2. 哈卡之心"
Inst28Quest2_Level = "60"
Inst28Quest2_Attain = "58"
Inst28Quest2_Aim = "把哈卡之心交給尤亞姆巴島上的莫托爾。"
Inst28Quest2_Location = "哈卡之心（哈卡掉落 - 祖爾格拉布; "..YELLOW.."[11]"..WHITE.."）"
Inst28Quest2_Note = "莫托爾（荊棘谷 - 尤亞姆巴島; "..YELLOW.."15,15"..WHITE.."）"
Inst28Quest2_Prequest = "無"
Inst28Quest2_Folgequest = "無"
--
Inst28Quest2name1 = "贊達拉英雄徽章"
Inst28Quest2name2 = "贊達拉英雄符咒"
Inst28Quest2name3 = "贊達拉英雄勳章"

--Quest 3 Alliance
Inst28Quest3 = "3. 納特的捲尺"
Inst28Quest3_Level = "60"
Inst28Quest3_Attain = "59"
Inst28Quest3_Aim = "將納特的捲尺交給塵泥沼澤的納特．帕格。"
Inst28Quest3_Location = "破碎的工具箱（祖爾格拉布 - 哈卡之島的東北的岸邊"..YELLOW.."[7]"..WHITE.."）"
Inst28Quest3_Note = "找到納特．帕格（塵泥沼澤; "..YELLOW.."59,60"..WHITE.."）。完成任務之後你便可以向他購買用來召喚隱藏王加茲蘭卡的《臭泥魚誘餌》。"
Inst28Quest3_Prequest = "無"
Inst28Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst28Quest4 = "4. 完美的毒藥"
Inst28Quest4_Level = "60"
Inst28Quest4_Attain = "60"
Inst28Quest4_Aim = "塞納里奧城堡的德爾克．雷木要你去幫他取回溫諾希斯的毒囊和庫林納克斯的毒囊。"
Inst28Quest4_Location = "德爾克．雷木（希利蘇斯 - 塞納里奧城堡; "..YELLOW.."52,39"..WHITE.."）"
Inst28Quest4_Note = "高階祭司溫諾希斯"..YELLOW.."祖爾格拉布[2]"..WHITE.."掉落溫諾希斯的毒囊。庫林納克斯"..YELLOW.."安其拉廢墟[1]"..WHITE.."掉落庫林納克斯的毒囊。"
Inst28Quest4_Prequest = "無"
Inst28Quest4_Folgequest = "無"
--
Inst28Quest4name1 = "拉文霍德分割者"
Inst28Quest4name2 = "施夫帕奇的剃刃"
Inst28Quest4name3 = "雷木火鉗"
Inst28Quest4name4 = "達姆魯斯的精華"
Inst28Quest4name5 = "法拉德的裝填器"
Inst28Quest4name6 = "西蒙妮的耕作之錘"


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

Inst29Story = "位於丹莫洛的科技奇蹟城市–諾姆瑞根，世代以來都是地精的主城。最近，一群邪惡的突變石顎怪侵入了包括地精主城在內的多處丹莫洛地區。為了與入侵的石顎怪做出殊死一搏，大工匠梅卡托克命令打開城市中的緊急輻射槽。而地精在等待那些石顎怪死亡或者逃跑的同時也在尋找躲避輻射的方法。不幸的是，雖然石顎怪在經過輻射之後都感染了毒性——但是它們的攻擊不但沒有停止，也沒有絲毫的減弱。那些沒有被輻射殺死的地精只好被迫撤離家園，並在附近的矮人主城鐵爐堡尋找安身之處。現在大工匠梅卡托克徵召了一群智囊團來商議重新奪回他們摯愛的城市的計劃。傳說大工匠梅卡托克曾經最信任的顧問–麥克尼爾．瑟瑪普拉格背叛了他的人民並縱容了這次入侵的發生。現在，麥克尼爾．瑟瑪普拉格的心智已經瘋狂，並仍留在諾姆瑞根中——他繼續籌劃著自己的黑暗計劃，並成為這座城市新的科技霸主。"
Inst29Caption = "諾姆瑞根"
Inst29QAA = "11 個任務"
Inst29QAH = "6 個任務"

--Quest 1 Alliance
Inst29Quest1 = "1. 拯救尖端機器人!"
Inst29Quest1_Level = "26"
Inst29Quest1_Attain = "20"
Inst29Quest1_Aim = "將尖端機器人的存儲器核心交給鐵爐堡的工匠大師歐沃斯巴克。"
Inst29Quest1_Location = "工匠大師歐沃斯巴克（鐵爐堡 - 地精區; "..YELLOW.."69,50 "..WHITE.."）"
Inst29Quest1_Note = "你可以在薩爾努修士（暴風城 - 教堂廣場; "..YELLOW.."50,47"..WHITE.."）那兒接到此任務的前置任務。\n在你進入副本之前，後門附近"..YELLOW.."副本入口地圖[4]"..WHITE.."，可以找到尖端機器人。"
Inst29Quest1_Prequest = "工匠大師歐沃斯巴克"
Inst29Quest1_Folgequest = "無"
Inst29Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest2 Alliance
Inst29Quest2 = "2. 諾恩"
Inst29Quest2_Level = "27"
Inst29Quest2_Attain = "20"
Inst29Quest2_Aim = "用空鉛瓶對著輻射入侵者或者輻射搶劫者，從它們身上收集放射塵。瓶子裝滿之後，把它交給卡拉諾斯的奧齊．電環。"
Inst29Quest2_Location = "奧齊．電環（丹莫洛 - 卡拉諾斯; "..YELLOW.."45,49 "..WHITE.."）"
Inst29Quest2_Note = "你可以在諾恩（鐵爐堡 - 地精區; "..YELLOW.."69,50"..WHITE.."）那兒得到此任務的前置任務。\n要得到輻射塵，你必須對"..RED.."活的"..WHITE.."輻射入侵者或者輻射搶劫者使用空鉛瓶。"
Inst29Quest2_Prequest = "災難之後"
Inst29Quest2_Folgequest = "更多的輻射塵"
Inst29Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest3 Alliance
Inst29Quest3 = "3. 更多的輻射塵!"
Inst29Quest3_Level = "30"
Inst29Quest3_Attain = "20"
Inst29Quest3_Aim = "到諾姆瑞根去收集高強度輻射塵。要多加小心，這種輻射塵非常不穩定，很快就會分解。奧齊要求你把沉重的鉛瓶也交給他。"
Inst29Quest3_Location = "奧齊．電環（丹莫洛 - 卡拉諾斯; "..YELLOW.."45,49 "..WHITE.."）"
Inst29Quest3_Note = "要得到輻射塵，你必須對"..RED.."活的"..WHITE.."輻射泥漿怪，輻射潛伏者，輻射水元素使用沉重的鉛瓶。"
Inst29Quest3_Prequest = "諾恩"
Inst29Quest3_Folgequest = "無"
Inst29Quest3FQuest = "true"
-- No Rewards for this quest

--Quest4 Alliance
Inst29Quest4 = "4. 陀螺式挖掘機"
Inst29Quest4_Level = "30"
Inst29Quest4_Attain = "20"
Inst29Quest4_Aim = "收集24副機械內膽，把它們交給暴風城的舒尼。"
Inst29Quest4_Location = "沉默的舒尼（暴風城 - 矮人區; "..YELLOW.."62,34 "..WHITE.."）"
Inst29Quest4_Note = "每個機器人都有可能掉落內膽。"
Inst29Quest4_Prequest = "無"
Inst29Quest4_Folgequest = "無"
--
Inst29Quest4name1 = "舒尼的扳手"
Inst29Quest4name2 = "欺詐長手套"

--Quest5 Alliance
Inst29Quest5 = "5. 基礎模組"
Inst29Quest5_Level = "30"
Inst29Quest5_Attain = "24"
Inst29Quest5_Aim = "收集12個基礎模組，把它們交給鐵爐堡的科勞莫特．鋼尺。"
Inst29Quest5_Location = "科勞莫特．鋼尺（鐵爐堡 - 地精區; "..YELLOW.."68,46 "..WHITE.."）"
Inst29Quest5_Note = "你可以在瑪希爾（達納蘇斯 - 戰士區; "..YELLOW.."59,45"..WHITE.."）那兒得到此任務的前置任務。\n在諾姆瑞根裡，經過"..YELLOW.."清洗區[2]"..WHITE.."之後的路旁都有基礎模組可以拾取。"
Inst29Quest5_Prequest = "幫助科勞莫特"
Inst29Quest5_Folgequest = "無"
Inst29Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest6 Alliance
Inst29Quest6 = "6. 搶救資料"
Inst29Quest6_Level = "30"
Inst29Quest6_Attain = "25"
Inst29Quest6_Aim = "將彩色穿孔卡片交給鐵爐堡的大機械師卡斯派普。"
Inst29Quest6_Location = "大機械師卡斯派普（鐵爐堡 - 地精區; "..YELLOW.."69,48 "..WHITE.."）"
Inst29Quest6_Note = "你可以在加克希姆．塵鏈（石爪山脈 - 蛛網小徑; "..YELLOW.."59,67"..WHITE.."）那兒得到此任務的前置任務。但這不是一個必要的任務。\n白色卡片隨機掉落。你可以在進入副本之前緊靠後門入口處"..YELLOW.."副本入口地圖[3]"..WHITE.."找到第一台終端機，第二台在"..YELLOW.."[3]"..WHITE.."，第三台在"..YELLOW.."[5]"..WHITE.."，第四台在"..YELLOW.."[6]"..WHITE.."。"
Inst29Quest6_Prequest = "卡斯派普的任務"
Inst29Quest6_Folgequest = "無"
Inst29Quest6PreQuest = "true"
--
Inst29Quest6name1 = "修理工的斗篷"
Inst29Quest6name2 = "技師的蒸汽錘"

--Quest7 Alliance
Inst29Quest7 = "7. 一團混亂"
Inst29Quest7_Level = "30"
Inst29Quest7_Attain = "20"
Inst29Quest7_Aim = "將克努比護送到出口，然後向藏寶海灣的斯庫提匯報。"
Inst29Quest7_Location = "克努比（諾姆瑞根 "..YELLOW.."[3]"..WHITE.."）"
Inst29Quest7_Note = "護送任務！你可以在（荊棘谷 - 藏寶海灣; "..YELLOW.."27,77"..WHITE.."）找到斯庫提。"
Inst29Quest7_Prequest = "無"
Inst29Quest7_Folgequest = "無"
--
Inst29Quest7name1 = "焊接護腕"
Inst29Quest7name2 = "精靈之翼"

--Quest8 Alliance
Inst29Quest8 = "8. 大叛徒"
Inst29Quest8_Level = "35"
Inst29Quest8_Attain = "25"
Inst29Quest8_Aim = "到諾姆瑞根去殺掉麥克尼爾．瑟瑪普拉格。完成任務之後向大工匠梅卡托克報告。"
Inst29Quest8_Location = "大工匠梅卡托克（鐵爐堡 - 地精區; "..YELLOW.."68,48"..WHITE.."）"
Inst29Quest8_Note = "你可以在"..YELLOW.."[8]"..WHITE.."找到麥克尼爾．瑟瑪普拉格。他是諾姆瑞根最後一個首領。\n在戰鬥中你可以按下它旁邊的按鈕阻止他放炸彈。"
Inst29Quest8_Prequest = "無"
Inst29Quest8_Folgequest = "無"
--
Inst29Quest8name1 = "公民長袍"
Inst29Quest8name2 = "旅行皮褲"
Inst29Quest8name3 = "雙鏈強化護腿"

--Quest 9 Alliance
Inst29Quest9 = "9. 髒兮兮的戒指"
Inst29Quest9_Level = "34"
Inst29Quest9_Attain = "28"
Inst29Quest9_Aim = "想方法把髒兮兮的戒指弄乾淨。"
Inst29Quest9_Location = "髒兮兮的戒指（由諾姆瑞根中的黑鐵矮人隨機掉落）"
Inst29Quest9_Note = "這個戒指可以使用清潔器5200型清潔，位置在"..YELLOW.."清洗區[2]"..WHITE.."。"
Inst29Quest9_Prequest = "無"
Inst29Quest9_Folgequest = "戒指歸來"
-- No Rewards for this quest

--Quest 10 Alliance
Inst29Quest10 = "10. 歸還戒指"
Inst29Quest10_Level = "34"
Inst29Quest10_Attain = "28"
Inst29Quest10_Aim = "你可以選擇留著這枚戒指，也可以按照戒指內側刻著的名字找到它的主人。"
Inst29Quest10_Location = "閃亮的金戒指（從髒兮兮的戒指清潔後獲得）"
Inst29Quest10_Note = "把它交給塔瓦斯德．基瑟爾（鐵爐堡 - 秘法區; "..YELLOW.."36,3"..WHITE.."）。"
Inst29Quest10_Prequest = "髒兮兮的戒指"
Inst29Quest10_Folgequest = "地精的手藝"
Inst29Quest10FQuest = "true"
--
Inst29Quest10name1 = "閃亮的金戒指"

--Quest 11 Alliance
Inst29Quest11 = "11. 超級清潔器5200型!"
Inst29Quest11_Level = "30"
Inst29Quest11_Attain = "25"
Inst29Quest11_Aim = "將髒兮兮的東西放入超級清潔器5200型，記得要用三枚銀幣來啟動機器。"
Inst29Quest11_Location = "超級清潔器5200型（諾姆瑞根 - 清洗區; "..YELLOW.."[2]"..WHITE.."）"
Inst29Quest11_Note = "只要你有「髒兮兮的東西」就可以進行這個任務，只有第一次有經驗，之後都是直接給盒子。"
Inst29Quest11_Prequest = "無"
Inst29Quest11_Folgequest = "無"
--
Inst29Quest11name1 = "被清潔器包裝過的盒子"


--Quest 1 Horde
Inst29Quest1_HORDE = "1. 出發!諾姆瑞根!"
Inst29Quest1_HORDE_Level = "35"
Inst29Quest1_HORDE_Attain = "20"
Inst29Quest1_HORDE_Aim = "等斯庫提調整好哥布林傳送器。"
Inst29Quest1_HORDE_Location = "斯庫提（荊棘谷 - 藏寶海灣; "..YELLOW.."27,77 "..WHITE.."）"
Inst29Quest1_HORDE_Note = "你可以在索維克（奧格瑪 - 榮譽谷; "..YELLOW.."75,25"..WHITE.."）那兒得到此任務的前置任務。\n當你完成這個任務，你可以使用藏寶海灣的傳送器。"
Inst29Quest1_HORDE_Prequest = "主工程師斯庫提"
Inst29Quest1_HORDE_Folgequest = "無"
Inst29Quest1PreQuest_HORDE = "true"
--
Inst29Quest1name1_HORDE = "哥布林傳送器"

--Quest 2 Horde  (same as Quest 7 Alliance)
Inst29Quest2_HORDE = "2. 一團混亂"
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

--Quest3 Horde
Inst29Quest3_HORDE = "3. 設備之戰"
Inst29Quest3_HORDE_Level = "35"
Inst29Quest3_HORDE_Attain = "25"
Inst29Quest3_HORDE_Aim = "從諾姆瑞根拿到鑽探設備藍圖和麥克尼爾的保險箱密碼，把它們交給奧格瑪的諾格。"
Inst29Quest3_HORDE_Location = "諾格（奧格瑪 - 榮譽谷; "..YELLOW.."75,25 "..WHITE.."）"
Inst29Quest3_HORDE_Note = "你可以在"..YELLOW.."[8]"..WHITE.."發現麥克尼爾．瑟瑪普拉格。他是諾姆瑞根最後一個首領。\n在戰鬥中你可以按下它旁邊的按鈕阻止他放炸彈。"
Inst29Quest3_HORDE_Prequest = "無"
Inst29Quest3_HORDE_Folgequest = "無"
--
Inst29Quest3name1_HORDE = "公民長袍"
Inst29Quest3name2_HORDE = "旅行皮褲"
Inst29Quest3name3_HORDE = "雙鏈強化護腿"

--Quest 4 Horde  (same as Quest 9 Alliance)
Inst29Quest4_HORDE = "4. 髒兮兮的戒指"
Inst29Quest4_HORDE_Level = Inst29Quest9_Level
Inst29Quest4_HORDE_Attain = Inst29Quest9_Attain
Inst29Quest4_HORDE_Aim = Inst29Quest9_Aim
Inst29Quest4_HORDE_Location = Inst29Quest9_Location
Inst29Quest4_HORDE_Note = Inst29Quest9_Note
Inst29Quest4_HORDE_Prequest = Inst29Quest9_Prequest
Inst29Quest4_HORDE_Folgequest = Inst29Quest9_Folgequest
-- No Rewards for this quest

--Quest 5 Horde
Inst29Quest5_HORDE = "5. 歸還戒指"
Inst29Quest5_HORDE_Level = "34"
Inst29Quest5_HORDE_Attain = "28"
Inst29Quest5_HORDE_Aim = "你可以選擇留著這枚戒指，也可以按照戒指內側刻著的名字找到它的主人。"
Inst29Quest5_HORDE_Location = "閃亮的金戒指（從髒兮兮的戒指清潔後獲得）"
Inst29Quest5_HORDE_Note = "把戒指交給諾格（奧格瑪 - 榮譽谷; "..YELLOW.."75,25"..WHITE.."）。"
Inst29Quest5_HORDE_Prequest = "髒兮兮的戒指"
Inst29Quest5_HORDE_Folgequest = "諾格的手藝"
Inst29Quest5FQuest = "true"
--
Inst29Quest5name1_HORDE = "閃亮的金戒指"

--Quest 6 Horde
Inst29Quest6_HORDE = "6. 超級清潔器5200型!"
Inst29Quest6_HORDE_Level = "30"
Inst29Quest6_HORDE_Attain = "25"
Inst29Quest6_HORDE_Aim = "將髒兮兮的東西放入超級清潔器5200型，記得要用三枚銀幣來啟動機器。"
Inst29Quest6_HORDE_Location = "超級清潔器5200型（諾姆瑞根 - 清洗區; "..YELLOW.."[2]"..WHITE.."）"
Inst29Quest6_HORDE_Note = "只要你有「髒兮兮的東西」就可以進行這個任務。"
Inst29Quest6_HORDE_Prequest = "無"
Inst29Quest6_HORDE_Folgequest = "無"
--
Inst29Quest6name1_HORDE = "被清潔器包裝過的盒子"



--------------- INST37 - HFC: Ramparts (Ramp) ---------------

Inst37Story = {
  ["Page1"] = "在外域枯萎的大地上，地獄火堡壘矗立在地獄火半島的中心，這是一個幾近無法探測的堡壘。在第一次和第二次獸人戰爭中，一直都是部落的運作基地，是不可攻克的象徵。多年來，人們以為這座巨大的堡壘已經被遺棄荒廢了…\n\n直到最近\n\n雖然德拉諾大陸大部分的區域都被魯莽的耐奧祖不計後果的破壞了，但是地獄火堡壘仍然屹立不搖–那裡仍然居住著劫掠成性，擁有紅色皮膚的狂暴墮落獸人。雖然這個新出現的野蠻種族還帶著不少謎團，更令人吃驚的是他們的數量還似乎正不斷地增長。\n\n雖然索爾和格羅姆．地獄吼成功地殺死了瑪諾洛斯，終止了部落的墮落。但是仍有報告顯示地獄火堡壘中的那些野蠻獸人找到了一種新的墮落之源來滿足他們原始的嗜血欲望。",
  ["Page2"] = "這些獸人的領袖是誰暫時無人可知，不過可以確信的是他們不是為燃燒軍團工作。\n\n也許外域傳來的最令人不安的消息，就是從堡壘地下深處所傳來的如同雷霆一樣般的野蠻怒吼。許多人開始猜想這些從地底傳來的怪異吼叫聲是否與墮落獸人以及他們不斷增長的數量有關。不幸的是，這些問題都沒有答案。\n\n至少現在仍是未知數。",
  ["MaxPages"] = "2",
};
Inst37Caption = "地獄火堡壘：地獄火壁壘"
Inst37QAA = "3 個任務"
Inst37QAH = "3 個任務"
Inst37General = {
    {
    "看護者卡爾古瑪",
    "看護者卡爾古瑪是你在地獄火壁壘所碰到的第一個王。他帶著2個地獄火看守者。對付他最簡單的方法是幹掉或是控制住地獄火看守者，因為如果不這麼做他們會治療看護者卡爾古瑪。此外，可以讓護甲最高的遠程隊員站在離看護者卡爾古瑪最遠的位置，因為他會對最遠的隊員衝鋒。他對布衣的傷害沒有那麼強，不過最好還是讓護甲值比較高的隊員來承受傷害。",
    RED .. "致死打擊" .. WHITE .. "：看護者卡爾古瑪有時候會對坦克施放致死打擊，減少10%的治療效果並可以疊加，但是不需要第二個坦克，因為他實在太容易死了。",
    },

    {
    "無疤者歐瑪爾",
    "無疤者歐瑪爾會隨機對一個玩家施放背叛光環：每秒鐘對15碼以內的隊員造成360到440點暗影傷害。受到光環影響的最好遠離隊友以免對隊伍造成過多的傷害。",
    RED .. "召喚地獄犬" .. WHITE .. "：每幾秒鐘召喚地獄犬。這些地獄犬攻擊很強，但是血量很少，應該很快就被殺死。",
    },

    {
    "先驅者維斯路登和納桑",
    "維斯路登會在你殺死平台前面的2個守衛的時候降落。納桑會在維斯路登到20%血量的時候降落。",
    RED .. "納桑（龍息術）" .. WHITE .. "：納桑會對它的前面目標造成面火焰傷害。坦克應該把它拉的背離隊友。\n" .. RED .. "納桑（火焰彈）" .. WHITE .. "：納桑會向玩家扔火球，造成2000左右傷害，並在周圍造成每秒600的火焰傷害。每個人都一定要遠離火圈！",
    },
};

--Quest 1 Alliance
Inst37Quest1 = "1. 削弱防禦"
Inst37Quest1_Level = "62"
Inst37Quest1_Attain = "59"
Inst37Quest1_Aim = "殺死看護者卡爾古瑪，無疤者歐瑪爾，和納桑。將卡爾古瑪之手，歐瑪爾的蹄子，和納桑之顱帶到地獄火半島的榮譽堡給甘尼。"
Inst37Quest1_Location = "中尉查德威克（地獄火半島 - 榮譽堡; "..YELLOW.."57, 66"..WHITE.."）"
Inst37Quest1_Note = "看護者卡爾古瑪在"..YELLOW.."[1]"..WHITE.."，無疤者歐瑪爾在"..YELLOW.."[2]"..WHITE.."，納桑在"..YELLOW.."[3]"..WHITE.."。甘尼在（地獄火半島 - 榮譽堡; "..YELLOW.."56, 67"..WHITE.."）。\n\n要接到這個任務，你必須完成《邪惡的預兆》這個任務，這個任務的起始任務是《了解你的敵人》，起始 NPC 是達納斯．托爾貝恩（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst37Quest1_Prequest = "了解你的敵人→魔獄獸人拾荒者→邪惡的預兆"
Inst37Quest1_Folgequest = "狂怒之心（"..YELLOW.."地獄火堡壘：血熔爐"..WHITE.."）"
Inst37Quest1PreQuest = "true"
--
Inst37Quest1name1 = "精準手甲"
Inst37Quest1name2 = "翡翠戰士肩鎧"
Inst37Quest1name3 = "魔法勢力披肩"
Inst37Quest1name4 = "健步長靴"

--Quest 2 Alliance
Inst37Quest2 = "2. 黑暗的消息"
Inst37Quest2_Level = "62"
Inst37Quest2_Attain = "59"
Inst37Quest2_Aim = "將不祥的信件帶到地獄火半島交給榮譽堡的軍隊指揮官達納斯．托爾貝恩。"
Inst37Quest2_Location = "不祥的信件（先驅者維斯路登掉落 - 地獄火壁壘; "..YELLOW.."[3]"..WHITE.."）"
Inst37Quest2_Note = "軍隊指揮官達納斯．托爾貝恩在（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst37Quest2_Prequest = "無"
Inst37Quest2_Folgequest = "血液就是生命（"..YELLOW.."地獄火堡壘：血熔爐"..WHITE.."）"
Inst37Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst37Quest3 = "3. 懸賞:納桑的騎乘馬鞭 (英雄每日)"
Inst37Quest3_Level = "70"
Inst37Quest3_Attain = "70"
Inst37Quest3_Aim = "風之貿易者札令姆要你取得納桑的騎乘馬鞭。將這樣物品帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst37Quest3_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst37Quest3_Note = "這個每日任務只能在英雄難度副本完成。納桑在"..YELLOW.."[3]"..WHITE.."。"
Inst37Quest3_Prequest = "無"
Inst37Quest3_Folgequest = "無"
--
Inst37Quest3name1 = "正義徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst37Quest1_HORDE = Inst37Quest1
Inst37Quest1_HORDE_Level = Inst37Quest1_Level
Inst37Quest1_HORDE_Attain = Inst37Quest1_Attain
Inst37Quest1_HORDE_Aim = "殺死看護者卡爾古瑪、無疤者歐瑪爾和納桑。將卡爾古瑪之手、歐瑪爾的蹄子和納桑之顱帶到地獄火半島的索爾瑪交給百夫長卡沙瑞斯。"
Inst37Quest1_HORDE_Location = "石衛士史托克頓（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）"
Inst37Quest1_HORDE_Note = "看護者卡爾古瑪在"..YELLOW.."[1]"..WHITE.."，無疤者歐瑪爾在"..YELLOW.."[2]"..WHITE.."，納桑在"..YELLOW.."[3]"..WHITE.."。百夫長卡沙瑞斯在（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）。要接到這個任務，你必須完成《噬骨者鮮血》這個任務，從你在詛咒之地接到《跨越黑暗之門》的任務開始的一連串連續任務。"
Inst37Quest1_HORDE_Prequest = "跨越黑暗之門→噬骨者鮮血"
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
Inst37Quest2_HORDE_Aim = "將不祥的信件交給地獄火半島上索爾瑪的納茲格雷爾。"
Inst37Quest2_HORDE_Location = Inst37Quest2_Location
Inst37Quest2_HORDE_Note = "納茲格雷爾在（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）。"
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
  ["Page1"] = "在外域枯萎的大地上，地獄火堡壘矗立在地獄火半島的中心，這是一個幾近無法探測的堡壘。在第一次和第二次獸人戰爭中，一直都是部落的運作基地，是不可攻克的象徵。多年來，人們以為這座巨大的堡壘已經被遺棄荒廢了…\n\n直到最近\n\n雖然德拉諾大陸大部分的區域都被魯莽的耐奧祖不計後果的破壞了，但是地獄火堡壘仍然屹立不搖–那裡仍然居住著劫掠成性，擁有紅色皮膚的狂暴墮落獸人。雖然這個新出現的野蠻種族還帶著不少謎團，更令人吃驚的是他們的數量還似乎正不斷地增長。\n\n雖然索爾和格羅姆．地獄吼成功地殺死了瑪諾洛斯，終止了部落的墮落。但是仍有報告顯示地獄火堡壘中的那些野蠻獸人找到了一種新的墮落之源來滿足他們原始的嗜血欲望。",
  ["Page2"] = "這些獸人的領袖是誰暫時無人可知，不過可以確信的是他們不是為燃燒軍團工作。\n\n也許外域傳來的最令人不安的消息，就是從堡壘地下深處所傳來的如同雷霆一樣般的野蠻怒吼。許多人開始猜想這些從地底傳來的怪異吼叫聲是否與墮落獸人以及他們不斷增長的數量有關。不幸的是，這些問題都沒有答案。\n\n至少現在仍是未知數。",
  ["MaxPages"] = "2",
};
Inst38Caption = "地獄火堡壘：血熔爐"
Inst38QAA = "3 個任務"
Inst38QAH = "3 個任務"
Inst38General = {
    {
    "創造者",
    "很簡單的王，坦克拉住然後殺了就可以了。",
    RED .. "擊退" .. WHITE .. "：近距離擊退攻擊，打擊所有近戰範圍內的玩家，（似乎有仇恨減少的效果）。\n" .. RED .. "精神控制" .. WHITE .. "：控制一個玩家並且能提高被控制玩家的傷害。",
    },

    {
    "布洛克",
    "比較難的戰鬥，當你打開屋子裡的搖桿時就觸發了戰鬥。王前會依次出現4波四周監牢裡的被關押獸人，裡面有精英也有非精英，而且一波比一波厲害。中間你不能停止戰鬥，所以可以最後留一隻怪一直變羊（或心靈控制）來讓大家慢慢恢復血量與法力。",
    RED .. "4波怪" .. WHITE .. "：第一波是4個普通的怪，二波是3個普通怪一個精英怪，三波是各2個，最後是1個普通3個精英。\n" .. RED .. "毒性之箭" .. WHITE .. "：對所有他面前的玩家噴射毒箭，所以非坦克職業盡量不要站在他的正面。\n" .. RED .. "毒性之雲" .. WHITE .. "：向一個玩家投擲一個毒性炸彈，造成少量傷害，但是對炸彈四周的玩家造成每秒650的傷害，一定要躲開。",
    },

    {
    "破壞者．凱利丹",
    "最後一個王，但是並不是很難。戰鬥會在你攻擊他周圍的怪之後開始，當全部5個怪消滅之後就會開始與王的戰鬥。",
    RED .. "周圍小怪" .. WHITE .. "：它們會釋放一個是你受到暗影傷害提高1000點的魔法，一定要及時解除。\n" .. RED .. "群體暗影箭" .. WHITE .. "：群體暗影箭，沒有詛咒的情況下造成並不是很高的傷害。\n" .. RED .. "爆炸" .. WHITE .. "：每過幾秒王會喊〝靠近點！〞和停止攻擊。2至5秒後（不確定）會發生爆炸，對周圍玩家造成4000多的火焰傷害。如果看見喊話就跑遠點吧。",
    },
};

--Quest 1 Alliance
Inst38Quest1 = "1. 血液就是生命"
Inst38Quest1_Level = "63"
Inst38Quest1_Attain = "59"
Inst38Quest1_Aim = "收集10個魔獄獸人血瓶後回到地獄火半島的榮譽堡找甘尼。"
Inst38Quest1_Location = "甘尼（地獄火半島 - 榮譽堡; "..YELLOW.."56, 67"..WHITE.."）"
Inst38Quest1_Note = "血熔爐裡面的魔獄獸人都可能掉落。"
Inst38Quest1_Prequest = "黑暗的消息"
Inst38Quest1_Folgequest = "無"
Inst38Quest1PreQuest = "true"
--
Inst38Quest1name1 = "懲戒胸甲"
Inst38Quest1name2 = "致命的穿孔護腿"
Inst38Quest1name3 = "月梟頭飾"
Inst38Quest1name4 = "毀滅綴鱗護腿"

--Quest 2 Alliance
Inst38Quest2 = "2. 狂怒之心"
Inst38Quest2_Level = "63"
Inst38Quest2_Attain = "59"
Inst38Quest2_Aim = "徹底調查血熔爐再到地獄火半島的榮譽堡向軍隊指揮官達納斯．托爾貝恩回報。"
Inst38Quest2_Location = "甘尼（地獄火半島 - 榮譽堡; "..YELLOW.."56, 67"..WHITE.."）。"
Inst38Quest2_Note = "走到破壞者．凱利丹的房間"..YELLOW.."[3]"..WHITE.."即可完成任務。軍隊指揮官達納斯．托爾貝恩在（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst38Quest2_Prequest = "削弱防禦"
Inst38Quest2_Folgequest = "無"
Inst38Quest2PreQuest = "true"
--
Inst38Quest2name1 = "赤紅清澈墜飾"
Inst38Quest2name2 = "神聖治療指環"
Inst38Quest2name3 = "完美平衡斗篷"

--Quest 3 Alliance
Inst38Quest3 = "3. 懸賞:凱利丹的羽飾手杖 (英雄每日)"
Inst38Quest3_Level = "70"
Inst38Quest3_Attain = "70"
Inst38Quest3_Aim = "風之貿易者札令姆要你取得凱利丹的羽飾手杖。將手杖帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst38Quest3_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst38Quest3_Note = "這個每日任務只能在英雄難度副本完成。破壞者．凱利丹在"..YELLOW.."[3]"..WHITE.."。"
Inst38Quest3_Prequest = "無"
Inst38Quest3_Folgequest = "無"
--
Inst38Quest3name1 = "正義徽章"


--Quest 1 Horde  (same as Quest 1 Alliance)
Inst38Quest1_HORDE = Inst38Quest1
Inst38Quest1_HORDE_Level = Inst38Quest1_Level
Inst38Quest1_HORDE_Attain = Inst38Quest1_Attain
Inst38Quest1_HORDE_Aim = "收集10個魔獄獸人血瓶帶回地獄火半島的索爾瑪給百夫長卡沙瑞斯。"
Inst38Quest1_HORDE_Location = "百夫長卡沙瑞斯（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）"
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
Inst38Quest2_HORDE_Aim = "徹底調查血熔爐再到地獄火半島的索爾瑪向納茲格雷爾回報"
Inst38Quest2_HORDE_Location = "納茲格雷爾（地獄火半島 - 索爾瑪; "..YELLOW.."55,36"..WHITE.."）"
Inst38Quest2_HORDE_Note = "走到破壞者．凱利丹的房間"..YELLOW.."[3]"..WHITE.."即可完成任務。納茲格雷爾在（地獄火半島 - 索爾瑪; "..YELLOW.."55,36"..WHITE.."）。"
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
  ["Page1"] = "在外域枯萎的大地上，地獄火堡壘矗立在地獄火半島的中心，這是一個幾近無法探測的堡壘。在第一次和第二次獸人戰爭中，一直都是部落的運作基地，是不可攻克的象徵。多年來，人們以為這座巨大的堡壘已經被遺棄荒廢了…\n\n直到最近\n\n雖然德拉諾大陸大部分的區域都被魯莽的耐奧祖不計後果的破壞了，但是地獄火堡壘仍然屹立不搖–那裡仍然居住著劫掠成性，擁有紅色皮膚的狂暴墮落獸人。雖然這個新出現的野蠻種族還帶著不少謎團，更令人吃驚的是他們的數量還似乎正不斷地增長。\n\n雖然索爾和格羅姆．地獄吼成功地殺死了瑪諾洛斯，終止了部落的墮落。但是仍有報告顯示地獄火堡壘中的那些野蠻獸人找到了一種新的墮落之源來滿足他們原始的嗜血欲望。",
  ["Page2"] = "這些獸人的領袖是誰暫時無人可知，不過可以確信的是他們不是為燃燒軍團工作。\n\n也許外域傳來的最令人不安的消息，就是從堡壘地下深處所傳來的如同雷霆一樣般的野蠻怒吼。許多人開始猜想這些從地底傳來的怪異吼叫聲是否與墮落獸人以及他們不斷增長的數量有關。不幸的是，這些問題都沒有答案。\n\n至少現在仍是未知數。",
  ["MaxPages"] = "2",
};
Inst39Caption = "地獄火堡壘：破碎大廳"
Inst39QAA = "10 個任務"
Inst39QAH = "9 個任務"
Inst39General = {
    {
    "大術士．奈德克斯",
    "在大術士．奈德克斯前面有幾個正在被他拿來當實驗品的非精英魔獄獸人，你可以先一一的引這些魔獄獸人過來殺掉，（擊殺次序無關緊要），當殺完他們之後，大術士．奈德克斯便會出來攻擊隊伍。",
    RED .. "黑暗螺旋" .. WHITE .. "：在他生命到達20%的時候，奈德克斯會施放黑暗螺旋技能。他將攻擊任何接近他的人，對接近他的任何人造成2000點物理傷害，並且以很快的頻率濺射暗影箭，暗影箭會造成1500點暗影傷害。最好盡快消耗他剩餘的生命值以減少己方傷亡甚至滅團。\n" .. RED .. "死亡纏繞" .. WHITE .. "：他還會向隨機目標施放死亡纏繞，造成2000點暗影傷害並且恐懼目標4秒，治療奈瑟庫斯大約2000點生命值。\n" .. RED .. "次級暗影裂隙" .. WHITE .. "：召喚一片虛空空間（粉紅色的光柱），在施放後1秒內對站在上面的玩家造成每秒1000點暗影傷害。包括坦克在內的所有玩家都需要及時跑出。",
    },

    {
    "戰爭製造者．歐姆拉格",
    "負責坦住戰爭製造者．歐姆拉格的坦克應該站在房間的中間，讓大家有空間來移動躲避他的衝擊波和群體恐懼（只有獵人靠他們超過40碼的射程可以躲避群體恐懼）。他有一個致命的技能就是連續2次的衝擊波，造成6000傷害。近戰職業在看到王的武器開始燃燒之後應該迅速移動遠離王以避免衝擊波傷害，只有坦克一個人可以承受傷害。治療者應該在王施放衝擊波之前保持坦克血量為滿。此外這個王會隨機追著某個目標攻擊，治療者必須對被追的人施以大量補血。",
   RED .. "恐懼" .. WHITE .. "：影響身邊所有玩家的恐懼怒吼。\n" .. RED .. "燃燒武器/衝擊波" .. WHITE .. "：當戰爭製造者．歐姆拉格的武器開始燃燒時，他對近戰目標造成1000火焰傷害。然後他會連續施放2次衝擊波（每次造成2500 - 3200傷害）。",
    },

    {
    "大酋長卡加斯．刃拳",
    "刃拳是一個比較簡單的戰鬥，但是至少還有這麼幾個要點需要注意：他攻擊鎧甲的傷害約為700，屬於比較弱小的；他不會法術攻擊，所以魔法增效會起到不小的效果；每幾秒鐘他會召喚一個非精英守衛從大廳北面跑過來，出現的怪物種類是隨機的，但是生命值都很低，很快就可以殺死。每35秒卡加斯會進行劍刃之舞，以高速在不同目標之間進行衝鋒，造成1000點順劈傷害和輕微AE效果。為了擊敗他你可以殺死增援，或者無視增援直接集火殺掉王。很重要的一點是隊員站位需要分散，離開大廳的中間，不然劍刃之舞會相當危險。他生命值很高，但是整場戰鬥並不難。",
   RED .. "召喚援助" .. WHITE .. "：蠻兵、收割者和神射手護衛將從北面出現幫助王。\n" .. RED .. "劍刃之舞" .. WHITE .. "：這是他的必殺技，每35秒卡加斯會進行一次劍刃之舞，在隨機目標之間進行衝鋒，造成1000點順劈傷害和輕微AE傷害。",
    },
};


--Quest 1 Alliance
Inst39Quest1 = "1. 魔化餘燼"
Inst39Quest1_Level = "70"
Inst39Quest1_Attain = "67"
Inst39Quest1_Aim = "榮譽堡的魔導師薩柏瑞希斯要你幫她帶來一份魔化餘燼。"
Inst39Quest1_Location = "魔導師薩柏瑞希斯（地獄火半島 - 榮譽堡; "..YELLOW.."54,66"..WHITE.."）"
Inst39Quest1_Note = "殺死大術士．奈德克斯之後，他會掉落一個護符，在他座位旁邊的火盆"..YELLOW.."[2]"..WHITE.."使用護符即可得到魔化餘燼。"
Inst39Quest1_Prequest = "無"
Inst39Quest1_Folgequest = "無"
--
Inst39Quest1name1 = "助理牧師的靴子"
Inst39Quest1name2 = "深刻符文腰帶"
Inst39Quest1name3 = "維持手套"
Inst39Quest1name4 = "遠征隊斥候肩冑"
Inst39Quest1name5 = "無懼手甲"

--Quest 2 Alliance
Inst39Quest2 = "2. 魔獄部落的驕傲"
Inst39Quest2_Level = "70"
Inst39Quest2_Attain = "66"
Inst39Quest2_Aim = "榮譽堡的戰場元帥洛摩斯要你殺死8個破碎之手軍團士兵、4個破碎之手百夫長和4個破碎之手勇士。"
Inst39Quest2_Location = "戰場元帥洛摩斯（地獄火半島 - 榮譽堡; "..YELLOW.."57, 63"..WHITE.."）"
Inst39Quest2_Note = "你可以在破碎大廳發現這些怪物"
Inst39Quest2_Prequest = "無"
Inst39Quest2_Folgequest = "無"
-- No Rewards for this quest

--Quest 3 Alliance
Inst39Quest3 = "3. 扭轉情勢"
Inst39Quest3_Level = "70"
Inst39Quest3_Attain = "67"
Inst39Quest3_Aim = "把大酋長卡加斯之手帶給榮譽堡的軍隊指揮官達納斯．托爾貝恩。"
Inst39Quest3_Location = "軍隊指揮官達納斯．托爾貝恩（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）"
Inst39Quest3_Note = "卡加斯酋長在"..YELLOW.."[5]"..WHITE.."。"
Inst39Quest3_Prequest = "無"
Inst39Quest3_Folgequest = "無"
--
Inst39Quest3name1 = "痛苦之奈德克斯魔棒"
Inst39Quest3name2 = "生命賦予披肩"
Inst39Quest3name3 = "納莉可的復仇"
Inst39Quest3name4 = "剛勇守衛勳章"

--Quest 4 Alliance
Inst39Quest4 = "4. 監禁堡壘 (英雄模式)"
Inst39Quest4_Level = "70"
Inst39Quest4_Attain = "70"
Inst39Quest4_Aim = "隊長阿蓮娜被處決之前拯救她。\n這個任務只能在英雄難度副本中完成。"
Inst39Quest4_Location = "藍迪．威索洛克（破碎大廳; "..YELLOW.."英雄模式[1]"..WHITE.."）"
Inst39Quest4_Note = "這個任務必須在英雄難度下完成。隊長阿蓮娜在"..YELLOW.."英雄模式[5]"..WHITE.."，你必須在事件觸發之後的50分鐘內把她救出來。"
Inst39Quest4_Prequest = "無"
Inst39Quest4_Folgequest = "無"
-- No Rewards for this quest

--Quest 5 Alliance
Inst39Quest5 = "5. 那魯的試煉:寬容 (英雄模式)"
Inst39Quest5_Level = "70"
Inst39Quest5_Attain = "70"
Inst39Quest5_Aim = "撒塔斯城的阿達歐要你自地獄火堡壘的破碎大廳取回劊子手的廢棄之斧。\n\n該任務必須在英雄等級難度的地下城中完成。"
Inst39Quest5_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53, 43"..WHITE.."）"
Inst39Quest5_Note = "這個任務必須在英雄難度下完成。破碎之手劊子手在"..YELLOW.."英雄模式[5]"..WHITE.."。"
Inst39Quest5_Prequest = "無"
Inst39Quest5_Folgequest = "無"
-- No Rewards for this quest

--Quest 6 Alliance
Inst39Quest6 = "6. 大地之母的眼淚"
Inst39Quest6_Level = "70"
Inst39Quest6_Attain = "67"
Inst39Quest6_Aim = "戰爭製造者．歐姆拉格身上取回大地之母的眼淚然後交給韋恩的避難所的大衛．韋恩。"
Inst39Quest6_Location = "大衛．韋恩（泰洛卡森林 - 韋恩的避難所; "..YELLOW.."78,39"..WHITE.."）。"
Inst39Quest6_Note = "戰爭製造者．歐姆拉格在 "..YELLOW.."[4]"..WHITE.."。"
Inst39Quest6_Prequest = "麥克納爾的容器（麥克納爾）＆惡魔詞典（暗影迷宮）"
Inst39Quest6_Folgequest = "伊利達瑞的剋星"
Inst39Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst39Quest7 = "7. 凱娜的要求 (英雄模式)"
Inst39Quest7_Level = "70"
Inst39Quest7_Attain = "70"
Inst39Quest7_Aim = "凱娜．拉斯蕊德要你到地獄火堡壘的破碎大廳，從大術士奈德克斯那裡取得黑暗之書，再到奧齊頓的塞司克大廳，從暗法師希斯那裡取得遺忘之名魔典。"
Inst39Quest7_Location = "凱娜．拉斯蕊德（虛空風暴 - 52區; "..YELLOW.."32,63"..WHITE.."）"
Inst39Quest7_Note = "這個任務必須在英雄難度下完成。大術士奈德克斯在"..YELLOW.."[2]"..WHITE.."。"
Inst39Quest7_Prequest = "朋友的協助（"..YELLOW.."卡拉贊"..WHITE.."）"
Inst39Quest7_Folgequest = "夜禍（"..YELLOW.."卡拉贊"..WHITE.."）"
Inst39Quest7PreQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst39Quest8 = "8. 懸賞:刃拳的徽印 (英雄每日)"
Inst39Quest8_Level = "70"
Inst39Quest8_Attain = "70"
Inst39Quest8_Aim = "風之貿易者札令姆要你取得刃拳的徽印。將徽印帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst39Quest8_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst39Quest8_Note = "大酋長卡加斯．刃拳在"..YELLOW.."[5]"..WHITE.."。"
Inst39Quest8_Prequest = "無"
Inst39Quest8_Folgequest = "無"
--
Inst39Quest8name1 = "正義徽章"

--Quest 9 Alliance
Inst39Quest9 = "9. 懸賞:破碎之手百夫長 (普通每日)"
Inst39Quest9_Level = "70"
Inst39Quest9_Attain = "70"
Inst39Quest9_Aim = "虛空行者瑪頓恩要你殺死4名破碎之手百夫長。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst39Quest9_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst39Quest9_Note = "普通每日任務。"
Inst39Quest9_Prequest = "無"
Inst39Quest9_Folgequest = "無"
--
Inst39Quest9name1 = "伊斯利恩監獄鑰匙"

--Quest 10 Alliance
Inst39Quest10 = "10. 進入堡壘"
Inst39Quest10_Level = "70"
Inst39Quest10_Attain = "68"
Inst39Quest10_Aim = "將原始鑰匙模子帶去給地獄火半島上榮譽堡的軍隊指揮官達納斯。"
Inst39Quest10_Location = "原始鑰匙模子（鐵匠戈蘭克掉落 - 影月谷 - 阿塔莫工匠區; "..YELLOW.."68,36"..WHITE.."）"
Inst39Quest10_Note = "如果你有飛行座騎，你將可以輕易的找到掉落[原始鑰匙模子]的鐵匠戈蘭克，而且他不是精英怪物，可以自己一個人殺掉他。\n\n軍隊指揮官達納斯．托爾貝恩在（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）。接著他會叫你去找工匠大師戴夫利（地獄火半島 - 榮譽堡; "..YELLOW.."51,60"..WHITE.."）。"
Inst39Quest10_Page = {2, "工匠大師戴夫利將會要求你帶4個[魔鐵錠]，2個[魔塵]和4個[火焰微粒]給他。\n\n將材料交給他之後，他會給你一個[未淬火的鑰匙模]，你必須使用惡魔搶奪者的屍體將[未淬火的鑰匙模]製作成[燒焦的鑰匙模型]。你不需要自己殺掉一隻惡魔搶奪者（別人擊殺的屍體也可以），只要在它的屍體旁邊使用[未淬火的鑰匙模]就可以完成任務了。\n\n任務完成後回去找工匠大師戴夫利（地獄火半島 - 榮譽堡; "..YELLOW.."51,60"..WHITE.."）領取你的獎勵。", };
Inst39Quest10_Prequest = "無"
Inst39Quest10_Folgequest = "戴夫利大師→戴夫利的請求→比地獄還熱"
--
Inst39Quest10name1 = "破碎大廳鑰匙"


--Quest 1 Horde  (same as Quest 2 Alliance)
Inst39Quest1_HORDE = "1. 魔獄部落的驕傲"
Inst39Quest1_HORDE_Level = Inst39Quest2_Level
Inst39Quest1_HORDE_Attain = Inst39Quest2_Attain
Inst39Quest1_HORDE_Aim = "索爾瑪的影子獵人泰巾要你殺死8個破碎之手軍團士兵、4個破碎之手百夫長和4個破碎之手勇士。"
Inst39Quest1_HORDE_Location = "影子獵人泰巾（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）"
Inst39Quest1_HORDE_Note = Inst39Quest2_Note
Inst39Quest1_HORDE_Prequest = Inst39Quest2_Prequest
Inst39Quest1_HORDE_Folgequest = Inst39Quest2_Folgequest
-- No Rewards for this quest

--Quest 2 Horde
Inst39Quest2_HORDE = "2. 大酋長的希望"
Inst39Quest2_HORDE_Level = "70"
Inst39Quest2_HORDE_Attain = "67"
Inst39Quest2_HORDE_Aim = "把大酋長卡加斯之手帶給索爾瑪的納茲格雷爾。"
Inst39Quest2_HORDE_Location = "納茲格雷爾（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）"
Inst39Quest2_HORDE_Note = "卡加斯酋長在 "..YELLOW.."[5]"..WHITE.."。"
Inst39Quest2_HORDE_Prequest = "無"
Inst39Quest2_HORDE_Folgequest = "無"
--
Inst39Quest2name1_HORDE = "極致暗影魔棒"
Inst39Quest2name2_HORDE = "牧師披風"
Inst39Quest2name3_HORDE = "征服者的指環"
Inst39Quest2name4_HORDE = "殘拳頸飾"

--Quest 3 Horde
Inst39Quest3_HORDE = "3. 監禁堡壘 (英雄模式)"
Inst39Quest3_HORDE_Level = "70"
Inst39Quest3_HORDE_Attain = "70"
Inst39Quest3_HORDE_Aim = "在碎骨隊長被處決前解救他"
Inst39Quest3_HORDE_Location = "崔賽拉（破碎大廳; "..YELLOW.."英雄模式[1]"..WHITE.."）"
Inst39Quest3_HORDE_Note = "這個任務只能在英雄難度副本中完成。碎骨隊長在"..YELLOW.."英雄模式[5]"..WHITE.."，你必須在事件觸發之後的50分鐘內把他救出來。"
Inst39Quest3_HORDE_Prequest = "無"
Inst39Quest3_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Horde  (same as Quest 5 Alliance)
Inst39Quest4_HORDE = "4. 那魯的試煉:寬容 (英雄模式)"
Inst39Quest4_HORDE_Level = Inst39Quest5_Level
Inst39Quest4_HORDE_Attain = Inst39Quest5_Attain
Inst39Quest4_HORDE_Aim = Inst39Quest5_Aim
Inst39Quest4_HORDE_Location = Inst39Quest5_Location
Inst39Quest4_HORDE_Note = Inst39Quest5_Note
Inst39Quest4_HORDE_Prequest = Inst39Quest5_Prequest
Inst39Quest4_HORDE_Folgequest = Inst39Quest5_Folgequest
-- No Rewards for this quest

--Quest 5 Horde  (same as Quest 6 Alliance)
Inst39Quest5_HORDE = "5. 大地之母的眼淚"
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
Inst39Quest6_HORDE = "6. 凱娜的要求 (英雄模式)"
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
Inst39Quest7_HORDE = "7. 懸賞:刃拳的徽印 (英雄每日)"
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
Inst39Quest8_HORDE = "8. 懸賞:破碎之手百夫長 (普通每日)"
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
Inst39Quest9_HORDE = "9. 進入堡壘"
Inst39Quest9_HORDE_Level = "70"
Inst39Quest9_HORDE_Attain = "68"
Inst39Quest9_HORDE_Aim = "將原始鑰匙模子帶去給地獄火半島上索爾瑪的納茲格雷爾。"
Inst39Quest9_HORDE_Location = "原始鑰匙模子（鐵匠戈蘭克掉落 - 影月谷 - 阿塔莫工匠區; "..YELLOW.."68,36"..WHITE.."）"
Inst39Quest9_HORDE_Note = "如果你有飛行座騎，你將可以輕易的找到掉落[原始鑰匙模子]的鐵匠戈蘭克，而且他不是精英怪物，可以自己一個人殺掉他。\n\n納茲格雷爾在（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）。接著他會叫你去找工匠大師洛赫克（地獄火半島 - 索爾瑪; "..YELLOW.."53,38"..WHITE.."）。"
Inst39Quest9_HORDE_Page = {2, "工匠大師洛赫克將會要求你帶4個[魔鐵錠]，2個[魔塵]和4個[火焰微粒]給他。\n\n將材料交給他之後，他會給你一個[未淬火的鑰匙模]，你必須使用惡魔搶奪者的屍體將[未淬火的鑰匙模]製作成[燒焦的鑰匙模型]。你不需要自己殺掉一隻惡魔搶奪者（別人擊殺的屍體也可以），只要在它的屍體旁邊使用[未淬火的鑰匙模]就可以完成任務了。\n\n任務完成後回去找工匠大師洛赫克（地獄火半島 - 索爾瑪; "..YELLOW.."53,38"..WHITE.."）領取你的獎勵。", };
Inst39Quest9_HORDE_Prequest = "無"
Inst39Quest9_HORDE_Folgequest = "大師洛赫克→洛赫克的請求→比地獄還熱"
--
Inst39Quest9name1_HORDE = "破碎大廳鑰匙"



--------------- INST40 - HFC: Magtheridon's Lair ---------------

Inst40Story = {
  ["Page1"] = "在外域枯萎的大地上，地獄火堡壘矗立在地獄火半島的中心，這是一個幾近無法探測的堡壘。在第一次和第二次獸人戰爭中，一直都是部落的運作基地，是不可攻克的象徵。多年來，人們以為這座巨大的堡壘已經被遺棄荒廢了…\n\n直到最近\n\n雖然德拉諾大陸大部分的區域都被魯莽的耐奧祖不計後果的破壞了，但是地獄火堡壘仍然屹立不搖–那裡仍然居住著劫掠成性，擁有紅色皮膚的狂暴墮落獸人。雖然這個新出現的野蠻種族還帶著不少謎團，更令人吃驚的是他們的數量還似乎正不斷地增長。\n\n雖然索爾和格羅姆．地獄吼成功地殺死了瑪諾洛斯，終止了部落的墮落。但是仍有報告顯示地獄火堡壘中的那些野蠻獸人找到了一種新的墮落之源來滿足他們原始的嗜血欲望。",
  ["Page2"] = "這些獸人的領袖是誰暫時無人可知，不過可以確信的是他們不是為燃燒軍團工作。\n\n也許外域傳來的最令人不安的消息，就是從堡壘地下深處所傳來的如同雷霆一樣般的野蠻怒吼。許多人開始猜想這些從地底傳來的怪異吼叫聲是否與墮落獸人以及他們不斷增長的數量有關。不幸的是，這些問題都沒有答案。\n\n至少現在仍是未知數。",
  ["MaxPages"] = "2",
};
Inst40Caption = "地獄火堡壘：瑪瑟里頓的巢穴"
Inst40QAA = "2 個任務"
Inst40QAH = "2 個任務"

--Quest 1 Alliance
Inst40Quest1 = "1. 那魯的試煉:瑪瑟里頓"
Inst40Quest1_Level = "70"
Inst40Quest1_Attain = "70"
Inst40Quest1_Aim = "撒塔斯城的阿達歐要你殺死瑪瑟里頓。"
Inst40Quest1_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53, 43"..WHITE.."）"
Inst40Quest1_Note = "瑪瑟里頓（瑪瑟里頓的巢穴; "..YELLOW.."[1]"..WHITE.."）"
Inst40Quest1_Prequest = "那魯的試煉–寬容、堅毅、力量。"
Inst40Quest1_Folgequest = "無"
Inst40Quest1PreQuest = "true"
--
Inst40Quest1name1 = "鳳凰之火指環"

--Quest 2 Alliance
Inst40Quest2 = "2. 瑪瑟里頓陣亡"
Inst40Quest2_Level = "70"
Inst40Quest2_Attain = "70"
Inst40Quest2_Aim = "將瑪瑟里頓之首交給地獄火半島榮譽堡的軍隊指揮官達納斯．托爾貝恩。"
Inst40Quest2_Location = "瑪瑟里頓的頭顱（瑪瑟里頓掉落 - 瑪瑟里頓的巢穴; "..YELLOW.."[1]"..WHITE.."）"
Inst40Quest2_Note = "團隊中只有一個人能夠得到頭顱來觸發這個任務。軍隊指揮官達納斯．托爾貝恩在（地獄火半島 - 榮譽堡; "..YELLOW.."57, 67"..WHITE.."）。"
Inst40Quest2_Prequest = "無"
Inst40Quest2_Folgequest = "無"
--
Inst40Quest2name1 = "阿達歐的防禦徽記"
Inst40Quest2name2 = "赤紅狂怒指環"
Inst40Quest2name3 = "那魯光明護衛指環"
Inst40Quest2name4 = "頑強之戒"


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
Inst40Quest2_HORDE_Aim = "將瑪瑟里頓之首交給地獄火半島索爾瑪的納茲格雷爾。"
Inst40Quest2_HORDE_Location = Inst40Quest2_Location
Inst40Quest2_HORDE_Note = "團隊中只有一個人能夠得到頭顱來觸發這個任務。納茲格雷爾在（地獄火半島 - 索爾瑪; "..YELLOW.."55, 36"..WHITE.."）。"
Inst40Quest2_HORDE_Prequest = Inst40Quest2_Prequest
Inst40Quest2_HORDE_Folgequest = Inst40Quest2_Folgequest
--
Inst40Quest2name1_HORDE = Inst40Quest2name1
Inst40Quest2name2_HORDE = Inst40Quest2name2
Inst40Quest2name3_HORDE = Inst40Quest2name3
Inst40Quest2name4_HORDE = Inst40Quest2name4



--------------- INST41 - CR: The Slave Pens (SP) ---------------

Inst41Story = "贊格沼澤微妙的生態平衡已經被破壞了。\n\n贊格沼澤的水位逐漸下降，異常的腐化現象也正擴散感染到這裡的植物生態。非自然的現像正在腐蝕和破壞沼澤原生的動植物。\n\n所有的跡象似乎都和毒蛇之湖底下新近發現的一連串洞穴有關，以及佔據在裡頭的納迦和他們的手下。\n\n傳聞這座神秘建築物的所有人不是別人，正是惡名昭彰的瓦許女士。\n\n在瓦許女士的率領之下，那些納迦似乎正在秘密重建一個新的永恆之井，而且是直接受命於背叛者伊利丹．怒風的指示。萬一要是讓他們的計畫成功的話，後果實在是不堪設想。在一切變得太遲之前，只有你能夠揭發她的惡毒計劃並阻止她和她的手下！\n\n盤牙蓄湖分為4個部分，3個5人副本（奴隸監獄，深幽泥沼，蒸汽洞窟）和一個25人團隊副本（毒蛇神殿洞穴）。"
Inst41Caption = "盤牙蓄湖：奴隸監獄"
Inst41QAA = "4 個任務"
Inst41QAH = "4 個任務"
Inst41General = {
    {
    "背叛者曼紐",
    "背叛者曼紐是你會遇到的第一個王。他在一條被其他小怪包圍著的斜坡上巡邏。他是一個薩滿類型的王，他會使用近身攻擊，並且安插圖騰。一定要指定你的一個隊員盡快消滅圖騰（特別是治療圖騰，因為它的治療速度還是非常快的）。整場戰鬥還是比較簡單直接的。",
    RED .. "圖騰" .. WHITE .. "：他會插4種圖騰（曼紐的治療結界─每秒治療1%曼紐體力、受污染的陷地圖騰─範圍性捆住玩家，無法行動、受污染的石膚圖騰─大幅增加曼紐的護甲，防禦物理攻擊、墮落的新星圖騰─每五秒發動一次火焰新星攻擊，造成2500點火焰傷害，範圍約15-20碼），當然，治療圖騰是最重要的，應即使打掉。\n\n" .. BLUE .. "英雄難度要點：墮落的新星圖騰無論是被打掉還是3秒之後爆炸都會造成6000左右傷害，故千萬不要打墮落的新星圖騰，拉著王遠離圖騰會是最好的辦法。",
    },

    {
    "爆破者洛克瑪",
    "爆破者洛克瑪是這一分支的第二個王。他長得就像一隻巨大的龍蝦。他會對坦克進行近身攻擊，並使用2種技能。",
    RED .. "重傷" .. WHITE .. "：每2秒對目標造成850至1000點傷害，持續直到目標被完全治癒。（狀態的描述是：在目標被完全治癒之前，使目標大量失血的恐怖攻擊。每2秒造成1096至1304點傷害直到治癒）。\n" .. RED .. "冰霜箭" .. WHITE .. "：一種與寒冰箭類似的攻擊，對隨機目標釋放，造成傷害並且將目標減速。\n" .. BLUE .. "英雄難度要點：王的群體寒冰箭是有射程的，治療和獵人站在最遠位置可以不被寒冰箭打到。",
    },

    {
    "奎克米瑞",
    "奎克米瑞是奴隸監獄中第三個也是最後一個王。他是一個孢子巨人類型的王。戰鬥是比較簡單的坦克戰，注意在王前面的那個遠征軍的NPC一定要確保不死，能從NPC那裡得到一個110自然抗的Buff，王戰會容易很多",
    RED .. "毒箭攻擊" .. WHITE .. "：造成2500至2600的直接傷害和一個每一跳800點的持續性傷害效果，可以驅散。\n" .. RED .. "毒液噴吐" .. WHITE .. "：對其前面大約90°的範圍噴射毒液，這時坦克最好將其拉背對人群，非坦克玩家盡量避免站在王的正面",
    },
};

--Quest 1 Alliance
Inst41Quest1 = "1. 無法行動"
Inst41Quest1_Level = "65"
Inst41Quest1_Attain = "62"
Inst41Quest1_Aim = "調查大地束縛者瑞吉，自然學家拜特，威德．綠指和喚風者卡勞發生了什麼事。然後再回到贊格沼澤的盤牙蓄湖找看守者詹汗格。"
Inst41Quest1_Location = "看守者詹汗格（盤牙蓄湖; "..YELLOW.."副本入口地圖[1]"..WHITE.."）"
Inst41Quest1_Note = "威德．綠指在"..YELLOW.."[3]"..WHITE.."，自然學家拜特在 "..YELLOW.."[6]"..WHITE.."，這個任務還要去深幽泥沼才能全部完成。"
Inst41Quest1_Prequest = "無"
Inst41Quest1_Folgequest = "無"
Inst41Quest1PreQuest = "true"
--
Inst41Quest1name1 = "塞納里奧施法戒指"
Inst41Quest1name2 = "金藤裹帶"
Inst41Quest1name3 = "沼澤暗色披風"

--Quest 2 Alliance
Inst41Quest2 = "2. 懸賞:奎克米瑞之心 (英雄每日)"
Inst41Quest2_Level = "70"
Inst41Quest2_Attain = "70"
Inst41Quest2_Aim = "風之貿易者札令姆要你取得奎克米瑞之心。將這顆心帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst41Quest2_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst41Quest2_Note = "奎克米瑞在 "..YELLOW.."[7]"..WHITE.."。"
Inst41Quest2_Prequest = "無"
Inst41Quest2_Folgequest = "無"
--
Inst41Quest2name1 = "正義徽章"

--Quest 3 Alliance
Inst41Quest3 = "3. 卡德許的鬥棍 (英雄模式)"
Inst41Quest3_Level = "70"
Inst41Quest3_Attain = "70"
Inst41Quest3_Aim = "盤牙蓄湖中奴隸監獄的『異端』司卡利斯要你帶給他土靈徽記和熾烈徽記。"
Inst41Quest3_Location = "『異端』司卡利斯（奴隸監獄; "..YELLOW.."英雄模式[4]"..WHITE.."）"
Inst41Quest3_Note = "土靈徽記掉落自戈魯爾"..YELLOW.."戈魯爾之巢[2]"..WHITE.."，熾烈徽記掉落自夜禍"..YELLOW.."卡拉贊 [11]"..WHITE.."。\n\n這個任務曾經是毒蛇神殿的進門任務。"
Inst41Quest3_Prequest = "無"
Inst41Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst41Quest4 = "4. 艾胡恩裂片 (季節性 仲夏火焰節)"
Inst41Quest4_Level = "80"
Inst41Quest4_Attain = "75"
Inst41Quest4_Aim = "將寒冰裂片交給魯瑪．天母。"
Inst41Quest4_Location = "艾胡恩裂片（在殺死冰霜領主艾胡恩之後你可以從箱子裡面拾取）"
Inst41Quest4_Note = "魯瑪．天母（奴隸監獄; "..YELLOW.."[1]"..WHITE.."）。這個物品每個角色只能得到一個。"
Inst41Quest4_Prequest = "無"
Inst41Quest4_Folgequest = "無"
--
Inst41Quest4name1 = "夏日晴空外袍"
Inst41Quest4name2 = "夏日烈焰外袍"
Inst41Quest4name3 = "燃燒之花"


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

Inst42Story = "贊格沼澤微妙的生態平衡已經被破壞了。\n\n贊格沼澤的水位逐漸下降，異常的腐化現象也正擴散感染到這裡的植物生態。非自然的現像正在腐蝕和破壞沼澤原生的動植物。\n\n所有的跡象似乎都和毒蛇之湖底下新近發現的一連串洞穴有關，以及佔據在裡頭的納迦和他們的手下。\n\n傳聞這座神秘建築物的所有人不是別人，正是惡名昭彰的瓦許女士。\n\n在瓦許女士的率領之下，那些納迦似乎正在秘密重建一個新的永恆之井，而且是直接受命於背叛者伊利丹．怒風的指示。萬一要是讓他們的計畫成功的話，後果實在是不堪設想。在一切變得太遲之前，只有你能夠揭發她的惡毒計劃並阻止她和她的手下！\n\n盤牙蓄湖分為4個部分，3個5人副本（奴隸監獄，深幽泥沼，蒸汽洞窟）和一個25人團隊副本（毒蛇神殿洞穴）。"
Inst42Caption = "盤牙蓄湖：蒸汽洞窟"
Inst42QAA = "7 個任務"
Inst42QAH = "7 個任務"

Inst42General = {
    {
    "海法師希斯比亞",
    "海法師希斯比亞有2個水元素守衛，如果隊伍中有術士的話可以放逐，如果你沒有放逐的職業，那麼你的坦克需要衝鋒並且拉住王和一個守衛，而其他的隊員迅速消滅掉第二個。守衛會隨機施放800至1000點傷害的冰箭，治療要注意。如果你有一個可以驅散魔法的職業，要注意驅散肺部爆破和包圍之風效果。海法師希斯比亞在失去了2個守衛之後還是比較簡單的。",
    RED .. "閃電之雲" .. WHITE .. "：召喚一片閃電之雲，持續14秒。對該區域中的玩家造成1575至2025點自然傷害並且在接下來的每2秒造成1838至2362點額外傷害。\n" .. RED .. "肺部爆破" .. WHITE .. "：每2秒造成602至698點傷害。這是一個魔法減益效果，可以被驅散。\n" .. RED .. "包圍之風" .. WHITE .. "：用一股旋風包圍一個玩家，使其昏迷6秒。魔法效果，可被驅散。\n\n" .. BLUE .. "英雄難度要點：風箏王，集火殺掉水元素，打王時候注意躲雷雲。最簡單的風箏辦法就是寵物停在水中，然後給他加個誤導射擊，然後獵人開王，戰士接水元素。",
    },

    {
    "米克吉勒．蒸汽操控者",
    "你必須當心他的超級縮小射線技能。如果你的戰士能夠準確控制法術反射技能的時間，可以將射線反射給王，這樣會讓戰鬥簡單很多。如果你能夠成功的透過AE殺掉那些修理員，阻止他們為王恢復生命值，戰鬥會很簡單。（修理員不是精英）。",
    RED .. "電擊網" .. WHITE .. "：該技能每3秒造成400至700自然傷害，並且讓玩家10秒不能移動。\n" .. RED .. "鋸刀" .. WHITE .. "：造成物理傷害的圓錐範圍攻擊。\n" .. RED .. "超級縮小射線" .. WHITE .. "：玩家造成的傷害減少35%。\n".. RED .. "米克吉勒的修理員" .. WHITE .. "：這些小怪會治療斯蒂姆雷格大約1000生命。",
    },

    {
    "督軍卡利斯瑞",
    "作為盤牙蓄湖最高等級分支的最終王，督軍卡利斯瑞具有應有的難度，並且戰鬥也需要一定時間。隊伍必須穩定的進行dps，因為他的生命值很高，並且會定期反射魔法。他另一個值得注意的技能就是穿刺，對隨機目標造成每3秒500點物理傷害。如果他在某個目標的穿刺作用時間消失之前再次穿刺，那麼作用時間會更新，效果會累積，治療者必須注意。同時，不時他會大喊一聲然後從旁邊的某個水箱中吸取能量。在這個時候，這個水箱是可以攻擊的，並且隊伍中的每個成員都必須攻擊水箱，包括治療。因為王會在吸取能量的時候停止攻擊。在王完成吸取水箱的能量之前，玩家必須消滅水箱。如果王成功的吸取了能量，他就會激怒，獲得100%攻擊速度增加，和75%的攻擊傷害增加。因為水箱只有在王吸取能量的時候才能攻擊。只要隊伍能夠成功的摧毀王吸取能量的每一個水箱，那麼王戰就沒有難度了。",
    RED .. "穿刺" .. WHITE .. "：每3秒對一個目標造成500物理傷害，持續9秒。\n" .. RED .. "法術反射" .. WHITE .. "：法術被反射。效果是大氣泡，也可以通過偵測魔法觀察。\n" .. RED .. "督軍之怒" .. WHITE .. "：這是他最危險的技能，大致情況是他會從旁邊的一個納迦蒸餾器身上吸取力量，當法術完成之後，他會激怒，獲得100%攻擊速度增加，和75%的攻擊傷害增加。",
    },
};

--Quest 1 Alliance
Inst42Quest1 = "1. 督軍的藏身之處"
Inst42Quest1_Level = "70"
Inst42Quest1_Attain = "67"
Inst42Quest1_Aim = "看守者詹汗格要你找到並殺死盤牙蓄湖裡的督軍卡利斯瑞。"
Inst42Quest1_Location = "看守者詹汗格（盤牙蓄湖; "..YELLOW.."副本入口地圖[1]"..WHITE.."）"
Inst42Quest1_Note = "督軍卡利斯瑞在"..YELLOW.."[4]"..WHITE.."，一定要在督軍卡利斯瑞使用水箱時打破它們，否則他獲得水箱的力量之後會陷入狂暴狀態。"
Inst42Quest1_Prequest = "無"
Inst42Quest1_Folgequest = "無"
--
Inst42Quest1name1 = "海法師裹頭"
Inst42Quest1name2 = "爪型頭盔"
Inst42Quest1name3 = "大地看守者頭巾"
Inst42Quest1name4 = "侍從頭飾"

--Quest 2 Alliance
Inst42Quest2 = "2. 瓦許女士的命令"
Inst42Quest2_Level = "70"
Inst42Quest2_Attain = "67"
Inst42Quest2_Aim = "將瓦許女士的命令帶到贊格沼澤給塞納里奧避難所的伊斯歐．風歌。"
Inst42Quest2_Location = "這個任務是從蒸汽洞窟的小怪身上隨機掉落的物品觸發的。伊斯歐．風歌在"..YELLOW.."78, 62"..WHITE.."。"
Inst42Quest2_Note = "瓦許女士的命令（小怪隨機掉落 - 蒸汽洞窟）。這個任務能夠讓你向塞納里奧避難所上交盤牙裝備。"
Inst42Quest2_Prequest = "無"
Inst42Quest2_Folgequest = "準備作戰"
-- No Rewards for this quest

--Quest 3 Alliance
Inst42Quest3 = "3. 那魯的試煉:力量 (英雄模式)"
Inst42Quest3_Level = "70"
Inst42Quest3_Attain = "70"
Inst42Quest3_Aim = "撒塔斯城的阿達歐要你去取回卡利斯瑞的三叉戟和莫爾墨的精華。"
Inst42Quest3_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53, 43"..WHITE.."）"
Inst42Quest3_Note = "此任務必須在英雄難度副本裡完成。督軍卡利斯瑞在"..YELLOW.."蒸汽洞窟[4]"..WHITE.."。"
Inst42Quest3_Prequest = "無"
Inst42Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst42Quest4 = "4. 幽界土壤"
Inst42Quest4_Level = "70"
Inst42Quest4_Attain = "67"
Inst42Quest4_Aim = "從海法師希斯比亞的身上取得一個瓶裝地獄土壤交給韋恩的避難所的大衛．韋恩。"
Inst42Quest4_Location = "大衛．韋恩（泰洛卡森林 - 韋恩的避難所; "..YELLOW.."78,39"..WHITE.."）。"
Inst42Quest4_Note = "海法師希斯比亞在"..YELLOW.."[1]"..WHITE.."。"
Inst42Quest4_Prequest = "麥克納爾的容器（麥克納爾）＆惡魔詞典（暗影迷宮）"
Inst42Quest4_Folgequest = "伊利達瑞的剋星"
Inst42Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst42Quest5 = "5. 第二和第三個碎片"
Inst42Quest5_Level = "70"
Inst42Quest5_Attain = "68"
Inst42Quest5_Aim = "在盤牙蓄湖的秘法容器裡取得第二塊鑰匙碎片，風暴要塞的秘法容器裡取得第三塊鑰匙碎片。完成任務後回到撒塔斯城的卡德加那裡。"
Inst42Quest5_Location = "卡德加（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst42Quest5_Note = "秘法容器在"..YELLOW.."[2]"..WHITE.."，在一小潭水的底部。"
Inst42Quest5_Prequest = "卡拉贊的入口（暗影迷宮）"
Inst42Quest5_Folgequest = "大師之觸（黑色沼澤）"
Inst42Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst42Quest6 = "6. 懸賞:盤牙侍從 (普通每日)"
Inst42Quest6_Level = "70"
Inst42Quest6_Attain = "70"
Inst42Quest6_Aim = "虛空行者瑪頓恩要你殺死14名盤牙侍從。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst42Quest6_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst42Quest6_Note = "普通每日任務。"
Inst42Quest6_Prequest = "無"
Inst42Quest6_Folgequest = "無"
--
Inst42Quest6name1 = "伊斯利恩監獄鑰匙"

--Quest 7 Alliance
Inst42Quest7 = "7. 懸賞:督軍的論述 (英雄每日)"
Inst42Quest7_Level = "70"
Inst42Quest7_Attain = "70"
Inst42Quest7_Aim = "風之貿易者札令姆要你取得督軍的論述。將東西帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst42Quest7_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst42Quest7_Note = "督軍卡利斯瑞在"..YELLOW.."[4]"..WHITE.."。"
Inst42Quest7_Prequest = "無"
Inst42Quest7_Folgequest = "無"
--
Inst42Quest7name1 = "正義徽章"


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

Inst43Story = "贊格沼澤微妙的生態平衡已經被破壞了。\n\n贊格沼澤的水位逐漸下降，異常的腐化現象也正擴散感染到這裡的植物生態。非自然的現像正在腐蝕和破壞沼澤原生的動植物。\n\n所有的跡象似乎都和毒蛇之湖底下新近發現的一連串洞穴有關，以及佔據在裡頭的納迦和他們的手下。\n\n傳聞這座神秘建築物的所有人不是別人，正是惡名昭彰的瓦許女士。\n\n在瓦許女士的率領之下，那些納迦似乎正在秘密重建一個新的永恆之井，而且是直接受命於背叛者伊利丹．怒風的指示。萬一要是讓他們的計畫成功的話，後果實在是不堪設想。在一切變得太遲之前，只有你能夠揭發她的惡毒計劃並阻止她和她的手下！\n\n盤牙蓄湖分為4個部分，3個5人副本（奴隸監獄，深幽泥沼，蒸汽洞窟）和一個25人團隊副本（毒蛇神殿洞穴）。"
Inst43Caption = "盤牙蓄湖：深幽泥沼"
Inst43QAA = "5 個任務"
Inst43QAH = "5 個任務"

Inst43General = {
    {
    "飢餓之牙",
    "所有的隊伍成員必須觀察地板上的蘑菇並且離開其範圍，包括坦克在內。在飢餓之牙的生命值降低到某個程度以下時，它會開始使用邪惡孢子。包括坦克在內所有隊員都需要離開王附近，以免受到範圍性傷害，同時避免王治療自己。注意：飢餓之牙旁邊的兩個孢子巨人與王並不是仇恨連接的，強烈推薦單獨消滅。",
    RED .. "孢子雲" .. WHITE .. "：會在隨機地點讓這些蘑菇出現。生長幾秒鐘之後，這些蘑菇會放出孢子雲，由孢子蘑菇釋放的AE型DoT。在20秒內每2秒造成360至540點自然傷害，最多累積5次。\n" .. RED .. "邪惡孢子" .. WHITE .. "：飢餓之牙將自己的根紮入地下，釋放出AE的毒性雲霧，造成每秒400至600傷害，並且對飢餓之牙造成4倍於傷害量的治療。範圍15碼。",
    },

    {
    "高薩安",
    "你隊伍中的主坦克需要第一個進入戰場來吸引高薩安。高薩安必須側面朝向小隊，不然隊員會受到酸性噴射和尾巴掃擊的傷害。當坦克吸引了高薩安之後，他就會開始受到酸性呼吸的傷害，但是這並不難於治療。由於高薩安會在20%生命時進入狂怒狀態，所以需要將需要長冷卻的Dps技能保持在那之後使用。",
    RED .. "酸性噴射" .. WHITE .. "：正面寬圓錐範圍內攻擊，造成2000至2500傷害。\n" .. RED .. "尾巴掃擊" .. WHITE .. "：和奧妮克西亞的尾巴掃擊類似，附帶500至800傷害的擊退效果，所以坦克應該盡量靠牆坦，以避免被擊飛太遠。\n" .. RED .. "酸性呼吸" .. WHITE .. "：這個技能每3秒造成144點傷害，最多可堆積4次，不可驅散。",
    },

    {
    "沼澤之王莫斯萊克",
    "一開始坦克需要衝向這個獵人的寵物：烈爪，如果有小D也可以把熊一直睡，然後轉換目標為王本人。當坦克獲得了足夠仇恨之後（需要3至4秒），其他隊員也可以開始攻擊目標。每隔幾秒沼澤之王莫斯萊克就會冰凍所有隊員，並且拉開距離射擊。坦克需要盡快回到他的近戰範圍內並且吸引住王。當獵人死亡之後，隊員可以全力對付烈爪。在它的生命值降低到5%左右時會變為友善目標，並且變形成一個德魯伊。",
    RED .. "瞄準射擊" .. WHITE .. "：沒有被近距離坦克吸引住時會使用這一技能，對布衣可以造成2000點以上傷害。\n" .. RED .. "多重射擊" .. WHITE .. "：對若干隨機隊員射擊，造成2000至2500點秘法傷害。\n" .. RED .. "冰凍陷阱" .. WHITE .. "：常會冰凍所有隊員3秒，然後拉開距離。",
    },
    
    {
    "黑色獵捕者",
    "分散站位是避免閃電傷害的關鍵。但是真正造成傷害的是漂浮術和電荷衝擊。電荷衝擊每次傷害為750，除非得到治療，玩家會被殺死。如果可能的話，安排好第二治療和第二坦克。這個王的戰鬥比起該副本中之前的戰鬥來說相對困難。",
    RED .. "閃電鏈" .. WHITE .. "：與薩滿的技能類似，攻擊接近的幾個目標。\n" .. RED .. "漂浮術" .. WHITE .. "：給予玩家一個減益狀態，讓他漂浮在空中遠離隊員和王。\n" .. RED .. "電荷衝擊" .. WHITE .. "：DoT傷害，對玩家及鄰近隊友造成750點每跳傷害。這一狀態無法被驅散，除非得到治療，玩家會被殺死。",
    },
};

--Quest 1 Alliance
Inst43Quest1 = "1. 無法行動"
Inst43Quest1_Level = "65"
Inst43Quest1_Attain = "62"
Inst43Quest1_Aim = "調查大地束縛者瑞吉，自然學家拜特，威德．綠指和喚風者卡勞發生了什麼事。然後再回到贊格沼澤的盤牙蓄湖找看守者詹汗格。"
Inst43Quest1_Location = "看守者詹汗格（盤牙蓄湖; "..YELLOW.."副本入口地圖[1]"..WHITE.."）"
Inst43Quest1_Note = "大地束縛者瑞吉在"..YELLOW.."[3]"..WHITE.."，喚風者卡勞在 "..YELLOW.."[4]"..WHITE.."。注意，大地束縛者瑞吉是潛行的，你需要走近些才能看見它，喚風者卡勞則需要殺掉沼澤之王莫斯萊克或者將它打成16%的血它才會變回原形，之後才能和他說話完成任務。這個任務還要去奴隸監獄才能全部完成。"
Inst43Quest1_Prequest = "無"
Inst43Quest1_Folgequest = "無"
Inst43Quest1PreQuest = "true"
--
Inst43Quest1name1 = "塞納里奧施法戒指"
Inst43Quest1name2 = "金藤裹帶"
Inst43Quest1name3 = "沼澤暗色披風"

--Quest 2 Alliance
Inst43Quest2 = "2. 喔，開始吧!"
Inst43Quest2_Level = "65"
Inst43Quest2_Attain = "63"
Inst43Quest2_Aim = "收集一片地孢之葉交給贊格沼澤的斯博格爾的塔蘇。"
Inst43Quest2_Location = "塔蘇（贊格沼澤 - 斯博格爾; "..YELLOW.."19, 49"..WHITE.."）"
Inst43Quest2_Note = "你必須和斯博格爾的聲望達到中立才能接到任務。地孢之葉就在飢餓之牙身後"..YELLOW.."[1]"..WHITE.."。"
Inst43Quest2_Prequest = "無"
Inst43Quest2_Folgequest = "無"
--
Inst43Quest2name1 = "永恆地孢藻葉"

--Quest 3 Alliance
Inst43Quest3 = "3. 追蹤獵捕者"
Inst43Quest3_Level = "65"
Inst43Quest3_Attain = "63"
Inst43Quest3_Aim = "把黑色捕獵者的大腦帶給贊格沼澤的斯博格爾的奇尼克斯。"
Inst43Quest3_Location = "奇尼克斯（贊格沼澤 - 斯博格爾; "..YELLOW.."19, 49"..WHITE.."）"
Inst43Quest3_Note = "你必須和斯博格爾的聲望達到中立才能接到任務。黑色捕獵者就在"..YELLOW.."[5]"..WHITE.."。"
Inst43Quest3_Prequest = "無"
Inst43Quest3_Folgequest = "無"
--
Inst43Quest3name1 = "精華灌注蘑菇"
Inst43Quest3name2 = "力量灌注蘑菇"

--Quest 4 Alliance
Inst43Quest4 = "4. 懸賞:黑色捕獵者的蛋 (英雄每日)"
Inst43Quest4_Level = "70"
Inst43Quest4_Attain = "70"
Inst43Quest4_Aim = "風之貿易者札令姆要你取得黑色捕獵者的蛋。將蛋帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst43Quest4_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst43Quest4_Note = "黑色捕獵者在"..YELLOW.."[5]"..WHITE.."。"
Inst43Quest4_Prequest = "無"
Inst43Quest4_Folgequest = "無"
--
Inst43Quest4name1 = "正義徽章"

--Quest 5 Alliance
Inst43Quest5 = "5. 給我木槿花!"
Inst43Quest5_Level = "65"
Inst43Quest5_Attain = "63"
Inst43Quest5_Aim = "收集5朵血紅木槿再回到贊格沼澤的斯博格爾交給卡思汗特。"
Inst43Quest5_Location = "卡思汗特（贊格沼澤 - 斯博格爾; "..YELLOW.."19,50"..WHITE.."）"
Inst43Quest5_Note = "你必須和斯博格爾的聲望達到中立才能接到任務。血紅木槿在深幽泥沼的地上隨機重生。"
Inst43Quest5_Prequest = "無"
Inst43Quest5_Folgequest = "再給我木槿花！"
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

Inst44Story = "幾千年來，德萊尼人將死者埋葬在他們最神聖的廟宇奧齊頓之中。\n\n但是，暗影議會的成員卻潛入了奧齊頓，準備召喚無比邪惡的恐怖生物。他們可恥的魔法造成了一場大爆炸，將廟宇炸得四分五裂，周圍的地區也因此成為了一片焦土\n\n爆炸同時在虛空中切開了一條裂縫，將另一個世界的靈體帶入了外域。以前被埋葬的德萊尼人無法安息的靈魂在廢墟中遊蕩。而且，暗影議會召喚的恐懼生物就要突破暗影議會控制它的力量了。\n\n你必須防止它降臨到這個世界中。\n\n奧齊頓分為4個5人副本，64-66的法力墓地，65-67的奧奇奈地穴，67-69的塞司克大廳和70-72的暗影迷宮。"
Inst44Caption = "奧齊頓：奧奇奈地穴"
Inst44QAA = "2 個任務"
Inst44QAH = "4 個任務"
Inst44General = {
    {
    "死亡看守者辛瑞克",
    "死亡看守者辛瑞克不會從台階上下來，所以隊伍需要衝上去。對付他有幾個戰略。其中一個戰略是四方移動戰略，這樣他的集中火力傷害將會降到最小。隊伍站成一個四方形，2個在左邊，2個在右邊。當大家都到位之後，坦克將死亡看守者辛瑞克拉到四方形的一個角落上。為了保證治療者的生存，最好他們從樓梯上走下去躲避集中火力的傷害。",
    RED .. "食肉撕咬" .. WHITE .. "：近戰範圍內的流血debuff，當死亡看守者辛瑞克把玩家拉近身時施放。\n" .. RED .. "約束魔法" .. WHITE .. "：對所有玩家施放一個debuff，增加施法時間50%，最多積累4次，效果為施法時間增加200%。\n" .. RED .. "集中火力" .. WHITE .. "：死亡看守者辛瑞克會做出『死亡看守者辛瑞克正在集中他的能量』這樣的動作，然後在某個玩家腳下放出標記。3至5秒之後，標記會進行類似衝擊波的攻擊，對附近的玩家造成1650點火焰傷害。",
    },

    {
    "主教瑪拉達爾",
    "戰鬥的關鍵是盡量減少影之生物的數量（最好為0）。每次當一個影之生物被製造出來之後，集中火力迅速消滅它。然後再攻擊主教。萬一有多個影之生物出現，可以用冰霜新星控制。在主教瑪拉達爾生命降至20%時，他會召喚一個攻擊力非常強勁的殉教者之靈。集中殺死主教，然後再消滅殉教者之靈。",
    RED .. "召喚殉教者之靈" .. WHITE .. "：在20%生命時，主教將會召喚一個殉教者之靈，它會使用噁心的致死打擊技能。\n" .. RED .. "心靈順劈斬" .. WHITE .. "：所有的傷害和治療都降低50%。\n" .. RED .. "召喚影之生物" .. WHITE .. "：製造一個玩家的陰影來攻擊隊員。陰影對布衣造成706至878傷害，還會使用傷害在1500左右的致死打擊。\n" .. RED .. "心靈尖嘯" .. WHITE .. " 群體恐懼。",
    },
};

--Quest 1 Alliance
Inst44Quest1 = "1. 一切都會很好"
Inst44Quest1_Level = "67"
Inst44Quest1_Attain = "64"
Inst44Quest1_Aim = "站在奧齊頓的奧奇奈地穴外的大祖父阿爾崔瑪斯要你進入奧奇奈地穴並殺掉主教瑪拉達爾。"
Inst44Quest1_Location = "大祖父阿爾崔瑪斯（泰洛卡森林 - 奧齊頓; "..YELLOW.."副本入口地圖[1]"..WHITE.."）"
Inst44Quest1_Note = "主教瑪拉達爾在"..YELLOW.."[2]"..WHITE.."。這個任務的起始任務是《我看到了德萊尼的鬼魂》，起始NPC是哈勒（泰洛卡森林 - 奧齊頓; "..YELLOW.."副本入口地圖[1]"..WHITE.."）。"
Inst44Quest1_Prequest = "靈魂呼喚者勒威薩斯"
Inst44Quest1_Folgequest = "無"
Inst44Quest1PreQuest = "true"
--
Inst44Quest1name1 = "奧奇奈隱士長袍"
Inst44Quest1name2 = "奧奇奈僧侶外套"
Inst44Quest1name3 = "奧奇奈追蹤者鍊杉"
Inst44Quest1name4 = "主教保衛者"

--Quest 2 Alliance
Inst44Quest2 = "2. 懸賞:主教的靈魂寶石 (英雄每日)"
Inst44Quest2_Level = "70"
Inst44Quest2_Attain = "70"
Inst44Quest2_Aim = "風之貿易者札令姆要你取得主教的靈魂寶石。將東西帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst44Quest2_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst44Quest2_Note = "主教瑪拉達爾在"..YELLOW.."[2]"..WHITE.."。"
Inst44Quest2_Prequest = "無"
Inst44Quest2_Folgequest = "無"
--
Inst44Quest2name1 = "正義徽章"


--Quest 1 Horde
Inst44Quest1_HORDE = "1. 奧齊頓……"
Inst44Quest1_HORDE_Level = "68"
Inst44Quest1_HORDE_Attain = "66"
Inst44Quest1_HORDE_Aim = "前往泰洛卡森林的白骨荒野的奧奇奈地穴，並殺掉主教瑪拉達爾以釋放迪歐瑞的靈魂。"
Inst44Quest1_HORDE_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."54,45"..WHITE.."）"
Inst44Quest1_HORDE_Note = "主教瑪拉達爾在"..YELLOW.."[2]"..WHITE.."。"
Inst44Quest1_HORDE_Prequest = "秘密的揭露"
Inst44Quest1_HORDE_Folgequest = "靈魂看見的"
Inst44Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst44Quest2_HORDE = "2. 靈魂看見的"
Inst44Quest2_HORDE_Level = "68"
Inst44Quest2_HORDE_Attain = "66"
Inst44Quest2_HORDE_Aim = "在奧奇奈地穴裡的某處找到一面靈魂之鏡，並且用它召喚來自納葛蘭的古老的獸人元祖的黯淡的靈魂前來。消滅15個黯淡的靈魂好讓那些先祖能夠安息。\n當任務完成後，回到先祖之地的卡修爾母親那裡。"
Inst44Quest2_HORDE_Location = "迪歐瑞（奧奇奈地穴; "..YELLOW.."[2]"..WHITE.."）。卡修爾母親在（納葛蘭; "..YELLOW.."26,61"..WHITE.."）。"
Inst44Quest2_HORDE_Note = "最好有一個3人以上小隊再召喚獸人先祖。"
Inst44Quest2_HORDE_Prequest = "奧齊頓……"
Inst44Quest2_HORDE_Folgequest = "回到祖母身邊"
Inst44Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde  (same as Quest 1 Alliance)
Inst44Quest3_HORDE = "3. 一切都會很好"
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
Inst44Quest4_HORDE = "4. 懸賞:主教的靈魂寶石 (英雄每日)"
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

Inst45Story = "幾千年來，德萊尼人將死者埋葬在他們最神聖的廟宇奧齊頓之中。\n\n但是，暗影議會的成員卻潛入了奧齊頓，準備召喚無比邪惡的恐怖生物。他們可恥的魔法造成了一場大爆炸，將廟宇炸得四分五裂，周圍的地區也因此成為了一片焦土\n\n爆炸同時在虛空中切開了一條裂縫，將另一個世界的靈體帶入了外域。以前被埋葬的德萊尼人無法安息的靈魂在廢墟中遊蕩。而且，暗影議會召喚的恐懼生物就要突破暗影議會控制它的力量了。\n\n你必須防止它降臨到這個世界中。\n\n奧齊頓分為4個5人副本，64-66的法力墓地，65-67的奧奇奈地穴，67-69的塞司克大廳和70-72的暗影迷宮。"
Inst45Caption = "奧齊頓：法力墓地"
Inst45QAA = "5 個任務"
Inst45QAH = "5 個任務"
Inst45General = {
    {
    "班提蒙尼厄斯",
    "雖然不是必須，但是暗影抗性在這場戰鬥中能起到很大作用。因為王幾乎所有的傷害都是暗影傷害（除了虛空爆炸）。暗抗裝備，藥水和Buff（牧師、聖騎），光環都有作用。\n戰鬥的關鍵是隨時注意觀察暗影護盾技能的動畫效果（王身邊的綠色半圓圈）。每一個Dps，包括坦克在內，在暗影護盾作用的5秒內都必須停止攻擊。另外還有一點值得注意的是，你應該在一面牆附近坦住王，防止王將坦克擊退後超出治療範圍。",
    RED .. "近戰攻擊" .. WHITE .. "：造成暗影傷害，這意味著暗影抗性是非常重要的（抵抗前傷害為700至1000）。\n" .. RED .. "暗影護盾" .. WHITE .. "：反射所有對他施放的法術，並且對近戰攻擊者造成800至1000點傷害（綠色半圓形動畫）。護盾有效時間約為5秒。\n" .. RED .. "虛空爆炸" .. WHITE .. "：對所有附近的目標造成1000至2000點物理傷害並且將目標擊退，傷害可以由護甲減免。有時候他會連續進行2至3次類似攻擊。\n\n" .. BLUE .. "英雄難度要點：有一定的暗抗裝會很好打。王攻擊很高（因為是暗影），建議雙治療解決，開虛空盾的時候停止攻擊。",
    },

    {
    "塔瓦洛克",
    "沒有特殊戰略，基本的坦克與Dps戰",
    RED .. "半月斬" .. WHITE .. "：施放出一道弧形攻擊，對面前錐形範圍內的玩家造成普通攻擊傷害外加125點額外傷害。\n" .. RED .. "水晶囚籠" .. WHITE .. "：該技能對隨機隊員施放，每秒造成10%傷害，持續5秒。\n" .. RED .. "地震" .. WHITE .. "：對40碼內的玩家造成919至1181點物理傷害，並使他們眩暈3秒。\n\n" .. BLUE .. "英雄難度要點：硬頂此王，仍然建議2治療，注意：王大約30秒發動一次順劈，傷害是8000一下，沒錯你沒看錯，8000一下的順劈。還有範圍擊暈，攻擊頻率較高，注意開保命技能。",
    },

    {
    "奈薩斯王子薩法爾",
    "在這場戰鬥中你將會看到，奈薩斯王子薩法爾附近有3個非精英的伊斯利信標，並且他們會製造傷害（類似法師類型）。如果你讓它們生存的時間太長，它們會變成3個精英的伊斯利信標。所以你應該在對付王之前快速解決掉它們。奈薩斯王子薩法爾在戰鬥中將會從虛空中召喚它們，所以要隨時關注它們的出現，不用關心王子，將火力集中到伊斯利信標上。戰鬥的關鍵在於，在一開始的時候，由於3個伊斯利信標都是存在的，它們和王的火力都會聚集在拉怪的人身上。如果在消滅掉3個伊斯利信標之後你還沒有失去任何隊員，那麼剩下的戰鬥也沒有什麼難度了。",
    RED .. "火球" .. WHITE .. "：造成1300至1650點傷害的火球。\n" .. RED .. "冰箭" .. WHITE .. "：造成900至1200傷害的冰箭。\n" .. RED .. "冰霜新星" .. WHITE .. "：同法師技能，造成550傷害。\n\n" .. BLUE .. "英雄難度要點：打這個王他完全沒有物理攻擊，你可以放棄防禦技能堆血堆暴擊增加DPS。1.5秒左右一次的冰劍火球交替釋放，對治療是個考驗，不過還好掉血比較平穩。技能要捨得用。",
    },
};

--Quest 1 Alliance
Inst45Quest1 = "1. 安全至上"
Inst45Quest1_Level = "66"
Inst45Quest1_Attain = "64"
Inst45Quest1_Aim = "工匠莫法利厄司要你去殺掉10個伊斯利盜墓者、5個伊斯利巫士、5個奈薩斯捕獵者及5個伊斯利縛法者。\n\n一旦完成後，找到在薩法爾之前一個房間的伊斯利傳送器並啟動它。"
Inst45Quest1_Location = "工匠莫法利厄司（泰洛卡森林 - 奧齊頓; "..YELLOW.."副本入口地圖[2]"..WHITE.."）"
Inst45Quest1_Note = "虛空傳送者控制面板在"..YELLOW.."[4]"..WHITE.."。"
Inst45Quest1_Prequest = "無"
Inst45Quest1_Folgequest = "解決別人的難事"
-- No Rewards for this quest

--Quest 2 Alliance
Inst45Quest2 = "2. 解決別人的難事"
Inst45Quest2_Level = "66"
Inst45Quest2_Attain = "64"
Inst45Quest2_Aim = "護送工程師薩希恩安全的穿越法力墓地讓他可以拾取那些薩法爾的精華收集器內的精華。\n\n完成後回到法力墓地外的聯合團紮營地找奈薩斯王子哈拉瑪德回報。"
Inst45Quest2_Location = "工程師薩希恩（法力墓地; "..YELLOW.."[4]"..WHITE.."）"
Inst45Quest2_Note = "護送薩希恩之前，點擊位於"..YELLOW.."[4]"..WHITE.."的傳送器。他身邊會有幾個NPC幫助他，不過在護送之前，最好還是把副本清光光，不留活口。"
Inst45Quest2_Prequest = "安全至上"
Inst45Quest2_Folgequest = "無"
Inst45Quest2FQuest = "true"
--
Inst45Quest2name1 = "聯合團王子的腰帶"
Inst45Quest2name2 = "冷凝長手套"
Inst45Quest2name3 = "聯合團移行披肩"
Inst45Quest2name4 = "噬屍獸鑄鐵護脛"

--Quest 3 Alliance
Inst45Quest3 = "3. 暗殺競爭對手"
Inst45Quest3_Level = "66"
Inst45Quest3_Attain = "64"
Inst45Quest3_Aim = "法力墓地外的奈薩斯王子哈拉瑪德要你去殺掉奈薩斯王子薩法爾並將薩法爾裹帶帶回來給他。"
Inst45Quest3_Location = "奈薩斯王子哈拉瑪德（泰洛卡森林 -奧齊頓; "..YELLOW.."副本入口地圖[2]"..WHITE.."）。"
Inst45Quest3_Note = "奈薩斯王子薩法爾在"..YELLOW.."[5]"..WHITE.."。在這場戰鬥中你將會看到，奈薩斯王子薩法爾附近有3個非精英的伊斯利信標，他們會製造傷害（類似法師類型）。如果你讓它們生存的時間太長，它們會變成3個精英的伊斯利信標。所以你應該在對付王之前快速解決掉它們。奈薩斯王子薩法爾在戰鬥中將會從虛空中召喚它們，所以要隨時關注它們的出現，不用關心王子，將火力集中到伊斯利信標上。"
Inst45Quest3_Prequest = "無"
Inst45Quest3_Folgequest = "無"
--
Inst45Quest3name1 = "哈拉瑪德的第三硬幣護腿"
Inst45Quest3name2 = "聯合團鎧甲腿甲"
Inst45Quest3name3 = "哈拉瑪德的裹腿"
Inst45Quest3name4 = "哈拉瑪德的環接鍊甲窄褲"

--Quest 4 Alliance
Inst45Quest4 = "4. 法力墓地的靜止密室 (英雄模式)"
Inst45Quest4_Level = "70"
Inst45Quest4_Attain = "70"
Inst45Quest4_Aim = "劍刃山脈貝許爾平臺的指揮官阿密爾的影像要你使用法力墓地靜止密室鑰匙打開奧齊頓的法力墓地靜止密室。\n\n這個任務只能在英雄難度下完成。"
Inst45Quest4_Location = "指揮官阿密爾的影像（劍刃山脈 - 貝許爾平臺; "..YELLOW.."52,15"..WHITE.."）。"
Inst45Quest4_Note = "有2個密室，第一個就在班提蒙尼厄斯身後"..YELLOW.."[1]"..WHITE.."，第二個在奈薩斯王子薩法爾的房間"..YELLOW.."[5]"..WHITE.."裡。"
Inst45Quest4_Prequest = "奈薩斯王印記"
Inst45Quest4_Folgequest = "無"
Inst45Quest4PreQuest = "true"
--
Inst45Quest4name1 = "正義徽章"

--Quest 5 Alliance
Inst45Quest5 = "5. 懸賞:薩法爾的奇妙護符 (英雄每日)"
Inst45Quest5_Level = "70"
Inst45Quest5_Attain = "70"
Inst45Quest5_Aim = "風之貿易者札令姆要你取得薩法爾的奇妙護符。將東西帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst45Quest5_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst45Quest5_Note = "奈薩斯王子薩法爾在"..YELLOW.."[5]"..WHITE.."。"
Inst45Quest5_Prequest = "無"
Inst45Quest5_Folgequest = "無"
--
Inst45Quest5name1 = "正義徽章"


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

Inst46Story = "幾千年來，德萊尼人將死者埋葬在他們最神聖的廟宇奧齊頓之中。\n\n但是，暗影議會的成員卻潛入了奧齊頓，準備召喚無比邪惡的恐怖生物。他們可恥的魔法造成了一場大爆炸，將廟宇炸得四分五裂，周圍的地區也因此成為了一片焦土\n\n爆炸同時在虛空中切開了一條裂縫，將另一個世界的靈體帶入了外域。以前被埋葬的德萊尼人無法安息的靈魂在廢墟中遊蕩。而且，暗影議會召喚的恐懼生物就要突破暗影議會控制它的力量了。\n\n你必須防止它降臨到這個世界中。\n\n奧齊頓分為4個5人副本，64-66的法力墓地，65-67的奧奇奈地穴，67-69的塞司克大廳和70-72的暗影迷宮。"
Inst46Caption = "奧齊頓：塞司克大廳"
Inst46QAA = "5 個任務"
Inst46QAH = "5 個任務"
Inst46General = {
    {
    "暗法師希斯",
    "暗法師希斯本人是比較弱小的。這場戰鬥唯一需要注意的是每一召喚階段（一共有三次：75%，50%和25%）。當暗法師希斯每次召喚爪牙時，暫時不要管王，清理掉所有的元素生物。然後再把火力集中到王身上。在元素出現時使用恐懼可以降低治療壓力。",
    RED .. "秘法/冰霜/火焰震擊" .. WHITE .. "：每種都會造成480至840點傷害。\n" .. RED .. "閃電鏈" .. WHITE .. "：類似薩滿的技能，對附近幾個目標也造成傷害。\n" .. RED .. "近戰攻擊" .. WHITE .. "：近戰攻擊可造成1000至1200暗影傷害。（暗影抗性和道具在這場戰鬥中對坦克比較有用）\n" .. RED .. "召喚元素" .. WHITE .. "：每下降25%生命（指的是75%，50%和25%生命時），暗法師希斯會召喚4個元素生物（暗影，火，水和秘法）。它們的攻擊一次造成700點左右傷害，但是可以被恐懼。",
    },

    {
    "鷹王伊奇斯",
    "戰鬥時最好把王坦在中間，這樣在王釋放魔爆術的時候可以讓所有人有充分的時間躲到柱子後面（注意一定要讓柱子擋住你和王才能避免被魔爆術攻擊到），王釋放魔爆術後坦克及時把王拉回中間。",
    RED .. "秘法爆炸" .. WHITE .. "：在使用了閃現術之後，鷹王伊奇斯會馬上開始施放秘法爆炸，施法時間5秒，法術範圍40碼，造成5000至6000傷害。\n" .. RED .. "秘法散射" .. WHITE .. "：AE秘法箭（40碼），造成1500至2000秘法傷害。\n" .. RED .. "變形術" .. WHITE .. "：他會對隨機隊員施放變形術，持續5秒。法術可以被驅散，被變形的目標會回復生命值，所以最好在隊友回滿血的時候解除變羊效果。",
    },
    
     {
    "安祖（英雄模式）",
    "開始召喚以後整個大廳會有很多鳥飛起來，很是壯觀，接下來會有4個戰鷹石像圍繞著王，它們會分別給王下掉血的Debuff，以及加自己攻擊速度的Buff。法師在這裡一定要節省MP，王在70%和40%左右血會變成無敵狀態召喚小怪，大量非精英鳥，法師留MP殺掉以後即可火力全開。\n\n王會定期尖嘯，打暈全體人。不過施法前會有施法條可觀察，大約3秒反應時間，坦需要立刻打開防禦飾品，治療要套盾加好HOT。王不碾壓攻擊在2200左右，所以血必須多於6000才是安全。",
   RED .. "總體注意2點：法師留MP，治療不要OT。",
    },
};

--Quest 1 Alliance
Inst46Quest1 = "1. 兄弟鬩牆"
Inst46Quest1_Level = "69"
Inst46Quest1_Attain = "65"
Inst46Quest1_Aim = "殺掉塞司克大廳的暗法師希斯，之後釋放拉卡自由。完成拯救後回到塞司克大廳外找伊斯法。"
Inst46Quest1_Location = "伊斯法（泰洛卡森林 - 奧其頓; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst46Quest1_Note = "暗法師希斯與拉卡都在"..YELLOW.."[1]"..WHITE.."。"
Inst46Quest1_Prequest = "無"
Inst46Quest1_Folgequest = "無"
--
Inst46Quest1name1 = "塞司克預言者項圈"
Inst46Quest1name2 = "塞司克神諭者焦點"
Inst46Quest1name3 = "鷹主項圈"
Inst46Quest1name4 = "烏鴉護衛印記"

--Quest 2 Alliance
Inst46Quest2 = "2. 泰洛克的遺產"
Inst46Quest2_Level = "69"
Inst46Quest2_Attain = "65"
Inst46Quest2_Aim = "將泰洛克面罩、泰洛克羽毛及泰洛克的傳說交給塞司克大廳外的伊斯法。"
Inst46Quest2_Location = "伊斯法（泰洛卡森林 - 奧其頓; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst46Quest2_Note = "泰洛克面罩在"..YELLOW.."[1]"..WHITE.."，泰洛克的傳說在"..YELLOW.."[2]"..WHITE.."，泰洛克羽毛在"..YELLOW.."[3]"..WHITE.."。面罩和羽毛是王掉落，書在地上。"
Inst46Quest2_Prequest = "無"
Inst46Quest2_Folgequest = "無"
--
Inst46Quest2name1 = "泰洛克的傳說"
Inst46Quest2name2 = "泰洛克面罩"
Inst46Quest2name3 = "泰洛克羽毛"

--Quest 3 Alliance
Inst46Quest3 = "3. 擊敗烏鴉神 (德魯伊 - 史詩飛行任務)"
Inst46Quest3_Level = "70"
Inst46Quest3_Attain = "70"
Inst46Quest3_Aim = "殺死烏鴉神並且回到塞納里奧避難所的莫西斯．語翼那裡。\n此任務只能在英雄難度副本內完成。"
Inst46Quest3_Location = "莫西斯．語翼（贊格沼澤 - 塞納里奧避難所; "..YELLOW.."80,65"..WHITE.."）"
Inst46Quest3_Note = "這是德魯伊史詩飛行形態任務的最後一步。在"..YELLOW.."[2]"..WHITE.."召喚安祖。"
Inst46Quest3_Prequest = "尋找月亮石"
Inst46Quest3_Folgequest = "無"
Inst46Quest3PreQuest = "true"
--
Inst46Quest3name1 = "烏鴉女神塑像"

--Quest 4 Alliance
Inst46Quest4 = "4. 凱娜的要求 (英雄模式)"
Inst46Quest4_Level = "70"
Inst46Quest4_Attain = "70"
Inst46Quest4_Aim = "凱娜．拉斯蕊德要你到地獄火堡壘的破碎大廳，從大術士奈德克斯那裡取得黑暗之書，再到奧齊頓的塞司克大廳，從暗法師希斯那裡取得遺忘之名魔典。"
Inst46Quest4_Location = "凱娜．拉斯蕊德（虛空風暴 - 52區; "..YELLOW.."32,63"..WHITE.."）"
Inst46Quest4_Note = "這個任務必須在英雄難度下完成。暗法師希斯在"..YELLOW.."[1]"..WHITE.."。"
Inst46Quest4_Prequest = "朋友的協助（"..YELLOW.."卡拉贊"..WHITE.."）"
Inst46Quest4_Folgequest = "夜禍（"..YELLOW.."卡拉贊"..WHITE.."）"
Inst46Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst46Quest5 = "5. 懸賞:伊奇斯的冠羽 (英雄每日)"
Inst46Quest5_Level = "70"
Inst46Quest5_Attain = "70"
Inst46Quest5_Aim = "風之貿易者札令姆要你取得伊奇斯的冠羽。將東西帶回撒塔斯的陰鬱城交給他以領取賞金。"
Inst46Quest5_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst46Quest5_Note = "鷹王伊奇斯在"..YELLOW.."[3]"..WHITE.."。"
Inst46Quest5_Prequest = "無"
Inst46Quest5_Folgequest = "無"
--
Inst46Quest5name1 = "正義徽章"


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

--Quest2 Horde  (same as Quest 2 Alliance)
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

Inst47Story = "幾千年來，德萊尼人將死者埋葬在他們最神聖的廟宇奧齊頓之中。\n\n但是，暗影議會的成員卻潛入了奧齊頓，準備召喚無比邪惡的恐怖生物。他們可恥的魔法造成了一場大爆炸，將廟宇炸得四分五裂，周圍的地區也因此成為了一片焦土\n\n爆炸同時在虛空中切開了一條裂縫，將另一個世界的靈體帶入了外域。以前被埋葬的德萊尼人無法安息的靈魂在廢墟中遊蕩。而且，暗影議會召喚的恐懼生物就要突破暗影議會控制它的力量了。\n\n你必須防止它降臨到這個世界中。\n\n奧齊頓分為4個5人副本，64-66的法力墓地，65-67的奧奇奈地穴，67-69的塞司克大廳和70-72的暗影迷宮。"
Inst47Caption = "奧齊頓：暗影迷宮"
Inst47QAA = "11 個任務"
Inst47QAH = "11 個任務"
Inst47General = {
    {
    "海爾瑪大使",
    "這個王主要有2種技能。恐懼技能的冷卻時間是30秒鐘，酸性呼吸技能可以降低護甲。他是普通的坦克與Dps戰鬥，坦克需要切換姿態來避免恐懼。每個隊員都需要被恐懼到，因為未被恐懼的隊員將成為他的目標。",
    RED .. "範圍恐懼" .. WHITE .. "：40碼範圍內所有玩家被恐懼5秒。\n" .. RED .. "腐蝕酸箭" .. WHITE .. "：在他正前方圓錐形範圍內放射出酸性雲，降低護甲值4000至5000點，每5秒造成1100至1500點自然傷害，持續30秒。",
    },

    {
    "煽動者黑心",
    "這個王有些麻煩。首先你必須清空所有的小怪，否則王會召喚他們來幫忙。他有3個主要技能。有一個大範圍的範圍擊退，會清除仇恨，隨機衝鋒某一個隊員，以及控制所有的隊員讓玩家自相攻擊。在房間的中間坦住他。其他隊伍成員背靠柱子或在角落站立，以免被擊退的過遠。關鍵是隊員要站立得分散，在王進行心靈控制時不會進行太多的內戰。",
    RED .. "衝鋒" .. WHITE .. "：對隨機目標衝鋒，造成300至500點傷害。\n" .. RED .. "製造混亂" .. WHITE .. "：該技能會控制所有隊員15秒（不可抵抗與驅散）。同時會清空煽動者布萊卡特的仇恨列表。\n" .. RED .. "戰爭踐踏" .. WHITE .. "：範圍擊退，造成1000至2000傷害，同時清除仇恨。",
    },

    {
    "領導者瓦皮歐",
    "當王喊話的時候，會隨機從地上5個召喚法陣（王平台背後還有一個，一般沒人注意到）出現一個虛空旅者，每個2500HP，當元素怪靠近王後，會釋放範圍型的暗影衝擊並為王回部分血。所以我們採取的戰術，在王前2次傳送前，所有攻擊職業主要擊殺虛空旅者，當坦被放逐後立即驅散。在2次傳送完後，虛空旅者的刷新速度會大大加快，這時候需要坦將王拉著到處跑，盡量遠離虛空旅者，而其他控制職業這時候盡量在攻擊的同時控制住大量的虛空旅者，直到王被擊殺。",
    RED .. "群體暗影箭" .. WHITE .. "：800至1000暗影傷害。\n" .. RED .. "放逐術" .. WHITE .. "：無視仇恨隨機放逐一個目標，可驅散。\n" .. RED .. "暗影牽制" .. WHITE .. "：王回到檯子上並將所有玩家傳送至平台，在平台釋放火焰之雨，每3秒2000火焰傷害。",
    },
    
    {
    "莫爾墨",
    "首先，莫爾墨的仇恨視野很小，你可以在他周圍站好位置。這可以讓莫爾墨之觸技能只影響到一個玩家。你可以靠近牆壁減少跌落傷害。戰鬥的關鍵是讓坦克一直保持在近戰範圍內，不然莫爾墨的共鳴技能會造成滅團。在每一次莫爾墨施放音速爆破時，所有玩家包括坦克要遠離王。在這之前注意讓坦克保持滿血，因為他會受到巨大傷害。",
    RED .. "莫爾墨之觸" .. WHITE .. "：15秒的debuff，當倒數15秒滿時，隊員將爆發造成2000至3000點自然傷害，同時沉默5秒。\n" .. RED .. "音速爆破" .. WHITE .. "：當莫爾墨做出動作：『莫爾墨從空氣中集中能量…』時，他會對附近的敵人施放5000 至8000自然傷害的範圍傷害效果，同時在接下來的9秒之內還會受到持續性自然傷害。受到該技能影響的玩家移動速度下降90%。\n" .. RED .. "共鳴" .. WHITE .. "：如果莫爾墨的近戰範圍內沒有人，那麼他會對隊伍施放引導法術，造成2000點自然傷害，並且在45秒內受到的自然傷害提高2000點。",
    },
};

--Quest 1 Alliance
Inst47Quest1 = "1. 找尋間諜·吐剛"
Inst47Quest1_Level = "70"
Inst47Quest1_Attain = "68"
Inst47Quest1_Aim = "在奧齊頓的暗影迷宮裡找到間諜．吐剛。"
Inst47Quest1_Location = "間諜葛瑞克薩（泰洛卡森林 - 奧齊頓; "..YELLOW.."40,72"..WHITE.."）"
Inst47Quest1_Note = "間諜．吐剛在"..YELLOW.."[1]"..WHITE.."。"
Inst47Quest1_Prequest = "無"
Inst47Quest1_Folgequest = "靈魂儀器"
-- No Rewards for this quest

--Quest 2 Alliance
Inst47Quest2 = "2. 靈魂儀器"
Inst47Quest2_Level = "70"
Inst47Quest2_Attain = "68"
Inst47Quest2_Aim = "偷取5個靈魂儀器並把它們運送給撒塔斯城裡聖光露臺的間諜首領麥莉莎．陽冠。"
Inst47Quest2_Location = "間諜．吐剛（暗影迷宮; "..YELLOW.."[1]"..WHITE.."）"
Inst47Quest2_Note = "間諜首領麥莉莎．陽冠（撒塔斯城 - 聖光露臺; "..YELLOW.."51,45"..WHITE.."）"
Inst47Quest2_Prequest = "找尋間諜．吐剛"
Inst47Quest2_Folgequest = "無"
Inst47Quest2FQuest = "true"
--
Inst47Quest2name1 = "撒塔斯裹帶"
Inst47Quest2name2 = "間諜首領腕甲"
Inst47Quest2name3 = "奧奇奈護腕"
Inst47Quest2name4 = "薩塔式護臂"

--Quest 3 Alliance
Inst47Quest3 = "3. 惡魔之名寶典"
Inst47Quest3_Level = "70"
Inst47Quest3_Attain = "68"
Inst47Quest3_Aim = "去奧齊頓的暗影迷宮從煽動者黑心身上取得惡魔之名寶典。完成任務後向納葛蘭的奧翠司回報。"
Inst47Quest3_Location = "『受難者』奧翠司（納葛蘭; "..YELLOW.."27,43"..WHITE.."）"
Inst47Quest3_Note = "這個是影月谷連續任務的最後一步，起始NPC奧多爾在在影月谷（61,28），占星者在影月谷（55,58）。煽動者黑心在"..YELLOW.."[3]"..WHITE.."。"
Inst47Quest3_Prequest = "伊利丹的手下"
Inst47Quest3_Folgequest = "回報奧多爾或回報占卜者"
-- No Rewards for this quest

--Quest 4 Alliance
Inst47Quest4 = "4. 奧齊頓的麻煩"
Inst47Quest4_Level = "70"
Inst47Quest4_Attain = "68"
Inst47Quest4_Aim = "向泰洛卡森林裡奧齊頓的暗影迷宮入口處的戰場元帥瑪赫范報到。"
Inst47Quest4_Location = "間諜首領麥莉莎．陽冠（撒塔斯城 - 聖光露臺; "..YELLOW.."51,45"..WHITE.."）"
Inst47Quest4_Note = "戰場元帥瑪赫范在暗影迷宮門口（泰洛卡森林 - 奧齊頓; "..YELLOW.."副本入口地圖[4]"..WHITE.."）。"
Inst47Quest4_Prequest = "無"
Inst47Quest4_Folgequest = "血之聖典"
-- No Rewards for this quest

--Quest 5 Alliance
Inst47Quest5 = "5. 血之聖典"
Inst47Quest5_Level = "70"
Inst47Quest5_Attain = "68"
Inst47Quest5_Aim = "閱讀奧齊頓的暗影迷宮裡的血之聖典。"
Inst47Quest5_Location = "戰場元帥瑪赫范（泰洛卡森林 - 奧齊頓; "..YELLOW.."副本入口地圖[4]"..WHITE.."）"
Inst47Quest5_Note = "血之聖典就在領導者瓦皮歐的前面。"
Inst47Quest5_Prequest = "奧齊頓的麻煩"
Inst47Quest5_Folgequest = "進入迷宮的中心"
Inst47Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst47Quest6 = "6. 進入迷宮的中心"
Inst47Quest6_Level = "70"
Inst47Quest6_Attain = "68"
Inst47Quest6_Aim = "殺掉莫爾墨後回到撒塔斯城的聖光露臺並且向間諜首領麥莉莎．陽冠回報暗影迷宮裡頭發生的事件。"
Inst47Quest6_Location = "血之聖典（暗影迷宮; "..YELLOW.."[4]"..WHITE.."）"
Inst47Quest6_Note = "間諜首領麥莉莎．陽冠（撒塔斯城 - 聖光露臺; "..YELLOW.."51,45"..WHITE.."）"
Inst47Quest6_Prequest = "血之聖典"
Inst47Quest6_Folgequest = "無"
Inst47Quest6FQuest = "true"
--
Inst47Quest6name1 = "撒塔斯步靴"
Inst47Quest6name2 = "間諜首領的靴子"
Inst47Quest6name3 = "奧奇奈長靴"
Inst47Quest6name4 = "薩塔式護脛"

--Quest 7 Alliance
Inst47Quest7 = "7. 那魯的試煉:力量 (英雄模式)"
Inst47Quest7_Level = "70"
Inst47Quest7_Attain = "70"
Inst47Quest7_Aim = "撒塔斯城的阿達歐要你去取回卡利斯瑞的三叉戟和莫爾墨的精華。"
Inst47Quest7_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst47Quest7_Note = "此任務必須在英雄難度副本裡完成。莫爾墨在"..YELLOW.."[5]"..WHITE.."。"
Inst47Quest7_Prequest = "無"
Inst47Quest7_Folgequest = "無"
-- No Rewards for this quest

--Quest 8 Alliance
Inst47Quest8 = "8. 卡拉贊的入口"
Inst47Quest8_Level = "70"
Inst47Quest8_Attain = "68"
Inst47Quest8_Aim = "卡德加要你進入奧齊頓的暗影迷宮並從藏在那裡的秘法容器取得第一塊鑰匙碎片。"
Inst47Quest8_Location = "卡德加（撒塔斯城 - 聖光露臺; "..YELLOW.."54,44"..WHITE.."）"
Inst47Quest8_Note = "秘法容器在"..YELLOW.."[6]"..WHITE.."。這是卡拉贊鑰匙任務線的其中一個，其餘2個出自蒸汽洞窟和亞克崔茲。"
Inst47Quest8_Prequest = "卡德加"
Inst47Quest8_Folgequest = "第二和第三個碎片"
Inst47Quest8PreQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst47Quest9 = "9. 惡魔詞典"
Inst47Quest9_Level = "69"
Inst47Quest9_Attain = "67"
Inst47Quest9_Aim = "從領導者瓦皮歐身上取得惡魔詞典然後交給韋恩的避難所的大衛．韋恩。"
Inst47Quest9_Location = "大衛．韋恩（泰洛卡森林 - 韋恩的避難所; "..YELLOW.."78,39"..WHITE.."）。"
Inst47Quest9_Note = "領導者瓦皮歐在 "..YELLOW.."[4]"..WHITE.."。"
Inst47Quest9_Prequest = "額外的材料"
Inst47Quest9_Folgequest = "無"
Inst47Quest9PreQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst47Quest10 = "10. 懸賞:莫爾墨的低語 (英雄每日)"
Inst47Quest10_Level = "70"
Inst47Quest10_Attain = "70"
Inst47Quest10_Aim = "風之貿易者札令姆要你取得莫爾墨的低語。把東西帶到撒塔斯的陰鬱城交給他好換取賞金。"
Inst47Quest10_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst47Quest10_Note = "莫爾墨在"..YELLOW.."[5]"..WHITE.."。"
Inst47Quest10_Prequest = "無"
Inst47Quest10_Folgequest = "無"
--
Inst47Quest10name1 = "正義徽章"

--Quest 11 Alliance
Inst47Quest11 = "11. 懸賞:惡毒導師 (普通每日)"
Inst47Quest11_Level = "70"
Inst47Quest11_Attain = "70"
Inst47Quest11_Aim = "虛空行者瑪頓恩要你殺死3名惡毒導師。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst47Quest11_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst47Quest11_Note = "普通每日任務。"
Inst47Quest11_Prequest = "無"
Inst47Quest11_Folgequest = "無"
--
Inst47Quest11name1 = "伊斯利恩監獄鑰匙"


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

Inst48Story = "贊格沼澤微妙的生態平衡已經被破壞了。\n\n贊格沼澤的水位逐漸下降，異常的腐化現象也正擴散感染到這裡的植物生態。非自然的現像正在腐蝕和破壞沼澤原生的動植物。\n\n所有的跡象似乎都和毒蛇之湖底下新近發現的一連串洞穴有關，以及佔據在裡頭的納迦和他們的手下。\n\n傳聞這座神秘建築物的所有人不是別人，正是惡名昭彰的瓦許女士。\n\n在瓦許女士的率領之下，那些納迦似乎正在秘密重建一個新的永恆之井，而且是直接受命於背叛者伊利丹．怒風的指示。萬一要是讓他們的計畫成功的話，後果實在是不堪設想。在一切變得太遲之前，只有你能夠揭發她的惡毒計劃並阻止她和她的手下！\n\n盤牙蓄湖分為4個部分，3個5人副本（奴隸監獄，深幽泥沼，蒸汽洞窟）和一個25人團隊副本（毒蛇神殿洞穴）。"
Inst48Caption = "盤牙蓄湖：毒蛇神殿洞穴"
Inst48QAA = "2 個任務"
Inst48QAH = "2 個任務"

--Quest 1 Alliance
Inst48Quest1 = "1. 永恆之瓶"
Inst48Quest1_Level = "70"
Inst48Quest1_Attain = "70"
Inst48Quest1_Aim = "時光之穴的索芮朵蜜要你去從盤牙洞穴的瓦許女士身上取得瓦許的殘存之瓶，從風暴要塞的凱爾薩斯．逐日者身上取得凱爾薩斯的殘存之瓶。"
Inst48Quest1_Location = "索芮朵蜜（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[6]"..WHITE.."）。NPC會在附近遊蕩。"
Inst48Quest1_Note = "瓦許女士在"..YELLOW.."[6]"..WHITE.."。此任務曾經是進入海加爾山的鑰匙任務。"
Inst48Quest1_Prequest = "無"
Inst48Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst48Quest2 = "2. 保守的秘密"
Inst48Quest2_Level = "70"
Inst48Quest2_Attain = "70"
Inst48Quest2_Aim = "前往影月谷的典獄官監牢並且跟阿卡瑪交談。"
Inst48Quest2_Location = "先知歐蘭（毒蛇神殿洞穴; "..YELLOW.."[4]"..WHITE.."）"
Inst48Quest2_Note = "阿卡瑪在（影月谷 - 典獄官監牢; "..YELLOW.."58,48"..WHITE.."）。\n\n這個任務是曾經黑暗神殿開門任務的一部分，奧多爾聲望可以從隱士希拉（影月谷 - 奧多爾祭壇; "..YELLOW.."62,38"..WHITE.."）處接到，占卜者聲望可以從秘法師賽利斯（影月谷 - 星光聖所; "..YELLOW.."56,59"..WHITE.."）處接到。"
Inst48Quest2_Prequest = "巴瑞碑文→長者奧朗奴→灰舌墮落者→典獄官監牢→表明立場→阿卡瑪→阿卡瑪的承諾"
Inst48Quest2_Folgequest = "灰舌偽裝（"..YELLOW.."風暴要塞"..WHITE.."）"
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

Inst49Story = "麥迪文，最後的魔法守護者，出生時就被邪惡的泰坦薩格拉斯附身。\n\n是麥迪文第一個聯絡上了邪惡術士古爾丹並為燃燒軍團的入侵提供幫助。\n\n他們一起協力打開了黑暗之門，連通了德拉諾和艾澤拉斯，無數嗜血的獸人瘋狂湧入妄圖毀滅這個世界。\n\n這個副本設計是在黑色沼澤，也就是現在的詛咒之地。玩家們需要在麥迪文打開黑暗之門的過程中保護他。"
Inst49Caption = "時光之穴：黑暗沼澤"
Inst49QAA = "7 個任務"
Inst49QAH = "7 個任務"
Inst49General = {
    {
    "克洛諾斯領主迪賈",
    "就像其他由裂縫守護者或裂縫領主守衛著的傳送門一樣，克洛諾斯領主迪賈的傳送門也會不斷產生龍。根據你的隊伍結構，你可以暫時無視它們，首先擊殺王再幹掉龍類，你也可以在它們刷新的同時對付它們（如果你認為它們對麥迪文的威脅太大）。如果你想要優先對付王，你必須隨時驅散你的隊員身上的時間流逝狀態，因為你需要提高你的攻擊速度。",
    RED .. "時間流逝" .. WHITE .. "：降低玩家攻擊速度60%，移動速度60%，持續10秒，可以被驅散。\n" .. RED .. "致死打擊" .. WHITE .. "：對目標造成武器傷害外加若干傷害，減少治療效果50%，持續10秒。\n" .. RED .. "戰爭踐踏" .. WHITE .. "：對附近目標造成通常攻擊傷害外加500點傷害，將它們擊退，並擊暈2秒。",
    },

    {
    "坦普拉斯",
    "坦普拉斯的Debuff可以在坦克身上堆積很多層，這樣你的治療的法力會不足以保持坦克生存。一個應對的方法是讓坦克在身上的Debuff堆積了4層之後開始風箏王，同時也需要回頭對王遠程攻擊以保持仇恨。還有一個方法是使用2個坦克，輪流獲得王的仇恨。",
    RED .. "致死傷害" .. WHITE .. "：治療效果降低10%，最多可堆積10次。",
    },

    {
    "艾奧那斯",
    "最後的王是艾奧那斯。他的攻擊力很強。這裡最危險的部分是他的時間停止技能發動時，每個人都不能行動或施法。治療需要不斷的更新坦克身上的持續性治療效果。當時間停止效果消失後，馬上向坦克身上套盾，並且使用其他大治療技能恢復。它死亡之後裂縫就會關閉，麥迪文會說出最後的台詞。",
    RED .. "時間停止" .. WHITE .. "：範圍擊暈（50碼距離），持續5至8秒。",
    },
};

--Quest 1 Alliance
Inst49Quest1 = "1. 黑色沼澤"
Inst49Quest1_Level = "70"
Inst49Quest1_Attain = "66"
Inst49Quest1_Aim = "在黑暗之門開啟的期間經由穿越時光之穴到達黑色沼澤，並與塞特交談。"
Inst49Quest1_Location = "安杜姆（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[8]-[9]"..WHITE.."）"
Inst49Quest1_Note = "必須先完成逃離敦霍爾德任務才能進入黑色沼澤，塞特就在進入副本的門口。"
Inst49Quest1_Prequest = "無"
Inst49Quest1_Folgequest = "黑暗之門的開啟"
-- No Rewards for this quest

--Quest 2 Alliance
Inst49Quest2 = "2. 黑暗之門的開啟"
Inst49Quest2_Level = "70"
Inst49Quest2_Attain = "66"
Inst49Quest2_Aim = "在時光之穴的黑色沼澤裡的塞特已給予你保護麥迪文直到他成功打開黑暗之門的任務。\n\n任務完成後，回到塞特那裡。"
Inst49Quest2_Location = "塞特（黑暗沼澤 "..YELLOW.."入口[A]"..WHITE.."）"
Inst49Quest2_Note = "如果你半途失敗了，可以在門口等上個幾分鐘，副本事件又會重新重置。"
Inst49Quest2_Prequest = "黑色沼澤"
Inst49Quest2_Folgequest = "世代的拯救者"
Inst49Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst49Quest3 = "3. 世代的拯救者"
Inst49Quest3_Level = "70"
Inst49Quest3_Attain = "66"
Inst49Quest3_Aim = "回去塔納利斯沙漠的時光之穴找安杜姆。"
Inst49Quest3_Location = "安杜姆（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[8]-[9]"..WHITE.."）"
Inst49Quest3_Note = "無"
Inst49Quest3_Prequest = "開啟黑暗之門"
Inst49Quest3_Folgequest = "無"
Inst49Quest3FQuest = "true"
--
Inst49Quest3name1 = "守衛指環"
Inst49Quest3name2 = "虔誠之堅護者指環"
Inst49Quest3name3 = "時光扭曲寶石"
Inst49Quest3name4 = "安杜姆的眼淚"

--Quest 4 Alliance
Inst49Quest4 = "4. 大師之觸"
Inst49Quest4_Level = "70"
Inst49Quest4_Attain = "68"
Inst49Quest4_Aim = "進入時光之穴說服麥迪文讓復原的初生之鑰恢復能力。"
Inst49Quest4_Location = "卡德加（撒塔斯城 - 聖光露臺; "..YELLOW.."54,44"..WHITE.."）"
Inst49Quest4_Note = "殺死第18波王艾奧那斯完成副本事件之後，你才能在副本中與麥迪文"..YELLOW.."[1]"..WHITE.."對話。"
Inst49Quest4_Prequest = "第二和第三個碎片"
Inst49Quest4_Folgequest = "回到卡德加那裡"
Inst49Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst49Quest5 = "5. 大師級藥劑 (煉金術專業任務)"
Inst49Quest5_Level = "70"
Inst49Quest5_Attain = "68"
Inst49Quest5_Aim = "去時光之穴的黑色沼澤從裂縫領主還有裂縫看守者身上取得10個無限精華。同時帶著5個極效防禦藥劑、5個專精藥劑還有5個極效敏捷藥劑交給撒塔斯陰鬱城的羅洛其恩。"
Inst49Quest5_Location = "羅洛其恩（撒塔斯城 - 陰鬱城; "..YELLOW.."46,23"..WHITE.."）"
Inst49Quest5_Note = "無限精華不算好掉，可能需要打個2-3場才能蒐集完畢。"
Inst49Quest5_Prequest = "大師級藥劑"
Inst49Quest5_Folgequest = "無"
Inst49Quest5PreQuest = "有"
-- No Rewards for this quest

--Quest 6 Alliance
Inst49Quest6 = "6. 懸賞:艾奧那斯的沙漏 (英雄每日)"
Inst49Quest6_Level = "70"
Inst49Quest6_Attain = "70"
Inst49Quest6_Aim = "風之貿易者札令姆要你取得艾奧那斯的沙漏。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst49Quest6_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst49Quest6_Note = "艾奧那斯就是最後一波的王。"
Inst49Quest6_Prequest = "無"
Inst49Quest6_Folgequest = "無"
--
Inst49Quest6name1 = "正義徽章"

--Quest 7 Alliance
Inst49Quest7 = "7. 懸賞:裂縫領主 (普通每日)"
Inst49Quest7_Level = "70"
Inst49Quest7_Attain = "70"
Inst49Quest7_Aim = "虛空行者瑪頓恩要你殺死4名裂縫領主。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst49Quest7_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst49Quest7_Note = "普通每日任務。"
Inst49Quest7_Prequest = "無"
Inst49Quest7_Folgequest = "無"
--
Inst49Quest7name1 = "正義徽章"


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

Inst50Story = "在麥迪文的指導下，索爾和卡林多人類部隊首領珍娜．普勞德摩爾體認到他們必須將分歧拋之腦後。/n/n同時，瑪法里恩和泰蘭妲領導的夜精靈也意識到他們必須團結起來才能保護世界之樹。在達成共識之後，艾澤拉斯的各個種族開始盡最大可能加強世界之樹的防禦工事。/n/n瑪法里恩依靠所有人的力量成功地釋放出諾達希爾的怒火，徹底消滅了阿克蒙德，將燃燒軍團從永恆之井趕了出去。/n/n這場最後的戰役震撼了卡林多的大地，未能吸取永恆之井能量的燃燒軍團在艾澤拉斯聯合陣營的威力面前灰飛煙滅。"
Inst50Caption = "時光之穴：海加爾山"
Inst50QAA = "1 個任務"
Inst50QAH = "1 個任務"

--Quest 1 Alliance
Inst50Quest1 = "1. 古老的神器"
Inst50Quest1_Level = "70"
Inst50Quest1_Attain = "70"
Inst50Quest1_Aim = "前往塔納利斯的時光之穴並且進入海加爾山戰役。進入之後，擊敗瑞齊．凜冬並且將時間定相骨匣交給影月谷的阿卡瑪。"
Inst50Quest1_Location = "阿卡瑪（影月谷 - 典獄官監牢; "..YELLOW.."58,48"..WHITE.."）"
Inst50Quest1_Note = "瑞齊．凜冬在"..YELLOW.."[1]"..WHITE.."。此任務曾經是進入黑暗神廟的鑰匙任務。"
Inst50Quest1_Prequest = "灰舌偽裝（風暴要塞）"
Inst50Quest1_Folgequest = "囚禁的靈魂"
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

Inst51Story = "敦霍爾德城堡是人類與獸族第二次大戰時羅德隆王國的南方前沿要塞。\n\n這時候索爾在人族指揮官布萊克眼裡，索爾只不過是一個傀儡酋長。他想利用索爾的力量來控制其他人。\n\n但是索爾知道，他生來注定要帶領獸人擺脫枷鎖，所以他開始了逃離敦霍爾德的旅程。\n\n這個副本表現的是10年前的希爾斯布萊德丘陵，那時部落還沒有摧毀敦霍爾德而且塔倫米爾還沒有淪陷在天譴軍團手裡。"
Inst51Caption = "時光之穴：希爾斯布萊德丘陵舊址"
Inst51QAA = "6 個任務"
Inst51QAH = "6 個任務"
Inst51General = {
    {
    "中尉崔克",
    "當兵營陷入大火並爆炸之後，第一個王中尉崔克就會出現了。這是很簡單的戰鬥，他是一個典型的戰士，你知道應該怎麼對付他。",
    RED .. "斷筋" .. WHITE .. "：對目標造成63點傷害並且降低移動速度50%，持續15秒。\n" .. RED .. "脅迫怒吼" .. WHITE .. "：使目標因恐懼而麻痺8秒，周圍其他目標逃跑。\n" .. RED .. "致死打擊" .. WHITE .. "：對目標造成武器傷害外加120點額外傷害，降低所有治療的效果50%，持續10秒。\n" .. RED .. "旋風斬" .. WHITE .. "：攻擊周圍所有目標，造成武器傷害外加300點額外傷害。",
    },

    {
    "史卡拉克上尉",
    "史卡拉克上尉總是帶著2個手下，一個敦霍爾德老兵和一個敦霍爾德獄卒。在跑出敦霍爾德城堡之後，史卡拉克上尉將騎馬追上來。然後他會下馬和索爾對話。在這段時間裡可以吃喝至最佳狀態。當他們談話結束後戰鬥就開始了。首先要殺死敦霍爾德獄卒，因為他的心靈尖嘯很麻煩，然後是另一個手下。索爾會在戰鬥中幫助你。治療需要稍微照看索爾的生命值。史卡拉克上尉是一個聖騎士，有時候他會治療自己（需要打斷）。",
    RED .. "清潔術" .. WHITE .. "：清潔一個隊友，消除一個中毒效果，一個疾病效果和一個魔法效果。\n" .. RED .. "正義之錘" .. WHITE .. "：擊暈一個敵人，使其不能移動或戰鬥，持續6秒。\n" .. RED .. "聖光術" .. WHITE .. "：治療一個隊友5600至5900點生命。\n" .. RED .. "神聖之盾" .. WHITE .. "：提高格檔幾率30%，持續10秒，每次成功的格檔後對攻擊者造成350至450點傷害。",
    },

    {
    "紀元狩獵者",
    "戰鬥之前有3波龍需要擊敗。前2波每波有3隻龍，第3波有4隻。每一波中都有1隻施法者類型的需要在沒有坦克的情況下優先擊殺，因為他們會給近戰目標施放一個Debuff：減少50%治療效果和減少50%傷害。有時候第3波中有2隻這種龍。在3波龍都死亡之後，你有短暫的時間來休息。頭目戰很簡單，不需要補充你的Buff，因為王會週期性的消除它們。死亡來臨技能，會對隨機目標施放。坦克應該背靠牆壁坦克，以免被王擊飛。",
    RED .. "死亡來臨" .. WHITE .. "：每3秒造成750點暗影傷害。\n" .. RED .. "魔法干擾光環" .. WHITE .. "：週期性從附近敵對目標身上移除魔法效果。\n" .. RED .. "砂之吐息" .. WHITE .. "：對自己面前圓錐型範圍內目標造成秘法傷害，降低移動速度50%，攻擊速度延長100%，持續10秒。",
    },
};

--Quest 1 Alliance
Inst51Quest1 = "1. 舊時的希爾斯布萊德"
Inst51Quest1_Level = "68"
Inst51Quest1_Attain = "66"
Inst51Quest1_Aim = "時光之穴的安杜姆要你到希爾斯布萊德丘陵去跟伊洛森談談。"
Inst51Quest1_Location = "安杜姆（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[8]-[9]"..WHITE.."）"
Inst51Quest1_Note = "要接到這個任務必須先完成時光之穴門口守護巨龍接的任務。"
Inst51Quest1_Prequest = "時光之穴"
Inst51Quest1_Folgequest = "塔蕾莎的聲東擊西"
Inst51Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst51Quest2 = "2. 塔蕾莎的聲東擊西"
Inst51Quest2_Level = "68"
Inst51Quest2_Attain = "66"
Inst51Quest2_Aim = "前往敦霍爾德城堡，使用伊洛森交給你的燃燒炸彈包裹在每一個拘留守衛室裡的桶中放置5個燃燒炸藥。\n\n當你引爆拘留守衛室後，與敦霍爾德城堡地牢裡的索爾談談。"
Inst51Quest2_Location = "伊洛森（希爾斯布萊德丘陵舊址 "..YELLOW.."入口[A]"..WHITE.."）"
Inst51Quest2_Note = "可以順便去舊時的南海鎮看看那些名人，像老莫格萊尼和年輕時的克爾蘇加德。"
Inst51Quest2_Prequest = "舊時的希爾斯布萊德"
Inst51Quest2_Folgequest = "逃離敦霍爾德"
Inst51Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst51Quest3 = "3. 逃離敦霍爾德"
Inst51Quest3_Level = "68"
Inst51Quest3_Attain = "66"
Inst51Quest3_Aim = "當你準備開始時，讓索爾知道。跟著索爾離開敦霍爾德城堡，並協助他釋放塔蕾莎以及完成他的天命。\n\n任務完成後到希爾斯布萊德找伊洛森談談。"
Inst51Quest3_Location = "索爾（希爾斯布萊德丘陵舊址 - 敦霍爾德城堡; "..YELLOW.."城堡的地下室[2]"..WHITE.."）"
Inst51Quest3_Note = "護送索爾的路上你會遇見2個王，如果你半路失敗，則須要重新回到敦霍爾德城堡等待索爾重生。"
Inst51Quest3_Prequest = "塔蕾莎的聲東擊西"
Inst51Quest3_Folgequest = "回去安杜姆身邊"
Inst51Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst51Quest4 = "4. 回去安杜姆身邊"
Inst51Quest4_Level = "68"
Inst51Quest4_Attain = "66"
Inst51Quest4_Aim = "回去塔納利斯沙漠的時光之穴找安杜姆。"
Inst51Quest4_Location = "安杜姆（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[8]-[9]"..WHITE.."）"
Inst51Quest4_Note = "無"
Inst51Quest4_Prequest = "逃離敦霍爾德"
Inst51Quest4_Folgequest = "無"
Inst51Quest4FQuest = "true"
--
Inst51Quest4name1 = "暴風之觸手套"
Inst51Quest4name2 = "南海鎮運動鞋"
Inst51Quest4name3 = "塔倫米爾防衛者繫腰"
Inst51Quest4name4 = "酋長的披肩"

--Quest 5 Alliance
Inst51Quest5 = "5. 懸賞:紀元狩獵者的頭顱 (英雄每日)"
Inst51Quest5_Level = "70"
Inst51Quest5_Attain = "70"
Inst51Quest5_Aim = "風之貿易者札令姆要你取得紀元狩獵者的頭顱。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst51Quest5_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst51Quest5_Note = "紀元狩獵者在"..YELLOW.."[5]"..WHITE.."。"
Inst51Quest5_Prequest = "無"
Inst51Quest5_Folgequest = "無"
--
Inst51Quest5name1 = "正義徽章"

--Quest 6 Alliance
Inst51Quest6 = "6. 漂亮的帽子……"
Inst51Quest6_Level = "68"
Inst51Quest6_Attain = "66"
Inst51Quest6_Aim = "唐卡洛斯無意間對你發出挑戰，要你去希爾斯布萊德丘陵舊址擊敗年輕時的他。完成後，將唐卡洛斯之帽帶回塔納利斯交給他做為證明。"
Inst51Quest6_Location = "唐卡洛斯（塔納利斯; "..YELLOW.."54,29"..WHITE.."）"
Inst51Quest6_Note = "年輕時的唐卡洛斯在"..YELLOW.."[6]"..WHITE.."附近的路上以東西方向來回游蕩，但是不會走過河邊的橋。"
Inst51Quest6_Prequest = "無"
Inst51Quest6_Folgequest = "無"
--
Inst51Quest6name1 = "哈里斯康有邊帽"


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

Inst52Story = "弒龍者戈魯爾，正如它的名字，是一個嗜血屠龍的怪物，它也是25人團隊戈魯爾之巢的最終王。"
Inst52Caption = "戈魯爾之巢"
Inst52QAA = "1 個任務"
Inst52QAH = "1 個任務"

--Quest 1 Alliance
Inst52Quest1 = "1. 卡德許的鬥棍"
Inst52Quest1_Level = "70"
Inst52Quest1_Attain = "70"
Inst52Quest1_Aim = "盤牙蓄湖中奴隸監獄的『異端』司卡利斯要你帶給他土靈徽記和熾烈徽記。"
Inst52Quest1_Location = "『異端』司卡利斯在（盤牙蓄湖 - 奴隸監獄; "..YELLOW.."英雄模式 [3]"..WHITE.."）"
Inst52Quest1_Note = "土靈徽記掉落自戈魯爾"..YELLOW.."戈魯爾之巢[2]"..WHITE.."，熾烈徽記掉落自夜禍"..YELLOW.."卡拉贊 [11]"..WHITE.."。\n\n這個任務曾經是毒蛇神殿的進門任務。"
Inst52Quest1_Prequest = "無"
Inst52Quest1_Folgequest = "無"
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

Inst53Story = "麥迪文之塔以艾澤拉斯偉大的魔法師–先知麥迪文而聞名天下。\n\n他死後，一場突如其來的巨大災難降臨在這和周邊的土地上。\n\n近幾年來，一些暮色森林的貴族曾冒險去逆風小徑探險並調查彌漫在那一帶的奇異的死亡氣息。他們進入了黑暗中的高塔，卻再有沒有回來。\n\n事實上，一些目擊者堅稱那些貴族們的亡魂依然徘徊在卡拉贊之內，痛苦地忍受著詛咒的折磨，他們將永遠也無法離開塔中支離破碎的大廳。另有一些其他的亡魂占據了昔日麥迪文那間令人毛骨悚然的研究室，那裡充滿了惡魔對於瘋狂法師召喚的回應。\n\n坐落在逆風小徑的卡拉贊是10人的70級團隊副本。"
Inst53Caption = "卡拉贊"
Inst53QAA = "15 個任務"
Inst53QAH = "15 個任務"

--Quest 1 Alliance
Inst53Quest1 = "1. 評估狀況"
Inst53Quest1_Level = "70"
Inst53Quest1_Attain = "68"
Inst53Quest1_Aim = "找到卡拉贊裡的卡爾侖。"
Inst53Quest1_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest1_Note = "卡爾侖就在過了獵人阿圖曼之後的"..YELLOW.."[6]"..WHITE.."。"
Inst53Quest1_Prequest = "紫羅蘭之眼"
Inst53Quest1_Folgequest = "琪安娜的日誌"
Inst53Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst53Quest2 = "2. 琪安娜的日誌"
Inst53Quest2_Level = "70"
Inst53Quest2_Attain = "68"
Inst53Quest2_Aim = "搜索卡拉贊的客房尋找琪安娜的日誌並帶給卡拉贊外的大法師艾特羅斯。"
Inst53Quest2_Location = "卡爾侖（卡拉贊; "..YELLOW.."[6]"..WHITE.."）"
Inst53Quest2_Note = "大法師艾特羅斯（逆風小徑; "..YELLOW.."副本入口地圖[3]"..WHITE.."）。日誌就在通向貞潔聖女大廳的第二個房間"..YELLOW.."[10]"..WHITE.."的桌子上。"
Inst53Quest2_Prequest = "評估狀況"
Inst53Quest2_Folgequest = "惡魔存在"
Inst53Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst53Quest3 = "3. 惡魔存在"
Inst53Quest3_Level = "70"
Inst53Quest3_Attain = "68"
Inst53Quest3_Aim = "大法師艾特羅斯要你去摧毀卡拉贊頂端的惡魔存在。"
Inst53Quest3_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest3_Note = "莫克札王子（卡拉贊; "..YELLOW.."[26]"..WHITE.."）"
Inst53Quest3_Prequest = "琪安娜的日誌"
Inst53Quest3_Folgequest = "新的指令"
Inst53Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst53Quest4 = "4. 新的指令"
Inst53Quest4_Level = "70"
Inst53Quest4_Attain = "68"
Inst53Quest4_Aim = "和達拉然郊區的大法師賽卓克談談。"
Inst53Quest4_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest4_Note = "大法師賽卓克（奧特蘭克山脈 - 達拉然; "..YELLOW.."15,54"..WHITE.."）"
Inst53Quest4_Prequest = "惡魔存在"
Inst53Quest4_Folgequest = "無"
Inst53Quest4FQuest = "true"
--
Inst53Quest4name1 = "紫羅蘭徽章"

--Quest 5 Alliance
Inst53Quest5 = "5. 麥迪文的日記"
Inst53Quest5_Level = "70"
Inst53Quest5_Attain = "70"
Inst53Quest5_Aim = "逆風小徑的大法師艾特羅斯要你進入卡拉贊並和瑞依恩談談。"
Inst53Quest5_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest5_Note = "需要紫羅蘭之眼尊敬才能接到任務。瑞依恩在圖書館館長的後面"..YELLOW.."[17]"..WHITE.."。"
Inst53Quest5_Prequest = "無"
Inst53Quest5_Folgequest = "妥善保管"
-- No Rewards for this quest

--Quest 6 Alliance
Inst53Quest6 = "6. 妥善保管"
Inst53Quest6_Level = "70"
Inst53Quest6_Attain = "70"
Inst53Quest6_Aim = "到卡拉贊和守護者圖書館的葛瑞戴談談。"
Inst53Quest6_Location = "瑞依恩（卡拉贊; "..YELLOW.."圖書館[17]"..WHITE.."）"
Inst53Quest6_Note = "葛瑞戴和瑞依恩在同一個房間。"
Inst53Quest6_Prequest = "麥迪文的日記"
Inst53Quest6_Folgequest = "康席斯"
Inst53Quest6FQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst53Quest7 = "7. 康席斯"
Inst53Quest7_Level = "70"
Inst53Quest7_Attain = "70"
Inst53Quest7_Aim = "到卡拉贊和守護者圖書館的康席斯談談。"
Inst53Quest7_Location = "葛瑞戴（卡拉贊; "..YELLOW.."圖書館[18]"..WHITE.."）"
Inst53Quest7_Note = "康席斯和葛瑞戴在同一個房間。"
Inst53Quest7_Prequest = "妥善保管"
Inst53Quest7_Folgequest = "埃蘭之影"
Inst53Quest7FQuest = "true"
-- No Rewards for this quest

--Quest 8 Alliance
Inst53Quest8 = "8. 埃蘭之影"
Inst53Quest8_Level = "70"
Inst53Quest8_Attain = "70"
Inst53Quest8_Aim = "取得麥迪文的日記並帶到卡拉贊的守護者圖書館交給康席斯。"
Inst53Quest8_Location = "康席斯（卡拉贊; "..YELLOW.."圖書館[19]"..WHITE.."）"
Inst53Quest8_Note = "埃蘭之影在 "..YELLOW.."[21]"..WHITE.."。"
Inst53Quest8_Prequest = "康席斯"
Inst53Quest8_Folgequest = "大師的露臺"
Inst53Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst53Quest9 = "9. 大師的露臺"
Inst53Quest9_Level = "70"
Inst53Quest9_Attain = "70"
Inst53Quest9_Aim = "前往卡拉贊的大師的露臺並閱讀麥迪文的日記。完成任務後帶著麥迪文的日記回到大法師艾特羅斯那裡。"
Inst53Quest9_Location = "康席斯（卡拉贊; "..YELLOW.."圖書館[19]"..WHITE.."）"
Inst53Quest9_Note = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest9_Prequest = "埃蘭之影"
Inst53Quest9_Folgequest = "發掘過去"
Inst53Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst53Quest10 = "10. 發掘過去"
Inst53Quest10_Level = "70"
Inst53Quest10_Attain = "70"
Inst53Quest10_Aim = "大法師艾特羅斯要你去卡拉贊南方山脈的逆風小徑取回一個燒焦的白骨碎片。"
Inst53Quest10_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest10_Note = "燒焦的白骨碎片在逆風小徑"..YELLOW.."副本入口地圖[6]"..WHITE.."。"
Inst53Quest10_Prequest = "大師的露臺"
Inst53Quest10_Folgequest = "朋友的協助"
Inst53Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst53Quest11 = "11. 朋友的協助"
Inst53Quest11_Level = "70"
Inst53Quest11_Attain = "70"
Inst53Quest11_Aim = "將燒焦的白骨碎片帶給虛空風暴的凱娜．拉斯蕊德。"
Inst53Quest11_Location = "大法師艾特羅斯（逆風小徑 - 卡拉贊; "..YELLOW.."副本入口地圖[3]"..WHITE.."）"
Inst53Quest11_Note = "凱娜．拉斯蕊德（虛空風暴 - 52區; "..YELLOW.."32,63"..WHITE.."）"
Inst53Quest11_Prequest = "發掘過去"
Inst53Quest11_Folgequest = "凱娜的要求"
Inst53Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst53Quest12 = "12. 凱娜的要求"
Inst53Quest12_Level = "70"
Inst53Quest12_Attain = "70"
Inst53Quest12_Aim = "凱娜．拉斯蕊德要你到地獄火堡壘的破碎大廳，從大術士奈德克斯那裡取得黑暗之書，再到奧齊頓的塞司克大廳，從暗法師希斯那裡取得遺忘之名魔典。\n\n這個任務必須在英雄難度下完成。"
Inst53Quest12_Location = "凱娜．拉斯蕊德（虛空風暴 - 52區; "..YELLOW.."32,63"..WHITE.."）"
Inst53Quest12_Note = "這個任務必須在英雄難度下完成。需要你跑一遍英雄難度的破碎大廳和塞司克大廳。"
Inst53Quest12_Prequest = "朋友的協助"
Inst53Quest12_Folgequest = "夜禍"
Inst53Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst53Quest13 = "13. 夜禍"
Inst53Quest13_Level = "70"
Inst53Quest13_Attain = "70"
Inst53Quest13_Aim = "前往卡拉贊的大師的露臺使用凱娜的骨灰罈來召喚夜禍。從夜禍的屍體取得微弱的秘法精華並帶給大法師艾特羅斯。"
Inst53Quest13_Location = "凱娜．拉斯蕊德（虛空風暴 - 52區; "..YELLOW.."32,63"..WHITE.."）"
Inst53Quest13_Note = "夜禍在"..YELLOW.."[15]"..WHITE.."。如果你成功殺死了夜禍，那就找大法師艾特羅斯領取獎勵吧，祝你好運！"
Inst53Quest13_Prequest = "凱娜的要求"
Inst53Quest13_Folgequest = "無"
Inst53Quest13FQuest = "true"
--
Inst53Quest13name1 = "波光紫水晶"
Inst53Quest13name2 = "舒心紫水晶"
Inst53Quest13name3 = "灌能紫水晶"

--Quest 14 Alliance
Inst53Quest14 = "14. 卡德許的鬥棍"
Inst53Quest14_Level = "70"
Inst53Quest14_Attain = "70"
Inst53Quest14_Aim = "盤牙蓄湖中奴隸監獄的『異端』司卡利斯要你帶給他土靈徽記和熾烈徽記。"
Inst53Quest14_Location = "『異端』司卡利斯在（盤牙蓄湖 - 奴隸監獄; "..YELLOW.."英雄難度[4]"..WHITE.."）"
Inst53Quest14_Note = "土靈徽記掉落自戈魯爾"..YELLOW.."戈魯爾之巢[2]"..WHITE.."，熾烈徽記掉落自夜禍"..YELLOW.."卡拉贊 [11]"..WHITE.."。\n\n這個任務曾經是毒蛇神殿的進門任務。"
Inst53Quest14_Prequest = "無"
Inst53Quest14_Folgequest = "無"
-- No Rewards for this quest

--Quest 15 Alliance
Inst53Quest15 = "15. 滿載秘密的房間"
Inst53Quest15_Level = "70"
Inst53Quest15_Attain = "70"
Inst53Quest15_Aim = "銀色黎明大使要你到卡拉贊的佣人區去，搜索坦瑞斯．暗血的房間。"
Inst53Quest15_Location = "銀色黎明大使（各種族主城以及東瘟疫之地 - 聖光之願禮拜堂）"
Inst53Quest15_Note = "這個任務只有在2008年10月底至11月初的天譴入侵事件期間才會出現。\n\n要完成這個任務，你必須調查位在獵人阿圖曼上方的佣人房("..YELLOW.."[5]"..WHITE..")中，坦瑞斯．暗血王子身後的捲軸。每個人都必須確實調查捲軸以完成任務。"
Inst53Quest15_Prequest = "無"
Inst53Quest15_Folgequest = "無"
--
Inst53Quest15name1 = "怪物殺戮者工具包"


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
Inst53Quest15name1_HORDE = Inst55Quest15name1



--------------- INST54 - TK: Arcatraz (Arc) ---------------
Inst54Story = "風暴要塞原先是神秘的那魯用來在大宇宙中旅行的跨次元飛船。燃燒軍團的統領–墮落泰坦薩格拉斯看見了來自阿古斯行星的艾瑞達人的智慧，決定使他們成為他的惡魔軍隊的一員。阿克蒙德和基爾加丹，艾瑞達人的2個領袖，接受了薩格拉斯的邀請。但是第三位領袖維倫看到薩格拉斯是邪惡的，乘坐著那魯的風暴要塞逃離了阿古斯行星。穿越了扭曲虛空之後，維倫和他的追隨者最終到達了一個被他們稱為德拉諾的新世界。基爾加丹為了消滅所有艾瑞達人的殘餘（現在被稱為德萊尼人），將德拉諾大陸的獸人腐化為野蠻的戰士，大肆屠殺德萊尼人。此外，血精靈的領袖凱爾薩斯王子發現了風暴要塞中潛藏的秘法能量，用武力將風暴要塞從那魯和德萊尼人手中搶了過來。"
Inst54Caption = "風暴要塞：亞克崔茲"
Inst54QAA = "6 個任務"
Inst54QAH = "6 個任務"
Inst54General = {

    {
    "無約束的希瑞奇斯",
    "暗影抗性裝備和藥水在戰鬥中非常有效，因為王本身就是暗影屬性。他所有的技能都可以躲開，虛空領域看上去就是一個黑色圓環，不要站在裡面就可以了。至於腐蝕之種，它的攻擊範圍很小，只有10碼。",
    RED .. "腐蝕之種" .. WHITE .. "：對目標施放一枚惡魔種子，在18秒內造成3600點暗影傷害。當目標受到2500點暗影傷害之後，種子會爆發，對10碼內的玩家造成傷害。\n" .. RED .. "暗影新星" .. WHITE .. "：範圍性暗影衝擊波，造成2200至2500暗影傷害，附帶擊退效果。\n" .. RED .. "隨機虛空領域" .. WHITE .. "：在房間內隨機施放，對處於其中的玩家造成每秒1500暗影傷害。",
    },

    {
    "末日預言者達利亞",
    "必須要避免的一點是不要在坦克身上有Debuff的時候治療他。當末日預言者達利亞開始施放旋風技能時（她在這個時候不會移動），所有人包括坦克在內都需要退開。當旋風技能結束時她會施放治療，這時候近戰再上去打斷。",
    RED .. "末日預言者的恩賜" .. WHITE .. "：這是一個危險的Debuff，不能被驅散。當身上有這個Debuff的隊員受到治療時，有一定機率也會治療末日預言者達利亞。\n" .. RED .. "治療" .. WHITE .. "：在她生命不多時，施放了旋風技能之後她會施放這個技能。可以被打斷（腳踢，反制等）。\n" .. RED .. "旋風" .. WHITE .. "：對附近的敵人進行旋風打擊，持續8秒，造成通常傷害外加725點額外傷害。",
    },

    {
    "怒鐮者索扣斯瑞特",
    "這個王比較難。他的擊飛技能能夠把玩家打飛40碼。這樣你必須背靠牆。這樣當玩家背靠牆之後他會對隨機玩家進行衝鋒，在身後留下一道火痕。火痕會造成直接傷害和火系Dot。\n此外，不要站在王附近。他的火焰光環範圍大約在15碼左右，進入這個範圍的玩家會受到一個火焰Debuff的火焰傷害。你的隊伍必須盡快幹掉這個王，治療者不可能在這裡支持很長時間。在必要的時候德魯伊需要啟動牧師。",
    RED .. "擊飛" .. WHITE .. "：對附近10碼的玩家進行沉重打擊並將他們擊飛。\n" .. RED .. "獻祭" .. WHITE .. "：對附近的玩家造成每2秒832至918點火焰傷害。\n" .. RED .. "惡魔之火殘焰" .. WHITE .. "：怒鐮者索扣斯瑞特經過的地方身後將留下一道火焰殘餘，對任何站在上面的玩家造成每秒2000點傷害。\n" .. RED .. "惡魔之火震擊" .. WHITE .. "：對一個玩家造成1500直接傷害，並且接下來受到12秒的火焰Dot效果。",
    },

    {
    "先驅者史蓋力司",
    "這一場戰鬥很有趣，也很有挑戰。當你靠近這個正在引導一個大箱子的血精靈法師時，事件就會開始了。他會分別開啟四個箱子，其中第二個箱子是一個地精，他會在後來的戰鬥中幫助你。其餘3個箱子分別是小鬼，神似熔火之心7王的怪和精英龍人，中間有休息時間。王戰鬥一開始是基本的坦克與輸出戰，但是他的技能很厲害。精神燃燒會對隊員造成大量傷害，而一次不走運的精神控制會使戰鬥變得更為艱難。在戰鬥中他會複製自己2至3次，所以開打前最好在本體上放一個標記以示區別。這時候你將會面對2個先驅者。所有隊員應該馬上將火力集中到無人坦克的那個先驅者身上（也就是沒有標記的那隻）。新出現的先驅者的生命較少，可以被很快殺死。如果你的隊伍能夠幹掉複製，同時保持生存，那麼勝利最終屬於你們。",
    RED .. "精神燃燒" .. WHITE .. "：對隨機隊伍目標造成1500至2000點傷害。\n" .. RED .. "精神控制" .. WHITE .. "：對隨機隊伍目標進行精神控制。\n" .. RED .. "複製" .. WHITE .. "：複製自己，出現一個同樣技能但是HP很低的精英。",
    },
};

--Quest 1 Alliance
Inst54Quest1 = "1. 厄運通報者"
Inst54Quest1_Level = "70"
Inst54Quest1_Attain = "67"
Inst54Quest1_Aim = "你的任務是去風暴要塞的亞克崔茲殺死先驅者史蓋力司。任務完成後回去撒塔斯城的聖光露臺找阿達歐。"
Inst54Quest1_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst54Quest1_Note = "先驅者史蓋力司在"..YELLOW.."[6]"..WHITE.."。這是虛空風暴開始的一個連續任務，初始任務NPC是虛空行者凱澤（虛空風暴 - 52區; "..YELLOW.."32,64"..WHITE.."）。"
Inst54Quest1_Prequest = "完成三角測量"
Inst54Quest1_Folgequest = "無"
Inst54Quest1PreQuest = "true"
--
Inst54Quest1name1 = "權勢薩塔垂飾"
Inst54Quest1name2 = "阿達歐的恢復項鍊"
Inst54Quest1name3 = "撒塔斯力量頸飾"

--Quest 2 Alliance
Inst54Quest2 = "2. 先知烏達羅"
Inst54Quest2_Level = "70"
Inst54Quest2_Attain = "68"
Inst54Quest2_Aim = "到風暴要塞的亞克崔茲找到先知烏達羅。"
Inst54Quest2_Location = "阿卡瑪（影月谷 - 典獄官監獄; "..YELLOW.."58,48"..WHITE.."）"
Inst54Quest2_Note = "先知烏達羅在"..YELLOW.."[5]"..WHITE.."。需要完成影月谷的一個連續任務，初始NPC在影月谷，奧多爾聲望可以從隱士希拉（影月谷 - 奧多爾祭壇; "..YELLOW.."62,38"..WHITE.."）處接到，占卜者聲望可以從秘法師賽利斯（影月谷 - 星光聖所; "..YELLOW.."56,59"..WHITE.."）處接到。"
Inst54Quest2_Prequest = "阿卡瑪"
Inst54Quest2_Folgequest = "神秘的徵兆"
Inst54Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst54Quest3 = "3. 那魯的試煉:堅毅 (英雄模式)"
Inst54Quest3_Level = "70"
Inst54Quest3_Attain = "70"
Inst54Quest3_Aim = "撒塔斯城的阿達歐要你去援救來自風暴要塞，亞克崔茲的米歐浩斯．曼納斯頓。"
Inst54Quest3_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst54Quest3_Note = "這個任務需要英雄難度。米歐浩斯．曼納斯頓就在守望者米利恰爾的房間"..YELLOW.."[6]"..WHITE.."。"
Inst54Quest3_Prequest = "無"
Inst54Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst54Quest4 = "4. 第二和第三個碎片"
Inst54Quest4_Level = "70"
Inst54Quest4_Attain = "68"
Inst54Quest4_Aim = "在盤牙蓄湖的秘法容器裡取得第二塊鑰匙碎片，風暴要塞的秘法容器裡取得第三塊鑰匙碎片。完成任務後回到撒塔斯城的卡德加那裡。"
Inst54Quest4_Location = "卡德加（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst54Quest4_Note = "秘法容器在"..YELLOW.."[2]"..WHITE.."。"
Inst54Quest4_Prequest = "卡拉贊的入口（暗影迷宮）"
Inst54Quest4_Folgequest = "大師之觸（黑色沼澤）"
Inst54Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst54Quest5 = "5. 懸賞:史蓋力司卷軸 (英雄每日)"
Inst54Quest5_Level = "70"
Inst54Quest5_Attain = "70"
Inst54Quest5_Aim = "風之貿易者札令姆要你取得史蓋力司卷軸。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst54Quest5_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst54Quest5_Note = "先驅者史蓋力司在"..YELLOW.."[6]"..WHITE.."。"
Inst54Quest5_Prequest = "無"
Inst54Quest5_Folgequest = "無"
--
Inst54Quest5name1 = "正義徽章"

--Quest 6 Alliance
Inst54Quest6 = "6. 懸賞:亞克崔茲哨兵 (普通每日)"
Inst54Quest6_Level = "70"
Inst54Quest6_Attain = "70"
Inst54Quest6_Aim = "虛空行者瑪頓恩要你解決5個亞克崔茲哨兵。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst54Quest6_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst54Quest6_Note = "普通每日。"
Inst54Quest6_Prequest = "無"
Inst54Quest6_Folgequest = "無"
--
Inst54Quest6name1 = "伊斯利恩監獄鑰匙"


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

Inst55Story = "風暴要塞原先是神秘的那魯用來在大宇宙中旅行的跨次元飛船。燃燒軍團的統領–墮落泰坦薩格拉斯看見了來自阿古斯行星的艾瑞達人的智慧，決定使他們成為他的惡魔軍隊的一員。阿克蒙德和基爾加丹，艾瑞達人的2個領袖，接受了薩格拉斯的邀請。但是第三位領袖維倫看到薩格拉斯是邪惡的，乘坐著那魯的風暴要塞逃離了阿古斯行星。穿越了扭曲虛空之後，維倫和他的追隨者最終到達了一個被他們稱為德拉諾的新世界。基爾加丹為了消滅所有艾瑞達人的殘餘（現在被稱為德萊尼人），將德拉諾大陸的獸人腐化為野蠻的戰士，大肆屠殺德萊尼人。此外，血精靈的領袖凱爾薩斯王子發現了風暴要塞中潛藏的秘法能量，用武力將風暴要塞從那魯和德萊尼人手中搶了過來。"
Inst55Caption = "風暴要塞：波塔尼卡"
Inst55QAA = "5 個任務"
Inst55QAH = "5 個任務"
Inst55General = {
    {
    "指揮官薩瑞尼斯",
    "坦克可以在橋上拉住她，然後她會馬上開始在坦克身上疊加秘法共振效果。最好驅散這些效果。很快她的生命就會降低到50%，隨後她開始召喚救援。小隊應該有一個計劃來對付這些救援，控制他們或者幹掉他們。例如說我們可以不斷恐懼他們，迅速殺死王，然後幹掉血精靈護衛和血精靈修復者。",
    RED .. "秘法災難" .. WHITE .. "：瞬發的武器攻擊，造成50%武器傷害，並且目標身上每一層秘法共振都會造成1200點額外傷害。\n" .. RED .. "秘法共振" .. WHITE .. "：在近戰武器擊中時有一定機率觸發，使目標受到的秘法傷害增加1200點。\n" .. RED .. "召喚救援" .. WHITE .. "：在50%生命時，指揮官薩瑞尼斯會召喚2個非精英的血精靈護衛和一個精英的血精靈修復者，血精靈修復者會對她施放強效資料術，治療9000點以上生命。他還可以給血精靈護衛buff，使他們可以施放500點傷害的秘法擊。",
    },

    {
    "大植物學家費瑞衛恩",
    "這場戰鬥的核心就在於站位。很重要的一點是在大植物學家費瑞衛恩開始引導寧靜的時候我們把他的保護者拉出他的視線，這樣我們就可以快速幹掉它們。比較簡單的一個策略是在橋上面對付王然後利用牆來阻斷視線。當王剛剛變成生命之樹的時候，每個人都要跑到牆的另一面去，然後等保護者一轉過牆角就快速幹掉它們。\n戰鬥的另一點就是在它施放的幼苗。幼苗會對隊員，通常是坦克，施放某種Debuff。我們能夠驅散的只是魔法效果。但是它們的生命值很低，並且王召喚它們的頻率很快。我們需要有1個Dps職業負責清掉這些幼苗，它們只有1500血，幾乎一出來就被幹掉了。但是它們出現的速度如此之快，我們有可能需要第二個Dps職業來幫助對付它們，不過這也是視戰鬥情況而定。",
    RED .. "棘刺保護者" .. WHITE .. "：棘刺保護者可以使用荊棘射擊技能，這是一種遠程攻擊，可以造成1200點自然傷害。\n" .. RED .. "種植『某種顏色』的幼苗" .. WHITE .. "：每5至10秒種植一次，可以施放一種Debuff。\n" .. RED .. "生命之樹" .. WHITE .. "：每30至40秒大植物學家費瑞衛恩會變形成為一棵生命之樹，並且開始引導不可打斷的寧靜法術，每秒治療他和他的保護者964點生命。同時他會召喚3個保護者。",
    },

    {
    "看管者索古林",
    "在拉王之前，他南邊的一條走廊應該被清空，那裡的牆上有隱形的虛空藤蔓。然後將王從站立的地方拉到空曠的大廳中，這是為了避免他的地獄火施放到一個已經被犧牲技能擊暈了的隊員身上造成秒殺。他的犧牲技能對隨機目標施放，需要對中了該技能的隊員不斷進行治療。而他的地獄火技能很好躲開，在施放技能之前他會大叫，這時候要盡快離開他身邊。",
    RED .. "狂怒" .. WHITE .. "：在20%生命時他會狂怒，近戰傷害增加。\n" .. RED .. "地獄火" .. WHITE .. "：範圍型的火焰傷害，每秒造成1200至1500火焰傷害，持續8 - 10 秒，同時會大叫：我要燒盡你們。\n" .. RED .. "犧牲" .. WHITE .. "：擊暈一個隊員並且每秒吸收642至708傷害，同時大叫：『你的生命是我的』。",
    },
    
    {
    "拉杰",
    "拉杰的戰鬥比較簡單，可以就在它站立的地方坦克它。在每個底座上面安排一個遠程Dps這樣他們在消滅掉拉杰召喚出來的小花之後可以馬上把火力轉向王。此外還有它的致病技能，但是只要及時驅散並且照顧好召喚，很快戰鬥就可以結束了。",
    RED .. "過敏反應" .. WHITE .. "：使一個目標生病18秒，在此期間目標受到的傷害提高500點。同時造成自然傷害。生病的目標有一定幾率傳染給臨近的隊友。\n" .. RED .. "召喚荊棘" .. WHITE .. "：在拉杰面前的2個底座上出現一個荊棘鞭撻者或荊棘抽刺者攻擊小隊。",
    },
    
    {
    "扭曲分裂者",
    "扭曲分裂者的戰鬥不難，主要考驗你的隊伍集中火力的能力。\n戰鬥開始坦克要把王拉好，然後Dps和治療都開始負起自己的責任。\n在戰鬥中王會週期性的召喚樹苗，樹苗會緩慢走向隊伍，並不會立刻造成威脅。召喚20秒過後，王會吞噬樹苗，根據樹苗剩餘生命的多少，恢復1%至30%生命。\n由於吞噬回復的生命值相當多，殺掉這些樹苗是戰鬥中的首要目標。當他們出現時，所有Dps必須集中盡快消滅它們。\n如果你的隊伍能夠堅持下去，這場戰鬥並不困難。",
    RED .. "群體秘法箭" .. WHITE .. "：範圍性秘法箭，造成1500至2200 秘法傷害。\n" .. RED .. "踐踏" .. WHITE .. "：40碼範圍性擊暈，造成1000至2500物理傷害，受到的物理傷害提高550點，持續5秒。\n" .. RED .. "召喚樹苗" .. WHITE .. "：召喚6棵樹苗從草地上開始攻擊隊伍，造成很小的物理傷害。召喚20秒後，王會吞噬掉樹苗，恢復等同於全部樹苗剩餘生命值的HP。",
    },
    
};

--Quest 1 Alliance
Inst55Quest1 = "1. 闖入亞克崔茲的方法"
Inst55Quest1_Level = "70"
Inst55Quest1_Attain = "67"
Inst55Quest1_Aim = "阿達歐派你去取得亞克崔茲鑰匙的頂部和底部裂片。將它們帶回去給他，他會將它們合成亞克崔茲鑰匙後交給你。"
Inst55Quest1_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst55Quest1_Note = "底部裂片出自扭曲分裂者"..YELLOW.."[5]"..WHITE.."。頂部裂片出自麥克納爾。"
Inst55Quest1_Prequest = "給撒塔斯城的特件"
Inst55Quest1_Folgequest = "厄運通報者（亞克崔茲）"
Inst55Quest1PreQuest = "true"
--
Inst55Quest1name1 = "薩塔隱士披風"
Inst55Quest1name2 = "阿達歐的禮物"
Inst55Quest1name3 = "精準那魯腰帶"
Inst55Quest1name4 = "撒塔斯勇士腰帶"
Inst55Quest1name5 = "薩塔復仇者護腰"
Inst55Quest1name6 = "亞克崔茲鑰匙"

--Quest 2 Alliance
Inst55Quest2 = "2. 取得拱心石"
Inst55Quest2_Level = "70"
Inst55Quest2_Attain = "67"
Inst55Quest2_Aim = "冒險進入風暴要塞的波塔尼卡從指揮官薩瑞尼斯身上取回拱心石。將它帶給紫蘿蘭之塔的大法師瓦戈斯。"
Inst55Quest2_Location = "大法師瓦戈斯（虛空風暴 - 紫蘿蘭之塔; "..YELLOW.."58,86"..WHITE.."）"
Inst55Quest2_Note = "指揮官薩瑞尼斯在"..YELLOW.."[1]"..WHITE.."。"
Inst55Quest2_Prequest = "找到鑰匙持有者"
Inst55Quest2_Folgequest = "無"
Inst55Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst55Quest3 = "3. 大師級藥水 (煉金術專業任務)"
Inst55Quest3_Level = "70"
Inst55Quest3_Attain = "68"
Inst55Quest3_Aim = "羅安娜．薩威爾要你去風暴要塞的波塔尼卡，並且從大植物學家費瑞衛恩那裡取回植物學家的野地指南。另外她也想要你為她帶回來5瓶[超強效治療藥水]、5瓶[超強效法力藥水]和5瓶[昏睡藥水]。"
Inst55Quest3_Location = "羅安娜．薩威爾（贊格沼澤 - 塞納里奧避難所; "..YELLOW.."80,64"..WHITE.."）"
Inst55Quest3_Note = "大植物學家費瑞衛恩在"..YELLOW.."[2]"..WHITE.."。"
Inst55Quest3_Prequest = "大師級藥水"
Inst55Quest3_Folgequest = "無"
Inst55Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst55Quest4 = "4. 懸賞:扭曲分裂者的剪枝 (英雄每日)"
Inst55Quest4_Level = "70"
Inst55Quest4_Attain = "70"
Inst55Quest4_Aim = "風之貿易者札令姆要你取得扭曲分裂者的剪枝。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst55Quest4_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst55Quest4_Note = "扭曲分裂者在"..YELLOW.."[5]"..WHITE.."。"
Inst55Quest4_Prequest = "無"
Inst55Quest4_Folgequest = "無"
--
Inst55Quest4name1 = "正義徽章"

--Quest 5 Alliance
Inst55Quest5 = "5. 懸賞:尋日導魔師 (普通每日)"
Inst55Quest5_Level = "70"
Inst55Quest5_Attain = "70"
Inst55Quest5_Aim = "虛空行者瑪頓恩要你殺死6名尋日導魔師。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst55Quest5_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst55Quest5_Note = "普通每日任務。"
Inst55Quest5_Prequest = "無"
Inst55Quest5_Folgequest = "無"
--
Inst55Quest5name1 = "伊斯利恩監獄鑰匙"


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

Inst56Story = "風暴要塞原先是神秘的那魯用來在大宇宙中旅行的跨次元飛船。燃燒軍團的統領–墮落泰坦薩格拉斯看見了來自阿古斯行星的艾瑞達人的智慧，決定使他們成為他的惡魔軍隊的一員。阿克蒙德和基爾加丹，艾瑞達人的2個領袖，接受了薩格拉斯的邀請。但是第三位領袖維倫看到薩格拉斯是邪惡的，乘坐著那魯的風暴要塞逃離了阿古斯行星。穿越了扭曲虛空之後，維倫和他的追隨者最終到達了一個被他們稱為德拉諾的新世界。基爾加丹為了消滅所有艾瑞達人的殘餘（現在被稱為德萊尼人），將德拉諾大陸的獸人腐化為野蠻的戰士，大肆屠殺德萊尼人。此外，血精靈的領袖凱爾薩斯王子發現了風暴要塞中潛藏的秘法能量，用武力將風暴要塞從那魯和德萊尼人手中搶了過來。"
Inst56Caption = "風暴要塞：麥克納爾"
Inst56QAA = "4 個任務"
Inst56QAH = "4 個任務"
Inst56General = {
    {
    "看守者鐵手",
    "英雄模式下：躲他的拳頭，其餘沒難度。",
    RED .. "重重的舉起它的拳頭" .. WHITE .. "：趕緊跑開吧，這時候它不動的",
    },
    
    {
    "機械王卡帕希特斯",
    "這個王最厲害的攻擊是虛空充能，它可以很輕易的造成滅團。你的隊員需要躲開懸浮炸彈的傷害。你可以將除了坦克和近戰Dps的隊員躲在通往王的樓梯上。然後你的坦克將王拉到它的房間邊緣作戰，遠離他原來的位置。虛空充能炸彈將從那裡釋放。\n此外，你還需要當心他的反射盾技能。你可以通過偵測魔法技能探測，並且他的反射盾都有獨特的動畫顯示：紅色的物理攻擊反射和綠色的魔法反射。",
    RED .. "裂顱" .. WHITE .. "：單體Debuff，降低耐力200點。\n" .. RED .. "虛空充能" .. WHITE .. "：在整場戰鬥中，機械王卡帕希特斯都會召喚懸浮炸彈。當這些炸彈爆炸時，會連續造成2次小的AoE傷害，然後是一次較大的範圍傷害（2000至3000）。\n" .. RED .. "傷害反射盾" .. WHITE .. "：在王身邊召喚保護盾（紅色），對擊中它的近戰攻擊者造成750點秘法傷害。\n" .. RED .. "魔法反射盾" .. WHITE .. "：在王身邊召喚保護盾（綠色），反射100%的魔法攻擊，持續10秒。\n" .. BLUE .. "英雄難度要點：英雄模式的這個王會給玩家身上放正極電或者負極電的Debuff，電極相同的玩家在一起會得到傷害加成（比如2個同極電的在一起就會使傷害提高100%，3個同極電的在一起傷害會提高200%，以此類推），電極不同的玩家在一起則會相互放電造成傷害（每一次約2000傷害）。",
    },

    {
    "虛空術師賽派斯瑞",
    "首先要清空虛空術師賽派斯瑞的房間，因為你需要一定的空間來風箏2個憤怒火焰。只要能夠小心的風箏火焰，戰鬥很簡單。\n在頭目戰開始之後，虛空術師賽派斯瑞會召喚2個憤怒火焰。獲得憤怒火焰仇恨的人要將它們從隊伍附近帶開。它們移動速度很慢所以風箏起來應該很簡單。\n在坦克中了困惑效果之後要馬上解除，讓坦克馬上重新獲得仇恨，否則她會攻擊別人。",
    RED .. "龍息術" .. WHITE .. "：與法師法術相同，造成的困惑效果會清除仇恨。\n" .. RED .. "霜擊" .. WHITE .. "：移動速度降低50%。\n" .. RED .. "召喚憤怒火焰" .. WHITE .. "：進入戰鬥之後，虛空術師賽派斯瑞會召喚2個憤怒火焰（你不能放逐或恐懼它們）。它們的近戰攻擊會造成500至800點火焰傷害，在移動的時候會在地上留下一道火痕。不要踩在火痕上。在很短一段時間之後，它們會停止追逐它們的目標，開始施放地獄火。它們永遠不會攻擊王的目標。\n\n" .. BLUE .. "英雄難度要點：英雄模式下會有3個火元素，更加考驗站位，確保第2仇恨不是治療者，可以在坦被龍息後不至於導致滅團。",
    },

    {
    "計算者帕薩里歐",
    "戰鬥比較簡單，讓一個坦克來面對王，剩餘的隊員全力對付召喚出來的幽魂。當所有的幽魂被消滅之後就去對付王。至於他的精神控制，對被控制的隊員稍微控制一下（恐懼，變羊……）就可以了。當然，如果有牧師或術士、戰士群恐，法師冰霜新星也可以控制怪然後對王集中火力。",
    RED .. "沉默" .. WHITE .. "：範圍沉默，持續3秒。\n" .. RED .. "統御意志" .. WHITE .. "：精神控制技能，無法解除。\n" .. RED .. "法力抽取" .. WHITE .. "：血精靈種族技能，抽取大約1500法力值。\n" .. RED .. "召喚虛空幽魂" .. WHITE .. "：每30至45秒他會召喚4隻虛空幽魂，幽魂會施放1300至1700傷害的秘法飛彈技能。\n\n" .. BLUE .. "英雄難度要點：王攻擊並不高，開始他會控制一個隊友，可以冰箱解除，戰鬥開始30秒左右會招第一波小怪，可以先恐懼或冰腳，治療者注意自己的仇恨。等第二波小怪出來法師清掉，期間用力對王集火，最後階段王會狂暴，攻擊速度和攻擊都會提升，他所施放的奧爆可以被打斷。",
    },
};

--Quest 1 Alliance
Inst56Quest1 = "1. 闖入亞克崔茲的方法"
Inst56Quest1_Level = "70"
Inst56Quest1_Attain = "67"
Inst56Quest1_Aim = "阿達歐派你去取得亞克崔茲鑰匙的頂部和底部裂片。將它們帶回去給他，他會將它們合成亞克崔茲鑰匙後交給你。"
Inst56Quest1_Location = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53,43"..WHITE.."）"
Inst56Quest1_Note = "頂部裂片由計算者帕薩里歐掉落"..YELLOW.."[5]"..WHITE.."。底部裂片在波塔尼卡。"
Inst56Quest1_Prequest = "給撒塔斯城的特件"
Inst56Quest1_Folgequest = "厄運通報者（亞克崔茲）"
Inst56Quest1PreQuest = "true"
--
Inst56Quest1name1 = "薩塔隱士披風"
Inst56Quest1name2 = "阿達歐的禮物"
Inst56Quest1name3 = "精準那魯腰帶"
Inst56Quest1name4 = "撒塔斯勇士腰帶"
Inst56Quest1name5 = "薩塔復仇者護腰"
Inst56Quest1name6 = "亞克崔茲鑰匙"

--Quest 2 Alliance
Inst56Quest2 = "2. 麥克納爾的容器"
Inst56Quest2_Level = "69"
Inst56Quest2_Attain = "67"
Inst56Quest2_Aim = "韋恩的避難所的大衛．韋恩要你交給他一個滿溢的法力容器。"
Inst56Quest2_Location = "大衛．韋恩（泰洛卡森林 - 韋恩的避難所; "..YELLOW.."78,39"..WHITE.."）."
Inst56Quest2_Note = "滿溢的法力容器在機械王卡帕希特斯"..YELLOW.."[3]"..WHITE.."前面，挨著牆的一個箱子裡。"
Inst56Quest2_Prequest = "額外的材料"
Inst56Quest2_Folgequest = "無"
Inst56Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst56Quest3 = "3. 懸賞:帕薩里歐的投映器 (英雄每日)"
Inst56Quest3_Level = "70"
Inst56Quest3_Attain = "70"
Inst56Quest3_Aim = "風之貿易者札令姆要你取得帕薩里歐的投映器。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst56Quest3_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst56Quest3_Note = " 帕薩里歐在"..YELLOW.."[5]"..WHITE.."。"
Inst56Quest3_Prequest = "無"
Inst56Quest3_Folgequest = "無"
--
Inst56Quest3name1 = "正義徽章"

--Quest 4 Alliance
Inst56Quest4 = "4. 懸賞:風暴要塞-熔爐毀滅者 (普通每日)"
Inst56Quest4_Level = "70"
Inst56Quest4_Attain = "70"
Inst56Quest4_Aim = "虛空行者瑪頓恩要你殺死5名風暴要塞-熔爐毀滅者。完成之後回到撒塔斯的陰鬱城找他領取賞金。"
Inst56Quest4_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst56Quest4_Note = "普通每日任務。"
Inst56Quest4_Prequest = "無"
Inst56Quest4_Folgequest = "無"
--
Inst56Quest4name1 = "伊斯利恩監獄鑰匙"


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

Inst61Story = "風暴要塞原先是神秘的那魯用來在大宇宙中旅行的跨次元飛船。燃燒軍團的統領–墮落泰坦薩格拉斯看見了來自阿古斯行星的艾瑞達人的智慧，決定使他們成為他的惡魔軍隊的一員。阿克蒙德和基爾加丹，艾瑞達人的2個領袖，接受了薩格拉斯的邀請。但是第三位領袖維倫看到薩格拉斯是邪惡的，乘坐著那魯的風暴要塞逃離了阿古斯行星。穿越了扭曲虛空之後，維倫和他的追隨者最終到達了一個被他們稱為德拉諾的新世界。基爾加丹為了消滅所有艾瑞達人的殘餘（現在被稱為德萊尼人），將德拉諾大陸的獸人腐化為野蠻的戰士，大肆屠殺德萊尼人。此外，血精靈的領袖凱爾薩斯王子發現了風暴要塞中潛藏的秘法能量，用武力將風暴要塞從那魯和德萊尼人手中搶了過來。"
Inst61Caption = "風暴要塞"
Inst61QAA = "3 個任務"
Inst61QAH = "3 個任務"

--Quest 1 Alliance
Inst61Quest1 = "1. 灰舌偽裝"
Inst61Quest1_Level = "70"
Inst61Quest1_Attain = "70"
Inst61Quest1_Aim = "前往風暴要塞並且戴上灰舌風帽殺死歐爾。完成任務後回到影月谷找阿卡瑪。"
Inst61Quest1_Location = "阿卡瑪（影月谷 - 典獄官監獄; "..YELLOW.."58,48"..WHITE.."）"
Inst61Quest1_Note = "歐爾在"..YELLOW.."[1]"..WHITE.."。這個是黑暗神廟任務線的一步。"
Inst61Quest1_Prequest = "神秘的前兆"
Inst61Quest1_Folgequest = "古老的神器（海加爾）"
Inst61Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst61Quest2 = "2. 凱爾薩斯和嫩綠球體"
Inst61Quest2_Level = "70"
Inst61Quest2_Attain = "70"
Inst61Quest2_Aim = "將嫩綠球體交給撒塔斯城的阿達歐。"
Inst61Quest2_Location = "嫩綠球體（凱爾薩斯掉落 - 風暴要塞; "..YELLOW.."[4]"..WHITE.."）"
Inst61Quest2_Note = "阿達歐（撒塔斯城 - 聖光露臺; "..YELLOW.."53, 43"..WHITE.."）"
Inst61Quest2_Prequest = "無"
Inst61Quest2_Folgequest = "無"
--
Inst61Quest2name1 = "太陽王的咒符"
Inst61Quest2name2 = "晦暗者之握"
Inst61Quest2name3 = "桑古納爾領主的頸鏈"
Inst61Quest2name4 = "泰隆尼卡斯的暴行墜飾"

--Quest 3 Alliance
Inst61Quest3 = "3. 永恆之瓶"
Inst61Quest3_Level = "70"
Inst61Quest3_Attain = "70"
Inst61Quest3_Aim = "時光之穴的索芮朵蜜要你去從盤牙洞穴的瓦許女士身上取得瓦許的殘存之瓶，從風暴要塞的凱爾薩斯．逐日者身上取得凱爾薩斯的殘存之瓶。"
Inst61Quest3_Location = "索芮朵蜜（塔納利斯 - 時光之穴; "..YELLOW.."副本入口地圖[6]"..WHITE.."）。NPC在附近遊蕩。"
Inst61Quest3_Note = "凱爾薩斯．逐日者在"..YELLOW.."[4]"..WHITE.."。此任務曾經是進入海加爾山的鑰匙任務。"
Inst61Quest3_Prequest = "無"
Inst61Quest3_Folgequest = "無"
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
-- No Rewards for this quest

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
  ["Page1"] = "在古老的德拉諾大陸分崩離析之前，黑暗神廟的名字叫做卡拉伯爾神廟，是德萊尼人供奉先知維倫的聖堂。自古爾丹統合所有氏族促成部落的興起之後，在古爾丹的指示下，部落攻陷了這個地方，長久以來在此虔誠祈禱的牧師們，在充滿著惡魔之力的墮落獸人屠殺下已經無一倖免。屠殺事件結束之後，暗影議會的術士們佔領了這裡並且給予卡拉伯爾神廟一個新的名字：黑暗神廟。\n\n暗影議會也在此地進行許許多多的黑暗法術研究，但在第二次大戰之後，古爾丹勢力式微，耐奧祖則趁勢奪下黑暗神廟，將它轉為己用，並在成功自艾澤拉斯奪取他所需的神器在德拉諾展開空間傳送門逃往其他世界，耐奧祖的法術所釋放出的強大能量撕毀德拉諾世界。在統合外域的燃燒軍團勢力與尚未脫離惡魔之血控制的地獄獸人之後，惡魔領主瑪瑟里頓成為外域的新霸主，擔任燃燒軍團在此地的指揮官，並以黑暗神廟為王座君臨外域。",
  ["Page2"] = "伊利丹因為自己無法成功摧毀寒冰王座而試圖逃離基爾加丹的眼線來到外域。他決定消滅燃燒軍團在外域的勢力以躲避基爾加丹的追捕，因而帶著他的手下納迦部族以及血精靈突襲了位於黑暗神廟的瑪瑟里頓，現在的黑暗神廟便由伊利丹以及他的手下們佔領著，而伊利丹也因此成為了外域的新霸主。",
  ["MaxPages"] = "2",
};
Inst62Caption = "黑暗神廟"
Inst62QAA = "3 個任務"
Inst62QAH = "3 個任務"

--Quest 1 Alliance
Inst62Quest1 = "1. 尋找灰舌"
Inst62Quest1_Level = "70"
Inst62Quest1_Attain = "70"
Inst62Quest1_Aim = "在黑暗神廟裡找到阿卡瑪的死亡誓言者。"
Inst62Quest1_Location = "希瑞（影月谷 - 黑暗神廟; "..YELLOW.."65,44"..WHITE.."）"
Inst62Quest1_Note = "希瑞就在黑暗神廟的門口。"
Inst62Quest1_Prequest = "幫阿卡瑪製造機會"
Inst62Quest1_Folgequest = "灰舌的救贖"
Inst62Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst62Quest2 = "2. 灰舌的救贖"
Inst62Quest2_Level = "70"
Inst62Quest2_Attain = "70"
Inst62Quest2_Aim = "擊敗黑暗神廟中阿卡瑪的黑暗面來幫助阿卡瑪奪回他的靈魂。完成後回到先知卡奈那裡。"
Inst62Quest2_Location = "先知卡奈（黑暗神廟; "..YELLOW.."[5]"..WHITE.."）"
Inst62Quest2_Note = "阿卡瑪的黑暗面在"..YELLOW.."[4]"..WHITE.."。"
Inst62Quest2_Prequest = "尋找灰舌"
Inst62Quest2_Folgequest = "背叛者之死"
Inst62Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst62Quest3 = "3. 背叛者之死"
Inst62Quest3_Level = "70"
Inst62Quest3_Attain = "70"
Inst62Quest3_Aim = "先知卡奈要你擊敗黑暗神廟裡的伊利丹．怒風。"
Inst62Quest3_Location = "先知卡奈（黑暗神廟; "..YELLOW.."[5]"..WHITE.."）"
Inst62Quest3_Note = "伊利丹．怒風在黑暗神廟上層地圖的"..YELLOW.."[11]"..WHITE.."。"
Inst62Quest3_Prequest = "灰舌的救贖"
Inst62Quest3_Folgequest = "無"
Inst62Quest3FQuest = "true"
--
Inst62Quest3name1 = "受祝福的卡拉伯爾勳章"


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

Inst63Story = "千百年來，祖阿曼的要塞都是阿曼尼食人妖的權力中心，以及狡猾而無畏的督軍祖爾金的老巢。祖爾金花費了數年的時間在祖阿曼的城牆後面籌備他的復仇計劃。由於對部落允許讓他的仇敵血精靈加入，他開始積極地按照妖術領主瑪拉卡斯提出的建議行動起來：將野獸之神的力量禁錮在阿曼尼部族最強大的戰士體內。"
Inst63Caption = "祖阿曼"
Inst63QAA = "8 個任務"
Inst63QAH = "8 個任務"

--Quest 1 Alliance
Inst63Quest1 = "1. 承諾，承諾…"
Inst63Quest1_Level = "70"
Inst63Quest1_Attain = "70"
Inst63Quest1_Aim = "戰斧嶺的霸德．奈德瑞克希望你能從高階祭司納羅拉克的露臺那邊找回他的地圖。"
Inst63Quest1_Location = "霸德．奈德瑞克（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."70,67"..WHITE.."）"
Inst63Quest1_Note = "你可以在高階祭司納羅拉克"..YELLOW.."[1]"..WHITE.."附近找到地圖。前置任務接自前置任務接自格利夫塔（撒塔斯城 - 陰鬱城; "..YELLOW.."65,69"..WHITE.."）。"
Inst63Quest1_Prequest = "噢，閃亮的東西！"
Inst63Quest1_Folgequest = "Ｘ標記…你的末日！"
Inst63Quest1PreQuest = "true"
--
Inst63Quest1name1 = "破爛的邪化布袋"

--Quest 2 Alliance
Inst63Quest2 = "2. X標記…你的末日!"
Inst63Quest2_Level = "70"
Inst63Quest2_Attain = "70"
Inst63Quest2_Aim = "進入祖阿曼並造訪哈拉齊的房間，賈納雷的平台與阿奇爾森的平台。回報這些地區的細節給霸德，就在鬼魂之地他的營地中。"
Inst63Quest2_Location = "霸德．奈德瑞克（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."70,67"..WHITE.."）"
Inst63Quest2_Note = "哈拉齊的房間在"..YELLOW.."[4]"..WHITE.."，賈納雷的平台在"..YELLOW.."[3]"..WHITE.."，阿奇爾森的平台在"..YELLOW.."[2]"..WHITE.."。\n\n不用打王就可以完成任務，只要在附近就可以。" 
Inst63Quest2_Prequest = "承諾，承諾……"
Inst63Quest2_Folgequest = "妖術領主？哈！"
Inst63Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst63Quest3 = "3. 妖術領主?哈!"
Inst63Quest3_Level = "70"
Inst63Quest3_Attain = "70"
Inst63Quest3_Aim = "戰斧嶺的霸德．奈德瑞克要你殺死祖阿曼中的妖術領主瑪拉克雷斯。"
Inst63Quest3_Location = "霸德．奈德瑞克（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."70,67"..WHITE.."）"
Inst63Quest3_Note = "妖術領主瑪拉克雷斯在"..YELLOW.."[6]"..WHITE.."。"
Inst63Quest3_Prequest = "Ｘ標記…你的末日！"
Inst63Quest3_Folgequest = "無"
Inst63Quest3FQuest = "true"
--
Inst63Quest3name1 = "正義徽章"

--Quest 4 Alliance
Inst63Quest4 = "4. 長牙劫掠者"
Inst63Quest4_Level = "70"
Inst63Quest4_Attain = "70"
Inst63Quest4_Aim = "皮格蒙需要你從祖阿曼的食人妖那邊收集10根森林食人妖長牙。把東西帶給他，他就在鬼魂之地的霸德營地。"
Inst63Quest4_Location = "皮格蒙（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."71,68"..WHITE.."）"
Inst63Quest4_Note = "祖阿曼裡面的食人妖都可能會掉落。在你完成[承諾，承諾…]任務之後便可接到此任務。"
Inst63Quest4_Prequest = "無"
Inst63Quest4_Folgequest = "食人妖中的食人妖"
-- No Rewards for this quest

--Quest 5 Alliance
Inst63Quest5 = "5. 食人妖中的食人妖"
Inst63Quest5_Level = "70"
Inst63Quest5_Attain = "70"
Inst63Quest5_Aim = "皮格蒙希望你去尋找並且幫助他的表弟祖剛，人應該在祖阿曼中的某處。"
Inst63Quest5_Location = "皮格蒙（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."71,68"..WHITE.."）"
Inst63Quest5_Note = "祖剛在"..YELLOW.."[5]"..WHITE.."一個小帳篷裡，你找到他之後他會給你後續任務。"
Inst63Quest5_Prequest = "長牙劫掠者"
Inst63Quest5_Folgequest = "玩娃娃"
Inst63Quest5FQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst63Quest6 = "6. 玩娃娃"
Inst63Quest6_Level = "70"
Inst63Quest6_Attain = "70"
Inst63Quest6_Aim = "把破爛的巫毒娃娃帶給撒塔斯城的格利夫塔。"
Inst63Quest6_Location = "祖剛（祖阿曼; "..YELLOW.." [5]"..WHITE.."）"
Inst63Quest6_Note = "格利夫塔（撒塔斯 - 陰鬱城; "..YELLOW.."65,69"..WHITE.."）"
Inst63Quest6_Prequest = "食人妖中的食人妖"
Inst63Quest6_Folgequest = "無"
Inst63Quest6FQuest = "true"
--
Inst63Quest6name1 = "魅惑的阿曼尼珠寶"

--Quest 7 Alliance
Inst63Quest7 = "7. 督軍之血"
Inst63Quest7_Level = "70"
Inst63Quest7_Attain = "70"
Inst63Quest7_Aim = "將祖爾金之血交給霸德，他的營地位在鬼魂之地的祖阿曼外頭。"
Inst63Quest7_Location = "祖爾金之血（祖爾金掉落 - 祖阿曼; "..YELLOW.."[7]"..WHITE.."）"
Inst63Quest7_Note = "團隊中只有一個人能夠得到祖爾金之血。"
Inst63Quest7_Prequest = "無"
Inst63Quest7_Folgequest = "密探小姐"
-- No Rewards for this quest

--Quest 8 Alliance
Inst63Quest8 = "8. 密探小姐"
Inst63Quest8_Level = "70"
Inst63Quest8_Attain = "70"
Inst63Quest8_Aim = "向朵娜．布拉斯科回報，好領取你英雄事蹟的獎勵。朵娜目前待在鬼魂之地，就在祖阿曼的外頭。"
Inst63Quest8_Location = "朵娜．布拉斯科（鬼魂之地 - 阿曼尼小徑; "..YELLOW.."70,68"..WHITE.."）"
Inst63Quest8_Note = "這個任務只能解一次，無法重複。"
Inst63Quest8_Prequest = "督軍之血"
Inst63Quest8_Folgequest = "無"
Inst63Quest8FQuest = "true"
--
Inst63Quest8name1 = "正義徽章"
-- No Rewards for this quest


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

Inst67Story = "博學者殿堂是一個於2.4.0版本中加入，座落於東部王國北邊的奎爾達納斯島中的一個五人地城。這個地城大多數的地方都位於戶外，並且有著與銀月城相同的建築風格。\n\n這座殿堂的最後首領不是別人而正是凱爾薩斯．逐日者王子，經歷了風暴要塞的失敗，很多人以為這位高貴的血精靈王子已香消玉殞，但他卻被更為強大的力量復活了。如今，凱爾薩斯已經面目全非，胸口那塊散發著詭異光芒的綠色水晶讓他變得邪氣十足。唯一不變的，是他追逐更強能量的信念……\n\n在博學者殿堂二王身後的水晶球揭開了太陽之井高地的序幕，之後玩家們便會遇見化身為半精靈的藍龍卡雷苟斯。\n\n"..GREEN.."引述自WoWWiki"
Inst67Caption = "博學者殿堂"
Inst67QAA = "5 個任務"
Inst67QAH = "5 個任務"

--Quest 1 Alliance
Inst67Quest1 = "1. 懸賞:折磨之女 (普通每日)"
Inst67Quest1_Level = "70"
Inst67Quest1_Attain = "70"
Inst67Quest1_Aim = "虛空行者瑪頓恩要你解決4名折磨之女。完成之後回到撒塔斯的陰鬱城找他以換取賞金。"
Inst67Quest1_Location = "虛空行者瑪頓恩（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst67Quest1_Note = "普通每日任務。"
Inst67Quest1_Prequest = "無"
Inst67Quest1_Folgequest = "無"
--
Inst67Quest1name1 = "伊斯利恩監獄鑰匙"

--Quest 2 Alliance
Inst67Quest2 = "2. 懸賞:凱爾薩斯王子的璽戒 (英雄每日)"
Inst67Quest2_Level = "70"
Inst67Quest2_Attain = "70"
Inst67Quest2_Aim = "風之貿易者札令姆要你取得凱爾薩斯王子的璽戒。帶到撒塔斯的陰鬱城交給他以換取賞金。"
Inst67Quest2_Location = "風之貿易者札令姆（撒塔斯城 - 陰鬱城; "..YELLOW.."74,35"..WHITE.."）"
Inst67Quest2_Note = "英雄每日任務。\n\n凱爾薩斯王子在"..YELLOW.."[6]"..WHITE.."。"
Inst67Quest2_Prequest = "無"
Inst67Quest2_Folgequest = "無"
--
Inst67Quest2name1 = "正義徽章"

--Quest 3 Alliance
Inst67Quest3 = "3. 博學者殿堂"
Inst67Quest3_Level = "70"
Inst67Quest3_Attain = "70"
Inst67Quest3_Aim = "破碎之日會所的主教雷索爾要你去搜尋博學者殿堂，尋找提里斯，一個血精靈間諜。"
Inst67Quest3_Location = "主教雷索爾（奎爾達納斯 - 破碎之日會所; "..YELLOW.."47,31"..WHITE.."）"
Inst67Quest3_Note = "提里斯在副本"..YELLOW.."[2]"..WHITE.."。完成這個任務線之後你才能進入英雄模式的博學者殿堂。\n\n這個任務的前置可以從『護光者』艾德伊恩（撒塔斯城 - 奧多爾高地; "..YELLOW.."35,36"..WHITE.."）或是戴斯瑞司．擊日者（撒塔斯城 - 占卜者階梯; "..YELLOW.."55,80"..WHITE.."）處接到。"
Inst67Quest3_Prequest = "太陽井之的危機（奧多爾）或職責所在（占卜者）"
Inst67Quest3_Folgequest = "占卜者的占卜"
Inst67Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst67Quest4 = "4. 占卜者的占卜"
Inst67Quest4_Level = "70"
Inst67Quest4_Attain = "70"
Inst67Quest4_Aim = "提里斯要你在博學者殿堂的陽臺使用寶珠。"
Inst67Quest4_Location = "提里斯（博學者殿堂; "..YELLOW.."[2]"..WHITE.."）"
Inst67Quest4_Note = "索蘭尼亞的占卜寶珠在"..YELLOW.."[4]"..WHITE.."。經過一小段「電影」後，卡雷苟斯會出現並給予下一步任務。"
Inst67Quest4_Prequest = "博學者殿堂"
Inst67Quest4_Folgequest = "難以殺死"
Inst67Quest4FQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst67Quest5 = "5. 難以殺死"
Inst67Quest5_Level = "70"
Inst67Quest5_Attain = "70"
Inst67Quest5_Aim = "卡雷苟斯要求你擊敗博學者殿堂的凱爾薩斯。你要帶著凱爾薩斯的頭回報破碎之日會所的雷索爾。"
Inst67Quest5_Location = "卡雷苟斯（博學者殿堂; "..YELLOW.."[4]"..WHITE.."）"
Inst67Quest5_Note = "凱爾薩斯．逐日者在（博學者殿堂; "..YELLOW.."[6]"..WHITE.."）。完成這個任務線之後你才能進入英雄模式的博學者殿堂。\n\n主教雷索爾在（奎爾達納斯 - 破碎之日會所; "..YELLOW.."47,31"..WHITE.."）。"
Inst67Quest5_Prequest = "占卜者的占卜"
Inst67Quest5_Folgequest = "無"
Inst67Quest5FQuest = "true"
--
Inst67Quest5name1 = "明亮的赤紅尖晶石"
Inst67Quest5name2 = "符文的赤紅尖晶石"
Inst67Quest5name3 = "淚滴的赤紅尖晶石"


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

Inst68Story = "燃燒軍團的惡魔領主基爾加丹將從太陽之井中重返世界，他的棲身之地將成為一個全新的25人副本：太陽之井高地。太陽之井高地是一個座落於奎爾達納斯島銀月城的北邊的團隊地城，暴風雪公司將太陽之井高地設計成在開放巫妖王之怒前最為困難的地城。太陽之井高地為俱備T6等級裝備的玩家設計，並且新增掉落部分T6套件（鞋子、腰帶以及護腕），還有部分非套件史詩裝備。\n\n太陽之井高地包含了戶外區域以及發生於建築內的戰役，玩家們將會在此發現被囚禁於此以提供城市主要能量的納魯、還有在最後建築裡的太陽井化身。\n\n太陽之井高地的建築將會有別於銀月城。\n\n"..GREEN.."引述自WoWWiki"
Inst68Caption = "太陽井高地"
Inst68QAA = "1 個任務"
Inst68QAH = "1 個任務"

--Quest 1 Alliance
Inst68Quest1 = "1. 淨化奎爾達拉"
Inst68Quest1_Level = "80"
Inst68Quest1_Attain = "80"
Inst68Quest1_Aim = "把淬鍛的奎爾德拉浸泡在太陽之井中。當你準備好進入太陽之井高地的時候，請找一名太陽之井守望者談話。"
Inst68Quest1_Location = "赫杜倫．亮翼（奎爾達納斯; "..YELLOW.."44.5, 45.5"..WHITE.."）"
Inst68Quest1_Note = "當你持有此任務並進入太陽之井時，你將會進入一個階段性的副本空間，且不需要與任何怪物和首領交戰。太陽之井在"..YELLOW.."[4]"..WHITE.."。"
Inst68Quest1_Prequest = "薩洛瑞安．曦尋者"
Inst68Quest1_Folgequest = "白銀誓盟的勝利"
Inst68Quest1PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst68Quest1_HORDE = "1. 淨化奎爾達拉"
Inst68Quest1_HORDE_Level = "80"
Inst68Quest1_HORDE_Attain = "80"
Inst68Quest1_HORDE_Aim = "把淬鍛的奎爾德拉浸泡在太陽之井中。當你準備好進入太陽之井高地的時候，請找一名太陽之井守望者談話。"
Inst68Quest1_HORDE_Location = "赫杜倫．亮翼（奎爾達納斯; "..YELLOW.."44.5, 45.5"..WHITE.."）"
Inst68Quest1_HORDE_Note = "當你持有此任務並進入太陽之井時，你將會進入一個階段性的副本空間，且不需要與任何怪物和首領交戰。太陽之井在"..YELLOW.."[4]"..WHITE.."。"
Inst68Quest1_HORDE_Prequest = "薩洛瑞安．曦尋者"
Inst68Quest1_HORDE_Folgequest = "奪日者的勝利"
Inst68Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST69 - Caverns of Time: Stratholme Past ---------------

Inst69Story = "斯坦索姆的抉擇是位於時光之穴中的地城之一。故事的重心圍繞著幫助阿薩斯王子淨化在斯坦索姆城中因為吃了染疫的穀物而被感染瘟疫的百姓們，這也是阿薩斯王子墮入瘋狂與邪惡的第一步，而他終究變成巫妖王手下最忠心且強大的死亡騎士，最後還和巫妖王合而為一。\n\n"..GREEN.."引述自WoWWiki"
Inst69Caption = "時光之穴：斯坦索姆的抉擇"
Inst69QAA = "2 個任務"
Inst69QAH = "2 個任務"
Inst69General = {
    {
    "肉鉤",
    "算是一場頗考驗坦職裝備和補職自保能力的一場硬戰；若是治療者因壓迫之鍊而死亡的話，隊伍將會受到很大的影響，倘若其他隊員也具有治療能力的話，將對戰鬥有很大的幫助。",
    RED .. "壓迫之鍊：" .. WHITE .. "對隨機目標使用，用鍊子困鎖目標，每0秒造成1000點物理傷害，並使目標昏迷5秒。\n" .. RED .. "噴吐疾病：" .. WHITE .. "噴出疾病之雲，造成1710至1890點自然傷害並中斷周圍敵方目標的施法，持續4秒。\n" .. RED .. "狂亂：" .. WHITE .. "提高施法者造成的物理傷害10%，持續30秒。",
    },

    {
    "『血肉工匠』塞歐朗姆",
    "王會召出食屍鬼群，此時需要坦儘快全抓住，並且儘速地把它們全部解決；否則食屍鬼留在場上一段時間後，王就會使用屍爆術將食屍鬼爆破而產生大量的範圍傷害。",
    RED .. "暗影箭：" .. WHITE .. "向敵人射出一支暗影箭，對其造成暗影傷害。\n" .. RED .. "召喚食屍鬼：" .. WHITE .. "在施法者周圍召喚兩個食屍鬼爪牙。\n" .. RED .. "爆破食屍鬼：" .. WHITE .. "爆破周圍的一個食屍鬼，對10碼範圍內的敵方目標造成3800至4200點火焰傷害。\n" .. RED .. "竊取血肉：" .. WHITE .. "需引導，竊取目標的血肉，使敵人造成的傷害降低75%，並提高施法者造成的傷害75%。\n" .. RED .. "扭曲血肉詛咒：" .. WHITE .. "使目標的生命力上限降低25%，並且每3秒造成1500點暗影傷害，持續30秒。",
    },

    {
    "紀元時間領主",
    "王開始攻擊阿薩斯王子並且隊伍進入戰鬥狀態時，坦馬上從阿薩斯王子那邊接住王，其他隊員最好互相散開免得被致傷打擊打死，治療需要很注意其時機，隊友或自己受到致傷打擊後，最好能馬上將血補回來。",
    RED .. "費力詛咒：" .. WHITE .. "使法術和技能的消耗提高100%，持續10秒。\n" .. RED .. "時間扭曲：" .. WHITE .. "時間緩慢下來，降低攻擊、施法和移動速度70%，持續6秒。\n" .. RED .. "致傷打擊：" .. WHITE .. "兇蠻地使目標受傷，造成100%武器傷害，使其受到的治療效果降低25%，每1秒造成2000點物理傷害，持續4秒。\n" .. RED .. "時間停止：" .. WHITE .. "停止半徑50碼範圍內的時間，持續2秒。",
    },
    
    {
    "瑪爾加尼斯",
    "進入戰鬥之後坦把王拉背對隊伍，以免得其他隊員受到腐肉成群的傷害。當受到催眠術無法動彈時，除了可驅散外，也能利用pvp的飾品、聖騎無敵以及人類和地精的種族天賦等類似方法解除。當隊伍主治療被催眠時，隊上若有會補血的職業，可以幫忙分擔治療壓力。最後一重點則是盡速地把王的吸血之觸給驅散掉。當王血量被打到剩1%就會逃跑。",
    RED .. "腐肉成群：" .. WHITE .. "以一波洶湧的混沌魔法襲捲施法者前方的敵人，造成3230至3570點暗影傷害，並且每3秒額外造成380至420點暗影傷害，持續15秒。\n" .. RED .. "心靈震爆：" .. WHITE .. "對敵人造成4163至4837點暗影傷害。\n" .. RED .. "催眠術：" .. WHITE .. "使敵人進入睡眠狀態，最多持續10秒。任何對目標造成傷害的行為都會喚醒它。\n" .. RED .. "吸血之觸：" .. WHITE .. "近戰攻擊造成的一半傷害將治療施法者，可驅散。",
    },

    {
    "恆龍墮落者（英雄模式）",
    "時間從觸發天譴軍團第一波的入侵便開始計算了，玩家們必須在25分鐘之內到達恆龍墮落者前並且擊殺他才能取得" .. PURPLE .. "青銅龍韁繩" .. WHITE .. "，此戰算是斯坦索姆的抉擇中最簡單的一役，相信對於可以在25分鐘之內到達的隊伍來說，擊殺恆龍墮落者不會是問題。",
    RED .. "腐化荒疫：" .. WHITE .. "每3秒對目標造成相當於生命力上限8%的傷害，持續2分鐘，最多可堆疊5次。\n" .. RED .. "虛無打擊：" .. WHITE .. "對敵人造成100%武器傷害，無視所有護甲值。",
    },
};

--Quest 1 Alliance
Inst69Quest1 = "1. 驅散幻影"
Inst69Quest1_Level = "80"
Inst69Quest1_Attain = "78"
Inst69Quest1_Aim = "克羅米要求你，在斯坦索姆的往日，對可疑的箱子使用秘法干擾器，然後在其入口附近和她交談。"
Inst69Quest1_Location = "克羅米（斯坦索姆的抉擇; "..YELLOW.."[1]"..WHITE.."）"
Inst69Quest1_Note = "可疑的箱子（即在路上散發綠光的染疫穀箱）可以在入口處的房子通往斯坦索姆的途中找到。完成箱子的調查之後，你可以向位於前方的克羅米"..YELLOW.."[2]"..WHITE.."回報任務。"
Inst69Quest1_Prequest = "無"
Inst69Quest1_Folgequest = "忠誠護衛"
-- No Rewards for this quest

--Quest 2 Alliance
Inst69Quest2 = "2. 忠誠護衛"
Inst69Quest2_Level = "80"
Inst69Quest2_Attain = "78"
Inst69Quest2_Aim = "克羅米要求你，在斯坦索姆的抉擇中，隨侍於阿薩斯身側。瑪爾加尼斯被擊敗以後，回頭找她交談。"
Inst69Quest2_Location = "克羅米（斯坦索姆的抉擇姆; "..YELLOW.."[2]"..WHITE.."）"
Inst69Quest2_Note = "瑪爾加尼斯在"..YELLOW.."[5]"..WHITE.."。"
Inst69Quest2_Prequest = "驅散幻影"
Inst69Quest2_Folgequest = "無"
Inst69Quest2FQuest = "true"
--
Inst69Quest4name1 = "時光守護者手套"
Inst69Quest4name2 = "受保護歷史裹手"
Inst69Quest4name3 = "編年紀事之握"
Inst69Quest4name4 = "抉擇護手"


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

Inst70Story = {
  ["Page1"] = "在凜風峽灣的匕鞘海灣峭壁間佇立了俄特加德要塞，這座巨大的堡壘裡面佈滿了野蠻且神秘的維酷。沒有人知道這史前的堡壘到底有多麼的深入地表，只知道目前聯盟和部落派出的探子無一生還。一直以來大家都以為這建築已經被遺棄了，上千年無人使用，直到最近才被佔領。現在這群半巨人維酷決定要對要塞殘垣破璧附近的建築物發出無止境攻擊。\n\n維酷人不但對他們持續休眠的依米倫國王忠心不二，並且似乎只有活在戰爭下才會快活。在俄特加德裡面，邪惡的掠龍氏族在永不熄滅的熔爐內建造了大量的戰爭武器。所有的因格瓦的劫掠者都具有驚人的力量及生命力，有些甚至還學會並精通祕法奧義。大部分的維酷魔法似乎都來自神秘的符文，即使是最有經驗的法師也很不熟悉它們的運作。這些符文施法者乃為維酷內最具有殺傷力的生物，他們的對手通常會被寒冰的力量給凍結，然後再被擊碎成上千片碎片。",
  ["Page2"] = "雖然謠言持續不斷的指出依米倫的追隨者已經和天譴軍團結盟了，但凜風峽灣的居民卻更常看到掠龍氏族的盟友：元龍。這些殘暴的生物似乎跟他們較為有名的另外五支龍軍團近親沒有太多共通點。雖說如此，經過維酷有效的訓練後，恐怖的元龍也變成他們的坐騎。在『盜掠者』因格瓦的指揮下，這些龍騎士也非常樂於的從高空飛下偷襲敵人。\n\n雖然殘暴的維酷野心勃勃地想要統一北裂境上的領土，但他們現在也開始往凜風峽灣的地表下面擴張。因為依米倫的追隨者底下有太多不值錢的勞工，不過那些勇敢來到峽灣的冒險者卻懷疑維酷一定是取得外來的援助才有辦法延續他們的工作…\n\n俄特加德要塞的維酷在掌握了神祕的魔法及控制了元龍後，馬上也造成了聯盟及部落立即性的威脅。只有那些最英勇的冒險者敢挑戰依米倫忠心的手下和闖入維酷的地盤深處一探究竟。",
  ["MaxPages"] = "2",
};
Inst70Caption = "俄特加德要塞：俄特加德要塞"
Inst70Caption2 = "俄特加德要塞：俄特加德要塞（故事背景第二部分）"

Inst70QAA = "2 個任務"
Inst70QAH = "3 個任務"
Inst70General = {
    {
    "凱雷希斯王子",
    "要注意隨機在隊友身上產生的冰霜之墓，若隊友處於低血量則有可能死亡，一個冰霜之墓造成約8000傷害，傷害者要盡快打破冰墓，治療者則要迅速將被冰住目標的血量補滿。除了冰霜之墓，王子也會召喚5隻骸骨，可群體控制，確保他們群聚在一起，因為他們在戰鬥中會週期性的復活，將他們聚集一群會更容易控制。",
    RED .. "暗影箭：" .. WHITE .. "造成2975至4025的暗影傷害，範圍為40碼且施法時間為兩秒。\n" .. RED .. "召喚骸骨：" .. WHITE .. "召喚出的骸骨會對目標造成力量降低100及移動速度減緩30%，可以集中擊殺或是請坦全部抓住直到擊斃王。\n" .. RED .. "冰霜之墓：" .. WHITE .. "每秒造成400點傷害並持續20秒，總計約7,000的傷害。",
    },

    {
    "『控制者』達隆恩＆『建造者』史卡沃",
    "『控制者』達隆恩和『建造者』史卡沃兩個會同時進入戰鬥。在此戰鬥中擊殺順序並不重要，當其中一個死亡後會變成靈魂狀態無法點取，並擁有生前的技能；此意味者他們需要確實的同時死亡較能確保隊伍的安全。最好的戰略為將史卡沃傷害至10%後，轉而殺死達隆恩，然後再結束掉史卡沃；因為史卡沃會經常的衝鋒玩家，變成靈魂狀態的時候也會，通常會朝向治療者攻擊，此時戰士無法點取目標並建立仇恨，他會待在治療者身上直到戰鬥結束或是治療者死亡。",
    BLUE .. "『建造者』史卡沃\n" .. RED .. "衝鋒：" .. WHITE .. "對一敵人衝鋒，造成35%的血量傷害，並且昏迷兩秒。\n" .. RED .. "石塊打擊：" .. WHITE .. "造成100%的武器傷害並且撞擊擊退敵人。\n" .. RED .. "狂怒：" .. WHITE .. "使施法者的攻擊速度提高30%，造成的物理傷害提高10%，持續10秒。\n" .. BLUE .. "『控制者』達隆恩\n".. RED .. "衰弱：" .. WHITE .. "削弱目標，降低目標近戰、遠程攻擊與施法及移動速度各50%。\n" .. RED .. "召喚骷髏：" .. WHITE .. "在施法者周圍召喚兩個骷髏爪牙。\n" .. RED .. "暗影箭：" .. WHITE .. "2秒施法時間，45碼距離，造成2700至3300暗影傷害。",
    },

    {
    "『盜掠者』因格瓦",
    "戰鬥分成兩階段，當『盜掠者』因格瓦死後，將會有一隻華爾琪對他施放復活術。",
    BLUE .. "第一階段\n" .. RED .. "驚恐咆哮：" .. WHITE .. "2秒施法時間，對60碼內的敵人造成2188至2812的傷害，會中斷施法並在6秒之中無法使用該系法術。\n" .. RED .. "順劈斬：" .. WHITE .. "對目標和鄰近敵人造成150%的傷害。\n" .. RED .. "狂怒：" .. WHITE .. "每次增加攻速5%體型增大5%，可堆疊50次。\n" .. RED .. "黑暗破擊：" .. WHITE .. "3秒施法時間，對施法者前方10碼錐形範圍內的所有敵人造成8750至11250點暗影傷害。此外，對所有敵人造成1750至2250點暗影傷害，並將其擊倒。\n" .. BLUE .. "第二階段\n" .. RED .. "驚懼咆哮：" .. WHITE .. "0.5秒施法時間，對60碼內的敵人製造3063至3937的暗影傷害，並且造成集體沉默8秒，此外坦克將承受額外5%的暗影傷害，此效果可堆疊40次。\n" .. RED .. "哀痛打擊：" .. WHITE .. "對敵人造成200%的普通近戰傷害，並使其受到哀痛打擊的效果。受此效果影響的目標受到治療效果時，將對治療者造成1750至2250點暗影傷害。\n" .. RED .. "黑暗破擊：" .. WHITE .. "3秒施法時間，對施法者前方10碼錐形範圍內的所有敵人造成17500至22500的暗影傷害，此外還會擊暈全隊2秒並造成1750至2250暗影傷害。\n" .. RED .. "暗影斧頭：" .. WHITE .. "對隨機目標投擲暗影斧頭，當斧頭攻擊到時，會被結網10秒，對附近的隊友造成每秒1750至2250的傷害。",
    },
};

--Quest 1 Alliance
Inst70Quest1 = "1. 進入俄特加德!"
Inst70Quest1_Level = "71"
Inst70Quest1_Attain = "68"
Inst70Quest1_Aim = "防衛者摩丹要你去殺死住在俄特加德深處的『盜掠者』因格瓦，然後把他的頭交給海軍中將凱勒。"
Inst70Quest1_Location = "防衛者摩丹（凜風峽灣 - 龍顱村; "..YELLOW.."59.3, 48.8"..WHITE.."）"
Inst70Quest1_Note = "『盜掠者』因格瓦在"..YELLOW.."[3]"..WHITE.."。\n\n回覆任務的海軍中將凱勒在（凜風峽灣 - 瓦爾加德; "..YELLOW.."60.4, 61.0"..WHITE.."）。"
Inst70Quest1_Prequest = "生力軍"
Inst70Quest1_Folgequest = "無"
--
Inst70Quest1name1 = "劊子手指環"
Inst70Quest1name2 = "劇毀戒指"
Inst70Quest1name3 = "迅捷審判徽記"

--Quest 2 Alliance
Inst70Quest2 = "2. 撤除武裝"
Inst70Quest2_Level = "71"
Inst70Quest2_Attain = "70"
Inst70Quest2_Aim = "防衛者摩丹要你進入俄特加德要塞，並偷走5件維酷武器。"
Inst70Quest2_Location = "防衛者摩丹（凜風峽灣 - 龍顱村; "..YELLOW.."59.3, 48.8"..WHITE.."）"
Inst70Quest2_Note = "維酷武器在俄特加德要塞裡面都撿得到。"
Inst70Quest2_Prequest = "無"
Inst70Quest2_Folgequest = "無"
--
Inst70Quest2name1 = "寧靜心靈護符"
Inst70Quest2name2 = "鋒刃墜飾"
Inst70Quest2name3 = "聖光殘片項鍊"
Inst70Quest2name4 = "織紋鋼鍊"


--Quest 1 Horde
Inst70Quest1_HORDE = "1. 有待解決的宿怨"
Inst70Quest1_HORDE_Level = "71"
Inst70Quest1_HORDE_Attain = "68"
Inst70Quest1_HORDE_Aim = "高階執行官安賽姆要你進入俄特加德並殺掉凱雷希斯王子。"
Inst70Quest1_HORDE_Location = "高階執行官安賽姆（凜風峽灣 - 復仇臺地; "..YELLOW.."78.5, 31.1"..WHITE.."）"
Inst70Quest1_HORDE_Note = "凱雷希斯王子在"..YELLOW.."[1]"..WHITE.."。此任務的前置任務線也是由同一個NPC處開始。"
Inst70Quest1_HORDE_Prequest = "戰爭就是地獄→來自戰場的報告→風行者艦隊→埋伏！→指引方向→痛下殺手→回報安賽姆"
Inst70Quest1_HORDE_Folgequest = "無"
--
Inst70Quest1name1_HORDE = "煞婪裹帶"
Inst70Quest1name2_HORDE = "仇殺束腕"
Inst70Quest1name3_HORDE = "符文使護腕"
Inst70Quest1name4_HORDE = "報復使者臂鎧"

--Quest 2 Horde
Inst70Quest2_HORDE = "2. 因格瓦非死不可!"
Inst70Quest2_HORDE_Level = "71"
Inst70Quest2_HORDE_Attain = "70"
Inst70Quest2_HORDE_Aim = "黑暗遊俠瑪拉請求你殺死俄特加德要塞的『盜掠者』因格瓦，然後把他的頭顱帶給復仇臺地的高階執行官安賽姆。"
Inst70Quest2_HORDE_Location = "黑暗遊俠瑪拉（凜風峽灣 - 俄特加德要塞; "..YELLOW.."[A] 入口"..WHITE.."）"
Inst70Quest2_HORDE_Note = "當你進入地城時，黑暗遊俠瑪拉只會在入口處出現幾秒鐘。\n\n『盜掠者』因格瓦在"..YELLOW.."[3]"..WHITE.."。\n\n回覆任務的高階執行官安賽姆在（凜風峽灣 - 復仇臺地; "..YELLOW.."78.5, 31.1"..WHITE.."）。"
Inst70Quest2_HORDE_Prequest = "無"
Inst70Quest2_HORDE_Folgequest = "無"
--
Inst70Quest2name1_HORDE = "劊子手指環"
Inst70Quest2name2_HORDE = "劇毀戒指"
Inst70Quest2name3_HORDE = "迅捷審判徽記"

--Quest 3 Horde
Inst70Quest3_HORDE = "3. 撤除武裝"
Inst70Quest3_HORDE_Level = "71"
Inst70Quest3_HORDE_Attain = "70"
Inst70Quest3_HORDE_Aim = "黑暗遊俠瑪拉要求你，從俄特加德要塞偷走5件維酷武器，並送去給復仇臺地的高階執行官安賽姆。"
Inst70Quest3_HORDE_Location = "黑暗遊俠瑪拉（凜風峽灣 - 俄特加德要塞; "..YELLOW.."[A] 入口"..WHITE.."）"
Inst70Quest3_HORDE_Note = "當你進入地城時，黑暗遊俠瑪拉只會在入口處出現幾秒鐘。\n\n維酷武器在俄特加德要塞裡面都撿得到。\n\n回覆任務的高階執行官安賽姆在（凜風峽灣 - 復仇臺地; "..YELLOW.."78.5, 31.1"..WHITE.."）。"
Inst70Quest3_HORDE_Prequest = "無"
Inst70Quest3_HORDE_Folgequest = "無"
--
Inst70Quest3name1_HORDE = "平靜群空項鍊"
Inst70Quest3name2_HORDE = "百牙項鍊"
Inst70Quest3name3_HORDE = "受迫之力護符"
Inst70Quest3name4_HORDE = "磚石墜飾"



--------------- INST71 - Utgarde Keep: Utgarde Pinnacle ---------------

Inst71Story = {
  ["Page1"] = "在凜風峽灣的匕鞘海灣峭壁間佇立了俄特加德要塞，這座巨大的堡壘裡面佈滿了野蠻且神秘的維酷。沒有人知道這史前的堡壘到底有多麼的深入地表，只知道目前聯盟和部落派出的探子無一生還。一直以來大家都以為這建築已經被遺棄了，上千年無人使用，直到最近才被佔領。現在這群半巨人維酷決定要對要塞殘垣破璧附近的建築物發出無止境攻擊。\n\n維酷人不但對他們持續休眠的依米倫國王忠心不二，並且似乎只有活在戰爭下才會快活。在俄特加德裡面，邪惡的掠龍氏族在永不熄滅的熔爐內建造了大量的戰爭武器。所有的因格瓦的劫掠者都具有驚人的力量及生命力，有些甚至還學會並精通祕法奧義。大部分的維酷魔法似乎都來自神秘的符文，即使是最有經驗的法師也很不熟悉它們的運作。這些符文施法者乃為維酷內最具有殺傷力的生物，他們的對手通常會被寒冰的力量給凍結，然後再被擊碎成上千片碎片。",
  ["Page2"] = "雖然謠言持續不斷的指出依米倫的追隨者已經和天譴軍團結盟了，但凜風峽灣的居民卻更常看到掠龍氏族的盟友：元龍。這些殘暴的生物似乎跟他們較為有名的另外五支龍軍團近親沒有太多共通點。雖說如此，經過維酷有效的訓練後，恐怖的元龍也變成他們的坐騎。在『盜掠者』因格瓦的指揮下，這些龍騎士也非常樂於的從高空飛下偷襲敵人。\n\n雖然殘暴的維酷野心勃勃地想要統一北裂境上的領土，但他們現在也開始往凜風峽灣的地表下面擴張。因為依米倫的追隨者底下有太多不值錢的勞工，不過那些勇敢來到峽灣的冒險者卻懷疑維酷一定是取得外來的援助才有辦法延續他們的工作…\n\n俄特加德要塞的維酷在掌握了神祕的魔法及控制了元龍後，馬上也造成了聯盟及部落立即性的威脅。只有那些最英勇的冒險者敢挑戰依米倫忠心的手下和闖入維酷的地盤深處一探究竟。",
  ["MaxPages"] = "2",
};
Inst71Caption = "俄特加德要塞：俄特加德之巔"
Inst71Caption2 = "俄特加德要塞：俄特加德之巔（故事背景第二部分）"

Inst71QAA = "2 個任務"
Inst71QAH = "2 個任務"
Inst71General = {
    {
    "絲瓦拉．悲傷亡墓",
    "坦克拉王開場後，整場戰鬥只要注意當她施放劍之儀式後，會飛到平台正上方，而隨機一名隊友會被困在平台上，此外王還會丟劍下來，但降落很緩慢，一掉至平台地上時就會造成範圍傷害。所以最好在劍掉到地上前殺掉平台上3隻的儀式導魔師才能再次自由移動，恢復自由身的玩家也請移動至其他的地方以免受到劍之儀式的傷害而死亡。在她施放劍之儀式還沒下來時，遠程攻擊的隊員還能繼續對她作攻擊。持續以上的循環就應該可以輕鬆地殺掉她了。",
    RED .. "呼喚烈焰 ：" .. WHITE .. "從周圍的火焰召喚數道噴射的烈焰，攻擊施法者的敵人。\n" .. RED .. "劍之儀式：" .. WHITE .. "執行劍之儀式，將目標獻給巫妖王。\n" .. RED .. "邪惡攻擊：" .. WHITE .. "對敵人造成普通攻擊再加上833至967點傷害。",
    },

    {
    "戈托克．白蹄",
    "這邊需要利用剛進來時在房間末端的圓柱，點擊它以召喚王出來。在真的要與戈托克．白蹄戰鬥前，需要先跟在它前面的四個動物分身中，隨機二個會依序過來打，最後才是王本身。英雄模式的話則要打死四個動物分身才能與戈托克．白蹄戰鬥。",
    RED .. "大型的蟄猛巨蟲：" .. WHITE .. "會酸液噴射、酸液濺灑、毒息。\n" .. RED .. "兇猛的犀牛：" .. WHITE .. "會獠牙穿刺、重創傷、踐踏。\n" .. RED .. "狂亂的狼人：" .. WHITE .. "會致死重傷、狂怒。\n" .. RED .. "極餓的熊怪：" .. WHITE .. "會閃電鏈、恐嚇咆哮、癲狂。",
    },

    {
    "無情的斯卡迪",
    "當玩家觸發戰鬥後，王將會騎著元龍在天空飛，而玩家們會碰到一條類似天堂路的狀況：每一波都有4隻依米亞戰士或3隻依米亞戰士+1隻依米亞巫醫或1隻依米亞魚叉手，殺掉依米亞魚叉手時會掉落魚叉，玩家們必須利用魚叉來讓王降落。在邊清怪邊前進時，玩家們必須要躲開王在空中向地上噴出的冰霧（每秒數千傷害）。請記得邊清怪邊撿取魚叉，每當畫面出現【無情的斯卡迪在魚叉發射器的射程之內】時，馬上使用平台旁的三具魚叉發射器把魚叉射向王。若不把他射下來，平台旁的門口就會一直生出怪來，王也不會下來戰鬥。王一跳下來平台時，坦要馬上過去將王拉住以免造成不必要的傷亡，此時隊友應該要先殺掉剩下的小兵再回來打王。最重要的是記得躲他的旋風斬，坦離遠程攻擊職業不要太近，近戰職業看到也要馬上閃開。",
    RED .. "擊碎：" .. WHITE .. "對你的目標造成150%近戰傷害，並將其擊倒，持續2秒。\n" .. RED .. "毒矛：" .. WHITE .. "對敵人擲出一把毒矛，造成4713至5287點物理傷害，並且每3秒額外造成1885至2115點自然傷害，持續12秒。\n" .. RED .. "旋風斬：" .. WHITE .. "每秒對周圍的敵人造成4713至5287點傷害，但你的移動速度降低50%。",
    },
    
    {
    "依米倫王",
    "在打王前面的小兵群時記得要拉到後面去，免得玩家被小兵恐到王前。開始戰鬥後，在王施放災禍時最好能驅除掉，免得讓坦或近戰職業多受傷害。在開打一段時間後，王會施放死者尖嘯讓全隊員呆在原地，並跑去房間內四艘小船的其中一艘召喚裡面的靈魂幫助他，各使王獲得不同的能力。死者尖嘯在王要去換下一艘小船時也會放，又因王的黑暗斬擊、惡臭腐氣等效果，補職應該在王施放死者尖嘯前盡量把坦的血量拉回。",
    RED .. "災禍：" .. WHITE .. "魔法可驅散，使施法者環繞著災禍光環，每當施法者受到直接傷害時對周圍敵人造成1414至1586點暗影傷害，持續5秒。\n" .. RED .. "黑暗斬擊：" .. WHITE .. "使用黑暗的力量斬擊目標，造成目標現有生命力一半的傷害。\n" .. RED .. "惡臭腐氣：" .. WHITE .. "使目標受到惡臭腐氣的影響，每3秒造成1414至1586點自然傷害，且受到的治療效果降低25%，持續9秒。\n" .. RED .. "死者尖嘯：" .. WHITE .. "放出刺骨的尖叫，使所有敵人昏迷，持續8秒。\n" .. RED .. "靈魂爆裂：" .. WHITE .. "對周圍所有敵人造成2357至2643點暗影傷害。\n" .. RED .. "精神打擊：" .. WHITE .. "造成925至1075點傷害並使其受到的物理傷害提高250點。最多可堆疊100次，持續10秒。",
    },
};

--Quest 1 Alliance
Inst71Quest1 = "1. 我箱子裡的垃圾"
Inst71Quest1_Level = "80"
Inst71Quest1_Attain = "80"
Inst71Quest1_Aim = "俄特加德之巔的布瑞格要求你，找到5個失去光澤的銀錠、3顆閃光的小珠、2只黃金高腳杯以及1尊碧玉雕像。"
Inst71Quest1_Location = "布瑞格．細柄（俄特加德之巔; "..YELLOW.."[A]"..WHITE.."）"
Inst71Quest1_Note = "要尋找的物件散落在地城各處，通常都散落在地板上。※閃光的小珠和釣魚時所使用的誘餌不同！"
Inst71Quest1_Prequest = "無"
Inst71Quest1_Folgequest = "無"
--
Inst71Quest1name1 = "串珠禮袍"
Inst71Quest1name2 = "奇特皮甲外套"
Inst71Quest1name3 = "鍍銀戰鬥胸甲"
Inst71Quest1name4 = "鍍金環甲鍊衫"

--Quest 2 Alliance
Inst71Quest2 = "2. 我將復仇!"
Inst71Quest2_Level = "80"
Inst71Quest2_Attain = "80"
Inst71Quest2_Aim = "俄特加德之巔的布瑞格要求你，殺掉依米倫王。"
Inst71Quest2_Location = "布瑞格．細柄（俄特加德之巔; "..YELLOW.."[A]"..WHITE.."）"
Inst71Quest2_Note = "依米倫王在"..YELLOW.."[4]"..WHITE.."。"
Inst71Quest2_Prequest = "無"
Inst71Quest2_Folgequest = "無"
--
Inst71Quest2name1 = "復仇隊長風帽"
Inst71Quest2name2 = "報復護盔"
Inst71Quest2name3 = "公正懲戒盔帽"
Inst71Quest2name4 = "懲罰面甲"
Inst71Quest2name5 = "暴怒復仇鎧盔"


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

Inst72Story = {
  ["Page1"] = "藍龍的領導者瑪里苟斯，在久遠的年代以前被泰坦賦予看管魔法的任務。數萬年之前，他驚恐的看著死亡之翼摧毀了藍龍一族。因突如其來的災變而過度悲傷的瑪里苟斯，離開了巢穴並從此對世界漠不關心，直到他終於看到一絲能夠向死亡之翼的暴行復仇的契機才又重新振作。\n\n直到最近瑪里苟斯才完全回復心智。神智逐漸清醒的同時，他也迅速的分析目前艾澤拉斯的魔法脈動，並得出了一項令人害怕的結果，魔法能量正瘋狂的在這世界裡竄流著。他將這樣的發展歸咎於這些對魔法力量索求無度的凡人們。\n\n決心要先發制人阻止這場災難，瑪里苟斯決定不管手段為何，都一定要讓世界中的魔法回歸秩序。 因此這個智者決定倚重地脈圖的協助，一份很久以前泰坦諾甘儂贈送給瑪里苟斯的禮物。在瑪里苟斯隱居的這幾年中，藍龍們仍持續的更新和修正著地脈圖的內容。",
  ["Page2"] = "現在瑪里苟斯用地脈圖來定位和標記出世界的地貌，並將地底下流動的魔法能量導引至他位於北裂境的巢穴，奧核之心的地底下。只要完成枷鎖，這股能量就可以順著奧核之心外部的漂浮環狀物質，流向扭曲虛空。瑪里苟斯重新導引地脈的舉動招致了嚴重的後果，使世界的地殼分裂並產生了不穩定的裂口：撕扯著魔法位元的結構。\n\n瑪里苟斯將世界的魔法能量引流的舉動並非無人發覺。勢力逐漸衰弱的肯瑞托成員們，達拉然的精英博學者們，發誓將與瑪里苟斯對抗到底。事實上，博學者們以他們衰弱的力量，讓達拉然的整個城市漂浮在北裂境上方。從這個有利的位置，博學者們加緊腳步準備著接下來對抗巫妖王將面臨的戰事，以及和瑪里苟斯無法避免的對峙。",
  ["Page3"] = "然而，並非所有的肯瑞托都在同一陣線上。一些成員轉而加入藍龍軍團，希望能由此重新取回失去的力量。經過瑪里苟斯轉化與改造後，這些狩法獵人被賦予進行必要的根除任務，摧毀那些具有魔力的人造物品；殺死或囚禁那些未經瑪里苟斯允許而練習魔法的人；還有以巨大的極濤磁針協助引導地脈的作業。\n\n藍龍越來越明顯的軍事作法受到了紅龍的譴責。負責掌管生命延續的紅龍，誓言不計一切代價也要將瑪里苟斯導回正途。基於相同的目標，他們與肯瑞托一起組織了一個議會，且這兩個集團開始積極地在暗中阻擾瑪里苟斯那毀滅性的活動。\n\n勢力儼然成形；戰火一觸即發。現在只剩下一個問題…\n\n究竟誰才是最後的勝利者？",
  ["MaxPages"] = "3",
};
Inst72Caption = "奈薩斯：奧核之心"
Inst72Caption2 = "奈薩斯：奧核之心（故事背景第二部分）"
Inst72Caption3 = "奈薩斯：奧核之心（故事背景第三部分）"

Inst72QAA = "4 個任務"
Inst72QAH = "4 個任務"
Inst72General = {
    {
    "大魔導師特雷斯翠",
    "王第一階段會使用火球術、重力井、冰霜新星。王血量剩50%時，即進入第二階段，其中火法可能會隨機灼燒任一隊友，但目標應該還是在坦上、奧法則會把隊友變成羊、或施展時間暫停，此時若搭配冰法的廣範圍的暴風雪，將會讓隊伍造成不小損傷。要是隊伍成員沒能對王的3個分身做控場（羊、恐、沉默等）的話，建議先殺冰法以降低整隊受到的傷害，再來第二個就是奧法（沒人可解羊的話）或火法（以降低傷害；有人可解羊）。當三個分身都殺掉後，王就會回覆到第一階段時的血量，持續使用原有的技能。",
    RED .. "火焰彈：" .. WHITE .. "對敵人和其身邊的敵人造成火焰傷害。\n" .. RED .. "寒冰新星：" .. WHITE .. "對60碼範圍內的所有敵人造成3299至3701點冰霜傷害，並使其昏迷3秒。\n" .. RED .. "重力井：" .. WHITE .. "持續將60碼內的玩家拉近施法者，快速的在6秒內造成75點暗影傷害。\n" .. RED .. "灼燒：" .. WHITE .. "灼燒敵人，對其造成火焰傷害。\n" .. RED .. "火焰衝擊：" .. WHITE .. "對敵人造成火焰傷害。\n" .. RED .. "暴風雪：" .. WHITE .. "召喚持續6秒的暴風雪，對指定區域內的所有敵人每2秒造成1000點冰霜傷害。\n" .. RED .. "冰刺：" .. WHITE .. "對目標敵人造成438至562點冰霜傷害。對被冰凍的敵人造成三倍傷害。\n" .. RED .. "小動物：" .. WHITE .. "將敵人變成小動物，使其在周圍到處閒逛，最多持續3秒。在此期間，小動物無法攻擊或施法。\n" .. RED .. "時間停止：" .. WHITE .. "使半徑50碼範圍內的所有敵人昏迷2秒。",
    },

    {
    "艾諾瑪路斯",
    "這個王每當血量到達75%、50%、25%時都會進入無敵狀態，並分離出一個叫混沌裂縫的小球持續放電，這個時候需要集火殺掉小球，然後再轉換目標殺王。由於小球的攻擊是聯結傷害的，所以大家開戰以後要互相分散，而且這個平台是沒有界限的（沒有隱形的牆），注意別掉下去。王的攻擊為元素性物理攻擊，傷害一般，打坦一般在1000至1500（英雄約3000至4000）之間。治療職業這裡只要注意在分離階段刷好小隊每個人的血就可以了。",
    RED .. "火花：" .. WHITE .. "向敵人射出一支魔法箭，對其造成秘法傷害。\n" .. RED .. "裂縫護盾：" .. WHITE .. "從附近的混沌裂縫引導能量至施法者身上，使其充滿能量。施法者在引導時免疫傷害。\n" .. RED .. "裂縫充能：" .. WHITE .. "艾諾瑪路斯將他的混沌能量引導至周圍的裂縫，提高它們攻擊的距離以及製造混沌怨靈的頻率。\n" .. RED .. "製造裂縫：" .. WHITE .. "撕裂空間結構，在艾諾瑪路斯附近開啟混沌裂縫。\n" .. RED .. "秘法引力：" .. WHITE .. "受到的秘法傷害提高2000點，持續10秒。",
    },

    {
    "『樹木造形者』歐爾莫洛克",
    "整個隊伍最好是都在王的平台上打，免得平台下的小花回滿血之後會去拉到。這王最主要的就是躲冰錐；坦開場先把王拉到平台中央，其他隊友則散開來，冰霜穿刺一開始只會在地上產生四排碎冰環，一看到就盡量馬上躲開，沒閃好的話，除了被刺到會損血，從高空掉下來又是一大傷害，一不小心可能就會因此而死。此外，法術反射護盾效果能反射4次法術傷害，所以隊上的施法者看是要用較低等的技能去消耗掉或是乾脆不管就照打都行，但請注意本身血量。最後王的血量剩25%的時候會激怒，就要盡速殺掉。",
    RED .. "踐踏：" .. WHITE .. "對附近的敵人造成3299至3701點物理傷害。\n" .. RED .. "法術反射：" .. WHITE .. "可反射魔法性質的法術4次。\n" .. RED .. "水晶尖刺：" .. WHITE .. "召喚成群的水晶尖刺，從施法者的腳下以放射狀的方式向四面八方延伸出去。短時間內，這些尖刺將從地面竄起，對周圍所有敵人造成3770至4230點傷害，並擊飛至空中。\n" .. RED .. "召喚結晶糾纏者：" .. WHITE .. "召喚結晶糾纏者。\n" .. RED .. "狂亂：" .. WHITE .. "使施法者造成的物理傷害提高50%。",
    },
    
    {
    "凱瑞史卓莎",
    "王一開始處於冰凍狀態，有4個球體在旁邊可敲擊，一但此區的巡邏清除後，敲擊球體便會使她釋放，坦克要立即將王拉住且和隊友平行。其中火焰結晶吐息可被驅散，劇寒可堆疊9次，為了避免劇寒堆疊，你必須移動並且驅除劇寒，當劇寒驅除後所有人保持距離火力輸出。隨時注意進戰和坦克的持傷並立即驅除，隊伍中必須有一人可以清除或淨化才可移除連鎖結凍，以免被定住10秒，亦可清除極度冷卻的持傷。一定要避開王的正面，以及避免尾翼掃擊跟火焰結晶吐息。",
    RED .. "尾翼掃擊：" .. WHITE .. "對施法者身後錐形範圍內的敵人造成600至1000點傷害，將它們擊退。\n" .. RED .. "水晶之鍊：" .. WHITE .. "造成冰霜傷害並使一名敵方目標無法移動，最多持續10秒。\n" .. RED .. "狂怒：" .. WHITE .. "狂怒，提高物理傷害和攻擊速度，持續2分鐘。\n" .. RED .. "晶火之息：" .. WHITE .. "對施法者前方錐形範圍內的敵人造成霜火傷害，降低其移動速度並隨時間造成傷害。\n" .. RED .. "劇寒：" .. WHITE .. "造成週期性傷害，並使周圍敵人的攻擊和施法速度隨時間降低1%。移動可移除此效果。\n" .. RED .. "結晶：" .. WHITE .. "對附近的敵人造成冰霜傷害並將其凍結在原地，凍結效果最多可持續10秒。",
    },
};

--Quest 1 Alliance
Inst72Quest1 = "1. 他們不知羞恥嗎?"
Inst72Quest1_Level = "71"
Inst72Quest1_Attain = "70"
Inst72Quest1_Aim = "圖書管理員瑟菈要你進入奧核之心並取回貝瑞那德的研究。"
Inst72Quest1_Location = "圖書管理員瑟菈（北風凍原 - 隘境之盾; "..YELLOW.."33.4, 34.3"..WHITE.."）"
Inst72Quest1_Note = "[貝瑞那德的研究]在前往大魔導師特雷斯翠的路上，有一堆被冰住的怪物"..YELLOW.."[4]"..WHITE.."的地板上。"
Inst72Quest1_Prequest = "無"
Inst72Quest1_Folgequest = "無"
--
Inst72Quest1name1 = "北方之光護肩"
Inst72Quest1name2 = "痊癒長毛象皮披肩"
Inst72Quest1name3 = "凍原追蹤者肩衛"
Inst72Quest1name4 = "凍原肩鎧"

--Quest 2 Alliance
Inst72Quest2 = "2. 拖延不可避免的毀滅"
Inst72Quest2_Level = "71"
Inst72Quest2_Attain = "70"
Inst72Quest2_Aim = "隘境之盾的大法師貝瑞那德希望你前往奧核之心，在裂縫旁邊使用間次元重製器。"
Inst72Quest2_Location = "大法師貝瑞那德（北風凍原 - 隘境之盾; "..YELLOW.."32.9, 34.3"..WHITE.."）"
Inst72Quest2_Note = "奧核之心的裂縫在艾諾瑪路斯"..YELLOW.."[2]"..WHITE.."身後。"
Inst72Quest2_Prequest = "檢查讀數"
Inst72Quest2_Folgequest = "無"
Inst72Quest2PreQuest = "true"
--
Inst72Quest2name1 = "時間扭曲裹帶"
Inst72Quest2name2 = "時間停止手套"
Inst72Quest2name3 = "妨害束手"
Inst72Quest2name4 = "失心巨人護手"

--Quest 3 Alliance
Inst72Quest3 = "3. 戰爭的囚犯"
Inst72Quest3_Level = "71"
Inst72Quest3_Attain = "70"
Inst72Quest3_Aim = "隘境之盾的瑞洛拉茲要你進入奧核之心釋放凱瑞史卓莎。"
Inst72Quest3_Location = "瑞洛拉茲（北風凍原 - 隘境之盾; "..YELLOW.."33.2, 34.4"..WHITE.."）"
Inst72Quest3_Note = "凱瑞史卓莎在"..YELLOW.."[5]"..WHITE.."。"
Inst72Quest3_Prequest = "凱瑞史卓莎→發動陷阱"
Inst72Quest3_Folgequest = "無"
Inst72Quest3PreQuest = "true"
--
Inst72Quest3name1 = "蒼藍光芒披風"
Inst72Quest3name2 = "凱瑞史卓莎的披肩"
Inst72Quest3name3 = "流動之擊罩氅"

--Quest 4 Alliance
Inst72Quest4 = "4. 加速"
Inst72Quest4_Level = "71"
Inst72Quest4_Attain = "70"
Inst72Quest4_Aim = "隘境之盾的大法師貝瑞那德希望你進入奧核之心從結晶保衛者身上收集5個秘法裂塊。"
Inst72Quest4_Location = "大法師貝瑞那德（北風凍原 - 隘境之盾; "..YELLOW.."32.9, 34.3"..WHITE.."）"
Inst72Quest4_Note = "秘法裂塊由結晶保衛者掉落，在前往『樹木造形者』歐爾莫洛克的路上便可看到結晶保衛者。"
Inst72Quest4_Prequest = "古樹的秘密"
Inst72Quest4_Folgequest = "無"
Inst72Quest4PreQuest = "true"
--
Inst72Quest4name1 = "奧秘演化便鞋"
Inst72Quest4name2 = "撕裂未來足靴"
Inst72Quest4name3 = "異變尖刺足靴"
Inst72Quest4name4 = "鼓舞脛甲"
Inst72Quest4name5 = "不屈保衛者長靴"


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

Inst73Story = {
  ["Page1"] = "藍龍的領導者瑪里苟斯，在久遠的年代以前被泰坦賦予看管魔法的任務。數萬年之前，他驚恐的看著死亡之翼摧毀了藍龍一族。因突如其來的災變而過度悲傷的瑪里苟斯，離開了巢穴並從此對世界漠不關心，直到他終於看到一絲能夠向死亡之翼的暴行復仇的契機才又重新振作。\n\n直到最近瑪里苟斯才完全回復心智。神智逐漸清醒的同時，他也迅速的分析目前艾澤拉斯的魔法脈動，並得出了一項令人害怕的結果，魔法能量正瘋狂的在這世界裡竄流著。他將這樣的發展歸咎於這些對魔法力量索求無度的凡人們。\n\n決心要先發制人阻止這場災難，瑪里苟斯決定不管手段為何，都一定要讓世界中的魔法回歸秩序。 因此這個智者決定倚重地脈圖的協助，一份很久以前泰坦諾甘儂贈送給瑪里苟斯的禮物。在瑪里苟斯隱居的這幾年中，藍龍們仍持續的更新和修正著地脈圖的內容。",
  ["Page2"] = "現在瑪里苟斯用地脈圖來定位和標記出世界的地貌，並將地底下流動的魔法能量導引至他位於北裂境的巢穴，奧核之心的地底下。只要完成枷鎖，這股能量就可以順著奧核之心外部的漂浮環狀物質，流向扭曲虛空。瑪里苟斯重新導引地脈的舉動招致了嚴重的後果，使世界的地殼分裂並產生了不穩定的裂口：撕扯著魔法位元的結構。\n\n瑪里苟斯將世界的魔法能量引流的舉動並非無人發覺。勢力逐漸衰弱的肯瑞托成員們，達拉然的精英博學者們，發誓將與瑪里苟斯對抗到底。事實上，博學者們以他們衰弱的力量，讓達拉然的整個城市漂浮在北裂境上方。從這個有利的位置，博學者們加緊腳步準備著接下來對抗巫妖王將面臨的戰事，以及和瑪里苟斯無法避免的對峙。",
  ["Page3"] = "然而，並非所有的肯瑞托都在同一陣線上。一些成員轉而加入藍龍軍團，希望能由此重新取回失去的力量。經過瑪里苟斯轉化與改造後，這些狩法獵人被賦予進行必要的根除任務，摧毀那些具有魔力的人造物品；殺死或囚禁那些未經瑪里苟斯允許而練習魔法的人；還有以巨大的極濤磁針協助引導地脈的作業。\n\n藍龍越來越明顯的軍事作法受到了紅龍的譴責。負責掌管生命延續的紅龍，誓言不計一切代價也要將瑪里苟斯導回正途。基於相同的目標，他們與肯瑞托一起組織了一個議會，且這兩個集團開始積極地在暗中阻擾瑪里苟斯那毀滅性的活動。\n\n勢力儼然成形；戰火一觸即發。現在只剩下一個問題…\n\n究竟誰才是最後的勝利者？",
  ["MaxPages"] = "3",
};
Inst73Caption = "奈薩斯：奧核之眼"
Inst73Caption2 = "奈薩斯：奧核之眼（故事背景第二部分）"
Inst73Caption3 = "奈薩斯：奧核之眼（故事背景第三部分）"

Inst73QAA = "4 個任務"
Inst73QAH = "4 個任務"
Inst73General = {
    {
    "『審問者』德拉高斯",
    "坦一開始把王坦在平台中央，其他人圍在旁邊。王隨後就會釋放出炸彈；炸彈會先亂跑，跑到最後會停住，而待在原地幾秒鐘才會爆炸。所以每個人在打王的同時，也要觀察一下身邊那群炸彈的動態，而才閃開那些停在原地等爆炸的炸彈。",
    RED .. "魔法拖曳：" .. WHITE .. "將所有附近的敵方目標傳送至施法者身邊。\n" .. RED .. "雷鳴踐踏：" .. WHITE .. "踐踏地面，對廣大範圍內的敵人造成物理傷害，並將其擊飛至空中。",
    },

    {
    "瓦羅斯．雲行者",
    "在王的平台四周漂浮著許多能量球，在戰鬥中，王會隨機從一個方向上的幾個能量球上吸取能量，吸取能量的時候，王和能量球之間會有較細的藍色光線連接，這樣王和幾個能量球之間會形成一個電網，數秒之後，電網施放能量，被電網覆蓋的玩家將受到極大的傷害（英雄模式下中了的話非死即殘啊！）。以上是這個王唯一需要注意的地方，應對方法如下：坦盡量將王拉在中間，當王停下攻擊開始吸取能量的時候，所有人觀察自己是否在電網的覆蓋下，如果被覆蓋，則馬上跑出電網覆蓋的範圍。該技能的CD是13秒，因此閃出去以後你大概還有10秒的時間進行攻擊，然後再次準備移動位置。這個王的血也很少，一邊躲閃一邊攻擊，也能很快將其擊殺。",
   RED .. "魔法增效：" .. WHITE .. "增強施放於敵人的魔法效果，使其受到的法術傷害提高最多900點（英雄1800點），治療法術所恢復的生命力提高最多1800點（英雄3600點），持續30秒。\n" .. RED .. "充能核心：" .. WHITE .. "對敵人施放魔法箭，造成秘法傷害。\n" .. RED .. "呼喚蒼藍之環隊長：" .. WHITE .. "呼喚蒼藍之環隊長摧毀你的敵人。",
    },

    {
    "法師領主厄隆",
    "坦在王的起始位置拉住王，並且邊坦著王邊退後，圍著場地繞圈。王的冰霜之墓只會對第一仇恨目標施放而且範圍很廣，所以坦不用躲，治療者注意刷血就可以了。其他玩家在中了時間炸彈以後，注意跑開一小段距離，以免對隊友造成傷害。此外王會瞬移到圓環的中心位置，開始吟唱奧爆並處於無敵狀態，坦要迅速跑回隊伍中跟著大家一起利用石牆來躲開奧爆。奧爆完了以後，王會瞬移到坦身邊，此時其他隊友要迅速離開，以免王丟下冰霜之墓導致其他隊友無法站位。傳送約2至3次之後，應該就可以將其擊殺了。",
   RED .. "時間爆彈：" .. WHITE .. "造成3800至4200點秘法傷害，並在一名敵人體內種下時間爆彈。6秒後爆彈將會爆炸，對周圍的敵人造成額外的秘法傷害，其數值相當於該目標損失的生命力。\n" .. RED .. "冰霜爆彈：" .. WHITE .. "釋出冰霜爆彈造成冰霜傷害並將地面凍結，對範圍內的敵人造成週期性冰霜傷害且減緩移動速度。\n" .. RED .. "強力魔爆術：" .. WHITE .. "施放出一股魔法衝擊波，對附近的敵人造成秘法傷害。\n" .. RED .. "傳送：" .. WHITE .. "將施法者傳送至奧核之眼的中心。\n" .. RED .. "召喚獸群：" .. WHITE .. "召喚各式種類的生物，並將施法者傳送至安全的地方。\n" .. RED .. "秘法之盾：" .. WHITE .. "保護施法者不受傷害。",
    },
    
    {
    "地脈守護者伊瑞茍斯（第一頁）",
    RED .. "秘法彈幕：" .. WHITE .. "對敵人造成秘法傷害。\n" .. RED .. "秘法箭雨：" .. WHITE .. "對敵人造成秘法傷害。\n" .. RED .. "狂怒襲擊：" .. WHITE .. "提高25%造成的傷害以及100%的施法速度，持續12秒。\n" .. RED .. "界域異象：" .. WHITE .. "地脈守護者伊瑞茍斯界域轉換後釋放出界域異象，緩慢向玩家移動，靠近目標後爆炸，造成50000至100000的傷害。\n" .. RED .. "界域轉換：" .. WHITE .. "將施法者轉換到星界，持續18秒。轉換時，施法者將對魔法攻擊免疫但無法移動或攻擊。",
    "一開始建議選擇1紅2綠2黃的組合，紅的為坦克，綠的治療者，黃的是攻擊者。\n\n紅龍首先進入王視線觸發戰鬥，不停用1號技能攻擊王，2號閃避技能以及3號吸收隊友負面狀態的技能也是CD一到就馬上使用。而綠龍則要注意1號吸血技能要常駐王身上以免自己沒血可補隊友，並且輪流施放2號技能降低王所能造成的傷害，大部分時間裡只要注意紅龍的血量，其他黃龍只有在OT或者被群體魔法攻擊了以後抽空治療一下即可。",
    },
    
    {
    "地脈守護者伊瑞茍斯（第二頁）",
    "黃龍負責輸出以及時間停止，在輸出方面，2條龍輪流用3號技能來聚氣，在龍身上的DEBUFF疊加到10層之後，馬上換下一條黃龍聚氣，當看到下一個黃龍的技能使用以後，用1號技能攻擊王，在10層聚氣下，一次攻擊可以打到15萬左右（不聚氣只有8000左右），而下一個聚氣的黃龍也是如此操作，這樣可以獲得傷害的最大化。很多人在打過以後覺得王的血很厚，實際上是沒有找到正確的方法。\n\n而黃龍還有一個工作是負責時間停止，王每過一段時間都會狂暴（狂暴的時候會喊話），黃龍要在這個時候使用時間停止來減少王對坦的傷害，時間停止的技能CD是1分鐘，而王狂暴的間隔則小於1分鐘，因此2條黃龍要商量好時間停止的順序，以免出現無CD的情況。時間停止持續時間10秒，但是其受效果遞減的影響，後面持續的時間會越來越短。當王使用位面轉移的時候（停止攻擊，體型虛化，並且會有喊話），所有人迅速遠離王，越遠越好。因為其位面畸體的速度不慢，且追擊範圍很廣。另外跑得遠，也可以有足夠的時間刷新時間停止的遞減效果。等王位面轉移結束以後，所有人再一起飛回去重複上一輪的操作。擊殺王後，頂部平台的寶箱將為大家提供拾取寶物。",
    },
};

--Quest 1 Alliance
Inst73Quest1 = "1. 負隅頑抗"
Inst73Quest1_Level = "80"
Inst73Quest1_Attain = "77"
Inst73Quest1_Aim = "瑞洛拉茲要你進入奧核之眼並解救貝加瑞斯塔茲與他的同伴。"
Inst73Quest1_Location = "瑞洛拉茲（北風凍原 - 隘境之盾; "..YELLOW.."33.2, 34.4"..WHITE.."）"
Inst73Quest1_Note = "當你擊敗位於"..YELLOW.."[1]"..WHITE.."的『審問者』德拉高斯後，貝加瑞斯塔茲將會從他的籠子裡面被釋放出來。"
Inst73Quest1_Prequest = "無"
Inst73Quest1_Folgequest = "共同戰線"
--
Inst73Quest1name1 = "魯莽戒指"
Inst73Quest1name2 = "繁茂指環"
Inst73Quest1name3 = "積極指環"
Inst73Quest1name4 = "堅定徽記"

--Quest 2 Alliance
Inst73Quest2 = "2. 共同戰線"
Inst73Quest2_Level = "80"
Inst73Quest2_Attain = "77"
Inst73Quest2_Aim = "貝加瑞斯塔茲要你摧毀10具離心傀儡，除去瓦羅斯的護盾。然後你擊敗瓦羅斯．雲行者。"
Inst73Quest2_Location = "貝加瑞斯塔茲（奈薩斯：奧核之眼; "..YELLOW.."[1]"..WHITE.."）"
Inst73Quest2_Note = "當你打敗瓦羅斯．雲行者"..YELLOW.."[2]"..WHITE.."後，貝加瑞斯塔茲便會從瓦羅斯．雲行者身後的籠中走出來。"
Inst73Quest2_Prequest = "負隅頑抗"
Inst73Quest2_Folgequest = "法師領主厄隆"
Inst73Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst73Quest3 = "3. 法師領主厄隆"
Inst73Quest3_Level = "80"
Inst73Quest3_Attain = "77"
Inst73Quest3_Aim = "貝加瑞斯塔茲要你擊敗奧核之眼中的法師領主厄隆。"
Inst73Quest3_Location = "貝加瑞斯塔茲的影像（奈薩斯：奧核之眼; "..YELLOW.."[2]"..WHITE.."）"
Inst73Quest3_Note = "當你擊敗位於"..YELLOW.."[3]"..WHITE.."的法師領主厄隆後，貝加瑞斯塔茲的影像將會出現在你身旁。"
Inst73Quest3_Prequest = "共同戰線"
Inst73Quest3_Folgequest = "飛翼與祈禱"
Inst73Quest3FQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst73Quest4 = "4. 飛翼與祈禱"
Inst73Quest4_Level = "80"
Inst73Quest4_Attain = "80"
Inst73Quest4_Aim = "貝加瑞斯塔茲要你殺死奧核之眼的伊瑞苟斯，然後向凜懼島上隘境之盾中的瑞洛拉茲回報。"
Inst73Quest4_Location = "貝加瑞斯塔茲的影像（奈薩斯：奧核之眼; "..YELLOW.."[3]"..WHITE.."）"
Inst73Quest4_Note = "地脈守護者伊瑞茍斯在"..YELLOW.."[4]"..WHITE.."。瑞洛拉茲在（北風凍原 - 隘境之盾; "..YELLOW.."33.2, 34.4"..WHITE.."）。"
Inst73Quest4_Prequest = "法師領主厄隆"
Inst73Quest4_Folgequest = "無"
Inst73Quest4FQuest = "true"
--
Inst73Quest6name1 = "感激腕輪"
Inst73Quest6name2 = "翱翔裹腕"
Inst73Quest6name3 = "瑞洛拉茲束腕"
Inst73Quest6name4 = "敬畏裹腕"


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

Inst74Story = {
  ["Page1"] = "藍龍的領導者瑪里苟斯，在久遠的年代以前被泰坦賦予看管魔法的任務。數萬年之前，他驚恐的看著死亡之翼摧毀了藍龍一族。因突如其來的災變而過度悲傷的瑪里苟斯，離開了巢穴並從此對世界漠不關心，直到他終於看到一絲能夠向死亡之翼的暴行復仇的契機才又重新振作。\n\n直到最近瑪里苟斯才完全回復心智。神智逐漸清醒的同時，他也迅速的分析目前艾澤拉斯的魔法脈動，並得出了一項令人害怕的結果，魔法能量正瘋狂的在這世界裡竄流著。他將這樣的發展歸咎於這些對魔法力量索求無度的凡人們。\n\n決心要先發制人阻止這場災難，瑪里苟斯決定不管手段為何，都一定要讓世界中的魔法回歸秩序。 因此這個智者決定倚重地脈圖的協助，一份很久以前泰坦諾甘儂贈送給瑪里苟斯的禮物。在瑪里苟斯隱居的這幾年中，藍龍們仍持續的更新和修正著地脈圖的內容。",
  ["Page2"] = "現在瑪里苟斯用地脈圖來定位和標記出世界的地貌，並將地底下流動的魔法能量導引至他位於北裂境的巢穴，奧核之心的地底下。只要完成枷鎖，這股能量就可以順著奧核之心外部的漂浮環狀物質，流向扭曲虛空。瑪里苟斯重新導引地脈的舉動招致了嚴重的後果，使世界的地殼分裂並產生了不穩定的裂口：撕扯著魔法位元的結構。\n\n瑪里苟斯將世界的魔法能量引流的舉動並非無人發覺。勢力逐漸衰弱的肯瑞托成員們，達拉然的精英博學者們，發誓將與瑪里苟斯對抗到底。事實上，博學者們以他們衰弱的力量，讓達拉然的整個城市漂浮在北裂境上方。從這個有利的位置，博學者們加緊腳步準備著接下來對抗巫妖王將面臨的戰事，以及和瑪里苟斯無法避免的對峙。",
  ["Page3"] = "然而，並非所有的肯瑞托都在同一陣線上。一些成員轉而加入藍龍軍團，希望能由此重新取回失去的力量。經過瑪里苟斯轉化與改造後，這些狩法獵人被賦予進行必要的根除任務，摧毀那些具有魔力的人造物品；殺死或囚禁那些未經瑪里苟斯允許而練習魔法的人；還有以巨大的極濤磁針協助引導地脈的作業。\n\n藍龍越來越明顯的軍事作法受到了紅龍的譴責。負責掌管生命延續的紅龍，誓言不計一切代價也要將瑪里苟斯導回正途。基於相同的目標，他們與肯瑞托一起組織了一個議會，且這兩個集團開始積極地在暗中阻擾瑪里苟斯那毀滅性的活動。\n\n勢力儼然成形；戰火一觸即發。現在只剩下一個問題…\n\n究竟誰才是最後的勝利者？",
  ["MaxPages"] = "3",
};
Inst74Caption = "奈薩斯：永恆之眼"
Inst74Caption2 = "奈薩斯：永恆之眼（故事背景第二部分）"
Inst74Caption3 = "奈薩斯：永恆之眼（故事背景第三部分）"

Inst74QAA = "3 個任務"
Inst74QAH = "3 個任務"

--Quest 1 Alliance
Inst74Quest1 = "1. 永恆之眼的審判"
Inst74Quest1_Level = "80"
Inst74Quest1_Attain = "80"
Inst74Quest1_Aim = "卡薩斯，位於龍骨荒野的龍眠神殿頂端，要你帶著魔法之心回去。"
Inst74Quest1_Location = "卡薩斯（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）"
Inst74Quest1_Note = "在瑪里苟斯死後，你可以在紅龍女王雅立史卓莎的禮物旁發現懸掛於天空中的魔法之心。此任務必須在普通難度的10人永恆之眼中完成。"
Inst74Quest1_Prequest = "聚源虹膜之鑰（"..YELLOW.."納克薩瑪斯"..WHITE.."）"
Inst74Quest1_Folgequest = "無"
Inst74Quest1PreQuest = "true"
--
Inst74Quest1name1 = "上古巨龍之鍊"
Inst74Quest1name2 = "紅龍軍團頸環"
Inst74Quest1name3 = "龍誓墜飾"
Inst74Quest1name4 = "飛龍鱗項圈"

--Quest 2 Alliance
Inst74Quest2 = "2. 永恆之眼的英雄審判 (英雄模式)"
Inst74Quest2_Level = "80"
Inst74Quest2_Attain = "80"
Inst74Quest2_Aim = "卡薩斯，位於龍骨荒野的龍眠神殿頂端，要你帶著魔法之心回去。"
Inst74Quest2_Location = "卡薩斯（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）"
Inst74Quest2_Note = "在瑪里苟斯死後，你可以在紅龍女王雅立史卓莎的禮物旁發現懸掛於天空中的魔法之心。此任務必須在英雄難度的25人永恆之眼中完成。"
Inst74Quest2_Prequest = "聚源虹膜英雄之鑰（"..YELLOW.."納克薩瑪斯"..WHITE.."）"
Inst74Quest2_Folgequest = "無"
Inst74Quest2PreQuest = "true"
--
Inst74Quest2name1 = "龍眠力量項鍊"
Inst74Quest2name2 = "生命守護者墜盒"
Inst74Quest2name3 = "龍后恩典"
Inst74Quest2name4 = "奧核戰爭勇士珠串"

--Quest 3 Alliance
Inst74Quest3 = "3. 瑪里苟斯必須死! (每週團隊任務)"
Inst74Quest3_Level = "80"
Inst74Quest3_Attain = "80"
Inst74Quest3_Aim = "殺死瑪里苟斯。"
Inst74Quest3_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst74Quest3_Note = "瑪里苟斯在"..YELLOW.." [1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst74Quest3_Prequest = "無"
Inst74Quest3_Folgequest = "無"
--
Inst74Quest3name1 = "冰霜紋章"
Inst74Quest3name2 = "凱旋紋章"


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

Inst75Story = "阿茲歐-奈幽是一座廣大的地下洞穴城堡，也是奈幽蟲族的大本營，坐落於附蓋冰雪的龍骨荒野。阿茲歐-奈幽可以分為兩區：古王國和地上王國，在阿茲歐-奈幽的許多深穴都由『忘卻者』所擁有。\n\n阿茲歐-奈幽：這個地上王國非常神秘，仍待玩家的探索，它曾經是個非常強大以及古老的文明，至今仍然有許多未被發掘的珍寶沉睡於此。這些在地底深處且數量龐大的珍寶不僅僅是寶石以及魔法物品，還包含了藝術、文學和文書捲軸。大量的天譴力量蔓延於此，蠢蠢欲動的忘卻者正熱切地期盼著回到世界上的一天。\n\n"..GREEN.."引述自WoWWiki"
Inst75Caption = "阿茲歐-奈幽"
Inst75QAA = "2 個任務"
Inst75QAH = "2 個任務"
Inst75General = {
    {
    "『守門者』齊力克西爾",
    "王前方會有3隻有名字的小王，擊殺的順序並不重要，一定要將甲蟲群控或者馬上殺死，以免對隊友造成相當程度的傷害。一旦三隻小王都擊殺之後，無論你們準備好了沒，王都會自行走向你的小隊或者靠近。將王拉到房間的中間，小隊試著盡量站在一起；王所招喚的甲蟲會從牆壁出現並朝著團隊前進，甲蟲的血量非常低，很容易就可以殺掉。王會隨著時間對小隊成員施放疲勞詛咒，會降低移動速度、攻速、施法速度且造成暗影傷害，可以被驅除。當血量到達20%時，王會狂怒增加攻速；持續的對王進行集火並且殺死所有出現的甲蟲。",
    RED .. "精神鞭笞：" .. WHITE .. "對敵人造成暗影傷害，並降低其移動速度，持續3秒。\n" .. RED .. "狂亂：" .. WHITE .. "使施法者的攻擊速度提高50%，造成的物理傷害提高100%，持續10分鐘。\n" .. RED .. "疲勞詛咒：" .. WHITE .. "使目標5碼範圍內的敵人受到詛咒，造成2828至3172點暗影傷害，移動速度降低30%，攻擊速度降低30%，施法速度降低30%，持續10秒。\n" .. RED .. "召喚甲蟲：" .. WHITE .. "召喚一堆甲蟲。",
    },

    {
    "哈卓諾克斯",
    "打二王最重要的就是儘快地解除隊員受到的吸血毒液效果，要是沒人會解中毒的話，就會拉長戰鬥時間。再躲一下它的毒雲，最後殺掉它。",
    RED .. "吸血毒液：" .. WHITE .. "每秒從周遭的敵人身上吸取500點生命力，轉移給施法者。如果任何目標在被影響的時候死亡，施法者將恢復10%生命力，持續10秒。\n" .. RED .. "酸性之雲：" .. WHITE .. "對目標所在處噴灑酸液，製造出的氣體對範圍內的敵人每秒造成707至793點自然傷害，持續90秒。\n" .. RED .. "刺穿護甲：" .. WHITE .. "降低敵人的護甲值50%，持續8秒。\n" .. RED .. "縛網：" .. WHITE .. "射出黏糊糊的蛛網，黏住敵人並造成2357至2643點傷害，同時將其拉向施法者。",
    },

    {
    "阿努巴拉克",
    "坦克拉王使王正面遠離隊員，離開猛擊的15碼範圍（會造成1萬以上的傷害）；在蝗蟲群開始前，治療者需保持對友滿血量。在一段時間之後，王會鑽進地板並消失，天上的小怪將會飛下來，其他會從地下鑽出或者下水道，儘量將它們拉住，在王回來前殺死。當他死亡後，你將會注意到遺骸從地板上升，之後馬上會對它們穿刺，所有的隊員要注意離開他們，避免受到3千的傷害並擊向空中。一但王回到地面，依然要讓王的正面遠離隊員15碼；他會再次鑽到地下，坦記得要把戰鬥中亂入的小兵拉住殺掉。王在地面上時會招換食腐甲蟲，甲蟲的血量很低且可以馬上被殺死，坦克要注意將王的正面遠離其他近戰職業。",
    RED .. "食腐甲蟲：" .. WHITE .. "每秒召喚2隻食腐甲蟲，持續4秒。\n" .. RED .. "蝗蟲風暴：" .. WHITE .. "製造一團蝗蟲風暴保護施法者。這些蝗蟲每秒對60碼範圍內的所有敵人造成330至370點自然傷害，持續15秒。\n" .. RED .. "刺穿：" .. WHITE .. "從地面射出尖刺，刺穿4碼範圍內的所有目標，造成2828至3172點傷害並將其擊飛至空中。此攻擊無視護甲值。\n" .. RED .. "猛擊：" .. WHITE .. "高舉雙手並猛擊地面，對施法者面前15碼範圍內的所有敵人造成9425至10575點傷害，並將其擊倒至地面上，持續6秒。",
    },
};

--Quest 1 Alliance
Inst75Quest1 = "1. 別忘了那些蛋!"
Inst75Quest1_Level = "74"
Inst75Quest1_Attain = "72"
Inst75Quest1_Aim = "那金之淵裡的『排除者』齊力克斯，要你進入阿茲歐-奈幽並摧毀6個奈幽天譴蛋。"
Inst75Quest1_Location = "『排除者』齊力克斯（龍骨荒野 - 阿茲歐-奈幽; "..YELLOW.."26.1, 50.0"..WHITE.."）"
Inst75Quest1_Note = "奈幽天譴蛋在一王『守門者』齊力克西爾"..YELLOW.."[1]"..WHITE.."的房間裡。"
Inst75Quest1_Prequest = "無"
Inst75Quest1_Folgequest = "無"
--
Inst75Quest1name1 = "除名護手"
Inst75Quest1name2 = "淨化手甲"
Inst75Quest1name3 = "災禍鎮壓裹帶"
Inst75Quest1name4 = "懲罰驅逐手套"

--Quest 2 Alliance
Inst75Quest2 = "2. 狙殺逆王"
Inst75Quest2_Level = "74"
Inst75Quest2_Attain = "72"
Inst75Quest2_Aim = "那金之淵裡的『排除者』齊力克斯交付給你一個任務，要你擊敗阿茲歐-奈幽的阿努巴拉克。然後將阿努巴拉克的裂殼帶回給齊力克斯。"
Inst75Quest2_Location = "『排除者』齊力克斯（龍骨荒野 - 阿茲歐-奈幽; "..YELLOW.."26.1, 50.0"..WHITE.."）"
Inst75Quest2_Note = "阿努巴拉克在"..YELLOW.."[3]"..WHITE.."。"
Inst75Quest2_Prequest = "無"
Inst75Quest2_Folgequest = "無"
--
Inst75Quest2name1 = "齊力克斯的絲質軟靴"
Inst75Quest2name2 = "索托大爺的長靴"
Inst75Quest2name3 = "碎殼脛甲"
Inst75Quest2name4 = "叛徒護脛"


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

Inst76Story = "阿茲歐-奈幽是一座廣大的地下洞穴城堡，也是奈幽蟲族的大本營，坐落於附蓋冰雪的龍骨荒野。阿茲歐-奈幽可以分為兩區：古王國和地上王國，在阿茲歐-奈幽的許多深穴都由『忘卻者』所擁有。\n\n安卡罕特：古王國是第二個被奈幽蟲族所控制的王國，位於阿茲歐-奈幽旁。\n\n"..GREEN.."引述自WoWWiki"
Inst76Caption = "安卡罕特：古王國"
Inst76QAA = "3 個任務"
Inst76QAH = "3 個任務"
Inst76General = {
    {
    "老那杜斯",
    "雖然王會的招式很少，但最難的部份卻是它會持續地從房間內的那些蟲蛋召喚出怪來幫打。開場後，起初是幾隻的非精英小蟲：安卡哈蟲群，可以很容易用範圍攻擊招式就清掉。約幾波之後（4至5波不一定，每波間隔約5秒上下），就會叫精英怪：安卡哈守護者出來（畫面會有警告），而此時安卡哈蟲群和王將免疫任何傷害，直到守護者死後才回復原狀，所以當王召精英怪後，務必優先擊殺它，再來才是小蟲（免得去打擾補職）和王。",
    RED .. "孵育瘟疫：" .. WHITE .. "使敵人染上瘟疫，在30秒內受到總計12750點自然傷害。\n" .. RED .. "孵育之怒：" .. WHITE .. "激怒蟲群，使其體型增大並且造成的傷害提高。",
    },

    {
    "泰爾達朗王子",
    "開打後各自散開以避開裂焰之球的傷害，不過有時它會製造裂焰之球、消失、吸血鬼之擁的連續技，所以玩家應該要在王施放吸血鬼之擁時，儘快地對王造成一定量的傷害以打斷它。整場戰鬥就大約是重複上述的過程。",
    RED .. "製造裂焰之球：" .. WHITE .. "製造一顆純淨火焰之球，朝著18碼內身上帶有灼燒光環的敵人目標飄去。\n" .. RED .. "消失：" .. WHITE .. "使施法者進入潛行狀態，持續2.5秒。\n" .. RED .. "吸血鬼之擁：" .. WHITE .. "消耗目標的生命能量，使其昏迷並每2秒造成1500點暗影傷害，持續20秒，或者持續直到泰爾達朗王子承受20,000點傷害為止。\n" .. RED .. "嗜血：" .. WHITE .. "立即攻擊目標，對其造成120%的普通武器傷害。另外，你接下來3次成功的近戰攻擊每次都會令你恢復1%生命力。此效果可持續10秒。",
    },

    {
    "潔杜佳．尋影者",
    "清完王前面的小兵群後便會自動進入頭目戰，此時王會從空中降下來並叫一堆暮光志願者圍在場邊，無法被點選，但也不會打你們。大約每隔25%的血量會浮到空中，並在腳下有一魔法陣，此時原本在場邊的暮光志願者就會起身並可被點選，慢慢往魔法陣移動。一旦真的達到魔法陣中央時，王就會吸取他們的力量並得到名為信使的禮物的增益效果（增加施法者的傷害 200%，持續 20秒），所以每個人除了一開打就都站在平台上外，但也需要散開一點以讓至少一位輸出職業能在發現是哪一個暮光志願者起身移動的同時，就能馬上對他作攻擊，當然其他人也要能儘快地過去幫殺。暮光志願者在往魔法陣走的時候，免疫任何控場、緩速、昏迷等技能。剩下的就是看到地上有雷霆震擊的雷雲就馬上躲開。",
    RED .. "颶風打擊：" .. WHITE .. "對附近所有敵人使用旋轉式的攻擊，造成武器傷害加上150%傷害並且震退他們。\n" .. RED .. "閃電箭：" .. WHITE .. "以閃電魔法衝擊敵人，對其造成自然傷害。\n" .. RED .. "雷霆震擊：" .. WHITE .. "召喚一朵持續10秒的雷雲，對指定區域中的所有敵人造成1575至2025點自然傷害，並每2秒造成1575至2025點額外傷害。",
    },
        
    {
    "信使沃菈齊",
    "這王最特殊的地方就是當它施展瘋狂後，除了你自己外，會看到每個隊友各自都轉為敵對的影子，血量約4千（英雄約1萬），影子會用的法術相對映到原玩家的職業與天賦；所以先把會補的影子殺掉是最好的，但隊伍中的補職玩家面對那些影子則就先求自保了。自己所屬的4個影子先殺掉之後，就可以去幫忙還沒把影子清掉的隊友，直到總共為4x5人=20個影子都打掉，才能回來打王。重複打王與打隊友影子的過程到結束。",
    RED .. "瘋狂：" .. WHITE .. "5秒施法。\n" .. RED .. "瘋狂引導視覺效果：" .. WHITE .. "創造影子。\n" .. RED .. "精神鞭笞：" .. WHITE .. "對敵人造成暗影傷害，並降低其移動速度，持續3秒。\n" .. RED .. "暗影箭雨：" .. WHITE .. "向附近的敵人射出多支暗影箭，對他們造成暗影傷害。\n" .. RED .. "碎顫：" .. WHITE .. "受到傷害時造成1414至1586點暗影傷害。會跳至鄰近的團隊成員身上。",
    },
    
    {
    "毒蕈魔（英雄模式）",
    "戰鬥開始後，地面會冒出許多蘑菇來，分成兩種：一種會爆炸讓你受到一個防禦-500的減益效果，導致於王會一直對你產生暴擊；另一種好的蘑菇就是讓你可以去打它，以解除上面說的減益效果，甚至增加傷害100%。",
    RED .. "迷你化：" .. WHITE .. "降低周圍敵人造成的傷害75%，並降低防禦技能500點。\n" .. RED .. "毒箭雨：" .. WHITE .. "對敵人射出毒液，造成自然傷害。\n" .. RED .. "重擊：" .. WHITE .. "對敵人造成普通攻擊再加上4163至4837點傷害，並將其擊退。\n" .. RED .. "糾纏根鬚：" .. WHITE .. "用根鬚將敵人纏住，每2秒對其造成一次自然傷害，並使其無法移動，最多持續10秒。",
    },
};

--Quest 1 Alliance
Inst76Quest1 = "1. 好時光的一切 (英雄每日)"
Inst76Quest1_Level = "80"
Inst76Quest1_Attain = "80"
Inst76Quest1_Aim = "那金之淵裡的『排除者』齊力克斯要求你，帶回一具安卡哈看守者的屍體，安放在安卡罕特的安卡罕特火盆上。"
Inst76Quest1_Location = "『排除者』齊力克斯（龍骨荒野 - 阿茲歐-奈幽; "..YELLOW.."26.1, 50.0"..WHITE.."）"
Inst76Quest1_Note = "這個任務只能在英雄難度下完成。\n\n看守者的屍體掉落自地城門口的安卡哈看守者（只有兩隻），屍體只能存在於背包內一小時，所以你必須在拾取屍體後的一個小時內完成這個任務；當你在任務完成前活著離開地城，則屍體也會從你的背包中消失。安卡罕特火盆在信使沃菈齊的後面"..YELLOW.."[6]"..WHITE.."。"
Inst76Quest1_Prequest = "無"
Inst76Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst76Quest2 = "2. 惡臭磨菇"
Inst76Quest2_Level = "76"
Inst76Quest2_Attain = "73"
Inst76Quest2_Aim = "你必須在安卡罕特的蠻穴野獸身上，採集6朵怪誕菌菇，並送去給那金之淵裡的『排除者』齊力克斯。"
Inst76Quest2_Location = "軟泥怪覆蕈（掉落自安卡罕特：古王國裡的蠻穴野獸）"
Inst76Quest2_Note = "掉落任務物品的蠻穴野獸在毒蕈魔"..YELLOW.."[3]"..WHITE.."的周邊區域。\n\n『排除者』齊力克斯在（龍骨荒野 - 阿茲歐-奈幽; "..YELLOW.."26.1, 50.0"..WHITE.."）。"
Inst76Quest2_Prequest = "無"
Inst76Quest2_Folgequest = "無"
-- No Rewards for this quest

--Quest 3 Alliance
Inst76Quest3 = "3. 忘卻者"
Inst76Quest3_Level = "76"
Inst76Quest3_Attain = "73"
Inst76Quest3_Aim = "那金之淵裡的『排除者』齊力克斯要求你，在安卡罕特殺掉信使沃菈齊及其身邊的3個忘卻者。"
Inst76Quest3_Location = "『排除者』齊力克斯（龍骨荒野 - 阿茲歐-奈幽; "..YELLOW.."26.1, 50.0"..WHITE.."）"
Inst76Quest3_Note = "忘卻者和信使沃菈齊可以在"..YELLOW.."[5]"..WHITE.."找到。"
Inst76Quest3_Prequest = "無"
Inst76Quest3_Folgequest = "無"
--
Inst76Quest3name1 = "邪惡阻撓披肩"
Inst76Quest3name2 = "嫌惡肩墊"
Inst76Quest3name3 = "廢止重肩甲"
Inst76Quest3name4 = "無面者肩冑"


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

Inst77Story = "奧杜亞是一個座落在北方風暴群山的地城群，需要飛行坐騎才能進入，裡面充滿了泰坦遺跡以及他們所遺留下來的珍寶。奧杜亞是一個由冰和石頭所建構而成的神秘地下王國，現在由風暴巨人和他們的爪牙-結晶石巨人所支配。因此奧杜亞的入口非常隱蔽，只有聰明的人才能偷偷溜進去。那些巨人們正積極且不顧一切地避開他們將死的命運，因此他們選擇躲藏而不是與天譴軍團戰鬥。\n\n石之大廳是一個大型五人地城，也是奧杜亞裡第一個能接觸到泰坦城市的地城。\n\n"..GREEN.."引述自WoWWiki"
Inst77Caption = "奧杜亞：石之大廳"
Inst77QAA = "1 個任務"
Inst77QAH = "1 個任務"
Inst77General = {
    {
    "悲嘆少女",
    "開場後，每人都需要注意地上會突然冒出的大黑洞悲痛暴風，尤其是坦，因為場上有時會有2個大黑洞在，要注意把王拉到正確的空地去。另一個重點就是補職也要留意王何時會唱哀傷震擊，（長達4秒的施法時間，應該不難發現）就可以算好她唱法的時間之內，建議跑去旁邊的黑洞受到傷害，而免得在原地不能動、不能對隊友做治療達10秒之久。",
    RED .. "悲痛暴風：" .. WHITE .. "製造一場暗影風暴，對所有指定範圍內的敵人造成1665至1935點暗影傷害，並且每1秒造成602至698點額外傷害，持續20秒。\n" .. RED .. "哀傷震擊：" .. WHITE .. "立即震擊目標，造成1750至2250點暗影傷害並使附近所有敵方目標進入冥想狀態，癱瘓6秒。受到傷害時效果即會解除。\n" .. RED .. "哀痛之柱：" .. WHITE .. "以暗影能量衝擊敵人，並且每2秒造成額外的暗影傷害，持續10秒。\n" .. RED .. "分離哀傷：" .. WHITE .. "向敵人射出可抽取法力的箭，每抽取1點法力，目標就受到1點傷害。",
    },

    {
    "克利斯托魯斯",
    "基本上就坦拉住王後，每個隊友互相離遠一點（至少5碼以上）打王；一旦被王打往後飛，就注意與各隊友間的距離走回原來位置繼續殺王，不要被彼此的碎片打傷就好。",
    RED .. "巨礫丟擲：" .. WHITE .. "向敵人投擲石塊，造成物理傷害。\n" .. RED .. "粉碎：" .. WHITE .. "粉碎所有被石化的敵人，對其盟友依距離的遠近來造成傷害。\n" .. RED .. "踐踏：" .. WHITE .. "重踏地板，對周圍的敵人造成2375至2625點物理傷害。",
    },

    {
    "歲月議庭（布萊恩．銅鬚護送事件）",
    "護送布萊恩．銅鬚到最後面的一個圓形像太空的房間內後，房間牆壁的面具就會被啟動，而戰鬥隨NPC的喊叫分成三階段。",
    BLUE .. "第一階段" .. WHITE .. "：\n牆上的第一個面具會開始在整場戰鬥中，每3秒隨機攻擊一個隊友，造成約500的奧術傷害；同時在此階段約每45秒就有一波由2隻近戰、1隻法系的精英怪物群從入口出來，坦就在入口等怪出較好。\n" .. BLUE .. "第二階段" .. WHITE .. "：\n第一個面具持續對隊伍造成傷害，第二個面具啟動，會持續對有人站的地方丟像一個黑色氣團，任何隊員被打到時，會短暫受到一個增加所受傷害50%的減益效果；且每波出怪頻率加快為每30秒，改為2隻近戰精英、2隻法系非精英怪的組成。\n" .. BLUE .. "第三階段" .. WHITE .. "：\n第三個面具開始對地上隨機一個位置持續噴出火焰，對其周圍10碼內的敵人造成最初每秒500的傷害，並隨著時間增加其每秒傷害，所以盡快地閃開它。出怪頻率上升至每15秒一波，並改為1隻石像怪、3隻近戰精英的組成外，2隻法系非精英怪也會穿插其中。此時隊伍的存活為第一目標，殺怪其次，能對怪物做控場就做，以撐到整場戰鬥結束。最後NPC會再叫最後一次，而三個面具會把場上所有還活著的怪物給瞬殺而結束戰鬥。",
    },
    
    {
    "『塑鐵者』斯雍尼爾",
    "分散站位。盡量減少閃電鏈、閃電之環、靜電充能的傷害。在戰鬥開始以後，從王的兩邊走廊會有很多小怪不停跑進來，所以在擊殺王的同時，別忘記了把小怪擊殺，以免給治療者帶來麻煩。在王的血量到50%以下的時候，王開始召喚軟泥怪，軟泥怪本身並無傷害，但是如果2個軟泥怪走到王檯子中間合二為一，並開始攻及時將會很麻煩，所以盡量在軟泥怪合體前將它們擊殺吧。分散站位、及時擊殺小怪，能做到這2點，這個王難度不高。",
    RED .. "閃電鏈：" .. WHITE .. "向敵人射出一支閃電箭，這支閃電箭會在命中目標後繼續攻擊它周圍最近的敵人。最多可攻擊3個目標，對每一個成功命中的目標造成更大的自然傷害。\n" .. RED .. "閃電環：" .. WHITE .. "對周圍敵人造成943至1057點自然傷害，並使其受到的自然傷害提高10%，持續10秒。\n" .. RED .. "閃電之盾：" .. WHITE .. "10顆閃電球環繞著施法者，有50%的機率對近戰或遠程攻擊者造成1000點傷害。每次閃電之盾發動攻擊都會消耗一顆閃電球。因此，閃電之盾最多可維持10分鐘，或者在攻擊10次後消失。\n" .. RED .. "靜電能量：" .. WHITE .. "使目標身上充滿靜電能量，週期性的電擊附近的盟友，造成1000點自然傷害，持續10秒。\n" .. RED .. "狂亂：" .. WHITE .. "使施法者的攻擊速度提高50%，造成的物理傷害提高100%，持續10分鐘。",
    },
};

--Quest 1 Alliance
Inst77Quest1 = "1. 岩石大廳"
Inst77Quest1_Level = "78"
Inst77Quest1_Attain = "76"
Inst77Quest1_Aim = "布萊恩．銅鬚要求你和他一道尋找石之大廳裡的秘密。"
Inst77Quest1_Location = "布萊恩．銅鬚（奧杜亞：石之大廳; "..YELLOW.."[3]"..WHITE.."）"
Inst77Quest1_Note = "為了完成這個任務，你必須跟隨布萊恩．銅鬚進入"..YELLOW.."[4]"..WHITE.."的房間之內，並且在敵人一波波的攻勢下保護他直到他完成石板的調查工作。當他完成之後，位於石板旁的庭議之箱便能被打開。\n\n再次與布萊恩．銅鬚對話，他將會跑到"..YELLOW.."[5]"..WHITE.."的門外，你不需要跟隨他，他將會在那邊等你。當你打敗『塑鐵者』斯雍尼爾之後，任務便能完成，你也可以向布萊恩．銅鬚回覆任務。"
Inst77Quest1_Prequest = "無"
Inst77Quest1_Folgequest = "無"
--
Inst77Quest1name1 = "無畏探險者披肩"
Inst77Quest1name2 = "冒險者肩墊"
Inst77Quest1name3 = "失落秘密肩甲"
Inst77Quest1name4 = "勘查肩鎧"


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

Inst78Story = "奧杜亞是一個座落在北方風暴群山的地城群，需要飛行坐騎才能進入，裡面充滿了泰坦遺跡以及他們所遺留下來的珍寶。奧杜亞是一個由冰和石頭所建構而成的神秘地下王國，現在由風暴巨人和他們的爪牙-結晶石巨人所支配。因此奧杜亞的入口非常隱蔽，只有聰明的人才能偷偷溜進去。那些巨人們正積極且不顧一切地避開他們將死的命運，因此他們選擇躲藏而不是與天譴軍團戰鬥。\n\n雷光大廳是奧杜亞裡第二個能接觸到泰坦城市且較高等的5人地城。\n\n"..GREEN.."引述自WoWWiki"
Inst78Caption = "奧杜亞：雷光大廳"
Inst78QAA = "2 個任務"
Inst78QAH = "2 個任務"
Inst78General = {
    {
    "畢亞格林將軍",
    "這王會在入口前方的平台之間巡邏，等他走到別個平台後再拉原平台的小兵過來打，清掉小兵場地安全後就等著王過來。一王被設計成類似一位戰士，能切換各戰鬥姿態。其中狂暴姿態的時候，能在鎧甲坦上打出1萬2至1萬3的傷害，需注意。此外小心王的旋風斬，坦要把王拉離近戰的隊員，並且補要先顧好坦的血量。剩下的就是要注意王身旁小兵弧形焊結（對弧形焊結連接的目標造成自然傷害。傷害隨距離而提高），所以受到此攻擊的隊員要互相靠近以減低其傷害 與王也會把人給擊倒。",
    RED .. "旋風斬：" .. WHITE .. "像旋風一般揮舞手中的武器，每次旋轉造成75%普通攻擊傷害，持續8秒。\n" .. RED .. "順劈斬：" .. WHITE .. "對敵人和其身邊最近的一個盟友造成110%普通近戰傷害，最多影響3個目標。\n" .. RED .. "致死打擊：" .. WHITE .. "對目標造成300%的武器傷害並使其受傷，任何對其使用的治療技能效果降低50%，持續5秒。\n" .. RED .. "擊退：" .. WHITE .. "對周圍的敵人造成20%普通攻擊傷害，並將其擊退。\n" .. RED .. "拳擊：" .. WHITE .. "擊打敵人，對其造成15點傷害，並且使其在5秒內不能施放該法術。\n" .. RED .. "法術反射：" .. WHITE .. "將下一發擊中你的法術反射給施法者。\n" .. RED .. "猛擊：" .. WHITE .. "猛擊對手，造成120%武器傷害。\n" .. RED .. "攔截：" .. WHITE .. "向敵人衝鋒，造成65點傷害，並使其昏迷3秒。\n" .. RED .. "充電：" .. WHITE .. "對目標充電。",
    },

    {
    "渥克瀚",
    "他是一個巨人族鐵匠，戰鬥中他會衝到旁邊的鐵砧旁邊，然後敲出兩個石巨像，這些石巨像其實並不強，但是他會去騷擾治療者，請務必優先處理掉，當場上有太多石巨像的時候，渥克瀚會一口氣引爆他們，傷害相當的高。",
    RED .. "鍛鍊：" .. WHITE .. "擊中渥克瀚的鐵砧，製造一些熔岩魔像。\n" .. RED .. "破碎踐踏：" .. WHITE .. "對所有敵人造成2313至2687點傷害，並粉碎99碼範圍內的所有易碎的魔像。\n" .. RED .. "激化：" .. WHITE .. "激化熔岩魔像，使其生命力提高20%。",
    },

    {
    "埃歐納",
    "埃歐納是個元素型的頭目，外觀就像寒冰元素一樣，這個王有兩個階段，第一階段他會維持他的外觀，然後正常的輸出跟使用技能，這個階段並沒有多困難，不過打到一半他會切換到第二階段，這時候埃歐納的身體會整個消失，分散成許多的電球，這些電球會隨機追著目標，一但靠近他就會受到傷害，所以如果進了第二階段，所有人就是跑。",
    RED .. "閃電球：" .. WHITE .. "向目標投擲一顆閃電球，造成2013至2587點自然傷害。\n" .. RED .. "散化：" .. WHITE .. "散化成埃歐納火花。\n" .. RED .. "靜電超載：" .. WHITE .. "使敵人充滿能量，在10秒內造成1249至1451點自然傷害並且週期性地對附近的盟友造成1249至1451點自然傷害。10秒後產生電荷爆炸，對8碼範圍內的所有敵人造成2313至2687點自然傷害，並將其擊退。",
    },
    
    {
    "洛肯",
    "跟一般的戰鬥不同的是，整個隊伍都要在王的旁邊進行戰鬥，並且同時會受到一個不很快的範圍傷害效果，（每次約800至1000傷害）補職就要注意於治療隊友、以及自身魔力消耗。然後在王施放閃電新星時，畫面會有警告，全隊都要記得跑開離王20碼外，否則會受到1萬至1萬3千的傷害。洛肯打在鎧甲職上的傷害約在3千至5千。",
    RED .. "弧狀閃電：" .. WHITE .. "震擊目標，立即造成3238至3762點自然傷害，且該目標有一定的機率震擊周圍的友方目標。\n" .. RED .. "閃電新星：" .. WHITE .. "釋放能量的衝擊波，對20碼範圍內的敵人造成6013至6987點自然傷害。\n" .. RED .. "脈動震擊波光環：" .. WHITE .. "受到的自然傷害提高25%，持續10秒。",
    },
};

--Quest 1 Alliance
Inst78Quest1 = "1. 不擇手段!"
Inst78Quest1_Level = "80"
Inst78Quest1_Attain = "80"
Inst78Quest1_Aim = "丹尼弗蘭的裘庫姆王要求你，進入雷光大廳並擊敗洛肯。帶回洛肯之舌給裘庫姆。"
Inst78Quest1_Location = "裘庫姆王（風暴群山 - 丹尼弗蘭; "..YELLOW.."65.3, 60.1"..WHITE.."）"
Inst78Quest1_Note = "洛肯在"..YELLOW.."[4]"..WHITE.."。\n\n必須在完成一連串來自格雷徹．嘶炫（風暴群山 - K3; "..YELLOW.."41.1, 86.1"..WHITE.."）的極長任務線之後才能接到這個任務。"
Inst78Quest1_Prequest = "他們把男人抓走了！→報應"
Inst78Quest1_Folgequest = "無"
Inst78Quest1PreQuest = "true"
--
Inst78Quest1name1 = "雷光長袍"
Inst78Quest1name2 = "硬化舌頭外套"
Inst78Quest1name3 = "雷光使者鍊衫"
Inst78Quest1name4 = "鋸齒岩石胸甲"

--Quest 2 Alliance
Inst78Quest2 = "2. 一山容不得二虎"
Inst78Quest2_Level = "80"
Inst78Quest2_Attain = "80"
Inst78Quest2_Aim = "丹尼弗蘭的裘庫姆王要求你，前往雷光大廳，並擊敗渥克瀚。"
Inst78Quest2_Location = "裘庫姆王（風暴群山 - 丹尼弗蘭; "..YELLOW.."65.3, 60.1"..WHITE.."）"
Inst78Quest2_Note = "渥克瀚在"..YELLOW.."[2]"..WHITE.."。\n\n必須在完成一連串來自格雷徹．嘶炫（風暴群山 - K3; "..YELLOW.."41.1, 86.1"..WHITE.."）的極長任務線之後才能接到這個任務。"
Inst78Quest2_Prequest = "他們把男人抓走了！→報應"
Inst78Quest2_Folgequest = "無"
Inst78Quest2PreQuest = "true"
--
Inst78Quest2name1 = "閃電灌注披肩"
Inst78Quest2name2 = "焦熱皮甲肩衛"
Inst78Quest2name3 = "風暴冶煉護肩"
Inst78Quest2name4 = "泯仇肩鎧"
Inst78Quest2name5 = "渥克瀚披肩"


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

Inst79Story = "無資訊"
Inst79Caption = "守護密室：黑曜聖所"
Inst79QAA = "1 個任務"
Inst79QAH = "1 個任務"

--Quest 1 Alliance
Inst79Quest1 = "1. 撒爾薩里安必須死! (每週團隊任務)"
Inst79Quest1_Level = "80"
Inst79Quest1_Attain = "80"
Inst79Quest1_Aim = "殺死撒爾薩里安。"
Inst79Quest1_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst79Quest1_Note = "撒爾薩里安在"..YELLOW.."[4]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst79Quest1_Prequest = "無"
Inst79Quest1_Folgequest = "無"
--
Inst79Quest1name1 = "冰霜紋章"
Inst79Quest1name2 = "凱旋紋章"


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

Inst80Story = "德拉克薩隆要塞座落在冰天雪地的諾森德中的灰白之丘西北方，也是古老的冰霜食人妖的大本營。天譴軍團將食人妖趕走並將德拉克薩隆據為己有，並且派了重兵把守著通過山的道路。這個奇怪的地城充滿著恐龍、爬蟲類動物以及不死生物。你將被要求進入其中，發掘為什麼食人妖們要離開他們的家園祖爾德拉克背後的秘密。\n\n"..GREEN.."引述自WoWWiki"
Inst80Caption = "德拉克薩隆要塞"
Inst80QAA = "3 個任務"
Inst80QAH = "3 個任務"
Inst80General = {
    {
    "血角食人妖",
    "王從一開始就會被其他小怪（德拉克瑞入侵者）不停地攻擊，而那些小怪基本上可以不用理會，不過近戰職業最好離他們屍體遠點，免得被屍爆炸到。（坦若看到王施法條出現，而屍體發綠，可以考慮把王拉到別邊去躲一下屍爆）最重要的是他的吞噬技能，使得戰鬥不能拖太久而導致王的攻擊傷害愈來愈強大。是個考驗隊伍極限輸出的王。",
    RED .. "吞噬：" .. WHITE .. "對50碼範圍內的敵人造成1885至2115點暗影傷害。每對一個敵人造成傷害可讓施法者造成的傷害提高2%。\n" .. RED .. "擊碎：" .. WHITE .. "擊碎目標，造成150%近戰傷害。\n" .. RED .. "感染之傷：" .. WHITE .. "使敵人受到物理攻擊時所承受的傷害提高15%，持續10秒。\n" .. RED .. "屍體爆炸：" .. WHITE .. "寄生在附近的德拉克瑞入侵者屍體內，使其在數秒後爆炸，對5碼範圍內的敵人造成3770至4230點自然傷害。",
    },

    {
    "『召喚者』諾沃司",
    "當王被觸發進入戰鬥後，它周圍四個水晶將啟動保護罩，使王處於無法被攻擊狀態。破解這個保護罩的方法很簡單，每殺死一個水晶處理者，王周圍的水晶就會滅掉一顆，當殺死四個處理者後，王的保護罩就將解除。\n\n這是一場很平穩的戰鬥，躲好暴風雪，驅散職業注意驅散詛咒，王的傷害不高，治療到位的話基本上不會出現什麼危險狀況。在英雄難度下，該王戰對治療會造成一定的壓力，因為其法術攻擊和詛咒都是無視仇恨的，全員都在掉血的狀態，且要不停躲暴風雪。",
    RED .. "秘法衝擊：" .. WHITE .. "以秘法魔法衝擊敵人，將其擊退並造成普通攻擊再加上1749至1951點傷害。\n" .. RED .. "暴風雪：" .. WHITE .. "召喚持續6秒的暴風雪，對指定區域內的所有敵人每2秒造成1665至1935點冰霜傷害。\n" .. RED .. "苦難之怒：" .. WHITE .. "每2秒造成暗影傷害，持續8秒。\n" .. RED .. "秘法力場：" .. WHITE .. "一座秘法力場圍繞著施法者，對敵人造成秘法傷害並降低50%移動速度。\n" .. RED .. "寒冰箭：" .. WHITE .. "對敵人造成冰霜傷害，並使其移動速度降低，持續4秒。\n" .. RED .. "召喚爪牙：" .. WHITE .. "召喚一支由惡臭的食人妖屍體組成的大軍來協助施法者。",
    },

    {
    "崔德王",
    "很明顯，這是對坦克裝備和治療的一次小小考驗。戰鬥中，會有戰鬥提示：崔德王陰險地舉起它的爪子，然後就是穿刺+裂傷+流血+恐懼一套連招，這個時候是最為危險的時候，坦克和治療這個時候都要集中注意，確保坦克的存活。普通模式下一般不會造成致命的後果，但是在英雄模式中，一套連招很容易導致坦克的倒下，有啥報名大招在這個時候都用了吧，反正後面也不需要什麼大招了。",
    RED .. "重創撕咬：" .. WHITE .. "一個猛烈的攻擊使目標出血直到被完全治癒為止。\n" .. RED .. "低沉咆哮：" .. WHITE .. "轟然咆哮恫嚇施法者35碼範圍內的所有敵人，使其恐懼4秒。\n" .. RED .. "畏怯咆哮：" .. WHITE .. "使周圍所有敵人造成的傷害降低125點，持續8秒。\n" .. RED .. "碎裂斬：" .. WHITE .. "砍殺敵人，造成125%武器傷害並使其受到的流血效果傷害提高75%。\n" .. RED .. "穿甲斬：" .. WHITE .. "砍殺敵人，造成125%武器傷害並使其護甲值降低75%。\n" .. RED .. "呼喚迅猛龍：" .. WHITE .. "呼喚周圍一隻迅猛龍協助崔德王。",
    },
    
    {
    "預言者薩隆杰",
    "在剛開戰的時候，王是骨頭形態，但是在75%、50%、25%血量的時候，他會高叫「你們的肉現在是我的了」，然後將所有人的肉吸走，變成一隻有肉的風蛇，而玩家就變成了骷髏。變成了骷髏的玩家則有了新的技能列，除了嘲諷，其他技能都是CD到了就用，約莫十秒之後，將回到原始階段。大約重複兩次這樣的循環便可以擊殺王。",
    RED .. "生命詛咒：" .. WHITE .. "9秒內造成暗影傷害。此效果將在目標的生命力低於生命力上限的50%後移除。\n" .. RED .. "眼稜：" .. WHITE .. "薩隆杰凝視著目標，每2秒造成1040至1160點自然傷害。\n" .. RED .. "閃電吐息：" .. WHITE .. "向目標吐息閃電，造成自然傷害。\n" .. RED .. "毒雲術：" .. WHITE .. "每1秒對附近的敵人造成602至698點自然傷害。持續10秒。\n" .. RED .. "血肉凋零：" .. WHITE .. "燃燒一名敵人，移除目標身上的血肉。\n" .. RED .. "歸還血肉：" .. WHITE .. "將血肉歸還給目標。\n" .. RED .. "火焰之雨：" .. WHITE .. "召喚火焰之雨，對指定區域中的敵人每2秒造成1850至2150點火焰傷害，持續6秒。\n" .. RED .. "暗影箭雨：" .. WHITE .. "向附近的敵人射出多支暗影箭，對他們造成暗影傷害。",
    },
};

--Quest 1 Alliance
Inst80Quest1 = "1. 淨化德拉克薩隆"
Inst80Quest1_Level = "75"
Inst80Quest1_Attain = "73"
Inst80Quest1_Aim = "德拉庫魯需要你在德拉克薩隆的火盆上使用德拉庫魯的藥劑。你需要五個耐久魔精才能使用德拉庫魯的藥劑。"
Inst80Quest1_Location = "德拉庫魯的影像"
Inst80Quest1_Note = "德拉克薩隆的火盆在預言者薩隆杰的後面"..YELLOW.."[6]"..WHITE.."，耐久魔精由德拉克薩隆要塞裡的小怪掉落。"
Inst80Quest1_Prequest = "休戰？→自塵土而來的聲音"
Inst80Quest1_Folgequest = "無"
Inst80Quest1PreQuest = "true"
--
Inst80Quest1name1 = "誘惑綸巾"
Inst80Quest1name2 = "誘人脛甲"
Inst80Quest1name3 = "黑暗低語鐐銬"
Inst80Quest1name4 = "引誘者護肩"

--Quest 2 Alliance
Inst80Quest2 = "2. 搜救行動"
Inst80Quest2_Level = "74"
Inst80Quest2_Attain = "73"
Inst80Quest2_Aim = "花崗岩之泉的麥客要你進入德拉克薩隆，找出庫賽爾發生了什麼事。"
Inst80Quest2_Location = "麥客．菲爾森（灰白之丘 - 花崗岩之泉; "..YELLOW.."16.6, 48.1"..WHITE.."）"
Inst80Quest2_Note = "庫賽爾被綁在蜘蛛區"..YELLOW.."[2]"..WHITE.."中眾多繭裡的其中一個，你必須一一打破蜘蛛繭直到看到她為止。"
Inst80Quest2_Prequest = "燒焦的天譴軍"
Inst80Quest2_Folgequest = "鬥智遊戲"
Inst80Quest2PreQuest = "true"
--
Inst80Quest2name1 = "庫賽爾之憂"
Inst80Quest2name2 = "庫賽爾之怒"
Inst80Quest2name3 = "庫賽爾的戰爭指環"

--Quest 3 Alliance
Inst80Quest3 = "3. 鬥智遊戲"
Inst80Quest3_Level = "74"
Inst80Quest3_Attain = "73"
Inst80Quest3_Aim = "庫賽爾要你對『召喚者』諾沃司的屍體使用庫賽爾的短衫碎片，然後將腐液玷污的布料帶去給麥客。"
Inst80Quest3_Location = "庫賽爾（德拉克薩隆要塞; "..YELLOW.."[2]"..WHITE.."）"
Inst80Quest3_Note = "『召喚者』諾沃司在"..YELLOW.."[3]"..WHITE.."。麥客．菲爾森在（灰白之丘 - 花崗岩之泉; "..YELLOW.."16.6, 48.1"..WHITE.."）"
Inst80Quest3_Prequest = "搜救行動"
Inst80Quest3_Folgequest = "無"
Inst80Quest3FQuest = "true"
--
Inst80Quest3name1 = "可恥腕輪"
Inst80Quest3name2 = "輕蔑指環"
Inst80Quest3name3 = "控訴腕甲"
Inst80Quest3name4 = "否認護腕"


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

Inst81Story = "剛德拉克是冰霜食人妖的首都，座落於祖爾德拉克，這個地城有三個都能通往主要核心的入口。德拉克瑞食人妖在此統治著祖爾德拉克，時常與有著強大力量的天譴軍團發生戰爭。在這座地城裡可以發現冰霜食人妖的光榮與驕傲，也有了與冰霜食人妖的領袖一較高下的機會，也教導了我們為何冰霜食人妖可以這麼成功的對抗天譴軍團。\n\n"..GREEN.."引述自WoWWiki"
Inst81Caption = "剛德拉克"
Inst81QAA = "3 個任務"
Inst81QAH = "3 個任務"
Inst81General = {
    {
    "史拉德銳",
    "在普通難度下，基本不會有太大危險，只要輸出職業注意清理小蛇，不讓小蛇干擾到治療即可。近戰除了坦以外，在王施放劇毒新星的時候要馬上跑開，以免加大治療壓力和解毒壓力。在英雄難度下，小蛇將成為滅團的最致命因素。英雄難度下的小蛇數量、血量和攻擊都大大提高，而且由於治療在全力治療坦，會獲得大部分小蛇的仇恨，所以最常見的滅團情況就是治療被小蛇攻擊，被纏繞，結果導致坦死亡。因此，在這裡需要有能夠群體傷害以及控制的職業存在進行控場和擊殺小蛇。",
    RED .. "劇毒新星：" .. WHITE .. "對附近的敵人造成2590至3010點自然傷害，接著每2秒額外造成1064至1236點傷害，持續16秒。\n" .. RED .. "強力撕咬：" .. WHITE .. "造成100%的普通攻擊傷害，並使敵人的護甲值降低20%，持續5秒。\n" .. RED .. "毒箭：" .. WHITE .. "對敵人造成自然傷害。\n" .. RED .. "召喚小蛇：" .. WHITE .. "召喚小蛇為王戰鬥。小蛇有2種，綠色的會捆人，紅色的則會造成毒性傷害。",
    },

    {
    "德拉克瑞巨像",
    "普通難度下，需要注意的就是毒元素的猛衝，整個隊伍站位不能過於分散，方便坦及時將毒元素拉回。另外由於毒液濺射的存在，會使整個隊伍都在掉血狀態，治療要注意全局治療，不過普通難度不會形成毒水，所以壓力並不大。\n\n英雄難度下，滅團的誘因也在毒元素上，毒元素的猛衝和濺射都將讓隊伍處於危險狀態。隊伍不能過於集中，最大限度降低毒水的傷害，而又不能過於分散，否則一個猛衝可能就會造成減員。每個玩家在被毒液濺射打中後要馬上移動，千萬不要站在毒水上，否則掉血極快。",
    RED .. "浮現：" .. WHITE .. "將剛才吸收進去的毒元素匯聚成一隻大的毒元素從王體內分離出來，在毒元素存在期間，王處於無敵狀態。\n" .. RED .. "全力一擊：" .. WHITE .. "對敵人造成175%武器傷害。\n" .. RED .. "浮現召喚：" .. WHITE .. "德拉克瑞元素從石巨像體內破體而出！",
    },

    {
    "慕拉比",
    "這個王是副本中最簡單的一個了，一場木樁戰，王的變形可以被打斷，因此盡量打斷吧。不過即使沒有打斷讓王變身成功，其傷害也只增加25%而已，其本身攻擊並不高，所以基本上沒有威脅。",
    RED .. "果決穿刺：" .. WHITE .. "穿刺一個敵人，使其受到物理傷害，並且使目標流血造成額外傷害，持續21秒。此攻擊無法被格擋、閃躲或招架。\n" .. RED .. "地面震動：" .. WHITE .. "地面劇烈地震動，對附近的敵人造成物理傷害。\n" .. RED .. "麻木咆哮：" .. WHITE .. "大聲的咆哮讓聽到的敵人心智麻木，降低施法速度50%，持續5秒\n" .. RED .. "變形：" .. WHITE .. "施法者變形為一隻強大的長毛象，增加物理傷害25%，免疫昏迷效果。\n" .. RED .. "魔精狂亂：" .. WHITE .. "依照受到的傷害總量提高施法速度。",
    },

    {
    "『兇猛』埃克（英雄模式）",
    "如果你在英雄模式下擊殺了慕拉比以後請不要急著跳下水衝向最後王，身後有一個暗門被打開了，暗門內就是隱藏王：『兇猛』埃克。這是一場考驗隊伍輸出的戰鬥，不過難度並不高，全團輸出達到5000以上的隊伍，可以輕鬆將其擊殺，所要注意的就是在埃克跳躍到一個玩家身邊的時候，仇恨會清空，該玩家要馬上跑離王，所有攻擊職業停止幾秒輸出，讓坦及時拉回。",
    RED .. "埃克狂暴：" .. WHITE .. "埃克狂暴化，其攻擊速度提高150%，且造成的所有傷害提高500%。\n" .. RED .. "埃克撕咬：" .. WHITE .. "埃克狠狠的咬下去，對敵人造成其普通傷害的150%。\n" .. RED .. "埃克噴吐：" .. WHITE .. "埃克對面前錐形範圍內的敵人噴吐有毒膽汁，每1秒造成2970點自然傷害，並吸取220點法力，持續3秒。\n" .. RED .. "埃克彈跳：" .. WHITE .. "埃克撲向一位遠方的目標，並且清空仇恨。",
    },
    
    {
    "蓋爾達拉",
    "人形態下的王並不具有太大威脅，只要不會被突襲+刺穿同時打到就不會有什麼生命危險，戰鬥危機一般出現在王變身狂暴後，攻擊力和攻擊速度都大大提升，坦的裝備如果不到位，治療會面臨較大壓力，如果這個時候治療被釘住，那麼就需要坦開技能自保了。不過總體來說，強度並不算太高。特別是坦比較硬的時候來打，還是很輕鬆的。",
    RED .. "奔竄：" .. WHITE .. "召喚一頭犀牛之靈對你的目標衝鋒，造成4713至5287點傷害，並將他們擊飛到空中。\n" .. RED .. "迴旋斬：" .. WHITE .. "對周圍敵人造成每秒5000的傷害，移動速度降低65%。\n" .. RED .. "變身：" .. WHITE .. "變身成為一隻犀牛，攻擊力大大提升，並具有一些新的技能。\n" .. RED .. "突刺：" .. WHITE .. "施法者的長矛突刺目標，忽視其護甲值並造成4713至5287點物理傷害。另外，目標將不斷流血，每3秒造成額外500點傷害，持續2分鐘。\n" .. RED .. "牛角釘刺（犀牛形態）：" .. WHITE .. "隨機把一個目標頂在自己的角上，被釘的目標無法行動，且會受到持續傷害，英雄難度下每秒2000左右。",
    },
};

--Quest 1 Alliance
Inst81Quest1 = "1. 為了後代子孫"
Inst81Quest1_Level = "78"
Inst81Quest1_Attain = "76"
Inst81Quest1_Aim = "杜布拉金的撰史者巴琪妮要你進入剛德拉克收集6個德拉克瑞歷史石板。"
Inst81Quest1_Location = "撰史者巴琪妮（祖爾德拉克 - 杜布拉金; "..YELLOW.."70.0, 20.9"..WHITE.."）"
Inst81Quest1_Note = "德拉克瑞歷史石板散落在地城各處，那裡有足夠的石板讓隊伍裡面的五個人都完成這個任務。前置任務[探班]並非必要的。"
Inst81Quest1_Prequest = "探班"
Inst81Quest1_Folgequest = "無"
Inst81Quest1PreQuest = "true"
--
Inst81Quest1name1 = "獅首戒指"
Inst81Quest1name2 = "腐惡魔精之戒"
Inst81Quest1name3 = "堅固白金指環"
Inst81Quest1name4 = "巫毒徽記"

--Quest 2 Alliance
Inst81Quest2 = "2. 蓋爾達拉必須付出代價"
Inst81Quest2_Level = "78"
Inst81Quest2_Attain = "76"
Inst81Quest2_Aim = "杜布拉金的托爾瑪要你到剛德拉克殺死蓋爾達拉。"
Inst81Quest2_Location = "托爾瑪（祖爾德拉克 - 杜布拉金; "..YELLOW.."69.9, 22.8"..WHITE.."）"
Inst81Quest2_Note = "蓋爾達拉在"..YELLOW.."[5]"..WHITE.."。"
Inst81Quest2_Prequest = "未完成的任務"
Inst81Quest2_Folgequest = "無"
Inst81Quest2PreQuest = "true"
--
Inst81Quest2name1 = "詭詐魔精束帶"
Inst81Quest2name2 = "奇怪巫毒腰帶"
Inst81Quest2name3 = "殞落帝國遊俠腰帶"
Inst81Quest2name4 = "逝亡半神扣環"

--Quest 3 Alliance
Inst81Quest3 = "3. 獨一無二"
Inst81Quest3_Level = "78"
Inst81Quest3_Attain = "76"
Inst81Quest3_Aim = "杜布拉金的撰史者巴琪妮要求你，進入剛德拉克，並撿回一塊德拉克瑞巨像的碎片。"
Inst81Quest3_Location = "撰史者巴琪妮（祖爾德拉克 - 杜布拉金; "..YELLOW.."70.0, 20.9"..WHITE.."）"
Inst81Quest3_Note = "目前無資訊"
Inst81Quest3_Prequest = "無"
Inst81Quest3_Folgequest = "無"
--
Inst81Quest3name1 = "毛皮內襯底鞋"
Inst81Quest3name2 = "犀牛獸皮及膝靴"
Inst81Quest3name3 = "殞落希望綴鱗長靴"
Inst81Quest3name4 = "多啾魔精鎧靴"
Inst81Quest3name5 = "食人妖之蹬靴"


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

Inst82Story = "紫羅蘭堡是在漂浮於天空的城市–達拉然底下的5人地城，祈倫托監獄守衛正努力抵擋著受命於瑪里苟斯而入侵的藍龍軍團，它們正使用魔法之門穿越紫羅蘭堡並且試著破壞出口以進入受魔法保護的達拉然。\n\n"..GREEN.."引述自WoWWiki"
Inst82Caption = "紫羅蘭堡"
Inst82QAA = "2 個任務"
Inst82QAH = "2 個任務"
Inst82General = {
    {
    "伊銳坎（阿拉卡烏鴉人）",
    "跟TBC時的時光之穴：黑暗沼澤（18波）很像的副本。三隻王的前面2隻，是從以下6個王中「隨機」挑2個出來。只有最後的王是固定的霞妮苟莎。",
    "伊銳坎攻略：這王會帶著2個護衛，盡量打斷它的治療鍊、消掉它們的嗜血術。先打死他2個護衛後，王會狂怒。英雄模式下，或許就先打死一隻護衛，留下一隻，再打王，最後才殺死留下的護衛。",
    RED .. "治療鍊：" .. WHITE .. "運用治療的能量為一個受傷的盟友恢復生命力，這股能量會繼續治療附近的其他盟友，最多影響3個目標。\n" .. RED .. "大地之盾：" .. WHITE .. "以大地護盾保護一個目標，使被保護者受到近戰攻擊時恢復生命力。此效果每幾秒只能發生一次。總共可使用20次。持續2分鐘。\n" .. RED .. "大地震擊：" .. WHITE .. "以震盪性的能量震擊敵人，並造成自然傷害，使其正在施放的法術被打斷，且在2秒內無法再次施放。\n" .. RED .. "嗜血術：" .. WHITE .. "使所有隊友的近戰、遠程攻擊和施法速度提高35%。持續20秒。\n" .. RED .. "破除羈絆：" .. WHITE .. "破除20碼範圍內所有友方目標的緩速、控場和昏迷效果。\n" .. RED .. "風暴打擊：" .. WHITE .. "立即揮動主、副手武器攻擊敵人，同時使目標受到的下2次自然傷害提高20%，持續12秒。\n" .. RED .. "閃電箭：" .. WHITE .. "以閃電魔法衝擊敵人，對其造成自然傷害。",
    },

    {
    "摩拉革（眼魔）",
    "這個王實在太簡單，治療注意給被王光學連結的隊友治療即可。",
    RED .. "腐蝕唾液：" .. WHITE .. "舔舐敵人，使其包裹在唾液中，腐蝕敵人的護甲，每次生效都使其護甲值降低5%。可疊加20次。\n" .. RED .. "光學連結：" .. WHITE .. "對目標引導黑暗能量的光束，在12秒內造成暗影傷害。這種傷害在初期會緩慢生效，但是會在引導期間不斷加速，直到結束為止。",
    },

    {
    "艾克膿（元素亡魄）",
    "一開始就要把王的護盾（保護泡泡）給打掉，當護盾破掉後會爆炸以擊退所有人並場上出現一些小水元素，此時必須把小水元素清掉，不然走到王那邊就會幫王補血。坦可以一看到王出現，再拉它離開那些水元素（若場上還有的話）。",
    RED .. "保護泡泡：" .. WHITE .. "以水泡保護施法者，受到的傷害減少99%。每次施法者受到攻擊或法術命中將移除一次防護能量。此法術可持續或直至35次防護能量消耗完畢為止。\n" .. RED .. "水箭之雨：" .. WHITE .. "向半徑45碼範圍內的所有敵人射出水箭，造成1850至2150點冰霜傷害。\n" .. RED .. "水流衝擊：" .. WHITE .. "對敵人發射一股水流衝擊波，將其擊退並造成2775至3225點冰霜傷害。\n" .. RED .. "狂亂：" .. WHITE .. "提高施法速度100%，提高所造成的物理傷害25%，持續10分鐘。\n" .. RED .. "宣洩：" .. WHITE .. "艾克膿洩出了體內的水份。",
    },
    
    {
    "基沃滋（伊斯利繃帶人）",
    "這個王算是紫羅蘭堡之中較棘手的一隻，王的伊斯利之球，會對其身邊的敵人施展奧爆，若是打掉的話，王會再召新的（普通一下數百傷害，英雄則有1千多）出來，所以比較有效率的打法，可能就是不管那些伊斯利之球，專心地打王。這樣坦與輸出職業就需要邊走離開伊斯利之球邊打王。（像TBC的麥克二王）。",
    RED .. "召喚伊斯利之球：" .. WHITE .. "召喚伊斯利之球以協助施法者作戰，普通模式1顆，英雄模式2顆。\n" .. RED .. "秘法之擊：" .. WHITE .. "對敵人造成879至1021點秘法傷害，並使其受到的秘法傷害提高150點，持續20秒。\n" .. RED .. "秘法彈幕雨：" .. WHITE .. "對敵方目標發射飛彈，造成1758至2042點秘法傷害。",
    },
    
    {
    "拉方索（地獄惡犬）",
    "開場坦把王拉背對隊友，也是很簡單的一隻王。",
    RED .. "火焰箭：" .. WHITE .. "對目標造成1890至2310點火焰傷害。\n" .. RED .. "火息術：" .. WHITE .. "對施法者面前錐形範圍內的敵人造成2868至3332點火焰傷害。\n" .. RED .. "熔岩燒灼：" .. WHITE .. "對敵人吐出一個熔岩炸彈，對其造成3793至4407點火焰傷害。\n" .. RED .. "灼燒之焰：" .. WHITE .. "對周圍敵人造成3238至3762點火焰傷害，並使其受到的火焰傷害提高35%，持續3分鐘。",
    },
    
    {
    "『消滅者』舒拉邁特（虛無行者）",
    "王召喚的虛無哨兵會對全體隊員施放範圍暗影箭，但需要受到虛空移形傷害而被移至虛無中的隊員才能把虛無哨兵給殺死。若是補職夠猛，輸出夠強，可以忽略那些虛無哨兵，快速地把王殺死。防戰的法術反射、死騎反魔法護盾等類似技能將會對戰鬥有不錯效果。另外要注意的是王上自己黑暗障蔽時，最好是能停止攻擊，不然隊友打有黑暗障蔽的它時，會有一個治療量減少的減益效果，若不停止攻擊，也要能儘快地解這魔法減益效果，一旦堆到100%治療就無效了。",
    RED .. "虛空移形：" .. WHITE .. "每秒造成750點暗影傷害，並且在此法術結束時可將敵人移形至虛無之中。\n" .. RED .. "黑暗障蔽：" .. WHITE .. "受到傷害時，將使攻擊者獲得的治療降低20%。\n" .. RED .. "召喚虛無哨兵：" .. WHITE .. "召喚一個虛無哨兵。",
    },
    
    {
    "霞妮苟莎",
    "一開場，坦拉住王，讓隊友面對王的側邊。其他隊員一被秘法真空傳送到王的旁邊時，趕快跑開；要是傳送之前遠程輸出職的仇恨較高過坦110%，當他被傳送後王就會轉過頭來打他，所以坦有類似嘲諷的技能的話，最好留著預備這時候用。剩下的就躲暴風雪。",
    RED .. "秘法真空：" .. WHITE .. "將所有周圍的敵人召喚至施法者所在處。\n" .. RED .. "暴風雪：" .. WHITE .. "召喚持續8秒的暴風雪，對指定區域內的所有敵人每2秒造成1500點冰霜傷害。並使區域內所有敵人的移動速度降低40%。\n" .. RED .. "尾翼掃擊：" .. WHITE .. "對施法者身後錐形範圍內的敵人造成1575至1925點傷害，並中斷其施法，持續2秒。\n" .. RED .. "失控能量：" .. WHITE .. "釋放一道秘法能量的洪流，對施法者前方的敵人造成3800至4200點秘法傷害。這些敵方目標同時每3秒受到1000點秘法傷害，持續15秒。\n" .. RED .. "法力浩劫：" .. WHITE .. "每2秒銷毀750點法力，持續8秒，同時造成與銷毀法力值等量的傷害。",
    },
};

--Quest 1 Alliance
Inst82Quest1 = "1. 謹慎是關鍵"
Inst82Quest1_Level = "77"
Inst82Quest1_Attain = "75"
Inst82Quest1_Aim = "羅甯要你前往達拉然的紫羅蘭堡，並與守望者艾圖拉斯交談。"
Inst82Quest1_Location = "羅甯（達拉然 - 紫羅蘭城塞; "..YELLOW.."30.5, 48.4"..WHITE.."）"
Inst82Quest1_Note = "守望者艾圖拉斯在（達拉然 - 紫羅蘭堡; "..YELLOW.."60.8, 62.7"..WHITE.."）"
Inst82Quest1_Prequest = "無"
Inst82Quest1_Folgequest = "牽制"
-- No Rewards for this quest

--Quest 2 Alliance
Inst82Quest2 = "2. 牽制"
Inst82Quest2_Level = "77"
Inst82Quest2_Attain = "75"
Inst82Quest2_Aim = "守望者艾圖拉斯要你進入紫羅蘭堡，並擊退藍龍的攻勢。一旦霞妮苟莎被殺害，向艾圖拉斯回報。"
Inst82Quest2_Location = "守望者艾圖拉斯（達拉然 - 紫羅蘭堡; "..YELLOW.."60.8, 62.7"..WHITE.."）"
Inst82Quest2_Note = "霞妮苟莎在"..YELLOW.."[6]"..WHITE.."。"
Inst82Quest2_Prequest = "謹慎是關鍵"
Inst82Quest2_Folgequest = "無"
Inst82Quest2FQuest = "true"
--
Inst82Quest2name1 = "刺青鹿皮護腿"
Inst82Quest2name2 = "協商窄褲"
Inst82Quest2name3 = "錯綜迷宮腿甲"
Inst82Quest2name4 = "達拉然守望者腿鎧"


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

Inst84Story = "飄浮在龍骨荒野上方，這座被稱為納克薩瑪斯的龐大墓地是巫妖王最強大的手下之一，可怕的巫妖克爾蘇加德的領地。過去的恐懼與尚未被釋放的威脅正聚集在裡面，巫妖王的奴僕們正籌劃著新的攻勢為它們的突襲在做準備。天譴軍團很快就會再次席捲大地……。"
Inst84Caption = "納克薩瑪斯"
Inst84QAA = "6 個任務"
Inst84QAH = "6 個任務"

--Quest 1 Alliance
Inst84Quest1 = "1. 聚源虹膜之鑰"
Inst84Quest1_Level = "80"
Inst84Quest1_Attain = "80"
Inst84Quest1_Aim = "轉交聚源虹膜之鑰給『生命守護者』雅立史卓莎，她就在龍骨荒野的龍眠神殿頂端。"
Inst84Quest1_Location = "聚源虹膜之鑰（掉落自薩菲隆; "..YELLOW.."納克薩瑪斯 - 冰霜巨龍的巢穴 [1]"..WHITE.."）"
Inst84Quest1_Note = "雅立史卓莎在（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）。獎勵是開啟普通難度10人模式的永恆之眼鑰匙。"
Inst84Quest1_Prequest = "無"
Inst84Quest1_Folgequest = "永恆之眼的審判（"..YELLOW.."永恆之眼"..WHITE.."）"
--
Inst84Quest1name1 = "聚源虹膜之鑰"

--Quest 2 Alliance
Inst84Quest2 = "2. 聚源虹膜英雄之鑰 (英雄模式)"
Inst84Quest2_Level = "80"
Inst84Quest2_Attain = "80"
Inst84Quest2_Aim = "轉交聚源虹膜英雄之鑰給『生命守護者』雅立史卓莎，她就在龍骨荒野的龍眠神殿頂端。"
Inst84Quest2_Location = "聚源虹膜英雄之鑰（掉落自薩菲隆; "..YELLOW.."納克薩瑪斯 - 冰霜巨龍的巢穴 [1]"..WHITE.."）"
Inst84Quest2_Note = "雅立史卓莎在（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）。獎勵是開啟英雄難度25人模式的永恆之眼鑰匙。"
Inst84Quest2_Prequest = "無"
Inst84Quest2_Folgequest = "永恆之眼的英雄審判（"..YELLOW.."永恆之眼"..WHITE.."）"
--
Inst84Quest2name1 = "聚源虹膜英雄之鑰"

--Quest 3 Alliance
Inst84Quest3 = "3. 阿努比瑞克漢必須死! (每週團隊任務)"
Inst84Quest3_Level = "80"
Inst84Quest3_Attain = "80"
Inst84Quest3_Aim = "殺死阿努比瑞克漢。"
Inst84Quest3_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst84Quest3_Note = "阿努比瑞克漢在"..YELLOW.."蜘蛛區[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst84Quest3_Prequest = "無"
Inst84Quest3_Folgequest = "無"
--
Inst84Quest3name1 = "冰霜紋章"
Inst84Quest3name2 = "凱旋紋章"

--Quest 4 Alliance
Inst84Quest4 = "4. 講師拉祖維斯必須死! (每週團隊任務)"
Inst84Quest4_Level = "80"
Inst84Quest4_Attain = "80"
Inst84Quest4_Aim = "殺死講師拉祖維斯。"
Inst84Quest4_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst84Quest4_Note = "講師拉祖維斯在"..YELLOW.."死亡騎士區[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst84Quest4_Prequest = "無"
Inst84Quest4_Folgequest = "無"
--
Inst84Quest4name1 = "冰霜紋章"
Inst84Quest4name2 = "凱旋紋章"

--Quest 5 Alliance
Inst84Quest5 = "5. 『瘟疫使者』諾斯必須死! (每週團隊任務)"
Inst84Quest5_Level = "80"
Inst84Quest5_Attain = "80"
Inst84Quest5_Aim = "殺死『瘟疫使者』諾斯。"
Inst84Quest5_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst84Quest5_Note = "『瘟疫使者』諾斯在"..YELLOW.."瘟疫區[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst84Quest5_Prequest = "無"
Inst84Quest5_Folgequest = "無"
--
Inst84Quest5name1 = "冰霜紋章"
Inst84Quest5name2 = "凱旋紋章"

--Quest 6 Alliance
Inst84Quest6 = "6. 縫補者必須死! (每週團隊任務)"
Inst84Quest6_Level = "80"
Inst84Quest6_Attain = "80"
Inst84Quest6_Aim = "殺死縫補者。"
Inst84Quest6_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst84Quest6_Note = "縫補者在"..YELLOW.."憎惡區[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst84Quest6_Prequest = "無"
Inst84Quest6_Folgequest = "無"
--
Inst84Quest6name1 = "冰霜紋章"
Inst84Quest6name2 = "凱旋紋章"


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

Inst85Story = "數不盡的歲月之中，奧杜亞獨自矗立，遠離凡人的塵囂，不受世俗干擾。自從在風暴群山中發現了奧杜亞，許多的冒險者來到這座泰坦城市來瞭解更多它神秘的過去。有許多人在思考這棟建築的原始用途為何，有人認為它是個用來讚頌其建造者光榮的城市；也有人認為這是存放無數奇珍的寶庫，又或者是偉大泰坦們的遺物。但這些猜測全都錯了，在奧杜亞的高牆巨門之後更進一步的探索才發現，奧杜亞既非城市，也沒有寶庫，更沒泰坦奧秘的最終解答。在它壯麗的建築群之下是一座監牢，用來永久囚禁遠古死神，尤格薩倫－－這古老的恐怖存在腐化了那些守衛，即將要突破他最後的禁錮；面對尤格薩倫即將重獲自由的危機，一群凡人準備要攻入這座城市。在那裡只有深深的恐懼在等待著那些膽敢踏入奧杜亞的冒險者，想擊敗鐵族軍團並且突破城市的防禦系統需要驚人的力量，但這樣的偉大勝利也未必足以抵抗深藏於地底的瘋狂，即使是泰坦也無法，也不會去消滅的，一股曾受控於他們的…邪惡。\n\n古老的奧杜亞之下，上古死神在此沉睡，低語呢喃……小心你的腳步，否則它的囚牢將會成為你的葬身之地。"
Inst85Caption = "亞夏梵穹殿"
Inst85QAA = "目前任務未知"
Inst85QAH = "目前任務未知"



--------------- INST86 - Ulduar ---------------

Inst86Story = "數不盡的歲月之中，奧杜亞獨自矗立，遠離凡人的塵囂，不受世俗干擾。但自從近來被人發覺後，就有許多人在思考這棟建築的原始用途為何。有人認為它是個用來讚頌其建造者光榮的城市；也有人認為這是存放無數奇珍的寶庫，又或者是偉大泰坦們的遺物。但這些猜測全都錯了。在奧杜亞的高牆巨門之後，既非城市，也沒有寶庫，更沒泰坦奧秘的最終解答。只有深深的恐懼在等待著那些膽敢踏入奧杜亞的冒險者，即使是泰坦也無法，也不會去消滅的，一股曾受控於他們的…邪惡。\n\n古老的奧杜亞之下，上古死神在此沉睡，低語呢喃……小心你的腳步，否則它的囚牢將會成為你的葬身之地。"
Inst86Caption = "奧杜亞"
Inst86QAA = "20 個任務"
Inst86QAH = "20 個任務"

--Quest 1 Alliance
Inst86Quest1 = "1. 大資料庫資料圓盤"
Inst86Quest1_Level = "80"
Inst86Quest1_Attain = "80"
Inst86Quest1_Aim = "將大資料資料取圓盤帶到奧杜亞的大資料庫控制臺。"
Inst86Quest1_Location = "大資料庫資料圓盤（掉落自破鋼者; "..YELLOW.."前廳[5]"..WHITE.."）"
Inst86Quest1_Note = "資料圓盤只有在困難模式的破鋼者才會掉落。每個團隊在每次只有一個人可以撿起資料圓盤。\n\n在擊殺破鋼者之後將會打開一扇門，接著在房間遠處的大資料庫控制臺回報任務。勘察員多倫將會交付你後續任務。"
Inst86Quest1_Prequest = "無"
Inst86Quest1_Folgequest = "星穹渾天儀"
-- No Rewards for this quest

--Quest 2 Alliance
Inst86Quest2 = "2. 星穹渾天儀"
Inst86Quest2_Level = "80"
Inst86Quest2_Attain = "80"
Inst86Quest2_Aim = "奧杜亞大資料庫的勘察員多倫要你找到通往星穹渾天儀的入口。"
Inst86Quest2_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest2_Note = "星穹渾天儀在（奧杜亞 - 前廳; "..YELLOW.."[8]"..WHITE.."）。\n\n向勘察員多倫回報此任務之後，他將會給你另外四個任務。"
Inst86Quest2_Prequest = "大資料庫資料圓盤"
Inst86Quest2_Folgequest = "另外四個任務–霍迪爾的符印、索林姆的符印、芙蕾雅的符印、彌米倫的符印"
Inst86Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst86Quest3 = "3. 霍迪爾的符印"
Inst86Quest3_Level = "80"
Inst86Quest3_Attain = "80"
Inst86Quest3_Aim = "奧杜亞大資料庫的勘察員多倫要你取得霍迪爾的符印。"
Inst86Quest3_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest3_Note = "霍迪爾在"..YELLOW.."守衛者[10]"..WHITE.."。玩家必須在困難模式下擊殺霍迪爾以取得符印。"
Inst86Quest3_Prequest = "星穹渾天儀"
Inst86Quest3_Folgequest = "無"
Inst86Quest3PreQuest = "true"
-- No Rewards for this quest

--Quest 4 Alliance
Inst86Quest4 = "4. 索林姆的符印"
Inst86Quest4_Level = "80"
Inst86Quest4_Attain = "80"
Inst86Quest4_Aim = "奧杜亞大資料庫的勘察員多倫要你取得索林姆的符印。"
Inst86Quest4_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest4_Note = "索林姆在"..YELLOW.."守衛者[11]"..WHITE.."。玩家必須在困難模式下擊殺索林姆以取得符印。"
Inst86Quest4_Prequest = "星穹渾天儀"
Inst86Quest4_Folgequest = "無"
Inst86Quest4PreQuest = "true"
-- No Rewards for this quest

--Quest 5 Alliance
Inst86Quest5 = "5. 芙蕾雅的符印"
Inst86Quest5_Level = "80"
Inst86Quest5_Attain = "80"
Inst86Quest5_Aim = "奧杜亞大資料庫的勘察員多倫要你取得芙蕾雅的符印。"
Inst86Quest5_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest5_Note = "芙蕾雅在"..YELLOW.."守衛者[12]"..WHITE.."。玩家必須在困難模式下擊殺芙蕾雅以取得符印。"
Inst86Quest5_Prequest = "星穹渾天儀"
Inst86Quest5_Folgequest = "無"
Inst86Quest5PreQuest = "true"
-- No Rewards for this quest

--Quest 6 Alliance
Inst86Quest6 = "6. 彌米倫的符印"
Inst86Quest6_Level = "80"
Inst86Quest6_Attain = "80"
Inst86Quest6_Aim = "奧杜亞大資料庫的勘察員多倫要你取得彌米倫的符印。"
Inst86Quest6_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest6_Note = "彌米倫在"..YELLOW.."創思之廳[13]"..WHITE.."。玩家必須在困難模式下擊殺彌米倫以取得符印。"
Inst86Quest6_Prequest = "星穹渾天儀"
Inst86Quest6_Folgequest = "無"
Inst86Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst86Quest7 = "7. 艾爾加隆"
Inst86Quest7_Level = "80"
Inst86Quest7_Attain = "80"
Inst86Quest7_Aim = "將看守者符印帶給奧杜亞的大資料庫控制臺。"
Inst86Quest7_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest7_Note = "完成這個任務之後你將可以在星穹渾天儀與『觀察者』艾爾加隆進行戰鬥。"
Inst86Quest7_Prequest = "四個符印任務"
Inst86Quest7_Folgequest = "無"
Inst86Quest7PreQuest = "true"
--
Inst86Quest7name1 = "星穹渾天儀之鑰"
Inst86Quest7name2 = "奧杜亞戰利品袋"

--Quest 8 Alliance
Inst86Quest8 = "8. 情況良好，完美收場"
Inst86Quest8_Level = "80"
Inst86Quest8_Attain = "80"
Inst86Quest8_Aim = "將回覆代碼Α帶給達拉然的羅甯。"
Inst86Quest8_Location = "回覆代碼Α（掉落自『觀察者』艾爾加隆; "..YELLOW.."前廳[7]"..WHITE.."）"
Inst86Quest8_Note = "每個團隊在每次只有一個成員可以拾取回覆代碼。羅甯在達拉然 - 紫羅蘭城塞; "..YELLOW.."30.5, 48.4"..WHITE.."。"
Inst86Quest8_Prequest = "無"
Inst86Quest8_Folgequest = "無"
--
Inst86Quest8name1 = "天穹信使披氅"
Inst86Quest8name2 = "日微披氅"
Inst86Quest8name3 = "布萊恩的緘印戒指"
Inst86Quest8name4 = "星耀徽記"

--Quest 9 Alliance
Inst86Quest9 = "9. 英雄:大資料庫資料圓盤"
Inst86Quest9_Level = "80"
Inst86Quest9_Attain = "80"
Inst86Quest9_Aim = "將大資料資料取圓盤帶到奧杜亞的大資料庫控制臺。"
Inst86Quest9_Location = "大資料庫資料圓盤（掉落自破鋼者; "..YELLOW.."前廳[5]"..WHITE.."）"
Inst86Quest9_Note = "資料圓盤只有在英雄困難模式的破鋼者才會掉落。每個團隊在每次只有一個人可以撿起資料圓盤。\n\n在擊殺破鋼者之後將會打開一扇門，接著在房間遠處的大資料庫控制臺回報任務。勘察員多倫將會交付你後續任務。"
Inst86Quest9_Prequest = "無"
Inst86Quest9_Folgequest = "英雄：星穹渾天儀"
-- No Rewards for this quest

--Quest 10 Alliance
Inst86Quest10 = "10. 英雄:星穹渾天儀"
Inst86Quest10_Level = "80"
Inst86Quest10_Attain = "80"
Inst86Quest10_Aim = "奧杜亞大資料庫的勘察員多倫要你找到通往星穹渾天儀的入口。"
Inst86Quest10_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest10_Note = "星穹渾天儀在（奧杜亞 - 前廳; "..YELLOW.."[8]"..WHITE.."）。\n\n向勘察員多倫回報此任務之後，他將會給你另外四個任務。"
Inst86Quest10_Prequest = "英雄：大資料庫資料圓盤"
Inst86Quest10_Folgequest = "另外四個任務–英雄：霍迪爾的符印、英雄：索林姆的符印、英雄：芙蕾雅的符印、英雄：彌米倫的符印"
Inst86Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst86Quest11 = "11. 英雄:霍迪爾的符印"
Inst86Quest11_Level = "80"
Inst86Quest11_Attain = "80"
Inst86Quest11_Aim = "奧杜亞大資料庫的勘察員多倫要你取得霍迪爾的符印。"
Inst86Quest11_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest11_Note = "霍迪爾在"..YELLOW.."守衛者[10]"..WHITE.."。玩家必須在英雄困難模式下擊殺霍迪爾以取得符印。"
Inst86Quest11_Prequest = "英雄：星穹渾天儀"
Inst86Quest11_Folgequest = "無"
Inst86Quest11PreQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst86Quest12 = "12. 英雄:索林姆的符印"
Inst86Quest12_Level = "80"
Inst86Quest12_Attain = "80"
Inst86Quest12_Aim = "奧杜亞大資料庫的勘察員多倫要你取得索林姆的符印。"
Inst86Quest12_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest12_Note = "索林姆在"..YELLOW.."守衛者[11]"..WHITE.."。玩家必須在英雄困難模式下擊殺索林姆以取得符印。"
Inst86Quest12_Prequest = "英雄：星穹渾天儀"
Inst86Quest12_Folgequest = "無"
Inst86Quest12PreQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst86Quest13 = "13. 英雄:芙蕾雅的符印"
Inst86Quest13_Level = "80"
Inst86Quest13_Attain = "80"
Inst86Quest13_Aim = "奧杜亞大資料庫的勘察員多倫要你取得芙蕾雅的符印。"
Inst86Quest13_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest13_Note = "芙蕾雅在"..YELLOW.."守衛者[12]"..WHITE.."。玩家必須在英雄困難模式下擊殺芙蕾雅以取得符印。"
Inst86Quest13_Prequest = "英雄：星穹渾天儀"
Inst86Quest13_Folgequest = "無"
Inst86Quest13PreQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst86Quest14 = "14. 英雄:彌米倫的符印"
Inst86Quest14_Level = "80"
Inst86Quest14_Attain = "80"
Inst86Quest14_Aim = "奧杜亞大資料庫的勘察員多倫要你取得彌米倫的符印。"
Inst86Quest14_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest14_Note = "彌米倫在"..YELLOW.."創思之廳[13]"..WHITE.."。玩家必須在英雄困難模式下擊殺彌米倫以取得符印。"
Inst86Quest14_Prequest = "英雄：星穹渾天儀"
Inst86Quest14_Folgequest = "無"
Inst86Quest14PreQuest = "true"
-- No Rewards for this quest

--Quest 15 Alliance
Inst86Quest15 = "15. 英雄:艾爾加隆"
Inst86Quest15_Level = "80"
Inst86Quest15_Attain = "80"
Inst86Quest15_Aim = "將看守者符印帶給奧杜亞的大資料庫控制臺。"
Inst86Quest15_Location = "勘察員多倫（奧杜亞 - 前廳; "..YELLOW.."[6]"..WHITE.."）"
Inst86Quest15_Note = "完成這個任務之後你將可以在星穹渾天儀與『觀察者』艾爾加隆進行戰鬥。"
Inst86Quest15_Prequest = "四個英雄符印任務"
Inst86Quest15_Folgequest = "無"
Inst86Quest15PreQuest = "true"
--
Inst86Quest15name1 = "英雄星穹渾天儀之鑰"
Inst86Quest15name2 = "奧杜亞戰利品袋"

--Quest 16 Alliance
Inst86Quest16 = "16. 英雄:情況良好，完美收場"
Inst86Quest16_Level = "80"
Inst86Quest16_Attain = "80"
Inst86Quest16_Aim = "將回覆代碼Α帶給達拉然的羅甯。"
Inst86Quest16_Location = "回覆代碼Α（掉落自『觀察者』艾爾加隆; "..YELLOW.."前廳[7]"..WHITE.."）"
Inst86Quest16_Note = "每個團隊在每次只有一個成員可以拾取回覆代碼。羅甯在達拉然 - 紫羅蘭城塞; "..YELLOW.."30.5, 48.4"..WHITE.."。"
Inst86Quest16_Prequest = "無"
Inst86Quest16_Folgequest = "無"
--
Inst86Quest16name1 = "天降披氅"
Inst86Quest16name2 = "日微披風"
Inst86Quest16name3 = "布萊恩的璽戒"
Inst86Quest16name4 = "星耀環戒"

--Quest 17 Alliance
Inst86Quest17 = "17. 烈焰戰輪必須死! (每週團隊任務)"
Inst86Quest17_Level = "80"
Inst86Quest17_Attain = "80"
Inst86Quest17_Aim = "殺死烈焰戰輪。"
Inst86Quest17_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst86Quest17_Note = "烈焰戰輪在"..YELLOW.."攻城區[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst86Quest17_Prequest = "無"
Inst86Quest17_Folgequest = "無"
--
Inst86Quest17name1 = "冰霜紋章"
Inst86Quest17name2 = "凱旋紋章"

--Quest 18 Alliance
Inst86Quest18 = "18. 『火爐之主』伊格尼司必須死! (每週團隊任務)"
Inst86Quest18_Level = "80"
Inst86Quest18_Attain = "80"
Inst86Quest18_Aim = "殺死『火爐之主』伊格尼司。"
Inst86Quest18_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst86Quest18_Note = "『火爐之主』伊格尼司在"..YELLOW.."攻城區[2]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst86Quest18_Prequest = "無"
Inst86Quest18_Folgequest = "無"
--
Inst86Quest18name1 = "冰霜紋章"
Inst86Quest18name2 = "凱旋紋章"

--Quest 19 Alliance
Inst86Quest19 = "19. 銳鱗必須死! (每週團隊任務)"
Inst86Quest19_Level = "80"
Inst86Quest19_Attain = "80"
Inst86Quest19_Aim = "殺死銳鱗。"
Inst86Quest19_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst86Quest19_Note = "銳鱗在"..YELLOW.."攻城區[3]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst86Quest19_Prequest = "無"
Inst86Quest19_Folgequest = "無"
--
Inst86Quest19name1 = "冰霜紋章"
Inst86Quest19name2 = "凱旋紋章"

--Quest 20 Alliance
Inst86Quest20 = "20. XT-002拆解者必須死! (每週團隊任務)"
Inst86Quest20_Level = "80"
Inst86Quest20_Attain = "80"
Inst86Quest20_Aim = "殺死XT-002拆解者。"
Inst86Quest20_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst86Quest20_Note = "XT-002拆解者在"..YELLOW.."攻城區[4]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst86Quest20_Prequest = "無"
Inst86Quest20_Folgequest = "無"
--
Inst86Quest20name1 = "冰霜紋章"
Inst86Quest20name2 = "凱旋紋章"


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

Inst87Story = "直搗天譴軍團心臟的時刻逐漸迫近。艾澤拉斯風起雲湧，各路英雄齊聚在飽經風霜的戰旗下，準備迎接即將來臨的暴風雨。人們說，即使烏雲蔽日，也能見到一絲光明。希望的曙光激勵著銀白十字軍的男男女女：希望聖光能帶領他們走過艱苦的時刻，希望善良能戰勝邪惡，希望能有一位受到聖光祝福的英雄挺身而出，結束巫妖王的黑暗統治。銀白十字軍為此登高一呼，召集各方英雄來到巫妖王的大門前，在艾澤拉斯前所未見的聯賽場上，證明自己的實力。當然，這樣的聯賽需要一個適當的場地。尋求資格的參賽者在此接受嚴苛的試煉；英雄在此……成為勇士。這裡就叫做十字軍大競技場。"
Inst87Caption = "勇士試煉"
Inst87QAA = "無任務"
Inst87QAH = "無任務"



--------------- INST88 - Trial of the Crusader ---------------

Inst88Story = "直搗天譴軍團心臟的時刻逐漸迫近。艾澤拉斯風起雲湧，各路英雄齊聚在飽經風霜的戰旗下，準備迎接即將來臨的暴風雨。人們說，即使烏雲蔽日，也能見到一絲光明。希望的曙光激勵著銀白十字軍的男男女女：希望聖光能帶領他們走過艱苦的時刻，希望善良能戰勝邪惡，希望能有一位受到聖光祝福的英雄挺身而出，結束巫妖王的黑暗統治。銀白十字軍為此登高一呼，召集各方英雄來到巫妖王的大門前，在艾澤拉斯前所未見的聯賽場上，證明自己的實力。當然，這樣的聯賽需要一個適當的場地。尋求資格的參賽者在此接受嚴苛的試煉；英雄在此……成為勇士。這裡就叫做十字軍大競技場。"
Inst88Caption = "十字軍試煉"
Inst88QAA = "1 個任務"
Inst88QAH = "1 個任務"

--Quest 1 Alliance
Inst88Quest1 = "1. 賈拉克瑟斯領主必須死! (每週團隊任務)"
Inst88Quest1_Level = "80"
Inst88Quest1_Attain = "80"
Inst88Quest1_Aim = "殺死賈拉克瑟斯領主。"
Inst88Quest1_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst88Quest1_Note = "賈拉克瑟斯領主是第二個王。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst88Quest1_Prequest = "無"
Inst88Quest1_Folgequest = "無"
--
Inst88Quest1name1 = "冰霜紋章"
Inst88Quest1name2 = "凱旋紋章"


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

Inst90Story = "矗立在北裂境的荒涼冰原之上，冰冠城塞等待著那些無法坐視巫妖王與其天譴軍誓言要消滅艾澤拉斯而齊聚的勇士們。來自世界各地的英雄們將會在此面對前所未見的艱鉅挑戰。但在你直闖城塞大門之前，另一條刺探敵情之路正呼喚著你。深入擁有三個不同區域的全新五人地城–冰冠城塞：冰封大廳，在珍娜．普勞德摩爾或希瓦娜斯．風行者的帶領之下，闖入巫妖王的禁地。在這幅員遼闊的地城中的第一個分區，眾魂熔爐很快的就會讓玩家親身體驗到通過天譴軍的據點，朝著城塞深處更加危機四伏的地點前進會是個什麼樣的考驗。珍娜將率領聯盟軍隊，而希瓦娜斯則會指揮著部落大軍。這階段的行動目標是摧毀在城塞的這個區域中所發現的裝置–靈魂研磨者，然後再繼續往前進——前提是，如果聯盟和部落的軍隊有辦法戰勝面前的敵人。"
Inst90Caption = "眾魂熔爐"
Inst90QAA = "3 個任務"
Inst90QAH = "3 個任務"

--Quest 1 Alliance
Inst90Quest1 = "1. 進入冰凍城塞"
Inst90Quest1_Level = "80"
Inst90Quest1_Attain = "80"
Inst90Quest1_Aim = "從冰冠城塞的側邊進入薩倫之淵，並且去找珍娜．普勞德摩爾女士。"
Inst90Quest1_Location = "學徒納爾菲（達拉然 - 於南方銀行外漫步）"
Inst90Quest1_Note = "珍娜．普勞德摩爾女士就在地城之中。"
Inst90Quest1_Prequest = "無"
Inst90Quest1_Folgequest = "受苦靈魂的回聲"
-- No Rewards for this quest

--Quest 2 Alliance
Inst90Quest2 = "2. 受苦靈魂的回聲"
Inst90Quest2_Level = "80"
Inst90Quest2_Attain = "80"
Inst90Quest2_Aim = "殺掉布朗吉姆以及眾魂吞噬者來鞏固薩倫之淵的入口。"
Inst90Quest2_Location = "珍娜．普勞德摩爾女士（眾魂熔爐; "..YELLOW.."入口"..WHITE.."）"
Inst90Quest2_Note = "在進入下一個副本之前於"..YELLOW.."[3]"..WHITE.."向珍娜．普勞德摩爾女士回報任務。完成此任務之後才能進入薩倫之淵。"
Inst90Quest2_Prequest = "進入冰凍城塞"
Inst90Quest2_Folgequest = "薩倫之淵（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst90Quest2FQuest = "true"
--
Inst90Quest2name1 = "冰霜紋章"

--Quest 3 Alliance
Inst90Quest3 = "3. 淬鍊劍刃"
Inst90Quest3_Level = "80"
Inst90Quest3_Attain = "80"
Inst90Quest3_Aim = "去眾魂爐缸淬鍊重鑄的奎爾德拉。"
Inst90Quest3_Location = "卡拉迪斯．亮矛（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.2, 31.3"..WHITE.."）"
Inst90Quest3_Note = "眾魂爐缸在"..YELLOW.."[3]"..WHITE.."，靠近地城的盡頭。"
Inst90Quest3_Prequest = "重鑄劍刃（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst90Quest3_Folgequest = "倒影大廳（"..YELLOW.."倒影大廳"..WHITE.."）"
Inst90Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst90Quest1_HORDE = "1. 進入冰凍城塞"
Inst90Quest1_HORDE_Level = "80"
Inst90Quest1_HORDE_Attain = "80"
Inst90Quest1_HORDE_Aim = "從冰冠城塞的側牆進入薩倫之淵，然後去找希瓦娜斯．風行者女士。"
Inst90Quest1_HORDE_Location = "黑暗遊俠沃瑞（達拉然 - 於北方銀行外漫步）"
Inst90Quest1_HORDE_Note = "希瓦娜斯．風行者女士就在地城之中。"
Inst90Quest1_HORDE_Prequest = "無"
Inst90Quest1_HORDE_Folgequest = "受苦靈魂的回聲"
-- No Rewards for this quest

--Quest 2 Horde
Inst90Quest2_HORDE = "2. 受苦靈魂的回聲"
Inst90Quest2_HORDE_Level = "80"
Inst90Quest2_HORDE_Attain = "80"
Inst90Quest2_HORDE_Aim = "殺掉布朗吉姆以及眾魂吞噬者來鞏固薩倫之淵的入口。"
Inst90Quest2_HORDE_Location = "希瓦娜斯．風行者女士（眾魂熔爐; "..YELLOW.."入口"..WHITE.."）"
Inst90Quest2_HORDE_Note = "在進入下一個副本之前於"..YELLOW.."[3]"..WHITE.."向希瓦娜斯．風行者女士回報任務。完成此任務之後才能進入薩倫之淵。"
Inst90Quest2_HORDE_Prequest = "進入冰凍城塞"
Inst90Quest2_HORDE_Folgequest = "薩倫之淵（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst90Quest2FQuest_HORDE = "true"
--
Inst90Quest2name1_HORDE = "冰霜紋章"

--Quest 3 Horde
Inst90Quest3_HORDE = "3. 淬鍊劍刃"
Inst90Quest3_HORDE_Level = "80"
Inst90Quest3_HORDE_Attain = "80"
Inst90Quest3_HORDE_Aim = "去眾魂爐缸淬鍊重鑄的奎爾德拉。"
Inst90Quest3_HORDE_Location = "米拉連恩．日炎（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.5, 31.1"..WHITE.."）"
Inst90Quest3_HORDE_Note = "眾魂爐缸在"..YELLOW.."[3]"..WHITE.."，靠近地城的盡頭。"
Inst90Quest3_HORDE_Prequest = "重鑄劍刃（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst90Quest3_HORDE_Folgequest = "倒影大廳（"..YELLOW.."倒影大廳"..WHITE.."）"
Inst90Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST91 - Pit of Saron (PoS)  ---------------

Inst91Story = "矗立在北裂境的荒涼冰原之上，冰冠城塞等待著那些無法坐視巫妖王與其天譴軍誓言要消滅艾澤拉斯而齊聚的勇士們。來自世界各地的英雄們將會在此面對前所未見的艱鉅挑戰。但在你直闖城塞大門之前，另一條刺探敵情之路正呼喚著你。深入擁有三個不同區域的全新五人地城–冰冠城塞：冰封大廳，在珍娜．普勞德摩爾或希瓦娜斯．風行者的帶領之下，闖入巫妖王的禁地。只有那些攻克了眾魂熔爐的人才具備進入這個區域的資格。薩倫之淵將成為聯盟及部落大軍更深入巫妖王領地的通道，來到此地的玩家們將會立即感受到來自天譴領主提朗紐斯的威脅。然而想打敗他並非容易之事，在與提朗紐斯交戰之前，冒險者們得先完成來自隊長交辦的事—先釋放所有被天譴軍團囚禁的盟友們，否則在那之前，提朗紐斯通常都將敵人交給部下去處理，也就是城塞礦脈的工人。也許這次的難關能透露出些許有關巫妖王在冰封王座以外，倒影大廳深處的私人密室的蛛絲馬跡。"
Inst91Caption = "薩倫之淵"
Inst91QAA = "4 個任務"
Inst91QAH = "4 個任務"

--Quest 1 Alliance
Inst91Quest1 = "1. 薩倫之淵"
Inst91Quest1_Level = "80"
Inst91Quest1_Attain = "80"
Inst91Quest1_Aim = "在薩倫之淵裡面與珍娜．普勞德摩爾女士會合。"
Inst91Quest1_Location = "珍娜．普勞德摩爾女士（眾魂熔爐; "..YELLOW.."[3]"..WHITE.."）"
Inst91Quest1_Note = "珍娜．普勞德摩爾女士就在地城之中。"
Inst91Quest1_Prequest = "受苦靈魂的回聲（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst91Quest1_Folgequest = "入城之徑"
Inst91Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst91Quest2 = "2. 入城之徑"
Inst91Quest2_Level = "80"
Inst91Quest2_Attain = "80"
Inst91Quest2_Aim = "釋放15名聯盟奴隸並且殺掉鍛造大師加弗羅斯。"
Inst91Quest2_Location = "珍娜．普勞德摩爾女士（薩倫之淵; "..YELLOW.."[1]"..WHITE.."）"
Inst91Quest2_Note = "聯盟奴隸遍佈於薩倫之淵。殺掉鍛造大師加弗羅斯之後，馬汀．維特斯將會出現在"..YELLOW.."[2]"..WHITE.."，向他回報此任務並接下後續任務。"
Inst91Quest2_Prequest = "薩倫之淵"
Inst91Quest2_Folgequest = "逃離深淵"
Inst91Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst91Quest3 = "3. 逃離深淵"
Inst91Quest3_Level = "80"
Inst91Quest3_Attain = "80"
Inst91Quest3_Aim = "殺掉天譴領主提朗紐斯。"
Inst91Quest3_Location = "馬汀．維特斯（薩倫之淵; "..YELLOW.."[1]"..WHITE.."）"
Inst91Quest3_Note = "天譴領主提朗紐斯在地城的盡頭。在進入下一個副本之前向珍娜．普勞德摩爾女士回報任務。完成此任務之後才能進入倒影大廳。"
Inst91Quest3_Prequest = "入城之徑"
Inst91Quest3_Folgequest = "霜之哀傷（"..YELLOW.."倒影大廳"..WHITE.."）"
Inst91Quest3FQuest = "true"
--
Inst91Quest3name1 = "冰霜紋章"

--Quest 4 Alliance
Inst91Quest4 = "4. 重鑄劍刃"
Inst91Quest4_Level = "80"
Inst91Quest4_Attain = "80"
Inst91Quest4_Aim = "取得5個灌能薩鋼錠與鍛造大師之錘，並且利用它們製作出重鑄的奎爾德拉。"
Inst91Quest4_Location = "卡拉迪斯．亮矛（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.2, 31.3"..WHITE.."）"
Inst91Quest4_Note = "灌能薩鋼錠散落在整個深淵中，蒐集完成之後在靠近鍛造大師加弗羅斯的鐵鉆前使用鍛造大師之錘。"
Inst91Quest4_Prequest = "回報卡拉迪斯．亮矛"
Inst91Quest4_Folgequest = "淬鍊劍刃（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst91Quest4PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst91Quest1_HORDE = "1. 薩倫之淵"
Inst91Quest1_HORDE_Level = "80"
Inst91Quest1_HORDE_Attain = "80"
Inst91Quest1_HORDE_Aim = "在薩倫之淵裡面與希瓦娜斯．風行者女士會合。"
Inst91Quest1_HORDE_Location = "希瓦娜斯．風行者女士（眾魂熔爐; "..YELLOW.."[3]"..WHITE.."）"
Inst91Quest1_HORDE_Note = "希瓦娜斯．風行者女士就在地城之中。"
Inst91Quest1_HORDE_Prequest = "受苦靈魂的回聲（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst91Quest1_HORDE_Folgequest = "入城之徑"
Inst91Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst91Quest2_HORDE = "2. 入城之徑"
Inst91Quest2_HORDE_Level = "80"
Inst91Quest2_HORDE_Attain = "80"
Inst91Quest2_HORDE_Aim = "釋放15名部落奴隸並且殺掉鍛造大師加弗羅斯。"
Inst91Quest2_HORDE_Location = "希瓦娜斯．風行者女士（薩倫之淵; "..YELLOW.."[1]"..WHITE.."）"
Inst91Quest2_HORDE_Note = "部落奴隸遍佈於薩倫之淵。殺掉鍛造大師加弗羅斯之後，葛剛．鐵顱將會出現在"..YELLOW.."[2]"..WHITE.."，向他回報此任務並接下後續任務。"
Inst91Quest2_HORDE_Prequest = "薩倫之淵"
Inst91Quest2_HORDE_Folgequest = "逃離深淵"
Inst91Quest2FQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 3 Horde
Inst91Quest3_HORDE = "3. 逃離深淵"
Inst91Quest3_HORDE_Level = "80"
Inst91Quest3_HORDE_Attain = "80"
Inst91Quest3_HORDE_Aim = "殺掉天譴領主提朗紐斯。"
Inst91Quest3_HORDE_Location = "葛剛．鐵顱（薩倫之淵; "..YELLOW.."[1]"..WHITE.."）"
Inst91Quest3_HORDE_Note = "天譴領主提朗紐斯在地城的盡頭。在進入下一個副本之前向希瓦娜斯．風行者女士回報任務。完成此任務之後才能進入倒影大廳。"
Inst91Quest3_HORDE_Prequest = "入城之徑"
Inst91Quest3_HORDE_Folgequest = "霜之哀傷（"..YELLOW.."倒影大廳"..WHITE.."）"
Inst91Quest3FQuest_HORDE = "true"
--
Inst91Quest3name1_HORDE = "冰霜紋章"

--Quest 4 Horde
Inst91Quest4_HORDE = "4. 重鑄劍刃"
Inst91Quest4_HORDE_Level = "80"
Inst91Quest4_HORDE_Attain = "80"
Inst91Quest4_HORDE_Aim = "取得5個灌能薩鋼錠與鍛造大師之錘，把它們跟奎爾德拉的殘塊組合起來，並且製作出重鑄的奎爾德拉。"
Inst91Quest4_HORDE_Location = "米拉連恩．日炎（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.5, 31.1"..WHITE.."）"
Inst91Quest4_HORDE_Note = "灌能薩鋼錠散落在整個深淵中，蒐集完成之後在靠近鍛造大師加弗羅斯的鐵鉆前使用鍛造大師之錘。"
Inst91Quest4_HORDE_Prequest = "回報米拉連恩．日炎"
Inst91Quest4_HORDE_Folgequest = "淬鍊劍刃（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst91Quest4PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST92 - Halls of Reflection (HoR)  ---------------

Inst92Story = "矗立在北裂境的荒涼冰原之上，冰冠城塞等待著那些無法坐視巫妖王與其天譴軍誓言要消滅艾澤拉斯而齊聚的勇士們。來自世界各地的英雄們將會在此面對前所未見的艱鉅挑戰。但在你直闖城塞大門之前，另一條刺探敵情之路正呼喚著你。深入擁有三個不同區域的全新五人地城–冰冠城塞：冰封大廳，在珍娜．普勞德摩爾或希瓦娜斯．風行者的帶領之下，闖入巫妖王的禁地。由珍娜和希瓦娜斯領頭，那些跟著來到此處的冒險者們很快的就發現面前擺著的武器正是霜之哀傷—巫妖王那把傳說中能使人墮落的武器。巫妖王的密室就在觸手可及的地方，但這也有可能是所有冒險至此的人的葬身之地。"
Inst92Caption = "倒影大廳"
Inst92QAA = "3 個任務"
Inst92QAH = "3 個任務"

--Quest 1 Alliance
Inst92Quest1 = "1. 霜之哀傷"
Inst92Quest1_Level = "80"
Inst92Quest1_Attain = "80"
Inst92Quest1_Aim = "在倒影大廳入口與珍娜．普勞德摩爾女士會合"
Inst92Quest1_Location = "珍娜．普勞德摩爾女士（薩倫之淵; "..YELLOW.."[3]"..WHITE.."）"
Inst92Quest1_Note = "在薩倫之淵的盡頭處由珍娜．普勞德摩爾女士給予此任務，完成任務後將進入倒影大廳。在進入下一步驟前請先確認隊伍中的成員都已經回報任務了。後續任務將在事件觸發完成後給予。"
Inst92Quest1_Prequest = "逃離深淵（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst92Quest1_Folgequest = "巫妖王之怒"
Inst92Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst92Quest2 = "2. 巫妖王之怒"
Inst92Quest2_Level = "80"
Inst92Quest2_Attain = "80"
Inst92Quest2_Aim = "找出珍娜．普勞德摩爾女士並且逃離倒影大廳。"
Inst92Quest2_Location = "倒影大廳"
Inst92Quest2_Note = "穿過斜坡上方可以看見珍娜．普勞德摩爾女士。在巫妖王追逐事件結束後可以向她回報任務。"
Inst92Quest2_Prequest = "霜之哀傷"
Inst92Quest2_Folgequest = "無"
Inst92Quest2FQuest = "true"
--
Inst92Quest2name1 = "冰霜紋章"

--Quest 3 Alliance
Inst92Quest3 = "3. 倒影大廳"
Inst92Quest3_Level = "80"
Inst92Quest3_Attain = "80"
Inst92Quest3_Aim = "把淬鍛的奎爾德拉帶去倒影大廳裡的劍息之地。"
Inst92Quest3_Location = "卡拉迪斯．亮矛（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.2, 31.3"..WHITE.."）"
Inst92Quest3_Note = "當你進入倒影大廳之時便可完成此任務。"
Inst92Quest3_Prequest = "淬鍊劍刃（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst92Quest3_Folgequest = "前往太陽之井"
Inst92Quest3PreQuest = "true"
-- No Rewards for this quest


--Quest 1 Horde
Inst92Quest1_HORDE = "1. 霜之哀傷"
Inst92Quest1_HORDE_Level = "80"
Inst92Quest1_HORDE_Attain = "80"
Inst92Quest1_HORDE_Aim = "在倒影大廳入口與希瓦娜斯．風行者女士會合"
Inst92Quest1_HORDE_Location = "希瓦娜斯．風行者女士（薩倫之淵; "..YELLOW.."[3]"..WHITE.."）"
Inst92Quest1_HORDE_Note = "在薩倫之淵的盡頭處由希瓦娜斯．風行者女士給予此任務，完成任務後將進入倒影大廳。在進入下一步驟前請先確認隊伍中的成員都已經回報任務了。後續任務將在事件觸發完成後給予。"
Inst92Quest1_HORDE_Prequest = "逃離深淵（"..YELLOW.."薩倫之淵"..WHITE.."）"
Inst92Quest1_HORDE_Folgequest = "巫妖王之怒"
Inst92Quest1PreQuest_HORDE = "true"
-- No Rewards for this quest

--Quest 2 Horde
Inst92Quest2_HORDE = "2. 巫妖王之怒"
Inst92Quest2_HORDE_Level = "80"
Inst92Quest2_HORDE_Attain = "80"
Inst92Quest2_HORDE_Aim = "找出希瓦娜斯．風行者女士並且逃離倒影大廳。"
Inst92Quest2_HORDE_Location = "倒影大廳"
Inst92Quest2_HORDE_Note = "穿過斜坡上方可以看見希瓦娜斯．風行者女士。在巫妖王追逐事件結束後可以向她回報任務。"
Inst92Quest2_HORDE_Prequest = "霜之哀傷"
Inst92Quest2_HORDE_Folgequest = "無"
Inst92Quest2FQuest_HORDE = "true"
--
Inst92Quest2name1_HORDE = "冰霜紋章"

--Quest 3 Horde
Inst92Quest3_HORDE = "3. 倒影大廳"
Inst92Quest3_HORDE_Level = "80"
Inst92Quest3_HORDE_Attain = "80"
Inst92Quest3_HORDE_Aim = "把淬鍛的奎爾德拉帶去倒影大廳裡的劍息之地。"
Inst92Quest3_HORDE_Location = "米拉連恩．日炎（冰冠城塞 - 奎爾德拉之眠; "..YELLOW.."74.5, 31.1"..WHITE.."）"
Inst92Quest3_HORDE_Note = "當你進入倒影大廳之時便可完成此任務。"
Inst92Quest3_HORDE_Prequest = "淬鍊劍刃（"..YELLOW.."眾魂熔爐"..WHITE.."）"
Inst92Quest3_HORDE_Folgequest = "前往太陽之井"
Inst92Quest3PreQuest_HORDE = "true"
-- No Rewards for this quest



--------------- INST93 - Icecrown Citadel (ICC)  ---------------

Inst93Story = "對抗天譴軍團的戰火在北裂境不斷蔓延著，自從聯盟與部落踏上這塊冰凍荒原之後，無數的生命因此而犧牲，但艾澤拉斯的勇士們依然勇往直前，誓要踏平天譴軍團的根基，巫妖王的立身之處–冰冠城塞。提里奧．弗丁和銀白十字軍與達瑞安．莫格萊尼和黯刃騎士團為了共同的目標而組成了一支灰燼裁決軍。這支聯軍之中最強大的戰鬥員，以及聯盟與部落的勇士將會率領大軍直搗城塞。在全新的冰冠城塞團隊地城中，艾澤拉斯的精銳們將會在冰封王座前面對前所未見的恐懼挑戰，而巫妖王與他的符文劍—霜之哀傷正坐鎮以待，等著將這些英雄們送上亡命的歸途。"
Inst93Caption = "冰冠城塞"
Inst93QAA = "15 個任務"
Inst93QAH = "15 個任務"

--Quest 1 Alliance
Inst93Quest1 = "1. 瑪洛嘉領主必須死! (每週團隊任務)"
Inst93Quest1_Level = "80"
Inst93Quest1_Attain = "80"
Inst93Quest1_Aim = "殺死瑪洛嘉領主。"
Inst93Quest1_Location = "大法師朗達拉克（達拉然 - 紫羅蘭堡; "..YELLOW.."57.6, 66.9"..WHITE.."）"
Inst93Quest1_Note = "瑪洛嘉領主在"..YELLOW.."[1]"..WHITE.."。\n\n每週團隊任務於一週內只能完成一次，且不限10人或25人模式。"
Inst93Quest1_Prequest = "無"
Inst93Quest1_Folgequest = "無"
--
Inst93Quest1name1 = "冰霜紋章"
Inst93Quest1name2 = "凱旋紋章"

--Quest 2 Alliance
Inst93Quest2 = "2. 改邪歸正 (隨機每週團隊任務)"
Inst93Quest2_Level = "80"
Inst93Quest2_Attain = "80"
Inst93Quest2_Aim = "在確保達納凡存活的情況之下擊敗亡語女士。"
Inst93Quest2_Location = "滲透者敏加（冰冠城塞; "..YELLOW.."靠近[1]"..WHITE.."）"
Inst93Quest2_Note = "如果這個任務於玩家此次的團隊ID中出現，滲透者敏加將會在你擊敗瑪洛嘉領主之後出現。\n\n在和亡語女士交戰時，達納凡便會和小兵群一起現身。玩家必須小心在不殺死他的情況下確保他的存活以完成此任務。"
Inst93Quest2_Prequest = "無"
Inst93Quest2_Folgequest = "無"
--
Inst93Quest2name1 = "寒霜寶藏袋"

--Quest 3 Alliance
Inst93Quest3 = "3. 攻佔壁壘 (隨機每週團隊任務)"
Inst93Quest3_Level = "80"
Inst93Quest3_Attain = "80"
Inst93Quest3_Aim = "殺掉腐爛的冰霜巨人。"
Inst93Quest3_Location = "破天者號中尉（冰冠城塞; "..GREEN.."[3']"..WHITE.."）"
Inst93Quest3_Note = "如果這個任務於玩家此次的團隊ID中出現，在你消滅亡語女士身後高台上的第一批小怪之後，破天者號中尉便會現身。\n\n你可以在壁壘週邊看見巡邏中的腐爛的冰霜巨人。"
Inst93Quest3_Prequest = "無"
Inst93Quest3_Folgequest = "無"
--
Inst93Quest3name1 = "寒霜寶藏袋"

--Quest 4 Alliance
Inst93Quest4 = "4. 殘渣有約 (隨機每週團隊任務)"
Inst93Quest4_Level = "80"
Inst93Quest4_Attain = "80"
Inst93Quest4_Aim = "在受到橘色荒疫殘渣與綠色荒疫殘渣感染的情況下，回去找鍊金師雅卓安娜。"
Inst93Quest4_Location = "鍊金師雅卓安娜（冰冠城塞; "..GREEN.."[4']"..WHITE.."）"
Inst93Quest4_Note = "如果這個任務於玩家此次的團隊ID中出現，鍊金師雅卓安娜將會在你完成死亡使者薩魯法爾事件之後現身。\n\n團隊中必須至少有一位成員同時得到膿腸與腐臉的橘色荒疫殘渣和綠色荒疫殘渣，並且在得到第一個荒疫殘渣之後的三十分鐘之內向鍊金師雅卓安娜回報任務。只要有一個成員完成，所有的團員皆可一併完成任務。"
Inst93Quest4_Page = {2, "玩家只要死亡、登出遊戲及得到神聖干涉、聖盾術或其它有可能的法術效果之後將會失去荒疫殘渣的減益法術效果。獵人只要裝死並且成功活下便可以留下荒疫殘渣的減益法術效果。", };
Inst93Quest4_Prequest = "無"
Inst93Quest4_Folgequest = "無"
--
Inst93Quest4name1 = "寒霜寶藏袋"

--Quest 5 Alliance
Inst93Quest5 = "5. 血脈噴張 (隨機每週團隊任務)"
Inst93Quest5_Level = "80"
Inst93Quest5_Attain = "80"
Inst93Quest5_Aim = "在滲透者敏加遭到處決之前把他救出來。"
Inst93Quest5_Location = "『捷巧』艾琳（冰冠城塞; 赤紅大廳入口）"
Inst93Quest5_Note = "如果這個任務於玩家此次的團隊ID中出現，『捷巧』艾琳便會在赤紅大廳的入口處現身。\n\n玩家必須在三十分鐘之內完成此任務，且計時從玩家一進入赤紅大廳便開始。你必須在時限之內擊敗所有的小兵、血親王和血腥女王菈娜薩爾以完成任務。"
Inst93Quest5_Prequest = "無"
Inst93Quest5_Folgequest = "無"
--
Inst93Quest5name1 = "寒霜寶藏袋"

--Quest 6 Alliance
Inst93Quest6 = "6. 受苦靈魂的安息 (隨機每週團隊任務)"
Inst93Quest6_Level = "80"
Inst93Quest6_Attain = "80"
Inst93Quest6_Aim = "使用生命水晶來保存辛德拉苟莎的精華。"
Inst93Quest6_Location = "瓦莉絲瑞雅．夢行者（冰冠城塞; "..YELLOW.."[11]"..WHITE.."）"
Inst93Quest6_Note = "如果這個任務於玩家此次的團隊ID中出現，瓦莉絲瑞雅．夢行者將會在戰役結束之後給予玩家任務。\n\n為了完成這個任務，團隊成員們必須使用任務給予的生命水晶，在辛德拉苟莎因血量剩餘20%或更少而呈現虛弱狀態時在她身上堆疊減益法術（即Debuff，10人模式疊到30，25人模式則疊到75）。如果成功了，辛德拉苟莎將會在死前出現靈魂保護的徵兆，那麼在擊敗她並拾取任務物品之後便可完成任務。"
Inst93Quest6_Prequest = "無"
Inst93Quest6_Folgequest = "無"
--
Inst93Quest6name1 = "寒霜寶藏袋"

--Quest 7 Alliance
Inst93Quest7 = "7. 聖潔與墮落"
Inst93Quest7_Level = "80"
Inst93Quest7_Attain = "80"
Inst93Quest7_Aim = "在冰冠城塞中，把『聖光報復』、25個原始薩鋼、『腐臉的酸性血液』以及『膿腸的酸性血液』放置在大領主莫格萊尼的符文熔爐。"
Inst93Quest7_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest7_Note = "這個任務僅限於戰士、聖騎士以及死亡騎士可以接受。大領主莫格萊尼的符文熔爐在冰冠城塞的入口。\n\n『腐臉的酸性血液』以及『膿腸的酸性血液』只有在25人副本模式才會掉落，且每個團隊在每次只有一個人可以拾取。"
Inst93Quest7_Prequest = "無"
Inst93Quest7_Folgequest = "暗影之鋒"
-- No Rewards for this quest

--Quest 8 Alliance
Inst93Quest8 = "8. 暗影之鋒"
Inst93Quest8_Level = "80"
Inst93Quest8_Attain = "80"
Inst93Quest8_Aim = "等待莫格萊尼為你鍛造武器。"
Inst93Quest8_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest8_Note = "看著莫格萊尼為你鍛造武器，並且在他完成之後向他領取。"
Inst93Quest8_Prequest = "聖潔與墮落"
Inst93Quest8_Folgequest = "眾魂宴"
Inst93Quest8FQuest = "true"
--
Inst93Quest8name1 = "暗影之鋒"

--Quest 9 Alliance
Inst93Quest9 = "9. 眾魂宴"
Inst93Quest9_Level = "80"
Inst93Quest9_Attain = "80"
Inst93Quest9_Aim = "大領主達瑞安．莫格萊尼要你進入冰冠城塞，使用暗影之鋒殺死1000名巫妖王的爪牙。你只能在10人或25人模式副本中吸取靈魂。"
Inst93Quest9_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest9_Note = "只要在冰冠城塞中進行戰鬥便能取得足夠的擊殺數。"
Inst93Quest9_Prequest = "暗影之鋒"
Inst93Quest9_Folgequest = "穢邪之能"
Inst93Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst93Quest10 = "10. 穢邪之能"
Inst93Quest10_Level = "80"
Inst93Quest10_Attain = "80"
Inst93Quest10_Aim = "大領主達瑞安．莫格萊尼要你為暗影之鋒注入穢邪威能，並且殺掉普崔希德教授。"
Inst93Quest10_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest10_Note = "此任務只能夠在25人模式的冰冠城塞中完成。\n\n為暗影之鋒注入穢邪威能，你必須在與普崔希德教授的交戰中控制住憎惡並且使用暗影注入。"
Inst93Quest10_Prequest = "眾魂宴"
Inst93Quest10_Folgequest = "血魄之能"
Inst93Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst93Quest11 = "11. 血魄之能"
Inst93Quest11_Level = "80"
Inst93Quest11_Attain = "80"
Inst93Quest11_Aim = "大領主達瑞安．莫格萊尼要你為暗影之鋒注入血魄的力量，並且擊敗血腥女王菈娜薩爾。"
Inst93Quest11_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest11_Note = "此任務只能夠在25人模式的冰冠城塞中完成。\n\n取得[血魄之鏡]的減益法術效果之後，如果你不是第一個被咬的人，則要有個人咬你。在咬過三個或更多人並且活下來之後便可完成任務。"
Inst93Quest11_Prequest = "穢邪之能"
Inst93Quest11_Folgequest = "冰霜之能"
Inst93Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst93Quest12 = "12. 冰霜之能"
Inst93Quest12_Level = "80"
Inst93Quest12_Attain = "80"
Inst93Quest12_Aim = "大領主達瑞安．莫格萊尼命令你去殺掉辛德拉苟莎，並且在佩帶暗影之鋒的期間，承受四次冰霜吐息攻擊。"
Inst93Quest12_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest12_Note = "此任務只能夠在25人模式的冰冠城塞中完成。\n\n在承受過四次冰霜吐息並且得到[霜注之刃]的增益效果之後，你必須在六分鐘之內擊敗辛德拉苟莎才能完成任務。"
Inst93Quest12_Prequest = "血魄之能"
Inst93Quest12_Folgequest = "破碎的王座"
Inst93Quest12FQuest = "true"
-- No Rewards for this quest

--Quest 13 Alliance
Inst93Quest13 = "13. 破碎的王座"
Inst93Quest13_Level = "80"
Inst93Quest13_Attain = "80"
Inst93Quest13_Aim = "大領主達瑞安．莫格萊尼要你去收集50個暗影冰晶裂片。"
Inst93Quest13_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest13_Note = "此任務只能夠在25人模式的冰冠城塞中完成。\n\n地城中的每位首領皆有機率掉落暗影冰晶裂片。"
Inst93Quest13_Prequest = "冰霜之能"
Inst93Quest13_Folgequest = "影之哀傷…"
Inst93Quest13FQuest = "true"
-- No Rewards for this quest

--Quest 14 Alliance
Inst93Quest14 = "14. 影之哀傷…"
Inst93Quest14_Level = "80"
Inst93Quest14_Attain = "80"
Inst93Quest14_Aim = "大領主達瑞安．莫格萊尼要你把暗影之鋒交給他。"
Inst93Quest14_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest14_Note = "此任務將會把你的暗影之鋒升級為影之哀傷。"
Inst93Quest14_Prequest = "破碎的王座"
Inst93Quest14_Folgequest = "巫妖王的末日"
Inst93Quest14FQuest = "true"
--
Inst93Quest14name1 = "影之哀傷"

--Quest 15 Alliance
Inst93Quest15 = "15. 巫妖王的末日"
Inst93Quest15_Level = "80"
Inst93Quest15_Attain = "80"
Inst93Quest15_Aim = "大領主達瑞安．莫格萊尼要你去冰冠城塞殺掉巫妖王。"
Inst93Quest15_Location = "大領主達瑞安．莫格萊尼（冰冠城塞; "..GREEN.."[1']"..WHITE.."）"
Inst93Quest15_Note = "此任務只能夠在25人模式的冰冠城塞中完成。"
Inst93Quest15_Prequest = "影之哀傷…"
Inst93Quest15_Folgequest = "無"
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
Inst93Quest3_HORDE = "3. 攻佔壁壘 (隨機每週團隊任務)"
Inst93Quest3_HORDE_Level = "80"
Inst93Quest3_HORDE_Attain = "80"
Inst93Quest3_HORDE_Aim = "殺掉腐爛的冰霜巨人。"
Inst93Quest3_HORDE_Location = "柯爾克隆中尉（冰冠城塞; "..GREEN.."[3']"..WHITE.."）"
Inst93Quest3_HORDE_Note = "如果這個任務於玩家此次的團隊ID中出現，在你消滅亡語女士身後高台上的第一批小怪之後，破天者號中尉便會出現。\n\n你可以在壁壘週邊看見巡邏中的腐爛的冰霜巨人。"
Inst93Quest3_HORDE_Prequest = "無"
Inst93Quest3_HORDE_Folgequest = "無"
--
Inst93Quest3name1_HORDE = "寒霜寶藏袋"

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

Inst94Story = "一支由強大的暮光巨龍哈利恩率領的黑龍軍團麾下部族向龍眠神殿下的晶紅聖所發起了攻擊。黑龍軍團想要通過摧毀聖殿來為主人奈薩里奧回歸艾澤拉斯大陸掃清道路，並最終毀滅各色巨龍的神聖契約——龍眠聯軍。\n\n這場襲擊目的將是重創紅龍軍團，然而你將需要阻止這場突襲並保衛晶紅聖所。首先你將需要面對哈利恩的僕從，薩維亞納．怒火，為戰鬥而生的巴爾薩魯斯和扎里斯利安將軍，然後方能挑戰暮光毀滅者哈利恩。"
Inst94Caption = "晶紅聖所"
Inst94QAA = "3 個任務"
Inst94QAH = "3 個任務"

--Quest 1 Alliance
Inst94Quest1 = "1. 龍眠神殿的麻煩"
Inst94Quest1_Level = "80"
Inst94Quest1_Attain = "80"
Inst94Quest1_Aim = "到龍骨荒野的龍眠神殿找卡薩斯談談。"
Inst94Quest1_Location = "羅甯（達拉然 - 紫羅蘭城塞; "..YELLOW.."30.5, 48.4"..WHITE.."）"
Inst94Quest1_Note = "卡薩斯（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）"
Inst94Quest1_Prequest = "無"
Inst94Quest1_Folgequest = "對聖所的攻擊"
-- No Rewards for this quest

--Quest 2 Alliance
Inst94Quest2 = "2. 對聖所的攻擊"
Inst94Quest2_Level = "80"
Inst94Quest2_Attain = "80"
Inst94Quest2_Aim = "調查龍眠神殿下的晶紅神殿。"
Inst94Quest2_Location = "卡薩斯（龍骨荒野 - 龍眠神殿; "..YELLOW.."59.8, 54.6"..WHITE.."）"
Inst94Quest2_Note = "聖所守護者克莉絲塔薩在晶紅聖所內，並且會在你擊敗巴爾薩魯斯"..YELLOW.."[4]"..WHITE.."之後現身。"
Inst94Quest2_Prequest = "龍眠神殿的麻煩（非必要的）"
Inst94Quest2_Folgequest = "暮光毀滅者"
Inst94Quest2FQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst94Quest3 = "3. 暮光毀滅者"
Inst94Quest3_Level = "80"
Inst94Quest3_Attain = "80"
Inst94Quest3_Aim = "擊敗海萊恩並擊退對晶紅聖所的入侵。"
Inst94Quest3_Location = "聖所守護者克莉絲塔薩（晶紅聖所; "..YELLOW.."[A] 入口"..WHITE.."）"
Inst94Quest3_Note = "海萊恩是晶紅聖所內的主要首領，位於"..YELLOW.."[1]"..WHITE.."。"
Inst94Quest3_Prequest = "對聖所的攻擊"
Inst94Quest3_Folgequest = "無"
Inst94Quest3FQuest = "true"
--
Inst94Quest3name1 = "冰霜紋章"


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

Inst33Story = "很久以前，早在第一次大戰獸人入侵艾澤拉斯之前，獸人術士古爾丹將一群被稱作“霜狼”的獸人氏族流放到了奧特蘭克山脈深處一個不為人知的峽谷中。霜狼氏族艱難地在這座峽谷的南部生存，直到索爾找到他們。\n在索爾成功地將各個獸人氏族重新聯合起來之後，由薩滿德雷克塔爾領導的霜狼氏族決定繼續在這個他們很久以來一直稱之為家的山谷中生活。但是最近這些日子，這裡的平靜生活被矮人的雷矛部族遠征隊打破了。\n雷矛部族在奧特蘭克山谷中建立了基地安頓下來並找尋自然資源及古老遺跡。不管他們的意圖如何，雷矛部族的出現已挑起了和南部的霜狼氏族間的衝突，霜狼氏族發誓要將入侵者趕出自己的家園。"
Inst33Caption = "奧特蘭克山谷"
Inst33QAA = "18 個任務"
Inst33QAH = "18 個任務"

--Quest 1 Alliance
Inst33Quest1 = "1. 戰鬥的號角:奧特蘭克山谷 (戰場每日)"
Inst33Quest1_Level = "51"
Inst33Quest1_Attain = "51"
Inst33Quest1_Aim = "在奧特蘭克山谷的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst33Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst33Quest1_Note = "戰場每日任務，完成任務會基於你的級別獎勵金錢和經驗。"
Inst33Quest1_Prequest = "無"
Inst33Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst33Quest2 = "2. 國王的命令"
Inst33Quest2_Level = "60"
Inst33Quest2_Attain = "51"
Inst33Quest2_Aim = "到希爾斯布萊德丘陵地區的奧特蘭克山谷去。到那裡之後，和哈格丁中尉談談。"
Inst33Quest2_Location = "洛泰姆中尉（鐵爐堡 - 平民區; "..YELLOW.."30,62"..WHITE.."）"
Inst33Quest2_Note = "哈格丁中尉在（奧特蘭克山脈 - 奧特蘭克山谷; "..YELLOW.."39,81"..WHITE.."）。"
Inst33Quest2_Prequest = "無"
Inst33Quest2_Folgequest = "試煉場"
-- No Rewards for this quest

--Quest 3 Alliance
Inst33Quest3 = "3. 試煉場"
Inst33Quest3_Level = "60"
Inst33Quest3_Attain = "51"
Inst33Quest3_Aim = "到奧特蘭克山谷的丹巴達爾西南邊找到冰翼洞穴，取得雷矛軍旗。然後把軍旗交給奧特蘭克山脈的哈格丁中尉。"
Inst33Quest3_Location = "哈格丁中尉（奧特蘭克山谷; "..YELLOW.."39,81"..WHITE.."）"
Inst33Quest3_Note = "雷矛軍旗在冰翼洞穴"..YELLOW.."[11]"..WHITE.."，奧特蘭克山谷北部地圖。當你聲望提升到一個新的等級後，你可以與同一個NPC交談領取更高級的雷矛徽章。"
Inst33Quest3_Prequest = "國王的命令"
Inst33Quest3_Folgequest = "無"
Inst33Quest3FQuest = "true"
--
Inst33Quest3name1 = "1級雷矛徽記"
Inst33Quest3name2 = "霜狼牌洋蔥"

--Quest 4 Alliance
Inst33Quest4 = "4. 霜狼地圖"
Inst33Quest4_Level = "60"
Inst33Quest4_Attain = "51"
Inst33Quest4_Aim = "進入奧特蘭克山谷並擊敗部落將軍德雷克塔爾。然後，再回去找奧特蘭克山脈的勘察員塔雷．石鎬。"
Inst33Quest4_Location = "勘察員塔雷．石鎬（奧特蘭克山脈 - 奧特蘭克山谷; "..YELLOW.."41,78"..WHITE.."）和\n(奧特蘭克山谷 - 北部地圖; "..YELLOW.."[B]"..WHITE.."）"
Inst33Quest4_Note = "部落將軍德雷克塔爾在（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[B]"..WHITE.."）。完成這個任務並不一定需要殺死德雷克塔爾，只要贏得奧特蘭克山谷的戰鬥即可。"
Inst33Quest4_Prequest = "勘察員塔雷．石鎬"
Inst33Quest4_Folgequest = "雷矛英雄"
--
Inst33Quest4name1 = "覓血者"
Inst33Quest4name2 = "冰刺長矛"
Inst33Quest4name3 = "骨寒魔杖"
Inst33Quest4name4 = "冰冷鑄錘"

--Quest 5 Alliance
Inst33Quest5 = "5. 雷矛軍需官"
Inst33Quest5_Level = "60"
Inst33Quest5_Attain = "51"
Inst33Quest5_Aim = "與雷矛軍需官談話。"
Inst33Quest5_Location = "巡山人布比羅（奧特蘭克山谷 - 北部地圖; "..YELLOW.."41,15"..WHITE.."）"
Inst33Quest5_Note = "雷矛軍需官在（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[7]"..WHITE.."）。"
Inst33Quest5_Prequest = "無"
Inst33Quest5_Folgequest = "無"
-- No Rewards for this quest

--Quest 6 Alliance
Inst33Quest6 = "6. 冷齒礦坑補給品"
Inst33Quest6_Level = "60"
Inst33Quest6_Attain = "51"
Inst33Quest6_Aim = "把10份冷齒礦坑補給品交給丹巴達爾的聯盟軍需官。"
Inst33Quest6_Location = "雷矛軍需官（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[7]"..WHITE.."）"
Inst33Quest6_Note = "補給品可以在冷齒礦坑找到（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[6]"..WHITE.."）。"
Inst33Quest6_Prequest = "無"
Inst33Quest6_Folgequest = "無"
-- No Rewards for this quest

--Quest 7 Alliance
Inst33Quest7 = "7. 深鐵礦坑補給品"
Inst33Quest7_Level = "60"
Inst33Quest7_Attain = "51"
Inst33Quest7_Aim = "把10份深鐵礦坑補給品交給丹巴達爾的聯盟軍需官。"
Inst33Quest7_Location = "雷矛軍需官（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[7]"..WHITE.."）"
Inst33Quest7_Note = "補給品可以在深鐵礦坑找到（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[1]"..WHITE.."）。"
Inst33Quest7_Prequest = "無"
Inst33Quest7_Folgequest = "無"
-- No Rewards for this quest

--Quest 8 Alliance
Inst33Quest8 = "8. 護甲碎塊"
Inst33Quest8_Level = "60"
Inst33Quest8_Attain = "51"
Inst33Quest8_Aim = "給丹巴達爾的莫高特．深爐帶去20塊護甲碎塊。"
Inst33Quest8_Location = "莫高特．深爐（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[4]"..WHITE.."）"
Inst33Quest8_Note = "護甲碎片可以從對方陣營的玩家屍體中拾取，任務是可重複的。"
Inst33Quest8_Prequest = "無"
Inst33Quest8_Folgequest = "更多的護甲碎塊"
-- No Rewards for this quest

--Quest 9 Alliance
Inst33Quest9 = "9. 佔領礦坑"
Inst33Quest9_Level = "60"
Inst33Quest9_Attain = "51"
Inst33Quest9_Aim = "佔領一座還沒有被雷矛部族控制的礦坑，然後向丹巴達爾的雷矛軍需官覆命。"
Inst33Quest9_Location = "杜爾根．雷矛中士（奧特蘭克山谷; "..YELLOW.."37,78"..WHITE.."）"
Inst33Quest9_Note = "要完成這個任務，你需要殺死礦坑中的頭目（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[1]"..WHITE.."）或 （奧特蘭克山谷 - 南部地圖; "..YELLOW.."[6]"..WHITE.."）以控制礦坑。"
Inst33Quest9_Prequest = "無"
Inst33Quest9_Folgequest = "無"
-- No Rewards for this quest

--Quest 10 Alliance
Inst33Quest10 = "10. 哨塔和碉堡"
Inst33Quest10_Level = "60"
Inst33Quest10_Attain = "51"
Inst33Quest10_Aim = "摧毀敵方的某座哨塔或者碉堡中的旗幟，然後向奧特蘭克山脈的杜爾根．雷矛覆命。"
Inst33Quest10_Location = "杜爾根．雷矛（奧特蘭克山谷; "..YELLOW.."37,78"..WHITE.."）"
Inst33Quest10_Note = "只需要燒毀旗幟即可，不需要一定摧毀哨塔或碉堡。"
Inst33Quest10_Prequest = "無"
Inst33Quest10_Folgequest = "無"
-- No Rewards for this quest

--Quest 11 Alliance
Inst33Quest11 = "11. 奧特蘭克山谷的墓地"
Inst33Quest11_Level = "60"
Inst33Quest11_Attain = "51"
Inst33Quest11_Aim = "佔領一座墓地，然後向奧特蘭克山脈的諾雷格．雷矛中尉覆命。"
Inst33Quest11_Location = "諾雷格．雷矛（奧特蘭克山谷; "..YELLOW.."37,78"..WHITE.."）"
Inst33Quest11_Note = "只需要燒毀旗幟即可，不需要一定佔領墓地。"
Inst33Quest11_Prequest = "無"
Inst33Quest11_Folgequest = "無"
-- No Rewards for this quest

--Quest 12 Alliance
Inst33Quest12 = "12. 補充坐騎"
Inst33Quest12_Level = "60"
Inst33Quest12_Attain = "51"
Inst33Quest12_Aim = "找到奧特蘭克山谷中的山羊。使用雷矛訓練項圈來馴服它們。被馴服的山羊會跟隨你回到獸欄管理員那裡，然後與獸欄管理員談話以獲得你的獎勵。"
Inst33Quest12_Location = "獸欄管理員（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[6]"..WHITE.."）"
Inst33Quest12_Note = "你可以在基地南面找到這些羊，像獵人抓寵物一樣馴服羊，然後帶它回去覆命。"
Inst33Quest12_Prequest = "無"
Inst33Quest12_Folgequest = "無"
-- No Rewards for this quest

--Quest 13 Alliance
Inst33Quest13 = "13. 山羊座具"
Inst33Quest13_Level = "60"
Inst33Quest13_Attain = "51"
Inst33Quest13_Aim = "你必須去攻擊敵人的基地，殺死他們的霜狼坐騎，然後拿回他們的皮。把它們的皮交給我，這樣我就可以幫我們的騎兵製作鞍具了。出發吧！"
Inst33Quest13_Location = "雷矛山羊騎兵指揮官（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[6]"..WHITE.."）"
Inst33Quest13_Note = "霜狼可以在奧特蘭克山谷的南部找到。"
Inst33Quest13_Prequest = "無"
Inst33Quest13_Folgequest = "無"
-- No Rewards for this quest

--Quest 14 Alliance
Inst33Quest14 = "14. 水晶簇"
Inst33Quest14_Level = "60"
Inst33Quest14_Attain = "51"
Inst33Quest14_Aim = "你可以避開硝煙彌漫的戰場。在激烈的戰鬥之外，幫我收集霜狼氏族的風暴水晶。議會正在收集這樣的水晶！"
Inst33Quest14_Location = "大德魯伊雷弗拉爾 （奧特蘭克山谷 - 北部地圖; "..YELLOW.."[2]"..WHITE.."）"
Inst33Quest14_Note = "交出200份或更多的水晶後，大德魯伊雷弗拉爾將會開始走向（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[19]"..WHITE.."）。之後他將會需要10名玩家幫助他進行召喚儀式。如果召喚儀式成功了，『森林之王』伊弗斯將會被召喚出來攻擊部落玩家。"
Inst33Quest14_Prequest = "無"
Inst33Quest14_Folgequest = "無"
-- No Rewards for this quest

--Quest 15 Alliance
Inst33Quest15 = "15. 『森林之王』伊弗斯"
Inst33Quest15_Level = "60"
Inst33Quest15_Attain = "51"
Inst33Quest15_Aim = "霜狼氏族被一種墮落的元素能量保護著。如果我們不加以注意的話，他們的薩滿必然會利用這種力量來毀掉我們。這種能量已經不是議會可以控制的了！我們必須找到伊弗斯，尋求他的幫助。霜狼氏族的戰士身上帶著一種名叫暴風水晶的符咒，我們可以用這些符咒來召喚伊弗斯。快去拿來那些水晶吧！"
Inst33Quest15_Location = "大德魯伊雷弗拉爾（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[2]"..WHITE.."）"
Inst33Quest15_Note = "大概需要200個暴風水晶就能夠召喚。"
Inst33Quest15_Prequest = "無"
Inst33Quest15_Folgequest = "無"
-- No Rewards for this quest

--Quest 16 Alliance
Inst33Quest16 = "16. 天空的召喚 - 維波里的空軍"
Inst33Quest16_Level = "60"
Inst33Quest16_Attain = "51"
Inst33Quest16_Aim = "你必須去對付守衛前線的部落精英士兵！我現在命令你去削弱那些綠皮蠻子的力量，把他們的中尉和軍團士兵的勳章給我拿來。當我拿到足夠的勳章時，我會命令開始對他們進行空中打擊的。"
Inst33Quest16_Location = "空軍指揮官維波里（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest16_Note = "你可以從對方陣營的屍體上得到這些勳章。"
Inst33Quest16_Prequest = "無"
Inst33Quest16_Folgequest = "無"
-- No Rewards for this quest

--Quest 17 Alliance
Inst33Quest17 = "17. 天空的召喚 - 斯里多爾的空軍"
Inst33Quest17_Level = "60"
Inst33Quest17_Attain = "51"
Inst33Quest17_Aim = "我的獅鷲獸應該在前線作戰，但是在那裡的敵人被削弱之前，它們是無法發動攻擊的。部落的戰士胸前掛著代表榮譽的勳章勇猛衝鋒，而你要做的就是從他們腐爛的屍體上把勳章拿下來，並把它們交給我。只要敵人在前線的力量受到足夠的打擊，我就會發出命令進行空襲！我們將從空中給敵人造成致命的創傷！！"
Inst33Quest17_Location = "空軍指揮官斯里多爾（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest17_Note = "你可以從對方陣營的屍體上得到這些勳章。"
Inst33Quest17_Prequest = "無"
Inst33Quest17_Folgequest = "無"
-- No Rewards for this quest

--Quest 18 Alliance
Inst33Quest18 = "18. 天空的召喚 - 艾克曼的空軍"
Inst33Quest18_Level = "60"
Inst33Quest18_Attain = "51"
Inst33Quest18_Aim = "它們的士氣很低，戰士。自從我們上次對部落的空中打擊失敗之後，它們就拒絕再次飛行！你必須鼓舞它們的士氣。回到戰場並攻擊部落的核心力量，殺死他們的指揮官和衛兵。盡可能帶回更多的勳章！我向你保證，當我的獅鷲獸看到這些戰利品並嗅到敵人的鮮血時，它們就會再次起飛！現在就出發吧！"
Inst33Quest18_Location = "空軍指揮官艾克曼（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest18_Note = "你可以從對方陣營的屍體上得到這些勳章。"
Inst33Quest18_Prequest = "無"
Inst33Quest18_Folgequest = "無"
-- No Rewards for this quest


--Quest 1 Horde
Inst33Quest1_HORDE = "1. 戰鬥的號角:奧特蘭克山谷 (戰場每日)"
Inst33Quest1_HORDE_Level = "51"
Inst33Quest1_HORDE_Attain = "51"
Inst33Quest1_HORDE_Aim = "在奧特蘭克山谷的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst33Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst33Quest1_HORDE_Note = "戰場每日任務，完成任務會基於你的級別獎勵金錢和經驗。"
Inst33Quest1_HORDE_Prequest = "無"
Inst33Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Horde
Inst33Quest2_HORDE = "2. 保衛霜狼氏族"
Inst33Quest2_HORDE_Level = "60"
Inst33Quest2_HORDE_Attain = "51"
Inst33Quest2_HORDE_Aim = "到希爾斯布萊德丘陵地區的奧特蘭克山谷去。找到拉格隆德並和他談談，然後成為霜狼氏族的士兵。"
Inst33Quest2_HORDE_Location = "霜狼大使洛蔻斯（奧格瑪 - 力量谷 "..YELLOW.."50,71"..WHITE.."）"
Inst33Quest2_HORDE_Note = "拉格隆德（奧特蘭克山脈; "..YELLOW.."62,59"..WHITE.."）。"
Inst33Quest2_HORDE_Prequest = "無"
Inst33Quest2_HORDE_Folgequest = "試煉場"
-- No Rewards for this quest

--Quest 3 Horde
Inst33Quest3_HORDE = "3. 試煉場"
Inst33Quest3_HORDE_Level = "60"
Inst33Quest3_HORDE_Attain = "51"
Inst33Quest3_HORDE_Aim = "到主基地東南邊的蠻爪洞穴中去找到霜狼軍旗，然後把它交給拉格隆德。"
Inst33Quest3_HORDE_Location = "拉格隆德（奧特蘭克山脈; "..YELLOW.."62,59"..WHITE.."）"
Inst33Quest3_HORDE_Note = "霜狼軍旗在蠻爪洞穴裡面（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[15]"..WHITE.."）。當你聲望提升到一個新的等級後，你可以與同一個NPC交談領取更高級的霜狼徽記。"
Inst33Quest3_HORDE_Prequest = "保衛霜狼氏族"
Inst33Quest3_HORDE_Folgequest = "無"
Inst33Quest3FQuest_HORDE = "true"
--
Inst33Quest3name1_HORDE = "1級霜狼徽記"
Inst33Quest3name2_HORDE = "剝洋蔥"

--Quest 4 Horde
Inst33Quest4_HORDE = "4. 雷矛戰鬥計畫"
Inst33Quest4_HORDE_Level = "60"
Inst33Quest4_HORDE_Attain = "51"
Inst33Quest4_HORDE_Aim = "進入奧特蘭克山谷並擊敗矮人將軍范達爾．雷矛。然後，再回去找奧特蘭克山脈的沃加．死爪。"
Inst33Quest4_HORDE_Location = "沃加．死爪（奧特蘭克山脈; "..YELLOW.."64,60"..WHITE.."）"
Inst33Quest4_HORDE_Note = "范達爾．雷矛在（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[B]"..WHITE.."）。完成這個任務並不一定需要殺死范達爾．雷矛，只要贏得奧特蘭克山谷的戰鬥即可。"
Inst33Quest4_HORDE_Prequest = "無"
Inst33Quest4_HORDE_Folgequest = "霜狼氏族的英雄"
--
Inst33Quest4name1_HORDE = "覓血者"
Inst33Quest4name2_HORDE = "冰刺長矛"
Inst33Quest4name3_HORDE = "骨寒魔杖"
Inst33Quest4name4_HORDE = "冰冷鑄錘"

--Quest 5 Horde
Inst33Quest5_HORDE = "5. 霜狼軍需官"
Inst33Quest5_HORDE_Level = "60"
Inst33Quest5_HORDE_Attain = "51"
Inst33Quest5_HORDE_Aim = "與霜狼軍需官談話。"
Inst33Quest5_HORDE_Location = "喬泰克（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest5_HORDE_Note = "霜狼軍需官在"..YELLOW.."[10]"..WHITE.."。"
Inst33Quest5_HORDE_Prequest = "無"
Inst33Quest5_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 6 Horde
Inst33Quest6_HORDE = "6. 冷齒礦坑補給品"
Inst33Quest6_HORDE_Level = "60"
Inst33Quest6_HORDE_Attain = "51"
Inst33Quest6_HORDE_Aim = "把10份冷齒礦坑補給品交給霜狼要塞的霜狼軍需官。"
Inst33Quest6_HORDE_Location = "霜狼軍需官（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[10]"..WHITE.."）"
Inst33Quest6_HORDE_Note = "補給品可以在冷齒礦坑（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[6]"..WHITE.."）中找到。"
Inst33Quest6_HORDE_Prequest = "無"
Inst33Quest6_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 7 Horde
Inst33Quest7_HORDE = "7. 深鐵礦坑補給品"
Inst33Quest7_HORDE_Level = "60"
Inst33Quest7_HORDE_Attain = "51"
Inst33Quest7_HORDE_Aim = "把10份深鐵礦坑補給品交給霜狼要塞的霜狼軍需官。"
Inst33Quest7_HORDE_Location = "霜狼軍需官（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[10]"..WHITE.."）"
Inst33Quest7_HORDE_Note = "補給品可以在深鐵礦坑（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[1]"..WHITE.."）中找到。"
Inst33Quest7_HORDE_Prequest = "無"
Inst33Quest7_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 8 Horde
Inst33Quest8_HORDE = "8. 取之於敵"
Inst33Quest8_HORDE_Level = "60"
Inst33Quest8_HORDE_Attain = "51"
Inst33Quest8_HORDE_Aim = "當你和敵人作戰的時候，別忘了幫我收集他們的護甲碎塊。我會用這些碎塊來給我們自己的軍隊製造護甲！"
Inst33Quest8_HORDE_Location = "鐵匠雷格薩（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest8_HORDE_Note = "護甲碎片可以從對方陣營的玩家屍體中拾取，任務是可重複的。"
Inst33Quest8_HORDE_Prequest = "無"
Inst33Quest8_HORDE_Folgequest = "更多碎塊！"
-- No Rewards for this quest

--Quest 9 Horde
Inst33Quest9_HORDE = "9. 佔領礦坑"
Inst33Quest9_HORDE_Level = "60"
Inst33Quest9_HORDE_Attain = "51"
Inst33Quest9_HORDE_Aim = "佔領一座礦坑，然後回去找奧特蘭克山脈的提卡．血牙下士。"
Inst33Quest9_HORDE_Location = "提卡．血牙下士（奧特蘭克山脈; "..YELLOW.."66,55"..WHITE.."）"
Inst33Quest9_HORDE_Note = "要完成這個任務，你需要殺死礦洞中的頭目（奧特蘭克山谷 - 北部地圖; "..YELLOW.."[1]"..WHITE.."）或（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[6]"..WHITE.."）以控制礦坑。"
Inst33Quest9_HORDE_Prequest = "無"
Inst33Quest9_HORDE_Folgequest ="無"
-- No Rewards for this quest

--Quest 10 Horde
Inst33Quest10_HORDE = "10. 哨塔和碉堡"
Inst33Quest10_HORDE_Level = "60"
Inst33Quest10_HORDE_Attain = "51"
Inst33Quest10_HORDE_Aim = "佔領敵方的某座哨塔，然後向奧特蘭克山脈的提卡．血牙下士覆命。"
Inst33Quest10_HORDE_Location = "提卡．血牙下士（奧特蘭克山脈; "..YELLOW.."66,55"..WHITE.."）"
Inst33Quest10_HORDE_Note = "只需要燒毀旗幟即可，不需要一定摧毀哨塔或碉堡。"
Inst33Quest10_HORDE_Prequest = "無"
Inst33Quest10_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 11 Horde
Inst33Quest11_HORDE = "11. 奧特蘭克山谷的墓地"
Inst33Quest11_HORDE_Level = "60"
Inst33Quest11_HORDE_Attain = "51"
Inst33Quest11_HORDE_Aim = "佔領一座墓地，然後向奧特蘭克山脈的提卡．血牙下士覆命。"
Inst33Quest11_HORDE_Location = "提卡．血牙下士（奧特蘭克山脈; "..YELLOW.."66,55"..WHITE.."）"
Inst33Quest11_HORDE_Note = "只需要燒毀旗幟即可，不需要一定佔領墓地。"
Inst33Quest11_HORDE_Prequest = "無"
Inst33Quest11_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 12 Horde
Inst33Quest12_HORDE = "12. 補充坐騎"
Inst33Quest12_HORDE_Level = "60"
Inst33Quest12_HORDE_Attain = "51"
Inst33Quest12_HORDE_Aim = "找到奧特蘭克山谷中的霜狼。使用霜狼口套來馴服它們。被馴服的霜狼會跟隨你回到獸欄管理員那裡，然後與獸欄管理員談話以獲得你的獎勵。"
Inst33Quest12_HORDE_Location = "獸欄管理員（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[9]"..WHITE.."）"
Inst33Quest12_HORDE_Note = "你可以在基地外面看到這些霜狼。像獵人抓寵物一樣馴服羊，然後帶它回去覆命。"
Inst33Quest12_HORDE_Prequest = "無"
Inst33Quest12_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 13 Horde
Inst33Quest13_HORDE = "13. 羊皮座具"
Inst33Quest13_HORDE_Level = "60"
Inst33Quest13_HORDE_Attain = "51"
Inst33Quest13_HORDE_Aim = "你必須去獵捕這個地區的山羊，也就是那些與雷矛騎兵的坐騎很相似的山羊！殺了它們，把它們的皮交給我。只要收集到足夠多的羊皮，我們就可以開始為騎手們製作坐具了。霜狼部族的狼騎兵很快就將再次馳騁在戰場上！"
Inst33Quest13_HORDE_Location = "霜狼騎兵指揮官（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[9]"..WHITE.."）"
Inst33Quest13_HORDE_Note = "山羊可以在奧特蘭克山谷的北部找到。"
Inst33Quest13_HORDE_Prequest = "無"
Inst33Quest13_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 14 Horde
Inst33Quest14_HORDE = "14. 聯盟之血"
Inst33Quest14_HORDE_Level = "60"
Inst33Quest14_HORDE_Attain = "51"
Inst33Quest14_HORDE_Aim = "你可以為我提供更多敵人的鮮血。我很樂意接受更多。"
Inst33Quest14_HORDE_Location = "原獵者瑟魯加（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest14_HORDE_Note = "交出150分或更多的血後，原獵者瑟魯加將會開始走向 (奧特蘭克山谷 - 南部地圖; "..YELLOW.."[1]"..WHITE..")。之後她將會需要10名玩家幫助她進行召喚儀式。如果召喚儀式成功了，『冰雪之王』洛克霍拉將會被召喚出來攻擊聯盟玩家。"
Inst33Quest14_HORDE_Prequest = "無"
Inst33Quest14_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 15 Horde
Inst33Quest15_HORDE = "15. 『冰雪之王』洛克霍拉"
Inst33Quest15_HORDE_Level = "60"
Inst33Quest15_HORDE_Attain = "51"
Inst33Quest15_HORDE_Aim = "凱恩親自指示我在眼前這個艱難的時刻協助霜狼氏族。我們簡單明瞭地說吧，你必須擊倒我們的敵人，把他們的鮮血交給我。一旦我收集到了足夠的鮮血，召喚儀式就可以開始了。當元素之王衝入矮人的部隊中時，勝利就是我們的了。"
Inst33Quest15_HORDE_Location = "原獵者瑟魯加 （奧特蘭克山谷 - 南部地圖; "..YELLOW.."[8]"..WHITE.."）"
Inst33Quest15_HORDE_Note = "大概需要150個聯盟之血就能夠召喚。"
Inst33Quest15_HORDE_Prequest = "無"
Inst33Quest15_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 16 Horde
Inst33Quest16_HORDE = "16. 天空的召喚 - 古斯的部隊"
Inst33Quest16_HORDE_Level = "60"
Inst33Quest16_HORDE_Attain = "51"
Inst33Quest16_HORDE_Aim = "我們必須準備新的空軍部隊！我們的馭風者已經準備就緒了，但是首先，我必須讓它們吃飽喝足，這樣它們才能做好突擊的準備！雷矛士兵總會隨身帶著一些肉，從他們那裡把肉搶過來，讓我們的雙足飛龍吃飽！我相信你可以辦成這件事的，對不對？出發吧！"
Inst33Quest16_HORDE_Location = "空軍指揮官古斯（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[13]"..WHITE.."）"
Inst33Quest16_HORDE_Note = "你可以從對方陣營的屍體上得到這些東西。"
Inst33Quest16_HORDE_Prequest = "無"
Inst33Quest16_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 17 Horde
Inst33Quest17_HORDE = "17. 天空的召喚 - 傑斯托的部隊"
Inst33Quest17_HORDE_Level = "60"
Inst33Quest17_HORDE_Attain = "51"
Inst33Quest17_HORDE_Aim = "我的馭風者部隊要在吃飽之後才能對敵人發起突襲！我的部隊在我們的空軍中實力排名第二，它們將對敵人最強的部隊發起進攻。因此它們也需要優質的食物，從雷矛士官那裡搶奪他們隨身攜帶的生肉吧。快點出發，勇士！"
Inst33Quest17_HORDE_Location = "空軍指揮官傑斯托 （奧特蘭克山谷 - 南部地圖; "..YELLOW.."[13]"..WHITE.."）"
Inst33Quest17_HORDE_Note = "你可以從對方陣營的屍體上得到這些東西。"
Inst33Quest17_HORDE_Prequest = "無"
Inst33Quest17_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 18 Horde
Inst33Quest18_HORDE = "18. 天空的召喚 - 穆維裡克的部隊"
Inst33Quest18_HORDE_Level = "60"
Inst33Quest18_HORDE_Attain = "51"
Inst33Quest18_HORDE_Aim = "我曾經被終日鎖在一個矮小的洞穴裡，我要報仇！我們必須仔細計畫一下。首先，我的馭風者必須吃到最優質的食物，才能儲備精力以待發起攻擊。從雷矛指揮官那裡搶一些生肉來餵養它們。不幸的是，那些可惡的傢伙都躲在最後方！顯然，你面臨的是一個艱鉅的任務。"
Inst33Quest18_HORDE_Location = "空軍指揮官穆維裡克（奧特蘭克山谷 - 南部地圖; "..YELLOW.."[13]"..WHITE.."）"
Inst33Quest18_HORDE_Note = "你可以從對方陣營的屍體上得到這些東西。"
Inst33Quest18_HORDE_Prequest = "無"
Inst33Quest18_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST34 - Arathi Basin (AB) ---------------

Inst34Story = "位於阿拉希高地的阿拉希盆地，是一處快速而激動人心的戰場。這個盆地擁有豐富的資源，部落和聯盟都對這塊寶地垂涎不已。被遺忘的污染者和阿拉索聯軍已到達阿拉希盆地並展開激戰，想要為他們所在的陣營搶奪盆地中的資源。"
Inst34Caption = "阿拉希盆地"
Inst34QAA = "4 個任務"
Inst34QAH = "4 個任務"

--Quest 1 Alliance
Inst34Quest1 = "1. 戰鬥的號角:阿拉希盆地 (戰場每日)"
Inst34Quest1_Level = "20"
Inst34Quest1_Attain = "20"
Inst34Quest1_Aim = "在阿拉希盆地的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst34Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst34Quest1_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst34Quest1_Prequest = "無"
Inst34Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Alliance
Inst34Quest2 = "2. 阿拉希盆地之戰!"
Inst34Quest2_Level = "25"
Inst34Quest2_Attain = "25"
Inst34Quest2_Aim = "進攻礦坑、伐木場、鐵匠鋪和農場，然後向避難谷地的奧斯萊特元帥覆命。"
Inst34Quest2_Location = "奧斯萊特元帥（阿拉希高地 - 避難谷地; "..YELLOW.."46,45"..WHITE.."）"
Inst34Quest2_Note = "任務所要進攻的地點標示於地圖中的2-5，只要開旗子就可以完成任務。"
Inst34Quest2_Prequest = "無"
Inst34Quest2_Folgequest = "無"
-- No Rewards for this quest

--Quest 3 Alliance
Inst34Quest3 = "3. 控制四座基地"
Inst34Quest3_Level = "60"
Inst34Quest3_Attain = "60"
Inst34Quest3_Aim = "進入阿拉希盆地，同時佔據並控制4座基地，完成任務之後回報避難谷地的奧斯萊特元帥。"
Inst34Quest3_Location = "奧斯萊特元帥（阿拉希高地 - 避難谷地; "..YELLOW.."46,45"..WHITE.."）"
Inst34Quest3_Note = "你必須與阿拉索聯軍的聲望達到友善才能接到這個任務。"
Inst34Quest3_Prequest = "無"
Inst34Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst34Quest4 = "4. 控制五座基地"
Inst34Quest4_Level = "60"
Inst34Quest4_Attain = "60"
Inst34Quest4_Aim = "同時控制阿拉希盆地中的5座基地，然後向避難谷地的奧斯萊特元帥覆命。"
Inst34Quest4_Location = "奧斯萊特元帥（阿拉希高地 - 避難谷地; "..YELLOW.."46,45"..WHITE.."）"
Inst34Quest4_Note = "你必須與阿拉索聯軍的聲望達到崇拜才能接到這個任務。"
Inst34Quest4_Prequest = "無"
Inst34Quest4_Folgequest = "無"
--
Inst34Quest4name1 = "阿拉索軍服"


--Quest 1 Horde
Inst34Quest1_HORDE = "1. 戰鬥的號角:阿拉希盆地 (戰場每日)"
Inst34Quest1_HORDE_Level = "20"
Inst34Quest1_HORDE_Attain = "20"
Inst34Quest1_HORDE_Aim = "在阿拉希盆地的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst34Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst34Quest1_HORDE_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst34Quest1_HORDE_Prequest = "無"
Inst34Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 2 Horde
Inst34Quest2_HORDE = "2. 阿拉希盆地之戰!"
Inst34Quest2_HORDE_Level = "25"
Inst34Quest2_HORDE_Attain = "25"
Inst34Quest2_HORDE_Aim = "進攻阿拉希盆地的礦坑、伐木場、鐵匠鋪和獸欄，然後向落錘鎮的屠殺者杜維爾覆命。"
Inst34Quest2_HORDE_Location = "屠殺者杜維爾（阿拉希高地 - 落錘鎮; "..YELLOW.."74,35"..WHITE.."）"
Inst34Quest2_HORDE_Note = "任務所要進攻的地點標示於地圖中的1-4，只要開旗子就可以完成任務。"
Inst34Quest2_HORDE_Prequest = "No"
Inst34Quest2_HORDE_Folgequest = "No"
-- No Rewards for this quest

--Quest 3 Horde
Inst34Quest3_HORDE = "3. 奪取四座基地"
Inst34Quest3_HORDE_Level = "60"
Inst34Quest3_HORDE_Attain = "60"
Inst34Quest3_HORDE_Aim = "同時佔據阿拉希盆地中的4座基地，然後向落錘鎮的屠殺者杜維爾覆命。"
Inst34Quest3_HORDE_Location = "屠殺者杜維爾（阿拉希高地 - 落錘鎮; "..YELLOW.."74,35"..WHITE.."）"
Inst34Quest3_HORDE_Note = "你必須與汙染者的聲望達到友善才能接到這個任務。"
Inst34Quest3_HORDE_Prequest = "無"
Inst34Quest3_HORDE_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Horde
Inst34Quest4_HORDE = "4. 奪取五座基地"
Inst34Quest4_HORDE_Level = "60"
Inst34Quest4_HORDE_Attain = "60"
Inst34Quest4_HORDE_Aim = "同時佔據阿拉希盆地中的5座基地，然後向落錘鎮的屠殺者杜維爾覆命。"
Inst34Quest4_HORDE_Location = "屠殺者杜維爾（阿拉希高地 - 落錘鎮; "..YELLOW.."74,35"..WHITE.."）"
Inst34Quest4_HORDE_Note = "你必須與污染者的聲望達到崇拜才能接到這個任務。"
Inst34Quest4_HORDE_Prequest = "無"
Inst34Quest4_HORDE_Folgequest = "無"
--
Inst34Quest4name1_HORDE = "汙染者軍服"



--------------- INST35 - Warsong Gulch (WSG) ---------------

Inst35Story = "位於梣谷森林南方區域的戰歌峽谷，是靠近第三次大戰中葛羅．地獄吼和他的獸人們大量砍伐森林的地方。有些獸人仍在鄰近地區，繼續砍伐森林以擴大部落的版圖。他們自稱為戰歌偵查騎兵。\n而展開大規模攻勢要奪回梣谷森林的夜精靈們，正致力於將偵察騎兵永遠逐出他們的土地。因此，銀翼哨兵回應了請求，並發誓他們非擊敗所有獸人並將他們趕出戰歌峽谷不可。"
Inst35Caption = "戰歌峽谷（WSG）"
Inst35QAA = "1 個任務"
Inst35QAH = "1 個任務"

--Quest 1 Alliance
Inst35Quest1 = "1. 戰鬥的號角:戰歌峽谷 (戰場每日)"
Inst35Quest1_Level = "10"
Inst35Quest1_Attain = "10"
Inst35Quest1_Aim = "在戰歌峽谷的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst35Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst35Quest1_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst35Quest1_Prequest = "無"
Inst35Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 1 Horde
Inst35Quest1_HORDE = "1. 戰鬥的號角:戰歌峽谷 (戰場每日)"
Inst35Quest1_HORDE_Level = "10"
Inst35Quest1_HORDE_Attain = "10"
Inst35Quest1_HORDE_Aim = "在戰歌峽谷的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst35Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst35Quest1_HORDE_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst35Quest1_HORDE_Prequest = "無"
Inst35Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST60 - Eye of the Storm ---------------

Inst60Story = "風暴之眼是一個在燃燒的遠征中加入的一個全新的、刺激的戰場。該戰場位於外域的虛空風暴，是一個以“爭奪和防守”為主題的競技比賽。該戰場允許最多15名聯盟玩家同時對抗15名部落玩家。風暴之眼戰場是由兩塊漂浮著的陸地組成，聯盟和部落雙方各占一塊陸地，並且兩塊陸地之間是靠三座石橋連接。另外，這裏的四座哨塔必將成為雙方的必爭之地，而有一面唯一的、可奪取的旗幟將會在地圖中部刷新，這也將成為雙方團隊激戰的焦點。與其他戰場不同的是，風暴之眼的戰場入口並沒有一個連接外部世界的副本入口。唯一一個可以進入風暴之眼戰場的方法就是與各主城中的戰場軍官對話。"
Inst60Caption = "風暴之眼"
Inst60QAA = "1 個任務"
Inst60QAH = "1 個任務"

--Quest 1 Alliance
Inst60Quest1 = "1. 戰鬥的號角:暴風之眼 (戰場每日)"
Inst60Quest1_Level = "61"
Inst60Quest1_Attain = "61"
Inst60Quest1_Aim = "在風暴之眼的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst60Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst60Quest1_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst60Quest1_Prequest = "無"
Inst60Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 1 Horde
Inst60Quest1_HORDE = "1. 戰鬥的號角:暴風之眼 (戰場每日)"
Inst60Quest1_HORDE_Level = "61"
Inst60Quest1_HORDE_Attain = "61"
Inst60Quest1_HORDE_Aim = "在風暴之眼的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst60Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst60Quest1_HORDE_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst60Quest1_HORDE_Prequest = "無"
Inst60Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST83 - Strand of the Ancients (SotA)  ---------------

Inst83Story = "遠祖灘頭是一個在巫妖王之怒中加入的一個全新的戰場，位於龍骨荒野南邊的海岸線。遠祖灘頭的戰爭方式分為進攻方與防守方，共有兩回合，每回合分別是十分鐘，回合結束則攻守交換。防守方的陣線由三道防線所組成，一共有六個城門、三座墳場以及一個最終據點，進攻方必須在限時之內取得防守方的最終據點以獲得戰爭的勝利。遠祖灘頭中還有許多戰爭載具（石毀車、砲台）提供玩家更多攻城的樂趣。\n\n"..GREEN.."引述自WoWWiki"
Inst83Caption = "遠祖灘頭"
Inst83QAA = "1 個任務"
Inst83QAH = "1 個任務"

--Quest 1 Alliance
Inst83Quest1 = "1. 戰鬥的號角:遠祖灘頭 (戰場每日)"
Inst83Quest1_Level = "71"
Inst83Quest1_Attain = "71"
Inst83Quest1_Aim = "在遠祖灘頭的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst83Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst83Quest1_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst83Quest1_Prequest = "無"
Inst83Quest1_Folgequest = "無"
-- No Rewards for this quest

--Quest 1 Horde
Inst83Quest1_HORDE = "1. 戰鬥的號角:遠祖灘頭 (戰場每日)"
Inst83Quest1_HORDE_Level = "71"
Inst83Quest1_HORDE_Attain = "71"
Inst83Quest1_HORDE_Aim = "在遠祖灘頭的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst83Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst83Quest1_HORDE_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst83Quest1_HORDE_Prequest = "無"
Inst83Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest



--------------- INST89 - Isle of Conquest (IoC)  ---------------

Inst89Story = "北裂境海外某處的一座小島。僅僅是一塊岩石，幾乎不會讓人想多看一眼。它或許看似不顯眼，但絕非一個平凡的島嶼。如雷般的聲響來自於海浪不斷拍打著沿岸，而憤怒的嘶吼則源自於，島上那一望無際的染血戰場上，刀刃相接的聲響。\n\n歡迎來到征服之島。"
Inst89Caption = "征服之島"
Inst89QAA = "1 個任務"
Inst89QAH = "1 個任務"

--Quest 1 Alliance
Inst89Quest1 = "1. 戰鬥的號角:征服之島 (戰場每日)"
Inst89Quest1_Level = "80"
Inst89Quest1_Attain = "80"
Inst89Quest1_Aim = "在征服之島的戰場中獲勝，然後向任何一座聯盟主城、撒塔斯、達拉然或冬握湖的聯盟准將回報。"
Inst89Quest1_Location = "聯盟准將：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：銀白領區 - "..YELLOW.."29.8, 75.8"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."66.6, 34.6"..WHITE.."\n　暴風城：暴風要塞 - "..YELLOW.."83.8, 35.4"..WHITE.."\n　鐵爐堡：武器大廳 - "..YELLOW.."69.9, 89.6"..WHITE.."\n　達納蘇斯：戰士區 - "..YELLOW.."57.6, 34.1"..WHITE.."\n　艾克索達：聖光穹頂 - "..YELLOW.."24.6, 55.4"
Inst89Quest1_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst89Quest1_Prequest = "無"
Inst89Quest1_Folgequest = "無"
-- No Rewards for this quest


--Quest 1 Horde
Inst89Quest1_HORDE = "1. 戰鬥的號角:征服之島 (戰場每日)"
Inst89Quest1_HORDE_Level = "80"
Inst89Quest1_HORDE_Attain = "80"
Inst89Quest1_HORDE_Aim = "在征服之島的戰場中獲勝，然後向任何一座部落主城、撒塔斯、達拉然或冬握湖的部落戰爭使者回報。"
Inst89Quest1_HORDE_Location = "部落戰爭使者：\n　冬握湖：冬握要塞 - "..YELLOW.."50.0, 14.0"..WHITE.."（巡邏）\n　達拉然：奪日者聖堂 - "..YELLOW.."58.0, 21.1"..WHITE.."\n　撒塔斯城：陰鬱城 - "..YELLOW.."67.0, 56.7"..WHITE.."\n　奧格瑪：榮譽谷 - "..YELLOW.."79.8, 30.3"..WHITE.."\n　雷霆崖：獵人高地 - "..YELLOW.."55.8, 76.6"..WHITE.."\n　幽暗城：皇家區 - "..YELLOW.."60.7, 87.8"..WHITE.."\n　銀月城：遠行者廣場 - "..YELLOW.."97.0, 38.3"
Inst89Quest1_HORDE_Note = "戰場每日任務，完成任務將基於你的級別獎勵經驗和金錢。"
Inst89Quest1_HORDE_Prequest = "無"
Inst89Quest1_HORDE_Folgequest = "無"
-- No Rewards for this quest




---------------------------------------------------
---------------- OUTDOOR RAIDS --------------------
---------------------------------------------------

--------------- INST30 - Dragons of Nightmare ---------------

Inst30Story = {
  ["Page1"] = "世界之樹陷入了一場騷亂。一波新的威脅正危及著這些與世隔絕的隱密地區，僻靜的梣谷、暮色森林、菲拉斯以及辛特蘭。綠龍軍團的四條守護巨龍從翡翠夢境來到了艾澤拉斯世界，這些曾經傲視一時，忠心耿耿的守護者，現在卻為世界帶來了毀滅和死亡的氣息。拿起武器，跟你的伙伴一同進入那些神秘的森林——只有你能從巨龍手中拯救艾澤拉斯免於他們帶來的毀滅。",
  ["Page2"] = "伊瑟拉，強大的翡翠夢境守護巨龍統領著謎樣的綠龍軍團。她居住在奇異神祕的翡翠夢境之中，支配著世界萬物的演化方向。她是自然和幻境的守護者，她所率領的綠龍軍團則負責保護世界之樹，只有德魯伊才能通過世界之樹進入翡翠夢境。\n近來，在翡翠夢境中的某種新的黑暗力量的驅使下，伊瑟拉最忠誠的守護者們穿越世界之樹，來到了艾澤拉斯世界，妄圖使世界再度陷入瘋狂和恐慌。即使是最強大的冒險者也應該對這些巨龍退避三舍，否則他就將為此付出慘重的代價。",
  ["Page3"] = "受翡翠夢境黑暗力量的影響，雷索的龍鱗不僅失去了光澤，他增強他所擁有的汲取敵人幻像的力量。一旦與巨龍主使者站在同一陣線，幻象就會賦予巨龍治療的能力。毫無疑問，雷索被認為是伊瑟拉手下最強大的忠誠守護者。",
  ["Page4"] = "在翡翠夢境的某種神秘的黑暗力量誘惑下，高貴的艾莫莉絲成為了一頭腐爛、患病的怪物。少數曾經挑戰過這隻巨龍的僥倖生還者說，從他們死去的伙伴的屍體上長出了腐爛的蘑菇，那情形異常恐怖。艾莫莉絲是伊瑟拉統治的綠龍軍團中最可怕的巨龍。",
  ["Page5"] = "泰拉爾或許是伊瑟拉的守護者中受黑暗力量影響最深的巨龍。翡翠夢境的黑暗力量徹底摧毀了泰拉爾的心智和肉體。他成為擁有分身術的巨龍幽靈，各個分身都具備強大的魔法破壞力。泰拉爾是個狡猾無情的敵人，他妄圖使艾澤拉斯世界的所有生物都陷入瘋狂。",
  ["Page6"] = "伊索德雷曾經是伊瑟拉最信任的副手之一，現在成了一頭在艾澤拉斯土地上散播恐慌與混亂的兇猛野獸。她先前擁有的治療能力被黑暗魔法所取代，她能釋放煙狀的閃電波並召喚惡魔德魯伊。伊索德雷和她的龍族擁有催眠技能，可以使不幸的敵人陷入最可怕的噩夢。",
  ["MaxPages"] = "6",
};
Inst30Caption = "翡翠四龍"
Inst30Caption2 = "伊瑟拉和綠龍軍團"
Inst30Caption3 = "雷索"
Inst30Caption4 = "艾莫莉絲"
Inst30Caption5 = "泰拉爾"
Inst30Caption6 = "伊索德雷"
Inst30QAA = "1 個任務"
Inst30QAH = "1 個任務"

--Quest 1 Alliance
Inst30Quest1 = "1. 夢魘的纏繞"
Inst30Quest1_Level = "60"
Inst30Quest1_Attain = "60"
Inst30Quest1_Aim = "尋找能解讀夢魘包裹物品中所隱藏信息的人。\n\n或許擁有強大力量的德魯伊可以幫助你。"
Inst30Quest1_Location = "夢魘包裹的物品（掉落自艾莫莉絲、泰拉爾、雷索或伊索德雷 - 翡翠四龍）"
Inst30Quest1_Note = "將夢魘包裹物品交給守護者雷姆洛斯（月光林地 - 雷姆洛斯神殿; "..YELLOW.."36,41"..WHITE.."）。"
Inst30Quest1_Prequest = "無"
Inst30Quest1_Folgequest = "喚醒傳說"
--
Inst30Quest1name1 = "瑪法里恩的璽戒"


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

Inst31Story = "在世界大分裂之前，夜精靈之城埃達拉斯在如今被稱作艾薩拉的土地上可說是非常繁盛。據說很多古老和強大的高等精靈神器，可能就藏在強極一時的堡壘里。經歷了無數世代，藍龍軍團全力保護神器與魔法傳說，確保它們不落入凡人手中。藍龍，艾索雷葛斯的出現，似乎暗示著那些具有極重要意義的物品，像是預言中的永恆之瓶，或許就能在艾薩拉的荒野裡找到。無論艾索雷葛斯在尋找些什麼，可以肯定的是：他會誓死保衛艾薩拉的魔法寶藏。"
Inst31Caption = "艾索雷葛斯"
Inst31QAA = "1 個任務"
Inst31QAH = "1 個任務"

--Quest 1 Alliance
Inst31Quest1 = "1. 龍筋箭袋 (獵人史詩任務)"
Inst31Quest1_Level = "60"
Inst31Quest1_Attain = "60"
Inst31Quest1_Aim = "費伍德森林的古樹哈斯塔特要求你帶回一塊成年藍龍的肌腱。如果你得到了這個肌腱，將它帶回去給費伍德森林的古樹哈斯塔特。"
Inst31Quest1_Location = "古樹哈斯塔特（費伍德森林 - 鐵木樹林; "..YELLOW.."48,24"..WHITE.."）"
Inst31Quest1_Note = "殺了艾索雷葛斯之後取得成年藍龍的肌腱。他在艾薩拉南部半島的中間"..YELLOW.."[1]"..WHITE.."走動。"
Inst31Quest1_Prequest = "遠古石葉（"..YELLOW.."熔火之心"..WHITE.."）"
Inst31Quest1_Folgequest = "無"
Inst31Quest1PreQuest = "true"
--
Inst31Quest1name1 = "龍筋箭袋"


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



--------------- INST32 - Highlord Kruul ---------------

Inst32Story = "在燃燒軍團於第三次大戰獲勝之後，由惡魔卡札克所領導的剩餘敵軍，退回了詛咒之地，一個叫腐爛之痕的地方，等待黑暗之門再度敞開。謠傳黑暗之門再度敞開之時，卡札克將帶著他剩下的軍隊前往外域。曾經是獸人家園的德拉諾，外域被獸人薩滿耐奧祖所建造的數個傳送門同時開啟而分割開來，現在更成為被夜精靈背叛者伊利丹統帥的惡魔軍隊所佔領的破碎世界。當黑暗之門再度開啟，毀滅領主卡札克將陣地轉移到地獄火半島之後，現在由卡魯歐大領主駐守在那邊。"
Inst32Caption = "卡魯歐大領主"
Inst32QAA = "無任務"
Inst32QAH = "無任務"



--------------- INST64 - Doom Lord Kazzak ---------------

Inst64Story = {
  ["Page1"] = "燃燒軍團第二次入侵艾澤拉斯時，毀滅領主卡札克是入侵軍最高級別的指揮官之一。當時軍團擁有一把叫龍王戰刃的神器，它浸透了大地、時光、夢境、魔法和生命五種力量（正是從五色龍族的身上掠奪而來）。即便有此神兵在手，阿克蒙德和他的將士們最終依舊兵敗於海加爾山，這把戰刃也在戰鬥中被擊碎。毀滅領主卡札克知道第三次大戰的結局已無法挽回，於是被迫撤退。戰後，戰刃的碎片被聯軍秘密地藏匿了起來。",
  ["Page2"] = "最近，毀滅領主卡札克和他的爪牙們重新開啟了黑暗之門，毀滅領主卡札克本人穿越了傳送門前往外域統帥當地的軍團大軍。而與此同時，他委託他留在艾澤拉斯的最強副官——也就是卡魯歐大領主去取回龍王碎片。一旦卡魯歐大領主成功了，這把強大的戰刃將能被再度重鑄。有了龍王戰刃，再配上那清洗宇宙中一切生命的瘋狂執念，軍團將再一次不可阻擋。",
  ["MaxPages"] = "2",
};
Inst64Caption = "毀滅領主卡札克"
Inst64QAA = "無任務"
Inst64QAH = "無任務"



--------------- INST65 - Doomwalker ---------------

Inst65Story = "厄運行者是一台由基爾加丹製造的強大的惡魔搶奪者，被基爾加丹派遣去攻擊位於影月谷的黑暗神廟大門。\n\n它是一個戶外首領，擁有120級裝綁的紫裝掉落。"
Inst65Caption = "厄運行者"
Inst65QAA = "無任務"
Inst65QAH = "無任務"



--------------- INST66 - Skettis ---------------

Inst66Story = "司凱堤斯曾經是烏鴉人阿拉卡的首府，現在司凱堤斯的烏鴉人首領泰洛克正在聚集自己的力量，來對撒塔斯城展開攻擊，薩塔禦天者當然不能坐視不管，他們正招募玩家加入抵抗泰洛克的戰鬥中。"
Inst66Caption = "司凱堤斯"
Inst66QAA = "13 個任務"
Inst66QAH = "13 個任務"

--Quest 1 Alliance
Inst66Quest1 = "1. 前往司凱堤斯!"
Inst66Quest1_Level = "70"
Inst66Quest1_Attain = "70"
Inst66Quest1_Aim = "帶著爆裂物包去司凱堤斯外的黑風平臺找天空士官多林。"
Inst66Quest1_Location = "尤拉（撒塔斯城; "..YELLOW.."65,42"..WHITE.."）"
Inst66Quest1_Note = "該任務的前置任務也是這個人接到的。黑風平臺在"..YELLOW.."[1]"..WHITE.."。"
Inst66Quest1_Prequest = "上方的威脅"
Inst66Quest1_Folgequest = "向司凱堤斯開火"
Inst66Quest1PreQuest = "true"
-- No Rewards for this quest

--Quest 2 Alliance
Inst66Quest2 = "2. 向司凱堤斯開火 (每日任務)"
Inst66Quest2_Level = "70"
Inst66Quest2_Attain = "70"
Inst66Quest2_Aim = "在司凱堤斯住所的屋頂尋找巨大的卡里瑞蛋，並且對其使用禦天者爆破彈藥。完成之後回報天空士官多林。"
Inst66Quest2_Location = "天空士官多林（泰洛卡森林 - 黑風平臺; "..YELLOW.."65,66"..WHITE.."）"
Inst66Quest2_Note = "每日任務，你可以在飛行坐騎上完成轟炸任務。"
Inst66Quest2_Prequest = "前往司凱堤斯！"
Inst66Quest2_Folgequest = "無"
Inst66Quest2PreQuest = "true"
-- No Rewards for this quest

--Quest 3 Alliance
Inst66Quest3 = "3. 逃離司凱堤斯 (每日任務)"
Inst66Quest3_Level = "70"
Inst66Quest3_Attain = "70"
Inst66Quest3_Aim = "安全護送禦天者囚犯前往安全的地方並向天空士官多林報告。"
Inst66Quest3_Location = "禦天者囚犯（泰洛卡森林 - 司凱堤斯; "..YELLOW.."[4]"..WHITE.."）"
Inst66Quest3_Note = "每日任務，囚犯有3個可能的刷新點，地圖上標注為[4]的地方。"
Inst66Quest3_Prequest = "無"
Inst66Quest3_Folgequest = "無"
-- No Rewards for this quest

--Quest 4 Alliance
Inst66Quest4 = "4. 飢餓的虛空鰭刺"
Inst66Quest4_Level = "70"
Inst66Quest4_Attain = "70"
Inst66Quest4_Aim = "在黑風平臺南邊的樹林裡使用虛空鰭刺籠並殺死飢餓的虛空鰭刺附近的黑風扭曲追趕者。完成任務後回去找禦天者管理者迪塞克。"
Inst66Quest4_Location = "禦天者管理者迪塞克（泰洛卡森林 - 黑風平臺; "..YELLOW.."63,66"..WHITE.."）"
Inst66Quest4_Note = "黑風扭曲追趕者分布在司凱堤斯的四周，以南部居多，確保你殺死的是追趕者同時保証飢餓的虛空鰭刺也在你殺死的目標附近。"
Inst66Quest4_Prequest = "無"
Inst66Quest4_Folgequest = "無"
--
Inst66Quest4name1 = "極效敏捷藥劑"
Inst66Quest4name2 = "內行藥劑"

--Quest 5 Alliance
Inst66Quest5 = "5. 暗影世界"
Inst66Quest5_Level = "70"
Inst66Quest5_Attain = "70"
Inst66Quest5_Aim = "瑟弗林要你前往司凱堤斯從當地的阿拉卡身上取回6個暗影之塵。"
Inst66Quest5_Location = "瑟弗林（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest5_Note = "任務是可重複性的，司凱堤斯的阿拉卡都可能掉落暗影之塵。"
Inst66Quest5_Prequest = "無"
Inst66Quest5_Folgequest = "無"
--
Inst66Quest5name1 = "暗影藥劑"

--Quest 6 Alliance
Inst66Quest6 = "6. 魔爪祭司的秘密"
Inst66Quest6_Level = "70"
Inst66Quest6_Attain = "70"
Inst66Quest6_Aim = "從瑟弗林那裡取得暗影藥劑，用它找到並殺死司凱堤斯的魔爪祭司艾夏歐、魔爪祭司史奇吉克和魔爪祭司札列克。完成這個任務後回去找天空指揮官艾德瑞斯。"
Inst66Quest6_Location = "天空指揮官艾德瑞斯（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest6_Note = "你必須先完成《暗影世界》這個任務並喝下暗影藥劑才能看見這個幾個祭司。\n\n艾夏歐在"..YELLOW.."[5]"..WHITE.."，史奇吉克在"..YELLOW.."[6]"..WHITE.."，札列克在 "..YELLOW.."[7]"..WHITE.."。"
Inst66Quest6_Prequest = "陰影世界"
Inst66Quest6_Folgequest = "無"
Inst66Quest6PreQuest = "true"
-- No Rewards for this quest

--Quest 7 Alliance
Inst66Quest7 = "7. 艾夏歐的年鑑"
Inst66Quest7_Level = "70"
Inst66Quest7_Attain = "70"
Inst66Quest7_Aim = "將艾夏歐的年鑑交給司凱堤斯北邊的天空指揮官艾德瑞斯。"
Inst66Quest7_Location = "艾夏歐的年鑑（阿拉卡祭司艾夏歐掉落 - 黑風平臺; "..YELLOW.."[5]"..WHITE.."）"
Inst66Quest7_Note = "天空指揮官艾德瑞斯在（泰洛卡森林 - 黑風碼頭; "..YELLOW.."64,66"..WHITE.."）。"
Inst66Quest7_Prequest = "無"
Inst66Quest7_Folgequest = "陰鬱城的盟友"
-- No Rewards for this quest

--Quest 8 Alliance
Inst66Quest8 = "8. 陰鬱城的盟友"
Inst66Quest8_Level = "70"
Inst66Quest8_Attain = "70"
Inst66Quest8_Aim = "將艾夏歐的年鑑帶到撒塔斯城內交給陰鬱城的『贖罪者』里拉克。"
Inst66Quest8_Location = "天空指揮官艾德瑞斯（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest8_Note = "『贖罪者』里拉克在（撒塔斯 - 陰鬱城; "..YELLOW.."52,20"..WHITE.."）。"
Inst66Quest8_Prequest = "艾夏歐的年鑑"
Inst66Quest8_Folgequest = "末日的倒數階段"
Inst66Quest8FQuest = "true"
-- No Rewards for this quest

--Quest 9 Alliance
Inst66Quest9 = "9. 末日的倒數階段"
Inst66Quest9_Level = "70"
Inst66Quest9_Attain = "70"
Inst66Quest9_Aim = "帶著泰洛克回歸世界的消息去找天空指揮官艾德瑞斯。"
Inst66Quest9_Location = "『贖罪者』里拉克（撒塔斯城 - 陰鬱城; "..YELLOW.."52,20"..WHITE.."）"
Inst66Quest9_Note = "天空指揮官艾德瑞斯在（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）。海茲克就在旁邊，與他對話以觸發下一階段的任務。"
Inst66Quest9_Prequest = "陰鬱城的盟友"
Inst66Quest9_Folgequest = "海茲克的交易"
Inst66Quest9FQuest = "true"
-- No Rewards for this quest

--Quest 10 Alliance
Inst66Quest10 = "10. 海茲克的交易"
Inst66Quest10_Level = "70"
Inst66Quest10_Attain = "70"
Inst66Quest10_Aim = "到東司凱堤斯，海茲克的住所取得海茲克的包裹再拿回去給他。"
Inst66Quest10_Location = "海茲克（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest10_Note = "海茲克的包裹在"..YELLOW.."[8]"..WHITE.."。"
Inst66Quest10_Prequest = "末日的倒數階段"
Inst66Quest10_Folgequest = "殘破的偽裝"
Inst66Quest10FQuest = "true"
-- No Rewards for this quest

--Quest 11 Alliance
Inst66Quest11 = "11. 殘破的偽裝"
Inst66Quest11_Level = "70"
Inst66Quest11_Attain = "70"
Inst66Quest11_Aim = "使用殘破的阿拉卡偽裝從撒哈克那裡取得《敵人之血》再回到海茲克那裡。"
Inst66Quest11_Location = "海茲克（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest11_Note = "撒哈克在"..YELLOW.."[3]"..WHITE.."。"
Inst66Quest11_Prequest = "海茲克的交易"
Inst66Quest11_Folgequest = "敵人之血"
Inst66Quest11FQuest = "true"
-- No Rewards for this quest

--Quest 12 Alliance
Inst66Quest12 = "12. 敵人之血"
Inst66Quest12_Level = "70"
Inst66Quest12_Attain = "70"
Inst66Quest12_Aim = "在司凱堤斯的召喚法陣中央找到顱骨堆。在顱骨堆用10個時光流逝卷軸召喚並擊敗每個子嗣。回到黑風平臺找海茲克。"
Inst66Quest12_Location = "海茲克（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest12_Note = "召喚法陣位於"..GREEN.."[1']"..WHITE.."。每次召喚只會掉落一個任務物品，所以召喚之前請事先商量任務物品歸屬。"
Inst66Quest12_Prequest = "殘破的偽裝"
Inst66Quest12_Folgequest = "無"
Inst66Quest12FQuest = "true"
--
Inst66Quest12name1 = "時光流逝祭品"

--Quest 13 Alliance
Inst66Quest13 = "13. 泰洛克的覆滅"
Inst66Quest13_Level = "70"
Inst66Quest13_Attain = "70"
Inst66Quest13_Aim = "帶著海茲克準備的時光流逝祭品到司凱堤斯中心的顱骨堆，召喚並擊敗泰洛克。完成這個任務後回去找天空指揮官艾德瑞斯。"
Inst66Quest13_Location = "天空指揮官艾德瑞斯（泰洛卡森林 - 黑風平臺; "..YELLOW.."64,66"..WHITE.."）"
Inst66Quest13_Note = "在"..YELLOW.."[2]"..WHITE.."召喚泰洛克。小幫助：當泰洛克血量低時，他會進入無敵狀態，這時候需要等禦天者投下藍色的煙霧彈，把泰洛克引到煙霧彈上才能解除他的無敵狀態。"
Inst66Quest13_Prequest = "敵人之血"
Inst66Quest13_Folgequest = "無"
Inst66Quest13PreQuest = "true"
--
Inst66Quest13name1 = "寶石裝飾魔杖"
Inst66Quest13name2 = "斥候的飛刀"
Inst66Quest13name3 = "瑟弗林的手杖"
Inst66Quest13name4 = "擊風者長矛"


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
-- 15 = Naxxramas (Naxx)
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
