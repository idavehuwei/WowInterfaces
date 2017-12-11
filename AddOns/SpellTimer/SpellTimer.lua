SpellTimer = LibStub("AceAddon-3.0"):NewAddon("SpellTimer", "AceHook-3.0", "AceEvent-3.0");
SpellTimer._DEBUG = true;
SPELL_TIMER_LOADED = nil;
SPELL_TIMER_SPELLS_DATE = {};
local SPELL_TIMER_TIME_TABLE = {};
local SPELLTIMER_MAX_UNITFRAME_COUNT = 1;
local SPELLTIMER_MAX_SPELLFRAME_COUNT = 1;
local SpellTimer_Spells = {};
local SpellTimer_Generated = false;
local SpellTimer_SpellsSaved = {};
local SpellTimer_Enabled = nil;
local SpellTimer_GUID = nil;
local SpellTimer_Class = nil;

SpellTimer_Config = {
	Enabled = nil,
	EnabledTest = nil,	
	ShowProgressBar = 1,
	ShowName = 1,
	WarningTime = 5,
	HideAllWhenLeaveCombat = 1,
	Scale = 0.8,
};

local SpellTimer_DefaultConfig = {	
	ShowProgressBar = 1,
	ShowName = 1,
	WarningTime = 5,
	HideAllWhenLeaveCombat = 1;
	Scale = 0.8,
	BackAlpha = 0.5,
	HasBack = 1;	 -- [1|0] - 1:true 0:false
	BorderAlpha = 0.5;
	HasBorder = 0;
	Locked = 0;
	RightCancel = 1;
};

local function SpellTimer_GetC(key)
	return SpellTimer_Config[key] or SpellTimer_DefaultConfig[key];
end

local function SpellTimer_SetC(key, value )
	SpellTimer_Config[key] = value;
end

local SpellTimer_Options = {	
	{
		text = SPELL_TIMER_TITILE,			
		notCheckable = true,
		isTitle = true,
	},
	{
		text = SPELL_TIMER_LOCK_POSITION, 
		checked = function()
			return SpellTimer_GetC("Locked") == 1;
		end,
		func = function()
			local value = math.abs(SpellTimer_GetC("Locked") - 1);
			SpellTimer_SetC("Locked", value )
		end,
	},
	{
		text = SPELL_TIMER_CANCEL_TIMER,
		checked = function()
			return SpellTimer_GetC("RightCancel") == 1;
		end,
		func = function()
			local value = math.abs(SpellTimer_GetC("RightCancel") - 1);
			SpellTimer_SetC("RightCancel", value )
		end,
	},	
	{
		text = SPELL_TIMER_CHANGE_SCALE,
		arg1 = 0.2,	-- min value
		arg2 = 1.5,	-- max value						
		func = function(self, arg1, arg2)	
			Duowan_ShowPopRange(
				arg1, 
				arg2, 
				SpellTimer_GetC("Scale"), 
				0.05, 
				true, 
				function(value)
					dwSetScale(SpellTimerMainFrame, value);
				end,
				nil,
				function(value)
					SpellTimer_SetC("Scale", value);					
				end,				
				nil
			);
		end,
	},
	{
		text = SPELL_TIMER_DISPLAY_BORDER,
		checked = function()
			return SpellTimer_GetC("HasBorder") == 1;
		end,
		func = function()
			local value =  math.abs(SpellTimer_GetC("HasBorder") - 1);			
			SpellTimer_SetC("HasBorder", value );
		end,
	},
	{
		text = SPELL_TIMER_CHANGE_BD_ALPHA,
		arg1 = 0,	-- min value
		arg2 = 1,	-- max value
		func = function(self, arg1, arg2)	
			BigFoot_ShowPopRange(
				arg1, 
				arg2, 
				SpellTimer_GetC("BorderAlpha"), 
				0.05, 
				true, 
				function(value)
					for i=1, SPELLTIMER_MAX_UNITFRAME_COUNT  do
						local frame = getglobal("SpellTimerUnitFrame" .. i);
						if (frame) then
							local r, g, b = frame:GetBackdropBorderColor();
							frame:SetBackdropBorderColor(r, g, b, value);		
						end										
					end
				end,
				nil,
				function(value)
					SpellTimer_SetC("BorderAlpha", value);
				end,
				nil
			);
		end,
	},
	{											-- [2]
		text = SPELL_TIMER_DISPLAY_BACKGD,
		checked = function()
			return SpellTimer_GetC("HasBack") == 1;
		end,
		func = function()
			local value = math.abs(SpellTimer_GetC("HasBack") - 1);			
			SpellTimer_SetC("HasBack", value );			
		end,
	},
	{
		text = SPELL_TIMER_CHANGE_BG_ALPHA,
		arg1 = 0,	-- min value
		arg2 = 1,	-- max value						
		func = function(self, arg1, arg2)	
			Duowan_ShowPopRange(
				arg1, 
				arg2, 
				SpellTimer_GetC("BackAlpha"), 
				0.05, 
				true, 
				function(value)
					for i=1, SPELLTIMER_MAX_UNITFRAME_COUNT  do
						local frame = getglobal("SpellTimerUnitFrame" .. i);
						if (frame) then
							local r, g, b = frame:GetBackdropColor();
							frame:SetBackdropColor(r, g, b, value);
						end						
					end
				end,
				nil,
				function(value)
					SpellTimer_SetC("BackAlpha", value);
				end,				
				nil
			);
		end,
	},
	{
		text = CANCEL,		
		func = function()			
		end,
	},
};

local SpellTimer_Back_Color = {
	["player"] = {r = 0.0, g = 0.0, b = 1.0},
	["target"] = {r = 1.0, g = 1.0, b = 0.0},
	["others"] = {r = 0.0, g = 0.0, b = 0.0},
};

function SpellTimer:debug(pattern, ...)
	if (self._DEBUG) then
		print(format(pattern, ...));
	end
end

function SpellTimer_TrapActiveFunc()
	return 2;
end

function SpellTimer_ComboSearchFunc(text, pattern)
	local ret = {};
	local s, e, key, value;

	s, e, key, value = string.find(text, pattern);
	while (s and e) do
		ret[tonumber(key)] = tonumber(value);
		s, e, key, value = string.find(text, pattern, e);
	end

	return ret;
end

-- 获得切割的增长率
-- 强化切割 天赋在天赋树的第二版
function GetQieGeTalentRate()
	if (not rateQieGe) then
		local rate = 1;
		for i = 1, GetNumTalents(1) do
			local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(2, i);
			if (name == SPELL_TIMER_IMPROVED_SLICE_DICE) then
				if (rank == 1) then
					rateQieGe = 1.15;
				elseif (rank == 2) then
					rateQieGe = 1.3;
				elseif (rank == 3) then
					rateQieGe = 1.45;
				else
					rateQieGe = 1;
				end
				break;
			end
		end
	end

	return rateQieGe;
end

function RecomputeForQieGe(time)
	local rate = GetQieGeTalentRate();
	if (rate) then
		return time * rate;
	else
		return time;
	end
end

function SpellTimer_TrapSearchFunc(text, pattern)
	local ret = {};
	local s, e;
	s, e, ret[1] = string.find(text, pattern[1]);
	if (s and e) then
		ret[1] = tostring(tonumber(ret[1])*pattern[2]);
		s, e, ret[2] = string.find(text, pattern[3]);
		if (s and e) then
			ret[2] = tostring(tonumber(ret[2])*pattern[4]);
			return ret;
		end
	end
