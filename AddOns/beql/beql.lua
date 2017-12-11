local beql = LibStub("AceAddon-3.0"):NewAddon("beql", "AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
beqlQ = LibStub("LibQuixote-2.0")
local L = LibStub("AceLocale-3.0"):GetLocale("beql")

local VERSION = GetAddOnMetadata("beql", "Version")
beql.revision = VERSION
beql.versionstring = VERSION
beql.beta = 0

-- Debug Function
-- #NODOC
function beql:Print(text)
    DEFAULT_CHAT_FRAME:AddMessage(tostring(text))
end

function beql:debugprint(text)
    if not beql.db or beql.db.profile.debug == true then
        DEFAULT_CHAT_FRAME:AddMessage("bEQL: " .. tostring(text))
    end
end

-- Addon functions
if not beql.IsActive then
    function beql:IsActive()
        return beql:IsEnabled();
    end
end

if not beql.ToggleActive then
    function beql.ToggleActive()
        if beql:IsEnabled() then
            beql:Disable()
            beql.db.profile.AddonStatus = false
        else
            beql:Enable()
            beql.db.profile.AddonStatus = true
        end
    end
end

-- Init beql addon
function beql:OnInitialize()
    -- beql:debugprint("Init beql Addon")
    -- beql:RegisterDB("beqlDB","beqlDBPC")
    beql:InitDB()
    -- beql:SetupDefaults()
    beql:BlizzardSetupOptions()
    beql:RegisterChatCommand("beql", function() InterfaceOptionsFrame_OpenToCategory(beql3.optionsFrames["main"]) end)

    beql.lineCache = {}
    beql.buttonCache = {}
    beql.QuestItems = 0

    beql:SetEnabledState(beql.db.profile.AddonStatus)
    if not beql.db.profile.debug then
        beql.db.profile.debug = true
    end
    -- beql:debugprint("Init beql Addon - done")
end

-- Hook Oldstyle to prevent Quest Gained Bug
beqlQ.Hook_QUEST_LOG_UPDATE = beqlQ.frame.QUEST_LOG_UPDATE

function beqlQ.frame:QUEST_LOG_UPDATE()
    -- manage quests
    if beql:IsActive() then
        beql:ManageQuests()
    end

    -- run org script
    beqlQ.Hook_QUEST_LOG_UPDATE()
end

function beql:OnEnable(...)
    if Expo then
        self.debugFrame = Expo:ReturnDebugFrame()
    end

    -- Check for other addons
    beql:Compatibility()

    -- Init Questlog
    beql:InitQuestLog()
    beql:ToggleQuestlogStyle(beql.db.profile.simplequestlog)
    beql:SetMovableQuestlog(self.db.profile.locked)

    -- Load Questtracker
    if not beql.db.profile.disabled.tracker and not beql.db.profile.disabledtracker then
        beql:ToggleQuestTracker(beql.db.profile.disabledtracker)
        beql:SetMovableQuestTracker(beql.db.profile.lockedtracker)
    end

    -- Init Tooltip
    beql:InitTooltip()


    -- Achievement aren't working anymore, so we disable them
    beql.db.profile.atracker.Enable = false
    beql.db.profile.atracker.savelast = false

    -- Achievements
    if beql.db.profile.atracker.savelast and beql.db.char.AchievementTracker.Achievement >= 1 then
        -- this is needed, because it will not effect before entering world
        beql:RegisterEvent("PLAYER_ENTERING_WORLD");
    end

    if beql.db.profile.atracker.Enable then
        beql:RegisterEvent("TRACKED_ACHIEVEMENT_UPDATE");
        beql:InitAchievementTracker()
        beql:ATrackerEnable()
        beql:setmovabletracker(beql.db.profile.lockedtracker)
    end

    if not beql.db.profile.revision or beql.db.profile.revision ~= beql.revision then
        -- make a infobox
        if beql.beta == 1 then
            --message("This is a beta release.\n Please report bugs on curseforge.\n Angelike")
        else
            --message("bEQL has got an update, please check your settings")
        end

        beql.db.profile.revision = beql.revision
    end

    beql.AddonActive = true;
end

function beql:OnDisable()
    -- backup flags
    local questlogstatus = beql.db.profile.simplequestlog
    local questtrackerstatus = beql.db.profile.disabledtracker
    local achievementtrackerstatus = beql.db.profile.atracker.Enable

    -- disable Questlog
    beql:ToggleQuestlogStyle(true)

    -- disable Tracker
    beql:ToggleQuestTracker(true)

    -- disable Achievementtracker
    -- beql:ToggleAchievementTracker(false)

    -- restore old flags
    beql.db.profile.simplequestlog = questlogstatus
    beql.db.profile.disabledtracker = questtrackerstatus
    beql.db.profile.atracker.Enable = achievementtrackerstatus

    -- Questlog
    QuestLogTitleText:SetText(QUEST_LOG)
    beql:SetQuestLogFontSize(13)
    QuestLogFrame:SetAlpha(1)
    QuestLogFrame:SetScale(1)
    QuestLogFrame:RegisterForDrag(0)
    QuestLogFrame:ClearAllPoints()
    QuestLogFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0,-104)


    beql.ConfigButton:Hide()

    beql:UnhookAll();

    -- Update Frames
    WatchFrame_Update()
    QuestLog_Update()

    --  QuestLogFrame:TriggerEvent("QUESTLOG_UPDATE")
    beql.AddonActive = false;
