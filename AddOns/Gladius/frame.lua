local Gladius = Gladius
local db
local currentBracket
local LSM = LibStub("LibSharedMedia-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale("Gladius", true)

--Aura updating
local function AuraUpdate(self, elapsed)
	if (self.auraActive) then
		self.timeLeft = self.timeLeft - elapsed
		if (self.timeLeft <= 0) then
			Gladius:AuraFades(self)
			return
		end	
		self.text:SetFormattedText("%.1f", self.timeLeft)
	end
end

--Cast updating
local function CastUpdate(self, elapsed)
	if (self.isCasting) then
		if (self.value >= self.maxValue) then
			self:SetValue(self.maxValue)
			Gladius:CastEnd(self)
			return
		end
		self.value = self.value + elapsed
		self:SetValue(self.value)
		self.timeText:SetFormattedText("%.1f", self.maxValue-self.value)
	elseif (self.isChanneling) then
		if (self.value <= 0) then
			Gladius:CastEnd(self)
			return
		end
		self.value = self.value - elapsed
		self:SetValue(self.value)
		self.timeText:SetFormattedText("%.1f", self.value)
	end
end

--Create main frame
function Gladius:CreateFrame()
	currentBracket = Gladius.currentBracket
	db = self.db.profile
	
	local backdrop = {bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,}

	--if resizing is off
	if (not db.frameResize) then
		currentBracket = 5 --set current bracket to 5 for correct calculations
	end
	local targetIconSize = db.barHeight
	local classIconSize = db.barHeight
	local height = (db.barHeight*currentBracket)+((currentBracket-1)*db.barBottomMargin)+(db.padding*2)+5
	local width = db.barWidth+(db.padding*2)+5
	
	if (db.castBar) then
		height = height + (currentBracket*db.castBarHeight)		
	end
	
	if (db.powerBar) then
		classIconSize = classIconSize+db.manaBarHeight
		height = height + (currentBracket*db.manaBarHeight)	
	end
	
	if (db.classIcon) then
		width = width + classIconSize
	end
	
	if (db.targetIcon) then
		width = width+targetIconSize
	end
	
	if (db.trinketDisplay == "bigIcon" and db.trinketStatus) then
		width = width+classIconSize
	end
	
	self.frame=CreateFrame("Button", "GladiusFrame", UIParent)
	self.frame:SetBackdrop(backdrop)
	self.frame:SetBackdropColor(db.frameColor.r,db.frameColor.g,db.frameColor.b,db.frameColor.a)
	self.frame:SetScale(db.frameScale)
	self.frame:SetWidth(width)
	self.frame:SetHeight(height)
	self.frame:SetClampedToScreen(true)

	self.frame:ClearAllPoints()
	if (db.x==0 and db.y==0) then
		self.frame:SetPoint("TOP", UIParent, "TOP",0,-15)
	else
		local scale = self.frame:GetEffectiveScale()
		self.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", db.x/scale, db.y/scale)
	end
	self.frame:EnableMouse(true)
	self.frame:SetMovable(true)
	self.frame:RegisterForDrag("LeftButton")
	
	self.frame:SetScript('OnDragStart', function(self) 
		if (not InCombatLockdown() and (IsAltKeyDown() or not db.locked)) then self:StartMoving() end 
	end)
    
	self.frame:SetScript('OnDragStop', function()
		if (not InCombatLockdown()) then
			this:StopMovingOrSizing()
			local scale = self.frame:GetEffectiveScale()
			db.x = self.frame:GetLeft() * scale
			db.y = self.frame:GetTop() * scale
		end
    end)
    
    self.anchor=CreateFrame("Button",nil, self.frame)
    self.anchor:SetWidth(width)
    self.anchor:SetHeight(15)
	self.anchor:SetBackdrop(backdrop)
	self.anchor:SetBackdropColor(0,0,0,1)
	self.anchor:EnableMouse(true)
	self.anchor:RegisterForClicks("RightButtonUp")
	self.anchor:RegisterForDrag("LeftButton")
	self.anchor:SetClampedToScreen(true)
	
	self.anchor:SetScript('OnDragStart', function()
		if (not InCombatLockdown() and (IsAltKeyDown() or not db.locked)) then self.frame:StartMoving() end
     end)
    
    self.anchor:SetScript('OnClick', function()
			if (not InCombatLockdown()) then self:ShowOptions() end
	end)
	
	self.anchor.text = self.anchor:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	self.anchor.text:SetText(L["Gladius - drag to move"])
	self.anchor.text:SetPoint("CENTER", self.anchor, "CENTER")
	
	if (db.locked) then
		self.anchor:Hide()
	end
	
    self.frame:Hide()
	self.frame.buttons={}
end

--Create a button
function Gladius:CreateButton(i)
	db = self.db.profile

	if (not self.frame) then
		self:CreateFrame()
	end
	
	local button = CreateFrame("Frame", "GladiusButtonFrame"..i, self.frame)
	button:Hide()
	
	--selected frame (solid frame around the players target)
    button.selected =  CreateFrame("Frame", "Selected", button)
    button.selected:SetBackdrop({edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 1,})
	
	--Health bar   
	local healthBar = CreateFrame("StatusBar", "HealthBar", button)
	healthBar:ClearAllPoints()
	healthBar:SetPoint("TOPLEFT",button,"TOPLEFT", classIconSize, 0)
	healthBar:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT")
	healthBar:SetStatusBarTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))	
	healthBar:SetMinMaxValues(0, 100)
			   
	healthBar.bg = healthBar:CreateTexture(nil, "BACKGROUND")
	healthBar.bg:ClearAllPoints()
	healthBar.bg:SetAllPoints(healthBar)
	healthBar.bg:SetAlpha(0.3)
			
	--Highlight for the health bar
	healthBar.highlight = healthBar:CreateTexture(nil, "OVERLAY")
    healthBar.highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
    healthBar.highlight:SetBlendMode("ADD")
    healthBar.highlight:SetAlpha(0.5)
    healthBar.highlight:ClearAllPoints()
    healthBar.highlight:SetAllPoints(healthBar)
    healthBar.highlight:Hide()

	--Mana bar
	local manaBar = CreateFrame("StatusBar", "ManaBar", button)
	manaBar:ClearAllPoints()
	manaBar:SetPoint("TOPLEFT",healthBar,"BOTTOMLEFT",0,-1)
	manaBar:SetMinMaxValues(0, 100)
		
	manaBar.bg = manaBar:CreateTexture(nil, "BACKGROUND")
	manaBar.bg:ClearAllPoints()
	manaBar.bg:SetAllPoints(manaBar)
	manaBar.bg:SetAlpha(0.3)

	--Cast bar
	local castBar=CreateFrame("StatusBar", "CastBar", button)
	castBar:SetMinMaxValues(0, 100)
	castBar:SetValue(0)
	castBar:SetScript("OnUpdate", CastUpdate)
	castBar:Hide()
	
	castBar.bg = castBar:CreateTexture(nil, "BACKGROUND")
    castBar.bg:ClearAllPoints()
    castBar.bg:SetAllPoints(castBar)
    castBar.bg:SetAlpha(0.3)
    
    if (db.castBar) then
		castBar:Show()
	end
	
	--Class icon
	local classIcon = button:CreateTexture(nil, "ARTWORK")
    classIcon:ClearAllPoints()
    classIcon:SetPoint("TOPLEFT",button,"TOPLEFT",-2,0)
 	
 	--Aura frame
	local auraFrame = CreateFrame("Frame", nil, button)
    auraFrame:ClearAllPoints()
    auraFrame:SetPoint("TOPLEFT",button,"TOPLEFT",-2,0)
    auraFrame:SetScript("OnUpdate", AuraUpdate)
    
    --The actual icon
    auraFrame.icon = auraFrame:CreateTexture(nil, "ARTWORK")
    auraFrame.icon:SetAllPoints(auraFrame)
    
    --the text
	auraFrame.text = auraFrame:CreateFontString(nil,"OVERLAY")
	auraFrame.text:SetFont(L["GFont"], db.auraFontSize)
	auraFrame.text:SetTextColor(db.auraFontColor.r,db.auraFontColor.g,db.auraFontColor.b,db.auraFontColor.a)
	auraFrame.text:SetShadowOffset(1, -1)
	auraFrame.text:SetShadowColor(0, 0, 0, 1)
	auraFrame.text:SetJustifyH("CENTER")
	auraFrame.text:SetPoint("CENTER",0,0)
	
	--Target icon
	local targetIcon = button:CreateTexture(nil, "ARTWORK")
    targetIcon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
    
	--Name text
	local text = healthBar:CreateFontString(nil,"OVERLAY")
	text:SetFont(L["GFont"], db.healthFontSize)
	text:SetTextColor(db.healthFontColor.r,db.healthFontColor.g,db.healthFontColor.b,db.healthFontColor.a)
	text:SetShadowOffset(1, -1)
	text:SetShadowColor(0, 0, 0, 1)
	text:SetJustifyH("LEFT")
	text:SetPoint("LEFT",5,0)
	
	--Trinket "text"
	local trinket = healthBar:CreateFontString(nil,"OVERLAY")
	trinket:SetFont(L["GFont"], db.healthFontSize)
	trinket:SetTextColor(db.healthFontColor.r,db.healthFontColor.g,db.healthFontColor.b,db.healthFontColor.a)
	trinket:SetShadowOffset(1, -1)
	trinket:SetShadowColor(0, 0, 0, 1)
	trinket:SetPoint("LEFT", text, "RIGHT",0,0)
	
	--Trinket icon that overrides auras/class icon
	local overrideTrinket = button:CreateTexture(nil, "OVERLAY")
	overrideTrinket:ClearAllPoints()
    overrideTrinket:SetPoint("TOPLEFT",button,"TOPLEFT",-2,0)
    overrideTrinket.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    overrideTrinket.cooldown:ClearAllPoints()
    overrideTrinket.cooldown:SetAllPoints(overrideTrinket)
    
    --Big trinket icon
    local bigTrinket = button:CreateTexture(nil, "ARTWORK")
    bigTrinket.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    
    --Small trinket icon
    local smallTrinket = button:CreateTexture(nil, "ARTWORK")
    smallTrinket.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    
    --Grid-style trinket icon
	local gridTrinket =  CreateFrame("Frame", "Selected", button)
    gridTrinket:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground", tileSize = 1, edgeFile = "Interface\\ChatFrame\\ChatFrameBackground", edgeSize = 1,})
	gridTrinket:SetBackdropColor(0,1,0,1)
	gridTrinket:SetBackdropBorderColor(0,0,0,1)
	gridTrinket.cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")

	--Health text
	local healthText = healthBar:CreateFontString(nil,"LOW")
	healthText:SetFont(L["GFont"], db.healthFontSize)
	healthText:SetTextColor(db.healthFontColor.r,db.healthFontColor.g,db.healthFontColor.b,db.healthFontColor.a)
	healthText:SetShadowOffset(1, -1)
	healthText:SetShadowColor(0, 0, 0, 1)
	healthText:SetJustifyH("RIGHT")
	healthText:SetPoint("RIGHT",-5,0)
	
	--Mana text
	local manaText = manaBar:CreateFontString(nil,"LOW")
	manaText:SetFont(L["GFont"], db.manaFontSize)
	manaText:SetTextColor(db.manaFontColor.r,db.manaFontColor.g,db.manaFontColor.b,db.manaFontColor.a)
	manaText:SetShadowOffset(1, -1)
	manaText:SetShadowColor(0, 0, 0, 1)
	manaText:SetJustifyH("CENTER")
	manaText:SetPoint("RIGHT",-5,0)	

	--Class and race text
	local classText = manaBar:CreateFontString(nil,"LOW")
	classText:SetFont(L["GFont"], db.manaFontSize)
	classText:SetTextColor(db.manaFontColor.r,db.manaFontColor.g,db.manaFontColor.b,db.manaFontColor.a)
	classText:SetShadowOffset(1, -1)
	classText:SetShadowColor(0, 0, 0, 1)
	classText:SetJustifyH("CENTER")
	classText:SetPoint("LEFT",5,0)
	
	--Cast bar texts
	local castBarTextSpell = castBar:CreateFontString(nil,"LOW")
	castBarTextSpell:SetFont(L["GFont"], db.castBarFontSize)
	castBarTextSpell:SetTextColor(db.castBarFontColor.r,db.castBarFontColor.g,db.castBarFontColor.b,db.castBarFontColor.a)
	castBarTextSpell:SetShadowOffset(1, -1)
	castBarTextSpell:SetShadowColor(0, 0, 0, 1)
	castBarTextSpell:SetJustifyH("CENTER")
	castBarTextSpell:SetPoint("LEFT",5,0)

	local castBarTextTime = castBar:CreateFontString(nil,"LOW")
	castBarTextTime:SetFont(L["GFont"], db.castBarFontSize)
	castBarTextTime:SetTextColor(db.castBarFontColor.r,db.castBarFontColor.g,db.castBarFontColor.b,db.castBarFontColor.a)
	castBarTextTime:SetShadowOffset(1, -1)
	castBarTextTime:SetShadowColor(0, 0, 0, 1)
	castBarTextTime:SetJustifyH("CENTER")
	castBarTextTime:SetPoint("RIGHT",-5,0)
    
    --Secure button for target and focus
	local secure = CreateFrame("Button", "GladiusButton"..i, button, "SecureActionButtonTemplate")
	secure:RegisterForClicks("AnyUp")
    
    button.mana = manaBar
    button.health = healthBar
    button.castBar = castBar
    button.castBar.timeText = castBarTextTime
    button.castBar.spellText = castBarTextSpell
    button.manaText = manaText
    button.healthText = healthText
    button.text = text
    button.trinket = trinket
    button.overrideTrinket = overrideTrinket
    button.smallTrinket = smallTrinket
    button.bigTrinket = bigTrinket
    button.gridTrinket = gridTrinket
    button.classText = classText
    button.classIcon = classIcon
    button.targetIcon = targetIcon
    button.auraFrame = auraFrame
    button.highlight = healthBar.highlight
    button.selected = button.selected
    button.secure = secure
    button.id = i

    return button