end

function SpellTimer_TrapActiveFunc()
	return 2;
end

function SpellTimer:OnInitialize()
	_, SpellTimer_Class = UnitClass("player");
	SpellTimer_GUID = UnitGUID("player");
	SpellTimer_GenerateTable();	-- 收集信息
	SpellTimer_Config.Spells = nil;	-- 清空原信息
	dwSetScale(SpellTimerMainFrame, SpellTimer_GetC("Scale"));
	dwRegisterForSaveFrame(SpellTimerMainFrame, "SpellTimerMainFrame");		
	SpellTimerMainFrame:SetClampedToScreen(true);
	SPELL_TIMER_LOADED = true;
	self:RegisterEvent("PLAYER_LOGIN");
	self:RegisterEvent("LEARNED_SPELL_IN_TAB");
end

function SpellTimer:PLAYER_LOGIN()
	self:UnregisterEvent("PLAYER_LOGIN");
	DuowanSpells_TakeSnapshot();
end

function SpellTimer:LEARNED_SPELL_IN_TAB()
	DuowanSpells_RefreshSpells();
end

function SpellTimer:OnEnable()
	--self:Toggle(true);
end

function SpellTimer:OnDisable()
	--self:Toggle(false);
end

function SpellTimer_CastHookFunc()
	if (SpellTimer_Enabled and UnitExists("target")) then
		SpellTimer_LastTargetName = UnitName("target");
		SpellTimer_LastTargetGUID = UnitGUID("target");
		SpellTimer_LastTargetLevel = UnitLevel("target");
	end
end

local SpellTimer_CastHooked = nil;
local TotemFrameScript = TotemFrame:GetScript("OnShow")
function SpellTimer:Toggle(toggle)
	if (toggle and not SpellTimer_Enabled) then
		SpellTimerMainFrame:Show();
		
		SpellTimer_Enabled = 1;
		SpellTimer_Config.EnabledTest = 1;
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
		self:RegisterEvent("PLAYER_TOTEM_UPDATE");
		self:RegisterEvent("PLAYER_REGEN_ENABLED");
		self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
		self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED");
		self:RegisterEvent("PLAYER_TARGET_CHANGED");
		self:RegisterEvent("PLAYER_FOCUS_CHANGED");
		self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");		
		self:RegisterEvent("UNIT_AURA");		
		
                TotemFrame:UnregisterEvent("PLAYER_TOTEM_UPDATE")
                TotemFrame:UnregisterEvent("PLAYER_ENTERING_WORLD")
                TotemFrame:SetScript("OnShow", function() TotemFrame:Hide() end)
                TotemFrame:Hide()       
	elseif (not toggle and SpellTimer_Enabled) then
		for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
			local frame = getglobal("SpellTimerSpellFrame"..i);
			if (frame) then
				frame:Hide();
			end
		end

		TotemFrame:RegisterEvent("PLAYER_TOTEM_UPDATE")
                TotemFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
                TotemFrame:Show()
                TotemFrame:SetScript("OnShow", TotemFrameScript)
		for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
			local frame = getglobal("SpellTimerUnitFrame"..i);
			if (frame) then
				frame:Hide();
			end
		end

		SpellTimerMainFrame:Hide();
		
		SpellTimer_Enabled = nil;
		SpellTimer_Config.EnabledTest = nil;
		
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
		self:UnregisterEvent("PLAYER_TOTEM_UPDATE");
		self:UnregisterEvent("PLAYER_REGEN_ENABLED");
		self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED");
		self:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED");
		self:UnregisterEvent("PLAYER_TARGET_CHANGED");
		self:UnregisterEvent("PLAYER_FOCUS_CHANGED");
		self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT");		
		self:UnregisterEvent("UNIT_AURA");
	end
end

-- 参数改为unit, 不单只对"target"同步. 
function SpellTimer:SyncTime(unit)
	if (not UnitExists(unit)) then return	end	
	
	local guid, unitName = UnitGUID(unit), UnitName(unit);
	local name, rank, icon, count, debuffType, duration, timeLeft, unitCaster;
	local debuffs = {};	 -- 包括buff信息	
	local cache = {};
	-- 收集DeBuffs信息, 我发现系统的代码并没有用while -- break, 安全起见我也未这样改
	for i = 1, MAX_TARGET_DEBUFFS do			
		name, rank, icon, count, debuffType, duration, timeLeft, unitCaster = UnitDebuff(unit, i);
		-- 只收集自己施放的, 并且持续时间小于2分钟的
		if ((unitCaster == "player" or unitCaster == "pet") and name and duration and duration > 0 and duration <= 120) then
			if (SpellTimer_SpellsSaved[name]) then
				
				--SpellTimer_SpellsSaved[name] = true;
				--table.insert(SpellTimer_Spells, name);
			
				if (not cache[name]) then
					local debuff		= {};
					debuff.flags		= SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name][5];
					debuff.guid		= guid;
					debuff.target		= unitName;
					debuff.spell		= name;
					debuff.rank		= rank;
					debuff.startTime		= timeLeft - duration;
					debuff.duration		= duration;
					debuff.texture		= icon;
					debuff.count		= count;
					debuffs[name]		= debuff;
					cache[name]		= true;
				end
			end
		end
	end
	-- 收集Buffs信息	
	for j = 1, MAX_TARGET_BUFFS do	
		name, rank, icon, count, debuffType, duration, timeLeft, unitCaster = UnitBuff(unit, j);

		-- 只收集自己施放的			
		if ((unitCaster == "player" or unitCaster == "pet") and name and duration and duration > 0 and duration <= 120) then
			--if (not SpellTimer_SpellsSaved[name]) then
			--	SpellTimer_SpellsSaved[name] = true;
			--	table.insert(SpellTimer_Spells, name);
			--end
			if (SpellTimer_SpellsSaved[name]) then
				if (not cache[name]) then
					--self:debug("name: %s duration: %d", name, duration)
					local debuff		= {};
					debuff.flags		= SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name][5] or {["live"] = 1};
					debuff.guid		= guid;
					debuff.target		= unitName;
					debuff.spell		= name;
					debuff.rank		= rank;
					debuff.startTime		= timeLeft - duration;
					debuff.duration		= duration;
					debuff.texture		= icon;
					debuff.count		= count;
					debuffs[name]		= debuff;
					cache[name]		= true;
				end
			end
		end
	end
		
	-- 寻找unit对应的计时器
	for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
		local unit_frame = getglobal("SpellTimerUnitFrame"..i);		
		if (unit_frame and unit_frame:IsVisible() and unit_frame.target_guid == guid) then
			-- 停止不存在的计时		
			for j, spell_frame in ipairs(unit_frame.spell_frames) do	
				if (spell_frame and spell_frame:IsVisible()) then
					local info = debuffs[spell_frame.buff];
					if (not  info and (not spell_frame.flags or not spell_frame.flags.nocheck or spell_frame.flags.nocheck == 0)) then
						SpellTimer_StopTimer(spell_frame);
					end
				end
			end
			break;
		end
	end	

	-- 触发计时
	for _, info in pairs(debuffs) do
		if (SpellTimer_IsSpellEnabled(info.spell)) then			
			SpellTimer_OnCastSucceed(info, true);
		end		
	end
end

