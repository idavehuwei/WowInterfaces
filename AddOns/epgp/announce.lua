local mod = EPGP:NewModule("announce")

local Debug = LibStub("LibDebug-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")

local SendChatMessage = _G.SendChatMessage
if ChatThrottleLib then
  SendChatMessage = function(...)
                      ChatThrottleLib:SendChatMessage("NORMAL", "EPGP", ...)
                    end
end

function mod:AnnounceTo(medium, fmt, ...)
  if not medium then return end

  local channel = GetChannelName(self.db.profile.channel or 0)

  -- Override raid and party if we are not grouped
  if (medium == "RAID" or medium == "GUILD") and not UnitInRaid("player") then
    medium = "GUILD"
  end

  local msg = string.format(fmt, ...)
  local str = "EPGP:"
  for _,s in pairs({strsplit(" ", msg)}) do
    if #str + #s >= 250 then
      SendChatMessage(str, medium, nil, channel)
      str = "EPGP:"
    end
    str = str .. " " .. s
  end

  SendChatMessage(str, medium, nil, channel)
end

function mod:Announce(fmt, ...)
  local medium = self.db.profile.medium

  return mod:AnnounceTo(medium, fmt, ...)
end

function mod:EPAward(event_name, name, reason, amount, mass)
  if mass then return end
  mod:Announce(L["%+d EP (%s) to %s"], amount, reason, name)
end

function mod:GPAward(event_name, name, reason, amount, mass)
  if mass then return end
  mod:Announce(L["%+d GP (%s) to %s"], amount, reason, name)
end

function mod:BankedItem(event_name, name, reason, amount, mass)
  mod:Announce(L["%s to %s"], reason, name)
end

local function MakeCommaSeparated(t)
  local first = true
  local awarded = ""

  for name in pairs(t) do
    if first then
      awarded = name
      first = false
    else
      awarded = awarded..", "..name
    end
  end

  return awarded
end

function mod:MassEPAward(event_name, names, reason, amount,
                         extras_names, extras_reason, extras_amount)
  local normal = MakeCommaSeparated(names)
  mod:Announce(L["%+d EP (%s) to %s"], amount, reason, normal)

  if extras_names then
    local extras = MakeCommaSeparated(extras_names)
    mod:Announce(L["%+d EP (%s) to %s"], extras_amount, extras_reason, extras)
  end
end

function mod:Decay(event_name, decay_p)
  mod:Announce(L["Decay of EP/GP by %d%%"], decay_p)
end

function mod:StartRecurringAward(event_name, reason, amount, mins)
  local fmt, val = SecondsToTimeAbbrev(mins * 60)
  mod:Announce(L["Start recurring award (%s) %d EP/%s"], reason, amount, fmt:format(val))
end

function mod:ResumeRecurringAward(event_name, reason, amount, mins)
  local fmt, val = SecondsToTimeAbbrev(mins * 60)
  mod:Announce(L["Resume recurring award (%s) %d EP/%s"], reason, amount, fmt:format(val))
end

function mod:StopRecurringAward(event_name)
  mod:Announce(L["Stop recurring award"])
end

function mod:EPGPReset(event_name)
  mod:Announce(L["EP/GP are reset"])
end

mod.dbDefaults = {
  profile = {
    enabled = true,
    medium = "GUILD",
    events = {
      ['*'] = true,
    },
  }
}

mod.optionsName = L["Announce"]
mod.optionsDesc = L["Announcement of EPGP actions"]
mod.optionsArgs = {
  help = {
    order = 1,
    type = "description",
    name = L["Announces EPGP actions to the specified medium."],
  },
  medium = {
    order = 10,
    type = "select",
    name = L["Announce medium"],
    desc = L["Sets the announce medium EPGP will use to announce EPGP actions."],
    values = {
      ["GUILD"] = CHAT_MSG_GUILD,
      ["OFFICER"] = CHAT_MSG_OFFICER,
      ["RAID"] = CHAT_MSG_RAID,
      ["PARTY"] = CHAT_MSG_PARTY,
      ["CHANNEL"] = CUSTOM,
    },
  },
  channel = {
    order = 11,
    type = "input",
    name = L["Custom announce channel name"],
    desc = L["Sets the custom announce channel name used to announce EPGP actions."],
    disabled = function(i) return mod.db.profile.medium ~= "CHANNEL" end,
  },
  events = {
    order = 12,
    type = "multiselect",
    name = L["Announce when:"],
    values = {
      EPAward = L["A member is awarded EP"],
      MassEPAward = L["Guild or Raid are awarded EP"],
      GPAward = L["A member is credited GP"],
      BankedItem = L["An item was disenchanted or deposited into the guild bank"],
      Decay = L["EPGP decay"],
      StartRecurringAward = L["Recurring awards start"],
      StopRecurringAward = L["Recurring awards stop"],
      ResumeRecurringAward = L["Recurring awards resume"],
      EPGPReset = L["EPGP reset"],
    },
    width = "full",
    get = "GetEvent",
    set = "SetEvent",
  },
}

function mod:GetEvent(i, e)
  return self.db.profile.events[e]
end

function mod:SetEvent(i, e, v)
  if v then
    Debug("Enabling announce of: %s", e)
    EPGP.RegisterCallback(self, e)
  else
    Debug("Disabling announce of: %s", e)
    EPGP.UnregisterCallback(self, e)
  end
  self.db.profile.events[e] = v
end

function mod:OnEnable()
  for e, _ in pairs(mod.optionsArgs.events.values) do
    if self.db.profile.events[e] then
      Debug("Enabling announce of: %s (startup)", e)
      EPGP.RegisterCallback(self, e)
    end
  end
end

function mod:OnDisable()
  EPGP.UnregisterAllCallbacks(self)
end
