--
-- GetNumRecords(): Returns the number of log records.
--
-- GetLogRecord(i): Returns the ith log record starting 0.
--
-- ExportLog(): Returns a string with the data of the exported log for
-- import into the web application.
--
-- UndoLastAction(): Removes the last entry from the log and undoes
-- its action. The undone action is not logged.
--
-- This module also fires the following messages.
--
-- LogChanged(n): Fired when the log is changed. n is the new size of
-- the log.
--

local mod = EPGP:NewModule("log", "AceComm-3.0")

local L = LibStub:GetLibrary("AceLocale-3.0"):GetLocale("EPGP")
local GS = LibStub("LibGuildStorage-1.0")
local JSON = LibStub("LibJSON-1.0")
local deformat = LibStub("LibDeformat-3.0")

local CallbackHandler = LibStub("CallbackHandler-1.0")
if not mod.callbacks then
  mod.callbacks = CallbackHandler:New(mod)
end
local callbacks = mod.callbacks

local timestamp_t = {}
local function GetTimestamp(diff)
  timestamp_t.month = select(2, CalendarGetDate())
  timestamp_t.day = select(3, CalendarGetDate())
  timestamp_t.year = select(4, CalendarGetDate())
  timestamp_t.hour = select(1, GetGameTime())
  timestamp_t.min = select(2, GetGameTime())
  if diff then
    timestamp_t.month = timestamp_t.month + (diff.month or 0)
    timestamp_t.day = timestamp_t.day + (diff.day or 0)
    timestamp_t.year = timestamp_t.year + (diff.year or 0)
    timestamp_t.hour = timestamp_t.hour + (diff.hour or 0)
    timestamp_t.min = timestamp_t.min + (diff.min or 0)
  end
  return time(timestamp_t)
end

local LOG_FORMAT = "LOG:%d\31%s\31%s\31%s\31%d"

