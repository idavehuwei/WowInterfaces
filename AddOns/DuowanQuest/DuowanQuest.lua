------------------------------------------------------------------------------------------
-- DuowanQuest ver 1.0
-- 日期: 2010-5-10
-- 作者: dugu@bigfoot
-- 描述: 显示任务等级、通报任务进度、自动任务追踪等
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
DuowanQuest = LibStub("AceAddon-3.0"):NewAddon("DuowanQuest", "AceEvent-3.0", "AceHook-3.0");
local L = {};
local D = DuowanQuest;
D._DEBUG = false;
local Astrolabe = DongleStub("Astrolabe-0.4");

if (GetLocale() == "zhCN") then
    L["Quest Process: "] = "任务进度:";
    L["^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$"] = "^(.+)：%s*[-%d]+%s*/%s*[-%d]+%s*$";
    L["^(.+)[^Trade]completed.$"] = "^(.+)[^交易]完成";
    L["^(.+)\(Complete\)$"] = "^(.+)（完成）$";
    L["^Quest accepted: .+$"] = "^接受任务：.+$";
    L["Text Pattern"] = "(.*)：%s*([-%d]+)%s*/%s*([-%d]+)%s*$";
    L["say"] = "说";
    L["party"] = "小队";
    L["raid"] = "团队";
    FASTQUEST_TITLE = "增强任务日志";
    FASTQUEST_LOCK_TOGGLE_TIP2 = "Shift - 左键拖动任务追踪";
    L["隐藏小地图任务标记"] = "隐藏小地图任务标记";
    L["显示小地图任务标记"] = "显示小地图任务标记";
    L["WoWBox Choice"] = "魔盒推荐(最贵): ";
    L["WoWBox Choice GS"] = "魔盒推荐(GS高): ";
elseif (GetLocale() == "zhTW") then
    L["Quest Process: "] = "任務進度:";
    L["^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$"] = "^(.+):%s*[-%d]+%s*/%s*[-%d]+%s*$";
    L["^(.+)[^Trade]completed.$"] = "^(.+)[^交易]完成";
    L["^(.+)\(Complete\)$"] = "^(.+)（完成）$";
    L["^Quest accepted: .+$"] = "^接受任务：.+$";
    L["Text Pattern"] = "(.*):%s*([-%d]+)%s*/%s*([-%d]+)%s*$";
    L["say"] = "說";
    L["party"] = "小隊";
    L["raid"] = "團隊";
    L["WoWBox Choice"] = "魔盒推薦(最貴): ";
    L["WoWBox Choice GS"] = "魔盒推薦(GS高): ";
    FASTQUEST_TITLE = "增強任務日誌";
    FASTQUEST_LOCK_TOGGLE_TIP2 = "Shift - 左鍵拖動任務追蹤";
    L["隱藏小地圖任務標記"] = "隱藏小地圖任務標記";
    L["顯示小地圖任務標記"] = "顯示小地圖任務標記";
else
    L["Quest Process: "] = "Quest Process: ";
    L["^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$"] = "^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$";
    L["^(.+)[^Trade]completed.$"] = "^(.+)[^Trade]completed.$";
    L["^(.+)\(Complete\)$"] = "^(.+)\(Complete\)$";
    L["^Quest accepted: .+$"] = "^Quest accepted: .+$";
    L["Text Pattern"] = "(.*): %s*([-%d]+)%s*/%s*([-%d]+)%s*$";
    L["say"] = "say";
    L["party"] = "party";
    L["raid"] = "raid";
    L["WoWBox Choice"] = "魔盒推荐(最贵): ";
    L["WoWBox Choice GS"] = "魔盒推荐(GS高): ";
    FASTQUEST_TITLE = "增强任务日志";
    FASTQUEST_LOCK_TOGGLE_TIP2 = "Shift - 左键拖动任务追踪";
    L["隐藏小地图任务标记"] = "隐藏小地图任务标记";
    L["显示小地图任务标记"] = "显示小地图任务标记";
end

D.ChannelMap = {
    [L["say"]] = "SAY",
    [L["party"]] = "PARTY",
    [L["raid"]] = "RAID",
};

D.QUEST_TEXT = L["Text Pattern"];
D.QUEST_PROGRESS = L["Quest Process: "];
local DuowanQuestConfig = {
    AutoComplete = false,
    AutoNotify = true,
    Detail = true,
    AutoAdd = true,
    Channel = "PARTY",
    Level = true,
    SortByDistance = true, --add 0714
    QuestPointer = true,
    AutoChoice = true,

    -- QuestPointer
    iconScale = 0.7,
    arrowScale = 0.7,
    iconAlpha = 1,
    arrowAlpha = 1,
    watchedOnly = false,
    useArrows = false,
    fadeEdge = true,
    autoTomTom = false,
};

D.TestPatterns = {
    L["^(.+): %s*[-%d]+%s*/%s*[-%d]+%s*$"],
    L["^(.+)[^Trade]completed.$"], -- ERR_QUEST_COMPLETE_S
    L["^(.+)\(Complete\)$"], -- ERR_QUEST_OBJECTIVE_COMPLETE_S
    L["^Quest accepted: .+$"], -- ERR_QUEST_ACCEPTED_S
};

function D:Debug(msg, ...)
    if (self._DEBUG) then
        print(format(msg, ...));
    end
end

