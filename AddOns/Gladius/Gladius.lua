Gladius = LibStub("AceAddon-3.0"):NewAddon("Gladius", "AceEvent-3.0", "AceConsole-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Gladius", true)
local db

local instanceType = false
local arenaUnits, unitsToIdentify = {}, {}

function Gladius:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("GladiusDB", self:getDefaults())
	self:SetupOptions()
	db = self.db.profile
	self.buttons = {}
	self.currentBracket = nil
	
	--default arena units
	for i=1, 5 do
		arenaUnits[i] = "arena" .. i
		arenaUnits[arenaUnits[i]] = true
	end

end

function Gladius:OnEnable()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
-- Modified by Sharak@BigFoot
	if (false) then
		self:ToggleFrame(5)
		self:Print(L["Welcome to Gladius!"])
		self:Print(L["First run has been detected, displaying test frame."])
		self:Print(L["Valid slash commands are:"])
		self:Print(L["/gladius ui"])
		self:Print(L["/gladius test1-5"])	
		self:Print(L["If this is not your first run please lock or move the frame to prevent this from happening."])
	end
end

function Gladius:ZONE_CHANGED_NEW_AREA()
	local type = select(2, IsInInstance())
		
	if (type == "arena") then
		self:JoinedArena()
--	elseif (type ~= "arena" and instanceType == "arena") then
	elseif(instanceType)then
		self:LeftArena()
	end
	
--	instanceType = type
end

function Gladius:ClearAllUnits()
	for k, v in pairs(self.buttons) do
		v:Hide()
	end
	
	for i=1, 5 do
		self.buttons["arena"..i] = nil
	end
end

--We joined an arena: clear units, register events, create buttons and show frames
function Gladius:JoinedArena()
	instanceType = true
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
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	
	self:RegisterEvent("UNIT_SPELLCAST_START")
	self:RegisterEvent("UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_DELAYED")
	self:RegisterEvent("UNIT_SPELLCAST_FAILED", "UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_INTERRUPTED", "UNIT_SPELLCAST_STOP")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", "UNIT_SPELLCAST_DELAYED")
	self:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP", "UNIT_SPELLCAST_STOP")
	
	for i=1, MAX_BATTLEFIELD_QUEUES do
		local status, _, _, _, _, teamSize = GetBattlefieldStatus(i)
		if (status == "active" and teamSize > 0) then
			Gladius.currentBracket = teamSize
			break
		end
	end
	
	for i=1, Gladius.currentBracket do
		local unit = arenaUnits[i]
		local button = self.buttons[unit]
		if (not button) then
			button = self:CreateButton(i)
			self.buttons[unit] = button
		end
		
		button.isDead = nil
		button.powerType = 0
		table.insert(unitsToIdentify, unit)	
	end
	
	self.frame.testing = false
	self:UpdateFrame()
	self.UpdateUnits()
	self:UpdateBindings()
	self.frame:Show()
	self.scanFrame:Show()
end

--We left an arena, unregister events and clear/hide frames
function Gladius:LeftArena()
	self:UnregisterAllEvents()
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("PLAYER_ENTERING_WORLD", "ZONE_CHANGED_NEW_AREA")
	self:ClearAllUnits()	
	self.frame:Hide()
	self.scanFrame:Hide()
	instanceType = false
end

