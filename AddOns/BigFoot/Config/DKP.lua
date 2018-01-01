
if (GetLocale() == "zhCN") then
	BF_DKP_TITLE = {"DKP工具", "dkp"};
	BF_RECORD_TEXT = "开启DKP记录(|cff808080CT_RaidTracker|r)";
	BF_QUERY_TEXT = "开启DKP查询(|cff808080MerDKP|r)";
	BF_RECORD_DISABLE_DELAY_TEXT = "|cff00c0c0<CT_RaidTracker>|r 你已经关闭DKP记录(CT_RaidTracker)模块，该设置将在下次插件载入时生效。";
	BF_QUERY_DISABLE_DELAY_TEXT = "|cff00c0c0<MerDKP>|r 你已经关闭查询记录(MerDKP)模块，该设置将在下次插件载入时生效。";

	if (IsConfigurableAddOn("CT_RaidTracker") or IsConfigurableAddOn("MerDKP")) then
		ModManagement_RegisterMod(
			"DKP",
			"Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation",
			BF_DKP_TITLE
		);
	end

	if (IsConfigurableAddOn("CT_RaidTracker")) then
		ModManagement_RegisterCheckBox(
			"DKP",
			BF_RECORD_TEXT,
			nil,
			"EnableRecord",
			0,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("CT_RaidTracker")) then
						BigFoot_LoadAddOn("CT_RaidTracker");
					end
				else
					if (BigFoot_IsAddOnLoadedFromBigFoot("CT_RaidTracker")) then
						BigFoot_RequestReloadUI(function() BigFoot_Print(BF_RECORD_DISABLE_DELAY_TEXT); end);
					end
				end
			end
		);
	end

	if (IsConfigurableAddOn("MerDKP")) then
		ModManagement_RegisterCheckBox(
			"DKP",
			BF_QUERY_TEXT,
			nil,
			"EnableQuery",
			0,
			function (arg)
				if (arg == 1) then
					if (not BigFoot_IsAddOnLoaded("MerDKP")) then
						BigFoot_LoadAddOn("MerDKP");
					end
				else
					if (BigFoot_IsAddOnLoadedFromBigFoot("MerDKP")) then
						BigFoot_RequestReloadUI(function() BigFoot_Print(BF_QUERY_DISABLE_DELAY_TEXT); end);
					end
				end
			end
		);
	end
end
