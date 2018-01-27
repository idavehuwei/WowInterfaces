
if (GetLocale() == "zhCN") then
    BIGFOOTGADGET_TITLE = {"大脚小工具", "dajiaoxiaogongju"};
    BIGFOOTGADGET_ENABLE_GPS = "开启坐标指示";
    BIGFOOTGADGET_ENABLE_MBB = "开启小地图按键包";
    BIGFOOTGADGET_CHANGE_FONT = "修改系统字体";
    BIGFOOTGADGET_CASTING_BAR = "使用大脚施法条"
elseif (GetLocale() == "zhTW") then
    BIGFOOTGADGET_TITLE = {"大腳小工具", "dajiaoxiaogongju"};
    BIGFOOTGADGET_ENABLE_GPS = "開啟座標指示";
    BIGFOOTGADGET_ENABLE_MBB = "開啟小地圖按鍵包";
    BIGFOOTGADGET_CHANGE_FONT = "修改系統字體";
    BIGFOOTGADGET_CASTING_BAR = "使用大腳施法條"
else
    BIGFOOTGADGET_TITLE = "BigFoot Gadget";
    BIGFOOTGADGET_ENABLE_GPS = "Enable GPS";
    BIGFOOTGADGET_ENABLE_MBB = "Enable Minimap button bag";
    BIGFOOTGADGET_CHANGE_FONT = "Change Default font";
    BIGFOOTGADGET_CASTING_BAR = "Use BFCastingBar"
end

if (IsConfigurableAddOn("BigFootGadget") or IsConfigurableAddOn("MBB")) then
    ModManagement_RegisterMod(
        "BigFootGadget",
        "Interface\\Icons\\INV_Gizmo_HardenedAdamantiteTube",
        BIGFOOTGADGET_TITLE,
        "",
        nil
    );
end

if (IsConfigurableAddOn("BigFootGadget")) then
    ModManagement_RegisterCheckBox(
        "BigFootGadget",
        BIGFOOTGADGET_ENABLE_GPS,
        nil,
        "EnableBigFootGPS",
        0,
        function (arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("BigFootGadget")) then
                    BigFoot_LoadAddOn("BigFootGadget");
                end

                if (BigFoot_IsAddOnLoaded("BigFootGadget")) then
                    BigFootGPS_Toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("BigFootGadget")) then
                    BigFootGPS_Toggle(false);
                end
            end
        end
    );
end

if (IsConfigurableAddOn("MBB")) then
    ModManagement_RegisterCheckBox(
        "BigFootGadget",
        BIGFOOTGADGET_ENABLE_MBB,
        nil,
        "EnableBigFootMBB",
        1,
        function (arg)
            if (arg == 1) then
                if (not BigFoot_IsAddOnLoaded("MBB")) then
                    BigFoot_LoadAddOn("MBB");
                end

                if (BigFoot_IsAddOnLoaded("MBB")) then
                    MBB_Toggle(true);
                end
            else
                if (BigFoot_IsAddOnLoaded("MBB")) then
                    MBB_Toggle(false);
                end
            end
        end
    );
end

ModManagement_RegisterCheckBox(
    "BigFootGadget",
    BIGFOOTGADGET_CHANGE_FONT,
    nil,
    "ChangeBigFootFont",
    0,
    function (arg)
        if (arg == 1) then
            BFGadget_FontName, BFGadget_FontHeight, BFGadget_FontFlags=NumberFontNormal:GetFont()
            NumberFontNormal:SetFont("Fonts\\ZYKai_T.TTF",14,"OUTLINE")
        else
            NumberFontNormal:SetFont(BFGadget_FontName or "Fonts\\ZYKai_C.ttf",BFGadget_FontHeight or 12,BFGadget_FontFlags or "OUTLINE")

        end
    end
);

ModManagement_RegisterCheckBox(
    "BigFootGadget",
    BIGFOOTGADGET_CASTING_BAR,
    nil,
    "BFCB",
    0,
    function (arg)
        if (arg == 1) then
            if (not BigFoot_IsAddOnLoaded("BFCastingBar")) then
                BigFoot_LoadAddOn("BFCastingBar");
            end
            if (BigFoot_IsAddOnLoaded("BFCastingBar")) then
                BFCB:Toggle(true)
            end
        else
            if (BigFoot_IsAddOnLoaded("BFCastingBar")) then
                BFCB:Toggle(false)
            end
        end
    end
);
