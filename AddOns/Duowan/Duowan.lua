--=====================================
-- 名称: Duowan
-- 日期: 2009-12-16
-- 版本: 1.0.1
--	描述: 多玩基本库
-- 作者: dugu
-- 版权所有 (C) duowan.com
--======================================

local _DEBUG = true;
local L = DUOWAN_LOCALIZATION;
DW_NewModules = {};
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
-- 动作条自动对齐
StickyBarList = {
	"dwMainBar", 
	"dwBottomLeftBar", 
	"dwBottomRightBar", 
	"dwRightBar1", 
	"dwRightBar2", 
	"dwShapeShiftBar", 
	"dwMultiCastBar", 
	--"dwPossessBar", 
	"dwPlayerPetBar"
};

for i=1, 10 do
	tinsert(StickyBarList, "DuowanActionBar" .. i);
end

RevStickyBarList = {};
for k, name in pairs(StickyBarList) do
	RevStickyBarList[name] = true;
end

local DUOWAN_LOADED_ADDONS = {};
DUOWAN_RealmName = GetCVar("realmName");
if not DUOWAN_RealmName then
	DUOWAN_RealmName = "China";
end;
DUOWAN_PlayerName = UnitName("player");
if not DUOWAN_PlayerName then
	DUOWAN_PlayerName = "Unknown";
end;
local BattleGroundGroup;
DUOWAN_PlayerId = DUOWAN_RealmName .. "__" .. DUOWAN_PlayerName;
-- 保存所有的配置
Duowan_CVar = {};
Duowan_CVar[DUOWAN_PlayerId]={};
Duowan_Frames = {};
Duowan_PublicVar = {};
Duowan_PublicVar[DUOWAN_RealmName] = {};

StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"] = {
	text = L["禁用插件要|cffff7000重新载入界面|r才能生效,\n是否选择立即重载？\n如果取消|cffffff00下次登录|r时会禁用此模块"],
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function()		
		ReloadUI();
	end,
	OnCancel = function(_, reason)		
		if ( reason == "clicked" and type(StaticPopupDialogs["DUOWAN_RELOADUI_CONFIRM"].onCancelled) == "function") then
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

function dwGetPublicCVar()
	if (not Duowan_PublicVar) then
		Duowan_PublicVar = {};
	end
	if (not Duowan_PublicVar[DUOWAN_RealmName]) then
		Duowan_PublicVar[DUOWAN_RealmName] = {};
	end
	return Duowan_PublicVar[DUOWAN_RealmName];
end

-- 获取配置信息, 否则获得缺省配置
function dwGetCVar(module, name)
	local vals, isDef;
	if ((Duowan_CVar[DUOWAN_PlayerId]) and (Duowan_CVar[DUOWAN_PlayerId][module])) then		
		if (not Duowan_CVar[DUOWAN_PlayerId][module][name]) then
			DW_NewModules[module] = true;
			dwLoadDefaultCVar(module, name);			
		end
	else		
		dwLoadDefaultCVar(module);	
	end	

	vals = Duowan_CVar[DUOWAN_PlayerId][module][name] or 0;

	return vals, isDef;
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

function dwIsBigFootAddOn(name)
	if (GetAddOnMetadata(name, "X-Revision") == "BigFoot" and select(4, GetAddOnInfo(name))) then
		return true;
	end

	return false;
end

-----------------------
-- 
ModManagement_RegisterMod = function() end
ModManagement_RegisterCheckBox = function() end
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

function Duowan_ShowNewbieTooltip(title, ...) 
	 GameTooltip_SetDefaultAnchor(GameTooltip, UIParent); 
	 GameTooltip:SetText(title, 1.0, 1.0, 1.0); 
	 local args = {...}; 
	 local i;
	 for i = 1, table.maxn(args), 1 do 
		 GameTooltip:AddLine(args[i], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1.0, 1); 
	 end 
	 GameTooltip:Show(); 
 end 
-------------------
-- 保存框架位置
local sf = {};	 -- 需要保存位置的框架
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
function dwPush(func, argn, byarg)	
	assert(type(func) == "function", "First argument must be a function value.");

	index = index + 1;
	if (byarg) then
		stack[func] = stack[func] or {};	
		sequence[func] = sequence[func] or {};

		stack[func][argn[1]] = argn;
		sequence[func][argn[1]] = index;
	else
		stack[func] = {};
		sequence[func] = {};
		stack[func][1] = argn;
		sequence[func][1] = index;
	end	
