local BFChatAddOn = LibStub('AceAddon-3.0'):NewAddon('BigFootChat', 'AceEvent-3.0', 'AceConsole-3.0', 'AceHook-3.0', "AceTimer-3.0")
local L = LibStub('AceLocale-3.0'):GetLocale('BigFootChat')
local MAX_PLAYER_LEVEL = MAX_PLAYER_LEVEL
local BFC_IconTableMap = {}
local BFC_ReverseIconTableMap = {}
local TalkInterval = 10
local db
local defaults = {
    profile = {
        enabletimestamp = false,
        enableOldChatFrameStyle = true,
        enableclasscolor = true,
        enablelevel = true,
        useshortname = true,
        enablecopy = true,
        enablechatchannelmove = false,
        enableRollButton = true,
        enableReportButton = true,
        enableRaidersButton = false,
        modules = {
            ["ICONFRAME"] = true,
            ["CHATFRAME"] = true,
        },
    }
}
local events = {
    ["CHAT_MSG_YELL"] = true,
    ["CHAT_MSG_BN_WHISPER"] = true,
    ["CHAT_MSG_WHISPER"] = true,
    ["CHAT_MSG_WHISPER_INFORM"] = true,
    ["CHAT_MSG_SAY"] = true,
    ["CHAT_MSG_RAID_LEADER"] = true,
    ["CHAT_MSG_RAID"] = true,
    ["CHAT_MSG_RAID_WARNING"] = true,
    ["CHAT_MSG_PARTY"] = true,
    ["CHAT_MSG_PARTY_LEADER"] = true,
    ["CHAT_MSG_GUILD"] = true,
    ["CHAT_MSG_CHANNEL"] = true,
    ["CHAT_MSG_BATTLEGROUND"] = true,
    ["CHAT_MSG_DND"] = true,
    ["CHAT_MSG_OFFICER"] = true,
}
local ClassColorTable = {
    MAGE = "cff69CCF0",
    DRUID = "cffFF7D0A",
    HUNTER = "cffABD473",
    PALADIN = "cffF58CBA",
    PRIEST = "cffFFFFFF",
    ROGUE = "cffFFF569",
    SHAMAN = "cff2459FF",
    WARLOCK = "cff9482C9",
    WARRIOR = "cffC79C6E",
    DEATHKNIGHT = "cffC41F3B",
}
local DWC_FILENAME = {
    [L.Mage] = "MAGE",
    [L.Druid] = "DRUID",
    [L.Hunter] = "HUNTER",
    [L.Paladin] = "PALADIN",
    [L.Priest] = "PRIEST",
    [L.Rogue] = "ROGUE",
    [L.Shaman] = "SHAMAN",
    [L.Warlock] = "WARLOCK",
    [L.Warrior] = "WARRIOR",
    [L.DeathKnight] = "DEATHKNIGHT",
}
SCCN_Chan_Replace = {
    [L["Guild"]] = L["GuildShort"],
    [L["Raid"]] = L["RaidShort"],
    [L["Party"]] = L["PartyShort"],
    [L["Yell"]] = L["YellShort"],
    [L["BattleGround"]] = L["BattleGroundShort"],
    [L["General"]] = L["GeneralShort"],
    [L["Trade"]] = L["TradeShort"],
    [L["WorldDefense"]] = L["WorldDefenseShort"],
    [L["LocalDefense"]] = L["LocalDefenseShort"],
    [L["LFGChannel"]] = L["LFGChannelShort"],
    [L["BigFootChannel"]] = L["BigFootShort"],
    [L["WhisperTo"]] = L["WhisperToShort"],
    [L["WhisperFrom"]] = L["WhisperFromShort"],
    s
}
local isv3 = select(4, GetBuildInfo()) < 40000
local playerName
local leaveChannelFunc = SlashCmdList["LEAVE"]
local joinChannelFunc = function(channel)
    JoinTemporaryChannel(channel)
    local i = 1;
    while (DEFAULT_CHAT_FRAME.channelList[i]) do
        if not DEFAULT_CHAT_FRAME.channelList[i]:find(L["BigFootChannel"]) then
            i = i + 1;
        else
            DEFAULT_CHAT_FRAME.channelList[i] = channel
            return
        end
    end
    DEFAULT_CHAT_FRAME.channelList[i] = channel
