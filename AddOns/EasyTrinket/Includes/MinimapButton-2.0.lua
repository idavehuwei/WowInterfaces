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
-- UIObject, Region, Frame, Button and Texture, plus the following: 
--
-- Methods derived from Texture:

-- GetBlendMode, SetBlendMode, GetTexCoord, SetTexCoord, GetTexture, SetTexture,
-- GetVertexColor, SetVertexColor, IsDesaturated, SetDesaturated, SetGradient, SetGradientAlpha

-- Additional methods:

-- MyButton:GetVersion()                     -- Retrieves library version
-- MyButton:RegisterDB(SavedVariables)       -- Registers saved variables table to the button
-- MyButton:SetOptionFrame(frame [, "buttonType", ...]) -- Associates an option frame to the button
-- MyButton:GetOptionFrame()                 -- Retrieves associated option frame
-- MyButton:ClearTooltipLines()              -- Clear all tooltip lines
-- MyButton:AddTooltipLine("text" [, r, g, b [, wrapText]]) -- Adds a tooltip text line
-- MyButton:GetIconSize()                    -- Retrieves icon size
-- MyButton:SetIconSize(size)                -- Set a new icon size(16-64)
-- MyButton:Rotate(angle)                    -- Rotates the button icon by specified degrees
-- MyButton:GetRotated()                     -- Retrieves rotated degrees of the button icon, 0 if not rotated at all
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
local MINOR_VERSION = 1.75

-- To prevent older libraries from over-riding newer ones...
if type(UIMinimapButtonIsNewerVersion) == "function" and not UIMinimapButtonIsNewerVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local PRIVATE = "{952D6D3A-25E4-49AF-B281-AFDF3D958372}";
local SQRT2 = math.sqrt(2);

local MINIMAPSHAPES = {
	["ROUND"] = { true, true, true, true },
	["SQUARE"] = { false, false, false, false },
	["CORNER-TOPLEFT"] = { true, false, false, false },
	["CORNER-TOPRIGHT"] = { false, false, true, false },
	["CORNER-BOTTOMLEFT"] = { false, true, false, false },
	["CORNER-BOTTOMRIGHT"] = { false, false, false, true },
	["SIDE-LEFT"] = { true, true, false, false },
	["SIDE-RIGHT"] = { false, false, true, true },
	["SIDE-TOP"] = { true, false, true, false },
	["SIDE-BOTTOM"] = { false, true, false, true },
	["TRICORNER-TOPLEFT"] = { true, true, true, false },
	["TRICORNER-TOPRIGHT"] = { true, false, true, true },
	["TRICORNER-BOTTOMLEFT"] = { true, true, false, true },
	["TRICORNER-BOTTOMRIGHT"] = { false, true, true, true },
};

