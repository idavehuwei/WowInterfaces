-----------------------------------------------------------
-- MinimapButton-2.0 by Abin
-----------------------------------------------------------
-- This library creates minimap buttons for your addon with no dependencies
-- (it doesn't even require an "xml" file), and offers the following features:
--
-- 1: Built-in left-drag & tooltip supporting functions.
-- 2: You can associate a frame (usually the option frame of your addon) to the button,
--    it will be automatically opened/closed when the player clicks on the button.
-- 3: You can specify the button orbit (square and radius).
-- 4: Button position is translated into "angle" value(1-360) instead of
--    screen coordinates.
-- 5: Button position is automatically saved/loaded among game sessions, as long as you
--    have called its "RegisterDB" member method.
-- 6: You can change the button icon anytime.
-- And much more...
--
-----------------------------------------------------------
-- Global Functions
-----------------------------------------------------------
-- UICreateMinimapButton(name, iconPath[, iconSize])
--
-- Parameters: 
--
-- name - string, name for your minimap button.
-- iconPath - string, the "tga" or "blp" file path for your button-face.
-- iconSize - number(16-64), size of the icon, optional.
--
-- Return values: The newly created minimap button frame object.
--
-- Remarks: Creates a minimap button for your addon.
--
-----------------------------------------------------------
-- Sample Usage:
-----------------------------------------------------------
--
-- To create a minimap button for your addon, use the hearthstone icon:
--
-- CreateMinimapButton("MyButton", "Interface\\Icons\\INV_Misc_Rune_01");

-- Tell the button where to save its own position among game sessions:
--
-- MyButton:RegisterDB("MyAddonSavedVariables");

-- Associate the button to one of your option frames, which will be automatically opened/closed when
-- the player clicks on the button:
--
-- MyButton:SetOptionFrame(MyOptionFrame);      
--
-----------------------------------------------------------
-- Member Functions
-----------------------------------------------------------
-- The minimap button created by this library is actually a "Button" object, it has all of the methods from
-- UIObject, Region, Frame and Button, plus the following: 
--
-- MyButton:GetVersion()                     -- Retrieves library version
-- MyButton:RegisterDB(SavedVariables)       -- Registers saved variables table to the button
-- MyButton:SetOptionFrame(frame [, "buttonType", ...]) -- Associates an option frame to the button
-- MyButton:GetOptionFrame()                 -- Retrieves associated option frame
-- MyButton:ClearTooltipLines()              -- Clear all tooltip lines
-- MyButton:AddTooltipLine("text" [, r, g, b [, wrapText]]) -- Adds a tooltip text line
-- MyButton:GetIconPath()                    -- Retrieves icon path
-- MyButton:SetIconPath("iconPath")          -- Set a new icon path
-- MyButton:GetIconSize()                    -- Retrieves icon size
-- MyButton:SetIconSize(size)                -- Set a new icon size(16-64)
-- MyButton:Rotate(angle)                    -- Rotates the button icon by specified degrees
-- MyButton:GetRotated()                     -- Retrieves rotated degrees of the button icon, 0 if not rotated at all
-- MyButton:IsGreyscale()                    -- Check if the button icon is greyscale
-- MyButton:SetGreyscale(greyscale)          -- Set the button icon to be greyscale or colored
-- MyButton:GetAngle(cursor)                 -- Retrieves button angle relative to center of minimap. If "cursor" is not nil, it performs an angle calculation against cursor position.
-- MyButton:SetAngle(angle)                  -- Set a new angle value(1-360) relative to center of minimap, nil makes it random
-- MyButton:SetOrbit(square, radius)         -- Specifys the button orbit (square and radius)
-- MyButton:GetOrbit()                       -- Retrieves the button orbit
-- MyButton:IsFlashing()                     -- Checks whether the button is flashing
-- MyButton:StartFlash(showDuration, hideDuration [,repeatTimes]) -- Start flashing! Gives show-duration, hide-duration and repeating-times(optional)
-- MyButton:StopFlash()                      -- Stop flashing
-- MyButton:Attach()                         -- Attach the button to Minimap
-- MyButton:Detach()                         -- Detach the button from Minimap so it can be moved freely
-- MyButton:IsDetached()                     -- Checks whether the button has been detached from Minimap
--
-----------------------------------------------------------
-- WARNING!
-----------------------------------------------------------
-- DO NOT call "RegisterForDrag" for your button!
-- DO NOT set scripts "OnDragStart", "OnDragStop" or "OnMouseUp" for your button!
--
-- Above functions or scripts are already in use by this library, manually
-- over-riding those may cause UI errors.
--
-----------------------------------------------------------
-- Abin 
-- 2008-7-31
-----------------------------------------------------------

local MAJOR_VERSION = 2.0;
local MINOR_VERSION = 1.65;

-- To prevent older libraries from over-riding newer ones...
if type(UIMinimapButtonIsNewerVersion) == "function" and not UIMinimapButtonIsNewerVersion(MAJOR_VERSION, MINOR_VERSION) then return end

function UICreateMinimapButton(name, iconPath, iconSize)
	local PRIVATE = "{952D6D3A-25E4-49AF-B281-AFDF3D958372}";

	-- name must be either string or nil
	if type(name) ~= "string" then
		name = nil;
	end

	-- Creates the button frame
	local button = CreateFrame("Button", name, Minimap);
	if not button then
		return nil; -- Creation failed for some reason
	end
	
	-- A private frame to maintain events and store data	
	button[PRIVATE] = CreateFrame("Frame", (name or "UnnamedMinimapButton").."_Private_Frame", button);
	if not button[PRIVATE] then
		return nil;  -- Button created by private frame failed, cannot continue
	end

	-- An array of mouse button strings, used for opening the associated option frames
	button[PRIVATE]._optionFrameMouseButtons = {};

	-- Rotated angle degree
	button[PRIVATE]._rotated = 0;

	button[PRIVATE]._CalcAngle = function(self, cursor)		
		local mx, my, scale;
		if cursor then
			mx, my = GetCursorPosition();
		else
			mx, my = self:GetParent():GetCenter();
			if not mx or not my then
				return 0;
			end
			scale = self:GetParent():GetEffectiveScale();
			mx, my = mx * scale, my * scale;
		end

		local x, y = Minimap:GetCenter();
		if not x or not y then
			return 0;
		end

		scale = Minimap:GetEffectiveScale();
		x, y = x * scale, y * scale;
		local dx, dy = mx - x, my - y

		if dx == 0 then
			if dy < 0 then
				return 270;
			elseif dy > 0 then
				return 90;
			else
				return 0;
			end
		end

		local angle = atan(dy / dx);
		if dx < 0 then
			angle = angle + 180;
		end

		if angle < 0 then
			angle = angle + 360;
		end
		return angle;
	end;

	button[PRIVATE]._GetDB = function(self)
		local db = self._registeredDB;
		if type(db) == "string" then
			db = dwGetglobal(db);
		end

		if type(db) == "table" then
			if type(db["Minimap Button"]) ~= "table" then
				db["Minimap Button"] = {};
			end

			return db["Minimap Button"];
		end

		return nil;
	end;

	button[PRIVATE]._InitPosition = function(self, db)
		db = db or self:_GetDB();
		if db then
			db["angle"] = self:GetParent():SetAngle(db["angle"]);

			if self._detached and type(db["x"]) == "number" and type(db["y"]) == "number" then
				self:ClearAllPoints();
				self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", db["x"], db["y"]);
			end
		end
	end;
	
	button[PRIVATE]._OnDradStart = function(self)
		self:GetParent():LockHighlight();
		if self._detached then
			self:GetParent():StartMoving();
		end
		self._isMoving = 1;
	end;
	
	button[PRIVATE]._OnDradStop = function(self)		
		self._isMoving = nil;	
		self:GetParent():StopMovingOrSizing();

		local angle = self:_CalcAngle();
		local x, y = self:GetParent():GetCenter();

		-- It's the time to save button position if the user has specified a saved-variables table
		local db = self:_GetDB();
		if db then			
			db["angle"], db["x"], db["y"] = angle, x, y;		
		end		

		-- If the user has not specified a saved-variables table, maybe he wants to do it himself as long as
		-- there's a particular function defined
		if type(self:GetParent().OnDragStop) == "function" then
			if self._detached then
				self:GetParent():OnDragStop(x, y);
			else
				self:GetParent():OnDragStop(angle);
			end
		end
	end;	

	-- Private frame - OnUpdate	
	button[PRIVATE]:SetScript("OnUpdate", function(this, elapsed)
		if this._isMoving then
			if not this:IsVisible() or not IsMouseButtonDown("LeftButton") then
				this:_OnDradStop();
			elseif not this._detached then
				-- Update button position around the minimap if the user is dragging				
				this:GetParent():SetAngle(this:_CalcAngle(1));
			end
		else
			-- Check if the associated option frame is visible, if it is, highlight the button
			this._updateElapsed = (this._updateElapsed or 0) + elapsed;
			if this._updateElapsed > 0.3 then
				this._updateElapsed = 0;
				local frame = this._optionFrame;
				if type(frame) == "string" then
					frame = dwGetglobal(frame);
					if type(frame) == "table" and type(frame.GetObjectType) == "function" then
						this._optionFrame = frame;
					end
				end

				if type(frame) == "table" and type(frame.GetObjectType) == "function" then
					if frame:IsVisible() then
						this:GetParent():LockHighlight();
					else
						this:GetParent():UnlockHighlight();
					end
				end
			end
		end
		
		-- Flash handling
		if this._flash then
			this._flashElapsed = (this._flashElapsed or 0) + arg1;
			if this._iconTexture:IsShown() then
				-- icon is shown, should hide?
				if this._flashElapsed > this._showDuration then
					this._flashElapsed = 0;
					this._iconTexture:Hide();
				end
			else
				-- icon is hidden, should show?
				if this._flashElapsed > this._hideDuration then
					this._flashElapsed = 0;
					this._iconTexture:Show();
					this._flashRepeated = this._flashRepeated + 1;
					if this._repeat and this._flashRepeated >= this._repeat then						
						this._stopping = true;
						this._flash = nil;
					end
				end
			end				
		elseif this._stopping then
			-- stopped
			this._stopping = nil;
			this._iconTexture:Show();
		end
	end);	

	-- Private frame - OnEvent
	button[PRIVATE]:SetScript("OnEvent", function(this, event)
		-- Verify the table which was passed in from a previous call of button:RegisterDB, this will only occur if the user
		-- passed a string as the table name. If the table is valid, we unregister this event, otherwise we will have to check
		-- it every time upon "PLAYER_ENTERING_WORLD", fortunately this isn't a frequent event and won't cause any serious
		-- performance problems.
		if event == "PLAYER_ENTERING_WORLD" then
			local db = this:_GetDB();
			if db then
				this:UnregisterEvent("PLAYER_ENTERING_WORLD");
				this:_InitPosition(db);						
			end
		end
	end);

	-- Sets up the button attributes as how a "minimap button" should look like
	button:EnableMouse(true);
	button:SetMovable(true);
	button:SetWidth(31);
	button:SetHeight(31);
	button:SetFrameStrata("LOW"); -- Minimap strata is "BACKGROUND" at current version
	--button:SetFrameLevel(Minimap:GetFrameLevel() + 3);

	-- Creates the button-face texture using user specified icon
	button[PRIVATE]._iconTexture = button:CreateTexture(nil, "ARTWORK"); -- Button-face texture
	if button[PRIVATE]._iconTexture then
		button[PRIVATE]._iconTexture:SetPoint("CENTER", button, "CENTER", 0, 1);
	end

	-- Creates the button border texture using wow default minimap tracking border
	local overlay = button:CreateTexture(nil, "OVERLAY");
	if overlay then
		overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder"); -- button border, use the minimap tracking button style
		overlay:SetWidth(53);
		overlay:SetHeight(53);
		overlay:SetPoint("TOPLEFT", button, "TOPLEFT");
	end

	-- Set a highlight texture to make it look nice when the mouse cursor hovers in
	button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight");

	-- Registers necessary events and scripts to respond mouse-drags properly.
	button:RegisterForDrag("LeftButton");
	button:SetScript("OnDragStart", function() this[PRIVATE]:_OnDradStart(); end);
	button:SetScript("OnDragStop", function() this[PRIVATE]:_OnDradStop(); end);

	-- To display user specified tooltip text, if any
	button:SetScript("OnEnter", function()
		local tooltip = this[PRIVATE]._tooltip;
		if tooltip then
			GameTooltip:SetOwner(this, "ANCHOR_BOTTOMLEFT");
			GameTooltip:ClearLines();
			local i;
			for i = 1, table.getn(tooltip) do
				GameTooltip:AddLine(tooltip[i]["text"], tooltip[i]["r"], tooltip[i]["g"], tooltip[i]["b"], tooltip[i]["wrap"]);
			end
			GameTooltip:Show();
		end
	end);

	button:SetScript("OnLeave", function() GameTooltip:Hide(); end);

	-- To open the associated option frame, if any.
	button:SetScript("OnMouseUp", function()
		local frame = this[PRIVATE]._optionFrame;
		if type(frame) == "string" then
			frame = dwGetglobal(frame);
		end

		if type(frame) == "table" and type(frame.GetObjectType) == "function" then					
			local i;
			for i = 1, table.getn(this[PRIVATE]._optionFrameMouseButtons) do
				if arg1 == this[PRIVATE]._optionFrameMouseButtons[i] then
					if frame:IsShown() then
						frame:Hide();
					else
						frame:Show();
					end						
					return;
				end
			end
		end
	end);
	

	-----------------------------------------------------------
	-- Register our own functions to the button object
	-----------------------------------------------------------

	-- Clears all existing tooltip texts
	button.ClearTooltipLines = function(self)
		self[PRIVATE]._tooltip = nil;
	end;

	-- Adds a line of tooltip text
	button.AddTooltipLine = function(self, text, r, g, b, wrap)
		if not self[PRIVATE]._tooltip then
			self[PRIVATE]._tooltip = {};
		end

		if type(text) ~= "string" or text == "" then
			text = " "; -- A blank line
		end
		table.insert(self[PRIVATE]._tooltip, { ["text"] = text, ["r"] = r, ["g"] = g, ["b"] = b, ["wrap"] = wrap } );
	end;

	-- Deprecated, only for downward compatibility to old versions.
	button.SetTooltipText = function(self, text, anchor, r, g, b, wrap)
		self:ClearTooltipLines();
		self:AddTooltipLine(text, r, g, b, wrap);
	end

	-- Deprecated, only for downward compatibility to old versions.
	button.GetTooltipText = function(self)
		local tooltip = self[PRIVATE]._tooltip;
		if tooltip then
			return tooltip[1]["text"], tooltip[1]["r"], tooltip[1]["g"], tooltip[1]["b"], tooltip[1]["wrap"]; 
		else
			return nil;
		end
	end;

	-- Registers a saved-variables table to where the button angle will be saved	
	button.RegisterDB = function(self, varTable)
		self[PRIVATE]:UnregisterAllEvents();
		self[PRIVATE]._registeredDB = varTable;
		local db = self[PRIVATE]:_GetDB();
		if db then
			-- Table is valid, update angle immediately
			self[PRIVATE]:_InitPosition(db);
		elseif type(varTable) == "string" then
			-- Table is not yet valid, this could be caused by calling MinimapButton:RegisterDB before "ADDON_LOADED" event fires,
			-- so we leave it alone and check later. This allows the programmer to call MinimapButton:RegisterDB in "OnLoad" function
			-- of their addons.
			self[PRIVATE]:RegisterEvent("PLAYER_ENTERING_WORLD");
		end
	end;

	-- Associates an option frame which will be opened/closed when the user clicks on the button
	button.SetOptionFrame = function(self, frame, mouseButton1, mouseButton2, mouseButton3, mouseButton4, mouseButton5)		
		if type(frame) == "string" then
			local f = dwGetglobal(frame);
			if type(f) == "table" and type(f.GetObjectType) == "function" then
				frame = f;
			end
		elseif type(frame) ~= "table" or type(frame.GetObjectType) ~= "function" or this == frame or this[PRIVATE] == frame then
			frame = nil;
		end

		self[PRIVATE]._optionFrame = frame;
		self[PRIVATE]._optionFrameMouseButtons = { mouseButton1, mouseButton2, mouseButton3, mouseButton4, mouseButton5 };
		if table.getn(self[PRIVATE]._optionFrameMouseButtons) == 0 then
			self[PRIVATE]._optionFrameMouseButtons = { "LeftButton", "RightButton" };
		end
		return frame;
	end;

	-- Retrieves the associated option frame
	button.GetOptionFrame = function(self)
		return self[PRIVATE]._optionFrame, self[PRIVATE]._optionFrameMouseButtons[1], self[PRIVATE]._optionFrameMouseButtons[2], self[PRIVATE]._optionFrameMouseButtons[3], self[PRIVATE]._optionFrameMouseButtons[4], self[PRIVATE]._optionFrameMouseButtons[5];
	end;

	-- Retrieves whether the button icon is grey scaled
	button.IsGreyscale = function(self)
		return self[PRIVATE]._greyscale;
	end;

	-- Set the button icon to be grey scaled, or not
	button.SetGreyscale = function(self, greyscale)
		self[PRIVATE]._greyscale = greyscale;
		local supported = self[PRIVATE]._iconTexture:SetDesaturated(greyscale);
		if not supported then
			if greyscale then
				self[PRIVATE]._iconTexture:SetVertexColor(0.5, 0.5, 0.5);
			else
				self[PRIVATE]._iconTexture:SetVertexColor(1.0, 1.0, 1.0);
			end
		end
	end;

	-- Rotates the button icon by angle degrees
	button.Rotate = function(self, angle)
		if type(angle) ~= "number" then
			angle = 0;
		end

		angle = math.floor(angle) % 360;
		if angle < 0 then
			angle = angle + 360;
		end

		self[PRIVATE]._rotated = angle;

		local s2 = math.sqrt(2);
		local LRx, LRy = 0.5 + math.cos(math.rad(angle + 45)) / s2, 0.5 + math.sin(math.rad(angle + 45)) / s2;
		local LLx, LLy = 0.5 + math.cos(math.rad(angle + 135)) / s2, 0.5 + math.sin(math.rad(angle + 135)) / s2;
		local ULx, ULy = 0.5 + math.cos(math.rad(angle + 225)) / s2, 0.5 + math.sin(math.rad(angle + 225)) / s2;
		local URx, URy = 0.5 + math.cos(math.rad(angle - 45)) / s2, 0.5 + math.sin(math.rad(angle - 45)) / s2;	
		self[PRIVATE]._iconTexture:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy);		
		return angle;
	end;

	-- Retrieves rotated angle degrees of the button icon, 0 if not rotated at all
	button.GetRotated = function(self) return self[PRIVATE]._rotated or 0; end;

	-- Retrieves button texture path
	button.GetIconPath = function(self)
		return self[PRIVATE]._iconPath;
	end;

	-- Sets button texture path
	button.SetIconPath = function(self, iconPath)
		if type(iconPath) ~= "string" then
			iconPath = nil;
		end

		self[PRIVATE]._iconPath = iconPath;
		self[PRIVATE]._iconTexture:SetTexture(iconPath);
		if string.find(string.lower(iconPath or ""), "interface\\icons\\") == 1 then
			self[PRIVATE]._iconTexture:SetTexCoord(0.05, 0.95, 0.05, 0.95);
		else
			self[PRIVATE]._iconTexture:SetTexCoord(0, 1, 0, 1);
		end

		self:SetGreyscale(self:IsGreyscale());
		return iconPath;
	end;

	-- Retrieves button texture size
	button.GetIconSize = function(self)
		return self[PRIVATE]._iconPath;
	end;

	-- Sets button texture size
	button.SetIconSize = function(self, size)
		if type(size) ~= "number" then
			size = 20;
		end
		size = math.max(16, math.min(size, 64));
		self[PRIVATE]._iconTexture:SetWidth(size);
		self[PRIVATE]._iconTexture:SetHeight(size)
		return size;
	end;	

	-- Retrieves button angle
	button.GetAngle = function(self, cursor)
		return self[PRIVATE]:_CalcAngle(cursor);
	end;

	-- Retrieves button orbit
	button.GetOrbit = function(self) 
		return self[PRIVATE]._square, (self[PRIVATE]._radius or (Minimap:GetWidth() / 2 + 9));
	end;	
	
	-- Sets button angle
	button.SetAngle = function(self, angle)
		if type(angle) ~= "number" then
			angle = math.random(150, 300);
		end
		
		--angle = math.floor(angle) % 360;
		local r = math.rad(angle);
		local c = math.cos(r);
		local s = math.sin(r);

		local square, radius = self:GetOrbit();
		local x = c * radius;
		local y = s * radius;

		if square then
			x = x * math.sqrt(2);
			y = y * math.sqrt(2);
			x = math.max(-radius, math.min(x, radius));
			y = math.max(-radius, math.min(y, radius));
		end

		-- apply new position
		self:ClearAllPoints();
		self:SetPoint("CENTER", Minimap, "CENTER", x, y);
		return angle;
	end;
	
	-- Sets button orbit
	button.SetOrbit = function(self, square, radius)
		self[PRIVATE]._square = square;
		if type(radius) ~= "number" then
			radius = Minimap:GetWidth() / 2 + 9;
		end
		self[PRIVATE]._radius = math.max(0, math.min(radius, 200));
		self:SetAngle(self:GetAngle()); -- refresh position
	end;

	-- Static function, retrieves library version
	button.GetVersion = function() 
		return MAJOR_VERSION, MINOR_VERSION;
	end;	

	button.IsFlashing = function(self)
		return self[PRIVATE]._flash, self[PRIVATE]._showDuration, self[PRIVATE]._hideDuration, self[PRIVATE]._repeat, (self[PRIVATE]._flashRepeated or 0);
	end;

	-- Start flashing
	button.StartFlash = function(self, showDuration, hideDuration, repeatTimes)
		if type(showDuration) == "number" and showDuration > 0 and type(hideDuration) == "number" and hideDuration > 0 then
			self[PRIVATE]._flash = nil;
			self[PRIVATE]._showDuration = showDuration;
			self[PRIVATE]._hideDuration = hideDuration;
			self[PRIVATE]._repeat = tonumber(repeatTimes);			
			self[PRIVATE]._flashRepeated = 0;
			self[PRIVATE]._shown = nil;
			self[PRIVATE]._stopping = nil;
			self[PRIVATE]._flash = true;
			return true;
		end
		return nil;
	end;

	-- Stop flashing
	button.StopFlash = function(self)
		self[PRIVATE]._stopping = true;
		self[PRIVATE]._flash = nil;
		self[PRIVATE]._iconTexture:Show();
	end

	button.Attach = function(self)
		self[PRIVATE]._detached = nil;
		return self:SetAngle(self:GetAngle());
	end;

	button.Detach = function(self)
		self[PRIVATE]._detached = 1;		
		return self:GetCenter();
	end;	

	button.IsDetached = function(self)
		return self[PRIVATE]._detached, self:GetCenter();
	end;

	-- Initializes button position and texture	
	button:SetIconPath(iconPath);
	button:SetIconSize(iconSize);
	button:SetAngle(); -- Sets a random angle upon creation

	return button; -- from this point on you can use it as a "Button" frame object
end

-- Provides version check
function UIMinimapButtonIsNewerVersion(major, minor)
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