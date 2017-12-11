------------------------------------------------------------------------------------------
-- DuowanBar - ver 2.0
-- 日期: 2010-3-25
-- 作者: dugu@bigfoot
-- 描述: 为游戏增加额外的动作条, 该动作条采用安全方式, 与系统动作条无任何键位冲突. 该
--			功能依赖用户的配置文件, 请务必将配置文件通过我们的客户端上传到多玩.
-- 版权所有 (c) duowan.com
-- ver 2.0 改动:
--	> 前4条动作条使用系统自己的动作条
--	> 后4条动作条使用自定义动作条.
------------------------------------------------------------------------------------------
DuowanBarDB = {};
DUOWANBAR_BLZ_BAR = 4;
DUOWANBAR_MAX_NUM = 10;
DuowanBar = LibStub("AceAddon-3.0"):NewAddon("DuowanBar", "AceHook-3.0", "AceEvent-3.0");
local dew = AceLibrary("Dewdrop-2.0");
local L =  LibStub("AceLocale-3.0"):GetLocale("DuowanBar");
local D = DuowanBar;
local SetActionTooltip;
local curBar = nil;
D.CallStack = {};
D.point = 0;
D.bars = {};
D.ReStorInfo  ={};
D.lowalpha = true;
D.showgrid = MultiBarLeftButton1:GetAttribute("showgrid");
D.ArrangeType = {
	VERTICAL		= 1,	-- 纵向
	HORIZONTAL		= 2,	-- 横向
	DOUBLE			= 3,  -- 双排(横向)
	FUNNY			= 4,	-- 趣味排列
}

local VERTICAL		= D.ArrangeType.VERTICAL;
local HORIZONTAL	= D.ArrangeType.HORIZONTAL;
local DOUBLE		= D.ArrangeType.DOUBLE;
local FUNNY			= D.ArrangeType.FUNNY;

D.options = {
	type = "group",
	handler = DuowanBar,
	args = {
		["General"] = {
			type = "header",
			name = L["基本选项"],
			order = 1,
		},
		["Lock"] = {
			type = "execute",
			name = L["锁定动作条"],
			desc = L["锁定动作条的位置"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "locked");
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "locked", true);
				dew:Close();
			end,
			order = 101,
		},
		["UnLock"] = {
			type = "execute",
			name = L["解锁动作条"],
			desc = L["解锁动作条的位置"],
			hidden = function()
				local bar = curBar;
				return not D:GetCVar(bar, "locked");
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "locked", false);
				dew:Close();
			end,
			order = 102,
		},
		["Minimized"] = {
			type = "execute",
			name = L["最小化动作条"],
			desc = L["最小化动作条到只剩下标题头"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "minimized");
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "minimized", true);
				D:UpdateSatus(bar, true);
				dew:Close();
			end,
			order = 103,
		},
		["maximized"] = {
			type = "execute",
			name = L["恢复动作条"],
			desc = L["恢复最小化前的动作条样式"],
			hidden = function()
				local bar = curBar;
				return not D:GetCVar(bar, "minimized");
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "minimized", false);
				D:UpdateSatus(bar, false);
				dew:Close();
			end,
			order = 104,
		},
		["binding"] = {
			type = "execute",
			name = L["绑定按键"],
			desc = L["为该动作条绑定按键"],
			hidden = false,
			func = function()
				local bar = curBar;
				D:ShowKeyBinding(bar);
				dew:Close();
			end,
			order = 105,
		},
		["Arrange"] = {
			type = "header",
			name = L["排列方式"],
			order = 200,
		},
		["Vertical"] = {
			type = "execute",
			name = L["竖向排列"],
			desc = L["按照垂直方向排列"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "arrange") == VERTICAL;
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "arrange", VERTICAL);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 201,
		},
		["Horizontal"] = {
			type = "execute",
			name = L["横向排列"],
			desc = L["按照水平方向排列"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "arrange") == HORIZONTAL;
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "arrange", HORIZONTAL);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 202,
		},
		["Double"] = {
			type = "execute",
			name = L["双行排列"],
			desc = L["排列为两行"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "arrange") == DOUBLE;
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "arrange", DOUBLE);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 203,
		},
		["Funny"] = {
			type = "execute",
			name = L["趣味排列"],
			desc = L["非同寻常的排列方式"],
			hidden = function()
				local bar = curBar;
				return D:GetCVar(bar, "arrange") == FUNNY;
			end,
			func = function()
				local bar = curBar;
				D:SetCVar(bar, "arrange", FUNNY);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 204,
		},
		["ActionButton"] = {
			type = "header",
			name = L["按键操作"],
			order = 300,
		},
		["Increase "] = {
			type = "execute",
			name = L["增加按键"],
			desc = L["增加动作条的按键数量"],
			disabled = function()
				local bar = curBar;
				return D:GetCVar(bar, "count") == 12;
			end,
			func = function()
				local bar = curBar;
				bar.num = D:GetCVar(bar, "count") +1;
				D:SetCVar(bar, "count", bar.num);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 301,
		},
		["Decrease "] = {
			type = "execute",
			name = L["减少按键"],
			desc = L["减少动作条的按键数量"],
			disabled = function()
				local bar = curBar;
				return D:GetCVar(bar, "count") == 2;
			end,
			func = function()
				local bar = curBar;
				bar.num = D:GetCVar(bar, "count") - 1;
				D:SetCVar(bar, "count", bar.num);
				D:UpdateBar(bar);
				dew:Close();
			end,
			order = 302,
		},
		["Other"] = {
			type = "header",
			name = L["其他操作"],
			order = 400,
		},
		["AddBar"] = {
			type = "execute",
			name = L["创建新的动作条"],
			desc = L["创建一条新的动作条"],
			func = function()
				local bar = D:CreateActionBar();
				if (bar) then
					D:UpdateBar(bar);
				end
				dew:Close();
			end,
			order = 401,
		},
		["close"] = {
			type = "execute",
			name = L["关闭动作条"],
			desc = L["关闭条动作条"],
			func = function()
				local bar = curBar;
				D:HideBar(bar);
				dew:Close();
			end,
			order = 402,
		},
		["Space"] = {
			type = "header",
			name = " ",
			order = 403,
		},
		["Close"] = {
			type = "execute",
			name = L["关闭"],
			desc = L["关闭菜单"],
			func = function()
				dew:Close();
			end,
			order = 404,
		},
	},
}
------------
-- 按键绑定用
function DUMMY_FUNC()

