------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	CHANNELCLEAN_TITLE = "聊天过滤";
	CHANNELCLEAN_ENABLE = "开启聊天过滤";	
	CHANNELCLEAN_OPTION_DESC = "打开配置";	
	CHANNELCLEAN_OPTION_NAME = "聊天过滤";
elseif (GetLocale() == "zhTW") then
	CHANNELCLEAN_TITLE = "聊天過濾";
	CHANNELCLEAN_ENABLE = "開啟聊天過濾";	
	CHANNELCLEAN_OPTION_DESC = "打開配置";
	CHANNELCLEAN_OPTION_NAME = "聊天過濾";
else
	CHANNELCLEAN_TITLE = "聊天过滤";
	CHANNELCLEAN_ENABLE = "开启聊天过滤";	
	CHANNELCLEAN_OPTION_DESC = "打开配置";
	CHANNELCLEAN_OPTION_NAME = "ChannelClean";
end

if (dwIsConfigurableAddOn("ChannelClean")) then
	dwRegisterMod(
		"ChannelClean",
		CHANNELCLEAN_TITLE,
		"Channel Clean",
		"",
		"Interface\\ICONS\\Spell_Arcane_ArcaneResilience.blp",		
		nil
	);

	dwRegisterCheckButton(
		"ChannelClean",
		CHANNELCLEAN_ENABLE,
		"",
		"ChannelCleanEnable",
		1,
		function (arg)			
			if (arg == 1) then
				if (not dwIsAddOnLoaded("ChannelClean")) then
					dwLoadAddOn("ChannelClean");
				end
				
				ChannelClean:Toggle(true);
			else
				if (dwIsAddOnLoaded("ChannelClean")) then
					ChannelClean:Toggle(false);
				end
			end
		end
	);
	
	dwRegisterButton(
		"ChannelClean",
		CHANNELCLEAN_OPTION_DESC, 
		function()			
			if (dwIsAddOnLoaded("ChannelClean")) then
				--HideUIPanel(DuowanConfigFrame);
				--InterfaceOptionsFrame_OpenToCategory(CHANNELCLEAN_OPTION_NAME);
				 LibStub("AceConfigDialog-3.0"):Open(CHANNELCLEAN_OPTION_NAME);
			end
		end, 
		1
	);
end

