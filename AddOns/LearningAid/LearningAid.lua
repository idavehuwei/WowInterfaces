-- Learning Aid v1.07.1 by Jamash (Kil'jaeden-US)
LearningAid = LibStub("AceAddon-3.0"):NewAddon("LearningAid", "AceConsole-3.0", "AceEvent-3.0")
local LA = LearningAid
LA.Localization = {};
local L =LA.Localization;

local firstLoad = true;
-- Localizations
if (GetLocale() == "zhCN") then
	L["LearningAidConfig"] = "法术助手配置";
	L["Lock Frame"] = "锁定窗口";
	L["Locks the Learning Aid frame so it cannot by moved by accident."] = "锁定法术助手窗口以避免意外的拖动";
	 L["Restore Actions"] = "恢复键位";
	L["When re-learning talent-based abilities, restore their position on your action bars."] = "将因天赋重新配置而获得的法术放回原动作条所在位置";
	L["Show Learn/Unlearn Messages"] = "显示学习法术信息";
	L['Show All: Blizzard default.  Summarize: Reduce the messages to a one or two line compact form.  Show None: Do not display any learn/unlearn messages in the chat log.'] = "全部显示：暴雪缺省；摘要：减少信息以紧凑方式显示；不显示：不在聊天记录中显示任何法术学习信息。";
	L["Show All"] = "全部显示";
	L["Summarize"] = "摘要";
	L["Show None"] = "不显示";
	L["Debug Output"] = "调试输出";
	L["Enables / disables printing debugging information to the chat frame."] = "是否在聊天窗口中显示调试信息";
	L["Reset Position"] = "重置位置";
	L["Reset the position of the Learning Aid frame to the default."] = "重置法术助手窗口的位置";
	L["Find Missing Abilities"] = "查寻遗漏技能";
	L["Search the spellbook and action bars to find spells or abilities which are not on any action bar."] = "通过搜索法术书和动作条来查找未放入动作条的遗漏法术或技能";
	L["Search"] = "大脚一下";	
	L["Find Tracking Abilities"] = "查寻追踪技能";
	L["If enabled, Find Missing Abilities will search for tracking abilities as well."] = "如果开启，查寻遗漏技能将搜索追踪技能";
	L["Find Shapeshift Forms"] = "查寻形态";
	L["If enabled, Find Missing Abilities will search for forms, auras, stances, presences, etc."] = "如果开启，查寻遗漏技能将搜索形态、光环、姿态等";
	L["Search Macros"] = "查寻宏";
	L["If enabled, Find Missing Abilities will search inside macros for spells."] = "如果开启，查寻遗漏技能将搜索内部法术宏";
	L["Unlock frame"] = "解锁窗口";
	L["Unlocks the Learning Aid frame so it can be moved."] = "解锁法术助手窗口，使其可以被移动";
	L["Configure"] = "开启配置";
	L["Open the Learning Aid configuration panel."] = "打开法术助手配置面板";
	L["Test"] = "测试";
	L["Perform various tests with Learning Aid."] = "执行各种法术助手的测试";
	L["Add"] = "添加";
	L["Add a button to the Learning Aid frame."] = "在法术助手窗口上添加一个法术";
	L["Mount"] = "坐骑";
	L["Critter (Minipet)"] = "小动物";
	L["Remove a button from the Learning Aid frame."] = "在法术助手窗口上移除一个法术";
	L["Spell"] = "法术";
	L["Button"] = "按钮";
	L["RandomMount"] = "随机坐骑";
	L["Mount"] = "坐骑";
elseif (GetLocale() == "zhTW") then
	L["LearningAidConfig"] = "法術助手配置";
	L["Lock Frame"] = "鎖定窗口";
	L["Locks the Learning Aid frame so it cannot by moved by accident."] = "鎖定法術助手窗口以避免意外的拖動";
	 L["Restore Actions"] = "恢復鍵位";
	L["When re-learning talent-based abilities, restore their position on your action bars."] = "將因天賦重新配置而獲得的法術放回原動作條所在位置";
	L["Show Learn/Unlearn Messages"] = "顯示學習法術資訊";
	L['Show All: Blizzard default.  Summarize: Reduce the messages to a one or two line compact form.  Show None: Do not display any learn/unlearn messages in the chat log.'] = "全部顯示：暴雪缺省；摘要：減少資訊以緊湊方式顯示；不顯示：不在聊天記錄中顯示任何法術學習資訊。";
	L["Show All"] = "全部顯示";
	L["Summarize"] = "摘要";
	L["Show None"] = "不顯示";
	L["Debug Output"] = "調試輸出";
	L["Enables / disables printing debugging information to the chat frame."] = "是否在聊天視窗中顯示調試資訊";
	L["Reset Position"] = "重置位置";
	L["Reset the position of the Learning Aid frame to the default."] = "重置法術助手窗口的位置";
	L["Find Missing Abilities"] = "查尋遺漏技能";
	L["Search the spellbook and action bars to find spells or abilities which are not on any action bar."] = "通過搜索法術書和動作條來查找未放入動作條的遺漏法術或技能";
	L["Search"] = "大腳一下";	
	L["Find Tracking Abilities"] = "查尋追蹤技能";
	L["If enabled, Find Missing Abilities will search for tracking abilities as well."] = "如果開啟，查尋遺漏技能將搜索追蹤技能";
	L["Find Shapeshift Forms"] = "查尋形態";
	L["If enabled, Find Missing Abilities will search for forms, auras, stances, presences, etc."] = "如果開啟，查尋遺漏技能將搜索形態、光環、姿態等";
	L["Search Macros"] = "查尋宏";
	L["If enabled, Find Missing Abilities will search inside macros for spells."] = "如果開啟，查尋遺漏技能將搜索內部法術宏";
	L["Unlock frame"] = "解鎖窗口";
	L["Unlocks the Learning Aid frame so it can be moved."] = "解鎖法術助手視窗，使其可以被移動";
	L["Configure"] = "開啟配置";
	L["Open the Learning Aid configuration panel."] = "打開法術助手配置面板";
	L["Test"] = "測試";
	L["Perform various tests with Learning Aid."] = "執行各種法術助手的測試";
	L["Add"] = "添加";
	L["Add a button to the Learning Aid frame."] = "在法術助手視窗上添加一個法術";
	L["Mount"] = "坐騎";
	L["Critter (Minipet)"] = "小動物";
	L["Remove a button from the Learning Aid frame."] = "在法術助手視窗上移除一個法術";
	L["Spell"] = "法術";
	L["Button"] = "按鈕";
	L["RandomMount"] = "隨即坐騎";
	L["Mount"] = "坐騎";
else
	L["LearningAidConfig"] = "LearningAidConfig";
	L["Locks the Learning Aid frame so it cannot by moved by accident."] = "Locks the Learning Aid frame so it cannot by moved by accident.";
	L["When re-learning talent-based abilities, restore their position on your action bars."] = "When re-learning talent-based abilities, restore their position on your action bars.";
	L['Show All: Blizzard default.  Summarize: Reduce the messages to a one or two line compact form.  Show None: Do not display any learn/unlearn messages in the chat log.'] = "Show All: Blizzard default.  Summarize: Reduce the messages to a one or two line compact form.  Show None: Do not display any learn/unlearn messages in the chat log.";
	L["Enables / disables printing debugging information to the chat frame."] = "Enables / disables printing debugging information to the chat frame.";
	L["Reset the position of the Learning Aid frame to the default."] = "Reset the position of the Learning Aid frame to the default.";
	L["Find Missing Abilities"] = "Find Missing Abilities";
	L["Search the spellbook and action bars to find spells or abilities which are not on any action bar."] = "Search the spellbook and action bars to find spells or abilities which are not on any action bar.";
	L["If enabled, Find Missing Abilities will search for tracking abilities as well."] = "If enabled, Find Missing Abilities will search for tracking abilities as well.";
	L["If enabled, Find Missing Abilities will search for forms, auras, stances, presences, etc."] = "If enabled, Find Missing Abilities will search for forms, auras, stances, presences, etc.";
	L["If enabled, Find Missing Abilities will search inside macros for spells."] = "If enabled, Find Missing Abilities will search inside macros for spells.";
	L["Unlocks the Learning Aid frame so it can be moved."] = "Unlocks the Learning Aid frame so it can be moved.";
	L["Open the Learning Aid configuration panel."] = "Open the Learning Aid configuration panel.";
	L["Perform various tests with Learning Aid."] = "Perform various tests with Learning Aid.";
	L["Add a button to the Learning Aid frame."] = "Add a button to the Learning Aid frame.";
	L["Remove a button from the Learning Aid frame."] = "Remove a button from the Learning Aid frame.";
end

LA.strings = {}
LA.strings.enUS = {
  title = "Learning Aid",
  lockPosition = "Lock Position",
  unlockPosition = "Unlock Position",
  close = "Close",
  youHaveLearned = "You have learned %s.",
  youHaveUnlearned = "You have unlearned %s.",
  yourPetHasLearned = "Your pet has learned %s.",
  yourPetHasUnlearned = "Your pet has unlearned %s.",
  lockFrame = "Lock Frame",
}

LA.strings.zhCN = {
  title = "法术助手",
  lockPosition = "锁定",
  unlockPosition = "解锁",
  close = "关闭",
  youHaveLearned = "你已经学会 %s.",
  youHaveUnlearned = "你还没学习 %s.",
  yourPetHasLearned = "你的宠物已经学会 %s.",
  yourPetHasUnlearned = "你的宠物没学习 %s.",
  lockFrame = "锁定框架",
}

LA.strings.zhTW = {
  title = "法術助手",
  lockPosition = "鎖定",
  unlockPosition = "解鎖",
  close = "關閉",
  youHaveLearned = "你已經學會 %s.",
  youHaveUnlearned = "你還沒學習 %s.",
  yourPetHasLearned = "你的寵物已經學會 %s.",
  yourPetHasUnlearned = "你的寵物沒學習 %s.",
  lockFrame = "鎖定框架",
}

local FILTER_SHOW_ALL  = 0
local FILTER_SUMMARIZE = 1
local FILTER_SHOW_NONE = 2

-- Adapted from SpellBookFrame.lua
function LA:UpdateButton(button)
  local id = button:GetID();

  local name = button:GetName();
  local iconTexture = dwGetglobal(name.."IconTexture");
  local spellString = dwGetglobal(name.."SpellName");
  local subSpellString = dwGetglobal(name.."SubSpellName");
  local cooldown = dwGetglobal(name.."Cooldown");
  local autoCastableTexture = dwGetglobal(name.."AutoCastable");
  local highlightTexture = dwGetglobal(name.."Highlight");
  local normalTexture = dwGetglobal(name.."NormalTexture");
  if not self.inCombat then
    button:Enable();
  end

  if button.kind == BOOKTYPE_SPELL then

    local texture = GetSpellTexture(id, BOOKTYPE_SPELL);

    -- If no spell, hide everything and return
    if ( not texture or (strlen(texture) == 0) ) then
      iconTexture:Hide();
      spellString:Hide();
      subSpellString:Hide();
      cooldown:Hide();
      autoCastableTexture:Hide();
      SpellBook_ReleaseAutoCastShine(button.shine)
      button.shine = nil;
      highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
      button:SetChecked(0);
      normalTexture:SetVertexColor(1.0, 1.0, 1.0);
      return;
    end

    local start, duration, enable = GetSpellCooldown(id, BOOKTYPE_SPELL);
    CooldownFrame_SetTimer(cooldown, start, duration, enable);
    cooldown.start = start
    cooldown.duration = duration
    cooldown.enable = enable
    if ( enable == 1 ) then
      iconTexture:SetVertexColor(1.0, 1.0, 1.0);
    else
      iconTexture:SetVertexColor(0.4, 0.4, 0.4);
    end

    local spellName, subSpellName = GetSpellName(id, BOOKTYPE_SPELL);

    normalTexture:SetVertexColor(1.0, 1.0, 1.0);
    highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
    spellString:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);

  -- Set Secure Action Button attribute
    if not self.inCombat then
      button:SetAttribute("spell*", spellName)
    end

    iconTexture:SetTexture(texture);
    spellString:SetText(spellName);
    subSpellString:SetText(subSpellName);
    if ( subSpellName ~= "" ) then
      spellString:SetPoint("LEFT", button, "RIGHT", 4, 4);
    else
      spellString:SetPoint("LEFT", button, "RIGHT", 4, 2);
    end
  elseif button.kind == "MOUNT" or button.kind == "CRITTER" then

    -- Some companions have two names, the display name and the spell name
    -- Make sure to use the spell name for casting
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(button.kind, id)
    local spellName = GetSpellInfo(creatureSpellID);
    iconTexture:SetTexture(icon)
    spellString:SetText(creatureName)
    subSpellString:SetText("")
    if not self.inCombat then
      button:SetAttribute("spell*", spellName)
    end
  elseif (button.kind == "MACRO") then
	iconTexture:SetTexture("Interface\\Icons\\Ability_Mount_Charger")
	spellString:SetText(L["RandomMount"])
  end
  iconTexture:Show();
  spellString:Show();
  subSpellString:Show();
  --SpellButton_UpdateSelection(self);
