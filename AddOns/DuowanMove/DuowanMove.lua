------------------------------------------------------------------------------------------
-- DuowanMove - ver 1.0
-- 日期: 2010-4-9
-- 作者: dugu
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
M.parent = CreateFrame("Frame","DuowanMoveParentFrame",UIParent,"SecureFrameTemplate");
M.hideFrame = CreateFrame("Frame");
M.hideFrame:Hide();
M._DEBUG = true;
M._ENABLE = true;
-- 这里保存方法和对象
M.ThemeMap = {	
	[L["现代型"]] = true,	
};
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
M.SecureMods = {};
-- 排列方式
M.AT = {
	VERTICAL			= 1,	-- 纵向
	HORIZONTAL		= 2,	-- 横向
	DOUBLE			= 3,  -- 双排(横向)
	FUNNY			= 4,	-- 趣味排列
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
	--Register(mod, name, OnInitialize, OnUnregister, isSecure)
	
	self:Register("ACTIONBAR", "dwMainBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwBottomLeftBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwBottomRightBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwRightBar1", nil, nil, true);
	self:Register("ACTIONBAR", "dwRightBar2", nil, nil, true);
	self:Register("ACTIONBAR", "dwShapeShiftBar", nil, nil, true);
	if (select(2, UnitClass("player")) == "SHAMAN") then
		self:Register("ACTIONBAR", "dwMultiCastBar", nil, nil, true);
	end	
	self:Register("ACTIONBAR", "dwPossessBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwPlayerPetBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwMenuBar", nil, nil, true);
	self:Register("ACTIONBAR", "dwBagBar", nil, nil, true);
	self:Register("UNITFRAME", "dwUnitPlayerFrame", nil, nil, true);
	self:Register("UNITFRAME", "dwUnitTargetFrame", nil, nil, true);
	self:Register("UNITFRAME", "dwUnitPartyFrame", nil, nil, true);
	self:Register("UNITFRAME", "dwUnitFocusFrame", nil, nil, true);
	self:Register("CASTBAR", "dwCastBarFrame", nil, nil, true);
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
	AceConfig:RegisterOptionsTable(L["多玩界面"], self.options2);	
	self:SecureHook("ActionButton_UpdateHotkeys");
	self:SecureHook("VideoOptionsFrameOkay_OnClick");
	self:SecureHook("VideoOptionsFrameDefault_OnClick");
	-- self:SecureHook("MainMenuBar_ToPlayerArt");
	self:SecureHookScript(VideoOptionsFrameOkay, "OnClick", "VideoOptionsFrameDefault_OnClick");	
	RegisterStateDriver(M.parent, "visibility", "[target=vehicle,exists,bonusbar:5]hide;show");	
end

function M:Toggle(switch)
	if (switch) then
		-- 刷新方案
		MainMenuBar:SetFrameStrata("MEDIUM");
		MainMenuBar:SetFrameLevel(1);
		MainMenuBarArtFrame:SetFrameStrata("MEDIUM");
		--MainMenuBarArtFrame:SetFrameLevel(1);
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
	--DMMakeThemeFrame:Show();
	LibStub("AceConfigDialog-3.0"):Open(L["多玩界面"]);
	--if (not DMSaveThemeFrame:IsShown()) then
	--	DMSaveThemeFrame:Show();
	--end
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

function M:ChangeThemeName(name)
	local curTheme = self:GetCurTheme();
	if (curTheme ~= name) then
		DuowanMove_DB["theme"] = name;
		DuowanMove_DB["_themes"][name] = self:CloneTable(DuowanMove_DB["_themes"][curTheme]);
		DuowanMove_DB["_themes"][curTheme] = self:NukeTable(DuowanMove_DB["_themes"][curTheme]);
		self:UpdateCurProfile();
	end
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
						button:Show();
					end
				else
					if (not HasAction(action)) then
						button:Hide();
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

function M:IsSecureMod(name)
	if (self.SecureMods[name]) then
		return true;
	end

	return false;
end

----------------
-- 注册模块
function M:Register(mod, name, OnInitialize, OnUnregister, isSecure)
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
--	self.Mods[mod][name]["UpdateFrame"] = function() M:UpdateFrame(name, mod) end;
	self.Mods[mod][name]["OnUpdate"] = M["OnUpdate" .. name] or NOOP_FUNC;
	self.Mods[mod][name]["isinit"] = false;

	if (isSecure) then
		self.SecureMods[name] = true;
	end
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
	if (self:IsSecureMod(name)) then
		dwSecureCall(self.Mods[mod][name]["OnUnregister"]);
	else
		self.Mods[mod][name]["OnUnregister"]();
	end
	-- 标记该元素属性为锁定, 不再处理任何刷新事件
	self:SaveInfo(mod, name, "lock", true);
	-- 标记为未初始化
	self.Mods[mod][name]["isinit"] = false;
end

-- 初始化
function M:InitFrame(mod, name)	
	if (not self.Mods[mod][name]["isinit"]) then		
		self.Mods[mod][name]["isinit"] = true;		
		if (self:IsSecureMod(name)) then
			dwSecureCall(self.Mods[mod][name]["OnInitialize"]);
		else
			self.Mods[mod][name]["OnInitialize"]();
		end
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
		end
		
		_G[name .. "Text"]:SetText(text or "");		
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
	if (InCombatLockdown()) then
		dwSecureCall(DuowanMove_UpdatePos, frame, mod);
		return;
	end
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
			frame:SetWidth(185);
		end
	end
	-- 透明度
	frame:SetAlpha(db.alpha or 1);
	-- 可见性
	if (db.visible) then
		frame:Show();		
	else
		frame:Hide();
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
		_G[name .. "Tab"]:Hide();
	else
		_G[name .. "BG"]:Show();
		_G[name .. "Text"]:Show();
		_G[name .. "Tab"]:Show();
	end

	-- 动作条类还可以改变排列方式等
	if (mod == "ACTIONBAR") then
		--_G[name .. "BG"]:Hide();
		self:UpdateActionBar(frame);
	end

	-- 模块自定义刷新
	self.Mods[mod][name]:OnUpdate(db, name);

	-- 定位(控制条跟随姿态条)
	if (name ~= "dwPossessBar") then
		local pos = db.pos or {"CENTER", "UIParent", "CENTER", 0, 0};
		pos[2] = (type(pos[2] == "string") and pos[2]) or "UIParent";
		frame:ClearAllPoints();		
		frame:SetPoint(pos[1], pos[2] or pos[2], pos[3], pos[4], pos[5]);	
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
	local pos = {"TOPLEFT", "UIParent", "BOTTOMLEFT", frame:GetLeft(), frame:GetTop()};
	self:SaveInfo(mod, frame, "pos", pos);
end

function M:SaveAllFramePosition()
	for m, v in pairs(self.Mods) do
		for name, _ in pairs(v) do			
			if (_G[name]) then
				self:SaveFramePosition(m, _G[name]);			
			end			
		end		
	end
end
-- 这个还是可以保证的
function M:UpdateFrameScale(mod, frame)
	local name = frame:GetName();
	dwSetScale(frame, self.db[mod][name].scale or 1);	
	-- 保存信息
	self:SaveFramePosition(mod, frame);
end

function M:UpdateActionBar(bar, db, force)
	local name = bar:GetName();
	local db = db or self.db["ACTIONBAR"][name];	
	if (not bar.buttons[1]) then
		return;
	end

	-- 最小化、显示数量
	local maxNum = self:GetMaxNumber(bar);
	for id=1, maxNum do
		if (id > (db.num or maxNum) or db.minimize) then
			if (force) then
				bar.buttons[id]:SetAttribute( "statehidden", true);
				bar.buttons[id]:Hide();
			else
				bar.buttons[id]:SetAttribute("statehidden", true);
				bar.buttons[id]:Hide();
			end
			
		else
			if (force) then
				bar.buttons[id]:SetAttribute("statehidden", false);
				bar.buttons[id]:Show();
			else
				bar.buttons[id]:SetAttribute("statehidden", false);
				bar.buttons[id]:Show();
			end			
		end
	end

	-- 排列(反转只针对线性排列)
	self:UpdateArrage(bar, force);
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
			bar:SetWidth(cx);
			bar:SetHeight(cy);
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
-- VERTICAL			1	纵向
-- HORIZONTAL		2	横向
-- DOUBLE				3  双排(横向)
-- FUNNY				4	趣味排列
function M:UpdateArrage(bar, force)
	local name = bar:GetName();
	local db = self.db["ACTIONBAR"][name];
	if (InCombatLockdown() and not force) then
		dwSecureCall(self.UpdateArrage, self, bar);
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
	
	for i=1,4 do
		header = header .. format('[bonusbar:%d]%d;', i, i+6);
	end

	return header .. "1";
end

function ReassignMainBarBindings(bar)
	ClearOverrideBindings(bar)
	for i = 1,min(#bar.buttons, 12) do
		local button, real_button = ("ACTIONBUTTON%d"):format(i), ("dwMainBarButton%d"):format(i);
		for k=1, select('#', GetBindingKey(button)) do
			local key = select(k, GetBindingKey(button));
			SetOverrideBindingClick(bar, false, key, real_button);
		end
	end
end

function M:OnInitializedwMainBar()	
	local bar = _G["dwMainBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwMainBar", M.parent, "DuowanMoveAnchorTemplate");
		bar:SetFrameStrata("HIGH");
		CreateFrame("Frame","dwVehicleMenuBar", UIParent, "SecureFrameTemplate");
		M:SecureHookScript(bar, "OnAttributeChanged", function(this, name, value)
			if (name == "state-actionpage") then	
				for i=1, 12 do
					if (bar.buttons and bar.buttons[i]) then
						ActionButton_UpdateHotkeys(bar.buttons[i], bar.buttons[i].buttonType);
					end					
				end
			end
		end);
		bar:RegisterEvent("UPDATE_BINDINGS");
		bar:SetScript("OnEvent", function(this, event, ...)
			dwSecureCall(ReassignMainBarBindings, bar);
		end);
	end

	dwMainBarTab:Show();
	dwMainBarBG:Show();
	dwMainBarText:Show();

	bar:SetParent(M.parent);
	bar.num = 12;
	bar.buttons = {};
	for id=1, 12 do
		_G["ActionButton" .. id]:UnregisterAllEvents();
		_G["ActionButton" .. id]:Hide();
		_G["ActionButton" .. id]:SetParent(M.hideFrame);

		bar.buttons[id] = _G["dwMainBarButton"..id] or CreateFrame("CheckButton", "dwMainBarButton"..id, bar, "ActionBarButtonTemplate");
		bar.buttons[id].normalTexture = _G[bar.buttons[id]:GetName() .. "NormalTexture"];
		bar.buttons[id]:SetID(id);
		ActionButton_UpdateHotkeys(bar.buttons[id], bar.buttons[id].buttonType);
		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", "dwMainBarButton", 12);	
		end
	end
	ReassignMainBarBindings(bar);
	local button1 = dwMainBarButton1;
	button1:ClearAllPoints();
	button1:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);

	bar:Execute([[ActionButtons = table.new(self:GetChildren())]]);
	
	bar:SetAttribute('_onstate-actionpage', [[
		self:SetAttribute('actionpage', newstate);		
		for i, button in pairs(ActionButtons) do		
			if (strsub(button:GetName(), 0, 15) == "dwMainBarButton") then				
				button:SetAttribute('refresh', nil);
			end
		end
	]]);
	
	-- 设置属性转换规则	
	UnregisterStateDriver(dwMainBar, "actionpage")	
	RegisterStateDriver(dwMainBar, "actionpage", GetStateCommand());
	-- 处理奖励动作条
	
	BonusActionBarFrame:UnregisterAllEvents();
	BonusActionBarFrame:Hide();
	
	-- 处理载具动作条
	if VehicleMenuBar then
		VehicleMenuBar:SetParent(dwVehicleMenuBar);
		RegisterStateDriver(VehicleMenuBar, "visibility", "[target=vehicle,exists,bonusbar:5]show;hide");
	end
	
	-- 处理MainMenuBar	
	MainMenuBar:UnregisterEvent("PLAYER_ENTERING_WORLD");
	MainMenuBar:UnregisterEvent("BAG_UPDATE");
	MainMenuBar:UnregisterEvent("ACTIONBAR_PAGE_CHANGED");
	MainMenuBar:UnregisterEvent("KNOWN_CURRENCY_TYPES_UPDATE");
	MainMenuBar:UnregisterEvent("CURRENCY_DISPLAY_UPDATE");
	MainMenuBar:UnregisterEvent("ADDON_LOADED");
	MainMenuBar:UnregisterEvent("UNIT_ENTERING_VEHICLE");
	MainMenuBar:UnregisterEvent("UNIT_ENTERED_VEHICLE");
	MainMenuBar:UnregisterEvent("UNIT_EXITING_VEHICLE");
	MainMenuBar:UnregisterEvent("UNIT_EXITED_VEHICLE");	
	MainMenuBar:Hide();
	
	MainMenuBarArtFrame:UnregisterEvent("ACTIONBAR_PAGE_CHANGED");
	MainMenuBarArtFrame:UnregisterEvent("ADDON_LOADED");
	MainMenuBarArtFrame:Hide();
	

	MainMenuBar:SetParent(M.hideFrame);
	MainMenuBarArtFrame:SetParent(M.hideFrame);
	-- 禁用满级条
	MainMenuBarMaxLevelBar:DisableDrawLayer("BACKGROUND");
	-- 隐藏经验条等
	MainMenuExpBar:SetParent(M.hideFrame);
	ReputationWatchBar:SetParent(M.hideFrame);	

	if not PlayerTalentFrame then
		TalentFrame_LoadUI();		
	end
	if PlayerTalentFrame then
		PlayerTalentFrame:UnregisterEvent('ACTIVE_TALENT_GROUP_CHANGED')
	end
	
	dwAsynCall("tdCooldown2", "TCooldown_ShowActionBarCooldown");
	dwMainBar:Show();
end

function M:OnUnregisterdwMainBar()
	-- 恢复父框架
	local lastButton = nil;
	for id=1, 12 do
		if (id == 1) then
			_G["dwMainBarButton"..id]:ClearAllPoints();	
			_G["dwMainBarButton"..id]:SetPoint("CENTER", _G["ActionButton" .. id], "CENTER", 0, 0);
		else			
			_G["dwMainBarButton"..id]:ClearAllPoints();	
			_G["dwMainBarButton"..id]:SetPoint("LEFT", lastButton, "RIGHT", 6, 0);
		end
		lastButton = _G["dwMainBarButton"..id]
		dwMainBar.buttons[id] =  nil;
	end

	dwMainBarTab:Hide();
	dwMainBarBG:Hide();
	dwMainBarText:Hide();

	MainMenuBar:RegisterEvent("PLAYER_ENTERING_WORLD");
	MainMenuBar:RegisterEvent("BAG_UPDATE");
	MainMenuBar:RegisterEvent("ACTIONBAR_PAGE_CHANGED");
	MainMenuBar:RegisterEvent("KNOWN_CURRENCY_TYPES_UPDATE");
	MainMenuBar:RegisterEvent("CURRENCY_DISPLAY_UPDATE");
	MainMenuBar:RegisterEvent("ADDON_LOADED");
	MainMenuBar:RegisterEvent("UNIT_ENTERING_VEHICLE");
	MainMenuBar:RegisterEvent("UNIT_ENTERED_VEHICLE");
	MainMenuBar:RegisterEvent("UNIT_EXITING_VEHICLE");
	MainMenuBar:RegisterEvent("UNIT_EXITED_VEHICLE");
	MainMenuBar:Show();
	
	MainMenuBarArtFrame:RegisterEvent("ACTIONBAR_PAGE_CHANGED");
	MainMenuBarArtFrame:RegisterEvent("ADDON_LOADED");
	MainMenuBarArtFrame:Show();
	
	MainMenuBar:SetParent(UIParent);
	MainMenuBarArtFrame:SetParent(MainMenuBar);
	MainMenuBarMaxLevelBar:EnableDrawLayer("BACKGROUND");
	MainMenuExpBar:SetParent(MainMenuBar);
	ReputationWatchBar:SetParent(MainMenuBar);
	MainMenuBarMaxLevelBar:SetFrameLevel(1);
	MainMenuExpBar:SetFrameLevel(1);
	ReputationWatchBar:SetFrameLevel(1);
	if PlayerTalentFrame then
		PlayerTalentFrame:RegisterEvent('ACTIVE_TALENT_GROUP_CHANGED');
	end
end

-------------------------
-- 左下动作条
function M:OnInitializedwBottomLeftBar()	
	local bar = _G["dwBottomLeftBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwBottomLeftBar", M.parent, "DuowanMoveAnchorTemplate");		
	end
		
	bar:SetParent(M.parent);
	bar.num = NUM_ACTIONBAR_BUTTONS;
	bar.buttons = {};

	for id=1,NUM_ACTIONBAR_BUTTONS do
		bar.buttons[id] = _G["dwBottomLeftBarButton"..id] or CreateFrame("CheckButton", "dwBottomLeftBarButton"..id, bar, "ActionBarButtonTemplate");
		bar.buttons[id].normalTexture = _G[bar.buttons[id]:GetName() .. "NormalTexture"];
		bar.buttons[id].buttonType = "MULTIACTIONBAR1BUTTON";
		bar.buttons[id]:SetID(id);
		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", "dwBottomLeftBarButton", 12);	
		end
		ActionButton_UpdateHotkeys(bar.buttons[id], bar.buttons[id].buttonType);
	end

	bar:SetAttribute("actionpage", 6);	
	MultiBarBottomLeft:SetParent(M.hideFrame);
	local button = dwBottomLeftBarButton1;	--MultiBarBottomLeftButton1
	button:ClearAllPoints();
	button:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
	dwBottomLeftBar:Show();
end

function M:OnUnregisterdwBottomLeftBar()
	MultiBarBottomLeft:SetParent(UIParent);
	-- 隐藏框架
	dwBottomLeftBar:Hide();
end
-------------------------
-- 右下动作条
function M:OnInitializedwBottomRightBar()	
	local bar = _G["dwBottomRightBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwBottomRightBar", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
	bar.num = NUM_ACTIONBAR_BUTTONS;		
	bar.buttons = {};

	for id=1,NUM_ACTIONBAR_BUTTONS do		
		bar.buttons[id] = _G["dwBottomRightBarButton"..id] or CreateFrame("CheckButton", "dwBottomRightBarButton"..id, bar, "ActionBarButtonTemplate");
		bar.buttons[id].normalTexture = _G[bar.buttons[id]:GetName() .. "NormalTexture"];
		bar.buttons[id].buttonType = "MULTIACTIONBAR2BUTTON";
		bar.buttons[id]:SetID(id);
		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", "dwBottomRightBarButton", 12);	
		end
		ActionButton_UpdateHotkeys(bar.buttons[id], bar.buttons[id].buttonType);
	end

	bar:SetAttribute("actionpage", 5);
	MultiBarBottomRight:SetParent(M.hideFrame);
	local button = dwBottomRightBarButton1; --MultiBarBottomRightButton1
	button:ClearAllPoints();
	button:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
	dwBottomRightBar:Show();
end

function M:OnUnregisterdwBottomRightBar()
	MultiBarBottomRight:SetParent(UIParent);
	-- 隐藏矿建	
	dwBottomRightBar:Hide();	
end
-------------------------
-- 右1动作条
function M:OnInitializedwRightBar1()
	local bar = _G["dwRightBar1"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwRightBar1", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
	bar.num = NUM_ACTIONBAR_BUTTONS;
	bar.buttons = {};

	for id=1,NUM_ACTIONBAR_BUTTONS do		
		bar.buttons[id] = _G["dwRightBar1Button"..id] or CreateFrame("CheckButton", "dwRightBar1Button"..id, bar, "ActionBarButtonTemplate");
		bar.buttons[id].normalTexture = _G[bar.buttons[id]:GetName() .. "NormalTexture"];
		bar.buttons[id].buttonType = "MULTIACTIONBAR3BUTTON";
		bar.buttons[id]:SetID(id);
		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", "dwRightBar1Button", 12);	
		end
		ActionButton_UpdateHotkeys(bar.buttons[id], bar.buttons[id].buttonType);
	end
	bar:SetAttribute("actionpage", 3);
	MultiBarRight:SetParent(M.hideFrame);
	local button = dwRightBar1Button1;	--MultiBarRightButton1
	button:ClearAllPoints();
	button:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
	dwRightBar1:Show();
end

function M:OnUnregisterdwRightBar1()
	MultiBarRight:SetParent(UIParent);
	-- 隐藏框架
	dwRightBar1:Hide();
end
-------------------------
-- 右2动作条
function M:OnInitializedwRightBar2()	
	local bar = _G["dwRightBar2"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwRightBar2", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
	bar.num = NUM_ACTIONBAR_BUTTONS;
	bar.buttons = {};

	for id=1,NUM_ACTIONBAR_BUTTONS do		
		bar.buttons[id] = _G["dwRightBar2Button"..id] or CreateFrame("CheckButton", "dwRightBar2Button"..id, bar, "ActionBarButtonTemplate");
		bar.buttons[id].normalTexture = _G[bar.buttons[id]:GetName() .. "NormalTexture"];
		bar.buttons[id].buttonType = "MULTIACTIONBAR4BUTTON";
		bar.buttons[id]:SetID(id);
		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", "dwRightBar2Button", 12);	
		end
		ActionButton_UpdateHotkeys(bar.buttons[id], bar.buttons[id].buttonType);
	end

	bar:SetAttribute("actionpage", 4);
	MultiBarLeft:SetParent(M.hideFrame);
	local button = dwRightBar2Button1;	--MultiBarLeftButton1
	button:ClearAllPoints();
	button:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
	dwRightBar2:Show();
end

function M:OnUnregisterdwRightBar2()
	MultiBarLeft:SetParent(UIParent);
	-- 隐藏框架
	dwRightBar2:Hide();
end

function DuowanMove_ToggleShapshiftBarLayer(switch)
	if (switch) then
		AspectPosionBar:EnableDrawLayer("BACKGROUND");
		AspectPosionBar:EnableDrawLayer("BORDER");
		for id=1,NUM_SHAPESHIFT_SLOTS do	
			dwShapeShiftBar.buttons[id] = nil;
		end		
		AspectPosionBar:SetParent(UIParent);
	else
		AspectPosionBar:DisableDrawLayer("BACKGROUND");
		AspectPosionBar:DisableDrawLayer("BORDER");
		for id=1,NUM_SHAPESHIFT_SLOTS do	
			dwShapeShiftBar.buttons[id] = _G["AspectPosionBarButton"..id];
		end
		AspectPosionBar:SetParent(dwShapeShiftBar);
		M:UpdateFrame("dwShapeShiftBar", "ACTIONBAR");
	end
end
-------------------------
-- 姿态条
function M:OnInitializedwShapeShiftBar()
	local bar = _G["dwShapeShiftBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwShapeShiftBar", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
	bar.num = NUM_SHAPESHIFT_SLOTS;
	bar.buttons = {};
	ShapeshiftBarFrame:SetParent(bar);
	for id=1,NUM_SHAPESHIFT_SLOTS do	
		dwShapeShiftBar.buttons[id] = _G["ShapeshiftButton"..id];
	end
	bar:RegisterEvent("SPELLS_CHANGED");
	bar:SetScript("OnEvent", function(self)
		local mod = M:FindMod("dwShapeShiftBar");
		local num = GetNumShapeshiftForms() or 1;
		if (IsAddOnLoaded("AspectPosionBar") and AspectPosionBarFrame.enable) then
			num = (AspectPosionBarFrame:GetNumShapeshiftForms() > 0 and AspectPosionBarFrame:GetNumShapeshiftForms()) or 1;
		end
		if (num ~= M.db["ACTIONBAR"]["dwShapeShiftBar"]) then
			M:SaveInfo(mod, "dwShapeShiftBar", "num", num);
			M:UpdateFrame("dwShapeShiftBar", "ACTIONBAR");
		end
	end);
	ShapeshiftBarFrame:DisableDrawLayer("BACKGROUND");
	ShapeshiftBarFrame:DisableDrawLayer("BORDER");
	
	ShapeshiftButton1:ClearAllPoints();
	ShapeshiftButton1:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
	dwShapeShiftBar:Show();	
	M:TakeOver(ShapeshiftButton1);
	dwAsynCall("AspectPosionBar", "AspectPosionBar_Jieguan", true);
	dwAsynCall("AspectPosionBar", "DuowanMove_ToggleShapshiftBarLayer", false);	
	bar.oldPosition = UIPARENT_MANAGED_FRAME_POSITIONS['ShapeshiftBarFrame'];
	UIPARENT_MANAGED_FRAME_POSITIONS['ShapeshiftBarFrame'] = nil;	
	--M:TakeOver(ShapeshiftBarFrame);
end

function M:OnUnregisterdwShapeShiftBar()
	for id=1,NUM_SHAPESHIFT_SLOTS do		
		dwShapeShiftBar.buttons[id] = nil;
	end	
	
	-- 隐藏框架
	dwShapeShiftBar:UnregisterEvent("SPELLS_CHANGED");
	ShapeshiftBarFrame:EnableDrawLayer("BACKGROUND");
	ShapeshiftBarFrame:EnableDrawLayer("BORDER");
	dwShapeShiftBar:Hide();
	--M:UnTakeOver(ShapeshiftBarFrame);
	M:UnTakeOver(ShapeshiftButton1);
	UIPARENT_MANAGED_FRAME_POSITIONS['ShapeshiftBarFrame'] = dwShapeShiftBar.oldPosition;
	dwShapeShiftBar.oldPosition = nil;
	ShapeshiftBarFrame:Show();
	ShapeshiftButton1:ClearAllPoints();	
	ShapeshiftButton1:SetPoint("BOTTOMLEFT", ShapeshiftBarFrame, "BOTTOMLEFT", 10, 3);
	
	dwAsynCall("AspectPosionBar", "AspectPosionBar_Jieguan", false);
	dwAsynCall("AspectPosionBar", "DuowanMove_ToggleShapshiftBarLayer", true);
	if (AspectPosionBarFrame and AspectPosionBarFrame.enable) then
		ShapeshiftBarFrame:SetParent(AspectPositionHideFrame);
	else
		ShapeshiftBarFrame:SetParent(MainMenuBar);
	end
	
	UIParent_ManageFramePositions();
end

function M:OnUpdatedwShapeShiftBar(db, name)	
	if (name == "dwShapeShiftBar" and db and not db.minimize) then
		local mod = M:FindMod(name);
		ShapeshiftBar_Update();

		local num = GetNumShapeshiftForms() or 1;
		if (IsAddOnLoaded("AspectPosionBar") and AspectPosionBarFrame.enable) then
			num = (AspectPosionBarFrame:GetNumShapeshiftForms() > 0 and AspectPosionBarFrame:GetNumShapeshiftForms()) or 1;
		end

		M:SaveInfo(mod, "dwShapeShiftBar", "num", num);
		M:UpdateActionBar(_G[name]);

		local A = AspectPosionBarFrame;
		if (A and A.AspectBarUpdate) then
			A:AspectBarUpdate();
		end
	end
end
-------------------------
-- 图腾动作条
function M:OnInitializedwMultiCastBar()
	local bar = _G["dwMultiCastBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwMultiCastBar", M.parent, "DuowanMoveAnchorTemplate");
		bar.buttons = {};		
		MultiCastActionBarFrame:SetParent(bar);
	end
	bar:SetParent(M.parent);
	bar.num = 0;

	MultiCastActionBarFrame:ClearAllPoints();
	MultiCastActionBarFrame:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);
	M:TakeOver(MultiCastActionBarFrame);
end

function M:OnUnregisterdwMultiCastBar()
	MultiCastActionBarFrame:SetParent(MainMenuBar);
	M:UnTakeOver(MultiCastActionBarFrame);
	MultiCastActionBarFrame:ClearAllPoints();
	MultiCastActionBarFrame:SetPoint("BOTTOMLEFT", MainMenuBar, "TOPLEFT", 30, 0);
	UIParent_ManageFramePositions();
	dwMultiCastBar:Hide();
end

-- 宠物动作条
function M:OnInitializedwPlayerPetBar()
	local bar = _G["dwPlayerPetBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwPlayerPetBar", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
	bar.num = NUM_PET_ACTION_SLOTS;
	bar.buttons = {};
	dwPetActionBarFrame:SetParent(bar);
	for id=1,NUM_PET_ACTION_SLOTS do
		bar.buttons[id] = _G["dwPetActionButton"..id];
	end
	--bfRegisterButton("ActionButton", bar.buttons);
	dwPetActionBarFrame:DisableDrawLayer("LOW");
	--M:TakeOver(dwPetActionBarFrame);	
	dwPlayerPetBar:Show();
	dwPetActionBarPosition_Toggle(false);
	dwPetActionButton1:ClearAllPoints();
	dwPetActionButton1:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);	
end

function M:OnUnregisterdwPlayerPetBar()
	dwPetActionBarFrame:SetParent(MainMenuBar);
	for id=1, NUM_PET_ACTION_SLOTS do		
		dwPlayerPetBar.buttons[id] = nil;
	end
	-- 隐藏框架
	dwPetActionBarFrame:EnableDrawLayer("LOW");	
	--M:UnTakeOver(dwPetActionBarFrame);
	dwPlayerPetBar:Hide();	
	dwPetActionButton1:ClearAllPoints();	
	dwPetActionButton1:SetPoint("BOTTOMLEFT", dwPetActionBarFrame, "BOTTOMLEFT", 36, 2);	
	dwPetActionBarPosition_Toggle(true);
end

function M:OnUpdatedwPlayerPetBar(db, name)
	if (name == "dwPlayerPetBar" and db and not db.minimize) then
		--dwSecureCall(PetActionBar_OnEvent , PetActionBarFrame, "PET_BAR_UPDATE");
	end
end
-------------------------
-- 控制动作条
function M:OnInitializedwPossessBar()
	local bar = _G["dwPossessBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwPossessBar", M.parent, "DuowanMoveAnchorTemplate");
	end
	bar:SetParent(M.parent);
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
	--bfRegisterButton("ActionButton", bar.buttons);
	RegisterStateDriver(dwPossessBar, "visibility", "[target=vehicle,exists][bonusbar:5]show;hide")
	PossessBarFrame:DisableDrawLayer("BACKGROUND");
	PossessBarFrame:DisableDrawLayer("BORDER");
	-- M:TakeOver(PossessBarFrame);
	bar.oldPosition = UIPARENT_MANAGED_FRAME_POSITIONS['PossessBarFrame'];
	UIPARENT_MANAGED_FRAME_POSITIONS['PossessBarFrame'] = nil;
	dwPossessBar:Show();
	PossessButton1:ClearAllPoints();
	PossessButton1:SetPoint("TOPLEFT", bar, "TOPLEFT", 0, 0);
end

function M:OnUnregisterdwPossessBar()
	--bfUnregisterButton("ActionButton", dwPossessBar.buttons)
	PossessBarFrame:SetParent(MainMenuBar);
	for id=1,2 do		
		dwPossessBar.buttons[id] = nil;
	end
	UnregisterStateDriver(dwPossessBar, "visibility")
	PossessBarFrame:EnableDrawLayer("BACKGROUND");
	PossessBarFrame:EnableDrawLayer("BORDER");
	--M:UnTakeOver(PossessBarFrame);	
	UIPARENT_MANAGED_FRAME_POSITIONS['PossessBarFrame'] = dwPossessBar.oldPosition;
	dwPossessBar.oldPosition = nil;
	dwPossessBar:Hide();
	PossessButton1:ClearAllPoints();
	PossessButton1:SetPoint("BOTTOMLEFT", PossessBarFrame, "BOTTOMLEFT", 10, 3);		
end

function M:OnUpdatedwPossessBar(db, name)
	if (name == "dwPossessBar" and db and not db.minimize) then
		PossessBar_Update();
		if (dwShapeShiftBar) then
			dwPossessBar:ClearAllPoints();
			dwPossessBar:SetPoint("TOPLEFT", dwShapeShiftBar, "TOPLEFT", 0, 0);					
		end
	end
end
--[[
function M:OnInitializeVehicleBar()
	
	if (dwMenuBar) then			
		if (not self:IsHooked("MainMenuBar_ToVehicleArt")) then
			self:SecureHook(MainMenuBar, "Hide", OnMainMenuBarHide);
			self:SecureHook(VehicleMenuBar, "Hide", OnVehicleMenuBarHide);
			self:SecureHook("MainMenuBar_ToVehicleArt");
			self:SecureHook("MainMenuBar_ToPlayerArt");
		end	
	end	
	
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
]]
-------------------------
-- 菜单条
local microbuttons = {
	[1] = "CharacterMicroButton",
	[2] = "SpellbookMicroButton",
	[3] = "TalentMicroButton",
	[4] = "AchievementMicroButton",
	[5] = "QuestLogMicroButton",
	[6] = "SocialsMicroButton",
	[7] = "PVPMicroButton",
	[8] = "LFDMicroButton",
	[9] = "MainMenuMicroButton",
	[10] = "HelpMicroButton",
	[11] = "MainMenuBarPageButton"
};

local mainmenubuttons = {
	[1] = "DM_AtlasLootButton",
	[2] = "DM_DkpButton",
	[3] = "DM_GkpButton",
	[4] = "DM_DuowanMoveButton",
	[5] = "DM_InviteUpButton",
	[6] = "DM_RecountButton",
	[7] = "DM_ThreatButton",
	[8] = "DM_TradeLogButton",
};

function M:VehicleMenuBar_MoveMicroButtons(skinName)
	if (not skinName) then
		for i, name in ipairs(microbuttons) do			
			_G[name]:SetParent(dwMenuBar);
			_G[name]:Show();
			if (i == 1) then
				_G[name]:ClearAllPoints();
				_G[name]:SetPoint("TOPLEFT", "dwMenuBar", "TOPLEFT", 0, 20);
			end			
		end
		M:UpdateActionBar(dwMenuBar, nil, true);
	else
		local lastButton = CharacterMicroButton;
		for i, name in ipairs(microbuttons) do
			if ((i > 1 and i <= 5) or (i>6 and i<=10)) then
				_G[name]:ClearAllPoints();
				_G[name]:SetPoint("LEFT", lastButton, "RIGHT", -4, 0);
				lastButton = _G[name];
			elseif (i == 6) then
				lastButton = SocialsMicroButton;
			elseif (i == 11) then
				_G[name]:Hide();
			end
		end
	end
end


function M:OnInitializedwMenuBar()	
	local bar = _G["dwMenuBar"];
	if (not bar) then
		bar = CreateFrame("Frame", "dwMenuBar", M.parent, "DuowanMoveAnchorTemplate");		
		dwMenuBar:SetFrameLevel(VehicleMenuBar:GetFrameLevel() + 5);
	end
	bar:SetParent(M.parent);
	bar.num = #(microbuttons);
	bar.buttons = {};
	for id, bn in ipairs(microbuttons) do
		bar.buttons[id] = _G[bn];
		_G[bn]:Show();
		_G[bn]:SetParent(bar);
	end
	for id, bn in ipairs(mainmenubuttons) do
		_G[bn]:SetParent(bar);
	end

	-- RegisterStateDriver(dwMenuBar, "visibility", "[target=vehicle,exists]hide;show");
	MainMenu:Unhook("VehicleMenuBar_MoveMicroButtons");
	M:SecureHook("VehicleMenuBar_MoveMicroButtons");
	CharacterMicroButton:ClearAllPoints();
	CharacterMicroButton:SetPoint("TOPLEFT", "dwMenuBar", "TOPLEFT", 0, 20);	
	dwSecureCall(dwMenuBar.Hide, dwMenuBar);
end

function M:OnUnregisterdwMenuBar()		
	for id, bn in ipairs(microbuttons) do		
		_G[bn]:SetParent(MainMenuBarArtFrame);
		_G[bn]:SetFrameLevel(MainMenuBarArtFrame:GetFrameLevel()+1);
		_G[bn]:Show();
		dwMenuBar.buttons[id] = nil;
	end
	for id, bn in ipairs(mainmenubuttons) do
		_G[bn]:SetParent(MainMenuBarArtFrame);
	end
	M:Unhook("VehicleMenuBar_MoveMicroButtons");
	MainMenu:SecureHook("VehicleMenuBar_MoveMicroButtons");
	dwSecureCall(dwMenuBar.Hide, dwMenuBar);
	--dwSecureCall(CharacterMicroButton.ClearAllPoints, CharacterMicroButton);
	--dwSecureCall(CharacterMicroButton.SetPoint, CharacterMicroButton, "TOPLEFT", MainMenuBarArtFrame, "TOPLEFT", 548, 8);	
	MainMenu:AjustMainMenu();
	MainMenuBarDownButton:Click();
	MainMenuBarPageButton:ClearAllPoints();
	MainMenuBarPageButton:SetPoint("BOTTOMLEFT", "HelpMicroButton", "BOTTOMRIGHT", -6, 0);
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
		bar:SetFrameStrata("HIGH");
	end
	bar:SetParent(M.parent);
	bar.num = 6;
	bar.buttons = {};
	bags[1]:SetParent(bar);
	bar.buttons[1] = bags[1];
	bags[1]:SetHeight(30);
	bags[2]:SetWidth(30);
	bags[2]:SetHeight(30);
	_G[bags[2]:GetName() .. "NormalTexture"]:SetAlpha(0);
	for id=2, 6 do
		bags[id]:SetParent(bar);
		bar.buttons[id] = bags[id];
	end	
	
	KeyRingButton:ClearAllPoints();
	KeyRingButton:SetPoint("TOPRIGHT", bar, "TOPRIGHT", 0, 0);		
end

function M:OnUnregisterdwBagBar()
	for i=1, 2 do
		bags[i]:SetParent(MainMenuBarArtFrame);
		dwBagBar.buttons[i] = nil;
		bags[i]:ClearAllPoints();
		bags[i]:Show();
	end
	
	bags[1]:SetHeight(37);
	bags[2]:SetWidth(37);
	bags[2]:SetHeight(37);
	_G[bags[2]:GetName() .. "NormalTexture"]:SetAlpha(1);
	for id=3, 6 do
		bags[id]:SetParent(MainMenuBarArtFrame);
		dwBagBar.buttons[id] = nil;
		bags[id]:ClearAllPoints();
		bags[id]:Show();
	end
	dwSecureCall(dwBagBar.Hide, dwBagBar);
	MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", MainMenuBarArtFrame, "BOTTOMRIGHT", -6, 2);	
	CharacterBag0Slot:SetPoint("RIGHT", MainMenuBarBackpackButton, "LEFT", -5, 0);	
	CharacterBag1Slot:SetPoint("RIGHT", CharacterBag0Slot, "LEFT", -4, 0);	
	CharacterBag2Slot:SetPoint("RIGHT", CharacterBag1Slot, "LEFT", -4, 0);	
	CharacterBag3Slot:SetPoint("RIGHT", CharacterBag2Slot, "LEFT", -4, 0);	
	KeyRingButton:SetPoint("RIGHT", CharacterBag3Slot, "LEFT", -6, 0);
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
	dwUnitPlayerFrame:Show();
	PlayerFrame:ClearAllPoints();
	PlayerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);
	M:TakeOver(PlayerFrame);
end

function M:OnUnregisterdwUnitPlayerFrame()
	PlayerFrame:SetParent(UIParent);
	dwUnitPlayerFrame:Hide();
	M:UnTakeOver(PlayerFrame);
	PlayerFrame:ClearAllPoints();
	if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
		local height = -TitanPanelBarButton:GetHeight() - 4;
		PlayerFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -19, height);
	else
		PlayerFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", -19, -4);
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
	dwUnitTargetFrame:Show();	
	TargetFrame:ClearAllPoints();
	TargetFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);
	TargetFrame:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, 0);
	M:TakeOver(TargetFrame);
