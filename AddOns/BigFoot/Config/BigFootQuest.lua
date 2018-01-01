local ENABLE_BIGFOOTQUEST_TEXT;
local BIGFOOTQUEST_MOD_TITLE;

if (GetLocale() == "zhCN") then
	ENABLE_BIGFOOTQUEST_TEXT = "启用任务查询";	
	BIGFOOTQUEST_MOD_TITLE = {"任务查询", "renwuchaxun"};
elseif (GetLocale() == "zhTW") then
	ENABLE_BIGFOOTQUEST_TEXT = "啟用任務查詢";
	BIGFOOTQUEST_MOD_TITLE = {"任務查詢", "renwuchaxun"};
else 
	ENABLE_BIGFOOTQUEST_TEXT = "Enable iWoWQuery";	
	BIGFOOTQUEST_MOD_TITLE = "Quest Query";
end

if ((GetLocale() == "zhCN" or GetLocale() == "zhTW") and IsConfigurableAddOn("BigFootQuest")) then
	ModManagement_RegisterMod(
		"BigFootQuest",
		"Interface\\Icons\\INV_Misc_Note_02",
		BIGFOOTQUEST_MOD_TITLE,
		"",
		nil
	);
	ModManagement_RegisterCheckBox(
		"BigFootQuest",
		ENABLE_BIGFOOTQUEST_TEXT,
		nil,
		"EnableBigFootQuest",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFoot_LoadAddOn("BigFootQuest");					
				end
				
				if (BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFootQuest_Toggle(true);									
				end
			else
				if (BigFoot_IsAddOnLoaded("BigFootQuest")) then
					BigFootQuest_Toggle(false);									
				end
			end
		end
	);
end