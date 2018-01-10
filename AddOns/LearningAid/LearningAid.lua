-- Learning Aid v1.07.2 by Jamash (Kil'jaeden-US)

LearningAid = LibStub("AceAddon-3.0"):NewAddon("LearningAid", "AceConsole-3.0", "AceEvent-3.0")
local LA = LearningAid
LA.strings = {}

LA.FILTER_SHOW_ALL  = 0
LA.FILTER_SUMMARIZE = 1
LA.FILTER_SHOW_NONE = 2

local patterns = {
  learnAbility    = ERR_LEARN_ABILITY_S,
  learnSpell      = ERR_LEARN_SPELL_S,
  unlearnSpell    = ERR_SPELL_UNLEARNED_S,
  petLearnAbility = ERR_PET_LEARN_ABILITY_S,
  petLearnSpell   = ERR_PET_LEARN_SPELL_S,
  petUnlearnSpell = ERR_PET_SPELL_UNLEARNED_S
}
for name, pattern in pairs(patterns) do
  patterns[name] = string.gsub(pattern, "%%s", "(.+)")
end

local function spellSpamFilter(chatFrame, event, message, ...)
  LA:DebugPrint("spellSpamFilter: ", event, message, ...)
  local spell
  if LA.untalenting or
     LA.retalenting or
     (LA.pendingTalentCount > 0) or
     (LA.saved.filterSpam == LA.FILTER_SHOW_NONE) or
     LA.learning
  then
    spell = string.match(message, patterns.learnSpell)
    if not spell then spell = string.match(message, patterns.learnAbility) end
    if not spell then spell = string.match(message, patterns.unlearnSpell) end
    if spell then
      return true -- do not display the message
    end
  end
  spell = string.match(message, patterns.petLearnAbility)
  if not spell then spell = string.match(message, patterns.petLearnSpell) end
  if not spell then spell = string.match(message, patterns.petUnlearnSpell) end
  if spell then
    return true
  end
  return false, message, ... -- pass the message along
end
local defaults = {
  macros = true,
  enabled = true,
  restoreActions = true,
  filterSpam = LA.FILTER_SUMMARIZE
}
function LA:GetText(id, ...)
  local result = ""
  if self.strings[self.locale] and self.strings[self.locale][id] then
    result = self.strings[self.locale][id]
  elseif self.strings.enUS[id] then
    result = self.strings.enUS[id]
  else
    self:DebugPrint("Invalid string ID '"..id.."'")
  end
  return format(result, ...)
end
function LA:OnInitialize()
  if not LearningAid_Saved then LearningAid_Saved = {} end
  if not LearningAid_Character then LearningAid_Character = {} end
  self.saved = LearningAid_Saved
  self.character = LearningAid_Character
  self.version = "1.07.2"
  self.saved.version = self.version
  self.character.version = self.version
  for key, value in pairs(defaults) do
    if self.saved[key] == nil then
      self.saved[key] = value
    end
  end
  self:DebugPrint("OnInitialize()")
  self.titleHeight = 40
  self.width = 170
  self.buttonSpacing = 5
  self.buttonSize = 37
  local version, build, date, tocversion = GetBuildInfo()
  self.locale = GetLocale()
  self.tocVersion = tocversion
  self.companionCache = {}
  self.menuHideDelay = 5
  self.inCombat = false
  self.retalenting = false
  self.untalenting = false
  --self.learning = false
  self.activatePrimarySpec = GetSpellInfo(63645)
  self.activateSecondarySpec = GetSpellInfo(63644)
  self.queue = {}
  self.spellsLearned = {}
  self.spellsUnlearned = {}
  self.petLearned = {}
  self.petUnlearned = {}

  -- create main frame
  local frame = CreateFrame("Frame", "LearningAid_Frame", UIParent)
  self.frame = frame
  frame:SetWidth(self.width)
  frame:SetHeight(self.titleHeight)
  frame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -200, -200)
  frame:SetMovable(true)
  frame:SetClampedToScreen(true)
  frame:SetScript("OnShow", function () self:OnShow() end)
  frame:SetScript("OnHide", function () self:OnHide() end)
  frame.buttons = {}
  frame.visible = 0
  frame:Hide()
  local backdrop = {
    bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
    edgeFile = "Interface/DialogFrame/UI-DialogBox-Gold-Border",
    tile = false, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
  }
  frame:SetBackdrop(backdrop)

  -- create title bar
  local titleBar = CreateFrame("Frame", "LearningAid_Frame_TitleBar", frame)
  frame.titleBar = titleBar
  titleBar:SetPoint("TOPLEFT")
  titleBar:SetPoint("TOPRIGHT")
  titleBar:SetHeight(self.titleHeight)
  titleBar:RegisterForDrag("LeftButton")
  titleBar:EnableMouse()
  titleBar.text = titleBar:CreateFontString("LearningAid_Frame_Title_Text", "OVERLAY", "GameFontNormalLarge")
  titleBar.text:SetText(self:GetText("title"))
  titleBar.text:SetPoint("CENTER", titleBar, "CENTER", 0, 0)

  -- create close button
  local closeButton = CreateFrame("Button", "LearningAid_Frame_CloseButton", titleBar)
  frame.closeButton = closeButton
  closeButton:SetWidth(32)
  closeButton:SetHeight(32)
  closeButton:SetPoint("RIGHT", titleBar, "RIGHT", -2, 0)
  closeButton:SetNormalTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Up")
  closeButton:SetPushedTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Down")
  closeButton:SetDisabledTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Disabled")
  closeButton:SetHighlightTexture("Interface/BUTTONS/UI-Panel-MinimizeButton-Highlight")
  closeButton:SetScript("OnClick", function () self:Hide() end)

  -- initialize right-click menu
  self.menuTable = {
    { text = self:GetText("lockPosition"), 
      func = function () self:ToggleLock() end },
    { text = self:GetText("close"),
      func = function () self:Hide() end }
  }

  local menu = CreateFrame("Frame", "LearningAid_Menu", titleBar, "UIDropDownMenuTemplate")

  -- set drag and click handlers for the title bar
  titleBar:SetScript(
    "OnDragStart",
    function (self, button)
      if not LA.saved.locked then
        self:GetParent():StartMoving()
      end
    end
  )

  titleBar:SetScript(
    "OnDragStop",
    function (self)
      local parent = self:GetParent()
      parent:StopMovingOrSizing()
      LA.saved.x = parent:GetLeft()
      LA.saved.y = parent:GetTop()
    end
  )

  titleBar:SetScript(
    "OnMouseUp",
    function (self, button)
      if button == "MiddleButton" then
        LA:Hide()
      elseif button == "RightButton" then
        EasyMenu(LA.menuTable, menu, titleBar, 0, 8, "MENU", LA.menuHideDelay)
      end
    end
  )

  self.options = {
    handler = LA,
    type = "group",
    args = {
      lock = {
        name = self:GetText("lockWindow"),
        desc = self:GetText("lockWindowHelp"),
        type = "toggle",
        set = function(info, val) if val then self:Lock() else self:Unlock() end end,
        get = function(info) return self.saved.locked end,
        width = "full",
        order = 1
      },
      restoreactions = {
        name = self:GetText("restoreActions"),
        desc = self:GetText("restoreActionsHelp"),
        type = "toggle",
        set = function(info, val) if val then self.saved.restoreActions = val end end,
        get = function(info) return self.saved.restoreActions end,
        width = "full",
        order = 2
      },
      filter = {
        name = self:GetText("showLearnSpam"),
        desc = self:GetText("showLearnSpamHelp"),
        type = "select",
        values = {
          [LA.FILTER_SHOW_ALL ] = self:GetText("showAll"),
          [LA.FILTER_SUMMARIZE] = self:GetText("summarize"),
          [LA.FILTER_SHOW_NONE] = self:GetText("showNone")
        },
        set = function(info, val)
          self.saved.filterSpam = val
          if val ~= LA.FILTER_SHOW_ALL then
            ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", spellSpamFilter)
          else
            ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SYSTEM", spellSpamFilter)
          end
        end,
        get = function(info) return self.saved.filterSpam end,
        --width = "full",
        order = 3
      },
      debug = {
        name = self:GetText("debugOutput"),
        desc = self:GetText("debugOutputHelp"),
        type = "toggle",
        set = function(info, val) self.saved.debug = val end,
        get = function(info) return self.saved.debug end,
        width = "full",
        order = 99
      },
      reset = {
        name = self:GetText("resetPosition"),
        desc = self:GetText("resetPositionHelp"),
        type = "execute",
        func = "ResetFramePosition",
        width = "full",
        order = 4
      },
      missing = {
        type = "group",
        inline = true,
        name = self:GetText("findMissingAbilities"),
        order = 10,
        args = {
          search = {
            name = self:GetText("searchMissing"),
            desc = self:GetText("searchMissingHelp"),
            type = "execute",
            func = "FindMissingActions",
--            width = "full",
            order = 1
          },
          tracking = {
            name = self:GetText("findTracking"),
            desc = self:GetText("findTrackingHelp"),
            type = "toggle",
            set = function(info, val) self.saved.tracking = val end,
            get = function(info, val) return self.saved.tracking end,
            width = "full",
            order = 2
          },
          shapeshift = {
            name = self:GetText("findShapeshift"),
            desc = self:GetText("findShapeshiftHelp"),
            type = "toggle",
            set = function(info, val) self.saved.shapeshift = val end,
            get = function(info, val) return self.saved.shapeshift end,
            width = "full",
            order = 3
          },
          macros = {
            name = self:GetText("searchInsideMacros"),
            desc = self:GetText("searchInsideMacrosHelp"),
            type = "toggle",
            set = function(info, val) self.saved.macros = val end,
            get = function(info, val) return self.saved.macros end,
            width = "full",
            order = 4
          }
        }
      },
      unlock = {
        name = self:GetText("unlockWindow"),
        desc = self:GetText("unlockWindowHelp"),
        type = "execute",
        guiHidden = true,
        func = "Unlock"
      },
      config = {
        name = self:GetText("configure"),
        desc = self:GetText("configureHelp"),
        type = "execute",
        func = function() InterfaceOptionsFrame_OpenToCategory(self.optionsFrame) end,
        guiHidden = true
      },
      test = {
        type = "group",
        name = "Test",
        desc = "Perform various tests with Learning Aid.",
        hidden = true,
        args = {
          add = {
            type = "group",
            name = "Add",
            desc = "Add a button to the Learning Aid window.",
            args = {
              spell = {
                type = "input",
                name = "Spell",
                pattern = "^%d+$",
                set = function(info, val)
                  self:AddButton("spell", tonumber(val))
                end,
              },
              mount = {
                type = "input",
                name = "Mount",
                pattern = "^%d+$",
                set = function(info, val)
                  self:AddButton("MOUNT", tonumber(val))
                end,
              },
              critter = {
                type = "input",
                name = "Critter (Minipet)",
                pattern = "^%d+$",
                set = function(info, val)
                  self:AddButton("CRITTER", tonumber(val))
                end,
              }
            }
          },
          remove = {
            type = "group",
            name = "Remove",
            desc = "Remove a button from the Learning Aid window.",
            args = {
              spell = {
                type = "input",
                name = "Spell",
                pattern = "^%d+$",
                set = function(info, val)
                  self:ClearButtonID("spell", tonumber(val))
                end
              },
              mount = {
                type = "input",
                name = "Mount",
                pattern = "^%d+$",
                set = function(info, val)
                  self:ClearButtonID("MOUNT", tonumber(val))
                end
              },
              critter = {
                type = "input",
                name = "Critter (Minipet)",
                pattern = "^%d+$",
                set = function(info, val)
                  self:ClearButtonID("CRITTER", tonumber(val))
                end
              },
              button = {
                type = "input",
                name = "Button",
                pattern = "^%d+$",
                set = function(info, val)
                  self:ClearButtonIndex(tonumber(val))
                end
              }
            }
          }
        }
      }
    }
  }
  LibStub("AceConfig-3.0"):RegisterOptionsTable("LearningAidConfig", self.options, {"la", "learningaid"})
  self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("LearningAidConfig", self:GetText("title"))
  hooksecurefunc("ConfirmTalentWipe", function() 
    self:DebugPrint("ConfirmTalentWipe")
    self:SaveActionBars()
    self.untalenting = true
    self.spellsUnlearned = {}
    self:RegisterEvent("ACTIONBAR_SLOT_CHANGED", "OnEvent")
    self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
    self:RegisterEvent("UI_ERROR_MESSAGE", "OnEvent")
  end)
  hooksecurefunc("LearnPreviewTalents", function(pet)
    self:DebugPrint("LearnPreviewTalents", pet)
    if pet == false then
      self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
      wipe(self.spellsLearned)
      self.learning = true
    end
  end)
  --hooksecurefunc("LearnTalent", function (tab, talent, pet, group)
  --  self:DebugPrint("LearnTalent", tab, talent, pet, group)
  --  self:DebugPrint(GetTalentInfo(tab, talent, false, pet, group))
  --end)
  self.LearnTalent = LearnTalent
  self.pendingTalents = {}
  self.pendingTalentCount = 0
  LearnTalent = function(tab, talent, pet, group)
    self:DebugPrint("LearnTalent", tab, talent, pet, group)
    local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq, unknown1, unknown2 = GetTalentInfo(tab, talent, false, pet, group)
    self:DebugPrint("GetTalentInfo", name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq, unknown1, unknown2)
    self.LearnTalent(tab, talent, pet, group)
    if rank < maxRank and meetsPrereq and not pet then
      --wipe(self.spellsLearned)
      --self.learning = true
      if self.pendingTalentCount == 0 then wipe(self.pendingTalents) end
      self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
      local id = (group or GetActiveTalentGroup()).."."..tab.."."..talent.."."..rank
      if not self.pendingTalents[id] then
        self.pendingTalents[id] = true
        self.pendingTalentCount = self.pendingTalentCount + 1
      end
      --self:DebugPrint(GetTalentInfo(tab, talent, false, pet, group))
    end
  end
  self:RegisterChatCommand("la", "AceSlashCommand")
  self:RegisterChatCommand("learningaid", "AceSlashCommand")
  self:SetEnabledState(self.saved.enabled)