end

function M:OnUnregisterdwUnitTargetFrame()
	TargetFrame:SetParent(UIParent);	
	dwUnitTargetFrame:Hide();
	M:UnTakeOver(TargetFrame);
	TargetFrame:ClearAllPoints();
	if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
		local height = -TitanPanelBarButton:GetHeight() - 4;
		TargetFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 370, height);
	else
		TargetFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 370, -4);
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
	dwUnitPartyFrame:Show();
	PartyMemberFrame1:ClearAllPoints();
	PartyMemberFrame1:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);
	M:TakeOver(PartyMemberFrame1);
end

function M:OnUnregisterdwUnitPartyFrame()
	for i=1, 4 do
		_G["PartyMemberFrame" .. i]:SetParent(UIParent);
	end	
	dwUnitPartyFrame:Hide();
	M:UnTakeOver(PartyMemberFrame1);
	PartyMemberFrame1:ClearAllPoints();
	if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
		local height = -TitanPanelBarButton:GetHeight() - 160;
		PartyMemberFrame1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, height);
	else
		PartyMemberFrame1:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 10, -160);
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

	dwUnitFocusFrame:Show();
	FocusFrame:ClearAllPoints();
	FocusFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);	
end

function M:OnUnregisterdwUnitFocusFrame()
	FocusFrame:SetParent(UIParent);
	dwUnitFocusFrame:Hide();
	FocusFrame:ClearAllPoints();
	FocusFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 12, -420);	
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
	MinimapCluster:ClearAllPoints();
	MinimapCluster:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);	
	M:TakeOver(MinimapCluster);