function SpellTimer:SyncBuffTime()
	local guid, unitName = UnitGUID("player"), UnitName("player");
	local name, rank, icon, count, debuffType, duration, timeLeft, unitCaster;
	local buffs = {};	 -- 包括buff信息	
	local cache = {};
	-- 收集DeBuffs信息, 我发现系统的代码并没有用while -- break, 安全起见我也未这样改
	local i = 1;
	while (true) do
		name, rank, icon, count, debuffType, duration, timeLeft, unitCaster = UnitBuff("player", i);
		-- 只收集自己施放的, 并且持续时间小于2分钟的
		if (name) then
			if (name and duration and duration > 0 and duration <= 120) then
				if (SpellTimer_SpellsSaved[name] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name][1] == "buff") then
					if (not cache[name]) then
						local buff		= {};
						buff.flags		= SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][name][5];
						buff.guid		= guid;
						buff.target		= unitName;
						buff.spell		= name;
						buff.rank		= rank;
						buff.startTime	= timeLeft - duration;
						buff.duration	= duration;
						buff.texture	= icon;
						buff.count		= count;
						buffs[name]	= buff;
						cache[name]	= true;
					end
				end
			end
			i = i + 1;
		else
			break;
		end
	end

	-- 寻找unit对应的计时器
	for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
		local unit_frame = getglobal("SpellTimerUnitFrame"..i);		
		if (unit_frame and unit_frame:IsVisible() and unit_frame.target_guid == guid) then
			-- 停止不存在的计时		
			for j, spell_frame in ipairs(unit_frame.spell_frames) do	
				if (spell_frame and spell_frame:IsVisible()) then
					local info = buffs[spell_frame.buff];
					if (not  info and (not spell_frame.flags or not spell_frame.flags.nocheck or spell_frame.flags.nocheck == 0)) then
						SpellTimer_StopTimer(spell_frame);
					end
				end
			end
			break;
		end
	end	

	-- 触发计时
	for _, info in pairs(buffs) do
		if (SpellTimer_IsSpellEnabled(info.spell)) then			
			SpellTimer_OnCastSucceed(info, true);
		end		
	end
end

function SpellTimer_UpdateStatus(frame, guid)
	if (frame and frame.target_guid and frame.target_name) then		
		local backAlpha = (frame.target_guid == guid) and (SpellTimer_GetC("BackAlpha") * 0.6) or SpellTimer_GetC("BackAlpha");
		local borderAlpha = SpellTimer_GetC("BorderAlpha");
		local hasBack = SpellTimer_GetC("HasBack");
		local hasBorder = SpellTimer_GetC("HasBorder");
		local header = getglobal(frame:GetName() .. "Header");
		local backColor = (frame.target_guid == guid and SpellTimer_Back_Color["target"]) or (frame.target_guid == SpellTimer_GUID and SpellTimer_Back_Color["player"]) or SpellTimer_Back_Color["others"];
		-- 标题头
		header:SetText(frame.target_name);
		if (frame.target_guid == UnitGUID("target")) then								-- 当前目标	
			header:SetTextColor(1.0, 0.549, 0.0);		-- 橙黄色
		elseif (frame.target_guid == SpellTimer_GUID) then	-- 玩家自己
			header:SetTextColor(0.0, 0.84, 1.0);		-- 蓝色
		else
			header:SetTextColor(1.0, 1.0, 1.0);			-- 白色
		end
		-- 背景
		if (hasBack == 1) then
			frame:SetBackdropColor(backColor.r, backColor.g, backColor.b, backAlpha);
		else
			frame:SetBackdropColor(backColor.r, backColor.g, backColor.b, 0.0);	
		end
		-- 边框
		if (hasBorder == 1) then
			frame:SetBackdropBorderColor(0.5, 0.5, 0.5, borderAlpha);
		else
			frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 0.0);
		end
	end	
end
-------------------
-- OnEvent
-------------------
function SpellTimer:PLAYER_TARGET_CHANGED(...)
	local guid = UnitGUID("target");
	for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
		local unit_frame = getglobal("SpellTimerUnitFrame"..i);
		if (unit_frame and unit_frame:IsVisible()) then			
			SpellTimer_UpdateStatus(unit_frame, guid);
		end
	end

	SpellTimer:SyncTime("target");
end

function SpellTimer:PLAYER_FOCUS_CHANGED()
	SpellTimer:SyncTime("focus");
end

function SpellTimer:UPDATE_MOUSEOVER_UNIT()
	SpellTimer:SyncTime("mouseover");
end

function SpellTimer:UNIT_AURA(event, unit)
	if (unit == "target" or unit == "focus" or unit == "mouseover") then		
		SpellTimer:SyncTime(unit);		
	end
	if (unit == "player") then
		SpellTimer:SyncBuffTime();
	end
end

function SpellTimer:PLAYER_TOTEM_UPDATE(event, slot)	
	local haveTotem, name, startTime, duration, icon = GetTotemInfo(slot);
	if (duration and startTime) then
		if (duration > 0 and SpellTimer_IsSpellEnabled(name)) then
			-- 记录下来, 以便能够配置
			if (not SpellTimer_SpellsSaved[name]) then
				SpellTimer_SpellsSaved[name] = true;
				table.insert(SpellTimer_Spells, name);
			end
			-- 假设图腾都是"1"级的,因为我们无法得到准确的等级.
			SpellTimer:AddTimer(SpellTimer_GUID, nil, name, 1, startTime, duration, nil, icon, nil, {["notarget"] = 1, ["live"] = 1}, nil, slot, true);
		else
			SpellTimer_RemoveTimer(nil, nil, nil, slot);
		end
	end	
end

function SpellTimer:COMBAT_LOG_EVENT_UNFILTERED(e, timestamp, event, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags, ...)
	if (event == "SPELL_MISSED") then
		local spellID, spellName, spellSchool, missType = select(1, ...);
		if (srcGUID == SpellTimer_GUID and spellName and dstGUID) then
			SpellTimer_CancelTimer(dstGUID, nil, spellName);
		end
	elseif (event == "UNIT_DIED") then
		if (dstGUID) then
			SpellTimer_RemoveTimer(dstGUID, nil, nil);
		end
	elseif (event == "UNIT_DIED") then
		if (dstGUID) then
			SpellTimer_RemoveTimer(dstGUID, nil, nil);
		end
	elseif (event == "SPELL_AURA_APPLIED") then
		if (srcGUID == SpellTimer_GUID and SpellTimer_Class == "HUNTER") then
			local auraId, auraName = select(1, ...);
			if (auraID and auraName) then
				local ss, ee, realbuff = string.find(auraName, SPELL_TIMER_TRAP_PATTERN1);
				if (not realbuff) then
					ss, ee, realbuff = string.find(auraName, SPELL_TIMER_TRAP_PATTERN2);
				end

				if (ss and ee and realbuff) then
					local _, _, context = SpellTimer_FindTimer(nil, nil, realbuff);
					if (_) then
						SpellTimer_SetTimer(dstGUID, dstName, realbuff, auraName, GetTime(), context[1]);
					end
				end
			end
		end
	elseif (event == "SPELL_AURA_REMOVED") then
		local extraSpellId, extraSpellName = select(1, ...);
		if (extraSpellName) then
			SpellTimer_RemoveTimer(dstGUID, nil, extraSpellName);
		end
	elseif (event == "SPELL_AURA_DISPELLED") then
		local auraId, auraName = select(1, ...);
		if (aruaName) then
			SpellTimer_RemoveTimer(dstGUID, nil, aruaName);
		end
	end
