--[[
Name: RangeDisplay
Revision: $Revision: 209 $
Author(s): mitch0
Website: http://www.wowace.com/projects/range-display/
SVN: svn://svn.wowace.com/wow/range-display/maguiInline/trunk
Description: RangeDisplay displays the estimated range to the current target based on spell ranges and other measurable ranges
Dependencies: LibStub, LibRangeCheck-2.0, Ace3, LibSharedMedia-3.0(optional)
License: Public Domain
]]
local L = LibStub("AceLocale-3.0"):GetLocale("RangeDisplay");
local AppName = L["RangeDisplay"];
local VERSION = AppName .. "-r" .. ("$Revision: 209 $"):match("%d+")

local rc = LibStub("LibRangeCheck-2.0")
local LSM = LibStub:GetLibrary("LibSharedMedia-3.0", true)


-- internal vars

local _ -- throwaway

-- cached stuff

local UnitExists = UnitExists
local UnitIsDeadOrGhost = UnitIsDeadOrGhost
local UnitCanAttack = UnitCanAttack
local UnitIsUnit = UnitIsUnit

-- hard-coded config stuff

local UpdateDelay = .1 -- update frequency == 1/UpdateDelay

local DefaultBGTexture = "Blizzard Dialog Background"
local DefaultBGFile = [[Interface\DialogFrame\UI-DialogBox-Background]]
local DefaultEdgeTexture = "Blizzard Tooltip"
local DefaultEdgeFile = [[Interface\Tooltips\UI-Tooltip-Border]]
local DefaultFontName = "Friz Quadrata TT"
local DefaultFontPath = GameFontNormal:GetFont()
local DefaultFrameWidth = 112
local DefaultFrameHeight = 36

local MaxRangeSpells = {
    ["HUNTER"] = {
        53351, -- ["Kill Shot"] -- 5-45 (Hawk Eye: 47, 49, 51)
        75, -- ["Auto Shot"], -- 5-35 (Hawk Eye: 37, 39, 41)
    },
    ["MAGE"] = {
        133, -- ["Fireball"], -- 35 (Flame Throwing: 38, 41)
        116, -- ["Frostbolt"], -- 30 (Arctic Reach: 33, 36)
        5143, -- ["Arcane Missiles"], -- 30 (Magic Attunement: 33, 36)
    },
    ["SHAMAN"] = {
        403, -- ["Lightning Bolt"], -- 30 (Storm Reach: 33, 36)
        8050, -- ["Flame Shock"], -- 30 (Lava Flows: 25, 30, 35; Gladiator Gloves: +5)
    },
    ["WARLOCK"] = {
        348, -- ["Immolate"], -- 30 (Destructive Reach: 33, 36)
        172, -- ["Corruption"], -- 30 (Grim Reach: 33, 36)
    },
}

---------------------------------

RangeDisplay = LibStub("AceAddon-3.0"):NewAddon(AppName, "AceConsole-3.0", "AceEvent-3.0")
RangeDisplay:SetDefaultModuleState(false)

RangeDisplay.version = VERSION
RangeDisplay.AppName = AppName

-- Default DB stuff

