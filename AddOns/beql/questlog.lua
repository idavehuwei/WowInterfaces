beql = LibStub("AceAddon-3.0"):GetAddon("beql")
local beqlQ = beqlQ
local L = LibStub("AceLocale-3.0"):GetLocale("beql")

local OldQuestLogButtonTable
local beqlQuestLogButtonTable

function beql:InitQuestLog()
    -- Events
    beql:RegisterEvent("QUEST_PROGRESS")
    beql:RegisterEvent("QUEST_COMPLETE")
    beql:RegisterEvent("QUEST_LOG_UPDATE")

    -- Quixout dosn't Fire Events, it now uses callbacks
    beqlQ.RegisterCallback(beql, "Quest_Complete")
    beql:RegisterEvent("Quixote_Leaderboard_Update")

    -- Hooks
    beql:RawHook("QuestLog_OnShow", "Hooks_QuestLog_OnShow", true)
    -- <event function="*"> are terrible
    -- backup old function
    if not beql.hooks.QuestLog_OnShow then
        beql.hooks.QuestLog_OnShow = QuestLogFrame:GetScript("OnShow")
    end
    QuestLogFrame:SetScript("OnShow", beql.Hooks_QuestLog_OnShow);

    -- backup old function
    if not beql.hooks.QuestLog_OnUpdate then
        beql.hooks.QuestLog_OnUpdate = QuestLogFrame:GetScript("OnUpdate")
    end
    QuestLogFrame:SetScript("OnUpdate",function(self, elapsed)
        beql.hooks.QuestLog_OnUpdate(self, elapsed)

        -- Update lines after scolling
        -- if beql.ofsset ~= HybridScrollFrame_GetOffset(QuestLogScrollFrame) then
        if beql.ofsset ~= HybridScrollFrame_GetOffset(QuestLogFrame) then
            -- beql.ofsset = HybridScrollFrame_GetOffset(QuestLogScrollFrame)
            beql.ofsset = HybridScrollFrame_GetOffset(QuestLogFrame)
            QuestLog_Update()
        end
    end)

    beql:RawHook("QuestLogTitleButton_OnClick","Hooks_QuestLogTitleButton_OnClick", true)
    beql:RawHook("GetQuestLogTitle","Hooks_GetQuestLogTitle",true)
    -- beql:Hook("QuestLogCollapseAllButton_OnClick","Hooks_QuestLogCollapseAllButton_OnClick", true)
    if(QuestLogCollapseAllButton) then
        beql:SecureHook("QuestLogCollapseAllButton_OnClick", function()
            beql.Hooks_QuestLogCollapseAllButton_OnClick(QuestLogCollapseAllButton)
        end)
    end
    beql:RawHook("QuestLog_Update", "Hooks_QuestLog_Update", true)

    QuestLogTitleText:SetText(L["Bayi's Extended Quest Log"])

    if not beql.ConfigButton then
        -- beql.ConfigButton = CreateFrame("Button","ConfigButton", QuestLogFrame, "UIPanelButtonTemplate")
        beql.ConfigButton = CreateFrame("Button","ConfigButton", QuestLogFrame)
    end
    beql.ConfigButton:SetWidth(32)
    beql.ConfigButton:SetHeight(32)
    -- beql.ConfigButton:SetText("O")
    beql.ConfigButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\option_up")
    beql.ConfigButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\option_down")
    beql.ConfigButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    beql.ConfigButton:Show()
    beql.ConfigButton:ClearAllPoints()
    beql.ConfigButton:SetPoint("RIGHT", QuestLogFrameCloseButton, "LEFT", 10, 0)
    beql.ConfigButton:SetScript("OnClick", function()
        InterfaceOptionsFrame_OpenToCategory(beql3.optionsFrames["main"])
    end)

    QuestLogFrame:SetScript("OnDragStart",function() QuestLogFrame:StartMoving() end)
    QuestLogFrame:SetScript("OnDragStop",function() QuestLogFrame:StopMovingOrSizing() beql:SavePosition() end)
    QuestLogFrame:SetAlpha(beql.db.profile.QuestLogAlpha)
    QuestLogFrame:SetScale(beql.db.profile.QuestLogScale)

    -- move to the middle of the Frame
    -- QuestLogCount:SetPoint("TOPLEFT", QuestLogFrame,"TOPLEFT",250,-41)
    -- QuestLogCount: x80 y-41
