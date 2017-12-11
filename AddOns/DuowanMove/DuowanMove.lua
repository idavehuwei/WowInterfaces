------------------------------------------------------------------------------------------
-- DuowanMove - ver 1.0
-- 日期: 2010-4-9
-- 作者: dugu@bigfoot
-- 描述: 让系统所有的元素都能够自由的移动、改变大小、排列等等
-- 版权所有 (c) Duowan.com
-------------------------------------------------------------------------------------------
DuowanMove_DB = {
    theme = "default",
    version = "1.0.4",
    _themes = {};
};
local DuowanMove_Version = "1.0.4";

DuowanMove = LibStub("AceAddon-3.0"):NewAddon("DuowanMove", "AceEvent-3.0", "AceHook-3.0");
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceConfig = LibStub("AceConfig-3.0");
local dew = AceLibrary("Dewdrop-2.0");
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanMove", true);
local M = DuowanMove;
M.parent = CreateFrame("Frame","DuowanMoveHideFrame",UIParent,"SecureFrameTemplate");
M._DEBUG = true;
M._ENABLE = true;
-- 这里保存方法和对象
M.Mods = {
    ["ACTIONBAR"] = {},
    ["UNITFRAME"] = {},
    ["CASTBAR"] = {},
    ["OTHER"] = {},
    ["TEXTURE"] = {},
};
M.profiles = {};
M.showgrid = MultiBarLeftButton1:GetAttribute("showgrid");
M.IgnorGrid = {
    "dwPlayerPetBar",
    "dwBagBar",
    "dwMenuBar",
    "dwShapeShiftBar",
};
-- 排列方式
M.AT = {
    VERTICAL            = 1,    -- 纵向
    HORIZONTAL      = 2,    -- 横向
    DOUBLE              = 3,  -- 双排(横向)
    FUNNY               = 4,    -- 趣味排列
}
M.options1 = {};

function M:debug(msg, ...)
    if (self._DEBUG and ...) then
        print(format(msg, ...));
    else
        print(msg);
    end
end

function M:CloneTable(t)
    local tmp = {};
    for k, v in pairs(t) do
        if (type(v) == "table") then
            if (k == "pos" and type(v[2]) ~= "string") then
                tmp[k] = {v[1], "UIParent", v[3], v[4], v[5]};
            else
                tmp[k] = self:CloneTable(v);
            end
        else
            tmp[k] = v;
        end
    end
    return tmp;
end

function M:NukeTable(t)
    for k, v in pairs(t) do
        if (type(v) == "table") then
            if (k == "pos" and type(v[2]) ~= "string") then
                t[k] = nil;
            else
                self:NukeTable(v);
                t[k] = nil;
            end
        else
            t[k] = nil;
        end
    end
    t = nil;
    return t;
end

function M:RegisterAll()
    -- 注册元素
    self:Register("ACTIONBAR", "dwMainBar");
    self:Register("ACTIONBAR", "dwBottomLeftBar");
    self:Register("ACTIONBAR", "dwBottomRightBar");
    self:Register("ACTIONBAR", "dwRightBar1");
    self:Register("ACTIONBAR", "dwRightBar2");
    self:Register("ACTIONBAR", "dwShapeShiftBar");
    self:Register("ACTIONBAR", "dwPossessBar");
    self:Register("ACTIONBAR", "dwPlayerPetBar");
    self:Register("ACTIONBAR", "dwMenuBar");
    self:Register("ACTIONBAR", "dwBagBar");
    self:Register("UNITFRAME", "dwUnitPlayerFrame");
    self:Register("UNITFRAME", "dwUnitTargetFrame");
    self:Register("UNITFRAME", "dwUnitPartyFrame");
    self:Register("UNITFRAME", "dwUnitFocusFrame");
    self:Register("CASTBAR", "dwCastBarFrame");
    self:Register("CASTBAR", "dwMirrorTimerFrame");
    self:Register("CASTBAR", "dwExBar");
    self:Register("OTHER", "dwMiniMapFrame");
    self:Register("OTHER", "dwDurabilityFrame");
    self:Register("OTHER", "dwBuffFrame");
end

function M:OnInitialize()
    -- check version
    if (DuowanMove_Version ~= DuowanMove_DB.version) then
        DuowanMove_DB["_themes"]["default"] = self:CloneTable(DUOWANMOVE_DEFAULT_DB["_themes"]["default"]);
        DuowanMove_DB.version = DuowanMove_Version;
    end
    self:UpdateCurProfile();
    self:RegisterAll();
    self:InitConfigOptions();
    self.showgrid = MultiBarLeftButton1:GetAttribute("showgrid");
    self:RegisterEvent("ACTIONBAR_SHOWGRID");
    self:RegisterEvent("ACTIONBAR_HIDEGRID");
    self:RegisterEvent("PLAYER_ENTERING_WORLD");
    AceConfig:RegisterOptionsTable(L["多玩移动"], self.options2);
    self:SecureHook("ActionButton_UpdateHotkeys");
    self:SecureHook("VideoOptionsFrameOkay_OnClick");
    self:SecureHook("VideoOptionsFrameDefault_OnClick");
    self:SecureHookScript(VideoOptionsFrameOkay, "OnClick", "VideoOptionsFrameDefault_OnClick");
end

function M:Toggle(switch)
    if (switch) then
        -- 刷新方案
        MainMenuBar:SetFrameStrata("LOW");
        MainMenuBar:SetFrameLevel(1);
        MainMenuBarArtFrame:SetFrameStrata("LOW");
        MainMenuBarArtFrame:SetFrameLevel(1);
        self:UpdateTheme();
    else
        -- 反注册所有元素
        MainMenuBar:SetFrameStrata("MEDIUM");
        MainMenuBarArtFrame:SetFrameStrata("MEDIUM");
        for mod, v in pairs(self.Mods) do
            for name, _ in pairs(v) do
                self:Unregister(mod, name);
            end
        end
    end
end

function M:MultiActionBar_ShowAllGrids(...)
    self:IncGrid();
    self:UpdateAllGrid();
end

function M:MultiActionBar_HideAllGrids(...)
    self:DecGrid();
    self:UpdateAllGrid();
end

function M:PLAYER_ENTERING_WORLD()
    self:UpdateAllGrid();
end

function M:ACTIONBAR_SHOWGRID()
    self:IncGrid();
    self:UpdateAllGrid();
end

function M:ACTIONBAR_HIDEGRID()
    self:DecGrid();
    self:UpdateAllGrid();
end

function M:OpenConfig()
    LibStub("AceConfigDialog-3.0"):Open(L["多玩移动"]);
end

local function NOOP_FUNC() end

function M:GetCurTheme()
    if (DuowanMove_DB["theme"]) then
        return DuowanMove_DB["theme"];
    else
        if (GetCVar("useUiScale") == "1") then
            DUOWANMOVE_DEFAULT_DB["_themes"]["default"].uiscale = GetCVar("uiscale");
        end
        return "default";
    end
end

-- 以ptheme为模板新建一套方案
function M:NewTheme(name, ptheme)
    local ptheme = ptheme or self:GetCurTheme();
    DuowanMove_DB["theme"] = name;
    if (DuowanMove_DB["_themes"][ptheme]) then
        DuowanMove_DB["_themes"][name] = self:CloneTable(DuowanMove_DB["_themes"][ptheme]);
    else
        DuowanMove_DB["_themes"][name] = self:CloneTable(DUOWANMOVE_DEFAULT_DB["_themes"]["default"]);
    end

    -- 刷新当前配置
    self:UpdateCurProfile();
end

-- 设置当前方案
function M:SetCurTheme(name)
    -- 先注销
    local theme = self:GetCurTheme();
    local tmp = self:CloneTable(DuowanMove_DB["_themes"][theme]);
    self:Toggle(false);
    DuowanMove_DB["_themes"][theme] = tmp;

    if (DuowanMove_DB["_themes"][name]) then
        DuowanMove_DB["theme"] = name;
        self:UpdateCurProfile();
        return true;
    else
        return false;
    end
end

-- 刷新当前的方案
function M:UpdateTheme()
    for m, mod in pairs(self.db) do
        if (type(mod) == "table") then
            for name, db in pairs(mod) do
                if (type(db) == "table" and not db.lock) then
                    self:UnLockFrame(name, m);
                end
            end
        end
    end
end

function M:VideoOptionsFrameOkay_OnClick(...)
    local theme = self:GetCurTheme();
    if (GetCVar("useUiScale") == "1") then
        DuowanMove_DB["_themes"][theme].uiscale = GetCVar("uiscale");
        DuowanMove_DB["_themes"][theme].useUiScale = true;
    else
        DuowanMove_DB["_themes"][theme].useUiScale = false;
        DuowanMove_DB["_themes"][theme].uiscale = 1;
    end
end

function M:VideoOptionsFrameDefault_OnClick(...)
    self:VideoOptionsFrameOkay_OnClick();
end

function M:UpdateCurProfile()
    -- 初始时使用缺省方案
    if (not DuowanMove_DB["_themes"]["default"]) then
        DuowanMove_DB["theme"] = "default";
        DuowanMove_DB["_themes"] = self:CloneTable(DUOWANMOVE_DEFAULT_DB["_themes"]);
        if (GetCVar("useUiScale")) then
            DuowanMove_DB["_themes"]["default"].uiscale = GetCVar("uiscale");
        end
    end

    local theme = DuowanMove_DB["theme"];
    if (not DuowanMove_DB["_themes"][theme]) then
        DuowanMove_DB["_themes"][theme] = {};
    end

    self.profiles = {};
    for k, v in pairs(DuowanMove_DB["_themes"]) do
        self.profiles[k] = k;
    end
    self.db = DuowanMove_DB["_themes"][theme];
end

function M:ResetTheme()
    DuowanMove_DB["_themes"]["default"] = self:CloneTable(DUOWANMOVE_DEFAULT_DB["_themes"]["default"]);
    self:SetCurTheme("default");
    self:UpdateTheme();
end

function M:DeleteTheme(name)
    if (DuowanMove_DB["_themes"][name]) then
        DuowanMove_DB["_themes"][name] = self:NukeTable(DuowanMove_DB["_themes"][name]);
        self:UpdateCurProfile()
    end
end

function M:FindMod(name)
    for m, n in pairs(self.Mods) do
        if (n[name]) then
            return m;
        end
    end
    return false;
end

function M:GetNumberButtons(bar)
    local count = 0
    local name = bar:GetName();
    local mod = self:FindMod(bar:GetName());
    if (self:GetInfo(mod, name, "num")) then
        count = self:GetInfo(mod, name, "num");
    elseif (bar.buttons) then
        count = #(bar.buttons);
    elseif (bar.num and bar.num > 0) then
        count =  bar.num;
    end
    count = tonumber(count) or 0;
    return count;
end

function M:IncGrid()
    self.showgrid = self.showgrid + 1;
end

function M:DecGrid()
    if self.showgrid > 0 then
        self.showgrid = self.showgrid - 1;
    end
end

function M:IsActionButton(bar)
    local at = bar:GetAttribute("type");
    if (at == "action" or at == "spell") then
        return true;
    end
    return false;
end

