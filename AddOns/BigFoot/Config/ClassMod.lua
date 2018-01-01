local BIGFOOT_CLASS_MOD, ENABLE_AIMED_SHOT, ENABLE_ZERO_FEED, AJUST_CAST_POSITION, ENABLE_MISDIRECT;
local ENABLE_HUNTER_ASSIST, ENABLE_ANTI_DAZE, ENABLE_AUTO_TRACKING, ENABLE_ASPECT_BAR, ENABLE_DISTANCE;
local ENABLE_ATTACK_TIMER, Z_HAPPINESS_POINT, Z_HAPPINESS_TOOLTIP, CLASS_MOD_PATH;
local ENABLE_SHAMAN_ASSIST, SHAMAN_ASSIST_TOOLTIP, SHOW_TOTEM_TITLE, ENABLE_TOTOEM_TIMER;
if (GetLocale() == "zhCN") then
	BIGFOOT_CLASS_MOD = {"职业助手", "zhiyezhushou"};
	ENABLE_HUNTER_ASSIST = "启用猎人助手";
	ENABLE_ANTI_DAZE = "自动取消猎豹守护";
	ENABLE_AUTO_TRACKING = "自动切换追踪技能";
	ENABLE_AIMED_SHOT = "启用自动射击计时器";
	ENABLE_ASPECT_BAR = "启用守护动作条";
	ENABLE_MISDIRECT = "误导提示(喊话)";
	ENABLE_DISTANCE = "启用距离提示";
	AJUST_CAST_POSITION = "调整位置";
	ENABLE_ZERO_FEED = "启用一键喂养";
	Z_HAPPINESS_POINT = "报警阀值";
	Z_HAPPINESS_TOOLTIP = "当宠物的快乐度低于该值时报警";
	ENABLE_ATTACK_TIMER = "启用近战攻击计时器";
	ENABLE_SHAMAN_ASSIST = "启用萨满助手";
	SHAMAN_ASSIST_TOOLTIP = "提供一条便捷的图腾技能条";
	SHOW_TOTEM_TITLE = "显示图腾条标题头";
	ENABLE_TOTOEM_TIMER = "开启系统图腾计时器";
elseif (GetLocale() == "zhTW") then
	BIGFOOT_CLASS_MOD = {"職業助手", "zhiyezhushou"};
	ENABLE_HUNTER_ASSIST = "啟用獵人助手";
	ENABLE_ANTI_DAZE = "自動取消獵豹守護";
	ENABLE_AUTO_TRACKING = "自動切換追蹤技能";
	ENABLE_AIMED_SHOT = "啟用自动射擊計時器";
	ENABLE_ASPECT_BAR = "啟用守護動作條";
	ENABLE_MISDIRECT = "誤導提示(喊話)";
	ENABLE_DISTANCE = "啟用距離提示";
	AJUST_CAST_POSITION = "調整位置";
	ENABLE_ZERO_FEED = "啟用一鍵喂養";
	Z_HAPPINESS_POINT = "報警閥值";
	Z_HAPPINESS_TOOLTIP = "當寵物的快樂度低于該值時報警";
	ENABLE_ATTACK_TIMER = "啟用近戰攻擊計時器";
	ENABLE_SHAMAN_ASSIST = "啟用薩滿助手";
	SHAMAN_ASSIST_TOOLTIP = "提供一條便捷的圖騰技能條";
	SHOW_TOTEM_TITLE = "顯示圖騰條標題頭";
	ENABLE_TOTOEM_TIMER = "開啟系統圖騰計時器";
else
	BIGFOOT_CLASS_MOD = "Class Assist";
	ENABLE_HUNTER_ASSIST = "Enable Hunter Assist";
	ENABLE_ANTI_DAZE = "Anti Daze";
	ENABLE_AUTO_TRACKING = "Auto Tracking";
	ENABLE_AIMED_SHOT = "Enable Auto Shot Timer";
	ENABLE_ASPECT_BAR = "Enable Aspect Bar";
	ENABLE_MISDIRECT = "Yell when cast misdirect";
	ENABLE_DISTANCE = "Enable Distance Meter";
	AJUST_CAST_POSITION = "Ajust position";
	ENABLE_ZERO_FEED = "Enable Zero Feed";
	Z_HAPPINESS_POINT = "Warning";
	Z_HAPPINESS_TOOLTIP = "Warning when ur pet's happiness lower than this value";
	ENABLE_ATTACK_TIMER = "Enable Attack Timer";
	ENABLE_SHAMAN_ASSIST = "Enable Shaman Assist";
	SHAMAN_ASSIST_TOOLTIP = "Provides a simple totem action bar";
	SHOW_TOTEM_TITLE = "Show Title button of totem bar";
	ENABLE_TOTOEM_TIMER = "Enable totem timer";
end

