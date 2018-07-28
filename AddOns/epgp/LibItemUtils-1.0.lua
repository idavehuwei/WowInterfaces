-- This library provides an interface to query if an item can be
-- use by a certain class. The API is as follows:
--
-- CanClassUse(class, itemType): class is one of **** and itemType a localized itemType (http://www.wowwiki.com/ItemType).
--

local MAJOR_VERSION = "LibItemUtils-1.0"
local MINOR_VERSION = tonumber(("$Revision: $"):match("%d+")) or 0

local lib, oldMinor = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local Debug = LibStub("LibDebug-1.0")

-- Inventory types are localized on each client. For this we need
-- LibBabble-Inventory to unlocalize the strings.
local LBIR = LibStub("LibBabble-Inventory-3.0"):GetReverseLookupTable()
-- Class restrictions are localized on each client. For this we need
-- LibBabble-Class to unlocalize the strings.
local LBCR = LibStub("LibBabble-Class-3.0"):GetReverseLookupTable()
local deformat = LibStub("LibDeformat-3.0")

-- Make a frame for our repeating calls to GetItemInfo.
lib.frame = lib.frame or CreateFrame("Frame", MAJOR_VERSION .. "_Frame")
local frame = lib.frame
frame:Hide()
frame:SetScript('OnUpdate', nil)
frame:UnregisterAllEvents()

-- Use the GameTooltip or create a new one and initialize it
-- Used to extract Class limitations for an item and binding type.
lib.tooltip = lib.tooltip or CreateFrame("GameTooltip",
                                         MAJOR_VERSION .. "_Tooltip",
                                         frame, "GameTooltipTemplate")
local tooltip = lib.tooltip
local bindingFrame = getglobal(tooltip:GetName().."TextLeft2")
local restrictedClassFrameNameFormat = tooltip:GetName().."TextLeft%d"
tooltip:Hide();

-------------
-- OTHER
-------------

--- Convert an itemlink to itemID
--  @param itemlink of which you want the itemID from
--  @returns number or nils
function lib:ItemlinkToID(itemlink)
  if not itemlink then return nil end
  local itemID = strmatch(itemlink, 'item:(%d+)')
  if not itemID then return end
  return tonumber(itemID)
end

-------------
-- ITEM USAGE
-------------

--[[

All item types we care about:

    Cloth = true,
    Leather = true,
    Mail = true,
    Plate = true,
    Shields = true,

    Bows = true,
    Crossbows = true,
    Daggers = true,
    ["Fist Weapons"] = true,
    Guns = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Maces"] = true,
    ["One-Handed Swords"] = true,
    Polearms = true,
    Staves = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
    Wands = true,
--]]

local disallowed = {
  DEATHKNIGHT = {
    Shields = true,

    Bows = true,
    Crossbows = true,
    Daggers = true,
    ["Fist Weapons"] = true,
    Guns = true,
    Polearms = true,
    Staves = true,

    Idols = true,
    Librams = true,
    Thrown = true,
    Totems = true,
    Wands = true,
  },
  DRUID = {
    Mail = true,
    Plate = true,
    Shields = true,

    Bows = true,
    Crossbows = true,
    Guns = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Swords"] = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Swords"] = true,

    Librams = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
    Wands = true,
  },
  HUNTER = {
    Plate = true,
    Shields = true,

    ["One-Handed Maces"] = true,
    ["Two-Handed Maces"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Totems = true,
    Wands = true,
  },
  MAGE = {
    Leather = true,
    Mail = true,
    Plate = true,
    Shields = true,

    Bows = true,
    Crossbows = true,
    ["Fist Weapons"] = true,
    Guns = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Maces"] = true,
    Polearms = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
  },
  PALADIN = {
    Bows = true,
    Crossbows = true,
    ["Fist Weapons"] = true,
    Guns = true,
    Staves = true,

    Idols = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
    Wands = true,
  },
  PRIEST = {
    Leather = true,
    Mail = true,
    Plate = true,
    Shields = true,

    Bows = true,
    Crossbows = true,
    ["Fist Weapons"] = true,
    Guns = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Swords"] = true,
    Polearms = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
  },
  ROGUE = {
    Mail = true,
    Plate = true,
    Shields = true,

    Polearms = true,
    Staves = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Totems = true,
    Wands = true,
  },
  SHAMAN = {
    Plate = true,

    Bows = true,
    Crossbows = true,
    Guns = true,
    ["One-Handed Swords"] = true,
    Polearms = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Thrown = true,
    Wands = true,
  },
  WARLOCK = {
    Leather = true,
    Mail = true,
    Plate = true,
    Shields = true,

    Bows = true,
    Crossbows = true,
    ["Fist Weapons"] = true,
    Guns = true,
    ["One-Handed Axes"] = true,
    ["One-Handed Maces"] = true,
    Polearms = true,
    ["Two-Handed Axes"] = true,
    ["Two-Handed Maces"] = true,
    ["Two-Handed Swords"] = true,

    Idols = true,
    Librams = true,
    Sigils = true,
    Thrown = true,
    Totems = true,
  },
  WARRIOR = {
    Idols = true,
    Librams = true,
    Sigils = true,
    Totems = true,
    Wands = true,
  },
}

function lib:ClassCanUse(class, item)
  local subType = select(7, GetItemInfo(item))
  if not subType then
    return true
  end

  -- Check if this is a restricted class token.
  -- TODO(alkis): Possibly cache this check if performance is an issue.
  local link = select(2, GetItemInfo(item))
  tooltip:SetOwner(UIParent, "ANCHOR_NONE")
  tooltip:SetHyperlink(link)
  -- lets see if we can find a 'Classes: Mage, Druid' string on the itemtooltip
  -- Only scanning line 2 is not enough, we need to scan all the lines
  for lineID = 1, tooltip:NumLines(), 1 do
    local line = _G[restrictedClassFrameNameFormat:format(lineID)]
    if line then
      local text = line:GetText()
      if text then
        local classList = deformat(text, ITEM_CLASSES_ALLOWED)
        if classList then
          tooltip:Hide()
          for _, restrictedClass in pairs({strsplit(',', classList)}) do
            restrictedClass = strupper(LBCR[strtrim(restrictedClass)])
            if class == restrictedClass then
              return true
            end
          end
          return false
        end
      end
    end
  end
  tooltip:Hide()

  -- Check if players can equip this item.
  subType = LBIR[subType]
  if disallowed[class][subType] then
    return false
  end

  return true
end

function lib:ClassCannotUse(class, item)
  return not self:ClassCanUse(class, item)
end

local function NewTableOrClear(t)
  if not t then return {} end
  wipe(t)
  return t
end

function lib:ClassesThatCanUse(item, t)
  t = NewTableOrClear(t)
  for class, _ in pairs(RAID_CLASS_COLORS) do
    if self:ClassCanUse(class, item) then
      table.insert(t, class)
    end
  end
  return t
end

function lib:ClassesThatCannotUse(item, t)
  t = NewTableOrClear(t)
  for class, _ in pairs(RAID_CLASS_COLORS) do
    if self:ClassCannotUse(class, item) then
      table.insert(t, class)
    end
  end
  return t
end

-----------------
-- ITEMS FOR SLOT
-----------------

local slot_table = {
  INVTYPE_HEAD = {"HeadSlot", nil},
  INVTYPE_NECK = {"NeckSlot", nil},
  INVTYPE_SHOULDER = {"ShoulderSlot", nil},
  INVTYPE_CLOAK = {"BackSlot", nil},
  INVTYPE_CHEST = {"ChestSlot", nil},
  INVTYPE_WRIST	= {"WristSlot", nil},
  INVTYPE_HAND = {"HandsSlot", nil},
  INVTYPE_WAIST = {"WaistSlot", nil},
  INVTYPE_LEGS = {"LegsSlot", nil},
  INVTYPE_FEET = {"FeetSlot", nil},
  INVTYPE_SHIELD = {"SecondaryHandSlot", nil},
  INVTYPE_ROBE = {"ChestSlot", nil},
  INVTYPE_2HWEAPON = {"MainHandSlot", "SecondaryHandSlot"},
  INVTYPE_WEAPONMAINHAND = {"MainHandSlot", nil},
  INVTYPE_WEAPONOFFHAND	= {"SecondaryHandSlot", "MainHandSlot"},
  INVTYPE_WEAPON = {"MainHandSlot","SecondaryHandSlot"},
  INVTYPE_THROWN = {"RangedSlot", nil},
  INVTYPE_RANGED = {"RangedSlot", nil},
  INVTYPE_RANGEDRIGHT = {"RangedSlot", nil},
  INVTYPE_FINGER = {"Finger0Slot", "Finger1Slot"},
  INVTYPE_HOLDABLE = {"SecondaryHandSlot", "MainHandSlot"},
  INVTYPE_TRINKET = {"Trinket0Slot", "Trinket1Slot"},
  -- Hack for Tier 9 25M heroic tokens.
  -- TODO(alkis): Fix this to return more than 2 slots because these tokens
  -- can go in any of 5 slots.
  INVTYPE_CUSTOM_MULTISLOT_TIER = {"HeadSlot", "ChestSlot"}
}

function lib:ItemsForSlot(invtype, unit)
  local t = slot_table[invtype]
  if not t then return end

  local first, second = unpack(t)
  -- Translate to slot ids
  first = first and GetInventorySlotInfo(first)
  second = second and GetInventorySlotInfo(second)
  -- Translate to item links
  first = first and GetInventoryItemLink(unit or "player", first)
  second = second and GetInventoryItemLink(unit or "player", second)

  return first, second
end

----------------
-- ITEM BINDINGS
----------------

-- binding is one of: ITEM_BIND_ON_PICKUP, ITEM_BIND_ON_EQUIP,
-- ITEM_BIND_ON_USE, ITEM_BIND_TO_ACCOUNT
function lib:IsBinding(binding, item)
  local link = select(2, GetItemInfo(item))
  tooltip:SetOwner(UIParent, "ANCHOR_NONE")
  tooltip:SetHyperlink(link)

  if tooltip:NumLines() > 1 then
    local text = bindingFrame:GetText()
    if text then
      return text == binding
    end
  end
  tooltip:Hide()
end

function lib:IsBoP(item)
  return lib:IsBinding(ITEM_BIND_ON_PICKUP, item)
end

function lib:IsBoE(item)
  return lib:IsBinding(ITEM_BIND_ON_EQUIP, item)
end

--------------
-- ITEMCACHING
--------------

-- Reuse or create a table to store the lookup queue in
lib.itemQueue = lib.itemQueue or {}
local itemQueue = lib.itemQueue

--- Try to lookup the items on the itemQueue
--
--  This will lookup all the items on the itemQueue, and if found it
--  will call the callbacks and remove them. If they are not found it
--  will retry once per second for a max of 30 seconds after the last
--  callback was called, and after that it will give up.
local timeout = 0
local ticker = 0
local function LookupItems(frame, elapsed)
  timeout = timeout + elapsed
  ticker = ticker + elapsed
  if timeout > 30 then
    Debug("Giving up, clearing itemQueue")
    for item, _ in pairs(itemQueue) do
      Debug("\t%s", item)
    end
    wipe(itemQueue)
    ticker = 0
    frame:Hide()
    return
  end

  if ticker > 1 then
    ticker = 0
    -- Go through all the items and check if they have data in the
    -- client cache. If the do call the saved functions and args.
    Debug("Checking for new items in the cache")
    for itemLink, itemData in pairs(itemQueue) do
      if GetItemInfo(itemLink) then
        -- If we found an item, reset the timeout.
        timeout = 0
        itemQueue[itemLink] = nil
        for callback, args in pairs(itemData) do
          pcall(callback, unpack(args))
        end
      else
        -- Otherwise set the hyperlink on a tooltip to make the cache
        -- fetch it.
        tooltip:SetHyperlink(itemLink)
        tooltip:Show()
        tooltip:Hide()
      end
    end
  end

  -- If we have no more items in the itemQueue to lookup, reset the
  -- timeout and hide the frame.
  if not next(itemQueue) then
    timeout = 0
    ticker = 0
    frame:Hide()
  end
end
frame:SetScript("OnUpdate", LookupItems)

--- Try to cache an item and call the callback function when the item
--- is available
--
--  @param itemLink any itemLink in Hitem:1234 form
--  @param callback function pointer to the callback function that
--  should be called when the item is available
--  @param ... a list of variables you would like to pass to the
--  callback function.
--  @return boolean true if the item has been registered successfully
function lib:CacheItem(itemLink, callback, ...)
  -- Reset the timeout for the itemQueue
  timeout = 0

  if type(itemLink) == 'number' then
    itemLink = format('item:%d', itemLink)
  end

  if type(callback) ~= "function" then
    error("Usage: CacheItem(itemLink, callback, [...]): 'callback' - function.", 2)
  end

  if not itemLink or not strmatch(itemLink, 'item:(%d+)') then
    error("Usage: CacheItem(itemLink, callback, [...]): 'itemLink' - not a valid itemLink (item:12345).", 2)
  end

  itemQueue[itemLink] = itemQueue[itemLink] or {}
  itemQueue[itemLink][callback] = {...}

  -- show the frame to start looking up items
  frame:Show()

  return true
end

-------------
-- UNIT TESTS
-------------

local items = {
  40558, -- Cloth
  40539, -- Leather
  40543, -- Mail
  40592, -- Plate

  40405, -- Cloak
  40192, -- Off-Hand
  40401, -- Shield

  40387, -- Neck
  40399, -- Ring
  40532, -- Trinket

  40342, -- Idol
  40268, -- Libram
  40322, -- Totem
  40207, -- Sigil

  40386, -- Dagger
  40383, -- Fist Weapon
  40402, -- One-Handed Axe
  40395, -- One-Handed Mace
  40396, -- One-Handed Sword

  40497, -- Polearm
  40388, -- Stave
  40384, -- Two-Handed Axe
  40406, -- Two-Handed Mace
  40343, -- Two-Handed Sword

  40265, -- Bow
  40346, -- Crossbow
  40385, -- Gun
  40190, -- Thrown
  40245, -- Wand

  40626, -- Protector token

  1234567890, -- Non existent item
}

function lib:DebugTest()
  for _, itemID in ipairs(items) do
    self:CacheItem(itemID, self.DebugTestItem, self, itemID)
  end

  for slot, _ in pairs(slot_table) do
    local first, second = self:ItemsForSlot(slot)
    if first then
      if second then
        Debug("%s: %s or %s", slot, tostring(first), tostring(second))
      else
        Debug("%s: %s", slot, tostring(first))
      end
    end
  end
end

local t = {}
function lib:DebugTestItem(itemID)
  local link = select(2, GetItemInfo(itemID))

  t = self:ClassesThatCanUse(itemID, t)
  Debug("Classes that can use %s: %s", link, table.concat(t, ' '))

  t = self:ClassesThatCannotUse(itemID, t)
  Debug("Classes that cannot use %s: %s", link, table.concat(t, ' '))

  Debug("IsBoP: %s, IsBoE: %s", tostring(self:IsBoP(itemID)), tostring(self:IsBoE(itemID)))
end

-- /script LibStub("LibItemUtils-1.0"):DebugTest()
-- /script LibStub("LibItemUtils-1.0"):CacheItem(32386, function() end)
