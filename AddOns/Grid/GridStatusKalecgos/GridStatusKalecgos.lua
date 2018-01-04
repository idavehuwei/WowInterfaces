-- Setup translations
--
local L = AceLibrary("AceLocale-2.2"):new("GridStatusKalecgos")

L:RegisterTranslations("enUS", function()
        return {
            ["Kalecgos Curse"] = true,
            ["Color < 10 sec"] = true,
            ["Color when someone has had the curse for less than 10 seconds"] = true,
            ["Color >= 10 sec"] = true,
            ["Color when someone has had the curse for 10 or more seconds"] = true,
        }
    end)

L:RegisterTranslations("zhCN", function()
        return {
            ["Kalecgos Curse"] = "卡雷苟斯诅咒警报",
            ["Color < 10 sec"] = "<10秒时的颜色提醒",
            ["Color when someone has had the curse for less than 10 seconds"] = "当队员中了无尽痛苦诅咒的持续时间小于10秒时的显示颜色。",
            ["Color >= 10 sec"] = ">=10秒时的颜色提醒",
            ["Color when someone has had the curse for 10 or more seconds"] = "当队员中了无尽痛苦诅咒的持续时间大于10秒时的显示颜色。",
        }
    end)

-- Get spell name
--
local spellid = {
    ["Curse of Boundless Agony"] = 45032, -- change this spellid if you want to test with another spell
}

local BS = {
    ["Curse of Boundless Agony"] = GetSpellInfo(spellid["Curse of Boundless Agony"]),
}

local spell_icon = {
    ["Curse of Boundless Agony"] = select(3, GetSpellInfo(spellid["Curse of Boundless Agony"])),
}

-- Make things local
local select, next, pairs = select, next, pairs
local GetTime = GetTime
local UnitName = UnitName

--- Module begins
---

GridStatusKalecgos = GridStatus:NewModule("GridStatusKalecgos")
local GridStatusKalecgos = GridStatusKalecgos
GridStatusKalecgos.menuName = L["Kalecgos Curse"]

GridStatusKalecgos.defaultDB = {
    ["debug"] = false,
    ["alert_kalecgos"] = {
        ["desc"] = BS["Curse of Boundless Agony"],
        ["enable"] = true,
        ["priority"] = 99,
        ["range"] = false,
        ["icon"] = spell_icon["Curse of Boundless Agony"],
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
    },
}

local curseOptions = {
    ["color"] = false,
    ["color1"] = {
        type = "color",
        name = L["Color < 10 sec"],
        desc = L["Color when someone has had the curse for less than 10 seconds"],
        order = 88,
        hasAlpha = true,
        get = function ()
                  local color = GridStatusKalecgos.db.profile["alert_kalecgos"].color1
                  return color.r, color.g, color.b, color.a
              end,
        set = function (r, g, b, a)
                  local color = GridStatusKalecgos.db.profile["alert_kalecgos"].color1
                  color.r = r
                  color.g = g
                  color.b = b
                  color.a = a or 1
              end,
    },
    ["color2"] = {
        type = "color",
        name = L["Color >= 10 sec"],
        desc = L["Color when someone has had the curse for 10 or more seconds"],
        order = 89,
        hasAlpha = true,
        get = function ()
                  local color = GridStatusKalecgos.db.profile["alert_kalecgos"].color2
                  return color.r, color.g, color.b, color.a
              end,
        set = function (r, g, b, a)
                  local color = GridStatusKalecgos.db.profile["alert_kalecgos"].color2
                  color.r = r
                  color.g = g
                  color.b = b
                  color.a = a or 1
              end,
    },
}

GridStatusKalecgos.options = false

function GridStatusKalecgos:OnInitialize()
    self.super.OnInitialize(self)
    self:RegisterStatus("alert_kalecgos", L["Kalecgos Curse"],
                        curseOptions, true)
end

function GridStatusKalecgos:OnEnable()
    -- should probably use BabbleZone to look for sunwell so we're not doing
    -- anything when not in the sunwell
    self:RegisterEvent("SpecialEvents_UnitDebuffGained")
    self:RegisterEvent("SpecialEvents_UnitDebuffLost")
    self._timers = {}
end

function GridStatusKalecgos:OnDisable()
	if not self:IsEventRegistered("SpecialEvents_UnitDebuffGained") then
		-- if unitdebuffgained isn't registered then OnEnable hasn't been called
		-- and there's nothing to disable
		return
	end
    self:UnregisterEvent("SpecialEvents_UnitDebuffGained")
    self:UnregisterEvent("SpecialEvents_UnitDebuffLost")

    self:CancelScheduledEvent("GridStatusKalecgos_KalecgosDebuffTimer")
    self._timers = nil

    for name, status, statusTbl in self.core:CachedStatusIterator("alert_kalecgos") do
        self.core:SendStatusLost(name, "alert_kalecgos")
    end
end

function GridStatusKalecgos:Reset()
	self:OnDisable()
    self:OnEnable()
end

function GridStatusKalecgos:SpecialEvents_UnitDebuffGained(unit, debuff, apps, type, tex, rank, index)
	if unit == "target" or unit == "focus" then
		return
	end

    if debuff == BS["Curse of Boundless Agony"] then
	local settings = self.db.profile["alert_kalecgos"]

        self:Debug("Curse Gained:", debuff)
        self:Debug("Curse Gained:", BS["Curse of Boundless Agony"])

	-- Immediately start at color1 to overwrite any lower priority icons before the next timer tick
        self.core:SendStatusGained(UnitName(unit), "alert_kalecgos",
                                   settings.priority, false,
                                   settings.color1,
                                   ("%d"):format(0),
                                   0, 30,
                                   settings.icon)

        self._timers[unit] = GetTime()
        self:StartOrStopTimer()
    end
end

function GridStatusKalecgos:SpecialEvents_UnitDebuffLost(unit, debuff, apps, type, tex, rank)
	if unit == "target" or unit == "focus" then
		return
	end

    if debuff == BS["Curse of Boundless Agony"] then
        self._timers[unit] = nil
        self.core:SendStatusLost(UnitName(unit), "alert_kalecgos")
        self:StartOrStopTimer()
    end
end

function GridStatusKalecgos:StartOrStopTimer()
    if not next(self._timers) then
        self:CancelScheduledEvent("GridStatusKalecgos_KalecgosDebuffTimer")
    elseif not self:IsEventScheduled("GridStatusKalecgos_KalecgosDebuffTimer") then
        self:ScheduleRepeatingEvent("GridStatusKalecgos_KalecgosDebuffTimer",
                                    self.DebuffTimer, 0.5, self)
    end
end

function GridStatusKalecgos:DebuffTimer()
    local settings = self.db.profile["alert_kalecgos"]

    if not settings.enable then
        return self:OnDisable()
    end

    local now = GetTime()

    for unit,time in pairs(self._timers) do
        -- elapsed is the number of seconds the unit has had the debuff
        local elapsed = now - time

        local color = settings.color1

        -- use color2 if unit has had the debuff for 10 or more seconds
        if elapsed >= 10 then
            color = settings.color2
        end

        self.core:SendStatusGained(UnitName(unit), "alert_kalecgos",
                                   settings.priority, false,
                                   color,
                                   ("%d"):format(elapsed),
                                   elapsed, 30,
                                   settings.icon)
    end
end