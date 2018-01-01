
if (GetLocale() == "zhCN") then
	BF_UNITFRAME_TEXT = {"大脚头像", "dajiaotouxiang"};
	ENABLE_BF_UNITFRAME = "开启额外头像";
	FOCUS_UNITFRAME = "焦点头像";
	FOCUS_NORMAL_MODE = "普通模式";
	FOCUS_SIMPLE_MODE = "简单模式";
	FOCUS_CLOSE_MODE = "关闭";
	FOCUS_CLOSE_DEFAULT_UNITFRAME = "关闭标准焦点头像";
	ENABLE_TARGETTARGET_UNITFRAME = "目标的目标头像";
	ENABLE_TARGETTARGETTARGET_UNITFRAME = "目标的目标的目标头像";
	ENABLE_CASTING_SHINING = "施法时头像闪光";
	ENABLE_CASTING_ICON = "施法时头像变为法术图标";
elseif (GetLocale() == "zhTW") then
	BF_UNITFRAME_TEXT = {"大腳頭像", "dajiaotouxiang"};
	ENABLE_BF_UNITFRAME = "開啟額外頭像";
	FOCUS_UNITFRAME = "焦點頭像";
	FOCUS_NORMAL_MODE = "普通模式";
	FOCUS_SIMPLE_MODE = "簡單模式";
	FOCUS_CLOSE_MODE = "關閉";
	FOCUS_CLOSE_DEFAULT_UNITFRAME = "關閉標準焦點頭像";
	ENABLE_TARGETTARGET_UNITFRAME = "目標的目標頭像";
	ENABLE_TARGETTARGETTARGET_UNITFRAME = "目標的目標的目標頭像";
	ENABLE_CASTING_SHINING = "施法時頭像閃光";
	ENABLE_CASTING_ICON = "施法時頭像變為法術圖示";
else
	BF_UNITFRAME_TEXT = "BigFoot UnitFrame";
	ENABLE_BF_UNITFRAME = "Enable Unit Frame";
	FOCUS_UNITFRAME = "Focus";
	FOCUS_NORMAL_MODE = "Normal Mode";
	FOCUS_SIMPLE_MODE = "Simple Mode";
	FOCUS_CLOSE_MODE = "Close";
	FOCUS_CLOSE_DEFAULT_UNITFRAME = "Close default focus frame";
	ENABLE_TARGETTARGET_UNITFRAME = "ToT Frame";
	ENABLE_TARGETTARGETTARGET_UNITFRAME = "ToToT Frame";
	ENABLE_CASTING_SHINING = "Shining when casting";
	ENABLE_CASTING_ICON = "Show spell icon when casting";
end

function ToggleDefaultFocusFrame(switch)
	if (switch) then
		FocusFrame:RegisterEvent("PLAYER_FOCUS_CHANGED");
		FocusFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
	else
		FocusFrame:UnregisterEvent("PLAYER_FOCUS_CHANGED");
		FocusFrame:UnregisterEvent("PLAYER_ENTERING_WORLD");	-- 进出副本也会触发该事件
		FocusFrame:Hide();
	end
end

if (IsConfigurableAddOn("BUnitFrame")) then
	ModManagement_RegisterMod(
		"BUnitFrame",
		"Interface\\Icons\\ABILITY_SEAL",
		BF_UNITFRAME_TEXT,
		"",
		nil,
		nil
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		ENABLE_BF_UNITFRAME,
		nil,
		"EnableBUnitFrame",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("BUnitFrame")) then
					BUnitFrame_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_Toggle(false);
				end
			end
		end
	);

	local modes = {};
	local _, euf = GetAddOnInfo("EN_UnitFrames");
	if (IsConfigurableAddOn("MyFocusFrame") and euf == nil) then
		table.insert(modes, FOCUS_NORMAL_MODE);
	end
	table.insert(modes, FOCUS_SIMPLE_MODE);
	table.insert(modes, FOCUS_CLOSE_MODE);

	ModManagement_RegisterSpinBox(
		"BUnitFrame",
		FOCUS_UNITFRAME,
		nil,
		"FocusMode",
		"list",
		modes,
		FOCUS_NORMAL_MODE,
		function (arg)
			if (arg == FOCUS_NORMAL_MODE) then
				if (IsConfigurableAddOn("MyFocusFrame")) then
					if (BigFoot_LoadAddOn("MyFocusFrame")) then
						MyFocusFrame_Toggle(true);
					end
				end

				if (BigFoot_IsAddOnLoaded("MyFocusFrame")) then
					BUnitFrame_FocusFrame_Toggle(false);
				end
			elseif (arg == FOCUS_SIMPLE_MODE) then
				if (BigFoot_IsAddOnLoadedFromBigFoot("MyFocusFrame")) then
					MyFocusFrame_Toggle(false);
				elseif (BigFoot_IsAddOnLoadedFromOther("MyFocusFrame")) then
					MyFocusFrame_Toggle(true);
				end

				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_FocusFrame_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("MyFocusFrame")) then
					MyFocusFrame_Toggle(false);
				end

				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_FocusFrame_Toggle(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		FOCUS_CLOSE_DEFAULT_UNITFRAME,
		nil,
		"CloseDefaultFocusFrame",
		1,
		function (arg)
			if (arg == 1) then
				ToggleDefaultFocusFrame(false);
			else
				ToggleDefaultFocusFrame(true);
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		ENABLE_TARGETTARGET_UNITFRAME,
		nil,
		"EnableTargetTarget",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("BUnitFrame")) then
					BUnitFrame_TargetTargetFrame_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_TargetTargetFrame_Toggle(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		ENABLE_TARGETTARGETTARGET_UNITFRAME,
		nil,
		"EnableTargetTargetTarget",
		0,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("BUnitFrame")) then
					BUnitFrame_TargetTargetTargetFrame_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_TargetTargetTargetFrame_Toggle(false);
				end
			end
		end,
		2
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		ENABLE_CASTING_SHINING,
		nil,
		"EnableCastingShining",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("BUnitFrame")) then
					BUnitFrame_CastingShining_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_CastingShining_Toggle(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"BUnitFrame",
		ENABLE_CASTING_ICON,
		nil,
		"EnableCastingIcon",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_LoadAddOn("BUnitFrame")) then
					BUnitFrame_CastingIcon_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BUnitFrame")) then
					BUnitFrame_CastingIcon_Toggle(false);
				end
			end
		end,
		1
	);

end
