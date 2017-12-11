local DWChat = LibStub('AceAddon-3.0'):GetAddon('DuowanChat')
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanChat")
local MODNAME = "CHATFRAME"
local DWChatFrame = DWChat:NewModule(MODNAME, "AceEvent-3.0")
local DWC_NUM_TAB=8
local chatchannelframe={}
local buttonTemplate
local db
local prvBtn
local defaults = {
	profile = {
		enablechatchannel=false,
		enablechatchannelmove=false
	}
}

local function DWC_ChannelShortText(index)
	local channelNum, channelName = GetChannelName(index);

	if (channelNum ~= 0) then
		if (strfind(channelName, L["General"])) then
			return L["GeneralShort"];
		elseif (strfind(channelName, L["Trade"])) then
			return L["TradeShort"];
		elseif (strfind(channelName, L["LFG"])) then
			return L["ShortLFG"];
		else
			return strsub(channelName,1,1);
		end
	end
end
local short = DWC_ChannelShortText;

local function DWC_ShowChannel(index)
	local channelNum, channelName = GetChannelName(index);
	if (channelNum ~= 0 and (strfind(channelName, L["General"]) or strfind(channelName, L["Trade"]) or strfind(channelName, L["LFG"]))) then
		return true;
	else
		return false;
	end
end

local DWC_TABS={
	{text=function() return short(1) end, chatType="CHANNEL1", show=function() return DWC_ShowChannel(1) end, index=1},
	{text=function() return short(2) end, chatType="CHANNEL2", show=function() return DWC_ShowChannel(2) end, index=2},
	{text=function() return short(3) end, chatType="CHANNEL3", show=function() return DWC_ShowChannel(3) end,  index=3},
	{text=function() return short(4) end, chatType="CHANNEL4", show=function() return DWC_ShowChannel(4) end,  index=4},
	{text=function() return L["Say"] end, chatType="SAY", show=function() return true end,  index=0},
	{text=function() return L["PartyShort"] end, chatType="PARTY", show=function() return true end,  index=0},
	{text=function() return L["RaidShort"] end, chatType="RAID", show=function() return true end,  index=0},
	{text=function() return L["BattleGroundShort"] end, chatType="BATTLEGROUND", show=function() return true end,  index=0},
	{text=function() return L["GuildShort"] end, chatType="GUILD", show=function() return IsInGuild() end,  index=0},
	{text=function() return L["YellShort"] end, chatType="YELL", show=function() return true end,  index=0},
	{text=function() return L["WhisperToShort"] end, chatType="WHISPER", show=function() return true end,  index=0},
	{text=function() return L["OfficerShort"] end, chatType="OFFICER", show=function() return CanEditOfficerNote() end,  index=0},
}

local optGetter, optSetter
do
	local mod = DWChatFrame
	function optGetter(info)
		local key = info[#info]
		return db[key]
	end
	function optSetter(info, value)
		local key = info[#info] db[key] = value
		mod:Refresh()
	end
end

local options
local getOptions=function()
	if not options then
		options={
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
					get = function()
						return DWChat:GetModuleEnabled(MODNAME)
					end,
					set = function(info, value)
						DWChat:SetModuleEnabled(MODNAME, value)
					end,
					width = full,
				},
			},
		}
	end
	return options
end

function DWC_SetChatType(chatType, index)
	local chatFrame = SELECTED_DOCK_FRAME or DEFAULT_CHAT_FRAME;
	local text = "";
	if (string.find(chatType, "CHANNEL")) then
		chatFrame.editBox:Show();
		if (chatFrame.editBox:GetAttribute("chatType") == "CHANNEL") and (chatFrame.editBox:GetAttribute("channelTarget") == index) then
			ChatFrame_OpenChat("", chatFrame);
		else
			chatFrame.editBox:SetAttribute("chatType", "CHANNEL");
			chatFrame.editBox:SetAttribute("channelTarget", index)
			ChatEdit_UpdateHeader(chatFrame.editBox);
		end
	else
		if (chatType == "WHISPER") then
			text = "/w ";
			ChatFrame_ReplyTell(chatFrame);
			if (UnitExists("target") and UnitIsFriend("target", "player") and UnitIsPlayer("target")) then
				text = text .. UnitName("target");
			end

			ChatFrame_OpenChat(text, chatFrame);
		else
			if (not chatFrame.editBox:IsVisible()) then
				ChatFrame_OpenChat("", chatFrame);
			end
			-- ChatFrame_OpenChat("", chatFrame);
			text = chatFrame.editBox:GetText();
			text = string.gsub(text, "^/[Ww] ", "");
			chatFrame.editBox:SetText(text);
			chatFrame.editBox:SetAttribute("chatType", chatType);
			ChatEdit_UpdateHeader(chatFrame.editBox);
		end
	end