end

--Update the frame and all buttons
function Gladius:UpdateFrame()
	local oldBracket
	db = self.db.profile
	currentBracket = Gladius.currentBracket
	
	if (not self.frame) then return end
	
	--if resizing is off
	if (not db.frameResize) then
		oldBracket = currentBracket --store bracket for later
		currentBracket = 5 --set current bracket to 5 for correct calculations
	end
	
	local classIconSize = db.barHeight
	local targetIconSize = db.barHeight
	local margin = db.barBottomMargin
	local height = (db.barHeight*currentBracket)+((currentBracket-1)*db.barBottomMargin)+(db.padding*2)+5
	local width = db.barWidth+(db.padding*2)+5
	local extraBarWidth = 0
	local extraBarHeight = 0
	local selectedHeight = db.barHeight+6
	local offset = 0
	local gridIcon = 0
	local extraSelectedWidth = 0
	
	if (db.castBar) then
		margin = margin + db.castBarHeight
		height = height + (currentBracket*db.castBarHeight)
		extraBarHeight = extraBarHeight + db.castBarHeight
		selectedHeight = selectedHeight + db.castBarHeight + 3		
	end
	
	if (db.powerBar) then
		classIconSize = classIconSize+db.manaBarHeight
		margin = margin+db.manaBarHeight
		height = height + (currentBracket*db.manaBarHeight)
		extraBarHeight = extraBarHeight + db.manaBarHeight
		selectedHeight = selectedHeight + db.manaBarHeight	
	end
	
	if (db.classIcon) then
		width = width + classIconSize
		extraBarWidth = extraBarWidth + classIconSize
		extraSelectedWidth = classIconSize
	end
	
	if (db.targetIcon) then
		width = width+targetIconSize
		offset = targetIconSize/2
	else
		targetIconSize = 0
	end
	
	if (db.trinketDisplay == "bigIcon" and db.trinketStatus) then
		width = width+classIconSize*db.bigTrinketScale
		extraSelectedWidth = extraSelectedWidth + (classIconSize*db.bigTrinketScale)
		offset = offset + (classIconSize/2)*db.bigTrinketScale
	elseif ((db.trinketDisplay == "gridIcon" or db.trinketDisplay == "smallIcon") and db.trinketStatus) then
		gridIcon = db.manaBarHeight
	end
	
	--set frame size and position
	self.frame:ClearAllPoints()
	if (db.x==0 and db.y==0) then
		self.frame:SetPoint("TOP", UIParent, "TOP",0,-15)
	else
		local scale = self.frame:GetEffectiveScale()
		if ( not db.growUp ) then
			self.frame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", db.x/scale, db.y/scale)
		else
			self.frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", db.x/scale, db.y/scale)
		end
	end
	self.frame:SetScale(db.frameScale)
	self.frame:SetWidth(width)
	self.frame:SetHeight(height)
	self.frame:SetBackdropColor(db.frameColor.r,db.frameColor.g,db.frameColor.b,db.frameColor.a)
	
	--set the visibility of the anchor
	if (db.locked) then
		self.anchor:Hide()
	else
		self.anchor:Show()
	end
	
	--anchor
	self.anchor:SetWidth(width)
	self.anchor:ClearAllPoints()
	
	-- if the frame is in grow up mode, use different y when calculating frame position
	if ( not db.growUp ) then
		self.anchor:SetPoint("TOP", self.frame, "TOP",0,15)
		self.anchor:SetScript('OnDragStop', function()
			if (not InCombatLockdown()) then
				self.frame:StopMovingOrSizing()
				local scale = self.frame:GetEffectiveScale()
				db.x = self.frame:GetLeft() * scale
				db.y = self.frame:GetTop() * scale
			end
		end)
	else
		self.anchor:SetScript('OnDragStop', function()
			if (not InCombatLockdown()) then
				self.frame:StopMovingOrSizing()
				local scale = self.frame:GetEffectiveScale()
				db.x = self.frame:GetLeft() * scale
				db.y = self.frame:GetBottom() * scale
			end
		end)
		self.anchor:SetPoint("TOP", self.frame, "BOTTOM")
	end
	
	--if resize is off
	if (not db.frameResize) then
		currentBracket = oldBracket --restore the bracket so it will update the correct amount of buttons
	end
	
	--update all the buttons
	for i=1, currentBracket do
	
		button = self.buttons["arena"..i]
		
		--set button and secure button sizes
		button:SetHeight(db.barHeight)
		button:SetWidth(db.barWidth+extraBarWidth)
		button.secure:SetHeight(db.barHeight+extraBarHeight)
		button.secure:SetWidth(db.barWidth+extraBarWidth+targetIconSize)		
		button:ClearAllPoints()	
		button.secure:ClearAllPoints()
		
		if ( not db.growUp ) then 
			if ( i==1 ) then
				button:SetPoint("TOP",self.frame,"TOP", 1-offset, -1-(db.padding))
				button.secure:SetPoint("TOP",self.frame,"TOP", 1, -1-(db.padding))
			else
				button:SetPoint("TOP",self.buttons["arena"..i-1],"BOTTOM", 0, -margin)
				button.secure:SetPoint("TOP",self.buttons["arena" .. i-1],"BOTTOM", 0, -margin)
			end
		else
			if ( i==1 ) then
				button:SetPoint("BOTTOM",self.frame,"BOTTOM", 1-offset, 4+db.padding+extraBarHeight)
				button.secure:SetPoint("BOTTOM",self.frame,"BOTTOM", 1, 4+db.padding)
			else
				button:SetPoint("BOTTOM",self.buttons["arena"..i-1],"TOP", 0, margin)
				button.secure:SetPoint("BOTTOM",self.buttons["arena" .. i-1],"TOP", 0, margin-extraBarHeight)
			end
		end
		
		--color of selected border
		if (button.GUID == UnitGUID("target") and db.selectedBorder) then
			button.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,db.selectedFrameColor.a)
		elseif (button.GUID ~= UnitGUID("target") or (button.GUID == UnitGUID("target") and not db.selectedBorder)) then
			button.selected:SetBackdropBorderColor(db.selectedFrameColor.r,db.selectedFrameColor.g,db.selectedFrameColor.b,0)
		end
	
		--set highlight visiblity
		if (button.GUID == UnitGUID("target") and db.highlight) then
			button.highlight:Show()
		elseif (button.GUID == UnitGUID("target") and not db.highlight) then
			button.highlight:Hide()
		end
		
		--size of the selected frame
		button.selected:SetHeight(selectedHeight)
		button.selected:SetWidth(db.barWidth+extraSelectedWidth+targetIconSize+9)
		button.selected:ClearAllPoints()
		button.selected:SetPoint("TOP",button,"TOP", offset-1, 3)
		
		--health bar location and texture
		button.health:ClearAllPoints()
		if (db.classIcon) then
			button.health:SetPoint("TOPLEFT",button,"TOPLEFT", classIconSize, 0)
		else
			button.health:SetPoint("TOPLEFT",button,"TOPLEFT")
		end
		button.health:SetPoint("BOTTOMRIGHT",button,"BOTTOMRIGHT")				
		button.health:SetStatusBarTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))	
		button.health.bg:SetTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))
		
		--mana bar location, size and texture		
		button.mana:ClearAllPoints()
		button.mana:SetHeight(db.manaBarHeight)
		button.mana:SetWidth(button.health:GetWidth()+targetIconSize-gridIcon)
		button.mana:SetPoint("TOPLEFT",button.health,"BOTTOMLEFT",0,-1)
		button.mana:SetStatusBarTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))
		button.mana.bg:SetTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))
		
		if (not db.powerBar) then
			button.mana:Hide()
		else
			button.mana:Show()
		end
		
		--cast bar location, size, texture and color
		button.castBar:ClearAllPoints()
		if (db.powerBar) then
			button.castBar:SetPoint("TOPLEFT",button,"BOTTOMLEFT",0,-3-db.manaBarHeight)
		else
			button.castBar:SetPoint("TOPLEFT",button,"BOTTOMLEFT",0,-3)
		end			
		button.castBar:SetHeight(db.castBarHeight)
		if (db.classIcon) then
			button.castBar:SetWidth(button.health:GetWidth()+classIconSize+targetIconSize)
		else
			button.castBar:SetWidth(button.health:GetWidth()+targetIconSize)
		end
		button.castBar:SetStatusBarTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))
		button.castBar.bg:SetTexture(LSM:Fetch(LSM.MediaType.STATUSBAR, db.barTexture))
		button.castBar:SetStatusBarColor(db.castBarColor.r,db.castBarColor.g,db.castBarColor.b,db.castBarColor.a)
	
		if (not db.castBar) then
			button.castBar:Hide()
		else
			button.castBar:Show()
		end
		
		--font sizes and color
		button.text:SetFont(L["GFont"], db.healthFontSize)
		button.healthText:SetFont(L["GFont"], db.healthFontSize)
		button.manaText:SetFont(L["GFont"], db.manaFontSize)
		button.classText:SetFont(L["GFont"], db.manaFontSize)
		button.castBar.spellText:SetFont(L["GFont"], db.castBarFontSize)
		button.castBar.timeText:SetFont(L["GFont"], db.castBarFontSize)
		
		
		--power bar colors
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
		
		--class icon size
		button.classIcon:SetWidth(classIconSize)
		button.classIcon:SetHeight(classIconSize+1)
		button.auraFrame:SetWidth(classIconSize)
		button.auraFrame:SetHeight(classIconSize+1)
				
		if (not db.classIcon) then
			button.classIcon:Hide()
		else
			button.classIcon:Show()
		end					
			
		--Target icon
		button.targetIcon:SetHeight(targetIconSize)
		button.targetIcon:SetWidth(targetIconSize)
		button.targetIcon:ClearAllPoints()
		button.targetIcon:SetPoint("TOPRIGHT",button,"TOPRIGHT", targetIconSize+1, 0)
		
		if (not db.targetIcon) then
			button.targetIcon:Hide()
		else
			button.targetIcon:Show()
		end	
		
		--text toggling
		if (not db.classText and not db.raceText) then
			button.classText:Hide()
		else
			button.classText:Show()
		end
		
		if (not db.manaText) then
			button.manaText:Hide()
		else
			button.manaText:Show()
		end
		
		--override trinket icon
		button.overrideTrinket:SetWidth(classIconSize)
		button.overrideTrinket:SetHeight(classIconSize+1)
		button.overrideTrinket:SetTexture(Gladius:GetTrinketIcon("player", false))
		button.overrideTrinket.cooldown:SetWidth(classIconSize)
		button.overrideTrinket.cooldown:SetHeight(classIconSize+1)	
		
		if (db.trinketDisplay ~= "overrideIcon" or not db.trinketStatus or not db.classIcon) then
			button.overrideTrinket:Hide()
			button.overrideTrinket.cooldown:Hide()
		else
			button.overrideTrinket:Show()
			button.overrideTrinket.cooldown:Show()
		end
		
		--the big trinket icon		
		button.bigTrinket:SetWidth(classIconSize*db.bigTrinketScale)
		button.bigTrinket:SetHeight((classIconSize+1)*db.bigTrinketScale)
		button.bigTrinket:SetTexture(Gladius:GetTrinketIcon("player", false))
		button.bigTrinket:ClearAllPoints()
		local parent = db.targetIcon and button.targetIcon or button
		button.bigTrinket:SetPoint("TOPRIGHT",parent,"TOPRIGHT", (classIconSize+1)*db.bigTrinketScale, 0)
		
		button.bigTrinket.cooldown:SetWidth(classIconSize)
		button.bigTrinket.cooldown:SetHeight(classIconSize+1)	
		button.bigTrinket.cooldown:ClearAllPoints()
		button.bigTrinket.cooldown:SetAllPoints(button.bigTrinket)
		
		if (db.trinketDisplay ~= "bigIcon" or not db.trinketStatus) then
			button.bigTrinket:Hide()
			button.bigTrinket.cooldown:Hide()
		else
			button.bigTrinket:Show()
			button.bigTrinket.cooldown:Show()
		end
		
		--small trinket icon
		button.smallTrinket:SetWidth(db.manaBarHeight)
		button.smallTrinket:SetHeight(db.manaBarHeight)
		button.smallTrinket:SetTexture(Gladius:GetTrinketIcon("player", false))
		button.smallTrinket:ClearAllPoints()
		button.smallTrinket:SetPoint("LEFT",button.mana,"RIGHT")
		
		button.smallTrinket.cooldown:SetWidth(db.manaBarHeight)
		button.smallTrinket.cooldown:SetHeight(db.manaBarHeight)	
		button.smallTrinket.cooldown:ClearAllPoints()
		button.smallTrinket.cooldown:SetAllPoints(button.smallTrinket)
		
		if (db.trinketDisplay ~= "smallIcon" or not db.trinketStatus) then
			button.smallTrinket:Hide()
			button.smallTrinket.cooldown:Hide()
		else
			button.smallTrinket:Show()
			button.smallTrinket.cooldown:Show()
		end
		
		--grid trinket icon
		button.gridTrinket:SetWidth(db.manaBarHeight)
		button.gridTrinket:SetHeight(db.manaBarHeight)
		button.gridTrinket:ClearAllPoints()
		button.gridTrinket:SetPoint("LEFT",button.mana,"RIGHT")
		
		button.gridTrinket.cooldown:SetWidth(db.manaBarHeight)
		button.gridTrinket.cooldown:SetHeight(db.manaBarHeight)	
		button.gridTrinket.cooldown:ClearAllPoints()
		button.gridTrinket.cooldown:SetAllPoints(button.gridTrinket)
		
		if (db.trinketDisplay ~= "gridIcon" or not db.trinketStatus) then
			button.gridTrinket:Hide()
			button.gridTrinket.cooldown:Hide()
		else
			button.gridTrinket:Show()
			button.gridTrinket.cooldown:Show()
		end
		
		--do some extra updates if the frame is in test mode
		if (self.frame.testing) then
			button.classText:SetText("")
			
			
			--set the class/race text
			if (db.classText) then
				button.classText:SetText(button.classLoc)
			end
			
			if (db.raceText) then
				if button.classText:GetText() then
					button.classText:SetFormattedText("%s %s", button.raceLoc, button.classText:GetText())
				else
					button.classText:SetText(button.raceLoc)
				end
			end
			
			--set the mana text
			button.manaText:SetText("")
			if (db.manaActual) then
				button.manaText:SetFormattedText("%d", button.manaActual)
			end
			if (db.manaMax) then
				if button.manaText:GetText() then
					button.manaText:SetFormattedText("%s/%d", button.manaText:GetText(), button.manaMax)
				else
					button.manaText:SetFormattedText("%d", button.manaMax)
				end
			end
			if (db.manaPercentage) then
				if button.manaText:GetText() then
					button.manaText:SetFormattedText("%s (%d%%)", button.manaText:GetText(), button.manaPercentage)
				else
					button.manaText:SetFormattedText("%d%%", button.manaPercentage)
				end		
			end
			
			--Trinket text toggling
			if (not db.trinketStatus or (db.trinketDisplay ~= "nameText" and db.trinketDisplay ~= "nameIcon")) then
				button.trinket:SetText("")
			else
				local text = db.trinketDisplay == "nameText" and " (t)" or Gladius:GetTrinketIcon("player", true)
				local alpha = db.trinketDisplay == "nameText" and 1 or 0.5
				button.trinket:SetText(text)
				button.trinket:SetAlpha(alpha)
			end

		end
		
		Gladius:UpdateAttributes("arena"..i)
	end
end
