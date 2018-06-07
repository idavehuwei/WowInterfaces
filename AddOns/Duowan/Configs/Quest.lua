------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	QUEST_TITLE						= "任务增强";
	QUEST_INFO_ENABLE				= "开启任务查询";
	QUEST_INFO_OPTION					= "打开配置";
	QUEST_INFO_AUTOUPDATE				= "自动更新任务标记";
	QUEST_INFO_MINIMAP_ICONS			= "显示小地图任务标记";
	QUEST_INFO_QUESTHELPER			= "使用大脚任务方式";
	FASTQUEST_TOGGLE_DESC			= "开启多玩任务增强";
	FASTQUEST_AUTONOTIFY_TITLE			= "自动向队友通报任务进展";
	FASTQUEST_NOTIFYDETAIL_TITLE		= "详尽通报任务进度";
	FASTQUEST_DOUBLEWIDTH_TITLE		= "双倍任务窗口宽度";	
	FASTQUEST_QUESTFORMAT_TITLE		= "显示任务等级和类型";
	FASTQUEST_COLOR_TITLE				= "在追踪窗口显示任务颜色";
	FASTQUEST_LOCK_TITLE				= "锁定任务追踪窗口";
	FASTQUEST_AUTOADD_TITLE			= "自动增加追踪任务";
	FASTQUEST_AUTOCOMPLETE_TITLE		= "自动完成任务";
	FASTQUEST_SORT_TYPE_TITLE			= "优先按照距离排序";
	FASTQUEST_AUTOCOLLAPSE_TITLE		= "副本中自动收起任务追踪";
	FASTQUEST_AUTO_CHOICE_TITLE		= "自动选择任务推荐(最贵)物品";
	QUEST_HELPER_ONLY_WATCH			= "只显示追踪的任务";
elseif (GetLocale() == "zhTW") then
	QUEST_TITLE						= "任務增強";
	QUEST_INFO_ENABLE				= "開啟任務查詢";
	QUEST_INFO_OPTION					= "打開配置";
	QUEST_INFO_AUTOUPDATE				= "自動更新任務標記";
	QUEST_INFO_MINIMAP_ICONS			= "顯示小地圖任務標記";
	QUEST_INFO_QUESTHELPER			= "使用大腳任務方式";
	FASTQUEST_TOGGLE_DESC			= "開啟增強任務日誌";	
	FASTQUEST_AUTONOTIFY_TITLE			= "自動向隊友通報任務進展";
	FASTQUEST_NOTIFYDETAIL_TITLE		= "詳盡通報任務進度";
	FASTQUEST_DOUBLEWIDTH_TITLE		= "雙倍任務窗口寬度";	
	FASTQUEST_QUESTFORMAT_TITLE		= "顯示任務等級和類型";
	FASTQUEST_COLOR_TITLE				= "在追蹤視窗顯示任務顏色";
	FASTQUEST_LOCK_TITLE				= "鎖定任務追蹤窗口";
	FASTQUEST_AUTOADD_TITLE			= "自動增加追蹤任務";
	FASTQUEST_AUTOCOMPLETE_TITLE		= "自動完成任務";
	FASTQUEST_SORT_TYPE_TITLE			= "優先按照距離排序";
	FASTQUEST_AUTOCOLLAPSE_TITLE		= "副本中自動收起任務追蹤";
	FASTQUEST_AUTO_CHOICE_TITLE		= "自動選擇任務推薦(最貴)物品";
	QUEST_HELPER_ONLY_WATCH			= "只顯示追蹤的任務";
else
	QUEST_TITLE						= "任务增强";
	QUEST_INFO_ENABLE				= "开启任务查询";
	QUEST_INFO_OPTION					= "打开配置";
	QUEST_INFO_AUTOUPDATE				= "自动更新任务标记";
	QUEST_INFO_MINIMAP_ICONS			= "显示小地图任务标记";
	QUEST_INFO_QUESTHELPER			= "使用大脚任务方式";
	FASTQUEST_TOGGLE_DESC			= "开启增强任务日志";
	FASTQUEST_AUTONOTIFY_TITLE			= "自动向队友通报任务进展";
	FASTQUEST_NOTIFYDETAIL_TITLE		= "详尽通报任务进度";
	FASTQUEST_DOUBLEWIDTH_TITLE		= "双倍任务窗口宽度";	
	FASTQUEST_QUESTFORMAT_TITLE		= "显示任务等级和类型";
	FASTQUEST_COLOR_TITLE				= "在追踪窗口显示任务颜色";
	FASTQUEST_LOCK_TITLE				= "锁定任务追踪窗口";
	FASTQUEST_AUTOADD_TITLE			= "自动新增/移除任务";
	FASTQUEST_AUTOCOMPLETE_TITLE		= "自动完成任务";
	FASTQUEST_SORT_TYPE_TITLE			= "优先按照距离排序";
	FASTQUEST_AUTOCOLLAPSE_TITLE		= "副本中自动收起任务追踪";
	FASTQUEST_AUTO_CHOICE_TITLE		= "自动选择任务推荐(最贵)物品";
	QUEST_HELPER_ONLY_WATCH			= "只显示追踪的任务";