local function makeColor(r, g, b, a)
    a = a or 1.0
    return { ["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a }
end

local defaults = {
    profile = {
        locked = true,
        minimap = {},
        units = {
            ["**"] = {
                enabled = true,
                point = "BOTTOM",
                relPoint = "BOTTOM",
                x = -7,
                y = 169,
                font = DefaultFontName,
                fontSize = 24,
                fontOutline = "",
                strata = "HIGH",
                enemyOnly = false,
                maxRangeOnly = false,
                suffix = "",

                rangeLimit = 100,
                overLimitDisplay = false,
                overLimitSuffix = " +",

                frameWidth = DefaultFrameWidth,
                frameHeight = DefaultFrameHeight,
                bgEnabled = false,
                bgTexture = DefaultBGTexture,
                bgBorderTexture = DefaultEdgeTexture,
                bgTile = false,
                bgTileSize = 32,
                bgEdgeSize = 16,
                bgColor = makeColor(1, 1, 1),
                bgBorderColor = makeColor(0.8, 0.6, 0.0),

                oorSection = {
                    enabled = true,
                    color = makeColor(0.9, 0.055, 0.075),
                    range = 40,
                },
                color = makeColor(1.0, 0.82, 0),
                mrSection = {
                    enabled = true,
                    color = makeColor(0.035, 0.865, 0.0),
                    range = 30,
                },
                srSection = {
                    enabled = true,
                    color = makeColor(0.055, 0.875, 0.825),
                    range = 20,
                },
                crSection = {
                    enabled = true,
                    color = makeColor(0.9, 0.9, 0.9),
                    range = 5,
                },
            },
            ["focus"] = {
                x = -(DefaultFrameWidth + 10),
            },
            ["pet"] = {
                enabled = false,
                x = (DefaultFrameWidth + 10),
            },
        },
    },
}

-- Per unit data

local function isTargetValid(ud)
    local unit = ud.unit
    return UnitExists(unit) and (not UnitIsDeadOrGhost(unit))
            and (not ud.db.enemyOnly or UnitCanAttack("player", unit))
            and (not UnitIsUnit(unit, "player"))
end

local function targetChanged(ud)
    if (ud:isTargetValid()) then
        ud.rangeFrame:Show()
        ud.lastUpdate = UpdateDelay -- to force update in next onUpdate()
    else
        ud.rangeFrame:Hide()
    end
end

local function profileChanged(ud, db) 
    ud.db = db
end

local function mediaUpdate(ud, event, mediaType, key)
    if (mediaType == 'font') then
        if (key == ud.db.font) then
            ud:applyFontSettings()
        end
    elseif (mediaType == 'background') then
        if (key == ud.db.bgTexture) then
            ud:applyBGSettings()
        end
    elseif (mediaType == 'border') then
        if (key == ud.db.bgBorderTexture) then
            ud:applyBGSettings()
        end
    end
end

local function applyBGSettings(ud)
    if (not ud.db.bgEnabled) then
        ud.mainFrame:SetBackdrop(nil)
        return
    end
    ud.bg = ud.bg or { insets = {} }
    local bg = ud.bg
    if (LSM) then
        bg.bgFile = LSM:Fetch("background", ud.db.bgTexture, true)
        if (not bg.bgFile) then
            bg.bgFile = DefaultBGFile
            LSM.RegisterCallback(ud, "LibSharedMedia_Registered", "mediaUpdate")
        end
        bg.edgeFile = LSM:Fetch("border", ud.db.bgBorderTexture, true)
        if (not bg.edgeFile) then
            bg.edgeFile = DefaultEdgeFile
            LSM.RegisterCallback(ud, "LibSharedMedia_Registered", "mediaUpdate")
        end
    else
        bg.bgFile = DefaultBGFile
        bg.edgeFile = DefaultEdgeFile
    end
    bg.tile = ud.db.bgTile
    bg.tileSize = ud.db.bgTileSize
    bg.edgeSize = ud.db.bgEdgeSize
    local inset = math.floor(ud.db.bgEdgeSize / 4)
    bg.insets.left = inset
    bg.insets.right = inset
    bg.insets.top = inset
    bg.insets.bottom = inset
    ud.mainFrame:SetBackdrop(bg)
    ud.mainFrame:SetBackdropColor(ud.db.bgColor.r, ud.db.bgColor.g, ud.db.bgColor.b, ud.db.bgColor.a)
    ud.mainFrame:SetBackdropBorderColor(ud.db.bgBorderColor.r, ud.db.bgBorderColor.g, ud.db.bgBorderColor.b, ud.db.bgBorderColor.a)
end

local function applyFontSettings(ud)
    local dbFontPath
    if (LSM) then
        dbFontPath = LSM:Fetch("font", ud.db.font, true)
        if (not dbFontPath) then
            dbFontPath = DefaultFontPath
            LSM.RegisterCallback(ud, "LibSharedMedia_Registered", "mediaUpdate")
        end
    else
        dbFontPath = DefaultFontPath
    end
    local fontPath, fontSize, fontOutline = ud.rangeFrameText:GetFont()
    fontOutline = fontOutline or ""
    if (dbFontPath ~= fontPath or ud.db.fontSize ~= fontSize or ud.db.fontOutline ~= fontOutline) then
        ud.rangeFrameText:SetFont(dbFontPath, ud.db.fontSize, ud.db.fontOutline)
    end
end

local function applySettings(ud)
	--print(ud.name);
    if (ud.db.enabled) then
        ud:enable()
        ud.mainFrame:ClearAllPoints()
        ud.mainFrame:SetPoint(ud.db.point, UIParent, ud.db.relPoint, ud.db.x, ud.db.y)
        ud.mainFrame:SetWidth(ud.db.frameWidth)
        ud.mainFrame:SetHeight(ud.db.frameHeight)
        ud.mainFrame:SetFrameStrata(ud.db.strata)
        ud:applyFontSettings()
        ud:applyBGSettings()
        ud.lastMinRange, ud.lastMaxRange = false, false -- to force update
        ud:update()
    else
        ud:disable()
    end
end

local function createOverlay(ud)
    local unit = ud.unit

    ud.overlay = ud.mainFrame:CreateTexture("RangeDisplayOverlay_" .. unit, "OVERLAY")
    ud.overlay:SetTexture(0, 0.42, 0, 0.42)
    ud.overlay:SetAllPoints()

    ud.overlayText = ud.mainFrame:CreateFontString("RangeDisplayOverlayText_" .. unit, "OVERLAY", "GameFontNormal")
    ud.overlayText:SetFont(DefaultFontPath, 10, "")
    ud.overlayText:SetJustifyH("CENTER")
    ud.overlayText:SetPoint("BOTTOM", ud.mainFrame, "BOTTOM", 0, 0)
    ud.overlayText:SetText(L[unit])
end
function RangeDisplayOpenConfigDialog()
	RangeDisplay:openConfigDialog();
end
local function createFrame(ud)
    local unit = ud.unit
    ud.isMoving = false
    ud.mainFrame = CreateFrame("Frame", "RangeDisplayMainFrame_" .. unit, UIParent)
    ud.mainFrame:SetFrameStrata(ud.db.strata)
    ud.mainFrame:EnableMouse(false)
    ud.mainFrame:SetClampedToScreen()
    ud.mainFrame:SetMovable(true)
    ud.mainFrame:SetWidth(ud.db.frameWidth)
    ud.mainFrame:SetHeight(ud.db.frameHeight)
    ud.mainFrame:SetPoint(ud.db.point, UIParent, ud.db.relPoint, ud.db.x, ud.db.y)

    ud.rangeFrame = CreateFrame("Frame", "RangeDisplayFrame_" .. unit, ud.mainFrame)
    ud.rangeFrame:SetPoint("CENTER", ud.mainFrame, "CENTER", 0, 0)
    ud.rangeFrame:SetAllPoints()
    ud.rangeFrame:Hide()

    ud.rangeFrameText = ud.rangeFrame:CreateFontString("RangeDisplayFrameText_" .. unit, "ARTWORK", "GameFontNormal")
    ud.rangeFrameText:SetFont(DefaultFontPath, ud.db.fontSize, ud.db.fontOutline)
    ud.rangeFrameText:SetJustifyH("CENTER")
    ud.rangeFrameText:SetPoint("CENTER", ud.rangeFrame, "CENTER", 0, 0)

    ud.lastUpdate = 0

    ud.mainFrame:SetScript("OnMouseDown", function(frame, button)
        if (button == "LeftButton") then
            if (IsControlKeyDown()) then
                RangeDisplay:lock()
                return
            end
            ud.mainFrame:StartMoving()
            ud.isMoving = true
        elseif (button == "RightButton") then
            if (IsShiftKeyDown() or IsControlKeyDown() or IsAltKeyDown()) then
                RangeDisplay:openConfigDialog()
            else
                RangeDisplay:openConfigDialog(ud)
            end
        end
    end)
    ud.mainFrame:SetScript("OnMouseUp", function(frame, button)
        if (ud.isMoving and button == "LeftButton") then
            ud.mainFrame:StopMovingOrSizing()
            ud.isMoving = false
            ud.db.point, _, ud.db.relPoint, ud.db.x, ud.db.y = ud.mainFrame:GetPoint()
        end
    end)
    ud.mainFrame:SetScript("OnEnter", function(frame)
        GameTooltip:SetOwner(frame)
        GameTooltip:AddLine(L["RangeDisplay: %s"]:format(L[unit]))
        GameTooltip:AddLine(L["|cffeda55fDrag|r to move the frame"])
        GameTooltip:AddLine(L["|cffeda55fControl + Left Click|r to lock frames"])
        GameTooltip:AddLine(L["|cffeda55fRight Click|r to open the configuration window"])
        GameTooltip:Show()
    end)
    ud.mainFrame:SetScript("OnLeave", function(frame)
        GameTooltip:Hide()
    end)

    -- OnUpdate is set only on the rangeFrame
    ud.rangeFrame:SetScript("OnUpdate", function(frame, elapsed)
        ud.lastUpdate = ud.lastUpdate + elapsed
        if (ud.lastUpdate < UpdateDelay) then return end
        ud.lastUpdate = 0
        ud:update()
    end)
end

local function enable(ud)
    if (not ud.mainFrame) then
        ud:createFrame()
    end
    if (ud.locked) then
        ud:lock()
    else
        ud:unlock()
    end
    ud.mainFrame:Show()
end

local function disable(ud)
    if (ud.mainFrame) then
        ud.mainFrame:Hide()
    end
end

local function lock(ud)
    ud.locked = true
    if (ud.db.enabled) then
        ud.mainFrame:EnableMouse(false)
        if (ud.overlay) then
            ud.overlay:Hide()
            ud.overlayText:Hide()
        end
    end
end

local function unlock(ud)
    ud.locked = false
    if (ud.db.enabled) then
        if (not ud.overlay) then
            createOverlay(ud)
        end
        ud.mainFrame:EnableMouse(true)
        ud.overlay:Show()
        ud.overlayText:Show()
    end
end

local function update(ud)
    local minRange, maxRange = rc:getRange(ud.unit)
    if (minRange == ud.lastMinRange and maxRange == ud.lastMaxRange) then return end
    ud.lastMinRange, ud.lastMaxRange = minRange, maxRange
    local range = nil
    local color = nil
    if (minRange) then
        if (minRange >= ud.db.rangeLimit) then maxRange = nil end
        if (maxRange) then
            if (ud.db.maxRangeOnly) then
                range = maxRange .. ud.db.suffix
            else
                range = minRange .. " - " .. maxRange .. ud.db.suffix
            end
            if (ud.db.crSection.enabled and maxRange <= ud.db.crSection.range) then
                color = ud.db.crSection.color
            elseif (ud.db.srSection.enabled and maxRange <= ud.db.srSection.range) then
                color = ud.db.srSection.color
            elseif (ud.db.mrSection.enabled and maxRange <= ud.db.mrSection.range) then
                color = ud.db.mrSection.color
            elseif (ud.db.oorSection.enabled and minRange >= ud.db.oorSection.range) then
                color = ud.db.oorSection.color
            else
                color = ud.db.color
            end
        elseif (ud.db.overLimitDisplay) then
            color = (ud.db.oorSection.enabled and minRange >= ud.db.oorSection.range) and ud.db.oorSection.color or ud.db.color
            range = minRange .. ud.db.overLimitSuffix
        end
    end
    ud.rangeFrameText:SetText(range)
    if (color) then
        ud.rangeFrameText:SetTextColor(color.r, color.g, color.b, color.a)
    end
end

local units = {
    {
        unit = "playertarget",
        name = L["playertarget"], -- to make Babelfish happy
        event = "PLAYER_TARGET_CHANGED",
    },
    {
        unit = "focus",
        name = L["focus"], -- to make Babelfish happy
        event = "PLAYER_FOCUS_CHANGED",
    },
    {
        unit = "pet",
        name = L["pet"], -- to make Babelfish happy
        event = "UNIT_PET",
        targetChanged = function(ud, event, unitId, ...)
                if (unitId ~= "player") then return end
                targetChanged(ud, event, unitId, ...)
            end
    },
}

local function autoAdjust(ud)
    local _, playerClass = UnitClass("player")
    local maxRangeSpells = MaxRangeSpells[playerClass]
    if (maxRangeSpells) then
        local oor
        for _, sid in ipairs(maxRangeSpells) do
            local name, _, _, _, _, _, _, _, range = GetSpellInfo(sid)
            if (range and (not oor or oor < range) and rc:findSpellIndex(name)) then
                oor = range
            end
        end
        if (oor) then
            ud.db.oorSection.range = oor
        end
    end
end

for _, ud in ipairs(units) do
    ud.profileChanged = ud.profileChanged or profileChanged
    ud.applySettings = ud.applySettings or applySettings
    ud.applyFontSettings = ud.applyFontSettings or applyFontSettings
    ud.applyBGSettings = ud.applyBGSettings or applyBGSettings
    ud.mediaUpdate = ud.mediaUpdate or mediaUpdate
    ud.targetChanged = ud.targetChanged or targetChanged
    ud.isTargetValid = ud.isTargetValid or isTargetValid
    ud.lock = ud.lock or lock
    ud.unlock = ud.unlock or unlock
    ud.createFrame = ud.createFrame or createFrame
    ud.update = ud.update or update
    ud.autoAdjust = autoAdjust
    ud.enable = enable
    ud.disable = disable
end

-- AceAddon stuff

function RangeDisplay:OnInitialize()
    self.units = units
    self.db = LibStub("AceDB-3.0"):New("DuowanAddon_RangeDisplayDB3", defaults)
    self.db.RegisterCallback(self, "OnProfileChanged", "profileChanged")
    self.db.RegisterCallback(self, "OnProfileCopied", "profileChanged")
    self.db.RegisterCallback(self, "OnProfileReset", "profileChanged")
    self:setupOptions()
    self:profileChanged()
end

function RangeDisplay:OnEnable(first)
end

function RangeDisplay:OnDisable()
    for _, ud in ipairs(units) do
        ud:disable()
    end
    self:UnregisterAllEvents()
end

function RangeDisplay:applySettings()
    if (not self:IsEnabled()) then
        self:OnDisable()
        return
    end
    for _, ud in ipairs(units) do
        if (ud.db.enabled) then
            ud:enable()
            ud:applySettings()
            self:registerTargetChangedEvent(ud)
        else
            ud:disable()
            self:unregisterTargetChangedEvent(ud)
        end
    end
    self:toggleLocked(self.db.profile.locked == true)
end

-- for now we assume that each unitdata is using only 1 event, and there are no overlapping events, as it's faster like this
function RangeDisplay:registerTargetChangedEvent(ud)
    if (ud.event) then
        ud.eventHandler = ud.eventHandler or function(...)
            ud:targetChanged(...)
        end
        self:RegisterEvent(ud.event, ud.eventHandler)
    end
end

function RangeDisplay:unregisterTargetChangedEvent(ud)
    if (ud.event) then
        self:UnregisterEvent(ud.event)
    end
end

function RangeDisplay:profileChanged()
    local locked = self.db.profile.locked
    for _, ud in ipairs(units) do
        ud.locked = locked
        local db = self.db.profile.units[ud.unit]
        ud:profileChanged(db)
    end
    self:applySettings()
end

function RangeDisplay:lock()
    self.db.profile.locked = true
    for _, ud in ipairs(units) do
        ud:lock()
    end
end

function RangeDisplay:unlock()
    self.db.profile.locked = false
    for _, ud in ipairs(units) do
        ud:unlock()
    end
end

function RangeDisplay:toggleLocked(flag)
    if (flag == nil) then flag = not self.db.profile.locked end
    if (flag) then
        self:lock()
    else
        self:unlock()
    end
end

