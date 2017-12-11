local beql = LibStub("AceAddon-3.0"):GetAddon("beql")

local L = LibStub("AceLocale-3.0"):GetLocale("beql")

local minwidth = 175;

--  Initial functions
-- creates all needed frames for the Tracker
function beql:InitAchievementTracker()
	-- Creates the Position Point of the Tracker
	beql.ATrackerAnchor = CreateFrame("Frame","ATrackerAnchor", UIParent)
	beql.ATrackerAnchor:SetFrameStrata("BACKGROUND")
	beql.ATrackerAnchor:SetFrameLevel(1)
	beql.ATrackerAnchor:SetWidth(1)
	beql.ATrackerAnchor:SetHeight(1)
	beql.ATrackerAnchor:SetMovable(true)
	if beql.db.char.AchievementTracker.posx == 0 and beql.db.char.AchievementTracker.posy == 0 then
		-- on first login, set it to old watchframe position
		beql.ATrackerAnchor:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", -93, -13)
		--and save it to char.db
		beql:SavePositionATracker()
	else
		beql.ATrackerAnchor:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", beql.db.char.AchievementTracker.posx, beql.db.char.AchievementTracker.posy)
	end

	-- Creates the show/hide and alpha Frame 
	beql.ATrackerBackdrop = CreateFrame("Frame","ATrackerBackdrop", ATrackerAnchor)
	beql.ATrackerBackdrop:SetFrameStrata("BACKGROUND")
	beql.ATrackerBackdrop:SetFrameLevel(1)
	beql.ATrackerBackdrop:SetWidth(150)
	beql.ATrackerBackdrop:SetHeight(100)
	beql.ATrackerBackdrop:SetMovable(true)
	beql.ATrackerBackdrop:SetAlpha(1)
	beql.ATrackerBackdrop:SetPoint("TOPRIGHT", "ATrackerAnchor", "BOTTOMRIGHT", 0,0)
	beql.ATrackerBackdrop:Show()

	
	
	-- Creates the Trackerframe
	beql.ATracker = CreateFrame("Frame","ATracker", ATrackerBackdrop)
	beql.ATracker:SetFrameStrata("BACKGROUND")
	beql.ATracker:SetPoint("TOPLEFT",ATrackerBackdrop, "TOPLEFT",0,0-32)
	beql.ATracker:SetPoint("TOPRIGHT",ATrackerBackdrop, "TOPRIGHT",0,0-32)
	beql.ATracker:SetPoint("BOTTOMLEFT",ATrackerBackdrop, "BOTTOMLEFT",0,0)
	beql.ATracker:SetPoint("BOTTOMRIGHT",ATrackerBackdrop, "BOTTOMRIGHT",0,0)
	beql.ATracker:SetBackdrop({
		bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile = true, edgeSize = 16, tileSize = 16,
		insets = { left= 4, right = 4, top = 4, bottom = 4 }
		})			
	beql.ATracker:SetMovable(true)
	beql.ATracker:Show()

	beql.ATrackerTitle = CreateFrame("Frame","ATrackerTitle", ATrackerBackdrop)
	beql.ATrackerTitle:ClearAllPoints()
	beql.ATrackerTitle:SetHeight(32)
	beql.ATrackerTitle:SetPoint("TOPLEFT",ATrackerBackdrop, "TOPLEFT",0,-4)
	beql.ATrackerTitle:SetPoint("TOPRIGHT",ATrackerBackdrop, "TOPRIGHT",0,-4)
	beql.ATrackerTitle:SetBackdrop({
		bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile = true, edgeSize = 16, tileSize = 16,
		insets = { left= 4, right = 4, top = 4, bottom = 4 }
		})			
	beql.ATrackerTitle:SetFrameStrata("BACKGROUND")
	beql.ATrackerTitle:SetFrameLevel(1)
	beql.ATrackerTitle:SetMovable(true)
	beql.ATrackerTitle:Show()

	
	beql.ATrackerTitleText = beql.ATrackerTitle:CreateFontString("ATrackerTitleText","BACKGROUND","QuestFont")
	beql.ATrackerTitleText:SetPoint("LEFT",10,1)
	beql.ATrackerTitleText:SetAlpha(1)
	beql.ATrackerTitleText:SetText(L["Achievement Tracker"])


	beql.ATrackerMinimizeButton = CreateFrame("Button","ATrackerMinimizeButton", ATrackerTitle, "UIPanelButtonTemplate")
	beql.ATrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
	beql.ATrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
	beql.ATrackerMinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	beql.ATrackerMinimizeButton:SetWidth(18)
	beql.ATrackerMinimizeButton:SetHeight(18)
	beql.ATrackerMinimizeButton:SetFrameLevel(6)
	beql.ATrackerMinimizeButton:Show()
	beql.ATrackerMinimizeButton:ClearAllPoints()
	beql.ATrackerMinimizeButton:SetPoint("TOPRIGHT",ATrackerTitle, "TOPRIGHT", -3,2)
	beql.ATrackerMinimizeButton:SetScript("OnClick", 
		function() 
			if not beql.db.char.AchievementTracker.minimized then 
				beql:minimizeATracker()
				beql.db.char.AchievementTracker.minimized = true
			else
				beql:maximizeATracker()
				beql.db.char.AchievementTracker.minimized = false
			end
		end
	)
	
	beql.ATrackerDrag = CreateFrame("Frame","ATrackerDrag", ATrackerBackdrop)
	beql.ATrackerDrag:SetAllPoints(ATrackerBackdrop)
	beql.ATrackerDrag:SetFrameLevel(5)
	beql.ATrackerDrag:Show()
	beql.ATrackerDrag:RegisterForDrag("LeftButton");
	beql.ATrackerDrag:SetScript("OnDragStart",
        function() 
          beql.ATrackerAnchor.ismoving = true 
          beql.ATrackerAnchor:StartMoving() 
        end)
	beql.ATrackerDrag:SetScript("OnDragStop",
        function() 
          beql.ATrackerAnchor.ismoving = false 
          beql.ATrackerAnchor:StopMovingOrSizing() 
          beql:SavePositionATracker() 
        end)
	beql:moveableATracker (beql.db.profile.atracker.Locked)
	beql.ATrackerBackdrop:Hide()
	beql:ATracker_Update()