end

function beql:ExtendedQuestLog()
    -- Code from DoubleWide by Iriel
    -- {
    QuestLogFrame:SetAttribute("UIPanelLayout-width", 680)
    QuestLogFrame:SetWidth(718)
    QuestLogFrame:SetHeight(561)
    QuestLogListScrollFrame:ClearAllPoints()
    QuestLogListScrollFrame:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 20, -74)
    QuestLogListScrollFrame:SetHeight(411)
    QuestLogDetailScrollFrame:ClearAllPoints()
    QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPRIGHT", 30, 2)
    QuestLogDetailScrollFrame:SetHeight(413)

    if not beql.MinimizeButton then
        -- beql.MinimizeButton = CreateFrame("Button","MinimizeButton", QuestLogFrame, "UIPanelButtonTemplate")
        beql.MinimizeButton = CreateFrame("Button","MinimizeButton", QuestLogFrame)
    end

    -- backup old buttons, usa a blizzard function from UIParent.lua
    local oldQuestsDisplayed = QUESTS_DISPLAYED
    QUESTS_DISPLAYED = 27
    local oldbutton = getglobal("QuestLogTitle" .. oldQuestsDisplayed)
    for i = oldQuestsDisplayed + 1, QUESTS_DISPLAYED do
        -- parent is not QuestLogFrame, otherwise hiding will not work to 100%
        local button = CreateFrame("Button", "QuestLogTitle" .. i, MinimizeButton, "QuestLogTitleButtonTemplate")
        button:SetID(i)
        button:Hide()
        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", oldbutton, "BOTTOMLEFT", 0, 1)
        oldbutton = button;  -- use old button to speed this up
    end

    local regions = { QuestLogFrame:GetRegions() }

    local xOffsets = { Left = 0; Middle = 256; Right = 512; }
    local yOffsets = { Top = 0; Bot = -256; }

    local textures = {
        TopLeft = "Interface\\AddOns\\beql\\Images\\topleft",
        TopMiddle = "Interface\\AddOns\\beql\\Images\\topmid_on",
        TopRight = "Interface\\AddOns\\beql\\Images\\topright",

        BotLeft = "Interface\\AddOns\\beql\\Images\\botleft",
        BotMiddle = "Interface\\AddOns\\beql\\Images\\botmid_on",
        BotRight = "Interface\\AddOns\\beql\\Images\\botright",

        Icon = "Interface\\Addons\\beql\\Images\\icon",
    }

    -- we refeence the artworks in an array,
    -- to access them faster by switch
    -- Key's are: TopLeft TopMiddle TopRight BotLeft BotMiddle BotRight and Icon
    if not beql.questlogframes then
        beql.questlogframes = {}

        -- get existing textures
        -- local PATTERN = "^Interface\\QuestFrame\\UI%-QuestLogDualPane%-(([A-Za-z]+))$"
        local PATTERN = "^Interface\\QuestFrame\\UI%-QuestLog%-(([A-Z][a-z]+)([A-Z][a-z]+))$"
        for _, region in ipairs(regions) do
            if region:IsObjectType("Texture") then
                local texturefile = region:GetTexture()
                if texturefile == "Interface\\QuestFrame\\UI-QuestLog-BookIcon" then
                    beql.questlogframes.Icon = region
                end
                local which, yofs, xofs = texturefile:match(PATTERN)
                -- local which = texturefile:match(PATTERN)
                -- if which then
                --     -- print(" back up " .. texturefile)
                --     -- beql:printpoints(region)
                --     region:Hide()
                --     beql.questlogframes[which] = region;
                -- end
                xofs = xofs and xOffsets[xofs]
                yofs = yofs and yOffsets[yofs]
                if xofs and yofs and textures[which] then
                    beql.questlogframes[which] = region;
                end
            end
        end

        for name, path in pairs(textures) do
            local yofs, xofs = name:match("^([A-Z][a-z]+)([A-Z][a-z]+)$")
            xofs = xofs and xOffsets[xofs]
            yofs = yofs and yOffsets[yofs]
            if (xofs and yofs) and not beql.questlogframes[name] then
                beql.questlogframes[name] = QuestLogFrame:CreateTexture(nil, "ARTWORK")
            end
        end
    end

    for name, region in pairs(beql.questlogframes) do
        local yofs, xofs = name:match("^([A-Z][a-z]+)([A-Z][a-z]+)$")
        xofs = xofs and xOffsets[xofs]
        yofs = yofs and yOffsets[yofs]
        if (xofs and yofs) then
                region:ClearAllPoints()
                region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs)
                region:SetTexture(textures[name])
                region:SetWidth(256)
                region:SetHeight(256)
                region:Show()
        else
            if name == "Icon" then
                region:SetTexture(textures[name])
            else
                -- print("Oops, something wrong with textur " .. name)
                region:Hide()
            end
        end
    end
    -- }
    -- Code from DoubleWide by Iriel, mod by angelike @ wowace.com
    QuestFramePushQuestButton:ClearAllPoints()
    QuestFramePushQuestButton:SetPoint("LEFT", QuestLogFrameAbandonButton, "RIGHT", 0, 0)
    QuestLogFrameCloseButton:SetPoint("TOPRIGHT",QuestLogFrame , "TOPRIGHT",-33,-8)
    QuestFrameExitButton:SetPoint("BOTTOMRIGHT", QuestLogFrame, "BOTTOMRIGHT", -47, 54)

    beql.MinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
    beql.MinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    beql.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
    beql.MinimizeButton:SetWidth(32)
    beql.MinimizeButton:SetHeight(32)
    beql.MinimizeButton:Show()
    beql.MinimizeButton:ClearAllPoints()
    beql.MinimizeButton:SetPoint("RIGHT",QuestLogFrameCloseButton, "LEFT", 10, 0)
    beql.MinimizeButton:SetScript("OnClick",
        function()
            if beql.db.char.saved.minimized then
                beql:Maximize()
            else
                beql:Minimize()
            end
        end
    )

    beql.ConfigButton:SetPoint("RIGHT",beql.MinimizeButton, "LEFT", 11, 0)
