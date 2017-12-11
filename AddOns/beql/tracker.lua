local beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local L = LibStub("AceLocale-3.0"):GetLocale("beql")
local WatchFrame = WatchFrame;

function beql:SetQWFPosDefault()
    QuestWatchFrame:ClearAllPoints()
    QuestWatchFrame:SetPoint("TOPRIGHT","MinimapCluster","BOTTOM",0,-50)
end

function beql:InitTracker()
    -- beql:debugprint("Init QuestTracker")

    -- Start Framemanagemant
    -- we use a own frame for quest, because other addons may want to use the WatchFrame
    -- Create a new watchframe
    local QuestWatchFrame = CreateFrame("Frame", "QuestWatchFrame", UIParent)
    QuestWatchFrame:SetFrameStrata("BACKGROUND")
    QuestWatchFrame:SetFrameLevel(2)
    QuestWatchFrame:SetAlpha(1)
    QuestWatchFrame:SetWidth(200)
    QuestWatchFrame:SetHeight(200)
    QuestWatchFrame:Show()
    QuestWatchFrame:SetMovable(true)
    QuestWatchFrame:EnableMouse(true)
    QuestWatchFrame:SetScript("OnDragStart",function()
        if not beql.db.char.saved.minimizedtracker then
            QuestWatchFrame.ismoving = true
            QuestWatchFrame:StartMoving()
        end
    end)
    QuestWatchFrame:SetScript("OnDragStop",function()
        QuestWatchFrame.ismoving = false
        QuestWatchFrame:StopMovingOrSizing()
        beql:SavePositionTracker()
    end)

    beql:SetQWFPosDefault()

    -- check if tracker was placed
    if beql.db.char.saved.qtrackercorner and beql.db.char.saved.qtrackerposx and beql.db.char.saved.qtrackerposy then
        -- move it to old position
        -- QuestWatchFrame:ClearAllPoints()
        -- QuestWatchFrame:SetPoint(beql.db.char.saved.qtrackercorner,"UIParent","BOTTOMLEFT", beql.db.char.saved.qtrackerposx, beql.db.char.saved.qtrackerposy)
        beql:SetQWFPosDefault()
    else
        -- tracker wasn't placed, move to center of screen
        beql:SetQWFPosDefault()
        beql:SavePositionTracker()
    end

    -- Create Linesframe
    beql.QuestWatchLines = CreateFrame("Frame","QuestWatchLines", QuestWatchFrame)
    beql.QuestWatchLines:ClearAllPoints()
    beql.QuestWatchLines:SetAllPoints(QuestWatchFrame)
    beql.QuestWatchLines:SetAlpha(1)
    beql.QuestWatchLines:Show()

    -- Create backdrop
    beql.WatchFrameBackdrop = CreateFrame("Frame","WatchFrameBackdrop", QuestWatchFrame)
    beql.WatchFrameBackdrop:ClearAllPoints()
    if IsAddOnLoaded("Mobmap") then
        beql.WatchFrameBackdrop:SetPoint("TOPLEFT", QuestWatchFrame, "TOPLEFT",-20, 5)
        beql.WatchFrameBackdrop:SetPoint("BOTTOMLEFT", QuestWatchFrame, "BOTTOMLEFT",-20,-5)
    else
        beql.WatchFrameBackdrop:SetPoint("TOPLEFT", QuestWatchFrame ,"TOPLEFT", -5, 5)
        beql.WatchFrameBackdrop:SetPoint("BOTTOMLEFT",QuestWatchFrame, "BOTTOMLEFT",-5,-5)
    end
    beql.WatchFrameBackdrop:SetPoint("TOPRIGHT", QuestWatchFrame ,"TOPRIGHT", 5, 5)
    beql.WatchFrameBackdrop:SetPoint("BOTTOMRIGHT",QuestWatchFrame, "BOTTOMRIGHT", 5,-5)
    beql.WatchFrameBackdrop:SetFrameStrata("BACKGROUND")

    beql.WatchFrameBackdrop:SetBackdrop({
        bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile = true, edgeSize = 16, tileSize = 16,
        insets = { left= 4, right = 4, top = 4, bottom = 4 }
        })
    beql.WatchFrameBackdrop:SetFrameLevel("1")
    beql.WatchFrameBackdrop:Show()
    beql.WatchFrameBackdrop:SetMovable(true)

    -- create titlebar for the tracker
    beql.TrackerTitleBar = CreateFrame("Frame","TrackerTitleBar", QuestWatchFrame)
    beql.TrackerTitleBar:ClearAllPoints()
    beql.TrackerTitleBar:SetHeight(32)
    if IsAddOnLoaded("Mobmap") then
        beql.TrackerTitleBar:SetPoint("TOPLEFT",QuestWatchFrame, "TOPLEFT",-20,32)
    else
        beql.TrackerTitleBar:SetPoint("TOPLEFT",QuestWatchFrame, "TOPLEFT",-5,32)
    end
    beql.TrackerTitleBar:SetPoint("TOPRIGHT",QuestWatchFrame, "TOPRIGHT",5,32)
    beql.TrackerTitleBar:SetBackdrop({
        bgFile="Interface\\Tooltips\\UI-Tooltip-Background",
        edgeFile="Interface\\Tooltips\\UI-Tooltip-Border", tile = true, edgeSize = 16, tileSize = 16,
        insets = { left= 4, right = 4, top = 4, bottom = 4 }
        })
    beql.TrackerTitleBar:SetFrameStrata("BACKGROUND")
    beql.TrackerTitleBar:SetFrameLevel("1")
    beql.TrackerTitleBar:SetAlpha(1)
    beql.TrackerTitleBar:SetMovable(true)
    beql.TrackerTitleBar:EnableMouse(true)
    beql.TrackerTitleBar:SetScript("OnDragStart",function() QuestWatchFrame:StartMoving() end)
    beql.TrackerTitleBar:SetScript("OnDragStop",function() QuestWatchFrame:StopMovingOrSizing() beql:SavePositionTracker() end)
    beql.TrackerTitleBar:Show()

    -- create text for titlebar
    beql.TrackerTitleBarText = TrackerTitleBar:CreateFontString("TrackerTitleBarText","BACKGROUND","GameFontNormal")
    beql.TrackerTitleBarText:SetPoint("LEFT",10,1)
    beql.TrackerTitleBarText:SetAlpha(1)
    beql.TrackerTitleBarText:SetText("bEQL Dummytext")

    -- create minimizebutton in titlebar
    -- beql.TrackerMinimizeButton = CreateFrame("Button","TrackerMinimizeButton", TrackerTitleBar, "UIPanelButtonTemplate")
    beql.TrackerMinimizeButton = CreateFrame("Button","TrackerMinimizeButton", TrackerTitleBar)
    -- beql.TrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
    -- beql.TrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    beql.TrackerMinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Up")
    beql.TrackerMinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Down")
    beql.TrackerMinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    beql.TrackerMinimizeButton:SetWidth(27)
    beql.TrackerMinimizeButton:SetHeight(27)
    beql.TrackerMinimizeButton:Show()
    beql.TrackerMinimizeButton:ClearAllPoints()
    beql.TrackerMinimizeButton:SetPoint("TOPRIGHT",TrackerTitleBar, "TOPRIGHT", 0, -1)
    beql.TrackerMinimizeButton:SetScript("OnClick", function()
        if beql.db.char.saved.minimizedtracker then
            beql:TrackerMaximize()
        else
            beql:TrackerMinimize()
        end
    end)

    -- Create a framecache
    if #beql.lineCache == 0 or #beql.buttonCache == 0 then
        beql.lineCache = UIFrameCache:New("FRAME", "beqlLine", WatchFrameLines, "WatchFrameLineTemplate");
        beql.buttonCache = UIFrameCache:New("BUTTON", "beqlLinkButton", WatchFrameLines, "WatchFrameLinkButtonTemplate")
        -- local watchFrameTestLine = beql.lineCache:GetFrame();
        -- print(watchFrameTestLine:GetName())
        beql.LinkButtons = {}
    end

    beql.QuestLines = {}
    local questLineIndex = 1;

    -- Other
    --[[
    if beql.db.profile.AddUntracked then
        AUTO_QUEST_WATCH = "1"
    else
        AUTO_QUEST_WATCH = "0"
    end
    --]]

    WatchFrame_Update()
    -- beql:debugprint("Init QuestTracker - done")