end

function M:OnUnregisterdwMiniMapFrame()
	MinimapCluster:SetParent(UIParent);
	M:UnTakeOver(MinimapCluster);
	dwSecureCall(dwMiniMapFrame.Hide, dwMiniMapFrame);
	MinimapCluster:ClearAllPoints();
	if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
		local height = -TitanPanelBarButton:GetHeight() - 6;
		MinimapCluster:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, height);
	else
		MinimapCluster:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, 0);
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
	ConsolidatedBuffs:SetParent(frame);
	dwSecureCall(dwBuffFrame.Show, dwBuffFrame);
	BuffFrame:ClearAllPoints();
	ConsolidatedBuffs:ClearAllPoints();
	
	BuffFrame:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0);	
	ConsolidatedBuffs:SetPoint("TOPRIGHT", frame, "TOPRIGHT", 0, 0);
	M:TakeOverPosition(ConsolidatedBuffs);
end

function M:OnUnregisterdwBuffFrame()
	BuffFrame:SetParent(UIParent);
	TemporaryEnchantFrame:SetParent(UIParent);
	ConsolidatedBuffs:SetParent(UIParent);
	dwSecureCall(dwBuffFrame.Hide, dwBuffFrame);
	M:UnTakeOverPosition(ConsolidatedBuffs);
	BuffFrame:ClearAllPoints();
	ConsolidatedBuffs:ClearAllPoints();
	if (TitanPanelBarButton and TitanPanelBarButton:IsShown()) then
		local height = -TitanPanelBarButton:GetHeight() - 13;
		BuffFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -205, height);	
		ConsolidatedBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -180, height);	
	else
		ConsolidatedBuffs:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -180,-13);	
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
	DurabilityFrame:ClearAllPoints();
	DurabilityFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);	
