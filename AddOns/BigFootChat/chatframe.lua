
local BFChat = LibStub('AceAddon-3.0'):GetAddon('BigFootChat')
local L = LibStub("AceLocale-3.0"):GetLocale("BigFootChat")
local MODNAME = "CHATFRAME"
local BFChatFrame = BFChat:NewModule(MODNAME)
local BFC_NUM_TAB = 7
local chatchannelframe = {}
local buttonTemplate
local db
local defaults = {
    profile = {
        enablechatchannel = false,
        enablechatchannelmove = false
    }
}
local BFC_TABS = {
    { text = L.Say, tabtype = "/s ", texture = "say", tooltip = L["SayTooltip"] },
    { text = L.PartyShort, tabtype = "/p ", texture = "party", tooltip = L["PartyTooltip"] },
    { text = L.RaidShort, tabtype = "/raid ", texture = "raid", tooltip = L["RaidTooltip"] },
    { text = L.BattleGroundShort, tabtype = "/bg ", texture = "battleground", tooltip = L["BGTooltip"] },
    { text = L.GuildShort, tabtype = "/g ", texture = "guild", tooltip = L["GuildTooltip"] },
    { text = L.YellShort, tabtype = "/y ", texture = "yell", tooltip = L["YellTooltip"] },
    { text = L.WhisperToShort, tabtype = "/w ", texture = "whisper", tooltip = L["WhisperTooltip"] },
    { text = L.OfficerShort, tabtype = "/o ", texture = "officer", tooltip = L["OfficerTooltip"] },
    { text = L.BigFootShort, tabtype = nil, texture = nil, tooltip = L["BigFootTooltip"] },
}

local optGetter, optSetter

