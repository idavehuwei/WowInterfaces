------------------------------------------------------------------------------------------
-- DWGKP ver 1.0
-- 日期: 2010-6-7
-- 作者: dugu@bigfoot
-- 描述: 多玩团队活动记分及查看系统
-- 版权所有 (c) duowan.com
------------------------------------------------------------------------------------------
local GKP = LibStub("AceAddon-3.0"):GetAddon("DWGKP");
local L = LibStub("AceLocale-3.0"):GetLocale("DWGKP");
local ITEMS_TO_DISPLAY = 8;
local DWGKP_GKP_FRAMES = {
	"DWGKPDKPFrameMemberFrame", 
	"DWGKPDKPFrameItemFrame", 
	"DWGKPDKPFrameEventFrame", 
	"DWGKPDKPFrameDistributeFrame",
	"DWGKPDKPFrameRaidFrame",
};

local function DWGKP_ShowFrameTab(frames, index)
	for i, name in ipairs(frames) do
		_G[name]:Hide();
	end
	_G[frames[index]]:Show();
end

function DWGKPMainFrame_OnLoad(self)
	DUOWAN_GKP_FONT = ChatFontNormal:GetFont();
	DWGKPFontSmall:SetFont(DUOWAN_GKP_FONT, 12);
	DWGKPFontMed:SetFont(DUOWAN_GKP_FONT, 13);
	DWGKPFontNormal:SetFont(DUOWAN_GKP_FONT, 14);	
	GlueFontNormal:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE");
	GlueFontHighlight:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE");
	GlueFontDisable:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE");
	self:RegisterForDrag("LeftButton");
	tinsert(UISpecialFrames, self:GetName());
end

function DWGKPMainFrame_OnClick(self)
	if (DWGKPMainFrameGlobalEditBox:IsShown()) then
		DWGKPGlobalEditBox_OnEnterPressed(DWGKPMainFrameGlobalEditBox);		
	end
end

function DWGKPDKPFrame_OnShow(self)
	local curRaid = GKP:GetCurRaid();
	if (curRaid) then
		DWGKPDKPFrameCurRaidName:SetText(curRaid.info.name);
	else
		DWGKPDKPFrameCurRaidName:SetText(L["NoRaid"]);
	end
	local index = PanelTemplates_GetSelectedTab(DWGKPDKPFrame);
	DWGKP_ShowFrameTab(DWGKP_GKP_FRAMES, index);
end

local function DWGKPDKPFrame_Update(id)
	DWGKP_ShowFrameTab(DWGKP_GKP_FRAMES, id);
end

function DWGKPDKPFrame_OnLoad(self)
	PanelTemplates_SetNumTabs(self, 5);
	PanelTemplates_SetTab(self, 1);
	self.UpdateFunc = DWGKPDKPFrame_Update;	
end

function DWGKPMemberFrameSort(key)
	GKP:SetCVar("sortkey", key);
	GKP:UpdateMemberView(classes);
end