end

function M:OnUnregisterdwDurabilityFrame()
	DurabilityFrame:SetParent(UIParent);

	dwSecureCall(dwDurabilityFrame.Hide, dwDurabilityFrame);
	DurabilityFrame:ClearAllPoints();
	DurabilityFrame:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT", 40, 15);	
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
	CastingBarFrame:ClearAllPoints();
	CastingBarFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);		
	M:TakeOver(CastingBarFrame);
end

function M:OnUnregisterdwCastBarFrame()
	CastingBarFrame:SetParent(UIParent);

	dwSecureCall(dwCastBarFrame.Hide, dwCastBarFrame);
	CastingBarFrame:ClearAllPoints();
	CastingBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 55);	
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
	MirrorTimer1:ClearAllPoints();
	MirrorTimer1:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, 0);		
end

function M:OnUnregisterdwMirrorTimerFrame()
	MirrorTimer1:SetParent(UIParent);	
	MirrorTimer2:SetParent(UIParent);	
	MirrorTimer3:SetParent(UIParent);	
	dwSecureCall(dwMirrorTimerFrame.Hide, dwMirrorTimerFrame);
	MirrorTimer1:ClearAllPoints();
	MirrorTimer1:SetPoint("TOP", UIParent, "TOP", 0, -96);	
