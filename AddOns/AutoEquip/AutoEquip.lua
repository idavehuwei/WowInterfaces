if (GetLocale() == "zhCN") then
    AUTOEQUIP_NAME = "自动换装";
    BINDING_HEADER_AUTOEQUIP_TITLE = "自动换装按键";
    BINDING_NAME_AUTOEQUIP_SET1 = "套装 1";
    BINDING_NAME_AUTOEQUIP_SET2 = "套装 2";
    BINDING_NAME_AUTOEQUIP_SET3 = "套装 3";
    BINDING_NAME_AUTOEQUIP_SET4 = "套装 4";
    BINDING_NAME_AUTOEQUIP_SET5 = "套装 5";
    BINDING_NAME_AUTOEQUIP_SET6 = "套装 6";
    BINDING_NAME_AUTOEQUIP_SET7 = "套装 7";
    BINDING_NAME_AUTOEQUIP_SET8 = "套装 8";
    BINDING_NAME_AUTOEQUIP_NEXT = "切换到下一套装备";
    BINDING_NAME_AUTOEQUIP_PREV = "切换到上一套装备";
    AUTOEQUIP_SAVE_INFO = "执行该操作将覆盖以前的设置，您是否真的想这么做？";
    AUTOEQUIP_SAVE_TOOLTIP = "存储当前身上的装备设置";
    AUTOEQUIP_SET_TOOLITP = "切换到套装";
    AUTOEQUIP_HELP_SAVE_BTN_TITLE = "保存装备配置";
    AUTOEQUIP_HELP_SAVE_BTN_DESC = "将身上的装备配置保存到目前选择的套装号里。如果在你选择的套装号已经保存了配置，将会造成原有的配置丢失。";
    AUTOEQUIP_HELP_SET_BTN_TITLE = "设定装备配置";
    AUTOEQUIP_HELP_SET_BTN_DESC = "将身上的装备设定到指定的套装号上，如果该套装号里不存在配置，将不会有任何装备被切换。";
    AUTOEQUIP_HELP_SET_BTN_COMMENT1 = "|cffc0c0c0Shift+左键仅选择套装号不切换装备|r";
    AUTOEQUIP_HELP_SET_BTN_COMMENT2 = "|cffc0c0c0Shift+右键添加备注|r";
    AUTOEQUIP_HELP_SET_ADD_COMMENT = "输入套装的备注信息";
    AUTOEQUIP_MOVE_TOOLTIP = "按住Shift和鼠标左键可拖动框体。";
    AUTOEQUIP_USAGE_LINE1 = "|cff00adef<自动换装>|r AutoEquip set (1-8) |cffffffff切换装备到指定的套装|r";
    AUTOEQUIP_USAGE_LINE2 = "|cff00adef<自动换装>|r AutoEquip clear |cffffffff清除所有装备设置|r";
    AUTOEQUIP_USAGE_LINE3 = "|cff00adef<自动换装>|r AutoEquip save (1-8) |cffffffff保存当前身上装备到指定套装|r";
    AUTOEQUIP_TEXT_SWITCH = "|cff00adef<自动换装>|r 装备切换到设置%d，按住Shift键点击将不做切换.";
    AUTOEQUIP_TEXT_OUT_OF_NUMBER = "|cff00adef<自动换装>|r 您选择的设置序号超出了范围(1-8)。";
    AUTOEQUIP_TEXT_INVALID_PARAMETER = "|cff00adef<自动换装>|r 不合法的参数。";
    AUTOEQUIP_TEXT_SAVED = "|cff00adef<自动换装>|r 套装%d已经被保存。";
    AUTOEQUIP_TEXT_SETTING_CLEARED = "|cff00adef<自动换装>|r 所有套装配置已经被清除。";
    AUTOEQUIP_RAID_TIP = "你现在处于团队中，自动换装界面自动隐藏。为了切换装备套装，请移动鼠标到自己头像上，界面将会显示。";
    AUTOEQUIP_QUIVER = "箭袋";
    AUTOEQUIP_AMMO = "弹药";
    AUTOEQUIP_SOUL_BAG = "灵魂袋";
elseif (GetLocale() == "zhTW") then AUTOEQUIP_NAME = "自動換裝";
    BINDING_HEADER_AUTOEQUIP_TITLE = "自動換裝按鍵";
    BINDING_NAME_AUTOEQUIP_SET1 = "套裝 1";
    BINDING_NAME_AUTOEQUIP_SET2 = "套裝 2";
    BINDING_NAME_AUTOEQUIP_SET3 = "套裝 3";
    BINDING_NAME_AUTOEQUIP_SET4 = "套裝 4";
    BINDING_NAME_AUTOEQUIP_SET5 = "套裝 5";
    BINDING_NAME_AUTOEQUIP_SET6 = "套裝 6";
    BINDING_NAME_AUTOEQUIP_SET7 = "套裝 7";
    BINDING_NAME_AUTOEQUIP_SET8 = "套裝 8";
    BINDING_NAME_AUTOEQUIP_NEXT = "切換到下一套裝備";
    BINDING_NAME_AUTOEQUIP_PREV = "切換到上一套裝備";
    AUTOEQUIP_SAVE_INFO = "執行該操作將覆蓋以前的設置，您是否真的想這麼做？";
    AUTOEQUIP_SAVE_TOOLTIP = "存儲當前身上的裝備設置";
    AUTOEQUIP_SET_TOOLITP = "切換到套裝";
    AUTOEQUIP_HELP_SAVE_BTN_TITLE = "保存裝備配置";
    AUTOEQUIP_HELP_SAVE_BTN_DESC = "將身上的裝備配置保存到目前選擇的套裝號裡。如果在你選擇的套裝號已經保存了配置，將會造成原有的配置丟失。";
    AUTOEQUIP_HELP_SET_BTN_TITLE = "設定裝備配置";
    AUTOEQUIP_HELP_SET_BTN_DESC = "將身上的裝備設定到指定的套裝號上，如果該套裝號裡不存在配置，將不會有任何裝備被切換。按住Shift鍵點擊將僅僅切換序號而不實際切換裝備。";
    AUTOEQUIP_MOVE_TOOLTIP = "按住Shift和滑鼠左鍵可拖動框體。";
    AUTOEQUIP_USAGE_LINE1 = "|cff00adef<自動換裝>|r AutoEquip set (1-8) |cffffffff切換裝備到指定的套裝|r";
    AUTOEQUIP_USAGE_LINE2 = "|cff00adef<自動換裝>|r AutoEquip clear |cffffffff清除所有裝備設置|r";
    AUTOEQUIP_USAGE_LINE3 = "|cff00adef<自動換裝>|r AutoEquip save (1-8) |cffffffff保存當前身上裝備到指定套裝|r";
    AUTOEQUIP_TEXT_SWITCH = "|cff00adef<自動換裝>|r 裝備切換到設置%d，按住Shift鍵點擊將不做切換.";
    AUTOEQUIP_TEXT_OUT_OF_NUMBER = "|cff00adef<自動換裝>|r 您選擇的設置序號超出了範圍(1-8)。";
    AUTOEQUIP_TEXT_INVALID_PARAMETER = "|cff00adef<自動換裝>|r 不合法的參數。";
    AUTOEQUIP_TEXT_SAVED = "|cff00adef<自動換裝>|r 套裝%d已經被保存。";
    AUTOEQUIP_TEXT_SETTING_CLEARED = "|cff00adef<自動換裝>|r 所有套裝配置已經被清除。";
    AUTOEQUIP_RAID_TIP = "你現在處於團隊中，自動換裝介面自動隱藏。為了切換裝備套裝，請移動滑鼠到自己頭像上，介面將會顯示。";
    AUTOEQUIP_QUIVER = "箭袋";
    AUTOEQUIP_AMMO = "彈藥";
    AUTOEQUIP_SOUL_BAG = "靈魂袋";
