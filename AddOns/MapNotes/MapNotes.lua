-----------------------------------------------------------------------------------------
-- Map Notes ver 1.0
-- 日期: 2011-04-19
-- 作者: dugu
-- 描述: 简易的大地图标记插件
-- 多玩游戏网 (c) 版权所有
-----------------------------------------------------------------------------------------

MapNotes = LibStub("AceAddon-3.0"):NewAddon("MapNotes",  "AceEvent-3.0", "AceHook-3.0", "AceConsole-3.0");
local L =  LibStub("AceLocale-3.0"):GetLocale("MapNotes");
local GetCursorPosition = GetCursorPosition
MapNotes._DEBUG = false;
MapNotes.defaultIcon = 1;
local defaults = {profile = {}};
local sysicons = {
	[1] = {icon = "Interface\\WorldMap\\WorldMapPartyIcon"},
	[2] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0, tCoordRight = 0.25, tCoordTop = 0, tCoordBottom = 0.25}, -- Star
	[3] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.25, tCoordRight = 0.5, tCoordTop = 0, tCoordBottom = 0.25}, -- Circle
	[4] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.5, tCoordRight = 0.75, tCoordTop = 0, tCoordBottom = 0.25}, -- Diamond
	[5] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.75, tCoordRight = 1, tCoordTop = 0, tCoordBottom = 0.25}, -- Triangle
	[6] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0, tCoordRight = 0.25, tCoordTop = 0.25, tCoordBottom = 0.5}, -- Moon
	[7] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.25, tCoordRight = 0.5, tCoordTop = 0.25, tCoordBottom = 0.5}, -- Square
	[8] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.5, tCoordRight = 0.75, tCoordTop = 0.25, tCoordBottom = 0.5}, -- Cross
	[9] = {icon = "Interface\\TargetingFrame\\UI-RaidTargetingIcons", tCoordLeft = 0.75, tCoordRight = 1, tCoordTop = 0.25, tCoordBottom = 0.5}, -- Skull
	[10] = {icon = "Interface\\AddOns\\MapNotes\\icons\\Mark_Daily"},
	[11] = {icon = "Interface\\Minimap\\Tracking\\Auctioneer"},
	[12] = {icon = "Interface\\Minimap\\Tracking\\Banker"},
	[13] = {icon = "Interface\\Minimap\\Tracking\\BattleMaster"},
	[14] = {icon = "Interface\\Minimap\\Tracking\\FlightMaster"},
	[15] = { icon = "Interface\\Minimap\\Tracking\\Innkeeper"},
	[16] = {icon = "Interface\\Minimap\\Tracking\\Mailbox"},
	[17] = {icon = "Interface\\Minimap\\Tracking\\Repair"},
	[18] = {icon = "Interface\\AddOns\\MapNotes\\icons\\Mark_Obj"},
	[19] = {icon = "Interface\\Minimap\\Tracking\\StableMaster"},
	[20] = {icon = "Interface\\Minimap\\Tracking\\Class"},
	[21] = {icon = "Interface\\Minimap\\Tracking\\Profession"},
	[22] = {icon = "Interface\\Minimap\\Tracking\\TrivialQuests"},
	[23] = { icon = "Interface\\Minimap\\Tracking\\Ammunition"},
	[24] = {icon = "Interface\\Minimap\\Tracking\\Food"},
	[25] = {icon = "Interface\\Minimap\\Tracking\\Poisons"},
	[26] = {icon = "Interface\\Minimap\\Tracking\\Reagents"},	
	[27] = {icon = "Interface\\AddOns\\MapNotes\\icons\\Mob"},	
};

