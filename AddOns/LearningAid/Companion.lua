local LA = LearningAid
function LA:UpdateCompanions()
  self:UpdateCompanionType("MOUNT")
  self:UpdateCompanionType("CRITTER")
end
function LA:UpdateCompanionType(kind)
  if self.companionCache[kind] then
    wipe(self.companionCache[kind])
  else
    self.companionCache[kind] = {}
  end
  local cache = self.companionCache[kind]
  local count = GetNumCompanions(kind)
  for i = 1, count do
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(kind, i)
    if creatureName then 
      cache[creatureName] = true
    else
      self:DebugPrint("Bad companion, kind = "..kind..", index = "..i)
    end
  end
  self:DebugPrint("Updated companion type "..kind..", "..count.." companions found.")
end
function LA:DiffCompanions()
  self:DiffCompanionType("MOUNT")
  self:DiffCompanionType("CRITTER")
end
function LA:AddCompanion(kind, id)
  if self.inCombat then
    table.insert(self.queue, { action = "LEARN", id = id, kind = kind})
  else
    self:LearnSpell(kind, id)
    self:AddButton(kind, id)
  end
end
function LA:DiffCompanionType(kind)
  local count = GetNumCompanions(kind)
  local cache = self.companionCache[kind]
  local updated
  for i = 1, count do
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(kind, i)
    if cache[creatureName] == nil then
      self:DebugPrint("Found new companion, type "..kind..", index "..i)
      cache[creatureName] = true
      self:AddCompanion(kind, i)
      updated = i
      break
    end
  end
  return updated
end