else AUTOEQUIP_NAME = "Auto Equip";
    BINDING_HEADER_AUTOEQUIP_TITLE = "Auto Equip";
    BINDING_NAME_AUTOEQUIP_SET1 = "Set 1";
    BINDING_NAME_AUTOEQUIP_SET2 = "Set 2";
    BINDING_NAME_AUTOEQUIP_SET3 = "Set 3";
    BINDING_NAME_AUTOEQUIP_SET4 = "Set 4";
    BINDING_NAME_AUTOEQUIP_SET5 = "Set 5";
    BINDING_NAME_AUTOEQUIP_SET6 = "Set 6";
    BINDING_NAME_AUTOEQUIP_SET7 = "Set 7";
    BINDING_NAME_AUTOEQUIP_SET8 = "Set 8";
    BINDING_NAME_AUTOEQUIP_NEXT = "Switch to next set";
    BINDING_NAME_AUTOEQUIP_PREV = "Switch to previous set";
    AUTOEQUIP_SAVE_INFO = "The previous settings will be replaced, do you really want to do?";
    AUTOEQUIP_SAVE_TOOLTIP = "Save equipments you wearing";
    AUTOEQUIP_SET_TOOLITP = "Switch to set";
    AUTOEQUIP_HELP_SAVE_BTN_TITLE = "Save settings";
    AUTOEQUIP_HELP_SAVE_BTN_DESC = "Save equipments you are wearing to selected set number. If the setting you selected already exists, all previous information will be lost.";
    AUTOEQUIP_HELP_SET_BTN_TITLE = "Set equipment set";
    AUTOEQUIP_HELP_SET_BTN_DESC = "Save equipments you are wearing to selected set number. If the setting you selected does not exists, nothing will happend. Holde shift key to prevent equipment switching.";
    AUTOEQUIP_MOVE_TOOLTIP = "Hold shift key and Left button to drag frame."; AUTOEQUIP_USAGE_LINE1 = "|cff00adef<AutoEquip>|r AutoEquip set (1-8) |cffffffffSwitch to specified set number|r";
    AUTOEQUIP_USAGE_LINE2 = "|cff00adef<AutoEquip>|r AutoEquip clear |cffffffffClear all settings|r";
    AUTOEQUIP_USAGE_LINE3 = "|cff00adef<AutoEquip>|r AutoEquip save (1-8) |cffffffffSave equipments you are wearing to specified set number|r";
    AUTOEQUIP_TEXT_SWITCH = "|cff00adef<AutoEquip>|r The set has been switched to setting %d. Hold shift key to prevent from switching.";
    AUTOEQUIP_TEXT_OUT_OF_NUMBER = "|cff00adef<AutoEquip>|r The set number you selected is out of range(1-8).";
    AUTOEQUIP_TEXT_INVALID_PARAMETER = "|cff00adef<AutoEquip>|r Invalid parameter.";
    AUTOEQUIP_TEXT_SAVED = "|cff00adef<AutoEquip>|r Set %d has been saved.";
    AUTOEQUIP_TEXT_SETTING_CLEARED = "|cff00adef<AutoEquip>|r All setting has been cleared.";
    AUTOEQUIP_RAID_TIP = "You are now in raid, the AutoEquip interface will be hide automatically. To switch your equipment set, move your mouse on your portrait, the interface will be shown.";
    AUTOEQUIP_QUIVER = "Quiver";
    AUTOEQUIP_AMMO = "Ammo";
    AUTOEQUIP_SOUL_BAG = "Soul Bag";
end

AutoEquip_b5afb1939b42d2489f5d7985e2839133 = {
    "HeadSlot",
    "ShoulderSlot",
    "ChestSlot",
    "WristSlot",
    "HandsSlot",
    "WaistSlot",
    "LegsSlot",
    "FeetSlot",
    "MainHandSlot",
    "SecondaryHandSlot",
    "RangedSlot",
    "TabardSlot",
    "BackSlot",
    "ShirtSlot",
    "NeckSlot",
    "Finger0Slot",
    "Finger1Slot",
    "Trinket0Slot",
    "Trinket1Slot",
    "AmmoSlot",
};

StaticPopupDialogs["AUTOEQUIP_SET_COMMENT"] = {
    text = AUTOEQUIP_HELP_SET_ADD_COMMENT,
    button1 = ACCEPT,
    button2 = CANCEL,
    hasEditBox = 1,
    maxLetters = 48,
    hasWideEditBox = 1,
    OnAccept = function(self)
        local editBox = getglobal(self:GetName() .. "WideEditBox");
        AutoEquip_e09155fd689c072df2a0030d6e069018(StaticPopupDialogs["AUTOEQUIP_SET_COMMENT"].setId, editBox:GetText());
    end,
    OnShow = function(self)
        local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(StaticPopupDialogs["AUTOEQUIP_SET_COMMENT"].setId);
        if (AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f and AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0]) then
            getglobal(self:GetName() .. "WideEditBox"):SetText(AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0]);
            getglobal(self:GetName() .. "WideEditBox"):HighlightText();
        end
    end,
    OnHide = function(self)
        getglobal(self:GetName() .. "WideEditBox"):SetText("");
    end,
    EditBoxOnEnterPressed = function(self)
        local editBox = getglobal(self:GetParent():GetName() .. "WideEditBox");
        AutoEquip_e09155fd689c072df2a0030d6e069018(StaticPopupDialogs["AUTOEQUIP_SET_COMMENT"].setId, editBox:GetText());
        self:GetParent():Hide();
    end,
    EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide();
    end,
    timeout = 0,
    exclusive = 1,
    whileDead = 1,
    hideOnEscape = 1
};

AutoEquip_Config = { curPos = 0 };
AutoEquip_352a74c60685e01427cbef1c647d5199 = nil;
local AutoEquip_a4ed2c6153d1a73ae298b67f0bcbabce = BLibrary("BInfo", "chat", AUTOEQUIP_NAME);
StaticPopupDialogs["SAVE_SET"] = {
    text = AUTOEQUIP_SAVE_INFO,
    button1 = TEXT(YES),
    button2 = TEXT(NO),
    OnAccept = function(self)
        AutoEquip_224246a2aec3ecad61ed8d03e82f9cb2(AutoEquip_Config.curPos)
    end,
    OnCancel = function(self) end,
    showAlert = 1,
    timeout = 0,
};

function AutoEquip_Toggle(switch)
    if (switch) then
        AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0 = 1;
        AutoEquip_429f6b75de5e0a7839bdca606b309723:Show();
    else
        AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0 = nil;
        AutoEquip_429f6b75de5e0a7839bdca606b309723:Hide();
    end
end