end

function D:ShowKeyBinding(bar)
	local index = strmatch(bar:GetName(), "(%d+)");
	local name = "HEADER_DUOWANBAR" .. index;
	dwShowKeyBindingFrame(name);
end

function D:PLAYER_ALIVE()
	self:UpdateAllGrid();
end

function D:ACTIONBAR_SHOWGRID()
	self.lowalpha = false;
	self:IncGrid();
	self:UpdateAllGrid();
end

function D:ACTIONBAR_HIDEGRID()
	self.lowalpha = true;
	self:DecGrid();
	self:UpdateAllGrid();
end

function D:PLAYER_ENTERING_WORLD()
	self:UnregisterEvent("PLAYER_ENTERING_WORLD");
	for k, v in pairs(self.ReStorInfo) do
		self:ReStorActionInfo(v.bar, v.db);
	end
end

function D:IncGrid()
	self.showgrid = self.showgrid + 1;
end

function D:DecGrid()
	if self.showgrid > 0 then
		self.showgrid = self.showgrid - 1;
	end
end

function D:UpdateGrid(bar)
	local name = bar:GetName();

	for i=1, NUM_ACTIONBAR_BUTTONS do
		local button = bar.buttons[i];
		if (self.lowalpha) then
			button:GetNormalTexture():SetAlpha(0.3);
		else
			button:GetNormalTexture():SetAlpha(0.6);
		end
		if (button) then
			button:SetAttribute("showgrid", self.showgrid);
			if self.showgrid > 0 then
				if (not button:GetAttribute("statehidden")) then
					dwSecureCall(button.Show, button);
				end
			else
				if (bar.index > DUOWANBAR_BLZ_BAR) then
					if (not self:HasAction(button)) then
						dwSecureCall(button.Hide, button);
					end
				else
					local action = ActionButton_CalculateAction(button);
					if (not HasAction(action)) then
						dwSecureCall(button.Hide, button);
					end
				end
			end
		end
	end
end

function D:UpdateAllGrid()
	for i, name in pairs(self.bars) do
		if (name and _G[name]) then
			self:UpdateGrid(_G[name]);
		end
	end
end

local function tClone(t)
	local tmp = {};
	for k, v in pairs(t) do
		if (type(v) == "table") then
			tmp[k] = tClone(v);
		else
			tmp[k] = v;
		end
	end
	return tmp;
end

local function tNuke(t)
	for k, v in pairs(t) do
		if (type(v) == "table") then
			tNuke(v);
			t[k] = nil;
		else
			t[k] = nil;
		end
	end
	t = nil;
	return t;
end

function D:printf(pattern, ...)
	assert(type(pattern) == "string", "pattern must be a string value");

	pattern = L["多玩动作条: "] .. pattern;
	print(format(pattern, ...));
end

function D:OnInitialize()
    self.db = self:GetProfile();
	if (not self.db) then
		error(L["多玩动作条配置载入错误, 请重新载入!"]);
	end

	-- self.showgrid = MultiBarLeftButton1:GetAttribute("showgrid") + 1;
	--UIParentLoadAddOn("Blizzard_MacroUI");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("ACTIONBAR_SHOWGRID");
	self:RegisterEvent("ACTIONBAR_HIDEGRID");
	self:RegisterEvent("PLAYER_ALIVE");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
end

function D:GetCVar(bar, var)
	assert(bar);
	local bar = type(bar) == "string" and bar or bar:GetName();

	if (not self.db[bar]) then
		self.db[bar] = {};
	end
	self.db[bar][var] = self.db[bar][var] or false;
	return self.db[bar][var];
end

function D:SetCVar(bar, var, val)
	assert(bar);
	local bar = type(bar) == "string" and bar or bar:GetName();

	if (not self.db[bar]) then
		self.db[bar] = {};
	end
	self.db[bar][var] = val;
end

function D:IsHideAll()
	for name, v in pairs(self.db) do
		if (strfind(tostring(name), "^DuowanActionBar") and type(v) == "table" and not v.close) then
			return false;
		end
	end
	return true;
end

function D:PackUpDB()
	local tmp = {};
	for name, v in pairs(self.db) do
		if (strfind(tostring(name), "^DuowanActionBar")) then
			tinsert(tmp, name);
		end
	end
	table.sort(tmp, function(a, b)
		return tonumber(strmatch(a, "^DuowanActionBar(%d+)")) < tonumber(strmatch(b, "^DuowanActionBar(%d+)"));
	end);
	for i, name in pairs(tmp) do
		if ("DuowanActionBar" .. i ~= name) then
			self.db["DuowanActionBar" .. i] = tClone(self.db[name]);
			tNuke(self.db[name]);
		end
	end
end

function D:Enable()
	if (InCombatLockdown()) then
		dwPush(self.Enable, self);
		return;
	end

	local index = 0;
	local oldClose;
	local firstIndex = nil;
	if (not self:IsHideAll()) then
		self:PackUpDB();
		for n, v in pairs(self.db) do
			if (strfind(tostring(n), "^DuowanActionBar") and type(v) == "table" and not v.close) then
				index = tonumber(strmatch(n, "DuowanActionBar(%d+)"));
				firstIndex = firstIndex or index;		-- here firstIndex almost equal to 1
				oldClose = self.db[n].close;
				self:CreateActionBar(index);
				if (index ~= firstIndex) then
					 self.db[n].close = oldClose ;
				end
				self:UpdateBar(n)
			end
		end
	else
		local bar = self:CreateActionBar(1);
		self:UpdateBar(bar);
		index = 1;
	end

	self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", "OnSpellCastSucceeded");
	self:UpdateTabStatus();
end

function D:OnSpellCastSucceeded(event, unit, spell)
	if (unit == "player") then
		if (spell == L["启用副天赋"] or spell == L["启用主天赋"]) then
			for i, bar in ipairs(self.bars) do
				self:UpdateBar(bar);
			end
		end
	end
