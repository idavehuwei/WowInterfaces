local folder, core = ...

if not core.LibNameplate then
    return
end

-- local LBF = LibStub("LibButtonFacade", true)

local L = core.L or LibStub("AceLocale-3.0"):GetLocale(folder, true)
local _G = _G
local pairs = pairs
local GetTime = GetTime
local CreateFrame = CreateFrame
local table_remove = table.remove
local table_sort = table.sort
local type = type
local table_getn = table.getn
local Debug = core.Debug
local table_getn = table.getn
local DebuffTypeColor = DebuffTypeColor
local select = select
local string_gsub = string.gsub

local P = {}
local LibNameplate = core.LibNameplate
local nametoGUIDs = core.nametoGUIDs
local buffBars = core.buffBars
local buffFrames = core.buffFrames
local guidBuffs = core.guidBuffs

core.unknownIcon = "Inv_misc_questionmark"

local defaultSettings = core.defaultSettings
defaultSettings.profile.skin_SkinID	 = "Blizzard"
defaultSettings.profile.skin_Gloss = false
defaultSettings.profile.skin_Backdrop = false
defaultSettings.profile.skin_Colors = {}

local prev_OnEnable = core.OnEnable
function core:OnEnable()
    prev_OnEnable(self)

    -- Debug("OnEnable", "frames", self.db.profile)
    P = self.db.profile --this can change on profile change.

    --[[
    if LBF then
        LBF:RegisterSkinCallback(folder, self.SkinCallback, self)
        LBF:Group(self.name):Skin(self.db.profile.skin_SkinID, self.db.profile.skin_Gloss, self.db.profile.skin_Backdrop, self.db.profile.skin_Colors)
    end
    ]]
end

function core:UpdateTexterSkins()
    --[[
    local Group = LBF:Group(folder, "Buffs")
    Group:Skin(P.skin_SkinID, P.skin_Gloss, P.skin_Backdrop, P.skin_Colors)

    for i = 1, NUM_ACTIONBAR_BUTTONS do
        local button = format("ActionButton%d", i)
        if _G[button] then
            Group:AddButton(_G[button])
            _G[button]:SetFrameStrata("HIGH")
        end
    end
    ]]
end

function core:SkinCallback(SkinID, Gloss, Backdrop, Group, Button, Colors)
    Debug("SkinCallback", SkinID, Gloss, Backdrop, Group, Button, Colors)
end

----------------------------------------------------------
-- Update a spell frame's texture size.                 --
----------------------------------------------------------
local function UpdateBuffSize(frame, size)
    frame.icon:SetWidth(size)
    frame.icon:SetHeight(size)
    frame:SetWidth(size)

    if P.showCooldown == true then
        frame:SetHeight(size + frame.cd:GetStringHeight())
    else
        frame:SetHeight(size)
    end
end

------------------------------------------------------
-- Set cooldown text size.                          --
------------------------------------------------------
local function UpdateBuffCDSize(buffFrame, size)
    buffFrame.cd:SetFont("Fonts\\FRIZQT__.TTF", size, "NORMAL")
    buffFrame.cdbg:SetHeight(buffFrame.cd:GetStringHeight())
    -- iconOnShow(buffFrame) --lazy way to hide/show cooldown.
end

--------------------------------------------------
-- Set the stack text size.                     --
--------------------------------------------------
local function SetStackSize(buffFrame, size)
    buffFrame.stack:SetFont("Fonts\\FRIZQT__.TTF", size, "OUTLINE")
end

