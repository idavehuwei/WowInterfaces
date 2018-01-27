-- $Id: localization.tw.lua 79 2009-05-21 18:19:42Z arithmandar $
-- [[
-- Traditional Chinese
-- Last Updated: 2008/12/07
-- ]]
--------------------------
-- Translatable strings --
--------------------------
if (GetLocale() == "zhTW") then
    FQ_Formats = {
        "任務名稱",
        "[等級] 任務名稱",
        "[等級+] 任務名稱",
        "[等級+] 任務名稱 (類型)",
    };
    --
    EPA_TestPatterns = {
        "^(.+):%s*[-%d]+%s*/%s*[-%d]+%s*$",
        "^(.+)[^交易]完成", -- ERR_QUEST_COMPLETE_S = "%s完成。"
        "^(.+) \(完成\)$", -- ERR_QUEST_OBJECTIVE_COMPLETE_S = "%s (完成)"
        "^接受任務:.+$", -- ERR_QUEST_ACCEPTED_S = "接受任務:%s"
        "^獲得經驗值:.+$", -- ERR_QUEST_REWARD_EXP_I = "獲得經驗值:%d"
        "^發現:(.+)$", -- ERR_ZONE_EXPLORED = "發現:%s"
    };
    --
    FQ_QUEST_TEXT = "(.*):%s*([-%d]+)%s*/%s*([-%d]+)%s*$"; -- ERR_QUEST_ADD_FOUND_SII = "%s:%d/%d", ERR_QUEST_ADD_ITEM_SII = "%s:%d/%d", ERR_QUEST_ADD_KILL_SII = "已殺死%s:%d/%d"
    --
    FQ_LOADED = "|cff00ffffFastQuest Classic " .. FASTQUEST_CLASSIC_VERSION .. " 已載入. 輸入 /fq 以取得更多的設定資訊. 輸入 /fq options 以開啟選項設定視窗";
    FQ_INFO = "|cff00ffffFastQuest Classic: |r|cffffffff";
    -- Strings in Option Frame
    FQ_OPT_OPTIONS_TITLE = "FastQuest Classic 選項";
    FQ_OPT_FRM_NOTIFY_TITLE = "任務通報設定";
    FQ_OPT_AUTONOTIFY_TITLE = "自動通報";
    FQ_OPT_AUTONOTIFY_TIP = "自動將任務相關訊息通報給鄰近地區、隊伍夥伴、團隊隊友、公會成員等。";
    FQ_OPT_DOUBLEWIDTH_TITLE = "雙倍任務視窗寬度";
    FQ_OPT_DOUBLEWIDTH_TIP = "切換以正常方式或是雙倍視窗寬度顯示任務視窗";
    FQ_OPT_NOTIFYCHANNEL_TITLE = "通報頻道設定";
    FQ_OPT_NOTIFYNEARBY_TITLE = "向鄰近地區通報";
    FQ_OPT_NOTIFYNEARBY_TIP = "向鄰近地區通報，在鄰近的人員都會接獲通報";
    FQ_OPT_NOTIFYPARTY_TITLE = "向隊伍夥伴通報";
    FQ_OPT_NOTIFYPARTY_TIP = "在隊伍頻道通報，以使隊伍夥伴獲知自己的任務進度";
    FQ_OPT_NOTIFYRAID_TITLE = "向團隊通報";
    FQ_OPT_NOTIFYRAID_TIP = "在團隊頻道通報，以使所有團隊成員獲知自己的任務進度";
    FQ_OPT_NOTIFYGUILD_TITLE = "向公會通報";
    FQ_OPT_NOTIFYGUILD_TIP = "在公會頻道通報，以使所有公會成員獲知自己的任務進度";
    FQ_OPT_NOTIFYDETAIL_TITLE = "詳盡通報";
    FQ_OPT_NOTIFYDETAIL_TIP = "詳盡的通報任務的完成度";
    FQ_OPT_NOTIFYEXP_TITLE = "通報經驗獲得";
    FQ_OPT_NOTIFYEXP_TIP = "在繳交任務並且獲得經驗值時，通報所獲得的經驗值";
    FQ_OPT_NOTIFYZONE_TITLE = "通報新地區探索";
    FQ_OPT_NOTIFYZONE_TIP = "當發現新地區時通報所發現的地區資訊";
    FQ_OPT_NOTIFYLEVELUP_TITLE = "通報等級升級";
    FQ_OPT_NOTIFYLEVELUP_TIP = "當自己等級升級時，通報此升級訊息";
    FQ_OPT_FRM_QUESTFORMAT_TITLE = "任務顯示格式設定";
    FQ_OPT_QUESTFORMAT_TITLE = "選擇任務顯示格式";
    FQ_OPT_QUESTFORMAT_TIP = "選擇在聊天框中顯示任務名稱的格式";
    FQ_OPT_QUESTLOGOPTIONS_TITLE = "任務視窗選項";
    FQ_OPT_COLOR_TITLE = "啟用顏色";
    FQ_OPT_COLOR_TIP = "在任務追蹤視窗將任務的標題依照任務的難易度以對應的顏色來顯示";
    FQ_OPT_MEMBERINFO_TITLE = "顯示建議人數";
    FQ_OPT_MEMBERINFO_TIP = "在任務視窗標題加註建議的參與人數";
    FQ_OPT_MINIMAP_POSITION_TITLE = "小地圖按鈕位置";
    FQ_OPT_SHOWTYPE_TITLE = "顯示任務類型";
    FQ_OPT_SHOWTYPE_TIP = "在任務追蹤視窗顯示任務的類型";
    FQ_OPT_LOCK_TITLE = "鎖定任務追蹤視窗";
    FQ_OPT_LOCK_TIP = "鎖定任務追蹤視窗的位置";
    FQ_OPT_AUTOADD_TITLE = "自動新增/移除任務";
    FQ_OPT_AUTOADD_TIP = "自動將可追蹤的任務增加至任務追蹤視窗，或當完成時自動移除";
    FQ_OPT_AUTOCOMPLETE_TITLE = "自動繳交任務";
    FQ_OPT_AUTOCOMPLETE_TIP = "當任務完成時，與任務 NPC 對談時自動繳交任務";
    FQ_OPT_FRM_MISC_TITLE = "其他選項";
    FQ_OPT_SHOWMINIMAP_TITLE = "顯示小地圖按鈕";
    FQ_OPT_SHOWMINIMAP_TIP = "切換在小地圖旁顯示按鈕與否";

    FQ_BUTTON_TOOLTIP = "滑鼠左鍵開啟任務視窗.\n滑鼠中鍵開啟 FastQuest Classic 選像視窗.\n滑鼠右鍵並拖曳以移動圖示按鈕位置.";

    -- Information Message
    FQ_INFO_NOTIFYGUILD = "在公會頻道中通知任務進度: ";
    FQ_INFO_NOTIFYRAID = "在團隊頻道中通知任務進度: ";
    FQ_INFO_NOTIFYNEARBY = "對鄰近區域通知任務進度: ";
    FQ_INFO_NOTIFYPARTY = "在隊伍頻道通知任務進度: ";
    FQ_INFO_AUTOADD = "自動新增目前的任務到任務追蹤視窗並移出已完成的任務: ";
    FQ_INFO_AUTOCOMPLETE = "自動完成並提交任務: ";
    FQ_INFO_AUTONOTIFY = "自動通知隊友任務進展情況於隊伍頻道中: ";
    FQ_INFO_CLEAR = "清除所有任務追蹤視窗中的任務";
    FQ_INFO_COLOR = "在任務追蹤視窗依任務難易度以不同的顏色顯示任務標題: ";
    FQ_INFO_DETAIL = "詳細的通知任務進度: ";
    FQ_INFO_DISPLAY_AS = "任務顯示格式: ";
    FQ_INFO_DOUBLEWIDTH = "任務視窗雙倍寬度顯示: ";
    FQ_INFO_FORMAT = "選擇在聊天框中顯示任務名稱的格式";
    FQ_INFO_LOCK = "任務追蹤視窗已|cffff0000鎖定|r|cffffffff";
    FQ_INFO_MEMBERINFO = "顯示任務建議的隊伍人數資訊: ";
    FQ_INFO_NOTIFYDISCOVER = "通報所發現的新地點: ";
    FQ_INFO_NOTIFYEXP = "通報完成任務時所獲得的經驗值: ";
    FQ_INFO_NOTIFYLEVELUP = "通報升級訊息: ";
    FQ_INFO_QUEST_TAG = "在任務追蹤視窗顯示任務的類型: ";
    FQ_INFO_RESET = "重設任務追蹤視窗位置";
    FQ_INFO_SHOWMINIMAP = "顯示小地圖按鈕: ";
    FQ_INFO_UNLOCK = "任務追蹤視窗已|cff00ff00解鎖|r|cffffffff";
    FQ_INFO_USAGE = "指令 /fastquest [command] 或 /fq [command]";
    --
    FQ_MUST_RELOAD = "你必需輸入 /console reloadui 本功能才可作用";
    --
    FQ_USAGE_NOTIFYGUILD = "在公會頻道中通知任務進度";
    FQ_USAGE_NOTIFYRAID = "在團隊頻道中通知任務進度";
    FQ_USAGE_NOTIFYNEARBY = "對鄰近區域通知任務進度";
    FQ_USAGE_NOTIFYPARTY = "在隊伍頻道中通知任務進度";
    FQ_USAGE_AUTOADD = "是否自動追蹤任務";
    FQ_USAGE_AUTOCOMPLETE = "自動完成並提交任務";
    FQ_USAGE_AUTONOTIFY = "通知隊友任務進度於隊伍頻道中";
    FQ_USAGE_CLEAR = "清除所有任務追蹤視窗中的任務";
    FQ_USAGE_COLOR = "設定在任務追蹤視窗中是否依任務難易度以不同的顏色顯示任務標題.";
    FQ_USAGE_DETAIL = "詳細的通知任務進度情況";
    FQ_USAGE_FORMAT = "(按 Ctrl 點選任務) 在聊天框中顯示任務名稱格式共4種每輸入一次切換一種, 如:[10+]任務名稱,[10]任務名稱(精英)";
    FQ_USAGE_LOCK = "鎖定/解鎖任務追蹤視窗位置";
    FQ_USAGE_MEMBERINFO = "設定是否顯示任務建議的隊伍人數資訊";
    --FQ_USAGE_NODRAG =		"是否強制任務追蹤視窗不可被移動, 重新登入或輸入 /console reloadui 才有作用";
    FQ_USAGE_NOTIFYDISCOVER = "切換是否通報所發現的新區域";
    FQ_USAGE_NOTIFYEXP = "切換是否通報從一個完成的任務中所獲得的經驗獎勵";
    FQ_USAGE_NOTIFYLEVELUP = "切換是否通報升級的訊息";
    FQ_USAGE_RESET = "重新設定任務追蹤視窗位置";
    FQ_USAGE_STATUS = "顯示所有 FastQuest Classic 的設定狀態";
    FQ_USAGE_OPTIONS = "開啟選項設定視窗";
    FQ_USAGE_TAG = "在任務追蹤清單顯示任務類型 (菁英, 團隊, PvP 等) ";
    --
    --BINDING_CATEGORY_FASTQUEST_CLASSIC		= "任務增強";
    BINDING_HEADER_FASTQUEST_CLASSIC = "FastQuest Classic";
    BINDING_NAME_FASTQUEST_OPTIONS = "FastQuest Classic 選項設定";
    BINDING_NAME_FQ_TAG = "任務追蹤視窗困難度";
    BINDING_NAME_FQ_FORMAT = "選擇聊天任務名稱格式";
    BINDING_NAME_FQ_AOUTNOTIFY = "自動通知隊友";
    BINDING_NAME_FQ_AOUTCOMPLETE = "自動完成提交任務";
    BINDING_NAME_FQ_AOUTADD = "自動添加任務追蹤視窗";
    BINDING_NAME_FQ_LOCK = "任務追蹤視窗解鎖/鎖定";
    --
    FQ_QUEST_PROGRESS = "任務進度: ";
    --
    FQ_QUEST_ISDONE = "已完成! ";
    FQ_QUEST_COMPLETED = " (任務完成)";
    FQ_DRAG_DISABLED = "FastQuest Classic: 移動任務追蹤視窗現在是關閉的, 輸入 /fq nodrag 來設定. 你必須重新載入 UI 來使這改變生效.";
    --
    FQ_ENABLED = "|cff00ff00啟動|r|cffffffff";
    FQ_DISABLED = "|cffff0000關閉|r|cffffffff";
    FQ_LOCK = "|cffff0000鎖定|r|cffffffff";
    FQ_UNLOCK = "|cff00ff00解除|r|cffffffff";
    --
end
