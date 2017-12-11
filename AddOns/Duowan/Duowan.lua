--=====================================
-- 名称: Duowan
-- 日期: 2009-12-16
-- 版本: 1.0.1
--  描述: 多玩基本库
-- 作者: dugu@bigfoot
-- 版权所有 (C) duowan.com
--======================================

local _DEBUG = true;
local L = LibStub("AceLocale-3.0"):GetLocale("Duowan");
-------------
-- 定义常用颜色
DUOWAN_COLOR = {};
DUOWAN_COLOR["WHITE"] = "|cFFFFFFFF"
DUOWAN_COLOR["GREEN"] = "|cFF00FF00"
DUOWAN_COLOR["RED"] = "|cFFFF0000"
DUOWAN_COLOR["COPPER"] = "|cFFEDA55F"
DUOWAN_COLOR["SILVER"] = "|cFFC7C7CF"
DUOWAN_COLOR["GOLD"] = "|cFFFFD700"
DUOWAN_COLOR["GRAY"] = "|cFF808080"
DUOWAN_COLOR["STEELBLUE"] = "|cFF0099CC";
DUOWAN_COLOR["DARKRED"] = "|cFF801b00";
DUOWAN_COLOR["END"] = "|r"
-------------
local DUOWAN_LOADED_ADDONS = {};
DUOWAN_RealmName = GetCVar("realmName");
if not DUOWAN_RealmName then
    DUOWAN_RealmName = "China";
end;
DUOWAN_PlayerName = UnitName("player");
if not DUOWAN_PlayerName then
    DUOWAN_PlayerName = "Unknown";
end;
DUOWAN_PlayerId = DUOWAN_RealmName .. "__" .. DUOWAN_PlayerName;
-- 保存所有的配置
Duowan_CVar = {};
Duowan_CVar[DUOWAN_PlayerId]={};
Duowan_Frames = {};

StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"] = {
    text = L["禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块"],
    button1 = TEXT(OKAY),
    button2 = TEXT(CANCEL),
    OnAccept = function()
        ReloadUI();
    end,
    OnCancel = function(_, reason)
        if ( reason == "clicked" and type(StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"].onCancelled) == "functionc") then
            StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"].onCanceled();
        end
    end,
    timeout = 30,
    showAlert = 1,
    hideOnEscape = 1
};

StaticPopupDialogs["DUOWAN_RELOADUI"] = {
    text = L["确定|cffff7000重新载入界面|r?"],
    button1 = TEXT(OKAY),
    button2 = TEXT(CANCEL),
    OnAccept = function()
        ReloadUI();
    end,
    OnCancel = function()
    end,
    timeout = 30,
    showAlert = 1,
    hideOnEscape = 1
};

function dwReloadUI()
    StaticPopup_Show("DUOWAN_RELOADUI");
end

function dwRequestReloadUI(onCancelled)
    StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"].onCancelled = onCancelled;
    StaticPopup_Show("DUOWAN_RELOADUI_CONFIRM");
end

-- 获取配置信息, 否则获得缺省配置
function dwGetCVar(module, name)
    if ((Duowan_CVar[DUOWAN_PlayerId]) and (Duowan_CVar[DUOWAN_PlayerId][module])) then
        if (not Duowan_CVar[DUOWAN_PlayerId][module][name]) then
            dwLoadDefaultCVar(module, name);
        end
    else
        dwLoadDefaultCVar(module);
    end

    vals = Duowan_CVar[DUOWAN_PlayerId][module][name] or 0;

    return vals;
end

function dwRawGetCVar(module, name, default)
    if ((Duowan_CVar[DUOWAN_PlayerId]) and (Duowan_CVar[DUOWAN_PlayerId][module]) and Duowan_CVar[DUOWAN_PlayerId][module][name] ~= nil) then
        return Duowan_CVar[DUOWAN_PlayerId][module][name];
    else
        return default;
    end
end
-- 设置配置信息
function dwSetCVar(module, name, value)
    if (not Duowan_CVar) then
        Duowan_CVar = {};
    end
    if (not Duowan_CVar[DUOWAN_PlayerId]) then
        Duowan_CVar[DUOWAN_PlayerId] = {};
    end

    if (not Duowan_CVar[DUOWAN_PlayerId][module]) then
        Duowan_CVar[DUOWAN_PlayerId][module] = {};
    end

    Duowan_CVar[DUOWAN_PlayerId][module][name] = value;
end

local function dwFindVarFromMod(module, name)
    for i, v in pairs(DuowanConfiguration[module]) do
        if (v.variable == name) then
            return v;
        end
    end

    return nil;
end
-- 载入缺省的配置信息
function dwLoadDefaultCVar(module, name)
    if (module) then
        if (name) then
            if (not DuowanConfiguration[module]) then
                Duowan_CVar[DUOWAN_PlayerId][module] = Duowan_CVar[DUOWAN_PlayerId][module] or {};
                Duowan_CVar[DUOWAN_PlayerId][module][name] = 0;
            else
                Duowan_CVar[DUOWAN_PlayerId][module] = Duowan_CVar[DUOWAN_PlayerId][module] or {};
                local t = dwFindVarFromMod(module, name);
                if (t) then
                    Duowan_CVar[DUOWAN_PlayerId][module][name] = t.default;
                else
                    Duowan_CVar[DUOWAN_PlayerId][module][name] = 0;
                end
            end
        else
            if (not Duowan_CVar) then
                Duowan_CVar= {};
            end
            if (not Duowan_CVar[DUOWAN_PlayerId]) then
                 Duowan_CVar[DUOWAN_PlayerId]={};
            end

            if (not Duowan_CVar[DUOWAN_PlayerId][module]) then
                Duowan_CVar[DUOWAN_PlayerId][module]={};
            end
            -- 这里也可做类型检查
            for k, v in pairs(DuowanConfiguration[module]) do
                if (v.variable) then
                    Duowan_CVar[DUOWAN_PlayerId][module][v.variable] = v.default;
                end
            end
        end
    else
        if (not Duowan_CVar) then
            Duowan_CVar= {};
        end
            if (not Duowan_CVar[DUOWAN_PlayerId]) then
                 Duowan_CVar[DUOWAN_PlayerId]={};
            end
        for module, config in pairs(DuowanConfiguration) do
            if (not Duowan_CVar[DUOWAN_PlayerId][module]) then
                Duowan_CVar[DUOWAN_PlayerId][module] = {};
            end
            for k, v in ipairs(config) do
                if (v.variable) then
                    Duowan_CVar[DUOWAN_PlayerId][module][v.variable] = v.default;
                end
            end
        end
    end
    return true;
end

-- [-[--------------------------------------------
-- 常用函数

function dwShowKeyBindingFrame(arg)
    KeyBindingFrame_LoadUI();

    if (not arg) then
        ShowUIPanel(KeyBindingFrame);
        return;
    else
        local numBindings = GetNumBindings();
        for i = 1, numBindings do
            local commandName = GetBinding(i);
            if ( commandName == arg ) then
                ShowUIPanel(KeyBindingFrame);
                KeyBindingFrameScrollFrameScrollBar:SetValue((i-1)*KEY_BINDING_HEIGHT);
                return;
            end
        end
    end
end

-- 判断是否是duowan的插件
function isDuowanAddOn(name)
    if (GetAddOnMetadata(name, "X-Revision") ~= "Duowan") then
        return false;
    end

    return true;
end

-- 判断该插件是否可以配置
function dwIsConfigurableAddOn(name)
    if (isDuowanAddOn(name) and select(4, GetAddOnInfo(name))) then
        return true;
    else
        return false;
    end
end

-- Prints a table in an organized format
function PrintTable(table, rowname, level)
    if ( rowname == nil ) then rowname = "ROOT"; end
    if ( level == nil ) then level = 1; end

    local msg = "";
    for i=1,level, 1 do
        msg = msg .. "   ";
    end

    if ( table == nil ) then ChatFrame1:AddMessage (msg.."["..rowname.."] := nil "); return end
    if ( type(table) == "table" ) then
        ChatFrame1:AddMessage (msg..rowname.." { ");
        for k,v in pairs(table) do
            PrintTable(v,k,level+1);
        end
        ChatFrame1:AddMessage (msg.."} ");
    elseif (type(table) == "function" ) then
        ChatFrame1:AddMessage (msg.."["..rowname.."] => {{FunctionPtr*}}");
    elseif (type(table) == "userdata" ) then
        ChatFrame1:AddMessage (msg.."["..rowname.."] => {{UserData}}");
    elseif (type(table) == "boolean" ) then
        local value = "true";
        if ( not table ) then
            value = "false";
        end
        ChatFrame1:AddMessage (msg.."["..rowname.."] => "..value);
    else
        ChatFrame1:AddMessage (msg.."["..rowname.."] => "..table);
    end
end

-------------------
-- 保存框架位置
local sf = {};   -- 需要保存位置的框架
local f = CreateFrame("Frame", nil, UIParent);
f:SetScript("OnUpdate", function(self, elapsed)
    for frame, _ in pairs(sf) do
        frame.duration = frame.duration - elapsed;
        if (frame.duration <= 0) then
            Duowan_Frame_Save(frame, frame.layout_id);
            sf[frame] = nil;
        end
    end
end);

function Duowan_Frame_Save(frame, id)
    if (frame and id) then
        local left = frame:GetLeft();
        local top = frame:GetTop();
        local width = frame:GetWidth();
        local height = frame:GetHeight();

        if (left and top and width and height) then
            Duowan_Frames[id] = {};
            Duowan_Frames[id].X = math.floor(left + 0.5);
            Duowan_Frames[id].Y = math.floor(top + 0.5);
            Duowan_Frames[id].W = math.floor(width + 0.5);
            Duowan_Frames[id].H = math.floor(height + 0.5);
        end
    end
end

function Duowan_Frame_Load(frame, id)
    if (frame and Duowan_Frames[id]) then
        frame:ClearAllPoints();
        frame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", Duowan_Frames[id].X, Duowan_Frames[id].Y);
        frame:SetWidth(Duowan_Frames[id].W);
        frame:SetHeight(Duowan_Frames[id].H);
    end
end

function Duowan_Frame_StopMovingOrSizing(self)
    if (self.originalStopMovingOrSizing) then
        self.originalStopMovingOrSizing(self);
    end

    -- Debug(format("%s OnMoving!", self:GetName()))
    self.duration = 1;
    sf[self] = true;
end

function dwRegisterForSaveFrame(frame, id, no_load)
    assert(frame ~= nil, "frame must be assigned.");
    assert(type(frame) == "table", "dwRegisterForSaveFrame: the first parameter must be frame object.");

    if (not id) then
        id = frame:GetName();
    end

    assert(id ~= nil, "The frame has no name, can not be used as default id.");

    frame.layout_id = id;

    if (not frame.rfsf_hooked) then
        frame.rfsf_hooked = true;
        frame.originalStopMovingOrSizing = frame.StopMovingOrSizing;
        frame.StopMovingOrSizing = Duowan_Frame_StopMovingOrSizing;
    end

    if (not no_load) then
        Duowan_Frame_Load(frame, id);
    end
end

function Debug(msg)
    if (_DEBUG) then
        Print(msg);
    end
end

------------------------
-- 战斗状态调用栈(队列)

local stack = {};
local frame = CreateFrame("Frame");
local index = 0;
local sequence = {};
frame:RegisterEvent("PLAYER_REGEN_ENABLED");
function dwPush(func, ...)
    assert(type(func) == "function", "First argument must be a function value.");

    index = index + 1;
    stack[func] = {...};
    sequence[func] = index;
end

function dwRunCallStack()
    local tmp = {};
    local tmp2= {};
    for k, v in pairs(sequence) do
        tmp[v] = k;
    end

    for k, v in pairs(tmp) do
        tinsert(tmp2, k);
    end
    table.sort(tmp2);
    local func;
    for i=1, #(tmp2) do
        func = tmp[tmp2[i]];
        if (func and type(func) == "function"  and stack[func]) then
            pcall(unpack(stack[func]));
        end
    end

    table.wipe(stack);
    table.wipe(sequence);
    index = 0;
end

frame:SetScript("OnEvent", function(self)
    dwRunCallStack();
end);

function dwSecureCall(...)
    local func = select(1, ...);
    if (type(func) == "function") then
        if (InCombatLockdown()) then
            dwPush(func, ...);
            return;
        end

        pcall(...);
    end
end
-------------------------
-- 更合理的定位和缩放

local function AjustPosition(frame, parent)
    assert(type(frame:GetFrameType()) == "string", "Invalid <frame>, the type of frame must be userdata.");
    parent = parent or UIParent;
    --
    local limitX = parent:GetRight()/frame:GetScale();
    local limitY = parent:GetTop()/frame:GetScale();

    local xr = frame:GetRight();
    local yt = frame:GetTop();
    local xl = frame:GetLeft();
    local yb = frame:GetBottom();
    if (xr and yt and xl and yb) then
        local x = (xr > limitX and (limitX-xr)) or (xl < 0 and (0-xl)) or 0;
        local y = (yt > limitY and (limitY-yt)) or (yb < 0 and (0-yb)) or 0;

        local cx = (x + xl);
        local cy = (y + yt);

        if (cx~=0 or cy~=0) then
            frame:SetPoint("TOPLEFT", parent, "BOTTOMLEFT", cx, cy);
        end
    end
end
--------------
-- 更安全的定位
function dwSetPoint(frame, point,relativeFrame,relativePoint, xOfs, yOfs)
    local parent = frame:GetParent() or UIParent;
    xOfs = xOfs/parent:GetScale();
    yOfs = yOfs/parent:GetScale();
    frame:SetPoint(point,relativeFrame,relativePoint, xOfs, yOfs);
    AjustPosition(frame, parent);
end

local function GetAjustcoord(frame, nscale)
    if (not (frame:GetTop() and frame:GetLeft())) then
        return nil;
    end

    local x = frame:GetLeft() * frame:GetScale() / nscale;
    local y = frame:GetTop() * frame:GetScale() / nscale;
    return x, y;
end
------------------
-- 更合理的缩放
function dwSetScale(frame, nscale)
    assert(type(nscale) == "number", "Invalid <scale>, the type of scale must be number.");

    local x, y = GetAjustcoord(frame, nscale);
    frame:SetScale(nscale);
    frame:ClearAllPoints();
    frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y);
    AjustPosition(frame);
end

-------------------
-- 空函数
function DUMMY_FUNC() end

-------------------
-- 异步调用(安全的调用别的插件的函数)
do
local AsynCallFuncs = {};
function dwAsynCall(AddOnName, funcName, ...)
    if (IsAddOnLoaded(AddOnName) and type(_G[funcName]) == "function") then
        _G[funcName](...);
    else
        AsynCallFuncs[AddOnName] = AsynCallFuncs[AddOnName] or {};
        AsynCallFuncs[AddOnName][funcName] = {...};
    end
end

function dwAsynUncall(AddOnName, funcName)
    if (AsynCallFuncs[AddOnName] and AsynCallFuncs[AddOnName][funcName]) then
        AsynCallFuncs[AddOnName][funcName] = nil;
    end
end
local frame = CreateFrame("Frame");
frame:RegisterEvent("ADDON_LOADED");
frame:SetScript("OnEvent", function(self, event, addon)
    if (AsynCallFuncs[addon]) then
        for func, args in pairs(AsynCallFuncs[addon]) do
            if (type(_G[func]) == "function") then
                _G[func](unpack(args));
            end
        end
    end
end);
end
----------------------------
-- 克隆表格 | 删除表格
function dwCloneTable(t)
    assert(type(t) == "table");
    local tmp = {};
    for k, v in pairs(t) do
        if (type(v) == "table") then
            tmp[k] = dwCloneTable(v);
        else
            tmp[k] = v;
        end
    end
    return tmp;
end

function dwNukeTable(t)
    assert(type(t) == "table");

    for k, v in pairs(t) do
        if (type(v) == "table") then
            dwNukeTable(v);
        else
            v = nil;
        end
    end
end
----------------------------
-- 延迟调用 | 渐隐关闭
local dwDelayCallStack = {};
local dwFadeOutStack = {};
function dwDelayCall(name, time, ...)
    local tmp = {};
    if (type(name) == "string") then
        if (not dwDelayCallStack[name] and type(_G[name]) == "function") then
            tmp[1] = _G[name];
            tmp[2] = time;
            tmp[3] = {...};
            tmp["_T"] = 0;
            dwDelayCallStack[name] = tmp;
        end
    elseif (type(name) == "function") then
        tmp[1] = name;
        tmp[2] = time;
        tmp[3] = {...};
        tmp["_T"] = 0;
        tinsert(dwDelayCallStack, tmp);
    end
end

function dwClearDelayCall(name)
    dwDelayCallStack[name] = nil;
end

function dwFadeOut(frame, time, startAlpha, endAlpha)
    local fadeInfo = {};
    fadeInfo[1] = frame;
    fadeInfo[2] = time or 1;
    fadeInfo[3] = startAlpha or 1;
    fadeInfo[4] = endAlpha or 0;

    tinsert(dwFadeOutStack, fadeInfo);
end

local frame = CreateFrame("Frame");
frame:SetScript("OnUpdate", function(self, elapsed)
    for name,  v in pairs(dwDelayCallStack) do
        v._T = v._T + elapsed;
        if (type(v[1]) == "function" and v._T > v[2]) then
            v[1](unpack(v[3]));
            dwDelayCallStack[name] = nil;
        end
    end

    for index, fadeInfo in ipairs(dwFadeOutStack) do
        if (type(fadeInfo) == "table" and fadeInfo[2]) then
            if ( not fadeInfo.fadeTimer ) then
                fadeInfo.fadeTimer = 0;
            end
            fadeInfo.fadeTimer = fadeInfo.fadeTimer + elapsed;

            if (fadeInfo.fadeTimer < fadeInfo[2]) then
                fadeInfo[1]:SetAlpha(((fadeInfo[2] - fadeInfo.fadeTimer) / fadeInfo[2]) * (fadeInfo[3] - fadeInfo[4])  + fadeInfo[4]);
            else
                fadeInfo[1]:Hide();
                fadeInfo[1] = nil;
                fadeInfo[2] = nil;
                fadeInfo[3] = nil;
                fadeInfo[4] = nil;
                fadeInfo = nil;
            end
        end
    end
end);

function printf(pattern, ...)
    assert(type(pattern) == "string");
    local text = format(pattern, ...);
    pcall(print, text);
end

-----------------------
-- 动态载入插件
function dwLoadAddOn(addon)
    if (dwIsConfigurableAddOn(addon)) then
        DUOWAN_LOADED_ADDONS[addon] = 1;
        if (not IsAddOnLoaded(addon)) then
            LoadAddOn(addon);
        end
    end
end

function dwIsAddOnLoaded(addon)
    if (dwIsConfigurableAddOn(addon) and IsAddOnLoaded(addon)) then
        return true;
    end
    return false;
end

-----------------------
-- 简单的菜单创建
DWEASY_MENU_INDEX = 1;

function dwEasyMenu(menuList, menuFrame, anchor, x, y, displayMode)
    UIDropDownMenu_Initialize(menuFrame, DWEasyMenu_Initialize, displayMode, nil, menuList);
end

function DWEasyMenu_Initialize(frame, level, menuList)
    if (type(menuList) == "table") then
        local info = UIDropDownMenu_CreateInfo();
        for index = 1, #(menuList) do
            info = menuList[index];
            if (info.text) then
                info.index = index;
                info.level = info.level or 1;
                if (level == info.level) then
                    UIDropDownMenu_AddButton(info, level);
                else
                    if (info.hasArrow and info.subMenu and UIDROPDOWNMENU_MENU_VALUE == info.value) then
                        DWEasyMenu_Initialize(info.subMenu, level);
                        return;
                    end
                end
            end
        end
    end
end

function DWEasyMenu_Register(parent, menuList)
    parent:RegisterForClicks("LeftButtonDown", "LeftButtonUp", "RightButtonUp");
    local name = parent:GetName() and parent:GetName() .. "MenuFrame" or "DuowanEasyMenu" .. DWEASY_MENU_INDEX;
    parent.menuFrame = parent.menuFrame or CreateFrame("Frame", name, parent, "UIDropDownMenuTemplate");
    parent.menuFrame:Hide();
    dwEasyMenu(menuList, parent.menuFrame, "cursor", nil, nil, "MENU");
    if (parent:GetScript("OnClick")) then
        parent:HookScript("OnClick", function(self, button)
            if (button == "RightButton") then
                ToggleDropDownMenu(nil, nil, self.menuFrame, "cursor",  nil, nil, menuList);
            end
        end);
    else
        parent:SetScript("OnClick", function(self, button)
            if (button == "RightButton") then
                ToggleDropDownMenu(nil, nil, self.menuFrame, "cursor", nil, nil, menuList);
            end
        end);
    end
    DWEASY_MENU_INDEX = DWEASY_MENU_INDEX + 1;
end

-----------------------
-- 范围控件

local function Duowan_CreatePopRange()
    local frame = CreateFrame("Frame", "Duowan_PopRangeFrame", UIParent);
    tinsert(UISpecialFrames, "Duowan_PopRangeFrame");
    frame:SetWidth(280);
    frame:SetHeight(100);
    frame:SetToplevel(true);
    frame:EnableMouse(true);
    frame:SetBackdrop({bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
          edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", tile = true, tileSize = 32, edgeSize = 32,
          insets = { left = 11, right = 12, top = 12, bottom = 11}});
    frame:SetPoint("TOP", UIParent, "TOP", 0, -120);
    frame:Hide();
    frame.slider = CreateFrame("Slider", "Duowan_PopRangeSlider", frame, "OptionsSliderTemplate");
    frame.slider.highText = getglobal("Duowan_PopRangeSliderHigh");
    frame.slider.lowText = getglobal("Duowan_PopRangeSliderLow");
    frame.slider.valueText = getglobal("Duowan_PopRangeSliderText");
    frame.slider.thumb = getglobal("Duowan_PopRangeSliderThumb");
    frame.slider:SetWidth(180);
    frame.slider:SetPoint("TOP", frame, "TOP", 0, -30);
    frame.slider:SetScript("OnValueChanged", function(self)
        local value = self:GetValue();
        frame.curV = value;
        if (frame.showPrecent) then
            self.valueText:SetText(format("%d%%",floor( value*100)));
        else
            self.valueText:SetText(value);
        end
        frame.func(value);
    end);
    frame.okay = CreateFrame("Button", "Duowan_PopRangeOkay", frame, "UIPanelButtonTemplate2");
    frame.okay:SetText(TEXT(OKAY));
    frame.okay:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 30, 16 );
    frame.okay:SetWidth(100);
    frame.okay:SetScript("OnClick", function(self)
        frame:Hide();
    end);
    frame.okay:Show();
    frame.cancel = CreateFrame("Button", "Duowan_PopRangeCancel", frame, "UIPanelButtonTemplate2");
    frame.cancel:SetText(TEXT(CANCEL));
    frame.cancel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 16);
    frame.cancel:SetWidth(100);
    frame.cancel:SetScript("OnClick", function(self)
        frame.func(frame.preV);
        frame:Hide();
    end);
    frame.cancel:Show();
    frame:SetScript("OnShow", function(self)
        PlaySound("igMainMenuClose");
        if (self.onShow and type(self.onShow) == "function") then
            self.onShow(self.curV);
        end
    end);
    frame:SetScript("OnHide", function(self)
        PlaySound("igMainMenuClose");
        if (self.onHide and type(self.onHide) == "function") then
            self.onHide(self.curV);
        end
    end);

    return frame;
