
LOCALIZED_CLASS_NAMES_MALE = {}

local function SetTranslations(...)
    local L = {}
    for i=1, select("#",...), 2 do
        local v, k = select(i,...)
        L[k] = v
    end
    LOCALIZED_CLASS_NAMES_MALE = L
end

if GetLocale() == "zhCN" then
    SetTranslations( "术士", "WARLOCK", "战士", "WARRIOR", "猎人", "HUNTER", "法师", "MAGE", "牧师", "PRIEST", "德鲁伊", "DRUID", "圣骑士", "PALADIN", "萨满祭司", "SHAMAN", "潜行者", "ROGUE", "死亡骑士", "DEATHKNIGHT", "术士", "WARLOCK", "战士", "WARRIOR", "猎人", "HUNTER", "法师", "MAGE", "牧师", "PRIEST", "德鲁伊", "DRUID", "圣骑士", "PALADIN", "萨满祭司", "SHAMAN", "潜行者", "ROGUE", "死亡骑士", "DEATHKNIGHT" )
elseif GetLocale()  == "zhTW" then
    SetTranslations( "術士", "WARLOCK", "戰士", "WARRIOR", "獵人", "HUNTER", "法師", "MAGE", "牧師", "PRIEST", "德魯伊", "DRUID", "聖騎士", "PALADIN", "薩滿", "SHAMAN", "盜賊", "ROGUE", "死亡騎士", "DEATHKNIGHT", "術士", "WARLOCK", "戰士", "WARRIOR", "獵人", "HUNTER", "法師", "MAGE", "牧師", "PRIEST", "德魯伊", "DRUID", "聖騎士", "PALADIN", "薩滿", "SHAMAN", "盜賊", "ROGUE", "死亡騎士", "DEATHKNIGHT" )
end

-----------------------------------
-- 异步调用(安全的调用别的插件的函数)
local AsynCallFuncs = {};
function AsynCall(AddOnName, funcName, ...)
    if (IsAddOnLoaded(AddOnName) and type(_G[funcName]) == "function") then
        _G[funcName](...);
    else
        AsynCallFuncs[AddOnName] = AsynCallFuncs[AddOnName] or {};
        AsynCallFuncs[AddOnName][funcName] = {...};
    end
end

function AsynUncall(AddOnName, funcName)
    if (AsynCallFuncs[AddOnName] and AsynCallFuncs[AddOnName][funcName]) then
        AsynCallFuncs[AddOnName][funcName] = nil;
    end
end

do
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

-----------------------------------
-- 克隆表格 | 删除表格
function CloneTable(t)
	assert(type(t) == "table");
	local tmp = {};
	for k, v in pairs(t) do
		if (type(v) == "table") then
			tmp[k] = CloneTable(v);
		else
			tmp[k] = v;
		end
	end
	return tmp;
end

function NukeTable(t)
	assert(type(t) == "table");

	for k, v in pairs(t) do
		if (type(v) == "table") then
			NukeTable(v);
		else
			v = nil;
		end
	end
end

----------------------------
-- 延迟调用 | 渐隐关闭
local dwDelayCallStack = {};
local dwFadeOutStack = {};
function DelayCall(name, time, ...)
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

function ClearDelayCall(name)
    dwDelayCallStack[name] = nil;
end

function FadeOut(frame, time, startAlpha, endAlpha)
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

-----------------------------------
-- 战斗状态调用栈(队列)

local stack = {};
local frame = CreateFrame("Frame");
local index = 0;
local sequence = {};
frame:RegisterEvent("PLAYER_REGEN_ENABLED");
function Push(func, ...)
    assert(type(func) == "function", "First argument must be a function value.");

    index = index + 1;
    stack[func] = {...};
    sequence[func] = index;
end

function RunCallStack()
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
    RunCallStack();
end);

function SecureCall(...)
    local func = select(1, ...);
    if (type(func) == "function") then
        if (InCombatLockdown()) then
            Push(func, ...);
            return;
        end

        pcall(...);
    end
end

-----------------------------------
-- 常用函数
function ShowKeyBindingFrame(arg)
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

-- patch 2.4.2 去掉的Global String
if (GetLocale() == "zhCN") then
    GOLD = "金币";
    SILVER = "银币";
    COPPER = "铜币";
elseif (GetLocale() == "zhTW") then
    GOLD = "金幣";
    SILVER = "銀幣";
    COPPER = "銅幣";
else
    GOLD = "gold";
    SILVER = "silver";
    COPPER = "copper";
end

-----------------------------------
-- 重新定位宠物动作条
do
    local frame = CreateFrame("Frame");
    local PETACTIONBAR_XPOS;    -- 本地化变量
    local enable = false;
    local function UpdatePositionValue()
        if ( PetActionBarFrame_IsAboveShapeshift(true) ) then
            PETACTIONBAR_XPOS = 36;
        elseif ( MainMenuBarVehicleLeaveButton and MainMenuBarVehicleLeaveButton:IsShown() ) then
            PETACTIONBAR_XPOS = MainMenuBarVehicleLeaveButton:GetRight() + 20;
        elseif ( ShapeshiftBarFrame and ShapeshiftBarFrame:IsShown() and GetNumShapeshiftForms() > 0 ) then
            PETACTIONBAR_XPOS = _G["ShapeshiftButton"..GetNumShapeshiftForms()]:GetRight() + 20;
        elseif ( MultiCastActionBarFrame and HasMultiCastActionBar() ) then
            PETACTIONBAR_XPOS = MultiCastActionBarFrame:GetRight() + 20;
        else
            PETACTIONBAR_XPOS = 36;
        end

        -- if ( AspectPosionBar and AspectPosionBar:IsShown() and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then
        --     local index = AspectPosionBarFrame:GetNumShapeshiftForms();
        --     PETACTIONBAR_XPOS = _G["AspectPosionBarButton" .. index]:GetRight() + 5;
        -- end
    end

    PetActionBarFrame_UpdatePosition = function()
        if (enable) then
            UpdatePositionValue();
            PetActionBarFrame.slideTimer=nil;
            PetActionBarFrame:ClearAllPoints();
            if ( AspectPosionBar and AspectPosionBar:IsShown() and AspectPosionBarFrame:GetNumShapeshiftForms() > 0) then
                PetActionBarFrame:SetPoint("TOPRIGHT", PetActionBarFrame:GetParent(), "BOTTOMRIGHT", 65, PETACTIONBAR_YPOS);
            else
                PetActionBarFrame:SetPoint("TOPLEFT", PetActionBarFrame:GetParent(), "BOTTOMLEFT", PETACTIONBAR_XPOS, PETACTIONBAR_YPOS);
            end
        end
    end

    frame:SetScript("OnLoad", PetActionBarFrame_UpdatePosition);
    frame:SetScript("OnEvent", PetActionBarFrame_UpdatePosition);
    hooksecurefunc("UIParent_ManageFramePositions", function()
        RePositionPetActionBar();
        DelayCall("RePositionPetActionBar", 0.5);
    end);

    --hooksecurefunc("PetActionBar_UpdatePositionValues", function()
    --  if (enable) then
    --UpdatePositionValue();
    --  end
    --end);

    function PetActionBarFrameRePosition_Toggle(switch)
        if (switch) then
            enable = true;
            frame:RegisterEvent("PLAYER_REGEN_DISABLED");
        else
            enable = false;
            frame:UnregisterEvent("PLAYER_REGEN_DISABLED");
        end
        RePositionPetActionBar();
    end

    function IsRePositionPetActionBar()
        return enable;
    end

    function RePositionPetActionBar()
        SecureCall(PetActionBarFrame_UpdatePosition)
    end
end
