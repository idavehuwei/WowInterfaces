
if (IsConfigurableAddOn("ChatEnhance") or IsConfigurableAddOn("BubbleChat")) then
	if (GetLocale() == "zhCN") then
		CHAT_ENHANCEMENT_TITLE = {"聊天增强", "liaotianzengqiang"};
		BUBBLECHAT_ENABLE_TEXT= "开启泡泡聊天";
		SCROLL_CHATFRAME_TEXT = "允许使用鼠标滚轮滚动聊天窗口";
	elseif (GetLocale() == "zhTW") then
		CHAT_ENHANCEMENT_TITLE = {"聊天增強", "liaotianzengqiang"};
		BUBBLECHAT_ENABLE_TEXT= "開啟泡泡聊天";
		SCROLL_CHATFRAME_TEXT = "允許使用鼠標滾輪滾動聊天窗口";
	else
		CHAT_ENHANCEMENT_TITLE = "Chat Enhancement";
		BUBBLECHAT_ENABLE_TEXT= "Enable BubbleChat";
		SCROLL_CHATFRAME_TEXT = "Allow using mouse wheel to scroll chat window";
	end

	ModManagement_RegisterMod(
		"ChatEnhancement",
		"Interface\\Icons\\Spell_Magic_PolymorphChicken",
		CHAT_ENHANCEMENT_TITLE,
		"",
		nil
	);
end

if (IsConfigurableAddOn("BubbleChat")) then
	ModManagement_RegisterCheckBox(
		"ChatEnhancement",
		BUBBLECHAT_ENABLE_TEXT,
		nil,
		"EnableBubbleChat",
		0,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("BubbleChat")) then
					BigFoot_LoadAddOn("BubbleChat");
				end

				if (BigFoot_IsAddOnLoaded("BubbleChat")) then
					BubbleChat_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("BubbleChat")) then
					BubbleChat_Toggle(false);
				end
			end
		end
	);
end

if (IsConfigurableAddOn("ChatEnhance")) then
	ModManagement_RegisterCheckBox(
		"ChatEnhancement",
		SCROLL_CHATFRAME_TEXT,
		nil,
		"EnableScrollChatFrame",
		1,
		function (arg)
			if (arg == 1) then
				if (not BigFoot_IsAddOnLoaded("ChatEnhance")) then
					BigFoot_LoadAddOn("ChatEnhance");
				end

				if (BigFoot_IsAddOnLoaded("ChatEnhance")) then
					ChatEnahnce_Toggle(true);
				end
			else
				if (BigFoot_IsAddOnLoaded("ChatEnhance")) then
					ChatEnahnce_Toggle(false);
				end
			end
		end
	);
end
