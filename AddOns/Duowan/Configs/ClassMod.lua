------------------------------------
-- dugu 2009-12-21
local DC = DUOWAN_COLOR;
if (GetLocale() == "zhCN") then
    CLASSMOD_TITLE = "职业辅助";
    CLASSMOD_TOTEMTIMERS_NAME = "图腾助手";
    CLASSMOD_TOTEMTIMERS_ENABLE = "开启图腾助手" .. DUOWAN_COLOR["STEELBLUE"] .. "(TotemTimers)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_TIMER = "启用图腾动作条" .. DUOWAN_COLOR["STEELBLUE"] .. "(计时器)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_TRACKER = "启用追踪器" .. DUOWAN_COLOR["STEELBLUE"] .. "(复生、盾和武器特效)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_ENHANCE = "启用萨满增强冷却计时器";
    CLASSMOD_TOTEMTIMERS_OPTION = "更多设置";
    CLASSMOD_HUNTERMOD_ENABLE = "开启猎人助手";
    CLASSMOD_HUNTERMOD_AUTOSHOT_ENABLE = "开启自动射击条";
    CLASSMOD_HUNTERMOD_AUTOSHOT_LOCK = "锁定自动射击条";
    CLASSMOD_HUNTERMOD_ZFEEDER_ENABLE = "开启猎人喂食按键";
    CLASSMOD_HUNTERMOD_ASPECTBAR_ENABLE = "开启猎人守护动作条";
    CLASSMOD_HUNTERMOD_AUTOTRACK_ENABLE = "开启自动追踪切换";
    CLASSMOD_HUNTERMOD_ANTIDAZE_ENABLE = "眩晕时启动取消豹守";
    CLASSMOD_HUNTERMOD_MISDIRECTYELL_ENABLE = "开启误导喊话通报";
    CLASSMOD_ROGUEMOD_ASPECTPOSIONBAR_ENABLE = "开启盗贼毒药守护动作条";
    CLASSMOD_MAGEMOD_TELEPORTBAR_ENABLE = "开启法师传送门动作条";
    CLASSMOD_WARLOCKMOD_PETBAR_ENABLE = "开启术士宠物召唤条";
    CLASSMOD_CLASSBAR_BINDING = "按键绑定";
    CLASSMOD_PALADINMOD_PALLPOWER_ENABLE = "开启圣骑士祝福管理" .. DUOWAN_COLOR["STEELBLUE"] .. " (PallyPower)" .. DUOWAN_COLOR["END"];
    CLASSMOD_RUNFRAME_ENABLE = "开启多玩DK符文条";
    CLASSMOD_RUNFRAME_ALPHA = "没有目标时半透明显示";
elseif (GetLocale() == "zhTW") then
    CLASSMOD_TITLE = "職業輔助";
    CLASSMOD_TOTEMTIMERS_NAME = "圖騰助手";
    CLASSMOD_TOTEMTIMERS_ENABLE = "開啟圖騰助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (TotemTimers)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_TIMER = "啟用圖騰動作條" .. DUOWAN_COLOR["STEELBLUE"] .. "(計時器)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_TRACKER = "啟用追蹤器" .. DUOWAN_COLOR["STEELBLUE"] .. "(複生、盾和武器特效)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_ENHANCE = "啟用薩滿增強冷卻計時器";
    CLASSMOD_TOTEMTIMERS_OPTION = "更多設置";
    CLASSMOD_HUNTERMOD_ENABLE = "開啟獵人助手";
    CLASSMOD_HUNTERMOD_AUTOSHOT_ENABLE = "開啟自動射擊條";
    CLASSMOD_HUNTERMOD_AUTOSHOT_LOCK = "鎖定自動射擊條";
    CLASSMOD_HUNTERMOD_ZFEEDER_ENABLE = "開啟獵人餵食按鍵";
    CLASSMOD_HUNTERMOD_ASPECTBAR_ENABLE = "開啟獵人守護動作條";
    CLASSMOD_HUNTERMOD_AUTOTRACK_ENABLE = "開啟自動追蹤切換";
    CLASSMOD_HUNTERMOD_ANTIDAZE_ENABLE = "眩暈時啟動取消豹守";
    CLASSMOD_HUNTERMOD_MISDIRECTYELL_ENABLE = "開啟誤導喊話通報";
    CLASSMOD_ROGUEMOD_ASPECTPOSIONBAR_ENABLE = "開啟盜賊毒藥守護動作條";
    CLASSMOD_MAGEMOD_TELEPORTBAR_ENABLE = "開啟法師傳送門動作條";
    CLASSMOD_WARLOCKMOD_PETBAR_ENABLE = "開啟術士寵物召喚條";
    CLASSMOD_CLASSBAR_BINDING = "按鍵綁定";
    CLASSMOD_RUNFRAME_ENABLE = "開啟多玩DK符文條";
    CLASSMOD_RUNFRAME_ALPHA = "沒有目標時半透明顯示";
    CLASSMOD_PALADINMOD_PALLPOWER_ENABLE = "開啟聖騎士祝福管理" .. DUOWAN_COLOR["STEELBLUE"] .. " (PallyPower)" .. DUOWAN_COLOR["END"];
