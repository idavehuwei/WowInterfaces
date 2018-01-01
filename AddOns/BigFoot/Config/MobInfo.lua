if (GetLocale() == "zhCN") then
	MOD_MOB_HEALTH_TITLE = {"怪物信息", "guaiwuxinxi"};
	
	MOB_AGGRO_HELP = "开启该功能可以使你能够监视怪物的目标并给予相应的警告。该监视窗口位于目标头像下方，你也可以通过按住Shift键来拖动该监视窗口。";
	MOB_HEALTH_ENABLE_TEXT = "开启怪物生命";
	MOB_HEALTH_SHOW_HEALTH_PPT = "显示怪物生命值";
	MOB_HEALTH_SHOW_MANA_POINT = "显示目标魔法值";
	MOB_HEALTH_SHOW_HEALTH_PERCENT = "显示生命值的百分比";
	MOB_HEALTH_TRANSPARENT_MODE = "半透明显示数值";
	
	MOB_AGGRO_ENABLE_TEXT = "开启怪物目标";
elseif (GetLocale() == "zhTW") then
	MOB_AGGRO_HELP = "開啓該功能可以使你能夠監視怪物的目標並給予相應的警告。該監視窗口位于目標頭像下方，你也可以通過按住Shift鍵來拖動該監視窗口。";
	
	MOD_MOB_HEALTH_TITLE = {"怪物信息", "guaiwuxinxi"};
	MOB_HEALTH_ENABLE_TEXT = "開啟怪物生命";
	MOB_HEALTH_SHOW_HEALTH_PPT = "顯示怪物生命值";
	MOB_HEALTH_SHOW_MANA_POINT = "顯示目標魔法值";
	MOB_HEALTH_SHOW_HEALTH_PERCENT = "顯示生命值的百分比";
	MOB_HEALTH_TRANSPARENT_MODE = "半透明顯示數值";
	
	MOB_AGGRO_ENABLE_TEXT = "開啟怪物目標";
else
	MOB_AGGRO_HELP = "Help you monitor the target of mob and give reposible warning. The monitor window locates below the target window. You can move it by draging with holding shift key.";
	
	MOD_MOB_HEALTH_TITLE = "Mob Health";
	MOB_HEALTH_ENABLE_TEXT = "Enable Mob Health";	
	MOB_HEALTH_SHOW_HEALTH_PPT = "Show mob health";
	MOB_HEALTH_SHOW_MANA_POINT = "Show target mana";
	MOB_HEALTH_SHOW_HEALTH_PERCENT = "Show mob health percentage";
	MOB_HEALTH_TRANSPARENT_MODE = "Transparent mode";
	
	MOB_AGGRO_ENABLE_TEXT = "Enable MobAggro";
end

ModManagement_RegisterMod(
	"MobHealth",
	"Interface\\Icons\\Spell_Shadow_BloodBoil",
	MOD_MOB_HEALTH_TITLE,
	"",
	nil
);

ModManagement_RegisterCheckBox(
	"MobHealth",
	MOB_HEALTH_ENABLE_TEXT,
	nil,
	"MobHealthEnable",
	1,
	function(arg)
		MobHealth_Toggle(arg);
	end
);

ModManagement_RegisterCheckBox(
	"MobHealth",
	MOB_HEALTH_SHOW_HEALTH_PPT,
	nil,
	"ShowHealthPPT",
	1,
	function(arg)
		if (arg == 1) then
			MobHealth_ShowHealthPPT = true;
		else
			MobHealth_ShowHealthPPT = nil;
		end

		MobHealth_Display();
	end,
	1
);	

ModManagement_RegisterCheckBox(
	"MobHealth",
	MOB_HEALTH_SHOW_MANA_POINT,
	nil,
	"ShowManaPoint",
	1,
	function(arg)
		if (arg == 1) then
			MobHealth_ShowManaPoint = true;
		else
			MobHealth_ShowManaPoint = nil;
		end

		MobHealth_Display();
	end,
	1
);

ModManagement_RegisterCheckBox(
	"MobHealth",
	MOB_HEALTH_SHOW_HEALTH_PERCENT,
	nil,
	"ShowHealthPercentv2",
	0,
	function(arg)
		if (arg == 1) then
			MobHealth_ShowHealthPercent = true;
		else
			MobHealth_ShowHealthPercent = nil;
		end

		MobHealth_Display();
	end,
	1
);	

ModManagement_RegisterCheckBox(
	"MobHealth",
	MOB_HEALTH_TRANSPARENT_MODE,
	nil,
	"TransparentMode",
	0,
	function(arg)
		if (arg == 1) then	
			MobHealthFrame:SetAlpha(0.8);
		else
			MobHealthFrame:SetAlpha(1.0);
		end
	end,
	1
);	

if (IsConfigurableAddOn("MobAggro")) then
	ModManagement_RegisterCheckBox(
		"MobHealth",
		MOB_AGGRO_ENABLE_TEXT,
		MOB_AGGRO_HELP,
		"EnableMobAggroV2",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("MobAggro")) then
					BigFoot_LoadAddOn("MobAggro");
				end

				if (BigFoot_IsAddOnLoaded("MobAggro")) then
					MobAggro_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("MobAggro")) then
					MobAggro_Toggle(false);
				end
			end
		end
	);
end