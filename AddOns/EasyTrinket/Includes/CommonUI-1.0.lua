--------------------------------------------------------------------------
-- CommonUI-1.0.lua
--------------------------------------------------------------------------

-- This library makes it easy to create option frames & sub controls with professional
-- lookings and extra capabilities. It provides the following standard widgets:

-- 1, Option-dialog frame
-- 2, Press-button
-- 3, Check button
-- 4, Radio button group (Automatically single-selection handled)
-- 5, Edit box
-- 6, Slider
-- 7, Combo box
-- 8, List box
-- 9, Gradient status bar

--------------------------------------------------------------------------
-- Abin (abinn32@yahoo.com), 23/1/2009
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- Special features:
--------------------------------------------------------------------------

-- 1, Text highlighting when mouse-over(for all controls)
-- 2, Enable/disable capabilities(for all controls)
-- 3, Grey out when disabled(for all controls)
-- 4, Precise hit-rect inset(for check buttons and radio buttons)
-- 5, Automatic single-selection(for radio buttons)
-- 6, And much more...

--------------------------------------------------------------------------
-- API Documentation
--------------------------------------------------------------------------

-- Dialog = UICreateDialogFrame("name" , parent [, "titleText" [, "style" [, useSmallFont [, "button1" [, "button2" [, ...]]]]]])

-- "name": [STRING] -- Dialog frame name.
-- parent: [FRAME] -- Parent frame.
-- "titleText": [STRING] -- Dialog title text.
-- "style": [STRING] -- Frame style, ("TitleDialog" | "Dialog" | "Tooltip" | "ChildPage"), see "Dialog styles" section for details.
-- useSmallFont: [BOOLEAN] -- Whether to use small font.
-- "button1", "button2", ..., "buttonN": [STRING] -- Built-in buttons to be created in left-to-right order, see "Built-in operation buttons" section for details.

--------------------------------------------------------------------------
-- Dialog styles (not case-sensitive)
--------------------------------------------------------------------------

-- "TitleDialog": Frame with dialog appearance and a header texture, movable, mouse-enabled, tiled-region, top-level
-- "Dialog": Frame with dialog appearance, movable, mouse-enabled, tiled-region, top-level
-- "Tooltip": Frame with tooltip appearance, movable, mouse-enabled, tiled-region, top-level
-- "ChildPage": Frame with no visual appearance other than a title and a sub-title, usually is used as a child page of
--              other option frames. Can be injected to Blizzard option panel using "AddToBlizzardOptionPanel".
-- [nil]: Frame with no visual appearance at all

--------------------------------------------------------------------------
-- Built-in operation buttons (not case-sensitive)
--------------------------------------------------------------------------

-- "TopClose":	A tiny icon button with no text but a cross icon at the top-right corner, unconditionally hides the dialog.
-- "Close":	A press button with localized "Close" text, unconditionally hides the dialog.
-- "OK":	A press button with localized "Okay" text, triggers Dialog:OnOK()
-- "Cancel":	A press button with localized "Cancel" text, triggers Dialog:OnCancel()
-- "Reset":	A press button with localized "Reset" text, triggers Dialog:OnReset()
-- "Default":	A press button with localized "Default" text, triggers Dialog:OnDefault()
-- "Apply":	A press button with localized "Apply" text, triggers Dialog:OnApply()
-- "Yes":	A press button with localized "Yes" text, triggers Dialog:OnYes()
-- "No":	A press button with localized "No" text, triggers Dialog:OnNo()
-- "Accept":	A press button with localized "Accept" text, triggers Dialog:OnAccept()
-- "Decline":	A press button with localized "Decline" text, triggers Dialog:OnDecline()
-- "Exit":	A press button with localized "Exit" text, triggers Dialog:OnExit()
-- "Custom":	A press button with localized "Custom" text, triggers Dialog:OnCustom()
-- "Help":	A press button with localized "Help" text, triggers Dialog:OnHelp()

--------------------------------------------------------------------------
--
-- Dialog:Toggle() -- Show the dialog if it's hidden, or hide it if it's shown (Only valid when style is set to "TitleDialog", "Dialog", or "Tooltip")
-- Dialog:GetOperationButton("operation") -- Retrieve a pre-created operation button("ok", "cancel", "close", "reset", "yes", "no")
-- Dialog:SetText("text" [, r, g, b]) -- Set the Dialog title text
-- Dialog:SetSubText("text" [, r , g, b]) -- Set the page sub-title text (Only valid when style is set to "ChildPage")
-- Dialog:GetTitleFontString() -- Retrive the FontString object of frame title
-- Dialog:GetSubTitleFontString() -- Retrive the FontString object of frame sub-title (Only valid when style is set to "ChildPage")
-- Dialog:AddToBlizzardOptionPanel("optionName" [, "titleText" [, "subTitleText" [, "parentOptionName"]]]) -- Add the frame to Blizzard option panel (Only valid when style is set to "ChildPage")
-- Dialog:Open() -- Open Blizzard option panel directly to this page (Only valid when style is set to "ChildPage")
--
--------------------------------------------------------------------------
-- Overrides
--------------------------------------------------------------------------

-- Dialog:OnInitShow() -- [Override] Called only once, when the first time the frame shows up
-- Dialog:OnEnterCombat() -- [Override] Called when enters combat
-- Dialog:OnLeaveCombat() -- [Override] Called when leaves combat
-- Dialog:OnRefresh() -- [Override] Called every time the frame shows up

--------------------------------------------------------------------------
-- Overrides for built-in operation buttons
--------------------------------------------------------------------------

-- Dialog:OnClose() -- [Override] Called when either "TopClose" or "Close" operation button is clicked, dialog was already hidden before this function
-- Dialog:OnOK() -- [Override] Called when the "OK" operation button is clicked, return nil to hide the dialog
-- Dialog:OnCancel() -- [Override] Called when the "Cancel" operation button is clicked, will hide the dialog
-- Dialog:OnReset() -- [Override] Called when the "Reset" operation button is clicked
-- Dialog:OnDefault() -- [Override] Called when the "Default" operation button is clicked
-- Dialog:OnApply() -- [Override] Called when the "Apply" operation button is clicked
-- Dialog:OnYes() -- [Override] Called when the "Yes" operation button is clicked, return nil to hide the dialog
-- Dialog:OnNo() -- [Override] Called when the "No" operation button is clicked, return nil to hide the dialog
-- Dialog:OnAccept() -- [Override] Called when the "Accept" operation button is clicked, return nil to hide the dialog
-- Dialog:OnDecline() -- [Override] Called when the "Decline" operation button is clicked, return nil to hide the dialog
-- Dialog:OnExit() -- [Override] Called when the "Exit" operation button is clicked, return nil to hide the dialog
-- Dialog:OnCustom() -- [Override] Called when the "Custom" operation button is clicked
-- Dialog:OnHelp() -- [Override] Called when the "Help" operation button is clicked

--------------------------------------------------------------------------
-- PressButton = UICreatePressButton("name" , parent [, "text" [, useSmallFont]])

--------------------------------------------------------------------------
-- CheckButton = UICreateCheckButton("name" , parent [, "text" [, useSmallFont]])

--------------------------------------------------------------------------
-- RadioGroup = UICreateRadioButtonGroup("name" , parent [, "text" [, useSmallFont]])

-- RadioGroup:SetCurSel(id) -- Set selection of the radio group
-- RadioGroup:GetCurSel() -- Get currently selected radio button id
-- RadioGroup:GetRadioButton(id) -- retrieve a radio button from the group
-- RadioGroup:GetNumRadioButtons() -- return number of radio buttons in the group
-- RadioButton = RadioGroup:CreateRadioButton("name" [, "text" [, value]])
--
-- RadioGroup:OnRadioSelect(radio) -- [Override] Called when a radio button is selected
-- RadioGroup:OnRadioDeselect(radio) -- [Override] Called when a radio button is de-selected

--------------------------------------------------------------------------
-- Slider = UICreateSlider("name" , parent [, "text" [, useSmallFont]])

-- Slider:GetFontString("type") -- Return a built-in FontString, type can be "label", "value", "low", "high"
-- Slider:SetValueTextFormats(["value" [, "low" [, "high"]]]) -- "%d", "%.2f", etc, for value/low/high label text
-- Slider:GetValueTextFormats()

--------------------------------------------------------------------------
-- EditBox = UICreateEditBox("name" , parent [, "labelText" [, useSmallFont]])

-- EditBox:SetReceiveDragMode("mode") -- Specify the action mode when received a drag for item/spell/money/macro etc, avialable modes are:

--	"LINK":		link for item or spell
--	"NAME":		only the name portion of the item or spell, or amount(string) of money in copper
--	"DETAIL":	name(rank) format for spell, or localized "%d gold %d silver %d copper" for money

--------------------------------------------------------------------------
-- ComboBox = UICreateComboBox("name" , parent [, "labelText" [, useSmallFont]])