end
-- Adapted from SpellBookFrame.lua
function LA:SpellButton_OnDrag(button)
  local id = button:GetID();
  if button.kind == BOOKTYPE_SPELL then
    PickupSpell(id, button.kind);
  elseif button.kind == "MOUNT" or button.kind == "CRITTER" then
    PickupCompanion(button.kind, id)
   elseif (button.kind == "MACRO") then
	PickupMacro(L["Mount"]);
  end
end
-- Adapted from SpellBookFrame.lua
function LA:SpellButton_OnEnter(button)
  local id = button:GetID();
  local kind = button.kind
  GameTooltip:SetOwner(button, "ANCHOR_RIGHT");
  if kind == BOOKTYPE_SPELL then
    if GameTooltip:SetSpell(id, BOOKTYPE_SPELL) then
      button.UpdateTooltip = function (...) self:SpellButton_OnEnter(...) end
    else
      button.UpdateTooltip = nil
    end
  elseif kind == "MOUNT" or kind == "CRITTER" then
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(kind, id)
    if GameTooltip:SetHyperlink("spell:"..creatureSpellID) then
      button.UpdateTooltip = function (...) self:SpellButton_OnEnter(...) end
    else
      button.UpdateTooltip = nil;
    end
  elseif (kind == "MACRO") then
	GameTooltip:SetText(L["RandomMount"]);
  else
    print("Invalid button type in LearningAid:SpellButton_OnEnter: "..button.kind)
  end
