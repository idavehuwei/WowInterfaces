------------------------------------------------------------
-- EasyTrinket.lua
--
-- Trinket management. Command: /easytrinket or /ezt
--
-- Abin
-- 2008-1-14
------------------------------------------------------------
DuowanAddon_EasyTrinketDB = {
	["showhotkey"] = 1, 
	["autowhip"] = 3, 
	["scale"] = 95,
	["rows"] = 5, 
	["prevMounted"] = 1,
	["simpleTooltip"] = 1,
	["menukey"] = 1,
	["minimapbutton"] = 1 
};

EASYTRINKET_MENUBUTTON_NUM = 32; -- 32 buttons should be enough

local BUTTONFACADE_LOADED = IsAddOnLoaded("ButtonFacade");
local TRINKET_BUTTON_WIDTH = 36; -- Button width
local WEAR_RETRY_INTERVAL = 0.5; -- Time between each 2 retrys of wearing a trinket
local MENU_HIDE_DELAY = 0.5; -- Delay time for hiding the menu bar

local modifierKeys = {};

local mainBar = CreateFrame("Frame", "EasyTrinketMainBar", UIParent, "SecureFrameTemplate"); -- The main trinket button bar (secure frame)
local menuBar = CreateFrame("Frame", "EasyTrinketMenuBar", mainBar); -- The menu trinket button bar (non-secure frame)

------------------------------------------------------------
-- Internal Functions
------------------------------------------------------------

-- Extracts trinket info from a specific inventory/container slot
local function GetTrinketInfo(bag, slot)
	local lnk;
	if bag and slot then
		lnk = GetContainerItemLink(bag, slot);		
	else
		lnk = GetInventoryItemLink("player", bag);
	end

	if lnk then
		local _, _, _, _, _, _, _, _, equipSlot, texture = GetItemInfo(lnk);
		if equipSlot == "INVTYPE_TRINKET" then
			return lnk, texture;
		end
	end

	return nil;
end

-- To reduce CPU utilization for OnUpdate scripts
local function CheckUpdateElapse(frame, elapsed, required)
	-- for high performance, we don't do any sanity check here, the programmer is responsible for passing correct args
	frame._updateElapsed = (frame._updateElapsed or 0) + elapsed;
	if frame._updateElapsed > required then
		frame._updateElapsed = 0;
		return 1;
	else
		return nil;
	end
end

local function IsMenuKeyDown()
	local menuKey = DuowanAddon_EasyTrinketDB["menukey"];
	if menuKey == 2 then
		return IsAltKeyDown();
	elseif menuKey == 3 then
		return IsControlKeyDown();
	elseif menuKey == 4 then
		return IsShiftKeyDown();
	else
		return 1;
	end
end

