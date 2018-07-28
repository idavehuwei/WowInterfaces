-- This library handles storing information in officer notes. It
-- streamlines and optimizes access to these notes. It should be noted
-- that the library does not have correct information until
-- PLAYER_ENTERING_WORLD is fired (for Ace authors this is after OnInitialize
-- is called). The API is as follows:
--
-- GetNote(name): Returns the officer note of member 'name'
--
-- SetNote(name, note): Sets the officer note of member 'name' to
-- 'note'
--
-- GetClass(name): Returns the class of member 'name'
--
-- GetGuildInfo(): Returns the guild info text
--
-- IsCurrentState(): Return true if the state of the library is current.
--
-- Snapshot(table) -- DEPRECATED: Write out snapshot in the table
-- provided. table.guild_info will contain the epgp clause in guild
-- info and table.notes a table of {name, class, note}.
--
-- The library also fires the following messages, which you can
-- register for through RegisterCallback and unregister through
-- UnregisterCallback. You can also unregister all messages through
-- UnregisterAllCallbacks.
--
-- GuildInfoChanged(info): Fired when guild info has changed since its
--   previous state. The info is the new guild info.
--
-- GuildNoteChanged(name, note): Fired when a guild note changes. The
--   name is the name of the member of which the note changed and the
--   note is the new note.
--
-- StateChanged(): Fired when the state of the guild storage cache has
-- changed.
--
local MAJOR_VERSION = "LibGuildStorage-1.0"
local MINOR_VERSION = tonumber(("$Revision: 1399 $"):match("%d+")) or 0

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local Debug = LibStub("LibDebug-1.0")

local CallbackHandler = LibStub("CallbackHandler-1.0")
if not lib.callbacks then
  lib.callbacks = CallbackHandler:New(lib)
end
local callbacks = lib.callbacks

if lib.frame then
  lib.frame:UnregisterAllEvents()
  lib.frame:SetScript("OnEvent", nil)
  lib.frame:SetScript("OnUpdate", nil)
else
  lib.frame = CreateFrame("Frame", MAJOR_VERSION .. "_Frame")
end
local frame = lib.frame
frame:Show()
frame:SetScript("OnEvent",
                function(self, event, ...)
                  lib[event](lib, ...)
                end)

local SendAddonMessage = _G.SendAddonMessage
if ChatThrottleLib then
  SendAddonMessage = function(...)
                       ChatThrottleLib:SendAddonMessage(
                         "ALERT", MAJOR_VERSION, ...)
                     end
end

local SetState

-- state of the cache: UNINITIALIZED, STALE,
-- STALE_WAITING_FOR_ROSTER_UPDATE, CURRENT, FLUSHING, REMOTE_FLUSHING
--
-- A complete graph of state changes is found in LibGuildStorage-1.0.dot
local state = "STALE_WAITING_FOR_ROSTER_UPDATE"
local initialized
local index
-- name -> {note=, seen=, class=}
local cache = {}
-- pending notes to write out
local pending_note = {}
local guild_info = ""

function lib:GetNote(name)
  local e = cache[name]
  if e then return e.note end
end

function lib:SetNote(name, note)
  local e = cache[name]
  if e then
    if pending_note[name] then
      DEFAULT_CHAT_FRAME:AddMessage(
        string.format("Ignoring attempt to set note before flushing pending "..
                      "note for %s! "..
                      "current=[%s] pending=[%s] new[%s]. "..
                      "Please report this bug along with the actions that "..
                      "lead to this on http://epgp.googlecode.com",
                    tostring(name),
                    tostring(e.note),
                    tostring(pending_note[name]),
                    tostring(note)))
    else
      pending_note[name] = note
      SetState("FLUSHING")
    end
    return e.note
  end
end

function lib:GetClass(name)
  local e = cache[name]
  if e then return e.class end
end

function lib:GetRank(name)
  local e = cache[name]
  if e then return e.rank end
end

function lib:GetGuildInfo()
  return guild_info
end

function lib:IsCurrentState()
  return state == "CURRENT"
end

-- This is kept for historical reasons. See:
-- http://code.google.com/p/epgp/issues/detail?id=350.
function lib:Snapshot(t)
  assert(type(t) == "table")
  t.guild_info = guild_info:match("%-EPGP%-\n(.*)\n\%-EPGP%-")
  t.roster_info = {}
  for name,info in pairs(cache) do
    table.insert(t.roster_info, {name, info.class, info.note})
  end
end

--
-- Event handlers
--
frame:RegisterEvent("PLAYER_GUILD_UPDATE")
frame:RegisterEvent("GUILD_ROSTER_UPDATE")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

function lib:CHAT_MSG_ADDON(prefix, msg, type, sender)
  Debug("CHAT_MSG_ADDON: %s, %s, %s, %s", prefix, msg, type, sender)
  if prefix ~= MAJOR_VERSION or sender == UnitName("player") then return end
  if msg == "CHANGES_PENDING" then
    SetState("REMOTE_FLUSHING")
  elseif msg == "CHANGES_FLUSHED" then
    SetState("STALE_WAITING_FOR_ROSTER_UPDATE")
  end
