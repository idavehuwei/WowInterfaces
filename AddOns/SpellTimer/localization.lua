--------------------
--	"notarget" - [1|nil]		-	无目标, 缺省unit为"player"
--	"live"			- [1|nil]		-	脱离战斗后不消失
--	"unit"		- [STIRNG]-	unit, 当notarget为真时有效, 缺省为"player" 
--	"unique"	- [1|nil]		-	唯一, 同时只存在一个该类计时
--	"nocheck"	- [1|0]	 	-	不需要检查, 当目标身上无该buff或者debuff时也不取消计时, 当notarget为真时缺省为true
-- "any"			- [1|0]		-	影藏所有guid的这个计时
--------------------
SPELL_TIMER_LEVEL_ROMAN = {" IX", " VIII", " VII", " V",  " IV", " III", " II", ""};

if (GetLocale() =="zhCN") then
	SPELL_TIMER_TITILE = "法术计时器";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "你可以在原有法术的持续时间上再额外增加一段时间，拖动该滑动条来调整该时间。";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "强化切割";
	SPELL_TIMER_SHOW_NAME = "显示魔法名称";
	SPELL_TIMER_SHOW_PROGRESS = "显示进度条";
	SPELL_TIMER_ENABLE = "启用法术计时器";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-)效果$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-)光环$";

	SPELL_TIMER_SUMMON_TOTEM = "图腾召唤";
	SPELL_TIMER_TOTEM_PATTERN = "图腾";

	SPELL_TIMER_TOTEM_TIP = "你可以使用鼠标右键取消该图腾。";
	SPELL_TIMER_LOCK_POSITION = "锁定位置";
	SPELL_TIMER_CANCEL_TIMER = "右键取消计时";
	SPELL_TIMER_CHANGE_SCALE = "缩放比例...";
	SPELL_TIMER_DISPLAY_BORDER = "显示边框";
	SPELL_TIMER_CHANGE_BD_ALPHA = "边框透明度...";
	SPELL_TIMER_DISPLAY_BACKGD = "显示背景";
	SPELL_TIMER_CHANGE_BG_ALPHA = "背景透明度...";
	SPELL_TIMER_COLSE_TIMER = "右键点击关闭该计时";
	SPELL_TIMER_SHIFT_CLOSE = "Shift + 右键屏蔽对该效果的计时";
	SPELL_TIMER_MOVE_MENU = "左键 - 拖动计时器\n右键 - 弹出配置菜单";

	SPELL_TIMER_PATTERN_TABLE = {};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"] = {};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["恐惧"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["献祭"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["放逐术"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["腐蚀术"] = {nil, nil, nil, {"腐蚀之种"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["腐蚀之种"] = {nil, nil, nil, {"腐蚀术"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["生命虹吸"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["厄运诅咒"] = {nil, nil, nil, {"痛苦诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["痛苦诅咒"] = {nil, nil, nil, {"厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["元素诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["虚弱诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "元素诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["语言诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["鲁莽诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "暗影诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["暗影诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "疲劳诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["疲劳诅咒"] = {nil, nil, nil, {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["死亡缠绕"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["恐惧嚎叫"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["奴役恶魔"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["痛苦无常"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["诱惑"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["鬼影缠身"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["蚀魂术"] = {nil}; 	-- 台服简化

	SPELL_TIMER_PATTERN_TABLE["ROGUE"] = {};	
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["凿击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["锁喉"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["闷棍"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["破甲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["偷袭"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致盲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["割裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["切割"] = {"buff", nil, nil, nil, {["live"] = 1, ["notarget"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["脚踢"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["扰乱"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["还击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["肾击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["血之饥渴"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["暗影之舞"] = {nil};
	-- 毒药
	for i, lv in ipairs(SPELL_TIMER_LEVEL_ROMAN) do
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["麻醉药膏" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["速效药膏" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致伤药膏" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致命药膏" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["麻痹药膏" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["减速药膏" .. lv] = {nil};
	end
	
	SPELL_TIMER_PATTERN_TABLE["PRIEST"] = {};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["暗言术：痛"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["沉默"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["心灵尖啸"] = {nil, nil, nil, nil, {["notarget"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["吸血鬼的拥抱"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["恢复"] = {nil, nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["束缚亡灵"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["噬灵瘟疫"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["精神控制"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["神圣之火"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["安抚心灵"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["吸血鬼之触"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["星辰碎片"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["暗影易伤"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["悲惨"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["昏阙"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["精神鞭笞"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["渐隐术"] = {nil, nil, nil, nil, {["live"] =1}};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["真言术：盾"] = {nil, nil, nil, nil, {["live"] =1}};

	SPELL_TIMER_PATTERN_TABLE["WARRIOR"] = {};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["断筋"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["撕裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["盾击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["挫志怒吼"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["刺耳怒吼"] = {"眩晕([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["惩戒痛击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["雷霆一击"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["缴械"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["破胆怒吼"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["破甲攻击"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["致死打击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["拦截"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["暴怒"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1, ["live"] = 1}};

	SPELL_TIMER_PATTERN_TABLE["HUNTER"] = {};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["照明弹"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["猎人印记"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["摔绊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["恐吓野兽"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["反击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["治疗宠物"] = {"在([%d%.]+)秒内为其恢复", nil, nil, nil, {["notarget"] = 1, ["live"] = 1, ["unit"] = "pet", ["nocheck"] = 0}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["狂野怒火"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇钉刺"] = {nil, nil, nil, {"蝰蛇钉刺", "毒蝎钉刺", "翼龙钉刺"}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["蝰蛇钉刺"] = {nil, nil, nil, {"毒蛇钉刺", "毒蝎钉刺", "翼龙钉刺"}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蝎钉刺"] = {nil, nil, nil, {"毒蛇钉刺", "蝰蛇钉刺", "翼龙钉刺"}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["翼龙钉刺"] = {nil, nil, nil, {"毒蛇钉刺", "蝰蛇钉刺", "毒蝎钉刺"}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["震荡射击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["驱散射击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰冻陷阱"] = {{"SpellTimer_TrapSearchFunc", {"使其在最多([%d%.]+)秒内无法行动", 1, "陷阱可存在([%d%.]+)分钟", 60}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰霜陷阱", "献祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰霜陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持续([%d%.]+)秒", 1, "陷阱可以存在([%d%.]+)分钟", 60}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰冻陷阱", "献祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["献祭陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持续([%d%.]+)秒", 1, "最多存在([%d%.]+)分钟", 60}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰冻陷阱", "冰霜陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["爆炸陷阱"] = {{"SpellTimer_TrapSearchFunc", {"接下来的([%d%.]+)秒", 1, "存在([%d%.]+)分钟", 60}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰冻陷阱", "冰霜陷阱", "献祭陷阱", "毒蛇陷阱"}, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇陷阱"] = {{"SpellTimer_TrapSearchFunc", {"毒蛇可在([%d%.]+)秒", 1, "陷阱可存在([%d%.]+)秒", 1}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰冻陷阱", "冰霜陷阱", "献祭陷阱", "爆炸陷阱"}, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰冻陷阱效果"] = {nil, nil, nil, {"冰冻陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰霜陷阱效果"] = {nil, nil, nil, {"冰霜陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["献祭陷阱效果"] = {nil, nil, nil, {"献祭陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["爆炸陷阱效果"] = {nil, nil, nil, {"爆炸陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇陷阱效果"] = {nil, nil, nil, {"毒蛇陷阱"}, {["any"] = 1}};

	SPELL_TIMER_PATTERN_TABLE["DRUID"] = {};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["休眠"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["月火术"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["猛击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["挫志咆哮"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["精灵之火"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["精灵之火（野性）"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["纠缠根须"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["突袭"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["割裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["愈合"] = {nil, nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["回春术"] = {nil, nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["斜掠"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["野性冲锋"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["虫群"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["猛击"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["自然之力"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["裂伤（熊）"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["裂伤（豹）"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["生命之花"] = {"在([%d%.]+)秒内", nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["割伤"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["生命绽放"] = {"在([%d%.]+)秒内"};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["割碎"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["飓风术"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["月蚀"] = {nil, nil, nil, nil, {["live"] = 1, ["spell"] = {"月蚀 CD", 30}}};


	SPELL_TIMER_PATTERN_TABLE["SHAMAN"] = {};
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["风暴打击"] = {"持续([%d%.]+)秒"};
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["漩涡武器"] = {nil, nil, nil, nil, {["live"] = 1}}; 


	SPELL_TIMER_PATTERN_TABLE["PALADIN"] = {};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["制裁之锤"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["忏悔"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["超度亡灵"] = {nil};  
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["神启"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["光之优雅"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1, ["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["圣光道标"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["正义复仇"] = {nil};

	SPELL_TIMER_PATTERN_TABLE["MAGE"] = {};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["变形术"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["冰锥术"] = {"持续([%d%.]+)秒", nil, nil, {"寒冰箭"}, {["notarget"] =1}};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["寒冰箭"] = {nil, nil, nil, {"冰锥术"}};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["炎爆术"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["火球术"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["深冬之寒"] = {nil};  
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["霜寒刺骨"] = {nil};  
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["火焰易伤"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["烈焰风暴"] = {"并在([%d%.]+)秒", nil, nil, nil, {["notarget"] =1}}; 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["侦测魔法"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["冲击波"] = {"眩晕([%d%.]+)秒", nil, nil, nil, {["notarget"] =1}};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["冰霜新星"] = {"最多持续([%d%.]+)秒", nil, nil, nil, {["notarget"] =1}};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["召唤水元素"] = {"持续([%d%.]+)秒", nil, nil, nil, {["notarget"] =1, ["live"] = 1}}; 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["减速术"] = {nil}; -- 246
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["活动炸弹"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}}; -- 44457
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["强化灼烧"] = {nil}; -- 11095

	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"] = {};
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["冰霜疫病"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["血之瘟疫"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["黑色瘟疫"] = {nil}; 
elseif (GetLocale() == "zhTW") then
	SPELL_TIMER_TITILE = "法術計時器";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "你可以在原有的法術的持續時間上再額外增加一段時間，拖動滑動塊來調整該時間。";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "強化切割";
	SPELL_TIMER_SHOW_NAME = "顯示魔法名稱";
	SPELL_TIMER_SHOW_PROGRESS = "顯示進度條";
	SPELL_TIMER_ENABLE = "啟用法術計時器";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-)效果$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-)光環$";

	SPELL_TIMER_SUMMON_TOTEM = "圖騰召喚";
	SPELL_TIMER_TOTEM_PATTERN = "圖騰";

	SPELL_TIMER_TOTEM_TIP = "你可以使用滑鼠右鍵取消該圖騰。";
	SPELL_TIMER_TOTEM_TIP = "你可以使用滑鼠右鍵取消該圖騰。";
	SPELL_TIMER_LOCK_POSITION = "鎖定位置";
	SPELL_TIMER_CANCEL_TIMER = "右鍵取消計時";
	SPELL_TIMER_CHANGE_SCALE = "縮放比例...";
	SPELL_TIMER_DISPLAY_BORDER = "顯示邊框";
	SPELL_TIMER_CHANGE_BD_ALPHA = "邊框透明度...";
	SPELL_TIMER_DISPLAY_BACKGD = "顯示背景";
	SPELL_TIMER_CHANGE_BG_ALPHA = "背景透明度...";
	SPELL_TIMER_COLSE_TIMER = "右鍵點擊關閉該計時";
	SPELL_TIMER_SHIFT_CLOSE = "Shift + 右鍵遮罩對該效果的計時";
	SPELL_TIMER_MOVE_MENU = "左鍵 - 拖動計時器\n右鍵 - 彈出配置菜單";

	SPELL_TIMER_PATTERN_TABLE = {} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"] = {} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["恐懼術"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["獻祭"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["放逐術"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["腐蝕術"] = {nil, nil, nil, {"腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["腐蝕種子"] = {nil, nil, nil, {"腐蝕術"}};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["生命虹吸"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["厄運詛咒"] = {nil, nil, nil, {"痛苦詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["痛苦詛咒"] = {nil, nil, nil, {"厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["元素詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["虛弱詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "元素詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["語言詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["魯莽詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "暗影詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["暗影詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "疲勞詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["疲勞詛咒"] = {nil, nil, nil, {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "腐蝕種子"}} 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["死亡纏繞"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["恐懼嚎叫"] = {"持續([%d%.]+)秒"}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["奴役惡魔"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["痛苦動盪"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["蝕魂術"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["鬼影缠身"] = {nil}; 

	
	SPELL_TIMER_PATTERN_TABLE["ROGUE"] = {} 
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["鑿擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["絞喉"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["悶棍"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["破甲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["偷襲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致盲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["割裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["切割"] = {"buff", nil, nil, nil, {["live"] = 1, ["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["腳踢"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["擾亂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["還擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["腎擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["鮮血渴求"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["暗影之舞"] = {nil};
	-- 毒药
	for i, lv in ipairs(SPELL_TIMER_LEVEL_ROMAN) do
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["麻醉毒藥" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["速效毒藥" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致傷毒藥" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致命毒藥" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["麻痹毒藥" .. lv] = {nil};
		SPELL_TIMER_PATTERN_TABLE["ROGUE"]["致殘毒藥" .. lv] = {nil};
	end

	SPELL_TIMER_PATTERN_TABLE["PRIEST"] = {} 
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["暗言術：痛"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["沉默"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["心靈尖嘯"] = {nil, nil, nil, nil, {["notarget"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["吸血鬼的擁抱"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["恢復"] = {nil, nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["安撫心靈"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["束縛不死生物"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["噬靈瘟疫"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["精神控制"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["神聖之火"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["吸血之觸"] ={nil};
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["星辰裂片"] = {nil};
	
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"] = {} 
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["斷筋"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["撕裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["盾擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["挫志怒吼"] = {"持續([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["懲戒痛擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["雷霆一擊"] = {"持續([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["繳械"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["破膽怒吼"] = {"持續([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["破甲攻擊"] = {"持續([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["致死打擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["攔截"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["暴怒"] = {"持續%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 29801


	SPELL_TIMER_PATTERN_TABLE["HUNTER"] = {} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["照明彈"] = {"持續([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1, ["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["獵人印記"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["摔絆"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["恐嚇野獸"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["反擊"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["狂野怒火"] = {"持續([%d%.]+)秒",nil,nil,nil,{["notarget"] = 1,["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇釘刺"] = {nil, nil, nil, {"蝮蛇釘刺", "毒蝎釘刺", "翼龍釘刺"}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["蝮蛇釘刺"] = {nil, nil, nil, {"毒蛇釘刺", "毒蝎釘刺", "翼龍釘刺"}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蠍釘刺"] = {nil, nil, nil, {"毒蛇釘刺", "蝮蛇釘刺", "翼龍釘刺"}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["翼龍釘刺"] = {nil, nil, nil, {"毒蛇釘刺", "蝮蛇釘刺", "毒蝎釘刺"}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["震盪射擊"] = {nil}      
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["驅散射擊"] = {nil} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰凍陷阱"] = {{"SpellTimer_TrapSearchFunc", {"使其在最多([%d%.]+)秒內無法行動", "陷阱可存在([%d%.]+)分鐘"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰霜陷阱", "獻祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1,["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰霜陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持續([%d%.]+)秒", "陷阱可以存在([%d%.]+)分鐘"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰凍陷阱", "獻祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1,["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["獻祭陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持續([%d%.]+)秒", "最多存在([%d%.]+)分鐘"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰凍陷阱", "冰霜陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1,["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["爆炸陷阱"] = {{"SpellTimer_TrapSearchFunc", {"接下來的([%d%.]+)秒", "存在([%d%.]+)分鐘"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰凍陷阱", "冰霜陷阱", "獻祭陷阱", "毒蛇陷阱"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇陷阱"] = {{"SpellTimer_TrapSearchFunc", {"毒蛇將在([%d%.]+)秒後死亡", "陷阱將在([%d%.]+)分鐘後消失"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"冰凍陷阱", "冰霜陷阱", "獻祭陷阱", "爆炸陷阱"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰凍陷阱效果"] = {nil, nil, nil, {"冰凍陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["冰霜陷阱效果"] = {nil, nil, nil, {"冰霜陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["獻祭陷阱效果"] = {nil, nil, nil, {"獻祭陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["爆炸陷阱效果"] = {nil, nil, nil, {"爆炸陷阱"}, {["any"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["毒蛇陷阱效果"] = {nil, nil, nil, {"毒蛇陷阱"}, {["any"] = 1}};
	
	SPELL_TIMER_PATTERN_TABLE["DRUID"] = {} 
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["休眠"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["月火術"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["重擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["挫志咆哮"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["精靈之火"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["精靈之火（野性）"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["糾纏根鬚"] = {nil};
	--SPELL_TIMER_PATTERN_TABLE["DRUID"]["樹皮術"] = {"持續([%d%.]+)秒"}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["突襲"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["撕扯"] = {{"SpellTimer_ComboSearchFunc", "(%d+)點：([%d%.]+)秒", "GetComboPoints"}} 
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["癒合"] = {nil, nil, nil, nil, {["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["回春術"] = {nil, nil, nil, nil, {["live"] = 1}};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["掃擊"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["野性沖鋒"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["蟲群"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["重擊"] = {"昏迷([%d%.]+)"}; 
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["自然之力"] = {"持續([%d%.]+)"}; 
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["割碎 - 熊形態"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["割碎 - 獵豹形態"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["割裂"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["生命之花"] = {"在([%d%.]+)內"};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["傷殘術"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["兇蠻咆哮"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["颶風術"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["蝕星蔽月"] = {nil, nil, nil, nil, {["live"] = 1, ["spell"] = {"蝕星蔽月 CD", 30}}}; -- 48518

	SPELL_TIMER_PATTERN_TABLE["SHAMAN"] = {} 
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["風暴打擊"] = {"持續([%d%.]+)"};
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["氣漩武器"] = {nil, nil, nil, nil, {["live"] = 1}};

	SPELL_TIMER_PATTERN_TABLE["PALADIN"] = {} 
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["制裁之錘"] = {"使目標昏迷([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["懺悔"] = {"最多持續([%d%.]+)秒"} 
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["超度不死生物"] = {"最多([%d%.]+)秒"}
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["神聖啟發"] = {"持續([%d%.]+)", nil, {["notarget"] = 1, ["live"] = 1}}; 
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["光明賜福"] = {"持續([%d%.]+)", nil, {["notarget"] = 1, ["live"] = 1}}; 
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["聖光信標"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["公正復仇"] = {nil}; 

	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["審判"] = {nil, nil, 0, nil, {["公正審判"]=1, ["聖光審判"]=1, ["十字軍審判"]=1, ["智慧審判"]=1}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["公正審判"] = {"公正聖印", nil, 10, {"聖光審判", "十字軍審判", "智慧審判"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["聖光審判"] = {"光明聖印", nil, 10, {"公正審判", "十字軍審判", "智慧審判"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["十字軍審判"] = {"十字軍聖印", nil, 10, {"公正審判", "聖光審判", "智慧審判"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["智慧審判"] = {"智慧聖印", nil, 10, {"公正審判", "聖光審判", "十字軍審判"}}

	SPELL_TIMER_PATTERN_TABLE["MAGE"] = {} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["變形術"] = {nil, nil,nil,{"變豬術","變龜術"},{["live"] = 1, ["unique"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["變豬術"] = {nil,nil,nil,{"變形術","變龜術"},{["live"] = 1, ["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["變龜術"] = {nil,nil,nil,{"變形術","變豬術"},{["live"] = 1, ["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["冰錐術"] = {"持續([%d%.]+)秒",nil,nil,{"寒冰箭"}, {["notarget"] =1}} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["炎爆術"] = {nil}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["火球術"] = {nil}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["烈焰風暴"] = {"在([%d%.]+)秒內", nil, nil, nil, {["notarget"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["寒冰箭"] = {nil, nil, nil, {"冰錐術"}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["偵測魔法"] = {nil}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["沖擊波"] = {"眩暈([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["冰霜新星"] = {"最高可持續([%d%.]+)秒", nil, nil, nil, {["notarget"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["召喚水元素"] = {"持續([%d%.]+)秒", nil, nil, nil, {["notarget"] =1, ["live"] = 1}} 
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["減速術"] = {nil};
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["活體爆彈"] = {nil, nil, nil, nil, {["live"] = 1, ["unique"] = 1}}; -- 44457
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["強化灼燒"] = {nil}; 

	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"] = {};
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["冰霜熱疫"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["冰鍊術"]   = {nil}; 	
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["血魄瘟疫"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["黑死瘟疫"] = {nil};
else
	SPELL_TIMER_TITILE = "SpellTimer";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "You can add some time on this spell .";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "Slice and Dice";
	SPELL_TIMER_SHOW_NAME = "Show spell name";
	SPELL_TIMER_SHOW_PROGRESS = "Show Progress bar";
	SPELL_TIMER_ENABLE = "Enable SpellTimer";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-) effect$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-) aura$";

	SPELL_TIMER_SUMMON_TOTEM = "Totemic Call";
	SPELL_TIMER_TOTEM_PATTERN = "Totem";

	SPELL_TIMER_TOTEM_TIP = "Right click to cancel totem.";
	SPELL_TIMER_TOTEM_TIP = "你可以使用鼠标右键取消该图腾。";
	SPELL_TIMER_LOCK_POSITION = "锁定位置";
	SPELL_TIMER_CANCEL_TIMER = "右键取消计时";
	SPELL_TIMER_CHANGE_SCALE = "缩放比例...";
	SPELL_TIMER_DISPLAY_BORDER = "显示边框";
	SPELL_TIMER_CHANGE_BD_ALPHA = "边框透明度...";
	SPELL_TIMER_DISPLAY_BACKGD = "显示背景";
	SPELL_TIMER_CHANGE_BG_ALPHA = "背景透明度...";
	SPELL_TIMER_COLSE_TIMER = "右键点击关闭该计时";
	SPELL_TIMER_SHIFT_CLOSE = "Shift + 右键屏蔽对该效果的计时";
	SPELL_TIMER_MOVE_MENU = "左键 - 拖动计时器\n右键 - 弹出配置菜单";

--    spells
	SPELL_TIMER_PATTERN_TABLE = {};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"] = {};
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Fear"] = {"causing it to run in fear for up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Immolate"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Banish"] = {"but making it invulnerable for up to ([%d%.]+) sec.",nil,nil,nil,{["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Corruption"] = {"Shadow damage over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Siphon Life"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Doom"] = {"Shadow damage after ([%d%.]+) min.", 60, nil, {"Curse of Agony", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Agony"] = {"Shadow damage over ([%d%.]+) sec.", nil, nil, {"Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of the Elements"] = {"Curses the target for ([%d%.]+) min", 60, nil, {"Curse of Agony", "Curse of Doom", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Weakness"] = {"the target is reduced by %d+ for ([%d%.]+) min.", 60, nil, {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Tongues", "Curse of Recklessness", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Tongues"] = {"Lasts ([%d%.]+) sec.", nil, nil, {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Recklessness", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Recklessness"] = {"reducing armor by %d+ for ([%d%.]+) min.", 60, nil, {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Shadow", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Shadow"] = {"Curses the target for ([%d%.]+) min", 60, nil, {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Exhaustion"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Curse of Exhaustion"] = {"movement speed by %d+%% for ([%d%.]+) sec.", nil, nil, {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shadow"}}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Death Coil"] = {"the enemy target to run in horror for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Howl of Terror"] = {"flee in terror for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Enslave Demon"] = {"Lasts up to ([%d%.]+) min", 60, nil, nil, {["live"] = 1, ["unique"] = 1}}
	--pet
	SPELL_TIMER_PATTERN_TABLE["WARLOCK"]["Spell Lock"] = {"Silences the enemy for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"] = {}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Gouge"] = {"incapacitating the opponent for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Garrote"] = {"Garrote the enemy, causing %d+ damage over ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Sap"] = {"Incapacitates the target for up to ([%d%.]+) sec", nil, nil, nil, {["live"] = 1, ["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Expose Armor"] = {"Finishing move that exposes the target for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Cheap Shot"] = {"Stuns the target for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Blind"] = {"Blinds the target, causing it to wander disoriented for up to ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Rupture"] = {{"SpellTimer_ComboSearchFunc", "(%d+) point : 60 damage over ([%d%.]+) secs", "GetComboPoints"}}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Slice and Dice"] = {{"SpellTimer_ComboSearchFunc", "(%d+) point : ([%d%.]+) sec", "GetComboPoints"}, nil, nil, nil, {["live"] = 1, ["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Kick"] = {"from being cast for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Distract"] = {"all nearby monsters for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Riposte"] = {"disarms the target for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["ROGUE"]["Kidney Shot"] = {{"SpellTimer_ComboSearchFunc", "(%d+) point : ([%d%.]+) second(%d+)", "GetComboPoints"}}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"] = {}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Shadow Word: Pain"] = {"A word of darkness that causes 30 Shadow damage over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Silence"] = {"from casting spells for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Psychic Scream"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Vampiric Embrace"] = {"you deal for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Renew"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Shackle Undead"] = {"Shackles the target undead enemy for up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Devouring Plague"] = {"Lasts ([%d%.]+) min."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Mind Control"] = {"Lasts up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Holy Fire"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PRIEST"]["Mind Soothe"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"] = {}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Hamstring"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Rend"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Shield Bash"] = {"from being cast for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Demoralizing Shout"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Piercing Howl"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Mocking Blow"] = {"forces the target to focus attacks on you for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Thunder Clap"] = {"for ([%d%.]+) sec"}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Disarm"] = {"Disarm the enemy's weapon for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Intimidating Shout"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Sunder Armor"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Mortal Strike"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["WARRIOR"]["Intercept"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"] = {}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Flare"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Hunter's Mark"] = {"Lasts for ([%d%.]+) min.", 60, nil, nil, {["live"] = 1, ["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Wing Clip"] = {"by %d+%% for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Scare Beast"] = {"fear for up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Counterattack"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Bestial Wrath"] = {"for ([%d%.]+) sec.",nil,nil,nil,{["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Serpent Sting"] = {"damage over ([%d%.]+) sec.", nil, nil, {"Viper Sting", "Scorpid Sting", "Wyvern Sting"}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Viper Sting"] = {"mana over ([%d%.]+) sec.", nil, nil, {"Serpent Sting", "Scorpid Sting", "Wyvern Sting"}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Scorpid Sting"] = {"by %d+ for ([%d%.]+) sec.", nil, nil, {"Serpent Sting", "Viper Sting", "Wyvern Sting"}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Wyvern Sting"] = {"over ([%d%.]+) sec.", nil, nil, {"Serpent Sting", "Viper Sting", "Scorpid Sting"}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Concussive Shot"] = {"speed by %d+%% for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Scatter Shot"] = {"the target for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Freezing Trap"] = {{"SpellTimer_TrapSearchFunc", {"all action for up to ([%d%.]+) sec.", "Trap will exist for ([%d%.]+) min."}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"Frost Trap", "Immolation Trap", "Explosive Trap"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Frost Trap"] = {{"SpellTimer_TrapSearchFunc", {"around itself for ([%d%.]+) sec", "Trap will exist for ([%d%.]+) min."}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"Freezing Trap", "Immolation Trap", "Explosive Trap"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Immolation Trap"] = {{"SpellTimer_TrapSearchFunc", {"over ([%d%.]+) sec.", "exist for ([%d%.]+) min."}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"Freezing Trap", "Frost Trap", "Explosive Trap"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["HUNTER"]["Explosive Trap"] = {{"SpellTimer_TrapSearchFunc", {"Fire damage over ([%d%.]+) sec", "Trap will exist for ([%d%.]+) min."}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"Freezing Trap", "Frost Trap", "Immolation Trap"}, {["notarget"] = 1,["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["DRUID"] = {}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Hibernate"] = {"for up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Moonfire"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Bash"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Demoralizing Roar"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Faerie Fire"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Faerie Fire (Feral)"] = {"for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Entangling Roots"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Nature's Grasp"] = {"Lasts ([%d%.]+) sec",nil,nil,nil,{["Entangling Roots"] = 1}}     
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Pounce"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Rip"] = {{"SpellTimer_ComboSearchFunc", "(%d+) point : %d+ damage over ([%d%.]+) sec.", "GetComboPoints"}}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Regrowth"] = {"over ([%d%.]+) sec.",nil,nil,nil,{["live"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Rejuvenation"] = {"over ([%d%.]+) sec.",nil,nil,nil,{["live"] = 1}}      
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Swiftmend"] = {nil, nil, 0, {"Regrowth","Rejuvenation"}}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Rake"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Feral Charge"] = {"cast for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["DRUID"]["Insect Swarm"] = {"over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"] = {}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Frost Shock"] = {"Lasts ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Flame Shock"] = {"over ([%d%.]+) sec."}
	--earth
	--[[
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Earthbind Totem"] = {"for ([%d%.]+) sec", nil, nil, {"Stoneclaw Totem", "Strength of Earth Totem", "Stoneskin Totem", "Tremor Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Stoneclaw Totem"] = {"for ([%d%.]+) sec", nil, nil, {"Earthbind Totem", "Strength of Earth Totem", "Stoneskin Totem", "Tremor Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 65}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Strength of Earth Totem"] = {" Lasts ([%d%.]+) min.", 60, nil, {"Earthbind Totem", "Stoneclaw Totem", "Stoneskin Totem", "Tremor Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Stoneskin Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Earthbind Totem", "Stoneclaw Totem", "Strength of Earth Totem", "Tremor Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Tremor Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Earthbind Totem", "Stoneclaw Totem", "Strength of Earth Totem", "Stoneskin Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	--fire
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Fire Nova Totem"] = {"within ([%d%.]+) sec.", nil, nil, {"Searing Totem", "Magma Totem", "Frost Resistance Totem", "Flametongue Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Searing Totem"] = {"for ([%d%.]+) sec", nil, nil, {"Fire Nova Totem", "Magma Totem", "Frost Resistance Totem", "Flametongue Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Magma Totem"] = {"for ([%d%.]+) sec", nil, nil, {"Fire Nova Totem", "Searing Totem", "Frost Resistance Totem", "Flametongue Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Frost Resistance Totem"] = {"for ([%d%.]+) min.", 60, nil, {"Fire Nova Totem", "Searing Totem", "Magma Totem", "Flametongue Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Flametongue Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Fire Nova Totem", "Searing Totem", "Magma Totem", "Frost Resistance Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	--air
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Grace of Air Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Tranquil Air Totem", "Windwall Totem", "Windfury Totem", "Nature Resistance Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Tranquil Air Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Grace of Air Totem", "Windwall Totem", "Windfury Totem", "Nature Resistance Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Windwall Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Tranquil Air Totem", "Grace of Air Totem", "Windfury Totem", "Nature Resistance Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Windfury Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Tranquil Air Totem", "Grace of Air Totem", "Windwall Totem", "Nature Resistance Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Nature Resistance Totem"] = {"for ([%d%.]+) min", 60, nil, {"Tranquil Air Totem", "Grace of Air Totem", "Windwall Totem", "Windfury Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Grounding Totem"] = {"Lasts ([%d%.]+) sec.", nil, nil, {"Tranquil Air Totem", "Grace of Air Totem", "Windwall Totem", "Windfury Totem", "Nature Resistance Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Sentry Totem"] = {"for ([%d%.]+) min", 60, nil, {"Tranquil Air Totem", "Grace of Air Totem", "Windwall Totem", "Windfury Totem", "Nature Resistance Totem", "Grounding Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 100}}
	--water
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Fire Resistance Totem"] = {"for ([%d%.]+) min", 60, nil, {"Healing Stream Totem", "Mana Spring Totem", "Mana Tide Totem", "Poison Cleansing Totem", "Disease Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Healing Stream Totem"] = {"for ([%d%.]+) min", 60, nil, {"Fire Resistance Totem", "Mana Spring Totem", "Mana Tide Totem", "Poison Cleansing Totem", "Disease Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Mana Spring Totem"] = {"for ([%d%.]+) min", 60, nil, {"Fire Resistance Totem", "Healing Stream Totem", "Mana Tide Totem", "Poison Cleansing Totem", "Disease Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Mana Tide Totem"] = {"for ([%d%.]+) sec", nil, nil, {"Fire Resistance Totem", "Healing Stream Totem", "Mana Spring Totem", "Poison Cleansing Totem", "Disease Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Poison Cleansing Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Fire Resistance Totem", "Healing Stream Totem", "Mana Spring Totem", "Mana Tide Totem", "Disease Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	SPELL_TIMER_PATTERN_TABLE["SHAMAN"]["Disease Cleansing Totem"] = {"Lasts ([%d%.]+) min.", 60, nil, {"Fire Resistance Totem", "Healing Stream Totem", "Mana Spring Totem", "Mana Tide Totem", "Poison Cleansing Totem"}, {["notarget"] = 1, ["live"] = 1, ["hp"] = 5}}
	]]
	SPELL_TIMER_PATTERN_TABLE["PALADIN"] = {}
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Hammer of Justice"] = {"Stuns the target for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Repentance"] = {"for up to ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Turn Undead"] = {"flee for up to ([%d%.]+) sec."}  
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Judgement"] = {nil,nil,0,nil,{["Judgement of Light"] = 1, ["Judgement of Wisdom"] = 1, ["Judgement of Crusader"] = 1, ["Judgement of Justice"] = 1}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Judgement of Justice"] = {"Seal of Justice",nil,10,{"Judgement of Light", "Judgement of Crusader", "Judgement of Wisdom"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Judgement of Light"] = {"Seal of Light",nil,10,{"Judgement of Justice", "Judgement of Crusader", "Judgement of Wisdom"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Judgement of Crusader"] = {"Seal of the Crusader",nil,10,{"Judgement of Light", "Judgement of Justice", "Judgement of Wisdom"}}
	--SPELL_TIMER_PATTERN_TABLE["PALADIN"]["Judgement of Wisdom"] = {"	Seal of Wisdom",nil,10,{"Judgement of Light","Judgement of Crusader", "Judgement of Justice"}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"] = {}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Polymorph"] = {"around for up to ([%d%.]+) sec.", nil, nil, {"Polymorph: Pig", "Polymorph: Turtle"},{["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Polymorph: Pig"] = {"around for up to ([%d%.]+) sec.", nil, nil, {"Polymorph", "Polymorph: Turtle"},{["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Polymorph: Turtle"] = {"around for up to ([%d%.]+) sec.", nil, nil, {"Polymorph", "Polymorph: Pig"},{["unique"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Cone of Cold"] = {"slowed by ([%d%.]+) for 8 sec.", nil, nil, {"Frostbolt"},{["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Frostbolt"] = {"by 40% for ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Pyroblast"] = {"damage over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Fireball"] = {"damage over ([%d%.]+) sec."}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Flamestrike"] = {"damage over ([%d%.]+) sec.", nil, nil, nil, {["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Detect Magic"] = {"the target for ([%d%.]+) min.", 60}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Blast Wave"] = {"dazing them for ([%d%.]+) sec.", nil, nil, nil, {["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Frost Nova"] = {"place for up to ([%d%.]+) sec.", nil, nil, nil, {["notarget"] = 1}}
	SPELL_TIMER_PATTERN_TABLE["MAGE"]["Summon Water Elemental"] = {"for ([%d%.]+) sec."}

	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"] = {};
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["Frost Fever"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["Blood Plague"] = {nil}; 
	SPELL_TIMER_PATTERN_TABLE["DEATHKNIGHT"]["Ebon Plague"] = {nil}; 
end