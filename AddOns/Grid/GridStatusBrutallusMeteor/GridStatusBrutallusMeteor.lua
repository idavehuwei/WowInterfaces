-- Setup translations
-- James@wop 藏宝海湾


local L = AceLibrary("AceLocale-2.2"):new("GridStatusBrutallusMeteor")

GridStatusBrutallusMeteor = GridStatus:NewModule("GridStatusBrutallusMeteor")

L:RegisterTranslations("enUS", function()
	return {
		["Brutallus Meteor Stack"] = true,
    ["Meteor Slash"] = true,    
    
		["Color 1"] = true,
		["Color 2"] = true,
		["Color 3"] = true,

		["Color when someone has one stack of Meteor Slash."] = true,
		["Color when someone has two stacks of Meteor Slash."] = true,
		["Color when someone has three stacks of Meteor Slash."] = true,
		
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		["Brutallus Meteor Stack"] = "布鲁塔卢斯流星堆叠",
    ["Meteor Slash"] = "流星猛击",
    
		["Color 1"] = "颜色一",
		["Color 2"] = "颜色二",
		["Color 3"] = "颜色三",

		["Color when someone has one stack of Meteor Slash."] = "流星猛击堆叠一层的颜色",
		["Color when someone has two stacks of Meteor Slash."] = "流星猛击堆叠二层的颜色",
		["Color when someone has three stacks of Meteor Slash."] = "流星猛击堆叠三层的颜色",
		
	}
end)

GridStatusBrutallusMeteor.menuName = L["Brutallus Meteor Stack"]
local BrutallusMeteorName = L["Meteor Slash"]

GridStatusBrutallusMeteor.defaultDB = {
	debug = false,
	alert_BrutallusMeteorStack = {
		text = L["Brutallus Meteor Stack"],
		enable = true,
		color = { r = 0, g = 1, b = 0, a = 1 },
		color2 = { r = 1, g = 0.78, b = 0.10, a = 1 },
		color3 = { r = 1, g = 0, b = 0, a = 1 },
		priority = 99,
		range = false,
	},
}

local alert_BrutallusMeteorStackOptions = {
	["color2"] = {
		type = "color",
		order = 100,
		name = L["Color 2"],
		desc = L["Color when someone has two stacks of Meteor Slash."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusBrutallusMeteor.db.profile.alert_BrutallusMeteorStack.color2
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusBrutallusMeteor.db.profile.alert_BrutallusMeteorStack.color2
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
	["color3"] = {
		type = "color",
		order = 101,
		name = L["Color 3"],
		desc = L["Color when someone has three stacks of Meteor Slash."],
		hasAlpha = true,
		get = function ()
			local color = GridStatusBrutallusMeteor.db.profile.alert_BrutallusMeteorStack.color3
			return color.r, color.g, color.b, color.a
		end,
		set = function (r, g, b, a)
			local color = GridStatusBrutallusMeteor.db.profile.alert_BrutallusMeteorStack.color3
			color.r = r
			color.g = g
			color.b = b
			color.a = a or 1
		end,
	},
}

function GridStatusBrutallusMeteor:OnInitialize()
	self.super.OnInitialize(self)
	self:RegisterStatus("alert_BrutallusMeteorStack", L["Brutallus Meteor Stack"], alert_BrutallusMeteorStackOptions)
end

function GridStatusBrutallusMeteor:OnEnable()
	local f = function()
		GridStatusBrutallusMeteor:UpdateAllUnits("player")
	end
	self:RegisterEvent("SpecialEvents_UnitDebuffGained")
	self:RegisterEvent("SpecialEvents_UnitDebuffLost")
	self:RegisterEvent("SpecialEvents_UnitDebuffCountChanged")
	self:RegisterEvent("Grid_UnitJoined")
	self:RegisterEvent("Grid_UnitDeath")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "UpdateAllUnits")
	self:ScheduleRepeatingEvent("GridBrutallusMeteor_Refresh", f, 0.07)
end

function GridStatusBrutallusMeteor:Reset()
	self.super.Reset(self)
	self:UpdateAllUnits()
end

function GridStatusBrutallusMeteor:UpdateAllUnits()
	local name, status, statusTbl

	for name, status, statusTbl in self.core:CachedStatusIterator("alert_BrutallusMeteorStack") do
		self:UpdateUnit(name,true)
	end
end

function GridStatusBrutallusMeteor:Grid_UnitJoined(name, unitid)
	if unitid then
		self:UpdateUnit(unitid)
	end
end

function GridStatusBrutallusMeteor:Grid_UnitDeath(unitname)
	local status, moduleName, desc
	for status, moduleName, desc in self.core:RegisteredStatusIterator() do
		if moduleName == self.name then
			self.core:SendStatusLost(unitname, status)
		end
	end
end

function GridStatusBrutallusMeteor:CountStacks(unitid)
	local maxdebuffs = 5
	if unitid then
		for i = 1, maxdebuffs do
			debuffName, rank, texture, apps, dtype, duration, timeleft = UnitDebuff(unitid,i)
			if debuffName then
				if self:isBrutallusMeteor(debuffName) then
					return apps
				end
			end
		end
	end
	return 0
end

function GridStatusBrutallusMeteor:SpecialEvents_UnitDebuffGained(unit, debuff, apps, type, tex, rank, index)
	--self:UpdateUnit(unit,true)
	self:Debug("UnitDebuffGained:"..debuff..apps)
	if self:isBrutallusMeteor( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusBrutallusMeteor:SpecialEvents_UnitDebuffLost(unit, debuff, apps, type, tex, rank)
	self:Debug("UnitDebuffLost:"..debuff..apps)
	if self:isBrutallusMeteor( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusBrutallusMeteor:SpecialEvents_UnitDebuffCountChanged(unit, debuff, apps, type, tex, rank, index)
	self:Debug("UnitDebuffChanged:"..debuff..apps)
	if self:isBrutallusMeteor( debuff ) then
		self:UpdateUnit(unit, true)
	end
end

function GridStatusBrutallusMeteor:isBrutallusMeteor(debuffName)
	return debuffName == BrutallusMeteorName
end

function GridStatusBrutallusMeteor:UpdateUnit(unitid, ignoreRange)
	local name = UnitName(unitid)

	if not name then return end

	local settings = self.db.profile.alert_BrutallusMeteorStack
	local BrutallusMeteorCount = self:CountStacks(unitid)

	self:Debug("Count:"..BrutallusMeteorCount)
	if BrutallusMeteorCount == 0 then
		self.core:SendStatusLost(name, "alert_BrutallusMeteorStack")
	else
		local thecolor = settings.color
		if BrutallusMeteorCount == 2 then
			thecolor = settings.color2
		elseif BrutallusMeteorCount == 3 then
			thecolor = settings.color3
		end
		self.core:SendStatusGained(name, "alert_BrutallusMeteorStack",
			settings.priority,
			(settings.range and 40),
			thecolor,
			tostring(BrutallusMeteorCount),
			BrutallusMeteorCount,
			6 )
	end
end







