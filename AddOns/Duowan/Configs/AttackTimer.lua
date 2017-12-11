------------------------------------
-- dugu@bigfoot 2009-12-21

if (GetLocale() == "zhCN") then
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法条";
	DUOWAN_ATTACKTIMER_ENABLE = "开启近战进度条";
	DUOWAN_ATTACKTIMER_MOVE = "解锁进度条";
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法是否完成";
elseif (GetLocale() == "zhTW") then
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法條";
	DUOWAN_ATTACKTIMER_ENABLE = "開啟近戰進度條";
	DUOWAN_ATTACKTIMER_MOVE = "解鎖進度條";
	CASTDELAYBAR_ENABLE = "顯示施法延遲條";
	CASTDELAYBAR_ENABLE_TIP = "施法延遲條可以有效的輔助判斷施法是否完成";
else
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法条";
	DUOWAN_ATTACKTIMER_ENABLE = "开启近战进度条";
	DUOWAN_ATTACKTIMER_MOVE = "解锁进度条";
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法是否完成";
end


if (dwIsConfigurableAddOn("AttackTimer") or dwIsConfigurableAddOn("CastDelayBar")) then
	dwRegisterMod(
		"AttackTimer",
		DUOWAN_ATTACKTIMER_TITLE,
		"AttackTimer",
		"",
		"Interface\\Icons\\Spell_Holy_RighteousFury",
		nil
	);
end

if (dwIsConfigurableAddOn("AttackTimer")) then
	local default = 0;
	local DefaultClass = {
		WARRIOR  =true,
		PALADIN = true,
		HUNTER = true,
		ROGUE = true,
		PRIEST = true,
		DEATHKNIGHT = true,
		SHAMAN = true,
		MAGE = true,
		WARLOCK = true,
		MONK = true,
		DRUID = true,
		DEMONHUNTER = true,
	};
	local _, EnClass = UnitClass("player");
	if (DefaultClass[EnClass]) then
		default = 0;
	end
	dwRegisterCheckButton(
		"AttackTimer",
		DUOWAN_ATTACKTIMER_ENABLE,
		"",
		"AttackTimerEnable",
		default,
		function (arg)
			if (arg == 1) then
				dwLoadAddOn("AttackTimer");

				AttackTimer_Toggle(true);
			else
				if (dwIsAddOnLoaded("AttackTimer")) then
					AttackTimer_Toggle(false);
				end
			end
		end
	);

	dwRegisterButton(
		"AttackTimer",
		DUOWAN_ATTACKTIMER_MOVE,
		function()
			if (dwIsAddOnLoaded("AttackTimer")) then
				HideUIPanel(DuowanConfigFrame);
				AttackTimer_AjustPosition();
			end
		end,
		1
	);
end

if (dwIsConfigurableAddOn("CastDelayBar")) then
	dwRegisterCheckButton(
		"AttackTimer",
		CASTDELAYBAR_ENABLE,
		CASTDELAYBAR_ENABLE_TIP,
		"CastDelayBarEnable",
		1,
		function (arg)
			if arg==1 then
				dwLoadAddOn("CastDelayBar");

				CastDelayBar:Toggle(true);
			else
				if (dwIsAddOnLoaded("CastDelayBar")) then
					CastDelayBar:Toggle(false);
				end
			end
		end
	);
end

