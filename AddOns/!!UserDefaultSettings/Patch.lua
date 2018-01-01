
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

-------------------
-- 异步调用(安全的调用别的插件的函数)
do
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