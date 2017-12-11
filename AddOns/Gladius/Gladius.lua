Gladius = LibStub("AceAddon-3.0"):NewAddon("Gladius", "AceEvent-3.0", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Gladius", true)

local arenaUnits = {}
local arenaGUID = {}
local petClasses = { ["WARLOCK"] = true, ["DEATHKNIGHT"] = true, ["MAGE"] = true, ["PRIEST"] = true, ["HUNTER"] = true, }
local instanceType, db

function Gladius:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("DuowanAddon_GladiusDB", self:getDefaults())
	self:SetupOptions()
	db = self.db.profile
	self.buttons = {}
	self.currentBracket = nil

	--default arena units
	for i=1, 5 do
		arenaUnits["arena" .. i] = "playerUnit"
		arenaUnits["arenapet" .. i] = "arena" .. i
	end
	
	--clique support
	if ( db.cliqueSupport and IsAddOnLoaded("Clique") ) then

		for i=1, 5 do
			self.buttons["arena" .. i] = self:CreateButton(i)
			self.buttons["arenapet" .. i] = self.buttons["arena" .. i].pet
		end
		
		ClickCastFrames = ClickCastFrames or {}
		ClickCastFrames[GladiusButton1] = true
		ClickCastFrames[GladiusButton2] = true
		ClickCastFrames[GladiusButton3] = true
		ClickCastFrames[GladiusButton4] = true
		ClickCastFrames[GladiusButton5] = true
		
	end
	
	-- waste of space :(
	BINDING_HEADER_GLADIUS 				= L["Gladius"]
	BINDING_NAME_GLADIUSTARGET1_LEFT 	= L["Left click enemy #1"]
	BINDING_NAME_GLADIUSTARGET2_LEFT 	= L["Left click enemy #2"]
	BINDING_NAME_GLADIUSTARGET3_LEFT 	= L["Left click enemy #3"]
	BINDING_NAME_GLADIUSTARGET4_LEFT 	= L["Left click enemy #4"]
	BINDING_NAME_GLADIUSTARGET5_LEFT 	= L["Left click enemy #5"]
	BINDING_NAME_GLADIUSTARGET1_RIGHT 	= L["Right click enemy #1"]
	BINDING_NAME_GLADIUSTARGET2_RIGHT 	= L["Right click enemy #2"]
	BINDING_NAME_GLADIUSTARGET3_RIGHT 	= L["Right click enemy #3"]
	BINDING_NAME_GLADIUSTARGET4_RIGHT	= L["Right click enemy #4"]
	BINDING_NAME_GLADIUSTARGET5_RIGHT 	= L["Right click enemy #5"]

end

function Gladius:OnEnable()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	if (not db.locked and db.x == 0 and db.y == 0) then
		--self:ToggleFrame(5)
		--[[
		self:Print(L["Welcome to Gladius!"])
		self:Print(L["First run has been detected, displaying test frame."])
		self:Print(L["Valid slash commands are:"])
		self:Print(L["/gladius ui"])
		self:Print(L["/gladius test1-5"])	
		self:Print(L["If this is not your first run please lock or move the frame to prevent this from happening."])
		]]
	end
end

function Gladius:Toggle(switch)
	if (switch) then
		self:RegisterEvent("ZONE_CHANGED_NEW_AREA");
		self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA");
		self:ZONE_CHANGED_NEW_AREA();
	else
		self:UnregisterAllEvents();
		Gladius:ClearAllUnits();
	end
end

function Gladius:ZONE_CHANGED_NEW_AREA()
	local type = select(2, IsInInstance())
		
	if (type == "arena") then
		self:JoinedArena()
	elseif (type ~= "arena" and instanceType == "arena") then
		self:LeftArena()
	end
	
	instanceType = type
end

-- Hides and resets all units (only resets the necessary things, like trinket status)
function Gladius:ClearAllUnits()
	for k, v in pairs(self.buttons) do
		if ( arenaUnits[k] == "playerUnit" ) then
			-- stop the trinket cooldown counting
			if ( v.trinketFrame ) then
				v.trinketFrame:SetScript("OnUpdate", nil)
			end
			
			-- resets so the enemy announcement works again
			v.enemyAnnounced = false
			
			-- reset all the cooldown spirals
			CooldownFrame_SetTimer(v.cooldownFrame, 1, 1, 1)
			
			-- turn grid trinket icon green again
			v.gridTrinket:SetBackdropColor(0,1,0,1)
			
			-- Reset the trinket "text" to avoid issues with the embedded trinket icon
			v.trinket:SetText("")
		end
			
		-- hide the button
		v:SetAlpha(0)
		v:Hide()
	end
	
	-- reset guid table
	arenaGUID = {}
end

--We joined an arena: clear units, register events, create buttons and show frames
function Gladius:JoinedArena()
	self:ClearAllUnits()

	self:RegisterEvent("UNIT_AURA")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("UNIT_MANA", "UNIT_POWER")
	self:RegisterEvent("UNIT_RAGE", "UNIT_POWER")
	self:RegisterEvent("UNIT_ENERGY", "UNIT_POWER")
	self:RegisterEvent("UNIT_FOCUS", "UNIT_POWER")
	self:RegisterEvent("UNIT_RUNIC_POWER", "UNIT_POWER")
	self:RegisterEvent("UNIT_DISPLAYPOWER")
	self:RegisterEvent("UNIT_TARGET")
	self:RegisterEvent("PLAYER_TARGET_CHANGED")
	self:RegisterEvent("PLAYER_FOCUS_CHANGED")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("ARENA_OPPONENT_UPDATE")
	self:RegisterEvent("UNIT_NAME_UPDATE")
	self:RegisterEvent("UNIT_PET")
	
	self:RegisterEvent("UNIT_SPELLCAST_START")
	self:RegisterEvent("UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_DELAYED")
	self:RegisterEvent("UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", "UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", "UNIT_SPELLCAST_DELAYED")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_STOP")
	
	-- find out the current bracket size
	for i=1, MAX_BATTLEFIELD_QUEUES do
		local status, _, _, _, _, teamSize = GetBattlefieldStatus(i)
		if (status == "active" and teamSize > 0) then
			Gladius.currentBracket = teamSize
			break
		end
	end
	
	for i=1, Gladius.currentBracket do
		local unit = "arena" .. i
		local pet = "arenapet" .. i
		local button = self.buttons[unit]
		
		if (not button) then
			button = self:CreateButton(i)
			self.buttons[unit] = button
			self.buttons[pet] = button.pet
		end
		
		button:Show()
		button.pet:Show()
		button.isDead = nil
		button.powerType = 0
	end
	
	self.frame.testing = false
	self:UpdateFrame()
	self.UpdateUnits()
	self:UpdateBindings()
	self.frame:Show()
end

--We left an arena, unregister events and clear/hide frames
function Gladius:LeftArena()
	self:ClearAllUnits()	
	self:UnregisterAllEvents()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	self.frame:Hide()
end

--Update units health
function Gladius:UNIT_HEALTH(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		local button = self.buttons[unit]
		
		local currentHealth, maxHealth = UnitHealth(unit), UnitHealthMax(unit)
		local healthPercent = math.floor((UnitHealth(unit)/UnitHealthMax(unit)) * 100)
		local healthText
		
		if ( db.healthActual ) then
            healthText = db.shortHpMana and currentHealth > 9999 and string.format("%.1fk", (currentHealth / 1000)) or currentHealth  
		end
		
		if ( db.healthMax ) then
            local text = db.shortHpMana and maxHealth > 9999 and string.format("%.1fk", (maxHealth / 1000)) or maxHealth
            if ( healthText ) then
				healthText = string.format("%s/%s", healthText, text)
			else
				healthText = text
			end
		end
		
		if ( db.healthPercentage) then
			if ( healthText ) then
				healthText = string.format("%s (%d%%)", healthText, healthPercent)
			else
				healthText = string.format("%d%%", healthPercent)
			end		
		end
		
		button.healthText:SetText(healthText)
		button.health:SetValue(healthPercent)
		
		-- display low health announcement
		if ( db.lowHealthAnnounce and healthPercent <= db.lowHealthPercentage and not button.lowHealth and (not button.healthThrottle or GetTime() > button.healthThrottle) and button.name ) then
			local text = string.format(L["LOW HEALTH: %s"], button.name)
			Gladius:SendAnnouncement(text, RAID_CLASS_COLORS[button.class])
			button.lowHealth = true
			button.healthThrottle = GetTime() + 5
		end
		
		-- reset the lowHealth announcement
		if ( button.lowHealth and healthPercent > db.lowHealthPercentage ) then
			button.lowHealth = false
		end

	end
end

--Update units mana/rage/energy
function Gladius:UNIT_POWER(event, unit)
	if ( arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead ) then
		local button = self.buttons[unit]
		
		local currentMana, maxMana = UnitMana(unit), UnitManaMax(unit)
		local manaPercent = math.floor((currentMana/maxMana) * 100)
		local manaText
		
		if ( db.manaActual ) then
			manaText = db.shortHpMana and currentMana > 9999 and string.format("%.1fk", (currentMana / 1000)) or currentMana  
		end
		
		if ( db.manaMax ) then
			local text = db.shortHpMana and maxMana > 9999 and string.format("%.1fk", (maxMana / 1000)) or maxMana
			if ( manaText ) then
				manaText = string.format("%s/%s", manaText, text)
			else
				manaText = text
			end
		end
		
		if ( db.manaPercentage) then
			if ( manaText ) then
				manaText = string.format("%s (%d%%)", manaText, manaPercent)
			else
				manaText = string.format("%d%%", manaPercent)
			end		
		end
		
		button.manaText:SetText(manaText)
		button.mana:SetValue(manaPercent)	
			
	end
end

--Update units powertypes
function Gladius:UNIT_DISPLAYPOWER(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead) then
		local button = self.buttons[unit]
		button.powerType = UnitPowerType(unit)
		if (button.powerType == 0 and not db.manaDefault) then
			button.mana:SetStatusBarColor(db.manaColor.r, db.manaColor.g, db.manaColor.b, db.manaColor.a)
		elseif (button.powerType == 1 and not db.rageDefault) then
			button.mana:SetStatusBarColor(db.rageColor.r, db.rageColor.g, db.rageColor.b, db.rageColor.a)
		elseif (button.powerType == 3 and not db.energyDefault) then
			button.mana:SetStatusBarColor(db.energyColor.r, db.energyColor.g, db.energyColor.b, db.energyColor.a)
		elseif (button.powerType == 6 and not db.rpDefault) then
			button.mana:SetStatusBarColor(db.rpColor.r, db.rpColor.g, db.rpColor.b, db.rpColor.a)
		else
			button.mana:SetStatusBarColor(PowerBarColor[button.powerType].r, PowerBarColor[button.powerType].g, PowerBarColor[button.powerType].b)
		end
		self:UNIT_POWER(nil, unit)
	end
end

-- Aura event
function Gladius:UNIT_AURA(event, unit)
	if ( arenaUnits[unit] == "playerUnit" ) then
		
		local button = self.buttons[unit]
		local aura = button.auraFrame
		local index = 1
		local priority = 0
		local auraName, auraIcon, auraExpTime
		
		--Buffs
		while ( true ) do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, "HELPFUL")
			if ( not name ) then break end
			
			if ( GladiusAuraList[name] and GladiusAuraList[name] >= priority ) then
				priority = GladiusAuraList[name]
				auraName = name
				auraIcon = icon
				auraExpTime = expirationTime
			end
			
			-- If the unit is drinking, show an announcement if it's turned on
			if ( name == GetSpellInfo(57073) and db.drinkAnnounce and ( not button.drinkThrottle or GetTime() > button.drinkThrottle )) then
				Gladius:SendAnnouncement(string.format(L["DRINKING: %s (%s)"], button.name, button.classLoc), RAID_CLASS_COLORS[button.class])
				button.drinkThrottle = GetTime() + 3 -- limit the spamming of announcements
			end
			
			index = index+1
		end
		
		index = 1 -- reset the index so we can start over with our aura scan
		
		--Debuffs 
		while ( true ) do
			local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, index, "HARMFUL")
			if ( not name ) then break end
			
			-- Here we implement a fix for wyvern sting to have it not display the DoT
			if ( GladiusAuraList[name] and GladiusAuraList[name] >= priority and ( not button.wyvernDot or name ~= GetSpellInfo(49012) )) then
				priority = GladiusAuraList[name]
				auraName = name
				auraIcon = icon
				auraExpTime = expirationTime
			end
			
			index = index+1	
		end
		
		
		if ( auraName ) then -- Aura found?
			Gladius:AuraGain(unit, auraName, auraIcon, auraExpTime, priority) -- Display it!
		elseif ( not auraName and aura.auraActive ) then -- No aura found and one is active?
			Gladius:AuraFades(aura) -- Have it fade.
		end
	
	end
end

function Gladius:AuraGain(unit, name, icon, expirationTime, priority)
	if (not db.displayAuras or not db.classIcon or db.trinketDisplay == "overrideIcon") then return end
	local aura = self.buttons[unit].auraFrame
	aura.name = name
	aura.priority = priority
	aura.timeLeft = (expirationTime - GetTime())
	aura.icon:SetTexture(icon)
	aura.auraActive = true
end

function Gladius:AuraFades(bar)
	bar.name = nil
	bar.priority = nil
	bar.text:SetText("")
	bar.icon:SetTexture("")
	bar.auraActive = nil
end

-- converts the aura list to the old format I was using since I'm too lazy to update the aura functions (old format: ["Spell Name"] = 1 (prio))
function Gladius:ConvertAuraList()
	GladiusAuraList = {}
	for k, v in pairs(self.db.profile.auras) do
		if ( not v.deleted ) then
			GladiusAuraList[v.name] = v.priority
		end
	end
end

--Spell casts
function Gladius:UNIT_SPELLCAST_START(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead) then
		local spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitCastingInfo(unit)
		local castBar = self.buttons[unit].castBar
		castBar.isCasting = true
		castBar.value = (GetTime() - (startTime / 1000))
		castBar.maxValue = (endTime - startTime) / 1000
		castBar:SetMinMaxValues(0, castBar.maxValue)
		castBar:SetValue(castBar.value)
		castBar.timeText:SetText(maxValue)
		
		if( rank ~= "" ) then
			castBar.spellText:SetFormattedText("%s (%s)", spell, rank)
		else
			castBar.spellText:SetText(spell)
		end
	end
end

function Gladius:UNIT_SPELLCAST_CHANNEL_START(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead) then
		local spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitChannelInfo(unit)
		local castBar = self.buttons[unit].castBar
		castBar.isChanneling = true
		castBar.value = ((endTime / 1000) - GetTime())
		castBar.maxValue = (endTime - startTime) / 1000
		castBar:SetMinMaxValues(0, castBar.maxValue)
		castBar:SetValue(castBar.value)
		castBar.timeText:SetText(maxValue)

		if( rank ~= "" ) then
			castBar.spellText:SetFormattedText("%s (%s)", spell, rank)
		else
			castBar.spellText:SetText(spell)
		end
	end	
end

function Gladius:UNIT_SPELLCAST_STOP(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead) then
		self:CastEnd(self.buttons[unit].castBar)
	end
end

function Gladius:UNIT_SPELLCAST_DELAYED(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead) then
		local spell, rank, displayName, icon, startTime, endTime, isTradeSkill
		if (event == "UNIT_SPELLCAST_DELAYED") then
			spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitCastingInfo(unit)
		else
			spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitChannelInfo(unit)
		end
		local bar = self.buttons[unit].castBar
		bar.value = (GetTime() - (startTime / 1000))
		bar.maxValue = (endTime - startTime) / 1000
		bar:SetMinMaxValues(0, bar.maxValue)
	end
end

function Gladius:CastEnd(bar)
	bar.isCasting = nil
	bar.isChanneling = nil
	bar.timeText:SetText("")
	bar.spellText:SetText("")
	bar:SetValue(0)
end

--Update the highlight and frame border for current target
function Gladius:PLAYER_TARGET_CHANGED(event)
	local target = UnitGUID("target")
	for _, v in pairs(self.buttons) do
		if (v.GUID == target) then
			if (db.highlight) then
				v.highlight:Show()
			end
			if (db.selectedBorder) then
				v.selected:Show()
			end
		else
			v.highlight:Hide()
			v.selected:Hide()
		end
	end		
end

function Gladius:PLAYER_FOCUS_CHANGED(event)
	local focus = UnitGUID("focus")
	for _, v in pairs(self.buttons) do
		if (v.GUID == focus) then
			if (db.focusBorder) then
				v.focusBorder:Show()
			end
		else
			v.focusBorder:Hide()
		end
	end
end

--Update target of arena enemies
function Gladius:UNIT_TARGET(event, unit)
	if (arenaUnits[unit] == "playerUnit" and not self.buttons[unit].isDead and db.targetIcon) then
		local targetIcon = self.buttons[unit].targetIcon
		local targetClass = select(2, UnitClass(unit.."target"))
		if (targetClass ~= nil) then
			local coords = CLASS_BUTTONS[targetClass]
			targetIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
			targetIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
			targetIcon:SetAlpha(1)
		else
			targetIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			targetIcon:SetTexCoord(0,0,0,1,1,0,1,1)
			targetIcon:SetAlpha(0.33)
		end
	end
end

--Scan combatlog for enemy deaths and aura fading
function Gladius:COMBAT_LOG_EVENT_UNFILTERED(event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, ...)

	-- enemy death
	if (eventType == "PARTY_KILL" and bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE) then
		self:EnemyDeath(destGUID)
	
	-- fix for wyvern sting
	elseif ( eventType == "SPELL_AURA_APPLIED" ) then
		local spellID, spellName = ...
		if ( arenaGUID[destGUID] and ( spellID == 49010 or spellID == 49009 or spellID == 27069 or spellID == 24135 or spellID == 24134 or spellID == 24131 ) ) then
			self.buttons[arenaGUID[destGUID]].wyvernDot = true	
		end
	
	elseif (eventType == "SPELL_AURA_REMOVED" or eventType == "SPELL_PERIODIC_AURA_REMOVED" or eventType == "SPELL_AURA_REMOVED_DOSE" or eventType == "SPELL_PERIODIC_AURA_REMOVED_DOSE") then
		local spellID, spellName = ...
		-- fix for wyvern sting
		if ( arenaGUID[destGUID] and ( spellID == 49010 or spellID == 49009 or spellID == 27069 or spellID == 24135 or spellID == 24134 or spellID == 24131 ) ) then
			self.buttons[arenaGUID[destGUID]].wyvernDot = false
		end
	
	elseif ( eventType == "SPELL_CAST_SUCCESS" ) then
		local spellID, spellName = ...
						
		-- enemy trinket usage
		if ( arenaGUID[sourceGUID] and (spellID == 42292 or spellID == 59752) and db.trinketStatus) then
			self:TrinketUsed(arenaGUID[sourceGUID])
		end
			
	end
	
end


function Gladius:GetTrinketIcon(unit)
	local trinketIcon
	
	-- Use the appropiate icon for the level/faction of the enemy (thank you Shadowed for letting me "borrow" this one!)
	if( UnitFactionGroup(unit) == "Horde" ) then
		trinketIcon = UnitLevel(unit) == 80 and "Interface\\Icons\\INV_Jewelry_Necklace_38" or "Interface\\Icons\\INV_Jewelry_TrinketPVP_02"
	else
		trinketIcon = UnitLevel(unit) == 80 and "Interface\\Icons\\INV_Jewelry_Necklace_37" or "Interface\\Icons\\INV_Jewelry_TrinketPVP_01"
	end
	
	if ( db.trinketDisplay == "nameIcon" ) then
		trinketIcon = string.format("|T%s:%d:%d:10:0|t", trinketIcon, db.healthFontSize*2, db.healthFontSize*2)
	end
	
	return trinketIcon
end

-- Trinket updating function
local function TrinketUpdate(self, elapsed)

	if ( self.endTime < GetTime() ) then
	
		local button = Gladius.buttons[self.unit]
		local display = db.trinketDisplay

		-- Display nametext/nameicon again
		if ( display == "nameText" or display == "nameIcon" ) then
			button.trinket:SetText(display == "nameText" and " (t)" or trinketIcon)
			button.trinket:SetAlpha(display == "nameText" and 1 or 0.5)
		elseif ( display == "gridIcon" ) then
			button.gridTrinket:SetBackdropColor(0,1,0,1)
		end
		
		-- Announce trinket ready
		if ( db.trinketUpAnnounce and not button.isDead ) then
			Gladius:SendAnnouncement(string.format(L["TRINKET READY: %s (%s)"], button.name, button.classLoc), RAID_CLASS_COLORS[button.class])
		end
		
		-- Set OnUpdate script to nothing so it won't continue updating	
		self:SetScript("OnUpdate", nil)
		
	end
	
end	

--Trinket used
function Gladius:TrinketUsed(unit)

	local button = self.buttons[unit]
	local display = db.trinketDisplay
	local trinketIcon = self:GetTrinketIcon(unit)

	-- If the updating frame doesn't exist, create it
	if ( not button.trinketFrame ) then
		button.trinketFrame = CreateFrame("Frame", nil, button)
	end

	button.trinketFrame:SetScript("OnUpdate", TrinketUpdate)
	button.trinketFrame.endTime = GetTime() + 120
	button.trinketFrame.unit = unit
	
	-- Hide name-text/icon or change color of gridtrinket frame
	if ( display == "nameText" or display == "nameIcon" ) then
		button.trinket:SetText("")
	elseif ( display == "gridIcon" ) then
		button.gridTrinket:SetBackdropColor(1,0,0,1)
	end
	
	-- Set the cooldown timer
	if ( display == "overrideIcon" or display == "bigIcon" or display == "smallIcon" or display == "gridIcon" ) then 
		CooldownFrame_SetTimer(button.cooldownFrame, GetTime(), 120, 1)
	end

	-- Announce that the trinket has been used
	if ( db.trinketUsedAnnounce ) then
		Gladius:SendAnnouncement(string.format(L["TRINKET USED: %s (%s)"], button.name, button.classLoc), RAID_CLASS_COLORS[button.class])
	end
	
end

--Enemy has died
function Gladius:EnemyDeath(GUID)
	for unit, button in pairs(self.buttons) do
		if (button.GUID == GUID and arenaUnits[unit] == "playerUnit") then
			button.isDead = true
			button.health:SetValue(0)
			button.healthText:SetText("DEAD")
			button.mana:SetValue(0)
			button.manaText:SetText("0%")
			button.classIcon:SetAlpha(0.33)
			button.targetIcon:SetAlpha(0.33)
			button.targetIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			button.targetIcon:SetTexCoord(0,0,0,1,1,0,1,1)
			button.trinket:SetText("")
			Gladius:AuraFades(button.auraFrame)
			break
		end
	end
end

--Send an announcement message
function Gladius:SendAnnouncement(text, color)
	-- party chat
	if ( db.announceType == "party" ) then
		SendChatMessage(text, "PARTY")
		
	-- raid warning
	elseif ( db.announceType == "rw" ) then
		SendChatMessage(text, "RAID_WARNING")
		
	-- floating combat text
	elseif ( db.announceType == "fct" and IsAddOnLoaded("Blizzard_CombatText") ) then
		CombatText_AddMessage(text, COMBAT_TEXT_SCROLL_FUNCTION, color.r, color.g, color.b)
		
	-- MikScrollingBattleText	
	elseif ( db.announceType == "msbt" and IsAddOnLoaded("MikScrollingBattleText") ) then 
		MikSBT.DisplayMessage(text, MikSBT.DISPLAYTYPE_NOTIFICATION, false, color.r * 255, color.g * 255, color.b * 255)
		
	-- Scrolling Combat Text
	elseif ( db.announceType == "sct" and IsAddOnLoaded("sct") ) then
		SCT:DisplayText(text, color, nil, "event", 1)
	end
end


--Update single unit button
function Gladius:UpdateUnit(unit)	
		local button = self.buttons[unit]
		
		if ( not button ) then return end
		
		--check if unit exists
		if (UnitExists(unit)) then
		
			arenaGUID[UnitGUID(unit)] = unit
			local name, server = UnitName(unit)
			local classLoc, class = UnitClass(unit)
			local raceLoc, race = UnitRace(unit)
			local sex = UnitSex(unit)
			
			--Announce the enemy if enabled and a name exists.
			if ( db.enemyAnnounce and not button.enemyAnnounced and name ~= "Unknown" ) then
				Gladius:SendAnnouncement(name .. " - " .. classLoc, RAID_CLASS_COLORS[class])
				button.enemyAnnounced = true
			end
			
			button.name = name
			button.class = class
			button.classLoc = classLoc
			button.GUID = UnitGUID(unit)
			button.text:SetText(name)
						
			--setup the trinket status
			if (not db.trinketStatus or (db.trinketDisplay ~= "nameText" and db.trinketDisplay ~= "nameIcon")) then
				button.trinket:SetText("")
			else
				local text = db.trinketDisplay == "nameText" and " (t)" or Gladius:GetTrinketIcon(unit, true)
				local alpha = db.trinketDisplay == "nameText" and 1 or 0.5
				button.trinket:SetText(text)
				button.trinket:SetAlpha(alpha)
			end
			
			if (db.trinketDisplay == "bigIcon" and db.trinketStatus) then
				button.bigTrinket:SetTexture(Gladius:GetTrinketIcon(unit, false))
			elseif (db.trinketDisplay == "smallIcon" and db.trinketStatus) then
				button.smallTrinket:SetTexture(Gladius:GetTrinketIcon(unit, false))
			elseif (db.trinketDisplay == "overrideIcon" and db.trinketStatus) then
				button.overrideTrinket:SetTexture(Gladius:GetTrinketIcon(unit, false))
			end
				
			-- handle the class/race text
			button.classText:SetText("")
			if (db.classText) then
				button.classText:SetText(classLoc)
			end
			
			if (db.raceText) then
				if (button.classText:GetText()) then
					button.classText:SetFormattedText("%s %s", raceLoc, button.classText:GetText())
				else
					button.classText:SetText(raceLoc)
				end
			end
			
			if (not db.classText and not db.raceText) then
				button.classText:Hide()
			end
						
			--health bar class color
			button.health:SetStatusBarColor(RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b, 1)
			
			--class icon
			local coords = CLASS_BUTTONS[class]
			button.classIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
			button.classIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
			button.classIcon:SetAlpha(1)
			
			--Check if it's a pet class and in that case update the frame to fit
			button.isPetClass = petClasses[class] and true or false
			if ( db.showPets and not button.isPetClass and not InCombatLockdown() and ( not button.resizeThrottle or GetTime() > button.resizeThrottle )) then
				Gladius:NewNonPetUnit(unit)
				button.resizeThrottle = GetTime()+5
			end
			
			-- Update health/mana/power
			self:UNIT_HEALTH(nil, unit)
			self:UNIT_POWER(nil, unit)
			self:UNIT_DISPLAYPOWER(nil, unit)
			self:UNIT_AURA(nil, unit)
			self:UNIT_TARGET(nil, unit)
			self:UNIT_PET(nil, unit)
			self:PLAYER_TARGET_CHANGED(nil)
			self:PLAYER_FOCUS_CHANGED(nil)
			self:CastEnd(button.castBar)
			
			button:SetAlpha(1)		
		else
			button:SetAlpha(0)
		end
		
end

function Gladius:UNIT_PET(event, unit)
	if ( arenaUnits[unit] or ( self.frame.testing and unit == "player" )) then
		if ( unit == "player" ) then unit = "arena1" end
		for k, v in pairs(arenaUnits) do
			if ( v == unit ) then
				Gladius:UpdatePet(k)
				break
			end
		end
	end
end

-- Update a single pet button
function Gladius:UpdatePet(unit)
	local button = self.buttons[unit]
	if ( self.frame.testing and unit == "arenapet1" ) then unit = "pet" end
	
	--check if unit exists
	if (UnitExists(unit)) then
		button.name = UnitName(unit)
		button.family = UnitCreatureFamily(unit) or UnitName(unit)
		button.nameText:SetText(button.family)
		button.GUID = UnitGUID(unit)
		arenaGUID[button.GUID] = unit
		button:SetAlpha(1)
		self:PLAYER_TARGET_CHANGED(nil)
		self:PLAYER_FOCUS_CHANGED(nil)
		self:UNIT_HEALTH(nil, unit)
	else
		button:SetAlpha(0)
	end
	
end

--Update all buttons that are used in current arena
function Gladius:UpdateUnits()
	for i=1, Gladius.currentBracket do
		Gladius:UpdateUnit("arena" .. i)
	end
end

--Update the button bindings
function Gladius:UpdateBindings()
	for k, v in pairs(self.buttons) do
		local keyLeft = GetBindingKey("GLADIUSTARGET"..v.id.."_LEFT")
		local keyRight = GetBindingKey("GLADIUSTARGET"..v.id.."_RIGHT")
		
		-- Have to clear the override binding first, because if they bind left then bind right
		-- and unbind left the left binding won't be cleared until arenas end (if they use different keys)
		-- although, given the base UI allows them to set both left and right bindings at the same time
		-- it probably should just let them do both? I'm sure Proditor will see this and say something.
		ClearOverrideBindings(v.secure)
		
		if (keyLeft) then
			SetOverrideBindingClick(v.secure, false, keyLeft, v.secure:GetName(), "LeftButton")
		elseif (keyRight) then
			SetOverrideBindingClick(v.secure, false, keyRight, v.secure:GetName(), "RightButton")		
		end		
	end
end

--Update attribute
function Gladius:UpdateAttribute(unit, key, mod, action, spellName)
	local button = self.buttons[unit].secure
	local test = self.frame.testing
	
	if (test and unit == "arena1") then
		button:SetAttribute("unit", "player")
	elseif (test and unit == "arenapet1") then
		button:SetAttribute("unit", "pet")
	else
		button:SetAttribute("unit", unit)
	end

	if ( action == "target" or action == "focus" ) then
		button:SetAttribute(mod .. "type" .. key, action)
	elseif ( action == "macro" and spellName ~= "" ) then
		local macro = string.gsub(spellName, "*unit", unit)
		button:SetAttribute(mod .. "type" .. key, "macro")
		button:SetAttribute(mod .. "macrotext" .. key, macro)
	elseif ( action == "spell" and spellName ~= "" ) then
		button:SetAttribute(mod .. "type" .. key, "spell")
		button:SetAttribute(mod .. "spell" .. key, spellName)
	end
end

--Update all attributes for a specific unit
function Gladius:UpdateAttributes(unit)
	for _, click in pairs(self.db.profile.attributes) do
		self:UpdateAttribute(unit, click.button, click.modifier, click.action, click.spell)
	end
end

--Arena unit update
function Gladius:ARENA_OPPONENT_UPDATE(event, unit, type)
	if ( type == "seen" and arenaUnits[unit] == "playerUnit" ) then
		Gladius:UpdateUnit(unit)
	end
end

function Gladius:UNIT_NAME_UPDATE(event, unit)
	if ( self.frame.testing and unit == "pet" ) then unit = "arenapet1" end
	if ( arenaUnits[unit] == "playerUnit" ) then
		Gladius:UpdateUnit(unit)
	elseif ( arenaUnits[unit] and arenaUnits[unit] ~= "playerUnit" ) then
		Gladius:UpdatePet(unit)
	end
end

--Create test buttons
function Gladius:Test()
	for i=1, Gladius.currentBracket do
		local unit = "arena" .. i
		local pet = "arenapet" .. i
		if (not self.buttons[unit]) then
			local button = self:CreateButton(i)
			self.buttons[unit] = button
			self.buttons[pet] = button.pet
		end
	end
	
	for i=1, Gladius.currentBracket do
		local unit = "arena" .. i
		local pet = "arenapet" .. i
		local button = self.buttons[unit]
		button.isDead = false
		
		local class, race, sex, classLoc, raceLoc, health, mana, manaMax, manaPercentage, healthMax, healthActual
		if (i == 1) then
		
			arenaGUID[UnitGUID("player")] = "arena1"
			if ( UnitGUID("pet") ) then
				arenaGUID[UnitGUID("pet")] = "arenapet1"
				button.pet.GUID = UnitGUID("pet")
				button.pet:Show()
				Gladius:UNIT_PET(nil, "player")
			end
			
			classLoc, class = UnitClass("player")
			raceLoc, race = UnitRace("player")
			sex = UnitSex("player")
			button.GUID = UnitGUID("player")
			button.name = UnitName("player")
			button.powerType = UnitPowerType("player")
			button.classLoc = classLoc
			button.class = class
			button.raceLoc = raceLoc
			self:UpdateAttributes("arena1")
			health = math.floor((UnitHealth("player")/UnitHealthMax("player")) * 100)
			healthMax = UnitHealthMax("player")
			healthActual = UnitHealth("player")
			manaMax = UnitManaMax("player")
			mana = UnitMana("player")
			manaPercentage = math.floor((UnitMana("player")/UnitManaMax("player")) * 100)
		else
			class, race, sex = "DRUID", "TAUREN", 2
			classLoc, raceLoc = "Druid", "Tauren"	
			button.name = L["Arena "] .. i
			button.GUID = "testframe"
			button.pet.GUID = "pet"
			button.powerType = i-2
			button.classLoc = classLoc
			button.class = class
			button.raceLoc = raceLoc
			manaMax = 13000
			health, mana = 100-(i^2), manaMax-(i^5)
			healthMax = 20000
			healthActual = healthMax * health/100
			manaPercentage = math.floor((mana/manaMax) * 100)
		end
		
		if ( db.enemyAnnounce ) then
			Gladius:SendAnnouncement(button.name .. " - " .. classLoc, RAID_CLASS_COLORS[class])
		end
		
		button.manaMax = manaMax
		button.manaActual = mana
		button.manaPercentage = manaPercentage
		
		button.healthPercentage = health
		button.healthActual = healthActual
		button.healthMax = healthMax
		
		button.castBar:SetMinMaxValues(0,i)
		button.castBar:SetValue(i-0.5)
		button.castBar.spellText:SetText("Example Spell (Rank 1)")
		button.castBar.timeText:SetText(i-0.5)
		
		Gladius:AuraGain("arena1", "Ice Block", select(3, GetSpellInfo(45438)), GetTime()+10, 3)
		
		button.text:SetText(button.name)
		button.health:SetValue(health)
		button.mana:SetValue(manaPercentage)
		
		if (not db.classText) then
			button.classText:Hide()
		end
		
		if (not db.manaText) then
			button.manaText:Hide()
		end
		
		--Check if it's a pet class and in that case update the frame to fit
		button.isPetClass = petClasses[class] and true or false
		
		if (button.powerType == 0 and not db.manaDefault) then
			button.mana:SetStatusBarColor(db.manaColor.r, db.manaColor.g, db.manaColor.b, db.manaColor.a)
		elseif (button.powerType == 1 and not db.rageDefault) then
			button.mana:SetStatusBarColor(db.rageColor.r, db.rageColor.g, db.rageColor.b, db.rageColor.a)
		elseif (button.powerType == 3 and not db.energyDefault) then
			button.mana:SetStatusBarColor(db.energyColor.r, db.energyColor.g, db.energyColor.b, db.energyColor.a)
		elseif (button.powerType == 6 and not db.rpDefault) then
			button.mana:SetStatusBarColor(db.rpColor.r, db.rpColor.g, db.rpColor.b, db.rpColor.a)
		else
			button.mana:SetStatusBarColor(PowerBarColor[button.powerType].r, PowerBarColor[button.powerType].g, PowerBarColor[button.powerType].b)
		end
		
		button.health:SetStatusBarColor(RAID_CLASS_COLORS[class].r, RAID_CLASS_COLORS[class].g, RAID_CLASS_COLORS[class].b, 1.0)
		
		local classes = { [0] = "WARRIOR", [1] = "PRIEST", [2] = "DRUID", [3] = "MAGE", [4] = "SHAMAN"}
		local i = math.random(4)
		local targetClass = classes[i]
		local coords = CLASS_BUTTONS[targetClass]
		button.targetIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
		button.targetIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
			
		local coords = CLASS_BUTTONS[class]
		button.classIcon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
		button.classIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
		button.classIcon:SetAlpha(1)
		button:SetAlpha(1)
		button:Show()
	end
	
end