end

function D:Disable()
	if (InCombatLockdown()) then
		dwPush(self.Disable, self);
		return;
	end

	for k, name in pairs(self.bars) do
		D:HideBar(_G[name]);
	end
	self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
end

function D:PLAYER_REGEN_ENABLED()
	--self:RunCallStack();
end

function D:PLAYER_REGEN_DISABLED()
	dew:Close();
end

function D:GetProfile()
	local realm = GetCVar("realmName");
	local name = UnitName("player");

	if (realm and name and name ~= UNKNOWNOBJECT and name ~= UKNOWNBEING) then
		local id = string.format("%s_%s", realm, name);
		if (not DuowanBarDB[id]) then
			DuowanBarDB[id] = {};
		end
		return DuowanBarDB[id];
	end

	return nil;
end

function D:Book2ID(bookId, bookType)
	local link = GetSpellLink(bookId, bookType);
	local id = strmatch(link, "^|c%x+|Hspell:(.+)|h%[.*%]");
	return tonumber(id);
end

function D:ID2Book(spellID)
	local bookId, spellid, offset, numSpells, _;

	-- 检查玩家的法术
	local numTabs = GetNumSpellTabs();
	for tabid=1,numTabs do
		_, _, offset, numSpells = GetSpellTabInfo(tabid);
		for spellid=1,numSpells do
			bookId = spellid + offset;
			id = self:Book2ID(bookId, BOOKTYPE_SPELL);
			if (id == spellID) then
				return bookId, BOOKTYPE_SPELL;
			end
		end
	end

	-- 检查宠物的法术
	local numPetSpells = HasPetSpells();
	if (numPetSpells) then
		for spellid=1, numPetSpells do
			id = self:Book2ID(spellid, BOOKTYPE_PET);
			if (id == spellID) then
				return spellid, BOOKTYPE_PET;
			end
		end
	end

	return nil, nil;
end