local anchorFrame;
function D:OnInitialize()
    self.db = DuowanQuestConfig;
    self.dbpc = {};
    WatchFrame_AddObjectiveHandler(function(...)
        return self:WatchFrame_Update();
    end);
    local last = dwRawGetCVar("QuestMod", "last_collapsed", 0);
    if (last == 1) then
        WatchFrame_Collapse(WatchFrame);
    end

    self.QuestPannels = {};

    -- QuestPointer
    self:RegisterEvent("QUEST_POI_UPDATE");
    self:RegisterEvent("QUEST_LOG_UPDATE", "QuestUpdate");
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA");
    --  自动选择任务奖励物品
    self:RegisterEvent("QUEST_COMPLETE");

    self:SecureHook("AddQuestWatch", "UpdatePOIs");
    self:SecureHook("RemoveQuestWatch", "UpdatePOIs");
end

local isJG = false;
local function FastQuest_Jieguan(frame, switch)
    if (switch) then
        isJG = true;
        frame.oldClearAllPoints = frame.ClearAllPoints;
        frame.ClearAllPoints = DUMMY_FUNC;
        frame.oldSetPoint = frame.SetPoint;
        frame.SetPoint = DUMMY_FUNC;
    else
        isJG = false;
        frame.ClearAllPoints = frame.oldClearAllPoints;
        frame.oldClearAllPoints = nil;
        frame.SetPoint = frame.oldSetPoint;
        frame.oldSetPoint = nil;
    end
end

function D:OnEnable()
    -- self:RegisterEvent("QUEST_COMPLETE");
    self:RegisterEvent("QUEST_PROGRESS");
    self:RegisterEvent("UI_INFO_MESSAGE");
    self:RegisterEvent("CHAT_MSG_SYSTEM");

    local isWatchFrameJG = dwRawGetCVar("DuowanConfig", "isWatchFrameJG", 0);
    if (isWatchFrameJG == 1) then
        dwRegisterForSaveFrame(WatchFrame);
        FastQuest_Jieguan(WatchFrame, true);
    end
    self:MoveableWatchFrame();
    local top = WatchFrame:GetTop();
    WatchFrame:SetClampedToScreen(false);
    WatchFrame:SetHeight(max(600, top - 30));
    WatchFrame.SetHeight = DUMMY_FUNC;
    WatchFrameHeader:SetScript("OnEnter", function(this)
        self:DragButton_OnEnter(this);
    end);
    WatchFrameHeader:SetScript("OnLeave", function(this)
        self:DragButton_OnLeave(this);
    end);

    self:UpdatePOIs();
    self:QuestUpdate();
end

function D:OnDisable()
    -- self:UnregisterEvent("QUEST_COMPLETE");
    self:UnregisterEvent("QUEST_PROGRESS");
    self:UnregisterEvent("UI_INFO_MESSAGE");
    self:UnregisterEvent("CHAT_MSG_SYSTEM");
    FastQuest_Jieguan(WatchFrame, false);
    dwSetCVar("DuowanConfig", "isWatchFrameJG", 0);
    --self:Unhook("AddQuestWatch");
    --self:Unhook("RemoveQuestWatch");
end

function D:DragButton_OnEnter(self)
    --GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent);
    GameTooltip:SetText(FASTQUEST_TITLE, 1, 1, 1);
    --GameTooltip:AddLine(FASTQUEST_LOCK_TOGGLE_TIP1);
    GameTooltip:AddLine(FASTQUEST_LOCK_TOGGLE_TIP2);
    GameTooltip:Show();
end

function D:DragButton_OnLeave(self)
    GameTooltip:Hide();
end

function D:AutoCollapse_Toggle(switch)
    if (switch) then
        self:SecureHook("WatchFrame_Collapse");
        self:SecureHook("WatchFrame_Expand");
        self:RegisterEvent("PLAYER_ENTERING_WORLD");
    else
        self:UnregisterEvent("PLAYER_ENTERING_WORLD");
        self:Unhook("WatchFrame_Collapse");
        self:Unhook("WatchFrame_Expand");
    end
end

--add 0726 追踪任务的收缩
function D:PLAYER_ENTERING_WORLD()
    local inInstance = IsInInstance();
    if inInstance then
        if not WatchFrame.collapsed then
            WatchFrame.userCollapsed = true;
            dwSetCVar("QuestMod", "auto_collapsed", 1);
            WatchFrame_Collapse(WatchFrame);
        else
            dwSetCVar("QuestMod", "auto_collapsed", 0);
        end
    else
        local last = dwRawGetCVar("QuestMod", "auto_collapsed", 0);
        if (last == 1 and WatchFrame.userCollapsed) then
            WatchFrame.userCollapsed = false;
            WatchFrame_Expand(WatchFrame);
        end
    end
end

function D:WatchFrame_Collapse(frame)
    if (frame == WatchFrame) then
        dwSetCVar("QuestMod", "last_collapsed", 1);
    end
end

function D:WatchFrame_Expand(frame)
    if (frame == WatchFrame) then
        dwSetCVar("QuestMod", "last_collapsed", 0);
    end
end

-----------------
-- 显示任务等级
function D:QuestLevel_Toggle(switch)
    if (switch) then
        self:RawHook("QuestLogTitleButton_Resize", true);
        self:SetCVar("Level", true);
    else
        self:Unhook("QuestLogTitleButton_Resize");
        self:SetCVar("Level", false);
    end
    SetCVar("colorblindMode", "0");
    ENABLE_COLORBLIND_MODE = "0";
    WatchFrame_Update();
end

function D:AutoComplete_Toggle(switch)
    if (switch) then
        self:SetCVar("AutoComplete", true);
    else
        self:SetCVar("AutoComplete", false);
    end
end