local function initEditNoteMenu(this, level)
	local self = MapNotes;
	local info = {};
	info.text = L["Edit Note"];
	info.func = function(this, arg1)
		self:OpenEditNoteFrame(self.CurrentIndex);
	end
	UIDropDownMenu_AddButton(info, level);

	info = {};
	info.text = "";
	info.isTitle = 1;
	UIDropDownMenu_AddButton(info, level);

	info = {};
	info.text = L["Delete Note"];
	info.func = function(this, arg1)
		self:DeleteNote(self.CurrentIndex);
	end
	UIDropDownMenu_AddButton(info, level);

	info = {};
	info.text = "";
	info.isTitle = 1;
	UIDropDownMenu_AddButton(info, level);

	info = {};
	info.text = L["Close"];
	info.func = function(this, arg1)
		CloseDropDownMenus();
	end
	UIDropDownMenu_AddButton(info, level);
end

function MapNotes:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("MapNoteInfo", defaults, true);
	self.EnableNote = true;
	self.noteIndex = 0;
	self.maxNote = 0;
	self.lastmapName = "";
	self:RawHookScript(WorldMapButton, "OnMouseUp", "WMF_OnClick");
	self:SecureHookScript(WorldMapFrame, "OnUpdate", "WMF_OnUpdate");
	if (not WorldMapFrame:HasScript("OnShow")) then
		WorldMapFrame:SetScript("OnShow", function(this)
			self:WMF_OnShow();
		end);
	else
		self:SecureHookScript(WorldMapFrame, "OnShow", "WMF_OnShow");
	end
	WorldMapPlayer:SetScript("OnMouseDown", function(this, button)
		self:WMF_OnClick(this, button);
	end);
	self.CurrentIndex = 0
	self.lastEditIndex = nil;
	self.dropdownFrame = CreateFrame("Frame", "MapNotesNodeDropDown", WorldMapFrame, "UIDropDownMenuTemplate");
	self.dropdownFrame:SetPoint("TOP", "WorldMapPositioningGuide", "TOP", -250, 200);
	UIDropDownMenu_Initialize(self.dropdownFrame, initEditNoteMenu, "MENU");
	self.dropdownFrame:Hide();
	
	self:CreateEditNoteFrame();

	self:RegisterChatCommand("mark", "MarkProcessorFunc")
end

function MapNotes:OnEnable()
	--self.EnableNote = true;	
end

function MapNotes:OnDisable()
	--self.EnableNote = false;
end

function MapNotes:Toggle(switch)
	if (switch) then
		self.EnableNote = true;
	else
		self.EnableNote = false;	
	end
end

function MapNotes:debug(msg)
	if (self._DEBUG) then
		print(L["MapNotes"]..":", msg);
	end
end

function MapNotes:getn(t)
	local n = 0;
	for k, v in pairs(t) do
		n = n +1;
	end

	return n;
end

function MapNotes:MarkProcessorFunc(pos, title, note)	
	assert(pos);
	local x, y;
	if (pos:find("(%d+)%s-,%s-(%d+)")) then
		x, y = pos:match("(%d+)%s-,%s-(%d+)");
	end	
	
	if (x and y) then
		local title = (type(title) == "string") and title or nil;
		local note = (type(note) == "string") and note or nil;
		
		x, y = tonumber(x), tonumber(y);
		self:AddNote(title, note, nil, x, y);
	end	
end

function MapNotes:WMF_OnShow(frame)	
	self.lastmapName = "";
	if (self.EnableNote) then
		text = L["MapTip"];
		WorldMapMagnifyingGlassButton:SetText(text);
		WorldMapMagnifyingGlassButton:Show()
	end
end

function MapNotes:WMF_OnClick(frame, button)	
	if (self.EnableNote and IsControlKeyDown() and button == "LeftButton") then
		local x, y = self:GetCursorCoord();
		local mapName = self:GetCurrentMapName();

		if (self.lastEditIndex) then
			self:DeleteNote(self.lastEditIndex);
			self.lastEditIndex = nil;
		end
		
		if (x and y and mapName) then			
			if (not self.db.profile[mapName]) then
				self.db.profile[mapName] = {};
			end

			local index = self:AddNote(nil, nil, nil, x, y);
			self.lastEditIndex = index;
			self:OpenEditNoteFrame(index);
		end
	else
		if (frame == WorldMapButton) then
			self.hooks[frame].OnMouseUp(frame, button);
		end		
	end