-- ComboBox:SetJustifyH("justifyH")
-- ComboBox:GetJustifyH()
-- ComboBox:AddLine("text" [, value [, disabled]]) -- Add a line into the ComboBox dropdown-menu, return id of the new line
-- ComboBox:GetLine(id) -- return text, value
-- ComboBox:SetLine(id, "text" [, value [, disabled]]) -- Change data of a line
-- ComboBox:ClearLines() -- Clear all lines
-- ComboBox:NumLines() -- Get total number of lines
-- ComboBox:SetCurSel(id) -- Set selection of the ComboBox
-- ComboBox:GetCurSel() -- Get currently selected id
-- ComboBox:GetText() -- Get currently selected item text
-- ComboBox:SetText("text") -- Search matched text line and issue a call to "ComboBox:SetCurSel(match) if found" 

-- ComboBox:OnComboSelect(id, "text", value) -- [Override] Called when a line is selected

--------------------------------------------------------------------------
-- ListBox = UICreateListBox("name", parent [, useSmallFont])

-- ListBox:SetCurSel(id) -- Set the selected item by id
-- ListBox:GetCurSel() -- Retrieve id of the selected item, if any
-- ListBox:GetNumItems() -- Return number of item in the list
-- ListBox:InsertItem([position]) -- Insert a new item into the list, if position not specified, it will be inserted to the end of the list, return the newly created button and its position
-- ListBox:DeleteItem(id) -- Delete an item from the list
-- ListBox:DeleteAllItems() -- Empty the list entirely
-- ListBox:GetItem(id) -- Return an item object whose index is id
-- ListBox:FindItem(item) -- Return index of item if it's in the list
-- ListBox:SetHighlightTexture("texture" [, "layer" [, "alphaMode" [, r, g, b [, a]]]]) -- Specify highlight texture for the mouseover item
-- ListBox:SetHighlightTexture(texture) -- Give created texture object instead
-- ListBox:SetSelectedTexture("texture" [, "layer" [, "alphaMode" [, r, g, b [, a]]]]) -- Specify background texture for the selected item
-- ListBox:GetSelectedTexture(texture) -- Give created texture object instead

-- ListBox:OnItemCreated(item, id) -- [Override] Called when a new item(button) is created, it is the best time to config the button your own way
-- ListBox:OnItemRecycled(item, id) -- [Override] Called when an item(button) is recycled, that is, a deleted item is now reused
-- ListBox:OnListSelect(item, id) -- [Override] Called when an item is selected
-- ListBox:OnListDeselect(item, id) -- [Override] Called when an item is de-selected

--------------------------------------------------------------------------
-- StatusBar = UICreateGradientStatusBar("name", parent [, gradientMode [, useSmallFont]])

-- StatusBar:SetGradientMode(mode) -- Specify the bar gradient mode to change the bar color when status vale changes from low to high
--	mode: [NUMBER] -- 0: no gradient, 1: red to green, -1: green to red

-- StatusBar:GetGradientMode() -- Return gradient mode

--------------------------------------------------------------------------

local MAJOR_VERSION = 1.0;
local MINOR_VERSION = 1.8;

--------------------------------------------------------------------------
-- Version protection
--------------------------------------------------------------------------
if type(UICreateCommonUIIsNewerVersion) == "function" and not UICreateCommonUIIsNewerVersion(MAJOR_VERSION, MINOR_VERSION) then return end

--------------------------------------------------------------------------
-- UICreateDialogFrame
--------------------------------------------------------------------------
function UICreateDialogFrame(name, parent, titleText, style, useSmallFont, ...)

	-- Available built-in operation button types, get localized texts from "FrameXML\\GlobalStrings.lua"
	local OPERNAMES = {
		["ok"] = { text = getglobal("OKAY"), func = function(self) self:GetParent():_OnOperationButton("OnOK", 1) end },
		["cancel"] = { text = getglobal("CANCEL"), func = function(self) self:GetParent():_OnOperationButton("OnCancel", 1) end },
		["reset"] = { text = getglobal("RESET"), func = function(self) self:GetParent():_OnOperationButton("OnReset") end },
		["default"] = { text = getglobal("DEFAULT"), func = function(self) self:GetParent():_OnOperationButton("OnDefault") end },
		["apply"] = { text = getglobal("APPLY"), func = function(self) self:GetParent():_OnOperationButton("OnApply") end },
		["yes"] = { text = getglobal("YES"), func = function(self) self:GetParent():_OnOperationButton("OnYes", 1) end },
		["no"] = { text = getglobal("NO"), func = function(self) self:GetParent():_OnOperationButton("OnNo", 1) end },
		["accept"] = { text = getglobal("ACCEPT"), func = function(self) self:GetParent():_OnOperationButton("OnAccept", 1) end },
		["decline"] = { text = getglobal("DECLINE"), func = function(self) self:GetParent():_OnOperationButton("OnDecline", 1) end },
		["custom"] = { text = getglobal("CUSTOM"), func = function(self) self:GetParent():_OnOperationButton("OnCustom") end },
		["exit"] = { text = getglobal("EXIT"), func = function(self) self:GetParent():_OnOperationButton("OnExit", 1) end },
		["help"] = { text = getglobal("HELP_LABEL"), func = function(self) self:GetParent():_OnOperationButton("OnHelp") end },
		["close"] = { text = getglobal("CLOSE"), func = function(self) self:GetParent():Hide() self:GetParent():_OnOperationButton("OnClose") end },
	};

	local frame = UICreateCommonUIControl("Frame", name, parent, nil, useSmallFont);
	frame._P.operButtons = {};

	frame._OnOperationButton = function(self, func, hide)
		local result = nil;
		if type(func) == "string" and type(self[func]) == "function" then
			result = self[func](self);
		end

		if hide and not result then
			self:Hide();
		end
		return result;
	end
	
	frame.GetOperationButton = function(self, oper)
		oper = string.lower(tostring(oper));
		return oper == "topclose" and self._P.topCloseButton or self._P.operButtons[oper];
	end
	
	local buttonNames = { ... };
	local hasTopClose = nil;
	local buttons = {};

	local i;
	for i = 1, table.getn(buttonNames) do
		local name = string.lower(string.trim(tostring(buttonNames[i])));
		if name == "topclose" then
			hasTopClose = 1;
		else
			local oper = OPERNAMES[name];
			if oper and not frame._P.operButtons[name] then
				local button = UICreatePressButton(nil, frame, oper.text, useSmallFont);
				button:SetScript("OnClick", oper.func);
				frame._P.operButtons[name] = button;				
				table.insert(buttons, button);
			end
		end		
	end

	if hasTopClose then
		local button = CreateFrame("Button", nil, frame, "UIPanelCloseButton");
		button:SetWidth(24);
		button:SetHeight(24);
		button:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -5);
		button:SetScript("OnClick", OPERNAMES["close"].func);
		frame._P.topCloseButton = button;
	end

	local count = table.getn(buttons);
	if count == 1 then
		buttons[1]:SetPoint("BOTTOM", frame, "BOTTOM", 0, 16);
	elseif count == 2 then
		buttons[1]:SetPoint("RIGHT", buttons[2], "LEFT");
		buttons[2]:SetPoint("BOTTOMLEFT", frame, "BOTTOM", 0, 16);
	elseif count == 3 then
		buttons[1]:SetPoint("RIGHT", buttons[2], "LEFT");
		buttons[2]:SetPoint("BOTTOM", frame, "BOTTOM", 0, 16);
		buttons[3]:SetPoint("LEFT", buttons[2], "RIGHT");
	elseif count > 3 then
		local i;
		for i = 1, count - 1 do
			buttons[i]:SetPoint("RIGHT", buttons[i + 1], "LEFT");
		end
		buttons[count]:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -16, 16);
	end	

	frame.SetText = function(self, text, r, g, b)
		if self._P.titleFontString then
			self._P.titleFontString:SetText(text);
			if type(r) == "number" then
				self._P.titleFontString:SetTextColor(r, g, b);
			end
		end
	end

	local toplevel, titleFontString;
	style = string.lower(string.trim(tostring(style)));

	if style == "titledialog" then -- dialog frame with title header			
		frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 32, edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 32, insets = {left = 11, right = 12, top = 12, bottom = 11 }, });
		
		-- this style needs a dialog header
		local header = frame:CreateTexture(nil, "ARTWORK");
		header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header");
		header:SetHeight(62);
		header:SetPoint("TOP", frame, "TOP", 1, 13);
		frame._P.headerTexture = header;
		
		titleFontString = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal");
		titleFontString:SetPoint("TOP", frame, "TOP", 0, 1);	
		toplevel = 1;

		-- Set text will also need to resize header texture
		frame._P._OrigSetText = frame.SetText;
		frame.SetText = function(self, ...)
			self._P._OrigSetText(self, ...);
			local width = self._P.titleFontString:GetWidth();
			local high = self:GetWidth() * 1.5; -- cannot exceed this width
			local low = math.min(self:GetWidth(), 160); -- cannot narrower than this
			self._P.headerTexture:SetWidth(math.max(low, math.min(high, width * 2 + 100)));
		end

	elseif style == "dialog" then -- dialog frame

		frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 32, edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 32, insets = {left = 11, right = 12, top = 12, bottom = 11 }, });
		titleFontString = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		titleFontString:SetPoint("TOP", frame, "TOP", 0, -14);
		toplevel = 1;

	elseif style == "tooltip" then -- tooltip like

		frame:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16, edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16, insets = {left = 5, right = 5, top = 5, bottom = 5 }, });
		titleFontString = frame:CreateFontString(nil, "ARTWORK", "GameFontNormal");
		titleFontString:SetPoint("TOP", frame, "TOP", 0, -10);
		toplevel = 1;

	elseif style == "childpage" then

		titleFontString = frame:CreateFontString(nil, "ARTWORK", useSmallFont and "GameFontNormalLeft" or "GameFontNormalLargeLeft");
		titleFontString:SetJustifyV("TOP");
		titleFontString:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -16)

		local subTitle = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmallLeftTop");		
		subTitle:SetNonSpaceWrap(true);
		subTitle:SetPoint("TOPLEFT", titleFontString, "BOTTOMLEFT", 0, -8);
		subTitle:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -16, 16);
		frame._P.subTitleFontString = subTitle;
		frame:RegisterFontInstance(subTitle, nil);

		frame.SetSubText = function(self, text, r, g, b)
			self._P.subTitleFontString:SetText(text);
			if type(r) == "number" then
				self._P.subTitleFontString:SetTextColor(r, g, b);
			end
		end

		frame.GetSubTitleFontString = function(self)
			return self._P.subTitleFontString;
		end

		-- Inject to Blizzard option panel
		frame.AddToBlizzardOptionPanel = function(self, optionName, titleText, subTitleText, parentOptionName)
			
			if type(optionName) == "string" then
				self.name = optionName;
			end

			if type(self.name) ~= "string" then
				self.name = self._P.titleFontString:GetText();
			end

			if type(self.name) ~= "string" then
				return nil; -- self.name is required
			end

			if type(parentOptionName) == "string" then
				self.parent = parentOptionName;
			end

			if type(titleText) == "string" then
				self:SetText(titleText);
			end

			if type(subTitleText) == "string" then
				self:SetSubText(subTitleText);
			end
			
			if type(self.okay) ~= "function" then
				self.okay = self.OnOK;
			end

			if type(self.cancel) ~= "function" then
				self.cancel = self.OnCancel;
			end

			if type(self.default) ~= "function" then
				self.default = self.OnDefault;
			end

			if type(self.refresh) ~= "function" then
				self.refresh = self.OnRefresh;
			end

			if type(self.Open) ~= "function" then
				self.Open = InterfaceOptionsFrame_OpenToCategory;
			end

			self:Hide();
			InterfaceOptions_AddCategory(self);
			return 1;
		end		
	else
		-- No style means the frame is just a background existance with no appearance at all
	end

	frame._P.titleFontString = titleFontString;
	if titleFontString then
		frame:RegisterFontInstance(titleFontString, nil);
	end

	frame.GetTitleFontString = function(self)
		return self._P.titleFontString;
	end
	
	local private = CreateFrame("Frame", nil, frame);
	private:SetScript("OnShow", function(self)
		if not self.initShown then
			self.initShown = 1;
			if type(self:GetParent().OnInitShow) == "function" then
				self:GetParent():OnInitShow();
			end			
		end

		if type(self:GetParent().OnRefresh) == "function" then
			self:GetParent():OnRefresh();
		end
	end);

	private:RegisterEvent("PLAYER_REGEN_DISABLED");
	private:RegisterEvent("PLAYER_REGEN_ENABLED");
	private:SetScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_DISABLED" then
			if type(self:GetParent().OnEnterCombat) == "function" then
				self:GetParent():OnEnterCombat();
			end
		elseif event == "PLAYER_REGEN_ENABLED" then
			if type(self:GetParent().OnLeaveCombat) == "function" then
				self:GetParent():OnLeaveCombat();
			end
		end
	end);

	if toplevel then
		frame.Toggle = function(self)
			if self:IsShown() then
				self:Hide();
			else
				self:Show();
			end
		end

		frame:SetWidth(320);
		frame:SetHeight(240);
		frame:SetToplevel(true);
		frame:EnableMouse(true);
		frame:SetMovable(true);
		frame:SetFrameStrata("DIALOG");
		frame:SetPoint("CENTER", parent, "CENTER");
		frame:CreateTitleRegion():SetAllPoints(frame);
	end		

	frame:SetText(titleText);
	frame:Hide();
	return frame;