--add 0714
function D:SortDistance_Toggle(switch, module)
    local lastSortType;
    if (switch) then
        lastSortType = WATCHFRAME_SORT_TYPE;
        dwSetCVar(module, "LastSortType", lastSortType);
        WatchFrame_SetSorting(nil, 1);
    else
        lastSortType = dwRawGetCVar(module, "LastSortType", WATCHFRAME_SORT_TYPE);
        WatchFrame_SetSorting(nil, lastSortType);
    end
end

function D:AutoNotify_Toggle(switch)
    if (switch) then
        self:SetCVar("AutoNotify", true);
    else
        self:SetCVar("AutoNotify", false);
    end
end

function D:Detail_Toggle(switch)
    if (switch) then
        self:SetCVar("Detail", true);
    else
        self:SetCVar("Detail", false);
    end
end

function D:AutoAdd_Toggle(switch)
    if (switch) then
        self:SetCVar("AutoAdd", true);
    else
        self:SetCVar("AutoAdd", false);
    end
end

function D:ChangeChannel(name)
    if (self.ChannelMap[name]) then
        self.db.Channel = self.ChannelMap[name];
    end
end

function D:AutoChoice_Toggle(switch)
    if (switch) then
        self:SetCVar("AutoChoice", true);
    else
        self:SetCVar("AutoChoice", false);
    end
end

-------------------------------------------
function D:SetCVar(var, value)
    self.db[var] = value;
end

-----------------
-- 通报任务进度
function D:UI_INFO_MESSAGE(event, message)
    local uQuestText = gsub(message, self.QUEST_TEXT, "%1", 1);
    if (uQuestText ~= message) then
        if (self.db.AutoNotify == true and self.db.Detail == true) then
            self:Notification(message);
        end

        if (self.db.AutoAdd and GetNumQuestWatches() < MAX_WATCHABLE_QUESTS) then
            local questIndex = self:GetQuestID(uQuestText);
            if (questIndex) then
                if (not IsQuestWatched(questIndex)) then
                    self:Watch(questIndex, true);
                end
            end
        end
    else
        self:CheckPatterns(message);
    end
end

function D:CHAT_MSG_SYSTEM(event, message)
    if (message) then
        self:CheckPatterns(message);
    end
end

-----------------
-- 自动任务追踪
function D:GetQuestID(str)
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

function D:Watch(questIndex, auto)
    if (questIndex) then
        if ((IsQuestWatched(questIndex)) and (auto == false)) then
            RemoveQuestWatch(questIndex);
            QuestLog_Update();
            WatchFrame_Update();
        else
            if ((not WatchFrame:IsUserPlaced()) and ArenaEnemyFrames and ArenaEnemyFrames:IsShown()) then
                UIErrorsFrame:AddMessage(OBJECTIVES_WATCH_QUESTS_ARENA, 1.0, 0.1, 0.1, 1.0);
                return;
                -- Check this first though it's less likely, otherwise they could make the frame bigger and be disappointed
            elseif (GetNumQuestWatches() >= MAX_WATCHABLE_QUESTS) then
                UIErrorsFrame:AddMessage(format(QUEST_WATCH_TOO_MANY, MAX_WATCHABLE_QUESTS), 1.0, 0.1, 0.1, 1.0);
                return;
                --elseif ( WatchFrame_GetRemainingSpace() < WatchFrame_GetHeightNeededForQuest(questIndex) ) then
                --	UIErrorsFrame:AddMessage(OBJECTIVES_WATCH_TOO_MANY, 1.0, 0.1, 0.1, 1.0);
                --	return
            end

            AddQuestWatch(questIndex);
            QuestLog_Update();
            WatchFrame_Update();
        end
    end
end

-----------------
-- 自动完成任务
function D:QUEST_PROGRESS()
    if (self.db.AutoComplete) then
        CompleteQuest();
    end
end

function D:CheckPatterns(message)
    if (self.db.AutoNotify) then
        for index, value in pairs(self.TestPatterns) do
            if (string.find(message, value)) then
                self:Notification(message);
                return;
            end
        end
    end
end

function D:Notification(msg, ...)
    local text = L["Quest Process: "] .. format(msg, ...);
    if (self.db.Channel == "SAY") then
        SendChatMessage(text, "SAY");
    elseif (self.db.Channel == "PARTY") then
        if (GetNumPartyMembers() > 0) then
            SendChatMessage(text, "PARTY");
        end
    elseif (self.db.Channel == "RAID") then
        if (GetNumRaidMembers() > 0) then
            SendChatMessage(text, "RAID");
        end
    end
end

function D:ChangeTitle(questLogTitle, questLogTitleText, level, questTag, suggestedGroup, isHeader, isDaily, Watch)
    local ColorTag = "";
    local DifTag = "";
    local LevelTag = "";
    local cQuestLevel = GetQuestDifficultyColor(level);
    local LevelString = "";
    if (questLogTitleText and not isHeader) then
        ColorTag = string.format("|cff%02x%02x%02x", cQuestLevel.r * 255, cQuestLevel.g * 255, cQuestLevel.b * 255);
        if (questTag) then
            if (isDaily) then
                questTag = format(DAILY_QUEST_TAG_TEMPLATE, questTag);
            end
            DifTag = (" (" .. questTag .. ") ");

            if (questTag == LFG_TYPE_DUNGEON) then LevelTag = "d";
            elseif (questTag == RAID) then LevelTag = "r";
            elseif (questTag == PVP) then LevelTag = "p";
            else LevelTag = "+";
            end

        elseif (isDaily) then
            DifTag = (" (" .. DAILY .. ") ");
        end

        LevelString = "[" .. level .. LevelTag .. "] ";

        if (Watch) then
            questLogTitle:SetText(ColorTag .. LevelString .. questLogTitleText .. DifTag);
        else
            if (suggestedGroup > 0) then
                questLogTitle:SetText(ColorTag .. " " .. LevelString .. questLogTitleText .. " (" .. suggestedGroup .. ") ");
            else
                questLogTitle:SetText(ColorTag .. " " .. LevelString .. questLogTitleText .. " ");
            end
        end
    end
