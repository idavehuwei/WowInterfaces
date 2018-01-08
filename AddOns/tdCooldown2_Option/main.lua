
local _G = _G;
local floor = floor;
local tonumber = tonumber;
local min = min;
local max = max;
local type = type;

local CreateFrame = CreateFrame;
local ColorPickerFrame = ColorPickerFrame;
local InterfaceOptions_AddCategory = InterfaceOptions_AddCategory;

local tCD = tdCooldown2;
local option = tCD.option;
local db = tCD.db;
local L = TDCOOLDOWN2_OPTION_LACALE;
local space = 0;
option.loaded = true;

function option:SetupFrame(frame, typ, val, func)
	frame.typ = typ;
	frame.val = val;
	frame.func = func;
	frame:Show();
end

function option:CreateOptions(text)
	local frame = CreateFrame("Frame", nil, UIParent);
	frame.name = text;
	frame.parent = "tdCooldown2";
	InterfaceOptions_AddCategory(frame);
	
	self:SetupFrame(frame);
	return frame
end

function option:CreateLabel(parent, text, point, rpoint, x, y)
	if parent and text then
		local label = parent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall");
		label:SetJustifyH("LEFT");
		label:SetHeight(18);
		label:SetText(text);
		label:SetPoint(point, parent, rpoint, x, y);
		return label;
	end
end

function option:CreatePanel(parent, text, is2, postion)
	local frame = CreateFrame("Frame", nil, parent);
	frame:SetBackdrop{
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		edgeSize = 16, tileSize = 16, tile = true, 
		insets = {left = 5, right = 5, top = 5, bottom = 5}
	}
	local p1, r1, x1, y1, p2, r2, x2, y2 = postion:match("^(%a+):(%a+):(\-?%d+):(\-?%d+)|(%a+):(%a+):(\-?%d+):(\-?%d+)$")
	
	frame:SetPoint(p1, parent, r1, x1, y1);
	frame:SetPoint(p2, parent, r2, x2, y2);
	
	frame:SetBackdropBorderColor(0.4, 0.4, 0.4);
	frame:SetBackdropColor(0.15, 0.15, 0.15, 0.5);
	
	frame.isleft = true;
	frame.is2 = is2;
	frame.lspace = 0;
	frame.rspace = 0;
	
	self:CreateLabel(frame, text, "BOTTOMLEFT", "TOPLEFT", 5, -2);
	self:SetupFrame(frame);
	return frame
end

function option:CreateCheckButton(parent, text, typ ,val, func)
	local frame = CreateFrame("CheckButton", nil, parent);
	frame:SetNormalTexture("Interface/Buttons/UI-CheckBox-Up");
	frame:SetPushedTexture("Interface/Buttons/UI-CheckBox-Down");
	frame:SetHighlightTexture("Interface/Buttons/UI-CheckBox-Highlight");
	frame:SetCheckedTexture("Interface/Buttons/UI-CheckBox-Check");
	frame:SetHitRectInsets(0, -100, 0, 0);
	frame:SetWidth(26);
	frame:SetHeight(26);
	
	frame:SetScript("OnClick", function(self)
		db[self.typ][self.val] = self:GetChecked();
		if self.func then self.func(self) end
	end)
	frame:SetScript("OnShow", function(self)
		self:SetChecked(db[self.typ][self.val]);
	end)
	
	if parent.isleft then
		frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 5, parent.lspace - 2);
		parent.lspace = parent.lspace - 19;
	else
		frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -160, parent.rspace - 2);
		parent.rspace = parent.rspace - 19;
	end
	if parent.is2 then
		parent.isleft = not parent.isleft;
	end

	self:CreateLabel(frame, text, "LEFT", "RIGHT", 0, 0);
	self:SetupFrame(frame, typ, val, func);
	return frame
end

