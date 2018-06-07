------------------------------------------------------------
-- WhisperPop.lua
--
-- Abin
-- 2008-12-14
------------------------------------------------------------

local VERSION = GetAddOnMetadata("WhisperPop", "Version") or "";
local L = WHISPERPOP_LOCALE; -- Locale table
local IGNORES = { "<DBM>", "<BWS>", "<BigWigs>", "<BIGWIGS>", "LVBM" }; -- Add your ignore tags
local listButtons = {}; -- A list of created buttons
local listMessages = {}; -- The message list
local WHISPERPOPHOLDTIME = 0.1;
-- Check for ignored messages
local function IsIgnoredMessage(text)
	local ignore;
	for _, ignore in ipairs(IGNORES) do
		if string.find(text, ignore) == 1 then
			return ignore;
		end
	end
	return nil;
end

-- Find a record from the message list
local function FindName(name)
	local i;
	for i = 1, table.getn(listMessages) do
		if listMessages[i]["name"] == name then
			return i;
		end
	end
	return nil;
end

-- Check for unread messages
local function HasNewMessages()
	local temp = {};
	local i;
	for i = 1, table.getn(listMessages) do
		if listMessages[i]["new"] then
			table.insert(temp, { ["name"] = listMessages[i]["name"], ["time"] = listMessages[i]["new"] });
		end
	end

	if table.getn(temp) == 0 then
		temp = nil;
	end
	return temp;
end

-- Received PlayerDB update notification
local function OnPlayerDBNotify(name, class, race, level)
	local i;
	for i = 1, table.getn(listButtons) do
		local data = listButtons[i]._data;
		if data and data["name"] == name then
			data["class"] = class;
			data["level"] = level;
			listButtons[i]:SetData(data);
			return;
		end
	end
end

-- Show the help-tip
function WhisperPop_ShowHelpTip(owner, ...)
	if type(owner) == "table" and type(owner.GetObjectType) == "function" then -- make sure owner if a frame
		if owner:GetBottom() < 120 then
			GameTooltip:SetOwner(owner, "ANCHOR_RIGHT", -2 - owner:GetWidth(), 2);
		else
			GameTooltip:SetOwner(owner, "ANCHOR_BOTTOMRIGHT", -2 - owner:GetWidth(), -2);
		end

		GameTooltip:ClearLines();
		GameTooltip:AddLine(L["help tip"]);

		local lines = { ... };
		local i;
		for i = 1, table.getn(lines) do
			GameTooltip:AddLine(lines[i], 1, 1, 1, 1);
		end

		GameTooltip:Show();
	end
end

-- Update all buttons in the players list
function WhisperPop_RefreshPlayerList()	
	local count = 0;
	local i;
	for i = 1, table.getn(listMessages) do
		if listMessages[i]["received"] or not WhisperPopDB["receiveonly"] then
			count = count + 1;
			local button = listButtons[count];
			if not button then
				-- Create a new button
				button = CreateFrame("Button", "WhisperPopPlayerButton"..count, WhisperPopFrame.scrollFrame:GetScrollChild(), "WhisperPopPlayerListButtonTemplate");
				table.insert(listButtons, button);

				-- Align the new button
				if count == 1 then
					-- the 1st one
					button:SetPoint("TOPLEFT", WhisperPopFrame.scrollFrame:GetScrollChild(), "TOPLEFT", 0, 0);
					button:SetPoint("TOPRIGHT", WhisperPopFrame.scrollFrame:GetScrollChild(), "TOPRIGHT", 0, 0);
				else
					button:SetPoint("TOPLEFT", listButtons[count - 1], "BOTTOMLEFT", 0, 0);
					button:SetPoint("TOPRIGHT", listButtons[count - 1], "BOTTOMRIGHT", 0, 0);
				end
			end
			button:SetData(listMessages[i]);
		end
	end

	for i = count + 1, table.getn(listButtons) do
		listButtons[i]:SetData(nil); -- Hide all excess buttons
	end

	WhisperPopFrame.scrollFrame:SetVerticalScroll(0);
end

---------------------------------------------------------------------
-- WhisperPopPlayerButtonTemplate
---------------------------------------------------------------------