end

function SpellTimer:UNIT_SPELLCAST_INTERRUPTED()
	SpellTimer_LastTargetName = nil;
	SpellTimer_LastTargetGUID = nil;
	SpellTimer_LastTargetLevel = nil;
end

function SpellTimer:UNIT_SPELLCAST_SUCCEEDED(event, unit, spell, rank)	
	if (unit == "player") then
		local rank = rank and strmatch(rank, "(%d+)");
		local real_rank = rank and tonumber(rank);
		rank = real_rank or DuowanSpell_GetSpellMaxRank(spell);
		
		local target = SpellTimer_LastTargetName or UnitName("player");	-- 自我施法時沒有目標
		local guid = SpellTimer_LastTargetGUID or UnitGUID("player");
		
		if (SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][spell] and SpellTimer_IsSpellEnabled(spell)) then
			if (not SPELL_TIMER_TIME_TABLE[spell] or not SPELL_TIMER_TIME_TABLE[spell][rank]) then				
				if (not SpellTimer:SyncSpellTime(spell, rank)) then
					return;
				end
			end
			if (SPELL_TIMER_TIME_TABLE[spell] and SPELL_TIMER_TIME_TABLE[spell][rank]) then
				if (not SPELL_TIMER_TIME_TABLE[spell][rank][1]) then	-- 只作为配置用
					return;
				end			
				
				local data = {};
				if (SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][spell][5]) then
					data.flags = SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][spell][5];
				end				
				
				data.target = target;
				data.guid = guid;
				data.spell = spell;
				data.rank = real_rank;
				data.startTime = GetTime();
				data.duration = SPELL_TIMER_TIME_TABLE[spell][rank][1];
				data.delay = SpellTimer_GetSpellDelay(spell);
				data.texture = SPELL_TIMER_TIME_TABLE[spell][rank][2];				
				SpellTimer_OnCastSucceed(data);
			end
		end

		SpellTimer_LastTargetName = nil;
		SpellTimer_LastTargetGUID = nil;
		SpellTimer_LastTargetLevel = nil;
	end
end

function SpellTimer:PLAYER_REGEN_ENABLED()
	SpellTimer_StopAllTimers();
	SpellTimer_Locked = nil;
end

function SpellTimer_OnCastSucceed(D, noSync)
	SPELL_TIMER_SPELLS_DATE[D.spell] = D;
	if (D) then
		if (type(D.duration) == "string" or type(D.duration) == "number") then
			SpellTimer:AddTimer(D.guid, D.target, D.spell, D.rank, D.startTime, D.duration, D.delay, D.texture, D.count, D.flags, nil, nil, noSync);
		elseif (type(D.duration) == "table") then
			local ret = D.duration["detect"]();
			local duration;
			if (ret) then
				duration = D.duration[ret];
				if (D.duration["recalc"]) then	-- 切割
					duration = D.duration["recalc"](duration);
				end
			end
			if (duration) then				
				SpellTimer:AddTimer(D.guid, D.target, D.spell, D.rank, D.startTime, duration, D.delay, D.texture, D.count, D.flags, D.duration, nil, noSync);				
			end
		end
	end
end

function SpellTimerFrame_OnEnter(self)
	GameTooltip_SetDefaultAnchor(GameTooltip, self);
	GameTooltip:SetText(self:GetParent().buff);
	local s, e = string.find(self:GetParent().buff, SPELL_TIMER_TOTEM_PATTERN);
	if (s) then
		GameTooltip:AddLine(SPELL_TIMER_TOTEM_TIP, 0.8, 0.8, 0.8);		
	else
		if (SpellTimer_GetC("RightCancel") == 1) then
			GameTooltip:AddLine(SPELL_TIMER_COLSE_TIMER, 0.8, 0.8, 0.8);
		end		
	end
	GameTooltip:AddLine(SPELL_TIMER_SHIFT_CLOSE, 0.8, 0.8, 0.8);
	GameTooltip:Show();
end

function SpellTimerFrame_OnUpdate(self, elapse)
	if (self.casting) then
		if (not self.update) then
			self.update = 0;
		end
		if (self.update > 0.02) then
			self.update = 0;
		else
			self.update = self.update + elapse;
			return;
		end

		local textob = getglobal(self:GetName().."Text");
		local status = GetTime();
		if ( status > self.maxValue ) then
			status = self.maxValue;
		end
		local left = self.maxValue - status;

		if (SpellTimer_Config.ShowProgressBar) then
			local bar = getglobal(self:GetName().."Bar");
			local spark = getglobal(bar:GetName().."Spark");
			local flash = getglobal(bar:GetName().."Flash");

			bar:SetValue(status);
			flash:Hide();
			local sparkPosition;

			sparkPosition = ((status - self.startTime) / (self.maxValue - self.startTime)) * 128;

			if ( sparkPosition < 0 ) then
				sparkPosition = 0;
			end
			spark:SetPoint("CENTER", bar, "LEFT", sparkPosition, 0);
		end

		if (SpellTimer_Config.ShowName) then
			SpellTimer_SetText(textob, SpellTimer_GetTimeString(left).." - "..self.buff, left);
		else
			SpellTimer_SetText(textob, SpellTimer_GetTimeString(left), left);
		end

		if (status == self.maxValue) then
			SpellTimer_StopTimer(self);
		end
	elseif (GetTime() < self.holdTime) then
		return;
	elseif (self.flash) then
		if (SpellTimer_Config.ShowProgressBar) then
			local bar = getglobal(self:GetName().."Bar");
			local flash = getglobal(bar:GetName().."Flash");
			local alpha = flash:GetAlpha() + 0.2;
			if ( alpha < 1 ) then
				flash:SetAlpha(alpha);
			else
				flash:SetAlpha(1.0);
				self.flash = nil;
			end
		end
	elseif (self.fadeOut) then
		local alpha = self:GetAlpha() - 0.05;
		local bar = getglobal(self:GetName().."Bar");
		local minValue, maxValue = bar:GetMinMaxValues();
		if (SpellTimer_Config.ShowProgressBar and bar:GetValue() ~= maxValue) then
			self:SetAlpha(1.0);
			self.fadeOut = nil;
		end
		if ( alpha > 0 ) then
			self:SetAlpha(alpha);
		else
			self.fadeOut = nil;
			self:Hide();

			local unit_frame = self:GetParent();
			unit_frame.spell_count = unit_frame.spell_count - 1;
			if (unit_frame.spell_count <= 0) then
				unit_frame.spell_count = 0;
				unit_frame.spell_frames = {};
				unit_frame:Hide();
			else
				for i, frame in ipairs(unit_frame.spell_frames) do
					if (frame == self) then
						table.remove(unit_frame.spell_frames, i);
					end
				end
			end

			SpellTimer_RecalcLayout();
		end
	end
end

function SpellTimerMainFrame_OnLoad()	
end