do
	local function OnEnter(self)
		assert(self)

		local link, name, _;
		GameTooltip_SetDefaultAnchor(GameTooltip, self);
		if (self.type == "SPELL") then
			local link = GetSpellLink(self.id);
			if (link) then
				GameTooltip:SetHyperlink(link);
			else
				GameTooltip:SetText(self.name);
			end
			GameTooltip:AddLine(L["Shift - 右键拖动拾取法术"], 0.7, 0.7, 0.7);
			GameTooltip:Show();
		elseif (self.type == "ITEM") then
			_, link = GetItemInfo(self.id);
			if (link) then
				GameTooltip:SetHyperlink(link);
			else
				GameTooltip:SetText(self.name);
			end
			GameTooltip:AddLine(L["Shift - 右键拖动拾取法术"], 0.7, 0.7, 0.7);
			GameTooltip:Show();
		elseif (self.type == "MACRO") then
			GameTooltip:SetText(self.name);
			GameTooltip:AddLine(L["Shift - 右键拖动拾取法术"], 0.7, 0.7, 0.7);
			GameTooltip:Show();
		elseif (self.type == "EQUIPMENTSET") then
			GameTooltip:SetText(self.name);
			GameTooltip:AddLine(L["Shift - 右键拖动拾取法术"], 0.7, 0.7, 0.7);
			GameTooltip:Show();
		end
	end

	SetActionTooltip = OnEnter;

	local function OnLeave(self)
		GameTooltip:Hide();
	end

	-- 拖拽动作会产生别的问题, 放入PreClick
	local function OnDragStart(self, button)
		if (InCombatLockdown()) then
			dwPush(OnDragStart, self, button);
			return;
		end

		if (IsShiftKeyDown()) then
			if (self.type == "SPELL") then
				local bookId, bookType = D:ID2Book(self.id);
				if (bookId and bookType) then
					PickupSpell(bookId, bookType);
				end
				if (self.subType == "COMP" and self.info) then
					PickupCompanion(self.info[1], self.info[2]);
				end
			elseif (self.type == "EQUIPMENTSET") then
				PickupEquipmentSetByName(self.name);
			elseif (self.type == "ITEM") then
				PickupItem(self.id);
			elseif (self.type == "MACRO") then
				PickupMacro(self.name);
			end

			self:SetAttribute("type", "");
			self:SetAttribute("unit", "");
			self:SetAttribute("spell", "");
			self:SetAttribute("item", "");
			self:SetAttribute("macro", "");
			self.id = -1;
			self.name = "";
			self.type = "";
			D:UpdateButton(self);
			D:SetActionInfo(self, nil);
		end
	end

	local function PreClick(self, button)
		if (InCombatLockdown()) then
			return ;
		end

		local typ, data, subType = GetCursorInfo();
		if (typ == "spell" or typ == "item" or typ == "macro" or typ == "equipmentset" or typ == "companion") then
			--pcall(D.SetActionInfo, D, self, nil);
			self:SetAttribute("type", "");
			self:SetAttribute("unit", "");
			self:SetAttribute("spell", "");
			self:SetAttribute("item", "");
			self:SetAttribute("macro", "");
		end
	end

	local function OnEvent(self, event, arg1, arg2)
		if ( event == "ACTIONBAR_SHOWGRID" ) then
			D:ButtonShowGrid(self);
			return;
		end
		if ( event == "ACTIONBAR_HIDEGRID" ) then
			D:ButtonHideGrid(self);
			return;
		end
		if ( event == "UPDATE_BINDINGS" ) then
			D:ButtonUpdateHotkeys(self);
			return;
		end

		-- All event handlers below this line are only set when the button has an action
		if ( event == "PLAYER_TARGET_CHANGED" ) then
			self.rangeTimer = -1;
		elseif (event == "SPELL_UPDATE_USABLE") then
			D:UpdateUsable(self);
		elseif ( event == "SPELL_UPDATE_COOLDOWN" or event == "BAG_UPDATE_COOLDOWN") then
			D:UpdateCooldown(self);
		elseif ( event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_CLOSE" ) then
			D:UpdateState(self);
		elseif ( event == "PLAYER_ENTER_COMBAT" ) then
			local name = (self.type == "SPELL") and GetSpellInfo(self.id);
			name = (self.type == "MACRO") and GetMacroSpell(self.id) or name;
			if (name and IsAttackSpell(name)) then
				D:StartFlash(self);
			end
		elseif ( event == "PLAYER_LEAVE_COMBAT" ) then
			local name = (self.type == "SPELL") and GetSpellInfo(self.id);
			name = (self.type == "MACRO") and GetMacroSpell(self.id) or name;
			if ( D:IsFlashing(self) and IsAttackSpell(name) ) then
				D:StopFlash(self);
			end
		elseif ( event == "START_AUTOREPEAT_SPELL" ) then
			D:UpdateFlash(self);
		elseif ( event == "STOP_AUTOREPEAT_SPELL" ) then
			local name = (self.type == "SPELL") and GetSpellInfo(self.id);
			name = (self.type == "MACRO") and GetMacroSpell(self.id) or name;
			if ( D:IsFlashing(self) and not IsAttackSpell(name) ) then
				D:StopFlash(self);
			end
		elseif ( event == "BAG_UPDATE") then
			D:Updatecount(self);
		end
	end

	local function PostClick(self, button)
		if (InCombatLockdown()) then
			return ;
		end

		local tmp = {};
		local type, data, subType = GetCursorInfo();
		if (type == "spell") then
			tmp["type"] = "SPELL";
			tmp["id"] = D:Book2ID(data, subType);
			tmp["name"] = GetSpellInfo(data, subType);
			D:SetActionInfo(self, tmp);
		elseif (type == "item") then
			tmp["type"] = "ITEM";
			tmp["id"] = data;
			tmp["name"] = GetItemInfo(data);
			D:SetActionInfo(self, tmp);
		elseif (type == "macro") then
			local name, texture = GetMacroInfo(data);
			tmp["type"] = "MACRO";
			tmp["id"] = data;
			tmp["name"] = name;
			tmp["texture"] = texture;
			D:SetActionInfo(self, tmp);
		elseif (type == "equipmentset") then
			tmp["type"] = "EQUIPMENTSET";
			tmp["id"] = data;	-- 用名字作为ID
			tmp["name"] = data;
			-- TODO: 添加一键换装
			D:SetActionInfo(self, tmp);
		elseif (type == "companion") then
			local creatureID, creatureName, spellID = GetCompanionInfo(subType, data);
			local spellName = GetSpellInfo(spellID);
			tmp["type"] = "SPELL";
			tmp["id"] = spellID;
			tmp["name"] = spellName;
			tmp["subType"] = "COMP";
			tmp["info"] = {subType, data};
			D:SetActionInfo(self, tmp);
		end
		ClearCursor();
		D:UpdateState(self);
	end

	local function OnUpdate(self, elapsed)
		-- 闪烁
		if ( D:IsFlashing(self) ) then
			local flashtime = self.flashtime;
			flashtime = flashtime - elapsed;

			if ( flashtime <= 0 ) then
				local overtime = -flashtime;
				if ( overtime >= 0.4 ) then
					overtime = 0;
				end
				flashtime = 0.4 - overtime;

				if ( self.flash:IsShown() ) then
					self.flash:Hide();
				else
					self.flash:Show();
				end
			end

			self.flashtime = flashtime;
		end

		-- 刷新距离提示
		local rangeTimer = self.rangeTimer;
		if ( rangeTimer ) then
			rangeTimer = rangeTimer - elapsed;

			if ( rangeTimer <= 0 ) then
				D:UpdateUsable(self);
				rangeTimer = TOOLTIP_UPDATE_TIME;
			end

			self.rangeTimer = rangeTimer;
		end
	end

	function D:CreateButton(bar, id)
		local btnName = bar:GetName() .. "Button" .. id;
		local btn = _G["btnName"];
		if (not btn) then
			btn = CreateFrame("CheckButton", btnName, bar, "DuowanActionButtonTemplate");
			btn.icon = _G[btn:GetName() .. "Icon"];
			btn.flash = _G[btn:GetName() .. "Flash"];
			btn.hotKey = _G[btn:GetName() .. "HotKey"];
			btn.countText = _G[btn:GetName() .. "Count"];
			btn.nameText = _G[btn:GetName() .. "Name"];
			btn.border = _G[btn:GetName() .. "Border"];
			btn.cooldown = _G[btn:GetName() .. "Cooldown"];
			btn.normalTexture = _G[btn:GetName() .. "NormalTexture"];
			btn.id = -1;	-- 无任何法术物品或宏绑定即为 -1;
			btn.type = "";
			btn.name = "";
			btn:SetAttribute("checkselfcast", true);
			btn:SetAttribute("checkfocuscast", true);
			btn:RegisterForDrag("LeftButton");
			btn:RegisterForClicks("LeftButtonUp", "RightButtonUp");
			btn:RegisterEvent("ACTIONBAR_SHOWGRID");
			btn:RegisterEvent("ACTIONBAR_HIDEGRID");
			btn:RegisterEvent("UPDATE_BINDINGS");
			btn:SetScript("PreClick", PreClick);
			btn:SetScript("PostClick", PostClick);
			btn:SetScript("OnDragStart", OnDragStart);
			btn:SetScript("OnUpdate", OnUpdate);
			btn:SetScript("OnEnter", OnEnter);
			btn:SetScript("OnLeave", OnLeave);
			btn:SetScript("OnEvent", OnEvent);

			self:ButtonUpdateHotkeys(btn);
			self:UpdateButton(btn);
		end
		return btn;
	end
end

function D:HasAction(button)
	if (button.id and button.id ~= -1) then
		return true;
	end
	return false;
end

function D:UpdateButton(button)
	if (self:HasAction(button)) then
		if (not button.reg) then
			button:RegisterEvent("PLAYER_ENTER_COMBAT");
			button:RegisterEvent("PLAYER_LEAVE_COMBAT");
			button:RegisterEvent("START_AUTOREPEAT_SPELL");
			button:RegisterEvent("STOP_AUTOREPEAT_SPELL");
			button:RegisterEvent("SPELL_UPDATE_COOLDOWN");
			button:RegisterEvent("SPELL_UPDATE_USABLE");
			button:RegisterEvent("TRADE_SKILL_SHOW");
			button:RegisterEvent("TRADE_SKILL_CLOSE");
			button:RegisterEvent("PLAYER_TARGET_CHANGED");
			button:RegisterEvent("BAG_UPDATE_COOLDOWN");
			button:RegisterEvent("BAG_UPDATE");
			button.reg = true;
		end

		-- 我们无法在战斗中显示
		if ( button.hideState ) then
			button.hideState = nil;
			button:GetNormalTexture():SetAlpha(0.6);
		end

		self:UpdateState(button);
		self:UpdateUsable(button);
		self:UpdateCooldown(button);
		self:UpdateFlash(button);
	else
		if (button.reg) then
			button:UnregisterEvent("PLAYER_ENTER_COMBAT");
			button:UnregisterEvent("PLAYER_LEAVE_COMBAT");
			button:UnregisterEvent("START_AUTOREPEAT_SPELL");
			button:UnregisterEvent("STOP_AUTOREPEAT_SPELL");
			button:UnregisterEvent("SPELL_UPDATE_COOLDOWN");
			button:UnregisterEvent("SPELL_UPDATE_USABLE");
			button:UnregisterEvent("TRADE_SKILL_SHOW");
			button:UnregisterEvent("TRADE_SKILL_CLOSE");
			button:UnregisterEvent("PLAYER_TARGET_CHANGED");
			button:UnregisterEvent("BAG_UPDATE_COOLDOWN");
			button:UnregisterEvent("BAG_UPDATE");
			button.Reg = nil;
		end

		-- 我们无法在战斗中隐藏
		if ( not button.hideState ) then
			button.hideSate = true;
			button:GetNormalTexture():SetAlpha(0.3);
		end
	end

	-- 可装备物品
	if (self:HasAction(button) and button.type == "ITEM") then
		if ( IsEquippedItem(button.id) ) then
			button.border:SetVertexColor(0, 1.0, 0, 0.35);
			button.border:Show();
		else
			button.border:Hide();
		end
	end

	-- 显示宏的名字
	if ( self:HasAction(button) and button.type == "MACRO" ) then
		button.nameText:SetText(GetMacroInfo(button.id));
	else
		button.nameText:SetText("");
	end

	-- 显示相应图标
	local texture, _;
	if (self:HasAction(button)) then
		if (button.type == "SPELL") then
			texture = select(3, GetSpellInfo(button.id));
			texture = texture or "Interface\\Icons\\INV_Misc_QuestionMark";
		elseif (button.type == "ITEM") then
			texture = select(10, GetItemInfo(button.id));
			texture = texture or "Interface\\Icons\\INV_Misc_QuestionMark";
		elseif (button.type == "MACRO") then
			_, texture = GetMacroInfo(button.id);
			texture = texture or button.texture or "Interface\\Icons\\INV_Misc_QuestionMark";
		elseif (button.type == "EQUIPMENTSET") then
			texture = GetEquipmentSetInfoByName(button.name);
			if (texture) then
				texture = "Interface\\Icons\\" .. texture;
			else
				texture = texture or "Interface\\Icons\\INV_Misc_QuestionMark";
			end
		end
	end

	if ( texture ) then
		button.icon:SetTexture(texture);
		button.icon:Show();
		button.rangeTimer = -1;
		button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2");
		button:GetNormalTexture():SetAlpha(0.7);
	else
		button.icon:Hide();
		button.cooldown:Hide();
		button.rangeTimer = nil;
		button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot");
		button:GetNormalTexture():SetAlpha(0.5);
        if ( not button.hotKey:GetText() or button.hotKey:GetText() == "") then
			button.hotKey:Hide();
		end
	end

	self:Updatecount(button);

	-- 刷新工具提示
	if ( GameTooltip:GetOwner() and GameTooltip:GetOwner() == button ) then
		SetActionTooltip(button);
	end
end

function D:SetActionInfo(button, data)
	assert(button)
	if (InCombatLockdown()) then
		return;
	end

	if (not data or data == {}) then
		self:SaveButtonInfo(button, nil);
		return;
	end

	local texture, action;
	local icon;
	local needU;
	for k, v in pairs(data) do
		button[k] = v;
	end

	if (button.type == "SPELL") then
		button:SetAttribute("type", "spell");
		button:SetAttribute("spell", button.name);
		needU = true;
	elseif (button.type == "ITEM") then
		button:SetAttribute("type", "item");
		button:SetAttribute("item", button.name);
		needU = true;
	elseif (button.type == "MACRO") then		-- macro用什么作为ID呢???
		button:SetAttribute("type", "macro");
		button:SetAttribute("macro", button.name);
		needU = true;
	elseif (button.type == "EQUIPMENTSET") then
		button:SetAttribute("type", "");
		button:SetAttribute("macro", "");
		button:SetAttribute("macro", "");
		button:HookScript("PreClick", function(self)
			if (not GetCursorInfo() and button.type == "EQUIPMENTSET") then
				if ( EquipmentSetContainsLockedItems(self.name) or UnitOnTaxi("player") or UnitCastingInfo("player") ) then
					UIErrorsFrame:AddMessage(ERR_CLIENT_LOCKED_OUT, 1.0, 0.1, 0.1, 1.0);
				end

				EquipmentManager_EquipSet(self.name);
			end
		end);
		needU = true;
	end

	if (needU) then
		self:UpdateButton(button);
		self:SaveButtonInfo(button, data);
	end
end

-- 刷新计数显示
function D:Updatecount(button)
	local name, count;

	button.countText:Hide();

	if (not self:HasAction(button)) then
		return;
	end

	if (button.type == "ITEM") then

		if (IsConsumableItem(button.id)) then
			count = GetItemCount(button.id, nil, true);
		else
			count = GetItemCount(button.id);
		end

		if (count and count >= 1) then
			button.countText:SetText(count);
			button.countText:Show();
		end
	elseif (button.type == "SPELL") then
		name = GetSpellInfo(button.id);
		if (name) then
			count = GetSpellCount(name);
		end
		if (count and count >= 1) then
			button.countText:SetText(count);
			button.countText:Show();
		end
--	else
		-- 考虑是否加上macro的
	end
end
--
function D:UpdateState(button)
	assert(button);
	if (not self:HasAction(button)) then
		button:SetChecked(0);
		return;
	end

	local name = (button.type == "SPELL") and GetSpellInfo(button.id);
	name = (button.type == "MACRO") and GetMacroSpell(button.id) or name;
	if (name) then
		if (IsAutoRepeatSpell(name) ) then
			button:SetChecked(1);
		else
			button:SetChecked(0);
		end
	else
		button:SetChecked(0);
	end
end

function D:UpdateUsable(button)
	if (not self:HasAction(button)) then
		button.icon:SetVertexColor(1.0, 1.0, 1.0);
		return;
	end

	local name = (button.type == "SPELL") and GetSpellInfo(button.id);
	name = (button.type == "MACRO") and GetMacroSpell(button.id) or name;
	local unit = button:GetAttribute("unit") or "target";
	if (name) then
		local isUsable, notEnoughMana = IsUsableSpell(name);
		local inRange = IsSpellInRange(name, unit);
		if ( isUsable ) then
			button.icon:SetVertexColor(1.0, 1.0, 1.0);
		elseif ( notEnoughMana ) then
			button.icon:SetVertexColor(0.5, 0.5, 1.0);
		else
			if (button.subType and  button.subType == "COMP") then
				button.icon:SetVertexColor(1.0, 1.0, 1.0);
			else
				button.icon:SetVertexColor(0.4, 0.4, 0.4);
			end
		end

		if (inRange and inRange ~= 1) then
			button.icon:SetVertexColor(0.5, 0.1, 0.1);
		end
	end
end

function D:UpdateCooldown(button)
	if (not self:HasAction(button)) then
		button.cooldown:Hide();
		return;
	end

	local start, duration, enable;
	if (button.type == "SPELL") then
		start, duration, enable = GetSpellCooldown(button.name);
	elseif (button.type == "ITEM") then
		start, duration, enable = GetItemCooldown(button.name);
	elseif (button.type == "MACRO") then
		if (name) then
			start, duration, enable = GetItemCooldown(button.name);
		else
			name, link = GetMacroSpell(button.id);
			if (name) then
				start, duration, enable = GetItemCooldown(name);
			end
		end
	end

	if (start and duration and enable) then
		CooldownFrame_SetTimer(button.cooldown, start, duration, enable);
	end
end

function D:UpdateFlash(button)
	if (not self:HasAction(button)) then
		if (self:IsFlashing(button)) then
			self:StopFlash(button);
		end
		return;
	end
	local name = (button.type == "SPELL") and GetSpellInfo(button.id);
	name = (button.type == "MACRO") and GetMacroSpell(button.id) or name;
	if (name and self:ID2Book(button.id)) then
		if ( (IsAttackSpell(name) and IsCurrentSpell(name)) or IsAutoRepeatSpell(name) ) then
			self:StartFlash(button);
		else
			self:StopFlash(button);
		end
	end
end

function D:StartFlash(button)
	button.flashing = 1;
	button.flashtime = 0;
	self:UpdateState(button);
end

function D:StopFlash(button)
	button.flashing = 0;
	button.flash:Hide();
	self:UpdateState (button);
end

function D:IsFlashing (button)
	if ( button.flashing == 1 ) then
		return 1;
	end

	return nil;
end

function D:SaveButtonInfo(button, data)
	local name = button:GetParent():GetName();
	local id = button:GetID();
	if (id == 0) then
		id = tonumber(strmatch(button:GetName(), "Button(%d+)"));
	end

	if (not self.db[name]) then
		self.db[name] = {};
	end

	local curTalent = GetActiveTalentGroup() or 1;
	self.db[name]["_buttons"] = self.db[name]["_buttons"] or {};
	self.db[name]["_buttons"][id] = self.db[name]["_buttons"][id] or {};
	if (data) then
		for k, v in pairs(data) do
			self.db[name]["_buttons"][id][k] = v;
			if (not self.db[name]["_buttons"][id][curTalent]) then
				self.db[name]["_buttons"][id][curTalent] = {};
			end
			self.db[name]["_buttons"][id][curTalent][k] = v;
		end
	else
		self.db[name]["_buttons"][id][curTalent] = {};
		if ((not self.db[name]["_buttons"][id][1] or self.db[name]["_buttons"][id][1] == {}) and (not self.db[name]["_buttons"][id][curTalent][2] or self.db[name]["_buttons"][id][curTalent][2] == {})) then
			tNuke(self.db[name]["_buttons"][id]);
			self.db[name]["_buttons"][id] ={};
		end
	end
end

function D:ButtonShowGrid(button)
	--local name = button:GetName();
	--if (name and string.find(name, "^DuowanActionBar")) then
	--	button.normalTexture:SetAlpha(0.6);
	--end
end

function D:ButtonHideGrid(button)
	--local name = button:GetName();
	--if (name and string.find(name, "^DuowanActionBar")) then
	--	if (not self:HasAction(button)) then
	--		button.normalTexture:SetAlpha(0.3);
	--	end
	--end
end

-- TODO: 刷新热键显示
function D:ButtonUpdateHotkeys(button)
	assert(button);

	local name = button:GetName();
    local hotkey = _G[name.."HotKey"];
    local key = GetBindingKey(name) or
                GetBindingKey("CLICK "..name..":LeftButton");

	local text = GetBindingText(key, "KEY_", 1);
    if ( text == "" ) then
        hotkey:SetText("");
        hotkey:SetPoint("TOPLEFT", button, "TOPLEFT", 1, -2);
        hotkey:Hide();
    else
        hotkey:SetText(text);
        hotkey:SetPoint("TOPLEFT", button, "TOPLEFT", -2, -2);
        hotkey:Show();
    end
end

function D:FindIndex()
	local index = 	1;
	local bar = _G["DuowanActionBar" .. index];
	while (bar) do
		if (not self.db[bar:GetName()] or self.db[bar:GetName()].close) then
			return index;
		end
		index = index + 1;
		bar = _G["DuowanActionBar" .. index];
	end

	return index;
end

function D:CreateBlzButtons(bar, index)
	if (index <= DUOWANBAR_BLZ_BAR) then
		local base = 10 - index;
		local name = bar:GetName() .. "Button";
		local buttons = {};
		local btn;
		for id=1, NUM_ACTIONBAR_BUTTONS do
			buttons[id] = CreateFrame("CheckButton", name .. id, bar, "ActionBarButtonTemplate");
			btn = buttons[id];
			btn:SetID(0);
			btn:UnregisterEvent("ACTIONBAR_SHOWGRID");
			btn:UnregisterEvent("ACTIONBAR_HIDEGRID");
			btn.normalTexture = _G[btn:GetName() .. "NormalTexture"];
			btn:SetAttribute("action", (base * 12 + id));
			btn.normalTexture:SetAlpha(0.6);
		end
		return buttons;
	end
end
--
function D:CreateActionBar(index, unit)
	local index = (index and index < DUOWANBAR_MAX_NUM) and index or self:FindIndex();
	if (index > DUOWANBAR_MAX_NUM) then
		UIErrorsFrame:AddMessage(L["你最多可以创建十条额外动作条"], 1.0, 0.1, 0.1, 1.0);
		return;
	end
	local name = "DuowanActionBar" .. index;
	local bar = _G[name];

	if (InCombatLockdown()) then
		dwPush(self.CreateActionBar, self, index, unit);
		dwPush(self.UpdateBar, self, name);
		return;
	end

	local btn;
	if (not bar) then
		bar = CreateFrame("Frame", name, UIParent);
		bar:SetHeight(40);
		bar:SetWidth(40);
		bar:SetFrameStrata("LOW");
		bar:SetToplevel(true);
		bar:SetMovable(true);
		bar:SetPoint("CENTER", UIParent, "CENTER", 0, 60);
		bar.num = 10;	-- default ten
		bar.tab = CreateFrame("Button", (bar:GetName() .. "Tab"), bar, "DuowanTabTemplate");
		bar.tab:SetPoint("TOPRIGHT", bar, "TOPRIGHT", 0, 0);
		bar.tab:RegisterForDrag("LeftButton");
		bar.tab:RegisterForClicks("AnyUp");
		bar.tab:RegisterEvent("PLAYER_REGEN_DISABLED");
		bar.tab:RegisterEvent("PLAYER_REGEN_ENABLED");
		bar.tab:SetScript("OnEvent", function(self, event)
			if (event == "PLAYER_REGEN_DISABLED") then
				-- TODO: 右键菜单
				self.inCombat = 1;
				if ( self.moving) then
					bar:StopMovingOrSizing();
				end
			else
				self.inCombat = nil;
			end
		end);
		bar.tab:SetScript("OnMouseDown", function(self, button)
			if (not D.db[name] or not D.db[name]["locked"]) then
				self.ismoving = true;
				bar:StartMoving();
			end
		end);
		bar.tab:SetScript("OnMouseUp", function(self, button)
			if (self.ismoving) then
				self.ismoving = false;
				bar:StopMovingOrSizing();
				local point, relativeTo, relativePoint, xOffset, yOffset = bar:GetPoint();
				D:SaveBarInfo(bar, {region={point, relativePoint, xOffset, yOffset}});
			end
		end);
		bar.tab:SetScript("OnClick", function(self, button)
			if (button == "RightButton") then
				curBar = bar;
				dew:Open(
					self,
					"children", function()
						dew:FeedAceOptionsTable(D.options)
					end
				);
			end
		end);

		bar.tab:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self,  "ANCHOR_RIGHT");
			GameTooltip:SetText(L["多玩动作条"] .. " " .. index);
			GameTooltip:AddLine(L["左键 - 拖动动作条"], 1, 1, 1);
			GameTooltip:AddLine(L["右键 - 弹出菜单项"], 1, 1, 1);
			GameTooltip:Show();
		end);
		bar.tab:SetScript("OnLeave", function(self)
			GameTooltip:Hide();
		end);

		bar.buttons = {};
		if (index <= DUOWANBAR_BLZ_BAR) then
			bar.buttons = D:CreateBlzButtons(bar, index);
		else
			for i=1, 12 do
				btn = self:CreateButton(bar, i);
				btn:SetID(i);
				bar.buttons[i] =  btn;
			end
		end
		bar.index = index;
		bar.buttons[1]:SetPoint("TOP", bar.tab, "BOTTOM", 0, -4);

		if (DUOWAN_FACADE_ENABLED) then
			bfRegisterButton("ActionButton", name .. "Button", 12);
		end
	end


	for i=1, 12 do
		if (unit) then
			btn = bar.butons[i];
			btn:SetAttribute("unit", unit);
		end
	end

	-- 刷新状态
	self.db[name] = self.db[name] or {};
	self.db[name].close = false;
	self.bars[index] = name;
	return bar;