end

-- minimize questtracker
function beql:TrackerMinimize()
    beql.db.char.saved.minimizedtracker = true
    beql.TrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\restore_up")
    beql.TrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\restore_down")
    -- beql.TrackerMinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-ExpandButton-Up")
    -- beql.TrackerMinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-ExpandButton-Down")

    -- Hide Lines
    beql.QuestWatchLines:Hide();

    local minWidth = beql.TrackerTitleBarText:GetWidth()+32
    QuestWatchFrame:SetHeight(1)
    QuestWatchFrame:SetWidth(minWidth)
    beql.WatchFrameBackdrop:Hide()
end

-- maximze questtracker
function beql:TrackerMaximize()
    beql.db.char.saved.minimizedtracker = false
    beql.TrackerMinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
    beql.TrackerMinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    -- beql.TrackerMinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Up")
    -- beql.TrackerMinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-CollapseButton-Down")

    beql.QuestWatchLines:Show()
    beql.WatchFrameBackdrop:Show()
    WatchFrame_Update()
end

-- Toggles Questtracker status between active and inactive
function beql:ToggleQuestTracker(inactive)
    beql.db.profile.disabledtracker = inactive

    if(not inactive) then
        -- load tracker
        -- beql:debugprint("load questtracker")
        if not (QuestWatchFrame) then
            beql:InitTracker()
        end

        -- Callbacks
        beqlQ.RegisterCallback(beql, "Quest_Gained", beql.Quixote_Quest_Gained)
        beqlQ.RegisterCallback(beql, "Update", beql.Quixote_Update)
        beqlQ.RegisterCallback(beql, "Ready", beql.Quixote_Ready)
        beqlQ.RegisterCallback(beql, "Quest_Lost", beql.Quixote_Quest_Lost)

        WatchFrame_RemoveObjectiveHandler(WatchFrame_DisplayTrackedQuests);
        WatchFrame_AddObjectiveHandler(beql.DisplayTrackedQuests);

        -- make some hooks
        beql:SecureHook("WatchFrame_Update", beql.Hooks_WatchFrame_Update)
        beql:RawHook("AddQuestWatch", "Hooks_AddQuestWatch", true)
        beql:RawHook("RemoveQuestWatch","Hooks_RemoveQuestWatch", true)
        beql:RawHook("IsQuestWatched", "Hooks_IsQuestWatched", true)
        beql:RawHook("GetNumQuestWatches", "Hooks_GetNumQuestWatches", true)
        beql:RawHook("GetQuestIndexForWatch", "Hooks_GetQuestIndexForWatch", true)

        QuestWatchFrame:Show()

        WATCHFRAME_MAXQUESTS = 25;
        MAX_WATCHABLE_QUESTS = 25;

        -- beql:debugprint("questracker loaded")
    elseif( inactive and QuestWatchFrame) then
        -- ask QuestWatchFrame to prevent unload on unloaded tracker

        -- unregister callbacks
        beqlQ.UnregisterCallback(beql, "Quest_Gained");
        beqlQ.UnregisterCallback(beql, "Update");
        beqlQ.UnregisterCallback(beql, "Ready");
        beqlQ.UnregisterCallback(beql, "Quest_Lost");

        -- unload tracker
        WatchFrame_RemoveObjectiveHandler(beql.DisplayTrackedQuests);
        WatchFrame_AddObjectiveHandler(WatchFrame_DisplayTrackedQuests);

        -- unhookfunctions
        if beql:IsActive() then -- only unhook on active addon
            beql:Unhook("WatchFrame_Update");
            beql:Unhook("AddQuestWatch");
            beql:Unhook("RemoveQuestWatch");
            beql:Unhook("IsQuestWatched");
            beql:Unhook("GetNumQuestWatches");
            beql:Unhook("GetQuestIndexForWatch");
        end

        QuestWatchFrame:Hide();

        WATCHFRAME_MAXQUESTS = 10;
        MAX_WATCHABLE_QUESTS = 10;
    end

    QuestLog_Update();
    WatchFrame_ClearDisplay();
    WatchFrame_Update(WatchFrame);