function SpellTimer_SetText(textob, text, left)
	if (SpellTimer_Config.WarningTime) then
		textob:SetText(text);
		if (tonumber(left) < SpellTimer_Config.WarningTime and textob.red) then
			textob:SetTextColor(0.9, 0, 0);
			if (not textob.count) then
				textob.count = 0;
			end
			textob.count = textob.count + 1;
			if (textob.count > 5) then
				textob.red = nil;
				textob.count = 0;
			end
		else
			textob:SetTextColor(0.9, 0.9, 0.9);
			if (not textob.count) then
				textob.count = 0;
			end
			textob.count = textob.count + 1;
			if (textob.count > 5) then
				textob.red = 1;
				textob.count = 0;
			end
		end
	else
		textob:SetText(text);
		textob:SetTextColor(0.9, 0.9, 0.9);
	end
end

function SpellTimer_GetTimeString(second)
	second = math.floor(second);
	local minutes = math.floor(second/60);
	local seconds = second - minutes*60;
	return string.format("%02d:%02d", minutes, seconds);
end

function SpellTimer_FindTimer(guid, target, buff)
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		local frame = getglobal("SpellTimerSpellFrame"..i);
		if (frame and frame:IsVisible() and (not frame.guid or frame.guid == guid) and frame.buff == buff) then
			return frame, buff, frame.context;
		end
	end
end

function SpellTimer_StopTimers(guid, target, buffs, flags)
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		local frame = getglobal("SpellTimerSpellFrame"..i);
		if (frame and frame:IsVisible() and (frame.guid == guid or (flags and flags.any))) then
			for key, buff in pairs(buffs) do
				if (buff == frame.buff) then
					SpellTimer_StopTimer(frame);
				end
			end
		end
	end
end

function SpellTimer_SetTimer(guid, target, buff, newbuff, startTime, duration, noSync)
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		local frame = getglobal("SpellTimerSpellFrame"..i);
		if (frame and frame:IsVisible() and (not frame.guid or frame.guid == guid) and frame.buff == buff) then
			frame.guid = guid;
			frame.target = target;
			frame.buff = newbuff;
			SpellTimer:StartTimer(frame, newbuff,  startTime, duration, noSync);
			return;
		end
	end
end

function SpellTimer_NewUnitFrame(guid, name)
	local frame;
	for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
		frame = getglobal("SpellTimerUnitFrame"..i);
		if (frame and not frame:IsVisible()) then
			frame.target_guid = guid;
			frame.target_name = name;
			frame.spell_count = 0;
			frame.spell_frames = {};
			return frame;
		end
	end

	frame = CreateFrame("Button", "SpellTimerUnitFrame"..SPELLTIMER_MAX_UNITFRAME_COUNT, SpellTimerMainFrame, "SpellTimerUnitFrameTemplate");
	
	local button = CreateFrame("Button", nil, frame);
	button:SetHighlightTexture("Interface\\BUTTONS\\UI-DialogBox-Button-Highlight", "ADD");
	button:GetHighlightTexture():SetTexCoord(0.0, 1.0, 0.0, 0.71875);
	button:SetWidth(190);
	button:SetHeight(22);
	button:SetPoint("TOP", frame, "TOP", 0, 0);
	button:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton" and SpellTimer_GetC("Locked") == 0) then
			self.moving = true;
			SpellTimerMainFrame:StartMoving();
		end
	end);
	button:SetScript("OnMouseUp", function(self, button)
		if (button == "LeftButton" and self.moving) then
			SpellTimerMainFrame:StopMovingOrSizing();				
			self.moving = false;
		end
	end);
	button:SetScript("OnEnter", function(self)
		GameTooltip_SetDefaultAnchor(GameTooltip, self);
		GameTooltip:SetText(SPELL_TIMER_TITILE);		
		GameTooltip:AddLine(SPELL_TIMER_MOVE_MENU, 1.0, 0.8, 0.8);
		GameTooltip:Show();
	end);
	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
	end);
	DWEasyMenu_Register(button, SpellTimer_Options);
	
	SPELLTIMER_MAX_UNITFRAME_COUNT = SPELLTIMER_MAX_UNITFRAME_COUNT + 1;
	frame.target_guid = guid;
	frame.target_name = name;
	frame.spell_count = 0;
	frame.spell_frames = {};
	
	return frame;
end

function SpellTimer_NewSpellFrame(unit_frame)
	local frame;
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		frame = getglobal("SpellTimerSpellFrame"..i);
		if (frame and not frame:IsVisible()) then
			table.insert(unit_frame.spell_frames, frame);
			unit_frame.spell_count = unit_frame.spell_count + 1;

			frame:SetParent(unit_frame);

			return frame;
		end
	end

	frame = CreateFrame("Frame", "SpellTimerSpellFrame"..SPELLTIMER_MAX_SPELLFRAME_COUNT, unit_frame, "SpellTimerSpellFrameTemplate");
	SPELLTIMER_MAX_SPELLFRAME_COUNT = SPELLTIMER_MAX_SPELLFRAME_COUNT + 1;
	table.insert(unit_frame.spell_frames, frame);
	unit_frame.spell_count = unit_frame.spell_count + 1;

	return frame;
end

function SpellTimer_RecalcLayout()
	local i, last_frame;
	for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
		local frame = getglobal("SpellTimerUnitFrame"..i);
		if (frame and frame:IsVisible()) then
			frame:SetWidth(190);
			frame:SetHeight(26 + frame.spell_count * 40);
			if (not last_frame) then
				frame:ClearAllPoints();
				frame:SetPoint("TOPLEFT", SpellTimerMainFrame, "TOPLEFT", 0, 0);
			else
				frame:ClearAllPoints();
				frame:SetPoint("TOP", last_frame, "BOTTOM", 0, 0);
			end

			-- 排列法术
			local j, subframe, last_subframe;
			for j, subframe in ipairs(frame.spell_frames) do
				if (not (last_subframe and last_subframe == subframe)) then
					if (not last_subframe or last_subframe == subframe) then
						subframe:ClearAllPoints();
						subframe:SetPoint("TOP", frame, "TOP", 10, -26);
					else
						subframe:ClearAllPoints();
						subframe:SetPoint("TOP", last_subframe, "BOTTOM", 0, -2);
					end
					
					last_subframe = subframe;
				end
			end

			last_frame = frame;
		end
	end
end

local function SpellTimer_DisableSpell(spellName)
	if (spellName and type(spellName) == "string") then
		if (not SpellTimer_Config["SPELLS"]) then
			SpellTimer_Config["SPELLS"] = {};
		end
		
		if (not SpellTimer_Config["SPELLS"][spellName] ) then
			SpellTimer_Config["SPELLS"][spellName] = {};
		end
		
		SpellTimer_Config["SPELLS"][spellName]["disabled"] = 1;
	end	