end

function MapNotes:WMF_OnUpdate(frame)
	self:UpdateNotes();
end

function MapNotes:AddNote(title, note, icon, x, y)
	local mapName = self:GetCurrentMapName();
	if (mapName and x and y) then
		if (not self.db.profile[mapName]) then
			self.db.profile[mapName] = {};
		end
		
		local index = #(self.db.profile[mapName]) + 1;
		table.insert(self.db.profile[mapName], {["title"] = (title or L["WoWBoxNote"]..index), ["note"] = (note or ""), ["icon"] = (icon or self.defaultIcon), ["x"] = x, ["y"] = y});
		self:UpdateNotes(true);
		return index;
	end

	return nil;
end

function MapNotes:DeleteNote(index)
	local mapName = self:GetCurrentMapName();
	if (mapName and self.db.profile[mapName] and self.db.profile[mapName][index]) then
		table.remove(self.db.profile[mapName], index);
		self:UpdateNotes(true);
	end
end

function MapNotes:EditNote(index, title, note, icon)
	local mapName = self:GetCurrentMapName();
	if (mapName and self.db.profile[mapName] and self.db.profile[mapName][index]) then
		self.db.profile[mapName][index]["title"] = title or self.db.profile[mapName][index]["title"];
		self.db.profile[mapName][index]["note"] = note or self.db.profile[mapName][index]["note"];
		self.db.profile[mapName][index]["icon"] = icon or self.db.profile[mapName][index]["icon"];

		self:UpdateNotes(true);
	end
end

function MapNotes:GetNoteButton(index)	
	local button = _G["MapteNotesButton"..index];
	if (not button) then
		self.maxNote = index;
		button = CreateFrame("Button", "MapteNotesButton"..index, WorldMapDetailFrame);
		button:SetWidth(16);
		button:SetHeight(16);
		button:EnableMouse(true);
		button.icon = button:CreateTexture(nil, "ARTWORK");
		button.icon:SetAllPoints(button);
		button:SetHighlightTexture("Interface\\AddOns\\MapNotes\\icons\\NodeHighlight", "ADD");
		button:SetFrameLevel(button:GetFrameLevel() + 2);
		button:RegisterForClicks("RightButtonUp");
		button:SetScript("OnEnter", function(this)			
			if (this.title) then
				local cx1, cy1 = this:GetCenter(); 
				local cx2 = this:GetParent():GetCenter();
				if ( cx1 > cx2 ) then
					MapNotesTooltip:SetOwner(this, "ANCHOR_LEFT");
				else 
					MapNotesTooltip:SetOwner(this, "ANCHOR_RIGHT"); 
				end 
				MapNotesTooltip:AddLine(this.title);
				if (this.note and string.len(this.note) > 0) then
					MapNotesTooltip:AddLine(this.note, 1, 1, 1);
				end
				MapNotesTooltip:AddLine(format(L["Coordinate"]..": %.1f, %.1f", this.x, this.y), 0.7, 0.7, 0.7);
				MapNotesTooltip:Show();
			end
		end);
		button:SetScript("OnLeave", function(this)
			MapNotesTooltip:Hide();
		end);
		button:SetScript("OnClick", function(this)
			-- TODO: 点击编辑、删除
			self.CurrentIndex = this:GetID();
			ToggleDropDownMenu(nil, nil, MapNotesNodeDropDown, "cursor", 0, 0);
			PlaySound("igMainMenuOptionCheckBoxOn");
		end);
	end

	button:SetID(index);
	return button;
end