end

-----------
-- 谢谢Levelland
function D:GetQuestLevel(index, isLink)
    return select(2, strmatch(isLink and index or GetQuestLink(index) or '', 'quest:(%d+):(%d+)'))
end

function D:GetSafeQuestName(name)
    return name:gsub('%-', '%%-'):gsub('%.', '%%.'):gsub('%?', '%%?')
end

function D:WatchFrame_Update()
    local maxWidth = 0;
    if (self.db.Level) then
        local questIndex = 1;
        local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily, title;
        local numQuestWatches = GetNumQuestWatches();
        for index = 1, numQuestWatches do
            questIndex = GetQuestIndexForWatch(index);
            if (questIndex) then
                questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questIndex);
                title = self:GetSafeQuestName(questLogTitleText);
                local i = 1;
                while i <= #WATCHFRAME_QUESTLINES do
                    local line = WATCHFRAME_QUESTLINES[i].text
                    local text = line:GetText() or ''

                    if strmatch(text, title) then
                        self:ChangeTitle(line, title, level, questTag, suggestedGroup, isHeader, isDaily, true);
                        maxWidth = max(maxWidth, line:GetWidth())
                        break
                    else
                        i = i + 1
                    end
                end
            end
        end
    end
    return 0, maxWidth, 0
end

function D:QuestLogTitleButton_Resize(line)
    local index = line:GetID();
    local questLogTitleText, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(index);

    if level then
        self:ChangeTitle(line, questLogTitleText, level, questTag, suggestedGroup, isHeader, isDaily, true);
    end
    self.hooks.QuestLogTitleButton_Resize(line);
end

-----------------
-- 使任务追踪窗口可以翻页
function D:GetQuestPageButton(index, parent)
    local name = "DuowanQuestPageButton" .. index;
    local button = _G[name];
    if (not button) then
        button = CreateFrame("Button", name, parent, "UIPanelButtonTemplate");
        button:SetWidth(25);
        button:SetHeight(25);
        button:SetText(index);
        button:SetScript("OnClick", function(this)
            self:HideOtherPannel(this.ID or 1);
        end);
    end

    return button;
end

function D:GetQuestPagePannel(index)
    local name, pannel;
    if (index ~= 1) then
        name = "DuowanQuestPagePannel" .. index;
        pannel = _G[name];
        if (not pannel) then
            pannel = CreateFrame("Frame", name, WatchFrame);
            pannel:SetAllPoints(WatchFrameLines);
            pannel:Hide();
        end
    else
        name = "WatchFrameLines";
        pannel = WatchFrameLines;
    end


    self.QuestPannels[index] = pannel;

    return pannel;
end

function D:CreateQuestPageTab()
    -- 创建tab
    local tabFrame = CreateFrame("Frame", "DuowanQuestPageTab", WatchFrameHeader);
    local leftOffset = WatchFrameTitle:GetStringWidth() + 12;
    tabFrame:SetPoint("TOPLEFT", WatchFrameHeader, "TOPLEFT", leftOffset, 0);
    tabFrame:SetPoint("BOTTOMRIGHT", WatchFrameCollapseExpandButton, "BOTTOMLEFT", -10, 0);

    local button, lastButton, pannel;
    for i = 1, 3, 1 do
        -- 标签
        button = self:GetQuestPageButton(i, tabFrame);
        button:ClearAllPoints();
        if (i == 1) then
            button:SetPoint("LEFT", tabFrame, "LEFT", 0, 0);
        else
            button:SetPoint("LEFT", lastButton, "RIGHT", 2, 0);
        end

        button.ID = i;
        lastButton = button;

        -- pannel
        pannel = self:GetQuestPagePannel(i);
    end
end

function D:GetVisibleQuestNum()
    return #VISIBLE_WATCHES;
end

function D:GetQuestLine(index)
    local line = self.QuestLines[index];
    if (not line) then
        line = WatchFrame.lineCache:GetFrame();
        self.QuestLines[index] = line;
    end

    line:Reset();
    return line;
end

function D:HideAllQuestLines()
    for index, line in pairs(self.QuestLines) do
        line:Hide();
    end
end

function D:HideOtherPannel(index)
    for i = 1, 3 do
        if (i ~= index) then
            self.QuestPannels[i]:Hide();
        end
    end

    self.QuestPannels[index]:Show();
end

function D:UpdateQuestWatch(pageID, index)
    if (pageID == 1) then
        WatchFrameLines:Show();
    end
end

