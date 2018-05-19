--[[****************************************************************************
  * _NPCScan by Saiket                                                         *
  * Locales/Locale-zhCN.lua - Localized string constants (zh-CN).              *
  ****************************************************************************]]


if ( GetLocale() ~= "zhCN" ) then
    return;
end


-- See http://wow.curseforge.com/addons/npcscan/localization/zhCN/
local _NPCScan = select( 2, ... );
_NPCScan.L = setmetatable( {
    NPCs = setmetatable( {
        [ 18684 ] = "独行者布罗加斯",
        [ 32491 ] = "时光流逝始祖幼龙",
        [ 33776 ] = "古德利亚",
        [ 35189 ] = "逐日",
        [ 38453 ] = "大角",
    }, { __index = _NPCScan.L.NPCs; } );

    BUTTON_FOUND = "发现NPC！",
    CACHED_FORMAT = "下列目标已经存入缓存：%s",
    CACHED_LONG_FORMAT = "下列目标已经存入缓存。请考虑使用|cff808080“/npcscan”|r'设置菜单将其移除，或通过清空缓存来重置：%s",
    CACHED_PET_RESTING_FORMAT = "下列可驯服宠物在休息时加入缓存：%s",
    CACHED_WORLD_FORMAT = "下列目标%2$s unit(s) are already cached: %1$s.",
    CACHELIST_ENTRY_FORMAT = "|cff808080“%s”|r",
    CACHELIST_SEPARATOR = ",",
    CMD_ADD = "ADD",
    CMD_CACHE = "CACHE",
    CMD_CACHE_EMPTY = "搜索的怪物均没有存入缓存。",
    CMD_HELP = "命令为|cff808080“/npcscan add <NpcID> <Name>”|r、|cff808080“/npcscan remove NPC ID或名字”|r、|cff808080“/npcscan cache”|r列出已缓存的怪物，|cff808080“/npcscan”|r打开设置界面",
    CMD_REMOVE = "REMOVE",
    CMD_REMOVENOTFOUND_FORMAT = "NPC|cff808080“%s”|r未找到",
    CONFIG_ALERT = "警报选项",
    CONFIG_ALERT_SOUND = "警报所用声音文件",
    CONFIG_ALERT_SOUND_DEFAULT = "|cffffd200默认|r",
    CONFIG_ALERT_SOUND_DESC = "选择发现NPC时的警报音效，SharedMedia插件可以提供更多额外音效。",
    CONFIG_ALERT_UNMUTE = "取消静音",
    CONFIG_ALERT_UNMUTE_DESC = "如果你静音了游戏则在找到NPC时解除静音",
    CONFIG_CACHEWARNINGS = "在登录和切换区域时显示缓存提示",
    CONFIG_CACHEWARNINGS_DESC = "如果某个NPC在你登录或改变区域时已经在缓存中了，这一选项将显示一条关于已缓存怪物无法搜索的提示。",
    CONFIG_DESC = "这些选项可定制_NPCScan在找到稀有NPC时的警示方式。",
    CONFIG_TEST = "测试警报",
    CONFIG_TEST_DESC = "模拟一次|cff808080“发现NPC”|r警报好让你知道该看啥",
    CONFIG_TEST_HELP_FORMAT = "点击目标按钮或使用热键选定找到的怪物。按住|cffffffff<%s>|r并拖动可以移动目标按钮。注意，如果在战斗中发现NPC，目标按钮只会在离开战斗后显示。",
    CONFIG_TEST_NAME = "你！（测试用）",
    CONFIG_TITLE = "_|cffCCCC88NPCScan|r",
    FOUND_FORMAT = "发现|cff808080“%s”|r！",
    FOUND_TAMABLE_FORMAT = "发现|cff808080“%s”|r！|cffff2020(注意：可驯服，没准是个宠物)|r",
    FOUND_TAMABLE_WRONGZONE_FORMAT = "|cffff2020错误警示:|r 发现可驯服宠物|cff808080“%s”|r，位于%s而不是%s (ID %d)；肯定是宠物。",
    PRINT_FORMAT = "_|cffCCCC88NPCScan|r: %s",
    SEARCH_ACHIEVEMENTADDFOUND = "搜索已完成成就的NPC",
    SEARCH_ACHIEVEMENTADDFOUND_DESC = "继续搜寻任何成就类NPC，即使你已经不再需要它们。",
    SEARCH_ACHIEVEMENT_DISABLED = "禁用",
    SEARCH_ADD = "+",
    SEARCH_ADD_DESC = "添加新NPC或保存改动",
    SEARCH_ADD_TAMABLE_FORMAT = "注意：|cff808080“%s”|r可驯服，如果发现某个猎人的宠物是它的话会触发错误警示。",
    SEARCH_CACHED = "已缓存",
    SEARCH_COMPLETED = "完成",
    SEARCH_DESC = "这个表格可添加或移除需扫描的NPC和成就。",
    SEARCH_ID = "NPC ID：",
    SEARCH_ID_DESC = "要搜寻的NPC的ID，这一数值可以wowhead等数据库找到",
    SEARCH_NAME = "名称：",
    SEARCH_NAME_DESC = "NPC的标签，不一定要和NPC名字对应。",
    SEARCH_NPCS = "自定义NPC",
    SEARCH_NPCS_DESC = "搜索任意NPC，即便它没有相关成就",
    SEARCH_REMOVE = "-",
    SEARCH_TITLE = "搜索",
    SEARCH_WORLD = "地狱：",
    SEARCH_WORLD_DESC = "可选的",
    SEARCH_WORLD_FORMAT = "(%s)",
}, { __index = _NPCScan.L; } );


_G[ "BINDING_NAME_CLICK _NPCScanButton:LeftButton" ] = [=[选定最后一个找到的怪物
|cff808080(在_NPCScan警报时使用)|r]=];