end


function beql:ATrackerEnable()
	-- this is needed, because if you have a button under a frame you can not click them
	--AchievementWatchLine1Button:SetFrameLevel(ATrackerDrag:GetFrameLevel()+1)
	--AchievementWatchFrame:SetParent(ATracker)

	if beql.db.profile.atracker.RemoveFinished then
		beql:RegisterEvent("ACHIEVEMENT_EARNED");
	end
	
	-- now we set alpha color and co.
	
	
	if not beql:IsEventRegistered("PLAYER_ENTERING_WORLD") and GetTrackedAchievements() then
		if beql.db.char.AchievementTracker.minimized then 
			beql:minimizeATracker()
		else
			beql:maximizeATracker()
		end
		ATrackerBackdrop:Show()
		beql:TRACKED_ACHIEVEMENT_UPDATE()
	end
end

function beql:ATrackerDisable()
	AchievementWatchLine1Button:SetFrameLevel(4)
	AchievementWatchFrame:SetParent("UIParent")

	ATrackerBackdrop:Hide()
	
	if beql:IsEventRegistered("ACHIEVEMENT_EARNED") then
		beql:UnregisterEvent("ACHIEVEMENT_EARNED");
	end

	if GetTrackedAchievements() then
		AchievementWatchFrame:Show()
	end

end

--  EVENTS


function beql:PLAYER_ENTERING_WORLD ()
	if beql.db.char.AchievementTracker.Achievement >= 1 then
		SetTrackedAchievement(beql.db.char.AchievementTracker.Achievement) 
	end

	-- not needed  anymore
	beql:UnregisterEvent("PLAYER_ENTERING_WORLD")
	if beql.db.profile.atracker.Enable then
		if beql.db.char.AchievementTracker.minimized then 
			beql:minimizeATracker()
		else
			beql:maximizeATracker()
		end
		beql.ATrackerBackdrop:Show()
	end
end 

function beql:TRACKED_ACHIEVEMENT_UPDATE()
	if GetTrackedAchievements() then
		beql.db.char.AchievementTracker.Achievement = GetTrackedAchievements()
	else
		beql.db.char.AchievementTracker.Achievement = 0
	end

	
	if not beql.db.profile.atracker.Enable then
		return;
	end
	
	if not GetTrackedAchievements() then
		ATrackerBackdrop:Hide()
		return;
	else
		ATrackerBackdrop:Show()
	end

	if AchievementWatchFrame.desiredWidth and AchievementWatchFrame.desiredWidth >= minwidth and not beql.db.char.AchievementTracker.minimized then
		ATrackerBackdrop:SetWidth(AchievementWatchFrame.desiredWidth + 26)
		AchievementWatchFrame:SetWidth(AchievementWatchFrame.desiredWidth)
		beql.ATrackerBackdrop:SetHeight(AchievementWatchFrame:GetHeight() + 58)
	else
		ATrackerBackdrop:SetWidth(minwidth + 26)
		AchievementWatchFrame:SetWidth(AchievementWatchFrame.desiredWidth)
	end
end

-- Remove tracked achievement
function beql:ACHIEVEMENT_EARNED ()
	local lastfinished, _ , _ , _ , _ = GetLatestCompletedAchievements()
	if GetTrackedAchievements() == lastfinished then
		SetTrackedAchievement(0)
	end
end


-- Addon funktions


-- Save Position in Profile

function beql:SavePositionATracker()
	local Right = ATrackerAnchor:GetRight()
	local Top = ATrackerAnchor:GetTop()
	if Right and Top then
		beql.db.char.AchievementTracker.posx = Right
		beql.db.char.AchievementTracker.posy = Top
	end
	beql.ATrackerAnchor:SetPoint("TOPRIGHT", "UIParent", "BOTTOMLEFT", beql.db.char.AchievementTracker.posx, beql.db.char.AchievementTracker.posy)
end