do
    local mod = BFChatFrame
    function optGetter(info)
        local key = info[#info]
        return db[key]
    end

    function optSetter(info, value)
        local key = info[#info] db[key] = value mod:Refresh()
    end
end

local options
local getOptions = function()
    if not options then options = {
        type = "group",
        name = L["ChatFrame"],
        arg = MODNAME,
        get = optGetter,
        set = optSetter,
        args = {
            intro = {
                order = 1,
                type = "description",
                name = L["Fast chat channel provides you easy access to different channels"],
            },
            enablechatchannel = {
                order = 2,
                type = "toggle",
                name = L["Enable channel buttons"],
                get = function() return BFChat:GetModuleEnabled(MODNAME) end,
                set = function(info, value) BFChat:SetModuleEnabled(MODNAME, value) end,
                width = "full",
            },
            showbfckeybinding = {
                order = 3,
                type = "execute",
                name = L["Show BFC keybinding"],
                func = function()
                    LibStub("AceConfigDialog-3.0"):Close("BigFootChat")
                    BigFoot_LocateKeyBinding("BFCSAY") end,
            },
            enableRollButton = {
                order = 4,
                type = "toggle",
                name = L["Enable roll buttons"],
                get = function() return BFChat.db.profile.enableRollButton end,
                set = function() BFChat:BFChannelRollButton_OnClick() end,
                width = "full",
            },
            enableReportButton = {
                order = 5,
                type = "toggle",
                name = L["Enable report buttons"],
                get = function() return BFChat.db.profile.enableReportButton end,
                set = function() BFChat:BFChannelReportButton_OnClick() end,
                width = "full",
            },
            enableRaidersButton = {
                order = 6,
                type = "toggle",
                name = L["Enable raiders buttons"],
                get = function() return BFChat.db.profile.enableRaidersButton end,
                set = function() BFChat:BFChannelRaidersButton_OnClick() end,
                width = "full",
            },
        }
    }
    end
    return options
end

function getBigFootChannel()
    local channelList = { GetChannelList() }
    local i, channel
    for i, channel in pairs(channelList) do
        if channel == L.BigFootChannel then
            return channelList[i - 1]
        end
    end
    return nil
end

function BFC_SetChatType(_type)
    local editBox = ChatEdit_ChooseBoxForSend(SELECTED_CHAT_FRAME);
    if _type then
        ChatEdit_HandleChatType(editBox, "", _type)
        editBox:Show();
        editBox:SetFocus();
        editBox:SetText(_type);
    else
        local bfChannel = getBigFootChannel()
        if bfChannel then
            bfChannel = "/" .. bfChannel .. " "
            ChatEdit_HandleChatType(editBox, "", bfChannel)
            editBox:Show();
            editBox:SetFocus();
            editBox:SetText(bfChannel);
        end
    end
    ChatEdit_OnSpacePressed(editBox)
end

local function createChatTab(BigFootChat_e6955c64cf39bdb23dc86de1a9ec2117, BigFootChat_6d5e7d83d8358745ae4dcf61d16bd1f3, BigFootChat_9248008bbb6d0ee7ce13f6ee45680051, BigFootChat_6c162b1123a1eb57c1827271b32b6959, index)
    local chatTab = _G["BFCChatTab" .. index]
    if not chatTab then
        chatTab = CreateFrame("Button", "BFCChatTab" .. index, UIParent, "BFCChatTabTemplate")
        chatTab.type = BigFootChat_6d5e7d83d8358745ae4dcf61d16bd1f3
        chatTab.text = BigFootChat_e6955c64cf39bdb23dc86de1a9ec2117
        _G[chatTab:GetName() .. "Text"]:SetText(chatTab.text)
    end
    if (index == 1) then
        chatTab:SetPoint("LEFT", _G.BFCIconFrameCalloutButton, "RIGHT", 1, 0)
    else
        chatTab:SetPoint("LEFT", _G["BFCChatTab" .. (index - 1)], "RIGHT", 1, 0)
    end
    chatTab:Show()
    if BigFootChat_6c162b1123a1eb57c1827271b32b6959 then
        chatTab:SetScript("OnEnter", function()
            BigFoot_ShowNewbieTooltip(BigFootChat_6c162b1123a1eb57c1827271b32b6959)
        end)
        chatTab:SetScript("OnLeave", function()
            BigFoot_HideNewbieTooltip()
        end)
    end
    return chatTab
end

function BFChatFrame:OnInitialize()
    self.db = BFChat.db:RegisterNamespace(MODNAME, defaults)
    db = self.db.profile
    self:SetEnabledState(BFChat:GetModuleEnabled(MODNAME))
    BFChat:RegisterModuleOptions(MODNAME, getOptions, L["ChatFrame"])
end

local function BigFootChat_845d97ef2e392a3ba2b82c5a35958f77()
    for i = 1, 10 do
        local editBox = _G["ChatFrame" .. i .. "EditBox"]
        if editBox then
            editBox:SetPoint("TOPLEFT", _G["ChatFrame" .. i], "BOTTOMLEFT", -5, -24)
            editBox:SetPoint("TOPRIGHT", _G["ChatFrame" .. i], "BOTTOMRIGHT", 5, -24)
        end
    end
end

local function BigFootChat_6a1df3ac0d785e473180af9abe6758ca()
    for i = 1, 10 do
        local editBox = _G["ChatFrame" .. i .. "EditBox"]
        if editBox then
            editBox:SetPoint("TOPLEFT", _G["ChatFrame" .. i], "BOTTOMLEFT", -5, -2)
            editBox:SetPoint("TOPRIGHT", _G["ChatFrame" .. i], "BOTTOMRIGHT", 5, -2)
        end
    end
end

function BFChatFrame:Refresh()
end

function BFChatFrame:OnEnable()
    chatchannelframe = {}
    local i = 0
    for k, v in pairs(BFC_TABS) do
        i = i + 1
        tinsert(chatchannelframe, createChatTab(v.text, v.tabtype, v.texture, v.tooltip, i))
    end
    BigFootChat_845d97ef2e392a3ba2b82c5a35958f77()
    BFCChatFrame:Show()
    self:Refresh()
end

function BFChatFrame:OnDisable()
    BigFootChat_6a1df3ac0d785e473180af9abe6758ca()
    for BigFootChat_63a9ce6f1eeac72ef41293b7d0303335, BigFootChat_8d0644c92128c1ff68223fd74ba63b56 in pairs(chatchannelframe) do
        BigFootChat_8d0644c92128c1ff68223fd74ba63b56:ClearAllPoints()
        BigFootChat_8d0644c92128c1ff68223fd74ba63b56:Hide()
    end
    self:Refresh()
end