function M:UpdateGrid(bar)
    local name = bar:GetName();
    for k, v in pairs(self.IgnorGrid) do
        if (name == v) then
            return;
        end
    end

    for i=1, self:GetNumberButtons(bar) do
        local button = bar.buttons[i];
        if (button) then
            button:SetAttribute("showgrid", self.showgrid);
            if (self:IsActionButton(button)) then
                local action = ActionButton_CalculateAction(button);
                if self.showgrid > 0 then
                    if (not button:GetAttribute("statehidden")) then
                        dwSecureCall(button.Show, button);
                    end
                else
                    if (not HasAction(action)) then
                        dwSecureCall(button.Hide, button);
                    end
                end
            end
        end
    end
end

function M:ActionButton_UpdateHotkeys(button, actionButtonType)
    local hotkey = _G[button:GetName().."HotKey"];
    if (hotkey:IsShown() and (hotkey:GetText() == RANGE_INDICATOR or hotkey:GetText() == "?")) then
        hotKey:Hide();
    end
end

function M:ShowMenu(tab, button)
    self.curf = tab:GetParent();

    if (self.curf and button == "RightButton") then
        self:UpdateOptions();
        dew:Open(
            tab,
            "children",
            function()
                dew:FeedAceOptionsTable(M.options1)
            end
        );
    end
end
----------------
-- 注册模块
function M:Register(mod, name, OnInitialize, OnUnregister)
    assert(name and type(name) == "string", "name must be a stirng value");
    if (self.Mods[mod][name]) then
        return;
    end

    OnInitialize = OnInitialize or M["OnInitialize" .. name];
    OnUnregister = OnUnregister or M["OnUnregister" .. name];

    assert(OnInitialize and type(OnInitialize) == "function", "OnRegister must be function value");
    assert(OnUnregister and type(OnUnregister) == "function", "OnUnregister must be function value");

    if (not self.Mods[mod]) then
        self.Mods[mod] = {};
    end

    self.Mods[mod][name] = {};
    self.Mods[mod][name]["OnInitialize"] = OnInitialize;
    self.Mods[mod][name]["OnUnregister"] = OnUnregister;
    self.Mods[mod][name]["SaveInfo"] = function(var, val) M:SaveInfo(mod, name, var, val) end;
--  self.Mods[mod][name]["UpdateFrame"] = function() M:UpdateFrame(name, mod) end;
    self.Mods[mod][name]["OnUpdate"] = M["OnUpdate" .. name] or NOOP_FUNC;
    self.Mods[mod][name]["isinit"] = false;
end

----------------
-- 取消注册
function M:Unregister(mod, name)
    assert(name and type(name) == "string", "name must be a stirng value");
    if (not self.Mods[mod][name] or not self.Mods[mod][name]["isinit"]) then
        return;
    end
    -- 注销所有事件
    _G[name]:UnregisterAllEvents();
    -- 恢复初始状态(default)
    local ddb = DUOWANMOVE_DEFAULT_DB["_themes"]["default"];
    self.db[mod][name] = self:CloneTable(ddb[mod][name]);
    self:UpdateFrame(name, mod);
    -- 调用自定义反注册方法
    self.Mods[mod][name]["OnUnregister"]();
    -- 标记该元素属性为锁定, 不再处理任何刷新事件
    self:SaveInfo(mod, name, "lock", true);
    -- 标记为未初始化
    self.Mods[mod][name]["isinit"] = false;
end

-- 初始化
function M:InitFrame(mod, name)
    if (not self.Mods[mod][name]["isinit"]) then
        self.Mods[mod][name]["isinit"] = true;
        self.Mods[mod][name]:OnInitialize();
        _G[name].SaveInfo = function(self, var, val)
            M:SaveInfo(mod, name, var, val);
        end

        _G[name].UpdateFrame = function(self)
            M:UpdateFrame(name, mod);
        end

        _G[name].ShowMenu = function(self, tab, button)
            M:ShowMenu(tab, button);
        end
        -- 添加文字信息
        local text = string.sub(name, 3);
        text = L[text .. "Text"];
        if (mod == "ACTIONBAR") then
            _G[name .. "TabLable"]:SetText(text or "");
        else
            _G[name .. "Text"]:SetText(text or "");
        end
    end
end
-- 只有到解锁的时候才执行初始化函数
function M:UnLockFrame(name, mod)
    local name = type(name) == "string" and name or name:GetName();
    local mod = mod or self:FindMod(name);
    if (not mod) then
        return;
    end

    if (not self.db[mod]) then
        self.db[mod] = {};
    end
    if (not self.db[mod][name]) then
        self.db[mod][name] = {};
    end
    local db = self.db[mod][name];
    if (not self.Mods[mod] or not self.Mods[mod][name]) then
        return;
    end

    self:InitFrame(mod, name);
    -- 该元素可以被处理
    self:SaveInfo(mod, name, "lock", false);
    self:UpdateFrame(name, mod);
end

function M:IsFrameRegister(name, mod)
    for k, v in pairs(self.Mods) do
        local m = mod or k;
        if (m == k and v[name]) then
            return true
        end
    end
    return false;
end

function DuowanMove_UpdatePos(frame, mod)
    local name = type(frame) == "string" and frame or frame:GetName();

    -- 刷新整个配置档时过滤掉未注册的模块
    local self = DuowanMove;
    if (not self:IsFrameRegister(name, mod)) then
        return;
    end
    frame = _G[name];
    local mod = mod or self:FindMod(name);
    local db = self.db[mod][name];
    local uiScale = UIParent:GetScale();
    -- 缩放
    dwSetScale(frame, db.scale or 1);

    -- 尺寸
    if (db.width and db.height) then
        frame:SetWidth(db.width);
        frame:SetHeight(db.height);
        -- 特殊处理经验条
        if (name == "dwExBar") then
            MainMenuExpBar:SetWidth(db.width);
            self:UnTakeOver(ReputationWatchBar);
            ReputationWatchBar:SetWidth(db.width);
            ReputationWatchStatusBar:SetWidth(db.width);
            self:OndwExBarWidthChange(db.width)
            self:TakeOver(ReputationWatchBar);
        end
    end

    -- 透明度
    frame:SetAlpha(db.alpha or 1);
    -- 可见性
    if (db.visible) then
        dwSecureCall(frame.Show, frame);
    else
        dwSecureCall(frame.Hide, frame);
    end
    -- 是否可移动
    if (not db.move) then
        _G[name .. "BG"]:Hide();
        frame.lock = true;
        DuowanMoveTab_OnDragStop(_G[name .. "Tab"]);
    else
        _G[name .. "BG"]:Show();
        frame.lock = false;
    end

    -- 全局锁定
    if (self.db.lock) then
        _G[name .. "BG"]:Hide();
        _G[name .. "Text"]:Hide();
        dwSecureCall(_G[name .. "Tab"].Hide, _G[name .. "Tab"]);
    else
        _G[name .. "BG"]:Show();
        _G[name .. "Text"]:Show();
        dwSecureCall(_G[name .. "Tab"].Show, _G[name .. "Tab"]);
    end

    -- 动作条类还可以改变排列方式等
    if (mod == "ACTIONBAR") then
        _G[name .. "BG"]:Hide();
        self:UpdateActionBar(frame);
    end

    -- 模块自定义刷新
    self.Mods[mod][name]:OnUpdate(db, name);

    -- 定位(控制条跟随姿态条)
    if (name ~= "dwPossessBar") then
        local pos = db.pos or {"CENTER", "UIParent", "CENTER", 0, 0};
        pos[2] = (type(pos[2] == "string") and pos[2]) or "UIParent";
        dwSecureCall(frame.ClearAllPoints, frame);
        dwSecureCall(frame.SetPoint, frame, pos[1], pos[2] or pos[2], pos[3], pos[4], pos[5]);
    end
end

function M:UpdateFrame(frame, mod)
    local name = type(frame) == "string" and frame or frame:GetName();
    -- 刷新整个配置档时过滤掉未注册的模块
    if (not self:IsFrameRegister(name, mod)) then
        return;
    end
    frame = _G[name];
    local mod = mod or self:FindMod(name);
    local db = self.db[mod][name];

    -- 锁定的元素不应该被刷新
    if (db.lock) then return end

    -- 全局缩放
    if (self.db.useUiScale and self.db.uiscale and (GetCVar("uiscale") - self.db.uiscale) > 0.0001) then
        SetCVar("useUiScale", "1");
        SetCVar("uiscale", self.db.uiscale);
        dwDelayCall(DuowanMove_UpdatePos, 1, frame, mod);
        return;
    end

    DuowanMove_UpdatePos(frame, mod);
end

function M:SaveFramePosition(mod, frame)
    local pos = {frame:GetPoint()};
    pos[2] = "UIParent";
    self:SaveInfo(mod, frame, "pos", pos);
end
-- 这个还是可以保证的
function M:UpdateFrameScale(mod, frame)
    local name = frame:GetName();
    dwSetScale(frame, self.db[mod][name].scale or 1);
    -- 保存信息
    self:SaveFramePosition(mod, frame);
end

function M:UpdateActionBar(bar, db)
    local name = bar:GetName();
    local db = db or self.db["ACTIONBAR"][name];

    if (not bar.buttons[1]) then
        return;
    end

    -- 最小化、显示数量
    local maxNum = self:GetMaxNumber(bar);
    for id=1, maxNum do
        if (id > (db.num or maxNum) or db.minimize) then
            dwSecureCall(bar.buttons[id].SetAttribute, bar.buttons[id], "statehidden", true);
            dwSecureCall(bar.buttons[id].Hide, bar.buttons[id]);
        else
            dwSecureCall(bar.buttons[id].SetAttribute, bar.buttons[id], "statehidden", false);
            dwSecureCall(bar.buttons[id].Show, bar.buttons[id]);
        end
    end

    -- 排列(反转只针对线性排列)
    self:UpdateArrage(bar);
    -- 重新计算bar的大小
    local left = bar.buttons[1]:GetLeft();
    local top = bar.buttons[1]:GetTop();
    local n = self:GetNumberButtons(bar);
    if (n and n > 0) then
        local right = bar.buttons[n]:GetRight();
        local bottom = bar.buttons[n]:GetBottom();

        if (left and top and right and bottom) then
            local cx = abs(right - left);
            local cy = abs(top - bottom);
            if (bar == dwMenuBar) then
                cy = cy - 20;
            end
            dwSecureCall(bar.SetWidth, bar, cx);
            dwSecureCall(bar.SetHeight, bar, cy);
        end
    end
end

-- 按线性排列
function M:SetLineArrange(bar, linenum)
    assert(bar);

    local name = bar:GetName();
    local db = self.db["ACTIONBAR"][name];
    local inset = db.space or 5;

    linenum = linenum or 1;

    local cur_id;
    local maxNum = self:GetMaxNumber(bar);
    for i = 1, ceil((db.num or maxNum)/linenum) do
        for j = 1, linenum do
            cur_id = (i-1)*linenum + j
            if cur_id > (db.num or maxNum) then break end

            if (cur_id > 1 and cur_id <= maxNum) then
                bar.buttons[cur_id]:ClearAllPoints();
                if j == 1 then
                    if bar == dwMenuBar then
                        bar.buttons[cur_id]:SetPoint("TOP", bar.buttons[cur_id - linenum], "BOTTOM", 0, -inset+20);
                    else
                        bar.buttons[cur_id]:SetPoint("TOP", bar.buttons[cur_id - linenum], "BOTTOM", 0, -inset);
                    end
                else
                    if (db.invert) then
                        bar.buttons[cur_id]:SetPoint("RIGHT", bar.buttons[cur_id - 1], "LEFT", -inset, 0);
                    else
                        bar.buttons[cur_id]:SetPoint("LEFT", bar.buttons[cur_id - 1], "RIGHT", inset, 0);
                    end
                end
            end
        end
    end