------------------------------------------
-- Called when spell frames are shown.  --
------------------------------------------
local function iconOnShow(self)
    self:SetAlpha(1)

    self.cdbg:Hide()
    self.cd:Hide()
    self.cdtexture:Hide()
    self.stack:Hide()
    self.border:Hide()
    --  self.skin:Hide()

    if P.showCooldown == true and self.expirationTime > 0 then
        self.cdbg:Show()
        self.cd:Show()

        if P.showCooldownTexture == true then
            self.cdtexture:SetCooldown(self.startTime, self.duration);
            self.cdtexture:Show()
        end
    end

    local iconSize = P.iconSize
    local cooldownSize = P.cooldownSize
    local stackSize = P.stackSize

    -- if not self.spellName then
    --     Debug("iconOnShow", "no spell name?")
    -- end

    local spellName = self.spellName or "X"

    local spellOpts = core:HaveSpellOpts(spellName)

    if spellOpts then
        iconSize = spellOpts.iconSize or iconSize
        cooldownSize = spellOpts.cooldownSize or cooldownSize
        stackSize = spellOpts.stackSize or stackSize
    end

    UpdateBuffCDSize(self, cooldownSize)

    if self.stackCount and self.stackCount > 1 then
        self.stack:SetText(self.stackCount)

        self.stack:Show()
        SetStackSize(self, stackSize)
    end

    if self.isDebuff then
        local colour = DebuffTypeColor[self.debuffType or ""]
        if colour then
            self.border:SetVertexColor(colour.r, colour.g, colour.b)
            self.border:Show()

            -- self.skin:SetVertexColor(colour.r, colour.g, colour.b)
            -- self.skin:Show()
        end

    end

    if self.playerCast and P.biggerSelfSpells == true then
        UpdateBuffSize(self, iconSize * 1.2)
    else
        UpdateBuffSize(self, iconSize)
    end
end

------------------------------------------
-- Called when spell frames are shown.  --
------------------------------------------
local function iconOnHide(self)
    self.stack:Hide()
    self.cdbg:Hide()
    self.cd:Hide()
    self.border:Hide()
    -- self.skin:Hide()
    self.cdtexture:Hide()
    self:SetAlpha(1)

    UpdateBuffSize(self, P.iconSize)
end

----------------------------------------------
-- Fires for spell frames.                  --
----------------------------------------------
local function iconOnUpdate(self, elapsed)
    self.lastUpdate = self.lastUpdate + elapsed
    if self.lastUpdate > 0.1 then --abit fast for cooldown flash.
        self.lastUpdate = 0

        -- if self.stackCount > 0 then
        --     self.stack:SetText(self.stackCount)
        -- end

        if self.expirationTime > 0 then
            local rawTimeLeft = self.expirationTime - GetTime()
            local timeLeft
            if rawTimeLeft < 10 then
                timeLeft = core:Round(rawTimeLeft, 1)
            else
                timeLeft = core:Round(rawTimeLeft)
            end

            if P.showCooldown == true then
                self.cd:SetText(core:SecondsToString(timeLeft, 1))
                self.cd:SetTextColor(core:RedToGreen(timeLeft, self.duration))
                self.cdbg:SetWidth(self.cd:GetStringWidth())
            end

            if (timeLeft / self.duration ) < P.blinkTimeleft and timeLeft < 60 then --buff only has 20% timeleft and is less then 60 seconds.
                local f = GetTime() % 1
                if f > 0.5 then
                    f = 1 - f
                end
                self:SetAlpha(f * 3)
            end

            if GetTime() > self.expirationTime then
                self:Hide()

                local GUID = LibNameplate:GetGUID(self.realPlate)
                if GUID then
                    core:RemoveOldSpells(GUID)
                    core:AddBuffsToPlate(self.realPlate, GUID)
                else
                    local plateName =  LibNameplate:GetName(self.realPlate)
                    if plateName and nametoGUIDs[plateName] then
                        core:RemoveOldSpells(nametoGUIDs[plateName])
                        core:AddBuffsToPlate(self.realPlate, nametoGUIDs[plateName])
                    end
                end
            end
        end
    end
end

function core:RemoveOldSpells(GUID)
    for i=(P.numBars * P.iconsPerBar), 1, -1 do
        if guidBuffs[GUID] and guidBuffs[GUID][i] then
            if guidBuffs[GUID][i].expirationTime and guidBuffs[GUID][i].expirationTime > 0 and GetTime() > guidBuffs[GUID][i].expirationTime then
                -- Debug("RemoveOldSpells", GUID, i, guidBuffs[GUID][i].name)
                table_remove(guidBuffs[GUID], i)
            end
        end
    end
end

local function SetBarSize(barFrame, width, height)
    barFrame:SetWidth(width)
    barFrame:SetHeight(height)
end