function GKP:UpdateMemberView(classes)
	local curRaid = self:GetCurRaid();
	local index = 1;
	local numItemLines = 0;
	
	if (curRaid) then
		local data = self:GetMemberData(classes);
		numItemLines = #(data);
		local offset = (FauxScrollFrame_GetOffset(DWGKPDKPFrameMemberFrameScrollFrame) or 0) + 1;		
		local name, isOffline;
		local viewMod = self:InViewMod();

		for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
			if ( i <= numItemLines ) then
				-- TODO: 显示
				name = "DWGKPDKPFrameMemberFrameMemberList" .. index;
				_G[name].index = i;
				_G[name].data = data[i];
				-- 内容
				isOffline = not data[i].online;
				--local nameText = self:FormatClassName(data[i].name);
				local classText = isOffline and data[i].class or self:FormatClassName(data[i].class, data[i].name);
				data[i].starttime = data[i].starttime or self:GetTimeStamp();
				local timeText = strmatch(data[i].starttime, " (.+)$");
				local offtime = self:GetTimeText(data[i].offtime or 0);
				local class = curRaid.name2class[data[i].name];

				if (class) then
					_G[name.."Icon"]:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CHARACTERCREATE-CLASSES");
					_G[name.."Icon"]:SetTexCoord(unpack(CLASS_ICON_TCOORDS[class]));
				else
					_G[name.."Icon"]:SetTexture("Interface\\ICONS\\INV_Pet_Egbert");
					_G[name.."Icon"]:SetTexCoord(0, 1, 0, 1);
				end
				_G[name .. "Name"]:SetText(data[i].name);
				_G[name .. "Class"]:SetText(classText);
				_G[name .. "Percent"]:SetData("precent", isOffline);
				_G[name .. "Percent"]:SetDisable(viewMod);
				_G[name .. "Borrow"]:SetData("bro", isOffline);
				_G[name .. "Borrow"]:SetDisable(viewMod);
				_G[name .. "BeginTime"]:SetText(timeText);
				_G[name .. "OfflineTime"]:SetText(offtime);
				_G[name .. "Edit"]:SetData("bonus", isOffline);
				_G[name .. "Edit"]:SetDisable(viewMod);
				_G[name .. "Distribute"]:SetChecked(data[i].ischeck);
				if (isOffline) then
					_G[name .. "Name"]:SetTextColor(0.5, 0.5, 0.5);
					_G[name .. "Class"]:SetTextColor(0.5, 0.5, 0.5);
					_G[name .. "BeginTime"]:SetTextColor(0.5, 0.5, 0.5);
					_G[name .. "OfflineTime"]:SetTextColor(0.5, 0.5, 0.5);
				else
					_G[name .. "Name"]:SetTextColor(1.0, 0.82, 0);
					_G[name .. "Class"]:SetTextColor(1.0, 1.0, 1.0);
					_G[name .. "BeginTime"]:SetTextColor(1.0, 1.0, 1.0);
					_G[name .. "OfflineTime"]:SetTextColor(1.0, 1.0, 1.0);
				end
				if (viewMod) then
					_G[name .. "Distribute"]:Disable();
				else
					_G[name .. "Distribute"]:Enable();
				end
				-- TODO: 其他
				_G[name]:Show();
			else
				break;
			end
			index = index + 1;
		end		
		if (self:HasActiveRaid()) then
			DWGKPDKPFrameMemberFrameBeginRaidButton:Hide();
			DWGKPDKPFrameMemberFrameEndRaidButton:Show();
			DWGKPDKPFrameMemberFrameEndRaidButton:Enable();
			DWGKPDKPFrameMemberFrameAddMemberButton:Enable();
		else
			if (viewMod) then
				DWGKPDKPFrameMemberFrameBeginRaidButton:Disable();
			else
				DWGKPDKPFrameMemberFrameBeginRaidButton:Enable();
			end
			
			DWGKPDKPFrameMemberFrameBeginRaidButton:Show();			
			DWGKPDKPFrameMemberFrameEndRaidButton:Hide();
			DWGKPDKPFrameMemberFrameAddMemberButton:Disable();
		end
		DWGKPDKPFrameMemberFrameCreateRaidButton:Hide();		
		DWGKPDKPFrameCurRaidName:SetText(curRaid.info.name);
	else
		DWGKPDKPFrameMemberFrameCreateRaidButton:Show();
		if (GetNumRaidMembers() > 0 or self._DEBUG) then
			DWGKPDKPFrameMemberFrameCreateRaidButton:Enable();
		else
			DWGKPDKPFrameMemberFrameCreateRaidButton:Disable();
		end
		DWGKPDKPFrameMemberFrameBeginRaidButton:Disable();
		DWGKPDKPFrameMemberFrameBeginRaidButton:Show();		
		DWGKPDKPFrameMemberFrameEndRaidButton:Hide();
		DWGKPDKPFrameMemberFrameAddMemberButton:Disable();
		DWGKPDKPFrameCurRaidName:SetText(L["NoRaid"]);
	end	
	
	if (index <= ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			_G["DWGKPDKPFrameMemberFrameMemberList" .. i]:Hide();
		end
	end
	--FauxScrollFrame_Update(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 )
	FauxScrollFrame_Update(DWGKPDKPFrameMemberFrameScrollFrame, numItemLines, ITEMS_TO_DISPLAY, 30, nil, nil, nil, nil, nil, nil, true);
end

function GKP:UpdateItemView()
	local curRaid = self:GetCurRaid();
	local index = 1;
	local numItemLines = 0;
	--if (self:HasActiveRaid()) then
	if (curRaid) then
		local data = curRaid.itemList;
		numItemLines = #(data);
		local offset = (FauxScrollFrame_GetOffset(DWGKPDKPFrameItemFrameScrollFrame) or 0) + 1;
		local name;
		local viewMod = self:InViewMod();

		for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
			if ( i <= numItemLines ) then
				-- 显示
				name = "DWGKPDKPFrameItemFrameItemList" .. index;
				_G[name].index = i;
				_G[name].data = data[i];
				local r, g, b = GetItemQualityColor(data[i].rarity);
				-- 内容
				local playerName = self:FormatClassName(data[i].player);
				_G[name .. "ItemIcon"]:SetItem(data[i]);
				_G[name .. "ItemName"]:SetText(data[i].name);
				_G[name .. "ItemName"]:SetTextColor(r, g, b);
				_G[name .. "LootTime"]:SetText(data[i].time);
				_G[name .. "Looter"]:SetText(playerName);
				_G[name .. "UpsetPrice"]:SetData("precost");
				_G[name .. "UpsetPrice"]:SetDisable(viewMod);
				_G[name .. "LastPrice"]:SetData("cost");
				_G[name .. "LastPrice"]:SetDisable(viewMod);

				if (viewMod) then
					_G[name .. "Edit"]:Disable();
					_G[name .. "Delete"]:Disable();
				else
					_G[name .. "Edit"]:Enable();
					_G[name .. "Delete"]:Enable();
				end
				-- TODO: 其他
				_G[name]:Show();
			else
				break;
			end
			index = index + 1;
		end
		if (viewMod) then
			DWGKPDKPFrameItemFrameAddItemButton:Disable();
		else
			DWGKPDKPFrameItemFrameAddItemButton:Enable();
		end		
	else
		DWGKPDKPFrameItemFrameAddItemButton:Disable();
	end	

	if (index <= ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			_G["DWGKPDKPFrameItemFrameItemList" .. i]:Hide();
		end
	end	
	FauxScrollFrame_Update(DWGKPDKPFrameItemFrameScrollFrame, numItemLines, ITEMS_TO_DISPLAY, 30, nil, nil, nil, nil, nil, nil, true);
end

function GKP:UpdateEventView()
	local curRaid = self:GetCurRaid();
	local index = 1;
	local numItemLines = 0;
	--if (self:HasActiveRaid()) then
	if (curRaid) then
		local data = curRaid.eventList;
		numItemLines = #(data);
		local offset = (FauxScrollFrame_GetOffset(DWGKPDKPFrameEventFrameScrollFrame) or 0) + 1;
		local viewMod = self:InViewMod();
		local name;
		for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
			if ( i <= numItemLines ) then
				-- 显示
				name = "DWGKPDKPFrameEventFrameEventList" .. index;
				_G[name].index = i;
				_G[name].data = data[i];
				-- 内容
				local text = self:GetFormatEventString(data[i]);
				local playerName = self:FormatClassName(data[i].player);
				_G[name .. "Discrip"]:SetText(text);
				_G[name .. "InComing"]:SetText(data[i]["in"] or 0);
				_G[name .. "OutComing"]:SetText(data[i].out or 0);
				_G[name .. "PlayerName"]:SetText(playerName);
				
				-- 编辑和删除按钮
				if (data[i]["type"] and data[i]["type"] == "custom" and not viewMod) then
					_G[name.."Edit"]:Enable();
					_G[name.."Delete"]:Enable();
				else
					_G[name.."Edit"]:Disable();
					_G[name.."Delete"]:Disable();
				end
				_G[name]:Show();
			else
				break;
			end
			index = index + 1;
		end

		if (viewMod) then
			DWGKPDKPFrameEventFrameAddEventButton:Disable();
			DWGKPDKPFrameEventFrameReportForms:Disable();
		else
			DWGKPDKPFrameEventFrameAddEventButton:Enable();
			DWGKPDKPFrameEventFrameReportForms:Enable();
		end		
	else
		DWGKPDKPFrameEventFrameAddEventButton:Disable();
		DWGKPDKPFrameEventFrameReportForms:Disable();
	end	

	if (index <= ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			_G["DWGKPDKPFrameEventFrameEventList" .. i]:Hide();
		end
	end	
	FauxScrollFrame_Update(DWGKPDKPFrameEventFrameScrollFrame, numItemLines, ITEMS_TO_DISPLAY, 30, nil, nil, nil, nil, nil, nil, true);
end

function GKP:UpdateDistributeView()
	local curRaid = self:GetCurRaid();
	local index = 1;
	local numItemLines = 0;
	local maxLines = 0;

	--if (self:HasActiveRaid()) then
	if (curRaid) then
		local data = {};
		local sumPercent = 0;
		for i, v in ipairs(curRaid.memberList) do
			if (v["ischeck"] == 1) then
				sumPercent = sumPercent + v["precent"];
				tinsert(data, v);
			end
		end
		numItemLines = #(data);
		self:OnUpdateEvents();	-- 刷新
		local totalGold = curRaid.info.incoin - curRaid.info.outcoin;
		local perGold = totalGold/sumPercent;
		local offset = (FauxScrollFrame_GetOffset(DWGKPDKPFrameDistributeFrameScrollFrame) or 0) + 1;
		maxLines = ceil(numItemLines/4);
		local name, subIndex;	
		
		for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
			if ( i <=  maxLines) then
				-- 显示
				name = "DWGKPDKPFrameDistributeFrameDistributeList" .. index;
				-- 内容				
				for j=1, 4 do
					subIndex = (i-1)*4+j;
					if (subIndex<=numItemLines) then
						local playerName = self:FormatClassName(data[subIndex]["name"]);
						_G[name.."CheckButton"..j.."Text"]:SetText(playerName);
						_G[name.."CheckButton"..j].data = data[subIndex];
						if (data[subIndex]["checked"] == 1) then
							_G[name.."CheckButton"..j]:SetChecked(1);
						else
							_G[name.."CheckButton"..j]:SetChecked(0);
						end
						local goldText = floor(perGold*data[subIndex]["precent"]+data[subIndex]["bonus"]-data[subIndex]["bro"]);
						_G[name.."GoldText"..j]:SetText(goldText);
						_G[name.."CheckButton"..j]:Show();
					else
						_G[name.."CheckButton"..j]:Hide();
						_G[name.."GoldText"..j]:SetText("");
					end
				end
				
				_G[name]:Show();
			else
				break;
			end
			index = index + 1;
		end

		_G["DWGKPDKPFrameDistributeFrameIncomeInfo"]:SetText(L["IncomeInfo"]:format(curRaid.info.incoin, curRaid.info.outcoin, numItemLines));
	else
		_G["DWGKPDKPFrameDistributeFrameIncomeInfo"]:SetText(L["IncomeInfo"]:format(0, 0, 0));
	end
	
	if (index <= ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			_G["DWGKPDKPFrameDistributeFrameDistributeList" .. i]:Hide();
		end
	end

	FauxScrollFrame_Update(DWGKPDKPFrameDistributeFrameScrollFrame, maxLines, ITEMS_TO_DISPLAY, 30, nil, nil, nil, nil, nil, nil, true);
end

function GKP:FormatRaidTimeString(tex)
	local val = "--";
	if (tex and type(tex) == "string") then
		local m, d = strmatch(tex, "^%d+%-(%d+)%-(%d+)");		
		if (m and d) then
			local md = format("%02d月%02d日 ", m, d);			
			val = string.gsub(tex, "^.+ ", md);
		end
	end

	return val;
end

function GKP:UpdateRaidView()
	local curRaid = self:GetCurRaid();
	local data = {};	
	for k, v in pairs(self.db) do
		tinsert(data, v);
	end
	table.sort(data, function(a, b)
		return self:ParseTimeStamp(a.info.ctime) > self:ParseTimeStamp(b.info.ctime);
	end);
	local numItemLines = #(data);
	local offset = (FauxScrollFrame_GetOffset(DWGKPDKPFrameRaidFrameScrollFrame) or 0) + 1;
	local index = 1;
	local name;
	local viewMod = self:InViewMod();
	local r, g, b = self:GetRaidModColor();
	for i = offset,  offset + ITEMS_TO_DISPLAY - 1 do
		if ( i <= numItemLines ) then
			-- 显示
			name = "DWGKPDKPFrameRaidFrameRaidList" .. index;
			_G[name].index = i;
			_G[name].data = data[i].info;
			-- 内容			
			local sTime = self:FormatRaidTimeString(data[i].info.starttime);
			local eTime = self:FormatRaidTimeString(data[i].info.endtime);
			_G[name .. "Name"]:SetText(data[i].info.name);
			_G[name .. "StartTime"]:SetText(sTime);
			_G[name .. "EndTime"]:SetText(eTime);
			_G[name .. "AttendNum"]:SetText(data[i].info.distribute);
			-- TODO: 是否可用
			if (curRaid and not viewMod) then
				_G[name .. "Active"]:Disable();
				
			else
				_G[name .. "Active"]:Enable();
				
			end
			-- 高亮和显示			
			if (curRaid and curRaid.info.name == data[i].info.name and curRaid.info.ctime == data[i].info.ctime) then	
				_G[name .. "Name"]:SetTextColor(r, g, b);
				_G[name .. "StartTime"]:SetTextColor(r, g, b);
				_G[name .. "EndTime"]:SetTextColor(r, g, b);
				_G[name .. "AttendNum"]:SetTextColor(r, g, b);
				_G[name .. "Delete"]:Disable();
				_G[name .. "Edit"]:Enable();
				_G[name]:SetHighlight(true);
			else
				_G[name .. "Delete"]:Enable();
				_G[name .. "Edit"]:Disable();
				_G[name]:SetHighlight(false);			
				_G[name .. "Name"]:SetTextColor(1.0, 1.0, 1.0);
				_G[name .. "StartTime"]:SetTextColor(1.0, 1.0, 1.0);
				_G[name .. "EndTime"]:SetTextColor(1.0, 1.0, 1.0);
				_G[name .. "AttendNum"]:SetTextColor(1.0, 1.0, 1.0);
			end
			_G[name]:Show();
		else
			break;
		end
		index = index + 1;
	end
	
	local enableCreate = true;
	if (curRaid) then
		DWGKPDKPFrameCurRaidName:SetText(curRaid.info.name);
		DWGKPDKPFrameCurRaidName:SetTextColor(r, g, b);

		if (self:HasActiveRaid()) then
			DWGKPDKPFrameRaidFrameBeginRaidButton:Disable();
			DWGKPDKPFrameRaidFrameEndRaidButton:Enable();			
			--DWGKPDKPFrameRaidFrameCreateRaidButton:Enable();
		else
			if (viewMod) then
				DWGKPDKPFrameRaidFrameBeginRaidButton:Disable();
				--DWGKPDKPFrameRaidFrameCreateRaidButton:Enable();
			else
				DWGKPDKPFrameRaidFrameBeginRaidButton:Enable();
				--DWGKPDKPFrameRaidFrameCreateRaidButton:Disable();
				enableCreate = false;
			end
			
			DWGKPDKPFrameRaidFrameEndRaidButton:Disable();
		end		
	else
		DWGKPDKPFrameCurRaidName:SetText(L["NoRaid"]);
		DWGKPDKPFrameRaidFrameBeginRaidButton:Disable();
		DWGKPDKPFrameRaidFrameEndRaidButton:Disable();
	end

	if ((GetNumRaidMembers() > 0 or self._DEBUG) and enableCreate) then	
		DWGKPDKPFrameRaidFrameCreateRaidButton:Enable();
	else
		DWGKPDKPFrameRaidFrameCreateRaidButton:Disable();
	end

	if (index <= ITEMS_TO_DISPLAY) then
		for i = index, ITEMS_TO_DISPLAY do
			_G["DWGKPDKPFrameRaidFrameRaidList" .. i]:Hide();
		end
	end	
	FauxScrollFrame_Update(DWGKPDKPFrameRaidFrameScrollFrame, numItemLines, ITEMS_TO_DISPLAY, 30, nil, nil, nil, nil, nil, nil, true);
end

function GKPMemberFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 30, function() GKP:UpdateMemberView(); end);
end

function GKPItemFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 30, function() GKP:UpdateItemView(); end);
end

function GKPEventFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 30, function() GKP:UpdateEventView(); end);
end

function GKPDistributeFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 30, function() GKP:UpdateDistributeView(); end);
end