function option:CreateSlider(parent, text, typ, val, func, minValue, maxValue, step)
	local frame = CreateFrame("Slider", nil, parent);
	frame:SetBackdrop{
		bgFile = "Interface/Buttons/UI-SliderBar-Background",
		edgeFile = "Interface/Buttons/UI-SliderBar-Border",
		edgeSize = 8, tileSize = 8, tile = true, 
		insets = {left = 3, right = 3, top = 6, bottom = 6}
	}
	frame:SetOrientation("HORIZONTAL");
	frame:SetHitRectInsets(0, 0, 0, 0);
	frame:SetThumbTexture("Interface/Buttons/UI-SliderBar-Button-Horizontal");
	frame:SetMinMaxValues(minValue * 1000, maxValue * 1000);
	frame:SetValueStep(step * 1000);
	frame:SetWidth(130);
	frame:SetHeight(17);
	
	local label = CreateFrame("EditBox", nil, frame);
	label:SetAutoFocus(nil);
	label:SetWidth(40); label:SetHeight(20);
	label:SetPoint("LEFT", frame, "RIGHT", 2, 0);
	label:SetBackdrop{
		bgFile = "Interface/ChatFrame/ChatFrameBackground",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		edgeSize = 14, tileSize = 20, tile = true, 
		insets = {left = 2, right = 2, top = 2, bottom = 2}
	}
	label:SetBackdropColor(0, 0, 0, 0.4);
	label:SetBackdropBorderColor(0.4, 0.4, 0.4);
	label:SetTextInsets(0, 0, 0, 0);
	label:SetFontObject("ChatFontNormal");
	label:SetJustifyH("CENTER");
	
	label:SetScript("OnEscapePressed", function(self)
		self:ClearFocus();
		local p = self:GetParent();
		self:SetText(db[p.typ][p.val]);
	end)
	label:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
		local p = self:GetParent();
		local minValue, maxValue = p:GetMinMaxValues();
		local value = tonumber(self:GetText());
		value = (value and value or db[p.typ][p.val]) * 1000;
		value = value < minValue and minValue or value;
		value = value > maxValue and maxValue or value;
		self:SetText(value / 1000);
		p:SetValue(value);
	end)
	frame.ValText = label;
	
	frame:SetScript("OnShow", function(self)
		self:SetValue(floor(db[self.typ][self.val] * 1000));
	end)
	frame:SetScript("OnValueChanged", function(self)
		local value = self:GetValue() / 1000;
		db[self.typ][self.val] = value;
		self.ValText:SetText(value);
		if self.func then self.func(self) end
	end)
	frame:EnableMouseWheel(true)
	frame:SetScript("OnMouseWheel", function(self, y)
		local value = self:GetValue();
		local minValue, maxValue = self:GetMinMaxValues();
		local step = self:GetValueStep();
		if y > 0 then
			value = value - step;
			value = max(value, minValue);
		else
			value = value + step;
			value = min(value, maxValue);
		end
		self:SetValue(value);
	end)
	
	if parent.isleft then
		frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, parent.lspace - 20);
		parent.lspace = parent.lspace - 28;
	else
		frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -50, parent.rspace - 20);
		parent.rspace = parent.rspace - 28;
	end
	if parent.is2 then
		parent.isleft = not parent.isleft;
	end

	self:CreateLabel(frame, text, "BOTTOMLEFT", "TOPLEFT", 0, -3);
	self:SetupFrame(frame, typ, val, func);
	return frame
end

function option:CreateEditBox(parent, text, typ, val, func, numonly, testfunc)
	local frame = CreateFrame("EditBox", nil, parent);
	frame:SetAutoFocus(nil);
	frame:SetWidth(170);
	frame:SetHeight(23);
	frame:SetBackdrop{
		bgFile = "Interface/ChatFrame/ChatFrameBackground",
		edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
		edgeSize = 14, tileSize = 20, tile = true, 
		insets = {left = 2, right = 2, top = 2, bottom = 2}
	}
	frame:SetBackdropColor(0, 0, 0, 0.4);
	frame:SetBackdropBorderColor(0.4, 0.4, 0.4);
	frame:SetTextInsets(8, 8, 0, 0);
	frame:SetFontObject("ChatFontNormal");
	frame.numonly = numonly;
	frame.testfunc = testfunc;
	
	frame:SetScript("OnShow", function(self)
		self:SetText(db[self.typ][self.val]);
	end);
	frame:SetScript("OnEscapePressed", function(self)
		self:SetText(db[self.typ][self.val]);
		self:ClearFocus();
	end)
	frame:SetScript("OnEnterPressed", function(self)
		self:ClearFocus();
		local value = self:GetText();
		value = self.numonly and (tonumber(value) or 0) or value;
		value = self.testfunc and self.testfunc(value) or value;
		db[self.typ][self.val] = value;
		self:SetText(value);
		if self.func then self.func(self) end
	end)
	
	if parent.isleft then
		frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 10, parent.lspace - 23);
		parent.lspace = parent.lspace - 38;
	else
		frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -48, parent.rspace - 23);
		parent.rspace = parent.rspace - 38;
	end
	if parent.is2 then
		parent.isleft = not parent.isleft;
	end
	
	self:CreateLabel(frame, text, "BOTTOMLEFT", "TOPLEFT", 1, -2);
	self:SetupFrame(frame, typ, val, func);
	return frame