end
-- Adapted from SpellBookFrame.lua
function LA:SpellButton_UpdateSelection(button)
  if button.kind == BOOKTYPE_SPELL then
    local id = button:GetID()
    if IsSelectedSpell(id, BOOKTYPE_SPELL) then
      button:SetChecked("true");
    else
      button:SetChecked("false");
    end
  end
end
-- Adapted from SpellBookFrame.lua
function LA:SpellButton_OnModifiedClick(spellButton, mouseButton)
  local id = spellButton:GetID()
  local spellName, subSpellName
  if spellButton.kind == BOOKTYPE_SPELL then
    if ( id > MAX_SPELLS ) then
      return;
    end
    if ( IsModifiedClick("CHATLINK") ) then
      if ( MacroFrame and MacroFrame:IsShown() ) then
        spellName, subSpellName = GetSpellName(id, BOOKTYPE_SPELL);
          if ( spellName and not IsPassiveSpell(id, BOOKTYPE_SPELL) ) then
            if ( subSpellName and (strlen(subSpellName) > 0) ) then
              ChatEdit_InsertLink(spellName.."("..subSpellName..")");
            else
              ChatEdit_InsertLink(spellName);
            end
          end
        return;
      else
        local spellLink = GetSpellLink(id, BOOKTYPE_SPELL);
          if(spellLink) then
            ChatEdit_InsertLink(spellLink);
          end
        return;
      end
    end
    if ( IsModifiedClick("PICKUPACTION") ) then
      PickupSpell(id, BOOKTYPE_SPELL);
      return;
    end
  elseif spellButton.kind == "MOUNT" or spellButton.kind == "CRITTER" then
    local creatureID, creatureName, creatureSpellID, icon, isSummoned = GetCompanionInfo(spellButton.kind, id)
    if ( IsModifiedClick("CHATLINK") ) then
      if ( MacroFrame and MacroFrame:IsShown() ) then
        local spellName = GetSpellInfo(creatureSpellID);
        ChatEdit_InsertLink(spellName);
      else
        local spellLink = GetSpellLink(creatureSpellID)
        ChatEdit_InsertLink(spellLink);
      end
    elseif ( IsModifiedClick("PICKUPACTION") ) then
      self.SpellButton_OnDrag(spellButton);
    end
  end
