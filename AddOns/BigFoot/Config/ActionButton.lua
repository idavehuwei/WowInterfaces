
if (GetLocale() == "zhCN") then
	BF_ACTION_BUTTON_TITLE = {"动作按钮 Buff助手", "dongzuoanniu"};
	COOLDOWN_HELPER_COOLDOWN_COUNT = "显示详细的冷却时间";
	COOLDOWN_HELPER_COOLDOWN_SHOW_TARGET = "显示小图标的冷却时间";
	COOLDOWN_HELPER_SHINE_TYPE_TITLE = "闪光类型：";
	COOLDOWN_HELPER_SHINE_TYPE = {"标准", "大闪光", "雷达"};
	BF_DISTANCE_ALERT = "超出技能范围时图标为红色";
	COOLDOWN_HELPER_ADJ_BUFF_SIZE = "调整Buff尺寸";

	COOLDOWN_HELPER_MYBUFF_SIZE = "玩家BUFF";
	COOLDOWN_HELPER_OTHERBUFF_SIZE = "其他BUFF";
elseif (GetLocale() == "zhTW") then
	BF_ACTION_BUTTON_TITLE = {"動作按鈕 Buff助手", "dongzuoanniu"};
	COOLDOWN_HELPER_COOLDOWN_COUNT = "顯示詳細的冷卻時間";
	COOLDOWN_HELPER_COOLDOWN_SHOW_TARGET = "顯示小圖示的冷卻時間";
	COOLDOWN_HELPER_SHINE_TYPE_TITLE = "閃光類型：";
	COOLDOWN_HELPER_SHINE_TYPE = {"標準", "大閃光", "雷達"};
	BF_DISTANCE_ALERT = "超出技能範圍時圖標為紅色";
	COOLDOWN_HELPER_ADJ_BUFF_SIZE = "調整Buff尺寸";
	COOLDOWN_HELPER_MYBUFF_SIZE = "玩家BUFF";
	COOLDOWN_HELPER_OTHERBUFF_SIZE = "其他BUFF";

else
	BF_ACTION_BUTTON_TITLE = "Action Button and Buff";
	COOLDOWN_HELPER_COOLDOWN_COUNT = "Show detail of cooldown";
	COOLDOWN_HELPER_COOLDOWN_SHOW_TARGET = "Show small icon cooldown";
	COOLDOWN_HELPER_SHINE_TYPE_TITLE = "Shine type:";
	COOLDOWN_HELPER_SHINE_TYPE = {"Standard", "Big Shine", "Radar"};
	BF_DISTANCE_ALERT = "Show red icon when out of range";
	COOLDOWN_HELPER_ADJ_BUFF_SIZE = "Adjust Buff Size"
	COOLDOWN_HELPER_MYBUFF_SIZE = "My Buff Size";
	COOLDOWN_HELPER_OTHERBUFF_SIZE = "Other Buff Size";

end

ModManagement_RegisterMod(
	"ActionButton",
	"Interface\\Icons\\INV_Jewelry_Necklace_15",
	BF_ACTION_BUTTON_TITLE,
	"",
	nil
);

ModManagement_RegisterCheckBox(
	"ActionButton",
	BF_DISTANCE_ALERT,
	nil,
	"EnableDistanceAlert",
	1,
	function (arg)
		if (arg == 1) then
			DistanceAlert_Toggle(true);
		else
			DistanceAlert_Toggle(nil);
		end
	end
);

if (IsConfigurableAddOn("CooldownHelper")) then
	ModManagement_RegisterCheckBox(
		"ActionButton",
		COOLDOWN_HELPER_COOLDOWN_COUNT,
		nil,
		"EnableCooldownCount",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("CooldownHelper")) then
					CooldownHelper_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoadedFromBigFoot("CooldownHelper")) then
					CooldownHelper_Toggle(false);
				elseif (BigFoot_IsAddOnLoadedFromOther("CooldownHelper")) then
					CooldownHelper_Toggle(true);
				end
			end
		end
	);

	ModManagement_RegisterSpinBox(
		"ActionButton",
		COOLDOWN_HELPER_SHINE_TYPE_TITLE,
		nil,
		"ShineType",
		"雷达",
		COOLDOWN_HELPER_SHINE_TYPE,
		COOLDOWN_HELPER_SHINE_TYPE[1],
		function (arg)
			if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
				CooldownHelper_SetShineTheme(arg);
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"ActionButton",
		COOLDOWN_HELPER_COOLDOWN_SHOW_TARGET,
		nil,
		"ShowTargetCooldown",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
					CooldownHelper_ShowTargetCooldown(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
					CooldownHelper_ShowTargetCooldown(nil);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"ActionButton",
		COOLDOWN_HELPER_ADJ_BUFF_SIZE,
		nil,
		"AdjustBuffSize",
		0,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
					BFCH_ToggleAdjustBuffSize(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
					BFCH_ToggleAdjustBuffSize(nil);
				end
			end
		end,
		0
	);

	ModManagement_RegisterSpinBox(
		"ActionButton",
		COOLDOWN_HELPER_MYBUFF_SIZE,
		nil,
		"BFCH_MYBUFF_SIZE",
		"range",
		{23, 30, 1},
		23,
		function(arg)
			if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
				BFCH_AdjustMyBuffSize(arg)
			end
		end,
		1
	);
	ModManagement_RegisterSpinBox(
		"ActionButton",
		COOLDOWN_HELPER_OTHERBUFF_SIZE,
		nil,
		"BFCH_OTHERBUFF_SIZE",
		"range",
		{12, 20, 1},
		17,
		function(arg)
			if (BigFoot_IsAddOnLoaded("CooldownHelper")) then
				BFCH_AdjustOtherBuffSize(arg)
			end
		end,
		1
	);
end