local function CreateBuffFrame(parentFrame, realPlate)
    local f = CreateFrame("Frame", nil, parentFrame) --
    f.realPlate = realPlate
    f:SetFrameStrata("BACKGROUND")

    f.icon = CreateFrame("Frame", nil, f)
    f.icon:SetPoint("TOP", f)

    f.texture = f.icon:CreateTexture(nil,"BACKGROUND")
    f.texture:SetAllPoints(true)

    local cd = f:CreateFontString(nil, "ARTWORK", "ChatFontNormal")

    cd:SetText("0")
    cd:SetPoint("TOP", f.icon, "BOTTOM")
    f.cd = cd

    --Make the text easier to see.
    f.cdbg = f:CreateTexture(nil,"BACKGROUND")
    f.cdbg:SetTexture(0,0,0,.75)
    f.cdbg:SetPoint("CENTER", cd)

    --clock cooldown texture
    -- f.cdtextureP = CreateFrame("Frame", nil, f)
    -- f.cdtextureP:SetPoint("TOP", f)

    f.cdtexture = CreateFrame("Cooldown", nil, f.icon, "CooldownFrameTemplate")
    f.cdtexture:SetReverse(true)
    f.cdtexture:SetDrawEdge(false)
    -- f.cdtexture:SetPoint("CENTER", f.icon, 0, -1)
    f.cdtexture:SetAllPoints(true)
    -- f.cdtexture:SetFrameLevel(core.db.profile.frameLevel + 1)

    core:SetFrameLevel(f)

    f.stack = f.icon:CreateFontString(nil, "OVERLAY", "ChatFontNormal")
    f.stack:SetText("0")
    f.stack:SetPoint("BOTTOMRIGHT", f.icon, "BOTTOMRIGHT", -1, 3)


    f.border = f.icon:CreateTexture(nil,"BORDER")
    -- f.border:SetPoint("CENTER", f.icon)
    f.border:SetAllPoints(true)

    f.border:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
    f.border:SetTexCoord(0.296875,0.5703125,0,0.515625)

    f.lastUpdate = 0
    f.expirationTime = 0
    f:SetScript("OnShow", iconOnShow)
    f:SetScript("OnHide", iconOnHide)


    f:SetScript("OnUpdate", iconOnUpdate)
    f.stackCount = 0

    f.cdbg:Hide()
    f.cd:Hide()
    f.border:Hide()
    f.cdtexture:Hide()
    f.stack:Hide()

    --[===[@debug@
    f:EnableMouse(true)
    f:SetScript("OnEnter", function(frame)
        Debug("OnEnter!",
            frame.spellName,
            frame.expirationTime,
            (frame.expirationTime or 0) - GetTime(),
            frame.cd:IsShown()
        )
    end)
    --@end-debug@]===]

    --[[
    if LBF then
        local Group = LBF:Group(folder)
        local skinID = Group.SkinID

        local SkinData = LBF:GetSkins()
        Debug("Create", skinID, SkinData[skinID].Border.Texture)

        f.skin = f.icon:CreateTexture(nil,"OVERLAY")
        f.skin:SetAllPoints(true)

        f.skin:SetTexture(SkinData[skinID].Border.Texture)

        f.skin:SetTexCoord(0.2,0.8,0.2,0.8)
        f.skin:SetBlendMode("ADD")
        f.skin:Hide()
    end
    ]]
    return f
end

--[[
function skinTest()-- /run skinTest()
    local Group = LBF:Group(folder)
    local skinID = Group.SkinID
    local SkinData = LBF:GetSkins()
    Debug("test", SkinData[skinID].Border.Texture)

    for skinID, skinData in pairs(SkinData) do
        for a, b in pairs(skinData.Border) do
            Debug("skinTest 1", skinID, skinData, a, b)
        end
    end
end
]]

------------------------------------------
-- Show/Hide bar background texture.    --
------------------------------------------
function core:UpdateBarsBackground()
    for plate in pairs(buffBars) do
        for b in pairs(buffBars[plate]) do

            if P.showBarBackground == true then
                buffBars[plate][b].barBG:Show()
            else
                buffBars[plate][b].barBG:Hide()
            end

        end
    end
end
-- local barSizes = {}

----------------------------------------------------------
-- Create and return a bar frame.                       --
----------------------------------------------------------
local function CreateBarFrame(parentFrame, realPlate)
    local f = CreateFrame("frame", nil, parentFrame)
    f.realPlate = realPlate

    f:SetFrameStrata("BACKGROUND")
    -- f:SetFrameLevel(parentFrame:GetFrameLevel())


    f:SetWidth(1)
    f:SetHeight(1)

    -- Make the text easier to see.
    f.barBG = f:CreateTexture(nil,"BACKGROUND")
    f.barBG:SetAllPoints(true)

    f.barBG:SetTexture(1,1,1,0.3) --uses for testing
    if P.showBarBackground == true then
        f.barBG:Show()
    else
        f.barBG:Hide()
    end

    f:Show()
    return f
