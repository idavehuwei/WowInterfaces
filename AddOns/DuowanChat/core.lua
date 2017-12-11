DuowanChat = LibStub('AceAddon-3.0'):NewAddon('DuowanChat', 'AceEvent-3.0', 'AceHook-3.0', 'AceConsole-3.0')
DuowanChat._DEBUG = true
DuowanChat.enable = true;
DuowanChat.cbuttons = {};
DuowanChat.lines = {};
local L = LibStub('AceLocale-3.0'):GetLocale('DuowanChat')
local SCCN_Chan_Replace= {
	[L["Guild"]]=L["GuildShort"],
	[L["Raid"]]=L["RaidShort"],
	[L["Party"]]=L["PartyShort"],
	[L["Yell"]]=L["YellShort"],
	[L["BattleGround"]]=L["BattleGroundShort"],
	[L["General"]]=L["GeneralShort"],
	[L["Trade"]]=L["TradeShort"],
	[L["WorldDefense"]]=L["WorldDefenseShort"],
	[L["WhisperTo"]]=L["WhisperToShort"],
	[L["WhisperFrom"]]=L["WhisperFromShort"],
}

local DWC_ColorTable={
	MAGE="cff69CCF0",
	DRUID="cffFF7D0A",
	HUNTER="cffABD473",
	PALADIN="cffF58CBA",
	PRIEST="cffFFFFFF",
	ROGUE="cffFFF569",
	SHAMAN="cff2459FF",
	WARLOCK="cff9482C9",
	WARRIOR="cffC79C6E",
	DEATHKNIGHT="cffC41F3B",
}

local DWC_FILENAME={
	[L.Mage]="MAGE",
	[L.Druid]="DRUID",
	[L.Hunter]="HUNTER",
	[L.Paladin]="PALADIN",
	[L.Priest]="PRIEST",
	[L.Rogue]="ROGUE",
	[L.Shaman]="SHAMAN",
	[L.Warlock]="WARLOCK",
	[L.Warrior]="WARRIOR",
	[L.DeathKnight]="DEATHKNIGHT",
}

local db
local defaults = {
	profile = {
		enabletimestamp = false,
		enableclasscolor = true,
		enablelevel = true,
		useshortname =true,
		enablecopy = true,
		enablechatchannelmove=false,
		modules = {
			["ICONFRAME"] = true,
			["CHATFRAME"] = true,
			["CHATCHANNEL"] = true,
		},
	}
}

local events={
	["CHAT_MSG_YELL"]=true,
	["CHAT_MSG_WHISPER"]=true,
	["CHAT_MSG_WHISPER_INFORM"]=true,
	["CHAT_MSG_SAY"]=true,
	["CHAT_MSG_RAID_LEADER"]=true,
	["CHAT_MSG_RAID"]=true,
	["CHAT_MSG_RAID_WARNING"]=true,
	["CHAT_MSG_PARTY"]=true,
	["CHAT_MSG_GUILD"]=true,
	["CHAT_MSG_CHANNEL"]=true,
	["CHAT_MSG_BATTLEGROUND"]=true,
	["CHAT_MSG_DND"]=true,
	["CHAT_MSG_OFFICER"]=true,
}

