
if (GetLocale() == "zhCN") then
	MOD_INFOBOX_TITLE = {"信息盒", "xinxihe"};
	INFOBOX_ENABLE_TITLE = "开启信息盒";
	INFOBOX_ENABLE_TOOLTIP = "当开启信息盒功能后，你可以将鼠标移动到屏幕顶端弹出信息盒主菜单，通过该菜单你可以调整你所需要的界面！";
elseif (GetLocale() == "zhTW") then
	MOD_INFOBOX_TITLE = {"信息盒", "xinxihe"};
	INFOBOX_ENABLE_TITLE = "開啓信息盒";
	INFOBOX_TITLE_RESET = "重置位置";
else
	MOD_INFOBOX_TITLE = "InfoBox";
	INFOBOX_ENABLE_TITLE = "Enable InfoBox";
	INFOBOX_TITLE_RESET = "Reset Position";
end

if (IsConfigurableAddOn("InfoBox")) then
	ModManagement_RegisterMod(
		"InfoBox",
		"Interface\\Icons\\INV_Misc_StoneTablet_11",
		MOD_INFOBOX_TITLE,
		"",
		nil
	);

	ModManagement_RegisterCheckBox(
		"InfoBox",
		INFOBOX_ENABLE_TITLE,
		INFOBOX_ENABLE_TOOLTIP,
		"EnableInfoBoxV2",
		0,
		function (__arg)
			if ( __arg == 1 ) then
				if (not BigFoot_IsAddOnLoaded("InfoBox")) then
					BigFoot_LoadAddOn("InfoBox");
				end
				
				if (BigFoot_IsAddOnLoaded("InfoBox")) then
					InfoBox_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("InfoBox")) then
					InfoBox_Toggle(false);
				end
			end
		end
	);
end