end

StaticPopupDialogs["BFC_COPYTEXT"] = {
    text = L["Press Ctrl-C to Copy the text"],
    hasEditBox = 1,
    maxLetters = 255,
    hasWideEditBox = isv3 and 1,
    button1 = ACCEPT,
    button2 = CANCEL,
    OnAccept = function(self) self:Hide() end,
    OnShow = function(self)
        if not BFChatAddOn.copyTextId then
            return
        end
        local temp = BFC_TextBuffer[tonumber(BFChatAddOn.copyTextId)]
        if isv3 then
            self.wideEditBox:SetText(temp or "");
            self.wideEditBox:HighlightText(0)
        else
            self.editBox:SetText(temp or "");
            self.editBox:HighlightText(0)
        end
    end,
    OnHide = function(self)
        if isv3 then
            self.wideEditBox:SetText("");
        else
            self.editBox:SetText("");
        end
    end,
    EditBoxOnEnterPressed = function(self)
        local parent = self:GetParent();
        parent:Hide();
    end,
    EditBoxOnEscapePressed = function(self)
        self:GetParent():Hide();
    end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1
};

local function getNameInfo(name)
    if not db.storedName or not db.storedName[name] then
        return false
    end
    return unpack(db.storedName[name])
end

local function checkInfo(name)
    if not db.storedName or not db.storedName[name] then
        return false
    end
    local name, class, level, timestamp = unpack(db.storedName[name]);
    if not class then
        return false
    end
    if not level or level == 0 then
        return false
    end
    if level == 70 then
        return true
    end
    if level == 80 then
        return true
    end
    if not timestamp or time() > (timestamp + 3600) then
        return false
    end
    return true
end

local function storeName(name, prof, lvl)
    db.storedName = db.storedName or {}
    db.storedName[name] = { name, prof, lvl, time() }
end

local function generateIconMap()
    for k, v in pairs(BFC_IconTable) do
        BFC_IconTableMap[v[1]] = v[2]
    end
    for k, v in pairs(BFC_IconTable) do
        BFC_ReverseIconTableMap[v[2]] = v[1]
    end
end

local function getTimeStamp()
    local hour = tonumber(string.sub(date("%x %X"), 10, 11));
    local minute = tonumber(string.sub(date("%x %X"), 13, 14));
    local second = tonumber(string.sub(date("%x %X"), 16, 17));
    if (string.len(tostring(hour)) < 2) then
        hour = "0" .. tostring(hour);
    end
    if (string.len(tostring(minute)) < 2) then
        minute = "0" .. tostring(minute);
    end
    local TimeStamp = "[$h:$m]";
    if db.enabletimestampsecond then
        if second < 10 then
            TimeStamp = "[$h:$m:0$s]";
        else
            TimeStamp = "[$h:$m:$s]";
        end
    end
    TimeStamp = string.gsub(TimeStamp, "$h", hour);
    TimeStamp = string.gsub(TimeStamp, "$m", minute);
    TimeStamp = string.gsub(TimeStamp, "$s", second);
    return TimeStamp;
end

local function showTimeStamp(text)
    local TimeStamp = "|cff666666" .. getTimeStamp();
    text = TimeStamp .. "|r " .. text;
    return text
end

local function getpoint(point)
    local point, relPoint, relp, xoff, yoff = unpack(point)
    local relObj = _G[relPoint]
    return point, relObj, relp, xoff, yoff
end

local function setpoint(point, relObj, relp, xoff, yoff)
    return { point, relObj:GetName(), relp, xoff, yoff }
end

