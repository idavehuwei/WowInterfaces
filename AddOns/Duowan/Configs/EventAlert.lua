------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	EVENTALERT_TITLE = "技能触发";
	EVENTALERT_ENABLED = "开启技能触发指示器" .. DUOWAN_COLOR["STEELBLUE"] .. " (EventAlert)" .. DUOWAN_COLOR["END"];
	EVENTALERT_OPTION_DESC = "更多设置";

elseif (GetLocale() == "zhTW") then
	EVENTALERT_TITLE = "技能觸發";
	EVENTALERT_ENABLED = "開啟技能觸發指示器" .. DUOWAN_COLOR["STEELBLUE"] .. " (EventAlert)" .. DUOWAN_COLOR["END"];
	EVENTALERT_OPTION_DESC = "更多設置";
else
	EVENTALERT_TITLE = "技能触发";
	EVENTALERT_ENABLED = "开启技能触发指示器" .. DUOWAN_COLOR["STEELBLUE"] .. " (EventAlert)" .. DUOWAN_COLOR["END"];
	EVENTALERT_OPTION_DESC = "更多设置";
end

if (dwIsConfigurableAddOn("EventAlert")) then
	dwRegisterMod(
		"EventAlertHistry",
		EVENTALERT_TITLE,
		"EventAlert",
		"",
		"Interface\\ICONS\\Spell_Holy_SummonLightwell",
		nil
	);

	dwRegisterCheckButton(
		"EventAlertHistry",
		EVENTALERT_ENABLED,
		nil,
		"EVENTALERT_ENABLED",
		1,
		function (arg)
			if(arg==1)then				
				if (not dwIsAddOnLoaded("EventAlert")) then
					dwLoadAddOn("EventAlert");
				end
				EventAlert_Toggle(true)	;
			else
				if (dwIsAddOnLoaded("EventAlert")) then
					EventAlert_Toggle(false)	;
				end				
			end
		end
	);

	dwRegisterButton(
		"EventAlertHistry",
		EVENTALERT_OPTION_DESC, 
		function()
			if (dwIsAddOnLoaded("EventAlert")) then
				ShowUIPanel(EA_Options_Frame);
			end
		end, 
		1
	);
end