end

--
-- Events
--

function beql:Quixote_Ready(...)
    WatchFrame_Update()
end

function beql:Quixote_Update()
    WatchFrame_Update()
end

function beql:Quixote_Quest_Gained( questname, qID, objectives, category, provider, player)
    local _ , id, _ ,_ , _ ,_ , complete ,_ , _ ,_ = beqlQ:GetQuestByUid(qID)

    if(complete == 1) and qID == beql.db.char.newquestid then
        beql:Quest_Complete(nil, questname, uid)
    end

    if beql.db.profile.AddNew and qID == beql.db.char.newquestid then
        AddQuestWatch(id)
        QuestLog_Update()
        WatchFrame_Update()
    end
    beql.WatchQueue = nil
end

function beql:Quixote_Quest_Lost( qname, quid)
    WatchFrame_Update()
end

function beql:CHAT_MSG_SYSTEM(arg1)
    if beql.db.profile.AddNew then
        if string.find(arg1, BEQL_QUEST_ACCEPTED.." .+") then
            local temp = string.gsub(arg1, BEQL_QUEST_ACCEPTED.." ", "")
            beql.TrackerQueue = temp
            beql:ManageQuests()
        end
    end
end

--
-- Hooks
--
function beql:Hooks_AddQuestWatch(questIndex)
    -- print("Hooks_AddQuestWatch")
    local questName, level = GetQuestLogTitle(questIndex)
    local questLogHeader, tempId

    if IsQuestWatched(questIndex) then
        return
    else
        isHeader = false
        tempId = questIndex
        while (not isHeader) do
            questLogHeader, _, _, _, isHeader = GetQuestLogTitle(tempId)
            tempId = tempId-1
        end

        table.insert(beql.db.char.QuestWatches, questLogHeader..","..level..","..questName)
    end
    beql:SortWatchedQuests()
    beql:ManageQuests()
    -- beql.hooks.AddQuestWatch(questIndex)
end

function beql:AddQuestWatchbyUID(uID)
end

function beql:RemoveQuestWatchbyUID(uID)
end

function beql:Hooks_RemoveQuestWatch(questIndex)
    if questIndex <= 0 then
        return
    end
    local questName, level = GetQuestLogTitle(questIndex)
    local questLogHeader, isHeader, tempId

    isHeader = false
    tempId = questIndex
    while (not isHeader) do
        questLogHeader, _, _, _, isHeader = GetQuestLogTitle(tempId)
        tempId = tempId-1
    end

    local temp = questLogHeader..","..level..","..questName

    if table.getn(beql.db.char.QuestWatches) > 0 then
        for i=1, table.getn(beql.db.char.QuestWatches) do
            if beql.db.char.QuestWatches[i] == temp then
                table.remove(beql.db.char.QuestWatches , i)
                break
            end
        end
    end
    beql:SortWatchedQuests()
    -- beql.hooks.RemoveQuestWatch(questIndex)
end

function beql:Hooks_IsQuestWatched(questIndex)
    local questName, level = beql.hooks.GetQuestLogTitle(questIndex)
    local questLogHeader, isHeader, tempId
    local _

    isHeader = false
    tempId = questIndex
    while (not isHeader and tempId > 0) do
        questLogHeader, _, _, _, isHeader = beql.hooks.GetQuestLogTitle(tempId)
        tempId = tempId-1
    end

    local temp = questLogHeader..","..level..","..questName
    if table.getn(beql.db.char.QuestWatches) > 0 then
        for i=1, table.getn(beql.db.char.QuestWatches) do
            if beql.db.char.QuestWatches[i] == temp then
                return true
            end
        end
    end
    return false
end

-- Returns the number of watched quests
function beql:Hooks_GetNumQuestWatches()
    return table.getn(beql.db.char.QuestWatches)
end

function beql:Hooks_GetQuestIndexForWatch(id)
    local numEntries, numQuests = GetNumQuestLogEntries()
    local questLogTitleText, level
    local questLogHeader, isHeader, tempId
    local questFound = false
    local temp, currentHeader=nil
    local _

    for i=1, numEntries, 1 do
        questLogTitleText, level, _, _, isHeader, _ = GetQuestLogTitle(i)
        if isHeader then
            currentHeader = questLogTitleText
        else
            temp = currentHeader..","..level..","..questLogTitleText
            if  temp == beql.db.char.QuestWatches[id]  then
                return i
            end
        end
    end
    return 0
end

function beql:Hooks_WatchFrame_Update()
    -- release unused Linkbuttons
    beql:ReleaseUnusedLinkButtons();

    -- we need to reset it here, because we can't access the function before it called
    beql.watchButtonIndex = 1;

    -- Hide empty WatchFrame
    if #WATCHFRAME_TIMERLINES == 0 and #WATCHFRAME_ACHIEVEMENTLINES == 0 and #WATCHFRAME_QUESTLINES == 0 then
        WatchFrame:Hide()
    else
        WatchFrame:Show()
    end
