
if (GetLocale() == "zhCN") then
	SPELLTIMER_TITLE = "法术计时";	
	SPELLTIMER_ENABLE_TEXT = "开启法术计时器";
elseif (GetLocale() == "zhTW") then
	SPELLTIMER_TITLE = "法術計時";	
	SPELLTIMER_ENABLE_TEXT = "開啟法術計時器";
else
	SPELLTIMER_TITLE = "Spell Timer";	
	SPELLTIMER_ENABLE_TEXT = "Enable Spell Timer";
end


if (dwIsConfigurableAddOn("SpellTimer")) then
	dwRegisterMod(
		"SpellTimer",
		SPELLTIMER_TITLE,
		"SpellTimer",
		"",
		"Interface\\ICONS\\Ability_Hunter_Readiness",		
		{frame = "SpellTimerOptionFrame", x=60, y = -5}
	);

	dwRegisterCheckButton(
		"SpellTimer",
		SPELLTIMER_ENABLE_TEXT,
		nil,
		"SpellTimerEnable",
		1,
		function (arg)
			if(arg==1)then
				dwLoadAddOn("SpellTimer");

				SpellTimer_Toggle(true);
			else
				if(dwIsAddOnLoaded("SpellTimer"))then
					SpellTimer_Toggle(false);
				end
			end
		end
	);
end