end

function beql:SimpleQuestlog()
    if not beql.questlogframes then
        -- Extended Questlog not loaded, return
        return;
    end

    -- restore old sizes an points
    QuestLogFrame:SetAttribute("UIPanelLayout-width", nil)
    QuestLogFrame:SetWidth(384)
    QuestLogFrame:SetHeight(512)
    QuestLogListScrollFrame:ClearAllPoints()
    QuestLogListScrollFrame:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", 19, -75)
    QuestLogListScrollFrame:SetHeight(93)
    QuestLogDetailScrollFrame:ClearAllPoints()
    QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "BOTTOMLEFT", 0, -7)
    QuestLogDetailScrollFrame:SetHeight(261)

    QUESTS_DISPLAYED = 6

    -- restore old textures
    local xOffsets = { Left = 0; Middle = nil; Right = 256; }
    local yOffsets = { Top = 0; Bot = -256; }

    local textures = {
        -- Top Textures
        TopLeft = "Interface\\QuestFrame\\UI-QuestLog-TopLeft",
        TopRight = "Interface\\QuestFrame\\UI-QuestLog-TopRight",

        -- Bottom Textures
        BotLeft = "Interface\\QuestFrame\\UI-QuestLog-BotLeft",
        BotRight = "Interface\\QuestFrame\\UI-QuestLog-BotRight",

        -- Icon Texture
        Icon = "Interface\\QuestFrame\\UI-QuestLog-BookIcon",
    }

    -- processing texturfiles
    -- for name, region in pairs(beql.questlogframes) do
    --     if name == "Icon" then
    --         region:SetTexture(textures[name])
    --     elseif name == 'Left' or name == 'RIGHT' then
    --         region:Show()
    --     else
    --         -- hide other textures
    --         region:Hide()
    --     end
    -- end
    for name, region in pairs(beql.questlogframes) do
        local yofs, xofs = name:match("^([A-Z][a-z]+)([A-Z][a-z]+)$")
        xofs = xofs and xOffsets[xofs]
        yofs = yofs and yOffsets[yofs]
        if (xofs and yofs) then
                region:ClearAllPoints()
                region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs)
                region:SetTexture(textures[name])
                if(xofs > 0) then
                    region:SetWidth(128)
                else
                    region:SetWidth(256)
                end
                region:SetHeight(256)
                region:Show()
        else
            if name == "Icon" then
                region:SetTexture(textures[name])
            else
                -- hide our middle textures
                region:Hide()
            end
        end
    end

    -- hide MinimizeButton will also hide QuestLogTitles 7-27
    beql.MinimizeButton:Hide()

    beql.ConfigButton:ClearAllPoints()
    beql.ConfigButton:SetPoint("RIGHT",QuestLogFrameCloseButton, "LEFT",10,0)
    QuestLogFrameCloseButton:SetPoint("TOPRIGHT",QuestLogFrame , "TOPRIGHT",-30,-8)
    QuestFrameExitButton:ClearAllPoints()
    QuestFrameExitButton:SetPoint("BOTTOMRIGHT", QuestLogFrame, "BOTTOMRIGHT", -43, 54)
