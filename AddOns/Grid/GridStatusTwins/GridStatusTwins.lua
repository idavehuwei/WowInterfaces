-- Setup translations
-- James@wop 藏宝海湾


local L = AceLibrary("AceLocale-2.2"):new("GridStatusTwins")

GridStatusTwins = GridStatus:NewModule("GridStatusTwins")

L:RegisterTranslations("enUS", function()
	return {
		["Twins Stack"] = true,
    ["Flame Touch"] = true,    
    ["Dark Touch"] = true, 
        
		["Color 1"] = true,
		["Color 2"] = true,

		["Color of Flame Touch."] = true,
		["Color of Dark Touch."] = true,
		
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		["Twins Stack"] = "艾瑞达双子触摸堆叠",
    ["Flame Touch"] = "烈焰触摸",
    ["Dark Touch"] = "黑暗触摸", 
    
		["Color 1"] = "烈焰触摸颜色",
		["Color 2"] = "黑暗触摸颜色",

		["Color of Flame Touch."] = "烈焰触摸的堆叠颜色",
		["Color of Dark Touch."] = "黑暗触摸的堆叠颜色",
		
	}
end)

GridStatusTwins.menuName = L["Twins Stack"]
local FlameName = L["Flame Touch"]
local DarkName = L["Dark Touch"]

GridStatusTwins.defaultDB = {
	debug = false,
	alert_TwinsStack = {
		text = L["Twins Stack"],
		enable = true,
		color1 = { r = 1, g = 0, b = 0, a = 1 },
		color2 = { r = 1, g = 1, b = 1, a = 1 },
		priority = 99,
		range = false,
	},
}

local alert_TwinsStackOptions = {
	["color"] = false,
	["color1"] = {
		type = "color",
		order = 100,
		name = L["Color 1"],
		desc = L["Color of Flame Touch."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusTwins.db.profile.alert_TwinsStack.color1
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusTwins.db.profile.alert_TwinsStack.color1
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color2"] = {
		type = "color",
		order = 101,
		name = L["Color 2"],
		desc = L["Color of Dark Touch."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusTwins.db.profile.alert_TwinsStack.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusTwins.db.profile.alert_TwinsStack.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}

function GridStatusTwins:OnInitialize()
	self.super.OnInitialize(self)
	self:RegisterStatus("alert_TwinsStack", L["Twins Stack"], alert_TwinsStackOptions)
end

function GridStatusTwins:OnEnable()
	local f = function()
		GridStatusTwins:UpdateAllUnits("player")
	end
	self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	self:RegisterEvent("SpecialEvents_UnitDebuffLost")
	self:RegisterEvent("SpecialEvents_UnitDebuffCountChanged")
	self:RegisterEvent("Grid_UnitJoined")
	self:RegisterEvent("Grid_UnitDeath")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
	self:ScheduleRepeatingEvent("GridTwins_Refresh", f, 0.07)
end

function GridStatusTwins:Reset()
	self.super.Reset(self)
	self:UpdateAllUnits()
end

function GridStatusTwins:UpdateAllUnits()
	local name, status, statusTbl

	for name, status, statusTbl in self.core:CachedStatusIterator("alert_TwinsStack") do
		self:UpdateUnit(name,true)
	end
end

function GridStatusTwins:Grid_UnitJoined(name, unitid)
	if unitid then
		self:UpdateUnit(unitid)
	end
end

function GridStatusTwins:Grid_UnitDeath(unitname)
	local status, moduleName, desc
	for status, moduleName, desc in self.core:RegisteredStatusIterator() do
		if moduleName == self.name then
			self.core:SendStatusLost(unitname, status)
		end
	end
end

function GridStatusTwins:CountStacks(unitid)
	local maxdebuffs = 5
	if unitid then
		for i = 1, maxdebuffs do
			debuffName, rank, texture, apps, dtype, duration, timeleft = UnitDebuff(unitid,i)
			if debuffName then
				if self:isTwins(debuffName) then
					return apps, debuffName
				end
			end
		end
	end
	return 0
end

function GridStatusTwins:SpecialEvents_UnitDebuffGained(unit, debuff, apps, type, tex, rank, index)
	--self:UpdateUnit(unit,true)
	self:Debug("UnitDebuffGained:"..debuff..apps)
	if self:isTwins( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusTwins:SpecialEvents_UnitDebuffLost(unit, debuff, apps, type, tex, rank)
	self:Debug("UnitDebuffLost:"..debuff..apps)
	if self:isTwins( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusTwins:SpecialEvents_UnitDebuffCountChanged(unit, debuff, apps, type, tex, rank, index)
	self:Debug("UnitDebuffChanged:"..debuff..apps)
	if self:isTwins( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusTwins:isTwins(debuffName)
	if debuffName == FlameName or debuffName == DarkName then
		return true
	end
	return false
end

function GridStatusTwins:UpdateUnit(unitid, ignoreRange)
	local name = UnitName(unitid)

	if not name then return end

	local settings = self.db.profile.alert_TwinsStack
	local TwinsCount, TwinsName = self:CountStacks(unitid)

	self:Debug("Count:"..TwinsCount)
	if TwinsCount == 0 then
		self.core:SendStatusLost(name, "alert_TwinsStack")
	else
		local thecolor = settings.color1
		if TwinsName == DarkName then
			thecolor = settings.color2
		end
		self.core:SendStatusGained(name, "alert_TwinsStack",
			settings.priority,
			(settings.range and 40),
			thecolor,
			tostring(TwinsCount),
			TwinsCount,
			30 )
	end
end