function AutoEquip_ToggleMode(mode)
    if (mode == "normal") then
        AutoEquip_352a74c60685e01427cbef1c647d5199 = nil;
        AutoEquipFrame:SetWidth(120);
        AutoEquipFrame:SetHeight(23);
        AutoEquipFrame:EnableMouse(false);
        AutoEquipFrame:SetHitRectInsets(0, 0, 119, 22);
        AutoEquipFrame:ClearAllPoints();
        AutoEquipFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 90, -1);
        AutoEquipFrame:SetFrameStrata("HIGH");
        AutoEquipFrame:SetMovable(false);
        AutoEquipFrame:SetClampedToScreen(false);
        AutoEquipFrame:SetParent(PlayerFrame);
        AutoEquipFrameBackground:SetAllPoints();
        AutoEquipFrameBackground:SetTexCoord(0, 0.46484375, 0, 0.171875);
        AutoEquipFrameBackground.normal_coords = { 0, 0.46484375, 0, 0.171875 };
        AutoEquipFrameBackground.hilight_coords = { 0, 0.46484375, 0, 0.171875 };
        AutoEquipFrameBackground:SetTexCoord(unpack(AutoEquipFrameBackground.normal_coords));
        AutoEquipSetButton5:Hide();
        AutoEquipSetButton6:Hide();
        AutoEquipSetButton7:Hide();
        AutoEquipSetButton8:Hide();
        local AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f;
        for AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f = 1, 8, 1 do
            local AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("AutoEquipSetButton" .. AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f);
            AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetNormalTexture():SetTexCoord(0 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.07421875 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.6484375, 0.78125);
            AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetPushedTexture():SetTexCoord(0 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.07421875 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.7890625, 0.921875);
        end
        AutoEquipSaveButton:SetPoint("TOPLEFT", AutoEquipFrame, "TOPLEFT", 6, -2);
        AutoEquipSetButton1:SetPoint("LEFT", AutoEquipSaveButton, "RIGHT", 3, 0);
        AutoEquipSetButton2:SetPoint("LEFT", AutoEquipSetButton1, "RIGHT", 3, 0);
        AutoEquipSetButton3:SetPoint("LEFT", AutoEquipSetButton2, "RIGHT", 3, 0);
        AutoEquipSetButton4:SetPoint("LEFT", AutoEquipSetButton3, "RIGHT", 3, 0);
        AutoEquipSetButton5:SetPoint("LEFT", AutoEquipSetButton4, "RIGHT", 3, 0);
        AutoEquipSetButton6:SetPoint("LEFT", AutoEquipSetButton5, "RIGHT", 3, 0);
        AutoEquipSetButton7:SetPoint("LEFT", AutoEquipSetButton6, "RIGHT", 3, 0);
        AutoEquipSetButton8:SetPoint("LEFT", AutoEquipSetButton7, "RIGHT", 3, 0);
        MoveIcons();
    elseif (mode == "advance") then
        AutoEquip_352a74c60685e01427cbef1c647d5199 = true;
        AutoEquipFrame:SetWidth(240);
        AutoEquipFrame:SetHeight(30);
        AutoEquipFrame:SetHitRectInsets(0, 204, 0, 0);
        AutoEquipFrame:EnableMouse(true);
        AutoEquipFrame:ClearAllPoints();
        AutoEquipFrame:SetPoint("CENTER", "UIParent", "CENTER", 0, 0);
        AutoEquipFrame:SetFrameStrata("MEDIUM");
        AutoEquipFrame:SetMovable(true);
        AutoEquipFrame:SetClampedToScreen(true);
        AutoEquipFrame:SetParent(UIParent);
        AutoEquipFrameBackground:SetAllPoints();
        AutoEquipFrameBackground.normal_coords = { 0, 0.93359375, 0.1796875, 0.40625 };
        AutoEquipFrameBackground.hilight_coords = { 0, 0.93359375, 0.4140625, 0.640625 };
        AutoEquipFrameBackground:SetTexCoord(unpack(AutoEquipFrameBackground.normal_coords));
        AutoEquipSetButton5:Show();
        AutoEquipSetButton6:Show();
        AutoEquipSetButton7:Show();
        AutoEquipSetButton8:Show();
        local AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f;
        for AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f = 1, 8, 1 do
            local AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("AutoEquipSetButton" .. AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f);
            AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetNormalTexture():SetTexCoord(0 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.07421875 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.6484375, 0.78125);
            AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:GetPushedTexture():SetTexCoord(0 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.07421875 + (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f - 1) * 0.07421875, 0.7890625, 0.921875);
        end
        AutoEquipSaveButton:SetPoint("TOPLEFT", AutoEquipFrame, "TOPLEFT", 37, -5);
        AutoEquipSetButton1:SetPoint("LEFT", AutoEquipSaveButton, "RIGHT", 4, 0);
        AutoEquipSetButton2:SetPoint("LEFT", AutoEquipSetButton1, "RIGHT", 3, 0);
        AutoEquipSetButton3:SetPoint("LEFT", AutoEquipSetButton2, "RIGHT", 3, 0);
        AutoEquipSetButton4:SetPoint("LEFT", AutoEquipSetButton3, "RIGHT", 3, 0);
        AutoEquipSetButton5:SetPoint("LEFT", AutoEquipSetButton4, "RIGHT", 3, 0);
        AutoEquipSetButton6:SetPoint("LEFT", AutoEquipSetButton5, "RIGHT", 3, 0);
        AutoEquipSetButton7:SetPoint("LEFT", AutoEquipSetButton6, "RIGHT", 3, 0);
        AutoEquipSetButton8:SetPoint("LEFT", AutoEquipSetButton7, "RIGHT", 3, 0);
        ResetIcons();
        RegisterForSaveFrame(AutoEquipFrame, "AutoEquipFrame");
    end
end

function AutoEquipFrame_OnMouseDown(self, button)
    if (AutoEquip_352a74c60685e01427cbef1c647d5199 and IsShiftKeyDown()) then
        self:StartMoving();
        self.moving = true;
    end
end

function AutoEquipFrame_OnMouseUp(self, button)
    if (self.moving) then
        elf:StopMovingOrSizing();
    end
end

function AutoEquipFrame_OnEnter(self)
    AutoEquipFrameBackground:SetTexCoord(unpack(AutoEquipFrameBackground.hilight_coords));
    BigFoot_ShowNewbieTooltip(AUTOEQUIP_NAME, AUTOEQUIP_MOVE_TOOLTIP);
end

function AutoEquipFrame_OnLeave(self)
    AutoEquipFrameBackground:SetTexCoord(unpack(AutoEquipFrameBackground.normal_coords));
    GameTooltip:Hide();
end

function AutoEquip_EnableAutoHide(switch)
    if (switch) then
        AutoEquip_642022feafc2fd091c1bc9b53b20e8d1 = true;
        if (AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0) then
            if (GetNumRaidMembers() ~= 0) then
                AutoEquip_429f6b75de5e0a7839bdca606b309723:Hide();
                AutoEquip_a4ed2c6153d1a73ae298b67f0bcbabce:Print(AUTOEQUIP_RAID_TIP);
                AutoEquip_123e1ec47f9120d9bfcd7384f302ca34 = true;
            else
                AutoEquip_429f6b75de5e0a7839bdca606b309723:Show();
            end
        end
    else
        AutoEquip_642022feafc2fd091c1bc9b53b20e8d1 = nil;
        if (AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0) then
            AutoEquip_429f6b75de5e0a7839bdca606b309723:Show();
        end
    end
end

function AutoEquip_ClearAll()
    AutoEquip_Config = { curPos = 0 };
    AutoEquipSetButton1:SetChecked(1);
    AutoEquipSetButton2:SetChecked(nil);
    AutoEquipSetButton3:SetChecked(nil);
    AutoEquipSetButton4:SetChecked(nil);
    AutoEquipSetButton5:SetChecked(nil);
    AutoEquipSetButton6:SetChecked(nil);
    AutoEquipSetButton7:SetChecked(nil);
    AutoEquipSetButton8:SetChecked(nil);
end

function AutoEquip_KeyBinding()
    BigFoot_ShowKeyBindingFrame("HEADER_AUTOEQUIP_TITLE");
end

function AutoEquip_PlayerFrame_OnEnter()
    if (AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0) then
        AutoEquipFrame:Show();
    end
end

function AutoEquip_PlayerFrame_OnUpdate()
    if (AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0 and AutoEquip_642022feafc2fd091c1bc9b53b20e8d1 and not AutoEquip_352a74c60685e01427cbef1c647d5199) then
        if (AutoEquipFrame:IsVisible() and PlayerFrameGroupIndicator:IsVisible()) then
            local AutoEquip_7242cf1b41caa7510cf530297a011730,
            AutoEquip_cf709faa4d1d5a25a70ffb7820ac3c77 = GetCursorPosition();
            if (AutoEquip_cf709faa4d1d5a25a70ffb7820ac3c77 < 600) then
                AutoEquipFrame:Hide();
            end
        end
    end