local function getCurrentFont()
    local _, font = SELECTED_CHAT_FRAME:GetFont()
    font = floor(font)
    local resIndex = GetCurrentResolution()
    local resolution = select(resIndex, GetScreenResolutions());
    local w, h = string.match(resolution, "(%d+)x(%d+)")
    local myfont = (font * 1.5) * h / 768
    return myfont
end

local function appendItemLink(text, id)
    text = "|cff9de000|Hbfcnamecopyproof:" .. id .. "|hC|h|r" .. text
    return text
end

local function showCopyTimeStamp(text, id)
    text = "|cff9de000|Hbfcnamecopyproof:" .. id .. "|h" .. getTimeStamp() .. "|h|r" .. text
    return text;
end

local function IsBFChannelSysMessage(text)
    if text:find(L["JoinChannel1"]) and text:find(L["BigFootChannel"]) then
        return true
    end
    if text:find(L["LeaveChannel"]) and text:find(L["BigFootChannel"]) then
        return true
    end
    if text:find(L["ModifyChannel"]) and text:find(L["BigFootChannel"]) then
        return true
    end
    if text:find(L["OwnChannel"]) and text:find(L["BigFootChannel"]) then
        return true
    end
    if text:find(L["PasswordChange"]) and text:find(L["BigFootChannel"]) then
        return true
    end
end

local function IsBFChannelMessage(text)
    if text:find(L["BigFootChannel"]) then
        return true
    end
end

function BFC_Print(...)
    local str = ... SELECTED_CHAT_FRAME:AddMessage("|cff00adef[" .. L["BFChat"] .. "]|r" .. str)
end

function BFCChatFrame_SavePos(self)
    local point, rel, relp, xoff, yoff = unpack(self.oripoint)
    db.frameposition = setpoint(point, rel, relp, xoff + self.endx - self.startx, yoff + self.endy - self.starty)
    self:SetPoint(getpoint(db.frameposition))
end

function BFChatAddOn:ParseLocalText(text)
    for tag in string.gmatch(text, "|T([^:]+):%d+|t") do
        if (BFC_ReverseIconTableMap[tag]) then
            text = string.gsub(text, "|T[^:]+:%d+|t", BFC_ReverseIconTableMap[tag], 1);
            return text, true
        end
    end
    return text, false
end

function BFChatAddOn:ParseText(text, font)
    if self.sneak then
        text = text:gsub(sender, replace)
    end
    local fontSize = getCurrentFont()
    for tag in string.gmatch(text, "({[^}]+})") do
        if (BFC_IconTableMap[tag]) then
            text = text:gsub(tag, "|T" .. BFC_IconTableMap[tag] .. ":" .. fontSize .. "|t", 1);
            break
        end
    end
    return text
end

function BFChatAddOn:ReverseParseText(text, font)
    for tag in string.gmatch(text, "|T([^:]+):" .. font .. "|t") do
        if (BFC_ReverseIconTableMap[tag]) then
            text = string.gsub(text, "|T[^:]+:" .. font .. "|t", BFC_ReverseIconTableMap[tag], 1);
        end
    end
    return text
end

local function checkResetPassword(text)
    if text:find(L["OwnChannel"]) and text:find(playerName) then
        SetChannelPassword(BFChatAddOn.nextChannel or L["BigFootChannel"], "")
    end
end

local function getNextChannel(channelName)
    local i = 1
    local cur
    if channelName:find(L["BigFootChannel"]) then
        cur = channelName:match("%d")
        if cur then
            i = tonumber(cur) + 1
        end
        return L["BigFootChannel"] .. i
    end
end