end

local function createChatTab(texfunc, chatType, showfunc, index, id)
	local chatTab=_G["DWCChatTab"..id]
	if not chatTab then
		chatTab=CreateFrame("Button","DWCChatTab"..id,UIParent,"DWCChatTabTemplate")
	end

	chatTab.chatType = chatType
	chatTab.text= texfunc()
	chatTab.index = index
	_G[chatTab:GetName().."Text"]:SetText(chatTab.text)
	if (showfunc()) then
		if (not prvBtn) then
			chatTab:SetPoint("LEFT",_G.DWCIconFrameCalloutButton,"RIGHT",1,0)
		else
			chatTab:SetPoint("LEFT",prvBtn,"RIGHT",1,0)
		end
		prvBtn = chatTab
		chatTab:Show()
		return chatTab
	else
		chatTab:Hide()
		return false
	end
end

local function createChatRollFrame(text, index, id)
	local chatTab=_G["DWCChatTab"..id];
	if not chatTab then
		chatTab=CreateFrame("Button","DWCChatTab"..id,UIParent,"DWCChatRollButtonTemplate");
	end

	chatTab:SetAttribute("*type*", "macro");
	chatTab:SetAttribute("macrotext", "/roll");

	chatTab.text = text;
	chatTab.index = index;
	_G[chatTab:GetName().."Text"]:SetText(chatTab.text);
	if (not prvBtn) then
		chatTab:SetPoint("LEFT",_G.DWCIconFrameCalloutButton,"RIGHT",1,0);
	else
		chatTab:SetPoint("LEFT",prvBtn,"RIGHT",1,0);
	end
	prvBtn = chatTab;
	chatTab:Show();
	return chatTab;
end

function DWChatFrame:OnInitialize()
	self.db = DWChat.db:RegisterNamespace(MODNAME, defaults)
	db = self.db.profile
	self:SetEnabledState(DWChat:GetModuleEnabled(MODNAME))
	DWChat:RegisterModuleOptions(MODNAME, getOptions, L["ChatFrame"])
end

function DWChatFrame:Refresh()
	chatchannelframe={}
	prvBtn = nil;
	local id = 0;
	for i, v in ipairs(DWC_TABS) do
		local tab = createChatTab( v.text, v.chatType, v.show, v.index, i);
		if (tab) then
			tinsert(chatchannelframe, tab);
		end
		id = i + 1;
	end

	local rollframe = createChatRollFrame(L["R"], 0, id);
	if (rollframe) then
		tinsert(chatchannelframe, rollframe);
	end
end

function DWChatFrame:UpdateChatBar(event)
	self:Refresh()
end

function DWChatFrame:OnEnable()
	self:Refresh()
	local _point,rel,relp,xo,yo=_G["ChatFrameEditBox"]:GetPoint()
	_G["ChatFrameEditBox"]:SetPoint(_point,rel,relp,xo,yo-28)
	DWCChatFrame:Show()
	self:RegisterEvent("UPDATE_WORLD_STATES", "UpdateChatBar");
	self:RegisterEvent("CHAT_MSG_CHANNEL_NOTICE", "UpdateChatBar");
	self:RegisterEvent("PLAYER_GUILD_UPDATE", "UpdateChatBar");
end

function DWChatFrame:OnDisable()
	self:UnregisterEvent("UPDATE_WORLD_STATES");
	self:UnregisterEvent("CHAT_MSG_CHANNEL_NOTICE");
	self:UnregisterEvent("PLAYER_GUILD_UPDATE");
	local _point,rel,relp,xo,yo=_G["ChatFrameEditBox"]:GetPoint()
	_G["ChatFrameEditBox"]:SetPoint(_point,rel,relp,xo,yo+28)
	for k, v in pairs(chatchannelframe) do
		v:ClearAllPoints()
		v:Hide()
	end
end