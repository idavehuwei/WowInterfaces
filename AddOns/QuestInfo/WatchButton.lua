-------------------------------------------------------------------------------
-- WatchButton.lua ver 1.0
-- 日期: 2010年8月13日
-- 作者: dugu
-- 描述: 给任务追踪加上查询按键
-- 版权所有 (c) duowan.com
--------------------------------------------------------------------------------
local CQI = Cartographer_QuestInfo;
local L = LibStub("AceLocale-3.0"):GetLocale("Cartographer_QuestInfo");
local BZR = LibStub("LibBabble-Zone-3.0"):GetReverseLookupTable()
local CQI_QueryButtons = {};
local CQI_NPCButtons = {};
local QuestData = {};

local OnMouseDown = function(self)
    if (self.oID and self.qID) then
        CQI:CloseLocationFrame()
        CQI_Tooltip:Hide()
        CQI:ClearQuestNotes()

        if (not QuestData[self.qID]) then
            QuestData[self.qID] = CQI:GetQuest(self.qID);
        end

        if (not QuestData[self.qID]) then return; end

        local obj = QuestData[self.qID].objs and QuestData[self.qID].objs[self.oID];
        if (obj) then
            local map = {};
            map.quest = QuestData[self.qID].title_full;
            map.zones = {}
            map.title = obj.title
            map.npcs = obj.npcs
            local obj_type = QuestData[self.qID].daily and "obj-daily" or "obj";
            if not map.npcs then return end

            local zone_count = 0
            local last_zone = nil
            for _, npc in ipairs(map.npcs) do
                if npc.loc then
                    for zone, pos in pairs(npc.loc) do
                        if BZR[zone] then
                            if not map.zones[zone] then
                                map.zones[zone] = { npc }
                                last_zone = zone
                                zone_count = zone_count + 1
                            else
                                table.insert(map.zones[zone], npc)
                            end
                        end
                    end
                end
            end

            if zone_count == 1 then
                CQI:OpenQuestMap(map.quest, map.title, obj_type, last_zone, map.zones[last_zone]);
            elseif zone_count > 1 then
                CQI:OpenLocationFrame(map);
            end
        end
    end

    self.texture:SetTexCoord(0, 1, 0, 1);
end

function CQI:CreateQueryButton(index, qID, oID, qIndex, Completed)
    local button;
    if (oID) then
        button = CQI_QueryButtons[index];
        if (not button) then
            button = CreateFrame("Button", nil, WatchFrameLines);
            button:SetHeight(20);
            button:SetWidth(20);
            button:SetFrameLevel(button:GetFrameLevel() + 5);
            button.texture = button:CreateTexture(nil, "BACKGROUND");
            button.texture:SetTexture("Interface\\TUTORIALFRAME\\TutorialFrame-QuestionMark");
            button.texture:SetAllPoints(button);
            button:SetHighlightTexture("Interface\\TUTORIALFRAME\\TutorialFrame-QuestionMark", "ADD");
            button:SetScript("OnMouseDown", OnMouseDown);
            button:SetScript("OnMouseUp", function(self)
                self.texture:SetTexCoord(0.075, 0.925, 0.075, 0.925);
            end);
            CQI_QueryButtons[index] = button;
        end
        local line = WATCHFRAME_QUESTLINES[index];
        button:ClearAllPoints();
        button:SetPoint("RIGHT", line, "LEFT", 10, -2);
        button.oID = oID;
    else
--        if (not Completed) then
--            button = self:QuestPOI_DisplayButton("WatchFrameLines", QUEST_POI_NUMERIC, qIndex, qID);
--        else
--            button = self:QuestPOI_DisplayButton("WatchFrameLines", QUEST_POI_COMPLETE_IN, qIndex, qID);
--        end
--        CQI_NPCButtons[button] = 1;
--        button.qIndex = qIndex;
--        local line = WATCHFRAME_QUESTLINES[index];
--        button:SetPoint("RIGHT", line, "LEFT", 0, 0);
    end

    if (button) then
        button.qID =  qID;
        if (not QuestData[button.qID]) then
            QuestData[button.qID] = CQI:GetQuest(button.qID);
        end

        if (QuestData[button.qID]) then
            button:Show();
        else
            button:Hide();
        end
    end
    return button;
end

function CQI:InitNpcButtons()
    for k, v in pairs(CQI_NPCButtons) do
        CQI_NPCButtons[k] = 0;
    end
end

function CQI:HideOtherNpcButtons()
    for button, v in pairs(CQI_NPCButtons) do
        if (v == 0) then
            button:Hide();
        end
    end
end

