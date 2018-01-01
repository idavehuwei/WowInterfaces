if (GetLocale() =="zhCN") then
	SPELL_TIMER_TITILE = "法术计时器";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "你可以在原有法术的持续时间上再额外增加一段时间，拖动该滑动条来调整该时间。";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "强化切割";
	SPELL_TIMER_SHOW_NAME = "显示魔法名称";
	SPELL_TIMER_SHOW_PROGRESS = "显示进度条";
	SPELL_TIMER_ENABLE = "启用法术计时器";

	SPELL_TIMER_POISON = "药膏";
	SPELL_TIMER_JUDGEMENT = "审判$";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-)效果$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-)光环$";

	SPELL_TIMER_SUMMON_TOTEM = "图腾召唤";
	SPELL_TIMER_TOTEM_PATTERN = "图腾";

	SPELL_TIMER_TOTEM_TIP = "你可以使用鼠标右键取消该图腾。"

	SPELL_TIMER_UNITFRAME_TOOLTIP = "按住Shift键和鼠标左键可拖动窗口";

	SPELLTIMER_HOUR_WORD = "小时";
	SPELLTIMER_MINUTE_WORD = "分钟";
	SPELLTIMER_SECOND_WORD = "秒";

	SPELLTIMER_COOLDOWN_INFO = "%s的剩余时间还有%s。";

	SPELL_TIMER_PATTERN_TABLE = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["恐惧"] = {"持续%t。"}; -- 5782
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["献祭"] = {"在%t内"}; -- 348
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["放逐术"] = {"持续%t。"}; -- 710
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["腐蚀术"] = {"debuff", {"腐蚀之种"}}; -- 172
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["腐蚀之种"] = {"在%t内", {"腐蚀术"}}; -- 27243
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["生命虹吸"] = {"持续%t"}; -- 18265
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["厄运诅咒"] = {"在%t后", {"痛苦诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 603
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["痛苦诅咒"] = {"在%t内", {"厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 980
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["元素诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 1490
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["虚弱诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "元素诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 702
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["语言诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "鲁莽诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 1714
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["鲁莽诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "暗影诅咒", "疲劳诅咒"}}; -- 704
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["暗影诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "疲劳诅咒"}}; -- 17862
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["疲劳诅咒"] = {"持续%t", {"痛苦诅咒", "厄运诅咒", "元素诅咒", "虚弱诅咒", "语言诅咒", "鲁莽诅咒", "暗影诅咒"}}; -- 18223
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["死亡缠绕"] = {"持续%t"}; -- 6789
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["恐惧嚎叫"] = {"持续%t", nil, {["notarget"] = 1}}; -- 5484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["奴役恶魔"] = {"持续%t"}; -- 1098
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["痛苦无常"] = {"在%t内"}; -- 30108
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["诱惑"] = {"debuff"}; -- 30108
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["鬼影缠身"] = {"debuff"}; -- 48181

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE][SPELL_TIMER_POISON] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["凿击"] = {"瘫痪%t"}; -- 1776
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["锁喉"] = {"在%t内"}; -- 703
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["闷棍"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 6770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["破甲"] = {"持续%t"}; -- 8647
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["偷袭"] = {"昏迷%t"}; -- 6409
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["致盲"] = {"持续最多%t"}; -- 2094
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["割裂"] = {"debuff"}; -- 1943
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["切割"] = {"buff", nil, {["notarget"] = 1, ["live"] = 1}}; -- 5171
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["脚踢"] = {"在%t内"}; -- 1766
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["扰乱"] = {"持续%t"}; -- 1725
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["还击"] = {"持续%t"}; -- 14251
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["肾击"] = {"debuff"}; -- 408
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["血之饥渴"] = {"buff"}; -- 51662
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["暗影之舞"] = {"buff"}; -- 51662

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["暗言术：痛"] = {"在%t内"}; -- 589
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["沉默"] = {"在%t内"}; -- 18278
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["心灵尖啸"] = {"持续%t", nil, {["notarget"] = 1}}; -- 8122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["吸血鬼的拥抱"] = {"持续%t"}; -- 15286
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["恢复"] = {"在%t内"}; -- 139
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["束缚亡灵"] = {"持续%t"}; -- 9484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["噬灵瘟疫"] = {"在%t内"}; -- 2944
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["精神控制"] = {"持续%t"}; -- 605
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["神圣之火"] = {"在%t内"}; -- 14914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["安抚心灵"] = {"持续%t"}; -- 453
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["吸血鬼之触"] = {"在%t内"}; -- 34914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["星辰碎片"] = {"在%t内"}; -- 10797

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["断筋"] = {"持续%t。"}; -- 1715
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["撕裂"] = {"在%t内"}; -- 772
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["盾击"] = {"在%t内"}; -- 72
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["挫志怒吼"] = {"持续%t"}; -- 1160
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["刺耳怒吼"] = {"持续%t"}; -- 12323
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["惩戒痛击"] = {"在%t内"}; -- 694
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["雷霆一击"] = {"持续%t"}; -- 6343
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["缴械"] = {"持续%t"}; -- 676
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["破胆怒吼"] = {"持续%t"}; -- 5246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["破甲攻击"] = {"持续%t"}; -- 7386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["致死打击"] = {"持续%t"}; -- 12294
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["拦截"] = {"昏迷%t"}; -- 20252
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["暴怒"] = {"持续%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 29801

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["照明弹"] = {"持续%t"}; -- 1543
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["摔绊"] = {"持续%t"}; -- 2974
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["恐吓野兽"] = {"持续%t"}; -- 1513 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["反击"] = {"持续%t"}; -- 19306
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["治疗宠物"] = {"在%t内"}; -- 136
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["狂野怒火"] = {"持续%t"}; -- 19574
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蛇钉刺"] = {"在%t内", {"蝰蛇钉刺", "毒蝎钉刺", "翼龙钉刺"}}; -- 1978
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["蝰蛇钉刺"] = {"在%t内", {"毒蛇钉刺", "毒蝎钉刺", "翼龙钉刺"}}; -- 3034
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蝎钉刺"] = {"持续%t", {"毒蛇钉刺", "蝰蛇钉刺", "翼龙钉刺"}}; -- 3043
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["翼龙钉刺"] = {"沉睡%t", {"毒蛇钉刺", "蝰蛇钉刺", "毒蝎钉刺"}}; -- 19386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["震荡射击"] = {"持续%t"}; -- 5116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["驱散射击"] = {"困惑%t"}; -- 19503
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["冰冻陷阱"] = {{"SpellTimer_TrapSearchFunc", {"最多%t内无法行动", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰霜陷阱", "献祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 1499
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["冰霜陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持续%t", "陷阱可以存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰冻陷阱", "献祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13809
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["献祭陷阱"] = {{"SpellTimer_TrapSearchFunc", {"在%t内", "最多存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰冻陷阱", "冰霜陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13795
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["爆炸陷阱"] = {{"SpellTimer_TrapSearchFunc", {"接下来的%t", "存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰冻陷阱", "冰霜陷阱", "献祭陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13813
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蛇陷阱"] = {{"SpellTimer_TrapSearchFunc", {"毒蛇可在%t", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰冻陷阱", "冰霜陷阱", "献祭陷阱", "爆炸陷阱"}, {["notarget"] = 1}}; -- 34600

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["休眠"] = {"持续%t"}; -- 2637
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["月火术"] = {"在%t内"}; -- 8921
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["猛击"] = {"昏迷%t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["挫志咆哮"] = {"持续%t"}; -- 99
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["精灵之火"] = {"持续%t"}; -- 770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["精灵之火（野性）"] = {"持续%t"}; -- 13424
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["纠缠根须"] = {"在%t内"}; -- 339
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["突袭"] = {"并在%t内"}; -- 9005
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["血袭"] = {"debuff"}; -- 9007
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割裂"] = {"debuff"}; -- 1079
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["愈合"] = {"在%t内", nil, {["live"] = 1}}; -- 8936
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["回春术"] = {"在%t内", nil, {["live"] = 1}}; -- 774
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["斜掠"] = {"在%t内"}; -- 1822
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["野性冲锋"] = {"在%t内"}; -- 16979
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["虫群"] = {"在%t内"}; -- 5570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["猛击"] = {"昏迷%t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["自然之力"] = {"持续%t"}; -- 6913
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["裂伤 - 熊"] = {"持续%t"}; -- 33878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["裂伤 - 豹"] = {"持续%t"}; -- 33876
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割伤"] = {"在%t内"}; -- 33745
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["生命绽放"] = {"在%t内"}; -- 33763
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割碎"] = {"debuff"}; -- 22570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["野蛮咆哮"] = {"buff"}; -- 52610
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["飓风术"] = {"debuff"}; -- 33786
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["月蚀"] = {"buff", nil, {["live"] = 1, ["spell"] = {"月蚀 CD", 30}}}; -- 48518

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["风暴打击"] = {"持续%t"}; -- 17364
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["漩涡武器"] = {"buff", nil, {["live"] = 1}}; -- 51528

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["制裁之锤"] = {"昏迷%t"}; -- 853
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["忏悔"] = {"debuff"}; -- 20066
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["超度亡灵"] = {"最多%t"}; -- 2878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["神启"] = {"持续%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31842
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["光之优雅"] = {"持续%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31833
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["圣光道标"] = {"buff"}; -- 53563
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["正义复仇"] = {"debuff"}; -- 53380

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["变形术"] = {"debuff"}; -- 118, 28271, 28272
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["冰锥术"] = {"debuff", {"寒冰箭"}}; -- 120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["寒冰箭"] = {"debuff", {"冰锥术"}}; -- 116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["炎爆术"] = {"debuff"}; -- 11366
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["火球术"] = {"debuff"}; -- 133
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["深冬之寒"] = {"debuff"}; -- 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["霜寒刺骨"] = {"debuff"}; -- 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["火焰易伤"] = {"debuff"}; -- 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["烈焰风暴"] = {"并在%t内", nil, {["notarget"] = 1}}; -- 2120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["侦测魔法"] = {"持续%t"}; -- 2855
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["冲击波"] = {"眩晕%t", nil, {["notarget"] = 1}}; -- 11113
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["冰霜新星"] = {"持续%t", nil, {["notarget"] = 1}}; -- 122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["召唤水元素"] = {"持续%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31687
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["减速术"] = {"debuff"}; -- 246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["活动炸弹"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 44457
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["强化灼烧"] = {"debuff"}; -- 11095
	
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["冰霜疫病"] = {"debuff"}; -- 55095
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["血之瘟疫"] = {"debuff"}; -- 55078
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["黑色瘟疫"] = {"debuff"}; -- 51726
elseif (GetLocale() == "zhTW") then
	SPELL_TIMER_TITILE = "法術計時器";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "你可以在原有的法術的持續時間上再額外增加一段時間，拖動滑動塊來調整該時間。";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "強化切割";
	SPELL_TIMER_SHOW_NAME = "顯示魔法名稱";
	SPELL_TIMER_SHOW_PROGRESS = "顯示進度條";
	SPELL_TIMER_ENABLE = "啟用法術計時器";

	SPELL_TIMER_POISON = "毒藥";
	SPELL_TIMER_JUDGEMENT = "審判$";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-)效果$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-)光環$";

	SPELL_TIMER_SUMMON_TOTEM = "圖騰召喚";
	SPELL_TIMER_TOTEM_PATTERN = "圖騰";

	SPELL_TIMER_TOTEM_TIP = "你可以使用滑鼠右鍵取消該圖騰。";

	SPELL_TIMER_UNITFRAME_TOOLTIP = "按住Shift鍵和滑鼠左鍵可拖動視窗";
	
	SPELLTIMER_HOUR_WORD = "小時";
	SPELLTIMER_MINUTE_WORD = "分鐘";
	SPELLTIMER_SECOND_WORD = "秒";

	SPELLTIMER_COOLDOWN_INFO = "%s的剩餘時間還有%s。";

	SPELL_TIMER_PATTERN_TABLE = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["恐懼術"] = {"最多持續%t"}; -- 5782
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["獻祭"] = {"並在%t內"}; -- 348
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["放逐術"] = {"最多持續%t"}; -- 710
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["腐蝕術"] = {"debuff", {"腐蝕種子"}}; -- 172
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["腐蝕種子"] = {"在%t內", {"腐蝕術"}}; -- 27243
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["生命虹吸"] = {"持續%t"}; -- 18265
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["厄運詛咒"] = {"在%t後", {"痛苦詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 603
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["痛苦詛咒"] = {"在%t內", {"厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 980
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["元素詛咒"] = {"效果持續%t", {"痛苦詛咒", "厄運詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 1490
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["虛弱詛咒"] = {"持續%t", {"痛苦詛咒", "厄運詛咒", "元素詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 702
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["語言詛咒"] = {"持續%t", {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "魯莽詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 1714
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["魯莽詛咒"] = {"持續%t", {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "暗影詛咒", "疲勞詛咒"}}; -- 704
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["暗影詛咒"] = {"持續%t", {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "疲勞詛咒"}}; -- 17862
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["疲勞詛咒"] = {"持續%t", {"痛苦詛咒", "厄運詛咒", "元素詛咒", "虛弱詛咒", "語言詛咒", "魯莽詛咒", "暗影詛咒"}}; -- 18223
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["死亡纏繞"] = {"持續%t"}; -- 6789
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["恐懼嚎叫"] = {"持續%t", nil, {["notarget"] = 1}}; -- 5484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["奴役惡魔"] = {"持續%t"}; -- 1098
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["痛苦動盪"] = {"沉默%t"}; -- 30108
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["蝕魂術"] = {"debuff"}; -- 48181

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE][SPELL_TIMER_POISON] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["鑿擊"] = {"癱瘓%t"}; -- 1776
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["絞喉"] = {"在%t內"}; -- 703
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["悶棍"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 6770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["破甲"] = {"持續%t"}; -- 8647
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["偷襲"] = {"昏迷%t"}; -- 6409
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["致盲"] = {"持續最多%t"}; -- 2094
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["割裂"] = {"debuff"}; -- 1943
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["切割"] = {"buff" , nil, {["notarget"] = 1, ["live"] = 1}}; -- 5171
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["腳踢"] = {"在%t內"}; -- 1766
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["擾亂"] = {"持續%t"}; -- 1725
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["還擊"] = {"持續%t"}; -- 14251
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["腎擊"] = {"debuff"}; -- 408
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["鮮血渴求"] = {"buff"}; -- 51662
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["暗影之舞"] = {"buff"}; -- 51662

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["暗言術:痛"] = {"在%t內"}; -- 589
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["沉默"] = {"持續%t"}; -- 18278
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["心靈尖嘯"] = {"持續%t", nil, {["notarget"] = 1}}; -- 8122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["吸血鬼的擁抱"] = {"持續%t"}; -- 15286
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["恢復"] = {"在%t內"}; -- 139
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["束縛不死生物"] = {"持續%t"}; -- 9484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["噬靈瘟疫"] = {"在%t內"}; -- 2944
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["精神控制"] = {"持續%t"}; -- 605
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["神聖之火"] = {"在%t內"}; -- 14914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["安撫心靈"] = {"持續%t"}; -- 453
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["吸血之觸"] = {"在%t內"}; -- 34914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["星辰裂片"] = {"在%t內"}; -- 10797

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["斷筋"] = {"持續%t。"}; -- 1715
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["撕裂"] = {"在%t內"}; -- 772
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["盾擊"] = {"在%t內"}; -- 72
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["挫志怒吼"] = {"持續%t"}; -- 1160
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["刺耳怒吼"] = {"持續%t"}; -- 12323
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["懲戒痛擊"] = {"在%t內"}; -- 694
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["雷霆一擊"] = {"持續%t"}; -- 6343
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["繳械"] = {"持續%t"}; -- 676
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["破膽怒吼"] = {"持續%t"}; -- 5246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["破甲攻擊"] = {"持續%t"}; -- 7386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["致死打擊"] = {"持續%t"}; -- 12294
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["攔截"] = {"昏迷%t"}; -- 20252
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["暴怒"] = {"持續%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 29801

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["照明彈"] = {"持續%t"}; -- 1543
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["摔絆"] = {"持續%t"}; -- 2974
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["恐嚇野獸"] = {"持續%t"}; -- 1513 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["反擊"] = {"持續%t"}; -- 19306
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["治療寵物"] = {"在%t內"}; -- 136
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["狂野怒火"] = {"持續%t"}; -- 19574
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蛇釘刺"] = {"在%t內", {"蝮蛇釘刺", "毒蠍釘刺", "翼龍釘刺"}}; -- 1978
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["蝮蛇釘刺"] = {"在%t內", {"毒蛇釘刺", "毒蠍釘刺", "翼龍釘刺"}}; -- 3034
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蠍釘刺"] = {"持續%t", {"毒蛇釘刺", "蝮蛇釘刺", "翼龍釘刺"}}; -- 3043
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["翼龍釘刺"] = {"沉睡%t", {"毒蛇釘刺", "蝮蛇釘刺", "毒蠍釘刺"}}; -- 19386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["震盪射擊"] = {"持續%t"}; -- 5116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["驅散射擊"] = {"困惑%t"}; -- 19503
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["冰凍陷阱"] = {{"SpellTimer_TrapSearchFunc", {"最多%t內", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰霜陷阱", "獻祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 1499
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["冰霜陷阱"] = {{"SpellTimer_TrapSearchFunc", {"持續%t", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰凍陷阱", "獻祭陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13809
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["獻祭陷阱"] = {{"SpellTimer_TrapSearchFunc", {"在%t內", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰凍陷阱", "冰霜陷阱", "爆炸陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13795
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["爆炸陷阱"] = {{"SpellTimer_TrapSearchFunc", {"接下來的%t", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰凍陷阱", "冰霜陷阱", "獻祭陷阱", "毒蛇陷阱"}, {["notarget"] = 1}}; -- 13813
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["毒蛇陷阱"] = {{"SpellTimer_TrapSearchFunc", {"毒蛇將在%t", "陷阱可存在%t"}, "SpellTimer_TrapActiveFunc"}, {"冰凍陷阱", "冰霜陷阱", "獻祭陷阱", "爆炸陷阱"}, {["notarget"] = 1}}; -- 34600

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["休眠"] = {"持續%t"}; -- 2637
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["月火術"] = {"在%t內"}; -- 8921
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["重擊"] = {"昏迷%t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["挫志咆哮"] = {"持續%t"}; -- 99
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["精靈之火"] = {"持續%t"}; -- 770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["精靈之火"] = {"持續%t"}; -- 13424
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["糾纏根鬚"] = {"在%t內"}; -- 339
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["突襲"] = {"在%t內"}; -- 9005
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["血襲"] = {"debuff"}; -- 9007
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["撕扯"] = {"debuff"}; -- 1079
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["癒合"] = {"在%t內"}; -- 8936
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["回春術"] = {"在%t內", nil, {["live"] = 1}}; -- 774
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["掃擊"] = {"在%t內", nil, {["live"] = 1}}; -- 1822
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["野性衝鋒"] = {"在%t內"}; -- 16979
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["蟲群"] = {"在%t內"}; -- 5570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["重擊"] = {"昏迷%t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["自然之力"] = {"持續%t"}; -- 6913
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割碎 - 熊形態"] = {"持續%t"}; -- 33878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割碎 - 獵豹形態"] = {"持續%t"}; -- 33876
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["割裂"] = {"在%t內"}; -- 33745
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["生命之花"] = {"在%t內"}; -- 33763
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["傷殘術"] = {"debuff"}; -- 22570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["兇蠻咆哮"] = {"buff"}; -- 52610
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["颶風術"] = {"debuff"}; -- 33786
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["蝕星蔽月"] = {"buff", nil, {["live"] = 1, ["spell"] = {"蝕星蔽月 CD", 30}}}; -- 48518

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["風暴打擊"] = {"持續%t"}; -- 17364
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["氣漩武器"] = {"buff", nil, {["live"] = 1}}; -- 51528

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["制裁之錘"] = {"昏迷%t"}; -- 853
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["懺悔"] = {"debuff"}; -- 20066
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["超渡不死生物"] = {"最多%t"}; -- 2878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["神聖啟發"] = {"持續%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31842
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["光明賜福"] = {"持續%t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31833
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["聖光信標"] = {"buff"}; -- 53563
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["公正復仇"] = {"debuff"}; -- 53380

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["變形術"] = {"debuff"}; -- 118, 28271, 28272
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["冰錐術"] = {"持續%t", {"寒冰箭"}}; -- 120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["寒冰箭"] = {"持續%t", {"冰錐術"}}; -- 116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["炎爆術"] = {"在%t內"}; -- 11366
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["火球術"] = {"在%t內"}; -- 133
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["烈焰風暴"] = {"在%t內", nil, {["notarget"] = 1}}; -- 2120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["偵測魔法"] = {"持續%t"}; -- 2855
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["衝擊波"] = {"暈眩%t", nil, {["notarget"] = 1}}; -- 11113
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["冰霜新星"] = {"持續%t", nil, {["notarget"] = 1}}; -- 122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["召喚水元素"] = {"持續%t", nil, {["notarget"] = 1}}; -- 31687
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["減速術"] = {"debuff"}; -- 246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["活體爆彈"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 44457
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["強化灼燒"] = {"debuff"}; -- 11095

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["冰霜熱疫"] = {"debuff"}; -- 55095
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["血魄瘟疫"] = {"debuff"}; -- 55078
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["黑死瘟疫"] = {"debuff"}; -- 51726
else
	SPELL_TIMER_TITILE = "SpellTimer";
	SPELL_TIMER_TEXT_OPTION_SLIDER = "You can add some time on this spell .";
	SPELL_TIMER_IMPROVED_SLICE_DICE = "Slice and Dice";
	SPELL_TIMER_SHOW_NAME = "Show spell name";
	SPELL_TIMER_SHOW_PROGRESS = "Show Progress bar";
	SPELL_TIMER_ENABLE = "Enable SpellTimer";

	SPELL_TIMER_POISON = "Poison";
	SPELL_TIMER_JUDGEMENT = "^Judgement";

	SPELL_TIMER_TRAP_PATTERN1 = "(.-) effect$";
	SPELL_TIMER_TRAP_PATTERN2 = "(.-) aura$";

	SPELL_TIMER_SUMMON_TOTEM = "Totemic Call";
	SPELL_TIMER_TOTEM_PATTERN = "Totem";

	SPELL_TIMER_TOTEM_TIP = "Right click to cancel totem.";

	SPELL_TIMER_UNITFRAME_TOOLTIP = "Hold shift key and left mouse button to move the window";
	
	SPELLTIMER_HOUR_WORD = " hour";
	SPELLTIMER_MINUTE_WORD = " min";
	SPELLTIMER_SECOND_WORD = " sec";

	SPELLTIMER_COOLDOWN_INFO = "%s remains %s.";

	SPELL_TIMER_PATTERN_TABLE = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Fear"] = {"up to %t"}; -- 5782
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Immolate"] = {"over %t"}; -- 348
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Banish"] = {"up to %t"}; -- 710
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Corruption"] = {"debuff", {"Seed of Corruption"}}; -- 172
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Seed of Corruption"] = {"over %t", {"Corruption"}}; -- 27243
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Siphon Life"] = {"Lasts %t"}; -- 18265
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Doom"] = {"after %t", {"Curse of Agony", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shado", "Curse of Exhaustion"}}; -- 603
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Agony"] = {"over %t", {"Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shado", "Curse of Exhaustion"}}; -- 980
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of the Elements"] = {"target for %t", {"Curse of Agony", "Curse of Doom", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shado", "Curse of Exhaustion"}}; -- 1490
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Weakness"] = {"for %t.", {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Tongues", "Curse of Recklessness", "Curse of Shado", "Curse of Exhaustion"}}; -- 702
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Tongues"] = {"Lasts %t.", {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Recklessness", "Curse of Shado", "Curse of Exhaustion"}}; -- 1714
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Recklessness"] = {"for %t.", {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Shado", "Curse of Exhaustion"}}; -- 704
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Shadow"] = {"for %t", {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Exhaustion"}}; -- 17862
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Curse of Exhaustion"] = {"for %t", {"Curse of Agony", "Curse of Doom", "Curse of the Elements", "Curse of Weakness", "Curse of Tongues", "Curse of Recklessness", "Curse of Shado"}}; -- 18223
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Death Coil"] = {"for %t"}; -- 6789
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Howl of Terror"] = {"for %t", nil, {["notarget"] = 1}}; -- 5484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Enslave Demon"] = {"up to %t"}; -- 1098
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Unstable Affliction"] = {"them for %t"}; -- 30108
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARLOCK]["Haunt"] = {"debuff"}; -- 48181

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE][SPELL_TIMER_POISON] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Gouge"] = {"for %t"}; -- 1776
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Garrote"] = {"over %t"}; -- 703
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Sap"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 6770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Expose Armor"] = {"for %t"}; -- 8647
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Cheap Shot"] = {"for %t"}; -- 6409
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Blind"] = {"up to %t"}; -- 2094
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Rupture"] = {"debuff"}; -- 1943
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Slice and Dice"] = {"buff", nil, {["notarget"] = 1, ["live"] = 1}}; -- 5171
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Kick"] = {"for %t"}; -- 1766
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Distract"] = {"for %t"}; -- 1725
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Riposte"] = {"for %t"}; -- 14251
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Kidney Shot"] = {"debuff"}; -- 408
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Hunger For Blood"] = {"buff"}; -- 51662
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_ROGUE]["Shadow Dance"] = {"buff"}; -- 51662

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Shadow Word: Pain"] = {"over %t"}; -- 589
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Silence"] = {"for %t"}; -- 18278
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Psychic Scream"] = {"for %t", nil, {["notarget"] = 1}}; -- 8122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Vampiric Embrace"] = {"for %t"}; -- 15286
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Renew"] = {"over %t"}; -- 139
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Shackle Undead"] = {"up to %t"}; -- 9484
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Devouring Plague"] = {"over %t"}; -- 2944
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Mind Control"] = {"up to %t"}; -- 605
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Holy Fire"] = {"over %t"}; -- 14914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Mind Soothe"] = {"Lasts %t"}; -- 453
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Vampiric Touch"] = {"over %t"}; -- 34914
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PRIEST]["Starshards"] = {"over %t"}; -- 10797

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Hamstring"] = {"for %t"}; -- 1715
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Rend"] = {"over %t"}; -- 772
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Shield Bash"] = {"cast for %t"}; -- 72
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Demoralizing Shout"] = {"for %t"}; -- 1160
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Piercing Howl"] = {"for %t"}; -- 12323
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Mocking Blow"] = {"for %t"}; -- 694
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Thunder Clap"] = {"for %t"}; -- 6343
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Disarm"] = {"for %t"}; -- 676
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Intimidating Shout"] = {"Lasts %t"}; -- 5246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Sunder Armor"] = {"Lasts %t"}; -- 7386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Mortal Strike"] = {"for %t"}; -- 12294
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Intercept"] = {"for %t"}; -- 20252
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_WARRIOR]["Rampage"] = {"Lasts %t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 29801

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Flare"] = {"for %t"}; -- 1543
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Wing Clip"] = {"for %t"}; -- 2974
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Scare Beast"] = {"up to %t"}; -- 1513 
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Counterattack"] = {"for %t"}; -- 19306
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Mend Pet"] = {"over %t"}; -- 136
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Bestial Wrath"] = {"for %t"}; -- 19574
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Serpent Sting"] = {"over %t", {"Viper Sting", "Scorpid Sting", "Wyvern Sting"}}; -- 1978
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Viper Sting"] = {"over %t", {"Serpent Sting", "Scorpid Sting", "Wyvern Sting"}}; -- 3034
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Scorpid Sting"] = {"for %t", {"Serpent Sting", "Viper Sting", "Wyvern Sting"}}; -- 3043
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Wyvern Sting"] = {"sleep for %t", {"Serpent Sting", "Viper Sting", "Scorpid Sting"}}; -- 19386
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Concussive Shot"] = {"for %t"}; -- 5116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Scatter Shot"] = {"for %t"}; -- 19503
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Freezing Trap"] = {{"SpellTimer_TrapSearchFunc", {"preventing all action for up to %t", "exist for %t"}, "SpellTimer_TrapActiveFunc"}, nil, nil, {"Frost Trap", "Immolation Tra", "Explosive Trap", "Snake Trap"}, {["notarget"] = 1}}; -- 1499
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Frost Trap"] = {{"SpellTimer_TrapSearchFunc", {"around itself for %t", "exist for %t"}, "SpellTimer_TrapActiveFunc"}, {"Freezing Trap", "Immolation Trap", "Explosive Trap", "Snake Trap"}, {["notarget"] = 1}}; -- 13809
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Immolation Trap"] = {{"SpellTimer_TrapSearchFunc", {"damage over %t", "exist for %t"}, "SpellTimer_TrapActiveFunc"}, {"Freezing Trap", "Frost Trap", "Explosive Trap", "Snake Trap"}, {["notarget"] = 1}}; -- 13795
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Explosive Trap"] = {{"SpellTimer_TrapSearchFunc", {"damage over %t", "exist for %t"}, "SpellTimer_TrapActiveFunc"}, {"Freezing Trap", "Frost Trap", "Immolation Trap", "Snake Trap"}, {["notarget"] = 1}}; -- 13813
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_HUNTER]["Snake Trap"] = {{"SpellTimer_TrapSearchFunc", {"after %t", "exist for %t"}, "SpellTimer_TrapActiveFunc"}, {"Freezing Trap", "Frost Trap", "Immolation Trap", "Explosive Trap"}, {["notarget"] = 1}}; -- 34600

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Hibernate"] = {"up to %t"}; -- 2637
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Moonfire"] = {"over %t"}; -- 8921
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Bash"] = {"for %t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Demoralizing Roar"] = {"Lasts %t"}; -- 99
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Faerie Fire"] = {"for %t"}; -- 770
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Faerie Fire"] = {"for %t"}; -- 13424
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Entangling Roots"] = {"over %t"}; -- 339
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Pounce"] = {"for %t"}; -- 9005
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Pounce Bleed"] = {"debuff"}; -- 9007
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Rip"] = {"debuff"}; -- 1079
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Regrowth"] = {"over %t", nil, {["live"] = 1}}; -- 8936
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Rejuvenation"] = {"over %t", nil, {["live"] = 1}}; -- 774
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Rake"] = {"over %t"}; -- 1822
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Feral Charge"] = {"for %t"}; -- 16979
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Insect Swarm"] = {"over %t"}; -- 5570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Bash"] = {"for %t"}; -- 5211
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Force of Nature"] = {"for %t"}; -- 6913
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Mangle - Bear"] = {"effects for %t"}; -- 33878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Mangle - Cat"] = {"effects for %t"}; -- 33876
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Lacerate"] = {"over %t"}; -- 33745
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Lifebloom"] = {"over %t"}; -- 33763
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Maim"] = {"debuff"}; -- 22570
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Savage Roar"] = {"buff"}; -- 52610
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Cyclone"] = {"debuff"}; -- 33786
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DRUID]["Eclipse"] = {"buff", nil, {["live"] = 1, ["spell"] = {"Eclipse CD", 30}}}; -- 48518

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["Stormstrike"] = {"Lasts %t"}; -- 17364
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_SHAMAN]["Maelstrom Weapon"] = {"buff", nil, {["live"] = 1}}; -- 51528

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Hammer of Justice	"] = {"for %t"}; -- 853
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Repentance"] = {"debuff"}; -- 20066
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Turn Undead"] = {"up to %t"}; -- 2878
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Divine Illumination"] = {"for %t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31842
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Light's Grace"] = {"lasts %t", nil, {["notarget"] = 1, ["live"] = 1}}; -- 31833
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Beacon of Light"] = {"buff"}; -- 53563
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_PALADIN]["Righteous Vengeance"] = {"debuff"}; -- 53380

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Polymorph"] = {"debuff"}; -- 118, 28271, 28272
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Cone of Cold"] = {"for %t", {"Frostbolt"}}; -- 120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Frostbolt"] = {"for %t", {"Cone of Cold"}}; -- 116
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Pyroblast"] = {"over %t"}; -- 11366
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Fireball"] = {"over %t"}; -- 133
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Flamestrike"] = {"over %t", nil, {["notarget"] = 1}}; -- 2120
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Detect Magic"] = {"for %t"}; -- 2855
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Blast Wave"] = {"for %t", nil, {["notarget"] = 1}}; -- 11113
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Frost Nova"] = {"for %t", nil, {["notarget"] = 1}}; -- 122
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Summon Water Elemental"] = {"for %t", nil, {["notarget"] = 1}}; -- 31687
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Slow"] = {"debuff"}; -- 246
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Living Bomb"] = {"debuff", nil, {["live"] = 1, ["unique"] = 1}}; -- 44457
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_MAGE]["Improved Scorch"] = {"debuff"}; -- 11095

	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT] = {};
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["Frost Fever"] = {"debuff"}; -- 55095
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["Blood Plague"] = {"debuff"}; -- 55078
	SPELL_TIMER_PATTERN_TABLE[BF_CLASS_DEATHKNIGHT]["Ebon Plague"] = {"debuff"}; -- 51726
end