end
function LA:ResetFramePosition()
  local frame = self.frame
  frame:ClearAllPoints()
  frame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -200, -200)
  self.saved.x = frame:GetLeft()
  self.saved.y = frame:GetTop()
end
function LA:AceSlashCommand(msg)
  LibStub("AceConfigCmd-3.0").HandleCommand(LearningAid, "la", "LearningAidConfig", msg)
end
function LA:OnEvent(event, ...)
  self:DebugPrint(event, ...)
  if self[event] then
    self[event](self, ...)
  end
end
function LA:OnEnable()
  self.saved.enabled = true
  self:DebugPrint("OnEnable()")
  self:RegisterEvent("SPELLS_CHANGED", "OnEvent")
  self:RegisterEvent("COMPANION_LEARNED", "OnEvent")
  --self:RegisterEvent("COMPANION_UPDATE")
  --self:RegisterEvent("TRADE_SKILL_SHOW")
  --self:RegisterEvent("TRADE_SKILL_CLOSE")
  --self:RegisterEvent("SPELL_UPDATE_COOLDOWN")
  --self:RegisterEvent("CURRENT_SPELL_CAST_CHANGED")
  self:RegisterEvent("VARIABLES_LOADED", "OnEvent")
  self:RegisterEvent("PLAYER_REGEN_DISABLED", "OnEvent")
  self:RegisterEvent("PLAYER_REGEN_ENABLED", "OnEvent")
  --self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
  self:RegisterEvent("UNIT_SPELLCAST_START", "OnEvent")
  self:RegisterEvent("PLAYER_LEAVING_WORLD", "OnEvent")
  self:RegisterEvent("PLAYER_LOGOUT", "OnEvent")
  self:RegisterEvent("CHAT_MSG_SYSTEM", "OnEvent")
  self:RegisterEvent("PET_TALENT_UPDATE", "OnEvent")
  self:RegisterEvent("PLAYER_LEVEL_UP", "OnEvent")
  self:UpdateCompanions()
  self:UpdateSpellBook()
  self:DiffActionBars()
  self:SaveActionBars()
  if self.saved.filterSpam ~= LA.FILTER_SHOW_ALL then
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", spellSpamFilter)
  end
