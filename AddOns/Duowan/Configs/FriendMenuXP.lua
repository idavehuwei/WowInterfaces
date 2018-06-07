------------------------------------
-- dugu 2009-12-21

if (GetLocale() == "zhCN") then
	FRIEND_MENU_TITLE = "玩家链接";
	FRIEND_MENU_OPTION1 = "开启玩家右键菜单增强";	
elseif (GetLocale() == "zhTW") then
	FRIEND_MENU_TITLE = "玩家链接";
	FRIEND_MENU_OPTION1 = "开启玩家右键菜单增强";	
else
	FRIEND_MENU_TITLE = "菜单/信息增强";
	FRIEND_MENU_OPTION1 = "开启玩家右键菜单增强";	
end

if (dwIsConfigurableAddOn("FriendsMenuXP")) then
	dwRegisterMod(
		"FRIENDSMENUXP",
		FRIEND_MENU_TITLE,
		"FRIENDSMENUXP",
		"",
		"Interface\\ICONS\\Spell_Nature_GiftoftheWaterSpirit",		
		nil
	);

	dwRegisterCheckButton(
		"FRIENDSMENUXP",
		FRIEND_MENU_OPTION1,
		nil,
		"FRIEND_MENU_OPTION1",
		1,
		function (arg)
			if (arg == 1) then
				if (not IsAddOnLoaded("FriendsMenuXP")) then
					LoadAddOn("FriendMenuXP");
				end
				FriendsMenu_ToggleEnable(true);
			else
				if (IsAddOnLoaded("FriendsMenuXP")) then					
					FriendsMenu_ToggleEnable(false);
				end			
			end
		end
	);
end