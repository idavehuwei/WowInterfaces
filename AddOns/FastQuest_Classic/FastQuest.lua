-- $Id: FastQuest.lua 86 2009-06-04 18:23:45Z arithmandar $
--[[

 "FastQuest Classic" is a free software; you can redistribute it and/or modify it under the terms of the
 GNU General Public License as published by the Free Software Foundation; either version 2 of the License,
 or (at your option) any later version.

--]]

---------------------------------------------------------------------
-- Global Variables
---------------------------------------------------------------------
-- Debug, set to false in beta and official release
FQ_DEBUG = false;
FASTQUEST_CLASSIC_VERSION = GetAddOnMetadata("FastQuest_Classic", "Version");
-- Number of the format styles
FQ_nFormats = 4;
-- Default chat channel
FQ_CHATTYPE = "SAY";
-- RealmName
FQ_server = GetCVar("realmName");
-- Player character name
FQ_player = UnitName("player");

local FQ_LoadTrackedQuest = true;
local FQ_ShowWatchFrame = true;

-- Hook the original Blizzard QuestLog_Update to run inside the modded QuestLog_Update()
--hQuestLog_Update = QuestLog_Update;
function Hook_QuestLog_Update()
    FastQuest_QuestLog_Update()
end
hooksecurefunc("QuestLog_Update", Hook_QuestLog_Update)

-- Hook the original Blizzard WatchFrame_Update to run inside the modded WatchFrame_Update()
function Hook_WatchFrame_Update()
    FastQuest_WatchFrame_Update()
end
hooksecurefunc("WatchFrame_Update", Hook_WatchFrame_Update)

-- Replace the original Blizzard QuestLogTitleButton_OnClick to run inside the modded QuestLogTitleButton_OnClick()
function QuestLogTitleButton_OnClick(self, mousebutton)
    FastQuest_QuestLogTitleButton_OnClick(self, mousebutton)
end

-- Hook the original Blizzard UpdateUIPanelPositions
--hUpdateUIPanelPositions = UpdateUIPanelPositions;

if (FQ_player == nil or
        FQ_player == UNKNOWNBEING or
        FQ_player == UKNOWNBEING or
        FQ_player == UNKNOWNOBJECT) then
    FQ_player = "DEFAULT";
end

local DefaultFQDOptions = {
    ["AutoAdd"] = true,
    ["AutoComplete"] = true,
    ["AutoNotify"] = true,
    ["ButtonPos"] = 60,
    ["Color"] = true,
    ["Detail"] = true,
    ["DoubleWidth"] = true,
    ["FastQuest_Classic_Version"] = FASTQUEST_CLASSIC_VERSION,
    ["Format"] = FQ_nFormats,
    ["Lock"] = false,
    ["MemberInfo"] = true,
    ["NoDrag"] = false,
    ["NotifyDiscover"] = true,
    ["NotifyExp"] = true,
    ["NotifyGuild"] = false,
    ["NotifyLevelUp"] = true,
    ["NotifyNearby"] = false,
    ["NotifyParty"] = true,
    ["NotifyRaid"] = false,
    ["ShowButton"] = true,
    ["Tag"] = true,
};
---------------------------------------------------------------------
function FQ_ShowQuestComplete(qIndex)
--    PlaySoundFile("Sound/Interface/igplayerBind.wav");
    UIErrorsFrame:AddMessage("|cff00ffff" .. GetQuestLogTitle(qIndex) .. FQ_QUEST_COMPLETED, 1.0, 1.0, 1.0, 1.0, 2);
    if (FQD.AutoNotify == true) then
        FastQuest_SendNotification("[" .. GetQuestLogTitle(qIndex) .. "] " .. FQ_QUEST_ISDONE);
    end
    RemoveQuestWatch(questDoneID);
    QuestLog_Update();
    WatchFrame_Update();
end

function FQ_BuildLevelTag(qTag)
    if (qTag == LFG_TYPE_DUNGEON) then
        return "D";
    elseif (qTag == RAID) then
        return "R";
    elseif (qTag == PVP) then
        return "P";
    else
        return "+";
    end
end

function FQ_BuildLevelString(qLevel, qLevelTag)
    local tag = qLevelTag;
    if (qLevel == nil or qLevel == "") then
        return "";
    end
    if (tag == nil or tag == "") then
        tag = "";
    end
    if (FQD.Format == 1) then
        return "";
    elseif (FQD.Format == 2) then
        return "[" .. qLevel .. "] ";
    elseif (FQD.Format == 3) then
        return "[" .. qLevel .. tag .. "] ";
    elseif (FQD.Format == 4) then
        return "[" .. qLevel .. tag .. "] ";
    end
end

function FastQuest_FreshOptions()
    FQ_Debug_Print("FastQuest_FreshOptions()");
    FQD = FQ_CloneTable(DefaultFQDOptions);
    FQD[FQ_server] = {};
    FQD[FQ_server][FQ_player] = {};
    FQD[FQ_server][FQ_player] = {
        ["nQuests"] = 0;
        ["tQuests"] = {};
    };
end

--Code by Grayhoof (SCT)
function FQ_CloneTable(t) -- return a copy of the table t
    FQ_Debug_Print("FQ_CloneTable()");
    local new = {}; -- create a new table
    local i, v = next(t, nil); -- i is an index of t, v = t[i]
    while i do
        if type(v) == "table" then
            v = FQ_CloneTable(v);
        end
        new[i] = v;
        i, v = next(t, i); -- get next index
    end
    return new;
end