local function S_AddMessage(self, text, r, g, b, id, addToStart)
    if text then
        if IsBFChannelSysMessage(text) then
            checkResetPassword(text)
            return
        end
        if IsBFChannelMessage(text) and db.mute then
            return
        end
    end
    if (addToStart) then
        self:ORG_AddMessage(text, r, g, b, id, addToStart)
        return
    end
    if event and events[event] then
        if this.solColorChatNicks_Name and string.len(this.solColorChatNicks_Name) > 2 and text ~= nil and arg2 ~= nil then
            local outputName = this.solColorChatNicks_Name;
            local level = nil;
            local name, prof, level = getNameInfo(this.solColorChatNicks_Name)
            if (level ~= nil) and db.enablelevel then
                outputName = level .. ":" .. this.solColorChatNicks_Name;
            end
            local color = ClassColorTable[prof]
            if (not color and this.solGUID) then
                local localizedClass, englishClass, localizedRace, englishRace, sex = GetPlayerInfoByGUID(this.solGUID);
                color = ClassColorTable[englishClass];
            end
            if color and db.enableclasscolor then
                text = string.gsub(text, "(.-)" .. this.solColorChatNicks_Name .. "([%]%s].*)", "%1|" .. color .. outputName .. "|r%2", 1);
            else
                text = string.gsub(text, "(.-)" .. this.solColorChatNicks_Name .. "([%]%s].*)", "%1" .. outputName .. "%2", 1);
            end
        end
        this.solColorChatNicks_Name = nil;

        if (db.useshortname) then
            local temp = nil;
            if text then
                if strsub(event, 1, 10) ~= "CHAT_MSG_S" then
                    for k, v in pairs(SCCN_Chan_Replace) do
                        temp = string.gsub(text, " " .. k .. "]", v .. "%]", 1)
                        temp = string.gsub(temp, k .. "]", v .. "%]", 1)
                        temp = string.gsub(temp, k .. "：", v .. "：", 1)
                        temp = string.gsub(temp, "^" .. k, v, 1)
                        if temp ~= text then
                            text = temp;
                            temp = nil;
                            break;
                        end
                    end
                end
            end
        end
        if text then
            text = BFChatAddOn:ParseText(text)
            BFC_TextIndex = (BFC_TextIndex or 0)
            BFC_TextIndex = BFC_TextIndex + 1
            BFC_TextBuffer = BFC_TextBuffer or {}
            BFC_TextBuffer[BFC_TextIndex] = text
            if db.enabletimestamp and db.enablecopy then
                text = showCopyTimeStamp(text, BFC_TextIndex)
            elseif db.enabletimestamp then
                text = showTimeStamp(text)
            elseif db.enablecopy then
                text = appendItemLink(text, BFC_TextIndex)
            end
        end
    end
    if self.ORG_AddMessage then
        self:ORG_AddMessage(text, r, g, b, id, addToStart);
    end
end

local function BFC_ChatFrameHandler_Recover(self, _event, ...)
    event = _event
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = ...
    if (self.ORG_AddMessage) then
        self.AddMessage = self.ORG_AddMessage
    end
    BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
end

local nameCache = {}
local function isUserTalkFast(userName, frame)
    local currentTime = time()
    if not nameCache[userName .. frame:GetName()] then
        return false
    end
    if currentTime - nameCache[userName .. frame:GetName()] > (TalkInterval - 2) then
        return false
    end
    return true
end

local function UpdateUserLastTalkTime(userName, frame)
    nameCache[userName .. frame:GetName()] = time()
end

local function BFC_ChatFrameHandler(self, _event, ...)
    event = _event
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...
    local userName = arg2
    local channelName = arg4
    if (not event or not arg2) then
        BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
        return nil
    end
    if db.enableclasscolor or db.enablelevel then
        this.solColorChatNicks_Name = arg2;
        this.solGUID = arg12;
    end
    if event == "CHAT_MSG_CHANNEL" and channelName:find(L["BigFootChannel"]) and text ~= "" then
        if isUserTalkFast(userName, self) then
            return
        else
            UpdateUserLastTalkTime(userName, self)
        end
    end
    if (not self.ORG_AddMessage) then
        self.ORG_AddMessage = self.AddMessage
        self.AddMessage = S_AddMessage
    end
    BFChatAddOn.hooks['ChatFrame_MessageEventHandler'](self, event, ...)
end

