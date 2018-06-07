-----------------------------
-- added by dugu@bigfoot
-- 为多玩插件提供必要的接口
-- 2010-3-23
-----------------------------

function TT_EnhanceCD_Toggle(switch)
	if (switch) then		
		TotemTimers.ActiveSpecSettings["EnhanceCDs"] = true;
	else
		TotemTimers.ActiveSpecSettings["EnhanceCDs"] = false;
	end
	TotemTimers.ProcessSpecSetting("EnhanceCDs");
end

function TT_Tracker_Toggle(switch)
	if (switch) then
		TotemTimers_Settings["AnkhTracker"] = true;
		TotemTimers.ActiveSpecSettings["ShieldTracker"] = true;
		TotemTimers_Settings["EarthShieldTracker"] = true;
		TotemTimers_Settings["WeaponTracker"] = true;
	else
		TotemTimers_Settings["AnkhTracker"] = false;
		TotemTimers.ActiveSpecSettings["ShieldTracker"] = false;
		TotemTimers_Settings["EarthShieldTracker"] = false;
		TotemTimers_Settings["WeaponTracker"] = false;
	end
	TotemTimers.ProcessSetting("AnkhTracker");
	TotemTimers.ProcessSpecSetting("ShieldTracker")
	TotemTimers.ProcessSetting("EarthShieldTracker");
	TotemTimers.ProcessSetting("WeaponTracker");
end

function TT_Timer_Toggle(switch)
	if (switch) then
		TotemTimers_Settings["Show"] = true;
		TotemTimers_Settings["EnableMultiSpellButton"] = true;		
	else
		TotemTimers_Settings["Show"] = false;
		TotemTimers_Settings["EnableMultiSpellButton"] = false;
	end
	TotemTimers.ProcessSetting("Show");
	TotemTimers.ProcessSetting("EnableMultiSpellButton");
end