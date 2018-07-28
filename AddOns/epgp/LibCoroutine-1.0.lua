-- A library to make usage of coroutines in wow easier.

local MAJOR_VERSION = "LibCoroutine-1.0"
local MINOR_VERSION = tonumber(("$Revision: 1023 $"):match("%d+")) or 0

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local AT = LibStub("AceTimer-3.0")
local AE = LibStub("AceEvent-3.0")

local function running_co_checked()
  local co = coroutine.running()
  assert(co, "Sleep should be called inside a coroutine not the main thread")
  return co
end

function lib:Create(fn)
  return coroutine.create(fn)
end

function lib:Yield(...)
  return self:Sleep(0, ...)
end

local function runner(args)
  local ok, err = coroutine.resume(args[1], unpack(args, 2))
  if not ok then
    error(err)
  end
end

function lib:Sleep(t, ...)
  local co = running_co_checked()
  AT:ScheduleTimer(runner, t, {co, ...})
  return coroutine.yield(co)
end

local tsubset
local function deepequal(a, b)
  if type(a) == "table" and type(b) == "table" then
    return tsubset(a, b) and tsubset(b, a)
  else
    return a == b
  end
end

local function tsubset(t1, t2)
  for k,v in pairs(t2) do
    if not deepequal(t1[k], v) then
      return false
    end
  end
  return true
end

local function event_checker(event, args, ...)
  local co = args[1]
  if deepequal({unpack(args, 3)}, {...}) then
    -- This will not work before
    -- http://www.wowace.com/addons/callbackhandler/tickets/5-allow-coroutines-to-be-set-as-self-when-registering/
    -- is fixed.
    AE.UnregisterEvent(co, event)
    runner(args)
  else
    return coroutine.yield(co)
  end
end

function lib:WaitForEvent(event, ...)
  local co = running_co_checked()
  -- This will not work before
  -- http://www.wowace.com/addons/callbackhandler/tickets/5-allow-coroutines-to-be-set-as-self-when-registering/
  -- is fixed.
  AE.RegisterEvent(co, event, event_checker, {co, event, ...})
end

function lib:RunAsync(fn, ...)
  local co = self:Create(fn)
  AT:ScheduleTimer(runner, 0, {co, ...})
end