function WhisperPopPlayerButton_OnLoad(self)
	self.SetTextColor = function(self, r, g, b)
		if r and g and b then
			dwGetglobal(self:GetName().."NameText"):SetTextColor(r, g, b);
		else
			dwGetglobal(self:GetName().."NameText"):SetTextColor(1, 1, 1);
		end
	end

	self.SetPlayer = function(self, name, class, level)		
		local icon = dwGetglobal(self:GetName().."ClassIcon");
		local levelText =  dwGetglobal(self:GetName().."LevelText");
		local nameText = dwGetglobal(self:GetName().."NameText");

		if type(name) == "string" then
			nameText:SetText(name);
			self.name = name;
		else
			nameText:SetText(nil);
			self.name = nil;
		end		

		local coords;
		if type(class) == "string" then
			coords = CLASS_BUTTONS[class];
		end

		if coords then
			icon:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
			icon:SetWidth(16);
			icon:Show();
		else
			icon:SetWidth(1);
			icon:Hide();
		end		

		if type(level) == "number" and level > 0 then
			local color = GetDifficultyColor(level);
			levelText:SetText(level);
			levelText:SetTextColor(color.r, color.g, color.b);
			levelText:SetWidth(20);
			levelText:Show();
		else
			levelText:SetWidth(1);
			levelText:Hide();
		end
	end
end

function WhisperPopPlayerButton_OnMouseDown(self, button)
	dwGetglobal(self:GetName().."ClassIcon"):ClearAllPoints();
	dwGetglobal(self:GetName().."ClassIcon"):SetPoint("LEFT", self, "LEFT", 1, -1);
end

function WhisperPopPlayerButton_OnMouseUp(self, button)
	dwGetglobal(self:GetName().."ClassIcon"):ClearAllPoints();
	dwGetglobal(self:GetName().."ClassIcon"):SetPoint("LEFT", self, "LEFT", 0, 0);

	if self.name and MouseIsOver(self) then	
		if button == "RightButton" then
			-- Right click brings up unit drop down menu
			FriendsFrame_ShowDropdown(self.name, 1);
		elseif button == "LeftButton" then
			if IsShiftKeyDown() then
				-- Query player info
				SendWho("n-"..self.name);
			elseif IsAltKeyDown() then
				-- Invite
				InviteUnit(self.name);
			else
				-- Left click opens SELECTED_CHAT_FRAME.editBox
				local text = "/w "..self.name;
				if not SELECTED_CHAT_FRAME.editBox:IsVisible() then
 					ChatFrame_OpenChat(text);
				else
					SELECTED_CHAT_FRAME.editBox:SetText(text);
				end;
				ChatEdit_ParseText(ChatFrame1.editBox, 0);
			end
		end
	end
end

---------------------------------------------------------------------
-- WhisperPopPlayerListButtonTemplate
---------------------------------------------------------------------

function WhisperPopPlayerListButton_OnLoad(self)	
	WhisperPopPlayerButton_OnLoad(self);
	dwGetglobal(self:GetName().."Highlight"):SetVertexColor(0.196, 0.388, 0.8);

	self.SetData = function(self, data)		
		self:Hide();
		self:SetPlayer(nil);
		self._data = data;
		if data then
			local class, level;
			if WhisperPopDB["classicon"] then
				class = data["class"];
			end

			if WhisperPopDB["level"] then
				level = data["level"];
			end			

			local r, g, b = 0.5, 0.5, 0.5; -- Grey, only contains sent messages
			if data["new"] then
				r, g, b = 0, 1, 0; -- Green text means there are unread messages from self person
			elseif data["received"] then
				r, g, b = 1, 1, 1; -- White, contains received messages
			end

			self:SetPlayer(data["name"], class, level);
			self:SetTextColor(r, g, b);
			self:Show();

			if WhisperPopFrameMessageFrame:IsReading(data["name"]) then
				WhisperPopFrameMessageFrame:SetData(self, WhisperPopDB["receiveonly"], WhisperPopDB["time"], WhisperPopDB["classicon"], WhisperPopDB["level"]);
			end
		end		
	end;
	
	self.DeleteData = function(self)
		if self._data then
			local idx = FindName(self._data["name"]);
			if idx then
				if WhisperPopFrameMessageFrame:IsReading(self._data["name"]) then
					WhisperPopFrameMessageFrame:Hide();
				end
				self:Hide();
				table.remove(listMessages, idx);
				WhisperPop_RefreshPlayerList();
			end
		end		
	end;
end

function WhisperPopPlayerListButton_OnEnter(self)
	-- Displays whisper messages in GameTooltip
	if self._data then
		self._data["new"] = nil;
		if WhisperPopMinimapButton:IsFlashing() and not HasNewMessages() then
			WhisperPopMinimapButton:StopFlash();
			WhisperPop_StopFlash();
			WhisperPopMinimapButton:SetGreyscale(true);
		end

		local r, g, b = 0.5, 0.5, 0.5; -- Grey, only contains sent messages
		if self._data["received"] then
			r, g, b = 1, 1, 1; -- White, contains received messages
		end
		self:SetTextColor(r, g, b);		
			
		WhisperPopFrameMessageFrame:SetData(self, WhisperPopDB["receiveonly"], WhisperPopDB["time"], WhisperPopDB["classicon"], WhisperPopDB["level"]);

		if self.name and WhisperPopDB["help"] then
			WhisperPop_ShowHelpTip(WhisperPopFrame, string.format(L["player help tip text 1"], self.name), string.format(L["player help tip text 2"], self.name), string.format(L["player help tip text 3"], self.name), string.format(L["player help tip text 4"], self.name));
		end
	end		