-- Create a generic trinket button
local function CreateTrinketButton(name, parent, template)
	local button = CreateFrame("Button", name, parent, template);
	button:SetWidth(TRINKET_BUTTON_WIDTH);
	button:SetHeight(TRINKET_BUTTON_WIDTH);	
	button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress");
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD");

	if not BUTTONFACADE_LOADED then
		button:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 1, edgeFile = "", edgeSize = 0, insets = {left = 0, right = 0, top = 0, bottom = 0 }, });
		button:SetBackdropColor(0, 0, 0, 0);
	end

	button.icon = button:CreateTexture(name.."Icon", "ARTWORK");
	button.icon:SetAllPoints(button);	

	button.cooldown = CreateFrame("Cooldown", name.."CD", button, "CooldownFrameTemplate");  -- Do not use name.."Cooldown" or the cooldown frame gets messed up by ButtonFacade
	button.cooldown:SetAllPoints(button.icon);

	button.cooldown.text = button.cooldown:CreateFontString(name.."CDText", "ARTWORK", "NumberFontNormalRight");
	button.cooldown.text:SetPoint("BOTTOMRIGHT", button.icon, "BOTTOMRIGHT", -2, 2);

	-- Dream-layout
	button.UpdateDLayout = function(self, show, r, g, b, a)
		if BUTTONFACADE_LOADED then return end
		if show then
			self:SetBackdropColor(r, g, b, a);
			self.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92);
			self.icon:ClearAllPoints();
			self.icon:SetPoint("TOPLEFT", self, "TOPLEFT", 2, -2);
			self.icon:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -2, 2);
			self:GetPushedTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9);
		else
			self:SetBackdropColor(0, 0, 0, 0);
			self.icon:SetTexCoord(0, 1, 0, 1);
			self.icon:ClearAllPoints();
			self.icon:SetAllPoints(self);
			self:GetPushedTexture():SetTexCoord(0, 1, 0, 1);
		end
	end
	
	-- Trinket tooltip
	button.ShowTooltip = function(self, simple)
		if not self._link then
			return;
		end

		GameTooltip:SetOwner(self, "ANCHOR_LEFT");
		GameTooltip:ClearLines();
		if simple then
			local name, _, quality = GetItemInfo(self._link);
			local r, g, b = GetItemQualityColor(quality);
			GameTooltip:AddLine(name, r, g, b);
		else
			if self._bag and self._slot then
				GameTooltip:SetBagItem(self._bag, self._slot);
			else			
				GameTooltip:SetInventoryItem("player", self:GetID());
			end
		end

		-- in case the trinket slot is empty
		if GameTooltip:NumLines() > 0 then
			GameTooltip:Show();
		end
	end

	-- Shift-click to send trinket link to chat frame editbox
	button.PostLinkToChat = function(self, button)
		local post = (self._link and button == "LeftButton" and IsShiftKeyDown() and SELECTED_CHAT_FRAME.editBox:IsShown());
		if post then
			SELECTED_CHAT_FRAME.editBox:Insert(self._link);
		end
		return post;
	end

	-- Update cooldown graph
	button.cooldown.UpdateCooldown = function(self, lnk)
		self.start, self.duration, self.enable = GetItemCooldown(lnk);
		CooldownFrame_SetTimer(self, self.start, self.duration, self.enable);
	end

	button.cooldown:SetScript("OnUpdate", function(self, elapsed)
		if not CheckUpdateElapse(self, elapsed, TOOLTIP_UPDATE_TIME) or not self.text:IsShown() then
			return;
		end

		-- update cooldown text
		local r, g, b = 1, 1, 1;
		local seconds = math.max(0, math.floor((self.duration or 0) - (GetTime() - (self.start or 0))));			
		local minutes = math.floor(seconds / 60);
		seconds = seconds % 60;

		if minutes >= 10 then
			self.text:SetText("10M+"); -- longer than 10 minutes
		elseif minutes > 0 then
			self.text:SetText(string.format("%d:%02d", minutes, seconds));
		else
			-- for time shorter than 1 minute, only display seconds, red for 0-15s, yellow for 15-30s, green for 30-60s
			if seconds < 15 then
				r, g, b = 1, 0, 0;
			elseif seconds < 30 then
				r, g, b = 1, 1, 0;
			else
				r, g, b = 0, 1, 0;
			end
			self.text:SetText(string.format("%d", seconds));
		end
		
		self.text:SetTextColor(r, g, b);
	end);

	button:SetScript("OnEnter", function(self)
		self:GetParent().mouseover = self;
		self:GetParent():StopCounting();
		self:ShowTooltip(DuowanAddon_EasyTrinketDB["simpleTooltip"]);
	end);

	button:SetScript("OnLeave", function(self)
		self:GetParent().mouseover = nil;
		self:GetParent():StartCounting();
		GameTooltip:Hide();
	end);

	button:SetScript("OnUpdate", function(self) self.cooldown:UpdateCooldown(self._link) end);

	return button;	
end