end
-----------
-- 计时可以不从0开始, 而是按照Cooldown类似的算法.
-- 添加参数 startTime, noSync等
do
	local lastTimerInfo = {};	-- 由于"UNIT_AURA"存在bug, 这里保证只有一个同样信息的计时, 减少不必要的开销.
	function SpellTimer:AddTimer(guid, target, buff, rank, startTime, duration, delay, texture, count, flags, context, slot, noSync)
		if (guid == lastTimerInfo["guid"] and lastTimerInfo["name"] == buff and math.abs(lastTimerInfo["start"] - startTime) < 0.01) then
			return;
		end
		
		local delay = delay or 0;	
		if (flags and  flags["notarget"]) then	
			guid = UnitExists(flags["unit"]) and UnitGUID(flags["unit"]) or UnitGUID("player");
			target = UnitExists(flags["unit"]) and UnitName(flags["unit"]) or UnitName("player");		
		else
			guid = guid or UnitGUID("player");
			target = target or UnitName("player");
		end
		-- 首先确定在计时器中是否已经存在这样一个目标
		for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
			local frame = getglobal("SpellTimerSpellFrame"..i);
			local button = getglobal("SpellTimerSpellFrame"..i.."Icon");
			
			if (frame and frame:IsVisible() and			
				((flags and flags["unique"]) or frame.guid == guid) and	
				(frame.buff == buff or (slot and frame.slot == slot))) then
				-- 唯一的需要确保他的唯一性
				if (flags and flags["unique"] and frame.guid ~= guid) then
					SpellTimer_StopTimer(frame);
					break;
				end
				-- 修正图标问题
				frame.buff = buff;
				frame.count = count;
				local textureOb = getglobal("SpellTimerSpellFrame"..i.."IconTexture");
				local countText = getglobal(button:GetName() .. "Count");
				textureOb:SetTexture(texture);
				if (count and count > 0) then
					countText:SetText(count);
				else
					countText:SetText("");
				end
				
				-- 如果时间相同, 那么不重新计时
				if (frame.startTime ~= startTime or frame.duration ~= duration) then
					SpellTimer:StartTimer(frame, buff, startTime, duration + delay, noSync);
				end
				
				if (slot) then
					button:SetScript("OnClick", function(self, button)
						if (button == "RightButton") then
							DestroyTotem(slot);
							if (IsShiftKeyDown()) then
								SpellTimer_DisableSpell(frame.buff)
							end
						end
					end);
				else
					button:SetScript("OnClick", function(self, button)
						if (button == "RightButton") then
							if (SpellTimer_GetC("RightCancel") == 1) then
								SpellTimer_StopTimer(frame);
							end							
							if (IsShiftKeyDown()) then
								SpellTimer_DisableSpell(frame.buff)
							end
						end
					end);
				end

				if (SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff][4]) then
					SpellTimer_StopTimers(guid, target, SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff][4], flags);
				end

				lastTimerInfo["name"]	= buff;
				lastTimerInfo["guid"]		= guid;
				lastTimerInfo["start"]		= startTime;
				return;
			end
		end

		local unit_frame, spell_frame;
		local target_guid = UnitGUID("target");
		-- 寻找该目标是否已经存在UnitFrame
		for i = 1, SPELLTIMER_MAX_UNITFRAME_COUNT, 1 do
			unit_frame = getglobal("SpellTimerUnitFrame"..i);
			if (unit_frame) then
				if (not unit_frame:IsVisible()) then
					break;
				end

				if (unit_frame:IsVisible() and unit_frame.target_guid == guid) then
					break;
				end
			end
			unit_frame = nil;
		end
		-- 如果不存在，首先创建一个UnitFrame
		if (not unit_frame) then
			unit_frame = SpellTimer_NewUnitFrame(guid, target);
		end
		
		unit_frame.target_guid = guid;
		unit_frame.target_name = target;
		
		
		-- 刷新状态信息(背景, 边框, 标题头文字)
		SpellTimer_UpdateStatus(unit_frame, guid);	
			
		unit_frame:Show();
		-- 创建法术条
		spell_frame = SpellTimer_NewSpellFrame(unit_frame);

		local button = getglobal(spell_frame:GetName().."Icon")	
		spell_frame.buff = buff;
		spell_frame.rank = rank;
		spell_frame.target = target;
		spell_frame.guid = guid;
		spell_frame.count = count;
		spell_frame.flags = flags;
		spell_frame.context = context;
		spell_frame.slot = slot;

		local textureOb = getglobal(spell_frame:GetName().."IconTexture");	
		local countText = getglobal(button:GetName() .. "Count");
		textureOb:SetTexture(texture);		
		if (count and count > 0) then
			countText:SetText(count);
		else
			countText:SetText("");
		end
				
		SpellTimer:StartTimer(spell_frame, buff, startTime, duration + delay, noSync);
		if (slot) then
			button:SetScript("OnClick", function(self, button)
				if (button == "RightButton") then
					DestroyTotem(slot);
					if (IsShiftKeyDown()) then
						SpellTimer_DisableSpell(frame.buff)							
					end
				end
			end);
		else
			button:SetScript("OnClick", function(self, button)
				if (button == "RightButton") then
					SpellTimer_StopTimer(frame);
					if (IsShiftKeyDown()) then
						SpellTimer_DisableSpell(frame.buff)
					end
				end
			end);
		end
		spell_frame:Show();

		if (SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff] and SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff][4]) then
			SpellTimer_StopTimers(guid, target, SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class][buff][4], flags);
		end

		lastTimerInfo["name"]	= buff;
		lastTimerInfo["guid"]		= guid;
		lastTimerInfo["start"]		= startTime;
		-- 重新排列
		SpellTimer_RecalcLayout();
	end
end

function SpellTimer_RemoveTimer(guid, level, buff, slot)
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		local bar = getglobal("SpellTimerSpellFrame"..i);
		if (bar and bar:IsVisible() and (not guid or bar.guid == guid) and (not buff or bar.buff == buff) and (not level or bar.level == level) and (not slot or bar.slot == slot)) then
			SpellTimer_StopTimer(bar);
		end
	end
end

function SpellTimer:StartTimer(frame, text, startTime, duration, noSync)
	local bar = getglobal(frame:GetName().."Bar");
	local icon = getglobal(frame:GetName().."Icon");
	local textob = getglobal(frame:GetName().."Text");
	
	frame.startTime = startTime or GetTime();
	frame.duration = duration;
	frame.maxValue = frame.startTime + frame.duration;
	frame.modifier = true;	-- 这里标记为已修改, 后面会根据noSync再赋值
	
	
	local status = GetTime();
	local leftTime = frame.maxValue - status;
	if (SpellTimer_Config.ShowProgressBar) then
		local spark = getglobal(bar:GetName().."Spark");
		local flash = getglobal(bar:GetName().."Flash");

		bar:SetStatusBarColor(1.0, 0.7, 0.0);
		bar:SetMinMaxValues(frame.startTime, frame.maxValue);
		bar:SetValue(status);

		flash:Hide();
		bar:Show();

		spark:SetPoint("CENTER", bar, "LEFT", 0, 0);
		spark:Show();

		textob:ClearAllPoints();
		textob:SetPoint("TOPLEFT", frame, "TOPLEFT", 35, 0);
	else
		textob:ClearAllPoints();
		textob:SetPoint("LEFT", frame, "LEFT", 35, 0);

		bar:Hide();
	end

	if (SpellTimer_Config.ShowName) then
		SpellTimer_SetText(textob, SpellTimer_GetTimeString(leftTime).." - "..text, leftTime);
	else
		SpellTimer_SetText(textob, SpellTimer_GetTimeString(leftTime), leftTime);
	end

	frame:SetAlpha(1.0);
	frame.holdTime = 0;
	frame.casting = 1;
	frame.fadeOut = nil;
	frame:Show();

	SpellTimer_LastTimer = frame;
	
	if (not noSync) then
		frame.modifier = false;
		SpellTimer:SyncTime("target");
	end	
end