end

--------------------------------------------------------------------------
-- UICreatePressButton
--------------------------------------------------------------------------
function UICreatePressButton(name, parent, text, useSmallFont)		
	local button = UICreateCommonUIControl("Button", name, parent, nil, useSmallFont);
	button:SetWidth(90);
	button:SetHeight(25);		

	local texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonUpTexture");
	texture:SetAllPoints(button);
	button:SetNormalTexture(texture);

	texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonDownTexture");
	texture:SetAllPoints(button);
	button:SetPushedTexture(texture);

	texture = button:CreateTexture(nil, "ARTWORK", "UIPanelButtonDisabledTexture");
	texture:SetAllPoints(button);
	button:SetDisabledTexture(texture);

	texture = button:CreateTexture(nil, "OVERLAY", "UIPanelButtonHighlightTexture");
	texture:SetAllPoints(button);
	button:SetHighlightTexture(texture);

	button:SetText(text);
	return button;
end

--------------------------------------------------------------------------
-- UICreateCheckButton
--------------------------------------------------------------------------
function UICreateCheckButton(name, parent, text, useSmallFont)		
	local check = UICreateCommonUIControl("CheckButton", name, parent, nil, useSmallFont);

	local fs = check:GetFontInstance();
	fs:ClearAllPoints();
	fs:SetPoint("LEFT", check, "RIGHT");

	hooksecurefunc(fs, "SetText", function(self)
		self:GetParent():SetHitRectInsets(0, -(self:GetWidth() or 0), 0, 0);
	end);

	hooksecurefunc(check, "SetText", function(self)
		self:SetHitRectInsets(0, -(self:GetFontInstance():GetWidth() or 0), 0, 0);
	end);

	check:SetWidth(24);
	check:SetHeight(24);

	local texture = check:CreateTexture(nil, "ARTWORK");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Up");
	texture:SetAllPoints(check);
	check:SetNormalTexture(texture);

	texture = check:CreateTexture(nil, "ARTWORK");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Down");
	texture:SetAllPoints(check);
	check:SetPushedTexture(texture);

	texture = check:CreateTexture(nil, "ARTWORK");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Up");
	texture:SetDesaturated(true);
	texture:SetAllPoints(check);
	check:SetDisabledTexture(texture);

	texture = check:CreateTexture(nil, "ARTWORK");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Check");
	texture:SetAllPoints(check);
	check:SetCheckedTexture(texture);

	texture = check:CreateTexture(nil, "ARTWORK");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled");
	texture:SetAllPoints(check);
	check:SetDisabledCheckedTexture(texture);

	texture = check:CreateTexture(nil, "OVERLAY");
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Highlight");
	texture:SetBlendMode("ADD");
	texture:SetAllPoints(check);
	check:SetHighlightTexture(texture);

	check:SetText(text);
	return check;
end


