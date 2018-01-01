
--[[ 
		BigFootUtils.lua
		
		版本：1.12
		更新时间：2006年1月14日
		更新作者：Andy Xiao
]]--

if (GetLocale() == "zhCN") then
	BIGFOOT_BAG_PATTERN_MATCH = "(%d+)格(.+)";
	BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00开启调试开关<|cffffff00%s|r>。|r";
	BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000关闭调试开关<|cffffff00%s|r>。|r";
elseif (GetLocale() == "zhTW") then
	BIGFOOT_BAG_PATTERN_MATCH = "(%d+)格(.+)";
	BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00開啓調試開關<|cffffff00%s|r>。|r";
	BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000關閉調試開關<|cffffff00%s|r>。|r";
else
	BIGFOOT_BAG_PATTERN_MATCH = "(%d+) Slot (.+)";
	BIGFOOT_SWITCH_MESSAGE_ON = "|cff00ff00Debug Switch <|cffffff00%s|r> is on.|r";
	BIGFOOT_SWITCH_MESSAGE_OFF = "|cffff0000Debug Switch <|cffffff00%s|r> is off.|r";
end

BigFoot_Debug_Filters = {};

-- 获得本地字符串
function bfGetLocalVariable(arg)
	return arg; 
end

-- 取得某项参数
function bfGetConfigVar(key)
	local config = getglobal("BigFoot_Config");
	if ( config == nil ) then
		return nil;
	end

	if ( key ) then
		return config[key];
	else
		return nil;
	end
end

-- 设置某项参数
function bfSetConfigVar(key, value)
	local config = getglobal("BigFootConfig");
	if ( key ) then
		config[key] = value;
	end
end

-- 获得本地的某变量值
function bfGetLocalText(arg)
	local key = bfGetLocalVariable(arg);

	return key;
end

------------------------------------------------------
-- 获得指定的行囊的信息
-- 返回：arg1 行囊大小
--       arg2 行囊类型
------------------------------------------------------
function BigFoot_GetBagInfo(bag)
	BigFoot_Tooltip_Init();
	BigFootTooltip:SetInventoryItem("player", bag);

	local text1 = BigFootTooltipTextLeft1:GetText();
	local text2 = BigFootTooltipTextLeft2:GetText();
	local text3 = BigFootTooltipTextLeft3:GetText();
	local text4 = BigFootTooltipTextLeft4:GetText();

	BigFootTooltip:Hide();

	local st, ed, slots, type;
	local pattern_string;

	if (text2) then
		st, ed, slots, type = string.find(text2, BIGFOOT_BAG_PATTERN_MATCH);
		if (st and ed) then
			return slots, type;
		end
	end

	if (text3) then
		st, ed, slots, type = string.find(text3, BIGFOOT_BAG_PATTERN_MATCH);
		if (st and ed) then
			return slots, type;
		end
	end

	if (text4) then
		st, ed, slots, type = string.find(text4, BIGFOOT_BAG_PATTERN_MATCH);
		if (st and ed) then
			return slots, type;
		end
	end
end

------------------------------------------------------
-- 判断指定的变量是否是一个标量
------------------------------------------------------
function BigFoot_IsScalar(arg)
	if (type(arg) == "table" or type(arg) == "function" or type(arg) == "userdata") then
		return nil;
	else
		return true;
	end
end

------------------------------------------------------
-- 获得变量的固定值
-- 如果变量为空，输出(nil)。
-- 如果变量为函数或者表，输出(function)或者(table)
------------------------------------------------------
function BigFoot_GetScalarValue(arg)
	if (not arg) then
		arg = "(nil)";
	elseif (not BigFoot_IsScalar(arg)) then
		arg = "("..type(arg)..")";
	end

	return arg;
end

------------------------------------------------------
-- 获得变量的可打印形式文字
------------------------------------------------------
function BigFoot_GetPrintableValue(arg)
	if (type(arg) == "table") then
		local string = "{ ";
		local seperator = "";
		local key, value;

		for key, value in pairs(arg) do
			if (type(value) == "table") then
				string = string .. seperator .. key .. " = " .. BigFoot_GetPrintableValue(value);
			else
				string = string .. seperator .. key .. " = " .. BigFoot_GetPrintableValue(value);
			end
			seperator = ", ";
		end
		string = string .. " }";

		return string;
	else
		return BigFoot_GetScalarValue(arg);
	end
end

------------------------------------------------------
-- 打印标量文字到指定地方
-- 参数： arg <输入> 变量
--        callback <输入> 文字输出的callback函数
------------------------------------------------------
function BigFoot_Print(...)
	local args = {...};
	local msg = "";

	for i = 1, table.maxn(args), 1 do
		msg = msg .. BigFoot_GetPrintableValue(args[i]);
	end

	if (msg == "") then
		msg = "(empty)";
	end

	DEFAULT_CHAT_FRAME:AddMessage(msg);
end

------------------------------------------------------
-- 打印调试信息
-- 参数： message <输入> 变量
--        switch <输入> 过滤信息
-- 说明：switch是用来仅仅打开一个开关用的，比如你只想
-- 打开快速拾取的开关，就可以使用
-- BigFoot_DebugPrint("xxx", "autoloot");
------------------------------------------------------
function BigFoot_DebugPrint(message, switch)
	if (BigFoot_Debug_Filters[switch] or BigFoot_Debug_Filters["all"]) then
		BigFoot_Print(message, switch);
	end
end

------------------------------------------------------
-- 开启/关闭调试开关
------------------------------------------------------
function BigFoot_ToggleSwitch(switch)
	if (BigFoot_Debug_Filters[switch]) then
		BigFoot_Debug_Filters[switch] = nil;
		BigFoot_Print(BIGFOOT_SWITCH_MESSAGE_OFF);
	else
		BigFoot_Debug_Filters[switch] = 1;
		BigFoot_Print(BIGFOOT_SWITCH_MESSAGE_ON);
	end
end

SLASH_DBGSWITCH1 = "/dbgswitch";
SlashCmdList["SLASH_DBGSWITCH"] = function(switch)
	BigFoot_ToggleSwitch(switch);
end

function bsplit(str, pat)
	local t = {};
	local fpat = "(.-)" .. pat;
	local last_end = 1;
	local s, e, cap = string.find(str, fpat, 1);
	while (s) do
		if (s ~= 1 or cap ~= "") then
			table.insert(t,cap);
		end
		last_end = e + 1;
		s, e, cap = string.find(str, fpat, last_end);
	end
   
	if (last_end <= string.len(str)) then
		cap = string.sub(str, last_end);
		table.insert(t, cap);
	end
	
	return t;
end