function UICreateMinimapButton(name, iconPath, iconSize)
	if type(name) ~= "string" then
		error(string.format("bad argument #1 to 'UICreateMinimapButton' (string expected, got %s)", type(name)));
		return nil;
	end	

	local button = CreateFrame("Button", name, Minimap); -- The minimap button

	-- A private frame to maintain events and store data
	local private = CreateFrame("Frame", name.."_Private_Frame", button);
	button[PRIVATE] = private;	

	-- An array of mouse button strings, used for opening the associated option frames
	private._optionFrameMouseButtons = {};

	-- Rotated angle degree
	private._rotated = 0;

	private._CalcAngle = function(self, cursor)

		local mx, my = Minimap:GetCenter();
		local scale = Minimap:GetEffectiveScale();

		local px, py = GetCursorPosition();
		if cursor then
			px, py = GetCursorPosition();
			px, py = px / scale, py / scale;
		else
			px, py = self:GetParent():GetCenter();
			if not px then
				return 0;
			end
		end
		
		return math.deg(math.atan2(py - my, px - mx)) % 360;
	end

	private.SavePosition = function(self, db)
		db = db or self:_GetDB();
		if type(db) == "table" then
			db.angle = self:GetParent():GetAngle();
			db.point = nil;
			if self._detached then
				db.point = { self:GetParent():GetPoint(1) };
			end
		end
	end

	private.LoadPosition = function(self, db)
		db = db or self:_GetDB();
		if type(db) == "table" then
			if type(db.angle) == "number" then
				self:GetParent():SetAngle(db.angle);				
			end

			if self._detached and type(db.point) == "table" then
				self:GetParent():ClearAllPoints();
				self:GetParent():SetPoint(unpack(db.point));
			end

			self:SavePosition(db);
		end
	end

	private._GetDB = function(self)
		local db = self._registeredDB;
		if type(db) == "string" then
			db = getglobal(db);
		end

		if type(db) == "table" then
			if type(db[PRIVATE]) ~= "table" then
				db[PRIVATE] = {};
			end

			return db[PRIVATE];
		end

		return nil;
	end	
	
	private._OnDradStart = function(self)
		self:GetParent():LockHighlight();
		if self._detached then
			self:GetParent():StartMoving();
		else
			self._isMoving = 1;
		end		
	end
	
	private._OnDradStop = function(self)		
		self._isMoving = nil;		
		self:GetParent():StopMovingOrSizing();
		self:GetParent():UnlockHighlight();
		self:SavePosition();
		
		local angle = self:_CalcAngle();
		local x, y = self:GetParent():GetCenter();

		-- If the user has not specified a saved-variables table, maybe he wants to do it himself as long as
		-- there's a particular function defined
		if type(self:GetParent().OnDragStop) == "function" then
			if self._detached then
				self:GetParent():OnDragStop(x, y);
			else
				self:GetParent():OnDragStop(angle);
			end
		end
	end
	
	-- Private frame - OnEvent
	private:SetScript("OnEvent", function(self, event)
		-- Verify the table which was passed in from a previous call of button:RegisterDB, this will only occur if the user
		-- passed a string as the table name. If the table is valid, we unregister this event, otherwise we will have to check
		-- it every time upon "PLAYER_ENTERING_WORLD", fortunately this isn't a frequent event and won't cause any serious
		-- performance drop.
		if event == "PLAYER_ENTERING_WORLD" then
			local db = self:_GetDB();
			if db then
				self:UnregisterEvent("PLAYER_ENTERING_WORLD");
				self:LoadPosition(db);					
			end
		end
	end);

	-- Private frame - OnUpdate	
	private:SetScript("OnUpdate", function(self, elapsed)
		if self._isMoving then
			if not self:IsVisible() or not IsMouseButtonDown("LeftButton") then
				self:_OnDradStop();
			else
				-- Update button position around the minimap if the user is dragging				
				self:GetParent():SetAngle(self:_CalcAngle(1));
			end
		end
		
		-- Flash handling
		if self._flash then
			self._flashElapsed = (self._flashElapsed or 0) + elapsed;
			if self._iconTexture:IsShown() then
				-- icon is shown, should hide?
				if self._flashElapsed > self._showDuration then
					self._flashElapsed = 0;
					self._iconTexture:Hide();
				end
			else
				-- icon is hidden, should show?
				if self._flashElapsed > self._hideDuration then
					self._flashElapsed = 0;
					self._iconTexture:Show();
					self._flashRepeated = self._flashRepeated + 1;
					if self._repeat and self._flashRepeated >= self._repeat then						
						self._stopping = 1;
						self._flash = nil;
					end
				end
			end				
		elseif self._stopping then
			-- stopped
			self._stopping = nil;
			self._iconTexture:Show();
		end
	end);	

	-- Sets up the button attributes as how a "minimap button" should look like
	button:EnableMouse(true);
	button:SetMovable(true);
	--button:SetClampedToScreen(true);
	button:SetWidth(31);
	button:SetHeight(31);
	button:SetFrameStrata("LOW"); -- Minimap strata is "BACKGROUND" at current version
	--button:SetFrameLevel(Minimap:GetFrameLevel() + 3);

	-- Creates the button-face texture using user specified icon
	private._iconTexture = button:CreateTexture(nil, "ARTWORK"); -- Button-face texture
	private._iconTexture:SetPoint("CENTER", button, "CENTER", 0, 1);

	-- Creates the button border texture using wow default minimap tracking border
	local overlay = button:CreateTexture(nil, "OVERLAY");
	overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder"); -- button border, use the minimap tracking button style
	overlay:SetWidth(53);
	overlay:SetHeight(53);
	overlay:SetPoint("TOPLEFT", button, "TOPLEFT");

	-- Set a highlight texture to make it look nice when the mouse cursor hovers in
	button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight");

	-- Registers necessary events and scripts to respond mouse-drags properly.
	button:RegisterForDrag("LeftButton");
	button:SetScript("OnDragStart", function(self) self[PRIVATE]:_OnDradStart() end);
	button:SetScript("OnDragStop", function(self) self[PRIVATE]:_OnDradStop() end);

	button.OnTooltipRequest = function(self)
		local tooltip = self[PRIVATE]._tooltip;
		if tooltip then
			local i;
			for i = 1, table.getn(tooltip) do
				GameTooltip:AddLine(tooltip[i].text, tooltip[i].r, tooltip[i].g, tooltip[i].b, tooltip[i].wrap);
			end
		end
	end

	button:SetScript("OnEnter", function(self)
		if type(self.OnTooltipRequest) == "function" then
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT");
			GameTooltip:ClearLines();
			self:OnTooltipRequest();
			if GameTooltip:NumLines() > 0 then
				GameTooltip:Show();
			end
		end
	end);

	button:SetScript("OnLeave", function(self) GameTooltip:Hide() end);

	-- To open the associated option frame, if any.
	button:SetScript("OnMouseUp", function(self, mb)
		local private = self[PRIVATE];
		local frame = private._optionFrame;
		if type(frame) == "string" then
			frame = getglobal(frame);
		end
		
		if type(frame) == "table" and type(frame.IsShown) == "function" then
			mb = string.lower(mb);
			local b;
			for _, b in ipairs(private._optionFrameMouseButtons) do
				if b == mb then
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
	-- Derive Texture functions
	-----------------------------------------------------------

	local FUNCTABLE = { "GetBlendMode", "SetBlendMode", "GetTexCoord", "SetTexCoord", "GetTexture", "SetTexture", "GetVertexColor", "SetVertexColor", "IsDesaturated", "SetDesaturated", "SetGradient", "SetGradientAlpha" };
	local func;
	for _, func in ipairs(FUNCTABLE) do
		button[func] = function(self, ...)
			local icon = self[PRIVATE]._iconTexture;
			return icon[func](icon, ...);
		end
	end

	-----------------------------------------------------------
	-- Register our own functions to the button object
	-----------------------------------------------------------

	-- Clears all existing tooltip texts
	button.ClearTooltipLines = function(self)
		self[PRIVATE]._tooltip = nil;
	end

	-- Adds a line of tooltip text
	button.AddTooltipLine = function(self, text, r, g, b, wrap)
		if not self[PRIVATE]._tooltip then
			self[PRIVATE]._tooltip = {};
		end

		if type(text) ~= "string" or text == "" then
			text = " "; -- A blank line
		end
		table.insert(self[PRIVATE]._tooltip, { ["text"] = text, ["r"] = r, ["g"] = g, ["b"] = b, ["wrap"] = wrap } );
	end	

	-- Registers a saved-variables table to where the button angle will be saved	
	button.RegisterDB = function(self, db)
		local private = self[PRIVATE];
		private:UnregisterAllEvents();
		private._registeredDB = db;
		local t = type(db);
		if t == "table" then
			-- Table is valid, update angle immediately
			private:LoadPosition(db);
		elseif t == "string" then
			-- Table is not yet valid, this could be caused by calling MinimapButton:RegisterDB before "ADDON_LOADED" event fires,
			-- so we leave it alone and check later. This allows the programmer to call MinimapButton:RegisterDB in "OnLoad" function
			-- of their addons.
			private:RegisterEvent("PLAYER_ENTERING_WORLD");
		else
			private._registeredDB = nil;
		end
	end

	-- Associates an option frame which will be opened/closed when the user clicks on the button
	button.SetOptionFrame = function(self, frame, ...)
		local private = self[PRIVATE];
		private._optionFrame = frame;
		private._optionFrameMouseButtons = {};
		local count = select("#", ...);
		local i;
		for i = 1, count do
			local b = select(i, ...);
			if type(b) == "string" then
				table.insert(private._optionFrameMouseButtons, string.lower(b));
			end
		end

		if table.getn(private._optionFrameMouseButtons) == 0 then
			private._optionFrameMouseButtons = { "leftbutton", "rightbutton" };
		end
	end

	-- Retrieves the associated option frame
	button.GetOptionFrame = function(self)
		return self[PRIVATE]._optionFrame;
	end
	
	-- Rotates the button icon by angle degrees
	button.Rotate = function(self, angle)
		local private = self[PRIVATE];
		if type(angle) ~= "number" then
			angle = 0;
		end

		angle = math.floor(angle) % 360;
		if angle < 0 then
			angle = angle + 360;
		end

		if angle == self:GetRotated() then
			return angle;
		end

		private._rotated = angle;

		if angle == 0 then
			self:SetTexCoord(0, 1, 0, 1);
		else
			local LRx, LRy = 0.5 + math.cos(math.rad(angle + 45)) / SQRT2, 0.5 + math.sin(math.rad(angle + 45)) / SQRT2;
			local LLx, LLy = 0.5 + math.cos(math.rad(angle + 135)) / SQRT2, 0.5 + math.sin(math.rad(angle + 135)) / SQRT2;
			local ULx, ULy = 0.5 + math.cos(math.rad(angle + 225)) / SQRT2, 0.5 + math.sin(math.rad(angle + 225)) / SQRT2;
			local URx, URy = 0.5 + math.cos(math.rad(angle - 45)) / SQRT2, 0.5 + math.sin(math.rad(angle - 45)) / SQRT2;	
			self:SetTexCoord(ULx, ULy, LLx, LLy, URx, URy, LRx, LRy);
		end
		return angle;
	end

	-- Retrieves rotated angle degrees of the button icon, 0 if not rotated at all
	button.GetRotated = function(self) return self[PRIVATE]._rotated or 0; end	

	-- Retrieves button texture size
	button.GetIconSize = function(self)
		return self[PRIVATE]._iconTexture:GetWidth();
	end

	-- Sets button texture size
	button.SetIconSize = function(self, size)
		local icon = self[PRIVATE]._iconTexture;
		if type(size) ~= "number" then
			size = 20;
		end
		size = math.max(16, math.min(size, 64));
		icon:SetWidth(size);
		icon:SetHeight(size)
		return size;
	end	

	-- Sets button orbit
	button.SetOrbit = function(self, square, radius)
		self[PRIVATE]._square = square;
		if type(radius) ~= "number" then
			radius = Minimap:GetWidth() / 2 + 9;
		end
		self[PRIVATE]._radius = math.max(0, math.min(radius, 200));
		self:SetAngle(self:GetAngle()); -- refresh position
	end

	-- Retrieves button orbit
	button.GetOrbit = function(self) 
		return self[PRIVATE]._square, self[PRIVATE]._radius or 80;
	end

	-- Retrieves button angle
	button.GetAngle = function(self, cursor)
		return self[PRIVATE]:_CalcAngle(cursor);
	end
	
	-- Sets button angle
	button.SetAngle = function(self, angle)
		if type(angle) ~= "number" then
			angle = math.random(150, 300);
		end

		--angle = math.floor(angle) % 360;
		local r = math.rad(angle);
		local x, y, q = math.cos(r), math.sin(r), 1;
		if x < 0 then q = q + 1 end
		if y > 0 then q = q + 2 end

		local square, radius = self:GetOrbit();
		local minimapShape = GetMinimapShape and GetMinimapShape();
		local quadTable = MINIMAPSHAPES[tostring(minimapShape)];
		if not quadTable then
			quadTable = MINIMAPSHAPES[square and "SQUARE" or "ROUND"];
		end

		if quadTable[q] then
			x, y = x * radius, y * radius;
		else
			local diagRadius = math.sqrt(2 * radius ^ 2) - 10;
			x = math.max(-radius, math.min(x * diagRadius, radius));
			y = math.max(-radius, math.min(y * diagRadius, radius));
		end

		-- apply new position
		self:ClearAllPoints();
		self:SetPoint("CENTER", Minimap, "CENTER", x, y);
		return angle;
	end
	
	-- Static function, retrieves library version
	button.GetVersion = function() 
		return MAJOR_VERSION, MINOR_VERSION;
	end	

	button.IsFlashing = function(self)
		local private = self[PRIVATE];
		return private._flash, private._showDuration, private._hideDuration, private._repeat, (private._flashRepeated or 0);
	end

	-- Start flashing
	button.StartFlash = function(self, showDuration, hideDuration, repeatTimes)
		if type(showDuration) == "number" and showDuration > 0 and type(hideDuration) == "number" and hideDuration > 0 then
			local private = self[PRIVATE];
			private._flash = nil;
			private._showDuration = showDuration;
			private._hideDuration = hideDuration;
			private._repeat = tonumber(repeatTimes);			
			private._flashRepeated = 0;
			private._shown = nil;
			private._stopping = nil;
			private._flash = true;
			return true;
		end
		return nil;
	end

	-- Stop flashing
	button.StopFlash = function(self)
		local private = self[PRIVATE];
		private._stopping = true;
		private._flash = nil;
		private._iconTexture:Show();
	end

	button.Attach = function(self)
		self[PRIVATE]._detached = nil;
		self:SetAngle(self:GetAngle());
	end

	button.Detach = function(self)
		self[PRIVATE]._detached = 1;		
	end	

	button.IsDetached = function(self)
		return self[PRIVATE]._detached;
	end

	-- Initializes button position and texture	
	button:SetTexture(iconPath);
	button:SetIconSize(iconSize);
	button:SetAngle(); -- Sets a random angle upon creation

	-----------------------------------------------------------
	-- Deprecated methods, you shall never call them anymore
	-----------------------------------------------------------

	-- Deprecated, only for downward compatibility to old versions.
	button.SetTooltipText = function(self, text, anchor, r, g, b, wrap)
		self:ClearTooltipLines();
		self:AddTooltipLine(text, r, g, b, wrap);
	end

	-- Deprecated, only for downward compatibility to old versions.
	button.GetTooltipText = function(self)
		local tooltip = self[PRIVATE]._tooltip;
		if tooltip then
			return tooltip[1].text, tooltip[1].r, tooltip[1].g, tooltip[1].b, tooltip[1].wrap; 
		else
			return nil;
		end
	end	
	
	-- Deprecated, only for downward compatibility to old versions.
	button.SetGreyscale = function(self, ...)
		return self:SetDesaturated(...);
	end

	-- Deprecated, only for downward compatibility to old versions.
	button.IsGreyscale = function(self)
		return self:IsDesaturated();
	end

	-- Deprecated, only for downward compatibility to old versions.
	button.GetIconPath = function(self)
		return self:GetTexture();
	end

	-- Deprecated, only for downward compatibility to old versions.
	button.SetIconPath = function(self, ...)
		return self:SetTexture(...);
	end	

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