end

function D:SaveBarInfo(bar, data)
	local name = bar:GetName();
	if (not self.db[name]) then
		self.db[name] = {};
	end

	for k, v in pairs(data) do
		self.db[name][k] = v;
	end
end

do
	-- 按线性排列
	local function SetLineArrange(bar, linenum)
		assert(bar);
		local inset = 4;

		linenum = linenum or 1;

		local cur_id

		for i = 1, ceil(bar.num/linenum) do
			for j = 1, linenum do
				cur_id = (i-1)*linenum + j
				if cur_id > bar.num then break end

				if cur_id > 1 then
					bar.buttons[cur_id]:ClearAllPoints();
					if j == 1 then
						bar.buttons[cur_id]:SetPoint("TOP", bar.buttons[cur_id - linenum], "BOTTOM", 0, -inset);
					else
						bar.buttons[cur_id]:SetPoint("LEFT", bar.buttons[cur_id - 1], "RIGHT", inset, 0);
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

	}

	local function SetFunnyArrange(bar)
		local inset = 2;
		if (bar.num == 12) then
			SetLineArrange(bar, 3);
		else
			for id, pos in pairs(suite[bar.num]) do
				bar.buttons[id]:ClearAllPoints();
				bar.buttons[id]:SetPoint(pos[1], bar.buttons[pos[2]], pos[3], pos[4], pos[5]);
			end
		end
	end