end

function beql:ToggleQuestlogStyle(style)
    beql.db.profile.simplequestlog = style;
    if not beql.db.profile.simplequestlog then
        beql:ExtendedQuestLog();
    else
        beql:SimpleQuestlog();
    end
    beql:SetQuestLogFontSize(beql.db.profile.QuestLogFontSize);
    QuestLog_Update();
end

function beql:Minimize()
    beql.db.char.saved.minimized = true
    if beql.db.profile.simplequestlog then
        return
    end
    beql.ConfigButton:SetPoint("RIGHT",beql.MinimizeButton, "LEFT", 10, 0)
    beql.MinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\restore_up")
    beql.MinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\restore_down")
    QuestLogDetailScrollFrame:Hide()
    QuestLogFrame:SetAttribute("UIPanelLayout-width", 390)
    QuestLogFrame:SetWidth(389)
    -- QuestLogFrame:SetWidth(353)
    local regions = { QuestLogFrame:GetRegions() }
    for _, region in ipairs(regions) do
        if region:IsObjectType("Texture") then
            local texturefile = region:GetTexture()
            if texturefile == "Interface\\AddOns\\beql\\Images\\topmid_on" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\topmid_off")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\botmid_on" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\botmid_off")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\botright" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\botright_off")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\topright" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\topright_off")
            end
        end
    end
    -- QuestLogControlPanel:Hide()

    -- SHOW_QUEST_OBJECTIVES_ON_MAP = nil
    -- QuestLogFrameShowMapButton:Hide()
end

function beql:Maximize()
    beql.db.char.saved.minimized = false
    if beql.db.profile.simplequestlog then
        return
    end
    local numEntries, _ = GetNumQuestLogEntries()
    if ( numEntries == 0 ) then
        return
    end
    beql.ConfigButton:SetPoint("RIGHT",beql.MinimizeButton, "LEFT", 10, 0)
    beql.MinimizeButton:SetNormalTexture("Interface\\AddOns\\beql\\Images\\minimize_up")
    beql.MinimizeButton:SetPushedTexture("Interface\\AddOns\\beql\\Images\\minimize_down")
    QuestLogDetailScrollFrame:Show()
    QuestLogFrame:SetAttribute("UIPanelLayout-width", 680)
    QuestLogFrame:SetWidth(718)
    -- QuestLogFrame:SetWidth(682)

    local regions = { QuestLogFrame:GetRegions() }
    for _, region in ipairs(regions) do
        if region:IsObjectType("Texture") then
            local texturefile = region:GetTexture()
            if texturefile == "Interface\\AddOns\\beql\\Images\\topmid_off" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\topmid_on")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\botmid_off" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\botmid_on")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\botright_off" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\botright")
            end
            if texturefile == "Interface\\AddOns\\beql\\Images\\topright_off" then
                region:SetTexture("Interface\\AddOns\\beql\\Images\\topright")
            end
        end
    end
    -- QuestLogControlPanel:Show()
    -- SHOW_QUEST_OBJECTIVES_ON_MAP = "1"
    -- QuestLogFrameShowMapButton:Show()
    -- QuestLogFrameShowMapButton:SetAlpha(0.25)
end

function beql:SavePosition()
    local Left = QuestLogFrame:GetLeft()
    local Top = QuestLogFrame:GetTop()
    if Left and Top then
        beql.db.char.saved.qlogposx = Left
        beql.db.char.saved.qlogposy = Top
    end
end