end

if dwIsConfigurableAddOn("QuestInfo")--[[ or dwIsConfigurableAddOn("QuestHelper")]] or dwIsConfigurableAddOn("DuowanQuest") then
	dwRegisterMod(
		"QuestMod",
		QUEST_TITLE,
		"QUEST",
		"",
		"Interface\\ICONS\\INV_Misc_Book_08",
		nil
	);
end

if (dwIsConfigurableAddOn("QuestInfo")--[[ or dwIsConfigurableAddOn("QuestHelper")]]) then
	dwRegisterCheckButton(
		"QuestMod",
		QUEST_INFO_ENABLE,
		nil,
		"QuestInfoEnable",
		0,
		function (arg)	
			--local isBF = dwRawGetCVar("QuestMod", "QuestHelper", 0);
			if(arg==1)then
				--if (isBF == 1) then
				--	if (not dwIsAddOnLoaded("QuestHelper")) then
				--		dwLoadAddOn("QuestHelper");
				--	end
				--else
					if (not dwIsAddOnLoaded("QuestInfo")) then
						dwLoadAddOn("QuestInfo");
					end
				--end						
			else
				if (dwIsAddOnLoaded("QuestInfo")--[[ or dwIsAddOnLoaded("QuestHelper")]]) then
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
		"Minimap",
		0,
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
	dwRegisterCheckButton(
		"QuestMod",
		QUEST_INFO_QUESTHELPER,
		DUOWAN_RELOAD_DESC,
		"QuestHelper",
		0,
		function (arg)			
			if (arg == 1) then		
				if (dwIsAddOnLoaded("QuestInfo")) then
					dwRequestReloadUI(nil);
				end
			else
				if (dwIsAddOnLoaded("QuestHelper")) then
					dwRequestReloadUI(nil);
				end
			end
		end,
		1
	);	
	]]
end

if (dwIsConfigurableAddOn("DuowanQuest")) then
	dwRegisterCheckButton(
		"QuestMod",
		QUEST_INFO_MINIMAP_ICONS,
		nil,
		"QuestPointer",
		1,
		function (arg)			
			if (arg == 1) then		
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:ToggleMinimapPointer(true);
					DuowanQuest:UpdateCheckBox();
				end
			else
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:ToggleMinimapPointer(false);
					DuowanQuest:UpdateCheckBox();
				end
			end
		end
	);
	
	dwRegisterCheckButton(
		"QuestMod",
		QUEST_HELPER_ONLY_WATCH,
		nil,
		"WatchOnly",
		0,
		function (arg)			
			if (arg == 1) then		
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:ToggleWatchOnly(true);	
				end
			else
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:ToggleWatchOnly(false);			
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_TOGGLE_DESC,
		nil,
		"EnableDuowanQuest",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not dwIsAddOnLoaded("DuowanQuest")) then
					dwLoadAddOn("DuowanQuest");					
				end	
				DuowanQuest:Enable();
			else
				DuowanQuest:Disable();
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
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoNotify_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoNotify_Toggle(false);
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
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:Detail_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:Detail_Toggle(false);	
				end
			end
		end,
		2
	);
	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_QUESTFORMAT_TITLE,
		nil,
		"EnableQuestFormat",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:QuestLevel_Toggle(true);
				end
			else
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:QuestLevel_Toggle(false);
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
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoAdd_Toggle(true);
				end
			else	
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoAdd_Toggle(false);
				end
			end
		end,
		1
	);

	
	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_AUTO_CHOICE_TITLE	,
		nil,
		"AutoChoice",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoChoice_Toggle(true);
				end
			else			
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoChoice_Toggle(false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_AUTOCOMPLETE_TITLE	,
		nil,
		"AutoComplete",
		0,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoComplete_Toggle(true);
				end
			else			
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoComplete_Toggle(false);
				end
			end
		end,
		1
	);
	
	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_SORT_TYPE_TITLE	,
		nil,
		"SortType",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:SortDistance_Toggle(true, "QuestMod");
				end
			else			
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:SortDistance_Toggle(false, "QuestMod");
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"QuestMod",
		FASTQUEST_AUTOCOLLAPSE_TITLE	,
		nil,
		"AutoCollapse",
		1,
		function (arg)			
			if (arg == 1) then	
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoCollapse_Toggle(true);
				end
			else			
				if (dwIsAddOnLoaded("DuowanQuest")) then
					DuowanQuest:AutoCollapse_Toggle(false);
				end
			end
		end,
		1
	);
end