end

--------------------------
-- 经验条
function M:OnInitializedwExBar()
	local frame = _G["dwExBar"];
	if (not frame) then
		frame = CreateFrame("Frame", "dwExBar", M.parent, "DuowanMoveAnchorTemplate");
		frame.bar = CreateFrame("StatusBar", "dwExBarFrame", frame, "DuowanMoveXPBarTemplate");
	end
	
	frame.bar:ClearAllPoints();
	frame.bar:SetPoint("TOP", frame, "TOP", 0, 0);
	dwSecureCall(frame.Show, frame);	

	dwSecureCall(_G["dwExBarTab"].ClearAllPoints, _G["dwExBarTab"]);
	dwSecureCall(_G["dwExBarTab"].SetPoint, _G["dwExBarTab"], "BOTTOM", frame, "TOP", 0, 2);
	DuowanMoveXPBar_Update(frame.bar);
end

function M:OnUnregisterdwExBar()	
	dwSecureCall(dwExBar.Hide, dwExBar);
	ReputationWatchBar_Update();
end

--------------------------------
--	配置菜单项
--------------------------------
local BarMapBinding = {
	dwMainBar = "ACTIONBUTTON1",
	dwBottomLeftBar = "MULTIACTIONBAR1BUTTON1",
	dwBottomRightBar = "MULTIACTIONBAR2BUTTON1",
	dwRightBar1 = "MULTIACTIONBAR3BUTTON1",
	dwRightBar2 = "MULTIACTIONBAR4BUTTON1",
	dwShapeShiftBar = "SHAPESHIFTBUTTON1",
};