end

----------------------------------------------------------------------
-- Build all our bar frames for a plate.                            --
-- We anchor these to the plate and our spell frames to the bar.    --
----------------------------------------------------------------------
local function BuildPlateBars(plate, visibleFrame)
    buffBars[plate] = buffBars[plate] or {}

    if not buffBars[plate][1] then
        buffBars[plate][1] = CreateBarFrame(visibleFrame, plate)
    end
    buffBars[plate][1]:ClearAllPoints()
    buffBars[plate][1]:SetPoint(P.barAnchorPoint, visibleFrame, P.plateAnchorPoint, P.barOffsetX, P.barOffsetY) -- + GetCooldownHeight(buffFrames[plate][1])
    buffBars[plate][1]:SetParent(visibleFrame) --uhuh

    local barPoint      = P.barAnchorPoint
    local parentPoint   = P.plateAnchorPoint
    if P.barGrowth == 1 then --up
        barPoint = string_gsub(barPoint, "TOP", "BOTTOM");
        parentPoint = string_gsub(parentPoint, "BOTTOM", "TOP");
    else
        barPoint = string_gsub(barPoint, "BOTTOM,", "TOP");
        parentPoint = string_gsub(parentPoint, "TOP", "BOTTOM");
    end

    if P.numBars > 1 then
        for r=2, P.numBars do
            if not buffBars[plate][r] then
                buffBars[plate][r] = CreateBarFrame(visibleFrame, plate)
            end
            buffBars[plate][r]:ClearAllPoints()

            buffBars[plate][r]:SetPoint(barPoint, buffBars[plate][r-1], parentPoint, 0, 0)
            buffBars[plate][r]:SetParent(visibleFrame) --uhuh
        end
    end
end

local function GetBarChildrenSize(n, ...)
    local frame
    local totalWidth = 1
    local totalHeight = 1
    if n > P.iconsPerBar then
        n = P.iconsPerBar
    end
    for i = 1, n do
        frame = select(i, ...)
        if P.shrinkBar == true then
            if frame:IsShown() then
                totalWidth = totalWidth + frame:GetWidth()

                if frame:GetHeight() > totalHeight then
                    totalHeight = frame:GetHeight()
                end
            end
        else
            totalWidth = totalWidth + frame:GetWidth()

            if frame:GetHeight() > totalHeight then
                totalHeight = frame:GetHeight()
            end
        end
    end
    return totalWidth, totalHeight
end

--------------------------------------------------------------------------------------
-- Update a bar's size taking into account all the spell frame's height and width.  --
--------------------------------------------------------------------------------------
local function UpdateBarSize(barFrame)
    if barFrame:GetNumChildren() == 0 then
        -- Debug("Our buff bar lost it's children?")
        return
    end

    local totalWidth, totalHeight = GetBarChildrenSize(barFrame:GetNumChildren(), barFrame:GetChildren())

    barFrame:SetWidth(totalWidth)
    barFrame:SetHeight(totalHeight)
end

local function UpdateAllBarSizes(plate)
    -- for r=P.numBars, 1, -1  do
    for r=1, P.numBars  do
        UpdateBarSize(buffBars[plate][r])
    end
end

function core:UpdateAllPlateBarSizes()
    for plate in pairs(buffBars) do
        UpdateAllBarSizes(plate)
    end
end