else
    CLASSMOD_TITLE = "职业辅助";
    CLASSMOD_TOTEMTIMERS_NAME = "图腾助手";
    CLASSMOD_TOTEMTIMERS_ENABLE = "开启图腾助手" .. DUOWAN_COLOR["STEELBLUE"] .. " (TotemTimers)" .. DUOWAN_COLOR["END"];
    CLASSMOD_TOTEMTIMERS_TIMER = "启用图腾动作条(计时器)";
    CLASSMOD_TOTEMTIMERS_TRACKER = "启用追踪器(复生、盾和武器特效)";
    CLASSMOD_TOTEMTIMERS_ENHANCE = "启用萨满增强冷却计时器";
    CLASSMOD_TOTEMTIMERS_OPTION = "更多设置";
    CLASSMOD_HUNTERMOD_ENABLE = "开启猎人助手";
    CLASSMOD_HUNTERMOD_AUTOSHOT_ENABLE = "开启自动射击条";
    CLASSMOD_HUNTERMOD_AUTOSHOT_LOCK = "锁定自动射击条";
    CLASSMOD_HUNTERMOD_ZFEEDER_ENABLE = "开启猎人喂食按键";
    CLASSMOD_HUNTERMOD_ASPECTBAR_ENABLE = "开启猎人守护动作条";
    CLASSMOD_HUNTERMOD_AUTOTRACK_ENABLE = "开启自动追踪切换";
    CLASSMOD_HUNTERMOD_ANTIDAZE_ENABLE = "眩晕时启动取消豹守";
    CLASSMOD_HUNTERMOD_MISDIRECTYELL_ENABLE = "开启误导喊话通报";
    CLASSMOD_ROGUEMOD_ASPECTPOSIONBAR_ENABLE = "开启盗贼毒药守护动作条";
    CLASSMOD_MAGEMOD_TELEPORTBAR_ENABLE = "开启法师传送门动作条";
    CLASSMOD_WARLOCKMOD_PETBAR_ENABLE = "开启术士宠物召唤条";
    CLASSMOD_CLASSBAR_BINDING = "按键绑定";
    CLASSMOD_RUNFRAME_ENABLE = "开启多玩DK符文条";
    CLASSMOD_RUNFRAME_ALPHA = "没有目标时半透明显示";
    CLASSMOD_PALADINMOD_PALLPOWER_ENABLE = "开启圣骑士祝福管理" .. DUOWAN_COLOR["STEELBLUE"] .. " (PallyPower)" .. DUOWAN_COLOR["END"];
end

local _, class = UnitClass("player");

if ((dwIsConfigurableAddOn("TotemTimers") and class == "SHAMAN") or
    (dwIsConfigurableAddOn("AspectPosionBar") and (class == "ROGUE" or class == "HUNTER" or class == "MAGE" or class == "WARLOCK")) or
    (dwIsConfigurableAddOn("PallyPower") and class == "PALADIN") or
    (dwIsConfigurableAddOn("HunterMod") and class == "HUNTER") or
    (class == "DEATHKNIGHT" and not dwRuneFrameHasOtherAddOn())) then

    dwRegisterMod(
        "ClassModule",
        CLASSMOD_TITLE,
        "ClassModule",
        "",
        {"Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES",  CLASS_ICON_TCOORDS[class]},
        nil
    );
end

if (dwIsConfigurableAddOn("PallyPower") and class == "PALADIN") then
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_PALADINMOD_PALLPOWER_ENABLE,
        DUOWAN_RELOAD_DESC,
        "PallyPowerEnable",
        1,
        function (arg)
            if (arg == 1) then
                dwLoadAddOn("PallyPower");
            else
                if (dwIsAddOnLoaded("PallyPower")) then
                    dwRequestReloadUI(nil);
                end
            end
        end
    );

    dwRegisterButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_OPTION,
        function()
            if (dwIsAddOnLoaded("PallyPower")) then
                PallyPowerConfig_Toggle(true);
            end
        end,
        1
    );
end

if (dwIsConfigurableAddOn("TotemTimers") and class == "SHAMAN") then
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_ENABLE,
        DUOWAN_RELOAD_DESC,
        "TotemTimersEnable",
        1,
        function (arg)
            if (arg == 1) then
                dwLoadAddOn("TotemTimers");
            else
                if (dwIsAddOnLoaded("TotemTimers")) then
                    dwRequestReloadUI(nil);
                end
            end
        end
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_TIMER,
        "",
        "TotemTimersTimer",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_Timer_Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_Timer_Toggle(false);
                end
            end
        end,
        1
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_TRACKER,
        "",
        "TotemTimersTracker",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_Tracker_Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_Tracker_Toggle(false);
                end
            end
        end,
        1
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_ENHANCE,
        "",
        "TotemTimersEnhance",
        0,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_EnhanceCD_Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("TotemTimers")) then
                    TT_EnhanceCD_Toggle(false);
                end
            end
        end,
        1
    );

    dwRegisterButton(
        "ClassModule",
        CLASSMOD_TOTEMTIMERS_OPTION,
        function()
            if (dwIsAddOnLoaded("TotemTimers")) then
                InterfaceOptionsFrame_OpenToCategory(CLASSMOD_TOTEMTIMERS_NAME);
            end
        end,
        1
    );
