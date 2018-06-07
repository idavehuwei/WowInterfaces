------------------------------------------------------------
-- OptionBar.lua
--
-- Abin
-- 2008-12-14
------------------------------------------------------------

local L = WHISPERPOP_LOCALE; -- Locale table

-- A private frame for removal of SexyMap hooks
local hookRemoverFrame = CreateFrame("Frame");
hookRemoverFrame:Hide();
hookRemoverFrame:SetScript("OnUpdate", function(self, elapsed)
	if self._removeHook then
		self._updateElapsed = (self._updateElapsed or 0) + elapsed;
		if self._updateElapsed > 0.2 then
			self._updateElapsed = 0;
			-- Check for SexyMap hooks
			if WhisperPopMinimapButton:GetScript("OnDragStart") ~= WhisperPopMinimapButton._fnOnDragStart and WhisperPopMinimapButton:GetScript("OnDragStop") ~= WhisperPopMinimapButton._fnOnDragStop then
				self._removeHook = nil;
				WhisperPopMinimapButton._ModOnDragStart = WhisperPopMinimapButton:GetScript("OnDragStart");
				WhisperPopMinimapButton._ModOnDragStop = WhisperPopMinimapButton:GetScript("OnDragStop");
				WhisperPopMinimapButton:SetScript("OnDragStart", WhisperPopMinimapButton._fnOnDragStart);
				WhisperPopMinimapButton:SetScript("OnDragStop", WhisperPopMinimapButton._fnOnDragStop);
				--DEFAULT_CHAT_FRAME:AddMessage("SexyMap hooks removed", 1, 0, 0);
			end
		end
	else
		self:Hide();
	end
end);

-- To deal with SexyMap
local function DetachMinimapButton(detach)
	local sexymapLoaded = IsAddOnLoaded("SexyMap");
	local hookRemoved = nil;
	if detach and not WhisperPopMinimapButton:IsDetached() then		
		WhisperPopMinimapButton:Detach();
		WhisperPopFrameOptionBarSquareMinimap:Disable();
		if sexymapLoaded then
			if WhisperPopMinimapButton:GetScript("OnDragStart") ~= WhisperPopMinimapButton._fnOnDragStart then
				WhisperPopMinimapButton._ModOnDragStart = WhisperPopMinimapButton:GetScript("OnDragStart");
				WhisperPopMinimapButton._ModOnDragStop = WhisperPopMinimapButton:GetScript("OnDragStop");
				WhisperPopMinimapButton:SetScript("OnDragStart", WhisperPopMinimapButton._fnOnDragStart);
				WhisperPopMinimapButton:SetScript("OnDragStop", WhisperPopMinimapButton._fnOnDragStop);
				hookRemoved = 1;
			end			
			
			WhisperPopDB["SexyMap position"] = { WhisperPopMinimapButton:GetPoint(1) };
			WhisperPopMinimapButton.ClearAllPoints = function() end;
			WhisperPopMinimapButton.SetPoint = function() end;
			WhisperPopMinimapButton.SetAlpha = function() end;
			WhisperPopMinimapButton.Hide = function() end;
			WhisperPopMinimapButton.SetAlpha = function() end;
			WhisperPopMinimapButton:_fnSetAlpha(1);
			WhisperPopMinimapButton:Show();
		end
		
	elseif not detach and WhisperPopMinimapButton:IsDetached() then
		if sexymapLoaded then			
			WhisperPopMinimapButton.ClearAllPoints = WhisperPopMinimapButton._fnClearAllPoints;
			WhisperPopMinimapButton.SetPoint = WhisperPopMinimapButton._fnSetPoint;
			WhisperPopMinimapButton.Hide = WhisperPopMinimapButton._fnHide;
			WhisperPopMinimapButton.SetAlpha = WhisperPopMinimapButton._fnSetAlpha;
			WhisperPopMinimapButton:SetAlpha(1);			

			if WhisperPopMinimapButton._ModOnDragStart then
				WhisperPopMinimapButton:SetScript("OnDragStart", WhisperPopMinimapButton._ModOnDragStart);
				WhisperPopMinimapButton:SetScript("OnDragStop", WhisperPopMinimapButton._ModOnDragStop);
				WhisperPopMinimapButton._ModOnDragStart = nil;
				WhisperPopMinimapButton._ModOnDragStop = nil;
				hookRemoved = 0;				
			end
		end

		WhisperPopMinimapButton:Attach();
		if not sexymapLoaded then
			WhisperPopFrameOptionBarSquareMinimap:Enable();	
		end
		
		if sexymapLoaded then
			if type(WhisperPopDB["SexyMap position"]) == "table" then
				WhisperPopMinimapButton:ClearAllPoints();
				WhisperPopMinimapButton:SetPoint(unpack(WhisperPopDB["SexyMap position"]));
			end

			if type(SexyMap) == "table" and type(SexyMap.OnExit) == "function" then
				SexyMap:OnExit();
			end
		end
	end

	return hookRemoved;