function SpellTimer_CancelTimer(guid, level, buff)
	if (SpellTimer_LastTimer and (not buff or SpellTimer_LastTimer.buff == buff) and (not guid or SpellTimer_LastTimer.guid == guid)) then
		SpellTimer_LastTimer:Hide();
		SpellTimer_LastTimer.slot = nil;
		SpellTimer_LastTimer.guid = nil;

		local unit_frame = SpellTimer_LastTimer:GetParent();
		unit_frame.spell_count = unit_frame.spell_count - 1;
		if (unit_frame.spell_count <= 0) then
			unit_frame.spell_count = 0;
			unit_frame.spell_frames = {};
			unit_frame.target_guid = nil;
			unit_frame:Hide();
		else
			for i, frame in ipairs(unit_frame.spell_frames) do
				if (frame == SpellTimer_LastTimer) then
					table.remove(unit_frame.spell_frames, i);
				end
			end
		end
	end
end

function SpellTimer_StopAllTimers()
	for i = 1, SPELLTIMER_MAX_SPELLFRAME_COUNT, 1 do
		local frame = getglobal("SpellTimerSpellFrame"..i);
		if (frame and frame:IsVisible() and (not frame.flags or not frame.flags["live"])) then
			SpellTimer_StopTimer(frame);
		end
	end
end

do
	local lastFrame, lastTime;	-- 防止两次连续的操作用
	function SpellTimer_StopTimer(frame)
		if (frame and frame == lastFrame and math.abs(GetTime() - lastTime) < 0.01) then
			return;
		end

		if (not frame) then
			frame = SpellTimer_LastTimer;
		end
		if (frame and frame:IsShown()) then
			if (SpellTimer_Config.ShowProgressBar) then
				local bar = getglobal(frame:GetName().."Bar");
				local spark = getglobal(bar:GetName().."Spark");
				local flash = getglobal(bar:GetName().."Flash");

				bar:SetValue(frame.maxValue);
				bar:SetStatusBarColor(0.0, 1.0, 0.0);
				spark:Hide();
				flash:SetAlpha(0.0);
				flash:Show();

				-- 如果有Progress Bar的话，需要Flash
				frame.flash = 1;
			end
			
			frame.slot = nil;
			frame.guid = nil;
			frame.casting = nil;
			frame.fadeOut = 1;

			lastFrame, lastTime = frame, GetTime();
		end
	end
end
-----------------------------------------------------------------------------
-- FUNCTION: SpellTimer:SyncSpellTime
-----------------------------------------------------------------------------
function SpellTimer:SyncSpellTime(spell, rank)
	local rank = rank or 1;	
	if (spell) then
		for key, pattern in pairs(SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class]) do
			if (key == spell) then
				if (not (pattern[1] or pattern[3]) or pattern[1] == "buff") then
					SPELL_TIMER_TIME_TABLE[spell] = SPELL_TIMER_TIME_TABLE[spell] or {};
					SPELL_TIMER_TIME_TABLE[spell][rank] = {nil};					
					return false;
				end

				local id, name, _, category, _type, texture, desc, passive, instant = DuowanSpell_GetSpellInfo(spell, rank);
				--printf("%s: %s", tostring(id), tostring(desc));
				if (not id) then					
					return false;
				end
				local s, e, time;
				if (pattern[3]) then
					s = 1;
					e = 1;
					time = tostring(pattern[3]);
				else
					if (type(pattern[1]) == "string") then
						s, e, time = string.find(desc, pattern[1]);

						if (time and pattern[2]) then
							time = tostring(tonumber(time)*pattern[2]);
						end
					elseif (type(pattern[1]) == "table") then					
						local func = getglobal(pattern[1][1]);
						time = func(desc, pattern[1][2]);
						if (time) then
							time["detect"] = getglobal(pattern[1][3]);
							if (pattern[1][4]) then	-- 切割
								time["recalc"] = getglobal(pattern[1][4]);
							end
							s = 1;
							e = 1;
						end
					elseif (type(pattern[1]) == "number") then
						time =  tostring(tonumber(pattern[1]));
						s = 1;
						e = 1;
					end
				end

				if (s and e) then
					if (not SPELL_TIMER_TIME_TABLE[spell]) then
						SPELL_TIMER_TIME_TABLE[spell] = {};
					end
					
					SPELL_TIMER_TIME_TABLE[spell][rank] = {time, texture, id, _type, instant};
				end
			end
		end
	end

	return true;
end

function SpellTimer_IsSpellEnabled(spellName)
	if (not SpellTimer_Config.SPELLS) then
		return 1;
	end

	if (not SpellTimer_Config.SPELLS[spellName]) then
		return 1;
	end

	if (not SpellTimer_Config.SPELLS[spellName].disabled) then
		return 1;
	end
end

function SpellTimer_GetSpellDelay(spellName)
	if (not SpellTimer_Config.SPELLS) then
		return 0;
	end

	if (not SpellTimer_Config.SPELLS[spellName]) then
		return 0;
	end

	if (not SpellTimer_Config.SPELLS[spellName].delay) then
		return 0;
	end

	return SpellTimer_Config.SPELLS[spellName].delay;
end

local function MobElement_Enable(frame, bool)
	if (bool) then
		frame:Enable();
		getglobal(frame:GetName().."Text"):SetTextColor(1.0, 0.82, 0);
		getglobal(frame:GetName() .. "HitArea"):Enable();
	else
		frame:Disable();
		getglobal(frame:GetName().."Text"):SetTextColor(0.5, 0.5, 0.5);
		getglobal(frame:GetName() .. "HitArea"):Disable();
	end
end

function SpellTimer_EnableOptionEnable(enabled)
	if (enabled) then
		local i;
		
		for i = 1, 8, 1 do
			local frame = getglobal("SpellTimerOptionFrameSpellOption"..i);
			
			SpellTimer_EnableOption(frame, 1);
		end

		SpellTimerScrollFrameScrollBarScrollUpButton:Enable();
		SpellTimerScrollFrameScrollBarScrollDownButton:Enable();


		if (SpellTimer_Config.ShowProgressBar) then
			MobElement_Enable(SpellTimerOptionShowProgress, true);
		else
			MobElement_Enable(SpellTimerOptionShowProgress, false);
		end
		if (SpellTimer_Config.ShowName) then
			MobElement_Enable(SpellTimerOptionShowName, true);
		else
			MobElement_Enable(SpellTimerOptionShowName, false);
		end
	else
		local i;
		for i = 1, 8, 1 do
			local frame = getglobal("SpellTimerOptionFrameSpellOption"..i);
			
			SpellTimer_EnableOption(frame, nil);
		end

		SpellTimerScrollFrameScrollBarScrollUpButton:Disable();
		SpellTimerScrollFrameScrollBarScrollDownButton:Disable();

		SpellTimer_Config.EnabledTest = nil;

		MobElement_Enable(SpellTimerOptionShowProgress, false);
		MobElement_Enable(SpellTimerOptionShowName, false);
	end
end

function SpellTimer_Toggle(switch)
	if (switch) then
		SpellTimer_Config.EnabledTest = 1;
		SpellTimer_EnableOptionEnable(1);
		SpellTimer:Toggle(1);
	else
		SpellTimer_EnableOptionEnable(nil);
		SpellTimer:Toggle(nil);
	end
end

function SpellTimer_EnableOption(frame, enabled)
	local checkbox = getglobal(frame:GetName().."Checkbox");
	local slider = getglobal(frame:GetName().."Slider");

	if (enabled) then
		MobElement_Enable(checkbox, true);
		SpellTimerOptionFrame_EnableSlider(slider);
	else
		MobElement_Enable(checkbox, false);
		SpellTimerOptionFrame_DisableSlider(slider);
	end
