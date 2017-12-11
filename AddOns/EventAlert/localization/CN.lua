local L = LibStub("AceLocale-3.0"):NewLocale("EventAlert", "zhCN");
if L then
	L["Event Alert Frame"] = "特效指示器";
	L["EventAlert: You must unlock the alert frame in order to move it or reset it's position."] = "特效指示器: 你必须解锁报警框架后才能移动或者重置位置";
	L["EventAlert Options"] = "特效指示器选项"
	L["ShaysBell"] = "午夜魅影";
	L["Flute"] = "长笛";
	L["Netherwind"] = "灵风";
	L["PolyCow"] = "宝利牛";
	L["Rockbiter"] = "石化";
	L["Yarrrr!"] = "呀呀呀";
	L["Broken Heart"] = "心碎";
	L["Millhouse 1!"] = "磨坊1";
	L["Millhouse 2!"] = "磨坊2";
	L["Pissed Satyr"] = "愤怒的萨梯";
	L["Pissed Dwarf"] = "愤怒的侏儒";
end

if (GetLocale() == "zhCN") then	
	EA_TOGGLE_PRIMARIESE = "选择法术";
	EA_SPELL_SORT_DESC = "法术已按照法术ID排序";
	EA_SPELL_LINK_DESC = "法术ID在方括号中";
	EA_VISI_WOWHEAD = "复制以下链接到浏览器中查询法术ID"
	EA_POSITION_OPTION = "图示位置选项";
	EA_LOCK_FRAME = "锁定窗体";
	EA_ICON_SIZE = "图示大小";
	EA_ICON_SIZE_BIG = "大";
	EA_ICON_SIZE_SMALL = "小";
	EA_HOR_SPACE = "水平间距";
	EA_HOR_SPACE_MORE = "大";
	EA_HOR_SPACE_LESS = "小";
	EA_VER_SPACE = "垂直间距";
	EA_VER_SPACE_MORE = "大";
	EA_VER_SPACE_LESS = "小";
	EA_TOGGLE_ALTERNATE_TITLE = "选择触发技能";
	EA_TOOGLE_VISIBLE = "显示/隐藏警报窗体";
	EA_RESET_POSITION = "重置窗体位置";
	EA_ICON_POSIZION_OPTION = "图标位置选项";
	EA_SHOW_ALERTFRAME = "显示警报窗体";
	EA_SHOW_BUFF_NAME = "显示Buff名字";
	EA_SHOW_BUFF_REMAIN = "显示计时器";
	EA_MOFANG_OMNICC = "模仿OmniCC功能";
	EA_SHOW_FULL_FLASH = "显示全屏闪动警报";
	EA_PLAY_ALERT_SOUND = "播放音效警报";
	EA_ESC_TO_CLOSE = "ESC键关闭警报";
	EA_TOGGLE_ALTERNATE = "启用条件警报(如: 斩杀)";
	EA_TOGGLE_CLASS_ALERT = "职业法术选项";
	EA_OKAY = "确定";

	EA_TTIP_DOALERTSOUND = "当事件触发时播放声音.";
	EA_TTIP_ALERTSOUNDSELECT = "选择事件触发时的提示声音.";
	EA_TTIP_LOCKFRAME = "锁定提示窗体以避免意外的拖动.";
	EA_TTIP_SHOWFRAME = "在事件触发时显示或隐藏提示窗体.";
	EA_TTIP_SHOWNAME = "在事件触发时显示或隐藏Buff名称.";
	EA_TTIP_SHOWFLASH = "在事件触发时显示或隐藏全屏闪烁效果.";
	EA_TTIP_SHOWTIMER = "在事件触发时显示或隐藏Buff剩余时间.";
	EA_TTIP_CHANGETIMER = "改变计时器的字体和位置.";
	EA_TTIP_ICONSIZE = "改变报警图标的尺寸.";
	EA_TTIP_ALLOWESC = "使用ESC键来关闭报警窗体. (注:  需要重载界面)";
	EA_TTIP_ALTALERTS = "当条件满足时提示相应技能的警报(如: 斩杀)";

	EA_TTIP_ICONXOFFSET = "改变提示窗口的水平间距.";
	EA_TTIP_ICONYOFFSET = "改变提示窗口的垂直间距.";

	EA_CLASS_DK = "DEATHKNIGHT";
	EA_CLASS_DRUID = "DRUID";
	EA_CLASS_HUNTER = "HUNTER";
	EA_CLASS_MAGE = "MAGE";
	EA_CLASS_PALADIN = "PALADIN";
	EA_CLASS_PRIEST = "PRIEST";
	EA_CLASS_ROGUE = "ROGUE";
	EA_CLASS_SHAMAN = "SHAMAN";
	EA_CLASS_WARLOCK = "WARLOCK";
	EA_CLASS_WARRIOR = "WARRIOR";
	EA_CLASS_FUNKY = "FUNKY";
	EA_CLASS_OTHER = "OTHER";
end
