if not InspectEquip then return end

local IE = InspectEquip
local L = LibStub("AceLocale-3.0"):GetLocale("InspectEquip")

function IE:AddToTooltip(tip, itemLink)
  if InspectEquipConfig.tooltips == false then return end

  local sources = IE:FindItem(itemLink)
  if sources then
    for _, entry in pairs(sources) do
      --local src, subsrc, lootTable, boss, cost, setname = unpack(entry)
      local src, subsrc, lootTable, boss, cost, setname = entry[1], entry[2], entry[3], entry[4], entry[5], entry[6]
      local str = src
      if subsrc then str = str .. ": " .. subsrc end
      if lootTable then str = str .. " (" .. lootTable .. ")" end
      if boss then str = str .. ": " .. boss end
      if cost then str = str .. " (" .. cost .. ")" end
      if setname then str = str .. " (" .. setname .. ")" end
      tip:AddDoubleLine(L["Source"] .. ":", str)
    end
    tip:Show()
  end
end


--[[
  Tooltip hooking code:
    From SellFish + Ludwig_SellValue + ColaLight + ItemPrice + Valuation
--]]

local function IsBagSlot(slot)
  return slot >= 20 and slot <= 23 or slot >= 68
end

local hooks = {
  SetHyperlink = function(link, count)
    return select(2, GetItemInfo(link)), count
  end,

  SetBagItem = function(bag, slot)
    if not MerchantFrame:IsVisible() then
      return GetContainerItemLink(bag, slot), select(2, GetContainerItemInfo(bag, slot))
    end
  end,

  SetInventoryItem = function(unit, slot)
    return GetInventoryItemLink(unit, slot), not(IsBagSlot(slot)) and GetInventoryItemCount(unit, slot)
  end,

  SetLootItem = function(slot)
    if LootSlotIsItem(slot) then
      return GetLootSlotLink(slot), select(3, GetLootSlotInfo(slot))
    end
  end,

  SetLootRollItem = function(slot)
    return GetLootRollItemLink(slot), select(3, GetLootRollItemInfo(slot))
  end,

  SetAuctionItem = function(type, index)
    return GetAuctionItemLink(type, index), select(3, GetAuctionItemInfo(type, index))
  end,

  SetAuctionSellItem = function()
    return select(2, GetItemInfo(GetAuctionSellItemInfo())), select(3, GetAuctionSellItemInfo())
  end,

  SetTradeSkillItem = function(skill, id)
    if id then
      return GetTradeSkillReagentItemLink(skill, id), select(3, GetTradeSkillReagentInfo(skill, id))
    end
    return GetTradeSkillItemLink(skill), GetTradeSkillNumMade(skill)
  end,

  SetQuestItem = function(type, index)
    return GetQuestItemLink(type, index), select(3, GetQuestItemInfo(type, index))
  end,

  SetQuestLogItem = function(type, index)
    local link = GetQuestLogItemLink(type, index)
    if type == 'choice' then
      return link, select(3, GetQuestLogChoiceInfo(index))
    end
    return link, select(3, GetQuestLogRewardInfo(index))
  end,

  SetTradePlayerItem = function(id)
    return GetTradePlayerItemLink(id), select(3, GetTradePlayerItemInfo(id))
  end,

  SetTradeTargetItem = function(id)
    return GetTradeTargetItemLink(id), select(3, GetTradeTargetItemInfo(id))
  end,

  SetInboxItem = function(id)
    return GetInboxItemLink(id), select(3, GetInboxItem(id))
  end,

  SetSendMailItem = function(id)
    return select(2, GetItemInfo(GetSendMailItem(id))), select(3, GetSendMailItem(id))
  end,

  SetGuildBankItem = function(tab, slot)
    return GetGuildBankItemLink(tab, slot), select(2, GetGuildBankItemInfo(tab, slot))
  end,

  SetMerchantItem = function(id)
    return GetMerchantItemLink(id), select(4, GetMerchantItemInfo(id))
  end,
}

local function hookTip(tooltip, method, action)
  hooksecurefunc(tooltip, method, function(tip, ...)
    local link, count = action(...)
    if link then
      IE:AddToTooltip(tip, link)
    end
  end)
end

function IE:HookTooltips()
  if IE.tooltipsHooked then return end
  IE.tooltipsHooked = true

  for method,func in pairs(hooks) do
    hookTip(GameTooltip, method, func)
  end
  hookTip(ItemRefTooltip, 'SetHyperlink', hooks.SetHyperlink)

  -- Not really needed, but... :-)
  if AtlasLootTooltip then
    hookTip(AtlasLootTooltip, 'SetHyperlink', hooks.SetHyperlink)
  end
end