function beql:moveableATracker(newval)
	beql.db.profile.atracker.Locked = newval
	if newval then
			beql.ATrackerDrag:SetMovable(false)
			beql.ATrackerDrag:EnableMouse(false)
	else
			beql.ATrackerDrag:EnableMouse(true)
			beql.ATrackerDrag:SetMovable(true)
	end

end

function beql:minimizeATracker()
	AchievementWatchFrame:SetParent(ATracker)
	beql.ATrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\restore_up")
	beql.ATrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\restore_down")	

	ATrackerBackdrop:SetHeight(ATrackerTitle:GetHeight())
	ATrackerBackdrop:SetWidth(minwidth)
	
	beql.ATracker:Hide()
	--AchievementWatchFrame:Hide()
--	ATrackerDrag:SetFrameLevel(6)
end

function beql:maximizeATracker()
	AchievementWatchFrame:SetParent(ATracker)

	beql.ATrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
	beql.ATrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")	

	ATrackerBackdrop:SetHeight(ATrackerTitle:GetHeight() + AchievementWatchFrame:GetHeight() + 26)
	ATrackerBackdrop:SetWidth(AchievementWatchFrame.desiredWidth + 26)

	beql.ATracker:Show()
	--AchievementWatchFrame:Show()
	--ATrackerDrag:SetFrameLevel(6)
end


function beql:AchievementFrameManagePosition()
	if not GetTrackedAchievements() then
		-- No Achievement Tracking, return
		return
	end
	-- This resizes the frame back to orginal size
	if AchievementWatchFrame.desiredWidth then
		AchievementWatchFrame:SetWidth(AchievementWatchFrame.desiredWidth);
	end
	AchievementWatchFrame:ClearAllPoints()
	if beql.db.profile.atracker.Enable and AchievementWatchFrame:IsShown() then
		AchievementWatchFrame:SetPoint("TOPLEFT", "ATracker", "TOPLEFT", 13, -13)
	else
		AchievementWatchFrame:SetPoint("TOPRIGHT", "MinimapCluster", "BOTTOMRIGHT", -93, -13)
	end
end		

function beql:ATracker_Update()



-- Headline
	beql.ATrackerDrag:ClearAllPoints()
	if ATrackerTitle:IsShown() and beql.db.profile.atracker.headline == false then
		ATrackerTitle:Hide()
		beql.ATrackerDrag:SetPoint("TOPLEFT",ATracker, "TOPLEFT",0,0)
		beql.ATrackerDrag:SetPoint("TOPRIGHT",ATracker, "TOPRIGHT",0,0)
	else
		ATrackerTitle:Show()
		beql.ATrackerDrag:SetPoint("TOPLEFT",ATrackerTitle, "TOPLEFT",0,0)
		beql.ATrackerDrag:SetPoint("TOPRIGHT",ATrackerTitle, "TOPRIGHT",0,0)
	end
	beql.ATrackerDrag:SetPoint("BOTTOMLEFT",ATracker, "BOTTOMLEFT",0,0)
	beql.ATrackerDrag:SetPoint("BOTTOMRIGHT",ATracker, "BOTTOMRIGHT",0,0)

-- Alpha
	ATrackerBackdrop:SetAlpha(beql.db.profile.atracker.alpha)

-- Scale
	ATrackerBackdrop:SetScale(beql.db.profile.atracker.scale)

-- Colorhandling
	if beql.db.profile.atracker.showbg then
		if not beql.db.profile.atracker.ownbgcolor then
		-- Set Tooltipcolor as BG color
			beql.ATrackerTitle:SetBackdropBorderColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
			beql.ATrackerTitle:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
			beql.ATracker:SetBackdropBorderColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
			beql.ATracker:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
		else
		-- Set own Colors
			beql.ATrackerTitle:SetBackdropColor(beql.db.profile.atracker.BgColor.r, beql.db.profile.atracker.BgColor.g, beql.db.profile.atracker.BgColor.b, beql.db.profile.atracker.BgColor.a)
			beql.ATrackerTitle:SetBackdropBorderColor(beql.db.profile.atracker.BgCornerColor.r, beql.db.profile.atracker.BgCornerColor.g, beql.db.profile.atracker.BgCornerColor.b, beql.db.profile.atracker.BgCornerColor.a)
			beql.ATracker:SetBackdropColor(beql.db.profile.atracker.BgColor.r, beql.db.profile.atracker.BgColor.g, beql.db.profile.atracker.BgColor.b, beql.db.profile.atracker.BgColor.a)
			beql.ATracker:SetBackdropBorderColor(beql.db.profile.atracker.BgCornerColor.r, beql.db.profile.atracker.BgCornerColor.g, beql.db.profile.atracker.BgCornerColor.b, beql.db.profile.atracker.BgCornerColor.a)
		end
	else
		beql.ATrackerTitle:SetBackdropColor(0,0,0,0)
		beql.ATrackerTitle:SetBackdropBorderColor(0,0,0,0)
		beql.ATracker:SetBackdropColor(0,0,0,0)
		beql.ATracker:SetBackdropBorderColor(0,0,0,0)
	end

end

--- EOF ---