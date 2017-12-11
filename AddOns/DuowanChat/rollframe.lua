local DWChat = LibStub('AceAddon-3.0'):GetAddon('DuowanChat')
local L = LibStub("AceLocale-3.0"):GetLocale("DuowanChat")
local MODNAME = "ROLLFRAME"
local DWChatRollFrame = DWChat:NewModule(MODNAME)

local db
local defaults = {
	profile = {
		enablechatroll=false
	}
}

local optGetter, optSetter
do
	local mod = DWChatRollFrame
	function optGetter(info)
		local key = info[#info]
		return DWChat.db.profile[key]
	end

	function optSetter(info, value)
		local key = info[#info]
		DWChat.db.profile[key] = value
		mod:Refresh()
	end
end

local options
local getOptions=function()
	if not options then
		options={
			type = "group",
			name = L["RollFrame"],
			arg = MODNAME,
			get = optGetter,
			set = optSetter,
			args={
				intro = {
					order = 1,
					type = "description",
					name = L["this function allows you to use roll macro in your chat"],
				},
				enablechatroll = {
					order = 2,
					type = "toggle",
					name = L["Enable Roll Macro"],
					get = function()
						return DWChat:GetModuleEnabled(MODNAME)
					end,
					set = function(info, value)
						DWChat:SetModuleEnabled(MODNAME, value)
					end,
				},
			},
		}
	end
	return options
end

function DWCRollButton_OnClick(self, button)
	local editBox = ChatFrameEditBox
	if (not editBox:IsShown()) then
		editBox:Show();
	end
	editBox:SetFocus();
	local _,font=SELECTED_CHAT_FRAME:GetFont()
	font=floor(font)
	editBox:Insert("|T"..self.texture..":"..font.."|t")
	DWCIconFrame:Hide()
end

local function createIconButton(text,texture,i)
	local chatTab=_G["DWCChatIconButton"..i] or CreateFrame("Button","DWCChatIconButton"..i,DWCIconFrame,"DWCIconButtonTemplate")
	chatTab.id= i
	chatTab.text=text
	chatTab.texture=texture
	chatTab:SetNormalTexture(texture)
	return chatTab
end

local function setIconPosition(frame,icon,ix,iy)
	icon:SetPoint("TOPLEFT",frame,"TOPLEFT",(ix-1)*DWC_ICON_SIZE_X+5,-1*(iy-1)*DWC_ICON_SIZE_Y-5)
end

local function arrangeIcons(frame,icons)
	local px=1
	local py=1
	for i=1,DWC_NUM_TAB,1 do
		setIconPosition(frame,icons[i],px,py)
		px=px+1
		if px==DWC_ICON_NUMBER_X+1 then
			px=1
			py=py+1
		end
	end
end

local function createIconFrame()
	local callOutButton=_G.DWCIconFrameCalloutButton
	local iconFrame=_G.DWCIconFrame
	callOutButton:SetScript("OnClick",function()
		if not iconFrame then
			return
		end
		if iconFrame:IsShown() then
			iconFrame:Hide()
		else
			iconFrame:Show()
		end
	end)
	callOutButton:SetScript("OnEnter",function()end)
	callOutButton:SetScript("OnLeave",function()end)
	callOutButton:SetAlpha(0.8)
	callOutButton:SetPoint("TOPLEFT",DWCChatFrame,"TOPLEFT",2,-3)
	callOutButton:Show()
	local i=0
	for k, v in pairs(DWC_IconTable) do
		i=i+1
		chaticonbuttonlist[i]=createIconButton( v[1], v[2],k)
	end

	DWC_NUM_TAB=i arrangeIcons(iconFrame,chaticonbuttonlist)
	iconFrame.iconButtonList=chaticonbuttonlist iconFrame:SetScript("OnShow",function(self)
		local i=1
		while(self.iconButtonList[i]) do
			self.iconButtonList[i]:Show()
			i=i+1
		end
	end)
	iconFrame:SetScript("OnHide",function(self)
		local i=1
		while(self.iconButtonList[i]) do
			self.iconButtonList[i]:Hide()
			i=i+1
		end
	end)
end

function DWChatIconFrame:OnInitialize()
	self.db = DWChat.db:RegisterNamespace(MODNAME, defaults)
	db = self.db.profile
	self:SetEnabledState(DWChat:GetModuleEnabled(MODNAME))
	DWChat:RegisterModuleOptions(MODNAME, getOptions, L["IconFrame"])
	local worldFrame_MouseUp=WorldFrame:GetScript("OnMouseUp")
	if worldFrame_MouseUp then
		WorldFrame:HookScript("OnMouseUp",function()
			if DWCIconFrame then
				DWCIconFrame:Hide()
			end
		end)
	else
		WorldFrame:SetScript("OnMouseUp",function()
			if DWCIconFrame then
				DWCIconFrame:Hide()
			end
		end)
	end
end

function DWChatIconFrame:Refresh()
end

function DWChatIconFrame:OnEnable()

	_G["ChatFrameEditBox"]:SetScript("OnTextChanged",function(self)
		local text,tag=DWChat:ParseLocalText(self:GetText())
		if tag then
			self:SetText(text)
		end
	end)

	createIconFrame()
	self:Refresh()
end

function DWChatIconFrame:OnDisable()

	_G["ChatFrameEditBox"]:SetScript("OnTextChanged",function(self) end)

	_G.DWCIconFrameCalloutButton:Hide()
	_G.DWCIconFrame:Hide()
end

function DWC_StartCount(frame)
	if frame:GetParent() ~= UIParent then
		DWC_StartCount(frame:GetParent())
		return
	end
	frame.showTimer = 1;
	frame.isCounting = 1;
end

function DWC_StopCount(frame)
	if frame:GetParent()~=UIParent then
		DWC_StopCount(frame:GetParent())
		return
	end
	frame.isCounting = nil;
end

function DWC_OnUpdate(self,elapsed)
	if ( not self.showTimer or not self.isCounting ) then
		return;
	elseif ( self.showTimer < 0 ) then
		self:Hide();
		self.showTimer = nil;
		self.isCounting = nil;
	else
		self.showTimer = self.showTimer - elapsed;
	end
end

