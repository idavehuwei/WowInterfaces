------------------------------------
-- dugu 2010-6-1

if (GetLocale() == "zhCN") then
	HEALTH_MOD_TITLE = "简易状态";
	HEALTH_MOD_ENABLE_TEXT = "屏幕中心显示玩家和目标的状态";
	HEALTH_MOD_CASTINGBAR_ENABLE_TEXT = "显示目标施法条";
	HEALTH_MOD_NAME_SHOW_TEXT = "显示目标的名字";
	HEALTH_MOD_RUNEFRAME_SHOW_TEXT = "显示符文条"
	HEALTH_MOD_POSITION_TEXT = "调整位置";
elseif (GetLocale() == "zhTW") then
	HEALTH_MOD_TITLE = "簡易狀態";
	HEALTH_MOD_ENABLE_TEXT = "螢幕中心顯示玩家和目標的狀態";
	HEALTH_MOD_CASTINGBAR_ENABLE_TEXT = "顯示目標施法條";
	HEALTH_MOD_NAME_SHOW_TEXT = "顯示目標施的名字";
	HEALTH_MOD_RUNEFRAME_SHOW_TEXT = "顯示符文條"
	HEALTH_MOD_POSITION_TEXT = "解鎖位置";
else
	HEALTH_MOD_TITLE = "简易状态";
	HEALTH_MOD_ENABLE_TEXT = "屏幕中心显示玩家和目标的状态";
	HEALTH_MOD_CASTINGBAR_ENABLE_TEXT = "显示目标施法条";
	HEALTH_MOD_NAME_SHOW_TEXT = "显示目标的名字";
	HEALTH_MOD_RUNEFRAME_SHOW_TEXT = "显示符文条"
	HEALTH_MOD_POSITION_TEXT = "调整位置";
end

local _, class = UnitClass("player");
local defaultValue = 0;
if (--[[class == "DEATHKNIGHT" or ]]class == "ROGUE") then
	defaultValue = 1;
end
if (dwIsConfigurableAddOn("BlinkHealthText")) then
	dwRegisterMod(
		"HEALTHTEXT",
		HEALTH_MOD_TITLE,
		"BlinkHealthText",
		"",
		"Interface\\ICONS\\Spell_Nature_GiftoftheWild",
		nil
	);
	dwRegisterCheckButton(
		"HEALTHTEXT",
		HEALTH_MOD_ENABLE_TEXT,
		nil,
		"EnableHealthText",
		defaultValue,
		function (arg)	
			if (arg == 1) then
				if (not dwIsAddOnLoaded("BlinkHealthText")) then
					dwLoadAddOn("BlinkHealthText");
				end
				BlinkHealth:Enable();
			else
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:Disable();
				end
			end
		end
	);
	dwRegisterCheckButton(
		"HEALTHTEXT",
		HEALTH_MOD_NAME_SHOW_TEXT,
		nil,
		"ShowName",
		0,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleNameVisible(true);
				end				
			else
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleNameVisible(false);
				end
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"HEALTHTEXT",
		HEALTH_MOD_CASTINGBAR_ENABLE_TEXT,
		nil,
		"CastingBar",
		1,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleCastingBar(true);
				end				
			else
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleCastingBar(false);
				end
			end
		end,
		1
	);
	if (class == "DEATHKNIGHT" ) then
		dwRegisterCheckButton(
		"HEALTHTEXT",
		HEALTH_MOD_RUNEFRAME_SHOW_TEXT,
		nil,
		"runeFrame",
		0,
		function (arg)
			if (arg == 1) then
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleRuneFrameVisible(true);
				end				
			else
				if (dwIsAddOnLoaded("BlinkHealthText")) then
					BlinkHealth:ToggleRuneFrameVisible(false);
				end
			end
		end,
		1
	);
	end
	dwRegisterButton(
		"HEALTHTEXT",
		HEALTH_MOD_POSITION_TEXT, 
		function()			
			if (dwIsAddOnLoaded("BlinkHealthText")) then
				BlinkHealth:ShowAnchor();
			end
		end, 
		1
	);
end