function GKPRaidFrame_OnScroll(self, offset)
	FauxScrollFrame_OnVerticalScroll(self, offset, 30, function() GKP:UpdateRaidView(); end);
end

-----------------
-- 活动名称
do	-- 活动BEGIN
local function initFunction()
	local info;
	for i, name in ipairs(DWGKP_MAP_DATA) do
		info = {};
		info.text = name;
		info.arg1 = name;
		info.func = function(self, arg1)
			local text = arg1;
			if (DWGKPRaidEditFrame.UserData and DWGKPRaidEditFrame.UserData["10man"] == 1) then
				text = text .. "-|cff00baff(10人";
			else
				text = text .. "-|cff00baff(25人"
			end
			if (DWGKPRaidEditFrame.UserData and DWGKPRaidEditFrame.UserData["hero"] == 1) then
				text = text .. "英雄)|r";
			else
				text = text .. "普通)|r";
			end
			DWGKPRaidEditFrameName:SetText(text);
		end
		UIDropDownMenu_AddButton(info);
	end
end

function DWGKPRaidEditHiddenFrame_OnLoad(self)
	UIDropDownMenu_Initialize(self, initFunction, "MENU");
end

function DWGKPRaidEditFrameDropdown_OnClick(self)
	ToggleDropDownMenu(nil, nil, DWGKPRaidEditFrameHiddenFrame);
	PlaySound("igMainMenuOptionCheckBoxOn");