end

function AutoEquip_PlayerFrame_UpdateGroupIndicator()
    if (AutoEquip_6781199f633c5d9ede0aa8c0a5a346d0 and AutoEquip_642022feafc2fd091c1bc9b53b20e8d1 and not AutoEquip_352a74c60685e01427cbef1c647d5199) then
        if (GetNumRaidMembers() == 0) then AutoEquipFrame:Show();
            AutoEquip_123e1ec47f9120d9bfcd7384f302ca34 = nil;
        else
            AutoEquipFrame:Hide();
            if (not AutoEquip_123e1ec47f9120d9bfcd7384f302ca34) then
                AutoEquip_a4ed2c6153d1a73ae298b67f0bcbabce:Print(AUTOEQUIP_RAID_TIP);
                AutoEquip_123e1ec47f9120d9bfcd7384f302ca34 = true;
            end
        end
    end
end

function AutoEquipFrame_OnLoad(self)
    AutoEquip_429f6b75de5e0a7839bdca606b309723 = AutoEquipFrame;
    AutoEquip_f0925d64d9039b2c90d4450ba6a9caff = bfGetLocalVariable;
    hooksecurefunc("PlayerFrame_UpdateGroupIndicator", AutoEquip_PlayerFrame_UpdateGroupIndicator);
    PlayerFrame:HookScript("OnEnter", AutoEquip_PlayerFrame_OnEnter);
    PlayerFrame:HookScript("OnUpdate", AutoEquip_PlayerFrame_OnUpdate);
    self:RegisterEvent("ADDON_LOADED");
    SlashCmdList["AUTOEQUIP"] = AutoEquip_56e20ab2941248249885c3bb87e576e9;
    SLASH_AUTOEQUIP1 = "/autoequip";
    SLASH_AUTOEQUIP2 = "/huanzhuang";
end

function AutoEquip_e09155fd689c072df2a0030d6e069018(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a, AutoEquip_2ab6b80ce975622df316617d9396b951)
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0] = AutoEquip_2ab6b80ce975622df316617d9396b951;
end