----------------------------------------------
-- Show spells on a plate linked to a GUID. --
----------------------------------------------
function core:AddBuffsToPlate(plate, GUID)
    if not buffFrames[plate] or not buffFrames[plate][P.numBars]  then
        self:BuildBuffFrame(plate)
    end

    local t, f
    -- Debug("AddBuffsToPlate 0", GUID)
    if guidBuffs[GUID] then
        table_sort(guidBuffs[GUID], function(a,b)
            if(a and b) then
                if a.playerCast ~= b.playerCast then
                    return (a.playerCast or 0) > (b.playerCast or 0)
                elseif a.expirationTime == b.expirationTime then
                    return a.name  < b.name
                else
                    return (a.expirationTime or 0) < (b.expirationTime or 0)
                end
            end
        end)

        for i=1, P.numBars * P.iconsPerBar do
            if buffFrames[plate][i] then
                if guidBuffs[GUID][i] then --and (not guidBuffs[GUID][i].expirationTime or guidBuffs[GUID][i].expirationTime == 0 or guidBuffs[GUID][i].expirationTime > GetTime()) then
                    buffFrames[plate][i].spellName      = guidBuffs[GUID][i].name or ""
                    buffFrames[plate][i].expirationTime = guidBuffs[GUID][i].expirationTime or 0
                    buffFrames[plate][i].duration       = guidBuffs[GUID][i].duration or 1
                    buffFrames[plate][i].startTime      = guidBuffs[GUID][i].startTime or GetTime()
                    buffFrames[plate][i].stackCount     = guidBuffs[GUID][i].stackCount or 0
                    buffFrames[plate][i].isDebuff       = guidBuffs[GUID][i].isDebuff
                    buffFrames[plate][i].debuffType     = guidBuffs[GUID][i].debuffType
                    buffFrames[plate][i].playerCast     = guidBuffs[GUID][i].playerCast
                    buffFrames[plate][i].texture:SetTexture("Interface\\Icons\\"..guidBuffs[GUID][i].icon)

                    -- if buffFrames[plate][i]:IsShown() then
                    --     iconOnShow(buffFrames[plate][i])
                    -- else
                        buffFrames[plate][i]:Show()--make sure OnShow fires.
                    -- end

                    --Making sure it does fire. sometimes it doesn't. =/
                    iconOnShow(buffFrames[plate][i])

                    iconOnUpdate(buffFrames[plate][i], 1) --do a onupdate.
                else
                    buffFrames[plate][i]:Hide()
                end
            end
        end
        UpdateAllBarSizes(plate)
    end
end

----------------------------------------------------------------------------------
-- Display a question mark icon since we don't know the GUID of the plate/mob.	--
----------------------------------------------------------------------------------
function core:AddUnknownIcon(plate)
    if not buffFrames[plate] then
        self:BuildBuffFrame(plate, nil, true)
    end

    local i = 1 --eaiser for me to copy/paste code elsewhere.
    buffFrames[plate][i].spellName      = false
    buffFrames[plate][i].expirationTime = 0
    buffFrames[plate][i].duration       = 1
    buffFrames[plate][i].stackCount     = 0
    buffFrames[plate][i].isDebuff       = false
    buffFrames[plate][i].debuffType     = false
    buffFrames[plate][i].playerCast     = false

    buffFrames[plate][i].texture:SetTexture("Interface\\Icons\\"..core.unknownIcon)

    if buffFrames[plate][i]:IsShown() then
        buffFrames[plate][i]:Hide()
    end
    buffFrames[plate][i]:Show()

    UpdateAllBarSizes(plate)
end

function core:UpdateAllFrameLevel()
    for plate in pairs(self.buffFrames) do
        for i=1, table_getn(self.buffFrames[plate]) do
            self:SetFrameLevel( self.buffFrames[plate][i] )
        end
    end
end

function core:SetFrameLevel(frame)
    -- Debug("SetFrameLevel",frame, self.db.profile.frameLevel)
    frame:SetFrameLevel( self.db.profile.frameLevel )
    frame.cdtexture:SetFrameLevel(self.db.profile.frameLevel + 1)
end

----------------------------------------------------------
-- This will reset all the anchors on the spell frames. --
----------------------------------------------------------
function core:ResetAllPlateIcons()
    for plate in pairs(buffFrames) do
        core:BuildBuffFrame(plate, true)
    end
end

------------------------------------------------------
-- Create our buff frames on a plate.               --
------------------------------------------------------
function core:BuildBuffFrame(plate, reset, onlyOne)

