if (GetLocale() == "zhCN") then
    AUTOEQUIP_TITLE = { "自动换装", "zidonghuanzhuang" };
    AUTOEQUIP_ENABLE = "允许自动换装";
    AUTOEQUIP_ENABLE_RAID_AUTOHIDE = "处于团队中隐藏界面";
    AUTOEQUIP_ENABLE_RAID_ADVANCED_MODE = "8套装增强模式";
    AUTOEQUIP_CLEAR_ALL = "清除所有设置";
    AUTOEQUIP_KEY_BINDING = "按键绑定";
elseif (GetLocale() == "zhTW") then
    AUTOEQUIP_TITLE = { "自動換裝", "zidonghuanzhuang" };
    AUTOEQUIP_ENABLE = "允許自動換裝";
    AUTOEQUIP_ENABLE_RAID_AUTOHIDE = "處於團隊中隱藏介面";
    AUTOEQUIP_ENABLE_RAID_ADVANCED_MODE = "8套裝增強模式";
    AUTOEQUIP_CLEAR_ALL = "清除所有設定";
    AUTOEQUIP_KEY_BINDING = "按鍵綁定";
else
    AUTOEQUIP_TITLE = "Auto Equip";
    AUTOEQUIP_ENABLE = "Enable Auto Equip";
    AUTOEQUIP_ENABLE_RAID_AUTOHIDE = "Hide UI when you are in raid";
    AUTOEQUIP_ENABLE_RAID_ADVANCED_MODE = "Enahcned mode with 8 sets";
    AUTOEQUIP_CLEAR_ALL = "Clear All Set";
    AUTOEQUIP_KEY_BINDING = "Key Binding";
end

if (IsConfigurableAddOn("AutoEquip")) then
    ModManagement_RegisterMod("AutoEquip",
        "Interface\\Icons\\INV_Gizmo_04",
        AUTOEQUIP_TITLE,
        "",
        nil);

    ModManagement_RegisterCheckBox("AutoEquip",
        AUTOEQUIP_ENABLE,
        nil,
        "EnableAutoEquip",
        1,
        function(__arg)
            if (__arg == 1) then
                if (not BigFoot_IsAddOnLoaded("AutoEquip")) then
                    BigFoot_LoadAddOn("AutoEquip");
                end

                if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                    AutoEquip_Toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                    AutoEquip_Toggle(false);
                end
            end
        end);

    ModManagement_RegisterCheckBox("AutoEquip",
        AUTOEQUIP_ENABLE_RAID_ADVANCED_MODE,
        nil,
        "EnableAdvancedMode",
        0,
        function(__arg)
            if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                if (__arg == 1) then
                    AutoEquip_ToggleMode("advance");
                else
                    AutoEquip_ToggleMode("normal");
                end
            end
        end,
        1);

    ModManagement_RegisterCheckBox("AutoEquip",
        AUTOEQUIP_ENABLE_RAID_AUTOHIDE,
        nil,
        "EnableAutoHide",
        0,
        function(__arg)
            if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                if (__arg == 1) then
                    AutoEquip_EnableAutoHide(true);
                else
                    AutoEquip_EnableAutoHide(false);
                end
            end
        end,
        1);

    ModManagement_RegisterButton("AutoEquip",
        AUTOEQUIP_CLEAR_ALL,
        function()
            if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                AutoEquip_ClearAll();
            end
        end,
        nil,
        1);

    ModManagement_RegisterButton("AutoEquip",
        AUTOEQUIP_KEY_BINDING,
        function()
            if (BigFoot_IsAddOnLoaded("AutoEquip")) then
                AutoEquip_KeyBinding();
            end
        end,
        nil,
        1);
end