function BFChatAddOn:MaskSystemColoring(flag)
    if not BFCSystemCacheDB then
        BFCSystemCacheDB = {}
    end
    if flag then
        for _chatType, _table in pairs(ChatTypeInfo) do
            BFCSystemCacheDB[_chatType] = _table.colorNameByClass
            _table.colorNameByClass = true
        end
    else
        for _chatType, _isColoring in pairs(BFCSystemCacheDB) do
            ChatTypeInfo[_chatType].colorNameByClass = _isColoring
        end
    end
end

function BFChatAddOn:SetItemRef(link, text, button, chatFrame)
    if not string.find(link, "bfcnamecopyproof") then
        self.hooks['SetItemRef'](link, text, button, chatFrame)
    else
        local id = string.match(link, "%d+", 1)
        self.copyTextId = id
        StaticPopup_Show("BFC_COPYTEXT")
    end
end

function BFChatAddOn:UnhookEvents()
    self:UnregisterAllEvents()
end

function BFChatAddOn:Refresh()
    BFCChatFrame:SetMovable(db.enablechatchannelmove)
    if (db.enablechatchannelmove) then
        SetChatFrameEditBoxOffset(0, 23);
    else
        SetChatFrameEditBoxOffset(0, -23);
    end
    BFChatAddOn:MaskSystemColoring(db.enableclasscolor)
    if db and db.frameposition then
        BFCChatFrame:SetPoint(unpack(db.frameposition))
    else
        BFCChatFrame:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT", -5, -2)
    end
end

function BFChatAddOn:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("BFCDB", defaults, "Default")
    self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
    self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
    self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
    self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE")
    self:RegisterEvent("CHANNEL_PASSWORD_REQUEST")
    UIParent:UnregisterEvent("CHANNEL_PASSWORD_REQUEST")
    SlashCmdList["CHAT_PASSWORD"] = nil
    db = self.db.profile
    realmdb = self.db.realm
    self:SetupOptions()
    generateIconMap()
    playerName = UnitName("player")

    SLASH_BFC1 = "/bfc"
    SlashCmdList["BFC"] = function()
        self:ShowOptions()
    end
end

local function EnterWhisperMode(editbox)
    editbox:SetAttribute("bfwhispermode", "true")
end

local function LeaveWhisperMode(editbox)
    editbox:SetAttribute("bfwhispermode", nil)
end

local function RestoreReplyStatus(editbox, name, val)
    if name == "bfwhispermode" then
        if not editbox.bfChatType then
            editbox.bfChatType = "SAY"
        end
        if not val then
            editbox:SetAttribute("chatType", editbox.bfChatType);
            ChatEdit_UpdateHeader(editbox);
        end
    end
end

local lastTalkTime
local function isTalkFast()
    local currentTime = time()
    if not lastTalkTime then
        return false
    end
    if currentTime - lastTalkTime > TalkInterval then
        return false
    end
    return true
end

local function UpdateLastTalkTime()
    lastTalkTime = time()
end

function BFChatAddOn:EnableOldStyleReply()
    hooksecurefunc("ChatEdit_SendText", function(editBox, ...)
        local type = editBox:GetAttribute("chatType");
        local text = editBox:GetText();
        if (text and type ~= "WHISPER" and type ~= "BN_WHISPER") then
            editBox.bfChatType = type;
        end;
        if type == "CHANNEL" and text and text ~= "" and tonumber(editBox:GetAttribute("channelTarget")) == getBigFootChannel() then
            if isTalkFast() then
                BFC_Print(L["Please Do Not Talk Too Fast"])
                return
            else
                UpdateLastTalkTime()
            end
        end
    end);
    hooksecurefunc("ChatEdit_OnEscapePressed", function(editBox)
        LeaveWhisperMode(editBox)
    end);
    if ChatFrame1EditBox ~= nil then
        ChatFrame1EditBox:SetScript("OnAttributeChanged", function(...)
            if (db.enableOldChatFrameStyle) then
                RestoreReplyStatus(...)
            end
        end)
    end
    hooksecurefunc("ChatFrame_ReplyTell", function(chatFrame)
        local editBox = ChatEdit_ChooseBoxForSend(chatFrame);
        EnterWhisperMode(editBox)
    end);
    hooksecurefunc("ChatFrame_ReplyTell2", function(chatFrame)
        local editBox = ChatEdit_ChooseBoxForSend(chatFrame);
        EnterWhisperMode(editBox)
    end);
