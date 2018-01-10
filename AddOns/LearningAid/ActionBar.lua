local LA = LearningAid
LA.castSlashCommands = {
  [SLASH_USE1] = true,
  [SLASH_USE2] = true,
  [SLASH_USERANDOM1] = true,
  [SLASH_USERANDOM2] = true,
  [SLASH_CAST1] = true,
  [SLASH_CAST2] = true,
  [SLASH_CAST3] = true,
  [SLASH_CAST4] = true,
  [SLASH_CASTRANDOM1] = true,
  [SLASH_CASTRANDOM2] = true,
  [SLASH_CASTSEQUENCE1] = true,
  [SLASH_CASTSEQUENCE2] = true
}
function LA:MacroSpells(macroText)
  macroText = string.lower(macroText)
  local spells = {}
  local first, last, line
  first, last, line = macroText:find("([^\n]+)[\n]?")
  while first ~= nil do
    self:DebugPrint("Line",line)
    local lineFirst, lineLast, slash = line:find("^(/%S+)%s+")
    if lineFirst ~= nil then
      self:DebugPrint('Slash "'..slash..'"')
      if self.castSlashCommands[slash] then
        --self:DebugPrint("found slash command")
        local token
        local linePos = lineLast
        local found = true
        while found do
          while found do
            found = false
            -- ignore reset=
            lineFirst, lineLast = line:find("^reset=%S+%s*", linePos + 1)
            if lineLast ~= nil then linePos = lineLast; found = true end
            -- ignore macro options
            lineFirst, lineLast = line:find("^%[[^%]]*]", linePos + 1)
            if lineLast ~= nil then linePos = lineLast; found = true end
            -- ignore whitespace and punctuation
            lineFirst, lineLast = line:find("^[%s,;]+", linePos + 1)
            if lineLast ~= nil then linePos = lineLast; found = true end
            -- ignore ranks
            lineFirst, lineLast = line:find("^%([^%)]+%)", linePos + 1)
            if lineLast ~= nil then linePos = lineLast; found = true end
          end
          found = false
          lineFirst, lineLast, token = line:find("^([^%(%[,;]+)", linePos + 1)
          if lineLast ~= nil then
            token = strtrim(token)
            linePos = lineLast
            found = true
            self:DebugPrint('Token: "'..token..'"')
            spells[token] = true
          end
        end
      end
    end
    first, last, line = macroText:find("([^\n]+)\n?", last + 1)
  end
  return spells
end
function LA:DiffActionBars()
  local spec = GetActiveTalentGroup()
  for slot = 1, 120 do
    local actionType = GetActionInfo(slot)
    -- local actionType, actionID, actionSubType, globalID = GetActionInfo(slot)
    if self.character.actions and 
       self.character.actions[spec] and
       self.character.actions[spec][slot] and
       not actionType
    then
      if not self.character.unlearned then self.character.unlearned = {} end
      if not self.character.unlearned[spec] then self.character.unlearned[spec] = {} end
      if not self.character.unlearned[spec][slot] then self.character.unlearned[spec][slot] = {} end
      self.character.unlearned[spec][slot][self.character.actions[spec][slot]] = true
    end
  end
end
function LA:SaveActionBars()
  local spec = GetActiveTalentGroup()
  if self.character.actions == nil then self.character.actions = {} end
  if self.character.actions[spec] then
    wipe(self.character.actions[spec])
  else
    self.character.actions[spec] = {}
  end
  local savedActions = self.character.actions[spec]
  for actionSlot = 1, 120 do
    local actionType, actionID, actionSubType, globalID = GetActionInfo(actionSlot)
    if actionType == "spell" then
      savedActions[actionSlot] = globalID
    end
  end
