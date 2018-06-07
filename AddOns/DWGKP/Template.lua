----------------------------------------------------------------------
-- Template ver 1.0
-- 日期: 2010-6-10
-- 作者: dugu@bigfoot
-- 描述: 多玩DKP使用的模板
-- 版权所有 (c) duowan.com
-----------------------------------------------------------------------
local L = LibStub("AceLocale-3.0"):GetLocale("DWGKP");
--
function DWGKPTab1Button_OnLoad(self)
	PanelTemplates_TabResize(self, 0);
	
	local name = self:GetName();
	_G[name.."HighlightTexture"]:SetWidth(self:GetTextWidth() + 24);
	_G[name .. "LeftDisabled"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab1");
	_G[name .. "LeftDisabled"]:SetTexCoord(0.015625, 0.125, 0, 1.0);
	_G[name .. "MiddleDisabled"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab1");
	_G[name .. "MiddleDisabled"]:SetTexCoord(0.125, 0.5, 0, 1.0);
	_G[name .. "RightDisabled"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab1");
	_G[name .. "RightDisabled"]:SetTexCoord(0.125, 0.015625, 0, 1.0);
	_G[name .. "Left"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab2");
	_G[name .. "Left"]:SetTexCoord(0.015625, 0.125, 0, 0.95);
	_G[name .. "Middle"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab2");
	_G[name .. "Middle"]:SetTexCoord(0.125, 0.5, 0, 0.95);
	_G[name .. "Right"]:SetTexture("Interface\\AddOns\\DWGKP\\Texture\\dwmh-tab2");
	_G[name .. "Right"]:SetTexCoord(0.125, 0.015625, 0, 0.95);
	
end

function DWGKPTab1Button_OnClick(self)
	PanelTemplates_Tab_OnClick(self, self:GetParent());
	if (self:GetParent().UpdateFunc and type(self:GetParent().UpdateFunc) == "function") then
		self:GetParent().UpdateFunc(self:GetID());
	end
	PlaySound("igMainMenuOptionCheckBoxOn");
end

function DWGKPTab1Button_OnShow(self)
	PanelTemplates_TabResize(self, 2);
	
	if (self:GetID() == 1) then
		if (self:GetParent().UpdateFunc and type(self:GetParent().UpdateFunc) == "function") then
			self:GetParent().UpdateFunc(self:GetID());
		end
	end	
end

function DWGKPNumInputBox_OnTextChanged(self)
	local value = self:GetText();
	if (value == "" or string.find(value, "^[%+|%-]?%d*$")) then
		self.lasttext = value;
	else
		self:SetText(self.lasttext or "");
	end	
end
-------------------
-- DropdownBox
local RADIO_MAP_CLASSES = {
	[1] = {"Mage", "Warlock", "Priest", "Druid", "Paladin", "Rogue", "Shaman", "Hunter", "Warrior", "DeathKnight"},
	[2] = {"Mage", "Warlock", "Priest", },
	[3] = {"Druid",  "Rogue",},
	[4] = {"Shaman",  "Hunter",},
	[5] = {"Paladin",  "Warrior", "DeathKnight"},
};
local DWGKP_ClothGroup = {"AllButton", "ClothButton", "LeatherButton", "MailButton", "PlateButton",};
local function DWGKP_GetClasses(self)
	table.wipe(self:GetParent().frame.Classes);
	for k, v in ipairs(RADIO_MAP_CLASSES[1]) do
		if (_G["DWGKPDropdownBox" .. v .. "Button"]:GetChecked() == 1) then
			tinsert(self:GetParent().frame.Classes, v);
		end
	end
	return self:GetParent().frame.Classes;
end

function DWGKPCheckButton_OnLoad(self)
	_G[self:GetName() .. "Text"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName() .. "Text"]:SetTextColor(1,1,1);
	_G[self:GetName() .. "Text"]:ClearAllPoints();
	_G[self:GetName() .. "Text"]:SetPoint("LEFT", self, "RIGHT", -2, 2);
end

function DWGKPCheckButton_OnClick(self)
	if (self:GetChecked()) then
		self:SetChecked(1);
	else
		self:SetChecked(0);
	end
	local classes = DWGKP_GetClasses(self);
	local updatefunc = DWGKPDropdownBox.frame and DWGKPDropdownBox.frame.UpdateFunc;
	if (updatefunc and type(updatefunc) == "function") then
		updatefunc(classes);
	end
end

function DWGKPCheckButton_OnEnter(self)
	DWGKPDropdownBox_OnEnter(DWGKPDropdownBox)
end

function DWGKPCheckButton_OnLeave(self)
	DWGKPDropdownBox_OnLeave(DWGKPDropdownBox)
end

function DWGKPRadioButton_OnLoad(self)
	_G[self:GetName() .. "Text"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName() .. "Text"]:SetTextColor(1,1,1);
	_G[self:GetName() .. "Text"]:ClearAllPoints();
	_G[self:GetName() .. "Text"]:SetPoint("LEFT", self, "RIGHT", -1, 2);
end

function DWGKPRadioButton_OnClick(self)
	local id = self:GetID();
	if (id <=5) then		
		for _, n in ipairs(DWGKP_ClothGroup) do
			_G["DWGKPDropdownBox" .. n]:SetChecked(0);
		end
		self:SetChecked(1);		
		self:GetParent().frame.RadioGroup = DWGKP_ClothGroup[id];
		if (id > 1) then
			for _, name in ipairs(RADIO_MAP_CLASSES[1]) do
				_G["DWGKPDropdownBox" .. name .. "Button"]:SetChecked(0);
			end
		end
		
		for k, v in ipairs(RADIO_MAP_CLASSES[id]) do
			_G["DWGKPDropdownBox" .. v .. "Button"]:SetChecked(1);
		end
	end
	local classes = DWGKP_GetClasses(self);
	local updatefunc = DWGKPDropdownBox.frame and DWGKPDropdownBox.frame.UpdateFunc;
	if (updatefunc and type(updatefunc) == "function") then
		updatefunc(classes);
	end
end

do
	local ButtonTexts= {
		["All"] = L["All"],
		["Cloth"] = L["Cloth"],
		["Leather"] = L["Leather"],
		["Mail"] = L["Mail"],
		["Plate"] = L["Plate"],
		["Mage"] = L["Mage"],
		["Warlock"] = L["Warlock"],
		["Priest"] = L["Priest"],
		["Druid"] = L["Druid"],
		["Paladin"] = L["Paladin"],
		["Rogue"] = L["Rogue1"],
		["Shaman"] = L["Shaman1"],
		["Hunter"] = L["Hunter"],
		["Warrior"] = L["Warrior"],
		["DeathKnight"] = L["DeathKnight"],
	};
	function DWGKPDropdownBox_OnLoad(self)
		for key, text in pairs(ButtonTexts) do
			_G[self:GetName() .. key .. "ButtonText"]:SetText(text);
		end
	end
end

function ToggleDropdownBox(self)
	DWGKPDropdownBox.frame = self;
	if (DWGKPDropdownBox:IsVisible() and DWGKPDropdownBox:GetAlpha() > 0) then
		DWGKPDropdownBox:Hide();
	else
		for k, v in ipairs(RADIO_MAP_CLASSES[1]) do
			_G["DWGKPDropdownBox" .. v .. "Button"]:SetChecked(0);
		end
		for k, v in ipairs(DWGKP_ClothGroup) do
			_G["DWGKPDropdownBox" .. v ]:SetChecked(0);
		end
		
		_G["DWGKPDropdownBox" .. self.RadioGroup]:SetChecked(1);
		if (type(self.Classes) == "table") then
			for k, v in ipairs(self.Classes) do
				_G["DWGKPDropdownBox" .. v .. "Button"]:SetChecked(1);
			end
		end
		DWGKPDropdownBox:SetAlpha(1.0);
		DWGKPDropdownBox:ClearAllPoints();
		DWGKPDropdownBox:SetPoint("TOPLEFT", self, "BOTTOMLEFT", -5, -2);
		DWGKPDropdownBox:Show();
	end	
end

function DWGKPDropdownBox_OnEnter(self)
	self.isCounting = nil;
end

function DWGKPDropdownBox_OnLeave(self)
	self.showTimer = 0.8;
	self.isCounting = 1;
end

function DWGKPDropdownBox_OnUpdate(self, elapsed)
	if ( not self.showTimer or not self.isCounting ) then
		return;
	elseif ( self.showTimer < 0 ) then		
		dwFadeOut(self, 0.2, 1, 0);		
		self.showTimer = nil;
		self.isCounting = nil;
	else
		self.showTimer = self.showTimer - elapsed;
	end
end

function DWGKPClassDropdownInit(frame, callback, radioGroup, classes)
	frame.UpdateFunc = callback;
	frame.RadioGroup = radioGroup or "AllButton";
	frame.Classes = classes or DWGKP_DEFAULT_CLASS_FILTER;
end
---------------------------
-- 
function DWGKPListRow_OnLoad(self)
	local name = self:GetName();
	_G[name .. "Left"]:SetAlpha(0.5);
	_G[name .. "Middle"]:SetAlpha(0.5);
	_G[name .. "Right"]:SetAlpha(0.5);

	self.SetHighlight = function(self, switch)
		if (switch) then
			_G[name .. "HightLightLeft"]:Show();
			_G[name .. "HightLightMiddle"]:Show();
			_G[name .. "HightLightRight"]:Show();
		else
			_G[name .. "HightLightLeft"]:Hide();
			_G[name .. "HightLightMiddle"]:Hide();
			_G[name .. "HightLightRight"]:Hide();
		end
	end
end

function DWGKPListRow_OnEnter(self)
	local name = self:GetName();
	_G[name .. "MouseOverLeft"]:Show();
	_G[name .. "MouseOverMiddle"]:Show();
	_G[name .. "MouseOverRight"]:Show();
end

function DWGKPListRow_OnLeave(self)
	local name = self:GetName();
	_G[name .. "MouseOverLeft"]:Hide();
	_G[name .. "MouseOverMiddle"]:Hide();
	_G[name .. "MouseOverRight"]:Hide();
end

function DWGKPListRow_OnClick(self)
	if (DWGKPMainFrameGlobalEditBox:IsShown()) then
		DWGKPGlobalEditBox_OnEnterPressed(DWGKPMainFrameGlobalEditBox);		
	end
end

function DWGKPDeleteButton_OnEnter(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end	
end

function DWGKPDeleteButton_OnLeave(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
end

function DWGKPEditButton_OnEnter(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end	
end

function DWGKPEditButton_OnLeave(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
end

function DWGKPMemberDistributeButton_OnEnter(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end
	
	GameTooltip_SetDefaultAnchor(GameTooltip, self);
	GameTooltip:SetText(L["DWGKP"], 1, 1, 1);
	GameTooltip:AddLine(L["Check to distibute gold"]);
	GameTooltip:Show();
end

function DWGKPMemberDistributeButton_OnLeave(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
	GameTooltip:Hide();
end

function DWGKPItemButton_OnLoad(self)
	self.SetItem = function(self, data)
		local data = data or self:GetParent().data;
		local count = (data.count and tonumber(data.count) > 1) and data.count or "";
		_G[self:GetName() .. "IconTexture"]:SetTexture(data.icon);
		_G[self:GetName() .. "Count"]:SetText(count);
		_G[self:GetName() .. "Count"]:Show();
		self.data = data;
	end
end

function DWGKPItemButton_OnClick(self)
	local data = self.data or self:GetParent().data;
	if (data and data.link and IsModifiedClick() ) then
		HandleModifiedItemClick(data.link);
	end
end

function DWGKPItemButton_OnEnter(self)
	if (self.OnEnter) then
		self:OnEnter();
	end
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end

	local data = self.data or self:GetParent().data;
	if (data and data.link) then
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
		GameTooltip:SetHyperlink(data.link);
		GameTooltip:Show();
	end
end

function DWGKPItemButton_OnLeave(self)
	if (self.OnLeave) then
		self:OnLeave();
	end
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
	GameTooltip:Hide();
end

function DWGKPEditLable_OnLoad(self)
	_G[self:GetName() .. "Text"]:SetTextColor(0.95, 0.86, 0);
	-- 扩展接口
	self.SetData = function(self, key, gray)
		local data = self:GetParent().data;
		if (data) then
			_G[self:GetName().."Text"]:SetText(data[key]);
			if (gray) then
				_G[self:GetName().."Text"]:SetTextColor(0.5, 0.5, 0.5);
			else
				_G[self:GetName().."Text"]:SetTextColor(1, 1, 1);
			end
			self.key = key;
		end		
	end

	self.GetData = function(self)
		local data = self:GetParent().data;
		if (data and self.key) then
			return data[self.key];
		end
	end
	
	self.SetDisable = function(self, key)
		if (key) then
			_G[self:GetName().."Button"]:Disable();
		else
			_G[self:GetName().."Button"]:Enable();
		end		
	end
end

function DWGKPEditLableButton_OnClick(self)
	-- TODO: 显示对话框
	local button = self:GetParent();
	local text = _G[button:GetName() .. "Text"]:GetText();
	
	local editbox = DWGKPMainFrameGlobalEditBox;
	editbox.text = _G[button:GetName() .. "Text"];
	editbox.key = button.key;
	editbox.data = button:GetParent().data;
	editbox:SetText(text or "0");
	editbox:HighlightText();
	editbox:ClearAllPoints();
	editbox:SetPoint("CENTER", button, "CENTER", 0, 0);
	editbox:Show();
end

function DWGKPEditLableButton_OnEnter(self)
	local frame = self:GetParent():GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end	
end

function DWGKPEditLableButton_OnLeave(self)
	local frame = self:GetParent():GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
end

function DWGKPGlobalEditBox_OnLoad(self)
	self:SetTextInsets(8, 8, 0, 0);
	self:SetBackdropColor(1/3,0.75/3,0.75/3);
	self:SetBackdropBorderColor(1, 1, 1);
end

function DWGKPGlobalEditBox_OnEscapePressed(self)
	self:Hide();
end

function DWGKPGlobalEditBox_OnTextChanged(self)
	local value = self:GetText();
	if (value == "" or string.find(value, "^[%+|%-]?%d*$")) then
		self.lasttext = value;
	else
		self:SetText(self.lasttext or "");
	end
end

local function checkValue(text)
	if (string.find(text, "^([%+|%-]?%d+)$")) then		
		return true;
	end

	return false;
end

function DWGKPGlobalEditBox_OnEnterPressed(self)
	local text = self:GetText();
	if (checkValue(text)) then
		if (self.data) then
			self.data[self.key] = tonumber(text);
		end
		self.text:SetText(tonumber(text));
	end
	self:Hide();
end

function DWGKPGlobalEditBox_OnTabPressed(self)
	DWGKPGlobalEditBox_OnEnterPressed(self);
end

function DWGKPDistributeCheckButton_OnLoad(self)
	_G[self:GetName() .. "Text"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName() .. "Text"]:SetTextColor(1,1,1);
	_G[self:GetName() .. "Text"]:ClearAllPoints();
	_G[self:GetName() .. "Text"]:SetPoint("LEFT", self, "RIGHT", -1, 2);
end

function DWGKPDistributeCheckButton_OnClick(self)
	if (self:IsShown() and self.data) then
		if (self:GetChecked() == 1) then
			self.data["checked"] = 1;
		else
			self.data["checked"] = 0;
		end
	end
end
--------------
-- RaidFrame
function DWGKPRaidListRowEdit_OnClick(self)
	local data = {};
	local d = self:GetParent().data;
	local index = self:GetParent().index;
	data["text"] = d.name;
	data["10man"] = d["10man"];
	data["hero"] = d["hero"];

	ShowDWGKPRaidEditFrame(data);
end

function DWGKPRaidListRowDelete_OnClick(self)
	local data = self:GetParent().data;
	local curRaid = DWGKP:GetCurRaid();
	if (data.name == curRaid and data.ctime == curRaid.ctime) then
		return;
	end

	local key = data.name..data.ctime;
	DWGKP.db[key] = nil;

	DWGKP:UpdateView();
end

function DWGKPRaidListActiveButton_OnClick(self)
	local curRaid = DWGKP:GetCurRaid();
	if (not curRaid or DWGKP:InViewMod()) then
		local data = self:GetParent().data;
		DWGKP:ActiveRaid(data);

		DWGKP:UpdateView();
	end
end

function DWGKPRaidListActiveButton_OnEnter(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnEnter(frame);
	end	
end

function DWGKPRaidListActiveButton_OnLeave(self)
	local frame = self:GetParent();
	if (frame) then
		DWGKPListRow_OnLeave(frame);
	end
end

function DWGKPRaidListRow_OnClick(self)
	local hasA = DWGKP:HasActiveRaid();
	local curRaid = DWGKP:GetCurRaid();
	-- 没有当前活动
	-- 当前活动已结束且未激活
	if (not curRaid or (curRaid.info.endtime and not hasA)) then
		local key = self.data.name .. self.data.ctime;
		DWGKP:SetCVar("CurRaid", key);
	end
	-- 再次点击当前已结束的活动
	if (curRaid and DWGKP:InViewMod() and (curRaid.info.name == self.data.name) and (curRaid.info.ctime == self.data.ctime)) then
		DWGKP:SetCVar("CurRaid", nil);
	end

	DWGKP:UpdateView();
end
----------------
-- 收支
function DWGKPEventListRowEdit_OnClick(self)
	local curRaid = DWGKP:GetCurRaid();
	local data = self:GetParent().data;
	local index = data.cIndex;
	if (index) then
		data = curRaid.customList[index];
		ShowDWGKPEventEditFrame(data);
	else
		GKP:debug("not a custom event item.");
	end	
end

function DWGKPEventListRowDelete_OnClick(self)
	local curRaid = DWGKP:GetCurRaid();
	local data = self:GetParent().data;
	if (data.cIndex and curRaid.customList[data.cIndex]) then
		local i = curRaid.customList[data.cIndex];
		tremove(curRaid.customList, i);
		DWGKP:OnUpdateEvents();
		DWGKP:UpdateView();
	else
		DWGKP:debug("cann't find a custom event item");
	end
end

---------------
-- 编辑
function DWGKPItemListRowEdit_OnClick(self)
	local data = self:GetParent().data;
	if (data) then
		ShowDWGKPItemEditFrame(data);
	else
		print("not item data.");
	end		
end

function DWGKPItemListRowDelete_OnClick(self)
	local index = self:GetParent().index;
	if (index) then
		DWGKP:DeleteItem(index);
		DWGKP:UpdateView();
	end
end

---------------
-- 编辑框
function DWGKPEditFrame_OnTabPressed(self)
	local parent = self:GetParent();
	if (parent.type and DWGKP_TAB_INDEX[parent.type]) then
		EditBox_HandleTabbing(self, DWGKP_TAB_INDEX[parent.type]);
	end	
end

----------------
-- 成员
function DWGKPMemberDistributeButton_OnClick(self)
	local parent = self:GetParent();
	if (parent.data) then
		local checked = self:GetChecked();
		if (not checked) then
			checked = 0;
		end

		parent.data["ischeck"] = checked;
	end
end