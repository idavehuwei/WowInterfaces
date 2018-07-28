local mod = EPGP:NewModule("loot", "AceEvent-3.0")

local L = LibStub("AceLocale-3.0"):GetLocale("EPGP")
local LLN = LibStub("LibLootNotify-1.0")
local Coroutine = LibStub("LibCoroutine-1.0")

local ignored_items = {
  [20725] = true, -- Nexus Crystal
  [22450] = true, -- Void Crystal
  [34057] = true, -- Abyss Crystal
  [29434] = true, -- Badge of Justice
  [40752] = true, -- Emblem of Heroism
  [40753] = true, -- Emblem of Valor
  [45624] = true, -- Emblem of Conquest
  [47241] = true, -- Emblem of Triumph
  [49426] = true, -- Emblem of Frost
  [30311] = true, -- Warp Slicer
  [30312] = true, -- Infinity Blade
  [30313] = true, -- Staff of Disintegration
  [30314] = true, -- Phaseshift Bulwark
  [30316] = true, -- Devastation
  [30317] = true, -- Cosmic Infuser
  [30318] = true, -- Netherstrand Longbow
  [30319] = true, -- Nether Spikes
  [30320] = true, -- Bundle of Nether Spikes
}

local in_combat = false

local function IsRLorML()
  if UnitInRaid("player") then
    local loot_method, ml_party_id, ml_raid_id = GetLootMethod()
    if loot_method == "master" and ml_party_id == 0 then return true end
    if loot_method ~= "master" and IsRaidLeader() then return true end
  end
  return false
end

local function ShowPopup(player, item, quantity)
  while in_combat or StaticPopup_Visible("EPGP_CONFIRM_GP_CREDIT") do
    Coroutine:Sleep(0.1)
  end

  local itemName, itemLink, itemRarity, _, _, _, _, _, _, itemTexture = GetItemInfo(item)
  local r, g, b = GetItemQualityColor(itemRarity)

  if EPGP:GetEPGP(player) then
    local dialog = StaticPopup_Show("EPGP_CONFIRM_GP_CREDIT", player, "", {
                                      texture = itemTexture,
                                      name = itemName,
                                      color = {r, g, b, 1},
                                      link = itemLink
                                    })
    if dialog then
      dialog.name = player
    end
  end
end

local function LootReceived(event_name, player, itemLink, quantity)
  if IsRLorML() and CanEditOfficerNote() then
    local itemID = tonumber(itemLink:match("item:(%d+)") or 0)
    if not itemID then return end

    local itemRarity = select(3, GetItemInfo(itemID))
    if itemRarity < mod.db.profile.threshold then return end

    if ignored_items[itemID] then return end

    Coroutine:RunAsync(ShowPopup, player, itemLink, quantity)
  end
end

function mod:PLAYER_REGEN_DISABLED()
  in_combat = true
end

function mod:PLAYER_REGEN_ENABLED()
  in_combat = false
end

mod.dbDefaults = {
  profile = {
    enabled = true,
    threshold = 4,  -- Epic quality items
  }
}

mod.optionsName = L["Loot"]
mod.optionsDesc = L["Automatic loot tracking"]
mod.optionsArgs = {
  help = {
    order = 1,
    type = "description",
    name = L["Automatic loot tracking by means of a popup to assign GP to the toon that received loot. This option only has effect if you are in a raid and you are either the Raid Leader or the Master Looter."]
  },
  threshold = {
    order = 10,
    type = "select",
    name = L["Loot tracking threshold"],
    desc = L["Sets loot tracking threshold, to disable the popup on loot below this threshold quality."],
    values = {
      [2] = ITEM_QUALITY2_DESC,
      [3] = ITEM_QUALITY3_DESC,
      [4] = ITEM_QUALITY4_DESC,
      [5] = ITEM_QUALITY5_DESC,
    },
  },
}

function mod:OnEnable()
  self:RegisterEvent("PLAYER_REGEN_DISABLED")
  self:RegisterEvent("PLAYER_REGEN_ENABLED")
  LLN.RegisterCallback(self, "LootReceived", LootReceived)
end

function mod:OnDisable()
  LLN.UnregisterAllCallbacks(self)
end