end

local function DropDown_SetSelect(frame, value)
	if frame and frame:IsVisible() and value then
		ToggleDropDownMenu(1, nil, frame)
		UIDropDownMenu_SetSelectedValue(frame, value)
		ToggleDropDownMenu(1, nil, frame)
	end
end

function option:CreateDropdown(parent, text, typ, val, func, table)
	local frame = CreateFrame("Frame", "tdCooldown2OptionDropdown"..typ..val, parent, "UIDropDownMenuTemplate");
	UIDropDownMenu_SetWidth(frame, 152);

	UIDropDownMenu_Initialize(frame, function()
		local info = {};
		local _, v;
		for _, v in ipairs(table) do
			info.value = v.value
			info.text = v.text or v.value
			info.func = function(self)
				DropDown_SetSelect(self.owner, self.value);
				db[self.owner.typ][self.owner.val] = self.value;
				if self.owner.func then self.owner.func(self.owner) end
			end
			info.owner = frame;
			info.checked = nil
			UIDropDownMenu_AddButton(info, 1)
		end
	end);
	
	frame:SetScript("OnShow", function(self)
		DropDown_SetSelect(self, db[self.typ][self.val]);
	end);
	
	if parent.isleft then
		frame:SetPoint("TOPLEFT", parent, "TOPLEFT", -7, parent.lspace - 23);
		parent.lspace = parent.lspace - 40;
	else
		frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -50, parent.rspace - 23);
		parent.rspace = parent.rspace - 40;
	end
	if parent.is2 then
		parent.isleft = not parent.isleft;
	end
	
	self:CreateLabel(frame, text, "BOTTOMLEFT", "TOPLEFT", 17, -3)
	self:SetupFrame(frame, typ, val, func);
	return frame
end

local function QuitColor(issave)
	local r, g, b;
	if issave then
		r, g, b = ColorPickerFrame:GetColorRGB();
	else
		local c = ColorPickerFrame.previousValues;
		r, g, b = c.r, c.g, c.b;
	end
	local button = ColorPickerFrame.button;
	db[button.typ].r = r;
	db[button.typ].g = g;
	db[button.typ].b = b;
	ColorPickerFrame.button:GetNormalTexture():SetVertexColor(r, g, b);
	if button.func then button.func(button) end
end

function option:CreateColor(parent, text, typ)
	local frame = CreateFrame("Button", nil, parent);
	frame:SetNormalTexture("Interface/ChatFrame/ChatFrameColorSwatch");

	local bg = frame:CreateTexture(nil, "BACKGROUND");
	bg:SetWidth(14);
	bg:SetHeight(14);
	bg:SetTexture(1, 1, 1);
	bg:SetPoint("CENTER");

	frame:RegisterForClicks("LeftButtonUp")
	frame:SetScript("OnClick", function(self)
		if ColorPickerFrame:IsShown() then
			ColorPickerFrame:Hide();
		else
			local r, g, b = db[self.typ].r, db[self.typ].g, db[self.typ].b;
			ColorPickerFrame.button = self;
			ColorPickerFrame.hasOpacity = nil;
			ColorPickerFrame.previousValues = {r = r, g = g, b = b};
			
			ColorPickerFrame.func = function() QuitColor(true); end
			ColorPickerFrame.cancelFunc = function() QuitColor(); end
			
			ColorPickerFrame:SetColorRGB(r, g, b);
			
			ShowUIPanel(ColorPickerFrame);
		end
	end)
	frame:SetScript("OnShow", function(self)
		self:GetNormalTexture():SetVertexColor(db[self.typ].r, db[self.typ].g, db[self.typ].b);
	end)

	if text then
		frame:SetWidth(24);
		frame:SetHeight(24);
		if parent.isleft then
			frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 6, parent.lspace - 5);
			parent.lspace = parent.lspace - 20;
		else
			frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -50, parent.rspace - 5);
			parent.rspace = parent.rspace - 20;
		end
		if parent.is2 then
			parent.isleft = not parent.isleft;
		end
		self:CreateLabel(frame, text, "LEFT", "RIGHT", 0, 0);
	else
		frame:SetWidth(20);
		frame:SetHeight(20);
	end
	self:SetupFrame(frame, typ);
	return frame
end