end

-- Internal for Compatiblity with other addons
-- #NODOC
function beql:Compatibility()
    -- CT-Mod does not block Watchframe anymore
    if IsAddOnLoaded("CT_Core") then
        -- CT_Core fix
        -- leaving there for old users
        beql.db.profile.disabled.lockedtracker = false
        beql.db.profile.disabled.showlevel = false
    else
        beql.db.profile.disabled.showlevel = false
        beql.db.profile.disabled.lockedtracker = false
    end


    if IsAddOnLoaded("Mobmap") then
        beql.db.profile.disabled.markers = true
        optionsmain.args.qtracker.args.MarkerOptions.desc = optionsmain.args.qtracker.args.MarkerOptions.desc.." "..L[" |cffff0000Disabled by|r"].." |cffe0c000Mobmap|r"
        optionsmain.args.qtracker.args.MarkerOptions.args.ShowObjectiveMarkers.desc = optionsmain.args.qtracker.args.MarkerOptions.args.ShowObjectiveMarkers.desc.." "..L[" |cffff0000Disabled by|r"].." |cffe0c000Mobmap|r"
        if beql.db.profile.ShowObjectiveMarkers then
            beql.db.profile.ShowObjectiveMarkers = false
        end
    else
        beql.db.profile.disabled.markers = false
    end

        beql.db.profile.disabled.tracker = false

    if (QuestLogFrame_MidTextures) ~= nil then
        optionsmain.args.qlogoption.args.SimpleQuestLog.desc = optionsmain.args.qlogoption.args.SimpleQuestLog.desc.." "..L[" |cffff0000Disabled by|r"].." |cffe0c000FramesResized|r"
        beql.db.profile.disabled.simplequestlog = true
        beql.db.profile.simplequestlog = true
    else
        beql.db.profile.disabled.simplequestlog = false
    end
end