StaticPopupDialogs["DWC_COPYTEXT"] = {
	text = L["Press Ctrl-C to Copy the text"],
	hasEditBox = 1,
	maxLetters = 255,
	hasWideEditBox = 1,
	button1 = ACCEPT,
	button2 = CANCEL,
	OnAccept = function(self)
		self:Hide()
	end,
	OnShow = function(self)
		local temp=DWC_TextBuffer[tonumber(DuowanChat.copyTextId)]
		self.wideEditBox:SetText(temp or "");
		self.wideEditBox:HighlightText(0)
	end,
	OnHide = function(self)
		self.wideEditBox:SetText("");
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

local DWC_IconTableMap={}
local DWC_ReverseIconTableMap={}
local function generateIconMap()
	for k,v in pairs(DWC_IconTable) do
		DWC_IconTableMap[v[1]]=v[2]
	end
	for k,v in pairs(DWC_IconTable) do
		DWC_ReverseIconTableMap[v[2]]=v[1]
	end
end

function DuowanChat:debug(msg, ...)
	if (self._DEBUG) then
		print(format(msg, ...));
	end
end

function DuowanChat:OnInitialize()
	self:RawHook("ChatFrame_MessageEventHandler", true);
	DWC_ChatFrame_Spacing=_G.ChatFrame1:GetSpacing()
	self.db = LibStub("AceDB-3.0"):New("DuowanChatDB", defaults, "Default")
	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")
	db = self.db.profile
	self:SetupOptions()
	generateIconMap()
	local button;
	wipe(self.cbuttons);
	for i=1, 7 do
		button = self:CreateCopyButton(i);
		tinsert(self.cbuttons, button);
	end
	ChatFrameEditBox:DisableDrawLayer("BACKGROUND");
	local middle = ChatFrameEditBox:CreateTexture("ChatFrameEditBoxMiddle","BORDER");
	middle:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right");
	middle:SetPoint("LEFT", ChatFrameEditBoxLeft, "RIGHT", 0, 0);
	middle:SetPoint("RIGHT", ChatFrameEditBoxRight, "LEFT", 0, 0);
	middle:SetHeight(32);
	middle:SetTexCoord(0, 0.9375, 0, 1.0);
	ChatFrameEditBoxLeft:SetDrawLayer("BORDER")
	ChatFrameEditBoxRight:SetDrawLayer("BORDER")
	ChatFrameEditBoxLeft:SetAlpha(0.9);
	ChatFrameEditBoxRight:SetAlpha(0.9);
	middle:SetAlpha(0.9);
	ChatFrameEditBox:SetAlpha(0.9);
end

function DWCChatFrame_OnShow(self)
	self:RegisterForDrag("LeftButton");
end

function DuowanChat:ParseLocalText(text)
	for tag in string.gmatch(text, "|T([^:]+):%d+|t") do
		if ( DWC_ReverseIconTableMap[tag] ) then
			text = string.gsub(text, "|T[^:]+:%d+|t",DWC_ReverseIconTableMap[tag],1);
			return text,true
		end
	end
	return text,false
end

local function getCurrentFont()
	local _,font=SELECTED_CHAT_FRAME:GetFont()
	font=floor(font)
	local resIndex=GetCurrentResolution()
	local resolution = select( resIndex, GetScreenResolutions());
	local w,h=string.match(resolution,"(%d+)x(%d+)")
	local myfont=(font*1.5)*h/768
	return myfont
end

function DuowanChat:ParseText(text,font)
	for tag in string.gmatch(text, "({[^}]+})") do
		if ( DWC_IconTableMap[tag] ) then
			text = string.gsub(text, tag, "|T"..DWC_IconTableMap[tag] .. ":"..getCurrentFont().."|t",1);
			break
		end
	end
	return text
end

function DuowanChat:ReverseParseText(text,font)
	for tag in string.gmatch(text, "|T([^:]+):"..font.."|t") do
		if ( DWC_ReverseIconTableMap[tag] ) then
			text = string.gsub(text, "|T[^:]+:"..font.."|t",DWC_ReverseIconTableMap[tag],1);
		end
	end
	return text
end

function DuowanChat:RegisterEvents()
	self:RegisterEvent("CHAT_MSG_WHISPER",self.OnEvent)
	self:RegisterEvent("CHAT_MSG_YELL",self.OnEvent)
	self:RegisterEvent("CHAT_MSG_SAY",self.OnEvent)
	self:RegisterEvent("PARTY_MEMBERS_CHANGED",self.OnEvent)
	self:RegisterEvent("RAID_ROSTER_UPDATE",self.OnEvent)
	self:RegisterEvent("GUILD_ROSTER_UPDATE",self.OnEvent)
	self:RegisterEvent("FRIENDLIST_UPDATE",self.OnEvent)
	self:RegisterEvent("UPDATE_MOUSEOVER_UNIT",self.OnEvent)
	self:RegisterEvent("WHO_LIST_UPDATE",self.WhoListUpdate)
end

function DuowanChat:UnregisterEvents()
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
	local name,class,level,timestamp= unpack(db.storedName[name]);
	if not class then
		return false
	end
	if not level or level ==0 then
		return false
	end
	if level ==70 then
		return true
	end
	if level ==80 then
		return true
	end
	if not timestamp or time()>(timestamp+3600) then
		return false
	end
	return true
end

local function storeName(name, prof, lvl)
	db.storedName = db.storedName or {}
	db.storedName[name] = {name,prof,lvl,time()}
end

function DuowanChat:WhoListUpdate()
	if GetNumWhoResults()>0 then
		local name,_,level,_,_,_,filename=GetWhoInfo(1)
		if not checkInfo(name) then
			storeName(name,filename,level)
		end
	end
	SetWhoToUI(0)
	FriendsFrame:RegisterEvent("WHO_LIST_UPDATE")
end

local function checkMessageSender(message,sender)
	local sendWhoQuery=function(name)
		SetWhoToUI(1)
		FriendsFrame:UnregisterEvent("WHO_LIST_UPDATE")
		SendWho('n-"'..name..'"')
	end
	if (message and sender and strlen(sender)>0) then
		if checkInfo(sender) then
		else
			sendWhoQuery(sender)
		end
	end
end

function DuowanChat.OnEvent(event, message, sender)
	local checkUnitIsStored=function(unit)
		if UnitIsPlayer(unit) then
			local _,filename=UnitClass(unit)
			local name=UnitName(unit)
			local level=UnitLevel(unit)
			if filename and not checkInfo(name) then
				storeName(name,filename,level)
			end
		end
	end
	if string.find(event,"CHAT_MSG") then
		checkMessageSender(message, sender)
	elseif event=="RAID_ROSTER_UPDATE" then
		local num= GetRealNumRaidMembers()
		if num>0 then
			for i=1,num,1 do
				local name,_,_,level,_,fileName= GetRaidRosterInfo(i)
				if fileName and not checkInfo(name) then
					storeName(name,filename,level)
				end
			end
		end
	elseif event=="PARTY_MEMBERS_CHANGED" then
		local num= GetRealNumPartyMembers()
		if num>0 then
			local num=GetRealNumPartyMembers()
			for i=1,num,1 do
				checkUnitIsStored("party"..i)
			end
		end
	elseif event=="GUILD_ROSTER_UPDATE" then
		local num= GetNumGuildMembers()
		if num>0 then
			for i=1,num,1 do
				local name,_,_,level,_,_,_,_,_,_,classFileName= GetGuildRosterInfo(i)
				if not checkInfo(name) then
					storeName(name,classFileName,level)
				end
			end
		end
	elseif event=="FRIENDLIST_UPDATE" then
		local num= GetNumFriends()
		if num>0 then
			for i=1,num,1 do
				local name,level,class= GetFriendInfo(i)
				if class and checkInfo(name) then
					local classFileName=DWC_FILENAME[class]
					storeName(name,classFileName,level)
				end
			end
		end
	elseif event=="UNIT_FOCUS" then
		checkUnitIsStored("focus")
	elseif event=="UNIT_TARGET" then
		checkUnitIsStored("target")
	elseif event=="UPDATE_MOUSEOVER_UNIT" then
		checkUnitIsStored("mouseover")
	end
end

local function showTimeStamp(text)
	local hour = tonumber(string.sub(date("%x %X"), 10, 11));
	local minute= tonumber(string.sub(date("%x %X"), 13, 14));
	local second= tonumber(string.sub(date("%x %X"), 16, 17));
	if( string.len(tostring(hour)) < 2) then
		hour = "0"..tostring(hour);
	end
	if( string.len(tostring(minute)) < 2) then
		minute = "0"..tostring(minute);
	end
	local TimeStamp = "#33CCFF[$h:$m]";
	if db.enabletimestampsecond then
		TimeStamp = "#33CCFF[$h:$m:$s]";
	end
	TimeStamp = string.gsub(TimeStamp, "$h", hour);
	TimeStamp = string.gsub(TimeStamp, "$m", minute);
	TimeStamp = string.gsub(TimeStamp, "$s", second);
	TimeStamp = string.gsub(TimeStamp, "#", "|cff");
	text = TimeStamp.."|r "..text;
	return text
end

function DuowanChat:ChatFrame_MessageEventHandler(this, event, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12 = ...
	if (self.enable) then
		if ( not event or not arg2 ) then
			self.hooks.ChatFrame_MessageEventHandler(this, event,...)
			return nil
		end
		if( not this.hooked ) then
			this.hooked = true;
			self:RawHook(this, "AddMessage", true);
		end
		if db.enableclasscolor or db.enablelevel then
			this.solColorChatNicks_Name = arg2;
			this.solGUID = arg12;
		end
	else
		if (this.hooked) then
			this.hooked = false;
			self:Unhook(this, "AddMessage");
		end
	end

	if (self:IsHooked("ChatFrame_MessageEventHandler") and this and event) then
		self.hooks.ChatFrame_MessageEventHandler(this, event, ...)
	end
end

function DuowanChat:SetItemRef(link, text, button)
	if not string.find(link,"dwcnamecopyproof") then
		self.hooks.SetItemRef(link, text, button)
	else
		local id=string.match(link,"%d+",1)
		DuowanChat.copyTextId = id
		StaticPopup_Show("DWC_COPYTEXT")
	end
end

local function appendItemLink(text,id)
	text="|cff9de000|Hdwcnamecopyproof:"..id.."|h◆|h|r"..text
	return text
end

function DuowanChat:AddMessage(this, text, r, g, b, id, addToStart)
	if ( addToStart and self:IsHooked(this, "AddMessage")) then
		self.hooks[this].AddMessage(this, text, r, g, b, id, addToStart);
		return;
	end

	if event and events[event] then
		if this.solColorChatNicks_Name and string.len(this.solColorChatNicks_Name) > 2 and text ~= nil and arg2 ~= nil then
			local outputName = this.solColorChatNicks_Name;
			local level = nil;
			local name, prof, level=getNameInfo(this.solColorChatNicks_Name)
			if( level ~= nil) and db.enablelevel then
				outputName = level..":"..this.solColorChatNicks_Name;
			end
			local color=DWC_ColorTable[prof]
			if (not color and this.solGUID) then
				local localizedClass, englishClass, localizedRace, englishRace, sex = GetPlayerInfoByGUID(this.solGUID);
				color = DWC_ColorTable[englishClass];
			end
			if color and db.enableclasscolor then
				text = string.gsub(text, "(.-)"..this.solColorChatNicks_Name .. "([%]%s].*)", "%1|"..color..outputName.."|r%2", 1);
			else
				text = string.gsub(text, "(.-)"..this.solColorChatNicks_Name .. "([%]%s].*)", "%1"..outputName.."%2", 1);
			end
		end
		this.solColorChatNicks_Name = nil;

		if ( db.useshortname ) then
			local temp = nil;
			if text ~= nil then
				if strsub(event, 1, 10) ~= "CHAT_MSG_S" then
					for k,v in pairs(SCCN_Chan_Replace) do
						temp = string.gsub(text, " "..k.."%]", v.."%]", 1)
						temp = string.gsub(temp, k.."%]", v.."%]", 1)
						temp = string.gsub(temp, k.."：", v.."：", 1)
						temp = string.gsub(temp, "^"..k, v, 1)
						if temp ~= text then
							text = temp;
							temp = nil;
							break;
						end
					end
				end
			end
		end

		if text ~=nil then
			text=DuowanChat:ParseText(text)
			if db.enabletimestamp then
				text=showTimeStamp(text)
			end
			DWC_TextIndex=(DWC_TextIndex or 0)
			DWC_TextIndex=DWC_TextIndex +1
			DWC_TextBuffer=DWC_TextBuffer or {}
			DWC_TextBuffer[DWC_TextIndex]=text
			if db.enablecopy then
				text=appendItemLink(text,DWC_TextIndex)
			end
		end
	end

	if (self.hooks[this].AddMessage) then
		self.hooks[this].AddMessage(this, text,r,g,b,id,addToStart);
	end
end
--------------
-- 滚动翻页
local enableScroll = nil;
function ScrollChatFrame_OnMouseWheel(self, delta)
	if (not enableScroll) then
		return;
	end
	local parent = self:GetParent();
	if (delta) then
		if (delta > 0) then
			if (IsShiftKeyDown() or IsControlKeyDown()) then
				parent:PageUp();
			else
				parent:ScrollUp();
			end

		elseif (delta < 0) then
			if (IsShiftKeyDown() or IsControlKeyDown()) then
				parent:PageDown();
			else
				parent:ScrollDown();
			end
		end
	end
end

function ScrollChatFrame_OnShow(self)
	if (not enableScroll) then
		return
	end
	if (self and self:GetParent()) then
		local level = self:GetParent():GetFrameLevel()
		if (level > 1) then
			self:SetFrameLevel(level + 1)
		end
	end
end

function DuowanChat:ChatScrollToggle(switch)
	if (switch) then
		enableScroll = true
	else
		enableScroll = nil
	end
end
----------------
-- 复制聊天内容
function DuowanChat:AddLines(lines, ...)
	for i=select("#", ...), 1, -1 do
		local x = select(i, ...);
		if x:GetObjectType() == "FontString" and not x:GetName() then
			table.insert(lines, x:GetText());
		end
	end
end

function DuowanChat:CopyChat()
	local frame = SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME;
	wipe(self.lines);
	 self:AddLines(self.lines, frame:GetRegions());
	self.str = table.concat(self.lines, "\n");
	wipe(self.lines);

	DWCCopyFrameText:SetText(L["Press Ctrl-C to Copy the text"]);
	DWCCopyFrameScrollText:SetText(self.str or "");
	DWCCopyFrame:Show();
end

do
	local function reminderOnClick(self)
		PlaySound("igChatBottom");
		DuowanChat:CopyChat();
	end
	local function reminderOnEnter(self, motion) self:SetAlpha(0.9) end
	local function reminderOnLeave(self, motion) self:SetAlpha(0.3) end

	function DuowanChat:CreateCopyButton(id)
		local cf = _G["ChatFrame"..id];
		local name = "ChatFrame"..id.."DWCCReminder";
		local b = _G[name];
		if not b then
		    b = CreateFrame("Button", name, cf);
		    b:SetFrameStrata("BACKGROUND");
		    b:SetWidth(18);
		    b:SetHeight(18);
		    b:SetNormalTexture("Interface\\AddOns\\DuowanChat\\icon\\prat-chatcopy2");
		    b:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down");
		    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight");
		    b:SetPoint("TOPLEFT", cf, "TOPLEFT", 0, 0);
		    b:SetScript("OnClick", reminderOnClick);
		    b:SetScript("OnEnter", reminderOnEnter);
		    b:SetScript("OnLeave", reminderOnLeave);
		    b:SetAlpha(0.3);
		    b:Hide();
		end

		return b;
	end
end

function DuowanChat:ChatCopyToggle(switch)
	for i, b in ipairs(self.cbuttons) do
		if (switch) then
			b:Show();
		else
			b:Hide();
		end
	end
end

function DuowanChat:ChatEdit_DeactivateChat(editBox)
	editBox:Hide();
end

--------------------------
function DuowanChat:OnEnable()
	self.enable = true;
	ChatFrameEditBox:SetAltArrowKeyMode(false);
	self:RawHook("SetItemRef", true);
	self:RegisterEvents();
	self:ChatScrollToggle(true);
	self:ChatCopyToggle(true);
end

function DuowanChat:Refresh()
	DWCChatFrame:SetMovable(db.enablechatchannelmove)
	if db and db.frameposition then
		DWCChatFrame:SetPoint(unpack(db.frameposition))
	else
		--local _point,rel,relp,xo,yo=ChatFrame1EditBox:GetPoint()
		DWCChatFrame:SetPoint("TOPLEFT", "ChatFrame1BottomButton","BOTTOMLEFT",0,-2)
	end
end

function DuowanChat:OnDisable()
	self.enable = false;
	ChatFrameEditBox:SetAltArrowKeyMode(true);
	FCF_UpdateDockPosition=FCF_UpdateDockPosition_ORI
	self:Unhook("SetItemRef");
	self:UnregisterEvents();
	self:ChatScrollToggle(false);
	self:ChatCopyToggle(false);
end

function DuowanChat:GetModuleEnabled(module)
	return db.modules[module]
end

function DuowanChat:SetModuleEnabled(module, value)
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
