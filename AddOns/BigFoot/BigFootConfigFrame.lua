--[[
        BigFootConfigFrame.lua

        设置界面

        版本：1.12
        更新时间：2004年10月19日
        更新作者：Andy Xiao
]] --

__BIGFOOT_CHECKBUTTON_NUM = 20;
__BIGFOOT_SEPARATOR_NUM = 20;
__BIGFOOT_BUTTON_NUM = 10;
__BIGFOOT_EDITBOX_NUM = 10;

__BIGFOOT_TAB_NUMBER = 5;

__BigFoot_TabTable = {};

__BigFoot_TempSetting = {};

__BigFootConfigFrame_Page_CurSel = nil;

function bfConfigFrame_OnShow(self)
    bfConfigFrameTitle:SetText(BF_HEADER);

    __bfConfigFrame_InitTab();
    __bfConfigFrame_RefreshTab();

    __bfConfigFrame_ShowPage(__BigFoot_TabTable[1]);
    __BigFootConfigFrame_Page_CurSel = 1;

    PanelTemplates_SetTab(self, 1);
end

function __bfConfigFrame_Refresh()
    __bfConfigFrame_ShowPage(__BigFoot_TabTable[__BigFootConfigFrame_Page_CurSel]);
    PanelTemplates_SetTab(bfConfigFrame, __BigFootConfigFrame_Page_CurSel);
end

function bfConfigFrame_OnLoad(self)
    -- Tab Handling code
    PanelTemplates_SetNumTabs(self, 5);

    --add this frame in UIParent
    UIPanelWindows["bfConfigFrame"] = { area = "center", pushable = 0 };

    self:RegisterEvent("VARIABLES_LOADED");
    self:RegisterEvent("QUEST_DETAIL");
end

function __bfConfigFrame_Save()
    __bfConfigFrame_SavePageSetting();

    for __mod, __modvalue in pairs(__BigFoot_TempSetting) do
        for __variable, __values in pairs(__modvalue) do
            BigFoot_SetModVariable(__mod, __variable, __values.value);

            if (type(__values.callback) == "function") then
                __values.callback(__values.value);
            end
        end
    end

    __BigFoot_TempSetting = {};
end

function __bfConfigFrame_SavePageSetting()
    for __i = 1, __BIGFOOT_CHECKBUTTON_NUM, 1 do
        local __button = getglobal("bfConfigFrameCheckButton" .. __i);
        if (__button:IsVisible()) then
            local __variable = getglobal(__button.variable);
            if (__button:GetChecked()) then
                __variable = 1;
            else
                __variable = 0;
            end

            if (__BigFoot_TempSetting[__button.mod] == nil) then
                __BigFoot_TempSetting[__button.mod] = {};
            end

            local __value = {};
            __value.value = __variable;
            __value.callback = __button.callback;

            __BigFoot_TempSetting[__button.mod][__button.variable] = __value;
        end
    end

    for __i = 1, __BIGFOOT_EDITBOX_NUM, 1 do
        local __editbox = getglobal("bfConfigFrameEditBox" .. __i);
        if (__editbox:IsVisible()) then
            local __variable = getglobal(__editbox.variable);
            __variable = __editbox:GetText();

            if (__BigFoot_TempSetting[__editbox.mod] == nil) then
                __BigFoot_TempSetting[__editbox.mod] = {};
            end

            local __value = {};
            __value.value = __variable;
            __value.callback = __editbox.callback;

            __BigFoot_TempSetting[__editbox.mod][__editbox.variable] = __value;
        end
    end
end

function __bfConfigFrame_Cancel()
    __BigFoot_TempSetting = {};
end

function bdConfigFrameDefaults_OnClick()
    __bfConfigFrame_LoadDefaultTempConfig();
    __bfConfigFrame_Refresh();
end

function bfConfigFrame_OnHide()
    PlaySound("gsTitleOptionExit");
    __bfConfigFrame_Cancel();
end

function bfConfigFrameOkay_OnClick()
    PlaySound("gsTitleOptionOK");
    __bfConfigFrame_Save();
    HideUIPanel(bfConfigFrame);
end

function __bfConfigFrame_LoadDefaultTempConfig(__mod)
    -- 如果没有指定mod，代表清空所有设置
    if (not __mod) then
        __BigFoot_TempSetting = {};
    else
        __BigFoot_TempSetting[__mod] = {};
    end

    for __i, __element in pairs(BigFoot_UiConfig) do
        -- 如果没有指定mod，并且没有初始化过，需要先对这个mod进行初始化
        if (not __mod and not __BigFoot_TempSetting[__element.mod]) then
            __BigFoot_TempSetting[__element.mod] = {};
        end

        -- 如果该mod与指定的mod相同或者根本没有指定mod，就需要赋值
        if ((__mod == __element.mod or not __mod) and __element.variable) then
            -- 设置成缺省值
            local __value = {};
            __value.value = __element.default;
            __value.callback = __element.callback;
            __BigFoot_TempSetting[__element.mod][__element.variable] = __value;
        end
    end