end

function WhisperPopPlayerListButton_OnLeave(self)
	WhisperPopFrameMessageFrame:DelayHide();
	GameTooltip:Hide();
end

function WhisperPopPlayerListButton_CloseButton_OnEnter(self)
	if self:GetParent().name and WhisperPopDB["help"] then
		WhisperPop_ShowHelpTip(WhisperPopFrame, string.format(L["delete message"], self:GetParent().name));
	end
end

---------------------------------------------------------------------
-- WhisperPopFrame
---------------------------------------------------------------------

function WhisperPop_OnLoad(self)
	WhisperPopFrameTitle:SetText(L["title"].." "..VERSION);

	-- Create the minimap button for this addon
	UICreateMinimapButton("WhisperPopMinimapButton", "Interface\\Icons\\INV_Letter_05", 20);

	-- Some dirty work to deal with SexyMap...
	WhisperPopMinimapButton._fnClearAllPoints = WhisperPopMinimapButton.ClearAllPoints;
	WhisperPopMinimapButton._fnSetPoint = WhisperPopMinimapButton.SetPoint;
	WhisperPopMinimapButton._fnSetAlpha = WhisperPopMinimapButton.SetAlpha;
	WhisperPopMinimapButton._fnHide = WhisperPopMinimapButton.Hide;
	WhisperPopMinimapButton._fnOnDragStart = WhisperPopMinimapButton:GetScript("OnDragStart");
	WhisperPopMinimapButton._fnOnDragStop = WhisperPopMinimapButton:GetScript("OnDragStop");
	
	WhisperPopMinimapButton:SetOptionFrame("WhisperPopFrame");
	WhisperPopMinimapButton:SetGreyscale(true);

	WhisperPopMinimapButton:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT");
		GameTooltip:ClearLines();

		GameTooltip:AddLine(L["title"].." "..VERSION);
		local newNames = HasNewMessages();
		if newNames then
			GameTooltip:AddLine(L["new messages from"], 1, 1, 1, true);
			local i;
			for i = 1, table.getn(newNames) do
				GameTooltip:AddLine(newNames[i]["name"].." "..newNames[i]["time"], 0, 1, 0, true);
			end
		else
			GameTooltip:AddLine(L["no new messages"], 1, 1, 1, true);
		end
		GameTooltip:Show();
	end);
	
	-- Create a scroll frame for message displaying	
	local scrollChild = CreateFrame("Frame");
	scrollChild:SetHeight(20);

	local scrollFrame = UICreateScrollFrame(nil, self);
	self.scrollFrame = scrollFrame;
	scrollFrame:SetAllPoints(WhisperPopFrameListFrame);
	scrollFrame:DisableHorizontalBar();
	scrollFrame:SetScrollStep(20);		
	scrollFrame:SetAutoChildWidth(true);
	scrollFrame:SetScrollChild(scrollChild);

	if type(UIRegisterEscapeCloseFrame) == "function" then
		-- Simple if my OptionFrame-1.0 library is loaded some where
		UIRegisterEscapeCloseFrame(WhisperPopFrameMessageFrame, 1);
		UIRegisterEscapeCloseFrame(WhisperPopFrame);
	else
		-- Hook CloseSpecialWindows function
		local _Saved_CloseSpecialWindows = CloseSpecialWindows;
		CloseSpecialWindows =  function()
			local visible = _Saved_CloseSpecialWindows();
			if WhisperPopFrameMessageFrame:IsVisible() then
				WhisperPopFrameMessageFrame:Hide();
				visible = 1;
			elseif WhisperPopFrame:IsVisible() then
				WhisperPopFrame:Hide();
				visible = 1;
			end
			return visible;
		end
	end	

	SLASH_WHISPERPOP1 = "/whisperpop";
	SlashCmdList["WHISPERPOP"] = WhisperPop_ToggleFrame;

	if IsAddOnLoaded("PlayerDB") then
		PlayerDB_RegisterHandler(OnPlayerDBNotify);
	end	
	
	self:SetUserPlaced(true);
	self:RegisterForDrag("LeftButton");
	
	--DEFAULT_CHAT_FRAME:AddMessage("|cffffff78"..L["title"].." "..VERSION.." by Abin loaded.");
end