-----------------
-- 使任务追踪窗口能拖动
function D:MoveableWatchFrame()
    WatchFrameHeader:RegisterForDrag("LeftButton");
    WatchFrameHeader:SetScript("OnDragStart", function(self)
        if (IsShiftKeyDown() and not self.isMoving) then
            if (not isJG) then
                dwSetCVar("DuowanConfig", "isWatchFrameJG", 1);
                FastQuest_Jieguan(WatchFrame, true);
            end
            WatchFrame:SetMovable(true)
            WatchFrame:StartMoving();
            self.isMoving = true;
        end
    end);
    WatchFrameHeader:SetScript("OnDragStop", function(self)
        if (self.isMoving) then
            WatchFrame:StopMovingOrSizing();
            self.isMoving = false;
            --UIParent_ManageFramePositions();
        end
    end);
    local checkbox = CreateFrame("CheckButton", "DuowanQuestPointerCheck", WatchFrameHeader, "UICheckButtonTemplate");
    checkbox:SetWidth(25);
    checkbox:SetHeight(25);
    checkbox:SetAlpha(0.6);
    checkbox:SetPoint("RIGHT", WatchFrameHeader, "LEFT", 0, 0);
    checkbox:SetScript("OnClick", function(this, button)
        local value = this:GetChecked();
        if (value == 1) then
            self:ToggleMinimapPointer(true);
            dwSetCVar("QuestMod", "QuestPointer", 1);
        else
            self:ToggleMinimapPointer(false);
            dwSetCVar("QuestMod", "QuestPointer", 0);
        end
    end);
    self.UpdateCheckBox = function(self)
        local value = dwRawGetCVar("QuestMod", "QuestPointer", 1);
        if (value == 1) then
            checkbox:SetChecked(true);
            self:ToggleMinimapPointer(true);
        else
            checkbox:SetChecked(false);
            self:ToggleMinimapPointer(false);
        end
    end
    checkbox:SetScript("OnShow", function(this, button)
        self:UpdateCheckBox();
    end);
    checkbox:SetScript("OnEnter", function(this, button)
        GameTooltip:SetOwner(this, "ANCHOR_RIGHT");
        local value = dwRawGetCVar("QuestMod", "QuestPointer", 1);
        if (value == 1) then
            GameTooltip:SetText(L["隐藏小地图任务标记"]);
        else
            GameTooltip:SetText(L["显示小地图任务标记"]);
        end
        GameTooltip:Show();
    end);
    checkbox:SetScript("OnLeave", function(this, button)
        GameTooltip:Hide();
    end);

    self:UpdateCheckBox();
end

-----------------
-- QuestPointer
function D:ToggleMinimapPointer(switch)
    if (switch) then
        self.db.QuestPointer = true;
    else
        self.db.QuestPointer = false;
        Astrolabe:RemoveAllMinimapIcons();
    end

    self:UpdatePOIs();
end

function D:ToggleWatchOnly(switch)
    if (switch) then
        self.db.watchedOnly = true;
    else
        self.db.watchedOnly = false;
        --Astrolabe:RemoveAllMinimapIcons();
    end

    self:UpdatePOIs();
end

local myname, ns = "QuestPointer", DuowanQuest;
local pois = {}
local POI_OnEnter, POI_OnLeave, POI_OnMouseUp, Arrow_OnUpdate

ns.pois = pois

function ns:ClosestPOI(all)
    local closest, closest_distance, poi_distance
    for k, poi in pairs(ns.pois) do
        if poi.active then
            poi_distance = Astrolabe:GetDistanceToIcon(poi)
            if closest then
                if poi_distance and closest_distance and poi_distance < closest_distance then
                    closest = poi
                    closest_distance = poi_distance
                end
            else
                closest = poi
                closest_distance = poi_distance
            end
        end
    end
    return closest
end

function ns:UpdatePOIs(...)
    if (not self.db.QuestPointer) then
        return;
    end
    self:Debug("UpdatePOIs", ...)
    for id, poi in pairs(pois) do
        Astrolabe:RemoveIconFromMinimap(poi)
        if poi.poiButton then
            poi.poiButton:Hide()
            poi.poiButton:SetParent(Minimap)
            poi.poiButton = nil
        end
        poi.arrow:Hide()
        poi.active = false
    end

    local c, z, x, y = Astrolabe:GetCurrentPlayerPosition()
    if not (c and z and x and y) then
        -- Means that this was probably a change triggered by the world map being
        -- opened and browsed around. Since this is the case, we won't update any POIs for now.
        self:Debug("Skipped UpdatePOIs because of no player position")
        return
    end

    -- Interestingly, even if this isn't called, *some* POIs will show up. Not sure why.
    QuestPOIUpdateIcons()

    local numCompletedQuests = 0
    local numEntries = QuestMapUpdateAllQuests()
    for i = 1, numEntries do
        local questId, questLogIndex = QuestPOIGetQuestIDByVisibleIndex(i)
        local _, posX, posY, objective = QuestPOIGetIconInfo(questId)
        if posX and posY and (IsQuestWatched(questLogIndex) or not self.db.watchedOnly) then
            local title, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily = GetQuestLogTitle(questLogIndex)
            local numObjectives = GetNumQuestLeaderBoards(questLogIndex)
            if isComplete and isComplete < 0 then
                isComplete = false
            elseif numObjectives == 0 then
                isComplete = true
            end
            self.Debug("POI", questId, posX, posY, objective, title, isComplete)

            local poi = pois[i]
            if not poi then
                poi = CreateFrame("Frame", "QuestPointerPOI" .. i, Minimap)
                poi:SetWidth(10)
                poi:SetHeight(10)
                poi:SetScript("OnEnter", POI_OnEnter)
                poi:SetScript("OnLeave", POI_OnLeave)
                poi:SetScript("OnMouseUp", POI_OnMouseUp)
                poi:EnableMouse()

                local arrow = CreateFrame("Frame", nil, poi)
                arrow:SetPoint("CENTER", poi)
                arrow:SetScript("OnUpdate", Arrow_OnUpdate)
                arrow:SetWidth(32)
                arrow:SetHeight(32)

                local arrowtexture = arrow:CreateTexture(nil, "OVERLAY")
                arrowtexture:SetTexture([[Interface\Minimap\ROTATING-MINIMAPGUIDEARROW.tga]])
                arrowtexture:SetAllPoints(arrow)
                arrow.texture = arrowtexture
                arrow.t = 0
                arrow.poi = poi
                arrow:Hide()

                poi.arrow = arrow
            end

            local poiButton
            if isComplete then
                --self:Debug("Making with QUEST_POI_COMPLETE_IN", i)

                poiButton = QuestPOI_DisplayButton("Minimap", QUEST_POI_COMPLETE_IN, i, questId)
                numCompletedQuests = numCompletedQuests + 1
            else
                --self:Debug("Making with QUEST_POI_NUMERIC", i - numCompletedQuests)
                poiButton = QuestPOI_DisplayButton("Minimap", QUEST_POI_NUMERIC, i - numCompletedQuests, questId)
            end
            poiButton:SetPoint("CENTER", poi)
            poiButton:SetScale(self.db.iconScale)
            poiButton:SetParent(poi)
            poiButton:EnableMouse(false)
            poi.poiButton = poiButton

            poi.arrow:SetScale(self.db.arrowScale)

            poi.index = i
            poi.questId = questId
            poi.questLogIndex = questLogIndex
            poi.c = c
            poi.z = z
            poi.x = posX
            poi.y = posY
            poi.title = title
            poi.active = true

            Astrolabe:PlaceIconOnMinimap(poi, c, z, posX, posY)

            pois[i] = poi
        else
            self:Debug("Skipped POI", i, posX, posY)
        end
    end

    self:UpdateEdges()
    self:UpdateGlow()
