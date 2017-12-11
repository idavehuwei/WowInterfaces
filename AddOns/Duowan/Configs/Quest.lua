------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
    QUEST_TITLE                     = "任务增强";
    QUEST_INFO_ENABLE               = "开启任务查询";
    QUEST_INFO_OPTION               = "打开配置";
    QUEST_INFO_AUTOUPDATE           = "自动更新任务标记";
    QUEST_INFO_MINIMAP_ICONS        = "显示小地图任务标记";
    FASTQUEST_TOGGLE_DESC           = "开启增强任务日志";
    FASTQUEST_AUTONOTIFY_TITLE      = "自动向队友通报任务进展";
    FASTQUEST_NOTIFYDETAIL_TITLE    = "详尽通报任务进度";
    FASTQUEST_DOUBLEWIDTH_TITLE     = "双倍任务窗口宽度";
    FASTQUEST_QUESTFORMAT_TITLE     = "显示任务等级和类型";
    FASTQUEST_COLOR_TITLE           = "在追踪窗口显示任务颜色";
    FASTQUEST_LOCK_TITLE            = "锁定任务追踪窗口";
    FASTQUEST_AUTOADD_TITLE         = "自动增加追踪任务";
    FASTQUEST_AUTOCOMPLETE_TITLE    = "自动完成任务";
    FASTQUEST_SORT_TYPE_TITLE       = "优先按照距离排序";
    FASTQUEST_AUTOCOLLAPSE_TITLE    = "副本中自动收起任务追踪";
elseif (GetLocale() == "zhTW") then
    QUEST_TITLE                     = "任務增強";
    QUEST_INFO_ENABLE               = "開啟任務查詢";
    QUEST_INFO_OPTION               = "打開配置";
    QUEST_INFO_AUTOUPDATE           = "自動更新任務標記";
    QUEST_INFO_MINIMAP_ICONS        = "顯示小地圖任務標記";
    FASTQUEST_TOGGLE_DESC           = "開啟增強任務日誌";
    FASTQUEST_AUTONOTIFY_TITLE      = "自動向隊友通報任務進展";
    FASTQUEST_NOTIFYDETAIL_TITLE    = "詳盡通報任務進度";
    FASTQUEST_DOUBLEWIDTH_TITLE     = "雙倍任務窗口寬度";
    FASTQUEST_QUESTFORMAT_TITLE     = "顯示任務等級和類型";
    FASTQUEST_COLOR_TITLE           = "在追蹤視窗顯示任務顏色";
    FASTQUEST_LOCK_TITLE            = "鎖定任務追蹤窗口";
    FASTQUEST_AUTOADD_TITLE         = "自動增加追蹤任務";
    FASTQUEST_AUTOCOMPLETE_TITLE    = "自動完成任務";
    FASTQUEST_SORT_TYPE_TITLE       = "優先按照距離排序";
    FASTQUEST_AUTOCOLLAPSE_TITLE    = "副本中自動收起任務追蹤";
else
    QUEST_TITLE                     = "任务增强";
    QUEST_INFO_ENABLE               = "开启任务查询";
    QUEST_INFO_OPTION               = "打开配置";
    QUEST_INFO_AUTOUPDATE           = "自动更新任务标记";
    QUEST_INFO_MINIMAP_ICONS        = "显示小地图任务标记";
    FASTQUEST_TOGGLE_DESC           = "开启增强任务日志";
    FASTQUEST_AUTONOTIFY_TITLE      = "自动向队友通报任务进展";
    FASTQUEST_NOTIFYDETAIL_TITLE    = "详尽通报任务进度";
    FASTQUEST_DOUBLEWIDTH_TITLE     = "双倍任务窗口宽度";
    FASTQUEST_QUESTFORMAT_TITLE     = "显示任务等级和类型";
    FASTQUEST_COLOR_TITLE           = "在追踪窗口显示任务颜色";
    FASTQUEST_LOCK_TITLE            = "锁定任务追踪窗口";
    FASTQUEST_AUTOADD_TITLE         = "自动新增/移除任务";
    FASTQUEST_AUTOCOMPLETE_TITLE    = "自动完成任务";
    FASTQUEST_SORT_TYPE_TITLE       = "优先按照距离排序";
    FASTQUEST_AUTOCOLLAPSE_TITLE    = "副本中自动收起任务追踪";