-- Create a main trinket button (secure button)
local function CreateMainTrinketButton(name, parent, id)
	local button = CreateTrinketButton(name, parent, "SecureActionButtonTemplate");
	
	-- Button hotkey text
	button.hotkey = button:CreateFontString(name.."HotKey", "OVERLAY", "NumberFontNormalSmallGray");
	button.hotkey:SetJustifyH("RIGHT");
	button.hotkey:SetWidth(TRINKET_BUTTON_WIDTH);
	button.hotkey:SetHeight(10);
	button.hotkey:SetPoint("TOPLEFT", -2, -2);

	-- Pending frame
	button.pending = CreateFrame("Frame", name.."Pending", button);
	button.pending:Hide();
	button.pending:SetPoint("TOPLEFT", button, "CENTER");
	button.pending:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT");
	button.pending:SetBackdrop({ bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 1, edgeFile = "", edgeSize = 0, insets = {left = 0, right = 0, top = 0, bottom = 0 }, });
	button.pending:SetBackdropColor(1, 0, 0, 1);

	button.pending.icon = button.pending:CreateTexture(name.."PendingIcon", "ARTWORK");
	button.pending.icon:SetPoint("TOPLEFT", button.pending, "TOPLEFT", 1, -1);
	button.pending.icon:SetPoint("BOTTOMRIGHT", button.pending, "BOTTOMRIGHT", -1, 1);
	button.pending.icon:SetTexCoord(0.08, 0.92, 0.08, 0.92);

	button.pending.Stop = function(self)
		self:Hide();
		self.bag = nil;
		self.slot = nil;
		self._link = nil;
		self._name = nil;
	end

	button.pending.Start = function(self, lnk, bag, slot)
		self:Stop();
		if lnk then			
			local name, _, _, _, _, _, _, _, _, texture = GetItemInfo(lnk);
			if name then
				self._bag = bag;
				self._slot = slot;
				self._link = lnk;
				self.icon:SetTexture(texture);
				self._name = name;
				self:Show();
			end
		end		
	end

	button.CancelPending = function(self, lnk)
		if not lnk or self.pending._link == lnk then
			self.pending:Stop();
		end
	end
	
	button.IsPending = function(self)
		return self.pending._link;
	end

	-- Wears a trinket to a given slot, this function does not actually wear a trinket,
	-- instead, it schedules the action and let its "pending frame" do it.
	button.WearTrinket = function(self, lnk, bag, slot)
		if not lnk then
			return;
		end		
		
		EasyTrinket_Trinket1:CancelPending(lnk);
		EasyTrinket_Trinket2:CancelPending(lnk);
		self.pending:Start(lnk, bag, slot);
	end

	-- Non-combat call only
	button.UpdateHotkey = function(self)
		local key1, key2 = GetBindingKey("EASYTRINKET_HOTKEY"..(self:GetID() - 12));
		if key2 then
			SetOverrideBindingClick(self:GetParent(), false, key2, self:GetName());
		end
		if key1 then
			SetOverrideBindingClick(self:GetParent(), false, key1, self:GetName());
		end
		local key = key1 or key2 or "";
		self.hotkey:SetText(GetBindingText(key, "KEY_", 1));
	end

	button:SetScript("OnEvent", function(self, event, unit)
		if event == "UPDATE_BINDINGS" then
			if InCombatLockdown() then
				self._needUpdateBindings = 1;
			else
				self:UpdateHotkey();
			end
		elseif event == "PLAYER_REGEN_ENABLED" and self._needUpdateBindings then
			self._needUpdateBindings = nil;
			self:UpdateHotkey();
		elseif event == "PLAYER_ENTERING_WORLD" or (event == "UNIT_INVENTORY_CHANGED" and unit == "player" and not InCombatLockdown()) then
			-- update main trinket button
			local lnk, texture = GetTrinketInfo(self:GetID());
			self._link = lnk;
			self.icon:SetTexture(texture or "interface\\paperdoll\\UI-PaperDoll-Slot-Trinket");
			if GameTooltip:IsOwned(self) then
				self:ShowTooltip();
			end
		end
	end);

	button._OrigOnUpdate = button:GetScript("OnUpdate");
	button:SetScript("OnUpdate", function(self, elapsed)
		if self._OrigOnUpdate then
			self._OrigOnUpdate(self, elapsed);
		end

		if not CheckUpdateElapse(self, elapsed, TOOLTIP_UPDATE_TIME) then
			return;
		end

		-- update range redout
		local redout = (self._link and IsItemInRange(self._link) == 0);
		if redout then
			-- out of range
			self.hotkey:SetVertexColor(0.8, 0.1, 0.1);
			self.icon:SetVertexColor(0.8, 0.1, 0.1);
		else
			-- in range
			self.hotkey:SetVertexColor(1, 1, 1);
			self.icon:SetVertexColor(1, 1, 1);
		end
	end);

	button:SetScript("PostClick", function(self, button)
		if IsShiftKeyDown() and not self:PostLinkToChat(button) then
			self:CancelPending();
		end
	end);

	button:SetScript("OnDragStart", function(self)
		if not DuowanAddon_EasyTrinketDB["lock"] then
			self:GetParent():StartMoving();
		end
	end);

	button:SetScript("OnDragStop", function(self)		
		if not DuowanAddon_EasyTrinketDB["lock"] then
			self:GetParent():StopMovingOrSizing();
		end
	end);

	button.pending:SetScript("OnShow", function(self) self._nextTryTime = 0 end);

	-- Try to wear the selected trinket
	button.pending:SetScript("OnUpdate", function(self, elapsed)
		local invSlot = self:GetParent():GetID();
		if not self._link or GetInventoryItemLink("player", invSlot) == self._link then		
			self:Stop();
		elseif mainBar:CanSwitchTrinket() then
			local now = GetTime();
			if now > self._nextTryTime then
				if (self.bag and self.slot) then
					--PickupContainerItem(self._bag, self._slot);
					PickupInventoryItem(invSlot);						
				else
					EquipItemByName(self._name, invSlot);
				end
				self:Stop();
				self._nextTryTime = now + WEAR_RETRY_INTERVAL;
			end
		end
	end);

	button:SetID(id);
	button:UpdateHotkey();

	button:RegisterEvent("PLAYER_ENTERING_WORLD");
	button:RegisterEvent("PLAYER_REGEN_ENABLED");
	button:RegisterEvent("UNIT_INVENTORY_CHANGED");
	button:RegisterEvent("UPDATE_BINDINGS");
	button:RegisterForClicks("AnyUp");
	button:RegisterForDrag("LeftButton");

	-- Secure attributes
	button:SetAttribute("type", "item");
	button:SetAttribute("slot", id);
	button:SetAttribute("alt-unit*", "player");
	button:SetAttribute("shift-slot*", ATTRIBUTE_NOOP);	

	return button;
