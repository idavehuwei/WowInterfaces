--===================================================================================
-- BigFootEvent - 版本：1.01
-- 日期：2007-4-11
-- 作者：独孤傲雪
-- 描述：便捷高效的处理事件的类库
-- 版权所有：艾泽拉斯国家地理
-- 特别鸣谢：Ace
--===================================================================================
local __MAJOR_VERSION_NUMBER = 1;
local __MINOR_VERSION_NUMBER = 0;
local BEvent = {registry={},frame = nil};
BEvent.frame = CreateFrame("Frame", "BigFootEventFrame", UIparent);

BEvent.frame:SetScript("OnEvent", function(self, __event, ...)	
	BEvent:__EventHandler(__event, ...);
end)
-- 事件处理
local __stack = setmetatable({}, {__mode = "__k"});	-- 设置为weak Table		
function BEvent:__EventHandler(__event, ...)
	assert(__event and type(__event)=="string","Invalid __event. The type of __event must be string.");

	local __tmp = next(__stack) or {};	
	__stack[__tmp] = nil;
	
	if (__event and BEvent.registry[__event]) then
		for __obj, __method in pairs(BEvent.registry[__event]) do
			if (__event == "COMBAT_LOG_EVENT_UNFILTERED" or __event == "COMBAT_LOG_EVENT") then
				__tmp[__obj] = BEvent.registry[__event][__obj][select(2, ...)];
			else
				__tmp[__obj] = __method;
			end
		end
	end

	for __o, __m in pairs(__tmp) do
		if (type(__m) == "string") then
			if (__o[__m] and type(__o[__m]) == "function") then
				__o[__m](__o, ...);
			end
		elseif (__m and type(__m) == "function") then
			__m(__event, ...);
		end
		__tmp[__o] = nil;
	end
end
--=============================================================================
-- 方法：RegisterEevent
-- 功能：注册事件和对应的方法
-- 参数_1：event - [输入] 事件名 - string
-- 参数_2：method - [输入] 方法 - string or function<可选参数,缺省为event>
--=============================================================================
function BEvent:RegisterEvent(__event, __method)
	assert(__event and type(__event) == "string", "BEvent: Invalid event. The type of event must be string.");
	-- 特殊处理COMBAT_LOG_EVENT_UNFILTERED
	if (__event == "COMBAT_LOG_EVENT_UNFILTERED" or __event == "COMBAT_LOG_EVENT") then
		assert(__method and type(__method) == "string", string.gsub("BEvent: '$EVENT' - Invalid combat log event.", "$EVENT", tostring(__method)));
		if (not BEvent.registry[__event]) then
			BEvent.registry[__event] = {};
			BEvent.frame:RegisterEvent(__event);
		end
		BEvent.registry[__event][self] = BEvent.registry[__event][self] or {};		
		BEvent.registry[__event][self][__method] = __method;
	else
		__method = __method or __event;
		if (not BEvent.registry[__event]) then
			BEvent.registry[__event] = {};
			BEvent.frame:RegisterEvent(__event);
		end	
		BEvent.registry[__event][self] = __method;
	end
end
--=============================================================================
-- 方法：UnregisterEvent
-- 功能：取消obj的事件的注册
-- 参数：event - [输入] 事件名 - string
--=============================================================================
function BEvent:UnregisterEvent(__event, __method)
	assert(type(__event)=="string","Invalid event. The type of event must be string.");
	
	if (BEvent.registry[__event] and BEvent.registry[__event][self]) then
		if (__event == "COMBAT_LOG_EVENT_UNFILTERED" or __event == "COMBAT_LOG_EVENT") then
			if ( __method and BEvent.registry[__event][self][__method]) then
				BEvent.registry[__event][self][__method] = nil;
			else
				BEvent.registry[__event][self] = nil;
			end
		else
			BEvent.registry[__event][self] = nil;
		end

		if (not next(BEvent.registry[__event])) then	-- 如果没有任何插件注册了该事件
			BEvent.registry[__event] = nil					-- 取self的事件
			BEvent.frame:UnregisterEvent(__event)		-- 取消事件注册
		end
	end
end
--=============================================================================
-- 方法：UnregisterAllEvent
-- 功能：取消obj的所有事件注册
--=============================================================================
function BEvent:UnregisterAllEvent()
	for __event, __data in pairs(BEvent.registry) do
		if (__data[self]) then
			self:UnregisterEvent(__event);
		end
	end
end
--=============================================================================
-- 方法: Init
-- 功能: 插件初始化 - 对应于'ADDON_LOADED'事件
-- 参数: ... - [输入] 
--=============================================================================
BEvent.Initialization = {};
function BEvent:Init(...)	
	local __tab = select(1, ...);
	__tab = type(__tab) == "table" and __tab or {};
	__tab.name = __tab.name or __tab[1] or "Unknown";		-- 插件名
	__tab.func = __tab.func or __tab[2] or function() end;		-- 初始化函数
	BEvent:RegisterEvent("ADDON_LOADED");
	table.insert(BEvent.Initialization, __tab);	
end
--=============================================================================
-- ADDON_LOADED - init方法的处理
--=============================================================================
function BEvent.ADDON_LOADED()
	local __k, __v;
	for __k, __v in pairs(BEvent.Initialization) do
		if (arg1 == __v.name) then
			assert(__v.func, string.format("<%s> need a init function", __v.name));

			__v:func();
			table.remove(BEvent.Initialization, __k);			
			break;
		end
	end
end
--=============================================================================
-- 构造函数
--=============================================================================
function BEvent:constructor()	
end

BLibrary:Register(BEvent,"BEvent",__MAJOR_VERSION_NUMBER,__MINOR_VERSION_NUMBER);