end

function dwRunCallStack()
	local tmp = {};
	local tmp2= {};
	for func, v in pairs(sequence) do
		for arg1, index in pairs(v) do
			tmp[index] = {func, arg1};
		end
	end
	
	for k, v in pairs(tmp) do
		tinsert(tmp2, k);
	end
	table.sort(tmp2);
	local func, arg1;
	for i=1, #(tmp2) do
		func = tmp[tmp2[i]][1];
		arg1 = tmp[tmp2[i]][2];
		if (func and type(func) == "function"  and stack[func] and stack[func][arg1]) then
			pcall(func, unpack(stack[func][arg1]));
		end
	end

	stack = {};
	sequence = {};
	index = 0;
end

frame:SetScript("OnEvent", function(self)
	dwRunCallStack();
end);

function dwSecureCall(func, ...)	
	if (type(func) == "function") then
		if (InCombatLockdown()) then
			dwPush(func, {...});
			return;
		end

		pcall(func, ...);
	end
end

function dwSecureCall2(func, argn, byarg)	
	if (type(func) == "function") then
		if (InCombatLockdown()) then
			dwPush(func, argn, byarg);
			return;
		end

		pcall(func, unpack(argn));
	end
end

function dwRemoveSecureCall(func, arg1)	
	if (type(func) == "function" and stack[func]) then
		if (arg1 and stack[func][arg1]) then
			stack[func][arg1] = nil;
			sequence[func][arg1] = nil;
			return;
		end
		stack[func] = nil;
		sequence[func] = nil;
	end
end
-------------------------
-- 更合理的定位和缩放

local function AjustPosition(frame, parent)	
	--assert(type(frame:GetFrameType()) == "string", "Invalid <frame>, the type of frame must be userdata.");
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
		elseif (type(v[1]) ~= "function") then
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
	frame.slider.highText = dwGetglobal("Duowan_PopRangeSliderHigh");
	frame.slider.lowText = dwGetglobal("Duowan_PopRangeSliderLow");
	frame.slider.valueText = dwGetglobal("Duowan_PopRangeSliderText");
	frame.slider.thumb = dwGetglobal("Duowan_PopRangeSliderThumb");
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

do
	local frame = CreateFrame("Frame");
	frame:RegisterEvent("CHAT_MSG_ADDON");
	frame:SetScript("OnEvent", function(self, event, ...)
		local prefix, msg, channel, sender = ...;
		-- 检查GearScore
		if sender ~= DUOWAN_PlayerName and msg and channel ~= "WHISPER" and prefix == "Duowan_GearScore" then
			if (msg == "CheckGearScore" and GearScore_GetScore and GearScore_GetQuality) then	
				local gs = GearScore_GetScore(DUOWAN_PlayerName, "player");
				if (gs < 500) then 
					r, b, g = 1, 1, 1;
				else
					r, b, g = GearScore_GetQuality(gs);
				end
				local gsText = format("|cff%02x%02x%02x%d|r", r*255, g*255, b*255, gs);
					
				if GetRealNumRaidMembers() > 0 then
					SendAddonMessage("Duowan_GearScore", gsText, "RAID");
				elseif GetRealNumPartyMembers() > 0 then
					SendAddonMessage("Duowan_GearScore", gsText, "PARTY");
				end
			end
		end
		-- 同步YY频道ID
		if (sender ~= DUOWAN_PlayerName and msg and channel == "GUILD" and prefix == "Duowan_Speak") then
			
		end
	end);
end
---------------------------
-- 判断在某个时间

function dwInDate(low, high)
	assert(type(low) == "string", format("#low need a string value got a %s.", type(low)));
	if (high) then 
		assert(type(high) == "string", format("#high need a string value got a %s.", type(high)));
	end	

	local weekday, month, day, year = CalendarGetDate();	
	local now = string.format("%04d-%02d-%02d", year, month, day);

	if (high) then
		-- ["2010-10-20", "2010-10-30"] 10月20日到30日
		if (low <= now and now <= high) then
			return true;
		end
	else
		-- "2010-10-20"	 10月20日
		if (low == now) then
			return true;
		end
	end

	return false;
