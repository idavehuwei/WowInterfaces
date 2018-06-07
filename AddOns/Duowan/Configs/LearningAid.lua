------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	LEARNINGAID_TITLE = "法术助手";
	LEARNINGAID_ENABLE = "开启法术助手";
	LEARNINGAID_ENABLE_TIP = "便捷的显示你新学的技能、天赋、专业技能，坐骑以及宠物.";
	LEARNINGAID_LOCKFRAME = "锁定窗口位置";
	LEARNINGAID_RESTORACTION = "复位重置天赋获得的技能";
	LEARNINGAID_RESTORACTION_TIP = "将因天赋重新配置而获得的法术放回原动作条所在位置";
	LEARNINGAID_MISSING_ABILITIES = "查询未放置于动作条的技能";
	LEARNINGAID_MISSING_ABILITIES_TIP = "楼上: 我怎么发现有大脚的LOGO\n楼下: 搂主, 那是百度";
	LEARNINGAID_TRACKING_ABILITIES = "查询追踪技能";
	LEARNINGAID_SHAPESHIFT_FORMS = "查询形态技能";
	LEARNINGAID_MACROS = "查询宏";
	LEARNINGAID_SEARCH = "百度一下";
	LEARNINGAID_OPTION = "打开配置";
elseif (GetLocale() == "zhTW") then
	LEARNINGAID_TITLE = "法術助手";
	LEARNINGAID_ENABLE = "開啟法術助手";
	LEARNINGAID_ENABLE_TIP = "便捷的顯示你新學的技能、天賦、專業技能，坐騎以及寵物.";
	LEARNINGAID_LOCKFRAME = "鎖定窗口位置";
	LEARNINGAID_RESTORACTION = "復位重置天賦獲得的技能";
	LEARNINGAID_RESTORACTION_TIP = "將因天賦重新配置而獲得的法術放回原動作條所在位置";
	LEARNINGAID_MISSING_ABILITIES = "查詢未放置於動作條的技能";
	LEARNINGAID_MISSING_ABILITIES_TIP = "樓上: 我怎麼發現有大腳的LOGO\n樓下: 摟主, 那是百度";
	LEARNINGAID_TRACKING_ABILITIES = "查詢追蹤技能";
	LEARNINGAID_SHAPESHIFT_FORMS = "查詢形態技能";
	LEARNINGAID_MACROS = "查詢宏";
	LEARNINGAID_SEARCH = "百度一下";
	LEARNINGAID_OPTION = "打開配置";	
else
	LEARNINGAID_TITLE = "法术助手";
	LEARNINGAID_ENABLE = "开启法术助手";
	LEARNINGAID_ENABLE_TIP = "便捷的显示你新学的技能、天赋、专业技能，坐骑以及宠物.";
	LEARNINGAID_LOCKFRAME = "锁定窗口位置";
	LEARNINGAID_RESTORACTION = "复位重置天赋获得的技能";
	LEARNINGAID_RESTORACTION_TIP = "将因天赋重新配置而获得的法术放回原动作条所在位置";
	LEARNINGAID_MISSING_ABILITIES = "查询未放置于动作条的技能";
	LEARNINGAID_MISSING_ABILITIES_TIP = "楼上: 我怎么发现有大脚的LOGO\n楼下: 搂主, 那是百度";
	LEARNINGAID_TRACKING_ABILITIES = "查询追踪技能";
	LEARNINGAID_SHAPESHIFT_FORMS = "查询形态技能";
	LEARNINGAID_MACROS = "查询宏";
	LEARNINGAID_SEARCH = "百度一下";
	LEARNINGAID_OPTION = "打开配置";
end

if (dwIsConfigurableAddOn("LearningAid")) then
	dwRegisterMod(
		"LearningAid",
		LEARNINGAID_TITLE,
		"Learning Aid",
		"",
		"Interface\\ICONS\\Spell_FrostResistanceTotem_01",		
		nil
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_ENABLE,
		LEARNINGAID_ENABLE_TIP,
		"LearningAidEnable",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("LearningAid")) then
					dwLoadAddOn("LearningAid");
				end
				
				LearningAid:Toggle(true);
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:Toggle(false);
				end
			end
		end
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_LOCKFRAME,
		nil,
		"LockFrame",
		0,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:Lock();
				end
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:Unlock();
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_RESTORACTION,
		LEARNINGAID_RESTORACTION_TIP,
		"RestorAction",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("restoreActions", true);
				end
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("restoreActions", false);
				end
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_MISSING_ABILITIES,
		LEARNINGAID_MISSING_ABILITIES_TIP,
		"MissingAbilities",
		1,
		function (arg)			
			if (arg == 1) then				
			else
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_TRACKING_ABILITIES,
		nil,
		"RrackingAblities",
		0,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("LearningAid")) then					
					LearningAid:SetConfigVar("tracking", true);
				end
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("tracking", false);
				end
			end
		end,
		2
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_SHAPESHIFT_FORMS,
		nil,
		"ShapshiftForms",
		0,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("shapeshift", true);
				end
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("shapeshift", false);
				end
			end
		end,
		2
	);

	dwRegisterCheckButton(
		"LearningAid",
		LEARNINGAID_MACROS,
		nil,
		"Macros",
		1,
		function (arg)			
			if (arg == 1) then
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("macros", true);
				end
			else
				if (dwIsAddOnLoaded("LearningAid")) then
					LearningAid:SetConfigVar("macros", false);
				end
			end
		end,
		2
	);

	dwRegisterButton(
		"LearningAid",
		LEARNINGAID_SEARCH, 
		function()
			if (dwIsAddOnLoaded("LearningAid")) then
				LearningAid:FindMissingActions();
			end
		end, 
		2
	);

	--[[
	dwRegisterButton(
		"LearningAid",
		LEARNINGAID_OPTION, 
		function()
			if (dwIsAddOnLoaded("LearningAid")) then
				--HideUIPanel(DuowanConfigFrame);
				LearningAid:OpenConfig();
			end
		end, 
		1
	);
	]]
end