end
function LA:OnDisable()
  self:Hide()
  self.saved.enabled = false
  if self.saved.filterSpam ~= LA.FILTER_SHOW_ALL then
    ChatFrame_RemoveMessageEventFilter("CHAT_MSG_SYSTEM", spellSpamFilter)
  end
end
function LA:PLAYER_REGEN_DISABLED()
  self.inCombat = true
  self.frame.closeButton:Disable()
end
function LA:PLAYER_REGEN_ENABLED()
  self.inCombat = false
  self.frame.closeButton:Enable()
  self:ProcessQueue()
end
function LA:SPELLS_CHANGED()
  if self.spellBookCache ~= nil then
    if not self:DiffSpellBook() then
      self:DebugPrint("Event SPELLS_CHANGED fired without spell changes")
    end
  end
end
function LA:COMPANION_LEARNED()
  self:DiffCompanions()
  --self:UpdateCompanions()
end
function LA:COMPANION_UPDATE()
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    local kind = button.kind
    if kind == "MOUNT" or kind == "CRITTER" then
      local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(kind, button:GetID())
      if isSummoned then
        button:SetChecked(true)
      else
        button:SetChecked(false)
      end
    end
  end
end
function LA:TRADE_SKILL_SHOW()
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    if button.kind == BOOKTYPE_SPELL then
      if IsSelectedSpell(button:GetID(), button.kind) then
        button:SetChecked(true)
      else
        button:SetChecked(false)
      end
    end
  end