function AutoEquip_224246a2aec3ecad61ed8d03e82f9cb2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee;
    AutoEquip_a1b6e98ef94e576e70dbfca2b9d4c3d4(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_b5afb1939b42d2489f5d7985e2839133) do
        local AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8d0febf2348ea712b2b375ae95601d5f;
        if (AutoEquip_2361bab8b48b1041ad740bb561b21aee ~= "AmmoSlot") then
            AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8d0febf2348ea712b2b375ae95601d5f = AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f("inventory", AutoEquip_2361bab8b48b1041ad740bb561b21aee);
            local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
            if (not AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f) then
                return;
            end
            if (AutoEquip_1f194f793e9150819d886c66d5bc23b5 and AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
                AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[__index] = AutoEquip_8d0febf2348ea712b2b375ae95601d5f;
            else
                AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[__index] = nil;
            end
        end
    end
end

function AutoEquip_edde6b9defd14002a775b763b5f565e3(AutoEquip_25ef7a3bda049822936280862e0c8ea5, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    AutoEquip_100c2eed9ba360ea03564a11d5da7553 = 1;
    AutoEquip_b1ac1a98679aac8c2bfcb266fdc56c47();
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    if (not AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f) then
        return;
    end
    AutoEquip_3fd0f061d25f37f0f592882597d8b998 = {};
    local AutoEquip_527502af2371c43a1fa4b5fe706597c8, AutoEquip_2e00ffac12aadb3a1fd865993ec505b9;
    local AutoEquip_255f5ba5882a6bd1828ccfe6d0227ab3 = 0;
    for AutoEquip_527502af2371c43a1fa4b5fe706597c8, AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 in pairs(AutoEquip_b5afb1939b42d2489f5d7985e2839133) do
        if (AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f("inventory", AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238) and not AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[AutoEquip_527502af2371c43a1fa4b5fe706597c8] and AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 ~= "AmmoSlot") then
            AutoEquip_255f5ba5882a6bd1828ccfe6d0227ab3 = AutoEquip_255f5ba5882a6bd1828ccfe6d0227ab3 + 1;
        end
    end

    local AutoEquip_230419c89d5b2e193a0b92083a923bf9, AutoEquip_2f9dc0fde336e15ab89235fb49cd4959 = AutoEquip_0d9e9d16dd825202c8f78ba876a30e23(AutoEquip_255f5ba5882a6bd1828ccfe6d0227ab3);
    local AutoEquip_2908370bfab1af375f286b2eec3e8bd4;
    local AutoEquip_3bf20bc44b2a1cacfbad9f4b4f7b7330 = 1;
    for AutoEquip_527502af2371c43a1fa4b5fe706597c8, AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 in pairs(AutoEquip_b5afb1939b42d2489f5d7985e2839133) do
        if (AutoEquip_527502af2371c43a1fa4b5fe706597c8 > 0 and AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 ~= "AmmoSlot") then
            local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[AutoEquip_527502af2371c43a1fa4b5fe706597c8];
            if (not AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 and AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f("inventory", AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238)) then
                AutoEquip_2908370bfab1af375f286b2eec3e8bd4 = AutoEquip_230419c89d5b2e193a0b92083a923bf9[AutoEquip_3bf20bc44b2a1cacfbad9f4b4f7b7330];
                AutoEquip_3bf20bc44b2a1cacfbad9f4b4f7b7330 = AutoEquip_3bf20bc44b2a1cacfbad9f4b4f7b7330 + 1; if (AutoEquip_2908370bfab1af375f286b2eec3e8bd4) then
                local AutoEquip_203ffefa472665c2fe3836fa7cc60354 = {};
                AutoEquip_203ffefa472665c2fe3836fa7cc60354.type = "inventory";
                AutoEquip_203ffefa472665c2fe3836fa7cc60354.invId = GetInventorySlotInfo(AutoEquip_b5afb1939b42d2489f5d7985e2839133[AutoEquip_527502af2371c43a1fa4b5fe706597c8]);
                local AutoEquip_385d097ec593f47fb99f6c591e66b9a7 = {};
                AutoEquip_385d097ec593f47fb99f6c591e66b9a7.type = "container";
                AutoEquip_385d097ec593f47fb99f6c591e66b9a7.bagId = AutoEquip_2908370bfab1af375f286b2eec3e8bd4.bagId;
                AutoEquip_385d097ec593f47fb99f6c591e66b9a7.slotId = AutoEquip_2908370bfab1af375f286b2eec3e8bd4.slotId;
                AutoEquip_d0f9f5a2fc2d009e96308aba22e9df02(AutoEquip_203ffefa472665c2fe3836fa7cc60354, AutoEquip_385d097ec593f47fb99f6c591e66b9a7);
            end
            end
        end
    end

    for AutoEquip_527502af2371c43a1fa4b5fe706597c8, AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 in pairs(AutoEquip_b5afb1939b42d2489f5d7985e2839133) do
        if (AutoEquip_527502af2371c43a1fa4b5fe706597c8 > 0 and AutoEquip_bf2bec0c1f7c2d7d0640368ce3613238 ~= "AmmoSlot") then
            local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[AutoEquip_527502af2371c43a1fa4b5fe706597c8];
            if (AutoEquip_2e00ffac12aadb3a1fd865993ec505b9) then
                local AutoEquip_203ffefa472665c2fe3836fa7cc60354 = AutoEquip_85a59cc55b1903d7d1c893ecf35d8027[AutoEquip_2e00ffac12aadb3a1fd865993ec505b9];
                if (AutoEquip_203ffefa472665c2fe3836fa7cc60354) then
                    AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d = GetInventorySlotInfo(AutoEquip_b5afb1939b42d2489f5d7985e2839133[AutoEquip_527502af2371c43a1fa4b5fe706597c8]);
                    local AutoEquip_385d097ec593f47fb99f6c591e66b9a7 = {};
                    AutoEquip_385d097ec593f47fb99f6c591e66b9a7.type = "inventory";
                    AutoEquip_385d097ec593f47fb99f6c591e66b9a7.invId = AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d;
                    if (AutoEquip_135c83841c100dd722d3f35c11de202f(AutoEquip_203ffefa472665c2fe3836fa7cc60354, AutoEquip_385d097ec593f47fb99f6c591e66b9a7, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)) then
                        AutoEquip_d0f9f5a2fc2d009e96308aba22e9df02(AutoEquip_203ffefa472665c2fe3836fa7cc60354, AutoEquip_385d097ec593f47fb99f6c591e66b9a7)
                    end
                end
            end
        end
    end

    if (AutoEquip_3fc7e5b833377a5efaea9af38afa1c79()) then
        BigFoot_DelayCall(AutoEquip_edde6b9defd14002a775b763b5f565e3, 0.3, AutoEquip_25ef7a3bda049822936280862e0c8ea5, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    else
        AutoEquip_fc5b6cb260d3bc3c82b0715554d575df(AutoEquip_25ef7a3bda049822936280862e0c8ea5, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    end
end

function AutoEquip_fc5b6cb260d3bc3c82b0715554d575df(AutoEquip_25ef7a3bda049822936280862e0c8ea5, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee;
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_3fd0f061d25f37f0f592882597d8b998) do
        AutoEquip_7ba74df1c3dae45facdad776a09dfa56(AutoEquip_2361bab8b48b1041ad740bb561b21aee.srcLoc);
        if (CursorHasItem()) then
            AutoEquip_7ba74df1c3dae45facdad776a09dfa56(AutoEquip_2361bab8b48b1041ad740bb561b21aee.dstLoc);
        else
            AutoEquip_7ba74df1c3dae45facdad776a09dfa56(AutoEquip_2361bab8b48b1041ad740bb561b21aee.srcLoc);
        end
    end

    if (AutoEquip_25ef7a3bda049822936280862e0c8ea5 == 1) then
        BigFoot_DelayCall(AutoEquip_edde6b9defd14002a775b763b5f565e3, 0.3, 2, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    else
        AutoEquip_100c2eed9ba360ea03564a11d5da7553 = nil;
        AutoEquip_Config.curPos = AutoEquip_ff1b4022732c44ba86eae6bf2228a25a;
    end
end

function AutoEquip_0d9e9d16dd825202c8f78ba876a30e23(AutoEquip_f8b5ec913f03ab325a37d4a55d172b3f)
    local AutoEquip_bec40b621a7ae1c2dd28fa893b2fe433 = { n = 0 };
    local AutoEquip_bd39ed6afe25f1f6855a764617f6f582 = { n = 0 };
    local AutoEquip_6cbe050ee8357246094c9506298e6466 = 1;
    local AutoEquip_96ec47e10d09a5d0491fe767488c7fab;
    local __index;
    local AutoEquip_e46c9df016d4d42a70331a12ead6ab3d;
    local AutoEquip_3f50417fb16be9b1078eb68d24fa9c26;
    for AutoEquip_96ec47e10d09a5d0491fe767488c7fab = 0, NUM_CONTAINER_FRAMES, 1 do
        local AutoEquip_cd22593b29eeb9f89a267571a4185875 = GetBagName(AutoEquip_96ec47e10d09a5d0491fe767488c7fab);
        local bag_obj = getglobal("CharacterBag" .. (AutoEquip_96ec47e10d09a5d0491fe767488c7fab - 1) .. "Slot");
        if (bag_obj) then
            local slots, bag_type = BigFoot_GetBagInfo(bag_obj:GetID());
            if (bag_type == AUTOEQUIP_QUIVER or bag_type == AUTOEQUIP_AMMO or bag_type == AUTOEQUIP_SOUL_BAG) then
                AutoEquip_e46c9df016d4d42a70331a12ead6ab3d = 1; else AutoEquip_e46c9df016d4d42a70331a12ead6ab3d = nil;
            end
        end
        if ((AutoEquip_e46c9df016d4d42a70331a12ead6ab3d and table.maxn(AutoEquip_bd39ed6afe25f1f6855a764617f6f582) < AutoEquip_6cbe050ee8357246094c9506298e6466) or (not AutoEquip_e46c9df016d4d42a70331a12ead6ab3d and table.maxn(AutoEquip_bec40b621a7ae1c2dd28fa893b2fe433) < AutoEquip_f8b5ec913f03ab325a37d4a55d172b3f)) then
            local AutoEquip_ac9c41ad14396e03f5c5d6bf1534eaed = GetContainerNumSlots(AutoEquip_96ec47e10d09a5d0491fe767488c7fab);
            local AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d;
            for AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d = 1, AutoEquip_ac9c41ad14396e03f5c5d6bf1534eaed, 1 do
                local AutoEquip_9248008bbb6d0ee7ce13f6ee45680051 = GetContainerItemInfo(AutoEquip_96ec47e10d09a5d0491fe767488c7fab, AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d);
                if (not AutoEquip_9248008bbb6d0ee7ce13f6ee45680051) then local AutoEquip_f5cb07751fccdf339be4192634943a73 = {};
                    AutoEquip_f5cb07751fccdf339be4192634943a73["bagId"] = AutoEquip_96ec47e10d09a5d0491fe767488c7fab;
                    AutoEquip_f5cb07751fccdf339be4192634943a73["slotId"] = AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d;
                    if (AutoEquip_e46c9df016d4d42a70331a12ead6ab3d) then
                        table.insert(AutoEquip_bd39ed6afe25f1f6855a764617f6f582, AutoEquip_f5cb07751fccdf339be4192634943a73);
                        AutoEquip_3f50417fb16be9b1078eb68d24fa9c26 = AutoEquip_6cbe050ee8357246094c9506298e6466;
                        __index = table.maxn(AutoEquip_bd39ed6afe25f1f6855a764617f6f582);
                    else
                        table.insert(AutoEquip_bec40b621a7ae1c2dd28fa893b2fe433, AutoEquip_f5cb07751fccdf339be4192634943a73);
                        AutoEquip_3f50417fb16be9b1078eb68d24fa9c26 = AutoEquip_f8b5ec913f03ab325a37d4a55d172b3f;
                        __index = table.maxn(AutoEquip_bec40b621a7ae1c2dd28fa893b2fe433);
                    end
                    __index = __index + 1;
                    if (__index > AutoEquip_3f50417fb16be9b1078eb68d24fa9c26) then
                        break;
                    end
                end
            end
        end
    end
    return AutoEquip_bec40b621a7ae1c2dd28fa893b2fe433, AutoEquip_bd39ed6afe25f1f6855a764617f6f582;
end

function AutoEquip_7ba74df1c3dae45facdad776a09dfa56(AutoEquip_88febe18691e9fc6560ed7e6e79776e0)
    if (AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type == "container") then
        PickupContainerItem(AutoEquip_88febe18691e9fc6560ed7e6e79776e0.bagId, AutoEquip_88febe18691e9fc6560ed7e6e79776e0.slotId);
    elseif (AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type == "inventory") then
        PickupInventoryItem(AutoEquip_88febe18691e9fc6560ed7e6e79776e0.invId);
    end
end

function AutoEquip_3fc7e5b833377a5efaea9af38afa1c79()
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee;
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_3fd0f061d25f37f0f592882597d8b998) do
        if (AutoEquip_31a87cb95c1889f6afd28689bf3528d0(AutoEquip_2361bab8b48b1041ad740bb561b21aee.srcLoc) or AutoEquip_31a87cb95c1889f6afd28689bf3528d0(AutoEquip_2361bab8b48b1041ad740bb561b21aee.dstLoc)) then
            return 1;
        end
    end
end

function AutoEquip_31a87cb95c1889f6afd28689bf3528d0(AutoEquip_88febe18691e9fc6560ed7e6e79776e0)
    if (AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type == "container") then
        local _, _, AutoEquip_f60965c86fccd81e8c42e13f66ae86cd, _, _ = GetContainerItemInfo(AutoEquip_88febe18691e9fc6560ed7e6e79776e0.bagId, AutoEquip_88febe18691e9fc6560ed7e6e79776e0.slotId);
        return AutoEquip_f60965c86fccd81e8c42e13f66ae86cd;
    elseif (AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type == "inventory") then
        return IsInventoryItemLocked(AutoEquip_88febe18691e9fc6560ed7e6e79776e0.invId);
    end
end

function AutoEquip_135c83841c100dd722d3f35c11de202f(AutoEquip_203ffefa472665c2fe3836fa7cc60354, AutoEquip_385d097ec593f47fb99f6c591e66b9a7, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    if (AutoEquip_203ffefa472665c2fe3836fa7cc60354.type == "container") then
        return 1;
    else
        if (AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_203ffefa472665c2fe3836fa7cc60354, AutoEquip_385d097ec593f47fb99f6c591e66b9a7)) then
            return;
        end
        local AutoEquip_f610e19b4bf606ae44b27a7f2e24a4d8 = AutoEquip_b05c0fb5f21ef7eb9877afcbe8ed391e(AutoEquip_203ffefa472665c2fe3836fa7cc60354.invId);
        local AutoEquip_11741070dbe004cee7718efd06f82b5d = AutoEquip_b05c0fb5f21ef7eb9877afcbe8ed391e(AutoEquip_385d097ec593f47fb99f6c591e66b9a7.invId);
        if (not AutoEquip_11741070dbe004cee7718efd06f82b5d) then
            return 1;
        end
        local AutoEquip_7096c49511b9f7e65703b80b9e82a1d4 = AutoEquip_cab9ce054da637c4c66fe1db894a0a7f(AutoEquip_f610e19b4bf606ae44b27a7f2e24a4d8, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
        local AutoEquip_ef36888ef92f29a7b3592c43069204bb = AutoEquip_cab9ce054da637c4c66fe1db894a0a7f(AutoEquip_11741070dbe004cee7718efd06f82b5d, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
        if (AutoEquip_7096c49511b9f7e65703b80b9e82a1d4 and AutoEquip_ef36888ef92f29a7b3592c43069204bb) then
            if (AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_ef36888ef92f29a7b3592c43069204bb, AutoEquip_203ffefa472665c2fe3836fa7cc60354) and AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_7096c49511b9f7e65703b80b9e82a1d4, AutoEquip_385d097ec593f47fb99f6c591e66b9a7)) then
                return 1;
            end
        end
    end
end

function AutoEquip_63cd525a6b04d13ea9a1a84f93fc6a43(AutoEquip_36a09181383e710c844c635e5b3405b4)
    local AutoEquip_15ad1e501e228eb80be1cc7800ab967d = GetInventoryItemLink("player", AutoEquip_36a09181383e710c844c635e5b3405b4);
    local AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a = AutoEquip_7276a1821e672edd414589c3ac9e20c8(AutoEquip_15ad1e501e228eb80be1cc7800ab967d);
    if (AutoEquip_1f194f793e9150819d886c66d5bc23b5 and AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a) then
        return AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a;
    end
end

function AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_1ce44e010124e0f251f5a20b049cfabc, AutoEquip_9ae9cd053b224774d9b4ef91d986f93a)
    return (AutoEquip_1ce44e010124e0f251f5a20b049cfabc.type == AutoEquip_9ae9cd053b224774d9b4ef91d986f93a.type and AutoEquip_1ce44e010124e0f251f5a20b049cfabc.invId == AutoEquip_9ae9cd053b224774d9b4ef91d986f93a.invId and AutoEquip_1ce44e010124e0f251f5a20b049cfabc.bagId == AutoEquip_9ae9cd053b224774d9b4ef91d986f93a.bagId and AutoEquip_1ce44e010124e0f251f5a20b049cfabc.slotId == AutoEquip_9ae9cd053b224774d9b4ef91d986f93a.bagId)
end

function AutoEquip_cab9ce054da637c4c66fe1db894a0a7f(AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a, AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    if (not AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f) then
        return;
    end
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f) do
        if (AutoEquip_2361bab8b48b1041ad740bb561b21aee == AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a) then
            local AutoEquip_88febe18691e9fc6560ed7e6e79776e0 = {};
            AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type = "inventory";
            AutoEquip_88febe18691e9fc6560ed7e6e79776e0.invId = GetInventorySlotInfo(AutoEquip_b5afb1939b42d2489f5d7985e2839133[__index]);
            return AutoEquip_88febe18691e9fc6560ed7e6e79776e0;
        end
    end
end

function AutoEquip_b05c0fb5f21ef7eb9877afcbe8ed391e(AutoEquip_36a09181383e710c844c635e5b3405b4)
    local AutoEquip_15ad1e501e228eb80be1cc7800ab967d = GetInventoryItemLink("player", AutoEquip_36a09181383e710c844c635e5b3405b4);
    local AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = AutoEquip_7276a1821e672edd414589c3ac9e20c8(AutoEquip_15ad1e501e228eb80be1cc7800ab967d);
    return AutoEquip_2e00ffac12aadb3a1fd865993ec505b9
end

function AutoEquip_d0f9f5a2fc2d009e96308aba22e9df02(AutoEquip_66daa9d1f175dc985eb681c180dac0dc, AutoEquip_55ab653e7fa6ed4f47470c0948d845fa)
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee;
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_3fd0f061d25f37f0f592882597d8b998) do
        if (AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_2361bab8b48b1041ad740bb561b21aee.srcLoc, AutoEquip_66daa9d1f175dc985eb681c180dac0dc) and AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_2361bab8b48b1041ad740bb561b21aee.dstLoc, AutoEquip_55ab653e7fa6ed4f47470c0948d845fa)) then
            return;
        end
        if (AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_2361bab8b48b1041ad740bb561b21aee.srcLoc, AutoEquip_55ab653e7fa6ed4f47470c0948d845fa) and AutoEquip_787d07908b7db9bff32d2b339f26f961(AutoEquip_2361bab8b48b1041ad740bb561b21aee.dstLoc, AutoEquip_66daa9d1f175dc985eb681c180dac0dc)) then
            return;
        end
    end
    local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = {};
    AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.srcLoc = AutoEquip_66daa9d1f175dc985eb681c180dac0dc;
    AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.dstLoc = AutoEquip_55ab653e7fa6ed4f47470c0948d845fa;
    table.insert(AutoEquip_3fd0f061d25f37f0f592882597d8b998, AutoEquip_2e00ffac12aadb3a1fd865993ec505b9);