end

---------------
-- 刷新聊天泡泡
local CHAT_POPO_POSITION_X = 0;
function dwUpdateChatPopoPosition(x)
	CHAT_POPO_POSITION_X = x or CHAT_POPO_POSITION_X;
	for i=1, 4 do
		local member_frame = _G["PartyMemberFrame"..i];
		local frame = _G["ChatPopoFrame"..i];
		if (frame) then
			frame:ClearAllPoints();
			frame:SetPoint("TOPLEFT", member_frame, "TOPRIGHT", CHAT_POPO_POSITION_X, -5);
		end
	end	
end
---------------
-- 垃圾回收

do
local frame = CreateFrame("Frame");
frame.time = 0;
frame:SetScript("OnUpdate", function(self, elapsed)
	self.time = self.time + elapsed;

	if (self.time > 1500) then
		self.time = 0;
		-- 战斗中不执行, 避免造成卡机
		dwSecureCall(collectgarbage, "collect");
	end
end)
end

---------------
-- 战场组
--[[
local serverToRegion = {};

if GetLocale() == 'zhCN' then 
	serverToRegion={ 
		-- 1组
		["安威玛尔"] = 1,
		["尘风峡谷"] = 1,
		["卡扎克"] = 1,
		["库德兰"] = 1,
		["回音山"] = 1,
		["黑龙军团"] = 1,
		["基尔罗格"] = 1,
		["奥达曼"] = 1,
		["艾苏恩"] = 1,
		["卡德罗斯"] = 1,
		["藏宝海湾"] = 1,
		["达纳斯"] = 1,
		["黑石尖塔"] = 1,
		["红龙军团"] = 1,
		["迪托马斯"] = 1,
		["奥蕾莉亚"] = 1,
		["暴风祭坛"] = 1,
		["阿格拉玛"] = 1,
		["白银之手"] = 1,
		["国王之谷"] = 1,
		-- 2组
		["洛萨"] = 2,
		["烈焰峰"] = 2,
		["莫德古得"] = 2,
		["玛瑟里顿"] = 2,
		["蓝龙军团"] = 2,
		["索瑞森"] = 2,
		["普瑞斯托"] = 2,
		["罗宁"] = 2,
		["死亡之翼"] = 2,
		["伊瑟拉"] = 2,
		["玛多兰"] = 2,
		["萨格拉斯"] = 2,
		["雷霆之王"] = 2,
		["索拉丁"] = 2,
		["图拉扬"] = 2,
		["耐萨里奥"] = 2,
		["铜龙军团"] = 2,
		["山丘之王"] = 2,
		["燃烧平原"] = 2,
		["诺莫瑞根"] = 2,
		-- 3组
		["暗影之月"] = 3,
		["艾森娜"] = 3,
		["地狱之石"] = 3,
		["埃加洛尔"] = 3,
		["弗塞雷迦"] = 3,
		["毁灭之锤"] = 3,
		["达斯雷玛"] = 3,
		["奥拉基尔"] = 3,
		["卡德加"] = 3,
		["火焰之树"] = 3,
		["艾萨拉"] = 3,
		["地狱咆哮"] = 3,
		["爱斯特纳"] = 3,
		["戈古纳斯"] = 3,
		["风暴之怒"] = 3,
		["冰霜之刃"] = 3,
		["阿克蒙德"] = 3,
		["阿迦玛甘"] = 3,
		["埃苏雷格"] = 3,
		["风行者"] = 3,
		-- 4组
		["海加尔"] = 4,
		["闪电之刃"] = 4,
		["屠魔山谷"] = 4,
		["玛法里奥"] = 4,
		["伊利丹"] = 4,
		["塞纳里奥"] = 4,
		["战歌"] = 4,
		["拉文凯斯"] = 4,
		["麦维影歌"] = 4,
		["迷雾之海"] = 4,
		["耐普图隆"] = 4,
		["月神殿"] = 4,
		["主宰之剑"] = 4,
		["梦境之树"] = 4,
		["夏维安"] = 4,
		["泰兰德"] = 4,
		["石爪峰"] = 4,
		["轻风之语"] = 4,
		["月光林地"] = 4,
		["梅尔加尼"] = 4,
		-- 5组
		["亚门纳尔"] = 5,
		["血环"] = 5,
		["鲜血之环"] = 5,
		["雷霆号角"] = 5,
		["雷斧堡垒"] = 5,
		["狂风峭壁"] = 5,
		["凯恩血蹄"] = 5,
		["迦罗娜"] = 5,
		["火羽山"] = 5,
		["黄金之路"] = 5,
		["红云台地"] = 5,
		["红龙女王"] = 5,
		["黑暗之矛"] = 5,
		["鬼雾峰"] = 5,
		["古雷曼格"] = 5,
		["符文图腾"] = 5,
		["杜隆坦"] = 5,
		["布莱克摩"] = 5,
		["奥蕾塞丝"] = 5,
		["埃德萨拉"] = 5,
		-- 6组
		["萨尔"] = 6,
		["千针石林"] = 6,
		["血牙魔王"] = 6,
		["诺兹多姆"] = 6,
		["普罗德摩"] = 6,
		["灰烬使者"] = 6,
		["羽月"] = 6,
		["熊猫酒仙"] = 6,
		["勇士岛"] = 6,
		["玛里苟斯"] = 6,
		["蜘蛛王国"] = 6,
		["甜水绿洲"] = 6,
		["禁魔监狱"] = 6,
		["自由之风"] = 6,
		["雷克萨"] = 6,
		["圣火神殿"] = 6,
		["死亡之门"] = 6,
		["纳沙塔尔"] = 6,
		["燃烧之刃"] = 6,
		-- 7组
		["艾欧纳尔"] = 7,
		["阿拉索"] = 7,
		["巴尔古恩"] = 7,
		["埃雷达尔"] = 7,
		["达隆米尔"] = 7,
		["耳语海岸"] = 7,
		["寒冰皇冠"] = 7,
		["激流堡"] = 7,
		["阿尔萨斯"] = 7,
		["冰风岗"] = 7,
		["巨龙之吼"] = 7,
		["古尔丹"] = 7,
		["拉格纳洛斯"] = 7,
		["基尔加丹"] = 7,
		["莱斯霜语"] = 7,
		["利刃之拳"] = 7,
		["奥特兰克"] = 7,
		["暗影议会"] = 7,
		-- 8组
		["银松森林"] = 8,
		["克尔苏加德"] = 8,
		["凯尔萨斯"] = 8,
		["霜之哀伤"] = 8,
		["瑞文戴尔"] = 8,
		["血色十字军"] = 8,
		["鹰巢山"] = 8,
		["提瑞斯法"] = 8,
		["通灵学院"] = 8,
		["银月"] = 8,
		["希尔瓦娜斯"] = 8,
		["玛诺洛斯"] = 8,
		["霜狼"] = 8,
		["斯坦索姆"] = 8,
		["影牙要塞"] = 8,
		["麦迪文"] = 8,
		["耐奥祖"] = 8,
		["遗忘海岸"] = 8,
		-- 9组
		["黑暗魅影"] = 9,
		["世界之树"] = 9,
		["斩魔者"] = 9,
		["玛格索尔"] = 9,
		["迅捷微风"] = 9,
		["守护之剑"] = 9,
		["寒霜皇冠"] = 9,
		["泰坦之拳"] = 9,
		["阴影之刺"] = 9,
		["加兹鲁维"] = 9,
		["激流之傲"] = 9,
		["卡珊德拉"] = 9,
		["恶魔之翼"] = 9,
		["苏塔恩"] = 9,
		["万色星辰"] = 9,
		["水晶之刺"] = 9,
		["布兰卡德"] = 9,
		["狂热之刃"] = 9,
		["浸毒之骨"] = 9,
		["雏龙之翼"] = 9,
		-- 10
		["午夜之镰"] = 10,
		["芬里斯"] = 10,
		["伊森利恩"] = 10,
		["暮色森林"] = 10,
		["伊萨里奥斯"] = 10,
		["永夜港"] = 10,
		["大地之怒"] = 10,
		["提尔之手"] = 10,
		["踏梦者"] = 10,
		["日落沼泽"] = 10,
		["密林游侠"] = 10,
		["法拉希姆"] = 10,
		["神圣之歌"] = 10,
		["金色平原"] = 10,
		["加拉德尔"] = 10,
		["风暴之眼"] = 10,
		["安多哈尔"] = 10,
		["朵丹尼尔"] = 10,
		["元素之力"] = 10,
		["加德纳尔"] = 10,
		-- 11
		["破碎岭"] = 11,
		["黑手军团"] = 11,
		["安其拉"] = 11,
		["卡拉赞"] = 11,
		["黑翼之巢"] = 11,
		["熔火之心"] = 11,
		["阿纳克洛斯"] = 11,
		["桑德兰"] = 11,
		["雷霆之怒"] = 11,
		["瓦里玛萨斯"] = 11,
		["血羽"] = 11,
		["克苏恩"] = 11,
		["安纳塞隆"] = 11,
		["阿努巴拉克"] = 11,
		["阿拉希"] = 11,
		["克洛玛古斯"] = 11,
		["龙骨平原"] = 11,
		["巴纳扎尔"] = 11,
		["燃烧军团"] = 11,
		["德拉诺"] = 11,
		-- 12
		["洛丹伦"] = 12,
		["纳克萨玛斯"] = 12,
		["格瑞姆巴托"] = 12,
		["萨菲隆"] = 12,
		["森金"] = 12,
		["泰拉尔"] = 12,
		["海克泰尔"] = 12,
		["无尽之海"] = 12,
		["哈卡"] = 12,
		["库尔提拉斯"] = 12,
		["莱索恩"] = 12,
		["瓦拉斯塔兹"] = 12,
		["奎尔萨拉斯"] = 12,
		["拉贾克斯"] = 12,
		["海达希亚"] = 12,
		["古拉巴什"] = 12,
		["范达尔鹿盔"] = 12,
		["永恒之井"] = 12,
		["奈法利安"] = 12,
		["拉文霍德"] = 12,
		-- 13
		["恐怖图腾"] = 13,
		["黑铁"] = 13,
		["格雷迈恩"] = 13,
		["迪瑟洛克"] = 13,
		["艾维娜"] = 13,
		["阿卡玛"] = 13,
		["菲拉斯"] = 13,
		["巴瑟拉斯"] = 13,
		["古加尔"] = 13,
		["布莱恩"] = 13,
		["血顶"] = 13,
		["埃克索图斯"] = 13,
		["丹莫德"] = 13,
		["灰谷"] = 13,
		["加里索斯"] = 13,
		["恶魔之魂"] = 13,
		["达文格尔"] = 13,
		["艾莫莉丝"] = 13,
		["阿扎达斯"] = 13,
		["加基森"] = 13,
		-- 14
		["瑟莱德丝"] = 14,
		["祖尔金"] = 14,
		["达卡尼"] = 14,
		["塞拉赞恩"] = 14,
		["天空之墙"] = 14,
		["奥斯里安"] = 14,
		["风暴之鳞"] = 14,
		["托塞德林"] = 14,
		["诺森德"] = 14,
		["黑暗虚空"] = 14,
		["塔纳利斯"] = 14,
		["大漩涡"] = 14,
		["维克尼拉斯"] = 14,
		["逐日者"] = 14,
		["伊莫塔尔"] = 14,
		["奥妮克希亚"] = 14,
		["荆棘谷"] = 14,
		["安戈洛"] = 14,
		["祖鲁希德"] = 14,
		["外域"] = 14,
		--15
		["火喉"] = 15,
		["噬灵沼泽"] = 15,
		["戈杜尼"] = 15,
		["莫什奥格"] = 15,
		["迪塔格"] = 15,
		["金度"] = 15,
		["冰川之拳"] = 15,
		["巨槌"] = 15,
		["米奈希尔"] = 15,
		["幽暗沼泽"] = 15,
		["艾隆纳亚"] = 15,
		["火烟之谷"] = 15,
		["玛加萨"] = 15,
		["伊兰尼库斯"] = 15,
		["迦玛兰"] = 15,
		["刺骨利刃"] = 15,
		["深渊之巢"] = 15,
		["莫格莱尼"] = 15,
		["邪恶颅壳"] = 15,
		--16
		["怀特迈恩"] = 16,
		["烈焰荆棘"] = 16,
		["夺灵者"] = 16,
		["石锤"] = 16,
		["碎颅者"] = 16,
		["匹瑞诺德"] = 16,
		["风暴裂隙"] = 16,
		["奥丹姆"] = 16,
		["瑟玛普拉格"] = 16,
		["伊森德雷"] = 16,
		["碎裂之拳"] = 16,
		["邪枝"] = 16,
		["冬泉谷"] = 16,
		["岩石巨塔"] = 16,
		["耐克鲁斯"] = 16,
		["塞拉摩"] = 16,
		["扎拉赞恩"] = 16,
		["亚雷戈斯"] = 16,
		["破碎之手"] = 16,
		["维克洛尔"] = 16,
		--17
		["迪门修斯"] = 17,
		["刀塔"] = 17,
		["火焰之地"] = 17,
		["阿古斯"] = 17,
		["凤凰之神"] = 17,
		["黑暗之门"] = 17,
		["深渊之喉"] = 17,
		["格鲁尔"] = 17,
		["血槌"] = 17,
		["戴索姆"] = 17,
		["死亡熔炉"] = 17,
		["鲜血熔炉"] = 17,
		["盘牙"] = 17,
		["军团要塞"] = 17,
		--18
		["摩摩尔"] = 18,
		["希雷诺斯"] = 18,
		["范克里夫"] = 18,
		["风暴要塞"] = 18,
		["太阳之井"] = 18,
		["破碎大厅"] = 18,
		["提克迪奥斯"] = 18,
		["祖阿曼"] = 18,
		["希奈丝特拉"] = 18,
		["雷德"] = 18,
		["塞泰克"] = 18,
		["翡翠梦境"] = 18,
		["试炼之环"] = 18,
		--19
		["达基萨斯"] = 19,
		["壁炉谷"] = 19,
		["迦顿"] = 19,
		["安苏"] = 19,
		["阿比迪斯"] = 19,
		["末日行者"] = 19,
		["盖斯"] = 19,
		["贫瘠之地"] = 19,
		["加尔"] = 19,
		["达尔坎"] = 19,
		["阿曼尼"] = 19,
		["戈提克"] = 19,
		["熵魔"] = 19,
		["白骨荒野"] = 19,
		["能源舰"] = 19,
		["血吼"] = 19,
		--20
		["玛格曼达"] = 20,
		["莉亚德琳"] = 20,
		["奎尔丹纳斯"] = 20,
		["霍格"] = 20,
		["莫加尔"] = 20,
		["萨贝里安"] = 20,
		["风暴峭壁"] = 20,
		["达克萨隆"] = 20,
	};
end

function dwGetBGGroup()	
	if (not BattleGroundGroup) then
		if serverToRegion and serverToRegion[DUOWAN_RealmName] then 
			BattleGroundGroup = serverToRegion[DUOWAN_RealmName];			
		end
		serverToRegion = nil;
		return BattleGroundGroup;
	end
	
	return false;
end
]]
-------------------
-- 团队公告
do
StaticPopupDialogs["TEAMNOTICE_SET_TEXT"] = {
	text = DUOWAN_TEAMNOTICE_ADD_TEXT,
	button1 = ACCEPT,
	button2 = CANCEL,
	hasEditBox = 1,
	maxLetters = 48,
	hasWideEditBox = 1,
	OnAccept = function(self)
		local editBox = _G[self:GetName().."WideEditBox"];
		local text = editBox:GetText();
		dwSetCVar("DuowanConfig", "TeamNoticeText", text);
		if  GetNumRaidMembers()>0 and IsRealRaidLeader() then
			SendChatMessage(DUOWAN_TEAMNOTICE_HEAD..text, "raid");
		end
	end,
	OnShow = function(self)
		local text = dwRawGetCVar("DuowanConfig", "TeamNoticeText", DUOWAN_TEAMNOTICE_TEXT);
		_G[self:GetName().."WideEditBox"]:SetText(text);
		_G[self:GetName().."WideEditBox"]:HighlightText();
	end,
	OnHide = function(self)
		_G[self:GetName().."WideEditBox"]:SetText("");
	end,
	EditBoxOnEnterPressed = function(self)
		local editBox = _G[self:GetName()];
		local text = editBox:GetText();
		dwSetCVar("DuowanConfig", "TeamNoticeText", text);		
		if  GetNumRaidMembers()>0 and IsRealRaidLeader() then
			SendChatMessage(DUOWAN_TEAMNOTICE_HEAD..text, "raid");
		end
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

local enableNotice = true;
local firstLoaded = true;
local __RaidMembers = {};
local frame = CreateFrame("Frame");
frame:RegisterEvent("RAID_ROSTER_UPDATE");
	
local function OnEvent(self, event, ...)
	if (GetNumRaidMembers()>0) then
		local tmp = {};
		local name, rank, subgroup, level, class, fileName, _, online;
		for i=1, GetNumRaidMembers() do
			name, rank, subgroup, level, class, fileName, _, online = GetRaidRosterInfo(i);
			tmp[name] = class; 
		end

		if (enableNotice and IsRealRaidLeader()) then
			local text = dwRawGetCVar("DuowanConfig", "TeamNoticeText", DUOWAN_TEAMNOTICE_TEXT);
			for name, v in pairs(tmp) do
				if (not __RaidMembers[name]) then
					SendChatMessage(DUOWAN_TEAMNOTICE_HEAD..text,"WHISPER",nil,name);
				end
			end
		end
		__RaidMembers = tmp;
	end
end

local function UpdateMembers()
	if (GetNumRaidMembers()>0) then
		local tmp = {};
		local name, rank, subgroup, level, class, fileName, _, online;
		for i=1, GetNumRaidMembers() do
			name, rank, subgroup, level, class, fileName, _, online = GetRaidRosterInfo(i);
			tmp[name] = class; 
		end
		__RaidMembers = tmp;
	end
end
frame:SetScript("OnEvent", OnEvent);

function dwTeamNotice_Toggle(switch)
	if (switch) then
		enableNotice = true;
		dwDelayCall(UpdateMembers, 3);
	else
		enableNotice = false;
	end
end

function dwSetTeamNotice()
	StaticPopup_Show("TEAMNOTICE_SET_TEXT");
	PlaySound("igMainMenuOption");
end
end

do
if (dwIsConfigurableAddOn("QuestInfo")) then
	StaticPopupDialogs["DUOWAN_OPEN_QUESTINFO"] = {
		text = DUOWAN_QUESTINFO_DIALOG_TEXT,
		button1 = TEXT(OKAY),
		button2 = TEXT(CANCEL),
		OnAccept = function()		
			LoadAddOn("QuestInfo");
			dwSetCVar("QuestMod", "QuestInfoEnable", 1);
		end,
		OnCancel = function(_, reason)
		end,
		timeout = 30,
		showAlert = 1,
		hideOnEscape = 1
	};

	local button = CreateFrame("Button", "ToggleQuestInfo", WorldMapDetailFrame, "UIPanelButtonTemplate");
	button:SetWidth(80);
	button:SetHeight(28);
	button:SetText(DUOWAN_QUESTINFO_TEXT);
	button:SetPoint("TOPRIGHT", WorldMapDetailFrame, "TOPRIGHT", -30, -40);
	button:RegisterEvent("ADDON_LOADED");
	button:SetScript("OnClick", function(self)
		StaticPopup_Show("DUOWAN_OPEN_QUESTINFO");	
	end);
	button:SetFrameLevel(button:GetFrameLevel()+5);
	button:SetScript("OnEvent", function(self, event, addon)
		if (addon == "QuestInfo") then
			self:Hide();
		end
	end);
	button:SetScript("OnEnter", function(self)
		GameTooltip_SetDefaultAnchor(GameTooltip, self);
		GameTooltip:SetText(DUOWAN_QUESTINFO_LOAD_TEXT, 1, 1, 1);
		GameTooltip:Show();
	end);
	button:SetScript("OnLeave", function(self)		
		GameTooltip:Hide();
	end);
	if (dwIsAddOnLoaded("QuestInfo")) then
		button:Hide();
	else
		button:Show();
	end	
end
end