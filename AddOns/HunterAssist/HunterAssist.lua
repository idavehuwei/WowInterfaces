 HunterAssist = BLibrary("BEvent"); HunterAssist.H = BLibrary("BHook"); local HunterAssist_59897944f061764c83614dd61b947cf1 = HunterAssist; local HunterAssist_Enabled = false; local HunterAssist_460a7b5508d73d75379f9512c18b8ff7 = nil; function HunterAssistCasteBar_OnLoad(self) RegisterForSaveFrame(self); self:SetMinMaxValues(0, 1); self:SetValue(1); end local function HunterAssist_d39466a6ebd039b89f2f6c248571d6e7() if not HunterAssistCasteBar:IsVisible() then HunterAssistCasteBar:Hide(); end if HunterAssistCasteBar:IsShown() then local HunterAssist_a22192947cbcf5f27a4eaf500379d03d, HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 = HunterAssistCasteBar:GetMinMaxValues(); HunterAssistCasteBar:SetValue(HunterAssist_9226ee55ff8eed638d37ee13a4bdd517); HunterAssistCasteBar:SetStatusBarColor(0.0, 1.0, 0.0); HunterAssistCasteBarSpark:Hide(); HunterAssistCasteBarFlash:SetAlpha(0.0); HunterAssistCasteBarFlash:Show(); HunterAssistCasteBar.HunterAssist_711bd448e70fcda1d3cb30547ba1091a = nil; HunterAssistCasteBar.HunterAssist_4df1eb7ad5239e252fc1275e00a63f95 = 1; HunterAssistCasteBar.HunterAssist_aab0e64abc602fd891f90200569f5ef3 = 1; end end local function HunterAssist_446c39a4c9d0009e5820c001d4a61a51(HunterAssist_b48c6d810781a0aaca7a1daf572bf0a2) local HunterAssist_a22192947cbcf5f27a4eaf500379d03d, HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 = GetTime(); if (HunterAssist_b48c6d810781a0aaca7a1daf572bf0a2 and HunterAssist_b48c6d810781a0aaca7a1daf572bf0a2 == HUNTERASSIST_AUTO or HunterAssist_b48c6d810781a0aaca7a1daf572bf0a2 == HUNTERASSIST_AIMED) then HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 = HunterAssist_a22192947cbcf5f27a4eaf500379d03d + UnitRangedDamage("player"); HunterAssistCasteBar:SetStatusBarColor(1.0, 0.7, 0.0); HunterAssistCasteBar:SetMinMaxValues(HunterAssist_a22192947cbcf5f27a4eaf500379d03d, HunterAssist_9226ee55ff8eed638d37ee13a4bdd517); HunterAssistCasteBar:SetValue(HunterAssist_a22192947cbcf5f27a4eaf500379d03d); HunterAssistCasteBar:SetAlpha(1.0); HunterAssistCasteBar.HunterAssist_711bd448e70fcda1d3cb30547ba1091a = 1; HunterAssistCasteBar.HunterAssist_aab0e64abc602fd891f90200569f5ef3 = nil; HunterAssistCasteBarTextLeft:SetText(HUNTERASSIST_AUTO); HunterAssistCasteBarSpark:Show(); HunterAssistCasteBar:Show(); end end function HunterAssist_59897944f061764c83614dd61b947cf1:STOP_AUTOREPEAT_SPELL() HunterAssist_d39466a6ebd039b89f2f6c248571d6e7(); end function HunterAssist_59897944f061764c83614dd61b947cf1:PLAYER_LOGIN() self:STOP_AUTOREPEAT_SPELL(); end function HunterAssist_59897944f061764c83614dd61b947cf1:PLAYER_ENTERING_WORLD() self:STOP_AUTOREPEAT_SPELL(); end function HunterAssist_59897944f061764c83614dd61b947cf1:UNIT_SPELLCAST_SUCCEEDED(unit, spell) if (unit == "player") then HunterAssist_446c39a4c9d0009e5820c001d4a61a51(spell); end end function HunterAssistCasteBar_OnUpdate(self) if (not HunterAssist_Enabled) then return; end local HunterAssist_a22192947cbcf5f27a4eaf500379d03d, HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 = HunterAssistCasteBar:GetMinMaxValues(); if self.HunterAssist_711bd448e70fcda1d3cb30547ba1091a then local HunterAssist_238276267475ef8eca9456dbbcea0221 = GetTime(); if HunterAssist_238276267475ef8eca9456dbbcea0221 > HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 then HunterAssist_238276267475ef8eca9456dbbcea0221 = HunterAssist_9226ee55ff8eed638d37ee13a4bdd517; end HunterAssistCasteBarTextRight:SetText(format("%0.1f",HunterAssist_9226ee55ff8eed638d37ee13a4bdd517-HunterAssist_238276267475ef8eca9456dbbcea0221)); HunterAssistCasteBar:SetValue(HunterAssist_238276267475ef8eca9456dbbcea0221); HunterAssistCasteBarFlash:Hide(); local HunterAssist_4928c153be20ea6f51bc556ece98d72d = ((HunterAssist_238276267475ef8eca9456dbbcea0221 - HunterAssist_a22192947cbcf5f27a4eaf500379d03d) / (HunterAssist_9226ee55ff8eed638d37ee13a4bdd517 - HunterAssist_a22192947cbcf5f27a4eaf500379d03d)) * 195; if HunterAssist_4928c153be20ea6f51bc556ece98d72d < 0 then HunterAssist_4928c153be20ea6f51bc556ece98d72d = 0; end HunterAssistCasteBarSpark:SetPoint("CENTER", HunterAssistCasteBar, "LEFT", HunterAssist_4928c153be20ea6f51bc556ece98d72d, 0); elseif self.HunterAssist_4df1eb7ad5239e252fc1275e00a63f95 then local alpha = HunterAssistCasteBarFlash:GetAlpha() + CASTING_BAR_FLASH_STEP; if alpha < 1 then HunterAssistCasteBarFlash:SetAlpha(alpha); else HunterAssistCasteBarFlash:SetAlpha(1.0); self.HunterAssist_4df1eb7ad5239e252fc1275e00a63f95 = nil; end elseif self.HunterAssist_aab0e64abc602fd891f90200569f5ef3 then local alpha = self:GetAlpha() - CASTING_BAR_ALPHA_STEP; if alpha > 0 then self:SetAlpha(alpha); else self.HunterAssist_aab0e64abc602fd891f90200569f5ef3 = nil; self:Hide(); end end end function HunterAssistBar_Toggle(HunterAssist_43975aa4b29e368c1d658b08e332e857) if (HunterAssist_43975aa4b29e368c1d658b08e332e857) then HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("STOP_AUTOREPEAT_SPELL"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_REGEN_DISABLED"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_REGEN_ENABLED"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_LOGIN"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_ENTERING_WORLD"); HunterAssist_Enabled = true; else HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("STOP_AUTOREPEAT_SPELL"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("PLAYER_LOGIN"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("PLAYER_ENTERING_WORLD"); HunterAssist_d39466a6ebd039b89f2f6c248571d6e7(); HunterAssist_Enabled = false; end end function HunterAssistCasteBar_AjustPosition() if HunterAssistCasteBarMove:IsVisible() then HunterAssistCasteBarMove:Hide() HunterAssistCasteBar:Hide() else HunterAssistCasteBarMove:Show() HunterAssistCasteBar:Show() HunterAssistCasteBar:SetAlpha(1) HideUIPanel(ModManagementFrame); end end local groupmate = bit.bor( COMBATLOG_OBJECT_AFFILIATION_MINE, COMBATLOG_OBJECT_AFFILIATION_PARTY, COMBATLOG_OBJECT_REACTION_FRIENDLY, COMBATLOG_OBJECT_CONTROL_PLAYER, COMBATLOG_OBJECT_CONTROL_NPC, COMBATLOG_OBJECT_TYPE_PLAYER, COMBATLOG_OBJECT_TYPE_PET, COMBATLOG_OBJECT_TYPE_GUARDIAN, COMBATLOG_OBJECT_TYPE_OBJECT); local function UnitIsA(unitFlags, flagType) if (bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_AFFILIATION_MASK) > 0 and bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_REACTION_MASK) > 0 and bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_CONTROL_MASK) > 0 and bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_TYPE_MASK) > 0) or bit.band(bit.band(unitFlags, flagType), COMBATLOG_OBJECT_SPECIAL_MASK) > 0 then return true end return false end function HunterAssist_59897944f061764c83614dd61b947cf1:AntiDaze(guid) local buffID = self:IsBuffActive(HUNTERASSIST_ASPECT_ASPECT_PACK); if (guid == UnitGUID("player")) then buffID = self:IsBuffActive(HUNTERASSIST_ASPECT_CHEETAH); end if (buffID and type(buffID) == "number" and buffID >= 0) then CancelUnitBuff("player", buffID); end end function HunterAssistDaze_Toggle(HunterAssist_43975aa4b29e368c1d658b08e332e857) if (HunterAssist_43975aa4b29e368c1d658b08e332e857) then HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED_DOSE"); else HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "SPELL_AURA_APPLIED_DOSE"); end end function HunterAssist_59897944f061764c83614dd61b947cf1:SPELL_AURA_APPLIED(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...) if (UnitIsA(destFlags, groupmate)) then local spellName, spellSchool, auraType, amount = select(2, ...); if (auraType == "DEBUFF" and spellName == HUNTERASSIST_ASPECT_DAZED) then self:AntiDaze(destGUID); end end end function HunterAssist_59897944f061764c83614dd61b947cf1:SPELL_AURA_APPLIED_DOSE(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...) self:SPELL_AURA_APPLIED(timestamp, event, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...); end local enable_tracking = true; local tracking = {}; local orig_tracking_id = nil; local track_talent; local creature = { [HUNTERASSIST_BEAST] = "Beast"; [HUNTERASSIST_HUMANOID] = "Humanoid"; [HUNTERASSIST_UNDEAD] = "Undead"; [HUNTERASSIST_GIANT] = "Giant"; [HUNTERASSIST_ELEMENTAL] = "Elemental"; [HUNTERASSIST_DEMON] = "Demon"; [HUNTERASSIST_DRAGONKIN] = "Dragonkin"; }; local ignor_tracking_buff = { ["player"] = {5384, 13481}, ["target"] = {13481} }; function HunterAssist_59897944f061764c83614dd61b947cf1:UpdateTrackTalent() local name, iconTexture, tier, column, rank, maxRank, isExceptional, meetsPrereq = GetTalentInfo(3, 1); if (rank and rank >= 1) then track_talent = true; else track_talent = false; end end function HunterAssist_59897944f061764c83614dd61b947cf1:UpdateTrackingID() for id=1, GetNumTrackingTypes() do local name, texture, active, category = GetTrackingInfo(id); if ( name == GetSpellInfo(1494) ) then tracking["Beast"] = id; elseif ( name == GetSpellInfo(19883) )then tracking["Humanoid"] = id; elseif ( name == GetSpellInfo(19884) ) then tracking["Undead"] = id; elseif ( name == GetSpellInfo(19882) ) then tracking["Giant"] = id; elseif ( name == GetSpellInfo(19880) ) then tracking["Elemental"] = id; elseif ( name == GetSpellInfo(19878) ) then tracking["Demon"] = id; elseif ( name == GetSpellInfo(19879) ) then tracking["Dragonkin"] = id; end end end function HunterAssist_59897944f061764c83614dd61b947cf1:GetCurTrackingID() for id=1, GetNumTrackingTypes() do local name, texture, active, category = GetTrackingInfo(id); if (active) then return id; end end return false; end function HunterAssist_59897944f061764c83614dd61b947cf1:CanTracking() local spellName = GetSpellInfo(19883); local start, duration, enabled = GetSpellCooldown(spellName); if (duration == 0) then return true; else return false; end end local function delayTracking(trackingID) if (trackingID > 0 and HunterAssist_59897944f061764c83614dd61b947cf1:GetCurTrackingID() ~= tracingID and InCombatLockdown() and not HunterAssist_59897944f061764c83614dd61b947cf1:UnitHasIgnoreBuff() ) then SetTracking(trackingID); end end function HunterAssist_59897944f061764c83614dd61b947cf1:CastTracking() if (not track_talent) then return end local creatureType = UnitCreatureType("target"); local trackingID = 0; if (creatureType and creature[creatureType]) then if (UnitCanAttack("player", "target") and not UnitIsDeadOrGhost("target")) then trackingID = tracking[creature[creatureType]] or 0; end end if (trackingID > 0 and self:GetCurTrackingID() ~= trackingID) then if (not self:UnitHasIgnoreBuff() and self:CanTracking()) then SetTracking(trackingID); else BigFoot_DelayCall(delayTracking, 1.5, trackingID); end end end function HunterAssist_59897944f061764c83614dd61b947cf1:OnSkillChange() self:UpdateTrackingID(); end function HunterAssist_59897944f061764c83614dd61b947cf1:OnTalentChange() self:UpdateTrackTalent(); end function HunterAssist_59897944f061764c83614dd61b947cf1:PLAYER_REGEN_DISABLED() if HunterAssistCasteBarMove:IsVisible() then HunterAssistCasteBarMove:Hide(); end orig_tracking_id = self:GetCurTrackingID(); if (enable_tracking) then self:CastTracking(); end PetActionBar_UpdatePositionValues(); PetActionBarFrame.slideTimer=nil PetActionBarFrame:SetPoint("TOPLEFT", PetActionBarFrame:GetParent(), "BOTTOMLEFT", PETACTIONBAR_XPOS, PETACTIONBAR_YPOS); end function HunterAssist_59897944f061764c83614dd61b947cf1:UnitHasIgnoreBuff() local spellName, debuffName; local i = 1; if (ignor_tracking_buff.player) then local buffName = UnitAura("player", i,"HELPFUL"); while (buffName) do for k, v in pairs(ignor_tracking_buff.player) do spellName = GetSpellInfo(v); if (buffName == spellName) then return true; end end i = i +1; buffName = UnitAura("player", i,"HELPFUL"); end end if (ignor_tracking_buff.target) then i = 1; debuffName = UnitAura("target", i, "HARMFUL|PLAYER"); while (debuffName) do for k, v in ipairs(ignor_tracking_buff.target) do spellName = GetSpellInfo(v); if (debuffName == spellName) then return true; end end i = i +1; debuffName = UnitAura("target", i, "HARMFUL|PLAYER"); end end return false; end local function HunterAssist_ReTracking() if (enable_tracking and track_talent and orig_tracking_id and orig_tracking_id ~= HunterAssist_59897944f061764c83614dd61b947cf1:GetCurTrackingID() and not InCombatLockdown()) then if (HunterAssist_59897944f061764c83614dd61b947cf1:UnitHasIgnoreBuff() or not HunterAssist_59897944f061764c83614dd61b947cf1:CanTracking()) then BigFoot_DelayCall(HunterAssist_ReTracking, 0.5); else SetTracking(orig_tracking_id); end orig_tracking_id = nil; end end function HunterAssist_59897944f061764c83614dd61b947cf1:PLAYER_REGEN_ENABLED() HunterAssist_d39466a6ebd039b89f2f6c248571d6e7(); HunterAssist_ReTracking(); end function HunterAssistTracking_Toogle(switch) HunterAssist_59897944f061764c83614dd61b947cf1:UpdateTrackingID(); HunterAssist_59897944f061764c83614dd61b947cf1:UpdateTrackTalent(); if (switch) then enable_tracking = true; HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("CHAT_MSG_SKILL", "OnSkillChange"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("CHARACTER_POINTS_CHANGED", "OnTalentChange"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_REGEN_DISABLED"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_REGEN_ENABLED"); else enable_tracking = false; HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("CHAT_MSG_SKILL"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("CHARACTER_POINTS_CHANGED"); end end function HunterAssist_Toggle(HunterAssist_43975aa4b29e368c1d658b08e332e857) HunterAssistBar_Toggle(HunterAssist_43975aa4b29e368c1d658b08e332e857); HunterAssistDaze_Toggle(HunterAssist_43975aa4b29e368c1d658b08e332e857); HunterAssistTracking_Toogle(HunterAssist_43975aa4b29e368c1d658b08e332e857); end local aspectSpellID = { [1] = 13163, [2] = 13165, [3] = 61846, [4] = 5118, [5] = 13159, [6] = 13161, [7] = 20043, [8] = 34074, }; local aspectInfo = {}; local aspectNum = 0; function HunterAssist_59897944f061764c83614dd61b947cf1:CheckSpell(spell) local i, val = 1, nil; local spellName = GetSpellName(i, BOOKTYPE_SPELL); while (spellName) do if (spellName == spell) then val = i; end i = i + 1; spellName = GetSpellName(i, BOOKTYPE_SPELL); end return val; end function HunterAssist_59897944f061764c83614dd61b947cf1:UpdateAspectInfo() local name, rank, icon; local num = 0; for k, v in ipairs(aspectSpellID) do name, rank, icon = GetSpellInfo(v); if (name and self:CheckSpell(name)) then num = num + 1; aspectInfo[num] = aspectInfo[k] or {}; aspectInfo[num]["spellName"] = name; aspectInfo[num]["spellIcon"] = icon; aspectInfo[num]["spellID"] = v; end end aspectNum = num; end function HunterAssist_59897944f061764c83614dd61b947cf1:CreateAspectBar() if (getglobal("HuterAssistAspectButton1")) then return; end local button; for i=1, NUM_SHAPESHIFT_SLOTS, 1 do button = CreateFrame("CheckButton", "HuterAssistAspectButton" .. i, ShapeshiftBarFrame, "SecureActionButtonTemplate, ActionButtonTemplate"); button:SetHeight(30); button:SetWidth(30); button:RegisterForClicks("AnyUp"); button:SetPoint("CENTER", getglobal("ShapeshiftButton" .. i), "CENTER", 0, 0); button:SetNormalTexture(nil); button:SetAttribute("type", "spell"); local ssb = getglobal("ShapeshiftButton" .. i); setglobal("OldShapshiftButton" .. i, ssb); setglobal("ShapeshiftButton" .. i, button); button:SetFrameLevel(ssb:GetFrameLevel() + 2); button:SetScript("OnEnter", function(this) if ( GetCVar("UberTooltips") == "1" ) then GameTooltip_SetDefaultAnchor(GameTooltip, this); else GameTooltip:SetOwner(this, "ANCHOR_RIGHT"); end local spellName = aspectInfo[i]["spellName"]; local bookID = self:CheckSpell(spellName); GameTooltip:SetSpell(bookID, BOOKTYPE_SPELL); GameTooltip:Show(); end); button:SetScript("OnLeave", function(this) GameTooltip:Hide(); end); button:Hide(); ssb:Hide(); end ShapeshiftBarFrame:Show(); end function HunterAssist_GetNumShapeshiftForms(origfunc) local num = aspectNum or 0; num = (num > 0 and num) or origfunc(); return num; end function HunterAssist_59897944f061764c83614dd61b947cf1:GetInfoFromID(buttonID) if (aspectInfo[buttonID]) then return aspectInfo[buttonID].spellIcon, aspectInfo[buttonID].spellName; else return nil, nil; end end function HunterAssist_59897944f061764c83614dd61b947cf1:IsBuffActive(name) local i = 1; local buffName = UnitBuff("player", i); while (buffName) do if (buffName == name) then return i; end i = i +1; buffName = UnitBuff("player", i); end return false; end function HunterAssist_GetShapeshiftFormInfo(origfunc, buttonId) local texture, name, isActive, isCastable; texture, name = HunterAssist_59897944f061764c83614dd61b947cf1:GetInfoFromID(buttonId); if (name) then isActive = HunterAssist_59897944f061764c83614dd61b947cf1:IsBuffActive(name); isCastable = true; else texture, name, isActive, isCastable = origfunc(buttonId); end return texture, name, isActive, isCastable; end function HunterAssist_GetShapeshiftForm(origfunc, var) local texture, name, isActive, isCastable; for i=1, NUM_SHAPESHIFT_SLOTS, 1 do texture, name, isActive, isCastable = GetShapeshiftFormInfo(i); if (isActive) then return i; end end end function HunterAssist_GetShapeshiftFormCooldown(origfunc, buttonId) local texture, name = HunterAssist_59897944f061764c83614dd61b947cf1:GetInfoFromID(buttonId); local bookID = HunterAssist_59897944f061764c83614dd61b947cf1:CheckSpell(name); if (bookID > -1) then return GetSpellCooldown(bookID, BOOKTYPE_SPELL); end return origfunc(buttonId); end function HunterAssist_59897944f061764c83614dd61b947cf1:AspectButtonUpdate() local numForms = GetNumShapeshiftForms(); local texture, name, isActive, isCastable; local button, icon, cooldown, ssb; local start, duration, enable; ShapeshiftBar_Update(); for i=1, NUM_SHAPESHIFT_SLOTS do button = getglobal("HuterAssistAspectButton"..i); icon = getglobal("HuterAssistAspectButton"..i.."Icon"); if ( i <= numForms ) then texture, name, isActive, isCastable = GetShapeshiftFormInfo(i); icon:SetTexture(texture); cooldown = getglobal("HuterAssistAspectButton"..i.."Cooldown"); if ( texture ) then cooldown:Show(); else cooldown:Hide(); end self:UpdateAspectCooldown(); if ( isActive ) then button:SetChecked(1); else button:SetChecked(0); end if ( isCastable ) then icon:SetVertexColor(1.0, 1.0, 1.0); else icon:SetVertexColor(0.4, 0.4, 0.4); end button:SetAttribute("spell", name); button:SetNormalTexture(nil); button:Show(); else button:Hide(); end end end function HunterAssist_59897944f061764c83614dd61b947cf1:UpdateAspectCooldown() local numForms = GetNumShapeshiftForms(); local start, duration, enable, cooldown; for i=1, numForms do cooldown = getglobal("HuterAssistAspectButton"..i.."Cooldown"); start, duration, enable = GetShapeshiftFormCooldown(i); if (cooldown and start and duration) then CooldownFrame_SetTimer(cooldown, start, duration, enable); end end end function HunterAssist_59897944f061764c83614dd61b947cf1:UNIT_AURA(unit) if (unit == "player") then self:AspectButtonUpdate(); end end function HunterAssist_59897944f061764c83614dd61b947cf1:LEARNED_SPELL_IN_TAB() self:UpdateAspectInfo(); self:AspectButtonUpdate(); end function HunterAssist_59897944f061764c83614dd61b947cf1:ACTIONBAR_UPDATE_USABLE() self:AspectButtonUpdate(); end function HunterAssist_59897944f061764c83614dd61b947cf1:ACTIONBAR_UPDATE_COOLDOWN() self:UpdateAspectCooldown(); end function HunterAssist_59897944f061764c83614dd61b947cf1:UPDATE_BINDINGS() local numForms = GetNumShapeshiftForms(); ClearOverrideBindings(ShapeshiftBarFrame); for i = 1, numForms do local button = getglobal("HuterAssistAspectButton"..i); local key1, key2 = GetBindingKey("SHAPESHIFTBUTTON"..i); if (key1) then SetOverrideBindingClick(ShapeshiftBarFrame, true, key1, "HuterAssistAspectButton"..i); end if (key2) then SetOverrideBindingClick(ShapeshiftBarFrame, true, key2, "HuterAssistAspectButton"..i); end end end local function HunterAssistAspect_Hook(switch) if (switch) then HunterAssist_59897944f061764c83614dd61b947cf1.H:Hook("GetNumShapeshiftForms", HunterAssist_GetNumShapeshiftForms); HunterAssist_59897944f061764c83614dd61b947cf1.H:Hook("GetShapeshiftFormInfo", HunterAssist_GetShapeshiftFormInfo); HunterAssist_59897944f061764c83614dd61b947cf1.H:Hook("GetShapeshiftForm", HunterAssist_GetShapeshiftForm); HunterAssist_59897944f061764c83614dd61b947cf1.H:Hook("GetShapeshiftFormCooldown", HunterAssist_GetShapeshiftFormCooldown); else HunterAssist_59897944f061764c83614dd61b947cf1.H:Unhook("GetNumShapeshiftForms"); HunterAssist_59897944f061764c83614dd61b947cf1.H:Unhook("GetShapeshiftFormInfo"); HunterAssist_59897944f061764c83614dd61b947cf1.H:Unhook("GetShapeshiftForm"); HunterAssist_59897944f061764c83614dd61b947cf1.H:Unhook("GetShapeshiftFormCooldown"); end end local function HunterAssistAspect_Event(switch) if (switch) then HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("UNIT_AURA"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("LEARNED_SPELL_IN_TAB"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("ACTIONBAR_UPDATE_USABLE"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("UPDATE_BINDINGS"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN"); else HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("UNIT_AURA"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("LEARNED_SPELL_IN_TAB"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("ACTIONBAR_UPDATE_USABLE"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("UPDATE_BINDINGS"); HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("ACTIONBAR_UPDATE_COOLDOWN"); end end function HunterAssistAspect_Toggle(switch) HunterAssist_59897944f061764c83614dd61b947cf1:CreateAspectBar(); HunterAssist_59897944f061764c83614dd61b947cf1:UpdateAspectInfo(); HunterAssistAspect_Hook(switch); HunterAssistAspect_Event(switch); HunterAssist_59897944f061764c83614dd61b947cf1:AspectButtonUpdate(); end local misDirect = GetSpellInfo(34477); local misDirectPlayer; local enablemisDirect = false; function HunterAssist_59897944f061764c83614dd61b947cf1:Yell(msg) SendChatMessage(msg, "yell"); end function HunterAssist_59897944f061764c83614dd61b947cf1:UNIT_SPELLCAST_SENT(unit, spell, _, player) if (unit == "player" and spell == misDirect ) then misDirectPlayer = player; end end function HunterAssist_59897944f061764c83614dd61b947cf1:UNIT_SPELLCAST_SUCCEEDED(unit, spell) if (HunterAssist_Enabled and unit == "player") then HunterAssist_446c39a4c9d0009e5820c001d4a61a51(spell); end if (enablemisDirect) then if (unit == "player" and spell == misDirect and IsInInstance()) then self:Yell(string.gsub(MISDIRECT_PATTERN, "$player", misDirectPlayer)); end end end function HunterAssistMisdirect_Toggle(switch) if (switch) then HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("UNIT_SPELLCAST_SENT"); HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED"); enablemisDirect = true; else HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("UNIT_SPELLCAST_SENT"); enablemisDirect = false; end end local distanceSpell = { [1] = 2974, [2] = 19503, [3] = 2764, [4] = 75, }; local DISTANCE_MAX_RANGE = 0; local spellDistance = {}; function HunterAssist_59897944f061764c83614dd61b947cf1:UpdateDistanceSpell() for k, v in ipairs(distanceSpell) do local name, _, _, _, _, _, _, _, maxRange = GetSpellInfo(v); local bookID = self:CheckSpell(name); if (bookID) then DISTANCE_MAX_RANGE = maxRange; end spellDistance[v] = {maxRange, bookID}; end end function HunterAssist_59897944f061764c83614dd61b947cf1:GetDistanceText() if (not HunterAssistDistanceFrame) then HunterAssist_59897944f061764c83614dd61b947cf1:CreateDistanceFrame(); end local texVal, minDis, maxDis = nil, 0, 100; local out = false; if (UnitExists("target")) then if (UnitCanAttack("player", "target")) then if (spellDistance[2974][2] and IsSpellInRange(spellDistance[2974][2], "target") == 1) then maxDis = 5; minDis = 0; elseif (CheckInteractDistance("target", 3) == 1) then maxDis = 9.9; minDis = 5; elseif (CheckInteractDistance("target", 2) == 1) then maxDis = 11.11; minDis = 9.9; elseif (spellDistance[19503][2] and IsSpellInRange(spellDistance[19503][2], "target") == 1) then maxDis = spellDistance[19503][1]; minDis = 11.11; elseif (spellDistance[2764][2] and IsSpellInRange(spellDistance[2764][2], "target") == 1) then maxDis = spellDistance[2764][1]; if (spellDistance[19503][2]) then minDis = spellDistance[19503][1]; elseif (CheckInteractDistance("target", 2) ~= 1) then minDis = 11.11; end elseif (spellDistance[75][2] and IsSpellInRange(spellDistance[75][2], "target") == 1) then maxDis = spellDistance[75][1]; minDis = spellDistance[2764][1]; else texVal = HUNTERASSIST_OOR; end if (not texVal) then texVal = string.format("%sm - %sm", tostring(minDis), tostring(maxDis)); end HunterAssistDistanceFrame:SetAlpha(1.0); else texVal = HUNTERASSIST_FRIEND; HunterAssistDistanceFrame:SetAlpha(0.5); end else texVal = HUNTERASSIST_NO_TARGET; HunterAssistDistanceFrame:SetAlpha(0.5); end return texVal, minDis, maxDis; end function HunterAssist_59897944f061764c83614dd61b947cf1:CreateDistanceFrame() if (HunterAssistDistanceFrame) then return; end local frame = CreateFrame("Button", "HunterAssistDistanceFrame", UIParent); frame:SetWidth(125); frame:SetHeight(20); frame:SetMovable(true); frame:SetPoint("TOP", "UIParent", "BOTTOM", 0, 237); frame:SetClampedToScreen(true); frame.bar = frame:CreateTexture("HunterAssistDistanceFrameBarTexture", "BACKGROUND"); frame.bar:SetWidth(119); frame.bar:SetHeight(14); frame.bar:SetPoint("CENTER", frame, "CENTER", 0, 0); frame.bar:SetTexture("Interface\\TargetingFrame\\UI-StatusBar"); frame.bar:SetVertexColor(1, 0.85, 0); frame.bar.border = frame:CreateTexture("HunterAssistDistanceFrameBarBorder", "ARTWORK"); frame.bar.border:SetTexture("Interface\\Tooltips\\UI-StatusBar-Border"); frame.bar.border:SetAllPoints(frame); frame.bar.tex = frame:CreateFontString("HunterAssistDistanceFrameBarText", "OVERLAY", "GameFontHighlight"); frame:SetWidth(125); frame:SetHeight(20); frame.bar.tex:SetPoint("CENTER", frame, "CENTER", 0 , 1); frame.bar.tex:SetJustifyH("CENTER"); frame.bar.tex:SetJustifyV("CENTER"); frame:SetScript("OnMouseDown", function(self, button) if (IsShiftKeyDown() and button == "LeftButton") then self:StartMoving(); self.ismoving = true; end end); frame:SetScript("OnMouseUp", function(self, button) if (self.ismoving) then self:StopMovingOrSizing(); self.ismoving = false; end end); frame:SetScript("OnEnter", function(self) GameTooltip_SetDefaultAnchor(GameTooltip, self); GameTooltip:SetText(HUNTERASSIST_NAME); GameTooltip:AddLine(HUNTERASSIST_RANGE_TOOLTIP); GameTooltip:Show(); end); frame:SetScript("OnLeave", function(self) GameTooltip:Hide(); end); RegisterForSaveFrame(frame); self.dFrame = frame; end function HunterAssist_59897944f061764c83614dd61b947cf1:SetDistanceBarText(tex, dis) local r, g, b = 0, 0, 0; if(dis >= 46) then b=1; elseif(dis >= 35) then g=1; elseif(dis >= 25) then r=1; g=1; elseif(dis >= 5) then r=1; g=0.5; else r=1; end HunterAssist_59897944f061764c83614dd61b947cf1.dFrame.bar.tex:SetText(tostring(tex)); HunterAssist_59897944f061764c83614dd61b947cf1.dFrame.bar:SetVertexColor(r, g, b); end function HunterAssist_59897944f061764c83614dd61b947cf1:PLAYER_TARGET_CHANGED() self:UpdateDistanceSpell(); end function HunterAssistDistance_Toggle(switch) HunterAssist_59897944f061764c83614dd61b947cf1:CreateDistanceFrame(); if (switch) then HunterAssist_59897944f061764c83614dd61b947cf1:RegisterEvent("PLAYER_TARGET_CHANGED"); HunterAssistDistanceFrame:SetScript("OnUpdate", function(self) local tex, minDis, maxDis = HunterAssist_59897944f061764c83614dd61b947cf1:GetDistanceText(); HunterAssist_59897944f061764c83614dd61b947cf1:SetDistanceBarText(tex, maxDis); end); HunterAssistDistanceFrame:Show(); else HunterAssist_59897944f061764c83614dd61b947cf1:UnregisterEvent("PLAYER_TARGET_CHANGED"); HunterAssistDistanceFrame:SetScript("OnUpdate", function() end); HunterAssistDistanceFrame:Hide(); end end