end

function BFChatAddOn:IsDisplayChannelOwner()
    local selectIndex = GetSelectedDisplayChannel()
    if selectIndex > 0 then
        local channelName = GetChannelDisplayInfo(selectIndex)
        if channelName:find(L["BigFootChannel"]) then
            return false
        end
    end
    return self.hooks['IsDisplayChannelOwner']()
end

function BFChatAddOn:GetChannelRosterInfo(...)
    local name, owner, moderator, muted, active, enabled = self.hooks['GetChannelRosterInfo'](...)
    local channelIndex = ...
    if GetChannelDisplayInfo(channelIndex):find(L["BigFootChannel"]) then
        owner = nil
        moderator = nil
    end
    return name, owner, moderator, muted, active, enabled
end

function BFChatAddOn:CHAT_MSG_CHANNEL_NOTICE(...)
    local _, message, _, _, _, _, _, _, _, channelName = ...
    if message == "YOU_JOINED" and not channelName:find(L["BigFootChannel"]) then
        self:CancelTimer(self.timer, true)
        self.timer = self:ScheduleTimer(function() joinChannelFunc(L["BigFootChannel"]) end, 2)
    end
end

function BFChatAddOn:CHANNEL_PASSWORD_REQUEST(...)
    local _, channelName = ...
    if channelName:find(L["BigFootChannel"]) then
        self.nextChannel = getNextChannel(channelName)
        joinChannelFunc(self.nextChannel)
    else
        local dialog = StaticPopup_Show("CHAT_CHANNEL_PASSWORD", channelName);
        if (dialog) then
            dialog.data = channelName;
        end
        return;
    end
end

function BFChatAddOn:FCF_FadeInChatFrame(chatFrame)
    BFChannelMuteButton:Show()
    UIFrameFadeIn(BFChannelMuteButton, CHAT_FRAME_FADE_TIME, 0.5, 1);
    if ChannelFilterMuteButton then
        ChannelFilterMuteButton:Show()
        UIFrameFadeIn(ChannelFilterMuteButton, CHAT_FRAME_FADE_TIME, 0.5, 1);
    end
end

function BFChatAddOn:FCF_FadeOutChatFrame(chatFrame)
    UIFrameFadeOut(BFChannelMuteButton, CHAT_FRAME_FADE_OUT_TIME, BFChannelMuteButton:GetAlpha(), 0);
    if ChannelFilterMuteButton then
        UIFrameFadeOut(ChannelFilterMuteButton, CHAT_FRAME_FADE_OUT_TIME, ChannelFilterMuteButton:GetAlpha(), 0);
    end
end

function BFChatAddOn:RegisterEvents()
    self:RegisterEvent("CHAT_MSG_WHISPER", self.OnEvent)
    self:RegisterEvent("CHAT_MSG_YELL", self.OnEvent)
    self:RegisterEvent("CHAT_MSG_SAY", self.OnEvent)
    self:RegisterEvent("PARTY_MEMBERS_CHANGED", self.OnEvent)
    self:RegisterEvent("RAID_ROSTER_UPDATE", self.OnEvent)
    self:RegisterEvent("GUILD_ROSTER_UPDATE", self.OnEvent)
    self:RegisterEvent("FRIENDLIST_UPDATE", self.OnEvent)
    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", self.OnEvent)
    self:RegisterEvent("WHO_LIST_UPDATE", self.WhoListUpdate)
end

