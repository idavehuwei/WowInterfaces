------------------------------------
-- dugu@bigfoot 2009-12-22
local L = {};
if (GetLocale() == "zhCN") then
    SYSCONF_TITLE = "系统设置";
    SYSCONF_ENABLE = "启用默认系统设置";
    SYSCONF_ENABLE_UI_SCALE = "启用UI缩放";
    SYSCONF_UI_SCALE = "UI缩放";
else
    SYSCONF_TITLE = "System Configuration";
    SYSCONF_ENABLE = "Enable Default System Configuration";
    SYSCONF_ENABLE_UI_SCALE = "Enable UI Scale";
    SYSCONF_UI_SCALE = "UI Scale";
end

if (dwIsConfigurableAddOn("SystemConfig")) then
    print("Register SystemConfig");
    dwRegisterMod(
        "SystemConfigMod",
        SYSCONF_TITLE,
        "SystemConfigMod",
        "",
        "Interface\\ICONS\\Ability_Rogue_ShadowStrikes",
        nil
    );
end

if (dwIsConfigurableAddOn("SystemConfig")) then
    dwRegisterCheckButton(
        "SystemConfigMod",
        SYSCONF_ENABLE,
        nil,
        "SystemConfigEnable",
        1,
        function (arg)
            if(arg==1)then
                if (not dwIsAddOnLoaded("SystemConfig")) then
                    dwLoadAddOn("SystemConfig");
                end
            else
            end
        end
    );

    dwRegisterCheckButton(
        "SystemConfigMod",
        SYSCONF_ENABLE_UI_SCALE,
        nil,
        "SystemConfigEnableUIScale",
        1,
        function (arg)
            if(arg==1)then
                if (dwIsAddOnLoaded("SystemConfig")) then
                    --SYSCONF_SetValue("showhelp",true);
                    print("enable ui scale");
                end
            else
                if (dwIsAddOnLoaded("SystemConfig")) then
                    --SYSCONF_SetValue("showhelp",false);
                    print("disable ui scale");
                end
            end
        end,
        1
    );

    dwRegisterSpinBox(
        "SystemConfigMod",
        SYSCONF_UI_SCALE,
        DUOWAN_SPINBOX_RANGE,
        "SystemConfigLevTime",
        {0.64, 1, 0.1},
        0.68,
        function(arg)
            if (dwIsAddOnLoaded("SystemConfig")) then
                --SYSCONF_SetValue("leavetime",arg);
                print(string.format("Date:%s",arg));
            end
        end,
        2
    );
end