end

local function CreateIconCheckButton(name, parentOrExists, useExists, iconPath, id, l, t, r, b, tooltipTitle, tooltipText, disabledTooltipText)
	local button = nil;
	if useExists then
		button = parentOrExists;
	else
		button = CreateFrame("CheckButton", name, parentOrExists);
	end

	if type(button) ~= "table" or type(button.GetObjectType) ~= "function" or button:GetObjectType() ~= "CheckButton" then
		return nil;
	elseif button.isIconCheckButton then
		return button;
	end

	button.isIconCheckButton = 1;
	button:SetWidth(14);
	button:SetHeight(14);

	if tonumber(id) then
		button:SetID(tonumber(id));
	end

	button.tooltipTitle = tooltipTitle;
	button.tooltipText = tooltipText;
	button.disabledTooltipText = disabledTooltipText;	

	button.cover = CreateFrame("Frame", nil, button);
	button.cover:SetAllPoints(button);
	button.cover:EnableMouse(true);
	button.cover:Hide();	
	
	button.icon = button:CreateTexture(nil, "ARTWORK");
	button:SetNormalTexture(button.icon);

	local texture = button:CreateTexture(nil, "OVERLAY");
	texture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
	texture:SetBlendMode("ADD");
	texture:Hide();
	button:SetHighlightTexture(texture);
	texture:SetAllPoints(button.icon);

	local checkedTexture = button:CreateTexture(nil, "OVERLAY");
	button:SetCheckedTexture(checkedTexture);
	checkedTexture:SetTexture("Interface\\Buttons\\UI-CheckBox-Check");
	checkedTexture:SetPoint("TOPLEFT", button.icon, "TOPLEFT", -4, 4);
	checkedTexture:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", 4, -4);

	texture = button:CreateTexture(nil, "OVERLAY");
	button:SetDisabledCheckedTexture(texture);
	texture:SetTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled");
	texture:SetAllPoints(checkedTexture);	

	button.cover:SetScript("OnEnter", function(self)
		self:GetParent():ShowTooltip(1);
	end);

	button.cover:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
	end);

	button.SetIcon = function(self, iconPath, l, t, r, b)
		if not iconPath or type(iconPath) == "string" then
			self.icon:SetTexture(iconPath);
			if l and t and r and b then
				self.icon:SetTexCoord(l, t, r, b);
			else
				self.icon:SetTexCoord(0, 1, 0, 1);
			end			
			return 1;
		end
		return nil;
	end;

	button.GetIcon = function(self) return self.icon:GetTexture(); end;

	button.Float = function(self)
		self.icon:ClearAllPoints();
		self.icon:SetPoint("TOPLEFT", self, "TOPLEFT", -1, 1);
		self.icon:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 1);
	end;

	button.Sink = function(self)
		self.icon:ClearAllPoints();
		self.icon:SetPoint("TOPLEFT", self, "TOPLEFT", 1, -1);
		self.icon:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 1, -1);
	end;

	button.Restore = function(self)
		self.icon:ClearAllPoints();
		self.icon:SetAllPoints(self);
	end;

	button.ShowTooltip = function(self, disabled)
		GameTooltip:SetOwner(self, "ANCHOR_LEFT");
		GameTooltip:ClearLines();
		if self.tooltipTitle then
			if disabled then
				GameTooltip:AddLine(tostring(self.tooltipTitle), 0.6, 0.6, 0.6);
			else
				GameTooltip:AddLine(tostring(self.tooltipTitle));
			end
		end

		if disabled and self.disabledTooltipText then
			GameTooltip:AddLine(tostring(self.disabledTooltipText), 1, 0, 0, 1);
		end
		
		if self.tooltipText then
			if disabled then
				GameTooltip:AddLine(tostring(self.tooltipText), 0.6, 0.6, 0.6, 1);
			else
				GameTooltip:AddLine(tostring(self.tooltipText), 0, 1, 0, 1);
			end
		end

		GameTooltip:Show();
	end;

	button._OrigEnable = button.Enable
	button.Enable = function(self)
		local ret = self:_OrigEnable();
		self.icon:SetDesaturated(false);
		self.cover:Hide();
		return ret;
	end;

	button._OrigDisable = button.Disable
	button.Disable = function(self)
		local ret = self:_OrigDisable();
		self.icon:SetDesaturated(true);
		self.cover:Show();
		return ret;
	end;

	button:SetScript("OnEnter", function(self)
		self:Float();
		self:ShowTooltip();
	end);

	button:SetScript("OnLeave", function(self)
		GameTooltip:Hide();
		self:Restore();
	end);

	button:SetScript("OnMouseDown", function(self, button)
		if button == "LeftButton" then
			self:Sink();
		end
	end);

	button:SetScript("OnMouseUp", function(self, button)
		if button == "LeftButton" then
			self:Restore();
		end
	end);	

	button:SetScript("OnClick", function(self)
		local id = self:GetID();
		local val = self:GetChecked();
		if id == 1 then
			WhisperPopDB["receiveonly"] = val;
			WhisperPop_RefreshPlayerList();
		elseif id == 2 then
			WhisperPopDB["sound"] = val;
		elseif id == 3 then
			WhisperPopDB["time"] = val;
		elseif id == 4 then
			WhisperPopDB["classicon"] = val;
			WhisperPop_RefreshPlayerList();
		elseif id == 5 then
			WhisperPopDB["level"] = val;
			WhisperPop_RefreshPlayerList();
		elseif id == 6 then
			WhisperPopDB["detach"] = val;
			DetachMinimapButton(val);
		elseif id == 7 then
			WhisperPopDB["squareminimap"] = val;
			WhisperPopMinimapButton:SetOrbit(val);
		elseif id == 8 then
			WhisperPopDB["help"] = val;
		end
		PlaySound("UChatScrollButton");
	end);

	button:Restore();
	button:SetIcon(iconPath, l, t, r, b);

	return button;