function M:UpdateAllGrid()
	if (InCombatLockdown()) then
		dwSecureCall(self.UpdateAllGrid, self);
		return;
	end
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
			name = L["锁定位置"], 
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
			name = L["解除锁定"],
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
		self.options1.args.Lock = {
			type = "execute", 
			name = L["恢复默认位置"], 
			desc = L["恢复模块到游戏缺省位置"], 			
			func = function()
				M:SaveInfo(mod, name, "lock", false);
				M:Unregister(mod, name);
				local text = strmatch(name, "dw(%S+)");
				if text and L[text.."Text"] then
					print(L["DuoanMove Head"], format(L["UnRegisterFormatText"], L[text.."Text"], L[text.."Text"]));
				end
				dew:Close();
			end,
			order = 103,
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
				order = 104,
			};
			self.options1.args.UnMinimize = {
				type = "execute",
				name = L["显示模块"],
				desc = L["恢复模块到原来的外观"],
				hidden = function()
					return not M:GetInfo(mod, name, "minimize");
				end,
				func = function()
					M:MinimizeButtons(frame, false);			
					dew:Close();
				end,
				order = 105,
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
				order = 106,
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
				local text = strmatch(name, "dw(%S+)");
				if text and L[text.."Text"] then
					print(L["DuoanMove Head"], format(L["HideModFormatText"], L[text.."Text"], L[text.."Text"]));
				end
				dew:Close();
			end,
			order = 107,
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
			name = L["关闭菜单"],
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
		name = L["多玩界面"],		
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
							-- 刷新显示
							-- DMSaveThemeFrame_OnShow(DMSaveThemeFrame);
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
							--dwReloadUI();
							--DMSaveThemeFrame:Hide();
						end,
						order = 320,
					},
					new = {
						name = L["新建方案"],
						desc = L["新建一套方案"],
						type = "input",						
						get = false,
						set = function(info, val)
							-- 玩家自己将方案名设置为现代型
							if (M.ThemeMap[val]) then
								val = val.." <"..UnitName("player")..">";
							end
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
							tmp["default"] = nil;
							for name, _ in pairs(M.ThemeMap) do
								tmp[name] = nil;
							end
							return tmp;
						end,
						confirm = true,
						confirmText = L["你确定删除当前选中方案吗?"],
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
					M:Unregister(mod, name);		-- 不是对应的锁定, 而是反注册
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

----------------------------
-- 经验条
function DuowanMoveXPBar_OnLoad(self)
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_XP_UPDATE");
	self:RegisterEvent("UPDATE_FACTION");
	DuowanMoveXPBar_Update(self:GetParent());
end

function DuowanMoveXPBar_OnEvent(self, event, ...)
	DuowanMoveXPBar_Update(self:GetParent());
end

function DuowanMoveXPBar_Update(self)
	local name, reaction, mini, max, value = GetWatchedFactionInfo();
	max = max - mini;
	value = value - mini;
	mini = 0;
	local color = FACTION_BAR_COLORS[reaction]
	local playerReputation = value;
	local playerReputationMax = max;

	local playerXP = UnitXP("player");
	local playerXPMax = UnitXPMax("player");
	local playerXPRest = GetXPExhaustion();
	
	if (name and UnitLevel("player") == 80) then
		_G[self:GetName().."Text"]:SetText(string.format("|cffffffff%s %s/%s", name, value, max));
		self:SetMinMaxValues(min(0, playerReputation), playerReputationMax);
		self:SetValue(value);
		self:SetStatusBarColor(color.r, color.g, color.b);
	else
		if (playerXPRest and playerXPRest > 0) then
			_G[self:GetName().."Text"]:SetText(string.format("%s/%s (+%s)", playerXP, playerXPMax, playerXPRest/2));
		else
			_G[self:GetName().."Text"]:SetText(string.format("%s/%s", playerXP, playerXPMax));
		end
		
		self:SetMinMaxValues(min(0, playerXP), playerXPMax);
		self:SetValue(playerXP);
		self:SetStatusBarColor(0, 0.4, 1);
	end	
end

-------------------------
-- 保存方案对话框
function DMSaveThemeFrame_OnLoad(self)
	_G[self:GetName().."TitleText"]:SetText(L["多玩界面"]);
	_G[self:GetName().."Note"]:SetText(L["保存并锁定设计好的界面方案"]);
	_G[self:GetName().."Okay"]:SetText(L["确定"]);
	_G[self:GetName().."Cancel"]:SetText(L["取消"]);
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);
	self:RegisterForDrag("LeftButton");