end


local patterns = {
  learnAbility = ERR_LEARN_ABILITY_S,
  learnSpell   = ERR_LEARN_SPELL_S,
  unlearnSpell = ERR_SPELL_UNLEARNED_S,
  petLearnAbility = ERR_PET_LEARN_ABILITY_S,
  petLearnSpell = ERR_PET_LEARN_SPELL_S,
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
     (LA.saved.filterSpam == FILTER_SHOW_NONE) or
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
  filterSpam = FILTER_SUMMARIZE
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
	if not DuowanAddon_LearningAid_Saved then DuowanAddon_LearningAid_Saved = {} end
	if not LearningAid_Character then LearningAid_Character = {} end
		self.saved = DuowanAddon_LearningAid_Saved
		self.character = LearningAid_Character
		self.version = "1.07.1"
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
        name = L["Lock Frame"],
        desc = L["Locks the Learning Aid frame so it cannot by moved by accident."],
        type = "toggle",
        set = function(info, val) if val then self:Lock() else self:Unlock() end end,
        get = function(info) return self.saved.locked end,
        width = "full",
        order = 1
      },
      restoreactions = {
        name = L["Restore Actions"],
        desc = L["When re-learning talent-based abilities, restore their position on your action bars."],
        type = "toggle",
        set = function(info, val) if val then self.saved.restoreActions = val end end,
        get = function(info) return self.saved.restoreActions end,
        width = "full",
        order = 2
      },
      filter = {
        name = L["Show Learn/Unlearn Messages"],
        desc = L['Show All: Blizzard default.  Summarize: Reduce the messages to a one or two line compact form.  Show None: Do not display any learn/unlearn messages in the chat log.'],
        type = "select",
        values = {
          [FILTER_SHOW_ALL ] = L["Show All"],
          [FILTER_SUMMARIZE] = L["Summarize"],
          [FILTER_SHOW_NONE] = L["Show None"]
        },
        set = function(info, val)
          self.saved.filterSpam = val
          if val ~= FILTER_SHOW_ALL then
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
        name = L["Debug Output"],
        desc = L["Enables / disables printing debugging information to the chat frame."],
        type = "toggle",
        set = function(info, val) self.saved.debug = val end,
        get = function(info) return self.saved.debug end,
        width = "full",
        order = 99
      },
      reset = {
        name = L["Reset Position"],
        desc = L["Reset the position of the Learning Aid frame to the default."],
        type = "execute",
        func = "ResetFramePosition",
        width = "full",
        order = 4
      },
      missing = {
        type = "group",
        inline = true,
        name = L["Find Missing Abilities"],
        order = 10,
        args = {
          search = {
            name = L["Search"],
            desc = L["Search the spellbook and action bars to find spells or abilities which are not on any action bar."],
            type = "execute",
            func = "FindMissingActions",
--            width = "full",
            order = 1
          },
          tracking = {
            name = L["Find Tracking Abilities"],
            desc = L["If enabled, Find Missing Abilities will search for tracking abilities as well."],
            type = "toggle",
            set = function(info, val) self.saved.tracking = val end,
            get = function(info, val) return self.saved.tracking end,
            width = "full",
            order = 2
          },
          shapeshift = {
            name = L["Find Shapeshift Forms"],
            desc = L["If enabled, Find Missing Abilities will search for forms, auras, stances, presences, etc."],
            type = "toggle",
            set = function(info, val) self.saved.shapeshift = val end,
            get = function(info, val) return self.saved.shapeshift end,
            width = "full",
            order = 3
          },
          macros = {
            name = L["Search Macros"],
            desc = L["If enabled, Find Missing Abilities will search inside macros for spells."],
            type = "toggle",
            set = function(info, val) self.saved.macros = val end,
            get = function(info, val) return self.saved.macros end,
            width = "full",
            order = 4
          }
        }
      },
      unlock = {
        name = "Unlock frame",
        desc = L["Unlocks the Learning Aid frame so it can be moved."],
        type = "execute",
        guiHidden = true,
        func = "Unlock"
      },
      config = {
        name = "Configure",
        desc = L["Open the Learning Aid configuration panel."],
        type = "execute",
        func = function() InterfaceOptionsFrame_OpenToCategory(self.optionsFrame) end,
        guiHidden = true
      },
      test = {
        type = "group",
        name = "Test",
        desc = L["Perform various tests with Learning Aid."],
        guiHidden = true,
        args = {
          add = {
            type = "group",
            name = "Add",
            desc = L["Add a button to the Learning Aid frame."],
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
            desc = L["Remove a button from the Learning Aid frame."],
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

 --LibStub("AceConfig-3.0"):RegisterOptionsTable(L["LearningAidConfig"], self.options, {"la", "learningaid"})
 LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable(L["LearningAidConfig"], self.options);

 --self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["LearningAidConfig"], self:GetText("title"))
 hooksecurefunc("ConfirmTalentWipe", function() 
	if (self.saved.enabled) then
		self:DebugPrint("ConfirmTalentWipe")
		self:SaveActionBars()
		self.untalenting = true
		self.spellsUnlearned = {}
		self:RegisterEvent("ACTIONBAR_SLOT_CHANGED", "OnEvent")
		self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
		self:RegisterEvent("UI_ERROR_MESSAGE", "OnEvent")
	end
 end)

 hooksecurefunc("LearnPreviewTalents", function(pet)
	if (self.saved.enabled) then
		self:DebugPrint("LearnPreviewTalents", pet)
		if pet == false then
				self:RegisterEvent("PLAYER_TALENT_UPDATE", "OnEvent")
				wipe(self.spellsLearned)
				self.learning = true
		end
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

function LA:Toggle(switch)
	if (switch) then
		self.saved.enabled = true
		self:RegisterEvent("SPELLS_CHANGED", "OnEvent");
		self:RegisterEvent("COMPANION_LEARNED", "OnEvent");			
		self:RegisterEvent("UNIT_SPELLCAST_START", "OnEvent");
		self:RegisterEvent("PLAYER_LEAVING_WORLD", "OnEvent");
		self:RegisterEvent("PLAYER_LOGOUT", "OnEvent");
		self:RegisterEvent("CHAT_MSG_SYSTEM", "OnEvent");
		self:RegisterEvent("PET_TALENT_UPDATE", "OnEvent");
		self:RegisterEvent("PLAYER_LEVEL_UP", "OnEvent");
		self:UpdateSpellBook();
		self:UpdateCompanions();		
		self:DiffActionBars();
		self:SaveActionBars();
	else
		self.saved.enabled = false
		self:Hide();
		self:UnregisterAllEvents();
	end
end

function LA:OnEnable()	
	self:DebugPrint("OnEnable()")
	self:RegisterEvent("VARIABLES_LOADED", "OnEvent");
	self:RegisterEvent("PLAYER_REGEN_DISABLED", "OnEvent");
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "OnEvent");
	  if self.saved.filterSpam ~= FILTER_SHOW_ALL then
			ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", spellSpamFilter)
	  end
end

function LA:OnDisable()
  self:Hide()
  if self.saved.filterSpam ~= FILTER_SHOW_ALL then
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

	if (firstLoad) then
		firstLoad = false;
		self:UpdateSpellBook();
		return;
	end

	if self.spellBookCache then
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
    if self.saved.filterSpam == FILTER_SUMMARIZE then 
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
    if self.saved.filterSpam == FILTER_SUMMARIZE then
      local unlearned = formatSpells(self.spellsUnlearned)
      if string.len(unlearned) > 0 then systemPrint(self:GetText("youHaveUnlearned", unlearned)) end
    end
    wipe(self.spellsUnlearned)
  elseif self.pendingTalentCount > 0 then --self.learning then
    self.pendingTalentCount = self.pendingTalentCount - 1
    if self.pendingTalentCount <= 0 then
      --self.learning = false
      if self.saved.filterSpam == FILTER_SUMMARIZE then
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
    if self.saved.filterSpam == FILTER_SUMMARIZE then
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
  if self.saved.filterSpam == FILTER_SUMMARIZE then
    local petLearned = formatSpells(self.petLearned)
    local petUnlearned = formatSpells(self.petUnlearned)
    if string.len(petUnlearned) > 0 then systemPrint(self:GetText("yourPetHasUnlearned", petUnlearned)) end
    if string.len(petLearned) > 0 then systemPrint(self:GetText("yourPetHasLearned", petLearned)) end
  end
  wipe(self.petLearned)
  wipe(self.petUnlearned)
end

function LA:PLAYER_LEVEL_UP()
  if self.saved.filterSpam == FILTER_SUMMARIZE then
		local petLearned = formatSpells(self.petLearned)
		local petUnlearned = formatSpells(self.petUnlearned)
		if string.len(petUnlearned) > 0 then systemPrint(self:GetText("yourPetHasUnlearned", petUnlearned)) end
		if string.len(petLearned) > 0 then systemPrint(self:GetText("yourPetHasLearned", petLearned)) end
  end
  wipe(self.petLearned)
  wipe(self.petUnlearned)
end

function LA:DiffActionBars()
	local spec = GetActiveTalentGroup()
	for slot = 1, 120 do
		local actionType = GetActionInfo(slot)
		-- local actionType, actionID, actionSubType, globalID = GetActionInfo(slot)
		if self.character.actions and 
			self.character.actions[spec] and
			self.character.actions[spec][slot] and
			not actionType then
			if not self.character.unlearned then self.character.unlearned = {} end
			if not self.character.unlearned[spec] then self.character.unlearned[spec] = {} end
			if not self.character.unlearned[spec][slot] then self.character.unlearned[spec][slot] = {} end
			self.character.unlearned[spec][slot][self.character.actions[spec][slot]] = true
		end
	end
end

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

-- 刷新法术数据, 存入缓存中
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

function LA:ProcessQueue()
	if self.inCombat or not self.saved.enabled then
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

function LA:DiffSpellBook()
	local i = 1
	local cache = self.spellBookCache
	local updated = false
	local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
	local spellGlobalID = self:GlobalSpellID(i)
	while spellName do
		if cache[i] == nil or cache[i].globalID ~= spellGlobalID then
			-- if spell removed
			if cache[i + 1] ~= nil and cache[i+1].globalID == spellGlobalID then
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

function LA:SpellButton_OnHide(button)
  self:DebugPrint("Hiding button "..button.index)
  button:SetChecked(false)
  button.iconTexture:SetVertexColor(1, 1, 1)
  button.cooldown:Hide()
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
	elseif (kind == "MACRO") then
	else
		print("AddButton(): Invalid button type "..kind)
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

function LA:FindMissingActions()
	if self.inCombat then
		print("Learning Aid: Cannot do that in combat.")
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
	-- 追踪技能
	for trackingType = 1, numTrackingTypes do
		local name, texture, active, category = GetTrackingInfo(trackingType)
		if category == BOOKTYPE_SPELL then
			tracking[name] = true
		end
	end
	
	-- 动作键
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
	
	-- 缓存中的数据
	for actionID, info in ipairs(self.spellBookCache) do
		if (not ranks[info.name]) or ranks[info.name].rank < info.rank then
			ranks[info.name] = info
		end
	end

	-- 姿态栏
	local numForms = GetNumShapeshiftForms()
	for form = 1, numForms do
		local formTexture, formName, formIsActive, formIsCastable = GetShapeshiftFormInfo(form)
		shapeshift[formName] = true
	end

	for spellName, info in pairs(ranks) do
		spellNameLower = string.lower(spellName)
		if 
			((not actions[info.spellBookID]) and (not info.passive)) and -- spell is not passive
			-- spell is not a tracking spell, or displaying tracking spells has been enabled
			((not tracking[spellName]) or self.saved.tracking) and
			((not shapeshift[spellName]) or self.saved.shapeshift) and
			(not macroSpells[spellNameLower])
		then
			self:DebugPrint("Spell "..info.name.." Rank "..info.rank.." is not on any action bar.")
			if macroSpells[spellNameLower] then 
				self:DebugPrint("Found spell in macro") 
			end
			results[#results + 1] = info
		end
	end

	table.sort(results, function (a, b) return a.spellBookID < b.spellBookID end)
	for result = 1, #results do
		self:AddButton(BOOKTYPE_SPELL, results[result].spellBookID)
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

-- Transforms a spellbook ID into a global spell ID
function LA:GlobalSpellID(id)
	local link = GetSpellLink(id, BOOKTYPE_SPELL)
	if link then
		local globalID = string.match(link, "Hspell:([^\124]+)\124")
		return tonumber(globalID)
	end
end

function LA:OpenConfig()
	 LibStub("AceConfigDialog-3.0"):Open(L["LearningAidConfig"]);
end

function LA:SetConfigVar(name, val)
	self.saved[name] = val;
end
