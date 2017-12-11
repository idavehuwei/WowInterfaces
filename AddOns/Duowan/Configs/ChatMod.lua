------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	DUOWAN_CHAT_MOD_TITLE = "聊天增强";
	DUOWAN_CHAT_MOD_ENABLE = "开启多玩聊天增强";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制聊天信息，鼠标滚动翻页等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打开配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分页";
elseif (GetLocale() == "zhTW") then
	DUOWAN_CHAT_MOD_TITLE = "聊天增強";
	DUOWAN_CHAT_MOD_ENABLE = "開啟多玩聊天增強";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增強允許你按照職業色彩著色玩家鏈接，複製聊天資訊，滑鼠滾動翻頁等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打開配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "開啟快捷聊天條";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分頁";
else
	DUOWAN_CHAT_MOD_TITLE = "聊天增强";
	DUOWAN_CHAT_MOD_ENABLE = "开启多玩聊天增强";
	DUOWAN_CHAT_MOD_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制聊天信息，鼠标滚动翻页等";
	DUOWAN_CHAT_MOD_OPTION_DESC = "打开配置";
	DUOWAN_CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	DUOWAN_CHAT_MOD_CHANNEL_ENABLE = "增加聊天通道分页";
end

if (dwIsConfigurableAddOn("DuowanChat")) then
	dwRegisterMod(
		"ChatMod",
		DUOWAN_CHAT_MOD_TITLE,
		"DuowanChat",
		"",
		"Interface\\ICONS\\Spell_Holy_HolyGuidance",
		nil
	);

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
		0,
		function (arg)
			if (arg == 1) then
				DuowanChat:EnableModule("CHATCHANNEL");
			else
				DuowanChat:DisableModule("CHATCHANNEL");
			end
		end,
		1
	);

	dwRegisterButton(
		"ChatMod",
		DUOWAN_CHAT_MOD_OPTION_DESC,
		function()
			if (dwIsAddOnLoaded("DuowanChat")) then
				--HideUIPanel(DuowanConfigFrame);
				--InterfaceOptionsFrame_OpenToCategory("Prat");
				--PratOpenOption();
				DuowanChat:ShowOptions();
			end
		end,
		1
	);
end