end

function DMSaveThemeFrame_OnShow(self)
	_G[self:GetName().."Note"]:SetText(L["保存并锁定设计好的界面方案"]);
	local theme = DuowanMove:GetCurTheme();
	if (DuowanMove.ThemeMap[theme]) then
		theme = theme.." <"..UnitName("player")..">";
		DuowanMove:NewTheme(theme);
	end
	_G[self:GetName().."Name"]:SetText(theme);
end

function DMSaveThemeFrameOkay_OnClick(self)
	local theme = _G[self:GetParent():GetName().."Name"]:GetText();
	if (theme == "") then
		_G[self:GetParent():GetName().."Note"]:SetText(L["方案名必须填写"]);
	else
		local curTheme = DuowanMove:GetCurTheme();
		if (theme ~= curTheme) then
			-- 玩家自己将方案名设置为现代型
			if (DuowanMove.ThemeMap[theme]) then
				theme = theme.." <"..UnitName("player")..">";
			end
			DuowanMove:NewTheme(theme);
		end
		-- 锁定
		DuowanMove.db.lock = true;
		DuowanMove:UpdateTheme();
		-- 保存所有位置
		DuowanMove:SaveAllFramePosition();
		self:GetParent():Hide();
		PlaySound("igMainMenuOption");
	end
end

