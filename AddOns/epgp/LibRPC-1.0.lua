--[[

  LibRPC (remote procedure call library) by mackatack@gmail.com
  This library allows addons and modules to register functions that are available to be called remotely.
  Current implementation doesn't return values to the remote host, the remote host should just call a callback
  function on the requesting host if it needs to return values.

  See the UnitTest() function for more info how to use this library.

]]--

local MAJOR_VERSION = "LibRPC-1.0"
local MINOR_VERSION = tonumber(("$Revision: 1023 $"):match("%d+")) or 0

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local AceComm = LibStub("AceComm-3.0")
local Serializer = LibStub("AceSerializer-3.0")

-- We use LibDebug-1.0 for debugging, if it's not present, don't debug :P
local Debug = LibStub("LibDebug-1.0", true)
local IsDebugging
if not Debug then
  Debug = function() end
  IsDebugging = function() end
else
  IsDebugging = function() return Debug:IsDebugging() end
end

lib.embeds = lib.embeds or {}
local embeds = lib.embeds

-- Quick function for debugging, concats a table to a string value.
local function tableconcatstr(tbl, separator, tStart, tEnd)
  assert(type(tbl) == 'table', 'tbl: Table expected')
  separator = separator or ', '
  tStart = tStart or 1
  tEnd = tEnd or #tbl
  strTbl = {}
  for i=tStart, tEnd do
    if type(tbl[i]) == 'string' then
      tinsert(strTbl, format('"%s"', tbl[i]))
    else
      tinsert(strTbl, tostring(tbl[i]))
    end
  end
  return table.concat(strTbl, separator)
end


--- Changing the key will make sure you won't get interference from other addons using the library.
--  @param key string value, can be anything you like, though the remote host
--         needs to use a identical key for communications, default is "RPCCHANNEL"
function lib:SetRPCKey(key)
  AceComm.UnregisterComm(self, "OnRawRPCReceived")
  AceComm.RegisterComm(self, key, "OnRawRPCReceived")
  self._rpckey = key
end

--- Register a function to be available for RPC calls
--  @param methodName string of the function name in the calling object.
--  @param func function pointer or nil and it will just call function methodName on the object
--[[
    Example:
      RegisterRPC("Print", print)                   -- registers the public method Print and when called calls _G.print
      RegisterRPC("Print", "DebugPrint")            -- registers the public method Print and when called calls self:DebugPrint
      RegisterRPC("Print")                          -- registers the public method Print and when called calls self:Print
]]--
function lib:RegisterRPC(methodName, func)
  self._rpcMethods[methodName] = func or true
end

--- Unregister a function to be available for RPC calls
--  @param methodName string of the function name in the calling object.
function lib:UnregisterRPC(methodName)
  self._rpcMethods[methodName] = nil
end

--- Unregister a function to be available for RPC calls
--  @param methodName string of the function name in the calling object.
function lib:UnregisterAllRPC()
  if type(self._rpcMethods) == 'table' then
    wipe(self._rpcMethods)
  else
    self._rpcMethods = {}
  end
end

--- Calls a remote function on target, this does not return any values.
--  @param distribution: PARTY, RAID, BATTLEGROUND, GUILD, or WHISPER
--  @param target: player name if distribution == WHISPER
--  @param ... list of arguments to pass to the remote function.
function lib:CallRPC(distribution, target, methodName, ...)
  return self:CallPrioritizedRPC(nil, distribution, target, methodName, ...)
end

--- Calls a remote function on target with a specific priority, this does not return any values.
--  @param priority either BULK, NORMAL or ALERT whereas BULK has the lowest priority and ALERT the highest.
--  @param distribution: PARTY, RAID, BATTLEGROUND, GUILD, or WHISPER
--  @param target: player name if distribution == WHISPER
--  @param methodName name of the remote function to call
--  @param ... list of arguments to pass to the remote function.
function lib:CallPrioritizedRPC(priority, distribution, target, methodName, ...)
  assert(distribution, "Could not send command, no distribution specified")
  assert(methodName, "Could not send command, no methodName specified")
  local message = Serializer:Serialize(methodName, ...)

  if IsDebugging() then
    Debug("Tx: Calling %s(%s) via %s/%s/%s (self=%s)",
              tostring(methodName),
              tostring(tableconcatstr({...})),              
              tostring(self._rpckey),
              tostring(distribution),
              tostring(target),
              tostring(self))
  end

  return AceComm:SendCommMessage(
    self._rpckey, message, distribution, target, priority)
end