end

function AutoEquip_fb9f9588e44da19cc2423fd7f0fb923c(AutoEquip_88febe18691e9fc6560ed7e6e79776e0)
    local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9, AutoEquip_88febe18691e9fc6560ed7e6e79776e0;
    for AutoEquip_2e00ffac12aadb3a1fd865993ec505b9, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_85a59cc55b1903d7d1c893ecf35d8027) do
        if (AutoEquip_2361bab8b48b1041ad740bb561b21aee.type == AutoEquip_88febe18691e9fc6560ed7e6e79776e0.type and AutoEquip_2361bab8b48b1041ad740bb561b21aee.bagId == AutoEquip_88febe18691e9fc6560ed7e6e79776e0.bagId and AutoEquip_2361bab8b48b1041ad740bb561b21aee.slotId == AutoEquip_88febe18691e9fc6560ed7e6e79776e0.slotId and AutoEquip_2361bab8b48b1041ad740bb561b21aee.invId == AutoEquip_88febe18691e9fc6560ed7e6e79776e0.invId) then
            return AutoEquip_2e00ffac12aadb3a1fd865993ec505b9;
        end
    end
end

function AutoEquip_b1ac1a98679aac8c2bfcb266fdc56c47()
    AutoEquip_85a59cc55b1903d7d1c893ecf35d8027 = {};
    local AutoEquip_96ec47e10d09a5d0491fe767488c7fab;
    for AutoEquip_96ec47e10d09a5d0491fe767488c7fab = 0, NUM_CONTAINER_FRAMES, 1 do
        local AutoEquip_ac9c41ad14396e03f5c5d6bf1534eaed = GetContainerNumSlots(AutoEquip_96ec47e10d09a5d0491fe767488c7fab);
        local AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d;
        for AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d = 1, AutoEquip_ac9c41ad14396e03f5c5d6bf1534eaed, 1 do
            local AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a = AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f("container", AutoEquip_96ec47e10d09a5d0491fe767488c7fab, AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d);
            if (AutoEquip_1f194f793e9150819d886c66d5bc23b5 and AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a) then
                local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = {};
                AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.type = "container";
                AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.bagId = AutoEquip_96ec47e10d09a5d0491fe767488c7fab;
                AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.slotId = AutoEquip_5690c3a7efc9d7d57a9a8567658fcf5d;
                AutoEquip_85a59cc55b1903d7d1c893ecf35d8027[AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a] = AutoEquip_2e00ffac12aadb3a1fd865993ec505b9;
            end
        end
    end
    local __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee;
    for __index, AutoEquip_2361bab8b48b1041ad740bb561b21aee in pairs(AutoEquip_b5afb1939b42d2489f5d7985e2839133) do
        local AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a = AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f("inventory", AutoEquip_2361bab8b48b1041ad740bb561b21aee);
        if (AutoEquip_1f194f793e9150819d886c66d5bc23b5 and AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a) then
            local AutoEquip_2e00ffac12aadb3a1fd865993ec505b9 = {}; AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.type = "inventory";
            AutoEquip_2e00ffac12aadb3a1fd865993ec505b9.invId = GetInventorySlotInfo(AutoEquip_2361bab8b48b1041ad740bb561b21aee);
            AutoEquip_85a59cc55b1903d7d1c893ecf35d8027[AutoEquip_8118ba3a66c695c84b8bcbf674ea6a7a] = AutoEquip_2e00ffac12aadb3a1fd865993ec505b9;
        end
    end