-------------------------
--DMMakeThemeFrame
StaticPopupDialogs["DUOWANMOVE_DELETE_THEME"] = {
	text = L["你确定删除|cff01d501<%s>|r方案吗?"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function(self, data)
		M:DeleteTheme(data);		
	end,
	OnCancel = function(_, reason)				
	end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["DUOWANMOVE_THEME_OVER"] = {
	text = L["方案数量过多，请在右侧下拉菜单中删除部分方案"],
	button1 = TEXT(OKAY),
	--button2 = TEXT(CANCEL),
	OnAccept = function(self, data)
		
	end,
	--OnCancel = function(_, reason)				
	--end,
	timeout = 30,
	showAlert = 1,
	hideOnEscape = 1
};

local function MakeThemeFrame_Update()
	local frame = DMMakeThemeFrame;
	-- 输入框文字
	local theme = DuowanMove:GetCurTheme();
	_G[frame:GetName().."Name"]:SetText(theme);
	-- 解锁按钮状态
	if (DuowanMove.db.lock) then
		_G[frame:GetName().."Lock"]:SetText(L["解锁"]);
	else
		_G[frame:GetName().."Lock"]:SetText(L["锁定"]);
	end
	-- 皮肤
	local bSkin = dwRawGetCVar("DuowanBar", "DuowanBarSkin", 0);	
	if (bSkin == 1) then
		_G[frame:GetName().."SkineBox"]:SetChecked(true);
		_G[frame:GetName().."ChoiceSkinText"]:SetTextColor(1, 1, 1);
		_G[frame:GetName().."ChoiceSkinPrev"]:Enable();
		_G[frame:GetName().."ChoiceSkinNext"]:Enable();		
	else
		_G[frame:GetName().."SkineBox"]:SetChecked(false);
		_G[frame:GetName().."ChoiceSkinText"]:SetTextColor(0.5, 0.5, 0.5);
		_G[frame:GetName().."ChoiceSkinPrev"]:Disable();
		_G[frame:GetName().."ChoiceSkinNext"]:Disable();
	end
end

function DMMakeThemeFrame_OnLoad(self)
	_G[self:GetName().."Name"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);
	self:RegisterForDrag("LeftButton");
end

function DMMakeThemeFrame_OnShow(self)	
	_G[self:GetName().."Note"]:SetText(L["点击右上角箭头更多方案选项"]);
	MakeThemeFrame_Update();
end

function DMMakeThemeFrameMinmaxButton_OnShow(self)
	self.udatefunc(self);
end

function DMMakeThemeFrameMinmaxButton_OnClick(self)
	--if self.stat == 0 then
	--	self.stat = 1;
		LibStub("AceConfigDialog-3.0"):Open(L["多玩界面"]);
	--else
	--	self.stat = 0;
	--	LibStub("AceConfigDialog-3.0"):Close(L["多玩界面"])
	--end	
	
	self.udatefunc(self);
end

local function initFunction(self, level)
	local info, tmp = {}, {};
	for k, _ in pairs(DuowanMove_DB["_themes"]) do
		table.insert(tmp, k);
	end
	table.sort(tmp);

	local curTheme = M:GetCurTheme();
	if (level == 2) then		
		if UIDROPDOWNMENU_MENU_VALUE == "deleteTheme" then
			info = {};
			info.text = L["删除方案"];
			info.isTitle = true;
			UIDropDownMenu_AddButton(info, level);
			
			for i, name in ipairs(tmp) do
				if (curTheme ~= name and name ~= "default" and not M.ThemeMap[name]) then
					info = {};
					info.text = name;
					info.arg1 = name;
					info.func = function(self, arg1)
						StaticPopup_Show("DUOWANMOVE_DELETE_THEME", arg1, "", arg1);
						CloseDropDownMenus();
					end
					
					UIDropDownMenu_AddButton(info, level);
				end
			end
		elseif UIDROPDOWNMENU_MENU_VALUE == "selectTheme" then
			info = {};
			info.text = L["选择方案"];
			info.isTitle = true;
			UIDropDownMenu_AddButton(info, level);
			
			for i, name in ipairs(tmp) do				
				if (curTheme ~= name and name ~= "default" and not M.ThemeMap[name]) then
					info = {};
					info.text = name;
					info.arg1 = name;
					info.func = function(self, arg1)
						M:SetCurTheme(arg1);
						M:UpdateTheme();
						MakeThemeFrame_Update();
						CloseDropDownMenus();
					end
						
					UIDropDownMenu_AddButton(info, level);					
				end
			end
		end
	else
		info = {};
		info.text = L["选择方案"];
		info.value = "selectTheme";
		info.hasArrow = true;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = " ";
		info.isTitle = true;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = L["删除方案"];
		info.value = "deleteTheme";
		info.hasArrow = true;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = " ";
		info.isTitle = true;
		UIDropDownMenu_AddButton(info, level);
		
		info = {};
		info.text = L["关闭菜单"];
		info.func = function(self, arg1)
			CloseDropDownMenus();
		end
		UIDropDownMenu_AddButton(info, level);
	end
end

function DMMakeThemeFrameHiddenFrame_OnLoad(self)
	UIDropDownMenu_Initialize(self, initFunction, "MENU");
end

function DMMakeThemeFrameDropdown_OnClick(self)
	ToggleDropDownMenu(nil, nil, DMMakeThemeFrameHiddenFrame);
	PlaySound("igMainMenuOptionCheckBoxOn");
end

function DMMakeThemeFrameRestoreButton_OnClick(self)
	M:ResetTheme();
	_G[self:GetParent():GetName().."Name"]:SetText("default");
end

function DMMakeThemeFrameSkineBox_OnShow(self)
	
end

function DMMakeThemeFrameSkineBox_OnClick(self)
	local bSkin = self:GetChecked();
	if (bSkin == 1) then
		dwSetCVar("DuowanBar", "DuowanBarSkin", 1);
		dwButtonFacade_Toggle(true);		
	else
		dwSetCVar("DuowanBar", "DuowanBarSkin", 0);
		dwButtonFacade_Toggle(false);		
	end
	
	MakeThemeFrame_Update();
end

function DMMakeThemeFrameStartMove_OnClick(self)	
	local name = L["新建方案"];
	local newThemes, createdThemes = {}, {};
	local curTheme = M:GetCurTheme();
	for k, v in pairs(M.profiles) do
		if (k ~= "default" and not DuowanMove.ThemeMap[k]) then
			tinsert(createdThemes, k);
		end
		if (k:find("^"..name.."%d+$")) then
			local id = strmatch(k, name.."(%d+)");
			tinsert(newThemes, id);
		end
	end

	if (#createdThemes < 10) then	
		table.sort(newThemes);	
		name = name..((newThemes[#newThemes] or 0)+1);
		
		DuowanMove_DB["_themes"][name] = M:CloneTable(DUOWANMOVE_DEFAULT_DB["_themes"][L["现代型"]]);	
		_G[self:GetParent():GetName().."Name"]:SetText(name);
		M:SetCurTheme(name);
		M:UpdateTheme();
	else
		StaticPopup_Show("DUOWANMOVE_THEME_OVER");						
	end
end

function DMMakeThemeFrameLock_OnShow(self)
	
end

function DMMakeThemeFrameLock_OnClick(self)
	DuowanMove.db.lock = not DuowanMove.db.lock;
	DuowanMove:UpdateTheme();
	MakeThemeFrame_Update();
end

function DMMakeThemeFrameOkay_OnClick(self)
	local theme = _G[self:GetParent():GetName().."Name"]:GetText();
	if (theme == "") then
		_G[self:GetParent():GetName().."Note"]:SetText(L["方案名必须填写"]);
	else
		local curTheme = DuowanMove:GetCurTheme();
		DuowanMove.db.lock = true;
		if (theme ~= curTheme) then	
			DuowanMove:ChangeThemeName(theme);
		else
			DuowanMove:UpdateTheme();
		end
		
		-- 保存所有位置
		DuowanMove:SaveAllFramePosition();
		self:GetParent():Hide();
		PlaySound("igMainMenuOption");
	end
end
-------------------------
-- Duowan Interface
-------------------------
function DuowanMove_Toggle(switch)
	M:Toggle(switch);
end

function DuowanMove_OpenConfig()
	--M:OpenConfig();
	DMMakeThemeFrame:Show();
	PlaySound("igMainMenuOption");
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
	if DMMakeThemeFrame:IsShown() then
		DMMakeThemeFrame:Hide()
	else
		DMMakeThemeFrame:Show()
	end
	
	--if not (LibStub("AceConfigDialog-3.0"):Close(L["多玩界面"])) then
	--	LibStub("AceConfigDialog-3.0"):Open(L["多玩界面"]);
		--if (not DMSaveThemeFrame:IsShown()) then
		--	DMSaveThemeFrame:Show();
		--end
	--end
end

function dwTest()
	if MainMenuBar.state == "vehicle" then
		MainMenuBar_ToPlayerArt(MainMenuBar)
	else
		MainMenuBar_ToVehicleArt(MainMenuBar)
	end
end