--------------------------------------------
-- Arguments:
-- number - quest id
-- string - quest name
--
-- Notes:
-- Prints the Quest Name/Status and Objectives to the currently opened chatbox
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:AddQuestStatusToChatFrame(questIndex)
    local chatFrame = DEFAULT_CHAT_FRAME
    local chatType = chatFrame.editBox:GetAttribute("chatType")
    local oText, oType, oNumP, oNumN, oComp
    local text
    if chatType == "WHISPER" then
        chatType = "SAY"
    end
    local qTitle,qLvl,qTag,qRec,qStat,qObj,qZone,qID = beqlQ:GetQuestById(questIndex)
    if qObj and qObj > 0 then
        SendChatMessage("["..qLvl..string.upper(qTag).."] "..qTitle, chatType)
        for i=1, qObj do
            text = ""
            oText, oType, oNumP, oNumN, oComp = beqlQ:GetQuestStatusById(questIndex, i)
            text = oText
            if finished then
                text = text.." "..L["(Done)"]
            else
                text = text..": "..oNumP.."/"..oNumN
            end
            if text and strlen(text) > 0 then
                SendChatMessage(" - "..text, chatType)
            end
        end
    else
        chatFrame:AddMessage(L["No Objectives!"])
    end
    chatFrame.editBox:Hide()
end

--------------------------------------------
-- Notes:
-- Sorts the Tracked quests
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:SortWatchedQuests()
    if beql.db.profile.ShowZonesInTracker and beql.db.profile.SortTrackerItems then
        table.sort(beql.db.char.QuestWatches)
    else
        if beql.db.profile.SortTrackerItems then
            table.sort(beql.db.char.QuestWatches, SortCompare)
        end
    end
end

function SortCompare(first, second)
    local temp = string.gsub(first, ".+,%d+,[%[%d+%+*%]]*", "")
    local temp2 = string.gsub(second, ".+,%d+,[%[%d+%+*%]]*", "")
    if temp < temp2  then
        return true
    end
    return false
end

--------------------------------------------
-- Notes:
-- Manage Tracked Quest list
--
-- Returns:
-- * nothing
--------------------------------------------
function beql:ManageQuests()
    local tempHeaderList = {}
    local tempQuestList = {}
    local numEntries = GetNumQuestLogEntries()
    local questLogTitleText, level, questTag, isHeader, isCollapsed, isComplete
    local currentHeader = nil
    local temp, _

    local oldTitle

    -- for new quests in questlog
    local oldquestids = beql.db.char.questids
    beql.db.char.questids = {}
    beql.db.char.newquestid = 0

    if not oldquestids then
        oldquestids = {}
    end

    if numEntries ~= 0 then
        for j=numEntries, 1, -1 do
            questLogTitleText, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(j)
            if (isHeader and isCollapsed) then
                -- print("epxpanding " .. questLogTitleText)
                tempHeaderList[j] = 1
                ExpandQuestHeader(j)
            end
        end

        numEntries = GetNumQuestLogEntries()

        for j=1, numEntries, 1 do
            -- rescan Questid's
            if GetQuestLink(j) then
                local id = tonumber(string.match(GetQuestLink(j), 'quest:(%d+)'))
                table.insert(beql.db.char.questids, id, id)
                if not oldquestids[id] then
                    beql.db.char.newquestid = id
                end
            end

            questLogTitleText, level, questTag, _, isHeader, isCollapsed, isComplete = GetQuestLogTitle(j)
            oldTitle = self.hooks.GetQuestLogTitle(j)
            if isHeader then
                currentHeader = questLogTitleText
            else
                -- print("scanning " .. questLogTitleText)
                temp = currentHeader..","..level..","..questLogTitleText
                table.insert(tempQuestList, temp)
            -- if beql.TrackerQueue and beql.TrackerQueue == oldTitle then
            --     table.insert(beql.db.char.QuestWatches, temp)
            --     beql.TrackerQueue = nil
            -- end
            end
        end

        for j=1, numEntries, 1 do
            if(tempHeaderList[j] == 1) then
                CollapseQuestHeader(j)
            end
        end

        local numWatches = table.getn(beql.db.char.QuestWatches)
        local numEntries = table.getn(tempQuestList)
        local found = false
        for i=numWatches, 1, -1 do
            found = false
            for j=0, numEntries, 1 do
                if beql.db.char.QuestWatches[i] == tempQuestList[j] then
                    found = true
                    break
                end
            end
            if not found then
                table.remove(beql.db.char.QuestWatches, i)
            end
        end
    end
    beql:SortWatchedQuests()