end

-- Create a menu trinket button (non-secure button)
local function CreateMenuTrinketButton(name, parent)
	local button = CreateTrinketButton(name, parent);
	button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	button:SetScript("OnClick", function(self, button)
		if not self:PostLinkToChat(button, self._link) then
			getglobal("EasyTrinket_Trinket"..(button == "RightButton" and 2 or 1)):WearTrinket(self._link); -- try to wear the selected trinket
		end
	end);

	return button;
end

-- Menu trinket button bar initialization

menuBar:Hide();
menuBar:SetWidth(TRINKET_BUTTON_WIDTH);
menuBar:SetHeight(TRINKET_BUTTON_WIDTH);

local i;
for i = 1, EASYTRINKET_MENUBUTTON_NUM do
	CreateMenuTrinketButton("EasyTrinket_MenuTrinket"..i, menuBar);
end

menuBar.BuildMenu = function(self)
	local trinkets = {};
	local bag, slot;
	for bag = 0, 4 do
		for slot = 1, GetContainerNumSlots(bag) do
			local lnk, texture = GetTrinketInfo(bag, slot);
			if lnk then
				table.insert(trinkets, { ["bag"] = bag, ["slot"] = slot, ["link"] = lnk, ["texture"] = texture } );
			end
		end
	end

	local count = math.min(EASYTRINKET_MENUBUTTON_NUM, table.getn(trinkets));
	if count == 0 then
		self:Hide();
		return 0;
	end		

	-- Assign each trinket data to a corresponding button
	local i;
	for i = 1, count do
		local button = getglobal("EasyTrinket_MenuTrinket"..i);				
		button._link = trinkets[i]["link"];
		button._bag = trinkets[i]["bag"];
		button._slot = trinkets[i]["slot"];
		button.icon:SetTexture(trinkets[i]["texture"]);
		button:Hide(); -- force "OnEnter" recalled to update GameTooltip contents
		button:Show();
	end	

	-- Hides excesse menu buttons
	for i = count + 1, EASYTRINKET_MENUBUTTON_NUM do
		local button = getglobal("EasyTrinket_MenuTrinket"..i);
		button._link = nil;
		button._bag = nil;
		button._slot = nil;
		button:Hide();
	end
	
	-- Since version 1.5, rows specified by user
	local rows = math.max(1, DuowanAddon_EasyTrinketDB["rows"] or 5);

	local point = "LEFT";
	local relativePoint = "RIGHT";
	local offset = 1;

	self:ClearAllPoints();	
	EasyTrinket_MenuTrinket1:ClearAllPoints();

	if DuowanAddon_EasyTrinketDB["leftmenu"] then
		-- menu on left side
		EasyTrinket_MenuTrinket1:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT");
		if DuowanAddon_EasyTrinketDB["vertical"] then
			self:SetPoint("BOTTOMRIGHT", EasyTrinket_Trinket2, "BOTTOMLEFT", -2, 0);
		else
			self:SetPoint("BOTTOMRIGHT", EasyTrinket_Trinket1, "BOTTOMLEFT", -2, 0);
		end
	
		point = "RIGHT";
		relativePoint = "LEFT";
		offset = -1;
	
	else
		-- menu on right side
		EasyTrinket_MenuTrinket1:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT");
		self:SetPoint("BOTTOMLEFT", EasyTrinket_Trinket2, "BOTTOMRIGHT", 2, 0);
	end	

	-- allign buttons
	for i = 2, count do
		local button = getglobal("EasyTrinket_MenuTrinket"..i);
		button:ClearAllPoints();
		if (i - 1) % rows == 0 then -- line wrap
			button:SetPoint(point, getglobal("EasyTrinket_MenuTrinket"..(i - rows)), relativePoint, offset, 0);
		else
			button:SetPoint("BOTTOM", getglobal("EasyTrinket_MenuTrinket"..(i - 1)), "TOP", 0, 1);
		end		
	end

	return count;