end

if (dwIsConfigurableAddOn("HunterMod") and class == "HUNTER") then
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_ENABLE,
        DUOWAN_RELOAD_DESC,
        "HunterModEnable",
        1,
        function (arg)
            if (arg == 1) then
                dwLoadAddOn("HunterMod");
            end
        end
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_AUTOSHOT_ENABLE,
        "",
        "HunterModAutoShotEnable",
        0,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoShot:Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoShot:Toggle(false);
                end
            end
        end,
        1
    );
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_AUTOSHOT_LOCK,
        "",
        "HunterModAutoShotLock",
        0,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoShot:ToggleLock(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoShot:ToggleLock(false);
                end
            end
        end,
        2
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_ZFEEDER_ENABLE,
        "",
        "HunterModFeeder",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    zFeeder:Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    zFeeder:Toggle(false);
                end
            end
        end,
        1
    );

    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_AUTOTRACK_ENABLE,
        "",
        "AutoTrack",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoTrack:Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    AutoTrack:Toggle(false);
                end
            end
        end,
        1
    );
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_ANTIDAZE_ENABLE,
        "",
        "AntiDaze",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    AntiDaze:Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    AntiDaze:Toggle(false);
                end
            end
        end,
        1
    );
    --[[
    dwRegisterCheckButton(
        "ClassModule",
        CLASSMOD_HUNTERMOD_MISDIRECTYELL_ENABLE,
        "",
        "misDirectYell",
        1,
        function (arg)
            if (arg == 1) then
                if (dwIsAddOnLoaded("HunterMod")) then
                    misDirectYell:Toggle(true);
                end
            else
                if (dwIsAddOnLoaded("HunterMod")) then
                    misDirectYell:Toggle(false);
                end
            end
        end,
        1
    );
    ]]
end

if (dwIsConfigurableAddOn("AspectPosionBar") and  (class == "ROGUE" or class == "HUNTER" or class == "MAGE" or class == "WARLOCK")) then
    local desc;
    if (class == "HUNTER") then
        desc = CLASSMOD_HUNTERMOD_ASPECTBAR_ENABLE;
    elseif (class == "ROGUE") then
        desc = CLASSMOD_ROGUEMOD_ASPECTPOSIONBAR_ENABLE;
    elseif (class == "MAGE") then
        desc = CLASSMOD_MAGEMOD_TELEPORTBAR_ENABLE;
    elseif (class == "WARLOCK") then
        desc = CLASSMOD_WARLOCKMOD_PETBAR_ENABLE;
    end

    dwRegisterCheckButton(
        "ClassModule",
        desc,
        "",
        "EnableAspectBar",
        1,
        function (arg)
            if (arg == 1) then
                dwLoadAddOn("AspectPosionBar");
                AspectPosionBar_Toggle(true);
            else
                if (dwIsAddOnLoaded("AspectPosionBar")) then
                    AspectPosionBar_Toggle(false);
                end
            end
        end
    );

    dwRegisterButton(
        "ClassModule",
        CLASSMOD_CLASSBAR_BINDING,
        function()
            if (dwIsAddOnLoaded("AspectPosionBar")) then
                --dwShowKeyBindingFrame("HEADER_ASPECTBAR");
                dwShowKeyBindingFrame("SHAPESHIFTBUTTON1");
            end
        end,
        1
    );

end

-----------
-- DK
if (dwIsConfigurableAddOn("DuowanRuneBar") and (class == "DEATHKNIGHT")) then
    dwRegisterCheckButton("ClassModule",
        CLASSMOD_RUNFRAME_ENABLE,
        "",
        "EnableDkMod",
        1,
        function(arg)
            if (not dwIsAddOnLoaded("DuowanRuneBar")) then
                dwLoadAddOn("DuowanRuneBar");
            end
            if (dwIsAddOnLoaded("DuowanRuneBar")) then
                if (arg == 1) then
                    DuowanRuneBar_Enable(true);
                else
                    DuowanRuneBar_Enable(false);
                end
            end
        end);

    dwRegisterCheckButton("ClassModule",
        CLASSMOD_RUNFRAME_ALPHA,
        "",
        "Alpha",
        1,
        function(arg)
            if (dwIsAddOnLoaded("DuowanRuneBar")) then
                if (arg == 1) then
                    DuowanRuneBar_AlphaToggle(true);
                else
                    DuowanRuneBar_AlphaToggle(false);
                end
            end
        end,
        1);
end
