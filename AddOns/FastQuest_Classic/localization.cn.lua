-- $Id: localization.cn.lua 79 2009-05-21 18:19:42Z arithmandar $
-- [[
-- Simplified Chinese
-- Last Updated: 2008/12/07
-- ]]
--------------------------
-- Translatable strings --
--------------------------

if (GetLocale() == "zhCN") then
    FQ_Formats = {
        "任务名称",
        "[等级] 任务名称",
        "[等级+] 任务名称",
        "[等级+] 任务名称 (类型)",
    };
    --
    EPA_TestPatterns = {
        "^(.+)：%s*[-%d]+%s*/%s*[-%d]+%s*$",
        "^(.+)[^交易]完成", -- ERR_QUEST_COMPLETE_S
        "^(.+)（完成）$", -- ERR_QUEST_OBJECTIVE_COMPLETE_S
        "^接受任务：.+$", -- ERR_QUEST_ACCEPTED_S
        "^获得经验值：.+$", -- ERR_QUEST_REWARD_EXP_I
        "^发现：.+$", -- ERR_ZONE_EXPLORED
    };
    --
    FQ_QUEST_TEXT = "(.*)：%s*([-%d]+)%s*/%s*([-%d]+)%s*$";
    --
    FQ_LOADED = "|cff00ffffFastQuest Classic " .. FASTQUEST_CLASSIC_VERSION .. " 已载入. 输入 /fq 以取得更多的设定信息. 输入 /fq options 以开启选项设定窗口";
    FQ_INFO = "|cff00ffffFastQuest Classic: |r|cffffffff";
    -- Strings in Option Frame
    FQ_OPT_OPTIONS_TITLE = "FastQuest Classic 选项";
    FQ_OPT_FRM_NOTIFY_TITLE = "任务通报设定";
    FQ_OPT_AUTONOTIFY_TITLE = "自动通报";
    FQ_OPT_AUTONOTIFY_TIP = "自动将任务相关讯息通报给邻近地区、队伍伙伴、团队队友、公会成员等。";
    FQ_OPT_DOUBLEWIDTH_TITLE = "双倍任务窗口宽度";
    FQ_OPT_DOUBLEWIDTH_TIP = "切换以正常方式或是双倍窗口宽度显示任务窗口";
    FQ_OPT_NOTIFYCHANNEL_TITLE = "通报频道设定";
    FQ_OPT_NOTIFYNEARBY_TITLE = "向邻近地区通报";
    FQ_OPT_NOTIFYNEARBY_TIP = "向邻近地区通报，在邻近的人员都会接获通报";
    FQ_OPT_NOTIFYPARTY_TITLE = "向队伍伙伴通报";
    FQ_OPT_NOTIFYPARTY_TIP = "在队伍频道通报，以使队伍伙伴获知自己的任务进度";
    FQ_OPT_NOTIFYRAID_TITLE = "向团队通报";
    FQ_OPT_NOTIFYRAID_TIP = "在团队频道通报，以使所有团队成员获知自己的任务进度";
    FQ_OPT_NOTIFYGUILD_TITLE = "向公会通报";
    FQ_OPT_NOTIFYGUILD_TIP = "在公会频道通报，以使所有公会成员获知自己的任务进度";
    FQ_OPT_NOTIFYDETAIL_TITLE = "详尽通报";
    FQ_OPT_NOTIFYDETAIL_TIP = "详尽的通报任务的完成度";
    FQ_OPT_NOTIFYEXP_TITLE = "通报经验获得";
    FQ_OPT_NOTIFYEXP_TIP = "在缴交任务并且获得经验值时，通报所获得的经验值";
    FQ_OPT_NOTIFYZONE_TITLE = "通报新地区探索";
    FQ_OPT_NOTIFYZONE_TIP = "当发现新地区时通报所发现的地区信息";
    FQ_OPT_NOTIFYLEVELUP_TITLE = "通报等级升级";
    FQ_OPT_NOTIFYLEVELUP_TIP = "当自己等级升级时，通报此升级讯息";
    FQ_OPT_FRM_QUESTFORMAT_TITLE = "任务显示格式设定";
    FQ_OPT_QUESTFORMAT_TITLE = "选择任务显示格式";
    FQ_OPT_QUESTFORMAT_TIP = "选择在聊天框中显示任务名称的格式";
    FQ_OPT_QUESTLOGOPTIONS_TITLE = "任务窗口选项";
    FQ_OPT_COLOR_TITLE = "启用颜色";
    FQ_OPT_COLOR_TIP = "在任务追踪窗口将任务的标题依照任务的难易度以对应的颜色来显示";
    FQ_OPT_MEMBERINFO_TITLE = "显示建议人数";
    FQ_OPT_MEMBERINFO_TIP = "在任务窗口标题加注建议的参与人数";
    FQ_OPT_MINIMAP_POSITION_TITLE = "小地图按钮位置";
    FQ_OPT_SHOWTYPE_TITLE = "显示任务类型";
    FQ_OPT_SHOWTYPE_TIP = "在任务追踪窗口显示任务的类型";
    FQ_OPT_LOCK_TITLE = "锁定任务追踪窗口";
    FQ_OPT_LOCK_TIP = "锁定任务追踪窗口的位置";
    FQ_OPT_AUTOADD_TITLE = "自动新增/移除任务";
    FQ_OPT_AUTOADD_TIP = "自动将可追踪的任务增加至任务追踪窗口，或当完成时自动移除";
    FQ_OPT_AUTOCOMPLETE_TITLE = "自动缴交任务";
    FQ_OPT_AUTOCOMPLETE_TIP = "当任务完成时，与任务 NPC 对谈时自动缴交任务";
    FQ_OPT_FRM_MISC_TITLE = "其它选项";
    FQ_OPT_SHOWMINIMAP_TITLE = "显示小地图按钮";
    FQ_OPT_SHOWMINIMAP_TIP = "切换在小地图旁显示按钮与否";

    FQ_BUTTON_TOOLTIP = "鼠标左键开启任务窗口.\n鼠标中键开启 FastQuest Classic 选像窗口.\n鼠标右键并拖曳以移动图标按钮位置.";

    -- Information Message
    FQ_INFO_NOTIFYGUILD = "在公会频道中通知任务进度: ";
    FQ_INFO_NOTIFYRAID = "在团队频道中通知任务进度: ";
    FQ_INFO_NOTIFYNEARBY = "对邻近区域通知任务进度: ";
    FQ_INFO_NOTIFYPARTY = "在队伍频道通知任务进度: ";
    FQ_INFO_AUTOADD = "自动新增目前的任务到任务追踪窗口并移出已完成的任务: ";
    FQ_INFO_AUTOCOMPLETE = "自动完成并提交任务: ";
    FQ_INFO_AUTONOTIFY = "自动通知队友任务进展情况于队伍频道中: ";
    FQ_INFO_CLEAR = "清除所有任务追踪窗口中的任务";
    FQ_INFO_COLOR = "在任务追踪窗口依任务难易度以不同的颜色显示任务标题: ";
    FQ_INFO_DETAIL = "详细的通知任务进度: ";
    FQ_INFO_DISPLAY_AS = "任务显示格式: ";
    FQ_INFO_DOUBLEWIDTH = "任务窗口双倍宽度显示: ";
    FQ_INFO_FORMAT = "选择在聊天框中显示任务名称的格式";
    FQ_INFO_LOCK = "任务追踪窗口已|cffff0000锁定|r|cffffffff";
    FQ_INFO_MEMBERINFO = "显示任务建议的队伍人数信息: ";
    FQ_INFO_NOTIFYDISCOVER = "通报所发现的新地点: ";
    FQ_INFO_NOTIFYEXP = "通报完成任务时所获得的经验值: ";
    FQ_INFO_NOTIFYLEVELUP = "通报升级讯息: ";
    FQ_INFO_QUEST_TAG = "在任务追踪窗口显示任务的类型: ";
    FQ_INFO_RESET = "重设任务追踪窗口位置";
    FQ_INFO_SHOWMINIMAP = "显示小地图按钮: ";
    FQ_INFO_UNLOCK = "任务追踪窗口已|cff00ff00解锁|r|cffffffff";
    FQ_INFO_USAGE = "指令 /fastquest [command] 或 /fq [command]";
    --
    FQ_MUST_RELOAD = "你必需输入 /console reloadui 本功能才可作用";
    --
    FQ_USAGE_NOTIFYGUILD = "在公会频道中通知任务进度";
    FQ_USAGE_NOTIFYRAID = "在团队频道中通知任务进度";
    FQ_USAGE_NOTIFYNEARBY = "对邻近区域通知任务进度";
    FQ_USAGE_NOTIFYPARTY = "在队伍频道中通知任务进度";
    FQ_USAGE_AUTOADD = "是否自动追踪任务";
    FQ_USAGE_AUTOCOMPLETE = "自动完成并提交任务";
    FQ_USAGE_AUTONOTIFY = "通知队友任务进度于队伍频道中";
    FQ_USAGE_CLEAR = "清除所有任务追踪窗口中的任务";
    FQ_USAGE_COLOR = "设定在任务追踪窗口中是否依任务难易度以不同的颜色显示任务标题.";
    FQ_USAGE_DETAIL = "详细的通知任务进度情况";
    FQ_USAGE_FORMAT = "(按 Ctrl 点选任务) 在聊天框中显示任务名称格式共4种每输入一次切换一种, 如:[10+]任务名称,[10]任务名称(精英)";
    FQ_USAGE_LOCK = "锁定/解锁任务追踪窗口位置";
    FQ_USAGE_MEMBERINFO = "设定是否显示任务建议的队伍人数信息";
    --FQ_USAGE_NODRAG = "是否强制任务追踪窗口不可被移动, 重新登入或输入 /console reloadui 才有作用";
    FQ_USAGE_NOTIFYDISCOVER = "切换是否通报所发现的新区域";
    FQ_USAGE_NOTIFYEXP = "切换是否通报从一个完成的任务中所获得的经验奖励";
    FQ_USAGE_NOTIFYLEVELUP = "切换是否通报升级的讯息";
    FQ_USAGE_RESET = "重新设定任务追踪窗口位置";
    FQ_USAGE_STATUS = "显示所有 FastQuest Classic 的设定状态";
    FQ_USAGE_OPTIONS = "开启选项设定窗口";
    FQ_USAGE_TAG = "在任务追踪清单显示任务类型 (菁英, 团队, PvP 等) ";
    --
    --BINDING_CATEGORY_FASTQUEST_CLASSIC = "任务增强";
    BINDING_HEADER_FASTQUEST_CLASSIC = "FastQuest Classic";
    BINDING_NAME_FASTQUEST_OPTIONS = "FastQuest Classic 选项设定";
    BINDING_NAME_FQ_TAG = "任务追踪窗口困难度";
    BINDING_NAME_FQ_FORMAT = "选择聊天任务名称格式";
    BINDING_NAME_FQ_AOUTNOTIFY = "自动通知队友";
    BINDING_NAME_FQ_AOUTCOMPLETE = "自动完成提交任务";
    BINDING_NAME_FQ_AOUTADD = "自动添加任务追踪窗口";
    BINDING_NAME_FQ_LOCK = "任务追踪窗口解锁/锁定";
    --
    FQ_QUEST_PROGRESS = "任务进度: ";
    --
    FQ_QUEST_ISDONE = "已完成! ";
    FQ_QUEST_COMPLETED = " (任务完成)";
    FQ_DRAG_DISABLED = "FastQuest Classic: 移动任务追踪窗口现在是关闭的, 输入 /fq nodrag 来设定. 你必须重新加载 UI 来使这改变生效.";
    --
    FQ_ENABLED = "|cff00ff00启动|r|cffffffff";
    FQ_DISABLED = "|cffff0000关闭|r|cffffffff";
    FQ_LOCK = "|cffff0000锁定|r|cffffffff";
    FQ_UNLOCK = "|cff00ff00解除|r|cffffffff";
    --
end

