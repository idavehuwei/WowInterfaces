if (GetLocale() == "zhCN") then
    MOD_INFO_ENHANCEMENT_TITLE = { "信息强化", "xinxiqianghua" };
    PLAYER_LINK_ENABLE_TEXT = "增强聊天窗口的玩家链接功能";
    QUICK_COMPARE_ENABLE = "启用装备比较";
elseif (GetLocale() == "zhTW") then
    MOD_INFO_ENHANCEMENT_TITLE = { "訊息強化", "xinxiqianghua" };
    PLAYER_LINK_ENABLE_TEXT = "增強聊天視窗的玩家鏈結功能";
    QUICK_COMPARE_ENABLE = "啓用裝備比較";
else
    MOD_INFO_ENHANCEMENT_TITLE = "Info Enhancement";
    PLAYER_LINK_ENABLE_TEXT = "Enhance player linke in chat window";
    QUICK_COMPARE_ENABLE = "Enable Quick Compare";
end

if (IsConfigurableAddOn("PlayerLink") or IsConfigurableAddOn("QuickCompare")) then
    ModManagement_RegisterMod("InfoEnhancement",
        "Interface\\Icons\\INV_Enchant_EssenceNetherLarge",
        MOD_INFO_ENHANCEMENT_TITLE,
        "",
        nil);
end

if (IsConfigurableAddOn("PlayerLink")) then
    ModManagement_RegisterCheckBox("InfoEnhancement",
        PLAYER_LINK_ENABLE_TEXT,
        nil,
        "EnablePlayerLink",
        1,
        function(arg1)
            if (arg1 == 1) then
                if (not BigFoot_IsAddOnLoaded("PlayerLink")) then
                    BigFoot_LoadAddOn("PlayerLink");
                end

                if (BigFoot_IsAddOnLoaded("PlayerLink")) then
                    PlayerLink_Toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("PlayerLink")) then
                    PlayerLink_Toggle(false);
                end
            end
        end);
end

if (IsConfigurableAddOn("QuickCompare")) then
    ModManagement_RegisterCheckBox("InfoEnhancement",
        QUICK_COMPARE_ENABLE,
        nil,
        "EnableQuickCompare",
        1,
        function(arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("QuickCompare")) then
                    BigFoot_LoadAddOn("QuickCompare");
                end
                if (BigFoot_IsAddOnLoaded("QuickCompare")) then
                    QuickCompare_Toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("QuickCompare")) then
                    QuickCompare_Toggle(false);
                end
            end
        end);
end