local function AppendToLog(kind, event_type, name, reason, amount, mass, undo)
  if not undo then
    -- Clear the redo table
    for k,_ in ipairs(mod.db.profile.redo) do
      mod.db.profile.redo[k] = nil
    end
    local entry = {GetTimestamp(), kind, name, reason, amount}
    table.insert(mod.db.profile.log, entry)
    mod:SendCommMessage("EPGP", string.format(LOG_FORMAT, unpack(entry)),
                        "GUILD", nil, "BULK")
    callbacks:Fire("LogChanged", #mod.db.profile.log)
  end
end

function mod:LogSync(prefix, msg, distribution, sender)
  if prefix == "EPGP" and sender ~= UnitName("player") then
    local timestamp, kind, name, reason, amount = deformat(msg, LOG_FORMAT)
    if timestamp then
      local entry = {tonumber(timestamp), kind, name, reason, tonumber(amount)}
      table.insert(mod.db.profile.log, entry)
      callbacks:Fire("LogChanged", #self.db.profile.log)
    end
  end
end

local function LogRecordToString(record)
  local timestamp, kind, name, reason, amount = unpack(record)

  if kind == "EP" then
    return string.format(L["%s: %+d EP (%s) to %s"],
                         date("%Y-%m-%d %H:%M", timestamp), amount, reason, name)
  elseif kind == "GP" then
    return string.format(L["%s: %+d GP (%s) to %s"],
                         date("%Y-%m-%d %H:%M", timestamp), amount, reason, name)
  elseif kind == "BI" then
    return string.format(L["%s: %s to %s"],
                         date("%Y-%m-%d %H:%M", timestamp), reason, name)
  else
    assert(false, "Unknown record in the log")
  end
end

function mod:GetNumRecords()
  return #self.db.profile.log
end

function mod:GetLogRecord(i)
  local logsize = #self.db.profile.log
  assert(i >= 0 and i < #self.db.profile.log, "Index "..i.." is out of bounds")

  return LogRecordToString(self.db.profile.log[logsize - i])
end

function mod:CanUndo()
  if not CanEditOfficerNote() or not GS:IsCurrentState() then
    return false
  end
  return #self.db.profile.log ~= 0
end

function mod:UndoLastAction()
  assert(#self.db.profile.log ~= 0)

  local record = table.remove(self.db.profile.log)
  table.insert(self.db.profile.redo, record)

  local timestamp, kind, name, reason, amount = unpack(record)

  local ep, gp, main = EPGP:GetEPGP(name)

  if kind == "EP" then
    EPGP:IncEPBy(name, L["Undo"].." "..reason, -amount, false, true)
  elseif kind == "GP" then
    EPGP:IncGPBy(name, L["Undo"].." "..reason, -amount, false, true)
  elseif kind == "BI" then
    EPGP:BankItem(L["Undo"].." "..reason, true)
  else
    assert(false, "Unknown record in the log")
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
  return true
end

function mod:CanRedo()
  if not CanEditOfficerNote() or not GS:IsCurrentState() then
    return false
  end

  return #self.db.profile.redo ~= 0
end

function mod:RedoLastUndo()
  assert(#self.db.profile.redo ~= 0)

  local record = table.remove(self.db.profile.redo)
  local timestamp, kind, name, reason, amount = unpack(record)

  local ep, gp, main = EPGP:GetEPGP(name)
  if kind == "EP" then
    EPGP:IncEPBy(name, L["Redo"].." "..reason, amount, false, true)
    table.insert(self.db.profile.log, record)
  elseif kind == "GP" then
    EPGP:IncGPBy(name, L["Redo"].." "..reason, amount, false, true)
    table.insert(self.db.profile.log, record)
  else
    assert(false, "Unknown record in the log")
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
  return true
end

-- This is kept for historical reasons: see
-- http://code.google.com/p/epgp/issues/detail?id=350.
function mod:Snapshot()
  local t = self.db.profile.snapshot
  if not t then
    t = {}
    self.db.profile.snapshot = t
  end
  t.time = GetTimestamp()
  GS:Snapshot(t)
end

local function swap(t, i, j)
  t[i], t[j] = t[j], t[i]
end

local function reverse(t)
  for i=1,math.floor(#t / 2) do
    swap(t, i, #t - i + 1)
  end
end

function mod:TrimToOneMonth()
  -- The log is sorted in reverse timestamp. We do not want to remove
  -- one item at a time since this will result in O(n^2) time. So we
  -- build it anew.
  local new_log = {}
  local last_timestamp = GetTimestamp({ month = -1 })

  -- Go through the log in reverse order and stop when we reach an
  -- entry older than one month.
  for i=#self.db.profile.log,1,-1 do
    local record = self.db.profile.log[i]
    if record[1] < last_timestamp then
      break
    end
    table.insert(new_log, record)
  end

  -- The new log is in reverse order now so reverse it.
  reverse(new_log)

  self.db.profile.log = new_log

  callbacks:Fire("LogChanged", #self.db.profile.log)
end

function mod:Export()
  local d = {}
  d.region = GetCVar("portal")
  d.guild = select(1, GetGuildInfo("player"))
  d.realm = GetRealmName()
  d.base_gp = EPGP:GetBaseGP()
  d.min_ep = EPGP:GetMinEP()
  d.decay_p = EPGP:GetDecayPercent()
  d.extras_p = EPGP:GetExtrasPercent()
  d.timestamp = GetTimestamp()

  d.roster = EPGP:ExportRoster()

  d.loot = {}
  for i, record in ipairs(self.db.profile.log) do
    local timestamp, kind, name, reason, amount = unpack(record)
    if kind == "GP" or kind == "BI" then
      local id = tonumber(reason:match("item:(%d+)"))
      if id then
        table.insert(d.loot, {timestamp, name, id, amount})
      end
    end
  end

  return JSON.Serialize(d):gsub("\124", "\124\124")
end

function mod:Import(jsonStr)
  local success, d = pcall(JSON.Deserialize, jsonStr)
  if not success then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  if d.region and d.region ~= GetCVar("portal") then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  if d.guild ~= select(1, GetGuildInfo("player")) or
     d.realm ~= GetRealmName() then
    EPGP:Print(L["The imported data is invalid"])
    return
  end

  local types = {
    timestamp = "number",
    roster = "table",
    decay_p = "number",
    extras_p = "number",
    min_ep = "number",
    base_gp = "number",
  }
  for k,t in pairs(types) do
    if type(d[k]) ~= t then
      EPGP:Print(L["The imported data is invalid"])
      return
    end
  end

  for _, entry in pairs(d.roster) do
    if type(entry) ~= "table" then
      EPGP:Print(L["The imported data is invalid"])
      return
    else
      local types = {
        [1] = "string",
        [2] = "number",
        [3] = "number",
      }
      for k,t in pairs(types) do
        if type(entry[k]) ~= t then
          EPGP:Print(L["The imported data is invalid"])
          return
        end
      end
    end
  end

  EPGP:Print(L["Importing data snapshot taken at: %s"]:format(
               date("%Y-%m-%d %H:%M", d.timestamp)))
  EPGP:SetGlobalConfiguration(d.decay_p, d.extras_p, d.base_gp, d.min_ep)
  EPGP:ImportRoster(d.roster, d.base_gp)

  -- Trim the log if necessary.
  local timestamp = d.timestamp
  while true do
    local records = #self.db.profile.log
    if records == 0 then
      break
    end

    if self.db.profile.log[records][1] > timestamp then
      table.remove(self.db.profile.log)
    else
      break
    end
  end
  -- Add the redos back to the log if necessary.
  while #self.db.profile.redo ~= 0 do
    local record = table.remove(self.db.profile.redo)
    if record[1] < timestamp then
      table.insert(self.db.profile.log, record)
    end
  end

  callbacks:Fire("LogChanged", #self.db.profile.log)
end

mod.dbDefaults = {
  profile = {
    enabled = true,
    log = {},
    redo = {},
  }
}

function mod:OnEnable()
  EPGP.RegisterCallback(mod, "EPAward", AppendToLog, "EP")
  EPGP.RegisterCallback(mod, "GPAward", AppendToLog, "GP")
  EPGP.RegisterCallback(mod, "BankedItem", AppendToLog, "BI")
  mod:RegisterComm("EPGP", "LogSync")

  -- Upgrade the logs from older dbs
  if EPGP.db.profile.log then
    self.db.profile.log = EPGP.db.profile.log
    EPGP.db.profile.log = nil
  end
  if EPGP.db.profile.redo then
    self.db.profile.redo = EPGP.db.profile.redo
    EPGP.db.profile.redo = nil
  end

  -- This is kept for historical reasons. See:
  -- http://code.google.com/p/epgp/issues/detail?id=350.
  EPGP.db.RegisterCallback(self, "OnDatabaseShutdown", "Snapshot")
end