function MapNotes:GetCursorCoord()
	local left, top = WorldMapDetailFrame:GetLeft(), WorldMapDetailFrame:GetTop();
	local width, height = WorldMapDetailFrame:GetWidth(), WorldMapDetailFrame:GetHeight();
	local scale = WorldMapDetailFrame:GetEffectiveScale();

	local x, y = GetCursorPosition();
	x = x/scale;
	y = y/scale;
	local cx = (x - left) / width;
	local cy = (top - y) / height;

	if cx < 0 or cx > 1 or cy < 0 or cy > 1 then
		return;
	end
	
	return cx*100, cy*100;
end

function MapNotes:GetPointXY(x, y)
	local width = WorldMapDetailFrame:GetWidth();
	local height = WorldMapDetailFrame:GetHeight();
	return floor(width*x/100), -floor(height*y/100); 
end

function MapNotes:MarkNote(index, title, note, icon, x, y)
	if (not x and not y) then
		local mapName = self:GetCurrentMapName();
		if (not mapName) then
			return;
		end
		local info = self.db.profile[mapName][index];
		title, note, icon, x, y = info.title, info.note, info.icon, info.x, info.y;
	end
	
	local texture = icon;
	local texcoord = nil;
	if (type(icon) == "number") then
		local info = sysicons[icon];
		texture = info.icon;
		if (info.tCoordLeft) then
			texcoord = {info.tCoordLeft, info.tCoordRight, info.tCoordTop, info.tCoordBottom};
		end
	end
	local button = self:GetNoteButton(index);
	button.title = title;
	button.note = note;
	button.icon:SetTexture(texture);
	if (texcoord) then
		button.icon:SetTexCoord(texcoord[1], texcoord[2], texcoord[3], texcoord[4]);
	else
		button.icon:SetTexCoord(0, 1, 0, 1);
	end
	button.x = x;
	button.y = y;
	
	local cx, cy = self:GetPointXY(x, y);
	button:ClearAllPoints();
	button:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", cx, cy);
	button:Show();

	return button;
end

function MapNotes:HideNote(index)
	local button = self:GetNoteButton(index);
	button:Hide();
end

function MapNotes:HideOtherNotes()
	local index = self.noteIndex;
	local button = _G["MapteNotesButton"..index];
	while (button) do
		self:HideNote(index);
		index = index + 1;
		button = _G["MapteNotesButton"..index];
	end	
end

function MapNotes:HideAllNotes()
	local index = 1;
	local button = _G["MapteNotesButton"..index];
	while (button) do
		self:HideNote(index);
		index = index + 1;
		button = _G["MapteNotesButton"..index];
	end
end

function MapNotes:UpdateNotes(force)
	self.noteIndex = 0;

	local mapName = self:GetCurrentMapName();
	if (mapName) then
		if (mapName ~= self.lastmapName or force) then
			if (mapName ~= self.lastmapName) then
				self.lastmapName = mapName;
				self.editFrame:Hide();
				CloseDropDownMenus();
			end

			if (self.EnableNote) then
				local count = 0;
				if (self.db.profile[mapName]) then
					count = #(self.db.profile[mapName]);
					for i=1, count do
						if (self.db.profile[mapName][i]) then
							local v = self.db.profile[mapName][i];
							self:MarkNote(i, v.title, v.note, v.icon, v.x, v.y);
						end
					end
				end
				self.noteIndex = count+1;
			end

			self:HideOtherNotes();
		end
	else
		self.lastmapName = nil;
		self:HideAllNotes();
	end
end

function MapNotes:GetCurrentMapName()
	local zoneIndex = GetCurrentMapZone();
	if (zoneIndex > 0) then
		local name = select(zoneIndex, GetMapZones(GetCurrentMapContinent()));
		return name;
	end
	return nil;
end

-------------------------------------
-- GUI
function MapNodeIcon_OnLoad(self)
	local texture = _G[self:GetName().."Icon"];	
	local info = sysicons[self:GetID()];
	texture:SetTexture(info.icon);
	if (info.tCoordLeft) then
		texture:SetTexCoord(info.tCoordLeft, info.tCoordRight, info.tCoordTop, info.tCoordBottom);
	end
	self:SetFrameLevel(self:GetFrameLevel()+1);