--------------
-- 参数
-- VERTICAL			1	纵向
-- HORIZONTAL		2	横向
-- DOUBLE			3	双排(横向)
-- FUNNY			4	趣味排列
	function D:Arrange(bar, t)
		if (t == VERTICAL) then
			SetLineArrange(bar, 1);
		elseif (t == HORIZONTAL) then
			SetLineArrange(bar, bar.num);
		elseif (t == DOUBLE) then
			SetLineArrange(bar, ceil(bar.num/2));
		elseif (t == FUNNY) then
			SetFunnyArrange(bar);
		end

		self:SaveBarInfo(bar, {arrange = t});
	end
end

-- 法术处理
function D:CheckCurSpell(spellInfo)
	if (type(spellInfo) ~= "table") then
		return false;
	end

	local curTalent = GetActiveTalentGroup() or 1;
	local tmp = {}
	if (not spellInfo[curTalent]) then
		tmp= {};
		for k, v in pairs(spellInfo) do
			if (type(k) == "string") then
				tmp[k] = v;
			end
		end
	else
		tmp = tClone(spellInfo[curTalent]);
	end

	return tmp;
end
---------------
-- 解决前四条动作条改动引起的不便
function D:ReStorActionInfo(bar, db)
	if (InCombatLockdown()) then return end
	local index = bar.index;
	local action, info;
	if (index <= DUOWANBAR_BLZ_BAR) then
		for i, button in ipairs(bar.buttons) do
			action = button:GetAttribute("action");
			if (db and db[i]) then
				info = self:CheckCurSpell(db[i]);

				if (not HasAction(action) and (info and info.type)) then
					if (info.type == "SPELL") then
						PickupSpell(info.name);
						PlaceAction(action);
					elseif (info.type == "ITEM") then
						PickupItem(info.name);
						PlaceAction(action);
					elseif (info.type == "MACRO") then		-- macro用什么作为ID呢???
						PickupMacro(info.name)
						PlaceAction(action);
					elseif (info.type == "EQUIPMENTSET") then
						PickupEquipmentSetByName(info.name);
						PlaceAction(action);
					end

					self:SaveButtonInfo(button, nil);
				end
			end
		end
	end