end

function beql:DisplayTrackedQuests ()
    -- Don't do anything before Quixote gets his data
    if not beqlQ.firstDone then
        return 0,0
    end

    -- beql locales
    local questIndex,isRemoved,isCollapsed
    local qTitle,qLvl,qTag,qRec,qStat,qObj,qZone,qID, qdaily
    local oText, oType, oNumP, oNumN, oComp, numObjectives, objText
    local temp,curZone
    local zoneid = 0
    local Color = {}
    local tempwidth = 0
    local tempColor,tempColor2,tempColor3
    local markerID = 0
    local completedQuests = 0
    local questWatchMaxWidth = 0
    local _
    local qObjectives, oItems

    local minheight = 128

    local zoneoffset = 5
    local questoffset = 1.5

    beql.db.char.TrackerQuests = {}

    -- blizz locales
    local lineFrame, maxHeight, frameWidth = QuestWatchLines, 600, 200
    local _;
    local text, finished;
    local questTitle;
    local watchItemIndex = 0;
    local objectivesCompleted;

    questLineIndex = 1;

    local line;
    local lastLine;
    local HIGHLIGHT_FONT_COLOR = HIGHLIGHT_FONT_COLOR;
    local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR;
    local WATCHFRAMELINES_FONTHEIGHT = beql.db.profile.TrackerFontHeight
    local WATCHFRAMELINES_FONTSPACING = WATCHFRAMELINES_FONTHEIGHT/4
    local linkButton;
    local heightNeeded = 0;
    local maxWidth = 0;
    local iconHeightLeft = 0;

    for i = 1, GetNumQuestWatches() do
        local questWidth = 0;
        questIndex = GetQuestIndexForWatch(i);
        qID = nil;
        if questIndex then
            questLogTitleText, _, _, _, _, _ = GetQuestLogTitle(questIndex)
            -- Fix submitted by Ben Schreiber for MarsQuestOrganizer
            if questLogTitleText then
                qID, _ , qTitle, qLvl, qTag, qObj, qStat, qRec, qdaily, qZone = beqlQ:GetQuestById(questIndex)
                -- _ is questIndex in Questlog
            end
        end
        if qID then
            isRemoved = false
            if beql.db.profile.RemoveFinished and qStat == 1 then
                isRemoved = true
                completedQuests = completedQuests +1
            end

            -- Zone !
            if (curZone == nil or curZone ~= qZone) and not isRemoved then
                curZone = qZone
                if beql.db.profile.ShowZonesInTracker then
                    line = beql:GetQuestLine(lineFrame:GetName());
                    line.text:SetText(curZone);
                    if ((line.text:GetStringWidth() + 10) > questWatchMaxWidth) then
                        questWatchMaxWidth = line.text:GetStringWidth() +10
                    end
                    line:Show();
                    if ( not lastLine ) then -- First line
                        line:SetPoint("TOPRIGHT", lineFrame, "TOPRIGHT", 0, 0);
                        line:SetPoint("TOPLEFT", lineFrame, "TOPLEFT", 0, 0);
                    else
                        local yOffset = 0;
                        if ( iconHeightLeft > 0 ) then
                            yOffset = -iconHeightLeft;
                        end

                        line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, yOffset - zoneoffset);
                        line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, yOffset - zoneoffset);
                    end

                    if beql.db.profile.CustomZoneColor then
                        Color = beql.db.profile.Color.Zone
                    else
                        Color = {r = 0.8,g = 0.8,b = 1}
                    end

                    line.text:SetTextColor(Color.r, Color.g, Color.b)
                    if not(tempwidth == nil) and tempwidth > questWatchMaxWidth then
                        questWatchMaxWidth = tempwidth
                    end

                    lastLine = line;
                end
            end

            -- Quest !
            if qID > 0 and not isRemoved then
                -- Colores
                if qStat == 1 then
                    --Completed
                    completedQuests = completedQuests +1
                    if beql.db.profile.CustomHeaderColor then
                        Color = beql.db.profile.Color.HeaderComplete
                    else
                        Color = NORMAL_FONT_COLOR
                    end
                elseif qStat == -1 then
                    -- Failed
                    if beql.db.profile.CustomHeaderColor then
                        Color = beql.db.profile.Color.HeaderFailed
                    else
                        Color = NORMAL_FONT_COLOR
                    end
                else
                    -- Normal
                    if beql.db.profile.CustomHeaderColor then
                        if beql.db.profile.HeaderQuestLevelColor then
                            -- Color = GetQuestDifficultyColor(qLvl)
                            Color = GetDifficultyColor(qLvl)
                        else
                            Color = beql.db.profile.Color.HeaderEmpty
                        end
                    else
                        Color = { r = 0.75, g = 0.61, b = 0 }
                    end
                end

                -- Levels
                if beql.db.profile.showlevel then
                    qTitle = "["..qLvl..string.upper(beqlQ:GetShortTagForQuest(qID)).."] "..qTitle;
                end

                if beql.db.profile.ShowZonesInTracker then
                    -- add space for zone offset
                    qTitle = "  " .. qTitle
                end

                line = beql:GetQuestLine(lineFrame:GetName());
                questTitle = line;
                line.text:SetText(qTitle);
                line.text:SetTextColor(Color.r, Color.g, Color.b)
                if ((line.text:GetStringWidth() + 10) > questWatchMaxWidth) then
                    questWatchMaxWidth = line.text:GetStringWidth() +10
                end
                line:Show();
                if ( not lastLine ) then -- First line
                    line:SetPoint("TOPRIGHT", lineFrame, "TOPRIGHT", 0, 0);
                    line:SetPoint("TOPLEFT", lineFrame, "TOPLEFT", 0, 0);
                else
                    local yOffset = 0;
                    if ( iconHeightLeft > 0 ) then
                        yOffset = -iconHeightLeft;
                    end

                    line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, yOffset - questoffset);
                    line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, yOffset - questoffset);
                end
                iconHeightLeft = 0;
                local stringWidth = line.text:GetStringWidth();
                --[[
                if ( not self.disableButtons ) then
                    linkButton = beql.GetLinkButton(lineFrame:GetName());
                    linkButton:SetPoint("TOPLEFT", line);
                    linkButton:SetPoint("BOTTOMLEFT", line);
                    linkButton:SetPoint("RIGHT", line.text);
                    linkButton.type = "QUEST"
                    linkButton.index = i; -- We want the Watch index, we'll get the quest index later with GetQuestIndexForWatch(i);
                    linkButton:Show();
                end
                --]]
                beql.db.char.TrackerQuests[(questLineIndex - 1)] = qID

                -- ItemButton
                local itemButton;
                local link, item, charges = GetQuestLogSpecialItemInfo(questIndex);
                if ( item ) then
                    watchItemIndex = watchItemIndex + 1;
                    itemButton = _G["beqlItem"..watchItemIndex];
                    if ( not itemButton ) then
                        beql.QuestItems = watchItemIndex;
                        itemButton = CreateFrame("BUTTON", "beqlItem" .. watchItemIndex, lineFrame, "WatchFrameItemButtonTemplate");
                    end
                    itemButton:Show();
                    itemButton:ClearAllPoints();
                    itemButton:SetID(questIndex);
                    itemButton:SetFrameLevel(5);
                    SetItemButtonTexture(itemButton, item);
                    SetItemButtonCount(itemButton, charges);
                    WatchFrameItem_UpdateCooldown(itemButton);
                    itemButton.rangeTimer = -1;
                    line.text.clear = true;
                    line.text:SetPoint("RIGHT", itemButton, "LEFT", -4, 0);
                    iconHeightLeft = WATCHFRAME_QUEST_WITH_ITEM_HEIGHT - WATCHFRAMELINES_FONTHEIGHT - WATCHFRAMELINES_FONTSPACING; -- We've already displayed a line for this
                    itemButton.maxStringWidth = stringWidth;
                    questWidth = max(stringWidth + WATCHFRAME_ITEM_WIDTH, questWidth);
                else
                    questWidth = max(stringWidth, questWidth);
                end

                lastLine = line;

                -- Objectives
                numObjectives = qObj
                if (beql.db.profile.MinimizeFinished or beql.db.profile.HideCompletedOnly) and qStat == 1 then
                    numObjectives = 0
                end

                markerID = 0
                objectivesCompleted = 0;

                local _, qObjectives = beqlQ:IterateObjectivesForQuest(qID)
                if  numObjectives > 0 and qObjectives then
                    for oText, oItems in pairs(qObjectives) do
                        oComp = false;
                        oNumP, oNumN, oType = unpack(oItems)
                        if oNumN == nil then oNumN = 1 end
                        if oNumP == nil then oNumP = 1 end
                        if oText == nil then oText = "" end

                        if oNumP == oNumN then
                            oComp = true
                        end

                        -- only display complete
                        if (oComp and not beql.db.profile.MinimizeFinished) or (not oComp) then
                            -- colores
                            if beql.db.profile.CustomObjetiveColor then
                                        tempColor = { r=beql.db.profile.Color.ObjectiveEmpty.r, g=beql.db.profile.Color.ObjectiveEmpty.g, b=beql.db.profile.Color.ObjectiveEmpty.b }
                                        tempColor2 = { r=beql.db.profile.Color.ObjectiveComplete.r, g=beql.db.profile.Color.ObjectiveComplete.g, b=beql.db.profile.Color.ObjectiveComplete.b }
                            else
                                        tempColor = {r=0.8, g=0.8, b=0.8}
                                        tempColor2 = {r=HIGHLIGHT_FONT_COLOR.r, g=HIGHLIGHT_FONT_COLOR.g, b=HIGHLIGHT_FONT_COLOR.b}
                            end
                            if oComp then
                                Color = tempColor2
                            else
                                if beql.db.profile.FadeColor then
                                    if oType == "reputation" then
                                        if oNumN == oNumP then
                                            Color = beql:FadeColors(tempColor, tempColor2, 1,1)
                                        else
                                            Color = beql:FadeColors(tempColor, tempColor2, 0,1)
                                        end
                                    else
                                        Color = beql:FadeColors(tempColor, tempColor2, oNumP,oNumN)
                                    end
                                else
                                    Color = tempColor
                                end
                            end

                            -- markers
                            if  beql.db.profile.ShowObjectiveMarkers  then
                                if beql.db.profile.UseTrackerListing then
                                    objText = "   "..BEQL_TrackerLists[beql.db.profile.TrackerList][markerID]..") "

                                else
                                    objText = "   "..BEQL_TrackerSymbols[beql.db.profile.TrackerSymbol].." "
                                end
                            else
                                if IsAddOnLoaded("Mobmap") then
                                    objText = " - "
                                else
                                    objText = "   "
                                end
                            end

                            if beql.db.profile.ShowZonesInTracker then
                                -- add space for zone offset
                                objText = "  " .. objText
                            end

                            objText = objText..oText
                            if oType == "item" or oType == "monster" or oType == "reputation" then
                                objText = objText ..": "..oNumP.."/"..oNumN
                            end

                            -- create line
                            line = beql:GetQuestLine(lineFrame:GetName());
                            line.text:SetText(objText);
                            if ((line.text:GetStringWidth() + 10) > questWatchMaxWidth) then
                                questWatchMaxWidth = line.text:GetStringWidth() +10
                            end
                            line.text:SetTextColor(Color.r, Color.g, Color.b)
                            line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, WATCHFRAMELINES_FONTSPACING);
                            line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, WATCHFRAMELINES_FONTSPACING);
                            line:Show();
                            stringWidth = line.text:GetStringWidth();
                            if ( iconHeightLeft > 0 ) then
                                line.text.clear = true;
                                line.text:SetPoint("RIGHT", itemButton, "LEFT", -4, 0);
                                itemButton.maxStringWidth = max(stringWidth, itemButton.maxStringWidth)
                                questWidth = max(stringWidth + WATCHFRAME_ITEM_WIDTH, questWidth);
                            else
                                questWidth = max(stringWidth, questWidth);
                            end
                            lastLine = line;
                            iconHeightLeft = iconHeightLeft - WATCHFRAMELINES_FONTHEIGHT - WATCHFRAMELINES_FONTSPACING;
                            -- if tempwidth > questWatchMaxWidth then
                            --     questWatchMaxWidth = tempwidth
                            -- end
                            beql.db.char.TrackerQuests[(questLineIndex - 1)] = qID
                            markerID = markerID + 1
                        end
                    end
                end

                if  numObjectives > 0 and test2 then
                    j = 1
                    table.foreach(test2,function(k,v)
                        oText, oType, oComp = GetQuestLogLeaderBoard(j, questIndex);
                        j = j + 1
                        oNumP, oNumN = tonumber(v[1]), tonumber(v[2]) -- got, needed

                        -- Hack: MarsQuestOrganizer doesnt throw errors !!! Still is a fix needed !!! <- Quixote doesnt returns the correct number and/or the correct objectives for the current quest.
                        -- do we need this ?
                        if oNumN == nil then oNumN = 1 end
                        if oNumP == nil then oNumP = 1 end
                        if oText == nil then oText = "" end

                        if beql.db.profile.CustomObjetiveColor then
                                    tempColor = { r=beql.db.profile.Color.ObjectiveEmpty.r, g=beql.db.profile.Color.ObjectiveEmpty.g, b=beql.db.profile.Color.ObjectiveEmpty.b }
                                    tempColor2 = { r=beql.db.profile.Color.ObjectiveComplete.r, g=beql.db.profile.Color.ObjectiveComplete.g, b=beql.db.profile.Color.ObjectiveComplete.b }
                        else
                                    tempColor = {r=0.8, g=0.8, b=0.8}
                                    tempColor2 = {r=HIGHLIGHT_FONT_COLOR.r, g=HIGHLIGHT_FONT_COLOR.g, b=HIGHLIGHT_FONT_COLOR.b}
                        end
                        if oComp then
                            Color = tempColor2
                        else
                            if beql.db.profile.FadeColor then
                                if oType == "reputation" then
                                    if oNumN == oNumP then
                                        Color = beql:FadeColors(tempColor, tempColor2, 1,1)
                                    else
                                        Color = beql:FadeColors(tempColor, tempColor2, 0,1)
                                    end
                                else
                                    Color = beql:FadeColors(tempColor, tempColor2, oNumP,oNumN)
                                end
                            else
                                Color = tempColor
                            end
                        end

                        if beql.db.profile.ShowObjectiveMarkers  then
                            if beql.db.profile.UseTrackerListing then
                                objText = "   "..BEQL_TrackerLists[beql.db.profile.TrackerList][markerID]..") "

                            else
                                objText = "   "..BEQL_TrackerSymbols[beql.db.profile.TrackerSymbol].." "
                            end
                        else
                            if IsAddOnLoaded("Mobmap") then
                                objText = " - "
                            else
                                objText = "   "
                            end
                        end

                        if beql.db.profile.ShowZonesInTracker then
                            -- add space for zone offset
                            objText = "  " .. objText
                        end

                        objText = objText..k
                        if oType == "item" or oType == "monster" or oType == "reputation" then
                            objText = objText ..": "..oNumP.."/"..oNumN
                        end
                        if (oComp and not beql.db.profile.MinimizeFinished) or (not oComp) then
                            line = beql:GetQuestLine(lineFrame:GetName());
                            line.text:SetText(objText);
                            if ((line.text:GetStringWidth() + 10) > questWatchMaxWidth) then
                                questWatchMaxWidth = line.text:GetStringWidth() +10
                            end
                            line.text:SetTextColor(Color.r, Color.g, Color.b)
                            line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, WATCHFRAMELINES_FONTSPACING);
                            line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, WATCHFRAMELINES_FONTSPACING);
                            line:Show();
                            stringWidth = line.text:GetStringWidth();
                            if ( iconHeightLeft > 0 ) then
                                line.text.clear = true;
                                line.text:SetPoint("RIGHT", itemButton, "LEFT", -4, 0);
                                itemButton.maxStringWidth = max(stringWidth, itemButton.maxStringWidth)
                                questWidth = max(stringWidth + WATCHFRAME_ITEM_WIDTH, questWidth);
                            else
                                questWidth = max(stringWidth, questWidth);
                            end
                            lastLine = line;
                            iconHeightLeft = iconHeightLeft - WATCHFRAMELINES_FONTHEIGHT - WATCHFRAMELINES_FONTSPACING;
                            -- if tempwidth > questWatchMaxWidth then
                            --     questWatchMaxWidth = tempwidth
                            -- end
                            beql.db.char.TrackerQuests[(questLineIndex - 1)] = qID
                        end
                        markerID = markerID + 1
                    end)
                end

                if ( itemButton ) then
                    itemButton:SetPoint("TOPRIGHT", questTitle, "TOPRIGHT", 0, -WATCHFRAMELINES_FONTSPACING);
                    itemButton:Show();
                end

                if ( itemButton ) then
                    maxWidth = max(questWidth + WATCHFRAME_ITEM_WIDTH, maxWidth);
                else
                    maxWidth = max(questWidth, maxWidth);
                end
            end
        end
    end

    for i = watchItemIndex + 1, beql.QuestItems do
        _G["beqlItem" .. i]:Hide();
    end

    beql:ReleaseUnusedQuestLines();

    if (#beql.QuestLines == 0) then
        -- no tracked Quests -> hide and return
        QuestWatchFrame:Hide()
        return 0,0
    else
        QuestWatchFrame:Show()
    end

    -- QuestWatchFrame
    -- Show Tracker header if set, set quest count in tracker header
    if beql.db.profile.ShowTrackerHeader then
        t1, _, t2 = WatchFrameLine1Text:GetFont();
        beql.TrackerTitleBarText:SetFont(t1, beql.db.profile.TrackerFontHeight+2, t2)
        beql.TrackerTitleBarText:SetHeight(beql.db.profile.TrackerFontHeight+2)
        beql.TrackerTitleBarText:Show()
        local questnums = GetNumQuestWatches()
        local _,questEntries = GetNumQuestLogEntries()
        if beql.db.profile.RemoveFinished then
            beql.TrackerTitleBarText:SetText(L["Quest Tracker"].. " ("..questnums - completedQuests.."/"..questEntries..")")
        else
            beql.TrackerTitleBarText:SetText(L["Quest Tracker"].. " ("..questnums.."/"..questEntries..")")
        end
        beql.TrackerMinimizeButton:Show()
        beql.TrackerTitleBar:Show()
    else
        beql.TrackerTitleBar:Hide()
        beql.TrackerMinimizeButton:Hide()
        if beql.db.char.saved.minimizedtracker then
            beql:TrackerMaximize()
        end
    end

    -- Tracker Background handling
    if beql.db.profile.CustomBackgroundColor then
        beql.WatchFrameBackdrop:SetBackdropColor(beql.db.profile.Color.BackgroundColor.r,beql.db.profile.Color.BackgroundColor.g,beql.db.profile.Color.BackgroundColor.b,beql.db.profile.Color.BackgroundColor.a)
        beql.WatchFrameBackdrop:SetBackdropBorderColor(beql.db.profile.Color.BackgroundCornerColor.r,beql.db.profile.Color.BackgroundCornerColor.g,beql.db.profile.Color.BackgroundCornerColor.b,beql.db.profile.Color.BackgroundCornerColor.a)
        beql.TrackerTitleBar:SetBackdropColor(beql.db.profile.Color.BackgroundColor.r,beql.db.profile.Color.BackgroundColor.g,beql.db.profile.Color.BackgroundColor.b,beql.db.profile.Color.BackgroundColor.a)
        beql.TrackerTitleBar:SetBackdropBorderColor(beql.db.profile.Color.BackgroundCornerColor.r,beql.db.profile.Color.BackgroundCornerColor.g,beql.db.profile.Color.BackgroundCornerColor.b,beql.db.profile.Color.BackgroundCornerColor.a)
        if beql.db.profile.BackgroundAlpha then
            beql.WatchFrameBackdrop:SetAlpha(50)
        else
            beql.WatchFrameBackdrop:SetAlpha(0)
            beql.TrackerTitleBar:SetBackdropColor(0,0,0,0)
            beql.TrackerTitleBar:SetBackdropBorderColor(0,0,0,0)
        end
    else
        beql.WatchFrameBackdrop:SetBackdropBorderColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
        beql.WatchFrameBackdrop:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
        beql.TrackerTitleBar:SetBackdropBorderColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
        beql.TrackerTitleBar:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r,TOOLTIP_DEFAULT_BACKGROUND_COLOR.g,TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
        if beql.db.profile.BackgroundAlpha then
            beql.WatchFrameBackdrop:SetAlpha(50)
        else
            beql.WatchFrameBackdrop:SetAlpha(0)
            beql.TrackerTitleBar:SetBackdropColor(0,0,0,0)
            beql.TrackerTitleBar:SetBackdropBorderColor(0,0,0,0)
        end
    end

    --Minimize the Tracker if its state is set to minimized
    if beql.db.char.saved.minimizedtracker then
        beql:TrackerMinimize()
        return 0,0
    end

    -- set Tracker Width
    if not beql.db.profile.TrackerAutoResize then
        QuestWatchFrame:SetWidth(beql.db.profile.TrackerFixedWidth)
    else
        if maxWidth > (TrackerTitleBarText:GetWidth() + 32) then
            QuestWatchFrame:SetWidth(maxWidth);
        else
            QuestWatchFrame:SetWidth(TrackerTitleBarText:GetWidth() + 32);
        end
    end

    -- Tracker height
    QuestWatchFrame:SetHeight((beql.QuestLines[1]:GetTop() - beql.QuestLines[#beql.QuestLines]:GetTop()) + beql.QuestLines[#beql.QuestLines]:GetHeight())

    -- last item is an icon, expand size to it
    if ( iconHeightLeft > 0 ) then
        QuestWatchFrame:SetHeight(QuestWatchFrame:GetHeight() + iconHeightLeft + 2)
        --yOffset = -iconHeightLeft;
    end

    -- we use a own Frame, so we return a used hight of zero
    return 0, maxWidth;
end

function beql:ReleaseUnusedLinkButtons ()
    if not beql.watchButtonIndex then
        -- no buttons ever drawed -> exit
        return
    end

    local watchButton
    for i = beql.watchButtonIndex, #beql.LinkButtons do
        watchButton = beql.LinkButtons[i];
        watchButton.type = nil
        watchButton.index = nil;
        watchButton:Hide();
        watchButton.frameCache:ReleaseFrame(watchButton);
        beql.LinkButtons[i] = nil;
    end
end

function beql:GetLinkButton (frameparent)
    if not beql.watchButtonIndex then
        beql.watchButtonIndex = 1
    end

    local button = beql.LinkButtons[beql.watchButtonIndex]
    if ( not button ) then
        beql.LinkButtons[beql.watchButtonIndex] = beql.buttonCache:GetFrame();
        button = beql.LinkButtons[beql.watchButtonIndex];
    end

    button:SetParent(frameparent)
    beql.watchButtonIndex = beql.watchButtonIndex + 1;
    return button;
end

function beql:GetQuestLine (frameparent)
    local line = beql.QuestLines[questLineIndex];
    if ( not line ) then
        beql.QuestLines[questLineIndex] = beql.lineCache:GetFrame();
        line = beql.QuestLines[questLineIndex];
    end

    line:Reset();
    line:SetParent(frameparent)

    local t1,_ , t2 = line.text:GetFont()
    line.text:SetFont(t1, beql.db.profile.TrackerFontHeight, t1)
    line:SetHeight(beql.db.profile.TrackerFontHeight + (beql.db.profile.TrackerFontHeight/4))

    questLineIndex = questLineIndex + 1;
    return line;
end

function beql:ReleaseUnusedQuestLines ()
    local line
    for i = questLineIndex, #beql.QuestLines do
        line = beql.QuestLines[i];
        line:Hide();
        line.frameCache:ReleaseFrame(line);
        beql.QuestLines[i] = nil;
    end

    questLineIndex = 1;
end

-- For adding Text to Watcher
function beql:AddWatchLineText(id,text,size,color,height)
--  local tmp = 0
--  if tmp == 0 then
--      return
--  end

    local curWidth, tempWidth
    local _
    --local linenr
    if size == nil then size = beql.db.profile.TrackerFontHeight end
    if color == nil then color = {r=1,g=1,b=1} end
    if height == nil then height = beql.db.profile.TrackerFontHeight end
    watchText = getglobal("QuestWatchLine"..id)
    if watchText ~= nil then
        t1, _, t2 = watchText:GetFont()
        watchText:SetWidth(0)
        watchText:SetHeight(0)
        watchText:SetText(text)
        watchText:SetNonSpaceWrap(true)
        watchText:SetFont(t1, size, t2)
        tempWidth = watchText:GetWidth()
        curWidth = watchText:GetStringWidth()
        if not beql.db.profile.TrackerAutoResize then
            if curWidth > beql.db.profile.TrackerFixedWidth then
                -- Switching back to auto calculate so this is not needed
                --linenr = ceil(curWidth / beql.db.profile.TrackerFixedWidth)
                --watchText:SetHeight(height*linenr)
                watchText:SetWidth(beql.db.profile.TrackerFixedWidth)
            else
                watchText:SetHeight(height)
                watchText:SetWidth(curWidth)
            end
        else
            watchText:SetHeight(height)
            watchText:SetWidth(curWidth)
        end

        if ( id > 1 ) then
            watchText:SetPoint("TOPLEFT", "QuestWatchLine"..(id - 1), "BOTTOMLEFT", 0, -4)
        end
        watchText:SetTextColor(color.r, color.g, color.b)
        watchText:Show()
    else
        print("Frame QuestWatchLine"..id.." not found!")
    end
    return tempWidth
end

function beql:SavePositionTracker()
    --[[
    local Left = QuestWatchFrame:GetLeft()
    local Right = QuestWatchFrame:GetRight()
    local Top = QuestWatchFrame:GetTop()
    local Bottom = QuestWatchFrame:GetBottom()
    local lock
    local pointone
    local pointtwo
    local TOPBOTTOM_MEDIAN = 384
    local LEFTRIGHT_MEDIAN = 512
    if Left and Right and Top and Bottom then
        if Bottom < TOPBOTTOM_MEDIAN and Top > TOPBOTTOM_MEDIAN then
            local topcross = Top - TOPBOTTOM_MEDIAN
            local bottomcross = TOPBOTTOM_MEDIAN - Bottom
            if bottomcross > topcross then
                lock = "BOTTOM"
                pointtwo = Bottom
            else
                lock = "TOP"
                pointtwo = Top
            end
        elseif Top > TOPBOTTOM_MEDIAN then
            lock = "TOP"
            pointtwo = Top
        elseif Bottom < TOPBOTTOM_MEDIAN then
            lock = "BOTTOM"
            pointtwo = Bottom
        end
        if Left < LEFTRIGHT_MEDIAN and Right > LEFTRIGHT_MEDIAN then
            local leftcross = LEFTRIGHT_MEDIAN - Left
            local rightcross = Right - LEFTRIGHT_MEDIAN
            if rightcross > leftcross then
                lock = lock.."RIGHT"
                pointone = Right
            else
                lock = lock.."LEFT"
                pointone = Left
            end
        elseif Left < LEFTRIGHT_MEDIAN then
            lock = lock.."LEFT"
            pointone = Left
        elseif Right > LEFTRIGHT_MEDIAN then
            lock = lock.."RIGHT"
            pointone = Right
        end
        if lock and lock ~= "" and pointone and pointtwo then
            QuestWatchFrame:ClearAllPoints()
            QuestWatchFrame:SetPoint(lock,"UIParent","BOTTOMLEFT",pointone,pointtwo)
            beql.db.char.saved.qtrackercorner = lock
            beql.db.char.saved.qtrackerposx = pointone
            beql.db.char.saved.qtrackerposy = pointtwo
        elseif beql.db.char.saved.qtrackercorner and beql.db.char.saved.qtrackerposx and beql.db.char.saved.qtrackerposy then
            QuestWatchFrame:ClearAllPoints()
            QuestWatchFrame:SetPoint(beql.db.char.saved.qtrackercorner,"UIParent","BOTTOMLEFT",beql.db.char.saved.qtrackerposx,beql.db.char.saved.qtrackerposy)
        end
    end
    ]]--
end

-- EOF --