end
function LA:FindMissingActions()
  if self.inCombat then
    print(self:GetText("title")..": "..self:GetText("errorInCombat"))
    return
  end
  local actions = {}
  local types = {}
  local subTypes = {}
  local ranks = {}
  local tracking = {}
  local shapeshift = {}
  local results = {}
  local macroSpells = {}
  local numTrackingTypes = GetNumTrackingTypes()
  for trackingType = 1, numTrackingTypes do
    local name, texture, active, category = GetTrackingInfo(trackingType)
    if category == BOOKTYPE_SPELL then
      tracking[name] = true
    end
  end
  for slot = 1, 120 do
    local actionType, actionID, actionSubType = GetActionInfo(slot)
    if actionSubType == nil then
      actionSubType = ""
    end
    if actionType == nil then
      actionType = ""
    end
    -- development info
    if not types[actionType] then
      self:DebugPrint("Type "..actionType)
      types[actionType] = true
    end
    if not subTypes[actionSubType] then
      self:DebugPrint("Subtype "..actionSubType)
      subTypes[actionSubType] = true
    end
    if actionType == "spell" then
      actions[actionID] = true
    elseif actionType == "macro" and actionID ~= 0 and self.saved.macros then
      self:DebugPrint("Macro in slot", slot, "with ID", actionID)
      local body = GetMacroBody(actionID)
      local spells = self:MacroSpells(body)
      for spell in pairs(spells) do
        macroSpells[spell] = true
      end
    end
  end
  -- Macaroon support code
  if self.saved.macros and Macaroon and Macaroon.Buttons then
    for index, button in ipairs(Macaroon.Buttons) do
      local buttonType = button[1].config.type
      local macroText = button[1].config.macro
      local storage = button[2]
      if (buttonType == "macro") and (storage == 0) then
        self:DebugPrint("Macaroon macro in slot", index)
        local spells = self:MacroSpells(macroText)
        for spell in pairs(spells) do
          macroSpells[spell] = true
        end
      end
    end
  end
  -- End Macaroon code
  for actionID, info in ipairs(self.spellBookCache) do
    if (not ranks[info.name]) or ranks[info.name].rank < info.rank then
      ranks[info.name] = info
    end
  end
  local numForms = GetNumShapeshiftForms()
  for form = 1, numForms do
    local formTexture, formName, formIsActive, formIsCastable = GetShapeshiftFormInfo(form)
    shapeshift[formName] = true
  end
  for spellName, info in pairs(ranks) do
    spellNameLower = string.lower(spellName)
    if 
      (not actions[info.spellBookID]) and -- spell is not on any action bar
      (not info.passive)              and -- spell is not passive
      -- spell is not a tracking spell, or displaying tracking spells has been enabled
      ((not tracking[spellName]) or self.saved.tracking) and
      ((not shapeshift[spellName]) or self.saved.shapeshift) and
      (not macroSpells[spellNameLower])
    then
      self:DebugPrint("Spell "..info.name.." Rank "..info.rank.." is not on any action bar.")
      if macroSpells[spellNameLower] then self:DebugPrint("Found spell in macro") end
      results[#results + 1] = info
    end
  end
  table.sort(results, function (a, b) return a.spellBookID < b.spellBookID end)
  for result = 1, #results do
    self:AddButton(BOOKTYPE_SPELL, results[result].spellBookID)
  end
end

function LA:RestoreAction(globalID)
  -- self.character.actions[spec][slot] = globalID
  local spec = GetActiveTalentGroup()
  if self.character.actions and self.character.actions[spec] then -- and self.character.actions[spec][globalID]
    for actionSlot, id in pairs(self.character.actions[spec]) do
      if id == globalID then
        self:DebugPrint("RestoreAction("..globalID.."): Found action at action slot "..actionSlot)
        --local actionType, actionID, actionSubType, slotGlobalID = GetActionInfo(actionSlot)
        local actionType = GetActionInfo(actionSlot)
        if actionType == nil then
          local spellBookID
          for index, info in ipairs(self.spellBookCache) do
            if info.globalID == globalID then
              spellBookID = info.spellBookID
              self:DebugPrint("RestoreAction("..globalID.."): Found action at Spellbook ID "..spellBookID)
              break
            end
          end
          if spellBookID then
            PickupSpell(spellBookID, BOOKTYPE_SPELL)
            PlaceAction(actionSlot)
          end
        end
      end
    end
  end
end