function FastQuest_OnLoad(self)
    FQ_Debug_Print("FastQuest_OnLoad()");

    -- Register for events
    self:RegisterEvent("ADDON_LOADED");
    self:RegisterEvent("CHAT_MSG_SYSTEM");
    self:RegisterEvent("CLOSE_WORLD_MAP");
    self:RegisterEvent("QUEST_COMPLETE");
    self:RegisterEvent("QUEST_GREETING");
    self:RegisterEvent("QUEST_PROGRESS");
    self:RegisterEvent("QUEST_WATCH_UPDATE");
    self:RegisterEvent("PLAYER_LEVEL_UP");
    self:RegisterEvent("UI_INFO_MESSAGE");
    self:RegisterEvent("VARIABLES_LOADED");
    self:RegisterEvent("WORLD_MAP_UPDATE");

    SLASH_FQ1 = "/fastquest";
    SLASH_FQ2 = "/fq";
    SlashCmdList["FQ"] = FastQuest_SlashCmd;

    -- initialize all the default options parameters
    if (FQD == nil or FQD["FastQuest_Classic_Version"] ~= FASTQUEST_CLASSIC_VERSION) then
        FastQuest_FreshOptions();
    end
end

function FastQuest_OnEvent(self, event, message)
    --FQ_Debug_Print("FastQuest_OnEvent()");

    if (event == "VARIABLES_LOADED") then
        FQ_Debug_Print("VARIABLES_LOADED");
        -- initialize all the default options parameters
        if (FQD == nil or FQD["FastQuest_Classic_Version"] ~= FASTQUEST_CLASSIC_VERSION) then
            FastQuest_FreshOptions();
        end

        FastQuest_UpdatePlayer();
        FastQuest_Options_Init();
        FastQuest_Classic_Button_Init();
        FastQuest_Classic_Button_UpdatePosition();
        qOut(FQ_LOADED);

        dQuestWatchDragButton:SetNormalTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Minimize_Up")
        dQuestWatchDragButton:SetPushedTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Minimize_Down")
        dQuestWatchDragButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

        FastQuest_LinkFrame(dQuestWatchDragButton:GetName(), WatchFrame:GetName());
        FastQuest_LockMovableParts();
        -- It seems somehow the WatchFame's height is limited to 140, we will manually set it to the MaxResize value
        local x, y = WatchFrame:GetMaxResize();
        local y1 = WatchFrame:GetHeight();
        if (y1 < y) then
            WatchFrame:SetHeight(y);
        end
        -- If user doesn't want the double width of quest log, then we won't do that
        if (FQD.DoubleWidth) then
            FQ_QuestLogFrame_DoubleWidth();
        end
        --Adds a FastQuest button to the Earth Feature Frame
        if (EarthFeature_AddButton) then
            EarthFeature_AddButton({
                id = "FastQuest_Classic";
                name = "FastQuest_Classic";
                subtext = "FastQuest_Classic";
                tooltip = "FastQuest Classic";
                icon = "Interface\\Addons\\FastQuest_Classic\\Images\\FastQuest_Classic_Button-Up";
                callback = FastQuest_Options_Toggle;
                test = nil;
            });
        end
    elseif ((event == "QUEST_PROGRESS") and (FQD.AutoComplete == true)) then
        FQ_Debug_Print("QUEST_PROGRESS");
        CompleteQuest();
    elseif ((event == "QUEST_COMPLETE") and (FQD.AutoComplete == true)) then
        FQ_Debug_Print("QUEST_COMPLETE");
        if (GetNumQuestChoices() == 0) then
            GetQuestReward(QuestFrameRewardPanel.itemChoice);
        end
    elseif (event == "UI_INFO_MESSAGE" and message) then
        FQ_Debug_Print("UI_INFO_MESSAGE");
        -- Here the quest progress like 'You have picked up 2/20 xxx items' will be detected.
        local uQuestText = gsub(message, FQ_QUEST_TEXT, "%1", 1);
        if (uQuestText ~= message) then
            -- Only when Auto Notify is set to true and Detail also set to true, then FQ will do the notification
            if (FQD.AutoNotify == true and FQD.Detail == true) then
                FastQuest_SendNotification(FQ_QUEST_PROGRESS .. message);
            end
            if (FQD.AutoAdd == true and GetNumQuestWatches() < MAX_WATCHABLE_QUESTS) then
                local questIndex = FastQuest_GetQuestID(uQuestText);
                if (questIndex) then
                    if (not IsQuestWatched(questIndex)) then
                        FastQuest_Watch(questIndex, true);
                    end
                end
            end
        else
            FastQuest_CheckPatterns(message);
        end
    elseif (event == "CHAT_MSG_SYSTEM" and message) then
        FQ_Debug_Print("CHAT_MSG_SYSTEM");
        FastQuest_CheckPatterns(message);
        -- When player is level up, notify the party member
    elseif (event == "PLAYER_LEVEL_UP") then
        FQ_Debug_Print("PLAYER_LEVEL_UP");
        if ((FQD.AutoNotify == true) and (FQD.NotifyLevelUp == true)) then
            FastQuest_SendNotification(PLAYER_LEVEL_UP);
        end
    end
end