-- 	local visibleFrame = LibNameplate:GetVisibleFrame(plate)
    local visibleFrame = plate
    if not buffBars[plate] then
        BuildPlateBars(plate, visibleFrame)
    end

    if not buffBars[plate][P.numBars] then--user increased the size.
        BuildPlateBars(plate, visibleFrame)
    end


    buffFrames[plate] = buffFrames[plate] or {}

    if reset then
        for i=1, table_getn(buffFrames[plate]) do
            buffFrames[plate][i]:Hide() --makesure all frames stop OnUpdating.
        end
        --[[
        for b in pairs(buffBars[plate]) do
            buffBars[plate][b]:Hide()
        end
        ]]
    end

    local total = 1 --total number of spell frames
    if not buffFrames[plate][total] then
        buffFrames[plate][total] = CreateBuffFrame(buffBars[plate][1], plate)
    end
    buffFrames[plate][total]:SetParent(buffBars[plate][1])--Doing this seems to make UpdateBarSize() function properly. =/

    buffFrames[plate][total]:ClearAllPoints()
    buffFrames[plate][total]:SetPoint("BOTTOMLEFT", buffBars[plate][1]) -- + GetCooldownHeight(buffFrames[plate][1])

    if onlyOne then
        --[===[@debug@
        -- Used to see why my frames were doubling up. think I fixed this in LibNameplate r56
        buffFrames[plate][total]:SetScript("OnShow", function(self)
            if self.realPlate.extended then
                Debug("buffFrames OnShow", "buff frame on show!", self.realPlate.extended)
            end
        end)
        --@end-debug@]===]

        --Save CPU cycles not creating every single frame. Lets wait till they're needed.
        -- UpdateBarSize(buffBars[plate][1])
        return
    end

    local prevFrame = buffFrames[plate][total]
    for i=2, P.iconsPerBar do
        total = total + 1
        if not buffFrames[plate][total] then
            buffFrames[plate][total] = CreateBuffFrame(buffBars[plate][1], plate)
        end
        buffFrames[plate][total]:SetParent(buffBars[plate][1])

        buffFrames[plate][total]:ClearAllPoints()
        buffFrames[plate][total]:SetPoint("BOTTOMLEFT", prevFrame, "BOTTOMRIGHT")

        prevFrame = buffFrames[plate][total]
    end
    -- UpdateBarSize(buffBars[plate][1])
    if P.numBars > 1 then
        for r=2, P.numBars do
            for i=1, P.iconsPerBar do
                total = total + 1

                if not buffFrames[plate][total] then
                    buffFrames[plate][total] = CreateBuffFrame(buffBars[plate][r], plate)
                end
                buffFrames[plate][total]:SetParent(buffBars[plate][r])

                buffFrames[plate][total]:ClearAllPoints()
                if i == 1 then
                    buffFrames[plate][total]:SetPoint("BOTTOMLEFT", buffBars[plate][r])
                else
                    buffFrames[plate][total]:SetPoint("BOTTOMLEFT", prevFrame, "BOTTOMRIGHT")
                end
                prevFrame = buffFrames[plate][total]
            end
        -- UpdateBarSize(buffBars[plate][r])
        -- buffBars[plate][r]:Show() --***
        end
    end
end

--------------------------------------------------------------
-- Reset a bar's anchor point.                              --
--------------------------------------------------------------
function core:ResetBarPoint(barFrame, plate, visibleFrame)
    barFrame:ClearAllPoints()

    -- buffFrames[plate][i]:SetPoint(P.barAnchorPoint, plate, P.plateAnchorPoint, P.barOffsetX, P.barOffsetY)
    -- local visibleFrame = visibleFrame or LibNameplate:GetVisibleFrame(plate)
    local visibleFrame = plate
    barFrame:SetParent(visibleFrame)
    barFrame:SetPoint(P.barAnchorPoint, visibleFrame, P.plateAnchorPoint, P.barOffsetX, P.barOffsetY) -- + GetCooldownHeight(barFrame)
end

--------------------------------------------------------------
-- Reset all icon sizes. Called when user changes settings. --
--------------------------------------------------------------
function core:ResetIconSizes()
    local iconSize
    local frame

    for plate in pairs(self.buffFrames) do
        for i=1, table_getn(self.buffFrames[plate]) do
            frame = self.buffFrames[plate][i]

            local spellOpts = self:HaveSpellOpts(frame.name)
            if frame:IsShown() and spellOpts then
                iconSize = spellOpts.iconSize
            else
                iconSize = P.iconSize
            end
            --[[
            if frame:IsShown() and P.spellOpts[frame.name] then
                iconSize = P.spellOpts[frame.name].iconSize
            else
                iconSize = P.iconSize
            end
            ]]

            --Update the spell texture size.
            -- frame.texture:SetWidth(iconSize)
            -- frame.texture:SetHeight(iconSize)

            frame.icon:SetWidth(iconSize)
            frame.icon:SetHeight(iconSize)
            -- frame.cdtextureP:SetWidth(iconSize)
            -- frame.cdtextureP:SetHeight(iconSize)
            -- frame.cdtexture:SetPoint("CENTER", frame.texture, 0, -1)

            --Update the frame as a whole, this takes into account the size of the cooldown size.
            frame:SetWidth(iconSize)

            if P.showCooldown == true then
                frame:SetHeight(iconSize + frame.cd:GetStringHeight())
            else
                frame:SetHeight(iconSize)
            end
            -- frame:SetScale(1)
        end
    end