end

if dwIsConfigurableAddOn("QuestInfo") or dwIsConfigurableAddOn("FastQuest_Classic") then
    dwRegisterMod(
        "QuestMod",
        QUEST_TITLE,
        "QUEST",
        "",
        "Interface\\ICONS\\INV_Misc_Book_08",
        nil
    );
end

if dwIsConfigurableAddOn("QuestInfo") then
    dwRegisterCheckButton(
        "QuestMod",
        QUEST_INFO_ENABLE,
        DUOWAN_RELOAD_DESC,
        "QUEST_INFO_ENABLE",
        1,
        function (arg)
            if(arg==1)then
                if (not dwIsAddOnLoaded("QuestInfo")) then
                    dwLoadAddOn("QuestInfo");
                end

            else
                if (dwIsAddOnLoaded("QuestInfo")) then
                    dwRequestReloadUI(nil);
                end
            end
        end
    );
    dwRegisterCheckButton(
        "QuestMod",
        QUEST_INFO_AUTOUPDATE,
        nil,
        "EnableAutoUpdate",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("QuestInfo")) then
                    CQI_ToggleAutoUpdate(true);
                end
            else
                if (dwIsAddOnLoaded("QuestInfo")) then
                    CQI_ToggleAutoUpdate(false);
                end
            end
        end,
        1
    );
    --[[
    dwRegisterCheckButton(
        "QuestMod",
        QUEST_INFO_MINIMAP_ICONS,
        nil,
        "EnableMinimap",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("QuestInfo")) then
                    CQI_ToggleMinimapIcons(true);
                end
            else
                if (dwIsAddOnLoaded("QuestInfo")) then
                    CQI_ToggleMinimapIcons(false);
                end
            end
        end,
        1
    );
    ]]
end

if (dwIsConfigurableAddOn("FastQuest_Classic")) then
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_TOGGLE_DESC,
        nil,
        "EnableFastQuest",
        1,
        function (arg)
            if (arg == 1) then
                if (not dwIsAddOnLoaded("FastQuest_Classic")) then
                    dwLoadAddOn("FastQuest_Classic");
                end
                FastQuest_Toggle(true);
                FastQuest_Toggle_Color(true);
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle(false);
                    FastQuest_Toggle_Color(false);
                end
            end
        end
    );
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_AUTONOTIFY_TITLE,
        nil,
        "EnableAutoNotify",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoNotify(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoNotify(false);
                end
            end
        end,
        1
    );

    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_NOTIFYDETAIL_TITLE,
        nil,
        "EnableNotifyDetail",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_NotifyDetails(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_NotifyDetails(false);
                end
            end
        end,
        2
    );
    --[[
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_DOUBLEWIDTH_TITLE,
        nil,
        "EnableDoubleWidth",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_DoubleWidth(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_DoubleWidth(false);
                end
            end
        end,
        1
    );
    ]]
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_QUESTFORMAT_TITLE,
        nil,
        "EnableQuestFormat",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_Format(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_Format(false);
                end
            end
        end,
        1
    );
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_AUTOADD_TITLE,
        nil,
        "AutoAdd",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoAdd(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoAdd(false);
                end
            end
        end,
        1
    );
    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_AUTOCOMPLETE_TITLE    ,
        nil,
        "AutoComplete",
        0,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoComplete(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    FastQuest_Toggle_AutoComplete(false);
                end
            end
        end,
        1
    );

    dwRegisterCheckButton(
        "QuestMod",
        FASTQUEST_AUTOCOLLAPSE_TITLE    ,
        nil,
        "AutoCollapse",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    dQuestAutoCollapse_Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("FastQuest_Classic")) then
                    dQuestAutoCollapse_Toggle(false);
                end
            end
        end,
        1
    );
end