end

--------------------------------------------
-- Arguments:
-- table - Color1
-- table - Color2
-- number - Have
-- number - Needed
--
-- Notes:
-- Fades Colors between Color1 and Color2 depending on how much percent has Have from Needed
--
-- Returns:
-- * table - Color Faded
--------------------------------------------
function beql:FadeColors(tempColor, tempColor2, done, obj)
    local color = {r=0, g=0, b=0}
    local multiplier

    multiplier = (done / obj)
    color.r = tempColor.r + ((tempColor2.r - tempColor.r)*multiplier)
    color.g = tempColor.g + ((tempColor2.g - tempColor.g)*multiplier)
    color.b = tempColor.b + ((tempColor2.b - tempColor.b)*multiplier)

    return color
end

--------------------------------------------
-- Arguments:
-- number - Decimal nr
-- number - Length of number
--
-- Notes:
-- Converts a Decimal Number to Hexadecimal
--
-- Returns:
-- string - Hexadecimal number
--------------------------------------------
function beql:decToHex(Dec, Length)
    local B, K, Hex, I, D = 16, "0123456789ABCDEF", "", 0;
    while Dec>0 do
        I=I+1;
        Dec, D = math.floor(Dec/B), math.fmod(Dec,B)+1;
        Hex=string.sub(K,D,D)..Hex;
    end
    if( (Length ~= nil) and (string.len(Hex) < Length) ) then
        local temp, i = Length-string.len(Hex), 1;
        for i=1, temp, 1 do
            Hex = "0"..Hex;
        end
    end
    return Hex;
end

--------------------------------------------
-- Arguments:
-- string - text
-- number - Red Component
-- number - Green Component
-- number - Blue Component
--
-- Notes:
-- Returns a WoW-style colored text
--
-- Returns:
-- string - Text colored with WoW control characters
--------------------------------------------
function beql:ColorText(t, r, g, b)
    if ( t == nil ) then t = ""; end
    if ( r == nil ) then r = 0.0; end
    if ( g == nil ) then g = 0.0; end
    if ( b == nil ) then b = 0.0; end
    return "|CFF"..beql:decToHex(r*255, 2)..beql:decToHex(g*255, 2)..beql:decToHex(b*255, 2)..t.."|r";
end

--------------------------------------------
-- Arguments:
-- string - text
--
-- Notes:
-- Prints all Points of a Region
--
-- Returns:
-- nothing
--------------------------------------------
function beql:printpoints(tmp)
    local region
    if type(tmp) == 'string' then
        region = getglobal(tmp)
    else
        region = tmp
    end
    local i

    print("Framepoints for " .. tostring(region:GetName()))
    for i=1, region:GetNumPoints(),1 do
        local point, relativeTo, relativePoint, xOfs, yOfs = region:GetPoint(i)
        print(point .. " " .. relativeTo:GetName() .. " " .. relativePoint .. " " ..  xOfs .." ".. yOfs)
    end
end