end

function DWGKPRaidEdit_UpdaeName(self)
	local text = _G[self:GetName().."Name"]:GetText();
	if (self.UserData["10man"] == 1) then
		text = string.gsub(text, "%(25人", "(10人");
	else
		text = string.gsub(text, "%(10人", "(25人");
	end
	if (self.UserData["hero"] == 1) then
		text = string.gsub(text, "人普通%)", "人英雄)");		
	else
		text = string.gsub(text, "人英雄%)", "人普通)");
	end
	_G[self:GetName().."Name"]:SetText(text);
end

function DWGKPRaidEditFrame10Man_OnLoad(self)
	_G[self:GetName().."Text"]:SetText("10人模式");
	_G[self:GetName().."HitArea"]:SetWidth(80);
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	_G[self:GetName() .. "Text"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName() .. "Text"]:SetTextColor(1,0.85,0);
	_G[self:GetName() .. "Text"]:ClearAllPoints();
	_G[self:GetName() .. "Text"]:SetPoint("LEFT", self, "RIGHT", -2, 2);
end

function DWGKPRaidEditFrame10Man_OnClick(self)
	if (self:GetChecked() == 1) then
		self:GetParent().UserData["10man"] = 1;
	else
		self:GetParent().UserData["10man"] = 0;
	end
	
	DWGKPRaidEdit_UpdaeName(self:GetParent());