--- We've received a message on the rpc channel.
--  try to deserialize it.
function lib:OnRawRPCReceived(prefix, message, distribution, sender)
  -- Just stop if the rpckey doesn't match
  if self._rpckey ~= prefix then
    return Debug("RPC key doesn't match (%s~=%s) for message %s by %s/%s",
               tostring(self._rpckey),
               tostring(prefix),
               tostring(message),
               tostring(distribution),
               tostring(sender))
  end

  -- deserialize the message
  local methodArgs = {Serializer:Deserialize(message)}

  -- deserialization successful?
  local deserializeSucceeded = methodArgs[1]
  if not deserializeSucceeded then
    return Debug('Deserialize failed in RPC: %s/%s/%s: %s',
               tostring(prefix),
               tostring(distribution),
               tostring(sender),
               tostring(message))
  end

  -- extract the methodName and see if it's registered.
  local methodName = methodArgs[2]
  if not self._rpcMethods[methodName] then
    if IsDebugging() then
      Debug("Rx ERROR: %s called unregistered %s(%s) via %s/%s (self=%s)",
              tostring(sender),
              tostring(methodName),
              tostring(tableconcatstr(methodArgs, ', ', 3)),
              tostring(distribution),
              tostring(prefix),
              tostring(self))
    end
    return
  end

  -- This allows the user to register the callbacks in various different ways, see RegisterRPC() for more info
  local func = nil
  local includeSelf = true
  if type(self._rpcMethods[methodName]) == 'function' then
    -- RegisterRPC("methodName", print)
    includeSelf = false
    func = self._rpcMethods[methodName]
  elseif type(self._rpcMethods[methodName]) == 'string' and type(self[self._rpcMethods[methodName]]) == 'function' then
    -- RegisterRPC("methodName", "functionName")
    func = self[self._rpcMethods[methodName]]
  elseif type(self[methodName]) == 'function' then
    -- RegisterRPC("methodName")
    func = self[methodName]
  end

  -- Check whether the function exists
  if not func then
    if IsDebugging() then
      Debug("Rx ERROR: %s called non existent %s(%s) via %s/%s (self=%s)",
              tostring(sender),
              tostring(methodName),
              tostring(tableconcatstr(methodArgs, ', ', 3)),
              tostring(distribution),
              tostring(prefix),
              tostring(self))
    end
    return
  end

  -- set some useful variables and call the function
  self.rpcDistribution = distribution
  self.rpcSender = sender

  if IsDebugging() then
    Debug("Rx: %s called %s(%s) via %s/%s (self=%s)",
              tostring(sender),
              tostring(methodName),
              tostring(tableconcatstr(methodArgs, ', ', 3)),
              tostring(distribution),
              tostring(prefix),
              tostring(self))
  end

  if includeSelf then
    pcall(func, self, unpack(methodArgs, 3, #methodArgs))
  else
    pcall(func, unpack(methodArgs, 3, #methodArgs))
  end

  -- unset the rpc information
  self.rpcDistribution = nil
  self.rpcSender = nil
end

----------------------------------------
-- Base library stuff
----------------------------------------

local mixins = {
  "SetRPCKey",
  "RegisterRPC",
  "UnregisterRPC",
  "UnregisterAllRPC",
  "CallRPC",
  "CallPrioritizedRPC",
  "OnRawRPCReceived"
}

function lib:Embed(target)
  for k, v in pairs(mixins) do
    target[v] = self[v]
  end
  target._rpckey = target._rpckey or (target.GetName and target:GetName() or "RPCCHANNEL")
  target._rpcMethods = target._rpcMethods or {}
  AceComm.RegisterComm(target, target._rpckey, "OnRawRPCReceived")

  embeds[target] = true
  return target
end

function lib:OnEmbedDisable(target)
  target:UnregisterComm("OnRawRPCReceived")
  target:UnregisterAllRPC()
end

-- Update embeds
for target, v in pairs(embeds) do
  lib:Embed(target)
end

----------------------------------------
-- Unit tests
----------------------------------------

--- Unit test, this presumes EPGP is enabled.
function lib:UnitTest()
  local lib = LibStub("LibRPC-1.0")
  lib:Embed(EPGP)                     -- normally this would just be EPGP = LibStub("AceAddon-3.0"):NewAddon("EPGP", "LibRPC-1.0")

  EPGP:SetRPCKey("EPGP_RPC_CHANNEL")  -- set a prefix/channel for the communications

  EPGP:RegisterRPC("Print")           -- Register EPGP:Print to be public method "Print"
  EPGP:RegisterRPC("print", print)    -- Register _G.print to be public method "print"

  -- Call the registered functions by sending it to the RAID channel
  EPGP:CallRPC('GUILD', nil, 'Print', 123, nil, "test", "Yeah!!!! this is a remote call! :P")
  EPGP:CallRPC('GUILD', nil, 'print', "this is _G.print speaking!")

  -- Just as easy to send this command to one specific someone:
  --EPGP:CallRPC(UnitName('player'), 'Print', 123, nil, "test", "Yeah!!!! this is a remote call! :P")
end

-- /script LibStub("LibRPC-1.0"):UnitTest()