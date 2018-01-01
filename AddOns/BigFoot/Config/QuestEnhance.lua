
if (GetLocale() == "zhCN") then
	MOD_QUEST_ENHANCEMENT_TITLE = {"任务增强", "renwuzengqiang"};
	BF_ENABLE_BEQL = "开启增强任务日志(bEQL)";
	BF_DISABLE_BEQL_TIP = "|cff00c0c0<任务增强>|r 你已经关闭增强任务日子(bEQL)模块，该设置将在下次插件载入时生效。";
	QUEST_INFO_ENABLE				= "开启任务查询";
	QUEST_INFO_AUTOUPDATE			= "自动更新任务标记";
	QUEST_INFO_MINIMAP_ICONS		= "显示小地图任务标记";
elseif (GetLocale() == "zhTW") then
	MOD_QUEST_ENHANCEMENT_TITLE = {"任務增強", "renwuzengqiang"};
	BF_ENABLE_BEQL = "開啟增強任務日誌(bEQL)";
	BF_DISABLE_BEQL_TIP = "|cff00c0c0<任務增強>|r 你已經關閉增強任務日子(bEQL)模組，該設置將在下次外掛程式載入時生效。";
else
	MOD_QUEST_ENHANCEMENT_TITLE = "Quest Enhancement";
	BF_ENABLE_BEQL = "Enable bEQL";
	BF_DISABLE_BEQL_TIP = "|cff00c0c0<Quest Enhancement>|r bEQL has been disabled. This setting will be available next time.";
end

if (IsConfigurableAddOn("beql")) then
	ModManagement_RegisterMod(
		"QuestEnhancement",
		"Interface\\Icons\\INV_Misc_Note_02",
		MOD_QUEST_ENHANCEMENT_TITLE,
		"",
		nil
	);
end

if (IsConfigurableAddOn("beql")) then
	ModManagement_RegisterCheckBox(
		"QuestEnhancement",
		BF_ENABLE_BEQL,
		nil,
		function()
			if (beql and beql:IsActive()) then
				return 1;
			else
				return 0;
			end
		end,
		1,
		function (__arg)
			if (__arg == 1) then
				if (beql and not beql:IsActive()) then
					beql:ToggleActive();
				end
			else
				if (beql and beql:IsActive()) then
					beql:ToggleActive();
				end
			end
		end
	);
end