end

function AutoEquip_888f0923e85f7bb52d4f8d5a1d0a4594()
    local AutoEquip_8983c60d66c8593ec7165ea9dbedb584 = UnitName("player");
    if (not AutoEquip_8983c60d66c8593ec7165ea9dbedb584) then
        return;
    end
    if (not AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584]) then
        return nil;
    end
    return 1;
end

function AutoEquip_a1b6e98ef94e576e70dbfca2b9d4c3d4(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    local AutoEquip_8983c60d66c8593ec7165ea9dbedb584 = UnitName("player");
    if (not AutoEquip_8983c60d66c8593ec7165ea9dbedb584) then
        return;
    end
    if (not AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584]) then
        AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584] = {};
    end
    local AutoEquip_8d0febf2348ea712b2b375ae95601d5f = tonumber(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    if (not AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
        return;
    end
    AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584][AutoEquip_8d0febf2348ea712b2b375ae95601d5f] = {};
end

function AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a)
    local AutoEquip_8983c60d66c8593ec7165ea9dbedb584 = UnitName("player");
    if (not AutoEquip_8983c60d66c8593ec7165ea9dbedb584) then
        return;
    end
    if (not AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584]) then
        AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584] = {};
    end
    local AutoEquip_8d0febf2348ea712b2b375ae95601d5f = tonumber(AutoEquip_ff1b4022732c44ba86eae6bf2228a25a);
    if (not AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
        return;
    end
    if (not AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584][AutoEquip_8d0febf2348ea712b2b375ae95601d5f]) then
        AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584][AutoEquip_8d0febf2348ea712b2b375ae95601d5f] = {};
    end
    return AutoEquip_Config[AutoEquip_8983c60d66c8593ec7165ea9dbedb584][AutoEquip_8d0febf2348ea712b2b375ae95601d5f];
end

function AutoEquipSetButton_OnClick(self, __index, AutoEquip_965069e21146643edfb189f810a01269, AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5)
    local AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f;
    for AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f = 1, 8, 1 do
        if (AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f ~= __index) then
            getglobal("AutoEquipSetButton" .. AutoEquip_e914904fab9d05d3f54d52bfc31a0f3f):SetChecked(nil);
        end
    end
    getglobal("AutoEquipSetButton" .. __index):SetChecked(1);
    if (AutoEquip_100c2eed9ba360ea03564a11d5da7553 or CursorHasItem()) then
        return;
    end
    if (AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 and AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 == "RightButton" and IsShiftKeyDown()) then
        local AutoEquip_e6955c64cf39bdb23dc86de1a9ec2117 = string.format(AUTOEQUIP_HELP_SET_ADD_COMMENT, __index); StaticPopupDialogs["AUTOEQUIP_SET_COMMENT"].setId = __index;
        StaticPopup_Show("AUTOEQUIP_SET_COMMENT");
    else
        if (__index ~= AutoEquip_Config.curPos) then
            if (AutoEquip_888f0923e85f7bb52d4f8d5a1d0a4594() and (not AutoEquip_965069e21146643edfb189f810a01269 or not IsShiftKeyDown())) then
                AutoEquip_edde6b9defd14002a775b763b5f565e3(1, __index);
            end AutoEquip_Config.curPos = __index; PlaySound("igChatEmoteButton");
        end
    end
end

function AutoEquipSaveButton_OnClick(self, button)
    StaticPopup_Show("SAVE_SET");
end

function AutoEquipFrame_OnEvent(self, AutoEquip_d0708241b607c9a9dd1953c812fadfb7, ...)
    local AutoEquip_1652701c940a7445a6e43b954d36ec9b = ...;
    if (AutoEquip_d0708241b607c9a9dd1953c812fadfb7 == "ADDON_LOADED" and AutoEquip_1652701c940a7445a6e43b954d36ec9b == "AutoEquip") then
        if (AutoEquip_Config.curPos == nil) then
            AutoEquip_Config.curPos = 1;
            AutoEquip_224246a2aec3ecad61ed8d03e82f9cb2(AutoEquip_Config.curPos);
            AutoEquipSetButton1:SetChecked(1);
        else
            local AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5 = getglobal("AutoEquipSetButton" .. AutoEquip_Config.curPos);
            if (AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5) then
                AutoEquip_99f3cf2c6f1fdfadb0fd4ab6e0843bf5:SetChecked(1);
            end
        end
    end
end

function AutoEquip_SwitchToNext()
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_Config.curPos + 1;
    if (AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f > 8) then
        AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = 1;
    end
    AutoEquipSetButton_OnClick(nil, AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f);
end

function AutoEquip_SwitchToPrev()
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_Config.curPos - 1;
    if (AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f < 1) then
        AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = 8;
    end
    AutoEquipSetButton_OnClick(nil, AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f);
end

function MoveIcons()
    PlayerLeaderIcon:ClearAllPoints();
    PlayerLeaderIcon:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 55, -12);
    PlayerMasterIcon:ClearAllPoints();
    PlayerMasterIcon:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 80, -12);
end

function ResetIcons()
    PlayerLeaderIcon:ClearAllPoints();
    PlayerLeaderIcon:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 44, -10);
    PlayerMasterIcon:ClearAllPoints();
    PlayerMasterIcon:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 80, -10);