end

function bfConfigFrame_OnEvent(__event)
    if (__event == "VARIABLES_LOADED") then
        QUEST_FADING_ENABLE = nil;
    elseif (__event == "QUEST_DETAIL") then
        QUEST_FADING_ENABLE = nil;
    end
end

function BigFootConfigFrameTab_OnClick(self, __index)
    local __iStartPos = 1;
    __bfConfigFrame_SavePageSetting();
    __bfConfigFrame_ShowPage(__BigFoot_TabTable[__iStartPos + __index - 1]);
    __BigFootConfigFrame_Page_CurSel = __iStartPos + __index - 1;
    bfConfigFrameScrollFrameScrollBar:SetValue(0);
    PlaySound("igCharacterInfoTab");
end

function __BigFoot_GetTempVariable(__mod, __var)
    if (__BigFoot_TempSetting[__mod]) then
        if (__BigFoot_TempSetting[__mod][__var]) then
            return __BigFoot_TempSetting[__mod][__var].value;
        end
    end
end

function __bfConfigFrame_ShowPage(__page)
    local __checkbuttonIndex = 1;
    local __titleIndex = 1;
    local __buttonIndex = 1;
    local __editboxIndex = 1;

    local __lastElement = nil;
    local __extraOffsetY = 0;
    local __extraOffsetX = 0;

    for __i, __element in pairs(BigFoot_UiConfig) do
        __checkbutton = getglobal("bfConfigFrameCheckButton" .. __checkbuttonIndex);
        __title = getglobal("bfConfigFrameTitle" .. __titleIndex);
        __button = getglobal("bfConfigFrameButton" .. __buttonIndex);
        __editbox = getglobal("bfConfigFrameEditBox" .. __editboxIndex);

        if (__element.type == "CHECKBOX" and __element.page == __page) then
            if (__checkbutton) then
                local __checkbuttonText = getglobal(__checkbutton:GetName() .. "Text");

                -- 首先尝试从缓存中取出来
                local __variable = __BigFoot_GetTempVariable(__element.mod, __element.variable);

                -- 如果在临时缓存中没有发现设置，那么直接从设置中取
                if (__variable == nil) then
                    __variable = BigFoot_GetModVariable(__element.mod, __element.variable);
                end

                __checkbuttonText:SetText(__element.text);

                -- 如果存在过滤器，需要先执行过滤器
                if (__element.filter) then
                    __variable = __element.filter(__variable);
                end
                __checkbutton:SetChecked(__variable);

                if (__lastElement == nil) then
                    __checkbutton:SetPoint("TOPLEFT", "bfConfigFrameDummy", "TOPLEFT", 0, 0);
                else
                    __checkbutton:SetPoint("TOPLEFT", __lastElement, "BOTTOMLEFT", 0 - __extraOffsetX, 2 - __extraOffsetY);
                end
                __checkbutton:Show();

                __checkbutton.mod = __element.mod;
                __checkbutton.variable = __element.variable;
                __checkbutton.callback = __element.callback;
                __checkbuttonIndex = __checkbuttonIndex + 1;

                __lastElement = __checkbutton:GetName();
                __extraOffsetX = 0;
                __extraOffsetY = 0;
            end
        elseif (__element.type == "EDITBOX" and __element.page == __page) then
            if (__editbox) then
                local __editboxText = getglobal(__editbox:GetName() .. "Title");

                -- 首先尝试从缓存中取出来
                local __variable = __BigFoot_GetTempVariable(__element.mod, __element.variable);

                -- 如果在临时缓存中没有发现设置，那么直接从设置中取
                if (__variable == nil) then
                    __variable = BigFoot_GetModVariable(__element.mod, __element.variable);
                end

                __editboxText:SetText(__element.text);

                -- 如果存在过滤器，需要先执行过滤器
                if (__element.filter) then
                    __variable = __element.filter(__variable);
                end
                __editbox:SetText(__variable);

                if (__lastElement == nil) then
                    __editbox:SetPoint("TOPLEFT", "bfConfigFrameDummy", "TOPLEFT", 60, 0);
                else
                    __editbox:SetPoint("TOPLEFT", __lastElement, "BOTTOMLEFT", 125 - __extraOffsetX, 2 - __extraOffsetY);
                end
                __editbox:Show();

                __editbox.mod = __element.mod;
                __editbox.variable = __element.variable;
                __editbox.callback = __element.callback;
                __editboxIndex = __editboxIndex + 1;

                __lastElement = __editbox:GetName();
                __extraOffsetX = 125;
                __extraOffsetY = 0;
            end
        elseif (__element.type == "TITLE" and __element.page == __page) then
            if (__title) then
                local __titleText = getglobal(__title:GetName() .. "Text");

                __titleText:SetText(__element.text);
                if (__lastElement == nil) then
                    __title:SetPoint("TOPLEFT", "bfConfigFrameDummy", "TOPLEFT", 0, 0);
                else
                    __title:SetPoint("TOPLEFT", __lastElement, "BOTTOMLEFT", 0 - __extraOffsetX, 2 - __extraOffsetY);
                end
                __title:Show();

                __titleIndex = __titleIndex + 1;

                __lastElement = __title:GetName();
                __extraOffsetX = 0;
                __extraOffsetY = 0;
            end
        elseif (__element.type == "BUTTON" and __element.page == __page) then
            if (__button) then
                __button:SetText(__element.text);

                if (__lastElement == nil) then
                    __button:SetPoint("TOPLEFT", "bfConfigFrameDummy", "TOPLEFT", 0, 0);
                else
                    __button:SetPoint("TOPLEFT", __lastElement, "BOTTOMLEFT", 0 - __extraOffsetX, 2 - __extraOffsetY);
                end
                __button:Show();

                __button.mod = __element.mod;
                __button.callback = __element.callback;
                __buttonIndex = __buttonIndex + 1;

                __lastElement = __button:GetName();
                __extraOffsetX = 0;
                __extraOffsetY = 10;
            end
        end
    end

    local __hideCheckbuttonIndex, __hideTitleIndex, __hideButtonIndex, __hideEditBoxIndex;

    for __hideCheckbuttonIndex = __checkbuttonIndex, __BIGFOOT_CHECKBUTTON_NUM, 1 do
        __checkbutton = getglobal("bfConfigFrameCheckButton" .. __hideCheckbuttonIndex);
        __checkbutton:Hide();
    end

    for __hideTitleIndex = __titleIndex, __BIGFOOT_SEPARATOR_NUM, 1 do
        __title = getglobal("bfConfigFrameTitle" .. __hideTitleIndex);
        __title:Hide();
    end

    for __hideButtonIndex = __buttonIndex, __BIGFOOT_BUTTON_NUM, 1 do
        __button = getglobal("bfConfigFrameButton" .. __hideButtonIndex);
        __button:Hide();
    end

    for __hideEditBoxIndex = __editboxIndex, __BIGFOOT_EDITBOX_NUM, 1 do
        __editbox = getglobal("bfConfigFrameEditBox" .. __hideEditBoxIndex);
        __editbox:Hide();
    end