end

ns.QUEST_POI_UPDATE = ns.UpdatePOIs
ns.ZONE_CHANGED_NEW_AREA = ns.UpdatePOIs

function ns:UpdateGlow()
    if (not self.db.QuestPointer) then
        return;
    end

    for i, poi in pairs(pois) do
        if poi.active then
            -- poi.poiButton.selectionGlow:Hide()
            QuestPOI_DeselectButton(poi.poiButton)
        end
    end
    local closest = self:ClosestPOI()
    if closest then
        -- closest.poiButton.selectionGlow:Show()
        QuestPOI_SelectButton(closest.poiButton)
    end
end

do
    local t = 0
    local f = CreateFrame("Frame")
    f:SetScript("OnUpdate", function(self, elapsed)
        t = t + elapsed
        if t > 3 then -- this doesn't change very often at all; maybe more than 3 seconds?
            t = 0
            ns:UpdateGlow()
        end
    end)
end

do
    local tooltip = CreateFrame("GameTooltip", "QuestPointerTooltip", UIParent, "GameTooltipTemplate")
    function POI_OnEnter(self)
        if UIParent:IsVisible() then
            tooltip:SetParent(UIParent)
        else
            tooltip:SetParent(self)
        end

        tooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")

        local title = GetQuestLogTitle(self.questLogIndex)
        tooltip:AddLine(title)

        tooltip:Show()
    end

    function POI_OnLeave(self)
        tooltip:Hide()
    end

    function POI_OnMouseUp(self)
        WorldMapFrame:Show()
        local frame = _G["WorldMapQuestFrame" .. self.index]
        if not frame then
            return
        end
        WorldMapFrame_SelectQuestFrame(frame)
    end

    local square_half = math.sqrt(0.5)
    local rad_135 = math.rad(135)
    local update_threshold = 0.1
    function Arrow_OnUpdate(self, elapsed)
        self.t = self.t + elapsed
        if self.t < update_threshold then
            return
        end
        self.t = 0

        local angle = Astrolabe:GetDirectionToIcon(self.poi)
        angle = angle + rad_135

        if GetCVar("rotateMinimap") == "1" then
            angle = angle - GetPlayerFacing()
        end

        if angle == self.last_angle then
            return
        end
        self.last_angle = angle

        --rotate the texture
        local sin, cos = math.sin(angle) * square_half, math.cos(angle) * square_half
        self.texture:SetTexCoord(0.5 - sin, 0.5 + cos, 0.5 + cos, 0.5 + sin, 0.5 - cos, 0.5 - sin, 0.5 + sin, 0.5 - cos)
    end
end

function ns:UpdateEdges()
    if (not self.db.QuestPointer) then
        return;
    end

    for id, poi in pairs(pois) do
        if poi.active then
            if Astrolabe:IsIconOnEdge(poi) then
                if self.db.useArrows then
                    poi.poiButton:Hide()
                    poi.arrow:Show()
                    poi.arrow:SetAlpha(ns.db.arrowAlpha)
                else
                    poi.poiButton:Show()
                    poi.arrow:Hide()
                    poi.poiButton:SetAlpha(ns.db.iconAlpha * (ns.db.fadeEdge and 0.6 or 1))
                end
            else
                poi.poiButton:Show()
                poi.arrow:Hide()
                poi.poiButton:SetAlpha(ns.db.iconAlpha)
            end
        end
    end
end

-- This would be needed for switching to a different look when icons are on the edge of the minimap.
Astrolabe:Register_OnEdgeChanged_Callback(function(...)
    ns:UpdateEdges()
end, "QuestPointer")

------------------------
-- 任务鼠标提示
local match, tonumber, wipe, floor = strmatch, tonumber, wipe, math.floor;

local quests = {}

local mosters = {}