function FastQuest_SlashCmd(msg)
    FQ_Debug_Print("FastQuest_SlashCmd()");

    if (msg) then
        local cmd = gsub(msg, "%s*([^%s]+).*", "%1");
        local info = FQ_INFO;
        -- Display the quest type like Elite, Dungeon, PvP, etc., info in the QuestTracker window
        if (cmd == "tag") then FastQuest_Toggle_Tag(); return;
            -- Auto Add, automatically add the quest items / progress into QuestTracker window
        elseif (cmd == "autoadd") then FastQuest_Toggle_AutoAdd(); return;
            -- Auto Notify the party members regarding to your quest progress
        elseif (cmd == "autonotify") then FastQuest_Toggle_AutoNotify(); return;
            -- Auto Complete, automatically hands out the quest
        elseif (cmd == "autocomplete") then FastQuest_Toggle_AutoComplete(); return;
            -- Allow to notify the guild members regarding to your quest progress
        elseif (cmd == "notifyguild") then FastQuest_Toggle_NotifyGuild(); return;
            -- Allow to notify the party members regarding to your quest progress
        elseif (cmd == "notifyparty") then FastQuest_Toggle_NotifyParty(); return;
            -- Allow to notify the raid members regarding to your quest progress
        elseif (cmd == "notifyraid") then FastQuest_Toggle_NotifyRaid(); return;
            -- Always notify your quest progress even you are not in any party
        elseif (cmd == "notifynearby") then FastQuest_Toggle_NotifyNearby(); return;
            -- Allow to notify your detail quest progress
        elseif (cmd == "detail") then FastQuest_Toggle_NotifyDetails(); return;
            -- Lock the QuestTracker window
        elseif (cmd == "lock" and FQD.NoDrag == false) then FastQuest_Toggle_Lock(); return;
            -- Unlock the QuestTracker
        elseif (cmd == "unlock" and FQD.NoDrag == false) then FastQuest_Toggle_Unlock(); return;
        elseif (cmd == "nodrag") then FastQuest_Toggle_Nodrag(); return;
            -- Reset the QuestTracker window's position to default
        elseif (cmd == "reset" and FQD.NoDrag == false) then FastQuest_Toggle_Reset(); return;
        elseif (cmd == "format") then FastQuest_Toggle_Format(); return;
        elseif (cmd == "clear") then FastQuest_Toggle_Clear(); return;
        elseif (cmd == "color") then FastQuest_Toggle_Color(); return;
        elseif (cmd == "memberinfo") then FastQuest_Toggle_MemberInfo(); return;
        elseif (cmd == "notifyexp") then FastQuest_Toggle_NotifyExp(); return;
        elseif (cmd == "notifydiscover") then FastQuest_Toggle_NotifyDiscover(); return;
        elseif (cmd == "notifylevelup") then FastQuest_Toggle_NotifyLevelUp(); return;
        elseif (cmd == "options") then FastQuest_Options_Init(); FastQuest_Options_Toggle(); return;
        elseif (cmd == "status") then
            qOut("|cfffffffffq autonotify     - " .. FastQuest_ShowBoolean(FQD.AutoNotify));
            qOut("|cfffffffffq notifyguild    - " .. FastQuest_ShowBoolean(FQD.NotifyGuild));
            qOut("|cfffffffffq notifyraid     - " .. FastQuest_ShowBoolean(FQD.NotifyRaid));
            qOut("|cfffffffffq notifynearby   - " .. FastQuest_ShowBoolean(FQD.NotifyNearby));
            qOut("|cfffffffffq autoadd        - " .. FastQuest_ShowBoolean(FQD.AutoAdd));
            qOut("|cfffffffffq autocomplete   - " .. FastQuest_ShowBoolean(FQD.AutoComplete));
            qOut("|cfffffffffq color          - " .. FastQuest_ShowBoolean(FQD.Color));
            qOut("|cfffffffffq detail         - " .. FastQuest_ShowBoolean(FQD.Detail));
            qOut("|cfffffffffq lock(unlock)   - " .. FastQuest_ShowLock(FQD.Lock));
            qOut("|cfffffffffq memberinfo     - " .. FastQuest_ShowBoolean(FQD.MemberInfo));
            qOut("|cfffffffffq notifyexp      - " .. FastQuest_ShowBoolean(FQD.NotifyExp));
            qOut("|cfffffffffq notifydiscover - " .. FastQuest_ShowBoolean(FQD.NotifyDiscover));
            qOut("|cfffffffffq notifylevelup  - " .. FastQuest_ShowBoolean(FQD.NotifyLevelUp));
            qOut("|cfffffffffq tag            - " .. FastQuest_ShowBoolean(FQD.Tag));
            return;
        else
            qOut(info .. FQ_INFO_USAGE);
            qOut("|cffffffff/fq autonotify     - " .. FQ_USAGE_AUTONOTIFY);
            qOut("|cffffffff/fq notifyguild    - " .. FQ_USAGE_NOTIFYGUILD);
            qOut("|cffffffff/fq notifyraid     - " .. FQ_USAGE_NOTIFYRAID);
            qOut("|cffffffff/fq notifynearby   - " .. FQ_USAGE_NOTIFYNEARBY);
            qOut("|cffffffff/fq autoadd        - " .. FQ_USAGE_AUTOADD);
            qOut("|cffffffff/fq autocomplete   - " .. FQ_USAGE_AUTOCOMPLETE);
            qOut("|cffffffff/fq clear          - " .. FQ_USAGE_CLEAR);
            qOut("|cffffffff/fq color          - " .. FQ_USAGE_COLOR);
            qOut("|cffffffff/fq detail         - " .. FQ_USAGE_DETAIL);
            qOut("|cffffffff/fq format         - " .. FQ_USAGE_FORMAT);
            qOut("|cffffffff/fq lock(unlock)   - " .. FQ_USAGE_LOCK);
            qOut("|cffffffff/fq memberinfo     - " .. FQ_USAGE_MEMBERINFO);
            qOut("|cffffffff/fq notifyexp      - " .. FQ_USAGE_NOTIFYEXP);
            qOut("|cffffffff/fq notifydiscover - " .. FQ_USAGE_NOTIFYDISCOVER);
            qOut("|cffffffff/fq options        - " .. FQ_USAGE_OPTIONS);
            qOut("|cffffffff/fq reset          - " .. FQ_USAGE_RESET);
            qOut("|cffffffff/fq status         - " .. FQ_USAGE_STATUS);
            qOut("|cffffffff/fq tag            - " .. FQ_USAGE_TAG);
            return;
        end
    end
end

