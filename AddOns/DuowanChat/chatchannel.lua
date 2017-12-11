local DWChat = LibStub('AceAddon-3.0'):GetAddon('DuowanChat')
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanChat")
local MODNAME = "CHATCHANNEL";
local ChatChannel = DWChat:NewModule(MODNAME, "AceEvent-3.0", "AceHook-3.0")
local org_FCF_Close;
local db;
local defaults = {
    profile = {
        enablechatchannel=false,
    },
}
local TABTYPE_CHATCHANNEL = L["Chat Channel"];
ChannelType={
    [TABTYPE_CHATCHANNEL]={
        "WHISPER",
        "GUILD",
        "GUILD_OFFICER",
        "GUILD_ACHIEVEMENT",
        "RAID",
        "RAID_LEADER",
        "RAID_WARNING",
        "BATTLEGROUND",
        "BATTLEGROUND_LEADER",
        "PARTY",
        "PARTY_LEADER",
        "BG_HORDE",
        "BG_ALLIANCE",
        "BG_NEUTRAL",
        "SAY",
        "YELL",
    },
};

function ChatChannel:OnInitialize()
    org_FCF_Close = FCF_Close;
    self.db = DWChat.db:RegisterNamespace(MODNAME, defaults)
    db = self.db.profile
    self:SetEnabledState(DWChat:GetModuleEnabled(MODNAME))
end

function ChatChannel:CloseChat(pageID)
    local i=1;
    local chatFrame,curTab;
    curTab=0;
    for i=1,NUM_CHAT_WINDOWS+1 do
        tmp =  _G["ChatFrame"..i];
        if(tmp)then
            if(pageID == _G["ChatFrame"..i.."Tab"]:GetText())then
                chatFrame = tmp;
                org_FCF_Close(tmp);
            end
        end
    end

    if(chatFrame)then
        chatFrame.isInitialized = 0;
        FCF_SetTabPosition(chatFrame, 0);
        FCF_SetChatWindowFontSize(nil, chatFrame, 14);
        FCF_SetWindowName(chatFrame, "");
        FCF_SetWindowColor(chatFrame, DEFAULT_CHATFRAME_COLOR.r, DEFAULT_CHATFRAME_COLOR.g, DEFAULT_CHATFRAME_COLOR.b);
        FCF_SetWindowAlpha(chatFrame, DEFAULT_CHATFRAME_ALPHA);
        ChatFrame_RemoveAllChannels(chatFrame);
        ChatFrame_RemoveAllMessageGroups(chatFrame);
        FCF_UnDockFrame(chatFrame);
        UIParent_ManageFramePositions();
        HideUIPanel(chatFrame);
        _G[chatFrame:GetName().."Tab"]:Hide();
    end
end

local function ChatFrame_FindPage(pageID)
    local i=1;
    local curFrame,curTab,tmp;
    curTab=nil;
    curFrame=nil;
    for i=1,NUM_CHAT_WINDOWS+1 do
        tmp =  _G["ChatFrame"..i];
        if(tmp)then
            if(pageID == _G["ChatFrame"..i.."Tab"]:GetText())then
                curTab = getglobal("ChatFrame"..i.."Tab");
                curFrame = getglobal("ChatFrame"..i);
                break;
            end
        end
    end
    return curFrame, curTab,i;
end

local function FlashChannel(chatFrame, event, message, ...)
    local tab = getglobal(chatFrame:GetName().."Tab");
    local channelid;
    channelid = ChannelType[tab:GetText()];
    if(channelid)then
        chatFrame.tellTimer = GetTime() + CHAT_TELL_ALERT_TIME;
        FCF_FlashTab(chatFrame);
    end
end

function ChatChannel:CreateChat(chatType)
    local v,aa,bb,cc,xx,yy,tname,curFrame,curTab,i;
    curFrame, curTab, i = ChatFrame_FindPage(chatType);
    if(curFrame and curTab)then
        self:CloseChat(chatType);
        curFrame=nil;
        curTab=nil;
    end
    if(not ChatFrame1)then
        return;
    end

    if(not curTab)then
        FCF_OpenNewWindow(chatType);
        curFrame, curTab = ChatFrame_FindPage(chatType);
    end
    if(curFrame==nil)then
        return;
    end

    FCF_DockUpdate();

    ChatFrame_RemoveAllChannels(curFrame);
    ChatFrame_RemoveAllMessageGroups(curFrame);
    for _, t in pairs(ChannelType[chatType]) do
        ChatFrame_AddMessageGroup(curFrame, t);
        if (ChatTypeGroup[t] and type(ChatTypeGroup[t]) == "table") then
            for _, tname in pairs(ChatTypeGroup[t]) do
                ChatFrame_AddMessageEventFilter(tname, FlashChannel);
            end
        end
    end
    FCF_DockFrame(curFrame, FCF_GetNumActiveChatFrames(), true);
    FCF_SelectDockFrame(ChatFrame1);
end

function ChatChannel:SetPage(pageID, show)
    if(show)then
        self:CreateChat(pageID);
    else
        self:CloseChat(pageID);
    end
end

function ChatChannel:FCF_ResetChatWindows(...)
    if(db.enablechatchannel)then
        self:CreatePage(TABTYPE_CHATCHANNEL);
    end
end

function ChatChannel:OnEnable()
    db.enablechatchannel = true;
    self:SecureHook("FCF_ResetChatWindows");
    self:SetPage(TABTYPE_CHATCHANNEL, true);
end

function ChatChannel:OnDisable()
    db.enablechatchannel = false;
    self:Unhook("FCF_ResetChatWindows");
    self:SetPage(TABTYPE_CHATCHANNEL, false);
end