end

function __bfConfigFrame_RefreshTab()
    local __iStartPos = 1;

    for __i = 1, __BIGFOOT_TAB_NUMBER, 1 do
        local __index = __iStartPos + __i - 1;
        local __tab = getglobal("bfConfigFrameTab" .. __i);
        if (__BigFoot_TabTable[__index]) then
            local __text = bfGetLocalVariable(__BigFoot_TabTable[__index]);
            if (__text) then
                __tab:SetText(__text);
            else
                __tab:SetText(__BigFoot_TabTable[__index]);
            end
            PanelTemplates_TabResize(2, __tab);
            getglobal(__tab:GetName() .. "HighlightTexture"):SetWidth(__tab:GetTextWidth() + 30);

            __tab:Show();
        else
            __tab:Hide();
        end
    end
end

function __bfConfigFrame_InitTab()
    __BigFoot_TabTable = {};
    for __i, __element in pairs(BigFoot_UiConfig) do
        if (not BigFoot_FindTableValue(__BigFoot_TabTable, __element.page)) then
            table.insert(__BigFoot_TabTable, __element.page);
        end
    end

    table.sort(__BigFoot_TabTable, __bfConfigFrame_TabSort);
end

function __bfConfigFrame_TabSort(__arg1, __arg2)
    if (__arg1 == "TAB_GENERAL") then
        return true;
    elseif (__arg2 == "TAB_GENERAL") then
        return false;
    elseif (__arg1 == "TAB_OTHERS") then
        return false;
    elseif (__arg2 == "TAB_OTHERS") then
        return true;
    end

    return (__arg1 < __arg2);
end

function bfButtonCallback_OnClick(self)
    if (self.callback) then
        if (type(self.callback) == "function") then
            self.callback(__variable);
        end
    end
end