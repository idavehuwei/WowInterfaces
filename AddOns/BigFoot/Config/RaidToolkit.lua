
if (GetLocale() == "zhCN") then
	RAID_TOOLKIT_TITLE = {"团队工具", "tuanduigongju"};

	RECOUNT_ENABLE_TEXT = "开启伤害统计 (|cff808080Recount|r)";
	RECOUNT_SHOW_TEXT = "显示统计窗口(|cff808080Recount|r)"
	DBM_ENABLE_TEXT = "开启首领报警模块 (|cff808080DBM|r)";
	GRID_ENABLE_TEXT = "开启团队框架 (|cff808080Grid|r)";
	ORA2_ENABLE_TEXT = "开启团队助手 (|cff808080oRA2|r)";
	DECURSIVE_ENABLE_TEXT = "开启一键驱散 (|cff808080Decursive|r)";
	THREAT_ENABLE_TEXT = "开启仇恨统计 (|cff808080Omen3|r)";
	RAIDALERT_ENABLE_TEXT = "开启团队报警 (|cff808080RaidAlerter|r)";

	DBM_DISABLE_DELAY_TEXT = "|cff00c0c0<首领报警>|r 你已经关闭首领报警(DBM)模块，该设置将在下次插件载入时生效。";
	GRID_DISABLE_DELAY_TEXT = "|cff00c0c0<团队框架>|r 你已经关闭团队框架(Grid)模块，该设置将在下次插件载入时生效。";
	ORA2_DISABLE_DELAY_TEXT = "|cff00c0c0<团队助手>|r 你已经关闭团队助手(oRA2)模块，该设置将在下次插件载入时生效。";
	DECURSIVE_DISABLE_DELAY_TEXT = "|cff00c0c0<一键驱散>|r 你已经关闭一键驱散(Decursive)模块，该设置将在下次插件载入时生效。";
	RECOUNT_DISABLE_DELAY_TEXT = "|cff00c0c0<伤害统计>|r 你已经关闭伤害统计(Recount)模块，该设置将在下次插件载入时生效。";
	THREAT_DISABLE_DELAY_TEXT = "|cff00c0c0<仇恨统计>|r 你已经关闭仇恨统计(Omen3)模块，该设置将在下次插件载入时生效。";
	RAIDALERT_DISABLE_DELAY_TEXT = "|cff00c0c0<团队报警>|r 你已经关闭团队报警(RaidAlerter)模块，该设置将在下次插件载入时生效。";
elseif (GetLocale() == "zhTW") then
	RAID_TOOLKIT_TITLE = {"團隊工具", "tuanduigongju"};

	RECOUNT_ENABLE_TEXT = "開啟傷害統計 (|cff808080Recount|r)";
	RECOUNT_SHOW_TEXT = "顯示统计窗口(|cff808080Recount|r)"
	DBM_ENABLE_TEXT = "開啟首領報警模組 (|cff808080DBM|r)";
	GRID_ENABLE_TEXT = "開啟團隊框架 (|cff808080Grid|r)";
	ORA2_ENABLE_TEXT = "開啟團隊助手 (|cff808080oRA2|r)";
	DECURSIVE_ENABLE_TEXT = "開啟一鍵驅散 (|cff808080Decursive|r)";
	THREAT_ENABLE_TEXT = "開啟仇恨統計 (|cff808080Omen2|r)";
	RAIDALERT_ENABLE_TEXT = "開啟團隊報警 (|cff808080RaidAlerter|r)";
	DBM_DISABLE_DELAY_TEXT = "|cff00c0c0<首領報警>|r 你已經關閉首領報警(DBM)模組，該設置將在下次外掛程式載入時生效。";
	GRID_DISABLE_DELAY_TEXT = "|cff00c0c0<團隊框架>|r 你已經關閉團隊框架(Grid)模組，該設置將在下次外掛程式載入時生效。";
	ORA2_DISABLE_DELAY_TEXT = "|cff00c0c0<團隊助手>|r 你已經關閉團隊助手(oRA2)模組，該設置將在下次外掛程式載入時生效。";
	DECURSIVE_DISABLE_DELAY_TEXT = "|cff00c0c0<一鍵驅散>|r 你已經關閉一鍵驅散(Decursive)模組，該設置將在下次外掛程式載入時生效。";
	RECOUNT_DISABLE_DELAY_TEXT = "|cff00c0c0<傷害統計>|r 你已經關閉傷害統計(Recount)模組，該設置將在下次外掛程式載入時生效。";
	THREAT_DISABLE_DELAY_TEXT = "|cff00c0c0<仇恨統計>|r 你已經關閉仇恨統計(Omen3)模組，該設置將在下次外掛程式載入時生效。";
	RAIDALERT_DISABLE_DELAY_TEXT = "|cff00c0c0<團隊報警>|r 你已經關閉團隊報警(RaidAlerter)模組，該設置將在下次外掛程式載入時生效。";