function FastQuest_LoadTrackedQuest()
    for i = 1, FQD[FQ_server][FQ_player].nQuests do
        local uQuestText = FQD[FQ_server][FQ_player].tQuests[i];
        local questIndex = FastQuest_GetQuestID(uQuestText);
        if (questIndex) then
            if (not IsQuestWatched(questIndex)) then
                FastQuest_Watch(questIndex, false);
            end
        end
    end
end

function FastQuest_ShowWatchFrame()
    dQuestWatchDragButton:SetNormalTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Minimize_Up")
    dQuestWatchDragButton:SetPushedTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Minimize_Down")
    WatchFrameLines:Show();
end

function FastQuest_HideWatchFrame()
    dQuestWatchDragButton:SetNormalTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Restore_Up")
    dQuestWatchDragButton:SetPushedTexture("Interface\\AddOns\\FastQuest_Classic\\Images\\FastQuest_Restore_Down")
    WatchFrameLines:Hide();
end

function FastQuest_QuestWatchDragButton_OnClick()
    if FQ_ShowWatchFrame then
        FQ_ShowWatchFrame = false;
        FastQuest_HideWatchFrame();
    else
        FQ_ShowWatchFrame = true;
        FastQuest_ShowWatchFrame();
    end
end

function FastQuest_CheckPatterns(message)
    FQ_Debug_Print("FastQuest_CheckPatterns()");

    -- 2006/08/21: If AutoNotify is set to false, then the party members should not be notified.
    if (FQD.AutoNotify == false) then
        return;
    end
    if (GetNumPartyMembers() == 0 and FQD.NotifyNearby == false) then
        return;
    end
    for index, value in pairs(EPA_TestPatterns) do
        if (string.find(message, value)) then
            FastQuest_CheckDefaultChat(false);
            -- if the message type is experience gained, and user set not to notify
            if (value == EPA_TestPatterns[5] and FQD.NotifyExp == false) then
                break;
                -- if the message type is zone discovered, and user set not to notify
            elseif (value == EPA_TestPatterns[6] and FQD.NotifyDiscover == false) then
                break;
            else
                FastQuest_SendNotification(message);
            end
            break;
        end
    end
end

function FastQuest_QuestLogTitleButton_OnClick(self, button)
    FQ_Debug_Print("QuestLogTitleButton_OnClick()");

    local questName = self:GetText()
    local qIndex = self:GetID() + FauxScrollFrame_GetOffset(QuestLogListScrollFrame);

    local function SendQuestToChatFrame(qIndex, n_qObjectives)
        local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(qIndex);
        local LevelTag = "";

        LevelTag = FQ_BuildLevelTag(questTag);

        local insertString = FQ_BuildLevelString(level, LevelTag) .. GetQuestLink(qIndex);
        if (FQD.Format == 4) then
            if (questTag) then questTag = ("(" .. questTag .. ")"); else questTag = ""; end
            if (suggestedGroup == 0) then suggestedGroup = ""; else suggestedGroup = ":" .. suggestedGroup; end
            insertString = insertString .. questTag .. suggestedGroup;
        end
        if (insertString and insertString ~= "") then
            if (n_qObjectives) then
                insertString = insertString .. ": " .. n_qObjectives;
            end
            ChatFrameEditBox:Insert(insertString);
        end
    end

    local function SendHeadEntriesQuestToChatFrame(questName)
        local questLogTitleText, isHeader, isCollapsed, firstTrackable, lastTrackable, numTracked, numUntracked
        lastTrackable = -1
        numTracked = 0
        numUntracked = 0
        local track = false

        for i=1, GetNumQuestLogEntries(), 1 do
            questLogTitleText, _, _, _, isHeader, isCollapsed = GetQuestLogTitle(i)
            if questLogTitleText == questName  then
                track = true
                firstTrackable = i+1
            elseif ( track ) then
                if isHeader and questLogTitleText ~= questName  then
                    lastTrackable = i-1
                    break
                end
            end
        end
        if lastTrackable == -1  then
            lastTrackable = GetNumQuestLogEntries()
        end
        for i=firstTrackable, lastTrackable do
            ChatFrameEditBox:Insert(GetQuestLink(i))
        end
    end

    local function TrackHeadEntriesQuest(questName)
        local qTitle, isHeader, isCollapsed, isComplete, firstTrackable, lastTrackable, numTracked, numUntracked
        lastTrackable = -1
        numTracked = 0
        numUntracked = 0
        local track = false
        local tracktable = {}
        local completetable = {}

        for i=1, GetNumQuestLogEntries(), 1 do
            qTitle, _, _, _, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i)
            if qTitle == questName then
                track = true
                firstTrackable = i+1
            elseif ( track ) then
                if not isHeader  then
                    if IsQuestWatched(i) then
                        if (isComplete) then
                            table.insert(completetable, i)
                        else
                            table.insert(tracktable, i)
                        end
                        numTracked = numTracked+1
                        RemoveQuestWatch(i)
                    else
                        if (isComplete) then
                            table.insert(completetable, i)
                        else
                            table.insert(tracktable, i)
                        end
                        numUntracked = numUntracked+1
                    end
                end
                if isHeader and qTitle ~= questName then
                    lastTrackable = i-1
                    break
                end
            end
        end
        if lastTrackable == -1 then
            lastTrackable = GetNumQuestLogEntries()
        end
        if numUntracked - #completetable == 0 then
            -- Untrack all
            for i=firstTrackable, lastTrackable do
                if IsQuestWatched(i) then
                    RemoveQuestWatch(i)
                end
            end
            WatchFrame_Update()
        else
            -- Track all
            if (numTracked == 0) then
                for k,v in pairs(completetable) do
                    FQ_ShowQuestComplete(v)
                end
            end
            for k,v in pairs(tracktable) do
                AddQuestWatch(v)
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

    if (not self.isHeader) then
        QuestLog_SetSelection(qIndex);
    end

    if (not IsModifiedClick()) then
        if (self.isHeader) then
            local _, _, _, _, _, isCollapsed = GetQuestLogTitle(qIndex);
            if ( isCollapsed ) then
                ExpandQuestHeader(qIndex);
            else
                CollapseQuestHeader(qIndex);
            end
            return;
        end
    end

    if (button == "LeftButton") then
        if (IsShiftKeyDown()) then
            if (self.isHeader)  then
                if (ChatFrameEditBox:IsVisible()) then
                    SendHeadEntriesQuestToChatFrame(questName)
                else
                    TrackHeadEntriesQuest(questName)
                end
            else
                if (ChatFrameEditBox:IsVisible()) then
                    SendQuestToChatFrame(qIndex, nil);
                else
                    FastQuest_Watch(qIndex, false);
                end
            end
        elseif (IsControlKeyDown()) then
            if (ChatFrameEditBox:IsVisible()) then
                SendQuestToChatFrame(qIndex, nil);
                local nObjectives = GetNumQuestLeaderBoards(qIndex);
                if (nObjectives > 0) then
                    ChatFrameEditBox:Insert(":");
                    for i = 1, nObjectives do
                        oText, oType, finished = GetQuestLogLeaderBoard(i, qIndex);
                        if (not oText or strlen(oText) == 0 or oText == "") then oText = oType; end
                        if (finished) then
                            ChatFrameEditBox:Insert("(X " .. oText .. ")");
                        else
                            ChatFrameEditBox:Insert("(- " .. oText .. ")");
                        end
                    end
                end
            end
        end
    elseif (button == "RightButton") then
        if (IsControlKeyDown() and ChatFrameEditBox:IsVisible()) then
            local qDescription, qObjectives = GetQuestLogQuestText();
            local n_qObjectives = string.gsub(qObjectives, "\n", "");
            FastQuest_CheckDefaultChat(true);
            if (qObjectives) then
                SendQuestToChatFrame(qIndex, n_qObjectives);
            end
            return;
        end
        if (not self.isHeader) then
            FastQuest_Watch(qIndex, false);
        end
    end
