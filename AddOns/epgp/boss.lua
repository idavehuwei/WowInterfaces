local mod = EPGP:NewModule("boss", "AceEvent-3.0")
local Debug = LibStub("LibDebug-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local Coroutine = LibStub("LibCoroutine-1.0")

local in_combat = false

local function IsRLorML()
  if UnitInRaid("player") then
    local loot_method, ml_party_id, ml_raid_id = GetLootMethod()
    if loot_method == "master" and ml_party_id == 0 then return true end
    if loot_method ~= "master" and IsRaidLeader() then return true end
  end
  return false
end

local function ShowPopup(event_name, boss_name)
  while (in_combat or StaticPopup_Visible("EPGP_BOSS_DEAD") or
         StaticPopup_Visible("EPGP_BOSS_ATTEMPT")) do
    Coroutine:Sleep(0.1)
  end

  local dialog
  if event_name == "kill" or event_name == "BossKilled" then
    dialog = StaticPopup_Show("EPGP_BOSS_DEAD", boss_name)
  elseif event_name == "wipe" and mod.db.profile.wipedetection then
    dialog = StaticPopup_Show("EPGP_BOSS_ATTEMPT", boss_name)
  end

  if dialog then
    dialog.reason = boss_name
  end
end

local function BossAttempt(event_name, boss_name)
  Debug("Boss attempt: %s %s", event_name, boss_name)
  -- Temporary fix since we cannot unregister DBM callbacks
  if not mod:IsEnabled() then return end

  if CanEditOfficerNote() and IsRLorML() then
    Coroutine:RunAsync(ShowPopup, event_name, boss_name)
  end
end

function mod:PLAYER_REGEN_DISABLED()
  in_combat = true
end

function mod:PLAYER_REGEN_ENABLED()
  in_combat = false
end

function mod:DebugTest()
  BossAttempt("BossKilled", "Sapphiron")
  BossAttempt("kill", "Bob")
  BossAttempt("wipe", "Spongebob")
end

mod.dbDefaults = {
  profile = {
    enabled = false,
    wipedetection = false,
  },
}

mod.optionsName = L["Boss"]
mod.optionsDesc = L["Automatic boss tracking"]
mod.optionsArgs = {
  help = {
    order = 1,
    type = "description",
    name = L["Automatic boss tracking by means of a popup to mass award EP to the raid and standby when a boss is killed."]
  },
  wipedetection = {
    type = "toggle",
    name = L["Wipe awards"],
    desc = L["Awards for wipes on bosses. Requires DBM, DXE, or BigWigs"],
    order = 2,
    disabled = function(v) return not DBM end,
  },
}

local function dbmCallback(event, mod)
  Debug("dbmCallback: %s %s", event, mod.combatInfo.name)
  BossAttempt(event, mod.combatInfo.name)
end

local function chatMsgAddon(event, prefix, message, type, sender)
  if prefix ~= "BigWigs" then return end

  local sync, rest = select(3, message:find("(%S+)%s*(.*)$"))

  if sync ~= "Death" then return end

  Debug("chatMsgAddon: %s %s %s", prefix, sync, rest)
  BossAttempt("kill", rest)
end

local function dxeCallback(event, encounter)
  Debug("dxeCallback: %s %s", event, encounter.name)
  BossAttempt("kill", encounter.name)
end

function mod:OnEnable()
  self:RegisterEvent("PLAYER_REGEN_DISABLED")
  self:RegisterEvent("PLAYER_REGEN_ENABLED")
  if DBM then
    EPGP:Print(L["Using %s for boss kill tracking"]:format("DBM"))
    DBM:RegisterCallback("kill", dbmCallback)
    DBM:RegisterCallback("wipe", dbmCallback)
  elseif BigWigs then
    EPGP:Print(L["Using %s for boss kill tracking"]:format("BigWigs"))
    self:RegisterEvent("CHAT_MSG_ADDON", chatMsgAddon)
  elseif DXE then
    EPGP:Print(L["Using %s for boss kill tracking"]:format("DXE"))
    DXE.RegisterCallback(mod, "TriggerDefeat", dxeCallback)
  end
end

function mod:OnDisable()
  if DXE then
    DXE.UnregisterCallback(mod, "TriggerDefeat")
  end
end