end

function WhisperPop_OptionBar_OnLoad(self)
	local name = self:GetName();
	
	local buttons = {
		CreateIconCheckButton(name.."ReceiveOnly", self, false, "Interface\\Icons\\INV_Scroll_10", 1, 0.08, 0.92, 0.08, 0.92, L["receive only"], L["receive only tooltip"]),
		CreateIconCheckButton(name.."Sound", self, false, "Interface\\Icons\\INV_Misc_Bell_01", 2, 0.08, 0.92, 0.08, 0.92, L["sound notifying"], L["sound notifying tooltip"]),
		CreateIconCheckButton(name.."Time", self, false, "Interface\\Icons\\INV_Misc_PocketWatch_02", 3, 0.08, 0.92, 0.08, 0.92, L["time"], L["time tooltip"]),
		CreateIconCheckButton(name.."ClassIcon", self, false, "Interface\\Icons\\INV_Misc_Book_05", 4, 0.08, 0.92, 0.08, 0.92, L["class icon"], L["class icon tooltip"], L["requires playerdb"]),
		CreateIconCheckButton(name.."Level", self, false, "Interface\\Icons\\Spell_Nature_Strength", 5, 0.08, 0.92, 0.08, 0.92, L["level"], L["level tooltip"], L["requires playerdb"]),
		CreateIconCheckButton(name.."Detach", self, false, "Interface\\Icons\\Ability_Druid_Eclipse", 6, 0.08, 0.92, 0.08, 0.92, L["detach minimap button"], L["detach minimap button tooltip"]),
		CreateIconCheckButton(name.."SquareMinimap", self, false, "Interface\\Icons\\Ability_Spy", 7, 0.08, 0.92, 0.08, 0.92, L["square minimap"], L["square minimap tooltip"]),
		CreateIconCheckButton(name.."Help", self, false, "Interface\\TutorialFrame\\TutorialFrame-QuestionMark", 8, 0.1, 0.9, 0.12, 0.88, L["show help tip"], L["show help tip tooltip"]),
	};
	
	for i = 1, #(buttons) do
		buttons[i]:ClearAllPoints();
		if i == 1 then
			buttons[i]:SetPoint("LEFT", self, "LEFT", 0, 0);
		else
			buttons[i]:SetPoint("LEFT", buttons[i - 1], "RIGHT", 4, 0);
		end
	end

	self:RegisterEvent("ADDON_LOADED");
