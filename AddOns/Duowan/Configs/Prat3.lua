------------------------------------
-- dugu@bigfoot 2009-12-22

if (GetLocale() == "zhCN") then
	CHAT_MOD_TITLE = "聊天增强";
	CHAT_MOD_PRAT_ENABLE = "开启聊天功能扩展";
	CHAT_MOD_PRAT_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制玩家名字，鼠标滚动翻页等";
	CHAT_MOD_PRAT_OPTION_DESC = "打开配置";
	CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	CHAT_MOD_CHANNEL_ENABLE = "允许增加聊天分页";
	CHAT_MOD_CHAT_WHISPER = "开启密语聊天分页";
	CHAT_MOD_CHAT_GUILD = "开启公会聊天分页";
	CHAT_MOD_CHAT_RAID = "开启团队聊天分页";
	CHAT_MOD_CHAT_CHANNEL = "开启聊天通道";
elseif (GetLocale() == "zhTW") then
	CHAT_MOD_TITLE = "聊天增強";
	CHAT_MOD_PRAT_ENABLE = "開啟聊天功能擴展";
	CHAT_MOD_PRAT_TIP = "聊天功能增強允許你按照職業色彩著色玩家鏈結，複製玩家名字，滑鼠滾動翻頁等";
	CHAT_MOD_PRAT_OPTION_DESC = "打開配置";
	CHAT_MOD_CHANNEL_ENABLE = "允許增加聊天分頁";
	CHAT_MOD_CHATBAR_ENABLE = "開啟快捷聊天條";
	CHAT_MOD_CHAT_WHISPER = "开启密语聊天分页";
	CHAT_MOD_CHAT_GUILD = "开启公会聊天分页";
	CHAT_MOD_CHAT_RAID = "开启团队聊天分页";
	CHAT_MOD_CHAT_CHANNEL = "開啟聊天通道";
else
	CHAT_MOD_TITLE = "聊天增强";
	CHAT_MOD_PRAT_ENABLE = "开启聊天功能扩展";
	CHAT_MOD_PRAT_TIP = "聊天功能增强允许你按照职业色彩着色玩家链接，复制玩家名字，鼠标滚动翻页等";
	CHAT_MOD_PRAT_OPTION_DESC = "打开配置";
	CHAT_MOD_CHANNEL_ENABLE = "允许增加聊天分页";
	CHAT_MOD_CHATBAR_ENABLE = "开启快捷聊天条";
	CHAT_MOD_CHAT_WHISPER = "开启密语聊天分页";
	CHAT_MOD_CHAT_GUILD = "开启公会聊天分页";
	CHAT_MOD_CHAT_RAID = "开启团队聊天分页";
	CHAT_MOD_CHAT_CHANNEL = "开启聊天通道";
end

if (dwIsConfigurableAddOn("Prat-3.0") or dwIsConfigurableAddOn("ChatBar")) then	
	dwRegisterMod(
		"ChatMod",
		CHAT_MOD_TITLE,
		"Chat Mod",
		"",
		"Interface\\ICONS\\Spell_Holy_HolyGuidance",
		nil
	);
end

if (dwIsConfigurableAddOn("Prat-3.0")) then
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_PRAT_ENABLE,
		CHAT_MOD_PRAT_TIP,
		"PratEnable",
		1,
		function (arg)	
			if (arg == 1) then
				if (not IsAddOnLoaded("Prat-3.0")) then
					LoadAddOn("Prat-3.0");
				end
			else
				if (IsAddOnLoaded("Prat-3.0")) then
					dwRequestReloadUI(nil);
				end
			end
		end
	);
	dwRegisterButton(
		"ChatMod",
		CHAT_MOD_PRAT_OPTION_DESC, 
		function()			
			if (IsAddOnLoaded("Prat-3.0")) then
				--HideUIPanel(DuowanConfigFrame);
				--InterfaceOptionsFrame_OpenToCategory("Prat");	
				PratOpenOption();
			end			
		end,
		1
	);
end
	
if (dwIsConfigurableAddOn("ChatBar")) then
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHATBAR_ENABLE,
		nil,
		"ChatBarEnable",
		1,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				ChatBar_Toggle(true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatBar_Toggle(false);
				end				
			end
		end
	);
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHANNEL_ENABLE,
		nil,
		"ChatChannelEnable",
		1,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				ChatChannelToggle(true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatChannelToggle(false);
				end				
			end
		end
	);
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHAT_WHISPER,
		nil,
		"CHAT_MOD_CHAT_WHISPER",
		0,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				
				ChatChannelSetPage("WHISPER",true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatChannelSetPage("WHISPER",false);
				end				
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHAT_GUILD,
		nil,
		"CHAT_MOD_CHAT_GUILD",
		0,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				ChatChannelSetPage("GUILD",true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatChannelSetPage("GUILD",false);
				end				
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHAT_RAID,
		nil,
		"CHAT_MOD_CHAT_RAID",
		0,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				ChatChannelSetPage("RAID",true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatChannelSetPage("RAID",false);
				end				
			end
		end,
		1
	);
	dwRegisterCheckButton(
		"ChatMod",
		CHAT_MOD_CHAT_CHANNEL,
		nil,
		"CHAT_MOD_CHAT_CHANNEL",
		1,
		function (arg)		
			if (arg == 1) then		
				if (not IsAddOnLoaded("ChatBar")) then
					LoadAddOn("ChatBar");
				end
				ChatChannelSetPage("SYSTEM",true);
			else
				if (IsAddOnLoaded("ChatBar")) then
					ChatChannelSetPage("SYSTEM",false);
				end				
			end
		end,
		1
	);
end