end

function AutoEquipSaveButton_OnEnter(self)
    GameTooltip_AddNewbieTip(self, AUTOEQUIP_HELP_SAVE_BTN_TITLE, 1.0, 1.0, 1.0, AUTOEQUIP_HELP_SAVE_BTN_DESC, 1);
end

function AutoEquipSetButton_OnEnter(self, AutoEquip_8d0febf2348ea712b2b375ae95601d5f)
    local AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f = AutoEquip_4028c7da12ff52455abb865b298ff7e2(AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
    if (AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f and AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0] and type(AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0]) == "string") then
        BigFoot_ShowNewbieTooltip(AUTOEQUIP_HELP_SET_BTN_TITLE, AUTOEQUIP_HELP_SET_BTN_DESC, "|cff00e000" .. AutoEquip_8f81cccca434aa7ae8e147d0fcfb685f[0] .. "|r", AUTOEQUIP_HELP_SET_BTN_COMMENT1, AUTOEQUIP_HELP_SET_BTN_COMMENT2);
    else
        BigFoot_ShowNewbieTooltip(AUTOEQUIP_HELP_SET_BTN_TITLE, AUTOEQUIP_HELP_SET_BTN_DESC, AUTOEQUIP_HELP_SET_BTN_COMMENT1, AUTOEQUIP_HELP_SET_BTN_COMMENT2);
    end
end

function AutoEquip_7276a1821e672edd414589c3ac9e20c8(AutoEquip_e498578b78aa0db9c45f30f87d63debc)
    local AutoEquip_8d0febf2348ea712b2b375ae95601d5f; local AutoEquip_1f194f793e9150819d886c66d5bc23b5;
    if (not AutoEquip_e498578b78aa0db9c45f30f87d63debc or type(AutoEquip_e498578b78aa0db9c45f30f87d63debc) ~= "string") then
        return
    end
    local AutoEquip_6e4d0db7491d6883f86de390d20dbe5b, AutoEquip_a2f3972c23a0aa3bd7fb0e9823d918f2;
    AutoEquip_6e4d0db7491d6883f86de390d20dbe5b, AutoEquip_a2f3972c23a0aa3bd7fb0e9823d918f2, AutoEquip_8d0febf2348ea712b2b375ae95601d5f, AutoEquip_1f194f793e9150819d886c66d5bc23b5 = string.find(AutoEquip_e498578b78aa0db9c45f30f87d63debc, "|H(item:.+)|h%[([^]]+)%]|h|r$");
    if (AutoEquip_8d0febf2348ea712b2b375ae95601d5f and AutoEquip_1f194f793e9150819d886c66d5bc23b5) then
        return AutoEquip_1f194f793e9150819d886c66d5bc23b5, AutoEquip_8d0febf2348ea712b2b375ae95601d5f;
    end
end

function AutoEquip_b593a79c2f4e1478fdeb3354c12fd88f(AutoEquip_6d5e7d83d8358745ae4dcf61d16bd1f3, ...)
    if (AutoEquip_6d5e7d83d8358745ae4dcf61d16bd1f3 == "container") then
        local arg = { ... };
        local AutoEquip_15ad1e501e228eb80be1cc7800ab967d = GetContainerItemLink(arg[1], arg[2]);
        return AutoEquip_7276a1821e672edd414589c3ac9e20c8(AutoEquip_15ad1e501e228eb80be1cc7800ab967d);
    elseif (AutoEquip_6d5e7d83d8358745ae4dcf61d16bd1f3 == "inventory") then
        local arg = { ... };
        local AutoEquip_8d0febf2348ea712b2b375ae95601d5f = GetInventorySlotInfo(arg[1]);
        local AutoEquip_15ad1e501e228eb80be1cc7800ab967d = GetInventoryItemLink("player", AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
        return AutoEquip_7276a1821e672edd414589c3ac9e20c8(AutoEquip_15ad1e501e228eb80be1cc7800ab967d)
    end
end

function AutoEquip_7adc10af56f69fc328618e0a6a4aaa9b()
    BigFoot_Report("info", AUTOEQUIP_USAGE_LINE1);
    BigFoot_Report("info", AUTOEQUIP_USAGE_LINE2);
    BigFoot_Report("info", AUTOEQUIP_USAGE_LINE3);
end

function AutoEquip_56e20ab2941248249885c3bb87e576e9(AutoEquip_7739b813d90aed43ab9d0eb84ec1c1ae)
    if (not AutoEquip_7739b813d90aed43ab9d0eb84ec1c1ae or AutoEquip_7739b813d90aed43ab9d0eb84ec1c1ae == "") then
        AutoEquip_7adc10af56f69fc328618e0a6a4aaa9b();
        return;
    end
    local AutoEquip_93a5a1bb3574aa524691d5b46e5deff9, AutoEquip_8d0febf2348ea712b2b375ae95601d5f = unpack(bsplit(AutoEquip_7739b813d90aed43ab9d0eb84ec1c1ae, "%s"));
    if (AutoEquip_93a5a1bb3574aa524691d5b46e5deff9) then
        if (AutoEquip_93a5a1bb3574aa524691d5b46e5deff9 == "set" and AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
            local AutoEquip_8d0febf2348ea712b2b375ae95601d5f = tonumber(AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
            if (AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
                if (AutoEquip_8d0febf2348ea712b2b375ae95601d5f >= 1 and AutoEquip_8d0febf2348ea712b2b375ae95601d5f <= 8) then
                    AutoEquipSetButton_OnClick(nil, AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
                    local str = string.format(AUTOEQUIP_TEXT_SWITCH, AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
                    BigFoot_Report("info", str);
                else
                    BigFoot_Report("info", AUTOEQUIP_TEXT_OUT_OF_NUMBER);
                end
            else
                BigFoot_Report("info", AUTOEQUIP_TEXT_INVALID_PARAMETER);
            end
        elseif (AutoEquip_93a5a1bb3574aa524691d5b46e5deff9 == "save" and AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
            local AutoEquip_8d0febf2348ea712b2b375ae95601d5f = tonumber(AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
            if (AutoEquip_8d0febf2348ea712b2b375ae95601d5f) then
                if (AutoEquip_8d0febf2348ea712b2b375ae95601d5f >= 1 and AutoEquip_8d0febf2348ea712b2b375ae95601d5f <= 8) then
                    AutoEquip_224246a2aec3ecad61ed8d03e82f9cb2(AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
                    PlaySound("igChatEmoteButton");
                    local str = string.format(AUTOEQUIP_TEXT_SAVED, AutoEquip_8d0febf2348ea712b2b375ae95601d5f);
                    BigFoot_Report("info", str);
                else
                    BigFoot_Report("info", AUTOEQUIP_TEXT_OUT_OF_NUMBER);
                end
            else
                BigFoot_Report("info", AUTOEQUIP_TEXT_INVALID_PARAMETER);
            end
        elseif (AutoEquip_93a5a1bb3574aa524691d5b46e5deff9 == "clear") then
            AutoEquip_Config = { curPos = 0 };
            AutoEquipSetButton1:SetChecked(1);
            AutoEquipSetButton2:SetChecked(nil);
            AutoEquipSetButton3:SetChecked(nil);
            AutoEquipSetButton4:SetChecked(nil);
            AutoEquipSetButton5:SetChecked(nil);
            AutoEquipSetButton6:SetChecked(nil);
            AutoEquipSetButton7:SetChecked(nil);
            AutoEquipSetButton8:SetChecked(nil);
            BigFoot_Report("info", AUTOEQUIP_TEXT_SETTING_CLEARED);
        else
            AutoEquip_7adc10af56f69fc328618e0a6a4aaa9b();
        end
    else
        AutoEquip_7adc10af56f69fc328618e0a6a4aaa9b();
    end
end
