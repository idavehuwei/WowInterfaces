local LA = LearningAid

-- Transforms a spellbook ID into a global spell ID
function LA:GlobalSpellID(id)
  local link = GetSpellLink(id, BOOKTYPE_SPELL)
  if link then
    local globalID = string.match(link, "Hspell:([^\124]+)\124")
    return tonumber(globalID)
  end
end
function LA:UpdateSpellBook()
  self.spellBookCache = {}
  local i = 1
  local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
  while spellName do
    spellRank = tonumber(string.match(spellRank, "%d+")) or 0
    local spellGlobalID = self:GlobalSpellID(i)
    local spellIsPassive = IsPassiveSpell(i, BOOKTYPE_SPELL) or false
    self.spellBookCache[i] = {
      name = spellName,
      rank = spellRank,
      globalID = spellGlobalID,
      passive = spellIsPassive,
      spellBookID = i
    }
    i = i + 1
    spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
  end
  self:DebugPrint("Updated Spellbook, "..i.." spells found")
end
function LA:AddSpell(id)
  if self.inCombat then
    table.insert(self.queue, { action = "LEARN", id = id, kind = BOOKTYPE_SPELL })
  else
    self:LearnSpell(BOOKTYPE_SPELL, id)
    if (not self.retalenting) and (not IsPassiveSpell(id, BOOKTYPE_SPELL)) then
      -- Display button with draggable spell icon
      self:AddButton(BOOKTYPE_SPELL, id)
    end
  end
end
function LA:RemoveSpell(id)
  if self.inCombat then
    table.insert(self.queue, { action = "FORGET", id = id, kind = BOOKTYPE_SPELL })
  else
    self:ClearButtonID(BOOKTYPE_SPELL, id)
    self:ForgetSpell(id)
  end
end
function LA:DiffSpellBook()
  local i = 1
  local cache = self.spellBookCache
  local updated = false
  local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
  local spellGlobalID = self:GlobalSpellID(i)
  while spellName do
    if cache[i] == nil or
       cache[i].globalID ~= spellGlobalID then
      -- if spell removed
      if cache[i + 1] ~= nil and
         cache[i+1].globalID == spellGlobalID then
        self:DebugPrint("Old spell removed: "..cache[i].name.." ("..cache[i].rank..") id "..(i))
        self:UpdateSpellBook()
        self:RemoveSpell(i)
      else
        self:DebugPrint("New spell found: "..spellName.." ("..spellRank..")") -- Old spell: "..cache[i + offset].name.." ("..cache[i + offset].rank..")")
        self:UpdateSpellBook()
        self:AddSpell(i)
      end
      updated = true
      break
    end
    i = i + 1
    spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
    spellGlobalID = self:GlobalSpellID(i)
  end
  -- if the last spell in the spellbook is removed
  if i == #cache and not updated then
    self:DebugPrint("Last spell removed: "..cache[i].name.." ("..cache[i].rank..") id "..i)
    self:UpdateSpellBook()
    self:RemoveSpell(i)
    updated = true
  end
  return updated
end
function LA:LearnSpell(kind, id)
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    local buttonID = button:GetID()
    if button.kind == kind and buttonID >= id then
      button:SetID(buttonID + 1)
      self:UpdateButton(button)
    end
  end
  local spec = GetActiveTalentGroup()
  if self.saved.restoreActions and
      (not self.retalenting) and
      kind == BOOKTYPE_SPELL and
      self.character.unlearned and
      self.character.unlearned[spec] then
    local globalID = self:GlobalSpellID(id)
    for slot, oldIDs in pairs(self.character.unlearned[spec]) do
      local actionType = GetActionInfo(slot)
      for oldID in pairs(oldIDs) do
        --local actionType, actionID, actionSubType, globalID = GetActionInfo(slot)
        if oldID == globalID and actionType == nil then
          PickupSpell(id, BOOKTYPE_SPELL)
          PlaceAction(slot)
          self.character.unlearned[spec][slot][oldID] = nil
        end
      end
    end
  end
end
function LA:ForgetSpell(id)
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    local buttonID = button:GetID()
    if button.kind == BOOKTYPE_SPELL and buttonID > id then
      button:SetID(buttonID - 1)
      self:UpdateButton(button)
    end
  end
end