end

function MapNodeIconButton_OnClick(self, button)
	for i=1, #sysicons do
		local button = _G["MapNotesEditFrameIconNode"..i];
		button:SetChecked(nil);
	end	

	self:GetParent().icon = self:GetID();
	self:SetChecked(true);
end

function MapNotes:CreateEditNoteFrame()
	-- 框架背景
	local frame = CreateFrame("Frame", "MapNotesEditFrame", WorldMapDetailFrame);
	frame:SetWidth(246);
	frame:SetHeight(300);
	frame:SetPoint("CENTER");
	frame:EnableMouse(true);
	frame:SetBackdrop({
		bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
		edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
		tile = true, 
		tileSize = 32, 
		edgeSize = 32, 
		insets = { left = 11, right = 12, top = 12, bottom = 11 }
	});
	
	frame.head = frame:CreateTexture("MapNotesEditFrameHead", "BORDER");
	frame.head:SetWidth(256);
	frame.head:SetHeight(64);
	frame.head:SetPoint("TOP", frame, "TOP", 0, 14);
	frame.head:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header");
	frame.headText = frame:CreateFontString("MapNotesEditFrameHeadText", "ARTWORK", "GameFontNormal");
	frame.headText:SetPoint("TOP", frame.head, "TOP", 0, -12);
	frame.headText:SetText(L["MapNotes"]);
	-- 名称
	frame.titleText = frame:CreateFontString("MapNotesEditFrameTitleText", "ARTWORK", "GameFontNormal");
	frame.titleText:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -35);
	frame.titleText:SetJustifyH("LEFT")
	frame.titleText:SetText(L["Title"]);
	
	frame.titleEdit = CreateFrame("EditBox", "MapNotesEditFrameTitleEditBox", frame);
	frame.titleEdit:SetWidth(180);
	frame.titleEdit:SetHeight(34);
	frame.titleEdit:SetAutoFocus(false);
	frame.titleEdit:SetBackdrop({
		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile="Interface\\Glues\\Common\\Glue-Tooltip-Border", 
		tile = true, 
		tileSize = 16, 
		edgeSize = 16, 
		insets = { left = 10, right = 5, top = 4, bottom = 9 }
	});	
	frame.titleEdit:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	frame.titleEdit:SetBackdropColor(0.1, 0.1, 0.1, 0.8);
	frame.titleEdit:SetPoint("TOPLEFT", frame, "TOPLEFT", 48, -28);
	frame.titleEdit:SetFontObject("ChatFontNormal");
	frame.titleEdit:SetTextInsets(12, 5, 0, 5);
	frame.titleEdit:SetScript("OnEnterPressed", function(this)
		self:AffirmEditNote();
	end);
	frame.titleEdit:SetScript("OnTabPressed", function(this)
		frame.noteScrollFrame.editbox:SetFocus()
	end);
	frame.titleEdit:SetScript("OnEditFocusLost", function(this)		
		this:HighlightText(0, 0);
	end);
	frame.titleEdit:SetScript("OnEditFocusGained", function(this)
		this:HighlightText(0, -1);
	end);
	frame.titleEdit:SetScript("OnEscapePressed", function(this)
		EditBox_ClearFocus(this);
	end);
	-- 注释
	frame.noteText = frame:CreateFontString("MapNotesEditFrameNoteText", "ARTWORK", "GameFontNormal");
	frame.noteText:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -62);
	frame.noteText:SetJustifyH("LEFT")
	frame.noteText:SetText(L["Notes"]);

	frame.notebg = CreateFrame("Frame", "MapNotesEditFrameNoteBackground", frame);
	frame.notebg:SetWidth(206);
	frame.notebg:SetHeight(80);
	frame.notebg:SetBackdrop({
		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile="Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, 
		tileSize = 16, 
		edgeSize = 16, 
		insets = { left = 5, right = 5, top = 4, bottom = 5 }
	});
	frame.notebg:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	frame.notebg:SetBackdropColor(0.1, 0.1, 0.1, 0.8);
	frame.notebg:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -80);

	frame.noteScrollFrame = CreateFrame("ScrollFrame", "MapNotesEditFrameNoteScrollFrame", frame.notebg, "UIPanelScrollFrameTemplate");
	frame.noteScrollFrame:SetWidth(171);
	frame.noteScrollFrame:SetHeight(72);	
	frame.noteScrollFrame:SetPoint("TOPLEFT", frame.titleEdit, "BOTTOMLEFT", -20, -23);
	frame.noteScrollFrame.editbox = CreateFrame("EditBox", "MapNotesEditFrameNoteScrollFrameEditBox", frame.noteScrollFrame);
	frame.noteScrollFrame.editbox:SetWidth(178);
	frame.noteScrollFrame.editbox:SetHeight(85);
	frame.noteScrollFrame.editbox:SetMultiLine(true);
	frame.noteScrollFrame.editbox:SetMaxLetters(160);
	frame.noteScrollFrame.editbox:SetAutoFocus(false);
	frame.noteScrollFrame.editbox:SetFrameLevel(frame.noteScrollFrame.editbox:GetFrameLevel()+5);
	frame.noteScrollFrame.editbox:SetFontObject("ChatFontNormal");
	frame.noteScrollFrame.editbox:SetPoint("TOPLEFT", frame.noteScrollFrame, "TOPLEFT", 10, 0);
	frame.noteScrollFrame.editbox:SetScript("OnTextChanged", function(this)
		local scrollBar = _G[this:GetParent():GetName().."ScrollBar"];
		this:GetParent():UpdateScrollChildRect();
		local min, max = scrollBar:GetMinMaxValues();
		if ( max > 0 and (this.max ~= max) ) then
			this.max = max;
			scrollBar:SetValue(max);
		end
	end);
	frame.noteScrollFrame.editbox:SetScript("OnTabPressed", function(this)
		frame.titleEdit:SetFocus();
	end);
	frame.noteScrollFrame.editbox:SetScript("OnEditFocusGained", function(this)
		this:HighlightText(0, -1);
	end);
	frame.noteScrollFrame.editbox:SetScript("OnEditFocusLost", function(this)
		this:HighlightText(0, 0);
	end);
	frame.noteScrollFrame.editbox:SetScript("OnEscapePressed", function(this)
		EditBox_ClearFocus(this);		
	end);
	
	frame.noteScrollFrame:SetScrollChild(frame.noteScrollFrame.editbox);
	-- 图标选择
	frame.iconbg = CreateFrame("Frame", "MapNotesEditFrameIconBackground", frame);
	frame.iconbg:SetWidth(206);
	frame.iconbg:SetHeight(70);
	frame.iconbg:SetBackdrop({
		bgFile = "Interface/Tooltips/UI-Tooltip-Background",
		edgeFile="Interface/Tooltips/UI-Tooltip-Border", 
		tile = true, 
		tileSize = 16, 
		edgeSize = 16, 
		insets = { left = 5, right = 5, top = 4, bottom = 5 }
	});
	frame.iconbg:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
	frame.iconbg:SetBackdropColor(0.1, 0.1, 0.1, 0.8);
	frame.iconbg:SetPoint("TOPLEFT", frame.notebg, "BOTTOMLEFT", 0, -8);
	-- TODO: 图标选项
	frame.icons = {};
	for i=1, #sysicons do
		frame.icons[i] = CreateFrame("CheckButton", "MapNotesEditFrameIconNode"..i, frame, "MapNodeIconTemplate");
		frame.icons[i]:SetID(i);
		MapNodeIcon_OnLoad(frame.icons[i]);
		if (i == 1) then
			frame.icons[i]:SetPoint("TOPLEFT", frame.iconbg, "TOPLEFT", 12, -9);
		elseif (i%9 == 1) then
			frame.icons[i]:SetPoint("TOPLEFT", frame.icons[i-9], "BOTTOMLEFT", 0, -3);
		else
			frame.icons[i]:SetPoint("LEFT", frame.icons[i-1], "RIGHT", 5, 0);
		end
	end
	-- 确认取消按钮
	frame.okayButton = CreateFrame("Button", "MapNotesEditFrameOkay", frame, "UIPanelButtonTemplate");
	frame.okayButton:SetWidth(90);
	frame.okayButton:SetHeight(23);
	frame.okayButton:SetText(L["Okay"]);
	frame.okayButton:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 28, 22);
	frame.okayButton:SetScript("OnClick", function(button)
		self:AffirmEditNote();
	end);

	frame.cancelButton = CreateFrame("Button", "MapNotesEditFrameCancel", frame, "UIPanelButtonTemplate");
	frame.cancelButton:SetWidth(90);
	frame.cancelButton:SetHeight(23);
	frame.cancelButton:SetText(L["Cancel"]);
	frame.cancelButton:SetPoint("LEFT", frame.okayButton, "RIGHT", 5, 0);
	frame.cancelButton:SetScript("OnClick", function(button)
		self:CancelEditNote();
	end);

	frame:SetFrameLevel(frame:GetFrameLevel()+2);
	frame:Hide();

	self.editFrame = frame;