end
LA.TRADE_SKILL_CLOSE = LA.TRADE_SKILL_SHOW
function LA:SPELL_UPDATE_COOLDOWN()
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    if button.kind == BOOKTYPE_SPELL then
      self:UpdateButton(button)
    elseif button.kind == "MOUNT" or button.kind == "CRITTER" then
      local start, duration, enable = GetCompanionCooldown(button.kind, button:GetID())
      CooldownFrame_SetTimer(button.cooldown, start, duration, enable);
    end
  end
end
function LA:CURRENT_SPELL_CAST_CHANGED()
  local frame = self.frame
  local buttons = frame.buttons
  for i = 1, frame.visible do
    local button = buttons[i]
    if button.kind == BOOKTYPE_SPELL then
      self:SpellButton_UpdateSelection(button)
    end
  end
end
function LA:UNIT_SPELLCAST_START(unit, spell)
  if unit == "player" and (spell == self.activatePrimarySpec or spell == self.activateSecondarySpec) then
    self:DebugPrint("Talent swap initiated")
    self.retalenting = true
    wipe(self.spellsLearned)
    wipe(self.spellsUnlearned)
    self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
    self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", "OnEvent")
  end
end
function LA:UNIT_SPELLCAST_INTERRUPTED(unit, spell)
  if unit == "player" and (spell == self.activatePrimarySpec or spell == self.activateSecondarySpec) then
    self:DebugPrint("Talent swap canceled")
    self.retalenting = false
    self:UnregisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
    self:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED", "OnEvent")
  end