end

-- 趣味排列
local suite = {
    [2] = {
        [2] = {"TOPLEFT", 1, "BOTTOMRIGHT", 4, -4},
    },
    [3] = {
        [2] = {"TOPRIGHT", 1, "BOTTOM", -2, -4},
        [3] = {"TOPLEFT", 1, "BOTTOM", 2, -4},
    },
    [4] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -4},
        [3] = {"RIGHT", 2, "LEFT", -4, 0},
        [4] = {"LEFT", 2, "RIGHT", 4, 0}
    },
    [5] = {
        [2] = {"TOP", 1, "BOTTOM", 0, -4},
        [3] = {"RIGHT", 2, "LEFT", -4, 0},
        [4] = {"LEFT", 2, "RIGHT", 4, 0},
        [5] = {"TOP", 2, "BOTTOM", 0, -4},
    },
    [6] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"LEFT", 2, "RIGHT", 4, 0},
        [4] = {"TOP", 1, "BOTTOMLEFT", -2, -4},
        [5] = {"LEFT", 4, "RIGHT", 4, 0},
        [6] = {"LEFT", 5, "RIGHT", 4, 0},
    },
    [7] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"TOPRIGHT", 1, "BOTTOM", -2, -4},
        [4] = {"LEFT", 3, "RIGHT", 4, 0},
        [5] = {"LEFT", 4, "RIGHT", 4, 0},
        [6] = {"TOPLEFT", 3, "BOTTOM", 2, -4},
        [7] = {"LEFT", 6, "RIGHT", 4, 0},
    },
    [8] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"RIGHT", 1, "BOTTOMLEFT", -4, -2},
        [4] = {"TOP", 3, "BOTTOMLEFT", -2, -4},
        [5] = {"TOPLEFT", 3, "BOTTOMRIGHT", 4, -4},
        [6] = {"LEFT", 2, "BOTTOMRIGHT", 4, -2},
        [7] = {"TOP", 6, "BOTTOMRIGHT", 2, -4},
        [8] = {"TOPRIGHT", 6, "BOTTOMLEFT", -4, -4},
    },
    [9] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"LEFT", 2, "RIGHT", 4, 0},
        [4] = {"TOP", 1, "BOTTOMLEFT", -2, -4},
        [5] = {"TOP", 2, "BOTTOM", 0, -4},
        [6] = {"TOP", 3, "BOTTOMRIGHT", 2, -4},
        [7] = {"TOPRIGHT", 5, "BOTTOMLEFT", -4, -4},
        [8] = {"LEFT", 7, "RIGHT", 4, 0},
        [9] = {"LEFT", 8, "RIGHT", 4, 0},
    },
    [10] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"LEFT", 2, "RIGHT", 4, 0},
        [4] = {"TOPRIGHT", 1, "BOTTOM", -2, -4},
        [5] = {"LEFT", 4, "RIGHT", 4, 0},
        [6] = {"LEFT", 5, "RIGHT", 4, 0},
        [7] = {"LEFT", 6, "RIGHT", 4, 0},
        [8] = {"TOPLEFT", 4, "BOTTOM", 2, -4},
        [9] = {"LEFT", 8, "RIGHT", 4, 0},
        [10] = {"LEFT", 9, "RIGHT", 4, 0},
    },
    [11] = {
        [2] = {"LEFT", 1, "RIGHT", 4, 0},
        [3] = {"LEFT", 2, "RIGHT", 4, 0},
        [4] = {"LEFT", 3, "RIGHT", 4, 0},
        [5] = {"TOPLEFT", 1, "BOTTOM", 2, -4},
        [6] = {"LEFT", 5, "RIGHT", 4, 0},
        [7] = {"LEFT", 6, "RIGHT", 4, 0},
        [8] = {"TOPRIGHT", 5, "BOTTOM", -2, -4},
        [9] = {"LEFT", 8, "RIGHT", 4, 0},
        [10] = {"LEFT", 9, "RIGHT", 4, 0},
        [11] = {"LEFT", 10, "RIGHT", 4, 0},
    },
};

function M:SetFunnyArrange(bar)
    local name = bar:GetName();
    local db = self.db["ACTIONBAR"][name];

    if (db.num == 12) then
        self:SetLineArrange(bar, 3);
    else
        for id, pos in pairs(suite[db.num]) do
            bar.buttons[id]:ClearAllPoints();
            bar.buttons[id]:SetPoint(pos[1], bar.buttons[pos[2]], pos[3], pos[4], pos[5]);
        end
    end
end
--------------
-- 参数
-- VERTICAL         1   纵向
-- HORIZONTAL       2   横向
-- DOUBLE               3  双排(横向)
-- FUNNY                4   趣味排列
function M:UpdateArrage(bar)
    local name = bar:GetName();
    local db = self.db["ACTIONBAR"][name];
    if (InCombatLockdown()) then
        dwSecureCall(M.UpdateArrage, M, bar);
        return;
    end

    local arrnage = db.arrange or bar.arrange or self.AT.HORIZONTAL;
    if (arrnage == self.AT.VERTICAL) then
        self:SetLineArrange(bar, 1);
    elseif (arrnage == self.AT.HORIZONTAL) then
        self:SetLineArrange(bar, (db.num or bar.num));
    elseif (arrnage == self.AT.DOUBLE) then
        self:SetLineArrange(bar, ceil((db.num or bar.num)/2));
    elseif (arrnage == self.AT.FUNNY) then
        self:SetFunnyArrange(bar);
    end
end

function M:SaveInfo(mod, frame, var, value)
    local frame = frame or self.curf;
    local name = type(frame) == "string" and frame or frame:GetName();
    local mod = mod or self:FindMod(mod);

    self:UpdateCurProfile();

    if (not self.db[mod]) then
        self.db[mod] = {};
    end

    if (not self.db[mod][name]) then
        self.db[mod][name] = {};
    end

    if (var) then
        self.db[mod][name][var] = value;
    else
        self:debug("save all infomation");
    end
end

function M:GetInfo(mod, frame, var)
    local frame = frame or self.curf;
    local name = type(frame) == "string" and frame or frame:GetName();
    local mod = mod or self:FindMod(name);

    if (var) then
        if (not self.db) then
            self:UpdateCurProfile();
        end
        if (self.db[mod] and self.db[mod][name]) then
            return self.db[mod][name][var] or false;
        else
            self:debug("获得变量失败, 模块: %s  名字: %s  变量名: %s", mod, name, var);
            return false;
        end
    end
end
----------------
-- 接管
function M:TakeOver(frame)
    if (not frame.orgSetWidth) then
        self:TakeOverPosition(frame);
        frame.orgSetFrameLevel = frame.SetFrameLevel;
        frame.orgSetWidth = frame.SetWidth;
        frame.orgSetHeight = frame.SetHeight;
        frame.orgSetScale = frame.SetScale;

        frame.SetFrameLevel = NOOP_FUNC;
        frame.SetWidth = NOOP_FUNC;
        frame.SetHeight = NOOP_FUNC;
        frame.SetScale = NOOP_FUNC;
    end
end

----------------
-- 取消接管
function M:UnTakeOver(frame)
    if (frame.orgSetWidth) then
        self:UnTakeOverPosition(frame);
        frame.SetFrameLevel = frame.orgSetFrameLevel;
        frame.SetWidth = frame.orgSetWidth;
        frame.SetHeight = frame.orgSetHeight;
        frame.SetScale =  frame.orgSetScale;

        frame.orgSetFrameLevel = nil;
        frame.orgSetWidth = nil;
        frame.orgSetHeight = nil;
        frame.orgSetScale = nil;
    end
end

function M:TakeOverPosition(frame)
    if (not frame.orgSetPoint) then
        frame.orgSetPoint = frame.SetPoint;
        frame.orgClearAllPoints = frame.ClearAllPoints;
        frame.orgStartMoving = frame.StartMoving;
        frame.orgStartSizing = frame.StartSizing;

        frame.SetPoint = NOOP_FUNC;
        frame.ClearAllPoints = NOOP_FUNC;
        frame.StartMoving = NOOP_FUNC;
        frame.StartSizing = NOOP_FUNC;
    end
end

function M:UnTakeOverPosition(frame)
    if (frame.orgSetPoint) then
        frame.SetPoint = frame.orgSetPoint;
        frame.ClearAllPoints = frame.orgClearAllPoints;
        frame.StartMoving = frame.orgStartMoving;
        frame.StartSizing = frame.orgStartSizing;

        frame.orgSetPoint = nil;
        frame.orgClearAllPoints = nil;
        frame.orgStartMoving = nil;
        frame.orgStartSizing = nil;
    end
end

function M:TakeOverVisible(frame)
    if (not frame.orgShow) then
        frame.orgShow = frame.Show;
        frame.orgHide = frame.Hide;
        frame.orgSetAlpha = frame.SetAlpha;

        frame.Show = NOOP_FUNC;
        frame.Hide = NOOP_FUNC;
        frame.SetAlpha = NOOP_FUNC;
    end
end

function M:UnTakeOverVisible(frame)
    if (frame.orgShow) then
        frame.Show = frame.orgShow;
        frame.Hide = frame.orgHide;
        frame.SetAlpha = frame.orgSetAlpha;

        frame.orgShow = nil;
        frame.orgHide = nil;
        frame.orgSetAlpha = nil;
    end
end
-----------------------------
-- 注册模块
-----------------------------

----------------------
-- 主动作条
local function GetStateCommand()
    local header = "[bonusbar:5]11;";

    for i=2,6 do
        header = header .. format("[bar:%d]%d;", i, i);
    end
    header = header .. "[bonusbar:1,stealth]7;" ;

    for i=1,4 do
        header = header .. format('[bonusbar:%d]%d;', i, i+6);
    end

    return header .. "1";
end