end

function DWGKPRaidEditFrameHero_OnLoad(self)
	_G[self:GetName().."Text"]:SetText("英雄难度");
	_G[self:GetName().."HitArea"]:SetWidth(80);
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	_G[self:GetName() .. "Text"]:SetFont(ChatFontNormal:GetFont(), 12);
	_G[self:GetName() .. "Text"]:SetTextColor(1,0.85,0);
	_G[self:GetName() .. "Text"]:ClearAllPoints();
	_G[self:GetName() .. "Text"]:SetPoint("LEFT", self, "RIGHT", -2, 2);
end

function DWGKPRaidEditFrameHero_OnClick(self)
	if (self:GetChecked() == 1) then
		self:GetParent().UserData["hero"] = 1;
	else
		self:GetParent().UserData["hero"] = 0;
	end
	DWGKPRaidEdit_UpdaeName(self:GetParent());
end

function DWGKPRaidEditFrameOkay_OnClick(self)
	local name = _G["DWGKPRaidEditFrameName"]:GetText();
	if (string.len(name)>0) then
		local curRaid = GKP:GetCurRaid();
		if (curRaid) then
			-- 编辑
			if (name ~= curRaid.info.name) then
				local craid = curRaid.info.name..curRaid.info.ctime;			
				local key = name .. curRaid.info.ctime;
				
				GKP.db[craid] = nil;			
				GKP.db[key] = curRaid;			
				GKP.db[key].info.name = name;	
				GKP:SetCurRaid(key);
			end
		else
			-- 新建
			GKP:CreateRaid(name);
		end
		
		curRaid = GKP:GetCurRaid();
		curRaid.info["10man"] = self:GetParent().UserData["10man"];
		curRaid.info["hero"] = self:GetParent().UserData["hero"];
		self:GetParent():Hide();
		PlaySound("igMainMenuOption");

		-- 刷新显示
		GKP:UpdateView();
	end	
