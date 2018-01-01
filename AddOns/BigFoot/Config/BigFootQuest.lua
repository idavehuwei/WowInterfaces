local ENABLE_BIGFOOTQUEST_TEXT;
local BIGFOOTQUEST_MOD_TITLE;

if (GetLocale() == "zhCN") then
	ENABLE_BIGFOOTQUEST_TEXT = "启用任务查询";
	BIGFOOTQUEST_MOD_TITLE = {"任务查询", "renwuchaxun"};
	QUEST_INFO_ENABLE = "开启任务查询 QuestInfo";
	QUEST_INFO_AUTOUPDATE = "自动更新 QuestInfo 任务标记";
	QUEST_INFO_MINIMAP_ICONS = "显示小地图 QuestInfo 任务标记";
elseif (GetLocale() == "zhTW") then
	ENABLE_BIGFOOTQUEST_TEXT = "啟用任務查詢";
	BIGFOOTQUEST_MOD_TITLE = {"任務查詢", "renwuchaxun"};
	QUEST_INFO_ENABLE = "开启任务查询 QuestInfo";
	QUEST_INFO_AUTOUPDATE = "自动更新 QuestInfo 任务标记";
	QUEST_INFO_MINIMAP_ICONS = "显示小地图 QuestInfo 任务标记";
else
	ENABLE_BIGFOOTQUEST_TEXT = "Enable iWoWQuery";
	BIGFOOTQUEST_MOD_TITLE = "Quest Query";
	QUEST_INFO_ENABLE = "Enable QuestInfo";
	QUEST_INFO_AUTOUPDATE = "Auto Update QuestInfo";
	QUEST_INFO_MINIMAP_ICONS = "Show QuestInfo MiniMap Icons";
end

if ((GetLocale() == "zhCN" or GetLocale() == "zhTW") and IsConfigurableAddOn("BigFootQuest")) then
	ModManagement_RegisterMod(
		"BigFootQuest",
		"Interface\\Icons\\INV_Misc_Note_02",
		BIGFOOTQUEST_MOD_TITLE,
		"",
		nil
	);
	ModManagement_RegisterCheckBox(
		"BigFootQuest",
		ENABLE_BIGFOOTQUEST_TEXT,
		nil,
		"EnableBigFootQuest",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFoot_LoadAddOn("BigFootQuest");
				end

				if (BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFootQuest_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFootQuest_Toggle(false);
				end
			end
		end
	);
end
