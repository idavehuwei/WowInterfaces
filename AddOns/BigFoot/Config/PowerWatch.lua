local ENABLE_POWER_WATCH;
local SHOW_ON_PALYER_FARME;
local LOCK_POSITION;
local POWER_WATCH;
if (GetLocale() == "zhCN") then
    POWER_WATCH = "能量监控器";
    ENABLE_POWER_WATCH = "启用能量监控器";
    SHOW_ON_PALYER_FARME = "依附于玩家头像";
    LOCK_POSITION = "锁定位置(依附模式无效)";
elseif (GetLocale() == "zhTW") then
    POWER_WATCH = "能量監控器";
    ENABLE_POWER_WATCH = "啟用能量監控器";
    SHOW_ON_PALYER_FARME = "依附於玩家頭像";
    LOCK_POSITION = "鎖定位置(依附模式無效)";
else
    POWER_WATCH = "Power Watch";
    ENABLE_POWER_WATCH = "Enable Power Watch";
    SHOW_ON_PALYER_FARME = "Show on player frame";
    LOCK_POSITION = "Lock position";
end

if (IsConfigurableAddOn("PowerWatch")) then
    ModManagement_RegisterMod("PowerWatch",
        "Interface\\ICONS\\Spell_Holy_SummonLightwell",
        POWER_WATCH,
        "",
        nil);
    ModManagement_RegisterCheckBox("PowerWatch",
        ENABLE_POWER_WATCH,
        nil,
        "EnablePowerWatch",
        1,
        function(arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("PowerWatch")) then
                    BigFoot_LoadAddOn("PowerWatch");
                end

                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_toggle(false);
                end
            end
        end);
    ModManagement_RegisterCheckBox("PowerWatch",
        SHOW_ON_PALYER_FARME,
        nil,
        "showOnPlayerFrame",
        1,
        function(arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("PowerWatch")) then
                    BigFoot_LoadAddOn("PowerWatch");
                end

                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_TypeToggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_TypeToggle(false);
                end
            end
        end,
        1);
    ModManagement_RegisterCheckBox("PowerWatch",
        LOCK_POSITION,
        nil,
        "lockPostion",
        1,
        function(arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("PowerWatch")) then
                    BigFoot_LoadAddOn("PowerWatch");
                end

                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_MoveToggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("PowerWatch")) then
                    PowerWatch_MoveToggle(false);
                end
            end
        end,
        1);
end