function beql:InitDB()
    local defaults = {
        profile = {
            AddonStatus = true,
            disabled = {},
            Color =
            {
                BackgroundColor = {
                    r = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                    g = TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
                    b = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                },
                BackgroundCornerColor = {
                    r = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                    g = TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
                    b = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                },
                Zone = {
                    r = 1,
                    g = 1,
                    b = 1,
                },
                HeaderComplete = {
                    r = NORMAL_FONT_COLOR.r,
                    g = NORMAL_FONT_COLOR.g,
                    b = NORMAL_FONT_COLOR.b,
                },
                HeaderEmpty = {
                    r = 0.75,
                    g = 0.61,
                    b = 0,
                },
                HeaderFailed = {
                    r = 1,
                    g = 0,
                    b = 0,
                },
                ObjectiveEmpty = {
                    r = 0.8,
                    g = 0.8,
                    b = 0.8,
                },
                ObjectiveComplete = {
                    r = HIGHLIGHT_FONT_COLOR.r,
                    g = HIGHLIGHT_FONT_COLOR.g,
                    b = HIGHLIGHT_FONT_COLOR.b,
                },
                TooltipQuestTitle = {
                    r = 0.75,
                    g = 0.61,
                    b = 0,
                },
                TooltipDesc = {
                    r = 1.0,
                    g = 0.8,
                    b = 0,
                },
                TooltipPartyQuixote = {
                    r = 0.4,
                    g = 0.4,
                    b = 1,
                },
                TooltipPartyNonQuixote = {
                    r = 1,
                    g = 0.4,
                    b = 0.4,
                },
                TooltipPartyObj = {
                    r = 0.8,
                    g = 0.8,
                    b = 0.8,
                },
                TooltipPartyObjComp = {
                    r = HIGHLIGHT_FONT_COLOR.r,
                    g = HIGHLIGHT_FONT_COLOR.g,
                    b = HIGHLIGHT_FONT_COLOR.b,
                },
                ColorMobTooltip = {
                    r = 0.8,
                    g = 0.8,
                    b = 0.8,
                },
                ColorItemTooltip = {
                    r = 0.8,
                    g = 0.8,
                    b = 0.8,
                },
            },
        -- QuestLog
            locked = false,
            simplequestlog = false,
            alwaysminimize = false,
            alwaysmaximize = false,
            showlevel = true,
            InfoOnQuestCompletion = false,
            InfoSound = "Sound\\Interface\\GnomeExploration.wav",
            AnnounceQuest = true,
            autocomplete = false,
            QuestLogAlpha = 1,
            QuestLogFontSize = 14,
            QuestLogScale = 1,
            forcemove = false,
        -- QuestTracker
            disabledtracker = false,
            lockedtracker = true,
            ShowTrackerHeader = true,
            TrackerAutoResize = true,
            TrackerFixedWidth = 250,
            TrackerFontHeight = 14,
            QuestTrackerAlpha = 1,
            AddNew = true,
            AddUntracked = true,
            ShowZonesInTracker = true,
            RemoveFinished = true,
            MinimizeFinished = false,
            HideCompletedOnly = false,
            SortTrackerItems = true,
            ShowObjectiveMarkers = true,
            TrackerSymbol = 0,
            UseTrackerListing = false,
            TrackerList = 0,
            BackgroundAlpha = false,
            CustomBackgroundColor = false,
            CustomZoneColor = false,
            FadeColor = true,
            CustomObjetiveColor = false,
            CustomHeaderColor = true,
            HeaderQuestLevelColor = true,
        -- Tooltip
            tooltipmob = true,
            tooltipitem = true,
            activetracker = true,
            activetrackerdesc = true,
            activetrackerparty = false,
            activetrackerleft = true,
            activetrackerright = false,
            TooltipObjFade = true,
            TooltipItemFade = true,
            TooltipTitleDiff = true,
        -- Fubar
            fubar = {
                HidePlugin = false,
            },
        -- Achievementtracker
            atracker = {
                Enable  = true,
                Locked  = true,
                headline    = true,
                savelast    = true,
                RemoveFinished  = true,
                alpha       = 1,
                scale   = 0.9,
                showbg      = false,
                ownbgcolor  = false,
                BgColor     = {
                    r   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                    g   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
                    b   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                },
                BgCornerColor   = {
                    r   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                    g   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,
                    b   = TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,
                },
            },
        },
        char = {
            QuestDB = {},
            QuestWatches = {},
            QuestCompleted = {},
            saved = {},
            TrackerQuests = {},
            AchievementTracker = {
                Achievement = 0,
                minimized = false,
                posy = 0,
                posx = 0,
            },
        },
    }
    beql.db = LibStub("AceDB-3.0"):New("beqlDB", defaults, true)
end
--- EOF ---