function beql:Quest_Complete(event, questname, uid)
    if beql.db.profile.InfoOnQuestCompletion then
        UIErrorsFrame:AddMessage(questname.." "..L["Completed!"], 1.0, 0.8, 0.0, 1.0, UIERRORS_HOLD_TIME)
        if beql.db.profile.InfoSound and beql.db.profile.InfoSound ~= "" then
            PlaySoundFile(beql.db.profile.InfoSound)
        end
    end
end

--
-- EVENTS --
--
function beql:QUEST_PROGRESS()
    if beql.db.profile.autocomplete then
        CompleteQuest()
    end
end

function beql:QUEST_COMPLETE()
    if beql.db.profile.autocomplete and GetNumQuestChoices() == 0 then
        GetQuestReward(QuestFrameRewardPanel.itemChoice)
    end
end

function beql:Quixote_Quest_Complete(questname)
    if beql.db.profile.InfoOnQuestCompletion then
        UIErrorsFrame:AddMessage(questname.." "..L["Completed!"], 1.0, 0.8, 0.0, 1.0, UIERRORS_HOLD_TIME)
        if beql.db.profile.InfoSound and beql.db.profile.InfoSound ~= "" then
            PlaySoundFile(beql.db.profile.InfoSound)
        end
    end
end

function beql:Quixote_Leaderboard_Update(questname, id, lid, description, numHad, numGot, numNeeded, type)
    if beql.db.profile.AnnounceQuest and GetNumPartyMembers() > 0 then
        local chatType = "PARTY"
        local text = ""
        local objText = ""
        local qstatus
        if type == "item" or type == "monster" or type == "reputation" then
            objText = objText..": "..numGot.."/"..numNeeded
        end
        text = description..objText
        SendChatMessage(text, chatType)
        _,_,_,_,qstatus = beqlQ:GetQuestByName(questname)
        if numGot == numNeeded and (qstatus == 1) then
            SendChatMessage(questname.." "..L["Completed!"], chatType)
        end
    end
end

function beql:QUEST_LOG_UPDATE()
    if(beqlfu) then
      local _,questEntries = GetNumQuestLogEntries()
      --beqlfu:SetFuBarText(questEntries.."/25")
    end
end