end
local function formatSpells(ranks)
  local spells = {}
  for spell, rank in pairs(ranks) do table.insert(spells, spell) end
  table.sort(spells)
  local strings = {}
  for index, spell in ipairs(spells) do
    if ranks[spell] == "" then 
      table.insert(strings, spell)
    else
      table.insert(strings, spell .." (Rank " .. ranks[spell] .. ")")
    end
  end
  return table.concat(strings, ", ")
end
local systemInfo = ChatTypeInfo["SYSTEM"]
local function systemPrint(message)
  DEFAULT_CHAT_FRAME:AddMessage(LA:GetText("title")..": "..message, systemInfo.r, systemInfo.g, systemInfo.b, systemInfo.id)
end
function LA:PLAYER_TALENT_UPDATE()
  if self.retalenting then
    self:DebugPrint("Talent swap completed")
    self.retalenting = false
    self:UnregisterEvent("PLAYER_TALENT_UPDATE")
    self:UnregisterEvent("UNIT_SPELLCAST_INTERRUPTED")
    if self.saved.filterSpam == LA.FILTER_SUMMARIZE then 
      local learned = formatSpells(self.spellsLearned)
      local unlearned = formatSpells(self.spellsUnlearned)
      if string.len(unlearned) > 0 then systemPrint(self:GetText("youHaveUnlearned", unlearned)) end
      if string.len(learned) > 0 then systemPrint(self:GetText("youHaveLearned", learned)) end
    end
    wipe(self.spellsLearned)
    wipe(self.spellsUnlearned)
  elseif self.untalenting then
    self.untalenting = false
    self:UnregisterEvent("ACTIONBAR_SLOT_CHANGED")
    self:UnregisterEvent("PLAYER_TALENT_UPDATE")
    self:UnregisterEvent("UI_ERROR_MESSAGE")
    if self.saved.filterSpam == LA.FILTER_SUMMARIZE then
      local unlearned = formatSpells(self.spellsUnlearned)
      if string.len(unlearned) > 0 then systemPrint(self:GetText("youHaveUnlearned", unlearned)) end
    end
    wipe(self.spellsUnlearned)
  elseif self.pendingTalentCount > 0 then --self.learning then
    self.pendingTalentCount = self.pendingTalentCount - 1
    if self.pendingTalentCount <= 0 then
      --self.learning = false
      if self.saved.filterSpam == LA.FILTER_SUMMARIZE then
        local learned = formatSpells(self.spellsLearned)
        if string.len(learned) > 0 then systemPrint(self:GetText("youHaveLearned", learned)) end
      end
      self:UnregisterEvent("PLAYER_TALENT_UPDATE")
      wipe(self.pendingTalents)
      wipe(self.spellsLearned)
    end
  elseif self.learning then
    self.learning = false
    self:UnregisterEvent("PLAYER_TALENT_UPDATE")
    if self.saved.filterSpam == LA.FILTER_SUMMARIZE then
      local learned = formatSpells(self.spellsLearned)
      if string.len(learned) > 0 then systemPrint(self:GetText("youHaveLearned", learned)) end
    end
    wipe(self.spellsLearned)
  end
end
function LA:PLAYER_LEAVING_WORLD()
  self:UnregisterEvent("SPELLS_CHANGED", "OnEvent")
  self:RegisterEvent("PLAYER_ENTERING_WORLD", "OnEvent")
end
function LA:PLAYER_ENTERING_WORLD()
  self:RegisterEvent("SPELLS_CHANGED", "OnEvent")
end
function LA:VARIABLES_LOADED()
  if self.saved.locked then
    self.menuTable[1].text = self:GetText("unlockPosition")
  else
    self.saved.locked = false
  end
  if self.saved.x and self.saved.y then
    self.frame:ClearAllPoints()
    self.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", self.saved.x, self.saved.y)
  end
end

