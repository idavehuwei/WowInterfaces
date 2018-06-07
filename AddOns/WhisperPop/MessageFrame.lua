------------------------------------------------------------
-- MessageFrame.lua
--
-- Abin
-- 2008-12-17
------------------------------------------------------------

local L = WHISPERPOP_LOCALE; -- Locale table
local LINE_WIDTH = 240;

local function CreateMessageLine(name, parent)
	local frame = CreateFrame("SimpleHTML", name, parent);
	frame:SetHeight(20);
	frame:SetWidth(LINE_WIDTH);
	frame:SetText("<html><body><h1>Heading1</h1><p>A paragraph</p></body></html>");
	frame:SetFontObject(WhisperPopWrappingFont);
	frame:EnableMouse(true);
	
	frame.SetLineText = function(self, text, timeStamp, r, g, b, testFont)
		if text and text ~= "" then
			self.text = text;
			if timeStamp then
				text = timeStamp.." "..text;
			end

			self:SetText(text);
			testFont:SetText(text);

			if r and g and b then
				self:SetTextColor(r, g, b, alpha);
			end

			local height = testFont:GetHeight();
			if height and height > 0 then
				self:SetHeight(height);
			else
				self:SetHeight(1);
			end
		end
	end;

	frame:SetScript("OnMouseUp", function(self, button)
		if IsControlKeyDown() and button == "LeftButton" and MouseIsOver(self) then
			if SELECTED_CHAT_FRAME.editBox:IsVisible() then
				SELECTED_CHAT_FRAME.editBox:Insert(self.text);
			else
				ChatFrame_OpenChat(self.text);
			end
			PlaySound("UChatScrollButton");
		end
	end);

	frame:SetScript("OnEnter", function(self)
		self:GetParent().background:SetAllPoints(self);
		self:GetParent().background:Show();

		if self.text and WhisperPopDB["help"] then
			WhisperPop_ShowHelpTip(WhisperPopFrameMessageFrame, L["message help tip text"]);
		end
	end);

	frame:SetScript("OnLeave", function(self)
		self:GetParent().background:Hide();
		GameTooltip:Hide();
	end);
	
	frame:SetScript("OnHyperlinkClick", function(self, link, text, button)
		ChatFrame_OnHyperlinkShow(self, link, text, button);
	end);

	-- Removed, it's annoying
	frame:SetScript("OnHyperlinkEnter", function(self, link)
		if WhisperPopDB["help"] then
			WhisperPop_ShowHelpTip(WhisperPopFrameMessageFrame, L["link tip text1"], L["link tip text2"]);
		end

	end);

	frame:SetScript("OnHyperlinkLeave", function(self)
		GameTooltip:Hide();
	end);

	return frame;
end

function WhisperPop_MessageFrame_OnLoad(self)
	self._lines = {};
	self._numLines = 0;
	self._totalHeight = 0;
	self:SetClampedToScreen(true);

	-- This is to determine the real height of a message line, which could be wrapped. I know it is a rather ugly approach but hey,
	-- you have any better idea?
	self._tempFont = self:CreateFontString(nil, "ARTWORK", "WhisperPopWrappingFont");
	self._tempFont:Hide();
	self._tempFont:SetWidth(LINE_WIDTH);
	self._tempFont:SetText("WhisperPop");
	
	local scrollChild = CreateFrame("Frame");
	scrollChild:SetHeight(20);

	scrollChild.background = scrollChild:CreateTexture(nil, "BACKGROUND");	
	scrollChild.background:SetTexture(0.196, 0.388, 0.8, 0.25);
	scrollChild.background:Hide();

	local scrollFrame = UICreateScrollFrame(nil, self);
	self.scrollFrame = scrollFrame;
	scrollFrame:SetPoint("TOPLEFT", self, "TOPLEFT", 5, -27);
	scrollFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -5, 5);
	scrollFrame:DisableHorizontalBar();
	scrollFrame:SetScrollStep(self._tempFont:GetHeight());		
	scrollFrame:SetAutoChildWidth(true);
	scrollFrame:SetScrollChild(scrollChild);
	
	self.NumLines = function(self)
		return self._numLines;
	end;

	self.ClearLines = function(self)
		self._totalHeight = 0;
		self._numLines = 0;
		local i;
		for i = 1, table.getn(self._lines) do
			self._lines[i]:Hide();
		end
		self:SetHeight(50);
	end;
	
	self.AddLine = function(self, text, timeStamp, r, g, b)
		self._numLines = self._numLines + 1;
		local line = self._lines[self._numLines];
		if not line then
			line = CreateMessageLine(nil, self.scrollFrame:GetScrollChild());
			table.insert(self._lines, line);

			local idx = table.getn(self._lines);
			if idx == 1 then
				line:SetPoint("TOPLEFT", self.scrollFrame:GetScrollChild(), "TOPLEFT", 0, 0);
				line:SetPoint("TOPRIGHT", self.scrollFrame:GetScrollChild(), "TOPRIGHT", 0, 0);
			else
				line:SetPoint("TOPLEFT", self._lines[idx - 1], "BOTTOMLEFT", 0, 0);
				line:SetPoint("TOPRIGHT", self._lines[idx - 1], "BOTTOMRIGHT", 0, 0);
			end
		end

		line:SetLineText(text, timeStamp, r, g, b, self._tempFont);
		line:Show();

		self._totalHeight = self._totalHeight + line:GetHeight();
		self:SetHeight(math.max(50, math.min(40 + self._totalHeight, GetScreenHeight() * 0.75)));		
	end;

	self.SetData = function(self, anchor, receivedOnly, showTimeStamp, showClassIcon, showLevel)
		local data = anchor._data;
		self.name = nil;

		if not data then
			self:Hide();
			return;
		end

		self.name = data["name"];

		local class, level;
		if showClassIcon then
			class = data["class"];
		end

		if showLevel then
			level = data["level"];
		end

		dwGetglobal(self:GetName().."PlayerLabel"):SetPlayer(data["name"], class, level);
		self:ClearLines();

		local i;
		for i = 1, table.getn(data["messages"]) do
			local msg = data["messages"][i];
			if not msg["inform"] or not receivedOnly then
				local r, g, b = 1, 0.5, 1; -- Incoming whisper color
				if msg["inform"] then
					r, g, b = 0.5, 0.5, 0.5; -- Outgoing message color (gray)
				end

				local timeStamp = nil;
				if showTimeStamp then
					timeStamp = msg["time"];
				end
				self:AddLine(msg["text"], timeStamp, r, g, b);
			end
		end
		
		self:ClearAllPoints();
		if anchor:GetLeft() < self:GetWidth() + 20 then			
			self:SetPoint("LEFT", anchor, "TOPRIGHT", 7, 0);
		else
			self:SetPoint("RIGHT", anchor, "TOPLEFT", -7, 0);
		end
			
		self:Show();
		self.scrollFrame:ScrollToBottom();
		self:CancelDelayHide();	
	end;

	self.IsReading = function(self, name)
		return self:IsShown() and self.name and self.name == name;
	end;

	self.DelayHide = function(self)
		self._hideTime = GetTime() + 0.25;
	end;

	self.CancelDelayHide = function(self)
		self._hideTime = nil;
	end;
end

function WhisperPop_MessageFrame_OnUpdate(self, elapsed)
	if self._hideTime and GetTime() > self._hideTime and not MouseIsOver(self) then
		self:Hide();
	end
end

function WhisperPop_MessageFrame_OnHide(self)
	self:CancelDelayHide();
	self.name = nil;
	self:Hide();
end