end

----------------------------------------------------------------------
-- Reset cooldown text sizes. Called when user changes settings.    --
----------------------------------------------------------------------
function core:ResetCooldownSize()
    for plate in pairs(buffFrames) do
        for i=1, table_getn(buffFrames[plate]) do
            -- buffFrames[plate][i].cd:SetFontObject(core:GetCooldownFont())
            local spellOpts = self:HaveSpellOpts(buffFrames[plate][i].spellName)
            --UpdateBuffCDSize(buffFrames[plate][i], buffFrames[plate][i].spellName and P.spellOpts[buffFrames[plate][i].spellName] and P.spellOpts[buffFrames[plate][i].spellName].cooldownSize or P.cooldownSize)
            UpdateBuffCDSize(buffFrames[plate][i], buffFrames[plate][i].spellName and spellOpts and spellOpts.cooldownSize or P.cooldownSize)
        end
    end
end

----------------------------------
-- Update stack text size.      --
----------------------------------
function core:ResetStackSizes()
    for plate in pairs(buffFrames) do
        for i=1, table_getn(buffFrames[plate]) do
            local spellOpts = self:HaveSpellOpts(buffFrames[plate][i].spellName)
            -- SetStackSize(buffFrames[plate][i], buffFrames[plate][i].spellName and P.spellOpts[buffFrames[plate][i].spellName] and P.spellOpts[buffFrames[plate][i].spellName].stackSize or P.stackSize)
            SetStackSize(buffFrames[plate][i], buffFrames[plate][i].spellName and spellOpts and spellOpts.stackSize or P.stackSize)
            -- buffFrames[plate][i].stack:SetFont("Fonts\\FRIZQT__.TTF", P.stackSize, "OUTLINE")
        end
    end
end

--------------------------------------
-- Reset all bar anchors.           --
--------------------------------------
function core:ResetAllBarPoints()
    local barPoint = P.barAnchorPoint
    local parentPoint = P.plateAnchorPoint

    if P.barGrowth == 1 then --up
        barPoint = string_gsub(barPoint, "TOP", "BOTTOM");
        parentPoint = string_gsub(parentPoint, "BOTTOM", "TOP");
    else
        barPoint = string_gsub(barPoint, "BOTTOM,", "TOP");
        parentPoint = string_gsub(parentPoint, "TOP", "BOTTOM");
    end

    for plate in pairs(buffBars) do
        if buffBars[plate][1] then
            self:ResetBarPoint(buffBars[plate][1], plate)
        end

        for r=2, table_getn(buffBars[plate]) do
            buffBars[plate][r]:ClearAllPoints()
            buffBars[plate][r]:SetPoint(barPoint, buffBars[plate][r-1], parentPoint, 0, 0)
        end
    end
end

------------------------------------------------------------------
-- When we change number of icons to show we hide all icons.    --
-- This will reshow the buffs again in their new locations.     --
------------------------------------------------------------------
function core:ShowAllKnownSpells()
    local GUID
    for plate in pairs(buffFrames) do
        local GUID = LibNameplate:GetGUID(plate)
        if GUID then
            self:AddBuffsToPlate(plate, GUID)
        else
            local plateName =  LibNameplate:GetName(plate)
            if plateName and nametoGUIDs[plateName] then
                self:AddBuffsToPlate(plate, nametoGUIDs[plateName])
            end
        end
    end
end

--[===[@debug@
function PB_TestSizes()-- /run PB_TestSizes()
    local plate = LibNameplate:GetTargetNameplate()
    local frame
    Debug("TestSizes", "----")
    if plate and buffBars[plate] then
        for i=1, table_getn(buffBars[plate]) do
            frame = buffBars[plate][i]
            Debug("TestSizes", i, frame:GetScale(), frame:GetWidth(), frame:GetHeight())
        end
    end
end
--@end-debug@]===]