end

function DWGKPRaidEditFrame_OnLoad(self)
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);
	self.UserData = {["10man"]=0, hero=0,text="",};
	self:RegisterForDrag("LeftButton");	
end

function DWGKPRaidEditFrame_OnShow(self)
	if (self.UserData and self.UserData.text and self.UserData.text ~= "") then
		_G[self:GetName().."Name"]:SetText(self.UserData.text);
		_G[self:GetName().."10Man"]:SetChecked(self.UserData["10man"]);
		_G[self:GetName().."Hero"]:SetChecked(self.UserData["hero"]);
	else
		_G[self:GetName().."Name"]:SetText("");
		_G[self:GetName().."10Man"]:SetChecked(0);
		_G[self:GetName().."Hero"]:SetChecked(0);
	end
end

function ShowDWGKPRaidEditFrame(data)
	DWGKPRaidEditFrame.UserData = data or {["10man"]=0, hero=0,text="",};
	DWGKPRaidEditFrame:Show();
	PlaySound("igMainMenuOpen");
end

function DWGKPCreateRaidButton_OnClick(self)
	GKP:EndRaid(true);
	ShowDWGKPRaidEditFrame();
end

function DWGKPBeginRaidButton_OnClick(self)
	GKP:BeginRaid();
	GKP:UpdateView();
end

function DWGKPEndRaidButton_OnClick(self)
	GKP:EndRaid();
	GKP:UpdateView();
end

function DWGKPRaidFrame_OnShow(self)
	GKP:UpdateView();
end
end	-- 活动END

--------------------
-- 收支界面 
do	-- 收支 BEGIN
function DWGKPEventEditFrame_OnLoad(self)
	self.type = "event";
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);
	self:RegisterForDrag("LeftButton");
end

function DWGKPEventEditFrame_OnShow(self)
	if (self.UserData) then
		_G[self:GetName().."Dscription"]:SetText(self.UserData["content"]);
		_G[self:GetName().."Income"]:SetText(self.UserData["in"] or "0");
		_G[self:GetName().."Outcome"]:SetText(self.UserData["out"] or "0");
		_G[self:GetName().."PlayerName"]:SetText(self.UserData["player"]);
	else
		_G[self:GetName().."Dscription"]:SetText("");
		_G[self:GetName().."Income"]:SetText("0");
		_G[self:GetName().."Outcome"]:SetText("0");
		_G[self:GetName().."PlayerName"]:SetText("");
	end
end

function DWGKPEventEditFrameOkay_OnClick(self)
	local frame = self:GetParent();
	local name = _G[frame:GetName().."Dscription"]:GetText();
	local curRaid = GKP:GetCurRaid();
	if (curRaid) then
		if (name:len()>0) then		
			if (DWGKPEventEditFrame.UserData) then
				-- 编辑
				frame.UserData["content"] = name;
				frame.UserData["in"] = _G[frame:GetName().."Income"]:GetText() and tonumber(_G[frame:GetName().."Income"]:GetText()) or 0;
				frame.UserData["out"] = _G[frame:GetName().."Outcome"]:GetText() and tonumber(_G[frame:GetName().."Outcome"]:GetText()) or 0;
				frame.UserData["player"] = _G[frame:GetName().."PlayerName"]:GetText() or "";				
			else
				-- 新建
				local tmp = {};
				tmp["content"] = name;
				tmp["in"] = _G[frame:GetName().."Income"]:GetText() and tonumber(_G[frame:GetName().."Income"]:GetText()) or 0;
				tmp["out"] = _G[frame:GetName().."Outcome"]:GetText() and tonumber(_G[frame:GetName().."Outcome"]:GetText()) or 0;
				tmp["player"] = _G[frame:GetName().."PlayerName"]:GetText() or "";
	
				tinsert(curRaid.customList, tmp);
			end
			self:GetParent():Hide();
			PlaySound("igMainMenuOption");
			
			-- 刷新显示
			GKP:OnUpdateEvents();
			GKP:UpdateView();
		else
			print("请输入收支描述信息");
		end
	end	
end

function ShowDWGKPEventEditFrame(data)
	DWGKPEventEditFrame.UserData = data or nil;
	DWGKPEventEditFrame:Show();
	PlaySound("igMainMenuOpen");
end

function DWGKPEventFrame_OnShow(self)
	GKP:OnUpdateEvents();
	GKP:UpdateView();
end

function DWGKPEventFrameAddEventButton_OnClick(self)
	ShowDWGKPEventEditFrame();
end

function DWGKPEventFrameReportForms_OnClick(self)
	GKP:ReportEventLog();
