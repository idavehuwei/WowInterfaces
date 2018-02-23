--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Translationed by x00s                                                      *
  * Locales/Locale-enUS.lua - Localized string constants (en-US).              *
  ****************************************************************************]]


do
	local Title = "_|cffCCCC88NPCScan|r";
	local LDQuo, RDQuo = GRAY_FONT_COLOR_CODE.."\226\128\156", "\226\128\157|r";


	local Metatable = {
		__index = function ( self, Key )
			if ( Key ~= nil ) then
				rawset( self, Key, Key );
				return Key;
			end
		end;
	};
	_NPCScanLocalization = setmetatable( {
		NPCS = setmetatable( {}, Metatable );

		MESSAGE_FORMAT = Title..": %s";

		FOUND_FORMAT = "发现 "..LDQuo.."%s"..RDQuo.."!";
		FOUND_TAMABLE_FORMAT = "发现 "..LDQuo.."%s"..RDQuo.."!  "..RED_FONT_COLOR_CODE.."(备注：该NPC可驯服，可能是误报)|r";
		FOUND_TAMABLE_WRONGZONE_FORMAT = RED_FONT_COLOR_CODE.."误报：|r 发现可驯服目标 "..LDQuo.."%s"..RDQuo.." 出现在 %s 而非出现在刷新地 %s；明显是宠物。"; -- Name, CurrentZone, ExpectedZone
		FOUND_TAMABLE_RESTING_FORMAT = RED_FONT_COLOR_CODE.."误报：|r 在休息时发现可驯服目标 "..LDQuo.."%s"..RDQuo.." ；可能是宠物。";
		BUTTON_FOUND = "发现NPC！";

		CACHED_LONG_FORMAT = "以下目标已经被发现，请考虑用一下命令移除这些目标 "..LDQuo.."/npcscan"..RDQuo.."'s 菜单或者清除你的Cache文件以重置数据： %s.";
		CACHED_FORMAT = "以下目标已经被发现: %s";
		CACHED_NAME_FORMAT = LDQuo.."%s"..RDQuo;
		CACHED_SEPARATOR = ", ";

		OVERLAY_INCOMPATIBLE = "你的插件 %s ("..GRAY_FONT_COLOR_CODE.."%s|r) 和 "..Title.." ("..GRAY_FONT_COLOR_CODE.."%s|r) 是不匹配的，请升级NpcScan和NpcScan.Overlay插件以便正常使用（提示：升级插件可能导致汉化无效）。"; -- Overlay name, Overlay version, _NPCScan version

		CONFIG_TITLE = Title;
		CONFIG_DESC = "这些选项提供当NPCScan找到稀有怪时的报警方式。";

		CONFIG_CACHEWARNINGS = "发布清除Cache文件的登陆提示。";
		CONFIG_CACHEWARNINGS_DESC = "如果之前已经有稀有怪被发现过，这个选项将提醒你清除Cache。";

		CONFIG_ALERT = "报警选项";

		CONFIG_TEST = "测试发现报警";
		CONFIG_TEST_DESC = "假设有一个 "..LDQuo.."NPC被发现，"..RDQuo.." 将以这种形式提示你。";
		CONFIG_TEST_NAME = "你自己！(测试)";
		CONFIG_TEST_HELP_FORMAT = "单击目标按钮或者使用热键以将目标定位到NPC上。  点住 "..HIGHLIGHT_FONT_COLOR_CODE.."<%s>|r 并且拖动以移除目标按钮. 当你在进入战斗时会标记NPC目标，该按钮将在你脱离战斗后再次出现。";

		CONFIG_ALERT_UNMUTE = "静音的报警声";
		CONFIG_ALERT_UNMUTE_DESC = "当你关闭游戏音效时，发现NPC后将会短暂的启用游戏音效以进行告警。";
		CONFIG_ALERT_SOUND = "报警音效";
		CONFIG_ALERT_SOUND_DESC = "当发现NPC时选择播放报警音。可以在以下位置添加音效："..LDQuo.."SharedMedia"..RDQuo.." 插件.";
		CONFIG_ALERT_SOUND_DEFAULT = NORMAL_FONT_COLOR_CODE..DEFAULT.."|r";


		SEARCH_TITLE = "搜索";
		SEARCH_DESC = "这个表可以用于添加、删除NPC和取得的成就扫描.";

		SEARCH_FINDTAMABLE = "搜索可以被驯服的稀有怪";
		SEARCH_FINDTAMABLE_DESC = "搜索可以被猎人驯服的稀有怪.";
		SEARCH_FINDTAMABLE_WARNING = RED_FONT_COLOR_CODE.."警告：猎人携带的稀有怪宠物同样会触发警报.|r";
		SEARCH_ACHIEVEMENTADDFOUND = "搜索已有成就的稀有怪";
		SEARCH_ACHIEVEMENTADDFOUND_DESC = "继续搜索所有有成就的稀有怪, 即使你不再需要它们.";

		SEARCH_NPCS = "自定义NPC";
		SEARCH_NPCS_DESC = "添加任何NPC至搜索列表，即使对完成成就没有任何帮助.";
		SEARCH_ACHIEVEMENT_DISABLED = "禁用";

		SEARCH_CACHED = "已捕获";
		SEARCH_NAME = "名称：";
		SEARCH_NAME_DESC = "NPC的标签，只需要关键字，无需和NPC的名字完全匹配。";
		SEARCH_ID = "NPC ID：";
		SEARCH_ID_DESC = "搜索NPC对应的ID号。你可以在WowHead.com网站上找到该NPC的ID";
		SEARCH_COMPLETED = "完成";

		SEARCH_CACHED_YES = "|T"..READY_CHECK_NOT_READY_TEXTURE..":0|t";
		SEARCH_CACHED_NO = "";
		SEARCH_COMPLETED_YES = "|T"..READY_CHECK_READY_TEXTURE..":0|t";
		SEARCH_COMPLETED_NO = "";

		SEARCH_ADD = "+";
		SEARCH_REMOVE = "-";
		SEARCH_ADD_TAMABLE_FORMAT = "提示: "..LDQuo.."%s"..RDQuo.." 该宠物是可以驯养的，因此可能是其他猎人携带的宠物引发的误报。";


		CMD_ADD = "ADD";
		CMD_REMOVE = "REMOVE";
		CMD_REMOVENOTFOUND_FORMAT = "NPC "..LDQuo.."%s"..RDQuo.." not found.";
		CMD_HELP = "命令格式如下："..LDQuo.."/npcscan add <NpcID> <Name>"..RDQuo..", "..LDQuo.."/npcscan remove <Name>"..RDQuo..", and simply "..LDQuo.."/npcscan"..RDQuo.." 打开选项窗口。";
	}, Metatable );




--------------------------------------------------------------------------------
-- Globals
----------

	SLASH__NPCSCAN1 = "/npcscan";
	SLASH__NPCSCAN2 = "/scan";

	BINDING_HEADER__NPCSCAN = Title;
	_G[ "BINDING_NAME_CLICK _NPCScanButton:LeftButton" ] = "目标上次刷新位置：\n"..GRAY_FONT_COLOR_CODE.."(当NPCScan报警时使用)|r";
end