function LA:ACTIONBAR_SLOT_CHANGED(slot)
-- actionbar1 = ["spell" 2354] ["macro" 5] [nil]
-- then after untalenting actionbar1 = [nil] ["macro" 5] [nil]
-- self.character.actions[spec][1][2354] = true
  
  if self.untalenting then
    -- something something on (slot)
    local spec = GetActiveTalentGroup()
    local actionType, actionID, actionSubType, globalID = GetActionInfo(slot)
    local oldID = self.character.actions[spec][slot]
    self:DebugPrint("Action Slot "..slot.." changed:",
      (actionType or "")..",",
      (actionID or "")..",",
      (actionSubType or "")..",",
      (globalID or "")..",",
      (oldID or "")
    )
    if oldID and (actionType ~= "spell" or globalID ~= oldID) then
      if not self.character.unlearned then self.character.unlearned = {} end
      if not self.character.unlearned[spec] then self.character.unlearned[spec] = {} end
      if not self.character.unlearned[spec][slot] then self.character.unlearned[spec][slot] = {} end
      self.character.unlearned[spec][slot][oldID] = true
    end
  end
end
function LA:UI_ERROR_MESSAGE()
  if self.untalenting then
    self:UnregisterEvent("ACTIONBAR_SLOT_CHANGED")
    self:UnregisterEvent("UI_ERROR_MESSAGE")
    self:UnregisterEvent("PLAYER_TALENT_UPDATE")
    self.untalenting = false
  end
end
function LA:PLAYER_LOGOUT()
  self:SaveActionBars()
end
local function unRankSpell(spell)
  local rank = string.match(spell, "%s*%([^%)]*%)%s*")
  local rankNumber
  if rank then
    match = string.gsub(rank, "[%(%)]", "%%%1") -- turn rank into a match expression
    spell = string.gsub(spell, match, "")
    rankNumber = string.match(rank, "%d+")
  end
  return spell, rankNumber
end
function LA:CHAT_MSG_SYSTEM(message)
  local spell = string.match(message, patterns.learnSpell)
  local rank
  if not spell then spell = string.match(message, patterns.learnAbility) end
  if spell then
    spell, rank = unRankSpell(spell)
    self.spellsLearned[spell] = rank or ""
    return
  end
  spell = string.match(message, patterns.unlearnSpell)
  if spell then
    --LearningAid:DebugPrint("Unlearned", spell)
    spell, rank = unRankSpell(spell)
    self.spellsUnlearned[spell] = rank or ""
    return
  end
  spell = string.match(message, patterns.petLearnAbility)
  if not spell then spell = string.match(message, patterns.petLearnSpell) end
  if spell then
    spell, rank = unRankSpell(spell)
    self.petLearned[spell] = rank or ""
    return
  end
  if not spell then spell = string.match(message, patterns.petUnlearnSpell) end
  if spell then
    spell, rank = unRankSpell(spell)
    self.petUnlearned[spell] = rank or ""
    return
  end
end
function LA:PET_TALENT_UPDATE()
  if self.saved.filterSpam == LA.FILTER_SUMMARIZE then
    local petLearned = formatSpells(self.petLearned)
    local petUnlearned = formatSpells(self.petUnlearned)
    if string.len(petUnlearned) > 0 then systemPrint(self:GetText("yourPetHasUnlearned", petUnlearned)) end
    if string.len(petLearned) > 0 then systemPrint(self:GetText("yourPetHasLearned", petLearned)) end
  end
  wipe(self.petLearned)
  wipe(self.petUnlearned)
end
function LA:PLAYER_LEVEL_UP()
  if self.saved.filterSpam == LA.FILTER_SUMMARIZE then
    local petLearned = formatSpells(self.petLearned)
    local petUnlearned = formatSpells(self.petUnlearned)
    if string.len(petUnlearned) > 0 then systemPrint(self:GetText("yourPetHasUnlearned", petUnlearned)) end
    if string.len(petLearned) > 0 then systemPrint(self:GetText("yourPetHasLearned", petLearned)) end
  end
  wipe(self.petLearned)
  wipe(self.petUnlearned)
end
function LA:ProcessQueue()
  if self.inCombat then
    self:DebugPrint("ProcessQueue(): Cannot process action queue during combat.")
    return
  end
  local queue = self.queue
  for index = 1, #queue do
    local item = queue[index]
    if item.action == "ADD" then
      self:AddButton(item.kind, item.id)
    elseif item.action == "CLEAR" then
      self:ClearButtonID(item.kind, item.id)
    elseif item.kind == BOOKTYPE_SPELL then
      if item.action == "LEARN" then
        self:AddSpell(item.id)
      elseif item.action == "FORGET" then
        self:RemoveSpell(item.id)
      else
        self:DebugPrint("ProcessQueue(): Invalid action type " .. item.action)
      end
    elseif item.kind == "CRITTER" or item.kind == "MOUNT" then
      if item.action == "LEARN" then
        self:AddCompanion(item.kind, item.id)
      else
        self:DebugPrint("ProcessQueue(): Invalid action type " .. item.action)
      end
    elseif item.kind == "HIDE" then
      self:Hide()
    else
      self:DebugPrint("ProcessQueue(): Invalid entry type " .. item.kind)
    end
  end
  self.queue = {}