end

function  DWGKPEventFrameReportMod_OnClick(self)
	if (self:GetChecked() == 1) then
		GKP:SetCVar("reportMod", 1);
	else
		GKP:SetCVar("reportMod", 0);
	end
end

function  DWGKPEventFrameReportMod_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	GameTooltip:SetText(L["DWGKP"], 1, 1, 1);
	GameTooltip:AddLine(L["Report mod tips"]);
	GameTooltip:Show();
end

end	-- 收支 END
-------------------
-- 物品界面
do	-- BEGIN ITEM
function DWGKPItemFrame_OnShow(self)
	GKP:UpdateView();
end

function DWGKPItemFrameIgnorListButton_OnClick(self)
	-- TODO: 显示忽略物品列表
	LibStub("AceConfigDialog-3.0"):Open(L["DWGKP"]);
end

function DWGKPItemFrameAddItemButton_OnClick(self)
	ShowDWGKPItemEditFrame();
end

local function insertItemLink(text)
	local editbox = DWGKPItemEditFrameItemName;
	if editbox and editbox:IsVisible() and editbox:HasFocus() then
		editbox:Insert(text);
		return true;
	end
end

function DWGKPItemEditFrame_OnLoad(self)
	self.type = "item";
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);
	hooksecurefunc("ChatEdit_InsertLink", function(...) return insertItemLink(...) end);
	self:RegisterForDrag("LeftButton");
end

function DWGKPItemEditFrame_OnShow(self)
	if (self.data and self.data["link"]) then
		_G[self:GetName().."ItemName"]:SetText(self.data["link"] or "");
		_G[self:GetName().."PlayerName"]:SetText(self.data["player"] or "");
		_G[self:GetName().."ItemCount"]:SetText(self.data["count"] or "1");
	else
		_G[self:GetName().."ItemName"]:SetText("");
		_G[self:GetName().."PlayerName"]:SetText("");
		_G[self:GetName().."ItemCount"]:SetText("1");
	end	
end

function DWGKPItemEditFrame_OnReceiveDrag(self)
	local _type, id, info = GetCursorInfo();
	if (_type == "item") then
		_G[self:GetName().."ItemName"]:SetText(info);
		ClearCursor();
	end
end

function DWGKPItemEditFrameItemName_OnReceiveDrag(self)
	local _type, id, info = GetCursorInfo();
	if (_type == "item") then
		self:SetText(info);
		ClearCursor();
	end
end

function DWGKPItemEditFrameOkay_OnClick(self)
	local item = DWGKPItemEditFrameItemName:GetText();
	local playerName = DWGKPItemEditFramePlayerName:GetText();
	local itemcount = DWGKPItemEditFrameItemCount:GetText() or 1;
	local itemName, itemLink, itemRarity, _, _, _, _, _, _, itemTexture = GetItemInfo(itemLink);	
	if (itemName) then
		local frame = self:GetParent();
		if (frame.data) then
			frame.data["name"] = itemName;
			frame.data["link"] = itemLink;
			frame.data["icon"] = itemTexture;
			frame.data["rarity"] = itemRarity;
			frame.data["count"] = tonumber(itemcount);
		else
			GKP:AddItemInfo(itemLink, tonumber(itemcount), playerName);			
		end

		GKP:UpdateView();
		self:GetParent():Hide();
		PlaySound("igMainMenuOption");
	else
		DKP:debug("请填写正确的物品信息.");
	end
end

function ShowDWGKPItemEditFrame(data)
	DWGKPItemEditFrame.data = data or nil;
	DWGKPItemEditFrame:Show();
	PlaySound("igMainMenuOpen");
end
end
--------------------
-- 成员界面
do	-- 成员BEGIN
local function initFunction()
	local info;
	for i, name in ipairs(DWGKP_CLASS_DATA) do
		info = {};
		info.text = name;
		info.arg1 = name;
		info.func = function(self, arg1)			
			DWGKPMemberEditFrameClass:SetText(arg1);
		end
		UIDropDownMenu_AddButton(info);
	end
end

function DWGKPMemberEditHiddenFrame_OnLoad(self)
	UIDropDownMenu_Initialize(self, initFunction, "MENU");
end

function DWGKPMemberEditFrameDropdown_OnClick(self)
	ToggleDropDownMenu(nil, nil, DWGKPMemberEditFrameHiddenFrame);
	PlaySound("igMainMenuOptionCheckBoxOn");
end

function DWGKPRaidEditFrameDistribute_OnLoad(self)
	_G[self:GetName().."Text"]:SetFont(ChatFontNormal:GetFont(), 12);	
	_G[self:GetName().."Text"]:ClearAllPoints();
	_G[self:GetName().."Text"]:SetPoint("LEFT", self, "RIGHT", -1, 2);
	_G[self:GetName().."Text"]:SetText("参与金币分配");
end

function DWGKPRaidEditFrameDistribute_OnClick(self)
	-- TODO:
end