end

function Duowan_ShowPopRange(minV, maxV, value, step, showPrecent, func, onShow, onHide, tooltip)
    local frame = _G["Duowan_PopRangeFrame"] or Duowan_CreatePopRange();
    frame.onShow = onShow;
    frame.onHide = onHide;
    frame.func = func;
    frame.preV = value or 0.5;
    frame.curV = value or 0.5;
    frame.minV = minV or 0;
    frame.maxV = maxV or 1;
    frame.step = step or 0.1;
    frame.slider.tooltipText = tooltip;
    frame.showPrecent = showPrecent or nil; -- [nil|true] nil - 按值显示, true - 按百分比显示;

    frame.slider:SetValueStep(frame.step);
    frame.slider:SetMinMaxValues(frame.minV, frame.maxV);
    frame.slider:SetValue(frame.curV);
    if (frame.showPrecent) then
        frame.slider.valueText:SetText(format("%d%%", floor(frame.curV*100)));
        frame.slider.highText:SetText(format("%d%%", floor(frame.maxV*100)));
        frame.slider.lowText:SetText(format("%d%%", floor(frame.minV*100)));
    else
        frame.slider.valueText:SetText(floor(frame.curV/(frame.maxV - frame.minV)));
        frame.slider.highText:SetText(frame.maxV);
        frame.slider.lowText:SetText(frame.minV);
    end

    frame:Show();
end