function BFChatAddOn:UnregisterEvents()
    self:UnregisterEvent("PARTY_MEMBERS_CHANGED")
    self:UnregisterEvent("RAID_ROSTER_UPDATE")
    self:UnregisterEvent("GUILD_ROSTER_UPDATE")
    self:UnregisterEvent("UNIT_FOCUS")
    self:UnregisterEvent("UNIT_TARGET")
    self:UnregisterEvent("CHAT_MSG_WHISPER")
    self:UnregisterEvent("CHAT_MSG_YELL")
    self:UnregisterEvent("CHAT_MSG_SAY")
    self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT")
    self:UnregisterEvent("WHO_LIST_UPDATE")
    self:UnregisterEvent("FRIENDLIST_UPDATE")
end

function BFChatAddOn:WhoListUpdate()
    if GetNumWhoResults() > 0 then
        local name, _, level, _, _, _, filename = GetWhoInfo(1)
        if not checkInfo(name) then
            storeName(name, filename, level)
        end
    end
    SetWhoToUI(0)
    FriendsFrame:RegisterEvent("WHO_LIST_UPDATE")
end

local function checkMessageSender(message, sender)
    local sendWhoQuery = function(name)
        SetWhoToUI(1)
        FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
        SendWho('n-"' .. name .. '"')
    end
    if (message and sender and strlen(sender) > 0) then
        if checkInfo(sender) then
        else
            sendWhoQuery(sender)
        end
    end
end

function BFChatAddOn.OnEvent(event, message, sender)
    local checkUnitIsStored = function(unit)
        if UnitIsPlayer(unit) then
            local _, filename = UnitClass(unit)
            local name = UnitName(unit)
            local level = UnitLevel(unit)
            if filename and not checkInfo(name) then
                storeName(name, filename, level)
            end
        end
    end
    if string.find(event, "CHAT_MSG") then
        checkMessageSender(message, sender)
    elseif event == "RAID_ROSTER_UPDATE" then
        local num = GetRealNumRaidMembers()
        if num > 0 then
            for i = 1, num, 1 do
                local name, _, _, level, _, fileName = GetRaidRosterInfo(i)
                if fileName and not checkInfo(name) then
                    storeName(name, filename, level)
                end
            end
        end
    elseif event == "PARTY_MEMBERS_CHANGED" then
        local num = GetRealNumPartyMembers()
        if num > 0 then
            local num = GetRealNumPartyMembers()
            for i = 1, num, 1 do
                checkUnitIsStored("party" .. i)
            end
        end
    elseif event == "GUILD_ROSTER_UPDATE" then
        local num = GetNumGuildMembers()
        if num > 0 then
            for i = 1, num, 1 do
                local name, _, _, level, _, _, _, _, _, _, classFileName = GetGuildRosterInfo(i)
                if not checkInfo(name) then
                    storeName(name, classFileName, level)
                end
            end
        end
    elseif event == "FRIENDLIST_UPDATE" then
        local num = GetNumFriends()
        if num > 0 then
            for i = 1, num, 1 do
                local name, level, class = GetFriendInfo(i)
                if class and checkInfo(name) then
                    local classFileName = DWC_FILENAME[class]
                    storeName(name, classFileName, level)
                end
            end
        end
    elseif event == "UNIT_FOCUS" then
        checkUnitIsStored("focus")
    elseif event == "UNIT_TARGET" then
        checkUnitIsStored("target")
    elseif event == "UPDATE_MOUSEOVER_UNIT" then
        checkUnitIsStored("mouseover")
    end
end

function BFChatAddOn:OnEnable()
    ChatFrameEditBox:SetAltArrowKeyMode(false);
    if self:IsHooked('ChatFrame_MessageEventHandler') then
        self:Unhook('ChatFrame_MessageEventHandler')
    end
    self:RawHook('ChatFrame_MessageEventHandler', BFC_ChatFrameHandler, true)
    self:RawHook('SetItemRef', true)
    self:RawHook('IsDisplayChannelOwner', true)
    self:RawHook('GetChannelRosterInfo', true)
    self:RegisterEvents();
    --    self:SecureHook("FCF_FadeInChatFrame")
    --    self:SecureHook("FCF_FadeOutChatFrame")
    self:EnableOldStyleReply()
    BFChannel_RefreshMuteButton()
    if not db.isTempChannel then
        leaveChannelFunc(L["BigFootChannel"])
        db.isTempChannel = true
    end
    UIParent_ManageFramePositions()