end

menuBar.StartCounting = function(self)
	self._hideTime = GetTime() + 0.5;
end

menuBar.StopCounting = function(self)
	self._hideTime = nil;
end

menuBar:SetScript("OnShow", function(self)
	self:StopCounting();
	self:RegisterEvent("BAG_UPDATE");
	self:BuildMenu();
end);

menuBar:SetScript("OnHide", function(self) self:UnregisterEvent("BAG_UPDATE"); end);

menuBar:SetScript("OnEvent", function(self) self._bagUpdated = 1; end);

menuBar:SetScript("OnUpdate", function(self)
	if self._hideTime and GetTime() > self._hideTime then
		self:Hide();
	elseif self._bagUpdated then
		self._bagUpdated = nil;		
		self:BuildMenu(); -- I put this in "OnUpdate" to avoid multiple execution simultaneously
	end
end);


-- Main trinket button bar initialization

mainBar:SetMovable(true);
mainBar:SetClampedToScreen(true);
mainBar:SetUserPlaced(true);
mainBar:SetPoint("CENTER", UIParent, "CENTER");

mainBar:RegisterEvent("UNIT_SPELLCAST_START");
mainBar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_START");
mainBar:RegisterEvent("UNIT_SPELLCAST_STOP");
mainBar:RegisterEvent("UNIT_SPELLCAST_CHANNEL_STOP");
mainBar:RegisterEvent("MODIFIER_STATE_CHANGED");
mainBar:RegisterEvent("UNIT_INVENTORY_CHANGED");
mainBar:RegisterEvent("SPELLS_CHANGED");
mainBar:RegisterEvent("ADDON_LOADED");