end

function FastQuest_QuestLog_Update()
    FQ_Debug_Print("QuestLog_Update()");

    if (FQ_player == "DEFAULT" or FQD[FQ_server][FQ_player].tQuests == nil) then FastQuest_UpdatePlayer(); end;
    -- FastQuest_LockMovableParts();
    local numEntries, numQuests = GetNumQuestLogEntries();

    if numQuests ~= 0 and FQ_LoadTrackedQuest then
        FastQuest_LoadTrackedQuest();
        FQ_LoadTrackedQuest = false;
    end

    -- Below codes to be disabled since now we disabled the WtachFrame hookup.
    --[[
        if (GetNumQuestWatches() < 1 and FQD[FQ_server][FQ_player].nQuests > 0) then
            for i=1, numEntries do
                FQ_Debug_Print("* SelectQuestLogEntry("..i..")");
                SelectQuestLogEntry(i);
                local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed = GetQuestLogTitle(i + FauxScrollFrame_GetOffset(QuestLogListScrollFrame));
                for j = 1, FQD[FQ_server][FQ_player].nQuests do
                    if (questLogTitleText == FQD[FQ_server][FQ_player].tQuests[j] and (not IsQuestWatched(i))) then
                        AddQuestWatch(i);
                    end
                end
            end
        end
    ]]

    for i = 1, QUESTS_DISPLAYED, 1 do
        if (i <= numEntries) then
            local questLogTitle, questCheck, cQuestLevel, questTitleTag;
            local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(i + FauxScrollFrame_GetOffset(QuestLogListScrollFrame));
            questLogTitle = getglobal("QuestLogTitle" .. i);
            questCheck = getglobal("QuestLogTitle" .. i .. "Check");
            questTitleTag = getglobal("QuestLogTitle" .. i .. "Tag");

            questCheck:SetPoint("LEFT", questLogTitle:GetName(), "LEFT", 0, 0);

            FastQuest_ChangeTitle(questLogTitle, questLogTitleText, level, questTag, suggestedGroup, isHeader, isDaily, false);

            if (FQD.Color == true) then
                cQuestLevel = FastQuest_GetDiffColor(level);
                questTitleTag:SetTextColor(cQuestLevel.r, cQuestLevel.g, cQuestLevel.b);
            end
        end
    end
end

function FastQuest_ChangeTitle(questLogTitle, questLogTitleText, level, questTag, suggestedGroup, isHeader, isDaily, Watch)
    --FQ_Debug_Print("FastQuest_ChangeTitle()");

    local ColorTag = "";
    local DifTag = "";
    local LevelTag = "";
    local cQuestLevel = FastQuest_GetDiffColor(level);
    local LevelString = "";
    if (questLogTitleText and not isHeader) then
        if (FQD.Color == true) then
            ColorTag = string.format("|cff%02x%02x%02x", cQuestLevel.r * 255, cQuestLevel.g * 255, cQuestLevel.b * 255);
        else
            ColorTag = "";
        end
        if (FQD.Tag == true) then
            if (questTag ~= nil) then
                if (isDaily) then
                    questTag = format(DAILY_QUEST_TAG_TEMPLATE, questTag);
                end
                DifTag = (" (" .. questTag .. ") ");
                LevelTag = FQ_BuildLevelTag(questTag)

            elseif (isDaily) then
                DifTag = (" (" .. DAILY .. ") ");
            end
        end

        LevelString = FQ_BuildLevelString(level, LevelTag)

        if (Watch) then
            questLogTitle:SetText(ColorTag .. LevelString .. questLogTitleText .. DifTag);
        else
            if (suggestedGroup > 0 and FQD.MemberInfo == true) then
                questLogTitle:SetText(ColorTag .. " " .. LevelString .. questLogTitleText .. " (" .. suggestedGroup .. ") ");
            else
                questLogTitle:SetText(ColorTag .. " " .. LevelString .. questLogTitleText .. " ");
            end
        end
    end