end
-- 刷新状态
function D:UpdateBar(bar)
	assert(bar);
	if (InCombatLockdown()) then
		dwPush(D.UpdateBar, self, bar);
		return;
	end

	if (type(bar) == "string") then
		bar = _G[bar];
	end

	if (not bar) then	return end

	local db = self.db[bar:GetName()];
	if (db) then
		-- 定位 缩放
		db.region = db.region or {"BOTTOM", "BOTTOM", 400, 240};
		db.scale = db.scale or 1.0;
		bar:ClearAllPoints();
		bar:SetPoint(db.region[1], UIParent, db.region[2], db.region[3], db.region[4] );
		bar:SetScale(db.scale);

		-- 最小化 隐藏多余按键
		db.minimized = db.minimized or false;
		db.count = db.count or 10;
		bar.num = db.count;
		self:UpdateSatus(bar, db.minimized);

		-- 排列
		db.arrange = db.arrange or FUNNY;
		bar.arrange = db.arrange;
		self:Arrange(bar, db.arrange);

		-- 设置法术
		db._buttons = db._buttons or {};
		if (bar.index > DUOWANBAR_BLZ_BAR) then
			local tmp, v;

			for i=1, 12 do
				v = db._buttons[i];
				if (i > 0 and v) then
					tmp = self:CheckCurSpell(v);
					if (tmp and tmp ~= {}) then
						self:SetActionInfo(bar.buttons[i], tmp);
					else
						self:SetActionInfo(bar.buttons[i], nil);
					end
				end
			end
		else
			tinsert(self.ReStorInfo, {bar = bar, db = db._buttons,})
		end
		-- 隐藏bar
		if (db.close) then
			bar:Hide();
		else
			bar:Show();
		end
	end
