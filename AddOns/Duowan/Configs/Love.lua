------------------------------------
-- dugu 2009-12-22

if (GetLocale() == "zhCN") then
	LOVE_MOD_TITLE = "便捷工具";
	LOVE_MOD_FOCUS_ENABLE = "允许快速设置焦点";
	LOVE_MOD_FOCUS_ENABLE_TIP = "Shift - 左键点目标设置焦点\nShift - 右键点焦点取消焦点";
	LOVE_MOD_FOCUS_SHOWTIP = "显示提示信息";	
	LOVE_MOD_IMPORT_FRIEND = "允许导入别的角色的好友";
	LOVE_MOD_SHUANGCAI = "自动切换矿物和草药的追踪";
	LOVE_MOD_EZICON_TEXT = "开启快速团队标记";
	FRIEND_MENU_ENABLE_TEXT = "开启玩家右键菜单增强";
	TRADITIONALIZE_ENABLE_TEXT = "开启简体自动转繁体功能";
	MAP_NOTE_ENABLE = "开启地图标记";
	MAP_NOTE_ENABLE_TIP = "Ctrl+左键在大地图上添加标记";
elseif (GetLocale() == "zhTW") then
	LOVE_MOD_TITLE = "便捷工具";
	LOVE_MOD_FOCUS_ENABLE = "允許快速設置焦點";
	LOVE_MOD_FOCUS_ENABLE_TIP = "Shift - 左鍵點目標設置焦點\nShift - 右鍵點焦點取消焦點";
	LOVE_MOD_FOCUS_SHOWTIP = "顯示提示資訊";	
	LOVE_MOD_IMPORT_FRIEND = "允許導入別的角色的好友";
	LOVE_MOD_SHUANGCAI = "自動切換礦物和草藥的追蹤";
	LOVE_MOD_EZICON_TEXT = "開啟快速團隊標記";
	FRIEND_MENU_ENABLE_TEXT = "開啟玩家右鍵菜單增強";
	TRADITIONALIZE_ENABLE_TEXT = "開啟簡體自動轉繁體功能";
	MAP_NOTE_ENABLE = "開啟地圖標記";
	MAP_NOTE_ENABLE_TIP = "Ctrl+左鍵在大地圖上添加標記";
else
	LOVE_MOD_TITLE = "便捷工具";
	LOVE_MOD_FOCUS_ENABLE = "允许快速设置焦点";
	LOVE_MOD_FOCUS_ENABLE_TIP = "Shift - 左键点目标设置焦点\nShift - 右键点焦点取消焦点";
	LOVE_MOD_FOCUS_SHOWTIP = "显示提示信息";
	LOVE_MOD_IMPORT_FRIEND = "允许导入别的角色的好友";
	LOVE_MOD_SHUANGCAI = "自动切换矿物和草药的追踪";
	LOVE_MOD_EZICON_TEXT = "开启快速团队标记";
	FRIEND_MENU_ENABLE_TEXT = "开启玩家右键菜单增强";
	TRADITIONALIZE_ENABLE_TEXT = "开启简体自动转繁体功能";
	MAP_NOTE_ENABLE = "开启地图标记";
	MAP_NOTE_ENABLE_TIP = "Ctrl+左键在大地图上添加标记";
end

if (dwIsConfigurableAddOn("MapNotes") or dwIsConfigurableAddOn("Love") or dwIsConfigurableAddOn("FriendsMenuXP") or GetLocale() == "zhTW") then
	dwRegisterMod(
		"LoveMod",
		LOVE_MOD_TITLE,
		"LoveMod",
		"",
		"Interface\\ICONS\\INV_ValentinesBoxOfChocolates02",
		nil
	);
end

if (dwIsConfigurableAddOn("Love")) then
	dwRegisterCheckButton(
		"LoveMod",
		LOVE_MOD_FOCUS_ENABLE,
		LOVE_MOD_FOCUS_ENABLE_TIP,
		"EnableQucikFocus",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("Love")) then
					dwLoadAddOn("Love");					
				end
				Love_QuickFocus_Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					Love_QuickFocus_Toggle(false);
				end				
			end
		end
	);
	
	dwRegisterCheckButton(
		"LoveMod",
		LOVE_MOD_FOCUS_SHOWTIP,
		nil,
		"ShowQucikFocusTip",
		1,
		function (arg)		
			if arg==1 then
				if (dwIsAddOnLoaded("Love")) then
					Love_QuickFocus_ShowTip(true);
				end	
			else
				if (dwIsAddOnLoaded("Love")) then	
					Love_QuickFocus_ShowTip(false);
				end				
			end
		end,
		1
	);

	dwRegisterCheckButton(
		"LoveMod",
		LOVE_MOD_IMPORT_FRIEND,
		nil,
		"EnableImportFriend",
		1,
		function (arg)		
			if arg==1 then
				if (not dwIsAddOnLoaded("Love")) then
					dwLoadAddOn("Love");					
				end
				Love_ImportFriend_Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					Love_ImportFriend_Toggle(false);
				end				
			end
		end
	);
	--[[
	dwRegisterCheckButton(
		"LoveMod",
		LOVE_MOD_SHUANGCAI,
		nil,
		"EnableShuangCai",
		0,
		function (arg)
			if arg==1 then
				if (not dwIsAddOnLoaded("Love")) then
					dwLoadAddOn("Love");					
				end
				Love_ShuangCai_Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					Love_ShuangCai_Toggle(false);
				end				
			end
		end
	);
	]]
	dwRegisterCheckButton(
		"LoveMod",
		LOVE_MOD_EZICON_TEXT,
		nil,
		"EnableezIcon",
		1,
		function (arg)
			if arg==1 then
				if (not dwIsAddOnLoaded("Love")) then
					dwLoadAddOn("Love");					
				end
				ezIcons:Toggle(true);
			else
				if (dwIsAddOnLoaded("Love")) then	
					ezIcons:Toggle(false);
				end				
			end
		end
	);

	dwRegisterCheckButton(
		"LoveMod",
		FRIEND_MENU_ENABLE_TEXT,
		nil,
		"EnableFriendMenu",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("FriendsMenuXP")) then
					dwLoadAddOn("FriendMenuXP");
				end
				FriendsMenu_ToggleEnable(true);
			else
				if (dwIsAddOnLoaded("FriendsMenuXP")) then					
					FriendsMenu_ToggleEnable(false);
				end			
			end
		end
	);
--[[
		dwRegisterButton(
			"zBarMod",
			ZBAR3_OPTION_DESC, 
			function()	
				if (dwIsAddOnLoaded("zBar3")) then	
					SlashCmdList["ZBAR"]();		
				end
			end, 
			1
		);
]]
end

-- 简体转繁体
if (GetLocale() == "zhTW") then
	dwRegisterCheckButton(
		"LoveMod",
		TRADITIONALIZE_ENABLE_TEXT,
		nil,
		"EnableTraditionalize",
		1,
		function (arg)
			if (arg == 1) then			
				Traditionalize_Toggle(true);
			else			
				Traditionalize_Toggle(false);
			end
		end
	);
end

if (dwIsConfigurableAddOn("MapNotes")) then
	dwRegisterCheckButton(
		"LoveMod",
		MAP_NOTE_ENABLE,
		MAP_NOTE_ENABLE_TIP,
		"EnableMapNotes",
		1,
		function (arg)
			if (arg == 1) then
				if (not dwIsAddOnLoaded("MapNotes")) then
					dwLoadAddOn("MapNotes");
				end
				MapNotes:Toggle(true);
			else			
				MapNotes:Toggle(false);
			end
		end
	);	
end	