function WhisperPop_Toggle(switch)
	if (switch) then
		WhisperPopFrame:RegisterEvent("CHAT_MSG_WHISPER");
		WhisperPopFrame:RegisterEvent("CHAT_MSG_WHISPER_INFORM");
		WhisperPopFrame:RegisterEvent("CHAT_MSG_BN_WHISPER");
		WhisperPopFrame:RegisterEvent("CHAT_MSG_BN_WHISPER_INFORM");
		WhisperPopOutButton:Show();
	else
		WhisperPopFrame:UnregisterEvent("CHAT_MSG_WHISPER");
		WhisperPopFrame:UnregisterEvent("CHAT_MSG_WHISPER_INFORM");
		WhisperPopFrame:UnregisterEvent("CHAT_MSG_BN_WHISPER");
		WhisperPopFrame:UnregisterEvent("CHAT_MSG_BN_WHISPER_INFORM");
		WhisperPopFrame:Hide();
		WhisperPopOutButton:Hide();
	end
end

function WhisperPop_OnEvent(self, event, text, name)
	if type(text) == "string" and type(name) == "string" and not IsIgnoredMessage(text) then
		-- Whenever we recieve a whisper message, we check if the person is already in list, if it is, we bring it to top
		local inform = (event == "CHAT_MSG_WHISPER_INFORM" or event == "CHAT_MSG_BN_WHISPER_INFORM");
		local idx = FindName(name);
		local data;
		if idx then
			data = table.remove(listMessages, idx);		
		else			
			data = { ["name"] = name, ["messages"] = {} }; -- Person not in list, create a new record for him
			if IsAddOnLoaded("PlayerDB") then
				local class, _, level = PlayerDB_Query(name);
				data["class"] = class;
				data["level"] = level;

				-- If PlayerDB doesn't have any info of this person, force it to query from game servers
				if not class then
					SendWho("n-"..name);
				end
			end
		end

		local timeStamp = "|cffffd200"..string.sub(date(), 10, 17).."|r";		
		table.insert(data["messages"], { ["len"] = string.len(text), ["text"] = text, ["time"] = timeStamp, ["inform"] = inform });	
		table.insert(listMessages, 1, data);

		-- Do we need to notify?
		if inform then			
			if data["new"] then
				-- Replying a person removes the "new" mark from him
				data["new"] = nil;
				if WhisperPopMinimapButton:IsFlashing() and not HasNewMessages() then
					WhisperPopMinimapButton:StopFlash();
					WhisperPop_StopFlash();
					WhisperPopMinimapButton:SetGreyscale(true);
				end
			end
		else
			data["received"] = 1;
			if WhisperPopDB["sound"] then
				PlaySoundFile("Interface\\AddOns\\WhisperPop\\Notify.mp3"); -- Got new message!
			end			
			
			if not WhisperPopFrameMessageFrame:IsReading(name) then
				data["new"] = timeStamp;
				WhisperPopMinimapButton:SetGreyscale(false);
				WhisperPopMinimapButton:StartFlash(0.5, 0.5);
				WhisperPop_StartFlash();
			end						
		end		

		WhisperPop_RefreshPlayerList();
	end
end

function WhisperPop_ToggleFrame()
	if WhisperPopFrame:IsShown() then
		WhisperPopFrame:Hide();
	else
		WhisperPopFrame:Show();
	end
end

function WhisperPop_StartFlash()
	WhisperPopOutButton.flashMode = true;
	WhisperPopOutButton.mode = "OUT";
	WhisperPopOutButton.flashTime = 0;
	WhisperPopOutButton.timeToFade = 0.8;
	WhisperPopOutButton.flash:Show();
end

function WhisperPop_StopFlash()
	WhisperPopOutButton.flashMode = false;
	WhisperPopOutButton.flash:Hide();
end

function WhisperPopOutButton_OnUpdate(self, elapsed)
	if (self.flashMode) then		
		self.flashTime = self.flashTime + elapsed;
		if (self.mode == "IN") then
			if (self.flashTime < self.timeToFade) then
				self.flash:SetAlpha(1-0.8*(self.flashTime / self.timeToFade));
			else
				self.mode = "OUT";
		
				self.flashTime = 0;
			end
		elseif (self.mode == "HOLD") then
			if (self.flashTime < WHISPERPOPHOLDTIME) then
				self.flash:SetAlpha(1.0);
			else
				self.mode = "IN";
				self.flashTime = 0;
			end
		elseif (self.mode == "OUT") then
			if (self.flashTime < self.timeToFade) then
				self.flash:SetAlpha(0.2+0.8*(self.flashTime / self.timeToFade));
			else				
				self.mode = "HOLD";
				self.flashTime = 0;
			end
		end
	else
		if (self.flash:IsShown()) then
			self.flash:Hide();
		end		
	end
end

BINDING_HEADER_WHISPERPOP_TITLE = L["title"];
BINDING_NAME_WHISPERPOP_TOGGLE = L["toggle frame"];