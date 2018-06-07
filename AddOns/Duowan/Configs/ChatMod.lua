------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	DUOWAN_CHAT_MOD_TITLE = "聊天增强";
	DUOWAN_CHAT_MOD_ENABLE = "开启多玩聊天增强";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制聊天信息，鼠标滚动翻页等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打开配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分页";
	DUOWAN_CHAT_MOD_WHISPERPOP = "开启密语聊天模块";
	DUOWAN_CHAT_MOD_CHATPOPO = "开启组队聊天泡泡";
	DUOWAN_CHAT_MOD_CHATPOPO_IN_RAID = "在团队中隐藏";
	DUOWAN_CHAT_MOD_OPEN_YY = "在进入频道时显示画中画";
	DUOWAN_CHAT_MOD_REPORT_STAT = "开启玩家属性发送";
	DUOWAN_CHAT_MOD_REPORT_STAT_DESC = "左键发送简约信息\n右键发送详细信息";
	DUOWAN_CHAT_MOD_LFG_FORWARDER = "开启组队频道转发";
	DUOWAN_CHAT_MOD_LFG_FORWARDER_DESC = "开启后在野外也可以接受到组队频道信息";
elseif (GetLocale() == "zhTW") then
	DUOWAN_CHAT_MOD_TITLE = "聊天增強";
	DUOWAN_CHAT_MOD_ENABLE = "開啟多玩聊天增強";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增強允許你按照職業色彩著色玩家鏈接，複製聊天資訊，滑鼠滾動翻頁等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打開配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "開啟快捷聊天條";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分頁";
	DUOWAN_CHAT_MOD_WHISPERPOP = "開啟密語聊天模塊";
	DUOWAN_CHAT_MOD_CHATPOPO = "开启組隊聊天泡泡";
	DUOWAN_CHAT_MOD_CHATPOPO_IN_RAID = "在團隊中隱藏";
	DUOWAN_CHAT_MOD_OPEN_YY = "在進入頻道時顯示畫中畫";
	DUOWAN_CHAT_MOD_REPORT_STAT = "開啟個人屬性發送";
	DUOWAN_CHAT_MOD_REPORT_STAT_DESC = "左鍵發送簡約資訊\n右鍵發送詳細資訊";
	DUOWAN_CHAT_MOD_LFG_FORWARDER = "開啟組隊頻道轉發";
	DUOWAN_CHAT_MOD_LFG_FORWARDER_DESC = "開啟後在野外也可以接受到組隊頻道資訊";
else
	DUOWAN_CHAT_MOD_TITLE = "聊天增强";
	DUOWAN_CHAT_MOD_ENABLE = "开启多玩聊天增强";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制聊天信息，鼠标滚动翻页等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打开配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分页";
	DUOWAN_CHAT_MOD_WHISPERPOP = "开启密语聊天模块";
	DUOWAN_CHAT_MOD_CHATPOPO = "开启聊天泡泡";
	DUOWAN_CHAT_MOD_CHATPOPO_IN_RAID = "在团队中隐藏";
	DUOWAN_CHAT_MOD_OPEN_YY = "在进入频道时显示画中画";
	DUOWAN_CHAT_MOD_REPORT_STAT = "开启玩家属性发送";
	DUOWAN_CHAT_MOD_REPORT_STAT_DESC = "左键发送简约信息\n右键发送详细信息";
	DUOWAN_CHAT_MOD_LFG_FORWARDER = "开启组队频道转发";
	DUOWAN_CHAT_MOD_LFG_FORWARDER_DESC = "开启后在野外也可以接受到组队频道信息";
end

if (dwIsConfigurableAddOn("DuowanChat") or dwIsConfigurableAddOn("WhisperPop") or dwIsConfigurableAddOn("ChatPopo")) then
	dwRegisterMod(
		"ChatMod",
		DUOWAN_CHAT_MOD_TITLE,
		"DuowanChat",
		"",
		"Interface\\ICONS\\Spell_Holy_HolyGuidance",
		nil
	);
end

if (dwIsConfigurableAddOn("DuowanChat")) then
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_ENABLE,
		DUOWAN_CHAT_MOD_TIP,
		"DuowanChatEnable",
		1,
		function (arg)	
			if (arg == 1) then
				DuowanChat:Enable();
			else				
				DuowanChat:Disable();
			end
		end
	);
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_CHATBAR_ENABLE,
		nil,
		"ChatBarEnable",
		1,
		function (arg)		
			if (arg == 1) then				
				DuowanChat:EnableModule("ICONFRAME");
				DuowanChat:EnableModule("CHATFRAME");
			else
				DuowanChat:DisableModule("ICONFRAME");
				DuowanChat:DisableModule("CHATFRAME");			
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_CHANNEL_ENABLE,
		nil,
		"ChatChannelEnable",
		1,
		function (arg)		
			if (arg == 1) then				
				DuowanChat:EnableModule("CHATCHANNEL");
			else				
				DuowanChat:DisableModule("CHATCHANNEL");
			end
		end,
		1
	);
	--[[
	dwRegisterButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_OPTION_DESC, 
		function()			
			if (dwIsAddOnLoaded("DuowanChat")) then
				--HideUIPanel(DuowanConfigFrame);
				--InterfaceOptionsFrame_OpenToCategory("Prat");	
				PratOpenOption();
			end			
		end,
		1
	);
	
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_OPEN_YY,
		nil,
		"OpenOnJoin",
		0,
		function (arg)		
			if (arg == 1) then				
				DuoSpeak_OpenOnJoin(true);
			else				
				DuoSpeak_OpenOnJoin(false);
			end
		end
	);
	]]
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_REPORT_STAT,
		DUOWAN_CHAT_MOD_REPORT_STAT_DESC,
		"ReportStat",
		1,
		function (arg)		
			if (arg == 1) then				
				DuowanStat_Toggle(true);
			else				
				DuowanStat_Toggle(false)
			end
		end
	);

	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_LFG_FORWARDER,
		DUOWAN_CHAT_MOD_LFG_FORWARDER_DESC,
		"LFGForwarder",
		1,
		function (arg)		
			if (arg == 1) then				
				dwLFGForwarder_Toggle(true);
			else				
				dwLFGForwarder_Toggle(false);
			end
		end
	);
end

if (dwIsConfigurableAddOn("WhisperPop")) then
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_WHISPERPOP,
		nil,
		"WhisperPop",
		1,
		function (arg)		
			if (arg == 1) then				
				WhisperPop_Toggle(true);
			else				
				WhisperPop_Toggle(false);
			end
		end
	);
end

if (dwIsConfigurableAddOn("ChatPopo")) then
	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_CHATPOPO,
		nil,
		"ChatPopoEnable",
		1,
		function (arg)
			if (arg == 1) then
				ChatPopo_Toggle(true);
			else
				ChatPopo_Toggle(false);
			end
		end
	);

	dwRegisterCheckButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_CHATPOPO_IN_RAID,
		nil,
		"hideInRaid",
		1,
		function (arg)
			if (arg == 1) then
				ChatPopoInRaid_Toggle(true);
			else
				ChatPopoInRaid_Toggle(false)
			end
		end,
		1
	);	
end