end

function SpellTimerOptionFrameCheckbox_OnClick(self, spellIndex)
	local spellName = SpellTimer_Spells[spellIndex];

	if (self:GetChecked() == 1) then
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (not SpellTimer_Config.SPELLS[spellName]) then
			SpellTimer_Config.SPELLS[spellName] = {};
		end

		SpellTimer_Config.SPELLS[spellName].disabled = nil;

		SpellTimerOptionFrame_EnableSlider(getglobal(self:GetParent():GetName().."Slider"));
	else
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (not SpellTimer_Config.SPELLS[spellName]) then
			SpellTimer_Config.SPELLS[spellName] = {};
		end

		SpellTimer_Config.SPELLS[spellName].disabled = 1;

		SpellTimerOptionFrame_DisableSlider(getglobal(self:GetParent():GetName().."Slider"));
	end
end

function SpellTimer_GenerateTable()
	if (not SpellTimer_Generated) then		
		for spell in pairs(SPELL_TIMER_PATTERN_TABLE[SpellTimer_Class]) do
			table.insert(SpellTimer_Spells, spell);
			SpellTimer_SpellsSaved[spell] = true;
		end
		
		if (SpellTimer_Config.SPELLS) then
			for spell in pairs(SpellTimer_Config.SPELLS) do
				if (not SpellTimer_SpellsSaved[spell]) then
					table.insert(SpellTimer_Spells, spell);
					SpellTimer_SpellsSaved[spell] = true;
				end
			end
		end
		SpellTimer_Generated = true;
	end
end

function SpellTimerOptionFrame_OnShow()
	SpellTimerList_Update();
end

function SpellTimer_GetNumSpells()
	SpellTimer_GenerateTable();

	return #(SpellTimer_Spells);
end

function SpellTimer_GetSpellInfo(spellIndex)
	SpellTimer_GenerateTable();
	
	local spellName = SpellTimer_Spells[spellIndex];
	if (spellName) then
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (SpellTimer_Config.SPELLS[spellName]) then
			return spellName, not SpellTimer_Config.SPELLS[spellName].disabled, SpellTimer_Config.SPELLS[spellName].delay;
		else
			return spellName, 1, nil;
		end
	end
end

function SpellTimer_SetSpellInfo(spellIndex, enabled, delay)
	SpellTimer_GenerateTable();
	
	local spellName = SpellTimer_Spells[spellIndex];
	if (spellName) then
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (not SpellTimer_Config.SPELLS[spellName]) then
			SpellTimer_Config.SPELLS[spellName] = {};
		end

		SpellTimer_Config.SPELLS[spellName].disabled = not enabled;
		SpellTimer_Config.SPELLS[spellName].delay = delay;
	end
end

function SpellTimer_UpdateOption(frame, spell, enabled, delay)
	if (spell) then
		local checkbox = getglobal(frame:GetName().."Checkbox");
		local slider = getglobal(frame:GetName().."Slider");
		local text = getglobal(checkbox:GetName().."Text");

		text:SetText(spell);

		if (enabled) then
			checkbox:SetChecked(1);

			SpellTimerOptionFrame_EnableSlider(slider);
		else
			checkbox:SetChecked(0);

			SpellTimerOptionFrame_DisableSlider(slider);
		end

		if (delay) then
			local sliderText = getglobal(slider:GetName().."Text");
			slider:SetValue(delay);
			sliderText:SetText(delay);
		else
			local sliderText = getglobal(slider:GetName().."Text");
			slider:SetValue(0);
			sliderText:SetText(0);
		end
	end
end

function SpellTimerList_Update()
	local numSpells = SpellTimer_GetNumSpells();
	local spellOffset = FauxScrollFrame_GetOffset(SpellTimerScrollFrame);
	local spellIndex;

	for i = 1, 8, 1 do
		spellIndex = spellOffset + i;
		local text, enabled, delayTime = SpellTimer_GetSpellInfo(spellIndex);
		local spellFrame = getglobal("SpellTimerOptionFrameSpellOption"..i);

		spellFrame:SetID(spellIndex);
		SpellTimer_UpdateOption(spellFrame, text, enabled, delayTime);

		if ( spellIndex > numSpells ) then
			spellFrame:Hide();
		else
			spellFrame:Show();
		end
	end

	if (SpellTimer_Config.EnabledTest) then
		FauxScrollFrame_Update(SpellTimerScrollFrame, numSpells, 8, 20);
	else
		FauxScrollFrame_Update(SpellTimerScrollFrame, 1, 8, 20);
	end
end

function SpellTimerOptionShowProgress_OnClick(self)
	if (self:GetChecked() == 1) then
		SpellTimer_Config.ShowProgressBar = 1;
	else
		SpellTimer_Config.ShowProgressBar = nil;
	end
end

function SpellTimerOptionShowProgress_OnShow(self)
	getglobal(self:GetName().."Text"):SetText(SPELL_TIMER_SHOW_PROGRESS);

	if (SpellTimer_Config.EnabledTest) then
		MobElement_Enable(self, true);
	else
		MobElement_Enable(self, false);
	end

	if (SpellTimer_Config.ShowProgressBar) then
		self:SetChecked(1);
	else
		self:SetChecked(0);
	end
end

function SpellTimerOptionShowName_OnClick(self)
	if (self:GetChecked() == 1) then
		SpellTimer_Config.ShowName = 1;
	else
		SpellTimer_Config.ShowName = nil;
	end
end

function SpellTimerOptionShowName_OnShow(self)
	getglobal(self:GetName().."Text"):SetText(SPELL_TIMER_SHOW_NAME);

	if (SpellTimer_Config.EnabledTest) then
		MobElement_Enable(self, true);
	else
		MobElement_Enable(self, false);
	end

	if (SpellTimer_Config.ShowName) then
		self:SetChecked(1);
	else
		self:SetChecked(0);
	end
end

function SpellTimerOptionFrameSlider_OnChange(self, spellIndex)
	if (self.disabled) then
		return;
	end
	
	local spellName = SpellTimer_Spells[spellIndex];
	local delay_time = self:GetValue();
	self.value = delay_time;	
	getglobal(self:GetName().."Text"):SetText(delay_time);	

	if (delay_time > 0) then
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (not SpellTimer_Config.SPELLS[spellName]) then
			SpellTimer_Config.SPELLS[spellName] = {};
		end

		SpellTimer_Config.SPELLS[spellName].delay = delay_time;
	else
		if (not SpellTimer_Config.SPELLS) then
			SpellTimer_Config.SPELLS = {};
		end

		if (not SpellTimer_Config.SPELLS[spellName]) then
			SpellTimer_Config.SPELLS[spellName] = {};
		end

		SpellTimer_Config.SPELLS[spellName].delay = nil;
	end
end

function SpellTimerOptionFrame_DisableSlider(slider)
	local name = slider:GetName();
	getglobal(name.."Thumb"):Hide();
	getglobal(name.."Text"):SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);

	slider.disabled = 1;
end

function SpellTimerOptionFrame_EnableSlider(slider)
	local name = slider:GetName();
	getglobal(name.."Thumb"):Show();
	getglobal(name.."Text"):SetVertexColor(NORMAL_FONT_COLOR.r , NORMAL_FONT_COLOR.g , NORMAL_FONT_COLOR.b);

	slider.disabled = nil;

	if (slider.value) then
		slider:SetValue(slider.value);
	end
end