CreateMainTrinketButton("EasyTrinket_Trinket1", mainBar, 13);
CreateMainTrinketButton("EasyTrinket_Trinket2", mainBar, 14);
EasyTrinket_Trinket1:SetPoint("TOPLEFT", mainBar, "TOPLEFT");

mainBar.SetOrientation = function(self, vertical)
	EasyTrinket_Trinket2:ClearAllPoints();
	if vertical then
		self:SetWidth(TRINKET_BUTTON_WIDTH);
		self:SetHeight(TRINKET_BUTTON_WIDTH * 2 + 1);
		EasyTrinket_Trinket2:SetPoint("TOP", EasyTrinket_Trinket1, "BOTTOM", 0, -1);
	else
		self:SetWidth(TRINKET_BUTTON_WIDTH * 2 + 1);
		self:SetHeight(TRINKET_BUTTON_WIDTH);
		EasyTrinket_Trinket2:SetPoint("LEFT", EasyTrinket_Trinket1, "RIGHT", 1, 0);
	end
end

mainBar.CanSwitchTrinket = function(self) 
	return not self.spellCasting and 
				not self.spellChanneling and 
				not UnitIsDeadOrGhost("player") and not InCombatLockdown() 
end
function EasyTrinket_ToggleMainBar(switch)
	if (switch) then
		mainBar:Show();
	else		
		mainBar:Hide();
	end
end
mainBar:SetScript("OnEvent", function(self, event, unit, state)
	if unit == "player" then
		if event == "UNIT_SPELLCAST_START" then
			self.spellCasting = 1;
		elseif event == "UNIT_SPELLCAST_CHANNEL_START" then
			self.spellChanneling = 1;
		elseif event == "UNIT_SPELLCAST_STOP" then
			self.spellCasting = nil;
		elseif event == "UNIT_SPELLCAST_CHANNEL_STOP" then
			self.spellChanneling = nil;
		end
	end

	if event == "MODIFIER_STATE_CHANGED" then
		if not IsMenuKeyDown() then
			menuBar:Hide();
		elseif self.mouseover then
			menuBar:StopCounting();
			menuBar:Show();
		end
	-- Added by dugu@bigfoot 2010-5-29
	end
	
	if (not DuowanAddon_EasyTrinketDB["disabled"] and ((event == "ADDON_LOADED" and unit == "EasyTrinket") or event == "SPELLS_CHANGED" or (event=="UNIT_INVENTORY_CHANGED" and unit == "player"))) then
		if (GetInventoryItemTexture("player",13) or GetInventoryItemTexture("player",14)) then
			dwSecureCall(EasyTrinket_ToggleMainBar, true);		
			self:UnregisterEvent("UNIT_INVENTORY_CHANGED");
			self:UnregisterEvent("SPELLS_CHANGED");
			self:UnregisterEvent("ADDON_LOADED");
		else
			dwSecureCall(EasyTrinket_ToggleMainBar, false);
		end
	end
end);


mainBar.StartCounting = function(self)
	menuBar:StartCounting();
end

mainBar.StopCounting = function(self)
	if IsMenuKeyDown() then
		menuBar:StopCounting();
		menuBar:Show();
	end
end

-- Shows/removes the "Dream Layout" for all our buttons
mainBar.UpdateDLayout = function(self, show)
	if BUTTONFACADE_LOADED then return end
	local i;	
	for i = 1, 2 do
		-- Update the two main buttons and their pending frames
		getglobal("EasyTrinket_Trinket"..i):UpdateDLayout(show, 0.5, 0.2, 0.85, 1);
	end
	
	for i = 1, EASYTRINKET_MENUBUTTON_NUM do
		-- Update menu buttons
		getglobal("EasyTrinket_MenuTrinket"..i):UpdateDLayout(show, 0, 0, 0, 0.6);		
	end
end