end
function LA:CreateButton()
  local frame = self.frame
  local buttons = frame.buttons
  local count = #buttons
  -- button global variable names start with "SpellButton" to work around an
  -- issue with the Blizzard Feedback Tool used in beta and on the PTR
  local name = "SpellButton_LearningAid_"..(count + 1)
  local button = CreateFrame("CheckButton", name, frame, "LearningAidSpellButtonTemplate")
  local background = _G[name.."Background"]
  background:Hide()
  local subSpellName = _G[name.."SubSpellName"]
  subSpellName:SetTextColor(NORMAL_FONT_COLOR.r - 0.1, NORMAL_FONT_COLOR.g - 0.1, NORMAL_FONT_COLOR.b - 0.1)
  buttons[count + 1] = button
  button.index = count + 1
  if count > 0 then
    -- position relative to button above
    button:SetPoint("TOP", buttons[count], "BOTTOM", 0, -self.buttonSpacing)
  else
    -- position relative to header
    button:SetPoint("TOPLEFT", frame.titleBar, "BOTTOMLEFT", 16, 0)
  end
  button:SetAttribute("type*", "spell")
  button:SetAttribute("type3", "hideButton")
  button:SetAttribute("alt-type*", "hideButton")
  button:SetAttribute("shift-type1", "linkSpell")
  button.hideButton = function(spellButton, mouseButton, down)
    if not self.inCombat then
      self:ClearButtonIndex(spellButton.index)
    end
  end
  button.linkSpell = function (...) self:SpellButton_OnModifiedClick(...) end
  button.iconTexture = _G[name.."IconTexture"]
  button.cooldown = _G[name.."Cooldown"]
  return button
end
function LA:AddButton(kind, id)
  if kind == BOOKTYPE_SPELL then
    if id > #self.spellBookCache or id < 1 then
      self:DebugPrint("AddButton(): Invalid spell ID", id)
      return
    end
  elseif kind == "MOUNT" or kind == "CRITTER" then
    if id < 1 or id > GetNumCompanions(kind) then
      self:DebugPrint("AddButton(): Invalid companion, type", kind, "ID", id)
      return
    end
  end
  local frame = self.frame
  local buttons = frame.buttons
  local visible = self:GetVisible()
  for i = 1, visible do
    if buttons[i].kind == kind and buttons[i]:GetID() == id then
      return
    end
  end
  local button
  -- if bar is full
  if visible == #buttons then
    button = self:CreateButton()
    self:DebugPrint("Adding button id "..id.." index "..button.index)
  else
  -- if bar has free buttons
    button = buttons[frame.visible + 1]
    self:DebugPrint("Changing button index "..(frame.visible + 1).." from id "..button:GetID().." to "..id)
    button:Show()
  end

  button.kind = kind
  self:SetVisible(visible + 1)
  button:SetID(id)
  button:SetChecked(false)
  
  if kind == BOOKTYPE_SPELL then
    if id > 1 then
      local name, rank = GetSpellName(id, BOOKTYPE_SPELL)
      local prevName, prevRank = GetSpellName(id - 1, BOOKTYPE_SPELL)
      if name == prevName then
        self:DebugPrint("Found new rank of existing ability "..name.." "..prevRank)
        self:ClearButtonID(kind, id - 1)
      else
        self:DebugPrint(name.." ~= "..prevName)
      end
    end
    if IsSelectedSpell(id, kind) then
      button:SetChecked(true)
    end
  elseif kind == "MOUNT" or kind == "CRITTER" then
    -- button.Companion = name
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(kind, id)
    if isSummoned then
      button:SetChecked(true)
    end
  else
    self:DebugPrint("AddButton(): Invalid button type "..kind)
  end
  self:UpdateButton(button)
  frame:Show()
end
function LA:ClearButtonID(kind, id)
  local frame = self.frame
  local buttons = frame.buttons
  local i = 1
  -- not using a for loop because frame.visible may change during the loop execution
  while i <= self:GetVisible() do
    if buttons[i].kind == kind and buttons[i]:GetID() == id then
      self:DebugPrint("Clearing button "..i.." with ID "..buttons[i]:GetID())
      self:ClearButtonIndex(i)
    else
      self:DebugPrint("Button "..i.." has id "..buttons[i]:GetID().." which does not match "..id)
      i = i + 1
    end
  end