end

function MapNotes:OpenEditNoteFrame(index)	
	local mapName = self:GetCurrentMapName();
	local info = self.db.profile[mapName][index];
	local x, y = info.x, info.y;
	local bX, bY = self:GetPointXY(x, y);
	local cX, cY = WorldMapDetailFrame:GetWidth()/2, WorldMapDetailFrame:GetHeight()/2;
	
	local anchor1, anchor2, dx, dy;
	if (bX > cX) then
		anchor1 = "RIGHT";
		dx = -4;
	else
		anchor1 = "LEFT";
		dx = 4;
	end

	if (abs(bY) > cY) then
		anchor2 = "BOTTOM";
		dy = 4;
	else
		anchor2 = "TOP";
		dy = -4;
	end
	
	CloseDropDownMenus();
	self.editFrame.index = index;	
	self.editFrame.titleEdit:SetText(info.title);
	self.editFrame.noteScrollFrame.editbox:SetText(info.note);
	local checkID = 1;
	if (type(info.icon) == "number") then
		checkID = info.icon;
	end
	self.editFrame.icons[checkID]:Click();
	self.editFrame:ClearAllPoints();
	self.editFrame:SetPoint(anchor2..anchor1, WorldMapDetailFrame, "TOPLEFT", bX+dx, bY+dy);	
	self.editFrame:Show();
	self.editFrame.titleEdit:SetFocus();
end

function MapNotes:AffirmEditNote()
	local title = self.editFrame.titleEdit:GetText();
	if (string.len(title:match("[^%s]+") or "") <= 0) then
		title = L["WoWBoxNote"] .. self.editFrame.index;
	end
	local note = self.editFrame.noteScrollFrame.editbox:GetText();
	local icon = self.editFrame.icon;
	self:EditNote(self.editFrame.index, title, note, icon);
	self.lastEditIndex = nil;
	self.editFrame:Hide();
end

function MapNotes:CancelEditNote()
	if (self.lastEditIndex) then
		self:DeleteNote(self.editFrame.index);
		self.lastEditIndex = nil;
	end
	
	self.editFrame:Hide();
end

------------------------------------------------
-- 测试示例
--[[
do
local data = {};
for i=1, 10 do
	tinsert(data, {title = L["MapNotes"]..i, note = "地图标记注释"..i, icon = "Interface\\WorldMap\\WorldMapPartyIcon", x=20+i*4, y=20+i*5});
end

function MN_TEST()
	local self = MapNotes;
	local mapName = self:GetCurrentMapName();
	if (mapName and not self.db.profile[mapName]) then
		self.db.profile[mapName] = data;
	end

	self:UpdateNotes();
end
end
]]