--------------------------------------------------------------------------
-- UICreateRadioButtonGroup
--------------------------------------------------------------------------
function UICreateRadioButtonGroup(name, parent, text, useSmallFont)
	local group = UICreateCommonUIControl("Frame", name, parent, nil, useSmallFont);

	group._P.buttons = {};	

	group.SetCurSel = function(self, id)
		id = type(id) == "number" and math.floor(id) or nil;
		if self:GetCurSel() == id then
			return id;
		end

		self._P.isChecking = 1;
		local i, button, selectedId, selectedButton;
		for i, button in ipairs(self._P.buttons) do
			if i ~= id then
				if button._P.checked then
					button._P.checked = nil;
					button:SetChecked(false);
					if type(self.OnRadioDeselect) == "function" then
						self:OnRadioDeselect(i, button:GetText(), button.value, button);
					end
				end
			else
				selectedId, selectedButton = i, button;
			end
		end

		self._P.curSel = selectedId;

		if selectedId then
			selectedButton._P.checked = 1;
			selectedButton:SetChecked(1);		
			if type(self.OnRadioSelect) == "function" then
				self:OnRadioSelect(i, selectedButton:GetText(), selectedButton.value, selectedButton);
			end
		end
		
		self._P.isChecking = nil;
		return selectedId;
	end

	group.GetCurSel = function(self)
		return self._P.curSel;
	end

	group.GetRadioButton = function(self, id)
		return self._P.buttons[type(id) == "number" and math.floor(id) or 0];
	end

	group.GetNumRadioButtons = function(self)
		return table.getn(self._P.buttons);
	end

	group.CreateRadioButton = function(self, name, text, value)
		local radio = UICreateCheckButton(name, self, text, self:UsingSmallFont());
		radio.value = value;		

		radio:SetWidth(18);
		radio:SetHeight(18);

		local texture = radio:CreateTexture(nil, "ARTWORK");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetTexCoord(0, 0.25, 0, 1);
		texture:SetAllPoints(radio);
		radio:SetNormalTexture(texture);

		texture = radio:CreateTexture(nil, "ARTWORK");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetTexCoord(0, 0.25, 0, 1);
		texture:SetAllPoints(radio);
		radio:SetPushedTexture(texture);

		texture = radio:CreateTexture(nil, "ARTWORK");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetTexCoord(0, 0.25, 0, 1);
		texture:SetDesaturated(true);
		texture:SetAllPoints(radio);
		radio:SetDisabledTexture(texture);

		texture = radio:CreateTexture(nil, "ARTWORK");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetTexCoord(0.25, 0.49, 0, 1);
		texture:SetAllPoints(radio);
		radio:SetCheckedTexture(texture);

		texture = radio:CreateTexture(nil, "ARTWORK");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetTexCoord(0.25, 0.49, 0, 1);
		texture:SetDesaturated(true);
		texture:SetAllPoints(radio);
		radio:SetDisabledCheckedTexture(texture);

		texture = radio:CreateTexture(nil, "BORDER");
		texture:SetTexture("Interface\\Buttons\\UI-RadioButton");
		texture:SetBlendMode("ADD");
		texture:SetTexCoord(0.5, 0.75, 0, 1);
		texture:SetAllPoints(radio);
		radio:SetHighlightTexture(texture);	

		radio:SetScript("OnClick", function(self) self:SetChecked(1) end);
		
		hooksecurefunc(radio, "SetChecked", function(self)
			if not self:GetParent()._P.isChecking then
				if self:GetChecked() then
					self:GetParent():SetCurSel(self:GetID());
				elseif self.P.checked then
					self.P.checked = nil;
					if type(self:GetParent().OnRadioDeselect) == "function" then
						self:GetParent():OnRadioDeselect(self:GetID(), self:GetText(), self.value, self);
					end
				end
			end			
		end);

		table.insert(self._P.buttons, radio);
		radio:SetID(self:GetNumRadioButtons());		
		radio.SetID = function() end;
		radio.SetParent = function() end;
		return radio;
	end

	group:SetWidth(24);
	group:SetHeight(24);
	
	return group;
end

--------------------------------------------------------------------------
-- UICreateSlider
--------------------------------------------------------------------------
function UICreateSlider(name, parent, text, useSmallFont)
	local slider = UICreateCommonUIControl("Slider", name, parent, nil, useSmallFont);

	slider:SetOrientation("HORIZONTAL");
	slider:EnableMouse(true);
	slider:SetWidth(160);
	slider:SetHeight(15);
	slider:SetHitRectInsets(0, 0, -10, -10);
	slider:SetBackdrop({ bgFile = "Interface\\Buttons\\UI-SliderBar-Background", tile = true, tileSize = 8, edgeFile = "Interface\\Buttons\\UI-SliderBar-Border", edgeSize = 8, insets = {left = 3, right = 3, top = 612, bottom = 6 }, });

	local thumb = slider:CreateTexture(slider:GetSurfixName("Thumb"), "OVERLAY");		
	thumb:SetTexture("Interface\\Buttons\\UI-SliderBar-Button-Horizontal");
	thumb:SetWidth(32);
	thumb:SetHeight(32);
	slider:SetThumbTexture(thumb);	
	slider:RegisterTexture(thumb);

	local fs = slider:GetFontInstance();
	slider._P.label = fs;
	fs:SetJustifyH("LEFT");
	fs:SetJustifyV("BOTTOM");
	fs:ClearAllPoints();
	fs:SetPoint("BOTTOMLEFT", slider, "TOPLEFT");

	-- Value label
	fs = slider:CreateFontString(slider:GetSurfixName("Value"), "ARTWORK", "GameFontGreenSmall");
	slider._P.value = fs;
	fs:SetJustifyH("RIGHT");
	fs:SetJustifyV("BOTTOM");
	fs:SetPoint("BOTTOMRIGHT", slider, "TOPRIGHT");
	slider:RegisterFontInstance(fs);

	-- Low label
	fs = slider:CreateFontString(slider:GetSurfixName("Low"), "ARTWORK", "GameFontHighlightSmall");
	slider._P.low = fs;
	fs:SetJustifyH("LEFT");
	fs:SetJustifyV("TOP");
	fs:SetPoint("TOPLEFT", slider, "BOTTOMLEFT");
	slider:RegisterFontInstance(fs);

	-- High label
	fs = slider:CreateFontString(slider:GetSurfixName("High"), "ARTWORK", "GameFontHighlightSmall");
	slider._P.high = fs;
	fs:SetJustifyH("RIGHT");
	fs:SetJustifyV("TOP");
	fs:SetPoint("TOPRIGHT", slider, "BOTTOMRIGHT");	
	slider:RegisterFontInstance(fs);

	slider.GetFontString = function(self, textType)
		textType = string.lower(type(textType) == "string" and textType or "label");
		local fs = self._P[textType];
		if type(fs) ~= "table" or type(fs.GetObjectType) ~= "function" or fs:GetObjectType() ~= "FontString" then
			fs = self._P.label;
		end
		return fs;
	end	
		
	slider.SetValueTextFormats = function(self, value, low, high)			
		self._P.valFormat = type(value) == "string" and value or nil;
		self._P.lowFormat = type(low) == "string" and low or nil;
		self._P.highFormat = type(high) == "string" and high or nil;

		self._P.value:SetText(string.format(self._P.valFormat or "%d", self:GetValue() or 0));
		local minVal, maxVal = self:GetMinMaxValues();
		self._P.low:SetText(string.format(self._P.lowFormat or "%d", minVal or 0));
		self._P.high:SetText(string.format(self._P.highFormat or "%d", maxVal or 0));
	end

	slider.GetValueTextFormats = function(self)
		return self._P.valFormat, self._P.lowFormat, self._P.highFormat;
	end

	slider:SetScript("OnValueChanged", function(self, value)
		self._P.value:SetText(string.format(self._P.valFormat or "%d", value or 0));
	end);

	hooksecurefunc(slider, "SetMinMaxValues", function(self)
		local minVal, maxVal = self:GetMinMaxValues();
		self._P.low:SetText(string.format(self._P.lowFormat or "%d", minVal or 0));
		self._P.high:SetText(string.format(self._P.highFormat or "%d", maxVal or 0));
	end);		

	slider:SetMinMaxValues(0, 1);
	slider:SetValueStep(1);
	slider:SetValue(0);
	slider:SetText(text);
	return slider;
end

--------------------------------------------------------------------------
-- UICreateEditBox
--------------------------------------------------------------------------
function UICreateEditBox(name, parent, labelText, useSmallFont)
	local editbox = UICreateCommonUIControl("EditBox", name, parent, nil, useSmallFont);
	editbox:RegisterFontInstance(editbox, nil);
	editbox:SetAutoFocus(false);
	editbox:SetWidth(144);
	editbox:SetHeight(18);
	editbox:SetTextInsets(3, 3, 2, 2);
	editbox:SetFontObject(useSmallFont and "ChatFontSmall" or "ChatFontNormal");
	editbox:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16, edgeFile = "", edgeSize = 0, insets = {left = 0, right = 0, top = 0, bottom = 0 }, });
	local edge = UICreateEdgeFrame(nil, editbox, nil, 0.75);
	edge:SetBackdropBorderColor(0.75, 0.75, 0.75, 0.75);
	editbox:SetEdgeFrame(edge);	
	editbox._P.receiveDragMode = "LINK";
		
	editbox:SetScript("OnEscapePressed", function(self) self:ClearFocus(); end);
	editbox:SetScript("OnEditFocusGained", function(self) self:HighlightText(); end);
	editbox:SetScript("OnEditFocusLost", function(self) self:HighlightText(0, 0); end);	

	editbox.OnReceiveDrag = function(self, infoType, info1, info2, lnk, name, rank, detail, texture)
		local text;
		local mode = self:GetReceiveDragMode();
		if mode == "LINK" then
			text = lnk;
		elseif mode == "NAME" then
			text = name;
		elseif mode == "DETAIL" then
			text = detail;
		end

		if text then
			self:SetText(text);
			return 1;
		end
	end	

	editbox.SetReceiveDragMode = function(self, mode)
		mode = string.upper(string.trim(tostring(mode)));
		if mode ~= "LINK" and mode ~= "NAME" and mode ~= "DETAIL" then
			mode = nil;
		end
		self._P.receiveDragMode = mode;
		return mode;
	end	

	editbox.GetReceiveDragMode = function(self)
		return self._P.receiveDragMode;
	end

	editbox.OnEnable = function(self)
		self:EnableKeyboard(true);			
	end

	editbox.OnDisable = function(self)
		self:HighlightText(0, 0);
		self:ClearFocus();
		self:EnableKeyboard(false);			
	end

	editbox:SetLabelText(labelText);
	return editbox;
end