else
	RAID_TOOLKIT_TITLE = "Raid Toolkit";

	RECOUNT_ENABLE_TEXT = "Enable Recount";
	RECOUNT_SHOW_TEXT = "Show Recount Window"
	DBM_ENABLE_TEXT = "Enable Boss Mod (DBM)";
	GRID_ENABLE_TEXT = "Enable Grid";
	ORA2_ENABLE_TEXT = "Enable oRA2";
	DECURSIVE_ENABLE_TEXT = "Enable Decursive";
	THREAT_ENABLE_TEXT = "Enable Omen2";
	RAIDALERT_ENABLE_TEXT = "Enable RaidAlerter";
	DBM_DISABLE_DELAY_TEXT = "|cff00c0c0<DBM>|r DBM has been disabled. This setting will be available next time.";
	GRID_DISABLE_DELAY_TEXT = "|cff00c0c0<Grid>|r Grid has been disabled. This setting will be available next time.";
	ORA2_DISABLE_DELAY_TEXT = "|cff00c0c0<oRA2>|r oRA2 has been disabled. This setting will be available next time.";
	DECURSIVE_DISABLE_DELAY_TEXT = "|cff00c0c0<Descursive>|r Descursive has been disabled. This setting will be available next time.";
	RECOUNT_DISABLE_DELAY_TEXT = "|cff00c0c0<Recount>|r Recount has been disabled. This setting will be available next time.";
	THREAT_DISABLE_DELAY_TEXT = "|cff00c0c0<Omen3>|r Omen3 has been disabled. This setting will be available next time.";
	RAIDALERT_DISABLE_DELAY_TEXT = "|cff00c0c0<RaidAlerter>|r RaidAlerter has been disabled. This setting will be available next time.";

	end

if ( IsConfigurableAddOn("Recount") or IsConfigurableAddOn("DBM_API") or IsConfigurableAddOn("Omen") or IsConfigurableAddOn("Grid") or IsConfigurableAddOn("oRA2") or IsConfigurableAddOn("RaidAlerter")) then
	ModManagement_RegisterMod(
		"RaidToolkit",
		"Interface\\Icons\\INV_Bijou_Orange",
		RAID_TOOLKIT_TITLE
	);
end


if (IsConfigurableAddOn("Recount")) then

	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		RECOUNT_ENABLE_TEXT,
		nil,
		"EnableRecount",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("Recount")) then
					BigFoot_LoadAddOn("Recount");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Recount")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(RECOUNT_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("DBM-Core")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		DBM_ENABLE_TEXT,
		nil,
		"EnableDBM",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("DBM-Core")) then
					BigFoot_LoadAddOn("DBM-Core");
				end

				if (not BigFoot_IsAddOnLoaded("DBM-BurningCrusade")) then
					BigFoot_LoadAddOn("DBM-BurningCrusade");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("DBM-Core")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(DBM_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("Grid")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		GRID_ENABLE_TEXT,
		nil,
		"EnableGrid",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("Grid")) then
					BigFoot_LoadAddOn("Grid");
				end

				if (BigFoot_IsAddOnLoaded("Grid")) then
					Grid:Enable();
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Grid")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(GRID_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("oRA2")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		ORA2_ENABLE_TEXT,
		nil,
		"EnableoRA2",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("oRA2")) then
					BigFoot_LoadAddOn("oRA2");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("oRA2")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(ORA2_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("Decursive")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		DECURSIVE_ENABLE_TEXT,
		nil,
		"EnableDecursive",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("Decursive")) then
					BigFoot_LoadAddOn("Decursive");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Decursive")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(DECURSIVE_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("Omen")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		THREAT_ENABLE_TEXT,
		nil,
		"EnableThreat",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("Omen")) then
					BigFoot_LoadAddOn("Omen");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("Omen")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(THREAT_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("RaidAlerter")) then
	ModManagement_RegisterCheckBox(
		"RaidToolkit",
		RAIDALERT_ENABLE_TEXT,
		nil,
		"EnableRaidAlerter",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("RaidAlerter")) then
					BigFoot_LoadAddOn("RaidAlerter");
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("RaidAlerter")) then
					BigFoot_RequestReloadUI(function() BigFoot_Print(RAIDALERT_DISABLE_DELAY_TEXT); end);
				end
			end
		end
	);
end