end

function WhisperPop_OptionBar_OnEvent(self, event, addon)
	if event == "ADDON_LOADED" and addon == "WhisperPop" then
		--Initialize your saved variables here
		if type(WhisperPopDB) ~= "table" or not WhisperPopDB["2.0"] then
			WhisperPopDB = { ["classicon"] = 1, ["sound"] = 1, ["time"] = 1, ["help"] = 1 };
		end

		WhisperPopDB["2.0"] = 1;

		WhisperPopFrameOptionBarReceiveOnly:SetChecked(WhisperPopDB["receiveonly"]);
		WhisperPopFrameOptionBarSound:SetChecked(WhisperPopDB["sound"]);
		WhisperPopFrameOptionBarClassIcon:SetChecked(WhisperPopDB["classicon"]);
		WhisperPopFrameOptionBarLevel:SetChecked(WhisperPopDB["level"]);
		WhisperPopFrameOptionBarSquareMinimap:SetChecked(WhisperPopDB["squareminimap"]);
		WhisperPopFrameOptionBarTime:SetChecked(WhisperPopDB["time"]);
		WhisperPopFrameOptionBarDetach:SetChecked(WhisperPopDB["detach"]);
		WhisperPopFrameOptionBarHelp:SetChecked(WhisperPopDB["help"]);		

		if not IsAddOnLoaded("PlayerDB") then
			WhisperPopDB["classicon"] = nil;
			WhisperPopDB["level"] = nil;
			WhisperPopFrameOptionBarClassIcon:Disable();
			WhisperPopFrameOptionBarLevel:Disable();
		end

		WhisperPopMinimapButton:RegisterDB(WhisperPopDB);
		local sexymapLoaded = IsAddOnLoaded("SexyMap");
		local _, radius = WhisperPopMinimapButton:GetOrbit();
		if sexymapLoaded then
			WhisperPopFrameOptionBarSquareMinimap.disabledTooltipText = L["disabled by SexyMap"];
			WhisperPopDB["squareminimap"] = nil;
			WhisperPopFrameOptionBarSquareMinimap:SetChecked(nil);
			WhisperPopFrameOptionBarSquareMinimap:Disable();
			radius = radius - 5;
		end

		WhisperPopMinimapButton:SetOrbit(WhisperPopDB["squareminimap"], radius);

		if WhisperPopDB["detach"] then
			local hookRemoved = DetachMinimapButton(1);
			if sexymapLoaded and not hookRemoved then
				hookRemoverFrame._removeHook = 1;
				hookRemoverFrame:Show(); -- Delayed removal of SexyMap hooks!
			end
		end
	end
end