--
-- Hooks
--
function beql:Hooks_QuestLogTitleButton_OnClick(this, mousebutton)
    -- print("QuestLogTitleButton ID: "..this:GetID())
    -- Add control click
    if beql.db.char.saved.minimized then
        beql:Maximize()
    end
    local questName = this:GetText()
    -- local questIndex = this:GetID()-- + HybridScrollFrame_GetOffset(QuestLogScrollFrame);
    local questIndex = this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame)

    if mousebutton == "LeftButton" then
        if not IsShiftKeyDown() and IsControlKeyDown() then
            if ChatFrameEditBox:IsVisible() then
                beql:AddQuestStatusToChatFrame(questIndex)
            end
        end
        if IsShiftKeyDown()  then
            local questLogTitleText, isHeader, isCollapsed, firstTrackable, lastTrackable, numTracked, numUntracked
            lastTrackable = -1
            numTracked = 0
            numUntracked = 0
            local track = false
            if this.isHeader  then
                for i=1, GetNumQuestLogEntries(), 1 do
                    questLogTitleText, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(i)
                    if questLogTitleText == questName  then
                        track = true
                        firstTrackable = i+1
                    elseif ( track ) then
                        if not isHeader  then
                            if IsQuestWatched(i)  then
                                numTracked = numTracked+1
                                RemoveQuestWatch(i)
                            else
                                numUntracked = numUntracked+1
                                RemoveQuestWatch(i)
                            end
                        end
                        if isHeader and questLogTitleText ~= questName  then
                            lastTrackable = i-1
                            break
                        end
                    end
                end
                if lastTrackable == -1  then
                    lastTrackable = GetNumQuestLogEntries()
                end
                if  numUntracked == 0  then
                    -- Untrack all
                    for i=firstTrackable, lastTrackable, 1 do
                        RemoveQuestWatch(i)
                    end
                    WatchFrame_Update()
                else
                    -- Track all
                    for i=firstTrackable, lastTrackable, 1 do
                        AddQuestWatch(i)
                        -- Set an error message if trying to show too many quests
                        if ( GetNumQuestWatches() >= MAX_WATCHABLE_QUESTS ) then
                            UIErrorsFrame:AddMessage(format(QUEST_WATCH_TOO_MANY, MAX_WATCHABLE_QUESTS), 1.0, 0.1, 0.1, 1.0)
                            break
                        end
                    end
                    WatchFrame_Update()
                end
                QuestLog_Update()
            end
        end
    end

    --
    -- Original QuestLogTitleButton_OnClick(button) (altered)
    --

    -- local questName = this:GetText()
    -- local questIndex = this:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame)
    if ( IsShiftKeyDown() ) then
        -- If header then return
        if ( this.isHeader ) then
            return
        end
        -- Otherwise try to track it or put it into chat
        if ( ChatFrameEditBox:IsVisible() ) then
            --ChatFrameEditBox:Insert(strsub(strtrim(this:GetText()),11))
            local questLink = GetQuestLink(questIndex);
            if ( questLink ) then
                ChatEdit_InsertLink(questLink);
            else
                ChatFrameEditBox:Insert(gsub(this:GetText(), " *(.*)", "%1"))
            end
        else
            -- Shift-click toggles quest-watch on this quest.
            if ( IsQuestWatched(questIndex) ) then
                -- print("QuestLog:removequestwatch: " .. questIndex)
                RemoveQuestWatch(questIndex)
                WatchFrame_Update()
            else
                -- print("QuestLog:addquestwatch: " .. questIndex)
                -- Set an error message if trying to show too many quests
                if ( GetNumQuestWatches() >= MAX_WATCHABLE_QUESTS ) then
                    UIErrorsFrame:AddMessage(format(QUEST_WATCH_TOO_MANY, MAX_WATCHABLE_QUESTS), 1.0, 0.1, 0.1, 1.0)
                    return
                end
                AddQuestWatch(questIndex)
                QuestLog_Update()
                WatchFrame_Update()
            end
        end
    end

    -- Quest History Love :)
    if (IsAltKeyDown() and QuestHistoryFrame) then -- questhistory
        if (mousebutton == "LeftButton") then
            QuestHistoryFrameSearchEditBox_OnEnterPressed_External(questName)
        end
    end

    QuestLog_SetSelection(questIndex)
    -- if IsAddOnLoaded("Lightheaded") then
        -- LightHeaded:QuestLogTitleButton_OnClick(frame, button)
    -- end
    QuestLog_Update()

    -- make sure that Quixote get's his Data
    beqlQ.frame:QUEST_LOG_UPDATE()
    -- WatchFrame_Update();
    -- WatchFrame_Update();
end

function beql:Hooks_QuestLog_OnShow(self)
    securecall(beql.hooks.QuestLog_OnShow)
    QuestLog_Update()

    -- QuestLogDetailScrollFrame:SetHeight(410)

    if beql.db.char.saved.qlogposx and beql.db.char.saved.qlogposy then
        QuestLogFrame:ClearAllPoints()
        QuestLogFrame:SetPoint("TOPLEFT","UIParent", "BOTTOMLEFT", beql.db.char.saved.qlogposx, beql.db.char.saved.qlogposy)
    end

    if beql.db.char.saved.minimized or beql.db.profile.alwaysminimize or GetQuestLogSelection() == 0 then
        beql:Minimize()
    end
    if beql.db.profile.alwaysmaximize then
        beql:Maximize()
    end
end

function beql:Hooks_GetQuestLogTitle(...)
    local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = beql.hooks.GetQuestLogTitle(...)

    if beql.db.profile.showlevel and questLogTitleText and level and level > 0 and not isHeader and beql.AddTags then
        if  questTag == GROUP then
            if suggestedGroup > 0 then
                questLogTitleText = "["..  level .. "G" .. suggestedGroup .. "]" .. questLogTitleText
            else
                questLogTitleText = "["..  level .. "G] " .. questLogTitleText
            end
        elseif  questTag == ELITE  then
            questLogTitleText = "[" .. level .. "+] " .. questLogTitleText
        elseif  questTag == DUNGEON_DIFFICULTY2 then
            questLogTitleText = "[" .. level .. "H] " .. questLogTitleText
        elseif  questTag == RAID  then
            questLogTitleText = "[" .. level .. "R] " .. questLogTitleText
        elseif  questTag == PVP  then
            questLogTitleText = "[" .. level .. "P] " .. questLogTitleText
        elseif isDaily then
            questLogTitleText = "[" .. level .. "Y] " .. questLogTitleText
        elseif  questTag == LFG_TYPE_DUNGEON  then
            questLogTitleText = "[" .. level .. "D] " .. questLogTitleText
        else
            questLogTitleText = "[" .. level .. "] " .. questLogTitleText
        end
    end

    return questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily
end

function beql:Hooks_QuestLogCollapseAllButton_OnClick(this)
    --beql.hooks.QuestLogCollapseAllButton_OnClick(this)
    if beql.db.char.saved.minimized then
        beql:Minimize()
    else
        beql:Maximize()
    end
    QuestLog_Update()

    -- make sure that Quixote get's his Data
    beqlQ.frame:QUEST_LOG_UPDATE()
    WatchFrame_Update()
end

function beql:Hooks_QuestLog_Update()
    -- if GetQuestLogSelection() ~= 0 then
    --     QuestLogDetailFrame_AttachToQuestLog();
    --     QuestLogDetailScrollFrame:SetHeight(410)
    -- else
    --     QuestLogDetailFrame_DetachFromQuestLog();
    -- end
    beql.AddTags = true
    securecall(beql.hooks.QuestLog_Update)
    beql.AddTags = false
    local numEntries, numQuests = GetNumQuestLogEntries()

    if beql.db.char.saved.minimized or ( numEntries == 0 ) then
        beql:Minimize()
    else
        beql:Maximize()
    end
    -- QuestLogCount:SetPoint("TOPLEFT", QuestLogFrame,"TOPLEFT",250,-41)
end

function beql:SetQuestLogFontSize(size)
    if not size or size == 0 then size = 14 end
    local font, fontsize, fontflags, button, buttontag
    -- for i = 1, #QuestLogScrollFrame.buttons do
    for i = 1, QUESTS_DISPLAYED do
        -- buttontag = getglobal("QuestLogScrollFrameButton"..i.."Tag")
        buttontag = getglobal("QuestLogTitle"..i.."Tag")
        font,fontsize,fontflags = buttontag:GetFont()
        buttontag:SetFont(font,size)

        -- button = getglobal("QuestLogScrollFrameButton"..i.."NormalText");
        button = getglobal("QuestLogTitle"..i.."NormalText");
        font,fontsize,fontflags = button:GetFont()
        button:SetFont(font,size)
    end

    font,fontsize,fontflags = QuestLogDummyText:GetFont()
    QuestLogDummyText:SetFont(font,size + 6)

    -- Questdiscrition short
    -- title
    font,fontsize,fontflags = QuestLogQuestTitle:GetFont()
    QuestLogQuestTitle:SetFont(font,size + 6)

    -- description
    font,fontsize,fontflags = QuestLogObjectivesText:GetFont()
    QuestLogObjectivesText:SetFont(font,size)

    -- objetives
    for i = 1, 10 do
        buttontag = getglobal("QuestLogObjective" .. i);
        font,fontsize,fontflags = buttontag:GetFont()
        buttontag:SetFont(font,size)
    end

    -- need money
    font,fontsize,fontflags = QuestLogRequiredMoneyText:GetFont()
    QuestLogRequiredMoneyText:SetFont(font,size)

    -- Questdiscrition long
    -- title
    font,fontsize,fontflags = QuestLogDescriptionTitle:GetFont()
    QuestLogDescriptionTitle:SetFont(font,size + 6)

    -- description
    font,fontsize,fontflags = QuestLogQuestDescription:GetFont()
    QuestLogQuestDescription:SetFont(font,size)

    -- Questreward
    -- title
    font,fontsize,fontflags = QuestLogRewardTitleText:GetFont()
    QuestLogRewardTitleText:SetFont(font,size+6)

    -- items
    font,fontsize,fontflags = QuestLogItemChooseText:GetFont()
    QuestLogItemChooseText:SetFont(font,size)

    -- items
    font,fontsize,fontflags = QuestLogItemReceiveText:GetFont()
    QuestLogItemReceiveText:SetFont(font,size)

    -- spell
    font,fontsize,fontflags = QuestLogSpellLearnText:GetFont()
    QuestLogSpellLearnText:SetFont(font,size)

    -- titles
    font,fontsize,fontflags = QuestLogPlayerTitleText:GetFont()
    QuestLogPlayerTitleText:SetFont(font,size)
end

--- EOF ---