--------------------------------------------------------------------------
-- UICreateComboBox
--------------------------------------------------------------------------
function UICreateComboBox(name, parent, labelText, useSmallFont)
	local combo = UICreateCommonUIControl("Frame", name, parent, nil, useSmallFont);
	local edge = UICreateEdgeFrame(nil, combo, nil, 0.75);
	edge:SetBackdropBorderColor(0.75, 0.75, 0.75, 0.75);
	combo:SetEdgeFrame(edge);
	combo:EnableMouse();
	combo:SetBackdrop({ bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background", tile = true, tileSize = 16, edgeFile = "", edgeSize = 0, insets = {left = 0, right = 0, top = 0, bottom = 0 }, });
	combo:SetWidth(144);
	combo:SetHeight(18);

	-- This is the real menu combo derived from UIDropDownMenuTemplate, it's invisible, private, and is only maintained internally.
	local i = 1;
	while getglobal("UICreateComboBox_E4DBEB9C_9334_4A98_9E62_041E52A606B3_"..i) do i = i + 1 end
	local menu = CreateFrame("Frame", "UICreateComboBox_E4DBEB9C_9334_4A98_9E62_041E52A606B3_"..i, combo, "UIDropDownMenuTemplate");
	combo._P.menu = menu;		
	menu._lines = {};
	menu:Hide();
	menu.point = "TOPLEFT";
	menu.relativeTo = combo;
	menu.relativePoint = "BOTTOMLEFT";
	menu.xOffset = -3;
	menu.yOffset = -2;
		
	UIDropDownMenu_Initialize(menu, function(self)
		local i;
		for i = 1, table.getn(self._lines) do
			UIDropDownMenu_AddButton(self._lines[i]);
		end			
	end, "MENU");		

	-- The dropdown button
	local button = CreateFrame("Button", nil, combo);
	button:SetWidth(24);
	button:SetHeight(24);
	button:ClearAllPoints();
	button:SetPoint("RIGHT", combo, "RIGHT", 3, 0);
	button:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up");
	button:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down");
	button:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled");
	button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD");

	button:SetScript("OnClick", function(self)
		ToggleDropDownMenu(nil, nil, self:GetParent()._P.menu);
		PlaySound("igMainMenuOptionCheckBoxOn");
	end);		

	local fs = combo:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmallLeft");
	combo._P.comboText = fs;
	combo:RegisterFontInstance(fs, nil);
	fs:ClearAllPoints();
	fs:SetPoint("LEFT", combo, "LEFT", 3, 0);
	fs:SetPoint("RIGHT", button, "LEFT", 0, 0);		

	combo.AddLine = function(self, text, value, disabled)
		if text then
			text = tostring(text);
		else
			text = nil;
		end			

		local id = table.getn(self._P.menu._lines) + 1;
		table.insert(self._P.menu._lines, { ["text"] = text, ["value"] = value, ["disabled"] = disabled, ["arg1"] = self, ["arg2"] = id, ["func"] = function(_, owner, id) owner:SetCurSel(id) end });
	end

	combo.ClearLines = function(self)
		CloseDropDownMenus();
		self:SetCurSel(nil);
		self._P.menu._lines = {};
	end

	combo.NumLines = function(self)
		return table.getn(self._P.menu._lines);
	end

	combo.GetLine = function(self, id)
		if type(id) ~= "number" then
			return nil;
		end

		local info = self._P.menu._lines[id];
		if not info then
			return nil;
		end

		return info.text, info.value, info.disabled;
	end

	combo.SetLine = function(self, id, text, value, disabled)
		if type(id) ~= "number" then
			return nil;
		end

		local info = self._P.menu._lines[id];
		if not info then
			return nil;
		end

		CloseDropDownMenus();

		info.text, info.value, info.disabled = text, value, disabled;
		if id == self:GetCurSel() then
			self._P.comboText:SetText(text);
		end

		return id;
	end

	combo.SetJustifyH = function(self, justifyH)
		return self._P.comboText:SetJustifyH(justifyH);
	end

	combo.GetJustifyH = function(self)
		return self._P.comboText:GetJustifyH();
	end

	combo.GetText = function(self)
		return self._P.comboText:GetText();
	end

	combo.SetText = function(self, text)
		text = type(text) == "string" and text or nil;
		if text == self:GetText() then
			return self:GetCurSel();
		end

		local lines = self._P.menu._lines;
		local i, info;
		for i, info in ipairs(lines) do
			if text == info.text then
				return self:SetCurSel(i);
			end
		end

		return self:SetCurSel(nil);
	end

	combo.GetCurSel = function(self)
		return self._P.curSel;
	end

	combo.SetCurSel = function(self, id)
		id = type(id) == "number" and math.floor(id) or nil;
		if id == self:GetCurSel() then
			return id;
		end

		local lines = self._P.menu._lines;
		local i, info, selectedId, selectedText, selectedValue;
		for i, info in ipairs(lines) do
			if i == id then
				info.checked = 1;
				selectedId, selectedText, selectedValue = i, info.text, info.value;
			else
				info.checked = nil;
				if i == self._P.curSel and type(self.OnComboDeselect) == "function" then
					self:OnComboDeselect(i, info.text, info.value);
				end
			end
		end
			
		self._P.curSel = selectedId;
		self._P.comboText:SetText(selectedText);

		if selectedId and type(self.OnComboSelect) == "function" then
			self:OnComboSelect(selectedId, selectedText, selectedValue);
		end

		return selectedId;
	end
	
	combo:SetLabelText(labelText);
	return combo;
end

--------------------------------------------------------------------------
-- UICreateListBox
--------------------------------------------------------------------------
function UICreateListBox(name, parent, useSmallFont)	
	local list = UICreateCommonUIControl("Frame", name, parent, nil, useSmallFont);
	list._P.items = {};
	list._P.deleted = {};

	list.CreateListTexture = function(self, iconPath, layer, alphaMode, r, g, b, a)
		if type(iconPath) ~= "string" then
			return nil;
		end

		local texture = self:CreateTexture(nil, layer);
		texture:SetTexture(iconPath);

		if not texture:GetTexture() then
			return nil;
		end
		
		if type(alphaMode) == "string" then
			texture:SetBlendMode(alphaMode);
		end

		if r and g and b then
			texture:SetVertexColor(r, g, b, a);
		end

		texture:Hide();
		return texture;
	end
	
	list.SetHighlightTexture = function(self, texture, layer, alphaMode, r, g, b, a)
		self._P.highlightTexture = self:CreateListTexture(texture, layer, alphaMode, r, g, b, a);
	end

	list.GetHighlightTexture = function(self)
		local texture = self._P.highlightTexture;
		return texture:GetTexture(), texture:GetDrawLayer(), texture:GetBlendMode(), texture:GetVertexColor();
	end

	list.SetSelectedTexture = function(self, texture, layer, alphaMode, r, g, b, a)			
		self._P.selectedTexture = self:CreateListTexture(texture, layer, alphaMode, r, g, b, a);
	end		

	list.GetSelectedTexture = function(self)
		local texture = self._P.selectedTexture;
		return texture:GetTexture(), texture:GetDrawLayer(), texture:GetBlendMode(), texture:GetVertexColor();
	end	

	-- Update item position after adding/deleting etc
	list.UpdateItemPositions = function(self, start)
		start = math.max(1, math.floor(type(start) == "number" and start or 1));			
		local items = self._P.items;
		local i;
		for i = start, table.getn(items) do
			items[i]:ClearAllPoints();
			if i == 1 then
				items[i]:SetPoint("TOPLEFT", self, "TOPLEFT");
				items[i]:SetPoint("TOPRIGHT", self, "TOPRIGHT");
			else
				items[i]:SetPoint("TOPLEFT", items[i - 1], "BOTTOMLEFT");
				items[i]:SetPoint("TOPRIGHT", items[i - 1], "BOTTOMRIGHT");
			end
		end
	end	

	list.FindItem = function(self, item)
		if type(item) == "table" then
			local items = self._P.items;
			local i;
			for i = 1, table.getn(items) do
				if items[i] == item then
					return i;
				end
			end
		end
		return nil;
	end

	list.GetItem = function(self, id)
		return self._P.items[type(id) == "number" and id or 0];
	end

	list.GetNumItems = function(self)
		return table.getn(self._P.items);
	end

	list.GetCurSel = function(self)
		return self._P.curSel;
	end

	list.SetCurSel = function(self, id)
		id = type(id) == "number" and id or nil;
		if id == self:GetCurSel() then
			return self:GetItem(id), id;
		end

		local i, item, selectId, selectItem;
		for i, item in ipairs(self._P.items) do
			if i == id then
				selectId, selectItem = i, item;
			else
				if item:_Deselect(i) and type(self.OnListDeselect) == "function" then
					self:OnListDeselect(item, i);
				end
			end				
		end

		self._P.curSel = selectId;

		if selectId and selectItem:_Select(selectId) and type(self.OnListSelect) == "function" then
			self:OnListSelect(selectItem, selectId);
		end
		
		return selectItem, selectId;
	end	

	list.InsertItem = function(self, position)
		position = type(position) == "number" and math.max(1, math.floor(position)) or nil;
		if position then
			position = math.min(position, table.getn(self._P.items) + 1);
		else
			position = table.getn(self._P.items) + 1;
		end		
		
		local item = table.remove(self._P.deleted);
		local newCreation = not item;
		if newCreation then
			-- No more items in the pool, need to create a new one
			item = UICreateCommonUIControl("Button", nil, self, nil, self:UsingSmallFont());
			item.SetParent = function() end

			local label = item:GetLabelFontString();
			label:SetJustifyH("LEFT");
			--label:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
			label:ClearAllPoints();
			label:SetPoint("LEFT", item, "LEFT", 2, 0);

			item.ShowTexture = function(self, texture, renewOnly)
				if type(texture) == "table" and type(texture.SetParent) == "function" and (not renewOnly or texture:GetParent() == self) then
					texture:SetParent(self);
					texture:ClearAllPoints();
					texture:SetPoint("TOPLEFT", self, "TOPLEFT", 0, -1);
					texture:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 1);
					texture:Show();
				end
			end

			item.HideTexture = function(self, texture)
				if type(texture) == "table" and type(texture.GetParent) == "function" and texture:GetParent() == self then
					texture:SetParent(self:GetParent());
					texture:ClearAllPoints();
					texture:Hide();
				end
			end
			
			item:SetScript("OnEnter", function(self)
				if not self._P.selected then
					self:ShowTexture(self:GetParent()._P.highlightTexture);
				end				
			end);

			item:SetScript("OnLeave", function(self)
				self:HideTexture(self:GetParent()._P.highlightTexture);				
			end);

			item:SetScript("OnClick", function(self)
				local list = self:GetParent();
				local id = list:FindItem(self);
				if id then
					list:SetCurSel(id);
				end
			end);

			item._Select = function(self, id)					
				if self._P.selected then
					return nil;
				end					
				self._P.selected = 1;

				self:HideTexture(self:GetParent()._P.highlightTexture);
				self:ShowTexture(self:GetParent()._P.selectedTexture);
				return 1;
			end

			item._Deselect = function(self, id)
				if not self._P.selected then
					return nil;
				end					
				self._P.selected = nil;

				self:HideTexture(self:GetParent()._P.selectedTexture);
				self:ShowTexture(self:GetParent()._P.highlightTexture, 1);
				return 1;
			end
		end			

		item:SetHeight(20);
		item:Show();

		table.insert(self._P.items, position, item);
		self:UpdateItemPositions(position);

		if newCreation then
			if type(self.OnItemCreated) == "function" then
				self:OnItemCreated(item, position);
			end
		else
			if type(self.OnItemRecycled) == "function" then
				self:OnItemRecycled(item, position);
			end
		end

		return item, position;
	end	

	list.DeleteItem = function(self, id)
		local item = self:GetItem(id);
		if not item then
			return nil;
		end

		if self:GetCurSel() == id then
			self:SetCurSel(nil);
		end

		table.remove(self._P.items, id);
		table.insert(self._P.deleted, item);
		item:ClearAllPoints();
		item:Hide();
		self:UpdateItemPositions(id);
		return id;
	end

	list.DeleteAllItems = function(self)
		self:SetCurSel(nil);
		local item;
		for _, item in ipairs(self._P.items) do
			item:ClearAllPoints();
			item:Hide();
		end

		self._P.deleted = self._P.items;
		self._P.items = {};
	end	

	list.OnEnable = function(self)
		if self._P.selectedTexture then
			self._P.selectedTexture:SetDesaturated(false);
		end		
	end

	list.OnDisable = function(self)
		if self._P.selectedTexture then
			self._P.selectedTexture:SetDesaturated(true);
		end		
	end

	list:SetHighlightTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight", "BORDER", "ADD", 0.196, 0.388, 0.8);
	list:SetSelectedTexture("Interface\\QuestFrame\\UI-QuestLogTitleHighlight", "BORDER", "ADD", 0.196, 0.388, 0.8);
	--list:SetSelectedTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight", "BORDER", "ADD", 1, 1, 1, 0.7);

	return list;
end

--------------------------------------------------------------------------
-- UICreateStatusBar
--------------------------------------------------------------------------

function UICreateGradientStatusBar(name, parent, gradientMode, useSmallFont)
	local bar = UICreateCommonUIControl("StatusBar", name, parent, nil, useSmallFont);
	bar._P.gradientMode = 0;
	bar._P.background = bar:CreateTexture(nil, "BACKGROUND");
	bar._P.background:SetAllPoints(bar);
	local label = bar:GetLabelFontString();
	bar:RegisterFontInstance(label);
	label:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b);
	label:ClearAllPoints();
	label:SetPoint("CENTER", bar, "CENTER", 0, 0.5);	

	local spark = bar:CreateTexture(nil, "OVERLAY");
	bar._P.spark = spark;
	spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark");
	spark:SetBlendMode("ADD");
	spark:Hide();
	bar:RegisterTexture(spark);	

	bar:SetMinMaxValues(0, 0);
	bar:SetValue(0);	

	bar.RefreshStatusBar = function(self)
		local showSpark = nil;
		local width = (self:GetRight() or 0) - (self:GetLeft() or 0);
		if width > 0 then

			-- calc percentage
			local l, h = self:GetMinMaxValues();
			local v = self:GetValue();
			local percent = 0;
			if l and v and h and l < h then
				percent = math.max(0, math.min(1, (v - l) / (h - l)));
				showSpark = v > l and v < h;
			end

			-- spark position calc				
			if showSpark then
				spark:ClearAllPoints();
				spark:SetPoint("CENTER", self, "LEFT", percent * width, 0);					
			end

			-- gradient color calc
			if self:IsEnabled() then
				local r, g;
				local mode = self._P.gradientMode;
				if mode > 0 then
					if percent > 0.5 then
						r = (1 - percent) * 2;
						g = 1;
					else
						r = 1;
						g = percent * 2;
					end
				elseif mode < 0 then
					if percent < 0.5 then
						r = percent * 2;
						g = 1;
					else
						r = 1;
						g = (1 - percent) * 2;
					end
				end

				if r then
					self:SetStatusBarColor(r, g, 0);
				end
			end
		end

		if showSpark then
			spark:Show();			
		else
			spark:Hide();
		end
	end

	hooksecurefunc(bar, "SetStatusBarTexture", function(self)
		local texture = self:GetStatusBarTexture();
		if type(texture) == "table" then
			texture = texture:GetTexture();
		end
		self._P.background:SetTexture(texture);
	end);

	hooksecurefunc(bar, "SetStatusBarColor", function(self)
		local r, g, b, a = self:GetStatusBarColor();
		self._P.background:SetVertexColor(r / 2, g / 2, b / 2, a / 2);
	end);

	hooksecurefunc(bar, "SetMinMaxValues", function(self)
		self:RefreshStatusBar();
	end);

	bar:SetScript("OnValueChanged", function(self)
		self:RefreshStatusBar();
	end);

	bar:SetScript("OnSizeChanged", function(self, x, y)
		if y > 0 then
			self._P.spark:SetWidth(y * 0.45);
			self._P.spark:SetHeight(y * 1.8);
		end
		self:RefreshStatusBar();
	end);	

	bar.SetGradientMode = function(self, gradientMode)
		gradientMode = type(gradientMode) == "number" and gradientMode or 0;
		if gradientMode < 0 then
			gradientMode = -1;
		elseif gradientMode > 0 then
			gradientMode = 1;
		else
			gradientMode = 0;
		end
		self._P.gradientMode = gradientMode;

		self:RefreshStatusBar();
		return gradientMode;
	end	

	bar.GetGradientMode = function(self)
		return self._P.gradientMode;
	end	

	bar.OnEnable = function(self)
		if self._P.savedColor then
			self:SetStatusBarColor(unpack(self._P.savedColor));
			self._P.savedColor = nil;
		end
		self:RefreshStatusBar();
	end

	bar.OnDisable = function(self)
		if not self._P.savedColor then
			self._P.savedColor = { self:GetStatusBarColor() };
		end
		self:SetStatusBarColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
	end

	bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
	bar:SetStatusBarColor(0, 1, 0);
	bar:SetGradientMode(gradientMode);	
	return bar;