end

function D:UpdateTabStatus()
	if (self.db.hideTab) then
		for i, name in ipairs(D.bars) do
			_G[name .. "Tab"]:Show();
		end
	else
		for i, name in ipairs(D.bars) do
			_G[name .. "Tab"]:Hide();
		end
	end
end

function D:UpdateSatus(bar, ismini)
	if (InCombatLockdown()) then
		dwPush(D.UpdateBar, self, bar, ismini);
		return;
	end

	for i=1, bar.num do
		if (ismini) then
			bar.buttons[i]:SetAttribute("statehidden", true);
			bar.buttons[i]:Hide();
		else
			bar.buttons[i]:SetAttribute("statehidden", false);
			bar.buttons[i]:Show();
		end
	end
	-- 多余的全部隐藏
	for i=bar.num+1, 12 do
		bar.buttons[i]:SetAttribute("statehidden", true);
		bar.buttons[i]:Hide();
	end
end

function D:HideBar(bar)
	if (InCombatLockdown()) then
		dwPush(self.HideBar, self, bar);
		return;
	end

	if (type(bar) == "string") then
		bar = _G[bar];
	end

	bar:Hide();
	local name = bar:GetName();
	if (self.db[name]) then
		for k, v in pairs(self.db[name]) do
			if (k == "_buttons" and #(v) > 0) then
			else
				self.db[name][k] = nil;
			end
		end

		--if (not self.db[name]["_buttons"]) then
		--	self.db[name] = tNuke(self.db[name]);
		--else
			self.db[name].close = true;
		--end
	end
end

--------------------
-- Interface for Duowan
function DuowanBar_Toggle(switch)
	if (switch) then
		D:Enable();

	else
		D:Disable();
	end
end

function DuowanBarTab_Toggle(switch)
	if (switch) then
		D.db.hideTab = false;
	else
		D.db.hideTab = true;
	end
	D:UpdateTabStatus();
end

function DuowanBarAlwaysShow(switch)
	if (switch) then
		D:IncGrid();
	else
		D:DecGrid();
	end

	D:UpdateAllGrid();
end