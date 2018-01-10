local LA = LearningAid
-- Adapted from SpellBookFrame.lua
function LA:UpdateButton(button)
  local id = button:GetID();

  local name = button:GetName();
  local iconTexture = getglobal(name.."IconTexture");
  local spellString = getglobal(name.."SpellName");
  local subSpellString = getglobal(name.."SubSpellName");
  local cooldown = getglobal(name.."Cooldown");
  local autoCastableTexture = getglobal(name.."AutoCastable");
  local highlightTexture = getglobal(name.."Highlight");
  local normalTexture = getglobal(name.."NormalTexture");
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
  else
    self:DebugPrint("Invalid button type in LearningAid:SpellButton_OnEnter: "..button.kind)
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
function LA:SpellButton_OnHide(button)
  self:DebugPrint("Hiding button "..button.index)
  button:SetChecked(false)
  button.iconTexture:SetVertexColor(1, 1, 1)
  button.cooldown:Hide()
end