end

function UICreateEdgeFrame(name, parent, hasBackground, scale)
	local edge = CreateFrame("Frame", name, parent);
	edge:SetBackdrop({ bgFile = hasBackground and "Interface\\DialogFrame\\UI-DialogBox-Background" or "", tile = true, tileSize = 16, edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border", edgeSize = 16, insets = {left = 5, right = 5, top = 5, bottom = 5 }, });
	edge:SetPoint("TOPLEFT", parent, "TOPLEFT", -4, 4);
	edge:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 4, -4);
	edge:SetScale(math.max(0.001, type(scale) == "number" and scale or 1));
	return edge;
end

local cursorhasAction = nil;

function UICreateCommonUIControl(frameType, name, parent, template, useSmallFont)
	local frame = CreateFrame(frameType, name, parent, template);
	if not frame then
		return nil;
	end	

	-- A secret place for this frame to hide private things, god damn it I miss class/private/protected keywords in C++
	local PRIVATE = "{5872D0FA-F69A-49E7-AA12-DFA29AD21BCD}";
	local SUBPRIVATE = "{88E5826F-4708-45B3-B2EA-D7FCB5B0B518}";

	frame[PRIVATE] = { [SUBPRIVATE] = {}, ["useSmallFont"] = useSmallFont, ["scripts"] = {}, ["fontStrings"] = {}, ["textures"] = {},
		["highlightColor"] = { r = HIGHLIGHT_FONT_COLOR.r, g = HIGHLIGHT_FONT_COLOR.g, b = HIGHLIGHT_FONT_COLOR.b }, 
		["disabledColor"] = { r = GRAY_FONT_COLOR.r, g = GRAY_FONT_COLOR.g, b = GRAY_FONT_COLOR.b } };

	frame._P = frame[PRIVATE][SUBPRIVATE]; -- Just a shorthand

	frame.GetPrivate = function(self, key)
		if key then
			return self._P[key];
		end
	end

	frame.SetPrivate = function(self, key, value)
		if key then
			self._P[key] = value;
		end
	end

	-----------------------------------------------------------------
	-- Script Protection
	-- 
	-- Avoid unexpected changes to chosen frame scripts.
	-----------------------------------------------------------------

	local function VerifyScript(frame, script)
		script = type(script) == "string" and string.lower(script) or nil;
		return script and frame:HasScript(script);
	end

	frame[PRIVATE].SetScript = frame.SetScript;
	frame.SetScript = function(self, script, func)
		if type(func) ~= "function" or not VerifyScript(self, script) then
			return nil;
		end		

		local funcTable = self[PRIVATE]["scripts"][script];
		if funcTable then
			local i, exist;
			for i, exist in ipairs(funcTable) do
				if exist == func then
					return i;
				end
			end

			table.insert(funcTable, func);
			return table.getn(funcTable);
		else
			self[PRIVATE]["scripts"][script] = { func };
			self[PRIVATE].SetScript(self, script, function(self, ...)
				local funcTable = self[PRIVATE]["scripts"][script];
				local i;
				for i = 1, table.getn(funcTable) do
					funcTable[i](self, ...);
				end
			end);
			return 1;
		end
	end

	frame.GetScript = function(self, script)
		if not VerifyScript(self, script) then
			return nil;
		end

		local funcTable = self[PRIVATE]["scripts"][script];
		if funcTable then
			return unpack(funcTable);
		else
			return nil;
		end
	end

	frame.RemoveScript = function(self, script, func)
		if type(func) ~= "function" then
			return nil;
		end

		if not VerifyScript(self, script) then
			return nil;
		end

		local funcTable = self[PRIVATE]["scripts"][script];
		if not funcTable then
			return nil;
		end

		local i, exist;
		for i, exist in ipairs(funcTable) do
			if exist == func then
				return table.remove(funcTable, i);
			end
		end
		return nil;
	end

	frame.ClearScript = function(self, script)
		if VerifyScript(self, script) then
			self[PRIVATE].SetScript(self, script, nil);
			self[PRIVATE]["scripts"][script] = nil;
		end		
	end
		
	frame:SetScript("OnEnter", function(self)
		if self:IsEnabled() then
			self:TextHighlight();

			GameTooltip:SetOwner(self, "ANCHOR_LEFT");
			GameTooltip:ClearLines();

			if type(self.OnTooltipRequest) == "function" then
				self:OnTooltipRequest();
			else
				if self.tooltipTitle then
					GameTooltip:AddLine(self.tooltipTitle);
				end

				if self.tooltipText then
					GameTooltip:AddLine(self.tooltipText, 1, 1, 1);
				end
			end

			if GameTooltip:NumLines() > 0 then
				GameTooltip:Show();
			else
				GameTooltip:Hide();
			end
		end		
	end);

	frame:SetScript("OnLeave", function(self)
		if self:IsEnabled() then
			self:TextUnHighlight();
			GameTooltip:Hide();
		end		
	end);

	frame.__OnReceiveDragGetInfo = function(self)
		GameTooltip:Hide();

		if type(self.OnReceiveDrag) ~= "function" then
			return;
		end

		local infoType, info1, info2 = GetCursorInfo();
		local lnk, name, rank, detail, texture, _;
		if infoType == "item" then			
			name, lnk, _, _, _, _, _, _, _, texture = GetItemInfo(info1);
		elseif infoType == "spell" then
			lnk = GetSpellLink(info1, info2);
			texture = GetSpellTexture(info1, info2);
			name, rank = GetSpellName(info1, info2);
			if rank and rank ~= "" then
				detail = name.."("..rank..")";
			else
				detail = name;
			end			
		elseif infoType == "merchant" then
			lnk = GetMerchantItemLink(info1);
			name, texture = GetMerchantItemInfo(info1);
		elseif infoType == "macro" then
			-- try item
			name, lnk = GetMacroItem(info1);
			if name then
				texture = select(10, GetItemInfo(lnk));
			else
				-- try spell
				name, rank = GetMacroSpell(info1);
				if name then
					lnk = GetSpellLink(name, rank);
					texture = GetSpellTexture(name, rank);
					if rank and rank ~= "" then
						detail = name.."("..rank..")";
					else
						detail = name;
					end
				else
					name, texture = GetMacroInfo(info1); -- macro title
				end
			end			

		elseif infoType == "money" then
			name = tostring("%d", info1);
			local copper = math.floor(info1 + 0.5) % 100;
			local silver = math.floor(info1 / 100) % 100;
			local gold = math.floor(info1 / 10000);
			local goldText, silverText, copperText;				
			if gold > 0 then
				goldText = string.format(GOLD_AMOUNT, gold);
			end

			if copper > 0 then					
				copperText = string.format(COPPER_AMOUNT, copper);
			end

			if silver > 0 or (goldText and copperText) then
				silverText = string.format(SILVER_AMOUNT, silver);
			end
				
			detail = goldText;
			if silverText then
				if detail then
					detail = detail.." "..silverText;
				else
					detail = silverText;
				end
			end

			if copperText then
				if detail then
					detail = detail.." "..copperText;
				else
					detail = copperText;
				end
			end
		else
			return;
		end		

		if self:OnReceiveDrag(infoType, info1, info2, lnk, name, rank, detail, texture) then
			if not cursorhasAction then
				ClearCursor();
			elseif not InCombatLockdown() then
				PlaceAction(cursorhasAction);
			end
		end
	end

	frame:SetScript("OnMouseDown", frame.__OnReceiveDragGetInfo);
	frame:SetScript("OnReceiveDrag", frame.__OnReceiveDragGetInfo);

	frame.GetSurfixName = function(self, surfix)
		return self:GetName() and self:GetName()..tostring(surfix) or nil;
	end

	frame.UsingSmallFont = function(self)
		return self[PRIVATE].useSmallFont;
	end

	frame.SetEdgeFrame = function(self, edgeFrame)
		if type(edgeFrame) == "table" and type(edgeFrame.SetBackdropBorderColor) == "function" then
			edgeFrame:ClearAllPoints();
			edgeFrame:SetPoint("TOPLEFT", self, "TOPLEFT", -4, 4);
			edgeFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 4, -4);
			self[PRIVATE].edgeFrame = edgeFrame;
		else
			self[PRIVATE].edgeFrame = nil;
		end
	end

	frame.GetEdgeFrame = function(self)
		return self[PRIVATE].edgeFrame;
	end

	frame.RegisterTexture = function(self, texture)
		if type(texture) ~= "table" then
			return nil;
		end

		if self:IsTextureRegistered(texture) then
			return 1;
		end

		texture.Greyout = function(self)
			if not self.autoSavedColor then
				self.autoSavedColor = { self:GetVertexColor() };
			end
			self:SetVertexColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
		end

		texture.Ungreyout = function(self)
			if self.autoSavedColor then
				self:SetVertexColor(unpack(self.autoSavedColor));
			end
		end		

		table.insert(self[PRIVATE]["textures"], texture);
		return 1;		
	end

	frame.UnregisterTexture = function(self, texture)
		local i = self:IsTextureRegistered(texture);
		if i then
			table.remove(self[PRIVATE]["textures"], i);
			return 1;
		end
		return nil;
	end

	frame.IsTextureRegistered = function(self, texture)
		if type(texture) ~= "table" then
			return nil;
		end

		local i, t;
		for i, t in ipairs(self[PRIVATE]["textures"]) do
			if t == texture then
				return i;
			end
		end

		return nil;
	end	
	
	frame.IsFontInstanceRegistered = function(self, fs)
		if type(fs) ~= "table" then
			return nil;
		end

		local i, data;
		for i, data in ipairs(self[PRIVATE]["fontStrings"]) do
			if data.fontString == fs then
				return i, data.highlight;
			end
		end
		return nil;
	end

	frame.RegisterFontInstance = function(self, fs, highlight)
		if type(fs) ~= "table" or type(fs.GetTextColor) ~= "function" or type(fs.SetTextColor) ~= "function" then
			return nil;
		end

		local id = self:IsFontInstanceRegistered(fs);
		if id then
			self[PRIVATE]["fontStrings"][id].highlight = highlight;
			return id;
		end

		if not fs.__OrigSetTextColor then
			fs.__OrigSetTextColor = fs.SetTextColor;
			fs.SetTextColor = function(self, ...)
				if type(self.autoSavedColor) == "table" then
					self.autoSavedColor = { ... };
				else
					self:__OrigSetTextColor(...);
				end		
			end	

			fs.SaveAndSetTextColor = function(self, ...)
				if not self.autoSavedColor then
					self.autoSavedColor = { self:GetTextColor() };
				end
				self:__OrigSetTextColor(...);
			end

			fs.RestoreTextColor = function(self)
				if type(self.autoSavedColor) == "table" then
					self:__OrigSetTextColor(unpack(self.autoSavedColor));
					self.autoSavedColor = nil;
				end
			end
		end

		table.insert(self[PRIVATE]["fontStrings"], { ["fontString"] = fs, ["highlight"] = highlight});
		return table.getn(self[PRIVATE]["fontStrings"]);
	end

	frame.UnregisterFontInstance = function(self, fs)
		local id, highlight = self:IsFontInstanceRegistered(fs);
		if id then
			table.remove(self[PRIVATE]["fontStrings"], id);
		end
		return id, highlight;
	end

	frame.SetHighlightTextColor = function(self, r, g, b)
		self[PRIVATE]["highlightColor"].r = math.min(1, math.max(0, type(r) == "number" and r or HIGHLIGHT_FONT_COLOR.r));
		self[PRIVATE]["highlightColor"].g = math.min(1, math.max(0, type(g) == "number" and g or HIGHLIGHT_FONT_COLOR.g));
		self[PRIVATE]["highlightColor"].b = math.min(1, math.max(0, type(b) == "number" and b or HIGHLIGHT_FONT_COLOR.b));
	end

	frame.GetHighlightTextColor = function(self)
		return self[PRIVATE]["highlightColor"].r, self[PRIVATE]["highlightColor"].g, self[PRIVATE]["highlightColor"].b;
	end

	frame.SetDisabledTextColor = function(self, r, g, b)
		self[PRIVATE]["disabledColor"].r = math.min(1, math.max(0, type(r) == "number" and r or GRAY_FONT_COLOR.r));
		self[PRIVATE]["disabledColor"].g = math.min(1, math.max(0, type(g) == "number" and g or GRAY_FONT_COLOR.g));
		self[PRIVATE]["disabledColor"].b = math.min(1, math.max(0, type(b) == "number" and b or GRAY_FONT_COLOR.b));
	end

	frame.GetDisabledTextColor = function(self)
		return self[PRIVATE]["disabledColor"].r, self[PRIVATE]["disabledColor"].g, self[PRIVATE]["disabledColor"].b;
	end

	frame.TextHighlight = function(self)
		local data;
		for _, data in ipairs(self[PRIVATE]["fontStrings"]) do
			if data.highlight then
				data.fontString:SaveAndSetTextColor(self:GetHighlightTextColor());
			end
		end
	end

	frame.TextUnHighlight = function(self)
		local data;
		for _, data in ipairs(self[PRIVATE]["fontStrings"]) do
			if data.highlight then
				data.fontString:RestoreTextColor();
			end
		end
	end

	frame.TextGrey = function(self)
		local color = self[PRIVATE]["highlightColor"];
		local data;
		for _, data in ipairs(self[PRIVATE]["fontStrings"]) do
			data.fontString:SaveAndSetTextColor(self:GetDisabledTextColor());
		end
	end

	frame.TextRestoreColors = function(self)
		local data;
		for _, data in ipairs(self[PRIVATE]["fontStrings"]) do
			data.fontString:RestoreTextColor();
		end
	end

	-- lable string
	local fs;
	if frame:GetName() then
		fs = getglobal(frame:GetName().."Text");
		if type(fs) ~= "table" or type(fs.GetTextColor) ~= "function" or type(fs.SetTextColor) ~= "function" then
			fs = nil;
		end
	end

	if not fs then
		fs = frame:CreateFontString(nil, "ARTWORK", useSmallFont and "GameFontNormalSmall" or "GameFontNormal");
	end

	frame:RegisterFontInstance(fs, 1);
	if type(frame.SetFontString) == "function" then
		frame:SetFontString(fs);
	end

	frame.GetFontInstance = function(self, id)
		local data = self[PRIVATE]["fontStrings"][math.floor(type(id) == "number" and id or 1)];
		if data then			
			return data.fontString;
		end
		return nil;		
	end
	
	frame.GetLabelFontString = function(self)
		return self:GetFontInstance(1);
	end

	frame.SetLabelText = function(self, text, r, g, b)
		local fs = self:GetLabelFontString();
		fs:SetText(text);
		if r then
			fs:SetTextColor(r, g, b);
		end
	end
	
	local FUNCTABLE = { "SetText", "GetText", "SetTextColor", "GetTextColor", "SetJustifyH", "GetJustifyH", "SetJustifyV", "GetJustifyV", "SetSpacing", "GetSpacing" };
	local func;
	for _, func in ipairs(FUNCTABLE) do
		if type(frame[func]) ~= "function" then
			frame[func] = function(self, ...)
				local fs = self:GetLabelFontString();
				if fs then
					return fs[func](fs, ...);
				end
			end
		end
	end
	
	if type(frame.IsEnabled) ~= "function" then
		frame.IsEnabled = function(self) return not self[PRIVATE].isDisabled; end
	end
	
	if type(frame.Enable) ~= "function" then
		frame.Enable = function(self) end
	end

	if type(frame.Disable) ~= "function" then
		frame.Disable = function(self) end
	end

	hooksecurefunc(frame, "Enable", function(self)
		if not self[PRIVATE].isDisabled then
			return;
		end
		self[PRIVATE].isDisabled = nil;

		self:TextRestoreColors();
		
		if self._savedBkDropColor then
			self:SetBackdropBorderColor(unpack(self._savedBkDropColor));
		end

		local edge = self:GetEdgeFrame();
		if edge then
			if edge._savedBkDropColor then
				edge:SetBackdropBorderColor(unpack(edge._savedBkDropColor));
			end
			edge:EnableMouse(false);
		end

		local texture;
		for _, texture in ipairs(self[PRIVATE]["textures"]) do
			--texture:SetDesaturated(false);
			texture:Ungreyout();
		end

		if GetMouseFocus() == self then
			self:TextHighlight();
		end

		local temp = { self:GetChildren() };
		local child;
		for _, child in ipairs(temp) do
			if type(child.GetFrameType) == "function" and type(child.Disable) == "function" and type(child.Enable) == "function" and type(child.IsEnabled) == "function" then
				if child.___OriginallyEnabled then
					child:Enable();
				end
			end
		end

		if type(self.OnEnable) == "function" then
			self.OnEnable(self);
		end
	end);	
	
	hooksecurefunc(frame, "Disable", function(self)
		if self[PRIVATE].isDisabled then
			return;
		end
		self[PRIVATE].isDisabled = 1;

		self:TextUnHighlight();
		self:TextGrey();

		self._savedBkDropColor = { self:GetBackdropBorderColor() };
		self:SetBackdropBorderColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
		local edge = self:GetEdgeFrame();
		if edge then
			edge._savedBkDropColor = { edge:GetBackdropBorderColor() };
			edge:SetBackdropBorderColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b);
			edge:EnableMouse(true);
		end

		local texture;
		for _, texture in ipairs(self[PRIVATE]["textures"]) do
			--texture:SetDesaturated(true);
			texture:Greyout();
		end

		local temp = { self:GetChildren() };
		local child;
		for _, child in ipairs(temp) do
			if type(child.GetFrameType) == "function" and type(child.Disable) == "function" and type(child.Enable) == "function" and type(child.IsEnabled) == "function" then
				child.___OriginallyEnabled = child:IsEnabled() and child:IsEnabled() ~= 0;
				child:Disable();
			end
		end

		if type(self.OnDisable) == "function" then
			self.OnDisable(self);
		end
	end);	
	
	return frame;
end

local cursorMonitor = getglobal("BB0BB9C6_350F_4273_96EB_0FF9E7CC18D4");
if not cursorMonitor then
	cursorMonitor = CreateFrame("Frame", "BB0BB9C6_350F_4273_96EB_0FF9E7CC18D4");
	cursorMonitor:Hide();
	cursorMonitor:SetScript("OnUpdate", function(self, elapsed)
		if not GetCursorInfo() then			
			cursorhasAction = nil;
			self:Hide();
		end
	end);

	local function OnActionPickup(slot, isPet)
		if type(slot) == "number" and GetCursorInfo() then	
			cursorhasAction = slot
			cursorMonitor:Show();
		end
	end

	hooksecurefunc("PickupAction", function(slot) OnActionPickup(slot) end);
	hooksecurefunc("PickupPetAction", function(slot) OnActionPickup(slot, 1) end);
end

-- Provides version check
function UICreateCommonUIIsNewerVersion(major, minor)
	if type(major) ~= "number" or type(minor) ~= "number" then
		return false;
	end

	if major > MAJOR_VERSION then
		return true;
	elseif major < MAJOR_VERSION then
		return false;
	else -- major equal, check minor
		return minor > MINOR_VERSION;
	end
end