end

function BFChatAddOn:OnDisable()
    ChatFrameEditBox:SetAltArrowKeyMode(true);
    if self:IsHooked('ChatFrame_MessageEventHandler') then
        self:Unhook('ChatFrame_MessageEventHandler')
    end
    self:RawHook('ChatFrame_MessageEventHandler', BFC_ChatFrameHandler_Recover, true)
    self:Unhook('SetItemRef');
    self:UnhookEvents()
    self:UnregisterEvents();
end

function BFChatAddOn:GetModuleEnabled(module)
    return db.modules[module]
end

function BFChatAddOn:SetModuleEnabled(module, value)
    local old = db.modules[module]
    db.modules[module] = value
    if old ~= value then
        if value then
            self:EnableModule(module)
        else
            self:DisableModule(module)
        end
    end
end

function BFChannel_RefreshMuteButton()
    if db.mute then
        BFChannelMuteButtonMute:Show()
    else
        BFChannelMuteButtonMute:Hide()
    end
end

function BFChannelMuteButton_OnClick()
    db.mute = not db.mute
    if db.mute then
        BFC_Print(L["BigFoot Channel has been blocked"])
    else
        BFC_Print(L["BigFoot Channel has been unblocked"])
    end
    BFChannel_RefreshMuteButton()
end

function SetChatFrameEditBoxOffset(x, y)
    --    local _point,rel,relp,xo,yo=_G["ChatFrameEditBox"]:GetPoint()
    if ChatFrameEditBox ~= nil then
        local _point, rel, relp, xo, yo = ChatFrameEditBox:GetPoint()
        --        _G["ChatFrameEditBox"]:SetPoint(_point,rel,relp,xo+x,yo+y)
        ChatFrameEditBox:SetPoint(_point, rel, relp, xo + x, yo + y)
    end
end

function ChangeSet()
    hooksecurefunc("UIParent_ManageFramePositions", function()
        if (DEFAULT_CHAT_FRAME:IsUserPlaced()) then
            if (SIMPLE_CHAT ~= "1") then
                return;
            end
        end
        if not BFChatAddOn:GetModule("CHATFRAME"):IsEnabled() then
            return
        end
        local chatOffset = 85;
        if (GetNumShapeshiftForms() > 0 or HasPetUI() or PetHasActionBar()) then
            if (MultiBarBottomLeft:IsShown()) then
                chatOffset = chatOffset + 55;
            else
                chatOffset = chatOffset + 15;
            end
        elseif (MultiBarBottomLeft:IsShown()) then
            chatOffset = chatOffset + 15;
        end
        DEFAULT_CHAT_FRAME:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", 32, chatOffset + 25);
    end)
    hooksecurefunc("ResetChatWindows", function()
        DEFAULT_CHAT_FRAME:SetUserPlaced(false)
    end)
end

function BFChatAddOn:BFChannelRollButton_OnClick()
    self.db.profile.enableRollButton = not self.db.profile.enableRollButton
    if self.db.profile.enableRollButton then
        BFCIconFrameRollButton:Show()
    else
        BFCIconFrameRollButton:Hide()
    end
end

function BFChatAddOn:BFChannelReportButton_OnClick()
    self.db.profile.enableReportButton = not self.db.profile.enableReportButton
    if self.db.profile.enableReportButton then
        BFCIconFrameReportButton:Show()
    else
        BFCIconFrameReportButton:Hide()
    end
end

function BFChatAddOn:BFChannelRaidersButton_OnClick()
    self.db.profile.enableRaidersButton = not self.db.profile.enableRaidersButton
    if GetLocale() == "zhCN" then
        createRaidersFrame();
    end
end

_G.BigFootChat = BFChatAddOn
