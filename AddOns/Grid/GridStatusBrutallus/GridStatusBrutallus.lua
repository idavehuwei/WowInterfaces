-- Setup translations
-- code from GridStatusKalecgos by evildead & Pastamancer, modified by James@wop 藏宝海湾


local L = AceLibrary("AceLocale-2.2"):new("GridStatusBrutallus")

L:RegisterTranslations("enUS", function()
        return {
            ["Brutallus Burn"] = true,
            ["Color < 30 sec"] = true,
            ["Color when someone has had the burn for less than 30 seconds"] = true,
            ["Color in 30-40 sec"] = true,
            ["Color when someone has had the burn betweeen 30 to 40 seconds"] = true,
            ["Color >= 40 sec"] = true,
            ["Color when someone has had the burn for 40 or more seconds"] = true,
        }
    end)

L:RegisterTranslations("zhCN", function()
        return {
             ["Brutallus Burn"] = "布鲁塔卢斯燃烧警报" ,
             ["Color < 30 sec"] = "<30秒时的颜色提醒",            
             ["Color when someone has had the burn for less than 30 seconds"] ="当队员中了燃烧debuff的持续时间小于30秒时的显示颜色", 
             ["Color in 30-40 sec"] = "30-40秒时的颜色提醒",
             ["Color when someone has had the burn betweeen 30 to 40 seconds"] = "当队员中了燃烧debuff的持续时间在30至40秒之间的显示颜色",
             ["Color >= 40 sec"] = ">=40秒时的颜色提醒",
             ["Color when someone has had the burn for 40 or more seconds"] = "当队员中了燃烧debuff的持续时间大于40秒时的显示颜色",
        }
    end)
    
-- Get spell name
--
local spellid = {
    ["Burn"] = 46394, -- change this spellid if you want to test with another spell
}

local BS = {
    ["Burn"] = GetSpellInfo(spellid["Burn"]),
}

local spell_icon = {
    ["Burn"] = select(3, GetSpellInfo(spellid["Burn"])),
}

-- Make things local
local select, next, pairs = select, next, pairs
local GetTime = GetTime
local UnitName = UnitName

--- Module begins
---

GridStatusBrutallus = GridStatus:NewModule("GridStatusBrutallus")
local GridStatusBrutallus = GridStatusBrutallus
GridStatusBrutallus.menuName = L["Brutallus Burn"]

GridStatusBrutallus.defaultDB = {
    ["debug"] = false,
    ["alert_Brutallus"] = {
        ["desc"] = BS["Burn"],
        ["enable"] = true,
        ["priority"] = 99,
        ["range"] = false,
        ["icon"] = spell_icon["Burn"],
        ["color1"] = {
            r = 0,
            g = 1,
            b = 0,
            a = 1,
        },
        ["color2"] = {
            r = 1,
            g = 0,
            b = 0,
            a = 1,
        },
        ["color3"] = {
            r = 1,
            g = 0.78,
            b = 0.10,
            a = 1,
        },      
    },
}

local curseOptions = {
    ["color"] = false, 
    ["color1"] = {
        type = "color",
        name = L["Color < 30 sec"],
        desc = L["Color when someone has had the burn for less than 30 seconds"],
        order = 87,
        hasAlpha = true,
        get = function ()
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color1
                  return color.r, color.g, color.b, color.a
              end,
        set = function (r, g, b, a)
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color1
                  color.r = r
                  color.g = g
                  color.b = b
                  color.a = a or 1
              end,
    },
    ["color2"] = {
        type = "color",
        name = L["Color >= 40 sec"],
        desc = L["Color when someone has had the burn for 40 or more seconds"],
        order = 89,
        hasAlpha = true,
        get = function ()
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color2
                  return color.r, color.g, color.b, color.a
              end,
        set = function (r, g, b, a)
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color2
                  color.r = r
                  color.g = g
                  color.b = b
                  color.a = a or 1
              end,
    },
    ["color3"] = {
        type = "color",
        name = L["Color in 30-40 sec"],
        desc = L["Color when someone has had the burn betweeen 30 to 40 seconds"],
        order = 88,
        hasAlpha = true,
        get = function ()
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color3
                  return color.r, color.g, color.b, color.a
              end,
        set = function (r, g, b, a)
                  local color = GridStatusBrutallus.db.profile["alert_Brutallus"].color3
                  color.r = r
                  color.g = g
                  color.b = b
                  color.a = a or 1
              end,
    },
}