--Update units health
function Gladius:UNIT_HEALTH(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		local health = math.floor((UnitHealth(unit)/UnitHealthMax(unit)) * 100)
		local button = self.buttons[unit]
		button.health:SetValue(health)
		button.healthText:SetText(health.."%")
		
		if ( db.lowHealthAnnounce and health <= db.lowHealthPercentage and not button.lowHealth and (not button.healthThrottle or GetTime() > button.healthThrottle) ) then
			local text = string.format(L["LowHP"], button.name)
			Gladius:SendAnnouncement(text, Gladius:GetClassColor(button.class))
			button.lowHealth = true
			button.healthThrottle = GetTime() + 5
		end
		
		if ( button.lowHealth and health > db.lowHealthPercentage ) then
			button.lowHealth = false
		end

	end
end

--Update units mana/rage/energy
function Gladius:UNIT_POWER(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then	
		local manaActual = UnitMana(unit)
		local manaMax = UnitManaMax(unit)
		local manaPercentage = math.floor((UnitMana(unit)/UnitManaMax(unit)) * 100)
		local button = self.buttons[unit]
		
		button.mana:SetValue(manaPercentage)
		button.manaText:SetText("")
		
		if (db.manaActual) then
			button.manaText:SetText(manaActual)
		end
		
		if (db.manaMax) then
			if button.manaText:GetText() then
				button.manaText:SetFormattedText("%s/%d", button.manaText:GetText(), manaMax)
			else
				button.manaText:SetFormattedText("%d", manaMax)
			end
		end
		
		if (db.manaPercentage) then
			if button.manaText:GetText() then
				button.manaText:SetFormattedText("%s (%d%%)", button.manaText:GetText(), manaPercentage)
			else
				button.manaText:SetFormattedText("%d%%", manaPercentage)
			end		
		end
		
	end
end

--Update units powertypes
function Gladius:UNIT_DISPLAYPOWER(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
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

--Auras
function Gladius:UNIT_AURA(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		local aura = self.buttons[unit].auraFrame
		local index = 1
		while (true) do
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitAura(unit, index, "HELPFUL")
			if (not name) then break end
			index = index+1
			local priority
			if (GladiusAuraList[name]) then
				priority = GladiusAuraList[name]
				if (not aura.auraActive)  then
					Gladius:AuraGain(unit, name, icon, expirationTime, priority)
				else
					if (priority >= aura.priority) then
						Gladius:AuraGain(unit, name, icon, expirationTime, priority)
					end
				end
			end	
		end
		
		index = 1
		while (true) do
			local name, rank, icon, count, debuffType, duration, expirationTime, isMine, isStealable = UnitAura(unit, index, "HARMFUL")
			if (not name) then break end
			index = index+1
			local priority
			if (GladiusAuraList[name]) then
				priority = GladiusAuraList[name]
				if (not aura.auraActive)  then
					Gladius:AuraGain(unit, name, icon, expirationTime, priority)
				else
					if (priority >= aura.priority) then
						Gladius:AuraGain(unit, name, icon, expirationTime, priority)
					end
				end
			end	
		end
	end
end

function Gladius:AuraGain(unit, name, icon, expirationTime, priority)
	if (not db.auras or not db.classIcon or db.trinketDisplay == "overrideIcon") then return end
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

--Spell casts
function Gladius:UNIT_SPELLCAST_START(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		local spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitCastingInfo(unit)
		local castBar = self.buttons[unit].castBar
		castBar.isCasting = true
		castBar.value = (GetTime() - (startTime / 1000))
		castBar.maxValue = (endTime - startTime) / 1000
		castBar:SetMinMaxValues(0, castBar.maxValue)
		castBar:SetValue(castBar.value)
		castBar.timeText:SetText(maxValue)
		castBar.spellText:SetText(spell .. " (" .. rank .. ")")
	end
end

function Gladius:UNIT_SPELLCAST_CHANNEL_START(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		local spell, rank, displayName, icon, startTime, endTime, isTradeSkill = UnitChannelInfo(unit)
		local castBar = self.buttons[unit].castBar
		castBar.isChanneling = true
		castBar.value = ((endTime / 1000) - GetTime())
		castBar.maxValue = (endTime - startTime) / 1000
		castBar:SetMinMaxValues(0, castBar.maxValue)
		castBar:SetValue(castBar.value)
		castBar.timeText:SetText(maxValue)
		castBar.spellText:SetText(spell .. " (" .. rank .. ")")
	end	
end

function Gladius:UNIT_SPELLCAST_STOP(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
		self:CastEnd(self.buttons[unit].castBar)
	end
end

function Gladius:UNIT_SPELLCAST_DELAYED(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead) then
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
	for k, v in pairs(self.buttons) do
		if (v.GUID == target) then
			if (db.highlight) then
				v.highlight:Show()
			end
			if (db.selectedBorder) then
				v.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,db.selectedFrameColor.a)
			end
		else
			v.highlight:Hide()
			v.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,0)
		end
	end
end

--Update target of arena enemies
function Gladius:UNIT_TARGET(event, unit)
	if (arenaUnits[unit] and not self.buttons[unit].isDead and db.targetIcon) then
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
	if (eventType == "PARTY_KILL") then
		self:EnemyDeath(destGUID)
	elseif (eventType == "SPELL_AURA_REMOVED" or eventType == "SPELL_PERIODIC_AURA_REMOVED" or eventType == "SPELL_AURA_REMOVED_DOSE" or eventType == "SPELL_PERIODIC_AURA_REMOVED_DOSE") then
		local spellID, spellName = ...
		for unit, button in pairs(self.buttons) do
			if (UnitGUID(unit) == destGUID and spellName == button.auraFrame.name) then
				self:AuraFades(self.buttons[unit].auraFrame)
				break
			elseif (UnitGUID(unit) == destGUID and (spellID == 42292 or spellID == 59752) and db.trinketStatus) then
				self:TrinketUsed(unit)
				break
			end
		end
	end
end


function Gladius:GetTrinketIcon(unit, nameIcon)
	local trinketIcon
	
	-- Use the appropiate icon for the level/faction of the enemy (thank you Shadowed for letting me "borrow" this one!)
	if( UnitFactionGroup(unit) == "Horde" ) then
		trinketIcon = UnitLevel(unit) == 80 and "Interface\\Icons\\INV_Jewelry_Necklace_38" or "Interface\\Icons\\INV_Jewelry_TrinketPVP_02"
	else
		trinketIcon = UnitLevel(unit) == 80 and "Interface\\Icons\\INV_Jewelry_Necklace_37" or "Interface\\Icons\\INV_Jewelry_TrinketPVP_01"
	end
	
	if (nameIcon) then
		trinketIcon = string.format("|T%s:%d:%d:10:0|t", trinketIcon, db.healthFontSize*2, db.healthFontSize*2)
	end
	
	return trinketIcon
end

--Trinket used
function Gladius:TrinketUsed(unit)
	local button = self.buttons[unit]
	local display = db.trinketDisplay
	local trinketIcon = display == "nameIcon" and self:GetTrinketIcon(unit, true) or self:GetTrinketIcon(unit, false)
	
	-- If the updating frame doesn't exist, create it
	if (not button.trinketFrame) then
		button.trinketFrame = CreateFrame("Frame", nil, button)
	end
	
	-- Update the time left until the trinket is up
	button.trinketFrame:SetScript("OnUpdate", function(self, elapsed)
			if (self.timeLeft <= 0) then
			
				if (display == "nameText" or display == "nameIcon") then
					local text = display == "nameText" and " (t)" or trinketIcon
					local alpha = display == "nameText" and 1 or 0.5
					button.trinket:SetText(text)
					button.trinket:SetAlpha(alpha)
				elseif (display == "gridIcon") then
					button.gridTrinket:SetBackdropColor(0,1,0,1)
				end
				
				if ( db.trinketUpAnnounce ) then
					local text = string.format(L["trinketready"], button.name, button.classLoc)
					Gladius:SendAnnouncement(text, Gladius:GetClassColor(button.class))
				end
					
				button.trinketFrame:SetScript("OnUpdate", nil)
			end
			self.timeLeft = self.timeLeft - elapsed
	end)
	
	button.trinketFrame.timeLeft = 120
	
	if (display == "nameText" or display == "nameIcon") then
		button.trinket:SetText("")
	elseif (display == "gridIcon") then
		button.gridTrinket:SetBackdropColor(1,0,0,1)
		CooldownFrame_SetTimer(button.gridTrinket.cooldown, GetTime(), button.trinketFrame.timeLeft, 1)
	elseif (display == "smallIcon") then
		CooldownFrame_SetTimer(button.smallTrinket.cooldown, GetTime(), button.trinketFrame.timeLeft, 1)
	elseif (display == "bigIcon") then
		CooldownFrame_SetTimer(button.bigTrinket.cooldown, GetTime(), button.trinketFrame.timeLeft, 1)
	elseif (display == "overrideIcon") then
		CooldownFrame_SetTimer(button.overrideTrinket.cooldown, GetTime(), button.trinketFrame.timeLeft, 1)
	end
	
	if ( db.trinketUsedAnnounce ) then
		local text = string.format(L["trinketused"], button.name, button.classLoc)
		Gladius:SendAnnouncement(text, Gladius:GetClassColor(button.class))
	end
end

--Enemy has died
function Gladius:EnemyDeath(GUID)
	for unit, button in pairs(self.buttons) do
		if (button.GUID == GUID) then
			button.isDead = true
			button.health:SetValue(0)
			button.healthText:SetText("0%")
			button.mana:SetValue(0)
			button.manaText:SetText("0%")
			button.classIcon:SetAlpha(0.33)
			button.targetIcon:SetAlpha(0.33)
			button.targetIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			button.targetIcon:SetTexCoord(0,0,0,1,1,0,1,1)
			button.trinket:SetText("")
			break
		end
	end
end


-- Get class color as a table
function Gladius:GetClassColor(class)
	local color = {}
	color.r = RAID_CLASS_COLORS[class].r
	color.g = RAID_CLASS_COLORS[class].g
	color.b = RAID_CLASS_COLORS[class].b
	return color
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
		--check if unit exists
		if (UnitExists(unit)) then
			local name, server = UnitName(unit)
			local classLoc, class = UnitClass(unit)
			local raceLoc, race = UnitRace(unit)
			local sex = UnitSex(unit)
			
			if ( db.enemyAnnounce and not button.enemyAnnounced ) then
				Gladius:SendAnnouncement(name .. " - " .. classLoc, Gladius:GetClassColor(class))
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
			
			--Update selected frame
			if (button.GUID == UnitGUID("target") and db.selectedBorder) then
				button.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,db.selectedFrameColor.a)
			elseif (button.GUID ~= UnitGUID("target") or (button.GUID == UnitGUID("target") and not db.selectedBorder)) then
				button.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,0)
			end
			
			-- Update health/mana/power
			self:UNIT_HEALTH(nil, unit)
			self:UNIT_POWER(nil, unit)
			self:UNIT_DISPLAYPOWER(nil, unit)
			self:UNIT_AURA(nil, unit)
			self:UNIT_TARGET(nil, unit)
			self:CastEnd(button.castBar)
			
			button:SetAlpha(1)		
		else
			button:SetAlpha(0)
		end
		
		--Attributes for targeting and setting focus
		self:UpdateAttributes(unit)
							
		--show button
		button:Show()
		
end

--Update all buttons that are used in current arena
function Gladius:UpdateUnits()
	local currentBracket = Gladius.currentBracket
	for i=1, currentBracket do
		Gladius:UpdateUnit("arena" .. i)
	end
end

--Update the button bindings
function Gladius:UpdateBindings()
	for k, v in pairs(self.buttons) do
		local keyLeft = GetBindingKey("GLADIUSTARGET"..v.id.."_LEFT")
		local keyRight = GetBindingKey("GLADIUSTARGET"..v.id.."_RIGHT")
		
		if (keyLeft) then
			SetOverrideBindingClick(v.secure, false, keyLeft, v.secure:GetName(), "LeftButton")
		elseif (keyRight) then
			SetOverrideBindingClick(v.secure, false, keyRight, v.secure:GetName(), "RightButton")		
		elseif (not keyLeft and not keyRight) then
			ClearOverrideBindings(v.secure)
		end		
		
	end
end

--Update attribute
function Gladius:UpdateAttribute(unit, key, action, spellName)
	local button = self.buttons[unit].secure
	local test = self.frame.testing
	
	if (test and unit == "arena1") then
		button:SetAttribute("unit", "player")
	else
		button:SetAttribute("unit", unit)
	end

	if (action ~= "spell" and action ~= "disabled") then
		button:SetAttribute("type" .. key, action)
	elseif (action == "spell" and spellName ~= "") then
		button:SetAttribute("type" .. key, "spell")
		button:SetAttribute("spell" .. key, spellName)
	end
end

--Update all attributes for a specific unit
function Gladius:UpdateAttributes(unit)
	self:UpdateAttribute(unit, 1, db.leftClick, db.leftSpell)
	self:UpdateAttribute(unit, 2, db.rightClick, db.rightSpell)
	self:UpdateAttribute(unit, 3, db.middleClick, db.middleSpell)
	self:UpdateAttribute(unit, 4, db.mouse4, db.mouse4spell)
	self:UpdateAttribute(unit, 5, db.mouse5, db.mouse5spell)
end

--Create an empty frame that scans for arena units and updates the corresponding button if unit exists
local scanFrame = CreateFrame("Frame")
scanFrame:Hide()

scanFrame:SetScript("OnUpdate", function()
		for i=#(unitsToIdentify), 1, -1 do
			local unit = unitsToIdentify[i]
			if (UnitExists(unit) and UnitName(unit) ~= UNKNOWNOBJECT) then
				Gladius:UpdateUnit(unit)
				table.remove(unitsToIdentify, i)
			end
		end
end)

Gladius.scanFrame = scanFrame


--Create five test buttons
function Gladius:Test()
	local currentBracket = Gladius.currentBracket
	for i=1, currentBracket do
		local unit = arenaUnits[i]
		local button = self.buttons[unit]
		if (not button) then
			button = self:CreateButton(i)
			self.buttons[unit] = button
		end
			
		button.isDead = nil
	
		local class, race, sex, classLoc, raceLoc, health, mana, manaMax, manaPercentage
		
		if (i == 1) then
			classLoc, class = UnitClass("player")
			raceLoc, race = UnitRace("player")
			sex = UnitSex("player")
			button.GUID = UnitGUID("player")
			button.name = UnitName("player")
			button.powerType = UnitPowerType("player")
			self:UpdateAttributes("arena1")
			health = math.floor((UnitHealth("player")/UnitHealthMax("player")) * 100)
			manaMax = UnitManaMax("player")
			mana = UnitMana("player")
			manaPercentage = math.floor((UnitMana("player")/UnitManaMax("player")) * 100)
		else
			class, race, sex = "PRIEST", "DWARF", 2
			classLoc, raceLoc = "Priest", "Dwarf"	
			button.name = L["Gtestplayer"] .. i
			button.GUID = "testframe"
			button.powerType = i-2
			manaMax = 6000
			health, mana = 100-(i^2), manaMax-(i^5)
			manaPercentage = math.floor((mana/manaMax) * 100)
		end
		
		if ( db.enemyAnnounce ) then
			Gladius:SendAnnouncement(button.name .. " - " .. classLoc, Gladius:GetClassColor(class))
		end
		
		button.manaMax = manaMax
		button.manaActual = mana
		button.manaPercentage = manaPercentage
		button.classLoc = classLoc
		button.class = class
		button.raceLoc = raceLoc
			
		button.castBar:SetMinMaxValues(0,i)
		button.castBar:SetValue(i-0.5)
		button.castBar.spellText:SetText("Example Spell (Rank 1)")
		button.castBar.timeText:SetText(i-0.5)
		
		Gladius:AuraGain("arena1", "Ice Block", select(3, GetSpellInfo(45438)), GetTime()+10, 3)
		
		button.text:SetText(button.name)
		button.health:SetValue(health)
		button.healthText:SetText(health.."%")
		button.mana:SetValue(manaPercentage)
		
		if (not db.classText) then
			button.classText:Hide()
		end
		
		if (not db.manaText) then
			button.manaText:Hide()
		end
		
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