local ZERO_FEED_HAPPINESS = { PET_HAPPINESS1, PET_HAPPINESS2 };

local playerclass = select(2, UnitClass("player"));

if (playerclass == "HUNTER") then
	CLASS_MOD_PATH = "Interface\\ICONS\\Ability_Hunter_SniperShot.blp";
elseif (playerclass == "WARRIOR") then
	CLASS_MOD_PATH = "Interface\\Icons\\Ability_Warrior_Charge.blp";
elseif (playerclass == "PALADIN") then
	CLASS_MOD_PATH = "Interface\\Icons\\Spell_Holy_DivineIntervention.blp";
elseif (playerclass == "SHAMAN") then
	CLASS_MOD_PATH = "Interface\\ICONS\\Spell_Nature_StoneSkinTotem.blp";
else
	CLASS_MOD_PATH = "Interface\\ICONS\\Ability_Hunter_SniperShot.blp";
end

if (playerclass == "HUNTER" and IsConfigurableAddOn("HunterAssist")) then
	ModManagement_RegisterMod(
		"BigFootClassMod",
		CLASS_MOD_PATH,
		BIGFOOT_CLASS_MOD,
		"",
		nil
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_AIMED_SHOT,
		nil,
		"EnableAimedShot",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistBar_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistBar_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterButton(
		"BigFootClassMod",
		AJUST_CAST_POSITION,
		function ()
			if (BigFoot_IsAddOnLoaded("HunterAssist")) then
				HunterAssistCasteBar_AjustPosition();
			end
		end,
		nil,
		1
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_ANTI_DAZE,
		nil,
		"EnableAntiDaze",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistDaze_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistDaze_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_AUTO_TRACKING,
		nil,
		"EnableAutoTracking",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistTracking_Toogle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistTracking_Toogle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_ASPECT_BAR,
		nil,
		"EnableAspectBar",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistAspect_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistAspect_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_MISDIRECT,
		nil,
		"EnablemisDirect",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistMisdirect_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistMisdirect_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_DISTANCE,
		nil,
		"EnableDistance",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistDistance_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					HunterAssistDistance_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_ZERO_FEED,
		nil,
		"EnableZeroFeed",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("HunterAssist")) then
					BigFoot_LoadAddOn("HunterAssist");
				end
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					ZFeed_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("HunterAssist")) then
					ZFeed_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterSpinBox(
		"BigFootClassMod",
		Z_HAPPINESS_POINT,
		Z_HAPPINESS_TOOLTIP,
		"HappIness",
		"list",
		ZERO_FEED_HAPPINESS,
		PET_HAPPINESS1,
		function(arg1)
			if (BigFoot_IsAddOnLoaded("HunterAssist")) then
				ZFeed_CHappiness(arg1);
			end
		end,
		1
	);
end

if ((playerclass == "WARRIOR" or playerclass == "PALADIN") and IsConfigurableAddOn("AttackTimer")) then
	ModManagement_RegisterMod(
		"BigFootClassMod",
		CLASS_MOD_PATH,
		BIGFOOT_CLASS_MOD,
		"",
		nil
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_ATTACK_TIMER,
		nil,
		"EnableAttackTimer",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("AttackTimer")) then
					BigFoot_LoadAddOn("AttackTimer");
				end
				if (BigFoot_IsAddOnLoaded("AttackTimer")) then
					AttackTimer_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("AttackTimer")) then
					AttackTimer_Toggle(false);
				end
			end
		end
	);
	ModManagement_RegisterButton(
		"BigFootClassMod",
		AJUST_CAST_POSITION,
		function ()
			if (BigFoot_IsAddOnLoaded("AttackTimer")) then
				AttackTimer_AjustPosition();
			end
		end,
		nil,
		1
	);
end

if (playerclass == "SHAMAN" and IsConfigurableAddOn("ShamanAssist")) then
	ModManagement_RegisterMod(
		"BigFootClassMod",
		CLASS_MOD_PATH,
		BIGFOOT_CLASS_MOD,
		"",
		nil
	);

	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_SHAMAN_ASSIST,
		SHAMAN_ASSIST_TOOLTIP,
		"EnableShamanAssist",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("ShamanAssist")) then
					BigFoot_LoadAddOn("ShamanAssist");
				end
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggle(false);
				end
			end
		end
	);
	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		SHOW_TOTEM_TITLE,
		nil,
		"ShowTitleButton",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggleTitle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggleTitle(false);
				end
			end
		end,
		1
	);

	ModManagement_RegisterCheckBox(
		"BigFootClassMod",
		ENABLE_TOTOEM_TIMER,
		nil,
		"EnableTotemTimer",
		1,
		function (arg)
			if (arg == 1) then
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggleTotemTimer(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ShamanAssist")) then
					ShamanAssistToggleTotemTimer(false);
				end
			end
		end,
		1
	);
end