GridStatusBrutallus.options = false

function GridStatusBrutallus:OnInitialize()
    self.super.OnInitialize(self)
    self:RegisterStatus("alert_Brutallus", L["Brutallus Burn"],
                        curseOptions, true)
end

function GridStatusBrutallus:OnEnable()
    -- should probably use BabbleZone to look for sunwell so we're not doing
    -- anything when not in the sunwell
    self:RegisterEvent("SpecialEvents_UnitDebuffGained")
    self:RegisterEvent("SpecialEvents_UnitDebuffLost")   
    self._timers = {}
end

function GridStatusBrutallus:OnDisable()
    self:UnregisterEvent("SpecialEvents_UnitDebuffGained")
    self:UnregisterEvent("SpecialEvents_UnitDebuffLost")
    
    self:CancelScheduledEvent("GridStatusBrutallus_BrutallusDebuffTimer")
    self._timers = nil

    for name, status, statusTbl in self.core:CachedStatusIterator("alert_Brutallus") do
        self.core:SendStatusLost(name, "alert_Brutallus")
    end
end

function GridStatusBrutallus:Reset()
    self:OnDisable()
    self:OnEnable()
end

function GridStatusBrutallus:SpecialEvents_UnitDebuffGained(unit, debuff, apps, type, tex, rank, index)
	if unit == "target" or unit == "focus" then
		return
	end

    if debuff == BS["Burn"] then
        self:Debug("Burn Gained:", debuff)
        self:Debug("Burn Gained:", BS["Burn"])     
        self._timers[unit] = GetTime()
        self:StartOrStopTimer()
    end
end

function GridStatusBrutallus:SpecialEvents_UnitDebuffLost(unit, debuff, apps, type, tex, rank)
	if unit == "target" or unit == "focus" then
		return
	end

    if debuff == BS["Burn"] then
        self._timers[unit] = nil
        self.core:SendStatusLost(UnitName(unit), "alert_Brutallus")
        self:StartOrStopTimer()
    end
end

function GridStatusBrutallus:StartOrStopTimer()
    if not next(self._timers) then
        self:CancelScheduledEvent("GridStatusBrutallus_BrutallusDebuffTimer")
    elseif not self:IsEventScheduled("GridStatusBrutallus_BrutallusDebuffTimer") then
        self:ScheduleRepeatingEvent("GridStatusBrutallus_BrutallusDebuffTimer",
                                    self.DebuffTimer, 0.5, self)
    end
end

function GridStatusBrutallus:DebuffTimer()
    local settings = self.db.profile["alert_Brutallus"]

    if not settings.enable then
        return self:OnDisable()
    end

    local now = GetTime()

    for unit,time in pairs(self._timers) do
        -- elapsed is the number of seconds the unit has had the debuff
        local elapsed = now - time

        local color = settings.color1

        -- use color3 if unit has had the debuff between 30-40 seconds
        if elapsed >= 30 and elapsed <40 then
            color = settings.color3
        end

        -- use color2 if unit has had the debuff for 40 or more seconds
        if elapsed >= 40 then
            color = settings.color2
        end
        
        self.core:SendStatusGained(UnitName(unit), "alert_Brutallus",
                                   settings.priority, false,
                                   color,
                                   ("%d"):format(elapsed),
                                   elapsed, 60,
                                   settings.icon)
    end
end