local qobs = {}
local qobs_title = {}
local qobs_have = {}
local qobs_need = {}
local qobs_perc = setmetatable({}, {
    __index = function(t, i)
        local perc = qobs_have[i] / qobs_need[i]
        t[i] = perc
        return perc
    end
})

local items = {}
local items_have = {}
local items_need = {}
local items_title = {}

--taken from the wonderful LibQuixote by kemayo
local objects_pattern = "^" .. QUEST_OBJECTS_FOUND:gsub("(%%.)", "(.+)") .. "$" --QUEST_OBJECTS_FOUND = "%s: %d/%d"
local faction_pattern = "^" .. QUEST_FACTION_NEEDED:gsub("(%%.)", "(.+)") .. "$" --QUEST_FACTION_NEEDED = "%s: %s / %s"
local players_pattern = "^" .. QUEST_PLAYERS_KILLED:gsub("(%%.)", "(.+)") .. "$" --QUEST_PLAYERS_KILLED = "Players slain: %d/%d"
local monsters_pattern = "^" .. QUEST_MONSTERS_KILLED:gsub("(%%.)", "(.+)") .. "$" --QUEST_MONSTERS_KILLED = "%s slain: %d/%d"

local factions = {
    [FACTION_STANDING_LABEL1] = 1, --"Hated"
    [FACTION_STANDING_LABEL1_FEMALE] = 1, --"Hated"
    [FACTION_STANDING_LABEL2] = 2, --"Hostile"
    [FACTION_STANDING_LABEL2_FEMALE] = 2, --"Hostile"
    [FACTION_STANDING_LABEL3] = 3, --"Unfriendly"
    [FACTION_STANDING_LABEL3_FEMALE] = 3, --"Unfriendly"
    [FACTION_STANDING_LABEL4] = 4, --"Neutral"
    [FACTION_STANDING_LABEL4_FEMALE] = 4, --"Neutral"
    [FACTION_STANDING_LABEL5] = 5, --"Friendly"
    [FACTION_STANDING_LABEL5_FEMALE] = 5, --"Friendly"
    [FACTION_STANDING_LABEL6] = 6, --"Honored"
    [FACTION_STANDING_LABEL6_FEMALE] = 6, --"Honored"
    [FACTION_STANDING_LABEL7] = 7, --"Revered"
    [FACTION_STANDING_LABEL7_FEMALE] = 7, --"Revered"
    [FACTION_STANDING_LABEL8] = 8, --"Exalted"
    [FACTION_STANDING_LABEL8_FEMALE] = 8 --"Exalted"
}

local function Colour(perc) -- for colouring in, 0 == red, 0.5 == yellow, 1 == green
    if perc <= 0.5 then
        return 1, perc * 2, 0
    end
    return 2 - perc * 2, 1, 0
end


local qtitle, header, need, have, perc, desc, qtype, name, iscomp, _

function D:QuestUpdate()
    wipe(quests)
    wipe(qobs); wipe(qobs_title); wipe(qobs_have); wipe(qobs_need); wipe(qobs_perc)
    wipe(items); wipe(items_title); wipe(items_have); wipe(items_need); wipe(mosters)
    local itemsize = 0
    local qobsize = 0
    for questid = 1, GetNumQuestLogEntries() do
        qtitle, _, _, _, header, _, iscomp = GetQuestLogTitle(questid)
        if not header then
            quests[qtitle] = true;
            for questobnum = 1, GetNumQuestLeaderBoards(questid) do
                desc, qtype = GetQuestLogLeaderBoard(questobnum, questid);

                qobsize = qobsize + 1;

                if qtype == "monster" then
                    name, have, need = match(desc, monsters_pattern);
                    if not have or not need then
                        name, have, need = match(desc, objects_pattern);
                    end
                    have, need = tonumber(have), tonumber(need);
                    mosters[name] = qobsize;
                elseif qtype == "item" or qtype == "object" then
                    name, have, need = match(desc, objects_pattern)
                    itemsize = itemsize + 1
                    if items[name] then
                        items[name] = items[name] * 1000 + itemsize
                    else
                        items[name] = itemsize
                    end
                    have, need = tonumber(have), tonumber(need)
                    items_have[itemsize] = have
                    items_need[itemsize] = need
                    items_title[itemsize] = qtitle
                elseif qtype == "reputation" then
                    name, have, need = match(desc, faction_pattern)
                    qobs_perc[qobsize] = factions[have] / factions[need]
                elseif qtype == "player" then
                    name, have, need = match(desc, players_pattern)
                    have, need = tonumber(have), tonumber(need)
                    mosters[name] = qobsize;
                else
                    have, need = iscomp and 1 or 0, 1
                end

                desc = " - " .. desc
                if qobs[desc] then
                    qobs[desc] = qobs[desc] * 1000 + qobsize
                else
                    qobs[desc] = qobsize
                end
                qobs_have[qobsize] = have -- 已有
                qobs_need[qobsize] = need -- 需要
                qobs_title[qobsize] = qtitle -- 任务名
            end
        end
    end

    self:UpdatePOIs();
end

local leftlines = setmetatable({ [1] = true }, {
    __index = function(t, i)
        local f = _G["GameTooltipTextLeft" .. i]
        t[i] = f
        return f
    end
})
local rightlines = setmetatable({ [1] = true }, {
    __index = function(t, i)
        local f = _G["GameTooltipTextRight" .. i]
        t[i] = f
        return f
    end
})

