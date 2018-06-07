------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法条";
	DUOWAN_ATTACKTIMER_ENABLE = "开启近战进度条";
	DUOWAN_ATTACKTIMER_MOVE = "解锁进度条";	
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法是否完成";
	CASTDELAYBAR_CAST_TIME = "显示总施法时间";
	CASTDELAYBAR_CAST_TIME_TIP = "以'1.2/2.0'的方式显示施法时间";
elseif (GetLocale() == "zhTW") then
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法條";
	DUOWAN_ATTACKTIMER_ENABLE = "開啟近戰進度條";
	DUOWAN_ATTACKTIMER_MOVE = "解鎖進度條";
	CASTDELAYBAR_ENABLE = "顯示施法延遲條";
	CASTDELAYBAR_ENABLE_TIP = "施法延遲條可以有效的輔助判斷施法是否完成";
	CASTDELAYBAR_CAST_TIME = "顯示總施法時間";
	CASTDELAYBAR_CAST_TIME_TIP = "以'1.2/2.0'的方式顯示施法時間";
else
	DUOWAN_ATTACKTIMER_TITLE = "多玩施法条";
	DUOWAN_ATTACKTIMER_ENABLE = "开启近战进度条";
	DUOWAN_ATTACKTIMER_MOVE = "解锁进度条";
	CASTDELAYBAR_ENABLE = "显示施法延迟条";
	CASTDELAYBAR_ENABLE_TIP = "施法延迟条可以有效的辅助判断施法是否完成";
	CASTDELAYBAR_CAST_TIME = "显示总施法时间";
	CASTDELAYBAR_CAST_TIME_TIP = "以'1.2/2.0'的方式显示施法时间";
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
		DEATHKNIGHT = true,
		PALADIN = true,
		--ROGUE = true,
		WARRIOR  =true,
	};
	local _, EnClass = UnitClass("player");
	if (DefaultClass[EnClass]) then
		default = 1;
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
	dwRegisterCheckButton(
		"AttackTimer",
		CASTDELAYBAR_CAST_TIME,
		CASTDELAYBAR_CAST_TIME_TIP,
		"Order",
		1,
		function (arg)		
			if arg==1 then
				if (IsAddOnLoaded("CastDelayBar")) then
					CastDelayBar:CastingOder_Toggle(true);
				end
			else
				if (IsAddOnLoaded("CastDelayBar")) then	
					CastDelayBar:CastingOder_Toggle(false);
				end
			end
		end,
		1
	);
end