function M:OnInitializedwMainBar()
    local bar = _G["dwMainBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwMainBar", M.parent, "DuowanMoveAnchorTemplate");
        CreateFrame("Frame","dwVehicleMenuBar", UIParent, "SecureFrameTemplate");
    end
    bar:SetParent(M.parent);
    bar.num = NUM_ACTIONBAR_BUTTONS;
    bar.buttons = {};
    for id=1,NUM_ACTIONBAR_BUTTONS do
        _G["ActionButton"..id]:SetParent(bar);
        bar.buttons[id] = _G["ActionButton"..id];
        _G["ActionButton"..id].origSetParent = _G["ActionButton"..id].SetParent;
        _G["ActionButton"..id].SetParent = NOOP_FUNC;
    end

    dwSecureCall(ActionButton1.ClearAllPoints, ActionButton1);
    dwSecureCall(ActionButton1.SetPoint, ActionButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);

    bar:Execute([[ActionButtons = table.new(self:GetChildren())]]);

    bar:SetAttribute('_onstate-actionpage', [[
        self:SetAttribute('actionpage', newstate);
        for i, button in pairs(ActionButtons) do
            if (strsub(button:GetName(), 0, 12) == "ActionButton") then
                button:SetAttribute('refresh', nil);
            end
        end
    ]]);

    -- 设置属性转换规则
    UnregisterStateDriver(dwMainBar, "actionpage")
    RegisterStateDriver(dwMainBar, "actionpage", GetStateCommand());
    -- 处理奖励动作条

    BonusActionBarFrame:UnregisterAllEvents();
    dwSecureCall(BonusActionBarFrame.Hide, BonusActionBarFrame);
    M:TakeOverVisible(BonusActionBarFrame);
    -- TODO: 处理载具条(还待研究)
    if VehicleMenuBar then
        VehicleMenuBar:SetParent(dwVehicleMenuBar);
        RegisterStateDriver(VehicleMenuBar, "visibility", "[target=vehicle,exists]show;hide");
        --RegisterStateDriver(dwMainBar, "visibility", "[target=vehicle,exists]hide;show");
    end
    dwAsynCall("tdCooldown2", "TCooldown_ShowActionBarCooldown");
    dwSecureCall(dwMainBar.Show, dwMainBar);
end

function M:OnUnregisterdwMainBar()
    -- 恢复父框架
    for id=1,NUM_ACTIONBAR_BUTTONS do
        _G["ActionButton"..id].SetParent = _G["ActionButton"..id].origSetParent;
        _G["ActionButton"..id].origSetParent = nil;
        _G["ActionButton"..id]:SetParent(MainMenuBarArtFrame);
        dwMainBar.buttons[id] =  nil;
    end
    -- 隐藏框架
    dwSecureCall(dwMainBar.Hide, dwMainBar);
    -- 恢复定位
    dwSecureCall(ActionButton1.ClearAllPoints, ActionButton1);
    dwSecureCall(ActionButton1.SetPoint, ActionButton1, "BOTTOMLEFT", MainMenuBarArtFrame, "BOTTOMLEFT", 8, 4);

    -- TODO: 处理奖励动作条
    M:UnTakeOverVisible(BonusActionBarFrame);
    BonusActionBarFrame:RegisterEvent("UPDATE_BONUS_ACTIONBAR");
    BonusActionBarFrame:RegisterEvent("ACTIONBAR_SHOWGRID");
    BonusActionBarFrame:RegisterEvent("ACTIONBAR_HIDEGRID");
    UnregisterStateDriver(dwMainBar, "visibility");
    UnregisterStateDriver(BonusActionBarFrame, "visibility");
end

