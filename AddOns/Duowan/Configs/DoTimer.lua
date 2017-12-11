
if (GetLocale() == "zhCN") then
	DOTIMER_TITLE = "法术计时";
	DOTIMER_DESC = "开启法术计时器" .. DUOWAN_COLOR["STEELBLUE"] .. " (DoTimer)" .. DUOWAN_COLOR["END"];
	DOTIMER_IGNOR_BUFF = "禁用时间过长的Buff计时";
	DOTIMER_IGNOR_BUFF_TIME = "设置时间(分):";
	DOTIMER_OPTION_DESC = "开启配置";	
elseif (GetLocale() == "zhTW") then
	DOTIMER_TITLE = "法術計時";
	DOTIMER_DESC = "開啟法術計時器" .. DUOWAN_COLOR["STEELBLUE"] .. " (DoTimer)" .. DUOWAN_COLOR["END"];
	DOTIMER_IGNOR_BUFF = "禁用時間過長的Buff計時";
	DOTIMER_IGNOR_BUFF_TIME = "設置時間(分):";
	DOTIMER_OPTION_DESC = "開啟配置";
else
	DOTIMER_TITLE = "DoTimer";
	DOTIMER_DESC ="enable dotimer";
	DOTIMER_IGNOR_BUFF = "禁用时间过长的Buff计时";
	DOTIMER_IGNOR_BUFF_TIME = "设置时间(分):";
	DOTIMER_OPTION_DESC = "option...";
end


if (dwIsConfigurableAddOn("DoTimer")) then
	dwRegisterMod(
		"DoTimer",
		DOTIMER_TITLE,
		"DoTimer",
		"",
		"Interface\\ICONS\\Ability_Hunter_Readiness",		
		nil
	);

	dwRegisterCheckButton(
		"DoTimer",
		DOTIMER_DESC,
		nil,
		"EnableDoTimer",
		1,
		function (arg)			
			if (arg == 1) then				
				if (not IsAddOnLoaded("DoTimer")) then
					LoadAddOn("DoTimer");					
				end	
				DoTimer:Set("enabled", true) ;
				DoTimer:PLAYER_ENTERING_WORLD();
			else
				if (IsAddOnLoaded("DoTimer")) then
					DoTimer:Set("enabled", false) ;
					DoTimer:PLAYER_ENTERING_WORLD();
				end
			end
		end
	);

	dwRegisterCheckButton(
		"DoTimer",
		DOTIMER_IGNOR_BUFF,
		nil,
		"IgnorBuffTimer",
		1,
		function (arg)			
			if (arg == 1) then				
				if (IsAddOnLoaded("DoTimer")) then
				end					
				--DoTimer:PLAYER_ENTERING_WORLD();
			else
				if (IsAddOnLoaded("DoTimer")) then
					DoTimer:DisableBuffIgnor();
					DoTimer:PLAYER_ENTERING_WORLD();
				end
			end
		end,
		1
	);

	dwRegisterSpinBox(
		"DoTimer",
		DOTIMER_IGNOR_BUFF_TIME,
		DUOWAN_SPINBOX_RANGE, 
		"IgnorTime", 
		{1, 30, 1}, 
		2, 
		function(arg)
			DoTimer:SetBuffIgnorTime(arg);
		end,
		2
	);

	dwRegisterButton (
		"DoTimer",
		DOTIMER_OPTION_DESC,
		function ()
			if (IsAddOnLoaded("DoTimer")) then
				--HideUIPanel(DuowanConfigFrame);
				DoTimer:Commands();
			end
		end,
		1
	);	
end