end

function FastQuest_LinkFrame(dButton, pFrame)
    FQ_Debug_Print("FastQuest_LinkFrame()");
    if (FQD.NoDrag == false) then
        getglobal(pFrame):ClearAllPoints();
        --        getglobal(pFrame):SetPoint("TOPLEFT", dButton, "TOPRIGHT", -30, 0);
        getglobal(pFrame):SetPoint("BOTTOMLEFT", dButton, "BOTTOMLEFT", 0, 0);
    else
        qOut(FQ_DRAG_DISABLED);
        FQD.Lock = true;
    end
end

function FastQuest_LockMovableParts()
    --FQ_Debug_Print("FastQuest_LockMovableParts()");

    -- Disable below codes since now the WtachFrame's dragging is not working properly
    if ((GetNumQuestWatches() > 0) and
            (WatchFrame:IsVisible()) and
            (FQD.Lock == false) and
            (FQD.NoDrag == false)) then
        dQuestWatchDragButton:Show();
    else
        dQuestWatchDragButton:Hide();
    end
end

function FastQuest_UpdatePlayer()
    FQ_Debug_Print("FastQuest_UpdatePlayer()");

    if (FQD[FQ_server] == nil) then
        FQD[FQ_server] = {};
    end
    --if ( FQD[FQ_server][FQ_player] == nil or FQD[FQ_server][FQ_player].tQuests == nil ) then
    if (FQD[FQ_server][FQ_player] == nil) then
        FQD[FQ_server][FQ_player] = {
            ["nQuests"] = 0;
            ["tQuests"] = {};
        };
        for i = 1, MAX_WATCHABLE_QUESTS, 1 do
            FQD[FQ_server][FQ_player].tQuests[i] = " ";
        end;
    end
end

function FastQuest_GetDiffColor(level)
    --FQ_Debug_Print("FastQuest_GetDiffColor()");

    local lDiff = level - UnitLevel("player");
    if (lDiff >= 0) then
        for i = 1.00, 0.10, -0.10 do
            color = { r = 1.00, g = i, b = 0.00 };
            if ((i / 0.10) == (10 - lDiff)) then return color; end
        end
    elseif (-lDiff < GetQuestGreenRange()) then
        for i = 0.90, 0.10, -0.10 do
            color = { r = i, g = 1.00, b = 0.00 };
            if ((9 - i / 0.10) == (-1 * lDiff)) then return color; end
        end
    elseif (-lDiff == GetQuestGreenRange()) then
        color = { r = 0.50, g = 1.00, b = 0.50 };
    else
        color = { r = 0.75, g = 0.75, b = 0.75 };
    end
    return color;
end