local origshow, origsetunit
local left, right, left1, right1, left2, right2, r, g, b
local function ChangeQuestText(self)
    local quest;
    local numlines = self:NumLines()
    local i = 1 --start at 2 because 1 can never be a quest objective
    while i < numlines do
        i = i + 1
        left = leftlines[i]
        text = left:GetText()

        if quests[text] then
            quest = true;
        end
    end

    if (not quest and UnitExists("mouseover")) then
        local name = UnitName("mouseover");
        if (mosters[name]) then
            local qID = mosters[name];
            local title = qobs_title[qID];
            local have = qobs_have[qID];
            local need = qobs_need[qID];

            self:AddLine(title, 1, 0.87, 0);
            self:AddLine(format("  - %s: %d/%d", name, have, need), 1, 1, 1);
            self:Show();
        end
    end
end

local function OnTooltipSetUnit(self, ...)
    ChangeQuestText(self);
end

GameTooltip:HookScript("OnTooltipSetUnit", OnTooltipSetUnit)

if GameTooltip:IsShown() then --incase the tooltip is hovering over something on reload
    if GameTooltip:GetItem() then
        local id = items[GameTooltip:GetItem()]
        if id then
            MultiItems(GameTooltip, id)
        end
    else
        ChangeQuestText(GameTooltip)
    end
    GameTooltip:Show()
end


----------------------------
-- 自动选择最高价值的奖励
function DuowanQuest:FormatGoldText(money)
    local gold = floor(money / 10000);
    local silver = floor((money - gold * 10000) / 100);
    local copper = mod(money, 100);

    if (gold > 0) then
        return format(GOLD_AMOUNT_TEXTURE .. " " .. SILVER_AMOUNT_TEXTURE .. " " .. COPPER_AMOUNT_TEXTURE, gold, 0, 0, silver, 0, 0, copper, 0, 0);
    elseif (silver > 0) then
        return format(SILVER_AMOUNT_TEXTURE .. " " .. COPPER_AMOUNT_TEXTURE, silver, 0, 0, copper, 0, 0);
    else
        return format(COPPER_AMOUNT_TEXTURE, copper, 0, 0);
    end
end

--[[
local EquipLocMapId = {
    "INVTYPE_AMMO"			= 0,
    "INVTYPE_HEAD"			= 1,
    "INVTYPE_NECK"			= 2,
    "INVTYPE_SHOULDER"		= 3,
    "INVTYPE_BODY"			= 4,
    "INVTYPE_CHEST"			= 5,
    "INVTYPE_ROBE"			= 5,
    "INVTYPE_WAIST"			= 6,
    "INVTYPE_LEGS"			= 7,
    "INVTYPE_FEET"				= 8,
    "INVTYPE_WRIST"			= 9,
    "INVTYPE_HAND"			= 10,
    "INVTYPE_FINGER"			= {11,12},
    "INVTYPE_TRINKET"			= {13,14},
    "INVTYPE_CLOAK"			= 15,
    "INVTYPE_WEAPON"			= {16,17},
    "INVTYPE_SHIELD"			= 17,
    "INVTYPE_2HWEAPON"		= 16,
    "INVTYPE_WEAPONMAINHAND"	= 16,
    "INVTYPE_WEAPONOFFHAND"	= 17,
    "INVTYPE_HOLDABLE"		= 17,
    "INVTYPE_RANGED"			= 18,
    "INVTYPE_THROWN"			= 18,
    "INVTYPE_RANGEDRIGHT"		= 18,
    "INVTYPE_RELIC"			= 18,
    "INVTYPE_TABARD"			= 19,
};

-- 武器怎么用GS来判定?
function DuowanQuest:GetHighGearScore(itemLink)
    if (not GearScore_GetItemScore) then return end

    local iGS = GearScore_GetItemScore(itemLink);
    local itemEquipLoc = select(9, GetItemInfo(itemLink));
    local
end
]]
function DuowanQuest:QUEST_COMPLETE(event, ...)
    -- 自动完成任务
    if (self.db.AutoComplete and GetNumQuestChoices() == 0) then
        GetQuestReward(QuestFrameRewardPanel.itemChoice);
    end

    local rewards = GetNumQuestChoices();
    local high_gold, high_link, high_id = 0, 0, 0;
    local high_gs = nil;
    local choice = false;

    if (rewards > 0) then
        for i = 1, rewards do
            local link = GetQuestItemLink("choice", i);
            if (link) then
                local _, _, rarity, _, _, _, _, _, _, _, money = GetItemInfo(link);
                --local name, texture, numItems, quality, isUsable = GetQuestItemInfo("choice", i);
                --if (isUsable and GearScore_GetItemScore) then	-- 假设未越级完成任务

                --end
                if (money >= high_gold) then
                    high_gold = money;
                    high_link = link;
                    high_id = i;
                    -- 自动选择: 白色和绿色自动选择, 蓝色及紫色以上不自动选择
                    if (rarity >= 1 and rarity < 3) then
                        choice = true;
                    else
                        choice = false;
                    end
                end
            end
        end
    end

    if (high_gold > 0) then -- L["WoWBox Choice GS"]
        goldtext = self:FormatGoldText(high_gold);
        QuestInfoItemChooseText:SetText(L["WoWBox Choice"] .. "\n - " .. high_link .. "    " .. goldtext .. "\n\n" .. REWARD_CHOOSE);
        if (self.db.AutoChoice and choice) then
            itemframe = _G["QuestInfoItem" .. high_id];
            QuestInfoFrame.itemChoice = high_id;
            QuestInfoItemHighlight:SetPoint("TOPLEFT", itemframe, "TOPLEFT", -8, 7);
            QuestInfoItemHighlight:Show();
        end
    end
end