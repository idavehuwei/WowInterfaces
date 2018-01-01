
if (GetLocale() == "zhCN" or GetLocale() == "zhTW") then
	if (IsConfigurableAddOn("MerInspect") or IsConfigurableAddOn("BigFootRating")) then
		if (GetLocale() == "zhCN") then
			MOD_INFO_STAT_TITLE = {"装备信息", "zhuangbeixinxi"};

			MOD_INFO_COMPARISON_STAT_COMPARE = "开启装备属性统计";
			MDO_INFO_ENABLE_DURABILITY = "显示装备耐久度";
			MDO_INFO_ENABLE_HIGHLIGHT = "高亮装备栏边框";
			--MOD_INFO_BIGFOOT_RATING = "开启装备属性换算";
			MOD_INFO_RATING_BUSTER = "开启装备属性分析"
			RATING_BUSTER_SETTINGS = "装备属性设置"
		elseif (GetLocale() == "zhTW") then
			MOD_INFO_STAT_TITLE = {"裝備信息", "zhuangbeixinxi"};

			MOD_INFO_COMPARISON_STAT_COMPARE = "啟用裝備屬性統計";
			MDO_INFO_ENABLE_DURABILITY = "顯示裝備耐久度";
			MDO_INFO_ENABLE_HIGHLIGHT = "高亮裝備欄邊框";
			--MOD_INFO_BIGFOOT_RATING = "啟用裝備屬性換算";
			MOD_INFO_RATING_BUSTER = "開啟裝備屬性分析"
			RATING_BUSTER_SETTINGS = "裝備屬性設置"

		else
			MOD_INFO_STAT_TITLE = "Info Stat";

			MOD_INFO_COMPARISON_STAT_COMPARE = "Enable Equitment Stat";
			MDO_INFO_ENABLE_DURABILITY = "Display Durability";
			MDO_INFO_ENABLE_HIGHLIGHT = "High light border";
			--MOD_INFO_BIGFOOT_RATING = "Enable BigFoot Rating";
			MOD_INFO_RATING_BUSTER = "Enable Rating Buster"
			RATING_BUSTER_SETTINGS = "Rating Buster Settings"
		end

		ModManagement_RegisterMod(
			"InfoStat",
			"Interface\\Icons\\INV_Jewelry_Necklace_22",
			MOD_INFO_STAT_TITLE,
			"",
			nil
		);

		if (IsConfigurableAddOn("MerInspect")) then
			ModManagement_RegisterCheckBox(
				"InfoStat",
				MOD_INFO_COMPARISON_STAT_COMPARE,
				nil,
				"EnableMerInspect",
				1,
				function (arg)
					if ( arg == 1 ) then
						if (not BigFoot_IsAddOnLoaded("MerInspect")) then
							BigFoot_LoadAddOn("MerInspect");
						end

						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_Toggle(true);
						end
					else
						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_Toggle(false);
						end
					end
				end
			);
			ModManagement_RegisterCheckBox(
				"InfoStat",
				MDO_INFO_ENABLE_DURABILITY,
				nil,
				"DisplayDurability",
				0,
				function (arg)
					if ( arg == 1 ) then
						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_ToogleD(true);
						end
					else
						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_ToogleD(false);
						end
					end
				end,
				1
			);
			ModManagement_RegisterCheckBox(
				"InfoStat",
				MDO_INFO_ENABLE_HIGHLIGHT,
				nil,
				"DisplayItemQulity",
				0,
				function (arg)
					if ( arg == 1 ) then
						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_ToogleH(true);
						end
					else
						if (BigFoot_IsAddOnLoaded("MerInspect")) then
							MerInspect_ToogleH(false);
						end
					end
				end,
				1
			);
		end

		if (IsConfigurableAddOn("RatingBuster")) then
			ModManagement_RegisterCheckBox(
				"InfoStat",
				MOD_INFO_RATING_BUSTER,
				nil,
				"Rating Buster",
				1,
				function (arg)
					if ( arg == 1 ) then
						if (not BigFoot_IsAddOnLoaded("RatingBuster")) then
							BigFoot_LoadAddOn("RatingBuster");
						end

						if (BigFoot_IsAddOnLoaded("RatingBuster")) then
							RatingBuster:Enable();
						end
					else
						if (BigFoot_IsAddOnLoaded("RatingBuster")) then
							RatingBuster:Disable();
						end
					end
				end
			);
			ModManagement_RegisterButton(
				"InfoStat",
				RATING_BUSTER_SETTINGS,
				function()
					if BigFoot_IsAddOnLoaded("RatingBuster")  then
						RatingBuster:ShowConfig()
						PlaySound("igMainMenuOption");
						HideUIPanel(ModManagementFrame);
					end
				end,
				nil,
				1
			);
		end
	end
end