end
function LA:ClearButtonIndex(index)
-- I have buttons 1 2 3 (4 5)
-- I remove button 2
-- I want 1 3 (3 4 5)
-- before, visible = 3
-- after, visible = 2
  local frame = self.frame
  local buttons = frame.buttons
  for i = index, frame.visible - 1 do
    local button = buttons[i]
    local nextButton = buttons[i + 1]
    button:SetID(nextButton:GetID())
    button:SetChecked(nextButton:GetChecked())
    button.kind = nextButton.kind
    button.iconTexture:SetVertexColor(nextButton.iconTexture:GetVertexColor())
    local cooldown = button.cooldown
    local nextCooldown = nextButton.cooldown
    cooldown.start = nextCooldown.start
    cooldown.duration = nextCooldown.duration
    cooldown.enable = nextCooldown.enable
    if cooldown.start and cooldown.duration and cooldown.enable then 
      CooldownFrame_SetTimer(cooldown, cooldown.start, cooldown.duration, cooldown.enable)
    else
      cooldown:Hide()
    end
    --if buttons[i]:IsShown() then
    self:UpdateButton(button)
    --end
  end
  local visible = self:GetVisible()
  buttons[visible]:Hide()
  self:SetVisible(visible - 1)
end
function LA:SetVisible(visible)
  frame = self.frame
  frame.visible = visible
  local top, left = frame:GetTop(), frame:GetLeft()
  frame:SetHeight(self.titleHeight + 10 + (self.buttonSize + self.buttonSpacing) * visible)
  frame:ClearAllPoints()
  frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", left, top)
  if visible == 0 then
    frame:Hide()
  end
end
function LA:GetVisible()
  return self.frame.visible
end
function LA:Hide()
  local frame = self.frame
  if not self.inCombat then
    for i = 1, frame.visible do
      frame.buttons[i]:SetChecked(false)
      frame.buttons[i]:Hide()
    end
    frame.visible = 0
    frame:Hide()
  else
    table.insert(self.queue, { kind = "HIDE" })
  end
end
function LA:TestAdd(kind, ...)
  print("Testing!")
  local t = {...}
  for i = 1, #t do
    local id = t[i]
    if kind == BOOKTYPE_SPELL then
      if GetSpellInfo(id, kind) and not IsPassiveSpell(id, kind) then
        print("Test: Adding button with spell id "..id)
        if self.inCombat then
          table.insert(self.queue, { action = "ADD", id = id, kind = kind })
        else
          self:AddButton(kind, id)
        end
      else
        print("Test: Spell id "..id.." is passive or does not exist")
      end
    elseif kind == "CRITTER" or kind == "MOUNT" then
      if GetCompanionInfo(kind, id) then
        print("Test: Adding companion type "..kind.." id "..id)
        if self.inCombat then
          table.insert(self.queue, { action = "ADD", id = id, kind = kind})
        else
          self:AddButton(kind, id)
        end
      else
        print("Test: Companion type "..kind..", id "..id.." does not exist")
      end
    else
      print("Test: Action type "..kind.." is not valid.  Valid types are spell, CRITTER or MOUNT.")
    end
  end
end
function LA:TestRemove(kind, ...)
  print("Testing!")
  local t = {...}
  for i = 1, #t do
    local id = t[i]
    print("Test: Removing "..kind.." id "..id)
    if self.inCombat then
      table.insert(self.queue, { action = "CLEAR", id = id, kind = kind })
    else
      self:ClearButtonID(kind, id)
    end
  end
end
function LA:DebugPrint(...)
  if self.saved.debug and self.saved.enabled then
    print(self:GetText("title")..":", ...)
  end
end
function LA:OnShow()
  self:RegisterEvent("COMPANION_UPDATE", "OnEvent")
  self:RegisterEvent("TRADE_SKILL_SHOW", "OnEvent")
  self:RegisterEvent("TRADE_SKILL_CLOSE", "OnEvent")
  self:RegisterEvent("SPELL_UPDATE_COOLDOWN", "OnEvent")
  self:RegisterEvent("CURRENT_SPELL_CAST_CHANGED", "OnEvent")
end
function LA:OnHide()
  self:UnregisterEvent("COMPANION_UPDATE")
  self:UnregisterEvent("TRADE_SKILL_SHOW")
  self:UnregisterEvent("TRADE_SKILL_CLOSE")
  self:UnregisterEvent("SPELL_UPDATE_COOLDOWN")
  self:UnregisterEvent("CURRENT_SPELL_CAST_CHANGED")
end
function LA:Lock()
    self.saved.locked = true
    self.menuTable[1].text = self:GetText("unlockPosition")
end
function LA:Unlock()
    self.saved.locked = false
    self.menuTable[1].text = self:GetText("lockPosition")
end
function LA:ToggleLock()
  if self.saved.locked then
    self:Unlock()
  else
    self:Lock()
  end
end