function FastQuest_WatchFrame_Update()
    FQ_Debug_Print("WatchFrame_DisplayTrackedQuests()");

    -- Link WatchFrame to FQ's dragging button so that we can drag the WatchFrame with green ball
    WatchFrameLines:SetPoint("TOPRIGHT", "dQuestWatchDragButton", "BOTTOMLEFT", 0, 0);
    local line, lastLine, questTitle;
    local questIndex = 1;
    local watchItemIndex = 0;
    local watchButtonIndex = 1;
    local qDone = true;
    local watchLine = 1;
    local questObjectiveID = 1;
    local questDoneID = -1;
    local HIGHLIGHT_FONT_COLOR = HIGHLIGHT_FONT_COLOR;
    local NORMAL_FONT_COLOR = NORMAL_FONT_COLOR;
    local linkButton;

    local initialOffset = 0;
    local heightUsed = 0;
    local maxWidth = 0;
    local maxHeight = (WatchFrame:GetTop() - WatchFrame:GetBottom());

    local iconHeightLeft = 0;
    -- Set nQuest to the actual number of quest-watches
    local numQuestWatches = GetNumQuestWatches();
    if (numQuestWatches > 0) then
        FQD[FQ_server][FQ_player].nQuests = numQuestWatches;
    end

    for i = 1, numQuestWatches do
        local questWidth = 0;
        FQD[FQ_server][FQ_player].tQuests[i] = " ";
        questIndex = GetQuestIndexForWatch(i);
        if (questIndex) then
            local heightNeeded = WatchFrame_GetHeightNeededForQuest(questIndex);
            if (heightNeeded > maxHeight + (initialOffset - heightUsed)) then
                return heightUsed, maxWidth; -- We ran out of space to draw quests, stop.
            else
                heightUsed = heightUsed + heightNeeded;
            end
            local itemButton;
            local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questIndex);
            if (isComplete) then
                questDoneID = questIndex;
            end

            FQD[FQ_server][FQ_player].tQuests[i] = questLogTitleText;

            numObjectives = GetNumQuestLeaderBoards(questIndex);
            if (numObjectives > 0) then -- How did a quest with 0 objectives end up getting tracked again? Might as well still check it.
                line = WATCHFRAME_QUESTLINES[watchLine];
                questTitle = line;
                FastQuest_ChangeTitle(line.text, questLogTitleText, level, questTag, suggestedGroup, isHeader, isDaily, true);
                if (not lastLine) then
                    --line:SetPoint("TOPRIGHT", WatchFrameLines, "TOPRIGHT", 0, initialOffset);
                    --line:SetPoint("TOPLEFT", WatchFrameLines, "TOPLEFT", 0, initialOffset);
                else
                    local yOffset = 0;
                    if (iconHeightLeft > 0) then
                        yOffset = -iconHeightLeft;
                    end
                    line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, yOffset - WATCHFRAME_QUEST_OFFSET);
                    line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, yOffset - WATCHFRAME_QUEST_OFFSET);
                end
                iconHeightLeft = 0;
                local stringWidth = line.text:GetStringWidth();

                if (not WatchFrame.disableButtons) then
                    linkButton = WATCHFRAME_LINKBUTTONS[watchButtonIndex];
                    linkButton:SetPoint("TOPLEFT", line);
                    linkButton:SetPoint("BOTTOMLEFT", line);
                    linkButton:SetPoint("RIGHT", line.text);
                    linkButton.type = "QUEST";
                    linkButton.index = i;
                    linkButton:Show();
                    watchButtonIndex = watchButtonIndex + 1;
                end

                local link, item, charges = GetQuestLogSpecialItemInfo(questIndex);
                if (item) then
                    watchItemIndex = watchItemIndex + 1;
                    itemButton = _G["WatchFrameItem" .. watchItemIndex];
                    if (not itemButton) then
                        WATCHFRAME_NUM_ITEMS = watchItemIndex;
                        itemButton = CreateFrame("BUTTON", "WatchFrameItem" .. watchItemIndex, lineFrame, "WatchFrameItemButtonTemplate");
                    end
                    itemButton:Show();
                    itemButton:ClearAllPoints();
                    itemButton:SetID(questIndex);
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

                watchLine = watchLine + 1;

                lastLine = line;
                qDone = false;
                for j = 1, numObjectives do
                    questObjectiveID = j;
                    line = WATCHFRAME_QUESTLINES[watchLine];
                    local oTitle, oType, finished = GetQuestLogLeaderBoard(j, questIndex);
                    if (finished) then
                        line.text:SetText("|cFFC0FFCF X " .. oTitle .. " ");
                        qDone = true;
                    else
                        line.text:SetText("|cFFFFFFFF - " .. oTitle .. " ");
                        qDone = false;
                    end
                    line:SetPoint("TOPRIGHT", lastLine, "BOTTOMRIGHT", 0, WATCHFRAMELINES_FONTSPACING);
                    line:SetPoint("TOPLEFT", lastLine, "BOTTOMLEFT", 0, WATCHFRAMELINES_FONTSPACING);
                    line:Show();
                    stringWidth = line.text:GetStringWidth();
                    if (iconHeightLeft > 0) then
                        line.text.clear = true;
                        line.text:SetPoint("RIGHT", itemButton, "LEFT", -4, 0);
                        itemButton.maxStringWidth = max(stringWidth, itemButton.maxStringWidth)
                        questWidth = max(stringWidth + WATCHFRAME_ITEM_WIDTH, questWidth);
                    else
                        questWidth = max(stringWidth, questWidth);
                    end
                    iconHeightLeft = iconHeightLeft - WATCHFRAMELINES_FONTHEIGHT - WATCHFRAMELINES_FONTSPACING;
                    watchLine = watchLine + 1;
                    lastLine = line;
                end
                if (itemButton) then
                    itemButton:SetPoint("TOPRIGHT", questTitle, "TOPLEFT", questWidth, -WATCHFRAMELINES_FONTSPACING);
                    itemButton:Show();
                end

                if (itemButton) then
                    maxWidth = max(questWidth + WATCHFRAME_ITEM_WIDTH, maxWidth);
                else
                    maxWidth = max(questWidth, maxWidth);
                end
            end --  if ( numObjectives > 0 )
        end
    end
    if (questDoneID > 0) then
        FQ_Debug_Print("questDoneID = " .. questDoneID);
        FQ_ShowQuestComplete(questDoneID);
    end
    FQ_Debug_Print("End of QuestQatch_Update, nQuests = " .. GetNumQuestWatches());
    if (numQuestWatches > 0) then
        FQD[FQ_server][FQ_player].nQuests = numQuestWatches;
    end
    FastQuest_LockMovableParts();
end

function FastQuest_Watch(questIndex, auto)
    FQ_Debug_Print("FastQuest_Watch()");

    if (questIndex) then
        if ((IsQuestWatched(questIndex)) and (auto == false)) then
            RemoveQuestWatch(questIndex);
            QuestLog_Update();
            WatchFrame_Update();
            -- WatchFrameLines:SetPoint("TOPLEFT", "dQuestWatchDragButton", "BOTTOMRIGHT", 0, 0);
            WatchFrameLines:SetPoint("TOPRIGHT", "dQuestWatchDragButton", "BOTTOMLEFT", 0, 0);
        else
            if ((GetNumQuestLeaderBoards(questIndex) == 0) and (auto == false)) then
                UIErrorsFrame:AddMessage(QUEST_WATCH_NO_OBJECTIVES, 1.0, 0.1, 0.1, 1.0, UIERRORS_HOLD_TIME);
                return;
            end

            -- Set an error message if trying to show too many quests
            if ((not WatchFrame:IsUserPlaced()) and ArenaEnemyFrames and ArenaEnemyFrames:IsShown()) then
                UIErrorsFrame:AddMessage(OBJECTIVES_WATCH_QUESTS_ARENA, 1.0, 0.1, 0.1, 1.0);
                return;
            elseif (GetNumQuestWatches() >= MAX_WATCHABLE_QUESTS) then -- Check this first though it's less likely, otherwise they could make the frame bigger and be disappointed
                UIErrorsFrame:AddMessage(format(QUEST_WATCH_TOO_MANY, MAX_WATCHABLE_QUESTS), 1.0, 0.1, 0.1, 1.0);
                return;
            elseif (WatchFrame_GetRemainingSpace() < WatchFrame_GetHeightNeededForQuest(questIndex)) then
                UIErrorsFrame:AddMessage(OBJECTIVES_WATCH_TOO_MANY, 1.0, 0.1, 0.1, 1.0);
                return
            end

            AddQuestWatch(questIndex);
            QuestLog_Update();
            WatchFrame_Update();
        end
    end
end

