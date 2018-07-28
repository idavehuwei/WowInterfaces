local mod = EPGP:NewModule("whisper", "AceEvent-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")

local senderMap = {}

local SendChatMessage = _G.SendChatMessage
if ChatThrottleLib then
  SendChatMessage = function(...)
                      ChatThrottleLib:SendChatMessage("NORMAL", "EPGP", ...)
                    end
end

function mod:CHAT_MSG_WHISPER(event_name, msg, sender)
  if not UnitInRaid("player") then return end

  if msg:sub(1, 12):lower() ~= 'epgp standby' then return end

  local member = msg:sub(13):match("([^ ]+)")
  if member then
    -- http://lua-users.org/wiki/LuaUnicode
    local firstChar, offset = member:match("([%z\1-\127\194-\244][\128-\191]*)()")
    member = firstChar:upper()..member:sub(offset):lower()
  else
    member = sender
  end

  senderMap[member] = sender

  if not EPGP:GetEPGP(member) then
    SendChatMessage(L["%s is not eligible for EP awards"]:format(member),
                    "WHISPER", nil, sender)
  elseif EPGP:IsMemberInAwardList(member) then
    SendChatMessage(L["%s is already in the award list"]:format(member),
                    "WHISPER", nil, sender)
  else
    EPGP:SelectMember(member)
    SendChatMessage(L["%s is added to the award list"]:format(member),
                    "WHISPER", nil, sender)
  end
end

local function AnnounceMedium()
  local medium = mod.db.profile.medium
  if medium ~= "NONE" then
    return medium
  end
end

local function SendNotifiesAndClearExtras(
    event_name, names, reason, amount,
    extras_awarded, extras_reason, extras_amount)
  local medium = AnnounceMedium()
  if medium then
    EPGP:GetModule("announce"):AnnounceTo(
      medium,
      L["If you want to be on the award list but you are not in the raid, you need to whisper me: 'epgp standby' or 'epgp standby <name>' where <name> is the toon that should receive awards"])
  end

  if extras_awarded then
    for member,_ in pairs(extras_awarded) do
      local sender = senderMap[member]
      if sender then
        SendChatMessage(L["%+d EP (%s) to %s"]:format(
                          extras_amount, extras_reason, member),
                        "WHISPER", nil, sender)
        EPGP:DeSelectMember(member)
        SendChatMessage(
          L["%s is now removed from the award list"]:format(member),
          "WHISPER", nil, sender)
      end
      senderMap[member] = nil
    end
  end
end

mod.dbDefaults = {
  profile = {
    enable = false,
    medium = "GUILD",
  }
}

mod.optionsName = L["Whisper"]
mod.optionsDesc = L["Standby whispers in raid"]
mod.optionsArgs = {
  help = {
    order = 1,
    type = "description",
    name = L["Automatic handling of the standby list through whispers when in raid. When this is enabled, the standby list is cleared after each reward."],
  },
  medium = {
    order = 10,
    type = "select",
    name = L["Announce medium"],
    desc = L["Sets the announce medium EPGP will use to announce EPGP actions."],
    values = {
      ["GUILD"] = CHAT_MSG_GUILD,
      ["CHANNEL"] = CUSTOM,
      ["NONE"] = NONE,
    },
  },
}

function mod:OnEnable()
  self:RegisterEvent("CHAT_MSG_WHISPER")
  EPGP.RegisterCallback(self, "MassEPAward", SendNotifiesAndClearExtras)
  EPGP.RegisterCallback(self, "StartRecurringAward", SendNotifiesAndClearExtras)
end

function mod:OnDisable()
  EPGP.UnregisterAllCallbacks(self)
end