function DWGKPMemberEditFrameOkay_OnClick(self)
	local parent = self:GetParent();
	local name = _G[parent:GetName().."Name"]:GetText();
	local class = _G[parent:GetName().."Class"]:GetText();
	local checked = _G[parent:GetName().."Distribute"]:GetChecked();
	local curRaid = GKP:GetCurRaid();
	if (curRaid and name and GKP:CheckClass(class)) then
		local stime = GKP:GetTimeStamp();
		local memberInfo = GKP:GetCurDate("member", name);		
		memberInfo["ischeck"] = checked;
		memberInfo["checked"] = memberInfo["checked"] or 0;
		memberInfo["class"] = class;
		memberInfo["level"] = 80;
		memberInfo["precent"] = memberInfo["precent"] or 100;
		memberInfo["bro"] = memberInfo["bro"] or 0;
		memberInfo["bonus"] = memberInfo["bonus"] or 0;
		memberInfo["starttime"] = memberInfo["starttime"] or stime;
		memberInfo["endtime"] = memberInfo["endtime"] or nil;
		memberInfo["offtime"] = memberInfo["offtime"] or 0;
		memberInfo["online"] = memberInfo["online"] or false;
		GKP.RaidTracker_Online[name] = memberInfo["online"];
		curRaid.name2class[name] = DWGKP_CLASS_ENGLISH[class];
		
		parent:Hide();
		PlaySound("igMainMenuOption");
		GKP:UpdateView();
	end
end

function DWGKPMemberEditFrame_OnLoad(self)
	self.type = "member";
	_G[self:GetName().."Note"]:SetTextColor(0,0.68,1.0);	
	self:RegisterForDrag("LeftButton");
end

function DWGKPMemberEditFrame_OnShow(self)
	_G[self:GetName().."Name"]:SetText("");
	_G[self:GetName().."Class"]:SetText("");
	_G[self:GetName().."Distribute"]:SetChecked(1);
end

function ShowDWGKPEditMemberFrame()
	DWGKPMemberEditFrame:Show();
	PlaySound("igMainMenuOpen");
end

function DWGKPMemberFrame_OnShow(self)
	GKP:UpdateView();
end

function DWGKPMemberFrameBeginRaid_OnClick(self)
	GKP:BeginRaid();
	self:Hide();
	_G[self:GetParent():GetName().."EndRaidButton"]:Show();
	_G[self:GetParent():GetName().."EndRaidButton"]:Enable();
	-- 转移到活动页面
	PanelTemplates_SetTab(DWGKPDKPFrame, 5);
	DWGKPDKPFrame_Update(5);
	GKP:UpdateView();
end

function DWGKPMemberFrameEndRaid_OnClick(self)
	GKP:EndRaid();
	self:Disable();
	-- 转移到活动页面
	PanelTemplates_SetTab(DWGKPDKPFrame, 5);
	DWGKPDKPFrame_Update(5);
	GKP:UpdateView();
end

function DWGKPMemberFrameAddMember_OnClick(self)
	-- TODO: 添加成员
	ShowDWGKPEditMemberFrame();
end

function DWGKPMemberFrameCreateRaid_OnClick(self)
	GKP:EndRaid(true);
	ShowDWGKPRaidEditFrame();
end	

function DWGKPMemberFrameClassTile_OnLoad(self)
	DWGKPClassDropdownInit(self, function(classes)
		GKP:UpdateMemberView(classes);
	end);
end
end-- 成员END

---------------
-- 分配界面
function DWGKPDistributeFrame_OnShow(self)
	GKP:UpdateView();
end

---------------
-- 对外接口
function GKP:Toggle(switch)
	if (switch) then
		self:Enable();
	else
		self:Disable();
		DWGKPMainFrame:Hide();
	end
end

function GKP:SetLowLogItemQuality(key)
	if (DWGKP_QUALITY_LIST_MAP[key]) then
		self:SetCVar("itemQuality", DWGKP_QUALITY_LIST_MAP[key]);
	end
end

function GKP:SetdistributeGroup(key)
	if (DWGKP_DISTRIBUTE_LIST_MAP[key]) then
		self:SetCVar("defaultGroup", DWGKP_DISTRIBUTE_LIST_MAP[key]);
	end
end

function GKP:SetReportChannel(key)
	if (DWGKP_REPORT_CHANNEL[key]) then
		self:SetCVar("announceChannel", DWGKP_REPORT_CHANNEL[key]);
	end
end

function GKP:TogglePanel()
	if (DWGKPMainFrame:IsShown()) then
		DWGKPMainFrame:Hide();
	else
		DWGKPMainFrame:Show();
	end
end

function GKP:ToggleTitanButton(switch)
	if (switch) then
		self:SetCVar("showTian", true);
		dwAsynCall("Titan", "DWGKP_ShowTitanButton", true);
	else
		self:SetCVar("showTian", false);
		dwAsynCall("Titan", "DWGKP_ShowTitanButton", false);
	end	
end

function DWGKPHelpButton_OnClick(self)
	if (not LibStub("AceConfigDialog-3.0"):Close(L["DWGKPHELP"])) then
		LibStub("AceConfigDialog-3.0"):Open(L["DWGKPHELP"]);
	end	
end