-------------------------
-- 左下动作条
function M:OnInitializedwBottomLeftBar()
    local bar = _G["dwBottomLeftBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwBottomLeftBar", M.parent, "DuowanMoveAnchorTemplate");
    end

    bar.num = NUM_ACTIONBAR_BUTTONS;
    bar.buttons = {};
    for id=1,NUM_ACTIONBAR_BUTTONS do
        bar.buttons[id] = _G["MultiBarBottomLeftButton"..id];
        bar.buttons[id]:SetParent(bar);
    end
    bar:SetAttribute("actionpage", 6);
    --RegisterStateDriver(dwBottomLeftBar, "visibility", "[vehicleui]hide;show");
    dwSecureCall(MultiBarBottomLeftButton1.ClearAllPoints, MultiBarBottomLeftButton1);
    dwSecureCall(MultiBarBottomLeftButton1.SetPoint, MultiBarBottomLeftButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
    dwSecureCall(dwBottomLeftBar.Show, dwBottomLeftBar);
end

function M:OnUnregisterdwBottomLeftBar()
    MultiBarBottomLeft:SetParent(UIParent);
    for id=1,NUM_ACTIONBAR_BUTTONS do
        dwBottomLeftBar.buttons[id]:SetParent(MultiBarBottomLeft);
        dwBottomLeftBar.buttons[id] = nil;
    end
    -- 隐藏框架
    dwSecureCall(dwBottomLeftBar.Hide, dwBottomLeftBar);
    dwSecureCall(MultiBarBottomLeftButton1.ClearAllPoints, MultiBarBottomLeftButton1);
    dwSecureCall(MultiBarBottomLeftButton1.SetPoint, MultiBarBottomLeftButton1, "BOTTOMLEFT", MultiBarBottomLeft, "BOTTOMLEFT", 0, 0);
end
-------------------------
-- 右下动作条
function M:OnInitializedwBottomRightBar()
    local bar = _G["dwBottomRightBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwBottomRightBar", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = NUM_ACTIONBAR_BUTTONS;
    bar.buttons = {};
    for id=1,NUM_ACTIONBAR_BUTTONS do
        bar.buttons[id] = _G["MultiBarBottomRightButton"..id];
        bar.buttons[id]:SetParent(bar);
    end
    bar:SetAttribute("actionpage", 5);
    dwSecureCall(MultiBarBottomRightButton1.ClearAllPoints, MultiBarBottomRightButton1);
    dwSecureCall(MultiBarBottomRightButton1.SetPoint, MultiBarBottomRightButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
    dwSecureCall(dwBottomRightBar.Show, dwBottomRightBar);
end

function M:OnUnregisterdwBottomRightBar()
    MultiBarBottomRight:SetParent(UIParent);
    for id=1,NUM_ACTIONBAR_BUTTONS do
        dwBottomRightBar.buttons[id]:SetParent(MultiBarBottomRight);
        dwBottomRightBar.buttons[id] = nil;
    end

    -- 隐藏矿建
    dwSecureCall(dwBottomRightBar.Hide, dwBottomRightBar);
    dwSecureCall(MultiBarBottomRightButton1.ClearAllPoints, MultiBarBottomRightButton1);
    dwSecureCall(MultiBarBottomRightButton1.SetPoint, MultiBarBottomRightButton1, "BOTTOMLEFT", MultiBarBottomRight, "BOTTOMLEFT", 0, 0);
end
-------------------------
-- 右1动作条
function M:OnInitializedwRightBar1()
    local bar = _G["dwRightBar1"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwRightBar1", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = NUM_ACTIONBAR_BUTTONS;
    bar.buttons = {};
    for id=1,NUM_ACTIONBAR_BUTTONS do
        bar.buttons[id] = _G["MultiBarRightButton"..id];
        bar.buttons[id]:SetParent(bar);
    end
    bar:SetAttribute("actionpage", 3);
    dwSecureCall(MultiBarRightButton1.ClearAllPoints, MultiBarRightButton1);
    dwSecureCall(MultiBarRightButton1.SetPoint, MultiBarRightButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
    dwSecureCall(dwRightBar1.Show, dwRightBar1);
end

function M:OnUnregisterdwRightBar1()
    MultiBarRight:SetParent(UIParent);
    for id=1,NUM_ACTIONBAR_BUTTONS do
        dwRightBar1.buttons[id]:SetParent(MultiBarRight);
        dwRightBar1.buttons[id] = nil;
    end
    dwSecureCall(MultiBarRightButton1.ClearAllPoints, MultiBarRightButton1);
    dwSecureCall(MultiBarRightButton1.SetPoint, MultiBarRightButton1, "TOPRIGHT", MultiBarRight, "TOPRIGHT", 0, 0);
    -- 隐藏框架
    dwSecureCall(dwRightBar1.Hide, dwRightBar1);
end
-------------------------
-- 右2动作条
function M:OnInitializedwRightBar2()
    local bar = _G["dwRightBar2"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwRightBar2", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = NUM_ACTIONBAR_BUTTONS;
    bar.buttons = {};
    for id=1,NUM_ACTIONBAR_BUTTONS do
        dwRightBar2.buttons[id] = _G["MultiBarLeftButton"..id];
        bar.buttons[id]:SetParent(bar);
    end
    bar:SetAttribute("actionpage", 4);

    dwSecureCall(MultiBarLeftButton1.ClearAllPoints, MultiBarLeftButton1);
    dwSecureCall(MultiBarLeftButton1.SetPoint, MultiBarLeftButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
    dwSecureCall(dwRightBar2.Show, dwRightBar2);
end

function M:OnUnregisterdwRightBar2()
    MultiBarLeft:SetParent(UIParent);
    for id=1,NUM_ACTIONBAR_BUTTONS do
        dwRightBar2.buttons[id]:SetParent(MultiBarLeft);
        dwRightBar2.buttons[id] = nil;
    end
    -- 隐藏框架
    dwSecureCall(dwRightBar2.Hide, dwRightBar2);
    dwSecureCall(MultiBarLeftButton1.ClearAllPoints, MultiBarLeftButton1);
    dwSecureCall(MultiBarLeftButton1.SetPoint, MultiBarLeftButton1, "TOPRIGHT", MultiBarLeft, "TOPRIGHT", 0, 0);
end

function DuowanMove_ToggleShapshiftBarLayer(switch)
    if (switch) then
        AspectPosionBar:EnableDrawLayer("BACKGROUND");
        AspectPosionBar:EnableDrawLayer("BORDER");
    else
        AspectPosionBar:DisableDrawLayer("BACKGROUND");
        AspectPosionBar:DisableDrawLayer("BORDER");
    end
end
-------------------------
-- 姿态条
function M:OnInitializedwShapeShiftBar()
    local bar = _G["dwShapeShiftBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwShapeShiftBar", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = NUM_SHAPESHIFT_SLOTS;
    bar.buttons = {};
    ShapeshiftBarFrame:SetParent(bar);
    for id=1,NUM_SHAPESHIFT_SLOTS do
        dwShapeShiftBar.buttons[id] = _G["ShapeshiftButton"..id];
    end
    bar:RegisterEvent("SPELLS_CHANGED");
    bar:SetScript("OnEvent", function(self)
        local mod = M:FindMod("dwShapeShiftBar");
        M:SaveInfo(mod, "dwShapeShiftBar", "num", GetNumShapeshiftForms() or 1);
        M:UpdateFrame("dwShapeShiftBar", "ACTIONBAR");
    end);
    ShapeshiftBarFrame:DisableDrawLayer("BACKGROUND");
    ShapeshiftBarFrame:DisableDrawLayer("BORDER");

    dwSecureCall(ShapeshiftButton1.ClearAllPoints, ShapeshiftButton1);
    dwSecureCall(ShapeshiftButton1.SetPoint, ShapeshiftButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
    dwSecureCall(dwShapeShiftBar.Show, dwShapeShiftBar);
    M:TakeOver(ShapeshiftBarFrame);
    M:TakeOver(ShapeshiftButton1);
    -----------
    -- 处理毒药条
    --if (IsAddOnLoaded("AspectPosionBar") and AspectPosionBar_Jieguan) then
        dwAsynCall("AspectPosionBar", "AspectPosionBar_Jieguan", true);
        dwAsynCall("AspectPosionBar", "DuowanMove_ToggleShapshiftBarLayer", false);
    --end
end

function M:OnUnregisterdwShapeShiftBar()
    for id=1,NUM_SHAPESHIFT_SLOTS do
        ShapeshiftBarFrame:SetParent(MainMenuBar);
        dwShapeShiftBar.buttons[id] = nil;
    end
    -- 隐藏框架
    dwShapeShiftBar:UnregisterEvent("SPELLS_CHANGED");
    ShapeshiftBarFrame:EnableDrawLayer("BACKGROUND");
    ShapeshiftBarFrame:EnableDrawLayer("BORDER");
    dwSecureCall(dwShapeShiftBar.Hide, dwShapeShiftBar);
    M:UnTakeOver(ShapeshiftBarFrame);
    M:UnTakeOver(ShapeshiftButton1);
    dwSecureCall(ShapeshiftBarFrame.Show, ShapeshiftBarFrame);
    dwSecureCall(ShapeshiftButton1.ClearAllPoints, ShapeshiftButton1);
    dwSecureCall(ShapeshiftButton1.SetPoint, ShapeshiftButton1, "BOTTOMLEFT", ShapeshiftBarFrame, "BOTTOMLEFT", 10, 3);

    -----------
    -- 处理毒药条
    --if (IsAddOnLoaded("AspectPosionBar") and AspectPosionBar_Jieguan) then
        dwAsynCall("AspectPosionBar", "AspectPosionBar_Jieguan", false);
        dwAsynCall("AspectPosionBar", "DuowanMove_ToggleShapshiftBarLayer", true);
    --end
end

function M:OnUpdatedwShapeShiftBar(db, name)
    if (name == "dwShapeShiftBar" and db and not db.minimize) then
        local mod = M:FindMod(name);
        ShapeshiftBar_Update();

        if (GetNumShapeshiftForms() > 0) then
            M:SaveInfo(mod, "dwShapeShiftBar", "num", GetNumShapeshiftForms());
            M:UpdateActionBar(_G[name]);
        end
        local A = AspectPosionBarFrame;
        if (A and A.AspectBarUpdate) then
            A:AspectBarUpdate();
        end
    end
end

-------------------------
-- 宠物动作条
function M:OnInitializedwPlayerPetBar()
    PetActionBarFrameRePosition_Toggle(false);
    local bar = _G["dwPlayerPetBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwPlayerPetBar", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = NUM_PET_ACTION_SLOTS;
    bar.buttons = {};
    PetActionBarFrame:SetParent(bar);
    for id=1,NUM_PET_ACTION_SLOTS do
        bar.buttons[id] = _G["PetActionButton"..id];
        bar.buttons[id]:SetParent(bar);
    end

    PetActionBarFrame:DisableDrawLayer("OVERLAY");
    M:TakeOver(PetActionBarFrame);
    dwSecureCall(dwPlayerPetBar.Show, dwPlayerPetBar);
    dwSecureCall(PetActionButton1.ClearAllPoints, PetActionButton1);
    dwSecureCall(PetActionButton1.SetPoint, PetActionButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);
end

function M:OnUnregisterdwPlayerPetBar()
    PetActionBarFrame:SetParent(MainMenuBar);
    for id=1, NUM_PET_ACTION_SLOTS do
        dwPlayerPetBar.buttons[id]:SetParent(PetActionBarFrame);
        dwPlayerPetBar.buttons[id] = nil;
    end
    -- 隐藏框架
    PetActionBarFrame:EnableDrawLayer("OVERLAY");
    M:UnTakeOver(PetActionBarFrame);
    dwSecureCall(dwPlayerPetBar.Hide, dwPlayerPetBar);
    dwSecureCall(PetActionButton1.ClearAllPoints, PetActionButton1);
    dwSecureCall(PetActionButton1.SetPoint, PetActionButton1, "BOTTOMLEFT", PetActionBarFrame, "BOTTOMLEFT", 36, 2);
    PetActionBarFrameRePosition_Toggle(true);
    --dwSecureCall(PetActionBar_OnEvent, PetActionBarFrame, "PET_BAR_UPDATE");
end

function M:OnUpdatedwPlayerPetBar(db, name)
    if (name == "dwPlayerPetBar" and db and not db.minimize) then
        -- dwSecureCall(PetActionBar_OnEvent , PetActionBarFrame, "PET_BAR_UPDATE");
    end
end
-------------------------
-- 控制动作条
function M:OnInitializedwPossessBar()
    local bar = _G["dwPossessBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwPossessBar", M.parent, "DuowanMoveAnchorTemplate");
    end
    bar.num = 2;
    PossessBarFrame:SetParent(bar);
    bar.buttons = {};
    for id=1,2 do
        bar.buttons[id] = _G["PossessButton"..id];
        _G[bar.buttons[id]:GetName().."NormalTexture"]:SetWidth(52);
        _G[bar.buttons[id]:GetName().."NormalTexture"]:SetHeight(52);
        _G[bar.buttons[id]:GetName().."NormalTexture"]:SetPoint("CENTER");
        _G[bar.buttons[id]:GetName().."Cooldown"]:SetAlpha(0);
    end
    RegisterStateDriver(dwPossessBar, "visibility", "[target=vehicle,exists][bonusbar:5]show;hide")
    PossessBarFrame:DisableDrawLayer("BACKGROUND");
    PossessBarFrame:DisableDrawLayer("BORDER");
    M:TakeOver(PossessBarFrame);
    dwSecureCall(dwPossessBar.Show, dwPossessBar);
    dwSecureCall(PossessButton1.ClearAllPoints, PossessButton1);
    dwSecureCall(PossessButton1.SetPoint, PossessButton1, "TOPLEFT", bar, "TOPLEFT", 0, 0);

end

function M:OnUnregisterdwPossessBar()
    PossessBarFrame:SetParent(MainMenuBar);
    for id=1,2 do
        dwPossessBar.buttons[id] = nil;
    end
    UnregisterStateDriver(dwPossessBar, "visibility")
    PossessBarFrame:EnableDrawLayer("BACKGROUND");
    PossessBarFrame:EnableDrawLayer("BORDER");
    M:UnTakeOver(PossessBarFrame);
    dwSecureCall(dwPossessBar.Hide, dwPossessBar);
    dwSecureCall(PossessButton1.ClearAllPoints, PossessButton1);
    dwSecureCall(PossessButton1.SetPoint, PossessButton1, "BOTTOMLEFT", PossessBarFrame, "BOTTOMLEFT", 10, 3);
end

function M:OnUpdatedwPossessBar(db, name)
    if (name == "dwPossessBar" and db and not db.minimize) then
        PossessBar_Update();
        if (dwShapeShiftBar) then
            dwSecureCall(dwPossessBar.ClearAllPoints, dwPossessBar);
            dwSecureCall(dwPossessBar.SetPoint, dwPossessBar, "TOPLEFT", dwShapeShiftBar, "TOPLEFT", 0, 0);
        end
    end
end
-------------------------
--载具动作条
CreateFrame("Frame","dwVehicleBar",UIParent,"SecureFrameTemplate");
local OnMainMenuBarHide = function(self)
    if MainMenuBar.state == "vehicle" then
        dwSetScale(dwMenuBar, 1);
        M:UnhookMenuBar();
        M:UpdateActionBar(dwMenuBar, DUOWANMOVE_DEFAULT_DB["_themes"]["default"]["ACTIONBAR"]["dwMenuBar"]);
    end
end

local OnVehicleMenuBarHide = function(self)
    if dwVehicleBar.state == "vehicle" then
        dwVehicleBar.state = "player"
    end
end

function M:MainMenuBar_ToVehicleArt(...)
    dwVehicleBar.state = "vehicle";
    dwMenuBar:SetFrameLevel(VehicleMenuBar:GetFrameLevel() + 5);
    M:HookMenuBar();
end

do
    local function updateMenuBar()
        --M:UpdateFrame("dwMenuBar", "ACTIONBAR");
        local  db = M.db["ACTIONBAR"]["dwMenuBar"];
        dwSetScale(dwMenuBar, db.scale);
        M:UpdateActionBar(dwMenuBar, db);
        local pos = db.pos;
        dwMenuBar:ClearAllPoints();
        dwMenuBar:SetPoint(pos[1], "UIParent", pos[3], pos[4], pos[5]);
    end
    function M:MainMenuBar_ToPlayerArt(...)
        M:UnhookMenuBar();
        M:InitdwMenuBar();
        if (MainMenu and MainMenu.AjustMainMenu) then
            MainMenu:AjustMainMenu();
        end
        dwSecureCall(updateMenuBar);
    end
end

function M:OnInitializeVehicleBar()
    if (dwMenuBar) then
        if (not self:IsHooked("MainMenuBar_ToVehicleArt")) then
            self:SecureHook(MainMenuBar, "Hide", OnMainMenuBarHide);
            self:SecureHook(VehicleMenuBar, "Hide", OnVehicleMenuBarHide);
            self:SecureHook("MainMenuBar_ToVehicleArt");
            self:SecureHook("MainMenuBar_ToPlayerArt");
        end
    end
    RegisterStateDriver(M.parent, "visibility", "[target=vehicle,exists]hide;show");
end

function M:OnUnregisterVehicleBar()
    if (dwMenuBar) then
        if (self:IsHooked("MainMenuBar_ToVehicleArt")) then
            self:Unhook(MainMenuBar, "Hide");
            self:Unhook(VehicleMenuBar, "Hide");
            self:Unhook("MainMenuBar_ToVehicleArt");
            self:Unhook("MainMenuBar_ToPlayerArt");
        end
    end
    UnregisterStateDriver(self.parent, "visibility");
end
-------------------------
-- 菜单条
local microbuttons = {
    "CharacterMicroButton",
    "SpellbookMicroButton",
    "TalentMicroButton",
    "AchievementMicroButton",
    "QuestLogMicroButton",
    "SocialsMicroButton",
    "PVPMicroButton",
    "LFGMicroButton",
    "MainMenuMicroButton",
    "HelpMicroButton",
    "MainMenuBarPageButton"
};

function M:HookMenuBar()
    for id, bn in ipairs(microbuttons) do
        if (_G[bn]) then
            M:TakeOver(_G[bn]);
        end
    end
end

function M:UnhookMenuBar()
    for id, bn in ipairs(microbuttons) do
        if (_G[bn]) then
            M:UnTakeOver(_G[bn]);
        end
    end
end

function M:InitdwMenuBar()
    M:UnTakeOver(CharacterMicroButton);
    dwSecureCall(CharacterMicroButton.ClearAllPoints, CharacterMicroButton);
    dwSecureCall(CharacterMicroButton.SetPoint, CharacterMicroButton, "TOPLEFT", "dwMenuBar", "TOPLEFT", 0, 20);
    M:TakeOver(CharacterMicroButton);
end

function M:OnInitializedwMenuBar()
    local bar = _G["dwMenuBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwMenuBar", UIParent, "DuowanMoveAnchorTemplate");
    end

    bar.num = #(microbuttons);
    bar.buttons = {};
    for id, bn in ipairs(microbuttons) do
        bar.buttons[id] = _G[bn];
        _G[bn]:SetParent(bar);
        _G[bn].oldSetParent = _G[bn].SetParent;
        _G[bn].SetParent = NOOP_FUNC;
    end
    M:InitdwMenuBar(bar);
    MainMenuBar:Hide();
    MainMenuBar.orgShow = MainMenuBar.Show;
    MainMenuBar.Show = NOOP_FUNC;
    ------------------
    -- TODO：载具工具条
     M:OnInitializeVehicleBar();
end

function M:OnUnregisterdwMenuBar()
    ----------
    -- TODO：载具工具条
     M:OnUnregisterVehicleBar();
    for id, bn in ipairs(microbuttons) do
        _G[bn].SetParent = oldSetParent;
        _G[bn].oldSetParent = nil;

        _G[bn]:SetParent(MainMenuBarArtFrame);
        dwMenuBar.buttons[id] = nil;
    end
    dwMenuBar:UnregisterAllEvents();
    UpdateTalentButton = orgUpdateTalentButton;
    orgUpdateTalentButton = nil;
    AchievementMicroButton_Update = orgAchievementMicroButton_Update;
    orgAchievementMicroButton_Update = nil;
    M:UnTakeOver(CharacterMicroButton);
    dwSecureCall(CharacterMicroButton.ClearAllPoints, CharacterMicroButton);
    dwSecureCall(CharacterMicroButton.SetPoint, CharacterMicroButton, "TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 552, 8);
    MainMenuBar.Show = MainMenuBar.orgShow;
    MainMenuBar.orgShow = nil;
    MainMenuBar:Show();
    ---------------
    -- 针对多玩菜单条调整
    if (MainMenu and MainMenu.AjustMainMenu) then
        MainMenu:AjustMainMenu();
    end
end
-------------------------
-- 背包条
local bags = {
    KeyRingButton,
    MainMenuBarBackpackButton,
    CharacterBag0Slot,
    CharacterBag1Slot,
    CharacterBag2Slot,
    CharacterBag3Slot,
};
function M:OnInitializedwBagBar()
    local bar = _G["dwBagBar"];
    if (not bar) then
        bar = CreateFrame("Frame", "dwBagBar", M.parent, "DuowanMoveAnchorTemplate");
    end

    bar.num = 6;
    bar.buttons = {};
    bags[1]:SetParent(bar);
    bar.buttons[1] = bags[1];
    for id=2, 6 do
        bags[id]:SetWidth(37);
        bags[id]:SetHeight(37);
        bags[id]:SetParent(bar);
        bar.buttons[id] = bags[id];
    end

    dwSecureCall(KeyRingButton.ClearAllPoints, KeyRingButton);
    dwSecureCall(KeyRingButton.SetPoint, KeyRingButton, "TOPRIGHT", bar, "TOPRIGHT", 0, 0);
end

function M:OnUnregisterdwBagBar()
    for i=1, 2 do
        bags[i]:SetParent(MainMenuBarArtFrame);
        dwBagBar.buttons[i] = nil;
        dwSecureCall(bags[i].ClearAllPoints, bags[i]);
    end

    for id=3, 6 do
        bags[id]:SetWidth(30);
        bags[id]:SetHeight(30);
        bags[id]:SetParent(MainMenuBarArtFrame);
        dwBagBar.buttons[id] = nil;
        dwSecureCall(bags[id].ClearAllPoints, bags[id]);
    end

    dwSecureCall(MainMenuBarBackpackButton.SetPoint, MainMenuBarBackpackButton, "BOTTOMRIGHT", MainMenuBarArtFrame, "BOTTOMRIGHT", -6, 2);
    dwSecureCall(CharacterBag0Slot.SetPoint, CharacterBag0Slot, "RIGHT", MainMenuBarBackpackButton, "LEFT", -5, 0);
    dwSecureCall(CharacterBag1Slot.SetPoint, CharacterBag1Slot, "RIGHT", CharacterBag0Slot, "LEFT", -4, 0);
    dwSecureCall(CharacterBag2Slot.SetPoint, CharacterBag2Slot, "RIGHT", CharacterBag1Slot, "LEFT", -4, 0);
    dwSecureCall(CharacterBag3Slot.SetPoint, CharacterBag3Slot, "RIGHT", CharacterBag2Slot, "LEFT", -4, 0);
    dwSecureCall(KeyRingButton.SetPoint, KeyRingButton, "RIGHT", CharacterBag3Slot, "LEFT", -6, 0);
end

--==============
-- 单位框架
--==============
----------------------
-- 玩家头像框架
function M:OnInitializedwUnitPlayerFrame()
    local frame = _G["dwUnitPlayerFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwUnitPlayerFrame", UIParent, "DuowanMoveAnchorTemplate");
    end

    PlayerFrame:SetParent(frame);
    dwSecureCall(dwUnitPlayerFrame.Show, dwUnitPlayerFrame);
    dwSecureCall(PlayerFrame.ClearAllPoints, PlayerFrame);
    dwSecureCall(PlayerFrame.SetPoint, PlayerFrame, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    M:TakeOver(PlayerFrame);
end

function M:OnUnregisterdwUnitPlayerFrame()
    PlayerFrame:SetParent(UIParent);
    dwSecureCall(dwUnitPlayerFrame.Hide, dwUnitPlayerFrame);
    M:UnTakeOver(PlayerFrame);
    dwSecureCall(PlayerFrame.ClearAllPoints, PlayerFrame);
    if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
        local height = -TitanPanelBarButton:GetHeight() - 4;
        dwSecureCall(PlayerFrame.SetPoint, PlayerFrame, "TOPLEFT", UIParent, "TOPLEFT", -19, height);
    else
        dwSecureCall(PlayerFrame.SetPoint, PlayerFrame, "TOPLEFT", UIParent, "TOPLEFT", -19, -4);
    end
end
-------------------
-- 目标框架
function M:OnInitializedwUnitTargetFrame()
    local frame = _G["dwUnitTargetFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwUnitTargetFrame", UIParent, "DuowanMoveAnchorTemplate");
    end

    TargetFrame:SetParent(frame);
    dwSecureCall(dwUnitTargetFrame.Show, dwUnitTargetFrame);
    dwSecureCall(TargetFrame.ClearAllPoints, TargetFrame);
    dwSecureCall(TargetFrame.SetPoint, TargetFrame, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    dwSecureCall(TargetFrame.SetPoint, TargetFrame, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0);
    M:TakeOver(TargetFrame);
end

function M:OnUnregisterdwUnitTargetFrame()
    TargetFrame:SetParent(UIParent);
    dwSecureCall(dwUnitTargetFrame.Hide, dwUnitTargetFrame);
    M:UnTakeOver(TargetFrame);
    dwSecureCall(TargetFrame.ClearAllPoints, TargetFrame);
    if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
        local height = -TitanPanelBarButton:GetHeight() - 4;
        dwSecureCall(TargetFrame.SetPoint, TargetFrame, "TOPLEFT", UIParent, "TOPLEFT", 370, height);
    else
        dwSecureCall(TargetFrame.SetPoint, TargetFrame, "TOPLEFT", UIParent, "TOPLEFT", 370, -4);
    end
end

---------------------------
-- 队友框架
function M:OnInitializedwUnitPartyFrame()
    local frame = _G["dwUnitPartyFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwUnitPartyFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    for i=1, 4 do
        _G["PartyMemberFrame" .. i]:SetParent(frame);
    end
    dwSecureCall(dwUnitPartyFrame.Show, dwUnitPartyFrame);
    dwSecureCall(PartyMemberFrame1.ClearAllPoints, PartyMemberFrame1);
    dwSecureCall(PartyMemberFrame1.SetPoint, PartyMemberFrame1, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    M:TakeOver(PartyMemberFrame1);
end

function M:OnUnregisterdwUnitPartyFrame()
    for i=1, 4 do
        _G["PartyMemberFrame" .. i]:SetParent(UIParent);
    end
    dwSecureCall(dwUnitPartyFrame.Hide, dwUnitPartyFrame);
    M:UnTakeOver(PartyMemberFrame1);
    dwSecureCall(PartyMemberFrame1.ClearAllPoints, PartyMemberFrame1);
    if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
        local height = -TitanPanelBarButton:GetHeight() - 160;
        dwSecureCall(PartyMemberFrame1.SetPoint, PartyMemberFrame1, "TOPLEFT", UIParent, "TOPLEFT", 10, height);
    else
        dwSecureCall(PartyMemberFrame1.SetPoint, PartyMemberFrame1, "TOPLEFT", UIParent, "TOPLEFT", 10, -160);
    end
end

-----------------------
-- 系统焦点框架
function M:OnInitializedwUnitFocusFrame()
    local frame = _G["dwUnitFocusFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwUnitFocusFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    FocusFrame:SetParent(frame);

    dwSecureCall(dwUnitFocusFrame.Show, dwUnitFocusFrame);
    dwSecureCall(FocusFrame.ClearAllPoints, FocusFrame);
    dwSecureCall(FocusFrame.SetPoint, FocusFrame, "TOPLEFT", frame, "TOPLEFT", 0, 0);
end

function M:OnUnregisterdwUnitFocusFrame()
    FocusFrame:SetParent(UIParent);
    dwSecureCall(dwUnitFocusFrame.Hide, dwUnitFocusFrame);
    dwSecureCall(FocusFrame.ClearAllPoints, FocusFrame);
    dwSecureCall(FocusFrame.SetPoint, FocusFrame, "TOPLEFT", UIParent, "TOPLEFT", 12, -420);
end
--------------------------
-- 小地图
function M:OnInitializedwMiniMapFrame()
    local frame = _G["dwMiniMapFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwMiniMapFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    MinimapCluster:SetParent(frame);
    dwSecureCall(dwMiniMapFrame.Show, dwMiniMapFrame);
    dwSecureCall(MinimapCluster.ClearAllPoints, MinimapCluster);
    dwSecureCall(MinimapCluster.SetPoint, MinimapCluster, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    M:TakeOver(MinimapCluster);
end

function M:OnUnregisterdwMiniMapFrame()
    MinimapCluster:SetParent(UIParent);
    M:UnTakeOver(MinimapCluster);
    dwSecureCall(dwMiniMapFrame.Hide, dwMiniMapFrame);
    dwSecureCall(MinimapCluster.ClearAllPoints, MinimapCluster);
    if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
        local height = -TitanPanelBarButton:GetHeight() - 6;
        dwSecureCall(MinimapCluster.SetPoint, MinimapCluster, "TOPRIGHT", UIParent, "TOPRIGHT", 0, height);
    else
        dwSecureCall(MinimapCluster.SetPoint, MinimapCluster, "TOPRIGHT", UIParent, "TOPRIGHT", 0, 0);
    end
end
--------------------------
-- BUFF框架
function M:OnInitializedwBuffFrame()
    local frame = _G["dwBuffFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwBuffFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    BuffFrame:SetParent(frame);
    TemporaryEnchantFrame:SetParent(frame);
    dwSecureCall(dwBuffFrame.Show, dwBuffFrame);
    dwSecureCall(BuffFrame.ClearAllPoints, BuffFrame);
    dwSecureCall(TemporaryEnchantFrame.ClearAllPoints, TemporaryEnchantFrame);

    dwSecureCall(BuffFrame.SetPoint, BuffFrame, "TOPRIGHT", frame, "TOPRIGHT", 0, 0);
    dwSecureCall(TemporaryEnchantFrame.SetPoint, TemporaryEnchantFrame, "TOPRIGHT", frame, "TOPRIGHT", 0, 0);
    M:TakeOverPosition(TemporaryEnchantFrame);
end

function M:OnUnregisterdwBuffFrame()
    BuffFrame:SetParent(UIParent);
    TemporaryEnchantFrame:SetParent(UIParent);
    dwSecureCall(dwBuffFrame.Hide, dwBuffFrame);
    M:UnTakeOverPosition(TemporaryEnchantFrame);
    dwSecureCall(BuffFrame.ClearAllPoints, BuffFrame);
    dwSecureCall(TemporaryEnchantFrame.ClearAllPoints, TemporaryEnchantFrame);
    if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
        local height = -TitanPanelBarButton:GetHeight() - 13;
        dwSecureCall(BuffFrame.SetPoint, BuffFrame, "TOPRIGHT", UIParent, "TOPRIGHT", -205, height);
        dwSecureCall(TemporaryEnchantFrame.SetPoint, TemporaryEnchantFrame, "TOPRIGHT", UIParent, "TOPRIGHT", -180, height);
    else
        dwSecureCall(BuffFrame.SetPoint, BuffFrame, "TOPRIGHT", UIParent, "TOPRIGHT", -205, -13);
        dwSecureCall(TemporaryEnchantFrame.SetPoint, TemporaryEnchantFrame, "TOPRIGHT", UIParent, "TOPRIGHT", -180,-13);
    end
end
--------------------------
-- 耐久度面板
function M:OnInitializedwDurabilityFrame()
    local frame = _G["dwDurabilityFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwDurabilityFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    DurabilityFrame:SetParent(frame);

    dwSecureCall(dwDurabilityFrame.Show, dwDurabilityFrame);
    dwSecureCall(DurabilityFrame.ClearAllPoints, DurabilityFrame);
    dwSecureCall(DurabilityFrame.SetPoint, DurabilityFrame, "TOPLEFT", frame, "TOPLEFT", 0, 0);
end

function M:OnUnregisterdwDurabilityFrame()
    DurabilityFrame:SetParent(UIParent);

    dwSecureCall(dwDurabilityFrame.Hide, dwDurabilityFrame);
    dwSecureCall(DurabilityFrame.ClearAllPoints, DurabilityFrame);
    dwSecureCall(DurabilityFrame.SetPoint, DurabilityFrame, "TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 40, 15);
end
--------------------------
-- 施法条
function M:OnInitializedwCastBarFrame()
    local frame = _G["dwCastBarFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwCastBarFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    CastingBarFrame:SetParent(frame);
    dwSecureCall(dwCastBarFrame.Show, dwCastBarFrame);
    dwSecureCall(CastingBarFrame.ClearAllPoints, CastingBarFrame);
    dwSecureCall(CastingBarFrame.SetPoint, CastingBarFrame, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    M:TakeOver(CastingBarFrame);
end

function M:OnUnregisterdwCastBarFrame()
    CastingBarFrame:SetParent(UIParent);

    dwSecureCall(dwCastBarFrame.Hide, dwCastBarFrame);
    dwSecureCall(CastingBarFrame.ClearAllPoints, CastingBarFrame);
    dwSecureCall(CastingBarFrame.SetPoint, CastingBarFrame, "BOTTOM", UIParent, "BOTTOM", 0, 55);
end
--------------------------
-- 镜像条
function M:OnInitializedwMirrorTimerFrame()
    local frame = _G["dwMirrorTimerFrame"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwMirrorTimerFrame", UIParent, "DuowanMoveAnchorTemplate");
    end
    MirrorTimer1:SetParent(frame);
    MirrorTimer2:SetParent(frame);
    MirrorTimer3:SetParent(frame);

    dwSecureCall(dwMirrorTimerFrame.Show, dwMirrorTimerFrame);
    dwSecureCall(MirrorTimer1.ClearAllPoints, MirrorTimer1);
    dwSecureCall(MirrorTimer1.SetPoint, MirrorTimer1, "TOPLEFT", frame, "TOPLEFT", 0, 0);
end

function M:OnUnregisterdwMirrorTimerFrame()
    MirrorTimer1:SetParent(UIParent);
    MirrorTimer2:SetParent(UIParent);
    MirrorTimer3:SetParent(UIParent);
    dwSecureCall(dwMirrorTimerFrame.Hide, dwMirrorTimerFrame);
    dwSecureCall(MirrorTimer1.ClearAllPoints, MirrorTimer1);
    dwSecureCall(MirrorTimer1.SetPoint, MirrorTimer1, "TOP", UIParent, "TOP", 0, -96);
end
--------------------------
-- 经验条
local list = {
    "MainMenuXPBarTexture",
    "MainMenuMaxLevelBar",
    "ReputationWatchBarTexture",
    "ReputationXPBarTexture",
};

function M:OndwExBarWidthChange(width)
    for id, name in ipairs(list) do
        _G[name.."0"]:SetWidth(width / 4);
        _G[name.."1"]:SetWidth(width / 4);
        _G[name.."2"]:SetWidth(width / 4);
        _G[name.."3"]:SetWidth(width / 4);
    end
end
function M:OnInitializedwExBar()
    local frame = _G["dwExBar"];
    if (not frame) then
        frame = CreateFrame("Frame", "dwExBar", UIParent, "DuowanMoveAnchorTemplate");
    end
    MainMenuExpBar:SetParent(frame);
    ReputationWatchBar:SetParent(frame);
    local name, reaction, mini, max, value = GetWatchedFactionInfo();
    if (name) then
        ReputationWatchBar:Show();
    end
    MainMenuExpBar:Show();
    dwSecureCall(dwExBar.Show, dwExBar);
    dwSecureCall(MainMenuExpBar.ClearAllPoints, MainMenuExpBar);
    dwSecureCall(MainMenuExpBar.SetPoint, MainMenuExpBar, "TOPLEFT", frame, "TOPLEFT", 0, 0);
    dwSecureCall(ReputationWatchBar.ClearAllPoints, ReputationWatchBar);
    dwSecureCall(ReputationWatchBar.SetPoint, ReputationWatchBar, "TOPLEFT", frame, "TOPLEFT", 0, -13);
    dwSecureCall(_G["dwExBarTab"].ClearAllPoints, _G["dwExBarTab"]);
    dwSecureCall(_G["dwExBarTab"].SetPoint, _G["dwExBarTab"], "BOTTOM", frame, "TOP", 0, 2);

    for id, name in ipairs(list) do
        for i = 0, 3 do
            if name ~= "ReputationWatchBarTexture" then
                _G[name..i]:SetHeight(13);
            end
            _G[name..i]:ClearAllPoints();
        end
        _G[name.."0"]:SetPoint("LEFT");
        _G[name.."1"]:SetPoint("LEFT", name.."0","RIGHT");
        _G[name.."2"]:SetPoint("RIGHT", name.."3","LEFT");
        _G[name.."3"]:SetPoint("RIGHT");
    end
    M:TakeOver(ReputationWatchBar);
end

function M:OnUnregisterdwExBar()
    MainMenuExpBar:SetParent(MainMenuBar);
    dwSecureCall(dwExBar.Hide, dwExBar);
    M:UnTakeOver(ReputationWatchBar);
    dwSecureCall(MainMenuExpBar.ClearAllPoints, MainMenuExpBar);
    dwSecureCall(MainMenuExpBar.SetPoint, MainMenuExpBar, "TOP", MainMenuBar, "TOP", 0, 0);
    dwSecureCall(ReputationWatchBar.ClearAllPoints, ReputationWatchBar);
    dwSecureCall(ReputationWatchBar.SetPoint, ReputationWatchBar, "BOTTOM", MainMenuBar, "TOP", 0, -3);
    ReputationWatchBar_Update();
end

--------------------------------
--  配置菜单项
--------------------------------
local BarMapBinding = {
    dwMainBar = "ACTIONBUTTON1",
    dwBottomLeftBar = "MULTIACTIONBAR1BUTTON1",
    dwBottomRightBar = "MULTIACTIONBAR2BUTTON1",
    dwRightBar1 = "MULTIACTIONBAR3BUTTON1",
    dwRightBar2 = "MULTIACTIONBAR4BUTTON1",
    dwShapeShiftBar = "SHAPESHIFTBUTTON1",
    --dwExtraBar1 = "HEADER_DWEXTERBAR1",
    --dwExtraBar2 = "HEADER_DWEXTERBAR2",
    --dwExtraBar3 = "HEADER_DWEXTERBAR3",
    --dwExtraBar4 = "HEADER_DWEXTERBAR4",
    --dwExtraBar5 = "HEADER_DWEXTERBAR5",
};

function M:UpdateAllGrid()
    for bar, _ in pairs(BarMapBinding) do
        if (bar and _G[bar]) then
            self:UpdateGrid(_G[bar]);
        end
    end
end
function M:CanBind(name)
    return BarMapBinding[name] and true or false;
end

function M:ShowKeyBinding(barName)
    -- TODO:
    local name = BarMapBinding[barName]
    if (name) then
        dwShowKeyBindingFrame(name);
    else
        self:debug("%s has not binding keys", barName);
    end
end

function M:GetMaxNumber(bar)
    local bar = bar or self.curf;
    local mod = self:FindMod(bar:GetName());
    local num = self:GetInfo(mod, bar, "num");
    return min(bar.num, #(bar.buttons));
end

function M:IncreaseBarButton(bar)
    local bar = bar or self.curf;
    local mod = self:FindMod(bar:GetName());
    local num = self:GetInfo(mod, bar, "num");
    local maxnum = min(bar.num, #(bar.buttons));
    if (num < maxnum) then
        self:SaveInfo(mod, bar, "num", (num + 1));
    end
end

function M:DecreaseBarButton(bar)
    local bar = bar or self.curf;
    local mod = self:FindMod(bar:GetName());
    local num = self:GetInfo(mod, bar, "num");
    if (num > 2) then
        self:SaveInfo(mod, bar, "num", (num - 1));
    end
end

function M:MinimizeButtons(bar, bool)
    local name = bar:GetName();
    if (bool) then
        M:SaveInfo("ACTIONBAR", name, "minimize", true);
        for _, button in ipairs(bar.buttons) do
            button:SetAttribute("statehidden", true);
        end
    else
        M:SaveInfo("ACTIONBAR", name, "minimize", false);
        for _, button in ipairs(bar.buttons) do
            button:SetAttribute("statehidden", false);
        end
    end
    M:UpdateFrame(name, "ACTIONBAR");
end

function M:UpdateOptions()
    if (self.curf) then
        local frame = self.curf;
        local name = frame:GetName();
        local mod = self:FindMod(name);

        self.options1 = {};
        self.options1.type = "group";
        self.options1.handler = DuowanMove;
        self.options1.args = {};
        self.options1.args.General = {type = "header", name = L["基本选项"], order = 1,};
        self.options1.args.Lock = {
            type = "execute",
            name = L["锁定模块"],
            desc = L["锁定模块的位置"],
            hidden = function()
                return not M:GetInfo(mod, name, "move");
            end,
            func = function()
                M:SaveInfo(mod, name, "move", false);
                M:UpdateFrame(name, mod);
                dew:Close();
            end,
            order = 101,
        };
        self.options1.args.Unlock = {
            type = "execute",
            name = L["解锁模块"],
            desc = L["解锁模块位置"],
            hidden = function()
                return M:GetInfo(mod, name, "move");
            end,
            func = function()
                M:SaveInfo(mod, name, "move", true);
                M:UpdateFrame(name, mod);
                dew:Close();
            end,
            order = 102,
        };
        if (mod == "ACTIONBAR" and name ~= "dwMultiCastBar") then
            self.options1.args.Minimize = {
                type = "execute",
                name = L["最小化模块"],
                desc = L["最小化模块到只剩标题头"],
                hidden = function()
                    return M:GetInfo(mod, name, "minimize");
                end,
                func = function()
                    M:MinimizeButtons(frame, true);
                    dew:Close();
                end,
                order = 103,
            };
            self.options1.args.UnMinimize = {
                type = "execute",
                name = L["恢复模块"],
                desc = L["恢复模块到原来的外观"],
                hidden = function()
                    return not M:GetInfo(mod, name, "minimize");
                end,
                func = function()
                    M:MinimizeButtons(frame, false);
                    dew:Close();
                end,
                order = 104,
            };
        end
        if (self:CanBind(name)) then
            self.options1.args.binding = {
                type = "execute",
                name = L["绑定按键"],
                desc = L["为该动作条绑定按键"],
                hidden = false,
                func = function()
                    M:ShowKeyBinding(name);
                    dew:Close();
                end,
                order = 105,
            };
        end
        self.options1.args.Hide = {
            type = "execute",
            name = L["隐藏模块"],
            desc = L["隐藏选中的模块"],
            hidden = function()
                return not M:GetInfo(mod, name, "visible");
            end,
            func = function()
                M:SaveInfo(mod, name, "visible", false);
                M:UpdateFrame(name, mod);
                dew:Close();
            end,
            order = 106,
        };
        if (mod == "ACTIONBAR" and name ~= "dwMultiCastBar") then
            self.options1.args.Arrange = {
                type = "header",
                name = L["排列方式"],
                order = 200,
            };
            self.options1.args.Vertical = {
                type = "execute",
                name = L["竖向排列"],
                desc = L["按照垂直方向排列"],
                hidden = function()
                    return M:GetInfo(mod, name, "arrange") == M.AT.VERTICAL;
                end,
                func = function()
                    M:SaveInfo(mod, name, "arrange", M.AT.VERTICAL);
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 201,
            };
            self.options1.args.Horizontal = {
                type = "execute",
                name = L["横向排列"],
                desc = L["按照水平方向排列"],
                hidden = function()
                    return M:GetInfo(mod, name, "arrange") == M.AT.HORIZONTAL;
                end,
                func = function()
                    M:SaveInfo(mod, name, "arrange", M.AT.HORIZONTAL);
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 202,
            };
            self.options1.args.Double = {
                type = "execute",
                name = L["双行排列"],
                desc = L["排列为两行"],
                hidden = function()
                    return M:GetInfo(mod, name, "arrange") == M.AT.DOUBLE;
                end,
                func = function()
                    M:SaveInfo(mod, name, "arrange", M.AT.DOUBLE);
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 203,
            };
            self.options1.args.Funny = {
                type = "execute",
                name = L["趣味排列"],
                desc = L["非同寻常的排列方式"],
                hidden = function()
                    return M:GetInfo(mod, name, "arrange") == M.AT.FUNNY;
                end,
                func = function()
                    M:SaveInfo(mod, name, "arrange", M.AT.FUNNY);
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 204,
            };
            self.options1.args.ActionButton = {
                type = "header",
                name = L["按键操作"],
                order = 300,
            };
            self.options1.args.Increase = {
                type = "execute",
                name = L["增加按键"],
                desc = L["增加动作条的按键数量"],
                disabled = function()
                    return M:GetInfo(mod, name, "num") == M:GetMaxNumber();
                end,
                func = function()
                    M:IncreaseBarButton();
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 301,
            };
            self.options1.args.Decrease = {
                type = "execute",
                name = L["减少按键"],
                desc = L["减少动作条的按键数量"],
                disabled = function()
                    return M:GetInfo(mod, name, "num") == 2;
                end,
                func = function()
                    M:DecreaseBarButton();
                    M:UpdateFrame(name, mod);
                    dew:Close();
                end,
                order = 302,
            };
            self.options1.args.Space = {
                type = "range",
                name = L["按键间距"],
                desc = L["设置按键之间的间距"],
                get = function()
                    return M:GetInfo(mod, name, "space");
                end,
                set = function(v)
                    M:SaveInfo(mod, name, "space", v);
                    M:UpdateFrame(name, mod);
                end,
                min = -10,
                max = 100,
                step = 1,
                order = 303,
            };
        end
        self.options1.args.Other = {
            type = "header",
            name = L["其他操作"],
            order = 400,
        };
        self.options1.args.Scale = {
            type = "range",
            name = L["缩放比例"],
            desc = L["设置模块的比例"],
            get = function()
                return M:GetInfo(mod, name, "scale");
            end,
            set = function(v)
                M:SaveInfo(mod, name, "scale", v);
                M:UpdateFrameScale(mod, frame)
            end,
            min = 0.5,
            max = 2,
            step = 0.05,
            isPercent = true,
            order = 401,
        };
        if (name == "dwExBar") then
            self.options1.args.Width = {
                type = "range",
                name = L["改变长度"],
                desc = L["设置经验条的长度比例"],
                get = function()
                    return M:GetInfo(mod, name, "width") / 1024;
                end,
                set = function(v)
                    M:SaveInfo(mod, name, "width", v * 1024);
                    M:UpdateFrame(name, mod);
                end,
                min = 0.1,
                max = 1.5,
                step = 0.005,
                isPercent = true,
                order = 402,
            };
        end
        self.options1.args.OpenConfig = {
            type = "execute",
            name = L["打开配置"],
            desc = " ",
            func = function()
                M:OpenConfig();
                dew:Close();
            end,
            order = 403,
        };
        self.options1.args.zhanwei = {
            type = "header",
            name = " ",
            order = 502,
        };
        self.options1.args.Close = {
            type = "execute",
            name = L["关闭"],
            desc = L["关闭菜单"],
            func = function()
                dew:Close();
            end,
            order = 503,
        };
    end
end

-------------------------------------
-- ACE3 配置面板
-------------------------------------
function M:InitConfigOptions()
    self.options2 = {
        type = "group",
        name = L["多玩移动"],
        args = {
            Lock = {
                type = "group",
                name = L["解锁模块"],
                childGroups = "tab",
                order = 1,
                args = {
                    LockAll = {
                        type = "toggle",
                        name = L["隐藏所有元素的标题头"],
                        desc = L["隐藏元素的标题头和背景\n使其不可移动"],
                        width = "full",
                        get = function()
                            return M.db.lock;
                        end,
                        set = function()
                            M.db.lock = not M.db.lock;
                            M:UpdateTheme();
                        end,
                        order = 2,
                    },
                },
            },
            Hide = {
                type = "group",
                name = L["隐藏模块"],
                childGroups = "tab",
                order = 200,
                args = {},
            },
            Profile = {
                type = "group",
                name = L["方案管理"],
                order = 300,
                args = {
                    desc = {
                        order = 301,
                        type = "description",
                        name = L["介绍"] .. "\n",
                    },
                    choose = {
                        name = L["选择方案"],
                        desc = L["选择一套预设方案"],
                        type = "select",
                        get = function()
                            return M:GetCurTheme();
                        end,
                        set = function(info, val)
                            M:SetCurTheme(val);
                            M:UpdateTheme();
                            -- 这里很操蛋
                            -- M:UpdateTheme();
                        end,
                        values = function()
                            return M.profiles;
                        end,
                        order = 310,
                    },
                    reset = {
                        type = "execute",
                        name = L["恢复缺省"],
                        desc = L["恢复到缺省方案"],
                        func = function()
                            M:ResetTheme();
                            dwReloadUI();
                        end,
                        order = 320,
                    },
                    new = {
                        name = L["新建方案"],
                        desc = L["新建一套方案"],
                        type = "input",
                        get = false,
                        set = function(info, val)
                            M:NewTheme(val);
                        end,
                        order = 330,
                    },
                    zhanwei = {
                        type = "header",
                        name = " ",
                        order = 340,
                    },
                    delete = {
                        name = L["删除方案"],
                        desc = L["删除选中的方案"],
                        type = "select",
                        get = false,
                        set = function(info, val)
                            M:DeleteTheme(val);
                        end,
                        values = function()
                            local cur = M:GetCurTheme();
                            local tmp = M:CloneTable(M.profiles);
                            tmp[cur] = nil;
                            return tmp;
                        end,
                        confirm = true,
                        confirmText = L["你缺省删除当前选中方案吗?"],
                        order = 350,
                    },
                },
            },
        },
    };

    local tmp1 = {
        type = "group",
        name = "",
        order = 0,
        args = {},
    };
    local tmp2 = {
        type = "toggle",
        name = "",
        desc = "",
        get = nil,
        set = nil,
        order = 0,
    };
    local option1 = self.options2.args.Lock.args;
    local option2 = self.options2.args.Hide.args;
    local index = 10;
    for mod, v in pairs(self.Mods) do
        tmp1.name = L[mod];
        option1[mod] = self:CloneTable(tmp1);
        option2[mod] = self:CloneTable(tmp1);
        index = index + 20;
        for name, _ in pairs(v) do
            local text = string.sub(name, 3) .. "Text";
            tmp2.name = L[text];
            tmp2.desc = " ";
            tmp2.get = function()
                return not M:GetInfo(mod, name, "lock");
            end
            tmp2.set = function()
                local lock = M:GetInfo(mod, name, "lock");
                if (lock) then
                    M:UnLockFrame(name, mod);
                else
                    M:Unregister(mod, name);        -- 不是对应的锁定, 而是反注册
                end
            end
            tmp2.disabled = false;
            tmp2.order = index;

            option1[mod].args[name] = self:CloneTable(tmp2);

            tmp2.get = function()
                return not M:GetInfo(mod, name, "visible");
            end
            tmp2.disabled  = function()
                return M:GetInfo(mod, name, "lock");
            end
            tmp2.set = function()
                local visible = M:GetInfo(mod, name, "visible");
                M:SaveInfo(mod, name, "visible", not visible);
                M:UpdateFrame(name, mod);
            end
            tmp2.order = index + 200;
            option2[mod].args[name] = self:CloneTable(tmp2);
            index = index + 1;
        end
    end
end

-------------------------
-- Duowan Interface
-------------------------
function DuowanMove_Toggle(switch)
    M:Toggle(switch);
end

function DuowanMove_OpenConfig()
    M:OpenConfig();
end

function DuowanMove_HideNone(switch)
    if (switch) then
        M:DecGrid();
    else
        M:IncGrid();
    end
    M:UpdateAllGrid();
end

function DuowanMove_ToggleConfig()
    if (not LibStub("AceConfigDialog-3.0"):Close(L["多玩移动"])) then
        LibStub("AceConfigDialog-3.0"):Open(L["多玩移动"]);
    end

end

function dwTest()
    if MainMenuBar.state == "vehicle" then
        MainMenuBar_ToPlayerArt(MainMenuBar)
    else
        MainMenuBar_ToVehicleArt(MainMenuBar)
    end
end