function FastQuest_GetQuestID(str)
    local questSelected = GetQuestLogSelection();
    for i = 1, GetNumQuestLogEntries(), 1 do
        SelectQuestLogEntry(i);
        local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete = GetQuestLogTitle(i);
        if (questLogTitleText == str) then return i; end
        if (not isHeader) then
            for j = 1, GetNumQuestLeaderBoards() do
                local oText, oType, finished = GetQuestLogLeaderBoard(j);
                if ((oText == nil) or (oText == "")) then
                    oText = oType;
                end
                if (string.find(gsub(oText, "(.*): %d+/%d+", "%1", 1), gsub(str, "(.*): %d+/%d+", "%1", 1))) then
                    SelectQuestLogEntry(questSelected);
                    return i;
                end
            end
            local qDescription, qObjectives = GetQuestLogQuestText();
            if (string.find(qObjectives, str)) then
                SelectQuestLogEntry(questSelected);
                return i;
            end
        end
    end
    SelectQuestLogEntry(questSelected);
    return nil;
end

function FastQuest_CheckDefaultChat(bool)
    if (GetNumPartyMembers() == 0) then
        FQ_CHATTYPE = "SAY";
    else
        if (FQD.NotifyGuild == true) then
            FQ_CHATTYPE = "GUILD";
        elseif (FQD.NotifyRaid == true and GetNumRaidMembers() > 0) then
            FQ_CHATTYPE = "RAID";
        else
            FQ_CHATTYPE = "PARTY";
        end
    end
end

-- This function will deal with all the condition to notify quest event
function FastQuest_SendNotification(message)
    FQ_Debug_Print("FastQuest_SendNotification()");

    -- If NotifyNearby is set to true, then quest event will be send via "SAY" channel
    if (FQD.NotifyNearby == true) then
        SendChatMessage(message, "SAY");
    end
    if (FQD.NotifyParty == true and GetNumPartyMembers() > 0) then
        SendChatMessage(message, "PARTY");
    end
    if (FQD.NotifyRaid == true and GetNumRaidMembers() > 0) then
        SendChatMessage(message, "RAID");
    end
    if (FQD.NotifyGuild == true and IsInGuild() == true) then
        SendChatMessage(message, "GUILD");
    end
end

function FastQuest_ShowLock(bool)
    if (bool == true) then
        return FQ_LOCK;
    else
        return FQ_UNLOCK;
    end
end

function qOut(msg)
    if (DEFAULT_CHAT_FRAME and msg) then
        DEFAULT_CHAT_FRAME:AddMessage(msg);
    end
end

function FQ_Debug_Print(msg)
    if (FQ_DEBUG) then
        qOut("FQ DEBUG: " .. msg);
    end
end

-- Codes adpoted from DoubleWide - Iriel <iriel@vigilance-committee.org>
function FQ_QuestLogFrame_DoubleWidth()

    -- Configure this as a double-wide frame to stop the UIParent trampling on it
    QuestLogFrame:SetAttribute("UIPanelLayout-width", 724);

    -- Widen the window, note that this size includes some pad on the right hand
    -- side after the scrollbars
    QuestLogFrame:SetWidth(724);
    QuestLogFrame:SetHeight(512);

    -- Relocate the detail frame over to the right, and stretch it to full
    -- height.
    QuestLogDetailScrollFrame:ClearAllPoints();
    QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPRIGHT", 41, 0);
    QuestLogDetailScrollFrame:SetHeight(362);

    -- Expand the quest list to full height
    QuestLogListScrollFrame:SetHeight(362);

    -- Create the additional rows
    local oldQuestsDisplayed = QUESTS_DISPLAYED;
    QUESTS_DISPLAYED = QUESTS_DISPLAYED + 17;

    for i = oldQuestsDisplayed + 1, QUESTS_DISPLAYED do
        local button = CreateFrame("Button", "QuestLogTitle" .. i, QuestLogFrame, "QuestLogTitleButtonTemplate");
        button:SetID(i);
        button:Hide();
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", getglobal("QuestLogTitle" .. (i - 1)), "BOTTOMLEFT", 0, 1);
    end

    -- Now do some trickery to replace the backing textures
    local regions = { QuestLogFrame:GetRegions() }

    -- Slightly freakish offsets to align the images with the frame
    local xOffsets = { Left = 3; Middle = 259; Right = 515; }
    local yOffsets = { Top = 0; Bot = -256; }

    local textures = {
        TopLeft = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_TopLeft";
        TopMiddle = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_TopMid";
        TopRight = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_TopRight";

        BotLeft = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_BotLeft";
        BotMiddle = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_BotMid";
        BotRight = "Interface\\AddOns\\FastQuest_Classic\\Images\\DW_BotRight";
    }

    local PATTERN = "^Interface\\QuestFrame\\UI%-QuestLog%-(([A-Z][a-z]+)([A-Z][a-z]+))$";
    for _, region in ipairs(regions) do
        if (region:IsObjectType("Texture")) then
            local texturefile = region:GetTexture();
            local which, yofs, xofs = texturefile:match(PATTERN);
            xofs = xofs and xOffsets[xofs];
            yofs = yofs and yOffsets[yofs];
            if (xofs and yofs and textures[which]) then
                region:ClearAllPoints();
                region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs);
                region:SetTexture(textures[which]);
                region:SetWidth(256);
                region:SetHeight(256);
                textures[which] = nil;
            end
        end
    end

    -- Add in the new ones
    for name, path in pairs(textures) do
        local yofs, xofs = name:match("^([A-Z][a-z]+)([A-Z][a-z]+)$");
        xofs = xofs and xOffsets[xofs];
        yofs = yofs and yOffsets[yofs];
        if (xofs and yofs) then
            local region = QuestLogFrame:CreateTexture(nil, "ARTWORK");
            region:ClearAllPoints();
            region:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", xofs, yofs);
            region:SetWidth(256);
            region:SetHeight(256);
            region:SetTexture(path);
        end
    end
end