function CQI:WatchFrame_Update()
    local index = 1;
    self:HideAllWatchButton();
    --self:InitNpcButtons();
    local ii = 0;
    for i=1, GetNumQuestWatches(), 1 do
        local qIndex = GetQuestIndexForWatch(i);
        --index = index + 1;
        if (qIndex) then
            local qID;
            local qlink = GetQuestLink(qIndex);
            local isComplete, isDaily, questID = select(7, GetQuestLogTitle(qIndex));
            local oNum = GetNumQuestLeaderBoards(qIndex);
            local requiredMoney = GetQuestLogRequiredMoney(qIndex);
            local filterOK = true;
            if ( isComplete and bit.band(WATCHFRAME_FILTER_TYPE, WATCHFRAME_FILTER_COMPLETED_QUESTS) ~= WATCHFRAME_FILTER_COMPLETED_QUESTS ) then
                filterOK = false;
            elseif ( bit.band(WATCHFRAME_FILTER_TYPE, WATCHFRAME_FILTER_REMOTE_ZONES) ~= WATCHFRAME_FILTER_REMOTE_ZONES and not LOCAL_MAP_QUESTS[questID] ) then
                filterOK = false;
            end

            if (filterOK) then
                if qlink then
                    qID = tonumber(string.match(qlink, 'quest:(%d+)'));
                    questID = questID or qID;
                    if (questID) then
                        --self:CreateQueryButton(index, questID, nil, i);
                        ii = ii + 1;
                    end
                end

                index = index + 1;

                -- questFaild对我们的定位没影响
                if ( oNum == 0 and GetMoney() >= requiredMoney ) then
                    isComplete = true;
                end
                if (isComplete) then
                    --if (GetQuestLogIsAutoComplete(qIndex)) then
                    --  index = index + 2;
                    --else
                        index = index + 1;
                    --end
                else
                    for j=1, oNum do
                        if (questID) then
                            self:CreateQueryButton(index, questID, j);
                        end
                        index = index + 1;
                    end

                    if ( requiredMoney > GetMoney() ) then
                        index = index + 1;
                    end
                end
            end
        end
    end

    --self:HideOtherNpcButtons();
    --self:QuestPOI_HideButtons("WatchFrameLines", QUEST_POI_NUMERIC, ii+1);
end

function CQI:HideAllWatchButton()
    for i, b in pairs(CQI_QueryButtons) do
        b:Hide();
    end
end

function CQI:EnableWatchButton()
    self:GetNoteScalling();
    self:SecureHook("WatchFrame_Update");
end

function CQI:DisableWatchButton()
    self:Unhook("WatchFrame_Update");
end

function CQI:BatchOpenQuest(button)
    if (button.qID) then
        CQI:CloseLocationFrame();
        CQI_Tooltip:Hide();
        CQI:ClearQuestNotes();
        if (not QuestData[button.qID]) then
            QuestData[button.qID] = CQI:GetQuest(button.qID);
        end

        local q = QuestData[button.qID];
        local qIndex = GetQuestIndexForWatch(button.qIndex);
        local isComplete = select(7, GetQuestLogTitle(qIndex));
        local requiredMoney = GetQuestLogRequiredMoney(qIndex);
        local oNum = GetNumQuestLeaderBoards(qIndex);
        if (oNum == 0 and GetMoney() > requiredMoney) then
            isComplete = true;
        end

        if (isComplete) then
            if (q.end_npc and q.end_npc.loc) then
                for zone, v in pairs(q.end_npc.loc) do
                    self:AddQuestNotes(q.title_full, L["Quest End"], "end", q.end_npc, zone);
                    self:GotoQuestZone(zone);
                    return;
                end
            end
        else
            local objs = QuestData[button.qID].objs;
            local curZone = QuestInfo_Zone[GetCurrentMapZone()];
            if (objs) then
                local maps = {};
                local zone_count = 0;
                local last_zone = nil;
                local inCurZone = false;
                for oid, obj in ipairs(objs) do
                    local desc, _, done = GetQuestLogLeaderBoard(oid, qIndex);
                    if (not done) then
                        local map = {};
                        map.quest = QuestData[button.qID].title_full;
                        map.zones = {};
                        map.title = obj.title;
                        map.npcs = obj.npcs;
                        map.type = QuestData[button.qID].daily and "obj-daily" or "obj";

                        if map.npcs then
                            for _, npc in ipairs(map.npcs) do
                                if npc.loc then
                                    for zone, pos in pairs(npc.loc) do
                                        if BZR[zone] then
                                            if not map.zones[zone] then
                                                map.zones[zone] = { npc };
                                                last_zone = zone;
                                                zone_count = zone_count + 1;
                                                if (curZone == zone) then
                                                    inCurZone = true;
                                                end
                                            else
                                                table.insert(map.zones[zone], npc);
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        table.insert(maps, map);
                    end
                end

                -- 该处的规则需要修改
                local zone = inCurZone and curZone or last_zone;
                for i, map in ipairs(maps) do
                    if (map.zones[zone]) then
                        -- TODO: 根据i顺序标记不同的颜色
                        self:BatchAddQuestNotes(map.quest, map.title, map.type, zone, map.zones[zone]);
                    end
                end
                self:GotoQuestZone(zone);
            end
        end
    end
end

function CQI_WatchFrameQuestPOI_OnClick(self)
    CQI:BatchOpenQuest(self);
end