end

function lib:PLAYER_GUILD_UPDATE()
  if IsInGuild() then
    frame:Show()
  else
    frame:Hide()
  end
  SetState("STALE_WAITING_FOR_ROSTER_UPDATE")
end

function lib:PLAYER_ENTERING_WORLD()
  lib:PLAYER_GUILD_UPDATE()
end

function lib:GUILD_ROSTER_UPDATE(loc)
  Debug("GUILD_ROSTER_UPDATE(%s)", tostring(loc))
  if loc then
    SetState("FLUSHING") -- SetState("STALE_WAITING_FOR_ROSTER_UPDATE")
  else
    if state ~= "UNINITIALIZED" then
      SetState("STALE")
      index = nil
    end
  end
end

--
-- Locally defined functions
--

local valid_transitions = {
  UNINITIALIZED = {
    CURRENT = true,
  },
  STALE = {
    CURRENT = true,
    REMOTE_FLUSHING = true,
    STALE_WAITING_FOR_ROSTER_UPDATE = true,
  },
  STALE_WAITING_FOR_ROSTER_UPDATE = {
    STALE = true,
    FLUSHING = true,
  },
  CURRENT = {
    FLUSHING = true,
    REMOTE_FLUSHING = true,
    STALE = true,
  },
  FLUSHING = {
    STALE_WAITING_FOR_ROSTER_UPDATE = true,
  },
  REMOTE_FLUSHING = {
    STALE_WAITING_FOR_ROSTER_UPDATE = true,
  },
}

function SetState(new_state)
  if state == new_state then return end

  if not valid_transitions[state][new_state] then
    Debug("Ignoring state change %s -> %s", state, new_state)
    return
  else
    Debug("StateChanged: %s -> %s", state, new_state)
    state = new_state
    if new_state == FLUSHING then
      SendAddonMessage("CHANGES_PENDING", "GUILD")
    end
    callbacks:Fire("StateChanged")
  end
end

local function Frame_OnUpdate(self, elapsed)
  debugprofilestart()
  if state == "CURRENT" then
    return
  end

  if state == "STALE_WAITING_FOR_ROSTER_UPDATE" then
    GuildRoster()
    return
  end

  -- Sometimes GetNumGuildMembers returns 0. In this case return now,
  -- so that we call it again and get a proper value.
  if GetNumGuildMembers(true) == 0 then return end

  if not index or index >= GetNumGuildMembers(true) then
    index = 1
  end

  -- Check guild info for changes.
  if index == 1 then
    local new_guild_info = GetGuildInfoText() or ""
    if new_guild_info ~= guild_info then
      guild_info = new_guild_info
      callbacks:Fire("GuildInfoChanged", guild_info)
    end
  end

  -- Read up to 100 members at a time.
  local last_index = math.min(index + 100, GetNumGuildMembers(true))
  Debug("Processing from %d to %d members", index, last_index)

  for i = index, last_index do
    local name, rank, _, _, _, _, _, note, _, _, class = GetGuildRosterInfo(i)
    if name then
      local entry = cache[name]
      local pending = pending_note[name]
      if not entry then
        entry = {}
        cache[name] = entry
      end

      entry.rank = rank
      entry.class = class

      -- Mark this note as seen
      entry.seen = true
      if entry.note ~= note then
        entry.note = note
        -- We want to delay all GuildNoteChanged calls until we have a
        -- complete view of the guild, otherwise alts might not be
        -- rejected (we read alts note before we even know about the
        -- main).
        if initialized then
          callbacks:Fire("GuildNoteChanged", name, note)
        end
        if pending then
          callbacks:Fire("InconsistentNote", name, note, entry.note, pending)
        end
      end

      if pending then
        GuildRosterSetOfficerNote(i, pending)
        pending_note[name] = nil
      end
    end
  end
  index = last_index
  if index >= GetNumGuildMembers(true) then
    -- We are done, we need to clear the seen marks and delete the
    -- unmarked entries. We also fire events for removed members now.
    for name, t in pairs(cache) do
      if t.seen then
        t.seen = nil
      else
        cache[name] = nil
        callbacks:Fire("GuildNoteDeleted", name)
      end
    end

    if not initialized then
      -- Now make all GuildNoteChanged calls because we have a full
      -- state.
      for name, t in pairs(cache) do
        callbacks:Fire("GuildNoteChanged", name, t.note)
      end
      initialized = true
      callbacks:Fire("StateChanged")
    end
    if state == "STALE" then
      SetState("CURRENT")
    elseif state == "FLUSHING" then
      if not next(pending_note) then
        SetState("STALE_WAITING_FOR_ROSTER_UPDATE")
        SendAddonMessage("CHANGES_FLUSHED", "GUILD")
      end
    end
  end
  Debug(tostring(debugprofilestop()).."ms for LibGuildStorage:OnUpdate")
end

frame:SetScript("OnUpdate", Frame_OnUpdate)
GuildRoster()
